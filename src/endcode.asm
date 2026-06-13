.8086
DOSSEG
.MODEL SMALL

Stack equ 0
local_res0 equ 0
a equ 2h

; --- External overlay jump table procs (in endslots.asm .DATA segment) ---
EXTRN _gfx_allocPage:FAR
EXTRN _gfx_setPage1:FAR
EXTRN _gfx_setCurPageSeg:FAR
EXTRN _gfx_getCurPageSeg:FAR
EXTRN _gfx_drawLine:FAR
EXTRN _gfx_setDrawColor:FAR
EXTRN _gfx_nop22:FAR
EXTRN _gfx_dirtyRect2:FAR
EXTRN _gfx_fillRow:FAR
EXTRN _gfx_getRowOffset:FAR
EXTRN _gfx_clearPage:FAR
EXTRN _gfx_nop51:FAR
EXTRN _gfx_getCurPage:FAR
EXTRN _misc_jump_5a_keybuf:FAR
EXTRN _misc_jump_5b_getkey:FAR
EXTRN _gfx_nop37:FAR
EXTRN _gfx_fillRow2:FAR
EXTRN _gfx_copyRow:FAR
EXTRN _gfx_nop36:FAR
EXTRN _gfx_getPageSeg:FAR

; --- External data variables (in endslots.asm) ---
EXTRN _commData:BYTE
EXTRN _worldBufOffset:WORD
EXTRN _worldBufSegment:WORD
EXTRN _quitFlag:BYTE
EXTRN _timerCounter:BYTE
EXTRN _timerCounter2:BYTE
EXTRN _timerCounter3:BYTE
EXTRN _timerCounter4:BYTE
EXTRN _timerHandlerInstalled:BYTE
EXTRN _joyAxisX:BYTE
EXTRN _ovlInsaneFlag:BYTE
EXTRN _clipDivZeroHandler:BYTE
EXTRN _clearRectX:WORD
EXTRN _clearRectY:WORD
EXTRN _clearRectWidth:WORD
EXTRN _clearRectHeight:WORD
EXTRN _lineX1:WORD
EXTRN _lineX2:WORD
EXTRN _lineY1:WORD
EXTRN _lineY2:WORD
EXTRN _dirtyMinBuf:BYTE
EXTRN _dirtyMaxBuf:BYTE
EXTRN _dirtyRectMin:WORD
EXTRN _dirtyRectMax:WORD
EXTRN _clipOutcode:BYTE
EXTRN _clipDx:WORD
EXTRN _clipDy:WORD
EXTRN _clipDxHalf:WORD
EXTRN _clipDyHalf:WORD
EXTRN _clipMaxX:WORD
EXTRN _clipMaxY:WORD
EXTRN _var_timerFlag:BYTE
EXTRN _timerCalSumLo:WORD
EXTRN _timerCalSumHi:WORD
EXTRN _timerCountLo:WORD
EXTRN _timerCountHi:WORD
EXTRN _timerTarget:WORD
EXTRN _timerDivisor:WORD
EXTRN _timerTickCnt:WORD
EXTRN _timerReload:WORD
EXTRN _timerDivider:BYTE
EXTRN _timerMode:BYTE
EXTRN _timerSyncRetrace:BYTE
EXTRN _timerTick:WORD
EXTRN _timerRetrace:WORD
EXTRN _fileReadBuf:BYTE
EXTRN _fileReadPos:WORD
EXTRN _tmpFileHandle:WORD
EXTRN _picDecodedRowBuf:BYTE
EXTRN _picScreenBufSize:WORD
EXTRN _picPageIndex:WORD
EXTRN _picRowOffset:WORD
EXTRN _picRow:WORD
EXTRN _picReadFromFilePtr:WORD
EXTRN _picReadBufEndPtr:WORD
EXTRN _picWorkDataPtr:WORD
EXTRN _picRowLength:WORD
EXTRN _picProcessFlag:BYTE
EXTRN _picLookupResult:BYTE
EXTRN _picTmp9BitCount:BYTE
EXTRN _picByte:BYTE
EXTRN _picFileReadBufEnd:WORD
EXTRN _picNumberDictSlots:WORD
EXTRN _picFileWord:WORD
EXTRN _picRemainingBitCount:BYTE
EXTRN _picByteUnsignedFlag:BYTE
EXTRN _picSlotCounter:WORD
EXTRN _picDictionaryIndex:BYTE
EXTRN _picDecodeDictionary:WORD
EXTRN _picDecodeIncrement:BYTE
EXTRN _joyMinValues:WORD
EXTRN _joyCenterValues:WORD
EXTRN _joyMaxValues:WORD
EXTRN _joyRangeBelow:WORD
EXTRN _joyRangeAbove:WORD
EXTRN _joyRawAxis0:WORD
EXTRN _joyRawAxis1:WORD
EXTRN _origCBreakSeg:WORD
EXTRN _origCBreakOfs:WORD
EXTRN _errorCodeStr:WORD
EXTRN _str_fileNotFound:BYTE
EXTRN _str_noFileBufs:BYTE
EXTRN _str_openError:BYTE
EXTRN _str_fileCloseError:BYTE
EXTRN _str_readError:BYTE
EXTRN _str_writeError:BYTE
EXTRN _lzw2DictBuf:BYTE
EXTRN _picWorkData:BYTE
EXTRN _lzw2CodeBitWidth:BYTE
EXTRN _lzw2MaxBitWidth:BYTE
EXTRN _lzw2CodeMask:WORD
EXTRN _lzw2NextSlot:WORD
EXTRN _lzw2ReadByte:BYTE
EXTRN _lzw2BitPos:BYTE
EXTRN _lzw2StackPtr:WORD
EXTRN _lzw2PrevCode:WORD
EXTRN _lzw2CurCode:WORD
EXTRN _lzw2FirstChar:BYTE
.CODE

