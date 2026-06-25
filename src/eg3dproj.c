// seg000 debug code (/Zi)
#include "eg3dcam.h"
#include "eg3dgrid.h"
#include "eg3dmap.h"
#include "eg3dproj.h"
#include "egcode.h"
#include "egdata.h"
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
int far transformAndCullObjectFar(int, int, int);


void projectObjects(int heading, int rangeGate, long worldX, long worldY, long worldZ)
{
    int gridX;
    int gridY;
    int dirSector;
    int fracX;
    int subIdx;
    int fracY;
    int sampleIdx;
    int tmp0;
    int tileX;
    int tileY;
    int tmp1;
    long scaled;
    int cell;


    g_proj3d.x = worldX;
    g_proj3d.y = worldY;
    g_proj3d.z = worldZ;
    worldX = g_proj3d.x;
    worldY = g_proj3d.y;
    worldZ = g_proj3d.z;
    dirSector = (uint16)(-heading + 0x1000) >> 13;
    g_curLod = (g_detailLevel != 0) ? 4 : 3;
    goto outer_test;
    do {
        g_curLod--;
outer_test:
        if (g_curLod < 1) {
            return;
        }
        if (g_lodObjectCount[g_curLod] == 0) {
            continue;
        }
        scaled = scaleCoordToLod(g_curLod, worldX);
        tileX = (unsigned long)scaled >> 12;
        fracX = (int)scaled & 0xfff;
        scaled = scaleCoordToLod(g_curLod, worldY);
        tileY = (unsigned long)scaled >> 12;
        fracY = (int)scaled & 0xfff;
        scaled = scaleCoordToLod(g_curLod, worldZ);
        if ((unsigned long)scaled < 0x7FFFUL) {
        g_objLocalZ = (int)(((unsigned long)scaled < 2UL) ? 2UL : (unsigned long)scaled);
        for (sampleIdx = 0; ;sampleIdx++) {
            if (g_curLod == 4 && g_detailLevel >= 2) {
                if (sampleIdx == 15) {
                    break;
                }
                gridX = *(const int16 *)((const char *)g_dirGridOffsets + sampleIdx * 2 + (unsigned)18 * (unsigned)dirSector);
                gridY = *(const int16 *)((const char *)g_dirGridOffsets + sampleIdx * 2 + (unsigned)18 * (unsigned)((dirSector + 2) & 7));
                g_objLocalX = fracX - (gridX << 12) - 0x800;
                g_objLocalY = fracY - (gridY << 12) - 0x800;
                g_objRenderMode = 7;
                if (transformAndCullObjectFar(-g_objLocalX, -g_objLocalY, -g_objLocalZ) != 0) {
                    goto next_iter;
                }
            } else {
                if (sampleIdx == 9) {
                    break;
                }
                if (g_curLod != 4 && g_detailLevel < 2 && sampleIdx < 4) {
                    goto next_iter;
                }
                if (rangeGate < (int)0xd555) {
                    gridX = g_neighborSampling.gridX[sampleIdx];
                    gridY = g_neighborSampling.gridY[sampleIdx];
                } else {
                    gridX = *(const int16 *)((const char *)g_dirGridOffsets + sampleIdx * 2 + (unsigned)18 * (unsigned)dirSector);
                    gridY = *(const int16 *)((const char *)g_dirGridOffsets + sampleIdx * 2 + (unsigned)18 * (unsigned)((dirSector + 2) & 7));
                }
                g_objLocalX = fracX - (gridX << 12) - 0x800;
                g_objLocalY = fracY - (gridY << 12) - 0x800;
            }
            setViewPosition(g_objLocalX, g_objLocalY, g_objLocalZ);
            cell = process3dg(g_curLod, tileX + gridX, tileY + gridY);
            if (cell == -1) {
                goto next_iter;
            }
            if (sampleIdx >= 4 || g_detailLevel >= 2) {
                g_objColorBase = (g_detailLevel == 2) ? 0 : ((unsigned char)g_curLod << 8);
                g_curTileEntry = matrix3dt_2[g_curLod][cell];
                for (subIdx = 0; subIdx < matrix3dt[g_curLod][cell]; subIdx++) {
                    if (g_curTileEntry->shape & 0x80) {
                        g_modelStreamPtr = g_world3dData + lookupTileEntry(g_curLod, subIdx, tileX + gridX, tileY + gridY);
                        if (g_modelStreamPtr == (char far *)g_world3dData) {
                            g_modelStreamPtr = g_world3dData + buf3d3[g_curTileEntry->shape & 0x7f];
                        }
                    } else {
                        g_modelStreamPtr = g_world3dData + buf3d3[g_curTileEntry->shape];
                    }
                    projectSceneObject(g_modelStreamPtr, 0, 0, 0,
                        g_curTileEntry->x,
                        g_curTileEntry->y,
                        g_curTileEntry->z);
                    g_curTileEntry++;
                    g_objColorBase++;
                }
            } else {
                if (g_curLod == 4) {
                    g_curTileEntry = matrix3dt_2[g_curLod][cell];
                    g_modelStreamPtr = g_world3dData + buf3d3[g_curTileEntry->shape];
                    g_objColorBase = 0x400;
                    projectSceneObject(g_modelStreamPtr, 0, 0, 0,
                        g_curTileEntry->x,
                        g_curTileEntry->y,
                        g_curTileEntry->z);
                }
            }
next_iter:
            ;
        }
        }
    } while (1);
}
// Once implemented, try merging egame2.c + egame1e.c (if register spill doesn't affect codegen)

// ==== seg000:0x26b4 ====
uint32 scaleCoordToLod(int level, uint32 coord) {
    switch (level) {
    case 4:
        return (coord + 0x20) >> 6;
    case 3:
        return (coord + 8) >> 4;
    case 2:
        return (coord + 2) >> 2;
    case 1:
        return coord;
    case 0:
        return coord << 1;
    }
}
