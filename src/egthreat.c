// seg000 non-debug code (/Gs, no /Zi)
// Functions whose block scheduling only matches when compiled without /Zi.
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

// ==== seg000:0x6172 ====
void updateThreatSites()
{
    int p, a, b, c, d, e;

    if ((word_336F8 == 0 || word_3C03E != word_336E4) && word_330C2 != 0) {
        if (word_336F8 == 0 && word_3C09A == 0) {
            restoreScopePanel();
            word_3BF3C = 0;
            word_3BF3E = 0x100;
        }
    }

    for (d = 0; d < word_38FFA; d++) {
        if (g_planeTable.planes[d].field_4 != 0 &&
            !(g_planeTable.planes[d].flags & 0x80) &&
            ((d * (frameTick >> 10) * 7 & 7) <= 7 ||
            g_planeTable.planes[d].field_8 != 0 ||
            (g_planeTable.planes[d].flags & 0x100) != 0)) {
            g_planeTable.planes[d].field_A -= 1;
            if (g_planeTable.planes[d].field_A <= 0) {
                g_planeTable.planes[d].field_A =
                    ((int)(char)g_frameRateScaling << 8) /
                    ((g_planeTable.planes[d].field_8 >> 3) + 0x20) + d / 2;
            }
            if (g_planeTable.planes[d].field_A == 4 && word_336F8 < 0) {
                fireGroundThreat(d);
                g_planeTable.planes[d].flags |= 0x02;
            }
        } else {
            g_planeTable.planes[d].flags &= ~0x02;
        }
    }

    if (commData->gfxModeNum == 0) {
        word_38F72 = 0;
    }

    if (word_3C09A == 0 && word_336F8 > 0 && word_330C2 != 0 && word_3BE7E > 1) {
        if (word_38FDC != 0 && commData->gfxModeNum != 0) {
            captureScopePanel();
            a = (int)((long)clampRange(g_frameRateScaling - word_336F8, 1, g_frameRateScaling) * (long)word_3BE7E / (long)g_frameRateScaling) << 6;
        } else {
            a = word_3BE7E << 6;
            word_3BE7E = 0;
        }
        if (word_3BE96 >= 0) {
            drawMapRangeArc(g_planeTable.planes[word_3BE96].mapX,
                      g_planeTable.planes[word_3BE96].mapY,
                      a, word_38F72, word_3C6AA,
                      word_3BF3C, word_3BF3E);
        }
    }

    word_336F8--;
}

