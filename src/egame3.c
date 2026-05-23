// seg000 optimization disabled (/Od) code
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

// ==== seg000:0xdfbc ====
int openBlitClosePic(char* path, int arg_2, int arg_4) {
    int var_2 = openFileWrapper(path, 0);
    TRACE(("openBlitClosePic: picBlit(%d, %d)", var_2, arg_2));
    picBlit(var_2, arg_2, arg_4);
    TRACE(("openBlitClosePic: closing"));
    closeFileWrapper(var_2);
}
