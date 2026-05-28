/* Input key reading */
#include "start.h"
#include "const.h"
#include "slot.h"
#include "comm.h"
#include "shared/util.h"
#include "debug.h"

#include <dos.h>

// 0x25e4
int readInputKey() {
    int key;
    if (commData->setupUseJoy == 1) { // 25f5
        do {
            if (misc_jump_5a_keybuf() == 0) break;
        } while (misc_jump_5d_readJoy(0) == 0);
        // 260d
        if (misc_jump_5a_keybuf() != 0) { // 2616
            key = KEYCODE_ENTER;
            goto checkKey;
        }
    }
    // 261e
    key = misc_jump_5b_getkey();
    // 2626
checkKey:
    if (key == KEYCODE_ALTQ || cbreakHit != 0) { // 262d
        cleanup();
        if (cbreakHit != 0) restoreCbreakHandler();
        // 2644
        exit(0);
    }
    // 264a
    return key;
}
