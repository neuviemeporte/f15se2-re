#ifndef F15_SE2_EG3DPROJ
#define F15_SE2_EG3DPROJ
/* public interface of eg3dproj.c */
#include "inttype.h"

uint32 scaleCoordToLod(int16 level, uint32 coord);
void projectObjects(int16 heading, int16 rangeGate, int32 worldX, int32 worldY, int32 worldZ);

#endif /* F15_SE2_EG3DPROJ */
