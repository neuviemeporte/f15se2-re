/*
 * timer.c - Timer ISR for NO_ASM build.
 *
 * Hooks INT 08h (timer tick) to increment timerCounter and chains to
 * the original BIOS handler.
 */

#include "inttype.h"
#include "pointers.h"
#include <dos.h>

extern uint8 timerCounter;
extern uint8 timerCounter2;
extern uint8 timerCounter3;
extern uint8 timerCounter4;
extern uint8 timerHandlerInstalled;

static void (interrupt far *oldTimerIsr)(void);

static void interrupt far timerIrqHandler(void)
{
    timerCounter++;
    timerCounter2++;
    timerCounter3++;
    timerCounter4++;
    _chain_intr(oldTimerIsr);
}

void setTimerIrqHandler(void)
{
    oldTimerIsr = _dos_getvect(0x08);
    _dos_setvect(0x08, timerIrqHandler);
    timerHandlerInstalled = 1;
}

void restoreTimerIrqHandler(void)
{
    _dos_setvect(0x08, oldTimerIsr);
    timerHandlerInstalled = 0;
}
