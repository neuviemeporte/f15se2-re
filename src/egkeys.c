// seg000 debug code (/Zi)
#include "egcode.h"
#include "egcombat.h"
#include "egdata.h"
#include "egframe.h"
#include "egkeys.h"
#include "egmath.h"
#include "egtacmap.h"
#include "egtypes.h"
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
void selectMissile();
void disableTextBlink(void);

// ==== seg000:0xd260 ====
void keyDispatch(uint16 scanCode) {
    char memStr[14]; /* local buffer at BP-0e, used by itoa for memory display */

    g_axisInputAccum[0] = g_axisInputAccum[1] = 0;

    if (scanCode == 0)
        goto end_dispatch;

    switch (scanCode) {
    case SCAN_ALT_Y:
        disableTextBlink();
        break;
    case SCAN_R:
        g_radarScopeRange++;
        if (g_radarScopeRange > 2)
            g_radarScopeRange = 0;
        switch (g_radarScopeRange) {
        case 0:
            strcpy(strBuf, "Long");
            break;
        case 1:
            strcpy(strBuf, "Medium");
            break;
        case 2:
            strcpy(strBuf, "Short");
            break;
        }
        strcat(strBuf, " range radar");
        hudMessage(strBuf);
        break;
    case SCAN_Z:
        zoomIn();
        break;
    case SCAN_X:
        zoomOut();
        break;
    case SCAN_F:
        countermeasures(1);
        break;
    case SCAN_C:
        countermeasures(2);
        break;
    case SCAN_L:
        if (g_viewZ != g_groundAltitude) {
            *(char *)&g_playerPlaneFlags ^= 1;
            g_gearDownArmed = 0;
            makeSound(32, 2);
        }
        if (!(*(char *)&g_playerPlaneFlags & 1)) {
            exitTimeAccel();
        }
        break;
    case SCAN_ALT_D:
        g_detailLevel--;
        if (g_detailLevel < 0) {
            g_detailLevel = gfx_getModecode() == 3 ? 3 : 2;
        }
        strcpy(strBuf, "Detail Level ");
        strcat(strBuf, itoa(g_detailLevel, g_itoaScratch, 10));
        hudMessage(strBuf);
        setupLodDistances();
        break;
    case SCAN_ALT_K:
        g_kbdSensitivity++;
        if (g_kbdSensitivity > 2)
            g_kbdSensitivity = 0;
        strcpy(strBuf, "Kybd Sensitivity");
        strcat(strBuf, itoa(g_kbdSensitivity + 1, g_itoaScratch, 10));
        hudMessage(strBuf);
        break;
    case SCAN_ALT_M:
        strcpy(strBuf, "Memory Available:");
        strcat(strBuf, itoa(allocSize, memStr, 10));
        hudMessage(strBuf);
        break;
    case SCAN_ALT_F:
        strcpy(strBuf, "Jiffies/Frame ");
        strcat(strBuf, itoa(g_jiffiesPerFrame, g_itoaScratch, 10));
        hudMessage(strBuf);
        break;
    case SCAN_ALT_A:
        if (g_timeAccelMode == 1) {
            g_timeAccelMode = 2;
            g_frameRateScaling = g_frameRateScaling / 2;
            recalcTimeScale();
        } else {
            exitTimeAccel();
        }
        break;
    case SCAN_ALT_V:
        /* The original source pre-increments in place (compiles to `inc [mem]`);
         * keep this form for byte-exact match even though it is formally
         * unsequenced. Both writes store the same final value, (old+1)&3. */
        g_axisInputAccum[2] = ++g_axisInputAccum[2] & 3;
        strcpy(strBuf, "Sounds ");
        strcat(strBuf, itoa(3 - g_axisInputAccum[2], g_itoaScratch, 10));
        hudMessage(strBuf);
        updateEngineSound();
        break;
    case SCAN_ALT_N:
        *(char *)&g_nightMode ^= 1;
        if (g_dacSupported != 0)
            setupDac();
        break;
    case SCAN_ALT_T:
        g_playerPlaneFlags ^= 0x1000;
        if (g_playerPlaneFlags & 0x1000) {
            *(char FAR *)&commData->trainingFlag |= 1;
        }
        break;
    case SCAN_S:
        missileSpecIndex = 0;
        if (g_currentWeaponType != 1)
            g_lockedTargetKilled = 0;
        g_currentWeaponType = 1;
        selectMissile();
        break;
    case SCAN_M:
        missileSpecIndex = 1;
        g_currentWeaponType = 1;
        if (g_currentWeaponType != 1)
            g_lockedTargetKilled = 0;
        selectMissile();
        break;
    case SCAN_G:
        missileSpecIndex = 2;
        if (g_currentWeaponType != 2)
            g_lockedTargetKilled = 0;
        g_currentWeaponType = 2;
        selectMissile();
        break;
    case SCAN_D:
        g_directorMode++;
        if (g_directorMode > 2)
            g_directorMode = 0;
        strcpy(strBuf, "Director ");
        if (g_directorMode != 0) {
            strcat(strBuf, itoa(g_directorMode, g_itoaScratch, 10));
        } else {
            strcat(strBuf, "off");
        }
        hudMessage(strBuf);
        break;
    case SCAN_W:
        waypointIndex++;
        if (waypointIndex > 3)
            waypointIndex = 1;
        switch (waypointIndex) {
        case 1:
            hudMessage("Waypoint: Primary Target");
            break;
        case 2:
            hudMessage("Waypoint: Secondary Target");
            break;
        case 3:
            hudMessage("Waypoint: Friendly Airbase");
            g_targetSlots[1].viewIndex = g_closestThreatIndex;
            break;
        }
        break;
    case SCAN_P:
        if (g_autopilotAltitude != 0) {
            g_autopilotAltitude = 0;
            hudMessage("Autopilot off");
        } else {
            g_autopilotAltitude = g_viewZ < 1000 ? 1000 : g_viewZ;
            hudMessage("Autopilot on");
        }
        break;
    case SCAN_T:
        *(char *)&g_groundTargetLock |= 0x80;
        break;
    case SCAN_BACKSPACE:
        g_axisInputAccum[0] = 1;
        break;
    case SCAN_ENTER:
        g_axisInputAccum[1] = 1;
        break;
    case SCAN_SPACEBAR:
        g_viewMode = VIEW_COCKPIT;
        break;
    case SCAN_F1:
        g_viewMode = VIEW_FORWARD;
        break;
    case SCAN_F2:
        g_viewMode = VIEW_LEFT;
        break;
    case SCAN_F3:
        g_viewMode = VIEW_RIGHT;
        break;
    case SCAN_F4:
        g_viewMode = VIEW_REAR;
        break;
    case SCAN_F5:
        g_viewMode = VIEW_EXT_FOLLOW;
        break;
    case SCAN_F6:
        g_viewMode = VIEW_EXT_DYNAMIC;
        break;
    case SCAN_F7:
        g_viewMode = VIEW_EXT_SIDE;
        break;
    case SCAN_F8:
        g_viewMode = VIEW_MISSILE;
        break;
    case SCAN_F9:
        g_viewMode = VIEW_EXT_TARGET;
        break;
    case SCAN_F10:
        g_viewMode = VIEW_TARGET;
        break;
    case SCAN_ESCAPE:
        if (g_ejectState == 0) {
            makeSound(2, 2);
            makeSound(34, 2);
            if ((abs((int16)g_ourRoll) >> 5) + (abs(g_ourPitch) >> 5) + g_knots > randomRange(500) + 500) {
                finalizeMission(6);
            } else {
                commData->landingType = 2;
            }
            g_ejectState = 1;
            g_crashCamX = g_viewX_;
            g_crashCamY = g_viewY_;
            g_crashCamZ = g_viewZ + 8;
        }
        break;
    }

    if (g_playerPlaneFlags & 0x1000) {
        switch (scanCode) {
        case 0x1300:
            initWeaponLoadout();
            break;
        case 0x1f00:
            g_ViewY += 0x20000L >> g_mapZoomLevel;
            break;
        case 0x2d00:
            g_ViewY -= 0x20000L >> g_mapZoomLevel;
            break;
        case 0x2c00:
            g_ViewX -= 0x20000L >> g_mapZoomLevel;
            break;
        case 0x2e00:
            g_ViewX += 0x20000L >> g_mapZoomLevel;
            break;
        }
    }

    if (g_ejectState != 0) {
        g_viewMode = VIEW_EJECT;
    }

end_dispatch:
    if (g_fireCooldown > 0)
        g_fireCooldown--;

    if (readAxisInput(1) != 0 && g_fireCooldown == 0) {
        fireMissile();
        g_fireCooldown = 4;
    }

    switchIndicatorColor(3, (*(char *)&g_playerPlaneFlags & 1)             ? 4
                            : (g_knots < 250 || (*(char *)&frameTick & 1)) ? 2
                                                                           : 10);

    switchIndicatorColor(2, (*(char *)&g_playerPlaneFlags & 8) ? 14
                            : *(char *)&gfxModeUnset != 0      ? 3
                                                               : 2);
}

