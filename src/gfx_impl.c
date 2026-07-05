/*
 * gfx_impl.c Pure-C replacement for MGRAPHIC.EXE overlay (Mode 13h, 320x200x256)
 */

#include "gfx_impl.h"
#include "struct.h"
#include "slot.h"
#include <dos.h>
#include <stdio.h>

#include "fontdata.h"

/* dos_alloc is provided by lowlvl.asm (start.exe) or dosfunc.c (f15.exe) */
extern uint16 dos_alloc(uint16 size);

/* File-scope object used only for its address: FP_SEG of its far pointer
 * yields f15.exe's DGROUP segment, recorded in GfxState.f15DataSeg so the
 * const tables below (palettes, font tables) can be reached via far pointer
 * regardless of which process's DS is current at call time (Finding A). */
static int16 dgroupAnchor;

/* Byte offset of GfxState within the virtual overlay block */
#define GFX_STATE_OFFSET 0x2EC

/* Constants for IACA/COMM access */
#define SEG_LOWMEM 0
#define OFF_IACA_START 0x4f0
#define COMM_GFXOVL_ADDR_OFFSET 0x1a

/**
 * @brief Retrieves a far pointer to the shared GfxState structure in the virtual overlay.
 * This function must be called by all gfx functions needing access to shared state.
 */
static GfxState FAR *gfx_getState(void) {
    uint16 commSeg = *(uint16 FAR *)MK_FP(SEG_LOWMEM, OFF_IACA_START);
    uint16 ovlSeg = *(uint16 FAR *)MK_FP(commSeg, COMM_GFXOVL_ADDR_OFFSET);
    return (GfxState FAR *)MK_FP(ovlSeg, GFX_STATE_OFFSET);
}

/* Initialize row offset table */
static void initRowOffsets(void) {
    int16 i;
    if (gfx_getState()->rowOffsetsReady) return;
    for (i = 0; i < 200; i++)
        gfx_getState()->rowOffsets[i] = (uint16)(i * 320);
    gfx_getState()->rowOffsetsReady = 1;
}

/* ---- Slot 0x00: gfx_allocPage ---- */
int16 FAR CDECL gfx_allocPage(int16 n) {
    GfxState FAR *s;
    uint16 seg;
    union REGS r;
    initRowOffsets();
    /* In the original game, the MGRAPHIC overlay persists across exes and
     * gfx_setMode13 was already called by start.exe. In our NO_ASM build,
     * each exe has fresh static state. Bootstrap mode 13h on first use. */
    if (gfx_getState()->pageSegs[0] == 0) {
        gfx_setMode13(0);
    }
    /* Allocate 0x1000 paragraphs = 64KB directly via int16 21h */
    r.h.ah = 0x48;
    r.x.bx = 0x1000;
    intdos(&r, &r);
    seg = r.x.cflag ? 0 : r.x.ax;
    /* Don't overwrite page 0 if it's already the VGA framebuffer.
     * end.exe draws directly to 0xA000; gfx_setPageN(0) must keep
     * returning 0xA000 so all rendering is immediately visible. */
    if (n != 0 || gfx_getState()->pageSegs[0] != 0xA000) {
        gfx_getState()->pageSegs[n] = seg;
    }
    return (int16)seg;
}

/* ---- Slot 0x3c: gfx_setMode13 ---- */
void FAR CDECL gfx_setMode13(int16 monoFlag) {
    union REGS regs;
    GfxState FAR *s; /* Declare at function level for MSC small model */

    (void)monoFlag;

    initRowOffsets();

    /* Disable VGA gray-scale summing (INT 10h AH=12h AL=01h BL=33h) before the
     * mode set. Real MGRAPHIC's slot 0 only allocates, so the child sets mode
     * 13h exactly once; our NO_ASM parent calls gfx_setMode13 during
     * gfx_allocPage, and in that path the BIOS sums the default EGA palette to
     * luminance (logo/adv render gray). Disabling summing makes the subsequent
     * mode set load the colour default palette. */
    regs.x.ax = 0x1201;
    regs.x.bx = 0x0033;
    int86(0x10, &regs, &regs);

    /* Set video mode 13h */
    regs.x.ax = 0x0013;
    int86(0x10, &regs, &regs);

    /* Verify */
    regs.h.ah = 0x0F;
    int86(0x10, &regs, &regs);
    if (regs.h.al != 0x13) return;

    /* Clear page 0 (VGA framebuffer) */
    s = gfx_getState();
    s->pageSegs[0] = 0xA000;
    s->curPageSeg = s->pageSegs[1]; /* default to back buffer */
    s->modeFlag = 1;

    return;
}

/* ---- Slot 0x45: gfx_waitRetrace ---- */
void FAR CDECL gfx_waitRetrace(void) {
    /* Wait until not in retrace */
    while (inp(0x3DA) & 0x08) {}
    /* Wait until retrace starts */
    while (!(inp(0x3DA) & 0x08)) {}
    return;
}

/* ---- Slot 0x46: gfx_flipPage ---- */
void FAR CDECL gfx_flipPage(void) {
    /* The original MGRAPHIC slot 0x46 waits for retrace then un-blanks the
     * display (sequencer reg 1 bit 5 cleared); the companion gfx_waitRetrace
     * (slot 0x45) blanks it. It does NOT copy video memory — the game draws
     * directly to the visible page (0xA000). An earlier version copied
     * curPageSeg->0xA000 here, which blacked screens (e.g. the pilot roster)
     * whenever curPageSeg was left pointing at an off-screen work buffer by a
     * preceding sprite blit. Just sync to retrace. */
    gfx_waitRetrace();
    return;
}

/* ---- Slot 0x4b: gfx_storeBufPtr ---- */
void FAR CDECL gfx_storeBufPtr(uint16 seg, int16 pageIdx) {
    GfxState FAR *s = gfx_getState();
    if (pageIdx >= 0 && pageIdx < 16) {
        s->pageSegs[pageIdx] = seg;
    }
    return;
}

/* ---- Slot 0x3b: gfx_clearPage ----
 * Register-called via the _gfx_clearPage asm shim (regshim.asm): the caller
 * passes the target segment in ES (decodePic sets it directly, showPicFile via
 * _gfx_getPageSeg). The shim pushes ES as `seg`. We record it as curPageSeg so
 * the subsequent fillRow/fillRow2 (which write curPageSeg) land in this buffer,
 * then clear it — matching MGRAPHIC's slot 0x3b (`rep stosw` to ES:0). */
void gfx_clearPage_impl(uint16 seg) {
    GfxState FAR *s = gfx_getState();
    uint8 FAR *page;
    uint16 i;
    s->curPageSeg = seg;
    page = (uint8 FAR *)MK_FP(seg, 0);
    /* Clear 64000 bytes (32000 words) */
    for (i = 0; i < 32000u; i++) {
        ((uint16 FAR *)page)[i] = 0;
    }
}

/* ---- Slot 0x0e: gfx_setPageN ---- */
void FAR CDECL gfx_setPageN(uint16 pageNum) {
    GfxState FAR *s = gfx_getState();
    /* Don't re-init mode if page 0 is VGA framebuffer */
    if (s->pageSegs[0] == 0xA000) {
        s->curPageSeg = s->pageSegs[pageNum];
        return;
    }
    initRowOffsets();
    /* Bootstrap mode 13h for first use */
    if (s->pageSegs[0] == 0) {
        gfx_setMode13(0);
    }
    s->curPageSeg = s->pageSegs[pageNum];
    return;
}

/* ---- Slot 0x0f: gfx_setCurPageSeg ---- */
/* Slot 0x0f: register-called via the _gfx_setCurPageSeg shim — AX = segment;
 * curPageSeg = AX. MGRAPHIC's slot 0x0f is `mov [curPageSeg],ax` — a SETTER (the
 * getter is slot 0x10). clearRect saves curPageSeg via 0x10 and restores it here. */
void gfx_setCurPageSeg_impl(uint16 seg) {
    gfx_getState()->curPageSeg = seg;
}

/* ---- Slot 0x17: gfx_getBufSize ---- */
int16 FAR CDECL gfx_getBufSize(void) {
    return (int16)0xFA00; /* baked constant 64000 (cs:0x1d2 in MGRAPHIC) */
}

/* ---- Slots 0x3a/0x38/0x33/0x35: register-called by the ASM pic renderer ----
 * The overlay slot symbols (gfx_getRowOffset/gfx_getPageSeg/gfx_fillRow/
 * gfx_copyRow) are tiny asm shims in regshim.asm that marshal the register
 * args (DI/SI/BP/BX) into cdecl stack args and call these *_impl bodies. DS is
 * the caller's DGROUP throughout, so `srcBuf` is read as a near pointer. */

/* Slot 0x3a: DI = y -> AX = row byte offset (y*320). */
int16 gfx_getRowOffset_impl(int16 y) {
    GfxState FAR *s = gfx_getState();
    initRowOffsets();
    if (y >= 0 && y < 200)
        return (int16)s->rowOffsets[y];
    return (int16)((uint16)y * 320);
}

/* Slot 0x38: SI = page -> select it as current page, return its segment. */
int16 gfx_getPageSeg_impl(uint16 page) {
    GfxState FAR *s = gfx_getState();
    if (page < 16)
        s->curPageSeg = s->pageSegs[page];
    return (int16)s->curPageSeg;
}

/* Slot 0x33: DI = rowOffset, BP = srcBuf (caller DS), BX = rowNum.
 * Copy one 320-byte decoded row into the current page (MCGA: direct write). */
