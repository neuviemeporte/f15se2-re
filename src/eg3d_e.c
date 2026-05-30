// seg000 optimized code (/Ot)
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include "comm.h"

#include <dos.h>
#include <memory.h>
#include <conio.h>
#include <bios.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


// ==== seg000:0x2fda ====

int16* sub_12FDA(uint32 param_0, uint32 param_1) {
    int p, q, a, r, b, c, d, e, f, g, h, i, j, k, l, m, n, o;

    word_3B7E2 = 0x7fff;
    for (c = 1; c <= 2; c++) {
        for (e = 0; e < 9; e++) {
            *(long *)&m = sub_126B4(c, param_0);
            i = *(unsigned long *)&m >> 0xc;
            r = m & 0xfff;
            *(long *)&m = sub_126B4(c, param_1);
            k = *(unsigned long *)&m >> 0xc;
            d = m & 0xfff;
            a = (&word_33B74)[e];
            b = (&word_33B86)[e];
            o = (&word_33B9C)[a] - r + 0x800;
            p = (&word_33B9C)[b] - d + 0x800;
            n = process3dg(c, i += a, k += b);
            if (n != -1) {
                word_3C5A8 = matrix3dt_2[c][n];
                for (f = 0; matrix3dt[c + 3][n + 3] > (unsigned int)f; f++) {
                    if (byte_3BFA4[word_3C5A8->_0x06 & 0x7f] != 0) {
                        h = o + word_3C5A8->_0x00;
                        j = word_3C5A8->_0x02 + p;
                        q = abs(h) + abs(j);
                        if (c == 1) {
                            q >>= 2;
                        } else {
                            h <<= 2;
                            j <<= 2;
                        }
                        g = word_3C5A8->_0x06;
                        if ((word_3C5A8->_0x06 & 0x80) != 0 &&
                            sub_13266(c, f, i, k) != 0) {
                            g = byte_3B4E6[var_660]._0x06;
                        }
                        if (q < word_3B7E2) {
                            var_200 = (char far *)(byte_228D0 + buf3d3[g]);
                            if (*(int far *)var_200 != 0 ||
                                *((char far *)var_200 + 2) != 0 ||
                                word_33704 != 0) {
                                byte_3B7EE = (uint8)c;
                                byte_3B7EF = (uint8)f;
                                byte_3B7F0 = (uint8)i;
                                byte_3B7F1[0] = (uint8)k;
                                word_3B7EC = word_3C5A8;
                                word_3B7E0 = g;
                                word_3B7E2 = q;
                                *(long *)&word_3B7E4 = param_0 + (long)h;
                                *(long *)&word_3B7E8 = param_1 + (long)j;
                            }
                        }
                    }
                    word_3C5A8++;
                }
            }
        }
    }
    if (word_3B7E2 != 0x7fff) {
        return &word_3B7E0;
    }
    return 0;
}

void sub_13224(char *a, int b, char c) {
    *(int *)(a + 0x12) = b;
    *(a + 0x14) = c;
    memcpy((char *)&byte_3B4E6[word_38FF8++], a + 0x0e, 8);
    *(*(char **)(a + 0x0c) + 6) |= 0x80;
}

// ==== seg000:0x3266 ====
int sub_13266(int p1, int p2, int p3, int p4) {
    for (var_660 = word_38FF8 - 1; var_660 >= 0; var_660--) {
        if (byte_3B4E6[var_660]._0x00 == p1 &&
            byte_3B4E6[var_660]._0x01 == p2 &&
            byte_3B4E6[var_660]._0x02 == p3 &&
            byte_3B4E6[var_660]._0x03 == p4) {
            return byte_3B4E6[var_660]._0x04;
        }
    }
    return 0;
}

