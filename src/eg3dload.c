// seg000 debug code (/Zi)
#include "eg3dload.h"
#include "egdata.h"
#include "egtacmap.h"
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
void __cdecl load3D3(char *);
void __cdecl load3DT(char *);
void load3DG();


// ==== seg000:0x2874 ====
void load3DAll() {
    load3DG();
    load3DT(regnStr);
    load3D3(regnStr);
    g_unusedLoadDoneFlag = 0;
}

// ==== seg000:0x2898 ====
void load3D3(char *fileName) {
    char FAR *objDataEnd;
    char FAR *dstPtr;
    struct SREGS sregs;
    int slot, subCount, sub;
    int chunk;
    strcpyFromDot(fileName, ".3D3");
    if ((fileHandle = fopen(fileName, "rb")) == NULL) {
        printError("Open Error on *.3D3");
        return;
    }
    fread(&sign3d3, 2, 1, fileHandle);
    if (sign3d3 != SIGNATURE_3D3) {
        printError("Bad Obj file format.");
        fclose(fileHandle);
        return;
    }
    fread(&size3d3, 2, 1, fileHandle);
    fread(buf3d3, 2, size3d3, fileHandle);
    fread(&size3d3_2, 2, 1, fileHandle);
    if (size3d3_2 > 0xadd4) {
        printError("Object data too big.");
        fclose(fileHandle);
        return;
    }
    objDataEnd = g_world3dData + size3d3_2;
    buf3d3[size3d3] = size3d3_2;
    segread(&sregs);
    for (dstPtr = g_world3dData; size3d3_2 != 0; size3d3_2 -= chunk, dstPtr+=0x800) {
        chunk = (size3d3_2 >= 0x800) ? 0x800 : size3d3_2;
        fread(flt15_buf2, 1, chunk, fileHandle);
        movedata(sregs.ds, PTR_OFF(flt15_buf2), FP_SEG(dstPtr), FP_OFF(dstPtr), chunk);
    }
    fread(&size3d3_3, 1, 1, fileHandle);
    if (size3d3_3 != 0) {
        fread(buf3d3_1, 1, size3d3_3, fileHandle);
        fread(buf3d3_2, 1, size3d3_3, fileHandle);
        fread(buf3d3_3, 1, size3d3_3, fileHandle);
        fread(&size3d3_4, 1, 1, fileHandle);
        fread(g_replayLog.vertexX, 2, size3d3_4, fileHandle);
        fread(&size3d3_5, 1, 1, fileHandle);
        fread(g_modelVertY, 2, size3d3_5, fileHandle);
        fread(&size3d3_6, 1, 1, fileHandle);
        fread(g_modelVertZ, 2, size3d3_6, fileHandle);
    }
    fclose(fileHandle);
    while ((fileHandle = fopen("photo.3d3", "rb")) == NULL) {
        setDrawColor(0);
        fillRectBoth(0, 40, 319, 45);
        drawStringBothPages("Please insert F15 Disk B", 108, 40, 0x0f);
        gfx_flipPage();
        misc_getKey();
    }
    gfx_waitRetrace();
    for (slot = 0; slot < 2; slot++) {
        if ((subCount = g_targetSlots[slot].flags >> 8) != 0) {
            fileHandle = fopen("photo.3d3", "rb");
            fread(&sign3d3, 2, 1, fileHandle);
            fread(&size3d3_7, 2, 1, fileHandle);
            fread(g_modelOffsetTable, 2, size3d3_7, fileHandle);
            fread(&size3d3_2, 2, 1, fileHandle);
            g_modelOffsetTable[size3d3_7] = size3d3_2;
            for (sub = 0; sub <= subCount; sub++) {
                chunk = g_modelOffsetTable[sub+1] - g_modelOffsetTable[sub];
                while (chunk > 0x800) {
                    fread(flt15_buf2, 1, 0x800, fileHandle);
                    chunk -= 0x800;
                }
                segread(&sregs);
                fread(flt15_buf2, 1, chunk, fileHandle);
                movedata(sregs.ds, PTR_OFF(flt15_buf2), FP_SEG(objDataEnd), FP_OFF(objDataEnd), chunk);
            }
            objDataEnd += chunk;
            if (slot == 0) {
                buf3d3[size3d3+1] = buf3d3[size3d3] + chunk;
            }
            fclose(fileHandle);
        }
    }
    if (objDataEnd - g_world3dData > 0xadd4) {
        printError("ObjData overflow");
    }
}

