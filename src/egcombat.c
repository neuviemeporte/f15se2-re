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


void fireAirThreat(int param_1)
{
    int p, a, b, c, d, e, f;
    unsigned g;
    int h, i, j, k, l, m, n;

    i = aircraftTypes[g_threatSpec].modelId;

    m = computeThreatRangeBearing(
        g_simObjects[param_1].posX,
        g_simObjects[param_1].posY,
        g_simObjects[param_1].alt,
        i,
        &d, (int *)&g);

    g_threatToneLevel = 4;

    if ((unsigned)m > g) {
        /* close enough — increment heat */
        g_simObjects[param_1].damage += ((g_difficultyTier + g_missionStatus) * 16 + 0x20) >> ((g_playerPlaneFlags & 0x10) != 0);

        if (g_simObjects[param_1].damage > 0xc0) {
            g_enemyAlertFlag++;
            g_simObjects[param_1].flags.b[1] |= 0x40;
            updateThreatAlert();

            j = param_1 % (g_missionStatus + 1);

            if (g_missionStatus * 2 >= g_enemyThreatCount &&
                g_projectiles[j].ttl == 0 &&
                g > 8 &&
                abs(d - g_simObjects[param_1].heading.w) < 0x1800) {

                i = g_simObjects[param_1].weaponType;

                if (sams[i].lockRange > (g >> 1)) {
                if ((unsigned)(-(g_missionStatus * 3 - 0x10)) < g) {
                if (g < 0x1000) {
                if (i != 0) {

                    /* launch missile into slot j */
                    i = i;
                    g_projectiles[j].mapX = g_simObjects[param_1].posX;
                    g_projectiles[j].mapY = g_simObjects[param_1].posY;
                    j = j;
                    param_1 = param_1;
                    g_projectiles[j].alt = g_simObjects[param_1].alt - 0x19;
                    g_projectiles[j].speed = sams[i].maxSpeed >> 6;
                    g_projectiles[j].worldX = g_simObjects[param_1].heading.w;
                    g_projectiles[j].worldY = g_simObjects[param_1].pitch - 0x400;
                    g_projectiles[j].worldZ = g_simObjects[param_1].bank.w;

                    g_projectiles[j].ttl = (int)((((long)sams[i].lockRange << 3) * (long)g_frameRateScaling) / (long)g_projectiles[j].speed);

                    *(int16 *)&g_projectiles[j].state[0] = i;
                    j = j;
                    *(int16 *)&g_projectiles[j].state[6] = -param_1;

                    i = i;
                    strcpy((char *)strBuf, (char *)&sams[i].name);
                    strcat((char *)strBuf, (char *)aFiredBy);
                    strcat((char *)strBuf, aircraftTypes[g_threatSpec].name);
                    tempStrcpy((char *)strBuf);

                    makeSound(6, 2);
                    commData->restartFlag++;
                    scheduleEventCheck(param_1 + 0x20, 2);

                    if (randomRange(4) == 0) {
                        g_simObjects[param_1].flags.b[0] |= 4;
                    }
                }
                }
                }
                }
            }
        }
        g_simObjects[param_1].flags.b[0] |= 8;
    } else {
        g_simObjects[param_1].flags.b[0] &= 0xf7;
        g_simObjects[param_1].damage -= 0x20;
    }

    g_simObjects[param_1].damage =
        clampRange(g_simObjects[param_1].damage, 0, 0xff);
}