PUBLIC _clearRect
PUBLIC _mystrcat
PUBLIC _setTimerIrqHandler
PUBLIC _decodePicRaw
PUBLIC _copyJoystickData

; --- Code segment ---

PUBLIC _pollJoystick

PUBLIC _setupWorldBufPtr
_setupWorldBufPtr:
setupWorldBufPtr proc near
    mov AX,word ptr [_commData]
    mov DX,word ptr [_commData + 2]
    db 05h, 7Ah, 00h  ; add AX,7Ah (force word-immediate)
    mov word ptr [_worldBufOffset],AX
    mov word ptr [_worldBufSegment],DX
    mov AX,1h
    ret
setupWorldBufPtr endp

; --- shared strcat
INCLUDE shared/str_strcat.inc
_mystrcat equ mystrcat

PUBLIC _intDispatch
_intDispatch:
; --- shared interrupt dispatch routine
INCLUDE shared/overlay_dispatch.inc

PUBLIC _dos_printstring
_dos_printstring:
; --- shared DOS print string routine
INCLUDE shared/file_printstring.inc

PUBLIC _setupOverlaySlots
_setupOverlaySlots:
; --- shared overlay slot setup routine
ovlInsaneFlag    EQU _ovlInsaneFlag
ovlJumpTable     EQU _gfx_allocPage
INCLUDE shared/overlay_slots.inc

; --- shared clearRect
clearRectGetCurBuf EQU _gfx_getCurPageSeg
clearRectSetCurBuf EQU _gfx_setPage1
clearRectSetVal    EQU _gfx_setDrawColor
clearRectJump28    EQU _gfx_dirtyRect2
clearRectJump22    EQU _gfx_nop22
clearRectNull      EQU _gfx_nop51
clearRectGetBufPtr EQU _gfx_setCurPageSeg
clearRectX     EQU _clearRectX
clearRectY     EQU _clearRectY
clearRectWidth     EQU _clearRectWidth
clearRectHeight     EQU _clearRectHeight
clearRectDirtyMinBuf     EQU _dirtyMinBuf
clearRectDirtyMaxBuf     EQU _dirtyMaxBuf
clearRectDirtyMin     EQU _dirtyRectMin
clearRectDirtyMax     EQU _dirtyRectMax
INCLUDE shared/gfx_clearrect.inc
    db 0C3h
_clearRect equ clearRect

