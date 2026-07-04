/*
 * eghudr.c - HUD instrument gauges for the egame C renderer.
 *
 * Hand-written ASM original: egseg2.asm (drawInstrumentGauges /
 * setupInstrumentLayout). These were never compiled C, so this is a
 * functionally-equivalent reimplementation rather than a 1:1 reconstruction:
 * it drives the same gfx_* backend slots with the same parameters to paint the
 * same speed/altitude tapes, compass strip, pitch ladder and gauge frame.
 * The gauge tables and layout scalars it reads (g_tapeText*, g_compassTapeBuf,
 * g_tapeDigitStrip, ...) live in egdata.c.
 *
 * Like egseg2.asm (seg002) this TU is too large for the shared 64K _TEXT, so it
 * is compiled into its own code segment (EGHUD_TEXT, via /NT) and far-calls
 * everything outside it: the gfx overlay through the cdecl slot trampolines
 * (slot.h), and the 32-bit-math / register-only HUD primitives through the
 * helpers in eghudm.c (which stay in _TEXT so MSC's near long-arithmetic runtime
 * helpers remain reachable — a far segment cannot near-call them). */
#include "egtypes.h"
#include "egcode.h"
#include "egdata.h"
#include "inttype.h"
#include "struct.h"
#include "slot.h"
#include "pointers.h"

/* --- C-defined egame globals not surfaced in a header --- */
extern uint8 g_tapeColumn;
extern uint8 g_tapeChar;
extern int16 g_tapeCursorX;

/* --- long-math helpers kept in _TEXT (eghudm.c); see the file header for why.
 * This TU (EGHUD_TEXT) far-calls them. --- */
extern int16 FAR CDECL hudPitchScale(int16 ap);
extern void FAR CDECL hudComplex(int16 bx, int16 dx, int16 cx, int16 si);
extern void FAR CDECL hudRotateLadder(int16 di);

/* cdecl->register shim (egregsh.asm) for MGRAPHIC's clipped glyph engine
 * (register-called slots 0x01-0x06): BP=descriptor, BX=string. The slot index
 * picks the clip mode, so each tape passes the slot the original egseg2.asm
 * used. */
extern void FAR CDECL gfx_drawGlyphStr(int16 *desc, const char *str, int16 slot);

/* cdecl->register marshaling shim (egregsh.asm) — restore curPageSeg by value. */
extern void FAR CDECL gfx_setCurPageSegReg(uint16 seg);

/* fillSpanRect — solid-rectangle fill of one page (egseg1.asm fillSpanRect /
 * fillRectBoth's primitive). pageDesc[0] = page number, (uint8)pageDesc[2] =
 * fill colour, (x1,y1)-(x2,y2) inclusive. The original feeds MGRAPHIC's span
 * engine (per-scanline g_spanMinX/MaxX then gfx_dirtyRect2); that engine is
 * register-called, so we fill the page directly (the plan's "reimplement
 * against the page" path). */
int16 FAR fillSpanRect(const int16 *pageDesc, int16 left, int16 top, int16 right, int16 bottom) {
    uint16 savedSeg = (uint16)gfx_getCurPageSeg();
    uint8 color = (uint8)pageDesc[2];
    uint16 seg;
    int16 y;
    gfx_setPageN((uint16)pageDesc[0]);
    seg = (uint16)gfx_getCurPageSeg();
    if (right >= left && bottom >= top) {
        for (y = top; y <= bottom; y++) {
            uint8 FAR *p = (uint8 FAR *)MK_FP(seg, (uint16)(y * 320 + left));
            int16 n = right - left + 1;
            while (n-- > 0) *p++ = color;
        }
    }
    gfx_setCurPageSegReg(savedSeg);
    return 0;
}

/* helpers: little-endian word view of a byte buffer, and low-byte lvalue. */
#define W16(p) (*(int16 *)(p))
#define LOB(v) (*(uint8 *)&(v))

