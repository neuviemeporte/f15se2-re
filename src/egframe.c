// seg000 debug code (/Zi) - split from egmain.c
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

// ==== seg000:0x0720 ====
void updateFrame(void) {
    int p;
    int a;
    uint16 b;
    uint16 c;
    int d;
    int e;
    TRACE(("updateFrame: enter, g_initPhase=%d", g_initPhase));
#ifdef DEBUG
    {
        static int sig_was_ok = 1;
        int s4 = *(int far *)((char far *)commData - 4);
        if (sig_was_ok && (unsigned)s4 != 0xca01) {
            sig_was_ok = 0;
            TRACE_KEY(("SIG CORRUPTED at frame %d: commData-4(MCB)=%04x", frameTick, s4));
        }
    }
#endif

    g_viewX_ = (int)((g_ViewX + 0x10L) >> 5);
    g_viewY_ = -((int)((g_ViewY + 0x10L) >> 5) - 0x8000);

    if (g_initPhase == 1) {
        g_playerPlaneFlags = 0;
        if (gameData->difficulty == 4) {
            gameData->difficulty = 2;
            g_autopilotEngaged = 1;
            g_playerPlaneFlags |= 0x1000;
            *(char far *)((char far *)commData + 0x30) |= 1;
        }
        d = (unsigned char)*((char far *)commData + 0x0d);
        if (d == 0x69 || d == 0x49) {
            g_axisInputAccum[2] = 1;
        }
        findWaypointFeatures();
        TRACE(("updateFrame: past 11F3E"));
        g_threatActiveTimer = 0;
        g_scopeSweepTimer = 1;
        g_airTargetLock = g_groundTargetLock = -1;
        g_fireCooldown = g_bombDamageMask = missileSpecIndex = g_autopilotAltitude = waypointIndex = g_unusedWaypointTail = 0;
        g_closestThreatIndex = g_unusedEventHist0 = g_unusedEventHist1 = g_unusedEventHist2 = (int8)(g_halfScaleRender = 0);
        g_threatRefX = g_threatRefY = g_threatRefZ = 0;
        g_prevThreatIndex = g_smokeSourceIdx = -1;
        g_fuelRemaining = 10000;
        g_gunHits = 0;
        waypointIndex = 1;
        g_currentWeaponType = 1;
        drawWeaponSelectMarker(0);
        g_frameTimingAccum = 0x0c;
        g_frameRateScaling = 4;
        recalcTimeScale();
        g_mapZoomLevel = 1;
        g_radarScopeRange = 1;
        p = g_northSouthSign = (gameData->theater == 6) ? 1 :
            (*((char far *)gameData + 0x38) & 1) ? 1 : -1;

        if (((g_planeTable.planes[g_targetSlots[0].viewIndex].flags) & 0x200) != 0) {
            g_ViewX -= (long)(p * 0x80);
            *(char *)&g_playerPlaneFlags |= 8;
        } else {
            g_ViewY -= (long)(0x708 * g_northSouthSign);
        }
        initFrameRandom();
        TRACE(("updateFrame: past 118F6"));
        appendMapEvent(8, 0);
        TRACE(("updateFrame: past 11D10"));
        initTacMapView();
        TRACE(("updateFrame: past 19595"));
        switchIndicatorColor(3, 10);
        TRACE(("updateFrame: past 19EB6"));
        setActivePanel(0x13);
        TRACE(("updateFrame: past 194D0"));
        g_groundTargetLock = g_airTargetLock = -1;
        g_difficultyTier = 2;
        g_missionStatus = gameData->difficulty;
        gameData->unk4 = 1;
        g_detailLevel = *(int far *)((char far *)commData + 0x32);
        setupLodDistances();
        *(int far *)((char far *)commData + 0x26) = 1;
        g_gunAmmo = 1000;
        if (g_missionStatus == 0 || g_autopilotEngaged != 0) {
            g_northSouthSign = ((unsigned)(g_viewY_ - waypoints[1].mapY) < 0x8000u) ? 1 : -1;
            g_altitude = 2000;
            g_velocity = 0x1fa4;
            g_setThrust = 100;
            UpdateThrottleState();
            *(char *)&g_playerPlaneFlags |= 1;
            *(char *)&g_playerPlaneFlags &= ~8;
            if ((*(int far *)((char far *)gameData + 0x32) | *(int far *)((char far *)gameData + 0x34)) == 0 && gameData->theater != 6) {
                for (d = 0; d < g_groundUnitCount - 4; d++) {
                    if ((d & 1) == 0) {
                        g_simObjects[d].flags.b[0] |= 2;
                        g_simObjects[d].alt = 0x898;
                        g_simObjects[d].speed = 300;
                        g_simObjects[d].posX = d * 12 + g_viewX_ - 0x24;
                        g_simObjects[d].posY = g_viewY_ - (d * 0x20 + 0x96) * g_northSouthSign;
                        g_simObjects[d].worldX = (long)g_simObjects[d].posX * 32;
                        g_simObjects[d].worldY = (long)g_simObjects[d].posY * 32;
                        g_simObjects[d].heading.w = g_ourHead + 0x8000;
                    }
                }
            }
        }
        if (gameData->theater != 6) {
            g_simObjects[1].flags.b[0] |= 2;
            g_simObjects[1].alt = 0x834;
            g_simObjects[1].speed = 700;
            g_wingmanX = g_viewX_;
            g_wingmanY = 0x50 * g_northSouthSign + g_viewY_;
            g_simObjects[1].worldX = (long)g_wingmanX * 32;
            g_simObjects[1].worldY = (long)g_wingmanY * 32;
            g_simObjects[1].heading.w = g_ourHead;
        }
        g_northSouthSign = p;
        initWeaponLoadout();
        g_initPhase = 2;
        gfx_flipPage();
        g_finalThreatScore = computeThreatScore();
    }

    b = clampRange(g_viewX_, 0x100, 0x7e00);
    if (b != g_viewX_) {
        g_viewX_ = b;
        g_ViewX = (long)b << 5;
    }
    b = clampRange(g_viewY_, 0x200, 0x7d00);
    if (b != g_viewY_) {
        g_viewY_ = b;
        g_ViewY = (long)(0x8000 - g_viewY_) << 5;
    }

    *MAKEFAR(char, SEG_LOWMEM, OFF_BDA_KEYFLAGS) &= 0xf;
    TRACE(("updateFrame: past init"));
    updateThreatSites();
    updateObjects();
    updateThreatTargeting();
    TRACE(("updateFrame: past 179EE"));
    tickMessageTimers();
    TRACE(("updateFrame: past 11636"));
    updateBulletsAndFire();
    TRACE(("updateFrame: past 11676"));
    updateTracerParticles();
    TRACE(("updateFrame: past 11841"));
    applyGravityFall();
    TRACE(("updateFrame: past 118D5"));

    if (objectToScreen(g_viewX_, g_viewY_, (int16*)&b, (int16*)&c) != 0) {
        g_drawPage = -(gfx_getDisplayPage() - 1);
        gfx_copyRect(2, b - 3, c - 3, g_drawPage, b - 3, c - 3, 6, 6);
        blitSprite(b - 1, c - 1, ((g_ourHead + 0x1000) >> 0xd & 7) * 4 + 0xa4, 4, 4, 4, 0);
        g_drawPage = 1 - g_drawPage;
        if (((int16)b < 0x20 || (int16)b > 0x58 || (int16)c < 0x76 || (int16)c > 0xa2) && g_mapZoomLevel > 2) {
            g_mapZoomLevel--;
            redrawTacMap(g_viewX_, g_viewY_);
        }
    } else {
        redrawTacMap(g_viewX_, g_viewY_);
    }

    g_unusedViewXSnap = g_viewX_;
    g_unusedViewYSnap = g_viewY_;

    if (g_directorEventDeadline == frameTick) {
        if (g_autopilotEngaged == 0) {
            keyValue = 0;
        }
        g_directorEventDeadline = -1;
    }
    if (g_threatActiveTimer != 0) {
        g_threatActiveTimer--;
    }
    if (g_destroyedCueDeadline != 0 && frameTick == g_destroyedCueDeadline) {
        g_destroyedCueDeadline = 0;
        playVoiceCue(2);
    }

    if ((frameTick & 7) != 0) goto skip_target_section;

    g_prevThreatIndex = g_closestThreatIndex;
    g_nearestThreatRange = 0x7fff;
    for (d = 0; d < g_planeCount; d++) {
        if ((g_planeTable.planes[d].flags & 0x201) != 0 &&
            (g_planeTable.planes[d].flags & 0x500) != 0 &&
            (g_planeTable.planes[d].flags & 0x800) == 0) {
            p = rangeApprox(g_viewX_ - g_planeTable.planes[d].mapX, g_viewY_ - g_planeTable.planes[d].mapY);
            if (p < g_nearestThreatRange) {
                g_nearestThreatRange = p;
                g_closestThreatIndex = d;
            }
        }
    }
    if (g_prevThreatIndex != g_closestThreatIndex) {
        g_targetSlots[1].viewIndex = g_closestThreatIndex;
        waypoints[3].mapX = g_planeTable.planes[g_closestThreatIndex].mapX;
        waypoints[3].mapY = g_planeTable.planes[g_closestThreatIndex].mapY;
    }

    /* Magic signature check, only done when the plane is moving? */
    if ((char)frameTick == 0 && frameTick != 0) {
        if (*((int32 HUGE*)commData - 1) != COMM_MCB_VALUE_MAGIC) {
            finalizeMission(1);
            exitCode = 0;
        }
    }

    if (g_prevThreatIndex != g_closestThreatIndex && (g_planeTable.planes[g_closestThreatIndex].flags & 0x800) == 0) {
        for (d = 1; d <= 2; d++) {
            g_simObjects[g_groundUnitCount - d].flags.b[0] &= ~2;
            g_simObjects[g_groundUnitCount - d].spec = g_planeTable.planes[g_closestThreatIndex].flags & 0x400 ? 0x0d : 0;
            if (g_planeTable.planes[g_closestThreatIndex].flags & 0x100) {
                g_simObjects[g_groundUnitCount - d].spec = 0x12;
            }
            g_simObjects[g_groundUnitCount - d].objType = g_closestThreatIndex;
        }
        for (d = 3; d <= 4; d++) {
            e = g_groundUnitCount - d;
            g_simObjects[e].flags.b[0] |= 2;
            g_simObjects[e].posX = g_planeTable.planes[g_closestThreatIndex].mapX;
            g_simObjects[e].posY = g_planeTable.planes[g_closestThreatIndex].mapY;
            if ((g_planeTable.planes[g_closestThreatIndex].flags & 0x200) != 0) {
                g_simObjects[e].posX += g_northSouthSign * 5;
                g_simObjects[e].posY += (d & 1) * g_northSouthSign * 0x10;
                g_simObjects[e].alt = 0x84;
            } else {
                g_simObjects[e].posX += 10;
                g_simObjects[e].posY += (d + g_closestThreatIndex & 3) * 0x10;
                g_simObjects[e].alt = 4;
            }
            g_simObjects[e].worldX = (long)g_simObjects[e].posX << 5;
            g_simObjects[e].worldY = (long)g_simObjects[e].posY << 5;
            g_simObjects[e].heading.w = -randomRange(0x4000);
            g_simObjects[e].spec = g_planeTable.planes[g_closestThreatIndex].flags & 0x400 ? 8 : 0x0b;
            if (g_planeTable.planes[g_closestThreatIndex].flags & 0x100) {
                g_simObjects[e].spec = 9;
            }
        }
    }

    if ((frameTick & 0x7f) == 0) {
        if ((g_planeTable.planes[g_closestThreatIndex].flags & 0x800) == 0) {
            e = frameTick & 0x80 ? g_groundUnitCount - 1 : g_groundUnitCount - 2;
            if ((g_simObjects[e].flags.b[0] & 2) == 0) {
                spawnEnemyAircraft(e, g_closestThreatIndex);
                g_simObjects[e].flags.w = 0x207;
                g_simObjects[e].alt = 1000;
                g_simObjects[e].speed = 0xfa;
                g_simObjects[e].worldY += g_northSouthSign * 0x3000;
            }
        }
        g_unusedEventHist2 = g_unusedEventHist1;
        g_unusedEventHist1 = g_unusedEventHist0;
        g_unusedEventHist0 = 0;
    }

skip_target_section:
    if (g_nearestThreatRange < 0x200 || g_groundAltitude == g_viewZ) {
        g_groundAltitude = 0;
        g_attackRangeX = 0xa0;
        g_attackRangeY = 0x800;
        if (g_planeTable.planes[g_closestThreatIndex].flags & 0x800) {
            g_attackRangeY = 0x400;
        }
        if (g_planeTable.planes[g_closestThreatIndex].flags & 0x200) {
            g_groundAltitude = 0x80;
            g_attackRangeX = 0x100;
            g_attackRangeY = 0x3c0;
            if (g_viewZ == 0x80 && g_knots > 0x50) {
                if ((unsigned)(g_viewY_ - g_planeTable.planes[g_closestThreatIndex].mapY) * g_northSouthSign >= 0x10 && (unsigned)(g_viewY_ - g_planeTable.planes[g_closestThreatIndex].mapY) * g_northSouthSign <= 0x14) {
                    if (abs(g_ourHead - ((1 - g_northSouthSign) << 0xe)) < 0x2000) {
                        g_autoCrashDive = 1;
                        makeSound(0x16, 2);
                    }
                }
            }
        }
        if (gameData->unk4 == 1) {
            g_attackRangeX += 0x100;
            g_attackRangeY += 0x200;
        }
        if (abs(g_viewX_ - g_planeTable.planes[g_closestThreatIndex].mapX) > (g_attackRangeX >> 5) ||
                (abs(g_viewY_ - g_planeTable.planes[g_closestThreatIndex].mapY) > (g_attackRangeY >> 5))) {
            g_groundAltitude = 0;
            g_inLandingCorridor = 0;
        } else {
            g_inLandingCorridor = 1;
            if ((g_knots <= 1) && ((frameTick & 7) == 0) && g_planeTable.planes[g_closestThreatIndex].flags & 0x500
                    && g_landingTimer != 0 && !(g_planeTable.planes[g_closestThreatIndex].flags & 0x800)) {
                g_gearDownArmed = 1;
                g_landingDoneFlag = 1;
                if (g_landingTimer++ == 1) {
                    tempStrcpy(aSafeLanding);
                    g_autopilotAltitude = 0;
                    g_autoLandingActive = 0;
                    playVoiceCue(4);
                }
                if ((g_playerPlaneFlags & 0x6000) == 0x6000) {
                    if (g_landingTimer > g_frameRateScaling) {
                        finalizeMission(0);
                    }
                } else {
                    if (g_landingTimer == 2) {
                        g_resupplyCount++;
                        appendMapEvent(10, g_closestThreatIndex);
                    }
                    if (g_landingTimer > g_frameRateScaling) {
                        initWeaponLoadout();
                        if (frameTick & 8) {
                            tempStrcpy(aReadyForTakeof);
                        } else {
                            tempStrcpy(aWeaponsRepleni);
                        }
                    }
                }
            }
        }
end_landing_check:
        if ((g_landingDoneFlag == 0) && (g_missionStatus == 0) && g_playerPlaneFlags & 0x6000) {
            if (abs(g_viewX_ - g_planeTable.planes[g_closestThreatIndex].mapX) < 0x10 && abs(g_viewY_ - g_planeTable.planes[g_closestThreatIndex].mapY) < 0x10) {
                g_setThrust = g_velocity = g_altitude = 0;
                g_ViewX = (long)g_planeTable.planes[g_closestThreatIndex].mapX << 5;
                g_ViewY = (long)(0x8000 - g_planeTable.planes[g_closestThreatIndex].mapY) << 5;
            } else {
                tempStrcpy(aAutomaticLandi);
                g_autoLandingActive = 1;
                d = g_frameRateScaling * 2;
                if (d > 0x0e) {
                    d = 0x0e;
                }
                g_velocity = 0x1518;
                g_altitude -= (g_altitude - g_groundAltitude) / d;
                if (g_altitude < g_groundAltitude + 5) {
                    g_altitude = g_groundAltitude + 5;
                }
                g_ViewX -= (g_ViewX - ((long)g_planeTable.planes[g_closestThreatIndex].mapX << 5)) / (long)d;
                g_ViewY -= (g_ViewY - ((long)(0x8000 - g_planeTable.planes[g_closestThreatIndex].mapY) << 5)) / (long)d;
            }
        }
    }
    else {
        g_landingDoneFlag = 0;
        g_inLandingCorridor = 0;
    }

skip_autopilot:
    TRACE(("updateFrame: skip_autopilot, w33702=%d var547=%d unk4=%d 3BF90=%d 33098=%d 3BE3C=%d 3AA5A=%d", g_inLandingCorridor, g_viewZ, gameData->unk4, g_gunHits, g_fuelRemaining, g_ejectState, g_knots));
    if (g_inLandingCorridor == 0) {
        if (g_viewZ == 0) {
            if ((gameData->unk4 != 0 || g_gunHits > 4 || g_fuelRemaining == 0) &&
                g_ejectState == 0 && g_knots > 0x32) {
                TRACE_KEY(("DEATH: altitude-zero crash, tick=%d var547=%d 3AA5A=%d", frameTick, g_viewZ, g_knots));
                makeSound(0, 2);
                setDrawColor(0);
                fillRectBoth(0, 0, 0x13f, 199);
                waitFrameSync(0x78);
                finalizeMission(1);
            }
        } else {
            g_landingTimer = 1;
        }
    }

    if (g_savedPosVisible != 0 && (keyValue & 0x80) == 0) {
        TRACE_KEY(("DEATH-path collision: g_savedPosVisible=%d unk4=%d var548=%d tick=%d", g_savedPosVisible, gameData->unk4, g_altitude, frameTick));
        if (gameData->unk4 != 0 && g_altitude != 0) {
            makeSound(0, 2);
            gfx_waitRetrace();
            waitFrameSync(0x78);
            finalizeMission(2);
        } else {
            g_altitude += 500;
            g_autopilotAltitude = 0;
        }
    }

    g_targetLeadAngle = (g_planeTable.planes[g_closestThreatIndex].flags & 0x200 && g_nearestThreatRange < 0x500) ? (((g_northSouthSign << 8) / g_frameRateScaling) + g_targetLeadAngle) & 0xfff : 0;

    frameTick++;
    if (frameTick % g_frameRateScaling == 0) {
        g_missionTick++;
        if ((g_missionTick & 0x1f) == 0) {
            appendMapEvent(9, 0);
        }
        if (g_missionTick == 1) {
            playVoiceCue(0);
            updateEngineSound();
        }
        if (g_autopilotEngaged != 0 && (g_missionTick & 3) == 0) {
            generateRandomRadioMessage();
        }
    }

    if (++g_frameRateAccum >= g_frameRateScaling * 4) {
        g_jiffiesPerFrame = g_frameTimingAccum / g_frameRateScaling;
        g_frameTimingAccum -= (g_frameSyncWait * 2 - 1) * g_frameRateScaling * 2;
        if (g_frameTimingAccum < 4) {
            g_frameTimingAccum = 4;
        }
        b = clampRange(((g_frameRateScaling * 0x3c0) / (g_frameTimingAccum * g_slowMotionMode)), 1, 0xff);
        g_frameRateAccum = g_frameTimingAccum = 0;
        if (abs(g_frameRateScaling * 4 - b) > 3) {
            g_frameRateScaling = (int16)(b + 2) >> 2;
            recalcTimeScale();
        }
        g_enemyAlertFlag = 0;
        for (d = 3; d < g_targetEntityCount; d++) {
            if (g_planeTable.planes[d].alertLevel > 0xc0 &&
                (g_planeTable.planes[d].flags & 0x80) == 0) {
                g_enemyAlertFlag++;
                break;
            }
        }
        for (d = 0; d < g_groundUnitCount; d++) {
            if (g_simObjects[d].damage > 0xc0 &&
                (g_simObjects[d].flags.b[0] & 2) != 0) {
                g_enemyAlertFlag++;
                break;
            }
        }
    }
    dispatchKeyScancode();
}

