// seg000 debug code (/Zi)
#include "eg3dmap.h"
#include "eg3dview.h"
#include "egcode.h"
#include "egcombat.h"
#include "egdata.h"
#include "egframe.h"
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
void drawStringCentered(int16 *, const char *, int16, int16, int16);
void renderHudFrame();
int16 mapXToScreen();
int16 mapYToScreen();
void drawMapLine(int16 x1, int16 y1, int16 x2, int16 y2);
void drawColorPoint();
void drawMapPoint(int16, int16, int16);
void drawPanelText(int16, const char *, int16);
int16 readScreenPixel(int16 screenX, int16 screenY);

// ==== seg000:0x8e38 ====

void clearStatusPanel(void) {
    drawPanelText(2, "", 0);
}

// ==== seg000:0x8e50 ====
void renderHudFrame(int16 unused) {
    int16 climbMarkerY, angleFixed, waypointMarkerX, circleX, angle, circleY, prevX, speedBarLen, prevY, markerX, deltaX, markerY, deltaY;
    char seekerShift;
    g_drawPage = gfx_getDisplayPage();
    // probably x,y
    deltaX = waypoints[waypointIndex].mapX - g_viewX_;
    deltaY = waypoints[waypointIndex].mapY - g_viewY_;
    g_waypointBearing = computeBearing(deltaX, -deltaY);
    if (g_hudVisible != 0) {
        if (g_damageTakenFlag != 0) {
            g_damageTakenFlag = 0;
            if (!(keyValue & 0x80)) {
                setDrawColor(0xd);
                fillRectBoth(0, 0, 319, 96);
                gfx_setDacAnimCount(60);
            }
        }
        g_hudDrawnFlag = 1;
        if (keyValue == 0 && g_halfScaleRender == 0) {
            if (!commData->setupUseJoy) {
                setDrawColor(0);
                drawViewportLine(277, 83, 293, 83);
                drawViewportLine(293, 83, 293, 95);
                drawViewportLine(293, 95, 277, 95);
                drawViewportLine(277, 95, 277, 83);
                drawViewportLine(285, 89, 285, 89);
                setDrawColor(0xf);
                markerX = ((int16)(joyAxes[0] - 120) >> 4) + 285;
                markerY = ((int16)((joyAxes[1] * 3) - 360) >> 6) + 89;
                drawViewportLine(markerX - 1, markerY, markerX + 1, markerY);
                drawViewportLine(markerX, markerY + 1, markerX, markerY - 1);
            }
            if (g_playerPlaneFlags & 0x200) {
                setDrawColor(0xf);
                drawViewportLine(156, 89, 164, 89);
                drawViewportLine(160, 86, 160, 92);
            }
            setDrawColor(g_nightMode != 0 ? 4 : 0);
            speedBarLen = clampRange((((g_cornerSpeed - g_knots) * 2) / 5) + 29, 0, 61);
            if (speedBarLen) drawViewportLine(72, 85 - speedBarLen, 72, 85);
            drawViewportLine(247, 56, 247, clampRange(-((g_climbRate >> 4) - 56), 20, 85));
            if ((g_playerPlaneFlags & 1) == 0 && (frameTick & 1) != 0 && gameData->unk4 != 0 && g_climbRate < 0) {
                climbMarkerY = (((g_planeTable.planes[g_closestThreatIndex].flags & 0x200 ? 0x100 : 0x80) / gameData->unk4) >> 4) + 56;
                setDrawColor(0xf);
                drawViewportLine(242, climbMarkerY - 2, 244, climbMarkerY);
                drawViewportLine(242, climbMarkerY + 2, 244, climbMarkerY);
            }
            // stall warning display
            if (g_knots < g_cornerSpeed && g_groundAltitude != g_viewZ && frameTick & 1) {
                drawStringActivePage("stall warning", 132, 30, 0xf);
            }
            if (g_currentWeaponType == 0 || g_currentWeaponType == 2) {
                setDrawColor(7);
                g_flightPathMarkerY = (g_rollPitchTrim >> 6) + 56;
                if (g_flightPathMarkerY > 10 && g_flightPathMarkerY < 111) {
                    blitSprite(154, g_flightPathMarkerY - 4, 0x94, 21, 11, 7, 0xf);
                }
            }
            if (g_currentWeaponType == 1) {
                seekerShift = g_halfScaleRender + 4;
                markerX = (g_aamSeekerX >> seekerShift) + 159;
                markerY = (g_aamSeekerY >> seekerShift) + 56;
                if (markerX > 10 && markerX < 309 && markerY > 8 && markerY < 91) {
                    blitSprite(markerX - 6, markerY - 5, 0x91, 0x4, 0xd, 0xb, 0xe);
                }
                // 7 = air to air? Only Sidewinder and Amraam have it
                if (sams[missiles[missleSpec[missileSpecIndex].weaponIdx].specIndex].weaponClass == 7) {
                    setDrawColor((uint8)gfxModeUnset != 0 ? 0xf : 7);
                    for (angle = 0; angle <= 0x100; angle += 0x10) {
                        angleFixed = angle << 8;
                        circleX = sinMul(angleFixed, 40) + 159;
                        circleY = -(cosMul(angleFixed, 35) - 56);
                        if (angle != 0) drawViewportLine(circleX, circleY, prevX, prevY);
                        prevX = circleX;
                        prevY = circleY;
                    }
                }
            }
            drawNumber(g_knots, 80, 54, 0xf);
            if (g_altitude <= 20000) {
                drawNumber(g_altitude < 100 ? g_altitude : (g_altitude / 5) * 5, 228, 54, 0xf);
            }
            if (g_timeAccelMode > 1) {
                drawStringBothPages("ACCEL", 150, 4, 0xf);
            }
            if (g_playerPlaneFlags & 0x1000) {
                drawStringBothPages("TRAINING", 234, 16, 0xf);
            }
            if (g_autopilotAltitude != 0) {
                drawStringBothPages("AUTOPILOT", 236, 90, 0xf);
            }
            waypointMarkerX = clampRange((((int16)(g_waypointBearing - g_ourHead) >> 6) / 3) + 159, 89, 229);
            setDrawColor(0x0b);
            drawViewportLine(waypointMarkerX - 2, 15, waypointMarkerX, 17);
            drawViewportLine(waypointMarkerX, 17, waypointMarkerX + 2, 15);
            drawViewportLine(waypointMarkerX - 2, 15, waypointMarkerX + 2, 15);
            goto somewhere;
        }
    somewhere:
        drawTacticalMap(g_drawPage);
    }
    if (g_hudMsgTimer != 0 && ((keyValue == 0 && g_halfScaleRender == 0) || (g_directorMode != 0))) {
        drawStringActivePage(tempString, -(((int16)strlen(tempString) >> 1) - 40) * 4, 24, 0xf);
        g_hudMsgTimer--;
        if (g_autopilotEngaged == 1) {
            drawStringActivePage("Press any key to play", 120, 1, g_nightMode != 0 ? 0xe : 0);
        }
    }
    if (g_dirMsgTimer != 0 && keyValue == 0 && g_halfScaleRender == 0) {
        drawStringActivePage(string_3C04A, -(((int16)strlen(string_3C04A) >> 1) - 40) * 4, 90, 0xf);
        g_dirMsgTimer--;
    }
}

