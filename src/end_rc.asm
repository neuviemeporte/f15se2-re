.8086
DOSSEG
.MODEL SMALL

Stack equ 0
local_res0 equ 0
param_1 equ 4h
param_2 equ 6h
param_3 equ 8h
a equ 2h
b equ 6h

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
EXTRN _closeAndResetFile:PROC
EXTRN _markHandleClosed:PROC
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
EXTRN _my_itoa:PROC
EXTRN _my_ltoa:PROC
EXTRN _blinkWidget:PROC
EXTRN _processMenuItems:PROC
EXTRN _processDebriefInput:PROC
EXTRN _calcMissionScore:PROC
EXTRN _showPostMissionAwards:PROC
EXTRN _drawFlightPath:PROC
EXTRN _showEventPopup:PROC
EXTRN _formatFlightTime:PROC
PUBLIC _gfx_jump_05_drawString
PUBLIC _gfx_jump_2f_charWidth
PUBLIC _routine_108
PUBLIC _routine_109
PUBLIC _worldBufHandle
PUBLIC _worldDataReady
PUBLIC _ejectedFlag
PUBLIC _popupSpriteY
PUBLIC _popupSpriteX
PUBLIC _timerHandlerInstalled
PUBLIC _str_allocError
PUBLIC _str_deallocError
PUBLIC _randSeed
PUBLIC _randState
PUBLIC _mapViewX1
PUBLIC _mapViewY1
PUBLIC _mapViewX2
PUBLIC _mapViewY2
PUBLIC _timerCounter
PUBLIC _cursorX
PUBLIC _cursorY
PUBLIC _commData
PUBLIC _quitFlag
PUBLIC _slotInfoTable
PUBLIC _curRecordIdx
PUBLIC _spriteAir
PUBLIC _spriteSam
PUBLIC _spriteGround
PUBLIC _spriteWaypoint
PUBLIC _flightRecords
PUBLIC _target1Type
PUBLIC _target1MiscBits
PUBLIC _target2Type
PUBLIC _target2MiscBits
PUBLIC _str_timeFormat
PUBLIC _nightMission
PUBLIC _gfx_jump_11_blitSprite
PUBLIC _gfx_jump_21
PUBLIC _gfx_jump_29_switchColor
PUBLIC _gfx_jump_2a
PUBLIC _clearRect
PUBLIC _mystrcat
PUBLIC __aNlrem
PUBLIC __aNNaldiv
PUBLIC __aNldiv
PUBLIC _str_pressExit
PUBLIC _str_dot1
PUBLIC _str_overall1
PUBLIC _str_missionRating1
PUBLIC _str_dot2
PUBLIC _str_trainingScore
PUBLIC _str_notRecorded
PUBLIC _str_dot3
PUBLIC _str_careerTotal
PUBLIC _str_dot4
PUBLIC _str_missionSummary
PUBLIC _str_priSecTargets
PUBLIC _str_otherTargets
PUBLIC _str_enemyPlanes
PUBLIC _str_friendlyTargets
PUBLIC _str_dot5
PUBLIC _str_overall2
PUBLIC _str_missionRating2
PUBLIC _str_dot6
PUBLIC _str_missionEvent
PUBLIC _str_time
PUBLIC _str_destroyed4
PUBLIC _str_destroyed1
PUBLIC _str_destroyed2
PUBLIC _str_shotDown2
PUBLIC _str_shotDown
PUBLIC _str_destroyed3
PUBLIC _str_rearmed3
PUBLIC _str_rearmed1
PUBLIC _str_rearmed2
PUBLIC _str_hitBy
PUBLIC _str_missile
PUBLIC _str_takeoffPoint
PUBLIC _str_missionEnd
PUBLIC _str_crashed
PUBLIC _str_goodBailout
PUBLIC _str_captured
PUBLIC _str_bailedDied
PUBLIC _str_goodLanding
PUBLIC _str_primaryObj
PUBLIC _str_secndryObj
PUBLIC _str_cumulative2
PUBLIC _str_cumulative
PUBLIC _str_missionRating3
PUBLIC _str_pressSelect
PUBLIC _str_pressNext
PUBLIC _dat_424e
PUBLIC _var_425c
PUBLIC _dat_4804
PUBLIC _var_193
PUBLIC _var_192
PUBLIC _var_102


PUBLIC _samKilled
PUBLIC _samMissed
PUBLIC _gridFlags
PUBLIC _groundKilled
PUBLIC _groundMissed
PUBLIC _unitTypeTable
PUBLIC _primaryHit
PUBLIC _secondaryHit
PUBLIC _airKilled
PUBLIC _airMissed
PUBLIC _samDataTable
PUBLIC _var_194
PUBLIC _selectedMenuItem
PUBLIC _var_195
PUBLIC _var_196
PUBLIC _var_197
PUBLIC _lastDrawX
PUBLIC _prevDrawX
PUBLIC _lastDrawY
PUBLIC _prevDrawY
PUBLIC _popupVisible
PUBLIC _missionScore
PUBLIC _missionScoreHi
PUBLIC _popupX
PUBLIC _popupY
PUBLIC _scoreString
PUBLIC _str_inFlight
PUBLIC _str_timeLabel
PUBLIC _str_timeZeros
PUBLIC _misc_jump_5a_keybuf
PUBLIC _misc_jump_5b_getkey
PUBLIC _misc_jump_5d_readJoy
PUBLIC _setTimerIrqHandler
PUBLIC _farStrcpy
PUBLIC _decodePicRaw
PUBLIC _fileSeek
PUBLIC _copyJoystickData
PUBLIC _gfx_jump_31
PUBLIC _gfx_jump_17_bufSize
PUBLIC _awardColor
PUBLIC _awardFont
PUBLIC _awardPage
PUBLIC _rankNames
PUBLIC _promoScores
PUBLIC _promoThresholds
PUBLIC _medalNames
PUBLIC _medalScores
PUBLIC _medalThresholds
PUBLIC _textBuf
PUBLIC _str_deskPic
PUBLIC _str_deskMsg1
PUBLIC _str_deskMsg2
PUBLIC _str_deathPic
PUBLIC _str_deathMsg1
PUBLIC _str_deathMsg2
PUBLIC _str_promoPic
PUBLIC _str_promoMsg1
PUBLIC _str_promoMsg2
PUBLIC _str_medalPic
PUBLIC _str_medalMsg1
PUBLIC _str_medalMsg2
PUBLIC _gfx_jump_3d_null
PUBLIC _gfx_jump_50
PUBLIC _gfx_jump_45_retrace
PUBLIC _gfx_jump_46_retrace2

; --- Code segment ---

EXTRN _main:PROC

PUBLIC _colorTablePtr
PUBLIC _inputChanged
PUBLIC _colorAnimIdx
PUBLIC _colorAnimEnabled
PUBLIC _joyRepeatFlag
PUBLIC _spriteToggle
PUBLIC _animDone
PUBLIC _enterPressed
PUBLIC _timerCounter2
PUBLIC _timerCounter3
PUBLIC _dat_1c8e
PUBLIC _spriteAirBlink
PUBLIC _spriteSamBlink
PUBLIC _spriteGroundBlink
PUBLIC _spriteWaypointBlink
PUBLIC _routine_134
PUBLIC _gameData
PUBLIC _hercFlag
PUBLIC _joyAxisY
PUBLIC _joyAxisX
PUBLIC _hasVgaMode
PUBLIC _gfxBufSeg
PUBLIC _vgaBufSeg
PUBLIC _vgaBufSeg2
PUBLIC _vgaBufOffset
PUBLIC _spriteBufSeg
PUBLIC _missionResult

routine_10 proc near
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
routine_10 endp

main equ _main

checkQuitFlag equ _checkQuitFlag

PUBLIC _initGraphics
_initGraphics:
initGraphics proc near
    push BP
    mov BP,SP
    sub SP,10h
    call seedRandom
    sub AX,AX
    push AX
    call far ptr gfx_jump_0e_setCurBuf
    add SP,2h
    sub AX,AX
    push AX
    call far ptr gfx_jump_0_alloc
    add SP,2h
    sub AX,AX
    push AX
    call far ptr gfx_jump_53
    add SP,2h
    les BX,dword ptr [_commData]
    push word ptr ES:[BX + 24h]
    call far ptr gfx_jump_52
    add SP,2h
    mov AX,1h
    push AX
    call far ptr gfx_jump_44_setDac
    add SP,2h
    mov AX,1h
    push AX
    les BX,dword ptr [_commData]
    push word ptr ES:[BX + 20h]
    call far ptr gfx_jump_4b_storeBufPtr
    mov SP,BP
    pop BP
    ret
initGraphics endp

cleanup equ _cleanup

routine_6 equ _routine_6

routine_5 equ _routine_5

loadWorldStrings equ _loadWorldStrings

PUBLIC _readWorldData
_readWorldData:
readWorldData proc near
    mov AX,2h
    push AX
    mov AX,offset dat_4246
    push AX
    call _loadWorldData
    add SP,4h
    mov AX,2h
    push AX
    mov AX,offset _var_203
    push AX
    call _loadWorldData
    add SP,4h
    mov AX,2h
    push AX
    mov AX,offset dat_4040
    push AX
    call _loadWorldData
    add SP,4h
    mov AX,2h
    push AX
    mov AX,offset dat_5ab4
    push AX
    call _loadWorldData
    add SP,4h
    mov AX,word ptr [_var_203]
    mov CL,4h
    shl AX,CL
    push AX
    mov AX,offset dat_424e
    push AX
    call _loadWorldData
    add SP,4h
    mov AX,2h
    push AX
    mov AX,offset _var_216
    push AX
    call _loadWorldData
    add SP,4h
    mov AX,24h
    imul word ptr [_var_216]
    push AX
    mov AX,offset dat_4a2a
    push AX
    call _loadWorldData
    add SP,4h
    mov AX,64h
    push AX
    mov AX,offset _unitTypeTable
    push AX
    call _loadWorldData
    add SP,4h
    mov AX,64h
    push AX
    mov AX,offset dat_5512
    push AX
    call _loadWorldData
    add SP,4h
    mov AX,2eeh
    push AX
    mov AX,offset _worldStringBuf
    push AX
    call _loadWorldData
    add SP,4h
    mov AX,100h
    push AX
    mov AX,offset _gridFlags
    push AX
    call _loadWorldData
    add SP,4h
    mov AX,2h
    push AX
    mov AX,offset dat_55de
    push AX
    call _loadWorldData
    add SP,4h
    mov AX,2h
    push AX
    mov AX,offset dat_4034
    push AX
    call _loadWorldData
    add SP,4h
    mov AX,10h
    push AX
    mov AX,offset dat_0042
    push AX
    call _loadWorldData
    add SP,4h
    mov AX,24h
    push AX
    mov AX,offset _target1Type
    push AX
    call _loadWorldData
    add SP,4h
    mov AX,600h
    push AX
    mov AX,offset _var_193
    push AX
    call _loadWorldData
    add SP,4h
    ret
readWorldData endp

routine_71 equ _loadWorldData

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

_routine_108:
routine_108 proc near
    push BP
    mov BP,SP
    sub SP,4h
    push SI
    mov AX,word ptr [BP + 4h]
    mov word ptr [BP + -4h],AX
    mov word ptr [BP + -2h],DS
    mov AX,word ptr [BP + 6h]
    imul word ptr [BP + 8h]
    mov SI,AX
    push SI
    push word ptr [BP + -4h]
    push DS
    push word ptr [_var_151]
    push word ptr [_var_152]
    call routine_140
    add SP,0ah
    add word ptr [_var_151],SI
    pop SI
    mov SP,BP
    pop BP
    ret
routine_108 endp

_routine_109:
routine_109 proc near
    push BP
    mov BP,SP
    sub SP,4h
    push SI
    mov AX,word ptr [BP + 4h]
    mov word ptr [BP + -4h],AX
    mov word ptr [BP + -2h],DS
    mov AX,word ptr [BP + 6h]
    imul word ptr [BP + 8h]
    mov SI,AX
    push SI
    push word ptr [_var_151]
    push word ptr [_var_152]
    push word ptr [BP + -4h]
    push DS
    call routine_140
    add SP,0ah
    add word ptr [_var_151],SI
    pop SI
    mov SP,BP
    pop BP
    ret
    db 0C3h
routine_109 endp

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

waitForKeyOrJoy equ _waitForKeyOrJoy


drawStringAtPos equ _drawStringAtPos

drawStringAt equ _drawStringAt

drawFarString equ _drawFarString

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
    call far ptr gfx_jump_2f_charWidth
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
    call FUN_1000_0b40
    add SP,8h
    mov SI,word ptr [BP + -0ch]
    mov byte ptr [BP + SI + 0fdf4h],0h
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 0ch]
    mov word ptr [BX + 8h],AX
    lea AX,[BP + 0fdf4h]
    push AX
    push word ptr [BP + 4h]
    call far ptr gfx_jump_05_drawString
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

drawWrappedText equ _drawWrappedText

drawStringCentered equ _drawStringCentered

stringWidth equ _stringWidth

my_ltoa equ _my_ltoa

my_itoa equ _my_itoa

timerWait equ _timerWait

seedRandom equ _seedRandom

FUN_1000_09bf proc near
    push BP
    mov BP,SP
    call FUN_1000_4cca
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
FUN_1000_09bf endp

outportByte equ _outportByte

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

mystrcpy equ _mystrcpy

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

FUN_1000_0a8f proc near
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
FUN_1000_0a8f endp

mystrcat proc near
    push BP
    mov BP,SP
    push SI
LAB_1000_0aaf:
    mov BX,word ptr [BP + 4h]
    cmp byte ptr [BX],0h
    jz LAB_1000_0ac2
    inc word ptr [BP + 4h]
    jmp LAB_1000_0aaf
LAB_1000_0abc:
    inc word ptr [BP + 4h]
    mov BX,word ptr [BP + 4h]
LAB_1000_0ac2:
    mov SI,word ptr [BP + 6h]
    inc word ptr [BP + 6h]
    mov AL,byte ptr [SI]
    mov byte ptr [BX],AL
    or AL,AL
    jnz LAB_1000_0abc
    pop SI
    pop BP
    ret
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
mystrcat endp
_mystrcat equ mystrcat

FUN_1000_0af6 proc near
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
FUN_1000_0af6 endp

FUN_1000_0b0c proc near
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
FUN_1000_0b0c endp

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

FUN_1000_0b40 proc near
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
FUN_1000_0b40 endp

FUN_1000_0b5c proc near
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
FUN_1000_0b5c endp

PUBLIC _intDispatch
_intDispatch:
intDispatch proc near
    push BP
    mov BP,SP
    push SI
    push DI
    push AX
    push BX
    push CX
    push DX
    mov DI,word ptr [BP + 6h]
    mov AX,word ptr [DI]
    mov BX,word ptr [DI + 2h]
    mov CX,word ptr [DI + 4h]
    mov DX,word ptr [DI + 6h]
    cmp word ptr [BP + 4h],10h
    jz LAB_1000_0bb9
    cmp word ptr [BP + 4h],21h
    jz LAB_1000_0bbe
    cmp word ptr [BP + 4h],16h
    jz LAB_1000_0bc3
    cmp word ptr [BP + 4h],1ah
    jz LAB_1000_0bc8
    jmp LAB_1000_0bcd
    db 90h
LAB_1000_0bb9:
    int 10h
    jmp LAB_1000_0bd4
    db 90h
LAB_1000_0bbe:
    int 21h
    jmp LAB_1000_0bd4
    db 90h
LAB_1000_0bc3:
    int 16h
    jmp LAB_1000_0bd4
    db 90h
LAB_1000_0bc8:
    int 1Ah
    jmp LAB_1000_0bd4
    db 90h
LAB_1000_0bcd:
    sub AX,AX
    not AX
    jmp LAB_1000_0be2
    db 90h
LAB_1000_0bd4:
    mov DI,word ptr [BP + 8h]
    mov word ptr [DI],AX
    mov word ptr [DI + 2h],BX
    mov word ptr [DI + 4h],CX
    mov word ptr [DI + 6h],DX
LAB_1000_0be2:
    pop DX
    pop CX
    pop BX
    pop AX
    pop DI
    pop SI
    mov SP,BP
    pop BP
    ret
intDispatch endp

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
dos_printstring proc near
    push BP
    mov BP,SP
    mov AH,9h
    mov DX,word ptr [BP + Stack[2h]+2h]
    int 21h
    pop BP
    ret
    db 00h
    db 00h
dos_printstring endp

PUBLIC _setupOverlaySlots
_setupOverlaySlots:
setupOverlaySlots proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push DS
    push BP
    mov DX,word ptr [BP + 4h]
    mov byte ptr [_var_25],0h
    jmp LAB_1000_0d2f
    db 90h
    db 0C6h
    db 06h
    db 0E8h
    db 0Fh
    db 01h
LAB_1000_0d2f:
    mov ES,DX
    mov BX,offset gfx_jump_0_alloc
    mov DI,1ch
    mov AX,word ptr ES:[DI]
    mov DL,5h
    mul DL
    add BX,AX
    mov DI,22h
    mov CX,word ptr ES:[DI]
    mov SI,24h
    mov DI,18h
    mov DI,word ptr ES:[DI]
LAB_1000_0d4f:
    mov AX,word ptr ES:[SI]
    mov word ptr [BX + 1h],AX
    mov word ptr [BX + 3h],DI
    add SI,2h
    add BX,5h
    loop LAB_1000_0d4f
    cmp byte ptr [_var_25],0h
    jnz LAB_1000_0d6f
    pop BP
    pop DS
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
LAB_1000_0d6f:
    ret
setupOverlaySlots endp

FUN_1000_0d70 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push DS
    push BP
    mov AX,word ptr [BP + 4h]
    mov byte ptr [_var_25],0h
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
    cmp byte ptr [_var_25],0h
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
    call far ptr gfx_jump_10_getCurBuf
    push AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    call far ptr gfx_jump_0d_setCurBuf
    mov AH,byte ptr [BX + 4h]
    call far ptr gfx_jump_20_setVal
    call sub_12C75
    mov AX,word ptr [BP + 0ah]
    sub AX,word ptr [BP + 6h]
    mov word ptr [_var_29],AX
    mov AX,word ptr [BP + 0ch]
    sub AX,word ptr [BP + 8h]
    inc AX
    mov word ptr [_var_30],AX
    mov CX,word ptr [BP + 0ch]
    mov SI,word ptr [BP + 8h]
    mov word ptr [_var_28],SI
    mov word ptr [_var_38],CX
    mov word ptr [_var_37],SI
    sub CX,SI
    inc CX
    lea DI,word ptr [_var_35]
    shl SI,1h
    add DI,SI
    mov AX,word ptr [BP + 6h]
    mov word ptr [_var_27],AX
    mov DX,CX
    rep stosw
    mov CX,DX
    lea DI,word ptr [_var_36]
    add DI,SI
    mov AX,word ptr [BP + 0ah]
    rep stosw
    mov BX,offset _var_35
    mov AX,word ptr [_var_37]
    mov CX,word ptr [_var_38]
    call far ptr gfx_jump_28
    call far ptr gfx_jump_22
    mov AX,word ptr [_var_27]
    mov BX,word ptr [_var_28]
    mov CX,word ptr [_var_29]
    mov DX,word ptr [_var_30]
    call far ptr gfx_jump_51_null
    pop AX
    call far ptr gfx_jump_0f_getBufPtr
    pop BP
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
FUN_1000_0d70 endp

clearRect proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push BP
    push DS
    pop ES
    call far ptr gfx_jump_10_getCurBuf
    push AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    call far ptr gfx_jump_0d_setCurBuf
    mov AH,byte ptr [BX + 6h]
    call far ptr gfx_jump_20_setVal
    call sub_12C75
    mov AX,word ptr [BP + 0ah]
    sub AX,word ptr [BP + 6h]
    mov word ptr [_var_29],AX
    mov AX,word ptr [BP + 0ch]
    sub AX,word ptr [BP + 8h]
    inc AX
    mov word ptr [_var_30],AX
    mov CX,word ptr [BP + 0ch]
    mov SI,word ptr [BP + 8h]
    mov word ptr [_var_28],SI
    mov word ptr [_var_38],CX
    mov word ptr [_var_37],SI
    sub CX,SI
    inc CX
    lea DI,word ptr [_var_35]
    shl SI,1h
    add DI,SI
    mov AX,word ptr [BP + 6h]
    mov word ptr [_var_27],AX
    mov DX,CX
    rep stosw
    mov CX,DX
    lea DI,word ptr [_var_36]
    add DI,SI
    mov AX,word ptr [BP + 0ah]
    rep stosw
    mov BX,offset _var_35
    mov AX,word ptr [_var_37]
    mov CX,word ptr [_var_38]
    call far ptr gfx_jump_28
    call far ptr gfx_jump_22
    mov AX,word ptr [_var_27]
    mov BX,word ptr [_var_28]
    mov CX,word ptr [_var_29]
    mov DX,word ptr [_var_30]
    call far ptr gfx_jump_51_null
    pop AX
    call far ptr gfx_jump_0f_getBufPtr
    pop BP
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
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
clearRect endp
_clearRect equ clearRect

sub_12C75 proc near
    mov DI,word ptr [_var_37]
    or DI,DI
    js LAB_1000_0f39
    mov CX,word ptr [_var_38]
    inc CX
    sub CX,DI
    shl DI,1h
    mov BX,CX
    mov DX,DI
    add DI,offset _var_35
    mov AX,0ffffh
    rep stosw
    mov word ptr [_var_37],AX
    mov CX,BX
    mov DI,DX
    add DI,offset _var_36
    sub AX,AX
    rep stosw
    mov word ptr [_var_38],AX
LAB_1000_0f39:
    ret
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
sub_12C75 endp

routine_154 proc near
    push BP
    push SI
    push DI
    push ES
    call routine_158
    pop ES
    pop DI
    pop SI
    pop BP
    ret
routine_154 endp

routine_158 proc near
    sub AX,AX
    mov ES,AX
    push word ptr ES:[0h]
    lea AX,word ptr [_var_26]
    mov ES:[0h],AX
    push DS
    pop ES
    jmp LAB_1000_10fa
    db 90h
LAB_1000_10a0:
    sub AX,AX
    mov ES,AX
    pop word ptr ES:[0h]
    push DS
    pop ES
    mov AX,word ptr [_var_31]
    mov BX,word ptr [_var_33]
    mov CX,word ptr [_var_32]
    mov DX,word ptr [_var_34]
    call far ptr gfx_jump_1f
    clc
    ret
