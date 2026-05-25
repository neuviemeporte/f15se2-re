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
EXTRN _str_emptyRank:BYTE
EXTRN _str_1stLt:BYTE
EXTRN _str_captain:BYTE
EXTRN _str_major:BYTE
EXTRN _str_ltColonel:BYTE
EXTRN _str_colonel:BYTE
EXTRN _str_general:BYTE
EXTRN _str_afcm:BYTE
EXTRN _str_dfc:BYTE
EXTRN _str_silverStar:BYTE
EXTRN _str_afc:BYTE
EXTRN _str_cmoh:BYTE
EXTRN _str_deskPic:BYTE
EXTRN _str_deskMsg1:BYTE
EXTRN _str_deskMsg2:BYTE
EXTRN _str_deathPic:BYTE
EXTRN _str_deathMsg1:BYTE
EXTRN _str_deathMsg2:BYTE
EXTRN _str_promoPic:BYTE
EXTRN _str_promoMsg1:BYTE
EXTRN _str_promoMsg2:BYTE
EXTRN _str_medalPic:BYTE
EXTRN _str_medalMsg1:BYTE
EXTRN _str_medalMsg2:BYTE
EXTRN _rankNames:WORD
EXTRN _medalNames:WORD
EXTRN _str_allocError:BYTE
EXTRN _str_deallocError:BYTE
EXTRN _str_pressExit:BYTE
EXTRN _str_dot1:BYTE
EXTRN _str_overall1:BYTE
EXTRN _str_missionRating1:BYTE
EXTRN _str_dot2:BYTE
EXTRN _str_trainingScore:BYTE
EXTRN _str_notRecorded:BYTE
EXTRN _str_dot3:BYTE
EXTRN _str_careerTotal:BYTE
EXTRN _str_dot4:BYTE
EXTRN _str_missionSummary:BYTE
EXTRN _str_priSecTargets:BYTE
EXTRN _str_otherTargets:BYTE
EXTRN _str_enemyPlanes:BYTE
EXTRN _str_friendlyTargets:BYTE
EXTRN _str_dot5:BYTE
EXTRN _str_overall2:BYTE
EXTRN _str_missionRating2:BYTE
EXTRN _str_dot6:BYTE
EXTRN _str_missionEvent:BYTE
EXTRN _str_time:BYTE
EXTRN _str_destroyed4:BYTE
EXTRN _str_destroyed1:BYTE
EXTRN _str_destroyed2:BYTE
EXTRN _str_shotDown2:BYTE
EXTRN _str_shotDown:BYTE
EXTRN _str_destroyed3:BYTE
EXTRN _str_rearmed3:BYTE
EXTRN _str_rearmed1:BYTE
EXTRN _str_rearmed2:BYTE
EXTRN _str_hitBy:BYTE
EXTRN _str_missile:BYTE
EXTRN _str_takeoffPoint:BYTE
EXTRN _str_missionEnd:BYTE
EXTRN _str_crashed:BYTE
EXTRN _str_goodBailout:BYTE
EXTRN _str_captured:BYTE
EXTRN _str_bailedDied:BYTE
EXTRN _str_goodLanding:BYTE
EXTRN _str_primaryObj:BYTE
EXTRN _str_secndryObj:BYTE
EXTRN _str_cumulative2:BYTE
EXTRN _str_cumulative:BYTE
EXTRN _str_missionRating3:BYTE
EXTRN _str_pressSelect:BYTE
EXTRN _str_pressNext:BYTE
EXTRN _str_inFlight:BYTE
EXTRN _str_timeLabel:BYTE
EXTRN _str_timeZeros:BYTE
EXTRN _str_timeFormat:BYTE

PUBLIC _gfx_jump_05_drawString
PUBLIC _gfx_jump_2f_charWidth
PUBLIC _gfx_jump_0_alloc
PUBLIC _gfx_jump_0e_setCurBuf
PUBLIC _gfx_jump_44_setDac
PUBLIC _gfx_jump_4b_storeBufPtr
PUBLIC _gfx_jump_52
PUBLIC _gfx_jump_53
PUBLIC _var_151
PUBLIC _var_152

PUBLIC _timerHandlerInstalled
PUBLIC _randSeed
PUBLIC _randState
PUBLIC _timerCounter
PUBLIC _commData
PUBLIC _quitFlag
PUBLIC _spriteAir
PUBLIC _spriteSam
PUBLIC _spriteGround
PUBLIC _spriteWaypoint
PUBLIC _nightMission
PUBLIC _gfx_jump_11_blitSprite
PUBLIC _gfx_jump_21
PUBLIC _gfx_jump_29_switchColor
PUBLIC _gfx_jump_2a
PUBLIC _clearRect
PUBLIC _mystrcat
PUBLIC _var_102
PUBLIC _samDataTable
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
PUBLIC _promoScores
PUBLIC _promoThresholds
PUBLIC _medalScores
PUBLIC _medalThresholds
PUBLIC _gfx_jump_3d_null
PUBLIC _gfx_jump_50
PUBLIC _gfx_jump_45_retrace
PUBLIC _gfx_jump_46_retrace2

