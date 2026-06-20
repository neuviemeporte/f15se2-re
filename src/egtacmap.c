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
    g_drawPage = gfx_getDisplayPage();
    TRACE(("renderHudFrame: after getDisplayPage=%d"));
    // probably x,y
    var_16 = waypoints[waypointIndex].mapX - g_viewX_;
    var_1A = waypoints[waypointIndex].mapY - g_viewY_;
    TRACE(("renderHudFrame: after waypoints, g_hudVisible=%d", g_hudVisible));
    g_waypointBearing = computeBearing(var_16, -var_1A);
    TRACE(("renderHudFrame: after computeBearing"));
    if (g_hudVisible != 0) {
        TRACE(("renderHudFrame: g_hudVisible branch, g_damageTakenFlag=%d", g_damageTakenFlag));
        if (g_damageTakenFlag != 0) {
            g_damageTakenFlag = 0;
            if (!(keyValue & 0x80)) {
                TRACE(("renderHudFrame: calling setDrawColor(0xd)"));
                setDrawColor(0xd);
                TRACE(("renderHudFrame: calling fillRectBoth"));
                fillRectBoth(0, 0, 0x13f, 0x60);
                gfx_setDacAnimCount(0x3c);
            }
        }
        TRACE(("renderHudFrame: past 8ed2, keyValue=%d g_halfScaleRender=%d", keyValue, g_halfScaleRender));
        g_hudDrawnFlag = 1;
        if (keyValue == 0 && g_halfScaleRender == 0) {
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
            setDrawColor(g_nightMode != 0 ? 4 : 0);
            var_10 = clampRange((((g_cornerSpeed - g_knots) * 2) / 5) + 0x1d, 0, 0x3d);
            if (var_10) drawViewportLine(0x48, 0x55 - var_10, 0x48, 0x55);
            drawViewportLine(0xf7,  0x38, 0xf7, clampRange(-((g_climbRate >> 4) - 0x38), 0x14, 0x55));
            if ((g_playerPlaneFlags & 1) == 0 && (frameTick & 1) != 0 && gameData->unk4 != 0 && g_climbRate < 0) {
                var_2 = (((g_planeTable.planes[g_closestThreatIndex].flags & 0x200 ? 0x100 : 0x80) / gameData->unk4) >> 4) + 0x38;
                setDrawColor(0xf);
                drawViewportLine(0xf2, var_2 - 2, 0xf4, var_2);
                drawViewportLine(0xf2, var_2 + 2, 0xf4, var_2);
            }
            // stall warning display
            if (g_knots < g_cornerSpeed && g_groundAltitude != g_viewZ && frameTick & 1) {
                drawStringActivePage(aStallWarning, 0x84, 0x1e, 0xf);
            }
            if (g_currentWeaponType == 0 || g_currentWeaponType == 2) {
                setDrawColor(7);
                g_flightPathMarkerY = (g_rollPitchTrim >> 6) + 0x38;
                if (g_flightPathMarkerY > 0xa && g_flightPathMarkerY < 0x6f) {
                    blitSprite(0x9a, g_flightPathMarkerY - 4, 0x94, 0x15, 0x0b, 7, 0xf);
                }
            }
            if (g_currentWeaponType == 1) {
                var_1C = g_halfScaleRender + 4;
                var_14 = (g_aamSeekerX >> var_1C) + 0x9f;
                var_18 = (g_aamSeekerY >> var_1C) + 0x38;
                if (var_14 > 0xa && var_14 < 0x135 && var_18 > 8 && var_18 < 0x5b) {
                    blitSprite(var_14 - 6, var_18 - 5, 0x91, 0x4, 0xd, 0xb, 0xe);
                }
                // 7 = air to air? Only Sidewinder and Amraam have it
                if (sams[missiles[missleSpec[missileSpecIndex].weaponIdx].specIndex].weaponClass == 7) {
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
            if (g_altitude <= 0x4e20) {
                drawNumber(g_altitude < 0x64 ? g_altitude : (g_altitude / 5) * 5, 0xe4, 0x36, 0xf);
            }
            if (g_slowMotionMode > 1) {
                drawStringBothPages(aAccel, 0x96, 0x4, 0xf);
            }
            if (g_playerPlaneFlags & 0x1000) {
                drawStringBothPages(aTraining, 0xea, 0x10, 0xf);
            }
            if (g_autopilotAltitude != 0) {
                drawStringBothPages(aAutopilot, 0xec, 0x5a, 0xf);
            }
            var_6 = clampRange((((g_waypointBearing - g_ourHead) >> 6) / 3) + 0x9f, 0x59, 0xe5);
            setDrawColor(0x0b);
            drawViewportLine(var_6 - 2, 0xf, var_6, 0x11);
            drawViewportLine(var_6, 0x11, var_6 + 2, 0xf);
            drawViewportLine(var_6 - 2, 0xf, var_6 + 2, 0xf);
            goto somewhere;
        }
somewhere:
        drawTacticalMap(g_drawPage);
    }
    if (g_hudMsgTimer != 0 && ((keyValue == 0 && g_halfScaleRender == 0) || (g_directorMode != 0))) {
        drawStringActivePage(tempString, -(((int16)strlen(tempString) >> 1) - 0x28) * 4, 0x18, 0xf);
        g_hudMsgTimer--;
        if (g_autopilotEngaged == 1) {
            drawStringActivePage(aPressAnyKeyToP, 0x78, 1, g_nightMode != 0 ? 0xe : 0);
        }
    }
    if (g_dirMsgTimer != 0 && keyValue == 0 && g_halfScaleRender == 0) {
        drawStringActivePage(string_3C04A, -(((int16)strlen(string_3C04A) >> 1) - 0x28) * 4, 0x5a, 0xf);
        g_dirMsgTimer--;
    }
}

// ==== seg000:0x94d0 routine_189 ====
void setActivePanel(int panelId) {
    int p, a, b, c, d, e, f, g, h, i;
    if (g_hudVisible == 0) {
        return;
    }
    switch (panelId) {
    case 0x13:
        strcpy(strBuf, aTrackcam);
        switch (g_viewHeadingOffset) {
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
    g_activePanelMode = panelId;
}

// ==== seg000:0x957a ====
void refreshActivePanel(int panelId) {
    int p;
    if (panelId == g_activePanelMode) {
        setActivePanel(panelId);
    }
}

// ==== seg000:0x9595 ====
void initTacMapView(void) {
    g_mapMode = 0;
    g_scopeClipLeft = 0x18;
    g_scopeClipRight = 0x60;
    g_scopeClipTop = 0x70;
    g_scopeClipBottom = 0xa8;
    g_scopeCenterX = 0x48;
    g_scopeCenterY = 0x38;
    zoomIn();
}

// ==== seg000:0x95c9 ====
void redrawTacMap(int centerX, int centerY) {
    int16 p, a, b, c, d;

    g_mapMode = 0;
    if (g_hudVisible == 0) {
        return;
    }
    drawPanelText(1, aMap, 0);
    b = 0x48 << (9 - g_mapZoomLevel);
    g_mapCenterX = clampRange(sinMul(g_ourHead, 0x4000 >> g_mapZoomLevel) + centerX, b, 0x7fff - b);
    b = (0x38 << (9 - g_mapZoomLevel)) / 3 * 4;
    g_mapCenterY = clampRange(centerY - cosMul(g_ourHead, 0x4000 >> g_mapZoomLevel), b, 0x7fff - b);
    loadColorPalette(commData->gfxModeNum != 0 ? 0 : 3);
    gfx_setFadeSteps(0x13);
    renderMapTerrain(g_mapTerrainMode, g_mapCenterX / 2, -(g_mapCenterY / 2 - 0x4000), 9 - g_mapZoomLevel);
    if (gameData->theater < 2) {
        gfx_setFadeSteps(0xc);
    } else {
        gfx_setFadeSteps(0x10);
    }
    d = g_drawPage;
    g_drawPage = gfx_getDisplayPage();
    for (b = 1; b < g_planeCount; b++) {
        if (g_planeTable.planes[b].active != 0 && !(g_planeTable.planes[b].flags & 0x80) &&
            objectToScreen(g_planeTable.planes[b].mapX, g_planeTable.planes[b].mapY, &p, &a)) {
            blitSprite(p - 1, a - 1, 0xa4, 0, 4, 4, 0);
        }
        if (((g_planeTable.planes[b].flags & 0x481) == 0x401 || (g_planeTable.planes[b].flags & 0x200)) &&
            objectToScreen(g_planeTable.planes[b].mapX, g_planeTable.planes[b].mapY, &p, &a)) {
            blitSprite(p - 1, a - 1, (uint8)gfxModeUnset != 0 ? 0xac : 0xb0, 0, 4, 4, 0);
        }
    }
    for (b = 0; b < 2; b++) {
        if (!(g_playerPlaneFlags & (0x4000 >> b)) &&
            objectToScreen(waypoints[b + 1].mapX, waypoints[b + 1].mapY, &p, &a)) {
            blitSprite(p - 1, a - 1, (uint8)gfxModeUnset != 0 ? 0xb4 : 0xa8, 0, 4, 4, 0);
        }
    }
    g_drawPage = d;
    if ((char)gfx_getDisplayPage() == 0) {
        cacheScopePanel();
    } else {
        gfx_copyRect(*g_pageBack, 0x18, 0x70, *g_pageOffscreen, 0x18, 0x70, 0x48, 0x38);
    }
    restoreScopePanel();
    resetSimObjectLocks();
}

// ==== seg000:0x9875 ====
void zoomIn(void) {
    if (keyValue & 0x80) {
        g_externalCamDist--;
    } else {
        if (g_mapMode == 0 && g_mapZoomLevel < 9) {
            g_mapZoomLevel++;
            redrawTacMap(g_viewX_, g_viewY_);
        }
        if (g_mapMode == 1) {
            g_radarScopeRange++;
        }
    }
}

// ==== seg000:0x98b1 ====
void zoomOut(void) {
    if (keyValue & 0x80) {
        g_externalCamDist++;
    } else {
        if (g_mapMode == 0 && g_mapZoomLevel > 2) {
            g_mapZoomLevel--;
            redrawTacMap(g_viewX_, g_viewY_);
        }
        if (g_mapMode == 1 && g_radarScopeRange != 0) {
            g_radarScopeRange--;
        }
    }
}

// ==== seg000:0x98fa ====
int mapXToScreen(int mapX) {
    return ((mapX - g_mapCenterX) >> (10 - (int)g_mapZoomLevel)) + 0x3C;
}

// ==== seg000:0x9915 ====
int mapYToScreen(int mapY) {
    return (((mapY - g_mapCenterY) >> (10 - (int)g_mapZoomLevel)) * 3 >> 1 >> 1) + 0x8C;
}

// ==== seg000:0x993a ====
int plotMapObject(int mapX, int mapY, int color, int big) {
    int p;
    int a;
    if (g_mapMode != 0 || g_hudVisible == 0) {
        return 0;
    }
    p = mapXToScreen(mapX);
    a = mapYToScreen(mapY);
    if (color != -1 && p >= g_scopeClipLeft && p < g_scopeClipRight - 1 && a >= g_scopeClipTop && a < g_scopeClipBottom - 1) {
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
    if (g_hudVisible == 0) {
        return 0;
    }
    *outScreenX = mapXToScreen(mapX);
    *outScreenY = mapYToScreen(mapY);
    if (g_scopeClipLeft < *outScreenX && g_scopeClipRight - 1 > *outScreenX &&
        g_scopeClipTop < *outScreenY && g_scopeClipBottom - 1 > *outScreenY) {
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
    if (g_mapMode != 0) return 0;
    p = mapXToScreen(mapX);
    a = mapYToScreen(mapY);
    p = clampRange(p, g_scopeClipLeft, g_scopeClipRight);
    a = clampRange(a, g_scopeClipTop, g_scopeClipBottom);
    b = -1;
    if (p > g_scopeClipLeft && p < g_scopeClipRight && a > g_scopeClipTop && a < g_scopeClipBottom) {
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
    drawClippedLineRegion(mapXToScreen(x1), mapYToScreen(y1), mapXToScreen(x2), mapYToScreen(y2), g_scopeClipLeft, g_scopeClipRight, g_scopeClipTop, g_scopeClipBottom, 1);
}

// ==== seg000:0x9be1 ====
void drawFullscreenLine(int x1, int y1, int x2, int y2) {
    drawClippedLineRegion(x1, y1, x2, y2, 0, 0x13f, 0, 199, 1);
}

// ==== seg000:0x9c0c ====
void drawViewportLine(int x1, int y1, int x2, int y2) {
    int p, a;

    a = g_pageFront[10] - g_pageFront[9] + 1;
    p = g_pageFront[8] - g_pageFront[7] + 1;
    gfx_setBlitOffset(gfx_calcRowAddr(g_pageFront[9], g_pageFront[7]));
    g_clipMaxX = a - 1;
    g_clipMaxY = p - 1;
    gfx_setColor(g_pageFront[2]);
    g_lineX1 = x1;
    g_lineY1 = y1;
    g_lineX2 = x2;
    g_lineY2 = y2;
    drawClipLineGlobal();
    gfx_nop23();
}

// ==== seg000:0x9c84 ====
void drawClippedLineRegion(int x1, int y1, int x2, int y2, int clipLeft, int arg_a, int arg_c, int arg_e, int drawBothPages) {
    int p, a;

    a = arg_a - clipLeft + 1;
    p = arg_e - arg_c + 1;
    gfx_setBlitOffset(gfx_calcRowAddr(clipLeft, arg_c));
    g_clipMaxX = a - 1;
    g_clipMaxY = p - 1;
    gfx_setColor(g_pageFront[2]);
    g_lineX1 = x1 - clipLeft;
    g_lineY1 = y1 - arg_c;
    g_lineX2 = x2 - clipLeft;
    g_lineY2 = y2 - arg_c;
    drawClipLineGlobal();
    gfx_nop23();
    if (drawBothPages != 0) {
        g_drawPage = gfx_getDisplayPage();
        gfx_setPageN(g_drawPage == 0);
        gfx_setColor(g_pageFront[2]);
        g_lineX1 = x1 - clipLeft;
        g_lineY1 = y1 - arg_c;
        g_lineX2 = x2 - clipLeft;
        g_lineY2 = y2 - arg_c;
        drawClipLineGlobal();
        gfx_setPageN(g_drawPage != 0);
        gfx_nop23();
    }
    g_clipMaxX = 0x13f;
    g_clipMaxY = 0xc7;
    gfx_setBlitOffset(0);
}

// ==== seg000:0x9d86 ====
void drawScreenLineOnePage(int x1, int y1, int x2, int y2) {
    drawClippedLineRegion(x1, y1, x2, y2, 0, 0x13f, 0, 0xc7, 0);
}

// ==== seg000:0x9db0 ====
void drawHudViewLine(int x1, int y1, int x2, int y2) {
    if (g_halfScaleRender != 0) {
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
    g_pageFront[2] = color;
    g_pageBack[2] = color;
}

// ==== seg000:0x9e5d ====
void fillRectBoth(int x1, int y1, int x2, int y2) {
#ifdef DEBUG
    if (frameTick < 80)
        TRACE_KEY(("FILLRECT f%d: (%d,%d)-(%d,%d) w=%d h=%d color=%d pgH=%d", frameTick, x1, y1, x2, y2, x2-x1+1, y2-y1+1, (int)g_pageFront[2], (int)g_pageFront[0x10]));
#endif
    fillSpanRect(g_pageFront, x1, y1, x2, y2);
    fillSpanRect(g_pageBack, x1, y1, x2, y2);
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
    if (g_hudVisible == 0) goto done;
    if (*(g_tacmapIndicators + indicatorIdx * 5 + 7) != color) {
        gfx_switchColor(g_pageFront, *(g_tacmapIndicators + indicatorIdx * 5 + 3), *(g_tacmapIndicators + indicatorIdx * 5 + 4), *(g_tacmapIndicators + indicatorIdx * 5 + 5), *(g_tacmapIndicators + indicatorIdx * 5 + 6), *(g_tacmapIndicators + indicatorIdx * 5 + 7), color);
        gfx_switchColor(g_pageBack, *(g_tacmapIndicators + indicatorIdx * 5 + 3), *(g_tacmapIndicators + indicatorIdx * 5 + 4), *(g_tacmapIndicators + indicatorIdx * 5 + 5), *(g_tacmapIndicators + indicatorIdx * 5 + 6), *(g_tacmapIndicators + indicatorIdx * 5 + 7), color);
        *(g_tacmapIndicators + indicatorIdx * 5 + 7) = color;
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
    drawStringCentered(g_pageFront, text, screenX, screenY, color);
    drawStringCentered(g_pageBack, text, screenX, screenY, color);
}

// ==== seg000:0xa0fe ====
void drawStringActivePage(const char *text, int screenX, int screenY, int color) {
    if (g_drawPage == 0) {
        drawStringCentered(g_pageFront, text, screenX, screenY, color);
    } else {
        drawStringCentered(g_pageBack, text, screenX, screenY, color);
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
    regs.h.ah = 0x0D;
    g_biosPixelX = screenX;
    g_biosPixelY = screenY;
    g_biosPixelPage = 0;
    int86(0x10, &regs, &regs);
    return regs.h.al;
}

// ==== seg000:0xa1e4 ====
void tempStrcpy(char *src) {
    strcpy(tempString, src);
    g_hudMsgTimer = g_frameRateScaling * 3;
}

// ==== seg000:0xa204 ====
void setTimedMessage(char *message) {
    strcpy(string_3C04A, message);
    g_dirMsgTimer = g_frameRateScaling * 3;
}

// ==== seg000:0xa224 ====
int missileTargetCompat(int param_1, int objIdx) {
    return (int)(char)g_targetCompatTable[param_1 * 13 + ((int)(char)g_shapeTargetCategory[g_planeTable.planes[objIdx].nameIndex & 0x7f] & 0xf)];
}
