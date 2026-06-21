/*
 * eg3drast.c — C reimplementation of the egseg1.asm 2D rasterizer + model
 * display-list decoder for the NO_ASM / noasm-egame build. See eg3drast.h.
 *
 * Scope of this TU: everything the tac-map terrain (left MFD) and the wireframe
 * overlay need to turn a model display list into pixels —
 *   - model-stream LOD walk        (advanceModelPointerLod / skipDisplayListByLod)
 *   - edge projection + near clip   (projectModelEdgesFar / clipEdgeNearPlane)
 *   - display-list decode           (drawModelDisplayList / renderPrimitiveList /
 *                                    renderPrimitiveCommand / drawPrimitiveEdges /
 *                                    testVisibilityMask / decodeRleEdgeRow)
 *   - per-scanline span fill        (resetScanlineSpans / clampScanlineSpan /
 *                                    rasterizeEdgeSpan / flushSpanDirtyRect)
 *   - filled polygon outline        (drawPolygonOutline / clipAndRasterizeEdge)
 *   - Cohen-Sutherland edge clip    (clipLineSegment + helpers)
 *   - sorted-object dispatch        (renderSortedListFar / renderSortedList)
 *
 * Compiled into its own far code segment (/NT EG3D_TEXT) and so MUST NOT pull a
 * C `long` runtime helper (__aNldiv/__aNlmul/__aNlshr/...) — those live in _TEXT
 * and a near call to them from this segment is a link fixup overflow. So: 32-bit
 * math is done with inline add/sub and shift-by-1 only, and the perspective
 * divides go through the manual sdiv32by16/udiv32by16 helpers below (no CRT
 * memcpy/abs either — those would also be near-called out of segment).
 */
#include "egtypes.h"
#include "egcode.h"
#include "egdata.h"
#include "eg3drast.h"
#include "eg3dvp.h"
#include "struct.h"
#include "slot.h"
#include "inttype.h"
#include "pointers.h"

/* ---- scratch globals defined in egdata.c but not declared in a header ---- */
extern int16 g_dirtyRectMinY, g_dirtyRectMaxY;
extern int16 g_rasterDeltaX, g_rasterDeltaY;
extern uint8 g_rasterClipFlags;
extern int16 g_clipDivisorX, g_clipDivisorY, g_clipMidpointX, g_clipMidpointY;
extern int16 g_clipP1xLo, g_clipP1xHi, g_clipP1yLo, g_clipP1yHi;
extern int16 g_clipP2xLo, g_clipP2xHi, g_clipP2yLo, g_clipP2yHi;
extern int16 g_clipMidxLo, g_clipMidxHi, g_clipMidyLo, g_clipMidyHi;
extern uint8 g_clipOutcode1, g_clipOutcode2, g_clipNeedsSubdiv;
extern int16 g_clipSavedxLo, g_clipSavedxHi, g_clipSavedyLo, g_clipSavedyHi;
extern int16 g_clipSaved2xLo, g_clipSaved2xHi, g_clipSaved2yLo, g_clipSaved2yHi;
extern int16 g_rleRowBase;
/* horizon (drawFlatHorizon/renderHorizonSky) scratch + rotation-matrix yaw terms,
 * all defined in egdata.c. g_horizonGroundColor is in egdata.h. */
extern int16 g_horizonNegPitch, g_horizonSideFlag, g_horizonEdgeX;
extern uint8 g_horizonSkyColor;
extern int16 g_rotSinYaw, g_rotCosYaw;
extern int16 g_primCoordPtr, g_primCountPtr, g_primDataBase;
extern uint8 g_primRunCount, g_faceVtxCount, g_vtxSlotPhase, g_unusedClipFlag, g_edgeRunCount;
extern int16 g_savedPrimVtxScale;
extern int16 g_savedDivZeroVecOff, g_savedDivZeroVecSeg;

/* ---- this TU's own scratch ---- */
struct SpanBuffers g_spanBuf;            /* g_spanMinX / g_spanMaxX (contiguous) */
static uint8  byte_36BAE[0x100];         /* RLE edge work buffer */

/* The 16-entry vertex bitmask table (egslots g_vtxScale+3, indexed by vtx*2): a
 * primitive's vertex group -> the 1<<n sign-mask bit tested against
 * g_vtxSignMaskLo/Hi. */
static const uint16 g_vtxBitMask[16] = {
    0x0001, 0x0002, 0x0004, 0x0008, 0x0010, 0x0020, 0x0040, 0x0080,
    0x0100, 0x0200, 0x0400, 0x0800, 0x1000, 0x2000, 0x4000, 0x8000
};

/* Model display-list edge record laid over flt15_buf2 (stride 0x1a). */
struct EdgeRec {
    int16 x1, x1h, y1, y1h;   /* +00 P1 (32-bit lo/hi pre-clip, 16-bit post-clip) */
    int16 x2, x2h, y2, y2h;   /* +08 P2 */
    int16 cv[4];              /* +10 near-clip replacement coords */
    uint8 flags;              /* +18 0x80 reject / 0x40 cv / 0x20 P1-edge / 0x10 P2-edge */
    uint8 pad;                /* +19 */
};
/* flt15_buf2 holds floor(0x1040 / 0x1a) = 160 edge records. A valid model's
 * vertex/edge index stays well under that, but the not-yet-correct flight
 * projection can feed a garbage byte index (0-255) → up to ~2.4KB past the
 * buffer, clobbering DGROUP (the whole-dashboard "data band" corruption). The
 * original asm relied on its INT 0 trap + clip to keep indices sane; per the
 * plan's "explicit C guards" rule, route an out-of-range index to a trash
 * record so a bad index can corrupt only the sink, never live data. */
#define EREC_COUNT (0x1040 / 0x1a)
static struct EdgeRec g_erecTrash;
static struct EdgeRec *erec(int i)
{
    if ((unsigned)i >= (unsigned)EREC_COUNT)
        return &g_erecTrash;
    return (struct EdgeRec *)(flt15_buf2 + i * 0x1a);
}
#define EREC(i) erec(i)

/* g_clipVtxA0..A3 / g_clipVtxB0..B3 — clipLineSegment treats this as a 0x1a
 * edge record (P1 = A0..A3, P2 = B0..B3, flags at +0x18). */
static struct EdgeRec g_clipVtx;

/* ===================================================================== */
/* Manual 32/16 divides (no long runtime helper; shift-by-1 / mask only).*/
/* Saturate to +/-0x7f00 on overflow, matching the egseg1 INT0 stubs.    */
/* ===================================================================== */
static unsigned udiv32by16(unsigned long num, unsigned den)
{
    unsigned long rem = 0;
    unsigned long q = 0;
    int i;
    if (den == 0) return 0x7f00;
    for (i = 0; i < 32; i++) {
        rem = rem << 1;
        if (num & 0x80000000UL) rem |= 1;
        num = num << 1;
        q = q << 1;
        if (rem >= (unsigned long)den) { rem -= den; q |= 1; }
    }
    if (q > 0x7fffUL) q = 0x7f00;
    return (unsigned)q;
}

static int sdiv32by16(long num, int den)
{
    int neg = 0;
    long n = num;
    int d = den;
    unsigned q;
    if (n < 0) { neg ^= 1; n = -n; }
    if (d < 0) { neg ^= 1; d = -d; }
    q = udiv32by16((unsigned long)n, (unsigned)d);
    return neg ? -(int)q : (int)q;
}

/* Combine an egseg1 lo/hi int16 pair into a signed 32-bit value. */
#define JOIN32(lo, hi) (((long)(int16)(hi) << 16) | (unsigned)(uint16)(lo))
/* High word of a 32-bit lvalue, read directly (avoids a `>>16` long helper). */
#define HI16(lv) (((int16 *)&(lv))[1])
/* The carry the egseg1 horizon math folds into the high word when it doubles
 * only the low word (`SHL AX,1; ADC DX,..`): bit 15 of the 32-bit value's low
 * word. Combined with HI16(p<<1) this reproduces fixedMulQ14's Q15 rounding. */
#define LOCARRY(v) ((((uint16)(v)) & 0x8000u) ? 1 : 0)

/* signed 16x16 -> 32 multiply, shift-add (no __aNlmul). */
static long imul16(int a, int b)
{
    unsigned long aa, p = 0;
    unsigned ub;
    int neg = 0, i;
    if (a < 0) { neg ^= 1; a = -a; }
    if (b < 0) { neg ^= 1; b = -b; }
    aa = (unsigned)a;
    ub = (unsigned)b;
    for (i = 0; i < 16; i++) {
        if (ub & 1) p += aa;
        ub >>= 1;
        aa = aa << 1;
    }
    return neg ? -(long)p : (long)p;
}

