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
void callLoad3DAll() { }

// === Joystick/Input Stubs ===
int far initJoystickCalibration() { return 0; }
void seedJoystickBaseline() { }
/* Joystick HW is out of scope; the real routine fills joyAxes[] with the
 * calibrated, centred axis values. The do-nothing stub left joyAxes[] at 0,
 * which the flight model reads as full deflection (g_rollInput/g_pitchInput =
 * (0>>4)-8 = -8) -> plane pegged up-and-left, spins out, and the wild attitude
 * blows up the 3D camera. Return the neutral centre (0x80) so the plane flies
 * level when no joystick is present. */
int far readCalibratedJoystick() { joyAxes[0] = 0x80; joyAxes[1] = 0x80; return 0; }
void readJoystickHardware() { }
void computeJoystickAxis() { }
int far restoreJoystickData(uint8 FAR *ptr) { return 0; }

// === Interrupt/Handler Stubs ===
int far setInt9Handler() { return 0; }

/* --- functions declared in egcode.h --- */
int __cdecl drawCenteredLabelBox(int panel, char *text) { return 0; }
int far restoreInt9Handler() { return 0; }

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
