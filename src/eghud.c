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


// TODO: otherKeyDispatch (seg000:3f72-51f8) - large unimplemented function
// Once implemented, try merging from preceding file (if register spill doesn't affect codegen)

void sub_151F9(int param_1, int param_2) {
    int p;
    int a;

    var_549++;
    if (!(*(char *)&var_549 & 7)) {
        *(char *)&word_380D8 = 1;
    }
    sub_20E38(param_1, param_2, unk_380B6);
    memcpy(unk_3806E, unk_380B6, 0x12);
}

// ==== seg000:0x5411 ====
// TODO: sub_15237 (seg000:5237-5410) - unimplemented

void sub_15411() {
    sub_20BAE(unk_3806E, var_542, var_544, var_545);
    *(char *)&word_380D8 = 0;
    var_549 = 0;
}

// ==== seg000:0x543b ====
unsigned sub_1543B(int param_1, int param_2) {
    char p = 1;
    char a = 1;
    long b;
    long d;

    if (param_1 < 0) p = -1;
    if (param_2 < 0) a = -1;
    b = (long)(param_1 < 0 ? -param_1 : param_1);
    d = (long)(param_2 < 0 ? -param_2 : param_2);
    return (unsigned)((unsigned int)((((unsigned long)(unsigned int)b) << 16) / d >> 1)) * (unsigned)(int)p * (unsigned)(int)a;
done:
    ;
}

// ==== seg000:0x54b7 ====
int sub_154B7(int param_1) {
    int p;
    int a;
    int b;
    int c;

    if (param_1 == (int)0x8000) return (int)0xc000;
    a = abs(param_1);
    b = (a >> 9) + 1;
    for (; b >= 0; b--) {
        if ((&word_37348)[b] <= a) {
            c = (&word_3734A)[b] - (&word_37348)[b];
            p = (int)((long)(a - (&word_37348)[b]) * 256L / (long)c) + b * 256;
            break;
        }
    }
    if (param_1 < 0) {
        p = -p;
    }
    return p;
}

// ==== seg000:0x5540 ====
int sub_15540(int arg_0) {
    return 0x4000 - sub_154B7(arg_0);
}

int sub_15557(int arg_0) {
    int p;
    int a;
    arg_0 = abs(arg_0);
    if (arg_0 < 4) {
        return 1;
    }
    a = arg_0 >> 2;
    do {
        p = arg_0 / a;
        a = (a + p) >> 1;
    } while (abs(a - p) > 1);
    return a;
}

