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
    nearestDist = 0x7fff;
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
            dx = dirDeltaX[i];
            rowOff = dirDeltaY[i];
            sy = gridLevelSize[dx] - x1 + 0x800;
            tmp = gridLevelSize[rowOff] - dy + 0x800;
            y1 += rowOff;
            // 38d2
            cell = lookupGridCell(level, gridX += dx, y1);
            // 38db
            if (cell != 0xffff) {
                // 38f2
                tileDataPtr = (int16)terrainTilePtrs[level].entries[cell];
                // 38f5
                for (cellIdx = 0; (uint16)terrainTileCounts[level].entries[cell] > cellIdx; cellIdx++) { // 3917
                    // 3920
                    if (objectTypeTable[((uint8*)(tileDataPtr))[6]] != 0) { // 3929
                        ty = *((uint16*)tileDataPtr) + sy;
                        // 393b
                        offsetY = *((uint16*)tileDataPtr + 1) + tmp;
                        dist = abs(ty) + abs(offsetY);
                        if (level == 1) { // 395b
                            dist >>= 2;
                        }
                        else { // 3962
                            ty <<= 2;
                            offsetY <<= 2;
                        } // 396a
                        if (dist < nearestDist) { // 3972
                            nearestLevel = (int8)level;
                            nearestCellIdx = (int8)cellIdx;
                            nearestGridX = (int8)gridX;
                            nearestGridY[0] = (int8)y1;
                            // 398d
                            nearestTilePtr = tileDataPtr;
                            nearestObjectType = ((uint8*)nearestTilePtr)[6];
                            nearestDist = dist;
                            nearestWorldX = ty + worldX;
                            nearestWorldY = offsetY + worldY;
                        }
                    }
                    // 39c2
                    tileDataPtr += 7;
                } // 39ca
            } // 39ca
        } // 39cd
    } // 39d0
    if (nearestDist != 0x7fff) {
        return &nearestObjectType;
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
    if (col < 0 || row < 0 || col >= gridLevelSize[level + 6] || row >= gridLevelSize[level + 6])
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

