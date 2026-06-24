/*
 * eghudm.c - HUD math/raster helpers for the egame C renderer.
 *
 * Companion to eghudr.c. eghudr is the large C analogue of egseg2.asm and lives
 * in its own code segment (EGHUD_TEXT) so it does not push the shared _TEXT past
 * 64K. MSC emits NEAR calls to the C runtime's 32-bit arithmetic helpers
 * (__aNlmul/__aNlshr/__aNldiv/__aNlrem/__aNulmul), which live in _TEXT and are
 * unreachable by a near call from a different segment. egseg2.asm sidesteps this
 * by doing its 32-bit math inline in assembly; the C port instead keeps every
 * routine that needs `long` arithmetic here in _TEXT (where those helpers are
 * near) and lets eghudr far-call them. Each is a thin far entry point.
 *
 * Routines: hudSine (roll sine), hudPitchScale (pitch->ladder offset),
 * drawClipLineGlobal (clipLineFar, also used by the tac map / flight overlay),
 * hudComplex (pitch-ladder column, MGRAPHIC slot 0x0b), hudRotateLadder (rotate
 * the built ladder vertices by roll).
 */
#include "egtypes.h"
#include "egcode.h"
#include "egdata.h"
#include "inttype.h"
#include "struct.h"
#include "slot.h"
#include "pointers.h"

#define W16(p)  (*(int16 *)(p))

/* sin/cos via the shared 256-entry table + linear interpolation (16-bit angle:
 * high byte = table index, low byte = fraction). Matches the renderer's
 * lookupSineFar closely enough for the HUD. */
static int nsine(int angle)
{
    unsigned a = (unsigned)angle;
    int idx = (a >> 8) & 0xff;
    int frac = a & 0xff;
    int v0 = g_angleLut[idx];
    int v1 = g_angleLut[idx + 1];
    return v0 + (int)((((long)(v1 - v0) * frac) + 0x80) >> 8);
}

int FAR CDECL hudSine(int angle) { return nsine(angle); }

/* pitch -> ladder pixel offset: (|pitch|>>6) * 360, taking the high bytes. */
int FAR CDECL hudPitchScale(int ap)
{
    return (int)(((unsigned long)(unsigned)ap * 360u) >> 8);
}

/* ===== drawClipLineGlobal (clipLineFar) =====
 * Clip the global segment (g_lineX1,g_lineY1)-(g_lineX2,g_lineY2) to the window
 * [0,g_clipMaxX] x [0,g_clipMaxY] (Cohen-Sutherland), then emit the visible part
 * via gfx_drawLine (which folds in the current blitOffset window origin, clips
 * to the page and uses the stored fill colour). */
static int clipOutcode(int x, int y, int maxX, int maxY)
{
    int c = 0;
    if (x < 0) c |= 1; else if (x > maxX) c |= 2;
    if (y < 0) c |= 4; else if (y > maxY) c |= 8;
    return c;
}

int far drawClipLineGlobal(void)
{
    int x1 = g_lineX1, y1 = g_lineY1, x2 = g_lineX2, y2 = g_lineY2;
    int maxX = g_clipMaxX, maxY = g_clipMaxY;
    int c1 = clipOutcode(x1, y1, maxX, maxY);
    int c2 = clipOutcode(x2, y2, maxX, maxY);
    for (;;) {
        int oc, cx, cy;
        if ((c1 | c2) == 0) break;          /* fully inside */
        if ((c1 & c2) != 0) return 0;       /* fully outside */
        oc = c1 ? c1 : c2;
        cx = 0; cy = 0;
        if (oc & 8)      { cx = x1 + (long)(x2 - x1) * (maxY - y1) / (y2 - y1); cy = maxY; }
        else if (oc & 4) { cx = x1 + (long)(x2 - x1) * (0    - y1) / (y2 - y1); cy = 0; }
        else if (oc & 2) { cy = y1 + (long)(y2 - y1) * (maxX - x1) / (x2 - x1); cx = maxX; }
        else             { cy = y1 + (long)(y2 - y1) * (0    - x1) / (x2 - x1); cx = 0; }
        if (oc == c1) { x1 = cx; y1 = cy; c1 = clipOutcode(x1, y1, maxX, maxY); }
        else          { x2 = cx; y2 = cy; c2 = clipOutcode(x2, y2, maxX, maxY); }
    }
    gfx_drawLine((uint16)x1, (uint16)y1, (uint16)x2, (uint16)y2);
    return 0;
}

