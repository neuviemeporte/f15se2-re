/*
 * util.c - Utility functions shared between start.exe and end.exe
 *
 * These functions appear identically in both executables and are
 * extracted here to avoid duplication.
 */

#include "util.h"

#include "../pointers.h"
#include <dos.h>

/* extern declarations needed by these functions */
extern int far gfx_drawString(int16 *pageNum, const char *string);
extern int far gfx_setFont(uint16 ch, uint16 font);
extern void far misc_jump_5e_clearKeyFlags(void);
extern uint8 timerHandlerInstalled;
void restoreTimerIrqHandler(void);
void intDispatch(int intNum, uint8 *inRegs, uint8 *outRegs);

void cleanup()
{
    uint8 regs[0xe];
    if (timerHandlerInstalled == 1) {
        restoreTimerIrqHandler();
    }
    regs[1] = 0; // func 0
    regs[0] = 3; // mode 3 (80x25)
    intDispatch(IRQ_VIDEO, regs, regs);
    misc_jump_5e_clearKeyFlags();
}
