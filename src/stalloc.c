/* Memory allocation */
#include "start.h"
#include "shared/util.h"
#include "debug.h"

#include <dos.h>

// 0x3758
uint16 allocBuffer(int size) {
    uint16 segment;
    TRACE(("allocBuffer(): Allocating buffer of size %u", size));
    if ((segment = dos_alloc(size)) < DOS_ERROR_RMDIR) {
        cleanup();
        dos_printstring(str_allocError);
        exit(0);
    }
    TRACE(("allocBuffer(): Allocated @ 0x%x", segment));
    return segment;
}
