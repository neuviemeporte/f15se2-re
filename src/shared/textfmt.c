/*
 * textfmt.c - centered text, string width, and integer-to-string (my_ltoa/my_itoa)
 */

#include "common.h"

#include "../pointers.h"
#include <dos.h>

extern int16 FAR gfx_setFont(uint16 ch, uint16 font);

void drawStringCentered(int16 *page, const char *str, int16 startx, int16 y, int16 endx) {
    int16 width;
    width = stringWidth(page, str);
    drawStringAt(page, str, (endx - width) / 2 + startx, y);
}

int16 stringWidth(int16 *page, const char *str) {
    int16 n;
#ifdef BUGFIX
    const char *l; // clang errors due to wrong type but char does change the binary
#else
    const uint8 *l;
#endif
    int16 j;
    l = str;
    j = page[6];
    n = 0;
    while (*l != '\0') {
        n += gfx_setFont(*(l++), j);
    }
    return n;
}

void my_ltoa(int32 value, char *buf) {
    int8 i, k;
#ifdef BUGFIX
    char *p;
#else
    int8 *p;
#endif
    int8 n[6];
    p = buf;
    if (value < 0) {
        value = -value;
        *p = '-';
        p++;
    }
    n[0] = value % 0xa;
    value /= 0xa;
    n[1] = value % 0xa;
    value /= 0xa;
    n[2] = value % 0xa;
    value /= 0xa;
    n[3] = value % 0xa;
    value /= 0xa;
    n[4] = value % 0xa;
    value /= 0xa;
    n[5] = value % 0xa;
    i = 0;
    for (k = 5; k > 0; k--) {
        if (n[k] != 0) break;
    }
    do {
        if (k == 2 && i == 1) {
            *p = ',';
            p++;
        }
        *p = n[k] + '0';
        i = 1;
        p++;
    } while (--k >= 0);
    *p = '\0';
}

void my_itoa(int16 value, char *buf) {
    int8 n[6];
    int8 i, k;
    char *p;
    p = buf;
    if (value < 0) {
        value = -value;
        *p = 0x2d;
        p++;
    }
    n[0] = value % 0xa;
    value /= 0xa;
    n[1] = value % 0xa;
    value /= 0xa;
    n[2] = value % 0xa;
    value /= 0xa;
    n[3] = value % 0xa;
    value /= 0xa;
    n[4] = value % 0xa;
    value /= 0xa;
    n[5] = value % 0xa;
    i = 0;
    for (k = 5; k > 0; k--) {
        if (n[k] != 0) break;
    }
    do {
        if (k == 2 && i == 1) {
            *p = 0x2c;
            p++;
        }
        *p = n[k] + 0x30;
        i = 1;
        p++;
    } while (--k >= 0);
    *p = 0;
}
