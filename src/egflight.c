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


// TODO: fireGroundThreat (seg000:6346-660d) - unimplemented

// ==== seg000:0x660e routine_324 ====
int computeThreatRangeBearing(int threatX, int threatY, int arg_4, int threatType, int *outBearing, int *arg_a) {
    int p;
    int a;
    int b;
    int c;
    int d;
    int e;
    unsigned f;

    if (threatType == 0 || threatType == -1) {
        return 0;
    }
    d = word_3BEC0 - threatX;
    e = word_3BED0 - threatY;
    c = (unsigned)rangeApprox(d, e) >> 6;
    b = computeBearing(d, -e);
    f = (f = (*(int16 *)&aNone[threatType * 14 + 10] + word_330B8 * 2 + 3) * *(int16 *)&aNone[threatType * 14 + 8] / 16) * (((unsigned)var_547 >> 6) + 0x40) >> 7;
    *outBearing = b;
    *arg_a = c;
    return f;
}

// ==== seg000:0x66be ====
void sub_166BE(void) {
    int p;
    word_336F0 = word_3B0AC;
    if (word_333DA != 0) {
        word_3B4D8 = word_333D2;
        word_3B4E0 = word_333D4;
    } else {
        word_3B4D8 = word_3BEC0;
        word_3B4E0 = word_3BED0;
    }
    word_3B5D6 = var_547;
    word_38FEC = var_542;
    word_3BED4 = 0xFF;
    for (p = 0; p < word_3C69E; p++) {
        if (stru_3AA5E[p].field_4 != 0) {
            *(int *)&stru_3AA5E[p].field_8 = clampRange(*(int *)&stru_3AA5E[p].field_8, ((word_330B8 + word_330BA) << 4) - 16, 0xFF);
        }
    }
}

// ==== seg000:0x6742 ====
int computeThreatScore(void) {
    int p;
    int a;
    int b;

    b = 0;
    for (a = 0; a < word_38FFA; a++) {
        p = stru_3AA5E[a].field_4;
        if (p != 0) {
            b += *(int *)((char *)aNone + p * 14 + 8) * *(int *)((char *)aNone + p * 14 + 10) * (word_330B8 + 2) / 64;
        }
    }
    b /= 100;
    return b;
}

// TODO: updateObjects (seg000:67b4-7593) - large unimplemented function
// TODO: fireAirThreat (seg000:7594-7839) - unimplemented