; --- Code segment ---

EXTRN _main:PROC

PUBLIC _timerCounter2
PUBLIC _timerCounter3
PUBLIC _spriteAirBlink
PUBLIC _spriteSamBlink
PUBLIC _spriteGroundBlink
PUBLIC _spriteWaypointBlink
PUBLIC _pollJoystick
PUBLIC _gameData
PUBLIC _joyAxisY
PUBLIC _joyAxisX
PUBLIC _gfxBufSeg

main equ _main

checkQuitFlag equ _checkQuitFlag

PUBLIC _initGraphics
_initGraphics:
initGraphics proc near
    push BP
    mov BP,SP
    sub SP,10h
    call _seedRandom
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

PUBLIC _dat_4034
_dat_4034 equ dat_4034
PUBLIC _dat_4040
_dat_4040 equ dat_4040
PUBLIC _dat_4246
_dat_4246 equ dat_4246
PUBLIC _dat_4a2a
_dat_4a2a equ dat_4a2a
PUBLIC _dat_5512
_dat_5512 equ dat_5512
PUBLIC _dat_55de
_dat_55de equ dat_55de
PUBLIC _dat_5ab4
_dat_5ab4 equ dat_5ab4
PUBLIC _dat_0042
_dat_0042 equ dat_0042
PUBLIC _var_203
PUBLIC _var_216

readWorldData equ _readWorldData

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

EXTRN _readFromWorldBuf:PROC
EXTRN _readFromWorldFile:PROC
readFromWorldBuf equ _readFromWorldBuf
readFromWorldFile equ _readFromWorldFile

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
    call clearDirtyRects
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
    call clearDirtyRects
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

; --- shared graphics routines
dirtyRectMin     EQU _var_37
dirtyRectMax     EQU _var_38
dirtyMinBuf      EQU _var_35
dirtyMaxBuf      EQU _var_36
lineX1           EQU _var_31
lineY1           EQU _var_33
lineX2           EQU _var_32
lineY2           EQU _var_34
clipDx           EQU _var_40
clipDy           EQU _var_42
clipDxHalf       EQU _var_44
clipDyHalf       EQU _var_45
clipOutcode      EQU _var_39
clipMaxX         EQU _var_46
clipMaxY         EQU _var_47
clipDivZeroHandler EQU _var_26
CALL_GFX_1F MACRO
    call far ptr gfx_jump_1f
ENDM
INCLUDE shared_gfx.inc
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

; --- shared Ctrl+Break handler
PUBLIC _installCBreakHandler
PUBLIC _restoreCbreakHandler
cbreakSavedSeg   EQU _var_58
cbreakSavedOfs   EQU _var_59
cbreakFlag       EQU _quitFlag
INCLUDE shared_cbreak.inc
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

loadFileSection equ _loadFileSection

loadFileSectionEx equ _loadFileSectionEx

openFileRead equ _openFileRead

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

PUBLIC _fileClose
_fileClose:
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

EXTRN _loadTheaterIndex:NEAR
loadTheaterIndex equ _loadTheaterIndex

processMenuItems equ _processMenuItems

selectMenuItem equ _selectMenuItem

blinkWidget equ _blinkWidget

isPointInRect equ _isPointInRect

processDebriefInput equ _processDebriefInput

drawMenuItem equ _drawMenuItem

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

PUBLIC _debriefMainLoop
_debriefMainLoop:
debriefMainLoop proc near
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
    call selectMenuItem
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
debriefMainLoop endp

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


pollJoystick proc far
_pollJoystick equ pollJoystick
    call readJoyPort
    mov BX,0h
    call normalizeJoyAxis
    mov BX,1h
    call normalizeJoyAxis
    mov AX,word ptr [_joyAxisX]
    retf
pollJoystick endp

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

