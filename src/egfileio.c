// seg000 optimized code (/Ot)
#include "egfileio.h"
#include "egcode.h"
#include "egtypes.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

/* Private helpers for this translation unit. */
int createFileWrapper(const char* filename, int attr);
int readFile1Wrapper(int handle, int count, int bufOffset);
int readFile2Wrapper(int handle, int count, int bufOffset, int bufSegment);
int writeFileAtRawWrapper(int handle, int count, int bufOffset, int bufSegment, int offsetAddend);

int openFileWrapper(const char *filename, int mode) { /* Original: OpenFile(file, attrib). Open resident file service; returns a file handle. */
    TRACE(("openFileWrapper: path=%s mode=%d", filename, mode));
    /* Thin resident-service wrapper: pass filename and open mode unchanged. */
    return openFile(filename, mode);
}

// ==== seg000:0xdd5e ====
int createFileWrapper(const char* filename, int attr) { /* Original: CreateFile(file). Create resident file service; returns a file handle/status. */
    /* attr is kept for the wrapper ABI; the resident create service uses it. */
    return createFile(filename, attr);
}

// ==== seg000:0xdd70 ====
void closeFileWrapper(int handle) { /* Original: CloseFile(fh). Close a resident file-service handle. */
    /* Closing goes through the same resident file layer as opening. */
    closeFile(handle);
}

// ==== seg000:0xdd7e ====
int readFile1Wrapper(int handle, int count, int bufOffset) {
    return readFile1(handle, count, bufOffset);
}

// ==== seg000:0xdd92 ====
int readFile2Wrapper(int handle, int count, int bufOffset, int bufSegment) {
    return readFile2(handle, count, bufOffset, bufSegment);
}

// ==== seg000:0xddaa ====
int writeFileAtRawWrapper(int handle, int count, int bufOffset, int bufSegment, int offsetAddend) {
    return writeFileAtRaw(handle, count, bufOffset, bufSegment, offsetAddend);
}