// ==== seg000:0x783A ====
void spawnEnemyAircraft(int slot, int objType)
{
    int p;

    p = *(int16 *)&stru_3B202[slot].state[6];
    *(int16 *)&stru_3B202[slot].state[0] = (word_3AFA8 == 1) ? 0 : (int16)0x8000;
    if (stru_3AA5E[objType].flags & 0x200) {
        stru_3B202[slot].posX = word_3AFA8 * 3 + stru_3AA5E[objType].mapX;
        stru_3B202[slot].posY = stru_3AA5E[objType].mapY - word_3AFA8 * 12;
        stru_3B202[slot].alt = 0x8c;
        *(int16 *)&stru_3B202[slot].state[10] = 100;
        *(uint8 *)((char *)&stru_3B202[slot].state[1]) += 0xfc;
    } else {
        stru_3B202[slot].posX = stru_3AA5E[objType].mapX;
        stru_3B202[slot].posY = 0x1e * word_3AFA8 + stru_3AA5E[objType].mapY;
        stru_3B202[slot].alt = 0x0c;
        *(int16 *)&stru_3B202[slot].state[10] = 10;
    }
    stru_3B202[slot].worldX = (long)(uint16)stru_3B202[slot].posX << 5;
    stru_3B202[slot].worldY = (long)(uint16)stru_3B202[slot].posY << 5;
    *(int16 *)&stru_3B202[slot].state[2] = 0;
    *(int16 *)&stru_3B202[slot].state[4] = 0;
    *(uint16 *)&stru_3B202[slot].state[8] |= 0x403;
    stru_3B202[slot].objType = objType;
    *(int16 *)&stru_3B202[slot].state[12] = (int16)(((long)*(int16 *)&aFlogger[p * 32 + 12] << 11) * (long)word_330C4 / (long)*(int16 *)&aFlogger[p * 32 + 10]);
    *(int16 *)&stru_3B202[slot].state[16] = readMapPixelColor(stru_3AA5E[objType].mapX, stru_3AA5E[objType].mapY);
    if (word_336FC == -1) {
        stru_3B202[slot].state[9] &= 0xfe;
    }
    placeString(objType);
    strcat(strBuf, aDash);
    strcat(strBuf, (char *)(*(int16 *)&stru_3B202[slot].state[6] * 32 + (int)aMig23));
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
    if (stru_335C4[slot].field_6 * 24 / word_330C4 > a) {
        var_669 = a;
        return 1;
    }
    p = abs(var_670 - stru_335C4[slot].worldX);
    if (p > 0x1000 && mode != 3) {
        if (p > 0x6000 && slot < 8) {
            if ((stru_335C4[slot].field_6 << 4) / word_330C4 < a) {
                stru_335C4[slot].ttl = clampRange(stru_335C4[slot].ttl, 0, word_330C4 << 4);
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
    if (abs(p - 0x4000) >= 0x2000 - word_330B8 * 2048) {
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
    strcpy(strBuf, (char *)(*(int16 *)&stru_3B202[objIdx].state[6] * 32 + (int)aMig23));
    makeSound(2, 2);
    if (word_3C45C == 1 && objIdx == word_336F2) {
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
    if ((stru_3AA5E[param_1].flags & 0x80) == 0) {
        if (stru_3AA5E[param_1].flags & 0x1000) {
            word_3C048--;
        }

        word_39808 = findNearestTileObject(
            (long)stru_3AA5E[param_1].mapX << 5,
            (0x8000L - (long)stru_3AA5E[param_1].mapY) << 5);

        if (param_1 != 0) {
            if (stru_3AA5E[param_1].field_4 == 0) {
                p = 0x0c;
            }
            *((uint8 *)&stru_3AA5E[param_1].flags) |= 0x80;
            stru_3AA5E[param_1].field_4 = 0;
            for (a = 0; a < 2; a++) {
                if ((&word_3B146)[a * 9] == param_1) {
                    markTargetReached(a);
                    p |= (a != 0 ? 0x40 : 0x80);
                    word_336EE = frameTick + word_330C4;
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
            stru_3AA5E[param_1].field_C = b;
        }

        if (word_39808 != 0) {
            addTileEntry((char *)word_39808, shapeDataOffset(b), b);
        }
    }

    word_336F6 = param_1;
    makeSound(2, 2);
    if (word_3C45C == 2 && param_1 == word_336F4) {
        word_39604 = 1;
    }
    if (word_3C09A == 0) {
        redrawTacMap(word_3BEC0, word_3BED0);
    }
    if (word_330B8 < 2) {
        sub_166BE();
    }
}

// ==== seg000:0x89aa ====
int markTargetReached(int targetIdx) {
    if (planeFlags & (0x4000 >> targetIdx)) {
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
    if ((planeFlags & 0x6000) == 0x6000) {
        waypointIndex = 3;
    }
    return 1;
}

extern int randomRange(int);
void bombTarget(void) {
    int p;
    if (!(planeFlags & 0x1000) && word_336EA != -1) {
        p = 0;
        goto check;
        do {
            word_33096 |= (1 << randomRange(8));
            word_3BF90++;
            p++;
    check:;
        } while (p <= word_330B8);
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

    stru_335C4[c].mapX = word_3BEC0;
    stru_335C4[c].mapY = word_3BED0;
    stru_335C4[c].alt = var_547 - 0x14;
    stru_335C4[c].field_6 = (unsigned int)word_3A944 >> 11;
    c = c;
    stru_335C4[c].worldX = var_542;
    stru_335C4[c].worldY = var_544;
    stru_335C4[c].worldZ = var_545;

    stru_335C4[c].ttl = (int)(((long)sams[p].field_8 << (6 - (sams[p].field_C == 6 ? 3 : 2))) * (long)word_330C4 / (long)((sams[p].field_A >> 6) + 1)) + 6;

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

    if (word_336F4 >= 0 && sams[p].field_C == 5 && (stru_3AA5E[word_336F4].flags & 8)) {
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