LAB_1000_10c1:
    sub AX,AX
    mov ES,AX
    pop word ptr ES:[0h]
    push DS
    pop ES
    stc
    ret
LAB_1000_10ce:
    cmc
    rcr DX,1h
    mov word ptr [_var_40],DX
    sar DX,1h
    mov word ptr [_var_44],DX
    mov DX,DI
    sub DX,BP
    jno LAB_1000_10e7
    cmc
    rcr DX,1h
    jmp LAB_1000_1155
    db 90h
LAB_1000_10e7:
    sar DX,1h
    jmp LAB_1000_1155
    db 90h
LAB_1000_10ec:
    cmc
    rcr DX,1h
    sar word ptr [_var_40],1h
    sar word ptr [_var_44],1h
    jmp LAB_1000_1155
    db 90h
LAB_1000_10fa:
    mov CX,word ptr [_var_31]
    mov DX,word ptr [_var_33]
    mov SI,word ptr [_var_32]
    mov DI,word ptr [_var_34]
    mov BX,CX
    mov BP,DX
    call sub_12F6A
    mov byte ptr [_var_39],AL
    mov BX,SI
    mov BP,DI
    call sub_12F6A
    jnz LAB_1000_1137
    cmp byte ptr [_var_39],0h
    jnz LAB_1000_1127
    jmp LAB_1000_10a0
LAB_1000_1127:
    db 87h, 0CEh  ; xchg CX,SI
    db 87h, 0D7h  ; xchg DX,DI
    xchg byte ptr [_var_39],AL
    mov word ptr [_var_31],CX
    mov word ptr [_var_33],DX
LAB_1000_1137:
    test byte ptr [_var_39],AL
    jnz LAB_1000_10c1
    mov BP,DX
    mov DX,SI
    sub DX,CX
    jo LAB_1000_10ce
    mov word ptr [_var_40],DX
    sar DX,1h
    mov word ptr [_var_44],DX
    mov DX,DI
    sub DX,BP
    jo LAB_1000_10ec
LAB_1000_1155:
    mov word ptr [_var_42],DX
    sar DX,1h
    mov word ptr [_var_45],DX
LAB_1000_115f:
    test AL,9h
    jz LAB_1000_119b
    sub BX,BX
    or SI,SI
    js LAB_1000_116d
    mov BX,word ptr [_var_46]
LAB_1000_116d:
    mov AX,BX
    sub AX,CX
    imul word ptr [_var_42]
    push BX
    mov BX,DX
    idiv word ptr [_var_40]
    mov BL,BH
    xor BL,byte ptr [_var_41]
    jns LAB_1000_1187
    neg DX
    dec AX
LAB_1000_1187:
    sub DX,word ptr [_var_44]
    xor DH,BH
    js LAB_1000_1190
    inc AX
LAB_1000_1190:
    pop BX
    add AX,BP
    js LAB_1000_11a3
    cmp AX,word ptr [_var_47]
    jle LAB_1000_11d4
LAB_1000_119b:
    mov BX,word ptr [_var_47]
    cmp DI,BX
    jg LAB_1000_11a5
LAB_1000_11a3:
    sub BX,BX
LAB_1000_11a5:
    mov AX,BX
    sub AX,BP
    imul word ptr [_var_40]
    push BX
    mov BX,DX
    idiv word ptr [_var_42]
    mov BL,BH
    xor BL,byte ptr [_var_43]
    jns LAB_1000_11bf
    neg DX
    dec AX
LAB_1000_11bf:
    sub DX,word ptr [_var_45]
    xor DH,BH
    js LAB_1000_11c8
    inc AX
LAB_1000_11c8:
    pop BX
    add AX,CX
    js LAB_1000_11e5
    cmp AX,word ptr [_var_46]
    jg LAB_1000_11e5
    xchg AX,BX
LAB_1000_11d4:
    cmp byte ptr [_var_39],0h
    jnz LAB_1000_11e8
    mov word ptr [_var_34],AX
    mov word ptr [_var_32],BX
    jmp LAB_1000_10a0
LAB_1000_11e5:
    jmp LAB_1000_10c1
LAB_1000_11e8:
    mov word ptr [_var_33],AX
    mov word ptr [_var_31],BX
    db 87h, 0CEh  ; xchg CX,SI
    db 87h, 0EFh  ; xchg BP,DI
    mov AL,byte ptr [_var_39]
    mov byte ptr [_var_39],0h
    jmp LAB_1000_115f
routine_158 endp

sub_12F6A proc near
    mov AL,0fh
    or BX,BX
    js LAB_1000_1206
    and AL,0f7h
LAB_1000_1206:
    cmp BX,word ptr [_var_46]
    jg LAB_1000_120e
    and AL,0feh
LAB_1000_120e:
    or BP,BP
    js LAB_1000_1214
    and AL,0fbh
LAB_1000_1214:
    cmp BP,word ptr [_var_47]
    jg LAB_1000_121c
    and AL,0fdh
LAB_1000_121c:
    or AL,AL
    ret
sub_12F6A endp

FUN_1000_121f proc near
    push BP
    mov BP,SP
    cmp word ptr [BP + local_res0+2h],11b0h
    mov AX,word ptr [_var_42]
    jz LAB_1000_122f
    mov AX,word ptr [_var_40]
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
FUN_1000_121f endp

PUBLIC _installCBreakHandler
_installCBreakHandler:
installCBreakHandler proc near
    push SI
    push DI
    push DX
    push DS
    mov SI,6ch
    call routine_33
    mov word ptr [_var_59],BX
    mov word ptr [_var_58],AX
    mov AX,seg @code
    mov DX,offset cbreakHandler
    mov DS,AX
    mov AX,251bh
    int 21h
    pop DS
    pop DX
    pop DI
    pop SI
    ret
installCBreakHandler endp

restoreCbreakHandler proc near
PUBLIC _restoreCbreakHandler
_restoreCbreakHandler:
    push DS
    mov AX,word ptr [_var_58]
    mov DX,word ptr [_var_59]
    mov DS,AX
    mov AX,251bh
    int 21h
    pop DS
    ret
restoreCbreakHandler endp

routine_33 proc near
    push DS
    xor AX,AX
    mov DS,AX
    mov BX,word ptr [SI]
    mov AX,word ptr [SI + 2h]
    pop DS
    ret
cbreakHandler:
    push DS
    push AX
    mov AX,seg @data
    mov DS,AX
    mov byte ptr [_quitFlag],0FFh
    pop AX
    pop DS
    iret
    db 00h
    push BP
    mov BP,SP
    sub SP,4h
    sub AX,AX
    push AX
    push word ptr [BP + 4h]
    call openFileWrapper
    add SP,4h
    mov word ptr [BP + -4h],AX
    push word ptr [BP + 6h]
    mov AX,0ffffh
    push AX
    push word ptr [BP + -4h]
    call readFileBlock
    add SP,6h
    mov word ptr [BP + -2h],AX
    push word ptr [BP + -4h]
    call closeFileWrapper
    mov AX,word ptr [BP + -2h]
    mov SP,BP
    pop BP
    ret
    db 90h
routine_33 endp

loadFileSection equ _loadFileSection

loadFileSectionEx equ _loadFileSectionEx


openFileWrapper equ _openFileWrapper

openFileRead equ _openFileRead

closeFileWrapper equ _closeFileWrapper

readFileBlock equ _readFileBlock

readFileAt equ _readFileAt

readFileAtEx equ _readFileAtEx

PUBLIC _openFile
_openFile:
openFile proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AH,3dh
    mov AL,byte ptr [BP + Stack[4h]+2h]
    mov BX,SS
    mov DS,BX
    mov DX,word ptr [BP + Stack[2h]+2h]
    int 21h
    jnc LAB_1000_13f7
    db 3Dh, 02h, 00h  ; cmp AX,02h (force word-immediate)
    jnz LAB_1000_13d6
LAB_1000_13ca:
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov AX,offset str_fileNotFound
    mov CX,0ffffh
    jmp FUN_1000_156a
LAB_1000_13d6:
    db 3Dh, 03h, 00h  ; cmp AX,03h (force word-immediate)
    jz LAB_1000_13ca
    db 3Dh, 04h, 00h  ; cmp AX,04h (force word-immediate)
    jnz LAB_1000_13ec
    mov CX,0ffffh
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov AX,offset str_noFileBufs
    jmp FUN_1000_156a
LAB_1000_13ec:
    mov CX,AX
    mov AX,offset str_openError
    mov BX,word ptr [BP + Stack[2h]+2h]
    jmp FUN_1000_156a
LAB_1000_13f7:
    mov word ptr [_var_62],200h
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
openFile endp

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
    jmp FUN_1000_156a
LAB_1000_142d:
    db 3Dh, 03h, 00h  ; cmp AX,03h (force word-immediate)
    jz LAB_1000_1421
    db 3Dh, 04h, 00h  ; cmp AX,04h (force word-immediate)
    jnz LAB_1000_1443
    mov CX,0ffffh
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov AX,offset str_noFileBufs
    jmp FUN_1000_156a
LAB_1000_1443:
    mov CX,AX
    mov AX,offset str_openError
    mov BX,word ptr [BP + Stack[2h]+2h]
    jmp FUN_1000_156a
LAB_1000_144e:
    mov word ptr [_var_62],200h
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
openFileRaw endp

PUBLIC _routine_125
_routine_125:
fileClose proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AH,3eh
    mov BX,word ptr [BP + 4h]
    int 21h
    jnc LAB_1000_1475
    mov DX,offset str_fileCloseError
    mov CX,0ffffh
    jmp LAB_1000_1585
LAB_1000_1475:
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
    db 0C3h
fileClose endp

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
    jmp LAB_1000_1585
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
    jmp LAB_1000_1585
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
    mov DI,offset dat_1606
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

FUN_1000_1500 proc near
    push DS
    mov AH,3fh
    mov BX,seg @data
    mov DS,BX
    mov BX,word ptr [_var_63]
    mov CX,200h
    mov DX,offset dat_1606
    int 21h
    jnc LAB_1000_151f
    mov DX,offset str_readError
    mov CX,0ffffh
    jmp LAB_1000_1585
    db 90h
LAB_1000_151f:
    pop DS
    ret
FUN_1000_1500 endp

FUN_1000_1521 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_63],AX
    call FUN_1000_1500
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
FUN_1000_1521 endp

PUBLIC _readFileAtExRaw
_readFileAtExRaw:
readFileAtExRaw proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    push DS
    mov AH,40h
    mov BX,word ptr [BP + 0ah]
    mov DS,BX
    mov BX,word ptr [BP + 4h]
    mov CX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    add DX,word ptr [BP + 0ch]
    int 21h
    pop DS
    jnc LAB_1000_1562
    mov DX,offset str_writeError
    mov CX,0ffffh
    jmp LAB_1000_1585
    db 90h
LAB_1000_1562:
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
readFileAtExRaw endp

FUN_1000_156a proc near
    push AX
    mov AX,3h
    int 10h
    mov DI,0h
LAB_1000_1573:
    cmp byte ptr [BX + DI],0h
    jz LAB_1000_157b
    inc DI
    jmp LAB_1000_1573
LAB_1000_157b:
    mov byte ptr [BX + DI],24h
    mov DX,BX
    mov AH,9h
    int 21h
    pop DX
LAB_1000_1585:
    mov AH,9h
    int 21h
    cmp CX,-1h
    jz LAB_1000_15a1
    add CX,30h
    mov byte ptr [_var_60],CL
    mov byte ptr [_var_61],24h
    mov DX,offset _var_60
    mov AH,9h
    int 21h
LAB_1000_15a1:
    mov AX,4c00h
    int 21h
FUN_1000_156a endp

openShowPic equ _openShowPic

loadPicFromFile equ _loadPicFromFile

loadPic equ _loadPic

loadPicFromFileAt equ _loadPicFromFileAt

PUBLIC _showPicFile
_showPicFile:
showPicFile proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,offset FUN_1000_1500
    mov word ptr [_var_68],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_63],AX
    mov AX,word ptr [BP + 6h]
    mov word ptr [_var_65],AX
    call routine_120
    mov SI,word ptr [_var_65]
    call far ptr gfx_jump_38_getPageBuf
    call far ptr gfx_jump_3b_clearBuf
    mov word ptr [_var_67],0h
    mov word ptr [_var_64],0fa00h
LAB_1000_169a:
    mov DI,word ptr [_var_67]
    call far ptr gfx_jump_3a_getRowOffset
    mov word ptr [_var_66],AX
    call decodePicRow
    mov DI,word ptr [_var_66]
    mov BP,offset dat_1872
    mov BX,word ptr [_var_67]
    call far ptr gfx_jump_33_fillRow
    mov DI,word ptr [_var_66]
    call far ptr gfx_jump_35
    inc word ptr [_var_67]
    sub word ptr [_var_64],140h
    jnz LAB_1000_169a
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
showPicFile endp

_decodePicRaw:
decodePicRaw proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,offset FUN_1000_1500
    mov word ptr [_var_68],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_63],AX
    mov AX,word ptr [BP + Stack[4h]+2h]
    mov ES,AX
    call far ptr gfx_jump_3b_clearBuf
    call routine_120
    mov word ptr [_var_67],0h
    mov word ptr [_var_64],0fa00h
LAB_1000_1702:
    mov DI,word ptr [_var_67]
    call far ptr gfx_jump_3a_getRowOffset
    mov word ptr [_var_66],AX
    call decodePicRow
    mov DI,word ptr [_var_66]
    mov BP,offset dat_1872
    mov BX,word ptr [_var_67]
    call far ptr gfx_jump_33_fillRow
    mov DI,word ptr [_var_66]
    call far ptr thunk_EXT_FUN_0000
    inc word ptr [_var_67]
    sub word ptr [_var_64],140h
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
    mov word ptr [_var_68],AX
    mov word ptr [_var_62],200h
    mov word ptr [dat_186A],0h
    mov AX,word ptr [BP + 4h]
    mov word ptr [dat_1868],AX
    mov AX,word ptr [BP + Stack[4h]+2h]
    mov ES,AX
    call far ptr gfx_jump_3b_clearBuf
    call routine_120
    mov word ptr [_var_67],0h
    mov word ptr [_var_64],0fa00h
LAB_1000_1776:
    mov DI,word ptr [_var_67]
    call far ptr gfx_jump_3a_getRowOffset
    mov word ptr [_var_66],AX
    call decodePicRow
    mov DI,word ptr [_var_66]
    mov BP,offset dat_1872
    mov BX,word ptr [_var_67]
    call far ptr gfx_jump_33_fillRow
    mov DI,word ptr [_var_66]
    call far ptr thunk_EXT_FUN_0000
    inc word ptr [_var_67]
    sub word ptr [_var_64],140h
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
decodePic proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,offset FUN_1000_1500
    mov word ptr [_var_68],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_63],AX
    mov AX,word ptr [BP + Stack[4h]+2h]
    mov ES,AX
    call far ptr gfx_jump_3b_clearBuf
    call routine_120
    mov word ptr [_var_67],0h
    mov word ptr [_var_64],0fa00h
LAB_1000_17de:
    mov DI,word ptr [_var_67]
    call far ptr gfx_jump_3a_getRowOffset
    mov word ptr [_var_66],AX
    call decodePicRow
    mov DI,word ptr [_var_66]
    mov BP,offset dat_1872
    mov BX,word ptr [_var_67]
    call far ptr gfx_jump_34_fillRow
    mov DI,word ptr [_var_66]
    call far ptr gfx_jump_36_null
    inc word ptr [_var_67]
    sub word ptr [_var_64],140h
    jnz LAB_1000_17de
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
decodePic endp

routine_120 proc near
    ret
    db 00h
routine_120 endp

decodePicRow proc near
    push ES
    push DS
    pop ES
    cld
    mov SI,word ptr [_var_62]
    add SI,offset dat_1606
    shr DI,1h
    jnz LAB_1000_182f
    call picReadDataAndMakeDict
LAB_1000_182f:
    mov CX,140h
    mov word ptr [_var_155],CX
    mov DI,offset dat_1872
    call routine_145
    sub SI,offset dat_1606
    mov word ptr [_var_62],SI
    pop ES
    ret
decodePicRow endp

picReadDataAndMakeDict proc near
    mov AX,offset dat_1606
    add AX,200h
    mov word ptr [_var_153],AX
    mov AX,offset dat_2769
    mov word ptr [_var_154],AX
    mov byte ptr [_var_156],0h
    mov byte ptr [_var_157],0h
    cmp SI,word ptr [_var_153]
    jc LAB_1000_1872
    push BX
    push CX
    push DX
    call word ptr [_var_68]
    pop DX
    pop CX
    pop BX
    mov SI,offset dat_1606
LAB_1000_1872:
    lodsw
    mov word ptr [_var_162],AX
    mov byte ptr [_var_163],8h
    mov byte ptr [_var_164],1h
    or AL,AL
    jns LAB_1000_188a
    dec byte ptr [_var_164]
    neg AL
LAB_1000_188a:
    mov byte ptr [_var_159],AL
picReadDataAndMakeDict endp

picMakeDict proc near
    mov byte ptr [_var_158],9h
    mov word ptr [_var_160],1ffh
    mov DX,100h
    mov word ptr [_var_161],DX
    mov AX,0ffffh
    xor BX,BX
    mov CX,800h
LAB_1000_18a7:
    mov word ptr [BX + offset _var_167],AX
    add BX,3h
    loop LAB_1000_18a7
    mov AL,0h
    xor BX,BX
    mov CX,100h
LAB_1000_18b7:
    mov byte ptr [BX + offset _var_168],AL
    inc AL
    add BX,3h
    loop LAB_1000_18b7
    ret
picMakeDict endp

routine_145 proc near
    cmp byte ptr [_var_164],0h
    jz LAB_1000_18ce
    shr word ptr [_var_155],1h
LAB_1000_18ce:
    mov AX,word ptr [_var_154]
    mov word ptr [_var_154],SP
    mov SP,AX
    mov DX,word ptr [_var_161]
LAB_1000_18db:
    cmp byte ptr [_var_156],0h
    jnz LAB_1000_1903
    call dictionaryLookup
    cmp AL,90h
    jz LAB_1000_18ef
    mov byte ptr [_var_157],AL
    jmp LAB_1000_190a
    db 90h
LAB_1000_18ef:
    call dictionaryLookup
    or AL,AL
    jnz LAB_1000_18fe
    mov AL,90h
    mov byte ptr [_var_157],AL
    jmp LAB_1000_190a
    db 90h
LAB_1000_18fe:
    dec AL
    mov byte ptr [_var_156],AL
LAB_1000_1903:
    mov AL,byte ptr [_var_157]
    dec byte ptr [_var_156]
LAB_1000_190a:
    cmp byte ptr [_var_164],0h
    jz LAB_1000_1927
    mov AH,AL
    and AL,0fh
    shr AH,1h
    shr AH,1h
    shr AH,1h
    shr AH,1h
    stosw
    dec word ptr [_var_155]
    jnz LAB_1000_18db
    jmp LAB_1000_192e
    db 90h
LAB_1000_1927:
    stosb
    dec word ptr [_var_155]
    jnz LAB_1000_18db
LAB_1000_192e:
    mov word ptr [_var_161],DX
    mov AX,word ptr [_var_154]
    mov word ptr [_var_154],SP
    mov SP,AX
    ret
routine_145 endp

dictionaryLookup proc near
    pop BP
    cmp SP,offset dat_2769
    jz LAB_1000_1946
LAB_1000_1943:
    pop AX
    jmp BP
LAB_1000_1946:
    mov BX,word ptr [_var_162]
    mov CL,10h
    mov CH,byte ptr [_var_163]
    sub CL,CH
    shr BX,CL
    mov CL,CH
LAB_1000_1956:
    cmp CL,byte ptr [_var_158]
    jge LAB_1000_197c
    cmp SI,word ptr [_var_153]
    jc LAB_1000_196f
    push BX
    push CX
    push DX
    call word ptr [_var_68]
    pop DX
    pop CX
    pop BX
    mov SI,offset dat_1606
LAB_1000_196f:
    lodsw
    mov word ptr [_var_162],AX
    shl AX,CL
    or BX,AX
    add CL,10h
    jmp LAB_1000_1956
LAB_1000_197c:
    sub CL,byte ptr [_var_158]
    mov byte ptr [_var_163],CL
    mov AX,BX
    and AX,word ptr [_var_160]
    mov CX,AX
    cmp AX,DX
    jl LAB_1000_199a
    mov CX,DX
    mov AX,word ptr [_var_165]
    mov BL,byte ptr [_var_166]
    push BX
LAB_1000_199a:
    mov BX,AX
    add BX,AX
    add BX,AX
    mov AX,word ptr [BX + offset _var_167]
    inc AX
    jz LAB_1000_19af
    dec AX
    mov BL,byte ptr [BX + offset _var_168]
    push BX
    jmp LAB_1000_199a
LAB_1000_19af:
    mov AL,byte ptr [BX + offset _var_168]
    mov byte ptr [_var_166],AL
    push AX
    mov BX,DX
    add BX,DX
    add BX,DX
    mov byte ptr [BX + offset _var_168],AL
    mov AX,word ptr [_var_165]
    mov word ptr [BX + offset _var_167],AX
    inc DX
    cmp DX,word ptr [_var_160]
    jle LAB_1000_19d8
    inc byte ptr [_var_158]
    stc
    rcl word ptr [_var_160],1h
LAB_1000_19d8:
    mov AL,byte ptr [_var_158]
    cmp AL,byte ptr [_var_159]
    jle LAB_1000_19e4
    call picMakeDict
LAB_1000_19e4:
    mov word ptr [_var_165],CX
    jmp LAB_1000_1943
    db 00h
dictionaryLookup endp

allocBuffer equ _allocBuffer

freeBuffer equ _freeBuffer

PUBLIC _dos_alloc
_dos_alloc:
dos_alloc proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AH,48h
    mov BX,word ptr [BP + Stack[2h]+2h]
    shr BX,1h
    shr BX,1h
    shr BX,1h
    shr BX,1h
    test word ptr [BP + Stack[2h]+2h],0fh
    jz LAB_1000_1a64
    inc BX
LAB_1000_1a64:
    int 21h
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
dos_alloc endp

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
    mov BX,offset _var_167
    mov AX,0ffffh
    mov CX,800h
LAB_1000_1af2:
    mov word ptr [BX],AX
    add BX,3h
    loop LAB_1000_1af2
    mov BX,offset _var_167
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
    mov BX,offset _var_167
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
    mov BX,offset _var_167
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

