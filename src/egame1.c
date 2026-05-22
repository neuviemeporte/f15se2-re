// seg000 debug code (/Zi)
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"
#include "comm.h"

#include <dos.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// ==== seg000:0x1d10 ====
void sub_11D10(int arg_0, int arg_2) {
    if (var_654 >= 255) {
        return;
    }
    *(int *)&byte_3B7FC[var_654 * 6] = word_38FE0;
    byte_3B7FC[var_654 * 6 + 2] = (unsigned)word_3BEC0 >> 7;
    byte_3B7FC[var_654 * 6 + 3] = (unsigned)word_3BED0 >> 7;
    byte_3B7FC[var_654 * 6 + 4] = arg_0;
    byte_3B7FC[var_654 * 6 + 5] = arg_2;
    var_654++;
    byte_3B7FC[var_654 * 6 + 4] = 0;
}

// ==== seg000:0x1d6e placeString ====
void placeString(int param_1) {
    strcpy((char *)strBuf, (char *)word_3C0A2[(stru_3AA5E[param_1].field_C) & 0x7f]);
    if (strlen((char *)word_3C0A2[(&word_3AA5C)[param_1 * 8]])) {
        if (strlen((char *)word_3C0A2[(stru_3AA5E[param_1].field_C) & 0x7f])) {
            strcat((char *)strBuf, (char *)aAt);
        }
        strcat((char *)strBuf, (char *)word_3C0A2[(&word_3AA5C)[param_1 * 8]]);
    }
    if ((int)strlen((char *)strBuf) > 25) {
        byte_38F8C = '.';
        byte_38F8D[0] = 0;
    }
}

// ==== seg000:0x14e8 ====
int sub_114E8(void) {
    int p, a, b, c, d, e, f, g;
    keyDispatch(keyScancode);
}

// ==== seg000:0x1bfd scheduleTimedEvent ====
void sub_11BFD(int arg_0, int arg_2) {
    if (word_3370E == 0) {
        return;
    }
    keyValue = arg_0;
    word_3370C = arg_2 * word_330C4 + word_336E8;
}

// ==== seg000:0x1bc3 ====
void sub_11BC3(int arg_0, unsigned int arg_2) {
    if (arg_2 > (unsigned int)word_3370E) return;
    if (word_3370C != -1) return;
    word_3C02E = arg_0;
    sub_11BFD(0x89, word_3370E == 1 ? 3 : 4);
}

// ==== seg000:0x5540 ====
int sub_15540(int arg_0) {
    return 0x4000 - sub_154B7(arg_0);
}

int sub_15557(int arg_0) {
    int p;
    int a;
    arg_0 = abs(arg_0);
    if (arg_0 < 4) {
        return 1;
    }
    a = arg_0 >> 2;
    do {
        p = arg_0 / a;
        a = (a + p) >> 1;
    } while (abs(a - p) > 1);
    return a;
}

