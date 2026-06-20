// seg000 optimized code (/Ot)
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

void projectObjects(int, int, int, int, int, int, int, int);


void loadRegion3D() {
    load3DAll();
}

// ==== seg000:0x21ca ====
//
void render3DView(int camX, int camY, int camZ, long arg_6, long arg_a, long arg_e, int clipLeft, int clipTop, int clipWidth, int clipHeight) {
    g_viewParams[7] = clipTop;
    g_viewParams[8] = clipTop + clipHeight - 1;
    g_viewParams[9] = clipLeft;
    g_viewParams[10] = clipLeft + clipWidth - 1;
    *g_viewParams = gfx_getDisplayPage() & 0xFF;
    waitFrameSync(g_frameSyncWait);
    TRACE(("121CA:1"));
    g_viewParams[2] = (unsigned char)((char *)colorLut)[g_skyColorIndex & 0xFF];
    setup3DTransform((char *)g_viewParams, camX, camY, camZ, 0, 0, (int)arg_e, 1);
    TRACE(("121CA:2"));
    projectObjects(camX, camY, (int)arg_6, (int)(arg_6 >> 16), (int)arg_a, (int)(arg_a >> 16), (int)arg_e, (int)(arg_e >> 16));
    TRACE(("121CA:3"));
    updateTargetLock();
    TRACE(("121CA:4"));
    rasterize3DWorld();
    TRACE(("121CA:5"));
    drawHudWorldOverlay();
    TRACE(("121CA:6"));
    g_renderPageToggle ^= 1;
}

// ==== seg000:0x2278 ====
void waitFrameSync(int frames) {
    uint8 var_2;
    if (frames > 0) {
        var_2 = (uint8)frames + g_timerTickByte[0];
#ifdef DEBUG
        {
            unsigned long spins = 0;
            uint8 start = g_timerTickByte[0];
            while (var_2 != g_timerTickByte[0]) {
                if (++spins > 3000000UL) {
                    TRACE_KEY(("12278: SPIN TIMEOUT arg=%d want=%d cur=%d start=%d (ISR frozen?)", frames, (int)var_2, (int)g_timerTickByte[0], (int)start));
                    break;
                }
            }
        }
#else
        while (var_2 != g_timerTickByte[0]) {}
#endif
    }
}

// ==== seg000:0x229a loadColorPalette ====
void loadColorPalette(int idx) {
    memcpy(colorLut, (char *)g_colorPalettes + idx * 0x10, 0x10);
}

// ==== seg000:0x3224 ====