// ==== seg000:0x14e8 ====
void dispatchKeyScancode(void) {
    int p, a, b, c, d, e, f, g;
#ifdef DEBUG
    if (keyScancode != 0)
        TRACE_KEY(("KEY scancode=%04x  dot joyAxes[0/1]=%d/%d  ISR raw axes=%d/%d",
            (unsigned)keyScancode, (int)joyAxes[0], (int)joyAxes[1], (int)g_joyRawX, (int)g_joyRawY));
#endif
    keyDispatch(keyScancode);
}

// ==== seg000:0x14fc ====
void countermeasures(int param_1) {
    char *p;
    int a;
    int b;

    b = -1;
    if ((g_eventTimers[param_1])-- <= 0) {
        g_eventTimers[param_1] = 0;
        tempStrcpy((char *)aStoresExhauste);
    } else {
        for (a = 1; a < 4; a++) {
            if (mapEvents[a].ttl == 0)
                b = a;
        }
        if (b != -1) {
            mapEvents[b].mapX = g_viewX_;
            mapEvents[b].mapY = g_viewY_;
            mapEvents[b].type = param_1;
            mapEvents[b].ttl =
                -(g_missionStatus * 3 - 0xf) * g_frameRateScaling;
            switch (param_1) {
            case 1:
                p = (char *)aFlare;
                break;
            case 2:
                p = (char *)aChaff;
                break;
            }
            strcpy(strBuf, p);
            strcat(strBuf, (char *)aReleased);
            tempStrcpy(strBuf);
            strcpy(strBuf, p);
            strcat(strBuf, (char *)strColon);
            strcat(strBuf, itoa(g_eventTimers[param_1], g_itoaScratch, 10));
            setTimedMessage(strBuf);
        }
        makeSound(0x16, 2);
    }
}