// ==== seg000:0x147 ====
void drawCockpit() {
    TRACE(("drawCockpit: enter, theater=%d", gameData->theater));
    sub_11E0E();
    load15Flt3d3();
    TRACE(("drawCockpit: after load15Flt3d3, scenPlh0=%04x, scenarioPlh@%04x", (unsigned)scenarioPlh[0], (unsigned)&scenarioPlh[0]));
    strcpy(regnStr, scenarioPlh[gameData->theater]);
    TRACE(("drawCockpit: regnStr=%s", regnStr));
    TRACE(("drawCockpit: calling sub_121C6"));
    sub_121C6();
    TRACE(("drawCockpit: after sub_121C6"));
    // 0x16e
    f15DgtlResult = loadF15DgtlBin();
    TRACE(("drawCockpit: f15DgtlResult=%d", f15DgtlResult));
    // 0x179
    byte_34197 = byte_228D0[0x2f];
    // 17c
    if ((byte_32933 = gfx_jump_4c()) != 0) {
        setupDac();
    }
     gfx_jump_44_setDac(1);
     gfx_jump_45_retrace();
     TRACE(("drawCockpit: opening pic"));
     // 1a1
     if (gfx_jump_3f_modecode() == 3) {
        openBlitClosePic(a256pit_pic, 1);
     }
     else {
        openBlitClosePic(aCockpit_pic, 1);
     }
     TRACE(("drawCockpit: pic done"));
     // 1df
     gfx_jump_2a(1, 0, 0x60, 0, 0, 0x60, 0x140, 0x68);
     gfx_jump_2a(1, 0, 0x60, 2, 0, 0x60, 0x140, 0x68);
     TRACE(("drawCockpit: done"));
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
        dword_3B7DA = ((int32)waypoints[0].field_0 << 5) + 2;
        // 1ef5
        dword_3B7F8 = (0x8000 - (int32)waypoints[0].field_2) << 5;
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
    moveNearFar(&word_3AA5C, word_3BED2 * 16);
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
    moveNearFar(waypoints, 0x10);
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
    farPointer = (uint8 FAR*)&commData->worldBuf;
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
            sub_11A88(missileSpecIndex);
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
    copySomeMem(word_330BC);
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
    int var_2, var_4, var_6, var_8, var_A, var_C, var_E, var_10, var_12, var_14, var_16, var_18, var_1A;
    char var_1C;
    byte_3C5A0 = gfx_jump_2d();
    // probably x,y
    var_16 = waypoints[waypointIndex].field_0 - word_3BEC0;
    var_1A = waypoints[waypointIndex].field_2 - word_3BED0;
    // 8e83
    word_3BE92 = sub_1D008(var_16, -var_1A);
    if (word_330C2 != 0) { // 8e96
        if (word_38FEA != 0) { // 8e9d
            word_38FEA = 0;
            if (!(keyValue & 0x80)) { // 8eaa
                sub_19E44(0xd);
                sub_19E5D(0, 0, 0x13f, 0x60);
                gfx_jump_4f(0x3c);
            }
        } // 8ed2
        byte_37C2F = 1;
        if (keyValue == 0 && byte_37C24 == 0) { // 8eeb
            if (!commData->setupUseJoy) { // 8ef9
                sub_19E44(0);
                sub_19C0C(0x115, 0x53, 0x125, 0x53);
                sub_19C0C(0x125, 0x53, 0x125, 0x5f);
                // 8f3e
                sub_19C0C(0x125, 0x5f, 0x115, 0x5f);
                sub_19C0C(0x115, 0x5f, 0x115, 0x53);
                sub_19C0C(0x11d, 0x59, 0x11d, 0x59);
                // 8f74
                sub_19E44(0xf);
                var_14 = ((int16)(joyAxes[0] - 0x78) >> 4) + 0x11d;
                // 8fa1
                var_18 = ((int16)((joyAxes[1] * 3) - 0x168) >> 6) + 0x59;
                sub_19C0C(var_14 - 1, var_18, var_14 + 1, var_18);
                // 8fc8
                sub_19C0C(var_14, var_18 + 1, var_14, var_18 - 1);
            } // 8fce
            if (planeFlags & 0x200) { // 8fd6
                sub_19E44(0xf);
                sub_19C0C(0x9c, 0x59, 0xa4, 0x59);
                sub_19C0C(0xa0, 0x56, 0xa0, 0x5c);
            } // 900c
            sub_19E44(word_330BC != 0 ? 4 : 0);
            // 9041
            var_10 = sub_1CF64((((word_3C5A6 - word_3AA5A) * 2) / 5) + 0x1d, 0, 0x3d);
            if (var_10) sub_19C0C(0x48, 0x55 - var_10, 0x48, 0x55);
            // 9089
            sub_19C0C(0xf7,  0x38, 0xf7, sub_1CF64(-((word_3C8B6 >> 4) - 0x38), 0x14, 0x55));
            // 908f
            if ((planeFlags & 1) == 0 && (word_336E8 & 1) != 0 && gameData->unk4 != 0 && word_3C8B6 < 0) { // 90af
                var_2 = (((stru_3AA5E[word_3C16A].field_6 & 0x200 ? 0x100 : 0x80) / gameData->unk4) >> 4) + 0x38;
                sub_19E44(0xf);
                // 90f7
                sub_19C0C(0xf2, var_2 - 2, 0xf4, var_2);
                sub_19C0C(0xf2, var_2 + 2, 0xf4, var_2);
            } // 9115
            // stall warning display
            if (word_3AA5A < word_3C5A6 && word_3BEBE != word_380CE && word_336E8 & 1) { // 912e
                draw2Strings(aStallWarning, 0x84, 0x1e, 0xf);
            } // 9144
            if (word_3C45C == 0 || word_3C45C == 2) { // 9152
                sub_19E44(7);
                word_3C008 = (word_38FC4 >> 6) + 0x38;
                if (word_3C008 > 0xa && word_3C008 < 0x6f) { // 9173
                    sub_1A8C8(0x9a, word_3C008 - 4, 0x94, 0x15, 0x0b, 7, 0xf);
                }
            } // 9198
            if (word_3C45C == 1) { // 91a2
                var_1C = byte_37C24 + 4;
                var_14 = (word_3C6A4 >> var_1C) + 0x9f;
                var_18 = (word_3C6AC >> var_1C) + 0x38;
                // 91c3
                if (var_14 > 0xa && var_14 < 0x135 && var_18 > 8 && var_18 < 0x5b) { // 91da
                    sub_1A8C8(var_14 - 6, var_18 - 5, 0x91, 0x4, 0xd, 0xb, 0xe);
                } // 9202
                // 7 = air to air? Only Sidewinder and Amraam have it
                if (sams[missiles[missleSpec[missileSpecIndex].field_0].field_16].field_C == 7) { // 9223
                    sub_19E44((uint8)gfxModeUnset != 0 ? 0xf : 7);
                    // 9239
                    for (var_A = 0; var_A <= 0x100; var_A += 0x10) { // 924b
                        var_4 = var_A << 8;
                        var_8 = sub_1D178(var_4, 0x28) + 0x9f;
                        // 9278
                        var_C = -(sub_1D190(var_4, 0x23) - 0x38);
                        if (var_A != 0) sub_19C0C(var_8, var_C, var_E, var_12);
                        // 9294
                        var_E = var_8;
                        var_12 = var_C;
                    }
                }
            } // 929f
            sub_1A183(word_3AA5A, 0x50, 0x36, 0xf);
            if (word_380D0 <= 0x4e20) { // 92bd
                sub_1A183(word_380D0 < 0x64 ? word_380D0 : (word_380D0 / 5) * 5, 0xe4, 0x36, 0xf);
            } // 92ee
            if (word_3370A > 1) { // 92f5
                drawSomeStrings(aAccel, 0x96, 0x4, 0xf);
            } // 930b
            if (planeFlags & 0x1000) { // 9313
                drawSomeStrings(aTraining, 0xea, 0x10, 0xf);
            } // 9329
            if (word_330B6 != 0) { // 9330
                drawSomeStrings(aAutopilot, 0xec, 0x5a, 0xf);
            } // 9346
            var_6 = sub_1CF64((((word_3BE92 - word_380C8) >> 6) / 3) + 0x9f, 0x59, 0xe5);
            sub_19E44(0x0b);
            sub_19C0C(var_6 - 2, 0xf, var_6, 0x11);
            // 93a0
            sub_19C0C(var_6, 0x11, var_6 + 2, 0xf);
            sub_19C0C(var_6 - 2, 0xf, var_6 + 2, 0xf);
            goto somewhere;
        } // 93c4
somewhere:
        sub_1A25C(byte_3C5A0);
    } // 93cf
    if (word_383F2 != 0 && ((keyValue == 0 && byte_37C24 == 0) || (word_3370E != 0))) { // 93eb
        draw2Strings(tempString, -(((int16)strlen(tempString) >> 1) - 0x28) * 4, 0x18, 0xf);
        word_383F2--;
        // 9417
        if (word_336EA == 1) { // 941e
            draw2Strings(aPressAnyKeyToP, 0x78, 1, word_330BC != 0 ? 0xe : 0);
        }
    } // 943f
    if (word_383F4 != 0 && keyValue == 0 && byte_37C24 == 0) { // 9454
        draw2Strings(string_3C04A, -(((int16)strlen(string_3C04A) >> 1) - 0x28) * 4, 0x5a, 0xf);
        word_383F4--;
    } // 9480
} // 9485

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
    drawStringCentered(var_564, arg_0, arg_2, arg_4, arg_6);
    drawStringCentered(var_565, arg_0, arg_2, arg_4, arg_6);
}

