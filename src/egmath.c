// seg000 optimized code (/Ot)
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>


// ==== seg000:0xc8de ====

void load15Flt3d3() {
    int var_A, var_C;
    struct SREGS var_8;
    uint8 FAR *var_10;
    TRACE(("load15Flt3d3: a15flt_xxx=%s", a15flt_xxx));
    strcpyFromDot(a15flt_xxx, a_3d3_0);
    TRACE(("load15Flt3d3: after strcpyFromDot=%s", a15flt_xxx));
    fileHandle = fopen(a15flt_xxx, aRb_4);
    TRACE(("load15Flt3d3: fopen returned %d", (int)fileHandle));
    if (fileHandle == NULL) {
        // c90b
        printError(aOpenErrorOn_3d3_0);
        return;
    }
    // c922
    fread(&flt15_word1, 2, 1, fileHandle);
    fread(&flt15_size, 2, 1, fileHandle);
    fread(flt15_buf1, 2, flt15_size, fileHandle);
    fread(&var_A, 2, 1, fileHandle);
    TRACE(("load15Flt3d3: var_A=%d", var_A));
    segread(&var_8);
    var_10 = byte_2D6A4;
    TRACE(("load15Flt3d3: DS=%04x var_10=%04x:%04x", var_8.ds, FP_SEG(var_10), FP_OFF(var_10)));
    while(var_A > 0) {
        // c98b
        var_C = var_A <= 0x800 ? var_A : 0x800;
        // c99b
        fread(flt15_buf2, 1, var_C, fileHandle);
        movedata(var_8.ds, (uint16)flt15_buf2, FP_SEG(var_10), FP_OFF(var_10), var_C);
        var_A -= 0x800;
        FP_OFF(var_10) += 0x800;
    }
    TRACE(("load15Flt3d3: loop done"));
    // c9ca
    fclose(fileHandle);
    TRACE(("load15Flt3d3: done"));
}

// TODO: sub_1C9D2 (seg000:c9d2-cb41) - unimplemented

// ==== seg000:0xcb42 ====
int sub_1CB42(param_1, param_2, param_3, param_4, param_5, param_6, param_7, param_8, param_9)
int param_1;
int param_2;
int param_3;
int param_4;
int param_5;
int param_6;
int param_7;
int param_8;
int param_9;
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
    char n;

    word_39402 = 1;
    if (param_8 == 1 && word_38FDC == 0 && *(char*)&gfxModeUnset != 0 && (word_336E8 & 3) != 0) {
        return;
    }

    g = sub_1CF32(param_1);
    if (byte_3C5A0 == 0) {
        *var_568 = 0;
    } else {
        *var_568 = 1;
    }

    if (param_8 < 2) {
        var_685 = 0;
        k = param_2 - word_3BEC0;
        l = param_3 - word_3BED0;
        m = (param_4 - var_547) >> 5;
        b = sub_1D008(k, -l);
        f = sub_1D008(m, sub_1CFA6(k, l));
        c = sub_1CFA6(m, sub_1CFA6(k, l));

        if (param_8 == 1) {
            var_680 = c;
            var_682 = (c >> 4) + 0x190;
            var_683 = (var_682 << 5) / (c + 1);
            c = var_682 << 2;
            var_681 = b;
            var_684 = f;
        } else {
            var_683 = (var_680 << 5) / (c + 1);
            if (var_683 > 0x100) {
                var_683 = 0x100;
            }
            if (var_683 < 4) {
                var_683 = 4;
            }
            j = ((b - var_681) >> 5) * var_683;
            d = ((f - var_684) >> 5) * var_683;
            if (abs(j) > 0x1000) {
                return;
            }
            if (abs(d) > 0x1000) {
                return;
            }
            b = (j << 2) + var_681;
            f = (d << 2) + var_684;
            c = (var_682 << 5) / var_683 << 2;
        }

        i = sub_1D190(f, c);
        var_594 = 2;
        if (param_9 < 0) {
            var_594 = (uint8)(param_9 + 2);
            param_9 = 0;
        }
        k = sub_1D178(b, i) >> (char)param_9;
        l = -(sub_1D190(b, i)) >> (char)param_9;
        m = sub_1D178(f, c) >> (char)param_9;
    } else {
        k = (param_2 - word_3BEC0) << 4;
        l = (param_3 - word_3BED0) << 4;
        m = (param_4 - var_547) >> 1;
        var_681 = var_542;
        var_684 = word_38FCE;
        var_685 = var_545;
        var_683 = 0x20;
        var_594 = 2;
    }
    if (param_8 == 1 || param_8 == 3) {
        a = (int)((long)var_683 * (long)((int)var_684 >> 2) >> 5) + 0x9c;
        if (a < 0x80 || (int)var_684 < (int)0xe800) {
            a = 0x80;
        }
        if (a > 0xb8 || (int)var_684 > 0x1800) {
            a = 0xb8;
        }
        *(((int*)var_568) + 2) = (int)byte_3419A[0];
        if (a != 0x80) {
            sub_21444((int*)var_568, 0xe8, 0x80, 0x130, a);
        }
        h = byte_228D0[0x2f];
        e = (int)(signed char)byte_3BFA4[param_1 & 0x7f];
        if (e & 0x10) {
            h = 8;
        }
        n = (char)(e & 0xf);
        if (n == 0xc || n == 9 || n == 0xb) {
            h = 1;
        }
        *(((int*)var_568) + 2) = (int)byte_3419C[h];
        if (a != 0xb8) {
            sub_21444((int*)var_568, 0xe8, a, 0x130, 0xb8);
        }
    }

    var_316 = 1;
    sub_13932((char*)var_568, -var_681, var_684, var_685, 0, 0, 0, 0);
    sub_20104(byte_228D0 + g, -param_5, param_6, param_7, k, -l, m);
    sub_139AA();
    var_316 = 0;

    if (param_8 == 1) {
        strcpy(strBuf, (char*)aBrg);
        strcat(strBuf, itoa((unsigned int)var_681 / 0xb6, unk_3C030, 10));
        draw2Strings(strBuf, 0xf8, 0xb0, 0xf);
    }
    var_594 = 0;
}