// ==== seg000:0x1636 ====
void tickMessageTimers(void) {
    int p;
    for (p = 0; p < 4; p++) {
        if (mapEvents[p].ttl != 0) {
            (mapEvents[p].ttl)--;
            if (mapEvents[p].ttl == 0) {
                mapEvents[p].type = 0;
            }
        }
    }
}

void updateBulletsAndFire(void) {
    register int p;
    int a;
    int b;
    int c;
    int d;
    int e;

    for (c = 0; c < g_bulletTrackCount + 4; c++) {
        p = c * 12;
        if (*((int16 *)((char *)&bulletTracks[0].posX + p)) != 0) {
            *((int16 *)((char *)&bulletTracks[0].posX + p)) += *((int16 *)((char *)&bulletTracks[0].velX + p));
            *((int16 *)((char *)&bulletTracks[0].posY + p)) += *((int16 *)((char *)&bulletTracks[0].velY + p));
            *((int16 *)((char *)&bulletTracks[0].alt + p)) += *((int16 *)((char *)&bulletTracks[0].velZ + p));
        }
    }
    if (!(frameTick & 1)) {
        return;
    }
    e = (frameTick >> 1) % g_bulletTrackCount;
    a = readAxisInput(0);
    if (!a) goto no_fire;
    if (g_gunAmmo <= 0) goto no_fire;
    if (g_ejectState != 0) goto no_fire;
    g_gunAmmo = clampRange(g_gunAmmo - 40 / g_frameRateScaling, 0, 1000);
    makeSound(4, 2);
    d = 186 / g_frameRateScaling;
    *((int16 *)((char *)&bulletTracks[0].velZ + e * 12)) = sinMul(g_ourPitch, d) << 5;
    d = cosMul(g_ourPitch, d);
    *((int16 *)((char *)&bulletTracks[0].velX + e * 12)) = sinMul(g_ourHead, d);
    *((int16 *)((char *)&bulletTracks[0].velY + e * 12)) = -cosMul(g_ourHead, d);
    p = e * 12;
    *((int16 *)((char *)&bulletTracks[0].posX + p)) = *((int16 *)((char *)&bulletTracks[0].velX + p)) + g_viewX_;
    *((int16 *)((char *)&bulletTracks[0].posY + p)) = *((int16 *)((char *)&bulletTracks[0].velY + p)) + g_viewY_;
    *((int16 *)((char *)&bulletTracks[0].alt + p)) = *((int16 *)((char *)&bulletTracks[0].velZ + p)) + g_viewZ - 2;
    g_gunFiredFlag = 1;
    goto done_fire;
no_fire:
    *((int16 *)((char *)&bulletTracks[0].posX + e * 12)) = 0;
    g_gunFiredFlag = 0;
done_fire:
    if (a) {
        strcpy(strBuf, aGun);
        strcat(strBuf, itoa(g_gunAmmo, g_itoaScratch, 10));
        setTimedMessage(strBuf);
    }
}

