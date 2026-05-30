.8086
DOSSEG
.MODEL SMALL

Stack equ 0
local_res0 equ 0
a equ 2h

; --- External overlay jump table procs (in endslots.asm .DATA segment) ---
EXTRN gfx_allocPage:FAR
EXTRN gfx_drawString:FAR
EXTRN gfx_setPage1:FAR
EXTRN gfx_setPageN:FAR
EXTRN gfx_getCurPageSeg:FAR
EXTRN gfx_getCurPageSeg2:FAR
EXTRN gfx_blitSprite:FAR
EXTRN gfx_getBufSize:FAR
EXTRN gfx_setBlitOffset:FAR
EXTRN gfx_drawLine:FAR
EXTRN gfx_setPageDirect:FAR
EXTRN gfx_setColor:FAR
EXTRN gfx_resetBlitOffset:FAR
EXTRN gfx_resetBlitOffset2:FAR
EXTRN gfx_dirtyRect2:FAR
EXTRN gfx_switchColor:FAR
EXTRN gfx_copyRect:FAR
EXTRN gfx_setFont:FAR
EXTRN gfx_getAuxBufSize:FAR
EXTRN gfx_fillRow:FAR
EXTRN gfx_fillRow2:FAR
EXTRN gfx_copyRow:FAR
EXTRN gfx_nop36:FAR
EXTRN gfx_getPageSeg:FAR
EXTRN gfx_getRowOffset:FAR
EXTRN gfx_clearPage:FAR
EXTRN gfx_setFadeSteps:FAR
EXTRN gfx_calcRowAddr:FAR
EXTRN gfx_setOvlVal1:FAR
EXTRN gfx_setOvlVal2:FAR
EXTRN gfx_setDac:FAR
EXTRN gfx_waitRetrace:FAR
EXTRN gfx_flipPage:FAR
EXTRN gfx_storeBufPtr:FAR
EXTRN gfx_commitPage:FAR
EXTRN gfx_nop51:FAR
EXTRN gfx_setMonoFlag:FAR
EXTRN gfx_getCurPage:FAR
EXTRN misc_jump_5a_keybuf:FAR
EXTRN misc_jump_5b_getkey:FAR
EXTRN misc_jump_5d_readJoy:FAR
EXTRN misc_jump_5e_clearKeyFlags:FAR
EXTRN thunk_EXT_FUN_0000:FAR

