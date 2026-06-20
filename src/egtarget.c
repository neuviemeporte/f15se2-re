// seg000 optimized code (/Ot)
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
#include <memory.h>

void updateTargetLock(void) {
    int p, a, b, c, d, e, f, g, h, i, j, k, l, m, n;
    int p0, a0, b0, c0, d0, e0, f0, g0, h0;
    int dk;

    f0 = 0;

    /* Fire at keyValue == 0x8b (sidewinder lock) */
    if (keyValue == 0x8b) {
        drawWorldObject(6, (long)g_ViewX, 0x01000000L - g_ViewY,
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
        g_groundTargetLock = l = -1;
    }

    c = 100 << (6 - (unsigned char)g_nightMode);

    if (g_groundTargetLock != -1) {
        g = g_groundTargetLock - 0x80;
        g0 = computeMapTargetRange(g) - 1;
        if (g_planeTable.planes[g].active != 0) {
            g0 -= 0x280;
        }
        if (g < 3) {
            g0 -= 0x0a00;
        }
        if (abs(g_ourHead + g_viewHeadingOffset - g_targetBearing) > 0x2000) {
            g0 = -32000;
            goto after_lock;
        }
        g_aamLockActive = 1;
after_lock:
        ;
    } else {
        g_aamLockActive = 0;
        g0 = -32000;
    }

    l = -1;
    for (g = 1; g < g_planeCount; g++) {
        computeMapTargetRange(g);
        if (abs(g_ourHead + g_viewHeadingOffset - g_targetBearing) < 0x1800 &&
            g + 0x80 != g_groundTargetLock && !(g_planeTable.planes[g].flags & 0x80)) {
            if (g_planeTable.planes[g].active != 0) {
                g_targetRange -= 0x280;
            }
            if (g == g_targetSlots[0].planeIndex || g == g_targetSlots[1].planeIndex) {
                g_targetRange -= 0x0a00;
            }
            if (c > g_targetRange && g0 < g_targetRange) {
                l = g;
                c = g_targetRange;
            }
        }
    }

    if (l & 0x80) {
        if (g_groundTargetLock == -1) {
            g_aamLockCooldown = 4;
        } else {
            g_groundTargetLock = -1;
        }
    } else {
        g_groundTargetLock = l;
        g_lockedTargetKilled = 0;
    }

skip_aam:
    /* Missile/chaff loop (8 entries, stride 8) */
    for (g = 0; g < 8; g++) {
        if (g_particles[g].posX != 0) {
            projectWorldToHud(g_particles[g].posX,
                g_particles[g].posY,
                g_particles[g].alt);
            if (g_projDepth < 0 && g_projDepth > -0x100) {
                drawWorldObject(
                    (unsigned char)(((unsigned char)g_smokeParticleSlot - (unsigned char)g) & 7) < 4 ? 3 : 0x11,
                    (long)(unsigned)g_particles[g].posX << 5,
                    (long)(unsigned)g_particles[g].posY << 5,
                    g_particles[g].alt, 0,
                    g_particles[g].spin, 0, 0);
            }
        }
    }

    /* Air-to-ground targeting */
    c = 0x4b << (6 - (unsigned char)g_nightMode);

    h = (g_hudVisible != 0 && (unsigned int)(g_nearestThreatRange + g_viewZ) > 0x5dc) ? 1 : 0;
    if (g_hudVisible != 0 && (unsigned int)(g_nearestThreatRange + g_viewZ) > 0xfa0) {
        h = 2;
    }

    /* A2G radar lock range */
    if ((g_airTargetLock & 0x80) && g_airTargetLock != -1) {
        g = g_airTargetLock - 0x80;
        g0 = computeTargetBearing(g_simObjects[g].posX, g_simObjects[g].posY, 1);
        if (abs(g_ourHead + g_viewHeadingOffset - g_targetBearing) > 0x2000) {
            g0 = 0;
        }
    } else {
        g0 = 0;
    }

    l = -1;
    for (g = 0; g < g_groundUnitCount; g++) {
        if (!(g_simObjects[g].flags.b[0] & 2))
            goto next2;

        if (computeSimObjectRange(g) >= 0x12c0 && g_directorMode == 0)
            goto next2;

        if (c > g_targetRange && g0 < g_targetRange && !(keyValue & 0x80) &&
            !(g_simObjects[g].flags.b[0] & 0x20) &&
            g_simObjects[g].speed != 0) {
            computeTargetBearing(g_simObjects[g].posX, g_simObjects[g].posY, 1);
            if (abs(g_ourHead + g_viewHeadingOffset - g_targetBearing) < 0x2000) {
                c = g_targetRange;
                l = g;
            }
        }

        projectWorldToHud(g_simObjects[g].posX, g_simObjects[g].posY, g_simObjects[g].alt);

        if (g_projDepth >= 0)
            goto next2;

        g_projDepth >>= h;

        if (g_projDepth > -0x20) {
            if (g_simObjects[g].alt < 999 && g_nightMode == 0) {
                f = 0;
                if ((g_planeTable.planes[g_closestThreatIndex].flags & 0x200) &&
                    abs(g_simObjects[g].posX - g_planeTable.planes[g_closestThreatIndex].mapX) < g_attackRangeX >> 5 &&
                    abs(g_simObjects[g].posY - g_planeTable.planes[g_closestThreatIndex].mapY) < g_attackRangeY >> 5) {
                    f = 0x80;
                }
                if (g_viewZ != 0x80 || f == 0x80) {
                    drawWorldObject(5, g_simObjects[g].worldX, g_simObjects[g].worldY,
                        f, g_simObjects[g].heading.w, 0, 0,
                        -(signOf(h) - 2));
                }
            }

            /* Draw the target */
            drawWorldObject(
                (&aircraftTypes[g_simObjects[g].spec].viewModelId)[(g_projDepth > -0x10) ? 0 : 1],
                g_simObjects[g].worldX, g_simObjects[g].worldY, g_simObjects[g].alt,
                g_simObjects[g].heading.w, g_simObjects[g].pitch,
                g_simObjects[g].bank.w, 2 - h);
        } else {
            setDrawColor(0x0f);
            drawViewportLine(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo);
        }
next2:
        ;
    }

    if (l != -1) {
        g_airTargetLock = l;
        g_lockedTargetKilled = 0;
    }
    if (g_airTargetLock & 0x80) {
        g_airTargetLock = -1;
    }

    /* SAM/missile visual loop (12 entries, stride 0x18) */
    for (g = 0; g < 12; g++) {
        if (g_projectiles[g].ttl != 0) {
            projectWorldToHud(g_projectiles[g].mapX, g_projectiles[g].mapY, g_projectiles[g].alt);

            if (vtxScratch.vproj.x.lo == -1)
                goto next3;

            if (g_projDepth > -0x20) {
            drawWorldObject(sams[*(int *)&g_projectiles[g].state[0]].modelId,
                (long)g_projectiles[g].mapX << 5,
                (long)g_projectiles[g].mapY << 5,
                g_projectiles[g].alt,
                g_projectiles[g].worldX, g_projectiles[g].worldY,
                g_projectiles[g].worldZ + 0x2000,
                ((keyValue & 0x80) && keyValue != 0x8b) ? 3 : 1);
            } else {
                setDrawColor(g < 8 ? 0x0c : 0x0d);
                drawViewportLine(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo);
            }
        }
next3:
        ;
    }

    /* Runway/base visual */
    if (g_wreckAlt > 0) {
        projectWorldToHud(g_wreckX, g_wreckY, g_wreckAlt);
        if (g_projDepth < 0 && g_projDepth > -0x100) {
            drawWorldObject(0x0e,
                (long)(unsigned)g_wreckX << 5,
                (long)(unsigned)g_wreckY << 5,
                g_wreckAlt, 0, 0, 0,
                g_wreckFallVel > 0 ? 4 : 3);
        }
    }

    /* Player's own aircraft fire */
    if (!(keyValue & 0x80)) goto done;
    if (keyValue == 0x8b) goto done;
    if (g_viewZ == 0 && g_ejectState != 0) goto done;

    drawWorldObject(((g_playerPlaneFlags & 1) == 0) + 6, (long)g_ViewX,
        0x01000000L - g_ViewY, g_viewZ + 0x10, g_ourHead, g_ourPitch, g_ourRoll,
        2 - h);

    if ((unsigned int)g_viewZ < 0x3e8 && g_nightMode == 0) {
        drawWorldObject(0x15, (long)g_ViewX, 0x01000000L - g_ViewY,
            g_groundAltitude, g_ourHead, 0, 0, 2);
    }

done:
    ;
}

void drawHudWorldOverlay(void) {
    int p, q, a, r, b, s, c, t, d, u, e, v, f, w, g, x, h, y, i, z, j, k, l, m, n;

    g_prevKillMarker = g_targetInHudFlag;
    g_targetInHudFlag = 0;

    for (w = 0; w < 12; w++) {
        if (g_projectiles[w].ttl != 0) {
            projectWorldToHud(g_projectiles[w].mapX, g_projectiles[w].mapY, g_projectiles[w].alt);
            if (vtxScratch.vproj.x.lo != -1) {
                setDrawColor(w < 8 ? 0x0e : 0x0a);
                drawTargetBox(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, 6, 0);
            }
        }
    }

    l = 0x200 / isqrt(g_frameRateScaling * 4 + 8);

    for (w = 0; w < g_bulletTrackCount + 4; w++) {
        if (bulletTracks[w].posX != 0) {

        projectWorldToHud(bulletTracks[w].posX,
                  bulletTracks[w].posY,
                  bulletTracks[w].alt);
        k = vtxScratch.vproj.x.lo;
        n = vtxScratch.vproj.y.lo;
        a = g_projDepth;

        projectWorldToHud((bulletTracks[w].velX >> 1) + bulletTracks[w].posX,
                  (bulletTracks[w].velY >> 1) + bulletTracks[w].posY,
                  (bulletTracks[w].velZ >> 1) + bulletTracks[w].alt);

        if (vtxScratch.vproj.x.lo != -1) {
        if (k != -1) {

        z = (frameTick >> 1) - w & 7;

        setDrawColor(w < g_bulletTrackCount ? 0x0d : 0x0c);
        drawViewportLine(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, k, n);

        s = 0;

        if (w < g_bulletTrackCount) {
            for (h = 0; h < g_groundUnitCount; h++) {
                if ((g_simObjects[h].flags.b[0] & 0x22) == 2) {

                z = (abs(bulletTracks[w].alt -
                         g_simObjects[h].alt) >> 5)
                  + abs(bulletTracks[w].posX -
                        g_simObjects[h].posX)
                  + abs(bulletTracks[w].posY -
                        g_simObjects[h].posY);
                z = abs(z);

                if (z < l / (g_missionStatus + 1)) {

                s = 1;
                g_simObjects[h].flags.b[0] |= 0x10;
                g_hitEffectTimer = 1;

                if (z * 2 < l / (g_missionStatus + 1)) {
                    destroyAircraft(h);
                    strcat((char *)strBuf, (char *)aDestroyedByGun);
                    tempStrcpy((char *)strBuf);
                    g_hitEffectTimer = 8;
                    bulletTracks[w].posX = 0;
                }
                }
                }
            }
        } else {
            z = (abs(bulletTracks[w].alt - g_viewZ) >> 5)
              + abs(bulletTracks[w].posX - g_viewX_)
              + abs(bulletTracks[w].posY - g_viewY_);
            z = abs(z);
            if (z < 0x20) {
                s = 1;
                tempStrcpy((char *)aHitByGunfire);
                if (0x20 / (4 - g_missionStatus) > z) {
                    bombTarget();
                }
            }
        }

        if (s) {
            g_hitMapX = bulletTracks[w].posX;
            g_hitMapY = bulletTracks[w].posY;
            g_hitAlt = bulletTracks[w].alt;
            g_hitEffectTimer = -1;
        }

        if (bulletTracks[w].alt < 0) {
            if (g_hitEffectTimer <= 0) {
                g_hitMapX = bulletTracks[w].posX;
                g_hitMapY = bulletTracks[w].posY;
                g_hitAlt = bulletTracks[w].alt;
                g_hitEffectTimer = -1;
            }
            bulletTracks[w].posX = 0;

            b = findWaypointEntry(g_hitMapX, g_hitMapY);
            if (b != -1 && !(g_planeTable.planes[b].flags & 0x80)) {
                i = (int)(g_nearestTileObj->x >> 5);
                y = 0x8000 - (int)(g_nearestTileObj->y >> 5);

                if (rangeApprox(g_hitMapX - i, g_hitMapY - y) < 0x18 / (g_missionStatus + 2) &&
                    (g_planeTable.planes[b].nameIndex & 0x7f) != *(uint8 *)g_landTargetId) {
                    destroyGroundTarget(b);
                    strcat((char *)strBuf, (char *)aDestroyedByG_0);
                    tempStrcpy((char *)strBuf);
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
            x = abs(0x100 / g_projDepth);
            for (w = 0; w < 8; w++) {
                setDrawColor(randomRange(4) + 0x0c);
                if (g_hitAlt > 0) {
                    drawViewportLine(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo,
                              randomRange(x << 1) - x + vtxScratch.vproj.x.lo,
                              randomRange(x << 1) - x + vtxScratch.vproj.y.lo);
                } else {
                    c = randomRange(0x6000) - 0x3000;
                    if (g_hudVisible != 0) {
                        c -= g_ourRoll;
                    }
                    a = randomRange(x);
                    k = sinMul(c, a) + vtxScratch.vproj.x.lo;
                    n = vtxScratch.vproj.y.lo - cosMul(c, a);
                    drawViewportLine(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, k, n);
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
    drawFullscreenLine(0x13f, 199, 0x13f, 199);
    g_lockToneFlag = 0;

    if (g_currentWeaponType == 2) {
    if (keyValue == 0) {
    if ((int)g_groundTargetLock >= 0) {

    projectWorldToHud(g_planeTable.planes[g_groundTargetLock].mapX, g_planeTable.planes[g_groundTargetLock].mapY, 0);

    v = missiles[missleSpec[missileSpecIndex].weaponIdx].specIndex;

    if (v == 0x1c && computeMapTargetRange(g_groundTargetLock) < (uvar_547 >> 5) * 5 && g_projDepth < 0) {
        g_lockToneFlag = 1;
    }

    if (vtxScratch.vproj.x.lo != -1) {

    setDrawColor(g_nightMode != 0 ? 8 : 0);
    q = 0;

    m = missileTargetCompat(missleSpec[missileSpecIndex].weaponIdx, g_groundTargetLock) != 0 ? 4 : 0;

    if (m != 0 && (v != 4 || g_planeTable.planes[g_groundTargetLock].active != 0)) {
        if (missleSpec[missileSpecIndex].ammo != 0) {
            setDrawColor(0x0f);
            if ((rangeApprox(vtxScratch.vproj.x.lo - 0xa0, vtxScratch.vproj.y.lo - 0x38) < 0x30 || g_lockToneFlag != 0) &&
                -g_projDepth / 7 < sams[v].lockRange &&
                sams[v].weaponClass != 7) {
                if (sams[v].weaponClass != 0x1c || g_lockToneFlag != 0) {
                    g_lockToneFlag = 1;
                    q = 1;
                    if (sams[v].lockRange > (-g_projDepth >> 1 >> 1)) {
                        setDrawColor(*(char *)&gfxModeUnset != 0 ? 0 : 0x0c);
                    }
                }
            } else {
                g_lockToneFlag = 0;
            }
        }
    } else {
        if (v != -1) {
            setDrawColor(g_nightMode != 0 ? 8 : 0);
        }
        g_lockToneFlag = 0;
    }

    drawTargetBox(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, m != 0 ? m + 5 : 9, q);

    }
    }
    }
    }

    if (g_scopeSweepTimer > 0 && g_threatLabelTarget >= 0) {
        projectWorldToHud(g_planeTable.planes[g_threatLabelTarget].mapX, g_planeTable.planes[g_threatLabelTarget].mapY, 0);
        drawTargetLabel((char *)g_targetNameTable[((int16 *)&g_planeTable)[g_threatLabelTarget * 8]], g_scopeArcColor, g_frameRateScaling - g_scopeSweepTimer);
    }

    g_playerPlaneFlags &= ~0x200;
    g_pageFront[1] = 4;
    g_pageBack[1] = 4;

    if (g_activePanelMode == 0x13) {
    if (g_currentWeaponType == 2 || g_currentWeaponType == 0) {
    if (g_groundTargetLock != -1) {

    j = g_groundTargetLock & 0x7f;

    drawTargetView(getTargetSymbol(j), g_planeTable.planes[j].mapX, g_planeTable.planes[j].mapY,
              0, 0, 0, 0, 1, -1);
    drawMissileLock();
    buildRangeString(computeMapTargetRange(j));
    drawStringActivePage((char *)strBuf, 0xf4, 0xaa, 0x0f);

    strcpy((char *)strBuf, (char *)g_targetNameTable[g_planeTable.planes[j].nameIndex & 0x7f]);
    drawStringActivePage((char *)strBuf, -((int)strlen((char *)strBuf) * 2 - 0x10c), 0x82, 0x0f);

    if ((int)strlen((char *)g_targetNameTable[((int16 *)&g_planeTable)[j * 8]]) != 0) {
        strcpy((char *)strBuf,
               (char *)(strlen((char *)g_targetNameTable[g_planeTable.planes[j].nameIndex & 0x7f]) != 0 ? aAt_0 : aAt_0 + 5));
        strcat((char *)strBuf, (char *)g_targetNameTable[((int16 *)&g_planeTable)[j * 8]]);
        drawStringActivePage((char *)strBuf, -((int)strlen((char *)strBuf) * 2 - 0x10c), 0x88, 0x0f);
    }

    if (g_currentWeaponType == 0) {
        projectWorldToHud(g_planeTable.planes[g_groundTargetLock].mapX, g_planeTable.planes[g_groundTargetLock].mapY, 0);
        setDrawColor(0x0f);
        drawTargetBox(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, 8, 0);
    } else if (g_targetSlots[0].planeIndex == g_groundTargetLock) {
        drawStringActivePage((char *)aPrimaryTarget, 0xec, 0x8e, 0x0f);
    } else if (g_targetSlots[1].planeIndex == g_groundTargetLock) {
        drawStringActivePage((char *)aSecondaryTarget, 0xec, 0x8e, 0x0f);
    } else if (!(frameTick & 1) &&
               ((g_difficultyTier < 2 && (g_shapeTargetCategory[g_planeTable.planes[j].nameIndex & 0x7f] & 0xc0) != 0) ||
                (g_planeTable.planes[j].flags & 0x500) != 0 ||
                (g_mapCellFlags[((unsigned)g_planeTable.planes[j].mapX >> 11) +
                            ((unsigned)g_planeTable.planes[j].mapY >> 11) * 16] & 1) != 0)) {
        drawStringActivePage((char *)aNoTarget, 0xfc, 0x8e, 0x0f);
    }

    if (abs((g_ourHead + g_viewHeadingOffset) - g_targetBearing) > 0x2000) {
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
    q = 0;

    v = missiles[missleSpec[missileSpecIndex].weaponIdx].specIndex;

    if (missleSpec[missileSpecIndex].ammo != 0 && sams[v].weaponClass == 7) {
        setDrawColor(0x0f);
        if (rangeApprox(vtxScratch.vproj.x.lo - 0xa0, vtxScratch.vproj.y.lo - 0x38) < 0x30) {
            if (-g_projDepth >> 3 < sams[v].lockRange) {
                g_lockToneFlag = 1;
                q = 1;
                if (-g_projDepth >> 1 >> 1 < sams[v].lockRange) {
                    setDrawColor(*(char *)&gfxModeUnset != 0 ? 0 : 0x0c);
                }
            }
        }
    }
    drawTargetBox(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, 9, q);

    }
    }
    }
    }

    if (g_activePanelMode == 0x13 && g_currentWeaponType == 1 && g_airTargetLock != -1) {
        j = g_airTargetLock & 0x7f;

        drawTargetView(aircraftTypes[g_simObjects[j].spec].viewModelId,
                  g_simObjects[j].posX,
                  g_simObjects[j].posY,
                  g_simObjects[j].alt,
                  g_simObjects[j].heading.w,
                  g_simObjects[j].pitch,
                  g_simObjects[j].bank.w,
                  1, 1);
        drawMissileLock();
        buildRangeString(rangeApprox(g_viewX_ - g_simObjects[j].posX,
                  g_viewY_ - g_simObjects[j].posY));
        drawStringActivePage((char *)strBuf, 0xf4, 0xaa, 0x0f);

        w = g_simObjects[j].spec;
        strcpy((char *)strBuf, aircraftTypes[w].name);
        strcat((char *)strBuf, aircraftTypes[w].altName);
        drawStringActivePage((char *)strBuf, 0xf8, 0x86, 0x0f);

        if (aircraftTypes[w].modelId == -1 && !(frameTick & 1)) {
            drawStringActivePage((char *)aNoTarget_0, 0xfc, 0x8c, 0x0f);
        }

        if (g_detailLevel != 0 && (frameTick & 1)) {
            g_aamLeadDist = (int)(((unsigned long)(unsigned)(0x8000 - g_simObjects[j].pitch) *
                     (long)g_simObjects[j].speed) >> 15);
            g_aamLeadDist -= abs(sinMul(g_simObjects[j].bank.w, g_aamLeadDist)) >> 1;
        }
    }

    g_pageFront[1] = 2;
    g_pageBack[1] = 2;

    if (g_scopeSweepTimer > 0 && g_threatLabelTarget < 0) {
        w = -1 - g_threatLabelTarget;
        projectWorldToHud(g_simObjects[w].posX,
                  g_simObjects[w].posY,
                  g_simObjects[w].alt);
        drawTargetLabel(aircraftTypes[g_simObjects[w].spec].name,
                  g_scopeArcColor, g_frameRateScaling - g_scopeSweepTimer);
    }

    if (g_currentWeaponType == 2 && keyValue == 0) {
        d = missiles[missleSpec[missileSpecIndex].weaponIdx].specIndex;

        if (d == 0x1e && abs(g_ourRoll) < 0x2000) {
            c = computeLoftAngle();
            u = cosMul(c, g_altitude) / (sinMul(-c, 0x20) + 1);
            i = sinMul(g_ourHead, u) + g_viewX_;
            y = g_viewY_ - cosMul(g_ourHead, u);
            projectWorldToHud(i, y, 0);
            if (vtxScratch.vproj.x.lo == -1) {
                vtxScratch.vproj.x.lo = (sinMul(g_ourRoll, 0x60 - g_flightPathMarkerY) << 2) / 3 + 0xa0;
                vtxScratch.vproj.y.lo = 0x60;
            } else {
                setDrawColor(0x0c);
                drawTargetBox(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, 5, 1);
            }
            setDrawColor(0x0f);
            drawHudViewLine(0xa0, g_flightPathMarkerY, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo);
        }

        if ((d == 0x1e || d == 0x1d) && (int)g_groundTargetLock >= 0) {
            projectWorldToHud(g_planeTable.planes[g_groundTargetLock].mapX + sinMul(g_ourHead, 0x80),
                      g_planeTable.planes[g_groundTargetLock].mapY - cosMul(g_ourHead, 0x80),
                      g_viewZ);

            if (vtxScratch.vproj.x.lo != -1) {
                if (d == 0x1e) {
                    g_projDepth = clampRange(
                        rangeApprox(i - g_planeTable.planes[g_groundTargetLock].mapX,
                                  y - g_planeTable.planes[g_groundTargetLock].mapY) >> 3,
                        0x0000, 0x0040);
                } else {
                    g_projDepth = clampRange(computeMapTargetRange(g_groundTargetLock) >> 3, 0x0000, 0x0040);
                }
                setDrawColor(0x0c);
                drawViewportLine(0x9f - g_projDepth, 0x21, 0x9f - g_projDepth, 0x1e);
                drawViewportLine(g_projDepth + 0xa0, 0x21, g_projDepth + 0xa0, 0x1e);
                drawViewportLine(0x9f - g_projDepth, 0x1e, g_projDepth + 0xa0, 0x1e);
                setDrawColor(0x0f);
                drawHudViewLine(vtxScratch.vproj.x.lo - 4, vtxScratch.vproj.y.lo, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo - 4);
                drawHudViewLine(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo - 4, vtxScratch.vproj.x.lo + 4, vtxScratch.vproj.y.lo);
                drawHudViewLine(vtxScratch.vproj.x.lo + 4, vtxScratch.vproj.y.lo, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo + 4);
                drawHudViewLine(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo + 4, vtxScratch.vproj.x.lo - 4, vtxScratch.vproj.y.lo);
            }
        }
    }

    if (g_hitEffectTimer != 0 && g_activePanelMode == 0x13 && g_lockedTargetKilled != 0 && g_targetInHudFlag != 0) {
        blitSprite(0xfc, 0x8c, (abs(g_hitEffectTimer) - 8) * -0x20, 0x3f, 0x20, 0x20, 0);
    }

    if (g_activePanelMode == 0x13 && g_prevKillMarker != 0 && g_targetInHudFlag == 0) {
        fillPanelBox(3, 3);
    }
}

/* ---- merged from egwaypt.c ---- */
void drawTargetBox(int centerX, int centerY, int size, int mode) {
    int p;
    int a;
    int b;
    int c;
    int d;

    if (g_hudVisible == 0) {
        return;
    }
    if (g_halfScaleRender != 0) {
        size >>= 1;
    }
    p = size - (size >> 2);
    c = centerX + size;
    a = centerX - size;
    d = centerY + p;
    b = centerY - p;
    if (mode == 0) {
        drawHudViewLine(a, b, a, d);
        drawHudViewLine(a, d, c, d);
        drawHudViewLine(c, d, c, b);
        drawHudViewLine(c, b, a, b);
    } else {
        drawHudViewLine(centerX, b, c, centerY - (p >> 1));
        drawHudViewLine(c, centerY - (p >> 1), c, centerY + (p >> 1));
        drawHudViewLine(c, (p >> 1) + centerY, centerX, d);
        drawHudViewLine(centerX, d, a, (p >> 1) + centerY);
        drawHudViewLine(a, centerY + (p >> 1), a, centerY - (p >> 1));
        drawHudViewLine(a, centerY - (p >> 1), centerX, b);
    }
}

// ==== seg000:0xC2F8 ====
void drawMissileLock(void) {
    int p;
    int a;
    if (g_lockToneFlag != 0 && g_hudVisible != 0) {
        if (g_drawPage != 0) {
            drawStringActivePage(aMissileLock, 0xf4, 0x96, 14);
        }
        setDrawColor(14);
        p = 0x10c;
        a = 0x9c;
        drawFullscreenLine(0x102, 0x9c, 0x116, 0x9c);
        drawFullscreenLine(p, a - 8, p, a + 8);
    }
}

// ==== seg000:0xc371 ====
void drawTargetLabel(char *text, int color, int size) {
    if (vtxScratch.vproj.x.lo == -1) {
        return;
    }
    setDrawColor(color);
    if (size < vtxScratch.vproj.x.lo && 0x13f - size > vtxScratch.vproj.x.lo &&
        size < vtxScratch.vproj.y.lo && 0x58 - size > vtxScratch.vproj.y.lo) {
        drawTargetBox(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, size, 1);
    }
    if (vtxScratch.vproj.x.lo > 0x14 && vtxScratch.vproj.x.lo < 0x118 &&
        vtxScratch.vproj.y.lo > 0 && vtxScratch.vproj.y.lo < 0x52) {
        drawStringActivePage(text, vtxScratch.vproj.x.lo - (int)strlen(text) * 2, vtxScratch.vproj.y.lo + 5, g_scopeArcColor);
    }
}

// ==== seg000:0xc40b ====
void buildRangeString(int rangeRaw) {
    int p;
    int a;
    int b;
    int c;
    int d;

    strcpy(strBuf, aRange);
    strcat(strBuf, itoa(rangeRaw >> 6, g_itoaScratch, 10));
    strcat(strBuf, aDot);
    strcat(strBuf, itoa((rangeRaw & 0x3f) * 2 / 13, g_itoaScratch, 10));
    strcat(strBuf, aKm);
}

// ==== seg000:0xc488 ====
void projectWorldToHud(int worldX, int worldY, int worldZ) {
    int p;
    long a;
    int c;
    long d;
    int f;
    long g;

    p = g_viewX_ - worldX;
    c = worldY - g_viewY_;
    f = (worldZ - g_viewZ) >> 5;

    if (keyValue & 0x80) {
        p -= (int)((g_ViewX - g_camEyeX) >> 5);
        c -= (int)((g_ViewY - g_camEyeY) >> 5);
        f -= (int)((-((long)(unsigned)g_viewZ - (long)g_camEyeZ)) >> 5);
    }

    a = rotateVectorComponent(0, p, c, f);
    d = rotateVectorComponent(1, p, c, f);
    g = rotateVectorComponent(2, p, c, f);

    if (g >= 0) {
        vtxScratch.vproj.x.lo = -1;
        return;
    }

    if (g_halfScaleRender) {
        a >>= 1;
        d >>= 1;
    }

    if (-g < a || a < g) {
        vtxScratch.vproj.x.lo = -1;
        return;
    }

    vtxScratch.vproj.x.lo = (int)((a << 8) / g) + 0xa0;
    vtxScratch.vproj.y.lo = (int)((d << 8) / g);
    vtxScratch.vproj.y.lo -= vtxScratch.vproj.y.lo >> 1 >> 1;
    vtxScratch.vproj.y.lo += (g_pageFront[8] == 0xc7) ? 0x64 : 0x38;

    g_projDepth = (int)(g >> 3);

    if (vtxScratch.vproj.x.lo < 0 || vtxScratch.vproj.x.lo > 0x13f) {
        g_offscreenProjX = vtxScratch.vproj.x.lo;
        vtxScratch.vproj.x.lo = -1;
    }
    if (vtxScratch.vproj.y.lo < 0 || g_pageFront[8] < vtxScratch.vproj.y.lo) {
        g_offscreenProjX = vtxScratch.vproj.x.lo;
        vtxScratch.vproj.x.lo = -1;
    }
}

// ==== seg000:0xc661 ====
long rotateVectorComponent(int axis, int vecX, int vecY, int vecZ) {
    long p;

    p = (long)fixedMulQ14(g_camRotMatrix[axis], vecX);
    p += (long)fixedMulQ14(g_camRotMatrix[3 + axis], vecZ);
    p += (long)fixedMulQ14(g_camRotMatrix[6 + axis], vecY);
    return p;
}





int findWaypointEntry(int mapX, int mapY)
{
    int p;

    if (g_nearestTileObj = findNearestTileObject((int32)mapX << 5, (0x8000L - (int32)mapY) << 5)) {
        mapX = g_nearestTileObj->x >> 5;
        mapY = -((int)(g_nearestTileObj->y >> 5) - 0x8000);
        for (p = 1; p < g_planeCount; p++) {
            if (g_planeTable.planes[p].mapX == mapX && g_planeTable.planes[p].mapY == mapY) {
                return p;
            }
        }
        g_planeTable.planes[0].mapX = mapX;
        g_planeTable.planes[0].mapY = mapY;
        g_planeTable.planes[0].nameIndex = g_nearestTileObj->id + 0x100;
        if (g_smokeSourceIdx == 0) {
            g_smokeSourceIdx = -1;
        }
        return 0;
    } else {
        return -1;
    }
}

// ==== seg000:0xc7a2 ====
int computeMapTargetRange(int targetIdx) {
     return computeTargetBearing(g_planeTable.planes[targetIdx].mapX, g_planeTable.planes[targetIdx].mapY, 1);
}

// ==== seg000:0xc7c6 ====
int computeSimObjectRange(int objIdx) {
    return computeTargetBearing(g_simObjects[objIdx].posX, g_simObjects[objIdx].posY, 0);
}

// ==== seg000:0xc7ea ====
int computeTargetBearing(int targetX, int targetY, int wantBearing) {
    int p;
    int a;
    p = g_viewX_ - targetX;
    a = g_viewY_ - targetY;
    if (wantBearing != 0) {
        g_targetBearing = computeBearing(-p, a);
    }
    g_targetRange = rangeApprox(p, a);
    goto done;
done:;
}

// ==== seg000:0xc82d ====
int computeLoftAngle() {
    return (int)((unsigned long)((long)(0x4000 - abs(g_ourPitch)) << 12) / (unsigned long)(unsigned int)(g_viewZ + 0x1000)) - 0x4000;
}

// ==== seg000:0xc864 ====
int getTargetSymbol(int wpIdx) {
    if (g_planeTable.planes[wpIdx].flags & 0x80) {
        return (isTargetOverWater(wpIdx) ? (int)(char)g_waterTargetId[0] : (int)(char)g_landTargetId[0]) + 0x100;
    }
    return g_planeTable.planes[wpIdx].nameIndex;
}

// ==== seg000:0xc8a4 ====
int isTargetOverWater(int wpIdx) {
    int p;

    p = ((char *)g_shapeTargetCategory)[g_planeTable.planes[wpIdx].nameIndex & 0x7f] & 0x0f;
    return (p == 0x0c || p == 9 || p == 0x0b) ? 1 : 0;
}