; --- shared graphics routines
dirtyRectMin     EQU _dirtyRectMin
dirtyRectMax     EQU _dirtyRectMax
dirtyMinBuf      EQU _dirtyMinBuf
dirtyMaxBuf      EQU _dirtyMaxBuf
lineX1           EQU _lineX1
lineY1           EQU _lineY1
lineX2           EQU _lineX2
lineY2           EQU _lineY2
clipDx           EQU _clipDx
clipDy           EQU _clipDy
clipDxHalf       EQU _clipDxHalf
clipDyHalf       EQU _clipDyHalf
clipOutcode      EQU _clipOutcode
clipMaxX         EQU _clipMaxX
clipMaxY         EQU _clipMaxY
clipDivZeroHandler EQU _clipDivZeroHandler
CALL_GFX_1F MACRO
    call far ptr _gfx_drawLine
ENDM
PUBLIC _drawLineWrapper
INCLUDE shared/gfx.inc

; routine_154 (drawLineWrapper), routine_158 (clipAndDrawLine), and computeOutcode
; are now provided by shared_gfx.inc above
; Alias for callers that used the old name
routine_154 EQU _drawLineWrapper

; --- shared Ctrl+Break handler
PUBLIC _installCBreakHandler
PUBLIC _restoreCbreakHandler
cbreakSavedSeg   EQU _origCBreakSeg
cbreakSavedOfs   EQU _origCBreakOfs
cbreakFlag       EQU _quitFlag
INCLUDE shared/cbreak.inc
; remaining code that was inside the original routine_33 scope

PUBLIC _openFile
_openFile:
; --- shared open file routine
fileNotFoundStr  EQU _str_fileNotFound
fileNoBufsStr    EQU _str_noFileBufs
fileOpenErrorStr EQU _str_openError
fileReadPosVar   EQU _fileReadPos
fileErrorExit    EQU errorDescAndExit
INCLUDE shared/file_open.inc

PUBLIC _createFile
_createFile:
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AH,3ch
    mov CX,word ptr [BP + Stack[4h]+2h]
    mov BX,SS
    mov DS,BX
    mov DX,word ptr [BP + Stack[2h]+2h]
    int 21h
    jnc LAB_1000_144e
    db 3Dh, 02h, 00h  ; cmp AX,02h (force word-immediate)
    jnz LAB_1000_142d
LAB_1000_1421:
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov AX,offset _str_fileNotFound
    mov CX,0ffffh
    jmp errorDescAndExit
LAB_1000_142d:
    db 3Dh, 03h, 00h  ; cmp AX,03h (force word-immediate)
    jz LAB_1000_1421
    db 3Dh, 04h, 00h  ; cmp AX,04h (force word-immediate)
    jnz LAB_1000_1443
    mov CX,0ffffh
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov AX,offset _str_noFileBufs
    jmp errorDescAndExit
LAB_1000_1443:
    mov CX,AX
    mov AX,offset _str_openError
    mov BX,word ptr [BP + Stack[2h]+2h]
    jmp errorDescAndExit
LAB_1000_144e:
    mov word ptr [_fileReadPos],200h
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret

PUBLIC _fileClose
_fileClose:
; --- shared file close routine
fileCloseErrorStr EQU _str_fileCloseError
fileCloseErrExit  EQU errorAndExit
INCLUDE shared/file_close.inc

PUBLIC _readFile
_readFile:
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AH,3fh
    mov BX,SS
    mov DS,BX
    mov BX,word ptr [BP + 4h]
    mov CX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    int 21h
    jnc LAB_1000_14a1
    mov DX,offset _str_readError
    mov CX,0ffffh
    jmp errorAndExit
LAB_1000_14a1:
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret

PUBLIC _readFileAt
_readFileAt:
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    push DS
    mov AH,3fh
    mov BX,word ptr [BP + 0ah]
    mov DS,BX
    mov BX,word ptr [BP + 4h]
    mov CX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    int 21h
    pop DS
    jnc LAB_1000_14cf
    mov DX,offset _str_readError
    mov CX,0ffffh
    jmp errorAndExit
LAB_1000_14cf:
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret

; --- shared file read 512
fileRead512Handle  EQU _tmpFileHandle
fileRead512Buf     EQU _fileReadBuf
fileRead512ErrStr  EQU _str_readError
fileRead512ErrExit EQU errorAndExit
INCLUDE shared/file_read512.inc

PUBLIC _writeFile
_writeFile:
; --- shared file write
fileWriteErrStr  EQU _str_writeError
fileWriteErrExit EQU errorAndExit
INCLUDE shared/file_write.inc
readFileAtExRaw equ writeFileAtRaw

