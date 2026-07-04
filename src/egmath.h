#ifndef F15_SE2_EGMATH
#define F15_SE2_EGMATH
#include "inttype.h"
/* public interface of egmath.c */

void load15Flt3d3();
void drawWorldObject(int16 shapeId, int32 worldX, int32 worldY, int16 altitude, int16 objYaw, int16 objPitch, int16 objRoll, int16 scaleShift);
void drawTargetView(int16 shapeId, int16 worldX, int16 worldY, int16 altitude, int16 objYaw, int16 objPitch, int16 objRoll, int16 mode, int16 shift);
int16 shapeDataOffset(int16 shapeId);
int16 clampRange(int16 value, int16 minVal, int16 maxVal);
int16 clampValue(int16 value, int16 minVal, int16 maxVal);
int16 computeBearing(int16 deltaX, int16 deltaY);
int16 cosMul(int16 angle, int16 value);
int16 signOf(int16 value);
void seedRng(void);
int16 readAxisInput(int16 axisIdx);

#endif /* F15_SE2_EGMATH */
