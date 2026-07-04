// seg000 optimized code (/Ot)
#include "eg3dmap.h"
#include "egcombat.h"
#include "egdata.h"
#include "egframe.h"
#include "egkeys.h"
#include "egmath.h"
#include "egtacmap.h"
#include "egtarget.h"
#include "egthreat.h"
#include "egtypes.h"
#include "offsets.h"
#include "pointers.h"
#include "log.h"
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

/* Private helpers for this translation unit. */
int16 samCanAcquireTarget(int16 slot, int16 targetX, int16 targetY, int16 targetAlt, int16 mode);
int16 markTargetReached(int16 targetIdx);

void fireAirThreat(int16 objIdx) {
    int16 p, a, b, c, bearing, e, f;
    uint16 acqRange;
    int16 h, idx, slot, k, l, range, n;

    idx = aircraftTypes[g_threatSpec].modelId;

    range = computeThreatRangeBearing(
        g_simObjects[objIdx].posX,
        g_simObjects[objIdx].posY,
        g_simObjects[objIdx].alt,
        idx,
        &bearing, (int16 *)&acqRange);

    g_threatToneLevel = 4;

    if ((uint16)range > acqRange) {
        /* close enough — increment heat */
        g_simObjects[objIdx].damage += ((g_difficultyTier + g_missionStatus) * 16 + 0x20) >> ((g_playerPlaneFlags & 0x10) != 0);

        if (g_simObjects[objIdx].damage > 0xc0) {
            g_enemyAlertFlag++;
            g_simObjects[objIdx].flags.b[1] |= 0x40;
            updateThreatAlert();

            slot = objIdx % (g_missionStatus + 1);

            if (g_missionStatus * 2 >= g_enemyThreatCount &&
                g_projectiles[slot].ttl == 0 &&
                acqRange > 8 &&
                abs(bearing - g_simObjects[objIdx].heading.w) < 0x1800) {

                idx = g_simObjects[objIdx].weaponType;

                if (sams[idx].lockRange > (acqRange >> 1)) {
                    if ((uint16)(-(g_missionStatus * 3 - 0x10)) < acqRange) {
                        if (acqRange < 0x1000) {
                            if (idx != 0) {

                                /* launch missile into slot j */
                                idx = idx;
                                g_projectiles[slot].mapX = g_simObjects[objIdx].posX;
                                g_projectiles[slot].mapY = g_simObjects[objIdx].posY;
                                slot = slot;
                                objIdx = objIdx;
                                g_projectiles[slot].alt = g_simObjects[objIdx].alt - 25;
                                g_projectiles[slot].speed = sams[idx].maxSpeed >> 6;
                                g_projectiles[slot].worldX = g_simObjects[objIdx].heading.w;
                                g_projectiles[slot].worldY = g_simObjects[objIdx].pitch - 0x400;
                                g_projectiles[slot].worldZ = g_simObjects[objIdx].bank.w;

                                g_projectiles[slot].ttl = (int16)((((int32)sams[idx].lockRange << 3) * (int32)g_frameRateScaling) / (int32)g_projectiles[slot].speed);

                                g_projectiles[slot].specIdx = idx;
                                slot = slot;
                                g_projectiles[slot].targetRef = -objIdx;

                                idx = idx;
                                strcpy(strBuf, sams[idx].name);
                                strcat(strBuf, " fired by ");
                                strcat(strBuf, aircraftTypes[g_threatSpec].name);
                                tempStrcpy(strBuf);

                                makeSound(6, 2);
                                commData->restartFlag++;
                                scheduleEventCheck(objIdx + 0x20, 2);

                                if (randomRange(4) == 0) {
                                    g_simObjects[objIdx].flags.b[0] |= 4;
                                }
                            }
                        }
                    }
                }
            }
        }
        g_simObjects[objIdx].flags.b[0] |= 8;
    } else {
        g_simObjects[objIdx].flags.b[0] &= 0xf7;
        g_simObjects[objIdx].damage -= 0x20;
    }

    g_simObjects[objIdx].damage =
        clampRange(g_simObjects[objIdx].damage, 0, 0xff);
}

