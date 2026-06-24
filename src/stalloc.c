/* Memory allocation */
#include "stalloc.h"
#include "stcode.h"
#include "stdata.h"
#include "sttypes.h"
#include "shared/common.h"
#include "debug.h"

#include <dos.h>

/* Private helpers for this translation unit. */
uint16 dos_alloc(int sz);

uint16 allocBuffer(int size) {
    uint16 segment;
    TRACE(("allocBuffer(): Allocating buffer of size %u", size));
    if ((segment = dos_alloc(size)) < DOS_ERROR_RMDIR) {
        cleanup();
        dos_printstring("Insufficient system memory - AllocBuffer$");
        exit(0);
    }
    TRACE(("allocBuffer(): Allocated @ 0x%x", segment));
    return segment;
}