normalizeJoyAxis proc near
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
normalizeJoyAxis endp

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
EXTRN _popupSpriteY:BYTE
EXTRN _popupSpriteX:BYTE
EXTRN _mapViewX1:BYTE
EXTRN _mapViewY1:BYTE
EXTRN _mapViewX2:BYTE
EXTRN _mapViewY2:BYTE
EXTRN _dat_1c8e:BYTE
EXTRN _textBuf:BYTE
EXTRN _unitTypeTable:BYTE
EXTRN _gridFlags:BYTE
EXTRN _target1Type:BYTE
EXTRN _target1MiscBits:BYTE
EXTRN _target2Type:BYTE
EXTRN _target2MiscBits:BYTE
EXTRN _scoreString:BYTE
EXTRN _samKilled:BYTE
EXTRN _samMissed:BYTE
EXTRN _groundKilled:BYTE
EXTRN _groundMissed:BYTE
EXTRN _airKilled:BYTE
EXTRN _airMissed:BYTE
EXTRN _selectedMenuItem:BYTE
EXTRN _missionResult:BYTE
EXTRN _enterPressed:BYTE
EXTRN _lastDrawX:BYTE
EXTRN _prevDrawX:BYTE
EXTRN _lastDrawY:BYTE
EXTRN _prevDrawY:BYTE
EXTRN _popupVisible:BYTE
EXTRN _primaryHit:BYTE
EXTRN _missionScore:BYTE
EXTRN _missionScoreHi:BYTE
EXTRN _secondaryHit:BYTE
EXTRN _ejectedFlag:BYTE
EXTRN _popupX:BYTE
EXTRN _popupY:BYTE
EXTRN _worldDataReady:BYTE
EXTRN _worldStrings:BYTE
EXTRN _worldStringBuf:BYTE
EXTRN _worldBufHandle:BYTE
EXTRN _spriteBufSeg:BYTE
EXTRN _vgaBufSeg:BYTE
EXTRN _vgaBufOffset:BYTE
EXTRN _vgaBufSeg2:BYTE
EXTRN _colorTablePtr:BYTE
EXTRN _inputChanged:BYTE
EXTRN _colorAnimIdx:BYTE
EXTRN _colorAnimEnabled:BYTE
EXTRN _joyRepeatFlag:BYTE
EXTRN _spriteToggle:BYTE
EXTRN _animDone:BYTE
EXTRN _curRecordIdx:BYTE
EXTRN _dat_424e:BYTE
EXTRN _var_425c:BYTE
EXTRN _dat_4804:BYTE
EXTRN _var_192:BYTE
EXTRN _var_193:BYTE
EXTRN _slotInfoTable:BYTE
EXTRN _flightRecords:BYTE
EXTRN _cursorX:BYTE
EXTRN _cursorY:BYTE
EXTRN _hercFlag:BYTE
EXTRN _hasVgaMode:BYTE

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
_gfx_jump_0_alloc equ gfx_jump_0_alloc
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
_gfx_jump_0e_setCurBuf equ gfx_jump_0e_setCurBuf
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
_gfx_jump_44_setDac equ gfx_jump_44_setDac
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
_gfx_jump_4b_storeBufPtr equ gfx_jump_4b_storeBufPtr
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
_gfx_jump_52 equ gfx_jump_52
gfx_jump_53 proc far               ; 0x11A7
    db 0EAh
    dd 0
gfx_jump_53 endp
_gfx_jump_53 equ gfx_jump_53
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
_ps_var86_target db 000h, 000h, 000h, 000h
_awardColor db 007h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_awardFont db 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_awardPage dw offset _ps_var86_target
_ps_var86_2 db 000h, 000h, 000h, 000h, 009h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
    dw offset _ps_var86_2
_promoScores dw 05DCh  ; 1500 - first rank score threshold
_promoThresholds dw 0000h
    dd 6000, 12000, 25000, 50000, 100000
_medalScores dw 03E8h  ; 1000 - first medal score threshold
_medalThresholds dw 0000h
    dd 2500, 4000, 6400, 7800
    db 004h, 003h, 003h, 002h, 007h, 005h, 003h, 002h, 008h, 007h, 004h, 002h, 008h, 006h, 005h
    db 003h

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
_var_3fc6 db 10 dup(?)
dat_4034 db 4 dup(?)
_gameData db 2 dup(?)
_var_179 db 4 dup(?)
dat_4040 db 516 dup(?)
_var_180 db 2 dup(?)
dat_4246 db 2 dup(?)
dat_4a2a db 720 dup(?)
_var_203 db 2 dup(?)
dat_5512 db 102 dup(?)
_var_205 db 2 dup(?)
dat_55de db 2 dup(?)
_var_216 db 6 dup(?)
dat_5ab4 db 2 dup(?)
_commData db 2 dup(?)
_commData_seg db 2 dup(?)
_gfxBufSeg db 514 dup(?)

__bss_end label byte

; Stack size must match the original (0x800 = 2048 bytes)
__stack_top equ __bss_end + 0800h

END
