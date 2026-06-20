// seg000 optimization disabled (/Od) code
#include "egfileio.h"
#include "egcode.h"
#include "egpic.h"
#include "egtypes.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

#ifdef BUGFIX
void openBlitClosePic(char* path, int page) {
#else
void openBlitClosePic(char* path, int page, int garbage) {
#endif
    int handle = openFileWrapper(path, 0);
#ifdef BUGFIX
    picBlit(handle, page);
#else
    picBlit(handle, page, garbage);
#endif
    closeFileWrapper(handle);
}
