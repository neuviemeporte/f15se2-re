// seg000 optimized code (/Ot)
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include "comm.h"

#include <dos.h>
#include <memory.h>
#include <conio.h>
#include <bios.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


// ==== seg000:0x2fda ====

struct TileObject* findNearestTileObject(uint32 worldX, uint32 worldY) {
    int p, q, a, r, b, c, d, e, f, g, h, i, j, k, l, m, n, o;

    word_3B7E2 = 0x7fff;
    for (c = 1; c <= 2; c++) {
        for (e = 0; e < 9; e++) {
            *(long *)&m = scaleCoordToLod(c, worldX);
            i = *(unsigned long *)&m >> 0xc;
            r = m & 0xfff;
            *(long *)&m = scaleCoordToLod(c, worldY);
            k = *(unsigned long *)&m >> 0xc;
            d = m & 0xfff;
            a = word_33B74[e];
            b = word_33B86[e];
            o = word_33B9C[a] - r + 0x800;
            p = word_33B9C[b] - d + 0x800;
            n = process3dg(c, i += a, k += b);
            if (n != -1) {
                word_3C5A8 = matrix3dt_2[c][n];
                for (f = 0; matrix3dt[c][n] > (unsigned int)f; f++) {
                    if (byte_3BFA4[word_3C5A8->shape & 0x7f] != 0) {
                        h = o + word_3C5A8->x;
                        j = word_3C5A8->y + p;
                        q = abs(h) + abs(j);
                        if (c == 1) {
                            q >>= 2;
                        } else {
                            h <<= 2;
                            j <<= 2;
                        }
                        g = word_3C5A8->shape;
                        if ((word_3C5A8->shape & 0x80) != 0 &&
                            lookupTileEntry(c, f, i, k) != 0) {
                            g = byte_3B4E6[var_660].shape;
                        }
                        if (q < word_3B7E2) {
                            var_200 = (char far *)(byte_228D0 + buf3d3[g]);
                            if (*(int far *)var_200 != 0 ||
                                *((char far *)var_200 + 2) != 0 ||
                                word_33704 != 0) {
                                byte_3B7EE = (uint8)c;
                                byte_3B7EF = (uint8)f;
                                byte_3B7F0 = (uint8)i;
                                byte_3B7F1[0] = (uint8)k;
                                word_3B7EC = word_3C5A8;
                                word_3B7E0 = g;
                                word_3B7E2 = q;
                                *(long *)&word_3B7E4 = worldX + (long)h;
                                *(long *)&word_3B7E8 = worldY + (long)j;
                            }
                        }
                    }
                    word_3C5A8++;
                }
            }
        }
    }
    if (word_3B7E2 != 0x7fff) {
        return (struct TileObject *)&word_3B7E0;
    }
    return 0;
}

void addTileEntry(char *a, int b, char c) {
    *(int *)(a + 0x12) = b;
    *(a + 0x14) = c;
    memcpy((char *)&byte_3B4E6[word_38FF8++], a + 0x0e, 8);
    *(*(char **)(a + 0x0c) + 6) |= 0x80;
}

// ==== seg000:0x3266 ====
int lookupTileEntry(int lod, int subIndex, int tileX, int tileY) {
    for (var_660 = word_38FF8 - 1; var_660 >= 0; var_660--) {
        if (byte_3B4E6[var_660].lod == lod &&
            byte_3B4E6[var_660].subIndex == subIndex &&
            byte_3B4E6[var_660].tileX == tileX &&
            byte_3B4E6[var_660].tileY == tileY) {
            return byte_3B4E6[var_660].value;
        }
    }
    return 0;
}

