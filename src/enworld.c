/* enworld.c — world data reading, compiled with /Gs /Os */
#include <memory.h>
#include "end.h"

void readWorldData(void) {
    loadWorldData((int)&worldWaypointCount, 2);
    loadWorldData((int)&worldObjectCount, 2);
    loadWorldData((int)&worldRouteTable, 2);
    loadWorldData((int)&worldRouteCount, 2);
    loadWorldData((int)&worldObjects, worldObjectCount << 4);
    loadWorldData((int)&worldSamCount, 2);
    loadWorldData((int)&worldSamTable, 0x24 * worldSamCount);
    loadWorldData((int)unitTypeTable, 0x64);
    loadWorldData((int)&worldUnitFlags, 0x64);
    loadWorldData((int)worldStringBuf, 0x2ee);
    loadWorldData((int)gridFlags, 0x100);
    loadWorldData((int)&worldGridSize, 2);
    loadWorldData((int)&worldMiscHeader, 2);
    loadWorldData((int)&weaponDataBlock, 0x10);
    loadWorldData((int)target1Type, 0x24);
    loadWorldData((int)flightTimeTable, 0x600);
}

void loadWorldData(int destOffset, int size) {
    if (worldDataReady != 0) {
        readFromWorldBuf((char *)destOffset, size, 1, worldBufHandle);
    } else {
        readFromWorldFile((char *)destOffset, size, 1, worldBufHandle);
    }
}

void readFromWorldBuf(char *dest, int size, int count, int bufHandle) {
    char far *farDest;
    register int totalSize;
    farDest = (char far *)dest;
    totalSize = size * count;
    movedata(worldBufSegment, worldBufOffset, FP_SEG(farDest), FP_OFF(farDest), totalSize);
    worldBufOffset += totalSize;
}

void readFromWorldFile(char *dest, int size, int count, int bufHandle) {
    char far *farDest;
    register int totalSize;
    farDest = (char far *)dest;
    totalSize = size * count;
    movedata(FP_SEG(farDest), FP_OFF(farDest), worldBufSegment, worldBufOffset, totalSize);
    worldBufOffset += totalSize;
}
