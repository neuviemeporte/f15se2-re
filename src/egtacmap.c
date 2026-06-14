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

// ==== seg000:0x8e38 ====

void clearStatusPanel(void) {
    drawPanelText(2, (char*)aEmpty_5950, 0);
}

// ==== seg000:0x8e50 ====
void renderHudFrame(int arg_0) {
    int var_2, var_4, var_6, var_8, var_A, var_C, var_E, var_10, var_12, var_14, var_16, var_18, var_1A;
    char var_1C;
    TRACE(("renderHudFrame: enter"));
    byte_3C5A0 = gfx_getDisplayPage();
    TRACE(("renderHudFrame: after getDisplayPage=%d"));
    // probably x,y
    var_16 = waypoints[waypointIndex].mapX - g_viewX_;
    var_1A = waypoints[waypointIndex].mapY - g_viewY_;
    TRACE(("renderHudFrame: after waypoints, word_330C2=%d", word_330C2));
    word_3BE92 = computeBearing(var_16, -var_1A);
    TRACE(("renderHudFrame: after computeBearing"));
    if (word_330C2 != 0) {
        TRACE(("renderHudFrame: word_330C2 branch, word_38FEA=%d", word_38FEA));
        if (word_38FEA != 0) {
            word_38FEA = 0;
            if (!(keyValue & 0x80)) {
                TRACE(("renderHudFrame: calling setDrawColor(0xd)"));
                setDrawColor(0xd);
                TRACE(("renderHudFrame: calling fillRectBoth"));
                fillRectBoth(0, 0, 0x13f, 0x60);
                gfx_setDacAnimCount(0x3c);
            }
        }
        TRACE(("renderHudFrame: past 8ed2, keyValue=%d byte_37C24=%d", keyValue, byte_37C24));
        byte_37C2F = 1;
        if (keyValue == 0 && byte_37C24 == 0) {
            TRACE(("renderHudFrame: entering keyValue==0 branch, setupUseJoy=%d", commData->setupUseJoy));
            if (!commData->setupUseJoy) {
                TRACE(("renderHudFrame: calling setDrawColor(0)"));
                setDrawColor(0);
                TRACE(("renderHudFrame: calling drawViewportLine"));
                drawViewportLine(0x115, 0x53, 0x125, 0x53);
                drawViewportLine(0x125, 0x53, 0x125, 0x5f);
                drawViewportLine(0x125, 0x5f, 0x115, 0x5f);
                drawViewportLine(0x115, 0x5f, 0x115, 0x53);
                drawViewportLine(0x11d, 0x59, 0x11d, 0x59);
                setDrawColor(0xf);
                var_14 = ((int16)(joyAxes[0] - 0x78) >> 4) + 0x11d;
                var_18 = ((int16)((joyAxes[1] * 3) - 0x168) >> 6) + 0x59;
                drawViewportLine(var_14 - 1, var_18, var_14 + 1, var_18);
                drawViewportLine(var_14, var_18 + 1, var_14, var_18 - 1);
            }
            if (g_playerPlaneFlags & 0x200) {
                setDrawColor(0xf);
                drawViewportLine(0x9c, 0x59, 0xa4, 0x59);
                drawViewportLine(0xa0, 0x56, 0xa0, 0x5c);
            }
            setDrawColor(word_330BC != 0 ? 4 : 0);
            var_10 = clampRange((((word_3C5A6 - g_knots) * 2) / 5) + 0x1d, 0, 0x3d);
            if (var_10) drawViewportLine(0x48, 0x55 - var_10, 0x48, 0x55);
            drawViewportLine(0xf7,  0x38, 0xf7, clampRange(-((word_3C8B6 >> 4) - 0x38), 0x14, 0x55));
            if ((g_playerPlaneFlags & 1) == 0 && (frameTick & 1) != 0 && gameData->unk4 != 0 && word_3C8B6 < 0) {
                var_2 = (((g_planes[g_closestThreatIndex].flags & 0x200 ? 0x100 : 0x80) / gameData->unk4) >> 4) + 0x38;
                setDrawColor(0xf);
                drawViewportLine(0xf2, var_2 - 2, 0xf4, var_2);
                drawViewportLine(0xf2, var_2 + 2, 0xf4, var_2);
            }
            // stall warning display
            if (g_knots < word_3C5A6 && word_3BEBE != g_viewZ && frameTick & 1) {
                drawStringActivePage(aStallWarning, 0x84, 0x1e, 0xf);
            }
            if (g_currentWeaponType == 0 || g_currentWeaponType == 2) {
                setDrawColor(7);
                word_3C008 = (word_38FC4 >> 6) + 0x38;
                if (word_3C008 > 0xa && word_3C008 < 0x6f) {
                    blitSprite(0x9a, word_3C008 - 4, 0x94, 0x15, 0x0b, 7, 0xf);
                }
            }
            if (g_currentWeaponType == 1) {
                var_1C = byte_37C24 + 4;
                var_14 = (word_3C6A4 >> var_1C) + 0x9f;
                var_18 = (word_3C6AC >> var_1C) + 0x38;
                if (var_14 > 0xa && var_14 < 0x135 && var_18 > 8 && var_18 < 0x5b) {
                    blitSprite(var_14 - 6, var_18 - 5, 0x91, 0x4, 0xd, 0xb, 0xe);
                }
                // 7 = air to air? Only Sidewinder and Amraam have it
                if (sams[missiles[missleSpec[missileSpecIndex].weaponIdx].field_16].field_C == 7) {
                    setDrawColor((uint8)gfxModeUnset != 0 ? 0xf : 7);
                    for (var_A = 0; var_A <= 0x100; var_A += 0x10) {
                        var_4 = var_A << 8;
                        var_8 = sinMul(var_4, 0x28) + 0x9f;
                        var_C = -(cosMul(var_4, 0x23) - 0x38);
                        if (var_A != 0) drawViewportLine(var_8, var_C, var_E, var_12);
                        var_E = var_8;
                        var_12 = var_C;
                    }
                }
            }
            drawNumber(g_knots, 0x50, 0x36, 0xf);
            if (word_380D0 <= 0x4e20) {
                drawNumber(word_380D0 < 0x64 ? word_380D0 : (word_380D0 / 5) * 5, 0xe4, 0x36, 0xf);
            }
            if (word_3370A > 1) {
                drawStringBothPages(aAccel, 0x96, 0x4, 0xf);
            }
            if (g_playerPlaneFlags & 0x1000) {
                drawStringBothPages(aTraining, 0xea, 0x10, 0xf);
            }
            if (g_autopilotAltitude != 0) {
                drawStringBothPages(aAutopilot, 0xec, 0x5a, 0xf);
            }
            var_6 = clampRange((((word_3BE92 - g_ourHead) >> 6) / 3) + 0x9f, 0x59, 0xe5);
            setDrawColor(0x0b);
            drawViewportLine(var_6 - 2, 0xf, var_6, 0x11);
            drawViewportLine(var_6, 0x11, var_6 + 2, 0xf);
            drawViewportLine(var_6 - 2, 0xf, var_6 + 2, 0xf);
            goto somewhere;
        }
somewhere:
        drawTacticalMap(byte_3C5A0);
    }
    if (word_383F2 != 0 && ((keyValue == 0 && byte_37C24 == 0) || (word_3370E != 0))) {
        drawStringActivePage(tempString, -(((int16)strlen(tempString) >> 1) - 0x28) * 4, 0x18, 0xf);
        word_383F2--;
        if (word_336EA == 1) {
            drawStringActivePage(aPressAnyKeyToP, 0x78, 1, word_330BC != 0 ? 0xe : 0);
        }
    }
    if (word_383F4 != 0 && keyValue == 0 && byte_37C24 == 0) {
        drawStringActivePage(string_3C04A, -(((int16)strlen(string_3C04A) >> 1) - 0x28) * 4, 0x5a, 0xf);
        word_383F4--;
    }
}

