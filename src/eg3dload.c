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
void load3DAll() {
    load3DG();
    load3DT(regnStr);
    load3D3(regnStr);
    word_3401A = 0;
}

// ==== seg000:0x2898 ====
void load3D3(char *fileName) {
    char FAR *var_E;
    char FAR *var_16;
    struct SREGS var_8;
    int var_10, var_18, var_12;
    int var_A;
    strcpyFromDot(fileName, a_3d3);
    if ((fileHandle = fopen(fileName, aRb)) == NULL) {
        printError(aOpenErrorOn_3d3);
        return;
    }
    fread(&sign3d3, 2, 1, fileHandle);
    if (sign3d3 != SIGNATURE_3D3) {
        printError(aBadObjFileFormat_);
        fclose(fileHandle);
        return;
    }
    fread(&size3d3, 2, 1, fileHandle);
    fread(buf3d3, 2, size3d3, fileHandle);
    fread(&size3d3_2, 2, 1, fileHandle);
    if (size3d3_2 > 0xadd4) {
        printError(aObjectDataTooBig_);
        fclose(fileHandle);
        return;
    }
    var_E = byte_228D0 + size3d3_2;
    buf3d3[size3d3] = size3d3_2;
    segread(&var_8);
    for (var_16 = byte_228D0; size3d3_2 != 0; size3d3_2 -= var_A, var_16+=0x800) {
        var_A = (size3d3_2 >= 0x800) ? 0x800 : size3d3_2;
        fread(flt15_buf2, 1, var_A, fileHandle);
        movedata(var_8.ds, (uint16)flt15_buf2, FP_SEG(var_16), FP_OFF(var_16), var_A);
    }
    fread(&size3d3_3, 1, 1, fileHandle);
    if (size3d3_3 != 0) {
        fread(buf3d3_1, 1, size3d3_3, fileHandle);
        fread(buf3d3_2, 1, size3d3_3, fileHandle);
        fread(buf3d3_3, 1, size3d3_3, fileHandle);
        fread(&size3d3_4, 1, 1, fileHandle);
        fread(&byte_3B7FC[0x600], 2, size3d3_4, fileHandle);
        fread(&size3d3_5, 1, 1, fileHandle);
        fread(byte_3BE3E, 2, size3d3_5, fileHandle);
        fread(&size3d3_6, 1, 1, fileHandle);
        fread(byte_3BE80, 2, size3d3_6, fileHandle);
    }
    fclose(fileHandle);
    while ((fileHandle = fopen(aPhoto_3d3, aRb_0)) == NULL) {
        setDrawColor(0);
        fillRectBoth(0, 0x28, 0x13f, 0x2d);
        drawStringBothPages(aPleaseInsertF15DiskB, 0x6c, 0x28, 0x0f);
        gfx_flipPage();
        misc_jump_5b_getkey();
    }
    gfx_waitRetrace();
    for (var_10 = 0; var_10 < 2; var_10++) {
        if ((var_18 = word_3B14A[var_10 * 0x9] >> 8) != 0) {
            fileHandle = fopen(aPhoto_3d3_0, aRb_1);
            fread(&sign3d3, 2, 1, fileHandle);
            fread(&size3d3_7, 2, 1, fileHandle);
            fread(word_33DD0, 2, size3d3_7, fileHandle);
            fread(&size3d3_2, 2, 1, fileHandle);
            word_33DD0[size3d3_7] = size3d3_2;
            for (var_12 = 0; var_12 <= var_18; var_12++) {
                var_A = word_33DD0[var_12+1] - word_33DD0[var_12];
                while (var_A > 0x800) {
                    fread(flt15_buf2, 1, 0x800, fileHandle);
                    var_A -= 0x800;
                }
                segread(&var_8);
                fread(flt15_buf2, 1, var_A, fileHandle);
                movedata(var_8.ds, (uint16)flt15_buf2, FP_SEG(var_E), FP_OFF(var_E), var_A);
            }
            var_E += var_A;
            if (var_10 == 0) {
                buf3d3[size3d3+1] = buf3d3[size3d3] + var_A;
            }
            fclose(fileHandle);
        }
    }
    if (var_E - byte_228D0 > 0xadd4) {
        printError(aObjdataOverflow);
    }
}