// ==== seg000:0x783A ====
void spawnEnemyAircraft(int slot, int objType)
{
    int p;

    p = g_simObjects[slot].spec;
    g_simObjects[slot].heading.w = (g_northSouthSign == 1) ? 0 : (int16)0x8000;
    if (g_planeTable.planes[objType].flags & 0x200) {
        g_simObjects[slot].posX = g_northSouthSign * 3 + g_planeTable.planes[objType].mapX;
        g_simObjects[slot].posY = g_planeTable.planes[objType].mapY - g_northSouthSign * 12;
        g_simObjects[slot].alt = 0x8c;
        g_simObjects[slot].speed = 100;
        g_simObjects[slot].heading.b[1] += 0xfc;
    } else {
        g_simObjects[slot].posX = g_planeTable.planes[objType].mapX;
        g_simObjects[slot].posY = 0x1e * g_northSouthSign + g_planeTable.planes[objType].mapY;
        g_simObjects[slot].alt = 0x0c;
        g_simObjects[slot].speed = 10;
    }
    g_simObjects[slot].worldX = (long)(uint16)g_simObjects[slot].posX << 5;
    g_simObjects[slot].worldY = (long)(uint16)g_simObjects[slot].posY << 5;
    g_simObjects[slot].pitch = 0;
    g_simObjects[slot].bank.w = 0;
    g_simObjects[slot].flags.w |= 0x403;
    g_simObjects[slot].objType = objType;
    g_simObjects[slot].timer = (int16)(((long)aircraftTypes[p].range << 11) * (long)g_frameRateScaling / (long)aircraftTypes[p].maxSpeed);
    g_simObjects[slot].terrainColor = readMapPixelColor(g_planeTable.planes[objType].mapX, g_planeTable.planes[objType].mapY);
    if (g_padlockAircraft == -1) {
        g_simObjects[slot].flags.b[1] &= 0xfe;
    }
    placeString(objType);
    strcat(strBuf, aDash);
    strcat(strBuf, aircraftTypes[g_simObjects[slot].spec].name);
    strcat(strBuf, aTakingOff);
    if (slot < g_groundUnitCount - 4) {
        tempStrcpy(strBuf);
    }
}