; --- External data variables (in endslots.asm) ---
EXTRN _commData:WORD
EXTRN _commData_seg:WORD
EXTRN _var_151:WORD
EXTRN _var_152:WORD
EXTRN _quitFlag:BYTE
EXTRN _timerCounter:BYTE
EXTRN _timerCounter2:BYTE
EXTRN _timerCounter3:BYTE
EXTRN _timerCounter4:BYTE
EXTRN _timerHandlerInstalled:BYTE
EXTRN _joyAxisX:BYTE
EXTRN _joyAxisY:BYTE
EXTRN _gameData:WORD
EXTRN _var_179:WORD
EXTRN _gfxBufSeg:WORD
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
EXTRN _var_41:BYTE
EXTRN _clipDy:WORD
EXTRN _var_43:BYTE
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
EXTRN _var_61:BYTE
EXTRN str_overlayRelError:BYTE
EXTRN str_fileNotFound:BYTE
EXTRN str_noFileBufs:BYTE
EXTRN str_openError:BYTE
EXTRN str_fileCloseError:BYTE
EXTRN str_readError:BYTE
EXTRN str_writeError:BYTE
EXTRN _str_insertScenario:BYTE
EXTRN _str_pressKey1:BYTE
EXTRN _str_insertDiskA:BYTE
EXTRN _str_pressKey2:BYTE
EXTRN _str_dbicons1:BYTE
EXTRN _str_dbicons2:BYTE
EXTRN _str_missionDebrief:BYTE
EXTRN _str_modeRb1:BYTE
EXTRN _str_modeRb2:BYTE
str_insertScenario equ _str_insertScenario
str_pressKey1 equ _str_pressKey1
str_insertDiskA equ _str_insertDiskA
str_pressKey2 equ _str_pressKey2
str_dbicons1 equ _str_dbicons1
str_dbicons2 equ _str_dbicons2
str_missionDebrief equ _str_missionDebrief
str_modeRb1 equ _str_modeRb1
str_modeRb2 equ _str_modeRb2
EXTRN _dat_0042:BYTE
EXTRN _var_99:WORD
EXTRN _var_100:WORD
EXTRN _var_102:WORD
EXTRN _var_115:BYTE
EXTRN _var_116:WORD
EXTRN _var_117:WORD
EXTRN _var_118:WORD
EXTRN _var_119:BYTE
EXTRN _var_120:BYTE
EXTRN _var_121:BYTE
EXTRN _var_122:BYTE
EXTRN _var_125:WORD
EXTRN _var_180:WORD
EXTRN _var_193:WORD
EXTRN _var_203:WORD
EXTRN _var_205:WORD
EXTRN _var_216:BYTE
EXTRN _var_3f72:BYTE
EXTRN _dat_231c:BYTE
EXTRN _dat_4034:BYTE
EXTRN _dat_4040:BYTE
EXTRN _dat_4246:BYTE
EXTRN _dat_4a2a:BYTE
EXTRN _dat_5512:BYTE
EXTRN _dat_55de:BYTE
EXTRN _dat_5ab4:BYTE
EXTRN _dat_1580:BYTE
EXTRN _awardColor:BYTE
EXTRN _awardFont:BYTE
EXTRN _awardPage:WORD
EXTRN _promoScores:WORD
EXTRN _promoThresholds:WORD
EXTRN _medalScores:WORD
EXTRN _medalThresholds:WORD
EXTRN _spriteAir:WORD
EXTRN _spriteSam:WORD
EXTRN _spriteGround:WORD
EXTRN _spriteWaypoint:WORD
EXTRN _pageStruct:BYTE
EXTRN _pageStruct2:BYTE
EXTRN _pageStruct3:BYTE
EXTRN _flightRecords:BYTE
EXTRN dat_1868:WORD
EXTRN dat_186A:WORD
EXTRN _dat_21e4:BYTE
dat_21e4 equ _dat_21e4
EXTRN dat_2769:BYTE
EXTRN dat_3F6A:BYTE
EXTRN dat_3F6B:BYTE
EXTRN dat_3F6C:WORD
EXTRN dat_3F6E:WORD
EXTRN dat_3F70:BYTE
EXTRN dat_3F71:BYTE
EXTRN dat_3FB2:WORD
EXTRN dat_3FB4:WORD
EXTRN dat_3FB6:WORD
EXTRN dat_3FB8:BYTE
EXTRN _missionScore:WORD
EXTRN _missionScoreHi:WORD
EXTRN _ejectedFlag:BYTE
EXTRN _worldBufHandle:WORD
EXTRN _spriteBufSeg:WORD
EXTRN _curRecordIdx:WORD
EXTRN _var_192:BYTE
EXTRN _var_104:WORD
.CODE
EXTRN _loadWorldStrings:PROC
EXTRN _closeFileWrapper:PROC
EXTRN _drawStringAt:PROC
EXTRN _stringWidth:PROC
EXTRN _drawStringCentered:PROC
EXTRN _mystrcpy:PROC
EXTRN _cleanup:PROC
EXTRN _seedRandom:PROC
EXTRN _loadPic:PROC
EXTRN _openShowPic:PROC
EXTRN _allocBuffer:PROC
EXTRN _freeBuffer:PROC
EXTRN _srandInit:PROC
EXTRN _drawEventSprite:PROC
EXTRN _mapToScreenY:PROC
EXTRN _mapToScreenX:PROC
EXTRN _drawMapPixel:PROC
EXTRN _drawClippedLine:PROC
EXTRN _openFileWrapper:PROC
EXTRN _openFileRead:PROC
EXTRN _readFileBlock:PROC
EXTRN _readFileAt:PROC
EXTRN _readFileAtEx:PROC
EXTRN _loadFileSection:PROC
EXTRN _loadFileSectionEx:PROC
EXTRN _plotMapPoint:PROC
EXTRN _outportByte:PROC
EXTRN _loadPicFromFile:PROC
EXTRN _loadPicFromFileAt:PROC
EXTRN _isPointInRect:PROC
EXTRN _drawFlightLine:PROC
EXTRN _timerWait:PROC
EXTRN _drawStringAtPos:PROC
EXTRN _drawFarString:PROC
EXTRN _animateFlightPath:PROC
EXTRN _drawWrappedText:PROC
EXTRN _waitForKeyOrJoy:PROC
EXTRN _checkQuitFlag:PROC
EXTRN _routine_5:PROC
EXTRN _routine_6:PROC
EXTRN _loadWorldData:PROC
EXTRN _readWorldData:PROC
EXTRN _my_itoa:PROC
EXTRN _my_ltoa:PROC
EXTRN _blinkWidget:PROC
EXTRN _processMenuItems:PROC
EXTRN _selectMenuItem:PROC
EXTRN _processDebriefInput:PROC
EXTRN _drawMenuItem:PROC
EXTRN _calcMissionScore:PROC
EXTRN _showPostMissionAwards:PROC
EXTRN _drawFlightPath:PROC
EXTRN _showEventPopup:PROC
EXTRN _formatFlightTime:PROC

