// seg000 optimized code (/Ot)
#include "egcode.h"
#include "egdata.h"
#include "egsphere.h"
#include "egtypes.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

// ==== seg000:0x0334 ====
void drawProjectionSphere(int skyColor)
{
    int radiusScale;    // on-screen radius scale of the sphere
    int ringIx;         // ring/loop index
    // The two endpoints of each ring's projected silhouette edge, one entry
    // per ring boundary. (rearX,rearY) and (foreX,foreY) are paired into quads.
    int rearX[17];      // edge endpoint A, X screen coords
    int rearY[17];      // edge endpoint A, Y screen coords
    int foreX[17];      // edge endpoint B, X screen coords
    int foreY[17];      // edge endpoint B, Y screen coords
    int facePts[8];     // 4-point quad buffer for drawPolygonOutline
    int ringRad;        // ring radius temp

    if (*(char *)&g_detailLevel < 3) {
        drawFlatHorizon(skyColor);
        return;
    }
    for (ringIx = 0; ringIx < 16; ringIx++)
        g_sphereRingRadii[ringIx] = g_sphereRingTable[ringIx];
    g_sphereTiltZ = -g_spherePitch;
    radiusScale = (int)(((long)g_sphereRadius << 8) / (long)(g_sphereDistZ < 0x200 ? 0x200 : g_sphereDistZ));
    if (g_extraScaleShift != 0) {
        radiusScale <<= g_extraScaleShift;
    }
    if (g_halfScaleRender != 0) {
        radiusScale >>= 1;
    }
    {
        register int i;
        register int j;
        for (ringIx = 0; ringIx < 17; ringIx++) {
            if (ringIx < 16) {
                ringRad = g_sphereRingRadii[ringIx] + radiusScale;
            } else {
                ringRad = 0x5848;
            }
            i = fixedMulQ14(-0x5848, g_sphereRoll);
            j = fixedMulQ14(ringRad, g_sphereTiltZ);
            rearX[ringIx] = (g_viewCenterX + i) - j;
            foreX[ringIx] = -i + g_viewCenterX - j;
            i = fixedMulQ14(ringRad, g_sphereRoll);
            j = fixedMulQ14(-0x5848, g_sphereTiltZ);
            rearY[ringIx] = -(-(((i + j) >> 2) - i) + j) + g_viewCenterY;
            foreY[ringIx] = (((i - j) >> 2) + g_viewCenterY) - i + j;
        }
    }
    ringIx = 0;
    do {
        facePts[0] = rearX[ringIx];
        facePts[1] = rearY[ringIx];
        facePts[2] = foreX[ringIx];
        facePts[3] = foreY[ringIx];
        facePts[4] = foreX[ringIx + 1];
        facePts[5] = foreY[ringIx + 1];
        facePts[6] = rearX[ringIx + 1];
        facePts[7] = rearY[ringIx + 1];
        drawPolygonOutline(g_sphereColor, 4, facePts, ringIx + 0x60);
        ringIx++;
    } while (ringIx < 16);
    g_sphereRingRadii[0] = g_viewPosZ / 0x200;
    ringIx = 1;
    do {
        g_sphereRingRadii[ringIx] = g_viewPosZ / ((16 - ringIx) * 0x20) - g_sphereRingRadii[0];
        ringIx++;
    } while (ringIx < 16);
    g_sphereRingRadii[0] = 0;
    {
        register int i;
        register int j;
        for (ringIx = 0; ringIx < 17; ringIx++) {
            if (ringIx < 16) {
                ringRad = radiusScale - g_sphereRingRadii[ringIx];
            } else {
                ringRad = -0x5848;
            }
            i = fixedMulQ14(-0x5848, g_sphereRoll);
            j = fixedMulQ14(ringRad, g_sphereTiltZ);
            rearX[ringIx] = (g_viewCenterX + i) - j;
            foreX[ringIx] = -i + g_viewCenterX - j;
            i = fixedMulQ14(ringRad, g_sphereRoll);
            j = fixedMulQ14(-0x5848, g_sphereTiltZ);
            rearY[ringIx] = -(-(((i + j) >> 2) - i) + j) + g_viewCenterY;
            foreY[ringIx] = (((i - j) >> 2) + g_viewCenterY) - i + j;
        }
    }
    ringIx = 0;
    do {
        facePts[0] = rearX[ringIx];
        facePts[1] = rearY[ringIx];
        facePts[2] = foreX[ringIx];
        facePts[3] = foreY[ringIx];
        facePts[4] = foreX[ringIx + 1];
        facePts[5] = foreY[ringIx + 1];
        facePts[6] = rearX[ringIx + 1];
        facePts[7] = rearY[ringIx + 1];
        drawPolygonOutline(g_sphereColor, 4, facePts, ringIx + 0x70);
        ringIx++;
    } while (ringIx < 16);
}
