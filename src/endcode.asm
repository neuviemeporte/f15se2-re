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
EXTRN _randSeed:WORD
EXTRN _randState:WORD
EXTRN _nightMission:BYTE
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
EXTRN _samDataTable:BYTE
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
EXTRN _var_129:WORD
EXTRN _var_130:WORD
EXTRN _var_131:BYTE
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
EXTRN __osmajor:BYTE
EXTRN _exit:PROC
EXTRN _fclose:PROC
EXTRN __getstream:PROC
EXTRN __openfile:PROC
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
EXTRN __aNlmul:PROC
EXTRN _formatFlightTime:PROC


PUBLIC _clearRect
PUBLIC _mystrcat
PUBLIC _setTimerIrqHandler
PUBLIC _farStrcpy
PUBLIC _decodePicRaw
PUBLIC _fileSeek
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

FUN_1000_0495 proc near
    push BP
    mov BP,SP
    sub SP,20eh
    push SI
    mov AX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    mov word ptr [BP + -14h],AX
    mov word ptr [BP + -12h],DX
    mov word ptr [BP + -6h],AX
    mov word ptr [BP + -4h],DX
    mov word ptr [BP + -0ah],AX
    mov word ptr [BP + -8h],DX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX + 0ch]
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [BP + 0eh]
    mov word ptr [BX + 0ah],AX
    mov byte ptr [BP + -16h],1h
LAB_1000_04c8:
    cmp byte ptr [BP + -16h],0h
    jnz LAB_1000_04d1
    jmp LAB_1000_05dd
LAB_1000_04d1:
    sub AX,AX
    mov word ptr [BP + -0ch],AX
    mov word ptr [BP + -18h],AX
LAB_1000_04d9:
    mov AX,word ptr [BP + 0ah]
    cmp word ptr [BP + -18h],AX
    jnc LAB_1000_0512
    les BX,dword ptr [BP + -0ah]
    mov AL,byte ptr ES:[BX]
    mov byte ptr [BP + -20eh],AL
    or AL,AL
    jz LAB_1000_0512
    cmp AL,0dh
    jz LAB_1000_0512
    cmp AL,0ah
    jz LAB_1000_0512
    push word ptr [BP + -2h]
    inc word ptr [BP + -0ah]
    mov AL,byte ptr ES:[BX]
    cbw
    push AX
    call far ptr gfx_setFont
    add SP,4h
    add word ptr [BP + -18h],AX
    inc word ptr [BP + -0ch]
    jmp LAB_1000_04d9
LAB_1000_0512:
    mov AX,word ptr [BP + 0ah]
    cmp word ptr [BP + -18h],AX
    jc LAB_1000_0520
    dec word ptr [BP + -0ah]
    dec word ptr [BP + -0ch]
LAB_1000_0520:
    les BX,dword ptr [BP + -0ah]
    mov AL,byte ptr ES:[BX]
    mov byte ptr [BP + -20eh],AL
    cmp AL,20h
    jz LAB_1000_0550
    or AL,AL
    jz LAB_1000_0550
    cmp AL,0dh
    jz LAB_1000_0550
    cmp AL,0ah
    jz LAB_1000_0550
    cmp AL,2dh
    jz LAB_1000_0550
    mov AX,word ptr [BP + -14h]
    mov DX,word ptr [BP + -12h]
    cmp BX,AX
    jbe LAB_1000_0550
    dec word ptr [BP + -0ah]
    dec word ptr [BP + -0ch]
    jmp LAB_1000_0520
LAB_1000_0550:
    mov BX,word ptr [BP + -0ah]
    cmp byte ptr ES:[BX],2dh
    jnz LAB_1000_055c
    inc word ptr [BP + -0ch]
LAB_1000_055c:
    les BX,dword ptr [BP + -6h]
    cmp byte ptr ES:[BX],20h
    jnz LAB_1000_056a
    inc word ptr [BP + -6h]
    jmp LAB_1000_055c
