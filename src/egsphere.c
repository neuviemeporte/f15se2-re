// seg000 optimized code (/Ot)
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

// ==== seg000:0x0334 ====
void drawProjectionSphere(int arg_0)
{
    int p;
    int a;
    int b[17];
    int c[17];
    int d[17];
    int e[17];
    int f[8];
    int g;

    if (*(char *)&word_38FDC < 3) {
        sub_1FEEC(arg_0);
        return;
    }
    {
        register int i;
        a = 0;
        do {
            i = a + a;
            *((int *)((char *)word_3BE9C + i)) = *((int *)((char *)&word_32990 + i));
            a++;
        } while (a < 16);
    }
    word_38FC6 = -var_226;
    p = (int)(((long)var_224 << 8) / (long)(var_225 < 0x200 ? 0x200 : var_225));
    if (byte_3850E != 0) {
        p <<= byte_3850E;
    }
    if (byte_37C24 != 0) {
        p >>= 1;
    }
    {
        register int i;
        register int j;
        for (a = 0; a < 17; a++) {
            if (a < 16) {
                g = word_3BE9C[a] + p;
            } else {
                g = 0x5848;
            }
            i = fixedMulQ14(-0x5848, var_227);
            j = fixedMulQ14(g, word_38FC6);
            b[a] = (word_3298C + i) - j;
            d[a] = -i + word_3298C - j;
            i = fixedMulQ14(g, var_227);
            j = fixedMulQ14(-0x5848, word_38FC6);
            c[a] = -(-((i + j >> 2) - i) + j) + word_3298E;
            e[a] = ((i - j >> 2) + word_3298E) - i + j;
        }
    }
    a = 0;
    do {
        f[0] = b[a];
        f[1] = c[a];
        f[2] = d[a];
        f[3] = e[a];
        f[4] = d[a + 1];
        f[5] = e[a + 1];
        f[6] = b[a + 1];
        f[7] = c[a + 1];
        drawPolygonOutline(word_3298A, 4, f, a + 0x60);
        a++;
    } while (a < 16);
    word_3BE9C[0] = var_220 / 0x200;
    a = 1;
    do {
        word_3BE9C[a] = var_220 / ((16 - a) * 0x20) - word_3BE9C[0];
        a++;
    } while (a < 16);
    word_3BE9C[0] = 0;
    {
        register int i;
        register int j;
        for (a = 0; a < 17; a++) {
            if (a < 16) {
                g = p - word_3BE9C[a];
            } else {
                g = -0x5848;
            }
            i = fixedMulQ14(-0x5848, var_227);
            j = fixedMulQ14(g, word_38FC6);
            b[a] = (word_3298C + i) - j;
            d[a] = -i + word_3298C - j;
            i = fixedMulQ14(g, var_227);
            j = fixedMulQ14(-0x5848, word_38FC6);
            c[a] = -(-((i + j >> 2) - i) + j) + word_3298E;
            e[a] = ((i - j >> 2) + word_3298E) - i + j;
        }
    }
    a = 0;
    do {
        f[0] = b[a];
        f[1] = c[a];
        f[2] = d[a];
        f[3] = e[a];
        f[4] = d[a + 1];
        f[5] = e[a + 1];
        f[6] = b[a + 1];
        f[7] = c[a + 1];
        drawPolygonOutline(word_3298A, 4, f, a + 0x70);
        a++;
    } while (a < 16);
}