/* arithmetic right shift of a long by n (only >>1 is inline in MSC 5.1). */
static long lshr_s(long v, int n)
{
    while (n-- > 0) v >>= 1;
    return v;
}

/* ===================================================================== */
/* seg000 lookupSine/lookupCosine — far-segment-local sin/cos. Identical */
/* to eg3dmath.c's sine()/cosine() (g_angleLut + linear interpolation),  */
/* re-stated here because that TU lives in _TEXT and a near call to it   */
/* from EG3D_TEXT would be a link fixup overflow. Uses imul16/lshr_s so no  */
/* long runtime helper is pulled.                                        */
/* ===================================================================== */
static int hsine(int angle)
{
    unsigned a = (unsigned)angle;
    int idx = (int)((a >> 8) & 0xff);
    int frac = (int)(a & 0xff);
    int v0 = g_angleLut[idx];
    int v1 = g_angleLut[idx + 1];
    long step = imul16(v1 - v0, frac);
    return v0 + (int)lshr_s(step + 0x80, 8);
}
static int hcosine(int angle) { return hsine(angle + 0x4000); }

/* HI16 of a doubled Q15 product — the egseg1 `IMUL x; SHL AX,1; RCL DX,1; ..DX`
 * idiom that takes the high word of (a*b)<<1. */
static int q15hi(int a, int b) { long p = imul16(a, b); p <<= 1; return HI16(p); }

/* HI16 of the sum/difference of two doubled Q15 products (the matrix-builder's
 * `ADD/ADC` or `SUB/SBB` accumulate-then-take-high-word sequences). */
static int q15sum(int a, int b, int c, int d, int sub)
{
    long t, u, r;
    t = imul16(a, b); t <<= 1;
    u = imul16(c, d); u <<= 1;
    r = sub ? (t - u) : (t + u);
    return HI16(r);
}

/* ===================================================================== */
/* seg001 0x135F — buildRotationMatrix: lookup sin/cos of the three Euler */
/* angles into the sphere terms (also consumed by the horizon renderer)   */
/* and compose the 3x3 view rotation matrix at *m. Mirrors the egseg1 ASM */
/* (angleX=yaw, angleY=pitch ring, angleZ=roll); each matrix entry is the */
/* high word of a doubled Q15 product or product-sum.                     */
/* ===================================================================== */
static void buildRotationMatrix(int16 *m, int angleX, int angleY, int angleZ)
{
    int R, P, Ro, D, SY, CY, mSI, mBP;
    g_rotSinYaw    = (int16)hsine(angleX);
    g_rotCosYaw    = (int16)hcosine(angleX);
    g_spherePitch  = (int16)hsine(angleZ);
    g_sphereRoll   = (int16)hcosine(angleZ);
    g_sphereRadius = (int16)hsine(angleY);
    g_sphereDistZ  = (int16)hcosine(angleY);
    R = g_sphereRadius; P = g_spherePitch; Ro = g_sphereRoll; D = g_sphereDistZ;
    SY = g_rotSinYaw;   CY = g_rotCosYaw;
    mSI = q15hi(R, P);
    mBP = q15hi(R, Ro);
    m[0] = (int16)q15sum(mSI, SY, CY, Ro, 0);
    m[1] = (int16)q15sum(mBP, SY, CY, P, 1);
    m[2] = (int16)q15hi(SY, D);
    m[3] = (int16)q15hi(P, D);
    m[4] = (int16)q15hi(Ro, D);
    m[5] = (int16)(-R);
    m[6] = (int16)q15sum(mSI, CY, SY, Ro, 1);
    m[7] = (int16)q15sum(mBP, CY, SY, P, 0);
    m[8] = (int16)q15hi(CY, D);
}

int far buildRotationMatrixFar(int16 *matrix, int angleX, int angleY, int angleZ)
{
    buildRotationMatrix(matrix, angleX, angleY, angleZ);
    return 0;
}

/* ===================================================================== */
/* seg001 0x0A09 — skip the model display list down to the active LOD.   */
/* ===================================================================== */
static void skipDisplayListByLod(unsigned char far **pp)
{
    unsigned char far *p = *pp;
    int al;
    while ((al = p[0]) & 0x80) {
        int bx = (al & 7) << 1;
        int dist = (int)((int16)g_objDistance >> (int)g_extraScaleShift);
        if (dist <= *(int16 *)(colorLut + 0x10 + bx)) {
            p += 3;
        } else {
            p += *(int16 far *)(p + 1);
        }
    }
    *pp = p;
}

/* seg001 0x0CFB — advance g_modelStreamPtr to the LOD-selected display list. */
int far advanceModelPointerLod(void)
{
    unsigned char far *p = (unsigned char far *)g_modelStreamPtr;
    skipDisplayListByLod(&p);
    g_modelStreamPtr = (char far *)p;
    return 0;
}

/* seg001 0x0A36 — storeObjTransformByOpcode: g_objTransform[opcode] = spinAngle */
void storeObjTransformByOpcode(void)
{
    unsigned char far *p = (unsigned char far *)g_modelStreamPtr;
    int idx = (*p) & 3;
    g_objTransform[idx] = g_spinAngle;
}

/* ===================================================================== */
/* seg001 0x1BA2 — testVisibilityMask: read 1 (or 2) mask words from the */
/* stream, AND against the vertex sign masks. Returns 0 => not visible.  */
/* ===================================================================== */
static int testVisibilityMask(unsigned char far **pp)
{
    unsigned char far *p = *pp;
    int lo = *(int16 far *)p;
    int r;
    p += 2;
    if (g_modelWideVtxFlag == 0) {
        r = lo & g_vtxSignMaskLo;
    } else {
        int hi = *(int16 far *)p;
        p += 2;
        r = (lo & g_vtxSignMaskLo) | (hi & g_vtxSignMaskHi);
    }
    *pp = p;
    return r;
}

/* ===================================================================== */
/* seg001 0x0078 — projectVertexToScreen: perspective divide of the      */
/* per-vertex camera-space coords (word_342BC.. / word_344A0..) by the   */
/* depth (vproj.in[].div) into the screen-space var_279/var_282 arrays.  */
/* Flight-path only (the tac map writes vproj directly and never calls it).*/
/* ===================================================================== */
static void projectVertexToScreen(int vtx)   /* BX = vtx*4 in the asm */
{
    long camX, camY;
    int cx = vtxScratch.vproj.in[vtx].div;
    if (g_halfScaleRender) cx <<= 1;
    if (g_extraScaleShift) cx = (int)((int16)cx >> (int)g_extraScaleShift);
    if (cx <= 0) {
        vtxScratch.vproj.x.v[vtx] = 0x8000L | (0x8000L << 16);
        vtxScratch.vproj.y.v[vtx] = 0x8000L | (0x8000L << 16);
        return;
    }
    /* word_342BC:word_342BE form the 32-bit camera X for this vertex; the asm
     * reads it from byte offset +1 (i.e. >>8) before the IDIV. */
    camX = *(long *)((char *)&vtxScratch + 0x3c + vtx * 4);
    {
        int q = sdiv32by16(lshr_s(camX, 8), cx);
        vtxScratch.vproj.x.v[vtx] = (long)(q + g_viewCenterX);
    }
    /* camera Y: (camY>>8) scaled by 3/4 (the (v>>2 - v) aspect term) then /depth */
    camY = *(long *)((char *)&vtxScratch + 0x220 + vtx * 4);
    {
        long n = lshr_s(camY, 8);
        long scaled = lshr_s(n, 2) - n;          /* = -(n*3/4) */
        int q = sdiv32by16(scaled, cx);
        vtxScratch.vproj.y.v[vtx] = (long)(q + g_viewCenterY);
    }
}

