DOSSEG
.8086
.MODEL SMALL

DOS_SET_IRQH	 = 25h
IRQ_PIT		 = 8
IRQ_CBREAK	 = 1Bh
PORT_PIT_TIME0	 = 40h
PORT_PIT_CNTRL	 = 43h
BDA_CRTC	 = 463h
OVL_HDR_SIZE1	 = 1Eh
OVL_HDR_SIZE2	 = 20h

IFDEF DEBUG
    EXTRN _my_fartrace:PROC

    trace MACRO msg,v1,v2,v3,v4,v5
        popsize = 4
        push es
        push ax
        push bx
        IFNB <v5>
        push [v5]
        popsize = popsize + 2
        ENDIF
        IFNB <v4>
        push [v4]
        popsize = popsize + 2
        ENDIF
        IFNB <v3>
        push [v3]
        popsize = popsize + 2
        ENDIF
        IFNB <v2>
        push [v2]
        popsize = popsize + 2
        ENDIF
        IFNB <v1>
        push [v1]
        popsize = popsize + 2
        ENDIF
        mov ax,offset msg
        push cs
        push ax
        call _my_fartrace
        add sp,popsize
        pop bx
        pop ax
        pop es
    ENDM

    regtrace MACRO
        push es
        push ax
    ;   regstr db 'regs: ax=%x bx=%x cx=%x dx=%x si=%x di=%x ds=%x es=%x'
        push es
        push ds
        push di
        push si
        push dx
        push cx
        push bx
        push ax
        mov ax,offset regstr
        push cs
        push ax
        call _my_fartrace
        add sp,20
        pop ax
        pop es
    ENDM
ELSE
    trace MACRO msg,v1,v2,v3,v4,v5
    ENDM

    regtrace MACRO
    ENDM
ENDIF

