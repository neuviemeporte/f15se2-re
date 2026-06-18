// seg000 debug code (/Zi)
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

// ==== seg000:0xd260 ====
int keyDispatch(uint16 scanCode)
{
    char p[14]; /* local buffer at BP-0e, used by itoa for memory display */

    word_38606[0] = word_38606[1] = 0;

    if (scanCode == 0)
        goto end_dispatch;

    switch (scanCode) {
    case 0x1500:
        disableTextBlink();
        break;
    case 0x1372:
        var_588++;
        if (var_588 > 2)
            var_588 = 0;
        switch (var_588) {
        case 0:
            strcpy(strBuf, (char *)aLong);
            break;
        case 1:
            strcpy(strBuf, (char *)aMedium);
            break;
        case 2:
            strcpy(strBuf, (char *)aShort);
            break;
        }
        strcat(strBuf, (char *)aRangeRadar);
        tempStrcpy(strBuf);
        break;
    case 0x2c7a:
        zoomIn();
        break;
    case 0x2d78:
        zoomOut();
        break;
    case 0x2166:
        countermeasures(1);
        break;
    case 0x2e63:
        countermeasures(2);
        break;
    case 0x266c:
        if (g_viewZ != word_3BEBE) {
            *(char *)&g_playerPlaneFlags ^= 1;
            word_336EC = 0;
            makeSound(0x20, 2);
        }
        if (!(*(char *)&g_playerPlaneFlags & 1)) {
            exitSlowMotion();
        }
        break;
    case 0x2000:
        word_38FDC--;
        if (word_38FDC < 0) {
            word_38FDC = gfx_getModecode() == 3 ? 3 : 2;
        }
        strcpy(strBuf, (char *)aDetailLevel);
        strcat(strBuf, itoa(word_38FDC, unk_3C030, 10));
        tempStrcpy(strBuf);
        setupLodDistances();
        break;
    case 0x2500:
        var_596++;
        if (var_596 > 2)
            var_596 = 0;
        strcpy(strBuf, (char *)aKybdSensitivit);
        strcat(strBuf, itoa(var_596 + 1, unk_3C030, 10));
        tempStrcpy(strBuf);
        break;
    case 0x3200:
        strcpy(strBuf, (char *)aMemoryAvailabl);
        strcat(strBuf, itoa(allocSize, p, 10));
        tempStrcpy(strBuf);
        break;
    case 0x2100:
        strcpy(strBuf, (char *)aJiffiesFrame);
        strcat(strBuf, itoa(word_3C6AE, unk_3C030, 10));
        tempStrcpy(strBuf);
        break;
    case 0x1e00:
        if (word_3370A == 1) {
            word_3370A = 2;
            g_frameRateScaling = g_frameRateScaling / 2;
            recalcTimeScale();
        } else {
            exitSlowMotion();
        }
        break;
    case 0x2f00:
        word_38606[2] = ++word_38606[2] & 3;
        strcpy(strBuf, (char *)aSounds);
        strcat(strBuf, itoa(3 - word_38606[2], unk_3C030, 10));
        tempStrcpy(strBuf);
        updateEngineSound();
        break;
    case 0x3100:
        *(char *)&word_330BC ^= 1;
        if (byte_32933 != 0)
            setupDac();
        break;
    case 0x1400:
        g_playerPlaneFlags ^= 0x1000;
        if (g_playerPlaneFlags & 0x1000) {
            *((char far *)commData + 0x30) |= 1;
        }
        break;
    case 0x1f73:
        missileSpecIndex = 0;
        if (g_currentWeaponType != 1)
            word_39604 = 0;
        g_currentWeaponType = 1;
        selectMissile();
        break;
    case 0x326d:
        missileSpecIndex = 1;
        g_currentWeaponType = 1;
        if (g_currentWeaponType != 1)
            word_39604 = 0;
        selectMissile();
        break;
    case 0x2267:
        missileSpecIndex = 2;
        if (g_currentWeaponType != 2)
            word_39604 = 0;
        g_currentWeaponType = 2;
        selectMissile();
        break;
    case 0x2064:
        word_3370E++;
        if (word_3370E > 2)
            word_3370E = 0;
        strcpy(strBuf, (char *)aDirector);
        if (word_3370E != 0) {
            strcat(strBuf, itoa(word_3370E, unk_3C030, 10));
        } else {
            strcat(strBuf, (char *)aOff);
        }
        tempStrcpy(strBuf);
        break;
    case 0x1177:
        waypointIndex++;
        if (waypointIndex > 3)
            waypointIndex = 1;
        switch (waypointIndex) {
        case 1:
            tempStrcpy((char *)aWaypointPrimar);
            break;
        case 2:
            tempStrcpy((char *)aWaypointSecond);
            break;
        case 3:
            tempStrcpy((char *)aWaypointFriend);
            g_targetSlots[1].viewIndex = g_closestThreatIndex;
            break;
        }
        break;
    case 0x1970:
        if (g_autopilotAltitude != 0) {
            g_autopilotAltitude = 0;
            tempStrcpy((char *)aAutopilotOff);
        } else {
            g_autopilotAltitude = g_viewZ < 1000 ? 1000 : g_viewZ;
            tempStrcpy((char *)aAutopilotOn);
        }
        break;
    case 0x1474:
        *(char *)&word_336F4 |= 0x80;
        break;
    case 0xe08:
        word_38606[0] = 1;
        break;
    case 0x1c0d:
        word_38606[1] = 1;
        break;
    case 0x3920:
        keyValue = 0;
        break;
    case 0x3b00:
        keyValue = 0x44;
        break;
    case 0x3c00:
        keyValue = 0x42;
        break;
    case 0x3d00:
        keyValue = 0x43;
        break;
    case 0x3e00:
        keyValue = 0x41;
        break;
    case 0x3f00:
        keyValue = 0x87;
        break;
    case 0x4000:
        keyValue = 0x84;
        break;
    case 0x4100:
        keyValue = 0x85;
        break;
    case 0x4200:
        keyValue = 0x89;
        break;
    case 0x4300:
        keyValue = 0x88;
        break;
    case 0x4400:
        keyValue = 0x8b;
        break;
    case 0x11b:
        if (word_3BE3C == 0) {
            makeSound(2, 2);
            makeSound(0x22, 2);
            if ((abs(g_ourRoll) >> 5) + (abs(g_ourPitch) >> 5) + g_knots
                    > randomRange(500) + 500) {
                finalizeMission(6);
            } else {
                *(int far *)((char far *)commData + 0x26) = 2;
            }
            word_3BE3C = 1;
            word_3C028 = g_viewX_;
            word_3C03A = g_viewY_;
            word_3C040 = g_viewZ + 8;
        }
        break;
    }

    if (g_playerPlaneFlags & 0x1000) {
        switch (scanCode) {
        case 0x1300:
            initWeaponLoadout();
            break;
        case 0x1f00:
            g_ViewY += 0x20000L >> byte_383E5;
            break;
        case 0x2d00:
            g_ViewY -= 0x20000L >> byte_383E5;
            break;
        case 0x2c00:
            g_ViewX -= 0x20000L >> byte_383E5;
            break;
        case 0x2e00:
            g_ViewX += 0x20000L >> byte_383E5;
            break;
        }
    }

    if (word_3BE3C != 0) {
        keyValue = 0x8c;
    }

end_dispatch:
    if (var_597 > 0)
        var_597--;

    if (readAxisInput(1) != 0 && var_597 == 0) {
        fireMissile();
        var_597 = 4;
    }

    switchIndicatorColor(3, (*(char *)&g_playerPlaneFlags & 1) ? 4
        : (g_knots < 250 || (*(char *)&frameTick & 1)) ? 2 : 10);

    switchIndicatorColor(2, (*(char *)&g_playerPlaneFlags & 8) ? 14
        : *(char *)&gfxModeUnset != 0 ? 3 : 2);
}