/* ===================================================================== */
/* seg001 0x1282 — clipEdgeNearPlane: intersect an edge with the near    */
/* plane (front vertex depth>=1, behind vertex depth<1) and write the    */
/* clipped P1 + cv into the edge record. Flight-path only.               */
/* ===================================================================== */
static void clipEdgeNearPlane(struct EdgeRec *rec, int behind, int front)
{
    int cx;
    long t;
    long fc, bc, delta, prod;
    /* t = ((frontDiv-1)<<16 | frontNum) / (frontDiv - behindDiv), then >>1 */
    {
        unsigned div = (unsigned)(vtxScratch.vproj.in[front].div
                                  - vtxScratch.vproj.in[behind].div);
        unsigned long num = ((unsigned long)(vtxScratch.vproj.in[front].div - 1) << 16)
                            | (uint16)vtxScratch.vproj.in[front].num;
        cx = (int)(udiv32by16(num, div) >> 1);
    }
    /* X = word_342BC..  (offset 0x3c), Y = word_344A0.. (offset 0x220) */
    fc = *(long *)((char *)&vtxScratch + 0x3c + front * 4);
    bc = *(long *)((char *)&vtxScratch + 0x3c + behind * 4);
    delta = fc - bc;
    prod = imul16(HI16(delta), cx) << 1;
    t = fc - prod;
    *(long *)((char *)&vtxScratch + 0x21c) = t;          /* word_3449C */
    fc = *(long *)((char *)&vtxScratch + 0x220 + front * 4);
    bc = *(long *)((char *)&vtxScratch + 0x220 + behind * 4);
    delta = fc - bc;
    prod = imul16(HI16(delta), cx) << 1;
    t = fc - prod;
    *(long *)((char *)&vtxScratch + 0x400) = t;          /* word_34680 */
    vtxScratch.vproj.in[120].num = 0;                    /* word_34864 */
    vtxScratch.vproj.in[120].div = 1;                    /* word_34866 */
    projectVertexToScreen(120);                          /* BX = 0x1E0 */
    rec->x1 = (int16)vtxScratch.vproj.x.v[120];
    rec->x1h = HI16(vtxScratch.vproj.x.v[120]);
    rec->cv[0] = rec->x1;
    rec->cv[1] = rec->x1h;
    rec->y1 = (int16)vtxScratch.vproj.y.v[120];
    rec->y1h = HI16(vtxScratch.vproj.y.v[120]);
    rec->cv[2] = rec->y1;
    rec->cv[3] = rec->y1h;
    rec->flags |= 0x40;
}

/* ===================================================================== */
/* Cohen-Sutherland edge clip to [0,clipMaxX] x [0,clipMaxY], 32-bit fixed */
/* coords with recursive midpoint subdivision. seg001 0x015D..0x05BB.      */
/* The working endpoint is carried as (wx,wy) longs; the partner endpoint  */
/* and midpoint targets live in the g_clip* globals, matching the asm.     */
/* ===================================================================== */

/* seg001 0x0383 — outcode of (wx,wy): bit3 left, bit0 right, bit2 below,  */
/* bit1 above (relative to the clip rect). Returns combined outcode.       */
static int clipComputeOutcode(long wx, long wy)
{
    int al = 0x0c;
    if (!(wx < 0)) { al ^= 9; if (!(wx > g_clipMaxX)) al ^= 1; }
    if (!(wy < 0)) { al ^= 6; if (!(wy > g_clipMaxY)) al ^= 2; }
    return al & 0xff;
}

/* seg001 0x052D — computeClipOutcode (16-bit variant used in subdivide). */
static int computeClipOutcode(int bx, int si)
{
    int al = 0x0c;
    if (!(bx < 0)) { al ^= 9; if (!(bx > g_clipMaxX)) al ^= 1; }
    if (!(si < 0)) { al ^= 6; if (!(si > g_clipMaxY)) al ^= 2; }
    return al & 0xff;
}

/* seg001 0x0334 — clipPointInside: is the 32-bit point a usable boundary point?
 * x = (xhi:xlo), y = (yhi:ylo). */
static int clipPointInside(int xlo, int xhi, int ylo, int yhi)
{
    if (xhi == 0 && (xlo == 0 || xlo == g_clipMaxX)) {     /* loc_0355 */
        if (yhi != 0) return 0;
        if ((uint16)ylo > (uint16)g_clipMaxY) return 0;
        return 1;
    }
    if (yhi == 0 && (ylo == 0 || ylo == g_clipMaxY)) {     /* loc_036C */
        if (xhi != 0) return 0;
        if ((uint16)xlo > (uint16)g_clipMaxX) return 0;
        return 1;
    }
    return 0;
}

/* seg001 0x04F2 — pointOnClipEdge (16-bit). */
static int pointOnClipEdge(int bx, int si)
{
    if (bx == 0 || bx == g_clipMaxX) {
        if (si < 0 || si > g_clipMaxY) return 0;
        return 1;
    }
    if (si == 0 || si == g_clipMaxY) {
        if (bx < 0 || bx > g_clipMaxX) return 0;
        return 1;
    }
    return 0;
}

/* seg001 0x03BA — clampToClipEdge: clamp (wx,wy) to the boundary selected   */
/* by outcode `al`; returns clamped X, *outY = clamped Y; ORs g_clipNeedsSubdiv*/
/* when the source coords are large (need recursive subdivision).            */
static int clampToClipEdge(int al, long wx, long wy, int *outY)
{
    int needsSub = 1;
    /* CX:BX = wx (hi:lo), DX:SI = wy. The asm checks the hi words to decide if
     * the coordinate fits in the +/-1 range a direct clamp can handle. */
    int xhi = HI16(wx), xlo = (int)wx;
    int yhi = HI16(wy), ylo = (int)wy;
    if ((unsigned)(xhi + 1) <= 1) {
        int t = (xhi >> 1) ^ xlo;
        if ((t & 0xc000) == 0) {
            if ((unsigned)(yhi + 1) <= 1) {
                int u = (yhi >> 1) ^ ylo;
                if ((u & 0xc000) == 0) needsSub = 0;
            }
        }
    }
    g_clipNeedsSubdiv |= (uint8)needsSub;
    {
        int bp = ylo;
        if (al & 4) bp = 0;
        if (al & 2) bp = g_clipMaxY;
        *outY = bp;
    }
    if (al & 8) return 0;
    if (al & 1) return g_clipMaxX;
    return xlo;
}

/* forward decls for the mutually-recursive subdivide helpers */
static int clipMidpointSubdivide(int *bx, int *cx, int *si, int *dx);
static int clipLineMidpoint(int *bx, int *cx, int *si, int *dx);

/* seg001 0x040E — clipMidpointSubdivide: walk from (bx,si) toward the saved */
/* midpoint target, halving, until a usable interior point is found.         */
/* Returns the final point via bxp/cxp/sip/dxp. Result of clipPointInside in   */
/* the asm is the AL flag; here clipMidpointSubdivide returns it.            */
static int clipMidpointSubdivide(int *bxp, int *cxp, int *sip, int *dxp)
{
    int bx = *bxp, cx = *cxp, si = *sip, dx = *dxp;
    int bp;
    int al;
    if (g_clipNeedsSubdiv == 0) {
        /* loc_058A: bisection toward midpoint using pointOnClipEdge */
        int mcx = g_clipMidxLo, mdx = g_clipMidyLo;
        int di, esv;
        bp = 0x10;
        for (;;) {
            di = bx; esv = si;
            for (;;) {
                bx = (int16)(bx + mcx) >> 1;
                si = (int16)(si + mdx) >> 1;
                if (pointOnClipEdge(bx, si)) { *bxp = bx; *cxp = cx; *sip = si; *dxp = dx; return 0; }
                if (--bp == 0) { *bxp = mcx; *sip = mdx; *cxp = cx; *dxp = dx; return 0; }
                al = computeClipOutcode(bx, si);
                if (al != 0) break;          /* avg outside: JNZ loc_0596, re-save & continue */
                mcx = bx; mdx = si; bx = di; si = esv;  /* avg inside: target=avg, restore */
            }
        }
    }
    bp = 0x20;
    for (;;) {
        g_clipSavedxLo = bx; g_clipSavedxHi = cx; g_clipSavedyLo = si; g_clipSavedyHi = dx;
        for (;;) {
            long nx = JOIN32(bx, cx) + JOIN32(g_clipMidxLo, g_clipMidxHi);
            long ny = JOIN32(si, dx) + JOIN32(g_clipMidyLo, g_clipMidyHi);
            nx >>= 1; ny >>= 1;
            bx = (int)nx; cx = HI16(nx); si = (int)ny; dx = HI16(ny);
            al = clipPointInside(bx, cx, si, dx);
            if (al) { *bxp = bx; *cxp = cx; *sip = si; *dxp = dx; return al; }
            if (--bp == 0) {
                *bxp = g_clipMidxLo; *cxp = g_clipMidxHi; *sip = g_clipMidyLo; *dxp = g_clipMidyHi;
                return 0;
            }
            al = clipComputeOutcode(JOIN32(bx, cx), JOIN32(si, dx));
            if (al != 0) break;             /* JNZ loc_041B: re-save and continue */
            g_clipMidxLo = bx; g_clipMidxHi = cx; g_clipMidyLo = si; g_clipMidyHi = dx;
            bx = g_clipSavedxLo; cx = g_clipSavedxHi; si = g_clipSavedyLo; dx = g_clipSavedyHi;
        }
    }
}

