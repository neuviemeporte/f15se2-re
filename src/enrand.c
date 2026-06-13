/* enrand.c — split from entext.c (seedRandom), compiled with /Gs /Zi */
#include <string.h>
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "shared/common.h"
#include "end.h"

void seedRandom(void) {
    TRACE(("seedRandom"));
    srandInit(getTimeOfDay());
}
