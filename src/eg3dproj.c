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


void projectObjects(int param_0, int param_1, long param_2, long param_4, long param_6)
{
    int p;
    int a;
    int b;
    int c;
    int d;
    int e;
    int f;
    int g;
    int h;
    int i;
    int j;
    long k;
    int l;


    g_proj3d.x = param_2;
    g_proj3d.y = param_4;
    g_proj3d.z = param_6;
    param_2 = g_proj3d.x;
    param_4 = g_proj3d.y;
    param_6 = g_proj3d.z;
    b = (unsigned)(-param_0 + 0x1000) >> 13;
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
        k = scaleCoordToLod(g_curLod, param_2);
        h = (unsigned long)k >> 12;
        c = (int)k & 0xfff;
        k = scaleCoordToLod(g_curLod, param_4);
        i = (unsigned long)k >> 12;
        e = (int)k & 0xfff;
        k = scaleCoordToLod(g_curLod, param_6);
        if ((unsigned long)k < 0x7FFFUL) {
        g_objLocalZ = (int)(((unsigned long)k < 2UL) ? 2UL : (unsigned long)k);
        for (f = 0; ;f++) {
            if (g_curLod == 4 && g_detailLevel >= 2) {
                if (f == 15) {
                    break;
                }
                p = *(int *)((char *)&g_dirGridOffsets + f * 2 + (unsigned)18 * (unsigned)b);
                a = *(int *)((char *)&g_dirGridOffsets + f * 2 + (unsigned)18 * (unsigned)((b + 2) & 7));
                g_objLocalX = c - (p << 12) - 0x800;
                g_objLocalY = e - (a << 12) - 0x800;
                *(int16 *)&word_34262 = 7;
                if (transformAndCullObjectFar(-g_objLocalX, -g_objLocalY, -g_objLocalZ) != 0) {
                    goto next_iter;
                }
            } else {
                if (f == 9) {
                    break;
                }
                if (g_curLod != 4 && g_detailLevel < 2 && f < 4) {
                    goto next_iter;
                }
                if (param_1 < (int)0xd555) {
                    p = g_neighborSampling.gridX[f];
                    a = g_neighborSampling.gridY[f];
                } else {
                    p = *(int *)((char *)&g_dirGridOffsets + f * 2 + (unsigned)18 * (unsigned)b);
                    a = *(int *)((char *)&g_dirGridOffsets + f * 2 + (unsigned)18 * (unsigned)((b + 2) & 7));
                }
                g_objLocalX = c - (p << 12) - 0x800;
                g_objLocalY = e - (a << 12) - 0x800;
            }
            setViewPosition(g_objLocalX, g_objLocalY, g_objLocalZ);
            l = process3dg(g_curLod, h + p, i + a);
            if (l == -1) {
                goto next_iter;
            }
            if (f >= 4 || g_detailLevel >= 2) {
                g_objColorBase = (g_detailLevel == 2) ? 0 : ((unsigned char)g_curLod << 8);
                g_curTileEntry = matrix3dt_2[g_curLod][l];
                for (d = 0; (unsigned int)d < matrix3dt[g_curLod][l]; d++) {
                    if (g_curTileEntry->shape & 0x80) {
                        g_modelStreamPtr = byte_228D0 + lookupTileEntry(g_curLod, d, h + p, i + a);
                        if (g_modelStreamPtr == (char far *)byte_228D0) {
                            g_modelStreamPtr = byte_228D0 + buf3d3[g_curTileEntry->shape & 0x7f];
                        }
                    } else {
                        g_modelStreamPtr = byte_228D0 + buf3d3[g_curTileEntry->shape];
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
                    g_curTileEntry = matrix3dt_2[g_curLod][l];
                    g_modelStreamPtr = byte_228D0 + buf3d3[g_curTileEntry->shape];
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