LAB_1000_056a:
    les BX,dword ptr [BP + -0ah]
    cmp byte ptr ES:[BX],0h
    jnz LAB_1000_0577
    mov byte ptr [BP + -16h],0h
LAB_1000_0577:
    cmp word ptr [BP + -0ch],0h
    jz LAB_1000_05cb
    push word ptr [BP + -0ch]
    push word ptr [BP + -4h]
    push word ptr [BP + -6h]
    lea AX,[BP + 0fdf4h]
    push AX
    call farToNearCopy
    add SP,8h
    mov SI,word ptr [BP + -0ch]
    mov byte ptr [BP + SI + 0fdf4h],0h
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 0ch]
    mov word ptr [BX + 8h],AX
    lea AX,[BP + 0fdf4h]
    push AX
    push word ptr [BP + 4h]
    call far ptr gfx_drawString
    add SP,4h
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 10h]
    add word ptr [BX + 0ah],AX
    les BX,dword ptr [BP + -0ah]
    cmp byte ptr ES:[BX],0dh
    jnz LAB_1000_05cb
    mov BX,word ptr [BP + 4h]
    add word ptr [BX + 0ah],2h
LAB_1000_05cb:
    inc word ptr [BP + -0ah]
    mov AX,word ptr [BP + -0ah]
    mov DX,word ptr [BP + -8h]
    mov word ptr [BP + -6h],AX
    mov word ptr [BP + -4h],DX
    jmp LAB_1000_04c8
LAB_1000_05dd:
    pop SI
    mov SP,BP
    pop BP
    ret
FUN_1000_0495 endp

drawStringCentered equ _drawStringCentered

randomInRange proc near
    push BP
    mov BP,SP
    call getRandom
    cwd
    push DX
    push AX
    sub AX,AX
    push AX
    push word ptr [BP + 4h]
    call __aNlmul
    mov CL,0fh
LAB_1000_09d3:
    sar DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_09dd
    jmp LAB_1000_09d3
LAB_1000_09dd:
    jmp LAB_1000_09df
LAB_1000_09df:
    mov SP,BP
    pop BP
    ret
    db 90h
randomInRange endp

FUN_1000_09f2 proc near
    push BP
    mov BP,SP
    push DS
    pop ES
    mov SI,word ptr [BP + 4h]
LAB_1000_09fa:
    cmp byte ptr [SI],0h
    jz LAB_1000_0a10
    mov AL,byte ptr [SI]
    cmp AL,61h
    jl LAB_1000_0a0d
    cmp AL,7ah
    jg LAB_1000_0a0d
    sub AL,20h
    mov byte ptr [SI],AL
LAB_1000_0a0d:
    inc SI
    jmp LAB_1000_09fa
LAB_1000_0a10:
    pop BP
    ret
FUN_1000_09f2 endp

FUN_1000_0a12 proc near
    push BP
    mov BP,SP
    push DS
    pop ES
    mov SI,word ptr [BP + 4h]
    mov DI,word ptr [BP + 6h]
LAB_1000_0a1d:
    cmp byte ptr [SI],0h
    jnz LAB_1000_0a2a
    cmp byte ptr [DI],0h
    jz LAB_1000_0a37
    jmp LAB_1000_0a3d
    db 90h
LAB_1000_0a2a:
    cmp byte ptr [DI],0h
    jz LAB_1000_0a3d
    mov AL,byte ptr [SI]
    cmp AL,byte ptr [DI]
    jnz LAB_1000_0a3d
    jmp LAB_1000_0a1d
LAB_1000_0a37:
    mov AX,1h
    jmp LAB_1000_0a40
    db 90h
LAB_1000_0a3d:
    mov AX,0h
LAB_1000_0a40:
    pop BP
    ret
FUN_1000_0a12 endp

FUN_1000_0a5d proc near
    push BP
    mov BP,SP
    push SI
    push DI
    push ES
    les DI,dword ptr [BP + 4h]
    mov SI,word ptr [BP + 8h]
LAB_1000_0a69:
    lodsb
    stosb
    or AL,AL
    jnz LAB_1000_0a69
    pop ES
    pop DI
    pop SI
    pop BP
    ret