// ==== seg000:0x783A ====
void spawnEnemyAircraft(int16 slot, int16 objType) {
    int16 spec;

    spec = g_simObjects[slot].spec;
    g_simObjects[slot].heading.w = (g_northSouthSign == 1) ? 0 : (int16)0x8000;
    if (g_planeTable.planes[objType].flags & 0x200) {
        g_simObjects[slot].posX = g_northSouthSign * 3 + g_planeTable.planes[objType].mapX;
        g_simObjects[slot].posY = g_planeTable.planes[objType].mapY - g_northSouthSign * 12;
        g_simObjects[slot].alt = 140;
        g_simObjects[slot].speed = 100;
        g_simObjects[slot].heading.b[1] += 0xfc;
    } else {
        g_simObjects[slot].posX = g_planeTable.planes[objType].mapX;
        g_simObjects[slot].posY = 30 * g_northSouthSign + g_planeTable.planes[objType].mapY;
        g_simObjects[slot].alt = 12;
        g_simObjects[slot].speed = 10;
    }
    g_simObjects[slot].worldX = (int32)(uint16)g_simObjects[slot].posX << 5;
    g_simObjects[slot].worldY = (int32)(uint16)g_simObjects[slot].posY << 5;
    g_simObjects[slot].pitch = 0;
    g_simObjects[slot].bank.w = 0;
    g_simObjects[slot].flags.w |= 0x403;
    g_simObjects[slot].objType = objType;
    g_simObjects[slot].timer = (int16)(((int32)aircraftTypes[spec].range << 11) * (int32)g_frameRateScaling / (int32)aircraftTypes[spec].maxSpeed);
    g_simObjects[slot].terrainColor = readMapPixelColor(g_planeTable.planes[objType].mapX, g_planeTable.planes[objType].mapY);
    if (g_padlockAircraft == -1) {
        g_simObjects[slot].flags.b[1] &= 0xfe;
    }
    placeString(objType);
    strcat(strBuf, " - ");
    strcat(strBuf, aircraftTypes[g_simObjects[slot].spec].name);
    strcat(strBuf, " taking off");
    if (slot < g_groundUnitCount - 4) {
        tempStrcpy(strBuf);
    }
}

