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

// ==== seg000:0xc1b9 ====

void sub_1C1B9(int arg_0, int arg_2, int arg_4, int arg_6) {
    int p;
    int a;
    int b;
    int c;
    int d;

    if (word_330C2 == 0) {
        return;
    }
    if (var_456 != 0) {
        arg_4 >>= 1;
    }
    p = arg_4 - (arg_4 >> 2);
    c = arg_0 + arg_4;
    a = arg_0 - arg_4;
    d = arg_2 + p;
    b = arg_2 - p;
    if (arg_6 == 0) {
        sub_19DB0(a, b, a, d);
        sub_19DB0(a, d, c, d);
        sub_19DB0(c, d, c, b);
        sub_19DB0(c, b, a, b);
    } else {
        sub_19DB0(arg_0, b, c, arg_2 - (p >> 1));
        sub_19DB0(c, arg_2 - (p >> 1), c, arg_2 + (p >> 1));
        sub_19DB0(c, (p >> 1) + arg_2, arg_0, d);
        sub_19DB0(arg_0, d, a, (p >> 1) + arg_2);
        sub_19DB0(a, arg_2 + (p >> 1), a, arg_2 - (p >> 1));
        sub_19DB0(a, arg_2 - (p >> 1), arg_0, b);
    }
}

// ==== seg000:0xC2F8 ====
void sub_1C2F8(void) {
    int p;
    int a;
    if (var_671 != 0 && word_330C2 != 0) {
        if (byte_3C5A0 != 0) {
            draw2Strings((char *)aMissileLock, 0xf4, 0x96, 14);
        }
        sub_19E44(14);
        p = 0x10c;
        a = 0x9c;
        sub_19BE1(0x102, 0x9c, 0x116, 0x9c);
        sub_19BE1(p, a - 8, p, a + 8);
    }
}

// ==== seg000:0xc371 ====
void sub_1C371(char *arg_0, int arg_2, int arg_4) {
    if (var_279 == -1) {
        return;
    }
    sub_19E44(arg_2);
    if (arg_4 < var_279 && 0x13f - arg_4 > var_279 &&
        arg_4 < var_282 && 0x58 - arg_4 > var_282) {
        sub_1C1B9(var_279, var_282, arg_4, 1);
    }
    if (var_279 > 0x14 && var_279 < 0x118 &&
        var_282 > 0 && var_282 < 0x52) {
        draw2Strings(arg_0, var_279 - (int)strlen(arg_0) * 2, var_282 + 5, word_38F72);
    }
}

// ==== seg000:0xc40b ====
void sub_1C40B(int param_1) {
    int p;
    int a;
    int b;
    int c;
    int d;

    strcpy(strBuf, aRange);
    strcat(strBuf, itoa(param_1 >> 6, unk_3C030, 10));
    strcat(strBuf, aDot);
    strcat(strBuf, itoa((param_1 & 0x3f) * 2 / 13, unk_3C030, 10));
    strcat(strBuf, aKm);
}

// ==== seg000:0xc488 ====
void sub_1C488(int param_1, int param_2, int param_3) {
    int p;
    long a;
    int c;
    long d;
    int f;
    long g;

    p = word_3BEC0 - param_1;
    c = param_2 - word_3BED0;
    f = (param_3 - var_547) >> 5;

    if (keyValue & 0x80) {
        p -= (int)((dword_3B7DA - dword_3B1FE) >> 5);
        c -= (int)((dword_3B7F8 - dword_3B4D4) >> 5);
        f -= (int)((-((long)(unsigned)var_547 - (long)word_3B4DE)) >> 5);
    }

    a = sub_1C661(0, p, c, f);
    d = sub_1C661(1, p, c, f);
    g = sub_1C661(2, p, c, f);

    if (g >= 0) {
        var_279 = -1;
        return;
    }

    if (var_456) {
        a >>= 1;
        d >>= 1;
    }

    if (-g < a || a < g) {
        var_279 = -1;
        return;
    }

    var_279 = (int)((a << 8) / g) + 0xa0;
    var_282 = (int)((d << 8) / g);
    var_282 -= var_282 >> 1 >> 1;
    var_282 += (var_564[8] == 0xc7) ? 0x64 : 0x38;

    word_3C016 = (int)(g >> 3);

    if (var_279 < 0 || var_279 > 0x13f) {
        var_673 = var_279;
        var_279 = -1;
    }
    if (var_282 < 0 || var_564[8] < var_282) {
        var_673 = var_279;
        var_279 = -1;
    }
}

