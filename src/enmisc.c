/* enmisc.c — split from enmain.c (loadWorldStrings + helpers), compiled with /Gs */
#include "slot.h"
#include <dos.h>
#include "offsets.h"
#include "pointers.h"
#include "log.h"
#include "shared/common.h"
#include <stdlib.h>
#include "endata.h"
#include "enmisc.h"
#include "enworld.h"

/* Private helpers for this translation unit. */
void drawStringAtPos(int16 *s, const char far *str, int x, int y);
void drawFarString(int16 *s, const char far *str);
void farStrcpy(char *dst, const char far *src);
void outportByte(int port, int value);
void restoreVideoMode(void);
void restoreInterrupts(void);
void setupWorldBufPtr(void);

void loadWorldStrings(void) {
    int strIdx;
    int pos;
    setupWorldBufPtr();
    worldDataReady = 1;
    readWorldData();
    worldStrings[0] = worldStringBuf;
    strIdx = 1;
    pos = 0;
    while (pos < 750) {
        if (worldStringBuf[pos] == '\0' && strIdx < 100) {
            worldStrings[strIdx++] = &worldStringBuf[pos + 1];
        }
        pos++;
    }
}

void drawStringAtPos(int16 *s, const char far *str, int x, int y) {
    s[4] = x;
    s[5] = y;
    drawFarString(s, str);
}

void farStrcpy(char *dst, const char far *src) {
    while ((*dst++ = *src++) != '\0');
}

void drawFarString(int16 *s, const char far *str) {
    char buf[200];
    farStrcpy(buf, str);
    gfx_drawString(s, buf);
}

void restoreVideoMode(void) {
}

void restoreInterrupts(void) {
}

void outportByte(int port, int value) {
    outp(port, value);
}

#ifdef NO_ASM
void setupWorldBufPtr(void) {
    uint16 seg = FP_SEG(commData);
    uint16 off = FP_OFF(commData);
    worldBufOffset = off + 0x7A;
    worldBufSegment = seg;
}
#endif