// ==== seg000:0x79ee ====
void updateThreatTargeting(void) {
    int16 slot, scan, mode, spec, locked, aimY, bestIdx, step, delta;
    int16 viewX, viewY, alt0, bear, wpX, wpY, ring, acq, wp;
    uint16 best, dist;

    switchIndicatorColor(0, 8);
    switchIndicatorColor(1, 8);
    if (mapEvents[0].ttl != 0) {
        viewX = mapEvents[0].mapX;
        viewY = mapEvents[0].mapY;
    } else {
        viewX = g_viewX_;
        viewY = g_viewY_;
    }

    for (slot = 0; slot < 12; slot++) {
        if (g_projectiles[slot].ttl != 0) {
            spec = g_projectiles[slot].specIdx;
            locked = 0;
            aimY = 0;
            mode = sams[spec].weaponClass;

            if (slot < 8) {
                slot = slot;
#ifdef BUGFIX
                plotMapObject(g_projectiles[slot].mapX, g_projectiles[slot].mapY, g_projectiles[slot].targetLock, 0);
#else
                plotMapObject(g_projectiles[slot].mapX, g_projectiles[slot].mapY, g_projectiles[slot].targetLock);
#endif
                alt0 = g_viewZ;
                locked = samCanAcquireTarget(slot, viewX, viewY, g_viewZ, mode);
                best = g_acqRange;
                aimY = g_acqAimY;
                scan = 1;
                do {
                    if ((mapEvents[scan].type == 1 && mode <= 0) ||
                        (mapEvents[scan].type == 2 &&
                         (mode == 1 || mode == 2 ||
                          (mode == 3 &&
                           -(g_missionStatus * 12 - 0x40) >
                               abs(abs((int16)(aimY - g_ourHead) >> 8) - 0x40))))) {
                        acq = samCanAcquireTarget(slot, mapEvents[scan].mapX,
                                                  mapEvents[scan].mapY, g_viewZ, mode);
                        if (acq != 0) {
                            aimY = acq;
                            locked = 0;
                        }
                    }
                    scan++;
                } while (scan < 4);

                if (best > 0x200) {
                    if (g_projectiles[slot].targetRef > 2 &&
                        !(g_planeTable.planes[g_projectiles[slot].targetRef].flags & 0x10))
                        locked = 0;
                    if (g_projectiles[slot].targetRef <= 0 &&
                        !(g_simObjects[-g_projectiles[slot].targetRef].flags.b[0] & 8))
                        locked = 0;
                }
                if (g_projectiles[slot].speed < (sams[spec].maxSpeed >> 6) && (frameTick & 1))
                    g_projectiles[slot].speed++;
            } else {
                best = 0x7fff;
                if (mode == 7) {
                    for (scan = 0; scan < g_groundUnitCount; scan++) {
                        if ((g_simObjects[scan].flags.b[0] & 2) &&
                            g_simObjects[scan].speed != 0) {
                            acq = samCanAcquireTarget(slot, g_simObjects[scan].posX,
                                                      g_simObjects[scan].posY,
                                                      g_simObjects[scan].alt, mode);
                            if (g_acqRange < best && acq != 0) {
                                aimY = g_acqAimY;
                                best = g_acqRange;
                                bestIdx = scan;
                                alt0 = g_simObjects[scan].alt;
                                locked = 1;
                                if (best < 0x180) {
                                    g_simObjects[scan].flags.b[0] |= 0x10;
                                    scheduleEventCheck(scan + 0x20, 1);
                                }
                            }
                        }
                    }
                }
                if (g_projectiles[slot].speed < (sams[spec].maxSpeed >> 6) && (frameTick & 1)) {
                    g_projectiles[slot].speed++;
                    aimY = g_projectiles[slot].worldX;
                }
                if (mode == 4 || mode == 6 || mode == 5 || mode == 28) {
                    if (g_projectiles[slot].targetLock == -1) {
                        for (scan = 0; scan < g_planeCount; scan++) {
                            if ((mode != 4 || g_planeTable.planes[scan].active != 0) &&
                                (((mode == 5 || mode == 6) && (g_planeTable.planes[scan].flags & 8)) ||
                                 (mode != 5 && !(g_planeTable.planes[scan].flags & 8))) &&
                                (acq = samCanAcquireTarget(slot, g_planeTable.planes[scan].mapX,
                                                           g_planeTable.planes[scan].mapY, 0, mode),
                                 g_acqRange < best && acq != 0)) {
                                aimY = g_acqAimY;
                                best = g_acqRange;
                                bestIdx = scan;
                                alt0 = 0;
                                locked = 1;
                            }
                        }
                    } else {
                        scan = g_projectiles[slot].targetLock;
                        acq = samCanAcquireTarget(slot, g_planeTable.planes[scan].mapX,
                                                  g_planeTable.planes[scan].mapY, 0, mode);
                        if (acq != 0) {
                            aimY = g_acqAimY;
                            best = g_acqRange;
                            bestIdx = scan;
                            alt0 = 0;
                            locked = 1;
                            if (best < 0xc0)
                                scheduleEventCheck(scan + 0x40, 1);
                        }
                    }
                }
            }

            if (locked != 0 && slot < 8 &&
                abs(g_acqAimY - g_projectiles[slot].worldX) < 0x1000 && mapEvents[0].ttl == 0) {
                if (mode <= 0 && (frameTick & 2))
                    switchIndicatorColor(1, 0xc);
                if (mode != 0 && !(frameTick & 2))
                    switchIndicatorColor(0, 0xe);
                if ((frameTick & 3) == 0 && best < (uint16)(g_projectiles[slot].speed << 5)) {
                    makeSound(10, 1);
                    scheduleEventCheck(slot, 2);
                }
            }

            if (aimY != 0 && locked != 0) {
                delta = aimY - g_projectiles[slot].worldX;
                if (slot < 8)
                    delta = clampRange(delta, -(g_missionStatus + 1) << 8,
                                       (g_missionStatus + 1) << 8);
                delta = clampRange(delta, -(sams[spec].turnRate * 0x80),
                                   sams[spec].turnRate * 0x80);
                g_projectiles[slot].worldX += (delta << 2) / g_frameRateScaling;
                g_projectiles[slot].worldZ = delta << 1;
                if (slot < 8 && best < 0x400) {
                    aimY = computeBearing((alt0 - g_projectiles[slot].alt) >> 4, abs((int16)best));
                } else {
                    aimY = computeBearing(((alt0 - g_projectiles[slot].alt) >> 5) +
                                              (abs((int16)best) > 0x140 ? abs((int16)best) >> 3 : 0),
                                          abs((int16)best));
                }
                bear = aimY - g_projectiles[slot].worldY;
                bear = clampRange(bear, -(sams[spec].turnRate << 0xb),
                                  sams[spec].turnRate << 9);
                g_projectiles[slot].worldY += (bear << 2) / g_frameRateScaling;
            } else {
                if (g_projectiles[slot].worldY > 0 && mode != 30)
                    g_projectiles[slot].worldY -=
                        (signOf(g_projectiles[slot].worldY) << 0xc) / g_frameRateScaling;
            }

            if (mode == 28 && g_projectiles[slot].worldY > -0x800)
                g_projectiles[slot].worldY = -0x800;
            if (mode == 30 || g_projectiles[slot].alt == 1) {
                if ((g_projectiles[slot].worldY -= 0x800 / g_frameRateScaling) <
                    g_projectiles[slot].targetRef)
                    g_projectiles[slot].worldY = g_projectiles[slot].targetRef;
            }

            step = (cosMul(g_projectiles[slot].worldY, g_projectiles[slot].speed) << 3) / g_frameRateScaling;
            if (mode == 30) {
                step /= 2;
                g_projectiles[slot].alt += sinMul(g_projectiles[slot].worldY,
                                                  (g_projectiles[slot].speed << 7) / g_frameRateScaling);
            } else {
                g_projectiles[slot].alt += sinMul(g_projectiles[slot].worldY,
                                                  (int16)(*(uint8 *)&g_projectiles[slot].speed << 8) / g_frameRateScaling);
            }
            g_projectiles[slot].mapX += sinMul(g_projectiles[slot].worldX, step);
            g_projectiles[slot].mapY -= cosMul(g_projectiles[slot].worldX, step);
            (g_projectiles + slot)->ttl--;
            if (slot < 8) {
                if (locked == 0)
                    *(uint8 *)&g_projectiles[slot].alt &= 0xfe;
                else
                    *(uint8 *)&g_projectiles[slot].alt |= 1;
            }
            *(char *)&g_posVisibleFlag = 0;
            if ((slot & 3) == (frameTick & 3))
                testWorldPosVisible(g_projectiles[slot].mapX, g_projectiles[slot].mapY, g_projectiles[slot].alt);

            if (g_projectiles[slot].alt < 0 || *(int8 *)&g_posVisibleFlag != 0) {
                g_hitMapX = g_projectiles[slot].mapX;
                g_hitMapY = g_projectiles[slot].mapY;
                g_hitAlt = g_projectiles[slot].alt;
                g_hitEffectTimer = 0xfffd;
                g_savedSamTtl = g_projectiles[slot].ttl;
                (g_projectiles + slot)->ttl = 0;
                strcpy(strBuf,
                       missiles[g_projectiles[slot].weaponIdx].longName);
                if (mode == 30 || mode == 29 || mode == 28) {
                    scheduleTimedEvent(0, 1);
                    makeSound(2, 2);
                    strcat(strBuf, " misses ");
                    dist = rangeApprox(g_hitMapX - g_planeTable.planes[g_loftTargetIdx].mapX,
                                       g_hitMapY - g_planeTable.planes[g_loftTargetIdx].mapY);
                    if (dist < (uint16)(0x100 / (g_missionStatus + 1))) {
                        destroyGroundTarget(g_loftTargetIdx);
                        strcat(strBuf, " destroyed by ");
                        strcat(strBuf,
                               missiles[g_projectiles[slot].weaponIdx].longName);
                        g_hitEffectTimer = 8;
                        g_hitAlt = 0;
                    } else {
                        wp = findWaypointEntry(g_hitMapX, g_hitMapY);
                        if (wp == -1 || (g_planeTable.planes[wp].flags & 0x80))
                            goto msg_done;
                        wpX = (int16)(g_nearestTileObj->x >> 5);
                        wpY = -((int16)(g_nearestTileObj->y >> 5) - 0x8000);
                        dist = rangeApprox(g_hitMapX - wpX, g_hitMapY - wpY);
                        if (dist >= (uint16)(0x180 / (g_missionStatus + 2)))
                            goto msg_done;
                        destroyGroundTarget(wp);
                        strcat(strBuf, " destroyed by ");
                        strcat(strBuf,
                               missiles[g_projectiles[slot].weaponIdx].longName);
                        g_hitEffectTimer = 8;
                        g_hitAlt = 0;
                    }
                msg_done:
                    tempStrcpy(strBuf);
                } else if (slot >= 8 && g_projectiles[slot].ttl > g_frameRateScaling * 2) {
                    strcat(strBuf, " ground impact");
                    tempStrcpy(strBuf);
                }
            }

            if ((uint16)((abs(alt0 - g_projectiles[slot].alt) >> 5) + best) <
                    (uint16)((g_projectiles[slot].speed << 4) / g_frameRateScaling) &&
                locked != 0) {
                g_hitMapX = g_projectiles[slot].mapX;
                slot = slot;
                g_hitMapY = g_projectiles[slot].mapY;
                g_hitAlt = g_projectiles[slot].alt;
                g_hitEffectTimer = 8;
                if (g_projectiles[slot].ttl != 0)
                    g_savedSamTtl = g_projectiles[slot].ttl;
                g_projectiles[slot].ttl = 0;
                if (slot < 8) {
                    if (mapEvents[0].ttl == 0) {
                        strcpy(strBuf, "Hit by ");
                        strcat(strBuf, sams[spec].name);
                        tempStrcpy(strBuf);
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
                        if (missileTargetCompat(g_projectiles[slot].weaponIdx, bestIdx) >
                                randomRange(4) ||
                            (uint16)(g_frameRateScaling * 10) <= g_savedSamTtl) {
                            destroyGroundTarget(bestIdx);
                        } else {
                            strcpy(strBuf, "Ineffective");
                        }
                        g_projectiles[slot].ttl = 0;
                        g_threatActiveTimer = g_threatTimerInit;
                        g_threatRefX = g_hitMapX;
                        g_threatRefY = g_hitMapY;
                        g_threatRefZ = 3000;
                    }
                    strcat(strBuf, " hit by ");
                    strcat(strBuf, sams[spec].name);
                    tempStrcpy(strBuf);
                }
            }

            if (slot < 8 && g_projectiles[slot].ttl != 0) {
                g_projectiles[slot].targetLock =
                    readMapPixelColor(g_projectiles[slot].mapX, g_projectiles[slot].mapY);
                if (frameTick & 1)
#ifdef BUGFIX
                    plotMapObject(g_projectiles[slot].mapX, g_projectiles[slot].mapY, 0xe, 0);
#else
                    plotMapObject(g_projectiles[slot].mapX, g_projectiles[slot].mapY, 0xe);
#endif
            }
        }
    }
}