FUN_1000_0a5d endp

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

mystrlen proc near
    push BP
    mov BP,SP
    mov AX,word ptr [BP + 4h]
LAB_1000_0a95:
    mov BX,word ptr [BP + 4h]
    inc word ptr [BP + 4h]
    cmp byte ptr [BX],0h
    jnz LAB_1000_0a95
    mov BX,word ptr [BP + 4h]
    sub AX,BX
    not AX
    mov SP,BP
    pop BP
    ret
mystrlen endp

; --- shared strcat
INCLUDE shared/str_strcat.inc
; dead code (strchr-like routine bundled after mystrcat)
mystrchr proc near
    push BP
    mov BP,SP
    push SI
    mov AX,word ptr [BP + 6h]
LAB_1000_0ada:
    mov BX,word ptr [BP + 4h]
    cmp byte ptr [BX],0h
    jz LAB_1000_0aeb
    cmp byte ptr [BX],AL
    jz LAB_1000_0af1
    inc word ptr [BP + 4h]
    jmp LAB_1000_0ada
LAB_1000_0aeb:
    mov AX,0h
    jmp LAB_1000_0af3
    db 90h
LAB_1000_0af1:
    mov AX,BX
LAB_1000_0af3:
    pop SI
    pop BP
    ret
mystrchr endp
_mystrcat equ mystrcat

myNearMemset proc near
    push BP
    mov BP,SP
    push DI
    mov AX,DS
    mov ES,AX
    mov AL,byte ptr [BP + 6h]
    mov DI,word ptr [BP + 4h]
    mov CX,word ptr [BP + 8h]
    rep stosb
    pop DI
    pop BP
    ret
myNearMemset endp

farMemset proc near
    push BP
    mov BP,SP
    push SI
    push ES
    mov AL,byte ptr [BP + 8h]
    les DI,dword ptr [BP + 4h]
    mov CX,word ptr [BP + 0ah]
    rep stosb
    pop ES
    pop SI
    mov SP,BP
    pop BP
    ret
farMemset endp

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

farToNearCopy proc near
    push BP
    mov BP,SP
    push SI
    push DI
    push ES
    push DS
    push DS
    pop ES
    mov CX,word ptr [BP + 0ah]
    mov DI,word ptr [BP + 4h]
    lds SI,dword ptr [BP + 6h]
    rep movsb
    pop DS
    pop ES
    pop DI
    pop SI
    mov SP,BP
    pop BP
    ret
farToNearCopy endp

memEqualWords proc near
    push BP
    mov BP,SP
    push SI
    mov CX,word ptr [BP + 8h]
LAB_1000_0b63:
    mov SI,word ptr [BP + 4h]
    inc word ptr [BP + 4h]
    mov AX,word ptr [SI]
    mov BX,word ptr [BP + 6h]
    inc word ptr [BP + 6h]
    cmp AX,word ptr [BX]
    loopz LAB_1000_0b63
    or CX,CX
    jz LAB_1000_0b7f
    mov AX,0h
    jmp LAB_1000_0b82
    db 90h
LAB_1000_0b7f:
    mov AX,1h
LAB_1000_0b82:
    pop SI
    mov SP,BP
    pop BP
    ret
memEqualWords endp

PUBLIC _intDispatch
_intDispatch:
; --- shared interrupt dispatch routine
INCLUDE shared/overlay_dispatch.inc

routine_87 proc near
    push BP
    mov BP,SP
    push SI
    mov BX,word ptr [BP + 6h]
    mov AX,word ptr [BP + 8h]
    db 3Dh, 0Ah, 00h  ; cmp AX,0Ah (force word-immediate)
    jz LAB_1000_0c08
    db 3Dh, 02h, 00h  ; cmp AX,02h (force word-immediate)
    jz LAB_1000_0c14
    db 3Dh, 10h, 00h  ; cmp AX,10h (force word-immediate)
    jz LAB_1000_0c0e
    jmp LAB_1000_0c1a
    db 90h
