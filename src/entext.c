/* entext.c — text rendering, compiled with /Gs /Zi */
#include "slot.h"
#include <string.h>
#include "offsets.h"
#include "pointers.h"
#include "log.h"
#include "shared/common.h"
#include "entext.h"

void drawWrappedText(int16 *page, char *str, uint16 maxWidth, int16 x, int16 y, int16 lineHeight) {
    int16 font;
    char *lineStart;
#ifdef BUGFIX
    char *scan;
#else
    uint8 *scan;
#endif
    int16 charCount, d;
    char *strBegin;
    int8 running;
    uint16 pixWidth;
    char buf[1000];

    strBegin = str;
    lineStart = str;
    scan = str;
    font = page[6];
    page[5] = y;
    running = 1;
    do {
        if (running == 0) {
            return;
        }
        pixWidth = charCount = 0;
        while (pixWidth < maxWidth && *scan != '\0' && *scan != '\r' && *scan != '\n') {
            pixWidth += gfx_setFont(*scan++, font);
            charCount++;
        }
        if (pixWidth >= maxWidth) {
            scan--;
            charCount--;
        }
        while (*scan != ' ' && *scan != '\0' &&
               *scan != '\r' && *scan != '\n' && *scan != '-' &&
               scan > strBegin) {
            scan--;
            charCount--;
        }
        if (*scan == '-') {
            charCount++;
        }
        if (*scan == '\0') {
            running = 0;
        }
        if (charCount != 0) {
            memcpy(buf, lineStart, charCount);
            buf[charCount] = 0;
            page[4] = x;
            gfx_drawString(page, buf);
            page[5] += lineHeight;
            if (*scan == '\r') {
                page[5] += 2;
            }
        }
        scan++;
        lineStart = scan;
    } while (1);
}