// ==== seg000:0x94d0 routine_189 ====
void setActivePanel(int16 panelId) {
    int16 p, a, b, c, d, e, f, g, h, i;
    if (g_hudVisible == 0) {
        return;
    }
    switch (panelId) {
    case 0x13:
        strcpy(strBuf, "TrackCam ");
        switch (g_viewHeadingOffset) {
        case 0:
            strcat(strBuf, "Ahead");
            break;
        case (int16)0x8000:
            strcat(strBuf, "Rear");
            break;
        case 0x4000:
            strcat(strBuf, "Right");
            break;
        case (int16)0xC000:
            strcat(strBuf, "Left");
            break;
        }
        drawPanelText(2, strBuf, 3);
        break;
    }
    g_activePanelMode = panelId;
}

// ==== seg000:0x957a ====
void refreshActivePanel(int16 panelId) {
    int16 p;
    if (panelId == g_activePanelMode) {
        setActivePanel(panelId);
    }
}

// ==== seg000:0x9595 ====
void initTacMapView(void) {
    g_mapMode = 0;
    g_scopeClipLeft = 24;
    g_scopeClipRight = 96;
    g_scopeClipTop = 112;
    g_scopeClipBottom = 168;
    g_scopeCenterX = 72;
    g_scopeCenterY = 56;
    zoomIn();
}