_setTimerIrqHandler:
setTimerIrqHandler proc near
    mov word ptr [_var_74],1h
    mov word ptr [_var_80],1h
    mov word ptr [_var_70],0h
    mov word ptr [_var_71],0h
    call sub_13DF2
    mov AH,35h
    mov AL,8h
    int 21h
    mov word ptr CS:[var_2],BX
    mov word ptr CS:[var_3],ES
    push DS
    mov AH,25h
    mov AL,8h
    lds DX,CS:dword ptr [var_1]
    int 21h
    pop DS
    mov byte ptr [_timerHandlerInstalled],1h
    ret
setTimerIrqHandler endp

PUBLIC _restoreTimerIrqHandler
_restoreTimerIrqHandler:
restoreTimerIrqHandler proc near
    mov AL,36h
    out 43h,AL
    jmp LAB_1000_1c40
LAB_1000_1c40:
    xor AL,AL
    out 40h,AL
    jmp LAB_1000_1c46
LAB_1000_1c46:
    out 40h,AL
    push DS
    mov AH,25h
    mov AL,8h
    lds DX,CS:dword ptr [var_2]
    int 21h
    pop DS
    mov byte ptr [_timerHandlerInstalled],0h
    ret
setTimerMode1 proc near
    mov BX,word ptr [_var_76]
    mov word ptr [_var_74],BX
    mov AX,word ptr [_var_77]
    xor DX,DX
    div BX
    mov word ptr [_var_72],AX
    mov byte ptr [_var_75],1h
    ret
setTimerMode1 endp
setTimerMode2 proc near
    mov word ptr [_var_74],1h
    mov AX,word ptr [_var_77]
    mov word ptr [_var_72],AX
    mov byte ptr [_var_75],1h
    ret
setTimerMode2 endp
var_1:
    dw offset _timerIrqHandler
    dw seg _timerIrqHandler
_timerIrqHandler:
    sti
    push AX
    push BX
    push CX
    push DX
    push SI
    push DI
    push BP
    push DS
    push ES
    mov AX,seg _var_70
    mov DS,AX
    mov AX,word ptr [_var_73]
    add word ptr [_var_70],AX
    adc word ptr [_var_71],0h
    dec word ptr [_var_80]
    jnz LAB_timer_skipReload
    mov AX,word ptr [_var_74]
    mov word ptr [_var_80],AX
    call _timerSubroutine
    mov byte ptr [_var_timerFlag],0h
    call _incTimerCounters
LAB_timer_skipReload:
    cmp word ptr [_var_74],1h
    jz LAB_timer_skipFarCall
    db 09Ah, 024h, 012h, 080h, 015h  ; CALL FAR (patched at runtime)
LAB_timer_skipFarCall:
    cmp word ptr [_var_71],0h
    jnz LAB_timer_chainOld
    mov AL,20h
    out 20h,AL
    pop ES
    pop DS
    pop BP
    pop DI
    pop SI
    pop DX
    pop CX
    pop BX
    pop AX
    iret
LAB_timer_chainOld:
    dec word ptr [_var_71]
    pop ES
    pop DS
    pop BP
    pop DI
    pop SI
    pop DX
    pop CX
    pop BX
    pop AX
    cli
    db 0EAh  ; JMP FAR (patched with old INT8 handler address)
var_2:
    dw 0000h
var_3:
    dw 0000h
_timerSubroutine proc near
    dec byte ptr [_var_75]
    jnz LAB_timer_sub_end
    mov byte ptr [_var_75],14h
    cmp byte ptr [_var_79],0h
    jz LAB_timer_reprogram
    xor BL,BL
    xor CX,CX
    mov ES,CX
    mov DX,word ptr ES:[463h]
    add DX,6h
    cmp DX,3BAh
    jz LAB_timer_mono
; color path
LAB_timer_color_loop:
    cli
    in AL,DX
    test AL,08h
    jnz LAB_timer_sub_end
    sti
    and AL,01h
    cmp AL,BL
    jz LAB_timer_color_loop
    xor BL,01h
    loop LAB_timer_color_loop
    jmp LAB_timer_reprogram
; monochrome path
LAB_timer_mono:
    cli
    in AL,DX
    test AL,80h
    jz LAB_timer_sub_end
    sti
    and AL,01h
    cmp AL,BL
    jz LAB_timer_mono
    xor BL,01h
    loop LAB_timer_mono
    mov byte ptr [_var_79],0h
    jmp LAB_timer_doReprogram
LAB_timer_reprogram:
    mov DX,word ptr [_var_73]
    cmp DX,word ptr [_var_72]
    jz LAB_timer_doReprogram
    mov DX,word ptr [_var_72]
    mov word ptr [_var_73],DX
LAB_timer_doReprogram:
    mov AL,36h
    out 43h,AL
    jmp short $+2
    mov AL,DL
    out 40h,AL
    jmp short $+2
    mov AL,DH
    out 40h,AL
    inc word ptr [_var_73 + 2]
    neg CX
    mov word ptr [_var_80 + 2],CX
    jz LAB_timer_sub_end
    inc word ptr [_var_80]
LAB_timer_sub_end:
    sti
    ret
_timerSubroutine endp
restoreTimerIrqHandler endp

sub_13DF2 proc near
    pushf
    cli
    mov byte ptr [_var_75],1h
    xor AX,AX
    mov byte ptr [_var_79],1h
    mov word ptr [_var_77],AX
    mov word ptr [_var_78],AX
    call manipulateTimer
    mov BX,AX
    mov CX,10h
LAB_1000_1d92:
    push BX
    call manipulateTimer
    pop BX
    sub BX,AX
    add word ptr [_var_77],BX
    adc word ptr [_var_78],0h
    mov BX,AX
    loop LAB_1000_1d92
    mov AX,word ptr [_var_77]
    mov DX,word ptr [_var_78]
    add word ptr [_var_70],AX
    adc word ptr [_var_71],DX
    mov CX,10h
    div CX
    shr AX,1h
    mov word ptr [_var_77],AX
    mov BX,AX
    shr BX,1h
    shr BX,1h
    shr BX,1h
    shr BX,1h
    add AX,BX
    xor DX,DX
    mov BX,offset dat_0f89
    div BX
    db 3Dh, 04h, 00h  ; cmp AX,04h (force word-immediate)
    jc LAB_1000_1ddf
    db 3Dh, 06h, 00h  ; cmp AX,06h (force word-immediate)
    ja LAB_1000_1ddf
    jmp LAB_1000_1ded
    db 90h
LAB_1000_1ddf:
    mov byte ptr [_var_79],0h
    mov word ptr [_var_77],4daeh
    mov AX,5h
LAB_1000_1ded:
    mov word ptr [_var_76],AX
    cmp word ptr [_var_74],1h
    jz LAB_1000_1dfa
    mov word ptr [_var_74],AX
LAB_1000_1dfa:
    mov AX,word ptr [_var_77]
    xor DX,DX
    div word ptr [_var_74]
    mov word ptr [_var_73],AX
    mov word ptr [_var_72],AX
    popf
    ret
sub_13DF2 endp

manipulateTimer proc near
    pushf
    cli
    xor AX,AX
    mov ES,AX
    mov DX,word ptr ES:[463h]
    add DX,6h
    cmp DX,3bah
    jz LAB_1000_1e36
    xor BX,BX
LAB_1000_1e21:
    dec BX
    jz LAB_1000_1e5c
    in AL,DX
    test AL,8h
    jnz LAB_1000_1e21
    xor BX,BX
LAB_1000_1e2b:
    dec BX
    jz LAB_1000_1e5c
    in AL,DX
    test AL,8h
    jz LAB_1000_1e2b
    jmp LAB_1000_1e4a
    db 90h
LAB_1000_1e36:
    xor BX,BX
LAB_1000_1e38:
    dec BX
    jz LAB_1000_1e5c
    in AL,DX
    test AL,80h
    jz LAB_1000_1e38
    xor BX,BX
LAB_1000_1e42:
    dec BX
    jz LAB_1000_1e5c
    in AL,DX
    test AL,80h
    jnz LAB_1000_1e42
LAB_1000_1e4a:
    mov AL,0h
    out 43h,AL
    jmp LAB_1000_1e50
LAB_1000_1e50:
    in AL,40h
    jmp LAB_1000_1e54
LAB_1000_1e54:
    mov BL,AL
    in AL,40h
    jmp LAB_1000_1e5a
LAB_1000_1e5a:
    mov BH,AL
LAB_1000_1e5c:
    mov AX,BX
    popf
    ret
manipulateTimer endp

PUBLIC _getTimeOfDay
_getTimeOfDay:
getTimeOfDay proc near
    xor AH,AH
    int 1Ah
    mov AX,DX
    ret
_incTimerCounters proc near
    inc byte ptr [_timerCounter + 1]
    inc byte ptr [_timerCounter2]
    inc byte ptr [_timerCounter]
    inc byte ptr [_timerCounter3]
    ret
_incTimerCounters endp
getTimeOfDay endp

routine_27 equ _showPostMissionAwards

PUBLIC _routine_24
_routine_24:
routine_24 proc near
    push BP
    mov BP,SP
    sub SP,4h
    push SI
    les BX,dword ptr [_commData]
    mov AX,word ptr ES:[BX + 74h]
    mov CL,0bh
    shr AX,CL
    mov word ptr [BP + -2h],AX
    mov AX,word ptr ES:[BX + 76h]
    shr AX,CL
    mov word ptr [BP + -4h],AX
    mov SI,AX
    mov CL,4h
    shl SI,CL
    mov BX,word ptr [BP + -2h]
    mov AL,byte ptr [BX + SI + offset _gridFlags]
    db 25h, 03h, 00h  ; and AX,3h (force word-immediate)
    mov word ptr [_missionResult],AX
    pop SI
    mov SP,BP
    pop BP
    ret
    db 90h
routine_24 endp

processMenuItems equ _processMenuItems

routine_60 proc near
    push BP
    mov BP,SP
    sub SP,2ah
    push DI
    push SI
    mov byte ptr [BP + -2h],0dh
    mov byte ptr [BP + -1h],0h
    mov byte ptr [BP + -0ch],89h
    mov byte ptr [BP + -0bh],0h
    mov byte ptr [BP + -8h],8dh
    mov byte ptr [BP + -7h],0h
    mov byte ptr [BP + -12h],80h
    mov byte ptr [BP + -11h],0h
    call far ptr gfx_jump_50
    mov word ptr [_colorAnimEnabled],0h
    mov word ptr [BP + -14h],0h
LAB_1000_2282:
    mov AX,32h
    imul word ptr [BP + -14h]
    add AX,word ptr [BP + 4h]
    push AX
    call isPointInRect
    add SP,2h
    or AX,AX
    jnz LAB_1000_22a3
    mov AX,word ptr [BP + 8h]
    cmp word ptr [BP + -14h],AX
    jge LAB_1000_22a3
    inc word ptr [BP + -14h]
    jmp LAB_1000_2282
LAB_1000_22a3:
    mov byte ptr [_joyRepeatFlag],0h
LAB_1000_22a8:
    call far ptr gfx_jump_50
    mov AX,32h
    imul word ptr [BP + -14h]
    mov SI,AX
    mov BX,word ptr [BP + 4h]
    test word ptr [BX + SI + 30h],100h
    jnz LAB_1000_22c5
    mov word ptr [_colorAnimEnabled],1h
LAB_1000_22c5:
    push word ptr [BP + 0ch]
    mov AX,32h
    imul word ptr [BP + -14h]
    add AX,BX
    push AX
    push word ptr [BP + 0ah]
    call processDebriefInput
    add SP,6h
    cmp byte ptr [_inputChanged],0h
    jnz LAB_1000_22e8
    cmp byte ptr [_enterPressed],0h
    jz LAB_1000_22a8
LAB_1000_22e8:
    cmp byte ptr [_enterPressed],0h
    jnz LAB_1000_22f2
    jmp LAB_1000_23c2
LAB_1000_22f2:
    mov AX,word ptr [_selectedMenuItem]
    cmp word ptr [BP + -14h],AX
    jz LAB_1000_2320
    mov word ptr [BP + -14h],0h
LAB_1000_22ff:
    mov AX,32h
    imul word ptr [BP + -14h]
    add AX,word ptr [BP + 4h]
    push AX
    call isPointInRect
    add SP,2h
    or AX,AX
    jnz LAB_1000_2320
    mov AX,word ptr [BP + 8h]
    cmp word ptr [BP + -14h],AX
    jge LAB_1000_2320
    inc word ptr [BP + -14h]
    jmp LAB_1000_22ff
LAB_1000_2320:
    mov AX,32h
    imul word ptr [_selectedMenuItem]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    cmp word ptr [SI + 10h],0h
    jz LAB_1000_2335
    jmp LAB_1000_23bc
LAB_1000_2335:
    mov word ptr [BP + -6h],0bh
    mov word ptr [BP + -4h],9h
    mov AX,9h
    push AX
    mov AX,0bh
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
    mov word ptr [BP + -6h],3h
    mov AX,32h
    imul word ptr [_selectedMenuItem]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    push word ptr [BP + -4h]
    mov AX,3h
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
    mov word ptr [BP + -6h],0dh
    mov AX,32h
    imul word ptr [_selectedMenuItem]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    push word ptr [BP + -4h]
    mov AX,0dh
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
LAB_1000_23bc:
    jmp LAB_1000_2578
    db 0E9h
    db 0B3h
    db 01h
LAB_1000_23c2:
    mov word ptr [BP + -14h],0h
LAB_1000_23c7:
    mov AX,32h
    imul word ptr [BP + -14h]
    add AX,word ptr [BP + 4h]
    push AX
    call isPointInRect
    add SP,2h
    or AX,AX
    jnz LAB_1000_23e8
    mov AX,word ptr [BP + 8h]
    cmp word ptr [BP + -14h],AX
    jge LAB_1000_23e8
    inc word ptr [BP + -14h]
    jmp LAB_1000_23c7
LAB_1000_23e8:
    mov AX,word ptr [_selectedMenuItem]
    cmp word ptr [BP + -14h],AX
    jnz LAB_1000_23f3
    jmp LAB_1000_2575
LAB_1000_23f3:
    mov AX,32h
    imul word ptr [BP + -14h]
    mov SI,AX
    mov BX,word ptr [BP + 4h]
    test byte ptr [BX + SI + 30h],8h
    jnz LAB_1000_2407
    jmp LAB_1000_2562
LAB_1000_2407:
    mov word ptr [BP + -0eh],0h
    jmp LAB_1000_2411
LAB_1000_240e:
    inc word ptr [BP + -0eh]
LAB_1000_2411:
    mov AX,word ptr [BP + 8h]
    cmp word ptr [BP + -0eh],AX
    jge LAB_1000_2449
    mov AX,32h
    imul word ptr [BP + -0eh]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    cmp word ptr [SI + 2eh],0h
    jz LAB_1000_2447
    mov AX,32h
    imul word ptr [BP + -14h]
    mov DI,AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [SI + 2ch]
    cmp word ptr [BX + DI + 2ch],AX
    jnz LAB_1000_2447
    push word ptr [BP + 0ch]
    push SI
    call blinkWidget
    add SP,4h
LAB_1000_2447:
    jmp LAB_1000_240e
LAB_1000_2449:
    mov AX,32h
    imul word ptr [_selectedMenuItem]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    cmp word ptr [SI + 10h],0h
    jz LAB_1000_245e
    jmp LAB_1000_2514
LAB_1000_245e:
    mov word ptr [BP + -6h],9h
    mov word ptr [BP + -4h],6h
    mov AX,6h
    push AX
    mov AX,9h
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
    mov word ptr [BP + -6h],3h
    mov AX,32h
    imul word ptr [_selectedMenuItem]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    push word ptr [BP + -4h]
    mov AX,3h
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
    mov word ptr [BP + -6h],0dh
    mov AX,32h
    imul word ptr [_selectedMenuItem]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    push word ptr [BP + -4h]
    mov AX,0dh
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
    mov word ptr [BP + -6h],0bh
    mov AX,32h
    imul word ptr [_selectedMenuItem]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    push word ptr [BP + -4h]
    mov AX,0bh
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
LAB_1000_2514:
    mov AX,32h
    imul word ptr [_selectedMenuItem]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    cmp word ptr [SI + 10h],1h
    jnz LAB_1000_254f
    mov word ptr [BP + -6h],8h
    mov word ptr [BP + -4h],7h
    mov AX,7h
    push AX
    mov AX,8h
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
LAB_1000_254f:
    push word ptr [BP + 0ch]
    mov AX,32h
    imul word ptr [BP + -14h]
    add AX,word ptr [BP + 4h]
    push AX
    call blinkWidget
    add SP,4h
LAB_1000_2562:
    mov AX,word ptr [BP + -14h]
    mov word ptr [_selectedMenuItem],AX
    push word ptr [BP + 0ch]
    push AX
    push word ptr [BP + 4h]
    call drawMenuItem
    add SP,6h
LAB_1000_2575:
    jmp LAB_1000_22a8
LAB_1000_2578:
    mov AX,word ptr [BP + -14h]
    jmp LAB_1000_257d
LAB_1000_257d:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
routine_60 endp

blinkWidget equ _blinkWidget

isPointInRect equ _isPointInRect

processDebriefInput equ _processDebriefInput

PUBLIC _drawMenuItem
_drawMenuItem:
drawMenuItem proc near
    push BP
    mov BP,SP
    sub SP,22h
    push DI
    push SI
    mov byte ptr [BP + -2h],0ah
    mov byte ptr [BP + -1h],0h
    mov byte ptr [BP + -6h],89h
    mov byte ptr [BP + -5h],0h
    mov byte ptr [BP + -4h],8dh
    mov byte ptr [BP + -3h],0h
    mov byte ptr [BP + -0ah],80h
    mov byte ptr [BP + -9h],0h
    mov AX,32h
    mul word ptr [BP + 6h]
    mov DI,AX
    mov BX,word ptr [BP + 4h]
    mov SI,word ptr [BX + DI + 30h]
    test SI,800h
    jnz LAB_1000_2c10
    jmp LAB_1000_35db
LAB_1000_2c10:
    mov AX,SI
    db 25h, 07h, 00h  ; and AX,7h (force word-immediate)
    db 3Dh, 07h, 00h  ; cmp AX,7h (force word-immediate)
    jz LAB_1000_2c1d
    jmp LAB_1000_2fbf
LAB_1000_2c1d:
    mov AX,95h
    push AX
    mov AX,13fh
    push AX
    mov AX,0ah
    push AX
    mov AX,0ebh
    push AX
    push word ptr [BP + 8h]
    call clearRect
    add SP,0ah
    mov BX,word ptr [BP + 8h]
    mov word ptr [BX + 4h],0h
    lea AX,[BP + -6h]
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_pressExit
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,8h
    push AX
    mov AX,82h
    push AX
    mov AX,0f0h
    push AX
    mov AX,50h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawWrappedText
    add SP,0ch
    mov AX,7eh
    push AX
    mov AX,12ch
    push AX
    mov AX,64h
    push AX
    mov AX,0f0h
    push AX
    push word ptr [BP + 8h]
    call clearRect
    add SP,0ah
    cmp byte ptr [_popupVisible],1h
    jnz LAB_1000_2cc2
    mov AX,28h
    push AX
    mov AX,30h
    push AX
    push word ptr [_popupY]
    push word ptr [_popupX]
    sub AX,AX
    push AX
    mov AX,96h
    push AX
    sub AX,AX
    push AX
    mov AX,1h
    push AX
    call far ptr gfx_jump_2a
    add SP,10h
    mov byte ptr [_popupVisible],0h
LAB_1000_2cc2:
    mov word ptr [_curRecordIdx],0h
    mov AX,offset dat_270f
    push AX
    push word ptr [BP + 8h]
    call drawFlightPath
    add SP,4h
    mov word ptr [_var_192],AX
    push AX
    call calcMissionScore
    add SP,2h
    mov word ptr [_missionScore],AX
    mov word ptr [_missionScoreHi],DX
    mov AX,offset str_dot1
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_overall1
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,46h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringCentered
    add SP,0ah
    mov AX,offset str_missionRating1
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,57h
    push AX
    mov AX,4eh
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringCentered
    add SP,0ah
    mov AX,offset str_dot2
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    lea AX,[BP + -1eh]
    push AX
    push word ptr [_missionScoreHi]
    push word ptr [_missionScore]
    call my_ltoa
    add SP,6h
    lea AX,[BP + -1eh]
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,56h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringCentered
    add SP,0ah
    les BX,dword ptr [_commData]
    cmp word ptr ES:[BX + 30h],0h
    jz LAB_1000_2dc9
    mov AX,57h
    push AX
    mov AX,60h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset str_trainingScore
    push AX
    push word ptr [BP + 8h]
    call drawStringCentered
    add SP,0ah
    mov AX,57h
    push AX
    mov AX,68h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset str_notRecorded
    push AX
    push word ptr [BP + 8h]
    call drawStringCentered
    add SP,0ah
    jmp LAB_1000_2e53
LAB_1000_2dc9:
    mov AX,offset str_dot3
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_careerTotal
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,6ch
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringCentered
    add SP,0ah
    mov AX,offset str_dot4
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    lea AX,[BP + -1eh]
    push AX
    les BX,dword ptr [_gameData]
    mov AX,word ptr ES:[BX + 32h]
    mov DX,word ptr ES:[BX + 34h]
    add AX,word ptr [_missionScore]
    adc DX,word ptr [_missionScoreHi]
    push DX
    push AX
    call my_ltoa
    add SP,6h
    lea AX,[BP + -1eh]
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,74h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringCentered
    add SP,0ah
LAB_1000_2e53:
    mov BX,word ptr [BP + 8h]
    mov word ptr [BX + 4h],0dh
    mov AX,offset str_missionSummary
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,57h
    push AX
    mov AX,14h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringCentered
    add SP,0ah
    mov BX,word ptr [BP + 8h]
    mov word ptr [BX + 4h],0h
    mov AX,offset str_priSecTargets
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,1eh
    push AX
    mov AX,0f0h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringAt
    add SP,8h
    mov AX,offset scoreString
    push AX
    mov AX,word ptr [_primaryHit]
    add AX,word ptr [_secondaryHit]
    push AX
    call my_itoa
    add SP,4h
    mov AX,1eh
    push AX
    mov AX,131h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringAt
    add SP,8h
    mov AX,offset str_otherTargets
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,26h
    push AX
    mov AX,0f0h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringAt
    add SP,8h
    mov AX,offset scoreString
    push AX
    mov AX,word ptr [_groundKilled]
    add AX,word ptr [_airKilled]
    sub AX,word ptr [_primaryHit]
    sub AX,word ptr [_secondaryHit]
    push AX
    call my_itoa
    add SP,4h
    mov AX,26h
    push AX
    mov AX,131h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringAt
    add SP,8h
    mov AX,offset str_enemyPlanes
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,2eh
    push AX
    mov AX,0f0h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringAt
    add SP,8h
    mov AX,offset scoreString
    push AX
    push word ptr [_samKilled]
    call my_itoa
    add SP,4h
    mov AX,2eh
    push AX
    mov AX,131h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringAt
    add SP,8h
    mov AX,offset str_friendlyTargets
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,36h
    push AX
    mov AX,0f0h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringAt
    add SP,8h
    mov AX,offset scoreString
    push AX
    mov AX,word ptr [_groundMissed]
    add AX,word ptr [_airMissed]
    add AX,word ptr [_samMissed]
    push AX
    call my_itoa
    add SP,4h
    mov AX,36h
    push AX
    mov AX,131h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringAt
    add SP,8h
    mov byte ptr [_ejectedFlag],1h
