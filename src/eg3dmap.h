#ifndef F15_SE2_EG3DMAP
#define F15_SE2_EG3DMAP
/* public interface of eg3dmap.c */
#include "inttype.h"
#include "struct.h"

struct TileObject* findNearestTileObject(uint32 worldX, uint32 worldY);
void addTileEntry(struct TileObject *a, int b, char c);
int lookupTileEntry(int lod, int subIndex, int tileX, int tileY);
void drawNearestTileObject(uint32 coord1, uint32 coord2, uint32 coord3);
void renderMapTerrain(const int16 *, int, int, int);
void setup3DTransform(const int16 *model, int angleX, int angleY, int angleZ, int posX, int posY, int posZ, int renderScene);
void rasterize3DWorld();

#endif /* F15_SE2_EG3DMAP */
