// seg000 non-debug code (/Gs, no /Zi)
// Functions whose block scheduling only matches when compiled without /Zi.
#include "egcombat.h"
#include "egdata.h"
#include "egframe.h"
#include "egkeys.h"
#include "egmath.h"
#include "egtacmap.h"
#include "egthreat.h"
#include "egtypes.h"
#include "egui.h"
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

/* Private helpers for this translation unit. */
void fireGroundThreat(int planeIdx);

// ==== seg000:0x6172 ====
void updateThreatSites()
{
    int p, arcRadius, b, c, siteIdx, e;

    if ((g_scopeSweepTimer == 0 || g_prevScopeRange != g_threatScopeRange) && g_hudVisible != 0) {
        if (g_scopeSweepTimer == 0 && g_mapMode == 0) {
            restoreScopePanel();
            g_scopeArcStart = 0;
            g_scopeArcEnd = 0x100;
        }
    }

    for (siteIdx = 0; siteIdx < g_targetEntityCount; siteIdx++) {
        if (g_planeTable.planes[siteIdx].active != 0 &&
            !(g_planeTable.planes[siteIdx].flags & 0x80) &&
            ((siteIdx * (frameTick >> 10) * 7 & 7) <= 7 ||
            g_planeTable.planes[siteIdx].alertLevel != 0 ||
            (g_planeTable.planes[siteIdx].flags & 0x100) != 0)) {
            g_planeTable.planes[siteIdx].threatTimer -= 1;
            if (g_planeTable.planes[siteIdx].threatTimer <= 0) {
                g_planeTable.planes[siteIdx].threatTimer =
                    ((int)(char)g_frameRateScaling << 8) /
                    ((g_planeTable.planes[siteIdx].alertLevel >> 3) + 0x20) + siteIdx / 2;
            }
            if (g_planeTable.planes[siteIdx].threatTimer == 4 && g_scopeSweepTimer < 0) {
                fireGroundThreat(siteIdx);
                g_planeTable.planes[siteIdx].flags |= 0x02;
            }
        } else {
            g_planeTable.planes[siteIdx].flags &= ~0x02;
        }
    }

    if (commData->gfxModeNum == 0) {
        g_scopeArcColor = 0;
    }

    if (g_mapMode == 0 && g_scopeSweepTimer > 0 && g_hudVisible != 0 && g_scopeArcRange > 1) {
        if (g_detailLevel != 0 && commData->gfxModeNum != 0) {
            captureScopePanel();
            arcRadius = (int)((long)clampRange(g_frameRateScaling - g_scopeSweepTimer, 1, g_frameRateScaling) * (long)g_scopeArcRange / (long)g_frameRateScaling) << 6;
        } else {
            arcRadius = g_scopeArcRange << 6;
            g_scopeArcRange = 0;
        }
        if (g_threatLabelTarget >= 0) {
            drawMapRangeArc(g_planeTable.planes[g_threatLabelTarget].mapX,
                      g_planeTable.planes[g_threatLabelTarget].mapY,
                      arcRadius, g_scopeArcColor, g_threatRadarFlag,
                      g_scopeArcStart, g_scopeArcEnd);
        }
    }

    g_scopeSweepTimer--;
}