; --- shared file error handler
fileErrorCodeStr EQU _errorCodeStr
INCLUDE shared/file_error.inc

; --- shared pic decoding routines
picFileReadPos       EQU _fileReadPos
picFileReadBuf       EQU _fileReadBuf
picDecodedRowBuf     EQU _picDecodedRowBuf
picRowLength         EQU _picRowLength
picScreenBufSize     EQU _picScreenBufSize
picPageIndex         EQU _picPageIndex
picRowOffset         EQU _picRowOffset
picRow               EQU _picRow
picReadFromFilePtr   EQU _picReadFromFilePtr
picFileHandle        EQU _tmpFileHandle
picReadBufEndPtr     EQU _picReadBufEndPtr
picWorkData          EQU _picWorkData
picWorkDataPtr       EQU _picWorkDataPtr
picProcessFlag       EQU _picProcessFlag
picLookupResult      EQU _picLookupResult
picFileWord          EQU _picFileWord
picRemainingBitCount EQU _picRemainingBitCount
picByteUnsignedFlag  EQU _picByteUnsignedFlag
picByte              EQU _picByte
picTmp9BitCount      EQU _picTmp9BitCount
picFileReadBufEnd    EQU _picFileReadBufEnd
picNumberDictSlots   EQU _picNumberDictSlots
picDecodeDictionary  EQU _picDecodeDictionary
picDecodeIncrement   EQU _picDecodeIncrement
picSlotCounter       EQU _picSlotCounter
picDictionaryIndex   EQU _picDictionaryIndex
picInitRoutine       EQU picInitStub
picReadFileFunc      EQU read512FromFileIntoBuf

PUBLIC _showPicFile
_showPicFile:
INCLUDE shared/pic_showpicfile.inc

_decodePicRaw:
decodePicRaw proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,offset read512FromFileIntoBuf
    mov word ptr [_picReadFromFilePtr],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [_tmpFileHandle],AX
    mov AX,word ptr [BP + Stack[4h]+2h]
    mov ES,AX
    call far ptr _gfx_clearPage
    call picInitStub
    mov word ptr [_picRow],0h
    mov word ptr [_picScreenBufSize],0fa00h
LAB_1000_1702:
    mov DI,word ptr [_picRow]
    call far ptr _gfx_getRowOffset
    mov word ptr [_picRowOffset],AX
    call decodePicRow
    mov DI,word ptr [_picRowOffset]
    mov BP,offset _picDecodedRowBuf
    mov BX,word ptr [_picRow]
    call far ptr _gfx_fillRow
    mov DI,word ptr [_picRowOffset]
    call far ptr _gfx_nop37
    inc word ptr [_picRow]
    sub word ptr [_picScreenBufSize],140h
    jnz LAB_1000_1702
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
decodePicRaw endp

PUBLIC _decodePic
_decodePic:
INCLUDE shared/pic_decodepic.inc

picInitStub proc near
    ret
    db 00h
picInitStub endp

INCLUDE shared/pic_lzw.inc
    db 00h

PUBLIC _dos_alloc
_dos_alloc:
; --- shared DOS memory allocate routine
INCLUDE shared/file_alloc.inc

PUBLIC _dos_free
_dos_free:
dos_free proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AH,49h
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov ES,BX
    int 21h
    jc LAB_1000_1a83
    mov AX,0h
LAB_1000_1a83:
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
    db 00h
    push BP
    mov BP,SP
    push DI
    mov AX,word ptr [BP + 8h]
    mov ES,AX
    xor DI,DI
    call lzwDecoderInit
    mov CX,word ptr [BP + 4h]
    or CX,CX
    jz LAB_1000_1aaa
LAB_1000_1aa1:
    call lzwGetByte
    or AL,AL
    jnz LAB_1000_1aa1
    loop LAB_1000_1aa1
LAB_1000_1aaa:
    mov BX,word ptr [BP + 6h]
    mov CX,200h
LAB_1000_1ab0:
    push BX
    call lzwGetByte
    pop BX
    mov byte ptr [BX],AL
    inc BX
    or AL,AL
    loopnz LAB_1000_1ab0
    mov AX,word ptr [BP + 6h]
    pop DI
    pop BP
    ret
dos_free endp