// ==== seg000:0x79ee ====
void updateThreatTargeting(void)
{
    int i, j, mode, spec, locked, aimY, bestIdx, step, delta;
    int viewX, viewY, alt0, bear, wpX, wpY, ring, acq, wp;
    unsigned best, dist;

    switchIndicatorColor(0, 8);
    switchIndicatorColor(1, 8);
    if (mapEvents[0].ttl != 0) {
        viewX = mapEvents[0].mapX;
        viewY = mapEvents[0].mapY;
    } else {
        viewX = g_viewX_;
        viewY = g_viewY_;
    }

    for (i = 0; i < 12; i++) {
        if (g_projectiles[i].ttl != 0) {
        spec = *(int16 *)&g_projectiles[i].state[0];
        locked = 0;
        aimY = 0;
        mode = sams[spec].weaponClass;

        if (i < 8) {
            i = i;
#ifdef BUGFIX
            plotMapObject(g_projectiles[i].mapX, g_projectiles[i].mapY, *(int16 *)&g_projectiles[i].state[4], 0);
#else
            plotMapObject(g_projectiles[i].mapX, g_projectiles[i].mapY, *(int16 *)&g_projectiles[i].state[4]);
#endif
            alt0 = g_viewZ;
            locked = samCanAcquireTarget(i, viewX, viewY, g_viewZ, mode);
            best = g_acqRange;
            aimY = g_acqAimY;
            j = 1;
            do {
                if ((mapEvents[j].type == 1 && mode <= 0) ||
                    (mapEvents[j].type == 2 &&
                     (mode == 1 || mode == 2 ||
                      (mode == 3 &&
                       -(g_missionStatus * 12 - 0x40) >
                           abs(abs((aimY - g_ourHead) >> 8) - 0x40))))) {
                    acq = samCanAcquireTarget(i, mapEvents[j].mapX,
                                              mapEvents[j].mapY, g_viewZ, mode);
                    if (acq != 0) {
                        aimY = acq;
                        locked = 0;
                    }
                }
                j++;
            } while (j < 4);

            if (best > 0x200) {
                if (*(int16 *)&g_projectiles[i].state[6] > 2 &&
                    !(g_planeTable.planes[*(int16 *)&g_projectiles[i].state[6]].flags & 0x10))
                    locked = 0;
                if (*(int16 *)&g_projectiles[i].state[6] <= 0 &&
                    !(g_simObjects[-*(int16 *)&g_projectiles[i].state[6]].flags.b[0] & 8))
                    locked = 0;
            }
            if (g_projectiles[i].speed < (sams[spec].maxSpeed >> 6) && (frameTick & 1))
                g_projectiles[i].speed++;
        } else {
            best = 0x7fff;
            if (mode == 7) {
                for (j = 0; j < g_groundUnitCount; j++) {
                    if ((g_simObjects[j].flags.b[0] & 2) &&
                        g_simObjects[j].speed != 0) {
                        acq = samCanAcquireTarget(i, g_simObjects[j].posX,
                                                  g_simObjects[j].posY,
                                                  g_simObjects[j].alt, mode);
                        if (g_acqRange < best && acq != 0) {
                            aimY = g_acqAimY;
                            best = g_acqRange;
                            bestIdx = j;
                            alt0 = g_simObjects[j].alt;
                            locked = 1;
                            if (best < 0x180) {
                                g_simObjects[j].flags.b[0] |= 0x10;
                                scheduleEventCheck(j + 0x20, 1);
                            }
                        }
                    }
                }
            }
            if (g_projectiles[i].speed < (sams[spec].maxSpeed >> 6) && (frameTick & 1)) {
                g_projectiles[i].speed++;
                aimY = g_projectiles[i].worldX;
            }
            if (mode == 4 || mode == 6 || mode == 5 || mode == 0x1c) {
                if (*(int16 *)&g_projectiles[i].state[4] == -1) {
                    for (j = 0; j < g_planeCount; j++) {
                        if ((mode != 4 || g_planeTable.planes[j].active != 0) &&
                            (((mode == 5 || mode == 6) && (g_planeTable.planes[j].flags & 8)) ||
                             (mode != 5 && !(g_planeTable.planes[j].flags & 8))) &&
                            (acq = samCanAcquireTarget(i, g_planeTable.planes[j].mapX,
                                                       g_planeTable.planes[j].mapY, 0, mode),
                             g_acqRange < best && acq != 0)) {
                            aimY = g_acqAimY;
                            best = g_acqRange;
                            bestIdx = j;
                            alt0 = 0;
                            locked = 1;
                        }
                    }
                } else {
                    j = *(int16 *)&g_projectiles[i].state[4];
                    acq = samCanAcquireTarget(i, g_planeTable.planes[j].mapX,
                                              g_planeTable.planes[j].mapY, 0, mode);
                    if (acq != 0) {
                        aimY = g_acqAimY;
                        best = g_acqRange;
                        bestIdx = j;
                        alt0 = 0;
                        locked = 1;
                        if (best < 0xc0)
                            scheduleEventCheck(j + 0x40, 1);
                    }
                }
            }
        }

        if (locked != 0 && i < 8 &&
            abs(g_acqAimY - g_projectiles[i].worldX) < 0x1000 && mapEvents[0].ttl == 0) {
            if (mode <= 0 && (frameTick & 2))
                switchIndicatorColor(1, 0xc);
            if (mode != 0 && !(frameTick & 2))
                switchIndicatorColor(0, 0xe);
            if ((frameTick & 3) == 0 && best < (unsigned)(g_projectiles[i].speed << 5)) {
                makeSound(10, 1);
                scheduleEventCheck(i, 2);
            }
        }

        if (aimY != 0 && locked != 0) {
            delta = aimY - g_projectiles[i].worldX;
            if (i < 8)
                delta = clampRange(delta, -(g_missionStatus + 1) << 8,
                                   (g_missionStatus + 1) << 8);
            delta = clampRange(delta, -(sams[spec].turnRate * 0x80),
                               sams[spec].turnRate * 0x80);
            g_projectiles[i].worldX += (delta << 2) / g_frameRateScaling;
            g_projectiles[i].worldZ = delta << 1;
            if (i < 8 && best < 0x400) {
                aimY = computeBearing((alt0 - g_projectiles[i].alt) >> 4, abs((int)best));
            } else {
                aimY = computeBearing(((alt0 - g_projectiles[i].alt) >> 5) +
                                          (abs((int)best) > 0x140 ? abs((int)best) >> 3 : 0),
                                      abs((int)best));
            }
            bear = aimY - g_projectiles[i].worldY;
            bear = clampRange(bear, -(sams[spec].turnRate << 0xb),
                              sams[spec].turnRate << 9);
            g_projectiles[i].worldY += (bear << 2) / g_frameRateScaling;
        } else {
            if (g_projectiles[i].worldY > 0 && mode != 0x1e)
                g_projectiles[i].worldY -=
                    (signOf(g_projectiles[i].worldY) << 0xc) / g_frameRateScaling;
        }

        if (mode == 0x1c && g_projectiles[i].worldY > -0x800)
            g_projectiles[i].worldY = -0x800;
        if (mode == 0x1e || g_projectiles[i].alt == 1) {
            if ((g_projectiles[i].worldY -= 0x800 / g_frameRateScaling) <
                *(int16 *)&g_projectiles[i].state[6])
                g_projectiles[i].worldY = *(int16 *)&g_projectiles[i].state[6];
        }

        step = (cosMul(g_projectiles[i].worldY, g_projectiles[i].speed) << 3) / g_frameRateScaling;
        if (mode == 0x1e) {
            step /= 2;
            g_projectiles[i].alt += sinMul(g_projectiles[i].worldY,
                                        (g_projectiles[i].speed << 7) / g_frameRateScaling);
        } else {
            g_projectiles[i].alt += sinMul(g_projectiles[i].worldY,
                                        (int)(*(uint8 *)&g_projectiles[i].speed << 8) / g_frameRateScaling);
        }
        g_projectiles[i].mapX += sinMul(g_projectiles[i].worldX, step);
        g_projectiles[i].mapY -= cosMul(g_projectiles[i].worldX, step);
        (g_projectiles + i)->ttl--;
        if (i < 8) {
            if (locked == 0)
                *(uint8 *)&g_projectiles[i].alt &= 0xfe;
            else
                *(uint8 *)&g_projectiles[i].alt |= 1;
        }
        *(char *)&g_posVisibleFlag = 0;
        if ((i & 3) == (frameTick & 3))
            testWorldPosVisible(g_projectiles[i].mapX, g_projectiles[i].mapY, g_projectiles[i].alt);

        if (g_projectiles[i].alt < 0 || *(int8 *)&g_posVisibleFlag != 0) {
            g_hitMapX = g_projectiles[i].mapX;
            g_hitMapY = g_projectiles[i].mapY;
            g_hitAlt = g_projectiles[i].alt;
            g_hitEffectTimer = 0xfffd;
            g_savedSamTtl = g_projectiles[i].ttl;
            (g_projectiles + i)->ttl = 0;
            strcpy((char *)strBuf,
                   (char *)missiles[*(int16 *)&g_projectiles[i].state[2]].shortName);
            if (mode == 0x1e || mode == 0x1d || mode == 0x1c) {
                scheduleTimedEvent(0, 1);
                makeSound(2, 2);
                strcat((char *)strBuf, (char *)aMisses);
                dist = rangeApprox(g_hitMapX - g_planeTable.planes[g_loftTargetIdx].mapX,
                                   g_hitMapY - g_planeTable.planes[g_loftTargetIdx].mapY);
                if (dist < (unsigned)(0x100 / (g_missionStatus + 1))) {
                    destroyGroundTarget(g_loftTargetIdx);
                    strcat((char *)strBuf, (char *)aDestroyedBy);
                    strcat((char *)strBuf,
                           (char *)missiles[*(int16 *)&g_projectiles[i].state[2]].shortName);
                    g_hitEffectTimer = 8;
                    g_hitAlt = 0;
                } else {
                    wp = findWaypointEntry(g_hitMapX, g_hitMapY);
                    if (wp == -1 || (g_planeTable.planes[wp].flags & 0x80))
                        goto msg_done;
                    wpX = (int)(g_nearestTileObj->x >> 5);
                    wpY = -((int)(g_nearestTileObj->y >> 5) - 0x8000);
                    dist = rangeApprox(g_hitMapX - wpX, g_hitMapY - wpY);
                    if (dist >= (unsigned)(0x180 / (g_missionStatus + 2)))
                        goto msg_done;
                    destroyGroundTarget(wp);
                    strcat((char *)strBuf, (char *)aDestroyedBy_0);
                    strcat((char *)strBuf,
                           (char *)missiles[*(int16 *)&g_projectiles[i].state[2]].shortName);
                    g_hitEffectTimer = 8;
                    g_hitAlt = 0;
                }
msg_done:
                tempStrcpy((char *)strBuf);
            } else if (i >= 8 && g_projectiles[i].ttl > g_frameRateScaling * 2) {
                strcat((char *)strBuf, (char *)aGroundImpact);
                tempStrcpy((char *)strBuf);
            }
        }

        if ((unsigned)((abs(alt0 - g_projectiles[i].alt) >> 5) + best) <
                (unsigned)((g_projectiles[i].speed << 4) / g_frameRateScaling) &&
            locked != 0) {
            g_hitMapX = g_projectiles[i].mapX;
            i = i;
            g_hitMapY = g_projectiles[i].mapY;
            g_hitAlt = g_projectiles[i].alt;
            g_hitEffectTimer = 8;
            if (g_projectiles[i].ttl != 0)
                g_savedSamTtl = g_projectiles[i].ttl;
            g_projectiles[i].ttl = 0;
            if (i < 8) {
                if (mapEvents[0].ttl == 0) {
                    strcpy((char *)strBuf, (char *)aHitBy);
                    strcat((char *)strBuf, (char *)&sams[spec].name);
                    tempStrcpy((char *)strBuf);
                    bombTarget();
                    ring = (frameTick >> 1) & 7;
                    g_particles[ring].posX = g_hitMapX;
                    g_particles[ring].posY = g_hitMapY;
                    g_particles[ring].alt = g_hitAlt;
                    if (!(g_playerPlaneFlags & 0x1000))
                        appendMapEvent(5, spec);
                }
            } else {
                if (mode == 7) {
                    destroyAircraft(bestIdx);
                    ring = (frameTick >> 1) & 7;
                    g_particles[ring].posX = g_hitMapX =
                        g_simObjects[bestIdx].posX;
                    g_particles[ring].posY = g_hitMapY =
                        g_simObjects[bestIdx].posY;
                    bestIdx = bestIdx;
                    ring = ring;
                    g_particles[ring].alt = g_hitAlt =
                        g_simObjects[bestIdx].alt;
                } else {
                    if (missileTargetCompat(*(int16 *)&g_projectiles[i].state[2], bestIdx) >
                            (int)randomRange(4) ||
                        (unsigned)(g_frameRateScaling * 10) <= g_savedSamTtl) {
                        destroyGroundTarget(bestIdx);
                    } else {
                        strcpy((char *)strBuf, (char *)aIneffective);
                    }
                    g_projectiles[i].ttl = 0;
                    g_threatActiveTimer = g_threatTimerInit;
                    g_threatRefX = g_hitMapX;
                    g_threatRefY = g_hitMapY;
                    g_threatRefZ = 3000;
                }
                strcat((char *)strBuf, (char *)aHitBy_0);
                strcat((char *)strBuf, (char *)&sams[spec].name);
                tempStrcpy((char *)strBuf);
            }
        }

        if (i < 8 && g_projectiles[i].ttl != 0) {
            *(int16 *)&g_projectiles[i].state[4] =
                readMapPixelColor(g_projectiles[i].mapX, g_projectiles[i].mapY);
            if (frameTick & 1)
#ifdef BUGFIX
                plotMapObject(g_projectiles[i].mapX, g_projectiles[i].mapY, 0xe, 0);
#else
                plotMapObject(g_projectiles[i].mapX, g_projectiles[i].mapY, 0xe);
#endif
        }
        }
    }
}