// ==== seg000:0x55ab ====
// something to do with view switching?
int sub_155AB() {
    int var_2, var_4, var_6, var_8, var_A, var_C, var_E;
    TRACE(("sub_155AB: enter"));
    dword_3B1FE = dword_3C01C = dword_3B7DA;
    dword_3B4D4 = dword_3B7F8;
    dword_3C024 = 0x100000 - dword_3B7F8;
    TRACE(("sub_155AB: past assigns"));
    // 55ef
    word_3B4DE = word_380CE + 0x18;
    word_3C02C = word_380CE;
    var_2 = word_336FE = sub_1CF64(word_336FE, 2, 8);
    TRACE(("sub_155AB: past clamp, keyValue=%d", keyValue));
    // 5613
    switch(keyValue) {
    case 0:
    case 0x44: // 5616
        word_3C5AA = word_380C8;
        word_3BE94 = word_380CA;
        word_3B4E4 = word_380CC;
        // 5628
        break;
    case 0x41: // 562b
        word_3C5AA = word_380C8 + 0x8000;
        word_3BE94 = -word_380CA;
        word_3B4E4 = -word_380CC;
        // 5644
        break;
    case 0x43:
        word_3C5AA = word_380C8 + 0x4000;
        word_3BE94 = -word_380CC;
        word_3B4E4 = word_380CA;
        // 565e
        break;
    case 0x42:
        word_3C5AA = word_380C8 - 0x4000;
        word_3BE94 = word_380CC;
        word_3B4E4 = -word_380CA;
        // 5678
        break;
    case 0x84: // 567b
        var_E = (word_336E8 - ((word_330C4  + 1) / 2) - 1) & 0xf;
        word_3C5AA = stru_3A95A[var_E].field_A;
        word_3BE94 = stru_3A95A[var_E].field_C;
        // 56a9
        word_3B4E4 = stru_3A95A[var_E].field_E;
        dword_3B1FE = stru_3A95A[var_E].field_0;
        dword_3B4D4 = stru_3A95A[var_E].field_4;
        word_3B4DE = stru_3A95A[var_E].field_8;
        // 56d1
        break;
    case 0x85:
        word_3C5AA = word_380C8 - 0x4000;
        word_3BE94 = 0;
        word_3B4E4 = 0;
        // 5708
        dword_3B1FE = sub_1D178(word_380C8 + 0x4000, 0x18 << var_2) + dword_3B7DA;
        // 572e
        dword_3B4D4 = sub_1D190(word_380C8 + 0x4000, 0x18 << var_2) + dword_3B7F8;
        // 5735
        break;
    case 0x86: // 5738
        word_3C5AA = 0x8000;
        word_3BE94 = 0;
        word_3B4E4 = 0;
        dword_3B4D4 = (0x18 << var_2) + dword_3B7F8;
        // 5762
        break;
    case 0x87:
        word_3C5AA = word_380C8;
        word_3BE94 = 0;
        word_3B4E4 = 0;
        // 5796
        dword_3B1FE = sub_1D178(word_380C8 + 0x8000, 0x18 << var_2) + dword_3B7DA;
        // 57ad
        dword_3B4D4 = sub_1D190(word_380C8 + 0x8000, 0x18 << var_2) + dword_3B7F8;
        word_3B4DE = (4 << var_2) + word_380CE;
        // 57d2
        break;
    case 0x88:
    case 0x89:
    case 0x8b: // 57d5
        if (keyValue != 0x89) { // 57dd
            if (word_3C45C == 1) { // 57e4
                // XXX: test byte ptr word_336F2, 80h -> check which byte is tested, other byte ptr instructions in this routine
                if (!(word_336F2 & 0x80)) word_3C02E = word_336F2 + 0x20;
            }
            else { // 57f6
                if (!(word_336F4 & 0x80)) word_3C02E = word_336F4 + 0x40;
            }
            // 5806
        }
        else { // 5808
            if (word_3370E == 0) word_3C02E = word_3A940;
        } // 5815
        var_4 = var_2;
        // 581b
        if (!(word_3C02E & 0x40)) { // 5825
            if (!(word_3C02E & 0x20)) { // 582c
                if (stru_335C4[word_3C02E].field_E != 0) { // 583c
                    // 584e
                    dword_3C01C = (uint32)(stru_335C4[word_3C02E].field_0) << 5;
                    // 5867
                    dword_3C024 = (uint32)(stru_335C4[word_3C02E].field_2) << 5;
                    word_3C02C = stru_335C4[word_3C02E].field_4;
                }
                else { // 5877
                    stru_335C4[word_3C02E].field_8 = word_380C8;
                    stru_335C4[word_3C02E].field_A = word_380CA;
                    if (word_3370E != 0) keyValue = 0x87;
                } // 589b
                var_2 = 5;
            }
            else { // 58a2
                // .... word_3C02E & 0x1f
                dword_3C01C = stru_3B208[word_3C02E & 0x1f].field_2;
                dword_3C024 = stru_3B208[word_3C02E & 0x1f].field_6;
                word_3C02C = stru_3B208[word_3C02E & 0x1f].field_0;
                var_2 = 5;
            } // 58d9
        }
        else { // 58db
            dword_3C01C = (uint32)stru_3AA5E[word_3C02E & 0x3f].field_0 << 5;
            dword_3C024 = (uint32)stru_3AA5E[word_3C02E & 0x3f].field_2 << 5;
            // 5928
            word_3C02C = stru_3AA5E[word_3C02E & 0x3f].field_6 & 0x200 ? 0xc8 : 0x32;
            var_2 = 7;
            if (word_336EA != 0 && word_3370C == -1) var_2 = 6;
        } // 5943
        if (word_3370E == 0) var_2 = var_4;
        // 5967
        var_A = (dword_3C01C >> 5) - word_3BEC0;
        // 5981
        var_C = (dword_3C024 >> 5) - word_3BED0;
        var_6 = sub_1CFA6(var_A, var_C);
        word_3C5AA = sub_1D008(var_A, -var_C);
        // 59ba
        word_3BE94 = -sub_1D008((word_3C02C - word_380CE) >> 5, var_6);
        word_3B4E4 = 0;
        // 59d6
        var_8 = sub_1D190(word_3BE94, 0x18 << var_2);
        if (word_3C02E & 0x60 || word_3370E != 0) { // 59ea
            if (keyValue == 0x88) { // 59f2
                // 5a0b
                dword_3B1FE = sub_1D178(word_3C5AA + 0x8000, var_8) + dword_3B7DA;
                dword_3B4D4 = sub_1D190(word_3C5AA + 0x8000, var_8) + dword_3B7F8;
                // 5a53
                word_3B4DE = sub_1D178(word_3BE94, 0x18 << var_2) + (4 << var_2) + word_380CE;
                word_3BE94 = -word_3BE94;
            }
            else { // 5a62
                dword_3B1FE = sub_1D178(word_3C5AA, var_8) + dword_3C01C;
                dword_3B4D4 = sub_1D190(word_3C5AA, var_8) - dword_3C024 + 0x100000;
                // 5ac3
                word_3B4DE = (4 << var_2) - sub_1D178(word_3BE94, 0x18 << var_2) + word_3C02C;
                if (word_3C02E & 0x40 && stru_3AA5E[word_3C02E & 0x3f].field_6 & 0x200 && word_3B4DE < 0x84) {
                    word_3B4DE = 0x84;
                } // 5aed
                word_3C5AA += 0x8000;
            } // 5af2
        }
        else { // 5af5
            word_3C5AA = stru_335C4[word_3C02E].field_8;
            word_3BE94 = stru_335C4[word_3C02E].field_A - 0x400;
            // 5b22
            var_8 = sub_1D190(word_3BE94, 0x10 << var_2);
            dword_3B1FE = dword_3C01C - sub_1D178(word_3C5AA, var_8);
            // 5b68
            dword_3B4D4 = 0x100000 - (sub_1D190(word_3C5AA, var_8) + dword_3C024);
            // 5b88
            word_3B4DE = word_3C02C - sub_1D178(word_3BE94, 0x10 << var_2);
        }
        // 5b8c
        break;
    case 0x8c: // 5b8f
        word_3BE94 = 0xf400;
        word_3B4E4 = 0;
        dword_3B1FE = (int32)word_3C028 << 5;
        // 5bcf
        dword_3B4D4 = (0x8000 - (int32)word_3C03A) << 5;
        word_3B4DE = word_3C040;
        // 5bdc
        break;
    } // 5c33
    // 5c3d
    if (abs(word_3BE94) > 0x4000 || word_3BE94 == 0x8000) { // 5c4a
        // 5c51
        word_3BE94 = 0x8000 - word_3BE94;
        word_3C5AA += 0x8000;
        // 5c60
        word_3B4E4 = 0x8000 - word_3B4E4;
    } // 5c63
    if (keyValue == 0) { // 5c6a
        memcpy(unk_3A948, unk_3806E, 0x12);
    }
    else {// 5c7e
        sub_20BAE(unk_3A948, word_3C5AA, word_3BE94, word_3B4E4);
    } // 5c96
    // 5ca1
    word_3B4DE = word_3B4DE < 0x10 ? 0x10 : word_3B4DE;
    var_E = word_330C2;
    word_330C2 = (keyValue & 0xc0) == 0;
    if (var_E != word_330C2) { // 5cc3
        gfx_waitRetrace();
        if (word_330C2 != 0) { // 5cd2
            gfx_resetBlitOffset2();
            // the pointer arguments are probably rastports, RectCopy?
            gfx_copyRect(*off_38364, 0, 0x61, *off_38334, 0, 0x61, 0x140, 0x67);
            // 5d23
            gfx_copyRect(*off_38364, 0, 0x61, *off_3834C, 0, 0x61, 0x140, 0x67);
            sub_15FDB();
            sub_11A18();
            sub_11A88(missileSpecIndex);
            if (word_3C09A == 0) { // 5d42
                sub_195C9(word_3BEC0, word_3BED0);
            } // 5d50
            word_336F4 = word_336F2 = 0xffff;
            sub_19FCC(3, 3);
            word_39604 = 0;
        }
        else { // 5d6c
            gfx_copyRect(*off_38334, 0, 0x61, *off_38364, 0, 0x61, 0x140, 0x67);
        }
    } // 5d96
    if (keyValue != word_38152) { // 5da2
        if (keyValue == 0x42 || keyValue == 0x43 || keyValue == 0x41) { // 5dba
            gfx_waitRetrace();
            if (gfx_getModecode() == 3) { // 5dc9
                openBlitClosePic(keyValue == 0x42 ? a256left_pic : keyValue == 0x43 ? a256right_pic : a256rear_pic, *off_38334);
            }
            else { // 5df3
                openBlitClosePic(keyValue == 0x42 ? aLeft_pic : keyValue == 0x43 ? aRight_pic : aRear_pic, *off_38334);
            } // 5e1b
            gfx_copyRect(*off_38334, 0, 0x61, *off_3834C, 0, 0x61, 0x140, 0x67);
            // 5e50
            off_38334[0x10] = off_3834C[0x10] = 0x60;
        }
        else { // 5e58
            off_38334[0x10] = off_3834C[0x10] = word_330C2 != 0 ? 0x60 : 0xc7;
        } // 5e75
        word_38152 = keyValue;
    } // 5e7b
    byte_34197 = byte_228D0[0x2f];
    *(uint8*)(&word_3BE98) = 3;
    if (word_38FDC == 0 && commData->gfxModeNum != 0) { // 5e9d
        byte_34197 = 3;
        *(uint8*)(&word_3BE98) = 0x0b;
    } // 5ea7
    copySomeMem(word_330BC);
    *(uint8*)(&word_36B86) = 0;
    TRACE(("sub_155AB: before sub_121CA"));
    // 5eeb
    sub_121CA(-word_3C5AA, word_3BE94, word_3B4E4, dword_3B1FE, dword_3B4D4, (int32)word_3B4DE, 0, 0, 0x140, off_38334[0x10] + 1);
    byte_3850E = 0;
    byte_3995A = word_36B86;
    // 5efc
    if (keyValue == 0x41) { // 5f06
        sub_160D3(unk_38128);
        gfx_setColor(0xf);
        word_3755D = 0xf1;
        word_37561 = 0x15;
        word_3755F = 0xfb;
        word_37563 = 0x5e;
        // 5f34
        sub_2152A();
        word_3755D = 0x53;
        word_37561 = 0x15;
        word_3755F = 0x49;
        word_37563 = 0x5e;
        // 5f51
        sub_2152A();
        gfx_resetBlitOffset2();
        var_E = byte_3C5A0;
        byte_3C5A0 = gfx_getDisplayPage();
        // 5f84
        sub_1A8C8(0x6b, 0x30, 0xd1, 0, 0x6f, 0x2f, 0);
        sub_1A8C8(0x41, 0x5f, 0x7d, 0x36, 0xc3, 2, 0);
        byte_3C5A0 = var_E;
    } // 5fb1
    gfx_flipPage();
    // 5fd3
    // height of picture depending on whether view full or cockpit in the way?
    word_38126 = (word_3C09E == 0x13 || word_3C09A == 1 || word_330C2 == 0) ? 0xc8 : 0x61;
    TRACE(("sub_155AB: exit"));
} // 5fda