LAB_1000_2fbf:
    mov AX,32h
    mul word ptr [BP + 6h]
    mov SI,AX
    mov BX,word ptr [BP + 4h]
    test word ptr [BX + SI + 30h],1000h
    jnz LAB_1000_2fd4
    jmp LAB_1000_35db
LAB_1000_2fd4:
    cmp byte ptr [_ejectedFlag],1h
    jz LAB_1000_2fde
    jmp LAB_1000_30cc
LAB_1000_2fde:
    mov byte ptr [_ejectedFlag],0h
    mov byte ptr [_popupVisible],0h
    push word ptr [_var_102]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    sub AX,AX
    mov word ptr [_prevDrawY],AX
    mov word ptr [_prevDrawX],AX
    mov word ptr [_curRecordIdx],AX
    mov AX,95h
    push AX
    mov AX,13fh
    push AX
    mov AX,0ah
    push AX
    mov AX,0ebh
    push AX
    push word ptr [BP + 8h]
    call clearRect
    add SP,0ah
    mov AX,100h
    push AX
    call calcMissionScore
    add SP,2h
    mov word ptr [_missionScore],AX
    mov word ptr [_missionScoreHi],DX
    mov AX,offset str_dot5
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_overall2
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,64h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringCentered
    add SP,0ah
    mov AX,offset str_missionRating2
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,57h
    push AX
    mov AX,6ch
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringCentered
    add SP,0ah
    mov AX,offset str_dot6
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    lea AX,[BP + -1eh]
    push AX
    push word ptr [_missionScoreHi]
    push word ptr [_missionScore]
    call my_ltoa
    add SP,6h
    lea AX,[BP + -1eh]
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,74h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringCentered
    add SP,0ah
LAB_1000_30cc:
    mov AX,63h
    push AX
    mov AX,13fh
    push AX
    mov AX,0ah
    push AX
    mov AX,0ebh
    push AX
    push word ptr [BP + 8h]
    call clearRect
    add SP,0ah
    mov BX,word ptr [BP + 8h]
    mov word ptr [BX + 4h],0dh
    mov AX,offset str_missionEvent
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,57h
    push AX
    mov AX,14h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringCentered
    add SP,0ah
    mov AX,offset str_time
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    lea AX,[BP + -1eh]
    push AX
    mov BX,word ptr [_curRecordIdx]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    push word ptr [BX + offset _var_193]
    call formatFlightTime
    add SP,4h
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,1eh
    push AX
    mov AX,0f0h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringAt
    add SP,8h
    mov AX,word ptr [_curRecordIdx]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AL,byte ptr [SI + offset _var_197]
    db 25h, 7Fh, 00h  ; and AX,7Fh (force word-immediate)
    mov word ptr [BP + -20h],AX
    mov AL,byte ptr [SI + offset _var_196]
    db 25h, 3Fh, 00h  ; and AX,3Fh (force word-immediate)
    jmp LAB_1000_3432
caseD_c_343d:
caseD_1_6128:
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    mov SI,word ptr [BX + offset dat_424e]
    or SI,SI
    jz LAB_1000_31da
    mov BX,SI
    shl BX,1h
    push word ptr [BX + offset _worldStrings]
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_destroyed4
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _var_425c]
    and BX,7fh
    shl BX,1h
    push word ptr [BX + offset _worldStrings]
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,offset str_destroyed1
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    jmp LAB_1000_3206
LAB_1000_31da:
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _var_425c]
    and BX,7fh
    shl BX,1h
    push word ptr [BX + offset _worldStrings]
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_destroyed2
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
LAB_1000_3206:
    jmp caseD_4_343d
caseD_3_343d:
    mov AX,word ptr [BP + -20h]
    mov CL,5h
    shl AX,CL
    add AX,198h
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_shotDown2
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,word ptr [BP + -20h]
    mov CL,5h
    shl AX,CL
    add AX,19fh
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,offset str_shotDown
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    jmp caseD_4_343d
caseD_2_343d:
    mov BX,word ptr [BP + -20h]
    shl BX,1h
    push word ptr [BX + offset _worldStrings]
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_destroyed3
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    jmp caseD_4_343d
caseD_a_343d:
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    mov SI,word ptr [BX + offset dat_424e]
    or SI,SI
    jz LAB_1000_32d3
    mov BX,SI
    shl BX,1h
    push word ptr [BX + offset _worldStrings]
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_rearmed3
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _var_425c]
    and BX,7fh
    shl BX,1h
    push word ptr [BX + offset _worldStrings]
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,offset str_rearmed1
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    jmp LAB_1000_32ff
LAB_1000_32d3:
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _var_425c]
    and BX,7fh
    shl BX,1h
    push word ptr [BX + offset _worldStrings]
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_rearmed2
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
LAB_1000_32ff:
    jmp caseD_4_343d
caseD_5_343d:
    mov AX,offset str_hitBy
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,12h
    mul word ptr [BP + -20h]
    add AX,3f8h
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,offset str_missile
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    jmp caseD_4_343d
caseD_8_343d:
    cmp word ptr [_curRecordIdx],0h
    jnz LAB_1000_338f
    mov AX,offset str_takeoffPoint
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov BX,word ptr [dat_4804]
    mov CL,4h
    shl BX,CL
    mov SI,word ptr [BX + offset dat_424e]
    or SI,SI
    jz LAB_1000_336e
    mov BX,SI
    shl BX,1h
    push word ptr [BX + offset _worldStrings]
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    jmp LAB_1000_338c
LAB_1000_336e:
    mov BX,word ptr [dat_4804]
    mov CL,4h
    shl BX,CL
    mov BL,byte ptr [BX + offset _var_425c]
    sub BH,BH
    shl BX,1h
    push word ptr [BX + offset _worldStrings]
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
LAB_1000_338c:
    jmp LAB_1000_342e
LAB_1000_338f:
    mov AX,offset str_missionEnd
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    les BX,dword ptr [_commData]
    mov AX,word ptr ES:[BX + 26h]
    jmp LAB_1000_341d
LAB_1000_33a7:
    mov AX,offset str_crashed
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    jmp LAB_1000_342e
LAB_1000_33b7:
    les BX,dword ptr [_commData]
    cmp word ptr ES:[BX + 28h],0h
    jnz LAB_1000_33d9
    cmp word ptr [_missionResult],0h
    jz LAB_1000_33d9
    mov AX,offset str_goodBailout
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    jmp LAB_1000_3409
LAB_1000_33d9:
    les BX,dword ptr [_commData]
    cmp word ptr ES:[BX + 28h],0h
    jnz LAB_1000_33fb
    cmp word ptr [_missionResult],0h
    jnz LAB_1000_33fb
    mov AX,offset str_captured
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    jmp LAB_1000_3409
LAB_1000_33fb:
    mov AX,offset str_bailedDied
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
LAB_1000_3409:
    jmp LAB_1000_342e
LAB_1000_340b:
    mov AX,offset str_goodLanding
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    jmp LAB_1000_342e
    db 0EBh
    db 11h
LAB_1000_341d:
    db 3Dh, 01h, 00h  ; cmp AX,1h (force word-immediate)
    jz LAB_1000_33a7
    db 3Dh, 02h, 00h  ; cmp AX,2h (force word-immediate)
    jz LAB_1000_33b7
    db 3Dh, 03h, 00h  ; cmp AX,3h (force word-immediate)
    jz LAB_1000_340b
    jmp LAB_1000_342e
LAB_1000_342e:
    jmp caseD_4_343d
    db 0EBh
    db 28h
LAB_1000_3432:
    db 2Dh, 01h, 00h  ; sub AX,1h (force word-immediate)
    db 3Dh, 0Bh, 00h  ; cmp AX,0Bh (force word-immediate)
    ja caseD_4_343d
    add AX,AX
    xchg AX,BX
switchD_317d:
    jmp word ptr CS:[BX + offset var_5]
var_5:
    dw offset caseD_c_343d
    dw offset caseD_2_343d
    dw offset caseD_3_343d
    dw offset caseD_4_343d
    dw offset caseD_5_343d
    dw offset caseD_4_343d
    dw offset caseD_4_343d
    dw offset caseD_8_343d
    dw offset caseD_4_343d
    dw offset caseD_a_343d
    dw offset caseD_4_343d
    dw offset caseD_c_343d
caseD_6_3206:
caseD_7_3332:
caseD_9_6448:
caseD_b_6449:
caseD_4_343d:
caseD_4_6450:
    mov AX,8h
    push AX
    mov AX,26h
    push AX
    mov AX,0f0h
    push AX
    mov AX,50h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawWrappedText
    add SP,0ch
    mov BX,word ptr [_curRecordIdx]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + offset _var_196],80h
    jz LAB_1000_34b1
    mov AX,offset str_primaryObj
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,57h
    push AX
    mov BX,word ptr [BP + 8h]
    push word ptr [BX + 0ah]
    mov AX,0e8h
    push AX
    mov AX,offset scoreString
    push AX
    push BX
    call drawStringCentered
    add SP,0ah
LAB_1000_34b1:
    mov BX,word ptr [_curRecordIdx]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + offset _var_196],40h
    jz LAB_1000_34eb
    mov AX,offset str_secndryObj
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,57h
    push AX
    mov BX,word ptr [BP + 8h]
    push word ptr [BX + 0ah]
    mov AX,0e8h
    push AX
    mov AX,offset scoreString
    push AX
    push BX
    call drawStringCentered
    add SP,0ah
LAB_1000_34eb:
    push word ptr [_curRecordIdx]
    call calcMissionScore
    add SP,2h
    mov word ptr [_missionScore],AX
    mov word ptr [_missionScoreHi],DX
    mov AX,offset str_cumulative2
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_cumulative
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,46h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringCentered
    add SP,0ah
    mov AX,offset str_missionRating3
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,57h
    push AX
    mov AX,4eh
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringCentered
    add SP,0ah
    mov AX,offset str_pressSelect
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    lea AX,[BP + -1eh]
    push AX
    push word ptr [_missionScoreHi]
    push word ptr [_missionScore]
    call my_ltoa
    add SP,6h
    lea AX,[BP + -1eh]
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,56h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawStringCentered
    add SP,0ah
    call showEventPopup
    lea AX,[BP + -6h]
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_pressNext
    push AX
    mov AX,offset scoreString
    push AX
    call mystrcat
    add SP,4h
    mov AX,8h
    push AX
    mov AX,82h
    push AX
    mov AX,0f0h
    push AX
    mov AX,50h
    push AX
    mov AX,offset scoreString
    push AX
    push word ptr [BP + 8h]
    call drawWrappedText
    add SP,0ch
LAB_1000_35db:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
drawMenuItem endp

drawEventSprite equ _drawEventSprite

animateFlightPath equ _animateFlightPath

drawFlightPath equ _drawFlightPath

formatFlightTime equ _formatFlightTime

mapToScreenX equ _mapToScreenX

mapToScreenY equ _mapToScreenY

plotMapPoint equ _plotMapPoint

drawFlightLine equ _drawFlightLine

drawClippedLine equ _drawClippedLine

PUBLIC _drawClippedLineEx
_drawClippedLineEx:
drawClippedLineEx proc near
    push BP
    mov BP,SP
    sub SP,4h
    mov AX,word ptr [BP + 0eh]
    sub AX,word ptr [BP + 0ch]
    mov word ptr [BP + -4h],AX
    mov AX,word ptr [BP + 12h]
    sub AX,word ptr [BP + 10h]
    mov word ptr [BP + -2h],AX
    push word ptr [BP + 10h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_3e
    add SP,4h
    push AX
    call far ptr gfx_jump_1a
    add SP,2h
    mov AX,word ptr [BP + -4h]
    dec AX
    mov word ptr [_var_46],AX
    mov AX,word ptr [BP + -2h]
    dec AX
    mov word ptr [_var_47],AX
    push AX
    call far ptr gfx_jump_40
    add SP,2h
    push word ptr [_var_46]
    call far ptr gfx_jump_41
    add SP,2h
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_31],AX
    mov AX,word ptr [BP + 6h]
    mov word ptr [_var_33],AX
    mov AX,word ptr [BP + 8h]
    mov word ptr [_var_32],AX
    mov AX,word ptr [BP + 0ah]
    mov word ptr [_var_34],AX
    call routine_154
    call far ptr gfx_jump_23
    mov word ptr [_var_46],13fh
    mov word ptr [_var_47],0c7h
    mov AX,0c7h
    push AX
    call far ptr gfx_jump_40
    add SP,2h
    push word ptr [_var_46]
    call far ptr gfx_jump_41
    add SP,2h
    sub AX,AX
    push AX
    call far ptr gfx_jump_1a
    add SP,2h
    mov SP,BP
    pop BP
    ret
drawClippedLineEx endp

drawMapPixel equ _drawMapPixel

calcMissionScore equ _calcMissionScore

showEventPopup equ _showEventPopup

PUBLIC _routine_25
_routine_25:
routine_25 proc near
    push BP
    mov BP,SP
    sub SP,14h
    mov byte ptr [BP + -2h],0dh
    mov byte ptr [BP + -1h],0h
    mov byte ptr [BP + -0ch],9h
    mov byte ptr [BP + -0bh],0ah
    mov byte ptr [BP + -0ah],0h
    mov byte ptr [BP + -14h],8eh
    mov byte ptr [BP + -13h],0h
    mov byte ptr [BP + -10h],8fh
    mov byte ptr [BP + -0fh],0h
    jmp LAB_1000_45c4
LAB_1000_4560:
    mov AX,0c7h
    push AX
    mov AX,13fh
    push AX
    sub AX,AX
    push AX
    push AX
    push word ptr [_var_99]
    call clearRect
    add SP,0ah
    mov AX,13fh
    push AX
    mov AX,5ah
    push AX
    sub AX,AX
    push AX
    mov AX,offset str_insertScenario
    push AX
    push word ptr [_var_99]
    call drawStringCentered
    add SP,0ah
    mov BX,word ptr [_var_99]
    mov word ptr [BX + 0ch],4h
    mov AX,13fh
    push AX
    mov AX,64h
    push AX
    sub AX,AX
    push AX
    mov AX,offset str_pressKey1
    push AX
    push word ptr [_var_99]
    call drawStringCentered
    add SP,0ah
    mov BX,word ptr [_var_99]
    mov word ptr [BX + 0ch],1h
    call far ptr gfx_jump_46_retrace2
    call far ptr misc_jump_5b_getkey
LAB_1000_45c4:
    mov AX,offset str_modeRb1
    push AX
    les BX,dword ptr [_gameData]
    mov BX,word ptr ES:[BX + 38h]
    shl BX,1h
    push word ptr [BX + offset _var_117]
    call routine_46
    add SP,4h
    mov word ptr [_worldBufHandle],AX
    or AX,AX
    jnz LAB_1000_45e6
    jmp LAB_1000_4560
LAB_1000_45e6:
    call far ptr gfx_jump_45_retrace
    push word ptr [_worldBufHandle]
    call _fclose
    add SP,2h
    mov AX,9h
    push AX
    call far ptr gfx_jump_3d_null
    add SP,2h
    call far ptr gfx_jump_17_bufSize
    push AX
    call allocBuffer
    add SP,2h
    mov word ptr [_spriteBufSeg],AX
    push AX
    les BX,dword ptr [_gameData]
    mov BX,word ptr ES:[BX + 38h]
    shl BX,1h
    push word ptr [BX + offset _var_117]
    call loadPic
    add SP,4h
    mov AX,word ptr [_spriteBufSeg]
    mov word ptr [BP + -4h],AX
    jmp LAB_1000_4692
    db 90h
LAB_1000_462e:
    mov AX,0c7h
    push AX
    mov AX,13fh
    push AX
    sub AX,AX
    push AX
    push AX
    push word ptr [_var_99]
    call clearRect
    add SP,0ah
    mov AX,13fh
    push AX
    mov AX,5ah
    push AX
    sub AX,AX
    push AX
    mov AX,offset str_insertDiskA
    push AX
    push word ptr [_var_99]
    call drawStringCentered
    add SP,0ah
    mov BX,word ptr [_var_99]
    mov word ptr [BX + 0ch],4h
    mov AX,13fh
    push AX
    mov AX,64h
    push AX
    sub AX,AX
    push AX
    mov AX,offset str_pressKey2
    push AX
    push word ptr [_var_99]
    call drawStringCentered
    add SP,0ah
    mov BX,word ptr [_var_99]
    mov word ptr [BX + 0ch],1h
    call far ptr gfx_jump_46_retrace2
    call far ptr misc_jump_5b_getkey
LAB_1000_4692:
    mov AX,offset str_modeRb2
    push AX
    mov AX,offset str_dbicons1
    push AX
    call routine_46
    add SP,4h
    mov word ptr [_worldBufHandle],AX
    or AX,AX
    jz LAB_1000_462e
    call far ptr gfx_jump_45_retrace
    push word ptr [_worldBufHandle]
    call _fclose
    add SP,2h
    mov AX,8h
    push AX
    call far ptr gfx_jump_3d_null
    add SP,2h
    mov AX,1h
    push AX
    mov AX,offset str_dbicons2
    push AX
    call openShowPic
    add SP,4h
    mov AX,word ptr [BP + -4h]
    mov word ptr [_var_101],AX
    mov word ptr [_var_103],AX
    mov word ptr [_var_105],AX
    mov word ptr [_var_106],AX
    mov word ptr [_var_107],AX
    mov word ptr [_var_108],AX
    mov word ptr [_var_109],AX
    mov word ptr [_var_110],AX
    mov word ptr [_var_111],AX
    mov word ptr [_var_112],AX
    mov word ptr [_var_113],AX
    mov word ptr [_var_114],AX
    call far ptr gfx_jump_45_retrace
    mov AX,0c7h
    push AX
    mov AX,13fh
    push AX
    sub AX,AX
    push AX
    push AX
    push word ptr [_var_99]
    call clearRect
    add SP,0ah
    push word ptr [_var_102]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    push word ptr [_var_104]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    mov BX,word ptr [_var_99]
    mov word ptr [BX + 4h],0h
    mov AX,1h
    push AX
    mov AX,6ah
    push AX
    mov AX,offset str_missionDebrief
    push AX
    push word ptr [_var_99]
    call drawStringAt
    add SP,8h
    mov BX,word ptr [_var_99]
    mov word ptr [BX + 4h],6h
    mov word ptr [BP + -0eh],96h
    mov word ptr [BP + -8h],0h
LAB_1000_475c:
    push word ptr [BP + -0eh]
    mov AX,0ech
    push AX
    mov BX,word ptr [BP + -8h]
    shl BX,1h
    push word ptr [BX + offset _var_118]
    push word ptr [_var_99]
    call drawStringAt
    add SP,8h
    add word ptr [BP + -0eh],0ah
    inc word ptr [BP + -8h]
    cmp word ptr [BP + -8h],2h
    jl LAB_1000_475c
    mov word ptr [BP + -12h],0h
    mov byte ptr [_ejectedFlag],1h
    mov word ptr [_curRecordIdx],0h
    call far ptr gfx_jump_50
    call far ptr gfx_jump_46_retrace2
    call setTimerIrqHandler
    mov word ptr [BP + -6h],1h
LAB_1000_47a5:
    mov AX,32h
    imul word ptr [BP + -12h]
    mov BX,AX
    mov word ptr [BX + offset _var_115],2h
    push word ptr [_var_100]
    mov AX,word ptr [BP + -12h]
    mov CX,AX
    shl AX,1h
    shl AX,1h
    add AX,CX
    shl AX,1h
    add AX,97h
    push AX
    mov AX,0fah
    push AX
    mov AX,2h
    push AX
    push word ptr [_var_205]
    mov AX,offset dat_21e4
    push AX
    call processMenuItems
    add SP,0ch
    push word ptr [_var_100]
    push word ptr [_var_116]
    mov AX,2h
    push AX
    push word ptr [_var_205]
    mov AX,offset dat_21e4
    push AX
    call routine_60
    add SP,0ah
    mov word ptr [BP + -12h],AX
    or AX,AX
    jz LAB_1000_4806
    db 3Dh, 01h, 00h  ; cmp AX,1h (force word-immediate)
    jz LAB_1000_4838
    jmp LAB_1000_481c
LAB_1000_4806:
    push word ptr [_var_100]
    call animateFlightPath
    add SP,2h
    cmp byte ptr [_var_180],1h
    jnz LAB_1000_481c
    mov word ptr [BP + -12h],1h
LAB_1000_481c:
    les BX,dword ptr [_commData]
    cmp word ptr ES:[BX + 72h],1h
    jnz LAB_1000_485b
LAB_1000_4827:
    sub AX,AX
    push AX
    call far ptr misc_jump_5d_readJoy
    add SP,2h
    or AX,AX
    jz LAB_1000_4840
    jmp LAB_1000_4827
LAB_1000_4838:
    mov word ptr [BP + -6h],0h
    jmp LAB_1000_481c
    db 90h
LAB_1000_4840:
    mov byte ptr [_timerCounter],0h
LAB_1000_4845:
    cmp byte ptr [_timerCounter],5h
    jbe LAB_1000_4845
LAB_1000_484c:
    sub AX,AX
    push AX
    call far ptr misc_jump_5d_readJoy
    add SP,2h
    or AX,AX
    jnz LAB_1000_484c
LAB_1000_485b:
    cmp word ptr [BP + -6h],0h
    jz LAB_1000_4864
    jmp LAB_1000_47a5