// ==== seg000:0xd9db ====

void selectMissile() {
    strcpy(strBuf, missiles[missleSpec[missileSpecIndex].weaponIdx].longName);
    strcat(strBuf, missleSpec[missileSpecIndex].ammo == 0 ? " not available" : " armed");
    drawWeaponSelectMarker(missileSpecIndex);
    hudMessage(strBuf);
}

// ==== seg000:0xda35 ====
void makeSound(int16 soundId, int16 priority) {
    if (priority >= g_axisInputAccum[2]) {
        if (g_ejectState == 0 || priority > 1) {
            audio_playSound(soundId);
        }
    }
    updateEngineSound();
}

// ==== seg000:0xda5f ====
void playVoiceCue(int16 weaponIdx) {
    if (g_axisInputAccum[2] < 2 && g_ejectState == 0 &&
        (uint16)voiceCueThresholds[weaponIdx] < (uint16)f15DgtlResult) {
        audio_playSample(weaponIdx);
    }
}

// ==== seg000:0xda8d ====
void updateEngineSound(void) {
    if (g_axisInputAccum[2] != 0 || g_ejectState != 0) {
        audio_engineDroneOff();
    } else {
        audio_engineDroneOn();
    }
}

// ==== seg000:0xdaae ====
void recalcTimeScale(void) {
    if (g_frameRateScaling > 15) {
        g_frameSyncWait = clampRange((-(120 / g_frameRateScaling - 9)) >> 1, 1, 4);
    } else {
        g_frameSyncWait = 0;
    }
    g_frameRateScaling = clampRange(g_frameRateScaling, 4 - g_timeAccelMode, 15);
    g_bulletTrackCount = clampRange(g_frameRateScaling << 1, 3, 16);
    g_threatTimerInit = 250 * g_frameRateScaling;
    g_threatDisplayTtl = 200 * g_frameRateScaling;
}

// ==== seg000:0xdb2b ====
void setupLodDistances(void) {
    int16 lod;
    for (lod = 0; lod < 6; lod++) {
        ((int16 *)(colorLut + 0x10))[lod] = 0x20 << ((char)lod + (char)(g_detailLevel > 2 ? 2 : g_detailLevel));
    }
    g_lodDistNear = g_lodDistScale + g_lodDistBase;
    g_lodDistFar = clampRange(g_lodDistScale << 1, 0x1000, 9999);
    *(int16 *)(colorLut + 0x20) = (g_detailLevel > 2 ? 2 : g_detailLevel) * 0xD05 + 0xD05;
}

// ==== seg000:0xdb9c ====
void exitTimeAccel() {
    if (g_timeAccelMode == 2) {
        g_timeAccelMode = 1;
        g_frameRateScaling <<= 1;
        recalcTimeScale();
    }
}

// ==== seg000:0xdbe0 ====
void disableTextBlink(void) {
    regs.h.ah = 0;
    regs.h.al = 0x8D;
    int86(0x10, &regs, &regs);
}
