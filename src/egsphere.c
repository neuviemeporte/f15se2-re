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
void drawProjectionSphere(int arg_0)
{
    int p;
    int a;
    int b[17];
    int c[17];
    int d[17];
    int e[17];
    int f[8];
    int g;

    if (*(char *)&g_detailLevel < 3) {
        drawFlatHorizon(arg_0);
        return;
    }
    {
        register int i;
        a = 0;
        do {
            i = a + a;
            *((int *)((char *)g_sphereRingRadii + i)) = *((int *)((char *)&g_sphereRingTable + i));
            a++;
        } while (a < 16);
    }
    g_sphereTiltZ = -g_spherePitch;
    p = (int)(((long)g_sphereRadius << 8) / (long)(g_sphereDistZ < 0x200 ? 0x200 : g_sphereDistZ));
    if (g_extraScaleShift != 0) {
        p <<= g_extraScaleShift;
    }
    if (g_halfScaleRender != 0) {
        p >>= 1;
    }
    {
        register int i;
        register int j;
        for (a = 0; a < 17; a++) {
            if (a < 16) {
                g = g_sphereRingRadii[a] + p;
            } else {
                g = 0x5848;
            }
            i = fixedMulQ14(-0x5848, g_sphereRoll);
            j = fixedMulQ14(g, g_sphereTiltZ);
            b[a] = (g_viewCenterX + i) - j;
            d[a] = -i + g_viewCenterX - j;
            i = fixedMulQ14(g, g_sphereRoll);
            j = fixedMulQ14(-0x5848, g_sphereTiltZ);
            c[a] = -(-((i + j >> 2) - i) + j) + g_viewCenterY;
            e[a] = ((i - j >> 2) + g_viewCenterY) - i + j;
        }
    }
    a = 0;
    do {
        f[0] = b[a];
        f[1] = c[a];
        f[2] = d[a];
        f[3] = e[a];
        f[4] = d[a + 1];
        f[5] = e[a + 1];
        f[6] = b[a + 1];
        f[7] = c[a + 1];
        drawPolygonOutline(g_sphereColor, 4, f, a + 0x60);
        a++;
    } while (a < 16);
    g_sphereRingRadii[0] = g_viewPosZ / 0x200;
    a = 1;
    do {
        g_sphereRingRadii[a] = g_viewPosZ / ((16 - a) * 0x20) - g_sphereRingRadii[0];
        a++;
    } while (a < 16);
    g_sphereRingRadii[0] = 0;
    {
        register int i;
        register int j;
        for (a = 0; a < 17; a++) {
            if (a < 16) {
                g = p - g_sphereRingRadii[a];
            } else {
                g = -0x5848;
            }
            i = fixedMulQ14(-0x5848, g_sphereRoll);
            j = fixedMulQ14(g, g_sphereTiltZ);
            b[a] = (g_viewCenterX + i) - j;
            d[a] = -i + g_viewCenterX - j;
            i = fixedMulQ14(g, g_sphereRoll);
            j = fixedMulQ14(-0x5848, g_sphereTiltZ);
            c[a] = -(-((i + j >> 2) - i) + j) + g_viewCenterY;
            e[a] = ((i - j >> 2) + g_viewCenterY) - i + j;
        }
    }
    a = 0;
    do {
        f[0] = b[a];
        f[1] = c[a];
        f[2] = d[a];
        f[3] = e[a];
        f[4] = d[a + 1];
        f[5] = e[a + 1];
        f[6] = b[a + 1];
        f[7] = c[a + 1];
        drawPolygonOutline(g_sphereColor, 4, f, a + 0x70);
        a++;
    } while (a < 16);
}