// ==== seg000:0x1841 ====
void updateTracerParticles() {
    int p;
    int a;

    if (g_smokeSourceIdx != -1) {
        for (p = 0; p < 8; p++) {
            g_particles[p].alt += 0x0a;
            g_particles[p].posY += g_particles[p].alt >> 9;
            *(((char *)&g_particles[p].spin) + 1) += 6;
        }
        if (!((char)frameTick & 0x0f)) {
            a = (frameTick >> 4) & 7;
            g_particles[a].posX = g_planeTable.planes[g_smokeSourceIdx].mapX;
            g_particles[a].posY = g_planeTable.planes[g_smokeSourceIdx].mapY;
            g_particles[a].alt = 0x80;
            g_particles[a].spin = randomRange(0x100) << 8;
            g_smokeParticleSlot = a;
        }
    }
}

// ==== seg000:0x18d5 ====
void applyGravityFall() {
    if (g_wreckAlt > 0) {
        if (g_wreckFallVel > -16) {
            g_wreckFallVel -= 12;
        }
        g_wreckAlt += g_wreckFallVel;
    }
}

// ==== seg000:0x18f6 ====
void initFrameRandom(void) {
    int p, a, b, c;

    seedRng();
    clearStatusPanel();
    frameTick = randomRange(0x1000) & 0x7ff8;
    p = g_targetSlots[0].word_8 + g_targetSlots[1].word_8;
    g_nightMode = (gameData->theater == 6 ? 5 : 9) < randomRange(0x10);
    if (g_nightMode && g_dacSupported) {
        setupDac();
    }
    g_unusedFrameVal = (p & 0xF) << 8;
    g_missionTick = 0;
}

