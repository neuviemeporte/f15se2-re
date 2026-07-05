/*
 * drawstr.c - drawStringAt(); shared string drawing (split for link order)
 */

#include "common.h"

#include "../pointers.h"
#include <dos.h>

extern int16 FAR gfx_drawString(int16 *pageNum, const char *string);

void drawStringAt(int16 *pageNum, const char *string, int16 x, int16 y) {
    pageNum[4] = x;
    pageNum[5] = y;
    gfx_drawString(pageNum, string);
}