// ==== seg000:0x94d0 routine_189 ====
void setActivePanel(int panelId) {
    int p, a, b, c, d, e, f, g, h, i;
    if (word_330C2 == 0) {
        return;
    }
    switch (panelId) {
    case 0x13:
        strcpy(strBuf, aTrackcam);
        switch (word_3C8B2) {
        case 0:
            strcat(strBuf, aAhead);
            break;
        case (int16)0x8000:
            strcat(strBuf, aRear);
            break;
        case 0x4000:
            strcat(strBuf, aRight);
            break;
        case (int16)0xC000:
            strcat(strBuf, aLeft);
            break;
        }
        drawPanelText(2, strBuf, 3);
        break;
    }
    word_3C09E = panelId;
}

// ==== seg000:0x957a ====
void refreshActivePanel(int panelId) {
    int p;
    if (panelId == word_3C09E) {
        setActivePanel(panelId);
    }
}

// ==== seg000:0x9595 ====
void initTacMapView(void) {
    word_3C09A = 0;
    word_3C018 = 0x18;
    word_3C45E = 0x60;
    word_3C01A = 0x70;
    word_3C5A2 = 0xa8;
    word_38FC8 = 0x48;
    word_38FCC = 0x38;
    zoomIn();
}

// ==== seg000:0x95c9 ====
void redrawTacMap(int centerX, int centerY) {
    int16 p, a, b, c, d;

    word_3C09A = 0;
    if (word_330C2 == 0) {
        return;
    }
    drawPanelText(1, aMap, 0);
    b = 0x48 << (9 - byte_383E5);
    var_589 = clampRange(sinMul(var_542, 0x4000 >> byte_383E5) + centerX, b, 0x7fff - b);
    b = (0x38 << (9 - byte_383E5)) / 3 * 4;
    var_590 = clampRange(centerY - cosMul(var_542, 0x4000 >> byte_383E5), b, 0x7fff - b);
    loadColorPalette(commData->gfxModeNum != 0 ? 0 : 3);
    gfx_setFadeSteps(0x13);
    renderMapTerrain(var_567, var_589 / 2, -(var_590 / 2 - 0x4000), 9 - byte_383E5);
    if (gameData->theater < 2) {
        gfx_setFadeSteps(0xc);
    } else {
        gfx_setFadeSteps(0x10);
    }
    d = byte_3C5A0;
    byte_3C5A0 = gfx_getDisplayPage();
    for (b = 1; b < word_3BED2; b++) {
        if (g_planes[b].field_4 != 0 && !(g_planes[b].flags & 0x80) &&
            objectToScreen(g_planes[b].mapX, g_planes[b].mapY, &p, &a)) {
            blitSprite(p - 1, a - 1, 0xa4, 0, 4, 4, 0);
        }
        if (((g_planes[b].flags & 0x481) == 0x401 || (g_planes[b].flags & 0x200)) &&
            objectToScreen(g_planes[b].mapX, g_planes[b].mapY, &p, &a)) {
            blitSprite(p - 1, a - 1, (uint8)gfxModeUnset != 0 ? 0xac : 0xb0, 0, 4, 4, 0);
        }
    }
    for (b = 0; b < 2; b++) {
        if (!(g_playerPlaneFlags & (0x4000 >> b)) &&
            objectToScreen(waypoints[b + 1].mapX, waypoints[b + 1].mapY, &p, &a)) {
            blitSprite(p - 1, a - 1, (uint8)gfxModeUnset != 0 ? 0xb4 : 0xa8, 0, 4, 4, 0);
        }
    }
    byte_3C5A0 = d;
    if ((char)gfx_getDisplayPage() == 0) {
        cacheScopePanel();
    } else {
        gfx_copyRect(*var_565, 0x18, 0x70, *var_566, 0x18, 0x70, 0x48, 0x38);
    }
    restoreScopePanel();
    resetSimObjectLocks();
}