// ==== seg000:0x85be ====
int samCanAcquireTarget(int slot, int targetX, int targetY, int param_4, int mode) {
    int p;
    int a;
    int b;
    int c;

    b = targetX - g_projectiles[slot].mapX;
    c = targetY - g_projectiles[slot].mapY;
    a = rangeApprox(b, c);
    g_acqAimY = computeBearing(b, -c);
    if (g_projectiles[slot].speed * 24 / g_frameRateScaling > a) {
        g_acqRange = a;
        return 1;
    }
    p = abs(g_acqAimY - g_projectiles[slot].worldX);
    if (p > 0x1000 && mode != 3) {
        if (p > 0x6000 && slot < 8) {
            if ((g_projectiles[slot].speed << 4) / g_frameRateScaling < a) {
                g_projectiles[slot].ttl = clampRange(g_projectiles[slot].ttl, 0, g_frameRateScaling << 4);
            }
        }
        return 0;
    }
    if (mode == 0) {
        if (abs(g_projectiles[slot].worldX - g_ourHead) > 0x2000) {
            return 0;
        }
    }
    if (mode == 0) {
        g_acqRange = a;
        return 1;
    }
    p = abs(g_projectiles[slot].worldX - g_ourHead);
    if (abs(p - 0x4000) >= 0x2000 - g_missionStatus * 2048) {
        g_acqRange = a;
        return 1;
    }
    return 0;
}

