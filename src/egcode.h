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
int16 drawCenteredLabelBox(int16 panel, const char *text);
int16 createFile(const char *path, int16 attr);
void closeFile(int16 handle);
int16 readFile1(int16 handle, int16 count, int16 bufOffset);
int16 readFile2(int16 handle, int16 count, int16 bufOffset, int16 bufSegment);
int16 writeFileAtRaw(int16 handle, int16 count, int16 bufOffset, int16 bufSegment, int16 offsetAddend);
void picBlit(int16 handle, int16 unk);
void pascal shiftLongLeftInPlace(int16 count, int32 *ptr);
void pascal shiftLongRightInPlace(int16 count, int32 *ptr);
int16 FAR drawPolygonOutline(int16 fillColor, int16 pointCount, int16 *points, int16 edgeColor);
void installDivZeroHandler();
void installDivZeroVector();
int16 FAR drawFlatHorizon(int16);
void storeObjTransformByOpcode();
int16 FAR advanceModelPointerLod();
int16 FAR renderSortedListFar();
int16 FAR rotatePoint3dFar();
void rotatePoint3d();
int16 FAR transformModelVerticesFar();
int16 FAR projectModelEdgesFar();
int16 FAR buildRotationMatrixFar(int16 *matrix, int16 angleX, int16 angleY, int16 angleZ);
int16 FAR multiplyMatrix3x3Far(const int16 *matA, const int16 *matB, int16 *result);
int16 FAR drawModelDisplayList();
int16 FAR fillSpanRect(const int16 *dst, int16 left, int16 top, int16 right, int16 bottom);
int16 FAR drawClipLineGlobal();
int16 FAR flushSpanDirtyRect();
int16 FAR resetScanlineSpans();
int16 FAR clipAndRasterizeEdge();
void FAR setupInstrumentLayoutFar();
void FAR drawInstrumentGaugesFar();
int16 FAR initJoystickCalibration();
void seedJoystickBaseline();
int16 FAR readCalibratedJoystick();
void readJoystickHardware();
void computeJoystickAxis();
int16 FAR restoreJoystickData(uint8 FAR *ptr);
void FAR copyJoystickData(uint8 FAR *ptr);
int16 FAR setInt9Handler();
int16 FAR restoreInt9Handler();
int16 int9Handler();
extern int32 _aNlmul(int32, int32);

void setupOverlaySlots(uint16 addr);
void installCBreakHandler();
void setTimerIrqHandler();
void restoreTimerIrqHandler();
#ifdef NO_ASM
/* per-tick game work + its registration hook (shared/timer.c + egsys.c); the
 * verify ASM build runs egcode.asm's own timer ISR instead, so this is NO_ASM. */
void setTimerTickHook(void(FAR *fn)(void));
void FAR egAdvanceFrameTick(void);
#endif
int16 getTimeOfDay();
int16 openFile(const char *path, int16 mode);

#ifdef NO_ASM
void FAR projectSceneObject(char FAR *model, int16 yaw, int16 pitch, int16 roll, int16 posX, int16 posY, int16 posZ);
#else
void FAR projectSceneObject();
#endif
#if defined(MSDOS)
extern int16 rand();
#endif

#endif /* F15_SE2_EGCODE */
