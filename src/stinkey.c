/* Input key reading */
#include "start.h"
#include "const.h"
#include "slot.h"
#include "comm.h"
#include "shared/util.h"
#include "debug.h"

#include <dos.h>

int readInputKey() {
    int key;
    if (commData->setupUseJoy == 1) {
        do {
            if (misc_jump_5a_keybuf() == 0) break;
        } while (misc_jump_5d_readJoy(0) == 0);
        if (misc_jump_5a_keybuf() != 0) {
            key = KEYCODE_ENTER;
            goto checkKey;
        }
    }
    key = misc_jump_5b_getkey();
checkKey:
    if (key == KEYCODE_ALTQ || cbreakHit != 0) {
        cleanup();
        if (cbreakHit != 0) restoreCbreakHandler();
        exit(0);
    }
    return key;
}
