#ifndef F15_SE2_EG3DMAP
#define F15_SE2_EG3DMAP
/* public interface of eg3dmap.c */
#include "inttype.h"
#include "struct.h"

struct TileObject *findNearestTileObject(uint32 worldX, uint32 worldY);
void addTileEntry(struct TileObject *a, int16 b, char c);
int16 lookupTileEntry(int16 lod, int16 subIndex, int16 tileX, int16 tileY);
void drawNearestTileObject(uint32 coord1, uint32 coord2, uint32 coord3);
void renderMapTerrain(const int16 *, int16, int16, int16);
void setup3DTransform(const int16 *model, int16 angleX, int16 angleY, int16 angleZ, int16 posX, int16 posY, int16 posZ, int16 renderScene);
void rasterize3DWorld();

#endif /* F15_SE2_EG3DMAP */