// ==== seg000:0x9875 ====
void zoomIn(void) {
    if (keyValue & 0x80) {
        word_336FE--;
    } else {
        if (word_3C09A == 0 && byte_383E5 < 9) {
            byte_383E5++;
            redrawTacMap(g_viewX_, g_viewY_);
        }
        if (word_3C09A == 1) {
            var_588++;
        }
    }
}

// ==== seg000:0x98b1 ====
void zoomOut(void) {
    if (keyValue & 0x80) {
        word_336FE++;
    } else {
        if (word_3C09A == 0 && byte_383E5 > 2) {
            byte_383E5--;
            redrawTacMap(g_viewX_, g_viewY_);
        }
        if (word_3C09A == 1 && var_588 != 0) {
            var_588--;
        }
    }
}

// ==== seg000:0x98fa ====
int mapXToScreen(int mapX) {
    return ((mapX - var_589) >> (10 - (int)byte_383E5)) + 0x3C;
}

// ==== seg000:0x9915 ====
int mapYToScreen(int mapY) {
    return (((mapY - var_590) >> (10 - (int)byte_383E5)) * 3 >> 1 >> 1) + 0x8C;
}

// ==== seg000:0x993a ====
int plotMapObject(int mapX, int mapY, int color, int big) {
    int p;
    int a;
    if (word_3C09A != 0 || word_330C2 == 0) {
        return 0;
    }
    p = mapXToScreen(mapX);
    a = mapYToScreen(mapY);
    if (color != -1 && p >= word_3C018 && p < word_3C45E - 1 && a >= word_3C01A && a < word_3C5A2 - 1) {
        drawMapPoint(p, a, color);
        if (big != 0) {
            drawMapPoint(p + 1, a, color);
            drawMapPoint(p, a + 1, color);
            drawMapPoint(p + 1, a + 1, color);
        }
        return 0;
    } else {
        return 1;
    }
}

