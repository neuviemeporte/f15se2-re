/*
 * gfx_impl.c Pure-C replacement for MGRAPHIC.EXE overlay (Mode 13h, 320x200x256)
 */

#include "gfx_impl.h"
#include "struct.h"
#include "slot.h"
#include <dos.h>
#include <string.h>

#ifndef NULL
#define NULL ((void*)0)
#endif

/* dos_alloc is provided by lowlvl.asm (start.exe) or dosfunc.c (f15.exe) */
extern uint16 dos_alloc(uint16 size);

#include "fontdata.h"

/* movedata(src_seg, src_off, dst_seg, dst_off, count) from <memory.h>/<string.h>
 * is the closest thing to memcpy() for far memory in MSC 5.1.
 * It uses rep movsw internally. We use it directly everywhere.
 */

/* ---- Internal state (replaces cs: and ds: overlay variables) ---- */

static uint16 g_rowOffsets[200];        /* cs:0x0e - precomputed row*320 */
static uint16 g_curPageSeg;             /* cs:0x19e */
static uint16 g_blitOffset;             /* cs:0x1a0 */
static uint8  g_modeFlag = 1;           /* cs:0x1a2 */
static uint16 g_pageSegs[16];           /* cs:0x681 */
static uint8  g_fillColor;              /* ds:0x1b7a */
static uint8  g_dacCounter;             /* cs:0x9b2 */
static uint8  g_rowOffsetsReady = 0;

/* Initialize row offset table */
static void initRowOffsets(void)
{
    int i;
    if (g_rowOffsetsReady) return;
    for (i = 0; i < 200; i++)
        g_rowOffsets[i] = (uint16)(i * 320);
    g_rowOffsetsReady = 1;
}

/* ---- Slot 0x00: gfx_allocPage ---- */
int FAR CDECL gfx_allocPage(int pageNum)
{
    uint16 seg;
    union REGS r;
    initRowOffsets();
    /* In the original game, the MGRAPHIC overlay persists across exes and
     * gfx_setMode13 was already called by start.exe. In our NO_ASM build,
     * each exe has fresh static state. Bootstrap mode 13h on first use. */
    if (g_pageSegs[0] == 0) {
        gfx_setMode13(0);
    }
    /* Allocate 0x1000 paragraphs = 64KB directly via INT 21h */
    r.h.ah = 0x48;
    r.x.bx = 0x1000;
    intdos(&r, &r);
    seg = r.x.cflag ? 0 : r.x.ax;
    if (seg == 0) return 0;
    /* Don't overwrite page 0 if it's already the VGA framebuffer.
     * end.exe draws directly to 0xA000; gfx_setPageN(0) must keep
     * returning 0xA000 so all rendering is immediately visible. */
    if (pageNum != 0 || g_pageSegs[0] != 0xA000) {
        g_pageSegs[pageNum] = seg;
    }
    return (int)seg;
}

/* ---- Slot 0x3c: gfx_setMode13 ---- */
int FAR CDECL gfx_setMode13(int16 monoFlag)
{
    union REGS regs;

    (void)monoFlag;

    initRowOffsets();

    /* Set video mode 13h */
    regs.x.ax = 0x0013;
    int86(0x10, &regs, &regs);

    /* Verify */
    regs.h.ah = 0x0F;
    int86(0x10, &regs, &regs);
    if (regs.h.al != 0x13) return -1;

    /* Clear page 0 (VGA framebuffer) */
    g_pageSegs[0] = 0xA000;
    g_curPageSeg = g_pageSegs[1]; /* default to back buffer */
    g_modeFlag = 1;


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
    /* In the original MGRAPHIC overlay, this is just a retrace wait +
     * CRT register tweak. It does NOT copy memory. end.exe draws
     * directly to 0xA000 (curPageSeg = VGA framebuffer). */
    gfx_waitRetrace();
    if (g_curPageSeg != 0xA000) {
        movedata(g_curPageSeg, 0, 0xA000, 0, 64000u);
    }
    return 0;
}

/* ---- Slot 0x4b: gfx_storeBufPtr ---- */
int FAR CDECL gfx_storeBufPtr(uint16 seg, int pageIdx)
{
    g_pageSegs[pageIdx] = seg;
    return 0;
}

/* ---- Slot 0x3b: gfx_clearPage ---- */
int FAR CDECL gfx_clearPage(void)
{
    uint8 far *p = (uint8 far *)MK_FP(g_curPageSeg, 0);
    uint16 i;
    /* Clear 64000 bytes (32000 words) */
    for (i = 0; i < 32000u; i++) {
        ((uint16 far *)p)[i] = 0;
    }
    return 0;
}

/* ---- Slot 0x0e: gfx_setPageN ---- */
int FAR CDECL gfx_setPageN(uint16 pageNum)
{
    if (g_pageSegs[0] == 0) {
        gfx_setMode13(0);
    }
    g_curPageSeg = g_pageSegs[pageNum];
    return 0;
}

/* ---- Slot 0x0f: gfx_getCurPageSeg ---- */
int FAR CDECL gfx_getCurPageSeg(void)
{
    return (int)g_curPageSeg;
}