PUBLIC _clearRect
PUBLIC _mystrcat
PUBLIC _setTimerIrqHandler
PUBLIC _farStrcpy
PUBLIC _decodePicRaw
PUBLIC _copyJoystickData

; --- Code segment ---

EXTRN _main:PROC

PUBLIC _pollJoystick

EXTRN _initGraphics:PROC

PUBLIC _setupWorldBufPtr
_setupWorldBufPtr:
setupWorldBufPtr proc near
    mov AX,word ptr [_commData]
    mov DX,word ptr [_commData_seg]
    db 05h, 7Ah, 00h  ; add AX,7Ah (force word-immediate)
    mov word ptr [_var_151],AX
    mov word ptr [_var_152],DX
    mov AX,1h
    ret
setupWorldBufPtr endp

EXTRN _readFromWorldBuf:PROC
EXTRN _readFromWorldFile:PROC

PUBLIC _clearKeybuf
_clearKeybuf:
clearKeybuf proc near
    jmp FUN_1000_03ad
LAB_1000_03a8:
    call far ptr misc_jump_5b_getkey
clearKeybuf endp

FUN_1000_03ad proc near
    call far ptr misc_jump_5a_keybuf
    or AX,AX
    jz LAB_1000_03a8
    ret
FUN_1000_03ad endp

drawStringAt equ _drawStringAt


drawStringCentered equ _drawStringCentered


_farStrcpy:
farStrcpy proc near
    push BP
    mov BP,SP
    push SI
    push DI
    push ES
    push DS
    push DS
    pop ES
    lds SI,dword ptr [BP + 6h]
    mov DI,word ptr [BP + 4h]
LAB_1000_0a83:
    lodsb
    stosb
    or AL,AL
    jnz LAB_1000_0a83
    pop DS
    pop ES
    pop DI
    pop SI
    pop BP
    ret
farStrcpy endp

; --- shared strcat
INCLUDE shared/str_strcat.inc
_mystrcat equ mystrcat

PUBLIC _memcopy
_memcopy:
memcopy proc near
    push BP
    mov BP,SP
    push SI
    mov CX,word ptr [BP + 8h]