/* ---- merged from egflt.c ---- */
void fireGroundThreat(int planeIdx)
{
    int bearing[11];
    unsigned int range[4];
    int clampedRange;
    int threatType;
    int slot;
    int m;
    int n;
    int score;

    threatType = g_planeTable.planes[planeIdx].active;
    score = computeThreatRangeBearing(g_planeTable.planes[planeIdx].mapX, g_planeTable.planes[planeIdx].mapY, 0, threatType, bearing, (int *)range);
    g_threatToneLevel = 0;
    if (score > 0) {
        clampedRange = score;
        if (clampedRange > 99) {
            clampedRange = 99;
        }
        g_threatToneLevel = 4;
        if (score + g_threatScopeRange > 50) {
            g_threatToneLevel = 0x0c;
        }
        if (score + g_threatScopeRange > 100) {
            g_threatToneLevel = 0x0e;
        }
        g_scopeArcRange = score;
        g_scopeSweepTimer = g_frameRateScaling;
        g_threatLabelTarget = planeIdx;
        g_threatRadarFlag = aNone[threatType].flags & 1;
        if (*(int16 *)&g_planeTable.planes[planeIdx].alertLevel != 0) {
            g_scopeArcStart = (bearing[0] >> 8) - 0x20;
            g_scopeArcEnd = (bearing[0] >> 8) + 0x20;
        }
        g_scopeArcColor = g_threatToneLevel;
        if (!(*(uint8 *)&g_planeTable.planes[planeIdx].flags & 4)) {
            *(uint8 *)&g_planeTable.planes[planeIdx].flags |= 4;
        }
    }
    if (score > range[0]) {
        *(int16 *)&g_planeTable.planes[planeIdx].alertLevel += (g_difficultyTier + g_missionStatus) * 32 + 32;
        if (*(int16 *)&g_planeTable.planes[planeIdx].alertLevel > 255) {
            *(int16 *)&g_planeTable.planes[planeIdx].alertLevel = 255;
        }
        if (!(g_planeTable.planes[planeIdx].flags & 0x100) && mapEvents[0].ttl == 0 &&
            *(int16 *)&g_planeTable.planes[planeIdx].alertLevel > 0x7f) {
            updateThreatAlert();
        }
        if (g_enemyThreatCount <= g_missionStatus) {
            if (*(int16 *)&g_planeTable.planes[planeIdx].alertLevel > 0xc0) {
                if (threatType != 0x15) {
                    if (g_nearestThreatRange > 0x500) {
                        if ((unsigned)-(g_missionStatus * 3 - 20) < range[0]) {
                            g_enemyAlertFlag++;
                            if (*(int16 *)&g_planeTable.planes[planeIdx].alertLevel >= 0xfa) {
                                slot = (g_missionStatus != 0) ? planeIdx % g_missionStatus : 0;
                                if (g_projectiles[slot].ttl == 0) {
                                    if (sams[threatType].lockRange > (unsigned)range[0]) {
                                        threatType = threatType;
                                        g_projectiles[slot].mapX = g_planeTable.planes[planeIdx].mapX + 8;
                                        slot = slot;
                                        planeIdx = planeIdx;
                                        g_projectiles[slot].mapY = g_planeTable.planes[planeIdx].mapY;
                                        g_projectiles[slot].alt = 0;
                                        g_projectiles[slot].speed = 1;
                                        g_projectiles[slot].worldX = bearing[0];
                                        g_projectiles[slot].worldY = 0x4000;
                                        g_projectiles[slot].ttl = (int)((((long)sams[threatType].lockRange << 3) * (long)g_frameRateScaling) / (long)(sams[threatType].maxSpeed >> 6));
                                        *(int16 *)&g_projectiles[slot].state[0] = threatType;
                                        *(int16 *)&g_projectiles[slot].state[6] = planeIdx;

                                        placeString(planeIdx);
                                        strcat((char *)strBuf, (char *)aFiring);
                                        strcat((char *)strBuf, (char *)&sams[threatType]);
                                        tempStrcpy((char *)strBuf);
                                        makeSound(6, 2);
                                        scheduleEventCheck(planeIdx + 0x40, 2);
                                        commData->restartFlag++;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        *(uint8 *)&g_planeTable.planes[planeIdx].flags |= 0x10;
    } else {
        *(uint8 *)&g_planeTable.planes[planeIdx].flags &= 0xEF;
        *(int16 *)&g_planeTable.planes[planeIdx].alertLevel -= 0x10;
        if (*(int16 *)&g_planeTable.planes[planeIdx].alertLevel < 0) {
            *(int16 *)&g_planeTable.planes[planeIdx].alertLevel = 0;
        }
    }
}

// ==== seg000:0x660e routine_324 ====
int computeThreatRangeBearing(int threatX, int threatY, int threatAlt, int threatType, int *outBearing, int *outRange) {
    int p;
    int a;
    int bearing;
    int range;
    int deltaX;
    int deltaY;
    unsigned score;

    if (threatType == 0 || threatType == -1) {
        return 0;
    }
    deltaX = g_viewX_ - threatX;
    deltaY = g_viewY_ - threatY;
    range = (unsigned)rangeApprox(deltaX, deltaY) >> 6;
    bearing = computeBearing(deltaX, -deltaY);
    score = (score = (aNone[threatType].dangerTier + g_missionStatus * 2 + 3) * aNone[threatType].lethality / 16) * (((unsigned)g_viewZ >> 6) + 0x40) >> 7;
    *outBearing = bearing;
    *outRange = range;
    return score;
}

// ==== seg000:0x66be ====
void updateThreatAlert(void) {
    int planeIdx;
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
    for (planeIdx = 0; planeIdx < g_planeScanCount; planeIdx++) {
        if (g_planeTable.planes[planeIdx].active != 0) {
            *(int *)&g_planeTable.planes[planeIdx].alertLevel = clampRange(*(int *)&g_planeTable.planes[planeIdx].alertLevel, ((g_missionStatus + g_difficultyTier) << 4) - 16, 0xFF);
        }
    }
}

// ==== seg000:0x6742 ====
int computeThreatScore(void) {
    int threatType;
    int idx;
    int score;

    score = 0;
    for (idx = 0; idx < g_targetEntityCount; idx++) {
        threatType = g_planeTable.planes[idx].active;
        if (threatType != 0) {
            score += aNone[threatType].lethality * aNone[threatType].dangerTier * (g_missionStatus + 2) / 64;
        }
    }
    score /= 100;
    return score;
}

// ==== seg000:0x67b4 ====
void updateObjects(void)
{
    int candBearing, pitchCmd, viewBearing, aggrIdx, bearing, relBearing, tgtIdx, acRange, hdg, aspect, u0, e0, best, range, moveAmt, mode, fireOffset, objIdx, vel, scanIdx, pitchDelta, trackSlot, tgtX, deltaX, deltaY, rollCmd, horizMove, tgtY, smokeSlot, tgtZ;

    if ((frameTick & 1) == 0 && g_smokeSourceIdx == -1) {
        g_particles[(frameTick >> 1) & 7].posX = 0;
    }

    bulletTracks[((frameTick >> 2) & 3) + g_bulletTrackCount].posX = 0;

    g_enemyThreatCount = g_activeThreatCount;
    g_activeThreatCount = 0;
    for (objIdx = 0; objIdx < g_groundUnitCount; objIdx++) {
    if (g_simObjects[objIdx].flags.b[0] & 1) {
    g_threatSpec = g_simObjects[objIdx].spec;
    if ((g_simObjects[objIdx].flags.b[0] & 2) && g_simObjects[objIdx].speed != 0) {
    mode = 0;
    if (!(g_simObjects[objIdx].flags.b[0] & 4)) {
    if (g_threatActiveTimer != 0 && (!((g_simObjects[objIdx].flags.w) & 0x140) || g_threatActiveTimer > g_threatDisplayTtl)) {
        tgtX = g_threatRefX;
        tgtY = g_threatRefY;
        tgtZ = g_threatRefZ;
        mode = 1;
        if (mapEvents[0].ttl != 0) goto padlock_target;
        goto got_target;
    }

    mode = 3;
    if ((g_simObjects[objIdx].flags.w) & 0x100) {
    if (g_padlockAircraft != -1) {
        tgtX = sinMul((objIdx & 7) * 0x800 + g_simObjects[g_padlockAircraft].heading.w - 0x1800,
                      g_simObjects[g_padlockAircraft].speed)
            + g_simObjects[g_padlockAircraft].posX;

        tgtY = g_simObjects[g_padlockAircraft].posY -
            cosMul((objIdx & 7) * 0x800 + g_simObjects[g_padlockAircraft].heading.w - 0x1800,
                      g_simObjects[g_padlockAircraft].speed);

        tgtZ = g_simObjects[g_padlockAircraft].alt + (objIdx & 7) * 0x40;
        goto set_target_alt;
    }
    }

    if (((uint8)objIdx * 8 + (uint8)g_missionTick) & 0xbf) goto after_retarget;
    if (!(g_simObjects[objIdx].flags.b[0] & 0x40)) {
    best = 0x7fff;
    viewBearing = computeBearing(g_viewX_ - g_simObjects[objIdx].posX,
                   g_simObjects[objIdx].posY - g_viewY_);
    for (scanIdx = 0; scanIdx < 8; scanIdx++) {
        tgtIdx = randomRange(g_planeCount) + 1;
        if (!(g_planeTable.planes[tgtIdx].flags & 0x400)) {
            candBearing = computeBearing(g_planeTable.planes[tgtIdx].mapX - g_simObjects[objIdx].posX,
                          g_simObjects[objIdx].posY - g_planeTable.planes[tgtIdx].mapY);
            if (abs(viewBearing - candBearing) < best) {
                best = abs(viewBearing - candBearing);
                g_simObjects[objIdx].objType = tgtIdx;
                if (-(g_missionStatus * 0x1000 - 0x4000) > best) break;
            }
        }
    }
    if ((unsigned)rangeApprox(g_viewX_ - g_simObjects[objIdx].posX,
                  g_viewY_ - g_simObjects[objIdx].posY) >> 6 > 0x15e && objIdx != 0) {
        (g_simObjects[objIdx].flags.w) &= 0x1c1;
        g_simObjects[objIdx].timer = 0;
    }
    }

after_retarget:
    tgtIdx = *(int16 *)&g_simObjects[objIdx].objType;
    tgtX = g_planeTable.planes[tgtIdx].mapX;
    tgtY = g_planeTable.planes[tgtIdx].mapY;
    tgtZ = clampRange(g_viewZ + 1000, 5000, 20000);
set_target_alt:
    tgtZ = tgtZ;
    goto got_target;
padlock_target:
    tgtX = mapEvents[0].mapX;
    tgtY = mapEvents[0].mapY;
    tgtZ = clampRange(g_viewZ, 1000, 30000);
    goto got_target;
    }

    tgtX = g_planeTable.planes[*(int16 *)&g_simObjects[objIdx].objType].mapX;
    if ((g_simObjects[objIdx].flags.w) & 0x200) {
        tgtZ = g_simObjects[objIdx].posX - tgtX;
        tgtY = g_planeTable.planes[*(int16 *)&g_simObjects[objIdx].objType].mapY;
        tgtX = tgtX - tgtZ * 2;
        tgtZ = ((g_planeTable.planes[*(int16 *)&g_simObjects[objIdx].objType].flags + abs(tgtZ)) & 0x200)
            ? 0x8c : 0x0c;
    } else {
        tgtY = g_planeTable.planes[*(int16 *)&g_simObjects[objIdx].objType].mapY + g_northSouthSign * 0x500;
        tgtZ = rangeApprox(g_simObjects[objIdx].posX - tgtX,
                      g_simObjects[objIdx].posY - tgtY) + 2000;
    }
    mode = 2;

got_target:
    if (mode == 3 && (g_simObjects[objIdx].flags.b[0] & 8)) {
        tgtX = g_viewX_;
        tgtY = g_viewY_;
        tgtZ = g_simObjects[objIdx].alt;
    }
    deltaX = tgtX - g_simObjects[objIdx].posX;
    deltaY = tgtY - g_simObjects[objIdx].posY;
    bearing = computeBearing(deltaX, -deltaY);
    range = rangeApprox(deltaX, deltaY);
    pitchCmd = computeBearing((tgtZ - g_simObjects[objIdx].alt) >> 5, range);
    pitchCmd = clampRange(pitchCmd, -0x2000, 0x1000);
    if (mode == 1 && (unsigned)range < 0x600) {
    g_activeThreatCount++;
    if ((unsigned)range >= 0x400) goto after_missile_table;
    if (frameTick & 3) goto after_missile_table;
    if (abs(g_simObjects[objIdx].heading.w - bearing) >= 0x800) goto after_missile_table;
    if (abs(g_simObjects[objIdx].pitch - pitchCmd) >= 0x800) goto after_missile_table;

    trackSlot = ((frameTick >> 2) & 3) + g_bulletTrackCount;
    vel = 0x138 / g_frameRateScaling;
    bulletTracks[trackSlot].velZ = sinMul(-g_simObjects[objIdx].pitch, vel) << 5;
    vel = cosMul(g_simObjects[objIdx].pitch, vel);
    bulletTracks[trackSlot].velX = sinMul(g_simObjects[objIdx].heading.w, vel);
    bulletTracks[trackSlot].velY = -cosMul(g_simObjects[objIdx].heading.w, vel);
    bulletTracks[trackSlot].posX = g_simObjects[objIdx].posX;
    bulletTracks[trackSlot].posY = g_simObjects[objIdx].posY;
    bulletTracks[trackSlot].alt = g_simObjects[objIdx].alt;

after_missile_table:
    aggrIdx = clampRange((objIdx & 3) + g_missionStatus, 0, 2);
    if (objIdx == 0) aggrIdx = 1;
    hdg = g_simObjects[objIdx].heading.w;
    if (abs(g_simObjects[objIdx].bank.w) < 0x4000) {
        hdg += g_simObjects[objIdx].bank.w >> 2;
    }
    relBearing = (int)(bearing - hdg) >> 13 & 7;
    hdg = g_ourHead;
    if (abs(g_ourRoll) < 0x4000) {
        hdg += g_ourRoll >> 1;
    }
    aspect = ((g_simObjects[objIdx].heading.w - hdg) >> 13) + 4 & 7;
    {
        register int maneuver;
        maneuver = g_maneuverTable[aggrIdx][relBearing][aspect];
        rollCmd = (maneuver & 0xf) << 12;
        if (maneuver == 0x100) {
            pitchCmd = 0x6000;
            rollCmd = ((frameTick >> 8) & 8) * 0x1000 - 0x4000;
        }
    }
    if (g_maneuverTable[aggrIdx][relBearing][aspect] == 0x200) {
        pitchCmd = (int16)0xa000;
        rollCmd = (((frameTick >> 8) & 8) - 4) * -0x1000;
    }
    if (pitchCmd == (int16)0xa000) {
        if (-((g_simObjects[objIdx].pitch >> 3) - 3000) > g_simObjects[objIdx].alt) {
            pitchCmd = g_simObjects[objIdx].pitch + 0x1000;
        }
    }
    if (abs(g_simObjects[objIdx].bank.w) > 0x4000) {
        pitchCmd = rollCmd = 0;
    }
    goto after_accel;
    }

    rollCmd = clampRange(bearing - g_simObjects[objIdx].heading.w, -0x3000, 0x3000) << 1;
    if (mode == 1 && g_missionStatus + 1 <= g_enemyThreatCount) {
        rollCmd = 0x3000;
    }

after_accel:
    if (mode == 1 && (g_planeTable.planes[g_closestThreatIndex].flags & 0x400) && g_nearestThreatRange < 0x780) {
        rollCmd = 0x3000;
    }

    rollCmd = clampRange(rollCmd, -aircraftTypes[g_threatSpec].maneuverability * 0x1000,
                  aircraftTypes[g_threatSpec].maneuverability * 0x1000);
    rollCmd = clampRange(rollCmd - g_simObjects[objIdx].bank.w,
                  -aircraftTypes[g_threatSpec].maneuverability * 256,
                  aircraftTypes[g_threatSpec].maneuverability * 256);

    if ((g_simObjects[objIdx].flags.w) & 0x400) {
        if (g_simObjects[objIdx].speed < 0x96) {
            g_simObjects[objIdx].pitch = 0;
        } else {
            g_simObjects[objIdx].pitch += 0x100;
        }
        rollCmd = 0;
        if (g_simObjects[objIdx].speed < aircraftTypes[g_threatSpec].maxSpeed) {
            g_simObjects[objIdx].speed += 0x3c / g_frameRateScaling;
        } else if (g_simObjects[objIdx].alt > 300) {
            g_simObjects[objIdx].flags.b[1] &= 0xfb;
        }
    }

    if (g_simObjects[objIdx].flags.b[0] & 0x30) {
        rollCmd = 0x400;
    }

    if (((uint8)objIdx & 3) == (frameTick & 3)) {
        testWorldPosVisible(g_simObjects[objIdx].posX,
                  g_simObjects[objIdx].posY,
                  g_simObjects[objIdx].alt);
        if (*(int8 *)&g_posVisibleFlag != 0) {
            g_simObjects[objIdx].flags.b[1] |= 0x20;
        } else {
            g_simObjects[objIdx].flags.b[1] &= 0xdf;
        }
    }

    if ((g_simObjects[objIdx].flags.w) & 0x2000) {
        pitchCmd = 0x3000;
    }

    if (g_missionTick < 10) {
        rollCmd >>= 2;
    }

    {
    register int u = objIdx * 0x24;
    g_simObjects[objIdx].bank.w += (rollCmd * (g_missionStatus + 2)) / g_frameRateScaling;
    g_simObjects[objIdx].heading.w += (g_simObjects[objIdx].bank.w >> 3) / g_frameRateScaling;

    pitchDelta = pitchCmd - g_simObjects[objIdx].pitch;
    if (!(g_simObjects[objIdx].flags.b[0] & 0x20)) goto no_smoke;
    pitchDelta = -0x200;
    if (frameTick & 3) goto no_smoke;
    smokeSlot = (frameTick >> 1) & 7;
    g_particles[smokeSlot].posX = *(int16 *)((char *)g_simObjects + u + 2);
    }
    {
    register int t = smokeSlot * 8;
    register int v = objIdx * 0x24;
    /* g_particles[ma] via register offset t: idiomatic g_particles[ma].field_N
       recomputes ma*8 and shifts register allocation (verify mismatch). */
    *(int16 *)((char *)g_particles + t + 2) = *(int16 *)((char *)g_simObjects + v + 4);
    *(int16 *)((char *)g_particles + t + 4) = *(int16 *)((char *)g_simObjects + v + 6);
    *(int16 *)((char *)g_particles + t + 6) = randomRange(0x20) << 11;
    g_smokeParticleSlot = smokeSlot;
    }
no_smoke:

    if (g_simObjects[objIdx].pitch < 0 &&
        -(sinMul(g_simObjects[objIdx].pitch, 2000) - 200) > g_simObjects[objIdx].alt &&
        ((g_simObjects[objIdx].flags.w) & 0x220) == 0) {
        pitchDelta = 0x400;
    }

    pitchDelta = clampRange(pitchDelta, -0x400, 0x400);
    g_simObjects[objIdx].pitch += (pitchDelta << 2) / g_frameRateScaling;
    if (abs(g_simObjects[objIdx].pitch) > 0x4000) {
        g_simObjects[objIdx].heading.b[1] += (char)0x80;
        g_simObjects[objIdx].bank.b[1] += (char)0x80;
        g_simObjects[objIdx].pitch = (int16)0x8000 - g_simObjects[objIdx].pitch;
    }

    g_simObjects[objIdx].flags.b[0] &= 0xef;

    moveAmt = (int)((unsigned long)(unsigned)(-(g_simObjects[objIdx].pitch / 2 + (int16)0x8000))
            * (long)g_simObjects[objIdx].speed >> 14);
    moveAmt -= abs(sinMul(g_simObjects[objIdx].bank.w, moveAmt)) >> 1;
    moveAmt = moveAmt * 4 / g_frameRateScaling;
    moveAmt >>= 2;

    horizMove = cosMul(g_simObjects[objIdx].pitch, moveAmt);

    g_simObjects[objIdx].worldX += (long)sinMul(g_simObjects[objIdx].heading.w, horizMove);
    g_simObjects[objIdx].worldY -= (long)cosMul(g_simObjects[objIdx].heading.w, horizMove);

    g_simObjects[objIdx].alt += sinMul(g_simObjects[objIdx].pitch, moveAmt);

    g_simObjects[objIdx].posX = (int16)(g_simObjects[objIdx].worldX >> 5);
    g_simObjects[objIdx].posY = (int16)(g_simObjects[objIdx].worldY >> 5);

    if (g_simObjects[objIdx].alt <= 30000) goto alt_ok;
    g_simObjects[objIdx].pitch = 0;
alt_ok:

    if (g_simObjects[objIdx].alt < 0) {
        (g_simObjects[objIdx].flags.w) &= (objIdx != 0) ? 0x1c1 : 0;
        g_hitMapX = g_simObjects[objIdx].posX;
        g_hitMapY = g_simObjects[objIdx].posY;
        g_hitAlt = g_simObjects[objIdx].alt;
        g_hitEffectTimer = -8;
        if (objIdx == g_airTargetLock) {
            g_airTargetLock = -1;
        }
    }

    if ((unsigned)range < 0x10 && mode == 2) {
        if ((g_simObjects[objIdx].flags.w) & 0x200) {
            (g_simObjects[objIdx].flags.w) |= 0x1000;
        } else {
            (g_simObjects[objIdx].flags.w) |= 0x200;
        }
    }

    if ((g_simObjects[objIdx].flags.w) & 0x1000) {
        g_simObjects[objIdx].bank.w = g_simObjects[objIdx].pitch = 0;        g_simObjects[objIdx].heading.w = (g_northSouthSign == 1) ? 0 : (int16)0x8000;
        g_simObjects[objIdx].alt = (g_planeTable.planes[g_closestThreatIndex].flags & 0x200) ? 0x8c : 0x0c;
        if (g_simObjects[objIdx].speed > 0) {
            g_simObjects[objIdx].speed -= 0x78 / g_frameRateScaling;
        } else {
            (g_simObjects[objIdx].flags.w) &= 0x1c1;
            if (objIdx == 0 && g_targetSlots[0].state >= 5) {
                (g_simObjects[objIdx].flags.w) = 0;
            }
        }
        if (objIdx >= g_groundUnitCount - 4 && g_simObjects[objIdx].speed < 100) {
            (g_simObjects[objIdx].flags.w) &= 0x1c1;
            (g_simObjects[objIdx].flags.w) |= 0x406;
        }
    }

    if (--g_simObjects[objIdx].timer == 0) {
        g_simObjects[objIdx].flags.b[0] |= 4;
        best = 0x7fff;
        for (scanIdx = 3; scanIdx < g_planeScanCount; scanIdx++) {
            if ((g_planeTable.planes[scanIdx].flags & 0x101) == 1) {
                smokeSlot = rangeApprox(g_simObjects[objIdx].posX - g_planeTable.planes[scanIdx].mapX,
                              g_simObjects[objIdx].posY - g_planeTable.planes[scanIdx].mapY);
                if (smokeSlot < best) {
                    *(int16 *)&g_simObjects[objIdx].objType = scanIdx;
                    best = smokeSlot;
                }
            }
        }
    }

    g_simObjects[objIdx].terrainColor = readMapPixelColor(
        g_simObjects[objIdx].posX,
        g_simObjects[objIdx].posY);

    {
    register char o;
    o = g_simObjects[objIdx].flags.b[0];
    if ((o & 2) &&
        (fireOffset = (((uint8)objIdx & 8) >> 3) + (objIdx & 7) * 2,
         frameTick % (g_frameRateScaling << 4) == fireOffset * g_frameRateScaling) &&
        !(o & 0x20)) {
        fireAirThreat(objIdx);
    }
    }
    } else {
    if (((uint8)objIdx & 7) == (((uint8)(g_missionTick >> 4)) & 7)) {
    if (objIdx < g_groundUnitCount - 4) {
    if (objIdx != 0) {
    if (0xe0 / (g_missionStatus + 2) < g_missionTick - g_lastSpawnTick) {
    tgtIdx = randomRange(g_planeScanCount);
    if (g_threatActiveTimer != 0 || (g_simObjects[objIdx].flags.b[0] & 0x80)) {
    if ((g_planeTable.planes[tgtIdx].flags & 0x181) == 1) {
    if (g_simObjects[objIdx].spec == g_planeTable.planes[tgtIdx].alertLevel) {
    if (g_missionStatus * 2 >= g_enemyThreatCount) {
    deltaX = g_threatRefX - g_planeTable.planes[tgtIdx].mapX;
    deltaY = g_threatRefY - g_planeTable.planes[tgtIdx].mapY;
    range = (unsigned)rangeApprox(deltaX, deltaY) >> 6;
    acRange = aircraftTypes[g_threatSpec].range;
    if ((unsigned)(acRange / 2) > (unsigned)range) {
        g_lastSpawnTick = g_missionTick;
        spawnEnemyAircraft(objIdx, tgtIdx);
        scheduleEventCheck(objIdx + 0x20, 2);
    }
    }}}}}}}}
    }
    }
    }
}