void gfx_fillRow_impl(uint16 rowOffset, uint16 srcBuf, uint16 rowNum) {
    GfxState FAR *s = gfx_getState();
    const uint8 *src = (const uint8 *)(size_t)srcBuf; /* near ptr, caller's DS */
    uint8 FAR *dst;
    int16 col;
    (void)rowNum;
    dst = (uint8 FAR *)MK_FP(s->curPageSeg, rowOffset);
    for (col = 0; col < 320; col++)
        dst[col] = src[col];
}

/* Slot 0x35: DI = rowOffset. In MCGA the row is already in the page (fillRow
 * wrote directly), so this is a no-op. */
void gfx_copyRow_impl(uint16 rowOffset) {
    (void)rowOffset;
}

/* ---- Slot 0x3f: gfx_getModecode ---- */
int16 FAR CDECL gfx_getModecode(void) {
    return 3; /* MCGA mode code */
}

/* ---- Slot 0x22: gfx_nop22 ---- */
void FAR CDECL gfx_nop22(void) {
    return; /* bare RETF in MGRAPHIC — does NOT reset blitOffset */
}

/* ---- Slot 0x1a: gfx_setBlitOffset ---- */
void FAR CDECL gfx_setBlitOffset(int16 offset) {
    GfxState FAR *s = gfx_getState();
    s->blitOffset = (uint16)offset;
    return;
}

/* ---- Slot 0x25: gfx_dirtyRect ---- */
void FAR CDECL gfx_dirtyRect(int16 *spanBuf, int16 yMin, int16 yMax) {
    /* Register-called in overlay — stub for now */
    (void)spanBuf;
    (void)yMin;
    (void)yMax;
    return;
}

/* Slot 0x01 (gfx_fillDirty), 0x02 (gfx_blitTransparent), 0x03 (gfx_blitVariant),
 * 0x04 (gfx_copyBlock) and 0x06 (gfx_drawStringUnclipped) are register-called
 * glyph slots — their slot symbols are asm shims in regshim.asm that marshal
 * BP (param block) + BX (string) into gfx_drawStringClipped_impl (defined below
 * next to gfx_drawString). No C stub here; the shim provides the symbol. */

/* ---- Font data ---- */

/* Font width tables extracted from MGRAPHIC.EXE */
static const uint8 g_font1_widths[96] = {
    5, 2, 4, 7, 6, 8, 8, 2, 3, 3, 6, 6, 3, 4, 2, 8, 8, 3, 6, 6, 7, 6, 6, 6, 6, 6, 2, 3, 5, 5, 5, 6,
    8, 8, 6, 7, 8, 6, 6, 8, 8, 2, 6, 6, 6, 8, 8, 8, 6, 8, 6, 6, 6, 6, 6, 8, 8, 8, 8, 4, 8, 4, 6, 8,
    2, 6, 6, 5, 6, 6, 4, 6, 6, 2, 3, 6, 2, 8, 6, 6, 6, 6, 5, 6, 4, 6, 6, 8, 6, 6, 6, 4, 2, 4, 5, 8};
static const uint8 g_font3_widths[96] = {
    3, 2, 4, 5, 4, 5, 5, 2, 3, 3, 6, 4, 3, 4, 2, 4, 5, 3, 5, 5, 5, 5, 5, 5, 5, 5, 2, 3, 4, 4, 4, 5,
    5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 5, 5, 5, 6, 5, 5, 5, 5, 5, 5, 4, 5, 6, 6, 6, 6, 6, 3, 6, 3, 4, 5,
    2, 4, 4, 4, 4, 4, 3, 4, 4, 2, 3, 4, 2, 6, 4, 4, 4, 4, 4, 4, 4, 4, 4, 6, 4, 4, 4, 4, 2, 3, 3, 5};
static const uint8 g_font4_widths[96] = {
    4, 2, 4, 6, 4, 7, 6, 2, 3, 4, 4, 4, 3, 5, 2, 7, 5, 3, 5, 5, 6, 5, 5, 5, 5, 5, 2, 3, 4, 5, 4, 5,
    7, 6, 5, 6, 6, 5, 5, 7, 7, 2, 5, 5, 5, 6, 6, 7, 5, 7, 5, 5, 4, 5, 6, 8, 7, 8, 7, 3, 7, 3, 6, 6,
    2, 5, 5, 4, 5, 5, 3, 5, 5, 2, 3, 5, 2, 8, 5, 5, 5, 5, 5, 5, 4, 5, 6, 8, 5, 5, 5, 4, 2, 4, 5, 7};
static const uint8 g_font5_widths[96] = {
    3, 2, 4, 5, 4, 5, 5, 2, 3, 3, 6, 4, 3, 4, 2, 4, 5, 3, 5, 5, 5, 5, 5, 5, 5, 5, 2, 3, 4, 4, 4, 5,
    5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 5, 5, 5, 6, 5, 5, 5, 5, 5, 5, 4, 5, 6, 6, 6, 6, 6, 3, 6, 3, 4, 5,
    2, 4, 4, 4, 4, 4, 3, 4, 4, 2, 3, 4, 2, 6, 4, 4, 4, 4, 4, 4, 4, 4, 4, 6, 4, 4, 4, 4, 2, 3, 3, 5};

/* Font index 0 is the small in-flight HUD font (3x5, fixed advance 4). The
 * original registers it at runtime via low-memory pointer tables MGRAPHIC reads
 * (0:0xE2 width / 0:0xEE glyph / 0:0xFA rowsize); it is not statically present
 * in MGRAPHIC.EXE (which only bakes fonts 1,3,4,5). g_font0_* was captured from
 * the live glyph engine — see fontdata.h. All advances are 4 (fixed pitch). */
static const uint8 g_font0_widths[96] = {
    4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
    4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
    4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4};
static const uint8 *const g_fontWidthTables[8] = {
    g_font0_widths, g_font1_widths, NULL, g_font3_widths,
    g_font4_widths, g_font5_widths, NULL, NULL};
static const uint8 g_fontHeightsArr[8] = {5, 8, 7, 6, 7, 6, 4, 0};
static const uint8 g_fontMaxWidths[8] = {4, 8, 6, 6, 8, 6, 0, 0};

/* Bitmap pointers per font index — NULL means no bitmap available */
static uint8 *g_fontBitmapPtrs[8] = {
    (uint8 *)g_font0_bitmaps, (uint8 *)g_font1_bitmaps, NULL, (uint8 *)g_font3_bitmaps,
    (uint8 *)g_font4_bitmaps, (uint8 *)g_font5_bitmaps, NULL, NULL};
static const uint8 g_fontBitmapRowSize[8] = {5, 8, 0, 6, 7, 6, 0, 0};

/* ---- Shared glyph engine (slots 0x01-0x06) ----
 * MGRAPHIC has one core blitter (0x04 @0x4ab) that the string slots fall into
 * after running 0-3 clip stages. The clip stages cut partial glyphs at the
 * edges of a window whose bounds live in the param block:
 *   [bp+0xe]/word[7] = top Y     [bp+0x10]/word[8] = bottom Y
 *   [bp+0x12]/word[9] and [bp+0x14]/word[10] = the two X bounds
 * Rather than reproduce MGRAPHIC's char-count clip math (which divides by the
 * font width table — different data in this build), we render with our proven C
 * font path (same as the working slot 0x05) and clip every glyph pixel to the
 * window rectangle. Edge glyphs are pixel-clipped; this confines each tape/label
 * to its sub-window exactly as the original clip chain does. The param-block
 * field mapping (page[0], color[2], x[4], y[5], font[6]) is shared with the
 * cdecl slot 0x05 caller, so one core serves both. */
static void drawStringCore(int16 *params, const char *string,
                           int16 clipL, int16 clipR, int16 clipT, int16 clipB) {
    GfxState FAR *s = gfx_getState();
    uint16 dseg;
    uint8 FAR *heightsFar;
    uint8 FAR *rowSizeFar;
    uint8 *FAR *bmpPtrsFar;
    uint8 *FAR *wtPtrsFar;
    int16 x, y, color;
    uint8 FAR *page;
    int16 charIdx;
    uint8 ch;
    int16 row, col;
    uint16 fontIdx;
    uint8 height;
    uint8 FAR *bitmaps;
    uint8 FAR *widthTab;

    if (!string || !params) return;

    /* The font tables live in f15's DGROUP. When a child far-calls in, DS is
     * the child's DGROUP (no font data there), so reach the tables via
     * f15DataSeg (Finding A). The g_fontBitmapPtrs / g_fontWidthTables ENTRIES
     * are themselves near offsets into f15's DGROUP, so each selected entry
     * must be re-based on f15DataSeg as well before it can be dereferenced. */
    dseg = s->f15DataSeg;
    heightsFar = (uint8 FAR *)MK_FP(dseg, PTR_OFF(g_fontHeightsArr));
    rowSizeFar = (uint8 FAR *)MK_FP(dseg, PTR_OFF(g_fontBitmapRowSize));
    bmpPtrsFar = (uint8 *FAR *)MK_FP(dseg, PTR_OFF(g_fontBitmapPtrs));
    wtPtrsFar = (uint8 *FAR *)MK_FP(dseg, PTR_OFF(g_fontWidthTables));

    x = (int16)params[4];
    y = (int16)params[5];
    color = (int16)params[2];
    fontIdx = (uint16)params[6] & 7;
    height = heightsFar[fontIdx];
    bitmaps = bmpPtrsFar[fontIdx]
                  ? (uint8 FAR *)MK_FP(dseg, PTR_OFF(bmpPtrsFar[fontIdx]))
                  : (uint8 FAR *)0;
    widthTab = wtPtrsFar[fontIdx]
                   ? (uint8 FAR *)MK_FP(dseg, PTR_OFF(wtPtrsFar[fontIdx]))
                   : (uint8 FAR *)0;

    /* params/string are caller-passed NEAR pointers — they correctly resolve
     * against the caller's DS, so they must NOT be re-based on f15DataSeg. */
    page = (uint8 FAR *)MK_FP(s->pageSegs[params[0]], 0);

    for (charIdx = 0; string[charIdx] != 0 && charIdx < 256; charIdx++) {
        ch = (uint8)string[charIdx];

        /* Inline color escape: chars >= 0x80 change the text color.
         * The new color is (ch & 0x7F). No glyph is drawn. */
        if (ch & 0x80) {
            color = ch & 0x7F;
            continue;
        }

        if (x > clipR) break; /* rest of the string is right of window */

        if (bitmaps && ch >= 0x20) {
            uint8 FAR *glyph = bitmaps + (ch - 0x20) * (uint16)rowSizeFar[fontIdx];
            for (row = 0; row < height; row++) {
                int16 py = y + row;
                uint8 bits;
                uint16 rowOff;
                if (py < clipT || py > clipB) continue; /* row outside window */
                bits = glyph[row];
                rowOff = s->rowOffsets[py];
                for (col = 0; col < 8; col++) {
                    int16 px = x + col;
                    if ((bits & 0x80) && px >= clipL && px <= clipR)
                        page[rowOff + (uint16)px] = (uint8)color;
                    bits <<= 1;
                }
            }
        }
        x += widthTab ? (ch >= 0x20 ? widthTab[ch - 0x20] : 8) : 8;
    }

    /* Update x position and color in the param block (start/end's menu text
     * relies on the advanced x to chain successive draws). */
    params[4] = (int16)x;
    params[2] = (int16)color;
}

