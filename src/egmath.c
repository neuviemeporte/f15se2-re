// seg000 optimized code (/Ot)
#include "inttype.h"
#include "eg3dcam.h"
#include "eg3dload.h"
#include "eg3dmap.h"
#include "egcode.h"
#include "egdata.h"
#include "egframe.h"
#include "egmath.h"
#include "egtacmap.h"
#include "egthreat.h"
#include "egtypes.h"
#include "offsets.h"
#include "pointers.h"
#include "log.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

// ==== seg000:0xc8de ====

void load15Flt3d3() {
    int16 bytesLeft, chunkSize;
    struct SREGS segs;
    char FAR *dest;
    strcpyFromDot(a15flt_xxx, ".3D3");
    fileHandle = fopen(a15flt_xxx, "rb");
    if (fileHandle == NULL) {
        printError("Open Error on *.3D3");
        return;
    }
    fread(&flt15HeaderWord, 2, 1, fileHandle);
    fread(&flt15_size, 2, 1, fileHandle);
    fread(flt15_buf1, 2, flt15_size, fileHandle);
    fread(&bytesLeft, 2, 1, fileHandle);
    segread(&segs);
    dest = g_aircraftModels;
    Log(("load15Flt3d3: DS=%04x var_10=%04x:%04x", segs.ds, FP_SEG(dest), FP_OFF(dest)));
    while (bytesLeft > 0) {
        chunkSize = bytesLeft <= 0x800 ? bytesLeft : 0x800;
        fread(flt15_buf2, 1, chunkSize, fileHandle);
        movedata(segs.ds, PTR_OFF(flt15_buf2), FP_SEG(dest), FP_OFF(dest), chunkSize);
        bytesLeft -= 0x800;
        FP_OFF(dest) += 0x800;
    }
    fclose(fileHandle);
}

void drawWorldObject(int16 shapeId, int32 worldX, int32 worldY, int16 altitude, int16 objYaw, int16 objPitch, int16 objRoll, int16 scaleShift) {
    int16 *drawPg;
    int16 dataOff;
    int32 relX, relY;
    int16 altDiff, shiftAmt;

    dataOff = shapeDataOffset(shapeId);
    drawPg = (g_drawPage == 0) ? g_pageFront : g_pageBack;
    relX = worldX - g_ViewX;
    relY = worldY + g_ViewY - 0x01000000L;
    altDiff = altitude - g_viewZ;
    if ((keyValue & 0x80) != 0) {
        relX += g_ViewX - g_camEyeX;
        relY += g_camEyeY - g_ViewY;
        altDiff += g_viewZ - g_camEyeZ;
    }
    scaleShift = (g_halfScaleRender != 0) ? (scaleShift - 2) : (scaleShift - 3);
    if (scaleShift > 0) {
        shiftLongLeftInPlace(scaleShift, &relX);
        shiftLongLeftInPlace(scaleShift, &relY);
        altDiff <<= (char)scaleShift;
    }
    if (scaleShift < 0) {
        *(char *)&shiftAmt = -scaleShift;
        shiftLongRightInPlace(shiftAmt, &relX);
        shiftLongRightInPlace(shiftAmt, &relY);
        altDiff >>= (char)shiftAmt;
    }
    if ((int32)(int16)labs(relX) < (int32)0x7FFF) {
        if ((int32)(int16)labs(relY) < (int32)0x7FFF) {
            setViewPosition(0, 0, -altDiff);
            g_curLod = 1;
            projectSceneObject(g_world3dData + dataOff, -objYaw, objPitch, objRoll, (int16)relX, -(int16)relY, altitude != 0);
        }
    }
}