EXTRN _gfx_getPageSeg:FAR
EXTRN _gfx_clearPage:FAR
EXTRN _gfx_fillRow:FAR
EXTRN _gfx_copyRow:FAR
EXTRN _gfx_allocPage:FAR
EXTRN _gfx_getCurPageSeg:FAR
EXTRN _gfx_setPage1:FAR
EXTRN _gfx_setDrawColor:FAR
EXTRN _gfx_dirtyRect2:FAR
EXTRN _gfx_nop22:FAR
EXTRN _gfx_nop51:FAR
EXTRN _gfx_setCurPageSeg:FAR
EXTRN _gfx_drawLine:FAR
EXTRN _audio_jump_6b:FAR
EXTRN _gfx_getRowOffset:FAR
EXTRN _gfx_fillRow2:FAR
EXTRN _gfx_nop36:FAR
EXTRN _audio_jump_6c:FAR
EXTRN _timerReload:WORD
EXTRN _timerTick:WORD
EXTRN _timerCountLo:WORD
EXTRN _timerCountHi:WORD
EXTRN _timerHandlerInstalled:BYTE
EXTRN _timerDivisor:WORD
EXTRN _timerFlag:BYTE
EXTRN _timerDivider:BYTE
EXTRN _timerSyncRetrace:BYTE
EXTRN _timerTickCnt:WORD
EXTRN _timerRetrace:WORD
EXTRN _timerCalSumHi:WORD
EXTRN _timerMode:WORD
EXTRN _timerCalSumLo:WORD
EXTRN _timerTarget:WORD
EXTRN _timerCounter2: BYTE
EXTRN _timerCounter3:BYTE
EXTRN _timerCounter:BYTE
EXTRN _timerCounter4:BYTE
EXTRN _searchFCB:BYTE
EXTRN _picReadFromFilePtr:WORD
EXTRN _tmpFileHandle:WORD
EXTRN _picPageIndex:WORD
EXTRN _picRowOffset:WORD
EXTRN _picCurrentRow:WORD
EXTRN _ovlInsaneFlag:BYTE
EXTRN _aAlloc1M:BYTE
EXTRN _ovlParCnt:WORD
EXTRN _aDosLied:BYTE
EXTRN _ovlSeg1:WORD
EXTRN _ovlSeg2:WORD
EXTRN _ovlParBlock:WORD
EXTRN _aFileNFound:BYTE
EXTRN _aEnoughMem:BYTE
EXTRN _aOvlFail:BYTE
EXTRN _aOvlOvrrun:BYTE
EXTRN _aOvlShrink:BYTE
EXTRN _clearRectWidth:WORD
EXTRN _clearRectHeight:WORD
EXTRN _clearRectY:WORD
EXTRN _clearRectX:WORD
EXTRN _dirtyMaxBuf:BYTE
EXTRN _dirtyMinBuf:BYTE
EXTRN _dirtyRectMin:WORD
EXTRN _dirtyRectMax:WORD
EXTRN _clipDivZeroHandler:BYTE
EXTRN _lineX1:WORD
EXTRN _lineY1:WORD
EXTRN _lineX2:WORD
EXTRN _lineY2:WORD
EXTRN _clipDx:WORD
EXTRN _clipDxHalf:WORD
EXTRN _clipOutcode:BYTE
EXTRN _clipDy:WORD
EXTRN _clipDyHalf:WORD
EXTRN _clipMaxX:WORD
EXTRN _clipMaxY:WORD
EXTRN _origCBreakSeg:WORD
EXTRN _origCBreakOfs:WORD
EXTRN _cbreakHit:BYTE
EXTRN _aFileNotFound:BYTE
EXTRN _aNoFileBuffersAvailable:BYTE
EXTRN _aOpenError:BYTE
EXTRN _fileReadPos:WORD
EXTRN _fileReadBuf:BYTE
EXTRN _aReadError:BYTE
EXTRN _errorCodeStr:WORD
EXTRN _picRow:WORD
EXTRN _picScreenBufSize:WORD
EXTRN _picDecodedRowBuf:BYTE
EXTRN _picWorkData:BYTE
EXTRN _picReadBufEndPtr:WORD
EXTRN _picFileWord:WORD
EXTRN _picRemainingBitCount:BYTE
EXTRN _picByte:BYTE
EXTRN _picTmp9BitCount:BYTE
EXTRN _picFileReadBufEnd:WORD
EXTRN _picDecodeDictionary:WORD
EXTRN _picDecodeIncrement:BYTE
EXTRN _picRowLength:WORD
EXTRN _picWorkDataPtr:WORD
EXTRN _picNumberDictSlots:WORD
EXTRN _picLookupResult:BYTE
EXTRN _picProcessFlag0_1:BYTE
EXTRN _picByteUnsignedFlag:BYTE
EXTRN _picDictionaryIndex:BYTE
EXTRN _picSlotCounter:WORD
EXTRN _joyRawAxis1:WORD
EXTRN _joyRawAxis0:WORD
EXTRN _joyCenterValues:WORD
EXTRN _joyMinValues:WORD
EXTRN _joyRangeBelow:WORD
EXTRN _joyMaxValues:WORD
EXTRN _joyRangeAbove:WORD
EXTRN _joyAxes:BYTE
EXTRN _diskTransferArea:BYTE
EXTRN _fcbMatchStr:BYTE
EXTRN _aFileClosingError:BYTE
EXTRN _aWriteError:BYTE

PUBLIC _mystrlen
PUBLIC _mystrcat
PUBLIC _showPicFile
PUBLIC _copyJoystickData
PUBLIC _restoreTimerIrqHandler
PUBLIC _intDispatch
PUBLIC _installCBreakHandler
PUBLIC _dos_alloc
PUBLIC _loadOverlay
PUBLIC _dos_printstring
PUBLIC _clearRect
PUBLIC _restoreCbreakHandler
PUBLIC _setTimerIrqHandler
PUBLIC _getTimeOfDay
PUBLIC _decodePic
PUBLIC _nearmemset
PUBLIC _openFile
PUBLIC _picBlit
PUBLIC _setupOverlaySlots
PUBLIC _pollJoystick
PUBLIC _doFcbSearch
PUBLIC _doNothing2
PUBLIC _drawLineWrapper
PUBLIC _fileClose

;startCode1 segment word public 'CODE' ;startCode1 segment byte public 'CODE'
.CODE

regstr db 'regs: ax=%04X bx=%04X cx=%04X dx=%04X si=%04X di=%04X ds=%04X es=%04X',0

timerIrqAddr	dd timerIrqHandler
word_12983	dw 0

_doNothing2 proc near
    retn
_doNothing2 endp

nullsub_1 proc near
    retn
nullsub_1 endp

