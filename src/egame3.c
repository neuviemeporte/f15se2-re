// seg000 optimization disabled (/Od) code
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

#if !defined(MSDOS)
// ==== seg000:0xdfbc ====
void openBlitClosePic(char* path, int arg_2) {
    int var_2 = openFileWrapper(path, 0);
    TRACE(("openBlitClosePic: picBlit(%d, %d)", var_2, arg_2));
    picBlit(var_2, arg_2);
    TRACE(("openBlitClosePic: closing"));
    closeFileWrapper(var_2);
}
#else
void openBlitClosePic(char* path, int arg_2, int garbage) {
    int var_2 = openFileWrapper(path, 0);
    TRACE(("openBlitClosePic: picBlit(%d, %d)", var_2, arg_2));
    picBlit(var_2, arg_2, garbage);
    TRACE(("openBlitClosePic: closing"));
    closeFileWrapper(var_2);
}
#endif