/* ---- Slot 0x05: gfx_drawString (cdecl, unclipped) ---- */
void FAR CDECL gfx_drawString(int16 *pageNum, const char *string) {
    drawStringCore(pageNum, string, 0, 319, 0, 199);
    return;
}

/* Register-called glyph slots (0x01/0x02/0x03/0x06) — entered via regshim.asm
 * with BP = param block (near, caller DS) and BX = string. `mode` selects which
 * clip stages the variant ran: bit0 = horizontal window (params word 9/10),
 * bit1 = vertical window (params word 7/8). The two X (resp. Y) bounds are
 * stored without a fixed min/max order across blocks, so normalise them. */
void gfx_drawStringClipped_impl(int16 *params, const char *string, int16 mode) {
    int16 clipL = 0, clipR = 319, clipT = 0, clipB = 199;
    if (!params) return;
    if (mode & 1) { /* horizontal clip window */
        int16 bound1 = (int16)params[9], bound2 = (int16)params[10];
        clipL = bound1 < bound2 ? bound1 : bound2;
        clipR = bound1 < bound2 ? bound2 : bound1;
    }
    if (mode & 2) { /* vertical clip window */
        int16 bound1 = (int16)params[7], bound2 = (int16)params[8];
        clipT = bound1 < bound2 ? bound1 : bound2;
        clipB = bound1 < bound2 ? bound2 : bound1;
    }
    if (clipL < 0) clipL = 0;
    if (clipR > 319) clipR = 319;
    if (clipT < 0) clipT = 0;
    if (clipB > 199) clipB = 199;
    drawStringCore(params, string, clipL, clipR, clipT, clipB);
}

/* ---- Slot 0x2a: gfx_copyRect ---- */
void FAR CDECL gfx_copyRect(int16 srcPage, uint16 srcX, uint16 srcY,
                            int16 dstPage, uint16 dstX, uint16 dstY,
                            int16 width, int16 height) {
    GfxState FAR *s = gfx_getState();
    int16 row;

    for (row = 0; row < height; row++) {
        uint16 sOff = s->rowOffsets[srcY + row] + (uint16)srcX;
        uint16 dOff = s->rowOffsets[dstY + row] + (uint16)dstX;
        movedata(s->pageSegs[srcPage], sOff, s->pageSegs[dstPage], dOff, (uint16)width);
    }
    return;
}

/* ---- Slot 0x29: gfx_switchColor ---- */
void FAR CDECL gfx_switchColor(int16 *pageDesc, int16 x1, int16 y1,
                               int16 x2, int16 y2, int16 oldColor, int16 newColor) {
    GfxState FAR *s = gfx_getState();
    uint16 pageSeg;
    uint8 FAR *page;
    int16 row, col;

    pageSeg = s->pageSegs[*pageDesc];
    page = (uint8 FAR *)MK_FP(pageSeg, 0);

    for (row = y1; row <= y2; row++) {
        uint16 off = s->rowOffsets[row];
        for (col = x1; col <= x2; col++) {
            if (page[off + col] == (uint8)oldColor)
                page[off + col] = (uint8)newColor;
        }
    }
    return;
}

/* ---- Slot 0x44: gfx_setDac ---- */
/* Palette data extracted from original MGRAPHIC.EXE overlay */
static const uint8 g_palettes[5][48] = {
    /* Palette 0: standard VGA 16-color */
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x2a, 0x00, 0x2a, 0x00, 0x00, 0x2a, 0x2a,
     0x2a, 0x00, 0x00, 0x2a, 0x00, 0x2a, 0x2a, 0x15, 0x00, 0x2a, 0x2a, 0x2a,
     0x15, 0x15, 0x15, 0x15, 0x15, 0x3f, 0x15, 0x3f, 0x15, 0x15, 0x3f, 0x3f,
     0x3f, 0x15, 0x15, 0x3f, 0x15, 0x3f, 0x3f, 0x3f, 0x15, 0x3f, 0x3f, 0x3f},
    /* Palette 1: magenta darkened */
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x2a, 0x00, 0x2a, 0x00, 0x00, 0x2a, 0x2a,
     0x2a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2a, 0x15, 0x00, 0x2a, 0x2a, 0x2a,
     0x15, 0x15, 0x15, 0x15, 0x15, 0x3f, 0x15, 0x3f, 0x15, 0x15, 0x3f, 0x3f,
     0x3f, 0x15, 0x15, 0x3f, 0x15, 0x3f, 0x3f, 0x3f, 0x15, 0x3f, 0x3f, 0x3f},
    /* Palette 2: bright red/yellow zeroed */
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x2a, 0x00, 0x2a, 0x00, 0x00, 0x2a, 0x2a,
     0x2a, 0x00, 0x00, 0x2a, 0x00, 0x2a, 0x2a, 0x15, 0x00, 0x2a, 0x2a, 0x2a,
     0x15, 0x15, 0x15, 0x15, 0x15, 0x3f, 0x15, 0x3f, 0x15, 0x15, 0x3f, 0x3f,
     0x3f, 0x15, 0x15, 0x00, 0x00, 0x00, 0x3f, 0x3f, 0x15, 0x3f, 0x3f, 0x3f},
    /* Palette 3: all black (fade out) */
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    /* Palette 4: green zeroed */
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x2a, 0x00, 0x00, 0x00, 0x00, 0x2a, 0x2a,
     0x2a, 0x00, 0x00, 0x2a, 0x00, 0x2a, 0x2a, 0x15, 0x00, 0x2a, 0x2a, 0x2a,
     0x15, 0x15, 0x15, 0x15, 0x15, 0x3f, 0x00, 0x00, 0x00, 0x15, 0x3f, 0x3f,
     0x3f, 0x15, 0x15, 0x3f, 0x15, 0x3f, 0x3f, 0x3f, 0x15, 0x3f, 0x3f, 0x3f}};

void FAR CDECL gfx_setDac(uint16 palIdx) {
    union REGS regs;
    struct SREGS sregs;
    GfxState FAR *s;
    if (palIdx > 4) return;
    /* INT 10h AX=1012h: set block of DAC color registers */
    regs.x.ax = 0x1012;
    regs.x.bx = 0;  /* first register */
    regs.x.cx = 16; /* number of registers */
    segread(&sregs);
#if !defined(MSDOS)
    (void)s;
    regs.x.dx = 0; /* (uint16)g_palettes[palIdx]; */
    sregs.es = sregs.ds;
#else
    /* ES:DX -> palette table. DX is the table's offset within f15's DGROUP,
     * but ES must be f15's DGROUP, NOT the caller's DS: when a child far-calls
     * in, DS is the child's DGROUP where no palette lives (Finding A). */
    s = gfx_getState();
    regs.x.dx = (uint16)g_palettes[palIdx];
    sregs.es = s->f15DataSeg;
#endif
    int86x(0x10, &regs, &regs, &sregs);
    gfx_waitRetrace();
}

/* ---- Slot 0x21: gfx_setColor ---- */
void FAR CDECL gfx_setColor(int16 color) {
    GfxState FAR *s = gfx_getState();
    s->fillColor = (uint8)color;
    return;
}

/* ---- Slot 0x0c: gfx_initOverlay ----
 * MGRAPHIC: `mov ax,[cs:pageSegTable+2]; mov [cs:curPageSeg],ax` — sets the
 * current draw page to page 1 (the back buffer). Called once at egame startup. */
void FAR CDECL gfx_initOverlay(void) {
    GfxState FAR *s = gfx_getState();
    s->curPageSeg = s->pageSegs[1];
    return;
}
/* Slot 0x0d: register-called via the _gfx_setPage1 shim (regshim.asm) — AX = a
 * page index; curPageSeg = pageSegs[AX]. MGRAPHIC's slot 0x0d takes the index in
 * AX (the name is a misnomer); clearRect uses it to select the page to clear. */
int16 gfx_setPage1_impl(uint16 page) {
    GfxState FAR *s = gfx_getState();
    if (page < 16)
        s->curPageSeg = s->pageSegs[page];
    return (int16)s->curPageSeg;
}
/* Slot 0x10: called via the _gfx_getCurPageSeg shim, which preserves ES (a
 * gfx_getState() call here loads ES, and clearRect needs ES kept across this). */
