; shared/pic.inc — LZW picture decoding routines (all-in-one include)
;
; Required EQU definitions before INCLUDE:
;   picFileReadPos       - word: file buffer read position
;   picFileReadBuf       - byte[]: the 512-byte read buffer
;   picDecodedRowBuf     - byte[320]: decoded row output
;   picRowLength         - word: row length counter
;   picScreenBufSize     - word: screen buffer size counter
;   picPageIndex         - word: page index
;   picRowOffset         - word: row offset from gfx call
;   picRow               - word: current row counter
;   picReadFromFilePtr   - word: function pointer for reading data
;   picFileHandle        - word: file handle for reading
;   picReadBufEndPtr     - word: end-of-read-buffer pointer
;   picWorkData          - byte[]: work data buffer (used as stack)
;   picWorkDataPtr       - word: work data pointer
;   picProcessFlag       - byte: RLE process flag
;   picLookupResult      - byte: last lookup result
;   picFileWord          - word: current file word being decoded
;   picRemainingBitCount - byte: remaining bit count
;   picByteUnsignedFlag  - byte: unsigned byte flag
;   picByte              - byte: current pic byte (max bits)
;   picTmp9BitCount      - byte: current bit width for dictionary codes
;   picFileReadBufEnd    - word: max code value at current bit width
;   picNumberDictSlots   - word: number of dictionary slots
;   picDecodeDictionary  - word[]: dictionary table (word entries)
;   picDecodeIncrement   - byte[]: dictionary table (byte entries at +2)
;   picSlotCounter       - word: slot counter for dictionary
;   picDictionaryIndex   - byte: dictionary index byte
;   picInitRoutine       - near proc: initialization routine (may be nullsub)
;   picReadFileFunc      - near proc: function to read file data into buffer
;
; Provides procs: showPicFile, decodePic, decodePicRow, picReadDataAndMakeDict,
;                 picMakeDict, doPicDecode, dictionaryLookup
;
; Can also include sections separately:
;   INCLUDE shared/pic_showpicfile.inc  - showPicFile
;   INCLUDE shared/pic_decodepic.inc    - decodePic
;   INCLUDE shared/pic_lzw.inc          - decodePicRow through dictionaryLookup

INCLUDE pic_showpicfile.inc
INCLUDE pic_decodepic.inc
INCLUDE pic_lzw.inc
