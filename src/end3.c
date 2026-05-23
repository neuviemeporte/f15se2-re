/* end3.c — compiled with /Gs /Os */
#include "end.h"

void loadWorldData(int destOffset, int size) {
    if (worldDataReady != 0) {
        readFromWorldBuf(destOffset, size, 1, worldBufHandle);
    } else {
        readFromWorldFile(destOffset, size, 1, worldBufHandle);
    }
}