/* seg001 0x0484 — clipLineMidpoint: like the above but bisects against both */
/* endpoints' outcodes (g_clipOutcode1/2). Returns AL (0 => settled inside). */
static int clipLineMidpoint(int *bxp, int *cxp, int *sip, int *dxp)
{
    int bx = *bxp, cx = *cxp, si = *sip, dx = *dxp;
    int bp, al;
    if (g_clipNeedsSubdiv == 0) {
        /* loc_0550: bisection with computeClipOutcode against outcode1/2 */
        int mcx = g_clipMidxLo, mdx = g_clipMidyLo;
        int di, esv;
        bp = 0x10;
        for (;;) {
            di = bx; esv = si;
            for (;;) {
                bx = (int16)(bx + mcx) >> 1;
                si = (int16)(si + mdx) >> 1;
                al = computeClipOutcode(bx, si);
                if (al == 0) { *bxp = bx; *cxp = cx; *sip = si; *dxp = dx; return 0; }
                if (--bp == 0) { *bxp = bx; *cxp = cx; *sip = si; *dxp = dx; return al; }
                if ((g_clipOutcode1 & al) == 0) break;     /* restart outer */
                if ((g_clipOutcode2 & al) != 0) { *bxp = bx; *cxp = cx; *sip = si; *dxp = dx; return al; }
                mcx = bx; mdx = si; bx = di; si = esv;
            }
        }
    }
    bp = 0x20;
    for (;;) {
        g_clipSavedxLo = bx; g_clipSavedxHi = cx; g_clipSavedyLo = si; g_clipSavedyHi = dx;
        for (;;) {
            long nx = JOIN32(bx, cx) + JOIN32(g_clipMidxLo, g_clipMidxHi);
            long ny = JOIN32(si, dx) + JOIN32(g_clipMidyLo, g_clipMidyHi);
            nx >>= 1; ny >>= 1;
            bx = (int)nx; cx = HI16(nx); si = (int)ny; dx = HI16(ny);
            al = clipComputeOutcode(JOIN32(bx, cx), JOIN32(si, dx));
            if (al == 0) { *bxp = bx; *cxp = cx; *sip = si; *dxp = dx; return 0; }
            if (--bp == 0) { *bxp = bx; *cxp = cx; *sip = si; *dxp = dx; return al; }
            if ((g_clipOutcode1 & al) == 0) break;
            if ((g_clipOutcode2 & al) != 0) { *bxp = bx; *cxp = cx; *sip = si; *dxp = dx; return al; }
            g_clipMidxLo = bx; g_clipMidxHi = cx; g_clipMidyLo = si; g_clipMidyHi = dx;
            bx = g_clipSavedxLo; cx = g_clipSavedxHi; si = g_clipSavedyLo; dx = g_clipSavedyHi;
        }
    }
}

/* seg001 0x029D — writeClippedStart: emit the clipped P1 into the record. */
static void writeClippedStart(struct EdgeRec *rec, int bx, int cx, int si, int dx)
{
    int rx, rcx, rsi, rdx;
    g_clipMidxLo = bx; g_clipMidxHi = cx; g_clipMidyLo = si; g_clipMidyHi = dx;
    rx = g_clipP1xLo; rcx = g_clipP1xHi; rsi = g_clipP1yLo; rdx = g_clipP1yHi;
    clipMidpointSubdivide(&rx, &rcx, &rsi, &rdx);
    rec->x1 = (int16)rx;
    rec->y1 = (int16)rsi;
    if (rec->y1 != rec->y1h) rec->flags |= 0x20;
}

/* seg001 0x02D2 — writeClippedEnd: emit the clipped P2 into the record. */
static void writeClippedEnd(struct EdgeRec *rec, int bx, int cx, int si, int dx)
{
    int rx, rcx, rsi, rdx;
    g_clipMidxLo = bx; g_clipMidxHi = cx; g_clipMidyLo = si; g_clipMidyHi = dx;
    rx = g_clipP2xLo; rcx = g_clipP2xHi; rsi = g_clipP2yLo; rdx = g_clipP2yHi;
    clipMidpointSubdivide(&rx, &rcx, &rsi, &rdx);
    rec->x2 = (int16)rx;
    rec->y2 = (int16)rsi;
    if (rec->y2 != rec->y2h) rec->flags |= 0x10;
}

/* seg001 0x0308 — rejectClippedLine: both endpoints share an outside half- */
/* plane, or a degenerate edge -> mark reject / boundary as the asm does.    */
static void rejectClippedLine(struct EdgeRec *rec, int al)
{
    int cl = rec->flags | 0x80;
    rec->y1 = rec->y2h;                /* [DI+4] = [DI+0E] */
    if (al & 9) {
        int dx = 0;
        if (!(al & 8)) dx = g_clipMaxX;
        rec->x1 = (int16)dx;
        if (rec->y1 != rec->y1h) cl |= 0x20;
    }
    rec->flags = (uint8)cl;
}

/* seg001 0x023F — clipLineSubdivP1Outside */
static void clipLineSubdivP1Outside(struct EdgeRec *rec)
{
    int bx = g_clipP2xLo, cx = g_clipP2xHi, si = g_clipP2yLo, dx = g_clipP2yHi;
    int al;
    g_clipMidxLo = g_clipP1xLo; g_clipMidxHi = g_clipP1xHi;
    g_clipMidyLo = g_clipP1yLo; g_clipMidyHi = g_clipP1yHi;
    al = clipLineMidpoint(&bx, &cx, &si, &dx);
    if (al != 0) {
        rec->y1 = rec->y2h;            /* [DI+4] = [DI+0E] */
        rejectClippedLine(rec, al);    /* AL = the outcode clipLineMidpoint returned */
        return;
    }
    g_clipSaved2xLo = bx; g_clipSaved2xHi = cx; g_clipSaved2yLo = si; g_clipSaved2yHi = dx;
    writeClippedStart(rec, bx, cx, si, dx);
    bx = g_clipSaved2xLo; cx = g_clipSaved2xHi; si = g_clipSaved2yLo; dx = g_clipSaved2yHi;
    writeClippedEnd(rec, bx, cx, si, dx);
}

/* seg001 0x015D — clipLineSegment: clip a 32-bit edge record in place. */
static void clipLineSegment(struct EdgeRec *rec)
{
    long x1 = JOIN32(rec->x1, rec->x1h);
    long y1 = JOIN32(rec->y1, rec->y1h);
    long x2 = JOIN32(rec->x2, rec->x2h);
    long y2 = JOIN32(rec->y2, rec->y2h);
    int al;

    /* trivial accept: every endpoint already a small in-range value */
    if ((int16)x1 == x1 && (int16)y1 == y1 && (int16)x2 == x2 && (int16)y2 == y2 &&
        (unsigned)(int16)x1 <= (unsigned)g_clipMaxX &&
        (unsigned)(int16)x2 <= (unsigned)g_clipMaxX &&
        (unsigned)(int16)y1 <= (unsigned)g_clipMaxY &&
        (unsigned)(int16)y2 <= (unsigned)g_clipMaxY) {
        return;
    }

    g_clipNeedsSubdiv = 0;
    g_clipP1xLo = rec->x1; g_clipP1xHi = rec->x1h;
    g_clipP1yLo = rec->y1; g_clipP1yHi = rec->y1h;
    g_clipOutcode1 = (uint8)clipComputeOutcode(x1, y1);
    if (g_clipOutcode1) {
        int oy;
        rec->x1h = (int16)clampToClipEdge(g_clipOutcode1, x1, y1, &oy);
        rec->y1h = (int16)oy;
    }
    g_clipP2xLo = rec->x2; g_clipP2xHi = rec->x2h;
    g_clipP2yLo = rec->y2; g_clipP2yHi = rec->y2h;
    g_clipOutcode2 = (uint8)clipComputeOutcode(x2, y2);
    if (g_clipOutcode2) {
        int oy;
        rec->x2h = (int16)clampToClipEdge(g_clipOutcode2, x2, y2, &oy);
        rec->y2h = (int16)oy;
    }

    al = g_clipOutcode2;
    if (g_clipOutcode1 & g_clipOutcode2) {        /* loc_023B: share an outside region */
        rejectClippedLine(rec, al);
        return;
    }
    if (g_clipOutcode2 == 0) {                    /* loc_0223: P2 inside -> clip P1 toward P2 */
        writeClippedStart(rec, g_clipP2xLo, g_clipP2xHi, g_clipP2yLo, g_clipP2yHi);
        return;
    }
    if (g_clipOutcode1 == 0) {                    /* loc_0227: P1 inside -> clip P2 toward P1 */
        writeClippedEnd(rec, g_clipP1xLo, g_clipP1xHi, g_clipP1yLo, g_clipP1yHi);
        return;
    }
    /* loc_023F: both endpoints outside (non-overlapping regions) */
    clipLineSubdivP1Outside(rec);
}

/* ===================================================================== */
/* Span buffer fill primitives. seg001 0x1EA0 / 0x1ED6 / 0x1F34.          */
/* ===================================================================== */

