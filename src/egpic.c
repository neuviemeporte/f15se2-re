// seg000 optimization disabled (/Od) code
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

#ifdef BUGFIX
void openBlitClosePic(char* path, int arg_2) {
#else
void openBlitClosePic(char* path, int arg_2, int garbage) {
#endif
    int var_2 = openFileWrapper(path, 0);
#ifdef BUGFIX
    picBlit(var_2, arg_2);
#else
    picBlit(var_2, arg_2, garbage);
#endif
    closeFileWrapper(var_2);
}