// ==== seg000:0x2c82 ====
void load3DT(char *fileName) {
    int shape, cat, byteOff, tile, obj;
    strcpyFromDot(fileName, ".3dT");
    if ((fileHandle = fopen(fileName, "rb")) == NULL) {
        printError("Open Error on *.3DT");
        return;
    }
    fread(&sign3dt, 2, 1, fileHandle);
    if (sign3dt != SIGNATURE_3DT) {
        printError("Bad Tile file format.");
        fclose(fileHandle);
        return;
    }
    fread(sizes3dt, 2, 5, fileHandle);
    for (cat = 0; cat < 5; cat++) {
        if (sizes3dt[cat] > 32) {
            printError("Too many tiles.");
            return;
        }
        fread(matrix3dt[cat], 2, sizes3dt[cat], fileHandle);
    }
    byteOff = 0;
#define GET_MATRIX(BYTE_OFFSET)((struct TileSceneObject*)(buf_3dt + BYTE_OFFSET))
    for (cat = 0; cat < 5; cat++) {
        for (tile = 0; sizes3dt[cat] > tile; tile++) {
            matrix3dt_2[cat][tile] = GET_MATRIX(byteOff);
            for (obj = 0; matrix3dt[cat][tile] > obj; obj++) {
                if (byteOff > MAX_TILE_DATA) {
                    printError("Too much tile data");
                    return;
                }
                fread(&GET_MATRIX(byteOff)->x, 2, 1, fileHandle);
                fread(&GET_MATRIX(byteOff)->y, 2, 1, fileHandle);
                fread(&GET_MATRIX(byteOff)->z, 2, 1, fileHandle);
                fread(&shape, 2, 1, fileHandle);
                GET_MATRIX(byteOff)->shape = (uint8)shape;
                byteOff += sizeof(struct TileSceneObject);
            }
        }
    }
    fclose(fileHandle);
}

// ==== seg000:0x2e54 ====
void load3DG() {
    int unused_1, unused_2, unused_3;
    strcpyFromDot(regnStr, ".3dG");
    while ((fileHandle = fopen(regnStr, "rb")) == NULL) {
        drawStringBothPages("Please insert F15 Disk B", 104, 40, 0x0f);
        drawStringBothPages("  Press a key when ready", 104, 50, 0x0f);
        gfx_flipPage();
        misc_getKey();
    }
    gfx_waitRetrace();
    fread(&sign3dg, 2, 1, fileHandle);
    if (sign3dg != SIGNATURE_3DG) {
        printError("Bad Grid file format.");
        fclose(fileHandle);
        return;
    }
    fread(buf1_3dg, 1, 16, fileHandle);
    fread(buf1_3dg, 1, 0x100, fileHandle);
    fread(buf2_3dg, 1, 0x200, fileHandle);
    fread(buf3_3dg, 1, 0x200, fileHandle);
    fread(buf4_3dg, 1, 0x200, fileHandle);
    fclose(fileHandle);
    memcpy(g_topLodGrid, g_theaterGrids + ((gameData->theater & 7) * 64), 64);
}

// ==== seg000:0x2f8c ====
void printError(const char *msg) {
    gfx_flipPage();
    drawStringBothPages(msg, 0, 96, 0xf);
    getch();
}

// ==== seg000:0x2faf ====
void strcpyFromDot(char *dst, const char *src) {
    char ch;
    while ((ch = *dst) != '.' && ch != 0) {
        dst++;
    }
    strcpy(dst, src);
}