// ==== seg000:0xa13a ====
int drawStringCentered(int* arg_0, char *arg_2, int arg_4, int arg_6, int arg_8) {
    arg_0[6] = 0;
    arg_0[4] = arg_4;
    arg_0[5] = arg_6;
    arg_0[2] = arg_8;
    gfx_jump_05_drawString(arg_0, strupr(arg_2), strlen(arg_2));
}



// ==== seg000:0x8e38 ====
int sub_18E38(void) {
    sub_19FAD(2, 0x5950, 0);
}

// ==== seg000:0x9be1 ====
int sub_19BE1(int arg_0, int arg_2, int arg_4, int arg_6) {
    sub_19C84(arg_0, arg_2, arg_4, arg_6, 0, 0x13f, 0, 199, 1);
}

// ==== seg000:0x957a ====
void sub_1957A(int arg_0) {
    int p;
    if (arg_0 == word_3C09E) {
        sub_194D0(arg_0);
    }
}

// ==== seg000:0x9e94 ====
int sub_19E94(int arg_0, int arg_2, int arg_4) {
    sub_19E44(arg_4);
    sub_19BE1(arg_0, arg_2, arg_0, arg_2);
}

// ==== seg000:0x9ea0 ====
void routine_328(int arg_0, int arg_2, int arg_4) {
    sub_19E44(arg_4);
    sub_19BE1(arg_0, arg_2, arg_0, arg_2);
}

