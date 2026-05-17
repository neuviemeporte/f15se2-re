/* end1.c — compiled with /Gs (stack probes disabled, no debug info) */
#include "pointers.h"
#include "debug.h"
#include "end.h"

void routine_91(int param_1)
{
    TRACE(("routine_91"));
    routine_125(param_1);
}

void mystrcpy(char *dst, char *src)
{
    TRACE(("mystrcpy"));
    while ((*dst++ = *src++) != 0)
        ;
}

void loadPic(char *filename, int segment) {
    int handle;
    TRACE(("loadPic"));
    handle = openFileWrapper(filename, 0);
    decodePic(handle, segment);
    routine_91(handle);
}

void openShowPic(char *name, int page, int garbage) {
    int handle;
    TRACE(("openShowPic"));
    handle = openFileWrapper(name, 0);
    showPicFile(handle, page, garbage);
    routine_91(handle);
}

int allocBuffer(int size) {
    int segment;
    TRACE(("allocBuffer"));
    segment = dos_alloc(size);
    if ((unsigned)segment < 0x10) {
        cleanup();
        dos_printstring(str_allocError);
        routine_8(0);
    }
    return segment;
}

void routine_64(int segment) {
    TRACE(("routine_64"));
    if (routine_102(segment) != 0) {
        cleanup();
        dos_printstring(str_deallocError);
        routine_8(0);
    }
}

void routine_70(int param_1) {
    TRACE(("routine_70"));
    var_138 = param_1;
    var_139 = 0;
}

int openFileWrapper(char *name, int mode) {
    TRACE(("openFileWrapper"));
    return openFile(name, mode);
}

int FUN_1000_1348(char *name, int mode) {
    TRACE(("FUN_1000_1348"));
    return FUN_1000_1405(name, mode);
}

int FUN_1000_1368(int handle, int buf, int size) {
    TRACE(("FUN_1000_1368"));
    return FUN_1000_147e(handle, buf, size);
}

int FUN_1000_137c(int handle, int a, int b, int c) {
    TRACE(("FUN_1000_137c"));
    return FUN_1000_14a9(handle, a, b, c);
}

int FUN_1000_1394(int handle, int a, int b, int c, int d) {
    TRACE(("FUN_1000_1394"));
    return FUN_1000_1539(handle, a, b, c, d);
}

void routine_85(p)
register int *p;
{
    TRACE(("routine_85"));
    if ((((char *)p)[6] & 0x83) && (((char *)p)[6] & 0x08)) {
        routine_113(p[2]);
        ((char *)p)[6] &= 0xf7;
        p[1] = p[2] = p[0] = 0;
    }
}

void routine_113(handle)
int handle;
{
    TRACE(("routine_113"));
    if (handle != 0) {
        ((char *)handle)[-2] |= 0x01;
    }
}

int FUN_1000_12c6(char *name, int b, int c) {
    int handle;
    int result;
    TRACE(("FUN_1000_12c6"));
    handle = openFileWrapper(name, 0);
    result = FUN_1000_137c(handle, -1, b, c);
    routine_91(handle);
    return result;
}

int FUN_1000_12fe(char *name, int b, int c, int d, int e) {
    int handle;
    int result;
    TRACE(("FUN_1000_12fe"));
    handle = FUN_1000_1348(name, 0);
    result = FUN_1000_1394(handle, e, b, c, d);
    routine_91(handle);
    return result;
}

void routine_66(void) {
    int key;
    TRACE(("routine_66"));
    if (var_222[0x39] == 1) {
        do {
            if (misc_jump_5a_keybuf() == 0) {
                break;
            }
        } while (misc_jump_5d_readJoy(0) == 0);
        if (misc_jump_5a_keybuf() != 0) {
            goto done;
        }
    }
    key = misc_jump_5b_getkey();
done:
    if (key == 0x1000 || var_57 != 0) {
        cleanup();
        if (var_57 != 0) {
            routine_28();
        }
        routine_8(0);
    }
}

void routine_26(void) {
    TRACE(("routine_26"));
    if (var_57 != 0) {
        cleanup();
        routine_28();
        routine_8(0);
    }
}

void routine_5(void) {
}

void routine_6(void) {
}

void FUN_1000_09e4(int port, int value) {
    TRACE(("FUN_1000_09e4"));
    outp(port, value);
}

void FUN_1000_15d2(char *name, int segment) {
    int handle;
    TRACE(("FUN_1000_15d2"));
    handle = openFileWrapper(name, 0);
    FUN_1000_16d6(handle, segment);
    routine_91(handle);
}

void FUN_1000_1626(char *name, int segment, int off, int whence) {
    int handle;
    TRACE(("FUN_1000_1626"));
    handle = openFileWrapper(name, 0);
    FUN_1000_4c20(handle, off, whence, 0);
    decodePic(handle, segment);
    routine_91(handle);
}

void routine_20(void) {
    int p;
    int a;
    TRACE(("routine_20"));
    routine_41();
    var_206 = 1;
    routine_42();
    var_217[0] = var_218;
    p = 1;
    a = 0;
    while (a < 0x2ee) {
        if (var_218[a] == '\0' && p < 100) {
            var_217[p++] = &var_218[a + 1];
        }
        a++;
    }
}




