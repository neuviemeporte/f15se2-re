/*
 * timer.c - Stub implementations of shared timer routines for NO_ASM build.
 *
 * The real implementation hooks INT 08h and reprograms the PIT (ports 0x40-0x43).
 * These stubs just provide the symbols so the program links without crashing.
 */

#include "inttype.h"
#include "pointers.h"
#include <dos.h>

/* timer_setHandler.inc */
void setTimerIrqHandler(void)
{
    /* Stub: don't install custom timer in NO_ASM mode */
}

/* timer_restore.inc */
void restoreTimerIrqHandler(void)
{
    /* Stub: nothing to restore */
}
