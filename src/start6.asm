.8086
DOSSEG
.MODEL SMALL
PUBLIC _byte_1B0D3
PUBLIC _bufCoordStr
PUBLIC _byte_1B0D1
PUBLIC _byte_1B0D2
PUBLIC _moveDst
PUBLIC _word_19656
PUBLIC _theaterSaved
PUBLIC _flag4Saved
PUBLIC _word_19658
PUBLIC _word_1965A
PUBLIC _word_1965C
PUBLIC _word_1965E
PUBLIC _dictionaryIndex
PUBLIC _picDecodeDictionary
PUBLIC _picRowLength
PUBLIC _picWorkData
PUBLIC _picWorkDataPtr
PUBLIC _picProcessFlag0_1
PUBLIC _picTmp9BitCount
PUBLIC _picByteUnsignedFlag
PUBLIC _readBufEndPtr
PUBLIC _picRemainingBitCount
PUBLIC _picDecodeIncrement
PUBLIC _picNumberDictSlots
PUBLIC _picSlotCounter
PUBLIC _picFileReadBufEnd
PUBLIC _picByte
PUBLIC _byte_19ADB
PUBLIC _picFileWord
PUBLIC _picLookupResult
.DATA
_word_19656 dw 0
_word_19658 dw 0
_word_1965A dw 0
_word_1965C dw 0
_word_1965E dw 0
_readBufEndPtr dw 0
_picWorkDataPtr dw 0
_picRowLength dw 0
_picProcessFlag0_1 db 0
_picLookupResult db 0
_picTmp9BitCount db 0
_picByte db 0
_picFileReadBufEnd dw 0
_picNumberDictSlots dw 0
_picFileWord dw 0
_picRemainingBitCount db 0
_picByteUnsignedFlag db 0
_picSlotCounter dw 0
_dictionaryIndex db 0
    db 100h dup(0)
unk_19775 db 0
    db 0
    db 0
unk_19778 db 0
    db 0
byte_1977A db 0FBh dup(0)
_picWorkData db 0
    db 0
    db 0
_picDecodeDictionary dw 0
_picDecodeIncrement db 0
    db 1C1h dup(0)
byte_19A3C db 9Fh dup(0)
_byte_19ADB db 61h dup(0)
byte_19B3C db 180h dup(0)
byte_19CBC db 100h dup(0)
byte_19DBC db 12BCh dup(0)
byte_1B078 db 0
byte_1B079 db 0
word_1B07A dw 0
word_1B07C dw 0
byte_1B07E db 0
byte_1B07F db 0
    db 40h dup(0)
word_1B0C0 dw 0
word_1B0C2 dw 0
word_1B0C4 dw 0
byte_1B0C6 db 0
    db 0
_flag4Saved dw 0
_theaterSaved dw 0
_moveDst dd 0
_bufCoordStr db 0
_byte_1B0D1 db 0
_byte_1B0D2 db 0
_byte_1B0D3 db 0
    db 0
    db 0

END