// ==== seg000:0x86f8 ====
void destroyAircraft(int objIdx)
{
    int p;

    if (!(g_simObjects[objIdx].flags.b[0] & 0x20)) {
        aircraftTypes[g_simObjects[objIdx].spec].killCount += 1;
        if (g_simObjects[objIdx].flags.w & 0x800) {
            g_enemyAirRemaining--;
        }
        if (objIdx == g_padlockAircraft) {
            g_padlockAircraft = -1;
        }
        g_simObjects[objIdx].flags.b[0] |= 0x20;
        g_smokeSourceIdx = -1;
        g_wreckX = g_simObjects[objIdx].posX;
        g_wreckY = g_simObjects[objIdx].posY;
        g_wreckAlt = g_simObjects[objIdx].alt;
        g_wreckFallVel = 0x80;
        p = 3;
        appendMapEvent(p, (g_simObjects[objIdx].flags.w & 0x4000 ? 0x80 : 0) + g_simObjects[objIdx].spec);
        if (g_simObjects[objIdx].speed != 0) goto done;
        g_simObjects[objIdx].flags.w &= 0x1c1;
    done:
        ;
    }
    strcpy(strBuf, aircraftTypes[g_simObjects[objIdx].spec].name);
    makeSound(2, 2);
    if (g_currentWeaponType == 1 && objIdx == g_airTargetLock) {
        g_lockedTargetKilled = 1;
    }
}