void drawNearestTileObject(uint32 coord1, uint32 coord2, uint32 coord3)
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
    uint32 k;
    int l;
    int m;

    *(char *)&var_315 = 0;
    word_3B7E2 = 0x7fff;
    b = 4;
    k = scaleCoordToLod(b, coord1);
    g = (int)(k >> 12);
    a = (int)k & 0xfff;
    k = scaleCoordToLod(b, coord2);
    i = (int)(k >> 12);
    c = (int)k & 0xfff;
    var_220 = (int)scaleCoordToLod(b, coord3);
    m = 0x800 - a;
    p = 0x800 - c;
    var_218 = a - 0x800;
    var_219 = c - 0x800;
    l = process3dg(b, g, i);
    if (l != -1) {
        word_3C5A8 = matrix3dt_2[b][l];
        for (e = 1; (unsigned int)e < matrix3dt[b][l]; e++) {
            f = word_3C5A8->x + m;
            h = word_3C5A8->y + p;
            var_216 = abs(f) + abs(h);
            if (word_3B7E2 > var_216) {
                word_3B7EC = word_3C5A8;
                word_3B7E2 = var_216;
            }
            word_3C5A8++;
        }
    }
    if (word_3B7E2 != 0x7fff) {
        word_3C5A8 = word_3B7EC;
        var_200 = (char far *)(byte_228D0 + buf3d3[word_3B7EC->shape]);
        var_202 = word_3C5A8->x - var_218;
        var_203 = word_3C5A8->y - var_219;
        var_204[0] = word_3C5A8->z - var_220;
        FP_OFF(var_200)++;
        *(uint8 *)&word_34262 = 0;
        var_216 = 0;
        advanceModelPointerLod();
        if (*var_200 & 0x40) {
            var_215 = 0;
            sub_2044A();
        }
    }
}

// ==== seg000:0x345e ====
void renderMapTerrain(char *transform, int mapX, int mapY, int zoomShift) {
    int p, a;
    var_190 = 0;
    setup3DTransform(transform, 0, 0, 0, 0, 0, 0, 0);
    gfx_setBlitOffset(gfx_calcRowAddr(*(int *)(transform + 0x12), *(int *)(transform + 0x0e)));
    drawMapTiles(mapX, mapY, zoomShift);
    rasterize3DWorld();
}

// ==== seg000:0x51f9 ====

void drawMapTiles(int originX, int originY, int zoomShift)
{
    int p, a, b, c, d, e, f, g, h, i;

    var_663 = originX >> (char)zoomShift;
    var_664 = originY >> (char)zoomShift;
    for (var_666 = 4; var_666 >= 0; var_666--) {
        word_3C16C = word_34186[var_666];
        var_665 = (var_666 <= 1) ? 0x40 : 0;
        word_3C042 = zoomShift - word_3C16C * 2 + 8;
        var_661 = 0x1000 >> (char)word_3C042;
        if (var_661 > 16) {
            var_662 = 4 << (8 - (char)word_3C16C * 2);
            computeTileBounds(&b, &h, &c, &p);
            for (f = c; f <= p; f++) {
                for (e = b; e <= h; e++) {
                    i = e * var_661 - var_663 + (var_661 >> 1);
                    a = f * var_661 - var_664 + (var_661 >> 1);
                    g = process3dg(word_3C16C, e, f);
                    if (g != -1) {
                        word_3C5A8 = matrix3dt_2[word_3C16C][g];
                        for (d = 0; matrix3dt[word_3C16C][g] > (unsigned int)d; d++) {
                            if (word_3C5A8->z == 0) {
                                var_200 = (char far *)(byte_228D0 + buf3d3[word_3C5A8->shape]);
                                drawMapTileObject(var_200,
                                    (word_3C5A8->x >> (char)word_3C042) + i,
                                    (word_3C5A8->y >> (char)word_3C042) + a);
                            }
                            word_3C5A8++;
                        }
                    }
                }
            }
        }
    }
}

// ==== seg000:0x3638 ====
void computeTileBounds(int *minTileX, int *maxTileX, int *minTileY, int *maxTileY) {
    worldToTileIndex(0, 0, minTileX, minTileY);
    if (*minTileX < 0) {
        *minTileX = 0;
    }
    if (*minTileY < 0) {
        *minTileY = 0;
    }
    worldToTileIndex(word_37557, word_37559, maxTileX, maxTileY);
    if (*maxTileX >= var_662) {
        *maxTileX = var_662 - 1;
    }
    if (*maxTileY >= var_662) {
        *maxTileY = var_662 - 1;
    }
}

// ==== seg000:0x3694 ====
void worldToTileIndex(int worldX, int worldY, int *outCol, int *outRow) {
    *outCol = (worldX - word_3298C + var_663) / var_661;
    *outRow = ((worldY - word_3298E) * 4 / 3 + var_664) / var_661;
}

