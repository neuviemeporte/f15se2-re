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

    i = *(int16 *)&aFlogger[var_667 * 32 + 16];

    m = computeThreatRangeBearing(
        stru_3B202[param_1].posX,
        stru_3B202[param_1].posY,
        stru_3B202[param_1].alt,
        i,
        &d, (int *)&g);

    word_336FA = 4;

    if ((unsigned)m > g) {
        /* close enough — increment heat */
        *(int16 *)&stru_3B202[param_1].state[18] += ((word_330BA + g_missionStatus) * 16 + 0x20) >> ((g_playerPlaneFlags & 0x10) != 0);

        if (*(int16 *)&stru_3B202[param_1].state[18] > 0xc0) {
            word_3C09C++;
            stru_3B202[param_1].state[9] |= 0x40;
            sub_166BE();

            j = param_1 % (g_missionStatus + 1);

            if (g_missionStatus * 2 >= word_3A946 &&
                stru_335C4[j].ttl == 0 &&
                g > 8 &&
                abs(d - *(int16 *)&stru_3B202[param_1].state[0]) < 0x1800) {

                i = *(int16 *)&stru_3B202[param_1].state[14];

                if (sams[i].field_8 > (g >> 1)) {
                if ((unsigned)(-(g_missionStatus * 3 - 0x10)) < g) {
                if (g < 0x1000) {
                if (i != 0) {

                    /* launch missile into slot j */
                    i = i;
                    stru_335C4[j].mapX = stru_3B202[param_1].posX;
                    stru_335C4[j].mapY = stru_3B202[param_1].posY;
                    j = j;
                    param_1 = param_1;
                    stru_335C4[j].alt = stru_3B202[param_1].alt - 0x19;
                    stru_335C4[j].field_6 = sams[i].field_A >> 6;
                    stru_335C4[j].worldX = *(int16 *)&stru_3B202[param_1].state[0];
                    stru_335C4[j].worldY = *(int16 *)&stru_3B202[param_1].state[2] - 0x400;
                    stru_335C4[j].worldZ = *(int16 *)&stru_3B202[param_1].state[4];

                    stru_335C4[j].ttl = (int)((((long)sams[i].field_8 << 3) * (long)g_frameRateScaling) / (long)stru_335C4[j].field_6);

                    *(int16 *)&stru_335C4[j].state[0] = i;
                    j = j;
                    *(int16 *)&stru_335C4[j].state[6] = -param_1;

                    i = i;
                    strcpy((char *)strBuf, (char *)&sams[i].field_0);
                    strcat((char *)strBuf, (char *)aFiredBy);
                    strcat((char *)strBuf, (char *)(var_667 * 32 + 0x2c8));
                    tempStrcpy((char *)strBuf);

                    makeSound(6, 2);
                    commData->restartFlag++;
                    scheduleEventCheck(param_1 + 0x20, 2);

                    if (randomRange(4) == 0) {
                        stru_3B202[param_1].state[8] |= 4;
                    }
                }
                }
                }
                }
            }
        }
        stru_3B202[param_1].state[8] |= 8;
    } else {
        stru_3B202[param_1].state[8] &= 0xf7;
        *(int16 *)&stru_3B202[param_1].state[18] -= 0x20;
    }

    *(int16 *)&stru_3B202[param_1].state[18] =
        clampRange(*(int16 *)&stru_3B202[param_1].state[18], 0, 0xff);
}

