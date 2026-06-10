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
static int dgroupAnchor;

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
    uint16 ovlSeg  = *(uint16 FAR *)MK_FP(commSeg, COMM_GFXOVL_ADDR_OFFSET);
    return (GfxState FAR *)MK_FP(ovlSeg, GFX_STATE_OFFSET);
}

/* Initialize row offset table */
static void initRowOffsets(void)
{
    int i;
    if (gfx_getState()->rowOffsetsReady) return;
    for (i = 0; i < 200; i++)
        gfx_getState()->rowOffsets[i] = (uint16)(i * 320);
    gfx_getState()->rowOffsetsReady = 1;
}

/* ---- Slot 0x00: gfx_allocPage ---- */
int FAR CDECL gfx_allocPage(int n)
{
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
    /* Allocate 0x1000 paragraphs = 64KB directly via INT 21h */
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
    return (int)seg;
}

/* ---- Slot 0x3c: gfx_setMode13 ---- */
int FAR CDECL gfx_setMode13(int16 monoFlag)
{
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
    if (regs.h.al != 0x13) return -1;

    /* Clear page 0 (VGA framebuffer) */
    s = gfx_getState();
    s->pageSegs[0] = 0xA000;
    s->curPageSeg = s->pageSegs[1]; /* default to back buffer */
    s->modeFlag = 1;

    return 0;
}

/* ---- Slot 0x45: gfx_waitRetrace ---- */
int FAR CDECL gfx_waitRetrace(void)
{
    /* Wait until not in retrace */
    while (inp(0x3DA) & 0x08) {}
    /* Wait until retrace starts */
    while (!(inp(0x3DA) & 0x08)) {}
    return 0;
}

/* ---- Slot 0x46: gfx_flipPage ---- */
int FAR CDECL gfx_flipPage(void)
{
    /* The original MGRAPHIC slot 0x46 waits for retrace then un-blanks the
     * display (sequencer reg 1 bit 5 cleared); the companion gfx_waitRetrace
     * (slot 0x45) blanks it. It does NOT copy video memory — the game draws
     * directly to the visible page (0xA000). An earlier version copied
     * curPageSeg->0xA000 here, which blacked screens (e.g. the pilot roster)
     * whenever curPageSeg was left pointing at an off-screen work buffer by a
     * preceding sprite blit. Just sync to retrace. */
    gfx_waitRetrace();
    return 0;
}

/* ---- Slot 0x4b: gfx_storeBufPtr ---- */
int FAR CDECL gfx_storeBufPtr(uint16 seg, int pageIdx)
{
    GfxState FAR *s = gfx_getState();
    if (pageIdx >= 0 && pageIdx < 16) {
        s->pageSegs[pageIdx] = seg;
    }
    return 0;
}

/* ---- Slot 0x3b: gfx_clearPage ----
 * Register-called via the _gfx_clearPage asm shim (regshim.asm): the caller
 * passes the target segment in ES (decodePic sets it directly, showPicFile via
 * _gfx_getPageSeg). The shim pushes ES as `seg`. We record it as curPageSeg so
 * the subsequent fillRow/fillRow2 (which write curPageSeg) land in this buffer,
 * then clear it — matching MGRAPHIC's slot 0x3b (`rep stosw` to ES:0). */
void gfx_clearPage_impl(uint16 seg)
{
    GfxState FAR *s = gfx_getState();
    uint8 far *p;
    uint16 i;
    s->curPageSeg = seg;
    p = (uint8 far *)MK_FP(seg, 0);
    /* Clear 64000 bytes (32000 words) */
    for (i = 0; i < 32000u; i++) {
        ((uint16 far *)p)[i] = 0;
    }
}

/* ---- Slot 0x0e: gfx_setPageN ---- */
int FAR CDECL gfx_setPageN(uint16 pageNum)
{
    GfxState FAR *s = gfx_getState();
    /* Don't re-init mode if page 0 is VGA framebuffer */
    if (s->pageSegs[0] == 0xA000) {
        s->curPageSeg = s->pageSegs[pageNum];
        return 0;
    }
    initRowOffsets();
    /* Bootstrap mode 13h for first use */
    if (s->pageSegs[0] == 0) {
        gfx_setMode13(0);
    }
    s->curPageSeg = s->pageSegs[pageNum];
    return 0;
}

/* ---- Slot 0x0f: gfx_getCurPageSeg ---- */
/* Slot 0x0f: register-called via the _gfx_getCurPageSeg shim — AX = segment;
 * curPageSeg = AX. MGRAPHIC's slot 0x0f is `mov [curPageSeg],ax` — a SETTER (the
 * getter is slot 0x10). clearRect saves curPageSeg via 0x10 and restores it here. */
void gfx_setCurPageSeg_impl(uint16 seg)
{
    gfx_getState()->curPageSeg = seg;
}

/* ---- Slot 0x17: gfx_getBufSize ---- */
int FAR CDECL gfx_getBufSize(void)
{
    return 0x5580; /* 21888 bytes — sprite buffer size (matches real overlay) */
}

/* ---- Slots 0x3a/0x38/0x33/0x35: register-called by the ASM pic renderer ----
 * The overlay slot symbols (gfx_getRowOffset/gfx_getPageSeg/gfx_fillRow/
 * gfx_copyRow) are tiny asm shims in regshim.asm that marshal the register
 * args (DI/SI/BP/BX) into cdecl stack args and call these *_impl bodies. DS is
 * the caller's DGROUP throughout, so `srcBuf` is read as a near pointer. */

