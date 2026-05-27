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

void drawHudWorldOverlay(void) {
    int p, a, q, b, r, c, s, d, t, e, u, f, v, g, w, h, x, i, y, j, z, k, l, m, n, o;

    var_675 = word_39402;
    word_39402 = 0;

    for (w = 0; w < 12; w++) {
        if (stru_335C4[w].ttl != 0) {
            projectWorldToHud(stru_335C4[w].alt, stru_335C4[w].mapY, stru_335C4[w].mapX);
            if (var_279 != -1) {
                setDrawColor(w < 8 ? 0x0e : 0x0a);
                drawTargetBox(var_279, var_282, 6, 0);
            }
        }
    }

    l = 0x200 / isqrt(word_330C4 * 4 + 8);

    for (w = 0; w < word_3AFA4 + 4; w++) {
        if (*(int16 *)((char *)&word_3C5AC + w * 12) == 0) continue;

        projectWorldToHud(*(int16 *)((char *)&word_3C5AC + w * 12),
                  *(int16 *)((char *)&word_3C5AE + w * 12),
                  *(int16 *)((char *)&word_3C5B0 + w * 12));
        k = var_279;
        n = var_282;
        a = word_3C016;

        projectWorldToHud(*(int16 *)((char *)&word_3C5B2 + w * 12) / 2 + *(int16 *)((char *)&word_3C5AC + w * 12),
                  *(int16 *)((char *)&word_3C5B4 + w * 12) / 2 + *(int16 *)((char *)&word_3C5AE + w * 12),
                  *(int16 *)((char *)&word_3C5B6 + w * 12) / 2 + *(int16 *)((char *)&word_3C5B0 + w * 12));

        if (var_279 == -1) continue;
        if (k == -1) continue;

        z = (frameTick >> 1) - w & 7;

        setDrawColor(w < word_3AFA4 ? 0x0d : 0x0c);
        drawViewportLine(var_279, var_282, k, n);

        s = 0;

        if (w < word_3AFA4) {
            for (h = 0; h < word_3C046; h++) {
                if ((*(uint8 *)((char *)&stru_3B208[h] + (0x0a + 8)) & 0x22) != 2) continue;

                x = abs(*(int16 *)((char *)&word_3C5AE + w * 12) -
                        *(int16 *)((char *)&stru_3B208[h] - 2));
                o = abs(*(int16 *)((char *)&word_3C5AC + w * 12) -
                        *(int16 *)((char *)&stru_3B208[h] - 4));
                z = abs(*(int16 *)((char *)&word_3C5B0 + w * 12) -
                        stru_3B208[h].objType);
                z = abs((z >> 5) + o + x);

                x = l / (word_330B8 + 1);
                if (z >= x) continue;

                s = 1;
                *(uint8 *)((char *)&stru_3B208[h] + (0x0a + 8)) |= 0x10;
                word_39606 = 1;

                if (z * 2 < x) {
                    destroyAircraft(h);
                    strcat((char *)strBuf, (char *)aDestroyedByGun);
                    tempStrcpy((char *)strBuf);
                    word_39606 = 8;
                    *(int16 *)((char *)&word_3C5AC + w * 12) = 0;
                }
            }
        } else {
            x = abs(*(int16 *)((char *)&word_3C5AE + w * 12) - word_3BED0);
            o = abs(*(int16 *)((char *)&word_3C5AC + w * 12) - word_3BEC0);
            z = abs(*(int16 *)((char *)&word_3C5B0 + w * 12) - var_547);
            z = abs((z >> 5) + o + x);
            if (z < 0x20) {
                s = 1;
                tempStrcpy((char *)aHitByGunfire);
                if (z < 0x20 / (4 - word_330B8)) {
                    bombTarget();
                }
            }
        }

        if (s) {
            word_3BEBC = *(int16 *)((char *)&word_3C5AC + w * 12);
            word_3BEC8 = *(int16 *)((char *)&word_3C5AE + w * 12);
            word_3BECE = *(int16 *)((char *)&word_3C5B0 + w * 12);
            word_39606 = -1;
        }

        if (*(int16 *)((char *)&word_3C5B0 + w * 12) < 0) {
            if (word_39606 < 1) {
                word_3BEBC = *(int16 *)((char *)&word_3C5AC + w * 12);
                word_3BEC8 = *(int16 *)((char *)&word_3C5AE + w * 12);
                word_3BECE = *(int16 *)((char *)&word_3C5B0 + w * 12);
                word_39606 = -1;
            }
            *(int16 *)((char *)&word_3C5AC + w * 12) = 0;

            b = findWaypointEntry(word_3BEBC, word_3BEC8);
            if (b != -1 && !(*(uint8 *)((char *)&stru_3AA5E[b].flags + 1) & 0x80)) {
                i = (int)(*(long *)&word_39808[2] >> 5);
                y = -(int)(*(long *)&word_39808[4] >> 5) + 0x8000;

                x = rangeApprox(word_3BEBC - i, word_3BEC8 - y);
                if ((int)x < 0x18 / (word_330B8 + 2) &&
                    (*(uint8 *)&stru_3AA5E[b].field_C & 0x7f) != *(uint8 *)byte_3C02A) {
                    sub_187EA(b);
                    strcat((char *)strBuf, (char *)aDestroyedByG_0);
                    tempStrcpy((char *)strBuf);
                    word_39606 = 8;
                    word_3BECE = 0;
                }
            }
        }
    }

    if (word_39606 == 0) {
        word_39604 = 0;
    } else {
        projectWorldToHud(word_3BEBC, word_3BEC8, word_3BECE);
        if (var_279 != -1) {
            x = abs(0x100 / word_3C016);
            for (w = 0; w < 8; w++) {
                setDrawColor(randomRange(4) + 0x0c);
                if (word_3BECE > 0) {
                    z = randomRange(x << 1) - x + var_282;
                    drawViewportLine(var_279, var_282, randomRange(x << 1) - x + var_279, z);
                } else {
                    c = randomRange(0x6000) - 0x3000;
                    if (word_330C2 != 0) {
                        c -= var_545;
                    }
                    a = randomRange(x);
                    k = sinMul(c, a) + var_279;
                    n = var_282 - cosMul(c, a);
                    drawViewportLine(var_279, var_282, k, n);
                }
            }
        }
        word_39606 -= signOf(word_39606);
    }

    if (word_330C2 == 0) return;

    if (var_593 != 0) {
        var_593 = 0;
    }

    copySomeMem(word_330BC != 0 ? 2 : 0);
    setDrawColor(0x0f);
    drawFullscreenLine(0x13f, 199, 0x13f, 199);
    var_671 = 0;

    if (word_3C45C != 2 || keyValue != 0 || (int)word_336F4 < 0) goto after_air_target;

    projectWorldToHud(stru_3AA5E[word_336F4].mapX, stru_3AA5E[word_336F4].mapY, 0);

    v = missleSpec[missileSpecIndex].weaponIdx * 0x1a;
    v = *(int16 *)(v + (int)&sams[0].field_C);

    if (v == 0x1c && computeMapTargetRange(word_336F4) < (unsigned)(var_547 >> 5) * 5 && word_3C016 < 0) {
        var_671 = 1;
    }

    if (var_279 == -1) goto after_air_target;

    setDrawColor(word_330BC != 0 ? 8 : 0);
    q = 0;

    m = routine_260(missleSpec[missileSpecIndex].weaponIdx, word_336F4);
    m = m != 0 ? 4 : 0;

    if (m == 0 || (v == 4 && stru_3AA5E[word_336F4].field_4 == 0)) {
        if (v != -1) {
            setDrawColor(word_330BC != 0 ? 8 : 0);
        }
        var_671 = 0;
    } else if (missleSpec[missileSpecIndex].ammo != 0) {
        setDrawColor(0x0f);
        x = rangeApprox(var_279 - 0xa0, var_282 - 0x38);
        if (((int)x < 0x30 || var_671 != 0) &&
            -word_3C016 / 7 < sams[v].field_8 &&
            sams[v].field_C != 7) {
            if (sams[v].field_C != 0x1c || var_671 != 0) {
                var_671 = 1;
                q = 1;
                if (-word_3C016 >> 2 < sams[v].field_8) {
                    setDrawColor(gfxModeUnset != 0 ? 0 : 0x0c);
                }
            }
        } else {
            var_671 = 0;
        }
    }

    drawTargetBox(var_279, var_282, m != 0 ? m + 5 : 9, q);

after_air_target:

    if (word_336F8 > 0 && word_3BE96 >= 0) {
        projectWorldToHud(stru_3AA5E[word_3BE96].mapX, stru_3AA5E[word_3BE96].mapY, 0);
        drawTargetLabel((char *)word_3C0A2[(&word_3AA5C)[word_3BE96 * 8]], word_38F72, word_330C4 - word_336F8);
    }

    var_730 &= 0xfd;
    var_564[1] = 4;
    var_565[1] = 4;

    if (word_3C09E != 0x13 || (word_3C45C != 2 && word_3C45C != 0) || word_336F4 == -1)
        goto after_map_air;

    j = word_336F4 & 0x7f;

    drawTargetView(getTargetSymbol(j), stru_3AA5E[j].mapX, stru_3AA5E[j].mapY,
              0, 0, 0, 0, 1, -1);
    drawMissileLock();
    buildRangeString(computeMapTargetRange(j));
    draw2Strings((char *)strBuf, 0xf4, 0xaa, 0x0f);

    strcpy((char *)strBuf, (char *)word_3C0A2[stru_3AA5E[j].field_C & 0x7f]);
    draw2Strings((char *)strBuf, -((int)strlen((char *)strBuf) * 2 - 0x10c), 0x82, 0x0f);

    if ((int)strlen((char *)word_3C0A2[(&word_3AA5C)[j * 8]]) != 0) {
        if ((int)strlen((char *)word_3C0A2[stru_3AA5E[j].field_C & 0x7f]) == 0) {
            strcpy((char *)strBuf, (char *)(aAt_0 + 5));
        } else {
            strcpy((char *)strBuf, (char *)aAt_0);
        }
        strcat((char *)strBuf, (char *)word_3C0A2[(&word_3AA5C)[j * 8]]);
        draw2Strings((char *)strBuf, -((int)strlen((char *)strBuf) * 2 - 0x10c), 0x88, 0x0f);
    }

    if (word_3C45C == 0) {
        projectWorldToHud(stru_3AA5E[word_336F4].mapX, stru_3AA5E[word_336F4].mapY, 0);
        setDrawColor(0x0f);
        drawTargetBox(var_279, var_282, 8, 0);
    } else if (word_3B146 == word_336F4) {
        draw2Strings((char *)aPrimaryTarget, 0xec, 0x8e, 0x0f);
    } else if (word_3B158 == word_336F4) {
        draw2Strings((char *)aSecondaryTarget, 0xec, 0x8e, 0x0f);
    } else if (!(frameTick & 1) &&
               ((word_330BA < 2 && (byte_3BFA4[stru_3AA5E[j].field_C & 0x7f] & 0xc0) != 0) ||
                (stru_3AA5E[j].flags & 0x500) != 0 ||
                (byte_3AFAC[((unsigned)stru_3AA5E[j].mapX >> 11) +
                            ((unsigned)stru_3AA5E[j].mapY >> 11) * 16] & 1) != 0)) {
        draw2Strings((char *)aNoTarget, 0xfc, 0x8e, 0x0f);
    }

    if (abs((var_542 + word_3C8B2) - var_674) > 0x2000) {
        word_336F4 = -1;
    }

after_map_air:

    var_677 = readAxisInput(1);

    if (word_3C45C != 1 || keyValue != 0 || (word_336F2 & 0x80)) goto after_ground_target;

    projectWorldToHud(*(int16 *)((char *)&stru_3B208[word_336F2] - 4),
              *(int16 *)((char *)&stru_3B208[word_336F2] - 2),
              stru_3B208[word_336F2].objType);

    if (var_279 == -1) goto after_ground_target;

    setDrawColor(word_330BC != 0 ? 8 : 0);
    q = 0;

    v = missleSpec[missileSpecIndex].weaponIdx * 0x1a;
    v = *(int16 *)(v + (int)&sams[0].field_C);

    if (missleSpec[missileSpecIndex].ammo != 0 && sams[v].field_C == 7) {
        setDrawColor(0x0f);
        x = rangeApprox(var_279 - 0xa0, var_282 - 0x38);
        if ((int)x < 0x30) {
            z = sams[v].field_8;
            if (-word_3C016 >> 3 < z) {
                var_671 = 1;
                q = 1;
                if (-word_3C016 >> 2 < z) {
                    setDrawColor(gfxModeUnset != 0 ? 0 : 0x0c);
                }
            }
        }
    }
    drawTargetBox(var_279, var_282, 9, q);

after_ground_target:

    if (word_3C09E == 0x13 && word_3C45C == 1 && word_336F2 != -1) {
        j = word_336F2 & 0x7f;

        drawTargetView(*(int16 *)(*(int16 *)((char *)&stru_3B208[j] + (0x0a + 6)) * 32 + (int)aFlogger + 18),
                  *(int16 *)((char *)&stru_3B208[j] - 4),
                  *(int16 *)((char *)&stru_3B208[j] - 2),
                  stru_3B208[j].objType,
                  *(int16 *)((char *)&stru_3B208[j] + (0x0a + 0)),
                  *(int16 *)((char *)&stru_3B208[j] + (0x0a + 2)),
                  *(int16 *)((char *)&stru_3B208[j] + (0x0a + 4)),
                  1, 1);
        drawMissileLock();
        buildRangeString(rangeApprox(word_3BEC0 - *(int16 *)((char *)&stru_3B208[j] - 4),
                  word_3BED0 - *(int16 *)((char *)&stru_3B208[j] - 2)));
        draw2Strings((char *)strBuf, 0xf4, 0xaa, 0x0f);

        w = *(int16 *)((char *)&stru_3B208[j] + (0x0a + 6));
        strcpy((char *)strBuf, (char *)(w * 32 + 0x2c8));
        strcat((char *)strBuf, (char *)(w * 32 + 0x2cf));
        draw2Strings((char *)strBuf, 0xf8, 0x86, 0x0f);

        if (*(int16 *)(w * 32 + (int)aFlogger + 16) == -1 && !(frameTick & 1)) {
            draw2Strings((char *)aNoTarget_0, 0xfc, 0x8c, 0x0f);
        }

        if (word_38FDC != 0 && (frameTick & 1)) {
            var_676 = (int)((unsigned long)(unsigned)(0x8000 - *(int16 *)((char *)&stru_3B208[j] + (0x0a + 2))) *
                     (long)*(int16 *)((char *)&stru_3B208[j] + (0x0a + 10))) >> 15;
            z = abs(sinMul(*(int16 *)((char *)&stru_3B208[j] + (0x0a + 4)), var_676));
            var_676 -= z >> 1;
        }
    }

    var_564[1] = 2;
    var_565[1] = 2;

    if (word_336F8 > 0 && word_3BE96 < 0) {
        w = -1 - word_3BE96;
        projectWorldToHud(*(int16 *)((char *)&stru_3B208[w] - 4),
                  *(int16 *)((char *)&stru_3B208[w] - 2),
                  stru_3B208[w].objType);
        drawTargetLabel((char *)(*(int16 *)((char *)&stru_3B208[w] + (0x0a + 6)) * 32 + 0x2c8),
                  word_38F72, word_330C4 - word_336F8);
    }

    if (word_3C45C == 2 && keyValue == 0) {
        d = missleSpec[missileSpecIndex].weaponIdx * 0x1a;
        d = *(int16 *)(d + (int)&sams[0].field_C);

        if (d == 0x1e && abs(var_545) < 0x2000) {
            c = sub_1C82D();
            z = sinMul(-c, 0x20);
            z = cosMul(c, var_548) / (z + 1);
            u = z;
            i = sinMul(var_542, u) + word_3BEC0;
            y = word_3BED0 - cosMul(var_542, u);
            projectWorldToHud(i, y, 0);
            if (var_279 == -1) {
                var_279 = (sinMul(var_545, 0x60 - word_3C008) << 2) / 3 + 0xa0;
                var_282 = 0x60;
            } else {
                setDrawColor(0x0c);
                drawTargetBox(var_279, var_282, 5, 1);
            }
            setDrawColor(0x0f);
            drawHudViewLine(0xa0, word_3C008, var_279, var_282);
        }

        if ((d == 0x1e || d == 0x1d) && (int)word_336F4 >= 0) {
            x = cosMul(var_542, 0x80);
            k = sinMul(var_542, 0x80);
            projectWorldToHud(stru_3AA5E[word_336F4].mapX + k,
                      stru_3AA5E[word_336F4].mapY - x,
                      var_547);

            if (var_279 != -1) {
                if (d == 0x1e) {
                    word_3C016 = clampRange(
                        rangeApprox(i - stru_3AA5E[word_336F4].mapX,
                                  y - stru_3AA5E[word_336F4].mapY) >> 3,
                        0x0040, 0x0000);
                } else {
                    word_3C016 = clampRange(computeMapTargetRange(word_336F4) >> 3, 0x0040, 0x0000);
                }
                setDrawColor(0x0c);
                drawViewportLine(0x9f - word_3C016, 0x21, 0x9f - word_3C016, 0x1e);
                drawViewportLine(word_3C016 + 0xa0, 0x21, word_3C016 + 0xa0, 0x1e);
                drawViewportLine(0x9f - word_3C016, 0x1e, word_3C016 + 0xa0, 0x1e);
                setDrawColor(0x0f);
                drawHudViewLine(var_279 - 4, var_282, var_279, var_282 - 4);
                drawHudViewLine(var_279, var_282 - 4, var_279 + 4, var_282);
                drawHudViewLine(var_279 + 4, var_282, var_279, var_282 + 4);
                drawHudViewLine(var_279, var_282 + 4, var_279 - 4, var_282);
            }
        }
    }

    if (word_39606 != 0 && word_3C09E == 0x13 && word_39604 != 0 && word_39402 != 0) {
        blitSprite(0xfc, 0x8c, (abs(word_39606) - 8) * -0x20, 0x3f, 0x20, 0x20, 0);
    }

    if (word_3C09E == 0x13 && var_675 != 0 && word_39402 == 0) {
        fillPanelBox(3, 3);
    }
}
