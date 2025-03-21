// seg000 optimization disabled (/Od) code
#include "debug.h"
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

// ==== seg000:0xdfbc ====
int openBlitClosePic(const char* path, int arg_2, int arg_4) {
    int var_2 = openFileWrapper(path, 0);
    picBlit(var_2, arg_2, arg_4);
    closeFileWrapper(var_2);
}
