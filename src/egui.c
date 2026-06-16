// seg000 optimized code (/Ot)
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
#include <memory.h>


void drawTacticalMap(char page)
{
    int p;
    int a;
    int b;
    int c;
    int d;
    int e;
    int f;
    int g;
    int h;
    int i;
    int j;

    h = var_588 + 1;
    setDrawColor(0);
    fillSpanRect(page == 0 ? var_564 : var_565, 0x78, 0x68, 0xc7, 0xaf);
    setDrawColor(8);
    j = 1;
    if (var_588 < 2 && word_38FDC != 0) {
        j = (1 << (2 - (unsigned char)var_588)) + 1;
    }
    i = 1 - j;
    e = g_viewX_ & 0xf800;
    g = g_viewY_ & 0xf800;
    f = i * 2;
    while (j * 2 >= f) {
        projectMapPoint(f * 0x400 + e, g + 0x1c00);
        p = var_279;
        b = var_282;
        projectMapPoint(f * 0x400 + e, g - 0x1800);
        drawClippedLineRegion(p, b, var_279, var_282, 0x78, 0xc7, 0x68, 0xaf, 0);
        f += 2;
    }
    f = i * 2;
    while (j * 2 >= f) {
        projectMapPoint(e + 0x1c00, f * 0x400 + g);
        p = var_279;
        b = var_282;
        projectMapPoint(e - 0x1800, f * 0x400 + g);
        drawClippedLineRegion(p, b, var_279, var_282, 0x78, 0xc7, 0x68, 0xaf, 0);
        f += 2;
    }
    for (f = 0; f < word_3C046; f++) {
        if ((stru_3B202[f].state[8] & 2) && *(int16 *)&stru_3B202[f].state[10] != 0) {
            projectMapPoint(stru_3B202[f].posX, stru_3B202[f].posY);
            if (word_3C016 != -1) {
                if (g_currentWeaponType == 1 && f == word_336F2) {
                    drawMapMarkerBox(var_279, var_282, 7);
                }
                if (word_336F8 > 0 && f == 0xffff - word_3BE96) {
                    drawMapMarkerBox(var_279, var_282, word_38F72);
                }
                a = *(int16 *)&stru_3B202[f].state[0] - var_542 + 0x800;
                d = stru_3B202[f].alt - var_547;
                c = 0;
                if (d < -1000) {
                    c = 1;
                }
                if (d > 1000) {
                    c = 2;
                }
                blitGaugeSprite((a >> 12) & 0xf, c, var_279, var_282);
            }
        }
    }
    for (f = 0; f < 12; f++) {
        if (stru_335C4[f].ttl != 0) {
            projectMapPoint(stru_335C4[f].mapX, stru_335C4[f].mapY);
            if (word_3C016 != -1) {
                if (sams[*(int16 *)&stru_335C4[f].state[0]].field_C <= 0) {
                    setDrawColor(0x0c);
                } else {
                    setDrawColor(0x0e);
                }
                if (sams[*(int16 *)&stru_335C4[f].state[0]].field_C == 3) {
                    setDrawColor(*(char *)&gfxModeUnset != 0 ? 8 : 0x0d);
                }
                if (!(stru_335C4[f].alt & 1)) {
                    setDrawColor(7);
                }
                if (f >= 8) {
                    setDrawColor(0x0f);
                }
                a = stru_335C4[f].worldX - var_542;
                drawScreenLineOnePage(var_279, var_282, var_279 - sinMul(a, h), cosMul(a, h) + var_282);
            }
        }
    }
    for (f = 0; f < word_3BED2; f++) {
        if (!(g_planes[f].flags & 0x80)) {
            projectMapPoint(g_planes[f].mapX, g_planes[f].mapY);
            if (word_3C016 != -1) {
                if (g_currentWeaponType == 2 && f == word_336F4) {
                    drawMapMarkerBox(var_279, var_282, 7);
                }
                a = 5;
                if (g_planes[f].flags & 0x201) {
                    a = (((-var_542 + 0x1000) >> 13) & 3) + 8;
                }
                if (g_planes[f].field_4 != 0) {
                    a = 1;
                }
                if (g_planes[f].flags & 8) {
                    a = 7;
                }
                if (f == g_targetSlots[0].planeIndex || f == g_targetSlots[1].planeIndex) {
                    a = 6;
                }
                blitGaugeSprite(a, 3, var_279, var_282);
            }
        }
    }
    projectMapPoint(g_viewX_, g_viewY_);
    if (word_3C016 != -1) {
        blitGaugeSprite(0, 3, var_279, var_282);
    }
    for (f = 0; f < 4; f++) {
        if (mapEvents[f].ttl != 0) {
            projectMapPoint(mapEvents[f].mapX, mapEvents[f].mapY);
            if (word_3C016 != -1) {
                switch (mapEvents[f].type) {
                case 1:
                    blitGaugeSprite(2, 3, var_279, var_282);
                    break;
                case 2:
                    blitGaugeSprite(3, 3, var_279, var_282);
                    break;
                }
            }
        }
    }
}