LAB_1000_0c08:
    call routine_117
    jmp LAB_1000_0c24
    db 90h
LAB_1000_0c0e:
    call routine_115
    jmp LAB_1000_0c24
    db 90h
LAB_1000_0c14:
    call routine_116
    jmp LAB_1000_0c24
    db 90h
LAB_1000_0c1a:
    mov BX,word ptr [BP + 6h]
    mov word ptr [BX],0h
    mov AX,0h
LAB_1000_0c24:
    pop SI
    mov SP,BP
    pop BP
    ret
routine_87 endp

routine_117 proc near
    sub CX,CX
    mov AX,word ptr [BP + 4h]
    mov SI,0ah
    or AX,AX
    jns LAB_1000_0c3b
    mov byte ptr [BX],2dh
    inc BX
    neg AX
LAB_1000_0c3b:
    sub DX,DX
    div SI
    add DX,30h
    push DX
    inc CX
    or AX,AX
    jnz LAB_1000_0c3b
    mov AX,CX
LAB_1000_0c4a:
    pop DX
    mov byte ptr [BX],DL
    inc BX
    loop LAB_1000_0c4a
    mov byte ptr [BX],0h
    ret
routine_117 endp

routine_115 proc near
    mov CX,4h
    mov AX,word ptr [BP + 4h]
    and AH,0f0h
    mov AL,AH
    sub AH,AH
    shr AX,CL
    db 05h, 30h, 00h  ; add AX,30h (force word-immediate)
    mov byte ptr [BX],AL
    inc BX
    mov AX,word ptr [BP + 4h]
    and AH,0fh
    mov AL,AH
    sub AH,AH
    db 05h, 30h, 00h  ; add AX,30h (force word-immediate)
    mov byte ptr [BX],AL
    inc BX
    mov AX,word ptr [BP + 4h]
    and AL,0f0h
    sub AH,AH
    shr AX,CL
    db 05h, 30h, 00h  ; add AX,30h (force word-immediate)
    mov byte ptr [BX],AL
    inc BX
    mov AX,word ptr [BP + 4h]
    and AL,0fh
    sub AH,AH
    db 05h, 30h, 00h  ; add AX,30h (force word-immediate)
    mov byte ptr [BX],AL
    inc BX
    mov byte ptr [BX],0h
    mov AX,4h
    ret
routine_115 endp

routine_116 proc near
    mov DX,word ptr [BP + 4h]
    sub AX,AX
    mov AH,80h
LAB_1000_0ca3:
    db 85h, 0D0h  ; test DX,AX (match ref operand order)
    jnz LAB_1000_0cae
    mov byte ptr [BX],30h
    inc BX
    jmp LAB_1000_0cb2
    db 90h
LAB_1000_0cae:
    mov byte ptr [BX],31h
    inc BX
LAB_1000_0cb2:
    shr AX,1h
    jnc LAB_1000_0ca3
    mov byte ptr [BX],0h
    mov AX,10h
    ret
DAT_1000_0cbd:
    db 0Fh
    push BP
    mov BP,SP
    push SI
    mov AH,2h
    xor BH,BH
    mov DH,byte ptr [BP + 4h]
    mov DL,byte ptr [BP + 6h]
    cmp DX,-1h
    jz LAB_1000_0cd3
    int 10h
LAB_1000_0cd3:
    mov BL,byte ptr CS:[0cbdh]
    xor BH,BH
    mov CX,1h
    mov SI,word ptr [BP + 8h]
LAB_1000_0ce0:
    lodsb
    or AL,AL
    jz LAB_1000_0d06
    cmp AL,0ffh
    jz LAB_1000_0cf9
    mov DL,AL
    mov AH,9h
    mov AL,20h
    int 10h
    mov AH,0eh
    mov AL,DL
    int 10h
    jmp LAB_1000_0ce0
LAB_1000_0cf9:
    lodsb
    or AL,AL
    jz LAB_1000_0d06
    mov CS:[0cbdh],AL
    mov BL,AL
    jmp LAB_1000_0ce0
