// egame.exe main function
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>

// ==== seg000:0x10 ====
int main(void) {
    uint16 FAR *commPtr;
    TRACE(("egame main: entering"));
    TRACE(("egame main: start, about to read commPtr"));
    FP_SEG(commPtr) = SEG_LOWMEM;
    FP_OFF(commPtr) = OFF_IACA_START;
    FP_SEG(commData) = *commPtr;
    FP_OFF(commData) = 0;
    FP_SEG(gameData) = *commPtr;
    FP_OFF(gameData) = COMM_GAMEDATA_OFFSET;
    TRACE(("egame main: commData=%04x:%04x gameData=%04x:%04x", FP_SEG(commData), FP_OFF(commData), FP_SEG(gameData), FP_OFF(gameData)));
    // 0x43
    TRACE(("egame main: setup overlays"));
    setupOverlaySlots(commData->gfxOvlAddr);
    setupOverlaySlots(commData->miscOvlAddr);
    setupOverlaySlots(commData->sndOvlAddr);
    // 0x6d
    hercFlag = commData->setupMono;
    gfxModeUnset = commData->gfxModeNum == 0;
    // 0x7c
    TRACE(("egame main: install cbreak"));
    installCBreakHandler();
    if (commData->setupUseJoy == 1) {
        // 0x93
        copyJoystickData(commData->joyData);
    }
    else { // 0x9d
        joyAxes[0] = joyAxes[1] = 0x80;
    }
    // 0xa5
    TRACE(("egame main: gfxInit"));
    gfxInit();
    TRACE(("egame main: after gfxInit"));
    gfx_initOverlay();
    gfx_setMonoFlag(commData->setupMono);
    if (gameData->theater < 2) { // 0xc8
        gfx_setFadeSteps(0xc);
    }
    else { // 0xd6
        gfx_setFadeSteps(0x10);
    }
    // 0xea
    gfxBufPtr = commData->gfxInitResult;
    sub_21A7E();
    TRACE(("egame main: drawCockpit"));
    drawCockpit();
    TRACE(("egame main: sub_10211"));
    sub_10211();
    if (commData->setupUseJoy == 1) {
        // 10c
        restoreJoystickData(commData->joyData);
    }
    restoreCBreakHandler();
    if (exitCode == 0) {
        regs.h.ah = 0;
        regs.h.al = 3;
        // 0x131
        int86(IRQ_VIDEO, &regs, &regs);
    }
    // 13d
    TRACE(("egame main: exiting with code %d", exitCode));
    exit(exitCode);
}

// ==== seg000:0x9eb6 ====
int sub_19EB6(int arg_0, int arg_2) {
    if (word_330C2 == 0) goto done;
    if (*(&word_38202 + arg_0 * 5 + 7) != arg_2) {
        gfx_jump_29_switchColor((int *)var_564, *(&word_38202 + arg_0 * 5 + 3), *(&word_38202 + arg_0 * 5 + 4), *(&word_38202 + arg_0 * 5 + 5), *(&word_38202 + arg_0 * 5 + 6), *(&word_38202 + arg_0 * 5 + 7), arg_2);
        gfx_jump_29_switchColor((int *)var_565, *(&word_38202 + arg_0 * 5 + 3), *(&word_38202 + arg_0 * 5 + 4), *(&word_38202 + arg_0 * 5 + 5), *(&word_38202 + arg_0 * 5 + 6), *(&word_38202 + arg_0 * 5 + 7), arg_2);
        *(&word_38202 + arg_0 * 5 + 7) = arg_2;
    }
done:
    ;
}
