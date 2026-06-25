// seg000 optimized code (/Ot)
#include "egcode.h"
#include "egdata.h"
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
#include <memory.h>

/* Private helpers for this translation unit. */
void drawMapMarkerBox(int centerX, int centerY, int color);
void projectMapPoint(int mapX, int mapY);
void blitGaugeSprite(int srcCol, int srcRow, int destX, int destY);


void drawTacticalMap(char page)
{
    int startX;
    int code;
    int startY;
    int altBand;
    int altDiff;
    int gridX;
    int i;
    int gridY;
    int radius;
    int gridLo;
    int gridStep;

    radius = g_radarScopeRange + 1;
    setDrawColor(0);
    fillSpanRect(page == 0 ? g_pageFront : g_pageBack, 120, 104, 199, 175);
    setDrawColor(8);
    gridStep = 1;
    if (g_radarScopeRange < 2 && g_detailLevel != 0) {
        gridStep = (1 << (2 - (unsigned char)g_radarScopeRange)) + 1;
    }
    gridLo = 1 - gridStep;
    gridX = g_viewX_ & 0xf800;
    gridY = g_viewY_ & 0xf800;
    i = gridLo * 2;
    while (gridStep * 2 >= i) {
        projectMapPoint(i * 0x400 + gridX, gridY + 0x1c00);
        startX = vtxScratch.vproj.x.lo;
        startY = vtxScratch.vproj.y.lo;
        projectMapPoint(i * 0x400 + gridX, gridY - 0x1800);
        drawClippedLineRegion(startX, startY, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, 120, 199, 104, 175, 0);
        i += 2;
    }
    i = gridLo * 2;
    while (gridStep * 2 >= i) {
        projectMapPoint(gridX + 0x1c00, i * 0x400 + gridY);
        startX = vtxScratch.vproj.x.lo;
        startY = vtxScratch.vproj.y.lo;
        projectMapPoint(gridX - 0x1800, i * 0x400 + gridY);
        drawClippedLineRegion(startX, startY, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, 120, 199, 104, 175, 0);
        i += 2;
    }
    for (i = 0; i < g_groundUnitCount; i++) {
        if ((g_simObjects[i].flags.b[0] & 2) && g_simObjects[i].speed != 0) {
            projectMapPoint(g_simObjects[i].posX, g_simObjects[i].posY);
            if (g_projDepth != -1) {
                if (g_currentWeaponType == 1 && i == g_airTargetLock) {
                    drawMapMarkerBox(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, 7);
                }
                if (g_scopeSweepTimer > 0 && i == 0xffff - g_threatLabelTarget) {
                    drawMapMarkerBox(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, g_scopeArcColor);
                }
                code = g_simObjects[i].heading.w - g_ourHead + 0x800;
                altDiff = g_simObjects[i].alt - g_viewZ;
                altBand = 0;
                if (altDiff < -1000) {
                    altBand = 1;
                }
                if (altDiff > 1000) {
                    altBand = 2;
                }
                blitGaugeSprite((code >> 12) & 0xf, altBand, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo);
            }
        }
    }
    for (i = 0; i < 12; i++) {
        if (g_projectiles[i].ttl != 0) {
            projectMapPoint(g_projectiles[i].mapX, g_projectiles[i].mapY);
            if (g_projDepth != -1) {
                if (sams[g_projectiles[i].specIdx].weaponClass <= 0) {
                    setDrawColor(0x0c);
                } else {
                    setDrawColor(0x0e);
                }
                if (sams[g_projectiles[i].specIdx].weaponClass == 3) {
                    setDrawColor(*(char *)&gfxModeUnset != 0 ? 8 : 0x0d);
                }
                if (!(g_projectiles[i].alt & 1)) {
                    setDrawColor(7);
                }
                if (i >= 8) {
                    setDrawColor(0x0f);
                }
                code = g_projectiles[i].worldX - g_ourHead;
                drawScreenLineOnePage(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, vtxScratch.vproj.x.lo - sinMul(code, radius), cosMul(code, radius) + vtxScratch.vproj.y.lo);
            }
        }
    }
    for (i = 0; i < g_planeCount; i++) {
        if (!(g_planeTable.planes[i].flags & 0x80)) {
            projectMapPoint(g_planeTable.planes[i].mapX, g_planeTable.planes[i].mapY);
            if (g_projDepth != -1) {
                if (g_currentWeaponType == 2 && i == g_groundTargetLock) {
                    drawMapMarkerBox(vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo, 7);
                }
                code = 5;
                if (g_planeTable.planes[i].flags & 0x201) {
                    code = (((-g_ourHead + 0x1000) >> 13) & 3) + 8;
                }
                if (g_planeTable.planes[i].active != 0) {
                    code = 1;
                }
                if (g_planeTable.planes[i].flags & 8) {
                    code = 7;
                }
                if (i == g_targetSlots[0].planeIndex || i == g_targetSlots[1].planeIndex) {
                    code = 6;
                }
                blitGaugeSprite(code, 3, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo);
            }
        }
    }
    projectMapPoint(g_viewX_, g_viewY_);
    if (g_projDepth != -1) {
        blitGaugeSprite(0, 3, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo);
    }
    for (i = 0; i < 4; i++) {
        if (mapEvents[i].ttl != 0) {
            projectMapPoint(mapEvents[i].mapX, mapEvents[i].mapY);
            if (g_projDepth != -1) {
                switch (mapEvents[i].type) {
                case 1:
                    blitGaugeSprite(2, 3, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo);
                    break;
                case 2:
                    blitGaugeSprite(3, 3, vtxScratch.vproj.x.lo, vtxScratch.vproj.y.lo);
                    break;
                }
            }
        }
    }
}