/* Slot 0x3a: DI = y -> AX = row byte offset (y*320). */
int gfx_getRowOffset_impl(int y)
{
    GfxState FAR *s = gfx_getState();
    initRowOffsets();
    if (y >= 0 && y < 200)
        return (int)s->rowOffsets[y];
    return (int)((uint16)y * 320);
}

/* Slot 0x38: SI = page -> select it as current page, return its segment. */
int gfx_getPageSeg_impl(uint16 page)
{
    GfxState FAR *s = gfx_getState();
    if (page < 16)
        s->curPageSeg = s->pageSegs[page];
    return (int)s->curPageSeg;
}

/* Slot 0x33: DI = rowOffset, BP = srcBuf (caller DS), BX = rowNum.
 * Copy one 320-byte decoded row into the current page (MCGA: direct write). */
void gfx_fillRow_impl(uint16 rowOffset, uint16 srcBuf, uint16 rowNum)
{
    GfxState FAR *s = gfx_getState();
    const uint8 *src = (const uint8 *)srcBuf;          /* near ptr, caller's DS */
    uint8 FAR *dst = (uint8 FAR *)MK_FP(s->curPageSeg, rowOffset);
    int i;
    (void)rowNum;
    for (i = 0; i < 320; i++)
        dst[i] = src[i];
}

/* Slot 0x35: DI = rowOffset. In MCGA the row is already in the page (fillRow
 * wrote directly), so this is a no-op. */
void gfx_copyRow_impl(uint16 rowOffset)
{
    (void)rowOffset;
}

/* ---- Slot 0x3f: gfx_getModecode ---- */
int FAR CDECL gfx_getModecode(void)
{
    return 3; /* MCGA mode code */
}

/* ---- Slot 0x1a0: gfx_resetBlitOffset ---- */
int FAR CDECL gfx_resetBlitOffset(void)
{
    GfxState FAR *s = gfx_getState();
    s->blitOffset = 0;
    return 0;
}

/* ---- Slot 0x1a: gfx_setBlitOffset ---- */
int FAR CDECL gfx_setBlitOffset(int offset)
{
    GfxState FAR *s = gfx_getState();
    s->blitOffset = (uint16)offset;
    return 0;
}

/* ---- Slot 0x25: gfx_dirtyRect ---- */
int FAR CDECL gfx_dirtyRect(void)
{
    /* Register-called in overlay — stub for now */
    return 0;
}

/* ---- Slot 0x01: gfx_fillDirty ---- */
int FAR CDECL gfx_fillDirty(void)
{
    /* Register-called in overlay — stub for now */
    return 0;
}

/* ---- Font data ---- */

/* Font width tables extracted from MGRAPHIC.EXE */
static uint8 g_font1_widths[96] = {
    5,2,4,7,6,8,8,2,3,3,6,6,3,4,2,8,8,3,6,6,7,6,6,6,6,6,2,3,5,5,5,6,
    8,8,6,7,8,6,6,8,8,2,6,6,6,8,8,8,6,8,6,6,6,6,6,8,8,8,8,4,8,4,6,8,
    2,6,6,5,6,6,4,6,6,2,3,6,2,8,6,6,6,6,5,6,4,6,6,8,6,6,6,4,2,4,5,8};
static uint8 g_font3_widths[96] = {
    3,2,4,5,4,5,5,2,3,3,6,4,3,4,2,4,5,3,5,5,5,5,5,5,5,5,2,3,4,4,4,5,
    5,5,5,5,5,5,5,5,5,2,5,5,5,6,5,5,5,5,5,5,4,5,6,6,6,6,6,3,6,3,4,5,
    2,4,4,4,4,4,3,4,4,2,3,4,2,6,4,4,4,4,4,4,4,4,4,6,4,4,4,4,2,3,3,5};
static uint8 g_font4_widths[96] = {
    4,2,4,6,4,7,6,2,3,4,4,4,3,5,2,7,5,3,5,5,6,5,5,5,5,5,2,3,4,5,4,5,
    7,6,5,6,6,5,5,7,7,2,5,5,5,6,6,7,5,7,5,5,4,5,6,8,7,8,7,3,7,3,6,6,
    2,5,5,4,5,5,3,5,5,2,3,5,2,8,5,5,5,5,5,5,4,5,6,8,5,5,5,4,2,4,5,7};
static uint8 g_font5_widths[96] = {
    3,2,4,5,4,5,5,2,3,3,6,4,3,4,2,4,5,3,5,5,5,5,5,5,5,5,2,3,4,4,4,5,
    5,5,5,5,5,5,5,5,5,2,5,5,5,6,5,5,5,5,5,5,4,5,6,6,6,6,6,3,6,3,4,5,
    2,4,4,4,4,4,3,4,4,2,3,4,2,6,4,4,4,4,4,4,4,4,4,6,4,4,4,4,2,3,3,5};

static uint8 *g_fontWidthTables[8] = {
    NULL, g_font1_widths, NULL, g_font3_widths,
    g_font4_widths, g_font5_widths, NULL, NULL
};
static uint8 g_fontHeightsArr[8] = {5, 8, 7, 6, 7, 6, 4, 0};
static uint8 g_fontMaxWidths[8] = {8, 8, 6, 6, 8, 6, 0, 0};