void destroyGroundTarget(int param_1)
{
    int p;
    int a;
    int b;

    placeString(param_1);
    p = 1;
    if ((g_planeTable.planes[param_1].flags & 0x80) == 0) {
        if (g_planeTable.planes[param_1].flags & 0x1000) {
            g_enemyGroundRemaining--;
        }

        g_nearestTileObj = findNearestTileObject(
            (long)g_planeTable.planes[param_1].mapX << 5,
            (0x8000L - (long)g_planeTable.planes[param_1].mapY) << 5);

        if (param_1 != 0) {
            if (g_planeTable.planes[param_1].active == 0) {
                p = 0x0c;
            }
            *((uint8 *)&g_planeTable.planes[param_1].flags) |= 0x80;
            g_planeTable.planes[param_1].active = 0;
            for (a = 0; a < 2; a++) {
                if (g_targetSlots[a].planeIndex == param_1) {
                    markTargetReached(a);
                    p |= (a != 0 ? 0x40 : 0x80);
                    g_destroyedCueDeadline = frameTick + g_frameRateScaling;
                    makeSound(0, 2);
                }
            }
            appendMapEvent(p, param_1);
            b = getTargetSymbol(param_1);
        } else {
            if (isTargetOverWater(param_1) != 0) {
                b = (int)(char)g_waterTargetId[0];
            } else {
                b = (int)(char)g_landTargetId[0];
            }
            if (b != g_nearestTileObj->id) {
                g_tileKillTally[g_nearestTileObj->id]++;
                appendMapEvent(2, g_nearestTileObj->id);
            }
            *(((uint8 *)&b) + 1) |= 1;
            g_planeTable.planes[param_1].nameIndex = b;
        }

        if (g_nearestTileObj != 0) {
            addTileEntry((char *)g_nearestTileObj, shapeDataOffset(b), b);
        }
    }

    g_smokeSourceIdx = param_1;
    makeSound(2, 2);
    if (g_currentWeaponType == 2 && param_1 == g_groundTargetLock) {
        g_lockedTargetKilled = 1;
    }
    if (g_mapMode == 0) {
        redrawTacMap(g_viewX_, g_viewY_);
    }
    if (g_missionStatus < 2) {
        updateThreatAlert();
    }
}

// ==== seg000:0x89aa ====
int markTargetReached(int targetIdx) {
    if (g_playerPlaneFlags & (0x4000 >> targetIdx)) {
        return 0;
    }
    if (g_targetSlots[targetIdx].state == 4 || g_targetSlots[targetIdx].state == 3) {
        appendMapEvent((targetIdx != 0 ? 0x40 : 0x80) + 0x0b, 0);
    }
    if (targetIdx != 0) {
        strcpy(strBuf, aSecond_Target);
        waypointIndex = 1;
        g_playerPlaneFlags |= 0x2000;
    } else {
        strcpy(strBuf, aPrimaryTarget_0);
        waypointIndex = 2;
        g_playerPlaneFlags |= 0x4000;
    }
    if ((g_playerPlaneFlags & 0x6000) == 0x6000) {
        waypointIndex = 3;
    }
    return 1;
}

