/* egtarget.c — target lock + HUD overlay (reads g_viewZ as uint16). */
#include "eg3dmap.h"
#include "eg3dview.h"
#include "egcode.h"
#include "egcombat.h"
#ifndef BUGFIX
#define G_VIEWZ_UNSIGNED /* this TU views g_viewZ as uint16 (drawHudWorldOverlay) */
#endif
#include "egdata.h"
#include "egflight.h"
#include "egframe.h"
#include "egmath.h"
#include "egtacmap.h"
#include "egtarget.h"
#include "egthreat.h"
#include "egtypes.h"
#include "egui.h"
#include "offsets.h"
#include "pointers.h"
#include "log.h"
#include "slot.h"
#include "const.h"

#include "comm.h"

#include <dos.h>
#include <conio.h>
#include <bios.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <memory.h>

/* Private helpers for this translation unit. */
void drawTargetBox(int16, int16, int16, int16);
void drawMissileLock(void);
void drawTargetLabel(const char *, int16, int16);
void buildRangeString(int16 rangeRaw);
void projectWorldToHud(int16 worldX, int16 worldY, int16 worldZ);
int32 rotateVectorComponent(int16 axis, int16 vecX, int16 vecY, int16 vecZ);
int16 computeMapTargetRange(int16 targetIdx);
int16 computeSimObjectRange(int16 objIdx);
int16 computeTargetBearing(int16 targetX, int16 targetY, int16 wantBearing);

void projectWorldToHud(int16 worldX, int16 worldY, int16 worldZ);
int32 rotateVectorComponent(int16 axis, int16 vecX, int16 vecY, int16 vecZ);
int16 computeMapTargetRange(int16 targetIdx);
int16 computeSimObjectRange(int16 objIdx);
int16 computeTargetBearing(int16 targetX, int16 targetY, int16 wantBearing);

