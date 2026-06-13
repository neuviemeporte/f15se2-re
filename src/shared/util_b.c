/*
 * util_b.c - shared between start.exe and end.exe (split from util.c)
 */

#include "util.h"

#include "../pointers.h"

extern int far gfx_drawString(int16 *pageNum, const char *string);

void drawStringAt(int16 *pageNum, const char *string, int x, int y) {
    pageNum[4] = x;
    pageNum[5] = y;
    gfx_drawString(pageNum, string);
}
