// seg000 optimized code (/Ot)
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>


int openFileWrapper(char *path, int mode) {
    TRACE(("openFileWrapper: path=%s mode=%d", path, mode));
    return openFile(path, mode);
}

// ==== seg000:0xdd5e ====
int createFileWrapper(int filename, int attr) {
    return createFile(filename, attr);
}

// ==== seg000:0xdd70 ====
void closeFileWrapper(int handle) {
    closeFile(handle);
}

// ==== seg000:0xdd7e ====
int readFile1Wrapper(int arg_0, int arg_1, int arg_2) {
    return readFile1(arg_0, arg_1, arg_2);
}

// ==== seg000:0xdd92 ====
int readFile2Wrapper(int arg_0, int arg_1, int arg_2, int arg_3) {
    return readFile2(arg_0, arg_1, arg_2, arg_3);
}

// ==== seg000:0xddaa ====
int writeFileAtRawWrapper(int handle, int count, int bufOffset, int bufSegment, int offsetAddend) {
    return writeFileAtRaw(handle, count, bufOffset, bufSegment, offsetAddend);
}