// ==== seg000:0xa740 ====
void drawMapMarkerBox(int centerX, int centerY, int color) {
    setDrawColor(color);
    drawScreenLineOnePage(vtxScratch.vproj.x.lo - 4, vtxScratch.vproj.y.lo - 3, vtxScratch.vproj.x.lo + 4, vtxScratch.vproj.y.lo - 3);
    drawScreenLineOnePage(vtxScratch.vproj.x.lo + 4, vtxScratch.vproj.y.lo - 3, vtxScratch.vproj.x.lo + 4, vtxScratch.vproj.y.lo + 3);
    drawScreenLineOnePage(vtxScratch.vproj.x.lo + 4, vtxScratch.vproj.y.lo + 3, vtxScratch.vproj.x.lo - 4, vtxScratch.vproj.y.lo + 3);
    drawScreenLineOnePage(vtxScratch.vproj.x.lo - 4, vtxScratch.vproj.y.lo + 3, vtxScratch.vproj.x.lo - 4, vtxScratch.vproj.y.lo - 3);
}

// ==== seg000:0xa7c4 ====

void projectMapPoint(int mapX, int mapY) {
    int scaledX;
    int scaledY;
    char shift;
    g_projDepth = 0;
    shift = 7 - (char)g_radarScopeRange;
    scaledX = (mapX - g_viewX_) >> shift;
    scaledY = (g_viewY_ - mapY) >> shift;
    vtxScratch.vproj.x.lo = cosMul(g_ourHead, scaledX) - sinMul(g_ourHead, scaledY);
    vtxScratch.vproj.y.lo = cosMul(g_ourHead, scaledY) + sinMul(g_ourHead, scaledX);
    vtxScratch.vproj.x.lo += 160;
    vtxScratch.vproj.y.lo = -vtxScratch.vproj.y.lo + 152;
    if (vtxScratch.vproj.x.lo < 124 || vtxScratch.vproj.x.lo > 195) {
        g_projDepth = -1;
    }
    if (vtxScratch.vproj.y.lo < 107 || vtxScratch.vproj.y.lo > 172) {
        g_projDepth = -1;
    }
}

// ==== seg000:0xa872 ====
void blitGaugeSprite(int srcCol, int srcRow, int destX, int destY) {
    gaugeSpriteParams.bufPtr = gfxBufPtr;
    gaugeSpriteParams.srcX = srcCol * 8 + 1;
    gaugeSpriteParams.srcY = srcRow * 8 + 31;
    gaugeSpriteParams.page = (g_drawPage != 0);
    gaugeSpriteParams.dstX = destX - 3;
    gaugeSpriteParams.dstY = destY - 3;
    gaugeSpriteParams.width = 7;
    gaugeSpriteParams.height = 7;
    gfx_blitSpriteClipped((int16 *)&gaugeSpriteParams);
}

// ==== seg000:0xa8c8 ====
void blitSprite(int destX, int destY, int srcX, int srcY, int spriteWidth, int spriteHeight, int transparent) {
    blitSpriteParams.bufPtr = gfxBufPtr;
    blitSpriteParams.srcX = srcX;
    blitSpriteParams.srcY = srcY;
    blitSpriteParams.page = (g_drawPage != 0);
    blitSpriteParams.dstX = destX;
    blitSpriteParams.dstY = destY;
    blitSpriteParams.width = spriteWidth;
    blitSpriteParams.height = spriteHeight;
    blitSpriteParams.pad19[0] = (char)transparent;
    if (transparent != 0) {
        blitSpriteParams.flags = 1;
        gfx_blitSpriteClipped((int16 *)&blitSpriteParams);
        return;
    }
    blitSpriteParams.flags = 0x10;
    gfx_blitSpriteOpaque((int16 *)&blitSpriteParams);
}

// ==== seg000:0xa934 ====
void cacheScopePanel(void) {
    gfx_copyRect(*g_pageFront, 24, 112, *g_pageOffscreen, 24, 112, 73, 57);
}

// ==== seg000:0xa962 ====
void restoreScopePanel(void) {
    gfx_copyRect(*g_pageOffscreen, 24, 112, *g_pageFront, 24, 112, 73, 57);
    gfx_copyRect(*g_pageFront, 24, 112, *g_pageBack, 24, 112, 73, 57);
}

// ==== seg000:0xa9bc ====
void captureScopePanel(void) {
    gfx_copyRect(*g_pageOffscreen, 24, 112, g_drawPage ? *g_pageBack : *g_pageFront, 24, 112, 73, 57);
}
