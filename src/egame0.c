#include "debug.h"
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "slot.h"
#include "const.h"

#include <dos.h>

// 0x10
int main(void) {
    uint16 FAR *commPtr;
    FP_SEG(commPtr) = SEG_LOWMEM;
    FP_OFF(commPtr) = OFF_IACA_START;
    FP_SEG(commData) = *commPtr;
    FP_OFF(commData) = 0;
    FP_SEG(gameData) = *commPtr;
    FP_OFF(gameData) = COMM_GAMEDATA_OFFSET;
    // 0x43
    setupOverlaySlots(commData->gfxOvlAddr);
    setupOverlaySlots(commData->miscOvlAddr);
    setupOverlaySlots(commData->sndOvlAddr); 
    // 0x6d
    hercFlag = commData->setupMono;
    gfxModeUnset = commData->gfxModeNum == 0;
    // 0x7c
    installCBreakHandler();
    if (commData->setupUseJoy == 1) {
        // 0x93
        copyJoystickData(commData->joyData);
    }
    else { // 0x9d
        noJoy80[0] = noJoy80[1] = 0x80;
    }
    // 0xa5
    gfxInit();
    gfx_jump_0c();
    gfx_jump_52(commData->setupMono);
    if (gameData->theater < 2) { // 0xc8
        gfx_jump_3d_null(0xc);
    }
    else { // 0xd6
        gfx_jump_3d_null(0x10);
    }
    // 0xea
    gfxBufPtr = commData->gfxInitResult;
    sub_21A7E();
    sub_10147();
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
    exit(exitCode);
}