// ==== seg000:0x5fdb ====
void sub_15FDB(void) {
    if (word_330C2 != 0) {
        sub_19E44(0);
#if !defined(MSDOS)
        sub_19E5D(0xd4, 0x7f, 0xde, 0xaf/*, 0xc4 garbage*/);
#else
        sub_19E5D(0xd4, 0x7f, 0xde, 0xaf, 0xc4);
#endif
        sub_19E44(0x0c);
        sub_19E5D(0xd4, -(var_552 / 3 - 0xaf), 0xde, 0xaf);
        if (100 < var_552) {
            sub_19E44(0x0e);
            sub_19E5D(0xd4, -(var_552 / 3 - 0xaf), 0xde, 0x8e);
        }
    }
}
// ==== seg000:0x606c ====
void sub_1606C(void) {
    if (word_330C2 == 0) {
        return;
    }
    sub_19E44(0);
    sub_19E5D(5, 0x6d, 0x0a, 0x98);
    sub_19E44(word_33098 > 2000 ? 2 : 14);
    sub_19E5D(5, -(word_33098 / 250 - 0x98), 0x0a, 0x98);
}

// ==== seg000:0x60d3 ====
void sub_160D3(int16 *arg_0) {
    while (*arg_0 != -1) {
        gfx_setColor(((uint8 *)word_3419C)[*arg_0++]);
        sub_2171A();
        arg_0 += 2;
        while (*arg_0 != -1) {
            var_351 = arg_0[-2];
            var_353 = arg_0[-1];
            var_352 = *arg_0++;
            var_354 = *arg_0++;
            sub_2189C();
        }
        sub_21704();
        arg_0++;
    }
}

// ==== seg000:0x613b ====
void sub_1613B(void) {
    int p;

    audio_jump_69();
    p = var_383;
loop:
    while (kbhit() == 0)
        ;
    if (_bios_keybrd(0) == 0x1900)
        goto loop;
    sub_1DA8D();
    var_383 = p;
}

// TODO: sub_16172 (seg000:6172-6345) - unimplemented
// Once implemented, try merging egame1g.c + egame2d.c (if register spill doesn't affect codegen)

