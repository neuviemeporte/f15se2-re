// seg000 optimized code (/Ot)
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

int projectObjects(int, int, int, int, int, int, int, int);


void sub_121C6() {
    load3DAll();
}

// ==== seg000:0x21ca ====
//
void render3DView(int camX, int camY, int camZ, long arg_6, long arg_a, long arg_e, int clipLeft, int clipTop, int clipWidth, int clipHeight) {
    var_134[7] = clipTop;
    var_134[8] = clipTop + clipHeight - 1;
    var_134[9] = clipLeft;
    var_134[10] = clipLeft + clipWidth - 1;
    *var_134 = gfx_getDisplayPage() & 0xFF;
    waitFrameSync(var_595);
    TRACE(("121CA:1"));
    var_134[2] = (unsigned char)((char *)word_3419C)[word_3BE98 & 0xFF];
    setup3DTransform((char *)var_134, camX, camY, camZ, 0, 0, (int)arg_e, 1);
    TRACE(("121CA:2"));
    projectObjects(camX, camY, (int)arg_6, (int)(arg_6 >> 16), (int)arg_a, (int)(arg_a >> 16), (int)arg_e, (int)(arg_e >> 16));
    TRACE(("121CA:3"));
    updateTargetLock();
    TRACE(("121CA:4"));
#if defined(DEBUG) && defined(DISABLE_3D)
    /* Legacy debug switch to skip the 3D world renderer. The hang it worked
       around was an unrelocated INT 0 (divide-error) vector segment in
       installDivZeroHandler; fixed in egseg1.asm (divZeroStub / SEG). */
#else
    rasterize3DWorld();
#endif
    TRACE(("121CA:5"));
    drawHudWorldOverlay();
    TRACE(("121CA:6"));
    *(char *)&var_135 ^= 1;
}

// ==== seg000:0x2278 ====
void waitFrameSync(int frames) {
    uint8 var_2;
    if (frames > 0) {
        var_2 = (uint8)frames + byte_3790C[0];
#ifdef DEBUG
        {
            unsigned long spins = 0;
            uint8 start = byte_3790C[0];
            while (var_2 != byte_3790C[0]) {
                if (++spins > 3000000UL) {
                    TRACE_KEY(("12278: SPIN TIMEOUT arg=%d want=%d cur=%d start=%d (ISR frozen?)", frames, (int)var_2, (int)byte_3790C[0], (int)start));
                    break;
                }
            }
        }
#else
        while (var_2 != byte_3790C[0]) {}
#endif
    }
}

// ==== seg000:0x229a loadColorPalette ====
void copySomeMem(int idx) {
    memcpy(word_3419C, (char *)word_339B4 + idx * 0x10, 0x10);
}

// ==== seg000:0x3224 ====
