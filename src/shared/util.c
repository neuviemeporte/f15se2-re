/*
 * util.c - Utility functions shared between start.exe and end.exe
 *
 * These functions appear identically in both executables and are
 * extracted here to avoid duplication.
 */

#include "util.h"

#include "pointers.h"

/* extern declarations needed by these functions */
extern void far gfx_jump_05_drawString(int16 *pageNum, const char *string);
extern int far gfx_jump_2f_charWidth(int ch, int font);
extern void far misc_jump_5e_clearKeyFlags(void);
extern char timerHandlerInstalled;
void restoreTimerIrqHandler(void);
void intDispatch(int intNum, uint8 *inRegs, uint8 *outRegs);

int cleanup() 
{
    uint8 regs[0xe];
    if (timerHandlerInstalled == 1) {
        restoreTimerIrqHandler();
    }
    regs[1] = 0; // func 0
    regs[0] = 3; // mode 3 (80x25)
    intDispatch(IRQ_VIDEO, regs, regs);
    misc_jump_5e_clearKeyFlags();
}

void drawStringAt(int16 *pageNum, const char *string, int x, int y) {
    pageNum[4] = x;
    pageNum[5] = y;
    gfx_jump_05_drawString(pageNum, string);
}

void drawStringCentered(int16 *page, const char *str, int startx, int y, int endx) {
    int width;
    width = stringWidth(page, str);
    drawStringAt(page, str, (endx - width) / 2 + startx, y);
}

int stringWidth(int16 *page, const char *str) {
    int n;
#if defined(__clang__)
    const char* l; // clang errors due to wrong type but char does change the binary
#else
    const uint8* l;
#endif
    int j;
    l = str;
    j = page[6];
    n = 0;
    while (*l != '\0') {
        n += gfx_jump_2f_charWidth(*(l++), j);
    }
    return n;
}

int my_ltoa(int32 value, int8* buf) {
    int8 i, k;
    int8 *p;
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

int my_itoa(int value, char *buf) {
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