TIMER_VAR_74 EQU <word ptr _timerReload>
TIMER_VAR_80 EQU <word ptr _timerTick>
TIMER_VAR_70 EQU <word ptr _timerCountLo>
TIMER_VAR_71 EQU <word ptr _timerCountHi>
TIMER_CALIBRATE EQU <calibrateTimerSpeed>
TIMER_ISR_PTR EQU <timerIsrPtr+1>
TIMER_IRQ_ADDR EQU <dword ptr timerIrqAddr>
TIMER_INSTALLED EQU <_timerHandlerInstalled>
INCLUDE shared/timer_setHandler.inc
INCLUDE shared/timer_restore.inc
TIMER_VAR_DIVISOR EQU <word ptr _timerDivisor>
TIMER_VAR_COUNT_LO EQU <word ptr _timerCountLo>
TIMER_VAR_COUNT_HI EQU <word ptr _timerCountHi>
TIMER_VAR_TICK EQU <word ptr _timerTick>
TIMER_VAR_FLAG EQU <byte ptr _timerFlag>
TIMER_VAR_DIVIDER EQU <byte ptr _timerDivider>
TIMER_VAR_SYNC EQU <byte ptr _timerSyncRetrace>
TIMER_VAR_TARGET EQU <word ptr _timerTarget>
TIMER_VAR_TICKCNT EQU <word ptr _timerTickCnt>
TIMER_VAR_RETRACE EQU <word ptr _timerRetrace>
TIMER_VAR_CALSUM_LO EQU <word ptr _timerCalSumLo>
TIMER_VAR_CALSUM_HI EQU <word ptr _timerCalSumHi>
TIMER_VAR_MODE EQU <word ptr _timerMode>
TIMER_INC_COUNTERS EQU <increaseTimerCounters>
TIMER_CALLBACK EQU <timerIrqCallback>
TIMER_AUDIO_6C_CALL EQU <call far ptr _audio_jump_6c>
INCLUDE shared/timer_isr.inc
INCLUDE shared/timer_callback.inc
INCLUDE shared/timer_calibrate.inc
INCLUDE shared/timer_manipulate.inc
_getTimeOfDay proc near
    xor ah, ah
    int 1Ah ;CLOCK - GET TIME OF DAY
    mov ax, dx
    retn
_getTimeOfDay endp
increaseTimerCounters proc near
    inc _timerCounter2
    inc _timerCounter3
    inc _timerCounter
    inc _timerCounter4
    call far ptr _audio_jump_6b
    retn
increaseTimerCounters endp
_doFcbSearch proc near
    mov ah, 1Ah
    mov dx, offset _diskTransferArea
    int 21h ;DOS - SET DISK TRANSFER AREA ADDRESS
    mov ah, 11h
    mov dx, offset _searchFCB
    int 21h ;DOS - SEARCH FIRST USING FCB
    or al, al
    jnz short locret_11B02
    xor ah, ah
    mov bx, 0FFFFh
loc_11AF3:
    inc bx
    mov al, _fcbMatchStr[bx]
    or al, al
    jz short locret_11B02
    sub al, (_diskTransferArea+8)[bx]
    jz short loc_11AF3
locret_11B02:
    retn
_doFcbSearch endp
_picBlit proc near
    arg_0 = word ptr 4
    unk = word ptr 6
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ax, offset read512FromFileIntoBuf
    mov _picReadFromFilePtr, ax
    mov ax, [bp+arg_0]
    mov _tmpFileHandle, ax
    mov ax, [bp+unk]
    mov _picPageIndex, ax
    mov si, _picPageIndex
loc_11B20:
    call far ptr _gfx_getPageSeg
    call far ptr _gfx_clearPage ;zeroes out 32000 bytes
    mov _picCurrentRow, 0
    mov _picRowOffset, 0
loc_11B36:
    mov di, _picCurrentRow
    shl di, 1
    call decodePicRow
    mov di, _picRowOffset
    mov bp, offset _picDecodedRowBuf
loc_11B46:
    mov bx, _picCurrentRow
    call far ptr _gfx_fillRow
    mov di, _picRowOffset
    call far ptr _gfx_copyRow
    inc _picCurrentRow
    add _picRowOffset, 28h
    cmp _picCurrentRow, 2BCh
    jnz short loc_11B36
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
locret_11B70:
    retn
_picBlit endp
_mystrlen proc near
    arg_0 = word ptr 4
    push bp
    mov bp, sp
    mov ax, [bp+arg_0]
