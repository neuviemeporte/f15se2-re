// seg000 debug code (/Zi)
#include "debug.h"
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "slot.h"
#include "const.h"
#include "comm.h"

#include <dos.h>
#include <stdio.h>
#include <string.h>

// far arrays found in seg004 in the original executable
unsigned char far byte_228D0[0xadd4];
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
    byte_34197 = byte_228D0[0x2f];
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
        setInt9Handler();
    }
    sub_13C3B();
    moveDataFar();
    // 266
    if (commData->setupUseJoy == 0) {
        restoreInt9Handler();
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
        dword_3B7DA = ((int32)(stru_3AA5E[word_3B148].field_0) << 5) + 2;
        // 1eb1
        dword_3B7F8 = (0x8000 - (int32)(stru_3AA5E[word_3B148].field_2)) << 5;
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

// ==== seg000:0x2898 ====
void load3D3(char *arg_0) {
    uint8 FAR *var_E;
    uint8 FAR *var_16;
    struct SREGS var_8;
    int var_10, var_18, var_12;
    int var_A;
    strcpyFromDot(arg_0, a_3d3);
    // 28b9
    if ((fileHandle = fopen(arg_0, aRb)) == NULL) {
        printError(aOpenErrorOn_3d3);
        return;
    }
    // 28dd
    fread(&sign3d3, 2, 1, fileHandle);
    if (sign3d3 != SIGNATURE_3D3) {
        // 28ef
        printError(aBadObjFileFormat_);
        fclose(fileHandle);
        return;
    } // 2902
    // 2912
    fread(&size3d3, 2, 1, fileHandle);
    fread(buf3d3, 2, size3d3, fileHandle);
    fread(&size3d3_2, 2, 1, fileHandle);
    // 2944
    if (size3d3_2 > 0xadd4) {
        printError(aObjectDataTooBig_);
        fclose(fileHandle);
        return;
    } // 2963
    var_E = byte_228D0 + size3d3_2;
    buf3d3[size3d3] = size3d3_2;
    segread(&var_8);
    // 2988
    for (var_16 = byte_228D0; size3d3_2 != 0; size3d3_2 -= var_A, var_16+=0x800) { // 29a6
        // 29b3
        var_A = (size3d3_2 >= 0x800) ? 0x800 : size3d3_2;
        fread(flt15_buf2, 1, var_A, fileHandle);
        movedata(var_8.ds, (uint16)flt15_buf2, FP_SEG(var_16), FP_OFF(var_16), var_A);
    } // 29e1
    fread(&size3d3_3, 1, 1, fileHandle);
    if (size3d3_3 != 0) { // 29fe
        fread(buf3d3_1, 1, size3d3_3, fileHandle);
        fread(buf3d3_2, 1, size3d3_3, fileHandle);
        fread(buf3d3_3, 1, size3d3_3, fileHandle);
        // 2a4d
        fread(&size3d3_4, 1, 1, fileHandle);
        fread(&byte_3B7FC[0x600], 2, size3d3_4, fileHandle);
        fread(&size3d3_5, 1, 1, fileHandle);
        fread(byte_3BE3E, 2, size3d3_5, fileHandle);
        // 2a9f
        fread(&size3d3_6, 1, 1, fileHandle);
        fread(byte_3BE80, 2, size3d3_6, fileHandle);
    } // 2abb
    fclose(fileHandle);
    while ((fileHandle = fopen(aPhoto_3d3, aRb_0)) == NULL) {
        // 2add
        sub_19E44(0);
        sub_19E5D(0, 0x28, 0x13f, 0x2d);
        drawSomeStrings(aPleaseInsertF15DiskB, 0x6c, 0x28, 0x0f);
        gfx_jump_46_retrace2();
        misc_jump_5b_getkey();
    } // 2b1a
    gfx_jump_45_retrace();
    for (var_10 = 0; var_10 < 2; var_10++) { // 2b32
        // 2b45
        if ((var_18 = word_3B14A[var_10 * 0x9] >> 8) != 0) { // 2b4c
            fileHandle = fopen(aPhoto_3d3_0, aRb_1);
            fread(&sign3d3, 2, 1, fileHandle);
            fread(&size3d3_7, 2, 1, fileHandle);
            fread(word_33DD0, 2, size3d3_7, fileHandle);
            // 2bac
            fread(&size3d3_7, 2, 1, fileHandle);
            word_33DD0[size3d3_7] = size3d3_2;
            // 2bbf
            for (var_12 = 0; var_12 <= var_18; var_12++) {
                // 2bde
                var_A = word_33DD0[var_12+1] - word_33DD0[var_12];
                // 2be1
                while (var_A > 0x800) {
                    fread(flt15_buf2, 1, 0x800, fileHandle);
                    var_A -= 0x800;
                } // 2c05
                segread(&var_8);
                fread(flt15_buf2, 1, var_A, fileHandle);
                // 2c34
                movedata(var_8.ds, (uint16)flt15_buf2, FP_SEG(var_E), FP_OFF(var_E), var_A);
            } // 2c3c
            var_E += var_A;
            if (var_10 == 0) {
                // 2c52
                buf3d3[size3d3+1] = buf3d3[size3d3] + var_A;
            } // 2c56
            fclose(fileHandle);
        } // 2c60
    } // 2c63
    // 2c6e
    if (var_E - byte_228D0 > 0xadd4) {
        printError(aObjdataOverflow);
    }
}

// ==== seg000:0x2c82 ====
void load3DT(char *arg_0) {
    int var_2, var_4, var_6, var_8, var_A;
    strcpyFromDot(arg_0, a_3dt);
    // 2ca3
    if ((fileHandle = fopen(arg_0, aRb_2)) == NULL) {
        printError(aOpenErrorOn_3dt);
        return;
    }
    // 2cc7
    fread(&sign3dt, 2, 1, fileHandle);
    if (sign3dt != SIGNATURE_3DT) { // 2cd5
        printError(aBadTileFileFormat_);
        fclose(fileHandle);
        return;
    } // 2cec
    fread(sizes3dt, 2, 5, fileHandle);
    // 2d02
    for (var_4 = 0; var_4 < 5; var_4++) {
        if (sizes3dt[var_4] > 0x20) {
            printError(aTooManyTiles_);
            return;
        } // 2d2b
        // 2d47
        fread(matrix3dt[var_4], 2, sizes3dt[var_4], fileHandle);
    } // 2d4f
    var_6 = 0;
    for (var_4 = 0; var_4 < 5; var_4++) { // 2d67
        for (var_8 = 0; sizes3dt[var_4] > var_8; var_8++) {
            // 2d93
            matrix3dt_2[var_4][var_8] = (int16)(buf1_3dt + var_6);
            // 2d97
            for (var_A = 0; matrix3dt[var_4][var_8] > var_A; var_A++) { // 2db9
                if (var_6 > MAX_TILE_DATA) {
                    printError(aTooMuchTileData);
                    return;
                } // 2dcd
                fread(buf1_3dt + var_6, 2, 1, fileHandle);
                fread(buf2_3dt + var_6, 2, 1, fileHandle);
                fread(buf3_3dt + var_6, 2, 1, fileHandle);
                fread(&var_2, 2, 1, fileHandle);
                val_3dt[var_6] = var_2;
                var_6 += 7;
                // 2e3c
            }
            // 2e3f
        }
        // 2e42
    } // 2e45
    fclose(fileHandle);
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

// ==== seg000:0x55ab ====
// something to do with view switching?
int sub_155AB() {
    int var_2, var_4, var_6, var_8, var_A, var_C, var_E;
    dword_3B1FE = dword_3C01C = dword_3B7DA;
    dword_3B4D4 = dword_3B7F8;
    dword_3C024 = 0x100000 - dword_3B7F8;
    // 55ef
    word_3B4DE = word_380CE + 0x18;
    word_3C02C = word_380CE;
    var_2 = word_336FE = sub_1CF64(word_336FE, 2, 8);
    // 5613
    switch(keyValue) {
    case 0:
    case 0x44: // 5616
        word_3C5AA = word_380C8;
        word_3BE94 = word_380CA;
        word_3B4E4 = word_380CC;
        // 5628
        break;
    case 0x41: // 562b
        word_3C5AA = word_380C8 + 0x8000;
        word_3BE94 = -word_380CA;
        word_3B4E4 = -word_380CC;
        // 5644
        break;
    case 0x43:
        word_3C5AA = word_380C8 + 0x4000;
        word_3BE94 = -word_380CC;
        word_3B4E4 = word_380CA;
        // 565e
        break;
    case 0x42:
        word_3C5AA = word_380C8 - 0x4000;
        word_3BE94 = word_380CC;
        word_3B4E4 = -word_380CA;
        // 5678
        break;
    case 0x84: // 567b
        var_E = (word_336E8 - ((word_330C4  + 1) / 2) - 1) & 0xf;
        word_3C5AA = stru_3A95A[var_E].field_A;
        word_3BE94 = stru_3A95A[var_E].field_C;
        // 56a9
        word_3B4E4 = stru_3A95A[var_E].field_E;
        dword_3B1FE = stru_3A95A[var_E].field_0;
        dword_3B4D4 = stru_3A95A[var_E].field_4;
        word_3B4DE = stru_3A95A[var_E].field_8;
        // 56d1
        break;
    case 0x85:
        word_3C5AA = word_380C8 - 0x4000;
        word_3BE94 = 0;
        word_3B4E4 = 0;
        // 5708
        dword_3B1FE = sub_1D178(word_380C8 + 0x4000, 0x18 << var_2) + dword_3B7DA;
        // 572e
        dword_3B4D4 = sub_1D190(word_380C8 + 0x4000, 0x18 << var_2) + dword_3B7F8;
        // 5735
        break;
    case 0x86: // 5738
        word_3C5AA = 0x8000;
        word_3BE94 = 0;
        word_3B4E4 = 0;
        dword_3B4D4 = (0x18 << var_2) + dword_3B7F8;
        // 5762
        break;
    case 0x87:
        word_3C5AA = word_380C8;
        word_3BE94 = 0;
        word_3B4E4 = 0;
        // 5796
        dword_3B1FE = sub_1D178(word_380C8 + 0x8000, 0x18 << var_2) + dword_3B7DA;
        // 57ad
        dword_3B4D4 = sub_1D190(word_380C8 + 0x8000, 0x18 << var_2) + dword_3B7F8;
        word_3B4DE = (4 << var_2) + word_380CE;
        // 57d2
        break;
    case 0x88:
    case 0x89:
    case 0x8b: // 57d5
        if (keyValue != 0x89) { // 57dd
            if (word_3C45C == 1) { // 57e4
                // XXX: test byte ptr word_336F2, 80h -> check which byte is tested, other byte ptr instructions in this routine
                if (!(word_336F2 & 0x80)) word_3C02E = word_336F2 + 0x20;
            } 
            else { // 57f6
                if (!(word_336F4 & 0x80)) word_3C02E = word_336F4 + 0x40;
            }
            // 5806
        }
        else { // 5808
            if (word_3370E == 0) word_3C02E = word_3A940;
        } // 5815
        var_4 = var_2;
        // 581b
        if (!(word_3C02E & 0x40)) { // 5825
            if (!(word_3C02E & 0x20)) { // 582c
                if (stru_335C4[word_3C02E].field_E != 0) { // 583c
                    // 584e
                    dword_3C01C = (uint32)(stru_335C4[word_3C02E].field_0) << 5;
                    // 5867
                    dword_3C024 = (uint32)(stru_335C4[word_3C02E].field_2) << 5;
                    word_3C02C = stru_335C4[word_3C02E].field_4;
                }
                else { // 5877
                    stru_335C4[word_3C02E].field_8 = word_380C8;
                    stru_335C4[word_3C02E].field_A = word_380CA;
                    if (word_3370E != 0) keyValue = 0x87;
                } // 589b
                var_2 = 5;
            }
            else { // 58a2
                // .... word_3C02E & 0x1f
                dword_3C01C = stru_3B208[word_3C02E & 0x1f].field_2;
                dword_3C024 = stru_3B208[word_3C02E & 0x1f].field_6;
                word_3C02C = stru_3B208[word_3C02E & 0x1f].field_0;
                var_2 = 5;
            } // 58d9
        }
        else { // 58db
            dword_3C01C = (uint32)stru_3AA5E[word_3C02E & 0x3f].field_0 << 5;
            dword_3C024 = (uint32)stru_3AA5E[word_3C02E & 0x3f].field_2 << 5;
            // 5928
            word_3C02C = stru_3AA5E[word_3C02E & 0x3f].field_6 & 0x200 ? 0xc8 : 0x32;
            var_2 = 7;
            if (word_336EA != 0 && word_3370C == -1) var_2 = 6;
        } // 5943
        if (word_3370E == 0) var_2 = var_4;
        // 5967
        var_A = (dword_3C01C >> 5) - word_3BEC0;
        // 5981
        var_C = (dword_3C024 >> 5) - word_3BED0;
        var_6 = sub_1CFA6(var_A, var_C);
        word_3C5AA = sub_1D008(var_A, -var_C);
        // 59ba
        word_3BE94 = -sub_1D008((word_3C02C - word_380CE) >> 5, var_6);
        word_3B4E4 = 0;
        // 59d6
        var_8 = sub_1D190(word_3BE94, 0x18 << var_2);
        if (word_3C02E & 0x60 || word_3370E != 0) { // 59ea
            if (keyValue == 0x88) { // 59f2
                // 5a0b
                dword_3B1FE = sub_1D178(word_3C5AA + 0x8000, var_8) + dword_3B7DA;
                dword_3B4D4 = sub_1D190(word_3C5AA + 0x8000, var_8) + dword_3B7F8;
                // 5a53
                word_3B4DE = sub_1D178(word_3BE94, 0x18 << var_2) + (4 << var_2) + word_380CE; 
                word_3BE94 = -word_3BE94;
            }
            else { // 5a62
                dword_3B1FE = sub_1D178(word_3C5AA, var_8) + dword_3C01C;
                dword_3B4D4 = sub_1D190(word_3C5AA, var_8) - dword_3C024 + 0x100000;
                // 5ac3
                word_3B4DE = (4 << var_2) - sub_1D178(word_3BE94, 0x18 << var_2) + word_3C02C;
                if (word_3C02E & 0x40 && stru_3AA5E[word_3C02E & 0x3f].field_6 & 0x200 && word_3B4DE < 0x84) { 
                    word_3B4DE = 0x84;
                } // 5aed
                word_3C5AA += 0x8000;
            } // 5af2
        }
        else { // 5af5
            word_3C5AA = stru_335C4[word_3C02E].field_8;
            word_3BE94 = stru_335C4[word_3C02E].field_A - 0x400;
            // 5b22
            var_8 = sub_1D190(word_3BE94, 0x10 << var_2);
            dword_3B1FE = dword_3C01C - sub_1D178(word_3C5AA, var_8);
            // 5b68
            dword_3B4D4 = 0x100000 - (sub_1D190(word_3C5AA, var_8) + dword_3C024);
            // 5b88
            word_3B4DE = word_3C02C - sub_1D178(word_3BE94, 0x10 << var_2);
        }
        // 5b8c
        break;
    case 0x8c: // 5b8f
        word_3BE94 = 0xf400;
        word_3B4E4 = 0;
        dword_3B1FE = (int32)word_3C028 << 5;
        // 5bcf
        dword_3B4D4 = (0x8000 - (int32)word_3C03A) << 5;
        word_3B4DE = word_3C040;
        // 5bdc
        break;
    } // 5c33
    // 5c3d
    if (abs(word_3BE94) > 0x4000 || word_3BE94 == 0x8000) { // 5c4a
        // 5c51
        word_3BE94 = 0x8000 - word_3BE94;
        word_3C5AA += 0x8000;
        // 5c60
        word_3B4E4 = 0x8000 - word_3B4E4;
    } // 5c63
    if (keyValue == 0) { // 5c6a
        memcpy(unk_3A948, unk_3806E, 0x12);
    } 
    else {// 5c7e
        sub_20BAE(unk_3A948, word_3C5AA, word_3BE94, word_3B4E4);
    } // 5c96
    // 5ca1
    word_3B4DE = word_3B4DE < 0x10 ? 0x10 : word_3B4DE;
    var_E = word_330C2;
    word_330C2 = (keyValue & 0xc0) == 0;
    if (var_E != word_330C2) { // 5cc3
        gfx_jump_45_retrace();
        if (word_330C2 != 0) { // 5cd2
            gfx_jump_23();
            // the pointer arguments are probably rastports, RectCopy?
            gfx_jump_2a(*off_38364, 0, 0x61, *off_38334, 0, 0x61, 0x140, 0x67);
            // 5d23
            gfx_jump_2a(*off_38364, 0, 0x61, *off_3834C, 0, 0x61, 0x140, 0x67);
            sub_15FDB();
            sub_11A18();
            sub_11A88(word_330B2);
            if (word_3C09A == 0) { // 5d42
                sub_195C9(word_3BEC0, word_3BED0);
            } // 5d50
            word_336F4 = word_336F2 = 0xffff;
            sub_19FCC(3, 3);
            word_39604 = 0;
        } 
        else { // 5d6c
            gfx_jump_2a(*off_38334, 0, 0x61, *off_38364, 0, 0x61, 0x140, 0x67);
        }
    } // 5d96
    if (keyValue != word_38152) { // 5da2
        if (keyValue == 0x42 || keyValue == 0x43 || keyValue == 0x41) { // 5dba
            gfx_jump_45_retrace();
            if (gfx_jump_3f_modecode() == 3) { // 5dc9
                openBlitClosePic(keyValue == 0x42 ? a256left_pic : keyValue == 0x43 ? a256right_pic : a256rear_pic, *off_38334);
            } 
            else { // 5df3
                openBlitClosePic(keyValue == 0x42 ? aLeft_pic : keyValue == 0x43 ? aRight_pic : aRear_pic, *off_38334);
            } // 5e1b
            gfx_jump_2a(*off_38334, 0, 0x61, *off_3834C, 0, 0x61, 0x140, 0x67);
            // 5e50
            off_38334[0x10] = off_3834C[0x10] = 0x60;
        } 
        else { // 5e58
            off_38334[0x10] = off_3834C[0x10] = word_330C2 != 0 ? 0x60 : 0xc7;
        } // 5e75
        word_38152 = keyValue;
    } // 5e7b
    byte_34197 = byte_228D0[0x2f];
    *(uint8*)(&word_3BE98) = 3;
    if (word_38FDC == 0 && commData->gfxModeNum != 0) { // 5e9d
        byte_34197 = 3;
        *(uint8*)(&word_3BE98) = 0x0b;
    } // 5ea7
    sub_1229A(word_330BC);
    *(uint8*)(&word_36B86) = 0;
    // 5eeb
    sub_121CA(-word_3C5AA, word_3BE94, word_3B4E4, dword_3B1FE, dword_3B4D4, (int32)word_3B4DE, 0, 0, 0x140, off_38334[0x10] + 1);
    byte_3850E = 0;
    byte_3995A = word_36B86;
    // 5efc
    if (keyValue == 0x41) { // 5f06
        sub_160D3(unk_38128);
        gfx_jump_21(0xf);
        word_3755D = 0xf1;
        word_37561 = 0x15;
        word_3755F = 0xfb;
        word_37563 = 0x5e;
        // 5f34
        sub_2152A();
        word_3755D = 0x53;
        word_37561 = 0x15;
        word_3755F = 0x49;
        word_37563 = 0x5e;
        // 5f51
        sub_2152A();
        gfx_jump_23();
        var_E = byte_3C5A0;
        byte_3C5A0 = gfx_jump_2d();
        // 5f84
        sub_1A8C8(0x6b, 0x30, 0xd1, 0, 0x6f, 0x2f, 0);
        sub_1A8C8(0x41, 0x5f, 0x7d, 0x36, 0xc3, 2, 0);
        byte_3C5A0 = var_E;
    } // 5fb1
    gfx_jump_46_retrace2();
    // 5fd3
    // height of picture depending on whether view full or cockpit in the way?
    word_38126 = (word_3C09E == 0x13 || word_3C09A == 1 || word_330C2 == 0) ? 0xc8 : 0x61;
} // 5fda

// ==== seg000:0x8e50 ====
int sub_18E50(int arg_0) {
    int var_2, var_4, var_6, var_8, var_A, var_C, var_E, var_10, var_12, var_14, var_18, var_1A;
    char var_1C;
    byte_3C5A0 = gfx_jump_2d();
    var_16 = word_32A22[word_32A32 * 2] - word_3BEC0;
    var_1A = word_32A22[word_32A32 * 2 + 1] - word_3BED0;
    // 8e83
    word_3BE92 = sub_1D008(var_16, -var_1A);
    if (word_330C2 == 0) { // 8e96
        if (word_38FEA != 0 && keyValue & 0x80 == 0) { // 8eaa
            sub_19E44(0xd);
            sub_19E5D(0, 0, 0x13f, 0x60);
            gfx_jump_4f(0x3c);
        } // 8ed2
        byte_37C2F = 1;
        if (keyValue == 0 && byte_37C24 == 0) { // 8eeb
            if (commData->setupUseJoy) { // 8ef9
                sub_19E44(0);
                sub_19C0C(0x115, 0x53, 0x125, 0x53);
                sub_19C0C(0x125, 0x53, 0x125, 0x5f);
                // 8f3e
                sub_19C0C(0x125, 0x5f, 0x115, 0x5f);
                sub_19C0C(0x115, 0x5f, 0x115, 0x53);
                sub_19C0C(0x11d, 0x59, 0x11d, 0x59);
                // 8f74
                sub_19E44(0xf);
                var14 = ((noJoy80 - 0x78) >> 4) + 0x11d;
                // 8fa1
                var_18 = (((byte_37F95 << 1 + byte_37F95) - 0x168) >> 6) + 0x59;
                sub_19C0C(var_14 - 1, var_18, var_14 + 1, var_18);
                // 8fc8
                sub_19C0C(var_14, var_18 + 1, var_14, var_18 - 1);
            } // 8fce
            if (word_391FE & 0x200) { // 8fd6
                sub_19E44(0xf);
                sub_19C0C(0x9c, 0x59, 0xa4, 0x59);
                sub_19C0C(0xa0, 0x56, 0xa0, 0x5c);
            } // 900c
            sub_19E44(word_330BC != 0 ? 4 : 0);
            // 903b
            var_10 = sub_1CF64((((word_3C5A6 - word_3AA5A) * 2) / 5) + 0x1d, 0, 0x3d);
            if (var_10) sub_19C0C(0x48, 0x55 - var_10, 0x48, 0x55);
        } // 93c4
    } // 93cf
} // 94d0

// ==== seg000:0x9e44 ====
void sub_19E44(int arg_0) {
    off_38334[2] = arg_0;
    off_3834C[2] = arg_0;
}

// ==== seg000:0x9e5d ====
void sub_19E5D(int arg_0, int arg_2, int arg_4, int arg_6) {
    sub_21444(off_38334, arg_0, arg_2, arg_4, arg_6);
    sub_21444(off_3834C, arg_0, arg_2, arg_4, arg_6);
}

// ==== seg000:0xa0cb ====
int drawSomeStrings(char *arg_0, int arg_2, int arg_4, int arg_6) {
    drawString(off_38334, arg_0, arg_2, arg_4, arg_6);
    drawString(off_3834C, arg_0, arg_2, arg_4, arg_6);
}

// ==== seg000:0xa13a ====
int drawString(int* arg_0, char *arg_2, int arg_4, int arg_6, int arg_8) {
    arg_0[6] = 0;
    arg_0[4] = arg_4;
    arg_0[5] = arg_6;
    arg_0[2] = arg_8;
    gfx_jump_05_drawString(arg_0, strupr(arg_2), strlen(arg_2));
}