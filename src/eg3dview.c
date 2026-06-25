// seg000 optimized code (/Ot)
#include "eg3dload.h"
#include "eg3dmap.h"
#include "eg3dproj.h"
#include "eg3dview.h"
#include "egdata.h"
#include "egtarget.h"
#include "egtypes.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>


void loadRegion3D() {
    load3DAll();
}

// ==== seg000:0x21ca ====
//
void render3DView(int camX, int camY, int camZ, long worldX, long worldY, long worldZ, int clipLeft, int clipTop, int clipWidth, int clipHeight) {
    g_viewParams[7] = clipTop;
    g_viewParams[8] = clipTop + clipHeight - 1;
    g_viewParams[9] = clipLeft;
    g_viewParams[10] = clipLeft + clipWidth - 1;
    *g_viewParams = gfx_getDisplayPage() & 0xFF;
    waitFrameSync(g_frameSyncWait);
    TRACE(("121CA:1"));
    g_viewParams[2] = (unsigned char)((char *)colorLut)[g_skyColorIndex & 0xFF];
    setup3DTransform(g_viewParams, camX, camY, camZ, 0, 0, (int)worldZ, 1);
    TRACE(("121CA:2"));
    projectObjects(camX, camY, worldX, worldY, worldZ);
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
    uint8 targetTick;
    if (frames > 0) {
        targetTick = (uint8)frames + g_timerTickByte[0];
#ifdef DEBUG
        {
            unsigned long spins = 0;
            uint8 start = g_timerTickByte[0];
            while (targetTick != g_timerTickByte[0]) {
                if (++spins > 3000000UL) {
                    TRACE_KEY(("12278: SPIN TIMEOUT arg=%d want=%d cur=%d start=%d (ISR frozen?)", frames, (int)targetTick, (int)g_timerTickByte[0], (int)start));
                    break;
                }
            }
        }
#else
        while (targetTick != g_timerTickByte[0]) {}
#endif
    }
}

// ==== seg000:0x229a loadColorPalette ====
void loadColorPalette(int idx) {
    memcpy(colorLut, g_colorPalettes + idx * 16, 16);
}

// ==== seg000:0x3224 ====