extern int randomRange(int);
void bombTarget(void) {
    int p;
    if (!(g_playerPlaneFlags & 0x1000) && g_autopilotEngaged != -1) {
        p = 0;
        goto check;
        do {
            g_bombDamageMask |= (1 << randomRange(8));
            g_gunHits++;
            p++;
    check:;
        } while (p <= g_missionStatus);
        refreshActivePanel(0x16);
        g_damageTakenFlag = 1;
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

    if (abs(g_ourRoll) > 0x3000) return;
    if (g_inLandingCorridor != 0) return;
    if (g_ejectState != 0) return;

    b = missleSpec[missileSpecIndex].weaponIdx;
    p = missiles[b].specIndex;

    if (missleSpec[missileSpecIndex].ammo == 0) {
        strcpy(strBuf, missiles[b].shortName);
        strcat(strBuf, a0);
        setTimedMessage(strBuf);
        goto end;
    }

    if (p == 0) return;
    if (p == -1) return;

    missleSpec[missileSpecIndex].ammo--;

    if (g_hudVisible != 0) {
        setDrawColor(0);
        a = ((int16 *)aA)[missileSpecIndex];
        fillRectBoth(a - 1, 0xbe, a + 2, 0xc2);
        drawNumber(missleSpec[missileSpecIndex].ammo, a, 0xbe, 0x0c);
        strcpy(strBuf, missiles[b].shortName);
        strcat(strBuf, aColon);
        strcat(strBuf, itoa(missleSpec[missileSpecIndex].ammo, g_itoaScratch, 0x0a));
        setTimedMessage(strBuf);
    }

    c = -1;
    a = 8;
    do {
        if (g_projectiles[a].ttl == 0) {
            c = a;
        }
        a++;
    } while (a < 12);

    if (c == -1) goto check_end;

    g_projectiles[c].mapX = g_viewX_;
    g_projectiles[c].mapY = g_viewY_;
    g_projectiles[c].alt = g_viewZ - 0x14;
    g_projectiles[c].speed = (unsigned int)g_velocity >> 11;
    c = c;
    g_projectiles[c].worldX = g_ourHead;
    g_projectiles[c].worldY = g_ourPitch;
    g_projectiles[c].worldZ = g_ourRoll;

    g_projectiles[c].ttl = (int)(((long)sams[p].lockRange << (6 - (sams[p].weaponClass == 6 ? 3 : 2))) * (long)g_frameRateScaling / (long)((sams[p].maxSpeed >> 6) + 1)) + 6;

    c = c;
    if (g_projectiles[c].ttl <= 6) {
        g_projectiles[c].ttl = 999;
    }

    *(int16 *)&g_projectiles[c].state[0] = p;
    *(int16 *)&g_projectiles[c].state[2] = b;
    *(int16 *)&g_projectiles[c].state[4] = -1;

    if (p != 0x1e) {
        g_projectiles[c].worldY -= 0x1000;
    } else {
        *(int16 *)&g_projectiles[c].state[6] = computeLoftAngle() - 0x400;
        g_loftTargetIdx = g_groundTargetLock;
    }

    if (g_groundTargetLock >= 0 && sams[p].weaponClass == 6) {
        *(int16 *)&g_projectiles[c].state[4] = g_groundTargetLock;
    }

    if (g_groundTargetLock >= 0 && sams[p].weaponClass == 5 && (g_planeTable.planes[g_groundTargetLock].flags & 8)) {
        *(int16 *)&g_projectiles[c].state[4] = g_groundTargetLock;
    }

    if (p == 0x1d) {
        g_projectiles[c].worldY = (int16)0xc000;
        g_projectiles[c].speed = 1;
    }

    g_lastMissileSlot = c;
    strcpy(strBuf, missiles[b].shortName);
    strcat(strBuf, aFired);
    tempStrcpy(strBuf);

    makeSound(sams[p].lockRange != 0 ? 0x12 : 0x18, 2);

    scheduleEventCheck(c, 1);

check_end:
    if (g_activePanelMode == 0x15) {
        refreshActivePanel(0x15);
    }
end:
    ;
}

// ==== seg000:0x8df4 ====
void testWorldPosVisible(int worldX, int worldY, int worldZ) {
    *(char *)&g_posVisibleFlag = 0;
    drawNearestTileObject((int32)worldX << 5, -((int32)worldY - 0x8000L) << 5, (int32)worldZ);
}
