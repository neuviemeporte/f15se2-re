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

    k = g_planes[param_1].field_4;
    o = computeThreatRangeBearing(g_planes[param_1].mapX, g_planes[param_1].mapY, 0, k, p, (int *)a);
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
        word_336F8 = g_frameRateScaling;
        word_3BE96 = param_1;
        word_3C6AA = *(int16 *)&aNone[k * 14 + 12] & 1;
        if (*(int16 *)&g_planes[param_1].field_8 != 0) {
            word_3BF3C = (p[0] >> 8) - 0x20;
            word_3BF3E = (p[0] >> 8) + 0x20;
        }
        word_38F72 = word_336FA;
        if (!(*(uint8 *)&g_planes[param_1].flags & 4)) {
            *(uint8 *)&g_planes[param_1].flags |= 4;
        }
    }
    if (o > a[0]) {
        *(int16 *)&g_planes[param_1].field_8 += (word_330BA + g_missionStatus) * 32 + 32;
        if (*(int16 *)&g_planes[param_1].field_8 > 255) {
            *(int16 *)&g_planes[param_1].field_8 = 255;
        }
        if (!(g_planes[param_1].flags & 0x100) && word_333DA == 0 &&
            *(int16 *)&g_planes[param_1].field_8 > 0x7f) {
            sub_166BE();
        }
        if (word_3A946 <= g_missionStatus) {
            if (*(int16 *)&g_planes[param_1].field_8 > 0xc0) {
                if (k != 0x15) {
                    if (word_38FEE > 0x500) {
                        if ((unsigned)-(g_missionStatus * 3 - 20) < a[0]) {
                            word_3C09C++;
                            if (*(int16 *)&g_planes[param_1].field_8 >= 0xfa) {
                                l = (g_missionStatus != 0) ? param_1 % g_missionStatus : 0;
                                if (stru_335C4[l].ttl == 0) {
                                    if (sams[k].field_8 > (unsigned)a[0]) {
                                        k = k;
                                        stru_335C4[l].mapX = g_planes[param_1].mapX + 8;
                                        l = l;
                                        param_1 = param_1;
                                        stru_335C4[l].mapY = g_planes[param_1].mapY;
                                        stru_335C4[l].alt = 0;
                                        stru_335C4[l].field_6 = 1;
                                        stru_335C4[l].worldX = p[0];
                                        stru_335C4[l].worldY = 0x4000;
                                        stru_335C4[l].ttl = (int)((((long)sams[k].field_8 << 3) * (long)g_frameRateScaling) / (long)(sams[k].field_A >> 6));
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
        *(uint8 *)&g_planes[param_1].flags |= 0x10;
    } else {
        *(uint8 *)&g_planes[param_1].flags &= 0xEF;
        *(int16 *)&g_planes[param_1].field_8 -= 0x10;
        if (*(int16 *)&g_planes[param_1].field_8 < 0) {
            *(int16 *)&g_planes[param_1].field_8 = 0;
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
    d = g_viewX_ - threatX;
    e = g_viewY_ - threatY;
    c = (unsigned)rangeApprox(d, e) >> 6;
    b = computeBearing(d, -e);
    f = (f = (*(int16 *)&aNone[threatType * 14 + 10] + g_missionStatus * 2 + 3) * *(int16 *)&aNone[threatType * 14 + 8] / 16) * (((unsigned)var_547 >> 6) + 0x40) >> 7;
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
        word_3B4D8 = g_viewX_;
        word_3B4E0 = g_viewY_;
    }
    word_3B5D6 = var_547;
    word_38FEC = var_542;
    word_3BED4 = 0xFF;
    for (p = 0; p < word_3C69E; p++) {
        if (g_planes[p].field_4 != 0) {
            *(int *)&g_planes[p].field_8 = clampRange(*(int *)&g_planes[p].field_8, ((g_missionStatus + word_330BA) << 4) - 16, 0xFF);
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
        p = g_planes[a].field_4;
        if (p != 0) {
            b += *(int *)((char *)aNone + p * 14 + 8) * *(int *)((char *)aNone + p * 14 + 10) * (g_missionStatus + 2) / 64;
        }
    }
    b /= 100;
    return b;
}

// ==== seg000:0x67b4 ====
void updateObjects(void)
{
    int p0, p, pa, a, b, r, s, c, d, t, u0, e0, f, e1, u2, w, x, h, v3, y, j, g3, k, aj, z2, l, m0, m, ma, n;

    if ((frameTick & 1) == 0 && word_336F6 == -1) {
        *(int16 *)((char *)stru_33402 + ((frameTick >> 1) & 7) * 8) = 0;
    }

    *(int16 *)((char *)&word_3C5AC + (((frameTick >> 2) & 3) + word_3AFA4) * 12) = 0;

    word_3A946 = var_668;
    var_668 = 0;
    for (h = 0; h < word_3C046; h++) {
    if (*(uint8 *)&stru_3B202[h].state[14] & 1) {
    var_667 = *(int16 *)&stru_3B202[h].state[12];
    if ((*(uint8 *)&stru_3B202[h].state[14] & 2) && *(int16 *)&stru_3B202[h].state[16] != 0) {
    w = 0;
    if (!(*(uint8 *)&stru_3B202[h].state[14] & 4)) {
    if (word_336F0 != 0 && (!((*(uint16 *)&stru_3B202[h].state[14]) & 0x140) || word_336F0 > word_3995C)) {
        k = word_3B4D8;
        m = word_3B4E0;
        n = word_3B5D6;
        w = 1;
        if (word_333DA != 0) goto padlock_target;
        goto got_target;
    }

    w = 3;
    if ((*(uint16 *)&stru_3B202[h].state[14]) & 0x100) {
    if (word_336FC != -1) {
        k = sinMul((h & 7) * 0x800 + *(int16 *)&stru_3B202[word_336FC].state[6] - 0x1800,
                      *(int16 *)&stru_3B202[word_336FC].state[16])
            + stru_3B202[word_336FC].posX;

        m = stru_3B202[word_336FC].posY -
            cosMul((h & 7) * 0x800 + *(int16 *)&stru_3B202[word_336FC].state[6] - 0x1800,
                      *(int16 *)&stru_3B202[word_336FC].state[16]);

        n = stru_3B202[word_336FC].alt + (h & 7) * 0x40;
        goto set_target_alt;
    }
    }

    if (((uint8)h * 8 + (uint8)word_38FE0) & 0xbf) goto after_retarget;
    if (!(*(uint8 *)&stru_3B202[h].state[14] & 0x40)) {
    f = 0x7fff;
    pa = computeBearing(g_viewX_ - stru_3B202[h].posX,
                   stru_3B202[h].posY - g_viewY_);
    for (y = 0; y < 8; y++) {
        s = randomRange(word_3BED2) + 1;
        if (!(g_planes[s].flags & 0x400)) {
            p0 = computeBearing(g_planes[s].mapX - stru_3B202[h].posX,
                          stru_3B202[h].posY - g_planes[s].mapY);
            if (abs(pa - p0) < f) {
                f = abs(pa - p0);
                stru_3B202[h].objType = s;
                if (-(g_missionStatus * 0x1000 - 0x4000) > (int)f) break;
            }
        }
    }
    if ((unsigned)rangeApprox(g_viewX_ - stru_3B202[h].posX,
                  g_viewY_ - stru_3B202[h].posY) >> 6 > 0x15e && h != 0) {
        (*(uint16 *)&stru_3B202[h].state[14]) &= 0x1c1;
        *(int16 *)&stru_3B202[h].state[18] = 0;
    }
    }

after_retarget:
    s = *(int16 *)&stru_3B202[h].objType;
    k = g_planes[s].mapX;
    m = g_planes[s].mapY;
    n = clampRange(var_547 + 1000, 5000, 20000);
set_target_alt:
    n = n;
    goto got_target;
padlock_target:
    k = word_333D2;
    m = word_333D4;
    n = clampRange(var_547, 1000, 30000);
    goto got_target;
    }

    k = g_planes[*(int16 *)&stru_3B202[h].objType].mapX;
    if ((*(uint16 *)&stru_3B202[h].state[14]) & 0x200) {
        n = stru_3B202[h].posX - k;
        m = g_planes[*(int16 *)&stru_3B202[h].objType].mapY;
        k = k - n * 2;
        n = ((g_planes[*(int16 *)&stru_3B202[h].objType].flags + abs(n)) & 0x200)
            ? 0x8c : 0x0c;
    } else {
        m = g_planes[*(int16 *)&stru_3B202[h].objType].mapY + word_3AFA8 * 0x500;
        n = rangeApprox(stru_3B202[h].posX - k,
                      stru_3B202[h].posY - m) + 2000;
    }
    w = 2;

got_target:
    if (w == 3 && (*(uint8 *)&stru_3B202[h].state[14] & 8)) {
        k = g_viewX_;
        m = g_viewY_;
        n = stru_3B202[h].alt;
    }
    aj = k - stru_3B202[h].posX;
    z2 = m - stru_3B202[h].posY;
    b = computeBearing(aj, -z2);
    e1 = rangeApprox(aj, z2);
    p = computeBearing((n - stru_3B202[h].alt) >> 5, e1);
    p = clampRange(p, -0x2000, 0x1000);
    if (w == 1 && (unsigned)e1 < 0x600) {
    var_668++;
    if ((unsigned)e1 >= 0x400) goto after_missile_table;
    if (frameTick & 3) goto after_missile_table;
    if (abs(*(int16 *)&stru_3B202[h].state[6] - b) >= 0x800) goto after_missile_table;
    if (abs(*(int16 *)&stru_3B202[h].state[8] - p) >= 0x800) goto after_missile_table;

    g3 = ((frameTick >> 2) & 3) + word_3AFA4;
    v3 = 0x138 / g_frameRateScaling;
    *(int16 *)((char *)&word_3C5B6 + g3 * 12) = sinMul(-*(int16 *)&stru_3B202[h].state[8], v3) << 5;
    v3 = cosMul(*(int16 *)&stru_3B202[h].state[8], v3);
    *(int16 *)((char *)&word_3C5B2 + g3 * 12) = sinMul(*(int16 *)&stru_3B202[h].state[6], v3);
    *(int16 *)((char *)&word_3C5B4 + g3 * 12) = -cosMul(*(int16 *)&stru_3B202[h].state[6], v3);
    *(int16 *)((char *)&word_3C5AC + g3 * 12) = stru_3B202[h].posX;
    *(int16 *)((char *)&word_3C5AE + g3 * 12) = stru_3B202[h].posY;
    *(int16 *)((char *)&word_3C5B0 + g3 * 12) = stru_3B202[h].alt;

after_missile_table:
    a = clampRange((h & 3) + g_missionStatus, 0, 2);
    if (h == 0) a = 1;
    d = *(int16 *)&stru_3B202[h].state[6];
    if (abs(*(int16 *)&stru_3B202[h].state[10]) < 0x4000) {
        d += *(int16 *)&stru_3B202[h].state[10] >> 2;
    }
    r = (int)(b - d) >> 13 & 7;
    d = var_542;
    if (abs(var_545) < 0x4000) {
        d += var_545 >> 1;
    }
    t = ((*(int16 *)&stru_3B202[h].state[6] - d) >> 13) + 4 & 7;
    {
        register int ak;
        ak = *(int16 *)((char *)&word_33442 + 2 + a * 128 + r * 16 + t * 2);
        l = (ak & 0xf) << 12;
        if (ak == 0x100) {
            p = 0x6000;
            l = ((frameTick >> 8) & 8) * 0x1000 - 0x4000;
        }
    }
    if (*(int16 *)((char *)&word_33442 + 2 + a * 128 + r * 16 + t * 2) == 0x200) {
        p = (int16)0xa000;
        l = (((frameTick >> 8) & 8) - 4) * -0x1000;
    }
    if (p == (int16)0xa000) {
        if (-((*(int16 *)&stru_3B202[h].state[8] >> 3) - 3000) > stru_3B202[h].alt) {
            p = *(int16 *)&stru_3B202[h].state[8] + 0x1000;
        }
    }
    if (abs(*(int16 *)&stru_3B202[h].state[10]) > 0x4000) {
        p = l = 0;
    }
    goto after_accel;
    }

    l = clampRange(b - *(int16 *)&stru_3B202[h].state[6], -0x3000, 0x3000) << 1;
    if (w == 1 && g_missionStatus + 1 <= word_3A946) {
        l = 0x3000;
    }

after_accel:
    if (w == 1 && (g_planes[g_closestThreatIndex].flags & 0x400) && word_38FEE < 0x780) {
        l = 0x3000;
    }

    l = clampRange(l, -*(int16 *)(aFlogger + var_667 * 32 + 14) * 0x1000,
                  *(int16 *)(aFlogger + var_667 * 32 + 14) * 0x1000);
    l = clampRange(l - *(int16 *)&stru_3B202[h].state[10],
                  -*(int16 *)(aFlogger + var_667 * 32 + 14) * 256,
                  *(int16 *)(aFlogger + var_667 * 32 + 14) * 256);

    if ((*(uint16 *)&stru_3B202[h].state[14]) & 0x400) {
        if (*(int16 *)&stru_3B202[h].state[16] < 0x96) {
            *(int16 *)&stru_3B202[h].state[8] = 0;
        } else {
            *(int16 *)&stru_3B202[h].state[8] += 0x100;
        }
        l = 0;
        if (*(int16 *)&stru_3B202[h].state[16] < *(int16 *)(aFlogger + var_667 * 32 + 10)) {
            *(int16 *)&stru_3B202[h].state[16] += 0x3c / g_frameRateScaling;
        } else if (stru_3B202[h].alt > 300) {
            stru_3B202[h].state[15] &= 0xfb;
        }
    }

    if (*(uint8 *)&stru_3B202[h].state[14] & 0x30) {
        l = 0x400;
    }

    if (((uint8)h & 3) == (frameTick & 3)) {
        projectWorldPos(stru_3B202[h].posX,
                  stru_3B202[h].posY,
                  stru_3B202[h].alt);
        if (*(int8 *)&var_315 != 0) {
            stru_3B202[h].state[15] |= 0x20;
        } else {
            stru_3B202[h].state[15] &= 0xdf;
        }
    }

    if ((*(uint16 *)&stru_3B202[h].state[14]) & 0x2000) {
        p = 0x3000;
    }

    if (word_38FE0 < 10) {
        l >>= 2;
    }

    {
    register int u = h * 0x24;
    *(int16 *)&stru_3B202[h].state[10] += (l * (g_missionStatus + 2)) / g_frameRateScaling;
    *(int16 *)&stru_3B202[h].state[6] += (*(int16 *)&stru_3B202[h].state[10] >> 3) / g_frameRateScaling;

    j = p - *(int16 *)&stru_3B202[h].state[8];
    if (!(*(uint8 *)&stru_3B202[h].state[14] & 0x20)) goto no_smoke;
    j = -0x200;
    if (frameTick & 3) goto no_smoke;
    ma = (frameTick >> 1) & 7;
    ((struct struc_9 *)stru_33402)[ma].field_0 = *(int16 *)((char *)stru_3B202 + u + 2);
    }
    {
    register int t = ma * 8;
    register int v = h * 0x24;
    *(int16 *)((char *)stru_33402 + t + 2) = *(int16 *)((char *)stru_3B202 + v + 4);
    *(int16 *)((char *)stru_33402 + t + 4) = *(int16 *)((char *)stru_3B202 + v + 6);
    *(int16 *)((char *)stru_33402 + t + 6) = randomRange(0x20) << 11;
    word_33442 = ma;
    }
no_smoke:

    if (*(int16 *)&stru_3B202[h].state[8] < 0 &&
        -(sinMul(*(int16 *)&stru_3B202[h].state[8], 2000) - 200) > stru_3B202[h].alt &&
        ((*(uint16 *)&stru_3B202[h].state[14]) & 0x220) == 0) {
        j = 0x400;
    }

    j = clampRange(j, -0x400, 0x400);
    *(int16 *)&stru_3B202[h].state[8] += (j << 2) / g_frameRateScaling;
    if (abs(*(int16 *)&stru_3B202[h].state[8]) > 0x4000) {
        *(int8 *)((char *)&stru_3B202[h].state[6] + 1) += (char)0x80;
        *(int8 *)((char *)&stru_3B202[h].state[10] + 1) += (char)0x80;
        *(int16 *)&stru_3B202[h].state[8] = (int16)0x8000 - *(int16 *)&stru_3B202[h].state[8];
    }

    *(uint8 *)&stru_3B202[h].state[14] &= 0xef;

    u2 = (int)((unsigned long)(unsigned)(-(*(int16 *)&stru_3B202[h].state[8] / 2 + (int16)0x8000))
            * (long)*(int16 *)&stru_3B202[h].state[16] >> 14);
    u2 -= abs(sinMul(*(int16 *)&stru_3B202[h].state[10], u2)) >> 1;
    u2 = u2 * 4 / g_frameRateScaling;
    u2 >>= 2;

    m0 = cosMul(*(int16 *)&stru_3B202[h].state[8], u2);

    stru_3B202[h].worldX += (long)sinMul(*(int16 *)&stru_3B202[h].state[6], m0);
    stru_3B202[h].worldY -= (long)cosMul(*(int16 *)&stru_3B202[h].state[6], m0);

    stru_3B202[h].alt += sinMul(*(int16 *)&stru_3B202[h].state[8], u2);

    stru_3B202[h].posX = (int16)(stru_3B202[h].worldX >> 5);
    stru_3B202[h].posY = (int16)(stru_3B202[h].worldY >> 5);

    if (stru_3B202[h].alt <= 30000) goto alt_ok;
    *(int16 *)&stru_3B202[h].state[8] = 0;
alt_ok:

    if (stru_3B202[h].alt < 0) {
        (*(uint16 *)&stru_3B202[h].state[14]) &= (h != 0) ? 0x1c1 : 0;
        word_3BEBC = stru_3B202[h].posX;
        word_3BEC8 = stru_3B202[h].posY;
        word_3BECE = stru_3B202[h].alt;
        word_39606 = -8;
        if (h == word_336F2) {
            word_336F2 = -1;
        }
    }

    if ((unsigned)e1 < 0x10 && w == 2) {
        if ((*(uint16 *)&stru_3B202[h].state[14]) & 0x200) {
            (*(uint16 *)&stru_3B202[h].state[14]) |= 0x1000;
        } else {
            (*(uint16 *)&stru_3B202[h].state[14]) |= 0x200;
        }
    }

    if ((*(uint16 *)&stru_3B202[h].state[14]) & 0x1000) {
        *(int16 *)&stru_3B202[h].state[10] = *(int16 *)&stru_3B202[h].state[8] = 0;        *(int16 *)&stru_3B202[h].state[6] = (word_3AFA8 == 1) ? 0 : (int16)0x8000;
        stru_3B202[h].alt = (g_planes[g_closestThreatIndex].flags & 0x200) ? 0x8c : 0x0c;
        if (*(int16 *)&stru_3B202[h].state[16] > 0) {
            *(int16 *)&stru_3B202[h].state[16] -= 0x78 / g_frameRateScaling;
        } else {
            (*(uint16 *)&stru_3B202[h].state[14]) &= 0x1c1;
            if (h == 0 && word_3B144 >= 5) {
                (*(uint16 *)&stru_3B202[h].state[14]) = 0;
            }
        }
        if (h >= word_3C046 - 4 && *(int16 *)&stru_3B202[h].state[16] < 100) {
            (*(uint16 *)&stru_3B202[h].state[14]) &= 0x1c1;
            (*(uint16 *)&stru_3B202[h].state[14]) |= 0x406;
        }
    }

    if (--*(int16 *)&stru_3B202[h].state[18] == 0) {
        *(uint8 *)&stru_3B202[h].state[14] |= 4;
        f = 0x7fff;
        for (y = 3; y < word_3C69E; y++) {
            if ((g_planes[y].flags & 0x101) == 1) {
                ma = rangeApprox(stru_3B202[h].posX - g_planes[y].mapX,
                              stru_3B202[h].posY - g_planes[y].mapY);
                if (ma < f) {
                    *(int16 *)&stru_3B202[h].objType = y;
                    f = ma;
                }
            }
        }
    }

    *(int16 *)&stru_3B202[h].state[22] = readMapPixelColor(
        stru_3B202[h].posX,
        stru_3B202[h].posY);

    {
    register char o;
    o = *(uint8 *)&stru_3B202[h].state[14];
    if ((o & 2) &&
        (x = (((uint8)h & 8) >> 3) + (h & 7) * 2,
         frameTick % (g_frameRateScaling << 4) == x * g_frameRateScaling) &&
        !(o & 0x20)) {
        fireAirThreat(h);
    }
    }
    } else {
    if (((uint8)h & 7) == (((uint8)(word_38FE0 >> 4)) & 7)) {
    if (h < word_3C046 - 4) {
    if (h != 0) {
    if (0xe0 / (g_missionStatus + 2) < word_38FE0 - var_556) {
    s = randomRange(word_3C69E);
    if (word_336F0 != 0 || (*(uint8 *)&stru_3B202[h].state[14] & 0x80)) {
    if ((g_planes[s].flags & 0x181) == 1) {
    if (*(int16 *)&stru_3B202[h].state[12] == g_planes[s].field_8) {
    if (g_missionStatus * 2 >= word_3A946) {
    aj = word_3B4D8 - g_planes[s].mapX;
    z2 = word_3B4E0 - g_planes[s].mapY;
    e1 = (unsigned)rangeApprox(aj, z2) >> 6;
    c = *(int16 *)(aFlogger + var_667 * 32 + 12);
    if ((unsigned)(c / 2) > (unsigned)e1) {
        var_556 = word_38FE0;
        spawnEnemyAircraft(h, s);
        scheduleEventCheck(h + 0x20, 2);
    }
    }}}}}}}}
    }
    }
    }
}