int16 gfx_getCurPageSeg_impl(void) {
    GfxState FAR *s = gfx_getState();
    return (int16)s->curPageSeg;
}
void FAR CDECL gfx_getCurPage(int16 page) {
    GfxState FAR *s = gfx_getState();
    return;
}
/* Slot 0x11 (≡0x49): thunk to the sprite core (MGRAPHIC @0x7ca -> @0x7db). The
 * core is UNCONDITIONALLY transparent — `lodsb; or al,al; jz skip; mov [es:di],al`
 * over width*height — with NO flags test (flags lives at SpriteParams+0x18, past
 * the 8-word block the core reads). egame chooses transparent (0x11) vs opaque
 * (copyRect 0x2a / blitToCurrent 0x30) at the C level, so slot 0x11 must always
 * skip zero bytes. An earlier `flags & 0x10` gate made the HUD gun-sight blit
 * opaque, copying its black background as a square behind the reticle (bug 7). */
int16 FAR CDECL gfx_blitSprite(struct SpriteParams *p) {
    GfxState FAR *s = gfx_getState();
    uint16 srcSeg, dstSeg;
    int16 row, col, w, h;

    if (!p) return 0;
    if (p->page < 0 || p->page >= 16) return 0;
    srcSeg = p->bufPtr;
    dstSeg = s->pageSegs[p->page];
    w = p->width;
    h = p->height;

    for (row = 0; row < h; row++) {
        uint8 FAR *src = (uint8 FAR *)MK_FP(srcSeg,
                                            s->rowOffsets[p->srcY + row] + (uint16)p->srcX);
        uint8 FAR *dst = (uint8 FAR *)MK_FP(dstSeg,
                                            s->rowOffsets[p->dstY + row] + (uint16)p->dstX);
        for (col = 0; col < w; col++) {
            uint8 px = src[col];
            if (px) dst[col] = px;
        }
    }
    return 0;
}
/* Slot 0x1f: register-called via the _gfx_drawLine shim (regshim.asm).
 * MGRAPHIC's slot 0x1f takes its endpoints in registers: AX=x1, BX=y1,
 * CX=x2, DX=y2 (verified by disassembly), drawing to the current page with
 * the stored fill colour. The shim marshals those registers into these cdecl
 * stack args. (Calling this body directly with cdecl stack args — as the
 * noasm child trampolines do — also works.) */
/* Cohen-Sutherland region code against the 320x200 page. */
static int16 gfx_lineOutcode(int16 x, int16 y) {
    int16 code = 0;
    if (x < 0)
        code |= 1;
    else if (x > 319)
        code |= 2;
    if (y < 0)
        code |= 4;
    else if (y > 199)
        code |= 8;
    return code;
}

void gfx_drawLine_impl(uint16 ux1, uint16 uy1, uint16 ux2, uint16 uy2) {
    GfxState FAR *s = gfx_getState();
    uint8 FAR *page;
    uint8 color = s->fillColor;
    int16 vx, vy;         /* blitOffset decomposed into a viewport origin */
    int16 x1, y1, x2, y2; /* endpoints translated into absolute page coords */
    int16 code1, code2;
    int16 dx, dy, sx, sy, err, e2;

    /* MGRAPHIC slot 0x1f adds the blitOffset ([cs:0x1a0]) viewport base to the
     * start offset and is loop-counter-bounded; for off-screen endpoints it
     * just wraps writes inside the 64K page. Our earlier position-based loop
     * (while x0!=x2) infinite-looped once a delta overflowed a 16-bit int16 —
     * the 3D projection emits clamped near-plane coords like (13618,28486),
     * which hung the game on the first terrain frame. Rather than reproduce
     * MGRAPHIC's wrapping (~28000 useless writes per off-screen line, which is
     * far too slow in C and paints on-screen garbage), clip the segment to the
     * page with Cohen-Sutherland and draw only the visible part. The blitOffset
     * is folded in as a viewport origin so the radar/MFD lines land in their
     * sub-window instead of the main viewport. */
    vx = (int16)((uint16)s->blitOffset % 320u);
    vy = (int16)((uint16)s->blitOffset / 320u);
    x1 = (int16)(int16)ux1 + vx;
    y1 = (int16)(int16)uy1 + vy;
    x2 = (int16)(int16)ux2 + vx;
    y2 = (int16)(int16)uy2 + vy;

    /* Clip the segment to [0,319]x[0,199]. */
    code1 = gfx_lineOutcode(x1, y1);
    code2 = gfx_lineOutcode(x2, y2);
    for (;;) {
        if ((code1 | code2) == 0) break;  /* trivially inside */
        if ((code1 & code2) != 0) return; /* trivially outside */
        {
            int16 outcode = code1 ? code1 : code2;
            int16 clipX = 0, clipY = 0;
            if (outcode & 8) {
                clipX = x1 + (int32)(x2 - x1) * (199 - y1) / (y2 - y1);
                clipY = 199;
            } else if (outcode & 4) {
                clipX = x1 + (int32)(x2 - x1) * (0 - y1) / (y2 - y1);
                clipY = 0;
            } else if (outcode & 2) {
                clipY = y1 + (int32)(y2 - y1) * (319 - x1) / (x2 - x1);
                clipX = 319;
            } else {
                clipY = y1 + (int32)(y2 - y1) * (0 - x1) / (x2 - x1);
                clipX = 0;
            }
            if (outcode == code1) {
                x1 = clipX;
                y1 = clipY;
                code1 = gfx_lineOutcode(x1, y1);
            } else {
                x2 = clipX;
                y2 = clipY;
                code2 = gfx_lineOutcode(x2, y2);
            }
        }
    }

    /* Bresenham over the now-on-screen segment (deltas <= 320, no overflow). */
    page = (uint8 FAR *)MK_FP(s->curPageSeg, 0);
    dx = x2 - x1;
    if (dx < 0) dx = -dx;
    dy = y2 - y1;
    if (dy < 0) dy = -dy;
    sx = x1 < x2 ? 1 : -1;
    sy = y1 < y2 ? 1 : -1;
    err = dx - dy;
    for (;;) {
        page[(uint16)(y1 * 320 + x1)] = color;
        if (x1 == x2 && y1 == y2) break;
        e2 = err + err;
        if (e2 > -dy) {
            err -= dy;
            x1 += sx;
        }
        if (e2 < dx) {
            err += dx;
            y1 += sy;
        }
    }
}
/* Slot 0x20: register-called via the _gfx_setDrawColor shim — AH = fill colour.
 * Stores the clearRect/fill colour (MGRAPHIC slot 0x20 = `mov [fillColor],ah`). */
void gfx_setFillColor_impl(uint16 color) {
    gfx_getState()->fillColor = (uint8)color;
}
void FAR CDECL gfx_nop23(void) { return; }
/* Slot 0x25/0x28: register-called via the _gfx_dirtyRect2 shim — BX = near offset
 * of the per-row dirtyMinBuf (in the caller's DS), AX = yMin, CX = yMax. The
 * matching dirtyMaxBuf sits 0x1b8 bytes after dirtyMinBuf. For each row y in
 * [yMin..yMax] fill the span [minBuf[y]..maxBuf[y]] of curPageSeg with fillColor.
 * This is the actual rectangle clear behind clearRect (MGRAPHIC slot 0x25==0x28).
 * A row whose min==max==0 or ==0x13F is treated as empty and skipped, matching
 * the original's range guard. */
void gfx_dirtyRectFill_impl(uint16 minBufOff, uint16 yMin, uint16 yMax) {
    GfxState FAR *s = gfx_getState();
    const uint16 *minBuf = (const uint16 *)(size_t)minBufOff; /* caller's DS */
    const uint16 *maxBuf = (const uint16 *)(size_t)(minBufOff + 0x1b8);
    uint8 fill = s->fillColor;
    uint16 seg = s->curPageSeg;
    int16 firstRow = (int16)yMin; /* AX */
    int16 lastRow = (int16)yMax;  /* CX */
    int16 y;
    /* MGRAPHIC slot 0x25: `or ax,ax; js exit` — if firstRow < 0, draw nothing. */
    if (firstRow < 0) return;
    if (lastRow > 199) lastRow = 199; /* rowOffsets[] safety */
    for (y = (int16)lastRow; y >= (int16)firstRow; y--) {
        uint16 spanLo = minBuf[y];
        uint16 spanHi = maxBuf[y];
        uint16 width, col;
        uint8 FAR *dst;
        /* MGRAPHIC's degenerate-row test is UNSIGNED (`cmp hi,lo; jc skip; ja
         * draw`): skip when hi < lo, draw when hi > lo, and when equal skip only
         * if the column is 0 or 0x13f (else a single pixel). The edge-walker in
         * egame clips real spans to [0,0x13f] before storing, so a "negative"
         * (large-unsigned) lo is a non-span sentinel that this unsigned compare
         * skips. An earlier SIGNED reading clamped such a lo to 0 and filled
         * [0..hi], painting a spurious full-width scanline across the left-MFD
         * ocean (and the equivalent on 3D fills). */
        if (spanHi < spanLo) continue; /* unsigned */
        if (spanHi == spanLo && (spanHi == 0 || spanHi == 319)) continue;
        /* Clamp the write extent to the visible row. The 3D projection emits
         * near-plane-clamped columns (e.g. ~0x7000), so an unclamped width would
         * loop tens of thousands of times per row in C (MGRAPHIC wraps cheaply in
         * the 64K page; we clip instead). This does NOT change the draw decision
         * above — only how many bytes land on screen. */
        if (spanLo > 319) continue; /* span off right edge */
        if (spanHi > 319) spanHi = 319;
        width = (uint16)(spanHi - spanLo + 1);
        dst = (uint8 FAR *)MK_FP(seg, s->rowOffsets[y] + (uint16)s->blitOffset + spanLo);
        for (col = 0; col < width; col++)
            dst[col] = fill;
    }
}
/* Slot 0x2d: getDisplayPage — returns the back-buffer page index (no args).
 * MGRAPHIC's slot 0x2d is `mov al,[cs:0x1a2]; retf` — it returns the stored
 * display-page byte (the page the frame is composited into), NOT a segment.
 * The renderer (render3DView / renderHudFrame / tac map) targets this page,
 * and gfx_dacAnimate (slot 0x2c) presents it to the visible page 0.
 *
 * NOASM-only divergence: MGRAPHIC's span engine selects the fill page from the
 * view descriptor each frame, so the back buffer is always the 3D target. Our
 * span fills (gfx_dirtyRect/gfx_drawLine) instead follow curPageSeg, which the
 * alternate-view cockpit blit (openBlitClosePic(..., *g_pageFront)) leaves on
 * the visible page 0 — so without re-syncing here the F2/F3/F4 world composites
 * onto the visible page and gfx_dacAnimate then stomps it with the stale back
 * buffer (the flicker). render3DView calls this right before the 3D setup, so
 * re-select the display page as the active draw page to keep them in sync. */
