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
    long k;
    int l;


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
        k = scaleCoordToLod(word_3C16C, param_2);
        h = (unsigned long)k >> 12;
        c = (int)k & 0xfff;
        k = scaleCoordToLod(word_3C16C, param_4);
        i = (unsigned long)k >> 12;
        e = (int)k & 0xfff;
        k = scaleCoordToLod(word_3C16C, param_6);
        if ((unsigned long)k < 0x7FFFUL) {
        var_659 = (int)(((unsigned long)k < 2UL) ? 2UL : (unsigned long)k);
        for (f = 0; ;f++) {
            if (word_3C16C == 4 && word_38FDC >= 2) {
                if (f == 15) {
                    break;
                }
                p = *(int *)((char *)&word_339F4 + f * 2 + (unsigned)18 * (unsigned)b);
                a = *(int *)((char *)&word_339F4 + f * 2 + (unsigned)18 * (unsigned)((b + 2) & 7));
                var_657 = c - (p << 12) - 0x800;
                var_658 = e - (a << 12) - 0x800;
                *(int16 *)&var_217 = 7;
                if (sub_202C7(-var_657, -var_658, -var_659) != 0) {
                    goto next_iter;
                }
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
                    p = *(int *)((char *)&word_339F4 + f * 2 + (unsigned)18 * (unsigned)b);
                    a = *(int *)((char *)&word_339F4 + f * 2 + (unsigned)18 * (unsigned)((b + 2) & 7));
                }
                var_657 = c - (p << 12) - 0x800;
                var_658 = e - (a << 12) - 0x800;
            }
            setViewPosition(var_657, var_658, var_659);
            l = process3dg(word_3C16C, h + p, i + a);
            if (l == -1) {
                goto next_iter;
            }
            if (f >= 4 || word_38FDC >= 2) {
                var_141 = (word_38FDC == 2) ? 0 : ((unsigned char)word_3C16C << 8);
                word_3C5A8 = matrix3dt_2[word_3C16C][l];
                for (d = 0; (unsigned int)d < matrix3dt[word_3C16C][l]; d++) {
                    if (*((unsigned char *)word_3C5A8 + 6) & 0x80) {
                        var_200 = byte_228D0 + lookupTileEntry(word_3C16C, d, h + p, i + a);
                        if (var_200 == (char far *)byte_228D0) {
                            var_200 = byte_228D0 + buf3d3[*((unsigned char *)word_3C5A8 + 6) & 0x7f];
                        }
                    } else {
                        var_200 = byte_228D0 + buf3d3[*((unsigned char *)word_3C5A8 + 6)];
                    }
                    projectSceneObject(var_200, 0, 0, 0,
                        *(int *)word_3C5A8,
                        *((int *)word_3C5A8 + 1),
                        *((int *)word_3C5A8 + 2));
                    word_3C5A8 += 7;
                    var_141++;
                }
            } else {
                if (word_3C16C == 4) {
                    word_3C5A8 = matrix3dt_2[word_3C16C][l];
                    var_200 = byte_228D0 + buf3d3[*((unsigned char *)word_3C5A8 + 6)];
                    var_141 = 0x400;
                    projectSceneObject(var_200, 0, 0, 0,
                        *(int *)word_3C5A8,
                        *((int *)word_3C5A8 + 1),
                        *((int *)word_3C5A8 + 2));
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
