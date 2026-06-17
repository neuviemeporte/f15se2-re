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
    TRACE(("updateFrame: enter, word_3BECC=%d", word_3BECC));
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

    if (word_3BECC == 1) {
        g_playerPlaneFlags = 0;
        if (gameData->difficulty == 4) {
            gameData->difficulty = 2;
            word_336EA = 1;
            g_playerPlaneFlags |= 0x1000;
            *(char far *)((char far *)commData + 0x30) |= 1;
        }
        d = (unsigned char)*((char far *)commData + 0x0d);
        if (d == 0x69 || d == 0x49) {
            var_600 = 1;
        }
        findWaypointFeatures();
        TRACE(("updateFrame: past 11F3E"));
        word_336F0 = 0;
        word_336F8 = 1;
        word_336F2 = word_336F4 = -1;
        var_597 = word_33096 = missileSpecIndex = g_autopilotAltitude = waypointIndex = word_32A34 = 0;
        g_closestThreatIndex = word_3BED4 = word_3BFA0 = word_3C014 = var_456 = 0;
        word_3B4D8 = word_3B4E0 = word_3B5D6 = 0;
        word_33700 = word_336F6 = -1;
        word_33098 = 10000;
        g_gunHits = 0;
        waypointIndex = 1;
        g_currentWeaponType = 1;
        drawWeaponSelectMarker(0);
        var_383 = 0x0c;
        g_frameRateScaling = 4;
        recalcTimeScale();
        byte_383E5 = 1;
        var_588 = 1;
        p = word_3AFA8 = (gameData->theater == 6) ? 1 :
            (*((char far *)gameData + 0x38) & 1) ? 1 : -1;

        if (((g_planes[g_targetSlots[0].viewIndex].flags) & 0x200) != 0) {
            g_ViewX -= (long)(p * 0x80);
            *(char *)&g_playerPlaneFlags |= 8;
        } else {
            g_ViewY -= (long)(0x708 * word_3AFA8);
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
        word_336F4 = word_336F2 = -1;
        word_330BA = 2;
        g_missionStatus = gameData->difficulty;
        gameData->unk4 = 1;
        word_38FDC = *(int far *)((char far *)commData + 0x32);
        setupLodDistances();
        *(int far *)((char far *)commData + 0x26) = 1;
        word_330B4 = 1000;
        if (g_missionStatus == 0 || word_336EA != 0) {
            word_3AFA8 = ((unsigned)(g_viewY_ - var_47) < 0x8000u) ? 1 : -1;
            word_380D0 = 2000;
            g_velocity = 0x1fa4;
            g_setThrust = 100;
            UpdateThrottleState();
            *(char *)&g_playerPlaneFlags |= 1;
            *(char *)&g_playerPlaneFlags &= ~8;
            if ((*(int far *)((char far *)gameData + 0x32) | *(int far *)((char far *)gameData + 0x34)) == 0 && gameData->theater != 6) {
                for (d = 0; d < word_3C046 - 4; d++) {
                    if ((d & 1) == 0) {
                        stru_3B202[d].flags.b[0] |= 2;
                        stru_3B202[d].alt = 0x898;
                        stru_3B202[d].speed = 300;
                        stru_3B202[d].posX = d * 12 + g_viewX_ - 0x24;
                        stru_3B202[d].posY = g_viewY_ - (d * 0x20 + 0x96) * word_3AFA8;
                        stru_3B202[d].worldX = (long)stru_3B202[d].posX * 32;
                        stru_3B202[d].worldY = (long)stru_3B202[d].posY * 32;
                        stru_3B202[d].heading.w = g_ourHead + 0x8000;
                    }
                }
            }
        }
        if (gameData->theater != 6) {
            stru_3B202[1].flags.b[0] |= 2;
            stru_3B202[1].alt = 0x834;
            stru_3B202[1].speed = 700;
            var_810 = g_viewX_;
            var_811 = 0x50 * word_3AFA8 + g_viewY_;
            stru_3B202[1].worldX = (long)var_810 * 32;
            stru_3B202[1].worldY = (long)var_811 * 32;
            stru_3B202[1].heading.w = g_ourHead;
        }
        word_3AFA8 = p;
        initWeaponLoadout();
        word_3BECC = 2;
        gfx_flipPage();
        word_38FF6 = computeThreatScore();
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
        byte_3C5A0 = -(gfx_getDisplayPage() - 1);
        gfx_copyRect(2, b - 3, c - 3, byte_3C5A0, b - 3, c - 3, 6, 6);
        blitSprite(b - 1, c - 1, ((g_ourHead + 0x1000) >> 0xd & 7) * 4 + 0xa4, 4, 4, 4, 0);
        byte_3C5A0 = 1 - byte_3C5A0;
        if (((int16)b < 0x20 || (int16)b > 0x58 || (int16)c < 0x76 || (int16)c > 0xa2) && byte_383E5 > 2) {
            byte_383E5--;
            redrawTacMap(g_viewX_, g_viewY_);
        }
    } else {
        redrawTacMap(g_viewX_, g_viewY_);
    }

    word_3AF0C = g_viewX_;
    word_3AFAA = g_viewY_;

    if (word_3370C == frameTick) {
        if (word_336EA == 0) {
            keyValue = 0;
        }
        word_3370C = -1;
    }
    if (word_336F0 != 0) {
        word_336F0--;
    }
    if (word_336EE != 0 && frameTick == word_336EE) {
        word_336EE = 0;
        playVoiceCue(2);
    }

    if ((frameTick & 7) != 0) goto skip_target_section;

    word_33700 = g_closestThreatIndex;
    word_38FEE = 0x7fff;
    for (d = 0; d < word_3BED2; d++) {
        if ((g_planes[d].flags & 0x201) != 0 &&
            (g_planes[d].flags & 0x500) != 0 &&
            (g_planes[d].flags & 0x800) == 0) {
            p = rangeApprox(g_viewX_ - g_planes[d].mapX, g_viewY_ - g_planes[d].mapY);
            if (p < word_38FEE) {
                word_38FEE = p;
                g_closestThreatIndex = d;
            }
        }
    }
    if (word_33700 != g_closestThreatIndex) {
        g_targetSlots[1].viewIndex = g_closestThreatIndex;
        var_48 = g_planes[g_closestThreatIndex].mapX;
        var_49 = g_planes[g_closestThreatIndex].mapY;
    }

    /* Magic signature check, only done when the plane is moving? */
    if ((char)frameTick == 0 && frameTick != 0) {
        if (*((int32 HUGE*)commData - 1) != COMM_MCB_VALUE_MAGIC) {
            finalizeMission(1);
            exitCode = 0;
        }
    }

    if (word_33700 != g_closestThreatIndex && (g_planes[g_closestThreatIndex].flags & 0x800) == 0) {
        for (d = 1; d <= 2; d++) {
            stru_3B202[word_3C046 - d].flags.b[0] &= ~2;
            stru_3B202[word_3C046 - d].spec = g_planes[g_closestThreatIndex].flags & 0x400 ? 0x0d : 0;
            if (g_planes[g_closestThreatIndex].flags & 0x100) {
                stru_3B202[word_3C046 - d].spec = 0x12;
            }
            stru_3B202[word_3C046 - d].objType = g_closestThreatIndex;
        }
        for (d = 3; d <= 4; d++) {
            e = word_3C046 - d;
            stru_3B202[e].flags.b[0] |= 2;
            stru_3B202[e].posX = g_planes[g_closestThreatIndex].mapX;
            stru_3B202[e].posY = g_planes[g_closestThreatIndex].mapY;
            if ((g_planes[g_closestThreatIndex].flags & 0x200) != 0) {
                stru_3B202[e].posX += word_3AFA8 * 5;
                stru_3B202[e].posY += (d & 1) * word_3AFA8 * 0x10;
                stru_3B202[e].alt = 0x84;
            } else {
                stru_3B202[e].posX += 10;
                stru_3B202[e].posY += (d + g_closestThreatIndex & 3) * 0x10;
                stru_3B202[e].alt = 4;
            }
            stru_3B202[e].worldX = (long)stru_3B202[e].posX << 5;
            stru_3B202[e].worldY = (long)stru_3B202[e].posY << 5;
            stru_3B202[e].heading.w = -randomRange(0x4000);
            stru_3B202[e].spec = g_planes[g_closestThreatIndex].flags & 0x400 ? 8 : 0x0b;
            if (g_planes[g_closestThreatIndex].flags & 0x100) {
                stru_3B202[e].spec = 9;
            }
        }
    }

    if ((frameTick & 0x7f) == 0) {
        if ((g_planes[g_closestThreatIndex].flags & 0x800) == 0) {
            e = frameTick & 0x80 ? word_3C046 - 1 : word_3C046 - 2;
            if ((stru_3B202[e].flags.b[0] & 2) == 0) {
                spawnEnemyAircraft(e, g_closestThreatIndex);
                stru_3B202[e].flags.w = 0x207;
                stru_3B202[e].alt = 1000;
                stru_3B202[e].speed = 0xfa;
                stru_3B202[e].worldY += word_3AFA8 * 0x3000;
            }
        }
        word_3C014 = word_3BFA0;
        word_3BFA0 = word_3BED4;
        word_3BED4 = 0;
    }

skip_target_section:
    if (word_38FEE < 0x200 || word_3BEBE == g_viewZ) {
        word_3BEBE = 0;
        word_38FFC = 0xa0;
        word_39200 = 0x800;
        if (g_planes[g_closestThreatIndex].flags & 0x800) {
            word_39200 = 0x400;
        }
        if (g_planes[g_closestThreatIndex].flags & 0x200) {
            word_3BEBE = 0x80;
            word_38FFC = 0x100;
            word_39200 = 0x3c0;
            if (g_viewZ == 0x80 && g_knots > 0x50) {
                if ((unsigned)(g_viewY_ - g_planes[g_closestThreatIndex].mapY) * word_3AFA8 >= 0x10 && (unsigned)(g_viewY_ - g_planes[g_closestThreatIndex].mapY) * word_3AFA8 <= 0x14) {
                    if (abs(g_ourHead - ((1 - word_3AFA8) << 0xe)) < 0x2000) {
                        word_38FDE = 1;
                        makeSound(0x16, 2);
                    }
                }
            }
        }
        if (gameData->unk4 == 1) {
            word_38FFC += 0x100;
            word_39200 += 0x200;
        }
        if (abs(g_viewX_ - g_planes[g_closestThreatIndex].mapX) > (word_38FFC >> 5) ||
                (abs(g_viewY_ - g_planes[g_closestThreatIndex].mapY) > (word_39200 >> 5))) {
            word_3BEBE = 0;
            word_33702 = 0;
        } else {
            word_33702 = 1;
            if ((g_knots <= 1) && ((frameTick & 7) == 0) && g_planes[g_closestThreatIndex].flags & 0x500
                    && word_33714 != 0 && !(g_planes[g_closestThreatIndex].flags & 0x800)) {
                word_336EC = 1;
                word_33706 = 1;
                if (word_33714++ == 1) {
                    tempStrcpy(aSafeLanding);
                    g_autopilotAltitude = 0;
                    word_33712 = 0;
                    playVoiceCue(4);
                }
                if ((g_playerPlaneFlags & 0x6000) == 0x6000) {
                    if (word_33714 > g_frameRateScaling) {
                        finalizeMission(0);
                    }
                } else {
                    if (word_33714 == 2) {
                        word_33710++;
                        appendMapEvent(10, g_closestThreatIndex);
                    }
                    if (word_33714 > g_frameRateScaling) {
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
        if ((word_33706 == 0) && (g_missionStatus == 0) && g_playerPlaneFlags & 0x6000) {
            if (abs(g_viewX_ - g_planes[g_closestThreatIndex].mapX) < 0x10 && abs(g_viewY_ - g_planes[g_closestThreatIndex].mapY) < 0x10) {
                g_setThrust = g_velocity = word_380D0 = 0;
                g_ViewX = (long)g_planes[g_closestThreatIndex].mapX << 5;
                g_ViewY = (long)(0x8000 - g_planes[g_closestThreatIndex].mapY) << 5;
            } else {
                tempStrcpy(aAutomaticLandi);
                word_33712 = 1;
                d = g_frameRateScaling * 2;
                if (d > 0x0e) {
                    d = 0x0e;
                }
                g_velocity = 0x1518;
                word_380D0 -= (word_380D0 - word_3BEBE) / d;
                if (word_380D0 < word_3BEBE + 5) {
                    word_380D0 = word_3BEBE + 5;
                }
                g_ViewX -= (g_ViewX - ((long)g_planes[g_closestThreatIndex].mapX << 5)) / (long)d;
                g_ViewY -= (g_ViewY - ((long)(0x8000 - g_planes[g_closestThreatIndex].mapY) << 5)) / (long)d;
            }
        }
    }
    else {
        word_33706 = 0;
        word_33702 = 0;
    }

skip_autopilot:
    TRACE(("updateFrame: skip_autopilot, w33702=%d var547=%d unk4=%d 3BF90=%d 33098=%d 3BE3C=%d 3AA5A=%d", word_33702, g_viewZ, gameData->unk4, g_gunHits, word_33098, word_3BE3C, g_knots));
    if (word_33702 == 0) {
        if (g_viewZ == 0) {
            if ((gameData->unk4 != 0 || g_gunHits > 4 || word_33098 == 0) &&
                word_3BE3C == 0 && g_knots > 0x32) {
                TRACE_KEY(("DEATH: altitude-zero crash, tick=%d var547=%d 3AA5A=%d", frameTick, g_viewZ, g_knots));
                makeSound(0, 2);
                setDrawColor(0);
                fillRectBoth(0, 0, 0x13f, 199);
                waitFrameSync(0x78);
                finalizeMission(1);
            }
        } else {
            word_33714 = 1;
        }
    }

    if (byte_3995A != 0 && (keyValue & 0x80) == 0) {
        TRACE_KEY(("DEATH-path collision: byte_3995A=%d unk4=%d var548=%d tick=%d", byte_3995A, gameData->unk4, word_380D0, frameTick));
        if (gameData->unk4 != 0 && word_380D0 != 0) {
            makeSound(0, 2);
            gfx_waitRetrace();
            waitFrameSync(0x78);
            finalizeMission(2);
        } else {
            word_380D0 += 500;
            g_autopilotAltitude = 0;
        }
    }

    word_3C0A0 = (g_planes[g_closestThreatIndex].flags & 0x200 && word_38FEE < 0x500) ? (((word_3AFA8 << 8) / g_frameRateScaling) + word_3C0A0) & 0xfff : 0;

    frameTick++;
    if (frameTick % g_frameRateScaling == 0) {
        word_38FE0++;
        if ((word_38FE0 & 0x1f) == 0) {
            appendMapEvent(9, 0);
        }
        if (word_38FE0 == 1) {
            playVoiceCue(0);
            updateEngineSound();
        }
        if (word_336EA != 0 && (word_38FE0 & 3) == 0) {
            generateRandomRadioMessage();
        }
    }

    if (++word_33708 >= g_frameRateScaling * 4) {
        word_3C6AE = var_383 / g_frameRateScaling;
        var_383 -= (var_595 * 2 - 1) * g_frameRateScaling * 2;
        if (var_383 < 4) {
            var_383 = 4;
        }
        b = clampRange(((g_frameRateScaling * 0x3c0) / (var_383 * word_3370A)), 1, 0xff);
        word_33708 = var_383 = 0;
        if (abs(g_frameRateScaling * 4 - b) > 3) {
            g_frameRateScaling = (int16)(b + 2) >> 2;
            recalcTimeScale();
        }
        word_3C09C = 0;
        for (d = 3; d < word_38FFA; d++) {
            if (g_planes[d].field_8 > 0xc0 &&
                (g_planes[d].flags & 0x80) == 0) {
                word_3C09C++;
                break;
            }
        }
        for (d = 0; d < word_3C046; d++) {
            if (stru_3B202[d].damage > 0xc0 &&
                (stru_3B202[d].flags.b[0] & 2) != 0) {
                word_3C09C++;
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
        TRACE_KEY(("KEY scancode=%04x  dot joyAxes[0/1]=%d/%d  ISR stick(joyAxes[4/5])=%d/%d",
            (unsigned)keyScancode, (int)joyAxes[0], (int)joyAxes[1], (int)joyAxes[4], (int)joyAxes[5]));
#endif
    keyDispatch(keyScancode);
}

// ==== seg000:0x14fc ====
void countermeasures(int param_1) {
    char *p;
    int a;
    int b;

    b = -1;
    if ((word_3309A[param_1])-- <= 0) {
        word_3309A[param_1] = 0;
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
            strcat(strBuf, (char *)asc_3373D);
            strcat(strBuf, itoa(word_3309A[param_1], unk_3C030, 10));
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

    for (c = 0; c < word_3AFA4 + 4; c++) {
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
    e = (frameTick >> 1) % word_3AFA4;
    a = readAxisInput(0);
    if (!a) goto no_fire;
    if (word_330B4 <= 0) goto no_fire;
    if (word_3BE3C != 0) goto no_fire;
    word_330B4 = clampRange(word_330B4 - 40 / g_frameRateScaling, 0, 1000);
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
    word_38FE8 = 1;
    goto done_fire;
no_fire:
    *((int16 *)((char *)&bulletTracks[0].posX + e * 12)) = 0;
    word_38FE8 = 0;
done_fire:
    if (a) {
        strcpy(strBuf, aGun);
        strcat(strBuf, itoa(word_330B4, unk_3C030, 10));
        setTimedMessage(strBuf);
    }
}

// ==== seg000:0x1841 ====
void updateTracerParticles() {
    int p;
    int a;

    if (word_336F6 != -1) {
        for (p = 0; p < 8; p++) {
            stru_33402[p].field_4 += 0x0a;
            stru_33402[p].field_2 += stru_33402[p].field_4 >> 9;
            *(((char *)&stru_33402[p].field_6) + 1) += 6;
        }
        if (!((char)frameTick & 0x0f)) {
            a = (frameTick >> 4) & 7;
            stru_33402[a].field_0 = g_planes[word_336F6].mapX;
            stru_33402[a].field_2 = g_planes[word_336F6].mapY;
            stru_33402[a].field_4 = 0x80;
            stru_33402[a].field_6 = randomRange(0x100) << 8;
            word_33442 = a;
        }
    }
}

// ==== seg000:0x18d5 ====
void applyGravityFall() {
    if (word_3BFA2 > 0) {
        if (word_3B4DC > -16) {
            word_3B4DC -= 12;
        }
        word_3BFA2 += word_3B4DC;
    }
}

// ==== seg000:0x18f6 ====
void initFrameRandom(void) {
    int p, a, b, c;

    seedRng();
    clearStatusPanel();
    frameTick = randomRange(0x1000) & 0x7ff8;
    p = g_targetSlots[0].word_8 + g_targetSlots[1].word_8;
    word_330BC = (gameData->theater == 6 ? 5 : 9) < randomRange(0x10);
    if (word_330BC && byte_32933) {
        setupDac();
    }
    word_38F70 = (p & 0xF) << 8;
    word_38FE0 = 0;
}

// ==== seg000:0x1971 ====
void resetSimObjectLocks() {
    int p;
    for (p = 0; p < word_3C046; p++) {
        stru_3B202[p].terrainColor = -1;
    }
    word_336E6 = -1;
}

// ==== seg000:0x19a3 ====
void initWeaponLoadout() {
    int p;

    p = g_gunHits = word_33096 = 0;
    for (; p < 3; p++) {
        missleSpec[p].weaponIdx = commData->weaponType[p];
        missleSpec[p].ammo = commData->weaponCount[p];
    }
    word_330B4 = 0x3e8;
    word_33098 = 0x2710;
    word_3309A[2] = 0x12;
    word_3309A[1] = 0x0c;
    drawWeaponAmmo();
    drawFuelGauge();
    UpdateThrottleState();
}

// ==== seg000:0x1a18 routine_131 ====
void drawWeaponAmmo() {
    int p;
    int a;

    if (word_330C2 == 0) {
        return;
    }
    for (a = 0; a < 3; a++) {
        setDrawColor(0);
        p = (&word_38202)[a];
        fillRectBoth(p - 1, 0xbe, p + 2, 0xc2);
        drawNumber(missleSpec[a].ammo, p, 0xbe, 0x0c);
    }
}

// ==== seg000:0x1a88 ====
void drawWeaponSelectMarker(int weaponIdx) {
    if (word_330C2 == 0) return;
    off_38334[2] = 0;
    drawFullscreenLine(asc_33744[word_3374A], 0xc4, asc_33744[word_3374A] + 6, 0xc4);
    off_38334[2] = 7;
    drawFullscreenLine(asc_33744[word_3374A], 0xc5, asc_33744[word_3374A] + 6, 0xc5);
    off_38334[2] = 0x0c;
    drawFullscreenLine(asc_33744[weaponIdx], 0xc4, asc_33744[weaponIdx] + 6, 0xc4);
    off_38334[2] = 4;
    drawFullscreenLine(asc_33744[weaponIdx], 0xc5, asc_33744[weaponIdx] + 6, 0xc5);
    word_3374A = weaponIdx;
}

// ==== seg000:0x1b37 routine_148 ====
void finalizeMission(int outcome) {
    TRACE_KEY(("DEATH/END finalizeMission: outcome=%d, word_3BE3C=%d, tick=%d", outcome, word_3BE3C, frameTick));
    if (word_3BE3C != 0 && outcome != 0) {
        return;
    }
    byte_3C8B0[0] = 1;
    commData->continueFlag = outcome;
    if (outcome == 0 && word_3BE3C == 0) {
        commData->setupDone = 3;
    }
    *(int16 far *)((char far *)commData + 0x74) = g_viewX_;
    *(int16 far *)((char far *)commData + 0x76) = g_viewY_;
    *(int16 far *)((char far *)commData + 0x34) = word_33096;
    *(int16 far *)((char far *)commData + 0x36) = g_gunHits;
    commData->weaponCount[0] = word_38FF6;
    commData->weaponCount[1] = word_33710;
    appendMapEvent(8, 0);
}

// ==== seg000:0x1bc3 ====
void scheduleEventCheck(int eventObjIdx, unsigned int priority) {
    if (priority > (unsigned int)word_3370E) return;
    if (word_3370C != -1) return;
    word_3C02E = eventObjIdx;
    scheduleTimedEvent(0x89, word_3370E == 1 ? 3 : 4);
}

// ==== seg000:0x1bfd scheduleTimedEvent ====
void scheduleTimedEvent(int keyVal, int delay) {
    if (word_3370E == 0) {
        return;
    }
    keyValue = keyVal;
    word_3370C = delay * g_frameRateScaling + frameTick;
}

// ==== seg000:0x1c21 routine_180 ====
void generateRandomRadioMessage(void) {
    int p;

    if (word_3370C != -1) {
        return;
    }
    g_autopilotAltitude = 500;
    word_3370E = 2;
    switch (randomRange(3)) {
    case 0:
        p = randomRange(word_3BED2 - 3) + 3;
        word_3C02E = p + 0x40;
        keyValue = 0x89;
        placeString(p);
        tempStrcpy(strBuf);
        break;
    case 1:
        do {
            p = randomRange(word_3C046);
        } while (stru_3B202[p].speed == 0);
        word_3C02E = p + 0x20;
        keyValue = 0x89;
        strcpy(strBuf, aircraftTypes[stru_3B202[p].spec].name);
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
    if (var_654 >= 255) {
        return;
    }
    byte_3B7FC.events[var_654].coord = word_38FE0;
    byte_3B7FC.events[var_654].screenX = (unsigned)g_viewX_ >> 7;
    byte_3B7FC.events[var_654].screenY = (unsigned)g_viewY_ >> 7;
    byte_3B7FC.events[var_654].type = eventType;
    byte_3B7FC.events[var_654].arg = arg_2;
    var_654++;
    byte_3B7FC.events[var_654].type = 0;
}

// ==== seg000:0x1d6e placeString ====
void placeString(int waypointIdx) {
    strcpy(strBuf, word_3C0A2[(g_planes[waypointIdx].field_C) & 0x7f]);
    if (strlen(word_3C0A2[word_3AA5C[waypointIdx * 8]])) {
        if (strlen(word_3C0A2[(g_planes[waypointIdx].field_C) & 0x7f])) {
            strcat(strBuf, aAt);
        }
        strcat(strBuf, word_3C0A2[word_3AA5C[waypointIdx * 8]]);
    }
    if ((int)strlen(strBuf) > 25) {
        byte_38F8C = '.';
        byte_38F8D[0] = 0;
    }
}

// ==== seg000:0x1e0e ====
void initMissionStrings() {
    int var_2, var_4;
    setCommWorldbufPtr();
    flagFarToNear = 1;
    moveStuff();
    word_3C0A2[0] = byte_3C16E;
    var_2 = 1;
    for (var_4 = 0; var_4 < 750; ++var_4) {
        if (byte_3C16E[var_4] == 0 && var_2 < 100) {
            word_3C0A2[var_2++] = &byte_3C16E[var_4+1];
        }
    }
    if (gameData->difficulty != 0) { //1e6c
        g_ViewX = ((int32)(g_planes[g_targetSlots[0].viewIndex].mapX) << 5) + 2;
        g_ViewY = (0x8000 - (int32)(g_planes[g_targetSlots[0].viewIndex].mapY)) << 5;
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
            word_39808 = findNearestTileObject(
                (unsigned long)(unsigned)g_planes[g_targetSlots[p].planeIndex].mapX << 5,
                (0x8000L - (unsigned long)(unsigned)g_planes[g_targetSlots[p].planeIndex].mapY) << 5);
            if (word_39808 != 0) {
                byte_3BFA4[a] = byte_3BFA4[word_39808->id];
                strcpy(word_3C0A2[a], (char *)word_3C0A2[word_39808->id]);
                word_3C0A2[a + 1] = word_3C0A2[a] + strlen(word_3C0A2[a]) + 1;
                addTileEntry((char *)word_39808, shapeDataOffset(a + 0x100), a + 0x100);
            }
            g_planes[g_targetSlots[p].planeIndex].field_C = a + 0x100;
            a++;
        }
    }
    word_33704 = 0;
}

// ==== seg000:0x2049 ====
void moveDataFar() {
    int unused1, unused2;
    setCommWorldbufPtr();
    flagFarToNear = 0;
    moveStuff();
    moveNearFar(byte_3B7FC.events, 0x600);
}

// ==== seg000:0x206d ====
void moveStuff() {
    moveNearFar(byte_3C02A, 1);
    moveNearFar(byte_3BEC4, 1);
    moveNearFar(&word_3BED2, 2);
    moveNearFar(&word_38FFA, 2);
    moveNearFar(&word_3C69E, 2);
    moveNearFar(word_3AA5C, word_3BED2 * 16);
    moveNearFar(&word_3C046, 2);
    moveNearFar(stru_3B202, word_3C046 * 0x24);
    moveNearFar(byte_3BFA4, 0x64);
    moveNearFar(byte_3BED8, 0x64);
    moveNearFar(byte_3C16E, 0x2ee);
    moveNearFar(byte_3AFAC, 0x100);
    moveNearFar(&word_3C00C, 2);
    moveNearFar(&word_336FC, 2);
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
