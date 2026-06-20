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

    if ((g_scopeSweepTimer == 0 || g_prevScopeRange != g_threatScopeRange) && g_hudVisible != 0) {
        if (g_scopeSweepTimer == 0 && g_mapMode == 0) {
            restoreScopePanel();
            g_scopeArcStart = 0;
            g_scopeArcEnd = 0x100;
        }
    }

    for (d = 0; d < g_targetEntityCount; d++) {
        if (g_planeTable.planes[d].active != 0 &&
            !(g_planeTable.planes[d].flags & 0x80) &&
            ((d * (frameTick >> 10) * 7 & 7) <= 7 ||
            g_planeTable.planes[d].alertLevel != 0 ||
            (g_planeTable.planes[d].flags & 0x100) != 0)) {
            g_planeTable.planes[d].threatTimer -= 1;
            if (g_planeTable.planes[d].threatTimer <= 0) {
                g_planeTable.planes[d].threatTimer =
                    ((int)(char)g_frameRateScaling << 8) /
                    ((g_planeTable.planes[d].alertLevel >> 3) + 0x20) + d / 2;
            }
            if (g_planeTable.planes[d].threatTimer == 4 && g_scopeSweepTimer < 0) {
                fireGroundThreat(d);
                g_planeTable.planes[d].flags |= 0x02;
            }
        } else {
            g_planeTable.planes[d].flags &= ~0x02;
        }
    }

    if (commData->gfxModeNum == 0) {
        g_scopeArcColor = 0;
    }

    if (g_mapMode == 0 && g_scopeSweepTimer > 0 && g_hudVisible != 0 && g_scopeArcRange > 1) {
        if (g_detailLevel != 0 && commData->gfxModeNum != 0) {
            captureScopePanel();
            a = (int)((long)clampRange(g_frameRateScaling - g_scopeSweepTimer, 1, g_frameRateScaling) * (long)g_scopeArcRange / (long)g_frameRateScaling) << 6;
        } else {
            a = g_scopeArcRange << 6;
            g_scopeArcRange = 0;
        }
        if (g_threatLabelTarget >= 0) {
            drawMapRangeArc(g_planeTable.planes[g_threatLabelTarget].mapX,
                      g_planeTable.planes[g_threatLabelTarget].mapY,
                      a, g_scopeArcColor, g_threatRadarFlag,
                      g_scopeArcStart, g_scopeArcEnd);
        }
    }

    g_scopeSweepTimer--;
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

    k = g_planeTable.planes[param_1].active;
    o = computeThreatRangeBearing(g_planeTable.planes[param_1].mapX, g_planeTable.planes[param_1].mapY, 0, k, p, (int *)a);
    g_threatToneLevel = 0;
    if (o > 0) {
        j = o;
        if (j > 99) {
            j = 99;
        }
        g_threatToneLevel = 4;
        if (o + g_threatScopeRange > 50) {
            g_threatToneLevel = 0x0c;
        }
        if (o + g_threatScopeRange > 100) {
            g_threatToneLevel = 0x0e;
        }
        g_scopeArcRange = o;
        g_scopeSweepTimer = g_frameRateScaling;
        g_threatLabelTarget = param_1;
        g_threatRadarFlag = aNone[k].flags & 1;
        if (*(int16 *)&g_planeTable.planes[param_1].alertLevel != 0) {
            g_scopeArcStart = (p[0] >> 8) - 0x20;
            g_scopeArcEnd = (p[0] >> 8) + 0x20;
        }
        g_scopeArcColor = g_threatToneLevel;
        if (!(*(uint8 *)&g_planeTable.planes[param_1].flags & 4)) {
            *(uint8 *)&g_planeTable.planes[param_1].flags |= 4;
        }
    }
    if (o > a[0]) {
        *(int16 *)&g_planeTable.planes[param_1].alertLevel += (g_difficultyTier + g_missionStatus) * 32 + 32;
        if (*(int16 *)&g_planeTable.planes[param_1].alertLevel > 255) {
            *(int16 *)&g_planeTable.planes[param_1].alertLevel = 255;
        }
        if (!(g_planeTable.planes[param_1].flags & 0x100) && mapEvents[0].ttl == 0 &&
            *(int16 *)&g_planeTable.planes[param_1].alertLevel > 0x7f) {
            updateThreatAlert();
        }
        if (g_enemyThreatCount <= g_missionStatus) {
            if (*(int16 *)&g_planeTable.planes[param_1].alertLevel > 0xc0) {
                if (k != 0x15) {
                    if (g_nearestThreatRange > 0x500) {
                        if ((unsigned)-(g_missionStatus * 3 - 20) < a[0]) {
                            g_enemyAlertFlag++;
                            if (*(int16 *)&g_planeTable.planes[param_1].alertLevel >= 0xfa) {
                                l = (g_missionStatus != 0) ? param_1 % g_missionStatus : 0;
                                if (g_projectiles[l].ttl == 0) {
                                    if (sams[k].lockRange > (unsigned)a[0]) {
                                        k = k;
                                        g_projectiles[l].mapX = g_planeTable.planes[param_1].mapX + 8;
                                        l = l;
                                        param_1 = param_1;
                                        g_projectiles[l].mapY = g_planeTable.planes[param_1].mapY;
                                        g_projectiles[l].alt = 0;
                                        g_projectiles[l].speed = 1;
                                        g_projectiles[l].worldX = p[0];
                                        g_projectiles[l].worldY = 0x4000;
                                        g_projectiles[l].ttl = (int)((((long)sams[k].lockRange << 3) * (long)g_frameRateScaling) / (long)(sams[k].maxSpeed >> 6));
                                        *(int16 *)&g_projectiles[l].state[0] = k;
                                        *(int16 *)&g_projectiles[l].state[6] = param_1;

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
        *(int16 *)&g_planeTable.planes[param_1].alertLevel -= 0x10;
        if (*(int16 *)&g_planeTable.planes[param_1].alertLevel < 0) {
            *(int16 *)&g_planeTable.planes[param_1].alertLevel = 0;
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
    f = (f = (aNone[threatType].dangerTier + g_missionStatus * 2 + 3) * aNone[threatType].lethality / 16) * (((unsigned)g_viewZ >> 6) + 0x40) >> 7;
    *outBearing = b;
    *arg_a = c;
    return f;
}

// ==== seg000:0x66be ====
void updateThreatAlert(void) {
    int p;
    g_threatActiveTimer = g_threatTimerInit;
    if (mapEvents[0].ttl != 0) {
        g_threatRefX = mapEvents[0].mapX;
        g_threatRefY = mapEvents[0].mapY;
    } else {
        g_threatRefX = g_viewX_;
        g_threatRefY = g_viewY_;
    }
    g_threatRefZ = g_viewZ;
    g_threatRefHead = g_ourHead;
    g_unusedEventHist0 = 0xFF;
    for (p = 0; p < g_planeScanCount; p++) {
        if (g_planeTable.planes[p].active != 0) {
            *(int *)&g_planeTable.planes[p].alertLevel = clampRange(*(int *)&g_planeTable.planes[p].alertLevel, ((g_missionStatus + g_difficultyTier) << 4) - 16, 0xFF);
        }
    }
}

// ==== seg000:0x6742 ====
int computeThreatScore(void) {
    int p;
    int a;
    int b;

    b = 0;
    for (a = 0; a < g_targetEntityCount; a++) {
        p = g_planeTable.planes[a].active;
        if (p != 0) {
            b += aNone[p].lethality * aNone[p].dangerTier * (g_missionStatus + 2) / 64;
        }
    }
    b /= 100;
    return b;
}

// ==== seg000:0x67b4 ====
void updateObjects(void)
{
    int p0, p, pa, a, b, r, s, c, d, t, u0, e0, f, e1, u2, w, x, h, v3, y, j, g3, k, aj, z2, l, m0, m, ma, n;

    if ((frameTick & 1) == 0 && g_smokeSourceIdx == -1) {
        g_particles[(frameTick >> 1) & 7].posX = 0;
    }

    bulletTracks[((frameTick >> 2) & 3) + g_bulletTrackCount].posX = 0;

    g_enemyThreatCount = g_activeThreatCount;
    g_activeThreatCount = 0;
    for (h = 0; h < g_groundUnitCount; h++) {
    if (g_simObjects[h].flags.b[0] & 1) {
    g_threatSpec = g_simObjects[h].spec;
    if ((g_simObjects[h].flags.b[0] & 2) && g_simObjects[h].speed != 0) {
    w = 0;
    if (!(g_simObjects[h].flags.b[0] & 4)) {
    if (g_threatActiveTimer != 0 && (!((g_simObjects[h].flags.w) & 0x140) || g_threatActiveTimer > g_threatDisplayTtl)) {
        k = g_threatRefX;
        m = g_threatRefY;
        n = g_threatRefZ;
        w = 1;
        if (mapEvents[0].ttl != 0) goto padlock_target;
        goto got_target;
    }

    w = 3;
    if ((g_simObjects[h].flags.w) & 0x100) {
    if (g_padlockAircraft != -1) {
        k = sinMul((h & 7) * 0x800 + g_simObjects[g_padlockAircraft].heading.w - 0x1800,
                      g_simObjects[g_padlockAircraft].speed)
            + g_simObjects[g_padlockAircraft].posX;

        m = g_simObjects[g_padlockAircraft].posY -
            cosMul((h & 7) * 0x800 + g_simObjects[g_padlockAircraft].heading.w - 0x1800,
                      g_simObjects[g_padlockAircraft].speed);

        n = g_simObjects[g_padlockAircraft].alt + (h & 7) * 0x40;
        goto set_target_alt;
    }
    }

    if (((uint8)h * 8 + (uint8)g_missionTick) & 0xbf) goto after_retarget;
    if (!(g_simObjects[h].flags.b[0] & 0x40)) {
    f = 0x7fff;
    pa = computeBearing(g_viewX_ - g_simObjects[h].posX,
                   g_simObjects[h].posY - g_viewY_);
    for (y = 0; y < 8; y++) {
        s = randomRange(g_planeCount) + 1;
        if (!(g_planeTable.planes[s].flags & 0x400)) {
            p0 = computeBearing(g_planeTable.planes[s].mapX - g_simObjects[h].posX,
                          g_simObjects[h].posY - g_planeTable.planes[s].mapY);
            if (abs(pa - p0) < f) {
                f = abs(pa - p0);
                g_simObjects[h].objType = s;
                if (-(g_missionStatus * 0x1000 - 0x4000) > (int)f) break;
            }
        }
    }
    if ((unsigned)rangeApprox(g_viewX_ - g_simObjects[h].posX,
                  g_viewY_ - g_simObjects[h].posY) >> 6 > 0x15e && h != 0) {
        (g_simObjects[h].flags.w) &= 0x1c1;
        g_simObjects[h].timer = 0;
    }
    }

after_retarget:
    s = *(int16 *)&g_simObjects[h].objType;
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

    k = g_planeTable.planes[*(int16 *)&g_simObjects[h].objType].mapX;
    if ((g_simObjects[h].flags.w) & 0x200) {
        n = g_simObjects[h].posX - k;
        m = g_planeTable.planes[*(int16 *)&g_simObjects[h].objType].mapY;
        k = k - n * 2;
        n = ((g_planeTable.planes[*(int16 *)&g_simObjects[h].objType].flags + abs(n)) & 0x200)
            ? 0x8c : 0x0c;
    } else {
        m = g_planeTable.planes[*(int16 *)&g_simObjects[h].objType].mapY + g_northSouthSign * 0x500;
        n = rangeApprox(g_simObjects[h].posX - k,
                      g_simObjects[h].posY - m) + 2000;
    }
    w = 2;

got_target:
    if (w == 3 && (g_simObjects[h].flags.b[0] & 8)) {
        k = g_viewX_;
        m = g_viewY_;
        n = g_simObjects[h].alt;
    }
    aj = k - g_simObjects[h].posX;
    z2 = m - g_simObjects[h].posY;
    b = computeBearing(aj, -z2);
    e1 = rangeApprox(aj, z2);
    p = computeBearing((n - g_simObjects[h].alt) >> 5, e1);
    p = clampRange(p, -0x2000, 0x1000);
    if (w == 1 && (unsigned)e1 < 0x600) {
    g_activeThreatCount++;
    if ((unsigned)e1 >= 0x400) goto after_missile_table;
    if (frameTick & 3) goto after_missile_table;
    if (abs(g_simObjects[h].heading.w - b) >= 0x800) goto after_missile_table;
    if (abs(g_simObjects[h].pitch - p) >= 0x800) goto after_missile_table;

    g3 = ((frameTick >> 2) & 3) + g_bulletTrackCount;
    v3 = 0x138 / g_frameRateScaling;
    bulletTracks[g3].velZ = sinMul(-g_simObjects[h].pitch, v3) << 5;
    v3 = cosMul(g_simObjects[h].pitch, v3);
    bulletTracks[g3].velX = sinMul(g_simObjects[h].heading.w, v3);
    bulletTracks[g3].velY = -cosMul(g_simObjects[h].heading.w, v3);
    bulletTracks[g3].posX = g_simObjects[h].posX;
    bulletTracks[g3].posY = g_simObjects[h].posY;
    bulletTracks[g3].alt = g_simObjects[h].alt;

after_missile_table:
    a = clampRange((h & 3) + g_missionStatus, 0, 2);
    if (h == 0) a = 1;
    d = g_simObjects[h].heading.w;
    if (abs(g_simObjects[h].bank.w) < 0x4000) {
        d += g_simObjects[h].bank.w >> 2;
    }
    r = (int)(b - d) >> 13 & 7;
    d = g_ourHead;
    if (abs(g_ourRoll) < 0x4000) {
        d += g_ourRoll >> 1;
    }
    t = ((g_simObjects[h].heading.w - d) >> 13) + 4 & 7;
    {
        register int ak;
        ak = g_maneuverTable[a][r][t];
        l = (ak & 0xf) << 12;
        if (ak == 0x100) {
            p = 0x6000;
            l = ((frameTick >> 8) & 8) * 0x1000 - 0x4000;
        }
    }
    if (g_maneuverTable[a][r][t] == 0x200) {
        p = (int16)0xa000;
        l = (((frameTick >> 8) & 8) - 4) * -0x1000;
    }
    if (p == (int16)0xa000) {
        if (-((g_simObjects[h].pitch >> 3) - 3000) > g_simObjects[h].alt) {
            p = g_simObjects[h].pitch + 0x1000;
        }
    }
    if (abs(g_simObjects[h].bank.w) > 0x4000) {
        p = l = 0;
    }
    goto after_accel;
    }

    l = clampRange(b - g_simObjects[h].heading.w, -0x3000, 0x3000) << 1;
    if (w == 1 && g_missionStatus + 1 <= g_enemyThreatCount) {
        l = 0x3000;
    }

after_accel:
    if (w == 1 && (g_planeTable.planes[g_closestThreatIndex].flags & 0x400) && g_nearestThreatRange < 0x780) {
        l = 0x3000;
    }

    l = clampRange(l, -aircraftTypes[g_threatSpec].maneuverability * 0x1000,
                  aircraftTypes[g_threatSpec].maneuverability * 0x1000);
    l = clampRange(l - g_simObjects[h].bank.w,
                  -aircraftTypes[g_threatSpec].maneuverability * 256,
                  aircraftTypes[g_threatSpec].maneuverability * 256);

    if ((g_simObjects[h].flags.w) & 0x400) {
        if (g_simObjects[h].speed < 0x96) {
            g_simObjects[h].pitch = 0;
        } else {
            g_simObjects[h].pitch += 0x100;
        }
        l = 0;
        if (g_simObjects[h].speed < aircraftTypes[g_threatSpec].maxSpeed) {
            g_simObjects[h].speed += 0x3c / g_frameRateScaling;
        } else if (g_simObjects[h].alt > 300) {
            g_simObjects[h].flags.b[1] &= 0xfb;
        }
    }

    if (g_simObjects[h].flags.b[0] & 0x30) {
        l = 0x400;
    }

    if (((uint8)h & 3) == (frameTick & 3)) {
        testWorldPosVisible(g_simObjects[h].posX,
                  g_simObjects[h].posY,
                  g_simObjects[h].alt);
        if (*(int8 *)&g_posVisibleFlag != 0) {
            g_simObjects[h].flags.b[1] |= 0x20;
        } else {
            g_simObjects[h].flags.b[1] &= 0xdf;
        }
    }

    if ((g_simObjects[h].flags.w) & 0x2000) {
        p = 0x3000;
    }

    if (g_missionTick < 10) {
        l >>= 2;
    }

    {
    register int u = h * 0x24;
    g_simObjects[h].bank.w += (l * (g_missionStatus + 2)) / g_frameRateScaling;
    g_simObjects[h].heading.w += (g_simObjects[h].bank.w >> 3) / g_frameRateScaling;

    j = p - g_simObjects[h].pitch;
    if (!(g_simObjects[h].flags.b[0] & 0x20)) goto no_smoke;
    j = -0x200;
    if (frameTick & 3) goto no_smoke;
    ma = (frameTick >> 1) & 7;
    g_particles[ma].posX = *(int16 *)((char *)g_simObjects + u + 2);
    }
    {
    register int t = ma * 8;
    register int v = h * 0x24;
    /* g_particles[ma] via register offset t: idiomatic g_particles[ma].field_N
       recomputes ma*8 and shifts register allocation (verify mismatch). */
    *(int16 *)((char *)g_particles + t + 2) = *(int16 *)((char *)g_simObjects + v + 4);
    *(int16 *)((char *)g_particles + t + 4) = *(int16 *)((char *)g_simObjects + v + 6);
    *(int16 *)((char *)g_particles + t + 6) = randomRange(0x20) << 11;
    g_smokeParticleSlot = ma;
    }
no_smoke:

    if (g_simObjects[h].pitch < 0 &&
        -(sinMul(g_simObjects[h].pitch, 2000) - 200) > g_simObjects[h].alt &&
        ((g_simObjects[h].flags.w) & 0x220) == 0) {
        j = 0x400;
    }

    j = clampRange(j, -0x400, 0x400);
    g_simObjects[h].pitch += (j << 2) / g_frameRateScaling;
    if (abs(g_simObjects[h].pitch) > 0x4000) {
        g_simObjects[h].heading.b[1] += (char)0x80;
        g_simObjects[h].bank.b[1] += (char)0x80;
        g_simObjects[h].pitch = (int16)0x8000 - g_simObjects[h].pitch;
    }

    g_simObjects[h].flags.b[0] &= 0xef;

    u2 = (int)((unsigned long)(unsigned)(-(g_simObjects[h].pitch / 2 + (int16)0x8000))
            * (long)g_simObjects[h].speed >> 14);
    u2 -= abs(sinMul(g_simObjects[h].bank.w, u2)) >> 1;
    u2 = u2 * 4 / g_frameRateScaling;
    u2 >>= 2;

    m0 = cosMul(g_simObjects[h].pitch, u2);

    g_simObjects[h].worldX += (long)sinMul(g_simObjects[h].heading.w, m0);
    g_simObjects[h].worldY -= (long)cosMul(g_simObjects[h].heading.w, m0);

    g_simObjects[h].alt += sinMul(g_simObjects[h].pitch, u2);

    g_simObjects[h].posX = (int16)(g_simObjects[h].worldX >> 5);
    g_simObjects[h].posY = (int16)(g_simObjects[h].worldY >> 5);

    if (g_simObjects[h].alt <= 30000) goto alt_ok;
    g_simObjects[h].pitch = 0;
alt_ok:

    if (g_simObjects[h].alt < 0) {
        (g_simObjects[h].flags.w) &= (h != 0) ? 0x1c1 : 0;
        g_hitMapX = g_simObjects[h].posX;
        g_hitMapY = g_simObjects[h].posY;
        g_hitAlt = g_simObjects[h].alt;
        g_hitEffectTimer = -8;
        if (h == g_airTargetLock) {
            g_airTargetLock = -1;
        }
    }

    if ((unsigned)e1 < 0x10 && w == 2) {
        if ((g_simObjects[h].flags.w) & 0x200) {
            (g_simObjects[h].flags.w) |= 0x1000;
        } else {
            (g_simObjects[h].flags.w) |= 0x200;
        }
    }

    if ((g_simObjects[h].flags.w) & 0x1000) {
        g_simObjects[h].bank.w = g_simObjects[h].pitch = 0;        g_simObjects[h].heading.w = (g_northSouthSign == 1) ? 0 : (int16)0x8000;
        g_simObjects[h].alt = (g_planeTable.planes[g_closestThreatIndex].flags & 0x200) ? 0x8c : 0x0c;
        if (g_simObjects[h].speed > 0) {
            g_simObjects[h].speed -= 0x78 / g_frameRateScaling;
        } else {
            (g_simObjects[h].flags.w) &= 0x1c1;
            if (h == 0 && g_targetSlots[0].state >= 5) {
                (g_simObjects[h].flags.w) = 0;
            }
        }
        if (h >= g_groundUnitCount - 4 && g_simObjects[h].speed < 100) {
            (g_simObjects[h].flags.w) &= 0x1c1;
            (g_simObjects[h].flags.w) |= 0x406;
        }
    }

    if (--g_simObjects[h].timer == 0) {
        g_simObjects[h].flags.b[0] |= 4;
        f = 0x7fff;
        for (y = 3; y < g_planeScanCount; y++) {
            if ((g_planeTable.planes[y].flags & 0x101) == 1) {
                ma = rangeApprox(g_simObjects[h].posX - g_planeTable.planes[y].mapX,
                              g_simObjects[h].posY - g_planeTable.planes[y].mapY);
                if (ma < f) {
                    *(int16 *)&g_simObjects[h].objType = y;
                    f = ma;
                }
            }
        }
    }

    g_simObjects[h].terrainColor = readMapPixelColor(
        g_simObjects[h].posX,
        g_simObjects[h].posY);

    {
    register char o;
    o = g_simObjects[h].flags.b[0];
    if ((o & 2) &&
        (x = (((uint8)h & 8) >> 3) + (h & 7) * 2,
         frameTick % (g_frameRateScaling << 4) == x * g_frameRateScaling) &&
        !(o & 0x20)) {
        fireAirThreat(h);
    }
    }
    } else {
    if (((uint8)h & 7) == (((uint8)(g_missionTick >> 4)) & 7)) {
    if (h < g_groundUnitCount - 4) {
    if (h != 0) {
    if (0xe0 / (g_missionStatus + 2) < g_missionTick - g_lastSpawnTick) {
    s = randomRange(g_planeScanCount);
    if (g_threatActiveTimer != 0 || (g_simObjects[h].flags.b[0] & 0x80)) {
    if ((g_planeTable.planes[s].flags & 0x181) == 1) {
    if (g_simObjects[h].spec == g_planeTable.planes[s].alertLevel) {
    if (g_missionStatus * 2 >= g_enemyThreatCount) {
    aj = g_threatRefX - g_planeTable.planes[s].mapX;
    z2 = g_threatRefY - g_planeTable.planes[s].mapY;
    e1 = (unsigned)rangeApprox(aj, z2) >> 6;
    c = aircraftTypes[g_threatSpec].range;
    if ((unsigned)(c / 2) > (unsigned)e1) {
        g_lastSpawnTick = g_missionTick;
        spawnEnemyAircraft(h, s);
        scheduleEventCheck(h + 0x20, 2);
    }
    }}}}}}}}
    }
    }
    }
}