// ==== seg000:0x85be ====
int16 samCanAcquireTarget(int16 slot, int16 targetX, int16 targetY, int16 targetAlt, int16 mode) {
    int16 bearDiff, range, dx, dy;

    dx = targetX - g_projectiles[slot].mapX;
    dy = targetY - g_projectiles[slot].mapY;
    range = rangeApprox(dx, dy);
    g_acqAimY = computeBearing(dx, -dy);
    if (g_projectiles[slot].speed * 24 / g_frameRateScaling > range) {
        g_acqRange = range;
        return 1;
    }
    bearDiff = abs((int16)(g_acqAimY - g_projectiles[slot].worldX));
    if (bearDiff > 0x1000 && mode != 3) {
        if (bearDiff > 0x6000 && slot < 8) {
            if ((g_projectiles[slot].speed << 4) / g_frameRateScaling < range) {
                g_projectiles[slot].ttl = clampRange(g_projectiles[slot].ttl, 0, g_frameRateScaling << 4);
            }
        }
        return 0;
    }
    if (mode == 0) {
        if (abs((int16)(g_projectiles[slot].worldX - g_ourHead)) > 0x2000) {
            return 0;
        }
    }
    if (mode == 0) {
        g_acqRange = range;
        return 1;
    }
    bearDiff = abs((int16)(g_projectiles[slot].worldX - g_ourHead));
    if (abs(bearDiff - 0x4000) >= 0x2000 - g_missionStatus * 2048) {
        g_acqRange = range;
        return 1;
    }
    return 0;
}