LAB_1000_0d06:
    pop SI
    pop BP
    ret
routine_116 endp

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

FUN_1000_0d70 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push DS
    push BP
    mov AX,word ptr [BP + 4h]
    mov byte ptr [_ovlInsaneFlag],0h
    jmp LAB_1000_0d88
    db 90h
    db 0C6h
    db 06h
    db 0E8h
    db 0Fh
    db 01h
LAB_1000_0d88:
    mov ES,AX
    mov AH,49h
    int 21h
    jnc LAB_1000_0d9a
    mov DX,offset str_overlayRelError
    mov AH,9h
    int 21h
    jmp LAB_1000_0daa
    db 90h
LAB_1000_0d9a:
    cmp byte ptr [_ovlInsaneFlag],0h
    jnz LAB_1000_0da9
    pop BP
    pop DS
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
LAB_1000_0da9:
    ret
LAB_1000_0daa:
    mov AX,4c00h
    int 21h
    push BP
    mov BP,SP
    push DI
    push SI
    push BP
    push DS
    pop ES
    call far ptr gfx_getCurPageSeg2
    push AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    call far ptr gfx_setPage1
    mov AH,byte ptr [BX + 4h]
    call far ptr gfx_setPageDirect
    call clearDirtyRects
    mov AX,word ptr [BP + 0ah]
    sub AX,word ptr [BP + 6h]
    mov word ptr [_clearRectWidth],AX
    mov AX,word ptr [BP + 0ch]
    sub AX,word ptr [BP + 8h]
    inc AX
    mov word ptr [_clearRectHeight],AX
    mov CX,word ptr [BP + 0ch]
    mov SI,word ptr [BP + 8h]
    mov word ptr [_clearRectY],SI
    mov word ptr [_dirtyRectMax],CX
    mov word ptr [_dirtyRectMin],SI
    sub CX,SI
    inc CX
    lea DI,word ptr [_dirtyMinBuf]
    shl SI,1h
    add DI,SI
    mov AX,word ptr [BP + 6h]
    mov word ptr [_clearRectX],AX
    mov DX,CX
    rep stosw
    mov CX,DX
    lea DI,word ptr [_dirtyMaxBuf]
    add DI,SI
    mov AX,word ptr [BP + 0ah]
    rep stosw
    mov BX,offset _dirtyMinBuf
    mov AX,word ptr [_dirtyRectMin]
    mov CX,word ptr [_dirtyRectMax]
    call far ptr gfx_dirtyRect2
    call far ptr gfx_resetBlitOffset
    mov AX,word ptr [_clearRectX]
    mov BX,word ptr [_clearRectY]
    mov CX,word ptr [_clearRectWidth]
    mov DX,word ptr [_clearRectHeight]
    call far ptr gfx_nop51
    pop AX
    call far ptr gfx_getCurPageSeg
    pop BP
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
FUN_1000_0d70 endp

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
; dead code after clearRect
    db 57h
    db 56h
    db 55h
    db 0A1h
    db 0B7h
    db 15h
    db 8Bh
    db 0Eh
    db 0B9h
    db 15h
    db 0BBh
    db 43h
    db 12h
    db 9Ah
    db 0C1h
    db 10h
    db 80h
    db 15h
    db 5Dh
    db 5Eh
    db 5Fh
    db 0C3h
    db 57h
    db 0E8h
    db 02h
    db 00h
    db 5Fh
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
; dead code (unreconstructed routines between clearDirtyRects and drawLineWrapper)
dead_0f3a proc near
    db 8Bh
    db 0CFh
    db 0Bh
    db 0F6h
    db 8Dh
    db 3Eh
    db 43h
    db 12h
    db 74h
    db 0Ah
    db 3Bh
    db 36h
    db 0C5h
    db 15h
    db 75h
    db 39h
    db 8Dh
    db 3Eh
    db 0FBh
    db 13h
    db 3Bh
    db 0CAh
    db 7Dh
    db 02h
    db 87h
    db 0CAh
    db 0Bh
    db 0D2h
    db 79h
    db 02h
    db 2Bh
    db 0D2h
    db 3Bh
    db 0Eh
    db 0C7h
    db 15h
    db 7Eh
    db 04h
    db 8Bh
    db 0Eh
    db 0C7h
    db 15h
    db 3Bh
    db 0Eh
    db 0B9h
    db 15h
    db 76h
    db 04h
    db 89h
    db 0Eh
    db 0B9h
    db 15h
    db 3Bh
    db 16h
    db 0B7h
    db 15h
    db 73h
    db 04h
    db 89h
    db 16h
    db 0B7h
    db 15h
    db 03h
    db 0FAh
    db 03h
    db 0FAh
    db 2Bh
    db 0CAh
    db 41h
    db 8Bh
    db 0C6h
    db 0F3h
    db 0ABh
    db 0C3h
    db 2Bh
    db 0F6h
    db 0Bh
    db 0DBh
    db 78h
    db 0B0h
    db 8Bh
    db 36h
    db 0C5h
    db 15h
    db 3Bh
    db 0DEh
    db 7Fh
    db 0A8h
    db 0C3h
    db 0A1h
    db 3Dh
    db 12h
    db 3Bh
    db 06h
    db 3Bh
    db 12h
    db 73h
    db 19h
    db 8Bh
    db 1Eh
    db 3Bh
    db 12h
    db 89h
    db 1Eh
    db 3Dh
    db 12h
    db 0A3h
    db 3Bh
    db 12h
    db 0A1h
    db 41h
    db 12h
    db 8Bh
    db 1Eh
    db 3Fh
    db 12h
    db 89h
    db 1Eh
    db 41h
    db 12h
    db 0A3h
    db 3Fh
    db 12h
    db 8Bh
    db 1Eh
    db 3Dh
    db 12h
    db 2Bh
    db 1Eh
    db 3Bh
    db 12h
    db 89h
    db 1Eh
    db 0B3h
    db 15h
    db 0A1h
    db 41h
    db 12h
    db 8Bh
    db 0D0h
    db 8Bh
    db 0Eh
    db 3Fh
    db 12h
    db 2Bh
    db 0C1h
    db 0BDh
    db 02h
    db 00h
    db 79h
    db 06h
    db 87h
    db 0CAh
    db 0F7h
    db 0DDh
    db 0F7h
    db 0D8h
    db 0A3h
    db 0B5h
    db 15h
    db 3Bh
    db 16h
    db 0B9h
    db 15h
    db 76h
    db 04h
    db 89h
    db 16h
    db 0B9h
    db 15h
    db 3Bh
    db 0Eh
    db 0B7h
    db 15h
    db 73h
    db 04h
    db 89h
    db 0Eh
    db 0B7h
    db 15h
    db 3Bh
    db 0C3h
    db 73h
    db 4Bh
    db 8Bh
    db 3Eh
    db 3Fh
    db 12h
    db 0D1h
    db 0E7h
    db 0A1h
    db 3Bh
    db 12h
    db 8Bh
    db 16h
    db 0B3h
    db 15h
    db 8Bh
    db 0CAh
    db 8Bh
    db 0D9h
    db 43h
    db 0D1h
    db 0EBh
    db 0F7h
    db 0DBh
    db 8Bh
    db 36h
    db 0B5h
    db 15h
    db 0EBh
    db 10h
    db 90h
    db 3Bh
    db 85h
    db 0FBh
    db 13h
    db 76h
    db 04h
    db 89h
    db 85h
    db 0FBh
    db 13h
    db 40h
    db 2Bh
    db 0DAh
    db 03h
    db 0FDh
    db 3Bh
    db 85h
    db 43h
    db 12h
    db 73h
    db 04h
    db 89h
    db 85h
    db 43h
    db 12h
    db 49h
    db 78h
    db 07h
    db 03h
    db 0DEh
    db 79h
    db 0E0h
    db 40h
    db 0EBh
    db 0F6h
    db 3Bh
    db 85h
    db 0FBh
    db 13h
    db 76h
    db 04h
    db 89h
    db 85h
    db 0FBh
    db 13h
    db 0C3h
    db 8Bh
    db 3Eh
    db 3Fh
    db 12h
    db 0D1h
    db 0E7h
    db 0A1h
    db 3Bh
    db 12h
    db 8Bh
    db 16h
    db 0B5h
    db 15h
    db 8Bh
    db 0CAh
    db 8Bh
    db 0D9h
    db 43h
    db 0D1h
    db 0EBh
    db 0F7h
    db 0DBh
    db 8Bh
    db 36h
    db 0B3h
    db 15h
    db 3Bh
    db 85h
    db 43h
    db 12h
    db 73h
    db 04h
    db 89h
    db 85h
    db 43h
    db 12h
    db 3Bh
    db 85h
    db 0FBh
    db 13h
    db 76h
    db 04h
    db 89h
    db 85h
    db 0FBh
    db 13h
    db 49h
    db 78h
    db 0Bh
    db 03h
    db 0FDh
    db 03h
    db 0DEh
    db 78h
    db 0E3h
    db 2Bh
    db 0DAh
    db 40h
    db 0EBh
    db 0DEh
    db 0C3h
    db 0E8h
    db 0Dh
    db 00h
    db 0CBh
