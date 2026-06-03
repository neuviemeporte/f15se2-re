// seg000 optimized code (/Ot)
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>


void sub_121C6() {
    load3DAll();
}

// ==== seg000:0x21ca ====
//
void render3DView(int arg_0, int arg_2, int arg_4, long arg_6, long arg_a, long arg_e, int arg_12, int arg_14, int arg_16, int arg_18) {
    var_134[7] = arg_14;
    var_134[8] = arg_14 + arg_18 - 1;
    var_134[9] = arg_12;
    var_134[10] = arg_12 + arg_16 - 1;
    *var_134 = gfx_getDisplayPage() & 0xFF;
    waitFrameSync(var_595);
    TRACE(("121CA:1"));
    var_134[2] = (unsigned char)((char *)word_3419C)[word_3BE98 & 0xFF];
    setup3DTransform((char *)var_134, arg_0, arg_2, arg_4, 0, 0, (int)arg_e, 1);
    TRACE(("121CA:2"));
    projectObjects(arg_0, arg_2, (int)arg_6, (int)(arg_6 >> 16), (int)arg_a, (int)(arg_a >> 16), (int)arg_e, (int)(arg_e >> 16));
    TRACE(("121CA:3"));
    sub_1A9F8();
    TRACE(("121CA:4"));
#if defined(DEBUG) && defined(DISABLE_3D)
    /* rasterize3DWorld renders the 3D world objects and hangs in loc_0BE7 on certain
       geometry. Skip ONLY this; the surrounding calls set up the gfx clip/
       viewport and draw the HUD, which must still run. */
#else
    rasterize3DWorld();
#endif
    TRACE(("121CA:5"));
    sub_1B147();
    TRACE(("121CA:6"));
    *(char *)&var_135 ^= 1;
}

// ==== seg000:0x2278 ====
void waitFrameSync(int arg_0) {
    uint8 var_2;
    if (arg_0 > 0) {
        var_2 = (uint8)arg_0 + byte_3790C[0];
#ifdef DEBUG
        {
            unsigned long spins = 0;
            uint8 start = byte_3790C[0];
            while (var_2 != byte_3790C[0]) {
                if (++spins > 3000000UL) {
                    TRACE_KEY(("12278: SPIN TIMEOUT arg=%d want=%d cur=%d start=%d (ISR frozen?)", arg_0, (int)var_2, (int)byte_3790C[0], (int)start));
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
void copySomeMem(int arg_0) {
    memcpy(word_3419C, (char *)word_339B4 + arg_0 * 0x10, 0x10);
}

// ==== seg000:0x3224 ====
