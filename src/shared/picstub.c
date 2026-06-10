/*
 * picstub.c - PIC image LZW decoder.
 * Replaces: pic_decodepic.inc, pic_lzw.inc, pic_showpicfile.inc
 *
 * Two-phase decode: LZW produces raw bytes, then RLE (0x90 escape) is applied.
 */

#include "inttype.h"
#include "pointers.h"
#include <dos.h>

extern int FAR CDECL gfx_setPageN(uint16 pageNum);
extern int FAR CDECL gfx_clearPage(void);
extern int FAR CDECL gfx_getCurPageSeg(void);

void picdbg(const char *msg)
{
    (void)msg;
}

/* Pic decode work data */
extern uint8 picDecodedRowBuf[320];
/* Large buffers allocated from DOS to save DGROUP space */
static uint8 far *picWorkDataFar;
static uint16 far *picDecodeDictionaryFar;
static uint16 far *picDecodeIncrementFar;
static uint16 picBufSeg = 0;
#define picWorkData picWorkDataFar
#define picDecodeDictionary picDecodeDictionaryFar
#define picDecodeIncrement picDecodeIncrementFar
uint16 dictionaryIndex = 0;

/* File I/O state */
static uint8 picFileReadBuf[512];
static int picFileHandle;
static uint16 picBufPos;

/* Bit reader state - matches ASM exactly */
static uint16 picFileWord;         /* current 16-bit word being decoded */
static uint8 picRemainingBitCount; /* bits remaining in picFileWord */

/* LZW state */
static uint16 picCodeWidth;
static uint16 picMaxWidth;
static uint16 picNextCode;
static uint16 picMaxCodeAtWidth;
static uint16 picPrevCode;
static uint8 picFirstChar;
static uint16 picSignedFlag;

/* RLE state - persists across row calls (matches ASM picProcessFlag/picLookupResult) */
static uint8 rlePrevByte;
static uint8 rleProcessFlag;  /* remaining RLE repeats */

static void picAllocBuffers(void)
{
    union REGS r;
    if (picBufSeg) return;
    /* Allocate (4096 + 8192 + 8192) = 20480 bytes = 0x500 paragraphs */
    r.h.ah = 0x48;
    r.x.bx = 0x500;
    intdos(&r, &r);
    if (r.x.cflag) return;
    picBufSeg = r.x.ax;
    picWorkDataFar = (uint8 far *)MK_FP(picBufSeg, 0);
    picDecodeDictionaryFar = (uint16 far *)MK_FP(picBufSeg, 4096);
    picDecodeIncrementFar = (uint16 far *)MK_FP(picBufSeg, 4096 + 8192);
}

/* Dictionary - 2048 entries max */
static uint16 dictParent[2048];
static uint8 dictChar[2048];

/* LZW output buffer (coroutine simulation) */
static uint8 lzwOutBuf[2048];
static uint16 lzwOutPos;
static uint16 lzwOutLen;
static int lzwFirstCode; /* flag: first code after init/reset */

static void read512FromFile(void)
{
    union REGS r;
    r.h.ah = 0x3F;
    r.x.bx = picFileHandle;
    r.x.cx = 512;
#if !defined(MSDOS)
    // make clang quiet
    r.x.dx = 0; //(uint16)picFileReadBuf;
#else  
    r.x.dx = (uint16)picFileReadBuf;
#endif  
    intdos(&r, &r);
    picBufPos = 0;
}

static uint16 readCode(void)
{
    uint16 lo;
    uint8 cl;
    uint16 w;
    uint16 mask;

    /* Shift out consumed bits to get remaining at bottom */
    lo = picFileWord >> (16 - picRemainingBitCount);
    cl = picRemainingBitCount;

    /* Need more bits? (always at most one new word since max code_width=12, max remaining=15) */
    if (cl < picCodeWidth) {
        if (picBufPos >= 512) {
            read512FromFile();
        }
        w = picFileReadBuf[picBufPos] | ((uint16)picFileReadBuf[picBufPos + 1] << 8);
        picBufPos += 2;
        picFileWord = w;
        lo |= (w << cl);
        cl += 16;
    }

    cl -= (uint8)picCodeWidth;
    picRemainingBitCount = cl;

    mask = (1u << picCodeWidth) - 1;
    return lo & mask;
}

static void resetDictionary(void)
{
    uint16 i;
    for (i = 0; i < 256; i++) {
        dictParent[i] = 0xFFFF;
        dictChar[i] = (uint8)i;
    }
    picNextCode = 256;
    picCodeWidth = 9;
    picMaxCodeAtWidth = 511;
    /* NOTE: lzwFirstCode is NOT set here - only set on initial decode start.
       After a mid-stream reset, the next code still adds a dict entry
       using picPrevCode as parent. */
}

/*
 * Decode one LZW code into lzwOutBuf[].
 * Returns number of bytes produced.
 */