int sub_132BA(uint32 coord1, uint32 coord2, uint32 coord3)
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
    uint32 k;
    int l;
    int m;

    *(char *)&var_315 = 0;
    word_3B7E2 = 0x7fff;
    b = 4;
    k = sub_126B4(b, coord1);
    g = (int)(k >> 12);
    a = (int)k & 0xfff;
    k = sub_126B4(b, coord2);
    i = (int)(k >> 12);
    c = (int)k & 0xfff;
    var_220 = (int)sub_126B4(b, coord3);
    m = 0x800 - a;
    p = 0x800 - c;
    var_218 = a - 0x800;
    var_219 = c - 0x800;
    l = process3dg(b, g, i);
    if (l != -1) {
        word_3C5A8 = matrix3dt_2[b][l];
        for (e = 1; (unsigned int)e < matrix3dt[b + 3][l + 3]; e++) {
            f = word_3C5A8->_0x00 + m;
            h = word_3C5A8->_0x02 + p;
            var_216 = abs(f) + abs(h);
            if (word_3B7E2 > var_216) {
                word_3B7EC = word_3C5A8;
                word_3B7E2 = var_216;
            }
            word_3C5A8++;
        }
    }
    if (word_3B7E2 != 0x7fff) {
        word_3C5A8 = word_3B7EC;
        var_200 = (char far *)(byte_228D0 + buf3d3[word_3B7EC->_0x06]);
        var_202 = word_3C5A8->_0x00 - var_218;
        var_203 = word_3C5A8->_0x02 - var_219;
        var_204 = word_3C5A8->_0x04 - var_220;
        FP_OFF(var_200)++;
        var_217 = 0;
        var_216 = 0;
        sub_202DA();
        if (*var_200 & 0x40) {
            var_215 = 0;
            sub_2044A();
        }
    }
}

// ==== seg000:0x345e ====
void sub_1345E(char *arg_0, int arg_2, int arg_4, int arg_6) {
    int p, a;
    var_190 = 0;
    sub_13932(arg_0, 0, 0, 0, 0, 0, 0, 0);
    gfx_setBlitOffset(gfx_calcRowAddr(*(int *)(arg_0 + 0x12), *(int *)(arg_0 + 0x0e)));
    sub_134AC(arg_2, arg_4, arg_6);
    sub_139AA();
}

// ==== seg000:0x51f9 ====

void sub_134AC(int param_1, int param_2, int param_3)
{
    int p, a, b, c, d, e, f, g, h, i;

    var_663 = param_1 >> (char)param_3;
    var_664 = param_2 >> (char)param_3;
    for (var_666 = 4; var_666 >= 0; var_666--) {
        word_3C16C = (&word_34186)[var_666];
        var_665 = (var_666 <= 1) ? 0x40 : 0;
        word_3C042 = param_3 - word_3C16C * 2 + 8;
        var_661 = 0x1000 >> (char)word_3C042;
        if (var_661 > 16) {
            var_662 = 4 << (8 - (char)word_3C16C * 2);
            sub_13638(&b, &h, &c, &p);
            for (f = c; f <= p; f++) {
                for (e = b; e <= h; e++) {
                    i = e * var_661 - var_663 + (var_661 >> 1);
                    a = f * var_661 - var_664 + (var_661 >> 1);
                    g = process3dg(word_3C16C, e, f);
                    if (g != -1) {
                        word_3C5A8 = matrix3dt_2[word_3C16C][g];
                        for (d = 0; matrix3dt[word_3C16C + 3][g + 3] > (unsigned int)d; d++) {
                            if (word_3C5A8->_0x04 == 0) {
                                var_200 = (char far *)(byte_228D0 + buf3d3[word_3C5A8->_0x06]);
                                sub_136D2(var_200,
                                    (word_3C5A8->_0x00 >> (char)word_3C042) + i,
                                    (word_3C5A8->_0x02 >> (char)word_3C042) + a);
                            }
                            word_3C5A8++;
                        }
                    }
                }
            }
        }
    }
}

// ==== seg000:0x3638 ====
void sub_13638(int *arg_0, int *arg_1, int *arg_2, int *arg_3) {
    sub_13694(0, 0, arg_0, arg_2);
    if (*arg_0 < 0) {
        *arg_0 = 0;
    }
    if (*arg_2 < 0) {
        *arg_2 = 0;
    }
    sub_13694(var_349, var_350, arg_1, arg_3);
    if (*arg_1 >= var_662) {
        *arg_1 = var_662 - 1;
    }
    if (*arg_3 >= var_662) {
        *arg_3 = var_662 - 1;
    }
}

