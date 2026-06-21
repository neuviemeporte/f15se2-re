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
#include "debug.h"
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
void __cdecl drawCockpit();
void runGameSession();
void doNothing3();
void doNothing4();
void __cdecl gfxInit();

// ==== seg000:0x10 ====
int main(void) {
    uint16 FAR *commPtr;
    TRACE(("egame main: entering"));
    TRACE(("egame main: start, about to read commPtr"));
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
    TRACE(("egame main: commData=%04x:%04x gameData=%04x:%04x", FP_SEG(commData), FP_OFF(commData), FP_SEG(gameData), FP_OFF(gameData)));
#ifdef DEBUG
    TRACE_KEY(("SIG@startup: commData-4/-2 (=MCB magic now) = %04x/%04x",
        *(int far *)((char far *)commData - 4), *(int far *)((char far *)commData - 2)));
#endif
    TRACE(("egame main: setup overlays"));
    setupOverlaySlots(commData->gfxOvlAddr);
    setupOverlaySlots(commData->miscOvlAddr);
    setupOverlaySlots(commData->sndOvlAddr);
    hercFlag = commData->setupMono;
    gfxModeUnset = commData->gfxModeNum == 0;
    TRACE(("egame main: install cbreak"));
    installCBreakHandler();
    if (commData->setupUseJoy == 1) {
        copyJoystickData(commData->joyData);
    }
    else {
        joyAxes[0] = joyAxes[1] = 0x80;
    }
    TRACE(("egame main: gfxInit"));
    gfxInit();
    TRACE(("egame main: after gfxInit"));
    TRACE(("egame main: calling initOverlay"));
    gfx_initOverlay();
    TRACE(("egame main: calling setMonoFlag"));
    gfx_setMonoFlag(commData->setupMono);
    TRACE(("egame main: calling setFadeSteps"));
    if (gameData->theater < 2) {
        gfx_setFadeSteps(0xc);
    }
    else {
        gfx_setFadeSteps(0x10);
    }
    gfxBufPtr = commData->gfxInitResult;
    setupInstrumentLayoutFar();
    TRACE(("egame main: drawCockpit"));
    drawCockpit();
    TRACE(("egame main: runGameSession"));
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
    TRACE_KEY(("egame main: EXITING with code %d, tick=%d", exitCode, frameTick));
    exit(exitCode);
}

// ==== seg000:0x147 ====
void drawCockpit() {
    TRACE_KEY(("drawCockpit: theater=%d regnStr=%s 38FDC=%d", gameData->theater, regnStr, g_detailLevel));
    initMissionStrings();
    load15Flt3d3();
    TRACE(("drawCockpit: after load15Flt3d3, scenPlh0=%04x, scenarioPlh@%04x", (unsigned)scenarioPlh[0], (unsigned)&scenarioPlh[0]));
    strcpy(regnStr, scenarioPlh[gameData->theater]);
    TRACE_KEY(("drawCockpit: regnStr=%s theater=%d", regnStr, gameData->theater));
    loadRegion3D();
    TRACE_KEY(("drawCockpit: after load3D, 38FDC=%d sizes3dt=%d/%d/%d/%d/%d", g_detailLevel, sizes3dt[0], sizes3dt[1], sizes3dt[2], sizes3dt[3], sizes3dt[4]));
    f15DgtlResult = loadF15DgtlBin();
    TRACE(("drawCockpit: f15DgtlResult=%d", f15DgtlResult));
    g_horizonGroundColor = g_world3dData[0x2f];
    if ((g_dacSupported = gfx_getModeFlag()) != 0) {
        setupDac();
    }
     gfx_setDac(1);
     gfx_waitRetrace();
     TRACE(("drawCockpit: opening pic"));
     if (gfx_getModecode() == 3) {
        openBlitClosePic(a256pit_pic, 1);
     }
     else {
        openBlitClosePic(aCockpit_pic, 1);
     }
     TRACE(("drawCockpit: pic done"));
     gfx_copyRect(1, 0, 0x60, 0, 0, 0x60, 0x140, 0x68);
     gfx_copyRect(1, 0, 0x60, 2, 0, 0x60, 0x140, 0x68);
     TRACE(("drawCockpit: done"));
}

// ==== seg000:0x211 ====
void runGameSession() {
    TRACE(("runGameSession: enter"));
    FP_OFF(g_floppyMotorPtr) = OFF_BDA_FLOPPYMOTOR; // floppy motor runtime in bda???
    FP_SEG(g_floppyMotorPtr) = 0;
    if (*g_floppyMotorPtr > 1) {
        *g_floppyMotorPtr = 1;
    }
    TRACE(("runGameSession: audio_shutdown"));
    audio_shutdown();
    TRACE(("runGameSession: audio_setup"));
    audio_setup(*(int16 FAR*)(OFF_IACA_UNK), f15DgtlResult);
    TRACE(("runGameSession: setTimerIrqHandler"));
#ifdef NO_ASM
    /* The shared C timer ISR has no built-in per-tick game work; register
     * egame's advanceFrameTick (frame-pacing tick + DAC colour-cycle) before
     * installing it. egcode.asm's timer ISR does this inline, so verify-only. */
    setTimerTickHook(egAdvanceFrameTick);
#endif
    setTimerIrqHandler();
    if (commData->setupUseJoy == 0) {
        TRACE(("runGameSession: setInt9Handler"));
        setInt9Handler();
    }
    TRACE(("runGameSession: runGameLoop (game loop)"));
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
    int var_2;
    TRACE(("gfxInit: allocPage(0)"));
    gfx_allocPage(0);
    TRACE(("gfxInit: allocPage(1)"));
    var_2 = gfx_allocPage(1);
    TRACE(("gfxInit: allocPage(1) returned %d", var_2));
    gfx_storeBufPtr(var_2, 1);
    gfx_storeBufPtr(commData->gfxInitResult, 2);
    TRACE(("gfxInit: done"));
}