// ==== seg000:0xdaae ====
void sub_1DAAE(void) {
    if (word_330C4 > 15) {
        var_595 = sub_1CF64((-(120 / word_330C4 - 9)) >> 1, 1, 4);
    } else {
        var_595 = 0;
    }
    word_330C4 = sub_1CF64(word_330C4, 4 - word_3370A, 15);
    word_3AFA4 = sub_1CF64(word_330C4 << 1, 3, 16);
    word_3B0AC = 250 * word_330C4;
    word_3995C = 200 * word_330C4;
}

// ==== seg000:0xdb9c ====
int sub_1DB9C() {
    if (word_3370A == 2) {
        word_3370A = 1;
        word_330C4 <<= 1;
        sub_1DAAE();
    }
}

// ==== seg000:0x9fad ====
int sub_19FAD(int arg_0, int arg_1, int arg_2) {
    sub_19FCC(arg_0, arg_2);
    sub_1A030(arg_0, (char *)arg_1);
}

// ==== seg000:0xa7c4 ====
void sub_1A7C4(int arg_0, int arg_2) {
    int p;
    int a;
    char b;
    word_3C016 = 0;
    b = 7 - (char)var_588;
    p = (arg_0 - word_3BEC0) >> b;
    a = (word_3BED0 - arg_2) >> b;
    var_279 = sub_1D190(var_542, p) - sub_1D178(var_542, a);
    var_282 = sub_1D190(var_542, a) + sub_1D178(var_542, p);
    var_279 += 0xa0;
    var_282 = -var_282 + 0x98;
    if (var_279 < 0x7c || var_279 > 0xc3) {
        word_3C016 = -1;
    }
    if (var_282 < 0x6b || var_282 > 0xac) {
        word_3C016 = -1;
    }
}

// ==== seg000:0xa204 ====
void sub_1A204(char *arg_0) {
    strcpy(string_3C04A, arg_0);
    var_592 = word_330C4 * 3;
}

// ==== seg000:0xdbe0 ====
void sub_1DBE0(void) {
    byte_3BF93[0] = 0;
    regs.h.al = 0x8D;
    int86(0x10, &regs, &regs);
}

// ==== seg000:0x18d5 ====
int sub_118D5() {
    if (word_3BFA2 > 0) {
        if (word_3B4DC > -16) {
            word_3B4DC -= 12;
        }
        word_3BFA2 += word_3B4DC;
    }
}

// ==== seg000:0xc7a2 ====
int sub_1C7A2(int arg_0) {
    return sub_1C7EA(stru_3AA5E[arg_0].field_0, stru_3AA5E[arg_0].field_2, 1);
}

// ==== seg000:0xc7c6 ====
int sub_1C7C6(int arg_0) {
    return sub_1C7EA(*(int *)&unk_3B202[2 + arg_0 * 36], *(int *)&unk_3B202[4 + arg_0 * 36], 0);
}

// ==== seg000:0x9d86 ====
int sub_19D86(int arg_0, int arg_1, int arg_2, int arg_3) {
    sub_19C84(arg_0, arg_1, arg_2, arg_3, 0, 0x13f, 0, 0xc7, 0);
}

// ==== seg000:0x9db0 ====
void sub_19DB0(int arg_0, int arg_2, int arg_4, int arg_6) {
    if (var_456 != 0) {
        if (gameData->unk4 < 2) {
            sub_19C0C(arg_0, arg_2, arg_4, arg_6);
        } else {
            sub_19C84(arg_0, arg_2, arg_4, arg_6, 0x68, 0xd8, 0x3e, 0x60, 0);
        }
    } else if (word_330B8 != 0) {
        sub_19C84(arg_0, arg_2, arg_4, arg_6, 0x30, 0x10f, 0x0f, 0x60, 0);
    } else {
        sub_19C0C(arg_0, arg_2, arg_4, arg_6);
    }
}