// ==== seg000:0xc661 ====
long sub_1C661(int param_1, int param_2, int param_3, int param_4) {
    long p;

    p = (long)sub_13B2F(((int *)unk_3A948)[param_1], param_2);
    p += (long)sub_13B2F(((int *)(unk_3A948 + 6))[param_1], param_4);
    p += (long)sub_13B2F(((int *)(unk_3A948 + 12))[param_1], param_3);
    return p;
}





int sub_1C6BE(int param_1, int param_2)
{
    int p;

    if (word_39808 = sub_12FDA((int32)param_1 << 5, (0x8000L - (int32)param_2) << 5)) {
        param_1 = ((int32 *)word_39808)[1] >> 5;
        param_2 = -((int)(((int32 *)word_39808)[2] >> 5) - 0x8000);
        for (p = 1; p < word_3BED2; p++) {
            if (stru_3AA5E[p].field_0 == param_1 && stru_3AA5E[p].field_2 == param_2) {
                return p;
            }
        }
        stru_3AA5E[0].field_0 = param_1;
        stru_3AA5E[0].field_2 = param_2;
        stru_3AA5E[0].field_C = *word_39808 + 0x100;
        if (word_336F6 == 0) {
            word_336F6 = -1;
        }
        return 0;
    } else {
        return -1;
    }
}

// ==== seg000:0xc7a2 ====
int sub_1C7A2(int arg_0) {
#ifdef BUGFIX
    sub_1C7EA(stru_3AA5E[arg_0].field_0, stru_3AA5E[arg_0].field_2, 1);
    return 0;
#else
    return sub_1C7EA(stru_3AA5E[arg_0].field_0, stru_3AA5E[arg_0].field_2, 1);
#endif
}

// ==== seg000:0xc7c6 ====
int sub_1C7C6(int arg_0) {
#ifdef BUGFIX
    sub_1C7EA(*(int *)&unk_3B202[2 + arg_0 * 36], *(int *)&unk_3B202[4 + arg_0 * 36], 0);
    return 0;
#else
    return sub_1C7EA(*(int *)&unk_3B202[2 + arg_0 * 36], *(int *)&unk_3B202[4 + arg_0 * 36], 0);
#endif
}

// ==== seg000:0xc7ea ====
void sub_1C7EA(int arg_0, int arg_1, int arg_2) {
    int p;
    int a;
    p = word_3BEC0 - arg_0;
    a = word_3BED0 - arg_1;
    if (arg_2 != 0) {
        var_674 = sub_1D008(-p, a);
    }
    var_672 = sub_1CFA6(p, a);
    goto done;
done:;
}

// ==== seg000:0xc82d ====
int sub_1C82D() {
    return (int)((unsigned long)((long)(0x4000 - abs(var_544)) << 12) / (unsigned long)(unsigned int)(var_547 + 0x1000)) - 0x4000;
}

// ==== seg000:0xc864 ====
int sub_1C864(int param_1) {
    if (stru_3AA5E[param_1].field_6 & 0x80) {
        return (sub_1C8A4(param_1) ? (int)(char)byte_3BEC4[0] : (int)(char)byte_3C02A[0]) + 0x100;
    }
    return stru_3AA5E[param_1].field_C;
}

// ==== seg000:0xc8a4 ====
int sub_1C8A4(int param_1) {
    int p;

    p = ((char *)byte_3BFA4)[stru_3AA5E[param_1].field_C & 0x7f] & 0x0f;
    return (p == 0x0c || p == 9 || p == 0x0b) ? 1 : 0;
}

