/* enmisc.c — split from enmain.c (loadWorldStrings + helpers), compiled with /Gs */
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "shared/util.h"
#include <stdlib.h>
#include "end.h"

void loadWorldStrings(void) {
    int p;
    int a;
    TRACE(("loadWorldStrings"));
    setupWorldBufPtr();
    worldDataReady = 1;
    readWorldData();
    worldStrings[0] = worldStringBuf;
    p = 1;
    a = 0;
    while (a < 0x2ee) {
        if (worldStringBuf[a] == '\0' && p < 100) {
            worldStrings[p++] = &worldStringBuf[a + 1];
        }
        a++;
    }
}

void drawStringAtPos(int16 *s, char far *str, int x, int y) {
    TRACE(("drawStringAtPos"));
    s[4] = x;
    s[5] = y;
    drawFarString(s, str);
}

void farStrcpy(char *dst, char far *src) {
    while ((*dst++ = *src++) != '\0')
        ;
}

void drawFarString(int16* s, char far *str) {
    char buf[200];
    TRACE(("drawFarString"));
    farStrcpy(buf, str);
    gfx_drawString(s, buf);
}

void restoreVideoMode(void) {
}


void restoreInterrupts(void) {
}


void outportByte(int port, int value) {
    TRACE(("outportByte"));
    outp(port, value);
}

#ifdef NO_ASM
void setupWorldBufPtr(void) {
    uint16 seg = FP_SEG(commData);
    uint16 off = FP_OFF(commData);
    worldBufOffset = off + 0x7A;
    worldBufSegment = seg;
}

void clearKeybuf(void) {
    while (misc_jump_5a_keybuf() == 0) {
        misc_jump_5b_getkey();
    }
}
#endif