// ==== seg000:0x783A ====
void spawnEnemyAircraft(int slot, int objType)
{
    int p;

    p = *(int16 *)&stru_3B202[slot].state[6];
    *(int16 *)&stru_3B202[slot].state[0] = (word_3AFA8 == 1) ? 0 : (int16)0x8000;
    if (g_planes[objType].flags & 0x200) {
        stru_3B202[slot].posX = word_3AFA8 * 3 + g_planes[objType].mapX;
        stru_3B202[slot].posY = g_planes[objType].mapY - word_3AFA8 * 12;
        stru_3B202[slot].alt = 0x8c;
        *(int16 *)&stru_3B202[slot].state[10] = 100;
        *(uint8 *)((char *)&stru_3B202[slot].state[1]) += 0xfc;
    } else {
        stru_3B202[slot].posX = g_planes[objType].mapX;
        stru_3B202[slot].posY = 0x1e * word_3AFA8 + g_planes[objType].mapY;
        stru_3B202[slot].alt = 0x0c;
        *(int16 *)&stru_3B202[slot].state[10] = 10;
    }
    stru_3B202[slot].worldX = (long)(uint16)stru_3B202[slot].posX << 5;
    stru_3B202[slot].worldY = (long)(uint16)stru_3B202[slot].posY << 5;
    *(int16 *)&stru_3B202[slot].state[2] = 0;
    *(int16 *)&stru_3B202[slot].state[4] = 0;
    *(uint16 *)&stru_3B202[slot].state[8] |= 0x403;
    stru_3B202[slot].objType = objType;
    *(int16 *)&stru_3B202[slot].state[12] = (int16)(((long)*(int16 *)&aFlogger[p * 32 + 12] << 11) * (long)g_frameRateScaling / (long)*(int16 *)&aFlogger[p * 32 + 10]);
    *(int16 *)&stru_3B202[slot].state[16] = readMapPixelColor(g_planes[objType].mapX, g_planes[objType].mapY);
    if (word_336FC == -1) {
        stru_3B202[slot].state[9] &= 0xfe;
    }
    placeString(objType);
    strcat(strBuf, aDash);
    strcat(strBuf, (char *)(*(int16 *)&stru_3B202[slot].state[6] * 32 + aMig23));
    strcat(strBuf, aTakingOff);
    if (slot < word_3C046 - 4) {
        tempStrcpy(strBuf);
    }
}
// ==== seg000:0x85be ====
int samCanAcquireTarget(int slot, int targetX, int targetY, int param_4, int mode) {
    int p;
    int a;
    int b;
    int c;

    b = targetX - stru_335C4[slot].mapX;
    c = targetY - stru_335C4[slot].mapY;
    a = rangeApprox(b, c);
    var_670 = computeBearing(b, -c);
    if (stru_335C4[slot].field_6 * 24 / g_frameRateScaling > a) {
        var_669 = a;
        return 1;
    }
    p = abs(var_670 - stru_335C4[slot].worldX);
    if (p > 0x1000 && mode != 3) {
        if (p > 0x6000 && slot < 8) {
            if ((stru_335C4[slot].field_6 << 4) / g_frameRateScaling < a) {
                stru_335C4[slot].ttl = clampRange(stru_335C4[slot].ttl, 0, g_frameRateScaling << 4);
            }
        }
        return 0;
    }
    if (mode == 0) {
        if (abs(stru_335C4[slot].worldX - var_542) > 0x2000) {
            return 0;
        }
    }
    if (mode == 0) {
        var_669 = a;
        return 1;
    }
    p = abs(stru_335C4[slot].worldX - var_542);
    if (abs(p - 0x4000) >= 0x2000 - g_missionStatus * 2048) {
        var_669 = a;
        return 1;
    }
    return 0;
}