/* Bitmap pointers per font index — NULL means no bitmap available */
static uint8 *g_fontBitmapPtrs[8] = {
    NULL, (uint8 *)g_font1_bitmaps, NULL, (uint8 *)g_font3_bitmaps,
    (uint8 *)g_font4_bitmaps, (uint8 *)g_font5_bitmaps, NULL, NULL
};
static uint8 g_fontBitmapRowSize[8] = {0, 8, 0, 6, 7, 6, 0, 0};

/* ---- Slot 0x05: gfx_drawString ---- */
int FAR CDECL gfx_drawString(int16 *pageNum, const char *string)
{
    GfxState FAR *s = gfx_getState();
    uint16 dseg;
    uint8 FAR *heightsFar;
    uint8 FAR *rowSizeFar;
    uint8 * FAR *bmpPtrsFar;
    uint8 * FAR *wtPtrsFar;
    uint16 x, y, color;
    uint8 far *page;
    int i;
    uint8 ch;
    int row, col;
    uint16 fontIdx;
    uint8 height;
    uint8 FAR *bitmaps;
    uint8 FAR *wt;

    if (!string || !pageNum) return 0;

    /* The font tables live in f15's DGROUP. When a child far-calls in, DS is
     * the child's DGROUP (no font data there), so reach the tables via
     * f15DataSeg (Finding A). The g_fontBitmapPtrs / g_fontWidthTables ENTRIES
     * are themselves near offsets into f15's DGROUP, so each selected entry
     * must be re-based on f15DataSeg as well before it can be dereferenced. */
    dseg       = s->f15DataSeg;
    heightsFar = (uint8 FAR *)MK_FP(dseg, (uint16)g_fontHeightsArr);
    rowSizeFar = (uint8 FAR *)MK_FP(dseg, (uint16)g_fontBitmapRowSize);
    bmpPtrsFar = (uint8 * FAR *)MK_FP(dseg, (uint16)g_fontBitmapPtrs);
    wtPtrsFar  = (uint8 * FAR *)MK_FP(dseg, (uint16)g_fontWidthTables);

    x = (uint16)pageNum[4];
    y = (uint16)pageNum[5];
    color = (uint16)pageNum[2];
    fontIdx = (uint16)pageNum[6] & 7;
    height = heightsFar[fontIdx];
    bitmaps = bmpPtrsFar[fontIdx]
        ? (uint8 FAR *)MK_FP(dseg, (uint16)bmpPtrsFar[fontIdx]) : (uint8 FAR *)0;
    wt = wtPtrsFar[fontIdx]
        ? (uint8 FAR *)MK_FP(dseg, (uint16)wtPtrsFar[fontIdx]) : (uint8 FAR *)0;

    /* pageNum/string are caller-passed NEAR pointers — they correctly resolve
     * against the caller's DS, so they must NOT be re-based on f15DataSeg. */
    page = (uint8 far *)MK_FP(s->pageSegs[pageNum[0]], 0);

    for (i = 0; string[i] != 0 && i < 256; i++) {
        ch = (uint8)string[i];

        /* Inline color escape: chars >= 0x80 change the text color.
         * The new color is (ch & 0x7F). No glyph is drawn. */
        if (ch & 0x80) {
            color = ch & 0x7F;
            continue;
        }

        if (x + 8 > 320) break;
        if (y + height > 200) break;

        if (bitmaps && ch >= 0x20) {
            uint8 FAR *glyph = bitmaps + (ch - 0x20) * (uint16)rowSizeFar[fontIdx];
            for (row = 0; row < height; row++) {
                uint8 bits = glyph[row];
                uint16 rowOff = s->rowOffsets[y + row] + x;
                for (col = 0; col < 8; col++) {
                    if (bits & 0x80) {
                        page[rowOff + col] = (uint8)color;
                    }
                    bits <<= 1;
                }
            }
        }
        x += wt ? (ch >= 0x20 ? wt[ch-0x20] : 8) : 8;
    }

    /* Update x position and color in page struct */
    pageNum[4] = (int16)x;
    pageNum[2] = (int16)color;
    return 0;
}

/* ---- Slot 0x2a: gfx_copyRect ---- */
int FAR CDECL gfx_copyRect(int srcPage, uint16 srcX, uint16 srcY,
                            int dstPage, uint16 dstX, uint16 dstY,
                            int width, int height)
{
    GfxState FAR *s = gfx_getState();
    int row;

    for (row = 0; row < height; row++) {
        uint16 sOff = s->rowOffsets[srcY + row] + (uint16)srcX;
        uint16 dOff = s->rowOffsets[dstY + row] + (uint16)dstX;
        movedata(s->pageSegs[srcPage], sOff, s->pageSegs[dstPage], dOff, (uint16)width);
    }
    return 0;
}

/* ---- Slot 0x02: gfx_blitTransparent ---- */
int FAR CDECL gfx_blitTransparent(void)
{
    /* TODO: implement transparent blit */
    return 0;
}

