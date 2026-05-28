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
void clearRect(int16 *pageNum, int x, int y, int width, int height)
{
    /* Stub: sets up page, fills with color 0, updates dirty rects */
    (void)pageNum;
    (void)x;
    (void)y;
    (void)width;
    (void)height;
}
