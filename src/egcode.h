#ifndef F15_SE2_EGCODE
#define F15_SE2_EGCODE
/* assembly routines (egcode.asm/egseg*.asm) called from C */
#include "inttype.h"
#include "pointers.h"
#include "egtypes.h"

int16 loadF15DgtlBin();
void setupDac();
int16 fixedMulQ14(int16 a, int16 b);
int16 cosine(int16 angle);
int16 sine(int16 angle);
void restoreCbreakHandler();
void runGameLoop();
void gameMainLoop();
void advanceFrameTick();
int16 __cdecl drawCenteredLabelBox(int16 panel, const char *text);
int16 createFile(const char *path, int16 attr);
void closeFile(int16 handle);
int16 readFile1(int16 handle, int16 count, int16 bufOffset);
int16 readFile2(int16 handle, int16 count, int16 bufOffset, int16 bufSegment);
int16 writeFileAtRaw(int16 handle, int16 count, int16 bufOffset, int16 bufSegment, int16 offsetAddend);
void picBlit(int16 handle, int16 unk);
void pascal shiftLongLeftInPlace(int16 count, long *ptr);
void pascal shiftLongRightInPlace(int16 count, long *ptr);
int16 far drawPolygonOutline(int16 fillColor, int16 pointCount, int16 *points, int16 edgeColor);
void installDivZeroHandler();
void installDivZeroVector();
int16 far drawFlatHorizon(int16);
void storeObjTransformByOpcode();
int16 far advanceModelPointerLod();
int16 far renderSortedListFar();
int16 far rotatePoint3dFar();
void rotatePoint3d();
int16 far transformModelVerticesFar();
int16 far projectModelEdgesFar();
int16 far buildRotationMatrixFar(int16 *matrix, int16 angleX, int16 angleY, int16 angleZ);
int16 far multiplyMatrix3x3Far(const int16 *matA, const int16 *matB, int16 *result);
int16 far drawModelDisplayList();
int16 far fillSpanRect(const int16 *dst, int16 left, int16 top, int16 right, int16 bottom);
int16 far drawClipLineGlobal();
int16 far flushSpanDirtyRect();
int16 far resetScanlineSpans();
int16 far clipAndRasterizeEdge();
void __cdecl __far setupInstrumentLayoutFar();
void __cdecl __far drawInstrumentGaugesFar();
int16 far initJoystickCalibration();
void seedJoystickBaseline();
int16 far readCalibratedJoystick();
void readJoystickHardware();
void computeJoystickAxis();
int16 far restoreJoystickData(uint8 FAR *ptr);
void far copyJoystickData(uint8 FAR *ptr);
int16 far setInt9Handler();
int16 far restoreInt9Handler();
int16 int9Handler();
extern long _aNlmul(long, long);

void setupOverlaySlots(uint16 addr);
void installCBreakHandler();
void setTimerIrqHandler();
void restoreTimerIrqHandler();
#ifdef NO_ASM
/* per-tick game work + its registration hook (shared/timer.c + egsys.c); the
 * verify ASM build runs egcode.asm's own timer ISR instead, so this is NO_ASM. */
void setTimerTickHook(void(far *fn)(void));
void far egAdvanceFrameTick(void);
#endif
int16 getTimeOfDay();
int16 __cdecl openFile(const char *path, int16 mode);

#ifdef NO_ASM
void far projectSceneObject(char far *model, int16 yaw, int16 pitch, int16 roll, int16 posX, int16 posY, int16 posZ);
#else
void far projectSceneObject();
#endif
#if defined(MSDOS)
extern int16 rand();
#endif

#endif /* F15_SE2_EGCODE */