int16 FAR CDECL gfx_getDisplayPage(void) {
    GfxState FAR *s = gfx_getState();
    if (s->displayPage < 16 && s->pageSegs[0] == 0xA000)
        s->curPageSeg = s->pageSegs[s->displayPage];
    return (int16)s->displayPage;
}

int16 FAR CDECL gfx_setFont(uint16 ch, uint16 fontIdx) {
    /* Returns the pixel advance width of a single character. stringWidth()
     * sums this over a string to centre text, so it MUST agree with the
     * x-advance gfx_drawString uses (wt[ch-0x20]); otherwise centred text
     * lands off-screen and drawString's clip test discards every glyph.
     * The width tables live in f15's DGROUP, reached via f15DataSeg (Finding A),
     * exactly as gfx_drawString rebases them. */
    GfxState FAR *s = gfx_getState();
    uint16 dseg = s->f15DataSeg;
    uint8 *FAR *wtPtrsFar = (uint8 *FAR *)MK_FP(dseg, PTR_OFF(g_fontWidthTables));
    uint8 FAR *wt;
    if (fontIdx >= 8) return 8;
    /* Chars >= 0x80 are inline color escapes - no glyph, no width */
    if (ch >= 0x80) return 0;
    wt = wtPtrsFar[fontIdx]
             ? (uint8 FAR *)MK_FP(dseg, PTR_OFF(wtPtrsFar[fontIdx]))
             : (uint8 FAR *)0;
    if (!wt || ch < 0x20) return 8;
    return wt[ch - 0x20];
}
int16 FAR CDECL gfx_getAuxBufSize(void) { return 0x1950; }
int16 FAR CDECL gfx_getFreeMem(void) {
    /* Slot 0x32: DOS free-memory probe (int16 21h/AH=48h, BX=0xFFFF -> largest
     * free block in paragraphs). Stubbed to 0 in NO_ASM; takes no args despite
     * the old "fontSetup" mislabel. */
    return 0;
}
/* gfx_fillRow (0x33) and gfx_copyRow (0x35) are register-called: their slot
 * symbols are asm shims in regshim.asm -> gfx_fillRow_impl / gfx_copyRow_impl
 * above. Slot 0x34 (fillRow2) is IDENTICAL to slot 0x33 in MGRAPHIC (both
 * `rep movsw` the decoded row to ES:DI), so slot 0x34 points at the same
 * gfx_fillRow shim — decodePic (pic_decodepic.inc) uses it to fill the
 * caller's sprite buffer. This unused stub is kept only for legacy linkage. */
void FAR CDECL gfx_fillRow2(uint16 x, uint16 y) {
    (void)x;
    (void)y;
    return;
}
void FAR CDECL gfx_nop36(void) { return; }
void FAR CDECL gfx_nop37(void) { return; }
void FAR CDECL gfx_setFadeSteps(int16 steps) {
    (void)steps;
    return;
}
/* Slot 0x3e: linear byte offset of pixel (col,row) = col + rowTable[row].
 * MGRAPHIC's arg order is col FIRST ([ss:bx+4]), row SECOND ([ss:bx+6]) — the
 * opposite of the natural (y,x). egame computes every MFD viewport origin via
 * gfx_setBlitOffset(gfx_calcRowAddr(xOrigin, yOrigin)); an earlier (y,x) reading
 * transposed the result (col*320+row instead of row*320+col), which left the
 * main viewport correct (origin 0,0) but transposed every sub-window — the
 * middle MFD's −32x/+32y offset and the left/right MFD misplacement. */
int16 FAR CDECL gfx_calcRowAddr(int16 col, int16 row) {
    GfxState FAR *s = gfx_getState();
    if (!s->rowOffsetsReady) return (int16)(row * 320 + col);
    return (int16)(s->rowOffsets[row] + col);
}
/* Slots 0x40/0x41: MGRAPHIC stores the arg to absolute 0000:0x00CC / 0x00CE — a
 * 4-byte scratch (the unused int16 0x33 vector) the overlay's clip/draw paths read
 * back as the active clip rectangle. setupViewport calls setOvlVal2(width-1). */
void FAR CDECL gfx_setOvlVal1(int16 val) {
    *(uint16 FAR *)MK_FP(0, 0xCC) = (uint16)val;
    return;
}
void FAR CDECL gfx_setOvlVal2(int16 val) {
    *(uint16 FAR *)MK_FP(0, 0xCE) = (uint16)val;
    return;
}
int16 FAR CDECL gfx_getPresetOffset1(void) {
    return 0x5580; /* baked constant — NOT live blitOffset (that is slot 0x1e) */
}
int16 FAR CDECL gfx_getModeFlag(void) {
    GfxState FAR *s = gfx_getState();
    return (int16)s->modeFlag;
}
int16 FAR CDECL gfx_getModeFlag2(void) {
    GfxState FAR *s = gfx_getState();
    return (int16)s->modeFlag;
}
int16 FAR CDECL gfx_getVal(uint16 val) { return (int16)val; }
int16 FAR CDECL gfx_getVal2(uint16 val) { return (int16)val; }
void FAR CDECL gfx_setDacAnimCount(uint16 count) {
    GfxState FAR *s = gfx_getState();
    s->dacCounter = (uint8)count;
    return;
}
void FAR CDECL gfx_commitPage(void) {
    GfxState FAR *s = gfx_getState();
    /* Original slot 0x50 is RETF (no-op) - end.exe draws directly to VGA.
     * Only copy if we're drawing to a back buffer. */
    if (s->pageSegs[0] != 0xA000 && s->pageSegs[0] != 0) {
        movedata(s->pageSegs[0], 0, 0xA000, 0, 64000u);
    }
    return;
}
void FAR CDECL gfx_nop51(void) { return; }
void FAR CDECL gfx_setMonoFlag(uint16 mono) {
    (void)mono;
    return;
}
void FAR CDECL gfx_blitSpriteClipped(int16 *ptr) { gfx_blitSprite((struct SpriteParams *)ptr); }
void FAR CDECL gfx_blitSpriteClipped2(void) { return; }
void FAR CDECL gfx_blitSpriteOpaque(int16 *ptr) { gfx_blitSprite((struct SpriteParams *)ptr); }
void FAR CDECL gfx_blitSpriteOpaque2(void) { return; }

/* ---- Slot 0x30: gfx_blitToCurrent ---- */
void FAR CDECL gfx_blitToCurrent(int16 pagePtr) {
    GfxState FAR *s = gfx_getState();
    movedata((uint16)pagePtr, 0, s->curPageSeg, 0, 64000u);
    return;
}

/* ---- Slot 0x12/0x4a: gfx_blitCore — transparent sprite core ----
 * Register-called via the _gfx_blitCore shim (regshim.asm): BP = near pointer
 * (caller's DS) to an 8-word param block. MGRAPHIC's slot 0x12 (code @0x7db) is
 * `lodsb; or al,al; jz skip; mov [es:di],al` over width*height, dest segment
 * from pageSegTable[dstPage], no clipping, no blitOffset. The block layout is the
 * first 8 words of struct SpriteParams:
 *   [0] src segment   [1] src col   [2] src row   [3] dst page index
 *   [4] dst col       [5] dst row   [6] width     [7] height
 * Used by egame for the HUD gun-sight / symbol blits (egseg2.asm) — the
 * transparency (skip-zero) is what gives the gun sight its see-through
 * background instead of an opaque black box. */
void gfx_blitCore_impl(int16 *blk) {
    GfxState FAR *s = gfx_getState();
    uint16 srcSeg = (uint16)blk[0];
    uint16 srcCol = (uint16)blk[1];
    int16 srcRow = blk[2];
    uint16 dstSeg;
    uint16 dstCol = (uint16)blk[4];
    int16 dstRow = blk[5];
    int16 w = blk[6];
    int16 h = blk[7];
    int16 row, col;
    if (blk[3] < 0 || blk[3] >= 16) return;
    dstSeg = s->pageSegs[blk[3]];
    for (row = 0; row < h; row++) {
        uint8 FAR *src = (uint8 FAR *)MK_FP(srcSeg, (uint16)((srcRow + row) * 320) + srcCol);
        uint8 FAR *dst = (uint8 FAR *)MK_FP(dstSeg, (uint16)((dstRow + row) * 320) + dstCol);
        for (col = 0; col < w; col++) {
            uint8 px = src[col];
            if (px) dst[col] = px;
        }
    }
}