lzwDecoderInit proc near
    call lzwInitDictionary
    mov word ptr [_lzw2StackPtr],0h
    mov byte ptr [_lzw2BitPos],0h
    mov AL,byte ptr ES:[DI]
    inc DI
    mov byte ptr [_lzw2MaxBitWidth],AL
    ret
lzwDecoderInit endp

lzwInitDictionary proc near
    mov byte ptr [_lzw2CodeBitWidth],9h
    mov word ptr [_lzw2CodeMask],1ffh
    mov word ptr [_lzw2NextSlot],100h
    mov BX,offset _picDecodeDictionary
    mov AX,0ffffh
    mov CX,800h
LAB_1000_1af2:
    mov word ptr [BX],AX
    add BX,3h
    loop LAB_1000_1af2
    mov BX,offset _picDecodeDictionary
    mov AL,0h
    mov CX,100h
LAB_1000_1b01:
    mov byte ptr [BX + 2h],AL
    inc AL
    add BX,3h
    loop LAB_1000_1b01
    ret
lzwInitDictionary endp

lzwGetByte proc near
    mov BX,word ptr [_lzw2StackPtr]
    or BX,BX
    jnz LAB_1000_1b17
    call lzwDecodeNext
LAB_1000_1b17:
    dec word ptr [_lzw2StackPtr]
    mov BX,word ptr [_lzw2StackPtr]
    mov AL,byte ptr [BX + offset _lzw2DictBuf]
    ret
lzwGetByte endp

lzwDecodeNext proc near
    push CX
    call lzwReadCode
    mov word ptr [_lzw2CurCode],CX
    cmp CX,word ptr [_lzw2NextSlot]
    jl LAB_1000_1b4b
    mov AL,byte ptr [_lzw2FirstChar]
    mov BX,word ptr [_lzw2StackPtr]
    mov byte ptr [BX + offset _lzw2DictBuf],AL
    inc word ptr [_lzw2StackPtr]
    mov CX,word ptr [_lzw2PrevCode]
    mov AX,word ptr [_lzw2NextSlot]
    mov word ptr [_lzw2CurCode],AX
LAB_1000_1b4b:
    mov BX,offset _picDecodeDictionary
    add BX,CX
    add BX,CX
    add BX,CX
    mov AX,word ptr [BX]
    inc AX
    jz LAB_1000_1b72
    dec AX
    mov CX,AX
    mov AL,byte ptr [BX + 2h]
    mov BX,word ptr [_lzw2StackPtr]
    cmp BX,40h
    jnc LAB_1000_1b6c
    mov byte ptr [BX + offset _lzw2DictBuf],AL
LAB_1000_1b6c:
    inc word ptr [_lzw2StackPtr]
    jmp LAB_1000_1b4b
LAB_1000_1b72:
    mov AL,byte ptr [BX + 2h]
    mov byte ptr [_lzw2FirstChar],AL
    mov BX,word ptr [_lzw2StackPtr]
    mov byte ptr [BX + offset _lzw2DictBuf],AL
    inc word ptr [_lzw2StackPtr]
    mov CX,word ptr [_lzw2NextSlot]
    mov BX,offset _picDecodeDictionary
    add BX,CX
    add BX,CX
    add BX,CX
    mov byte ptr [BX + 2h],AL
    mov AX,word ptr [_lzw2PrevCode]
    mov word ptr [BX],AX
    inc word ptr [_lzw2NextSlot]
    mov AX,word ptr [_lzw2NextSlot]
    cmp AX,word ptr [_lzw2CodeMask]
    jle LAB_1000_1baf
    inc byte ptr [_lzw2CodeBitWidth]
    stc
    rcl word ptr [_lzw2CodeMask],1h
LAB_1000_1baf:
    mov AL,byte ptr [_lzw2CodeBitWidth]
    cmp AL,byte ptr [_lzw2MaxBitWidth]
    jle LAB_1000_1bbb
    call lzwInitDictionary
LAB_1000_1bbb:
    mov AX,word ptr [_lzw2CurCode]
    mov word ptr [_lzw2PrevCode],AX
    pop CX
    ret
lzwDecodeNext endp

lzwReadCode proc near
    xor DH,DH
    mov DL,byte ptr [_lzw2ReadByte]
    mov BL,byte ptr [_lzw2BitPos]
    mov CL,8h
    sub CL,BL
    shr DX,CL
