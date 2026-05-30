/*
 * gfx_noasm.c - C stub implementations for shared graphics helper routines
 *               from gfx.inc and gfx_clearrect.inc (NO_ASM build only)
 */

#include "inttype.h"
#include "pointers.h"
#include "slot.h"

/* Dirty rect tracking variables - these are declared in the data module */
extern int16 dirtyMinBuf[];
extern int16 dirtyMaxBuf[];
extern int16 dirtyRectMin;
extern int16 dirtyRectMax;

/* Line drawing variables */
extern int16 lineX1, lineY1, lineX2, lineY2;

/* gfx.inc: clearDirtyRects - clear all dirty regions */
void clearDirtyRects(void)
{
    /* Stub - dirty rect system not fully implemented yet */
}

/* gfx.inc: drawLineWrapper - clip and draw a line */
void drawLineWrapper(void)
{
    /* Calls gfx_drawLine after Cohen-Sutherland clipping.
       For stub: just call drawLine directly (no clipping) */
    gfx_drawLine();
}

/* gfx_clearrect.inc: clearRect - clear a rectangular region */
/* Parameters: pageNum, x1, y1, x2, y2 (absolute coordinates) */
/* NOTE: The original clearRect uses the dirty rect system and operates on
 * curPageSeg. We use the page index from the page descriptor to look up
 * the correct segment directly, matching gfx_switchColor's approach. */
void clearRect(int16 *pageNum, int x1, int y1, int x2, int y2)
{
    uint8 color;
    uint16 pageSeg;
    uint8 far *page;
    int row, col;

    color = (uint8)pageNum[3];
    gfx_setPageN(*pageNum);
    pageSeg = (uint16)gfx_getCurPageSeg();
    page = (uint8 far *)MK_FP(pageSeg, 0);
    if (x2 > 319) x2 = 319;
    if (y2 > 199) y2 = 199;
    for (row = y1; row <= y2; row++) {
        uint16 off = (uint16)(row * 320) + (uint16)x1;
        for (col = x1; col <= x2; col++) {
            page[off++] = color;
        }
    }
}
