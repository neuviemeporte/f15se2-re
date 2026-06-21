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
void openBlitClosePic(char* filename, int page) { /* Original chain: OpenFile + blit/decode + CloseFile. Open, blit PIC to page, then close. */
#else
void openBlitClosePic(char* filename, int page, int garbage) { /* Original chain: OpenFile + blit/decode + CloseFile. Open, blit PIC to page, then close. */
#endif
    int handle = openFileWrapper(filename, 0);
    /* The PIC decoder/blitter consumes the already-open file handle. */
#ifdef BUGFIX
    picBlit(handle, page);
#else
    picBlit(handle, page, garbage);
#endif
    /* Always close immediately after the synchronous blit/decode call. */
    closeFileWrapper(handle);
}