/* gauge layout descriptor word indices (param blocks fed to the gfx slots).
 * Text descriptor = 11 words read by gfx_drawStringClipped_impl:
 *   [0]=page [2]=color [4]=x [5]=y [6]=font [7][8]=vert clip [9][10]=horiz clip
 * Sprite block = first 8 words read by gfx_blitCore_impl:
 *   [0]=srcSeg [1]=srcCol [2]=srcRow [3]=dstPage [4]=dstCol [5]=dstRow
 *   [6]=width [7]=height (the trailing config words are unused by the C blitter). */

/* gfx access — the slot trampolines (slot.h) are already FAR, so this far
 * segment calls them directly. The primitives needing 32-bit math, or having no
 * C-callable cdecl slot (the pitch-ladder column and the roll rotation/sine),
 * live in eghudm.c and are far-called. Tape/compass/label text goes through the
 * clipped glyph engine via gfx_drawGlyphStr (the per-call-site slot picks the
 * clip mode — see its decl above). */
static void setFill(int16 color) { gfx_setColor(color); }
static void drawLine(int16 x1, int16 y1, int16 x2, int16 y2) {
    gfx_drawLine((uint16)x1, (uint16)y1, (uint16)x2, (uint16)y2);
}
static void drawTapeStr(int16 *d, const uint8 *s, int16 slot) {
    gfx_drawGlyphStr(d, (const char *)s, slot);
}

/* ===== setupInstrumentLayout ===== */
void FAR setupInstrumentLayoutFar(void) {
    g_tapeSprite0[0] = g_tapeSprite1[0] = g_tapeSprite2[0] = g_tapeSprite3[0] = gfxBufPtr;
    g_halfScaleRender = 0;
    if (g_halfScaleRender == 1) {
        /* full-detail layout (unreachable at setup; kept for fidelity) */
        g_tapeOriginX = 100;
        g_tapeCursorBackShift = 8;
        g_tapeTickPitch = 10;
        g_tapeScaleShift = 0;
        g_speedTapeTickStep = 0x66;
        g_altTapeTickStep = 0xcc;
        g_headingBase = 136;
        g_headingPixPerDeg = 18;
        g_compassWrapLimit = 175;
        g_headingModulus = 4;
        g_headingWrapOffset = 2;
        g_pitchVtxX0 = 0xffe9;
        g_pitchVtxX1 = 0xfff8;
        g_pitchVtxX2 = 9;
        g_pitchVtxX3 = 23;
        g_pitchRungVStep = 26;
        g_pitchCenterY = 52;
        g_pitchDrawX = 31;
        g_pitchDrawY = 13;
        g_pitchLabelY = 80;
        g_pitchLabelX = 159;
        g_pitchBlitOfs = gfx_getPresetOffset1();
        g_pitchClipMaxX = 66;
        g_pitchClipMaxY = 37;
        g_geeReadoutX = 108;
        g_tapeText0[7] = 68;
        g_tapeText0[8] = 96;
        g_tapeText0[6] = 2;
        g_tapeText1[6] = g_tapeText2[6] = g_tapeText3[6] = 2;
        g_tapeText1[5] = 59;
        g_tapeText1[9] = 130;
        g_tapeText1[10] = 188;
        g_tapeSprite1[1] = 147;
        g_tapeSprite1[2] = 20;
        g_tapeSprite1[4] = 153;
        g_tapeSprite1[5] = 76;
        g_tapeSprite1[6] = 13;
        g_tapeSprite1[7] = 9;
        g_tapeSprite0[4] = 130;
        g_tapeSprite0[5] = 64;
        g_tapeSprite0[6] = 59;
        g_tapeSprite0[7] = 2;
        g_tapeText2[7] = 68;
        g_tapeText2[9] = 127;
        g_tapeText2[10] = 195;
        g_tapeText3[5] = 63;
    } else {
        /* the active layout (g_halfScaleRender == 0) */
        g_tapeOriginX = 94;
        g_tapeCursorBackShift = 17;
        g_tapeTickPitch = 20;
        g_tapeScaleShift = 1;
        g_speedTapeTickStep = 0x31;
        g_altTapeTickStep = 0xff;
        g_headingBase = 109;
        g_headingPixPerDeg = 45;
        g_compassWrapLimit = 248;
        g_headingModulus = 10;
        g_headingWrapOffset = 5;
        g_pitchVtxX0 = 0xffc4;
        g_pitchVtxX1 = 0xfff1;
        g_pitchVtxX2 = 16;
        g_pitchVtxX3 = 60;
        g_pitchRungVStep = 52;
        g_pitchCenterY = 104;
        g_pitchDrawX = 79;
        g_pitchDrawY = 36;
        g_pitchLabelY = 56;
        g_pitchLabelX = 159;
        g_pitchBlitOfs = gfx_getPresetOffset2();
        g_pitchClipMaxX = 160;
        g_pitchClipMaxY = 76;
        g_geeReadoutX = 60;
        g_tapeText0[7] = 26;
        g_tapeText0[8] = 86;
        g_tapeText0[6] = 0;
        g_tapeText1[6] = g_tapeText2[6] = g_tapeText3[6] = 0;
        g_tapeText1[5] = 10;
        g_tapeText1[9] = 90;
        g_tapeText1[10] = 230;
        g_tapeSprite1[1] = 130;
        g_tapeSprite1[2] = 38;
        g_tapeSprite1[4] = 147;
        g_tapeSprite1[5] = 48;
        g_tapeSprite1[6] = 25;
        g_tapeSprite1[7] = 15;
        g_tapeSprite0[4] = 90;
        g_tapeSprite0[5] = 16;
        g_tapeSprite0[6] = 141;
        g_tapeSprite0[7] = 3;
        g_tapeText2[7] = 20;
        g_tapeText2[9] = 78;
        g_tapeText2[10] = 241;
        g_tapeText3[5] = 16;
    }
}