// ==== seg000:0x95c9 ====
void redrawTacMap(int16 centerX, int16 centerY) {
    int16 screenX, screenY, idx, c, savedPage;

    g_mapMode = 0;
    if (g_hudVisible == 0) {
        return;
    }
    drawPanelText(1, "Map", 0);
    idx = 72 << (9 - g_mapZoomLevel);
    g_mapCenterX = clampRange(sinMul(g_ourHead, 0x4000 >> g_mapZoomLevel) + centerX, idx, 0x7fff - idx);
    idx = (56 << (9 - g_mapZoomLevel)) / 3 * 4;
    g_mapCenterY = clampRange(centerY - cosMul(g_ourHead, 0x4000 >> g_mapZoomLevel), idx, 0x7fff - idx);
    loadColorPalette(commData->gfxModeNum != 0 ? 0 : 3);
    gfx_setFadeSteps(19);
    renderMapTerrain(g_mapTerrainMode, g_mapCenterX / 2, -(g_mapCenterY / 2 - 0x4000), 9 - g_mapZoomLevel);
    if (gameData->theater < 2) {
        gfx_setFadeSteps(12);
    } else {
        gfx_setFadeSteps(16);
    }
    savedPage = g_drawPage;
    g_drawPage = gfx_getDisplayPage();
    for (idx = 1; idx < g_planeCount; idx++) {
        if (g_planeTable.planes[idx].active != 0 && !(g_planeTable.planes[idx].flags & 0x80) &&
            objectToScreen(g_planeTable.planes[idx].mapX, g_planeTable.planes[idx].mapY, &screenX, &screenY)) {
            blitSprite(screenX - 1, screenY - 1, 0xa4, 0, 4, 4, 0);
        }
        if (((g_planeTable.planes[idx].flags & 0x481) == 0x401 || (g_planeTable.planes[idx].flags & 0x200)) &&
            objectToScreen(g_planeTable.planes[idx].mapX, g_planeTable.planes[idx].mapY, &screenX, &screenY)) {
            blitSprite(screenX - 1, screenY - 1, (uint8)gfxModeUnset != 0 ? 0xac : 0xb0, 0, 4, 4, 0);
        }
    }
    for (idx = 0; idx < 2; idx++) {
        if (!(g_playerPlaneFlags & (0x4000 >> idx)) &&
            objectToScreen(waypoints[idx + 1].mapX, waypoints[idx + 1].mapY, &screenX, &screenY)) {
            blitSprite(screenX - 1, screenY - 1, (uint8)gfxModeUnset != 0 ? 0xb4 : 0xa8, 0, 4, 4, 0);
        }
    }
    g_drawPage = savedPage;
    if ((char)gfx_getDisplayPage() == 0) {
        cacheScopePanel();
    } else {
        gfx_copyRect(*g_pageBack, 24, 112, *g_pageOffscreen, 24, 112, 72, 56);
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
int16 mapXToScreen(int16 mapX) {
    return ((mapX - g_mapCenterX) >> (10 - g_mapZoomLevel)) + 60;
}

// ==== seg000:0x9915 ====
int16 mapYToScreen(int16 mapY) {
    return (((mapY - g_mapCenterY) >> (10 - g_mapZoomLevel)) * 3 >> 1 >> 1) + 140;
}

// ==== seg000:0x993a ====
int16 plotMapObject(int16 mapX, int16 mapY, int16 color, int16 big) {
    int16 screenX, screenY;
    if (g_mapMode != 0 || g_hudVisible == 0) {
        return 0;
    }
    screenX = mapXToScreen(mapX);
    screenY = mapYToScreen(mapY);
    if (color != -1 && screenX >= g_scopeClipLeft && screenX < g_scopeClipRight - 1 && screenY >= g_scopeClipTop && screenY < g_scopeClipBottom - 1) {
        drawMapPoint(screenX, screenY, color);
        if (big != 0) {
            drawMapPoint(screenX + 1, screenY, color);
            drawMapPoint(screenX, screenY + 1, color);
            drawMapPoint(screenX + 1, screenY + 1, color);
        }
        return 0;
    } else {
        return 1;
    }
}

// ==== seg000:0x99ec ====
int16 objectToScreen(int16 mapX, int16 mapY, int16 *outScreenX, int16 *outScreenY) {
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
extern int16 mapXToScreen(int16);
extern int16 mapYToScreen(int16);

int16 readMapPixelColor(int16 mapX, int16 mapY) {
    int16 screenX, screenY, color;
    if (g_mapMode != 0) return 0;
    screenX = mapXToScreen(mapX);
    screenY = mapYToScreen(mapY);
    screenX = clampRange(screenX, g_scopeClipLeft, g_scopeClipRight);
    screenY = clampRange(screenY, g_scopeClipTop, g_scopeClipBottom);
    color = -1;
    if (screenX > g_scopeClipLeft && screenX < g_scopeClipRight && screenY > g_scopeClipTop && screenY < g_scopeClipBottom) {
        color = readScreenPixel(screenX, screenY);
    }
    return color;
}

// ==== seg000:0x9adb ====
void drawMapRangeArc(int16 centerX, int16 centerY, int16 radius, int16 color, int16 connectLines, int16 startAngle, int16 endAngle) {
    int16 angleFixed, x, angle, prevX, y, e, prevY;

    if (endAngle < startAngle) {
        startAngle += 0x100;
    }
    setDrawColor(color);
    for (angle = startAngle; angle <= endAngle; angle += 0x10) {
        angleFixed = *(uint8 *)&angle << 8;
        x = sinMul(angleFixed, radius) + centerX;
        y = centerY - cosMul(angleFixed, radius);
        if ((uint16)x > 0xC000u) {
            x = 0;
        }
        if ((uint16)y > 0xC000u) {
            y = 0;
        }
        if (angle != startAngle && connectLines != 0) {
            drawMapLine(x, y, prevX, prevY);
        } else {
            plotMapObject(x, y, color, 0);
        }
        prevX = x;
        prevY = y;
    }
}

// ==== seg000:0x9b98 ====
void drawMapLine(int16 x1, int16 y1, int16 x2, int16 y2) {
    drawClippedLineRegion(mapXToScreen(x1), mapYToScreen(y1), mapXToScreen(x2), mapYToScreen(y2), g_scopeClipLeft, g_scopeClipRight, g_scopeClipTop, g_scopeClipBottom, 1);
}

// ==== seg000:0x9be1 ====
void drawFullscreenLine(int16 x1, int16 y1, int16 x2, int16 y2) {
    drawClippedLineRegion(x1, y1, x2, y2, 0, 319, 0, 199, 1);
}

// ==== seg000:0x9c0c ====
void drawViewportLine(int16 x1, int16 y1, int16 x2, int16 y2) {
    int16 height, width;

    width = g_pageFront[10] - g_pageFront[9] + 1;
    height = g_pageFront[8] - g_pageFront[7] + 1;
    gfx_setBlitOffset(gfx_calcRowAddr(g_pageFront[9], g_pageFront[7]));
    g_clipMaxX = width - 1;
    g_clipMaxY = height - 1;
    gfx_setColor(g_pageFront[2]);
    g_lineX1 = x1;
    g_lineY1 = y1;
    g_lineX2 = x2;
    g_lineY2 = y2;
    drawClipLineGlobal();
    gfx_nop23();
}

// ==== seg000:0x9c84 ====
void drawClippedLineRegion(int16 x1, int16 y1, int16 x2, int16 y2, int16 clipLeft, int16 clipRight, int16 clipTop, int16 clipBottom, int16 drawBothPages) {
    int16 height, width;

    width = clipRight - clipLeft + 1;
    height = clipBottom - clipTop + 1;
    gfx_setBlitOffset(gfx_calcRowAddr(clipLeft, clipTop));
    g_clipMaxX = width - 1;
    g_clipMaxY = height - 1;
    gfx_setColor(g_pageFront[2]);
    g_lineX1 = x1 - clipLeft;
    g_lineY1 = y1 - clipTop;
    g_lineX2 = x2 - clipLeft;
    g_lineY2 = y2 - clipTop;
    drawClipLineGlobal();
    gfx_nop23();
    if (drawBothPages != 0) {
        g_drawPage = gfx_getDisplayPage();
        gfx_setPageN(g_drawPage == 0);
        gfx_setColor(g_pageFront[2]);
        g_lineX1 = x1 - clipLeft;
        g_lineY1 = y1 - clipTop;
        g_lineX2 = x2 - clipLeft;
        g_lineY2 = y2 - clipTop;
        drawClipLineGlobal();
        gfx_setPageN(g_drawPage != 0);
        gfx_nop23();
    }
    g_clipMaxX = 319;
    g_clipMaxY = 199;
    gfx_setBlitOffset(0);
}

// ==== seg000:0x9d86 ====
void drawScreenLineOnePage(int16 x1, int16 y1, int16 x2, int16 y2) {
    drawClippedLineRegion(x1, y1, x2, y2, 0, 319, 0, 199, 0);
}

// ==== seg000:0x9db0 ====
void drawHudViewLine(int16 x1, int16 y1, int16 x2, int16 y2) {
    if (g_halfScaleRender != 0) {
        if (gameData->unk4 < 2) {
            drawViewportLine(x1, y1, x2, y2);
        } else {
            drawClippedLineRegion(x1, y1, x2, y2, 104, 216, 62, 96, 0);
        }
    } else if (g_missionStatus != 0) {
        drawClippedLineRegion(x1, y1, x2, y2, 48, 271, 15, 96, 0);
    } else {
        drawViewportLine(x1, y1, x2, y2);
    }
}

// ==== seg000:0x9e44 ====
void setDrawColor(int16 color) {
    g_pageFront[2] = color;
    g_pageBack[2] = color;
}

// ==== seg000:0x9e5d ====
void fillRectBoth(int16 x1, int16 y1, int16 x2, int16 y2) {
    fillSpanRect(g_pageFront, x1, y1, x2, y2);
    fillSpanRect(g_pageBack, x1, y1, x2, y2);
}

// ==== seg000:0x9e94 ====
void drawColorPoint(int16 screenX, int16 screenY, int16 color) {
    setDrawColor(color);
    drawFullscreenLine(screenX, screenY, screenX, screenY);
}

// ==== seg000:0x9ea0 ====
void drawMapPoint(int16 x, int16 y, int16 color) {
    setDrawColor(color);
    drawFullscreenLine(x, y, x, y);
}

// ==== seg000:0x9eb6 ====
void switchIndicatorColor(int16 indicatorIdx, int16 color) {
    if (g_hudVisible == 0) goto done;
    if (*(g_tacmapIndicators + indicatorIdx * 5 + 7) != color) {
        gfx_switchColor(g_pageFront, *(g_tacmapIndicators + indicatorIdx * 5 + 3), *(g_tacmapIndicators + indicatorIdx * 5 + 4), *(g_tacmapIndicators + indicatorIdx * 5 + 5), *(g_tacmapIndicators + indicatorIdx * 5 + 6), *(g_tacmapIndicators + indicatorIdx * 5 + 7), color);
        gfx_switchColor(g_pageBack, *(g_tacmapIndicators + indicatorIdx * 5 + 3), *(g_tacmapIndicators + indicatorIdx * 5 + 4), *(g_tacmapIndicators + indicatorIdx * 5 + 5), *(g_tacmapIndicators + indicatorIdx * 5 + 6), *(g_tacmapIndicators + indicatorIdx * 5 + 7), color);
        *(g_tacmapIndicators + indicatorIdx * 5 + 7) = color;
    }
done:;
}

// ==== seg000:0x9fad ====
void drawPanelText(int16 panel, const char *text, int16 color) {
    fillPanelBox(panel, color);
    drawCenteredLabelBox(panel, text);
}

// ==== seg000:0x9fcc ====
void fillPanelBox(int16 panelId, int16 color) {
    setDrawColor(color);
    if (panelId == 1) {
        fillRectBoth(24, 112, 96, 168);
    }
    if (panelId == 2) {
        fillRectBoth(120, 104, 199, 175);
    }
    if (panelId == 3) {
        fillRectBoth(232, 128, 304, 184);
    }
}

// ==== seg000:0xa0cb ====
void drawStringBothPages(const char *text, int16 screenX, int16 screenY, int16 color) {
    drawStringCentered(g_pageFront, text, screenX, screenY, color);
    drawStringCentered(g_pageBack, text, screenX, screenY, color);
}

// ==== seg000:0xa0fe ====
void drawStringActivePage(const char *text, int16 screenX, int16 screenY, int16 color) {
    if (g_drawPage == 0) {
        drawStringCentered(g_pageFront, text, screenX, screenY, color);
    } else {
        drawStringCentered(g_pageBack, text, screenX, screenY, color);
    }
}

// ==== seg000:0xa13a ====
void drawStringCentered(int16 *strStruct, const char *text, int16 screenX, int16 screenY, int16 color) {
    strStruct[6] = 0;
    strStruct[4] = screenX;
    strStruct[5] = screenY;
    strStruct[2] = color;
#ifdef BUGFIX
    gfx_drawString(strStruct, strupr((char *)text));
#else
    gfx_drawString(strStruct, strupr((char *)text), strlen(text));
#endif
}

// ==== seg000:0xa183 ====
void drawNumber(int16 value, int16 x, int16 y, int16 color) {
    char buf[20];
    itoa(value, buf, 10);
    drawStringBothPages(buf, x, y, color);
}

// ==== seg000:0xa1b1 ====
int16 readScreenPixel(int16 screenX, int16 screenY) {
    regs.h.ah = 0x0D;
    g_biosPixelX = screenX;
    g_biosPixelY = screenY;
    g_biosPixelPage = 0;
    int86(0x10, &regs, &regs);
    return regs.h.al;
}

// ==== seg000:0xa1e4 ====
void tempStrcpy(const char *src) {
    strcpy(tempString, src);
    g_hudMsgTimer = g_frameRateScaling * 3;
}

// ==== seg000:0xa204 ====
void setTimedMessage(char *message) {
    strcpy(string_3C04A, message);
    g_dirMsgTimer = g_frameRateScaling * 3;
}

// ==== seg000:0xa224 ====
int16 missileTargetCompat(int16 weaponType, int16 objIdx) {
    return (int16)(char)g_targetCompatTable[weaponType * 13 + ((int16)(char)g_shapeTargetCategory[g_planeTable.planes[objIdx].nameIndex & 0x7f] & 0xf)];
}
