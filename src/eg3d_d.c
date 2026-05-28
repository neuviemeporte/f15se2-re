// seg000 debug code (/Zi)
#include "egame.h"
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
        gfx_flipPage();
        misc_jump_5b_getkey();
    } // 2b1a
    gfx_waitRetrace();
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
void load3DG() {
    int unused_1, unused_2, unused_3;
    strcpyFromDot(regnStr, a_3dg);
    // 2e68
    while ((fileHandle = fopen(regnStr, aRb_3)) == NULL) {
        drawSomeStrings(aPleaseInsertF15DiskB, 0x68, 0x28, 0x0f);
        drawSomeStrings(unk_34121, 0x68, 0x32, 0x0f);
        gfx_flipPage();
        misc_jump_5b_getkey();
    }
    // 2eb5
    gfx_waitRetrace();
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
int printError(const char *msg) {
    gfx_flipPage();
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



// ==== seg000:0x345e ====

// TODO: sub_12FDA (seg000:2fda-3223) - follows strcpyFromDot
// Once implemented, try merging egame1d.c + egame2b.c (if register spill doesn't affect codegen)
