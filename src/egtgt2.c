/* egtgt2.c — world->HUD projection + range/bearing helpers (reads g_viewZ
   as int16). Split from egtarget.c at the projectWorldToHud boundary. */
#include "eg3dmap.h"
#include "eg3dview.h"
#include "egcode.h"
#include "egcombat.h"
#include "egdata.h"
#include "egflight.h"
#include "egframe.h"
#include "egmath.h"
#include "egtacmap.h"
#include "egtarget.h"
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
void drawTargetBox(int16, int16, int16, int16);
void drawMissileLock(void);
void drawTargetLabel(const char *, int16, int16);
void buildRangeString(int16 rangeRaw);
void projectWorldToHud(int16 worldX, int16 worldY, int16 worldZ);
int32 rotateVectorComponent(int16 axis, int16 vecX, int16 vecY, int16 vecZ);
int16 computeMapTargetRange(int16 targetIdx);
int16 computeSimObjectRange(int16 objIdx);
int16 computeTargetBearing(int16 targetX, int16 targetY, int16 wantBearing);

void projectWorldToHud(int16 worldX, int16 worldY, int16 worldZ);
int32 rotateVectorComponent(int16 axis, int16 vecX, int16 vecY, int16 vecZ);
int16 computeMapTargetRange(int16 targetIdx);
int16 computeSimObjectRange(int16 objIdx);
int16 computeTargetBearing(int16 targetX, int16 targetY, int16 wantBearing);

// ==== seg000:0xc488 ====
void projectWorldToHud(int16 worldX, int16 worldY, int16 worldZ) {
    int16 relX;
    int32 camX;
    int16 relY;
    int32 camY;
    int16 relZ;
    int32 camDepth;

    relX = g_viewX_ - worldX;
    relY = worldY - g_viewY_;
    relZ = (worldZ - g_viewZ) >> 5;

    if (keyValue & 0x80) {
        relX -= (int16)((g_ViewX - g_camEyeX) >> 5);
        relY -= (int16)((g_ViewY - g_camEyeY) >> 5);
        relZ -= (int16)((-((int32)(uint16)g_viewZ - (int32)g_camEyeZ)) >> 5);
    }

    camX = rotateVectorComponent(0, relX, relY, relZ);
    camY = rotateVectorComponent(1, relX, relY, relZ);
    camDepth = rotateVectorComponent(2, relX, relY, relZ);

    if (camDepth >= 0) {
        vtxScratch.vproj.x.lo = -1;
        return;
    }

    if (g_halfScaleRender) {
        camX >>= 1;
        camY >>= 1;
    }

    if (-camDepth < camX || camX < camDepth) {
        vtxScratch.vproj.x.lo = -1;
        return;
    }

    vtxScratch.vproj.x.lo = (int16)((camX << 8) / camDepth) + 160;
    vtxScratch.vproj.y.lo = (int16)((camY << 8) / camDepth);
    vtxScratch.vproj.y.lo -= vtxScratch.vproj.y.lo >> 1 >> 1;
    vtxScratch.vproj.y.lo += (g_pageFront[8] == 199) ? 100 : 56;

    g_projDepth = (int16)(camDepth >> 3);

    if (vtxScratch.vproj.x.lo < 0 || vtxScratch.vproj.x.lo > 319) {
        g_offscreenProjX = vtxScratch.vproj.x.lo;
        vtxScratch.vproj.x.lo = -1;
    }
    if (vtxScratch.vproj.y.lo < 0 || g_pageFront[8] < vtxScratch.vproj.y.lo) {
        g_offscreenProjX = vtxScratch.vproj.x.lo;
        vtxScratch.vproj.x.lo = -1;
    }
}

// ==== seg000:0xc661 ====
int32 rotateVectorComponent(int16 axis, int16 vecX, int16 vecY, int16 vecZ) {
    int32 sum;

    sum = (int32)fixedMulQ14(g_camRotMatrix[axis], vecX);
    sum += (int32)fixedMulQ14(g_camRotMatrix[3 + axis], vecZ);
    sum += (int32)fixedMulQ14(g_camRotMatrix[6 + axis], vecY);
    return sum;
}

int16 findWaypointEntry(int16 mapX, int16 mapY) {
    int16 idx;

    if ((g_nearestTileObj = findNearestTileObject((int32)mapX << 5, (0x8000L - (int32)mapY) << 5))) {
        mapX = g_nearestTileObj->x >> 5;
        mapY = -((int16)(g_nearestTileObj->y >> 5) - 0x8000);
        for (idx = 1; idx < g_planeCount; idx++) {
            if (g_planeTable.planes[idx].mapX == mapX && g_planeTable.planes[idx].mapY == mapY) {
                return idx;
            }
        }
        g_planeTable.planes[0].mapX = mapX;
        g_planeTable.planes[0].mapY = mapY;
        g_planeTable.planes[0].nameIndex = g_nearestTileObj->id + 0x100;
        if (g_smokeSourceIdx == 0) {
            g_smokeSourceIdx = -1;
        }
        return 0;
    } else {
        return -1;
    }
}

// ==== seg000:0xc7a2 ====
int16 computeMapTargetRange(int16 targetIdx) {
    return computeTargetBearing(g_planeTable.planes[targetIdx].mapX, g_planeTable.planes[targetIdx].mapY, 1);
}

// ==== seg000:0xc7c6 ====
int16 computeSimObjectRange(int16 objIdx) {
    return computeTargetBearing(g_simObjects[objIdx].posX, g_simObjects[objIdx].posY, 0);
}

// ==== seg000:0xc7ea ====
int16 computeTargetBearing(int16 targetX, int16 targetY, int16 wantBearing) {
    int16 dx, dy;
    dx = g_viewX_ - targetX;
    dy = g_viewY_ - targetY;
    if (wantBearing != 0) {
        g_targetBearing = computeBearing(-dx, dy);
    }
    g_targetRange = rangeApprox(dx, dy);
    return g_targetRange;
}

// ==== seg000:0xc82d ====
int16 computeLoftAngle() {
    return (int16)((uint32)((int32)(0x4000 - abs(g_ourPitch)) << 12) / (uint32)(uint16)(g_viewZ + 0x1000)) - 0x4000;
}

// ==== seg000:0xc864 ====
int16 getTargetSymbol(int16 wpIdx) {
    if (g_planeTable.planes[wpIdx].flags & 0x80) {
        return (isTargetOverWater(wpIdx) ? (int16)(char)g_waterTargetId[0] : (int16)(char)g_landTargetId[0]) + 0x100;
    }
    return g_planeTable.planes[wpIdx].nameIndex;
}

// ==== seg000:0xc8a4 ====
int16 isTargetOverWater(int16 wpIdx) {
    int16 category;

    category = ((char *)g_shapeTargetCategory)[g_planeTable.planes[wpIdx].nameIndex & 0x7f] & 0x0f;
    return (category == 12 || category == 9 || category == 11) ? 1 : 0;
}
