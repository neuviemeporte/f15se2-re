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

