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


// TODO: sub_16346 (seg000:6346-660d) - unimplemented

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

// TODO: sub_167B4 (seg000:67b4-7593) - large unimplemented function
// TODO: sub_17594 (seg000:7594-7839) - unimplemented

// ==== seg000:0x783A ====
int sub_1783A(int arg_0, int arg_2)
{
    int p;

    p = *(int16 *)&stru_3B208[arg_0].field_10[6];
    *(int16 *)&stru_3B208[arg_0].field_10[0] = (word_3AFA8 == 1) ? 0 : (int16)0x8000;
    if (stru_3AA5E[arg_2].field_6 & 0x200) {
        *(int16 *)((char *)&stru_3B208[arg_0] - 4) = word_3AFA8 * 3 + stru_3AA5E[arg_2].field_0;
        *(int16 *)((char *)&stru_3B208[arg_0] - 2) = stru_3AA5E[arg_2].field_2 - word_3AFA8 * 12;
        stru_3B208[arg_0].field_0 = 0x8c;
        *(int16 *)&stru_3B208[arg_0].field_10[10] = 100;
        *(uint8 *)((char *)&stru_3B208[arg_0].field_10[1]) += 0xfc;
    } else {
        *(int16 *)((char *)&stru_3B208[arg_0] - 4) = stru_3AA5E[arg_2].field_0;
        *(int16 *)((char *)&stru_3B208[arg_0] - 2) = 0x1e * word_3AFA8 + stru_3AA5E[arg_2].field_2;
        stru_3B208[arg_0].field_0 = 0x0c;
        *(int16 *)&stru_3B208[arg_0].field_10[10] = 10;
    }
    stru_3B208[arg_0].field_2 = (long)(uint16)*(int16 *)((char *)&stru_3B208[arg_0] - 4) << 5;
    stru_3B208[arg_0].field_6 = (long)(uint16)*(int16 *)((char *)&stru_3B208[arg_0] - 2) << 5;
    *(int16 *)&stru_3B208[arg_0].field_10[2] = 0;
    *(int16 *)&stru_3B208[arg_0].field_10[4] = 0;
    *(uint16 *)&stru_3B208[arg_0].field_10[8] |= 0x403;
    *(int16 *)((char *)&stru_3B208[arg_0] - 6) = arg_2;
    *(int16 *)&stru_3B208[arg_0].field_10[12] = (int16)(((long)*(int16 *)&aFlogger[p * 32 + 12] << 11) * (long)word_330C4 / (long)*(int16 *)&aFlogger[p * 32 + 10]);
    *(int16 *)&stru_3B208[arg_0].field_10[16] = sub_19A4D(stru_3AA5E[arg_2].field_0, stru_3AA5E[arg_2].field_2);
    if (word_336FC == -1) {
        stru_3B208[arg_0].field_10[9] &= 0xfe;
    }
    placeString(arg_2);
    strcat((char *)strBuf, (char *)0x58bb);
    strcat((char *)strBuf, (char *)(*(int16 *)&stru_3B208[arg_0].field_10[6] * 32 + 0x2c8));
    strcat((char *)strBuf, (char *)aTakingOff);
    if (arg_0 < word_3C046 - 4) {
        tempStrcpy((char *)strBuf);
    }
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

// ==== seg000:0x86f8 ====
void sub_186F8(int param_1)
{
    int p;

    if (!(stru_3B208[param_1].field_10[8] & 0x20)) {
        *(int16 *)&aFlogger[*(int16 *)&stru_3B208[param_1].field_10[6] * 32 + 22] += 1;
        if (*(uint16 *)&stru_3B208[param_1].field_10[8] & 0x800) {
            word_3C044--;
        }
        if (param_1 == word_336FC) {
            word_336FC = -1;
        }
        stru_3B208[param_1].field_10[8] |= 0x20;
        word_336F6 = -1;
        word_3BEC2 = *(int16 *)((char *)&stru_3B208[param_1] - 4);
        word_3BED6 = *(int16 *)((char *)&stru_3B208[param_1] - 2);
        word_3BFA2 = stru_3B208[param_1].field_0;
        word_3B4DC = 0x80;
        p = 3;
        sub_11D10(p, (*(uint16 *)&stru_3B208[param_1].field_10[8] & 0x4000 ? 0x80 : 0) + *(int16 *)&stru_3B208[param_1].field_10[6]);
        if (*(int16 *)&stru_3B208[param_1].field_10[10] != 0) goto done;
        *(uint16 *)&stru_3B208[param_1].field_10[8] &= 0x1c1;
    done:
        ;
    }
    strcpy((char *)strBuf, (char *)(*(int16 *)&stru_3B208[param_1].field_10[6] * 32 + 0x2c8));
    makeSound(2, 2);
    if (word_3C45C == 1 && param_1 == word_336F2) {
        word_39604 = 1;
    }
}

// TODO: sub_187EA (seg000:87ea-89a9) - unimplemented

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

extern int sub_1D200(int);
void sub_18A44(void) {
    int p;
    if (!(planeFlags & 0x1000) && word_336EA != -1) {
        p = 0;
        goto check;
        do {
            word_33096 |= (1 << sub_1D200(8));
            word_3BF90++;
            p++;
    check:;
        } while (p <= word_330B8);
        sub_1957A(0x16);
        word_38FEA = 1;
        makeSound(0, 2);
    }
}

// ==== seg000:0x8aa6 ====

void sub_18AA6()
{
    int p;
    int a;
    int b;
    int c;

    if (abs(var_545) > 0x3000) return;
    if (word_33702 != 0) return;
    if (word_3BE3C != 0) return;

    b = missleSpec[missileSpecIndex].weaponIdx;
    p = *(int16 *)&missiles[b].field_A[2];

    if (missleSpec[missileSpecIndex].ammo == 0) {
        strcpy((char *)strBuf, missiles[b].field_0);
        strcat((char *)strBuf, (char *)a0);
        sub_1A204((char *)strBuf);
        goto end;
    }

    if (p == 0) return;
    if (p == -1) return;

    missleSpec[missileSpecIndex].ammo--;

    if (word_330C2 != 0) {
        sub_19E44(0);
        a = ((int16 *)aA)[missileSpecIndex];
        sub_19E5D(a - 1, 0xbe, a + 2, 0xc2);
        sub_1A183(missleSpec[missileSpecIndex].ammo, a, 0xbe, 0x0c);
        strcpy((char *)strBuf, missiles[b].field_0);
        strcat((char *)strBuf, (char *)0x5947);
        strcat((char *)strBuf, itoa(missleSpec[missileSpecIndex].ammo, (char *)unk_3C030, 0x0a));
        sub_1A204((char *)strBuf);
    }

    c = -1;
    a = 8;
    do {
        if (stru_335C4[a].field_E == 0) {
            c = a;
        }
        a++;
    } while (a < 12);

    if (c == -1) goto check_end;

    stru_335C4[c].field_0 = word_3BEC0;
    stru_335C4[c].field_2 = word_3BED0;
    stru_335C4[c].field_4 = var_547 - 0x14;
    stru_335C4[c].field_6 = (unsigned int)word_3A944 >> 11;
    c = c;
    stru_335C4[c].field_8 = var_542;
    stru_335C4[c].field_A = var_544;
    stru_335C4[c].field_C = var_545;

    stru_335C4[c].field_E = (int)(((long)sams[p].field_8 << (6 - (sams[p].field_C == 6 ? 3 : 2))) * (long)word_330C4 / (long)((sams[p].field_A >> 6) + 1)) + 6;

    c = c;
    if (stru_335C4[c].field_E <= 6) {
        stru_335C4[c].field_E = 999;
    }

    *(int16 *)&stru_335C4[c].field_10[0] = p;
    *(int16 *)&stru_335C4[c].field_10[2] = b;
    *(int16 *)&stru_335C4[c].field_10[4] = -1;

    if (p != 0x1e) {
        stru_335C4[c].field_A -= 0x1000;
    } else {
        *(int16 *)&stru_335C4[c].field_10[6] = sub_1C82D() - 0x400;
        word_3C020 = word_336F4;
    }

    if (word_336F4 >= 0 && sams[p].field_C == 6) {
        *(int16 *)&stru_335C4[c].field_10[4] = word_336F4;
    }

    if (word_336F4 >= 0 && sams[p].field_C == 5 && (stru_3AA5E[word_336F4].field_6 & 8)) {
        *(int16 *)&stru_335C4[c].field_10[4] = word_336F4;
    }

    if (p == 0x1d) {
        stru_335C4[c].field_A = (int16)0xc000;
        stru_335C4[c].field_6 = 1;
    }

    word_3A940 = c;
    strcpy((char *)strBuf, missiles[b].field_0);
    strcat((char *)strBuf, (char *)aFired);
    tempStrcpy((char *)strBuf);

    makeSound(sams[p].field_8 != 0 ? 0x12 : 0x18, 2);

    sub_11BC3(c, 1);

check_end:
    if (word_3C09E == 0x15) {
        sub_1957A(0x15);
    }
end:
    ;
}

// ==== seg000:0x8df4 ====
void sub_18DF4(int param_1, int param_2, int param_3) {
    *(char *)&var_315 = 0;
    sub_132BA((int32)param_1 << 5, -((int32)param_2 - 0x8000L) << 5, (int32)param_3);
}