// ==== seg000:0x1971 ====
void resetSimObjectLocks() {
    int p;
    for (p = 0; p < g_groundUnitCount; p++) {
        g_simObjects[p].terrainColor = -1;
    }
    g_trackedEnemyIdx = -1;
}

// ==== seg000:0x19a3 ====
void initWeaponLoadout() {
    int p;

    p = g_gunHits = g_bombDamageMask = 0;
    for (; p < 3; p++) {
        missleSpec[p].weaponIdx = commData->weaponType[p];
        missleSpec[p].ammo = commData->weaponCount[p];
    }
    g_gunAmmo = 0x3e8;
    g_fuelRemaining = 0x2710;
    g_eventTimers[2] = 0x12;
    g_eventTimers[1] = 0x0c;
    drawWeaponAmmo();
    drawFuelGauge();
    UpdateThrottleState();
}

// ==== seg000:0x1a18 routine_131 ====
void drawWeaponAmmo() {
    int p;
    int a;

    if (g_hudVisible == 0) {
        return;
    }
    for (a = 0; a < 3; a++) {
        setDrawColor(0);
        p = g_tacmapIndicators[a];
        fillRectBoth(p - 1, 0xbe, p + 2, 0xc2);
        drawNumber(missleSpec[a].ammo, p, 0xbe, 0x0c);
    }
}