/* ---- Slot 0x29: gfx_switchColor ---- */
int FAR CDECL gfx_switchColor(int16 *pageDesc, int x1, int y1,
                               int x2, int y2, int oldColor, int newColor)
{
    GfxState FAR *s = gfx_getState();
    uint16 pageSeg;
    uint8 far *page;
    int row, col;

    pageSeg = s->pageSegs[*pageDesc];
    page = (uint8 far *)MK_FP(pageSeg, 0);

    for (row = y1; row <= y2; row++) {
        uint16 off = s->rowOffsets[row];
        for (col = x1; col <= x2; col++) {
            if (page[off + col] == (uint8)oldColor)
                page[off + col] = (uint8)newColor;
        }
    }
    return 0;
}

/* ---- Slot 0x44: gfx_setDac ---- */
/* Palette data extracted from original MGRAPHIC.EXE overlay */
static uint8 g_palettes[5][48] = {
    /* Palette 0: standard VGA 16-color */
    {0x00,0x00,0x00, 0x00,0x00,0x2a, 0x00,0x2a,0x00, 0x00,0x2a,0x2a,
     0x2a,0x00,0x00, 0x2a,0x00,0x2a, 0x2a,0x15,0x00, 0x2a,0x2a,0x2a,
     0x15,0x15,0x15, 0x15,0x15,0x3f, 0x15,0x3f,0x15, 0x15,0x3f,0x3f,
     0x3f,0x15,0x15, 0x3f,0x15,0x3f, 0x3f,0x3f,0x15, 0x3f,0x3f,0x3f},
    /* Palette 1: magenta darkened */
    {0x00,0x00,0x00, 0x00,0x00,0x2a, 0x00,0x2a,0x00, 0x00,0x2a,0x2a,
     0x2a,0x00,0x00, 0x00,0x00,0x00, 0x2a,0x15,0x00, 0x2a,0x2a,0x2a,
     0x15,0x15,0x15, 0x15,0x15,0x3f, 0x15,0x3f,0x15, 0x15,0x3f,0x3f,
     0x3f,0x15,0x15, 0x3f,0x15,0x3f, 0x3f,0x3f,0x15, 0x3f,0x3f,0x3f},
    /* Palette 2: bright red/yellow zeroed */
    {0x00,0x00,0x00, 0x00,0x00,0x2a, 0x00,0x2a,0x00, 0x00,0x2a,0x2a,
     0x2a,0x00,0x00, 0x2a,0x00,0x2a, 0x2a,0x15,0x00, 0x2a,0x2a,0x2a,
     0x15,0x15,0x15, 0x15,0x15,0x3f, 0x15,0x3f,0x15, 0x15,0x3f,0x3f,
     0x3f,0x15,0x15, 0x00,0x00,0x00, 0x3f,0x3f,0x15, 0x3f,0x3f,0x3f},
    /* Palette 3: all black (fade out) */
    {0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00,
     0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00,
     0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00,
     0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00},
    /* Palette 4: green zeroed */
    {0x00,0x00,0x00, 0x00,0x00,0x2a, 0x00,0x00,0x00, 0x00,0x2a,0x2a,
     0x2a,0x00,0x00, 0x2a,0x00,0x2a, 0x2a,0x15,0x00, 0x2a,0x2a,0x2a,
     0x15,0x15,0x15, 0x15,0x15,0x3f, 0x00,0x00,0x00, 0x15,0x3f,0x3f,
     0x3f,0x15,0x15, 0x3f,0x15,0x3f, 0x3f,0x3f,0x15, 0x3f,0x3f,0x3f}
};