/* ---- Slot 0x17: gfx_getBufSize ---- */
int FAR CDECL gfx_getBufSize(void)
{
    return 0x5580; /* 21888 bytes — sprite buffer size (matches real overlay) */
}

/* ---- Slot 0x3a: gfx_getRowOffset ---- */
/* Note: register-called in overlay (y in DI). Stub for NO_ASM. */
int FAR CDECL gfx_getRowOffset(void)
{
    /* TODO: need register-call wrapper or rework callers */
    return 0;
}

/* ---- Slot 0x38: gfx_getPageSeg ---- */
/* Note: register-called in overlay. Stub for NO_ASM. */
int FAR CDECL gfx_getPageSeg(void)
{
    /* TODO: need register-call wrapper or rework callers */
    return 0;
}

/* ---- Slot 0x3f: gfx_getModecode ---- */
int FAR CDECL gfx_getModecode(void)
{

    return 3; /* MCGA mode code */
}

/* ---- Slot 0x22: gfx_resetBlitOffset ---- */
int FAR CDECL gfx_resetBlitOffset(void)
{
    g_blitOffset = 0;
    return 0;
}

/* ---- Slot 0x1a: gfx_setBlitOffset ---- */
int FAR CDECL gfx_setBlitOffset(int offset)
{
    g_blitOffset = (uint16)offset;
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
    uint16 x, y, color;
    uint8 far *page;
    int i;
    uint8 ch;
    int row, col;
    uint16 fontIdx;
    uint8 height;
    uint8 *bitmaps;
    uint8 *wt;

    if (!string) return 0;

    x = (uint16)pageNum[4];
    y = (uint16)pageNum[5];
    color = (uint16)pageNum[2];
    fontIdx = (uint16)pageNum[6] & 7;
    height = g_fontHeightsArr[fontIdx];
    bitmaps = g_fontBitmapPtrs[fontIdx];
    wt = g_fontWidthTables[fontIdx];

    page = (uint8 far *)MK_FP(g_pageSegs[pageNum[0]], 0);

    for (i = 0; string[i] != '\0'; i++) {
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
            uint8 *glyph = bitmaps + (ch - 0x20) * (uint16)g_fontBitmapRowSize[fontIdx];
            for (row = 0; row < height; row++) {
                uint8 bits = glyph[row];
                uint16 rowOff = g_rowOffsets[y + row] + x;
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

    /* Update x position and color in page struct (the original overlay
     * writes back the color after inline escape codes modify it) */
    pageNum[4] = (int16)x;
    pageNum[2] = (int16)color;
    return 0;
}

/* ---- Slot 0x2a: gfx_copyRect ---- */
int FAR CDECL gfx_copyRect(int srcPage, uint16 srcX, uint16 srcY,
                            int dstPage, uint16 dstX, uint16 dstY,
                            int width, int height)
{
    int row;

    for (row = 0; row < height; row++) {
        uint16 sOff = g_rowOffsets[srcY + row] + (uint16)srcX;
        uint16 dOff = g_rowOffsets[dstY + row] + (uint16)dstX;
        movedata(g_pageSegs[srcPage], sOff, g_pageSegs[dstPage], dOff, (uint16)width);
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
    uint16 pageSeg;
    uint8 far *page;
    int row, col;

    pageSeg = g_pageSegs[*pageDesc];
    page = (uint8 far *)MK_FP(pageSeg, 0);

    for (row = y1; row <= y2; row++) {
        uint16 off = g_rowOffsets[row];
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
    if (palIdx > 4)
#ifdef BUGFIX
      return;
#else
      return 0;
#endif
    /* INT 10h AX=1012h: set block of DAC color registers */
    regs.x.ax = 0x1012;
    regs.x.bx = 0;       /* first register */
    regs.x.cx = 16;      /* number of registers */
#ifdef BUGFIX
    // make clang quiet
    regs.x.dx = 0; //(uint16)g_palettes[palIdx];
#else    
    regs.x.dx = (uint16)g_palettes[palIdx];
#endif
    segread(&sregs);
    sregs.es = sregs.ds;  /* ES:DX -> palette table */
    int86x(0x10, &regs, &regs, &sregs);
    gfx_waitRetrace();
#ifdef BUGFIX
    return;
#else
    return 0;
#endif
}

/* ---- Slot 0x21: gfx_setColor ---- */
int FAR CDECL gfx_setColor(int color)
{
    g_fillColor = (uint8)color;
    return 0;
}

/* ---- Stubs for remaining slots ---- */
int FAR CDECL gfx_initOverlay(void) { return 0; }
int FAR CDECL gfx_setPage1(void) { g_curPageSeg = g_pageSegs[1]; return 0; }
int FAR CDECL gfx_getCurPageSeg2(void) { return (int)g_curPageSeg; }
int FAR CDECL gfx_getCurPage(int page) { return (int)g_curPageSeg; }
int FAR CDECL gfx_blitSprite(struct SpriteParams *p)
{
    uint16 srcSeg, dstSeg;
    int row, col;
    uint16 srcOff, dstOff;
    uint8 rowBuf[320];
    int w;

    if (!p) return 0;
    srcSeg = p->bufPtr;
    dstSeg = g_pageSegs[p->page];
    w = p->width;

    if (!(p->flags & 0x10)) {
        /* Opaque blit — use movedata per row */
        for (row = 0; row < p->height; row++) {
            srcOff = g_rowOffsets[p->srcY + row] + (uint16)p->srcX;
            dstOff = g_rowOffsets[p->dstY + row] + (uint16)p->dstX;
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
            srcOff = g_rowOffsets[p->srcY + row] + (uint16)p->srcX;
            dstOff = g_rowOffsets[p->dstY + row] + (uint16)p->dstX;
#ifdef BUGFIX
            // make clang quiet
            movedata(srcSeg, srcOff, dsSeg, 0/*(uint16)(void near *)rowBuf*/, (uint16)w);
#else
            movedata(srcSeg, srcOff, dsSeg, (uint16)(void near *)rowBuf, (uint16)w);
#endif          
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
int FAR CDECL gfx_drawLine(void)
{
    /* Bresenham line using lineX1/Y1/X2/Y2 globals, draws to curPageSeg */
    extern int16 lineX1, lineY1, lineX2, lineY2;
    uint8 far *page = (uint8 far *)MK_FP(g_curPageSeg, 0);
    int x0 = lineX1, y0 = lineY1, x1 = lineX2, y1 = lineY2;
    int dx = x1 - x0;
    int dy = y1 - y0;
    int sx = dx >= 0 ? 1 : -1;
    int sy = dy >= 0 ? 1 : -1;
    int err, e2;
    if (dx < 0) dx = -dx;
    if (dy < 0) dy = -dy;
    err = dx - dy;
    for (;;) {
        if ((unsigned)x0 < 320 && (unsigned)y0 < 200)
            page[g_rowOffsets[y0] + x0] = g_fillColor;
        if (x0 == x1 && y0 == y1) break;
        e2 = err * 2;
        if (e2 > -dy) { err -= dy; x0 += sx; }
        if (e2 < dx)  { err += dx; y0 += sy; }
    }
    return 0;
}
int FAR CDECL gfx_setPageDirect(void) { return 0; }
int FAR CDECL gfx_resetBlitOffset2(void) { g_blitOffset = 0; return 0; }
int FAR CDECL gfx_dirtyRect2(void) { return 0; }
int FAR CDECL gfx_getDisplayPage(void) { return 0; }

int FAR CDECL gfx_setFont(uint16 ch, uint16 fontIdx)
{
    uint8 *widths;
    if (fontIdx >= 8) return 8;
    widths = g_fontWidthTables[fontIdx];
    if (!widths) return 8; /* fixed-width fallback */
    /* Chars >= 0x80 are inline color escapes — return 0 width
     * (matches original overlay behavior) */
    if (ch >= 0x80) return 0;
    if (ch < 0x20) return widths[0]; /* space width for control chars */
    return widths[ch - 0x20];
}
int FAR CDECL gfx_getAuxBufSize(void) { return 0x1950; }
int FAR CDECL gfx_fontSetup(void) { return 0; }
/* gfx_fillRow: ASM calling convention is DI=rowOffset, BP=srcBuf, BX=rowNum
 * In NO_ASM build, showPicFile is reimplemented in C and writes directly to page.
 * These stubs remain for any other callers. */
int FAR CDECL gfx_fillRow(void) { return 0; }
int FAR CDECL gfx_fillRow2(void) { return 0; }
int FAR CDECL gfx_copyRow(void) { return 0; }
int FAR CDECL gfx_nop36(void) { return 0; }
int FAR CDECL gfx_nop37(void) { return 0; }
int FAR CDECL gfx_setFadeSteps(int steps) { (void)steps; return 0; }
int FAR CDECL gfx_calcRowAddr(int y, int x) { return (int)(g_rowOffsets[y] + (uint16)x); }
int FAR CDECL gfx_setOvlVal1(int val) { return 0; }
int FAR CDECL gfx_setOvlVal2(int val) { return 0; }
int FAR CDECL gfx_getBlitOffset(void) { return (int)g_blitOffset; }
int FAR CDECL gfx_getModeFlag(void) { return (int)g_modeFlag; }
int FAR CDECL gfx_getModeFlag2(void) { return (int)g_modeFlag; }
int FAR CDECL gfx_getVal(void) { return 0; }
int FAR CDECL gfx_getVal2(void) { return 0; }
int FAR CDECL gfx_setDacAnimCount(uint16 count) { g_dacCounter = (uint8)count; return 0; }
int FAR CDECL gfx_commitPage(void)
{
    /* Original slot 0x50 is RETF (no-op) — end.exe draws directly to VGA.
     * Only copy if we're somehow drawing to a back buffer. */
    if (g_curPageSeg != 0xA000 && g_curPageSeg != 0) {
        movedata(g_curPageSeg, 0, 0xA000, 0, 64000u);
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
    movedata((uint16)pagePtr, 0, g_curPageSeg, 0, 64000u);
    return 0;
}
