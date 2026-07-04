/* eninput.c — input handling, compiled with /Gs */
#include "slot.h"
#include <dos.h>
#include "pointers.h"
#include "log.h"
#include "endata.h"
#include "eninput.h"
#include "shared/common.h"

void clearKeybuf(void) {
    while (misc_checkKeyBuf() == 0) {
        misc_getKey();
    }
}

void waitForKeyOrJoy(void) {
    int16 key;
    if (commData->setupUseJoy == 1) {
        do {
            if (misc_checkKeyBuf() == 0) {
                break;
            }
        } while (misc_readJoystick(0) == 0);
        if (misc_checkKeyBuf() != 0) {
            goto done;
        }
    }
    key = misc_getKey();
done:
    if (key == KEYCODE_ALTQ || quitFlag != 0) {
        cleanup();
        if (quitFlag != 0) {
            restoreCbreakHandler();
        }
        exit(0);
    }
}