void updateTargetLock(void) {
    int16 p, a, b, range, d, e, marker, idx, depthShift, i, j, k, best, m, n;
    int16 p0, a0, b0, c0, d0, e0, deadInit, lockedRange, h0;
    int16 dk;

    deadInit = 0;

    /* Fire at keyValue == 0x8b (sidewinder lock) */
    if (keyValue == 0x8b) {
        drawWorldObject(6, (int32)g_ViewX, 0x01000000L - g_ViewY,
                        g_viewZ + 0x10, g_ourHead, g_ourPitch, g_ourRoll, 2);
    }

    if (g_aamLockCooldown != 0) {
        g_aamLockCooldown--;
    }

    if (!(g_groundTargetLock & 0x80)) {
        if (frameTick & 0x0f) goto skip_aam;
        if (g_aamLockActive != 0) goto skip_aam;
    }
    if (g_activePanelMode != 0x13) goto skip_aam;
    if (g_aamLockCooldown != 0) goto skip_aam;
    if (g_currentWeaponType == 1) goto skip_aam;
    if (keyValue & 0x80) goto skip_aam;

    if (!(g_groundTargetLock & 0x80)) {
        g_groundTargetLock = best = -1;
    }

    range = 100 << (6 - (uint8)g_nightMode);

    if (g_groundTargetLock != -1) {
        idx = g_groundTargetLock - 0x80;
        lockedRange = computeMapTargetRange(idx) - 1;
        if (g_planeTable.planes[idx].active != 0) {
            lockedRange -= 0x280;
        }
        if (idx < 3) {
            lockedRange -= 0x0a00;
        }
        if (abs((int16)(g_ourHead + g_viewHeadingOffset - g_targetBearing)) > 0x2000) {
            lockedRange = -32000;
            goto after_lock;
        }
        g_aamLockActive = 1;
    after_lock:;
    } else {
        g_aamLockActive = 0;
        lockedRange = -32000;
    }

    best = -1;
    for (idx = 1; idx < g_planeCount; idx++) {
        computeMapTargetRange(idx);
        if (abs((int16)(g_ourHead + g_viewHeadingOffset - g_targetBearing)) < 0x1800 &&
            idx + 0x80 != g_groundTargetLock && !(g_planeTable.planes[idx].flags & 0x80)) {
            if (g_planeTable.planes[idx].active != 0) {
                g_targetRange -= 0x280;
            }
            if (idx == g_targetSlots[0].planeIndex || idx == g_targetSlots[1].planeIndex) {
                g_targetRange -= 0x0a00;
            }
            if (range > g_targetRange && lockedRange < g_targetRange) {
                best = idx;
                range = g_targetRange;
            }
        }
    }

    if (best & 0x80) {
        if (g_groundTargetLock == -1) {
            g_aamLockCooldown = 4;
        } else {
            g_groundTargetLock = -1;
        }
    } else {
        g_groundTargetLock = best;
        g_lockedTargetKilled = 0;
    }

skip_aam:
    /* Missile/chaff loop (8 entries, stride 8) */
    for (idx = 0; idx < 8; idx++) {
        if (g_particles[idx].posX != 0) {
            projectWorldToHud(g_particles[idx].posX,
                              g_particles[idx].posY,
                              g_particles[idx].alt);
            if (g_projDepth < 0 && g_projDepth > -0x100) {
                drawWorldObject(
                    (uint8)(((uint8)g_smokeParticleSlot - (uint8)idx) & 7) < 4 ? 3 : 17,
                    (int32)(uint16)g_particles[idx].posX << 5,
                    (int32)(uint16)g_particles[idx].posY << 5,
                    g_particles[idx].alt, 0,
                    g_particles[idx].spin, 0, 0);
            }
        }
    }

    /* Air-to-ground targeting */
    range = 0x4b << (6 - (uint8)g_nightMode);

    depthShift = (g_hudVisible != 0 && (uint16)(g_nearestThreatRange + g_viewZ) > 1500) ? 1 : 0;
    if (g_hudVisible != 0 && (uint16)(g_nearestThreatRange + g_viewZ) > 4000) {
        depthShift = 2;
    }

    /* A2G radar lock range */
    if ((g_airTargetLock & 0x80) && g_airTargetLock != -1) {
        idx = g_airTargetLock - 0x80;
        lockedRange = computeTargetBearing(g_simObjects[idx].posX, g_simObjects[idx].posY, 1);
        if (abs((int16)(g_ourHead + g_viewHeadingOffset - g_targetBearing)) > 0x2000) {
            lockedRange = 0;
        }
    } else {
        lockedRange = 0;
    }

    best = -1;
    for (idx = 0; idx < g_groundUnitCount; idx++) {
        if (!(g_simObjects[idx].flags.b[0] & 2))
            goto next2;

        if (computeSimObjectRange(idx) >= 4800 && g_directorMode == 0)
            goto next2;

        if (range > g_targetRange && lockedRange < g_targetRange && !(keyValue & 0x80) &&
            !(g_simObjects[idx].flags.b[0] & 0x20) &&
            g_simObjects[idx].speed != 0) {
            computeTargetBearing(g_simObjects[idx].posX, g_simObjects[idx].posY, 1);
            if (abs((int16)(g_ourHead + g_viewHeadingOffset - g_targetBearing)) < 0x2000) {
                range = g_targetRange;
                best = idx;
            }
        }

        projectWorldToHud(g_simObjects[idx].posX, g_simObjects[idx].posY, g_simObjects[idx].alt);

        if (g_projDepth >= 0)
            goto next2;

        g_projDepth >>= depthShift;

        if (g_projDepth > -0x20) {
            if (g_simObjects[idx].alt < 999 && g_nightMode == 0) {
                marker = 0;
                if ((g_planeTable.planes[g_closestThreatIndex].flags & 0x200) &&
                    abs(g_simObjects[idx].posX - g_planeTable.planes[g_closestThreatIndex].mapX) < g_attackRangeX >> 5 &&
                    abs(g_simObjects[idx].posY - g_planeTable.planes[g_closestThreatIndex].mapY) < g_attackRangeY >> 5) {
                    marker = 0x80;
                }
                if (g_viewZ != 0x80 || marker == 0x80) {
                    drawWorldObject(5, g_simObjects[idx].worldX, g_simObjects[idx].worldY,
                                    marker, g_simObjects[idx].heading.w, 0, 0,
                                    -(signOf(depthShift) - 2));
                }
            }

            /* Draw the target */
            drawWorldObject(
                (&aircraftTypes[g_simObjects[idx].spec].viewModelId)[(g_projDepth > -0x10) ? 0 : 1],
                g_simObjects[idx].worldX, g_simObjects[idx].worldY, g_simObjects[idx].alt,
                g_simObjects[idx].heading.w, g_simObjects[idx].pitch,
                g_simObjects[idx].bank.w, 2 - depthShift);
        } else {
            setDrawColor(0x0f);
            drawViewportLine(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo);
        }
    next2:;
    }

    if (best != -1) {
        g_airTargetLock = best;
        g_lockedTargetKilled = 0;
    }
    if (g_airTargetLock & 0x80) {
        g_airTargetLock = -1;
    }

    /* SAM/missile visual loop (12 entries, stride 0x18) */
    for (idx = 0; idx < 12; idx++) {
        if (g_projectiles[idx].ttl != 0) {
            projectWorldToHud(g_projectiles[idx].mapX, g_projectiles[idx].mapY, g_projectiles[idx].alt);

            if (vtxScratch.vproj.x.lo == -1)
                goto next3;

            if (g_projDepth > -0x20) {
                drawWorldObject(sams[g_projectiles[idx].specIdx].modelId,
                                (int32)g_projectiles[idx].mapX << 5,
                                (int32)g_projectiles[idx].mapY << 5,
                                g_projectiles[idx].alt,
                                g_projectiles[idx].worldX, g_projectiles[idx].worldY,
                                g_projectiles[idx].worldZ + 0x2000,
                                ((keyValue & 0x80) && keyValue != 0x8b) ? 3 : 1);
            } else {
                setDrawColor(idx < 8 ? 0x0c : 0x0d);
                drawViewportLine(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo);
            }
        }
    next3:;
    }

    /* Runway/base visual */
    if (g_wreckAlt > 0) {
        projectWorldToHud(g_wreckX, g_wreckY, g_wreckAlt);
        if (g_projDepth < 0 && g_projDepth > -0x100) {
            drawWorldObject(14,
                            (int32)(uint16)g_wreckX << 5,
                            (int32)(uint16)g_wreckY << 5,
                            g_wreckAlt, 0, 0, 0,
                            g_wreckFallVel > 0 ? 4 : 3);
        }
    }

    /* Player's own aircraft fire */
    if (!(keyValue & 0x80)) goto done;
    if (keyValue == 0x8b) goto done;
    if (g_viewZ == 0 && g_ejectState != 0) goto done;

    drawWorldObject(((g_playerPlaneFlags & 1) == 0) + 6, (int32)g_ViewX,
                    0x01000000L - g_ViewY, g_viewZ + 0x10, g_ourHead, g_ourPitch, g_ourRoll,
                    2 - depthShift);

    if ((uint16)g_viewZ < 1000 && g_nightMode == 0) {
        drawWorldObject(21, (int32)g_ViewX, 0x01000000L - g_ViewY,
                        g_groundAltitude, g_ourHead, 0, 0, 2);
    }

done:;
}