LAB_1000_1bd3:
    cmp BL,byte ptr [_lzw2CodeBitWidth]
    jge LAB_1000_1bed
    mov AL,byte ptr ES:[DI]
    inc DI
    mov byte ptr [_lzw2ReadByte],AL
    mov CL,BL
    xor AH,AH
    shl AX,CL
    or DX,AX
    add BL,8h
    jmp LAB_1000_1bd3
LAB_1000_1bed:
    sub BL,byte ptr [_lzw2CodeBitWidth]
    mov byte ptr [_lzw2BitPos],BL
    mov CX,DX
    and CX,word ptr [_lzw2CodeMask]
    ret
lzwReadCode endp

TIMER_VAR_74 EQU <word ptr [_timerReload]>
TIMER_VAR_80 EQU <word ptr [_timerTick]>
TIMER_VAR_70 EQU <word ptr [_timerCountLo]>
TIMER_VAR_71 EQU <word ptr [_timerCountHi]>
TIMER_CALIBRATE EQU <calibrateTimerSpeed>
TIMER_ISR_PTR EQU <timerIsrPtr+1>
TIMER_IRQ_ADDR EQU <dword ptr [var_1]>
TIMER_INSTALLED EQU <byte ptr [_timerHandlerInstalled]>
INCLUDE shared/timer_setHandler.inc
setTimerIrqHandler EQU _setTimerIrqHandler

PUBLIC _restoreTimerIrqHandler
INCLUDE shared/timer_restore.inc
restoreTimerIrqHandler EQU _restoreTimerIrqHandler

var_1:
    dw offset timerIrqHandler
    dw seg timerIrqHandler
TIMER_VAR_DIVISOR EQU <word ptr [_timerDivisor]>
TIMER_VAR_COUNT_LO EQU <word ptr [_timerCountLo]>
TIMER_VAR_COUNT_HI EQU <word ptr [_timerCountHi]>
TIMER_VAR_TICK EQU <word ptr [_timerTick]>
TIMER_VAR_FLAG EQU <byte ptr [_var_timerFlag]>
TIMER_VAR_DIVIDER EQU <byte ptr [_timerDivider]>
TIMER_VAR_SYNC EQU <byte ptr [_timerSyncRetrace]>
TIMER_VAR_TARGET EQU <word ptr [_timerTarget]>
TIMER_VAR_TICKCNT EQU <word ptr [_timerTickCnt]>
TIMER_VAR_RETRACE EQU <word ptr [_timerRetrace]>
TIMER_VAR_CALSUM_LO EQU <word ptr [_timerCalSumLo]>
TIMER_VAR_CALSUM_HI EQU <word ptr [_timerCalSumHi]>
TIMER_VAR_MODE EQU <word ptr [_timerMode]>
TIMER_INC_COUNTERS EQU <_incTimerCounters>
TIMER_CALLBACK EQU <timerIrqCallback>
TIMER_AUDIO_6C_CALL EQU <db 09Ah, 024h, 012h, 080h, 015h>
_timerIrqHandler:
INCLUDE shared/timer_isr.inc
INCLUDE shared/timer_callback.inc
INCLUDE shared/timer_calibrate.inc

INCLUDE shared/timer_manipulate.inc

PUBLIC _getTimeOfDay
_getTimeOfDay:
getTimeOfDay proc near
    xor AH,AH
    int 1Ah
    mov AX,DX
    ret
_incTimerCounters proc near
    inc byte ptr [_timerCounter4]
    inc byte ptr [_timerCounter2]
    inc byte ptr [_timerCounter]
    inc byte ptr [_timerCounter3]
    ret
_incTimerCounters endp
getTimeOfDay endp

; --- shared joystick routines
joyRawAxis0      EQU _joyRawAxis0
joyRawAxis1      EQU _joyRawAxis1
joyMinValues     EQU _joyMinValues
joyMaxValues     EQU _joyMaxValues
joyCenterValues  EQU _joyCenterValues
joyRangeBelow    EQU _joyRangeBelow
joyRangeAbove    EQU _joyRangeAbove
joyNormAxes      EQU _joyAxisX
INCLUDE shared/joystick.inc
_pollJoystick equ pollJoystick
_copyJoystickData equ copyJoystickData

END
