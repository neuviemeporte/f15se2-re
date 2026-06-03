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

// ==== seg000:0xc1b9 ====

void drawTargetBox(int centerX, int centerY, int size, int mode) {
    int p;
    int a;
    int b;
    int c;
    int d;

    if (word_330C2 == 0) {
        return;
    }
    if (var_456 != 0) {
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
    if (var_671 != 0 && word_330C2 != 0) {
        if (byte_3C5A0 != 0) {
            draw2Strings(aMissileLock, 0xf4, 0x96, 14);
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
    if (var_279 == -1) {
        return;
    }
    setDrawColor(color);
    if (size < var_279 && 0x13f - size > var_279 &&
        size < var_282 && 0x58 - size > var_282) {
        drawTargetBox(var_279, var_282, size, 1);
    }
    if (var_279 > 0x14 && var_279 < 0x118 &&
        var_282 > 0 && var_282 < 0x52) {
        draw2Strings(text, var_279 - (int)strlen(text) * 2, var_282 + 5, word_38F72);
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
    strcat(strBuf, itoa(rangeRaw >> 6, unk_3C030, 10));
    strcat(strBuf, aDot);
    strcat(strBuf, itoa((rangeRaw & 0x3f) * 2 / 13, unk_3C030, 10));
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

    p = word_3BEC0 - worldX;
    c = worldY - word_3BED0;
    f = (worldZ - var_547) >> 5;

    if (keyValue & 0x80) {
        p -= (int)((dword_3B7DA - dword_3B1FE) >> 5);
        c -= (int)((dword_3B7F8 - dword_3B4D4) >> 5);
        f -= (int)((-((long)(unsigned)var_547 - (long)word_3B4DE)) >> 5);
    }

    a = rotateVectorComponent(0, p, c, f);
    d = rotateVectorComponent(1, p, c, f);
    g = rotateVectorComponent(2, p, c, f);

    if (g >= 0) {
        var_279 = -1;
        return;
    }

    if (var_456) {
        a >>= 1;
        d >>= 1;
    }

    if (-g < a || a < g) {
        var_279 = -1;
        return;
    }

    var_279 = (int)((a << 8) / g) + 0xa0;
    var_282 = (int)((d << 8) / g);
    var_282 -= var_282 >> 1 >> 1;
    var_282 += (var_564[8] == 0xc7) ? 0x64 : 0x38;

    word_3C016 = (int)(g >> 3);

    if (var_279 < 0 || var_279 > 0x13f) {
        var_673 = var_279;
        var_279 = -1;
    }
    if (var_282 < 0 || var_564[8] < var_282) {
        var_673 = var_279;
        var_279 = -1;
    }
}

// ==== seg000:0xc661 ====
long rotateVectorComponent(int axis, int vecX, int vecY, int vecZ) {
    long p;

    p = (long)fixedMulQ14(unk_3A948[axis], vecX);
    p += (long)fixedMulQ14(unk_3A948[3 + axis], vecZ);
    p += (long)fixedMulQ14(unk_3A948[6 + axis], vecY);
    return p;
}





int findWaypointEntry(int mapX, int mapY)
{
    int p;

    if (word_39808 = findNearestTileObject((int32)mapX << 5, (0x8000L - (int32)mapY) << 5)) {
        mapX = ((int32 *)word_39808)[1] >> 5;
        mapY = -((int)(((int32 *)word_39808)[2] >> 5) - 0x8000);
        for (p = 1; p < word_3BED2; p++) {
            if (stru_3AA5E[p].mapX == mapX && stru_3AA5E[p].mapY == mapY) {
                return p;
            }
        }
        stru_3AA5E[0].mapX = mapX;
        stru_3AA5E[0].mapY = mapY;
        stru_3AA5E[0].field_C = *word_39808 + 0x100;
        if (word_336F6 == 0) {
            word_336F6 = -1;
        }
        return 0;
    } else {
        return -1;
    }
}

// ==== seg000:0xc7a2 ====
int computeMapTargetRange(int targetIdx) {
    return computeTargetBearing(stru_3AA5E[targetIdx].mapX, stru_3AA5E[targetIdx].mapY, 1);
}

// ==== seg000:0xc7c6 ====
int computeSimObjectRange(int objIdx) {
    return computeTargetBearing(stru_3B202[objIdx].posX, stru_3B202[objIdx].posY, 0);
}

// ==== seg000:0xc7ea ====
void computeTargetBearing(int targetX, int targetY, int wantBearing) {
    int p;
    int a;
    p = word_3BEC0 - targetX;
    a = word_3BED0 - targetY;
    if (wantBearing != 0) {
        var_674 = computeBearing(-p, a);
    }
    var_672 = rangeApprox(p, a);
    goto done;
done:;
}

// ==== seg000:0xc82d ====
int sub_1C82D() {
    return (int)((unsigned long)((long)(0x4000 - abs(var_544)) << 12) / (unsigned long)(unsigned int)(var_547 + 0x1000)) - 0x4000;
}

// ==== seg000:0xc864 ====
int getTargetSymbol(int wpIdx) {
    if (stru_3AA5E[wpIdx].flags & 0x80) {
        return (isTargetOverWater(wpIdx) ? (int)(char)byte_3BEC4[0] : (int)(char)byte_3C02A[0]) + 0x100;
    }
    return stru_3AA5E[wpIdx].field_C;
}

// ==== seg000:0xc8a4 ====
int isTargetOverWater(int wpIdx) {
    int p;

    p = ((char *)byte_3BFA4)[stru_3AA5E[wpIdx].field_C & 0x7f] & 0x0f;
    return (p == 0x0c || p == 9 || p == 0x0b) ? 1 : 0;
}