loc_12703:
    mov bx, [bp+arg_0]
    inc [bp+arg_0]
    cmp byte ptr [bx], 0
    jnz short loc_12703
loc_1270E:
    mov bx, [bp+arg_0]
    sub ax, bx
    not ax
    mov sp, bp
    pop bp
    retn
_mystrlen endp
; --- shared strcat
INCLUDE shared/str_strcat.inc
_mystrcat equ mystrcat
_nearmemset proc near
    arg_0 = word ptr 4
    count = word ptr 6
    arg_4 = word ptr 8
    push bp
    mov bp, sp
    push di
    mov ax, ds
    mov es, ax
    mov al, byte ptr [bp+count]
    mov di, [bp+arg_0]
    mov cx, [bp+arg_4]
    rep stosb
    pop di
    pop bp
    retn
_nearmemset endp
; --- shared interrupt dispatch routine
INCLUDE shared/overlay_dispatch.inc
_intDispatch equ intDispatch
; --- shared DOS print string routine
INCLUDE shared/file_printstring.inc
_dos_printstring equ dos_printstring
_loadOverlay proc near
    arg_0 = word ptr 4
    filename = word ptr 6
    push bp
loc_12986:
    mov bp, sp
    push di
    push si
    push es
    push ds
    push bp
    mov dx, [bp+arg_0]
    mov _ovlInsaneFlag, 0
    jmp short loc_1299D
    nop
    mov _ovlInsaneFlag, 1
loc_1299D:
    mov ax, @data
    mov es, ax
    push dx
    mov ah, 48h
    mov bx, 0FFFFh
    int 21h ;DOS - 2+ - ALLOCATE MEMORY
    jb short loc_129B6
    mov dx, offset _aAlloc1M ;"Allocated 1Mb of space????$"
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp loc_12A83
loc_129B6:
    mov ah, 48h
    sub bx, 400h
    mov _ovlParCnt, bx
    int 21h ;DOS - 2+ - ALLOCATE MEMORY
    jnb short loc_129CE
    mov dx, offset _aDosLied ;"MS-DOS lied to us about how much memory"...
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp loc_12A83
loc_129CE:
    mov _ovlSeg1, ax
    mov _ovlParBlock, ax
    mov _ovlSeg2, ax
    mov bx, offset _ovlParBlock
    mov ax, 4B03h
    pop dx
    mov cs:word_12983, sp
    int 21h ;DOS - 2+ - LOAD OR EXECUTE (EXEC)
    jnb short loc_12A0F
    db 3Dh ;cmp ax, 2
    dw 2
    jnz short loc_129F6
    mov dx, offset _aFileNFound ;"Filename not found$"
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp loc_12A83
loc_129F6:
    db 3Dh ;cmp ax, 8
    dw 8
    jnz short loc_12A05
    mov dx, offset _aEnoughMem ;"Not enough memory to load file$"
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp short loc_12A83
    nop
loc_12A05:
    mov dx, offset _aOvlFail ;"Overlay load failed for some reason$"
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp short loc_12A83
    nop
loc_12A0F:
    mov sp, cs:word_12983
    mov ax, @data
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov ax, _ovlSeg1
    mov es, ax
    mov di, OVL_HDR_SIZE1
    mov bx, es:[di]
    shr bx, 1
    shr bx, 1
    shr bx, 1
    shr bx, 1
    mov di, OVL_HDR_SIZE2
    mov cx, es:[di]
    shr cx, 1
    shr cx, 1
    shr cx, 1
    shr cx, 1
    add bx, cx
    cmp bx, _ovlParCnt
    jbe short loc_12A50
    mov dx, offset _aOvlOvrrun ;"Overlay has overrun allocated memory$"
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp short loc_12A83
    nop
loc_12A50:
    add bx, 8
    mov ah, 4Ah
    mov cx, _ovlSeg1
    mov es, cx
    int 21h ;DOS - 2+ - ADJUST MEMORY BLOCK SIZE (SETBLOCK)
    jnb short loc_12A69
    mov dx, offset _aOvlShrink ;"Unable to shrink overlay memory allocat"...
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp short loc_12A83
    nop
loc_12A69:
    mov ax, @data
    mov ds, ax
    mov es, ax
    mov ax, _ovlSeg1
    cmp _ovlInsaneFlag, 0
    jnz short locret_12A82
    pop bp
    pop ds
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
locret_12A82:
    retn
