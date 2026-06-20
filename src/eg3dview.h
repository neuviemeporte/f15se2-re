#ifndef F15_SE2_EG3DVIEW
#define F15_SE2_EG3DVIEW
/* public interface of eg3dview.c */

void loadRegion3D();
void render3DView(int camX, int camY, int camZ, long worldX, long worldY, long worldZ, int clipLeft, int clipTop, int clipWidth, int clipHeight);
void waitFrameSync(int frames);
void loadColorPalette(int idx);

#endif /* F15_SE2_EG3DVIEW */
