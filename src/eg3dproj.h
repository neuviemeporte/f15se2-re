#ifndef F15_SE2_EG3DPROJ
#define F15_SE2_EG3DPROJ
/* public interface of eg3dproj.c */
#include "inttype.h"

uint32 scaleCoordToLod(int16 level, uint32 coord);
void projectObjects(int16 heading, int16 rangeGate, long worldX, long worldY, long worldZ);

#endif /* F15_SE2_EG3DPROJ */