/* ===== drawInstrumentGauges ===== */
static void drawInstrumentGauges(void) {
    int16 disp;
    int16 di, si;
    int8 dl;
    int16 cl, ch;
    int16 bxY; /* ladder Y coordinate accumulator (asm BX) */

    /* the gauge frame / pitch ladder use the page-relative blit origin; the
     * tapes and compass draw at absolute coords. Reset the origin so the frame
     * lands where the original (which assumed offset 0) put it. */
    gfx_setBlitOffset(0);

    disp = gfx_getDisplayPage() & 0xff;
    g_tapeText0[0] = g_tapeText1[0] = g_tapeText2[0] = g_tapeText3[0] = disp;
    g_tapeSprite0[3] = g_tapeSprite1[3] = g_tapeSprite2[3] = g_tapeSprite3[3] = disp;

    /* ---- speed tape ---- */
    {
        uint16 knots = g_knots;
        uint8 al;
        dl = (int8)((knots / 50) - 1);
        knots = (uint16)((knots % 50) << g_tapeScaleShift);
        al = (uint8)((knots / 5) + g_tapeOriginX);
        LOB(g_tapeText0[5]) = al; /* g_tapeText0Y */
        g_tapeRenderMode = (uint8)dl;
        al = (uint8)(al - g_tapeCursorBackShift);
        LOB(g_tapeRenderX) = al;
        di = ((uint8)dl) * 2;
        g_tapePageCounter = 4;
        for (;;) {
            LOB(g_tapeText0[5]) = (uint8)(LOB(g_tapeText0[5]) - (uint8)g_tapeTickPitch);
            g_tapeText0[4] = g_speedTapeTickStep;
            if (di >= 40) {
                di = 0;
                g_tapePageCounter--;
                g_tapeRenderX -= g_tapeTickPitch;
                continue;
            }
            W16(g_speedLabelBuf) = W16(g_tapeDigitStrip + di + 8);
            W16(g_speedLabelBuf + 2) = W16(g_tapeDigitStrip + di + 0x58);
            drawTapeStr(g_tapeText0, g_speedLabelBuf, 0x01);
            di += 2;
            if (--g_tapePageCounter == 0) break;
        }
        hudComplex(g_tapeRenderX, g_tapeRenderMode, g_halfScaleRender, 0);
    }

    /* speed-indicator tick marks (colour 0x0f) */
    setFill(0x0f);
    if (g_halfScaleRender != 0) {
        drawLine(122, 82, 124, 82);
        drawLine(196, 82, 198, 82);
        drawLine(159, 67, 159, 68);
    } else {
        drawLine(73, 56, 76, 56);
        drawLine(243, 56, 246, 56);
        drawLine(159, 20, 159, 22);
    }

    /* ---- altitude tape ---- */
    {
        uint16 alt = g_altitude;
        int16 thousands = (int16)(alt / 1000) - 1;
        uint16 rem = (uint16)(alt % 1000);
        uint16 hundredsPix;
        g_altRemainder = rem;
        hundredsPix = (uint16)((rem << g_tapeScaleShift) / 100);
        di = thousands * 2;
        g_tapePageCounter = 4;
        if (di < 0) {
            /* altitude < 1000 ft: build the hundreds tape */
            uint8 al;
            dl = (int8)((g_altRemainder / 100) - 1);
            rem = (uint16)((g_altRemainder % 100) << g_tapeScaleShift);
            al = (uint8)((rem / 10) + g_tapeOriginX);
            LOB(g_tapeText0[5]) = al;
            g_tapeRenderMode = (uint8)dl;
            al = (uint8)(al - g_tapeCursorBackShift);
            LOB(g_tapeRenderX) = al;
            di = ((uint8)dl) * 2;
            for (;;) {
                LOB(g_tapeText0[5]) = (uint8)(LOB(g_tapeText0[5]) - (uint8)g_tapeTickPitch);
                g_tapeText0[4] = g_altTapeTickStep;
                if (di >= 40) {
                    di = 0;
                    g_tapePageCounter--;
                    g_tapeRenderX -= g_tapeTickPitch;
                    continue;
                }
                g_tapeDigitStrip[0] = g_tapeDigitStrip[di + 0xa9];
                drawTapeStr(g_tapeText0, g_tapeDigitStrip, 0x01);
                di += 2;
                if (--g_tapePageCounter == 0) goto alt_done;
                if (di >= 20) {
                    di = 2;
                    break;
                } /* jump into the thousands loop */
            }
        } else {
            /* altitude >= 1000 ft */
            g_tapeText0[5] = hundredsPix + g_tapeOriginX;
            g_tapeRenderMode = 2;
            LOB(g_tapeRenderX) = (uint8)((hundredsPix + g_tapeOriginX) - g_tapeCursorBackShift);
        }
        /* thousands tape (shared tail, also entered from the hundreds loop) */
        for (;;) {
            LOB(g_tapeText0[5]) = (uint8)(LOB(g_tapeText0[5]) - (uint8)g_tapeTickPitch);
            g_tapeText0[4] = g_altTapeTickStep;
            if (di == 0) {
                drawTapeStr(g_tapeText0, g_tapeDigitStrip + 4, 0x01);
            } else {
                W16(g_altLabelBuf) = W16(g_tapeDigitStrip + di + 0xa8);
                drawTapeStr(g_tapeText0, g_altLabelBuf, 0x01);
            }
            di += 2;
            if (--g_tapePageCounter == 0) break;
        }
    alt_done:
        hudComplex(g_tapeRenderX, g_tapeRenderMode, g_halfScaleRender, 2);
    }

    /* ---- compass strip ---- */
    {
        uint16 head = (uint16)(g_ourHead - 0x2000);
        uint8 head_hi = (uint8)((head >> 8) & 0xff);
        uint16 s = (uint16)((head & 0x1f80) << 1);
        uint16 prod = (uint16)((s >> 8) & 0xff) * (uint16)(uint8)g_headingPixPerDeg;
        uint16 p6 = (uint16)(prod >> 6);
        int16 idx;
        g_compassMarkerPhase = (uint8)(p6 & 0xff);
        g_compassDrawX = (uint8)((uint8)g_headingBase - (uint8)((p6 >> 8) & 0xff));
        g_tapeText1[4] = g_compassDrawX;
        g_compassScrollIdx = (head_hi >> 2) & 0x38;

        drawTapeStr(g_tapeText1, g_compassTapeBuf + 132 + g_compassScrollIdx, 0x02);

        g_compassScrollIdx = (g_compassScrollIdx + 8) & 0x3f;
        g_compassDrawX += g_headingPixPerDeg;
        g_tapeText1[4] = g_compassDrawX;
        drawTapeStr(g_tapeText1, g_compassTapeBuf + 132 + g_compassScrollIdx, 0x04);

        g_compassScrollIdx = (g_compassScrollIdx + 8) & 0x3f;
        g_compassDrawX += g_headingPixPerDeg;
        g_tapeText1[4] = g_compassDrawX;
        drawTapeStr(g_tapeText1, g_compassTapeBuf + 132 + g_compassScrollIdx, 0x04);

        if ((uint16)g_compassDrawX < (uint16)g_compassWrapLimit) {
            uint8 *bx;
            g_compassScrollIdx = (g_compassScrollIdx + 8) & 0x3f;
            bx = g_compassTapeBuf + 132 + g_compassScrollIdx;
            W16(bx + 4) = W16(bx);
            W16(bx + 6) = W16(bx + 2);
            bx += 4;
            g_compassDrawX += g_headingPixPerDeg;
            g_tapeText1[4] = g_compassDrawX;
            drawTapeStr(g_tapeText1, bx, 0x03);

            /* directional marker sprite (selected by heading modulo) */
            idx = g_compassMarkerPhase % (uint8)g_headingModulus;
            if (g_ourHead & 0x2000) idx += g_headingWrapOffset;
            if (idx >= g_headingModulus) idx -= g_headingModulus;
            di = idx * 2;
            if (g_halfScaleRender == 1)
                g_tapeSprite0[2] = W16(g_compassTapeBuf + 0xd8 + di);
            else
                g_tapeSprite0[2] = W16(g_compassTapeBuf + 0xc4 + di);
            gfx_blitSprite((struct SpriteParams *)g_tapeSprite0);
        }
    }

    /* ---- gauge frame ---- */
    if (g_halfScaleRender == 0) {
        drawLine(46, 96, 46, 15);
        drawLine(274, 96, 274, 15);
        setFill(8);
        drawLine(45, 96, 45, 15);
        drawLine(275, 96, 275, 15);
        drawLine(275, 15, 232, 3);
        drawLine(232, 3, 90, 3);
        drawLine(45, 15, 89, 3);
    } else {
        drawLine(103, 96, 103, 63);
        drawLine(217, 96, 217, 63);
        setFill(8);
        drawLine(102, 96, 102, 63);
        drawLine(218, 96, 218, 63);
        drawLine(217, 63, 196, 57);
        drawLine(196, 57, 124, 57);
        drawLine(124, 57, 103, 63);
    }

    /* ---- HUD gun-sight ---- */
    if (g_hudDrawnFlag != 0)
        gfx_blitSprite((struct SpriteParams *)g_tapeSprite1);

    /* ---- G-meter readout ---- */
    g_tapeText3[4] = g_geeReadoutX;
    drawTapeStr(g_tapeText3, (const uint8 *)g_geeStringBuf, 0x04);

    /* ---- pitch ladder ---- */
    {
        int16 pitch = g_ourPitch;
        uint16 ap = (uint16)(pitch < 0 ? -pitch : pitch);
        uint16 t;
        int16 subY;
        ap >>= 6;
        t = (uint16)hudPitchScale(ap);
        ch = (t / 40) & 0xff; /* centre rung index */
        t = (uint16)((t % 40) * (uint8)g_pitchRungVStep);
        subY = (int16)(t / 40);
        if (pitch < 0) subY = (uint8)g_pitchRungVStep - subY;
        subY = (uint8)(subY + g_pitchCenterY);
        if (pitch < 0) ch = (int8)(-(int8)ch - 1);
        g_tapeCursorX = (int8)ch - 2;
        bxY = subY;
        dl = (int8)(g_tapeCursorX & 0xff);
        cl = 5;
        di = 0;
        si = 0;
        ch = 0;

        for (;;) {
            int16 d = dl;
            if (d == 9) { /* single short rung */
                W16(g_compassTapeBuf + 0xec + di) = g_pitchVtxX0;
                W16(g_compassTapeBuf + 0xee + di) = g_pitchVtxX3;
                W16(g_compassTapeBuf + 0x15c + di) = bxY;
                W16(g_compassTapeBuf + 0x15e + di) = bxY;
                g_compassTapeBuf[0x1cc + si] = 1;
                g_compassTapeBuf[0x1cd + si] = 0;
                W16(g_compassTapeBuf + 0x1e8 + si) = di;
                di += 2;
                W16(g_compassTapeBuf + 0x1e9 + si) = di;
                di += 2;
                si += 2;
                bxY -= g_pitchRungVStep;
                ch += 1;
            } else if (d > 9) { /* 3-segment rung, shifted -5 */
                W16(g_compassTapeBuf + 0xec + di) = g_pitchVtxX0;
                W16(g_compassTapeBuf + 0xee + di) = g_pitchVtxX0;
                W16(g_compassTapeBuf + 0xf0 + di) = g_pitchVtxX3;
                W16(g_compassTapeBuf + 0xf2 + di) = g_pitchVtxX3;
                W16(g_compassTapeBuf + 0x15e + di) = bxY;
                W16(g_compassTapeBuf + 0x160 + di) = bxY;
                W16(g_compassTapeBuf + 0x15c + di) = bxY - 5;
                W16(g_compassTapeBuf + 0x162 + di) = bxY - 5;
                g_compassTapeBuf[0x1cc + si] = 3;
                g_compassTapeBuf[0x1cd + si] = 0;
                di += 2;
                W16(g_compassTapeBuf + 0x1e8 + si) = di;
                di += 2;
                W16(g_compassTapeBuf + 0x1e9 + si) = di;
                di += 4;
                si += 2;
                bxY -= g_pitchRungVStep;
                ch += 3;
            } else if (d == -9 || d == 0) { /* full 4-vertex rung */
                W16(g_compassTapeBuf + 0xec + di) = g_pitchVtxX0;
                W16(g_compassTapeBuf + 0xee + di) = g_pitchVtxX1;
                W16(g_compassTapeBuf + 0xf0 + di) = g_pitchVtxX2;
                W16(g_compassTapeBuf + 0xf2 + di) = g_pitchVtxX3;
                W16(g_compassTapeBuf + 0x15c + di) = bxY;
                W16(g_compassTapeBuf + 0x15e + di) = bxY;
                W16(g_compassTapeBuf + 0x160 + di) = bxY;
                W16(g_compassTapeBuf + 0x162 + di) = bxY;
                g_compassTapeBuf[0x1cc + si] = 1;
                g_compassTapeBuf[0x1cd + si] = 1;
                W16(g_compassTapeBuf + 0x1e8 + si) = di;
                di += 6;
                W16(g_compassTapeBuf + 0x1e9 + si) = di;
                di += 2;
                si += 2;
                bxY -= g_pitchRungVStep;
                ch += 2;
            } else if (d < -9) { /* 4-segment rung, shifted +5 */
                W16(g_compassTapeBuf + 0xec + di) = g_pitchVtxX0;
                W16(g_compassTapeBuf + 0xee + di) = g_pitchVtxX0;
                W16(g_compassTapeBuf + 0xf0 + di) = g_pitchVtxX1;
                W16(g_compassTapeBuf + 0xf2 + di) = g_pitchVtxX2;
                W16(g_compassTapeBuf + 0xf4 + di) = g_pitchVtxX3;
                W16(g_compassTapeBuf + 0xf6 + di) = g_pitchVtxX3;
                W16(g_compassTapeBuf + 0x15e + di) = bxY;
                W16(g_compassTapeBuf + 0x160 + di) = bxY;
                W16(g_compassTapeBuf + 0x162 + di) = bxY;
                W16(g_compassTapeBuf + 0x164 + di) = bxY;
                W16(g_compassTapeBuf + 0x15c + di) = bxY + 5;
                W16(g_compassTapeBuf + 0x166 + di) = bxY + 5;
                g_compassTapeBuf[0x1cc + si] = 2;
                g_compassTapeBuf[0x1cd + si] = 2;
                di += 2;
                W16(g_compassTapeBuf + 0x1e8 + si) = di;
                di += 6;
                W16(g_compassTapeBuf + 0x1e9 + si) = di;
                di += 4;
                si += 2;
                bxY -= g_pitchRungVStep;
                ch += 4;
            } else if (d > 0) { /* 1..8: 3-segment rung, +5 */
                W16(g_compassTapeBuf + 0xec + di) = g_pitchVtxX0;
                W16(g_compassTapeBuf + 0xee + di) = g_pitchVtxX0;
                W16(g_compassTapeBuf + 0xf0 + di) = g_pitchVtxX3;
                W16(g_compassTapeBuf + 0xf2 + di) = g_pitchVtxX3;
                W16(g_compassTapeBuf + 0x15e + di) = bxY;
                W16(g_compassTapeBuf + 0x160 + di) = bxY;
                W16(g_compassTapeBuf + 0x15c + di) = bxY + 5;
                W16(g_compassTapeBuf + 0x162 + di) = bxY + 5;
                g_compassTapeBuf[0x1cc + si] = 3;
                g_compassTapeBuf[0x1cd + si] = 0;
                di += 2;
                W16(g_compassTapeBuf + 0x1e8 + si) = di;
                di += 2;
                W16(g_compassTapeBuf + 0x1e9 + si) = di;
                di += 4;
                si += 2;
                bxY -= g_pitchRungVStep;
                ch += 3;
            } else { /* -8..-1: 4-segment rung, -5 */
                W16(g_compassTapeBuf + 0xec + di) = g_pitchVtxX0;
                W16(g_compassTapeBuf + 0xee + di) = g_pitchVtxX0;
                W16(g_compassTapeBuf + 0xf0 + di) = g_pitchVtxX1;
                W16(g_compassTapeBuf + 0xf2 + di) = g_pitchVtxX2;
                W16(g_compassTapeBuf + 0xf4 + di) = g_pitchVtxX3;
                W16(g_compassTapeBuf + 0xf6 + di) = g_pitchVtxX3;
                W16(g_compassTapeBuf + 0x15e + di) = bxY;
                W16(g_compassTapeBuf + 0x160 + di) = bxY;
                W16(g_compassTapeBuf + 0x162 + di) = bxY;
                W16(g_compassTapeBuf + 0x164 + di) = bxY;
                W16(g_compassTapeBuf + 0x15c + di) = bxY - 5;
                W16(g_compassTapeBuf + 0x166 + di) = bxY - 5;
                g_compassTapeBuf[0x1cc + si] = 2;
                g_compassTapeBuf[0x1cd + si] = 2;
                di += 2;
                W16(g_compassTapeBuf + 0x1e8 + si) = di;
                di += 6;
                W16(g_compassTapeBuf + 0x1e9 + si) = di;
                di += 4;
                si += 2;
                bxY -= g_pitchRungVStep;
                ch += 4;
            }
            dl = (int8)(dl + 1);
            if (--cl == 0) break;
        }
        g_tapeChar = (uint8)ch;
        di -= 2;

        /* rotate the built ladder vertices by roll (32-bit math, so done in the
         * _TEXT helper hudRotateLadder where the C runtime helpers are near). */
        hudRotateLadder(di);

        /* draw the rotated segments (unless the high-G blackout is active) */
        if (g_highGeeFlag[0] != 0) {
            int16 savedMaxX = g_clipMaxX;
            int16 savedMaxY = g_clipMaxY;
            setFill(gfxModeUnset != 0 ? 0 : 7);
            gfx_setBlitOffset(g_pitchBlitOfs);
            g_clipMaxX = g_pitchClipMaxX;
            g_clipMaxY = g_pitchClipMaxY;
            di = 0;
            si = 0;
            g_tapeColumn = 0;
            for (;;) {
                g_lineX1 = W16(g_compassTapeBuf + 0xec + di) + g_pitchDrawX;
                g_lineY1 = W16(g_compassTapeBuf + 0x15c + di) + g_pitchDrawY;
                g_lineX2 = W16(g_compassTapeBuf + 0xee + di) + g_pitchDrawX;
                g_lineY2 = W16(g_compassTapeBuf + 0x15e + di) + g_pitchDrawY;
                drawClipLineGlobal();
                di += 2;
                g_tapeColumn++;
                if (--g_compassTapeBuf[0x1cc + si] != 0) continue;
                di += 2;
                si++;
                if (g_compassTapeBuf[0x1cc + si] == 0) si++;
                if ((int16)g_tapeColumn < (int8)g_tapeChar) continue;
                break;
            }

            /* rung labels (rolled into position via the timerTickByte curves) */
            si = 0;
            g_tapeCursorX += 11;
            {
                int16 rollIdx = (((uint16)g_ourRoll >> 8) >> 2) & 0xff;
                di = rollIdx * 2;
                g_tapeRollOfsA0 = W16(g_timerTickByte + 0x1a + di);
                g_tapeRollOfsA1 = W16(g_timerTickByte + 0x9a + di);
                g_tapeRollOfsA2 = W16(g_timerTickByte + 0x11a + di);
                g_tapeRollOfsA3 = W16(g_timerTickByte + 0x19a + di);
                rollIdx = ((((uint16)g_ourRoll >> 8) + 0x80) >> 2) & 0xff;
                di = rollIdx * 2;
                g_tapeRollOfsB0 = W16(g_timerTickByte + 0x1a + di);
                g_tapeRollOfsB1 = W16(g_timerTickByte + 0x9a + di);
                g_tapeRollOfsB2 = W16(g_timerTickByte + 0x11a + di);
                g_tapeRollOfsB3 = W16(g_timerTickByte + 0x19a + di);
            }
            {
                int16 seg = 5;
                for (;;) {
                    int16 idx4, vi, ax;
                    /* first (B) label */
                    idx4 = g_tapeCursorX * 4;
                    if (idx4 >= 0 && idx4 + 3 < (int16)sizeof(g_pitchLabelTable)) {
                        W16(g_tapeDrawStr) = W16(g_pitchLabelTable + idx4);
                        W16(g_tapeDrawStr + 2) = W16(g_pitchLabelTable + idx4 + 2);
                    } else {
                        g_tapeDrawStr[0] = 0;
                    }
                    vi = W16(g_compassTapeBuf + 0x1e8 + si) & 0xff;
                    ax = W16(g_compassTapeBuf + 0xec + vi);
                    ax += (idx4 >= 0x2c) ? g_tapeRollOfsB0 : g_tapeRollOfsB2;
                    g_tapeText2[4] = ax + g_pitchLabelX;
                    ax = W16(g_compassTapeBuf + 0x15c + vi);
                    ax += (vi >= 0x2c) ? g_tapeRollOfsB1 : g_tapeRollOfsB3;
                    g_tapeText2[5] = ax + g_pitchLabelY;
                    drawTapeStr(g_tapeText2, g_tapeDrawStr, 0x06);
                    si++;
                    /* second (A) label */
                    idx4 = g_tapeCursorX * 4;
                    if (idx4 >= 0 && idx4 + 3 < (int16)sizeof(g_pitchLabelTable)) {
                        W16(g_tapeDrawStr) = W16(g_pitchLabelTable + idx4);
                        W16(g_tapeDrawStr + 2) = W16(g_pitchLabelTable + idx4 + 2);
                    } else {
                        g_tapeDrawStr[0] = 0;
                    }
                    vi = W16(g_compassTapeBuf + 0x1e8 + si) & 0xff;
                    ax = W16(g_compassTapeBuf + 0xec + vi);
                    ax += (idx4 >= 0x2c) ? g_tapeRollOfsA0 : g_tapeRollOfsA2;
                    g_tapeText2[4] = ax + g_pitchLabelX;
                    ax = W16(g_compassTapeBuf + 0x15c + vi);
                    ax += (vi >= 0x2c) ? g_tapeRollOfsA1 : g_tapeRollOfsA3;
                    g_tapeText2[5] = ax + g_pitchLabelY;
                    drawTapeStr(g_tapeText2, g_tapeDrawStr, 0x06);
                    si++;
                    g_tapeCursorX++;
                    if (--seg == 0) break;
                }
            }
            g_clipMaxY = savedMaxY;
            g_clipMaxX = savedMaxX;
            gfx_setBlitOffset(0);
        }
    }
}

void FAR drawInstrumentGaugesFar(void) {
    drawInstrumentGauges();
}
