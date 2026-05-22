// seg000 optimized code (/Ot)
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

// ==== seg002:0xa ====
int far sub_21A7A() {
    sub_21A86();
}

// ==== seg002:0xe ====
void far sub_21A7E() {
    sub_22411();
}

// ==== seg000:0x21c6 ====
int sub_121C6() {
    load3DAll();
}

// ==== seg000:0x2278 ====
int sub_12278(int arg_0) {
    uint8 var_2;
    if (arg_0 > 0) { // 2284
        var_2 = (uint8)arg_0 + byte_3790C[0];
        while (var_2 != byte_3790C[0]) {}
    }
}

// ==== seg000:0xc8de ====
int load15Flt3d3() {
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

// ==== seg000:0xdd4c ====
int openFileWrapper(char *path, int mode) {
    TRACE(("openFileWrapper: path=%s mode=%d", path, mode));
    return openFile(path, mode);
}

// ==== seg000:0xdd70 ====
int closeFileWrapper(int arg_0) {
    closeFile(arg_0);
}

// ==== seg000:0x229a loadColorPalette ====
void copySomeMem(int arg_0) {
    memcpy(word_3419C, (char *)word_339B4 + arg_0 * 0x10, 0x10);
}

// ==== seg000:0x3922 ====
int sub_13922(int arg_0) {
    return arg_0 - (arg_0 >> 2);
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

// ==== seg000:0xd178 sinMul ====
int sub_1D178(int arg_0, int arg_2) {
    return sub_13B2F(sub_13B96(arg_0), arg_2);
}

// ==== seg000:0xd190 cosMul ====
int sub_1D190(int arg_0, int arg_2) {
    return sub_1D178(arg_0 + 0x4000, arg_2);
}

// ==== seg000:0xd200 randomRange ====
int sub_1D200(int arg_0) {
    return (int)(((long)rand() * (long)arg_0) >> 15);
}

// ==== seg000:0x3a90 ====
void sub_13A90(int arg_0, int arg_2, int arg_4) {
    var_218 = arg_0;
    var_219 = arg_2;
    var_220 = arg_4;
}

// ==== seg000:0xdd5e ====
int sub_1DD5E(int arg_0, int arg_1) {
    return createFile(arg_0, arg_1);
}

// ==== seg000:0xdd7e ====
int sub_1DD7E(int arg_0, int arg_1, int arg_2) {
    return readFile1(arg_0, arg_1, arg_2);
}

// ==== seg000:0xdd92 ====
int sub_1DD92(int arg_0, int arg_1, int arg_2, int arg_3) {
    return readFile2(arg_0, arg_1, arg_2, arg_3);
}

// ==== seg000:0xddaa ====
int sub_1DDAA(int arg_0, int arg_1, int arg_2, int arg_3, int arg_4) {
    return sub_1DF4F(arg_0, arg_1, arg_2, arg_3, arg_4);
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

// ==== seg000:0xa740 ====
int sub_1A740(int arg_0, int arg_2, int arg_4) {
    sub_19E44(arg_4);
    sub_19D86(var_279 - 4, var_282 - 3, var_279 + 4, var_282 - 3);
    sub_19D86(var_279 + 4, var_282 - 3, var_279 + 4, var_282 + 3);
    sub_19D86(var_279 + 4, var_282 + 3, var_279 - 4, var_282 + 3);
    sub_19D86(var_279 - 4, var_282 + 3, var_279 - 4, var_282 - 3);
}

// ==== seg000:0x3694 ====
void sub_13694(int arg_0, int arg_1, int *arg_2, int *arg_3) {
    *arg_2 = (arg_0 - word_3298C + var_663) / var_661;
    *arg_3 = ((arg_1 - word_3298E) * 4 / 3 + var_664) / var_661;
}

// ==== seg000:0x66be ====
void sub_166BE(void) {
    int p;
    word_336F0 = word_3B0AC;
    if (word_333DA != 0) {
        word_3B4D8 = word_333D2;
        word_3B4E0 = word_333D4;
    } else {
        word_3B4D8 = word_3BEC0;
        word_3B4E0 = word_3BED0;
    }
    word_3B5D6 = var_547;
    word_38FEC = var_542;
    word_3BED4 = 0xFF;
    for (p = 0; p < word_3C69E; p++) {
        if (stru_3AA5E[p].field_4 != 0) {
            *(int *)&stru_3AA5E[p].field_8 = sub_1CF64(*(int *)&stru_3AA5E[p].field_8, ((word_330B8 + word_330BA) << 4) - 16, 0xFF);
        }
    }
}

// ==== seg000:0x3266 ====
int sub_13266(int p1, int p2, int p3, int p4) {
    for (var_660 = word_38FF8 - 1; var_660 >= 0; var_660--) {
        if (*(&byte_3B4E6 + var_660 * 8) == p1 &&
            *(&byte_3B4E6 + var_660 * 8 + 1) == p2 &&
            *(&byte_3B4E6 + var_660 * 8 + 2) == p3 &&
            *(&byte_3B4E6 + var_660 * 8 + 3) == p4) {
            return *(int *)(&byte_3B4E6 + var_660 * 8 + 4);
        }
    }
    return 0;
}

// ==== seg000:0x4224 ====
void sub_13224(char *a, int b, char c) {
    *(int *)(a + 0x12) = b;
    *(a + 0x14) = c;
    memcpy((char *)&byte_3B4E6 + word_38FF8++ * 8, a + 0x0e, 8);
    *(*(char **)(a + 0x0c) + 6) |= 0x80;
}

// ==== seg000:0x660e routine_324 ====
int sub_1660E(int arg_0, int arg_2, int arg_4, int arg_6, int *arg_8, int *arg_a) {
    int p;
    int a;
    int b;
    int c;
    int d;
    int e;
    unsigned f;

    if (arg_6 == 0 || arg_6 == -1) {
        return 0;
    }
    d = word_3BEC0 - arg_0;
    e = word_3BED0 - arg_2;
    c = (unsigned)sub_1CFA6(d, e) >> 6;
    b = sub_1D008(d, -e);
    f = (f = (*(int16 *)&aNone[arg_6 * 14 + 10] + word_330B8 * 2 + 3) * *(int16 *)&aNone[arg_6 * 14 + 8] / 16) * (((unsigned)var_547 >> 6) + 0x40) >> 7;
    *arg_8 = b;
    *arg_a = c;
    return f;
}

// ==== seg000:0x89aa ====
int sub_189AA(int arg_0) {
    if (planeFlags & (0x4000 >> arg_0)) {
        return 0;
    }
    if (*(&word_3B144 + 9 * arg_0) == 4 || *(&word_3B144 + 9 * arg_0) == 3) {
        sub_11D10((arg_0 != 0 ? 0x40 : 0x80) + 0x0b, 0);
    }
    if (arg_0 != 0) {
        strcpy(strBuf, aSecond_Target);
        waypointIndex = 1;
        var_730 |= 0x20;
    } else {
        strcpy(strBuf, aPrimaryTarget_0);
        waypointIndex = 2;
        var_730 |= 0x40;
    }
    if ((planeFlags & 0x6000) == 0x6000) {
        waypointIndex = 3;
    }
    return 1;
}

// ==== seg000:0x85be ====
int sub_185BE(int param_1, int param_2, int param_3, int param_4, int param_5) {
    int p;
    int a;
    int b;
    int c;

    b = param_2 - stru_335C4[param_1].field_0;
    c = param_3 - stru_335C4[param_1].field_2;
    a = sub_1CFA6(b, c);
    var_670 = sub_1D008(b, -c);
    if (stru_335C4[param_1].field_6 * 24 / word_330C4 > a) {
        var_669 = a;
        return 1;
    }
    p = abs(var_670 - stru_335C4[param_1].field_8);
    if (p > 0x1000 && param_5 != 3) {
        if (p > 0x6000 && param_1 < 8) {
            if ((stru_335C4[param_1].field_6 << 4) / word_330C4 < a) {
                stru_335C4[param_1].field_E = sub_1CF64(stru_335C4[param_1].field_E, 0, word_330C4 << 4);
            }
        }
        return 0;
    }
    if (param_5 == 0) {
        if (abs(stru_335C4[param_1].field_8 - var_542) > 0x2000) {
            return 0;
        }
    }
    if (param_5 == 0) {
        var_669 = a;
        return 1;
    }
    p = abs(stru_335C4[param_1].field_8 - var_542);
    if (abs(p - 0x4000) >= 0x2000 - word_330B8 * 2048) {
        var_669 = a;
        return 1;
    }
    return 0;
}

// ==== seg000:0x6742 ====
int routine_191(void) {
    int p;
    int a;
    int b;

    b = 0;
    for (a = 0; a < word_38FFA; a++) {
        p = stru_3AA5E[a].field_4;
        if (p != 0) {
            b += *(int *)((char *)aNone + p * 14 + 8) * *(int *)((char *)aNone + p * 14 + 10) * (word_330B8 + 2) / 64;
        }
    }
    b /= 100;
    return b;
}