// ==== seg000:0xcb42 ====
void drawTargetView(int16 shapeId, int16 worldX, int16 worldY, int16 altitude, int16 objYaw, int16 objPitch, int16 objRoll, int16 mode, int16 shift) {
    int16 unused, horizonY, bearing, range, pitchDelta, category, pitch, dataOff, colorIdx, radius, bearingDelta, relX, relY, relZ;
    char categoryLow;

    g_targetInHudFlag = 1;
    if (mode == 1 && g_detailLevel == 0 && *(char *)&gfxModeUnset != 0 && (frameTick & 3) != 0) {
        return;
    }

    dataOff = shapeDataOffset(shapeId);
    if (g_drawPage == 0) {
        *g_targetViewParams = 0;
    } else {
        *g_targetViewParams = 1;
    }

    if (mode < 2) {
        g_trkRoll = 0;
        relX = worldX - g_viewX_;
        relY = worldY - g_viewY_;
        relZ = (altitude - g_viewZ) >> 5;
        bearing = computeBearing(relX, -relY);
        pitch = computeBearing(relZ, rangeApprox(relX, relY));
        range = rangeApprox(relZ, rangeApprox(relX, relY));

        if (mode == 1) {
            g_trkRange = range;
            g_trkSize = (range >> 4) + 400;
            g_trkScale = (g_trkSize << 5) / (range + 1);
            range = g_trkSize << 2;
            g_trkBearing = bearing;
            g_trkPitch = pitch;
        } else {
            g_trkScale = (g_trkRange << 5) / (range + 1);
            if (g_trkScale > 0x100) {
                g_trkScale = 0x100;
            }
            if (g_trkScale < 4) {
                g_trkScale = 4;
            }
            bearingDelta = ((bearing - g_trkBearing) >> 5) * g_trkScale;
            pitchDelta = ((pitch - g_trkPitch) >> 5) * g_trkScale;
            if (abs(bearingDelta) > 0x1000) {
                return;
            }
            if (abs(pitchDelta) > 0x1000) {
                return;
            }
            bearing = (bearingDelta << 2) + g_trkBearing;
            pitch = (pitchDelta << 2) + g_trkPitch;
            range = (g_trkSize << 5) / g_trkScale << 2;
        }

        radius = cosMul(pitch, range);
        g_extraScaleShift = 2;
        if (shift < 0) {
            g_extraScaleShift = (uint8)(shift + 2);
            shift = 0;
        }
        relX = sinMul(bearing, radius) >> (char)shift;
        relY = -(cosMul(bearing, radius)) >> (char)shift;
        relZ = sinMul(pitch, range) >> (char)shift;
    } else {
        relX = (worldX - g_viewX_) << 4;
        relY = (worldY - g_viewY_) << 4;
        relZ = (altitude - g_viewZ) >> 1;
        g_trkBearing = g_ourHead;
        g_trkPitch = g_extViewPitch;
        g_trkRoll = g_ourRoll;
        g_trkScale = 0x20;
        g_extraScaleShift = 2;
    }
    if (mode == 1 || mode == 3) {
        horizonY = (int16)((int32)g_trkScale * (int32)(g_trkPitch >> 2) >> 5) + 156;
        if (horizonY < 128 || g_trkPitch < (int16)0xe800) {
            horizonY = 128;
        }
        if (horizonY > 184 || g_trkPitch > 0x1800) {
            horizonY = 184;
        }
        *(g_targetViewParams + 2) = colorLut[3];
        if (horizonY != 128) {
            fillSpanRect(g_targetViewParams, 232, 128, 304, horizonY);
        }
        colorIdx = g_world3dData[0x2f];
        category = (int16)(signed char)g_shapeTargetCategory[shapeId & 0x7f];
        if (category & 0x10) {
            colorIdx = 8;
        }
        categoryLow = (char)(category & 0xf);
        if (categoryLow == 12 || categoryLow == 9 || categoryLow == 11) {
            colorIdx = 1;
        }
        *(g_targetViewParams + 2) = colorLut[colorIdx];
        if (horizonY != 184) {
            fillSpanRect(g_targetViewParams, 232, horizonY, 304, 184);
        }
    }

    g_offscreenRender = 1;
    setup3DTransform(g_targetViewParams, -g_trkBearing, g_trkPitch, g_trkRoll, 0, 0, 0, 0);
    projectSceneObject(g_world3dData + dataOff, -objYaw, objPitch, objRoll, relX, -relY, relZ);
    rasterize3DWorld();
    g_offscreenRender = 0;

    if (mode == 1) {
        strcpy(strBuf, "BRG ");
        strcat(strBuf, itoa((uint16)g_trkBearing / 0xb6, g_itoaScratch, 10));
        drawStringActivePage(strBuf, 248, 176, 0xf);
    }
    g_extraScaleShift = 0;
}

// ==== seg000:0xcf32 ====
int16 shapeDataOffset(int16 shapeId) {
    if (shapeId & 0x100) {
        return buf3d3[shapeId & 0x7f];
    }
    return (int16)(&g_aircraftModels[((int16 *)flt15_buf1)[shapeId]] - g_world3dData);
}