/* slot 0x0b (gfx_complexRender) — the pitch-ladder column. No cdecl trampoline
 * exists, so draw it directly into the current page. base/loY/hiY come from the
 * overlay's 12-word geometry table (baked here); thickness cycles 1..10. */
static const int g_ladderGeom[12] = {
    71, 248, 120, 200, 26, 26, 68, 68, 86, 86, 98, 98
};
void FAR CDECL hudComplex(int bxArg, int dxArg, int cxArg, int siArg)
{
    uint8 FAR *page = (uint8 FAR *)MK_FP((uint16)gfx_getCurPageSeg(), 0);
    uint8 color = 0x0f;
    int dir = (siArg == 0) ? -1 : 1;
    int cl = cxArg & 0xff, dl = dxArg & 0xff;
    uint16 bx = (uint16)(bxArg - 1);
    uint16 base, loY, hiY;
    int wi;
    long t;
    if ((int8)dl >= 1) bx += 20;
    if (cl != 0) { siArg += 4; bx++; }
    wi = siArg / 2;
    if (wi < 0 || wi + 8 > 11) return;
    base = (uint16)g_ladderGeom[wi];
    loY  = (uint16)g_ladderGeom[wi + 4];
    hiY  = (uint16)g_ladderGeom[wi + 8];
    t = 1;
    if (bx > hiY) {
        long skip = ((long)(uint16)(bx - hiY) + 1L) / 2L;
        bx = (uint16)(bx - (uint16)(skip * 2L));
        t += skip;
    }
    for (; ; t++) {
        int phase = (int)((t - 1L) % 10L);
        int thick = (phase == 0) ? 10 : phase;
        if (bx < loY) break;
        if (bx <= hiY) {
            uint16 off = (uint16)((uint16)bx * 320u + base);
            if (thick == 5) {
                page[off] = color; off = (uint16)(off + dir); page[off] = color;
            } else if (thick == 10) {
                page[off] = color; off = (uint16)(off + dir);
                page[off] = color; off = (uint16)(off + dir);
                if (cl == 0) page[off] = color;
            } else {
                page[off] = color;
            }
        }
        bx -= 2;
    }
}

/* rotate each built ladder vertex pair (x,y) by roll, mirroring asm loc_0764:
 *   newX = hi(sinR*x*2) - hi(cosR*y*2)
 *   newY = (hi(3*sinR*y) >> 1) + (hi(3*cosR*x) >> 1)
 * sinR = sine(0x4000-roll), cosR = sine(-roll); the high-word extraction is the
 * asm's shl/rcl, the >>1 is `sar DX,1`. `di` is the highest vertex byte offset;
 * walk down to 0 in steps of 2. */
void FAR CDECL hudRotateLadder(int di)
{
    long sinR = (long)nsine((int)(int16)(0x4000 - g_ourRoll));
    long cosR = (long)nsine((int)(int16)(-g_ourRoll));
    for (; di >= 0; di -= 2) {
        long x = (long)W16(g_compassTapeBuf + 0xec + di);
        long y = (long)W16(g_compassTapeBuf + 0x15c + di);
        int16 nx, ny;
        long v;
        nx  = (int16)(((sinR * x) << 1) >> 16);
        nx -= (int16)(((cosR * y) << 1) >> 16);
        v = sinR * y; v = (v << 1) + v;
        ny  = (int16)((int16)(v >> 16) >> 1);
        v = cosR * x; v = (v << 1) + v;
        ny += (int16)((int16)(v >> 16) >> 1);
        W16(g_compassTapeBuf + 0xec + di) = nx;
        W16(g_compassTapeBuf + 0x15c + di) = ny;
    }
}
