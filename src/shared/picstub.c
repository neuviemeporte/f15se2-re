/*
 * pic_noasm.c - C stub implementations for PIC image decoding routines.
 * Only compiled for the NO_ASM build.
 *
 * Replaces: pic_decodepic.inc, pic_lzw.inc, pic_showpicfile.inc
 */

#include "inttype.h"
#include "pointers.h"

/* Pic decode work data */
uint8 picDecodedRowBuf[320];
uint8 picWorkData[4096];
uint16 picDecodeDictionary[4096];
uint16 picDecodeIncrement[4096];
uint16 dictionaryIndex = 0;

/* pic_showpicfile.inc: Decode and display a PIC file to a graphics page */
void showPicFile(int handle, int segment, int unused)
{
    (void)handle;
    (void)segment;
    (void)unused;
    /* Stub: images won't display but won't crash */
}

/* pic_decodepic.inc: Decode PIC data into page buffer */
void decodePic(int handle, int segment)
{
    (void)handle;
    (void)segment;
    /* Stub */
}

/* pic_lzw.inc internal routines - not called from C directly */

/* picBlit from start4.asm - blit decoded row to screen */
void picBlit(void)
{
    /* Stub */
}