/* seg001 0x1EA0 — resetScanlineSpansImpl: reset spans for the accumulated  */
/* dirty Y range, then clear the dirty bounds.                             */
static void resetScanlineSpansImpl(void)
{
    int y = g_dirtyRectMinY;
    int yMax, i;
    if (y < 0) return;
    yMax = g_dirtyRectMaxY;
    for (i = y; i <= yMax; i++) {
        g_spanBuf.minX[i] = (int16)0xffff;
        g_spanBuf.maxX[i] = 0;
    }
    g_dirtyRectMinY = (int16)0xffff;
    g_dirtyRectMaxY = 0;
}

int far resetScanlineSpans(void)
{
    resetScanlineSpansImpl();
    return 0;
}

/* Clamp the accumulated spans to the screen before handing them to MGRAPHIC's
 * dirtyRect slot. That slot trusts the buffer and fills (maxX-minX) bytes from
 * each row's start with no bound check; egseg1.asm kept the spans in range via
 * its clip + INT 0 overflow trap. The C port replaces the trap with explicit
 * guards (see rasterizeEdgeSpan's Y guard and decodeRleEdgeRow's stack guards),
 * but an edge that arrives with an out-of-range X — e.g. a model vertex the
 * still-incomplete flight projection failed to clip — would otherwise store a
 * huge maxX and make the fill run clear across the framebuffer (the whole-screen
 * diagonal-stripe corruption + occasional hang). Clamp X to [0, g_clipMaxX] so a
 * bad coordinate can never overflow the page; untouched rows (minX still 0xFFFF)
 * are left for the slot to skip. */
static void clampSpansForFill(void)
{
    int i;
    int yMin = g_dirtyRectMinY;
    int yMax = g_dirtyRectMaxY;
    if (yMin < 0) return;
    /* Clamp the dirty Y range to the viewport bottom. rasterizeEdgeSpan only
     * guards row against the 220-entry buffer size, but spans are viewport-
     * relative and positioned by blitOffset, so a row past g_clipMaxY lands
     * physically below the 3D view — in the static cockpit dashboard, which is
     * never redrawn, so any model edge with a garbage Y (from the incomplete
     * flight projection) permanently smears model spans across the dashboard
     * (the "data band" corruption). egseg1's clip kept rows <= clipMaxY; do the
     * same here. clampScanlineSpan already clamps its boundary fills to it. */
    if (yMin > g_clipMaxY) yMin = g_clipMaxY;
    if (yMax > g_clipMaxY) yMax = g_clipMaxY;
    g_dirtyRectMinY = (int16)yMin;
    g_dirtyRectMaxY = (int16)yMax;
    for (i = yMin; i <= yMax; i++) {
        int16 mn = g_spanBuf.minX[i];
        int16 mx = g_spanBuf.maxX[i];
        if ((uint16)mn == 0xffff) continue;     /* row never touched */
        if (mn < 0) mn = 0; else if (mn > g_clipMaxX) mn = g_clipMaxX;
        if (mx < 0) mx = 0; else if (mx > g_clipMaxX) mx = g_clipMaxX;
        g_spanBuf.minX[i] = mn;
        g_spanBuf.maxX[i] = mx;
    }
}

int far flushSpanDirtyRect(void)
{
    clampSpansForFill();
    gfx_dirtyRect(g_spanBuf.minX,
                  g_dirtyRectMinY, g_dirtyRectMaxY);
    return 0;
}

/* seg001 0x1ED6 — clampScanlineSpan: fill a vertical run of one span buffer  */
/* (min or max, selected by x==0 vs x==clipMaxX) from row dx to row cx with x.*/
static void clampScanlineSpan(int x, int yA, int yB)
{
    int16 *buf;
    int cx = yA;        /* CX = DI (the y passed as DI in the asm) */
    int dx = yB;        /* DX */
    if (x == 0) {
        buf = g_spanBuf.minX;
    } else if (x == g_clipMaxX) {
        buf = g_spanBuf.maxX;
    } else {
        return;
    }
    if (cx < dx) { int t = cx; cx = dx; dx = t; }
    if (dx < 0) dx = 0;
    if (cx > g_clipMaxY) cx = g_clipMaxY;
    if (cx > g_dirtyRectMaxY) g_dirtyRectMaxY = (int16)cx;
    if ((uint16)dx < (uint16)g_dirtyRectMinY) g_dirtyRectMinY = (int16)dx;
    {
        int i;
        for (i = dx; i <= cx; i++) buf[i] = (int16)x;
    }
}

/* seg001 0x1F34 — rasterizeEdgeSpan: walk the edge (g_lineX1,Y1)-(X2,Y2),    */
/* updating per-scanline min/max span extents (Bresenham, 16-bit only).      */
static void rasterizeEdgeSpan(void)
{
    int dxv, dyv, bp;
    int16 *minB = g_spanBuf.minX;
    int16 *maxB = g_spanBuf.maxX;
    if (g_lineX2 < g_lineX1) {
        int t = g_lineX1; g_lineX1 = g_lineX2; g_lineX2 = (int16)t;
        t = g_lineY1; g_lineY1 = g_lineY2; g_lineY2 = (int16)t;
    }
    dxv = g_lineX2 - g_lineX1;
    g_rasterDeltaX = (int16)dxv;
    {
        int mx = g_lineY2;              /* DX = max(y1,y2) after the swap below */
        int mn = g_lineY1;              /* CX = min(y1,y2) */
        int dy = mx - mn;
        bp = 2;
        if (dy < 0) { int t = mn; mn = mx; mx = t; bp = -2; dy = -dy; }
        g_rasterDeltaY = (int16)dy;
        dyv = dy;
        if (mx > g_dirtyRectMaxY) g_dirtyRectMaxY = (int16)mx;
        if ((uint16)mn < (uint16)g_dirtyRectMinY) g_dirtyRectMinY = (int16)mn;
    }
    {
        int row = g_lineY1;            /* DI = y1*2 in the asm; here row index */
        int rstep = bp >> 1;           /* +1 / -1 row */
        int ax = g_lineX1;
        if (dyv < dxv) {
            /* shallow (dx > |dy|): step X each iteration, step row on carry */
            int cx = dxv, bx = -((dxv + 1) >> 1), si = dyv;
            goto sh_min;
        sh_advance:                    /* loc_1FB0 */
            if ((uint16)ax > (uint16)maxB[row]) maxB[row] = (int16)ax;
            ax++; bx -= dxv; row += rstep;
        sh_min:                        /* loc_1FBF */
            if ((uint16)ax < (uint16)minB[row]) minB[row] = (int16)ax;
        sh_cx:                         /* loc_1FC9 */
            if (--cx < 0) { if ((uint16)ax > (uint16)maxB[row]) maxB[row] = (int16)ax; return; }
            bx += si;
            if (bx >= 0) goto sh_advance;
            ax++;
            goto sh_cx;
        } else {
            /* steep (|dy| >= dx): step row each iteration, step X on carry */
            int cx = dyv, bx = -((dyv + 1) >> 1), si = dxv;
        st_loop:                       /* loc_1FF8 */
            if ((uint16)ax < (uint16)minB[row]) minB[row] = (int16)ax;
            if ((uint16)ax > (uint16)maxB[row]) maxB[row] = (int16)ax;
            if (--cx < 0) return;
            row += rstep;
            bx += si;
            if (bx < 0) goto st_loop;
            bx -= dyv;
            ax++;
            goto st_loop;
        }
    }
}

/* ===================================================================== */
/* seg001 0x193A — drawPrimitiveEdges: rasterize one edge record into the  */
/* span buffers, plus the boundary vertical-fill for clipped endpoints.    */
/* ===================================================================== */
static void drawPrimitiveEdges(struct EdgeRec *rec)
{
    if (!(rec->flags & 0x80)) {
        g_lineX1 = rec->x1; g_lineY1 = rec->y1;
        g_lineX2 = rec->x2; g_lineY2 = rec->y2;
        rasterizeEdgeSpan();
    }
    if (rec->flags & 0x20) clampScanlineSpan(rec->x1, rec->y1, rec->y1h);
    if (rec->flags & 0x10) clampScanlineSpan(rec->x2, rec->y2, rec->y2h);
}

