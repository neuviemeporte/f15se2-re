/* eninput.c — input handling, compiled with /Gs */
#include "pointers.h"
#include "debug.h"
#include "end.h"
#include "shared/common.h"

void waitForKeyOrJoy(void) {
    int key;
    TRACE(("waitForKeyOrJoy"));
    if (commData->setupUseJoy == 1) {
        do {
            if (misc_jump_5a_keybuf() == 0) {
                break;
            }
        } while (misc_jump_5d_readJoy(0) == 0);
        if (misc_jump_5a_keybuf() != 0) {
            goto done;
        }
    }
    key = misc_jump_5b_getkey();
done:
    if (key == KEYCODE_ALTQ || quitFlag != 0) {
        cleanup();
        if (quitFlag != 0) {
            restoreCbreakHandler();
        }
        exit(0);
    }
}
