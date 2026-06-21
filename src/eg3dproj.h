#ifndef F15_SE2_EG3DPROJ
#define F15_SE2_EG3DPROJ
/* public interface of eg3dproj.c */
#include "inttype.h"

uint32 scaleCoordToLod(int level, uint32 coord);
void projectObjects(int heading, int rangeGate, long worldX, long worldY, long worldZ);

#endif /* F15_SE2_EG3DPROJ */