LAB_1000_0b29:
    mov SI,word ptr [BP + 4h]
    inc word ptr [BP + 4h]
    mov BX,word ptr [BP + 6h]
    inc word ptr [BP + 6h]
    mov DL,byte ptr [BX]
    mov byte ptr [SI],DL
    loop LAB_1000_0b29
    pop SI
    mov SP,BP
    pop BP
    ret
memcopy endp

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
ovlJumpTable     EQU gfx_allocPage
INCLUDE shared/overlay_slots.inc

; --- shared clearRect
clearRectGetCurBuf EQU gfx_getCurPageSeg2
clearRectSetCurBuf EQU gfx_setPage1
clearRectSetVal    EQU gfx_setPageDirect
clearRectJump28    EQU gfx_dirtyRect2
clearRectJump22    EQU gfx_resetBlitOffset
clearRectNull      EQU gfx_nop51
clearRectGetBufPtr EQU gfx_getCurPageSeg
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
    call far ptr gfx_drawLine
ENDM
PUBLIC _drawLineWrapper
INCLUDE shared/gfx.inc

; routine_154 (drawLineWrapper), routine_158 (clipAndDrawLine), and computeOutcode
; are now provided by shared_gfx.inc above
; Alias for callers that used the old name
routine_154 EQU _drawLineWrapper

divZeroHandler proc near
    push BP
    mov BP,SP
    cmp word ptr [BP + local_res0+2h],11b0h
    mov AX,word ptr [_clipDy]
    jz LAB_1000_122f
    mov AX,word ptr [_clipDx]
LAB_1000_122f:
    xor DX,AX
    mov AX,7f00h
    jns LAB_1000_1238
    neg AX
LAB_1000_1238:
    add word ptr [BP + local_res0+2h],4h
    sub DX,DX
    pop BP
    iret
divZeroHandler endp

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
fileNotFoundStr  EQU str_fileNotFound
fileNoBufsStr    EQU str_noFileBufs
fileOpenErrorStr EQU str_openError
fileReadPosVar   EQU _fileReadPos
fileErrorExit    EQU errorDescAndExit
INCLUDE shared/file_open.inc

PUBLIC _openFileRaw
_openFileRaw:
openFileRaw proc near
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
    mov AX,offset str_fileNotFound
    mov CX,0ffffh
    jmp errorDescAndExit
LAB_1000_142d:
    db 3Dh, 03h, 00h  ; cmp AX,03h (force word-immediate)
    jz LAB_1000_1421
    db 3Dh, 04h, 00h  ; cmp AX,04h (force word-immediate)
    jnz LAB_1000_1443
    mov CX,0ffffh
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov AX,offset str_noFileBufs
    jmp errorDescAndExit
LAB_1000_1443:
    mov CX,AX
    mov AX,offset str_openError
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
openFileRaw endp

PUBLIC _fileClose
_fileClose:
; --- shared file close routine
fileCloseErrorStr EQU str_fileCloseError
fileCloseErrExit  EQU errorAndExit
INCLUDE shared/file_close.inc

PUBLIC _readFileRaw
_readFileRaw:
readFileRaw proc near
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
    mov DX,offset str_readError
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
readFileRaw endp

PUBLIC _readFileAtRaw
_readFileAtRaw:
readFileAtRaw proc near
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
    mov DX,offset str_readError
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
FUN_1000_14d7 proc near
    push DS
    push ES
    push SI
    push DI
    mov AX,DS
    mov ES,AX
    mov DS,word ptr [dat_1868]
    mov CX,100h
    mov SI,word ptr [dat_186A]
    mov DI,offset _fileReadBuf
    rep movsw
    add word ptr [dat_186A],200h
    mov AX,200h
    pop DI
    pop SI
    pop ES
    pop DS
    ret
FUN_1000_14d7 endp
readFileAtRaw endp

