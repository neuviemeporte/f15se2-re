// seg000 optimized code (/Ot)
#include "egame.h"
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
    int drawR;          // on-screen radius scale of the sphere
    int ringIx;         // ring/loop index
    int vtx0[17];       // near-edge X screen coords
    int vtx1[17];       // near-edge Y screen coords
    int vtx2[17];       // far-edge X screen coords
    int vtx3[17];       // far-edge Y screen coords
    int polyB[8];       // polygon-point buffer for drawPolygonOutline
    int rad;            // ring radius temp

    if (*(char *)&g_detailLevel < 3) {
        drawFlatHorizon(skyColor);
        return;
    }
    {
        register int i;
        ringIx = 0;
        do {
            i = ringIx + ringIx;
            *((int *)((char *)g_sphereRingRadii + i)) = *((int *)((char *)&g_sphereRingTable + i));
            ringIx++;
        } while (ringIx < 16);
    }
    g_sphereTiltZ = -g_spherePitch;
    drawR = (int)(((long)g_sphereRadius << 8) / (long)(g_sphereDistZ < 0x200 ? 0x200 : g_sphereDistZ));
    if (g_extraScaleShift != 0) {
        drawR <<= g_extraScaleShift;
    }
    if (g_halfScaleRender != 0) {
        drawR >>= 1;
    }
    {
        register int i;
        register int j;
        for (ringIx = 0; ringIx < 17; ringIx++) {
            if (ringIx < 16) {
                rad = g_sphereRingRadii[ringIx] + drawR;
            } else {
                rad = 0x5848;
            }
            i = fixedMulQ14(-0x5848, g_sphereRoll);
            j = fixedMulQ14(rad, g_sphereTiltZ);
            vtx0[ringIx] = (g_viewCenterX + i) - j;
            vtx2[ringIx] = -i + g_viewCenterX - j;
            i = fixedMulQ14(rad, g_sphereRoll);
            j = fixedMulQ14(-0x5848, g_sphereTiltZ);
            vtx1[ringIx] = -(-((i + j >> 2) - i) + j) + g_viewCenterY;
            vtx3[ringIx] = ((i - j >> 2) + g_viewCenterY) - i + j;
        }
    }
    ringIx = 0;
    do {
        polyB[0] = vtx0[ringIx];
        polyB[1] = vtx1[ringIx];
        polyB[2] = vtx2[ringIx];
        polyB[3] = vtx3[ringIx];
        polyB[4] = vtx2[ringIx + 1];
        polyB[5] = vtx3[ringIx + 1];
        polyB[6] = vtx0[ringIx + 1];
        polyB[7] = vtx1[ringIx + 1];
        drawPolygonOutline(g_sphereColor, 4, polyB, ringIx + 0x60);
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
                rad = drawR - g_sphereRingRadii[ringIx];
            } else {
                rad = -0x5848;
            }
            i = fixedMulQ14(-0x5848, g_sphereRoll);
            j = fixedMulQ14(rad, g_sphereTiltZ);
            vtx0[ringIx] = (g_viewCenterX + i) - j;
            vtx2[ringIx] = -i + g_viewCenterX - j;
            i = fixedMulQ14(rad, g_sphereRoll);
            j = fixedMulQ14(-0x5848, g_sphereTiltZ);
            vtx1[ringIx] = -(-((i + j >> 2) - i) + j) + g_viewCenterY;
            vtx3[ringIx] = ((i - j >> 2) + g_viewCenterY) - i + j;
        }
    }
    ringIx = 0;
    do {
        polyB[0] = vtx0[ringIx];
        polyB[1] = vtx1[ringIx];
        polyB[2] = vtx2[ringIx];
        polyB[3] = vtx3[ringIx];
        polyB[4] = vtx2[ringIx + 1];
        polyB[5] = vtx3[ringIx + 1];
        polyB[6] = vtx0[ringIx + 1];
        polyB[7] = vtx1[ringIx + 1];
        drawPolygonOutline(g_sphereColor, 4, polyB, ringIx + 0x70);
        ringIx++;
    } while (ringIx < 16);
}