/* ===================================================================== */
/* seg001 0x05DC — decodeRleEdgeRow: expand the run-length edge ordering    */
/* table into a flat sequence at DI, terminated by 0xFF. Depth-first walk   */
/* of the adjacency table at g_rleRowBase using an explicit stack.          */
/* ===================================================================== */
static void decodeRleEdgeRow(unsigned char far *src, unsigned char *dst, int rowBase)
{
    /* explicit stack of (state, parentValue) frames replacing the asm's
     * PUSH AX / POP AX recursion. */
    unsigned char stState[64];
    unsigned char stParent[64];
    int sp = 0;
    int cx;            /* current value */
    unsigned char *base = (unsigned char *)(size_t)(uint16)rowBase;

    g_rleRowBase = (int16)rowBase;
    cx = *src++;       /* first value */
    for (;;) {
        int dx;
        int al = base[cx];
        int bx = cx << 1;
        dx = (al == 0xff) ? 2 : 0;
        for (;;) {
            if (dx == 0) { dx = 1; goto read1; }
            if (dx == 1) { *dst++ = (uint8)cx; dx = 4; goto read0; }
            if (dx == 2) { dx = 3; goto read0; }
            if (dx == 3) { *dst++ = (uint8)cx; dx = 4; goto read1; }
            /* default: pop */
            if (--sp < 0) { *dst = 0xff; return; }
            dx = stState[sp];
            cx = stParent[sp];
            bx = cx << 1;
            continue;
        read0:
            al = src[bx];
            if (al == 0xff) continue;     /* back to switch with same dx */
            goto push;
        read1:
            al = src[bx + 1];
            if (al == 0xff) continue;
            goto push;
        push:
            stState[sp] = (uint8)dx;
            stParent[sp] = (uint8)cx;
            sp++;
            cx = al;
            break;     /* JMP loc_05EA */
        }
    }
}

/* ===================================================================== */
/* seg001 0x17F5 — renderPrimitiveCommand: decode one display-list command */
/* (filled face or line) and emit it. Walks ES:SI via *pp.                 */
/* ===================================================================== */
static void renderPrimitiveCommand(unsigned char far **pp)
{
    unsigned char far *p = *pp;
    int opcode = *p++;
    int bl = opcode;

    if ((opcode & 3) == 1) {
        /* ---- filled face (loc_184E) ---- */
        int countByte = *p++;
        int cl = bl >> 2;                /* opcode >> 2 */
        uint16 mask = g_vtxBitMask[(cl & 0x1e) >> 1];   /* g_vtxScale+3 lookup */
        int visible;
        if (cl & 0x20) visible = (g_vtxSignMaskHi & mask) != 0;
        else           visible = (g_vtxSignMaskLo & mask) != 0;
        /* a skipped face consumes its `count` vertex bytes plus the colour byte */
        if (!visible) { p += countByte + 1; *pp = p; return; }
        g_faceVtxCount = (uint8)countByte;
        {
            int colorByte = p[countByte];
            if (colorByte == 0xff) { p += countByte + 1; *pp = p; return; }
            if (g_objColorBase == 0x400 && colorByte != 1) { p += countByte + 1; *pp = p; return; }
            gfx_setColor((unsigned char)(colorLut[colorByte] + g_objShade));
        }
        resetScanlineSpansImpl();
        g_vtxSlotPhase = 0;
        do {
            int vi = *p++;
            struct EdgeRec *rec = EREC(vi);
            if (rec->flags & 0x40) {
                if (g_vtxSlotPhase == 0) {
                    g_clipVtx.x1 = rec->cv[0]; g_clipVtx.x1h = rec->cv[1];
                    g_clipVtx.y1 = rec->cv[2]; g_clipVtx.y1h = rec->cv[3];
                } else {
                    g_clipVtx.x2 = rec->cv[0]; g_clipVtx.x2h = rec->cv[1];
                    g_clipVtx.y2 = rec->cv[2]; g_clipVtx.y2h = rec->cv[3];
                }
                g_vtxSlotPhase++;
            }
            drawPrimitiveEdges(rec);
        } while (--g_faceVtxCount != 0);
        p++;
        if (g_vtxSlotPhase >= 2) {
            g_unusedClipFlag = 0;
            clipLineSegment(&g_clipVtx);
            drawPrimitiveEdges(&g_clipVtx);
        }
        clampSpansForFill();
        gfx_dirtyRect(g_spanBuf.minX,
                      g_dirtyRectMinY, g_dirtyRectMaxY);
        *pp = p;
        return;
    }

    /* ---- line (loc_1808) ---- */
    if (!testVisibilityMask(&p)) { p += 2; *pp = p; return; }   /* skip index+colour */
    {
        int vi = *p++;
        struct EdgeRec *rec = EREC(vi);
        int colorByte;
        if (rec->flags & 0x80) { p++; *pp = p; return; }         /* rejected: skip colour */
        colorByte = *p++;
        gfx_setColor((unsigned char)(colorLut[colorByte] + g_objShade));
        /* egseg1's loc_1808 draws this edge with a raw gfx_drawLine, relying on
         * the projection keeping the coords inside the viewport. MGRAPHIC's
         * gfx_drawLine clips only to the full page (0..199), NOT to g_clipMaxY,
         * so a model edge that projects with an out-of-viewport Y (the still-
         * incomplete flight projection does this) draws a wireframe line down
         * into the static cockpit dashboard, which is never redrawn — the lasting
         * "data band" corruption. Route through the Cohen-Sutherland clip
         * (drawClipLineGlobal, [0,clipMaxX]x[0,clipMaxY]) so a crossing edge is
         * clipped to the viewport rather than dropped, and an in-range edge draws
         * identically to the raw path. */
        g_lineX1 = rec->x1; g_lineY1 = rec->y1;
        g_lineX2 = rec->x2; g_lineY2 = rec->y2;
        drawClipLineGlobal();
    }
    *pp = p;
}

/* ===================================================================== */
/* seg001 0x176A — renderPrimitiveList: iterate the display-list commands. */
/* ===================================================================== */
static void renderPrimitiveList(unsigned char far *p)
{
    int count = *p++;
    if (count == 0) return;
    if (count != 0xff) {
        while (count--) renderPrimitiveCommand(&p);
        return;
    }
    /* ---- 0xFF: RLE-reordered shared-edge path (loc_1781) ---- */
    {
        unsigned long mask = ((unsigned long)(uint16)g_vtxSignMaskHi << 16)
                           | (uint16)g_vtxSignMaskLo;
        int cnt = g_modelEdgeCount;
        int i;
        for (i = 0; i < cnt; i++) {
            byte_36BAE[0x42 + i] = (mask & 1) ? 0x00 : 0xff;
            mask >>= 1;
        }
        decodeRleEdgeRow(p, byte_36BAE + 1, (int)(int16)(uint16)(size_t)(byte_36BAE + 0x42));
        {
            int edgeWords = g_modelEdgeCount * 2;
            unsigned char far *coord = p + edgeWords + 1;
            unsigned char far *cnts = coord + edgeWords;
            unsigned char far *dataBase = cnts + g_modelEdgeCount;
            unsigned char *order = byte_36BAE + 1;
            int ai = *order++;
            g_primCoordPtr = (int16)(uint16)(size_t)coord;
            g_primCountPtr = (int16)(uint16)(size_t)cnts;
            g_primDataBase = (int16)(uint16)(size_t)dataBase;
            for (;;) {
                unsigned char far *runp;
                g_primRunCount = cnts[ai];
                runp = dataBase + *(int16 far *)(coord + ai * 2);
                do { renderPrimitiveCommand(&runp); } while (--g_primRunCount != 0);
                ai = *order++;
                if (ai == 0xff) break;
            }
        }
    }
}

/* seg001 0x1764 — drawModelDisplayList. */
int far drawModelDisplayList(void)
{
    renderPrimitiveList((unsigned char far *)g_modelStreamPtr);
    return 0;
}

/* ===================================================================== */
/* seg001 0x11D8 — projectModelEdges: build clipped 2D edge records from    */
/* the projected vertex arrays (vproj.x/y), near-clipping behind vertices.  */
/* ===================================================================== */
static void projectModelEdges(unsigned char far **pp)
{
    unsigned char far *p = *pp;
    int count = *p++;
    int i;
    struct EdgeRec *rec = (struct EdgeRec *)flt15_buf2;
    if (count == 0) { *pp = p; return; }
    for (i = 0; i < count; i++) {
        if (!testVisibilityMask(&p)) {
            p += 2;
        } else {
            int va = *p++;
            int vb = *p++;
            rec->flags = 0;
            if (vtxScratch.vproj.in[va].div < 1) {
                if (vtxScratch.vproj.in[vb].div < 1) {
                    rec->flags |= 0x80;              /* both behind: reject */
                    goto next;
                }
                clipEdgeNearPlane(rec, va, vb);      /* va behind */
            } else if (vtxScratch.vproj.in[vb].div < 1) {
                clipEdgeNearPlane(rec, vb, va);      /* vb behind (swapped) */
                vb = va;                             /* P2 = the front vertex */
            } else {
                rec->x1 = (int16)vtxScratch.vproj.x.v[va];
                rec->x1h = HI16(vtxScratch.vproj.x.v[va]);
                rec->y1 = (int16)vtxScratch.vproj.y.v[va];
                rec->y1h = HI16(vtxScratch.vproj.y.v[va]);
            }
            rec->x2 = (int16)vtxScratch.vproj.x.v[vb];
            rec->x2h = HI16(vtxScratch.vproj.x.v[vb]);
            rec->y2 = (int16)vtxScratch.vproj.y.v[vb];
            rec->y2h = HI16(vtxScratch.vproj.y.v[vb]);
            clipLineSegment(rec);
        }
    next:
        rec = (struct EdgeRec *)((char *)rec + 0x1a);
    }
    *pp = p;
}