// ==== seg000:0x86f8 ====
void destroyAircraft(int objIdx)
{
    int p;

    if (!(stru_3B202[objIdx].state[8] & 0x20)) {
        *(int16 *)&aFlogger[*(int16 *)&stru_3B202[objIdx].state[6] * 32 + 22] += 1;
        if (*(uint16 *)&stru_3B202[objIdx].state[8] & 0x800) {
            word_3C044--;
        }
        if (objIdx == word_336FC) {
            word_336FC = -1;
        }
        stru_3B202[objIdx].state[8] |= 0x20;
        word_336F6 = -1;
        word_3BEC2 = stru_3B202[objIdx].posX;
        word_3BED6 = stru_3B202[objIdx].posY;
        word_3BFA2 = stru_3B202[objIdx].alt;
        word_3B4DC = 0x80;
        p = 3;
        appendMapEvent(p, (*(uint16 *)&stru_3B202[objIdx].state[8] & 0x4000 ? 0x80 : 0) + *(int16 *)&stru_3B202[objIdx].state[6]);
        if (*(int16 *)&stru_3B202[objIdx].state[10] != 0) goto done;
        *(uint16 *)&stru_3B202[objIdx].state[8] &= 0x1c1;
    done:
        ;
    }
    strcpy(strBuf, (char *)(*(int16 *)&stru_3B202[objIdx].state[6] * 32 + aMig23));
    makeSound(2, 2);
    if (g_currentWeaponType == 1 && objIdx == word_336F2) {
        word_39604 = 1;
    }
}

void sub_187EA(int param_1)
{
    int p;
    int a;
    int b;

    placeString(param_1);
    p = 1;
    if ((g_planes[param_1].flags & 0x80) == 0) {
        if (g_planes[param_1].flags & 0x1000) {
            word_3C048--;
        }

        word_39808 = findNearestTileObject(
            (long)g_planes[param_1].mapX << 5,
            (0x8000L - (long)g_planes[param_1].mapY) << 5);

        if (param_1 != 0) {
            if (g_planes[param_1].field_4 == 0) {
                p = 0x0c;
            }
            *((uint8 *)&g_planes[param_1].flags) |= 0x80;
            g_planes[param_1].field_4 = 0;
            for (a = 0; a < 2; a++) {
                if ((&word_3B146)[a * 9] == param_1) {
                    markTargetReached(a);
                    p |= (a != 0 ? 0x40 : 0x80);
                    word_336EE = frameTick + g_frameRateScaling;
                    makeSound(0, 2);
                }
            }
            appendMapEvent(p, param_1);
            b = getTargetSymbol(param_1);
        } else {
            if (isTargetOverWater(param_1) != 0) {
                b = (int)(char)byte_3BEC4[0];
            } else {
                b = (int)(char)byte_3C02A[0];
            }
            if (b != *word_39808) {
                byte_3BED8[*word_39808]++;
                appendMapEvent(2, *word_39808);
            }
            *(((uint8 *)&b) + 1) |= 1;
            g_planes[param_1].field_C = b;
        }

        if (word_39808 != 0) {
            addTileEntry((char *)word_39808, shapeDataOffset(b), b);
        }
    }

    word_336F6 = param_1;
    makeSound(2, 2);
    if (g_currentWeaponType == 2 && param_1 == word_336F4) {
        word_39604 = 1;
    }
    if (word_3C09A == 0) {
        redrawTacMap(g_viewX_, g_viewY_);
    }
    if (g_missionStatus < 2) {
        sub_166BE();
    }
}

// ==== seg000:0x89aa ====
int markTargetReached(int targetIdx) {
    if (g_playerPlaneFlags & (0x4000 >> targetIdx)) {
        return 0;
    }
    if (*(&word_3B144 + 9 * targetIdx) == 4 || *(&word_3B144 + 9 * targetIdx) == 3) {
        appendMapEvent((targetIdx != 0 ? 0x40 : 0x80) + 0x0b, 0);
    }
    if (targetIdx != 0) {
        strcpy(strBuf, aSecond_Target);
        waypointIndex = 1;
        var_730 |= 0x20;
    } else {
        strcpy(strBuf, aPrimaryTarget_0);
        waypointIndex = 2;
        var_730 |= 0x40;
    }
    if ((g_playerPlaneFlags & 0x6000) == 0x6000) {
        waypointIndex = 3;
    }
    return 1;
}