// ==== seg000:0x2c82 ====
void load3DT(char *fileName) {
    int var_2, var_4, var_6, var_8, var_A;
    strcpyFromDot(fileName, a_3dt);
    if ((fileHandle = fopen(fileName, aRb_2)) == NULL) {
        printError(aOpenErrorOn_3dt);
        return;
    }
    fread(&sign3dt, 2, 1, fileHandle);
    if (sign3dt != SIGNATURE_3DT) {
        printError(aBadTileFileFormat_);
        fclose(fileHandle);
        return;
    }
    fread(sizes3dt, 2, 5, fileHandle);
    for (var_4 = 0; var_4 < 5; var_4++) {
        if (sizes3dt[var_4] > 0x20) {
            printError(aTooManyTiles_);
            return;
        }
        fread(matrix3dt[var_4], 2, sizes3dt[var_4], fileHandle);
    }
    var_6 = 0;
#define GET_MATRIX(BYTE_OFFSET)((struct Matrix3dEntry7*)(buf_3dt + BYTE_OFFSET))
    for (var_4 = 0; var_4 < 5; var_4++) {
        for (var_8 = 0; sizes3dt[var_4] > var_8; var_8++) {
            matrix3dt_2[var_4][var_8] = GET_MATRIX(var_6);
            for (var_A = 0; matrix3dt[var_4][var_8] > var_A; var_A++) {
                if (var_6 > MAX_TILE_DATA) {
                    printError(aTooMuchTileData);
                    return;
                }
                fread(&GET_MATRIX(var_6)->_0x00, 2, 1, fileHandle);
                fread(&GET_MATRIX(var_6)->_0x02, 2, 1, fileHandle);
                fread(&GET_MATRIX(var_6)->_0x04, 2, 1, fileHandle);
                fread(&var_2, 2, 1, fileHandle);
                GET_MATRIX(var_6)->_0x06 = (uint8)var_2;
                var_6 += sizeof(struct Matrix3dEntry7);
            }
        }
    }
    fclose(fileHandle);
}

// ==== seg000:0x2e54 ====
void load3DG() {
    int unused_1, unused_2, unused_3;
    strcpyFromDot(regnStr, a_3dg);
    while ((fileHandle = fopen(regnStr, aRb_3)) == NULL) {
        drawStringBothPages(aPleaseInsertF15DiskB, 0x68, 0x28, 0x0f);
        drawStringBothPages(unk_34121, 0x68, 0x32, 0x0f);
        gfx_flipPage();
        misc_jump_5b_getkey();
    }
    gfx_waitRetrace();
    fread(&sign3dg, 2, 1, fileHandle);
    if (sign3dg != SIGNATURE_3DG) {
        printError(aBadGridFileFormat_);
        fclose(fileHandle);
        return;
    }
    fread(buf1_3dg, 1, 0x10, fileHandle);
    fread(buf1_3dg, 1, 0x100, fileHandle);
    fread(buf2_3dg, 1, 0x200, fileHandle);
    fread(buf3_3dg, 1, 0x200, fileHandle);
    fread(buf4_3dg, 1, 0x200, fileHandle);
    fclose(fileHandle);
    memcpy(byte_3A900, unk_33E1A + ((gameData->theater & 7) * 64), 64);
}

// ==== seg000:0x2f8c ====
void printError(const char *msg) {
    gfx_flipPage();
    drawStringBothPages(msg, 0, 0x60, 0xf);
    getch();
}

// ==== seg000:0x2faf ====
void strcpyFromDot(char *dst, char *src) {
    char var_2;
    while ((var_2 = *dst) != '.' && var_2 != 0) {
        dst++;
    }
    strcpy(dst, src);
}