dead_0f3a endp

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
dead_routine_33 proc near
    db 00h
    push BP
    mov BP,SP
    sub SP,4h
    sub AX,AX
    push AX
    push word ptr [BP + 4h]
    call _openFileWrapper
    add SP,4h
    mov word ptr [BP + -4h],AX
    push word ptr [BP + 6h]
    mov AX,0ffffh
    push AX
    push word ptr [BP + -4h]
    call _readFileBlock
    add SP,6h
    mov word ptr [BP + -2h],AX
    push word ptr [BP + -4h]
    call _closeFileWrapper
    mov AX,word ptr [BP + -2h]
    mov SP,BP
    pop BP
    ret
    db 90h
dead_routine_33 endp

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

FUN_1000_173e proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,offset FUN_1000_14d7
    mov word ptr [_picReadFromFilePtr],AX
    mov word ptr [_fileReadPos],200h
    mov word ptr [dat_186A],0h
    mov AX,word ptr [BP + 4h]
    mov word ptr [dat_1868],AX
    mov AX,word ptr [BP + Stack[4h]+2h]
    mov ES,AX
    call far ptr gfx_clearPage
    call routine_120
    mov word ptr [_picRow],0h
    mov word ptr [_picScreenBufSize],0fa00h
LAB_1000_1776:
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
    jnz LAB_1000_1776
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
FUN_1000_173e endp

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