// ==== seg000:0x99ec ====
int objectToScreen(int mapX, int mapY, int16 *outScreenX, int16 *outScreenY) {
    if (word_330C2 == 0) {
        return 0;
    }
    *outScreenX = mapXToScreen(mapX);
    *outScreenY = mapYToScreen(mapY);
    if (word_3C018 < *outScreenX && word_3C45E - 1 > *outScreenX &&
        word_3C01A < *outScreenY && word_3C5A2 - 1 > *outScreenY) {
        return 1;
    } else {
        return 0;
    }
}

// ==== seg000:0x9a4d ====
extern int mapXToScreen(int);
extern int mapYToScreen(int);

int readMapPixelColor(int mapX, int mapY) {
    int p;
    int a;
    int b;
    if (word_3C09A != 0) return 0;
    p = mapXToScreen(mapX);
    a = mapYToScreen(mapY);
    p = clampRange(p, word_3C018, word_3C45E);
    a = clampRange(a, word_3C01A, word_3C5A2);
    b = -1;
    if (p > word_3C018 && p < word_3C45E && a > word_3C01A && a < word_3C5A2) {
        b = readScreenPixel(p, a);
    }
    return b;
}

// ==== seg000:0x9adb ====
void drawMapRangeArc(int centerX, int centerY, int radius, int color, int connectLines, int startAngle, int endAngle)
{
    int p;
    int a;
    int b;
    int c;
    int d;
    int e;
    int f;

    if (endAngle < startAngle) {
        startAngle += 0x100;
    }
    setDrawColor(color);
    for (b = startAngle; b <= endAngle; b += 0x10) {
        p = *(unsigned char *)&b << 8;
        a = sinMul(p, radius) + centerX;
        d = centerY - cosMul(p, radius);
        if ((unsigned)a > 0xC000u) {
            a = 0;
        }
        if ((unsigned)d > 0xC000u) {
            d = 0;
        }
        if (b != startAngle && connectLines != 0) {
            drawMapLine(a, d, c, f);
        } else {
            plotMapObject(a, d, color, 0);
        }
        c = a;
        f = d;
    }
}

// ==== seg000:0x9b98 ====
void drawMapLine(int x1, int y1, int x2, int y2) {
    drawClippedLineRegion(mapXToScreen(x1), mapYToScreen(y1), mapXToScreen(x2), mapYToScreen(y2), word_3C018, word_3C45E, word_3C01A, word_3C5A2, 1);
}

