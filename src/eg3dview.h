#ifndef F15_SE2_EG3DVIEW
#define F15_SE2_EG3DVIEW
#include "inttype.h"
/* public interface of eg3dview.c */

void loadRegion3D();
void render3DView(int16 camX, int16 camY, int16 camZ, long worldX, long worldY, long worldZ, int16 clipLeft, int16 clipTop, int16 clipWidth, int16 clipHeight);
void waitFrameSync(int16 frames);
void loadColorPalette(int16 idx);

#endif /* F15_SE2_EG3DVIEW */
