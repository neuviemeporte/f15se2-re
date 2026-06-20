#include "egame.h"
#include "inttype.h"
#include "struct.h"
#include "comm.h"
#include "pointers.h"
#include <stdio.h>
#include <dos.h>

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
int getTimeOfDay(void) { return 0; }

/* --- functions declared in egame.h --- */
int far advanceModelPointerLod() { return 0; }
int far buildRotationMatrixFar(int16* matrix, int angleX, int angleY, int angleZ) { return 0; }
int far clipAndRasterizeEdge() { return 0; }
void closeFile(int handle) { }
int cosine(int angle) { return 0; }
int createFile(const char *path, int attr) { return 0; }
int __cdecl drawCenteredLabelBox(int panel, char *text) { return 0; }
int far drawClipLineGlobal() { return 0; }
int far drawModelDisplayList() { return 0; }
int far drawPolygonOutline(int fillColor, int pointCount, int* points, int edgeColor) { return 0; }
int far fillSpanRect(int16* dst, int left, int top, int right, int bottom) { return 0; }
int fixedMulQ14(int a, int b) { return 0; }
int far flushSpanDirtyRect() { return 0; }
int far multiplyMatrix3x3Far(int matA, int matB, int16* result) { return 0; }
int __cdecl openFile(const char *path, int mode) { return 0; }
void picBlit(int handle, int page) {}
int far projectModelEdgesFar() { return 0; }
void far projectSceneObject(char *model, int yaw, int pitch, int roll, int posX, int posY, int posZ) {}
int readAxisInput(int axisIdx) { return 0; }
int readFile1(int handle, int count, int bufOffset) { return 0; }
int readFile2(int handle, int count, int bufOffset, int bufSegment) { return 0; }
int far resetScanlineSpans() { return 0; }
int far restoreInt9Handler() { return 0; }
void setTimerIrqHandler() { }
void pascal shiftLongLeftInPlace(int count, long *ptr) {}
void pascal shiftLongRightInPlace(int count, long *ptr) {}
int sine(int angle) { return 0; }
int far drawFlatHorizon(int) { return 0; }
int far transformAndCullObjectFar(int, int, int) { return 0; }
int far rotatePoint3dFar() { return 0; }
int far transformModelVerticesFar() { return 0; }
void __cdecl __far setupInstrumentLayoutFar() {}
int writeFileAtRaw(int handle, int count, int bufOffset, int bufSegment, int offsetAddend) { return 0; }
int far renderSortedListFar() { return 0; }

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

/* --- Data symbols referenced by stepFlightModel. The DOS build defines these
   in ASM; the 64-bit stub build needs C definitions to link. --- */

int audio_setEnginePitch(int knots, int thrust) { return 0; }