void drawHudWorldOverlay(void) {
    int16 p, lockFlag, prevDepth, r, wpEntry, hitFlag, tmp, t, missileSpecD, loftDist, e, missileSpec, marker, idx, g, radius, objIdx, pointY, pointX, dist, wpIdx, prevX, gunRadius, compat, prevY;

    g_prevKillMarker = g_targetInHudFlag;
    g_targetInHudFlag = 0;

    for (idx = 0; idx < 12; idx++) {
        if (g_projectiles[idx].ttl != 0) {
            projectWorldToHud(g_projectiles[idx].mapX, g_projectiles[idx].mapY, g_projectiles[idx].alt);
            if (vtxScratch.vproj.x.lo != -1) {
                setDrawColor(idx < 8 ? 0x0e : 0x0a);
                drawTargetBox(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, 6, 0);
            }
        }
    }

    gunRadius = 0x200 / isqrt(g_frameRateScaling * 4 + 8);

    for (idx = 0; idx < g_bulletTrackCount + 4; idx++) {
        if (bulletTracks[idx].posX != 0) {

            projectWorldToHud(bulletTracks[idx].posX,
                              bulletTracks[idx].posY,
                              bulletTracks[idx].alt);
            prevX = vtxScratch.vproj.x.lo;
            prevY = vtxScratch.vproj.y.lo;
            prevDepth = g_projDepth;

            projectWorldToHud((bulletTracks[idx].velX >> 1) + bulletTracks[idx].posX,
                              (bulletTracks[idx].velY >> 1) + bulletTracks[idx].posY,
                              (bulletTracks[idx].velZ >> 1) + bulletTracks[idx].alt);

            if (vtxScratch.vproj.x.lo != -1) {
                if (prevX != -1) {

                    dist = ((frameTick >> 1) - idx) & 7;

                    setDrawColor(idx < g_bulletTrackCount ? 0x0d : 0x0c);
                    drawViewportLine(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, prevX, prevY);

                    hitFlag = 0;

                    if (idx < g_bulletTrackCount) {
                        for (objIdx = 0; objIdx < g_groundUnitCount; objIdx++) {
                            if ((g_simObjects[objIdx].flags.b[0] & 0x22) == 2) {

                                dist = (abs(bulletTracks[idx].alt -
                                            g_simObjects[objIdx].alt) >>
                                        5) +
                                       abs(bulletTracks[idx].posX -
                                           g_simObjects[objIdx].posX) +
                                       abs(bulletTracks[idx].posY -
                                           g_simObjects[objIdx].posY);
                                dist = abs(dist);

                                if (dist < gunRadius / (g_missionStatus + 1)) {

                                    hitFlag = 1;
                                    g_simObjects[objIdx].flags.b[0] |= 0x10;
                                    g_hitEffectTimer = 1;

                                    if (dist * 2 < gunRadius / (g_missionStatus + 1)) {
                                        destroyAircraft(objIdx);
                                        strcat(strBuf, " destroyed by gunfire");
                                        tempStrcpy(strBuf);
                                        g_hitEffectTimer = 8;
                                        bulletTracks[idx].posX = 0;
                                    }
                                }
                            }
                        }
                    } else {
                        dist = (abs(bulletTracks[idx].alt - g_viewZ) >> 5) + abs(bulletTracks[idx].posX - g_viewX_) + abs(bulletTracks[idx].posY - g_viewY_);
                        dist = abs(dist);
                        if (dist < 0x20) {
                            hitFlag = 1;
                            tempStrcpy("Hit by gunfire");
                            if (0x20 / (4 - g_missionStatus) > dist) {
                                bombTarget();
                            }
                        }
                    }

                    if (hitFlag) {
                        g_hitMapX = bulletTracks[idx].posX;
                        g_hitMapY = bulletTracks[idx].posY;
                        g_hitAlt = bulletTracks[idx].alt;
                        g_hitEffectTimer = -1;
                    }

                    if (bulletTracks[idx].alt < 0) {
                        if (g_hitEffectTimer <= 0) {
                            g_hitMapX = bulletTracks[idx].posX;
                            g_hitMapY = bulletTracks[idx].posY;
                            g_hitAlt = bulletTracks[idx].alt;
                            g_hitEffectTimer = -1;
                        }
                        bulletTracks[idx].posX = 0;

                        wpEntry = findWaypointEntry(g_hitMapX, g_hitMapY);
                        if (wpEntry != -1 && !(g_planeTable.planes[wpEntry].flags & 0x80)) {
                            pointX = (int16)(g_nearestTileObj->x >> 5);
                            pointY = 0x8000 - (int16)(g_nearestTileObj->y >> 5);

                            if (rangeApprox(g_hitMapX - pointX, g_hitMapY - pointY) < 24 / (g_missionStatus + 2) &&
                                (g_planeTable.planes[wpEntry].nameIndex & 0x7f) != *(uint8 *)g_landTargetId) {
                                destroyGroundTarget(wpEntry);
                                strcat(strBuf, " destroyed by gunfire");
                                tempStrcpy(strBuf);
                                g_hitEffectTimer = 8;
                                g_hitAlt = 0;
                            }
                        }
                    }
                }
            }
        }
    }

    if (g_hitEffectTimer != 0) {
        projectWorldToHud(g_hitMapX, g_hitMapY, g_hitAlt);
        if (vtxScratch.vproj.x.lo != -1) {
            radius = abs(0x100 / g_projDepth);
            for (idx = 0; idx < 8; idx++) {
                setDrawColor(randomRange(4) + 0x0c);
                if (g_hitAlt > 0) {
                    drawViewportLine(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo,
                                     randomRange(radius << 1) - radius + vtxScratch.vproj.x.lo,
                                     randomRange(radius << 1) - radius + vtxScratch.vproj.y.lo);
                } else {
                    tmp = randomRange(0x6000) - 0x3000;
                    if (g_hudVisible != 0) {
                        tmp -= g_ourRoll;
                    }
                    prevDepth = randomRange(radius);
                    prevX = sinMul(tmp, prevDepth) + vtxScratch.vproj.x.lo;
                    prevY = vtxScratch.vproj.y.lo - cosMul(tmp, prevDepth);
                    drawViewportLine(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, prevX, prevY);
                }
            }
        }
        g_hitEffectTimer -= signOf(g_hitEffectTimer);
    } else {
        g_lockedTargetKilled = 0;
    }

    if (g_hudVisible == 0) return;

    if (g_unusedHudFlag != 0) {
        g_unusedHudFlag = 0;
    }

    loadColorPalette(g_nightMode != 0 ? 2 : g_nightMode);
    setDrawColor(0x0f);
    drawFullscreenLine(319, 199, 319, 199);
    g_lockToneFlag = 0;

    if (g_currentWeaponType == 2) {
        if (keyValue == 0) {
            if (g_groundTargetLock >= 0) {

                projectWorldToHud(g_planeTable.planes[g_groundTargetLock].mapX, g_planeTable.planes[g_groundTargetLock].mapY, 0);

                missileSpec = missiles[missleSpec[missileSpecIndex].weaponIdx].specIndex;

                if (missileSpec == 28 && computeMapTargetRange(g_groundTargetLock) < (g_viewZ >> 5) * 5 && g_projDepth < 0) {
                    g_lockToneFlag = 1;
                }

                if (vtxScratch.vproj.x.lo != -1) {

                    setDrawColor(g_nightMode != 0 ? 8 : 0);
                    lockFlag = 0;

                    compat = missileTargetCompat(missleSpec[missileSpecIndex].weaponIdx, g_groundTargetLock) != 0 ? 4 : 0;

                    if (compat != 0 && (missileSpec != 4 || g_planeTable.planes[g_groundTargetLock].active != 0)) {
                        if (missleSpec[missileSpecIndex].ammo != 0) {
                            setDrawColor(0x0f);
                            if ((rangeApprox(vtxScratch.vproj.x.lo - 160, vtxScratch.vproj.y.lo - 56) < 48 || g_lockToneFlag != 0) &&
                                -g_projDepth / 7 < sams[missileSpec].lockRange &&
                                sams[missileSpec].weaponClass != 7) {
                                if (sams[missileSpec].weaponClass != 28 || g_lockToneFlag != 0) {
                                    g_lockToneFlag = 1;
                                    lockFlag = 1;
                                    if (sams[missileSpec].lockRange > (-g_projDepth >> 1 >> 1)) {
                                        setDrawColor(*(char *)&gfxModeUnset != 0 ? 0 : 0x0c);
                                    }
                                }
                            } else {
                                g_lockToneFlag = 0;
                            }
                        }
                    } else {
                        if (missileSpec != -1) {
                            setDrawColor(g_nightMode != 0 ? 8 : 0);
                        }
                        g_lockToneFlag = 0;
                    }

                    drawTargetBox(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, compat != 0 ? compat + 5 : 9, lockFlag);
                }
            }
        }
    }

    if (g_scopeSweepTimer > 0 && g_threatLabelTarget >= 0) {
        projectWorldToHud(g_planeTable.planes[g_threatLabelTarget].mapX, g_planeTable.planes[g_threatLabelTarget].mapY, 0);
        drawTargetLabel(g_targetNameTable[((int16 *)&g_planeTable)[g_threatLabelTarget * 8]], g_scopeArcColor, g_frameRateScaling - g_scopeSweepTimer);
    }

    g_playerPlaneFlags &= ~0x200;
    g_pageFront[1] = 4;
    g_pageBack[1] = 4;

    if (g_activePanelMode == 0x13) {
        if (g_currentWeaponType == 2 || g_currentWeaponType == 0) {
            if (g_groundTargetLock != -1) {

                wpIdx = g_groundTargetLock & 0x7f;

                drawTargetView(getTargetSymbol(wpIdx), g_planeTable.planes[wpIdx].mapX, g_planeTable.planes[wpIdx].mapY,
                               0, 0, 0, 0, 1, -1);
                drawMissileLock();
                buildRangeString(computeMapTargetRange(wpIdx));
                drawStringActivePage(strBuf, 244, 170, 0x0f);

                strcpy(strBuf, g_targetNameTable[g_planeTable.planes[wpIdx].nameIndex & 0x7f]);
                drawStringActivePage(strBuf, -((int16)strlen(strBuf) * 2 - 268), 130, 0x0f);

                if ((int16)strlen(g_targetNameTable[((int16 *)&g_planeTable)[wpIdx * 8]]) != 0) {
                    strcpy(strBuf,
                           strlen(g_targetNameTable[g_planeTable.planes[wpIdx].nameIndex & 0x7f]) != 0 ? " at " : "");
                    strcat(strBuf, g_targetNameTable[((int16 *)&g_planeTable)[wpIdx * 8]]);
                    drawStringActivePage(strBuf, -((int16)strlen(strBuf) * 2 - 268), 136, 0x0f);
                }

                if (g_currentWeaponType == 0) {
                    projectWorldToHud(g_planeTable.planes[g_groundTargetLock].mapX, g_planeTable.planes[g_groundTargetLock].mapY, 0);
                    setDrawColor(0x0f);
                    drawTargetBox(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, 8, 0);
                } else if (g_targetSlots[0].planeIndex == g_groundTargetLock) {
                    drawStringActivePage("Primary Target", 236, 142, 0x0f);
                } else if (g_targetSlots[1].planeIndex == g_groundTargetLock) {
                    drawStringActivePage("Secondary Target", 236, 142, 0x0f);
                } else if (!(frameTick & 1) &&
                           ((g_difficultyTier < 2 && (g_shapeTargetCategory[g_planeTable.planes[wpIdx].nameIndex & 0x7f] & 0xc0) != 0) ||
                            (g_planeTable.planes[wpIdx].flags & 0x500) != 0 ||
                            (g_mapCellFlags[((uint16)g_planeTable.planes[wpIdx].mapX >> 11) +
                                            ((uint16)g_planeTable.planes[wpIdx].mapY >> 11) * 16] &
                             1) != 0)) {
                    drawStringActivePage("No Target", 252, 142, 0x0f);
                }

                if (abs((int16)((g_ourHead + g_viewHeadingOffset) - g_targetBearing)) > 0x2000) {
                    g_groundTargetLock = -1;
                }
            }
        }
    }

    g_axisInput1 = readAxisInput(1);

    if (g_currentWeaponType == 1) {
        if (keyValue == 0) {
            if (!(g_airTargetLock & 0x80)) {

                projectWorldToHud(g_simObjects[g_airTargetLock].posX,
                                  g_simObjects[g_airTargetLock].posY,
                                  g_simObjects[g_airTargetLock].alt);

                if (vtxScratch.vproj.x.lo != -1) {

                    setDrawColor(g_nightMode != 0 ? 8 : 0);
                    lockFlag = 0;

                    missileSpec = missiles[missleSpec[missileSpecIndex].weaponIdx].specIndex;

                    if (missleSpec[missileSpecIndex].ammo != 0 && sams[missileSpec].weaponClass == 7) {
                        setDrawColor(0x0f);
                        if (rangeApprox(vtxScratch.vproj.x.lo - 160, vtxScratch.vproj.y.lo - 56) < 48) {
                            if (-g_projDepth >> 3 < sams[missileSpec].lockRange) {
                                g_lockToneFlag = 1;
                                lockFlag = 1;
                                if (-g_projDepth >> 1 >> 1 < sams[missileSpec].lockRange) {
                                    setDrawColor(*(char *)&gfxModeUnset != 0 ? 0 : 0x0c);
                                }
                            }
                        }
                    }
                    drawTargetBox(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, 9, lockFlag);
                }
            }
        }
    }

    if (g_activePanelMode == 0x13 && g_currentWeaponType == 1 && g_airTargetLock != -1) {
        wpIdx = g_airTargetLock & 0x7f;

        drawTargetView(aircraftTypes[g_simObjects[wpIdx].spec].viewModelId,
                       g_simObjects[wpIdx].posX,
                       g_simObjects[wpIdx].posY,
                       g_simObjects[wpIdx].alt,
                       g_simObjects[wpIdx].heading.w,
                       g_simObjects[wpIdx].pitch,
                       g_simObjects[wpIdx].bank.w,
                       1, 1);
        drawMissileLock();
        buildRangeString(rangeApprox(g_viewX_ - g_simObjects[wpIdx].posX,
                                     g_viewY_ - g_simObjects[wpIdx].posY));
        drawStringActivePage(strBuf, 244, 170, 0x0f);

        idx = g_simObjects[wpIdx].spec;
        strcpy(strBuf, aircraftTypes[idx].name);
        strcat(strBuf, aircraftTypes[idx].altName);
        drawStringActivePage(strBuf, 248, 134, 0x0f);

        if (aircraftTypes[idx].modelId == -1 && !(frameTick & 1)) {
            drawStringActivePage("No Target", 252, 140, 0x0f);
        }

        if (g_detailLevel != 0 && (frameTick & 1)) {
            g_aamLeadDist = (int16)(((uint32)(uint16)(0x8000 - g_simObjects[wpIdx].pitch) *
                                     (int32)g_simObjects[wpIdx].speed) >>
                                    15);
            g_aamLeadDist -= abs(sinMul(g_simObjects[wpIdx].bank.w, g_aamLeadDist)) >> 1;
        }
    }

    g_pageFront[1] = 2;
    g_pageBack[1] = 2;

    if (g_scopeSweepTimer > 0 && g_threatLabelTarget < 0) {
        idx = -1 - g_threatLabelTarget;
        projectWorldToHud(g_simObjects[idx].posX,
                          g_simObjects[idx].posY,
                          g_simObjects[idx].alt);
        drawTargetLabel(aircraftTypes[g_simObjects[idx].spec].name,
                        g_scopeArcColor, g_frameRateScaling - g_scopeSweepTimer);
    }

    if (g_currentWeaponType == 2 && keyValue == 0) {
        missileSpecD = missiles[missleSpec[missileSpecIndex].weaponIdx].specIndex;

        if (missileSpecD == 30 && abs((int16)g_ourRoll) < 0x2000) {
            tmp = computeLoftAngle();
            loftDist = cosMul(tmp, g_altitude) / (sinMul(-tmp, 0x20) + 1);
            pointX = sinMul(g_ourHead, loftDist) + g_viewX_;
            pointY = g_viewY_ - cosMul(g_ourHead, loftDist);
            projectWorldToHud(pointX, pointY, 0);
            if (vtxScratch.vproj.x.lo == -1) {
                vtxScratch.vproj.x.lo = (sinMul(g_ourRoll, 96 - g_flightPathMarkerY) << 2) / 3 + 160;
                vtxScratch.vproj.y.lo = 96;
            } else {
                setDrawColor(0x0c);
                drawTargetBox(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, 5, 1);
            }
            setDrawColor(0x0f);
            drawHudViewLine(160, g_flightPathMarkerY, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo);
        }

        if ((missileSpecD == 30 || missileSpecD == 29) && g_groundTargetLock >= 0) {
            projectWorldToHud(g_planeTable.planes[g_groundTargetLock].mapX + sinMul(g_ourHead, 0x80),
                              g_planeTable.planes[g_groundTargetLock].mapY - cosMul(g_ourHead, 0x80),
                              g_viewZ);

            if (vtxScratch.vproj.x.lo != -1) {
                if (missileSpecD == 30) {
                    g_projDepth = clampRange(
                        rangeApprox(pointX - g_planeTable.planes[g_groundTargetLock].mapX,
                                    pointY - g_planeTable.planes[g_groundTargetLock].mapY) >>
                            3,
                        0x0000, 0x0040);
                } else {
                    g_projDepth = clampRange(computeMapTargetRange(g_groundTargetLock) >> 3, 0x0000, 0x0040);
                }
                setDrawColor(0x0c);
                drawViewportLine(159 - g_projDepth, 33, 159 - g_projDepth, 30);
                drawViewportLine(g_projDepth + 160, 33, g_projDepth + 160, 30);
                drawViewportLine(159 - g_projDepth, 30, g_projDepth + 160, 30);
                setDrawColor(0x0f);
                drawHudViewLine(vtxScratch.vproj.x.lo - 4, vtxScratch.vproj.y.lo, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo - 4);
                drawHudViewLine(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo - 4, vtxScratch.vproj.x.lo + 4, vtxScratch.vproj.y.lo);
                drawHudViewLine(vtxScratch.vproj.x.lo + 4, vtxScratch.vproj.y.lo, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo + 4);
                drawHudViewLine(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo + 4, vtxScratch.vproj.x.lo - 4, vtxScratch.vproj.y.lo);
            }
        }
    }

    if (g_hitEffectTimer != 0 && g_activePanelMode == 0x13 && g_lockedTargetKilled != 0 && g_targetInHudFlag != 0) {
        blitSprite(252, 140, (abs(g_hitEffectTimer) - 8) * -32, 0x3f, 32, 32, 0);
    }

    if (g_activePanelMode == 0x13 && g_prevKillMarker != 0 && g_targetInHudFlag == 0) {
        fillPanelBox(3, 3);
    }
}

