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


int projectObjects(int param_0, int param_1, long param_2, long param_4, long param_6)
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
    int k;
    int l;
    int m;


    *(long *)(&word_3C8B6 + 1) = param_2;
    *(long *)(&word_3C8B6 + 3) = param_4;
    *(long *)(&word_3C8B6 + 5) = param_6;
    param_2 = *(long *)(&word_3C8B6 + 1);
    param_4 = *(long *)(&word_3C8B6 + 3);
    param_6 = *(long *)(&word_3C8B6 + 5);
    b = (unsigned)(-param_0 + 0x1000) >> 13;
    word_3C16C = (word_38FDC != 0) ? 4 : 3;
    goto outer_test;
    do {
        word_3C16C--;
outer_test:
        if (word_3C16C < 1) {
            return;
        }
        if (sizes3dt[word_3C16C] == 0) {
            continue;
        }
        *(long *)&k = scaleCoordToLod(word_3C16C, param_2);
        h = (unsigned long)*(long *)&k >> 12;
        c = k & 0xfff;
        *(long *)&k = scaleCoordToLod(word_3C16C, param_4);
        i = (unsigned long)*(long *)&k >> 12;
        e = k & 0xfff;
        *(long *)&k = scaleCoordToLod(word_3C16C, param_6);
        if (j != 0) {
            continue;
        }
        if ((unsigned long)*(long *)&k >= 0x7FFFUL) {
            continue;
        }
        if (*(long *)&k < 2L) {
            *(long *)&k = 2L;
        }
        var_659 = k;
        for (f = 0; ;f++) {
            if (word_3C16C == 4 && word_38FDC >= 2) {
                if (f == 15) {
                    break;
                }
                p = *(int *)((char *)&word_339F4 + (unsigned)18 * (unsigned)b + (unsigned)f * 2);
                a = *(int *)((char *)&word_339F4 + (unsigned)18 * (unsigned)((b + 2) & 7) + (unsigned)f * 2);
                var_657 = c - (p << 12) - 0x800;
                var_658 = e - (a << 12) - 0x800;
                var_217 = 7;
                if (sub_202C7(-var_657, -var_658, -var_659) != 0) {
                    goto next_iter;
                }
                goto do_process;
            } else {
                if (f == 9) {
                    break;
                }
                if (word_3C16C != 4 && word_38FDC < 2 && f < 4) {
                    goto next_iter;
                }
                if (param_1 < (int)0xd555) {
                    p = (&word_33B74)[f];
                    a = (&word_33B86)[f];
                } else {
                    p = *(int *)((char *)&word_339F4 + (unsigned)18 * (unsigned)b + (unsigned)f * 2);
                    a = *(int *)((char *)&word_339F4 + (unsigned)18 * (unsigned)((b + 2) & 7) + (unsigned)f * 2);
                }
                var_657 = c - (p << 12) - 0x800;
                var_658 = e - (a << 12) - 0x800;
            }
do_process:
            setViewPosition(var_657, var_658, var_659);
            l = process3dg(word_3C16C, h + p, i + a);
            if (l == -1) {
                goto next_iter;
            }
            if (f < 4 && word_38FDC < 2) {
                if (word_3C16C == 4) {
                    word_3C5A8 = matrix3dt_2[word_3C16C][l];
                    FP_OFF(var_200) = buf3d3[*((unsigned char *)word_3C5A8 + 6)] + 0;
                    FP_SEG(var_200) = 0x228d;
                    var_141 = 0x400;
                    projectSceneObject(FP_OFF(var_200), FP_SEG(var_200), 0, 0, 0,
                        *(int *)word_3C5A8,
                        *((int *)word_3C5A8 + 1),
                        *((int *)word_3C5A8 + 2));
                }
            } else {
                if (word_38FDC == 2) {
                    var_141 = 0;
                } else {
                    var_141 = (unsigned char)word_3C16C << 8;
                }
                word_3C5A8 = matrix3dt_2[word_3C16C][l];
                for (d = 0; (unsigned int)d < matrix3dt[word_3C16C + 3][l + 3]; d++) {
                    if (*((unsigned char *)word_3C5A8 + 6) & 0x80) {
                        FP_OFF(var_200) = lookupTileEntry(word_3C16C, d, h + p, i + a) + 0;
                        FP_SEG(var_200) = 0x228d;
                        if (FP_OFF(var_200) == 0 && FP_SEG(var_200) == 0x228d) {
                            FP_OFF(var_200) = buf3d3[*((unsigned char *)word_3C5A8 + 6) & 0x7f] + 0;
                            FP_SEG(var_200) = FP_SEG(var_200);
                        }
                    } else {
                        FP_OFF(var_200) = buf3d3[*((unsigned char *)word_3C5A8 + 6)] + 0;
                        FP_SEG(var_200) = 0x228d;
                    }
                    projectSceneObject(FP_OFF(var_200), FP_SEG(var_200), 0, 0, 0,
                        *(int *)word_3C5A8,
                        *((int *)word_3C5A8 + 1),
                        *((int *)word_3C5A8 + 2));
                    word_3C5A8 += 7;
                    var_141++;
                }
            }
next_iter:
            ;
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
