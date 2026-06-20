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

    nearestTile.dist = 0x7fff;
    for (c = 1; c <= 2; c++) {
        for (e = 0; e < 9; e++) {
            *(long *)&m = scaleCoordToLod(c, worldX);
            i = *(unsigned long *)&m >> 0xc;
            r = m & 0xfff;
            *(long *)&m = scaleCoordToLod(c, worldY);
            k = *(unsigned long *)&m >> 0xc;
            d = m & 0xfff;
            a = g_neighborSampling.gridX[e];
            b = g_neighborSampling.gridY[e];
            o = g_neighborSampling.lut[a] - r + 0x800;
            p = g_neighborSampling.lut[b] - d + 0x800;
            n = process3dg(c, i += a, k += b);
            if (n != -1) {
                g_curTileEntry = matrix3dt_2[c][n];
                for (f = 0; matrix3dt[c][n] > (unsigned int)f; f++) {
                    if (g_shapeTargetCategory[g_curTileEntry->shape & 0x7f] != 0) {
                        h = o + g_curTileEntry->x;
                        j = g_curTileEntry->y + p;
                        q = abs(h) + abs(j);
                        if (c == 1) {
                            q >>= 2;
                        } else {
                            h <<= 2;
                            j <<= 2;
                        }
                        g = g_curTileEntry->shape;
                        if ((g_curTileEntry->shape & 0x80) != 0 &&
                            lookupTileEntry(c, f, i, k) != 0) {
                            g = g_dynTileEntries[g_tileEntryIdx].shape;
                        }
                        if (q < nearestTile.dist) {
                            g_modelStreamPtr = (char far *)(g_world3dData + buf3d3[g]);
                            if (*(int far *)g_modelStreamPtr != 0 ||
                                *((char far *)g_modelStreamPtr + 2) != 0 ||
                                g_render3DTiles != 0) {
                                nearestTile.lod = (uint8)c;
                                nearestTile.subIndex = (uint8)f;
                                nearestTile.tileX = (uint8)i;
                                nearestTile.tileY = (uint8)k;
                                nearestTile.entry = g_curTileEntry;
                                nearestTile.id = g;
                                nearestTile.dist = q;
                                nearestTile.x = worldX + (long)h;
                                nearestTile.y = worldY + (long)j;
                            }
                        }
                    }
                    g_curTileEntry++;
                }
            }
        }
    }
    if (nearestTile.dist != 0x7fff) {
        return &nearestTile;
    }
    return 0;
}

void addTileEntry(char *a, int b, char c) {
    *(int *)(a + 0x12) = b;
    *(a + 0x14) = c;
    memcpy((char *)&g_dynTileEntries[g_tileEntryCount++], a + 0x0e, 8);
    *(*(char **)(a + 0x0c) + 6) |= 0x80;
}