int far projectModelEdgesFar(void)
{
    unsigned char far *p = (unsigned char far *)g_modelStreamPtr;
    projectModelEdges(&p);
    g_modelStreamPtr = (char far *)p;
    return 0;
}

/* ===================================================================== */
/* seg001 0x2028 — clipAndRasterizeEdge: clip the edge (g_lineX1..) to the  */
/* clip rect, then rasterizeEdgeSpan, filling the boundary span columns for */
/* endpoints that land on the left/right edge. Used by drawPolygonOutline   */
/* (egsphere) and the egflight wireframe overlay.                           */
/* ===================================================================== */
static int crOutcode(int x, int y)
{
    int al = 0;
    if (x < 0) al |= 8; else if (x > g_clipMaxX) al |= 1;
    if (y < 0) al |= 4; else if (y > g_clipMaxY) al |= 2;
    return al;
}

/* seg001 0x1F25 — when x is off the left/right of the clip rect, fill that    */
/* vertical boundary column (minX at x=0, maxX at x=clipMaxX) from row yA to    */
/* yB. This is how the off-screen horizontal overhang of a polygon edge — and   */
/* an edge lying entirely off one vertical side — gets projected onto the       */
/* viewport boundary so the span fill still closes. clampScanlineSpan no-ops    */
/* for on-screen x. */
static void boundaryColumnFill(int x, int yA, int yB)
{
    if (x < 0) clampScanlineSpan(0, yA, yB);
    else if (x > g_clipMaxX) clampScanlineSpan(g_clipMaxX, yA, yB);
}

/* truncating signed (a*b)/d; udiv32by16 saturates to +-0x7f00 on overflow or  */
/* d==0, matching egseg1's INT 0 divide-overflow stub (clipRasterDivOverflowStub). */
static int clipMulDiv(int a, int b, int d)
{
    return (int)sdiv32by16(imul16(a, b), d);
}

int far clipAndRasterizeEdge(void)
{
    int cx = g_lineX1, dx = g_lineY1;    /* CX/DX = the anchor (kept) endpoint */
    int si = g_lineX2, di = g_lineY2;    /* SI/DI = the endpoint being clipped */
    int flags = crOutcode(cx, dx);       /* g_rasterClipFlags: anchor outcode  */
    int al = crOutcode(si, di);          /* AL: outcode of the clipped endpoint */
    int bp, divX, divY, bx, ax;
    long dXl, dYl;

    if (al == 0) {                       /* P2 inside */
        if (flags == 0) {                /* both inside: rasterize straight     */
            rasterizeEdgeSpan();
            return 0;
        }
        /* P2 inside, P1 outside -> swap so the outside point is (si,di)         */
        { int t; t = si; si = cx; cx = t; t = di; di = dx; dx = t; }
        { int t = flags; flags = al; al = t; }   /* al = oc1, flags = 0          */
        g_lineX1 = (int16)cx; g_lineY1 = (int16)dx;
    }
    bp = dx;                             /* BP = anchor y                       */
    if (flags & al) {                    /* both endpoints share a region side  */
        if ((flags & al) & 6) return 0;  /* same top/bottom -> reject, no fill   */
        boundaryColumnFill(cx, di, bp);  /* same left/right -> fill that column  */
        return 0;
    }

    /* divisors. MSC `int` is 16-bit; sphere-ring coords overflow a 16-bit       */
    /* subtract, so replicate egseg1's JO paths: halve both deltas (preserving   */
    /* the divY/divX ratio the clip math needs) until each fits in int16.        */
    dXl = (long)si - cx;
    dYl = (long)di - bp;
    while (dXl > 32767L || dXl < -32768L || dYl > 32767L || dYl < -32768L) {
        dXl >>= 1; dYl >>= 1;
    }
    divX = (int)dXl;
    divY = (int)dYl;

    for (;;) {                           /* loc_20F9: clip one endpoint per pass */
        if (al & 9) {                    /* off left/right: clip to a vertical   */
            bx = (si < 0) ? 0 : g_clipMaxX;
            ax = bp + clipMulDiv(bx - cx, divY, divX);    /* y at boundary x      */
            if (ax >= 0 && ax <= g_clipMaxY) goto accept; /* in range: take it    */
        }
        /* loc_2139: clip to the top/bottom horizontal instead                   */
        bx = (di > g_clipMaxY) ? g_clipMaxY : 0;
        ax = cx + clipMulDiv(bx - bp, divX, divY);        /* x at boundary y      */
        { int t = ax; ax = bx; bx = t; }                  /* ax=boundaryY, bx=x   */
        if (bx < 0 || bx > g_clipMaxX) { /* still off a vertical side: sliver     */
            boundaryColumnFill(bx, di, bp);
            return 0;
        }
    accept:                              /* loc_2176: store the clipped endpoint */
        clampScanlineSpan(bx, ax, di);   /* fill its boundary column overhang    */
        if (flags == 0) {                /* the other endpoint is inside: done   */
            g_lineX2 = (int16)bx; g_lineY2 = (int16)ax;
            rasterizeEdgeSpan();
            return 0;
        }
        /* loc_21AF: keep this clipped point as P1, clip the other endpoint next  */
        g_lineX1 = (int16)bx; g_lineY1 = (int16)ax;
        { int t; t = si; si = cx; cx = t; t = di; di = bp; bp = t; }
        al = flags; flags = 0;
    }
}

/* ===================================================================== */
/* seg001 0x1CB6 — clip the global segment (g_lineX1,g_lineY1)-(g_lineX2,   */
/* g_lineY2) to [0,g_clipMaxX]x[0,g_clipMaxY] (Cohen-Sutherland), write the */
/* clipped endpoints back to the globals, and draw the visible part via     */
/* gfx_drawLine. Returns 1 when the segment is fully outside (the ASM's CF   */
/* set), 0 when it was drawn. The egseg1 horizon path needs both the clipped */
/* coords (left in the globals) and the inside/outside result.             */
/* ===================================================================== */
static int clipHorizonLineDraw(void)
{
    int x1 = g_lineX1, y1 = g_lineY1, x2 = g_lineX2, y2 = g_lineY2;
    int oc1 = crOutcode(x1, y1);
    int oc2 = crOutcode(x2, y2);
    int guard = 0;
    while (oc1 | oc2) {
        int oc, nx, ny;
        if (oc1 & oc2) return 1;             /* trivially outside */
        if (++guard > 8) return 1;
        oc = oc1 ? oc1 : oc2;
        if (oc & 8) {                        /* left */
            ny = y1 + (int)sdiv32by16(imul16(y2 - y1, 0 - x1), x2 - x1); nx = 0;
        } else if (oc & 1) {                 /* right */
            ny = y1 + (int)sdiv32by16(imul16(y2 - y1, g_clipMaxX - x1), x2 - x1);
            nx = g_clipMaxX;
        } else if (oc & 4) {                 /* top */
            nx = x1 + (int)sdiv32by16(imul16(x2 - x1, 0 - y1), y2 - y1); ny = 0;
        } else {                             /* bottom */
            nx = x1 + (int)sdiv32by16(imul16(x2 - x1, g_clipMaxY - y1), y2 - y1);
            ny = g_clipMaxY;
        }
        if (oc == oc1) { x1 = nx; y1 = ny; oc1 = crOutcode(x1, y1); }
        else           { x2 = nx; y2 = ny; oc2 = crOutcode(x2, y2); }
    }
    g_lineX1 = (int16)x1; g_lineY1 = (int16)y1;
    g_lineX2 = (int16)x2; g_lineY2 = (int16)y2;
    gfx_drawLine((uint16)x1, (uint16)y1, (uint16)x2, (uint16)y2);
    return 0;
}