; --- shared file read 512
fileRead512Handle  EQU _tmpFileHandle
fileRead512Buf     EQU _fileReadBuf
fileRead512ErrStr  EQU str_readError
fileRead512ErrExit EQU errorAndExit
INCLUDE shared/file_read512.inc

setHandleAndRead512 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,word ptr [BP + 4h]
    mov word ptr [_tmpFileHandle],AX
    call read512FromFileIntoBuf
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
setHandleAndRead512 endp

PUBLIC _readFileAtExRaw
_readFileAtExRaw:
; --- shared file write
fileWriteErrStr  EQU str_writeError
fileWriteErrExit EQU errorAndExit
INCLUDE shared/file_write.inc
readFileAtExRaw equ writeFileAtRaw

; --- shared file error handler
fileErrorCodeStr EQU _errorCodeStr
INCLUDE shared/file_error.inc

openShowPic equ _openShowPic

loadPic equ _loadPic

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
picWorkData          EQU dat_2769
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
picInitRoutine       EQU routine_120
picReadFileFunc      EQU read512FromFileIntoBuf
_gfx_fillRow EQU gfx_fillRow
_gfx_fillRow2 EQU gfx_fillRow2
_gfx_copyRow         EQU gfx_copyRow
_gfx_nop36    EQU gfx_nop36
_gfx_getPageSeg EQU gfx_getPageSeg
_gfx_getRowOffset EQU gfx_getRowOffset
_gfx_clearPage EQU gfx_clearPage

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
    call far ptr gfx_clearPage
    call routine_120
    mov word ptr [_picRow],0h
    mov word ptr [_picScreenBufSize],0fa00h
LAB_1000_1702:
    mov DI,word ptr [_picRow]
    call far ptr gfx_getRowOffset
    mov word ptr [_picRowOffset],AX
    call decodePicRow
    mov DI,word ptr [_picRowOffset]
    mov BP,offset _picDecodedRowBuf
    mov BX,word ptr [_picRow]
    call far ptr gfx_fillRow
    mov DI,word ptr [_picRowOffset]
    call far ptr thunk_EXT_FUN_0000
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

routine_120 proc near
    ret
    db 00h
routine_120 endp

INCLUDE shared/pic_lzw.inc
    db 00h

allocBuffer equ _allocBuffer

freeBuffer equ _freeBuffer

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
    call FUN_1000_1ac2
    mov CX,word ptr [BP + 4h]
    or CX,CX
    jz LAB_1000_1aaa
LAB_1000_1aa1:
    call FUN_1000_1b0c
    or AL,AL
    jnz LAB_1000_1aa1
    loop LAB_1000_1aa1
LAB_1000_1aaa:
    mov BX,word ptr [BP + 6h]
    mov CX,200h
LAB_1000_1ab0:
    push BX
    call FUN_1000_1b0c
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

FUN_1000_1ac2 proc near
    call FUN_1000_1ad8
    mov word ptr [dat_3FB2],0h
    mov byte ptr [dat_3F71],0h
    mov AL,byte ptr ES:[DI]
    inc DI
    mov byte ptr [dat_3F6B],AL
    ret
FUN_1000_1ac2 endp

FUN_1000_1ad8 proc near
    mov byte ptr [dat_3F6A],9h
    mov word ptr [dat_3F6C],1ffh
    mov word ptr [dat_3F6E],100h
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
FUN_1000_1ad8 endp

FUN_1000_1b0c proc near
    mov BX,word ptr [dat_3FB2]
    or BX,BX
    jnz LAB_1000_1b17
    call FUN_1000_1b24
LAB_1000_1b17:
    dec word ptr [dat_3FB2]
    mov BX,word ptr [dat_3FB2]
    mov AL,byte ptr [BX + offset _var_3f72]
    ret
FUN_1000_1b0c endp