void FAR CDECL gfx_setDac(uint16 palIdx)
{
    union REGS regs;
    struct SREGS sregs;
    GfxState FAR *s;
    if (palIdx > 4) return;
    /* INT 10h AX=1012h: set block of DAC color registers */
    regs.x.ax = 0x1012;
    regs.x.bx = 0;       /* first register */
    regs.x.cx = 16;      /* number of registers */
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
int FAR CDECL gfx_setColor(int color)
{
    GfxState FAR *s = gfx_getState();
    s->fillColor = (uint8)color;
    return 0;
}

/* ---- Stubs for remaining slots ---- */
int FAR CDECL gfx_initOverlay(void)              { return 0; }
/* Slot 0x0d: register-called via the _gfx_setPage1 shim (regshim.asm) — AX = a
 * page index; curPageSeg = pageSegs[AX]. MGRAPHIC's slot 0x0d takes the index in
 * AX (the name is a misnomer); clearRect uses it to select the page to clear. */
int gfx_setPage1_impl(uint16 page)
{
    GfxState FAR *s = gfx_getState();
    if (page < 16)
        s->curPageSeg = s->pageSegs[page];
    return (int)s->curPageSeg;
}
/* Slot 0x10: called via the _gfx_getCurPageSeg2 shim, which preserves ES (a
 * gfx_getState() call here loads ES, and clearRect needs ES kept across this). */
int gfx_getCurPageSeg2_impl(void)
{
    GfxState FAR *s = gfx_getState();
    return (int)s->curPageSeg;
}
int FAR CDECL gfx_getCurPage(int page)
{
    GfxState FAR *s = gfx_getState();
    return (int)s->pageSegs[page];
}
int FAR CDECL gfx_blitSprite(struct SpriteParams *p)
{
    GfxState FAR *s = gfx_getState();
    uint16 srcSeg, dstSeg;
    int row, col;
    uint16 srcOff, dstOff;
    uint8 rowBuf[320];
    int w;

    if (!p) return 0;
    srcSeg = p->bufPtr;
    dstSeg = s->pageSegs[p->page];
    w = p->width;

    if (!(p->flags & 0x10)) {
        /* Opaque blit — use movedata per row */
        for (row = 0; row < p->height; row++) {
            srcOff = s->rowOffsets[p->srcY + row] + (uint16)p->srcX;
            dstOff = s->rowOffsets[p->dstY + row] + (uint16)p->dstX;
            movedata(srcSeg, srcOff, dstSeg, dstOff, (uint16)w);
        }
    } else {
        /* Transparent blit — read row to near buffer, write non-zero pixels */
        struct SREGS sr;
        uint16 dsSeg;
        segread(&sr);
        dsSeg = sr.ds;
        for (row = 0; row < p->height; row++) {
            uint8 far *dst;
            srcOff = s->rowOffsets[p->srcY + row] + (uint16)p->srcX;
            dstOff = s->rowOffsets[p->dstY + row] + (uint16)p->dstX;
            movedata(srcSeg, srcOff, dsSeg, (uint16)(void near *)rowBuf, (uint16)w);
            dst = (uint8 far *)MK_FP(dstSeg, dstOff);
            for (col = 0; col < w; col++) {
                if (rowBuf[col] != 0) {
                    dst[col] = rowBuf[col];
                }
            }
        }
    }
    return 0;
}
int FAR CDECL gfx_drawLine(uint16 x1, uint16 y1, uint16 x2, uint16 y2)
{
    GfxState FAR *s = gfx_getState();
    /* Bresenham line algorithm drawing to current page */
    uint8 far *page = (uint8 far *)MK_FP(s->curPageSeg, 0);
    int x0 = x1, y0 = y1, x1_target = x2, y1_target = y2;
    int dx = x1_target - x0;
    int dy = y1_target - y0;
    int sx = dx >= 0 ? 1 : -1;
    int sy = dy >= 0 ? 1 : -1;
    int err, e2;
    if (dx < 0) dx = -dx;
    if (dy < 0) dy = -dy;
    err = dx - dy;
    for (;;) {
        if ((unsigned)x0 < 320 && (unsigned)y0 < 200)
            page[s->rowOffsets[y0] + x0] = s->fillColor;
        if (x0 == x1_target && y0 == y1_target) break;
        e2 = err * 2;
        if (e2 > -dy) { err -= dy; x0 += sx; }
        if (e2 < dx)  { err += dx; y0 += sy; }
    }
    return 0;
}
/* Slot 0x20: register-called via the _gfx_setPageDirect shim — AH = fill colour.
 * Stores the clearRect/fill colour (MGRAPHIC slot 0x20 = `mov [fillColor],ah`). */
void gfx_setFillColor_impl(uint16 color)
{
    gfx_getState()->fillColor = (uint8)color;
}
int FAR CDECL gfx_resetBlitOffset2(void) { return 0; }
/* Slot 0x25/0x28: register-called via the _gfx_dirtyRect2 shim — BX = near offset
 * of the per-row dirtyMinBuf (in the caller's DS), AX = yMin, CX = yMax. The
 * matching dirtyMaxBuf sits 0x1b8 bytes after dirtyMinBuf. For each row y in
 * [yMin..yMax] fill the span [minBuf[y]..maxBuf[y]] of curPageSeg with fillColor.
 * This is the actual rectangle clear behind clearRect (MGRAPHIC slot 0x25==0x28).
 * A row whose min==max==0 or ==0x13F is treated as empty and skipped, matching
 * the original's range guard. */
void gfx_dirtyRectFill_impl(uint16 minBufOff, uint16 yMin, uint16 yMax)
{
    GfxState FAR *s = gfx_getState();
    const uint16 *minBuf = (const uint16 *)minBufOff;            /* caller's DS */
    const uint16 *maxBuf = (const uint16 *)(minBufOff + 0x1b8);
    uint8 fill = s->fillColor;
    uint16 seg = s->curPageSeg;
    int y;
    if ((int16)yMin < 0) return;
    for (y = (int)yMax; y >= (int)yMin; y--) {
        uint16 minx = minBuf[y];
        uint16 maxx = maxBuf[y];
        uint16 width, col;
        uint8 far *dst;
        if (maxx < minx) continue;
        if (maxx == minx && (maxx == 0 || maxx == 0x13f)) continue;
        width = maxx - minx + 1;
        dst = (uint8 far *)MK_FP(seg, s->rowOffsets[y] + s->blitOffset + minx);
        for (col = 0; col < width; col++)
            dst[col] = fill;
    }
}
int FAR CDECL gfx_getDisplayPage(uint16 page)
{
    GfxState FAR *s = gfx_getState();
    return (int)s->pageSegs[page];
}

int FAR CDECL gfx_setFont(uint16 ch, uint16 fontIdx)
{
    /* Returns the pixel advance width of a single character. stringWidth()
     * sums this over a string to centre text, so it MUST agree with the
     * x-advance gfx_drawString uses (wt[ch-0x20]); otherwise centred text
     * lands off-screen and drawString's clip test discards every glyph.
     * The width tables live in f15's DGROUP, reached via f15DataSeg (Finding A),
     * exactly as gfx_drawString rebases them. */
    GfxState FAR *s = gfx_getState();
    uint16 dseg = s->f15DataSeg;
    uint8 * FAR *wtPtrsFar = (uint8 * FAR *)MK_FP(dseg, (uint16)g_fontWidthTables);
    uint8 FAR *wt;
    if (fontIdx >= 8) return 8;
    /* Chars >= 0x80 are inline color escapes - no glyph, no width */
    if (ch >= 0x80) return 0;
    wt = wtPtrsFar[fontIdx]
        ? (uint8 FAR *)MK_FP(dseg, (uint16)wtPtrsFar[fontIdx]) : (uint8 FAR *)0;
    if (!wt || ch < 0x20) return 8;
    return wt[ch - 0x20];
}
int FAR CDECL gfx_getAuxBufSize(void) { return 0x1950; }
int FAR CDECL gfx_fontSetup(uint16 ch, uint16 fontIdx)
{
    GfxState FAR *s = gfx_getState();
    /* Store font settings in state */
    (void)ch;
    (void)fontIdx;
    return 0;
}
/* gfx_fillRow (0x33) and gfx_copyRow (0x35) are register-called: their slot
 * symbols are asm shims in regshim.asm -> gfx_fillRow_impl / gfx_copyRow_impl
 * above. Slot 0x34 (fillRow2) is IDENTICAL to slot 0x33 in MGRAPHIC (both
 * `rep movsw` the decoded row to ES:DI), so slot 0x34 points at the same
 * gfx_fillRow shim — decodePic (pic_decodepic.inc) uses it to fill the
 * caller's sprite buffer. This unused stub is kept only for legacy linkage. */
int FAR CDECL gfx_fillRow2(uint16 x, uint16 y)
{
    (void)x;
    (void)y;
    return 0;
}
int FAR CDECL gfx_nop36(void) { return 0; }
int FAR CDECL gfx_nop37(void) { return 0; }
int FAR CDECL gfx_setFadeSteps(int steps) { (void)steps; return 0; }
int FAR CDECL gfx_calcRowAddr(int y, int x)
{
    GfxState FAR *s = gfx_getState();
    if (!s->rowOffsetsReady) return (int)(y * 320 + x);
    return (int)(s->rowOffsets[y] + x);
}
int FAR CDECL gfx_setOvlVal1(int val) { (void)val; return 0; }
int FAR CDECL gfx_setOvlVal2(int val) { (void)val; return 0; }
int FAR CDECL gfx_getBlitOffset(void)
{
    GfxState FAR *s = gfx_getState();
    return (int)s->blitOffset;
}
int FAR CDECL gfx_getModeFlag(void)
{
    GfxState FAR *s = gfx_getState();
    return (int)s->modeFlag;
}
int FAR CDECL gfx_getModeFlag2(void)
{
    GfxState FAR *s = gfx_getState();
    return (int)s->modeFlag;
}
int FAR CDECL gfx_getVal(uint16 val) { return (int)val; }
int FAR CDECL gfx_getVal2(uint16 val) { return (int)val; }
int FAR CDECL gfx_setDacAnimCount(uint16 count)
{
    GfxState FAR *s = gfx_getState();
    s->dacCounter = (uint8)count;
    return 0;
}
int FAR CDECL gfx_commitPage(void)
{
    GfxState FAR *s = gfx_getState();
    /* Original slot 0x50 is RETF (no-op) - end.exe draws directly to VGA.
     * Only copy if we're drawing to a back buffer. */
    if (s->pageSegs[0] != 0xA000 && s->pageSegs[0] != 0) {
        movedata(s->pageSegs[0], 0, 0xA000, 0, 64000u);
    }
    return 0;
}
int FAR CDECL gfx_nop51(void) { return 0; }
int FAR CDECL gfx_setMonoFlag(uint16 mono) { (void)mono; return 0; }
int FAR CDECL gfx_blitSpriteClipped(int16 *ptr) { return gfx_blitSprite((struct SpriteParams *)ptr); }
int FAR CDECL gfx_blitSpriteClipped2(void) { return 0; }
int FAR CDECL gfx_blitSpriteOpaque(int16 *ptr) { return gfx_blitSprite((struct SpriteParams *)ptr); }
int FAR CDECL gfx_blitSpriteOpaque2(void) { return 0; }

/* ---- Slot 0x30: gfx_blitToCurrent ---- */
int FAR CDECL gfx_blitToCurrent(int16 pagePtr)
{
    GfxState FAR *s = gfx_getState();
    movedata((uint16)pagePtr, 0, s->curPageSeg, 0, 64000u);
    return 0;
}

/* ---- Stubs for declared-but-unimplemented slots ---- */
int FAR CDECL gfx_blitVariant(void)        { return 0; }
int FAR CDECL gfx_copyBlock(void)           { return 0; }
int FAR CDECL gfx_drawStringUnclipped(void) { return 0; }
int FAR CDECL gfx_clipRight(void)           { return 0; }
int FAR CDECL gfx_clipTop(void)             { return 0; }
int FAR CDECL gfx_clipLeft(void)            { return 0; }
int FAR CDECL gfx_clipBottom(void)          { return 0; }
int FAR CDECL gfx_complexRender(void)       { return 0; }
int FAR CDECL gfx_blitCore(void)            { return 0; }
int FAR CDECL gfx_spriteVariant1(void)      { return 0; }
int FAR CDECL gfx_spriteVariant2(void)      { return 0; }
int FAR CDECL gfx_nop15(void)              { return 0; }
int FAR CDECL gfx_nop16(void)              { return 0; }
int FAR CDECL gfx_setBlitOffset2(void)      { GfxState FAR *s=gfx_getState(); s->blitOffset=0; return 0; }
int FAR CDECL gfx_setBlitOffset3(void)      { GfxState FAR *s=gfx_getState(); s->blitOffset=0; return 0; }
int FAR CDECL gfx_getAuxSize(void)          { return 0x1950; }
int FAR CDECL gfx_setClipVal1(void)         { return 0; }
int FAR CDECL gfx_setClipVal2(void)         { return 0; }
int FAR CDECL gfx_nop24(void)              { return 0; }
int FAR CDECL gfx_storePageSeg(void)        { return 0; }
int FAR CDECL gfx_setPageSeg(void)          { return 0; }
int FAR CDECL gfx_unknown2b(void)           { return 0; }
int FAR CDECL gfx_dacAnimate(void)          { GfxState FAR *s=gfx_getState(); return 0; }
int FAR CDECL gfx_unknown2e(void)           { return 0; }
int FAR CDECL gfx_setPageBuf(void)          { return 0; }
int FAR CDECL gfx_unknown43(void)           { return 0; }

/* ---- Slot function pointer table (84 entries, slots 0x00–0x53) ---- */
/* MSC 5.1 forbids cast expressions in static initializers (C2097), so this
 * array starts zero-initialised and is filled at runtime by gfx_buildVirtualOverlay. */
GfxSlotFn gfxSlotTable[0x54];

static void fillSlotTable(void)
{
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
    gfxSlotTable[0x0f] = (GfxSlotFn)gfx_getCurPageSeg;
    gfxSlotTable[0x10] = (GfxSlotFn)gfx_getCurPageSeg2;
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
    gfxSlotTable[0x1b] = (GfxSlotFn)gfx_getAuxSize;
    gfxSlotTable[0x1c] = (GfxSlotFn)gfx_getBlitOffset;
    gfxSlotTable[0x1d] = (GfxSlotFn)gfx_setClipVal1;
    gfxSlotTable[0x1e] = (GfxSlotFn)gfx_setClipVal2;
    gfxSlotTable[0x1f] = (GfxSlotFn)gfx_drawLine;
    gfxSlotTable[0x20] = (GfxSlotFn)gfx_setPageDirect;
    gfxSlotTable[0x21] = (GfxSlotFn)gfx_setColor;
    gfxSlotTable[0x22] = (GfxSlotFn)gfx_resetBlitOffset;
    gfxSlotTable[0x23] = (GfxSlotFn)gfx_resetBlitOffset2;
    gfxSlotTable[0x24] = (GfxSlotFn)gfx_nop24;
    gfxSlotTable[0x25] = (GfxSlotFn)gfx_dirtyRect2; /* 0x25 == 0x28 in MGRAPHIC */
    gfxSlotTable[0x26] = (GfxSlotFn)gfx_storePageSeg;
    gfxSlotTable[0x27] = (GfxSlotFn)gfx_setPageSeg;
    gfxSlotTable[0x28] = (GfxSlotFn)gfx_dirtyRect2;
    gfxSlotTable[0x29] = (GfxSlotFn)gfx_switchColor;
    gfxSlotTable[0x2a] = (GfxSlotFn)gfx_copyRect;
    gfxSlotTable[0x2b] = (GfxSlotFn)gfx_unknown2b;
    gfxSlotTable[0x2c] = (GfxSlotFn)gfx_dacAnimate;
    gfxSlotTable[0x2d] = (GfxSlotFn)gfx_getDisplayPage;
    gfxSlotTable[0x2e] = (GfxSlotFn)gfx_unknown2e;
    gfxSlotTable[0x2f] = (GfxSlotFn)gfx_setFont;
    gfxSlotTable[0x30] = (GfxSlotFn)gfx_blitToCurrent;
    gfxSlotTable[0x31] = (GfxSlotFn)gfx_getAuxBufSize;
    gfxSlotTable[0x32] = (GfxSlotFn)gfx_fontSetup;
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
    gfxSlotTable[0x43] = (GfxSlotFn)gfx_unknown43;
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
void gfx_buildVirtualOverlay(uint16 ovlSeg)
{
    uint16 codeSeg;
    int i;
    uint16 FAR *base;
    GfxState FAR *s;

    /* Populate slot table */
    fillSlotTable();

    /* Get f15.exe's code segment via a far pointer to a FAR-declared gfx function.
     * In small model, FAR functions still reside in the one code segment (CS),
     * so FP_SEG of any FAR function pointer gives CS. */
    {
        typedef int (FAR *FarFn)(void);
        FarFn fp = (FarFn)gfx_allocPage;
        codeSeg = FP_SEG(fp);
    }

    /* Zero the entire 80-paragraph (1280-byte) block */
    base = (uint16 FAR *)MK_FP(ovlSeg, 0);
    for (i = 0; i < 640; i++)
        base[i] = 0;

    /* OvlHeader fields read by setupOverlaySlots (lowlvl.asm) */
    *(uint16 FAR *)MK_FP(ovlSeg, 0x18) = codeSeg; /* OVL_HDR_CODESEG  */
    *(uint16 FAR *)MK_FP(ovlSeg, 0x1C) = 0;        /* OVL_HDR_FIRSTIDX */
    *(uint16 FAR *)MK_FP(ovlSeg, 0x22) = 0x54;     /* OVL_HDR_SLOTCOUNT */

    /* Slot offset table at 0x24 (immediately after slotCount@0x22): one uint16
     * per slot. This is where the ASM setupOverlaySlots (overlay_slots.inc reads
     * `mov si,24h`) expects it — NOT 0x244. */
    for (i = 0; i < 0x54; i++)
        *(uint16 FAR *)MK_FP(ovlSeg, 0x24 + i * 2) = (uint16)gfxSlotTable[i];

    /* Initialize GfxState defaults */
    s = (GfxState FAR *)MK_FP(ovlSeg, GFX_STATE_OFFSET);
    s->modeFlag = 1;
    s->rowOffsetsReady = 0;
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
int FAR CDECL ovl_nop(void)            { return 0; }

/* Misc/input slots (0x5a-0x5f), reimplemented faithfully from MISC.EXE so the
 * pure-DOS build has working keyboard input without loading MISC.EXE.
 *
 * Original MISC.EXE disassembly:
 *   0x5a keybuf: mov ah,1; int 16h; jz empty; sub ax,ax; retf  (0 = key avail)
 *                empty: sub ax,ax; not ax; retf                (0xFFFF = empty)
 *   0x5b getkey: sub ah,ah; int 16h; retf  (raw BIOS AX: AH=scan, AL=ascii;
 *                callers in processStoreInput mask &0xff when AL!=0)
 *   0x5e clearKeyFlags: zero the low nibble of BDA 0040:0417 (shift state) */

/* Slot 0x5a: 0 if a key is waiting, 0xFFFF if the buffer is empty. INT 16h
 * AH=01h sets ZF when empty, but int86() does not expose ZF — so test the
 * BIOS keyboard buffer head/tail (0040:001A / 0040:001C), which is exactly
 * what AH=01h inspects (equal => empty). */
int FAR CDECL miscStub_keybuf(void)
{
    uint16 FAR *head = (uint16 FAR *)MK_FP(0x40, 0x1a);
    uint16 FAR *tail = (uint16 FAR *)MK_FP(0x40, 0x1c);
    return (*head == *tail) ? (int)0xFFFF : 0;
}

/* Slot 0x5b: return the raw BIOS keystroke (AH=scancode, AL=ascii). Blocks
 * until a key is available, matching the original. */
int FAR CDECL miscStub_getkey(void)
{
    union REGS r;
    r.h.ah = 0;
    int86(0x16, &r, &r);
    return (int)r.x.ax;
}

int FAR CDECL miscStub_readJoy(void)       { return 0; }

/* Slot 0x5e: clear the active-modifier low nibble of the BDA shift-flags byte. */
int FAR CDECL miscStub_clearKeyFlags(void)
{
    uint8 FAR *flags = (uint8 FAR *)MK_FP(0x40, 0x17);
    *flags &= 0xf0;
    return 0;
}

/* Write an OvlHeader-compatible stub overlay covering `count` slots starting
 * at `firstIdx`, pointing each at the corresponding fn (an f15.exe offset). */
static void buildStubOverlay(uint16 ovlSeg, uint16 firstIdx, uint16 count,
                             const GfxSlotFn *fns)
{
    uint16 codeSeg;
    uint16 i;
    uint16 FAR *base;
    { typedef int (FAR *FarFn)(void);
      FarFn fp = (FarFn)ovl_nop;
      codeSeg = FP_SEG(fp); }
    /* zero the header region (0x00..0x23) plus the offset table */
    base = (uint16 FAR *)MK_FP(ovlSeg, 0);
    for (i = 0; i < (uint16)(0x12 + count); i++)
        base[i] = 0;
    *(uint16 FAR *)MK_FP(ovlSeg, 0x18) = codeSeg;
    *(uint16 FAR *)MK_FP(ovlSeg, 0x1C) = firstIdx;
    *(uint16 FAR *)MK_FP(ovlSeg, 0x22) = count;
    for (i = 0; i < count; i++)
        *(uint16 FAR *)MK_FP(ovlSeg, 0x24 + i * 2) = (uint16)fns[i];
}

void gfx_buildMiscOverlay(uint16 ovlSeg)
{
    GfxSlotFn fns[6];
    fns[0] = (GfxSlotFn)miscStub_keybuf;        /* 0x5a */
    fns[1] = (GfxSlotFn)miscStub_getkey;        /* 0x5b */
    fns[2] = (GfxSlotFn)ovl_nop;                /* 0x5c */
    fns[3] = (GfxSlotFn)miscStub_readJoy;       /* 0x5d */
    fns[4] = (GfxSlotFn)miscStub_clearKeyFlags; /* 0x5e */
    fns[5] = (GfxSlotFn)ovl_nop;                /* 0x5f */
    buildStubOverlay(ovlSeg, 0x5a, 6, fns);
}

void gfx_buildSoundOverlay(uint16 ovlSeg)
{
    GfxSlotFn fns[10];   /* slots 0x64-0x6d, all no-op (no sound) */
    int i;
    for (i = 0; i < 10; i++)
        fns[i] = (GfxSlotFn)ovl_nop;
    buildStubOverlay(ovlSeg, 0x64, 10, fns);
}
