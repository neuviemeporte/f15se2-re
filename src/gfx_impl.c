/*
 * gfx_impl.c Pure-C replacement for MGRAPHIC.EXE overlay (Mode 13h, 320x200x256)
 */

#include "gfx_impl.h"
#include "slot.h"
#include <dos.h>
#include <string.h>
#include <stdio.h>

/* dos_alloc is provided by lowlvl.asm (start.exe) or dosfunc.c (f15.exe) */
extern uint16 dos_alloc(uint16 size);

/* Debug log file */
static FILE *g_dbgFile = NULL;
static void dbg(const char *msg)
{
    (void)msg;
}

/* Far memory helpers — small model doesn't have _fmemcpy/_fmemset */
static void far_memset(uint16 seg, uint16 off, uint8 val, uint16 count)
{
    uint8 far *p = (uint8 far *)MK_FP(seg, off);
    while (count--) *p++ = val;
}

static void far_memcpy_to(uint16 dseg, uint16 doff, uint16 sseg, uint16 soff, uint16 count)
{
    uint8 far *d = (uint8 far *)MK_FP(dseg, doff);
    uint8 far *s = (uint8 far *)MK_FP(sseg, soff);
    while (count--) *d++ = *s++;
}

/* ---- Internal state (replaces cs: and ds: overlay variables) ---- */

static uint16 g_rowOffsets[200];        /* cs:0x0e - precomputed row*320 */
static uint16 g_curPageSeg;             /* cs:0x19e */
static uint16 g_blitOffset;             /* cs:0x1a0 */
static uint8  g_modeFlag = 1;           /* cs:0x1a2 */
static uint16 g_pageSegs[16];           /* cs:0x681 */
static uint8  g_fillColor;              /* ds:0x1b7a */
static uint8  g_dacCounter;             /* cs:0x9b2 */

/* Initialize row offset table */
static void initRowOffsets(void)
{
    int i;
    for (i = 0; i < 200; i++)
        g_rowOffsets[i] = (uint16)(i * 320);
}

/* ---- Slot 0x00: gfx_allocPage ---- */
int FAR CDECL gfx_allocPage(int pageNum)
{
    uint16 seg;
    union REGS r;
    /* Allocate 0x1000 paragraphs = 64KB directly via INT 21h */
    r.h.ah = 0x48;
    r.x.bx = 0x1000;
    intdos(&r, &r);
    seg = r.x.cflag ? 0 : r.x.ax;
    if (seg == 0) return 0;
    g_pageSegs[pageNum] = seg;
    return (int)seg;
}

/* ---- Slot 0x3c: gfx_setMode13 ---- */
int FAR CDECL gfx_setMode13(int16 monoFlag)
{
    union REGS regs;

    (void)monoFlag;
    dbg("setMode13: enter");
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
    dbg("setMode13: done");

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
    gfx_waitRetrace();
    far_memcpy_to(0xA000, 0, g_curPageSeg, 0, 64000u);
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
    far_memset(g_curPageSeg, 0, 0, 64000u);
    return 0;
}