PUBLIC _dosExit
_dosExit:
dosExit proc near
    push BP
    mov BP,SP
    push word ptr [BP+4h]
    call _exit
dosExit endp

PUBLIC _routine_46
_routine_46:
routine_46 proc near
    push BP
    mov BP,SP
    sub SP,2h
    push SI
    call __getstream
    mov SI,AX
    or SI,SI
    jz LAB_1000_4c18
    push SI
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call __openfile
    add SP,6h
    jmp LAB_1000_4c1a
    db 90h
LAB_1000_4c18:
    sub AX,AX
LAB_1000_4c1a:
    pop SI
    mov SP,BP
    pop BP
    ret
    db 90h
routine_46 endp

_fileSeek:
fileSeek proc near
    push BP
    mov BP,SP
    sub SP,4h
    mov BX,word ptr [BP + 4h]
    cmp BX,word ptr [_var_130]
    jc LAB_1000_4c34
    mov AX,900h
    jmp LAB_1000_4c5e
LAB_1000_4c34:
    test word ptr [BP + 8h],8000h
    jz LAB_1000_4c83
    cmp word ptr [BP + 0ah],0h
    jz LAB_1000_4c5b
    xor CX,CX
    mov DX,CX
    mov AX,4201h
    int 21h
    jc LAB_1000_4c97
    test word ptr [BP + 0ah],2h
    jnz LAB_1000_4c61
    add AX,word ptr [BP + 6h]
    adc DX,word ptr [BP + 8h]
    jns LAB_1000_4c83
