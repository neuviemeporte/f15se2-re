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

// ==== seg000:0x8e38 ====

int sub_18E38(void) {
    sub_19FAD(2, (char*)0x5950, 0);
}

// ==== seg000:0x8e50 ====
int sub_18E50(int arg_0) {
    int var_2, var_4, var_6, var_8, var_A, var_C, var_E, var_10, var_12, var_14, var_16, var_18, var_1A;
    char var_1C;
    byte_3C5A0 = gfx_getDisplayPage();
    // probably x,y
    var_16 = waypoints[waypointIndex].field_0 - word_3BEC0;
    var_1A = waypoints[waypointIndex].field_2 - word_3BED0;
    // 8e83
    word_3BE92 = sub_1D008(var_16, -var_1A);
    if (word_330C2 != 0) { // 8e96
        if (word_38FEA != 0) { // 8e9d
            word_38FEA = 0;
            if (!(keyValue & 0x80)) { // 8eaa
                sub_19E44(0xd);
                sub_19E5D(0, 0, 0x13f, 0x60);
                gfx_setDacAnimCount(0x3c);
            }
        } // 8ed2
        byte_37C2F = 1;
        if (keyValue == 0 && byte_37C24 == 0) { // 8eeb
            if (!commData->setupUseJoy) { // 8ef9
                sub_19E44(0);
                sub_19C0C(0x115, 0x53, 0x125, 0x53);
                sub_19C0C(0x125, 0x53, 0x125, 0x5f);
                // 8f3e
                sub_19C0C(0x125, 0x5f, 0x115, 0x5f);
                sub_19C0C(0x115, 0x5f, 0x115, 0x53);
                sub_19C0C(0x11d, 0x59, 0x11d, 0x59);
                // 8f74
                sub_19E44(0xf);
                var_14 = ((int16)(joyAxes[0] - 0x78) >> 4) + 0x11d;
                // 8fa1
                var_18 = ((int16)((joyAxes[1] * 3) - 0x168) >> 6) + 0x59;
                sub_19C0C(var_14 - 1, var_18, var_14 + 1, var_18);
                // 8fc8
                sub_19C0C(var_14, var_18 + 1, var_14, var_18 - 1);
            } // 8fce
            if (planeFlags & 0x200) { // 8fd6
                sub_19E44(0xf);
                sub_19C0C(0x9c, 0x59, 0xa4, 0x59);
                sub_19C0C(0xa0, 0x56, 0xa0, 0x5c);
            } // 900c
            sub_19E44(word_330BC != 0 ? 4 : 0);
            // 9041
            var_10 = sub_1CF64((((word_3C5A6 - word_3AA5A) * 2) / 5) + 0x1d, 0, 0x3d);
            if (var_10) sub_19C0C(0x48, 0x55 - var_10, 0x48, 0x55);
            // 9089
            sub_19C0C(0xf7,  0x38, 0xf7, sub_1CF64(-((word_3C8B6 >> 4) - 0x38), 0x14, 0x55));
            // 908f
            if ((planeFlags & 1) == 0 && (word_336E8 & 1) != 0 && gameData->unk4 != 0 && word_3C8B6 < 0) { // 90af
                var_2 = (((stru_3AA5E[word_3C16A].field_6 & 0x200 ? 0x100 : 0x80) / gameData->unk4) >> 4) + 0x38;
                sub_19E44(0xf);
                // 90f7
                sub_19C0C(0xf2, var_2 - 2, 0xf4, var_2);
                sub_19C0C(0xf2, var_2 + 2, 0xf4, var_2);
            } // 9115
            // stall warning display
            if (word_3AA5A < word_3C5A6 && word_3BEBE != word_380CE && word_336E8 & 1) { // 912e
                draw2Strings(aStallWarning, 0x84, 0x1e, 0xf);
            } // 9144
            if (word_3C45C == 0 || word_3C45C == 2) { // 9152
                sub_19E44(7);
                word_3C008 = (word_38FC4 >> 6) + 0x38;
                if (word_3C008 > 0xa && word_3C008 < 0x6f) { // 9173
                    sub_1A8C8(0x9a, word_3C008 - 4, 0x94, 0x15, 0x0b, 7, 0xf);
                }
            } // 9198
            if (word_3C45C == 1) { // 91a2
                var_1C = byte_37C24 + 4;
                var_14 = (word_3C6A4 >> var_1C) + 0x9f;
                var_18 = (word_3C6AC >> var_1C) + 0x38;
                // 91c3
                if (var_14 > 0xa && var_14 < 0x135 && var_18 > 8 && var_18 < 0x5b) { // 91da
                    sub_1A8C8(var_14 - 6, var_18 - 5, 0x91, 0x4, 0xd, 0xb, 0xe);
                } // 9202
                // 7 = air to air? Only Sidewinder and Amraam have it
                if (sams[missiles[missleSpec[missileSpecIndex].field_0].field_16].field_C == 7) { // 9223
                    sub_19E44((uint8)gfxModeUnset != 0 ? 0xf : 7);
                    // 9239
                    for (var_A = 0; var_A <= 0x100; var_A += 0x10) { // 924b
                        var_4 = var_A << 8;
                        var_8 = sub_1D178(var_4, 0x28) + 0x9f;
                        // 9278
                        var_C = -(sub_1D190(var_4, 0x23) - 0x38);
                        if (var_A != 0) sub_19C0C(var_8, var_C, var_E, var_12);
                        // 9294
                        var_E = var_8;
                        var_12 = var_C;
                    }
                }
            } // 929f
            sub_1A183(word_3AA5A, 0x50, 0x36, 0xf);
            if (word_380D0 <= 0x4e20) { // 92bd
                sub_1A183(word_380D0 < 0x64 ? word_380D0 : (word_380D0 / 5) * 5, 0xe4, 0x36, 0xf);
            } // 92ee
            if (word_3370A > 1) { // 92f5
                drawSomeStrings(aAccel, 0x96, 0x4, 0xf);
            } // 930b
            if (planeFlags & 0x1000) { // 9313
                drawSomeStrings(aTraining, 0xea, 0x10, 0xf);
            } // 9329
            if (word_330B6 != 0) { // 9330
                drawSomeStrings(aAutopilot, 0xec, 0x5a, 0xf);
            } // 9346
            var_6 = sub_1CF64((((word_3BE92 - word_380C8) >> 6) / 3) + 0x9f, 0x59, 0xe5);
            sub_19E44(0x0b);
            sub_19C0C(var_6 - 2, 0xf, var_6, 0x11);
            // 93a0
            sub_19C0C(var_6, 0x11, var_6 + 2, 0xf);
            sub_19C0C(var_6 - 2, 0xf, var_6 + 2, 0xf);
            goto somewhere;
        } // 93c4
somewhere:
        sub_1A25C(byte_3C5A0);
    } // 93cf
    if (word_383F2 != 0 && ((keyValue == 0 && byte_37C24 == 0) || (word_3370E != 0))) { // 93eb
        draw2Strings(tempString, -(((int16)strlen(tempString) >> 1) - 0x28) * 4, 0x18, 0xf);
        word_383F2--;
        // 9417
        if (word_336EA == 1) { // 941e
            draw2Strings(aPressAnyKeyToP, 0x78, 1, word_330BC != 0 ? 0xe : 0);
        }
    } // 943f
    if (word_383F4 != 0 && keyValue == 0 && byte_37C24 == 0) { // 9454
        draw2Strings(string_3C04A, -(((int16)strlen(string_3C04A) >> 1) - 0x28) * 4, 0x5a, 0xf);
        word_383F4--;
    } // 9480
} // 9485

