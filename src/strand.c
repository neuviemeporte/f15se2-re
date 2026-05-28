/* Random number utilities */
#include "start.h"

#include <dos.h>

// 0x1824
void seedRandom() {
    srand(getTimeOfDay());
}

// 0x1835
int randMul(uint16 arg) {
    return (rand() * (long)arg) >> 0xf;
}