LAB_1000_4864:
    call restoreTimerIrqHandler
    call far ptr gfx_jump_45_retrace
    push word ptr [_var_192]
    call calcMissionScore
    add SP,2h
    mov word ptr [_missionScore],AX
    mov word ptr [_missionScoreHi],DX
    les BX,dword ptr [_gameData]
    mov word ptr ES:[BX + 44h],0h
    les BX,dword ptr [_commData]
    cmp word ptr ES:[BX + 30h],0h
    jnz LAB_1000_490f
    les BX,dword ptr [_gameData]
    mov AX,word ptr [_missionScore]
    mov word ptr ES:[BX + 44h],AX
    les BX,dword ptr [_gameData]
    mov AX,word ptr ES:[BX + 2eh]
    sub DX,DX
    cmp DX,word ptr [_missionScoreHi]
    ja LAB_1000_48bc
    jc LAB_1000_48b5
    cmp AX,word ptr [_missionScore]
    jnc LAB_1000_48bc
LAB_1000_48b5:
    mov AX,word ptr [_missionScore]
    mov word ptr ES:[BX + 2eh],AX
LAB_1000_48bc:
    les BX,dword ptr [_gameData]
    mov AX,word ptr [_missionScore]
    mov DX,word ptr [_missionScoreHi]
    add word ptr ES:[BX + 32h],AX
    adc word ptr ES:[BX + 34h],DX
    les BX,dword ptr [_commData]
    cmp word ptr ES:[BX + 26h],1h
    jnz LAB_1000_48e4
    les BX,dword ptr [_gameData]
    mov word ptr ES:[BX + 4eh],2h
LAB_1000_48e4:
    les BX,dword ptr [_commData]
    cmp word ptr ES:[BX + 26h],2h
    jnz LAB_1000_490f
    cmp word ptr ES:[BX + 28h],0h
    jnz LAB_1000_490f
    les BX,dword ptr [_gameData]
    inc word ptr ES:[BX + 30h]
    cmp word ptr ES:[BX + 30h],3h
    jc LAB_1000_490f
    les BX,dword ptr [_gameData]
    mov word ptr ES:[BX + 4eh],1h
LAB_1000_490f:
    push word ptr [_spriteBufSeg]
    call freeBuffer
    mov SP,BP
    pop BP
    ret
    db 90h
    db 90h
routine_25 endp

PUBLIC _dosExit
_dosExit:
dosExit proc near
    push BP
    mov BP,SP
    push word ptr [BP+4h]
    call _exit
dosExit endp

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
    jmp FUN_1000_4f33
fileSeek endp

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

srandInit equ _srandInit

FUN_1000_4cca proc near
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
FUN_1000_4cca endp
__aNldiv proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push BX
    xor DI,DI
    mov AX,word ptr [BP + 6h]
    or AX,AX
    jge LAB_1000_4d10
    inc DI
    mov DX,word ptr [BP + 4h]
    neg AX
    neg DX
    db 1Dh, 00h, 00h  ; sbb AX,0h (force word-immediate)
    mov word ptr [BP + 6h],AX
    mov word ptr [BP + 4h],DX
LAB_1000_4d10:
    mov AX,word ptr [BP + 0ah]
    or AX,AX
    jge LAB_1000_4d28
    inc DI
    mov DX,word ptr [BP + 8h]
    neg AX
    neg DX
    db 1Dh, 00h, 00h  ; sbb AX,0h (force word-immediate)
    mov word ptr [BP + 0ah],AX
    mov word ptr [BP + 8h],DX
LAB_1000_4d28:
    or AX,AX
    jnz LAB_1000_4d41
    mov CX,word ptr [BP + 8h]
    mov AX,word ptr [BP + 6h]
    xor DX,DX
    div CX
    mov BX,AX
    mov AX,word ptr [BP + 4h]
    div CX
    mov DX,BX
    jmp LAB_1000_4d79
LAB_1000_4d41:
    mov BX,AX
    mov CX,word ptr [BP + 8h]
    mov DX,word ptr [BP + 6h]
    mov AX,word ptr [BP + 4h]
LAB_1000_4d4c:
    shr BX,1h
    rcr CX,1h
    shr DX,1h
    rcr AX,1h
    or BX,BX
    jnz LAB_1000_4d4c
    div CX
    mov SI,AX
    mul word ptr [BP + 0ah]
    xchg AX,CX
    mov AX,word ptr [BP + 8h]
    mul SI
    add DX,CX
    jc LAB_1000_4d75
    cmp DX,word ptr [BP + 6h]
    ja LAB_1000_4d75
    jc LAB_1000_4d76
    cmp AX,word ptr [BP + 4h]
    jbe LAB_1000_4d76
LAB_1000_4d75:
    dec SI
LAB_1000_4d76:
    xor DX,DX
    xchg AX,SI
LAB_1000_4d79:
    dec DI
    jnz LAB_1000_4d83
    neg DX
    neg AX
    sbb DX,0h
LAB_1000_4d83:
    pop BX
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret 8h
__aNldiv endp
routine_100 equ __aNldiv

__aNlmul proc near
    push BP
    mov BP,SP
    mov AX,word ptr [BP + a+4h]
    mov BX,word ptr [BP + b+4h]
    or BX,AX
    mov BX,word ptr [BP + b+2h]
    jnz LAB_1000_4da7
    mov AX,word ptr [BP + a+2h]
    mul BX
    mov SP,BP
    pop BP
    ret 8h
LAB_1000_4da7:
    mul BX
    mov CX,AX
    mov AX,word ptr [BP + a+2h]
    mul word ptr [BP + b+4h]
    add CX,AX
    mov AX,word ptr [BP + a+2h]
    mul BX
    add DX,CX
    mov SP,BP
    pop BP
    ret 8h
__aNlmul endp

__aNlrem proc near
    push BP
    mov BP,SP
    push BX
    push DI
    xor DI,DI
    mov AX,word ptr [BP + 6h]
    or AX,AX
    jge LAB_1000_4ddf
    inc DI
    mov DX,word ptr [BP + 4h]
    neg AX
    neg DX
    db 1Dh, 00h, 00h  ; sbb AX,0h (force word-immediate)
    mov word ptr [BP + 6h],AX
    mov word ptr [BP + 4h],DX
LAB_1000_4ddf:
    mov AX,word ptr [BP + 0ah]
    or AX,AX
    jge LAB_1000_4df6
    mov DX,word ptr [BP + 8h]
    neg AX
    neg DX
    db 1Dh, 00h, 00h  ; sbb AX,0h (force word-immediate)
    mov word ptr [BP + 0ah],AX
    mov word ptr [BP + 8h],DX
LAB_1000_4df6:
    or AX,AX
    jnz LAB_1000_4e12
    mov CX,word ptr [BP + 8h]
    mov AX,word ptr [BP + 6h]
    xor DX,DX
    div CX
    mov AX,word ptr [BP + 4h]
    div CX
    mov AX,DX
    xor DX,DX
    dec DI
    jns LAB_1000_4e53
    jmp LAB_1000_4e5a
LAB_1000_4e12:
    mov BX,AX
    mov CX,word ptr [BP + 8h]
    mov DX,word ptr [BP + 6h]
    mov AX,word ptr [BP + 4h]
LAB_1000_4e1d:
    shr BX,1h
    rcr CX,1h
    shr DX,1h
    rcr AX,1h
    or BX,BX
    jnz LAB_1000_4e1d
    div CX
    mov CX,AX
    mul word ptr [BP + 0ah]
    xchg AX,CX
    mul word ptr [BP + 8h]
    add DX,CX
    jc LAB_1000_4e44
    cmp DX,word ptr [BP + 6h]
    ja LAB_1000_4e44
    jc LAB_1000_4e4a
    cmp AX,word ptr [BP + 4h]
    jbe LAB_1000_4e4a
LAB_1000_4e44:
    sub AX,word ptr [BP + 8h]
    sbb DX,word ptr [BP + 0ah]
LAB_1000_4e4a:
    sub AX,word ptr [BP + 4h]
    sbb DX,word ptr [BP + 6h]
    dec DI
    jns LAB_1000_4e5a
LAB_1000_4e53:
    neg DX
    neg AX
    sbb DX,0h
LAB_1000_4e5a:
    pop DI
    pop BX
    mov SP,BP
    pop BP
    ret 8h
__aNlrem endp
routine_139 equ __aNlrem

__aNNaldiv proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BX + 2h]
    push word ptr [BX]
    call routine_100
    mov BX,word ptr [BP + 4h]
    mov word ptr [BX + 2h],DX
    mov word ptr [BX],AX
    mov SP,BP
    pop BP
    ret 6h
__aNNaldiv endp
routine_101 equ __aNNaldiv


FUN_1000_4f33 proc near
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
FUN_1000_4f33 endp

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


routine_134 proc far
_routine_134 equ routine_134
    call readJoyPort
    mov BX,0h
    call routine_149
    mov BX,1h
    call routine_149
    mov AX,word ptr [_joyAxisX]
    retf
routine_134 endp

readJoyPort proc near
    push BP
    xor BX,BX
    xor BP,BP
    mov CX,0ffffh
    mov DX,201h
    cli
    out DX,AL
    jmp LAB_1571_0049
LAB_1571_0049:
    jmp LAB_1571_004b
LAB_1571_004b:
    in AL,DX
    and AL,3h
    jz LAB_1571_005c
    shr AL,1h
    adc BX,0h
    shr AL,1h
    adc BP,0h
    loop LAB_1571_004b
LAB_1571_005c:
    sti
    mov word ptr [_var_53],BX
    mov word ptr [_var_54],BP
    pop BP
    ret
readJoyPort endp

routine_149 proc near
    shl BX,1h
    mov AX,word ptr [BX + offset _var_53]
    mov DX,AX
    sub DX,word ptr [BX + offset _var_50]
    jc LAB_1571_007c
    ja LAB_1571_009e
    mov AH,80h
    jmp LAB_1571_00bc
    db 90h
LAB_1571_007c:
    neg DX
    cmp AX,word ptr [BX + offset _var_48]
    ja LAB_1571_0091
    mov word ptr [BX + offset _var_48],AX
    mov word ptr [BX + offset _var_51],DX
    mov AH,0h
    jmp LAB_1571_00bc
    db 90h
LAB_1571_0091:
    xor AX,AX
    div word ptr [BX + offset _var_51]
    not AX
    shr AX,1h
    jmp LAB_1571_00bc
    db 90h
LAB_1571_009e:
    cmp AX,word ptr [BX + offset _var_49]
    jc LAB_1571_00b1
    mov word ptr [BX + offset _var_49],AX
    mov word ptr [BX + offset _var_52],DX
    mov AH,0ffh
    jmp LAB_1571_00bc
    db 90h
LAB_1571_00b1:
    xor AX,AX
    div word ptr [BX + offset _var_52]
    shr AX,1h
    add AH,80h
LAB_1571_00bc:
    shr BX,1h
    mov byte ptr [BX + offset _joyAxisX],AH
    ret
    db 8Bh
    db 0DCh
    db 56h
    db 57h
    db 06h
    db 0BEh
    db 0CAh
    db 15h
    db 0C4h
    db 7Fh
    db 04h
    db 0B9h
    db 14h
    db 00h
    db 0F3h
    db 0A5h
    db 07h
    db 5Fh
    db 5Eh
    db 0CBh
routine_149 endp

copyJoystickData proc far
    mov BX,SP
    push SI
    push DI
    push DS
    push ES
    lds SI,dword ptr [BX + 4h]
    mov DI,offset _var_48
    push SS
    pop ES
    mov CX,14h
    rep movsw
    pop ES
    pop DS
    pop DI
    pop SI
    retf
    db 00h
copyJoystickData endp
_copyJoystickData equ copyJoystickData





.DATA
; --- Data segment ---

    db 000h
_var_8 db 000h
_var_9 db 000h
_var_10 db 000h
_var_11 db 000h
    db 000h
_var_12 db 000h
_var_13 db 000h
_var_14 db 04Dh
    db 053h
_var_15 db 020h
    db 052h
_var_16 db 075h
    db 06Eh
_var_17 db 02Dh
    db 054h
_var_18 db 069h
    db 06Dh
_var_19 db 065h
    db 020h, 04Ch, 069h, 062h, 072h, 061h, 072h, 079h, 020h, 02Dh, 020h, 043h, 06Fh, 070h, 079h, 072h
    db 069h, 067h, 068h, 074h, 020h, 028h, 063h, 029h, 020h
_var_20 db 031h
    db 039h
_var_21 db 038h
    db 038h
_var_22 db 02Ch
    db 020h, 04Dh, 069h, 063h, 072h, 06Fh, 073h, 06Fh, 066h, 074h, 020h, 043h, 06Fh, 072h, 070h, 011h
    db 000h
dat_0042 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 04Eh, 06Fh, 06Eh, 065h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 053h, 041h, 02Dh, 032h, 000h, 000h, 000h, 000h, 0C8h, 000h, 003h, 000h, 000h, 000h, 053h
    db 041h, 02Dh, 035h, 000h, 000h, 000h, 000h, 05Eh, 001h, 002h, 000h, 000h, 000h, 053h, 041h, 02Dh
    db 038h, 042h, 000h, 000h, 000h, 07Dh, 000h, 005h, 000h, 000h, 000h, 053h, 041h, 02Dh, 031h, 030h
    db 000h, 000h, 000h, 040h, 001h, 007h, 000h, 001h, 000h, 053h, 041h, 02Dh, 031h, 031h, 000h, 000h
    db 000h, 0C8h, 000h, 005h, 000h, 000h, 000h, 053h, 041h, 02Dh, 031h, 032h, 000h, 000h, 000h, 022h
    db 001h, 006h, 000h, 001h, 000h, 053h, 041h, 02Dh, 031h, 033h, 000h, 000h, 000h, 07Dh, 000h, 003h
    db 000h, 000h, 000h, 053h, 041h, 02Dh, 04Eh, 02Dh, 034h, 000h, 000h, 0C8h, 000h, 004h, 000h, 001h
    db 000h, 053h, 041h, 02Dh, 04Eh, 02Dh, 035h, 000h, 000h, 096h, 000h, 003h, 000h, 000h, 000h, 053h
    db 041h, 02Dh, 04Eh, 02Dh, 036h, 000h, 000h, 040h, 001h, 006h, 000h, 001h, 000h, 053h, 041h, 02Dh
    db 04Eh, 02Dh, 037h, 000h, 000h, 0C8h, 000h, 005h, 000h, 000h, 000h, 048h, 061h, 077h, 06Bh, 000h
    db 000h, 000h, 000h, 0AFh, 000h, 006h, 000h, 001h, 000h, 052h, 061h, 070h, 069h, 065h, 072h, 000h
    db 000h, 04Bh, 000h, 008h, 000h, 000h, 000h, 054h, 069h, 067h, 065h, 072h, 000h, 000h, 000h, 041h
    db 000h, 004h, 000h, 000h, 000h, 053h, 065h, 061h, 063h, 061h, 074h, 000h, 000h, 0C8h, 000h, 002h
    db 000h, 000h, 000h, 049h, 04Ch, 037h, 036h, 000h, 000h, 000h, 000h, 0C8h, 000h, 008h, 000h, 003h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 032h, 000h, 005h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 046h, 000h, 006h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 050h, 000h, 007h, 000h, 001h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 064h, 000h, 008h, 000h, 001h, 000h, 04Fh, 054h, 048h, 000h, 000h, 000h, 000h
    db 000h, 0F4h, 001h, 005h, 000h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h
    db 000h, 003h, 000h, 000h, 000h, 04Dh, 049h, 047h, 02Dh, 032h, 033h, 000h, 020h, 046h, 06Ch, 06Fh
    db 067h, 067h, 065h, 072h, 000h, 000h, 000h, 0E4h, 002h, 030h, 002h, 003h, 000h
