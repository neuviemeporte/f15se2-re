/* enmain.c — main/init, compiled with /Gs */
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "shared/util.h"
#include <stdlib.h>
#include "end.h"

#ifdef NO_ASM
void clearKeybuf(void) {
    while (misc_jump_5a_keybuf() == 0) {
        misc_jump_5b_getkey();
    }
}

void setupWorldBufPtr(void) {
    uint16 seg = FP_SEG(commData);
    uint16 off = FP_OFF(commData);
    worldBufOffset = off + 0x7A;
    worldBufSegment = seg;
}
#endif

void initGraphics(void) {
    int a, b, c, d, e, f, g, h;
    (void)a; (void)b; (void)c; (void)d;
    (void)e; (void)f; (void)g; (void)h;
    seedRandom();
    gfx_setPageN(0);
    gfx_allocPage(0);
    gfx_getCurPage(0);
    gfx_setMonoFlag(commData->setupMono);
    gfx_setDac(1);
    gfx_storeBufPtr(commData->gfxInitResult, 1);
}

int main(void) {
    int p;
    int a;
    int b;
    uint16 far *d;
    int e;
    register int seg;

    (void)a; (void)e;

    FP_SEG(d) = SEG_LOWMEM;
    FP_OFF(d) = OFF_IACA_START;
    seg = *d;
    FP_SEG(commData) = seg;
    FP_OFF(commData) = 0;
    FP_SEG(gameData) = seg;
    FP_OFF(gameData) = COMM_GAMEDATA_OFFSET;
    setupOverlaySlots(commData->gfxOvlAddr);
    setupOverlaySlots(commData->miscOvlAddr);
    misc_jump_5e_clearKeyFlags();
    clearKeybuf();
    hercFlag = (char)commData->setupMono;
    installCBreakHandler();
    initGraphics();
    if (commData->setupUseJoy == 1) {
        copyJoystickData(commData->joyData);
    } else {
        joyAxisX = joyAxisY = JOY_CENTER;
    }
    loadWorldStrings();
    b = gfx_getAuxBufSize();
    p = gfx_getBufSize();
    gfxBufSeg = allocBuffer(b);
    if (hasVgaMode == 1) {
        vgaBufSeg = allocBuffer(VGA_BUF_SIZE);
        vgaBufSeg2 = vgaBufSeg;
        vgaBufOffset = 0;
    }
    spriteBufSeg = allocBuffer(p);
    missionResult = 3;
    if (commData->setupDone == 2) {
        loadTheaterIndex();
    }
    clearKeybuf();
    debriefMainLoop();
    checkQuitFlag();
    clearKeybuf();
    showPostMissionAwards();
    restoreCbreakHandler();
    exit(EXIT_DEBRIEF);
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

void checkQuitFlag(void) {
    TRACE(("checkQuitFlag"));
    if (quitFlag != 0) {
        cleanup();
        restoreCbreakHandler();
        exit(0);
    }
}


void restoreVideoMode(void) {
}


void restoreInterrupts(void) {
}


void outportByte(int port, int value) {
    TRACE(("outportByte"));
    outp(port, value);
}

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
