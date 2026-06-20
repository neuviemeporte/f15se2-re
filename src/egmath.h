#ifndef F15_SE2_EGMATH
#define F15_SE2_EGMATH
/* public interface of egmath.c */

void load15Flt3d3();
void drawWorldObject(int shapeId, long worldX, long worldY, int altitude, int objYaw, int objPitch, int objRoll, int scaleShift);
void drawTargetView(int shapeId, int worldX, int worldY, int altitude, int objYaw, int objPitch, int objRoll, int mode, int shift);
int shapeDataOffset(int shapeId);
int clampRange(int value, int minVal, int maxVal);
int clampValue(int value, int min, int max);
int computeBearing(int deltaX, int deltaY);
int cosMul(int angle, int value);
int signOf(int value);
void seedRng(void);
int readAxisInput(int axisIdx);

#endif /* F15_SE2_EGMATH */
