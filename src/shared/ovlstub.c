/*
 * ovlstub.c - Overlay slot stubs for misc/audio overlays (NO_ASM build).
 * These replace the 5-byte far-jump entries that get patched by setupOverlaySlots.
 */

#include "inttype.h"
#include "pointers.h"
#include "comm.h"
#include <stdio.h>
#include <dos.h>
#include <conio.h>

static int g_keyCalls = 0;
static void ovldbg(const char *msg)
{
    FILE *f = fopen("NOASM.LOG", "a");
    if (f) { fputs(msg, f); fputs("\r\n", f); fclose(f); }
}

uint8  hercFlag = 0;
uint8  exitCode = 0;
int16  fileHandle = 0;

/* Misc input overlay slots - real DOS keyboard I/O */
int far cdecl misc_jump_5a_keybuf(void) {
    /* Check if key available. Return 0 if yes, 0xFFFF if not. */
    if (kbhit())
        return 0;
    return 0xFFFF;
}
int far cdecl misc_jump_5b_getkey(void) {
    /* INT 16h AH=00h: read key from buffer.
       Returns scan code in AH, ASCII in AL. */
    union REGS regs;
    regs.h.ah = 0x00;
    int86(0x16, &regs, &regs);
    return regs.x.ax;
}
int far cdecl misc_jump_5d_readJoy(void) { return 0; }
int far cdecl misc_jump_5e_clearKeyFlags(void) { ovldbg("clearKeyFlags"); return 0; }

/* Audio overlay slots */
int far cdecl audio_jump_64(void) { return 0; }
int far cdecl audio_jump_65(void) { return 0; }
int far cdecl audio_jump_67(void) { return 0; }
