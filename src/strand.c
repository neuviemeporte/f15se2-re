/* Random number utilities */
#include "strand.h"
#include "shared/common.h"

#include <dos.h>

void seedRandom() {
    srand(getTimeOfDay());
}

int16 randMul(uint16 arg) {
    return (rand() * (int32)arg) >> 0xf;
}
