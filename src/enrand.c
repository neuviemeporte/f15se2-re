/* enrand.c — split from entext.c (seedRandom), compiled with /Gs /Zi */
#include <string.h>
#include "offsets.h"
#include "pointers.h"
#include "log.h"
#include "shared/common.h"
#include "enfile.h"
#include "enrand.h"

void seedRandom(void) {
    srandInit(getTimeOfDay());
}
