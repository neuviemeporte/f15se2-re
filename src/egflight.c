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


// ==== seg000:0x6346 routine_323 ====
void fireGroundThreat(int param_1)
{
    int p[11];
    unsigned int a[4];
    int j;
    int k;
    int l;
    int m;
    int n;
    int o;

    k = stru_3AA5E[param_1].field_4;
    o = computeThreatRangeBearing(stru_3AA5E[param_1].mapX, stru_3AA5E[param_1].mapY, 0, k, p, (int *)a);
    word_336FA = 0;
    if (o > 0) {
        j = o;
        if (j > 99) {
            j = 99;
        }
        word_336FA = 4;
        if (o + word_336E4 > 50) {
            word_336FA = 0x0c;
        }
        if (o + word_336E4 > 100) {
            word_336FA = 0x0e;
        }
        word_3BE7E = o;
        word_336F8 = word_330C4;
        word_3BE96 = param_1;
        word_3C6AA = *(int16 *)&aNone[k * 14 + 12] & 1;
        if (*(int16 *)&stru_3AA5E[param_1].field_8 != 0) {
            word_3BF3C = (p[0] >> 8) - 0x20;
            word_3BF3E = (p[0] >> 8) + 0x20;
        }
        word_38F72 = word_336FA;
        if (!(*(uint8 *)&stru_3AA5E[param_1].flags & 4)) {
            *(uint8 *)&stru_3AA5E[param_1].flags |= 4;
        }
    }
    if (o > a[0]) {
        *(int16 *)&stru_3AA5E[param_1].field_8 += (word_330BA + word_330B8) * 32 + 32;
        if (*(int16 *)&stru_3AA5E[param_1].field_8 > 255) {
            *(int16 *)&stru_3AA5E[param_1].field_8 = 255;
        }
        if (!(stru_3AA5E[param_1].flags & 0x100) && word_333DA == 0 &&
            *(int16 *)&stru_3AA5E[param_1].field_8 > 0x7f) {
            sub_166BE();
        }
        if (word_3A946 <= word_330B8) {
            if (*(int16 *)&stru_3AA5E[param_1].field_8 > 0xc0) {
                if (k != 0x15) {
                    if (word_38FEE > 0x500) {
                        if ((unsigned)-(word_330B8 * 3 - 20) < a[0]) {
                            word_3C09C++;
                            if (*(int16 *)&stru_3AA5E[param_1].field_8 >= 0xfa) {
                                l = (word_330B8 != 0) ? param_1 % word_330B8 : 0;
                                if (stru_335C4[l].ttl == 0) {
                                    if (sams[k].field_8 > (unsigned)a[0]) {
                                        k = k;
                                        stru_335C4[l].mapX = stru_3AA5E[param_1].mapX + 8;
                                        l = l;
                                        param_1 = param_1;
                                        stru_335C4[l].mapY = stru_3AA5E[param_1].mapY;
                                        stru_335C4[l].alt = 0;
                                        stru_335C4[l].field_6 = 1;
                                        stru_335C4[l].worldX = p[0];
                                        stru_335C4[l].worldY = 0x4000;
                                        stru_335C4[l].ttl = (int)((((long)sams[k].field_8 << 3) * (long)word_330C4) / (long)(sams[k].field_A >> 6));
                                        *(int16 *)&stru_335C4[l].state[0] = k;
                                        *(int16 *)&stru_335C4[l].state[6] = param_1;

                                        placeString(param_1);
                                        strcat((char *)strBuf, (char *)aFiring);
                                        strcat((char *)strBuf, (char *)&sams[k]);
                                        tempStrcpy((char *)strBuf);
                                        makeSound(6, 2);
                                        scheduleEventCheck(param_1 + 0x40, 2);
                                        commData->restartFlag++;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        *(uint8 *)&stru_3AA5E[param_1].flags |= 0x10;
    } else {
        *(uint8 *)&stru_3AA5E[param_1].flags &= 0xEF;
        *(int16 *)&stru_3AA5E[param_1].field_8 -= 0x10;
        if (*(int16 *)&stru_3AA5E[param_1].field_8 < 0) {
            *(int16 *)&stru_3AA5E[param_1].field_8 = 0;
        }
    }
}

// ==== seg000:0x660e routine_324 ====
int computeThreatRangeBearing(int threatX, int threatY, int arg_4, int threatType, int *outBearing, int *arg_a) {
    int p;
    int a;
    int b;
    int c;
    int d;
    int e;
    unsigned f;

    if (threatType == 0 || threatType == -1) {
        return 0;
    }
    d = word_3BEC0 - threatX;
    e = word_3BED0 - threatY;
    c = (unsigned)rangeApprox(d, e) >> 6;
    b = computeBearing(d, -e);
    f = (f = (*(int16 *)&aNone[threatType * 14 + 10] + word_330B8 * 2 + 3) * *(int16 *)&aNone[threatType * 14 + 8] / 16) * (((unsigned)var_547 >> 6) + 0x40) >> 7;
    *outBearing = b;
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
            *(int *)&stru_3AA5E[p].field_8 = clampRange(*(int *)&stru_3AA5E[p].field_8, ((word_330B8 + word_330BA) << 4) - 16, 0xFF);
        }
    }
}

// ==== seg000:0x6742 ====
int computeThreatScore(void) {
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

// ==== seg000:0x67b4 ====
#define ENT_FLAGS(v) (*(uint16 *)&stru_3B208[(v)].field_10[8])
void updateObjects(void)
{
    int pp, q, r, s, d, u, f, g, x, i, j, k, ak, al, am, an, p, a, b, c, t, e, v, w, h, y, z, aj, l, m, n, o;

    if ((word_336E8 & 1) == 0 && word_336F6 == -1) {
        *(int16 *)((char *)stru_33402 + ((word_336E8 >> 1) & 7) * 8) = 0;
    }

    *(int16 *)((char *)&word_3C5AC + (((word_336E8 >> 2) & 3) + word_3AFA4) * 12) = 0;

    word_3A946 = var_668;
    var_668 = 0;
    h = 0;
    goto loop_test;

do_mode3:
    w = 3;
    if ((ENT_FLAGS(h) & 0x100) != 0 && word_336FC != -1) {
        k = sub_1D178((h & 7) * 0x800 + *(int16 *)&stru_3B208[word_336FC].field_10[0] - 0x1800,
                      *(int16 *)&stru_3B208[word_336FC].field_10[10])
            + *(int16 *)((char *)&stru_3B208[word_336FC] - 4);

        m = *(int16 *)((char *)&stru_3B208[word_336FC] - 2) -
            sub_1D190((h & 7) * 0x800 + *(int16 *)&stru_3B208[word_336FC].field_10[0] - 0x1800,
                      *(int16 *)&stru_3B208[word_336FC].field_10[10]);

        n = stru_3B208[word_336FC].field_0 + (h & 7) * 0x40;
        goto got_target_alt;
    }

    if (((uint8)h * 8 + (uint8)word_38FE0) & 0xbf) goto after_retarget;
    if (*(uint8 *)&stru_3B208[h].field_10[8] & 0x40) goto after_retarget;

    f = 0x7fff;
    pp = sub_1D008(*(int16 *)((char *)&stru_3B208[h] - 2) - word_3BED0,
                   word_3BEC0 - *(int16 *)((char *)&stru_3B208[h] - 4));
    for (y = 0; y < 8; y++) {
        s = sub_1D200(word_3BED2) + 1;
        if (stru_3AA5E[s].field_6 & 0x400) continue;
        q = sub_1D008(*(int16 *)((char *)&stru_3B208[h] - 2) - stru_3AA5E[s].field_2,
                      stru_3AA5E[s].field_0 - *(int16 *)((char *)&stru_3B208[h] - 4));
        if (abs(pp - q) < f) {
            f = abs(pp - q);
            *(int16 *)((char *)&stru_3B208[h] - 6) = s;
            if ((int)f <= -(word_330B8 * 0x1000 - 0x4000)) break;
        }
    }
    b = sub_1CFA6(word_3BEC0 - *(int16 *)((char *)&stru_3B208[h] - 4),
                  word_3BED0 - *(int16 *)((char *)&stru_3B208[h] - 2));
    if ((unsigned)b >> 6 > 0x15e && h != 0) {
        ENT_FLAGS(h) &= 0x1c1;
        *(int16 *)&stru_3B208[h].field_10[12] = 0;
    }

after_retarget:
    s = *(int16 *)((char *)&stru_3B208[h] - 6);
    k = stru_3AA5E[s].field_0;
    m = stru_3AA5E[s].field_2;
    n = sub_1CF64(var_547 + 1000, 5000, 20000);
    goto got_target_alt;

do_returning:
    s = *(int16 *)((char *)&stru_3B208[h] - 6);
    k = stru_3AA5E[s].field_0;
    if (ENT_FLAGS(h) & 0x200) {
        n = *(int16 *)((char *)&stru_3B208[h] - 4) - k;
        m = stru_3AA5E[s].field_2;
        k = k - n * 2;
        if ((stru_3AA5E[s].field_6 + abs(n)) & 0x200) {
            n = 0x8c;
        } else {
            n = 0x0c;
        }
    } else {
        m = stru_3AA5E[s].field_2 + word_3AFA8 * 0x500;
        n = sub_1CFA6(*(int16 *)((char *)&stru_3B208[h] - 4) - k,
                      *(int16 *)((char *)&stru_3B208[h] - 2) - m) + 2000;
    }
    w = 2;

got_target:
    if (w == 3 && (*(uint8 *)&stru_3B208[h].field_10[8] & 8)) {
        k = word_3BEC0;
        m = word_3BED0;
        n = stru_3B208[h].field_0;
    }
    x = k - *(int16 *)((char *)&stru_3B208[h] - 4);
    z = m - *(int16 *)((char *)&stru_3B208[h] - 2);
    b = sub_1D008(x, -z);
    e = sub_1CFA6(x, z);
    q = sub_1D008((n - stru_3B208[h].field_0) >> 5, e);
    p = sub_1CF64(q, -0x2000, 0x1000);
    if (w != 1 || (unsigned)e >= 0x600) goto not_close;

    var_668++;
    if ((unsigned)e >= 0x400) goto after_missile_table;
    if (word_336E8 & 3) goto after_missile_table;
    if (abs(*(int16 *)&stru_3B208[h].field_10[0] - b) >= 0x800) goto after_missile_table;
    if (abs(*(int16 *)&stru_3B208[h].field_10[2] - p) >= 0x800) goto after_missile_table;

    g = ((word_336E8 >> 2) & 3) + word_3AFA4;
    v = 0x138 / word_330C4;
    *(int16 *)((char *)&word_3C5B6 + g * 12) = sub_1D178(-*(int16 *)&stru_3B208[h].field_10[2], v) << 5;
    v = sub_1D190(*(int16 *)&stru_3B208[h].field_10[2], v);
    *(int16 *)((char *)&word_3C5B2 + g * 12) = sub_1D178(*(int16 *)&stru_3B208[h].field_10[0], v);
    *(int16 *)((char *)&word_3C5B4 + g * 12) = -sub_1D190(*(int16 *)&stru_3B208[h].field_10[0], v);
    *(int16 *)((char *)&word_3C5AC + g * 12) = *(int16 *)((char *)&stru_3B208[h] - 4);
    *(int16 *)((char *)&word_3C5AE + g * 12) = *(int16 *)((char *)&stru_3B208[h] - 2);
    *(int16 *)((char *)&word_3C5B0 + g * 12) = stru_3B208[h].field_0;

after_missile_table:
    a = sub_1CF64((h & 3) + word_330B8, 0, 2);
    if (h == 0) a = 1;
    d = *(int16 *)&stru_3B208[h].field_10[0];
    if (abs(*(int16 *)&stru_3B208[h].field_10[4]) < 0x4000) {
        d += *(int16 *)&stru_3B208[h].field_10[4] >> 2;
    }
    r = (int)(b - d) >> 13 & 7;
    d = var_542;
    if (abs(var_545) < 0x4000) {
        d = var_542 + (var_545 >> 1);
    }
    c = ((*(int16 *)&stru_3B208[h].field_10[0] - d) >> 13) + 4 & 7;
    ak = *(int16 *)((char *)&word_33442 + 2 + a * 128 + r * 16 + c * 2);
    l = (ak & 0xf) << 12;
    if (ak == 0x100) {
        p = 0x6000;
        l = ((word_336E8 >> 8) & 8) * 0x1000 - 0x4000;
    }
    if (*(int16 *)((char *)&word_33442 + 2 + a * 128 + r * 16 + c * 2) == 0x200) {
        p = (int16)0xa000;
        l = (((word_336E8 >> 8) & 8) - 4) * -0x1000;
    }
    if (p == (int16)0xa000) {
        if (-(*(int16 *)&stru_3B208[h].field_10[2] / 8 - 3000) > stru_3B208[h].field_0) {
            p = *(int16 *)&stru_3B208[h].field_10[2] + 0x1000;
        }
    }
    if (abs(*(int16 *)&stru_3B208[h].field_10[4]) > 0x4000) {
        l = 0;
        p = 0;
    }
    goto after_accel;

not_close:
    l = sub_1CF64(b - *(int16 *)&stru_3B208[h].field_10[0], -0x3000, 0x3000) << 1;
    if (w == 1 && word_330B8 + 1 <= word_3A946) {
        l = 0x3000;
    }

after_accel:
    if (w == 1 && (stru_3AA5E[word_3C16A].field_6 & 0x400) && word_38FEE < 0x780) {
        l = 0x3000;
    }

    s = *(int16 *)(aFlogger + var_667 * 32 + 14);
    l = sub_1CF64(l, -s * 0x1000, s * 0x1000);
    l = sub_1CF64(l - *(int16 *)&stru_3B208[h].field_10[4],
                  -s * 256, s * 256);

    if (ENT_FLAGS(h) & 0x400) {
        if (*(int16 *)&stru_3B208[h].field_10[10] < 0x96) {
            *(int16 *)&stru_3B208[h].field_10[2] = 0;
        } else {
            stru_3B208[h].field_10[3] += 1;
        }
        l = 0;
        if (*(int16 *)&stru_3B208[h].field_10[10] < *(int16 *)(aFlogger + var_667 * 32 + 10)) {
            *(int16 *)&stru_3B208[h].field_10[10] += 0x3c / word_330C4;
        } else if (stru_3B208[h].field_0 > 300) {
            stru_3B208[h].field_10[9] &= 0xfb;
        }
    }

    if (*(uint8 *)&stru_3B208[h].field_10[8] & 0x30) {
        l = 0x400;
    }

    if (((uint8)h & 3) == (word_336E8 & 3)) {
        sub_18DF4(*(int16 *)((char *)&stru_3B208[h] - 4),
                  *(int16 *)((char *)&stru_3B208[h] - 2),
                  stru_3B208[h].field_0);
        if (var_315 != 0) {
            stru_3B208[h].field_10[9] |= 0x20;
        } else {
            stru_3B208[h].field_10[9] &= 0xdf;
        }
    }

    if (ENT_FLAGS(h) & 0x2000) {
        p = 0x3000;
    }

    if (word_38FE0 < 10) {
        l >>= 2;
    }

    *(int16 *)&stru_3B208[h].field_10[4] += (l * (word_330B8 + 2)) / word_330C4;
    *(int16 *)&stru_3B208[h].field_10[0] += (*(int16 *)&stru_3B208[h].field_10[4] >> 3) / word_330C4;

    j = p - *(int16 *)&stru_3B208[h].field_10[2];
    if (*(uint8 *)&stru_3B208[h].field_10[8] & 0x20) {
        j = -0x200;
        if ((word_336E8 & 3) == 0) {
            b = (word_336E8 >> 1) & 7;
            *(int16 *)((char *)stru_33402 + b * 8) = *(int16 *)((char *)&stru_3B208[h] - 4);
            *(int16 *)((char *)stru_33402 + b * 8 + 2) = *(int16 *)((char *)&stru_3B208[h] - 2);
            *(int16 *)((char *)stru_33402 + b * 8 + 4) = stru_3B208[h].field_0;
            *(int16 *)((char *)stru_33402 + b * 8 + 6) = sub_1D200(0x20) << 11;
            word_33442 = b;
        }
    }

    if (*(int16 *)&stru_3B208[h].field_10[2] < 0 &&
        -(sub_1D178(*(int16 *)&stru_3B208[h].field_10[2], 2000) - 200) > stru_3B208[h].field_0 &&
        (ENT_FLAGS(h) & 0x220) == 0) {
        j = 0x400;
    }

    j = sub_1CF64(j, -0x400, 0x400);
    *(int16 *)&stru_3B208[h].field_10[2] += (j << 2) / word_330C4;
    if (abs(*(int16 *)&stru_3B208[h].field_10[2]) > 0x4000) {
        *(int8 *)((char *)&stru_3B208[h].field_10[0] + 1) += (char)0x80;
        *(int8 *)((char *)&stru_3B208[h].field_10[4] + 1) += (char)0x80;
        *(int16 *)&stru_3B208[h].field_10[2] = (int16)0x8000 - *(int16 *)&stru_3B208[h].field_10[2];
    }

    *(uint8 *)&stru_3B208[h].field_10[8] &= 0xef;

    u = (unsigned int)(-(*(int16 *)&stru_3B208[h].field_10[2] / 2 + (int16)0x8000));
    /* u = 0x8000 - pitch/2 (unsigned) */
    /* multiply u * fuel, shift right 14 */
    u = (int)((unsigned long)(unsigned)u * (long)*(int16 *)&stru_3B208[h].field_10[10] >> 14);

    i = sub_1D178(*(int16 *)&stru_3B208[h].field_10[4], u);
    i = abs(i);
    u = (int)((unsigned int)(u - (unsigned)i / 2) * 4) / word_330C4;
    u >>= 2;

    i = sub_1D190(*(int16 *)&stru_3B208[h].field_10[2], u);

    q = sub_1D178(*(int16 *)&stru_3B208[h].field_10[0], i);
    stru_3B208[h].field_2 += (long)q;

    q = sub_1D190(*(int16 *)&stru_3B208[h].field_10[0], i);
    stru_3B208[h].field_6 -= (long)q;

    stru_3B208[h].field_0 += sub_1D178(*(int16 *)&stru_3B208[h].field_10[2], u);

    *(int16 *)((char *)&stru_3B208[h] - 4) = (int16)(stru_3B208[h].field_2 >> 5);
    *(int16 *)((char *)&stru_3B208[h] - 2) = (int16)(stru_3B208[h].field_6 >> 5);

    if (stru_3B208[h].field_0 > 30000) {
        *(int16 *)&stru_3B208[h].field_10[2] = 0;
    }

    if (stru_3B208[h].field_0 < 0) {
        ENT_FLAGS(h) &= (h == 0) ? 0 : 0x1c1;
        word_3BEBC = *(int16 *)((char *)&stru_3B208[h] - 4);
        word_3BEC8 = *(int16 *)((char *)&stru_3B208[h] - 2);
        word_3BECE = stru_3B208[h].field_0;
        word_39606 = -8;
        if (h == word_336F2) {
            word_336F2 = -1;
        }
    }

    if ((unsigned)e < 0x10 && w == 2) {
        if (ENT_FLAGS(h) & 0x200) {
            stru_3B208[h].field_10[9] |= 0x10;
        } else {
            stru_3B208[h].field_10[9] |= 0x02;
        }
    }

    if (ENT_FLAGS(h) & 0x1000) {
        *(int16 *)&stru_3B208[h].field_10[2] = 0;
        *(int16 *)&stru_3B208[h].field_10[4] = 0;
        if (word_3AFA8 != 1) {
            *(int16 *)&stru_3B208[h].field_10[0] = (int16)0x8000;
        } else {
            *(int16 *)&stru_3B208[h].field_10[0] = 0;
        }
        if (stru_3AA5E[word_3C16A].field_6 & 0x200) {
            stru_3B208[h].field_0 = 0x8c;
        } else {
            stru_3B208[h].field_0 = 0x0c;
        }
        if (*(int16 *)&stru_3B208[h].field_10[10] > 0) {
            *(int16 *)&stru_3B208[h].field_10[10] -= 0x78 / word_330C4;
        } else {
            ENT_FLAGS(h) &= 0x1c1;
            if (h == 0 && word_3B144 >= 5) {
                ENT_FLAGS(h) = 0;
            }
        }
        if (h >= word_3C046 - 4 && *(int16 *)&stru_3B208[h].field_10[10] < 100) {
            ENT_FLAGS(h) &= 0x1c1;
            ENT_FLAGS(h) |= 0x406;
        }
    }

    if (--*(int16 *)&stru_3B208[h].field_10[12] == 0) {
        *(uint8 *)&stru_3B208[h].field_10[8] |= 4;
        f = 0x7fff;
        for (y = 3; y < word_3C69E; y++) {
            if ((stru_3AA5E[y].field_6 & 0x101) == 1) {
                ak = sub_1CFA6(*(int16 *)((char *)&stru_3B208[h] - 4) - stru_3AA5E[y].field_0,
                              *(int16 *)((char *)&stru_3B208[h] - 2) - stru_3AA5E[y].field_2);
                if (ak < f) {
                    *(int16 *)((char *)&stru_3B208[h] - 6) = y;
                    f = ak;
                }
            }
        }
    }

    *(int16 *)&stru_3B208[h].field_10[16] = sub_19A4D(
        *(int16 *)((char *)&stru_3B208[h] - 4),
        *(int16 *)((char *)&stru_3B208[h] - 2));

    o = *(uint8 *)&stru_3B208[h].field_10[8];
    if ((o & 2) &&
        (((((uint8)h & 8) >> 3) + ((uint8)h & 7) * 2) * word_330C4 -
         word_336E8 % (word_330C4 << 4)) == 0 &&
        !(o & 0x20)) {
        sub_17594(h);
    }
    goto loop_end;

do_patrol_check:
    if (((uint8)h & 7) != (((uint8)(word_38FE0 >> 4)) & 7)) goto loop_end;
    if (h >= word_3C046 - 4) goto loop_end;
    if (h == 0) goto loop_end;
    if (0xe0 / (long)(word_330B8 + 2) >= word_38FE0 - var_556) goto loop_end;

    s = sub_1D200(word_3C69E);
    if (word_336F0 == 0 && !(*(uint8 *)&stru_3B208[h].field_10[8] & 0x80)) goto loop_end;

    if ((stru_3AA5E[s].field_6 & 0x181) != 1) goto loop_end;
    if (*(int16 *)&stru_3B208[h].field_10[6] != stru_3AA5E[s].field_8) goto loop_end;
    if (word_330B8 * 2 < word_3A946) goto loop_end;

    x = word_3B4D8 - stru_3AA5E[s].field_0;
    z = word_3B4E0 - stru_3AA5E[s].field_2;
    e = sub_1CFA6(x, z) >> 6;
    t = *(int16 *)(aFlogger + var_667 * 32 + 12);
    if ((unsigned)((t + 1) >> 1) > (unsigned)e) goto loop_end;

    var_556 = word_38FE0;
    sub_1783A(h, s);
    sub_11BC3(h + 0x20, 2);

loop_end:
    h++;
loop_test:
    if (h >= word_3C046) return;

    if (!(*(uint8 *)&stru_3B208[h].field_10[8] & 1)) goto loop_end;
    var_667 = *(int16 *)&stru_3B208[h].field_10[6];
    if (!(*(uint8 *)&stru_3B208[h].field_10[8] & 2)) goto do_patrol_check;
    if (*(int16 *)&stru_3B208[h].field_10[10] == 0) goto do_patrol_check;

    w = 0;
    if (*(uint8 *)&stru_3B208[h].field_10[8] & 4) goto do_returning;
    if (word_336F0 == 0) goto do_mode3;
    if ((ENT_FLAGS(h) & 0x140) != 0 && word_336F0 <= word_3995C) goto do_mode3;

    k = word_3B4D8;
    m = word_3B4E0;
    n = word_3B5D6;
    w = 1;
    if (word_333DA == 0) goto got_target;
    k = word_333D2;
    m = word_333D4;
    n = sub_1CF64(var_547, 1000, 30000);

got_target_alt:
    goto got_target;
}
#undef ENT_FLAGS
// TODO: sub_17594 (seg000:7594-7839) - unimplemented

// ==== seg000:0x783A ====
void spawnEnemyAircraft(int slot, int objType)
{
    int p;

    p = *(int16 *)&stru_3B202[slot].state[6];
    *(int16 *)&stru_3B202[slot].state[0] = (word_3AFA8 == 1) ? 0 : (int16)0x8000;
    if (stru_3AA5E[objType].flags & 0x200) {
        stru_3B202[slot].posX = word_3AFA8 * 3 + stru_3AA5E[objType].mapX;
        stru_3B202[slot].posY = stru_3AA5E[objType].mapY - word_3AFA8 * 12;
        stru_3B202[slot].alt = 0x8c;
        *(int16 *)&stru_3B202[slot].state[10] = 100;
        *(uint8 *)((char *)&stru_3B202[slot].state[1]) += 0xfc;
    } else {
        stru_3B202[slot].posX = stru_3AA5E[objType].mapX;
        stru_3B202[slot].posY = 0x1e * word_3AFA8 + stru_3AA5E[objType].mapY;
        stru_3B202[slot].alt = 0x0c;
        *(int16 *)&stru_3B202[slot].state[10] = 10;
    }
    stru_3B202[slot].worldX = (long)(uint16)stru_3B202[slot].posX << 5;
    stru_3B202[slot].worldY = (long)(uint16)stru_3B202[slot].posY << 5;
    *(int16 *)&stru_3B202[slot].state[2] = 0;
    *(int16 *)&stru_3B202[slot].state[4] = 0;
    *(uint16 *)&stru_3B202[slot].state[8] |= 0x403;
    stru_3B202[slot].objType = objType;
    *(int16 *)&stru_3B202[slot].state[12] = (int16)(((long)*(int16 *)&aFlogger[p * 32 + 12] << 11) * (long)word_330C4 / (long)*(int16 *)&aFlogger[p * 32 + 10]);
    *(int16 *)&stru_3B202[slot].state[16] = readMapPixelColor(stru_3AA5E[objType].mapX, stru_3AA5E[objType].mapY);
    if (word_336FC == -1) {
        stru_3B202[slot].state[9] &= 0xfe;
    }
    placeString(objType);
    strcat(strBuf, aDash);
    strcat(strBuf, (char *)(*(int16 *)&stru_3B202[slot].state[6] * 32 + aMig23));
    strcat(strBuf, aTakingOff);
    if (slot < word_3C046 - 4) {
        tempStrcpy(strBuf);
    }
}
// ==== seg000:0x85be ====
int samCanAcquireTarget(int slot, int targetX, int targetY, int param_4, int mode) {
    int p;
    int a;
    int b;
    int c;

    b = targetX - stru_335C4[slot].mapX;
    c = targetY - stru_335C4[slot].mapY;
    a = rangeApprox(b, c);
    var_670 = computeBearing(b, -c);
    if (stru_335C4[slot].field_6 * 24 / word_330C4 > a) {
        var_669 = a;
        return 1;
    }
    p = abs(var_670 - stru_335C4[slot].worldX);
    if (p > 0x1000 && mode != 3) {
        if (p > 0x6000 && slot < 8) {
            if ((stru_335C4[slot].field_6 << 4) / word_330C4 < a) {
                stru_335C4[slot].ttl = clampRange(stru_335C4[slot].ttl, 0, word_330C4 << 4);
            }
        }
        return 0;
    }
    if (mode == 0) {
        if (abs(stru_335C4[slot].worldX - var_542) > 0x2000) {
            return 0;
        }
    }
    if (mode == 0) {
        var_669 = a;
        return 1;
    }
    p = abs(stru_335C4[slot].worldX - var_542);
    if (abs(p - 0x4000) >= 0x2000 - word_330B8 * 2048) {
        var_669 = a;
        return 1;
    }
    return 0;
}

// ==== seg000:0x86f8 ====
void destroyAircraft(int objIdx)
{
    int p;

    if (!(stru_3B202[objIdx].state[8] & 0x20)) {
        *(int16 *)&aFlogger[*(int16 *)&stru_3B202[objIdx].state[6] * 32 + 22] += 1;
        if (*(uint16 *)&stru_3B202[objIdx].state[8] & 0x800) {
            word_3C044--;
        }
        if (objIdx == word_336FC) {
            word_336FC = -1;
        }
        stru_3B202[objIdx].state[8] |= 0x20;
        word_336F6 = -1;
        word_3BEC2 = stru_3B202[objIdx].posX;
        word_3BED6 = stru_3B202[objIdx].posY;
        word_3BFA2 = stru_3B202[objIdx].alt;
        word_3B4DC = 0x80;
        p = 3;
        appendMapEvent(p, (*(uint16 *)&stru_3B202[objIdx].state[8] & 0x4000 ? 0x80 : 0) + *(int16 *)&stru_3B202[objIdx].state[6]);
        if (*(int16 *)&stru_3B202[objIdx].state[10] != 0) goto done;
        *(uint16 *)&stru_3B202[objIdx].state[8] &= 0x1c1;
    done:
        ;
    }
    strcpy(strBuf, (char *)(*(int16 *)&stru_3B202[objIdx].state[6] * 32 + aMig23));
    makeSound(2, 2);
    if (word_3C45C == 1 && objIdx == word_336F2) {
        word_39604 = 1;
    }
}

void sub_187EA(int param_1)
{
    int p;
    int a;
    int b;

    placeString(param_1);
    p = 1;
    if ((stru_3AA5E[param_1].flags & 0x80) == 0) {
        if (stru_3AA5E[param_1].flags & 0x1000) {
            word_3C048--;
        }

        word_39808 = findNearestTileObject(
            (long)stru_3AA5E[param_1].mapX << 5,
            (0x8000L - (long)stru_3AA5E[param_1].mapY) << 5);

        if (param_1 != 0) {
            if (stru_3AA5E[param_1].field_4 == 0) {
                p = 0x0c;
            }
            *((uint8 *)&stru_3AA5E[param_1].flags) |= 0x80;
            stru_3AA5E[param_1].field_4 = 0;
            for (a = 0; a < 2; a++) {
                if ((&word_3B146)[a * 9] == param_1) {
                    markTargetReached(a);
                    p |= (a != 0 ? 0x40 : 0x80);
                    word_336EE = frameTick + word_330C4;
                    makeSound(0, 2);
                }
            }
            appendMapEvent(p, param_1);
            b = getTargetSymbol(param_1);
        } else {
            if (isTargetOverWater(param_1) != 0) {
                b = (int)(char)byte_3BEC4[0];
            } else {
                b = (int)(char)byte_3C02A[0];
            }
            if (b != *word_39808) {
                byte_3BED8[*word_39808]++;
                appendMapEvent(2, *word_39808);
            }
            *(((uint8 *)&b) + 1) |= 1;
            stru_3AA5E[param_1].field_C = b;
        }

        if (word_39808 != 0) {
            addTileEntry((char *)word_39808, shapeDataOffset(b), b);
        }
    }

    word_336F6 = param_1;
    makeSound(2, 2);
    if (word_3C45C == 2 && param_1 == word_336F4) {
        word_39604 = 1;
    }
    if (word_3C09A == 0) {
        redrawTacMap(word_3BEC0, word_3BED0);
    }
    if (word_330B8 < 2) {
        sub_166BE();
    }
}

// ==== seg000:0x89aa ====
int markTargetReached(int targetIdx) {
    if (planeFlags & (0x4000 >> targetIdx)) {
        return 0;
    }
    if (*(&word_3B144 + 9 * targetIdx) == 4 || *(&word_3B144 + 9 * targetIdx) == 3) {
        appendMapEvent((targetIdx != 0 ? 0x40 : 0x80) + 0x0b, 0);
    }
    if (targetIdx != 0) {
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

extern int randomRange(int);
void bombTarget(void) {
    int p;
    if (!(planeFlags & 0x1000) && word_336EA != -1) {
        p = 0;
        goto check;
        do {
            word_33096 |= (1 << randomRange(8));
            word_3BF90++;
            p++;
    check:;
        } while (p <= word_330B8);
        refreshActivePanel(0x16);
        word_38FEA = 1;
        makeSound(0, 2);
    }
}

// ==== seg000:0x8aa6 ====

void fireMissile()
{
    int p;
    int a;
    int b;
    int c;

    if (abs(var_545) > 0x3000) return;
    if (word_33702 != 0) return;
    if (word_3BE3C != 0) return;

    b = missleSpec[missileSpecIndex].weaponIdx;
    p = missiles[b].field_16;

    if (missleSpec[missileSpecIndex].ammo == 0) {
        strcpy(strBuf, missiles[b].field_0);
        strcat(strBuf, a0);
        setTimedMessage(strBuf);
        goto end;
    }

    if (p == 0) return;
    if (p == -1) return;

    missleSpec[missileSpecIndex].ammo--;

    if (word_330C2 != 0) {
        setDrawColor(0);
        a = ((int16 *)aA)[missileSpecIndex];
        fillRectBoth(a - 1, 0xbe, a + 2, 0xc2);
        drawNumber(missleSpec[missileSpecIndex].ammo, a, 0xbe, 0x0c);
        strcpy(strBuf, missiles[b].field_0);
        strcat(strBuf, aColon);
        strcat(strBuf, itoa(missleSpec[missileSpecIndex].ammo, unk_3C030, 0x0a));
        setTimedMessage(strBuf);
    }

    c = -1;
    a = 8;
    do {
        if (stru_335C4[a].ttl == 0) {
            c = a;
        }
        a++;
    } while (a < 12);

    if (c == -1) goto check_end;

    stru_335C4[c].mapX = word_3BEC0;
    stru_335C4[c].mapY = word_3BED0;
    stru_335C4[c].alt = var_547 - 0x14;
    stru_335C4[c].field_6 = (unsigned int)word_3A944 >> 11;
    c = c;
    stru_335C4[c].worldX = var_542;
    stru_335C4[c].worldY = var_544;
    stru_335C4[c].worldZ = var_545;

    stru_335C4[c].ttl = (int)(((long)sams[p].field_8 << (6 - (sams[p].field_C == 6 ? 3 : 2))) * (long)word_330C4 / (long)((sams[p].field_A >> 6) + 1)) + 6;

    c = c;
    if (stru_335C4[c].ttl <= 6) {
        stru_335C4[c].ttl = 999;
    }

    *(int16 *)&stru_335C4[c].state[0] = p;
    *(int16 *)&stru_335C4[c].state[2] = b;
    *(int16 *)&stru_335C4[c].state[4] = -1;

    if (p != 0x1e) {
        stru_335C4[c].worldY -= 0x1000;
    } else {
        *(int16 *)&stru_335C4[c].state[6] = sub_1C82D() - 0x400;
        word_3C020 = word_336F4;
    }

    if (word_336F4 >= 0 && sams[p].field_C == 6) {
        *(int16 *)&stru_335C4[c].state[4] = word_336F4;
    }

    if (word_336F4 >= 0 && sams[p].field_C == 5 && (stru_3AA5E[word_336F4].flags & 8)) {
        *(int16 *)&stru_335C4[c].state[4] = word_336F4;
    }

    if (p == 0x1d) {
        stru_335C4[c].worldY = (int16)0xc000;
        stru_335C4[c].field_6 = 1;
    }

    word_3A940 = c;
    strcpy(strBuf, missiles[b].field_0);
    strcat(strBuf, aFired);
    tempStrcpy(strBuf);

    makeSound(sams[p].field_8 != 0 ? 0x12 : 0x18, 2);

    scheduleEventCheck(c, 1);

check_end:
    if (word_3C09E == 0x15) {
        refreshActivePanel(0x15);
    }
end:
    ;
}

// ==== seg000:0x8df4 ====
void projectWorldPos(int worldX, int worldY, int worldZ) {
    *(char *)&var_315 = 0;
    drawNearestTileObject((int32)worldX << 5, -((int32)worldY - 0x8000L) << 5, (int32)worldZ);
}