// ==== seg000:0x1a88 ====
void drawWeaponSelectMarker(int weaponIdx) {
    if (g_hudVisible == 0) return;
    g_pageFront[2] = 0;
    drawFullscreenLine(g_weaponMarkerBoxX[g_weaponMarkerSel], 0xc4, g_weaponMarkerBoxX[g_weaponMarkerSel] + 6, 0xc4);
    g_pageFront[2] = 7;
    drawFullscreenLine(g_weaponMarkerBoxX[g_weaponMarkerSel], 0xc5, g_weaponMarkerBoxX[g_weaponMarkerSel] + 6, 0xc5);
    g_pageFront[2] = 0x0c;
    drawFullscreenLine(g_weaponMarkerBoxX[weaponIdx], 0xc4, g_weaponMarkerBoxX[weaponIdx] + 6, 0xc4);
    g_pageFront[2] = 4;
    drawFullscreenLine(g_weaponMarkerBoxX[weaponIdx], 0xc5, g_weaponMarkerBoxX[weaponIdx] + 6, 0xc5);
    g_weaponMarkerSel = weaponIdx;
}

// ==== seg000:0x1b37 routine_148 ====
void finalizeMission(int outcome) {
    TRACE_KEY(("DEATH/END finalizeMission: outcome=%d, g_ejectState=%d, tick=%d", outcome, g_ejectState, frameTick));
    if (g_ejectState != 0 && outcome != 0) {
        return;
    }
    g_missionEndedFlag[0] = 1;
    commData->continueFlag = outcome;
    if (outcome == 0 && g_ejectState == 0) {
        commData->setupDone = 3;
    }
    *(int16 far *)((char far *)commData + 0x74) = g_viewX_;
    *(int16 far *)((char far *)commData + 0x76) = g_viewY_;
    *(int16 far *)((char far *)commData + 0x34) = g_bombDamageMask;
    *(int16 far *)((char far *)commData + 0x36) = g_gunHits;
    commData->weaponCount[0] = g_finalThreatScore;
    commData->weaponCount[1] = g_resupplyCount;
    appendMapEvent(8, 0);
}