/* ---- Stubs for declared-but-unimplemented slots ---- */
/* gfx_blitVariant (0x03), gfx_copyBlock (0x04), gfx_drawStringUnclipped (0x06):
 * register-called glyph slots — provided by regshim.asm shims (see above). */
void FAR CDECL gfx_clipRight(void) { return; }
void FAR CDECL gfx_clipTop(void) { return; }
void FAR CDECL gfx_clipLeft(void) { return; }
void FAR CDECL gfx_clipBottom(void) { return; }

/* ---- Slot 0x0b: gfx_complexRender — HUD pitch-ladder renderer ----
 * MGRAPHIC code @0x615. Register-called (via the _gfx_complexRender shim in
 * regshim.asm) with BX=row, DX=orientation(dl), CX=mode-gate(cl), SI=ladder
 * variant (0 or 2). It writes colour 0x0f into curPageSeg along a column whose
 * X base + row Y-bounds come from a 12-word geometry table at MGRAPHIC data-seg
 * 0x1c84 (baked below — the disasm's `mov ds,0` is a relocated reference to the
 * overlay's data base, so the table is statically extractable, NOT seg-0 BSS):
 *   base[i]=0x1c84[i]   loY[i]=0x1c84[i+4]   hiY[i]=0x1c84[i+8]
 * It walks rows from BX downward by 2, drawing a 1/2/3-pixel-thick mark per row
 * driven by a cycling 1..10 thickness counter (init 0xA), the thickness running
 * left (SI==0) or right (SI!=0). egame's drawInstrumentGauges calls it twice
 * (SI=0 and SI=2).
 *
 * Performance note: egame computes BX via `sub word [g_tapeRenderX],AX` (egseg2.asm
 * :240) which can underflow to a large unsigned value, so BX may start far above
 * hiY. The original asm then burns up to ~32k cheap skip iterations decrementing
 * BX by 2 until it reaches the loY..hiY window — negligible in hand-asm, but slow
 * enough in C to look like a hang (it froze the flight on the first HUD frame).
 * Those leading iterations never draw, so we fast-forward over them, advancing
 * the iteration index `t` so the thickness counter keeps the exact same phase as
 * the naive loop would have at the first in-window row. */
static const int16 g_ladderGeom[12] = {
    71, 248, 120, 200, 26, 26, 68, 68, 86, 86, 98, 98};

void gfx_complexRender_impl(int16 bxArg, int16 dxArg, int16 cxArg, int16 siArg) {
    GfxState FAR *s = gfx_getState();
    uint8 FAR *page;
    uint8 color = 0x0f;
    int16 dir; /* +1 (SI!=0, cld) or -1 (SI==0, std) */
    int16 wi;  /* word index into the geometry table */
    uint16 base, loY, hiY;
    uint16 bx;
    int32 t; /* 1-based iteration index of the naive MGRAPHIC loop */
    int16 cl = cxArg & 0xff;
    int16 dl = dxArg & 0xff;

    dir = (siArg == 0) ? -1 : 1; /* set from the ORIGINAL si (before +=4) */
    bx = (uint16)(bxArg - 1);
    if ((int8)dl >= 1) bx += 20; /* `cmp dl,1; jl` is a signed byte test */
    if (cl != 0) {
        siArg += 4;
        bx++;
    }

    wi = siArg / 2; /* si is a byte offset; table is word-indexed */
    if (wi < 0 || wi + 8 > 11) return;
    /* The geometry table lives in f15's DGROUP. When egame far-calls in, DS is
     * egame's DGROUP (no table there), so reach it via f15DataSeg — exactly as
     * MGRAPHIC reads its own data segment (its `mov ds,0` immediate is relocated
     * to the overlay's data base) and as drawStringCore/gfx_setDac do here
     * (Finding A). Reading it as a near array would yield garbage loY — and a
     * garbage loY of 0 makes the unsigned `bx < loY` never true, so the loop
     * never terminates and the flight freezes on the first HUD frame. */
    {
        int16 FAR *geom = (int16 FAR *)MK_FP(s->f15DataSeg, PTR_OFF(g_ladderGeom));
        base = (uint16)geom[wi];
        loY = (uint16)geom[wi + 4];
        hiY = (uint16)geom[wi + 8];
    }

    page = (uint8 FAR *)MK_FP(s->curPageSeg, 0);
    initRowOffsets();

    /* Skip the leading non-drawing iterations (bx > hiY). bx steps by 2, so the
     * first in-window value is bx - 2*ceil((bx-hiY)/2); advance t to match. The
     * (uint16) cast yields the true unsigned gap even when bx underflowed. */
    t = 1;
    if (bx > hiY) {
        int32 skip = ((int32)(uint16)(bx - hiY) + 1L) / 2L;
        bx = (uint16)(bx - (uint16)(skip * 2L));
        t += skip;
    }

    for (;; t++) {
        int16 phase, thickness;
        if (bx < loY) break;             /* unsigned, matches `jc` */
        phase = (int16)((t - 1L) % 10L); /* thickness counter: 1..10 phase */
        thickness = (phase == 0) ? 10 : phase;
        if (bx <= hiY) { /* `ja` skips the store when bx>hiY */
            uint16 dstOff = (uint16)(s->rowOffsets[bx] + base);
            if (thickness == 5) {
                page[dstOff] = color;
                dstOff = (uint16)(dstOff + dir);
                page[dstOff] = color;
            } else if (thickness == 10) {
                page[dstOff] = color;
                dstOff = (uint16)(dstOff + dir);
                page[dstOff] = color;
                dstOff = (uint16)(dstOff + dir);
                if (cl == 0) page[dstOff] = color;
            } else {
                page[dstOff] = color;
            }
        }
        bx -= 2;
    }
}
void FAR CDECL gfx_spriteVariant1(void) { return; }
void FAR CDECL gfx_spriteVariant2(void) { return; }
void FAR CDECL gfx_nop15(void) { return; }
void FAR CDECL gfx_nop16(void) { return; }
void FAR CDECL gfx_setBlitOffset2(void) {
    GfxState FAR *s = gfx_getState();
    s->blitOffset = 0;
    return;
}
void FAR CDECL gfx_setBlitOffset3(void) {
    GfxState FAR *s = gfx_getState();
    s->blitOffset = 0;
    return;
}
void FAR CDECL gfx_setBlitOffsetReg(void) { return; }         /* reg-called stub: blitOffset=AX, no shim yet */
int16 FAR CDECL gfx_getPresetOffset2(void) { return 0x1950; } /* baked constant 0x1950 */
int16 FAR CDECL gfx_getBlitOffset(void) {
    GfxState FAR *s = gfx_getState();
    return (int16)s->blitOffset;
}
void FAR CDECL gfx_plotPixel(void) { return; } /* stub: real 0x24 plots one pixel at cached [0x1b6e]/[0x1b70] */
void FAR CDECL gfx_storePageSeg(void) { return; }
void FAR CDECL gfx_setPageSeg(void) { return; }
/* Slot 0x2b: zero-fill the PHYSICAL VGA buffer (0xA000), 64000 bytes — MGRAPHIC
 * sets ES=0xA000 and `rep stosw` 0x7d00 words. Independent of the page table, so
 * it always clears the visible framebuffer. (egame only calls this from a dead
 * path, but start/end use it; implement faithfully.) */
void FAR CDECL gfx_clearVga(void) {
    uint16 FAR *vga = (uint16 FAR *)MK_FP(0xA000, 0);
    uint16 i;
    for (i = 0; i < 32000u; i++)
        vga[i] = 0;
    return;
}
/* Slot 0x2c: present the composited back buffer to the visible page.
 * MGRAPHIC's slot 0x2c copies the full 64000-byte page from pageSegs[1] (the
 * back buffer, where gameMainLoop's renderFrame/renderHudFrame composite the
 * frame) to pageSegs[0] (the visible page), then sets displayPage=1. It is
 * called once per frame from gameMainLoop (egame_rc.asm). Args (AX/BX) ignored.
 * Without this the dynamic frame never reaches the screen — only the static
 * cockpit copied to page 0 at startup, plus direct-to-page-0 draws, show. */
void FAR CDECL gfx_dacAnimate(void) {
    GfxState FAR *s = gfx_getState();
    movedata(s->pageSegs[1], 0, s->pageSegs[0], 0, 64000u);
    s->displayPage = 1;
    return;
}
/* ---- Slot 0x2e: gfx_dacCycle — DAC fire/target colour-cycle ----
 * MGRAPHIC code @0x9be. Per frame it advances a phase counter (LCG x*5+1) at
 * data-seg 0x1ccc, picks one of 4 palette indices from the table at 0x1cc8
 * ({0x0c,0x04,0x0c,0x0e}), looks up that RGB triple in the 16-entry palette at
 * 0x1b85, and writes it to 9 DAC registers starting at 0x8d stepping +0x10
 * (0x8d,0x9d,..,0xfd,0x0d) via ports 0x3C8/0x3C9 — pulsing the fire/target
 * colour ramp red->dark-red->red->yellow. If the screen-shake countdown (the
 * cs:0x9b2 byte, our dacCounter, seeded by slot 0x4f) is nonzero it also jitters
 * CRTC start-address-low (reg 0x0D) and decrements it, resetting it to 0 on the
 * final frame. The 0x1ccc/0x1cc8/0x1b85 tables are baked into MGRAPHIC's data
 * segment (the disasm's `mov ds,0` immediate is relocated to the overlay's data
 * base, so they are NOT segment-0 BSS and ARE statically extractable). */