// ==== seg000:0x94d0 routine_189 ====
void sub_194D0(int arg_0) {
    int p, a, b, c, d, e, f, g, h, i;
    if (word_330C2 == 0) {
        return;
    }
    switch (arg_0) {
    case 0x13:
        strcpy(strBuf, aTrackcam);
        switch (*(int16 *)((char *)&word_3C6AC + 0x206)) {
        case 0:
            strcat(strBuf, aAhead);
            break;
        case (int16)0x8000:
            strcat(strBuf, aRear);
            break;
        case 0x4000:
            strcat(strBuf, aRight);
            break;
        case (int16)0xC000:
            strcat(strBuf, aLeft);
            break;
        }
        sub_19FAD(2, strBuf, 3);
        break;
    }
    word_3C09E = arg_0;
}

// ==== seg000:0x957a ====
void sub_1957A(int arg_0) {
    int p;
    if (arg_0 == word_3C09E) {
        sub_194D0(arg_0);
    }
}

// ==== seg000:0x9595 ====
void sub_19595(void) {
    word_3C09A = 0;
    word_3C018 = 0x18;
    word_3C45E = 0x60;
    word_3C01A = 0x70;
    word_3C5A2 = 0xa8;
    word_38FC8 = 0x48;
    word_38FCC = 0x38;
    zoomIn();
}

