// seg000 optimized code (/Ot)
#include "debug.h"
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

// ==== seg002:0xe ====
void far sub_21A7E() {
    sub_22411();
}

// ==== seg000:0x21c6 ====
int sub_121C6() {
    sub_12874();
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
    sub_12FAF(a15flt_xxx, a_3d3_0);
    fileHandle = fopen(a15flt_xxx, aRb_4);
    if (fileHandle == NULL) {
        // c90b
        sub_12F8C(aOpenErrorOn_3d3_0);
        return;
    }
    // c922
    fread(&flt15_word1, 2, 1, fileHandle);
    fread(&flt15_size, 2, 1, fileHandle);
    fread(flt15_buf1, 2, flt15_size, fileHandle);
    fread(&var_A, 2, 1, fileHandle);
    segread(&var_8);
    var_10 = byte_2D6A4;
    while(var_A > 0) {
        // c98b
        var_C = var_A <= 0x800 ? var_A : 0x800;
        // c99b
        fread(flt15_buf2, 1, var_C, fileHandle);
        movedata(var_8.ds, (uint16)flt15_buf2, FP_SEG(var_10), FP_OFF(var_10), var_C);
        var_A -= 0x800;
        FP_SEG(var_10) += 0x800;
    }
    // c9ca
    fclose(fileHandle);
}