// ==== seg000:0xd9db ====

void selectMissile() {
    strcpy(strBuf, missiles[missleSpec[missileSpecIndex].weaponIdx].field_A);
    strcat(strBuf, (char *)(missleSpec[missileSpecIndex].ammo == 0 ? aNotAvailable : aArmed));
    drawWeaponSelectMarker(missileSpecIndex);
    tempStrcpy(strBuf);
}

// ==== seg000:0xda35 ====
void makeSound(int soundId, int priority) {
    if (priority >= word_38606[2]) {
        if (word_3BE3C == 0 || priority > 1) {
            audio_jump_66(soundId);
        }
    }
    updateEngineSound();
}

// ==== seg000:0xda5f ====
void playVoiceCue(int weaponIdx) {
    if (word_38606[2] < 2 && word_3BE3C == 0 &&
        (unsigned)voiceCueThresholds[weaponIdx] < (unsigned)f15DgtlResult) {
        audio_jump_6d(weaponIdx);
    }
}

// ==== seg000:0xda8d ====
void updateEngineSound(void) {
    if (word_38606[2] != 0 || word_3BE3C != 0) {
        audio_jump_69();
    } else {
        audio_jump_68();
    }
}

// ==== seg000:0xdaae ====
void recalcTimeScale(void) {
    if (g_frameRateScaling > 15) {
        var_595 = clampRange((-(120 / g_frameRateScaling - 9)) >> 1, 1, 4);
    } else {
        var_595 = 0;
    }
    g_frameRateScaling = clampRange(g_frameRateScaling, 4 - word_3370A, 15);
    word_3AFA4 = clampRange(g_frameRateScaling << 1, 3, 16);
    word_3B0AC = 250 * g_frameRateScaling;
    word_3995C = 200 * g_frameRateScaling;
}

// ==== seg000:0xdb2b ====
void setupLodDistances(void) {
    int p;
    for (p = 0; p < 6; p++) {
        ((int *)(byte_3419F + 13))[p] = 0x20 << ((char)p + (char)(word_38FDC > 2 ? 2 : word_38FDC));
    }
    var_196 = var_195 + var_194;
    var_197 = clampRange(var_195 << 1, 0x1000, 9999);
    var_198 = (word_38FDC > 2 ? 2 : word_38FDC) * 0xD05 + 0xD05;
}

// ==== seg000:0xdb9c ====
void exitSlowMotion() {
    if (word_3370A == 2) {
        word_3370A = 1;
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