// ==== seg000:0x9be1 ====
void drawFullscreenLine(int x1, int y1, int x2, int y2) {
    drawClippedLineRegion(x1, y1, x2, y2, 0, 0x13f, 0, 199, 1);
}

// ==== seg000:0x9c0c ====
void drawViewportLine(int x1, int y1, int x2, int y2) {
    int p, a;

    a = var_564[10] - var_564[9] + 1;
    p = var_564[8] - var_564[7] + 1;
    gfx_setBlitOffset(gfx_calcRowAddr(var_564[9], var_564[7]));
    var_349 = a - 1;
    var_350 = p - 1;
    gfx_setColor(var_564[2]);
    var_351 = x1;
    var_353 = y1;
    var_352 = x2;
    var_354 = y2;
    drawClipLineGlobal();
    gfx_nop23();
}

// ==== seg000:0x9c84 ====
void drawClippedLineRegion(int x1, int y1, int x2, int y2, int clipLeft, int arg_a, int arg_c, int arg_e, int drawBothPages) {
    int p, a;

    a = arg_a - clipLeft + 1;
    p = arg_e - arg_c + 1;
    gfx_setBlitOffset(gfx_calcRowAddr(clipLeft, arg_c));
    var_349 = a - 1;
    var_350 = p - 1;
    gfx_setColor(var_564[2]);
    var_351 = x1 - clipLeft;
    var_353 = y1 - arg_c;
    var_352 = x2 - clipLeft;
    var_354 = y2 - arg_c;
    drawClipLineGlobal();
    gfx_nop23();
    if (drawBothPages != 0) {
        byte_3C5A0 = gfx_getDisplayPage();
        gfx_setPageN(byte_3C5A0 == 0);
        gfx_setColor(var_564[2]);
        var_351 = x1 - clipLeft;
        var_353 = y1 - arg_c;
        var_352 = x2 - clipLeft;
        var_354 = y2 - arg_c;
        drawClipLineGlobal();
        gfx_setPageN(byte_3C5A0 != 0);
        gfx_nop23();
    }
    var_349 = 0x13f;
    var_350 = 0xc7;
    gfx_setBlitOffset(0);
}

// ==== seg000:0x9d86 ====
void drawScreenLineOnePage(int x1, int y1, int x2, int y2) {
    drawClippedLineRegion(x1, y1, x2, y2, 0, 0x13f, 0, 0xc7, 0);
}

// ==== seg000:0x9db0 ====
void drawHudViewLine(int x1, int y1, int x2, int y2) {
    if (var_456 != 0) {
        if (gameData->unk4 < 2) {
            drawViewportLine(x1, y1, x2, y2);
        } else {
            drawClippedLineRegion(x1, y1, x2, y2, 0x68, 0xd8, 0x3e, 0x60, 0);
        }
    } else if (g_missionStatus != 0) {
        drawClippedLineRegion(x1, y1, x2, y2, 0x30, 0x10f, 0x0f, 0x60, 0);
    } else {
        drawViewportLine(x1, y1, x2, y2);
    }
}

// ==== seg000:0x9e44 ====
void setDrawColor(int color) {
    off_38334[2] = color;
    off_3834C[2] = color;
}

// ==== seg000:0x9e5d ====
void fillRectBoth(int x1, int y1, int x2, int y2) {
#ifdef DEBUG
    if (frameTick < 80)
        TRACE_KEY(("FILLRECT f%d: (%d,%d)-(%d,%d) w=%d h=%d color=%d pgH=%d", frameTick, x1, y1, x2, y2, x2-x1+1, y2-y1+1, (int)off_38334[2], (int)off_38334[0x10]));
#endif
    fillSpanRect(off_38334, x1, y1, x2, y2);
    fillSpanRect(off_3834C, x1, y1, x2, y2);
}

// ==== seg000:0x9e94 ====
void drawColorPoint(int screenX, int screenY, int color) {
    setDrawColor(color);
    drawFullscreenLine(screenX, screenY, screenX, screenY);
}