// ==== seg000:0xcf32 ====
int sub_1CF32(unsigned int param)
{
    if (param & 0x100) {
        return buf3d3[param & 0x7f];
    }
    return (int)(&byte_2D6A4[((int *)flt15_buf1)[param]] - byte_228D0);
}

// ==== seg002:0xa ====
void far sub_21A7A() {
    sub_21A86();
}

// ==== seg002:0xe ====
void far sub_21A7E() {
    sub_22411();
}

// ==== seg000:0xcf64 clamp ====
int sub_1CF64(int arg_0, int arg_2, int arg_4) {
    if (arg_0 > arg_4) {
        return arg_4;
    }
    if (arg_0 >= arg_2) {
        return arg_0;
    }
    if (arg_0 <= -0x4000) {
        return arg_4;
    }
    return arg_2;
}

// ==== seg000:0xcf8e ====
int sub_1CF8E(int arg_0, int arg_2, int arg_4) {
    if (arg_0 > arg_4) {
        return arg_4;
    }
    if (arg_0 < arg_2) {
        return arg_2;
    }
    return arg_0;
}

// ==== seg000:0xcfa6 ====
int sub_1CFA6(int arg_0, int arg_1) {
    long a;
    arg_0 = abs(arg_0);
    arg_1 = abs(arg_1);
    if (arg_0 > arg_1)
        a = (long)(arg_1 >> 1) + (long)arg_0;
    else
        a = (long)(arg_0 >> 1) + (long)arg_1;
    if (a > 0x7FFF) a = 0x7FFF;
    return (int)a;
}

// ==== seg000:0xd008 ====
int sub_1D008(int param_1, int param_2) {
    int p, a;
    long b;
    int d, e, f;

    if (param_1 == 0) {
        if (param_2 > 0) return 0;
        return BEARING_SOUTH;
    }
    if (param_2 == 0) {
        if (param_1 > 0) return BEARING_EAST;
        return BEARING_WEST;
    }
    if (abs(param_1) > abs(param_2)) {
        b = (long)abs(param_2) << 0xe;
        d = abs(param_1);
        e = 1;
    }
    else {
        b = (long)abs(param_1) << 0xe;
        d = abs(param_2);
        e = 0;
    }
    f = b / (long)d;
    p = ((0x2800L - (((long)abs(0x1333 - f) * 0xB00L) >> 0xe)) * (long)f) >> 0xe;
    if (param_1 > 0) {
        if (param_2 > 0)
            a = e ? BEARING_EAST - p : p;
        else
            a = e ? p + BEARING_EAST : BEARING_SOUTH - p;
    }
    else {
        if (param_2 > 0)
            a = e ? p + BEARING_WEST : -p;
        else
            a = e ? BEARING_WEST - p : p + BEARING_SOUTH;
    }
}

// ==== seg000:0xd178 sinMul ====
int sub_1D178(int arg_0, int arg_2) {
    return sub_13B2F(sub_13B96(arg_0), arg_2);
}

// ==== seg000:0xd190 cosMul ====
int sub_1D190(int arg_0, int arg_2) {
    return sub_1D178(arg_0 + 0x4000, arg_2);
}

// ==== seg000:0xd1c8 ====
int sub_1D1C8(int arg_0) {
    if (arg_0 == 0) {
        return 0;
    }
    if (arg_0 > 0) {
        return 1;
    }
    return -1;
}

void sub_1D1E8(void) {
    if (word_330BE == 0) {
        var_686 = getTimeOfDay();
    }
    srand(var_686);
}

// ==== seg000:0xd200 randomRange ====
int sub_1D200(int arg_0) {
    return (int)(((long)rand() * (long)arg_0) >> 15);
}

// ==== seg000:0xd21e ====
int16 sub_1D21E(int16 arg_0)
{
    int16 p;

    if (word_330BE) {
        p = 0;
    } else {
        p = ((commData->setupUseJoy) ? misc_jump_5d_readJoy(arg_0) : 0) + (&word_38606)[arg_0];
    }
    return p;
}