// ==== seg000:0x1bc3 ====
void scheduleEventCheck(int eventObjIdx, unsigned int priority) {
    if (priority > (unsigned int)g_directorMode) return;
    if (g_directorEventDeadline != -1) return;
    g_viewTargetObj = eventObjIdx;
    scheduleTimedEvent(0x89, g_directorMode == 1 ? 3 : 4);
}

// ==== seg000:0x1bfd scheduleTimedEvent ====
void scheduleTimedEvent(int keyVal, int delay) {
    if (g_directorMode == 0) {
        return;
    }
    keyValue = keyVal;
    g_directorEventDeadline = delay * g_frameRateScaling + frameTick;
}

// ==== seg000:0x1c21 routine_180 ====
void generateRandomRadioMessage(void) {
    int p;

    if (g_directorEventDeadline != -1) {
        return;
    }
    g_autopilotAltitude = 500;
    g_directorMode = 2;
    switch (randomRange(3)) {
    case 0:
        p = randomRange(g_planeCount - 3) + 3;
        g_viewTargetObj = p + 0x40;
        keyValue = 0x89;
        placeString(p);
        tempStrcpy(strBuf);
        break;
    case 1:
        do {
            p = randomRange(g_groundUnitCount);
        } while (g_simObjects[p].speed == 0);
        g_viewTargetObj = p + 0x20;
        keyValue = 0x89;
        strcpy(strBuf, aircraftTypes[g_simObjects[p].spec].name);
        strcat(strBuf, aOnPatrol);
        tempStrcpy(strBuf);
        break;
    case 2:
        keyValue = 0x87;
        tempStrcpy(aF15StrikeEagle);
        break;
    }
}

// ==== seg000:0x1d10 ====
void appendMapEvent(int eventType, int arg_2) {
    if (g_eventLogCount >= 255) {
        return;
    }
    g_replayLog.events[g_eventLogCount].coord = g_missionTick;
    g_replayLog.events[g_eventLogCount].screenX = (unsigned)g_viewX_ >> 7;
    g_replayLog.events[g_eventLogCount].screenY = (unsigned)g_viewY_ >> 7;
    g_replayLog.events[g_eventLogCount].type = eventType;
    g_replayLog.events[g_eventLogCount].arg = arg_2;
    g_eventLogCount++;
    g_replayLog.events[g_eventLogCount].type = 0;
}