/* ---- merged from egwaypt.c ---- */
void drawTargetBox(int16 centerX, int16 centerY, int16 size, int16 mode) {
    int16 halfHeight, left, top, right, bottom;

    if (g_hudVisible == 0) {
        return;
    }
    if (g_halfScaleRender != 0) {
        size >>= 1;
    }
    halfHeight = size - (size >> 2);
    right = centerX + size;
    left = centerX - size;
    bottom = centerY + halfHeight;
    top = centerY - halfHeight;
    if (mode == 0) {
        drawHudViewLine(left, top, left, bottom);
        drawHudViewLine(left, bottom, right, bottom);
        drawHudViewLine(right, bottom, right, top);
        drawHudViewLine(right, top, left, top);
    } else {
        drawHudViewLine(centerX, top, right, centerY - (halfHeight >> 1));
        drawHudViewLine(right, centerY - (halfHeight >> 1), right, centerY + (halfHeight >> 1));
        drawHudViewLine(right, (halfHeight >> 1) + centerY, centerX, bottom);
        drawHudViewLine(centerX, bottom, left, (halfHeight >> 1) + centerY);
        drawHudViewLine(left, centerY + (halfHeight >> 1), left, centerY - (halfHeight >> 1));
        drawHudViewLine(left, centerY - (halfHeight >> 1), centerX, top);
    }
}

