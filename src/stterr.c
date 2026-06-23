/* Terrain parsing */
// offsets based on F-15 SE2 v451.03 start.exe (unpacked) MD5: cf6e997ed4582cf82db6ec37d2b1a6fd
#include "struct.h"
#include "stdata.h"
#include "stterr.h"
#include "pointers.h"
#include "comm.h"
#include "debug.h"
#include "const.h"

#include <memory.h>
#include <dos.h>
#include <string.h>
#include <stdio.h>

/* Private helpers for this translation unit. */
uint32 scaleCoordByLevel(int, uint32);
int lookupGridCell(int16, int16, int16);

int16* findNearestTerrain(int32 worldX, int32 worldY) {
    int16 tmp, dx, dist, rowOff, x1, level, dy, i, cellIdx, gridX, offsetY, y1, cell;
    int16 sy;
    int16 ty;
    uint32 fx;
    nearestDist = 0x7fff;
    for (level = 1; level <= 2; level++) {
        for (i = 0; i < 9; i++) {
            fx = scaleCoordByLevel(level, worldX);
            gridX = fx >> 0xc;
            x1 = (int16)fx & 0xfff;
            fx = scaleCoordByLevel(level, worldY);
            y1 = fx >> 0xc;
            dy = (int16)fx & 0xfff;
            dx = dirDeltaX[i];
            rowOff = dirDeltaY[i];
            sy = gridLevelSize[dx] - x1 + 0x800;
            tmp = gridLevelSize[rowOff] - dy + 0x800;
            y1 += rowOff;
            cell = lookupGridCell(level, gridX += dx, y1);
            if (cell != 0xffff) {
                tileDataPtr = terrainTilePtrs[level].entries[cell];
                for (cellIdx = 0; terrainTileCounts[level].entries[cell] > cellIdx; cellIdx++) {
                    if (objectTypeTable[tileDataPtr->idx] != 0) {
                        ty = tileDataPtr->buf3 + sy;
                        offsetY = tileDataPtr->buf4 + tmp;
                        dist = abs(ty) + abs(offsetY);
                        if (level == 1) {
                            dist >>= 2;
                        }
                        else {
                            ty <<= 2;
                            offsetY <<= 2;
                        }
                        if (dist < nearestDist) {
                            nearestLevel = (int8)level;
                            nearestCellIdx = (int8)cellIdx;
                            nearestGridX = (int8)gridX;
                            nearestGridY[0] = (int8)y1;
                            nearestTilePtr = tileDataPtr;
                            nearestObjectType = nearestTilePtr->idx;
                            nearestDist = dist;
                            nearestWorldX = ty + worldX;
                            nearestWorldY = offsetY + worldY;
                        }
                    }
                    tileDataPtr++;
                }
            }
        }
    }
    if (nearestDist != 0x7fff) {
        return &nearestObjectType;
    }
    else return NULL;
}

uint32 scaleCoordByLevel(int level, uint32 coord) {
    switch (level) {
    case 4:
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

int lookupGridCell(int16 level, int16 col, int16 row) {
    if (col < 0 || row < 0 || col >= gridLevelSize[level + 6] || row >= gridLevelSize[level + 6])
        return -1;
    switch (level) {
    case 4:
        return gridBuf1[col + (row << 2)];
    case 3:
        return gridBuf2[col + (row << 4)];
    case 2:
        return gridBuf3[(col & 3) + (((row & 3) << 2) + (lookupGridCell(3, col >> 2, row >> 2) << 4))];
    case 1:
        return gridBuf4[(col & 3) + (((row & 3) << 2) + (lookupGridCell(2, col >> 2, row >> 2) << 4))];
    case 0:
        return gridBuf5[(col & 3) + (((row & 3) << 2) + (lookupGridCell(1, col >> 2, row >> 2) << 4))];
    }
}