// ==== seg000:0xa183 ====
void sub_1A183(int arg_0, int arg_1, int arg_2, int arg_3) {
    char buf[20];
    itoa(arg_0, buf, 10);
    drawSomeStrings(buf, arg_1, arg_2, arg_3);
}

// ==== seg000:0xc1b9 ====
void sub_1C1B9(int arg_0, int arg_2, int arg_4, int arg_6) {
    int p;
    int a;
    int b;
    int c;
    int d;

    if (word_330C2 == 0) {
        return;
    }
    if (var_456 != 0) {
        arg_4 >>= 1;
    }
    p = arg_4 - (arg_4 >> 2);
    c = arg_0 + arg_4;
    a = arg_0 - arg_4;
    d = arg_2 + p;
    b = arg_2 - p;
    if (arg_6 == 0) {
        sub_19DB0(a, b, a, d);
        sub_19DB0(a, d, c, d);
        sub_19DB0(c, d, c, b);
        sub_19DB0(c, b, a, b);
    } else {
        sub_19DB0(arg_0, b, c, arg_2 - (p >> 1));
        sub_19DB0(c, arg_2 - (p >> 1), c, arg_2 + (p >> 1));
        sub_19DB0(c, (p >> 1) + arg_2, arg_0, d);
        sub_19DB0(arg_0, d, a, (p >> 1) + arg_2);
        sub_19DB0(a, arg_2 + (p >> 1), a, arg_2 - (p >> 1));
        sub_19DB0(a, arg_2 - (p >> 1), arg_0, b);
    }
}

// ==== seg000:0xc7ea ====
void sub_1C7EA(int arg_0, int arg_1, int arg_2) {
    int p;
    int a;
    p = word_3BEC0 - arg_0;
    a = word_3BED0 - arg_1;
    if (arg_2 != 0) {
        var_674 = sub_1D008(-p, a);
    }
    var_672 = sub_1CFA6(p, a);
    goto done;
done:;
}

// ==== seg000:0xa1b1 ====
int sub_1A1B1(int arg_0, int arg_1) {
    byte_3BF93[0] = 0x0D;
    *(int *)unk_3BF96 = arg_0;
    *(int *)unk_3BF98 = arg_1;
    unk_3BF95 = 0;
    int86(0x10, &regs, &regs);
    return regs.h.al;
}

// ==== seg000:0xa1e4 ====
void tempStrcpy(char *arg_0) {
    strcpy(tempString, arg_0);
    var_591 = word_330C4 * 3;
}

// ==== seg000:0xa0fe ====
void draw2Strings(char *arg_0, int arg_1, int arg_2, int arg_3) {
    if (byte_3C5A0 == 0) {
        drawStringCentered(var_564, arg_0, arg_1, arg_2, arg_3);
    } else {
        drawStringCentered(var_565, arg_0, arg_1, arg_2, arg_3);
    }
}

// ==== seg000:0x9595 ====
void sub_19595(void) {
    word_3C09A = 0;
    word_3C018 = 0x18;
    word_3C45E = 0x60;
    word_3C01A = 0x70;
    word_3C5A2 = 0xa8;
    word_38FC8 = 0x48;
    word_38FCC = 0x38;
    zoomIn();
}

// ==== seg000:0x9fcc ====
void sub_19FCC(int arg_0, int arg_1) {
    sub_19E44(arg_1);
    if (arg_0 == 1) {
        sub_19E5D(0x18, 0x70, 0x60, 0xa8);
    }
    if (arg_0 == 2) {
        sub_19E5D(0x78, 0x68, 0xc7, 0xaf);
    }
    if (arg_0 == 3) {
        sub_19E5D(0xe8, 0x80, 0x130, 0xb8);
    }
}

// ==== seg000:0x9a4d ====
extern int sub_198FA(int);
extern int sub_19915(int);

int sub_19A4D(int arg_0, int arg_1) {
    int p;
    int a;
    int b;
    if (word_3C09A != 0) return 0;
    p = sub_198FA(arg_0);
    a = sub_19915(arg_1);
    p = sub_1CF64(p, word_3C018, word_3C45E);
    a = sub_1CF64(a, word_3C01A, word_3C5A2);
    b = -1;
    if (p > word_3C018 && p < word_3C45E && a > word_3C01A && a < word_3C5A2) {
        b = sub_1A1B1(p, a);
    }
    return b;
}