FUN_1000_1b24 proc near
    push CX
    call FUN_1000_1bc3
    mov word ptr [dat_3FB6],CX
    cmp CX,word ptr [dat_3F6E]
    jl LAB_1000_1b4b
    mov AL,byte ptr [dat_3FB8]
    mov BX,word ptr [dat_3FB2]
    mov byte ptr [BX + offset _var_3f72],AL
    inc word ptr [dat_3FB2]
    mov CX,word ptr [dat_3FB4]
    mov AX,word ptr [dat_3F6E]
    mov word ptr [dat_3FB6],AX
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
    mov BX,word ptr [dat_3FB2]
    cmp BX,40h
    jnc LAB_1000_1b6c
    mov byte ptr [BX + offset _var_3f72],AL
LAB_1000_1b6c:
    inc word ptr [dat_3FB2]
    jmp LAB_1000_1b4b
LAB_1000_1b72:
    mov AL,byte ptr [BX + 2h]
    mov byte ptr [dat_3FB8],AL
    mov BX,word ptr [dat_3FB2]
    mov byte ptr [BX + offset _var_3f72],AL
    inc word ptr [dat_3FB2]
    mov CX,word ptr [dat_3F6E]
    mov BX,offset _picDecodeDictionary
    add BX,CX
    add BX,CX
    add BX,CX
    mov byte ptr [BX + 2h],AL
    mov AX,word ptr [dat_3FB4]
    mov word ptr [BX],AX
    inc word ptr [dat_3F6E]
    mov AX,word ptr [dat_3F6E]
    cmp AX,word ptr [dat_3F6C]
    jle LAB_1000_1baf
    inc byte ptr [dat_3F6A]
    stc
    rcl word ptr [dat_3F6C],1h
LAB_1000_1baf:
    mov AL,byte ptr [dat_3F6A]
    cmp AL,byte ptr [dat_3F6B]
    jle LAB_1000_1bbb
    call FUN_1000_1ad8
LAB_1000_1bbb:
    mov AX,word ptr [dat_3FB6]
    mov word ptr [dat_3FB4],AX
    pop CX
    ret
FUN_1000_1b24 endp

FUN_1000_1bc3 proc near
    xor DH,DH
    mov DL,byte ptr [dat_3F70]
    mov BL,byte ptr [dat_3F71]
    mov CL,8h
    sub CL,BL
    shr DX,CL
LAB_1000_1bd3:
    cmp BL,byte ptr [dat_3F6A]
    jge LAB_1000_1bed
    mov AL,byte ptr ES:[DI]
    inc DI
    mov byte ptr [dat_3F70],AL
    mov CL,BL
    xor AH,AH
    shl AX,CL
    or DX,AX
    add BL,8h
    jmp LAB_1000_1bd3
LAB_1000_1bed:
    sub BL,byte ptr [dat_3F6A]
    mov byte ptr [dat_3F71],BL
    mov CX,DX
    and CX,word ptr [dat_3F6C]
    ret
FUN_1000_1bc3 endp

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

setTimerMode1 proc near
    mov BX,word ptr [_timerMode]
    mov word ptr [_timerReload],BX
    mov AX,word ptr [_timerCalSumLo]
    xor DX,DX
    div BX
    mov word ptr [_timerTarget],AX
    mov byte ptr [_timerDivider],1h
    ret
setTimerMode1 endp
setTimerMode2 proc near
    mov word ptr [_timerReload],1h
    mov AX,word ptr [_timerCalSumLo]
    mov word ptr [_timerTarget],AX
    mov byte ptr [_timerDivider],1h
    ret
setTimerMode2 endp
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

processMenuItems equ _processMenuItems

selectMenuItem equ _selectMenuItem

animateFlightPath equ _animateFlightPath

EXTRN _drawClippedLineEx:PROC
drawClippedLineEx equ _drawClippedLineEx

calcMissionScore equ _calcMissionScore

EXTRN _debriefMainLoop:PROC
debriefMainLoop equ _debriefMainLoop

EXTRN _dosExit:PROC



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
