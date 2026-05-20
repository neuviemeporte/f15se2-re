/* end3.c — compiled with /Gs /Os */
#include "end.h"

void routine_71(int param_1, int param_2) {
    if (worldDataReady != 0) {
        routine_108(param_1, param_2, 1, worldBufHandle);
    } else {
        routine_109(param_1, param_2, 1, worldBufHandle);
    }
}
