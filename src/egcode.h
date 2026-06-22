#ifndef F15_SE2_EGCODE
#define F15_SE2_EGCODE
/* assembly routines (egcode.asm/egseg*.asm) called from C */
#include "inttype.h"
#include "pointers.h"
#include "egtypes.h"

int loadF15DgtlBin();
void setupDac();
int fixedMulQ14(int a, int b);
int cosine(int angle);
int sine(int angle);
void restoreCbreakHandler();
void runGameLoop();
void gameMainLoop();
void advanceFrameTick();
int __cdecl drawCenteredLabelBox(int panel, char *text);
int createFile(const char *path, int attr);
void closeFile(int handle);
int readFile1(int handle, int count, int bufOffset);
int readFile2(int handle, int count, int bufOffset, int bufSegment);
int writeFileAtRaw(int handle, int count, int bufOffset, int bufSegment, int offsetAddend);
void picBlit(int handle, int unk);
void pascal shiftLongLeftInPlace(int count, long *ptr);
void pascal shiftLongRightInPlace(int count, long *ptr);
int far drawPolygonOutline(int fillColor, int pointCount, int* points, int edgeColor);
void installDivZeroHandler();
void installDivZeroVector();
int far drawFlatHorizon(int);
void storeObjTransformByOpcode();
int far advanceModelPointerLod();
int far renderSortedListFar();
int far rotatePoint3dFar();
void rotatePoint3d();
int far transformModelVerticesFar();
int far projectModelEdgesFar();
int far buildRotationMatrixFar(int16* matrix, int angleX, int angleY, int angleZ);
int far multiplyMatrix3x3Far(int matA, int matB, int16* result);
int far drawModelDisplayList();
int far fillSpanRect(int16* dst, int left, int top, int right, int bottom);
int far drawClipLineGlobal();
int far flushSpanDirtyRect();
int far resetScanlineSpans();
int far clipAndRasterizeEdge();
void __cdecl __far setupInstrumentLayoutFar();
void __cdecl __far drawInstrumentGaugesFar();
int far initJoystickCalibration();
void seedJoystickBaseline();
int far readCalibratedJoystick();
void readJoystickHardware();
void computeJoystickAxis();
int far restoreJoystickData(uint8 FAR *ptr);
void far copyJoystickData(uint8 FAR *ptr);
int far setInt9Handler();
int far restoreInt9Handler();
int int9Handler();
extern long _aNlmul(long, long);

void setupOverlaySlots(uint16 addr);
void installCBreakHandler();
void setTimerIrqHandler();
void restoreTimerIrqHandler();
#ifdef NO_ASM
/* per-tick game work + its registration hook (shared/timer.c + egsys.c); the
 * verify ASM build runs egcode.asm's own timer ISR instead, so this is NO_ASM. */
void setTimerTickHook(void (far *fn)(void));
void far egAdvanceFrameTick(void);
#endif
int getTimeOfDay();
int __cdecl openFile(const char *path, int mode);

#ifdef NO_ASM
void far projectSceneObject(char far *model, int yaw, int pitch, int roll, int posX, int posY, int posZ);
#else
void far projectSceneObject();
#endif
#if defined(MSDOS)
extern int rand();
#endif

#endif /* F15_SE2_EGCODE */