/* ===================================================================== */
/* seg001 0x067E — renderHorizonSky: draw the roll-tilted flat horizon at   */
/* the lowest detail level. Projects a single horizon line from the view's  */
/* pitch/roll/radius/distance (the sphere terms set by buildRotationMatrix), */
/* clips+draws it, then fills the sky half and (unless detail==2) the ground */
/* half by walking the line into the span buffers and closing each region    */
/* against the top/bottom viewport edges. drawFlatHorizon sets the sky color */
/* and calls this. Output is via gfx_setColor + the span fill (gfx_dirtyRect).*/
/* ===================================================================== */
static void renderHorizonSky(void)
{
    int scale, negPitch, roll, centerX, centerY, cx2, h, h2;
    long dividend, t1, t2, d, s, u1, u2, w, z;

    g_horizonNegPitch = (int16)(-g_spherePitch);
    negPitch = g_horizonNegPitch;

    /* scale = (radius<<8)/distZ, with a fixed fallback and a detail-2 bias */
    dividend = imul16(g_sphereRadius, 256);
    if (g_sphereDistZ > 0x1F0B) {
        scale = (int)sdiv32by16(dividend, g_sphereDistZ);
        if (g_detailLevel == 2) {
            int hb = (int)(((uint16)g_viewPosZ) >> 8);
            scale -= ((hb + (hb >> 1)) >> 3) + 4;
        }
    } else {
        scale = 0x3FF;
    }
    if (g_extraScaleShift != 0) scale <<= g_extraScaleShift;
    if (g_halfScaleRender != 0) scale >>= 1;

    roll = g_sphereRoll;
    centerX = g_viewCenterX;
    centerY = g_viewCenterY;
    cx2 = 2 * centerX;

    /* the two horizon-line endpoints: centerX +- (roll term) - (pitch term) */
    t1 = imul16(scale, negPitch); t1 <<= 1;     /* pitch term  */
    t2 = imul16(cx2, roll);       t2 <<= 1;     /* roll  term  */
    d = t2 - t1;
    g_lineX1 = (int16)(HI16(d) + centerX + LOCARRY(d));
    s = t1 + t2;
    g_lineX2 = (int16)(centerX - (HI16(s) + LOCARRY(s)));

    u1 = imul16(scale, roll);   u1 <<= 1;
    u2 = imul16(cx2, negPitch); u2 <<= 1;
    w = u2 - u1;
    h = HI16(w) + LOCARRY(w);
    g_lineY2 = (int16)((h - (h >> 2)) + centerY);
    z = u1 + u2;
    h2 = HI16(z) + LOCARRY(z);
    g_lineY1 = (int16)(centerY - (h2 - (h2 >> 2)));

    g_horizonSideFlag = 0;
    gfx_setColor(g_horizonSkyColor);
    resetScanlineSpansImpl();

    if (clipHorizonLineDraw() == 0 &&
        !(g_lineY1 == g_lineY2 &&
          (g_lineY1 == 0 || g_lineY1 == g_clipMaxY))) {
        /* horizon line is visible: fill the sky half, then the ground half */
        for (;;) {
            int sx1 = g_lineX1, sy1 = g_lineY1, sx2 = g_lineX2, sy2 = g_lineY2;
            int edgeX, far_, near_, sx, sy;
            /* egseg1 loc_07D5 calls loc_2028 (clipAndRasterizeEdge), NOT the raw
             * rasterizeEdgeSpan: the roll/pitch-tilted horizon line runs off the
             * viewport at most attitudes, and only the clipping rasterizer lays
             * down the boundary-column spans for the off-screen overhang. Calling
             * rasterizeEdgeSpan directly worked at level flight (line on-screen ->
             * the two are equivalent) but its out-of-range-Y guard dropped the
             * whole edge once tilted, so the sky/ground fill vanished at angles. */
            clipAndRasterizeEdge();              /* clips + may swap the globals */
            g_lineX1 = (int16)sx1; g_lineY1 = (int16)sy1;
            g_lineX2 = (int16)sx2; g_lineY2 = (int16)sy2;

            edgeX = ((g_horizonSideFlag ^ negPitch) < 0) ? g_clipMaxX : 0;
            g_horizonEdgeX = (int16)edgeX;
            near_ = 0;
            far_ = g_clipMaxY;
            if ((g_horizonSideFlag ^ roll) < 0) {
                int tmp = near_; near_ = far_; far_ = tmp;
            }
            /* close each endpoint against the near boundary, snapping an     */
            /* endpoint that lands on the far edge to the viewport corner.    */
            sx = g_lineX1; sy = g_lineY1;
            if (sy != near_) {
                if (sy == far_) sx = g_horizonEdgeX;
                clampScanlineSpan(sx, sy, near_);
            }
            sx = g_lineX2; sy = g_lineY2;
            if (sy != near_) {
                if (sy == far_) sx = g_horizonEdgeX;
                clampScanlineSpan(sx, sy, near_);
            }
            clampSpansForFill();
            gfx_dirtyRect(g_spanBuf.minX, g_dirtyRectMinY, g_dirtyRectMaxY);
            if (g_detailLevel == 2) break;
            g_horizonSideFlag ^= -1;
            if (g_horizonSideFlag == 0) break;
            gfx_setColor(g_horizonGroundColor);
            resetScanlineSpansImpl();
        }
    } else {
        /* line fully outside / degenerate: fill the whole viewport */
        int doFill = 1;
        if (g_sphereRadius >= 0) {
            gfx_setColor(g_horizonGroundColor);
            if (g_detailLevel == 2) doFill = 0;
        }
        if (doFill) {
            clampScanlineSpan(0, 0, g_clipMaxY);
            clampScanlineSpan(g_clipMaxX, 0, g_clipMaxY);
            clampSpansForFill();
            gfx_dirtyRect(g_spanBuf.minX, g_dirtyRectMinY, g_dirtyRectMaxY);
        }
    }
    gfx_nop22();
}

int far drawFlatHorizon(int skyColor)
{
    g_horizonSkyColor = (uint8)skyColor;
    renderHorizonSky();
    return 0;
}

/* ===================================================================== */
/* seg001 0x0002 — drawPolygonOutline: clip+rasterize each edge of a closed */
/* polygon into the span buffers, then flush via gfx_dirtyRect.            */
/* The actual fill colour is the 4th arg (edgeColor): egseg1 loads it into  */
/* AH and calls gfx_setDrawColor. The 1st arg (fillColor) is unused — the   */
/* sphere's sky/ground gradient comes entirely from edgeColor (ringIx+0x60/ */
/* +0x70 per ring). gfx_setColor (0x21) sets the same MGRAPHIC fill colour  */
/* as the register-only gfx_setDrawColor (0x20), so no new shim is needed.  */
/* ===================================================================== */
int far drawPolygonOutline(int fillColor, int pointCount, int *points, int edgeColor)
{
    int n = pointCount - 1;
    int *pt = points;
    int firstX, firstY;
    (void)fillColor;
    gfx_setColor(edgeColor);
    resetScanlineSpansImpl();
    firstX = *pt++;
    g_lineX1 = (int16)firstX;
    firstY = *pt++;
    g_lineY1 = (int16)firstY;
    while (n--) {
        /* The next edge must start from the ORIGINAL vertex, not the clipped
         * endpoint. egseg1 (loc_0025) pushes lineX2/lineY2 before loc_2028 and
         * pops them back into lineX1/lineY1 afterward; clipAndRasterizeEdge
         * overwrites g_lineX2/g_lineY2 with the clipped coords, so reusing them
         * would trace from a clipped point. Sphere-ring quads have vertices far
         * off-screen (+-0x5848); at level the axis-aligned geometry hid it, but
         * once tilted each edge started from the wrong point and the quads
         * stopped filling (striped/unfilled sky bands). */
        int nx = *pt++;
        int ny = *pt++;
        g_lineX2 = (int16)nx;
        g_lineY2 = (int16)ny;
        clipAndRasterizeEdge();
        g_lineX1 = (int16)nx;
        g_lineY1 = (int16)ny;
    }
    g_lineX2 = (int16)firstX;
    g_lineY2 = (int16)firstY;
    clipAndRasterizeEdge();
    clampSpansForFill();
    gfx_dirtyRect(g_spanBuf.minX,
                  g_dirtyRectMinY, g_dirtyRectMaxY);
    gfx_nop22();
    return 0;
}

/* ===================================================================== */
/* seg001 0x0B60 — renderSortedListFar: dispatch the depth-sorted scene     */
/* objects. The tac map draws its tiles directly (drawMapTiles) and leaves  */
/* the sorted list empty (g_sortedObjCount == 0), so for the map there is   */
/* nothing to dispatch. The per-object perspective render is not yet        */
/* implemented.                                                             */
/* ===================================================================== */
int far renderSortedListFar(void)
{
    return 0;
}

/* ===================================================================== */
/* Divide-overflow vector install/restore. sdiv32by16/udiv32by16 saturate  */
/* explicitly, so an INT 0 divide-overflow handler is not needed: no-op.   */
/* ===================================================================== */
void installDivZeroHandler(void) { }
void installDivZeroVector(void) { }