/* ---- merged from egflt.c ---- */
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

    k = g_planeTable.planes[param_1].field_4;
    o = computeThreatRangeBearing(g_planeTable.planes[param_1].mapX, g_planeTable.planes[param_1].mapY, 0, k, p, (int *)a);
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
        word_3C6AA = aNone[k].field_C & 1;
        if (*(int16 *)&g_planeTable.planes[param_1].field_8 != 0) {
            word_3BF3C = (p[0] >> 8) - 0x20;
            word_3BF3E = (p[0] >> 8) + 0x20;
        }
        word_38F72 = word_336FA;
        if (!(*(uint8 *)&g_planeTable.planes[param_1].flags & 4)) {
            *(uint8 *)&g_planeTable.planes[param_1].flags |= 4;
        }
    }
    if (o > a[0]) {
        *(int16 *)&g_planeTable.planes[param_1].field_8 += (word_330BA + g_missionStatus) * 32 + 32;
        if (*(int16 *)&g_planeTable.planes[param_1].field_8 > 255) {
            *(int16 *)&g_planeTable.planes[param_1].field_8 = 255;
        }
        if (!(g_planeTable.planes[param_1].flags & 0x100) && mapEvents[0].ttl == 0 &&
            *(int16 *)&g_planeTable.planes[param_1].field_8 > 0x7f) {
            updateThreatAlert();
        }
        if (word_3A946 <= g_missionStatus) {
            if (*(int16 *)&g_planeTable.planes[param_1].field_8 > 0xc0) {
                if (k != 0x15) {
                    if (word_38FEE > 0x500) {
                        if ((unsigned)-(g_missionStatus * 3 - 20) < a[0]) {
                            word_3C09C++;
                            if (*(int16 *)&g_planeTable.planes[param_1].field_8 >= 0xfa) {
                                l = (g_missionStatus != 0) ? param_1 % g_missionStatus : 0;
                                if (stru_335C4[l].ttl == 0) {
                                    if (sams[k].field_8 > (unsigned)a[0]) {
                                        k = k;
                                        stru_335C4[l].mapX = g_planeTable.planes[param_1].mapX + 8;
                                        l = l;
                                        param_1 = param_1;
                                        stru_335C4[l].mapY = g_planeTable.planes[param_1].mapY;
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
        *(uint8 *)&g_planeTable.planes[param_1].flags |= 0x10;
    } else {
        *(uint8 *)&g_planeTable.planes[param_1].flags &= 0xEF;
        *(int16 *)&g_planeTable.planes[param_1].field_8 -= 0x10;
        if (*(int16 *)&g_planeTable.planes[param_1].field_8 < 0) {
            *(int16 *)&g_planeTable.planes[param_1].field_8 = 0;
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
    f = (f = (aNone[threatType].field_A + g_missionStatus * 2 + 3) * aNone[threatType].field_8 / 16) * (((unsigned)g_viewZ >> 6) + 0x40) >> 7;
    *outBearing = b;
    *arg_a = c;
    return f;
}

// ==== seg000:0x66be ====
void updateThreatAlert(void) {
    int p;
    word_336F0 = word_3B0AC;
    if (mapEvents[0].ttl != 0) {
        word_3B4D8 = mapEvents[0].mapX;
        word_3B4E0 = mapEvents[0].mapY;
    } else {
        word_3B4D8 = g_viewX_;
        word_3B4E0 = g_viewY_;
    }
    word_3B5D6 = g_viewZ;
    word_38FEC = g_ourHead;
    word_3BED4 = 0xFF;
    for (p = 0; p < word_3C69E; p++) {
        if (g_planeTable.planes[p].field_4 != 0) {
            *(int *)&g_planeTable.planes[p].field_8 = clampRange(*(int *)&g_planeTable.planes[p].field_8, ((g_missionStatus + word_330BA) << 4) - 16, 0xFF);
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
        p = g_planeTable.planes[a].field_4;
        if (p != 0) {
            b += aNone[p].field_8 * aNone[p].field_A * (g_missionStatus + 2) / 64;
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
        stru_33402[(frameTick >> 1) & 7].field_0 = 0;
    }

    bulletTracks[((frameTick >> 2) & 3) + word_3AFA4].posX = 0;

    word_3A946 = var_668;
    var_668 = 0;
    for (h = 0; h < word_3C046; h++) {
    if (stru_3B202[h].flags.b[0] & 1) {
    var_667 = stru_3B202[h].spec;
    if ((stru_3B202[h].flags.b[0] & 2) && stru_3B202[h].speed != 0) {
    w = 0;
    if (!(stru_3B202[h].flags.b[0] & 4)) {
    if (word_336F0 != 0 && (!((stru_3B202[h].flags.w) & 0x140) || word_336F0 > word_3995C)) {
        k = word_3B4D8;
        m = word_3B4E0;
        n = word_3B5D6;
        w = 1;
        if (mapEvents[0].ttl != 0) goto padlock_target;
        goto got_target;
    }

    w = 3;
    if ((stru_3B202[h].flags.w) & 0x100) {
    if (word_336FC != -1) {
        k = sinMul((h & 7) * 0x800 + stru_3B202[word_336FC].heading.w - 0x1800,
                      stru_3B202[word_336FC].speed)
            + stru_3B202[word_336FC].posX;

        m = stru_3B202[word_336FC].posY -
            cosMul((h & 7) * 0x800 + stru_3B202[word_336FC].heading.w - 0x1800,
                      stru_3B202[word_336FC].speed);

        n = stru_3B202[word_336FC].alt + (h & 7) * 0x40;
        goto set_target_alt;
    }
    }

    if (((uint8)h * 8 + (uint8)word_38FE0) & 0xbf) goto after_retarget;
    if (!(stru_3B202[h].flags.b[0] & 0x40)) {
    f = 0x7fff;
    pa = computeBearing(g_viewX_ - stru_3B202[h].posX,
                   stru_3B202[h].posY - g_viewY_);
    for (y = 0; y < 8; y++) {
        s = randomRange(word_3BED2) + 1;
        if (!(g_planeTable.planes[s].flags & 0x400)) {
            p0 = computeBearing(g_planeTable.planes[s].mapX - stru_3B202[h].posX,
                          stru_3B202[h].posY - g_planeTable.planes[s].mapY);
            if (abs(pa - p0) < f) {
                f = abs(pa - p0);
                stru_3B202[h].objType = s;
                if (-(g_missionStatus * 0x1000 - 0x4000) > (int)f) break;
            }
        }
    }
    if ((unsigned)rangeApprox(g_viewX_ - stru_3B202[h].posX,
                  g_viewY_ - stru_3B202[h].posY) >> 6 > 0x15e && h != 0) {
        (stru_3B202[h].flags.w) &= 0x1c1;
        stru_3B202[h].timer = 0;
    }
    }

after_retarget:
    s = *(int16 *)&stru_3B202[h].objType;
    k = g_planeTable.planes[s].mapX;
    m = g_planeTable.planes[s].mapY;
    n = clampRange(g_viewZ + 1000, 5000, 20000);
set_target_alt:
    n = n;
    goto got_target;
padlock_target:
    k = mapEvents[0].mapX;
    m = mapEvents[0].mapY;
    n = clampRange(g_viewZ, 1000, 30000);
    goto got_target;
    }

    k = g_planeTable.planes[*(int16 *)&stru_3B202[h].objType].mapX;
    if ((stru_3B202[h].flags.w) & 0x200) {
        n = stru_3B202[h].posX - k;
        m = g_planeTable.planes[*(int16 *)&stru_3B202[h].objType].mapY;
        k = k - n * 2;
        n = ((g_planeTable.planes[*(int16 *)&stru_3B202[h].objType].flags + abs(n)) & 0x200)
            ? 0x8c : 0x0c;
    } else {
        m = g_planeTable.planes[*(int16 *)&stru_3B202[h].objType].mapY + word_3AFA8 * 0x500;
        n = rangeApprox(stru_3B202[h].posX - k,
                      stru_3B202[h].posY - m) + 2000;
    }
    w = 2;

got_target:
    if (w == 3 && (stru_3B202[h].flags.b[0] & 8)) {
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
    if (abs(stru_3B202[h].heading.w - b) >= 0x800) goto after_missile_table;
    if (abs(stru_3B202[h].pitch - p) >= 0x800) goto after_missile_table;

    g3 = ((frameTick >> 2) & 3) + word_3AFA4;
    v3 = 0x138 / g_frameRateScaling;
    bulletTracks[g3].velZ = sinMul(-stru_3B202[h].pitch, v3) << 5;
    v3 = cosMul(stru_3B202[h].pitch, v3);
    bulletTracks[g3].velX = sinMul(stru_3B202[h].heading.w, v3);
    bulletTracks[g3].velY = -cosMul(stru_3B202[h].heading.w, v3);
    bulletTracks[g3].posX = stru_3B202[h].posX;
    bulletTracks[g3].posY = stru_3B202[h].posY;
    bulletTracks[g3].alt = stru_3B202[h].alt;

after_missile_table:
    a = clampRange((h & 3) + g_missionStatus, 0, 2);
    if (h == 0) a = 1;
    d = stru_3B202[h].heading.w;
    if (abs(stru_3B202[h].field_4.w) < 0x4000) {
        d += stru_3B202[h].field_4.w >> 2;
    }
    r = (int)(b - d) >> 13 & 7;
    d = g_ourHead;
    if (abs(g_ourRoll) < 0x4000) {
        d += g_ourRoll >> 1;
    }
    t = ((stru_3B202[h].heading.w - d) >> 13) + 4 & 7;
    {
        register int ak;
        ak = word_33444[a][r][t];
        l = (ak & 0xf) << 12;
        if (ak == 0x100) {
            p = 0x6000;
            l = ((frameTick >> 8) & 8) * 0x1000 - 0x4000;
        }
    }
    if (word_33444[a][r][t] == 0x200) {
        p = (int16)0xa000;
        l = (((frameTick >> 8) & 8) - 4) * -0x1000;
    }
    if (p == (int16)0xa000) {
        if (-((stru_3B202[h].pitch >> 3) - 3000) > stru_3B202[h].alt) {
            p = stru_3B202[h].pitch + 0x1000;
        }
    }
    if (abs(stru_3B202[h].field_4.w) > 0x4000) {
        p = l = 0;
    }
    goto after_accel;
    }

    l = clampRange(b - stru_3B202[h].heading.w, -0x3000, 0x3000) << 1;
    if (w == 1 && g_missionStatus + 1 <= word_3A946) {
        l = 0x3000;
    }

after_accel:
    if (w == 1 && (g_planeTable.planes[g_closestThreatIndex].flags & 0x400) && word_38FEE < 0x780) {
        l = 0x3000;
    }

    l = clampRange(l, -aircraftTypes[var_667].field_16 * 0x1000,
                  aircraftTypes[var_667].field_16 * 0x1000);
    l = clampRange(l - stru_3B202[h].field_4.w,
                  -aircraftTypes[var_667].field_16 * 256,
                  aircraftTypes[var_667].field_16 * 256);

    if ((stru_3B202[h].flags.w) & 0x400) {
        if (stru_3B202[h].speed < 0x96) {
            stru_3B202[h].pitch = 0;
        } else {
            stru_3B202[h].pitch += 0x100;
        }
        l = 0;
        if (stru_3B202[h].speed < aircraftTypes[var_667].field_12) {
            stru_3B202[h].speed += 0x3c / g_frameRateScaling;
        } else if (stru_3B202[h].alt > 300) {
            stru_3B202[h].flags.b[1] &= 0xfb;
        }
    }

    if (stru_3B202[h].flags.b[0] & 0x30) {
        l = 0x400;
    }

    if (((uint8)h & 3) == (frameTick & 3)) {
        testWorldPosVisible(stru_3B202[h].posX,
                  stru_3B202[h].posY,
                  stru_3B202[h].alt);
        if (*(int8 *)&var_315 != 0) {
            stru_3B202[h].flags.b[1] |= 0x20;
        } else {
            stru_3B202[h].flags.b[1] &= 0xdf;
        }
    }

    if ((stru_3B202[h].flags.w) & 0x2000) {
        p = 0x3000;
    }

    if (word_38FE0 < 10) {
        l >>= 2;
    }

    {
    register int u = h * 0x24;
    stru_3B202[h].field_4.w += (l * (g_missionStatus + 2)) / g_frameRateScaling;
    stru_3B202[h].heading.w += (stru_3B202[h].field_4.w >> 3) / g_frameRateScaling;

    j = p - stru_3B202[h].pitch;
    if (!(stru_3B202[h].flags.b[0] & 0x20)) goto no_smoke;
    j = -0x200;
    if (frameTick & 3) goto no_smoke;
    ma = (frameTick >> 1) & 7;
    stru_33402[ma].field_0 = *(int16 *)((char *)stru_3B202 + u + 2);
    }
    {
    register int t = ma * 8;
    register int v = h * 0x24;
    /* stru_33402[ma] via register offset t: idiomatic stru_33402[ma].field_N
       recomputes ma*8 and shifts register allocation (verify mismatch). */
    *(int16 *)((char *)stru_33402 + t + 2) = *(int16 *)((char *)stru_3B202 + v + 4);
    *(int16 *)((char *)stru_33402 + t + 4) = *(int16 *)((char *)stru_3B202 + v + 6);
    *(int16 *)((char *)stru_33402 + t + 6) = randomRange(0x20) << 11;
    word_33442 = ma;
    }
no_smoke:

    if (stru_3B202[h].pitch < 0 &&
        -(sinMul(stru_3B202[h].pitch, 2000) - 200) > stru_3B202[h].alt &&
        ((stru_3B202[h].flags.w) & 0x220) == 0) {
        j = 0x400;
    }

    j = clampRange(j, -0x400, 0x400);
    stru_3B202[h].pitch += (j << 2) / g_frameRateScaling;
    if (abs(stru_3B202[h].pitch) > 0x4000) {
        stru_3B202[h].heading.b[1] += (char)0x80;
        stru_3B202[h].field_4.b[1] += (char)0x80;
        stru_3B202[h].pitch = (int16)0x8000 - stru_3B202[h].pitch;
    }

    stru_3B202[h].flags.b[0] &= 0xef;

    u2 = (int)((unsigned long)(unsigned)(-(stru_3B202[h].pitch / 2 + (int16)0x8000))
            * (long)stru_3B202[h].speed >> 14);
    u2 -= abs(sinMul(stru_3B202[h].field_4.w, u2)) >> 1;
    u2 = u2 * 4 / g_frameRateScaling;
    u2 >>= 2;

    m0 = cosMul(stru_3B202[h].pitch, u2);

    stru_3B202[h].worldX += (long)sinMul(stru_3B202[h].heading.w, m0);
    stru_3B202[h].worldY -= (long)cosMul(stru_3B202[h].heading.w, m0);

    stru_3B202[h].alt += sinMul(stru_3B202[h].pitch, u2);

    stru_3B202[h].posX = (int16)(stru_3B202[h].worldX >> 5);
    stru_3B202[h].posY = (int16)(stru_3B202[h].worldY >> 5);

    if (stru_3B202[h].alt <= 30000) goto alt_ok;
    stru_3B202[h].pitch = 0;
alt_ok:

    if (stru_3B202[h].alt < 0) {
        (stru_3B202[h].flags.w) &= (h != 0) ? 0x1c1 : 0;
        word_3BEBC = stru_3B202[h].posX;
        word_3BEC8 = stru_3B202[h].posY;
        word_3BECE = stru_3B202[h].alt;
        word_39606 = -8;
        if (h == word_336F2) {
            word_336F2 = -1;
        }
    }

    if ((unsigned)e1 < 0x10 && w == 2) {
        if ((stru_3B202[h].flags.w) & 0x200) {
            (stru_3B202[h].flags.w) |= 0x1000;
        } else {
            (stru_3B202[h].flags.w) |= 0x200;
        }
    }

    if ((stru_3B202[h].flags.w) & 0x1000) {
        stru_3B202[h].field_4.w = stru_3B202[h].pitch = 0;        stru_3B202[h].heading.w = (word_3AFA8 == 1) ? 0 : (int16)0x8000;
        stru_3B202[h].alt = (g_planeTable.planes[g_closestThreatIndex].flags & 0x200) ? 0x8c : 0x0c;
        if (stru_3B202[h].speed > 0) {
            stru_3B202[h].speed -= 0x78 / g_frameRateScaling;
        } else {
            (stru_3B202[h].flags.w) &= 0x1c1;
            if (h == 0 && g_targetSlots[0].state >= 5) {
                (stru_3B202[h].flags.w) = 0;
            }
        }
        if (h >= word_3C046 - 4 && stru_3B202[h].speed < 100) {
            (stru_3B202[h].flags.w) &= 0x1c1;
            (stru_3B202[h].flags.w) |= 0x406;
        }
    }

    if (--stru_3B202[h].timer == 0) {
        stru_3B202[h].flags.b[0] |= 4;
        f = 0x7fff;
        for (y = 3; y < word_3C69E; y++) {
            if ((g_planeTable.planes[y].flags & 0x101) == 1) {
                ma = rangeApprox(stru_3B202[h].posX - g_planeTable.planes[y].mapX,
                              stru_3B202[h].posY - g_planeTable.planes[y].mapY);
                if (ma < f) {
                    *(int16 *)&stru_3B202[h].objType = y;
                    f = ma;
                }
            }
        }
    }

    stru_3B202[h].terrainColor = readMapPixelColor(
        stru_3B202[h].posX,
        stru_3B202[h].posY);

    {
    register char o;
    o = stru_3B202[h].flags.b[0];
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
    if (word_336F0 != 0 || (stru_3B202[h].flags.b[0] & 0x80)) {
    if ((g_planeTable.planes[s].flags & 0x181) == 1) {
    if (stru_3B202[h].spec == g_planeTable.planes[s].field_8) {
    if (g_missionStatus * 2 >= word_3A946) {
    aj = word_3B4D8 - g_planeTable.planes[s].mapX;
    z2 = word_3B4E0 - g_planeTable.planes[s].mapY;
    e1 = (unsigned)rangeApprox(aj, z2) >> 6;
    c = aircraftTypes[var_667].field_14;
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