loc_12A83:
    mov ax, 4C00h
    int 21h ;DOS - 2+ - QUIT WITH EXIT CODE (EXIT)
_loadOverlay endp ;AL = exit code
; --- shared overlay slot setup routine
ovlInsaneFlag    EQU _ovlInsaneFlag
ovlJumpTable     EQU _gfx_allocPage
INCLUDE shared/overlay_slots.inc
_setupOverlaySlots equ setupOverlaySlots
msg14 db 'clearRect(): buf 0x%x %d %d %d %d',0
msg15 db 'clearRect(): destination 0x%x',0
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
_clearRect equ clearRect
; --- shared graphics routines (clearDirtyRects, drawLineWrapper, clipAndDrawLine, computeOutcode)
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
    call _gfx_drawLine
ENDM
INCLUDE shared/gfx.inc
; --- shared Ctrl+Break handler (installCBreakHandler, restoreCbreakHandler, getInterruptHandler, cbreakHandler)
cbreakSavedSeg   EQU _origCBreakSeg
cbreakSavedOfs   EQU _origCBreakOfs
cbreakFlag       EQU _cbreakHit
INCLUDE shared/cbreak.inc
; --- shared open file routine
fileNotFoundStr  EQU _aFileNotFound
fileNoBufsStr    EQU _aNoFileBuffersAvailable
fileOpenErrorStr EQU _aOpenError
fileReadPosVar   EQU _fileReadPos
fileErrorExit    EQU errorDescAndExit
INCLUDE shared/file_open.inc
_openFile equ openFile
; --- shared file close routine
fileCloseErrorStr EQU _aFileClosingError
fileCloseErrExit  EQU errorAndExit
INCLUDE shared/file_close.inc
_fileClose equ fileClose
msg12 db 'Reading from file handle %d',0
msg13 db 'Read success, count %d',0
; --- shared file read 512
fileRead512Handle EQU _tmpFileHandle
fileRead512Buf    EQU _fileReadBuf
fileRead512ErrStr EQU _aReadError
fileRead512ErrExit EQU errorAndExit
INCLUDE shared/file_read512.inc
; --- shared file write
fileWriteErrStr  EQU _aWriteError
fileWriteErrExit EQU errorAndExit
INCLUDE shared/file_write.inc
; --- shared file error handler
fileErrorCodeStr EQU _errorCodeStr
INCLUDE shared/file_error.inc

msg1 db 'showPicFile(): entering, handle %d pagenum %d',0
msg2 db 'showPicFile(): after gfx_3b_clearbuf, handle %d pageidx %d',0
msg3 db 'showPicFile(): after fillrow',0
msg4 db 'showPicFile(): exiting',0
msg5 db 'showPicFile(): gfx_35 returned',0
msg6 db 'showPicFile(): ---row %u, rowOffset 0x%x',0
msg8 db 'showPicFile(): before loop, screenBufSize = 0x%x',0

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
picProcessFlag       EQU _picProcessFlag0_1
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
picInitRoutine       EQU nullsub_1
picReadFileFunc      EQU read512FromFileIntoBuf
INCLUDE shared/pic_showpicfile.inc
INCLUDE shared/pic_decodepic.inc
msg9 db 'decodePicRow(): finished making dict',0
msg10 db 'decodePicRow(): after doPicDecode',0
msg11 db 'decodePicRow(): exiting',0
INCLUDE shared/pic_lzw.inc
_showPicFile EQU showPicFile
_decodePic EQU decodePic
; --- shared DOS memory allocate routine
INCLUDE shared/file_alloc.inc
_dos_alloc equ dos_alloc
; --- shared joystick routines
joyRawAxis0      EQU _joyRawAxis0
joyRawAxis1      EQU _joyRawAxis1
joyMinValues     EQU _joyMinValues
joyMaxValues     EQU _joyMaxValues
joyCenterValues  EQU _joyCenterValues
joyRangeBelow    EQU _joyRangeBelow
joyRangeAbove    EQU _joyRangeAbove
joyNormAxes      EQU _joyAxes
INCLUDE shared/joystick.inc
_pollJoystick equ pollJoystick
_copyJoystickData equ copyJoystickData

;startCode1 ends

end
