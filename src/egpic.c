// seg000 optimization disabled (/Od) code
#include "egfileio.h"
#include "egcode.h"
#include "egpic.h"
#include "egtypes.h"
#include "offsets.h"
#include "pointers.h"
#include "log.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

#ifdef NO_ASM
/* egame's _picBlit (egcode.asm) is the mode-13h 200x320 full-page PIC decode.
 * The shared picimpl.c `picBlit` is start's EGA-title decoder (700x40 planar)
 * and produces vertical-stripe garbage in mode 13h, so the NO_ASM renderer uses
 * showPicFile, which is the matching 200x320 page decode. */
void showPicFile(int16 handle, int16 pageNum);
#endif

#ifdef BUGFIX
void openBlitClosePic(const char *filename, int16 page) { /* Original chain: OpenFile + blit/decode + CloseFile. Open, blit PIC to page, then close. */
#else
void openBlitClosePic(const char *filename, int16 page, int16 garbage) { /* Original chain: OpenFile + blit/decode + CloseFile. Open, blit PIC to page, then close. */
#endif
    int16 handle = openFileWrapper(filename, 0);
    /* The PIC decoder/blitter consumes the already-open file handle. */
#if defined(NO_ASM)
    showPicFile(handle, page);
#elif defined(BUGFIX)
    picBlit(handle, page);
#else
picBlit(handle, page, garbage);
#endif
    /* Always close immediately after the synchronous blit/decode call. */
    closeFileWrapper(handle);
}