// ==== seg000:0x3266 ====
int lookupTileEntry(int lod, int subIndex, int tileX, int tileY) {
    for (g_tileEntryIdx = g_tileEntryCount - 1; g_tileEntryIdx >= 0; g_tileEntryIdx--) {
        if (g_dynTileEntries[g_tileEntryIdx].lod == lod &&
            g_dynTileEntries[g_tileEntryIdx].subIndex == subIndex &&
            g_dynTileEntries[g_tileEntryIdx].tileX == tileX &&
            g_dynTileEntries[g_tileEntryIdx].tileY == tileY) {
            return g_dynTileEntries[g_tileEntryIdx].value;
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

    *(char *)&g_posVisibleFlag = 0;
    nearestTile.dist = 0x7fff;
    b = 4;
    k = scaleCoordToLod(b, coord1);
    g = (int)(k >> 12);
    a = (int)k & 0xfff;
    k = scaleCoordToLod(b, coord2);
    i = (int)(k >> 12);
    c = (int)k & 0xfff;
    g_viewPosZ = (int)scaleCoordToLod(b, coord3);
    m = 0x800 - a;
    p = 0x800 - c;
    g_viewPosX = a - 0x800;
    g_viewPosY = c - 0x800;
    l = process3dg(b, g, i);
    if (l != -1) {
        g_curTileEntry = matrix3dt_2[b][l];
        for (e = 1; (unsigned int)e < matrix3dt[b][l]; e++) {
            f = g_curTileEntry->x + m;
            h = g_curTileEntry->y + p;
            g_objDistance = abs(f) + abs(h);
            if (nearestTile.dist > g_objDistance) {
                nearestTile.entry = g_curTileEntry;
                nearestTile.dist = g_objDistance;
            }
            g_curTileEntry++;
        }
    }
    if (nearestTile.dist != 0x7fff) {
        g_curTileEntry = nearestTile.entry;
        g_modelStreamPtr = (char far *)(g_world3dData + buf3d3[nearestTile.entry->shape]);
        g_objRelX = g_curTileEntry->x - g_viewPosX;
        g_objRelY = g_curTileEntry->y - g_viewPosY;
        g_objTransform[0] = g_curTileEntry->z - g_viewPosZ;
        FP_OFF(g_modelStreamPtr)++;
        *(uint8 *)&g_objRenderMode = 0;
        g_objDistance = 0;
        advanceModelPointerLod();
        if (*g_modelStreamPtr & 0x40) {
            g_objHasRotation = 0;
            rotatePoint3dFar();
        }
    }
}

// ==== seg000:0x345e ====
void renderMapTerrain(char *transform, int mapX, int mapY, int zoomShift) {
    int p, a;
    g_objShade = 0;
    setup3DTransform(transform, 0, 0, 0, 0, 0, 0, 0);
    gfx_setBlitOffset(gfx_calcRowAddr(*(int *)(transform + 0x12), *(int *)(transform + 0x0e)));
    drawMapTiles(mapX, mapY, zoomShift);
    rasterize3DWorld();
}

// ==== seg000:0x51f9 ====

void drawMapTiles(int originX, int originY, int zoomShift)
{
    int p, a, b, c, d, e, f, g, h, i;

    g_mapOriginX = originX >> (char)zoomShift;
    g_mapOriginY = originY >> (char)zoomShift;
    for (g_mapLodIndex = 4; g_mapLodIndex >= 0; g_mapLodIndex--) {
        g_curLod = g_mapTileLodTable[g_mapLodIndex];
        g_modelEvenOddBit = (g_mapLodIndex <= 1) ? 0x40 : 0;
        g_tileZoomShift = zoomShift - g_curLod * 2 + 8;
        g_tileWorldSize = 0x1000 >> (char)g_tileZoomShift;
        if (g_tileWorldSize > 16) {
            g_tileGridDim = 4 << (8 - (char)g_curLod * 2);
            computeTileBounds(&b, &h, &c, &p);
            for (f = c; f <= p; f++) {
                for (e = b; e <= h; e++) {
                    i = e * g_tileWorldSize - g_mapOriginX + (g_tileWorldSize >> 1);
                    a = f * g_tileWorldSize - g_mapOriginY + (g_tileWorldSize >> 1);
                    g = process3dg(g_curLod, e, f);
                    if (g != -1) {
                        g_curTileEntry = matrix3dt_2[g_curLod][g];
                        for (d = 0; matrix3dt[g_curLod][g] > (unsigned int)d; d++) {
                            if (g_curTileEntry->z == 0) {
                                g_modelStreamPtr = (char far *)(g_world3dData + buf3d3[g_curTileEntry->shape]);
                                drawMapTileObject(g_modelStreamPtr,
                                    (g_curTileEntry->x >> (char)g_tileZoomShift) + i,
                                    (g_curTileEntry->y >> (char)g_tileZoomShift) + a);
                            }
                            g_curTileEntry++;
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
    worldToTileIndex(g_clipMaxX, g_clipMaxY, maxTileX, maxTileY);
    if (*maxTileX >= g_tileGridDim) {
        *maxTileX = g_tileGridDim - 1;
    }
    if (*maxTileY >= g_tileGridDim) {
        *maxTileY = g_tileGridDim - 1;
    }
}

// ==== seg000:0x3694 ====
void worldToTileIndex(int worldX, int worldY, int *outCol, int *outRow) {
    *outCol = (worldX - g_viewCenterX + g_mapOriginX) / g_tileWorldSize;
    *outRow = ((worldY - g_viewCenterY) * 4 / 3 + g_mapOriginY) / g_tileWorldSize;
}

// ==== seg000:0x36d2 ====
void drawMapTileObject(char far *modelData, int screenX, int screenY) {
    *(char far **)&g_modelStreamPtr = modelData;
    g_modelStreamPtr++;
    g_objDistance = 0;
    advanceModelPointerLod();
    if (g_curLod >= 3) {
        if ((**(char far **)&g_modelStreamPtr & 0x40) != g_modelEvenOddBit)
            return;
    }
    switch ((unsigned)(unsigned char)**(char far **)&g_modelStreamPtr & 0x3f) {
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
    g_lineX2 = g_lineX1 = param_1 + g_viewCenterX;
    g_lineY2 = g_lineY1 = -param_2 + g_viewCenterY;
    ++g_modelStreamPtr;
    gfx_setColor((unsigned char)*g_modelStreamPtr++);
    drawClipLineGlobal();
}

// ==== seg000:0x378e ====
void buildVertexSignMask(int param_1, int param_2) {
    long p;
    int b;

    p = 1L;
    g_modelEdgeCount = (int)(unsigned char)(*((*(char far **)&g_modelStreamPtr)++)) & 0x1f;
    g_vtxSignMaskLo = -1;
    g_vtxSignMaskHi = -1;
    *(char *)&g_modelWideVtxFlag = (g_modelEdgeCount > 0x10) ? 1 : 0;
    b = 0;
    while (b < g_modelEdgeCount) {
        g_modelStreamPtr += 4;
        if (*(*(int far **)&g_modelStreamPtr)++ < 0) {
            *(long *)&g_vtxSignMaskLo ^= p;
        }
        g_modelStreamPtr += 2;
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

    b = (int)(unsigned char)**(char far **)&g_modelStreamPtr & 0x80;
    g_modelVtxCount = (int)(unsigned char)(*(*(char far **)&g_modelStreamPtr)++) & 0x7F;
    for (p = 0; p < g_modelVtxCount; p++) {
        g_modelStreamPtr += (unsigned char)g_modelWideVtxFlag * 2 + 2;
        if (b != 0) {
            a = (int)(unsigned char)(*(*(char far **)&g_modelStreamPtr)++);
            c = (g_replayLog.vertexX[buf3d3_1[a]] >> g_tileZoomShift) + screenX;
            d = (((int16 *)g_modelVertY)[buf3d3_2[a]] >> g_tileZoomShift) + screenY;
        } else {
            c = (*(*(int far **)&g_modelStreamPtr)++ >> g_tileZoomShift) + screenX;
            d = (*(*(int far **)&g_modelStreamPtr)++ >> g_tileZoomShift) + screenY;
            g_modelStreamPtr += 2;
        }
        vtxScratch.vproj.in[p].num = 1;
        vtxScratch.vproj.in[p].div = 1;
        vtxScratch.vproj.x.v[p] = c + g_viewCenterX;
        vtxScratch.vproj.y.v[p] = -aspectScaleY(d) + g_viewCenterY;
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
        g_posVisibleFlag = 0;
        if (g_detailLevel == 0) {
            *(uint8 *)&g_offscreenRender = 1;
        }
        if (*(uint8 *)&g_offscreenRender == 0) {
            transformModelVerticesFar();
        }
#ifdef DEBUG
        {
            unsigned long spins = 0;
            while (g_frameSyncPending != 0) {
                if (++spins > 3000000UL) {
                    TRACE_KEY(("13932: SPIN TIMEOUT - timer ISR not clearing 378EE"));
                    g_frameSyncPending = 0;
                    break;
                }
            }
        }
#else
        while (g_frameSyncPending != 0)
            ;
#endif
        drawProjectionSphere(*(int *)(model + 4));
    }
    g_sortedObjCount = 0;
    g_spinAngle -= 0x3000 / g_frameRateScaling;
}

// ==== seg000:0x39aa ====
void rasterize3DWorld(void) {
    renderSortedListFar();
    gfx_setBlitOffset2();
    gfx_nop23();
    g_offscreenRender = 0;
}

// ==== seg000:0x3a6c ====
