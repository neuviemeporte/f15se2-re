/* Random number utilities */
#include "strand.h"
#include "shared/common.h"

#include <dos.h>

void seedRandom() {
    srand(getTimeOfDay());
}

int randMul(uint16 arg) {
    return (rand() * (long)arg) >> 0xf;
}