// ==== seg000:0x36d2 ====
void drawMapTileObject(char far *modelData, int screenX, int screenY) {
    *(char far **)&var_200 = modelData;
    var_200++;
    var_216 = 0;
    advanceModelPointerLod();
    if (word_3C16C >= 3) {
        if ((**(char far **)&var_200 & 0x40) != var_665)
            return;
    }
    switch ((unsigned)(unsigned char)**(char far **)&var_200 & 0x3f) {
    case 0x3e:
        return;
    case 0x3f:
#ifdef BUGFIX
        drawModelPoint(screenX, screenY);
#else
        drawModelPoint();
#endif
        return;
    }
    buildVertexSignMask(screenX, screenY);
    projectModelVertices(screenX, screenY);
    projectModelEdgesFar();
    drawModelDisplayList();
}

// ==== seg000:0x374a ====
void drawModelPoint(int param_1, int param_2) {
    word_3755F = word_3755D = param_1 + word_3298C;
    word_37563 = word_37561 = -param_2 + word_3298E;
    ++var_200;
    gfx_setColor((unsigned char)*var_200++);
    drawClipLineGlobal();
}

// ==== seg000:0x378e ====
void buildVertexSignMask(int param_1, int param_2) {
    long p;
    int b;

    p = 1L;
    var_257 = (int)(unsigned char)(*((*(char far **)&var_200)++)) & 0x1f;
    var_259 = -1;
    var_260 = -1;
    *(char *)&var_258 = (var_257 > 0x10) ? 1 : 0;
    b = 0;
    while (b < var_257) {
        var_200 += 4;
        if (*(*(int far **)&var_200)++ < 0) {
            *(long *)&var_259 ^= p;
        }
        var_200 += 2;
        p <<= 1;
        b++;
    }
}



// ==== seg000:0x3816 ====
void projectModelVertices(int screenX, int screenY) {
    int p;
    int a;
    int b;
    int c;
    int d;

    b = (int)(unsigned char)**(char far **)&var_200 & 0x80;
    var_256 = (int)(unsigned char)(*(*(char far **)&var_200)++) & 0x7F;
    for (p = 0; p < var_256; p++) {
        var_200 += (unsigned char)var_258 * 2 + 2;
        if (b != 0) {
            a = (int)(unsigned char)(*(*(char far **)&var_200)++);
            c = (byte_3B7FC.vertexX[buf3d3_1[a]] >> word_3C042) + screenX;
            d = (((int16 *)byte_3BE3E)[buf3d3_2[a]] >> word_3C042) + screenY;
        } else {
            c = (*(*(int far **)&var_200)++ >> word_3C042) + screenX;
            d = (*(*(int far **)&var_200)++ >> word_3C042) + screenY;
            var_200 += 2;
        }
        word_34684[p * 2] = 1;
        word_34686[p * 2] = 1;
        word_34868[p] = c + word_3298C;
        word_34A4C[p] = -aspectScaleY(d) + word_3298E;
    }
}

// ==== seg000:0x3922 ====
int aspectScaleY(int screenY) {
    return screenY - (screenY >> 2);
}

// ==== seg000:0x3932 ====
void setup3DTransform(char *model, int angleX, int angleY, int angleZ, int posX, int arg_a, int arg_c, int arg_e) {
    setupViewport(model);
    setViewRotation(angleX, angleY, angleZ);
    setViewPosition(posX, arg_a, arg_c);
    if (arg_e != 0) {
        var_315 = 0;
        if (word_38FDC == 0) {
            *(uint8 *)&var_316 = 1;
        }
        if (*(uint8 *)&var_316 == 0) {
            sub_20658();
        }
#ifdef DEBUG
        {
            unsigned long spins = 0;
            while (byte_378EE != 0) {
                if (++spins > 3000000UL) {
                    TRACE_KEY(("13932: SPIN TIMEOUT - timer ISR not clearing 378EE"));
                    byte_378EE = 0;
                    break;
                }
            }
        }
#else
        while (byte_378EE != 0)
            ;
#endif
        drawProjectionSphere(*(int *)(model + 4));
    }
    var_255 = 0;
    var_261 -= 0x3000 / g_frameRateScaling;
}

// ==== seg000:0x39aa ====
void rasterize3DWorld(void) {
    sub_202F6();
    gfx_setBlitOffset2();
    gfx_nop23();
    var_316 = 0;
}

// ==== seg000:0x3a6c ====