// ==== seg000:0x9b98 ====
void sub_19B98(int arg_0, int arg_1, int arg_2, int arg_3) {
    sub_19C84(sub_198FA(arg_0), sub_19915(arg_1), sub_198FA(arg_2), sub_19915(arg_3), word_3C018, word_3C45E, word_3C01A, word_3C5A2, 1);
}

// ==== seg000:0x9875 ====
void zoomIn(void) {
    if (keyValue & 0x80) {
        word_336FE--;
    } else {
        if (word_3C09A == 0 && byte_383E5 < 9) {
            byte_383E5++;
            sub_195C9(word_3BEC0, word_3BED0);
        }
        if (word_3C09A == 1) {
            var_588++;
        }
    }
}

// ==== seg000:0x98b1 ====
void zoomOut(void) {
    if (keyValue & 0x80) {
        word_336FE++;
    } else {
        if (word_3C09A == 0 && byte_383E5 > 2) {
            byte_383E5--;
            sub_195C9(word_3BEC0, word_3BED0);
        }
        if (word_3C09A == 1 && var_588 != 0) {
            var_588--;
        }
    }
}

// ==== seg000:0x8a44 ====
extern int sub_1D200(int);
void sub_18A44(void) {
    int p;
    if (!(planeFlags & 0x1000) && word_336EA != -1) {
        p = 0;
        goto check;
        do {
            word_33096 |= (1 << sub_1D200(8));
            word_3BF90++;
            p++;
    check:;
        } while (p <= word_330B8);
        sub_1957A(0x16);
        word_38FEA = 1;
        makeSound(0, 2);
    }
}

// ==== seg000:0x606c ====
void sub_1606C(void) {
    if (word_330C2 == 0) {
        return;
    }
    sub_19E44(0);
    sub_19E5D(5, 0x6d, 0x0a, 0x98);
    sub_19E44(word_33098 > 2000 ? 2 : 14);
    sub_19E5D(5, -(word_33098 / 250 - 0x98), 0x0a, 0x98);
}

// ==== seg000:0x98fa ====
int sub_198FA(int arg_0) {
    return ((arg_0 - var_589) >> (10 - (int)byte_383E5)) + 0x3C;
}

// ==== seg000:0x9915 ====
int sub_19915(int arg_0) {
    return (((arg_0 - var_590) >> (10 - (int)byte_383E5)) * 3 >> 1 >> 1) + 0x8C;
}

// ==== seg000:0x993a ====
int sub_1993A(int arg_0, int arg_2, int arg_4, int arg_6) {
    int p;
    int a;
    if (word_3C09A != 0 || word_330C2 == 0) {
        return 0;
    }
    p = sub_198FA(arg_0);
    a = sub_19915(arg_2);
    if (arg_4 != -1 && p >= word_3C018 && p < word_3C45E - 1 && a >= word_3C01A && a < word_3C5A2 - 1) {
        routine_328(p, a, arg_4);
        if (arg_6 != 0) {
            routine_328(p + 1, a, arg_4);
            routine_328(p, a + 1, arg_4);
            routine_328(p + 1, a + 1, arg_4);
        }
        return 0;
    } else {
        return 1;
    }
}

// ==== seg000:0xC2F8 ====
void sub_1C2F8(void) {
    int p;
    int a;
    if (var_671 != 0 && word_330C2 != 0) {
        if (byte_3C5A0 != 0) {
            draw2Strings((char *)aMissileLock, 0xf4, 0x96, 14);
        }
        sub_19E44(14);
        p = 0x10c;
        a = 0x9c;
        sub_19BE1(0x102, 0x9c, 0x116, 0x9c);
        sub_19BE1(p, a - 8, p, a + 8);
    }
}

// ==== seg000:0xc371 ====
void sub_1C371(char *arg_0, int arg_2, int arg_4) {
    if (var_279 == -1) {
        return;
    }
    sub_19E44(arg_2);
    if (arg_4 < var_279 && 0x13f - arg_4 > var_279 &&
        arg_4 < var_282 && 0x58 - arg_4 > var_282) {
        sub_1C1B9(var_279, var_282, arg_4, 1);
    }
    if (var_279 > 0x14 && var_279 < 0x118 &&
        var_282 > 0 && var_282 < 0x52) {
        draw2Strings(arg_0, var_279 - (int)strlen(arg_0) * 2, var_282 + 5, word_38F72);
    }
}