static const uint8 g_dacFirePalette[16][3] = {
    {0x00, 0x00, 0x00}, {0x00, 0x00, 0x2a}, {0x00, 0x2a, 0x00}, {0x00, 0x2a, 0x2a}, {0x2a, 0x00, 0x00}, {0x2a, 0x00, 0x2a}, {0x2a, 0x15, 0x00}, {0x2a, 0x2a, 0x2a}, {0x15, 0x15, 0x15}, {0x15, 0x15, 0x3f}, {0x15, 0x3f, 0x15}, {0x15, 0x3f, 0x3f}, {0x3f, 0x15, 0x15}, {0x3f, 0x15, 0x3f}, {0x3f, 0x3f, 0x15}, {0x3f, 0x3f, 0x3f}};
static const uint8 g_dacFireIndex[4] = {0x0c, 0x04, 0x0c, 0x0e};

void FAR CDECL gfx_dacCycle(void) {
    GfxState FAR *s = gfx_getState();
    uint16 phase;
    uint8 idx;
    uint8 FAR *idxTab;
    uint8 FAR *pal; /* flat 16x3 RGB table */
    uint8 r, g, b;
    uint8 reg;

    /* The fire palette + index tables live in f15's DGROUP; egame far-calls in
     * with its own DS, so reach them via f15DataSeg (Finding A) — otherwise the
     * RGB reads are garbage (the symptom: the warning colour pulsed magenta/black
     * instead of the red->dark-red->red->yellow fire ramp). */
    idxTab = (uint8 FAR *)MK_FP(s->f15DataSeg, PTR_OFF(g_dacFireIndex));
    pal = (uint8 FAR *)MK_FP(s->f15DataSeg, PTR_OFF(g_dacFirePalette));

    /* Advance the phase counter (ax = ax*5 + 1) and pick the fire colour. */
    phase = (uint16)(s->dacPhase * 5u + 1u);
    s->dacPhase = phase;
    idx = (uint8)(idxTab[(uint8)phase & 3] & 0x0f);
    r = pal[idx * 3 + 0];
    g = pal[idx * 3 + 1];
    b = pal[idx * 3 + 2];

    /* Write the triple to 9 DAC entries: 0x8d,0x9d,..,0xfd,0x0d (reg wraps). */
    reg = 0x8d;
    do {
        outp(0x3C8, reg);
        outp(0x3C9, r);
        outp(0x3C9, g);
        outp(0x3C9, b);
        reg = (uint8)(reg + 0x10);
    } while (reg != 0x1d);

    /* Screen-shake: while the countdown is nonzero, jitter CRTC start-addr-low
     * (reg 0x0D) by the phase high byte, decrementing the countdown and resetting
     * the register to 0 on the frame it reaches zero. */
    if (s->dacCounter != 0) {
        uint8 jitter = (uint8)((phase >> 8) & 3);
        if (--s->dacCounter == 0) jitter = 0;
        outp(0x3D4, 0x0D);
        outp(0x3D5, jitter);
    }
    return;
}
void FAR CDECL gfx_setPageBuf(void) { return; }
int16 FAR CDECL gfx_getConst1(void) { return 1; } /* baked constant 1 (cs:0x1d8 in MGRAPHIC) */

/* ---- Slot function pointer table (84 entries, slots 0x00–0x53) ---- */
/* MSC 5.1 forbids cast expressions in static initializers (C2097), so this
 * array starts zero-initialised and is filled at runtime by gfx_buildVirtualOverlay. */
GfxSlotFn gfxSlotTable[0x54];

static void fillSlotTable(void) {
    gfxSlotTable[0x00] = (GfxSlotFn)gfx_allocPage;
    gfxSlotTable[0x01] = (GfxSlotFn)gfx_fillDirty;
    gfxSlotTable[0x02] = (GfxSlotFn)gfx_blitTransparent;
    gfxSlotTable[0x03] = (GfxSlotFn)gfx_blitVariant;
    gfxSlotTable[0x04] = (GfxSlotFn)gfx_copyBlock;
    gfxSlotTable[0x05] = (GfxSlotFn)gfx_drawString;
    gfxSlotTable[0x06] = (GfxSlotFn)gfx_drawStringUnclipped;
    gfxSlotTable[0x07] = (GfxSlotFn)gfx_clipRight;
    gfxSlotTable[0x08] = (GfxSlotFn)gfx_clipTop;
    gfxSlotTable[0x09] = (GfxSlotFn)gfx_clipLeft;
    gfxSlotTable[0x0a] = (GfxSlotFn)gfx_clipBottom;
    gfxSlotTable[0x0b] = (GfxSlotFn)gfx_complexRender;
    gfxSlotTable[0x0c] = (GfxSlotFn)gfx_initOverlay;
    gfxSlotTable[0x0d] = (GfxSlotFn)gfx_setPage1;
    gfxSlotTable[0x0e] = (GfxSlotFn)gfx_setPageN;
    gfxSlotTable[0x0f] = (GfxSlotFn)gfx_setCurPageSeg;
    gfxSlotTable[0x10] = (GfxSlotFn)gfx_getCurPageSeg;
    gfxSlotTable[0x11] = (GfxSlotFn)gfx_blitSprite;
    gfxSlotTable[0x12] = (GfxSlotFn)gfx_blitCore;
    gfxSlotTable[0x13] = (GfxSlotFn)gfx_spriteVariant1;
    gfxSlotTable[0x14] = (GfxSlotFn)gfx_spriteVariant2;
    gfxSlotTable[0x15] = (GfxSlotFn)gfx_nop15;
    gfxSlotTable[0x16] = (GfxSlotFn)gfx_nop16;
    gfxSlotTable[0x17] = (GfxSlotFn)gfx_getBufSize;
    gfxSlotTable[0x18] = (GfxSlotFn)gfx_setBlitOffset2;
    gfxSlotTable[0x19] = (GfxSlotFn)gfx_setBlitOffset3;
    gfxSlotTable[0x1a] = (GfxSlotFn)gfx_setBlitOffset;
    gfxSlotTable[0x1b] = (GfxSlotFn)gfx_setBlitOffsetReg;
    gfxSlotTable[0x1c] = (GfxSlotFn)gfx_getPresetOffset1;
    gfxSlotTable[0x1d] = (GfxSlotFn)gfx_getPresetOffset2;
    gfxSlotTable[0x1e] = (GfxSlotFn)gfx_getBlitOffset;
    gfxSlotTable[0x1f] = (GfxSlotFn)gfx_drawLine;
    gfxSlotTable[0x20] = (GfxSlotFn)gfx_setDrawColor;
    gfxSlotTable[0x21] = (GfxSlotFn)gfx_setColor;
    gfxSlotTable[0x22] = (GfxSlotFn)gfx_nop22;
    gfxSlotTable[0x23] = (GfxSlotFn)gfx_nop23;
    gfxSlotTable[0x24] = (GfxSlotFn)gfx_plotPixel;
    gfxSlotTable[0x25] = (GfxSlotFn)gfx_dirtyRect2; /* 0x25 == 0x28 in MGRAPHIC */
    gfxSlotTable[0x26] = (GfxSlotFn)gfx_storePageSeg;
    gfxSlotTable[0x27] = (GfxSlotFn)gfx_setPageSeg;
    gfxSlotTable[0x28] = (GfxSlotFn)gfx_dirtyRect2;
    gfxSlotTable[0x29] = (GfxSlotFn)gfx_switchColor;
    gfxSlotTable[0x2a] = (GfxSlotFn)gfx_copyRect;
    gfxSlotTable[0x2b] = (GfxSlotFn)gfx_clearVga;
    gfxSlotTable[0x2c] = (GfxSlotFn)gfx_dacAnimate;
    gfxSlotTable[0x2d] = (GfxSlotFn)gfx_getDisplayPage;
    gfxSlotTable[0x2e] = (GfxSlotFn)gfx_dacCycle;
    gfxSlotTable[0x2f] = (GfxSlotFn)gfx_setFont;
    gfxSlotTable[0x30] = (GfxSlotFn)gfx_blitToCurrent;
    gfxSlotTable[0x31] = (GfxSlotFn)gfx_getAuxBufSize;
    gfxSlotTable[0x32] = (GfxSlotFn)gfx_getFreeMem;
    gfxSlotTable[0x33] = (GfxSlotFn)gfx_fillRow;
    gfxSlotTable[0x34] = (GfxSlotFn)gfx_fillRow;
    gfxSlotTable[0x35] = (GfxSlotFn)gfx_copyRow;
    gfxSlotTable[0x36] = (GfxSlotFn)gfx_nop36;
    gfxSlotTable[0x37] = (GfxSlotFn)gfx_nop37;
    gfxSlotTable[0x38] = (GfxSlotFn)gfx_getPageSeg;
    gfxSlotTable[0x39] = (GfxSlotFn)gfx_setPageBuf;
    gfxSlotTable[0x3a] = (GfxSlotFn)gfx_getRowOffset;
    gfxSlotTable[0x3b] = (GfxSlotFn)gfx_clearPage;
    gfxSlotTable[0x3c] = (GfxSlotFn)gfx_setMode13;
    gfxSlotTable[0x3d] = (GfxSlotFn)gfx_setFadeSteps;
    gfxSlotTable[0x3e] = (GfxSlotFn)gfx_calcRowAddr;
    gfxSlotTable[0x3f] = (GfxSlotFn)gfx_getModecode;
    gfxSlotTable[0x40] = (GfxSlotFn)gfx_setOvlVal1;
    gfxSlotTable[0x41] = (GfxSlotFn)gfx_setOvlVal2;
    gfxSlotTable[0x42] = (GfxSlotFn)gfx_getModeFlag2;
    gfxSlotTable[0x43] = (GfxSlotFn)gfx_getConst1;
    gfxSlotTable[0x44] = (GfxSlotFn)gfx_setDac;
    gfxSlotTable[0x45] = (GfxSlotFn)gfx_waitRetrace;
    gfxSlotTable[0x46] = (GfxSlotFn)gfx_flipPage;
    gfxSlotTable[0x47] = (GfxSlotFn)gfx_blitSpriteClipped;
    gfxSlotTable[0x48] = (GfxSlotFn)gfx_blitSpriteClipped2;
    gfxSlotTable[0x49] = (GfxSlotFn)gfx_blitSpriteOpaque;
    gfxSlotTable[0x4a] = (GfxSlotFn)gfx_blitSpriteOpaque2;
    gfxSlotTable[0x4b] = (GfxSlotFn)gfx_storeBufPtr;
    gfxSlotTable[0x4c] = (GfxSlotFn)gfx_getModeFlag;
    gfxSlotTable[0x4d] = (GfxSlotFn)gfx_getVal2;
    gfxSlotTable[0x4e] = (GfxSlotFn)gfx_getVal;
    gfxSlotTable[0x4f] = (GfxSlotFn)gfx_setDacAnimCount;
    gfxSlotTable[0x50] = (GfxSlotFn)gfx_commitPage;
    gfxSlotTable[0x51] = (GfxSlotFn)gfx_nop51;
    gfxSlotTable[0x52] = (GfxSlotFn)gfx_setMonoFlag;
    gfxSlotTable[0x53] = (GfxSlotFn)gfx_getCurPage;
}

