/* entext.c — text rendering, compiled with /Gs /Zi */
#include <string.h>
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "shared/util.h"
#include "end.h"

void drawWrappedText(int16 *page, char *str, unsigned int maxWidth, int x, int y, int lineHeight) {
    int p;
    char *a;
#ifdef BUGFIX
    char *b;
#else
    uint8 *b;
#endif
    int c;
    int d;
    char *e;
    int8 f;
    unsigned int g;
    char buf[1000];

    e = str;
    a = str;
    b = str;
    p = page[6];
    page[5] = y;
    f = 1;
    do {
        if (f == 0) {
            return;
        }
        g = c = 0;
        while (g < maxWidth && *b != '\0' && *b != '\r' && *b != '\n') {
            g += gfx_setFont(*b++, p);
            c++;
        }
        if (g >= maxWidth) {
            b--;
            c--;
        }
        while (*b != ' ' && *b != '\0' &&
               *b != '\r' && *b != '\n' && *b != '-' &&
               b > e) {
            b--;
            c--;
        }
        if (*b == '-') {
            c++;
        }
        if (*b == '\0') {
            f = 0;
        }
        if (c != 0) {
            memcpy(buf, a, c);
            buf[c] = 0;
            page[4] = x;
            gfx_drawString(page, buf);
            page[5] += lineHeight;
            if (*b == '\r') {
                page[5] += 2;
            }
        }
        b++;
        a = b;
    } while (1);
}

void seedRandom(void) {
    TRACE(("seedRandom"));
    srandInit(getTimeOfDay());
}