// ==== seg000:0xdb2b ====
void sub_1DB2B(void) {
    int p;
    for (p = 0; p < 6; p++) {
        ((int *)(byte_3419F + 13))[p] = 0x20 << ((char)p + (char)(word_38FDC > 2 ? 2 : word_38FDC));
    }
    var_196 = var_195 + var_194;
    var_197 = sub_1CF64(var_195 << 1, 0x1000, 9999);
    var_198 = (word_38FDC > 2 ? 2 : word_38FDC) * 0xD05 + 0xD05;
}

// ==== seg000:0x99ec ====
int sub_199EC(int arg_0, int arg_2, int *arg_4, int *arg_6) {
    if (word_330C2 == 0) {
        return 0;
    }
    *arg_4 = sub_198FA(arg_0);
    *arg_6 = sub_19915(arg_2);
    if (word_3C018 < *arg_4 && word_3C45E - 1 > *arg_4 &&
        word_3C01A < *arg_6 && word_3C5A2 - 1 > *arg_6) {
        return 1;
    } else {
        return 0;
    }
}

// ==== seg000:0x1636 ====
void sub_11636(void) {
    int p;
    for (p = 0; p < 4; p++) {
        if (*((int16 *)((char *)&word_333DA + p * 12)) != 0) {
            (*((int16 *)((char *)&word_333DA + p * 12)))--;
            if (*((int16 *)((char *)&word_333DA + p * 12)) == 0) {
                *((int16 *)((char *)&word_333D8 + p * 12)) = 0;
            }
        }
    }
}

// ==== seg000:0x0294 routine_6 ====
int sub_10294() {
}

// ==== seg000:0x0297 routine_5 ====
int sub_10297() {
}

// ==== seg000:0x1b37 routine_148 ====
int sub_11B37(int arg_0) {
    if (word_3BE3C != 0 && arg_0 != 0) {
        return;
    }
    *((uint8 *)&word_3C6AC + 0x204) = 1;
    commData->continueFlag = arg_0;
    if (arg_0 == 0 && word_3BE3C == 0) {
        commData->setupDone = 3;
    }
    *(int16 far *)((char far *)commData + 0x74) = word_3BEC0;
    *(int16 far *)((char far *)commData + 0x76) = word_3BED0;
    *(int16 far *)((char far *)commData + 0x34) = word_33096;
    *(int16 far *)((char far *)commData + 0x36) = word_3BF90;
    commData->unk8[0] = word_38FF6;
    commData->unk8[1] = word_33710;
    sub_11D10(8, 0);
}

// ==== seg000:0x1841 ====
int sub_11841() {
    int p;
    int a;

    if (word_336F6 != -1) {
        for (p = 0; p < 8; p++) {
            ((struct struc_9 *)stru_33402)[p].field_4 += 0x0a;
            ((struct struc_9 *)stru_33402)[p].field_2 += ((struct struc_9 *)stru_33402)[p].field_4 >> 9;
            *(((char *)&((struct struc_9 *)stru_33402)[p].field_6) + 1) += 6;
        }
        if (!((char)word_336E8 & 0x0f)) {
            a = (word_336E8 >> 4) & 7;
            ((struct struc_9 *)stru_33402)[a].field_0 = *(int16 *)((char *)stru_3AA5E + word_336F6 * 16);
            ((struct struc_9 *)stru_33402)[a].field_2 = *(int16 *)((char *)stru_3AA5E + word_336F6 * 16 + 2);
            ((struct struc_9 *)stru_33402)[a].field_4 = 0x80;
            ((struct struc_9 *)stru_33402)[a].field_6 = sub_1D200(0x100) << 8;
            word_33442 = a;
        }
    }
}

// ==== seg000:0x1971 ====
int sub_11971() {
    int p;
    for (p = 0; p < word_3C046; p++) {
        *(int *)((char *)&stru_3B208[p] + 26) = -1;
    }
    word_336E6 = -1;
}