static uint16 decodeLZWStep(void)
{
    uint16 code;
    uint16 origCode;
    uint16 stackTop;
    uint16 i;
    uint8 tmp;

    code = readCode();
    origCode = code;
    stackTop = 0;

    /* KwKwK case: code not yet in dictionary */
    if (code >= picNextCode) {
        lzwOutBuf[stackTop++] = picFirstChar;
        code = picPrevCode;
    }

    /* Traverse dictionary chain */
    while (dictParent[code] != 0xFFFF && code < 2048 && stackTop < 4096) {
        lzwOutBuf[stackTop++] = dictChar[code];
        code = dictParent[code];
    }
    if (code < 2048) {
        lzwOutBuf[stackTop++] = dictChar[code];
    }

    /* Root character = first char of this string */
    picFirstChar = dictChar[code];

    /* Add new dictionary entry (always, even on first code - matches ASM) */
    if (picNextCode < 2048) {
        dictParent[picNextCode] = picPrevCode;
        dictChar[picNextCode] = picFirstChar;
        picNextCode++;
    }

    /* Check if code width needs to grow */
    if (picNextCode > picMaxCodeAtWidth) {
        picCodeWidth++;
        picMaxCodeAtWidth = (uint16)((1UL << picCodeWidth) - 1);
        if (picCodeWidth > picMaxWidth) {
            resetDictionary();
        }
    }

    picPrevCode = origCode;

    /* Reverse the stack to get output order */
    for (i = 0; i < stackTop / 2; i++) {
        tmp = lzwOutBuf[i];
        lzwOutBuf[i] = lzwOutBuf[stackTop - 1 - i];
        lzwOutBuf[stackTop - 1 - i] = tmp;
    }

    return stackTop;
}

/*
 * Get next raw byte from LZW stream.
 * Uses buffered output from decodeLZWStep.
 */
static uint8 getNextLZWByte(void)
{
    if (lzwOutPos >= lzwOutLen) {
        lzwOutLen = decodeLZWStep();
        lzwOutPos = 0;
    }
    return lzwOutBuf[lzwOutPos++];
}

/*
 * Decode one row of pixels with LZW + RLE (0x90 escape).
 * count = number of output bytes needed.
 */
static void decodeRow(uint8 *outBuf, uint16 count)
{
    uint16 outPos;
    uint8 ch;
    uint8 rleCount;
    uint16 j;
    uint32 safetyLimit;

    outPos = 0;
    safetyLimit = 0;

    while (outPos < count) {
        if (++safetyLimit > 50000UL) {
            break;
        }

        /* First: handle any remaining RLE repeats from previous call */
        if (rleProcessFlag > 0) {
            outBuf[outPos++] = rlePrevByte;
            rleProcessFlag--;
            continue;
        }

        ch = getNextLZWByte();

        if (ch == 0x90) {
            /* RLE escape */
            rleCount = getNextLZWByte();
            if (rleCount == 0) {
                /* Literal 0x90 */
                outBuf[outPos++] = 0x90;
                rlePrevByte = 0x90;
            } else {
                /* Repeat prevByte (rleCount-1) more times */
                rleProcessFlag = rleCount - 1;
            }
        } else {
            outBuf[outPos++] = ch;
            rlePrevByte = ch;
        }
    }
}

static void picDecodeToSegment(int handle, uint16 pageSeg)
{
    uint16 row;
    uint16 i;
    uint8 far *dst;
    static uint8 tempBuf[160];

    picAllocBuffers();
    picFileHandle = handle;
    read512FromFile();

    /* Read header word from file buffer - matches ASM picReadDataAndMakeDict */
    picFileWord = picFileReadBuf[picBufPos] | ((uint16)picFileReadBuf[picBufPos + 1] << 8);
    picBufPos += 2;

    /* ASM: AL = low byte. If bit 7 set: byte mode, NEG al to get max bits.
       If bit 7 clear: nibble mode, al is max bits directly. */
    {
        uint8 al = (uint8)(picFileWord & 0xFF);
        picSignedFlag = 0;
        if (al & 0x80) {
            /* Byte mode: negate to get true max bits (two's complement) */
            picSignedFlag = 1;
            al = (uint8)(-(int8)al);
        }
        picMaxWidth = al;
    }
    /* ASM sets picRemainingBitCount = 8 (high byte of header word is first data) */
    picRemainingBitCount = 8;

    /* Init LZW */
    resetDictionary();
    picPrevCode = 0;  /* ASM: picSlotCounter is BSS-zeroed on first use */
    picFirstChar = 0;
    lzwOutPos = 0;
    lzwOutLen = 0;
    rlePrevByte = 0;
    rleProcessFlag = 0;

    for (row = 0; row < 200; row++) {
        if (!picSignedFlag) {
            /* picByteUnsignedFlag=1 (bit7 clear): NIBBLE mode */
            decodeRow(tempBuf, 160);
            for (i = 0; i < 160; i++) {
                picDecodedRowBuf[i * 2] = tempBuf[i] & 0x0F;
                picDecodedRowBuf[i * 2 + 1] = (tempBuf[i] >> 4) & 0x0F;
            }
        } else {
            /* picByteUnsignedFlag=0 (bit7 set): BYTE mode */
            decodeRow(picDecodedRowBuf, 320);
        }

        dst = (uint8 far *)MK_FP(pageSeg, (uint16)(row * 320));
        for (i = 0; i < 320; i++) {
            dst[i] = picDecodedRowBuf[i];
        }
    }
}

void showPicFile(int handle, int page)
{
    uint16 pageSeg;

    if (handle < 0) return;

    gfx_setPageN((uint16)page);
    gfx_clearPage();
    pageSeg = (uint16)gfx_getCurPageSeg();
    picDecodeToSegment(handle, pageSeg);
}

void decodePic(int handle, int segment)
{
    gfx_clearPage();
    picDecodeToSegment(handle, (uint16)segment);
}

void decodePicRaw(int handle, int segment)
{
    /* Same as decodePic: clears page and decodes PIC row-by-row */
    gfx_clearPage();
    picDecodeToSegment(handle, (uint16)segment);
}

void picBlit(int handle, int segment)
{
    decodePic(handle, segment);
}
