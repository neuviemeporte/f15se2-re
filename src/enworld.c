/* enworld.c — world data reading, compiled with /Gs /Os */
#include <dos.h>
#include <memory.h>
#include "endata.h"
#include "enworld.h"

/* Private helpers for this translation unit. */
void loadWorldData(void* destOffset, int size);
void readFromWorldBuf(void *dest, int size, int count, FILE *bufHandle);
void writeToWorldBuf(void *dest, int size, int count, FILE *bufHandle);

void readWorldData(void) {
    loadWorldData(&worldWaypointCount, 2);
    loadWorldData(&worldObjectCount, 2);
    loadWorldData(&worldRouteTable, 2);
    loadWorldData(&worldRouteCount, 2);
    loadWorldData(worldObjects, worldObjectCount << 4);
    loadWorldData(&worldSamCount, 2);
    loadWorldData(&worldSamTable, 0x24 * worldSamCount);
    loadWorldData(unitTypeTable, 0x64);
    loadWorldData(&worldUnitFlags, 0x64);
    loadWorldData(worldStringBuf, 0x2ee);
    loadWorldData(gridFlags, 0x100);
    loadWorldData(&worldGridSize, 2);
    loadWorldData(&worldMiscHeader, 2);
    loadWorldData(&weaponDataBlock, 0x10);
    loadWorldData(target1Type, 0x24);
    loadWorldData(flightTimeTable, 0x600);
}

void loadWorldData(void* destOffset, int size) {
    if (worldDataReady != 0) {
        readFromWorldBuf(destOffset, size, 1, worldBufHandle);
    } else {
        writeToWorldBuf(destOffset, size, 1, worldBufHandle);
    }
}

void readFromWorldBuf(void *dest, int size, int count, FILE *bufHandle) {
    char far *farDest;
    register int totalSize;
    farDest = (char far *)dest;
    totalSize = size * count;
    movedata(worldBufSegment, worldBufOffset, FP_SEG(farDest), FP_OFF(farDest), totalSize);
    worldBufOffset += totalSize;
}

void writeToWorldBuf(void *dest, int size, int count, FILE *bufHandle) {
    char far *farDest;
    register int totalSize;
    farDest = (char far *)dest;
    totalSize = size * count;
    movedata(FP_SEG(farDest), FP_OFF(farDest), worldBufSegment, worldBufOffset, totalSize);
    worldBufOffset += totalSize;
}