// ==== seg000:0x1c21 routine_180 ====
int sub_11C21(void) {
    int p;

    if (word_3370C != -1) {
        return;
    }
    word_330B6 = 500;
    word_3370E = 2;
    switch (sub_1D200(3)) {
    case 0:
        p = sub_1D200(word_3BED2 - 3) + 3;
        word_3C02E = p + 0x40;
        keyValue = 0x89;
        placeString(p);
        tempStrcpy((char *)strBuf);
        break;
    case 1:
        do {
            p = sub_1D200(word_3C046);
        } while (*(int16 *)&stru_3B208[p].field_10[10] == 0);
        word_3C02E = p + 0x20;
        keyValue = 0x89;
        strcpy((char *)strBuf, (char *)(*(int16 *)&stru_3B208[p].field_10[6] * 32 + 0x2c8));
        strcat((char *)strBuf, (char *)aOnPatrol);
        tempStrcpy((char *)strBuf);
        break;
    case 2:
        keyValue = 0x87;
        tempStrcpy((char *)aF15StrikeEagle);
        break;
    }
}

// ==== seg000:0x94d0 routine_189 ====
void sub_194D0(int arg_0) {
    int p, a, b, c, d, e, f, g, h, i;
    if (word_330C2 == 0) {
        return;
    }
    switch (arg_0) {
    case 0x13:
        strcpy(strBuf, aTrackcam);
        switch (*(int16 *)((char *)&word_3C6AC + 0x206)) {
        case 0:
            strcat(strBuf, aAhead);
            break;
        case (int16)0x8000:
            strcat(strBuf, aRear);
            break;
        case 0x4000:
            strcat(strBuf, aRight);
            break;
        case (int16)0xC000:
            strcat(strBuf, aLeft);
            break;
        }
        sub_19FAD(2, (int)strBuf, 3);
        break;
    }
    word_3C09E = arg_0;
}

// ==== seg000:0x1a18 routine_131 ====
int sub_11A18() {
    int p;
    int a;

    if (word_330C2 == 0) {
        return;
    }
    for (a = 0; a < 3; a++) {
        sub_19E44(0);
        p = (&word_38202)[a];
        sub_19E5D(p - 1, 0xbe, p + 2, (int)&allocSize);
        sub_1A183((&missileSpecIndex)[a * 2 + 1], p, 0xbe, 0x0c);
    }
}

// ==== seg000:0x9adb ====
void sub_19ADB(int param_1, int param_2, int param_3, int param_4, int param_5, int param_6, int param_7)
{
    int p;
    int a;
    int b;
    int c;
    int d;
    int e;
    int f;

    if (param_7 < param_6) {
        param_6 += 0x100;
    }
    sub_19E44(param_4);
    for (b = param_6; b <= param_7; b += 0x10) {
        p = *(unsigned char *)&b << 8;
        a = sub_1D178(p, param_3) + param_1;
        d = param_2 - sub_1D190(p, param_3);
        if ((unsigned)a > 0xC000u) {
            a = 0;
        }
        if ((unsigned)d > 0xC000u) {
            d = 0;
        }
        if (b != param_6 && param_5 != 0) {
            sub_19B98(a, d, c, f);
        } else {
            sub_1993A(a, d, param_4, 0);
        }
        c = a;
        f = d;
    }
}

// ==== seg000:0xa224 ====
int routine_260(int param_1, int param_2) {
    return (int)(char)var_83[param_1 * 13 + ((int)(char)byte_3BFA4[stru_3AA5E[param_2].field_C & 0x7f] & 0xf)];
}

// ==== seg000:0xc40b ====
void sub_1C40B(int param_1) {
    int p;
    int a;
    int b;
    int c;
    int d;

    strcpy(strBuf, aRange);
    strcat(strBuf, itoa(param_1 >> 6, unk_3C030, 10));
    strcat(strBuf, aDot);
    strcat(strBuf, itoa((param_1 & 0x3f) * 2 / 13, unk_3C030, 10));
    strcat(strBuf, aKm);
}

// ==== seg000:0xc864 ====
int sub_1C864(int param_1) {
    if (stru_3AA5E[param_1].field_6 & 0x80) {
        return (sub_1C8A4(param_1) ? (int)(char)byte_3BEC4[0] : (int)(char)byte_3C02A[0]) + 0x100;
    }
    return stru_3AA5E[param_1].field_C;
}

// ==== seg000:0xc8a4 ====
int sub_1C8A4(int param_1) {
    int p;

    p = ((char *)byte_3BFA4)[stru_3AA5E[param_1].field_C & 0x7f] & 0x0f;
    return (p == 0x0c || p == 9 || p == 0x0b) ? 1 : 0;
}