LAB_1000_4c5b:
    mov AX,1600h
LAB_1000_4c5e:
    stc
    jmp LAB_1000_4c97
LAB_1000_4c61:
    mov word ptr [BP + -2h],DX
    mov word ptr [BP + -4h],AX
    mov DX,CX
    mov AX,4202h
    int 21h
    add AX,word ptr [BP + 6h]
    adc DX,word ptr [BP + 8h]
    jns LAB_1000_4c83
    mov CX,word ptr [BP + -2h]
    mov DX,word ptr [BP + -4h]
    mov AX,4200h
    int 21h
    jmp LAB_1000_4c5b
LAB_1000_4c83:
    mov DX,word ptr [BP + 6h]
    mov CX,word ptr [BP + 8h]
    mov AL,byte ptr [BP + 0ah]
    mov AH,42h
    int 21h
    jc LAB_1000_4c97
    and byte ptr [BX + offset _var_131],0fdh
LAB_1000_4c97:
    jmp fileSeekWithCheck
fileSeek endp

PUBLIC _routine_140
_routine_140:
routine_140 proc near
    push BP
    mov BP,SP
    push SI
    push DI
    push DS
    mov DS,word ptr [BP + 4h]
    mov SI,word ptr [BP + 6h]
    mov ES,word ptr [BP + 8h]
    mov DI,word ptr [BP + 0ah]
    mov CX,word ptr [BP + 0ch]
    rep movsb
    pop DS
    pop DI
    pop SI
    mov SP,BP
    pop BP
    ret
routine_140 endp

getRandom proc near
    mov AX,43fdh
    mov DX,3h
    push DX
    push AX
    push word ptr [_randState]
    push word ptr [_randSeed]
    call __aNlmul
    add AX,9ec3h
    adc DX,26h
    mov word ptr [_randSeed],AX
    mov word ptr [_randState],DX
    mov AX,DX
    and AH,7fh
    ret
getRandom endp


fileSeekWithCheck proc near
    jnc LAB_1000_4f3c
LAB_1000_4f35:
    call routine_114
    mov AX,0ffffh
    cwd
LAB_1000_4f3c:
    mov SP,BP
    pop BP
    ret
    db 32h
    db 0E4h
    db 0E8h
    db 01h
    db 00h
    db 0C3h
fileSeekWithCheck endp

routine_114 proc near
    mov byte ptr [_var_129],AL
    or AH,AH
    jnz LAB_1000_4f70
    cmp byte ptr [__osmajor],3h
    jc LAB_1000_4f61
    cmp AL,22h
    jnc LAB_1000_4f65
    cmp AL,20h
    jc LAB_1000_4f61
    mov AL,5h
    jmp LAB_1000_4f67
    db 90h
LAB_1000_4f61:
    cmp AL,13h
    jbe LAB_1000_4f67
LAB_1000_4f65:
    mov AL,13h
LAB_1000_4f67:
    mov BX,offset _dat_231c
    xlat
LAB_1000_4f6b:
    cbw
    mov word ptr [_var_125],AX
    ret
LAB_1000_4f70:
    mov AL,AH
    jmp LAB_1000_4f6b
routine_114 endp


; --- shared joystick routines
joyRawAxis0      EQU _joyRawAxis0
joyRawAxis1      EQU _joyRawAxis1
joyMinValues     EQU _joyMinValues
joyMaxValues     EQU _joyMaxValues
joyCenterValues  EQU _joyCenterValues
joyRangeBelow    EQU _joyRangeBelow
joyRangeAbove    EQU _joyRangeAbove
joyNormAxes      EQU _joyAxisX
JOY_INCLUDE_DEAD_CODE EQU 1
INCLUDE shared/joystick.inc
_pollJoystick equ pollJoystick
_copyJoystickData equ copyJoystickData





END
