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
int createFileWrapper(int arg_0, int arg_1) {
    return createFile(arg_0, arg_1);
}

// ==== seg000:0xdd70 ====
void closeFileWrapper(int arg_0) {
    closeFile(arg_0);
}

// ==== seg000:0xdd7e ====
int readFile1Wrapper(int arg_0, int arg_1, int arg_2) {
    return readFile1(arg_0, arg_1, arg_2);
}

// ==== seg000:0xdd92 ====
int sub_1DD92(int arg_0, int arg_1, int arg_2, int arg_3) {
    return readFile2(arg_0, arg_1, arg_2, arg_3);
}

// ==== seg000:0xddaa ====
int sub_1DDAA(int arg_0, int arg_1, int arg_2, int arg_3, int arg_4) {
    return writeFileAtRaw(arg_0, arg_1, arg_2, arg_3, arg_4);
}