// ==== seg000:0xa740 ====
void drawMapMarkerBox(int arg_0, int arg_2, int color) {
    setDrawColor(color);
    drawScreenLineOnePage(var_279 - 4, var_282 - 3, var_279 + 4, var_282 - 3);
    drawScreenLineOnePage(var_279 + 4, var_282 - 3, var_279 + 4, var_282 + 3);
    drawScreenLineOnePage(var_279 + 4, var_282 + 3, var_279 - 4, var_282 + 3);
    drawScreenLineOnePage(var_279 - 4, var_282 + 3, var_279 - 4, var_282 - 3);
}

// ==== seg000:0xa7c4 ====

void projectMapPoint(int mapX, int mapY) {
    int p;
    int a;
    char b;
    word_3C016 = 0;
    b = 7 - (char)var_588;
    p = (mapX - g_viewX_) >> b;
    a = (g_viewY_ - mapY) >> b;
    var_279 = cosMul(var_542, p) - sinMul(var_542, a);
    var_282 = cosMul(var_542, a) + sinMul(var_542, p);
    var_279 += 0xa0;
    var_282 = -var_282 + 0x98;
    if (var_279 < 0x7c || var_279 > 0xc3) {
        word_3C016 = -1;
    }
    if (var_282 < 0x6b || var_282 > 0xac) {
        word_3C016 = -1;
    }
}

// ==== seg000:0xa872 ====
void blitGaugeSprite(int srcCol, int srcRow, int destX, int destY) {
    gaugeSpriteParams.bufPtr = gfxBufPtr;
    gaugeSpriteParams.srcX = srcCol * 8 + 1;
    gaugeSpriteParams.srcY = srcRow * 8 + 0x1f;
    gaugeSpriteParams.page = (byte_3C5A0 != 0);
    gaugeSpriteParams.dstX = destX - 3;
    gaugeSpriteParams.dstY = destY - 3;
    gaugeSpriteParams.width = 7;
    gaugeSpriteParams.height = 7;
    gfx_blitSpriteClipped((int16 *)&gaugeSpriteParams);
}

// ==== seg000:0xa8c8 ====
void blitSprite(int destX, int destY, int srcX, int srcY, int spriteWidth, int arg_a, int arg_c) {
    blitSpriteParams.bufPtr = gfxBufPtr;
    blitSpriteParams.srcX = srcX;
    blitSpriteParams.srcY = srcY;
    blitSpriteParams.page = (byte_3C5A0 != 0);
    blitSpriteParams.dstX = destX;
    blitSpriteParams.dstY = destY;
    blitSpriteParams.width = spriteWidth;
    blitSpriteParams.height = arg_a;
    blitSpriteParams.pad19[0] = (char)arg_c;
    if (arg_c != 0) {
        blitSpriteParams.flags = 1;
        gfx_blitSpriteClipped((int16 *)&blitSpriteParams);
        return;
    }
    blitSpriteParams.flags = 0x10;
    gfx_blitSpriteOpaque((int16 *)&blitSpriteParams);
}

// ==== seg000:0xa934 ====
void cacheScopePanel(void) {
    gfx_copyRect(*var_564, 0x18, 0x70, *var_566, 0x18, 0x70, 0x49, 0x39);
}

// ==== seg000:0xa962 ====
void restoreScopePanel(void) {
    gfx_copyRect(*var_566, 0x18, 0x70, *var_564, 0x18, 0x70, 0x49, 0x39);
    gfx_copyRect(*var_564, 0x18, 0x70, *var_565, 0x18, 0x70, 0x49, 0x39);
}

// ==== seg000:0xa9bc ====
void captureScopePanel(void) {
    gfx_copyRect(*var_566, 0x18, 0x70, byte_3C5A0 ? *var_565 : *var_564, 0x18, 0x70, 0x49, 0x39);
}
