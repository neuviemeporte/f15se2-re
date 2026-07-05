// seg000 debug code (/Zi)
#include "eg3dview.h"
#include "egcode.h"
#include "egdata.h"
#include "egframe.h"
#include "egmath.h"
#include "egpic.h"
#include "egtypes.h"
#include "offsets.h"
#include "pointers.h"
#include "log.h"
#include "slot.h"
#include "const.h"
#include "comm.h"

#include <dos.h>
#include <conio.h>
#include <bios.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Private helpers for this translation unit. */
void drawCockpit();
void runGameSession();
void doNothing3();
void doNothing4();
void gfxInit();

// ==== seg000:0x10 ====
int main(void) {
    uint16 FAR *commPtr;
    log_set_app("egame");
    FP_SEG(commPtr) = SEG_LOWMEM;
    FP_OFF(commPtr) = OFF_IACA_START;
#ifdef DEBUG
    /* DEBUG-only: normalize commData to (commSeg-1):0x10 -- physically IDENTICAL
       to commSeg:0 for every field access, but makes the copy-prot reads at
       commData-4 / commData-2 alias the durable COMM MCB magic that f15.com
       writes at (commSeg-1):0x0C / 0x0E (see f15.c). With the release form
       (FP_OFF=0) those reads wrap to commSeg:0xFFFC, which egame clobbers during
       init, so the in-game copy-prot check fails ~frame 256+ and kills the game.
       Release keeps the original form (adding the -1 would break verify). */
    FP_SEG(commData) = *commPtr - 1;
    FP_OFF(commData) = 0x10;
#else
    FP_SEG(commData) = *commPtr;
    FP_OFF(commData) = 0;
#endif
    FP_SEG(gameData) = *commPtr;
    FP_OFF(gameData) = COMM_GAMEDATA_OFFSET;
    Log(("main: commData=%04x:%04x gameData=%04x:%04x", FP_SEG(commData), FP_OFF(commData), FP_SEG(gameData), FP_OFF(gameData)));
    LogInfo(("SIG@startup: commData-4/-2 (=MCB magic now) = %04x/%04x",
             *(int16 FAR *)((char FAR *)commData - 4), *(int16 FAR *)((char FAR *)commData - 2)));
    setupOverlaySlots(commData->gfxOvlAddr);
    setupOverlaySlots(commData->miscOvlAddr);
    setupOverlaySlots(commData->sndOvlAddr);
    hercFlag = commData->setupMono;
    gfxModeUnset = commData->gfxModeNum == 0;
    installCBreakHandler();
    if (commData->setupUseJoy == 1) {
        copyJoystickData(commData->joyData);
    } else {
        joyAxes[0] = joyAxes[1] = 0x80;
    }
    gfxInit();
    gfx_initOverlay();
    gfx_setMonoFlag(commData->setupMono);
    if (gameData->theater < 2) {
        gfx_setFadeSteps(12);
    } else {
        gfx_setFadeSteps(16);
    }
    gfxBufPtr = commData->gfxInitResult;
    setupInstrumentLayoutFar();
    drawCockpit();
    runGameSession();
    if (commData->setupUseJoy == 1) {
        restoreJoystickData(commData->joyData);
    }
    restoreCbreakHandler();
    if (exitCode == 0) {
        regs.h.ah = 0;
        regs.h.al = 3;
        int86(IRQ_VIDEO, &regs, &regs);
    }
    LogInfo(("main: EXITING with code %d, tick=%d", exitCode, frameTick));
    exit(exitCode);
}

// ==== seg000:0x147 ====
void drawCockpit() {
    initMissionStrings();
    load15Flt3d3();
    strcpy(regnStr, scenarioPlh[gameData->theater]);
    loadRegion3D();
    f15DgtlResult = loadF15DgtlBin();
    g_horizonGroundColor = g_world3dData[47];
    if ((g_dacSupported = gfx_getModeFlag()) != 0) {
        setupDac();
    }
    gfx_setDac(1);
    gfx_waitRetrace();
    if (gfx_getModecode() == 3) {
        openBlitClosePic("256pit.PIC", 1);
    } else {
        openBlitClosePic("cockpit.PIC", 1);
    }
    gfx_copyRect(1, 0, 96, 0, 0, 96, 320, 104);
    gfx_copyRect(1, 0, 96, 2, 0, 96, 320, 104);
}

// ==== seg000:0x211 ====
void runGameSession() {
    FP_OFF(g_floppyMotorPtr) = OFF_BDA_FLOPPYMOTOR; // floppy motor runtime in bda???
    FP_SEG(g_floppyMotorPtr) = 0;
    if (*g_floppyMotorPtr > 1) {
        *g_floppyMotorPtr = 1;
    }
    audio_shutdown();
    audio_setup(*(int16 FAR *)(OFF_IACA_UNK), f15DgtlResult);
#ifdef NO_ASM
    /* The shared C timer ISR has no built-in per-tick game work; register
     * egame's advanceFrameTick (frame-pacing tick + DAC colour-cycle) before
     * installing it. egcode.asm's timer ISR does this inline, so verify-only. */
    setTimerTickHook(egAdvanceFrameTick);
#endif
    setTimerIrqHandler();
    if (commData->setupUseJoy == 0) {
        setInt9Handler();
    }
    runGameLoop();
    moveDataFar();
    if (commData->setupUseJoy == 0) {
        restoreInt9Handler();
    }
    gfx_setDacAnimCount(1);
    waitFrameSync(2);
    restoreTimerIrqHandler();
    audio_shutdown();
}

// ==== seg000:0x0294 routine_6 ====
void doNothing3() {
}

// ==== seg000:0x0297 routine_5 ====
void doNothing4() {
}

// ==== seg000:0x29a ====
void gfxInit() {
    int16 var_2;
    gfx_allocPage(0);
    var_2 = gfx_allocPage(1);
    gfx_storeBufPtr(var_2, 1);
    gfx_storeBufPtr(commData->gfxInitResult, 2);
}
