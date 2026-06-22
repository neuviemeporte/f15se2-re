#include "egtypes.h"
#include "egcode.h"
#include "egdata.h"
#include "inttype.h"
#include "struct.h"
#include "comm.h"
#include "pointers.h"
#include <stdio.h>
#include <dos.h>

int loadF15DgtlBin() { return 0; }

// === Joystick/Input Stubs ===
int far initJoystickCalibration() { return 0; }
void seedJoystickBaseline() { }
int far readCalibratedJoystick() { joyAxes[0] = 0x80; joyAxes[1] = 0x80; return 0; }
void readJoystickHardware() { }
void computeJoystickAxis() { }
int far restoreJoystickData(uint8 FAR *ptr) { return 0; }

/* setInt9Handler/restoreInt9Handler (the keyboard ISR) live in eginput.c. */

/* --- functions declared in egcode.h --- */
int __cdecl drawCenteredLabelBox(int panel, char *text) { return 0; } // Real one is also a nop

/* --- sound-driver slots with no shared C implementation (egame's sound asm;
   ovlimpl.c only covers audio_setup/audio_shutdown/audio_playIntro) --- */
int FAR CDECL audio_playSound(int a) { return 0; }
int FAR CDECL audio_engineDroneOn(void) { return 0; }
int FAR CDECL audio_engineDroneOff(void) { return 0; }
int FAR CDECL audio_playSample(int a) { return 0; }

/* --- Data symbols referenced by stepFlightModel. The DOS build defines these
   in ASM; the 64-bit stub build needs C definitions to link. --- */

int FAR CDECL audio_setEnginePitch(int knots, int thrust) { return 0; }

/* --- Data globals owned by the shared slot/basics impls. start/end define
   these in stdata.c/endata.c; egame's data lives in egslots.asm (absent in the
   NO_ASM build), so the C stand-in build provides them here. Types must match
   the extern declarations in shared/timer.c, gfximpl.c, picimpl.c. --- */
uint8 timerCounter = 0;
uint8 timerCounter2 = 0;
uint8 timerCounter3 = 0;
uint8 timerCounter4 = 0;
uint8 timerHandlerInstalled = 0;
int16 lineX1 = 0;
int16 lineX2 = 0;
int16 lineY1 = 0;
int16 lineY2 = 0;
uint8 picDecodedRowBuf[0x140] = {0};
