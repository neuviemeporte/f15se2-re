// seg000 debug code (/Zi)
#include "debug.h"
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <stdio.h>
#include <string.h>

// far arrays found in seg004 in the original executable
unsigned char far byte_228D0[0x2f];
unsigned char far byte_228FF[0xada5];
unsigned char far byte_2D6A4[0x4844+0x9c8];

// ==== seg000:0x147 ====
void drawCockpit() {
    sub_11E0E();
    load15Flt3d3();
    // 0x162
    strcpy(regnStr, scenarioPlh[gameData->theater]);
    sub_121C6();
    // 0x16e
    f15DgtlResult = loadF15DgtlBin();
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
    audio_jump_64(*(int16 FAR*)(OFF_IACA_UNK), f15DgtlResult);
    setTimerIrqHandler();
    // 250
    if (commData->setupUseJoy == 0) {
        sub_22746();
    }
    sub_13C3B();
    moveDataFar();
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

// ==== seg000:0x1e0e ====
int sub_11E0E() {
    int var_2, var_4;
    setCommWorldbufPtr();
    flagFarToNear = 1;
    // 1e1e
    moveStuff();
    word_3C0A2[0] = 0x98be;
    var_2 = 1;
    // 1e2c
    for (var_4 = 0; var_4 < 750; ++var_4) {
        // 1e40
        if (byte_3C16E[var_4] == 0 && var_2 < 100) {
            word_3C0A2[var_2++] = var_4 + 0x98bf;
        }
    } // 1e61
    if (gameData->difficulty != 0) { //1e6c
        // 1e8c
        dword_3B7DA = ((int32)(word_3AA5E[word_3B148 << 3]) << 5) + 2;
        // 1eb1
        dword_3B7F8 = (0x8000 - (int32)(word_3AA60[word_3B148 << 3])) << 5;
    }
    else { // 1eba
        // 1ed1
        dword_3B7DA = ((int32)word_32A22 << 5) + 2;
        // 1ef5
        dword_3B7F8 = (0x8000 - (int32)word_32A24) << 5;
    } // 1efc
    // 1f15
    word_3BEC0 = (dword_3B7DA + 0x10) >> 5;
    // 1f36
    word_3BED0 = 0x8000 - ((dword_3B7F8 + 0x10) >> 5);
}

// ==== seg000:0x2049 ====
int moveDataFar() {
    int unused1, unused2;
    setCommWorldbufPtr();
    flagFarToNear = 0;
    moveStuff();
    // 2063
    moveNearFar(byte_3B7FC, 0x600);
}

// ==== seg000:0x206d ====
int moveStuff() {
    moveNearFar(byte_3C02A, 1);
    moveNearFar(byte_3BEC4, 1);
    // 2094
    moveNearFar(&word_3BED2, 2);
    moveNearFar(&word_38FFA, 2);
    moveNearFar(&word_3C69E, 2);
    // 20c2
    moveNearFar(unk_3AA5C, word_3BED2 * 16);
    moveNearFar(&word_3C046, 2);
    moveNearFar(unk_3B202, word_3C046 * 0x24);
    // 20f0
    moveNearFar(byte_3BFA4, 0x64);
    moveNearFar(byte_3BED8, 0x64);
    moveNearFar(byte_3C16E, 0x2ee);
    // 211a
    moveNearFar(byte_3AFAC, 0x100);
    moveNearFar(&word_3C00C, 2);
    moveNearFar(&word_336FC, 2);
    // 2144
    moveNearFar(&word_32A22, 0x10);
    moveNearFar(&word_3B144, 0x24);
}

// ==== seg000:0x215c ====
int moveNearFar(void *nearPtr, int count) {
    void FAR *farPtr = nearPtr;
    if (flagFarToNear != 0) { // 2172
        movedata(FP_SEG(farPointer), FP_OFF(farPointer), FP_SEG(farPtr), FP_OFF(farPtr), count);
    }
    else { // 2187
        movedata(FP_SEG(farPtr), FP_OFF(farPtr), FP_SEG(farPointer), FP_OFF(farPointer), count);
    } // 219e
    farPointer += count;
}

// ==== seg000:0x21a9 ====
int setCommWorldbufPtr() {
    farPointer = (uint8 FAR*)&commData->worlBuf;
    return 0;
}

// ==== seg000:0x2874 ====
int load3DAll() {
    load3DG();
    load3DT(regnStr);
    load3D3(regnStr);
    word_3401A = 0;
}

// ==== seg000:0x2c82 ====
int load3DT() {
    
}

// ==== seg000:0x2e54 ====
int load3DG() {
    int unused_1, unused_2, unused_3;
    strcpyFromDot(regnStr, a_3dg);
    // 2e68
    while ((fileHandle = fopen(regnStr, aRb_3)) == NULL) {
        drawSomeStrings(aPleaseInsertF15DiskB, 0x68, 0x28, 0x0f);
        drawSomeStrings(unk_34121, 0x68, 0x32, 0x0f);
        gfx_jump_46_retrace2();
        misc_jump_5b_getkey();
    } 
    // 2eb5
    gfx_jump_45_retrace();
    fread(&sign3dg, 2, 1, fileHandle);
    // 2ed0
    if (sign3dg != SIGNATURE_3DG) {
        printError(aBadGridFileFormat_);
        fclose(fileHandle);
        return;
    }
    // 2eef
    fread(buf1_3dg, 1, 0x10, fileHandle);
    fread(buf1_3dg, 1, 0x100, fileHandle);
    fread(buf2_3dg, 1, 0x200, fileHandle);
    fread(buf3_3dg, 1, 0x200, fileHandle);
    fread(buf4_3dg, 1, 0x200, fileHandle);
    // 2f61
    fclose(fileHandle);
    memcpy(byte_3A900, unk_33E1A + ((gameData->theater & 7) * 64), 64);
    // 2f88
}

// ==== seg000:0x2f8c ====
int printError(char *msg) {
    gfx_jump_46_retrace2();
    drawSomeStrings(msg, 0, 0x60, 0xf);
    getch();
}

// ==== seg000:0x2faf ====
int strcpyFromDot(char *arg_0, char *arg_2) {
    char var_2;
    while ((var_2 = *arg_0) != '.' && var_2 != 0) {
        arg_0++;
    } // 2fca
    strcpy(arg_0, arg_2);
}

// ==== seg000:0xa0cb ====
int drawSomeStrings(char *arg_0, int arg_2, int arg_4, int arg_6) {
    drawString(word_38334, arg_0, arg_2, arg_4, arg_6);
    drawString(word_3834C, arg_0, arg_2, arg_4, arg_6);
}