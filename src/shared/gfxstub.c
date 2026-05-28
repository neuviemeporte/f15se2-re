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
void clearRect(int16 *pageNum, int x1, int y1, int x2, int y2)
{
    gfx_setPageN(*pageNum);
    gfx_setColor(0);
    /* Fill rectangle with color 0 by writing directly to page */
    {
        uint16 pageSeg = (uint16)gfx_getCurPageSeg();
        uint8 far *page = (uint8 far *)MK_FP(pageSeg, 0);
        int row, col;
        if (x2 > 320) x2 = 320;
        if (y2 > 200) y2 = 200;
        for (row = y1; row < y2; row++) {
            uint16 off = (uint16)(row * 320) + (uint16)x1;
            for (col = x1; col < x2; col++) {
                page[off++] = 0;
            }
        }
    }
}