// ==== seg000:0x9ea0 ====
void drawMapPoint(int x, int y, int color) {
    setDrawColor(color);
    drawFullscreenLine(x, y, x, y);
}

// ==== seg000:0x9eb6 ====
void switchIndicatorColor(int indicatorIdx, int color) {
    if (word_330C2 == 0) goto done;
    if (*(&word_38202 + indicatorIdx * 5 + 7) != color) {
        gfx_switchColor(var_564, *(&word_38202 + indicatorIdx * 5 + 3), *(&word_38202 + indicatorIdx * 5 + 4), *(&word_38202 + indicatorIdx * 5 + 5), *(&word_38202 + indicatorIdx * 5 + 6), *(&word_38202 + indicatorIdx * 5 + 7), color);
        gfx_switchColor(var_565, *(&word_38202 + indicatorIdx * 5 + 3), *(&word_38202 + indicatorIdx * 5 + 4), *(&word_38202 + indicatorIdx * 5 + 5), *(&word_38202 + indicatorIdx * 5 + 6), *(&word_38202 + indicatorIdx * 5 + 7), color);
        *(&word_38202 + indicatorIdx * 5 + 7) = color;
    }
done:
    ;
}

// ==== seg000:0x9fad ====
void drawPanelText(int panel, char* text, int color) {
    fillPanelBox(panel, color);
    drawCenteredLabelBox(panel, text);
}

// ==== seg000:0x9fcc ====
void fillPanelBox(int panelId, int color) {
    setDrawColor(color);
    if (panelId == 1) {
        fillRectBoth(0x18, 0x70, 0x60, 0xa8);
    }
    if (panelId == 2) {
        fillRectBoth(0x78, 0x68, 0xc7, 0xaf);
    }
    if (panelId == 3) {
        fillRectBoth(0xe8, 0x80, 0x130, 0xb8);
    }
}

// ==== seg000:0xa0cb ====
void drawStringBothPages(const char *text, int screenX, int screenY, int color) {
    drawStringCentered(var_564, text, screenX, screenY, color);
    drawStringCentered(var_565, text, screenX, screenY, color);
}

// ==== seg000:0xa0fe ====
void drawStringActivePage(const char *text, int screenX, int screenY, int color) {
    if (byte_3C5A0 == 0) {
        drawStringCentered(var_564, text, screenX, screenY, color);
    } else {
        drawStringCentered(var_565, text, screenX, screenY, color);
    }
}

// ==== seg000:0xa13a ====
void drawStringCentered(int16* strStruct, const char *text, int screenX, int screenY, int color) {
    strStruct[6] = 0;
    strStruct[4] = screenX;
    strStruct[5] = screenY;
    strStruct[2] = color;
#ifdef BUGFIX
    gfx_drawString(strStruct, strupr((char*)text));
#else
    gfx_drawString(strStruct, strupr((char*)text), strlen(text));
#endif
}


// ==== seg000:0xa183 ====
void drawNumber(int value, int x, int y, int color) {
    char buf[20];
    itoa(value, buf, 10);
    drawStringBothPages(buf, x, y, color);
}

// ==== seg000:0xa1b1 ====
int readScreenPixel(int screenX, int screenY) {
    byte_3BF93[0] = 0x0D;
    unk_3BF96 = screenX;
    unk_3BF98 = screenY;
    unk_3BF95 = 0;
    int86(0x10, &regs, &regs);
    return regs.h.al;
}

// ==== seg000:0xa1e4 ====
void tempStrcpy(char *src) {
    strcpy(tempString, src);
    var_591 = g_frameRateScaling * 3;
}

// ==== seg000:0xa204 ====
void setTimedMessage(char *message) {
    strcpy(string_3C04A, message);
    var_592 = g_frameRateScaling * 3;
}

// ==== seg000:0xa224 ====
int missileTargetCompat(int param_1, int objIdx) {
    return (int)(char)var_83[param_1 * 13 + ((int)(char)byte_3BFA4[g_planes[objIdx].field_C & 0x7f] & 0xf)];
}
