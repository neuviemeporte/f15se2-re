/*
 * ovlimpl.c - Overlay slot implementations for misc/audio overlays (NO_ASM build).
 * These replace the 5-byte far-jump entries that get patched by setupOverlaySlots.
 */

#include "inttype.h"
#include "pointers.h"
#include "comm.h"
#include <stdio.h>
#include <dos.h>
#include <conio.h>

static int16 g_keyCalls = 0;
static void ovldbg(const char *msg) {
    FILE *f = fopen("NOASM.LOG", "a");
    if (f) {
        fputs(msg, f);
        fputs("\r\n", f);
        fclose(f);
    }
}

extern uint8 hercFlag;
extern uint8 exitCode;
extern int16 fileHandle;

/* Misc input overlay slots - real DOS keyboard I/O */
int16 FAR cdecl misc_checkKeyBuf(void) {
    /* Return 0 if a key is waiting, 0xFFFF if the buffer is empty.
     * Read the BIOS keyboard buffer head/tail (0040:001A / 0040:001C)
     * directly, matching the original MISC.EXE slot 0x5a. The C runtime's
     * kbhit() reports a phantom "key ready" at startup here (probably via the
     * INT 21h AH=0Bh stdin check), which made the splash/adv loop and
     * processPilotInput auto-advance through every screen. */
    uint16 FAR *head = (uint16 FAR *)MK_FP(0x40, 0x1A);
    uint16 FAR *tail = (uint16 FAR *)MK_FP(0x40, 0x1C);
    if (*head != *tail)
        return 0;
    return 0xFFFF;
}
int16 FAR cdecl misc_getKey(void) { /* Original: GetKey. Blocking BIOS read: scan code in AH, ASCII in AL. */
    enum { BIOS_KEYBOARD_INT = 0x16,
           BIOS_READ_KEY = 0x00 };
    union REGS biosRegs;
    biosRegs.h.ah = BIOS_READ_KEY;
    int86(BIOS_KEYBOARD_INT, &biosRegs, &biosRegs);
    return biosRegs.x.ax;
}
int16 FAR cdecl misc_readJoystick(int16 param) { return 0; }
void FAR cdecl misc_clearKeyFlags(void) { ovldbg("clearKeyFlags"); }

/* Audio overlay slots */
int16 FAR cdecl audio_setup(int16 a, int16 b) { return 0; }
int16 FAR cdecl audio_shutdown(void) { return 0; }
int16 FAR cdecl audio_playIntro(void) { return 0; }
