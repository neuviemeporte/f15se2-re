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

// ==== seg000:0x29a ====
void gfxInit() {
    int var_2;
    gfx_jump_0_alloc(0);
    var_2 = gfx_jump_0_alloc(1);
    gfx_jump_4b_storeBufPtr(var_2, 1);
    gfx_jump_4b_storeBufPtr(commData->gfxInitResult, 2);
}

// ==== seg000:0x147 ====
void sub_10147() {
    sub_11E0E();
    sub_1C8DE();
    // 0x162
    strcpy(regnStr, scenarioPlh[gameData->theater]);
    sub_121C6();
    // 0x16e
    word_32938 = j_gfx_jump_32();
    // 0x179
    byte_34197 = byte_228FF[0];
}