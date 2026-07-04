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
#include "log.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

void loadRegion3D() {
    load3DAll();
}

// ==== seg000:0x21ca ====
//
void render3DView(int16 camX, int16 camY, int16 camZ, int32 worldX, int32 worldY, int32 worldZ, int16 clipLeft, int16 clipTop, int16 clipWidth, int16 clipHeight) {
    g_viewParams[7] = clipTop;
    g_viewParams[8] = clipTop + clipHeight - 1;
    g_viewParams[9] = clipLeft;
    g_viewParams[10] = clipLeft + clipWidth - 1;
    *g_viewParams = gfx_getDisplayPage() & 0xFF;
    waitFrameSync(g_frameSyncWait);
    g_viewParams[2] = (uint8)((char *)colorLut)[g_skyColorIndex & 0xFF];
    setup3DTransform(g_viewParams, camX, camY, camZ, 0, 0, (int16)worldZ, 1);
    projectObjects(camX, camY, worldX, worldY, worldZ);
    updateTargetLock();
    rasterize3DWorld();
    drawHudWorldOverlay();
    g_renderPageToggle ^= 1;
}

// ==== seg000:0x2278 ====
void waitFrameSync(int16 frames) {
    uint8 targetTick;
    if (frames > 0) {
        targetTick = (uint8)frames + g_timerTickByte[0];
#ifdef DEBUG
        {
            uint32 spins = 0;
            uint8 start = g_timerTickByte[0];
            while (targetTick != g_timerTickByte[0]) {
                if (++spins > 3000000UL) {
                    LogWarn(("12278: SPIN TIMEOUT arg=%d want=%d cur=%d start=%d (ISR frozen?)", frames, (int16)targetTick, (int16)g_timerTickByte[0], (int16)start));
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
void loadColorPalette(int16 idx) {
    memcpy(colorLut, g_colorPalettes + idx * 16, 16);
}

// ==== seg000:0x3224 ====