// ==== seg000:0xC2F8 ====
void drawMissileLock(void) {
    int16 markX, markY;
    if (g_lockToneFlag != 0 && g_hudVisible != 0) {
        if (g_drawPage != 0) {
            drawStringActivePage("Missile Lock", 244, 150, 14);
        }
        setDrawColor(14);
        markX = 268;
        markY = 156;
        drawFullscreenLine(258, 156, 278, 156);
        drawFullscreenLine(markX, markY - 8, markX, markY + 8);
    }
}

// ==== seg000:0xc371 ====
void drawTargetLabel(const char *text, int16 color, int16 size) {
    if (vtxScratch.vproj.x.lo == -1) {
        return;
    }
    setDrawColor(color);
    if (size < vtxScratch.vproj.x.lo && 319 - size > vtxScratch.vproj.x.lo &&
        size < vtxScratch.vproj.y.lo && 88 - size > vtxScratch.vproj.y.lo) {
        drawTargetBox(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, size, 1);
    }
    if (vtxScratch.vproj.x.lo > 20 && vtxScratch.vproj.x.lo < 280 &&
        vtxScratch.vproj.y.lo > 0 && vtxScratch.vproj.y.lo < 82) {
        drawStringActivePage(text, vtxScratch.vproj.x.lo - (int16)strlen(text) * 2, vtxScratch.vproj.y.lo + 5, g_scopeArcColor);
    }
}

// ==== seg000:0xc40b ====
void buildRangeString(int16 rangeRaw) {
    int16 p, a, b, c, d;

    strcpy(strBuf, "Range ");
    strcat(strBuf, itoa(rangeRaw >> 6, g_itoaScratch, 10));
    strcat(strBuf, ".");
    strcat(strBuf, itoa((rangeRaw & 0x3f) * 2 / 13, g_itoaScratch, 10));
    strcat(strBuf, " km");
}