_samDataTable db 011h
    db 000h, 00Ah, 000h, 002h, 000h, 000h, 000h, 04Dh, 049h, 047h, 02Dh, 032h, 035h, 000h, 020h, 046h
    db 06Fh, 078h, 062h, 061h, 074h, 000h, 000h, 000h, 000h, 03Ah, 002h, 0BCh, 002h, 002h, 000h, 012h
    db 000h, 000h, 000h, 002h, 000h, 000h, 000h, 04Dh, 049h, 047h, 02Dh, 032h, 039h, 000h, 020h, 046h
    db 075h, 06Ch, 063h, 072h, 075h, 06Dh, 000h, 000h, 000h, 0BCh, 002h, 090h, 001h, 005h, 000h, 013h
    db 000h, 014h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 031h, 000h, 000h, 000h, 000h, 020h, 04Dh
    db 069h, 072h, 061h, 067h, 065h, 000h, 000h, 000h, 000h, 016h, 003h, 0A2h, 003h, 003h, 000h, 014h
    db 000h, 000h, 000h, 002h, 000h, 000h, 000h, 053h, 075h, 02Dh, 032h, 037h, 000h, 000h, 020h, 046h
    db 06Ch, 061h, 06Eh, 06Bh, 065h, 072h, 000h, 000h, 000h, 0D5h, 002h, 0CBh, 002h, 004h, 000h, 013h
    db 000h, 014h, 000h, 002h, 000h, 000h, 000h, 049h, 04Ch, 02Dh, 037h, 036h, 000h, 000h, 020h, 04Dh
    db 061h, 069h, 06Eh, 073h, 074h, 061h, 079h, 000h, 000h, 090h, 001h, 0A0h, 00Fh, 001h, 000h, 010h
    db 000h, 00Ch, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 034h, 045h, 000h, 000h, 000h, 020h, 050h
    db 068h, 061h, 06Eh, 074h, 06Fh, 06Dh, 000h, 000h, 000h, 020h, 003h, 008h, 002h, 004h, 000h, 012h
    db 000h, 00Bh, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 031h, 034h, 000h, 000h, 000h, 020h, 054h
    db 06Fh, 06Dh, 063h, 061h, 074h, 000h, 000h, 000h, 000h, 020h, 003h, 020h, 003h, 004h, 000h, 013h
    db 000h, 008h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 031h, 038h, 000h, 000h, 000h, 020h, 048h
    db 06Fh, 072h, 06Eh, 065h, 074h, 000h, 000h, 000h, 000h, 094h, 002h, 0CDh, 001h, 005h, 000h, 0FFh
    db 0FFh, 000h, 000h, 002h, 000h, 000h, 000h, 041h, 06Eh, 02Dh, 037h, 032h, 000h, 000h, 020h, 043h
    db 06Fh, 061h, 06Ch, 065h, 072h, 000h, 000h, 000h, 000h, 05Eh, 001h, 06Ch, 002h, 002h, 000h, 000h
    db 000h, 009h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 031h, 038h, 000h, 000h, 000h, 020h, 048h
    db 06Fh, 072h, 06Eh, 065h, 074h, 000h, 000h, 000h, 000h, 094h, 002h, 0CDh, 001h, 005h, 000h, 0FFh
    db 0FFh, 004h, 000h, 002h, 000h, 000h, 000h, 04Dh, 049h, 047h, 02Dh, 032h, 033h, 000h, 020h, 046h
    db 06Ch, 06Fh, 067h, 067h, 065h, 072h, 000h, 000h, 000h, 0E4h, 002h, 030h, 002h, 003h, 000h, 000h
    db 000h, 004h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 031h, 034h, 000h, 000h, 000h, 020h, 054h
    db 06Fh, 06Dh, 063h, 061h, 074h, 000h, 000h, 000h, 000h, 020h, 003h, 020h, 003h, 004h, 000h, 0FFh
    db 0FFh, 008h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 034h, 045h, 000h, 000h, 000h, 020h, 050h
    db 068h, 061h, 06Eh, 074h, 06Fh, 06Dh, 000h, 000h, 000h, 020h, 003h, 008h, 002h, 004h, 000h, 0FFh
    db 0FFh, 00Bh, 000h, 002h, 000h, 000h, 000h, 04Dh, 049h, 047h, 02Dh, 031h, 037h, 000h, 020h, 046h
    db 072h, 065h, 073h, 063h, 06Fh, 000h, 000h, 000h, 000h, 026h, 002h, 02Ch, 001h, 003h, 000h, 011h
    db 000h, 010h, 000h, 002h, 000h, 000h, 000h, 054h, 075h, 02Dh, 039h, 035h, 000h, 000h, 020h, 042h
    db 065h, 061h, 072h, 000h, 000h, 000h, 000h, 000h, 000h, 09Ah, 001h, 0ECh, 013h, 001h, 000h, 000h
    db 000h, 012h, 000h, 002h, 000h, 000h, 000h, 04Dh, 069h, 02Dh, 032h, 034h, 000h, 000h, 020h, 048h
    db 069h, 06Eh, 064h, 000h, 000h, 000h, 000h, 000h, 000h, 0C8h, 000h, 02Ch, 001h, 001h, 000h, 011h
    db 000h, 013h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 035h, 000h, 000h, 000h, 000h, 020h, 054h
    db 069h, 067h, 065h, 072h, 000h, 000h, 000h, 000h, 000h, 0F4h, 001h, 0FAh, 000h, 003h, 000h, 016h
    db 000h, 016h, 000h, 002h, 000h, 000h, 000h, 037h, 036h, 037h, 000h, 000h, 000h, 000h, 020h, 042h
    db 06Fh, 065h, 069h, 06Eh, 067h, 000h, 000h, 000h, 000h, 090h, 001h, 0E8h, 003h, 001h, 000h, 0FFh
    db 0FFh, 012h, 000h, 002h, 000h, 000h, 000h, 04Eh, 06Fh, 06Eh, 065h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 001h, 000h, 013h, 000h, 053h, 041h, 02Dh, 032h, 000h, 000h, 000h
    db 000h, 07Dh, 000h, 0D0h, 007h, 001h, 000h, 004h, 000h, 013h, 000h, 053h, 041h, 02Dh, 035h, 000h
    db 000h, 000h, 000h, 096h, 000h, 008h, 007h, 001h, 000h, 001h, 000h, 013h, 000h, 053h, 041h, 02Dh
    db 038h, 042h, 000h, 000h, 000h, 041h, 000h, 0B0h, 004h, 002h, 000h, 003h, 000h, 013h, 000h, 053h
    db 041h, 02Dh, 031h, 030h, 000h, 000h, 000h, 07Dh, 000h, 008h, 007h, 003h, 000h, 002h, 000h, 013h
    db 000h, 053h, 041h, 02Dh, 031h, 031h, 000h, 000h, 000h, 064h, 000h, 0DCh, 005h, 002h, 000h, 003h
    db 000h, 013h, 000h, 053h, 041h, 02Dh, 031h, 032h, 000h, 000h, 000h, 096h, 000h, 0D0h, 007h, 003h
    db 000h, 002h, 000h, 013h, 000h, 053h, 041h, 02Dh, 031h, 033h, 000h, 000h, 000h, 041h, 000h, 084h
    db 003h, 000h, 000h, 004h, 000h, 013h, 000h, 053h, 041h, 02Dh, 04Eh, 02Dh, 034h, 000h, 000h, 01Eh
    db 000h, 0B0h, 004h, 002h, 000h, 003h, 000h, 013h, 000h, 053h, 041h, 02Dh, 04Eh, 02Dh, 035h, 000h
    db 000h, 01Eh, 000h, 084h, 003h, 0FFh, 0FFh, 004h, 000h, 013h, 000h, 053h, 041h, 02Dh, 04Eh, 02Dh
    db 036h, 000h, 000h, 07Dh, 000h, 008h, 007h, 003h, 000h, 002h, 000h, 013h, 000h, 053h, 041h, 02Dh
    db 04Eh, 02Dh, 037h, 000h, 000h, 064h, 000h, 0DCh, 005h, 002h, 000h, 003h, 000h, 013h, 000h, 048h
    db 061h, 077h, 06Bh, 000h, 000h, 000h, 000h, 07Dh, 000h, 084h, 003h, 002h, 000h, 003h, 000h, 013h
    db 000h, 052h, 061h, 070h, 069h, 065h, 072h, 000h, 000h, 041h, 000h, 0B0h, 004h, 002h, 000h, 004h
    db 000h, 013h, 000h, 054h, 069h, 067h, 065h, 072h, 000h, 000h, 000h, 01Eh, 000h, 084h, 003h, 001h
    db 000h, 003h, 000h, 013h, 000h, 053h, 065h, 061h, 063h, 061h, 074h, 000h, 000h, 01Eh, 000h, 084h
    db 003h, 001h, 000h, 003h, 000h, 013h, 000h, 041h, 041h, 02Dh, 032h, 000h, 000h, 000h, 000h, 00Eh
    db 000h, 0DCh, 005h, 0FFh, 0FFh, 004h, 000h, 013h, 000h, 041h, 041h, 02Dh, 038h, 000h, 000h, 000h
    db 000h, 00Ch, 000h, 008h, 007h, 000h, 000h, 005h, 000h, 013h, 000h, 041h, 041h, 02Dh, 036h, 000h
    db 000h, 000h, 000h, 032h, 000h, 060h, 009h, 002h, 000h, 002h, 000h, 013h, 000h, 041h, 041h, 02Dh
    db 037h, 000h, 000h, 000h, 000h, 022h, 000h, 008h, 007h, 002h, 000h, 002h, 000h, 013h, 000h, 041h
    db 041h, 02Dh, 039h, 000h, 000h, 000h, 000h, 052h, 000h, 0D0h, 007h, 002h, 000h, 003h, 000h, 013h
    db 000h, 041h, 041h, 02Dh, 031h, 030h, 000h, 000h, 000h, 040h, 000h, 0D0h, 007h, 003h, 000h, 004h
    db 000h, 013h, 000h, 041h, 049h, 04Dh, 031h, 032h, 030h, 000h, 000h, 020h, 000h, 060h, 009h, 007h
    db 000h, 004h, 000h, 001h, 000h, 041h, 049h, 04Dh, 02Dh, 039h, 000h, 000h, 000h, 011h, 000h, 0D0h
    db 007h, 007h, 000h, 008h, 000h, 001h, 000h, 048h, 041h, 052h, 04Dh, 000h, 000h, 000h, 000h, 014h
    db 000h, 0B0h, 004h, 004h, 000h, 002h, 000h, 001h, 000h, 050h, 065h, 06Eh, 067h, 075h, 069h, 06Eh
    db 000h, 020h, 000h, 0F4h, 001h, 005h, 000h, 002h, 000h, 013h, 000h, 048h, 061h, 072h, 070h, 06Fh
    db 06Fh, 06Eh, 000h, 03Ch, 000h, 0F4h, 001h, 005h, 000h, 002h, 000h, 013h, 000h, 041h, 047h, 04Dh
    db 02Dh, 036h, 035h, 000h, 000h, 020h, 000h, 020h, 003h, 006h, 000h, 002h, 000h, 00Dh, 000h, 04Ch
    db 047h, 042h, 04Fh, 04Dh, 042h, 000h, 000h, 00Ah, 000h, 000h, 000h, 01Ch, 000h, 002h, 000h, 00Fh
    db 000h, 052h, 054h, 042h, 04Fh, 04Dh, 042h, 000h, 000h, 000h, 000h, 000h, 000h, 01Dh, 000h, 002h
    db 000h, 00Fh, 000h, 046h, 046h, 042h, 04Fh, 04Dh, 042h, 000h, 000h, 000h, 000h, 000h, 000h, 01Eh
    db 000h, 002h, 000h, 00Fh, 000h, 041h, 049h, 04Dh, 02Dh, 037h, 057h, 000h, 000h, 02Ch, 000h, 060h
    db 009h, 002h, 000h, 004h, 000h, 001h, 000h, 041h, 049h, 04Dh, 02Dh, 039h, 057h, 000h, 000h, 00Ch
    db 000h, 0D0h, 007h, 000h, 000h, 005h, 000h, 001h, 000h, 053h, 041h, 02Dh, 031h, 034h, 000h, 000h
    db 000h, 010h, 000h, 084h, 003h, 000h, 000h, 005h, 000h, 001h, 000h, 041h, 041h, 02Dh, 036h, 000h
    db 000h, 000h, 000h, 032h, 000h, 060h, 009h, 0FFh, 0FFh, 002h, 000h, 013h, 000h, 041h, 041h, 02Dh
    db 037h, 000h, 000h, 000h, 000h, 022h, 000h, 008h, 007h, 0FFh, 0FFh, 002h, 000h, 013h, 000h, 041h
    db 041h, 02Dh, 039h, 000h, 000h, 000h, 000h, 052h, 000h, 0D0h, 007h, 0FFh, 0FFh, 003h, 000h, 013h
    db 000h, 041h, 041h, 02Dh, 031h, 030h, 000h, 000h, 000h, 040h, 000h, 0D0h, 007h, 000h, 000h, 004h
    db 000h, 013h, 000h, 045h, 071h, 075h, 069h, 070h, 02Eh, 000h, 000h, 000h, 000h, 000h, 000h, 01Dh
    db 000h, 000h, 000h, 00Eh, 000h, 000h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 006h, 000h, 001h
    db 000h, 007h, 000h, 003h, 000h, 006h, 000h, 002h, 000h, 005h, 000h, 007h, 000h, 004h, 000h, 002h
    db 000h, 005h, 000h, 003h, 000h, 008h, 000h, 000h, 000h, 008h, 000h, 000h, 000h, 00Ah, 000h, 00Bh
    db 000h, 00Bh, 000h, 009h, 000h, 00Ch, 000h, 00Dh, 000h, 00Ch, 000h, 00Eh, 000h, 00Dh, 000h, 00Eh
    db 000h, 00Fh, 000h, 000h, 000h, 004h, 000h, 088h, 013h, 000h, 000h, 00Ch, 000h, 012h, 000h, 003h
    db 000h, 001h, 000h, 003h, 000h, 010h, 000h, 001h, 000h, 005h, 000h, 003h, 000h, 009h, 000h, 003h
    db 000h, 000h, 000h, 08Ah, 002h, 000h, 000h, 001h, 000h, 001h, 000h
_nightMission db 001h
    db 000h, 000h, 000h, 001h, 000h, 001h, 000h, 004h, 000h, 041h, 049h, 04Dh, 02Dh, 039h, 04Dh, 000h
    db 000h, 000h, 000h, 053h, 069h, 064h, 065h, 077h, 069h, 06Eh, 064h, 065h, 072h, 000h, 000h, 017h
    db 000h, 004h, 000h, 041h, 049h, 04Dh, 02Dh, 031h, 032h, 030h, 000h, 000h, 000h, 041h, 04Dh, 052h
    db 041h, 041h, 04Dh, 000h, 000h, 000h, 000h, 000h, 000h, 016h, 000h, 003h, 000h, 041h, 047h, 04Dh
    db 02Dh, 038h, 038h, 041h, 000h, 000h, 000h, 048h, 041h, 052h, 04Dh, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 018h, 000h, 001h, 000h, 050h, 033h, 020h, 041h, 053h, 04Dh, 000h, 000h, 000h
    db 000h, 050h, 065h, 06Eh, 067h, 075h, 069h, 06Eh, 000h, 000h, 000h, 000h, 000h, 019h, 000h, 002h
    db 000h, 041h, 047h, 04Dh, 02Dh, 038h, 036h, 041h, 000h, 000h, 000h, 048h, 061h, 072h, 070h, 06Fh
    db 06Fh, 06Eh, 000h, 000h, 000h, 000h, 000h, 01Ah, 000h, 001h, 000h, 041h, 047h, 04Dh, 02Dh, 036h
    db 035h, 044h, 000h, 000h, 000h, 04Dh, 061h, 076h, 065h, 072h, 069h, 063h, 06Bh, 000h, 000h, 000h
    db 000h, 01Bh, 000h, 002h, 000h, 047h, 042h, 055h, 02Dh, 031h, 032h, 000h, 000h, 000h, 000h, 050h
    db 061h, 076h, 065h, 077h, 061h, 079h, 000h, 000h, 000h, 000h, 000h, 01Ch, 000h, 002h, 000h, 04Dh
    db 06Bh, 020h, 032h, 030h, 000h, 000h, 000h, 000h, 000h, 052h, 06Fh, 063h, 06Bh, 065h, 079h, 065h
    db 000h, 000h, 000h, 000h, 000h, 01Dh, 000h, 002h, 000h, 044h, 06Eh, 064h, 06Ch, 000h, 000h, 000h
    db 000h, 000h, 000h, 044h, 075h, 072h, 061h, 06Eh, 064h, 061h, 06Ch, 000h, 000h, 000h, 000h, 01Dh
    db 000h, 002h, 000h, 04Dh, 06Bh, 020h, 038h, 032h, 02Dh, 030h, 000h, 000h, 000h, 053h, 06Ch, 069h
    db 063h, 06Bh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 01Eh, 000h, 003h, 000h, 04Dh, 06Bh, 020h
    db 038h, 032h, 02Dh, 031h, 000h, 000h, 000h, 053h, 06Eh, 061h, 06Bh, 065h, 079h, 065h, 000h, 000h
    db 000h, 000h, 000h, 01Dh, 000h, 003h, 000h, 04Dh, 06Bh, 020h, 032h, 030h, 000h, 000h, 000h, 000h
    db 000h, 052h, 06Fh, 063h, 06Bh, 065h, 079h, 065h, 020h, 049h, 049h, 000h, 000h, 01Ch, 000h, 002h
    db 000h, 04Dh, 06Bh, 020h, 031h, 032h, 032h, 000h, 000h, 000h, 000h, 046h, 069h, 072h, 065h, 065h
    db 079h, 065h, 000h, 000h, 000h, 000h, 000h, 01Eh, 000h, 002h, 000h, 043h, 042h, 055h, 02Dh, 037h
    db 032h, 000h, 000h, 000h, 000h, 046h, 075h, 065h, 06Ch, 02Dh, 041h, 069h, 072h, 000h, 000h, 000h
    db 000h, 01Ch, 000h, 002h, 000h, 04Dh, 06Bh, 020h, 033h, 035h, 000h, 000h, 000h, 000h, 000h, 049h
    db 04Eh, 020h, 043h, 06Ch, 075h, 073h, 074h, 065h, 072h, 000h, 000h, 01Dh, 000h, 002h, 000h, 049h
    db 053h, 043h, 020h, 042h, 02Dh, 031h, 000h, 000h, 000h, 04Dh, 069h, 06Eh, 065h, 06Ch, 065h, 074h
    db 073h, 000h, 000h, 000h, 000h, 01Dh, 000h, 001h, 000h, 031h, 033h, 035h, 020h, 06Dh, 06Dh, 000h
    db 000h, 000h, 000h, 043h, 061h, 06Dh, 065h, 072h, 061h, 000h, 000h, 000h, 000h, 000h, 000h, 0FFh
    db 0FFh, 001h, 000h, 031h, 039h, 030h, 030h, 06Ch, 062h, 073h, 000h, 000h, 000h, 045h, 078h, 074h
    db 072h, 061h, 020h, 046h, 075h, 065h, 06Ch, 000h, 000h, 0FEh, 0FFh, 001h, 000h, 032h, 030h, 020h
    db 06Dh, 06Dh, 000h, 000h, 000h, 000h, 000h, 047h, 075h, 06Eh, 073h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 001h, 000h, 053h, 070h, 065h, 063h, 069h, 061h, 06Ch, 000h, 000h
    db 000h, 045h, 071h, 075h, 069h, 070h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 026h, 000h, 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 006h, 000h, 000h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 006h, 002h, 001h, 002h, 002h, 003h, 004h, 003h, 003h, 004h, 004h, 004h, 001h, 002h, 004h
    db 001h, 002h, 004h, 005h, 005h, 004h, 004h, 005h, 004h, 004h, 000h, 003h, 000h, 000h, 004h, 004h
    db 000h, 000h, 005h, 005h, 004h, 004h, 005h, 000h, 004h, 000h, 008h, 000h, 000h, 002h, 001h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 003h, 001h, 003h, 004h, 001h, 001h, 004h, 002h, 003h, 003h
    db 004h, 000h, 003h, 000h, 001h, 004h, 004h, 000h, 000h, 004h, 000h, 002h, 000h, 004h, 000h, 000h
    db 000h, 000h, 004h, 004h, 000h, 000h, 004h, 004h, 004h, 004h, 004h, 000h, 003h, 002h, 000h, 004h
    db 004h, 000h, 002h, 005h, 003h, 003h, 002h, 005h, 001h, 003h, 004h, 000h, 000h, 006h, 000h, 005h
    db 000h, 000h, 000h, 004h, 000h, 005h, 002h, 001h, 000h, 006h, 004h, 000h, 000h, 006h, 006h, 003h
    db 006h, 006h, 000h, 003h, 000h, 006h, 000h, 003h, 000h, 000h, 002h, 003h, 000h, 000h, 003h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 004h, 004h, 000h
    db 002h, 004h, 004h, 003h, 004h, 005h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 003h, 000h, 002h, 000h, 001h, 000h, 000h
    db 000h, 0FFh, 0FFh, 0FEh, 0FFh, 0FFh, 0FFh, 003h, 000h, 002h, 000h, 002h, 000h, 002h, 000h, 001h
    db 000h, 001h, 000h, 001h, 000h, 002h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 002h, 000h, 002h
    db 000h, 002h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h
    db 000h, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 003h, 000h, 003h, 000h, 003h, 000h, 0FDh, 0FFh, 0FDh
    db 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FEh, 0FFh, 0FEh, 0FFh, 0FEh
    db 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FEh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FEh
    db 0FFh, 0FEh, 0FFh, 0FEh, 0FFh, 0FDh, 0FFh, 001h, 000h, 002h, 000h, 001h, 000h, 000h, 000h, 0FFh
    db 0FFh, 0FEh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 002h, 000h, 003h, 000h, 002h, 000h, 002h, 000h, 001h
    db 000h, 001h, 000h, 001h, 000h, 0FEh, 0FFh, 004h, 000h, 004h, 000h, 003h, 000h, 002h, 000h, 001h
    db 000h, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 0FEh
    db 0FFh, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 0FCh, 0FFh, 0FCh, 0FFh, 004h
    db 000h, 004h, 000h, 004h, 000h, 004h, 000h, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 004h
    db 000h, 004h, 000h, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 002h, 000h, 0FCh
    db 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FFh, 0FFh, 0FDh
    db 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 002h, 000h, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FEh
    db 0FFh, 0FEh, 0FFh, 0FDh, 0FFh, 0FFh, 0FFh, 002h, 000h, 003h, 000h, 002h, 000h, 002h, 000h, 001h
    db 000h, 001h, 000h, 0FFh, 0FFh, 0FEh, 0FFh, 004h, 000h, 004h, 000h, 003h, 000h, 002h, 000h, 001h
    db 000h, 004h, 000h, 0FCh, 0FFh, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 000h
    db 001h, 004h, 000h, 000h, 001h, 000h, 001h, 000h, 001h, 004h, 000h, 0FCh, 0FFh, 0FCh, 0FFh, 000h
    db 002h, 004h, 000h, 000h, 001h, 000h, 001h, 000h, 001h, 000h, 001h, 0FCh, 0FFh, 000h, 002h, 004h
    db 000h, 004h, 000h, 0FCh, 0FFh, 000h, 001h, 000h, 001h, 000h, 001h, 0FCh, 0FFh, 004h, 000h, 0FCh
    db 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 004h, 000h, 000h, 001h, 0FFh, 0FFh, 0FDh
    db 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 002h, 000h, 001h, 000h, 0FFh, 0FFh, 0FFh, 0FFh, 0FEh
    db 0FFh, 0FEh, 0FFh, 0FDh, 0FFh, 0FFh, 0FFh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 007h, 000h, 004h, 000h, 001h, 000h, 02Fh
    db 000h, 000h, 000h, 00Fh, 000h, 007h, 000h, 004h, 000h, 001h, 000h, 02Fh, 000h, 000h, 000h, 00Fh
    db 000h, 001h, 000h, 003h, 000h, 001h, 000h, 03Ah, 000h, 000h, 000h, 00Fh, 000h, 006h, 000h, 003h
    db 000h, 001h, 000h, 03Ah, 000h, 000h, 000h, 00Fh, 000h, 003h, 000h, 001h, 000h, 002h, 000h, 000h
    db 000h, 000h, 000h, 00Fh, 000h, 006h, 000h, 002h, 000h, 002h, 000h, 000h, 000h, 000h, 000h, 00Fh
    db 000h, 006h, 000h, 002h, 000h, 003h, 000h, 000h, 000h, 001h, 000h, 00Fh, 000h, 007h, 000h, 001h
    db 000h, 004h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 006h, 000h, 002h, 000h, 004h, 000h, 000h
    db 000h, 000h, 000h, 00Fh, 000h, 001h, 000h, 001h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 00Fh
    db 000h, 007h, 000h, 002h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 007h, 000h, 001h
    db 000h, 006h, 000h, 000h, 000h, 009h, 000h, 00Fh, 000h, 004h, 000h, 002h, 000h, 006h, 000h, 000h
    db 000h, 009h, 000h, 00Fh, 000h, 003h, 000h, 001h, 000h, 007h, 000h, 000h, 000h, 004h, 000h, 00Fh
    db 000h, 007h, 000h, 002h, 000h, 007h, 000h, 000h, 000h, 004h, 000h, 00Fh, 000h, 007h, 000h, 001h
    db 000h, 016h, 000h, 000h, 000h, 005h, 000h, 00Fh, 000h, 007h, 000h, 002h, 000h, 016h, 000h, 000h
    db 000h, 005h, 000h, 00Fh, 000h, 007h, 000h, 001h, 000h, 016h, 000h, 000h, 000h, 006h, 000h, 00Fh
    db 000h, 007h, 000h, 002h, 000h, 016h, 000h, 000h, 000h, 006h, 000h, 00Fh, 000h, 003h, 000h, 001h
    db 000h, 016h, 000h, 022h, 000h, 006h, 000h, 00Fh, 000h, 007h, 000h, 002h, 000h, 016h, 000h, 022h
    db 000h, 006h, 000h, 003h, 000h, 003h, 000h, 001h, 000h, 017h, 000h, 000h, 000h, 00Bh, 000h, 003h
    db 000h, 007h, 000h, 002h, 000h, 017h, 000h, 002h, 000h, 00Bh, 000h, 00Fh, 000h, 001h, 000h, 001h
    db 000h, 00Ah, 000h, 000h, 000h, 003h, 000h, 00Fh, 000h, 006h, 000h, 002h, 000h, 00Ah, 000h, 000h
    db 000h, 003h, 000h, 00Fh, 000h, 007h, 000h, 001h, 000h, 00Ch, 000h, 000h, 000h, 007h, 000h, 003h
    db 000h, 007h, 000h, 002h, 000h, 00Ch, 000h, 002h, 000h, 007h, 000h, 003h, 000h, 007h, 000h, 002h
    db 000h, 00Ch, 000h, 000h, 000h, 007h, 000h, 003h, 000h, 007h, 000h, 001h, 000h, 00Dh, 000h, 000h
    db 000h, 001h, 000h, 003h, 000h, 007h, 000h, 002h, 000h, 00Dh, 000h, 000h, 000h, 001h, 000h, 002h
    db 000h, 003h, 000h, 001h, 000h, 00Eh, 000h, 000h, 000h, 008h, 000h, 002h, 000h, 007h, 000h, 002h
    db 000h, 00Eh, 000h, 000h, 000h, 008h, 000h, 003h, 000h, 003h, 000h, 001h, 000h, 00Fh, 000h, 000h
    db 000h, 002h, 000h, 003h, 000h, 007h, 000h, 002h, 000h, 00Fh, 000h, 000h, 000h, 002h, 000h, 00Fh
    db 000h, 003h, 000h, 001h, 000h, 010h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 006h, 000h, 002h
    db 000h, 010h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 003h, 000h, 001h, 000h, 011h, 000h, 022h
    db 000h, 000h, 000h, 003h, 000h, 007h, 000h, 002h, 000h, 011h, 000h, 022h, 000h, 000h, 000h, 00Fh
    db 000h, 003h, 000h, 001h, 000h, 012h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 006h, 000h, 002h
    db 000h, 012h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 001h, 000h, 001h, 000h, 013h, 000h, 000h
    db 000h, 000h, 000h, 00Fh, 000h, 007h, 000h, 002h, 000h, 013h, 000h, 000h, 000h, 000h, 000h, 00Bh
    db 000h, 007h, 000h, 001h, 000h, 009h, 000h, 000h, 000h, 000h, 000h, 00Bh, 000h, 007h, 000h, 002h
    db 000h, 009h, 000h, 000h, 000h, 000h, 000h, 00Ch, 000h, 006h, 000h, 002h, 000h, 009h, 000h, 002h
    db 000h, 000h, 000h, 00Fh, 000h, 006h, 000h, 001h, 000h, 014h, 000h, 000h, 000h, 000h, 000h, 00Fh
    db 000h, 006h, 000h, 002h, 000h, 014h, 000h, 000h, 000h, 000h, 000h, 00Ch, 000h, 006h, 000h, 005h
    db 000h, 015h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 007h, 000h, 005h
