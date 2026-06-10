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
        if (stru_3AA5E[g].field_4 != 0) {
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
            g + 0x80 != word_336F4 && !(stru_3AA5E[g].flags & 0x80)) {
            if (stru_3AA5E[g].field_4 != 0) {
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
                if ((stru_3AA5E[word_3C16A].flags & 0x200) &&
                    abs(stru_3B202[g].posX - stru_3AA5E[word_3C16A].mapX) < word_38FFC >> 5 &&
                    abs(stru_3B202[g].posY - stru_3AA5E[word_3C16A].mapY) < word_39200 >> 5) {
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

    drawWorldObject(((planeFlags & 1) == 0) + 6, (long)dword_3B7DA,
        0x01000000L - dword_3B7F8, var_547 + 0x10, var_542, var_544, var_545,
        2 - h);

    if ((unsigned int)var_547 < 0x3e8 && word_330BC == 0) {
        drawWorldObject(0x15, (long)dword_3B7DA, 0x01000000L - dword_3B7F8,
            word_3BEBE, var_542, 0, 0, 2);
    }

done:
    ;
}


// TODO: drawHudWorldOverlay (seg000:b147-c1b8) - large unimplemented function
// Once implemented, try merging egame2e.c + egame1j.c (if register spill doesn't affect codegen)