// ==== seg000:0x3694 ====
void sub_13694(int arg_0, int arg_1, int *arg_2, int *arg_3) {
    *arg_2 = (arg_0 - word_3298C + var_663) / var_661;
    *arg_3 = ((arg_1 - word_3298E) * 4 / 3 + var_664) / var_661;
}

// ==== seg000:0x36d2 ====
void sub_136D2(char far *param_1, int param_3, int param_4) {
    *(char far **)&var_200 = param_1;
    var_200++;
    var_216 = 0;
    sub_202DA();
    if (word_3C16C >= 3) {
        if ((**(char far **)&var_200 & 0x40) != var_665)
            return;
    }
    switch ((unsigned)(unsigned char)**(char far **)&var_200 & 0x3f) {
    case 0x3e:
        return;
    case 0x3f:
        sub_1374A();
        return;
    }
    sub_1378E(param_3, param_4);
    sub_13816(param_3, param_4);
    sub_20A46();
    sub_20FDC();
}

// ==== seg000:0x378e ====
void sub_1378E(int param_1, int param_2) {
    long p;
    int b;

    p = 1L;
    var_257 = (int)(unsigned char)(*((*(char far **)&var_200)++)) & 0x1f;
    var_259 = -1;
    var_260 = -1;
    *(char *)&var_258 = (var_257 > 0x10) ? 1 : 0;
    b = 0;
    while (b < var_257) {
        var_200 += 4;
        if (*(*(int far **)&var_200)++ < 0) {
            *(long *)&var_259 ^= p;
        }
        var_200 += 2;
        p <<= 1;
        b++;
    }
}



// ==== seg000:0x3816 ====
void sub_13816(int arg_0, int arg_1) {
    int p;
    int a;
    int b;
    int c;
    int d;

    b = (int)(unsigned char)**(char far **)&var_200 & 0x80;
    var_256 = (int)(unsigned char)(*(*(char far **)&var_200)++) & 0x7F;
    for (p = 0; p < var_256; p++) {
        var_200 += (unsigned char)var_258 * 2 + 2;
        if (b != 0) {
            a = (int)(unsigned char)(*(*(char far **)&var_200)++);
            c = (((int16 *)&byte_3B7FC[0x600])[buf3d3_1[a]] >> word_3C042) + arg_0;
            d = (((int16 *)byte_3BE3E)[buf3d3_2[a]] >> word_3C042) + arg_1;
        } else {
            c = (*(*(int far **)&var_200)++ >> word_3C042) + arg_0;
            d = (*(*(int far **)&var_200)++ >> word_3C042) + arg_1;
            var_200 += 2;
        }
        (&word_34684)[p * 2] = 1;
        (&word_34686)[p * 2] = 1;
        *(long *)((char *)&word_34868 + p * 4) = (long)(c + word_3298C);
        *(long *)((char *)&word_34A4C + p * 4) = (long)(-sub_13922(d) + word_3298E);
    }
}

// ==== seg000:0x3922 ====
int sub_13922(int arg_0) {
    return arg_0 - (arg_0 >> 2);
}

// ==== seg000:0x3932 ====
void sub_13932(char *arg_0, int arg_2, int arg_4, int arg_6, int arg_8, int arg_a, int arg_c, int arg_e) {
    sub_139C0((int)arg_0);
    sub_13A6C(arg_2, arg_4, arg_6);
    sub_13A90(arg_8, arg_a, arg_c);
    if (arg_e != 0) {
        var_315 = 0;
        if (word_38FDC == 0) {
            *(uint8 *)&var_316 = 1;
        }
        if (*(uint8 *)&var_316 == 0) {
            sub_20658();
        }
        while (*(uint8 *)&origCBreakSeg != 0)
            ;
        sub_10334(*(int *)(arg_0 + 4));
    }
    var_255 = 0;
    var_261 -= 0x3000 / word_330C4;
}

// ==== seg000:0x3a6c ====