dat_0f89 db 000h
    db 015h, 000h, 000h, 000h, 000h, 000h, 00Ch, 000h, 006h, 000h, 007h, 000h, 015h, 000h, 000h, 000h
    db 000h, 000h, 003h, 000h, 003h, 000h, 007h, 000h, 015h, 000h, 000h, 000h, 000h, 000h, 00Bh, 000h
    db 001h, 000h, 007h, 000h, 015h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 003h, 000h, 006h, 000h
    db 015h, 000h, 000h, 000h, 0F1h, 0FFh, 00Ch, 000h, 006h, 000h, 008h, 000h, 015h, 000h, 000h, 000h
    db 0F1h, 0FFh, 00Dh, 000h, 006h, 000h, 008h, 000h, 015h, 000h, 000h, 000h, 0FBh, 0FFh, 00Fh, 000h
    db 007h, 000h, 008h, 000h, 015h, 000h, 000h, 000h, 0FEh, 0FFh, 000h, 000h, 000h, 000h
_var_25 db 000h
str_overlayRelError db 045h
    db 072h, 072h, 06Fh, 072h, 020h, 072h, 065h, 06Ch, 065h, 061h, 073h, 069h, 06Eh, 067h, 020h, 06Fh
    db 076h, 065h, 072h, 06Ch, 061h, 079h, 020h, 06Dh, 065h, 06Dh, 06Fh, 072h, 079h, 024h
gfx_jump_0_alloc proc far               ; 0x1008
    db 0EAh
    dd 0
gfx_jump_0_alloc endp
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_jump_05_drawString proc far               ; 0x1021
    db 0EAh
    dd 0
gfx_jump_05_drawString endp
_gfx_jump_05_drawString equ gfx_jump_05_drawString
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h
    db 000h, 000h, 000h
gfx_jump_0d_setCurBuf proc far               ; 0x1049
    db 0EAh
    dd 0
gfx_jump_0d_setCurBuf endp
gfx_jump_0e_setCurBuf proc far               ; 0x104E
    db 0EAh
    dd 0
gfx_jump_0e_setCurBuf endp
gfx_jump_0f_getBufPtr proc far               ; 0x1053
    db 0EAh
    dd 0
gfx_jump_0f_getBufPtr endp
gfx_jump_10_getCurBuf proc far               ; 0x1058
    db 0EAh
    dd 0
gfx_jump_10_getCurBuf endp
gfx_jump_11_blitSprite proc far               ; 0x105D
    db 0EAh
    dd 0
gfx_jump_11_blitSprite endp
_gfx_jump_11_blitSprite equ gfx_jump_11_blitSprite
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h
gfx_jump_17_bufSize proc far               ; 0x107B
    db 0EAh
    dd 0
gfx_jump_17_bufSize endp
_gfx_jump_17_bufSize equ gfx_jump_17_bufSize
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h
gfx_jump_1a proc far               ; 0x108A
    db 0EAh
    dd 0
gfx_jump_1a endp
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_jump_1f proc far               ; 0x10A3
    db 0EAh
    dd 0
gfx_jump_1f endp
gfx_jump_20_setVal proc far               ; 0x10A8
    db 0EAh
    dd 0
gfx_jump_20_setVal endp
gfx_jump_21 proc far               ; 0x10AD
    db 0EAh
    dd 0
gfx_jump_21 endp
_gfx_jump_21 equ gfx_jump_21
gfx_jump_22 proc far               ; 0x10B2
    db 0EAh
    dd 0
gfx_jump_22 endp
gfx_jump_23 proc far               ; 0x10B7
    db 0EAh
    dd 0
gfx_jump_23 endp
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_jump_28 proc far               ; 0x10D0
    db 0EAh
    dd 0
gfx_jump_28 endp
gfx_jump_29_switchColor proc far
    db 0EAh
    dd 0
gfx_jump_29_switchColor endp
_gfx_jump_29_switchColor equ gfx_jump_29_switchColor
gfx_jump_2a proc far               ; 0x10DA
    db 0EAh
    dd 0
gfx_jump_2a endp
_gfx_jump_2a equ gfx_jump_2a
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_jump_2f_charWidth proc far               ; 0x10F3
    db 0EAh
    dd 0
gfx_jump_2f_charWidth endp
_gfx_jump_2f_charWidth equ gfx_jump_2f_charWidth
    db 0EAh, 000h, 000h, 000h, 000h
gfx_jump_31 proc far               ; 0x10FD
    db 0EAh
    dd 0
gfx_jump_31 endp
_gfx_jump_31 equ gfx_jump_31
    db 0EAh, 000h, 000h, 000h, 000h
gfx_jump_33_fillRow proc far               ; 0x1107
    db 0EAh
    dd 0
gfx_jump_33_fillRow endp
gfx_jump_34_fillRow proc far               ; 0x110C
    db 0EAh
    dd 0
gfx_jump_34_fillRow endp
gfx_jump_35 proc far               ; 0x1111
    db 0EAh
    dd 0
gfx_jump_35 endp
gfx_jump_36_null proc far               ; 0x1116
    db 0EAh
    dd 0
gfx_jump_36_null endp
thunk_EXT_FUN_0000 proc far               ; 0x111B
    db 0EAh
    dd 0
thunk_EXT_FUN_0000 endp
gfx_jump_38_getPageBuf proc far               ; 0x1120
    db 0EAh
    dd 0
gfx_jump_38_getPageBuf endp
    db 0EAh, 000h, 000h, 000h, 000h
gfx_jump_3a_getRowOffset proc far               ; 0x112A
    db 0EAh
    dd 0
gfx_jump_3a_getRowOffset endp
gfx_jump_3b_clearBuf proc far               ; 0x112F
    db 0EAh
    dd 0
gfx_jump_3b_clearBuf endp
    db 0EAh, 000h, 000h, 000h, 000h
gfx_jump_3d_null proc far               ; 0x1139
    db 0EAh
    dd 0
gfx_jump_3d_null endp
_gfx_jump_3d_null equ gfx_jump_3d_null
gfx_jump_3e proc far               ; 0x113E
    db 0EAh
    dd 0
gfx_jump_3e endp
    db 0EAh, 000h, 000h, 000h, 000h
gfx_jump_40 proc far               ; 0x1148
    db 0EAh
    dd 0
gfx_jump_40 endp
gfx_jump_41 proc far               ; 0x114D
    db 0EAh
    dd 0
gfx_jump_41 endp
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h
gfx_jump_44_setDac proc far               ; 0x115C
    db 0EAh
    dd 0
gfx_jump_44_setDac endp
gfx_jump_45_retrace proc far               ; 0x1161
    db 0EAh
    dd 0
gfx_jump_45_retrace endp
_gfx_jump_45_retrace equ gfx_jump_45_retrace
gfx_jump_46_retrace2 proc far               ; 0x1166
    db 0EAh
    dd 0
gfx_jump_46_retrace2 endp
_gfx_jump_46_retrace2 equ gfx_jump_46_retrace2
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_jump_4b_storeBufPtr proc far               ; 0x117F
    db 0EAh
    dd 0
gfx_jump_4b_storeBufPtr endp
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
PUBLIC _gfx_jump_50
gfx_jump_50 proc far               ; 0x1198
    db 0EAh
    dd 0
gfx_jump_50 endp
_gfx_jump_50 equ gfx_jump_50
gfx_jump_51_null proc far               ; 0x119D
    db 0EAh
    dd 0
gfx_jump_51_null endp
gfx_jump_52 proc far               ; 0x11A2
    db 0EAh
    dd 0
gfx_jump_52 endp
gfx_jump_53 proc far               ; 0x11A7
    db 0EAh
    dd 0
gfx_jump_53 endp
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
misc_jump_5a_keybuf proc far               ; 0x11CA
_misc_jump_5a_keybuf equ misc_jump_5a_keybuf
    db 0EAh
    dd 0
misc_jump_5a_keybuf endp
misc_jump_5b_getkey proc far               ; 0x11CF
_misc_jump_5b_getkey equ misc_jump_5b_getkey
    db 0EAh
    dd 0
misc_jump_5b_getkey endp
    db 0EAh, 000h, 000h, 000h, 000h
misc_jump_5d_readJoy proc far               ; 0x11D9
_misc_jump_5d_readJoy equ misc_jump_5d_readJoy
    db 0EAh
    dd 0
misc_jump_5d_readJoy endp
misc_jump_5e_clearKeyFlags proc far               ; 0x11DE
    db 0EAh
    dd 0
misc_jump_5e_clearKeyFlags endp
PUBLIC _misc_jump_5e_clearKeyFlags
_misc_jump_5e_clearKeyFlags equ misc_jump_5e_clearKeyFlags
    db 0EAh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h
    db 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h
    db 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h
_var_26 db 0EAh
    db 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h
_var_27 db 000h
    db 000h
_var_28 db 000h
    db 000h
_var_29 db 000h
    db 000h
_var_30 db 000h
    db 000h, 000h
_var_31 db 000h
    db 000h
_var_32 db 000h
    db 000h
_var_33 db 000h
    db 000h
_var_34 db 000h
    db 000h
_var_35 db 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
_var_36 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
dat_14d7 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
dat_1500 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_dat_1580 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h
_var_37 db 0FFh
    db 0FFh
_var_38 db 000h
    db 000h, 000h
_var_39 db 000h
_var_40 db 000h
_var_41 db 000h
_var_42 db 000h
_var_43 db 000h
_var_44 db 000h
    db 000h
_var_45 db 000h
    db 000h
_var_46 db 03Fh
    db 001h
_var_47 db 06Fh
    db 000h, 000h
_var_48 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_49 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_50 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_51 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_52 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_53 db 000h
    db 000h
_var_54 db 000h
    db 000h, 000h, 000h, 000h, 000h
_joyAxisX db 000h
_joyAxisY db 000h
    db 000h, 000h
_quitFlag db 000h
_var_58 db 000h
    db 000h
_var_59 db 000h
    db 000h, 000h
_var_60 db 000h
_var_61 db 000h
dat_1606 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
str_fileNotFound db 03Ah
    db 046h, 069h, 06Ch, 065h, 020h, 06Eh, 06Fh, 074h, 020h, 066h, 06Fh, 075h, 06Eh, 064h, 024h
str_noFileBufs db 03Ah
    db 04Eh, 06Fh, 020h, 066h, 069h, 06Ch, 065h, 020h, 062h, 075h, 066h, 066h, 065h, 072h, 073h, 020h
    db 061h, 076h, 061h, 069h, 06Ch, 061h, 062h, 06Ch, 065h, 024h
str_openError db 03Ah
    db 04Fh, 070h, 065h, 06Eh, 020h, 065h, 072h, 072h, 06Fh, 072h, 020h, 024h
str_fileCloseError db 046h
    db 069h, 06Ch, 065h, 020h, 063h, 06Ch, 06Fh, 073h, 069h, 06Eh, 067h, 020h, 065h, 072h, 072h, 06Fh
    db 072h, 024h
str_readError db 052h
    db 065h, 061h, 064h, 020h, 065h, 072h, 072h, 06Fh, 072h, 024h
str_writeError db 057h
    db 072h, 069h, 074h, 065h, 020h, 065h, 072h, 072h, 06Fh, 072h, 024h
dat_1868 db 000h
    db 000h
dat_186A db 000h
    db 000h, 000h, 000h
_var_62 db 000h
    db 000h
_var_63 db 000h
    db 000h
dat_1872 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_64 db 000h
    db 000h
_var_65 db 000h
    db 000h
_var_66 db 000h
    db 000h, 000h, 000h
_var_67 db 000h
    db 000h
_var_68 db 000h
    db 000h
_str_allocError label byte
str_allocError db 049h
    db 06Eh, 073h, 075h, 066h, 066h, 069h, 063h, 069h, 065h, 06Eh, 074h, 020h, 073h, 079h, 073h, 074h
    db 065h, 06Dh, 020h, 06Dh, 065h, 06Dh, 06Fh, 072h, 079h, 020h, 02Dh, 020h, 041h, 06Ch, 06Ch, 06Fh
    db 063h, 042h, 075h, 066h, 066h, 065h, 072h, 024h, 000h
_str_deallocError label byte
str_deallocError db 042h
    db 075h, 066h, 066h, 065h, 072h, 020h, 064h, 065h, 061h, 06Ch, 06Ch, 06Fh, 063h, 020h, 065h, 072h
    db 072h, 06Fh, 072h, 024h, 000h
_var_timerFlag db 000h
_timerHandlerInstalled db 000h
_var_70 db 000h
    db 000h
_var_71 db 000h
    db 000h
_var_72 db 000h
    db 000h
_var_73 db 000h
    db 000h, 000h, 000h
_var_74 db 000h
    db 000h
_var_75 db 000h
_var_76 db 000h
    db 000h
_var_77 db 000h
    db 000h
_var_78 db 000h
    db 000h
_var_79 db 000h
_var_80 db 000h
    db 000h, 000h, 000h, 000h, 000h
_timerCounter db 000h
    db 000h
_timerCounter2 db 000h
_timerCounter3 db 000h
_str_emptyRank db 000h
_str_1stLt db '1st Lieutenant.', 0
_str_captain db 'Captain.', 0
_str_major db 'Major.', 0
_str_ltColonel db 'Lt Colonel.', 0
_str_colonel db 'Colonel.', 0
_str_general db 'General.', 0
_str_afcm db 'Air Force Commendation Medal.', 0
_str_dfc db 'Distinguished Flying Cross.', 0
_str_silverStar db 'Silver Star.', 0
_str_afc db 'Air Force Cross.', 0
_str_cmoh db 'Congressional Medal of Honor.', 0
_str_deskPic equ str_deskPic
str_deskPic db 064h
    db 065h, 073h, 06Bh, 02Eh, 070h, 069h, 063h, 000h
_str_deskMsg1 equ str_deskMsg1
str_deskMsg1 db 041h
    db 066h, 074h, 065h, 072h, 020h, 064h, 069h, 074h, 063h, 068h, 069h, 06Eh, 067h, 020h, 074h, 068h
    db 072h, 065h, 065h, 020h, 076h, 065h, 072h, 079h, 020h, 065h, 078h, 070h, 065h, 06Eh, 073h, 069h
    db 076h, 065h, 020h, 061h, 069h, 072h, 063h, 072h, 061h, 066h, 074h, 02Ch, 000h
_str_deskMsg2 equ str_deskMsg2
str_deskMsg2 db 079h
    db 06Fh, 075h, 020h, 061h, 072h, 065h, 020h, 061h, 073h, 073h, 069h, 067h, 06Eh, 065h, 064h, 020h
    db 061h, 020h, 064h, 065h, 073h, 06Bh, 020h, 06Ah, 06Fh, 062h, 02Eh, 000h
_str_deathPic equ str_deathPic
str_deathPic db 064h
    db 065h, 061h, 074h, 068h, 02Eh, 070h, 069h, 063h, 000h
_str_deathMsg1 equ str_deathMsg1
str_deathMsg1 db 049h
    db 06Eh, 020h, 074h, 068h, 065h, 020h, 077h, 061h, 06Bh, 065h, 020h, 06Fh, 066h, 020h, 074h, 068h
    db 065h, 020h, 068h, 06Fh, 072h, 072h, 069h, 062h, 06Ch, 065h, 020h, 063h, 072h, 061h, 073h, 068h
    db 02Ch, 000h
_str_deathMsg2 equ str_deathMsg2
str_deathMsg2 db 079h
    db 06Fh, 075h, 072h, 020h, 066h, 061h, 06Dh, 069h, 06Ch, 079h, 020h, 061h, 06Eh, 064h, 020h, 066h
    db 072h, 069h, 065h, 06Eh, 064h, 073h, 020h, 06Dh, 06Fh, 075h, 072h, 06Eh, 020h, 079h, 06Fh, 075h
    db 072h, 020h, 06Ch, 06Fh, 073h, 073h, 02Eh, 000h
_str_promoPic equ str_promoPic
str_promoPic db 070h
    db 072h, 06Fh, 06Dh, 06Fh, 02Eh, 070h, 069h, 063h, 000h
_str_promoMsg1 equ str_promoMsg1
str_promoMsg1 db 046h
    db 06Fh, 072h, 020h, 079h, 06Fh, 075h, 072h, 020h, 063h, 06Fh, 06Eh, 073h, 069h, 073h, 074h, 065h
    db 06Eh, 074h, 06Ch, 079h, 020h, 073h, 075h, 063h, 063h, 065h, 073h, 073h, 066h, 075h, 06Ch, 020h
    db 06Dh, 069h, 073h, 073h, 069h, 06Fh, 06Eh, 073h, 02Ch, 000h
_str_promoMsg2 equ str_promoMsg2
str_promoMsg2 db 079h
    db 06Fh, 075h, 020h, 068h, 061h, 076h, 065h, 020h, 062h, 065h, 065h, 06Eh, 020h, 070h, 072h, 06Fh
    db 06Dh, 06Fh, 074h, 065h, 064h, 020h, 074h, 06Fh, 020h, 000h
_str_medalPic equ str_medalPic
str_medalPic db 06Dh
    db 065h, 064h, 061h, 06Ch, 02Eh, 070h, 069h, 063h, 000h
_str_medalMsg1 equ str_medalMsg1
str_medalMsg1 db 046h
    db 06Fh, 072h, 020h, 079h, 06Fh, 075h, 072h, 020h, 06Fh, 075h, 074h, 073h, 074h, 061h, 06Eh, 064h
    db 069h, 06Eh, 067h, 020h, 070h, 065h, 072h, 066h, 06Fh, 072h, 06Dh, 061h, 06Eh, 063h, 065h, 02Ch
    db 020h, 079h, 06Fh, 075h, 020h, 072h, 065h, 063h, 065h, 069h, 076h, 065h, 000h
_str_medalMsg2 equ str_medalMsg2
str_medalMsg2 db 074h
    db 068h, 065h, 020h, 000h
_ps_var86_target db 000h, 000h, 000h, 000h
_awardColor db 007h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_awardFont db 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_awardPage dw offset _ps_var86_target
_ps_var86_2 db 000h, 000h, 000h, 000h, 009h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
    dw offset _ps_var86_2
_rankNames dw offset _str_emptyRank
    dw offset _str_1stLt
    dw offset _str_captain
    dw offset _str_major
    dw offset _str_ltColonel
    dw offset _str_colonel
    dw offset _str_general
_promoScores dw 05DCh  ; 1500 - first rank score threshold
_promoThresholds dw 0000h
    dd 6000, 12000, 25000, 50000, 100000
_medalNames dw offset _str_afcm
    dw offset _str_dfc
    dw offset _str_silverStar
    dw offset _str_afc
    dw offset _str_cmoh
_medalScores dw 03E8h  ; 1000 - first medal score threshold
_medalThresholds dw 0000h
    dd 2500, 4000, 6400, 7800
    db 004h, 003h, 003h, 002h, 007h, 005h, 003h, 002h, 008h, 007h, 004h, 002h, 008h, 006h, 005h
    db 003h
_dat_1c8e db 006h, 000h, 09Dh, 000h, 0DBh, 000h, 0BDh, 000h, 0D9h, 000h, 093h, 000h, 039h, 000h, 002h
    db 000h, 078h, 000h, 087h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 08Dh, 000h, 000h
    db 000h
_mapViewX1 db 008h
    db 000h
_mapViewY1 db 00Ah
    db 000h
_mapViewX2 db 0E8h
    db 000h
_mapViewY2 db 0B2h
    db 000h
_str_pressExit equ str_pressExit
str_pressExit db 050h
    db 072h, 065h, 073h, 073h, 020h, 053h, 065h, 06Ch, 065h, 063h, 074h, 06Fh, 072h, 020h, 074h, 06Fh
    db 020h, 065h, 078h, 069h, 074h, 020h, 044h, 065h, 062h, 072h, 069h, 065h, 066h, 069h, 06Eh, 067h
    db 000h
_str_dot1 equ str_dot1
str_dot1 db 08Dh
    db 000h
_str_overall1 equ str_overall1
str_overall1 db 04Fh
    db 056h, 045h, 052h, 041h, 04Ch, 04Ch, 000h
_str_missionRating1 equ str_missionRating1
str_missionRating1 db 04Dh
    db 049h, 053h, 053h, 049h, 04Fh, 04Eh, 020h, 052h, 041h, 054h, 049h, 04Eh, 047h, 000h
_str_dot2 equ str_dot2
str_dot2 db 080h
    db 000h
_str_trainingScore equ str_trainingScore
str_trainingScore db 084h
    db 054h, 072h, 061h, 069h, 06Eh, 069h, 06Eh, 067h, 020h, 053h, 063h, 06Fh, 072h, 065h, 000h
_str_notRecorded equ str_notRecorded
str_notRecorded db 04Eh
    db 04Fh, 054h, 020h, 052h, 065h, 063h, 06Fh, 072h, 064h, 065h, 064h, 020h, 021h, 000h
_str_dot3 equ str_dot3
str_dot3 db 08Dh
    db 000h
_str_careerTotal equ str_careerTotal
str_careerTotal db 043h
    db 041h, 052h, 045h, 045h, 052h, 020h, 054h, 04Fh, 054h, 041h, 04Ch, 000h
_str_dot4 equ str_dot4
str_dot4 db 080h
    db 000h
_str_missionSummary equ str_missionSummary
str_missionSummary db 04Dh
    db 049h, 053h, 053h, 049h, 04Fh, 04Eh, 020h, 053h, 055h, 04Dh, 04Dh, 041h, 052h, 059h, 000h
_str_priSecTargets equ str_priSecTargets
str_priSecTargets db 050h
    db 072h, 069h, 02Fh, 053h, 065h, 063h, 020h, 054h, 061h, 072h, 067h, 065h, 074h, 073h, 000h
_str_otherTargets equ str_otherTargets
str_otherTargets db 04Fh
    db 074h, 068h, 065h, 072h, 020h, 054h, 061h, 072h, 067h, 065h, 074h, 073h, 000h
_str_enemyPlanes equ str_enemyPlanes
str_enemyPlanes db 045h
    db 06Eh, 065h, 06Dh, 079h, 020h, 050h, 06Ch, 061h, 06Eh, 065h, 073h, 000h
_str_friendlyTargets equ str_friendlyTargets
str_friendlyTargets db 046h
    db 072h, 069h, 065h, 06Eh, 064h, 06Ch, 079h, 020h, 054h, 061h, 072h, 067h, 065h, 074h, 073h, 000h
_str_dot5 equ str_dot5
str_dot5 db 08Dh
    db 000h
_str_overall2 equ str_overall2
str_overall2 db 04Fh
    db 056h, 045h, 052h, 041h, 04Ch, 04Ch, 000h