/* ---- Slot 0x0e: gfx_setPageN ---- */
int FAR CDECL gfx_setPageN(uint16 pageNum)
{
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
    dbg("getModecode");
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
static uint8 far *g_fontPtr = 0; /* Pointer to 8x8 BIOS font */
static uint8 g_fontHeight = 8;

static void ensureFont(void)
{
    if (g_fontPtr) return;
    /* Use well-known BIOS 8x8 font at F000:FA6E (IBM PC/AT compatible) */
    g_fontPtr = (uint8 far *)MK_FP(0xF000, 0xFA6E);
}

/* ---- Slot 0x05: gfx_drawString ---- */
int FAR CDECL gfx_drawString(int16 *pageNum, const char *string, int len)
{
    uint16 x, y, color;
    uint8 far *page;
    int i;
    uint8 ch;
    uint8 far *glyph;
    int row, col;

    if (!string) return 0;
    ensureFont();
    if (!g_fontPtr) return 0;

    x = (uint16)pageNum[4];
    y = (uint16)pageNum[5];
    color = (uint16)pageNum[2];

    if (len <= 0) len = 0;
    /* Calculate length if not provided */
    if (len == 0) {
        const char *s = string;
        while (*s) { len++; s++; }
    }

    page = (uint8 far *)MK_FP(g_curPageSeg, 0);

    for (i = 0; i < len; i++) {
        ch = (uint8)string[i];
        if (ch == 0) break;
        if (x + 8 > 320) break;
        if (y + g_fontHeight > 200) break;

        glyph = g_fontPtr + (uint16)ch * g_fontHeight;
        for (row = 0; row < g_fontHeight; row++) {
            uint8 bits = glyph[row];
            uint16 rowOff = g_rowOffsets[y + row] + x;
            for (col = 0; col < 8; col++) {
                if (bits & 0x80) {
                    page[rowOff + col] = (uint8)color;
                }
                bits <<= 1;
            }
        }
        x += 8;
    }

    /* Update x position in page struct */
    pageNum[4] = (int16)x;
    return 0;
}

/* ---- Slot 0x2a: gfx_copyRect ---- */
int FAR CDECL gfx_copyRect(int srcPage, int srcX, int srcY,
                            int dstPage, int dstX, int dstY,
                            int width, int height)
{
    int row;

    for (row = 0; row < height; row++) {
        uint16 sOff = g_rowOffsets[srcY + row] + (uint16)srcX;
        uint16 dOff = g_rowOffsets[dstY + row] + (uint16)dstX;
        far_memcpy_to(g_pageSegs[dstPage], dOff, g_pageSegs[srcPage], sOff, (uint16)width);
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

int FAR CDECL gfx_setDac(uint16 palIdx)
{
    union REGS regs;
    struct SREGS sregs;
    if (palIdx > 4) return 0;
    /* INT 10h AX=1012h: set block of DAC color registers */
    regs.x.ax = 0x1012;
    regs.x.bx = 0;       /* first register */
    regs.x.cx = 16;      /* number of registers */
    regs.x.dx = (uint16)g_palettes[palIdx];
    segread(&sregs);
    sregs.es = sregs.ds;  /* ES:DX -> palette table */
    int86x(0x10, &regs, &regs, &sregs);
    gfx_waitRetrace();
    return 0;
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
int FAR CDECL gfx_getCurPage(void) { return (int)g_curPageSeg; }
int FAR CDECL gfx_blitSprite(struct SpriteParams *p) { (void)p; return 0; }
int FAR CDECL gfx_drawLine(void) { return 0; }
int FAR CDECL gfx_setPageDirect(void) { return 0; }
int FAR CDECL gfx_resetBlitOffset2(void) { g_blitOffset = 0; return 0; }
int FAR CDECL gfx_dirtyRect2(void) { return 0; }
int FAR CDECL gfx_getDisplayPage(void) { return 0; }
int FAR CDECL gfx_setFont(uint16 ch, uint16 fontIdx) { (void)ch; (void)fontIdx; return 8; }
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
int FAR CDECL gfx_setOvlVal1(void) { return 0; }
int FAR CDECL gfx_setOvlVal2(void) { return 0; }
int FAR CDECL gfx_getBlitOffset(void) { return (int)g_blitOffset; }
int FAR CDECL gfx_getModeFlag(void) { return (int)g_modeFlag; }
int FAR CDECL gfx_getModeFlag2(void) { return (int)g_modeFlag; }
int FAR CDECL gfx_getVal(void) { return 0; }
int FAR CDECL gfx_getVal2(void) { return 0; }
int FAR CDECL gfx_setDacAnimCount(uint16 count) { g_dacCounter = (uint8)count; return 0; }
int FAR CDECL gfx_commitPage(void)
{
    dbg("commitPage: copying to VGA");
    /* commitPage: copy back buffer to VGA (same as flipPage but without waitRetrace) */
    far_memcpy_to(0xA000, 0, g_curPageSeg, 0, 64000u);
    return 0;
}
int FAR CDECL gfx_nop51(void) { return 0; }
int FAR CDECL gfx_setMonoFlag(uint16 mono) { (void)mono; return 0; }
int FAR CDECL gfx_blitSpriteClipped(int16 *ptr) { (void)ptr; return 0; }
int FAR CDECL gfx_blitSpriteClipped2(void) { return 0; }
int FAR CDECL gfx_blitSpriteOpaque(int16 *ptr) { (void)ptr; return 0; }
int FAR CDECL gfx_blitSpriteOpaque2(void) { return 0; }

/* ---- Slot 0x30: gfx_blitToCurrent ---- */
int FAR CDECL gfx_blitToCurrent(int16 pagePtr)
{
    far_memcpy_to(g_curPageSeg, 0, (uint16)pagePtr, 0, 64000u);
    return 0;
}
