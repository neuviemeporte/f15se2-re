// egame2.c: debug code (/Zi)
#include "debug.h"
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "slot.h"
#include "const.h"

#include <dos.h>

// far arrays found in seg004 in the original executable
unsigned char far byte_228D0[0x2f];
unsigned char far byte_228FF[0xada5];
unsigned char far byte_2D6A4[0x4844+0x9c8];

// ==== seg000:0x147 ====
void drawCockpit() {
    sub_11E0E();
    sub_1C8DE();
    // 0x162
    strcpy(regnStr, scenarioPlh[gameData->theater]);
    sub_121C6();
    // 0x16e
    gfx32_result = j_gfx_jump_32();
    // 0x179
    byte_34197 = byte_228FF[0];
    // 17c
    if ((byte_32933 = gfx_jump_4c()) != 0) {
        setupDac();
    }
     gfx_jump_44_setDac(1);
     gfx_jump_45_retrace();
     // 1a1
     if (gfx_jump_3f_modecode() == 3) {
        openBlitClosePic(a256pit_pic, 1);
     }
     else {
        openBlitClosePic(aCockpit_pic, 1);
     }
     // 1df
     gfx_jump_2a(1, 0, 0x60, 0, 0, 0x60, 0x140, 0x68);
     gfx_jump_2a(1, 0, 0x60, 2, 0, 0x60, 0x140, 0x68);
}

// ==== seg000:0x211 ====
int sub_10211() {
    FP_OFF(dword_38FE2) = OFF_BDA_FLOPPYMOTOR; // floppy motor runtime in bda???
    FP_SEG(dword_38FE2) = 0;
    // 224
    if (*dword_38FE2 > 1) {
        *dword_38FE2 = 1;
    }
    audio_jump_65();
    // 241
    audio_jump_64(*(int16 FAR*)(OFF_IACA_UNK), gfx32_result);
    setTimerIrqHandler();
    // 250
    if (commData->setupUseJoy == 0) {
        sub_22746();
    }
    sub_13C3B();
    sub_12049();
    // 266
    if (commData->setupUseJoy == 0) {
        sub_22796();
    }
    // 276
    gfx_jump_4f(1);
    sub_12278(2);
    restoreTimerIrqHandler();
    audio_jump_65();
}

// ==== seg000:0x29a ====
void gfxInit() {
    int var_2;
    gfx_jump_0_alloc(0);
    var_2 = gfx_jump_0_alloc(1);
    gfx_jump_4b_storeBufPtr(var_2, 1);
    gfx_jump_4b_storeBufPtr(commData->gfxInitResult, 2);
}
