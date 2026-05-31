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

// TODO: keyDispatch (seg000:d260-d9da) - large unimplemented function
// Once implemented, try merging egame2f.c + egame1k.c (if register spill doesn't affect codegen)

// ==== seg000:0xd9db ====

void selectMissile() {
    strcpy(strBuf, missiles[missleSpec[missileSpecIndex].weaponIdx].field_A);
    strcat(strBuf, (char *)(missleSpec[missileSpecIndex].ammo == 0 ? aNotAvailable : aArmed));
    sub_11A88(missileSpecIndex);
    tempStrcpy(strBuf);
}

// ==== seg000:0xda35 ====
void makeSound(int arg_0, int arg_2) {
    if (arg_2 >= var_600) {
        if (word_3BE3C == 0 || arg_2 > 1) {
            audio_jump_66(arg_0);
        }
    }
    sub_1DA8D();
}

// ==== seg000:0xda5f ====
void sub_1DA5F(int arg_0) {
    if (var_600 < 2 && word_3BE3C == 0 &&
        (unsigned)((int16 *)(aArmed + 7))[arg_0] < (unsigned)f15DgtlResult) {
        audio_jump_6d(arg_0);
    }
}

// ==== seg000:0xda8d ====
void sub_1DA8D(void) {
    if (var_600 != 0 || word_3BE3C != 0) {
        audio_jump_69();
    } else {
        audio_jump_68();
    }
}

// ==== seg000:0xdaae ====
void sub_1DAAE(void) {
    if (word_330C4 > 15) {
        var_595 = sub_1CF64((-(120 / word_330C4 - 9)) >> 1, 1, 4);
    } else {
        var_595 = 0;
    }
    word_330C4 = sub_1CF64(word_330C4, 4 - word_3370A, 15);
    word_3AFA4 = sub_1CF64(word_330C4 << 1, 3, 16);
    word_3B0AC = 250 * word_330C4;
    word_3995C = 200 * word_330C4;
}

// ==== seg000:0xdb2b ====
void sub_1DB2B(void) {
    int p;
    for (p = 0; p < 6; p++) {
        ((int *)(byte_3419F + 13))[p] = 0x20 << ((char)p + (char)(word_38FDC > 2 ? 2 : word_38FDC));
    }
    var_196 = var_195 + var_194;
    var_197 = sub_1CF64(var_195 << 1, 0x1000, 9999);
    var_198 = (word_38FDC > 2 ? 2 : word_38FDC) * 0xD05 + 0xD05;
}

// ==== seg000:0xdb9c ====
int sub_1DB9C() {
    if (word_3370A == 2) {
        word_3370A = 1;
        word_330C4 <<= 1;
        sub_1DAAE();
    }
}

// ==== seg000:0xdbe0 ====
void sub_1DBE0(void) {
    byte_3BF93[0] = 0;
    regs.h.al = 0x8D;
    int86(0x10, &regs, &regs);
}