/* ---- Build the virtual overlay block ---- */
/* OvlHeader-compatible block so setupOverlaySlots (lowlvl.asm) can patch
 * start/end slot stubs to far-jump into f15.exe's gfx functions. */
void gfx_buildVirtualOverlay(uint16 ovlSeg) {
    uint16 codeSeg;
    int16 i;
    uint16 FAR *base;
    GfxState FAR *s;

    /* Populate slot table */
    fillSlotTable();

    /* Get f15.exe's code segment via a far pointer to a FAR-declared gfx function.
     * In small model, FAR functions still reside in the one code segment (CS),
     * so FP_SEG of any FAR function pointer gives CS. */
    {
        typedef int16(FAR * FarFn)(void);
        FarFn fp = (FarFn)gfx_allocPage;
        codeSeg = FP_SEG(fp);
    }

    /* Zero the entire 80-paragraph (1280-byte) block */
    base = (uint16 FAR *)MK_FP(ovlSeg, 0);
    for (i = 0; i < 640; i++)
        base[i] = 0;

    /* OvlHeader fields read by setupOverlaySlots (lowlvl.asm) */
    *(uint16 FAR *)MK_FP(ovlSeg, 0x18) = codeSeg; /* OVL_HDR_CODESEG  */
    *(uint16 FAR *)MK_FP(ovlSeg, 0x1C) = 0;       /* OVL_HDR_FIRSTIDX */
    *(uint16 FAR *)MK_FP(ovlSeg, 0x22) = 0x54;    /* OVL_HDR_SLOTCOUNT */

    /* Slot offset table at 0x24 (immediately after slotCount@0x22): one uint16
     * per slot. This is where the ASM setupOverlaySlots (overlay_slots.inc reads
     * `mov si,24h`) expects it — NOT 0x244. */
    for (i = 0; i < 0x54; i++)
        *(uint16 FAR *)MK_FP(ovlSeg, 0x24 + i * 2) = PTR_OFF(gfxSlotTable[i]);

    /* Initialize GfxState defaults */
    s = (GfxState FAR *)MK_FP(ovlSeg, GFX_STATE_OFFSET);
    s->modeFlag = 1;
    s->rowOffsetsReady = 0;
    s->displayPage = 1;  /* MGRAPHIC cs:0x1a2 default; back buffer = page 1 */
    s->dacPhase = 0x4d2; /* MGRAPHIC data-seg 0x1ccc seed (dacCycle phase) */
    for (i = 0; i < 16; i++) {
        s->pageSegs[i] = 0;
    }
    /* Record f15.exe's DGROUP segment so gfx const tables remain reachable
     * when a child far-calls in with its own DS (Finding A). This runs in
     * f15.exe, so the far address of any DGROUP object carries f15's DS.
     * FP_SEG needs an lvalue, so stage the far pointer in a local first. */
    {
        void FAR *anchorFp = (void FAR *)&dgroupAnchor;
        s->f15DataSeg = FP_SEG(anchorFp);
    }
}

/* ===================================================================
 * Stub MISC and SOUND overlays — provided by f15.exe itself so the
 * pure-DOS build does not depend on the original MISC.EXE / NSOUND.EXE.
 *
 *   - Sound is intentionally absent under DOS (roadmap: real audio only
 *     on non-DOS targets), so every audio slot is a no-op.
 *   - Misc is a placeholder: keyboard/joystick report "nothing pending"
 *     so the splash auto-advances. Its real behaviour must be replicated
 *     for a functional game.
 *
 * These reuse the same OvlHeader-compatible layout as the gfx overlay
 * (codeSeg@0x18, firstIdx@0x1C, slotCount@0x22, offsets@0x24), so the
 * child's ASM setupOverlaySlots patches them just like the real overlays.
 * =================================================================== */

/* Generic no-op far slot (return value lands in AX). */
int16 FAR CDECL ovl_nop(void) { return 0; }

/* Misc/input slots (0x5a-0x5f), reimplemented faithfully from MISC.EXE so the
 * pure-DOS build has working keyboard input without loading MISC.EXE.
 *
 * Original MISC.EXE disassembly:
 *   0x5a keybuf: mov ah,1; int 16h; jz empty; sub ax,ax; retf  (0 = key avail)
 *                empty: sub ax,ax; not ax; retf                (0xFFFF = empty)
 *   0x5b getkey: sub ah,ah; int 16h; retf  (raw BIOS AX: AH=scan, AL=ascii;
 *                callers in pollMenuInput mask &0xff when AL!=0)
 *   0x5e clearKeyFlags: zero the low nibble of BDA 0040:0417 (shift state) */

/* Slot 0x5a: 0 if a key is waiting, 0xFFFF if the buffer is empty. INT 16h
 * AH=01h sets ZF when empty, but int86() does not expose ZF — so test the
 * BIOS keyboard buffer head/tail (0040:001A / 0040:001C), which is exactly
 * what AH=01h inspects (equal => empty). */
int16 FAR CDECL miscStub_keybuf(void) {
    uint16 FAR *head = (uint16 FAR *)MK_FP(0x40, 0x1a);
    uint16 FAR *tail = (uint16 FAR *)MK_FP(0x40, 0x1c);
    return (*head == *tail) ? (int16)0xFFFF : 0;
}

/* Slot 0x5b: return the raw BIOS keystroke (AH=scancode, AL=ascii). Blocks
 * until a key is available, matching the original. */
int16 FAR CDECL miscStub_getkey(void) {
    union REGS r;
    r.h.ah = 0;
    int86(0x16, &r, &r);
    return (int16)r.x.ax;
}

int16 FAR CDECL miscStub_readJoy(void) { return 0; }

/* Slot 0x5e: clear the active-modifier low nibble of the BDA shift-flags byte. */
int16 FAR CDECL miscStub_clearKeyFlags(void) {
    uint8 FAR *flags = (uint8 FAR *)MK_FP(0x40, 0x17);
    *flags &= 0xf0;
    return 0;
}

/* Write an OvlHeader-compatible stub overlay covering `count` slots starting
 * at `firstIdx`, pointing each at the corresponding fn (an f15.exe offset). */
static void buildStubOverlay(uint16 ovlSeg, uint16 firstIdx, uint16 count,
                             const GfxSlotFn *fns) {
    uint16 codeSeg;
    uint16 i;
    uint16 FAR *base;
    {
        typedef int16(FAR * FarFn)(void);
        FarFn fp = (FarFn)ovl_nop;
        codeSeg = FP_SEG(fp);
    }
    /* zero the header region (0x00..0x23) plus the offset table */
    base = (uint16 FAR *)MK_FP(ovlSeg, 0);
    for (i = 0; i < (uint16)(0x12 + count); i++)
        base[i] = 0;
    *(uint16 FAR *)MK_FP(ovlSeg, 0x18) = codeSeg;
    *(uint16 FAR *)MK_FP(ovlSeg, 0x1C) = firstIdx;
    *(uint16 FAR *)MK_FP(ovlSeg, 0x22) = count;
    for (i = 0; i < count; i++)
        *(uint16 FAR *)MK_FP(ovlSeg, 0x24 + i * 2) = PTR_OFF(fns[i]);
}

void gfx_buildMiscOverlay(uint16 ovlSeg) {
    GfxSlotFn fns[6];
    fns[0] = (GfxSlotFn)miscStub_keybuf;        /* 0x5a */
    fns[1] = (GfxSlotFn)miscStub_getkey;        /* 0x5b */
    fns[2] = (GfxSlotFn)ovl_nop;                /* 0x5c */
    fns[3] = (GfxSlotFn)miscStub_readJoy;       /* 0x5d */
    fns[4] = (GfxSlotFn)miscStub_clearKeyFlags; /* 0x5e */
    fns[5] = (GfxSlotFn)ovl_nop;                /* 0x5f */
    buildStubOverlay(ovlSeg, 0x5a, 6, fns);
}

void gfx_buildSoundOverlay(uint16 ovlSeg) {
    GfxSlotFn fns[10]; /* slots 0x64-0x6d, all no-op (no sound) */
    int16 i;
    for (i = 0; i < 10; i++)
        fns[i] = (GfxSlotFn)ovl_nop;
    buildStubOverlay(ovlSeg, 0x64, 10, fns);
}
