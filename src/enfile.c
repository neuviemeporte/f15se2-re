/* enfile.c — file I/O helpers, compiled with /Gs */
#include "pointers.h"
#include "log.h"
#include "endata.h"
#include "endcode.h"
#include "enfile.h"
#include "shared/common.h"

/* Private helpers for this translation unit. */
int16 loadFileSection(const char *name, int16 b, int16 c);
int16 writeFileSection(const char *name, int16 b, int16 c, int16 d, int16 e);

void srandInit(int16 seed) {
    randSeed = seed;
    randState = 0;
}

int16 loadFileSection(const char *name, int16 b, int16 c) {
    int16 handle, result;
    handle = openFileWrapper(name, 0);
    result = readFileAt(handle, -1, b, c);
    closeFileWrapper(handle);
    return result;
}

int16 writeFileSection(const char *name, int16 b, int16 c, int16 d, int16 e) {
    int16 handle, result;
    handle = createFile(name, 0);
    result = writeFile(handle, e, b, c, d);
    closeFileWrapper(handle);
    return result;
}
