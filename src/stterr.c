/* Terrain parsing */
// offsets based on F-15 SE2 v451.03 start.exe (unpacked) MD5: cf6e997ed4582cf82db6ec37d2b1a6fd
#include "struct.h"
#include "start.h"
#include "pointers.h"
#include "comm.h"
#include "debug.h"
#include "const.h"

#include <memory.h>
#include <dos.h>
#include <string.h>
#include <stdio.h>

// 0x37f8
int16* findNearestTerrain(int32 worldX, int32 worldY) {
    int16 tmp, dx, dist, rowOff, x1, level, dy, i, cellIdx, gridX, offsetY, y1, cell;
    int16 sy;
    int16 ty;
    uint32 fx;
    word_1D5D6 = 0x7fff;
    for (level = 1; level <= 2; level++) { // 3819
        for (i = 0; i < 9; i++) { // 382c
            // 383b
            fx = scaleCoordByLevel(level, worldX);
            // 384d
            gridX = fx >> 0xc;
            // 3856
            x1 = (int16)fx & 0xfff;
            // 3868
            fx = scaleCoordByLevel(level, worldY);
            // 387a
            y1 = fx >> 0xc;
            dy = (int16)fx & 0xfff;
            dx = word_17FFE[i];
            rowOff = word_18010[i];
            sy = word_18026[dx] - x1 + 0x800;
            tmp = word_18026[rowOff] - dy + 0x800;
            y1 += rowOff;
            // 38d2
            cell = lookupGridCell(level, gridX += dx, y1);
            // 38db
            if (cell != 0xffff) {
                // 38f2
                word_1E24A = (int16)terrainPtrUnk[level].field_0[cell];
                // 38f5
                for (cellIdx = 0; (uint16)terrainBuf2[level].field_0[cell] > cellIdx; cellIdx++) { // 3917
                    // 3920
                    if (wldReadBuf9[((uint8*)(word_1E24A))[6]] != 0) { // 3929
                        ty = *((uint16*)word_1E24A) + sy;
                        // 393b
                        offsetY = *((uint16*)word_1E24A + 1) + tmp;
                        dist = abs(ty) + abs(offsetY);
                        if (level == 1) { // 395b
                            dist >>= 2;
                        }
                        else { // 3962
                            ty <<= 2;
                            offsetY <<= 2;
                        } // 396a
                        if (dist < word_1D5D6) { // 3972
                            byte_1D5E2 = (int8)level;
                            byte_1D5E3 = (int8)cellIdx;
                            byte_1D5E4 = (int8)gridX;
                            byte_1D5E5[0] = (int8)y1;
                            // 398d
                            word_1D5E0 = word_1E24A;
                            word_1D5D4 = ((uint8*)word_1D5E0)[6];
                            word_1D5D6 = dist;
                            dword_1D5D8 = ty + worldX;
                            dword_1D5DC = offsetY + worldY;
                        }
                    }
                    // 39c2
                    word_1E24A += 7;
                } // 39ca
            } // 39ca
        } // 39cd
    } // 39d0
    if (word_1D5D6 != 0x7fff) {
        return &word_1D5D4;
    }
    else return NULL;
}

// 0x39e9
uint32 scaleCoordByLevel(int level, uint32 coord) {
    switch (level) { // 3a43
    case 4: // 39f1
        return coord >> 6;
    case 3:
        return coord >> 4;
    case 2:
        return coord >> 2;
    case 1:
        return coord;
    case 0:
        return coord << 1;
    }
}

// 0x3a61
int lookupGridCell(int16 level, int16 col, int16 row) {
    if (col < 0 || row < 0 || col >= word_18026[level + 6] || row >= word_18026[level + 6])
        return -1;
    // 3a8a
    switch (level) { // 3b61
    case 4: // 3a90
        return gridBuf1[col + (row << 2)];
    case 3: // 3aa3
        return gridBuf2[col + (row << 4)];
    case 2: // 3ab6
        return gridBuf3[(col & 3) + (((row & 3) << 2) + (lookupGridCell(3, col >> 2, row >> 2) << 4))];
    case 1: // 3aef
        return gridBuf4[(col & 3) + (((row & 3) << 2) + (lookupGridCell(2, col >> 2, row >> 2) << 4))];
    case 0: // 3b27
        return gridBuf5[(col & 3) + (((row & 3) << 2) + (lookupGridCell(1, col >> 2, row >> 2) << 4))];
    }
}

