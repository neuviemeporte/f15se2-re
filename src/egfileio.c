// seg000 optimized code (/Ot)
#include "egfileio.h"
#include "egcode.h"
#include "egtypes.h"
#include "offsets.h"
#include "pointers.h"
#include "log.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

/* Private helpers for this translation unit. */
int16 createFileWrapper(const char *filename, int16 attr);
int16 readFile1Wrapper(int16 handle, int16 count, int16 bufOffset);
int16 readFile2Wrapper(int16 handle, int16 count, int16 bufOffset, int16 bufSegment);
int16 writeFileAtRawWrapper(int16 handle, int16 count, int16 bufOffset, int16 bufSegment, int16 offsetAddend);

int16 openFileWrapper(const char *filename, int16 mode) { /* Original: OpenFile(file, attrib). Open resident file service; returns a file handle. */
    Log(("openFileWrapper: path=%s mode=%d", filename, mode));
    /* Thin resident-service wrapper: pass filename and open mode unchanged. */
    return openFile(filename, mode);
}

// ==== seg000:0xdd5e ====
int16 createFileWrapper(const char *filename, int16 attr) { /* Original: CreateFile(file). Create resident file service; returns a file handle/status. */
    /* attr is kept for the wrapper ABI; the resident create service uses it. */
    return createFile(filename, attr);
}

// ==== seg000:0xdd70 ====
void closeFileWrapper(int16 handle) { /* Original: CloseFile(fh). Close a resident file-service handle. */
    closeFile(handle);
}

// ==== seg000:0xdd7e ====
int16 readFile1Wrapper(int16 handle, int16 count, int16 bufOffset) {
    return readFile1(handle, count, bufOffset);
}

// ==== seg000:0xdd92 ====
int16 readFile2Wrapper(int16 handle, int16 count, int16 bufOffset, int16 bufSegment) {
    return readFile2(handle, count, bufOffset, bufSegment);
}

// ==== seg000:0xddaa ====
int16 writeFileAtRawWrapper(int16 handle, int16 count, int16 bufOffset, int16 bufSegment, int16 offsetAddend) {
    return writeFileAtRaw(handle, count, bufOffset, bufSegment, offsetAddend);
}