// ==== seg000:0x9875 ====
void zoomIn(void) {
    if (keyValue & 0x80) {
        word_336FE--;
    } else {
        if (word_3C09A == 0 && byte_383E5 < 9) {
            byte_383E5++;
            sub_195C9(word_3BEC0, word_3BED0);
        }
        if (word_3C09A == 1) {
            var_588++;
        }
    }
}

// ==== seg000:0x98b1 ====
void zoomOut(void) {
    if (keyValue & 0x80) {
        word_336FE++;
    } else {
        if (word_3C09A == 0 && byte_383E5 > 2) {
            byte_383E5--;
            sub_195C9(word_3BEC0, word_3BED0);
        }
        if (word_3C09A == 1 && var_588 != 0) {
            var_588--;
        }
    }
}

// ==== seg000:0x98fa ====
int sub_198FA(int arg_0) {
    return ((arg_0 - var_589) >> (10 - (int)byte_383E5)) + 0x3C;
}

// ==== seg000:0x9915 ====
int sub_19915(int arg_0) {
    return (((arg_0 - var_590) >> (10 - (int)byte_383E5)) * 3 >> 1 >> 1) + 0x8C;
}

// ==== seg000:0x993a ====
int sub_1993A(int arg_0, int arg_2, int arg_4, int arg_6) {
    int p;
    int a;
    if (word_3C09A != 0 || word_330C2 == 0) {
        return 0;
    }
    p = sub_198FA(arg_0);
    a = sub_19915(arg_2);
    if (arg_4 != -1 && p >= word_3C018 && p < word_3C45E - 1 && a >= word_3C01A && a < word_3C5A2 - 1) {
        routine_328(p, a, arg_4);
        if (arg_6 != 0) {
            routine_328(p + 1, a, arg_4);
            routine_328(p, a + 1, arg_4);
            routine_328(p + 1, a + 1, arg_4);
        }
        return 0;
    } else {
        return 1;
    }
}

// ==== seg000:0x99ec ====
int sub_199EC(int arg_0, int arg_2, int *arg_4, int *arg_6) {
    if (word_330C2 == 0) {
        return 0;
    }
    *arg_4 = sub_198FA(arg_0);
    *arg_6 = sub_19915(arg_2);
    if (word_3C018 < *arg_4 && word_3C45E - 1 > *arg_4 &&
        word_3C01A < *arg_6 && word_3C5A2 - 1 > *arg_6) {
        return 1;
    } else {
        return 0;
    }
}

// ==== seg000:0x9a4d ====
extern int sub_198FA(int);
extern int sub_19915(int);

int sub_19A4D(int arg_0, int arg_1) {
    int p;
    int a;
    int b;
    if (word_3C09A != 0) return 0;
    p = sub_198FA(arg_0);
    a = sub_19915(arg_1);
    p = sub_1CF64(p, word_3C018, word_3C45E);
    a = sub_1CF64(a, word_3C01A, word_3C5A2);
    b = -1;
    if (p > word_3C018 && p < word_3C45E && a > word_3C01A && a < word_3C5A2) {
        b = sub_1A1B1(p, a);
    }
    return b;
}

// ==== seg000:0x9adb ====
void sub_19ADB(int param_1, int param_2, int param_3, int param_4, int param_5, int param_6, int param_7)
{
    int p;
    int a;
    int b;
    int c;
    int d;
    int e;
    int f;

    if (param_7 < param_6) {
        param_6 += 0x100;
    }
    sub_19E44(param_4);
    for (b = param_6; b <= param_7; b += 0x10) {
        p = *(unsigned char *)&b << 8;
        a = sub_1D178(p, param_3) + param_1;
        d = param_2 - sub_1D190(p, param_3);
        if ((unsigned)a > 0xC000u) {
            a = 0;
        }
        if ((unsigned)d > 0xC000u) {
            d = 0;
        }
        if (b != param_6 && param_5 != 0) {
            sub_19B98(a, d, c, f);
        } else {
            sub_1993A(a, d, param_4, 0);
        }
        c = a;
        f = d;
    }
}