_str_missionRating2 equ str_missionRating2
str_missionRating2 db 04Dh
    db 049h, 053h, 053h, 049h, 04Fh, 04Eh, 020h, 052h, 041h, 054h, 049h, 04Eh, 047h, 000h
_str_dot6 equ str_dot6
str_dot6 db 080h
    db 000h
_str_missionEvent equ str_missionEvent
str_missionEvent db 04Dh
    db 049h, 053h, 053h, 049h, 04Fh, 04Eh, 020h, 045h, 056h, 045h, 04Eh, 054h, 000h
_str_time equ str_time
str_time db 054h
    db 049h, 04Dh, 045h, 03Ah, 020h, 080h, 000h
_str_destroyed4 equ str_destroyed4
str_destroyed4 db 020h
    db 000h
_str_destroyed1 equ str_destroyed1
str_destroyed1 db 020h
    db 064h, 065h, 073h, 074h, 072h, 06Fh, 079h, 065h, 064h, 000h
_str_destroyed2 equ str_destroyed2
str_destroyed2 db 020h
    db 064h, 065h, 073h, 074h, 072h, 06Fh, 079h, 065h, 064h, 000h
_str_shotDown2 equ str_shotDown2
str_shotDown2 db 020h
    db 000h
_str_shotDown equ str_shotDown
str_shotDown db 020h
    db 073h, 068h, 06Fh, 074h, 020h, 064h, 06Fh, 077h, 06Eh, 000h
_str_destroyed3 equ str_destroyed3
str_destroyed3 db 020h
    db 064h, 065h, 073h, 074h, 072h, 06Fh, 079h, 065h, 064h, 000h
_str_rearmed3 equ str_rearmed3
str_rearmed3 db 020h
    db 000h
_str_rearmed1 equ str_rearmed1
str_rearmed1 db 020h
    db 02Dh, 020h, 052h, 065h, 061h, 072h, 06Dh, 065h, 064h, 02Fh, 052h, 065h, 066h, 075h, 065h, 06Ch
    db 065h, 064h, 000h
_str_rearmed2 equ str_rearmed2
str_rearmed2 db 020h
    db 02Dh, 020h, 052h, 065h, 061h, 072h, 06Dh, 065h, 064h, 02Fh, 052h, 065h, 066h, 075h, 065h, 06Ch
    db 065h, 064h, 000h
_str_hitBy equ str_hitBy
str_hitBy db 048h
    db 069h, 074h, 020h, 062h, 079h, 020h, 000h
_str_missile equ str_missile
str_missile db 020h
    db 06Dh, 069h, 073h, 073h, 069h, 06Ch, 065h, 000h
_str_takeoffPoint equ str_takeoffPoint
str_takeoffPoint db 054h
    db 061h, 06Bh, 065h, 06Fh, 066h, 066h, 020h, 070h, 06Fh, 069h, 06Eh, 074h, 03Ah, 000h
_str_missionEnd equ str_missionEnd
str_missionEnd db 04Dh
    db 069h, 073h, 073h, 069h, 06Fh, 06Eh, 020h, 065h, 06Eh, 064h, 03Ah, 00Ah, 000h
_str_crashed equ str_crashed
str_crashed db 043h
    db 072h, 061h, 073h, 068h, 065h, 064h, 000h
_str_goodBailout equ str_goodBailout
str_goodBailout db 047h
    db 06Fh, 06Fh, 064h, 020h, 042h, 061h, 069h, 06Ch, 06Fh, 075h, 074h, 000h
_str_captured equ str_captured
str_captured db 043h
    db 061h, 070h, 074h, 075h, 072h, 065h, 064h, 000h
_str_bailedDied equ str_bailedDied
str_bailedDied db 042h
    db 061h, 069h, 06Ch, 065h, 064h, 020h, 026h, 020h, 044h, 069h, 065h, 064h, 000h
_str_goodLanding equ str_goodLanding
str_goodLanding db 047h
    db 06Fh, 06Fh, 064h, 020h, 04Ch, 061h, 06Eh, 064h, 069h, 06Eh, 067h, 000h
_str_primaryObj equ str_primaryObj
str_primaryObj db 08Ch
    db 050h, 052h, 049h, 04Dh, 041h, 052h, 059h, 020h, 04Fh, 042h, 04Ah, 045h, 043h, 054h, 049h, 056h
    db 045h, 000h
_str_secndryObj equ str_secndryObj
str_secndryObj db 08Ch
    db 053h, 045h, 043h, 04Eh, 044h, 052h, 059h, 020h, 04Fh, 042h, 04Ah, 045h, 043h, 054h, 049h, 056h
    db 045h, 000h
_str_cumulative2 equ str_cumulative2
str_cumulative2 db 08Dh
    db 000h
_str_cumulative equ str_cumulative
str_cumulative db 043h
    db 055h, 04Dh, 055h, 04Ch, 041h, 054h, 049h, 056h, 045h, 000h
_str_missionRating3 equ str_missionRating3
str_missionRating3 db 04Dh
    db 049h, 053h, 053h, 049h, 04Fh, 04Eh, 020h, 052h, 041h, 054h, 049h, 04Eh, 047h, 000h
_str_pressSelect equ str_pressSelect
str_pressSelect db 080h
    db 000h
_str_pressNext equ str_pressNext
str_pressNext db 050h
    db 072h, 065h, 073h, 073h, 020h, 053h, 065h, 06Ch, 065h, 063h, 074h, 06Fh, 072h, 020h, 066h, 06Fh
    db 072h, 020h, 06Eh, 065h, 078h, 074h, 020h, 06Dh, 069h, 073h, 073h, 069h, 06Fh, 06Eh, 020h, 065h
    db 076h, 065h, 06Eh, 074h, 000h
str_inFlight db 080h
    db 049h, 06Eh, 02Dh, 046h, 06Ch, 069h, 067h, 068h, 074h, 000h
_str_inFlight equ str_inFlight
str_timeLabel db 08Dh
    db 054h, 049h, 04Dh, 045h, 03Ah, 020h, 080h, 000h
_str_timeLabel equ str_timeLabel
str_timeZeros db 080h
    db 000h
_str_timeZeros equ str_timeZeros
str_timeFormat db 030h
    db 030h, 03Ah, 030h, 030h, 03Ah, 030h, 030h, 000h
_str_timeFormat equ str_timeFormat
_popupSpriteY db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 000h, 028h, 000h, 028h
    db 000h, 028h, 000h, 028h, 000h, 028h, 000h, 050h, 000h, 050h, 000h, 050h, 000h, 050h, 000h, 050h
    db 000h, 050h, 000h
_popupSpriteX db 000h
    db 000h, 030h, 000h, 060h, 000h, 090h, 000h, 0C0h, 000h, 0F0h, 000h, 000h, 000h, 030h, 000h, 060h
    db 000h, 090h, 000h, 0C0h, 000h, 0F0h, 000h, 000h, 000h, 030h, 000h, 060h, 000h, 090h, 000h, 0C0h
    db 000h, 0F0h, 000h
str_libya_spr db 'libya.spr', 0
str_persian_spr db 'persian.spr', 0
str_vn_spr db 'vn.spr', 0
str_me_spr db 'me.spr', 0
str_ncape_spr db 'ncape.spr', 0
str_ceurope_spr db 'ceurope.spr', 0
str_jp_spr db 'jp.spr', 0
str_na_spr db 'na.spr', 0
str_reviewMission db 'Review Mission', 0
str_exitDebriefing db 'Exit Debriefing', 0
str_modeRb1 db 072h
    db 062h, 000h
str_insertScenario db 050h
    db 06Ch, 065h, 061h, 073h, 065h, 020h, 069h, 06Eh, 073h, 065h, 072h, 074h, 020h, 073h, 063h, 065h
    db 06Eh, 061h, 072h, 069h, 06Fh, 020h, 064h, 069h, 073h, 06Bh, 000h
str_pressKey1 db 03Ch
    db 050h, 072h, 065h, 073h, 073h, 020h, 061h, 020h, 06Bh, 065h, 079h, 020h, 077h, 068h, 065h, 06Eh
    db 020h, 072h, 065h, 061h, 064h, 079h, 03Eh, 000h
str_modeRb2 db 072h
    db 062h, 000h
str_dbicons1 db 064h
    db 062h, 069h, 063h, 06Fh, 06Eh, 073h, 02Eh, 073h, 070h, 072h, 000h
str_insertDiskA db 050h
    db 06Ch, 065h, 061h, 073h, 065h, 020h, 069h, 06Eh, 073h, 065h, 072h, 074h, 020h, 046h, 031h, 035h
    db 020h, 044h, 069h, 073h, 06Bh, 020h, 041h, 000h
str_pressKey2 db 03Ch
    db 050h, 072h, 065h, 073h, 073h, 020h, 061h, 020h, 06Bh, 065h, 079h, 020h, 077h, 068h, 065h, 06Eh
    db 020h, 072h, 065h, 061h, 064h, 079h, 03Eh, 000h
str_dbicons2 db 064h
    db 062h, 069h, 063h, 06Fh, 06Eh, 073h, 02Eh, 073h, 070h, 072h, 000h
str_missionDebrief db 020h
    db 020h, 04Dh, 049h, 053h, 053h, 049h, 04Fh, 04Eh, 020h, 044h, 045h, 042h, 052h, 049h, 045h, 046h
    db 049h, 04Eh, 047h, 000h, 000h
_pageStruct dw 0000h, 0000h, 0002h, 000Fh, 0000h, 0000h, 0001h, 0000h, 0000h, 0000h, 0000h
_var_99 dw offset _pageStruct
_pageStruct2 db 000h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h
_var_100 dw offset _pageStruct2
_ps_101 label byte
_var_101 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 008h, 000h, 00Ah, 000h, 0E0h, 000h, 0A8h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
_var_102 dw offset _ps_101
_ps_103 label byte
_var_103 db 000h
    db 000h, 000h, 000h, 0B2h, 000h, 000h, 000h, 000h, 000h, 0B2h, 000h, 040h, 001h, 015h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
_var_104 dw offset _ps_103
_ps_105 label byte
_var_105 db 000h
    db 000h, 02Dh, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
_spriteAir label word
spriteAir dw offset _ps_105
_ps_106 label byte
_var_106 db 000h
    db 000h, 02Dh, 001h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
spriteAirBlink dw offset _ps_106
_spriteAirBlink equ spriteAirBlink
_ps_107 label byte
_var_107 db 000h
    db 000h, 023h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
_spriteSam label word
spriteSam dw offset _ps_107
_ps_108 label byte
_var_108 db 000h
    db 000h, 023h, 001h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
spriteSamBlink dw offset _ps_108
_spriteSamBlink equ spriteSamBlink
_ps_109 label byte
_var_109 db 000h
    db 000h, 017h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
_spriteGround label word
spriteGround dw offset _ps_109
_ps_110 label byte
_var_110 db 000h
    db 000h, 017h, 001h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
spriteGroundBlink dw offset _ps_110
_spriteGroundBlink equ spriteGroundBlink
_ps_111 label byte
_var_111 db 000h
    db 000h, 01Eh, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
    dw offset _ps_111
_ps_112 label byte
_var_112 db 000h
    db 000h, 01Eh, 001h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
    dw offset _ps_112
_ps_113 label byte
_var_113 db 000h
    db 000h, 02Ah, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 001h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
_spriteWaypoint label word
spriteWaypoint dw offset _ps_113
_var_114 db 000h
    db 000h, 02Ah, 001h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 001h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
spriteWaypointBlink dw offset _var_114
_spriteWaypointBlink equ spriteWaypointBlink
dat_21e4 db 0ECh
    db 000h, 096h, 000h, 03Ch, 001h, 09Fh, 000h, 0ECh, 000h, 096h, 000h, 03Ch, 001h, 09Fh, 000h, 000h
    db 000h, 069h, 000h, 098h, 000h, 008h, 000h, 011h, 001h, 039h, 000h, 007h, 000h
    dw offset _pageStruct2
    db 01Ah
    db 000h, 007h, 000h, 0FAh, 000h, 03Ch, 000h
    dw offset _ps_105
    dw offset _ps_106
    db 000h, 000h
_var_115 db 000h
    db 000h, 008h, 018h, 0ECh, 000h, 0A0h, 000h, 03Ch, 001h, 0A9h, 000h, 0ECh, 000h, 0A0h, 000h, 03Ch
    db 001h, 0A9h, 000h, 000h, 000h, 069h, 000h, 098h, 000h, 008h, 000h, 011h, 001h, 039h, 000h, 007h
    db 000h
    dw offset _pageStruct2
    db 01Ah, 000h, 007h, 000h, 0FAh, 000h, 03Ch, 000h
    dw offset _ps_105
    dw offset _ps_106
    db 000h
    db 000h, 000h, 000h, 00Fh, 008h
_pageStruct3 db 000h, 000h, 00Ah, 000h, 0FAh, 000h, 0FAh, 000h, 097h, 000h, 0A1h
    db 000h
_var_116 dw offset _pageStruct3
_var_117 dw offset str_libya_spr
    dw offset str_persian_spr
    dw offset str_vn_spr
    dw offset str_me_spr
    dw offset str_ncape_spr
    dw offset str_ceurope_spr
    dw offset str_jp_spr
    dw offset str_na_spr
_var_118 dw offset str_reviewMission
    dw offset str_exitDebriefing
_var_119 db 000h
    db 000h
_var_120 db 000h
    db 000h
_var_121 db 0A9h
    db 04Ah
_var_122 db 000h
    db 000h, 080h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
dat_22C0 db 070h
    db 022h
_str_cFileInfo db ';C_FILE_INFO', 0
_var_123 db 000h
    db 000h
_var_124 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_125 db 000h
    db 000h
_var_126 db 000h
    db 000h, 000h, 000h
_var_127 db 000h
    db 000h
_var_128 db 000h
    db 000h, 000h
_var_129 db 000h
    db 000h
_var_130 db 014h
    db 000h
_var_131 db 081h
    db 081h, 081h, 001h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h
_var_132 db 000h
    db 000h
_var_133 db 000h
    db 000h
_var_134 db 000h
    db 000h, 008h, 023h, 080h, 005h, 043h, 000h, 000h, 000h
_var_135 db 000h
_var_136 db 000h
_var_137 db 000h
    db 000h, 000h, 000h
_dat_2312 db 05Ch, 000h
_dat_2314 db 05Ch, 000h
_randSeed db 001h
    db 000h
_randState db 000h
    db 000h
_var_140 db 000h
    db 000h
_dat_231c db 000h, 016h, 002h, 002h, 018h, 00Dh, 009h, 00Ch, 00Ch, 00Ch, 007h, 008h, 016h, 016h, 0FFh
    db 012h, 00Dh, 012h, 002h, 0FFh
_fileHandleTable label byte
    db 20*8 dup(0)
_var_141 db 001h
    db 000h, 000h, 002h
_var_142 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h
_var_143 dw offset _fileHandleTable + 098h
_var_144 db 000h
    db 000h
dat_244C db 000h
    db 000h
dat_244E db 000h
    db 000h, 000h, 000h
dat_2452 db 000h
    db 000h, 000h, 000h, 000h
_var_145 db 000h
_var_145_heapDS db 000h, 000h, 000h
_var_145_heapSeg db 000h, 000h, 000h, 000h
    db 020h, 000h
_var_145_heapCount db 000h, 000h, 000h
_var_146 db 0D0h
    db 05Dh, 000h, 000h
_var_147 db 000h
    db 000h
_var_148 db 000h
    db 000h
_var_149 db 000h
    db 000h, 000h, 000h
_var_150 db 000h
    db 000h, 000h, 000h
_nmsgTable dw 0
str_nmsg db 03Ch
    db 03Ch, 04Eh, 04Dh, 053h, 047h, 03Eh, 03Eh
_nmsgEntries db 000h, 000h, 052h, 036h, 030h, 030h, 030h, 00Dh, 00Ah
    db 02Dh, 020h, 073h, 074h, 061h, 063h, 06Bh, 020h, 06Fh, 076h, 065h, 072h, 066h, 06Ch, 06Fh, 077h
    db 00Dh, 00Ah, 000h, 003h, 000h, 052h, 036h, 030h, 030h, 033h, 00Dh, 00Ah, 02Dh, 020h, 069h, 06Eh
    db 074h, 065h, 067h, 065h, 072h, 020h, 064h, 069h, 076h, 069h, 064h, 065h, 020h, 062h, 079h, 020h
    db 030h, 00Dh, 00Ah, 000h, 009h, 000h, 052h, 036h, 030h, 030h, 039h, 00Dh, 00Ah, 02Dh, 020h, 06Eh
    db 06Fh, 074h, 020h, 065h, 06Eh, 06Fh, 075h, 067h, 068h, 020h, 073h, 070h, 061h, 063h, 065h, 020h
    db 066h, 06Fh, 072h, 020h, 065h, 06Eh, 076h, 069h, 072h, 06Fh, 06Eh, 06Dh, 065h, 06Eh, 074h, 00Dh
    db 00Ah, 000h, 0FCh, 000h, 00Dh, 00Ah, 000h, 0FFh, 000h, 072h, 075h, 06Eh, 02Dh, 074h, 069h, 06Dh
    db 065h, 020h, 065h, 072h, 072h, 06Fh, 072h, 020h, 000h, 002h, 000h, 052h, 036h, 030h, 030h, 032h
    db 00Dh, 00Ah, 02Dh, 020h, 066h, 06Ch, 06Fh, 061h, 074h, 069h, 06Eh, 067h, 020h, 070h, 06Fh, 069h
    db 06Eh, 074h, 020h, 06Eh
_nmsgNotLoaded db 06Fh, 074h, 020h, 06Ch, 06Fh, 061h, 064h, 065h, 064h, 00Dh, 00Ah, 000h
    db 001h, 000h, 052h, 036h, 030h, 030h, 031h, 00Dh, 00Ah, 02Dh, 020h, 06Eh, 075h, 06Ch, 06Ch, 020h
    db 070h, 06Fh, 069h, 06Eh, 074h, 065h, 072h, 020h, 061h, 073h, 073h, 069h, 067h, 06Eh, 06Dh, 065h
    db 06Eh, 074h, 00Dh, 00Ah, 000h, 0FFh, 0FFh, 0FFh

.DATA?
; --- BSS ---

    db 1 dup(?)
_var_151 db 2 dup(?)
_var_152 db 2 dup(?)
_var_153 db 2 dup(?)
_var_154 db 2 dup(?)
_var_155 db 2 dup(?)
_var_156 db ?
_var_157 db ?
_var_158 db ?
_var_159 db ?
_var_160 db 2 dup(?)
_var_161 db 2 dup(?)
_var_162 db 2 dup(?)
_var_163 db ?
_var_164 db ?
_var_165 db 2 dup(?)
_var_166 db 423 dup(?)
dat_270f db 90 dup(?)
dat_2769 db ?
_var_167 db 2 dup(?)
_var_168 db 6142 dup(?)
dat_3F6A db ?
dat_3F6B db ?
dat_3F6C db 2 dup(?)
dat_3F6E db 2 dup(?)
dat_3F70 db ?
dat_3F71 db ?
_var_3f72 db 64 dup(?)
dat_3FB2 db 2 dup(?)
dat_3FB4 db 2 dup(?)
dat_3FB6 db 2 dup(?)
dat_3FB8 db 2 dup(?)
_colorTablePtr db 2 dup(?)
_inputChanged db 2 dup(?)
_colorAnimIdx db 2 dup(?)
_colorAnimEnabled db 2 dup(?)
_joyRepeatFlag db ?
_spriteToggle db ?
_animDone db 2 dup(?)
_var_3fc6 db 10 dup(?)
_textBuf db 100 dup(?)
dat_4034 db 4 dup(?)
_worldBufHandle db 2 dup(?)
_gameData db 2 dup(?)
_var_179 db 4 dup(?)
dat_4040 db 516 dup(?)
_var_180 db 2 dup(?)
dat_4246 db 2 dup(?)
_samKilled db 2 dup(?)
_samMissed db 4 dup(?)
_dat_424e equ dat_424e
dat_424e db 8 dup(?)
_slotInfoTable label byte
_var_183x db 6 dup(?)
_var_425c db 1188 dup(?)
_gridFlags db 256 dup(?)
_target1Type db 4 dup(?)
_dat_4804 equ dat_4804
dat_4804 db 4 dup(?)
_target1MiscBits db 10 dup(?)
_target2Type db 8 dup(?)
_target2MiscBits db 10 dup(?)
_scoreString db 512 dup(?)
scoreString equ _scoreString
_dat_4824 equ _scoreString
_hasVgaMode db 4 dup(?)
_curRecordIdx label word
_var_190x db 2 dup(?)
dat_4a2a db 720 dup(?)
_hercFlag db 518 dup(?)
_var_192 db 2 dup(?)
_var_193 db 2 dup(?)
_flightRecords label byte
_var_194 db ?
_var_195 db ?
_var_196 db ?
_var_197 db 1531 dup(?)
_selectedMenuItem db 6 dup(?)
_groundKilled db 2 dup(?)
_groundMissed db 2 dup(?)
_missionResult db 3 dup(?)
_enterPressed db ?
_var_203 db 2 dup(?)
dat_5512 db 102 dup(?)
_unitTypeTable db 100 dup(?)
_var_205 db 2 dup(?)
dat_55de db 2 dup(?)
_worldDataReady db 14 dup(?)
_ejectedFlag db 2 dup(?)
_lastDrawX db 2 dup(?)
_prevDrawX db 2 dup(?)
_cursorX label byte
_var_210x db 4 dup(?)
_lastDrawY db 2 dup(?)
_cursorY label byte
_var_212x db 2 dup(?)
_prevDrawY db 2 dup(?)
_popupVisible db 2 dup(?)
_primaryHit db 2 dup(?)
_var_216 db 6 dup(?)
PUBLIC _worldStrings
_worldStrings db 200 dup(?)
PUBLIC _worldStringBuf
_worldStringBuf db 750 dup(?)
_missionScore db 2 dup(?)
_missionScoreHi db 2 dup(?)
_secondaryHit db 242 dup(?)
dat_5ab4 db 2 dup(?)
_commData db 2 dup(?)
_commData_seg db 2 dup(?)
_airKilled db 4 dup(?)
_airMissed db 2 dup(?)
_gfxBufSeg db 514 dup(?)
_popupX db 2 dup(?)
_popupY db 2 dup(?)
_spriteBufSeg db 2 dup(?)
_vgaBufSeg db 2 dup(?)
_vgaBufOffset db 2 dup(?)
_vgaBufSeg2 db ?

__bss_end label byte

; Stack size must match the original (0x800 = 2048 bytes)
__stack_top equ __bss_end + 0800h

END
