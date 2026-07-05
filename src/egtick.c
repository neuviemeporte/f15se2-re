/*
 * egtick.c - per-timer-tick game work for the egame C renderer (NO_ASM build).
 *
 * egcode.asm's own timer ISR (seg000:0x3ee2 advanceFrameTick) does work each
 * game tick that the shared C timer ISR (shared/timer.c) does not. The NO_ASM
 * egame registers egAdvanceFrameTick() as that ISR's tick hook (egmain.c).
 * Two effects matter to the renderer:
 *   1. Bump g_timerTickByte[0] - the tick counter waitFrameSync() busy-waits on.
 *      Without it the frame never paces: waitFrameSync returns instantly, the
 *      game loop runs unthrottled and the flight model integrates far too fast,
 *      so after the autostart warmup the plane is way past its spawn (the
 *      "wrong spawn position" symptom - it is actually a pacing bug, not a
 *      mission-init bug).
 *   2. Run the MGRAPHIC DAC fire/target colour-cycle (slot 0x2e) so animated
 *      palette entries (target markers, fire warning) pulse instead of sitting
 *      at their un-cycled base colour (the "pink marker" symptom).
 * g_frameTimingAccum is also bumped (the frame-rate pacer recalibrates against
 * it). audio_timerTick and the PIT rate-recalibration the original also did here
 * are out of scope: audio is stubbed and the C timer runs a fixed PIT rate.
 *
 * Lives in its own far code segment (/NT EGTICK_TEXT): the shared _TEXT is full,
 * and the callback is reached through a far function pointer so its segment is
 * irrelevant to the caller.
 */
#include "egtypes.h"
#include "egcode.h"
#include "egdata.h"
#include "inttype.h"
#include "slot.h"

void FAR egAdvanceFrameTick(void) {
    /* Clear the per-frame sync flag the render loop raises each iteration
     * (gameMainLoop). render3DView/setup3DTransform busy-wait on it to pace to
     * the timer tick; egcode.asm's timerIsr clears it just before calling
     * advanceFrameTick, so the C tick hook must too or the loop spins forever
     * on the second frame. */
    g_frameSyncPending = 0;
    g_timerTickByte[0]++;
    g_frameTimingAccum++;
    gfx_dacCycle();
}
