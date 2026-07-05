// seg000 debug code (/Zi) - split from egmain.c
#include "eg3dmap.h"
#include "eg3dview.h"
#include "egcode.h"
#include "egcombat.h"
#include "egdata.h"
#include "egflight.h"
#include "egframe.h"
#include "egkeys.h"
#include "egmath.h"
#include "egtacmap.h"
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

/* Private helpers for this translation unit. */
void updateFrame(void);
void dispatchKeyScancode();
void tickMessageTimers();
void updateBulletsAndFire();
void updateTracerParticles();
void applyGravityFall();
void initFrameRandom();
void generateRandomRadioMessage();
void findWaypointFeatures();
void moveStuff();
void moveNearFar(void *nearPtr, int16 count);
int16 setCommWorldbufPtr();

// ==== seg000:0x0720 ====
void updateFrame(void) {
    int16 tmp, unused;
    uint16 val;
    uint16 screenY;
    int16 i, objIdx;
#ifdef DEBUG
    {
        static int16 sig_was_ok = 1;
        int16 s4 = *(int16 FAR *)((char FAR *)commData - 4);
        if (sig_was_ok && (uint16)s4 != 0xca01) {
            sig_was_ok = 0;
            LogError(("SIG CORRUPTED at frame %d: commData-4(MCB)=%04x", frameTick, s4));
        }
    }
#endif

    g_viewX_ = (int16)((g_ViewX + 0x10L) >> 5);
    g_viewY_ = -((int16)((g_ViewY + 0x10L) >> 5) - 0x8000);

    if (g_initPhase == 1) {
        g_playerPlaneFlags = 0;
        if (gameData->difficulty == 4) {
            gameData->difficulty = 2;
            g_autopilotEngaged = 1;
            g_playerPlaneFlags |= 0x1000;
            *(char FAR *)&commData->trainingFlag |= 1;
        }
        i = (uint8)commData->sndOvlName[0];
        if (i == 0x69 || i == 0x49) {
            g_axisInputAccum[2] = 1;
        }
        findWaypointFeatures();
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
        g_frameTimingAccum = 12;
        g_frameRateScaling = 4;
        recalcTimeScale();
        g_mapZoomLevel = 1;
        g_radarScopeRange = 1;
        tmp = g_northSouthSign = (gameData->theater == 6) ? 1 : (gameData->theater & 1) ? 1
                                                                                        : -1;

        if (((g_planeTable.planes[g_targetSlots[0].viewIndex].flags) & 0x200) != 0) {
            g_ViewX -= (int32)(tmp * 0x80);
            *(char *)&g_playerPlaneFlags |= 8;
        } else {
            g_ViewY -= (int32)(1800 * g_northSouthSign);
        }
        initFrameRandom();
        appendMapEvent(8, 0);
        initTacMapView();
        switchIndicatorColor(3, 10);
        setActivePanel(19);
        g_groundTargetLock = g_airTargetLock = -1;
        g_difficultyTier = 2;
        g_missionStatus = gameData->difficulty;
        gameData->unk4 = 1;
        g_detailLevel = commData->setupDetail;
        setupLodDistances();
        commData->landingType = 1;
        g_gunAmmo = 1000;
        if (g_missionStatus == 0 || g_autopilotEngaged != 0) {
            g_northSouthSign = ((uint16)(g_viewY_ - waypoints[1].mapY) < 0x8000u) ? 1 : -1;
            g_altitude = 2000;
            g_velocity = 8100;
            g_setThrust = 100;
            UpdateThrottleState();
            *(char *)&g_playerPlaneFlags |= 1;
            *(char *)&g_playerPlaneFlags &= ~8;
            if (gameData->totalScore == 0 && gameData->theater != 6) {
                for (i = 0; i < g_groundUnitCount - 4; i++) {
                    if ((i & 1) == 0) {
                        g_simObjects[i].flags.b[0] |= 2;
                        g_simObjects[i].alt = 2200;
                        g_simObjects[i].speed = 300;
                        g_simObjects[i].posX = i * 12 + g_viewX_ - 36;
                        g_simObjects[i].posY = g_viewY_ - (i * 0x20 + 150) * g_northSouthSign;
                        g_simObjects[i].worldX = (int32)g_simObjects[i].posX * 32;
                        g_simObjects[i].worldY = (int32)g_simObjects[i].posY * 32;
                        g_simObjects[i].heading.w = g_ourHead + 0x8000;
                    }
                }
            }
        }
        if (gameData->theater != 6) {
            g_simObjects[1].flags.b[0] |= 2;
            g_simObjects[1].alt = 2100;
            g_simObjects[1].speed = 700;
            g_wingmanX = g_viewX_;
            g_wingmanY = 80 * g_northSouthSign + g_viewY_;
            g_simObjects[1].worldX = (int32)g_wingmanX * 32;
            g_simObjects[1].worldY = (int32)g_wingmanY * 32;
            g_simObjects[1].heading.w = g_ourHead;
        }
        g_northSouthSign = tmp;
        initWeaponLoadout();
        g_initPhase = 2;
        gfx_flipPage();
        g_finalThreatScore = computeThreatScore();
    }

    val = clampRange(g_viewX_, 0x100, 0x7e00);
    if (val != g_viewX_) {
        g_viewX_ = val;
        g_ViewX = (int32)val << 5;
    }
    val = clampRange(g_viewY_, 0x200, 0x7d00);
    if (val != g_viewY_) {
        g_viewY_ = val;
        g_ViewY = (int32)(0x8000 - g_viewY_) << 5;
    }

    *MAKEFAR(char, SEG_LOWMEM, OFF_BDA_KEYFLAGS) &= 0xf;
    updateThreatSites();
    updateObjects();
    updateThreatTargeting();
    tickMessageTimers();
    updateBulletsAndFire();
    updateTracerParticles();
    applyGravityFall();

    if (objectToScreen(g_viewX_, g_viewY_, (int16 *)&val, (int16 *)&screenY) != 0) {
        g_drawPage = -(gfx_getDisplayPage() - 1);
        gfx_copyRect(2, val - 3, screenY - 3, g_drawPage, val - 3, screenY - 3, 6, 6);
        blitSprite(val - 1, screenY - 1, ((g_ourHead + 0x1000) >> 0xd & 7) * 4 + 164, 4, 4, 4, 0);
        g_drawPage = 1 - g_drawPage;
        if (((int16)val < 32 || (int16)val > 88 || (int16)screenY < 118 || (int16)screenY > 162) && g_mapZoomLevel > 2) {
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
    for (i = 0; i < g_planeCount; i++) {
        if ((g_planeTable.planes[i].flags & 0x201) != 0 &&
            (g_planeTable.planes[i].flags & 0x500) != 0 &&
            (g_planeTable.planes[i].flags & 0x800) == 0) {
            tmp = rangeApprox(g_viewX_ - g_planeTable.planes[i].mapX, g_viewY_ - g_planeTable.planes[i].mapY);
            if (tmp < g_nearestThreatRange) {
                g_nearestThreatRange = tmp;
                g_closestThreatIndex = i;
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
        if (*((int32 HUGE *)commData - 1) != COMM_MCB_VALUE_MAGIC) {
            finalizeMission(1);
            exitCode = 0;
        }
    }

    if (g_prevThreatIndex != g_closestThreatIndex && (g_planeTable.planes[g_closestThreatIndex].flags & 0x800) == 0) {
        for (i = 1; i <= 2; i++) {
            g_simObjects[g_groundUnitCount - i].flags.b[0] &= ~2;
            g_simObjects[g_groundUnitCount - i].spec = g_planeTable.planes[g_closestThreatIndex].flags & 0x400 ? 13 : 0;
            if (g_planeTable.planes[g_closestThreatIndex].flags & 0x100) {
                g_simObjects[g_groundUnitCount - i].spec = 18;
            }
            g_simObjects[g_groundUnitCount - i].objType = g_closestThreatIndex;
        }
        for (i = 3; i <= 4; i++) {
            objIdx = g_groundUnitCount - i;
            g_simObjects[objIdx].flags.b[0] |= 2;
            g_simObjects[objIdx].posX = g_planeTable.planes[g_closestThreatIndex].mapX;
            g_simObjects[objIdx].posY = g_planeTable.planes[g_closestThreatIndex].mapY;
            if ((g_planeTable.planes[g_closestThreatIndex].flags & 0x200) != 0) {
                g_simObjects[objIdx].posX += g_northSouthSign * 5;
                g_simObjects[objIdx].posY += (i & 1) * g_northSouthSign * 0x10;
                g_simObjects[objIdx].alt = 132;
            } else {
                g_simObjects[objIdx].posX += 10;
                g_simObjects[objIdx].posY += ((i + g_closestThreatIndex) & 3) * 0x10;
                g_simObjects[objIdx].alt = 4;
            }
            g_simObjects[objIdx].worldX = (int32)g_simObjects[objIdx].posX << 5;
            g_simObjects[objIdx].worldY = (int32)g_simObjects[objIdx].posY << 5;
            g_simObjects[objIdx].heading.w = -randomRange(0x4000);
            g_simObjects[objIdx].spec = g_planeTable.planes[g_closestThreatIndex].flags & 0x400 ? 8 : 11;
            if (g_planeTable.planes[g_closestThreatIndex].flags & 0x100) {
                g_simObjects[objIdx].spec = 9;
            }
        }
    }

    if ((frameTick & 0x7f) == 0) {
        if ((g_planeTable.planes[g_closestThreatIndex].flags & 0x800) == 0) {
            objIdx = frameTick & 0x80 ? g_groundUnitCount - 1 : g_groundUnitCount - 2;
            if ((g_simObjects[objIdx].flags.b[0] & 2) == 0) {
                spawnEnemyAircraft(objIdx, g_closestThreatIndex);
                g_simObjects[objIdx].flags.w = 0x207;
                g_simObjects[objIdx].alt = 1000;
                g_simObjects[objIdx].speed = 250;
                g_simObjects[objIdx].worldY += g_northSouthSign * 0x3000;
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
                if ((uint16)(g_viewY_ - g_planeTable.planes[g_closestThreatIndex].mapY) * g_northSouthSign >= 0x10 && (uint16)(g_viewY_ - g_planeTable.planes[g_closestThreatIndex].mapY) * g_northSouthSign <= 0x14) {
                    if (abs((int16)(g_ourHead - ((1 - g_northSouthSign) << 0xe))) < 0x2000) {
                        g_autoCrashDive = 1;
                        makeSound(22, 2);
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
            if ((g_knots <= 1) && ((frameTick & 7) == 0) && g_planeTable.planes[g_closestThreatIndex].flags & 0x500 && g_landingTimer != 0 && !(g_planeTable.planes[g_closestThreatIndex].flags & 0x800)) {
                g_gearDownArmed = 1;
                g_landingDoneFlag = 1;
                if (g_landingTimer++ == 1) {
                    tempStrcpy("Safe Landing");
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
                            tempStrcpy("Ready for takeoff");
                        } else {
                            tempStrcpy("Weapons replenished");
                        }
                    }
                }
            }
        }
    end_landing_check:
        if ((g_landingDoneFlag == 0) && (g_missionStatus == 0) && g_playerPlaneFlags & 0x6000) {
            if (abs(g_viewX_ - g_planeTable.planes[g_closestThreatIndex].mapX) < 0x10 && abs(g_viewY_ - g_planeTable.planes[g_closestThreatIndex].mapY) < 0x10) {
                g_setThrust = g_velocity = g_altitude = 0;
                g_ViewX = (int32)g_planeTable.planes[g_closestThreatIndex].mapX << 5;
                g_ViewY = (int32)(0x8000 - g_planeTable.planes[g_closestThreatIndex].mapY) << 5;
            } else {
                tempStrcpy("Automatic Landing Engaged");
                g_autoLandingActive = 1;
                i = g_frameRateScaling * 2;
                if (i > 14) {
                    i = 14;
                }
                g_velocity = 5400;
                g_altitude -= (g_altitude - g_groundAltitude) / i;
                if (g_altitude < g_groundAltitude + 5) {
                    g_altitude = g_groundAltitude + 5;
                }
                g_ViewX -= (g_ViewX - ((int32)g_planeTable.planes[g_closestThreatIndex].mapX << 5)) / (int32)i;
                g_ViewY -= (g_ViewY - ((int32)(0x8000 - g_planeTable.planes[g_closestThreatIndex].mapY) << 5)) / (int32)i;
            }
        }
    } else {
        g_landingDoneFlag = 0;
        g_inLandingCorridor = 0;
    }

skip_autopilot:
    if (g_inLandingCorridor == 0) {
        if (g_viewZ == 0) {
            if ((gameData->unk4 != 0 || g_gunHits > 4 || g_fuelRemaining == 0) &&
                g_ejectState == 0 && g_knots > 50) {
                LogInfo(("DEATH: altitude-zero crash, tick=%d var547=%d 3AA5A=%d", frameTick, g_viewZ, g_knots));
                makeSound(0, 2);
                setDrawColor(0);
                fillRectBoth(0, 0, 319, 199);
                waitFrameSync(120);
                finalizeMission(1);
            }
        } else {
            g_landingTimer = 1;
        }
    }

    if (g_savedPosVisible != 0 && (keyValue & 0x80) == 0) {
        LogInfo(("DEATH-path collision: g_savedPosVisible=%d unk4=%d var548=%d tick=%d", g_savedPosVisible, gameData->unk4, g_altitude, frameTick));
        if (gameData->unk4 != 0 && g_altitude != 0) {
            makeSound(0, 2);
            gfx_waitRetrace();
            waitFrameSync(120);
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
        val = clampRange(((g_frameRateScaling * 0x3c0) / (g_frameTimingAccum * g_timeAccelMode)), 1, 0xff);
        g_frameRateAccum = g_frameTimingAccum = 0;
        if (abs(g_frameRateScaling * 4 - val) > 3) {
            g_frameRateScaling = (int16)(val + 2) >> 2;
            recalcTimeScale();
        }
        g_enemyAlertFlag = 0;
        for (i = 3; i < g_targetEntityCount; i++) {
            if (g_planeTable.planes[i].alertLevel > 0xc0 &&
                (g_planeTable.planes[i].flags & 0x80) == 0) {
                g_enemyAlertFlag++;
                break;
            }
        }
        for (i = 0; i < g_groundUnitCount; i++) {
            if (g_simObjects[i].damage > 0xc0 &&
                (g_simObjects[i].flags.b[0] & 2) != 0) {
                g_enemyAlertFlag++;
                break;
            }
        }
    }
    dispatchKeyScancode();
}

// ==== seg000:0x14e8 ====
void dispatchKeyScancode(void) {
    int16 unused0, unused1, unused2, unused3, unused4, unused5, unused6, unused7;
#ifdef DEBUG
    if (keyScancode != 0)
        LogInfo(("KEY scancode=%04x  dot joyAxes[0/1]=%d/%d  ISR raw axes=%d/%d",
                 (uint16)keyScancode, (int16)joyAxes[0], (int16)joyAxes[1], (int16)g_joyRawX, (int16)g_joyRawY));
#endif
    keyDispatch(keyScancode);
}

// ==== seg000:0x14fc ====
void countermeasures(int16 eventType) {
    const char *name;
    int16 i, slot;

    slot = -1;
    if ((g_eventTimers[eventType])-- <= 0) {
        g_eventTimers[eventType] = 0;
        tempStrcpy("Stores exhausted");
    } else {
        for (i = 1; i < 4; i++) {
            if (mapEvents[i].ttl == 0)
                slot = i;
        }
        if (slot != -1) {
            mapEvents[slot].mapX = g_viewX_;
            mapEvents[slot].mapY = g_viewY_;
            mapEvents[slot].type = eventType;
            mapEvents[slot].ttl =
                -(g_missionStatus * 3 - 15) * g_frameRateScaling;
            switch (eventType) {
            case 1:
                name = "Flare";
                break;
            case 2:
                name = "Chaff";
                break;
            }
            strcpy(strBuf, name);
            strcat(strBuf, " released");
            tempStrcpy(strBuf);
            strcpy(strBuf, name);
            strcat(strBuf, ":");
            strcat(strBuf, itoa(g_eventTimers[eventType], g_itoaScratch, 10));
            setTimedMessage(strBuf);
        }
        makeSound(22, 2);
    }
}

// ==== seg000:0x1636 ====
void tickMessageTimers(void) {
    int16 i;
    for (i = 0; i < 4; i++) {
        if (mapEvents[i].ttl != 0) {
            (mapEvents[i].ttl)--;
            if (mapEvents[i].ttl == 0) {
                mapEvents[i].type = 0;
            }
        }
    }
}

void updateBulletsAndFire(void) {
    register int16 off;
    int16 firing, unused, i, mag, slot;

    for (i = 0; i < g_bulletTrackCount + 4; i++) {
        off = i * 12;
        if (*((int16 *)((char *)&bulletTracks[0].posX + off)) != 0) {
            *((int16 *)((char *)&bulletTracks[0].posX + off)) += *((int16 *)((char *)&bulletTracks[0].velX + off));
            *((int16 *)((char *)&bulletTracks[0].posY + off)) += *((int16 *)((char *)&bulletTracks[0].velY + off));
            *((int16 *)((char *)&bulletTracks[0].alt + off)) += *((int16 *)((char *)&bulletTracks[0].velZ + off));
        }
    }
    if (!(frameTick & 1)) {
        return;
    }
    slot = (frameTick >> 1) % g_bulletTrackCount;
    firing = readAxisInput(0);
    if (!firing) goto no_fire;
    if (g_gunAmmo <= 0) goto no_fire;
    if (g_ejectState != 0) goto no_fire;
    g_gunAmmo = clampRange(g_gunAmmo - 40 / g_frameRateScaling, 0, 1000);
    makeSound(4, 2);
    mag = 186 / g_frameRateScaling;
    *((int16 *)((char *)&bulletTracks[0].velZ + slot * 12)) = sinMul(g_ourPitch, mag) << 5;
    mag = cosMul(g_ourPitch, mag);
    *((int16 *)((char *)&bulletTracks[0].velX + slot * 12)) = sinMul(g_ourHead, mag);
    *((int16 *)((char *)&bulletTracks[0].velY + slot * 12)) = -cosMul(g_ourHead, mag);
    off = slot * 12;
    *((int16 *)((char *)&bulletTracks[0].posX + off)) = *((int16 *)((char *)&bulletTracks[0].velX + off)) + g_viewX_;
    *((int16 *)((char *)&bulletTracks[0].posY + off)) = *((int16 *)((char *)&bulletTracks[0].velY + off)) + g_viewY_;
    *((int16 *)((char *)&bulletTracks[0].alt + off)) = *((int16 *)((char *)&bulletTracks[0].velZ + off)) + g_viewZ - 2;
    g_gunFiredFlag = 1;
    goto done_fire;
no_fire:
    *((int16 *)((char *)&bulletTracks[0].posX + slot * 12)) = 0;
    g_gunFiredFlag = 0;
done_fire:
    if (firing) {
        strcpy(strBuf, "GUN:");
        strcat(strBuf, itoa(g_gunAmmo, g_itoaScratch, 10));
        setTimedMessage(strBuf);
    }
}

// ==== seg000:0x1841 ====
void updateTracerParticles() {
    int16 i, slot;

    if (g_smokeSourceIdx != -1) {
        for (i = 0; i < 8; i++) {
            g_particles[i].alt += 10;
            g_particles[i].posY += g_particles[i].alt >> 9;
            *(((char *)&g_particles[i].spin) + 1) += 6;
        }
        if (!((char)frameTick & 0x0f)) {
            slot = (frameTick >> 4) & 7;
            g_particles[slot].posX = g_planeTable.planes[g_smokeSourceIdx].mapX;
            g_particles[slot].posY = g_planeTable.planes[g_smokeSourceIdx].mapY;
            g_particles[slot].alt = 0x80;
            g_particles[slot].spin = randomRange(0x100) << 8;
            g_smokeParticleSlot = slot;
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
    int16 seedSum, unused0, unused1, unused2;

    seedRng();
    clearStatusPanel();
    frameTick = randomRange(0x1000) & 0x7ff8;
    seedSum = g_targetSlots[0].seedNoise + g_targetSlots[1].seedNoise;
    g_nightMode = (gameData->theater == 6 ? 5 : 9) < randomRange(0x10);
    if (g_nightMode && g_dacSupported) {
        setupDac();
    }
    g_unusedFrameVal = (seedSum & 0xF) << 8;
    g_missionTick = 0;
}

// ==== seg000:0x1971 ====
void resetSimObjectLocks() {
    int16 i;
    for (i = 0; i < g_groundUnitCount; i++) {
        g_simObjects[i].terrainColor = -1;
    }
    g_trackedEnemyIdx = -1;
}

// ==== seg000:0x19a3 ====
void initWeaponLoadout() {
    int16 i;

    i = g_gunHits = g_bombDamageMask = 0;
    for (; i < 3; i++) {
        missleSpec[i].weaponIdx = commData->weaponType[i];
        missleSpec[i].ammo = commData->weaponCount[i];
    }
    g_gunAmmo = 1000;
    g_fuelRemaining = 10000;
    g_eventTimers[2] = 18;
    g_eventTimers[1] = 12;
    drawWeaponAmmo();
    drawFuelGauge();
    UpdateThrottleState();
}

// ==== seg000:0x1a18 routine_131 ====
void drawWeaponAmmo() {
    int16 x, i;

    if (g_hudVisible == 0) {
        return;
    }
    for (i = 0; i < 3; i++) {
        setDrawColor(0);
        x = g_tacmapIndicators[i];
        fillRectBoth(x - 1, 190, x + 2, 194);
        drawNumber(missleSpec[i].ammo, x, 190, 0x0c);
    }
}

// ==== seg000:0x1a88 ====
void drawWeaponSelectMarker(int16 weaponIdx) {
    if (g_hudVisible == 0) return;
    g_pageFront[2] = 0;
    drawFullscreenLine(g_weaponMarkerBoxX[g_weaponMarkerSel], 196, g_weaponMarkerBoxX[g_weaponMarkerSel] + 6, 196);
    g_pageFront[2] = 7;
    drawFullscreenLine(g_weaponMarkerBoxX[g_weaponMarkerSel], 197, g_weaponMarkerBoxX[g_weaponMarkerSel] + 6, 197);
    g_pageFront[2] = 0x0c;
    drawFullscreenLine(g_weaponMarkerBoxX[weaponIdx], 196, g_weaponMarkerBoxX[weaponIdx] + 6, 196);
    g_pageFront[2] = 4;
    drawFullscreenLine(g_weaponMarkerBoxX[weaponIdx], 197, g_weaponMarkerBoxX[weaponIdx] + 6, 197);
    g_weaponMarkerSel = weaponIdx;
}

// ==== seg000:0x1b37 routine_148 ====
void finalizeMission(int16 outcome) {
    LogInfo(("DEATH/END finalizeMission: outcome=%d, g_ejectState=%d, tick=%d", outcome, g_ejectState, frameTick));
    if (g_ejectState != 0 && outcome != 0) {
        return;
    }
    g_missionEndedFlag[0] = 1;
    commData->continueFlag = outcome;
    if (outcome == 0 && g_ejectState == 0) {
        commData->setupDone = 3;
    }
    commData->worldX = g_viewX_;
    commData->worldY = g_viewY_;
    commData->bombDamage = g_bombDamageMask;
    commData->gunHits = g_gunHits;
    commData->weaponCount[0] = g_finalThreatScore;
    commData->weaponCount[1] = g_resupplyCount;
    appendMapEvent(8, 0);
}

// ==== seg000:0x1bc3 ====
void scheduleEventCheck(int16 eventObjIdx, uint16 priority) {
    if (priority > (uint16)g_directorMode) return;
    if (g_directorEventDeadline != -1) return;
    g_viewTargetObj = eventObjIdx;
    scheduleTimedEvent(0x89, g_directorMode == 1 ? 3 : 4);
}

// ==== seg000:0x1bfd scheduleTimedEvent ====
void scheduleTimedEvent(int16 keyVal, int16 delay) {
    if (g_directorMode == 0) {
        return;
    }
    keyValue = keyVal;
    g_directorEventDeadline = delay * g_frameRateScaling + frameTick;
}

// ==== seg000:0x1c21 routine_180 ====
void generateRandomRadioMessage(void) {
    int16 idx;

    if (g_directorEventDeadline != -1) {
        return;
    }
    g_autopilotAltitude = 500;
    g_directorMode = 2;
    switch (randomRange(3)) {
    case 0:
        idx = randomRange(g_planeCount - 3) + 3;
        g_viewTargetObj = idx + 0x40;
        keyValue = 0x89;
        placeString(idx);
        tempStrcpy(strBuf);
        break;
    case 1:
        do {
            idx = randomRange(g_groundUnitCount);
        } while (g_simObjects[idx].speed == 0);
        g_viewTargetObj = idx + 0x20;
        keyValue = 0x89;
        strcpy(strBuf, aircraftTypes[g_simObjects[idx].spec].name);
        strcat(strBuf, " on patrol");
        tempStrcpy(strBuf);
        break;
    case 2:
        keyValue = 0x87;
        tempStrcpy("F15 Strike Eagle");
        break;
    }
}

// ==== seg000:0x1d10 ====
void appendMapEvent(int16 eventType, int16 eventArg) {
    if (g_eventLogCount >= 255) {
        return;
    }
    g_replayLog.events[g_eventLogCount].coord = g_missionTick;
    g_replayLog.events[g_eventLogCount].screenX = (uint16)g_viewX_ >> 7;
    g_replayLog.events[g_eventLogCount].screenY = (uint16)g_viewY_ >> 7;
    g_replayLog.events[g_eventLogCount].type = eventType;
    g_replayLog.events[g_eventLogCount].arg = eventArg;
    g_eventLogCount++;
    g_replayLog.events[g_eventLogCount].type = 0;
}

// ==== seg000:0x1d6e placeString ====
void placeString(int16 waypointIdx) {
    strcpy(strBuf, g_targetNameTable[(g_planeTable.planes[waypointIdx].nameIndex) & 0x7f]);
    if (strlen(g_targetNameTable[((int16 *)&g_planeTable)[waypointIdx * 8]])) {
        if (strlen(g_targetNameTable[(g_planeTable.planes[waypointIdx].nameIndex) & 0x7f])) {
            strcat(strBuf, " at ");
        }
        strcat(strBuf, g_targetNameTable[((int16 *)&g_planeTable)[waypointIdx * 8]]);
    }
    if ((int16)strlen(strBuf) > 25) {
        g_strTruncDot = '.';
        g_strTruncTerm[0] = 0;
    }
}

// ==== seg000:0x1e0e ====
void initMissionStrings() {
    int16 nameIdx, i;
    setCommWorldbufPtr();
    flagFarToNear = 1;
    moveStuff();
    g_targetNameTable[0] = g_stringPool;
    nameIdx = 1;
    for (i = 0; i < 750; ++i) {
        if (g_stringPool[i] == 0 && nameIdx < 100) {
            g_targetNameTable[nameIdx++] = &g_stringPool[i + 1];
        }
    }
    if (gameData->difficulty != 0) { // 1e6c
        g_ViewX = ((int32)(g_planeTable.planes[g_targetSlots[0].viewIndex].mapX) << 5) + 2;
        g_ViewY = (0x8000 - (int32)(g_planeTable.planes[g_targetSlots[0].viewIndex].mapY)) << 5;
    } else {
        g_ViewX = ((int32)waypoints[0].mapX << 5) + 2;
        g_ViewY = (0x8000 - (int32)waypoints[0].mapY) << 5;
    }
    g_viewX_ = (g_ViewX + 0x10) >> 5;
    g_viewY_ = 0x8000 - ((g_ViewY + 0x10) >> 5);
}

// ==== seg000:0x1f3e ====
void findWaypointFeatures() {
    int16 nameIdx, slot;

    nameIdx = size3d3;
    for (slot = 0; slot < 2; slot++) {
        if (g_targetSlots[slot].flags >> 8 != 0) {
            g_nearestTileObj = findNearestTileObject(
                (uint32)(uint16)g_planeTable.planes[g_targetSlots[slot].planeIndex].mapX << 5,
                (0x8000L - (uint32)(uint16)g_planeTable.planes[g_targetSlots[slot].planeIndex].mapY) << 5);
            if (g_nearestTileObj != 0) {
                g_shapeTargetCategory[nameIdx] = g_shapeTargetCategory[g_nearestTileObj->id];
                strcpy(g_targetNameTable[nameIdx], g_targetNameTable[g_nearestTileObj->id]);
                g_targetNameTable[nameIdx + 1] = g_targetNameTable[nameIdx] + strlen(g_targetNameTable[nameIdx]) + 1;
                addTileEntry(g_nearestTileObj, shapeDataOffset(nameIdx + 0x100), nameIdx + 0x100);
            }
            g_planeTable.planes[g_targetSlots[slot].planeIndex].nameIndex = nameIdx + 0x100;
            nameIdx++;
        }
    }
    g_render3DTiles = 0;
}

// ==== seg000:0x2049 ====
void moveDataFar() {
    int16 unused1, unused2;
    setCommWorldbufPtr();
    flagFarToNear = 0;
    moveStuff();
    moveNearFar(g_replayLog.events, sizeof(g_replayLog.events));
}

// ==== seg000:0x206d ====
void moveStuff() {
    moveNearFar(g_landTargetId, 1);
    moveNearFar(g_waterTargetId, 1);
    moveNearFar(&g_planeCount, 2);
    moveNearFar(&g_targetEntityCount, 2);
    moveNearFar(&g_planeScanCount, 2);
    moveNearFar(&g_planeTable, g_planeCount * (int16)sizeof(struct MapTarget));
    moveNearFar(&g_groundUnitCount, 2);
    moveNearFar(g_simObjects, g_groundUnitCount * (int16)sizeof(struct SimObject));
    moveNearFar(g_shapeTargetCategory, sizeof(g_shapeTargetCategory));
    moveNearFar(g_tileKillTally, sizeof(g_tileKillTally));
    moveNearFar(g_stringPool, sizeof(g_stringPool));
    moveNearFar(g_mapCellFlags, sizeof(g_mapCellFlags));
    moveNearFar(&g_unusedSavedWord, 2);
    moveNearFar(&g_padlockAircraft, 2);
    moveNearFar(waypoints, sizeof(waypoints));
    moveNearFar(g_targetSlots, sizeof(g_targetSlots));
}

// ==== seg000:0x215c ====
void moveNearFar(void *nearPtr, int16 count) {
    void FAR *farPtr = nearPtr;
    if (flagFarToNear != 0) {
        movedata(FP_SEG(farPointer), FP_OFF(farPointer), FP_SEG(farPtr), FP_OFF(farPtr), count);
    } else {
        movedata(FP_SEG(farPtr), FP_OFF(farPtr), FP_SEG(farPointer), FP_OFF(farPointer), count);
    }
    farPointer += count;
}

// ==== seg000:0x21a9 ====
int16 setCommWorldbufPtr() {
    farPointer = (uint8 FAR *)&commData->worldBuf;
    return 0;
}