// ==== seg000:0x9b98 ====
void sub_19B98(int arg_0, int arg_1, int arg_2, int arg_3) {
    sub_19C84(sub_198FA(arg_0), sub_19915(arg_1), sub_198FA(arg_2), sub_19915(arg_3), word_3C018, word_3C45E, word_3C01A, word_3C5A2, 1);
}

// ==== seg000:0x9be1 ====
int sub_19BE1(int arg_0, int arg_2, int arg_4, int arg_6) {
    sub_19C84(arg_0, arg_2, arg_4, arg_6, 0, 0x13f, 0, 199, 1);
}

// ==== seg000:0x9c0c ====
int sub_19C0C(int arg_0, int arg_2, int arg_4, int arg_6) {
    int p, a;

    a = var_564[10] - var_564[9] + 1;
    p = var_564[8] - var_564[7] + 1;
    gfx_setBlitOffset(gfx_calcRowAddr(var_564[9], var_564[7]));
    var_349 = a - 1;
    var_350 = p - 1;
    gfx_setColor(var_564[2]);
    var_351 = arg_0;
    var_353 = arg_2;
    var_352 = arg_4;
    var_354 = arg_6;
    sub_2152A();
    gfx_resetBlitOffset2();
}

// ==== seg000:0x9c84 ====
void sub_19C84(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8, int arg_a, int arg_c, int arg_e, int arg_10) {
    int p, a;

    a = arg_a - arg_8 + 1;
    p = arg_e - arg_c + 1;
    gfx_setBlitOffset(gfx_calcRowAddr(arg_8, arg_c));
    var_349 = a - 1;
    var_350 = p - 1;
    gfx_setColor(var_564[2]);
    var_351 = arg_0 - arg_8;
    var_353 = arg_2 - arg_c;
    var_352 = arg_4 - arg_8;
    var_354 = arg_6 - arg_c;
    sub_2152A();
    gfx_resetBlitOffset2();
    if (arg_10 != 0) {
        byte_3C5A0 = gfx_getDisplayPage();
        gfx_setPageN(byte_3C5A0 == 0);
        gfx_setColor(var_564[2]);
        var_351 = arg_0 - arg_8;
        var_353 = arg_2 - arg_c;
        var_352 = arg_4 - arg_8;
        var_354 = arg_6 - arg_c;
        sub_2152A();
        gfx_setPageN(byte_3C5A0 != 0);
        gfx_resetBlitOffset2();
    }
    var_349 = 0x13f;
    var_350 = 0xc7;
    gfx_setBlitOffset(0);
}

// ==== seg000:0x9d86 ====
int sub_19D86(int arg_0, int arg_1, int arg_2, int arg_3) {
    sub_19C84(arg_0, arg_1, arg_2, arg_3, 0, 0x13f, 0, 0xc7, 0);
}

// ==== seg000:0x9db0 ====
void sub_19DB0(int arg_0, int arg_2, int arg_4, int arg_6) {
    if (var_456 != 0) {
        if (gameData->unk4 < 2) {
            sub_19C0C(arg_0, arg_2, arg_4, arg_6);
        } else {
            sub_19C84(arg_0, arg_2, arg_4, arg_6, 0x68, 0xd8, 0x3e, 0x60, 0);
        }
    } else if (word_330B8 != 0) {
        sub_19C84(arg_0, arg_2, arg_4, arg_6, 0x30, 0x10f, 0x0f, 0x60, 0);
    } else {
        sub_19C0C(arg_0, arg_2, arg_4, arg_6);
    }
}

// ==== seg000:0x9e44 ====
void sub_19E44(int arg_0) {
    off_38334[2] = arg_0;
    off_3834C[2] = arg_0;
}

// ==== seg000:0x9e5d ====
void sub_19E5D(int arg_0, int arg_2, int arg_4, int arg_6) {
    sub_21444(off_38334, arg_0, arg_2, arg_4, arg_6);
    sub_21444(off_3834C, arg_0, arg_2, arg_4, arg_6);
}

// ==== seg000:0x9e94 ====
int sub_19E94(int arg_0, int arg_2, int arg_4) {
    sub_19E44(arg_4);
    sub_19BE1(arg_0, arg_2, arg_0, arg_2);
}

