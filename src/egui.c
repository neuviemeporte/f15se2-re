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
    e = word_3BEC0 & 0xf800;
    g = word_3BED0 & 0xf800;
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
                if (word_3C45C == 1 && f == word_336F2) {
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
        if (!(stru_3AA5E[f].flags & 0x80)) {
            projectMapPoint(stru_3AA5E[f].mapX, stru_3AA5E[f].mapY);
            if (word_3C016 != -1) {
                if (word_3C45C == 2 && f == word_336F4) {
                    drawMapMarkerBox(var_279, var_282, 7);
                }
                a = 5;
                if (stru_3AA5E[f].flags & 0x201) {
                    a = (((-var_542 + 0x1000) >> 13) & 3) + 8;
                }
                if (stru_3AA5E[f].field_4 != 0) {
                    a = 1;
                }
                if (stru_3AA5E[f].flags & 8) {
                    a = 7;
                }
                if (f == word_3B146 || f == word_3B158) {
                    a = 6;
                }
                blitGaugeSprite(a, 3, var_279, var_282);
            }
        }
    }
    projectMapPoint(word_3BEC0, word_3BED0);
    if (word_3C016 != -1) {
        blitGaugeSprite(0, 3, var_279, var_282);
    }
    for (f = 0; f < 4; f++) {
        if ((&word_333DA)[f * 6] != 0) {
            projectMapPoint((&word_333D2)[f * 6], (&word_333D4)[f * 6]);
            if (word_3C016 != -1) {
                switch ((&word_333D8)[f * 6]) {
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
    p = (mapX - word_3BEC0) >> b;
    a = (word_3BED0 - mapY) >> b;
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
    var_569 = gfxBufPtr;
    var_570 = srcCol * 8 + 1;
    var_571 = srcRow * 8 + 0x1f;
    var_572 = (byte_3C5A0 != 0);
    var_573 = destX - 3;
    var_574 = destY - 3;
    var_575 = 7;
    var_576 = 7;
    gfx_blitSpriteClipped(&word_383AE);
}

// ==== seg000:0xa8c8 ====
void blitSprite(int destX, int destY, int srcX, int srcY, int spriteWidth, int arg_a, int arg_c) {
    var_577 = gfxBufPtr;
    var_578 = srcX;
    var_579 = srcY;
    var_580 = (byte_3C5A0 != 0);
    var_581 = destX;
    var_582 = destY;
    var_583 = spriteWidth;
    var_584 = arg_a;
    var_586 = (char)arg_c;
    if (arg_c != 0) {
        var_585 = 1;
        gfx_blitSpriteClipped(&word_383CC);
        return;
    }
    var_585 = 0x10;
    gfx_blitSpriteOpaque(&word_383CC);
}

void updateTargetLock(void) {
    int p, a, b, c, d, e, f, g, h, i, j, k, l, m, n;
    int p0, a0, b0, c0, d0, e0, f0, g0, h0;
    register int dk;

    f0 = 0;

    /* Fire at keyValue == 0x8b (sidewinder lock) */
    if (keyValue == 0x8b) {
        drawWorldObject(6, (long)dword_3B7DA, 0x01000000L - dword_3B7F8,
            var_547 + 0x10, var_542, var_544, var_545, 2);
    }

    if (word_3B4D2 != 0) {
        word_3B4D2--;
    }

    if (!(word_336F4 & 0x80)) {
        if (frameTick & 0x0f) goto skip_aam;
        if (word_3C00A != 0) goto skip_aam;
    }
    if (word_3C09E != 0x13) goto skip_aam;
    if (word_3B4D2 != 0) goto skip_aam;
    if (word_3C45C == 1) goto skip_aam;
    if (keyValue & 0x80) goto skip_aam;

    if (!(word_336F4 & 0x80)) {
        word_336F4 = l = -1;
    }

    c = 100 << (6 - (unsigned char)word_330BC);

    if (word_336F4 != -1) {
        g = word_336F4 - 0x80;
        g0 = computeMapTargetRange(g) - 1;
        if (((int *)((char *)&stru_3AA5E[0] + (g << 4)))[9] != 0) {
            g0 -= 0x280;
        }
        if (g < 3) {
            g0 -= 0x0a00;
        }
        if (!(abs(var_542 + word_3C8B2 - var_674) > 0x2000)) goto lock_ok;
        g0 = -32000;
        goto after_lock;
    lock_ok:
        word_3C00A = 1;
    after_lock:
        ;
    } else {
        word_3C00A = 0;
        g0 = -32000;
    }

    l = -1;
    g = 1;
    while (g < word_3BED2) {
        computeMapTargetRange(g);
        a = abs(var_542 + word_3C8B2 - var_674);
        if (a < 0x1800 && (g + 0x80) != word_336F4) {
            p = g << 4;
            if (!(*(uint8 *)((char *)&stru_3AA5E[0] + p + 0x0b4 - (int)(char *)&stru_3AA5E[0]) & 0x80)) {
                if (*(int *)((char *)&stru_3AA5E[0] + p + 0x0b2 - (int)(char *)&stru_3AA5E[0]) != 0) {
                    var_672 -= 0x280;
                }
                if (g == word_3B146 || g == word_3B158) {
                    var_672 -= 0x0a00;
                }
                if (var_672 < c && g0 < var_672) {
                    l = g;
                    c = var_672;
                }
            }
        }
        g++;
    }

    if (l & 0x80) {
        if (word_336F4 == -1) {
            word_3B4D2 = 4;
        } else {
            word_336F4 = -1;
        }
    } else {
        word_336F4 = l;
        word_39604 = 0;
    }

skip_aam:
    /* Missile/chaff loop (8 entries, stride 8) */
    for (g = 0; g < 8; g++) {
        p = g << 3;
        if (((int *)((char *)&stru_33402[0]))[p / 2] != 0) {
            projectWorldToHud(
                ((int *)((char *)&stru_33402[0]))[p / 2],
                ((int *)((char *)&stru_33402[0]))[p / 2 + 1],
                ((int *)((char *)&stru_33402[0]))[p / 2 + 2]);
            if (word_3C016 < 0 && word_3C016 > (int)0xff00) {
                p = g << 3;
                a = ((unsigned int *)((char *)&stru_33402[0]))[p / 2 + 1];
                b = 0;
                c0 = 5; do { b = (b << 1) | ((unsigned)a >> 15); a <<= 1; } while (--c0);
                d = ((unsigned int *)((char *)&stru_33402[0]))[p / 2];
                e = 0;
                c0 = 5; do { e = (e << 1) | ((unsigned)d >> 15); d <<= 1; } while (--c0);

                if (((unsigned char)word_33442 - (unsigned char)g & 7) < 4)
                    m = 3;
                else
                    m = 0x11;

                drawWorldObject(m, d, e, a, b,
                    ((int *)((char *)&stru_33402[0]))[p / 2 + 2], 0,
                    ((int *)((char *)&stru_33402[0]))[p / 2 + 3], 0, 0);
            }
        }
    }

    /* Air-to-ground targeting */
    c = 0x4b << (6 - (unsigned char)word_330BC);

    if (word_330C2 != 0 && (unsigned int)(word_38FEE + var_547) > 0x5dc) {
        h = 1;
    } else {
        h = 0;
    }
    if (word_330C2 != 0 && (unsigned int)(word_38FEE + var_547) > 0xfa0) {
        h = 2;
    }

    /* A2G radar lock range */
    if ((word_336F2 & 0x80) && word_336F2 != -1) {
        g = word_336F2 - 0x80;
        p = g * 0x24;
        g0 = computeTargetBearing(
            *(int *)((char *)&word_3B204 + p),
            *(int *)((char *)&word_3B206 + p),
            1);
        a = abs(var_542 + word_3C8B2 - var_674);
        if (a > 0x2000) {
            g0 = 0;
        }
    } else {
        g0 = 0;
    }

    l = -1;
    for (g = 0; g < word_3C046; g++) {
        p = g * 0x24;
        if (!(((uint8 *)((char *)&stru_3B208[0]))[p + 18] & 2))
            continue;

        a = computeSimObjectRange(g);
        if (a >= 0x12c0 && word_3370E == 0)
            continue;

        if (var_672 < c && g0 < var_672 &&
            !(keyValue & 0x80)) {
            p = g * 0x24;
            if (!(((uint8 *)((char *)&stru_3B208[0]))[p + 18] & 0x20) &&
                *(int *)((char *)&stru_3B208[0] + p + 20) != 0) {
                computeTargetBearing(
                    *(int *)((char *)&word_3B204 + p),
                    *(int *)((char *)&word_3B206 + p),
                    1);
                a = abs(var_542 + word_3C8B2 - var_674);
                if (a < 0x2000) {
                    c = var_672;
                    l = g;
                }
            }
        }

        /* Compute visual distance */
        p = g * 0x24;
        projectWorldToHud(
            *(int *)((char *)&stru_3B208[0] + p),
            *(int *)((char *)&word_3B204 + p),
            *(int *)((char *)&word_3B206 + p));

        if (word_3C016 >= 0)
            continue;

        word_3C016 >>= (unsigned char)h;

        if (word_3C016 <= -0x20) {
            setDrawColor(0x0f);
            drawViewportLine(var_279, var_282, var_279, var_282);
        } else {
            p = g * 0x24;
            if (*(int *)((char *)&stru_3B208[0] + p) < 999 && word_330BC == 0) {
                f = 0;
                b = word_3C16A << 4;
                if (*(int *)((char *)&stru_3AA5E[0] + b + 6) & 0x200) {
                    a = abs(*(int *)((char *)&word_3B204 + p) -
                        *(int *)((char *)&stru_3AA5E[0] + b));
                    d = word_38FFC >> 5;
                    if (a < d) {
                        a = abs(*(int *)((char *)&word_3B206 + p) -
                            *(int *)((char *)&stru_3AA5E[0] + b + 2));
                        d = word_39200 >> 5;
                        if (a < d) {
                            f = 0x80;
                        }
                    }
                }
                if (var_547 != 0x80 || f == 0x80) {
                    p = g * 0x24;
                    a = signOf(h);
                    drawWorldObject(5,
                        *(int *)((char *)&stru_3B208[0] + p + 2),
                        *(int *)((char *)&stru_3B208[0] + p + 4),
                        *(int *)((char *)&stru_3B208[0] + p + 6),
                        *(int *)((char *)&stru_3B208[0] + p + 8),
                        f,
                        *(int *)((char *)&stru_3B208[0] + p + 10),
                        0, 0, -(a - 2));
                }
            }

            /* Draw the target */
            p = g * 0x24;
            dk = (word_3C016 <= -0x10) ? 1 : 0;
            a = *(int *)((char *)&stru_3B208[0] + p + 16);
            a = *(int *)((char *)&aFlogger[0] + a * 0x20 + dk * 2 + 18);
            drawWorldObject(a,
                *(int *)((char *)&stru_3B208[0] + p + 2),
                *(int *)((char *)&stru_3B208[0] + p + 4),
                *(int *)((char *)&stru_3B208[0] + p + 6),
                *(int *)((char *)&stru_3B208[0] + p + 8),
                *(int *)((char *)&stru_3B208[0] + p),
                *(int *)((char *)&stru_3B208[0] + p + 10),
                *(int *)((char *)&stru_3B208[0] + p + 12),
                *(int *)((char *)&stru_3B208[0] + p + 14),
                2 - h);
        }
    }

    if (l != -1) {
        word_336F2 = l;
        word_39604 = 0;
    }
    if (word_336F2 & 0x80) {
        word_336F2 = -1;
    }

    /* SAM/missile visual loop (12 entries, stride 0x18) */
    for (g = 0; g < 12; g++) {
        p = g * 0x18;
        if (*(int *)((char *)&stru_335C4[0] + p + 14) == 0)
            continue;

        projectWorldToHud(
            *(int *)((char *)&stru_335C4[0] + p),
            *(int *)((char *)&stru_335C4[0] + p + 2),
            *(int *)((char *)&stru_335C4[0] + p + 4));

        if (var_279 == -1)
            continue;

        if (word_3C016 <= -0x20) {
            if (g < 8)
                a = 0x0c;
            else
                a = 0x0d;
            setDrawColor(a);
            drawViewportLine(var_279, var_282, var_279, var_282);
        } else {
            p = g * 0x18;
            if (!(keyValue & 0x80) || keyValue == 0x8b)
                m = 1;
            else
                m = 3;

            a = *(unsigned int *)((char *)&stru_335C4[0] + p + 2);
            b = 0;
            c0 = 5; do { b = (b << 1) | ((unsigned)a >> 15); a <<= 1; } while (--c0);

            d = *(unsigned int *)((char *)&stru_335C4[0] + p);
            e = 0;
            c0 = 5; do { e = (e << 1) | ((unsigned)d >> 15); d <<= 1; } while (--c0);

            i = *(int *)((char *)&stru_335C4[0] + p + 16);
            j = *(int *)((char *)&sams[0] + i * 0x12 + 16);
            drawWorldObject(j, d, e, a, b,
                *(int *)((char *)&stru_335C4[0] + p + 4),
                *(int *)((char *)&stru_335C4[0] + p + 8),
                *(int *)((char *)&stru_335C4[0] + p + 10),
                *(int *)((char *)&stru_335C4[0] + p + 12) + 0x2000,
                m);
        }
    }

    /* Runway/base visual */
    if (word_3BFA2 > 0) {
        projectWorldToHud(word_3BEC2, word_3BED6, word_3BFA2);
        if (word_3C016 < 0 && word_3C016 > (int)0xff00) {
            if (word_3B4DC > 0)
                m = 4;
            else
                m = 3;

            a = (unsigned int)word_3BED6;
            b = 0;
            c0 = 5; do { b = (b << 1) | ((unsigned)a >> 15); a <<= 1; } while (--c0);

            d = (unsigned int)word_3BEC2;
            e = 0;
            c0 = 5; do { e = (e << 1) | ((unsigned)d >> 15); d <<= 1; } while (--c0);

            drawWorldObject(0x0e, d, e, a, b,
                word_3BFA2, 0, 0, 0, m);
        }
    }

    /* Player's own aircraft fire */
    if (!(keyValue & 0x80)) goto done;
    if (keyValue == 0x8b) goto done;
    if (var_547 == 0 && word_3BE3C != 0) goto done;

    if ((planeFlags & 1) == 1)
        a = 6;
    else
        a = 7;

    drawWorldObject(a, (long)dword_3B7DA, 0x01000000L - dword_3B7F8,
        var_547 + 0x10, var_542, var_544, var_545, 2 - h);

    if ((unsigned int)var_547 >= 0x3e8) goto done;
    if (word_330BC != 0) goto done;

    drawWorldObject(0x15, (long)dword_3B7DA, 0x01000000L - dword_3B7F8,
        word_3BEBE, var_542, 0, 0, 2);

done:
    ;
}


// TODO: drawHudWorldOverlay (seg000:b147-c1b8) - large unimplemented function
// Once implemented, try merging egame2e.c + egame1j.c (if register spill doesn't affect codegen)
