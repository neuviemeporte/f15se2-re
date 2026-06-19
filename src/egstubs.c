#include "egame.h"
#include "inttype.h"
#include "struct.h"
#include "comm.h"
#include "pointers.h"
#include <stdio.h>
#include <dos.h>

char far byte_228D0[] = { 0 };
char far byte_2D6A4[] = { 0 };
int loadF15DgtlBin() { return 0; }
void setupOverlaySlots(uint16 addr) { }
void callLoad3DAll() { }

// === Joystick/Input Stubs ===
int initJoystickCalibration() { return 0; }
void seedJoystickBaseline() { }
int readCalibratedJoystick() { return 0; }
void readJoystickHardware() { }
void computeJoystickAxis() { }
int far restoreJoystickData(uint8 FAR *ptr) { return 0; }
void far copyJoystickData(uint8 FAR *ptr) {}

// === Interrupt/Handler Stubs ===
void installCBreakHandler() {}
void restoreCBreakHandler() { }
int setInt9Handler() { return 0; }
void runGameLoop() { }
void restoreTimerIrqHandler() { }

// Stubs matching undefined references from egmain.c
void setupDac() {}
int gfx_getModeflag() { return 0; }

int getTimeOfDay(void)
{
    return 0;
}

/* === Auto-generated link stubs (undefined references in egame build) === */

/* --- data globals --- */
uint8 aA[1];
uint8 byte_3419A[1];
uint8 byte_3419C[1];
uint8 byte_3419F[1];
uint8 byte_37C24;
uint8 byte_3790C[1];
int16 g_viewZ;
uint8 joyAxes[1];
char strBuf[1];
struct MapTarget g_planes[1];
/* --- data referenced by drawHudWorldOverlay (egui.c) --- */
char unk_34121[1];
uint8 var_190;
int16 var_198;
char far *var_200;
int16 var_279;
int16 var_282;
uint16 var_383;
int8 var_456;
uint16 uvar_547;
struct Waypoint waypoints[1];
int16 word_339B4[1];
int16 word_33B9C[64];
int16 word_3419C[1];
int16 word_34276;
int16 word_34684[64];
int16 word_34686[64];
int32 word_34868[121];
int32 word_34A4C[121];
int16 word_37348[64];
int16 word_3734A[64];
int16 word_38202;
int16 word_38F70;   /* PIC/LZW decoder workspace head — must stay in egslots.asm */
int16 word_3AA5C[64];
int16 word_3B7E0;
int16 word_3B7E2;
int16 word_3B7E4;
int16 word_3B7E8;
struct Matrix3dEntry7 *word_3B7EC;

/* --- functions declared in egame.h --- */
int far advanceModelPointerLod() { return 0; }
int far buildRotationMatrixFar(int16* param_1, int param_2, int param_3, int param_4) { return 0; }
int far clipAndRasterizeEdge() { return 0; }
void closeFile(int arg_0) { }
int cosine(int) { return 0; }
int createFile(const char *arg_0, int arg_1) { return 0; }
int __cdecl drawCenteredLabelBox(int, char *) { return 0; }
int far drawClipLineGlobal() { return 0; }
int far drawModelDisplayList() { return 0; }
int far drawPolygonOutline(int, int, int*, int) { return 0; }
int far fillSpanRect(int16* param_1, int param_2, int param_3, int param_4, int param_5) { return 0; }
int fixedMulQ14(int arg_0, int arg_2) { return 0; }
int far flushSpanDirtyRect() { return 0; }
int far multiplyMatrix3x3Far(int param_1, int param_2, int16* param_3) { return 0; }
int __cdecl openFile(const char *, int) { return 0; }
void picBlit(int handle, int unk) {}
int far projectModelEdgesFar() { return 0; }
void far projectSceneObject(char *, int, int, int, int, int, int) {}
int readAxisInput(int param_1) { return 0; }
int readFile1(int arg_0, int arg_1, int arg_2) { return 0; }
int readFile2(int arg_0, int arg_1, int arg_2, int arg_3) { return 0; }
int far resetScanlineSpans() { return 0; }
int far restoreInt9Handler() { return 0; }
void setTimerIrqHandler() { }
void pascal shiftLongLeftInPlace(int count, long *ptr) {}
void pascal shiftLongRightInPlace(int count, long *ptr) {}
int sine(int arg_0) { return 0; }
int far sub_1FEEC(int) { return 0; }
int far sub_202C7(int, int, int) { return 0; }
int far sub_2044A() { return 0; }
int far sub_20658() { return 0; }
void __cdecl __far sub_21A7E() {}
int writeFileAtRaw(int arg_0, int arg_1, int arg_2, int arg_3, int arg_4) { return 0; }
int far sub_202F6() { return 0; }

/* --- slot.h overlay jump stubs (egame doesn't link shared/ovlstub.c) --- */
int misc_getKey() { return 0; }
int misc_readJoystick(int16 a) { return 0; }
int audio_setup(int16 a, int16 b) { return 0; }
int audio_shutdown(void) { return 0; }
int audio_playSound(int a) { return 0; }
int audio_engineDroneOn() { return 0; }
int audio_engineDroneOff() { return 0; }
int audio_playSample(int a) { return 0; }

/* projectObjects: eg3dview.c calls the 8-int form; eg3dproj.c defines a
   different (int,int,long,long,long) overload. Stub the called form. */
void projectObjects(int a,int b,int c,int d,int e,int f,int g,int h) {}

/* --- Data symbols referenced by stepFlightModel (moved from egame_rc.asm
   to C in egflight.c). The DOS build defines these in egame_rc.asm's DATA
   segment; the 64-bit stub build needs C definitions to link. --- */
uint8 joyAxes_2[1];
uint8 unk_38FD0[32];       /* g-meter string buffer */

int audio_setEnginePitch(int knots, int thrust) { return 0; }