// ==== seg000:0xcf64 clamp ====
int16 clampRange(int16 value, int16 minVal, int16 maxVal) { /* Original: rng(x,a,b). Clamp value, preserving the <= -0x4000 wrap-to-max case. */
    enum { RNG_WRAP_FLOOR = -0x4000 };
    /* Unlike a plain clamp, very negative wrapped angles select the high end. */
    if (value > maxVal) {
        return maxVal;
    }
    if (value >= minVal) {
        return value;
    }
    if (value <= RNG_WRAP_FLOOR) {
        return maxVal;
    }
    return minVal;
}

// ==== seg000:0xcf8e ====
int16 clampValue(int16 value, int16 minVal, int16 maxVal) { /* Original: rng2(x,a,b). Plain clamp between min and max. */
    if (value > maxVal) {
        return maxVal;
    }
    if (value < minVal) {
        return minVal;
    }
    return value;
}

#define XYDIST_MAX 0x7FFF

// ==== seg000:0xcfa6 ====
int16 rangeApprox(int16 deltaX, int16 deltaY) { /* Original: xydist(x,y). Fast 2D distance approximation capped at 0x7fff. */
    int32 dist;
    deltaX = abs(deltaX);
    deltaY = abs(deltaY);
    /* Fast 2D distance approximation: max(abs) + half of min(abs). */
    if (deltaX > deltaY)
        dist = (int32)(deltaY >> 1) + (int32)deltaX;
    else
        dist = (int32)(deltaX >> 1) + (int32)deltaY;
    if (dist > XYDIST_MAX) dist = XYDIST_MAX;
    return (int16)dist;
}

// ==== seg000:0xd008 ====
int16 computeBearing(int16 deltaX, int16 deltaY) {
    int16 angle, result;
    int32 numer;
    int16 denom, swapped, ratio;

    if (deltaX == 0) {
        if (deltaY > 0) return 0;
        return BEARING_SOUTH;
    }
    if (deltaY == 0) {
        if (deltaX > 0) return BEARING_EAST;
        return BEARING_WEST;
    }
    if (abs(deltaX) > abs(deltaY)) {
        numer = (int32)abs(deltaY) << 0xe;
        denom = abs(deltaX);
        swapped = 1;
    } else {
        numer = (int32)abs(deltaX) << 0xe;
        denom = abs(deltaY);
        swapped = 0;
    }
    ratio = numer / (int32)denom;
    angle = ((0x2800L - (((int32)abs(0x1333 - ratio) * 0xB00L) >> 0xe)) * (int32)ratio) >> 0xe;
    if (deltaX > 0) {
        if (deltaY > 0)
            result = swapped ? BEARING_EAST - angle : angle;
        else
            result = swapped ? angle + BEARING_EAST : BEARING_SOUTH - angle;
    } else {
        if (deltaY > 0)
            result = swapped ? angle + BEARING_WEST : -angle;
        else
            result = swapped ? BEARING_WEST - angle : angle + BEARING_SOUTH;
    }
    return result;
}

// ==== seg000:0xd178 sinMul ====
int16 sinMul(int16 angle, int16 value) { /* Original: sinX(angle,x). Fixed-point sine lookup multiplied by value. */
    /* Sine table values are fixed-point; fixedMulQ14 applies the scale. */
    return fixedMulQ14(sine(angle), value);
}

// ==== seg000:0xd190 cosMul ====
int16 cosMul(int16 angle, int16 value) { /* Original: cosX(angle,x). Cosine via sine phase shift. */
    enum { WORD_DEGREES_QUARTER_TURN = 0x4000 };
    return sinMul(angle + WORD_DEGREES_QUARTER_TURN, value);
}

// ==== seg000:0xd1c8 ====
int16 signOf(int16 value) { /* Original: sgn(x). Return -1, 0, or 1. */
    if (value == 0) {
        return 0;
    }
    if (value > 0) {
        return 1;
    }
    return -1;
}

void seedRng(void) {
    if (g_inputDisabled == 0) {
        g_rngSeed = getTimeOfDay();
    }
    srand(g_rngSeed);
}

#define RAND_SCALE_SHIFT 15

// ==== seg000:0xd200 randomRange ====
int16 randomRange(int16 maxVal) { /* Original: rnd(Max). Deterministic ((int32)Max * rand()) >> 15 range scaling. */
    return (int16)(((int32)rand() * (int32)maxVal) >> RAND_SCALE_SHIFT);
}

// ==== seg000:0xd21e ====
int16 readAxisInput(int16 axisIdx) {
    int16 value;

    if (g_inputDisabled) {
        value = 0;
    } else {
        value = ((commData->setupUseJoy) ? misc_readJoystick(axisIdx) : 0) + g_axisInputAccum[axisIdx];
    }
    return value;
}