// ==== seg000:0x86f8 ====
void destroyAircraft(int16 objIdx) {
    int16 eventType;

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
        eventType = 3;
        appendMapEvent(eventType, (g_simObjects[objIdx].flags.w & 0x4000 ? 0x80 : 0) + g_simObjects[objIdx].spec);
        if (g_simObjects[objIdx].speed != 0) goto done;
        g_simObjects[objIdx].flags.w &= 0x1c1;
    done:;
    }
    strcpy(strBuf, aircraftTypes[g_simObjects[objIdx].spec].name);
    makeSound(2, 2);
    if (g_currentWeaponType == 1 && objIdx == g_airTargetLock) {
        g_lockedTargetKilled = 1;
    }
}

void destroyGroundTarget(int16 planeIdx) {
    int16 eventType, slot, symbol;

    placeString(planeIdx);
    eventType = 1;
    if ((g_planeTable.planes[planeIdx].flags & 0x80) == 0) {
        if (g_planeTable.planes[planeIdx].flags & 0x1000) {
            g_enemyGroundRemaining--;
        }

        g_nearestTileObj = findNearestTileObject(
            (int32)g_planeTable.planes[planeIdx].mapX << 5,
            (0x8000L - (int32)g_planeTable.planes[planeIdx].mapY) << 5);

        if (planeIdx != 0) {
            if (g_planeTable.planes[planeIdx].active == 0) {
                eventType = 12;
            }
            *((uint8 *)&g_planeTable.planes[planeIdx].flags) |= 0x80;
            g_planeTable.planes[planeIdx].active = 0;
            for (slot = 0; slot < 2; slot++) {
                if (g_targetSlots[slot].planeIndex == planeIdx) {
                    markTargetReached(slot);
                    eventType |= (slot != 0 ? 0x40 : 0x80);
                    g_destroyedCueDeadline = frameTick + g_frameRateScaling;
                    makeSound(0, 2);
                }
            }
            appendMapEvent(eventType, planeIdx);
            symbol = getTargetSymbol(planeIdx);
        } else {
            if (isTargetOverWater(planeIdx) != 0) {
                symbol = (int16)(char)g_waterTargetId[0];
            } else {
                symbol = (int16)(char)g_landTargetId[0];
            }
            if (symbol != g_nearestTileObj->id) {
                g_tileKillTally[g_nearestTileObj->id]++;
                appendMapEvent(2, g_nearestTileObj->id);
            }
            *(((uint8 *)&symbol) + 1) |= 1;
            g_planeTable.planes[planeIdx].nameIndex = symbol;
        }

        if (g_nearestTileObj != 0) {
            addTileEntry(g_nearestTileObj, shapeDataOffset(symbol), symbol);
        }
    }

    g_smokeSourceIdx = planeIdx;
    makeSound(2, 2);
    if (g_currentWeaponType == 2 && planeIdx == g_groundTargetLock) {
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
int16 markTargetReached(int16 targetIdx) {
    if (g_playerPlaneFlags & (0x4000 >> targetIdx)) {
        return 0;
    }
    if (g_targetSlots[targetIdx].state == 4 || g_targetSlots[targetIdx].state == 3) {
        appendMapEvent((targetIdx != 0 ? 0x40 : 0x80) + 0x0b, 0);
    }
    if (targetIdx != 0) {
        strcpy(strBuf, "Second. target");
        waypointIndex = 1;
        g_playerPlaneFlags |= 0x2000;
    } else {
        strcpy(strBuf, "Primary target");
        waypointIndex = 2;
        g_playerPlaneFlags |= 0x4000;
    }
    if ((g_playerPlaneFlags & 0x6000) == 0x6000) {
        waypointIndex = 3;
    }
    return 1;
}

extern int16 randomRange(int16);
void bombTarget(void) {
    int16 hit;
    if (!(g_playerPlaneFlags & 0x1000) && g_autopilotEngaged != -1) {
        hit = 0;
        goto check;
        do {
            g_bombDamageMask |= (1 << randomRange(8));
            g_gunHits++;
            hit++;
        check:;
        } while (hit <= g_missionStatus);
        refreshActivePanel(0x16);
        g_damageTakenFlag = 1;
        makeSound(0, 2);
    }
}

// ==== seg000:0x8aa6 ====

void fireMissile() {
    int16 spec, tmp, weaponIdx, slot;

    if (abs((int16)g_ourRoll) > 0x3000) return;
    if (g_inLandingCorridor != 0) return;
    if (g_ejectState != 0) return;

    weaponIdx = missleSpec[missileSpecIndex].weaponIdx;
    spec = missiles[weaponIdx].specIndex;

    if (missleSpec[missileSpecIndex].ammo == 0) {
        strcpy(strBuf, missiles[weaponIdx].longName);
        strcat(strBuf, ":0");
        setTimedMessage(strBuf);
        goto end;
    }

    if (spec == 0) return;
    if (spec == -1) return;

    missleSpec[missileSpecIndex].ammo--;

    if (g_hudVisible != 0) {
        setDrawColor(0);
        tmp = ammoNumX[missileSpecIndex];
        fillRectBoth(tmp - 1, 190, tmp + 2, 194);
        drawNumber(missleSpec[missileSpecIndex].ammo, tmp, 190, 0x0c);
        strcpy(strBuf, missiles[weaponIdx].longName);
        strcat(strBuf, ":");
        strcat(strBuf, itoa(missleSpec[missileSpecIndex].ammo, g_itoaScratch, 10));
        setTimedMessage(strBuf);
    }

    slot = -1;
    tmp = 8;
    do {
        if (g_projectiles[tmp].ttl == 0) {
            slot = tmp;
        }
        tmp++;
    } while (tmp < 12);

    if (slot == -1) goto check_end;

    g_projectiles[slot].mapX = g_viewX_;
    g_projectiles[slot].mapY = g_viewY_;
    g_projectiles[slot].alt = g_viewZ - 20;
    g_projectiles[slot].speed = (uint16)g_velocity >> 11;
    slot = slot;
    g_projectiles[slot].worldX = g_ourHead;
    g_projectiles[slot].worldY = g_ourPitch;
    g_projectiles[slot].worldZ = g_ourRoll;

    g_projectiles[slot].ttl = (int16)(((int32)sams[spec].lockRange << (6 - (sams[spec].weaponClass == 6 ? 3 : 2))) * (int32)g_frameRateScaling / (int32)((sams[spec].maxSpeed >> 6) + 1)) + 6;

    slot = slot;
    if (g_projectiles[slot].ttl <= 6) {
        g_projectiles[slot].ttl = 999;
    }

    g_projectiles[slot].specIdx = spec;
    g_projectiles[slot].weaponIdx = weaponIdx;
    g_projectiles[slot].targetLock = -1;

    if (spec != 30) {
        g_projectiles[slot].worldY -= 0x1000;
    } else {
        g_projectiles[slot].targetRef = computeLoftAngle() - 0x400;
        g_loftTargetIdx = g_groundTargetLock;
    }

    if (g_groundTargetLock >= 0 && sams[spec].weaponClass == 6) {
        g_projectiles[slot].targetLock = g_groundTargetLock;
    }

    if (g_groundTargetLock >= 0 && sams[spec].weaponClass == 5 && (g_planeTable.planes[g_groundTargetLock].flags & 8)) {
        g_projectiles[slot].targetLock = g_groundTargetLock;
    }

    if (spec == 29) {
        g_projectiles[slot].worldY = (int16)0xc000;
        g_projectiles[slot].speed = 1;
    }

    g_lastMissileSlot = slot;
    strcpy(strBuf, missiles[weaponIdx].longName);
    strcat(strBuf, " fired");
    tempStrcpy(strBuf);

    makeSound(sams[spec].lockRange != 0 ? 18 : 24, 2);

    scheduleEventCheck(slot, 1);

check_end:
    if (g_activePanelMode == 0x15) {
        refreshActivePanel(0x15);
    }
end:;
}

// ==== seg000:0x8df4 ====
void testWorldPosVisible(int16 worldX, int16 worldY, int16 worldZ) {
    *(char *)&g_posVisibleFlag = 0;
    drawNearestTileObject((int32)worldX << 5, -((int32)worldY - 0x8000L) << 5, (int32)worldZ);
}