// ==== seg000:0x1d6e placeString ====
void placeString(int waypointIdx) {
    strcpy(strBuf, g_targetNameTable[(g_planeTable.planes[waypointIdx].nameIndex) & 0x7f]);
    if (strlen(g_targetNameTable[((int16 *)&g_planeTable)[waypointIdx * 8]])) {
        if (strlen(g_targetNameTable[(g_planeTable.planes[waypointIdx].nameIndex) & 0x7f])) {
            strcat(strBuf, aAt);
        }
        strcat(strBuf, g_targetNameTable[((int16 *)&g_planeTable)[waypointIdx * 8]]);
    }
    if ((int)strlen(strBuf) > 25) {
        g_strTruncDot = '.';
        g_strTruncTerm[0] = 0;
    }
}

// ==== seg000:0x1e0e ====
void initMissionStrings() {
    int var_2, var_4;
    setCommWorldbufPtr();
    flagFarToNear = 1;
    moveStuff();
    g_targetNameTable[0] = g_stringPool;
    var_2 = 1;
    for (var_4 = 0; var_4 < 750; ++var_4) {
        if (g_stringPool[var_4] == 0 && var_2 < 100) {
            g_targetNameTable[var_2++] = &g_stringPool[var_4+1];
        }
    }
    if (gameData->difficulty != 0) { //1e6c
        g_ViewX = ((int32)(g_planeTable.planes[g_targetSlots[0].viewIndex].mapX) << 5) + 2;
        g_ViewY = (0x8000 - (int32)(g_planeTable.planes[g_targetSlots[0].viewIndex].mapY)) << 5;
    }
    else {
        g_ViewX = ((int32)waypoints[0].mapX << 5) + 2;
        g_ViewY = (0x8000 - (int32)waypoints[0].mapY) << 5;
    }
    g_viewX_ = (g_ViewX + 0x10) >> 5;
    g_viewY_ = 0x8000 - ((g_ViewY + 0x10) >> 5);
}

// ==== seg000:0x1f3e ====
void findWaypointFeatures() {
    int a;
    int p;

    a = size3d3;
    for (p = 0; p < 2; p++) {
        if (g_targetSlots[p].flags >> 8 != 0) {
            g_nearestTileObj = findNearestTileObject(
                (unsigned long)(unsigned)g_planeTable.planes[g_targetSlots[p].planeIndex].mapX << 5,
                (0x8000L - (unsigned long)(unsigned)g_planeTable.planes[g_targetSlots[p].planeIndex].mapY) << 5);
            if (g_nearestTileObj != 0) {
                g_shapeTargetCategory[a] = g_shapeTargetCategory[g_nearestTileObj->id];
                strcpy(g_targetNameTable[a], (char *)g_targetNameTable[g_nearestTileObj->id]);
                g_targetNameTable[a + 1] = g_targetNameTable[a] + strlen(g_targetNameTable[a]) + 1;
                addTileEntry((char *)g_nearestTileObj, shapeDataOffset(a + 0x100), a + 0x100);
            }
            g_planeTable.planes[g_targetSlots[p].planeIndex].nameIndex = a + 0x100;
            a++;
        }
    }
    g_render3DTiles = 0;
}

// ==== seg000:0x2049 ====
void moveDataFar() {
    int unused1, unused2;
    setCommWorldbufPtr();
    flagFarToNear = 0;
    moveStuff();
    moveNearFar(g_replayLog.events, 0x600);
}

// ==== seg000:0x206d ====
void moveStuff() {
    moveNearFar(g_landTargetId, 1);
    moveNearFar(g_waterTargetId, 1);
    moveNearFar(&g_planeCount, 2);
    moveNearFar(&g_targetEntityCount, 2);
    moveNearFar(&g_planeScanCount, 2);
    moveNearFar(&g_planeTable, g_planeCount * 16);
    moveNearFar(&g_groundUnitCount, 2);
    moveNearFar(g_simObjects, g_groundUnitCount * 0x24);
    moveNearFar(g_shapeTargetCategory, 0x64);
    moveNearFar(g_tileKillTally, 0x64);
    moveNearFar(g_stringPool, 0x2ee);
    moveNearFar(g_mapCellFlags, 0x100);
    moveNearFar(&g_unusedSavedWord, 2);
    moveNearFar(&g_padlockAircraft, 2);
    moveNearFar(waypoints, 0x10);
    moveNearFar(g_targetSlots, 0x24);
}

// ==== seg000:0x215c ====
void moveNearFar(void *nearPtr, int count) {
    void FAR *farPtr = nearPtr;
    if (flagFarToNear != 0) {
        movedata(FP_SEG(farPointer), FP_OFF(farPointer), FP_SEG(farPtr), FP_OFF(farPtr), count);
    }
    else {
        movedata(FP_SEG(farPtr), FP_OFF(farPtr), FP_SEG(farPointer), FP_OFF(farPointer), count);
    }
    farPointer += count;
}

// ==== seg000:0x21a9 ====
int setCommWorldbufPtr() {
    farPointer = (uint8 FAR*)&commData->worldBuf;
    return 0;
}