extern int randomRange(int);
void bombTarget(void) {
    int p;
    if (!(g_playerPlaneFlags & 0x1000) && word_336EA != -1) {
        p = 0;
        goto check;
        do {
            word_33096 |= (1 << randomRange(8));
            g_gunHits++;
            p++;
    check:;
        } while (p <= g_missionStatus);
        refreshActivePanel(0x16);
        word_38FEA = 1;
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

    if (abs(var_545) > 0x3000) return;
    if (word_33702 != 0) return;
    if (word_3BE3C != 0) return;

    b = missleSpec[missileSpecIndex].weaponIdx;
    p = missiles[b].field_16;

    if (missleSpec[missileSpecIndex].ammo == 0) {
        strcpy(strBuf, missiles[b].field_0);
        strcat(strBuf, a0);
        setTimedMessage(strBuf);
        goto end;
    }

    if (p == 0) return;
    if (p == -1) return;

    missleSpec[missileSpecIndex].ammo--;

    if (word_330C2 != 0) {
        setDrawColor(0);
        a = ((int16 *)aA)[missileSpecIndex];
        fillRectBoth(a - 1, 0xbe, a + 2, 0xc2);
        drawNumber(missleSpec[missileSpecIndex].ammo, a, 0xbe, 0x0c);
        strcpy(strBuf, missiles[b].field_0);
        strcat(strBuf, aColon);
        strcat(strBuf, itoa(missleSpec[missileSpecIndex].ammo, unk_3C030, 0x0a));
        setTimedMessage(strBuf);
    }

    c = -1;
    a = 8;
    do {
        if (stru_335C4[a].ttl == 0) {
            c = a;
        }
        a++;
    } while (a < 12);

    if (c == -1) goto check_end;

    stru_335C4[c].mapX = g_viewX_;
    stru_335C4[c].mapY = g_viewY_;
    stru_335C4[c].alt = var_547 - 0x14;
    stru_335C4[c].field_6 = (unsigned int)g_velocity >> 11;
    c = c;
    stru_335C4[c].worldX = var_542;
    stru_335C4[c].worldY = var_544;
    stru_335C4[c].worldZ = var_545;

    stru_335C4[c].ttl = (int)(((long)sams[p].field_8 << (6 - (sams[p].field_C == 6 ? 3 : 2))) * (long)g_frameRateScaling / (long)((sams[p].field_A >> 6) + 1)) + 6;

    c = c;
    if (stru_335C4[c].ttl <= 6) {
        stru_335C4[c].ttl = 999;
    }

    *(int16 *)&stru_335C4[c].state[0] = p;
    *(int16 *)&stru_335C4[c].state[2] = b;
    *(int16 *)&stru_335C4[c].state[4] = -1;

    if (p != 0x1e) {
        stru_335C4[c].worldY -= 0x1000;
    } else {
        *(int16 *)&stru_335C4[c].state[6] = sub_1C82D() - 0x400;
        word_3C020 = word_336F4;
    }

    if (word_336F4 >= 0 && sams[p].field_C == 6) {
        *(int16 *)&stru_335C4[c].state[4] = word_336F4;
    }

    if (word_336F4 >= 0 && sams[p].field_C == 5 && (g_planes[word_336F4].flags & 8)) {
        *(int16 *)&stru_335C4[c].state[4] = word_336F4;
    }

    if (p == 0x1d) {
        stru_335C4[c].worldY = (int16)0xc000;
        stru_335C4[c].field_6 = 1;
    }

    word_3A940 = c;
    strcpy(strBuf, missiles[b].field_0);
    strcat(strBuf, aFired);
    tempStrcpy(strBuf);

    makeSound(sams[p].field_8 != 0 ? 0x12 : 0x18, 2);

    scheduleEventCheck(c, 1);

check_end:
    if (word_3C09E == 0x15) {
        refreshActivePanel(0x15);
    }
end:
    ;
}

// ==== seg000:0x8df4 ====
void projectWorldPos(int worldX, int worldY, int worldZ) {
    *(char *)&var_315 = 0;
    drawNearestTileObject((int32)worldX << 5, -((int32)worldY - 0x8000L) << 5, (int32)worldZ);
}
