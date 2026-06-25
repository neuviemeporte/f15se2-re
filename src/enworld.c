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
    loadWorldData(worldRouteTable, 2);
    loadWorldData(&worldRouteCount, 2);
    loadWorldData(worldObjects, worldObjectCount << 4);
    loadWorldData(&worldSamCount, 2);
    loadWorldData(worldSamTable, 36 * worldSamCount);
    loadWorldData(unitTypeTable, 100);
    loadWorldData(worldUnitFlags, 100);
    loadWorldData(worldStringBuf, 750);
    loadWorldData(gridFlags, 0x100);
    loadWorldData(&worldGridSize, 2);
    loadWorldData(worldMiscHeader, 2);
    loadWorldData(&weaponDataBlock, 16);
    loadWorldData(&targetBlock, 36);
    loadWorldData(flightDataBuf, 0x600);
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
