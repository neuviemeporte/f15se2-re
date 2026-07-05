/*
 * gfximpl.c - C implementations of shared graphics helper routines
 *             from gfx.inc and gfx_clearrect.inc (NO_ASM build only)
 */

#include "inttype.h"
#include "pointers.h"
#include "slot.h"
#include <dos.h>

/* Dirty rect tracking variables - these are declared in the data module */
extern int16 dirtyMinBuf[];
extern int16 dirtyMaxBuf[];
extern int16 dirtyRectMin;
extern int16 dirtyRectMax;

/* Line drawing variables */
extern int16 lineX1, lineY1, lineX2, lineY2;

/* gfx.inc: clearDirtyRects - clear all dirty regions */
void clearDirtyRects(void) {
    /* Stub - dirty rect system not fully implemented yet */
}

/* gfx.inc: drawLineWrapper - draw a line.
 * The original does Cohen-Sutherland clipping on the lineX1..lineY2 globals,
 * then passes the (clipped) endpoints to slot 0x1f in registers. The C slot
 * takes them by value, so marshal the globals here. (No clipping yet; the menu
 * lines are already on-screen.) */
void drawLineWrapper(void) {
    gfx_drawLine((uint16)lineX1, (uint16)lineY1, (uint16)lineX2, (uint16)lineY2);
}

/* gfx_clearrect.inc: clearRect - clear a rectangular region */
/* Parameters: pageNum, x1, y1, x2, y2 (absolute coordinates) */
/* NOTE: The original clearRect uses the dirty rect system and operates on
 * curPageSeg. We use the page index from the page descriptor to look up
 * the correct segment directly, matching gfx_switchColor's approach. */
void clearRect(int16 *pageNum, int16 x1, int16 y1, int16 x2, int16 y2) {
    uint8 color;
    uint16 pageSeg;
    uint8 FAR *page;
    int16 row, col;

    color = (uint8)pageNum[3];
    gfx_setPageN(*pageNum);
    /* slot 0x10 (getCurPageSeg2) is the no-arg getter; slot 0x0f is a setter. */
    pageSeg = (uint16)gfx_getCurPageSeg();
    page = (uint8 FAR *)MK_FP(pageSeg, 0);
    if (x2 > 319) x2 = 319;
    if (y2 > 199) y2 = 199;
    for (row = y1; row <= y2; row++) {
        uint16 off = (uint16)(row * 320) + (uint16)x1;
        for (col = x1; col <= x2; col++) {
            page[off++] = color;
        }
    }
}
