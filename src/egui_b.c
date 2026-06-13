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

void updateTargetLock(void) {
    int p, a, b, c, d, e, f, g, h, i, j, k, l, m, n;
    int p0, a0, b0, c0, d0, e0, f0, g0, h0;
    int dk;

    f0 = 0;

    /* Fire at keyValue == 0x8b (sidewinder lock) */
    if (keyValue == 0x8b) {
        drawWorldObject(6, (long)g_ViewX, 0x01000000L - g_ViewY,
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
    if (g_currentWeaponType == 1) goto skip_aam;
    if (keyValue & 0x80) goto skip_aam;

    if (!(word_336F4 & 0x80)) {
        word_336F4 = l = -1;
    }

    c = 100 << (6 - (unsigned char)word_330BC);

    if (word_336F4 != -1) {
        g = word_336F4 - 0x80;
        g0 = computeMapTargetRange(g) - 1;
        if (g_planes[g].field_4 != 0) {
            g0 -= 0x280;
        }
        if (g < 3) {
            g0 -= 0x0a00;
        }
        if (abs(var_542 + word_3C8B2 - var_674) > 0x2000) {
            g0 = -32000;
            goto after_lock;
        }
        word_3C00A = 1;
after_lock:
        ;
    } else {
        word_3C00A = 0;
        g0 = -32000;
    }

    l = -1;
    for (g = 1; g < word_3BED2; g++) {
        computeMapTargetRange(g);
        if (abs(var_542 + word_3C8B2 - var_674) < 0x1800 &&
            g + 0x80 != word_336F4 && !(g_planes[g].flags & 0x80)) {
            if (g_planes[g].field_4 != 0) {
                var_672 -= 0x280;
            }
            if (g == word_3B146 || g == word_3B158) {
                var_672 -= 0x0a00;
            }
            if (c > var_672 && g0 < var_672) {
                l = g;
                c = var_672;
            }
        }
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
        if (((struct struc_9 *)stru_33402)[g].field_0 != 0) {
            projectWorldToHud(((struct struc_9 *)stru_33402)[g].field_0,
                ((struct struc_9 *)stru_33402)[g].field_2,
                ((struct struc_9 *)stru_33402)[g].field_4);
            if (word_3C016 < 0 && word_3C016 > -0x100) {
                drawWorldObject(
                    (unsigned char)(((unsigned char)word_33442 - (unsigned char)g) & 7) < 4 ? 3 : 0x11,
                    (long)(unsigned)((struct struc_9 *)stru_33402)[g].field_0 << 5,
                    (long)(unsigned)((struct struc_9 *)stru_33402)[g].field_2 << 5,
                    ((struct struc_9 *)stru_33402)[g].field_4, 0,
                    ((struct struc_9 *)stru_33402)[g].field_6, 0, 0);
            }
        }
    }

    /* Air-to-ground targeting */
    c = 0x4b << (6 - (unsigned char)word_330BC);

    h = (word_330C2 != 0 && (unsigned int)(word_38FEE + var_547) > 0x5dc) ? 1 : 0;
    if (word_330C2 != 0 && (unsigned int)(word_38FEE + var_547) > 0xfa0) {
        h = 2;
    }

    /* A2G radar lock range */
    if ((word_336F2 & 0x80) && word_336F2 != -1) {
        g = word_336F2 - 0x80;
        g0 = computeTargetBearing(stru_3B202[g].posX, stru_3B202[g].posY, 1);
        if (abs(var_542 + word_3C8B2 - var_674) > 0x2000) {
            g0 = 0;
        }
    } else {
        g0 = 0;
    }

    l = -1;
    for (g = 0; g < word_3C046; g++) {
        if (!(stru_3B202[g].state[8] & 2))
            goto next2;

        if (computeSimObjectRange(g) >= 0x12c0 && word_3370E == 0)
            goto next2;

        if (c > var_672 && g0 < var_672 && !(keyValue & 0x80) &&
            !(stru_3B202[g].state[8] & 0x20) &&
            *(int *)&stru_3B202[g].state[10] != 0) {
            computeTargetBearing(stru_3B202[g].posX, stru_3B202[g].posY, 1);
            if (abs(var_542 + word_3C8B2 - var_674) < 0x2000) {
                c = var_672;
                l = g;
            }
        }

        projectWorldToHud(stru_3B202[g].posX, stru_3B202[g].posY, stru_3B202[g].alt);

        if (word_3C016 >= 0)
            goto next2;

        word_3C016 >>= h;

        if (word_3C016 > -0x20) {
            if (stru_3B202[g].alt < 999 && word_330BC == 0) {
                f = 0;
                if ((g_planes[g_closestThreatIndex].flags & 0x200) &&
                    abs(stru_3B202[g].posX - g_planes[g_closestThreatIndex].mapX) < word_38FFC >> 5 &&
                    abs(stru_3B202[g].posY - g_planes[g_closestThreatIndex].mapY) < word_39200 >> 5) {
                    f = 0x80;
                }
                if (var_547 != 0x80 || f == 0x80) {
                    drawWorldObject(5, stru_3B202[g].worldX, stru_3B202[g].worldY,
                        f, *(int *)&stru_3B202[g].state[0], 0, 0,
                        -(signOf(h) - 2));
                }
            }

            /* Draw the target */
            drawWorldObject(
                *(int *)((char *)aFlogger + ((word_3C016 > -0x10) ? 0 : 1) * 2 +
                    *(int *)&stru_3B202[g].state[6] * 0x20 + 18),
                stru_3B202[g].worldX, stru_3B202[g].worldY, stru_3B202[g].alt,
                *(int *)&stru_3B202[g].state[0], *(int *)&stru_3B202[g].state[2],
                *(int *)&stru_3B202[g].state[4], 2 - h);
        } else {
            setDrawColor(0x0f);
            drawViewportLine(var_279, var_282, var_279, var_282);
        }
next2:
        ;
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
        if (stru_335C4[g].ttl != 0) {
            projectWorldToHud(stru_335C4[g].mapX, stru_335C4[g].mapY, stru_335C4[g].alt);

            if (var_279 == -1)
                goto next3;

            if (word_3C016 > -0x20) {
            drawWorldObject(sams[*(int *)&stru_335C4[g].state[0]].field_10,
                (long)stru_335C4[g].mapX << 5,
                (long)stru_335C4[g].mapY << 5,
                stru_335C4[g].alt,
                stru_335C4[g].worldX, stru_335C4[g].worldY,
                stru_335C4[g].worldZ + 0x2000,
                ((keyValue & 0x80) && keyValue != 0x8b) ? 3 : 1);
            } else {
                setDrawColor(g < 8 ? 0x0c : 0x0d);
                drawViewportLine(var_279, var_282, var_279, var_282);
            }
        }
next3:
        ;
    }

    /* Runway/base visual */
    if (word_3BFA2 > 0) {
        projectWorldToHud(word_3BEC2, word_3BED6, word_3BFA2);
        if (word_3C016 < 0 && word_3C016 > -0x100) {
            drawWorldObject(0x0e,
                (long)(unsigned)word_3BEC2 << 5,
                (long)(unsigned)word_3BED6 << 5,
                word_3BFA2, 0, 0, 0,
                word_3B4DC > 0 ? 4 : 3);
        }
    }

    /* Player's own aircraft fire */
    if (!(keyValue & 0x80)) goto done;
    if (keyValue == 0x8b) goto done;
    if (var_547 == 0 && word_3BE3C != 0) goto done;

    drawWorldObject(((g_playerPlaneFlags & 1) == 0) + 6, (long)g_ViewX,
        0x01000000L - g_ViewY, var_547 + 0x10, var_542, var_544, var_545,
        2 - h);

    if ((unsigned int)var_547 < 0x3e8 && word_330BC == 0) {
        drawWorldObject(0x15, (long)g_ViewX, 0x01000000L - g_ViewY,
            word_3BEBE, var_542, 0, 0, 2);
    }

done:
    ;
}

void drawHudWorldOverlay(void) {
    int p, q, a, r, b, s, c, t, d, u, e, v, f, w, g, x, h, y, i, z, j, k, l, m, n;

    var_675 = word_39402;
    word_39402 = 0;

    for (w = 0; w < 12; w++) {
        if (stru_335C4[w].ttl != 0) {
            projectWorldToHud(stru_335C4[w].mapX, stru_335C4[w].mapY, stru_335C4[w].alt);
            if (var_279 != -1) {
                setDrawColor(w < 8 ? 0x0e : 0x0a);
                drawTargetBox(var_279, var_282, 6, 0);
            }
        }
    }

    l = 0x200 / isqrt(g_frameRateScaling * 4 + 8);

    for (w = 0; w < word_3AFA4 + 4; w++) {
        if (*(int16 *)((char *)&word_3C5AC + w * 12) != 0) {

        projectWorldToHud(*(int16 *)((char *)&word_3C5AC + w * 12),
                  *(int16 *)((char *)&word_3C5AE + w * 12),
                  *(int16 *)((char *)&word_3C5B0 + w * 12));
        k = var_279;
        n = var_282;
        a = word_3C016;

        projectWorldToHud((*(int16 *)((char *)&word_3C5B2 + w * 12) >> 1) + *(int16 *)((char *)&word_3C5AC + w * 12),
                  (*(int16 *)((char *)&word_3C5B4 + w * 12) >> 1) + *(int16 *)((char *)&word_3C5AE + w * 12),
                  (*(int16 *)((char *)&word_3C5B6 + w * 12) >> 1) + *(int16 *)((char *)&word_3C5B0 + w * 12));

        if (var_279 != -1) {
        if (k != -1) {

        z = (frameTick >> 1) - w & 7;

        setDrawColor(w < word_3AFA4 ? 0x0d : 0x0c);
        drawViewportLine(var_279, var_282, k, n);

        s = 0;

        if (w < word_3AFA4) {
            for (h = 0; h < word_3C046; h++) {
                if ((stru_3B202[h].state[8] & 0x22) == 2) {

                z = (abs(*(int16 *)((char *)&word_3C5B0 + w * 12) -
                         stru_3B202[h].alt) >> 5)
                  + abs(*(int16 *)((char *)&word_3C5AC + w * 12) -
                        stru_3B202[h].posX)
                  + abs(*(int16 *)((char *)&word_3C5AE + w * 12) -
                        stru_3B202[h].posY);
                z = abs(z);

                if (z < l / (g_missionStatus + 1)) {

                s = 1;
                stru_3B202[h].state[8] |= 0x10;
                word_39606 = 1;

                if (z * 2 < l / (g_missionStatus + 1)) {
                    destroyAircraft(h);
                    strcat((char *)strBuf, (char *)aDestroyedByGun);
                    tempStrcpy((char *)strBuf);
                    word_39606 = 8;
                    *(int16 *)((char *)&word_3C5AC + w * 12) = 0;
                }
                }
                }
            }
        } else {
            z = (abs(*(int16 *)((char *)&word_3C5B0 + w * 12) - var_547) >> 5)
              + abs(*(int16 *)((char *)&word_3C5AC + w * 12) - g_viewX_)
              + abs(*(int16 *)((char *)&word_3C5AE + w * 12) - g_viewY_);
            z = abs(z);
            if (z < 0x20) {
                s = 1;
                tempStrcpy((char *)aHitByGunfire);
                if (0x20 / (4 - g_missionStatus) > z) {
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
            if (word_39606 <= 0) {
                word_3BEBC = *(int16 *)((char *)&word_3C5AC + w * 12);
                word_3BEC8 = *(int16 *)((char *)&word_3C5AE + w * 12);
                word_3BECE = *(int16 *)((char *)&word_3C5B0 + w * 12);
                word_39606 = -1;
            }
            *(int16 *)((char *)&word_3C5AC + w * 12) = 0;

            b = findWaypointEntry(word_3BEBC, word_3BEC8);
            if (b != -1 && !(g_planes[b].flags & 0x80)) {
                i = (int)(*(long *)&word_39808[2] >> 5);
                y = 0x8000 - (int)(*(long *)&word_39808[4] >> 5);

                if (rangeApprox(word_3BEBC - i, word_3BEC8 - y) < 0x18 / (g_missionStatus + 2) &&
                    (g_planes[b].field_C & 0x7f) != *(uint8 *)byte_3C02A) {
                    sub_187EA(b);
                    strcat((char *)strBuf, (char *)aDestroyedByG_0);
                    tempStrcpy((char *)strBuf);
                    word_39606 = 8;
                    word_3BECE = 0;
                }
            }
        }
        }
        }
        }
    }

    if (word_39606 != 0) {
        projectWorldToHud(word_3BEBC, word_3BEC8, word_3BECE);
        if (var_279 != -1) {
            x = abs(0x100 / word_3C016);
            for (w = 0; w < 8; w++) {
                setDrawColor(randomRange(4) + 0x0c);
                if (word_3BECE > 0) {
                    drawViewportLine(var_279, var_282,
                              randomRange(x << 1) - x + var_279,
                              randomRange(x << 1) - x + var_282);
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
    } else {
        word_39604 = 0;
    }

    if (word_330C2 == 0) return;

    if (var_593 != 0) {
        var_593 = 0;
    }

    copySomeMem(word_330BC != 0 ? 2 : word_330BC);
    setDrawColor(0x0f);
    drawFullscreenLine(0x13f, 199, 0x13f, 199);
    var_671 = 0;

    if (g_currentWeaponType == 2) {
    if (keyValue == 0) {
    if ((int)word_336F4 >= 0) {

    projectWorldToHud(g_planes[word_336F4].mapX, g_planes[word_336F4].mapY, 0);

    v = missiles[missleSpec[missileSpecIndex].weaponIdx].field_16;

    if (v == 0x1c && computeMapTargetRange(word_336F4) < (uvar_547 >> 5) * 5 && word_3C016 < 0) {
        var_671 = 1;
    }

    if (var_279 != -1) {

    setDrawColor(word_330BC != 0 ? 8 : 0);
    q = 0;

    m = routine_260(missleSpec[missileSpecIndex].weaponIdx, word_336F4) != 0 ? 4 : 0;

    if (m != 0 && (v != 4 || g_planes[word_336F4].field_4 != 0)) {
        if (missleSpec[missileSpecIndex].ammo != 0) {
            setDrawColor(0x0f);
            if ((rangeApprox(var_279 - 0xa0, var_282 - 0x38) < 0x30 || var_671 != 0) &&
                -word_3C016 / 7 < sams[v].field_8 &&
                sams[v].field_C != 7) {
                if (sams[v].field_C != 0x1c || var_671 != 0) {
                    var_671 = 1;
                    q = 1;
                    if (sams[v].field_8 > (-word_3C016 >> 1 >> 1)) {
                        setDrawColor(*(char *)&gfxModeUnset != 0 ? 0 : 0x0c);
                    }
                }
            } else {
                var_671 = 0;
            }
        }
    } else {
        if (v != -1) {
            setDrawColor(word_330BC != 0 ? 8 : 0);
        }
        var_671 = 0;
    }

    drawTargetBox(var_279, var_282, m != 0 ? m + 5 : 9, q);

    }
    }
    }
    }

    if (word_336F8 > 0 && word_3BE96 >= 0) {
        projectWorldToHud(g_planes[word_3BE96].mapX, g_planes[word_3BE96].mapY, 0);
        drawTargetLabel((char *)word_3C0A2[(&word_3AA5C)[word_3BE96 * 8]], word_38F72, g_frameRateScaling - word_336F8);
    }

    var_730 &= 0xfd;
    var_564[1] = 4;
    var_565[1] = 4;

    if (word_3C09E == 0x13) {
    if (g_currentWeaponType == 2 || g_currentWeaponType == 0) {
    if (word_336F4 != -1) {

    j = word_336F4 & 0x7f;

    drawTargetView(getTargetSymbol(j), g_planes[j].mapX, g_planes[j].mapY,
              0, 0, 0, 0, 1, -1);
    drawMissileLock();
    buildRangeString(computeMapTargetRange(j));
    draw2Strings((char *)strBuf, 0xf4, 0xaa, 0x0f);

    strcpy((char *)strBuf, (char *)word_3C0A2[g_planes[j].field_C & 0x7f]);
    draw2Strings((char *)strBuf, -((int)strlen((char *)strBuf) * 2 - 0x10c), 0x82, 0x0f);

    if ((int)strlen((char *)word_3C0A2[(&word_3AA5C)[j * 8]]) != 0) {
        strcpy((char *)strBuf,
               (char *)(strlen((char *)word_3C0A2[g_planes[j].field_C & 0x7f]) != 0 ? aAt_0 : aAt_0 + 5));
        strcat((char *)strBuf, (char *)word_3C0A2[(&word_3AA5C)[j * 8]]);
        draw2Strings((char *)strBuf, -((int)strlen((char *)strBuf) * 2 - 0x10c), 0x88, 0x0f);
    }

    if (g_currentWeaponType == 0) {
        projectWorldToHud(g_planes[word_336F4].mapX, g_planes[word_336F4].mapY, 0);
        setDrawColor(0x0f);
        drawTargetBox(var_279, var_282, 8, 0);
    } else if (word_3B146 == word_336F4) {
        draw2Strings((char *)aPrimaryTarget, 0xec, 0x8e, 0x0f);
    } else if (word_3B158 == word_336F4) {
        draw2Strings((char *)aSecondaryTarget, 0xec, 0x8e, 0x0f);
    } else if (!(frameTick & 1) &&
               ((word_330BA < 2 && (byte_3BFA4[g_planes[j].field_C & 0x7f] & 0xc0) != 0) ||
                (g_planes[j].flags & 0x500) != 0 ||
                (byte_3AFAC[((unsigned)g_planes[j].mapX >> 11) +
                            ((unsigned)g_planes[j].mapY >> 11) * 16] & 1) != 0)) {
        draw2Strings((char *)aNoTarget, 0xfc, 0x8e, 0x0f);
    }

    if (abs((var_542 + word_3C8B2) - var_674) > 0x2000) {
        word_336F4 = -1;
    }

    }
    }
    }

    var_677 = readAxisInput(1);

    if (g_currentWeaponType == 1) {
    if (keyValue == 0) {
    if (!(word_336F2 & 0x80)) {

    projectWorldToHud(stru_3B202[word_336F2].posX,
              stru_3B202[word_336F2].posY,
              stru_3B202[word_336F2].alt);

    if (var_279 != -1) {

    setDrawColor(word_330BC != 0 ? 8 : 0);
    q = 0;

    v = missiles[missleSpec[missileSpecIndex].weaponIdx].field_16;

    if (missleSpec[missileSpecIndex].ammo != 0 && sams[v].field_C == 7) {
        setDrawColor(0x0f);
        if (rangeApprox(var_279 - 0xa0, var_282 - 0x38) < 0x30) {
            if (-word_3C016 >> 3 < sams[v].field_8) {
                var_671 = 1;
                q = 1;
                if (-word_3C016 >> 1 >> 1 < sams[v].field_8) {
                    setDrawColor(*(char *)&gfxModeUnset != 0 ? 0 : 0x0c);
                }
            }
        }
    }
    drawTargetBox(var_279, var_282, 9, q);

    }
    }
    }
    }

    if (word_3C09E == 0x13 && g_currentWeaponType == 1 && word_336F2 != -1) {
        j = word_336F2 & 0x7f;

        drawTargetView(*(int16 *)((char *)aFlogger + *(int16 *)&stru_3B202[j].state[6] * 32 + 18),
                  stru_3B202[j].posX,
                  stru_3B202[j].posY,
                  stru_3B202[j].alt,
                  *(int16 *)&stru_3B202[j].state[0],
                  *(int16 *)&stru_3B202[j].state[2],
                  *(int16 *)&stru_3B202[j].state[4],
                  1, 1);
        drawMissileLock();
        buildRangeString(rangeApprox(g_viewX_ - stru_3B202[j].posX,
                  g_viewY_ - stru_3B202[j].posY));
        draw2Strings((char *)strBuf, 0xf4, 0xaa, 0x0f);

        w = *(int16 *)&stru_3B202[j].state[6];
        strcpy((char *)strBuf, (char *)(w * 32 + 0x2c8));
        strcat((char *)strBuf, (char *)(w * 32 + 0x2cf));
        draw2Strings((char *)strBuf, 0xf8, 0x86, 0x0f);

        if (*(int16 *)((char *)aFlogger + w * 32 + 16) == -1 && !(frameTick & 1)) {
            draw2Strings((char *)aNoTarget_0, 0xfc, 0x8c, 0x0f);
        }

        if (word_38FDC != 0 && (frameTick & 1)) {
            var_676 = (int)(((unsigned long)(unsigned)(0x8000 - *(int16 *)&stru_3B202[j].state[2]) *
                     (long)*(int16 *)&stru_3B202[j].state[10]) >> 15);
            var_676 -= abs(sinMul(*(int16 *)&stru_3B202[j].state[4], var_676)) >> 1;
        }
    }

    var_564[1] = 2;
    var_565[1] = 2;

    if (word_336F8 > 0 && word_3BE96 < 0) {
        w = -1 - word_3BE96;
        projectWorldToHud(stru_3B202[w].posX,
                  stru_3B202[w].posY,
                  stru_3B202[w].alt);
        drawTargetLabel((char *)(*(int16 *)&stru_3B202[w].state[6] * 32 + 0x2c8),
                  word_38F72, g_frameRateScaling - word_336F8);
    }

    if (g_currentWeaponType == 2 && keyValue == 0) {
        d = missiles[missleSpec[missileSpecIndex].weaponIdx].field_16;

        if (d == 0x1e && abs(var_545) < 0x2000) {
            c = sub_1C82D();
            u = cosMul(c, var_548) / (sinMul(-c, 0x20) + 1);
            i = sinMul(var_542, u) + g_viewX_;
            y = g_viewY_ - cosMul(var_542, u);
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
            projectWorldToHud(g_planes[word_336F4].mapX + sinMul(var_542, 0x80),
                      g_planes[word_336F4].mapY - cosMul(var_542, 0x80),
                      var_547);

            if (var_279 != -1) {
                if (d == 0x1e) {
                    word_3C016 = clampRange(
                        rangeApprox(i - g_planes[word_336F4].mapX,
                                  y - g_planes[word_336F4].mapY) >> 3,
                        0x0000, 0x0040);
                } else {
                    word_3C016 = clampRange(computeMapTargetRange(word_336F4) >> 3, 0x0000, 0x0040);
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

/* ---- merged from egwaypt.c ---- */
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

    p = g_viewX_ - worldX;
    c = worldY - g_viewY_;
    f = (worldZ - var_547) >> 5;

    if (keyValue & 0x80) {
        p -= (int)((g_ViewX - dword_3B1FE) >> 5);
        c -= (int)((g_ViewY - dword_3B4D4) >> 5);
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
            if (g_planes[p].mapX == mapX && g_planes[p].mapY == mapY) {
                return p;
            }
        }
        g_planes[0].mapX = mapX;
        g_planes[0].mapY = mapY;
        g_planes[0].field_C = *word_39808 + 0x100;
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
     return computeTargetBearing(g_planes[targetIdx].mapX, g_planes[targetIdx].mapY, 1);
}

// ==== seg000:0xc7c6 ====
int computeSimObjectRange(int objIdx) {
    return computeTargetBearing(stru_3B202[objIdx].posX, stru_3B202[objIdx].posY, 0);
}

// ==== seg000:0xc7ea ====
int computeTargetBearing(int targetX, int targetY, int wantBearing) {
    int p;
    int a;
    p = g_viewX_ - targetX;
    a = g_viewY_ - targetY;
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
    if (g_planes[wpIdx].flags & 0x80) {
        return (isTargetOverWater(wpIdx) ? (int)(char)byte_3BEC4[0] : (int)(char)byte_3C02A[0]) + 0x100;
    }
    return g_planes[wpIdx].field_C;
}

// ==== seg000:0xc8a4 ====
int isTargetOverWater(int wpIdx) {
    int p;

    p = ((char *)byte_3BFA4)[g_planes[wpIdx].field_C & 0x7f] & 0x0f;
    return (p == 0x0c || p == 9 || p == 0x0b) ? 1 : 0;
}
