/* enmain.c — main/init, compiled with /Gs */
#include "slot.h"
#include <dos.h>
#include "offsets.h"
#include "pointers.h"
#include "log.h"
#include "shared/common.h"
#include <stdlib.h>
#include "endtypes.h"
#include "endata.h"
#include "endcode.h"
#include "enaward.h"
#include "enbrief.h"
#include "endbrf.h"
#include "eninput.h"
#include "enmisc.h"
#include "enrand.h"

/* Private helpers for this translation unit. */
void initGraphics(void);
void checkQuitFlag(void);

int main(void) {
    int16 spriteBufSize, a, auxBufSize;
    uint16 FAR *lowmemPtr;
    int16 e;
    register int16 commSeg;

    (void)a;
    (void)e;

    log_set_app("end");
    FP_SEG(lowmemPtr) = SEG_LOWMEM;
    FP_OFF(lowmemPtr) = OFF_IACA_START;
    commSeg = *lowmemPtr;
    FP_SEG(commData) = commSeg;
    FP_OFF(commData) = 0;
    FP_SEG(gameData) = commSeg;
    FP_OFF(gameData) = COMM_GAMEDATA_OFFSET;
    setupOverlaySlots(commData->gfxOvlAddr);
    setupOverlaySlots(commData->miscOvlAddr);
    misc_clearKeyFlags();
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
    auxBufSize = gfx_getAuxBufSize();
    spriteBufSize = gfx_getBufSize();
    gfxBufSeg = allocBuffer(auxBufSize);
    if (hasVgaMode == 1) {
        vgaBufSeg = allocBuffer(VGA_BUF_SIZE);
        vgaBufSeg2 = vgaBufSeg;
        vgaBufOffset = 0;
    }
    spriteBufSeg = allocBuffer(spriteBufSize);
    missionResult = 3;
    if (commData->setupDone == 2) {
        computeMissionResult();
    }
    clearKeybuf();
    debriefMainLoop();
    checkQuitFlag();
    clearKeybuf();
    showPostMissionAwards();
    restoreCbreakHandler();
    exit(EXIT_DEBRIEF);
}

void checkQuitFlag(void) {
    if (quitFlag != 0) {
        cleanup();
        restoreCbreakHandler();
        exit(0);
    }
}

void initGraphics(void) {
    int16 a, b, c, d, e, f, g, h;
    (void)a;
    (void)b;
    (void)c;
    (void)d;
    (void)e;
    (void)f;
    (void)g;
    (void)h;
    seedRandom();
    gfx_setPageN(0);
    gfx_allocPage(0);
    gfx_getCurPage(0);
    gfx_setMonoFlag(commData->setupMono);
    gfx_setDac(1);
    gfx_storeBufPtr(commData->gfxInitResult, 1);
}