// ==== seg000:0x9ea0 ====
void routine_328(int arg_0, int arg_2, int arg_4) {
    sub_19E44(arg_4);
    sub_19BE1(arg_0, arg_2, arg_0, arg_2);
}

// ==== seg000:0x9eb6 ====
int sub_19EB6(int arg_0, int arg_2) {
    if (word_330C2 == 0) goto done;
    if (*(&word_38202 + arg_0 * 5 + 7) != arg_2) {
        gfx_switchColor((int *)var_564, *(&word_38202 + arg_0 * 5 + 3), *(&word_38202 + arg_0 * 5 + 4), *(&word_38202 + arg_0 * 5 + 5), *(&word_38202 + arg_0 * 5 + 6), *(&word_38202 + arg_0 * 5 + 7), arg_2);
        gfx_switchColor((int *)var_565, *(&word_38202 + arg_0 * 5 + 3), *(&word_38202 + arg_0 * 5 + 4), *(&word_38202 + arg_0 * 5 + 5), *(&word_38202 + arg_0 * 5 + 6), *(&word_38202 + arg_0 * 5 + 7), arg_2);
        *(&word_38202 + arg_0 * 5 + 7) = arg_2;
    }
done:
    ;
}

// ==== seg000:0x9fad ====
int sub_19FAD(int arg_0, char* arg_1, int arg_2) {
    sub_19FCC(arg_0, arg_2);
    sub_1A030(arg_0, (char *)arg_1);
}

// ==== seg000:0x9fcc ====
void sub_19FCC(int arg_0, int arg_1) {
    sub_19E44(arg_1);
    if (arg_0 == 1) {
        sub_19E5D(0x18, 0x70, 0x60, 0xa8);
    }
    if (arg_0 == 2) {
        sub_19E5D(0x78, 0x68, 0xc7, 0xaf);
    }
    if (arg_0 == 3) {
        sub_19E5D(0xe8, 0x80, 0x130, 0xb8);
    }
}

// ==== seg000:0xa0cb ====
int drawSomeStrings(const char *arg_0, int arg_2, int arg_4, int arg_6) {
    drawStringCentered(var_564, arg_0, arg_2, arg_4, arg_6);
    drawStringCentered(var_565, arg_0, arg_2, arg_4, arg_6);
}

// ==== seg000:0xa0fe ====
void draw2Strings(const char *arg_0, int arg_1, int arg_2, int arg_3) {
    if (byte_3C5A0 == 0) {
        drawStringCentered(var_564, arg_0, arg_1, arg_2, arg_3);
    } else {
        drawStringCentered(var_565, arg_0, arg_1, arg_2, arg_3);
    }
}

// ==== seg000:0xa13a ====
int drawStringCentered(int16* arg_0, const char *arg_2, int arg_4, int arg_6, int arg_8) {
    arg_0[6] = 0;
    arg_0[4] = arg_4;
    arg_0[5] = arg_6;
    arg_0[2] = arg_8;
    gfx_drawString(arg_0, strupr((char*)arg_2), strlen(arg_2));
}


// ==== seg000:0xa183 ====
void sub_1A183(int arg_0, int arg_1, int arg_2, int arg_3) {
    char buf[20];
    itoa(arg_0, buf, 10);
    drawSomeStrings(buf, arg_1, arg_2, arg_3);
}

// ==== seg000:0xa1b1 ====
int sub_1A1B1(int arg_0, int arg_1) {
    byte_3BF93[0] = 0x0D;
    *(int *)unk_3BF96 = arg_0;
    *(int *)unk_3BF98 = arg_1;
    unk_3BF95 = 0;
    int86(0x10, &regs, &regs);
    return regs.h.al;
}

// ==== seg000:0xa1e4 ====
void tempStrcpy(char *arg_0) {
    strcpy(tempString, arg_0);
    var_591 = word_330C4 * 3;
}

// ==== seg000:0xa204 ====
void sub_1A204(char *arg_0) {
    strcpy(string_3C04A, arg_0);
    var_592 = word_330C4 * 3;
}

// ==== seg000:0xa224 ====
int routine_260(int param_1, int param_2) {
    return (int)(char)var_83[param_1 * 13 + ((int)(char)byte_3BFA4[stru_3AA5E[param_2].field_C & 0x7f] & 0xf)];
}

