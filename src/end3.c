/* end3.c — compiled with /Gs /Os */
#include "end.h"

void loadWorldData(int destOffset, int size) {
    if (worldDataReady != 0) {
        routine_108(destOffset, size, 1, worldBufHandle);
    } else {
        routine_109(destOffset, size, 1, worldBufHandle);
    }
}
