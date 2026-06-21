/*
 * timer.c - Timer ISR for NO_ASM build.
 *
 * Hooks INT 08h (timer tick) to increment timerCounter and chains to
 * the original BIOS handler. Reprograms the PIT to ~60 Hz (matching
 * the original game's calibrated timer speed).
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

/* PIT divisor: 0x4DAE = 19886 -> 1193182/19886 = ~60 Hz
 * This matches the original game's default calibration value.
 * The BIOS expects 18.2 Hz, so we chain every Nth tick.
 */
#define PIT_DIVISOR 0x4DAE
#define CHAIN_INTERVAL 3  /* chain to BIOS every 3 ticks (~20 Hz, close to 18.2) */

static uint8 chainCount = 0;

/* Optional per-tick game callback. egame registers advanceFrameTick here (the
 * DAC colour-cycle + frame-timing tick that egcode.asm's own timer ISR runs but
 * this shared C ISR otherwise omits). NULL for start/end, which need no extra
 * per-tick work. */
static void (far *gameTickHook)(void) = 0;

void setTimerTickHook(void (far *fn)(void))
{
    gameTickHook = fn;
}

static void interrupt far timerIrqHandler(void)
{
    timerCounter++;
    timerCounter2++;
    timerCounter3++;
    timerCounter4++;
    if (gameTickHook != 0)
        gameTickHook();
    chainCount++;
    if (chainCount >= CHAIN_INTERVAL) {
        chainCount = 0;
        _chain_intr(oldTimerIsr);
    } else {
        /* Send EOI manually since we're not chaining */
        outp(0x20, 0x20);
    }
}

void setTimerIrqHandler(void)
{
    oldTimerIsr = _dos_getvect(0x08);
    _dos_setvect(0x08, timerIrqHandler);
    /* Reprogram PIT channel 0 to ~60 Hz */
    outp(0x43, 0x36);      /* channel 0, lo/hi, mode 3 (square wave) */
    outp(0x40, PIT_DIVISOR & 0xFF);  /* low byte */
    outp(0x40, PIT_DIVISOR >> 8);    /* high byte */
    timerHandlerInstalled = 1;
}

void restoreTimerIrqHandler(void)
{
    /* Restore PIT to default 18.2 Hz (divisor 0 = 65536) */
    outp(0x43, 0x36);
    outp(0x40, 0x00);
    outp(0x40, 0x00);
    _dos_setvect(0x08, oldTimerIsr);
    timerHandlerInstalled = 0;
}
