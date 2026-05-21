.8086
DOSSEG
.MODEL SMALL
EXTRN _sub_1DBE0:PROC
EXTRN _sub_1DB9C:PROC
EXTRN _sub_155AB:PROC
EXTRN _main:PROC
EXTRN _sub_18E50:PROC
EXTRN _sub_1D1C8:PROC
EXTRN _sub_1C7A2:PROC
EXTRN _sub_1C7EA:PROC
EXTRN _sub_21A7A:PROC
EXTRN _sub_13922:PROC
EXTRN _sub_1CF8E:PROC
EXTRN _sub_11BFD:PROC
EXTRN _sub_11BC3:PROC
EXTRN _sub_114E8:PROC
EXTRN _sub_118D5:PROC
EXTRN _sub_18E38:PROC
EXTRN _sub_1957A:PROC
EXTRN _sub_19595:PROC
EXTRN _sub_13A90:PROC
EXTRN _copySomeMem:PROC
EXTRN _sub_1CF64:PROC
EXTRN _sub_1D178:PROC
EXTRN _sub_1D190:PROC
EXTRN _sub_1D200:PROC
EXTRN _sub_15540:PROC
EXTRN _sub_19BE1:PROC
EXTRN _sub_19D86:PROC
EXTRN _sub_19FAD:PROC
EXTRN _sub_19E94:PROC
EXTRN _sub_19E44:PROC
EXTRN _sub_19E5D:PROC
EXTRN _sub_1A1B1:PROC
EXTRN _sub_1A204:PROC
EXTRN _sub_1A183:PROC
EXTRN _setCommWorldbufPtr:PROC
EXTRN _sub_12278:PROC
EXTRN _fopen:PROC
EXTRN _fclose:PROC
EXTRN _fread:PROC
EXTRN _abs:PROC
EXTRN _strupr:PROC
EXTRN __chkstk:PROC
EXTRN _strcpy:PROC
EXTRN _movedata:PROC
EXTRN _segread:PROC
EXTRN _memcpy:PROC
EXTRN _getch:PROC
EXTRN _exit:PROC
EXTRN _strlen:PROC
EXTRN _int86:PROC
EXTRN _open:PROC
EXTRN _close:PROC
EXTRN _write:PROC
EXTRN _read:PROC
EXTRN _lseek:PROC
EXTRN _strcat:PROC
EXTRN _itoa:PROC
EXTRN _kbhit:PROC
EXTRN __bios_keybrd:PROC
EXTRN _labs:PROC
EXTRN _srand:PROC
EXTRN _rand:PROC
EXTRN __aNldiv:PROC
EXTRN __aNlmul:PROC
EXTRN __aNuldiv:PROC
EXTRN __aNlshl:PROC
EXTRN __aNlshr:PROC
EXTRN _flushall:PROC
EXTRN _stackavail:PROC
EXTRN _remove:PROC
EXTRN _sub_1DD5E:PROC
EXTRN _sub_1DD7E:PROC
EXTRN _sub_1DD92:PROC
EXTRN _sub_1DDAA:PROC
EXTRN _tempStrcpy:PROC
PUBLIC _createFile
PUBLIC _readFile1
PUBLIC _readFile2
PUBLIC _sub_1DF4F
PUBLIC _commData

PUBLIC _gameData
PUBLIC _hercFlag
PUBLIC _setupOverlaySlots
PUBLIC _gfxModeUnset
PUBLIC _joyAxes
PUBLIC _copyJoystickData
PUBLIC _installCBreakHandler
PUBLIC _gfxBufPtr
PUBLIC _restoreJoystickData
PUBLIC _regs
PUBLIC _exitCode
PUBLIC _restoreCBreakHandler
PUBLIC _sub_22411
PUBLIC _scenarioPlh
PUBLIC _regnStr
PUBLIC _f15DgtlResult
PUBLIC _byte_34197
PUBLIC _aCockpit_pic
PUBLIC _a256pit_pic
PUBLIC _byte_32933
PUBLIC _setupDac
PUBLIC _restoreTimerIrqHandler
PUBLIC _audio_jump_64
PUBLIC _audio_jump_65
PUBLIC _setTimerIrqHandler
PUBLIC _sub_13C3B
PUBLIC _setInt9Handler
PUBLIC _restoreInt9Handler
PUBLIC _dword_38FE2
PUBLIC _word_3C0A2
PUBLIC _flagFarToNear
PUBLIC _word_3BFA2
PUBLIC _word_3B4DC
PUBLIC _byte_3C16E
PUBLIC _word_3BEC0
PUBLIC _word_3BED0
PUBLIC _dword_3B7F8
PUBLIC _word_3B148
PUBLIC _dword_3B7DA
PUBLIC _flt15_buf1
PUBLIC _flt15_word1
PUBLIC _flt15_buf2
PUBLIC _aRb_4
PUBLIC _a_3d3_0
PUBLIC _a15flt_xxx
PUBLIC _fileHandle
PUBLIC _aOpenErrorOn_3d3_0
PUBLIC _flt15_size
PUBLIC _picBlit
PUBLIC _loadF15DgtlBin
PUBLIC _byte_3B7FC
PUBLIC _byte_3790C
PUBLIC _farPointer
PUBLIC _word_3C69E
PUBLIC _word_3B144
PUBLIC _word_3C046
PUBLIC _word_3BED2
PUBLIC _word_336FC
PUBLIC _byte_3BFA4
PUBLIC _byte_3BEC4
PUBLIC _byte_3BED8
PUBLIC _byte_3C02A
PUBLIC _word_3C00C
PUBLIC _word_38FFA
PUBLIC _unk_3B202
PUBLIC _byte_3AFAC
PUBLIC _word_3401A
PUBLIC _openFile
PUBLIC _closeFile

PUBLIC _off_38334
PUBLIC _off_3834C
PUBLIC _a_3dg
PUBLIC _byte_3A900
PUBLIC _aBadGridFileFormat_
PUBLIC _aRb_3
PUBLIC _misc_jump_5b_getkey
PUBLIC _unk_33E1A
PUBLIC _unk_34121
PUBLIC _aPleaseInsertF15DiskB
PUBLIC _sign3dg
PUBLIC _buf1_3dg
PUBLIC _buf2_3dg
PUBLIC _buf3_3dg
PUBLIC _buf4_3dg
PUBLIC _aTooMuchTileData
PUBLIC _aBadTileFileFormat_
PUBLIC _aRb_2
PUBLIC _a_3dt
PUBLIC _aTooManyTiles_
PUBLIC _sign3dt
PUBLIC _aOpenErrorOn_3dt
PUBLIC _sizes3dt
PUBLIC _matrix3dt
PUBLIC _matrix3dt_2
PUBLIC _val_3dt
PUBLIC _buf1_3dt
PUBLIC _buf2_3dt
PUBLIC _buf3_3dt
PUBLIC _buf3d3_1
PUBLIC _buf3d3_2
PUBLIC _buf3d3_3
PUBLIC _buf3d3
PUBLIC _size3d3_2
PUBLIC _a_3d3
PUBLIC _aBadObjFileFormat_
PUBLIC _size3d3_3
PUBLIC _byte_3BE3E
PUBLIC _size3d3_4
PUBLIC _size3d3_5
PUBLIC _size3d3_6
PUBLIC _aOpenErrorOn_3d3
PUBLIC _aRb
PUBLIC _sign3d3
PUBLIC _size3d3
PUBLIC _aObjectDataTooBig_
PUBLIC _byte_3BE80
PUBLIC _aObjdataOverflow
PUBLIC _word_33DD0
PUBLIC _aRb_0
PUBLIC _aRb_1
PUBLIC _size3d3_7
PUBLIC _aPhoto_3d3_0
PUBLIC _aPhoto_3d3
PUBLIC _word_3B14A
PUBLIC _sub_21444
PUBLIC _dword_3C01C
PUBLIC _dword_3B4D4
PUBLIC _keyValue
PUBLIC _word_380CE
PUBLIC _dword_3B1FE
PUBLIC _word_336FE
PUBLIC _dword_3C024
PUBLIC _word_3B4DE
PUBLIC _word_3C02C
PUBLIC _word_380C8
PUBLIC _word_3B4E4
PUBLIC _word_380CA
PUBLIC _word_380CC
PUBLIC _word_3C5AA
PUBLIC _word_3BE94
PUBLIC _stru_3A95A
PUBLIC _word_336E8
PUBLIC _word_3C028
PUBLIC _word_3C03A
PUBLIC _word_330C4
PUBLIC _sub_13B2F
PUBLIC _sub_13B96
PUBLIC _word_3419C
PUBLIC _word_339B4
PUBLIC _word_336F4
PUBLIC _stru_335C4
PUBLIC _sub_1D008
PUBLIC _var_672
PUBLIC _var_674
PUBLIC _word_3A940
PUBLIC _word_3370E
PUBLIC _sub_1CFA6
PUBLIC _word_3C02E
PUBLIC _word_3C45C
PUBLIC _word_336F2
PUBLIC _word_336EA
PUBLIC _stru_3AA5E
PUBLIC _word_3370C
PUBLIC _stru_3B208
PUBLIC _unk_3A948
PUBLIC _sub_160D3
PUBLIC _sub_19FCC
PUBLIC _word_38152
PUBLIC _word_37561
PUBLIC _word_39604
PUBLIC _word_37563
PUBLIC _word_38126
PUBLIC _sub_195C9
PUBLIC _sub_2152A
PUBLIC _off_38364
PUBLIC _word_330BC
PUBLIC _unk_3806E
PUBLIC _sub_1A8C8
PUBLIC _a256left_pic
PUBLIC _a256right_pic
PUBLIC _a256rear_pic
PUBLIC _gfx_jump_21
PUBLIC _gfx_jump_23
PUBLIC _sub_121CA
PUBLIC _aRight_pic
PUBLIC _byte_3995A
PUBLIC _aLeft_pic
PUBLIC _word_36B86
PUBLIC _byte_3850E
PUBLIC _unk_38128
PUBLIC _word_3755D
PUBLIC _sub_11A18
PUBLIC _word_3755F
PUBLIC _aRear_pic
PUBLIC _word_38FDC
PUBLIC _sub_11A88
PUBLIC _word_3C09A
PUBLIC _word_330C2
PUBLIC _sub_20BAE
PUBLIC _word_3C09E
PUBLIC _keyScancode
PUBLIC _var_218
PUBLIC _var_219
PUBLIC _var_220
PUBLIC _var_591
PUBLIC _var_592
PUBLIC _word_3BE98
PUBLIC _byte_3C5A0
PUBLIC _sub_15FDB
PUBLIC _word_3C040
PUBLIC _word_383F4
PUBLIC _word_3BEBE

PUBLIC _word_3C6A4
PUBLIC _byte_37C2F
PUBLIC _sams
PUBLIC _word_3AA5A
PUBLIC _word_3C5A6
PUBLIC _missleSpec
PUBLIC _word_3C8B6
PUBLIC _aPressAnyKeyToP
PUBLIC _word_3AA5C
PUBLIC _aTraining
PUBLIC _word_38FC4
PUBLIC _waypoints
PUBLIC _word_3C008
PUBLIC _planeFlags
PUBLIC _byte_37C24
PUBLIC _string_3C04A
PUBLIC _draw2Strings
PUBLIC _word_3370A
PUBLIC _word_3C6AC
PUBLIC _missiles
PUBLIC _aAccel
PUBLIC _sub_19C0C
PUBLIC _sub_154B7
PUBLIC _sub_19C84
PUBLIC _sub_1A030
PUBLIC _aStallWarning
PUBLIC _waypointIndex
PUBLIC _aAutopilot
PUBLIC _word_38FEA
PUBLIC _word_3BE92
PUBLIC _sub_1A25C
PUBLIC _word_3C16A
PUBLIC _word_380D0
PUBLIC _tempString
PUBLIC _word_383F2
PUBLIC _word_330B6
PUBLIC _missileSpecIndex
PUBLIC _sub_21A86
PUBLIC _gfx_jump_0_alloc
PUBLIC _gfx_jump_05_drawString
PUBLIC _gfx_jump_0c
PUBLIC _gfx_jump_2a
PUBLIC _gfx_jump_2d
PUBLIC _gfx_jump_3d_null
PUBLIC _gfx_jump_3f_modecode
PUBLIC _gfx_jump_44_setDac
PUBLIC _gfx_jump_45_retrace
PUBLIC _gfx_jump_46_retrace2
PUBLIC _gfx_jump_4b_storeBufPtr
PUBLIC _gfx_jump_4c
PUBLIC _gfx_jump_4f
PUBLIC _gfx_jump_52
PUBLIC _zoomIn
PUBLIC _word_3C018
PUBLIC _word_3C01A
PUBLIC _word_3C45E
PUBLIC _word_3C5A2
PUBLIC _word_38FC8
PUBLIC _word_38FCC
; ---------------------------------------------------------------------------

SREGS		struc ;	(sizeof=0x8, align=0x2,	copyof_10) ; XREF: load15Flt3d3/r
					; load3D3/r
_es		dw ?
_cs		dw ?
_ss		dw ?
_ds		dw ?			; XREF:	load3D3+13E/r load3D3+399/r ...
SREGS		ends

; ---------------------------------------------------------------------------

struc_1		struc ;	(sizeof=0x10, mappedto_11) ; XREF: dseg:stru_3A95A/r
field_0		dd ?			; XREF:	otherKeyDispatch+1198/w
					; otherKeyDispatch+119C/w
field_4		dd ?			; XREF:	otherKeyDispatch+11A7/w
					; otherKeyDispatch+11AB/w
field_8		dw ?			; XREF:	otherKeyDispatch+11B2/w
field_A		dw ?			; XREF:	otherKeyDispatch+117F/w
					; otherKeyDispatch+121D/r
field_C		dw ?			; XREF:	otherKeyDispatch+1186/w
					; otherKeyDispatch+1227/r
field_E		dw ?			; XREF:	otherKeyDispatch+118D/w
struc_1		ends

; ---------------------------------------------------------------------------

struc_2		struc ;	(sizeof=0x18, mappedto_12) ; XREF: dseg:stru_335C4/r
field_0		dw ?
field_2		dw ?
field_4		dw ?
field_6		dw ?
field_8		dw ?
field_A		dw ?
field_C		dw ?
field_E		dw ?
field_10	db 8 dup(?)
struc_2		ends

; ---------------------------------------------------------------------------

struc_3		struc ;	(sizeof=0x24, mappedto_13) ; XREF: dseg:stru_3B208/r
field_0		dw ?
field_2		dd ?
field_6		dd ?
field_A		db 26 dup(?)		; XREF:	sub_10720+DA8/r	sub_10720+DB0/r	...
struc_3		ends

; ---------------------------------------------------------------------------

struc_4		struc ;	(sizeof=0x10, mappedto_14) ; XREF: dseg:stru_3AA5E/r
field_0		dw ?			; XREF:	sub_11841+60/r sub_11F3E+60/r ...
field_2		dw ?			; XREF:	sub_11841+68/r sub_11F3E+40/r ...
field_4		dw ?
field_6		dw ?			; XREF:	sub_10720+D7F/r
					; otherKeyDispatch+6C/r	...
field_8		db 4 dup(?)		; XREF:	sub_10720+D77/r
field_C		dw ?			; XREF:	placeString+A/r	placeString+43/r ...
field_E		dw ?
struc_4		ends

; ---------------------------------------------------------------------------

Waypoint	struc ;	(sizeof=0x4, mappedto_15) ; XREF: dseg:waypoints/r
field_0		dw ?
field_2		dw ?
Waypoint	ends

; ---------------------------------------------------------------------------

Missile		struc ;	(sizeof=0x1A, mappedto_16) ; XREF: dseg:missiles/r
field_0		db 10 dup(?)		; string(C)
field_A		db 12 dup(?)		; string(C)
field_16	dw ?
field_18	dw ?
Missile		ends

; ---------------------------------------------------------------------------

Sam		struc ;	(sizeof=0x12, mappedto_17) ; XREF: dseg:sams/r
field_0		db 8 dup(?)		; string(C)
field_8		dw ?
field_A		dw ?
field_C		dw ?
field_E		dw ?
field_10	dw ?
Sam		ends

; ---------------------------------------------------------------------------

MissileSpec	struc ;	(sizeof=0x4, mappedto_18) ; XREF: dseg:missleSpec/r
field_0		dw ?
field_2		dw ?
MissileSpec	ends

; ---------------------------------------------------------------------------

struc_9		struc ;	(sizeof=0x8, mappedto_19) ; XREF: dseg:stru_33402/r
field_0		dw ?
field_2		dw ?
field_4		dw ?
field_6		dw ?
struc_9		ends

; ---------------------------------------------------------------------------

; enum enum_1, mappedto_2
DOS_SET_IRQH	 = 25h
PORT_PIT_TIME0	 = 40h
PORT_PIT_CNTRL	 = 43h

; ---------------------------------------------------------------------------

; enum Pointers, mappedto_3
COMM_GFXOVL_SEG	 = 1Ah
COMM_SNDOVL_SEG	 = 1Ch
COMM_MISCOVL_SEG  = 1Eh
COMM_GFXBUF_PTR	 = 20h
COMM_HERC_FLAG	 = 24h
COMM_SETUP_DONE_OFFSET	= 26h
COMM_SETUP_GFXMODE_OFFSET  = 30h
COMM_UNK7	 = 38h
COMM_JOYDATA_OFF  = 48h
COMM_USEJOY_OFF	 = 72h
COMM_GFXMODE_OFFSET  = 78h
COMM_WORLDBUF	 = 7Ah
OFF_IACA_START	 = 4F0h
COMM_GAMEDATA_OFFSET  =	120Eh

; ---------------------------------------------------------------------------

; enum Interrupt, mappedto_4
IRQ_CBREAK	 = 1Bh

; ---------------------------------------------------------------------------

; enum Game, mappedto_5
GAMEDATA_THEATER  = 38h
GAMEDATA_DIFFICULTY  = 3Eh
GAMEDATA_UNK4	 = 40h

; ---------------------------------------------------------------------------

; enum Misc, mappedto_6
WAYPT_PRIMARY	 = 1
WAYPT_SECONDARY	 = 2
WAYPT_BASE	 = 3
IRQ_VIDEO	 = 10h
OVL_HDR_CODESEG	 = 18h
OVL_HDR_FIRSTIDX  = 1Ch
OVL_HDR_SLOTCOUNT  = 22h
OVL_HDR_FIRSTPTR  = 24h

; ==============================================================================
.CODE ;seg000 segment byte public 'CODE' use16
; ------------------------------seg000:0x294------------------------------
sub_10294 proc near
    push BP
    pop BP
    ret
sub_10294 endp
; ------------------------------seg000:0x296------------------------------
; ------------------------------seg000:0x297------------------------------
sub_10297 proc near
    push BP
    pop BP
    ret
sub_10297 endp
; ------------------------------seg000:0x299------------------------------
    nop
; ------------------------------seg000:0x2e2------------------------------
_loadF15DgtlBin proc near
    call far ptr gfx_jump_32
    mov bx, ax
    sub bx, 2
    cmp bx, 0FFFh
    jbe short loc_102F5
    mov bx, 0FFFh
loc_102F5:
    mov allocSize, bx
    mov ah, 48h
    int 21h ;DOS - 2+ - ALLOCATE MEMORY
    mov f15dgtlAddr, ax
    sub cx, cx
    mov es, cx
    mov es:4FEh, ax
    mov ah, 3Dh
    mov al, 0
    mov dx, offset aF15dgtl_bin ;"F15DGTL.BIN"
    int 21h ;DOS - 2+ - OPEN DISK FILE WITH HANDLE
    mov bx, ax
    mov cx, allocSize
    shl cx, 1
    shl cx, 1
    shl cx, 1
    shl cx, 1
    push ds
    mov ax, f15dgtlAddr
    mov ds, ax
    mov dx, 0
    mov ah, 3Fh
    int 21h ;DOS - 2+ - READ FROM FILE WITH HANDLE
    pop ds
    push ax
    mov ah, 3Eh
    int 21h ;DOS - 2+ - CLOSE A FILE WITH HANDLE
    pop ax
    retn
_loadF15DgtlBin endp
; ------------------------------seg000:0x333------------------------------
; ------------------------------seg000:0x334------------------------------
sub_10334 proc near
    push BP
    mov BP,SP
    sub SP,0a6h
    push DI
    push SI
    cmp byte ptr [_word_38FDC],3h
    jge LAB_1000_0356
    push word ptr [BP + 4h]
    call far ptr sub_1FEEC
    add SP,2h
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
    db 90h
LAB_1000_0356:
    mov word ptr [BP + -4h],0h
LAB_1000_035b:
    mov SI,word ptr [BP + -4h]
    shl SI,1h
    mov AX,word ptr [SI + 0e0h]
    mov word ptr [SI + offset word_3BE9C],AX
    inc word ptr [BP + -4h]
    cmp word ptr [BP + -4h],10h
    jl LAB_1000_035b
    mov AX,word ptr [_var_226]
    neg AX
    mov word ptr [word_38FC6],AX
    mov AX,word ptr [_var_225]
    cmp AX,200h
    jge LAB_1000_0384
    mov AX,200h
LAB_1000_0384:
    cwd
    push DX
    push AX
    mov AX,word ptr [_var_224]
    cwd
    mov DH,DL
    mov DL,AH
    mov AH,AL
    sub AL,AL
    push DX
    push AX
    call __aNldiv
    mov word ptr [BP + -2h],AX
    cmp byte ptr [_var_594],0h
    jz LAB_1000_03a9
    mov CL,byte ptr [_var_594]
    shl word ptr [BP + -2h],CL
LAB_1000_03a9:
    cmp byte ptr [_var_456],0h
    jz LAB_1000_03b3
    sar word ptr [BP + -2h],1h
LAB_1000_03b3:
    mov word ptr [BP + -4h],0h
    jmp LAB_1000_0469
    db 90h
LAB_1000_03bc:
    mov word ptr [BP + -9eh],5848h
LAB_1000_03c2:
    push word ptr [_var_227]
    mov AX,0a7b8h
    push AX
    call sub_13B2F
    add SP,4h
    mov SI,AX
    push word ptr [word_38FC6]
    push word ptr [BP + -9eh]
    call sub_13B2F
    add SP,4h
    mov DI,AX
    mov AX,word ptr [BP + -4h]
    shl AX,1h
    add AX,BP
    mov word ptr [BP + -0a4h],AX
    mov BX,AX
    mov AX,word ptr [word_3298C]
    add AX,SI
    sub AX,DI
    mov word ptr [BX + -26h],AX
    mov BX,word ptr [BP + -0a4h]
    mov AX,SI
    neg AX
    add AX,word ptr [word_3298C]
    sub AX,DI
    mov word ptr [BX + -6ah],AX
    push word ptr [_var_227]
    push word ptr [BP + -9eh]
    call sub_13B2F
    add SP,4h
    mov SI,AX
    push word ptr [word_38FC6]
    mov AX,0a7b8h
    push AX
    call sub_13B2F
    add SP,4h
    mov DI,AX
    mov AX,word ptr [BP + -4h]
    shl AX,1h
    add AX,BP
    mov word ptr [BP + -0a6h],AX
    mov BX,AX
    mov AX,SI
    add AX,DI
    sar AX,1h
    sar AX,1h
    sub AX,SI
    neg AX
    add AX,DI
    neg AX
    add AX,word ptr [word_3298E]
    mov word ptr [BX + -48h],AX
    mov BX,word ptr [BP + -0a6h]
    mov AX,SI
    sub AX,DI
    sar AX,1h
    sar AX,1h
    add AX,word ptr [word_3298E]
    sub AX,SI
    add AX,DI
    mov word ptr [BX + 0ff74h],AX
    inc word ptr [BP + -4h]
LAB_1000_0469:
    cmp word ptr [BP + -4h],11h
    jge LAB_1000_048c
    cmp word ptr [BP + -4h],10h
    jl LAB_1000_0478
    jmp LAB_1000_03bc
LAB_1000_0478:
    mov BX,word ptr [BP + -4h]
    shl BX,1h
    mov AX,word ptr [BX + offset word_3BE9C]
    add AX,word ptr [BP + -2h]
    mov word ptr [BP + -9eh],AX
    jmp LAB_1000_03c2
    db 90h
LAB_1000_048c:
    mov word ptr [BP + -4h],0h
LAB_1000_0491:
    mov SI,word ptr [BP + -4h]
    shl SI,1h
    add SI,BP
    mov AX,word ptr [SI + -26h]
    mov word ptr [BP + -9ch],AX
    mov AX,word ptr [SI + -48h]
    mov word ptr [BP + -9ah],AX
    mov AX,word ptr [SI + -6ah]
    mov word ptr [BP + -98h],AX
    mov AX,word ptr [SI + 0ff74h]
    mov word ptr [BP + -96h],AX
    mov AX,word ptr [SI + -68h]
    mov word ptr [BP + -94h],AX
    mov AX,word ptr [SI + 0ff76h]
    mov word ptr [BP + -92h],AX
    mov AX,word ptr [SI + -24h]
    mov word ptr [BP + -90h],AX
    mov AX,word ptr [SI + -46h]
    mov word ptr [BP + -8eh],AX
    mov AX,word ptr [BP + -4h]
    db 05h, 60h, 00h ; add AX,60h (force imm16 encoding)
    push AX
    lea AX,[BP + 0ff64h]
    push AX
    mov AX,4h
    push AX
    push word ptr [word_3298A]
    call far ptr sub_1F882
    add SP,8h
    inc word ptr [BP + -4h]
    cmp word ptr [BP + -4h],10h
    jl LAB_1000_0491
    mov AX,word ptr [_var_220]
    cwd
    xor AX,DX
    sub AX,DX
    mov CX,9h
    sar AX,CL
    xor AX,DX
    sub AX,DX
    mov word ptr [word_3BE9C],AX
    mov word ptr [BP + -4h],1h
LAB_1000_0510:
    mov AX,word ptr [_var_220]
    cwd
    mov BX,10h
    sub BX,word ptr [BP + -4h]
    mov CL,5h
    shl BX,CL
    idiv BX
    sub AX,word ptr [word_3BE9C]
    mov BX,word ptr [BP + -4h]
    shl BX,1h
    mov word ptr [BX + offset word_3BE9C], AX
    inc word ptr [BP + -4h]
    cmp word ptr [BP + -4h],10h
    jl LAB_1000_0510
    mov word ptr [word_3BE9C],0h
    mov word ptr [BP + -4h],0h
    jmp LAB_1000_05f1
LAB_1000_0544:
    mov word ptr [BP + -9eh],0a7b8h
LAB_1000_054a:
    push word ptr [_var_227]
    mov AX,0a7b8h
    push AX
    call sub_13B2F
    add SP,4h
    mov SI,AX
    push word ptr [word_38FC6]
    push word ptr [BP + -9eh]
    call sub_13B2F
    add SP,4h
    mov DI,AX
    mov AX,word ptr [BP + -4h]
    shl AX,1h
    add AX,BP
    mov word ptr [BP + -0a2h],AX
    mov BX,AX
    mov AX,word ptr [word_3298C]
    add AX,SI
    sub AX,DI
    mov word ptr [BX + -26h],AX
    mov BX,word ptr [BP + -0a2h]
    mov AX,SI
    neg AX
    add AX,word ptr [word_3298C]
    sub AX,DI
    mov word ptr [BX + -6ah],AX
    push word ptr [_var_227]
    push word ptr [BP + -9eh]
    call sub_13B2F
    add SP,4h
    mov SI,AX
    push word ptr [word_38FC6]
    mov AX,0a7b8h
    push AX
    call sub_13B2F
    add SP,4h
    mov DI,AX
    mov AX,word ptr [BP + -4h]
    shl AX,1h
    add AX,BP
    mov word ptr [BP + -0a0h],AX
    mov BX,AX
    mov AX,SI
    add AX,DI
    sar AX,1h
    sar AX,1h
    sub AX,SI
    neg AX
    add AX,DI
    neg AX
    add AX,word ptr [word_3298E]
    mov word ptr [BX + -48h],AX
    mov BX,word ptr [BP + -0a0h]
    mov AX,SI
    sub AX,DI
    sar AX,1h
    sar AX,1h
    add AX,word ptr [word_3298E]
    sub AX,SI
    add AX,DI
    mov word ptr [BX + 0ff74h],AX
    inc word ptr [BP + -4h]
LAB_1000_05f1:
    cmp word ptr [BP + -4h],11h
    jge LAB_1000_0614
    cmp word ptr [BP + -4h],10h
    jl LAB_1000_0600
    jmp LAB_1000_0544
LAB_1000_0600:
    mov AX,word ptr [BP + -2h]
    mov BX,word ptr [BP + -4h]
    shl BX,1h
    sub AX,word ptr [BX + offset word_3BE9C]
    mov word ptr [BP + -9eh],AX
    jmp LAB_1000_054a
    db 90h
LAB_1000_0614:
    mov word ptr [BP + -4h],0h
LAB_1000_0619:
    mov SI,word ptr [BP + -4h]
    shl SI,1h
    add SI,BP
    mov AX,word ptr [SI + -26h]
    mov word ptr [BP + -9ch],AX
    mov AX,word ptr [SI + -48h]
    mov word ptr [BP + -9ah],AX
    mov AX,word ptr [SI + -6ah]
    mov word ptr [BP + -98h],AX
    mov AX,word ptr [SI + 0ff74h]
    mov word ptr [BP + -96h],AX
    mov AX,word ptr [SI + -68h]
    mov word ptr [BP + -94h],AX
    mov AX,word ptr [SI + 0ff76h]
    mov word ptr [BP + -92h],AX
    mov AX,word ptr [SI + -24h]
    mov word ptr [BP + -90h],AX
    mov AX,word ptr [SI + -46h]
    mov word ptr [BP + -8eh],AX
    mov AX,word ptr [BP + -4h]
    db 05h, 70h, 00h ; add AX,70h (force imm16 encoding)
    push AX
    lea AX,[BP + 0ff64h]
    push AX
    mov AX,4h
    push AX
    push word ptr [word_3298A]
    call far ptr sub_1F882
    add SP,8h
    inc word ptr [BP + -4h]
    cmp word ptr [BP + -4h],10h
    jl LAB_1000_0619
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
    db 00h
    db 00h
    nop
sub_10334 endp
; ------------------------------seg000:0x66e------------------------------
; ------------------------------seg000:0x688------------------------------
_setupOverlaySlots proc near
    arg_0 = word ptr 4
    push bp
    mov bp, sp
    push di
    push si
    push es
    push ds
    push bp
    mov dx, [bp+arg_0]
    mov ovlInsaneFlag, 0
    jmp short loc_106A0
    nop
    mov ovlInsaneFlag, 1
loc_106A0:
    mov es, dx
    mov bx, offset _gfx_jump_0_alloc
    mov di, OVL_HDR_FIRSTIDX
    mov ax, es:[di]
    mov dl, 5
    mul dl
    add bx, ax
    mov di, OVL_HDR_SLOTCOUNT
    mov cx, es:[di]
    mov si, OVL_HDR_FIRSTPTR
    mov di, OVL_HDR_CODESEG
    mov di, es:[di]
writeSlots:
    mov ax, es:[si]
    mov [bx+1], ax
    mov [bx+3], di
    add si, 2
    add bx, 5
    loop writeSlots
    cmp ovlInsaneFlag, 0
    jnz short locret_106E0
    pop bp
    pop ds
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
locret_106E0:
    retn
_setupOverlaySlots endp ;sp-analysis failed
; ------------------------------seg000:0x6e0------------------------------
    nop
    nop
; ------------------------------seg000:0x720------------------------------
sub_10720 proc near
    push BP
    mov BP,SP
    sub SP,0ch
    push DI
    push SI
    mov AX,word ptr [_dword_3B7DA]
    mov DX,word ptr [_dword_3B7DA+2]
    db 05h, 10h, 00h ; add AX,10h (force imm16 encoding)
    adc DX,0h
    mov CL,5h
LAB_1000_0737:
    sar DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_0741
    jmp LAB_1000_0737
LAB_1000_0741:
    mov word ptr [_word_3BEC0],AX
    mov AX,word ptr [_dword_3B7F8]
    mov DX,word ptr [_dword_3B7F8+2]
    db 05h, 10h, 00h ; add AX,10h (force imm16 encoding)
    adc DX,0h
    mov CL,5h
LAB_1000_0753:
    sar DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_075d
    jmp LAB_1000_0753
LAB_1000_075d:
    sub AX,8000h
    neg AX
    mov word ptr [_word_3BED0],AX
    cmp word ptr [word_3BECC],1h
    jz LAB_1000_076f
    jmp LAB_1000_0a94
LAB_1000_076f:
    mov word ptr [_planeFlags],0h
    les BX,dword ptr [_gameData]
    cmp word ptr ES:[BX + 3eh],4h
    jnz LAB_1000_079a
    mov word ptr ES:[BX + 3eh],2h
    mov word ptr [_word_336EA],1h
    or byte ptr [_var_730],10h
    les BX,dword ptr [_commData]
    or byte ptr ES:[BX + 30h],1h
LAB_1000_079a:
    les BX,dword ptr [_commData]
    mov AL,byte ptr ES:[BX + 0dh]
    sub AH,AH
    mov word ptr [BP + -0ah],AX
    db 3Dh, 69h, 00h ; cmp AX,69h (force imm16 encoding)
    jz LAB_1000_07b1
    db 3Dh, 49h, 00h ; cmp AX,49h (force imm16 encoding)
    jnz LAB_1000_07b7
LAB_1000_07b1:
    mov word ptr [_var_600],1h
LAB_1000_07b7:
    call sub_11F3E
    mov word ptr [word_336F0],0h
    mov word ptr [word_336F8],1h
    mov AX,0ffffh
    mov word ptr [_word_336F4],AX
    mov word ptr [_word_336F2],AX
    sub AX,AX
    mov word ptr [word_32A34],AX
    mov word ptr [_waypointIndex],AX
    mov word ptr [_word_330B6],AX
    mov word ptr [_missileSpecIndex],AX
    mov word ptr [word_33096],AX
    mov word ptr [_var_597],AX
    sub AL,AL
    mov byte ptr [_var_456],AL
    cbw
    mov word ptr [word_3C014],AX
    mov word ptr [word_3BFA0],AX
    mov word ptr [word_3BED4],AX
    mov word ptr [_word_3C16A],AX
    sub AX,AX
    mov word ptr [word_3B5D6],AX
    mov word ptr [word_3B4E0],AX
    mov word ptr [word_3B4D8],AX
    mov AX,0ffffh
    mov word ptr [word_336F6],AX
    mov word ptr [word_33700],AX
    mov word ptr [word_33098],2710h
    mov word ptr [word_3BF90],0h
    mov word ptr [_waypointIndex],1h
    mov word ptr [_word_3C45C],1h
    sub AX,AX
    push AX
    call _sub_11A88
    add SP,2h
    mov word ptr [_var_383],0ch
    mov word ptr [_word_330C4],4h
    call sub_1DAAE
    mov word ptr [byte_383E5],1h
    mov word ptr [_var_588],1h
    les BX,dword ptr [_gameData]
    cmp word ptr ES:[BX + 38h],6h
    jnz LAB_1000_0855
    mov AX,1h
    jmp LAB_1000_0864
LAB_1000_0855:
    test byte ptr ES:[BX + 38h],1h
    jz LAB_1000_0861
    mov AX,1h
    jmp LAB_1000_0864
LAB_1000_0861:
    mov AX,0ffffh
LAB_1000_0864:
    mov word ptr [word_3AFA8],AX
    mov word ptr [BP + -2h],AX
    mov BX,word ptr [_word_3B148]
    mov CL,4h
    shl BX,CL
    test word ptr [BX + offset _stru_3AA5E + 6],200h
    jz LAB_1000_088e
    mov CL,7h
    shl AX,CL
    cwd
    sub word ptr [_dword_3B7DA],AX
    sbb word ptr [_dword_3B7DA+2],DX
    or byte ptr [_planeFlags],8h
    jmp LAB_1000_089e
LAB_1000_088e:
    mov AX,708h
    imul word ptr [word_3AFA8]
    cwd
    sub word ptr [_dword_3B7F8],AX
    sbb word ptr [_dword_3B7F8+2],DX
LAB_1000_089e:
    call sub_118F6
    sub AX,AX
    push AX
    mov AX,8h
    push AX
    call sub_11D10
    add SP,4h
    call sub_19595
    mov AX,0ah
    push AX
    mov AX,3h
    push AX
    call sub_19EB6
    add SP,4h
    mov AX,13h
    push AX
    call sub_194D0
    add SP,2h
    mov AX,0ffffh
    mov word ptr [_word_336F2],AX
    mov word ptr [_word_336F4],AX
    mov word ptr [word_330BA],2h
    les BX,dword ptr [_gameData]
    mov AX,word ptr ES:[BX + 3eh]
    mov word ptr [word_330B8],AX
    mov word ptr ES:[BX + 40h],1h
    les BX,dword ptr [_commData]
    mov AX,word ptr ES:[BX + 32h]
    mov word ptr [_word_38FDC],AX
    call sub_1DB2B
    les BX,dword ptr [_commData]
    mov word ptr ES:[BX + 26h],1h
    mov word ptr [word_330B4],3e8h
    cmp word ptr [word_330B8],0h
    jz LAB_1000_0918
    cmp word ptr [_word_336EA],0h
    jnz LAB_1000_0918
    jmp LAB_1000_0a14
LAB_1000_0918:
    mov AX,word ptr [_word_3BED0]
    sub AX,word ptr [_var_47]
    cmp AX,8000h
    jnc LAB_1000_0929
    mov AX,1h
    jmp LAB_1000_092c
LAB_1000_0929:
    mov AX,0ffffh
LAB_1000_092c:
    mov word ptr [word_3AFA8],AX
    mov word ptr [_var_548],7d0h
    mov word ptr [word_3A944],1fa4h
    mov word ptr [_var_552],64h
    call _sub_15FDB
    or byte ptr [_planeFlags],1h
    and byte ptr [_planeFlags],0f7h
    les BX,dword ptr [_gameData]
    mov AX,word ptr ES:[BX + 32h]
    or AX,word ptr ES:[BX + 34h]
    jz LAB_1000_095f
    jmp LAB_1000_0a14
LAB_1000_095f:
    cmp word ptr ES:[BX + 38h],6h
    jnz LAB_1000_0969
    jmp LAB_1000_0a14
LAB_1000_0969:
    mov word ptr [BP + -0ah],0h
    jmp LAB_1000_0973
LAB_1000_0970:
    inc word ptr [BP + -0ah]
LAB_1000_0973:
    mov AX,word ptr [_word_3C046]
    db 2Dh, 04h, 00h ; sub AX,4h (force imm16 encoding)
    cmp word ptr [BP + -0ah],AX
    jl LAB_1000_0981
    jmp LAB_1000_0a14
LAB_1000_0981:
    test byte ptr [BP + -0ah],1h
    jz LAB_1000_098a
    jmp LAB_1000_0a11
LAB_1000_098a:
    mov AX,24h
    imul word ptr [BP + -0ah]
    mov SI,AX
    or byte ptr [SI + offset _stru_3B208 + 18],2h
    mov word ptr [SI + offset _stru_3B208],898h
    mov word ptr [SI + offset _stru_3B208 + 20],12ch
    mov AX,word ptr [BP + -0ah]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    shl AX,1h
    add AX,word ptr [_word_3BEC0]
    db 2Dh, 24h, 00h ; sub AX,24h (force imm16 encoding)
    mov word ptr [SI + offset word_3B204],AX
    mov AX,word ptr [BP + -0ah]
    mov CL,5h
    shl AX,CL
    db 05h, 96h, 00h ; add AX,96h (force imm16 encoding)
    imul word ptr [word_3AFA8]
    mov CX,word ptr [_word_3BED0]
    sub CX,AX
    mov word ptr [SI + offset word_3B206],CX
    mov AX,word ptr [SI + offset word_3B204]
    sub DX,DX
    mov CL,5h
LAB_1000_09db:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_09e5
    jmp LAB_1000_09db
LAB_1000_09e5:
    mov word ptr [SI + offset _stru_3B208 + 2],AX
    mov word ptr [SI + offset _stru_3B208 + 4],DX
    mov AX,word ptr [SI + offset word_3B206]
    sub DX,DX
    mov CL,5h
LAB_1000_09f5:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_09ff
    jmp LAB_1000_09f5
LAB_1000_09ff:
    mov word ptr [SI + offset _stru_3B208 + 6],AX
    mov word ptr [SI + offset _stru_3B208 + 8],DX
    mov AX,word ptr [_var_542]
    add AH,80h
    mov word ptr [SI + offset _stru_3B208 + 10],AX
LAB_1000_0a11:
    jmp LAB_1000_0970
LAB_1000_0a14:
    les BX,dword ptr [_gameData]
    cmp word ptr ES:[BX + 38h],6h
    jz LAB_1000_0a7a
    or byte ptr [byte_3B23E],2h
    mov word ptr [word_3B22C],834h
    mov word ptr [word_3B240],2bch
    mov AX,word ptr [_word_3BEC0]
    mov word ptr [_var_810],AX
    mov AX,50h
    imul word ptr [word_3AFA8]
    add AX,word ptr [_word_3BED0]
    mov word ptr [_var_811],AX
    mov AX,word ptr [_var_810]
    sub DX,DX
    mov CL,5h
LAB_1000_0a4b:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_0a55
    jmp LAB_1000_0a4b
LAB_1000_0a55:
    mov word ptr [word_3B22E],AX
    mov word ptr [word_3B230],DX
    mov AX,word ptr [_var_811]
    sub DX,DX
    mov CL,5h
LAB_1000_0a63:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_0a6d
    jmp LAB_1000_0a63
LAB_1000_0a6d:
    mov word ptr [word_3B232],AX
    mov word ptr [word_3B234],DX
    mov AX,word ptr [_var_542]
    mov word ptr [word_3B236],AX
LAB_1000_0a7a:
    mov AX,word ptr [BP + -2h]
    mov word ptr [word_3AFA8],AX
    call sub_119A3
    mov word ptr [word_3BECC],2h
    call far ptr _gfx_jump_46_retrace2
    call sub_16742
    mov word ptr [word_38FF6],AX
LAB_1000_0a94:
    mov AX,7e00h
    push AX
    mov AX,100h
    push AX
    push word ptr [_word_3BEC0]
    call _sub_1CF64
    add SP,6h
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [_word_3BEC0]
    cmp word ptr [BP + -6h],AX
    jz LAB_1000_0acc
    mov AX,word ptr [BP + -6h]
    mov word ptr [_word_3BEC0],AX
    sub DX,DX
    mov CL,5h
LAB_1000_0abb:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_0ac5
    jmp LAB_1000_0abb
LAB_1000_0ac5:
    mov word ptr [_dword_3B7DA],AX
    mov word ptr [_dword_3B7DA+2],DX
LAB_1000_0acc:
    mov AX,7d00h
    push AX
    mov AX,200h
    push AX
    push word ptr [_word_3BED0]
    call _sub_1CF64
    add SP,6h
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [_word_3BED0]
    cmp word ptr [BP + -6h],AX
    jz LAB_1000_0b0b
    mov AX,word ptr [BP + -6h]
    mov word ptr [_word_3BED0],AX
    mov AX,8000h
    sub AX,word ptr [_word_3BED0]
    sub DX,DX
    mov CL,5h
LAB_1000_0afa:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_0b04
    jmp LAB_1000_0afa
LAB_1000_0b04:
    mov word ptr [_dword_3B7F8],AX
    mov word ptr [_dword_3B7F8+2],DX
LAB_1000_0b0b:
    sub BX,BX
    mov ES,BX
    mov BX,417h
    and byte ptr ES:[BX],0fh
    call sub_16172
    call sub_167B4
    call sub_179EE
    call sub_11636
    call sub_11676
    call sub_11841
    call sub_118D5
    lea AX,[BP + -8h]
    push AX
    lea AX,[BP + -6h]
    push AX
    push word ptr [_word_3BED0]
    push word ptr [_word_3BEC0]
    call sub_199EC
    add SP,8h
    or AX,AX
    jnz LAB_1000_0b48
    jmp LAB_1000_0be5
LAB_1000_0b48:
    call far ptr _gfx_jump_2d
    sub AL,1h
    neg AL
    mov byte ptr [_byte_3C5A0],AL
    mov SI,word ptr [BP + -6h]
    sub SI,3h
    mov DI,word ptr [BP + -8h]
    sub DI,3h
    mov AX,6h
    push AX
    push AX
    push DI
    push SI
    mov AL,byte ptr [_byte_3C5A0]
    cbw
    push AX
    push DI
    push SI
    mov AX,2h
    push AX
    call far ptr _gfx_jump_2a
    add SP,10h
    sub AX,AX
    push AX
    mov AX,4h
    push AX
    push AX
    push AX
    mov AX,word ptr [_var_542]
    add AH,10h
    mov CL,0dh
    sar AX,CL
    db 25h, 07h, 00h ; and AX,7h (force imm16 encoding)
    shl AX,1h
    shl AX,1h
    db 05h, 0a4h, 00h ; add AX,0a4h (force imm16 encoding)
    push AX
    mov AX,word ptr [BP + -8h]
    dec AX
    push AX
    mov AX,word ptr [BP + -6h]
    dec AX
    push AX
    call _sub_1A8C8
    add SP,0eh
    mov AL,1h
    sub AL,byte ptr [_byte_3C5A0]
    mov byte ptr [_byte_3C5A0],AL
    cmp word ptr [BP + -6h],20h
    jl LAB_1000_0bca
    cmp word ptr [BP + -6h],58h
    jg LAB_1000_0bca
    cmp word ptr [BP + -8h],76h
    jl LAB_1000_0bca
    cmp word ptr [BP + -8h],0a2h
    jle LAB_1000_0be3
LAB_1000_0bca:
    cmp word ptr [byte_383E5],2h
    jle LAB_1000_0be3
    dec word ptr [byte_383E5]
    push word ptr [_word_3BED0]
    push word ptr [_word_3BEC0]
    call _sub_195C9
    add SP,4h
LAB_1000_0be3:
    jmp LAB_1000_0bf3
LAB_1000_0be5:
    push word ptr [_word_3BED0]
    push word ptr [_word_3BEC0]
    call _sub_195C9
    add SP,4h
LAB_1000_0bf3:
    mov AX,word ptr [_word_3BEC0]
    mov word ptr [word_3AF0C],AX
    mov AX,word ptr [_word_3BED0]
    mov word ptr [word_3AFAA],AX
    mov AX,word ptr [_word_3370C]
    cmp word ptr [_word_336E8],AX
    jnz LAB_1000_0c1b
    cmp word ptr [_word_336EA],0h
    jnz LAB_1000_0c15
    mov word ptr [_keyValue],0h
LAB_1000_0c15:
    mov word ptr [_word_3370C],0ffffh
LAB_1000_0c1b:
    cmp word ptr [word_336F0],0h
    jz LAB_1000_0c26
    dec word ptr [word_336F0]
LAB_1000_0c26:
    cmp word ptr [word_336EE],0h
    jz LAB_1000_0c46
    mov AX,word ptr [word_336EE]
    cmp word ptr [_word_336E8],AX
    jnz LAB_1000_0c46
    mov word ptr [word_336EE],0h
    mov AX,2h
    push AX
    call sub_1DA5F
    add SP,2h
LAB_1000_0c46:
    test byte ptr [_word_336E8],7h
    jz LAB_1000_0c50
    jmp LAB_1000_0f3b
LAB_1000_0c50:
    mov AX,word ptr [_word_3C16A]
    mov word ptr [word_33700],AX
    mov word ptr [word_38FEE],7fffh
    mov word ptr [BP + -0ah],0h
    jmp LAB_1000_0c66
LAB_1000_0c63:
    inc word ptr [BP + -0ah]
LAB_1000_0c66:
    mov AX,word ptr [_word_3BED2]
    cmp word ptr [BP + -0ah],AX
    jge LAB_1000_0cbc
    mov SI,word ptr [BP + -0ah]
    mov CL,4h
    shl SI,CL
    test word ptr [SI + offset _stru_3AA5E + 6],201h
    jz LAB_1000_0cba
    test word ptr [SI + offset _stru_3AA5E + 6],500h
    jz LAB_1000_0cba
    test word ptr [SI + offset _stru_3AA5E + 6],800h
    jnz LAB_1000_0cba
    mov AX,word ptr [_word_3BED0]
    sub AX,word ptr [SI + offset _stru_3AA5E + 2]
    push AX
    mov AX,word ptr [_word_3BEC0]
    sub AX,word ptr [SI + offset _stru_3AA5E]
    push AX
    call _sub_1CFA6
    add SP,4h
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [word_38FEE]
    cmp word ptr [BP + -2h],AX
    jge LAB_1000_0cba
    mov AX,word ptr [BP + -2h]
    mov word ptr [word_38FEE],AX
    mov AX,word ptr [BP + -0ah]
    mov word ptr [_word_3C16A],AX
LAB_1000_0cba:
    jmp LAB_1000_0c63
LAB_1000_0cbc:
    mov AX,word ptr [_word_3C16A]
    cmp word ptr [word_33700],AX
    jz LAB_1000_0cdc
    mov word ptr [word_3B15A],AX
    mov SI,AX
    mov CL,4h
    shl SI,CL
    mov AX,word ptr [SI + offset _stru_3AA5E]
    mov word ptr [_var_48],AX
    mov AX,word ptr [SI + offset _stru_3AA5E + 2]
    mov word ptr [_var_49],AX
LAB_1000_0cdc:
    cmp byte ptr [_word_336E8],0h
    jnz LAB_1000_0d20
    cmp word ptr [_word_336E8],0h
    jz LAB_1000_0d20
    mov AX,0fffch
    cwd
    add AX,word ptr [_commData]
    adc DX,0h
    mov CX,0ch
    shl DX,CL
    add DX,word ptr [_commData+2]
    mov ES,DX
    mov BX,AX
    cmp word ptr ES:[BX],0ca01h
    jnz LAB_1000_0d11
    cmp word ptr ES:[BX + 2h],3b9ah
    jz LAB_1000_0d20
LAB_1000_0d11:
    mov AX,1h
    push AX
    call sub_11B37
    add SP,2h
    mov byte ptr [_exitCode],0h
LAB_1000_0d20:
    mov AX,word ptr [_word_3C16A]
    cmp word ptr [word_33700],AX
    jnz LAB_1000_0d2c
    jmp LAB_1000_0eb6
LAB_1000_0d2c:
    mov BX,AX
    mov CL,4h
    shl BX,CL
    test word ptr [BX + offset _stru_3AA5E + 6],800h
    jz LAB_1000_0d3d
    jmp LAB_1000_0eb6
LAB_1000_0d3d:
    mov word ptr [BP + -0ah],1h
    jmp LAB_1000_0d47
LAB_1000_0d44:
    inc word ptr [BP + -0ah]
LAB_1000_0d47:
    cmp word ptr [BP + -0ah],2h
    jg LAB_1000_0d9e
    mov AX,word ptr [_word_3C046]
    sub AX,word ptr [BP + -0ah]
    mov CX,24h
    imul CX
    mov SI,AX
    and byte ptr [SI + offset _stru_3B208 + 18],0fdh
    mov BX,word ptr [_word_3C16A]
    mov CL,4h
    shl BX,CL
    mov DI,word ptr [BX + offset _stru_3AA5E + 6]
    test DI,400h
    jz LAB_1000_0d76
    mov AX,0dh
    jmp LAB_1000_0d78
LAB_1000_0d76:
    sub AX,AX
LAB_1000_0d78:
    mov word ptr [SI + offset _stru_3B208 + 16],AX
    test DI,100h
    jz LAB_1000_0d88
    mov word ptr [SI + offset _stru_3B208 + 16],12h
LAB_1000_0d88:
    mov AX,word ptr [_word_3C046]
    sub AX,word ptr [BP + -0ah]
    mov CX,24h
    imul CX
    mov BX,AX
    mov AX,word ptr [_word_3C16A]
    mov word ptr [BX + offset _unk_3B202],AX
    jmp LAB_1000_0d44
LAB_1000_0d9e:
    mov word ptr [BP + -0ah],3h
    jmp LAB_1000_0da8
LAB_1000_0da5:
    inc word ptr [BP + -0ah]
LAB_1000_0da8:
    cmp word ptr [BP + -0ah],4h
    jle LAB_1000_0db1
    jmp LAB_1000_0eb6
LAB_1000_0db1:
    mov AX,word ptr [_word_3C046]
    sub AX,word ptr [BP + -0ah]
    mov word ptr [BP + -0ch],AX
    mov AX,24h
    imul word ptr [BP + -0ch]
    mov SI,AX
    or byte ptr [SI + offset _stru_3B208 + 18],2h
    mov DI,word ptr [_word_3C16A]
    mov CL,4h
    shl DI,CL
    mov AX,word ptr [DI + offset _stru_3AA5E]
    mov word ptr [SI + offset word_3B204],AX
    mov AX,word ptr [DI + offset _stru_3AA5E + 2]
    mov word ptr [SI + offset word_3B206],AX
    test word ptr [DI + offset _stru_3AA5E + 6],200h
    jz LAB_1000_0e10
    mov AX,word ptr [word_3AFA8]
    mov CX,AX
    shl AX,1h
    shl AX,1h
    add AX,CX
    add word ptr [SI + offset word_3B204],AX
    mov AX,word ptr [BP + -0ah]
    db 25h, 01h, 00h ; and AX,1h (force imm16 encoding)
    imul word ptr [word_3AFA8]
    mov CL,4h
    shl AX,CL
    add word ptr [SI + offset word_3B206],AX
    mov word ptr [SI + offset _stru_3B208],84h
    jmp LAB_1000_0e35
LAB_1000_0e10:
    mov AX,24h
    imul word ptr [BP + -0ch]
    mov SI,AX
    add word ptr [SI + offset word_3B204],0ah
    mov AX,word ptr [BP + -0ah]
    add AX,word ptr [_word_3C16A]
    db 25h, 03h, 00h ; and AX,3h (force imm16 encoding)
    mov CL,4h
    shl AX,CL
    add word ptr [SI + offset word_3B206],AX
    mov word ptr [SI + offset _stru_3B208],4h
LAB_1000_0e35:
    mov AX,24h
    imul word ptr [BP + -0ch]
    mov SI,AX
    mov AX,word ptr [SI + offset word_3B204]
    sub DX,DX
    mov CL,5h
LAB_1000_0e45:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_0e4f
    jmp LAB_1000_0e45
LAB_1000_0e4f:
    mov word ptr [SI + offset _stru_3B208 + 2],AX
    mov word ptr [SI + offset _stru_3B208 + 4],DX
    mov AX,word ptr [SI + offset word_3B206]
    sub DX,DX
    mov CL,5h
LAB_1000_0e5f:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_0e69
    jmp LAB_1000_0e5f
LAB_1000_0e69:
    mov word ptr [SI + offset _stru_3B208 + 6],AX
    mov word ptr [SI + offset _stru_3B208 + 8],DX
    mov AX,4000h
    push AX
    call randlmul
    add SP,2h
    neg AX
    mov word ptr [SI + offset _stru_3B208 + 10],AX
    mov BX,word ptr [_word_3C16A]
    mov CL,4h
    shl BX,CL
    mov SI,word ptr [BX + offset _stru_3AA5E + 6]
    mov AX,24h
    imul word ptr [BP + -0ch]
    mov DI,AX
    add DI,8968h
    test SI,400h
    jz LAB_1000_0ea4
    mov AX,8h
    jmp LAB_1000_0ea7
LAB_1000_0ea4:
    mov AX,0bh
LAB_1000_0ea7:
    mov word ptr [DI],AX
    test SI,100h
    jz LAB_1000_0eb3
    mov word ptr [DI],9h
LAB_1000_0eb3:
    jmp LAB_1000_0da5
LAB_1000_0eb6:
    test byte ptr [_word_336E8],7fh
    jnz LAB_1000_0f3b
    mov BX,word ptr [_word_3C16A]
    mov CL,4h
    shl BX,CL
    test word ptr [BX + offset _stru_3AA5E + 6],800h
    jnz LAB_1000_0f29
    test byte ptr [_word_336E8],80h
    jz LAB_1000_0eda
    mov AX,word ptr [_word_3C046]
    dec AX
    jmp LAB_1000_0ee0
LAB_1000_0eda:
    mov AX,word ptr [_word_3C046]
    db 2Dh, 02h, 00h ; sub AX,2h (force imm16 encoding)
LAB_1000_0ee0:
    mov word ptr [BP + -0ch],AX
    mov AX,24h
    imul word ptr [BP + -0ch]
    mov BX,AX
    test byte ptr [BX + offset _stru_3B208 + 18],2h
    jnz LAB_1000_0f29
    push word ptr [_word_3C16A]
    push word ptr [BP + -0ch]
    call sub_1783A
    add SP,4h
    mov AX,24h
    imul word ptr [BP + -0ch]
    mov SI,AX
    mov word ptr [SI + offset _stru_3B208 + 18],207h
    mov word ptr [SI + offset _stru_3B208],3e8h
    mov word ptr [SI + offset _stru_3B208 + 20],0fah
    mov AX,3000h
    imul word ptr [word_3AFA8]
    cwd
    add word ptr [SI + offset _stru_3B208 + 6],AX
    adc word ptr [SI + offset _stru_3B208 + 8],DX
LAB_1000_0f29:
    mov AX,word ptr [word_3BFA0]
    mov word ptr [word_3C014],AX
    mov AX,word ptr [word_3BED4]
    mov word ptr [word_3BFA0],AX
    mov word ptr [word_3BED4],0h
LAB_1000_0f3b:
    cmp word ptr [word_38FEE],200h
    jl LAB_1000_0f4f
    mov AX,word ptr [_var_547]
    cmp word ptr [_word_3BEBE],AX
    jz LAB_1000_0f4f
    jmp LAB_1000_128d
LAB_1000_0f4f:
    mov word ptr [_word_3BEBE],0h
    mov word ptr [word_38FFC],0a0h
    mov word ptr [word_39200],800h
    mov BX,word ptr [_word_3C16A]
    mov CL,4h
    shl BX,CL
    test word ptr [BX + offset _stru_3AA5E + 6],800h
    jz LAB_1000_0f77
    mov word ptr [word_39200],400h
LAB_1000_0f77:
    mov SI,word ptr [_word_3C16A]
    mov CL,4h
    shl SI,CL
    test word ptr [SI + offset _stru_3AA5E + 6],200h
    jz LAB_1000_0fef
    mov word ptr [_word_3BEBE],80h
    mov word ptr [word_38FFC],100h
    mov word ptr [word_39200],3c0h
    cmp word ptr [_var_547],80h
    jnz LAB_1000_0fef
    cmp word ptr [_word_3AA5A],50h
    jle LAB_1000_0fef
    mov AX,word ptr [_word_3BED0]
    sub AX,word ptr [SI + offset _stru_3AA5E + 2]
    mul word ptr [word_3AFA8]
    mov DI,AX
    cmp DI,10h
    jc LAB_1000_0fef
    cmp DI,14h
    ja LAB_1000_0fef
    mov AX,word ptr [_var_542]
    mov DX,1h
    sub DX,word ptr [word_3AFA8]
    mov CL,0eh
    shl DX,CL
    sub AX,DX
    push AX
    call _abs
    add SP,2h
    cmp AX,2000h
    jge LAB_1000_0fef
    mov word ptr [word_38FDE],1h
    mov AX,2h
    push AX
    mov AX,16h
    push AX
    call makeSound
    add SP,4h
LAB_1000_0fef:
    les BX,dword ptr [_gameData]
    cmp word ptr ES:[BX + 40h],1h
    jnz LAB_1000_1004
    add byte ptr [_var_727],1h
    add byte ptr [_var_732],2h
LAB_1000_1004:
    mov AX,word ptr [_word_3BEC0]
    mov BX,word ptr [_word_3C16A]
    mov CL,4h
    shl BX,CL
    sub AX,word ptr [BX + offset _stru_3AA5E]
    push AX
    call _abs
    add SP,2h
    mov DX,word ptr [word_38FFC]
    mov CL,5h
    sar DX,CL
    cmp AX,DX
    jg LAB_1000_1048
    mov AX,word ptr [_word_3BED0]
    mov BX,word ptr [_word_3C16A]
    mov CL,4h
    shl BX,CL
    sub AX,word ptr [BX + offset _stru_3AA5E + 2]
    push AX
    call _abs
    add SP,2h
    mov DX,word ptr [word_39200]
    mov CL,5h
    sar DX,CL
    cmp AX,DX
    jle LAB_1000_1057
LAB_1000_1048:
    mov word ptr [_word_3BEBE],0h
    mov word ptr [word_33702],0h
    jmp LAB_1000_1132
LAB_1000_1057:
    mov word ptr [word_33702],1h
    cmp word ptr [_word_3AA5A],1h
    jle LAB_1000_1067
    jmp LAB_1000_1132
LAB_1000_1067:
    test byte ptr [_word_336E8],7h
    jz LAB_1000_1071
    jmp LAB_1000_1132
LAB_1000_1071:
    mov BX,word ptr [_word_3C16A]
    mov CL,4h
    shl BX,CL
    mov SI,word ptr [BX + offset _stru_3AA5E + 6]
    test SI,500h
    jnz LAB_1000_1086
    jmp LAB_1000_1132
LAB_1000_1086:
    cmp word ptr [word_33714],0h
    jnz LAB_1000_1090
    jmp LAB_1000_1132
LAB_1000_1090:
    test SI,800h
    jz LAB_1000_1099
    jmp LAB_1000_1132
LAB_1000_1099:
    mov word ptr [word_336EC],1h
    mov word ptr [word_33706],1h
    mov AX,word ptr [word_33714]
    inc word ptr [word_33714]
    db 3Dh, 01h, 00h ; cmp AX,1h (force imm16 encoding)
    jnz LAB_1000_10d1
    mov AX,offset aSafeLanding
    push AX
    call tempStrcpy
    add SP,2h
    mov word ptr [_word_330B6],0h
    mov word ptr [word_33712],0h
    mov AX,4h
    push AX
    call sub_1DA5F
    add SP,2h
LAB_1000_10d1:
    mov AX,word ptr [_planeFlags]
    and AX,6000h
    cmp AX,6000h
    jnz LAB_1000_10f0
    mov AX,word ptr [_word_330C4]
    cmp word ptr [word_33714],AX
    jle LAB_1000_10ee
    sub AX,AX
    push AX
    call sub_11B37
    add SP,2h
LAB_1000_10ee:
    jmp LAB_1000_1132
LAB_1000_10f0:
    cmp word ptr [word_33714],2h
    jnz LAB_1000_1109
    inc word ptr [word_33710]
    push word ptr [_word_3C16A]
    mov AX,0ah
    push AX
    call sub_11D10
    add SP,4h
LAB_1000_1109:
    mov AX,word ptr [_word_330C4]
    cmp word ptr [word_33714],AX
    jle LAB_1000_1132
    call sub_119A3
    test byte ptr [_word_336E8],8h
    jz LAB_1000_1128
    mov AX,offset aReadyForTakeof
    push AX
    call tempStrcpy
    add SP,2h
    jmp LAB_1000_1132
LAB_1000_1128:
    mov AX,offset aWeaponsRepleni
    push AX
    call tempStrcpy
    add SP,2h
LAB_1000_1132:
    cmp word ptr [word_33706],0h
    jz LAB_1000_113c
    jmp LAB_1000_128b
LAB_1000_113c:
    cmp word ptr [word_330B8],0h
    jz LAB_1000_1146
    jmp LAB_1000_128b
LAB_1000_1146:
    test word ptr [_planeFlags],6000h
    jnz LAB_1000_1151
    jmp LAB_1000_128b
LAB_1000_1151:
    mov AX,word ptr [_word_3BEC0]
    mov BX,word ptr [_word_3C16A]
    mov CL,4h
    shl BX,CL
    sub AX,word ptr [BX + offset _stru_3AA5E]
    push AX
    call _abs
    add SP,2h
    db 3Dh, 10h, 00h ; cmp AX,10h (force imm16 encoding)
    jge LAB_1000_11d2
    mov AX,word ptr [_word_3BED0]
    mov BX,word ptr [_word_3C16A]
    mov CL,4h
    shl BX,CL
    sub AX,word ptr [BX + offset _stru_3AA5E + 2]
    push AX
    call _abs
    add SP,2h
    db 3Dh, 10h, 00h ; cmp AX,10h (force imm16 encoding)
    jge LAB_1000_11d2
    sub AX,AX
    mov word ptr [_var_548],AX
    mov word ptr [word_3A944],AX
    mov word ptr [_var_552],AX
    mov SI,word ptr [_word_3C16A]
    mov CL,4h
    shl SI,CL
    mov AX,word ptr [SI + offset _stru_3AA5E]
    sub DX,DX
    mov CL,5h
LAB_1000_11a2:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_11ac
    jmp LAB_1000_11a2
LAB_1000_11ac:
    mov word ptr [_dword_3B7DA],AX
    mov word ptr [_dword_3B7DA+2],DX
    mov AX,8000h
    sub AX,word ptr [SI + offset _stru_3AA5E + 2]
    sub DX,DX
    mov CL,5h
LAB_1000_11be:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_11c8
    jmp LAB_1000_11be
LAB_1000_11c8:
    mov word ptr [_dword_3B7F8],AX
    mov word ptr [_dword_3B7F8+2],DX
    jmp LAB_1000_128b
LAB_1000_11d2:
    mov AX,offset aAutomaticLandi
    push AX
    call tempStrcpy
    add SP,2h
    mov word ptr [word_33712],1h
    mov AX,word ptr [_word_330C4]
    shl AX,1h
    mov word ptr [BP + -0ah],AX
    db 3Dh, 0Eh, 00h ; cmp AX,0eh (force imm16 encoding)
    jle LAB_1000_11f4
    mov word ptr [BP + -0ah],0eh
LAB_1000_11f4:
    mov word ptr [word_3A944],1518h
    mov AX,word ptr [_var_548]
    sub AX,word ptr [_word_3BEBE]
    sub DX,DX
    div word ptr [BP + -0ah]
    sub word ptr [_var_548],AX
    mov AX,word ptr [_word_3BEBE]
    db 05h, 05h, 00h ; add AX,5h (force imm16 encoding)
    mov SI,AX
    cmp word ptr [_var_548],SI
    jnc LAB_1000_121c
    mov word ptr [_var_548],SI
LAB_1000_121c:
    mov SI,word ptr [_word_3C16A]
    mov CL,4h
    shl SI,CL
    mov AX,word ptr [BP + -0ah]
    cwd
    push DX
    push AX
    mov AX,word ptr [_dword_3B7DA]
    mov DX,word ptr [_dword_3B7DA+2]
    mov CX,word ptr [SI + offset _stru_3AA5E]
    sub BX,BX
    mov DI,CX
    mov CL,5h
LAB_1000_123b:
    shl DI,1h
    rcl BX,1h
    dec CL
    jz LAB_1000_1245
    jmp LAB_1000_123b
LAB_1000_1245:
    sub AX,DI
    sbb DX,BX
    push DX
    push AX
    call __aNldiv
    sub word ptr [_dword_3B7DA],AX
    sbb word ptr [_dword_3B7DA+2],DX
    mov AX,word ptr [BP + -0ah]
    cwd
    push DX
    push AX
    mov AX,word ptr [_dword_3B7F8]
    mov DX,word ptr [_dword_3B7F8+2]
    mov CX,8000h
    sub CX,word ptr [SI + offset _stru_3AA5E + 2]
    sub BX,BX
    mov DI,CX
    mov CL,5h
LAB_1000_1270:
    shl DI,1h
    rcl BX,1h
    dec CL
    jz LAB_1000_127a
    jmp LAB_1000_1270
LAB_1000_127a:
    sub AX,DI
    sbb DX,BX
    push DX
    push AX
    call __aNldiv
    sub word ptr [_dword_3B7F8],AX
    sbb word ptr [_dword_3B7F8+2],DX
LAB_1000_128b:
    jmp LAB_1000_1299
LAB_1000_128d:
    mov word ptr [word_33706],0h
    mov word ptr [word_33702],0h
LAB_1000_1299:
    cmp word ptr [word_33702],0h
    jnz LAB_1000_1312
    cmp word ptr [_var_547],0h
    jnz LAB_1000_130c
    les BX,dword ptr [_gameData]
    cmp word ptr ES:[BX + 40h],0h
    jnz LAB_1000_12c0
    cmp word ptr [word_3BF90],4h
    jg LAB_1000_12c0
    cmp word ptr [word_33098],0h
    jnz LAB_1000_130a
LAB_1000_12c0:
    cmp word ptr [word_3BE3C],0h
    jnz LAB_1000_130a
    cmp word ptr [_word_3AA5A],32h
    jle LAB_1000_130a
    mov AX,2h
    push AX
    sub AX,AX
    push AX
    call makeSound
    add SP,4h
    sub AX,AX
    push AX
    call _sub_19E44
    add SP,2h
    mov AX,0c7h
    push AX
    mov AX,13fh
    push AX
    sub AX,AX
    push AX
    push AX
    call _sub_19E5D
    add SP,8h
    mov AX,78h
    push AX
    call _sub_12278
    add SP,2h
    mov AX,1h
    push AX
    call sub_11B37
    add SP,2h
LAB_1000_130a:
    jmp LAB_1000_1312
LAB_1000_130c:
    mov word ptr [word_33714],1h
LAB_1000_1312:
    cmp byte ptr [_byte_3995A],0h
    jz LAB_1000_1366
    test byte ptr [_keyValue],80h
    jnz LAB_1000_1366
    les BX,dword ptr [_gameData]
    cmp word ptr ES:[BX + 40h],0h
    jz LAB_1000_135a
    cmp word ptr [_var_548],0h
    jz LAB_1000_135a
    mov AX,2h
    push AX
    sub AX,AX
    push AX
    call makeSound
    add SP,4h
    call far ptr _gfx_jump_45_retrace
    mov AX,78h
    push AX
    call _sub_12278
    add SP,2h
    mov AX,2h
    push AX
    call sub_11B37
    add SP,2h
    jmp LAB_1000_1366
LAB_1000_135a:
    add word ptr [_var_548],1f4h
    mov word ptr [_word_330B6],0h
LAB_1000_1366:
    mov BX,word ptr [_word_3C16A]
    mov CL,4h
    shl BX,CL
    test word ptr [BX + offset _stru_3AA5E + 6],200h
    jz LAB_1000_1394
    cmp word ptr [word_38FEE],500h
    jge LAB_1000_1394
    mov AH,byte ptr [word_3AFA8]
    sub AL,AL
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    add AX,word ptr [word_3C0A0]
    and AH,0fh
    jmp LAB_1000_1396
LAB_1000_1394:
    sub AX,AX
LAB_1000_1396:
    mov word ptr [word_3C0A0],AX
    inc word ptr [_word_336E8]
    mov AX,word ptr [_word_336E8]
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    or DX,DX
    jnz LAB_1000_13e7
    inc word ptr [word_38FE0]
    test byte ptr [word_38FE0],1fh
    jnz LAB_1000_13c3
    sub AX,AX
    push AX
    mov AX,9h
    push AX
    call sub_11D10
    add SP,4h
LAB_1000_13c3:
    cmp word ptr [word_38FE0],1h
    jnz LAB_1000_13d6
    sub AX,AX
    push AX
    call sub_1DA5F
    add SP,2h
    call sub_1DA8D
LAB_1000_13d6:
    cmp word ptr [_word_336EA],0h
    jz LAB_1000_13e7
    test byte ptr [word_38FE0],3h
    jnz LAB_1000_13e7
    call sub_11C21
LAB_1000_13e7:
    mov AX,word ptr [_word_330C4]
    shl AX,1h
    shl AX,1h
    inc word ptr [word_33708]
    cmp AX,word ptr [word_33708]
    jbe LAB_1000_13fb
    jmp LAB_1000_14df
LAB_1000_13fb:
    mov AX,word ptr [_var_383]
    sub DX,DX
    div word ptr [_word_330C4]
    mov word ptr [word_3C6AE],AX
    mov AX,word ptr [_var_595]
    shl AX,1h
    dec AX
    imul word ptr [_word_330C4]
    shl AX,1h
    sub word ptr [_var_383],AX
    cmp word ptr [_var_383],4h
    jnc LAB_1000_1424
    mov word ptr [_var_383],4h
LAB_1000_1424:
    mov AX,0ffh
    push AX
    mov AX,1h
    push AX
    mov AX,word ptr [_var_383]
    mul word ptr [_word_3370A]
    mov CX,AX
    mov AX,3c0h
    imul word ptr [_word_330C4]
    sub DX,DX
    div CX
    push AX
    call _sub_1CF64
    add SP,6h
    mov word ptr [BP + -6h],AX
    sub AX,AX
    mov word ptr [_var_383],AX
    mov word ptr [word_33708],AX
    mov AX,word ptr [_word_330C4]
    shl AX,1h
    shl AX,1h
    sub AX,word ptr [BP + -6h]
    push AX
    call _abs
    add SP,2h
    db 3Dh, 03h, 00h ; cmp AX,3h (force imm16 encoding)
    jle LAB_1000_1478
    mov AX,word ptr [BP + -6h]
    db 05h, 02h, 00h ; add AX,2h (force imm16 encoding)
    sar AX,1h
    sar AX,1h
    mov word ptr [_word_330C4],AX
    call sub_1DAAE
LAB_1000_1478:
    mov word ptr [word_3C09C],0h
    mov word ptr [BP + -0ah],3h
    jmp LAB_1000_1488
LAB_1000_1485:
    inc word ptr [BP + -0ah]
LAB_1000_1488:
    mov AX,word ptr [_word_38FFA]
    cmp word ptr [BP + -0ah],AX
    jge LAB_1000_14ae
    mov SI,word ptr [BP + -0ah]
    mov CL,4h
    shl SI,CL
    db 81h, 0bch, 0b6h, 81h, 0c0h, 00h  ; CMP word ptr [SI + 0...,0xc0                ;= ??
    jle LAB_1000_14ac
    db 0f6h, 84h, 0b4h, 81h, 80h  ; TEST byte ptr [SI + 0...,0x80                ;= ??
    jnz LAB_1000_14ac
    inc word ptr [word_3C09C]
    jmp LAB_1000_14ae
LAB_1000_14ac:
    jmp LAB_1000_1485
LAB_1000_14ae:
    mov word ptr [BP + -0ah],0h
    jmp LAB_1000_14b8
LAB_1000_14b5:
    inc word ptr [BP + -0ah]
LAB_1000_14b8:
    mov AX,word ptr [_word_3C046]
    cmp word ptr [BP + -0ah],AX
    jge LAB_1000_14df
    mov AX,24h
    imul word ptr [BP + -0ah]
    mov SI,AX
    cmp word ptr [SI + offset _stru_3B208 + 28],0c0h
    jle LAB_1000_14dd
    test byte ptr [SI + offset _stru_3B208 + 18],2h
    jz LAB_1000_14dd
    inc word ptr [word_3C09C]
    jmp LAB_1000_14df
LAB_1000_14dd:
    jmp LAB_1000_14b5
LAB_1000_14df:
    call sub_114E8
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
sub_10720 endp
; ------------------------------seg000:0x14e7------------------------------
; ------------------------------seg000:0x14e8------------------------------
sub_114E8 equ _sub_114E8
; ------------------------------seg000:0x14fb------------------------------
; ------------------------------seg000:0x14fc------------------------------
countermeasures proc near
    push BP
    mov BP,SP
    sub SP,6h
    push SI
    mov word ptr [BP + -6h],0ffffh
    mov SI,word ptr [BP + 4h]
    shl SI,1h
    add SI,7eah
    mov AX,word ptr [SI]
    dec word ptr [SI]
    or AX,AX
    jg LAB_1000_152a
    mov word ptr [SI],0h
    mov AX,offset aStoresExhauste
    push AX
    call tempStrcpy
    add SP,2h
    jmp LAB_1000_1631
LAB_1000_152a:
    mov word ptr [BP + -4h],1h
    jmp LAB_1000_1534
LAB_1000_1531:
    inc word ptr [BP + -4h]
LAB_1000_1534:
    cmp word ptr [BP + -4h],4h
    jge LAB_1000_1553
    mov BX,word ptr [BP + -4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    shl BX,1h
    db 83h, 0bfh, 2ah, 0bh, 00h  ; CMP word ptr [BX + 0...,0x0                 ;= ??
    jnz LAB_1000_1551
    mov word ptr [BP + -6h],AX
LAB_1000_1551:
    jmp LAB_1000_1531
LAB_1000_1553:
    cmp word ptr [BP + -6h],-1h
    jnz LAB_1000_155c
    jmp LAB_1000_1623
LAB_1000_155c:
    mov AX,word ptr [BP + -6h]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    shl AX,1h
    mov SI,AX
    mov AX,word ptr [_word_3BEC0]
    mov word ptr [SI + offset word_333D2], AX
    mov AX,word ptr [_word_3BED0]
    mov word ptr [SI + offset word_333D4], AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [SI + offset word_333D8], AX
    mov AX,word ptr [word_330B8]
    mov CX,AX
    shl AX,1h
    add AX,CX
    db 2Dh, 0Fh, 00h ; sub AX,0fh (force imm16 encoding)
    neg AX
    imul word ptr [_word_330C4]
    mov word ptr [SI + offset word_333DA], AX
    mov AX,word ptr [BP + 4h]
    jmp LAB_1000_15ab
LAB_1000_159b:
    mov word ptr [BP + -2h],0e77h
    jmp LAB_1000_15b7
LAB_1000_15a2:
    mov word ptr [BP + -2h],0e7dh
    jmp LAB_1000_15b7
    db 0EBh
    db 0Ch
LAB_1000_15ab:
    db 3Dh, 01h, 00h ; cmp AX,1h (force imm16 encoding)
    jz LAB_1000_159b
    db 3Dh, 02h, 00h ; cmp AX,2h (force imm16 encoding)
    jz LAB_1000_15a2
    jmp LAB_1000_15b7
LAB_1000_15b7:
    push word ptr [BP + -2h]
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,offset aReleased
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    push word ptr [BP + -2h]
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,offset asc_3373D
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,0ah
    push AX
    mov AX,offset unk_3C030
    push AX
    mov BX,word ptr [BP + 4h]
    shl BX,1h
    push word ptr [BX + offset word_3309A]
    call _itoa
    add SP,6h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call sub_1A204
    add SP,2h
LAB_1000_1623:
    mov AX,2h
    push AX
    mov AX,16h
    push AX
    call makeSound
    add SP,4h
LAB_1000_1631:
    pop SI
    mov SP,BP
    pop BP
    ret
countermeasures endp
; ------------------------------seg000:0x1635------------------------------
; ------------------------------seg000:0x1636------------------------------
sub_11636 proc near
    push BP
    mov BP,SP
    sub SP,2h
    push SI
    mov word ptr [BP + -2h],0h
    jmp LAB_1000_1647
LAB_1000_1644:
    inc word ptr [BP + -2h]
LAB_1000_1647:
    cmp word ptr [BP + -2h],4h
    jge LAB_1000_1671
    mov AX,word ptr [BP + -2h]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    shl AX,1h
    mov SI,AX
    cmp word ptr [SI + offset word_333DA],0h
    jz LAB_1000_166f
    dec word ptr [SI + offset word_333DA]
    jnz LAB_1000_166f
    mov word ptr [SI + offset word_333D8],0h
LAB_1000_166f:
    jmp LAB_1000_1644
LAB_1000_1671:
    pop SI
    mov SP,BP
    pop BP
    ret
sub_11636 endp
; ------------------------------seg000:0x1675------------------------------
; ------------------------------seg000:0x1676------------------------------
sub_11676 proc near
    push BP
    mov BP,SP
    sub SP,0ch
    push SI
    mov word ptr [BP + -8h],0h
    jmp LAB_1000_1687
LAB_1000_1684:
    inc word ptr [BP + -8h]
LAB_1000_1687:
    mov AX,word ptr [word_3AFA4]
    db 05h, 04h, 00h ; add AX,4h (force imm16 encoding)
    cmp word ptr [BP + -8h],AX
    jge LAB_1000_16c2
    mov AX,word ptr [BP + -8h]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    shl AX,1h
    mov SI,AX
    cmp word ptr [SI + offset word_3C5AC],0h
    jz LAB_1000_16c0
    mov AX,word ptr [SI + offset word_3C5B2]
    add word ptr [SI + offset word_3C5AC],AX
    mov AX,word ptr [SI + offset word_3C5B4]
    add word ptr [SI + offset word_3C5AE],AX
    mov AX,word ptr [SI + offset word_3C5B6]
    add word ptr [SI + offset word_3C5B0],AX
LAB_1000_16c0:
    jmp LAB_1000_1684
LAB_1000_16c2:
    test byte ptr [_word_336E8],1h
    jnz LAB_1000_16cc
    jmp LAB_1000_183c
LAB_1000_16cc:
    mov AX,word ptr [_word_336E8]
    sar AX,1h
    cwd
    mov CX,word ptr [word_3AFA4]
    idiv CX
    mov word ptr [BP + -0ch],DX
    sub AX,AX
    push AX
    call sub_1D21E
    add SP,2h
    mov word ptr [BP + -4h],AX
    or AX,AX
    jnz LAB_1000_16ee
    jmp FUN_1000_17e8
LAB_1000_16ee:
    cmp word ptr [word_330B4],0h
    jg LAB_1000_16f8
    jmp FUN_1000_17e8
LAB_1000_16f8:
    cmp word ptr [word_3BE3C],0h
    jz LAB_1000_1702
    jmp FUN_1000_17e8
LAB_1000_1702:
    mov AX,3e8h
    push AX
    sub AX,AX
    push AX
    mov AX,28h
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    mov CX,word ptr [word_330B4]
    sub CX,AX
    push CX
    call _sub_1CF64
    add SP,6h
FUN_1000_1720:
    mov word ptr [word_330B4],AX
    mov AX,2h
    push AX
    mov AX,4h
    push AX
    call makeSound
    add SP,4h
    mov AX,0bah
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    mov word ptr [BP + -0ah],AX
    push AX
    push word ptr [_var_544]
    call _sub_1D178
    add SP,4h
    mov CL,5h
    shl AX,CL
    mov BX,word ptr [BP + -0ch]
    mov CX,BX
    shl BX,1h
    add BX,CX
    shl BX,1h
    shl BX,1h
    mov word ptr [BX + offset word_3C5B6],AX
    push word ptr [BP + -0ah]
    push word ptr [_var_544]
    call _sub_1D190
    add SP,4h
    mov word ptr [BP + -0ah],AX
    push AX
    push word ptr [_var_542]
    call _sub_1D178
    add SP,4h
    mov BX,word ptr [BP + -0ch]
    mov CX,BX
    shl BX,1h
    add BX,CX
    shl BX,1h
    shl BX,1h
    mov word ptr [BX + offset word_3C5B2],AX
    push word ptr [BP + -0ah]
    push word ptr [_var_542]
    call _sub_1D190
    add SP,4h
    neg AX
    mov BX,word ptr [BP + -0ch]
    mov CX,BX
    shl BX,1h
    add BX,CX
    shl BX,1h
    shl BX,1h
    mov word ptr [BX + offset word_3C5B4],AX
    mov AX,word ptr [BP + -0ch]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    shl AX,1h
    mov SI,AX
    mov AX,word ptr [SI + offset word_3C5B2]
    add AX,word ptr [_word_3BEC0]
    mov word ptr [SI + offset word_3C5AC],AX
    mov AX,word ptr [SI + offset word_3C5B4]
    add AX,word ptr [_word_3BED0]
    mov word ptr [SI + offset word_3C5AE],AX
    mov AX,word ptr [SI + offset word_3C5B6]
    add AX,word ptr [_var_547]
    db 2Dh, 02h, 00h ; sub AX,2h (force imm16 encoding)
    mov word ptr [SI + offset word_3C5B0],AX
    mov word ptr [word_38FE8],1h
    jmp LAB_1000_1801
FUN_1000_17e8:
    mov BX,word ptr [BP + -0ch]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    shl BX,1h
    mov word ptr [BX + offset word_3C5AC],0h
    mov word ptr [word_38FE8],0h
LAB_1000_1801:
    cmp word ptr [BP + -4h],0h
    jz LAB_1000_183c
    mov AX,offset aGun
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,0ah
    push AX
    mov AX,offset unk_3C030
    push AX
    push word ptr [word_330B4]
    call _itoa
    add SP,6h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call sub_1A204
    add SP,2h
LAB_1000_183c:
    pop SI
    mov SP,BP
    pop BP
    ret
sub_11676 endp
; ------------------------------seg000:0x1840------------------------------
; ------------------------------seg000:0x1841------------------------------
sub_11841 proc near
    push BP
    mov BP,SP
    sub SP,4h
    push DI
    push SI
    cmp word ptr [word_336F6],-1h
    jz LAB_1000_18cf
    mov word ptr [BP + -2h],0h
    jmp LAB_1000_185a
LAB_1000_1857:
    inc word ptr [BP + -2h]
LAB_1000_185a:
    cmp word ptr [BP + -2h],8h
    jge LAB_1000_187f
    mov SI,word ptr [BP + -2h]
    mov CL,3h
    shl SI,CL
    add word ptr [SI + offset stru_33402 + 4],0ah
    mov AX,word ptr [SI + offset stru_33402 + 4]
    mov CL,9h
    sar AX,CL
    add word ptr [SI + offset stru_33402 + 2],AX
    add byte ptr [SI + offset stru_33402 + 7],6h
    jmp LAB_1000_1857
LAB_1000_187f:
    test byte ptr [_word_336E8],0fh
    jnz LAB_1000_18cf
    mov AX,word ptr [_word_336E8]
    mov CL,4h
    sar AX,CL
    db 25h, 07h, 00h ; and AX,7h (force imm16 encoding)
    mov word ptr [BP + -4h],AX
    mov SI,AX
    mov CL,3h
    shl SI,CL
    mov DI,word ptr [word_336F6]
    mov CL,4h
    shl DI,CL
    mov AX,word ptr [DI + offset _stru_3AA5E]
LAB_1000_18a5:
    mov word ptr [SI + offset stru_33402],AX
    mov AX,word ptr [DI + offset _stru_3AA5E + 2]
    mov word ptr [SI + offset stru_33402 + 2],AX
    mov word ptr [SI + offset stru_33402 + 4],80h
    mov AX,100h
    push AX
    call randlmul
    add SP,2h
    mov CH,AL
    sub CL,CL
    mov word ptr [SI + offset stru_33402 + 6],CX
    mov AX,word ptr [BP + -4h]
    mov word ptr [word_33442],AX
LAB_1000_18cf:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
sub_11841 endp
; ------------------------------seg000:0x18d4------------------------------
; ------------------------------seg000:0x18d5------------------------------
sub_118D5 equ _sub_118D5
; ------------------------------seg000:0x18f5------------------------------
; ------------------------------seg000:0x18f6------------------------------
sub_118F6 proc near
    push BP
    mov BP,SP
    sub SP,8h
    push SI
    call sub_1D1E8
    call sub_18E38
    mov AX,1000h
    push AX
    call randlmul
    add SP,2h
    and AX,7ff8h
    mov word ptr [_word_336E8],AX
    mov AX,word ptr [word_3B14C]
    add AX,word ptr [word_3B15E]
    mov word ptr [BP + -2h],AX
    mov AX,10h
    push AX
    call randlmul
    add SP,2h
    les BX,dword ptr [_gameData]
    mov SI,AX
    cmp word ptr ES:[BX + 38h],6h
    jnz LAB_1000_1939
    mov AX,5h
    jmp LAB_1000_193c
LAB_1000_1939:
    mov AX,9h
LAB_1000_193c:
    cmp AX,SI
    jge LAB_1000_1945
    mov AX,1h
    jmp LAB_1000_1947
LAB_1000_1945:
    sub AX,AX
LAB_1000_1947:
    mov word ptr [_word_330BC],AX
    or AX,AX
    jz LAB_1000_1958
    cmp byte ptr [_byte_32933],0h
    jz LAB_1000_1958
    call _setupDac
LAB_1000_1958:
    mov AX,word ptr [BP + -2h]
    db 25h, 0Fh, 00h ; and AX,0fh (force imm16 encoding)
    mov CH,AL
    sub CL,CL
    mov word ptr [word_38F70],CX
    mov word ptr [word_38FE0],0h
    pop SI
    mov SP,BP
    pop BP
    ret
sub_118F6 endp
; ------------------------------seg000:0x1970------------------------------
; ------------------------------seg000:0x1971------------------------------
sub_11971 proc near
    push BP
    mov BP,SP
    sub SP,2h
    mov word ptr [BP + -2h],0h
    jmp LAB_1000_1981
LAB_1000_197e:
    inc word ptr [BP + -2h]
LAB_1000_1981:
    mov AX,word ptr [_word_3C046]
    cmp word ptr [BP + -2h],AX
    jge LAB_1000_1999
    mov AX,24h
    imul word ptr [BP + -2h]
    mov BX,AX
    mov word ptr [BX + offset _stru_3B208 + 26],0ffffh
    jmp LAB_1000_197e
LAB_1000_1999:
    mov word ptr [word_336E6],0ffffh
    mov SP,BP
    pop BP
    ret
sub_11971 endp
; ------------------------------seg000:0x19a2------------------------------
; ------------------------------seg000:0x19a3------------------------------
sub_119A3 proc near
    push BP
    mov BP,SP
    sub SP,6h
    push SI
    sub AX,AX
    mov word ptr [word_33096],AX
    mov word ptr [word_3BF90],AX
    mov word ptr [BP + -2h],AX
    jmp LAB_1000_19ba
LAB_1000_19b7:
    inc word ptr [BP + -2h]
LAB_1000_19ba:
    cmp word ptr [BP + -2h],3h
    jge LAB_1000_19f2
    mov AX,word ptr [BP + -2h]
    shl AX,1h
    add AX,word ptr [_commData]
    mov DX,word ptr [_commData+2]
    mov word ptr [BP + -6h],AX
    mov word ptr [BP + -4h],DX
    mov SI,word ptr [BP + -2h]
    mov CL,2h
    shl SI,CL
    les BX,dword ptr [BP + -6h]
    mov AX,word ptr ES:[BX + 38h]
    mov word ptr [SI + offset _missileSpecIndex],AX
    les BX,dword ptr [BP + -6h]
    mov AX,word ptr ES:[BX + 40h]
    mov word ptr [SI + offset _missileSpecIndex + 2],AX
    jmp LAB_1000_19b7
LAB_1000_19f2:
    mov word ptr [word_330B4],3e8h
    mov word ptr [word_33098],2710h
    mov word ptr [word_3309E],12h
    mov word ptr [word_3309C],0ch
    call _sub_11A18
    call sub_1606C
    call _sub_15FDB
    pop SI
    mov SP,BP
    pop BP
    ret
sub_119A3 endp
; ------------------------------seg000:0x1a17------------------------------
; ------------------------------seg000:0x1a18------------------------------
_sub_11A18 proc near
    push BP
    mov BP,SP
    sub SP,4h
    cmp word ptr [_word_330C2],0h
    jnz LAB_1000_1a27
    jmp LAB_1000_1a84
LAB_1000_1a27:
    mov word ptr [BP + -4h],0h
    jmp LAB_1000_1a31
LAB_1000_1a2e:
    inc word ptr [BP + -4h]
LAB_1000_1a31:
    cmp word ptr [BP + -4h],3h
    jge LAB_1000_1a84
    sub AX,AX
    push AX
    call _sub_19E44
    add SP,2h
    mov BX,word ptr [BP + -4h]
    shl BX,1h
    mov AX,word ptr [BX + offset word_38202]
    mov word ptr [BP + -2h],AX
    mov AX,offset allocSize
    push AX
    mov AX,word ptr [BP + -2h]
    db 05h, 02h, 00h ; add AX,2h (force imm16 encoding)
    push AX
    mov AX,0beh
    push AX
    mov AX,word ptr [BP + -2h]
    dec AX
    push AX
    call _sub_19E5D
    add SP,8h
    mov AX,0ch
    push AX
    mov AX,0beh
    push AX
    push word ptr [BP + -2h]
    mov BX,word ptr [BP + -4h]
    shl BX,1h
    shl BX,1h
    push word ptr [BX + offset _missileSpecIndex + 2]
    call _sub_1A183
    add SP,8h
    jmp LAB_1000_1a2e
LAB_1000_1a84:
    mov SP,BP
    pop BP
    ret
_sub_11A18 endp
; ------------------------------seg000:0x1a87------------------------------
; ------------------------------seg000:0x1a88------------------------------
_sub_11A88 proc near
    push BP
    mov BP,SP
    push SI
    cmp word ptr [_word_330C2],0h
    jnz LAB_1000_1a96
    jmp LAB_1000_1b32
LAB_1000_1a96:
    mov BX,word ptr [_var_564]
    mov word ptr [BX + 4h],0h
    mov BX,word ptr [word_3374A]
    shl BX,1h
    mov SI,word ptr [BX + offset asc_33744]
    mov AX,0c4h
    push AX
    lea AX,[SI + 6h]
    push AX
    mov AX,0c4h
    push AX
    push SI
    call _sub_19BE1
    add SP,8h
    mov BX,word ptr [_var_564]
    mov word ptr [BX + 4h],7h
    mov BX,word ptr [word_3374A]
    shl BX,1h
    mov SI,word ptr [BX + offset asc_33744]
    mov AX,0c5h
    push AX
    lea AX,[SI + 6h]
    push AX
    mov AX,0c5h
    push AX
    push SI
    call _sub_19BE1
    add SP,8h
    mov BX,word ptr [_var_564]
    mov word ptr [BX + 4h],0ch
    mov BX,word ptr [BP + 4h]
    shl BX,1h
    mov SI,word ptr [BX + offset asc_33744]
    mov AX,0c4h
    push AX
    lea AX,[SI + 6h]
    push AX
    mov AX,0c4h
    push AX
    push SI
    call _sub_19BE1
    add SP,8h
    mov BX,word ptr [_var_564]
    mov word ptr [BX + 4h],4h
    mov BX,word ptr [BP + 4h]
    shl BX,1h
    mov SI,word ptr [BX + offset asc_33744]
    mov AX,0c5h
    push AX
    lea AX,[SI + 6h]
    push AX
    mov AX,0c5h
    push AX
    push SI
    call _sub_19BE1
    add SP,8h
    mov AX,word ptr [BP + 4h]
    mov word ptr [word_3374A],AX
LAB_1000_1b32:
    pop SI
    mov SP,BP
    pop BP
    ret
_sub_11A88 endp
; ------------------------------seg000:0x1b36------------------------------
; ------------------------------seg000:0x1b37------------------------------
sub_11B37 proc near
    push BP
    mov BP,SP
    cmp word ptr [word_3BE3C],0h
    jz LAB_1000_1b49
    cmp word ptr [BP + 4h],0h
    jz LAB_1000_1b49
    jmp LAB_1000_1bbf
LAB_1000_1b49:
    mov byte ptr [_word_3C6AC+204h],1h
    les BX,dword ptr [_commData]
    mov AX,word ptr [BP + 4h]
    mov word ptr ES:[BX + 28h],AX
    cmp word ptr [BP + 4h],0h
    jnz LAB_1000_1b70
    cmp word ptr [word_3BE3C],0h
    jnz LAB_1000_1b70
    les BX,dword ptr [_commData]
    mov word ptr ES:[BX + 26h],3h
LAB_1000_1b70:
    les BX,dword ptr [_commData]
    mov AX,word ptr [_word_3BEC0]
    mov word ptr ES:[BX + 74h],AX
    les BX,dword ptr [_commData]
    mov AX,word ptr [_word_3BED0]
    mov word ptr ES:[BX + 76h],AX
    les BX,dword ptr [_commData]
    mov AX,word ptr [word_33096]
    mov word ptr ES:[BX + 34h],AX
    les BX,dword ptr [_commData]
    mov AX,word ptr [word_3BF90]
    mov word ptr ES:[BX + 36h],AX
    les BX,dword ptr [_commData]
    mov AX,word ptr [word_38FF6]
    mov word ptr ES:[BX + 40h],AX
    les BX,dword ptr [_commData]
    mov AX,word ptr [word_33710]
    mov word ptr ES:[BX + 42h],AX
    sub AX,AX
    push AX
    mov AX,8h
    push AX
    call sub_11D10
    add SP,4h
LAB_1000_1bbf:
    mov SP,BP
    pop BP
    ret
sub_11B37 endp
; ------------------------------seg000:0x1bc2------------------------------
; ------------------------------seg000:0x1bc3------------------------------
sub_11BC3 equ _sub_11BC3
; ------------------------------seg000:0x1bfc------------------------------
; ------------------------------seg000:0x1bfd------------------------------
sub_11BFD equ _sub_11BFD
; ------------------------------seg000:0x1c20------------------------------
; ------------------------------seg000:0x1c21------------------------------
sub_11C21 proc near
    push BP
    mov BP,SP
    sub SP,2h
    cmp word ptr [_word_3370C],-1h
    jz LAB_1000_1c31
    jmp LAB_1000_1d0c
LAB_1000_1c31:
    mov word ptr [_word_330B6],1f4h
    mov word ptr [_word_3370E],2h
    mov AX,3h
    push AX
    call randlmul
    add SP,2h
    jmp LAB_1000_1cf6
LAB_1000_1c4a:
    mov AX,word ptr [_word_3BED2]
    db 2Dh, 03h, 00h ; sub AX,3h (force imm16 encoding)
    push AX
    call randlmul
    add SP,2h
    db 05h, 03h, 00h ; add AX,3h (force imm16 encoding)
    mov word ptr [BP + -2h],AX
    db 05h, 40h, 00h ; add AX,40h (force imm16 encoding)
    mov word ptr [_word_3C02E],AX
    mov word ptr [_keyValue],89h
    push word ptr [BP + -2h]
    call placeString
    add SP,2h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    jmp LAB_1000_1d0c
LAB_1000_1c7f:
    push word ptr [_word_3C046]
    call randlmul
    add SP,2h
    mov word ptr [BP + -2h],AX
    mov AX,24h
    imul word ptr [BP + -2h]
    mov BX,AX
    cmp word ptr [BX + offset _stru_3B208 + 20],0h
    jz LAB_1000_1c7f
    mov AX,word ptr [BP + -2h]
    db 05h, 20h, 00h ; add AX,20h (force imm16 encoding)
    mov word ptr [_word_3C02E],AX
    mov word ptr [_keyValue],89h
    mov AX,24h
    imul word ptr [BP + -2h]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_3B208 + 16]
    mov CL,5h
    shl AX,CL
    add AX,2c8h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,offset aOnPatrol
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    jmp LAB_1000_1d0c
LAB_1000_1ce2:
    mov word ptr [_keyValue],87h
    mov AX,offset aF15StrikeEagle
    push AX
    call tempStrcpy
    add SP,2h
    jmp LAB_1000_1d0c
    db 0EBh
    db 16h
LAB_1000_1cf6:
    or AX,AX
    jnz LAB_1000_1cfd
    jmp LAB_1000_1c4a
LAB_1000_1cfd:
    db 3Dh, 01h, 00h ; cmp AX,1h (force imm16 encoding)
    jnz LAB_1000_1d05
    jmp LAB_1000_1c7f
LAB_1000_1d05:
    db 3Dh, 02h, 00h ; cmp AX,2h (force imm16 encoding)
    jz LAB_1000_1ce2
    jmp LAB_1000_1d0c
LAB_1000_1d0c:
    mov SP,BP
    pop BP
    ret
sub_11C21 endp
; ------------------------------seg000:0x1d0f------------------------------
; ------------------------------seg000:0x1d10------------------------------
sub_11D10 proc near
    push BP
    mov BP,SP
    push SI
    cmp word ptr [_var_654],0ffh
    jl LAB_1000_1d1e
    jmp LAB_1000_1d69
LAB_1000_1d1e:
    mov AX,word ptr [_var_654]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AX,word ptr [word_38FE0]
    mov word ptr [SI + offset _byte_3B7FC],AX
    mov AX,word ptr [_word_3BEC0]
    mov CL,7h
    shr AX,CL
    mov byte ptr [SI + offset _byte_3B7FC + 2],AL
    mov AX,word ptr [_word_3BED0]
    shr AX,CL
    mov byte ptr [SI + offset _byte_3B7FC + 3],AL
    mov AL,byte ptr [BP + 4h]
    mov byte ptr [SI + offset _byte_3B7FC + 4],AL
    mov AL,byte ptr [BP + 6h]
    mov byte ptr [SI + offset _byte_3B7FC + 5],AL
    inc word ptr [_var_654]
    mov BX,word ptr [_var_654]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov byte ptr [BX + offset _byte_3B7FC + 4],0h
LAB_1000_1d69:
    pop SI
    mov SP,BP
    pop BP
    ret
sub_11D10 endp
; ------------------------------seg000:0x1d6d------------------------------
; ------------------------------seg000:0x1d6e------------------------------
placeString proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _stru_3AA5E + 12]
    and BX,7fh
    shl BX,1h
    push word ptr [BX + offset _word_3C0A2]
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov BX,word ptr [BP + 4h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _word_3AA5C]
    shl BX,1h
    push word ptr [BX + offset _word_3C0A2]
    call _strlen
    add SP,2h
    or AX,AX
    jz LAB_1000_1df1
    mov BX,word ptr [BP + 4h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _stru_3AA5E + 12]
    and BX,7fh
    shl BX,1h
    push word ptr [BX + offset _word_3C0A2]
    call _strlen
    add SP,2h
    or AX,AX
    jz LAB_1000_1dd6
    mov AX,offset aAt
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
LAB_1000_1dd6:
    mov BX,word ptr [BP + 4h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _word_3AA5C]
    shl BX,1h
    push word ptr [BX + offset _word_3C0A2]
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
LAB_1000_1df1:
    mov AX,offset strBuf
    push AX
    call _strlen
    add SP,2h
    db 3Dh, 19h, 00h ; cmp AX,19h (force imm16 encoding)
    jle LAB_1000_1e0a
    mov byte ptr [byte_38F8C],2eh
    mov byte ptr [byte_38F8D],0h
LAB_1000_1e0a:
    mov SP,BP
    pop BP
    ret
placeString endp
; ------------------------------seg000:0x1e0d------------------------------
; ------------------------------seg000:0x1f3e------------------------------
sub_11F3E proc near
    push BP
    mov BP,SP
    sub SP,4h
    push DI
    push SI
    mov AX,word ptr [_var_143]
    mov word ptr [BP + -4h],AX
    mov word ptr [BP + -2h],0h
    jmp LAB_1000_1f56
LAB_1000_1f53:
    inc word ptr [BP + -2h]
LAB_1000_1f56:
    cmp word ptr [BP + -2h],2h
    jl LAB_1000_1f5f
    jmp LAB_1000_203d
LAB_1000_1f5f:
    mov AX,12h
    imul word ptr [BP + -2h]
    mov SI,AX
    mov AX,word ptr [SI + offset _word_3B14A]
    mov CL,8h
    sar AX,CL
    or AX,AX
    jnz LAB_1000_1f76
    jmp LAB_1000_203a
LAB_1000_1f76:
    mov DI,word ptr [SI + offset word_3B146]
    mov CL,4h
    shl DI,CL
    mov AX,word ptr [DI + offset _stru_3AA5E + 2]
    sub DX,DX
    sub AX,8000h
    sbb DX,DX
    neg AX
    adc DX,0h
    neg DX
    mov CL,5h
LAB_1000_1f92:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_1f9c
    jmp LAB_1000_1f92
LAB_1000_1f9c:
    push DX
    push AX
    mov AX,word ptr [DI + offset _stru_3AA5E]
    sub DX,DX
    mov CL,5h
LAB_1000_1fa6:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_1fb0
    jmp LAB_1000_1fa6
LAB_1000_1fb0:
    push DX
    push AX
    call sub_12FDA
    add SP,8h
    mov word ptr [word_39808],AX
    or AX,AX
    jz LAB_1000_201d
    mov BX,AX
    mov BX,word ptr [BX]
    mov AL,byte ptr [BX + offset _byte_3BFA4]
    mov BX,word ptr [BP + -4h]
    mov byte ptr [BX + offset _byte_3BFA4],AL
    mov BX,word ptr [word_39808]
    mov BX,word ptr [BX]
    shl BX,1h
    push word ptr [BX + offset _word_3C0A2]
    mov BX,word ptr [BP + -4h]
    shl BX,1h
    push word ptr [BX + offset _word_3C0A2]
    call _strcpy
    add SP,4h
    mov SI,word ptr [BP + -4h]
    shl SI,1h
    push word ptr [SI + offset _word_3C0A2]
    call _strlen
    add SP,2h
    mov CX,word ptr [SI + offset _word_3C0A2]
    add CX,AX
    inc CX
    mov word ptr [SI + offset _word_3C0A2 + 2],CX
    mov SI,word ptr [BP + -4h]
    add SI,100h
    push SI
    push SI
    call sub_1CF32
    add SP,2h
    push AX
    push word ptr [word_39808]
    call sub_13224
    add SP,6h
LAB_1000_201d:
    mov AX,12h
    imul word ptr [BP + -2h]
    mov BX,AX
    mov BX,word ptr [BX + offset word_3B146]
    mov CL,4h
    shl BX,CL
    mov AX,word ptr [BP + -4h]
    add AH,1h
    mov word ptr [BX + offset _stru_3AA5E + 12],AX
    inc word ptr [BP + -4h]
LAB_1000_203a:
    jmp LAB_1000_1f53
LAB_1000_203d:
    mov word ptr [word_33704],0h
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
sub_11F3E endp
; ------------------------------seg000:0x2048------------------------------
; ------------------------------seg000:0x21a9------------------------------
; ------------------------------seg000:0x21c4------------------------------
    nop
; ------------------------------seg000:0x21c6------------------------------
callLoad3DAll proc near
    call callLoad3DAll
    ret
callLoad3DAll endp
; ------------------------------seg000:0x21c9------------------------------
; ------------------------------seg000:0x21ca------------------------------
_sub_121CA proc near
    push BP
    mov BP,SP
    push SI
    mov BX,word ptr [_var_134]
    mov AX,word ptr [BP + 18h]
    mov word ptr [BX + 0eh],AX
    mov BX,word ptr [_var_134]
    mov AX,word ptr [BP + 18h]
    add AX,word ptr [BP + 1ch]
    dec AX
    mov word ptr [BX + 10h],AX
    mov BX,word ptr [_var_134]
    mov AX,word ptr [BP + 16h]
    mov word ptr [BX + 12h],AX
    mov BX,word ptr [_var_134]
    mov AX,word ptr [BP + 16h]
    add AX,word ptr [BP + 1ah]
    dec AX
    mov word ptr [BX + 14h],AX
    call far ptr _gfx_jump_2d
    sub AH,AH
    mov BX,word ptr [_var_134]
    mov word ptr [BX],AX
    push word ptr [_var_595]
    call _sub_12278
    add SP,2h
    mov BX,word ptr [_var_134]
    mov SI,word ptr [_word_3BE98]
    and SI,0ffh
    mov AL,byte ptr [SI + offset byte_3419C]
    sub AH,AH
    mov word ptr [BX + 4h],AX
    mov AX,1h
    push AX
    push word ptr [BP + 12h]
    sub AX,AX
    push AX
    push AX
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    push word ptr [_var_134]
    call sub_13932
    add SP,10h
    push word ptr [BP + 14h]
    push word ptr [BP + 12h]
    push word ptr [BP + 10h]
    push word ptr [BP + 0eh]
    push word ptr [BP + 0ch]
    push word ptr [BP + 0ah]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call sub_122B8
    add SP,10h
    call sub_1A9F8
    call sub_139AA
    call sub_1B147
    xor byte ptr [_var_135],1h
    pop SI
    pop BP
    ret
    nop
_sub_121CA endp
; _copySomeMem - now in C (egame2.c)
; ------------------------------seg000:0x22b7------------------------------
; ------------------------------seg000:0x22b8------------------------------
sub_122B8 proc near
    push BP
    mov BP,SP
    sub SP,1ch
    push SI
    mov AX,word ptr [BP + 8h]
    mov DX,word ptr [BP + 0ah]
    mov [_word_3C8B6+2],AX
    mov word ptr [_word_3C8B6+4],DX
    mov AX,word ptr [BP + 0ch]
    mov DX,word ptr [BP + 0eh]
    mov [_word_3C8B6+6],AX
    mov word ptr [_word_3C8B6+8],DX
    mov AX,word ptr [BP + 10h]
    mov DX,word ptr [BP + 12h]
    mov [_word_3C8B6+0Ah],AX
    mov word ptr [_word_3C8B6+0Ch],DX
    mov AX,[_word_3C8B6+2]
    mov DX,word ptr [_word_3C8B6+4]
    mov word ptr [BP + 8h],AX
    mov word ptr [BP + 0ah],DX
    mov AX,[_word_3C8B6+6]
    mov DX,word ptr [_word_3C8B6+8]
    mov word ptr [BP + 0ch],AX
    mov word ptr [BP + 0eh],DX
    mov AX,[_word_3C8B6+0Ah]
    mov DX,word ptr [_word_3C8B6+0Ch]
    mov word ptr [BP + 10h],AX
    mov word ptr [BP + 12h],DX
    mov AX,word ptr [BP + 4h]
    neg AX
    add AH,10h
    mov CL,0dh
    shr AX,CL
    mov word ptr [BP + -6h],AX
    cmp word ptr [_word_38FDC],0h
    jz LAB_1000_2328
    mov AX,4h
    jmp LAB_1000_232b
LAB_1000_2328:
    mov AX,3h
LAB_1000_232b:
    mov word ptr [word_3C16C],AX
    jmp LAB_1000_2334
LAB_1000_2330:
    dec word ptr [word_3C16C]
LAB_1000_2334:
    cmp word ptr [word_3C16C],1h
    jge LAB_1000_233e
    jmp LAB_1000_26af
LAB_1000_233e:
    mov BX,word ptr [word_3C16C]
    shl BX,1h
    db 83h, 0bfh, 0f2h, 12h, 00h  ; CMP word ptr [BX + 0...,0x0                 ;= ??
    jnz LAB_1000_234e
    jmp LAB_1000_26ac
LAB_1000_234e:
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [word_3C16C]
    call sub_126B4
    add SP,6h
    mov word ptr [BP + -18h],AX
    mov word ptr [BP + -16h],DX
    mov CL,0ch
LAB_1000_2366:
    shr DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_2370
    jmp LAB_1000_2366
LAB_1000_2370:
    mov word ptr [BP + -12h],AX
    mov AX,word ptr [BP + -18h]
    and AH,0fh
    mov word ptr [BP + -8h],AX
    push word ptr [BP + 0eh]
    push word ptr [BP + 0ch]
    push word ptr [word_3C16C]
    call sub_126B4
    add SP,6h
    mov word ptr [BP + -18h],AX
    mov word ptr [BP + -16h],DX
    mov CL,0ch
LAB_1000_2394:
    shr DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_239e
    jmp LAB_1000_2394
LAB_1000_239e:
    mov word ptr [BP + -14h],AX
    mov AX,word ptr [BP + -18h]
    and AH,0fh
    mov word ptr [BP + -0ch],AX
    push word ptr [BP + 12h]
    push word ptr [BP + 10h]
    push word ptr [word_3C16C]
    call sub_126B4
    add SP,6h
    mov word ptr [BP + -18h],AX
    mov word ptr [BP + -16h],DX
    or DX,DX
    jz LAB_1000_23c7
    jmp LAB_1000_26ac
LAB_1000_23c7:
    jc LAB_1000_23d1
    cmp AX,7fffh
    jc LAB_1000_23d1
    jmp LAB_1000_26ac
LAB_1000_23d1:
    mov AX,word ptr [BP + -18h]
    mov DX,word ptr [BP + -16h]
    or DX,DX
    jnz LAB_1000_23e7
    jc LAB_1000_23e2
    db 3Dh, 02h, 00h ; cmp AX,2h (force imm16 encoding)
    jnc LAB_1000_23e7
LAB_1000_23e2:
    sub DX,DX
    mov AX,2h
LAB_1000_23e7:
    mov word ptr [_var_659],AX
    mov word ptr [BP + -0eh],0h
    jmp LAB_1000_23f4
LAB_1000_23f1:
    inc word ptr [BP + -0eh]
LAB_1000_23f4:
    cmp word ptr [word_3C16C],4h
    jz LAB_1000_23fe
    jmp LAB_1000_248a
LAB_1000_23fe:
    cmp word ptr [_word_38FDC],2h
    jge LAB_1000_2408
    jmp LAB_1000_248a
LAB_1000_2408:
    cmp word ptr [BP + -0eh],0fh
    jnz LAB_1000_2411
    jmp LAB_1000_26ac
LAB_1000_2411:
    mov AX,word ptr [BP + -0eh]
    shl AX,1h
    mov SI,AX
    mov AX,12h
    mul word ptr [BP + -6h]
    mov BX,AX
    mov AX,word ptr [BX + SI + offset word_339F4]
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [BP + -6h]
    db 05h, 02h, 00h ; add AX,2h (force imm16 encoding)
    db 25h, 07h, 00h ; and AX,7h (force imm16 encoding)
    mov CX,12h
    mul CX
    mov BX,AX
    mov AX,word ptr [BX + SI + offset word_339F4]
    mov word ptr [BP + -4h],AX
    mov AX,word ptr [BP + -8h]
    mov DX,word ptr [BP + -2h]
    mov CL,0ch
    shl DX,CL
    sub AX,DX
    sub AX,800h
    mov word ptr [_var_657],AX
    mov AX,word ptr [BP + -0ch]
    mov DX,word ptr [BP + -4h]
    shl DX,CL
    sub AX,DX
    sub AX,800h
    mov word ptr [_var_658],AX
    mov word ptr [_var_217],7h
    mov AX,word ptr [_var_659]
    neg AX
    push AX
    mov AX,word ptr [_var_658]
    neg AX
    push AX
    mov AX,word ptr [_var_657]
    neg AX
    push AX
    call far ptr sub_202C7
    add SP,6h
    or AX,AX
    jz LAB_1000_2487
    jmp LAB_1000_26a9
LAB_1000_2487:
    jmp LAB_1000_2515
LAB_1000_248a:
    cmp word ptr [BP + -0eh],9h
    jnz LAB_1000_2493
    jmp LAB_1000_26ac
LAB_1000_2493:
    cmp word ptr [word_3C16C],4h
    jz LAB_1000_24aa
    cmp word ptr [_word_38FDC],2h
    jge LAB_1000_24aa
    cmp word ptr [BP + -0eh],4h
    jge LAB_1000_24aa
    jmp LAB_1000_26a9
LAB_1000_24aa:
    cmp word ptr [BP + 6h],0d555h
    jge LAB_1000_24c6
    mov SI,word ptr [BP + -0eh]
    shl SI,1h
    mov AX,word ptr [SI + offset word_33B74]
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [SI + offset word_33B86]
    mov word ptr [BP + -4h],AX
    jmp LAB_1000_24f3
LAB_1000_24c6:
    mov AX,word ptr [BP + -0eh]
    shl AX,1h
    mov SI,AX
    mov AX,12h
    mul word ptr [BP + -6h]
    mov BX,AX
    mov AX,word ptr [BX + SI + offset word_339F4]
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [BP + -6h]
    db 05h, 02h, 00h ; add AX,2h (force imm16 encoding)
    db 25h, 07h, 00h ; and AX,7h (force imm16 encoding)
    mov CX,12h
    mul CX
    mov BX,AX
    mov AX,word ptr [BX + SI + offset word_339F4]
    mov word ptr [BP + -4h],AX
LAB_1000_24f3:
    mov AX,word ptr [BP + -8h]
    mov DX,word ptr [BP + -2h]
    mov CL,0ch
    shl DX,CL
    sub AX,DX
    sub AX,800h
    mov word ptr [_var_657],AX
    mov AX,word ptr [BP + -0ch]
    mov DX,word ptr [BP + -4h]
    shl DX,CL
    sub AX,DX
    sub AX,800h
    mov word ptr [_var_658],AX
LAB_1000_2515:
    push word ptr [_var_659]
    push word ptr [_var_658]
    push word ptr [_var_657]
    call sub_13A90
    add SP,6h
    mov AX,word ptr [BP + -14h]
    add AX,word ptr [BP + -4h]
    push AX
    mov AX,word ptr [BP + -12h]
    add AX,word ptr [BP + -2h]
    push AX
    push word ptr [word_3C16C]
    call process3dg
    add SP,6h
    mov word ptr [BP + -1ah],AX
    db 3Dh, 0FFh, 0FFh ; cmp AX,0ffffh (force imm16 encoding)
    jnz LAB_1000_254a
    jmp LAB_1000_26a9
LAB_1000_254a:
    cmp word ptr [BP + -0eh],4h
    jge LAB_1000_255a
    cmp word ptr [_word_38FDC],2h
    jge LAB_1000_255a
    jmp LAB_1000_264e
LAB_1000_255a:
    cmp word ptr [_word_38FDC],2h
    jnz LAB_1000_2565
    sub AX,AX
    jmp LAB_1000_256b
LAB_1000_2565:
    mov AH,byte ptr [word_3C16C]
    sub AL,AL
LAB_1000_256b:
    mov word ptr [_var_141],AX
    mov SI,word ptr [BP + -1ah]
    shl SI,1h
    mov BX,word ptr [word_3C16C]
    mov CL,6h
    shl BX,CL
    mov AX,word ptr [BX + SI + offset _matrix3dt_2]
    mov word ptr [word_3C5A8],AX
    mov word ptr [BP + -0ah],0h
    jmp LAB_1000_258c
LAB_1000_2589:
    inc word ptr [BP + -0ah]
LAB_1000_258c:
    mov SI,word ptr [BP + -1ah]
    shl SI,1h
    mov BX,word ptr [word_3C16C]
    mov CL,6h
    shl BX,CL
    mov AX,word ptr [BP + -0ah]
    cmp word ptr [BX + SI + offset _matrix3dt + 198],AX
    ja LAB_1000_25a5
    jmp LAB_1000_264c
LAB_1000_25a5:
    mov BX,word ptr [word_3C5A8]
    test byte ptr [BX + 6h],80h
    jz LAB_1000_2604
    mov AX,word ptr [BP + -14h]
    add AX,word ptr [BP + -4h]
    push AX
    mov AX,word ptr [BP + -12h]
    add AX,word ptr [BP + -2h]
    push AX
    push word ptr [BP + -0ah]
    push word ptr [word_3C16C]
    call sub_13266
    add SP,8h
    db 05h, 00h, 00h ; add AX,0h (force imm16 encoding)
    mov word ptr [_var_200],AX
    mov word ptr [_var_201],228dh
    mov AX,0h
    mov DX,228dh
    cmp AX,word ptr [_var_200]
    jnz LAB_1000_2602
    cmp DX,word ptr [_var_201]
    jnz LAB_1000_2602
    mov BX,word ptr [word_3C5A8]
    mov BL,byte ptr [BX + 6h]
    and BX,7fh
    shl BX,1h
    mov AX,word ptr [BX + offset _buf3d3]
    db 05h, 00h, 00h ; add AX,0h (force imm16 encoding)
    mov word ptr [_var_200],AX
    mov word ptr [_var_201],DX
LAB_1000_2602:
    jmp LAB_1000_261f
LAB_1000_2604:
    mov BX,word ptr [word_3C5A8]
    mov BL,byte ptr [BX + 6h]
    sub BH,BH
    shl BX,1h
    mov AX,word ptr [BX + offset _buf3d3]
    db 05h, 00h, 00h ; add AX,0h (force imm16 encoding)
    mov word ptr [_var_200],AX
    mov word ptr [_var_201],228dh
LAB_1000_261f:
    mov BX,word ptr [word_3C5A8]
    push word ptr [BX + 4h]
    push word ptr [BX + 2h]
    push word ptr [BX]
    sub AX,AX
    push AX
    push AX
    push AX
    push word ptr [_var_201]
    push word ptr [_var_200]
    call far ptr sub_20104
    add SP,10h
    add word ptr [word_3C5A8],7h
    inc word ptr [_var_141]
    jmp LAB_1000_2589
LAB_1000_264c:
    jmp LAB_1000_26a9
LAB_1000_264e:
    cmp word ptr [word_3C16C],4h
    jnz LAB_1000_26a9
    mov SI,word ptr [BP + -1ah]
    shl SI,1h
    mov BX,word ptr [word_3C16C]
    mov CL,6h
    shl BX,CL
    mov AX,word ptr [BX + SI + offset _matrix3dt_2]
    mov word ptr [word_3C5A8],AX
    mov BX,AX
    mov BL,byte ptr [BX + 6h]
    sub BH,BH
    shl BX,1h
    mov AX,word ptr [BX + offset _buf3d3]
    db 05h, 00h, 00h ; add AX,0h (force imm16 encoding)
    mov word ptr [_var_200],AX
    mov word ptr [_var_201],228dh
    mov word ptr [_var_141],400h
    mov BX,word ptr [word_3C5A8]
    push word ptr [BX + 4h]
    push word ptr [BX + 2h]
    push word ptr [BX]
    sub AX,AX
    push AX
    push AX
    push AX
    push word ptr [_var_201]
    push word ptr [_var_200]
    call far ptr sub_20104
    add SP,10h
LAB_1000_26a9:
    jmp LAB_1000_23f1
LAB_1000_26ac:
    jmp LAB_1000_2330
LAB_1000_26af:
    pop SI
    mov SP,BP
    pop BP
    ret
sub_122B8 endp
; ------------------------------seg000:0x26b3------------------------------
; ------------------------------seg000:0x26b4------------------------------
sub_126B4 proc near
    push BP
    mov BP,SP
    mov AX,word ptr [BP + 4h]
    jmp LAB_1000_2720
LAB_1000_26bc:
    mov AX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    db 05h, 20h, 00h ; add AX,20h (force imm16 encoding)
    adc DX,0h
    mov CL,6h
LAB_1000_26ca:
    shr DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_26d4
    jmp LAB_1000_26ca
LAB_1000_26d4:
    jmp LAB_1000_273a
LAB_1000_26d6:
    mov AX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    db 05h, 08h, 00h ; add AX,8h (force imm16 encoding)
    adc DX,0h
    mov CL,4h
LAB_1000_26e4:
    shr DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_26ee
    jmp LAB_1000_26e4
LAB_1000_26ee:
    jmp LAB_1000_273a
LAB_1000_26f0:
    mov AX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    db 05h, 02h, 00h ; add AX,2h (force imm16 encoding)
    adc DX,0h
    mov CL,2h
LAB_1000_26fe:
    shr DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_2708
    jmp LAB_1000_26fe
LAB_1000_2708:
    jmp LAB_1000_273a
LAB_1000_270a:
    mov AX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    jmp LAB_1000_273a
LAB_1000_2712:
    mov AX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    shl AX,1h
    rcl DX,1h
    jmp LAB_1000_273a
    db 0EBh
    db 1Ah
LAB_1000_2720:
    or AX,AX
    jz LAB_1000_2712
    db 3Dh, 01h, 00h ; cmp AX,1h (force imm16 encoding)
    jz LAB_1000_270a
    db 3Dh, 02h, 00h ; cmp AX,2h (force imm16 encoding)
    jz LAB_1000_26f0
    db 3Dh, 03h, 00h ; cmp AX,3h (force imm16 encoding)
    jz LAB_1000_26d6
    db 3Dh, 04h, 00h ; cmp AX,4h (force imm16 encoding)
    jz LAB_1000_26bc
    jmp LAB_1000_273a
LAB_1000_273a:
    mov SP,BP
    pop BP
    ret
sub_126B4 endp
; ------------------------------seg000:0x273d------------------------------
; ------------------------------seg000:0x273e------------------------------
process3dg proc near
    push BP
    mov BP,SP
    push SI
    cmp word ptr [BP + 4h],4h
    jnz LAB_1000_2750
    add word ptr [BP + 6h],2h
    add word ptr [BP + 8h],2h
LAB_1000_2750:
    cmp word ptr [BP + 6h],0h
    jl LAB_1000_276f
    cmp word ptr [BP + 8h],0h
    jl LAB_1000_276f
    mov BX,word ptr [BP + 4h]
    shl BX,1h
    mov SI,word ptr [BX + offset word_33BAE]
    cmp word ptr [BP + 6h],SI
    jge LAB_1000_276f
    cmp word ptr [BP + 8h],SI
    jl LAB_1000_2774
LAB_1000_276f:
    sub AX,AX
    jmp LAB_1000_286e
LAB_1000_2774:
    mov AX,word ptr [BP + 4h]
    jmp LAB_1000_284b
LAB_1000_277a:
    mov SI,word ptr [BP + 8h]
    mov CL,3h
    shl SI,CL
    mov BX,word ptr [BP + 6h]
    mov AL,byte ptr [BX + SI + offset _byte_3A900]
    sub AH,AH
    jmp LAB_1000_286e
LAB_1000_278d:
    mov SI,word ptr [BP + 8h]
    mov CL,4h
    shl SI,CL
    mov BX,word ptr [BP + 6h]
    mov AL,byte ptr [BX + SI + offset _buf1_3dg]
    sub AH,AH
    jmp LAB_1000_286e
LAB_1000_27a0:
    mov AX,word ptr [BP + 8h]
    sar AX,1h
    sar AX,1h
    push AX
    mov AX,word ptr [BP + 6h]
    sar AX,1h
    sar AX,1h
    push AX
    mov AX,3h
    push AX
    call process3dg
    add SP,6h
    mov CL,4h
    shl AX,CL
    mov SI,word ptr [BP + 8h]
    and SI,3h
    shl SI,1h
    shl SI,1h
    add SI,AX
    mov BX,word ptr [BP + 6h]
    and BX,3h
    mov AL,byte ptr [BX + SI + offset _buf2_3dg]
    sub AH,AH
    jmp LAB_1000_286e
LAB_1000_27d9:
    mov AX,word ptr [BP + 8h]
    sar AX,1h
    sar AX,1h
    push AX
    mov AX,word ptr [BP + 6h]
    sar AX,1h
    sar AX,1h
    push AX
    mov AX,2h
    push AX
    call process3dg
    add SP,6h
    mov CL,4h
    shl AX,CL
    mov SI,word ptr [BP + 8h]
    and SI,3h
    shl SI,1h
    shl SI,1h
    add SI,AX
    mov BX,word ptr [BP + 6h]
    and BX,3h
    mov AL,byte ptr [BX + SI + offset _buf3_3dg]
    sub AH,AH
    jmp LAB_1000_286e
LAB_1000_2811:
    mov AX,word ptr [BP + 8h]
    sar AX,1h
    sar AX,1h
    push AX
    mov AX,word ptr [BP + 6h]
    sar AX,1h
    sar AX,1h
    push AX
    mov AX,1h
    push AX
    call process3dg
    add SP,6h
    mov CL,4h
    shl AX,CL
    mov SI,word ptr [BP + 8h]
    and SI,3h
    shl SI,1h
    shl SI,1h
    add SI,AX
    mov BX,word ptr [BP + 6h]
    and BX,3h
    mov AL,byte ptr [BX + SI + offset _buf4_3dg]
    sub AH,AH
    jmp LAB_1000_286e
    db 0EBh
    db 23h
LAB_1000_284b:
    or AX,AX
    jz LAB_1000_2811
    db 3Dh, 01h, 00h ; cmp AX,1h (force imm16 encoding)
    jz LAB_1000_27d9
    db 3Dh, 02h, 00h ; cmp AX,2h (force imm16 encoding)
    jnz LAB_1000_285c
    jmp LAB_1000_27a0
LAB_1000_285c:
    db 3Dh, 03h, 00h ; cmp AX,3h (force imm16 encoding)
    jnz LAB_1000_2864
    jmp LAB_1000_278d
LAB_1000_2864:
    db 3Dh, 04h, 00h ; cmp AX,4h (force imm16 encoding)
    jnz LAB_1000_286c
    jmp LAB_1000_277a
LAB_1000_286c:
    jmp LAB_1000_286e
LAB_1000_286e:
    pop SI
    mov SP,BP
    pop BP
    ret
    nop
process3dg endp
; ------------------------------seg000:0x2872------------------------------
; ------------------------------seg000:0x2fda------------------------------
sub_12FDA proc near
    push BP
    mov BP,SP
    sub SP,24h
    push DI
    push SI
    mov word ptr [word_3B7E2],7fffh
    mov word ptr [BP + -0ch],1h
    jmp LAB_1000_31fb
LAB_1000_2ff0:
    mov CL,2h
    shl word ptr [BP + -16h],CL
    shl word ptr [BP + -1ah],CL
LAB_1000_2ff8:
    mov BX,word ptr [word_3C5A8]
    mov AL,byte ptr [BX + 6h]
    sub AH,AH
    mov word ptr [BP + -14h],AX
    test byte ptr [BX + 6h],80h
    jz LAB_1000_3031
    push word ptr [BP + -1ch]
    push word ptr [BP + -18h]
    push word ptr [BP + -12h]
    push word ptr [BP + -0ch]
    call sub_13266
    add SP,8h
    or AX,AX
    jz LAB_1000_3031
    mov BX,word ptr [_var_660]
    mov CL,3h
    shl BX,CL
    mov AL,byte ptr [BX + offset byte_3B4EC]
    sub AH,AH
    mov word ptr [BP + -14h],AX
LAB_1000_3031:
    mov AX,word ptr [word_3B7E2]
    cmp word ptr [BP + -6h],AX
    jge LAB_1000_30b2
    mov BX,word ptr [BP + -14h]
    shl BX,1h
    mov AX,word ptr [BX + offset _buf3d3]
    db 05h, 00h, 00h ; add AX,0h (force imm16 encoding)
    mov word ptr [_var_200],AX
    mov word ptr [_var_201],228dh
    les BX,dword ptr [_var_200]
    cmp word ptr ES:[BX],0h
    jnz LAB_1000_3066
    cmp byte ptr ES:[BX + 2h],0h
    jnz LAB_1000_3066
    cmp word ptr [word_33704],0h
    jz LAB_1000_30b2
LAB_1000_3066:
    mov AL,byte ptr [BP + -0ch]
    mov byte ptr [byte_3B7EE],AL
    mov AL,byte ptr [BP + -12h]
    mov byte ptr [byte_3B7EF],AL
    mov AL,byte ptr [BP + -18h]
    mov byte ptr [byte_3B7F0],AL
    mov AL,byte ptr [BP + -1ch]
    mov byte ptr [byte_3B7F1],AL
    mov AX,word ptr [word_3C5A8]
    mov word ptr [word_3B7EC],AX
    mov AX,word ptr [BP + -14h]
    mov word ptr [word_3B7E0],AX
    mov AX,word ptr [BP + -6h]
    mov word ptr [word_3B7E2],AX
    mov AX,word ptr [BP + -16h]
    cwd
    add AX,word ptr [BP + 4h]
    adc DX,word ptr [BP + 6h]
    mov word ptr [word_3B7E4],AX
    mov word ptr [word_3B7E6],DX
    mov AX,word ptr [BP + -1ah]
    cwd
    add AX,word ptr [BP + 8h]
    adc DX,word ptr [BP + 0ah]
    mov word ptr [word_3B7E8],AX
    mov word ptr [word_3B7EA],DX
LAB_1000_30b2:
    add word ptr [word_3C5A8],7h
    inc word ptr [BP + -12h]
LAB_1000_30ba:
    mov SI,word ptr [BP + -0ch]
    mov CL,6h
    shl SI,CL
    mov BX,word ptr [BP + -22h]
    shl BX,1h
    mov AX,word ptr [BP + -12h]
    cmp word ptr [BX + SI + offset _matrix3dt + 198],AX
    jbe LAB_1000_311e
    mov BX,word ptr [word_3C5A8]
    mov BL,byte ptr [BX + 6h]
    and BX,7fh
    cmp byte ptr [BX + offset _byte_3BFA4],0h
    jz LAB_1000_30b2
    mov AX,word ptr [BP + -24h]
    mov BX,word ptr [word_3C5A8]
    add AX,word ptr [BX]
    mov word ptr [BP + -16h],AX
    mov AX,word ptr [BX + 2h]
    add AX,word ptr [BP + -2h]
    mov word ptr [BP + -1ah],AX
    push AX
    call _abs
    add SP,2h
    push word ptr [BP + -16h]
    mov SI,AX
    call _abs
    add SP,2h
    add AX,SI
    mov word ptr [BP + -6h],AX
    cmp word ptr [BP + -0ch],1h
    jz LAB_1000_3115
    jmp LAB_1000_2ff0
LAB_1000_3115:
    mov CL,2h
    sar word ptr [BP + -6h],CL
    jmp LAB_1000_2ff8
    db 90h
LAB_1000_311e:
    inc word ptr [BP + -10h]
LAB_1000_3121:
    cmp word ptr [BP + -10h],9h
    jl LAB_1000_312a
    jmp LAB_1000_31f8
LAB_1000_312a:
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    push word ptr [BP + -0ch]
    call sub_126B4
    add SP,6h
    mov word ptr [BP + -20h],AX
    mov word ptr [BP + -1eh],DX
    mov CL,0ch
LAB_1000_3141:
    shr DX,1h
    rcr AX,1h
    dec CL
    jnz LAB_1000_3141
    mov word ptr [BP + -18h],AX
    mov AX,word ptr [BP + -20h]
    and AH,0fh
    mov word ptr [BP + -0ah],AX
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + -0ch]
    call sub_126B4
    add SP,6h
    mov word ptr [BP + -20h],AX
    mov word ptr [BP + -1eh],DX
    mov CL,0ch
LAB_1000_316c:
    shr DX,1h
    rcr AX,1h
    dec CL
    jnz LAB_1000_316c
    mov word ptr [BP + -1ch],AX
    mov AX,word ptr [BP + -20h]
    and AH,0fh
    mov word ptr [BP + -0eh],AX
    mov SI,word ptr [BP + -10h]
    shl SI,1h
    mov AX,word ptr [SI + offset word_33B74]
    mov word ptr [BP + -4h],AX
    mov AX,word ptr [SI + offset word_33B86]
    mov word ptr [BP + -8h],AX
    mov BX,word ptr [BP + -4h]
    shl BX,1h
    mov AX,word ptr [BX + offset word_33B9C]
    sub AX,word ptr [BP + -0ah]
    add AH,8h
    mov word ptr [BP + -24h],AX
    mov BX,word ptr [BP + -8h]
    shl BX,1h
    mov AX,word ptr [BX + offset word_33B9C]
    sub AX,word ptr [BP + -0eh]
    add AH,8h
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [BP + -8h]
    add word ptr [BP + -1ch],AX
    push word ptr [BP + -1ch]
    mov AX,word ptr [BP + -4h]
    add word ptr [BP + -18h],AX
    push word ptr [BP + -18h]
    push word ptr [BP + -0ch]
    call process3dg
    add SP,6h
    mov word ptr [BP + -22h],AX
    db 3Dh, 0FFh, 0FFh ; cmp AX,0ffffh (force imm16 encoding)
    jnz LAB_1000_31dd
    jmp LAB_1000_311e
LAB_1000_31dd:
    mov DI,word ptr [BP + -0ch]
    mov CL,6h
    shl DI,CL
    mov BX,AX
    shl BX,1h
    mov AX,word ptr [BX + DI + offset _matrix3dt_2]
    mov word ptr [word_3C5A8],AX
    mov word ptr [BP + -12h],0h
    jmp LAB_1000_30ba
    db 90h
LAB_1000_31f8:
    inc word ptr [BP + -0ch]
LAB_1000_31fb:
    cmp word ptr [BP + -0ch],2h
    jg LAB_1000_320a
    mov word ptr [BP + -10h],0h
    jmp LAB_1000_3121
    db 90h
LAB_1000_320a:
    cmp word ptr [word_3B7E2],7fffh
    jz LAB_1000_321c
    mov AX,offset word_3B7E0
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
    db 90h
LAB_1000_321c:
    sub AX,AX
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
sub_12FDA endp
; ------------------------------seg000:0x3223------------------------------
; ------------------------------seg000:0x3224------------------------------
sub_13224 proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 6h]
    mov word ptr [BX + 12h],AX
    mov BX,word ptr [BP + 4h]
    mov AL,byte ptr [BP + 8h]
    mov byte ptr [BX + 14h],AL
    mov AX,8h
    push AX
    mov AX,word ptr [BP + 4h]
    db 05h, 0Eh, 00h ; add AX,0eh (force imm16 encoding)
    push AX
    mov AX,word ptr [word_38FF8]
    inc word ptr [word_38FF8]
    mov CL,3h
    shl AX,CL
    add AX,8c36h
    push AX
    call _memcpy
    add SP,6h
    mov BX,word ptr [BP + 4h]
    mov BX,word ptr [BX + 0ch]
    or byte ptr [BX + 6h],80h
    pop BP
    ret
    nop
sub_13224 endp
; ------------------------------seg000:0x3264------------------------------
; ------------------------------seg000:0x3266------------------------------
sub_13266 proc near
    push BP
    mov BP,SP
    push SI
    mov AX,word ptr [word_38FF8]
    dec AX
    mov word ptr [_var_660],AX
    jmp LAB_1000_3278
    db 90h
LAB_1000_3274:
    dec word ptr [_var_660]
LAB_1000_3278:
    cmp word ptr [_var_660],0h
    jl LAB_1000_32b4
    mov SI,word ptr [_var_660]
    mov CL,3h
    shl SI,CL
    mov AL,byte ptr [SI + offset byte_3B4E6]
    sub AH,AH
    cmp AX,word ptr [BP + 4h]
    jnz LAB_1000_3274
    mov AL,byte ptr [SI + offset byte_3B4E7]
    cmp AX,word ptr [BP + 6h]
    jnz LAB_1000_3274
    mov AL,byte ptr [SI + offset byte_3B4E8]
    cmp AX,word ptr [BP + 8h]
    jnz LAB_1000_3274
    mov AL,byte ptr [SI + offset byte_3B4E9]
    cmp AX,word ptr [BP + 0ah]
    jnz LAB_1000_3274
    mov AX,word ptr [SI + offset word_3B4EA]
    pop SI
    pop BP
    ret
LAB_1000_32b4:
    sub AX,AX
    pop SI
    pop BP
    ret
    nop
sub_13266 endp
; ------------------------------seg000:0x32b8------------------------------
; ------------------------------seg000:0x32ba------------------------------
sub_132BA proc near
    push BP
    mov BP,SP
    sub SP,1ch
    push SI
    mov byte ptr [_var_315],0h
    mov word ptr [word_3B7E2],7fffh
    mov word ptr [BP + -6h],4h
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    mov AX,4h
    push AX
    call sub_126B4
    add SP,6h
    mov word ptr [BP + -18h],AX
    mov word ptr [BP + -16h],DX
    mov CL,0ch
LAB_1000_32e9:
    shr DX,1h
    rcr AX,1h
    dec CL
    jnz LAB_1000_32e9
    mov word ptr [BP + -10h],AX
    mov AX,word ptr [BP + -18h]
    and AH,0fh
    mov word ptr [BP + -4h],AX
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + -6h]
    call sub_126B4
    add SP,6h
    mov word ptr [BP + -18h],AX
    mov word ptr [BP + -16h],DX
    mov CL,0ch
LAB_1000_3314:
    shr DX,1h
    rcr AX,1h
    dec CL
    jnz LAB_1000_3314
    mov word ptr [BP + -14h],AX
    mov AX,word ptr [BP + -18h]
    and AH,0fh
    mov word ptr [BP + -8h],AX
    push word ptr [BP + 0eh]
    push word ptr [BP + 0ch]
    push word ptr [BP + -6h]
    call sub_126B4
    add SP,6h
    mov word ptr [_var_220],AX
    mov AX,800h
    sub AX,word ptr [BP + -4h]
    mov word ptr [BP + -1ch],AX
    mov AX,800h
    sub AX,word ptr [BP + -8h]
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [BP + -4h]
    sub AX,800h
    mov word ptr [_var_218],AX
    mov AX,word ptr [BP + -8h]
    sub AX,800h
    mov word ptr [_var_219],AX
    push word ptr [BP + -14h]
    push word ptr [BP + -10h]
    push word ptr [BP + -6h]
    call process3dg
    add SP,6h
    mov word ptr [BP + -1ah],AX
    db 3Dh, 0FFh, 0FFh ; cmp AX,0ffffh (force imm16 encoding)
    jz LAB_1000_33e9
    mov SI,word ptr [BP + -6h]
    mov CL,6h
    shl SI,CL
    mov BX,AX
    shl BX,1h
    mov AX,word ptr [BX + SI + offset _matrix3dt_2]
    mov word ptr [word_3C5A8],AX
    mov word ptr [BP + -0ch],1h
    jmp LAB_1000_33d4
LAB_1000_338e:
    mov AX,word ptr [BP + -1ch]
    mov BX,word ptr [word_3C5A8]
    add AX,word ptr [BX]
    mov word ptr [BP + -0eh],AX
    mov AX,word ptr [BX + 2h]
    add AX,word ptr [BP + -2h]
    mov word ptr [BP + -12h],AX
    push AX
    call _abs
    add SP,2h
    push word ptr [BP + -0eh]
    mov SI,AX
    call _abs
    add SP,2h
    add AX,SI
    mov word ptr [_var_216],AX
    cmp word ptr [word_3B7E2],AX
    jle LAB_1000_33cc
    mov AX,word ptr [word_3C5A8]
    mov word ptr [word_3B7EC],AX
    mov AX,word ptr [_var_216]
    mov word ptr [word_3B7E2],AX
LAB_1000_33cc:
    add word ptr [word_3C5A8],7h
    inc word ptr [BP + -0ch]
LAB_1000_33d4:
    mov SI,word ptr [BP + -6h]
    mov CL,6h
    shl SI,CL
    mov BX,word ptr [BP + -1ah]
    shl BX,1h
    mov AX,word ptr [BP + -0ch]
    cmp word ptr [BX + SI + offset _matrix3dt + 198],AX
    ja LAB_1000_338e
LAB_1000_33e9:
    cmp word ptr [word_3B7E2],7fffh
    jz LAB_1000_3459
    mov AX,word ptr [word_3B7EC]
    mov word ptr [word_3C5A8],AX
    mov BX,AX
    mov BL,byte ptr [BX + 6h]
    sub BH,BH
    shl BX,1h
    mov AX,word ptr [BX + offset _buf3d3]
    db 05h, 00h, 00h ; add AX,0h (force imm16 encoding)
    mov word ptr [_var_200],AX
    mov word ptr [_var_201],228dh
    mov BX,word ptr [word_3C5A8]
    mov AX,word ptr [BX]
    sub AX,word ptr [_var_218]
    mov word ptr [_var_202],AX
    mov AX,word ptr [BX + 2h]
    sub AX,word ptr [_var_219]
    mov word ptr [_var_203],AX
    mov AX,word ptr [BX + 4h]
    sub AX,word ptr [_var_220]
    mov word ptr [_var_204],AX
    inc word ptr [_var_200]
    mov byte ptr [_var_217],0h
    mov word ptr [_var_216],0h
    call far ptr sub_202DA
    les BX,dword ptr [_var_200]
    test byte ptr ES:[BX],40h
    jz LAB_1000_3459
    mov byte ptr [_var_215],0h
    call far ptr sub_2044A
LAB_1000_3459:
    pop SI
    mov SP,BP
    pop BP
    ret
sub_132BA endp
; ------------------------------seg000:0x345d------------------------------
; ------------------------------seg000:0x345e------------------------------
sub_1345E proc near
    push BP
    mov BP,SP
    sub SP,4h
    mov byte ptr [_var_190],0h
    sub AX,AX
    push AX
    push AX
    push AX
    push AX
    push AX
    push AX
    push AX
    push word ptr [BP + 4h]
    call sub_13932
    add SP,10h
    mov BX,word ptr [BP + 4h]
    push word ptr [BX + 0eh]
    push word ptr [BX + 12h]
    call far ptr gfx_jump_3e
    add SP,4h
    push AX
    call far ptr gfx_jump_1a
    add SP,2h
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    call sub_134AC
    add SP,6h
    call sub_139AA
    mov SP,BP
    pop BP
    ret
    nop
sub_1345E endp
; ------------------------------seg000:0x34aa------------------------------
; ------------------------------seg000:0x34ac------------------------------
sub_134AC proc near
    push BP
    mov BP,SP
    sub SP,14h
    push DI
    push SI
    mov AX,word ptr [BP + 4h]
    mov CL,byte ptr [BP + 8h]
    sar AX,CL
    mov word ptr [_var_663],AX
    mov AX,word ptr [BP + 6h]
    sar AX,CL
    mov word ptr [_var_664],AX
    mov word ptr [_var_666],4h
    jmp LAB_1000_360e
LAB_1000_34d0:
    sub AX,AX
LAB_1000_34d2:
    mov word ptr [_var_665],AX
    mov AX,word ptr [BP + 8h]
    mov CX,word ptr [word_3C16C]
    shl CX,1h
    sub AX,CX
    db 05h, 08h, 00h ; add AX,8h (force imm16 encoding)
    mov word ptr [word_3C042],AX
    mov AX,1000h
    mov CL,byte ptr [word_3C042]
    sar AX,CL
    mov word ptr [_var_661],AX
    db 3Dh, 10h, 00h ; cmp AX,10h (force imm16 encoding)
    jg LAB_1000_34fa
    jmp LAB_1000_360a
LAB_1000_34fa:
    mov AX,4h
    mov CL,byte ptr [word_3C16C]
    shl CL,1h
    sub CL,8h
    neg CL
    shl AX,CL
    mov word ptr [_var_662],AX
    lea AX,[BP + -2h]
    push AX
    lea AX,[BP + -8h]
    push AX
    lea AX,[BP + -12h]
    push AX
    lea AX,[BP + -6h]
    push AX
    call sub_13638
    add SP,8h
    mov AX,word ptr [BP + -8h]
    mov word ptr [BP + -0eh],AX
    jmp LAB_1000_35f9
LAB_1000_352c:
    mov BX,word ptr [word_3C5A8]
    cmp word ptr [BX + 4h],0h
    jnz LAB_1000_3574
    mov BL,byte ptr [BX + 6h]
    sub BH,BH
    shl BX,1h
    mov AX,word ptr [BX + offset _buf3d3]
    db 05h, 00h, 00h ; add AX,0h (force imm16 encoding)
    mov word ptr [_var_200],AX
    mov word ptr [_var_201],228dh
    mov BX,word ptr [word_3C5A8]
    mov AX,word ptr [BX + 2h]
    mov CL,byte ptr [word_3C042]
    sar AX,CL
    add AX,word ptr [BP + -4h]
    push AX
    mov AX,word ptr [BX]
    sar AX,CL
    add AX,word ptr [BP + -14h]
    push AX
    push word ptr [_var_201]
    push word ptr [_var_200]
    call sub_136D2
    add SP,8h
LAB_1000_3574:
    add word ptr [word_3C5A8],7h
    inc word ptr [BP + -0ah]
LAB_1000_357c:
    mov SI,word ptr [BP + -10h]
    shl SI,1h
    mov BX,word ptr [word_3C16C]
    mov CL,6h
    shl BX,CL
    mov AX,word ptr [BP + -0ah]
    cmp word ptr [BX + SI + offset _matrix3dt + 198],AX
    ja LAB_1000_352c
LAB_1000_3592:
    inc word ptr [BP + -0ch]
LAB_1000_3595:
    mov AX,word ptr [BP + -12h]
    cmp word ptr [BP + -0ch],AX
    jg LAB_1000_35f6
    mov SI,word ptr [_var_661]
    sar SI,1h
    mov AX,word ptr [BP + -0ch]
    imul word ptr [_var_661]
    sub AX,word ptr [_var_663]
    add AX,SI
    mov word ptr [BP + -14h],AX
    mov AX,word ptr [BP + -0eh]
    imul word ptr [_var_661]
    sub AX,word ptr [_var_664]
    add AX,SI
    mov word ptr [BP + -4h],AX
    push word ptr [BP + -0eh]
    push word ptr [BP + -0ch]
    push word ptr [word_3C16C]
    call process3dg
    add SP,6h
    mov word ptr [BP + -10h],AX
    db 3Dh, 0FFh, 0FFh ; cmp AX,0ffffh (force imm16 encoding)
    jz LAB_1000_3592
    mov DI,AX
    shl DI,1h
    mov BX,word ptr [word_3C16C]
    mov CL,6h
    shl BX,CL
    mov AX,word ptr [BX + DI + offset _matrix3dt_2]
    mov word ptr [word_3C5A8],AX
    mov word ptr [BP + -0ah],0h
    jmp LAB_1000_357c
    db 90h
LAB_1000_35f6:
    inc word ptr [BP + -0eh]
LAB_1000_35f9:
    mov AX,word ptr [BP + -2h]
    cmp word ptr [BP + -0eh],AX
    jg LAB_1000_360a
    mov AX,word ptr [BP + -6h]
    mov word ptr [BP + -0ch],AX
    jmp LAB_1000_3595
    db 90h
LAB_1000_360a:
    dec word ptr [_var_666]
LAB_1000_360e:
    cmp word ptr [_var_666],0h
    jl LAB_1000_3632
    mov BX,word ptr [_var_666]
    shl BX,1h
    mov AX,word ptr [BX + offset word_34186]
    mov word ptr [word_3C16C],AX
    cmp word ptr [_var_666],1h
    jle LAB_1000_362c
    jmp LAB_1000_34d0
LAB_1000_362c:
    mov AX,40h
    jmp LAB_1000_34d2
LAB_1000_3632:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
sub_134AC endp
; ------------------------------seg000:0x3637------------------------------
; ------------------------------seg000:0x3638------------------------------
sub_13638 proc near
    push BP
    mov BP,SP
    push word ptr [BP + 8h]
    push word ptr [BP + 4h]
    sub AX,AX
    push AX
    push AX
    call sub_13694
    add SP,8h
    mov BX,word ptr [BP + 4h]
    cmp word ptr [BX],0h
    jge LAB_1000_3657
    mov word ptr [BX],0h
LAB_1000_3657:
    mov BX,word ptr [BP + 8h]
    cmp word ptr [BX],0h
    jge LAB_1000_3663
    mov word ptr [BX],0h
LAB_1000_3663:
    push word ptr [BP + 0ah]
    push word ptr [BP + 6h]
    push word ptr [_var_350]
    push word ptr [_var_349]
    call sub_13694
    add SP,8h
    mov BX,word ptr [BP + 6h]
    mov AX,word ptr [_var_662]
    cmp word ptr [BX],AX
    jl LAB_1000_3684
    dec AX
    mov word ptr [BX],AX
LAB_1000_3684:
    mov BX,word ptr [BP + 0ah]
    mov AX,word ptr [_var_662]
    cmp word ptr [BX],AX
    jl LAB_1000_3691
    dec AX
    mov word ptr [BX],AX
LAB_1000_3691:
    pop BP
    ret
    nop
sub_13638 endp
; ------------------------------seg000:0x3692------------------------------
; ------------------------------seg000:0x3694------------------------------
sub_13694 proc near
    push BP
    mov BP,SP
    mov AX,word ptr [BP + 4h]
    sub AX,word ptr [word_3298C]
    add AX,word ptr [_var_663]
    cwd
    mov CX,word ptr [_var_661]
    idiv CX
    mov BX,word ptr [BP + 8h]
    mov word ptr [BX],AX
    mov AX,word ptr [BP + 6h]
    sub AX,word ptr [word_3298E]
    shl AX,1h
    shl AX,1h
    cwd
    mov CX,3h
    idiv CX
    add AX,word ptr [_var_664]
    cwd
    mov CX,word ptr [_var_661]
    idiv CX
    mov BX,word ptr [BP + 0ah]
    mov word ptr [BX],AX
    pop BP
    ret
    nop
sub_13694 endp
; ------------------------------seg000:0x36d0------------------------------
; ------------------------------seg000:0x36d2------------------------------
sub_136D2 proc near
    push BP
    mov BP,SP
    mov AX,word ptr [BP + 4h]
    mov DX,word ptr [BP + 6h]
    mov word ptr [_var_200],AX
    mov word ptr [_var_201],DX
    inc word ptr [_var_200]
    mov word ptr [_var_216],0h
    call far ptr sub_202DA
    cmp word ptr [word_3C16C],3h
    jl LAB_1000_370a
    les BX,dword ptr [_var_200]
    mov AL,byte ptr ES:[BX]
    sub AH,AH
    db 25h, 40h, 00h ; and AX,40h (force imm16 encoding)
    cmp AX,word ptr [_var_665]
    jnz LAB_1000_3748
LAB_1000_370a:
    les BX,dword ptr [_var_200]
    mov AL,byte ptr ES:[BX]
    sub AH,AH
    db 25h, 3Fh, 00h ; and AX,3fh (force imm16 encoding)
    db 3Dh, 3Eh, 00h ; cmp AX,3eh (force imm16 encoding)
    jz LAB_1000_3748
    db 3Dh, 3Fh, 00h ; cmp AX,3fh (force imm16 encoding)
    jnz LAB_1000_3726
    call sub_1374A
    pop BP
    ret
    db 90h
LAB_1000_3726:
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    call sub_1378E
    add SP,4h
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    call sub_13816
    add SP,4h
    call far ptr sub_20A46
    call far ptr sub_20FDC
LAB_1000_3748:
    pop BP
    ret
sub_136D2 endp
; ------------------------------seg000:0x3749------------------------------
; ------------------------------seg000:0x374a------------------------------
sub_1374A proc near
    push BP
    mov BP,SP
    mov AX,word ptr [BP + 4h]
    add AX,word ptr [word_3298C]
    mov word ptr [_var_351],AX
    mov word ptr [_var_352],AX
    mov AX,word ptr [BP + 6h]
    neg AX
    add AX,word ptr [word_3298E]
    mov word ptr [_var_353],AX
    mov word ptr [_var_354],AX
    inc word ptr [_var_200]
    mov BX,word ptr [_var_200]
    inc word ptr [_var_200]
    mov ES,word ptr [_var_201]
    mov AL,byte ptr ES:[BX]
    sub AH,AH
    push AX
    call far ptr _gfx_jump_21
    add SP,2h
    call far ptr _sub_2152A
    pop BP
    ret
sub_1374A endp
; ------------------------------seg000:0x378d------------------------------
; ------------------------------seg000:0x378e------------------------------
sub_1378E proc near
    push BP
    mov BP,SP
    sub SP,6h
    mov word ptr [BP + -4h],1h
    mov word ptr [BP + -2h],0h
    mov BX,word ptr [_var_200]
    inc word ptr [_var_200]
    mov ES,word ptr [_var_201]
    mov AL,byte ptr ES:[BX]
    sub AH,AH
    db 25h, 1Fh, 00h ; and AX,1fh (force imm16 encoding)
    mov word ptr [_var_257],AX
    mov word ptr [_var_259],0ffffh
    mov word ptr [_var_260],0ffffh
    db 3Dh, 10h, 00h ; cmp AX,10h (force imm16 encoding)
    jle LAB_1000_37ca
    mov AL,1h
    jmp LAB_1000_37cc
LAB_1000_37ca:
    sub AL,AL
LAB_1000_37cc:
    mov byte ptr [_var_258],AL
    mov word ptr [BP + -6h],0h
    jmp LAB_1000_380a
LAB_1000_37d6:
    add word ptr [_var_200],4h
    mov BX,word ptr [_var_200]
    add word ptr [_var_200],2h
    mov ES,word ptr [_var_201]
    cmp word ptr ES:[BX],0h
    jge LAB_1000_37fc
    mov AX,word ptr [BP + -4h]
    mov DX,word ptr [BP + -2h]
    xor word ptr [_var_259],AX
    xor word ptr [_var_260],DX
LAB_1000_37fc:
    add word ptr [_var_200],2h
    shl word ptr [BP + -4h],1h
    rcl word ptr [BP + -2h],1h
    inc word ptr [BP + -6h]
LAB_1000_380a:
    mov AX,word ptr [_var_257]
    cmp word ptr [BP + -6h],AX
    jl LAB_1000_37d6
    mov SP,BP
    pop BP
    ret
sub_1378E endp
; ------------------------------seg000:0x3815------------------------------
; ------------------------------seg000:0x3816------------------------------
sub_13816 proc near
    push BP
    mov BP,SP
    sub SP,0ah
    push SI
    les BX,dword ptr [_var_200]
    mov AL,byte ptr ES:[BX]
    sub AH,AH
    db 25h, 80h, 00h ; and AX,80h (force imm16 encoding)
    mov word ptr [BP + -6h],AX
    inc word ptr [_var_200]
    mov AL,byte ptr ES:[BX]
    sub AH,AH
    db 25h, 7Fh, 00h ; and AX,7fh (force imm16 encoding)
    mov word ptr [_var_256],AX
    mov word ptr [BP + -2h],0h
    jmp LAB_1000_38b5
LAB_1000_3842:
    mov BX,word ptr [_var_200]
    add word ptr [_var_200],2h
    mov ES,word ptr [_var_201]
    mov AX,word ptr ES:[BX]
    mov CL,byte ptr [word_3C042]
    sar AX,CL
    add AX,word ptr [BP + 4h]
    mov word ptr [BP + -8h],AX
    mov BX,word ptr [_var_200]
    add word ptr [_var_200],2h
    mov AX,word ptr ES:[BX]
    sar AX,CL
    add AX,word ptr [BP + 6h]
    mov word ptr [BP + -0ah],AX
    add word ptr [_var_200],2h
LAB_1000_3877:
    mov SI,word ptr [BP + -2h]
    mov CL,2h
    shl SI,CL
    mov word ptr [SI + offset word_34684],1h
    mov word ptr [SI + offset word_34686],1h
    mov AX,word ptr [BP + -8h]
    add AX,word ptr [word_3298C]
    cwd
    mov word ptr [SI + offset word_34868],AX
    mov word ptr [SI + offset word_3486A],DX
    push word ptr [BP + -0ah]
    call _sub_13922
    add SP,2h
    neg AX
    add AX,word ptr [word_3298E]
    cwd
    mov word ptr [SI + offset word_34A4C],AX
    mov word ptr [SI + offset word_34A4E],DX
    inc word ptr [BP + -2h]
LAB_1000_38b5:
    mov AX,word ptr [_var_256]
    cmp word ptr [BP + -2h],AX
    jge LAB_1000_391c
    mov AL,byte ptr [_var_258]
    sub AH,AH
    shl AX,1h
    db 05h, 02h, 00h ; add AX,2h (force imm16 encoding)
    add word ptr [_var_200],AX
    cmp word ptr [BP + -6h],0h
    jnz LAB_1000_38d4
    jmp LAB_1000_3842
LAB_1000_38d4:
    mov BX,word ptr [_var_200]
    inc word ptr [_var_200]
    mov ES,word ptr [_var_201]
    mov AL,byte ptr ES:[BX]
    sub AH,AH
    mov word ptr [BP + -4h],AX
    mov BX,AX
    mov BL,byte ptr [BX + offset _buf3d3_1]
    sub BH,BH
    shl BX,1h
    mov AX,word ptr [BX + 954ch]
    mov CL,byte ptr [word_3C042]
    sar AX,CL
    add AX,word ptr [BP + 4h]
    mov word ptr [BP + -8h],AX
    mov BX,word ptr [BP + -4h]
    mov BL,byte ptr [BX + offset _buf3d3_2]
    sub BH,BH
    shl BX,1h
    mov AX,word ptr [BX + offset _byte_3BE3E]
    sar AX,CL
    add AX,word ptr [BP + 6h]
    mov word ptr [BP + -0ah],AX
    jmp LAB_1000_3877
LAB_1000_391c:
    pop SI
    mov SP,BP
    pop BP
    ret
    nop
sub_13816 endp
; ------------------------------seg000:0x3920------------------------------
; ------------------------------seg000:0x3932------------------------------
sub_13932 proc near
    push BP
    mov BP,SP
    push word ptr [BP + 4h]
    call sub_139C0
    add SP,2h
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    call sub_13A6C
    add SP,6h
    push word ptr [BP + 10h]
    push word ptr [BP + 0eh]
    push word ptr [BP + 0ch]
    call sub_13A90
    add SP,6h
    cmp word ptr [BP + 12h],0h
    jz LAB_1000_3993
    mov word ptr [_var_315],0h
    cmp word ptr [_word_38FDC],0h
    jnz LAB_1000_3974
    mov byte ptr [_var_316],1h
LAB_1000_3974:
    cmp byte ptr [_var_316],0h
    jnz LAB_1000_3980
    call far ptr sub_20658
LAB_1000_3980:
    cmp byte ptr [origCBreakSeg],0h
    jnz LAB_1000_3980
    mov BX,word ptr [BP + 4h]
    push word ptr [BX + 4h]
    call sub_10334
    add SP,2h
LAB_1000_3993:
    mov word ptr [_var_255],0h
    mov AX,3000h
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    sub word ptr [_var_261],AX
    pop BP
    ret
    nop
sub_13932 endp
; ------------------------------seg000:0x39a8------------------------------
; ------------------------------seg000:0x39aa------------------------------
sub_139AA proc near
    call far ptr sub_202F6
    call far ptr gfx_jump_18
    call far ptr _gfx_jump_23
    mov byte ptr [_var_316],0h
    ret
    nop
sub_139AA endp
; ------------------------------seg000:0x39be------------------------------
; ------------------------------seg000:0x39c0------------------------------
sub_139C0 proc near
    push BP
    mov BP,SP
    sub SP,4h
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX + 14h]
    sub AX,word ptr [BX + 12h]
    inc AX
    mov word ptr [BP + -4h],AX
    mov AX,word ptr [BX + 10h]
    sub AX,word ptr [BX + 0eh]
    inc AX
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [BP + -4h]
    inc AX
    sar AX,1h
    dec AX
    mov word ptr [word_3298C],AX
    mov AX,word ptr [BP + -2h]
    inc AX
    sar AX,1h
    dec AX
    mov word ptr [word_3298E],AX
    cmp word ptr [BX + 0eh],0h
    jnz LAB_1000_3a0a
    cmp word ptr [BX + 10h],0c7h
    jnz LAB_1000_3a04
    mov AX,64h
    jmp LAB_1000_3a07
    db 90h
LAB_1000_3a04:
    mov AX,38h
LAB_1000_3a07:
    mov word ptr [word_3298E],AX
LAB_1000_3a0a:
    mov AX,word ptr [BP + -4h]
    dec AX
    push AX
    call far ptr gfx_jump_41
    add SP,2h
    mov BX,word ptr [BP + 4h]
    push word ptr [BX + 0eh]
    push word ptr [BX + 12h]
    call far ptr gfx_jump_3e
    add SP,4h
    push AX
    call far ptr gfx_jump_1a
    add SP,2h
    mov AX,word ptr [BP + -4h]
    dec AX
    mov word ptr [_var_349],AX
    mov AX,word ptr [BP + -2h]
    dec AX
    mov word ptr [_var_350],AX
    mov word ptr [word_3C69C],192ch
    mov word ptr [word_3C6A2],194ch
    cmp byte ptr [_var_456],0h
    jz LAB_1000_3a5c
    add word ptr [word_3C69C],10h
    add word ptr [word_3C6A2],10h
LAB_1000_3a5c:
    cmp byte ptr [_word_330C2],0h
    jz LAB_1000_3a68
    add word ptr [word_3C6A2],20h
LAB_1000_3a68:
    mov SP,BP
    pop BP
    ret
sub_139C0 endp
; ------------------------------seg000:0x3a6b------------------------------
; ------------------------------seg000:0x3a6c------------------------------
sub_13A6C proc near
    push BP
    mov BP,SP
    mov AX,word ptr [BP + 8h]
    neg AX
    push AX
    mov AX,word ptr [BP + 6h]
    neg AX
    push AX
    mov AX,word ptr [BP + 4h]
    neg AX
    push AX
    mov AX,19c6h
    push AX
    call far ptr _sub_20BAE
    add SP,8h
    pop BP
    ret
    nop
sub_13A6C endp
; ------------------------------seg000:0x3a8e------------------------------
; ------------------------------seg000:0x3a90------------------------------
sub_13A90 equ _sub_13A90
; raw bytes for unlabeled code between 0x3aa1 and 0x3aee
    db 80h
    db 3Eh
    db 04h
    db 1Ah
    db 00h
    db 74h
    db 29h
    db 8Bh
    db 1Eh
    db 8Ch
    db 19h
    db 83h
    db 06h
    db 8Ch
    db 19h
    db 04h
    db 8Eh
    db 06h
    db 8Eh
    db 19h
    db 26h
    db 8Bh
    db 07h
    db 26h
    db 8Bh
    db 57h
    db 02h
    db 23h
    db 06h
    db 06h
    db 1Ah
    db 23h
    db 16h
    db 08h
    db 1Ah
    db 0Bh
    db 0D0h
    db 74h
    db 05h
    db 0B8h
    db 01h
    db 00h
    db 0C3h
    db 90h
    db 2Bh
    db 0C0h
    db 0C3h
    db 90h
    db 8Bh
    db 1Eh
    db 8Ch
    db 19h
    db 83h
    db 06h
    db 8Ch
    db 19h
    db 02h
    db 8Eh
    db 06h
    db 8Eh
    db 19h
    db 26h
    db 8Bh
    db 07h
    db 23h
    db 06h
    db 06h
    db 1Ah
    db 0C3h
    db 90h

; ------------------------------seg000:0x3aa6------------------------------
    nop
    nop
    nop
; ------------------------------seg000:0x3aee------------------------------
_setupDac proc near
    mov ax, ds
    mov es, ax
    mov bx, 10h
    mov cx, 50h
    mov dx, offset dacValues1
    mov ax, 1012h
    int 10h ;- VIDEO - SET BLOCK OF DAC REGISTERS (EGA, VGA/MCGA)
    cmp _byte_34197, 2
    jz short loc_13B16
    mov cx, 30h
    push si
    push di
    mov si, offset byte_37116
    mov di, offset byte_36D86
    rep movsb
    pop di
    pop si
loc_13B16:
    mov dx, offset dacValues
    cmp _word_330BC, 0
    jz short loc_13B23
    mov dx, offset otherDacValues
loc_13B23:
    mov bx, 60h
    mov cx, 0A0h
    mov ax, 1012h
    int 10h ;- VIDEO - SET BLOCK OF DAC REGISTERS (EGA, VGA/MCGA)
    retn
_setupDac endp
; ------------------------------seg000:0x3b2e------------------------------
; ------------------------------seg000:0x3b2f------------------------------
sub_13B2F proc near
_sub_13B2F:
    mov BX,SP
    mov AX,word ptr SS:[BX + 2h]
    imul word ptr SS:[BX + 4h]
    shl AX,1h
    rcl DX,1h
    shl AX,1h
    adc DX,0h
    mov AX,DX
    ret
    db 8Bh
    db 0DCh
    db 36h
    db 8Bh
    db 47h
    db 02h
    db 36h
    db 0F7h
    db 6Fh
    db 04h
    db 0D1h
    db 0E0h
    db 0D1h
    db 0D2h
    db 0C3h
    db 8Bh
    db 0DCh
    db 36h
    db 8Bh
    db 47h
    db 02h
    db 99h
    db 8Ah
    db 0D4h
    db 8Ah
    db 0E0h
    db 2Ah
    db 0C0h
    db 36h
    db 8Bh
    db 5Fh
    db 04h
    db 0Bh
    db 0DBh
    db 7Eh
    db 13h
    db 8Bh
    db 0CAh
    db 0Bh
    db 0C9h
    db 79h
    db 02h
    db 0F7h
    db 0D9h
    db 0D1h
    db 0EBh
    db 3Bh
    db 0CBh
    db 73h
    db 05h
    db 0D1h
    db 0D3h
    db 0F7h
    db 0FBh
    db 0C3h
    db 0B8h
    db 0FFh
    db 7Fh
    db 0Bh
    db 0D2h
    db 79h
    db 02h
    db 0F7h
    db 0D8h
    db 0C3h
sub_13B2F endp
; ------------------------------seg000:0x3b44------------------------------
; ------------------------------seg000:0x3b86------------------------------
sub_13B86 proc near
    mov BX,SP
    mov BX,word ptr SS:[BX + 2h]
    add BX,4000h
    call sub_13BA2
    mov AX,BX
    ret
sub_13B86 endp
; ------------------------------seg000:0x3b95------------------------------
; ------------------------------seg000:0x3b96------------------------------
sub_13B96 proc near
_sub_13B96:
    mov BX,SP
    mov BX,word ptr SS:[BX + 2h]
    call sub_13BA2
    mov AX,BX
    ret
sub_13B96 endp
; ------------------------------seg000:0x3ba1------------------------------
; ------------------------------seg000:0x3ba2------------------------------
sub_13BA2 proc near
    mov DL,BL
    sub DH,DH
    mov BL,BH
    mov BH,DH
    shl BX,1h
    mov AX,word ptr [BX + offset word_37148]
    mov BX,word ptr [BX + offset word_37146]
    sub AX,BX
    imul DX
    mov DH,DL
    mov DL,AH
    shl AL,1h
    adc BX,DX
    ret
sub_13BA2 endp
; ------------------------------seg000:0x3bc0------------------------------
; ------------------------------seg000:0x3bc1------------------------------
sub_13BC1 proc far
    call sub_13BCD
    retf
sub_13BC1 endp
; ------------------------------seg000:0x3bc4------------------------------
; ------------------------------seg000:0x3bc5------------------------------
sub_13BC5 proc far
    call sub_13BC9
    retf
sub_13BC5 endp
; ------------------------------seg000:0x3bc8------------------------------
; ------------------------------seg000:0x3bc9------------------------------
sub_13BC9 proc near
    add BX,4000h
sub_13BC9 endp
; ------------------------------seg000:0x3bc9------------------------------
; ------------------------------seg000:0x3bcd------------------------------
sub_13BCD proc near
    mov DL,BL
    sub DH,DH
    mov BL,BH
    mov BH,DH
    shl BX,1h
    mov AX,word ptr [BX + offset word_3734A]
    mov BX,word ptr [BX + offset word_37348]
    sub AX,BX
    imul DX
    mov DH,DL
    mov DL,AH
    shl AL,1h
    adc BX,DX
    ret
sub_13BCD endp
; ------------------------------seg000:0x3beb------------------------------
; ------------------------------seg000:0x3bec------------------------------
_installCBreakHandler proc near
    push si
    push di
    push dx
    push ds
    mov si, IRQ_CBREAK*4
    call getInterruptHandler
    mov origCBreakOfs, bx
    mov origCBreakSeg, ax
    mov ax, seg @code ;mov ax, seg seg000
    mov dx, offset cbreakHandler
    mov ds, ax
    mov ax, 251Bh
    int 21h ;DOS - SET INTERRUPT VECTOR
    pop ds
    pop dx
    pop di
    pop si
    retn
_installCBreakHandler endp
; ------------------------------seg000:0x3c0e------------------------------
; ------------------------------seg000:0x3c0f------------------------------
_restoreCBreakHandler proc near
    push ds
    mov ax, origCBreakSeg
    mov dx, origCBreakOfs
    mov ds, ax
    mov ax, 251Bh
    int 21h ;DOS - SET INTERRUPT VECTOR
    pop ds
    retn
_restoreCBreakHandler endp
; ------------------------------seg000:0x3c1f------------------------------
; ------------------------------seg000:0x3c20------------------------------
getInterruptHandler proc near
    push ds
    xor ax, ax
    mov ds, ax
    mov bx, [si]
    mov ax, [si+2]
    pop ds
    retn
getInterruptHandler endp
; ------------------------------seg000:0x3c2b------------------------------
; ------------------------------seg000:0x3c2c------------------------------
cbreakHandler proc far
    retn
cbreakHandler endp
; ------------------------------seg000:0x3c3a------------------------------
; ------------------------------seg000:0x3c3b------------------------------
_sub_13C3B proc near
    push bp
    push si
    push di
    push es
    call sub_13C47
    pop es
    pop di
    pop si
    pop bp
    retn
_sub_13C3B endp
; ------------------------------seg000:0x3c46------------------------------
; ------------------------------seg000:0x3c47------------------------------
sub_13C47 proc near
    call _sub_155AB
    call _sub_18E50
    cmp _keyValue, 0
    jnz short loc_13C59
    call far ptr _sub_21A7A ;call _sub_21A7A
loc_13C59:
    mov bx, 0
    mov ax, _word_38126
    call far ptr gfx_jump_2c
    mov byte_378EE, 1
    call _otherKeyDispatch
    call sub_10720
    cmp byte_3C8B0, 0
    jz short sub_13C47
    retn
sub_13C47 endp
; ------------------------------seg000:0x3c76------------------------------
; ------------------------------seg000:0x3c78------------------------------
_setTimerIrqHandler proc near
    mov word_378FA, 1
    mov word_37904, 1
    mov word_378F0, 0
    mov word_378F2, 0
    call sub_13DF2
    mov ah, 35h
    mov al, 8
    int 21h ;DOS - 2+ - GET INTERRUPT VECTOR
    mov word ptr cs:timerIsrPtr, bx
    mov word ptr cs:timerIsrPtr+2, es
    push ds
    mov ah, DOS_SET_IRQH
    mov al, 8
    lds dx, cs:timerIrqAddr
    int 21h ;DOS - SET INTERRUPT VECTOR
    pop ds
    mov timerHandlerInstalled, 1
    retn
_setTimerIrqHandler endp
; ------------------------------seg000:0x3cb5------------------------------
; ------------------------------seg000:0x3cb6------------------------------
_restoreTimerIrqHandler proc near
    mov al, 36h
    out PORT_PIT_CNTRL, al ;Timer 8253-5 (AT: 8254.2).
    jmp short $+2
loc_13CBC:
    xor al, al
    out PORT_PIT_TIME0, al ;Timer 8253-5 (AT: 8254.2).
    jmp short $+2
loc_13CC2:
    out PORT_PIT_TIME0, al ;Timer 8253-5 (AT: 8254.2).
    push ds
    mov ah, DOS_SET_IRQH
    mov al, 8
    lds dx, cs:timerIsrPtr
    int 21h ;DOS - SET INTERRUPT VECTOR
    pop ds
    mov timerHandlerInstalled, 0
    retn
_restoreTimerIrqHandler endp
; ------------------------------seg000:0x3cd6------------------------------
timerIrqAddr dd byte_13D05
byte_13D05 db 0FBh, 50h, 53h, 51h, 52h, 56h, 57h, 55h, 1Eh, 6, 0B8h
timerIsrPtr dd 0
; ------------------------------seg000:0x3d6b------------------------------
sub_13D6B proc near
    retn
sub_13D6B endp
; ------------------------------seg000:0x3df1------------------------------
; ------------------------------seg000:0x3df2------------------------------
sub_13DF2 proc near
    pushf ;identical to sub_119d4 in start.exe
    cli
    mov byte_378FC, 1
    xor ax, ax
    mov byte_37903, 1
    mov word_378FF, ax
    mov word_37901, ax
    call manipulateTimer
    mov bx, ax
    mov cx, 10h
loc_13E0E:
    push bx
    call manipulateTimer
    pop bx
    sub bx, ax
    add word_378FF, bx
    adc word_37901, 0
    mov bx, ax
    loop loc_13E0E
    mov ax, word_378FF
    mov dx, word_37901
    add word_378F0, ax
    adc word_378F2, dx
    mov cx, 10h
    div cx
    shr ax, 1
    mov word_378FF, ax
    mov bx, ax
    shr bx, 1
    shr bx, 1
    shr bx, 1
    shr bx, 1
    add ax, bx
    xor dx, dx
    mov bx, 0F89h
    div bx
    db 3Dh ;cmp ax, 4
    dw 4
    jb short loc_13E5B
    db 3Dh ;cmp ax, 6
    dw 6
    ja short loc_13E5B
    jmp short loc_13E69
    nop
loc_13E5B:
    mov byte_37903, 0
    mov word_378FF, 4DAEh
    mov ax, 5
loc_13E69:
    mov word_378FD, ax
    cmp word_378FA, 1
    jz short loc_13E76
    mov word_378FA, ax
loc_13E76:
    mov ax, word_378FF
    xor dx, dx
    div word_378FA
    mov word_378F6, ax
    mov word_378F4, ax
    popf
    retn
sub_13DF2 endp
; ------------------------------seg000:0x3e86------------------------------
; ------------------------------seg000:0x3e87------------------------------
manipulateTimer proc near
    pushf
    cli
    xor ax, ax
    mov es, ax
    mov dx, es:463h ;0:463 - base port address for crtc?
    add dx, 6
    cmp dx, 3BAh
    jz short loc_13EB2
    xor bx, bx
loc_13E9D:
    dec bx
    jz short loc_13ED8
    in al, dx
    test al, 8
    jnz short loc_13E9D
    xor bx, bx
loc_13EA7:
    dec bx
    jz short loc_13ED8
    in al, dx
    test al, 8
    jz short loc_13EA7
    jmp short loc_13EC6
    nop ;align 2
loc_13EB2:
    xor bx, bx
loc_13EB4:
    dec bx
    jz short loc_13ED8
    in al, dx
    test al, 80h
    jz short loc_13EB4
    xor bx, bx
loc_13EBE:
    dec bx
    jz short loc_13ED8
    in al, dx
    test al, 80h
    jnz short loc_13EBE
loc_13EC6:
    mov al, 0
    out 43h, al ;Timer 8253-5 (AT: 8254.2).
    jmp short $+2
loc_13ECC:
    in al, 40h ;Timer 8253-5 (AT: 8254.2).
    jmp short $+2
loc_13ED0:
    mov bl, al
    in al, 40h ;Timer 8253-5 (AT: 8254.2).
    jmp short $+2
loc_13ED6:
    mov bh, al
loc_13ED8:
    mov ax, bx
    popf
    retn
manipulateTimer endp
; ------------------------------seg000:0x3edb------------------------------
; ------------------------------seg000:0x3edc------------------------------
getTimeOfDay proc near
    xor AH,AH
    int 1Ah
    mov AX,DX
    ret
    db 0FFh
    db 06h
    db 5Ah
    db 50h
    db 0FEh
    db 06h
    db 5Ch
    db 50h
    db 9Ah
    db 0A4h
    db 0Fh
    db 8Bh
    db 32h
    db 9Ah
    db 0D5h
    db 10h
    db 8Bh
    db 32h
    db 0Bh
    db 0C0h
    db 74h
    db 08h
    db 78h
    db 03h
    db 0E9h
    db 0D9h
    db 0FDh
    db 0E9h
    db 0EEh
    db 0FDh
    db 0C3h
    db 33h
    db 0C0h
    db 0E8h
    db 4Dh
    db 0A7h
    db 9Ah
    db 95h
    db 0Fh
    db 8Bh
    db 32h
    db 0C3h
    db 90h
getTimeOfDay endp
; ------------------------------seg000:0x3ee2------------------------------
; ------------------------------seg000:0x3ee3------------------------------
sub_13EE3 proc near
    retn
sub_13EE3 endp
; ------------------------------seg000:0x3f01------------------------------
    nop
; ------------------------------seg000:0x3f72------------------------------
_otherKeyDispatch proc near
    push BP
    mov BP,SP
    sub SP,03Eh
    push DI
    push SI
    cmp word ptr [_sign3d3+2],00h
    jnz loc_13FF7
    sub AX,AX
    mov word ptr [_buf3d3_1+98h],AX
    mov [_word_380D0+0Bh],AX
    mov [_word_3A940+4],AX
    mov [_word_380CA+1],AX
    mov [_word_380C8+1],AX
    mov word ptr [_unk_3806E+59h],AX
    mov word ptr [_unk_3806E+57h],AX
    les BX,dword ptr [_gameData]
    cmp word ptr ES:[BX+03Eh],AX
    jnz loc_13FBA
    mov AX,[_word_3BED0]
    sub AX,word ptr [_var_47]
    cmp AX,08000h
    jnc loc_13FB2
    sub AX,AX
    jmp loc_13FB5
loc_13FB2:
    mov AX,08000h
loc_13FB5:
    mov word ptr [_unk_3806E+55h],AX
    jmp loc_13FD6
loc_13FBA:
    cmp word ptr ES:[BX+038h],06h
    jnz loc_13FC5
    sub AX,AX
    jmp loc_13FD3
loc_13FC5:
    test byte ptr ES:[BX+038h],01h
    jz loc_13FD0
    sub AX,AX
    jmp loc_13FD3
loc_13FD0:
    mov AX,08000h
loc_13FD3:
    mov word ptr [_unk_3806E+55h],AX
loc_13FD6:
    mov BX,word ptr [_word_3B148]
    mov CL,04h
    shl BX,CL
    test word ptr [BX+offset _stru_3AA5E + 6],0200h
    jz loc_13FEB
    add byte ptr [_unk_3806E+56h],04h
loc_13FEB:
    call sub_15411
    call _sub_15FDB
    mov word ptr [_sign3d3+2],01h
loc_13FF7:
    mov word ptr [_flagFarToNear+2],00h
    call _kbhit
    or AX,AX
    jz loc_14022
    sub AX,AX
    push AX
    call __bios_keybrd
    add SP,02h
    mov [_flagFarToNear+2],AX
    cmp word ptr [_word_336EA],01h
    jnz loc_14022
    sub AX,AX
    mov word ptr [_word_3370E],AX
    mov word ptr [_word_336EA],AX
    mov [_keyValue],AX
loc_14022:
    call _kbhit
    or AX,AX
    jz loc_14034
    sub AX,AX
    push AX
    call __bios_keybrd
    add SP,02h
    jmp loc_14022
loc_14034:
    mov AX,[_flagFarToNear+2]
    jmp loc_141EB
loc_1403A:
    mov AX,064h
    push AX
    sub AX,AX
    push AX
    mov AX,[_word_380D0+0Bh]
    db 02Dh, 0Ah, 00h ; sub AX,0Ah (force imm16 encoding)
    push AX
    call _sub_1CF64
    add SP,06h
    mov [_word_380D0+0Bh],AX
    call _sub_15FDB
    jmp loc_1423E
loc_14057:
    mov AX,064h
    push AX
    sub AX,AX
    push AX
    cmp word ptr [_word_380D0+0Bh],0Ah
    jge loc_1406A
    mov AX,05h
    jmp loc_1406D
loc_1406A:
    mov AX,0Ah
loc_1406D:
    add AX,word ptr [_word_380D0+0Bh]
    push AX
    call _sub_1CF64
    add SP,06h
    mov [_word_380D0+0Bh],AX
    call _sub_15FDB
    and byte ptr [_planeFlags],0F7h
    jmp loc_1423E
loc_14086:
    mov word ptr [_word_380D0+0Bh],090h
    call _sub_15FDB
    and byte ptr [_planeFlags],0F7h
    jmp loc_1423E
loc_14097:
    mov word ptr [_word_380D0+0Bh],064h
    call _sub_15FDB
    and byte ptr [_planeFlags],0F7h
    jmp loc_140C5
loc_140A7:
    mov word ptr [_word_380D0+0Bh],00h
    sub AX,AX
    push AX
    mov AX,010h
    push AX
    call makeSound
    add SP,04h
    call _sub_15FDB
    jmp loc_1423E
loc_140C0:
    xor byte ptr [_planeFlags],08h
loc_140C5:
    test byte ptr [_planeFlags],08h
    jnz loc_140EE
    cmp word ptr [_word_3BEBE],00h
    jz loc_140EE
    cmp word ptr [_word_380D0+0Bh],064h
    jnz loc_140EE
    mov word ptr [_word_3A940+4],0546h
    mov AX,02h
    push AX
    mov AX,01Ch
    push AX
    call makeSound
    add SP,04h
loc_140EE:
    jmp loc_1423E
loc_140F1:
    cmp word ptr [_word_380D0+0Dh],00h
    jnz loc_14103
    call far ptr sub_2265B
    mov word ptr [_word_380D0+0Dh],028h
loc_14103:
    jmp loc_1423E
loc_14106:
    mov AX,01h
    push AX
    call sub_11B37
    add SP,02h
    mov byte ptr [_exitCode],00h
    jmp loc_1423E
loc_14118:
    cmp word ptr [_word_330C2],00h
    jz loc_14149
    mov AX,offset aNc_xxx
    push AX
    mov AX,0140h
    push AX
    mov AX,061h
    push AX
    sub AX,AX
    push AX
    mov BX,word ptr [_off_38364-5]
    push word ptr [BX]
    mov AX,061h
    push AX
    sub AX,AX
    push AX
    mov BX,word ptr [_off_38334-5]
    push word ptr [BX]
    call far ptr _gfx_jump_2a
    add SP,010h
loc_14149:
    sub AX,AX
    push AX
    call _sub_19E44
    add SP,02h
    mov AX,0C7h
    push AX
    mov AX,013Fh
    push AX
    sub AX,AX
    push AX
    push AX
    call _sub_19E5D
    add SP,08h
    sub AX,AX
    push AX
    mov AX,07h
    push AX
    mov AX,0Ch
    push AX
    mov AX,037h
    push AX
    mov AX,071h
    push AX
    sub AX,AX
    push AX
    push AX
    call _sub_1A8C8
    add SP,0Eh
    call sub_1613B
    cmp word ptr [_word_330C2],00h
    jz loc_141E2
    mov AX,offset aNc_xxx
    push AX
    mov AX,0140h
    push AX
    mov AX,061h
    push AX
    sub AX,AX
    push AX
    mov BX,word ptr [_off_38334-5]
    push word ptr [BX]
    mov AX,061h
    push AX
    sub AX,AX
    push AX
    mov BX,word ptr [_off_38364-5]
    push word ptr [BX]
    call far ptr _gfx_jump_2a
    add SP,010h
    mov AX,offset aNc_xxx
    push AX
    mov AX,0140h
    push AX
    mov AX,061h
    push AX
    sub AX,AX
    push AX
    mov BX,word ptr [_off_3834C-5]
    push word ptr [BX]
    mov AX,061h
    push AX
    sub AX,AX
    push AX
    mov BX,word ptr [_off_38364-5]
    push word ptr [BX]
    call far ptr _gfx_jump_2a
    add SP,010h
    call _sub_15FDB
loc_141E2:
    jmp loc_1423E
loc_141E4:
    call sub_1613B
    jmp loc_1423E
    db 0EBh
    db 53h
loc_141EB:
    cmp AX,01000h
    jnz loc_141F3
    jmp loc_14106
loc_141F3:
    ja loc_14217
    cmp AX,0C2Dh
    jnz loc_141FD
    jmp loc_1403A
loc_141FD:
    cmp AX,0C5Fh
    jnz loc_14205
    jmp loc_140A7
loc_14205:
    cmp AX,0D2Bh
    jnz loc_1420D
    jmp loc_14097
loc_1420D:
    cmp AX,0D3Dh
    jnz loc_14215
    jmp loc_14057
loc_14215:
    jmp loc_1423E
loc_14217:
    cmp AX,01900h
    jz loc_141E4
    cmp AX,01E61h
    jnz loc_14224
    jmp loc_14086
loc_14224:
    cmp AX,02400h
    jnz loc_1422C
    jmp loc_140F1
loc_1422C:
    cmp AX,03000h
    jnz loc_14234
    jmp loc_14118
loc_14234:
    cmp AX,03062h
    jnz loc_1423C
    jmp loc_140C0
loc_1423C:
    jmp loc_1423E
loc_1423E:
    cmp word ptr [_word_380D0+0Dh],00h
    jz loc_14249
    dec word ptr [_word_380D0+0Dh]
loc_14249:
    cmp word ptr [_word_380D0+0Bh],00h
    jz loc_14265
    cmp word ptr [_buf3d3_1+98h],00h
    jnz loc_14265
    mov AX,02h
    push AX
    mov AX,0Eh
    push AX
    call makeSound
    add SP,04h
loc_14265:
    cmp word ptr [word_330BE],00h
    jz loc_14278
    mov byte ptr [_joyAxes-5],00h
    mov byte ptr [_joyAxes-4],00h
    jmp loc_142B6
loc_14278:
    les BX,dword ptr [_commData]
    cmp word ptr ES:[BX+072h],00h
    jz loc_1428A
    call far ptr sub_2267E
    jmp loc_142B6
loc_1428A:
    mov SI,word ptr [_a15flt_xxx+0EDh]
    inc SI
    mov AL,[_joyAxes-1]
    sub AH,AH
    db 2Dh, 80h, 00h ; sub AX,080h (force imm16 encoding)
    imul SI
    cwd
    mov CX,03h
    idiv CX
    sub AL,080h
    mov [_joyAxes-5],AL
    mov AL,[_joyAxes]
    sub AH,AH
    db 2Dh, 80h, 00h ; sub AX,080h (force imm16 encoding)
    imul SI
    cwd
    idiv CX
    sub AL,080h
    mov [_joyAxes-4],AL
loc_142B6:
    mov AL,[_joyAxes-5]
    sub AH,AH
    mov CL,04h
    shr AX,CL
    db 02Dh, 08h, 00h ; sub AX,08h (force imm16 encoding)
    mov [_word_3C00C+2],AX
    or AX,AX
    jge loc_142CD
    inc word ptr [_word_3C00C+2]
loc_142CD:
    mov AL,[_joyAxes-4]
    sub AH,AH
    mov CL,04h
    shr AX,CL
    db 02Dh, 08h, 00h ; sub AX,08h (force imm16 encoding)
    mov word ptr [_byte_3C5A0+4],AX
    or AX,AX
    jge loc_142E4
    inc word ptr [_byte_3C5A0+4]
loc_142E4:
    push word ptr [_word_3C00C+2]
    call _abs
    add SP,02h
    db 05h, 02h, 00h ; add AX,02h (force imm16 encoding)
    imul word ptr [_word_3C00C+2]
    neg AX
    shl AX,01h
    mov [_word_3C00C+2],AX
    mov AX,06h
    imul word ptr [_byte_3C5A0+4]
    mov word ptr [_byte_3C5A0+4],AX
    or AX,AX
    jge loc_14313
    mov CX,02h
    cwd
    idiv CX
    mov word ptr [_byte_3C5A0+4],AX
loc_14313:
    mov AX,[_word_380C8+1]
    cmp word ptr [_word_3BEBE],AX
    jnz loc_14330
    cmp word ptr [_byte_3C5A0+4],00h
    jge loc_14330
    cmp word ptr [_unk_3806E+57h],00h
    jg loc_14330
    mov word ptr [_byte_3C5A0+4],00h
loc_14330:
    cmp word ptr [_word_3AA5A],015Eh
    jle loc_14369
    test byte ptr [_planeFlags],01h
    jnz loc_14369
    cmp word ptr [word_336EC],00h
    jz loc_14369
    mov word ptr [word_336EC],00h
    or byte ptr [_planeFlags],01h
    mov AX,offset aLandingGearRaised
    push AX
    call tempStrcpy
    add SP,02h
    mov AX,02h
    push AX
    mov AX,020h
    push AX
    call makeSound
    add SP,04h
loc_14369:
    mov AX,[_word_380C8+1]
    cmp word ptr [_word_3BEBE],AX
    jnz loc_1438F
    cmp word ptr [_word_380D0+0Bh],00h
    jnz loc_1438F
    test byte ptr [_planeFlags],08h
    jnz loc_1438F
    or byte ptr [_planeFlags],08h
    mov AX,offset aBrakesOn
    push AX
    call tempStrcpy
    add SP,02h
loc_1438F:
    cmp word ptr [_word_3C00C+2],00h
    jnz loc_1439D
    cmp word ptr [_byte_3C5A0+4],00h
    jz loc_143A3
loc_1439D:
    mov word ptr [_word_330B6],00h
loc_143A3:
    cmp word ptr [_word_330B6],00h
    jnz loc_143AD
    jmp loc_14724
loc_143AD:
    cmp word ptr [_word_336EA],00h
    jz loc_143C5
    mov AX,[_word_38FDC+4]
    db 25h, 0Fh, 00h ; and AX,0Fh (force imm16 encoding)
    mov CX,AX
    mov AH,CL
    sub AL,AL
    sub AX,0800h
    jmp loc_143C7
loc_143C5:
    sub AX,AX
loc_143C7:
    mov word ptr [BP-2Ch],AX
    mov AX,01400h
    push AX
    mov AX,0EC00h
    push AX
    mov AX,word ptr [BP-2Ch]
    sub AX,word ptr [_unk_3806E+55h]
    add AX,word ptr [_word_3BE92]
    push AX
    call routine_163
    add SP,06h
    shl AX,01h
    mov word ptr [BP-2Ch],AX
    mov AX,018h
    push AX
    mov AX,0FFE8h
    push AX
    mov AX,word ptr [BP-2Ch]
    sub AX,word ptr [_unk_3806E+59h]
    mov CL,06h
    sar AX,CL
    push AX
    call _sub_1CF64
    add SP,06h
    neg AX
    mov [_word_3C00C+2],AX
    mov AX,0C00h
    push AX
    mov AX,0EC00h
    push AX
    mov AX,word ptr [_word_330B6]
    sub AX,word ptr [_word_380C8+1]
    mov CL,04h
    shl AX,CL
    sub AX,word ptr [_word_38FC4]
    push AX
    call routine_163
    add SP,06h
    mov word ptr [BP-14h],AX
    mov AX,08h
    push AX
    mov AX,0FFF8h
    push AX
    mov AX,word ptr [BP-14h]
    sub AX,word ptr [_unk_3806E+57h]
    mov CL,07h
    sar AX,CL
    push AX
    call _sub_1CF64
    add SP,06h
    mov word ptr [_byte_3C5A0+4],AX
    cmp word ptr [_waypointIndex],03h
    jz loc_14450
    jmp loc_14724
loc_14450:
    mov AX,word ptr [_buf3d3_1+9Ah]
    mov word ptr [BP-3Eh],AX
    mov AX,[_word_3B14A+10h]
    mov word ptr [BP-10h],AX
    mov SI,AX
    mov CL,04h
    shl SI,CL
    mov AX,word ptr [SI+offset _stru_3AA5E]
    sub AX,word ptr [_word_3BEC0]
    mov word ptr [BP-2Ah],AX
    mov AX,word ptr [SI+offset _stru_3AA5E + 2]
    sub AX,word ptr [_word_3BED0]
    mov word ptr [BP-34h],AX
    test word ptr [SI+offset _stru_3AA5E + 6],0200h
    jnz loc_1448C
    push AX
    call _sub_1D1C8
    add SP,02h
    neg AX
    mov word ptr [BP-3Eh],AX
loc_1448C:
    mov BX,word ptr [BP-10h]
    mov CL,04h
    shl BX,CL
    test word ptr [BX+offset _stru_3AA5E + 6],0200h
    jz loc_144A0
    mov AX,01Eh
    jmp loc_144A3
loc_144A0:
    mov AX,040h
loc_144A3:
    imul word ptr [BP-3Eh]
    add word ptr [BP-34h],AX
    push word ptr [_unk_3806E+55h]
    call _abs
    add SP,02h
    mov word ptr [BP-2Ch],AX
    cmp word ptr [BP-3Eh],-01h
    jnz loc_144DC
    mov AX,word ptr [BP-2Ah]
    neg AX
    mov word ptr [BP-2Ah],AX
    mov AX,word ptr [BP-34h]
    neg AX
    mov word ptr [BP-34h],AX
    mov AX,word ptr [_unk_3806E+55h]
    sub AX,08000h
    push AX
    call _abs
    add SP,02h
    mov word ptr [BP-2Ch],AX
loc_144DC:
    mov AX,01000h
    push AX
    mov AX,032h
    push AX
    push word ptr [BP-34h]
    call _abs
    add SP,02h
    push word ptr [BP-2Ah]
    mov SI,AX
    call _abs
    add SP,02h
    add AX,SI
    shl AX,01h
    mov CX,AX
    mov AX,word ptr [BP-2Ch]
    mov BX,CX
    cwd
    xor AX,DX
    sub AX,DX
    mov CX,05h
    sar AX,CL
    xor AX,DX
    sub AX,DX
    add BX,AX
    push BX
    call _sub_1CF64
    add SP,06h
    mov word ptr [BP-14h],AX
    cmp AX,01000h
    jge loc_14525
    call sub_1DB9C
loc_14525:
    mov BX,word ptr [BP-10h]
    mov CL,04h
    shl BX,CL
    test word ptr [BX+offset _stru_3AA5E + 6],0200h
    jz loc_14538
    add word ptr [BP-14h],064h
loc_14538:
    cmp word ptr [word_33702],00h
    jz loc_14552
    push word ptr [BP-2Ch]
    call _abs
    add SP,02h
    cmp AX,0200h
    jge loc_14552
    mov word ptr [BP-14h],0FFECh
loc_14552:
    mov SI,word ptr [BP-10h]
    mov CL,04h
    shl SI,CL
    test word ptr [SI+offset _stru_3AA5E + 6],0200h
    jz loc_14566
    mov AX,01Ch
    jmp loc_14569
loc_14566:
    mov AX,038h
loc_14569:
    imul word ptr [BP-3Eh]
    add AX,word ptr [SI+offset _stru_3AA5E + 2]
    mov word ptr [BP-34h],AX
    mov AX,0C00h
    push AX
    sub AX,AX
    push AX
    push word ptr [BP-2Ah]
    call _abs
    add SP,02h
    shl AX,01h
    shl AX,01h
    mov CX,AX
    mov AX,word ptr [BP-2Ch]
    mov BX,CX
    cwd
    xor AX,DX
    sub AX,DX
    mov CX,04h
    sar AX,CL
    xor AX,DX
    sub AX,DX
    add AX,BX
    push AX
    call _sub_1CF64
    add SP,06h
    imul word ptr [BP-3Eh]
    add word ptr [BP-34h],AX
    and byte ptr [_planeFlags],0F7h
    cmp word ptr [BP-2Ch],04000h
    jle loc_145CC
    mov BX,word ptr [BP-10h]
    mov CL,04h
    shl BX,CL
    mov AX,word ptr [BX+offset _stru_3AA5E]
    mov word ptr [BP-2Ah],AX
    mov word ptr [BP-14h],01000h
    jmp loc_145F4
loc_145CC:
    mov AX,word ptr [BP-3Eh]
    imul word ptr [BP-2Ah]
    shl AX,01h
    mov BX,word ptr [BP-10h]
    mov CL,04h
    shl BX,CL
    add AX,word ptr [BX+offset _stru_3AA5E]
    mov word ptr [BP-2Ah],AX
    mov AX,050h
    imul word ptr [_word_380D0+0Bh]
    cmp AX,word ptr [_word_3AA5A]
    jge loc_145F4
    or byte ptr [_planeFlags],08h
loc_145F4:
    mov AX,[_word_3BED0]
    sub AX,word ptr [BP-34h]
    push AX
    mov AX,word ptr [BP-2Ah]
    sub AX,word ptr [_word_3BEC0]
    push AX
    call _sub_1D008
    add SP,04h
    mov word ptr [BP-0Eh],AX
    mov AX,[_word_3AA5A]
    cwd
    xor AX,DX
    sub AX,DX
    mov CX,04h
    sar AX,CL
    xor AX,DX
    sub AX,DX
    mov word ptr [BP-3Ch],AX
    mov AH,byte ptr [BP-3Ch]
    sub AL,AL
    push AX
    mov AX,word ptr [BP-3Ch]
    neg AX
    mov CH,AL
    sub CL,CL
    push CX
    mov AX,word ptr [BP-0Eh]
    sub AX,word ptr [_unk_3806E+55h]
    push AX
    call routine_163
    add SP,06h
    shl AX,01h
    mov word ptr [BP-2Ch],AX
    cmp word ptr [word_33702],00h
    jz loc_1464F
    mov word ptr [BP-2Ch],00h
loc_1464F:
    mov AX,020h
    push AX
    mov AX,0FFE0h
    push AX
    mov AX,word ptr [BP-2Ch]
    sub AX,word ptr [_unk_3806E+59h]
    mov CL,06h
    sar AX,CL
    push AX
    call _sub_1CF64
    add SP,06h
    neg AX
    mov [_word_3C00C+2],AX
    mov AX,050h
    push AX
    mov AX,023h
    push AX
    push word ptr [BP-2Ch]
    call _abs
    add SP,02h
    cwd
    xor AX,DX
    sub AX,DX
    mov CX,08h
    sar AX,CL
    xor AX,DX
    sub AX,DX
    mov CX,AX
    mov AX,word ptr [BP-14h]
    mov BX,CX
    cwd
    xor AX,DX
    sub AX,DX
    mov CX,06h
    sar AX,CL
    xor AX,DX
    sub AX,DX
    add BX,AX
    push BX
    call _sub_1CF64
    add SP,06h
    mov [_word_380D0+0Bh],AX
    call _sub_15FDB
    mov AX,018h
    push AX
    mov AX,0FFE8h
    push AX
    mov AX,word ptr [BP-14h]
    sub AX,word ptr [_word_380C8+1]
    mov CL,03h
    sar AX,CL
    mov DX,word ptr [_word_38FC4]
    mov CL,07h
    sar DX,CL
    add AX,DX
    push AX
    call routine_163
    add SP,06h
    mov word ptr [BP-14h],AX
    mov AX,010h
    push AX
    mov AX,0FFF0h
    push AX
    mov AX,word ptr [BP-14h]
    mov DX,word ptr [_unk_3806E+57h]
    mov CL,07h
    sar DX,CL
    sub AX,DX
    push AX
    call _sub_1CF64
    add SP,06h
    mov word ptr [_byte_3C5A0+4],AX
    cmp word ptr [_word_3AA5A],015Eh
    jge loc_14704
    and byte ptr [_planeFlags],0FEh
loc_14704:
    mov AX,[_word_380C8+1]
    cmp word ptr [_word_3BEBE],AX
    jnz loc_14724
    mov word ptr [_word_380D0+0Bh],00h
    mov word ptr [_word_3C00C+2],00h
    or byte ptr [_planeFlags],08h
    mov word ptr [_byte_3C5A0+4],00h
loc_14724:
    les BX,dword ptr [_gameData]
    cmp word ptr ES:[BX+040h],00h
    jz loc_14753
    mov AX,[_word_3AA5A]
    cwd
    push DX
    push AX
    mov AX,03E8h
    sub AX,word ptr [_word_380C8+1]
    cwd
    push DX
    push AX
    call __aNlmul
    mov CL,0Fh
loc_14744:
    sar DX,01h
    rcr AX,01h
    dec CL
    jz loc_1474E
    jmp loc_14744
loc_1474E:
    mov word ptr [BP-24h],AX
    jmp loc_14758
loc_14753:
    mov word ptr [BP-24h],00h
loc_14758:
    test byte ptr [_planeFlags],01h
    jnz loc_1477A
    mov AX,020h
    push AX
    sub AX,AX
    push AX
    mov AX,[_word_3AA5A]
    db 2Dh, 0C8h, 00h ; sub AX,0C8h (force imm16 encoding)
    mov CL,05h
    sar AX,CL
    push AX
    call _sub_1CF64
    add SP,06h
    add word ptr [BP-24h],AX
loc_1477A:
    cmp word ptr [BP-24h],00h
    jle loc_147B3
    mov AX,[_word_380C8+1]
    cmp word ptr [_word_3BEBE],AX
    jnc loc_147B3
    push word ptr [BP-24h]
    call randlmul
    add SP,02h
    mov CX,word ptr [BP-24h]
    sar CX,01h
    sub AX,CX
    add word ptr [_word_3C00C+2],AX
    push word ptr [BP-24h]
    call randlmul
    add SP,02h
    mov CX,word ptr [BP-24h]
    sar CX,01h
    sub AX,CX
    sar AX,01h
    add word ptr [_byte_3C5A0+4],AX
loc_147B3:
    test byte ptr [_planeFlags],01h
    jz loc_1481B
    cmp word ptr [_byte_3C5A0+4],00h
    jg loc_1481B
    mov AX,[_word_3A940+4]
    cmp word ptr [_val_3dt+0F9Ah],AX
    jnc loc_1481B
    les BX,dword ptr [_gameData]
    cmp word ptr ES:[BX+040h],02h
    jnc loc_1481B
    push word ptr [_unk_3806E+59h]
    call _abs
    add SP,02h
    cmp AX,03000h
    jge loc_1481B
    cmp word ptr [_fileHandle+2],00h
    jnz loc_1481B
    mov AX,[_word_38FC4]
    sub AX,word ptr [_unk_3806E+57h]
    sar AX,01h
    sar AX,01h
    sub AX,word ptr [_word_380C8+1]
    add AX,012Ch
    sar AX,01h
    sar AX,01h
    mov word ptr [BP-14h],AX
    or AX,AX
    jle loc_1481B
    mov AX,020h
    push AX
    sub AX,AX
    push AX
    push word ptr [BP-14h]
    call _sub_1CF64
    add SP,06h
    mov word ptr [_byte_3C5A0+4],AX
loc_1481B:
    cmp word ptr [_byte_3B7FC+640h],00h
    jnz loc_14825
    jmp loc_14958
loc_14825:
    mov word ptr [_word_3C00C+2],040h
    push word ptr [_unk_3806E+59h]
    call _abs
    add SP,02h
    cmp AX,04000h
    jle loc_1483F
    mov AX,010h
    jmp loc_14842
loc_1483F:
    mov AX,0FFF8h
loc_14842:
    mov word ptr [_byte_3C5A0+4],AX
    mov AX,080h
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    push AX
    mov AX,0FF00h
    cwd
    idiv CX
    push AX
    inc word ptr [_byte_3B7FC+640h]
    mov AX,word ptr [_byte_3B7FC+640h]
    db 2Dh, 20h, 00h ; sub AX,020h (force imm16 encoding)
    neg AX
    push AX
    call _sub_1CF64
    add SP,06h
    add word ptr [_word_3C040],AX
    jns loc_14886
    mov word ptr [_word_3C040],00h
    test byte ptr [_word_38FDC+4],07h
    jnz loc_14886
    sub AX,AX
    push AX
    call sub_11B37
    add SP,02h
loc_14886:
    cmp word ptr [_word_380C8+1],00h
    jnz loc_148D1
    cmp word ptr [word_336F6],-01h
    jnz loc_148D1
    mov word ptr [word_336F6],00h
    mov AX,[_word_3BEC0]
    mov [_stru_3AA5E],AX
    mov AX,[_word_3BED0]
    mov [_stru_3AA5E+2],AX
    mov AX,[_word_3BEC0]
    mov [_word_3BE98+24h],AX
    mov AX,[_word_3BED0]
    mov word ptr [_byte_3BEC4+4],AX
    mov word ptr [_sign3d3+4],00h
    mov word ptr [_word_39604+2],0FFF8h
    mov AX,02h
    push AX
    push AX
    call makeSound
    add SP,04h
    sub AX,AX
    mov [_word_380D0+0Bh],AX
    mov [_word_3A940+4],AX
loc_148D1:
    mov AX,word ptr [_byte_3B7FC+640h]
    and AL,0FCh
    db 3Dh, 10h, 00h ; cmp AX,010h (force imm16 encoding)
    jnz loc_14958
    mov AL,byte ptr [_word_336E8]
    and AL,03h
    cmp AL,01h
    jnz loc_14958
    mov word ptr [word_336F6],0FFFFh
    mov AX,word ptr [_word_336E8]
    shr AX,01h
    db 25h, 07h, 00h ; and AX,07h (force imm16 encoding)
    mov word ptr [BP-38h],AX
    mov SI,AX
    mov CL,03h
    shl SI,CL
    mov AX,[_word_3BEC0]
    mov word ptr [SI+offset stru_33402],AX
    mov AX,[_word_3BED0]
    mov word ptr [SI+offset stru_33402 + 2],AX
    mov AX,[_word_380C8+1]
    mov word ptr [SI+offset stru_33402 + 4],AX
    mov AX,020h
    push AX
    call randlmul
    add SP,02h
    mov CL,0Bh
    shl AX,CL
    mov word ptr [SI+offset stru_33402 + 6],AX
    mov AX,word ptr [BP-38h]
    mov word ptr [word_33442],AX
    mov AX,[_word_3BEC0]
    mov [_word_3BE98+24h],AX
    mov AX,[_word_3BED0]
    mov word ptr [_byte_3BEC4+4],AX
    mov AX,[_word_380C8+1]
    mov [_sign3d3+4],AX
    mov word ptr [_word_39604+2],0FFF8h
    mov AX,02h
    push AX
    sub AX,AX
    push AX
    call makeSound
    add SP,04h
    mov word ptr [_unk_3806E+57h],0C000h
    mov byte ptr [_word_380D0+8],01h
loc_14958:
    cmp word ptr [_tempString+50h],00h
    jz loc_14984
    mov AX,word ptr [_tempString+50h]
    shl AX,01h
    shl AX,01h
    db 2Dh, 90h, 00h ; sub AX,090h (force imm16 encoding)
    neg AX
    mov SI,AX
    cmp word ptr [_word_380D0+0Bh],SI
    jle loc_14984
    mov word ptr [_word_380D0+0Bh],SI
    or SI,SI
    jge loc_14981
    mov word ptr [_word_380D0+0Bh],00h
loc_14981:
    call _sub_15FDB
loc_14984:
    mov AX,[_word_380D0+0Bh]
    sub AX,word ptr [_buf3d3_1+98h]
    cwd
    xor AX,DX
    sub AX,DX
    mov CX,02h
    sar AX,CL
    xor AX,DX
    sub AX,DX
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    add word ptr [_buf3d3_1+98h],AX
    mov AX,word ptr [_buf3d3_1+98h]
    cmp word ptr [_word_380D0+0Bh],AX
    jle loc_149B1
    inc word ptr [_buf3d3_1+98h]
loc_149B1:
    mov AX,word ptr [_buf3d3_1+98h]
    cmp word ptr [_word_380D0+0Bh],AX
    jge loc_149C0
    mov AX,[_word_380D0+0Bh]
    mov word ptr [_buf3d3_1+98h],AX
loc_149C0:
    mov AX,word ptr [_word_336E8]
    sub DX,DX
    mov CX,word ptr [_word_330C4]
    shl CX,01h
    div CX
    or DX,DX
    jnz loc_149F4
    cmp word ptr [_word_380D0+0Bh],00h
    jz loc_149F4
    cmp word ptr [_word_336EA],00h
    jnz loc_149F4
    mov AX,[_word_380D0+0Bh]
    imul AX
    cwd
    mov CX,02EEh
    idiv CX
    db 05h, 02h, 00h ; add AX,02h (force imm16 encoding)
    sub word ptr [word_33098],AX
    call sub_1606C
loc_149F4:
    cmp word ptr [word_33098],00h
    jg loc_14A07
    mov word ptr [_buf3d3_1+98h],00h
    mov word ptr [word_33098],00h
loc_14A07:
    push word ptr [_unk_3806E+59h]
    call _abs
    add SP,02h
    mov BX,AX
    mov CL,08h
    sar BX,CL
    and BX,07Fh
    mov AL,byte ptr [BX+offset byte_37FEC]
    sub AH,AH
    mov [_word_38FC4+16h],AX
    mov AX,[_word_380C8+1]
    cmp word ptr [_word_3BEBE],AX
    jnc loc_14A38
    mov AX,word ptr [_byte_3C5A0+4]
    cwd
    sub AX,DX
    sar AX,01h
    add word ptr [_word_38FC4+16h],AX
loc_14A38:
    cmp word ptr [_word_38FC4+16h],080h
    jle loc_14A75
    mov word ptr [_word_38FC4+16h],080h
    push word ptr [_byte_3C5A0+4]
    sub AX,AX
    push AX
    push word ptr [_unk_3806E+59h]
    call _abs
    add SP,02h
    mov BX,AX
    mov CL,08h
    sar BX,CL
    and BX,07Fh
    mov AL,byte ptr [BX+offset byte_37FEC]
    sub AH,AH
    db 2Dh, 80h, 00h ; sub AX,080h (force imm16 encoding)
    neg AX
    push AX
    call _sub_1CF64
    add SP,06h
    mov word ptr [_byte_3C5A0+4],AX
loc_14A75:
    mov AX,0Ah
    push AX
    mov AX,offset strBuf
    push AX
    mov AX,[_word_38FC4+16h]
    cwd
    xor AX,DX
    sub AX,DX
    mov CX,04h
    sar AX,CL
    xor AX,DX
    sub AX,DX
    push AX
    call _itoa
    add SP,06h
    push AX
    mov AX,offset unk_38FD0
    push AX
    call _strcpy
    add SP,04h
    mov AX,offset a_
    push AX
    mov AX,offset unk_38FD0
    push AX
    call _strcat
    add SP,04h
    mov AX,0Ah
    push AX
    mov AX,offset strBuf
    push AX
    push word ptr [_word_38FC4+16h]
    call _abs
    add SP,02h
    sub AH,AH
    db 25h, 0Fh, 00h ; and AX,0Fh (force imm16 encoding)
    shr AX,01h
    push AX
    call _itoa
    add SP,06h
    push AX
    mov AX,offset unk_38FD0
    push AX
    call _strcat
    add SP,04h
    mov AX,offset aG
    push AX
    mov AX,offset unk_38FD0
    push AX
    call _strcat
    add SP,04h
    mov AX,064h
    cwd
    push DX
    push AX
    mov AX,0320h
    cwd
    push DX
    push AX
    mov AX,050h
    push AX
    push word ptr [_unk_3806E+57h]
    call _sub_1D178
    add SP,04h
    mov CX,AX
    mov AX,word ptr [_buf3d3_1+98h]
    sub AX,CX
    cwd
    push DX
    push AX
    call __aNlmul
    push DX
    push AX
    call __aNldiv
    mov word ptr [BP-32h],AX
    mov word ptr [_word_3C5A6],064h
    mov AX,[_word_380C8+1]
    mov CL,07h
    shr AX,CL
    add AH,04h
    sub CX,CX
    push CX
    push AX
    mov AX,word ptr [BP-32h]
    cwd
    push DX
    push AX
    call __aNlmul
    mov CL,0Ah
loc_14B35:
    shr DX,01h
    rcr AX,01h
    dec CL
    jz loc_14B3F
    jmp loc_14B35
loc_14B3F:
    mov word ptr [BP-32h],AX
    mov AX,064h
    cwd
    push DX
    push AX
    mov AX,[_word_380CA+1]
    mov CL,06h
    shr AX,CL
    add AH,04h
    sub CX,CX
    push CX
    push AX
    call __aNlmul
    mov CL,0Ah
loc_14B5B:
    shr DX,01h
    rcr AX,01h
    dec CL
    jz loc_14B65
    jmp loc_14B5B
loc_14B65:
    mov [_word_3C5A6],AX
    mov AX,05Ah
    cwd
    push DX
    push AX
    mov AX,word ptr [BP-32h]
    cwd
    push DX
    push AX
    mov AX,word ptr [word_33098]
    mov CL,09h
    sar AX,CL
    db 2Dh, 64h, 00h ; sub AX,064h (force imm16 encoding)
    neg AX
    cwd
    push DX
    push AX
    call __aNlmul
    push DX
    push AX
    call __aNldiv
    mov word ptr [BP-32h],AX
    mov AX,080h
    sub AX,word ptr [_word_38FC4+16h]
    cwd
    push DX
    push AX
    mov AX,word ptr [BP-32h]
    cwd
    push DX
    push AX
    call __aNlmul
    mov CL,07h
loc_14BA3:
    sar DX,01h
    rcr AX,01h
    dec CL
    jz loc_14BAD
    jmp loc_14BA3
loc_14BAD:
    mov word ptr [BP-32h],AX
    mov AX,[_word_3C5A6]
    cwd
    push DX
    push AX
    mov AX,[_word_38FC4+16h]
    shl AX,01h
    shl AX,01h
    push AX
    call sub_15557
    add SP,02h
    cwd
    push DX
    push AX
    call __aNlmul
    mov CL,03h
loc_14BCC:
    sar DX,01h
    rcr AX,01h
    dec CL
    jz loc_14BD6
    jmp loc_14BCC
loc_14BD6:
    mov [_word_3C5A6],AX
    push AX
    call _abs
    add SP,02h
    mov [_word_3C5A6],AX
    test byte ptr [_planeFlags],01h
    jnz loc_14BF4
    mov AX,word ptr [BP-32h]
    mov CL,03h
    sar AX,CL
    sub word ptr [BP-32h],AX
loc_14BF4:
    mov AX,01Bh
    imul word ptr [_word_3C5A6]
    mov word ptr [_val_3dt+0F9Ah],AX
    mov AX,0383h
    push AX
    sub AX,AX
    push AX
    push word ptr [BP-32h]
    call _sub_1CF64
    add SP,06h
    mov CX,01Bh
    imul CX
    mov word ptr [BP-1Ah],AX
    mov AX,word ptr [_word_330C4]
    cwd
    push DX
    push AX
    mov AX,010h
    cwd
    push DX
    push AX
    mov AX,[_word_3A940+4]
    cwd
    mov CX,AX
    mov AX,word ptr [BP-1Ah]
    mov BX,DX
    cwd
    sub AX,CX
    sbb DX,BX
    push DX
    push AX
    call __aNldiv
    push DX
    push AX
    call __aNldiv
    add word ptr [_word_3A940+4],AX
    push word ptr [_word_3A940+4]
    call _abs
    add SP,02h
    inc AX
    cwd
    push DX
    push AX
    mov AX,0C00h
    cwd
    push DX
    push AX
    mov AX,word ptr [_val_3dt+0F9Ah]
    cwd
    push DX
    push AX
    call __aNlmul
    push DX
    push AX
    call __aNldiv
    mov word ptr [_dword_3B4D4+6],AX
    cmp AX,02000h
    jbe loc_14C70
    mov word ptr [_dword_3B4D4+6],02000h
loc_14C70:
    mov AX,word ptr [_dword_3B4D4+6]
    sub AX,0300h
    push AX
    push word ptr [_unk_3806E+59h]
    call _sub_1D190
    add SP,04h
    mov [_word_38FC4],AX
    test byte ptr [_planeFlags],08h
    jz loc_14CE0
    mov AX,[_word_380C8+1]
    cmp word ptr [_word_3BEBE],AX
    jnz loc_14CCF
    mov CX,01Bh
    les BX,dword ptr [_gameData]
    mov AX,word ptr ES:[BX+040h]
    mov DX,CX
    mov CL,03h
    shl AX,CL
    db 2Dh, 20h, 00h ; sub AX,020h (force imm16 encoding)
    neg AX
    mov CX,DX
    mul CX
    sub DX,DX
    div word ptr [_word_330C4]
    sub word ptr [_word_3A940+4],AX
    cmp word ptr [_word_3BEBE],00h
    jz loc_14CCD
    cmp word ptr [_word_3A940+4],01B0h
    jnc loc_14CCD
    mov word ptr [_word_3A940+4],00h
loc_14CCD:
    jmp loc_14CE0
loc_14CCF:
    mov AX,[_word_3A940+4]
    mov CL,04h
    shr AX,CL
    sub DX,DX
    div word ptr [_word_330C4]
    sub word ptr [_word_3A940+4],AX
loc_14CE0:
    cmp word ptr [_word_3A940+4],0AFC8h
    jbe loc_14CEE
    mov word ptr [_word_3A940+4],00h
loc_14CEE:
    push word ptr [_word_3A940+4]
    push word ptr [_unk_3806E+57h]
    call _sub_1D190
    add SP,04h
    mov word ptr [BP-22h],AX
    mov AX,[_word_3A940+4]
    sub DX,DX
    mov CX,01Bh
    div CX
    mov [_word_3AA5A],AX
    push word ptr [_buf3d3_1+98h]
    push AX
    call far ptr audio_jump_6a
    add SP,04h
    mov AX,[_word_3A940+4]
    mov CL,09h
    shr AX,CL
    db 05h, 20h, 00h ; add AX,020h (force imm16 encoding)
    cwd
    push DX
    push AX
    mov AX,[_word_38FC4+16h]
    mov CL,04h
    shl AX,CL
    push AX
    push word ptr [_unk_3806E+59h]
    call _sub_1D178
    add SP,04h
    cwd
    mov CL,07h
loc_14D3B:
    shl AX,01h
    rcl DX,01h
    dec CL
    jz loc_14D45
    jmp loc_14D3B
loc_14D45:
    push DX
    push AX
    call __aNldiv
    mov word ptr [BP-18h],AX
    push AX
    push word ptr [_unk_3806E+57h]
    call _sub_1D190
    add SP,04h
    mov word ptr [BP-18h],AX
    mov AX,[_word_380C8+1]
    cmp word ptr [_word_3BEBE],AX
    jnz loc_14D85
    mov AX,[_word_3C00C+2]
    neg AX
    mov CL,06h
    shl AX,CL
    mov word ptr [BP-18h],AX
    mov word ptr [_word_3C00C+2],00h
    mov AX,[_word_3C5A6]
    cmp word ptr [_word_3AA5A],AX
    jge loc_14D85
    mov word ptr [_byte_3C5A0+4],00h
loc_14D85:
    cmp word ptr [_word_38FDC+2],00h
    jz loc_14D9E
    mov AX,0FC00h
    sub AX,word ptr [_unk_3806E+57h]
    mov word ptr [_byte_3C5A0+4],AX
    sub AX,AX
    mov [_word_3A940+4],AX
    mov [_word_380D0+0Bh],AX
loc_14D9E:
    mov AX,word ptr [_word_330C4]
    cwd
    push DX
    push AX
    mov AX,[_word_3C00C+2]
    cwd
    mov CL,07h
loc_14DAA:
    shl AX,01h
    rcl DX,01h
    dec CL
    jz loc_14DB4
    jmp loc_14DAA
loc_14DB4:
    push DX
    push AX
    call __aNldiv
    mov word ptr [BP-28h],AX
    or AX,AX
    jz loc_14DEC
    push AX
    call sub_13B86
    add SP,02h
    mov word ptr [_unk_3806E+39h],AX
    mov word ptr [_unk_3806E+31h],AX
    push word ptr [BP-28h]
    call sub_13B96
    add SP,02h
    mov word ptr [_unk_3806E+33h],AX
    neg AX
    mov word ptr [_unk_3806E+37h],AX
    mov AX,offset word_380A4
    push AX
    mov AX,offset _unk_3806E
    push AX
    call sub_151F9
    add SP,04h
loc_14DEC:
    mov AX,word ptr [_byte_3C5A0+4]
    mov CL,07h
    shl AX,CL
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    mov word ptr [BP-20h],AX
    or AX,AX
    jz loc_14E2D
    push AX
    call sub_13B86
    add SP,02h
    mov word ptr [_unk_3806E+2Fh],AX
    mov word ptr [_unk_3806E+27h],AX
    push word ptr [BP-20h]
    call sub_13B96
    add SP,02h
    mov word ptr [_unk_3806E+2Dh],AX
    neg AX
    mov word ptr [_unk_3806E+29h],AX
    mov AX,offset unk_38092
    push AX
    mov AX,offset _unk_3806E
    push AX
    call sub_151F9
    add SP,04h
loc_14E2D:
    mov AX,word ptr [BP-18h]
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    mov word ptr [BP-16h],AX
    or AX,AX
    jz loc_14E6A
    push AX
    call sub_13B86
    add SP,02h
    mov word ptr [_unk_3806E+1Dh],AX
    mov word ptr [_unk_3806E+0Dh],AX
    push word ptr [BP-16h]
    call sub_13B96
    add SP,02h
    mov word ptr [_unk_3806E+11h],AX
    neg AX
    mov word ptr [_unk_3806E+19h],AX
    mov AX,offset _unk_3806E
    push AX
    mov AX,offset word_38080
    push AX
    call sub_151F9
    add SP,04h
loc_14E6A:
    call sub_15237
    mov AX,[_word_3A940+4]
    cmp word ptr [_val_3dt+0F9Ah],AX
    jbe loc_14EC6
    mov AX,[_word_380C8+1]
    cmp word ptr [_word_3BEBE],AX
    jnc loc_14EC6
    les BX,dword ptr [_gameData]
    cmp word ptr ES:[BX+040h],02h
    jz loc_14E91
    cmp word ptr [_tempString+50h],08h
    jle loc_14E95
loc_14E91:
    mov CL,01h
    jmp loc_14E97
loc_14E95:
    mov CL,02h
loc_14E97:
    mov AX,word ptr [_val_3dt+0F9Ah]
    sub AX,word ptr [_word_3A940+4]
    shr AX,CL
    sub word ptr [_unk_3806E+57h],AX
    mov byte ptr [_word_380D0+8],01h
    cmp word ptr [_unk_3806E+57h],00h
    jl loc_14EB8
    cmp word ptr [_word_380C8+1],0C8h
    jnc loc_14EC6
loc_14EB8:
    mov AX,01h
    push AX
    mov AX,014h
    push AX
    call makeSound
    add SP,04h
loc_14EC6:
    mov AX,[_word_380C8+1]
    cmp word ptr [_word_3BEBE],AX
    jnz loc_14F05
    cmp word ptr [_unk_3806E+59h],00h
    jz loc_14EE1
    mov word ptr [_unk_3806E+59h],00h
    mov byte ptr [_word_380D0+8],01h
loc_14EE1:
    cmp word ptr [_unk_3806E+57h],00h
    jl loc_14EF3
    jle loc_14F05
    mov AX,[_word_3C5A6]
    cmp word ptr [_word_3AA5A],AX
    jge loc_14F05
loc_14EF3:
    cmp word ptr [_word_38FDC+2],00h
    jnz loc_14F00
    mov word ptr [_unk_3806E+57h],00h
loc_14F00:
    mov byte ptr [_word_380D0+8],01h
loc_14F05:
    mov word ptr [_word_38FDC+2],00h
    push word ptr [_unk_3806E+59h]
    call _abs
    add SP,02h
    cwd
    sub AX,DX
    sar AX,01h
    push word ptr [_unk_3806E+57h]
    mov SI,AX
    call _abs
    add SP,02h
    sub AX,SI
    cmp AX,01000h
    jle loc_14F31
    mov AL,01h
    jmp loc_14F33
loc_14F31:
    sub AL,AL
loc_14F33:
    mov byte ptr [_word_3C69E+2],AL
    cmp byte ptr [_word_380D0+8],00h
    jz loc_14F40
    call sub_15411
loc_14F40:
    mov AX,[_word_380CA+1]
    mov word ptr [BP-0Ch],AX
    mov AX,word ptr [_unk_3806E+57h]
    sub AX,word ptr [_word_38FC4]
    push AX
    call sub_13B96
    add SP,02h
    push AX
    mov AX,[_word_3A940+4]
    sub DX,DX
    mov CX,0Ah
    div CX
    push AX
    call sub_13B2F
    add SP,04h
    mov [_word_3C8B6],AX
    cmp word ptr [word_33712],00h
    jnz loc_14FCF
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    add word ptr [_word_380CA+1],AX
    push word ptr [_unk_3806E+55h]
    call sub_13B96
    add SP,02h
    push AX
    push word ptr [BP-22h]
    call sub_13B2F
    add SP,04h
    cwd
    mov CX,0Ah
    idiv CX
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    cwd
    add word ptr [_dword_3B7DA],AX
    adc word ptr [_dword_3B7DA+2],DX
    push word ptr [_unk_3806E+55h]
    call sub_13B86
    add SP,02h
    push AX
    push word ptr [BP-22h]
    call sub_13B2F
    add SP,04h
    cwd
    mov CX,0Ah
    idiv CX
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    cwd
    add word ptr [_dword_3B7F8],AX
    adc word ptr [_dword_3B7F8+2],DX
loc_14FCF:
    cmp word ptr [_word_380CA+1],0F230h
    ja loc_14FE0
    mov AX,[_word_380CA+1]
    cmp word ptr [_word_3BEBE],AX
    jbe loc_14FE6
loc_14FE0:
    mov AX,[_word_3BEBE]
    mov [_word_380CA+1],AX
loc_14FE6:
    cmp word ptr [_word_380CA+1],0EA60h
    jbe loc_14FF4
    mov word ptr [_word_380CA+1],0EA60h
loc_14FF4:
    cmp word ptr [_word_380CA+1],02000h
    jnc loc_15004
    mov AX,[_word_380CA+1]
    mov [_word_380C8+1],AX
    jmp loc_1502C
loc_15004:
    cmp word ptr [_word_380CA+1],04000h
    jnc loc_1501C
    mov AX,[_word_380CA+1]
    sub AX,02000h
    shr AX,01h
    add AH,020h
    mov [_word_380C8+1],AX
    jmp loc_1502C
loc_1501C:
    mov AX,[_word_380CA+1]
    sub AX,04000h
    shr AX,01h
    shr AX,01h
    add AH,030h
    mov [_word_380C8+1],AX
loc_1502C:
    mov AX,[_word_380C8+1]
    cmp word ptr [_word_3BEBE],AX
    jz loc_15038
    jmp loc_150DF
loc_15038:
    mov AX,[_word_3BEBE]
    cmp word ptr [BP-0Ch],AX
    jg loc_15043
    jmp loc_150D9
loc_15043:
    cmp word ptr [word_33702],00h
    jnz loc_1504D
    jmp loc_150D9
loc_1504D:
    mov AX,02h
    push AX
    mov AX,0Ch
    push AX
    call makeSound
    add SP,04h
    mov BX,word ptr [_word_3C16A]
    mov CL,04h
    shl BX,CL
    test word ptr [BX+offset _stru_3AA5E + 6],0200h
    jz loc_15070
    mov AX,0100h
    jmp loc_15073
loc_15070:
    mov AX,080h
loc_15073:
    mov CX,AX
    mov AX,[_word_3C8B6]
    neg AX
    imul word ptr [word_330B8]
    cwd
    sub AX,DX
    sar AX,01h
    cmp CX,AX
    jl loc_150B8
    les BX,dword ptr [_gameData]
    cmp word ptr ES:[BX+040h],00h
    jz loc_150D9
    test byte ptr [_planeFlags],01h
    jnz loc_150B8
    push word ptr [_unk_3806E+59h]
    call _abs
    add SP,02h
    mov CX,AX
    mov AX,030h
    cwd
    mov BX,word ptr [word_330B8]
    inc BX
    idiv BX
    mov DH,AL
    sub DL,DL
    cmp DX,CX
    jge loc_150D9
loc_150B8:
    mov AX,02h
    push AX
    sub AX,AX
    push AX
    call makeSound
    add SP,04h
    mov AX,03Ch
    push AX
    call _sub_12278
    add SP,02h
    mov AX,05h
    push AX
    call sub_11B37
    add SP,02h
loc_150D9:
    mov word ptr [_word_3C8B6],00h
loc_150DF:
    mov AX,word ptr [_word_336E8]
    db 25h, 0Fh, 00h ; and AX,0Fh (force imm16 encoding)
    mov word ptr [BP-38h],AX
    mov SI,AX
    mov CL,04h
    shl SI,CL
    mov AX,word ptr [_unk_3806E+55h]
    mov word ptr [SI+offset _stru_3A95A + 10],AX
    mov AX,word ptr [_unk_3806E+57h]
    mov word ptr [SI+offset _stru_3A95A + 12],AX
    mov AX,word ptr [_unk_3806E+59h]
    mov word ptr [SI+offset _stru_3A95A + 14],AX
    mov AX,word ptr [_dword_3B7DA]
    mov DX,word ptr [_dword_3B7DA+2]
    mov word ptr [SI+offset _stru_3A95A],AX
    mov word ptr [SI+offset _stru_3A95A + 2],DX
    mov AX,word ptr [_dword_3B7F8]
    mov DX,word ptr [_dword_3B7F8+2]
    mov word ptr [SI+offset _stru_3A95A + 4],AX
    mov word ptr [SI+offset _stru_3A95A + 6],DX
    mov AX,[_word_380C8+1]
    mov word ptr [SI+offset _stru_3A95A + 8],AX
    cmp word ptr [_word_3C45C],01h
    jz loc_15132
    jmp loc_151F3
loc_15132:
    cmp word ptr [_word_336F2],00h
    jl loc_15173
    mov AX,024h
    imul word ptr [_word_336F2]
    mov SI,AX
    mov AX,0Ch
    push AX
    sub AX,AX
    push AX
    mov AX,[_word_3BED0]
    sub AX,word ptr [SI+offset word_3B206]
    push AX
    mov AX,[_word_3BEC0]
    sub AX,word ptr [SI+offset word_3B204]
    push AX
    call _sub_1CFA6
    add SP,04h
    imul word ptr [_word_330C4]
    mov CL,08h
    sar AX,CL
    push AX
    call _sub_1CF64
    add SP,06h
    mov word ptr [BP-38h],AX
    jmp loc_1517A
loc_15173:
    mov AX,word ptr [_word_330C4]
    dec AX
    mov word ptr [BP-38h],AX
loc_1517A:
    mov AX,word ptr [_word_336E8]
    sub AX,word ptr [BP-38h]
    db 25h, 0Fh, 00h ; and AX,0Fh (force imm16 encoding)
    mov word ptr [BP-38h],AX
    mov SI,AX
    mov CL,04h
    shl SI,CL
    mov AX,word ptr [_unk_3806E+55h]
    sub AX,word ptr [SI+offset _stru_3A95A + 10]
    mov word ptr [BP-2Ch],AX
    mov AX,word ptr [_unk_3806E+57h]
    sub AX,word ptr [SI+offset _stru_3A95A + 12]
    mov word ptr [BP-14h],AX
    sar AX,01h
    sar AX,01h
    push AX
    push word ptr [_unk_3806E+59h]
    call _sub_1D178
    add SP,04h
    mov CX,word ptr [BP-2Ch]
    neg CX
    sar CX,01h
    sar CX,01h
    push CX
    push word ptr [_unk_3806E+59h]
    mov DI,AX
    call _sub_1D190
    add SP,04h
    add AX,DI
    mov [_word_3C6A4],AX
    mov AX,word ptr [BP-14h]
    sar AX,01h
    push AX
    push word ptr [_unk_3806E+59h]
    call _sub_1D190
    add SP,04h
    mov CX,word ptr [BP-2Ch]
    sar CX,01h
    sar CX,01h
    push CX
    push word ptr [_unk_3806E+59h]
    mov DI,AX
    call _sub_1D178
    add SP,04h
    add AX,DI
    mov [_word_3C6AC],AX
loc_151F3:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret

_otherKeyDispatch endp
; ------------------------------seg000:0x51f9------------------------------
sub_151F9 proc near
    push BP
    mov BP,SP
    sub SP,4h
    inc word ptr [_var_549]
    test byte ptr [_var_549],7h
    jnz LAB_1000_520f
    mov byte ptr [word_380D8],1h
LAB_1000_520f:
    mov AX,offset unk_380B6
    push AX
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call far ptr sub_20E38
    add SP,6h
    mov AX,12h
    push AX
    mov AX,offset unk_380B6
    push AX
    mov AX,offset _unk_3806E
    push AX
    call _memcpy
    add SP,6h
    mov SP,BP
    pop BP
    ret
sub_151F9 endp
; ------------------------------seg000:0x5236------------------------------
; ------------------------------seg000:0x5237------------------------------
sub_15237 proc near
    push BP
    mov BP,SP
    sub SP,2h
    mov AX,word ptr [_var_528]
    neg AX
    push AX
    call _sub_154B7
    add SP,2h
    mov word ptr [_var_544],AX
    push AX
    call sub_13B86
    add SP,2h
    mov word ptr [BP + -2h],AX
    or AX,AX
    jnz LAB_1000_525d
    jmp LAB_1000_537c
LAB_1000_525d:
    push word ptr [_var_525]
    call _abs
    add SP,2h
    cmp AX,5a81h
    jge LAB_1000_528c
    push word ptr [BP + -2h]
    push word ptr [_var_525]
    call sub_1543B
    add SP,4h
    push AX
    call _abs
    add SP,2h
    push AX
    call _sub_154B7
    add SP,2h
    mov word ptr [_var_542],AX
    jmp LAB_1000_52aa
LAB_1000_528c:
    push word ptr [BP + -2h]
    push word ptr [_var_529]
    call sub_1543B
    add SP,4h
    push AX
    call _abs
    add SP,2h
    push AX
    call _sub_15540
    add SP,2h
    mov word ptr [_var_542],AX
LAB_1000_52aa:
    cmp word ptr [_var_525],0h
    jg LAB_1000_52bd
    cmp word ptr [_var_529],0h
    jge LAB_1000_52bd
    add byte ptr [_var_543],80h
LAB_1000_52bd:
    cmp word ptr [_var_525],0h
    jle LAB_1000_52d5
    cmp word ptr [_var_529],0h
    jge LAB_1000_52d5
    mov AX,8000h
    sub AX,word ptr [_var_542]
    mov word ptr [_var_542],AX
LAB_1000_52d5:
    cmp word ptr [_var_525],0h
    jge LAB_1000_52eb
    cmp word ptr [_var_529],0h
    jle LAB_1000_52eb
    mov AX,word ptr [_var_542]
    neg AX
    mov word ptr [_var_542],AX
LAB_1000_52eb:
    push word ptr [_var_526]
    call _abs
    add SP,2h
    cmp AX,5a81h
    jge LAB_1000_531a
    push word ptr [BP + -2h]
    push word ptr [_var_526]
    call sub_1543B
    add SP,4h
    push AX
    call _abs
    add SP,2h
    push AX
    call _sub_154B7
    add SP,2h
    mov word ptr [_var_545],AX
    jmp LAB_1000_5338
LAB_1000_531a:
    push word ptr [BP + -2h]
    push word ptr [_var_527]
    call sub_1543B
    add SP,4h
    push AX
    call _abs
    add SP,2h
    push AX
    call _sub_15540
    add SP,2h
    mov word ptr [_var_545],AX
LAB_1000_5338:
    cmp word ptr [_var_526],0h
    jg LAB_1000_534b
    cmp word ptr [_var_527],0h
    jge LAB_1000_534b
    add byte ptr [_word_380C8],80h
LAB_1000_534b:
    cmp word ptr [_var_526],0h
    jle LAB_1000_5363
    cmp word ptr [_var_527],0h
    jge LAB_1000_5363
    mov AX,8000h
    sub AX,word ptr [_var_545]
    mov word ptr [_var_545],AX
LAB_1000_5363:
    cmp word ptr [_var_526],0h
    jge LAB_1000_537a
    cmp word ptr [_var_527],0h
    jle LAB_1000_537a
    sub AX,AX
    sub AX,word ptr [_var_545]
    mov word ptr [_var_545],AX
LAB_1000_537a:
    jmp LAB_1000_53d0
LAB_1000_537c:
    mov word ptr [_var_545],0h
    push word ptr [_var_524]
    call _sub_154B7
    add SP,2h
    mov word ptr [_var_542],AX
    cmp word ptr [_var_526],0h
    jg LAB_1000_53a2
    cmp word ptr [_var_527],0h
    jge LAB_1000_53a2
    add byte ptr [_var_543],80h
LAB_1000_53a2:
    cmp word ptr [_var_526],0h
    jle LAB_1000_53ba
    cmp word ptr [_var_527],0h
    jge LAB_1000_53ba
    mov AX,8000h
    sub AX,word ptr [_var_542]
    mov word ptr [_var_542],AX
LAB_1000_53ba:
    cmp word ptr [_var_526],0h
    jge LAB_1000_53d0
    cmp word ptr [_var_527],0h
    jle LAB_1000_53d0
    mov AX,word ptr [_var_542]
    neg AX
    mov word ptr [_var_542],AX
LAB_1000_53d0:
    cmp word ptr [_var_544],38e3h
    jle LAB_1000_53e5
    cmp word ptr [_var_544],4001h
    jge LAB_1000_53e5
    mov byte ptr [word_380D8],1h
LAB_1000_53e5:
    cmp word ptr [_var_544],0c71dh
    jge LAB_1000_53fa
    cmp word ptr [_var_544],0bfffh
    jle LAB_1000_53fa
    mov byte ptr [word_380D8],1h
LAB_1000_53fa:
    cmp byte ptr [_var_550],0h
    jz LAB_1000_540d
    cmp word ptr [_var_545],0h
    jnz LAB_1000_540d
    mov byte ptr [word_380D8],1h
LAB_1000_540d:
    mov SP,BP
    pop BP
    ret
sub_15237 endp
; ------------------------------seg000:0x5410------------------------------
; ------------------------------seg000:0x5411------------------------------
sub_15411 proc near
    push BP
    mov BP,SP
    push word ptr [_var_545]
    push word ptr [_var_544]
    push word ptr [_var_542]
    mov AX,offset _unk_3806E
    push AX
    call far ptr _sub_20BAE
    add SP,8h
    mov byte ptr [word_380D8],0h
    mov word ptr [_var_549],0h
    mov SP,BP
    pop BP
    ret
sub_15411 endp
; ------------------------------seg000:0x543a------------------------------
; ------------------------------seg000:0x543b------------------------------
sub_1543B proc near
    push BP
    mov BP,SP
    sub SP,0ch
    push SI
    mov byte ptr [BP + -2h],1h
    mov byte ptr [BP + -4h],1h
    cmp word ptr [BP + 4h],0h
    jge LAB_1000_5454
    mov byte ptr [BP + -2h],0ffh
LAB_1000_5454:
    cmp word ptr [BP + 6h],0h
    jge LAB_1000_545e
    mov byte ptr [BP + -4h],0ffh
LAB_1000_545e:
    cmp word ptr [BP + 4h],0h
    jge LAB_1000_546b
    mov AX,word ptr [BP + 4h]
    neg AX
    jmp LAB_1000_546e
LAB_1000_546b:
    mov AX,word ptr [BP + 4h]
LAB_1000_546e:
    cwd
    mov word ptr [BP + -8h],AX
    mov word ptr [BP + -6h],DX
    cmp word ptr [BP + 6h],0h
    jge LAB_1000_5482
    mov AX,word ptr [BP + 6h]
    neg AX
    jmp LAB_1000_5485
LAB_1000_5482:
    mov AX,word ptr [BP + 6h]
LAB_1000_5485:
    cwd
    mov word ptr [BP + -0ch],AX
    mov word ptr [BP + -0ah],DX
    push DX
    push AX
    mov DX,word ptr [BP + -8h]
    sub AX,AX
    push DX
    push AX
    call __aNuldiv
    shr DX,1h
    rcr AX,1h
    mov CX,AX
    mov AL,byte ptr [BP + -4h]
    cbw
    mov BX,AX
    mov AL,byte ptr [BP + -2h]
    cbw
    mov SI,AX
    mov AX,CX
    mul SI
    mul BX
    jmp LAB_1000_54b2
LAB_1000_54b2:
    pop SI
    mov SP,BP
    pop BP
    ret
sub_1543B endp
; ------------------------------seg000:0x54b6------------------------------
; ------------------------------seg000:0x54b7------------------------------
_sub_154B7 proc near
    push BP
    mov BP,SP
    sub SP,8h
    push SI
    cmp word ptr [BP + 4h],8000h
    jnz LAB_1000_54ca
    mov AX,0c000h
    jmp LAB_1000_553b
LAB_1000_54ca:
    push word ptr [BP + 4h]
    call _abs
    add SP,2h
    mov word ptr [BP + -4h],AX
    mov CL,9h
    sar AX,CL
    inc AX
    mov word ptr [BP + -6h],AX
    jmp LAB_1000_54e3
LAB_1000_54e0:
    dec word ptr [BP + -6h]
LAB_1000_54e3:
    cmp word ptr [BP + -6h],0h
    jl LAB_1000_5528
    mov SI,word ptr [BP + -6h]
    shl SI,1h
    mov AX,word ptr [BP + -4h]
    cmp word ptr [SI + offset word_37348],AX
    jg LAB_1000_5526
    mov AX,word ptr [SI + offset word_3734A]
    sub AX,word ptr [SI + offset word_37348]
    mov word ptr [BP + -8h],AX
    cwd
    push DX
    push AX
    mov AX,word ptr [BP + -4h]
    sub AX,word ptr [SI + offset word_37348]
    cwd
    mov DH,DL
    mov DL,AH
    mov AH,AL
    sub AL,AL
    push DX
    push AX
    call __aNldiv
    mov CH,byte ptr [BP + -6h]
    sub CL,CL
    add AX,CX
    mov word ptr [BP + -2h],AX
    jmp LAB_1000_5528
LAB_1000_5526:
    jmp LAB_1000_54e0
LAB_1000_5528:
    cmp word ptr [BP + 4h],0h
    jge LAB_1000_5536
    mov AX,word ptr [BP + -2h]
    neg AX
    mov word ptr [BP + -2h],AX
LAB_1000_5536:
    mov AX,word ptr [BP + -2h]
    jmp LAB_1000_553b
LAB_1000_553b:
    pop SI
    mov SP,BP
    pop BP
    ret
_sub_154B7 endp
; ------------------------------seg000:0x553f------------------------------
; ------------------------------seg000:0x5557------------------------------
sub_15557 proc near
    push BP
    mov BP,SP
    sub SP,4h
    push word ptr [BP + 4h]
    call _abs
    add SP,2h
    mov word ptr [BP + 4h],AX
    db 3Dh, 04h, 00h ; cmp AX,4h (force imm16 encoding)
    jge LAB_1000_5573
    mov AX,1h
    jmp LAB_1000_55a7
LAB_1000_5573:
    mov AX,word ptr [BP + 4h]
    sar AX,1h
    sar AX,1h
    mov word ptr [BP + -4h],AX
LAB_1000_557d:
    mov AX,word ptr [BP + 4h]
    cwd
    mov CX,word ptr [BP + -4h]
    idiv CX
    mov word ptr [BP + -2h],AX
    mov AX,CX
    add AX,word ptr [BP + -2h]
    sar AX,1h
    mov word ptr [BP + -4h],AX
    sub AX,word ptr [BP + -2h]
    push AX
    call _abs
    add SP,2h
    db 3Dh, 01h, 00h ; cmp AX,1h (force imm16 encoding)
    jg LAB_1000_557d
    mov AX,word ptr [BP + -4h]
    jmp LAB_1000_55a7
LAB_1000_55a7:
    mov SP,BP
    pop BP
    ret
sub_15557 endp
; ------------------------------seg000:0x55aa------------------------------
; ------------------------------seg000:0x5fdb------------------------------
_sub_15FDB proc near
    push BP
    mov BP,SP
    cmp word ptr [_word_330C2],0h
    jnz LAB_1000_5fe8
    jmp LAB_1000_6068
LAB_1000_5fe8:
    sub AX,AX
    push AX
    call _sub_19E44
    add SP,2h
    mov AX,0c4h
    push AX
    mov AX,0afh
    push AX
    mov AX,0deh
    push AX
    mov AX,7fh
    push AX
    mov AX,0d4h
    push AX
    call _sub_19E5D
    add SP,0ah
    mov AX,0ch
    push AX
    call _sub_19E44
    add SP,2h
    mov AX,0afh
    push AX
    mov AX,0deh
    push AX
    mov AX,word ptr [_var_552]
    cwd
    mov CX,3h
    idiv CX
    db 2Dh, 0AFh, 00h ; sub AX,0afh (force imm16 encoding)
    neg AX
    push AX
    mov AX,0d4h
    push AX
    call _sub_19E5D
    add SP,8h
    cmp word ptr [_var_552],64h
    jle LAB_1000_6068
    mov AX,0eh
    push AX
    call _sub_19E44
    add SP,2h
    mov AX,8eh
    push AX
    mov AX,0deh
    push AX
    mov AX,word ptr [_var_552]
    cwd
    mov CX,3h
    idiv CX
    db 2Dh, 0AFh, 00h ; sub AX,0afh (force imm16 encoding)
    neg AX
    push AX
    mov AX,0d4h
    push AX
    call _sub_19E5D
    add SP,8h
LAB_1000_6068:
    mov SP,BP
    pop BP
    ret
_sub_15FDB endp
; ------------------------------seg000:0x606b------------------------------
; ------------------------------seg000:0x606c------------------------------
sub_1606C proc near
    push BP
    mov BP,SP
    cmp word ptr [_word_330C2],0h
    jnz LAB_1000_6078
    jmp LAB_1000_60cf
LAB_1000_6078:
    sub AX,AX
    push AX
    call _sub_19E44
    add SP,2h
    mov AX,98h
    push AX
    mov AX,0ah
    push AX
    mov AX,6dh
    push AX
    mov AX,5h
    push AX
    call _sub_19E5D
    add SP,8h
    cmp word ptr [word_33098],7d0h
    jle LAB_1000_60a4
    mov AX,2h
    jmp LAB_1000_60a7
LAB_1000_60a4:
    mov AX,0eh
LAB_1000_60a7:
    push AX
    call _sub_19E44
    add SP,2h
    mov AX,98h
    push AX
    mov AX,0ah
    push AX
    mov AX,word ptr [word_33098]
    cwd
    mov CX,0fah
    idiv CX
    db 2Dh, 98h, 00h ; sub AX,98h (force imm16 encoding)
    neg AX
    push AX
    mov AX,5h
    push AX
    call _sub_19E5D
    add SP,8h
LAB_1000_60cf:
    mov SP,BP
    pop BP
    ret
sub_1606C endp
; ------------------------------seg000:0x60d2------------------------------
; ------------------------------seg000:0x60d3------------------------------
_sub_160D3 proc near
    push BP
    mov BP,SP
LAB_1000_60d6:
    mov BX,word ptr [BP + 4h]
    cmp word ptr [BX],-1h
    jz LAB_1000_6137
    add word ptr [BP + 4h],2h
    mov BX,word ptr [BX]
    mov AL,byte ptr [BX + offset byte_3419C]
    sub AH,AH
    push AX
    call far ptr _gfx_jump_21
    add SP,2h
    call far ptr sub_2171A
    add word ptr [BP + 4h],4h
LAB_1000_60fc:
    mov BX,word ptr [BP + 4h]
    cmp word ptr [BX],-1h
    jz LAB_1000_612c
    mov AX,word ptr [BX + -4h]
    mov word ptr [_var_351],AX
    mov AX,word ptr [BX + -2h]
    mov word ptr [_var_353],AX
    add word ptr [BP + 4h],2h
    mov AX,word ptr [BX]
    mov word ptr [_var_352],AX
    mov BX,word ptr [BP + 4h]
    add word ptr [BP + 4h],2h
    mov AX,word ptr [BX]
    mov word ptr [_var_354],AX
    call far ptr sub_2189C
    jmp LAB_1000_60fc
LAB_1000_612c:
    call far ptr sub_21704
    add word ptr [BP + 4h],2h
    jmp LAB_1000_60d6
LAB_1000_6137:
    mov SP,BP
    pop BP
    ret
_sub_160D3 endp
; ------------------------------seg000:0x613a------------------------------
; ------------------------------seg000:0x613b------------------------------
sub_1613B proc near
    push BP
    mov BP,SP
    sub SP,2h
    call far ptr audio_jump_69
    mov AX,word ptr [_var_383]
    mov word ptr [BP + -2h],AX
LAB_1000_614c:
    call _kbhit
    or AX,AX
    jnz LAB_1000_6155
    jmp LAB_1000_614c
LAB_1000_6155:
    sub AX,AX
    push AX
    call __bios_keybrd
    add SP,2h
    cmp AX,1900h
    jnz LAB_1000_6165
    jmp LAB_1000_614c
LAB_1000_6165:
    call sub_1DA8D
    mov AX,word ptr [BP + -2h]
    mov word ptr [_var_383],AX
    mov SP,BP
    pop BP
    ret
sub_1613B endp
; ------------------------------seg000:0x6171------------------------------
; ------------------------------seg000:0x6172------------------------------
sub_16172 proc near
    push BP
    mov BP,SP
    sub SP,0ch
    push DI
    push SI
    cmp word ptr [word_336F8],0h
    jz LAB_1000_618a
    mov AX,word ptr [word_336E4]
    cmp word ptr [word_3C03E],AX
    jz LAB_1000_61ae
LAB_1000_618a:
    cmp word ptr [_word_330C2],0h
    jz LAB_1000_61ae
    cmp word ptr [word_336F8],0h
    jnz LAB_1000_61ae
    cmp word ptr [_word_3C09A],0h
    jnz LAB_1000_61ae
    call sub_1A962
    mov word ptr [word_3BF3C],0h
    mov word ptr [word_3BF3E],100h
LAB_1000_61ae:
    mov word ptr [BP + -0ah],0h
    jmp LAB_1000_61c5
    db 90h
LAB_1000_61b6:
    mov BX,word ptr [BP + -0ah]
    mov CL,4h
    shl BX,CL
    and byte ptr [BX + offset _stru_3AA5E + 6],0fdh
LAB_1000_61c2:
    inc word ptr [BP + -0ah]
LAB_1000_61c5:
    mov AX,word ptr [_word_38FFA]
    cmp word ptr [BP + -0ah],AX
    jl LAB_1000_61d0
    jmp LAB_1000_627c
LAB_1000_61d0:
    mov SI,word ptr [BP + -0ah]
    mov CL,4h
    shl SI,CL
    cmp word ptr [SI + offset _stru_3AA5E + 4],0h
    jz LAB_1000_61b6
    test byte ptr [SI + offset _stru_3AA5E + 6],80h
    jnz LAB_1000_61b6
    mov AX,word ptr [BP + -0ah]
    mov BX,word ptr [_word_336E8]
    mov CL,0ah
    sar BX,CL
    imul BX
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    add AX,CX
    and AL,7h
    cmp AL,7h
    jbe LAB_1000_6211
    cmp word ptr [SI + offset _stru_3AA5E + 8],0h
    jnz LAB_1000_6211
    test word ptr [SI + offset _stru_3AA5E + 6],100h
    jz LAB_1000_61b6
LAB_1000_6211:
    mov SI,word ptr [BP + -0ah]
    mov CL,4h
    shl SI,CL
    dec word ptr [SI + offset _stru_3AA5E + 10]
    cmp word ptr [SI + offset _stru_3AA5E + 10],0h
    jg LAB_1000_6249
    mov AX,word ptr [BP + -0ah]
    cwd
    sub AX,DX
    sar AX,1h
    mov CX,AX
    mov AH,byte ptr [_word_330C4]
    sub AL,AL
    cwd
    mov BX,word ptr [SI + offset _stru_3AA5E + 8]
    mov DI,CX
    mov CL,3h
    sar BX,CL
    add BX,20h
    idiv BX
    add AX,DI
    mov word ptr [SI + offset _stru_3AA5E + 10],AX
LAB_1000_6249:
    mov BX,word ptr [BP + -0ah]
    mov CL,4h
    shl BX,CL
    cmp word ptr [BX + offset _stru_3AA5E + 10],4h
    jz LAB_1000_625a
    jmp LAB_1000_61c2
LAB_1000_625a:
    cmp word ptr [word_336F8],0h
    jl LAB_1000_6264
    jmp LAB_1000_61c2
LAB_1000_6264:
    push word ptr [BP + -0ah]
    call sub_16346
    add SP,2h
    mov BX,word ptr [BP + -0ah]
    mov CL,4h
    shl BX,CL
    or byte ptr [BX + offset _stru_3AA5E + 6],2h
    jmp LAB_1000_61c2
LAB_1000_627c:
    les BX,dword ptr [_commData]
    cmp word ptr ES:[BX + 78h],0h
    jnz LAB_1000_628d
    mov word ptr [word_38F72],0h
LAB_1000_628d:
    cmp word ptr [_word_3C09A],0h
    jz LAB_1000_6297
    jmp LAB_1000_633c
LAB_1000_6297:
    cmp word ptr [word_336F8],0h
    jg LAB_1000_62a1
    jmp LAB_1000_633c
LAB_1000_62a1:
    cmp word ptr [_word_330C2],0h
    jnz LAB_1000_62ab
    jmp LAB_1000_633c
LAB_1000_62ab:
    cmp word ptr [word_3BE7E],1h
    jg LAB_1000_62b5
    jmp LAB_1000_633c
LAB_1000_62b5:
    cmp word ptr [_word_38FDC],0h
    jz LAB_1000_62fc
    cmp word ptr ES:[BX + 78h],0h
    jz LAB_1000_62fc
    call sub_1A9BC
    mov AX,word ptr [_word_330C4]
    cwd
    push DX
    push AX
    mov AX,word ptr [word_3BE7E]
    cwd
    push DX
    push AX
    push word ptr [_word_330C4]
    mov AX,1h
    push AX
    mov AX,word ptr [_word_330C4]
    sub AX,word ptr [word_336F8]
    push AX
    call _sub_1CF64
    add SP,6h
    cwd
    push DX
    push AX
    call __aNlmul
    push DX
    push AX
    call __aNldiv
    mov CL,6h
    shl AX,CL
    mov word ptr [BP + -4h],AX
    jmp LAB_1000_630c
LAB_1000_62fc:
    mov AX,word ptr [word_3BE7E]
    mov CL,6h
    shl AX,CL
    mov word ptr [BP + -4h],AX
    mov word ptr [word_3BE7E],0h
LAB_1000_630c:
    cmp word ptr [word_3BE96],0h
    jl LAB_1000_633c
    mov SI,word ptr [word_3BE96]
    mov CL,4h
    shl SI,CL
    push word ptr [word_3BF3E]
    push word ptr [word_3BF3C]
    push word ptr [word_3C6AA]
    push word ptr [word_38F72]
    push word ptr [BP + -4h]
    push word ptr [SI + offset _stru_3AA5E + 2]
    push word ptr [SI + offset _stru_3AA5E]
    call sub_19ADB
    add SP,0eh
LAB_1000_633c:
    dec word ptr [word_336F8]
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
sub_16172 endp
; ------------------------------seg000:0x6345------------------------------
; ------------------------------seg000:0x6346------------------------------
sub_16346 proc near
    push BP
    mov BP,SP
    sub SP,2ah
    push DI
    push SI
    mov SI,word ptr [BP + 4h]
    mov CL,4h
    shl SI,CL
    mov AX,word ptr [SI + offset _stru_3AA5E + 4]
    mov word ptr [BP + -22h],AX
    lea AX,[BP + -1eh]
    push AX
    lea AX,[BP + -16h]
    push AX
    push word ptr [BP + -22h]
    sub AX,AX
    push AX
    push word ptr [SI + offset _stru_3AA5E + 2]
    push word ptr [SI + offset _stru_3AA5E]
    call sub_1660E
    add SP,0ch
    mov word ptr [BP + -2ah],AX
    mov word ptr [word_336FA],0h
    or AX,AX
    jg LAB_1000_6388
    jmp LAB_1000_6423
LAB_1000_6388:
    mov word ptr [BP + -20h],AX
    db 3Dh, 63h, 00h ; cmp AX,63h (force imm16 encoding)
    jle LAB_1000_6395
    mov word ptr [BP + -20h],63h
LAB_1000_6395:
    mov word ptr [word_336FA],4h
    mov AX,word ptr [BP + -2ah]
    add AX,word ptr [word_336E4]
    db 3Dh, 32h, 00h ; cmp AX,32h (force imm16 encoding)
    jle LAB_1000_63ad
    mov word ptr [word_336FA],0ch
LAB_1000_63ad:
    mov AX,word ptr [BP + -2ah]
    add AX,word ptr [word_336E4]
    db 3Dh, 64h, 00h ; cmp AX,64h (force imm16 encoding)
    jle LAB_1000_63bf
    mov word ptr [word_336FA],0eh
LAB_1000_63bf:
    mov AX,word ptr [BP + -2ah]
    mov word ptr [word_3BE7E],AX
    mov AX,word ptr [_word_330C4]
    mov word ptr [word_336F8],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [word_3BE96],AX
    mov BX,word ptr [BP + -22h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AX,word ptr [BX + offset aNone + 12]
    db 25h, 01h, 00h ; and AX,1h (force imm16 encoding)
    mov word ptr [word_3C6AA],AX
    mov BX,word ptr [BP + 4h]
    mov CL,4h
    shl BX,CL
    cmp word ptr [BX + offset _stru_3AA5E + 8],0h
    jz LAB_1000_640b
    mov SI,word ptr [BP + -16h]
    mov CL,8h
    sar SI,CL
    lea AX,[SI + -20h]
    mov word ptr [word_3BF3C],AX
    lea AX,[SI + 20h]
    mov word ptr [word_3BF3E],AX
LAB_1000_640b:
    mov AX,word ptr [word_336FA]
    mov word ptr [word_38F72],AX
    mov SI,word ptr [BP + 4h]
    mov CL,4h
    shl SI,CL
    add SI,81b4h
    test byte ptr [SI],4h
    jnz LAB_1000_6423
    or byte ptr [SI],CL
LAB_1000_6423:
    mov AX,word ptr [BP + -1eh]
    cmp word ptr [BP + -2ah],AX
    ja LAB_1000_642e
    jmp LAB_1000_65ee
LAB_1000_642e:
    mov SI,word ptr [BP + 4h]
    mov CL,4h
    shl SI,CL
    add SI,81b6h
    mov AX,word ptr [word_330BA]
    add AX,word ptr [word_330B8]
    mov CL,5h
    shl AX,CL
    db 05h, 20h, 00h ; add AX,20h (force imm16 encoding)
    add word ptr [SI],AX
    cmp word ptr [SI],0ffh
    jle LAB_1000_6453
    mov word ptr [SI],0ffh
LAB_1000_6453:
    mov SI,word ptr [BP + 4h]
    mov CL,4h
    shl SI,CL
    test word ptr [SI + offset _stru_3AA5E + 6],100h
    jnz LAB_1000_6473
    cmp word ptr [word_333DA],0h
    jnz LAB_1000_6473
    cmp word ptr [SI + offset _stru_3AA5E + 8],7fh
    jle LAB_1000_6473
    call sub_166BE
LAB_1000_6473:
    mov AX,word ptr [word_330B8]
    cmp word ptr [word_3A946],AX
    jle LAB_1000_647f
    jmp LAB_1000_65dc
LAB_1000_647f:
    mov SI,word ptr [BP + 4h]
    mov CL,4h
    shl SI,CL
    cmp word ptr [SI + offset _stru_3AA5E + 8],0c0h
    jg LAB_1000_6491
    jmp LAB_1000_65dc
LAB_1000_6491:
    cmp word ptr [BP + -22h],15h
    jnz LAB_1000_649a
    jmp LAB_1000_65dc
LAB_1000_649a:
    cmp word ptr [word_38FEE],500h
    jg LAB_1000_64a5
    jmp LAB_1000_65dc
LAB_1000_64a5:
    mov CX,AX
    shl AX,1h
    add AX,CX
    db 2Dh, 14h, 00h ; sub AX,14h (force imm16 encoding)
    neg AX
    cmp AX,word ptr [BP + -1eh]
    jc LAB_1000_64b8
    jmp LAB_1000_65dc
LAB_1000_64b8:
    inc word ptr [word_3C09C]
    cmp word ptr [SI + offset _stru_3AA5E + 8],0fah
    jge LAB_1000_64c7
    jmp LAB_1000_65dc
LAB_1000_64c7:
    or CX,CX
    jz LAB_1000_64d6
    mov AX,word ptr [BP + 4h]
    cwd
    idiv CX
    mov AX,DX
    jmp LAB_1000_64d8
    db 90h
LAB_1000_64d6:
    sub AX,AX
LAB_1000_64d8:
    mov word ptr [BP + -24h],AX
    mov AX,18h
    imul word ptr [BP + -24h]
    mov DI,AX
    cmp word ptr [DI + offset _stru_335C4 + 14],0h
    jz LAB_1000_64ed
    jmp LAB_1000_65dc
LAB_1000_64ed:
    mov AX,12h
    imul word ptr [BP + -22h]
    mov BX,AX
    mov AX,word ptr [BP + -1eh]
    cmp word ptr [BX + offset _sams + 8],AX
    ja LAB_1000_6501
    jmp LAB_1000_65dc
LAB_1000_6501:
    mov AX,word ptr [SI + offset _stru_3AA5E]
    db 05h, 08h, 00h ; add AX,8h (force imm16 encoding)
    mov word ptr [DI + offset _stru_335C4],AX
    mov AX,18h
    imul word ptr [BP + -24h]
    mov SI,AX
    mov BX,word ptr [BP + 4h]
    mov CL,4h
    shl BX,CL
    mov AX,word ptr [BX + offset _stru_3AA5E + 2]
    mov word ptr [SI + offset _stru_335C4 + 2],AX
    mov word ptr [SI + offset _stru_335C4 + 4],0h
    mov word ptr [SI + offset _stru_335C4 + 6],1h
    mov AX,word ptr [BP + -16h]
    mov word ptr [SI + offset _stru_335C4 + 8],AX
    mov word ptr [SI + offset _stru_335C4 + 10],4000h
    mov AX,12h
    imul word ptr [BP + -22h]
    mov DI,AX
    mov AX,word ptr [DI + offset _sams + 10]
    mov CL,6h
    sar AX,CL
    cwd
    push DX
    push AX
    mov AX,word ptr [_word_330C4]
    cwd
    push DX
    push AX
    mov AX,word ptr [DI + offset _sams + 8]
    cwd
    mov CL,3h
LAB_1000_655c:
    shl AX,1h
    rcl DX,1h
    dec CL
    jnz LAB_1000_655c
    push DX
    push AX
    call __aNlmul
    push DX
    push AX
    call __aNldiv
    mov word ptr [SI + offset _stru_335C4 + 14],AX
    mov AX,word ptr [BP + -22h]
    mov word ptr [SI + offset _stru_335C4 + 16],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [SI + offset _stru_335C4 + 22],AX
    push word ptr [BP + 4h]
    call placeString
    add SP,2h
    mov AX,offset aFiring
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,12h
    imul word ptr [BP + -22h]
    add AX,528h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    mov AX,2h
    push AX
    mov AX,6h
    push AX
    call makeSound
    add SP,4h
    mov AX,2h
    push AX
    mov AX,word ptr [BP + 4h]
    db 05h, 40h, 00h ; add AX,40h (force imm16 encoding)
    push AX
    call sub_11BC3
    add SP,4h
    les BX,dword ptr [_commData]
    inc word ptr ES:[BX + 2ch]
LAB_1000_65dc:
    mov BX,word ptr [BP + 4h]
    mov CL,4h
    shl BX,CL
    or byte ptr [BX + offset _stru_3AA5E + 6],10h
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
LAB_1000_65ee:
    mov SI,word ptr [BP + 4h]
    mov CL,4h
    shl SI,CL
    and byte ptr [SI + offset _stru_3AA5E + 6],0efh
    sub word ptr [SI + offset _stru_3AA5E + 8],10h
    jns LAB_1000_6607
    mov word ptr [SI + offset _stru_3AA5E + 8],0h
LAB_1000_6607:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
    nop
sub_16346 endp
; ------------------------------seg000:0x660c------------------------------
; ------------------------------seg000:0x660e------------------------------
sub_1660E proc near
    push BP
    mov BP,SP
    sub SP,0eh
    push SI
    cmp word ptr [BP + 0ah],0h
    jz LAB_1000_6621
    cmp word ptr [BP + 0ah],-1h
    jnz LAB_1000_6628
LAB_1000_6621:
    sub AX,AX
    pop SI
    mov SP,BP
    pop BP
    ret
LAB_1000_6628:
    mov AX,word ptr [_word_3BEC0]
    sub AX,word ptr [BP + 4h]
    mov word ptr [BP + -0ah],AX
    mov AX,word ptr [_word_3BED0]
    sub AX,word ptr [BP + 6h]
    mov word ptr [BP + -0ch],AX
    push AX
    push word ptr [BP + -0ah]
    call _sub_1CFA6
    add SP,4h
    mov CL,6h
    shr AX,CL
    mov word ptr [BP + -8h],AX
    mov AX,word ptr [BP + -0ch]
    neg AX
    push AX
    push word ptr [BP + -0ah]
    call _sub_1D008
    add SP,4h
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [BP + 0ah]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AX,word ptr [SI + offset aNone + 10]
    mov CX,word ptr [word_330B8]
    shl CX,1h
    add AX,CX
    db 05h, 03h, 00h ; add AX,3h (force imm16 encoding)
    imul word ptr [SI + offset aNone + 8]
    cwd
    xor AX,DX
    sub AX,DX
    mov CX,4h
    sar AX,CL
    xor AX,DX
    sub AX,DX
    mov word ptr [BP + -0eh],AX
    mov BX,word ptr [_var_547]
    mov CL,6h
    shr BX,CL
    add BX,40h
    mul BX
    mov CL,7h
    shr AX,CL
    mov word ptr [BP + -0eh],AX
    mov BX,word ptr [BP + 0ch]
    mov AX,word ptr [BP + -6h]
    mov word ptr [BX],AX
    mov BX,word ptr [BP + 0eh]
    mov AX,word ptr [BP + -8h]
    mov word ptr [BX],AX
    mov AX,word ptr [BP + -0eh]
    pop SI
    mov SP,BP
    pop BP
    ret
sub_1660E endp
; ------------------------------seg000:0x66bd------------------------------
; ------------------------------seg000:0x66be------------------------------
sub_166BE proc near
    push BP
    mov BP,SP
    sub SP,2h
    push SI
    mov AX,word ptr [word_3B0AC]
    mov word ptr [word_336F0],AX
    cmp word ptr [word_333DA],0h
    jz LAB_1000_66de
    mov AX,word ptr [word_333D2]
    mov word ptr [word_3B4D8],AX
    mov AX,word ptr [word_333D4]
    jmp LAB_1000_66e7
    db 90h
LAB_1000_66de:
    mov AX,word ptr [_word_3BEC0]
    mov word ptr [word_3B4D8],AX
    mov AX,word ptr [_word_3BED0]
LAB_1000_66e7:
    mov word ptr [word_3B4E0],AX
    mov AX,word ptr [_var_547]
    mov word ptr [word_3B5D6],AX
    mov AX,word ptr [_var_542]
    mov word ptr [word_38FEC],AX
    mov word ptr [word_3BED4],0ffh
    mov word ptr [BP + -2h],0h
    jmp LAB_1000_6734
    db 90h
LAB_1000_6704:
    mov SI,word ptr [BP + -2h]
    mov CL,4h
    shl SI,CL
    cmp word ptr [SI + offset _stru_3AA5E + 4],0h
    jz LAB_1000_6731
    mov AX,0ffh
    push AX
    mov AX,word ptr [word_330B8]
    add AX,word ptr [word_330BA]
    shl AX,CL
    db 2Dh, 10h, 00h ; sub AX,10h (force imm16 encoding)
    push AX
    push word ptr [SI + offset _stru_3AA5E + 8]
    call _sub_1CF64
    add SP,6h
    mov word ptr [SI + offset _stru_3AA5E + 8],AX
LAB_1000_6731:
    inc word ptr [BP + -2h]
LAB_1000_6734:
    mov AX,word ptr [_word_3C69E]
    cmp word ptr [BP + -2h],AX
    jl LAB_1000_6704
    pop SI
    mov SP,BP
    pop BP
    ret
    nop
sub_166BE endp
; ------------------------------seg000:0x6740------------------------------
; ------------------------------seg000:0x6742------------------------------
sub_16742 proc near
    push BP
    mov BP,SP
    sub SP,6h
    push SI
    mov word ptr [BP + -6h],0h
    mov word ptr [BP + -4h],0h
    jmp LAB_1000_679b
    db 90h
LAB_1000_6756:
    mov BX,word ptr [BP + -4h]
    mov CL,4h
    shl BX,CL
    mov AX,word ptr [BX + offset _stru_3AA5E + 4]
    mov word ptr [BP + -2h],AX
    or AX,AX
    jz LAB_1000_6798
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov CX,word ptr [word_330B8]
    add CX,2h
    mov AX,word ptr [SI + offset aNone + 8]
    imul word ptr [SI + offset aNone + 10]
    imul CX
    cwd
    xor AX,DX
    sub AX,DX
    mov CX,6h
    sar AX,CL
    xor AX,DX
    sub AX,DX
    add word ptr [BP + -6h],AX
LAB_1000_6798:
    inc word ptr [BP + -4h]
LAB_1000_679b:
    mov AX,word ptr [_word_38FFA]
    cmp word ptr [BP + -4h],AX
    jl LAB_1000_6756
    mov CX,64h
    mov AX,word ptr [BP + -6h]
    cwd
    idiv CX
    mov word ptr [BP + -6h],AX
    pop SI
    mov SP,BP
    pop BP
    ret
sub_16742 endp
; ------------------------------seg000:0x67b3------------------------------
; ------------------------------seg000:0x67b4------------------------------
sub_167B4 proc near
    push BP
    mov BP,SP
    sub SP,40h
    push DI
    push SI
    test byte ptr [_word_336E8],1h
    jnz LAB_1000_67dd
    cmp word ptr [word_336F6],-1h
    jnz LAB_1000_67dd
    mov BX,word ptr [_word_336E8]
    sar BX,1h
    and BX,7h
    mov CL,3h
    shl BX,CL
    mov word ptr [BX + offset stru_33402],0h
LAB_1000_67dd:
    mov BX,word ptr [_word_336E8]
    sar BX,1h
    sar BX,1h
    and BX,3h
    add BX,word ptr [word_3AFA4]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    shl BX,1h
    mov word ptr [BX + offset word_3C5AC],0h
    mov AX,word ptr [_var_668]
    mov word ptr [word_3A946],AX
    mov word ptr [_var_668],0h
    mov word ptr [BP + -22h],0h
    jmp LAB_1000_74ee
LAB_1000_6810:
    mov word ptr [BP + -1eh],3h
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    test word ptr [BX + offset _stru_3B208 + 18],100h
    jz LAB_1000_68a4
    cmp word ptr [_word_336FC],-1h
    jz LAB_1000_68a4
    mov AX,24h
    imul word ptr [_word_336FC]
    mov SI,AX
    push word ptr [SI + offset _stru_3B208 + 20]
    mov AX,word ptr [BP + -22h]
    db 25h, 07h, 00h ; and AX,7h (force imm16 encoding)
    mov CL,0bh
    shl AX,CL
    add AX,word ptr [SI + offset _stru_3B208 + 10]
    sub AX,1800h
    push AX
    call _sub_1D178
    add SP,4h
    add AX,word ptr [SI + offset word_3B204]
    mov word ptr [BP + -30h],AX
    mov AX,24h
    imul word ptr [_word_336FC]
    mov SI,AX
    push word ptr [SI + offset _stru_3B208 + 20]
    mov AX,word ptr [BP + -22h]
    db 25h, 07h, 00h ; and AX,7h (force imm16 encoding)
    mov CL,0bh
    shl AX,CL
    add AX,word ptr [SI + offset _stru_3B208 + 10]
    sub AX,1800h
    push AX
    call _sub_1D190
    add SP,4h
    mov CX,word ptr [SI + offset word_3B206]
    sub CX,AX
    mov word ptr [BP + -36h],CX
    mov AX,24h
    imul word ptr [_word_336FC]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_3B208]
    mov DX,word ptr [BP + -22h]
    and DX,7h
    mov CL,6h
    shl DX,CL
    add AX,DX
    jmp LAB_1000_69f7
    db 90h
    db 90h
LAB_1000_68a4:
    mov AL,byte ptr [BP + -22h]
    mov CL,3h
    shl AL,CL
    add AL,byte ptr [word_38FE0]
    test AL,0bfh
    jz LAB_1000_68b6
    jmp LAB_1000_69bf
LAB_1000_68b6:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    test byte ptr [SI + offset _stru_3B208 + 18],40h
    jz LAB_1000_68c8
    jmp LAB_1000_69bf
LAB_1000_68c8:
    mov word ptr [BP + -1ch],7fffh
    mov AX,word ptr [SI + offset word_3B206]
    sub AX,word ptr [_word_3BED0]
    push AX
    mov AX,word ptr [_word_3BEC0]
    sub AX,word ptr [SI + offset word_3B204]
    push AX
    call _sub_1D008
    add SP,4h
    mov word ptr [BP + -8h],AX
    mov word ptr [BP + -26h],0h
    jmp LAB_1000_68f1
LAB_1000_68ee:
    inc word ptr [BP + -26h]
LAB_1000_68f1:
    cmp word ptr [BP + -26h],8h
    jl LAB_1000_68fa
    jmp LAB_1000_697e
LAB_1000_68fa:
    push word ptr [_word_3BED2]
    call randlmul
    add SP,2h
    inc AX
    mov word ptr [BP + -10h],AX
    mov SI,AX
    mov CL,4h
    shl SI,CL
    test word ptr [SI + offset _stru_3AA5E + 6],400h
    jnz LAB_1000_68ee
    mov AX,24h
    imul word ptr [BP + -22h]
    mov DI,AX
    mov AX,word ptr [DI + offset word_3B206]
    sub AX,word ptr [SI + offset _stru_3AA5E + 2]
    push AX
    mov AX,word ptr [SI + offset _stru_3AA5E]
    sub AX,word ptr [DI + offset word_3B204]
    push AX
    call _sub_1D008
    add SP,4h
    mov word ptr [BP + -4h],AX
    mov AX,word ptr [BP + -8h]
    sub AX,word ptr [BP + -4h]
    push AX
    call _abs
    add SP,2h
    cmp AX,word ptr [BP + -1ch]
    jge LAB_1000_68ee
    mov AX,word ptr [BP + -8h]
    sub AX,word ptr [BP + -4h]
    push AX
    call _abs
    add SP,2h
    mov word ptr [BP + -1ch],AX
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    mov AX,word ptr [BP + -10h]
    mov word ptr [BX + offset _unk_3B202],AX
    mov AX,word ptr [word_330B8]
    mov CL,0ch
    shl AX,CL
    sub AX,4000h
    neg AX
    cmp AX,word ptr [BP + -1ch]
    jg LAB_1000_697e
    jmp LAB_1000_68ee
LAB_1000_697e:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    mov AX,word ptr [_word_3BED0]
    sub AX,word ptr [SI + offset word_3B206]
    push AX
    mov AX,word ptr [_word_3BEC0]
    sub AX,word ptr [SI + offset word_3B204]
    push AX
    call _sub_1CFA6
    add SP,4h
    mov CL,6h
    shr AX,CL
    cmp AX,15eh
    jbe LAB_1000_69bf
    cmp word ptr [BP + -22h],0h
    jz LAB_1000_69bf
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    and word ptr [SI + offset _stru_3B208 + 18],1c1h
    mov word ptr [SI + offset _stru_3B208 + 22],0h
LAB_1000_69bf:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    mov AX,word ptr [BX + offset _unk_3B202]
    mov word ptr [BP + -10h],AX
    mov SI,AX
    mov CL,4h
    shl SI,CL
    mov AX,word ptr [SI + offset _stru_3AA5E]
    mov word ptr [BP + -30h],AX
    mov AX,word ptr [SI + offset _stru_3AA5E + 2]
    mov word ptr [BP + -36h],AX
    mov AX,4e20h
    push AX
    mov AX,1388h
    push AX
    mov AX,word ptr [_var_547]
    add AX,3e8h
    push AX
LAB_1000_69f1:
    call _sub_1CF64
    add SP,6h
LAB_1000_69f7:
    mov word ptr [BP + -3ah],AX
    jmp LAB_1000_6a96
    db 90h
LAB_1000_69fe:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    mov DI,word ptr [SI + offset _unk_3B202]
    mov CL,4h
    shl DI,CL
    mov AX,word ptr [DI + offset _stru_3AA5E]
    mov word ptr [BP + -30h],AX
    test word ptr [SI + offset _stru_3B208 + 18],200h
    jz LAB_1000_6a56
    mov AX,word ptr [SI + offset word_3B204]
    sub AX,word ptr [BP + -30h]
    mov word ptr [BP + -3ah],AX
    mov AX,word ptr [DI + offset _stru_3AA5E + 2]
    mov word ptr [BP + -36h],AX
    mov AX,word ptr [BP + -3ah]
    shl AX,1h
    sub word ptr [BP + -30h],AX
    push word ptr [BP + -3ah]
    call _abs
    add SP,2h
    mov CX,word ptr [DI + offset _stru_3AA5E + 6]
    add CX,AX
    test CX,200h
    jz LAB_1000_6a50
    mov AX,8ch
    jmp LAB_1000_6a8e
LAB_1000_6a50:
    mov AX,0ch
    jmp LAB_1000_6a8e
    db 90h
LAB_1000_6a56:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    mov AX,500h
    imul word ptr [word_3AFA8]
    mov BX,word ptr [SI + offset _unk_3B202]
    mov CL,4h
    shl BX,CL
    mov CX,word ptr [BX + offset _stru_3AA5E + 2]
    add CX,AX
    mov word ptr [BP + -36h],CX
    mov AX,word ptr [SI + offset word_3B206]
    sub AX,CX
    push AX
    mov AX,word ptr [SI + offset word_3B204]
    sub AX,word ptr [BP + -30h]
    push AX
    call _sub_1CFA6
    add SP,4h
    add AX,7d0h
LAB_1000_6a8e:
    mov word ptr [BP + -3ah],AX
    mov word ptr [BP + -1eh],2h
LAB_1000_6a96:
    cmp word ptr [BP + -1eh],3h
    jnz LAB_1000_6abe
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    test byte ptr [SI + offset _stru_3B208 + 18],8h
    jz LAB_1000_6abe
    mov AX,word ptr [_word_3BEC0]
    mov word ptr [BP + -30h],AX
    mov AX,word ptr [_word_3BED0]
    mov word ptr [BP + -36h],AX
    mov AX,word ptr [SI + offset _stru_3B208]
    mov word ptr [BP + -3ah],AX
LAB_1000_6abe:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    mov AX,word ptr [BP + -30h]
    sub AX,word ptr [SI + offset word_3B204]
    mov word ptr [BP + -2eh],AX
    mov AX,word ptr [BP + -36h]
    sub AX,word ptr [SI + offset word_3B206]
    mov word ptr [BP + -34h],AX
    neg AX
    push AX
    push word ptr [BP + -2eh]
    call _sub_1D008
    add SP,4h
    mov word ptr [BP + -0ch],AX
    push word ptr [BP + -34h]
    push word ptr [BP + -2eh]
    call _sub_1CFA6
    add SP,4h
    mov word ptr [BP + -1ah],AX
    push AX
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    mov AX,word ptr [BP + -3ah]
    sub AX,word ptr [BX + offset _stru_3B208]
    mov CL,5h
    sar AX,CL
    push AX
    call _sub_1D008
    add SP,4h
    mov word ptr [BP + -2h],AX
    mov AX,1000h
    push AX
    mov AX,0e000h
    push AX
    push word ptr [BP + -2h]
    call _sub_1CF64
    add SP,6h
    mov word ptr [BP + -2h],AX
    cmp word ptr [BP + -1eh],1h
    jz LAB_1000_6b33
    jmp LAB_1000_6dd6
LAB_1000_6b33:
    cmp word ptr [BP + -1ah],600h
    jc LAB_1000_6b3d
    jmp LAB_1000_6dd6
LAB_1000_6b3d:
    inc word ptr [_var_668]
    cmp word ptr [BP + -1ah],400h
    jc LAB_1000_6b4b
    jmp LAB_1000_6c6d
LAB_1000_6b4b:
    test byte ptr [_word_336E8],3h
    jz LAB_1000_6b55
    jmp LAB_1000_6c6d
LAB_1000_6b55:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_3B208 + 10]
    sub AX,word ptr [BP + -0ch]
    push AX
    call _abs
    add SP,2h
    cmp AX,800h
    jl LAB_1000_6b73
    jmp LAB_1000_6c6d
LAB_1000_6b73:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_3B208 + 12]
    sub AX,word ptr [BP + -2h]
    push AX
    call _abs
    add SP,2h
    cmp AX,800h
    jl LAB_1000_6b91
    jmp LAB_1000_6c6d
LAB_1000_6b91:
    mov AX,word ptr [_word_336E8]
    sar AX,1h
    sar AX,1h
    db 25h, 03h, 00h ; and AX,3h (force imm16 encoding)
    add AX,word ptr [word_3AFA4]
    mov word ptr [BP + -2ah],AX
    mov AX,138h
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    mov word ptr [BP + -28h],AX
    push AX
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_3B208 + 12]
    neg AX
    push AX
    call _sub_1D178
    add SP,4h
    mov CL,5h
    shl AX,CL
    mov BX,word ptr [BP + -2ah]
    mov CX,BX
    shl BX,1h
    add BX,CX
    shl BX,1h
    shl BX,1h
    mov word ptr [BX + offset word_3C5B6],AX
    push word ptr [BP + -28h]
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    push word ptr [BX + offset _stru_3B208 + 12]
    call _sub_1D190
    add SP,4h
    mov word ptr [BP + -28h],AX
    push AX
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    push word ptr [BX + offset _stru_3B208 + 10]
    call _sub_1D178
    add SP,4h
    mov BX,word ptr [BP + -2ah]
    mov CX,BX
    shl BX,1h
    add BX,CX
    shl BX,1h
    shl BX,1h
    mov word ptr [BX + offset word_3C5B2],AX
    push word ptr [BP + -28h]
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    push word ptr [BX + offset _stru_3B208 + 10]
    call _sub_1D190
    add SP,4h
    neg AX
    mov BX,word ptr [BP + -2ah]
    mov CX,BX
    shl BX,1h
    add BX,CX
    shl BX,1h
    shl BX,1h
    mov word ptr [BX + offset word_3C5B4],AX
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    mov AX,word ptr [BP + -2ah]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    shl AX,1h
    mov DI,AX
    mov AX,word ptr [SI + offset word_3B204]
    mov word ptr [DI + offset word_3C5AC],AX
    mov AX,word ptr [SI + offset word_3B206]
    mov word ptr [DI + offset word_3C5AE],AX
    mov AX,word ptr [SI + offset _stru_3B208]
    mov word ptr [DI + offset word_3C5B0],AX
LAB_1000_6c6d:
    mov AX,2h
    push AX
    sub AX,AX
    push AX
    mov AX,word ptr [BP + -22h]
    db 25h, 03h, 00h ; and AX,3h (force imm16 encoding)
    add AX,word ptr [word_330B8]
    push AX
    call _sub_1CF64
    add SP,6h
    mov word ptr [BP + -6h],AX
    cmp word ptr [BP + -22h],0h
    jnz LAB_1000_6c93
    mov word ptr [BP + -6h],1h
LAB_1000_6c93:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_3B208 + 10]
    mov word ptr [BP + -14h],AX
    push word ptr [SI + offset _stru_3B208 + 14]
    call _abs
    add SP,2h
    cmp AX,4000h
    jge LAB_1000_6cc4
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_3B208 + 14]
    sar AX,1h
    sar AX,1h
    add word ptr [BP + -14h],AX
LAB_1000_6cc4:
    mov AX,word ptr [BP + -0ch]
    sub AX,word ptr [BP + -14h]
    mov CL,0dh
    sar AX,CL
    db 25h, 07h, 00h ; and AX,7h (force imm16 encoding)
    mov word ptr [BP + -0ah],AX
    mov AX,word ptr [_var_542]
    mov word ptr [BP + -14h],AX
    push word ptr [_var_545]
    call _abs
    add SP,2h
    cmp AX,4000h
    jge LAB_1000_6cf1
    mov AX,word ptr [_var_545]
    sar AX,1h
    add word ptr [BP + -14h],AX
LAB_1000_6cf1:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_3B208 + 10]
    sub AX,word ptr [BP + -14h]
    mov CL,0dh
    sar AX,CL
    db 05h, 04h, 00h ; add AX,4h (force imm16 encoding)
    db 25h, 07h, 00h ; and AX,7h (force imm16 encoding)
    mov word ptr [BP + -12h],AX
    mov DI,word ptr [BP + -6h]
    mov CL,7h
    shl DI,CL
    mov AX,word ptr [BP + -0ah]
    mov CL,4h
    shl AX,CL
    add DI,AX
    mov BX,word ptr [BP + -12h]
    shl BX,1h
    mov SI,word ptr [BX + DI + offset word_33442 + 2]
    mov AX,SI
    db 25h, 0Fh, 00h ; and AX,0fh (force imm16 encoding)
    mov CL,0ch
    shl AX,CL
    mov word ptr [BP + -32h],AX
    cmp SI,100h
    jnz LAB_1000_6d51
    mov word ptr [BP + -2h],6000h
    mov AX,word ptr [_word_336E8]
    mov CL,8h
    sar AX,CL
    db 25h, 08h, 00h ; and AX,8h (force imm16 encoding)
    mov CL,0ch
    shl AX,CL
    sub AX,4000h
    mov word ptr [BP + -32h],AX
LAB_1000_6d51:
    mov SI,word ptr [BP + -6h]
    mov CL,7h
    shl SI,CL
    mov AX,word ptr [BP + -0ah]
    mov CL,4h
    shl AX,CL
    add SI,AX
    mov BX,word ptr [BP + -12h]
    shl BX,1h
    cmp word ptr [BX + SI + offset word_33442 + 2],200h
    jnz LAB_1000_6d89
    mov word ptr [BP + -2h],0a000h
    mov AX,word ptr [_word_336E8]
    mov CL,8h
    sar AX,CL
    db 25h, 08h, 00h ; and AX,8h (force imm16 encoding)
    db 2Dh, 04h, 00h ; sub AX,4h (force imm16 encoding)
    neg AX
    mov CL,0ch
    shl AX,CL
    mov word ptr [BP + -32h],AX
LAB_1000_6d89:
    cmp word ptr [BP + -2h],0a000h
    jnz LAB_1000_6db5
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_3B208 + 12]
    mov CL,3h
    sar AX,CL
    sub AX,0bb8h
    neg AX
    cmp AX,word ptr [SI + offset _stru_3B208]
    jle LAB_1000_6db5
    mov AX,word ptr [SI + offset _stru_3B208 + 12]
    add AH,10h
    mov word ptr [BP + -2h],AX
LAB_1000_6db5:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    push word ptr [BX + offset _stru_3B208 + 14]
    call _abs
    add SP,2h
    cmp AX,4000h
    jle LAB_1000_6e0e
    sub AX,AX
    mov word ptr [BP + -32h],AX
    mov word ptr [BP + -2h],AX
    jmp LAB_1000_6e0e
LAB_1000_6dd6:
    mov AX,3000h
    push AX
    mov AX,0d000h
    push AX
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    mov AX,word ptr [BP + -0ch]
    sub AX,word ptr [BX + offset _stru_3B208 + 10]
    push AX
    call _sub_1CF64
    add SP,6h
    shl AX,1h
    mov word ptr [BP + -32h],AX
    cmp word ptr [BP + -1eh],1h
    jnz LAB_1000_6e0e
    mov AX,word ptr [word_330B8]
    inc AX
    cmp AX,word ptr [word_3A946]
    jg LAB_1000_6e0e
    mov word ptr [BP + -32h],3000h
LAB_1000_6e0e:
    cmp word ptr [BP + -1eh],1h
    jnz LAB_1000_6e31
    mov BX,word ptr [_word_3C16A]
    mov CL,4h
    shl BX,CL
    test word ptr [BX + offset _stru_3AA5E + 6],400h
    jz LAB_1000_6e31
    cmp word ptr [word_38FEE],780h
    jge LAB_1000_6e31
    mov word ptr [BP + -32h],3000h
LAB_1000_6e31:
    mov BX,word ptr [_var_667]
    mov CL,5h
    shl BX,CL
    mov SI,word ptr [BX + offset aFlogger + 14]
    mov AX,SI
    mov CL,0ch
    shl AX,CL
    push AX
    mov AX,SI
    neg AX
    shl AX,CL
    push AX
    push word ptr [BP + -32h]
    call _sub_1CF64
    add SP,6h
    mov word ptr [BP + -32h],AX
    mov BX,word ptr [_var_667]
    mov CL,5h
    shl BX,CL
    mov SI,word ptr [BX + offset aFlogger + 14]
    mov AX,SI
    mov CL,8h
    shl AX,CL
    push AX
    mov AX,SI
    neg AX
    mov CH,AL
    sub CL,CL
    push CX
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    mov AX,word ptr [BP + -32h]
    sub AX,word ptr [BX + offset _stru_3B208 + 14]
    push AX
    call _sub_1CF64
    add SP,6h
    mov word ptr [BP + -32h],AX
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    test word ptr [SI + offset _stru_3B208 + 18],400h
    jz LAB_1000_6efd
    cmp word ptr [SI + offset _stru_3B208 + 20],96h
    jge LAB_1000_6eac
    mov word ptr [SI + offset _stru_3B208 + 12],0h
    jmp LAB_1000_6eb9
LAB_1000_6eac:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    add byte ptr [BX + offset _stru_3B208 + 13],1h
LAB_1000_6eb9:
    mov word ptr [BP + -32h],0h
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    add SI,896ch
    mov BX,word ptr [_var_667]
    mov CL,5h
    shl BX,CL
    mov AX,word ptr [SI]
    cmp word ptr [BX + offset aFlogger + 10],AX
    jle LAB_1000_6ee8
    mov AX,3ch
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    add word ptr [SI],AX
    jmp LAB_1000_6efd
LAB_1000_6ee8:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    cmp word ptr [SI + offset _stru_3B208],12ch
    jle LAB_1000_6efd
    and byte ptr [SI + offset _stru_3B208 + 19],0fbh
LAB_1000_6efd:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    test byte ptr [BX + offset _stru_3B208 + 18],30h
    jz LAB_1000_6f11
    mov word ptr [BP + -32h],400h
LAB_1000_6f11:
    mov AL,byte ptr [BP + -22h]
    and AL,3h
    mov CL,byte ptr [_word_336E8]
    and CL,3h
    cmp AL,CL
    jnz LAB_1000_6f5f
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    push word ptr [SI + offset _stru_3B208]
    push word ptr [SI + offset word_3B206]
    push word ptr [SI + offset word_3B204]
    call sub_18DF4
    add SP,6h
    cmp byte ptr [_var_315],0h
    jz LAB_1000_6f52
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    or byte ptr [BX + offset _stru_3B208 + 19],20h
    jmp LAB_1000_6f5f
    db 90h
LAB_1000_6f52:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    and byte ptr [BX + offset _stru_3B208 + 19],0dfh
LAB_1000_6f5f:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    test word ptr [BX + offset _stru_3B208 + 18],2000h
    jz LAB_1000_6f74
    mov word ptr [BP + -2h],3000h
LAB_1000_6f74:
    cmp word ptr [word_38FE0],0ah
    jge LAB_1000_6f80
    mov CL,2h
    sar word ptr [BP + -32h],CL
LAB_1000_6f80:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    mov CX,word ptr [word_330B8]
    add CX,2h
    mov AX,word ptr [BP + -32h]
    imul CX
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    add word ptr [SI + offset _stru_3B208 + 14],AX
    mov AX,word ptr [SI + offset _stru_3B208 + 14]
    mov CL,3h
    sar AX,CL
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    add word ptr [SI + offset _stru_3B208 + 10],AX
    mov AX,word ptr [BP + -2h]
    sub AX,word ptr [SI + offset _stru_3B208 + 12]
    mov word ptr [BP + -2ch],AX
    test byte ptr [SI + offset _stru_3B208 + 18],20h
    jz LAB_1000_701d
    mov word ptr [BP + -2ch],0fe00h
    test byte ptr [_word_336E8],3h
    jnz LAB_1000_701d
    mov AX,word ptr [_word_336E8]
    sar AX,1h
    db 25h, 07h, 00h ; and AX,7h (force imm16 encoding)
    mov word ptr [BP + -3ch],AX
    mov BX,AX
    mov CL,3h
    shl BX,CL
    mov AX,word ptr [SI + offset word_3B204]
    mov word ptr [BX + offset stru_33402],AX
    mov SI,word ptr [BP + -3ch]
    shl SI,CL
    mov AX,24h
    imul word ptr [BP + -22h]
    mov DI,AX
    mov AX,word ptr [DI + offset word_3B206]
    mov word ptr [SI + offset stru_33402 + 2],AX
    mov AX,word ptr [DI + offset _stru_3B208]
    mov word ptr [SI + offset stru_33402 + 4],AX
    mov AX,20h
    push AX
    call randlmul
    add SP,2h
    mov CL,0bh
    shl AX,CL
    mov word ptr [SI + offset stru_33402 + 6],AX
    mov AX,word ptr [BP + -3ch]
    mov word ptr [word_33442],AX
LAB_1000_701d:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    cmp word ptr [SI + offset _stru_3B208 + 12],0h
    jge LAB_1000_705a
    mov AX,7d0h
    push AX
    push word ptr [SI + offset _stru_3B208 + 12]
    call _sub_1D178
    add SP,4h
    db 2Dh, 0C8h, 00h ; sub AX,0c8h (force imm16 encoding)
    neg AX
    cmp AX,word ptr [SI + offset _stru_3B208]
    jle LAB_1000_705a
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    test word ptr [BX + offset _stru_3B208 + 18],220h
    jnz LAB_1000_705a
    mov word ptr [BP + -2ch],400h
LAB_1000_705a:
    mov AX,400h
    push AX
    mov AX,0fc00h
    push AX
    push word ptr [BP + -2ch]
    call _sub_1CF64
    add SP,6h
    mov word ptr [BP + -2ch],AX
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    add SI,8964h
    mov AX,word ptr [BP + -2ch]
    shl AX,1h
    shl AX,1h
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    add word ptr [SI],AX
    push word ptr [SI]
    call _abs
    add SP,2h
    cmp AX,4000h
    jle LAB_1000_70b4
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    add byte ptr [SI + offset _stru_3B208 + 11],80h
    add byte ptr [SI + offset _stru_3B208 + 15],80h
    mov AX,8000h
    sub AX,word ptr [SI + offset _stru_3B208 + 12]
    mov word ptr [SI + offset _stru_3B208 + 12],AX
LAB_1000_70b4:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    and byte ptr [SI + offset _stru_3B208 + 18],0efh
    mov AX,word ptr [SI + offset _stru_3B208 + 20]
    cwd
    push DX
    push AX
    mov AX,word ptr [SI + offset _stru_3B208 + 12]
    cwd
    sub AX,DX
    sar AX,1h
    sub AX,8000h
    neg AX
    sub CX,CX
    push CX
    push AX
    call __aNlmul
    mov CL,0eh
LAB_1000_70df:
    shr DX,1h
    rcr AX,1h
    dec CL
    jnz LAB_1000_70df
    mov word ptr [BP + -20h],AX
    push AX
    push word ptr [SI + offset _stru_3B208 + 14]
    call _sub_1D178
    add SP,4h
    push AX
    call _abs
    add SP,2h
    sar AX,1h
    sub word ptr [BP + -20h],AX
    mov AX,word ptr [BP + -20h]
    shl AX,1h
    shl AX,1h
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    mov word ptr [BP + -20h],AX
    mov CL,2h
    sar word ptr [BP + -20h],CL
    push word ptr [BP + -20h]
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    push word ptr [BX + offset _stru_3B208 + 12]
    call _sub_1D190
    add SP,4h
    mov word ptr [BP + -38h],AX
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    push word ptr [BP + -38h]
    push word ptr [SI + offset _stru_3B208 + 10]
    call _sub_1D178
    add SP,4h
    cwd
    add word ptr [SI + offset _stru_3B208 + 2],AX
    adc word ptr [SI + offset _stru_3B208 + 4],DX
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    push word ptr [BP + -38h]
    push word ptr [SI + offset _stru_3B208 + 10]
    call _sub_1D190
    add SP,4h
    cwd
    sub word ptr [SI + offset _stru_3B208 + 6],AX
    sbb word ptr [SI + offset _stru_3B208 + 8],DX
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    push word ptr [BP + -20h]
    push word ptr [SI + offset _stru_3B208 + 12]
    call _sub_1D178
    add SP,4h
    add word ptr [SI + offset _stru_3B208],AX
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_3B208 + 2]
    mov DX,word ptr [SI + offset _stru_3B208 + 4]
    mov CL,5h
LAB_1000_7196:
    sar DX,1h
    rcr AX,1h
    dec CL
    jnz LAB_1000_7196
    mov word ptr [SI + offset word_3B204],AX
    mov AX,word ptr [SI + offset _stru_3B208 + 6]
    mov DX,word ptr [SI + offset _stru_3B208 + 8]
    mov CL,5h
LAB_1000_71ac:
    sar DX,1h
    rcr AX,1h
    dec CL
    jnz LAB_1000_71ac
    mov word ptr [SI + offset word_3B206],AX
    cmp word ptr [SI + offset _stru_3B208],7530h
    jle LAB_1000_71ce
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    mov word ptr [BX + offset _stru_3B208 + 12],0h
LAB_1000_71ce:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    cmp word ptr [SI + offset _stru_3B208],0h
    jge LAB_1000_7217
    cmp word ptr [BP + -22h],0h
    jz LAB_1000_71e8
    mov AX,1c1h
    jmp LAB_1000_71ea
LAB_1000_71e8:
    sub AX,AX
LAB_1000_71ea:
    and word ptr [SI + offset _stru_3B208 + 18],AX
    mov AX,word ptr [SI + offset word_3B204]
    mov word ptr [word_3BEBC],AX
    mov AX,word ptr [SI + offset word_3B206]
    mov word ptr [word_3BEC8],AX
    mov AX,word ptr [SI + offset _stru_3B208]
    mov word ptr [word_3BECE],AX
    mov word ptr [word_39606],0fff8h
    mov AX,word ptr [_word_336F2]
    cmp word ptr [BP + -22h],AX
    jnz LAB_1000_7217
    mov word ptr [_word_336F2],0ffffh
LAB_1000_7217:
    cmp word ptr [BP + -1ah],10h
    jnc LAB_1000_7249
    cmp word ptr [BP + -1eh],2h
    jnz LAB_1000_7249
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    add SI,896ah
    test word ptr [SI],200h
    jz LAB_1000_723c
    or byte ptr [SI + 1h],10h
    jmp LAB_1000_7249
    db 90h
LAB_1000_723c:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    or byte ptr [BX + offset _stru_3B208 + 19],2h
LAB_1000_7249:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    test word ptr [SI + offset _stru_3B208 + 18],1000h
    jnz LAB_1000_725c
    jmp LAB_1000_72ef
LAB_1000_725c:
    sub AX,AX
    mov word ptr [SI + offset _stru_3B208 + 12],AX
    mov word ptr [SI + offset _stru_3B208 + 14],AX
    cmp word ptr [word_3AFA8],1h
    jz LAB_1000_7270
    mov AX,8000h
LAB_1000_7270:
    mov word ptr [SI + offset _stru_3B208 + 10],AX
    mov BX,word ptr [_word_3C16A]
    mov CL,4h
    shl BX,CL
    test word ptr [BX + offset _stru_3AA5E + 6],200h
    jz LAB_1000_728a
    mov AX,8ch
    jmp LAB_1000_728d
    db 90h
LAB_1000_728a:
    mov AX,0ch
LAB_1000_728d:
    mov word ptr [SI + offset _stru_3B208],AX
    cmp word ptr [SI + offset _stru_3B208 + 20],0h
    jle LAB_1000_72a8
    mov AX,78h
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    sub word ptr [SI + offset _stru_3B208 + 20],AX
    jmp LAB_1000_72c9
LAB_1000_72a8:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    add SI,896ah
    and word ptr [SI],1c1h
    cmp word ptr [BP + -22h],0h
    jnz LAB_1000_72c9
    cmp word ptr [_word_3B144],5h
    jl LAB_1000_72c9
    mov word ptr [SI],0h
LAB_1000_72c9:
    mov AX,word ptr [_word_3C046]
    db 2Dh, 04h, 00h ; sub AX,4h (force imm16 encoding)
    cmp word ptr [BP + -22h],AX
    jl LAB_1000_72ef
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    cmp word ptr [SI + offset _stru_3B208 + 20],64h
    jge LAB_1000_72ef
    and word ptr [SI + offset _stru_3B208 + 18],1c1h
    or word ptr [SI + offset _stru_3B208 + 18],406h
LAB_1000_72ef:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    dec word ptr [SI + offset _stru_3B208 + 22]
    jnz LAB_1000_736c
    or byte ptr [SI + offset _stru_3B208 + 18],4h
    mov word ptr [BP + -1ch],7fffh
    mov word ptr [BP + -26h],3h
    jmp LAB_1000_7364
LAB_1000_730e:
    mov SI,word ptr [BP + -26h]
    mov CL,4h
    shl SI,CL
    mov AX,word ptr [SI + offset _stru_3AA5E + 6]
    and AX,101h
    db 3Dh, 01h, 00h ; cmp AX,1h (force imm16 encoding)
    jnz LAB_1000_7361
    mov AX,24h
    imul word ptr [BP + -22h]
    mov DI,AX
    mov AX,word ptr [DI + offset word_3B206]
    sub AX,word ptr [SI + offset _stru_3AA5E + 2]
    push AX
    mov AX,word ptr [DI + offset word_3B204]
    sub AX,word ptr [SI + offset _stru_3AA5E]
    push AX
    call _sub_1CFA6
    add SP,4h
    mov word ptr [BP + -3ch],AX
    mov AX,word ptr [BP + -1ch]
    cmp word ptr [BP + -3ch],AX
    jge LAB_1000_7361
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    mov AX,word ptr [BP + -26h]
    mov word ptr [BX + offset _unk_3B202],AX
    mov AX,word ptr [BP + -3ch]
    mov word ptr [BP + -1ch],AX
LAB_1000_7361:
    inc word ptr [BP + -26h]
LAB_1000_7364:
    mov AX,word ptr [_word_3C69E]
    cmp word ptr [BP + -26h],AX
    jl LAB_1000_730e
LAB_1000_736c:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    push word ptr [SI + offset word_3B206]
    push word ptr [SI + offset word_3B204]
    call sub_19A4D
    add SP,4h
    mov word ptr [SI + offset _stru_3B208 + 26],AX
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    mov AL,byte ptr [BX + offset _stru_3B208 + 18]
    mov byte ptr [BP + -40h],AL
    test byte ptr [BP + -40h],2h
    jnz LAB_1000_739e
    jmp LAB_1000_74eb
LAB_1000_739e:
    mov AL,byte ptr [BP + -22h]
    sub AH,AH
    db 25h, 08h, 00h ; and AX,8h (force imm16 encoding)
    mov CL,3h
    shr AX,CL
    mov CX,word ptr [BP + -22h]
    and CX,7h
    shl CX,1h
    add AX,CX
    mov word ptr [BP + -24h],AX
    mov AX,word ptr [_word_336E8]
    cwd
    mov BX,word ptr [_word_330C4]
    mov CL,4h
    shl BX,CL
    idiv BX
    mov AX,word ptr [BP + -24h]
    mov CX,DX
    imul word ptr [_word_330C4]
    cmp AX,CX
    jz LAB_1000_73d5
    jmp LAB_1000_74eb
LAB_1000_73d5:
    test byte ptr [BP + -40h],20h
    jz LAB_1000_73de
    jmp LAB_1000_74eb
LAB_1000_73de:
    push word ptr [BP + -22h]
    call sub_17594
    add SP,2h
    jmp LAB_1000_74eb
LAB_1000_73ea:
    mov AL,byte ptr [BP + -22h]
    and AL,7h
    mov DX,word ptr [word_38FE0]
    mov CL,4h
    sar DX,CL
    and DL,7h
    cmp AL,DL
    jz LAB_1000_7401
    jmp LAB_1000_74eb
LAB_1000_7401:
    mov AX,word ptr [_word_3C046]
    db 2Dh, 04h, 00h ; sub AX,4h (force imm16 encoding)
    cmp word ptr [BP + -22h],AX
    jl LAB_1000_740f
    jmp LAB_1000_74eb
LAB_1000_740f:
    cmp word ptr [BP + -22h],0h
    jnz LAB_1000_7418
    jmp LAB_1000_74eb
LAB_1000_7418:
    mov AX,0e0h
    cwd
    mov CX,word ptr [word_330B8]
    add CX,2h
    idiv CX
    mov CX,word ptr [word_38FE0]
    sub CX,word ptr [_var_556]
    cmp CX,AX
    jg LAB_1000_7434
    jmp LAB_1000_74eb
LAB_1000_7434:
    push word ptr [_word_3C69E]
    call randlmul
    add SP,2h
    mov word ptr [BP + -10h],AX
    cmp word ptr [word_336F0],0h
    jnz LAB_1000_745a
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    test byte ptr [BX + offset _stru_3B208 + 18],80h
    jnz LAB_1000_745a
    jmp LAB_1000_74eb
LAB_1000_745a:
    mov SI,word ptr [BP + -10h]
    mov CL,4h
    shl SI,CL
    mov AX,word ptr [SI + offset _stru_3AA5E + 6]
    and AX,181h
    db 3Dh, 01h, 00h ; cmp AX,1h (force imm16 encoding)
    jnz LAB_1000_74eb
    mov AX,24h
    imul word ptr [BP + -22h]
    mov BX,AX
    mov AX,word ptr [SI + offset _stru_3AA5E + 8]
    cmp word ptr [BX + offset _stru_3B208 + 16],AX
    jnz LAB_1000_74eb
    mov AX,word ptr [word_330B8]
    shl AX,1h
    cmp AX,word ptr [word_3A946]
    jl LAB_1000_74eb
    mov AX,word ptr [word_3B4D8]
    sub AX,word ptr [SI + offset _stru_3AA5E]
    mov word ptr [BP + -2eh],AX
    mov AX,word ptr [word_3B4E0]
    sub AX,word ptr [SI + offset _stru_3AA5E + 2]
    mov word ptr [BP + -34h],AX
    push AX
    push word ptr [BP + -2eh]
    call _sub_1CFA6
    add SP,4h
    mov CL,6h
    shr AX,CL
    mov word ptr [BP + -1ah],AX
    mov BX,word ptr [_var_667]
    mov CL,5h
    shl BX,CL
    mov AX,word ptr [BX + offset aFlogger + 12]
    mov word ptr [BP + -0eh],AX
    cwd
    sub AX,DX
    sar AX,1h
    cmp AX,word ptr [BP + -1ah]
    jbe LAB_1000_74eb
    mov AX,word ptr [word_38FE0]
    mov word ptr [_var_556],AX
    push word ptr [BP + -10h]
    push word ptr [BP + -22h]
    call sub_1783A
    add SP,4h
    mov AX,2h
    push AX
    mov AX,word ptr [BP + -22h]
    db 05h, 20h, 00h ; add AX,20h (force imm16 encoding)
    push AX
    call sub_11BC3
    add SP,4h
LAB_1000_74eb:
    inc word ptr [BP + -22h]
LAB_1000_74ee:
    mov AX,word ptr [_word_3C046]
    cmp word ptr [BP + -22h],AX
    jl LAB_1000_74f9
    jmp LAB_1000_758e
LAB_1000_74f9:
    mov AX,24h
    imul word ptr [BP + -22h]
    mov SI,AX
    test byte ptr [SI + offset _stru_3B208 + 18],1h
    jz LAB_1000_74eb
    mov AX,word ptr [SI + offset _stru_3B208 + 16]
    mov word ptr [_var_667],AX
    test byte ptr [SI + offset _stru_3B208 + 18],2h
    jnz LAB_1000_7519
    jmp LAB_1000_73ea
LAB_1000_7519:
    cmp word ptr [SI + offset _stru_3B208 + 20],0h
    jnz LAB_1000_7523
    jmp LAB_1000_73ea
LAB_1000_7523:
    mov word ptr [BP + -1eh],0h
    test byte ptr [SI + offset _stru_3B208 + 18],4h
    jz LAB_1000_7532
    jmp LAB_1000_69fe
LAB_1000_7532:
    cmp word ptr [word_336F0],0h
    jnz LAB_1000_753c
    jmp LAB_1000_6810
LAB_1000_753c:
    test word ptr [SI + offset _stru_3B208 + 18],140h
    jz LAB_1000_7550
    mov AX,word ptr [word_3995C]
    cmp word ptr [word_336F0],AX
    jg LAB_1000_7550
    jmp LAB_1000_6810
LAB_1000_7550:
    mov AX,word ptr [word_3B4D8]
    mov word ptr [BP + -30h],AX
    mov AX,word ptr [word_3B4E0]
    mov word ptr [BP + -36h],AX
    mov AX,word ptr [word_3B5D6]
    mov word ptr [BP + -3ah],AX
    mov word ptr [BP + -1eh],1h
    cmp word ptr [word_333DA],0h
    jnz LAB_1000_7571
    jmp LAB_1000_6a96
LAB_1000_7571:
    mov AX,word ptr [word_333D2]
    mov word ptr [BP + -30h],AX
    mov AX,word ptr [word_333D4]
    mov word ptr [BP + -36h],AX
    mov AX,7530h
    push AX
    mov AX,3e8h
    push AX
    push word ptr [_var_547]
    jmp LAB_1000_69f1
    db 90h
    db 90h
LAB_1000_758e:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
sub_167B4 endp
; ------------------------------seg000:0x7593------------------------------
; ------------------------------seg000:0x7594------------------------------
sub_17594 proc near
    push BP
    mov BP,SP
    sub SP,20h
    push DI
    push SI
    mov BX,word ptr [_var_667]
    mov CL,5h
    shl BX,CL
    mov AX,word ptr [BX + offset aFlogger + 16]
    mov word ptr [BP + -14h],AX
    mov AX,24h
    imul word ptr [BP + 4h]
    mov SI,AX
    lea AX,[BP + -10h]
    push AX
    lea AX,[BP + -0ah]
    push AX
    push word ptr [BP + -14h]
    push word ptr [SI + offset _stru_3B208]
    push word ptr [SI + offset word_3B206]
    push word ptr [SI + offset word_3B204]
    call sub_1660E
    add SP,0ch
    mov word ptr [BP + -1ch],AX
    mov word ptr [word_336FA],4h
    mov AX,word ptr [BP + -10h]
    cmp word ptr [BP + -1ch],AX
    ja LAB_1000_75e4
    jmp LAB_1000_7804
LAB_1000_75e4:
    mov AX,24h
    imul word ptr [BP + 4h]
    mov SI,AX
    mov AX,word ptr [word_330BA]
    add AX,word ptr [word_330B8]
    mov CL,4h
    shl AX,CL
    db 05h, 20h, 00h ; add AX,20h (force imm16 encoding)
    mov CL,byte ptr [_planeFlags]
    and CL,10h
    mov DX,CX
    cmp DL,1h
    sbb CX,CX
    inc CX
    sar AX,CL
    add word ptr [SI + offset _stru_3B208 + 28],AX
    cmp word ptr [SI + offset _stru_3B208 + 28],0c0h
    jg LAB_1000_761a
    jmp LAB_1000_77f5
LAB_1000_761a:
    inc word ptr [word_3C09C]
    or byte ptr [SI + offset _stru_3B208 + 19],40h
    call sub_166BE
    mov AX,word ptr [BP + 4h]
    cwd
    mov CX,word ptr [word_330B8]
    inc CX
    idiv CX
    mov word ptr [BP + -16h],DX
    mov AX,word ptr [word_330B8]
    shl AX,1h
    cmp AX,word ptr [word_3A946]
    jge LAB_1000_7642
    jmp LAB_1000_77f5
LAB_1000_7642:
    mov AX,18h
    imul DX
    mov BX,AX
    cmp word ptr [BX + offset _stru_335C4 + 14],0h
    jz LAB_1000_7653
    jmp LAB_1000_77f5
LAB_1000_7653:
    cmp word ptr [BP + -10h],8h
    ja LAB_1000_765c
    jmp LAB_1000_77f5
LAB_1000_765c:
    mov AX,24h
    imul word ptr [BP + 4h]
    mov BX,AX
    mov AX,word ptr [BP + -0ah]
    sub AX,word ptr [BX + offset _stru_3B208 + 10]
    push AX
    call _abs
    add SP,2h
    cmp AX,1800h
    jl LAB_1000_767a
    jmp LAB_1000_77f5
LAB_1000_767a:
    mov AX,24h
    imul word ptr [BP + 4h]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_3B208 + 24]
    mov word ptr [BP + -14h],AX
    mov AX,12h
    imul word ptr [BP + -14h]
    mov BX,AX
    mov AX,word ptr [BP + -10h]
    shr AX,1h
    cmp word ptr [BX + offset _sams + 8],AX
    ja LAB_1000_769f
    jmp LAB_1000_77f5
LAB_1000_769f:
    mov AX,word ptr [word_330B8]
    mov CX,AX
    shl AX,1h
    add AX,CX
    db 2Dh, 10h, 00h ; sub AX,10h (force imm16 encoding)
    neg AX
    cmp AX,word ptr [BP + -10h]
    jc LAB_1000_76b5
    jmp LAB_1000_77f5
LAB_1000_76b5:
    cmp word ptr [BP + -10h],1000h
    jc LAB_1000_76bf
    jmp LAB_1000_77f5
LAB_1000_76bf:
    cmp word ptr [BP + -14h],0h
    jnz LAB_1000_76c8
    jmp LAB_1000_77f5
LAB_1000_76c8:
    mov AX,18h
    imul word ptr [BP + -16h]
    mov DI,AX
    mov AX,word ptr [SI + offset word_3B204]
    mov word ptr [DI + offset _stru_335C4],AX
    mov AX,word ptr [SI + offset word_3B206]
    mov word ptr [DI + offset _stru_335C4 + 2],AX
    mov AX,18h
    imul word ptr [BP + -16h]
    mov SI,AX
    mov AX,24h
    imul word ptr [BP + 4h]
    mov DI,AX
    mov AX,word ptr [DI + offset _stru_3B208]
    db 2Dh, 19h, 00h ; sub AX,19h (force imm16 encoding)
    mov word ptr [SI + offset _stru_335C4 + 4],AX
    mov AX,12h
    imul word ptr [BP + -14h]
    mov word ptr [BP + -20h],AX
    mov BX,AX
    mov AX,word ptr [BX + offset _sams + 10]
    mov CL,6h
    sar AX,CL
    mov word ptr [SI + offset _stru_335C4 + 6],AX
    mov AX,word ptr [DI + offset _stru_3B208 + 10]
    mov word ptr [SI + offset _stru_335C4 + 8],AX
    mov AX,word ptr [DI + offset _stru_3B208 + 12]
    sub AX,400h
    mov word ptr [SI + offset _stru_335C4 + 10],AX
    mov AX,word ptr [DI + offset _stru_3B208 + 14]
    mov word ptr [SI + offset _stru_335C4 + 12],AX
    mov AX,word ptr [SI + offset _stru_335C4 + 6]
    cwd
    push DX
    push AX
    mov AX,word ptr [_word_330C4]
    cwd
    push DX
    push AX
    mov BX,word ptr [BP + -20h]
    mov AX,word ptr [BX + offset _sams + 8]
    cwd
    mov CL,3h
LAB_1000_7744:
    shl AX,1h
    rcl DX,1h
    dec CL
    jnz LAB_1000_7744
    push DX
    push AX
    call __aNlmul
    push DX
    push AX
    call __aNldiv
    mov word ptr [SI + offset _stru_335C4 + 14],AX
    mov AX,word ptr [BP + -14h]
    mov word ptr [SI + offset _stru_335C4 + 16],AX
    mov AX,18h
    imul word ptr [BP + -16h]
    mov BX,AX
    mov AX,word ptr [BP + 4h]
    neg AX
    mov word ptr [BX + offset _stru_335C4 + 22],AX
    mov AX,12h
    imul word ptr [BP + -14h]
    add AX,528h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,offset aFiredBy
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,word ptr [_var_667]
    mov CL,5h
    shl AX,CL
    add AX,2c8h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    mov AX,2h
    push AX
    mov AX,6h
    push AX
    call makeSound
    add SP,4h
    les BX,dword ptr [_commData]
    inc word ptr ES:[BX + 2ch]
    mov AX,2h
    push AX
    mov AX,word ptr [BP + 4h]
    db 05h, 20h, 00h ; add AX,20h (force imm16 encoding)
    push AX
    call sub_11BC3
    add SP,4h
    mov AX,4h
    push AX
    call randlmul
    add SP,2h
    or AX,AX
    jnz LAB_1000_77f5
    mov AX,24h
    imul word ptr [BP + 4h]
    mov BX,AX
    or byte ptr [BX + offset _stru_3B208 + 18],4h
LAB_1000_77f5:
    mov AX,24h
    imul word ptr [BP + 4h]
    mov BX,AX
    or byte ptr [BX + offset _stru_3B208 + 18],8h
    jmp LAB_1000_7816
LAB_1000_7804:
    mov AX,24h
    imul word ptr [BP + 4h]
    mov SI,AX
    and byte ptr [SI + offset _stru_3B208 + 18],0f7h
    sub word ptr [SI + offset _stru_3B208 + 28],20h
LAB_1000_7816:
    mov AX,24h
    imul word ptr [BP + 4h]
    mov SI,AX
    add SI,8974h
    mov AX,0ffh
    push AX
    sub AX,AX
    push AX
    push word ptr [SI]
    call _sub_1CF64
    add SP,6h
    mov word ptr [SI],AX
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
    nop
sub_17594 endp
; ------------------------------seg000:0x7838------------------------------
; ------------------------------seg000:0x783a------------------------------
sub_1783A proc near
    push BP
    mov BP,SP
    sub SP,2h
    push DI
    push SI
    mov AX,24h
    imul word ptr [BP + 4h]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_3B208 + 16]
    mov word ptr [BP + -2h],AX
    cmp word ptr [word_3AFA8],1h
    jnz LAB_1000_785c
    sub AX,AX
    jmp LAB_1000_785f
LAB_1000_785c:
    mov AX,8000h
LAB_1000_785f:
    mov word ptr [SI + offset _stru_3B208 + 10],AX
    mov DI,word ptr [BP + 6h]
    mov CL,4h
    shl DI,CL
    test word ptr [DI + offset _stru_3AA5E + 6],200h
    jz LAB_1000_78ae
    mov AX,word ptr [word_3AFA8]
    mov CX,AX
    shl AX,1h
    add AX,CX
    add AX,word ptr [DI + offset _stru_3AA5E]
    mov word ptr [SI + offset word_3B204],AX
    mov AX,word ptr [DI + offset _stru_3AA5E + 2]
    mov CX,word ptr [word_3AFA8]
    mov DX,CX
    shl CX,1h
    add CX,DX
    shl CX,1h
    shl CX,1h
    sub AX,CX
    mov word ptr [SI + offset word_3B206],AX
    mov word ptr [SI + offset _stru_3B208],8ch
    mov word ptr [SI + offset _stru_3B208 + 20],64h
    add byte ptr [SI + offset _stru_3B208 + 11],0fch
    jmp LAB_1000_78e0
LAB_1000_78ae:
    mov AX,24h
    imul word ptr [BP + 4h]
    mov SI,AX
    mov DI,word ptr [BP + 6h]
    mov CL,4h
    shl DI,CL
    mov AX,word ptr [DI + offset _stru_3AA5E]
    mov word ptr [SI + offset word_3B204],AX
    mov AX,1eh
    imul word ptr [word_3AFA8]
    add AX,word ptr [DI + offset _stru_3AA5E + 2]
    mov word ptr [SI + offset word_3B206],AX
    mov word ptr [SI + offset _stru_3B208],0ch
    mov word ptr [SI + offset _stru_3B208 + 20],0ah
LAB_1000_78e0:
    mov AX,24h
    imul word ptr [BP + 4h]
    mov SI,AX
    mov AX,word ptr [SI + offset word_3B204]
    sub DX,DX
    mov CL,5h
LAB_1000_78f0:
    shl AX,1h
    rcl DX,1h
    dec CL
    jnz LAB_1000_78f0
    mov word ptr [SI + offset _stru_3B208 + 2],AX
    mov word ptr [SI + offset _stru_3B208 + 4],DX
    mov AX,word ptr [SI + offset word_3B206]
    sub DX,DX
    mov CL,5h
LAB_1000_7908:
    shl AX,1h
    rcl DX,1h
    dec CL
    jnz LAB_1000_7908
    mov word ptr [SI + offset _stru_3B208 + 6],AX
    mov word ptr [SI + offset _stru_3B208 + 8],DX
    mov word ptr [SI + offset _stru_3B208 + 12],0h
    mov word ptr [SI + offset _stru_3B208 + 14],0h
    or word ptr [SI + offset _stru_3B208 + 18],403h
    mov AX,word ptr [BP + 6h]
    mov word ptr [SI + offset _unk_3B202],AX
    mov DI,word ptr [BP + -2h]
    mov CL,5h
    shl DI,CL
    mov AX,word ptr [DI + offset aFlogger + 10]
    cwd
    push DX
    push AX
    mov AX,word ptr [_word_330C4]
    cwd
    push DX
    push AX
    mov AX,word ptr [DI + offset aFlogger + 12]
    cwd
    mov CL,0bh
LAB_1000_794c:
    shl AX,1h
    rcl DX,1h
    dec CL
    jnz LAB_1000_794c
    push DX
    push AX
    call __aNlmul
    push DX
    push AX
    call __aNldiv
    mov word ptr [SI + offset _stru_3B208 + 22],AX
    mov DI,word ptr [BP + 6h]
    mov CL,4h
    shl DI,CL
    push word ptr [DI + offset _stru_3AA5E + 2]
    push word ptr [DI + offset _stru_3AA5E]
    call sub_19A4D
    add SP,4h
    mov word ptr [SI + offset _stru_3B208 + 26],AX
    cmp word ptr [_word_336FC],-1h
    jnz LAB_1000_798f
    mov AX,24h
    imul word ptr [BP + 4h]
    mov BX,AX
    and byte ptr [BX + offset _stru_3B208 + 19],0feh
LAB_1000_798f:
    push word ptr [BP + 6h]
    call placeString
    add SP,2h
    mov AX,58bbh
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,24h
    imul word ptr [BP + 4h]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_3B208 + 16]
    mov CL,5h
    shl AX,CL
    add AX,2c8h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset aTakingOff
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,word ptr [_word_3C046]
    db 2Dh, 04h, 00h ; sub AX,4h (force imm16 encoding)
    cmp word ptr [BP + 4h],AX
    jge LAB_1000_79e7
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
LAB_1000_79e7:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
    nop
sub_1783A endp
; ------------------------------seg000:0x79ec------------------------------
; ------------------------------seg000:0x79ee------------------------------
sub_179EE proc near
    push BP
    mov BP,SP
    sub SP,36h
    push DI
    push SI
    mov AX,8h
    push AX
    sub AX,AX
    push AX
    call sub_19EB6
    add SP,4h
    mov AX,8h
    push AX
    mov AX,1h
    push AX
    call sub_19EB6
    add SP,4h
    cmp word ptr [word_333DA],0h
    jz LAB_1000_7a24
    mov AX,word ptr [word_333D2]
    mov word ptr [BP + -2ah],AX
    mov AX,word ptr [word_333D4]
    jmp LAB_1000_7a2d
    db 90h
LAB_1000_7a24:
    mov AX,word ptr [_word_3BEC0]
    mov word ptr [BP + -2ah],AX
    mov AX,word ptr [_word_3BED0]
LAB_1000_7a2d:
    mov word ptr [BP + -30h],AX
    mov word ptr [BP + -1ch],0h
    jmp LAB_1000_83f7
LAB_1000_7a38:
    mov word ptr [BP + -10h],7fffh
    cmp word ptr [BP + -22h],7h
    jz LAB_1000_7a46
    jmp LAB_1000_7ade
LAB_1000_7a46:
    mov word ptr [BP + -20h],0h
    jmp LAB_1000_7ad3
LAB_1000_7a4e:
    mov AX,24h
    imul word ptr [BP + -20h]
    mov SI,AX
    test byte ptr [SI + offset _stru_3B208 + 18],2h
    jz LAB_1000_7ad0
    cmp word ptr [SI + offset _stru_3B208 + 20],0h
    jz LAB_1000_7ad0
    push word ptr [BP + -22h]
    push word ptr [SI + offset _stru_3B208]
    push word ptr [SI + offset word_3B206]
    push word ptr [SI + offset word_3B204]
    push word ptr [BP + -1ch]
    call sub_185BE
    add SP,0ah
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [_var_669]
    cmp word ptr [BP + -10h],AX
    jbe LAB_1000_7ad0
    cmp word ptr [BP + -2h],0h
    jz LAB_1000_7ad0
    mov AX,word ptr [_var_670]
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [_var_669]
    mov word ptr [BP + -10h],AX
    mov AX,word ptr [BP + -20h]
    mov word ptr [BP + -14h],AX
    mov AX,24h
    imul word ptr [BP + -20h]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_3B208]
    mov word ptr [BP + -32h],AX
    mov word ptr [BP + -4h],1h
    cmp word ptr [BP + -10h],180h
    jnc LAB_1000_7ad0
    or byte ptr [SI + offset _stru_3B208 + 18],10h
    mov AX,1h
    push AX
    mov AX,word ptr [BP + -20h]
    db 05h, 20h, 00h ; add AX,20h (force imm16 encoding)
    push AX
    call sub_11BC3
    add SP,4h
LAB_1000_7ad0:
    inc word ptr [BP + -20h]
LAB_1000_7ad3:
    mov AX,word ptr [_word_3C046]
    cmp word ptr [BP + -20h],AX
    jge LAB_1000_7ade
    jmp LAB_1000_7a4e
LAB_1000_7ade:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,12h
    imul word ptr [BP + -12h]
    mov BX,AX
    mov AX,word ptr [BX + offset _sams + 10]
    mov CL,6h
    sar AX,CL
    cmp AX,word ptr [SI + offset _stru_335C4 + 6]
    jle LAB_1000_7b0e
    test byte ptr [_word_336E8],1h
    jz LAB_1000_7b0e
    inc word ptr [SI + offset _stru_335C4 + 6]
    mov AX,word ptr [SI + offset _stru_335C4 + 8]
    mov word ptr [BP + -6h],AX
LAB_1000_7b0e:
    cmp word ptr [BP + -22h],4h
    jz LAB_1000_7b29
    cmp word ptr [BP + -22h],6h
    jz LAB_1000_7b29
    cmp word ptr [BP + -22h],5h
    jz LAB_1000_7b29
    cmp word ptr [BP + -22h],1ch
    jz LAB_1000_7b29
    jmp LAB_1000_7c47
LAB_1000_7b29:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    cmp word ptr [BX + offset _stru_335C4 + 20],-1h
    jz LAB_1000_7b3b
    jmp LAB_1000_7be0
LAB_1000_7b3b:
    mov word ptr [BP + -20h],0h
    jmp LAB_1000_7b45
LAB_1000_7b42:
    inc word ptr [BP + -20h]
LAB_1000_7b45:
    mov AX,word ptr [_word_3BED2]
    cmp word ptr [BP + -20h],AX
    jl LAB_1000_7b50
    jmp LAB_1000_7c47
LAB_1000_7b50:
    cmp word ptr [BP + -22h],4h
    jnz LAB_1000_7b64
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    cmp word ptr [BX + offset _stru_3AA5E + 4],0h
    jz LAB_1000_7b42
LAB_1000_7b64:
    cmp word ptr [BP + -22h],5h
    jz LAB_1000_7b70
    cmp word ptr [BP + -22h],6h
    jnz LAB_1000_7b7e
LAB_1000_7b70:
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    test byte ptr [BX + offset _stru_3AA5E + 6],8h
    jnz LAB_1000_7b92
LAB_1000_7b7e:
    cmp word ptr [BP + -22h],5h
    jz LAB_1000_7b42
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    test byte ptr [BX + offset _stru_3AA5E + 6],8h
    jnz LAB_1000_7b42
LAB_1000_7b92:
    mov SI,word ptr [BP + -20h]
    mov CL,4h
    shl SI,CL
    push word ptr [BP + -22h]
    sub AX,AX
    push AX
    push word ptr [SI + offset _stru_3AA5E + 2]
    push word ptr [SI + offset _stru_3AA5E]
    push word ptr [BP + -1ch]
    call sub_185BE
    add SP,0ah
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [_var_669]
    cmp word ptr [BP + -10h],AX
    jbe LAB_1000_7b42
    cmp word ptr [BP + -2h],0h
    jz LAB_1000_7b42
    mov AX,word ptr [_var_670]
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [_var_669]
    mov word ptr [BP + -10h],AX
    mov AX,word ptr [BP + -20h]
    mov word ptr [BP + -14h],AX
    mov word ptr [BP + -32h],0h
    mov word ptr [BP + -4h],1h
    jmp LAB_1000_7b42
LAB_1000_7be0:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_335C4 + 20]
    mov word ptr [BP + -20h],AX
    mov SI,AX
    mov CL,4h
    shl SI,CL
    push word ptr [BP + -22h]
    sub AX,AX
    push AX
    push word ptr [SI + offset _stru_3AA5E + 2]
    push word ptr [SI + offset _stru_3AA5E]
    push word ptr [BP + -1ch]
    call sub_185BE
    add SP,0ah
    mov word ptr [BP + -2h],AX
    or AX,AX
    jz LAB_1000_7c47
    mov AX,word ptr [_var_670]
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [_var_669]
    mov word ptr [BP + -10h],AX
    mov AX,word ptr [BP + -20h]
    mov word ptr [BP + -14h],AX
    mov word ptr [BP + -32h],0h
    mov word ptr [BP + -4h],1h
    cmp word ptr [BP + -10h],0c0h
    jnc LAB_1000_7c47
    mov AX,1h
    push AX
    mov AX,word ptr [BP + -20h]
    db 05h, 40h, 00h ; add AX,40h (force imm16 encoding)
    push AX
    call sub_11BC3
    add SP,4h
LAB_1000_7c47:
    cmp word ptr [BP + -4h],0h
    jnz LAB_1000_7c50
    jmp LAB_1000_7ce7
LAB_1000_7c50:
    cmp word ptr [BP + -1ch],8h
    jl LAB_1000_7c59
    jmp LAB_1000_7ce7
LAB_1000_7c59:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [_var_670]
    sub AX,word ptr [BX + offset _stru_335C4 + 8]
    push AX
    call _abs
    add SP,2h
    cmp AX,1000h
    jge LAB_1000_7ce7
    cmp word ptr [word_333DA],0h
    jnz LAB_1000_7ce7
    cmp word ptr [BP + -22h],0h
    jg LAB_1000_7c96
    test byte ptr [_word_336E8],2h
    jz LAB_1000_7c96
    mov AX,0ch
    push AX
    mov AX,1h
    push AX
    call sub_19EB6
    add SP,4h
LAB_1000_7c96:
    cmp word ptr [BP + -22h],0h
    jz LAB_1000_7cb0
    test byte ptr [_word_336E8],2h
    jnz LAB_1000_7cb0
    mov AX,0eh
    push AX
    sub AX,AX
    push AX
    call sub_19EB6
    add SP,4h
LAB_1000_7cb0:
    test byte ptr [_word_336E8],3h
    jnz LAB_1000_7ce7
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_335C4 + 6]
    mov CL,5h
    shl AX,CL
    cmp AX,word ptr [BP + -10h]
    jbe LAB_1000_7ce7
    mov AX,1h
    push AX
    mov AX,0ah
    push AX
    call makeSound
    add SP,4h
    mov AX,2h
    push AX
    push word ptr [BP + -1ch]
    call sub_11BC3
    add SP,4h
LAB_1000_7ce7:
    cmp word ptr [BP + -6h],0h
    jnz LAB_1000_7cf0
    jmp LAB_1000_7e48
LAB_1000_7cf0:
    cmp word ptr [BP + -4h],0h
    jnz LAB_1000_7cf9
    jmp LAB_1000_7e48
LAB_1000_7cf9:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BP + -6h]
    sub AX,word ptr [BX + offset _stru_335C4 + 8]
    mov word ptr [BP + -1ah],AX
    cmp word ptr [BP + -1ch],8h
    jge LAB_1000_7d32
    mov AH,byte ptr [word_330B8]
    sub AL,AL
    add AH,1h
    push AX
    mov AX,word ptr [word_330B8]
    inc AX
    neg AX
    mov CH,AL
    sub CL,CL
    push CX
    push word ptr [BP + -1ah]
    call _sub_1CF64
    add SP,6h
    mov word ptr [BP + -1ah],AX
LAB_1000_7d32:
    mov AX,12h
    imul word ptr [BP + -12h]
    mov BX,AX
    mov SI,word ptr [BX + offset _sams + 14]
    mov CL,7h
    shl SI,CL
    push SI
    mov AX,SI
    neg AX
    push AX
    push word ptr [BP + -1ah]
    call _sub_1CF64
    add SP,6h
    mov word ptr [BP + -1ah],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,word ptr [BP + -1ah]
    shl AX,1h
    shl AX,1h
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    add word ptr [SI + offset _stru_335C4 + 8],AX
    mov AX,word ptr [BP + -1ah]
    shl AX,1h
    mov word ptr [SI + offset _stru_335C4 + 12],AX
    cmp word ptr [BP + -1ch],8h
    jge LAB_1000_7da4
    cmp word ptr [BP + -10h],400h
    jnc LAB_1000_7da4
    push word ptr [BP + -10h]
    call _abs
    add SP,2h
    push AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BP + -32h]
    sub AX,word ptr [BX + offset _stru_335C4 + 4]
    mov CL,4h
    sar AX,CL
    jmp LAB_1000_7de7
    db 90h
LAB_1000_7da4:
    push word ptr [BP + -10h]
    call _abs
    add SP,2h
    push AX
    push word ptr [BP + -10h]
    call _abs
    add SP,2h
    cmp AX,140h
    jle LAB_1000_7dcc
    push word ptr [BP + -10h]
    call _abs
    add SP,2h
    mov CL,3h
    sar AX,CL
    jmp LAB_1000_7dce
    db 90h
LAB_1000_7dcc:
    sub AX,AX
LAB_1000_7dce:
    mov CX,AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BP + -32h]
    sub AX,word ptr [BX + offset _stru_335C4 + 4]
    mov DX,CX
    mov CL,5h
    sar AX,CL
    add AX,DX
LAB_1000_7de7:
    push AX
    call _sub_1D008
    add SP,4h
    mov word ptr [BP + -6h],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BP + -6h]
    sub AX,word ptr [BX + offset _stru_335C4 + 10]
    mov word ptr [BP + -24h],AX
    mov AX,12h
    imul word ptr [BP + -12h]
    mov BX,AX
    mov SI,word ptr [BX + offset _sams + 14]
    mov AX,SI
    mov CL,9h
    shl AX,CL
    push AX
    mov AX,SI
    mov CL,0bh
    shl AX,CL
    neg AX
    push AX
    push word ptr [BP + -24h]
    call _sub_1CF64
    add SP,6h
    mov word ptr [BP + -24h],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BP + -24h]
    shl AX,1h
    shl AX,1h
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    add word ptr [BX + offset _stru_335C4 + 10],AX
    jmp LAB_1000_7e74
    db 90h
LAB_1000_7e48:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    add SI,0d1eh
    cmp word ptr [SI],0h
    jle LAB_1000_7e74
    cmp word ptr [BP + -22h],1eh
    jz LAB_1000_7e74
    push word ptr [SI]
    call _sub_1D1C8
    add SP,2h
    mov CL,0ch
    shl AX,CL
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    sub word ptr [SI],AX
LAB_1000_7e74:
    cmp word ptr [BP + -22h],1ch
    jnz LAB_1000_7e90
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    add SI,0d1eh
    cmp word ptr [SI],0f800h
    jle LAB_1000_7e90
    mov word ptr [SI],0f800h
LAB_1000_7e90:
    cmp word ptr [BP + -22h],1eh
    jz LAB_1000_7ea5
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    cmp word ptr [BX + offset _stru_335C4 + 4],1h
    jnz LAB_1000_7ec9
LAB_1000_7ea5:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,800h
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    sub word ptr [SI + offset _stru_335C4 + 10],AX
    mov AX,word ptr [SI + offset _stru_335C4 + 22]
    cmp word ptr [SI + offset _stru_335C4 + 10],AX
    jge LAB_1000_7ec9
    mov word ptr [SI + offset _stru_335C4 + 10],AX
LAB_1000_7ec9:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    push word ptr [SI + offset _stru_335C4 + 6]
    push word ptr [SI + offset _stru_335C4 + 10]
    call _sub_1D190
    add SP,4h
    mov CL,3h
    shl AX,CL
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    mov word ptr [BP + -16h],AX
    cmp word ptr [BP + -22h],1eh
    jnz LAB_1000_7f0e
    mov CX,2h
    cwd
    idiv CX
    mov word ptr [BP + -16h],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_335C4 + 6]
    mov CL,7h
    shl AX,CL
    jmp LAB_1000_7f1c
LAB_1000_7f0e:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AH,byte ptr [SI + offset _stru_335C4 + 6]
    sub AL,AL
LAB_1000_7f1c:
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    push AX
    push word ptr [SI + offset _stru_335C4 + 10]
    call _sub_1D178
    add SP,4h
    add word ptr [SI + offset _stru_335C4 + 4],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    push word ptr [BP + -16h]
    push word ptr [SI + offset _stru_335C4 + 8]
    call _sub_1D178
    add SP,4h
    add word ptr [SI + offset _stru_335C4],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    push word ptr [BP + -16h]
    push word ptr [SI + offset _stru_335C4 + 8]
    call _sub_1D190
    add SP,4h
    sub word ptr [SI + offset _stru_335C4 + 2],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    dec word ptr [BX + offset _stru_335C4 + 14]
    cmp word ptr [BP + -1ch],8h
    jge LAB_1000_7f99
    cmp word ptr [BP + -4h],0h
    jnz LAB_1000_7f8c
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    and byte ptr [BX + offset _stru_335C4 + 4],0feh
    jmp LAB_1000_7f99
    db 90h
LAB_1000_7f8c:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    or byte ptr [BX + offset _stru_335C4 + 4],1h
LAB_1000_7f99:
    mov byte ptr [_var_315],0h
    mov AL,byte ptr [BP + -1ch]
    and AL,3h
    mov CL,byte ptr [_word_336E8]
    and CL,3h
    cmp AL,CL
    jnz LAB_1000_7fc8
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    push word ptr [SI + offset _stru_335C4 + 4]
    push word ptr [SI + offset _stru_335C4 + 2]
    push word ptr [SI + offset _stru_335C4]
    call sub_18DF4
    add SP,6h
LAB_1000_7fc8:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    cmp word ptr [BX + offset _stru_335C4 + 4],0h
    jl LAB_1000_7fe1
    cmp byte ptr [_var_315],0h
    jnz LAB_1000_7fe1
    jmp LAB_1000_81a3
LAB_1000_7fe1:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_335C4]
    mov word ptr [word_3BEBC],AX
    mov AX,word ptr [SI + offset _stru_335C4 + 2]
    mov word ptr [word_3BEC8],AX
    mov AX,word ptr [SI + offset _stru_335C4 + 4]
    mov word ptr [word_3BECE],AX
    mov word ptr [word_39606],0fffdh
    mov AX,word ptr [SI + offset _stru_335C4 + 14]
    mov word ptr [word_3B7DE],AX
    mov word ptr [SI + offset _stru_335C4 + 14],0h
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,1ah
    imul word ptr [BX + offset _stru_335C4 + 18]
    add AX,820h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    cmp word ptr [BP + -22h],1eh
    jz LAB_1000_8043
    cmp word ptr [BP + -22h],1dh
    jz LAB_1000_8043
    cmp word ptr [BP + -22h],1ch
    jz LAB_1000_8043
    jmp LAB_1000_8172
LAB_1000_8043:
    mov AX,1h
    push AX
    sub AX,AX
    push AX
    call sub_11BFD
    add SP,4h
    mov AX,2h
    push AX
    push AX
    call makeSound
    add SP,4h
    mov AX,offset aMisses
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov SI,word ptr [word_3C020]
    mov CL,4h
    shl SI,CL
    mov AX,word ptr [word_3BEC8]
    sub AX,word ptr [SI + offset _stru_3AA5E + 2]
    push AX
    mov AX,word ptr [word_3BEBC]
    sub AX,word ptr [SI + offset _stru_3AA5E]
    push AX
    call _sub_1CFA6
    add SP,4h
    mov word ptr [BP + -0eh],AX
    mov AX,100h
    cwd
    mov CX,word ptr [word_330B8]
    inc CX
    idiv CX
    cmp AX,word ptr [BP + -0eh]
    jbe LAB_1000_80aa
    push word ptr [word_3C020]
    call sub_187EA
    add SP,2h
    mov AX,offset aDestroyedBy
    jmp LAB_1000_813b
LAB_1000_80aa:
    push word ptr [word_3BEC8]
    push word ptr [word_3BEBC]
    call sub_1C6BE
    add SP,4h
    mov word ptr [BP + -36h],AX
    db 3Dh, 0FFh, 0FFh ; cmp AX,0ffffh (force imm16 encoding)
    jnz LAB_1000_80c3
    jmp LAB_1000_8199
LAB_1000_80c3:
    mov BX,AX
    mov CL,4h
    shl BX,CL
    test byte ptr [BX + offset _stru_3AA5E + 6],80h
    jz LAB_1000_80d3
    jmp LAB_1000_8199
LAB_1000_80d3:
    mov BX,word ptr [word_39808]
    mov AX,word ptr [BX + 4h]
    mov DX,word ptr [BX + 6h]
    mov CL,5h
LAB_1000_80df:
    sar DX,1h
    rcr AX,1h
    dec CL
    jnz LAB_1000_80df
    mov word ptr [BP + -26h],AX
    mov BX,word ptr [word_39808]
    mov AX,word ptr [BX + 8h]
    mov DX,word ptr [BX + 0ah]
    mov CL,5h
LAB_1000_80f6:
    sar DX,1h
    rcr AX,1h
    dec CL
    jnz LAB_1000_80f6
    sub AX,8000h
    neg AX
    mov word ptr [BP + -2ch],AX
    mov AX,word ptr [word_3BEC8]
    sub AX,word ptr [BP + -2ch]
    push AX
    mov AX,word ptr [word_3BEBC]
    sub AX,word ptr [BP + -26h]
    push AX
    call _sub_1CFA6
    add SP,4h
    mov word ptr [BP + -0eh],AX
    mov AX,180h
    cwd
    mov CX,word ptr [word_330B8]
    add CX,2h
    idiv CX
    cmp AX,word ptr [BP + -0eh]
    jbe LAB_1000_8199
    push word ptr [BP + -36h]
    call sub_187EA
    add SP,2h
    mov AX,offset aDestroyedBy_0
LAB_1000_813b:
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,1ah
    imul word ptr [BX + offset _stru_335C4 + 18]
    add AX,820h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov word ptr [word_39606],8h
    mov word ptr [word_3BECE],0h
    jmp LAB_1000_8199
    db 90h
LAB_1000_8172:
    cmp word ptr [BP + -1ch],8h
    jl LAB_1000_81a3
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [_word_330C4]
    shl AX,1h
    cmp word ptr [BX + offset _stru_335C4 + 14],AX
    jle LAB_1000_81a3
    mov AX,offset aGroundImpact
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
LAB_1000_8199:
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
LAB_1000_81a3:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,word ptr [BP + -32h]
    sub AX,word ptr [SI + offset _stru_335C4 + 4]
    push AX
    call _abs
    add SP,2h
    mov CL,5h
    sar AX,CL
    add AX,word ptr [BP + -10h]
    mov CX,AX
    mov AX,word ptr [SI + offset _stru_335C4 + 6]
    mov DX,CX
    mov CL,4h
    shl AX,CL
    mov CX,DX
    cwd
    mov BX,word ptr [_word_330C4]
    idiv BX
    cmp CX,AX
    jc LAB_1000_81dc
    jmp LAB_1000_83ac
LAB_1000_81dc:
    cmp word ptr [BP + -4h],0h
    jnz LAB_1000_81e5
    jmp LAB_1000_83ac
LAB_1000_81e5:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_335C4]
    mov word ptr [word_3BEBC],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_335C4 + 2]
    mov word ptr [word_3BEC8],AX
    mov AX,word ptr [SI + offset _stru_335C4 + 4]
    mov word ptr [word_3BECE],AX
    mov word ptr [word_39606],8h
    cmp word ptr [SI + offset _stru_335C4 + 14],0h
    jz LAB_1000_821e
    mov AX,word ptr [SI + offset _stru_335C4 + 14]
    mov word ptr [word_3B7DE],AX
LAB_1000_821e:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov word ptr [BX + offset _stru_335C4 + 14],0h
    cmp word ptr [BP + -1ch],8h
    jge LAB_1000_82ac
    cmp word ptr [word_333DA],0h
    jz LAB_1000_823c
    jmp LAB_1000_83ac
LAB_1000_823c:
    mov AX,offset aHitBy
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,12h
    imul word ptr [BP + -12h]
    add AX,528h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    call sub_18A44
    mov AX,word ptr [_word_336E8]
    sar AX,1h
    db 25h, 07h, 00h ; and AX,7h (force imm16 encoding)
    mov word ptr [BP + -34h],AX
    mov SI,AX
    mov CL,3h
    shl SI,CL
    mov AX,word ptr [word_3BEBC]
    mov word ptr [SI + offset stru_33402],AX
    mov AX,word ptr [word_3BEC8]
    mov word ptr [SI + offset stru_33402 + 2],AX
    mov AX,word ptr [word_3BECE]
    mov word ptr [SI + offset stru_33402 + 4],AX
    test word ptr [_planeFlags],1000h
    jz LAB_1000_829c
    jmp LAB_1000_83ac
LAB_1000_829c:
    push word ptr [BP + -12h]
    mov AX,5h
    push AX
    call sub_11D10
    add SP,4h
    jmp LAB_1000_83ac
LAB_1000_82ac:
    cmp word ptr [BP + -22h],7h
    jnz LAB_1000_8306
    push word ptr [BP + -14h]
    call sub_186F8
    add SP,2h
    mov AX,word ptr [_word_336E8]
    sar AX,1h
    db 25h, 07h, 00h ; and AX,7h (force imm16 encoding)
    mov word ptr [BP + -34h],AX
    mov AX,24h
    imul word ptr [BP + -14h]
    mov SI,AX
    mov DI,word ptr [BP + -34h]
    mov CL,3h
    shl DI,CL
    mov AX,word ptr [SI + offset word_3B204]
    mov word ptr [word_3BEBC],AX
    mov word ptr [DI + offset stru_33402],AX
    mov AX,word ptr [SI + offset word_3B206]
    mov word ptr [word_3BEC8],AX
    mov word ptr [DI + offset stru_33402 + 2],AX
    mov AX,24h
    imul word ptr [BP + -14h]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_3B208]
    mov word ptr [word_3BECE],AX
    mov BX,word ptr [BP + -34h]
    shl BX,CL
    mov word ptr [BX + offset stru_33402 + 4],AX
    jmp LAB_1000_8380
    db 90h
LAB_1000_8306:
    mov AX,4h
    push AX
    call randlmul
    add SP,2h
    push word ptr [BP + -14h]
    mov CX,AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    push word ptr [BX + offset _stru_335C4 + 18]
    mov SI,CX
    call sub_1A224
    add SP,4h
    cmp AX,SI
    jg LAB_1000_8340
    mov AX,word ptr [_word_330C4]
    mov CX,AX
    shl AX,1h
    shl AX,1h
    add AX,CX
    shl AX,1h
    cmp AX,word ptr [word_3B7DE]
    ja LAB_1000_834c
LAB_1000_8340:
    push word ptr [BP + -14h]
    call sub_187EA
    add SP,2h
    jmp LAB_1000_835a
    db 90h
LAB_1000_834c:
    mov AX,offset aIneffective
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
LAB_1000_835a:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov word ptr [BX + offset _stru_335C4 + 14],0h
    mov AX,word ptr [word_3B0AC]
    mov word ptr [word_336F0],AX
    mov AX,word ptr [word_3BEBC]
    mov word ptr [word_3B4D8],AX
    mov AX,word ptr [word_3BEC8]
    mov word ptr [word_3B4E0],AX
    mov word ptr [word_3B5D6],0bb8h
LAB_1000_8380:
    mov AX,offset aHitBy_0
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,12h
    imul word ptr [BP + -12h]
    add AX,528h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
LAB_1000_83ac:
    cmp word ptr [BP + -1ch],8h
    jge LAB_1000_83f4
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    cmp word ptr [SI + offset _stru_335C4 + 14],0h
    jz LAB_1000_83f4
    push word ptr [SI + offset _stru_335C4 + 2]
    push word ptr [SI + offset _stru_335C4]
    call sub_19A4D
    add SP,4h
    mov word ptr [SI + offset _stru_335C4 + 20],AX
    test byte ptr [_word_336E8],1h
    jz LAB_1000_83f4
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,0eh
    push AX
    push word ptr [SI + offset _stru_335C4 + 2]
    push word ptr [SI + offset _stru_335C4]
    call sub_1993A
    add SP,6h
LAB_1000_83f4:
    inc word ptr [BP + -1ch]
LAB_1000_83f7:
    cmp word ptr [BP + -1ch],0ch
    jl LAB_1000_8400
    jmp LAB_1000_85b8
LAB_1000_8400:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    cmp word ptr [SI + offset _stru_335C4 + 14],0h
    jz LAB_1000_83f4
    mov AX,word ptr [SI + offset _stru_335C4 + 16]
    mov word ptr [BP + -12h],AX
    mov word ptr [BP + -4h],0h
    mov word ptr [BP + -6h],0h
    mov AX,12h
    imul word ptr [BP + -12h]
    mov BX,AX
    mov AX,word ptr [BX + offset _sams + 12]
    mov word ptr [BP + -22h],AX
    cmp word ptr [BP + -1ch],8h
    jl LAB_1000_8438
    jmp LAB_1000_7a38
LAB_1000_8438:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    push word ptr [SI + offset _stru_335C4 + 20]
    push word ptr [SI + offset _stru_335C4 + 2]
    push word ptr [SI + offset _stru_335C4]
    call sub_1993A
    add SP,6h
    mov AX,word ptr [_var_547]
    mov word ptr [BP + -32h],AX
    push word ptr [BP + -22h]
    push AX
    push word ptr [BP + -30h]
    push word ptr [BP + -2ah]
    push word ptr [BP + -1ch]
    call sub_185BE
    add SP,0ah
    mov word ptr [BP + -4h],AX
    mov AX,word ptr [_var_669]
    mov word ptr [BP + -10h],AX
    mov AX,word ptr [_var_670]
    mov word ptr [BP + -6h],AX
    mov word ptr [BP + -20h],1h
LAB_1000_847f:
    mov BX,word ptr [BP + -20h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    shl BX,1h
    db 83h, 0bfh, 28h, 0bh, 01h  ; CMP word ptr [BX + 0...,0x1                 ;= ??
    jnz LAB_1000_8499
    cmp word ptr [BP + -22h],0h
    jle LAB_1000_84f2
LAB_1000_8499:
    mov BX,word ptr [BP + -20h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    shl BX,1h
    db 83h, 0bfh, 28h, 0bh, 02h  ; CMP word ptr [BX + 0...,0x2                 ;= ??
    jnz LAB_1000_8528
    cmp word ptr [BP + -22h],1h
    jz LAB_1000_84f2
    cmp word ptr [BP + -22h],2h
    jz LAB_1000_84f2
    cmp word ptr [BP + -22h],3h
    jnz LAB_1000_8528
    mov AX,word ptr [BP + -6h]
    sub AX,word ptr [_var_542]
    mov CL,8h
    sar AX,CL
    push AX
    call _abs
    add SP,2h
    db 2Dh, 40h, 00h ; sub AX,40h (force imm16 encoding)
    push AX
    call _abs
    add SP,2h
    mov CX,word ptr [word_330B8]
    mov DX,CX
    shl CX,1h
    add CX,DX
    shl CX,1h
    shl CX,1h
    sub CX,40h
    neg CX
    cmp CX,AX
    jle LAB_1000_8528
LAB_1000_84f2:
    mov AX,word ptr [BP + -20h]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    shl AX,1h
    mov SI,AX
    push word ptr [BP + -22h]
    push word ptr [_var_547]
    push word ptr [SI + offset word_333D4]
    push word ptr [SI + offset word_333D2]
    push word ptr [BP + -1ch]
    call sub_185BE
    add SP,0ah
    mov word ptr [BP + -2h],AX
    or AX,AX
    jz LAB_1000_8528
    mov word ptr [BP + -6h],AX
    mov word ptr [BP + -4h],0h
LAB_1000_8528:
    inc word ptr [BP + -20h]
    cmp word ptr [BP + -20h],4h
    jge LAB_1000_8534
    jmp LAB_1000_847f
LAB_1000_8534:
    cmp word ptr [BP + -10h],200h
    jbe LAB_1000_8585
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov SI,word ptr [BX + offset _stru_335C4 + 22]
    cmp SI,2h
    jle LAB_1000_855e
    mov BX,SI
    mov CL,4h
    shl BX,CL
    test byte ptr [BX + offset _stru_3AA5E + 6],10h
    jnz LAB_1000_855e
    mov word ptr [BP + -4h],0h
LAB_1000_855e:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov SI,word ptr [BX + offset _stru_335C4 + 22]
    or SI,SI
    jg LAB_1000_8585
    mov AX,SI
    neg AX
    mov CX,24h
    imul CX
    mov BX,AX
    test byte ptr [BX + offset _stru_3B208 + 18],8h
    jnz LAB_1000_8585
    mov word ptr [BP + -4h],0h
LAB_1000_8585:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    add SI,0d1ah
    mov AX,12h
    imul word ptr [BP + -12h]
    mov BX,AX
    mov AX,word ptr [BX + offset _sams + 10]
    mov CL,6h
    sar AX,CL
    cmp AX,word ptr [SI]
    jg LAB_1000_85a8
    jmp LAB_1000_7c47
LAB_1000_85a8:
    test byte ptr [_word_336E8],1h
    jnz LAB_1000_85b2
    jmp LAB_1000_7c47
LAB_1000_85b2:
    inc word ptr [SI]
    jmp LAB_1000_7c47
    db 90h
LAB_1000_85b8:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
sub_179EE endp
; ------------------------------seg000:0x85bd------------------------------
; ------------------------------seg000:0x85be------------------------------
sub_185BE proc near
    push BP
    mov BP,SP
    sub SP,8h
    push SI
    mov AX,18h
    imul word ptr [BP + 4h]
    mov SI,AX
    mov AX,word ptr [BP + 6h]
    sub AX,word ptr [SI + offset _stru_335C4]
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [BP + 8h]
    sub AX,word ptr [SI + offset _stru_335C4 + 2]
    mov word ptr [BP + -8h],AX
    push AX
    push word ptr [BP + -6h]
    call _sub_1CFA6
    add SP,4h
    mov word ptr [BP + -4h],AX
    mov AX,word ptr [BP + -8h]
    neg AX
    push AX
    push word ptr [BP + -6h]
    call _sub_1D008
    add SP,4h
    mov word ptr [_var_670],AX
    mov AX,18h
    imul word ptr [BP + 4h]
    mov BX,AX
    mov AX,18h
    imul word ptr [BX + offset _stru_335C4 + 6]
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    cmp AX,word ptr [BP + -4h]
    jle LAB_1000_862a
LAB_1000_861b:
    mov AX,word ptr [BP + -4h]
    mov word ptr [_var_669],AX
    mov AX,1h
    pop SI
    mov SP,BP
    pop BP
    ret
    db 90h
LAB_1000_862a:
    mov AX,18h
    imul word ptr [BP + 4h]
    mov BX,AX
    mov AX,word ptr [_var_670]
    sub AX,word ptr [BX + offset _stru_335C4 + 8]
    push AX
    call _abs
    add SP,2h
    mov word ptr [BP + -2h],AX
    cmp AX,1000h
    jle LAB_1000_8694
    cmp word ptr [BP + 0ch],3h
    jz LAB_1000_8694
    cmp AX,6000h
    jle LAB_1000_868d
    cmp word ptr [BP + 4h],8h
    jge LAB_1000_868d
    mov AX,18h
    imul word ptr [BP + 4h]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_335C4 + 6]
    mov CL,4h
    shl AX,CL
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    cmp AX,word ptr [BP + -4h]
    jge LAB_1000_868d
    mov AX,CX
    mov CL,4h
    shl AX,CL
    push AX
    sub AX,AX
    push AX
    push word ptr [SI + offset _stru_335C4 + 14]
    call _sub_1CF64
    add SP,6h
    mov word ptr [SI + offset _stru_335C4 + 14],AX
LAB_1000_868d:
    sub AX,AX
    pop SI
    mov SP,BP
    pop BP
    ret
LAB_1000_8694:
    cmp word ptr [BP + 0ch],0h
    jnz LAB_1000_86b6
    mov AX,18h
    imul word ptr [BP + 4h]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_335C4 + 8]
    sub AX,word ptr [_var_542]
    push AX
    call _abs
    add SP,2h
    cmp AX,2000h
    jg LAB_1000_868d
LAB_1000_86b6:
    cmp word ptr [BP + 0ch],0h
    jnz LAB_1000_86bf
    jmp LAB_1000_861b
LAB_1000_86bf:
    mov AX,18h
    imul word ptr [BP + 4h]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_335C4 + 8]
    sub AX,word ptr [_var_542]
    push AX
    call _abs
    add SP,2h
    mov word ptr [BP + -2h],AX
    sub AX,4000h
    push AX
    call _abs
    add SP,2h
    mov DX,word ptr [word_330B8]
    mov CL,0bh
    shl DX,CL
    sub DX,2000h
    neg DX
    cmp AX,DX
    jl LAB_1000_868d
    jmp LAB_1000_861b
sub_185BE endp
; ------------------------------seg000:0x86f5------------------------------
; ------------------------------seg000:0x86f8------------------------------
sub_186F8 proc near
    push BP
    mov BP,SP
    sub SP,2h
    push SI
    mov AX,24h
    imul word ptr [BP + 4h]
    mov SI,AX
    test byte ptr [SI + offset _stru_3B208 + 18],20h
    jz LAB_1000_8711
    jmp LAB_1000_87a6
LAB_1000_8711:
    mov BX,word ptr [SI + offset _stru_3B208 + 16]
    mov CL,5h
    shl BX,CL
    inc word ptr [BX + offset aFlogger + 22]
    test word ptr [SI + offset _stru_3B208 + 18],800h
    jz LAB_1000_8729
    dec word ptr [word_3C044]
LAB_1000_8729:
    mov AX,word ptr [_word_336FC]
    cmp word ptr [BP + 4h],AX
    jnz LAB_1000_8737
    mov word ptr [_word_336FC],0ffffh
LAB_1000_8737:
    mov AX,24h
    imul word ptr [BP + 4h]
    mov SI,AX
    or byte ptr [SI + offset _stru_3B208 + 18],20h
    mov word ptr [word_336F6],0ffffh
    mov AX,word ptr [SI + offset word_3B204]
    mov word ptr [word_3BEC2],AX
    mov AX,word ptr [SI + offset word_3B206]
    mov word ptr [word_3BED6],AX
    mov AX,word ptr [SI + offset _stru_3B208]
    mov word ptr [word_3BFA2],AX
    mov word ptr [word_3B4DC],80h
    mov word ptr [BP + -2h],3h
    test word ptr [SI + offset _stru_3B208 + 18],4000h
    jz LAB_1000_8778
    mov AX,80h
    jmp LAB_1000_877a
    db 90h
LAB_1000_8778:
    sub AX,AX
LAB_1000_877a:
    add AX,word ptr [SI + offset _stru_3B208 + 16]
    push AX
    mov AX,3h
    push AX
    call sub_11D10
    add SP,4h
    mov AX,24h
    imul word ptr [BP + 4h]
    mov BX,AX
    cmp word ptr [BX + offset _stru_3B208 + 20],0h
    jnz LAB_1000_87a6
    mov AX,24h
    imul word ptr [BP + 4h]
    mov BX,AX
    and word ptr [BX + offset _stru_3B208 + 18],1c1h
LAB_1000_87a6:
    mov AX,24h
    imul word ptr [BP + 4h]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_3B208 + 16]
    mov CL,5h
    shl AX,CL
    add AX,2c8h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,2h
    push AX
    push AX
    call makeSound
    add SP,4h
    cmp word ptr [_word_3C45C],1h
    jnz LAB_1000_87e4
    mov AX,word ptr [_word_336F2]
    cmp word ptr [BP + 4h],AX
    jnz LAB_1000_87e4
    mov word ptr [_word_39604],1h
LAB_1000_87e4:
    pop SI
    mov SP,BP
    pop BP
    ret
    nop
sub_186F8 endp
; ------------------------------seg000:0x87e8------------------------------
; ------------------------------seg000:0x87ea------------------------------
sub_187EA proc near
    push BP
    mov BP,SP
    sub SP,6h
    push SI
    push word ptr [BP + 4h]
    call placeString
    add SP,2h
    mov word ptr [BP + -2h],1h
    mov BX,word ptr [BP + 4h]
    mov CL,4h
    shl BX,CL
    mov SI,word ptr [BX + offset _stru_3AA5E + 6]
    mov AX,SI
    test AL,80h
    jz LAB_1000_8813
    jmp LAB_1000_895f
LAB_1000_8813:
    test AX,1000h
    jz LAB_1000_881c
    dec word ptr [word_3C048]
LAB_1000_881c:
    mov SI,word ptr [BP + 4h]
    mov CL,4h
    shl SI,CL
    mov AX,word ptr [SI + offset _stru_3AA5E + 2]
    sub DX,DX
    sub AX,8000h
    sbb DX,DX
    neg AX
    adc DX,0h
    neg DX
    mov CL,5h
LAB_1000_8837:
    shl AX,1h
    rcl DX,1h
    dec CL
    jnz LAB_1000_8837
    push DX
    push AX
    mov AX,word ptr [SI + offset _stru_3AA5E]
    sub DX,DX
    mov CL,5h
LAB_1000_8849:
    shl AX,1h
    rcl DX,1h
    dec CL
    jnz LAB_1000_8849
    push DX
    push AX
    call sub_12FDA
    add SP,8h
    mov word ptr [word_39808],AX
    cmp word ptr [BP + 4h],0h
    jnz LAB_1000_8865
    jmp LAB_1000_88f8
LAB_1000_8865:
    mov BX,word ptr [BP + 4h]
    mov CL,4h
    shl BX,CL
    cmp word ptr [BX + offset _stru_3AA5E + 4],0h
    jnz LAB_1000_8878
    mov word ptr [BP + -2h],0ch
LAB_1000_8878:
    mov SI,word ptr [BP + 4h]
    mov CL,4h
    shl SI,CL
    or byte ptr [SI + offset _stru_3AA5E + 6],80h
    mov word ptr [SI + offset _stru_3AA5E + 4],0h
    mov word ptr [BP + -4h],0h
    jmp LAB_1000_88b2
    db 90h
LAB_1000_8892:
    mov AX,80h
LAB_1000_8895:
    or word ptr [BP + -2h],AX
    mov AX,word ptr [_word_336E8]
    add AX,word ptr [_word_330C4]
    mov word ptr [word_336EE],AX
    mov AX,2h
    push AX
    sub AX,AX
    push AX
    call makeSound
    add SP,4h
LAB_1000_88af:
    inc word ptr [BP + -4h]
LAB_1000_88b2:
    cmp word ptr [BP + -4h],2h
    jge LAB_1000_88de
    mov AX,12h
    imul word ptr [BP + -4h]
    mov BX,AX
    mov AX,word ptr [BP + 4h]
    cmp word ptr [BX + offset word_3B146],AX
    jnz LAB_1000_88af
    push word ptr [BP + -4h]
    call sub_189AA
    add SP,2h
    cmp word ptr [BP + -4h],0h
    jz LAB_1000_8892
    mov AX,40h
    jmp LAB_1000_8895
    db 90h
LAB_1000_88de:
    push word ptr [BP + 4h]
    push word ptr [BP + -2h]
    call sub_11D10
    add SP,4h
    push word ptr [BP + 4h]
    call sub_1C864
    add SP,2h
    mov word ptr [BP + -6h],AX
    jmp LAB_1000_8941
LAB_1000_88f8:
    push word ptr [BP + 4h]
    call sub_1C8A4
    add SP,2h
    or AX,AX
    jz LAB_1000_890a
    mov AL,byte ptr [_byte_3BEC4]
    jmp LAB_1000_890d
LAB_1000_890a:
    mov AL,byte ptr [_byte_3C02A]
LAB_1000_890d:
    cbw
    mov word ptr [BP + -6h],AX
    mov BX,word ptr [word_39808]
    mov SI,word ptr [BX]
    cmp AX,SI
    jz LAB_1000_892f
    inc byte ptr [SI + offset _byte_3BED8]
    mov BX,word ptr [word_39808]
    push word ptr [BX]
    mov AX,2h
    push AX
    call sub_11D10
    add SP,4h
LAB_1000_892f:
    or byte ptr [BP + -5h],1h
    mov BX,word ptr [BP + 4h]
    mov CL,4h
    shl BX,CL
    mov AX,word ptr [BP + -6h]
    mov word ptr [BX + offset _stru_3AA5E + 12],AX
LAB_1000_8941:
    cmp word ptr [word_39808],0h
    jz LAB_1000_895f
    push word ptr [BP + -6h]
    push word ptr [BP + -6h]
    call sub_1CF32
    add SP,2h
    push AX
    push word ptr [word_39808]
    call sub_13224
    add SP,6h
LAB_1000_895f:
    mov AX,word ptr [BP + 4h]
    mov word ptr [word_336F6],AX
    mov AX,2h
    push AX
    push AX
    call makeSound
    add SP,4h
    cmp word ptr [_word_3C45C],2h
    jnz LAB_1000_8985
    mov AX,word ptr [_word_336F4]
    cmp word ptr [BP + 4h],AX
    jnz LAB_1000_8985
    mov word ptr [_word_39604],1h
LAB_1000_8985:
    cmp word ptr [_word_3C09A],0h
    jnz LAB_1000_899a
    push word ptr [_word_3BED0]
    push word ptr [_word_3BEC0]
    call _sub_195C9
    add SP,4h
LAB_1000_899a:
    cmp word ptr [word_330B8],2h
    jge LAB_1000_89a4
    call sub_166BE
LAB_1000_89a4:
    pop SI
    mov SP,BP
    pop BP
    ret
    nop
sub_187EA endp
; ------------------------------seg000:0x89a8------------------------------
; ------------------------------seg000:0x89aa------------------------------
sub_189AA proc near
    push BP
    mov BP,SP
    push SI
    mov AX,4000h
    mov CL,byte ptr [BP + 4h]
    sar AX,CL
    test word ptr [_planeFlags],AX
    jz LAB_1000_89c2
    sub AX,AX
    pop SI
    pop BP
    ret
    db 90h
LAB_1000_89c2:
    mov AX,12h
    imul word ptr [BP + 4h]
    mov BX,AX
    mov SI,word ptr [BX + offset _word_3B144]
    cmp SI,4h
    jz LAB_1000_89d8
    cmp SI,3h
    jnz LAB_1000_89f3
LAB_1000_89d8:
    sub AX,AX
    push AX
    cmp word ptr [BP + 4h],AX
    jz LAB_1000_89e6
    mov AX,40h
    jmp LAB_1000_89e9
    db 90h
LAB_1000_89e6:
    mov AX,80h
LAB_1000_89e9:
    db 05h, 0Bh, 00h ; add AX,0bh (force imm16 encoding)
    push AX
    call sub_11D10
    add SP,4h
LAB_1000_89f3:
    cmp word ptr [BP + 4h],0h
    jz LAB_1000_8a14
    mov AX,offset aSecond_Target
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov word ptr [_waypointIndex],1h
    or byte ptr [_var_730],20h
    jmp LAB_1000_8a2d
LAB_1000_8a14:
    mov AX,offset aPrimaryTarget_0
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov word ptr [_waypointIndex],2h
    or byte ptr [_var_730],40h
LAB_1000_8a2d:
    mov AX,word ptr [_planeFlags]
    and AX,6000h
    cmp AX,6000h
    jnz LAB_1000_8a3e
    mov word ptr [_waypointIndex],3h
LAB_1000_8a3e:
    mov AX,1h
    pop SI
    pop BP
    ret
sub_189AA endp
; ------------------------------seg000:0x8a43------------------------------
; ------------------------------seg000:0x8a44------------------------------
sub_18A44 proc near
    push BP
    mov BP,SP
    sub SP,2h
    test word ptr [_planeFlags],1000h
    jnz LAB_1000_8aa1
    cmp word ptr [_word_336EA],-1h
    jz LAB_1000_8aa1
    mov word ptr [BP + -2h],0h
    jmp LAB_1000_8a7c
LAB_1000_8a60:
    mov AX,8h
    push AX
    call randlmul
    add SP,2h
    mov CX,AX
    mov AX,1h
    shl AX,CL
    or word ptr [word_33096],AX
    inc word ptr [word_3BF90]
    inc word ptr [BP + -2h]
LAB_1000_8a7c:
    mov AX,word ptr [word_330B8]
    cmp word ptr [BP + -2h],AX
    jle LAB_1000_8a60
    mov AX,16h
    push AX
    call sub_1957A
    add SP,2h
    mov word ptr [_word_38FEA],1h
    mov AX,2h
    push AX
    sub AX,AX
    push AX
    call makeSound
    add SP,4h
LAB_1000_8aa1:
    mov SP,BP
    pop BP
    ret
    nop
sub_18A44 endp
; ------------------------------seg000:0x8aa4------------------------------
; ------------------------------seg000:0x8aa6------------------------------
sub_18AA6 proc near
    push BP
    mov BP,SP
    sub SP,8h
    push DI
    push SI
    push word ptr [_var_545]
    call _abs
    add SP,2h
    cmp AX,3000h
    jle LAB_1000_8ac0
    jmp LAB_1000_8dee
LAB_1000_8ac0:
    cmp word ptr [word_33702],0h
    jz LAB_1000_8aca
    jmp LAB_1000_8dee
LAB_1000_8aca:
    cmp word ptr [word_3BE3C],0h
    jz LAB_1000_8ad4
    jmp LAB_1000_8dee
LAB_1000_8ad4:
    mov SI,word ptr [_missileSpecIndex]
    mov CL,2h
    shl SI,CL
    mov AX,word ptr [SI + offset _missileSpecIndex]
    mov word ptr [BP + -6h],AX
    mov AX,1ah
    imul word ptr [BP + -6h]
    mov DI,AX
    mov AX,word ptr [DI + offset _missiles + 22]
    mov word ptr [BP + -2h],AX
    cmp word ptr [SI + offset _missileSpecIndex + 2],0h
    jnz LAB_1000_8b22
    mov AX,DI
    add AX,820h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,offset a0
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call sub_1A204
    jmp LAB_1000_8deb
    db 90h
LAB_1000_8b22:
    cmp word ptr [BP + -2h],0h
    jnz LAB_1000_8b2b
    jmp LAB_1000_8dee
LAB_1000_8b2b:
    cmp word ptr [BP + -2h],-1h
    jnz LAB_1000_8b34
    jmp LAB_1000_8dee
LAB_1000_8b34:
    mov BX,word ptr [_missileSpecIndex]
    shl BX,1h
    shl BX,1h
    dec word ptr [BX + offset _missileSpecIndex + 2]
    cmp word ptr [_word_330C2],0h
    jnz LAB_1000_8b4a
    jmp LAB_1000_8be8
LAB_1000_8b4a:
    sub AX,AX
    push AX
    call _sub_19E44
    add SP,2h
    mov BX,word ptr [_missileSpecIndex]
    shl BX,1h
    mov AX,word ptr [BX + offset aA]
    mov word ptr [BP + -4h],AX
    mov AX,offset allocSize
    push AX
    mov AX,word ptr [BP + -4h]
    db 05h, 02h, 00h ; add AX,2h (force imm16 encoding)
    push AX
    mov AX,0beh
    push AX
    mov AX,word ptr [BP + -4h]
    dec AX
    push AX
    call _sub_19E5D
    add SP,8h
    mov AX,0ch
    push AX
    mov AX,0beh
    push AX
    push word ptr [BP + -4h]
    mov BX,word ptr [_missileSpecIndex]
    shl BX,1h
    shl BX,1h
    push word ptr [BX + offset _missileSpecIndex + 2]
    call _sub_1A183
    add SP,8h
    mov AX,1ah
    imul word ptr [BP + -6h]
    add AX,820h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,5947h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,0ah
    push AX
    mov AX,offset unk_3C030
    push AX
    mov BX,word ptr [_missileSpecIndex]
    shl BX,1h
    shl BX,1h
    push word ptr [BX + offset _missileSpecIndex + 2]
    call _itoa
    add SP,6h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call sub_1A204
    add SP,2h
LAB_1000_8be8:
    mov word ptr [BP + -8h],0ffffh
    mov word ptr [BP + -4h],8h
LAB_1000_8bf2:
    mov AX,18h
    imul word ptr [BP + -4h]
    mov BX,AX
    db 83h, 0bfh, 22h, 0dh, 00h  ; CMP word ptr [BX + 0...,0x0                 ;= ??
    jnz LAB_1000_8c07
    mov AX,word ptr [BP + -4h]
    mov word ptr [BP + -8h],AX
LAB_1000_8c07:
    inc word ptr [BP + -4h]
    cmp word ptr [BP + -4h],0ch
    jl LAB_1000_8bf2
    cmp word ptr [BP + -8h],-1h
    jnz LAB_1000_8c19
    jmp LAB_1000_8ddd
LAB_1000_8c19:
    mov AX,18h
    imul word ptr [BP + -8h]
    mov SI,AX
    mov AX,word ptr [_word_3BEC0]
    mov word ptr [SI + offset _stru_335C4], AX
    mov AX,word ptr [_word_3BED0]
    mov word ptr [SI + offset _stru_335C4 + 2], AX
    mov AX,word ptr [_var_547]
    db 2Dh, 14h, 00h ; sub AX,14h (force imm16 encoding)
    mov word ptr [SI + offset _stru_335C4 + 4], AX
    mov AX,word ptr [word_3A944]
    mov CL,0bh
    shr AX,CL
    mov word ptr [SI + offset _stru_335C4 + 6], AX
    mov AX,18h
    imul word ptr [BP + -8h]
    mov SI,AX
    mov AX,word ptr [_var_542]
    mov word ptr [SI + offset _stru_335C4 + 8], AX
    mov AX,word ptr [_var_544]
    mov word ptr [SI + offset _stru_335C4 + 10], AX
    mov AX,word ptr [_var_545]
    mov word ptr [SI + offset _stru_335C4 + 12], AX
    mov AX,12h
    imul word ptr [BP + -2h]
    mov DI,AX
    mov AX,word ptr [DI + offset _sams + 10]
    mov CL,6h
    sar AX,CL
    inc AX
    cwd
    push DX
    push AX
    mov AX,word ptr [_word_330C4]
    cwd
    push DX
    push AX
    cmp word ptr [DI + offset _sams + 12],6h
    jnz LAB_1000_8c86
    mov CL,3h
    jmp LAB_1000_8c88
LAB_1000_8c86:
    mov CL,2h
LAB_1000_8c88:
    sub CL,6h
    neg CL
    mov AX,word ptr [DI + offset _sams + 8]
    cwd
    or CL,CL
    jz LAB_1000_8c9e
LAB_1000_8c96:
    shl AX,1h
    rcl DX,1h
    dec CL
    jnz LAB_1000_8c96
LAB_1000_8c9e:
    push DX
    push AX
    call __aNlmul
    push DX
    push AX
    call __aNldiv
    db 05h, 06h, 00h ; add AX,6h (force imm16 encoding)
    mov word ptr [SI + offset _stru_335C4 + 14], AX
    mov AX,18h
    imul word ptr [BP + -8h]
    mov SI,AX
    add SI,0d22h
    cmp word ptr [SI],6h
    jg LAB_1000_8cc4
    mov word ptr [SI],3e7h
LAB_1000_8cc4:
    mov AX,18h
    imul word ptr [BP + -8h]
    mov SI,AX
    mov AX,word ptr [BP + -2h]
    mov word ptr [SI + offset _stru_335C4 + 16], AX
    mov AX,word ptr [BP + -6h]
    mov word ptr [SI + offset _stru_335C4 + 18], AX
    db 0c7h, 84h, 28h, 0dh, 0ffh, 0ffh  ; MOV word ptr [SI + 0...,0xffff              ;= ??
    cmp word ptr [BP + -2h],1eh
    jz LAB_1000_8cee
    db 81h, 0ach, 1eh, 0dh, 00h, 10h  ; SUB word ptr [SI + 0...,0x1000              ;= ??
    jmp LAB_1000_8d08
LAB_1000_8cee:
    call sub_1C82D
    sub AX,400h
    mov CX,AX
    mov AX,18h
    imul word ptr [BP + -8h]
    mov BX,AX
    mov word ptr [BX + offset _stru_335C4 + 22], CX
    mov AX,word ptr [_word_336F4]
    mov word ptr [word_3C020],AX
LAB_1000_8d08:
    cmp word ptr [_word_336F4],0h
    jl LAB_1000_8d2d
    mov AX,12h
    imul word ptr [BP + -2h]
    mov BX,AX
    cmp word ptr [BX + offset _sams + 12],6h
    jnz LAB_1000_8d2d
    mov AX,18h
    imul word ptr [BP + -8h]
    mov BX,AX
    mov AX,word ptr [_word_336F4]
    mov word ptr [BX + offset _stru_335C4 + 20], AX
LAB_1000_8d2d:
    cmp word ptr [_word_336F4],0h
    jl LAB_1000_8d61
    mov AX,12h
    imul word ptr [BP + -2h]
    mov BX,AX
    cmp word ptr [BX + offset _sams + 12],5h
    jnz LAB_1000_8d61
    mov BX,word ptr [_word_336F4]
    mov CL,4h
    shl BX,CL
    test byte ptr [BX + offset _stru_3AA5E + 6],8h
    jz LAB_1000_8d61
    mov AX,18h
    imul word ptr [BP + -8h]
    mov BX,AX
    mov AX,word ptr [_word_336F4]
    mov word ptr [BX + offset _stru_335C4 + 20], AX
LAB_1000_8d61:
    cmp word ptr [BP + -2h],1dh
    jnz LAB_1000_8d7b
    mov AX,18h
    imul word ptr [BP + -8h]
    mov SI,AX
    db 0c7h, 84h, 1eh, 0dh, 00h, 0c0h  ; MOV word ptr [SI + 0...,0xc000              ;= ??
    db 0c7h, 84h, 1ah, 0dh, 01h, 00h  ; MOV word ptr [SI + 0...,0x1                 ;= ??
LAB_1000_8d7b:
    mov AX,word ptr [BP + -8h]
    mov word ptr [_word_3A940],AX
    mov AX,1ah
    imul word ptr [BP + -6h]
    add AX,820h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,offset aFired
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    mov AX,2h
    push AX
    mov AX,12h
    imul word ptr [BP + -2h]
    mov BX,AX
    cmp word ptr [BX + offset _sams + 8],0h
    jz LAB_1000_8dc6
    mov AX,12h
    jmp LAB_1000_8dc9
    db 90h
LAB_1000_8dc6:
    mov AX,18h
LAB_1000_8dc9:
    push AX
    call makeSound
    add SP,4h
    mov AX,1h
    push AX
    push word ptr [BP + -8h]
    call sub_11BC3
    add SP,4h
LAB_1000_8ddd:
    cmp word ptr [_word_3C09E],15h
    jnz LAB_1000_8dee
    mov AX,15h
    push AX
    call sub_1957A
LAB_1000_8deb:
    add SP,2h
LAB_1000_8dee:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
sub_18AA6 endp
; ------------------------------seg000:0x8df3------------------------------
; ------------------------------seg000:0x8df4------------------------------
sub_18DF4 proc near
    push BP
    mov BP,SP
    mov byte ptr [_var_315],0h
    mov AX,word ptr [BP + 8h]
    cwd
    push DX
    push AX
    mov AX,word ptr [BP + 6h]
    cwd
    sub AX,8000h
    sbb DX,0h
    neg AX
    adc DX,0h
    neg DX
    mov CL,5h
LAB_1000_8e15:
    shl AX,1h
    rcl DX,1h
    dec CL
    jnz LAB_1000_8e15
    push DX
    push AX
    mov AX,word ptr [BP + 4h]
    cwd
    mov CL,5h
LAB_1000_8e25:
    shl AX,1h
    rcl DX,1h
    dec CL
    jnz LAB_1000_8e25
    push DX
    push AX
    call sub_132BA
    add SP,0ch
    pop BP
    ret
    nop
sub_18DF4 endp
; ------------------------------seg000:0x8e36------------------------------
; ------------------------------seg000:0x8e38------------------------------
sub_18E38 equ _sub_18E38
; ------------------------------seg000:0x8e4f------------------------------
; ------------------------------seg000:0x94d0------------------------------
PUBLIC _sub_194D0
sub_194D0 proc near
_sub_194D0 equ sub_194D0
    push BP
    mov BP,SP
    sub SP,14h
    cmp word ptr [_word_330C2],0h
    jnz LAB_1000_94e0
    jmp LAB_1000_9576
LAB_1000_94e0:
    mov AX,word ptr [BP + 4h]
    jmp LAB_1000_9566
LAB_1000_94e6:
    mov AX,offset aTrackcam
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,[_word_3C6AC+206h]
    jmp LAB_1000_953b
LAB_1000_94f9:
    mov AX,offset aAhead
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    jmp LAB_1000_9550
LAB_1000_9509:
    mov AX,offset aRear
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    jmp LAB_1000_9550
LAB_1000_9519:
    mov AX,offset aRight
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    jmp LAB_1000_9550
LAB_1000_9529:
    mov AX,offset aLeft
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    jmp LAB_1000_9550
    db 0EBh
    db 15h
LAB_1000_953b:
    cmp AX,8000h
    jz LAB_1000_9509
    cmp AX,0c000h
    jz LAB_1000_9529
    or AX,AX
    jz LAB_1000_94f9
    cmp AX,4000h
    jz LAB_1000_9519
    jmp LAB_1000_9550
LAB_1000_9550:
    mov AX,3h
    push AX
    mov AX,offset strBuf
    push AX
    mov AX,2h
    push AX
    call sub_19FAD
    add SP,6h
    jmp LAB_1000_9570
    db 0EBh
    db 0Ah
LAB_1000_9566:
    db 3Dh, 13h, 00h ; cmp AX,13h (force imm16 encoding)
    jnz LAB_1000_956e
    jmp LAB_1000_94e6
LAB_1000_956e:
    jmp LAB_1000_9570
LAB_1000_9570:
    mov AX,word ptr [BP + 4h]
    mov word ptr [_word_3C09E],AX
LAB_1000_9576:
    mov SP,BP
    pop BP
    ret
sub_194D0 endp
; ------------------------------seg000:0x9579------------------------------
; ------------------------------seg000:0x957a------------------------------
sub_1957A equ _sub_1957A
; ------------------------------seg000:0x9594------------------------------
; ------------------------------seg000:0x9595------------------------------
sub_19595 equ _sub_19595
; ------------------------------seg000:0x95c8------------------------------
; ------------------------------seg000:0x95c9------------------------------
_sub_195C9 proc near
    push BP
    mov BP,SP
    sub SP,10h
    push SI
    mov word ptr [_word_3C09A],0h
    cmp word ptr [_word_330C2],0h
    jnz LAB_1000_95e0
    jmp LAB_1000_9870
LAB_1000_95e0:
    sub AX,AX
    push AX
    mov AX,offset aMap
    push AX
    mov AX,1h
    push AX
    call sub_19FAD
    add SP,6h
    mov AX,48h
    mov CL,9h
    sub CL,byte ptr [byte_383E5]
    shl AX,CL
    mov word ptr [BP + -6h],AX
    mov AX,7fffh
    sub AX,word ptr [BP + -6h]
    push AX
    push word ptr [BP + -6h]
    mov AX,4000h
    mov CL,byte ptr [byte_383E5]
    sar AX,CL
    push AX
    push word ptr [_var_542]
    call _sub_1D178
    add SP,4h
    add AX,word ptr [BP + 4h]
    push AX
    call _sub_1CF64
    add SP,6h
    mov word ptr [_var_589],AX
    mov AX,38h
    mov CL,9h
    sub CL,byte ptr [byte_383E5]
    shl AX,CL
    cwd
    mov CX,3h
    idiv CX
    shl AX,1h
    shl AX,1h
    mov word ptr [BP + -6h],AX
    mov AX,7fffh
    sub AX,word ptr [BP + -6h]
    push AX
    push word ptr [BP + -6h]
    mov AX,4000h
    mov CL,byte ptr [byte_383E5]
    sar AX,CL
    push AX
    push word ptr [_var_542]
    call _sub_1D190
    add SP,4h
    mov CX,word ptr [BP + 6h]
    sub CX,AX
    push CX
    call _sub_1CF64
    add SP,6h
    mov word ptr [_var_590],AX
    les BX,dword ptr [_commData]
    cmp word ptr ES:[BX + 78h],0h
    jz LAB_1000_967e
    sub AX,AX
    jmp LAB_1000_9681
LAB_1000_967e:
    mov AX,3h
LAB_1000_9681:
    push AX
    call _copySomeMem
    add SP,2h
    mov AX,13h
    push AX
    call far ptr _gfx_jump_3d_null
    add SP,2h
    mov AX,9h
    sub AX,word ptr [byte_383E5]
    push AX
    mov AX,word ptr [_var_590]
    cwd
    sub AX,DX
    sar AX,1h
    sub AX,4000h
    neg AX
    push AX
    mov AX,word ptr [_var_589]
    cwd
    sub AX,DX
    sar AX,1h
    push AX
    push word ptr [_var_567]
    call sub_1345E
    add SP,8h
    les BX,dword ptr [_gameData]
    cmp word ptr ES:[BX + 38h],2h
    jnc LAB_1000_96d6
    mov AX,0ch
    push AX
    call far ptr _gfx_jump_3d_null
    add SP,2h
    jmp LAB_1000_96e2
LAB_1000_96d6:
    mov AX,10h
    push AX
    call far ptr _gfx_jump_3d_null
    add SP,2h
LAB_1000_96e2:
    mov AL,byte ptr [_byte_3C5A0]
    cbw
    mov word ptr [BP + -0ah],AX
    call far ptr _gfx_jump_2d
    mov byte ptr [_byte_3C5A0],AL
    mov word ptr [BP + -6h],1h
    jmp LAB_1000_96fb
LAB_1000_96f8:
    inc word ptr [BP + -6h]
LAB_1000_96fb:
    mov AX,word ptr [_word_3BED2]
    cmp word ptr [BP + -6h],AX
    jl LAB_1000_9706
    jmp LAB_1000_97be
LAB_1000_9706:
    mov SI,word ptr [BP + -6h]
    mov CL,4h
    shl SI,CL
    db 83h, 0bch, 0b2h, 81h, 00h  ; CMP word ptr [SI + 0...,0x0                 ;= ??
    jz LAB_1000_9754
    db 0f6h, 84h, 0b4h, 81h, 80h  ; TEST byte ptr [SI + 0...,0x80                ;= ??
    jnz LAB_1000_9754
    lea AX,[BP + -4h]
    push AX
    lea AX,[BP + -2h]
    push AX
    push word ptr [SI + offset _stru_3AA5E + 2]
    push word ptr [SI + offset _stru_3AA5E]
    call sub_199EC
    add SP,8h
    or AX,AX
    jz LAB_1000_9754
    sub AX,AX
    push AX
    mov AX,4h
    push AX
    push AX
    sub AX,AX
    push AX
    mov AX,0a4h
    push AX
    mov AX,word ptr [BP + -4h]
    dec AX
    push AX
    mov AX,word ptr [BP + -2h]
    dec AX
    push AX
    call _sub_1A8C8
    add SP,0eh
LAB_1000_9754:
    mov BX,word ptr [BP + -6h]
    mov CL,4h
    shl BX,CL
    mov SI,word ptr [BX + offset _stru_3AA5E + 6]
    mov AX,SI
    and AX,481h
    cmp AX,401h
    jz LAB_1000_976f
    test SI,200h
    jz LAB_1000_97bb
LAB_1000_976f:
    mov SI,word ptr [BP + -6h]
    mov CL,4h
    shl SI,CL
    lea AX,[BP + -4h]
    push AX
    lea AX,[BP + -2h]
    push AX
    push word ptr [SI + offset _stru_3AA5E + 2]
    push word ptr [SI + offset _stru_3AA5E]
    call sub_199EC
    add SP,8h
    or AX,AX
    jz LAB_1000_97bb
    sub AX,AX
    push AX
    mov AX,4h
    push AX
    push AX
    sub AX,AX
    push AX
    cmp byte ptr [_gfxModeUnset],0h
    jz LAB_1000_97a7
    mov AX,0ach
    jmp LAB_1000_97aa
LAB_1000_97a7:
    mov AX,0b0h
LAB_1000_97aa:
    push AX
    mov AX,word ptr [BP + -4h]
    dec AX
    push AX
    mov AX,word ptr [BP + -2h]
    dec AX
    push AX
    call _sub_1A8C8
    add SP,0eh
LAB_1000_97bb:
    jmp LAB_1000_96f8
LAB_1000_97be:
    mov word ptr [BP + -6h],0h
    jmp LAB_1000_97c8
LAB_1000_97c5:
    inc word ptr [BP + -6h]
LAB_1000_97c8:
    cmp word ptr [BP + -6h],2h
    jge LAB_1000_982a
    mov AX,4000h
    mov CL,byte ptr [BP + -6h]
    sar AX,CL
    test word ptr [_planeFlags],AX
    jnz LAB_1000_9828
    mov SI,word ptr [BP + -6h]
    mov CL,2h
    shl SI,CL
    lea AX,[BP + -4h]
    push AX
    lea AX,[BP + -2h]
    push AX
    push word ptr [SI + offset _waypointIndex + 6]
    push word ptr [SI + offset _waypointIndex + 4]
    call sub_199EC
    add SP,8h
    or AX,AX
    jz LAB_1000_9828
    sub AX,AX
    push AX
    mov AX,4h
    push AX
    push AX
    sub AX,AX
    push AX
    cmp byte ptr [_gfxModeUnset],0h
    jz LAB_1000_9814
    mov AX,offset aF15dgtl_bin
    jmp LAB_1000_9817
LAB_1000_9814:
    mov AX,0a8h
LAB_1000_9817:
    push AX
    mov AX,word ptr [BP + -4h]
    dec AX
    push AX
    mov AX,word ptr [BP + -2h]
    dec AX
    push AX
    call _sub_1A8C8
    add SP,0eh
LAB_1000_9828:
    jmp LAB_1000_97c5
LAB_1000_982a:
    mov AL,byte ptr [BP + -0ah]
    mov byte ptr [_byte_3C5A0],AL
    call far ptr _gfx_jump_2d
    or AL,AL
    jnz LAB_1000_983e
    call sub_1A934
    jmp LAB_1000_986a
LAB_1000_983e:
    mov AX,38h
    push AX
    mov AX,48h
    push AX
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_566]
    push word ptr [BX]
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_565]
    push word ptr [BX]
    call far ptr _gfx_jump_2a
    add SP,10h
LAB_1000_986a:
    call sub_1A962
    call sub_11971
LAB_1000_9870:
    pop SI
    mov SP,BP
    pop BP
    ret
_sub_195C9 endp
; ------------------------------seg000:0x9874------------------------------
; ------------------------------seg000:0x9875------------------------------
zoomIn proc near
    push BP
    mov BP,SP
    test byte ptr [_keyValue],80h
    jz LAB_1000_9885
    dec word ptr [_word_336FE]
    jmp LAB_1000_98b0
LAB_1000_9885:
    cmp word ptr [_word_3C09A],0h
    jnz LAB_1000_98a5
    cmp word ptr [byte_383E5],9h
    jge LAB_1000_98a5
    inc word ptr [byte_383E5]
    push word ptr [_word_3BED0]
    push word ptr [_word_3BEC0]
    call _sub_195C9
    add SP,4h
LAB_1000_98a5:
    cmp word ptr [_word_3C09A],1h
    jnz LAB_1000_98b0
    inc word ptr [_var_588]
LAB_1000_98b0:
    mov SP,BP
    pop BP
    ret
zoomIn endp
_zoomIn equ zoomIn
; ------------------------------seg000:0x98b3------------------------------
; ------------------------------seg000:0x98b4------------------------------
zoomOut proc near
    push BP
    mov BP,SP
    test byte ptr [_keyValue],80h
    jz LAB_1000_98c4
    inc word ptr [_word_336FE]
    jmp LAB_1000_98f6
LAB_1000_98c4:
    cmp word ptr [_word_3C09A],0h
    jnz LAB_1000_98e4
    cmp word ptr [byte_383E5],2h
    jle LAB_1000_98e4
    dec word ptr [byte_383E5]
    push word ptr [_word_3BED0]
    push word ptr [_word_3BEC0]
    call _sub_195C9
    add SP,4h
LAB_1000_98e4:
    cmp word ptr [_word_3C09A],1h
    jnz LAB_1000_98f6
    cmp word ptr [_var_588],0h
    jz LAB_1000_98f6
    dec word ptr [_var_588]
LAB_1000_98f6:
    mov SP,BP
    pop BP
    ret
zoomOut endp
; ------------------------------seg000:0x98f9------------------------------
; ------------------------------seg000:0x98fa------------------------------
sub_198FA proc near
    push BP
    mov BP,SP
    mov AX,word ptr [BP + 4h]
    sub AX,word ptr [_var_589]
    mov CL,0ah
    sub CL,byte ptr [byte_383E5]
    sar AX,CL
    db 05h, 3Ch, 00h ; add AX,3ch (force imm16 encoding)
    jmp LAB_1000_9911
LAB_1000_9911:
    mov SP,BP
    pop BP
    ret
sub_198FA endp
; ------------------------------seg000:0x9914------------------------------
; ------------------------------seg000:0x9915------------------------------
sub_19915 proc near
    push BP
    mov BP,SP
    mov AX,word ptr [BP + 4h]
    sub AX,word ptr [_var_590]
    mov CL,0ah
    sub CL,byte ptr [byte_383E5]
    sar AX,CL
    mov CX,AX
    shl AX,1h
    add AX,CX
    sar AX,1h
    sar AX,1h
    db 05h, 8Ch, 00h ; add AX,8ch (force imm16 encoding)
    jmp LAB_1000_9936
LAB_1000_9936:
    mov SP,BP
    pop BP
    ret
sub_19915 endp
; ------------------------------seg000:0x9939------------------------------
; ------------------------------seg000:0x993a------------------------------
sub_1993A proc near
    push BP
    mov BP,SP
    sub SP,4h
    cmp word ptr [_word_3C09A],0h
    jnz LAB_1000_994e
    cmp word ptr [_word_330C2],0h
    jnz LAB_1000_9953
LAB_1000_994e:
    sub AX,AX
    jmp LAB_1000_99e8
LAB_1000_9953:
    push word ptr [BP + 4h]
    call sub_198FA
    add SP,2h
    mov word ptr [BP + -2h],AX
    push word ptr [BP + 6h]
    call sub_19915
    add SP,2h
    mov word ptr [BP + -4h],AX
    cmp word ptr [BP + 8h],-1h
    jz LAB_1000_99e3
    mov AX,word ptr [word_3C018]
    cmp word ptr [BP + -2h],AX
    jl LAB_1000_99e3
    mov AX,word ptr [word_3C45E]
    dec AX
    cmp word ptr [BP + -2h],AX
    jge LAB_1000_99e3
    mov AX,word ptr [word_3C01A]
    cmp word ptr [BP + -4h],AX
    jl LAB_1000_99e3
    mov AX,word ptr [word_3C5A2]
    dec AX
    cmp word ptr [BP + -4h],AX
    jge LAB_1000_99e3
    push word ptr [BP + 8h]
    push word ptr [BP + -4h]
    push word ptr [BP + -2h]
    call routine_328
    add SP,6h
    cmp word ptr [BP + 0ah],0h
    jz LAB_1000_99dd
    push word ptr [BP + 8h]
    push word ptr [BP + -4h]
    mov AX,word ptr [BP + -2h]
    inc AX
    push AX
    call routine_328
    add SP,6h
    push word ptr [BP + 8h]
    mov AX,word ptr [BP + -4h]
    inc AX
    push AX
    push word ptr [BP + -2h]
    call routine_328
    add SP,6h
    push word ptr [BP + 8h]
    mov AX,word ptr [BP + -4h]
    inc AX
    push AX
    mov AX,word ptr [BP + -2h]
    inc AX
    push AX
    call routine_328
    add SP,6h
LAB_1000_99dd:
    sub AX,AX
    jmp LAB_1000_99e8
    db 0EBh
    db 05h
LAB_1000_99e3:
    mov AX,1h
    jmp LAB_1000_99e8
LAB_1000_99e8:
    mov SP,BP
    pop BP
    ret
sub_1993A endp
; ------------------------------seg000:0x99eb------------------------------
; ------------------------------seg000:0x99ec------------------------------
sub_199EC proc near
    push BP
    mov BP,SP
    push SI
    cmp word ptr [_word_330C2],0h
    jnz LAB_1000_99fb
    sub AX,AX
    jmp LAB_1000_9a48
LAB_1000_99fb:
    push word ptr [BP + 4h]
    call sub_198FA
    add SP,2h
    mov BX,word ptr [BP + 8h]
    mov word ptr [BX],AX
    push word ptr [BP + 6h]
    call sub_19915
    add SP,2h
    mov BX,word ptr [BP + 0ah]
    mov word ptr [BX],AX
    mov BX,word ptr [BP + 8h]
    mov SI,word ptr [BX]
    cmp word ptr [word_3C018],SI
    jge LAB_1000_9a44
    mov AX,word ptr [word_3C45E]
    dec AX
    cmp AX,SI
    jle LAB_1000_9a44
    mov BX,word ptr [BP + 0ah]
    mov SI,word ptr [BX]
    cmp word ptr [word_3C01A],SI
    jge LAB_1000_9a44
    mov AX,word ptr [word_3C5A2]
    dec AX
    cmp AX,SI
    jle LAB_1000_9a44
    mov AX,1h
    jmp LAB_1000_9a48
    db 0EBh
    db 04h
LAB_1000_9a44:
    sub AX,AX
    jmp LAB_1000_9a48
LAB_1000_9a48:
    pop SI
    mov SP,BP
    pop BP
    ret
sub_199EC endp
; ------------------------------seg000:0x9a4c------------------------------
; ------------------------------seg000:0x9a4d------------------------------
sub_19A4D proc near
    push BP
    mov BP,SP
    sub SP,6h
    cmp word ptr [_word_3C09A],0h
    jz LAB_1000_9a5e
    sub AX,AX
    jmp LAB_1000_9ad7
LAB_1000_9a5e:
    push word ptr [BP + 4h]
    call sub_198FA
    add SP,2h
    mov word ptr [BP + -2h],AX
    push word ptr [BP + 6h]
    call sub_19915
    add SP,2h
    mov word ptr [BP + -4h],AX
    push word ptr [word_3C45E]
    push word ptr [word_3C018]
    push word ptr [BP + -2h]
    call _sub_1CF64
    add SP,6h
    mov word ptr [BP + -2h],AX
    push word ptr [word_3C5A2]
    push word ptr [word_3C01A]
    push word ptr [BP + -4h]
    call _sub_1CF64
    add SP,6h
    mov word ptr [BP + -4h],AX
    mov word ptr [BP + -6h],0ffffh
    mov AX,word ptr [word_3C018]
    cmp word ptr [BP + -2h],AX
    jle LAB_1000_9ad2
    mov AX,word ptr [word_3C45E]
    cmp word ptr [BP + -2h],AX
    jge LAB_1000_9ad2
    mov AX,word ptr [word_3C01A]
    cmp word ptr [BP + -4h],AX
    jle LAB_1000_9ad2
    mov AX,word ptr [word_3C5A2]
    cmp word ptr [BP + -4h],AX
    jge LAB_1000_9ad2
    push word ptr [BP + -4h]
    push word ptr [BP + -2h]
    call sub_1A1B1
    add SP,4h
    mov word ptr [BP + -6h],AX
LAB_1000_9ad2:
    mov AX,word ptr [BP + -6h]
    jmp LAB_1000_9ad7
LAB_1000_9ad7:
    mov SP,BP
    pop BP
    ret
sub_19A4D endp
; ------------------------------seg000:0x9ada------------------------------
; ------------------------------seg000:0x9adb------------------------------
sub_19ADB proc near
    push BP
    mov BP,SP
    sub SP,0eh
    mov AX,word ptr [BP + 0eh]
    cmp word ptr [BP + 10h],AX
    jge LAB_1000_9aed
    add byte ptr [BP + 0fh],1h
LAB_1000_9aed:
    push word ptr [BP + 0ah]
    call _sub_19E44
    add SP,2h
    mov AX,word ptr [BP + 0eh]
    mov word ptr [BP + -6h],AX
    jmp LAB_1000_9b02
LAB_1000_9afe:
    add word ptr [BP + -6h],10h
LAB_1000_9b02:
    mov AX,word ptr [BP + 10h]
    cmp word ptr [BP + -6h],AX
    jle LAB_1000_9b0d
    jmp LAB_1000_9b94
LAB_1000_9b0d:
    mov AH,byte ptr [BP + -6h]
    sub AL,AL
    mov word ptr [BP + -2h],AX
    push word ptr [BP + 8h]
    push AX
    call _sub_1D178
    add SP,4h
    add AX,word ptr [BP + 4h]
    mov word ptr [BP + -4h],AX
    push word ptr [BP + 8h]
    push word ptr [BP + -2h]
    call _sub_1D190
    add SP,4h
    mov CX,word ptr [BP + 6h]
    sub CX,AX
    mov word ptr [BP + -0ah],CX
    cmp word ptr [BP + -4h],0c000h
    jbe LAB_1000_9b45
    mov word ptr [BP + -4h],0h
LAB_1000_9b45:
    cmp word ptr [BP + -0ah],0c000h
    jbe LAB_1000_9b51
    mov word ptr [BP + -0ah],0h
LAB_1000_9b51:
    mov AX,word ptr [BP + 0eh]
    cmp word ptr [BP + -6h],AX
    jz LAB_1000_9b73
    cmp word ptr [BP + 0ch],0h
    jz LAB_1000_9b73
    push word ptr [BP + -0eh]
    push word ptr [BP + -8h]
    push word ptr [BP + -0ah]
    push word ptr [BP + -4h]
    call sub_19B98
    add SP,8h
    jmp LAB_1000_9b85
LAB_1000_9b73:
    sub AX,AX
    push AX
    push word ptr [BP + 0ah]
    push word ptr [BP + -0ah]
    push word ptr [BP + -4h]
    call sub_1993A
    add SP,8h
LAB_1000_9b85:
    mov AX,word ptr [BP + -4h]
    mov word ptr [BP + -8h],AX
    mov AX,word ptr [BP + -0ah]
    mov word ptr [BP + -0eh],AX
    jmp LAB_1000_9afe
LAB_1000_9b94:
    mov SP,BP
    pop BP
    ret
sub_19ADB endp
; ------------------------------seg000:0x9b97------------------------------
; ------------------------------seg000:0x9b98------------------------------
sub_19B98 proc near
    push BP
    mov BP,SP
    mov AX,1h
    push AX
    push word ptr [word_3C5A2]
    push word ptr [word_3C01A]
    push word ptr [word_3C45E]
    push word ptr [word_3C018]
    push word ptr [BP + 0ah]
    call sub_19915
    add SP,2h
    push AX
    push word ptr [BP + 8h]
    call sub_198FA
    add SP,2h
    push AX
    push word ptr [BP + 6h]
    call sub_19915
    add SP,2h
    push AX
    push word ptr [BP + 4h]
    call sub_198FA
    add SP,2h
    push AX
    call _sub_19C84
    add SP,12h
    mov SP,BP
    pop BP
    ret
sub_19B98 endp
; ------------------------------seg000:0x9be0------------------------------
; ------------------------------seg000:0x9c0c------------------------------
_sub_19C0C proc near
    push BP
    mov BP,SP
    sub SP,4h
    mov BX,word ptr [_var_564]
    mov AX,word ptr [BX + 14h]
    sub AX,word ptr [BX + 12h]
    inc AX
    mov word ptr [BP + -4h],AX
    mov AX,word ptr [BX + 10h]
    sub AX,word ptr [BX + 0eh]
    inc AX
    mov word ptr [BP + -2h],AX
    push word ptr [BX + 0eh]
    push word ptr [BX + 12h]
    call far ptr gfx_jump_3e
    add SP,4h
    push AX
    call far ptr gfx_jump_1a
    add SP,2h
    mov AX,word ptr [BP + -4h]
    dec AX
    mov word ptr [_var_349],AX
    mov AX,word ptr [BP + -2h]
    dec AX
    mov word ptr [_var_350],AX
    mov BX,word ptr [_var_564]
    push word ptr [BX + 4h]
    call far ptr _gfx_jump_21
    add SP,2h
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_351],AX
    mov AX,word ptr [BP + 6h]
    mov word ptr [_var_353],AX
    mov AX,word ptr [BP + 8h]
    mov word ptr [_var_352],AX
    mov AX,word ptr [BP + 0ah]
    mov word ptr [_var_354],AX
    call far ptr _sub_2152A
    call far ptr _gfx_jump_23
    mov SP,BP
    pop BP
    ret
_sub_19C0C endp
; ------------------------------seg000:0x9c83------------------------------
; ------------------------------seg000:0x9c84------------------------------
_sub_19C84 proc near
    push BP
    mov BP,SP
    sub SP,4h
    mov AX,word ptr [BP + 0eh]
    sub AX,word ptr [BP + 0ch]
    inc AX
    mov word ptr [BP + -4h],AX
    mov AX,word ptr [BP + 12h]
    sub AX,word ptr [BP + 10h]
    inc AX
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
    mov word ptr [_var_349],AX
    mov AX,word ptr [BP + -2h]
    dec AX
    mov word ptr [_var_350],AX
    mov BX,word ptr [_var_564]
    push word ptr [BX + 4h]
    call far ptr _gfx_jump_21
    add SP,2h
    mov AX,word ptr [BP + 4h]
    sub AX,word ptr [BP + 0ch]
    mov word ptr [_var_351],AX
    mov AX,word ptr [BP + 6h]
    sub AX,word ptr [BP + 10h]
    mov word ptr [_var_353],AX
    mov AX,word ptr [BP + 8h]
    sub AX,word ptr [BP + 0ch]
    mov word ptr [_var_352],AX
    mov AX,word ptr [BP + 0ah]
    sub AX,word ptr [BP + 10h]
    mov word ptr [_var_354],AX
    call far ptr _sub_2152A
    call far ptr _gfx_jump_23
    cmp word ptr [BP + 14h],0h
    jz LAB_1000_9d6b
    call far ptr _gfx_jump_2d
    mov byte ptr [_byte_3C5A0],AL
    cmp AL,1h
    sbb AX,AX
    neg AX
    push AX
    call far ptr gfx_jump_0e_setCurBuf
    add SP,2h
    mov BX,word ptr [_var_564]
    push word ptr [BX + 4h]
    call far ptr _gfx_jump_21
    add SP,2h
    mov AX,word ptr [BP + 4h]
    sub AX,word ptr [BP + 0ch]
    mov word ptr [_var_351],AX
    mov AX,word ptr [BP + 6h]
    sub AX,word ptr [BP + 10h]
    mov word ptr [_var_353],AX
    mov AX,word ptr [BP + 8h]
    sub AX,word ptr [BP + 0ch]
    mov word ptr [_var_352],AX
    mov AX,word ptr [BP + 0ah]
    sub AX,word ptr [BP + 10h]
    mov word ptr [_var_354],AX
    call far ptr _sub_2152A
    cmp byte ptr [_byte_3C5A0],1h
    sbb AX,AX
    inc AX
    push AX
    call far ptr gfx_jump_0e_setCurBuf
    add SP,2h
    call far ptr _gfx_jump_23
LAB_1000_9d6b:
    mov word ptr [_var_349],13fh
    mov word ptr [_var_350],0c7h
    sub AX,AX
    push AX
    call far ptr gfx_jump_1a
    add SP,2h
    mov SP,BP
    pop BP
    ret
_sub_19C84 endp
; ------------------------------seg000:0x9d85------------------------------
; ------------------------------seg000:0x9d86------------------------------
sub_19D86 equ _sub_19D86
; ------------------------------seg000:0x9daf------------------------------
; ------------------------------seg000:0x9db0------------------------------
sub_19DB0 proc near
    push BP
    mov BP,SP
    cmp byte ptr [_var_456],0h
    jz LAB_1000_9e00
    les BX,dword ptr [_gameData]
    cmp word ptr ES:[BX + 40h],2h
    jnc LAB_1000_9dd9
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call _sub_19C0C
    add SP,8h
    jmp LAB_1000_9dfe
LAB_1000_9dd9:
    sub AX,AX
    push AX
    mov AX,60h
    push AX
    mov AX,3eh
    push AX
    mov AX,0d8h
    push AX
    mov AX,68h
    push AX
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call _sub_19C84
    add SP,12h
LAB_1000_9dfe:
    jmp LAB_1000_9e40
LAB_1000_9e00:
    cmp word ptr [word_330B8],0h
    jz LAB_1000_9e2e
    sub AX,AX
    push AX
    mov AX,60h
    push AX
    mov AX,0fh
    push AX
    mov AX,10fh
    push AX
    mov AX,30h
    push AX
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call _sub_19C84
    add SP,12h
    jmp LAB_1000_9e40
LAB_1000_9e2e:
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call _sub_19C0C
    add SP,8h
LAB_1000_9e40:
    mov SP,BP
    pop BP
    ret
sub_19DB0 endp
; sub_19E44 moved to egame1.c

; sub_19E5D moved to C

routine_328 proc near
    push BP
    mov BP,SP
    push word ptr [BP + 8h]
    call _sub_19E44
    add SP,2h
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call _sub_19BE1
    add SP,8h
    mov SP,BP
    pop BP
    ret
routine_328 endp

; ------------------------------seg000:0x9eb6------------------------------
sub_19EB6 proc near
    push BP
    mov BP,SP
    push SI
    cmp word ptr [_word_330C2],0h
    jnz LAB_1000_9ec3
    jmp LAB_1000_9f42
LAB_1000_9ec3:
    mov AX,word ptr [BP + 4h]
    mov CX,AX
    shl AX,1h
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AX,word ptr [BP + 6h]
    cmp word ptr [SI + offset word_38202 + 14],AX
    jz LAB_1000_9f42
    push AX
    push word ptr [SI + offset word_38202 + 14]
    push word ptr [SI + offset word_38202 + 12]
    push word ptr [SI + offset word_38202 + 10]
    push word ptr [SI + offset word_38202 + 8]
    push word ptr [SI + offset word_38202 + 6]
    push word ptr [_var_564]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
    mov AX,word ptr [BP + 4h]
    mov CX,AX
    shl AX,1h
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    push word ptr [BP + 6h]
    push word ptr [SI + offset word_38202 + 14]
    push word ptr [SI + offset word_38202 + 12]
    push word ptr [SI + offset word_38202 + 10]
    push word ptr [SI + offset word_38202 + 8]
    push word ptr [SI + offset word_38202 + 6]
    push word ptr [_var_565]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
    mov BX,word ptr [BP + 4h]
    mov AX,BX
    shl BX,1h
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AX,word ptr [BP + 6h]
    mov word ptr [BX + offset word_38202 + 14],AX
LAB_1000_9f42:
    pop SI
    mov SP,BP
    pop BP
    ret
sub_19EB6 endp
; ------------------------------seg000:0x9f46------------------------------
; ------------------------------seg000:0x9fad------------------------------
sub_19FAD equ _sub_19FAD
; ------------------------------seg000:0x9fcb------------------------------
; ------------------------------seg000:0x9fcc------------------------------
_sub_19FCC proc near
    push BP
    mov BP,SP
    push word ptr [BP + 6h]
    call _sub_19E44
    add SP,2h
    cmp word ptr [BP + 4h],1h
    jnz LAB_1000_9ff4
    mov AX,0a8h
    push AX
    mov AX,60h
    push AX
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    call _sub_19E5D
    add SP,8h
LAB_1000_9ff4:
    cmp word ptr [BP + 4h],2h
    jnz LAB_1000_a010
    mov AX,0afh
    push AX
    mov AX,0c7h
    push AX
    mov AX,68h
    push AX
    mov AX,78h
    push AX
    call _sub_19E5D
    add SP,8h
LAB_1000_a010:
    cmp word ptr [BP + 4h],3h
    jnz LAB_1000_a02c
    mov AX,0b8h
    push AX
    mov AX,130h
    push AX
    mov AX,80h
    push AX
    mov AX,0e8h
    push AX
    call _sub_19E5D
    add SP,8h
LAB_1000_a02c:
    mov SP,BP
    pop BP
    ret
_sub_19FCC endp
; ------------------------------seg000:0xa02f------------------------------
; ------------------------------seg000:0xa030------------------------------
sub_1A030 proc near
    push BP
    mov BP,SP
    sub SP,6h
    jmp LAB_1000_a0c7
    db 0FFh
    db 76h
    db 06h
    db 0E8h
    db 0DFh
    db 49h
    db 83h
    db 0C4h
    db 02h
    db 0Bh
    db 0C0h
    db 74h
    db 07h
    db 83h
    db 3Eh
    db 12h
    db 08h
    db 00h
    db 75h
    db 02h
    db 0EBh
    db 78h
    db 83h
    db 7Eh
    db 04h
    db 01h
    db 75h
    db 11h
    db 0C7h
    db 46h
    db 0FEh
    db 18h
    db 00h
    db 0C7h
    db 46h
    db 0FAh
    db 60h
    db 00h
    db 0C7h
    db 46h
    db 0FCh
    db 70h
    db 00h
    db 0EBh
    db 0Fh
    db 0C7h
    db 46h
    db 0FEh
    db 78h
    db 00h
    db 0C7h
    db 46h
    db 0FAh
    db 0C7h
    db 00h
    db 0C7h
    db 46h
    db 0FCh
    db 68h
    db 00h
    db 83h
    db 6Eh
    db 0FCh
    db 08h
    db 0B8h
    db 08h
    db 00h
    db 50h
    db 0E8h
    db 0C4h
    db 0FDh
    db 83h
    db 0C4h
    db 02h
    db 8Bh
    db 46h
    db 0FCh
    db 05h
    db 04h
    db 00h
    db 50h
    db 8Bh
    db 46h
    db 0FAh
    db 2Dh
    db 05h
    db 00h
    db 50h
    db 0FFh
    db 76h
    db 0FCh
    db 8Bh
    db 46h
    db 0FEh
    db 05h
    db 05h
    db 00h
    db 50h
    db 0E8h
    db 0BFh
    db 0FDh
    db 83h
    db 0C4h
    db 08h
    db 0B8h
    db 0Bh
    db 00h
    db 50h
    db 0FFh
    db 76h
    db 0FCh
    db 0FFh
    db 76h
    db 06h
    db 0E8h
    db 70h
    db 49h
    db 83h
    db 0C4h
    db 02h
    db 0D1h
    db 0E0h
    db 8Bh
    db 4Eh
    db 0FEh
    db 03h
    db 4Eh
    db 0FAh
    db 0D1h
    db 0F9h
    db 2Bh
    db 0C8h
    db 51h
    db 0FFh
    db 76h
    db 06h
    db 0E8h
    db 07h
    db 00h
    db 83h
    db 0C4h
    db 08h
LAB_1000_a0c7:
    mov SP,BP
    pop BP
    ret
sub_1A030 endp
_sub_1A030 equ sub_1A030
; ------------------------------seg000:0xa0ca------------------------------
_drawSomeStrings proc near
    push BP
    mov BP,SP
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    push word ptr [_var_564]
    call _drawStringCentered
    add SP,0ah
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    push word ptr [_var_565]
    call _drawStringCentered
    add SP,0ah
    mov SP,BP
    pop BP
    ret
_drawSomeStrings endp
; ------------------------------seg000:0xa0fe------------------------------
_draw2Strings proc near
    push BP
    mov BP,SP
    cmp byte ptr [_byte_3C5A0],0h
    jnz LAB_1000_a120
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    push word ptr [_var_564]
    call _drawStringCentered
    add SP,0ah
    jmp LAB_1000_a136
LAB_1000_a120:
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    push word ptr [_var_565]
    call _drawStringCentered
    add SP,0ah
LAB_1000_a136:
    mov SP,BP
    pop BP
    ret
_draw2Strings endp
; ------------------------------seg000:0xa139------------------------------
_drawStringCentered proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    mov word ptr [BX + 0ch],0h
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 8h]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 0ah]
    mov word ptr [BX + 0ah],AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 0ch]
    mov word ptr [BX + 4h],AX
    push word ptr [BP + 6h]
    call _strlen
    add SP,2h
    push AX
    push word ptr [BP + 6h]
    call _strupr
    add SP,2h
    push AX
    push word ptr [BP + 4h]
    call far ptr _gfx_jump_05_drawString
    add SP,6h
    mov SP,BP
    pop BP
    ret
_drawStringCentered endp
; _sub_1A183 - now in C (egame1.c)
; ------------------------------seg000:0xa1b0------------------------------
; ------------------------------seg000:0xa1b1------------------------------
sub_1A1B1 equ _sub_1A1B1
; ------------------------------seg000:0xa1e3------------------------------
; ------------------------------seg000:0xa1e4------------------------------
tempStrcpy equ _tempStrcpy
; ------------------------------seg000:0xa203------------------------------
; ------------------------------seg000:0xa204------------------------------
sub_1A204 equ _sub_1A204
; ------------------------------seg000:0xa223------------------------------
; ------------------------------seg000:0xa224------------------------------
sub_1A224 proc near
    push BP
    mov BP,SP
    push SI
    mov BX,word ptr [BP + 6h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _stru_3AA5E + 12]
    and BX,7fh
    mov AL,byte ptr [BX + offset _byte_3BFA4]
    cbw
    mov SI,AX
    and SI,0fh
    mov BX,word ptr [BP + 4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    shl BX,1h
    add BX,AX
    mov AL,byte ptr [BX + SI + 0a1eh]
    cbw
    jmp LAB_1000_a256
LAB_1000_a256:
    pop SI
    mov SP,BP
    pop BP
    ret
    nop
sub_1A224 endp
; ------------------------------seg000:0xa25a------------------------------
; ------------------------------seg000:0xa25c------------------------------
_sub_1A25C proc near
    push BP
    mov BP,SP
    sub SP,16h
    push SI
    mov AX,word ptr [_var_588]
    inc AX
    mov word ptr [BP + -12h],AX
    sub AX,AX
    push AX
    call _sub_19E44
    add SP,2h
    mov AX,0afh
    push AX
    mov AX,0c7h
    push AX
    mov AX,68h
    push AX
    mov AX,78h
    push AX
    cmp byte ptr [BP + 4h],0h
    jnz LAB_1000_a28e
    mov AX,word ptr [_var_564]
    jmp LAB_1000_a291
LAB_1000_a28e:
    mov AX,word ptr [_var_565]
LAB_1000_a291:
    push AX
    call far ptr _sub_21444
    add SP,0ah
    mov AX,8h
    push AX
    call _sub_19E44
    add SP,2h
    mov word ptr [BP + -16h],1h
    cmp word ptr [_var_588],2h
    jge LAB_1000_a2c6
    cmp word ptr [_word_38FDC],0h
    jz LAB_1000_a2c6
    mov AX,1h
    mov CL,2h
    sub CL,byte ptr [_var_588]
    shl AX,CL
    inc AX
    mov word ptr [BP + -16h],AX
LAB_1000_a2c6:
    mov AX,1h
    sub AX,word ptr [BP + -16h]
    mov word ptr [BP + -14h],AX
    mov AX,word ptr [_word_3BEC0]
    and AX,0f800h
    mov word ptr [BP + -0ch],AX
    mov AX,word ptr [_word_3BED0]
    and AX,0f800h
    mov word ptr [BP + -10h],AX
    mov AX,word ptr [BP + -14h]
    shl AX,1h
    mov word ptr [BP + -0eh],AX
    jmp LAB_1000_a353
    db 90h
LAB_1000_a2ec:
    mov AX,word ptr [BP + -10h]
    add AH,1ch
    push AX
    mov AX,word ptr [BP + -0eh]
    mov CL,0ah
    shl AX,CL
    add AX,word ptr [BP + -0ch]
    push AX
    call sub_1A7C4
    add SP,4h
    mov AX,word ptr [_var_279]
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [_var_282]
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [BP + -10h]
    sub AX,1800h
    push AX
    mov AX,word ptr [BP + -0eh]
    mov CL,0ah
    shl AX,CL
    add AX,word ptr [BP + -0ch]
    push AX
    call sub_1A7C4
    add SP,4h
    sub AX,AX
    push AX
    mov AX,0afh
    push AX
    mov AX,68h
    push AX
    mov AX,0c7h
    push AX
    mov AX,78h
    push AX
    push word ptr [_var_282]
    push word ptr [_var_279]
    push word ptr [BP + -6h]
    push word ptr [BP + -2h]
    call _sub_19C84
    add SP,12h
    add word ptr [BP + -0eh],2h
LAB_1000_a353:
    mov AX,word ptr [BP + -16h]
    shl AX,1h
    cmp AX,word ptr [BP + -0eh]
    jge LAB_1000_a2ec
    mov AX,word ptr [BP + -14h]
    shl AX,1h
    mov word ptr [BP + -0eh],AX
    jmp LAB_1000_a3cf
    db 90h
LAB_1000_a368:
    mov AX,word ptr [BP + -0eh]
    mov CL,0ah
    shl AX,CL
    add AX,word ptr [BP + -10h]
    push AX
    mov AX,word ptr [BP + -0ch]
    add AH,1ch
    push AX
    call sub_1A7C4
    add SP,4h
    mov AX,word ptr [_var_279]
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [_var_282]
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [BP + -0eh]
    mov CL,0ah
    shl AX,CL
    add AX,word ptr [BP + -10h]
    push AX
    mov AX,word ptr [BP + -0ch]
    sub AX,1800h
    push AX
    call sub_1A7C4
    add SP,4h
    sub AX,AX
    push AX
    mov AX,0afh
    push AX
    mov AX,68h
    push AX
    mov AX,0c7h
    push AX
    mov AX,78h
    push AX
    push word ptr [_var_282]
    push word ptr [_var_279]
    push word ptr [BP + -6h]
    push word ptr [BP + -2h]
    call _sub_19C84
    add SP,12h
    add word ptr [BP + -0eh],2h
LAB_1000_a3cf:
    mov AX,word ptr [BP + -16h]
    shl AX,1h
    cmp AX,word ptr [BP + -0eh]
    jge LAB_1000_a368
    mov word ptr [BP + -0eh],0h
    jmp LAB_1000_a4b7
    db 90h
LAB_1000_a3e2:
    mov AX,24h
    imul word ptr [BP + -0eh]
    mov SI,AX
    test byte ptr [SI + offset _stru_3B208 + 18],2h
    jnz LAB_1000_a3f4
    jmp LAB_1000_a4b4
LAB_1000_a3f4:
    cmp word ptr [SI + offset _stru_3B208 + 20],0h
    jnz LAB_1000_a3fe
    jmp LAB_1000_a4b4
LAB_1000_a3fe:
    push word ptr [SI + offset word_3B206]
    push word ptr [SI + offset word_3B204]
    call sub_1A7C4
    add SP,4h
    cmp word ptr [word_3C016],-1h
    jnz LAB_1000_a416
    jmp LAB_1000_a4b4
LAB_1000_a416:
    cmp word ptr [_word_3C45C],1h
    jnz LAB_1000_a437
    mov AX,word ptr [_word_336F2]
    cmp word ptr [BP + -0eh],AX
    jnz LAB_1000_a437
    mov AX,7h
    push AX
    push word ptr [_var_282]
    push word ptr [_var_279]
    call sub_1A740
    add SP,6h
LAB_1000_a437:
    cmp word ptr [word_336F8],0h
    jle LAB_1000_a45c
    mov AX,0ffffh
    sub AX,word ptr [word_3BE96]
    cmp word ptr [BP + -0eh],AX
    jnz LAB_1000_a45c
    push word ptr [word_38F72]
    push word ptr [_var_282]
    push word ptr [_var_279]
    call sub_1A740
    add SP,6h
LAB_1000_a45c:
    mov AX,24h
    imul word ptr [BP + -0eh]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_3B208 + 10]
    sub AX,word ptr [_var_542]
    add AH,8h
    mov word ptr [BP + -4h],AX
    mov AX,word ptr [SI + offset _stru_3B208]
    sub AX,word ptr [_var_547]
    mov word ptr [BP + -0ah],AX
    mov word ptr [BP + -8h],0h
    cmp AX,0fc18h
    jge LAB_1000_a48c
    mov word ptr [BP + -8h],1h
LAB_1000_a48c:
    cmp word ptr [BP + -0ah],3e8h
    jle LAB_1000_a498
    mov word ptr [BP + -8h],2h
LAB_1000_a498:
    push word ptr [_var_282]
    push word ptr [_var_279]
    push word ptr [BP + -8h]
    mov AX,word ptr [BP + -4h]
    mov CL,0ch
    sar AX,CL
    db 25h, 0Fh, 00h ; and AX,0fh (force imm16 encoding)
    push AX
    call sub_1A872
    add SP,8h
LAB_1000_a4b4:
    inc word ptr [BP + -0eh]
LAB_1000_a4b7:
    mov AX,word ptr [_word_3C046]
    cmp word ptr [BP + -0eh],AX
    jge LAB_1000_a4c2
    jmp LAB_1000_a3e2
LAB_1000_a4c2:
    mov word ptr [BP + -0eh],0h
    jmp LAB_1000_a571
LAB_1000_a4ca:
    mov AX,0eh
LAB_1000_a4cd:
    push AX
    call _sub_19E44
    add SP,2h
    mov AX,18h
    imul word ptr [BP + -0eh]
    mov BX,AX
    mov AX,12h
    imul word ptr [BX + offset _stru_335C4 + 16]
    mov BX,AX
    cmp word ptr [BX + offset _sams + 12],3h
    jnz LAB_1000_a502
    cmp byte ptr [_gfxModeUnset],0h
    jz LAB_1000_a4f8
    mov AX,8h
    jmp LAB_1000_a4fb
LAB_1000_a4f8:
    mov AX,0dh
LAB_1000_a4fb:
    push AX
    call _sub_19E44
    add SP,2h
LAB_1000_a502:
    mov AX,18h
    imul word ptr [BP + -0eh]
    mov BX,AX
    test byte ptr [BX + offset _stru_335C4 + 4],1h
    jnz LAB_1000_a51b
    mov AX,7h
    push AX
    call _sub_19E44
    add SP,2h
LAB_1000_a51b:
    cmp word ptr [BP + -0eh],8h
    jl LAB_1000_a52b
    mov AX,0fh
    push AX
    call _sub_19E44
    add SP,2h
LAB_1000_a52b:
    mov AX,18h
    imul word ptr [BP + -0eh]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_335C4 + 8]
    sub AX,word ptr [_var_542]
    mov word ptr [BP + -4h],AX
    push word ptr [BP + -12h]
    push AX
    call _sub_1D190
    add SP,4h
    add AX,word ptr [_var_282]
    push AX
    push word ptr [BP + -12h]
    push word ptr [BP + -4h]
    call _sub_1D178
    add SP,4h
    mov CX,word ptr [_var_279]
    sub CX,AX
    push CX
    push word ptr [_var_282]
    push word ptr [_var_279]
    call sub_19D86
    add SP,8h
LAB_1000_a56e:
    inc word ptr [BP + -0eh]
LAB_1000_a571:
    cmp word ptr [BP + -0eh],0ch
    jge LAB_1000_a5bc
    mov AX,18h
    imul word ptr [BP + -0eh]
    mov SI,AX
    cmp word ptr [SI + offset _stru_335C4 + 14],0h
    jz LAB_1000_a56e
    push word ptr [SI + offset _stru_335C4 + 2]
    push word ptr [SI + offset _stru_335C4]
    call sub_1A7C4
    add SP,4h
    cmp word ptr [word_3C016],-1h
    jz LAB_1000_a56e
    mov AX,18h
    imul word ptr [BP + -0eh]
    mov BX,AX
    mov AX,12h
    imul word ptr [BX + offset _stru_335C4 + 16]
    mov BX,AX
    cmp word ptr [BX + offset _sams + 12],0h
    jle LAB_1000_a5b6
    jmp LAB_1000_a4ca
LAB_1000_a5b6:
    mov AX,0ch
    jmp LAB_1000_a4cd
LAB_1000_a5bc:
    mov word ptr [BP + -0eh],0h
    jmp LAB_1000_a68a
LAB_1000_a5c4:
    mov SI,word ptr [BP + -0eh]
    mov CL,4h
    shl SI,CL
    test byte ptr [SI + offset _stru_3AA5E + 6],80h
    jz LAB_1000_a5d5
    jmp LAB_1000_a687
LAB_1000_a5d5:
    push word ptr [SI + offset _stru_3AA5E + 2]
    push word ptr [SI + offset _stru_3AA5E]
    call sub_1A7C4
    add SP,4h
    cmp word ptr [word_3C016],-1h
    jnz LAB_1000_a5ed
    jmp LAB_1000_a687
LAB_1000_a5ed:
    cmp word ptr [_word_3C45C],2h
    jnz LAB_1000_a60e
    mov AX,word ptr [_word_336F4]
    cmp word ptr [BP + -0eh],AX
    jnz LAB_1000_a60e
    mov AX,7h
    push AX
    push word ptr [_var_282]
    push word ptr [_var_279]
    call sub_1A740
    add SP,6h
LAB_1000_a60e:
    mov word ptr [BP + -4h],5h
    mov BX,word ptr [BP + -0eh]
    mov CL,4h
    shl BX,CL
    test word ptr [BX + offset _stru_3AA5E + 6],201h
    jz LAB_1000_a637
    mov AX,word ptr [_var_542]
    neg AX
    add AH,10h
    mov CL,0dh
    sar AX,CL
    db 25h, 03h, 00h ; and AX,3h (force imm16 encoding)
    db 05h, 08h, 00h ; add AX,8h (force imm16 encoding)
    mov word ptr [BP + -4h],AX
LAB_1000_a637:
    mov BX,word ptr [BP + -0eh]
    mov CL,4h
    shl BX,CL
    cmp word ptr [BX + offset _stru_3AA5E + 4],0h
    jz LAB_1000_a64a
    mov word ptr [BP + -4h],1h
LAB_1000_a64a:
    mov BX,word ptr [BP + -0eh]
    mov CL,4h
    shl BX,CL
    test byte ptr [BX + offset _stru_3AA5E + 6],8h
    jz LAB_1000_a65d
    mov word ptr [BP + -4h],7h
LAB_1000_a65d:
    mov AX,word ptr [word_3B146]
    cmp word ptr [BP + -0eh],AX
    jz LAB_1000_a66d
    mov AX,word ptr [word_3B158]
    cmp word ptr [BP + -0eh],AX
    jnz LAB_1000_a672
LAB_1000_a66d:
    mov word ptr [BP + -4h],6h
LAB_1000_a672:
    push word ptr [_var_282]
    push word ptr [_var_279]
    mov AX,3h
    push AX
    push word ptr [BP + -4h]
    call sub_1A872
    add SP,8h
LAB_1000_a687:
    inc word ptr [BP + -0eh]
LAB_1000_a68a:
    mov AX,word ptr [_word_3BED2]
    cmp word ptr [BP + -0eh],AX
    jge LAB_1000_a695
    jmp LAB_1000_a5c4
LAB_1000_a695:
    push word ptr [_word_3BED0]
    push word ptr [_word_3BEC0]
    call sub_1A7C4
    add SP,4h
    cmp word ptr [word_3C016],-1h
    jz LAB_1000_a6bf
    push word ptr [_var_282]
    push word ptr [_var_279]
    mov AX,3h
    push AX
    sub AX,AX
    push AX
    call sub_1A872
    add SP,8h
LAB_1000_a6bf:
    mov word ptr [BP + -0eh],0h
    jmp LAB_1000_a6df
LAB_1000_a6c6:
    push word ptr [_var_282]
    push word ptr [_var_279]
    mov AX,3h
    push AX
    mov AX,2h
LAB_1000_a6d5:
    push AX
    call sub_1A872
    add SP,8h
LAB_1000_a6dc:
    inc word ptr [BP + -0eh]
LAB_1000_a6df:
    cmp word ptr [BP + -0eh],4h
    jge LAB_1000_a73a
    mov AX,word ptr [BP + -0eh]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    shl AX,1h
    mov SI,AX
    cmp word ptr [SI + offset word_333DA],0h
    jz LAB_1000_a6dc
    push word ptr [SI + offset word_333D4]
    push word ptr [SI + offset word_333D2]
    call sub_1A7C4
    add SP,4h
    cmp word ptr [word_3C016],-1h
    jz LAB_1000_a6dc
    mov BX,word ptr [BP + -0eh]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    shl BX,1h
    mov AX,word ptr [BX + offset word_333D8]
    db 3Dh, 01h, 00h ; cmp AX,1h (force imm16 encoding)
    jz LAB_1000_a6c6
    db 3Dh, 02h, 00h ; cmp AX,2h (force imm16 encoding)
    jnz LAB_1000_a6dc
    push word ptr [_var_282]
    push word ptr [_var_279]
    mov AX,3h
    push AX
    jmp LAB_1000_a6d5
    db 90h
LAB_1000_a73a:
    pop SI
    mov SP,BP
    pop BP
    ret
    nop
_sub_1A25C endp
; ------------------------------seg000:0xa73e------------------------------
; ------------------------------seg000:0xa740------------------------------
sub_1A740 proc near
    push BP
    mov BP,SP
    push SI
    push word ptr [BP + 8h]
    call _sub_19E44
    add SP,2h
    mov SI,word ptr [_var_282]
    sub SI,3h
    push SI
    mov AX,word ptr [_var_279]
    db 05h, 04h, 00h ; add AX,4h (force imm16 encoding)
    push AX
    push SI
    mov AX,word ptr [_var_279]
    db 2Dh, 04h, 00h ; sub AX,4h (force imm16 encoding)
    push AX
    call sub_19D86
    add SP,8h
    mov SI,word ptr [_var_279]
    add SI,4h
    mov AX,word ptr [_var_282]
    db 05h, 03h, 00h ; add AX,3h (force imm16 encoding)
    push AX
    push SI
    mov AX,word ptr [_var_282]
    db 2Dh, 03h, 00h ; sub AX,3h (force imm16 encoding)
    push AX
    push SI
    call sub_19D86
    add SP,8h
    mov SI,word ptr [_var_282]
    add SI,3h
    push SI
    mov AX,word ptr [_var_279]
    db 2Dh, 04h, 00h ; sub AX,4h (force imm16 encoding)
    push AX
    push SI
    mov AX,word ptr [_var_279]
    db 05h, 04h, 00h ; add AX,4h (force imm16 encoding)
    push AX
    call sub_19D86
    add SP,8h
    mov SI,word ptr [_var_279]
    sub SI,4h
    mov AX,word ptr [_var_282]
    db 2Dh, 03h, 00h ; sub AX,3h (force imm16 encoding)
    push AX
    push SI
    mov AX,word ptr [_var_282]
    db 05h, 03h, 00h ; add AX,3h (force imm16 encoding)
    push AX
    push SI
    call sub_19D86
    add SP,8h
    pop SI
    pop BP
    ret
sub_1A740 endp
; ------------------------------seg000:0xa7c3------------------------------
; ------------------------------seg000:0xa7c4------------------------------
sub_1A7C4 proc near
    push BP
    mov BP,SP
    sub SP,6h
    push SI
    mov word ptr [word_3C016],0h
    mov AL,7h
    sub AL,byte ptr [_var_588]
    mov byte ptr [BP + -6h],AL
    mov AX,word ptr [BP + 4h]
    sub AX,word ptr [_word_3BEC0]
    mov CL,byte ptr [BP + -6h]
    sar AX,CL
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [_word_3BED0]
    sub AX,word ptr [BP + 6h]
    sar AX,CL
    mov word ptr [BP + -4h],AX
    push AX
    push word ptr [_var_542]
    call _sub_1D178
    add SP,4h
    push word ptr [BP + -2h]
    push word ptr [_var_542]
    mov SI,AX
    call _sub_1D190
    add SP,4h
    sub AX,SI
    mov word ptr [_var_279],AX
    push word ptr [BP + -2h]
    push word ptr [_var_542]
    call _sub_1D178
    add SP,4h
    push word ptr [BP + -4h]
    push word ptr [_var_542]
    mov SI,AX
    call _sub_1D190
    add SP,4h
    add AX,SI
    mov word ptr [_var_282],AX
    add word ptr [_var_279],0a0h
    neg AX
    db 05h, 98h, 00h ; add AX,98h (force imm16 encoding)
    mov word ptr [_var_282],AX
    cmp word ptr [_var_279],7ch
    jl LAB_1000_a851
    cmp word ptr [_var_279],0c3h
    jle LAB_1000_a857
LAB_1000_a851:
    mov word ptr [word_3C016],0ffffh
LAB_1000_a857:
    cmp word ptr [_var_282],6bh
    jl LAB_1000_a866
    cmp word ptr [_var_282],0ach
    jle LAB_1000_a86c
LAB_1000_a866:
    mov word ptr [word_3C016],0ffffh
LAB_1000_a86c:
    pop SI
    mov SP,BP
    pop BP
    ret
    nop
sub_1A7C4 endp
; ------------------------------seg000:0xa870------------------------------
; ------------------------------seg000:0xa872------------------------------
sub_1A872 proc near
    push BP
    mov BP,SP
    mov AX,[_gfxBufPtr]
    mov word ptr [_var_569],AX
    mov AX,word ptr [BP + 4h]
    mov CL,3h
    shl AX,CL
    inc AX
    mov word ptr [_var_570],AX
    mov AX,word ptr [BP + 6h]
    shl AX,CL
    db 05h, 1Fh, 00h ; add AX,1fh (force imm16 encoding)
    mov word ptr [_var_571],AX
    cmp byte ptr [_byte_3C5A0],1h
    sbb AX,AX
    inc AX
    mov word ptr [_var_572],AX
    mov AX,word ptr [BP + 8h]
    db 2Dh, 03h, 00h ; sub AX,3h (force imm16 encoding)
    mov word ptr [_var_573],AX
    mov AX,word ptr [BP + 0ah]
    db 2Dh, 03h, 00h ; sub AX,3h (force imm16 encoding)
    mov word ptr [_var_574],AX
    mov word ptr [_var_575],7h
    mov word ptr [_var_576],7h
    mov AX,offset word_383AE
    push AX
    call far ptr gfx_jump_47
    add SP,2h
    pop BP
    ret
sub_1A872 endp
; ------------------------------seg000:0xa8c7------------------------------
; ------------------------------seg000:0xa8c8------------------------------
_sub_1A8C8 proc near
    push BP
    mov BP,SP
    mov AX,[_gfxBufPtr]
    mov word ptr [_var_577],AX
    mov AX,word ptr [BP + 8h]
    mov word ptr [_var_578],AX
    mov AX,word ptr [BP + 0ah]
    mov word ptr [_var_579],AX
    cmp byte ptr [_byte_3C5A0],1h
    sbb AX,AX
    inc AX
    mov word ptr [_var_580],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_581],AX
    mov AX,word ptr [BP + 6h]
    mov word ptr [_var_582],AX
    mov AX,word ptr [BP + 0ch]
    mov word ptr [_var_583],AX
    mov AX,word ptr [BP + 0eh]
    mov word ptr [_var_584],AX
    mov AL,byte ptr [BP + 10h]
    mov byte ptr [_var_586],AL
    cmp word ptr [BP + 10h],0h
    jz LAB_1000_a920
    mov byte ptr [_var_585],1h
    mov AX,offset word_383CC
    push AX
    call far ptr gfx_jump_47
    add SP,2h
    pop BP
    ret
    db 90h
LAB_1000_a920:
    mov byte ptr [_var_585],10h
    mov AX,offset word_383CC
    push AX
    call far ptr gfx_jump_49
    add SP,2h
    pop BP
    ret
    nop
_sub_1A8C8 endp
; ------------------------------seg000:0xa933------------------------------
; ------------------------------seg000:0xa934------------------------------
sub_1A934 proc near
    mov AX,39h
    push AX
    mov AX,49h
    push AX
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_566]
    push word ptr [BX]
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_564]
    push word ptr [BX]
    call far ptr _gfx_jump_2a
    add SP,10h
    ret
    nop
sub_1A934 endp
; ------------------------------seg000:0xa961------------------------------
; ------------------------------seg000:0xa962------------------------------
sub_1A962 proc near
    mov AX,39h
    push AX
    mov AX,49h
    push AX
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_564]
    push word ptr [BX]
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_566]
    push word ptr [BX]
    call far ptr _gfx_jump_2a
    add SP,10h
    mov AX,39h
    push AX
    mov AX,49h
    push AX
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_565]
    push word ptr [BX]
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_564]
    push word ptr [BX]
    call far ptr _gfx_jump_2a
    add SP,10h
    ret
    nop
sub_1A962 endp
; ------------------------------seg000:0xa9bb------------------------------
; ------------------------------seg000:0xa9bc------------------------------
sub_1A9BC proc near
    mov AX,39h
    push AX
    mov AX,49h
    push AX
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    cmp byte ptr [_byte_3C5A0],0h
    jz LAB_1000_a9da
    mov BX,word ptr [_var_565]
    jmp LAB_1000_a9de
    db 90h
LAB_1000_a9da:
    mov BX,word ptr [_var_564]
LAB_1000_a9de:
    mov AX,word ptr [BX]
    push AX
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_566]
    push word ptr [BX]
    call far ptr _gfx_jump_2a
    add SP,10h
    ret
sub_1A9BC endp
; ------------------------------seg000:0xa9f7------------------------------
; ------------------------------seg000:0xa9f8------------------------------
sub_1A9F8 proc near
    push BP
    mov BP,SP
    sub SP,32h
    push DI
    push SI
    mov word ptr [BP + -1ah],0h
    cmp word ptr [_keyValue],8bh
    jnz LAB_1000_aa45
    mov AX,2h
    push AX
    push word ptr [_var_545]
    push word ptr [_var_544]
    push word ptr [_var_542]
    mov AX,word ptr [_var_547]
    db 05h, 10h, 00h ; add AX,10h (force imm16 encoding)
    push AX
    sub AX,AX
    mov DX,100h
    sub AX,word ptr [_dword_3B7F8]
    sbb DX,word ptr [_dword_3B7F8+2]
    push DX
    push AX
    push word ptr [_dword_3B7DA+2]
    push word ptr [_dword_3B7DA]
    mov AX,6h
    push AX
    call sub_1C9D2
    add SP,14h
LAB_1000_aa45:
    cmp word ptr [word_3B4D2],0h
    jz LAB_1000_aa50
    dec word ptr [word_3B4D2]
LAB_1000_aa50:
    test byte ptr [_word_336F4],80h
    jnz LAB_1000_aa6b
    test byte ptr [_word_336E8],0fh
    jz LAB_1000_aa61
    jmp LAB_1000_abd4
LAB_1000_aa61:
    cmp word ptr [word_3C00A],0h
    jz LAB_1000_aa6b
    jmp LAB_1000_abd4
LAB_1000_aa6b:
    cmp word ptr [_word_3C09E],13h
    jz LAB_1000_aa75
    jmp LAB_1000_abd4
LAB_1000_aa75:
    cmp word ptr [word_3B4D2],0h
    jz LAB_1000_aa7f
    jmp LAB_1000_abd4
LAB_1000_aa7f:
    cmp word ptr [_word_3C45C],1h
    jnz LAB_1000_aa89
    jmp LAB_1000_abd4
LAB_1000_aa89:
    test byte ptr [_keyValue],80h
    jz LAB_1000_aa93
    jmp LAB_1000_abd4
LAB_1000_aa93:
    test byte ptr [_word_336F4],80h
    jnz LAB_1000_aaa3
    mov AX,0ffffh
    mov word ptr [BP + -2ch],AX
    mov word ptr [_word_336F4],AX
LAB_1000_aaa3:
    mov AX,64h
    mov CL,6h
    sub CL,byte ptr [_word_330BC]
    shl AX,CL
    mov word ptr [BP + -10h],AX
    cmp word ptr [_word_336F4],-1h
    jz LAB_1000_ab10
    mov AX,word ptr [_word_336F4]
    db 2Dh, 80h, 00h ; sub AX,80h (force imm16 encoding)
    mov word ptr [BP + -20h],AX
    push AX
    call sub_1C7A2
    add SP,2h
    dec AX
    mov word ptr [BP + -1eh],AX
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    db 83h, 0bfh, 0b2h, 81h, 00h  ; CMP word ptr [BX + 0...,0x0                 ;= ??
    jz LAB_1000_aadf
    sub word ptr [BP + -1eh],280h
LAB_1000_aadf:
    cmp word ptr [BP + -20h],3h
    jge LAB_1000_aaea
    sub word ptr [BP + -1eh],0a00h
LAB_1000_aaea:
    mov AX,word ptr [_var_542]
    add AX,word ptr [_word_3C6AC+206h]
    sub AX,word ptr [_var_674]
    push AX
    call _abs
    add SP,2h
    cmp AX,2000h
    jle LAB_1000_ab08
    mov word ptr [BP + -1eh],8300h
    jmp LAB_1000_ab0e
LAB_1000_ab08:
    mov word ptr [word_3C00A],1h
LAB_1000_ab0e:
    jmp LAB_1000_ab1b
LAB_1000_ab10:
    mov word ptr [word_3C00A],0h
    mov word ptr [BP + -1eh],8300h
LAB_1000_ab1b:
    mov word ptr [BP + -2ch],0ffffh
    mov word ptr [BP + -20h],1h
    jmp LAB_1000_ab2a
LAB_1000_ab27:
    inc word ptr [BP + -20h]
LAB_1000_ab2a:
    mov AX,word ptr [_word_3BED2]
    cmp word ptr [BP + -20h],AX
    jge LAB_1000_abab
    push word ptr [BP + -20h]
    call sub_1C7A2
    add SP,2h
    mov AX,word ptr [_var_542]
    add AX,word ptr [_word_3C6AC+206h]
    sub AX,word ptr [_var_674]
    push AX
    call _abs
    add SP,2h
    cmp AX,1800h
    jge LAB_1000_aba8
    mov AX,word ptr [BP + -20h]
    db 05h, 80h, 00h ; add AX,80h (force imm16 encoding)
    cmp AX,word ptr [_word_336F4]
    jz LAB_1000_aba8
    mov SI,word ptr [BP + -20h]
    mov CL,4h
    shl SI,CL
    db 0f6h, 84h, 0b4h, 81h, 80h  ; TEST byte ptr [SI + 0...,0x80                ;= ??
    jnz LAB_1000_aba8
    db 83h, 0bch, 0b2h, 81h, 00h  ; CMP word ptr [SI + 0...,0x0                 ;= ??
    jz LAB_1000_ab79
    sub word ptr [_var_672],280h
LAB_1000_ab79:
    mov AX,word ptr [word_3B146]
    cmp word ptr [BP + -20h],AX
    jz LAB_1000_ab89
    mov AX,word ptr [word_3B158]
    cmp word ptr [BP + -20h],AX
    jnz LAB_1000_ab8f
LAB_1000_ab89:
    sub word ptr [_var_672],0a00h
LAB_1000_ab8f:
    mov AX,word ptr [_var_672]
    cmp word ptr [BP + -10h],AX
    jle LAB_1000_aba8
    cmp word ptr [BP + -1eh],AX
    jge LAB_1000_aba8
    mov AX,word ptr [BP + -20h]
    mov word ptr [BP + -2ch],AX
    mov AX,word ptr [_var_672]
    mov word ptr [BP + -10h],AX
LAB_1000_aba8:
    jmp LAB_1000_ab27
LAB_1000_abab:
    test byte ptr [BP + -2ch],80h
    jz LAB_1000_abc8
    cmp word ptr [_word_336F4],-1h
    jnz LAB_1000_abc0
    mov word ptr [word_3B4D2],4h
    jmp LAB_1000_abc6
LAB_1000_abc0:
    mov word ptr [_word_336F4],0ffffh
LAB_1000_abc6:
    jmp LAB_1000_abd4
LAB_1000_abc8:
    mov AX,word ptr [BP + -2ch]
    mov word ptr [_word_336F4],AX
    mov word ptr [_word_39604],0h
LAB_1000_abd4:
    mov word ptr [BP + -20h],0h
    jmp LAB_1000_abde
LAB_1000_abdb:
    inc word ptr [BP + -20h]
LAB_1000_abde:
    cmp word ptr [BP + -20h],8h
    jl LAB_1000_abe7
    jmp LAB_1000_ac70
LAB_1000_abe7:
    mov SI,word ptr [BP + -20h]
    mov CL,3h
    shl SI,CL
    cmp word ptr [SI + offset stru_33402],0h
    jz LAB_1000_ac6d
    push word ptr [SI + offset stru_33402 + 4]
    push word ptr [SI + offset stru_33402 + 2]
    push word ptr [SI + offset stru_33402]
    call sub_1C488
    add SP,6h
    cmp word ptr [word_3C016],0h
    jge LAB_1000_ac6d
    cmp word ptr [word_3C016],0ff00h
    jle LAB_1000_ac6d
    mov SI,word ptr [BP + -20h]
    mov CL,3h
    shl SI,CL
    sub AX,AX
    push AX
    push AX
    push word ptr [SI + offset stru_33402 + 6]
    push AX
    push word ptr [SI + offset stru_33402 + 4]
    mov AX,word ptr [SI + offset stru_33402 + 2]
    sub DX,DX
    mov CL,5h
LAB_1000_ac32:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_ac3c
    jmp LAB_1000_ac32
LAB_1000_ac3c:
    push DX
    push AX
    mov AX,word ptr [SI + offset stru_33402]
    sub DX,DX
    mov CL,5h
LAB_1000_ac46:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_ac50
    jmp LAB_1000_ac46
LAB_1000_ac50:
    push DX
    push AX
    mov AL,byte ptr [word_33442]
    sub AL,byte ptr [BP + -20h]
    and AL,7h
    cmp AL,4h
    jnc LAB_1000_ac63
    mov AX,3h
    jmp LAB_1000_ac66
LAB_1000_ac63:
    mov AX,11h
LAB_1000_ac66:
    push AX
    call sub_1C9D2
    add SP,14h
LAB_1000_ac6d:
    jmp LAB_1000_abdb
LAB_1000_ac70:
    mov AX,4bh
    mov CL,6h
    sub CL,byte ptr [_word_330BC]
    shl AX,CL
    mov word ptr [BP + -10h],AX
    cmp word ptr [_word_330C2],0h
    jz LAB_1000_ac96
    mov AX,word ptr [word_38FEE]
    add AX,word ptr [_var_547]
    cmp AX,5dch
    jbe LAB_1000_ac96
    mov AX,1h
    jmp LAB_1000_ac98
LAB_1000_ac96:
    sub AX,AX
LAB_1000_ac98:
    mov word ptr [BP + -24h],AX
    cmp word ptr [_word_330C2],0h
    jz LAB_1000_acb3
    mov AX,word ptr [word_38FEE]
    add AX,word ptr [_var_547]
    cmp AX,0fa0h
    jbe LAB_1000_acb3
    mov word ptr [BP + -24h],2h
LAB_1000_acb3:
    test byte ptr [_word_336F2],80h
    jz LAB_1000_ad05
    cmp word ptr [_word_336F2],-1h
    jz LAB_1000_ad05
    mov AX,word ptr [_word_336F2]
    db 2Dh, 80h, 00h ; sub AX,80h (force imm16 encoding)
    mov word ptr [BP + -20h],AX
    mov AX,24h
    imul word ptr [BP + -20h]
    mov SI,AX
    mov AX,1h
    push AX
    push word ptr [SI + offset word_3B206]
    push word ptr [SI + offset word_3B204]
    call sub_1C7EA
    add SP,6h
    mov word ptr [BP + -1eh],AX
    mov AX,word ptr [_var_542]
    add AX,word ptr [_word_3C6AC+206h]
    sub AX,word ptr [_var_674]
    push AX
    call _abs
    add SP,2h
    cmp AX,2000h
    jle LAB_1000_ad03
    mov word ptr [BP + -1eh],0h
LAB_1000_ad03:
    jmp LAB_1000_ad0a
LAB_1000_ad05:
    mov word ptr [BP + -1eh],0h
LAB_1000_ad0a:
    mov word ptr [BP + -2ch],0ffffh
    mov word ptr [BP + -20h],0h
    jmp LAB_1000_ad19
LAB_1000_ad16:
    inc word ptr [BP + -20h]
LAB_1000_ad19:
    mov AX,word ptr [_word_3C046]
    cmp word ptr [BP + -20h],AX
    jl LAB_1000_ad24
    jmp LAB_1000_af20
LAB_1000_ad24:
    mov AX,24h
    imul word ptr [BP + -20h]
    mov BX,AX
    test byte ptr [BX + offset _stru_3B208 + 18],2h
    jnz LAB_1000_ad36
    jmp LAB_1000_af1d
LAB_1000_ad36:
    push word ptr [BP + -20h]
    call sub_1C7C6
    add SP,2h
    cmp AX,12c0h
    jl LAB_1000_ad4e
    cmp word ptr [_word_3370E],0h
    jnz LAB_1000_ad4e
    jmp LAB_1000_af1d
LAB_1000_ad4e:
    mov AX,word ptr [_var_672]
    cmp word ptr [BP + -10h],AX
    jle LAB_1000_adad
    cmp word ptr [BP + -1eh],AX
    jge LAB_1000_adad
    test byte ptr [_keyValue],80h
    jnz LAB_1000_adad
    mov AX,24h
    imul word ptr [BP + -20h]
    mov SI,AX
    test byte ptr [SI + offset _stru_3B208 + 18],20h
    jnz LAB_1000_adad
    cmp word ptr [SI + offset _stru_3B208 + 20],0h
    jz LAB_1000_adad
    mov AX,1h
    push AX
    push word ptr [SI + offset word_3B206]
    push word ptr [SI + offset word_3B204]
    call sub_1C7EA
    add SP,6h
    mov AX,word ptr [_var_542]
    add AX,word ptr [_word_3C6AC+206h]
    sub AX,word ptr [_var_674]
    push AX
    call _abs
    add SP,2h
    cmp AX,2000h
    jge LAB_1000_adad
    mov AX,word ptr [_var_672]
    mov word ptr [BP + -10h],AX
    mov AX,word ptr [BP + -20h]
    mov word ptr [BP + -2ch],AX
LAB_1000_adad:
    mov AX,24h
    imul word ptr [BP + -20h]
    mov SI,AX
    push word ptr [SI + offset _stru_3B208]
    push word ptr [SI + offset word_3B206]
    push word ptr [SI + offset word_3B204]
    call sub_1C488
    add SP,6h
    cmp word ptr [word_3C016],0h
    jl LAB_1000_add1
    jmp LAB_1000_af1d
LAB_1000_add1:
    mov CL,byte ptr [BP + -24h]
    sar word ptr [word_3C016],CL
    cmp word ptr [word_3C016],-20h
    jg LAB_1000_ade2
    jmp LAB_1000_aefd
LAB_1000_ade2:
    mov AX,24h
    imul word ptr [BP + -20h]
    mov SI,AX
    cmp word ptr [SI + offset _stru_3B208],3e7h
    jl LAB_1000_adf5
    jmp LAB_1000_aeaa
LAB_1000_adf5:
    cmp word ptr [_word_330BC],0h
    jz LAB_1000_adff
    jmp LAB_1000_aeaa
LAB_1000_adff:
    mov word ptr [BP + -1ch],0h
    mov DI,word ptr [_word_3C16A]
    mov CL,4h
    shl DI,CL
    test word ptr [DI + offset _stru_3AA5E + 6],200h
    jz LAB_1000_ae5f
    mov AX,word ptr [SI + offset word_3B204]
    sub AX,word ptr [DI + offset _stru_3AA5E]
    push AX
    call _abs
    add SP,2h
    mov DX,word ptr [word_38FFC]
    mov CL,5h
    sar DX,CL
    cmp AX,DX
    jge LAB_1000_ae5f
    mov AX,24h
    imul word ptr [BP + -20h]
    mov BX,AX
    mov AX,word ptr [BX + offset word_3B206]
    mov BX,word ptr [_word_3C16A]
    mov CL,4h
    shl BX,CL
    sub AX,word ptr [BX + offset _stru_3AA5E + 2]
    push AX
    call _abs
    add SP,2h
    mov DX,word ptr [word_39200]
    mov CL,5h
    sar DX,CL
    cmp AX,DX
    jge LAB_1000_ae5f
    mov word ptr [BP + -1ch],80h
LAB_1000_ae5f:
    cmp word ptr [_var_547],80h
    jnz LAB_1000_ae6e
    cmp word ptr [BP + -1ch],80h
    jnz LAB_1000_aeaa
LAB_1000_ae6e:
    mov AX,24h
    imul word ptr [BP + -20h]
    mov SI,AX
    push word ptr [BP + -24h]
    call _sub_1D1C8
    add SP,2h
    db 2Dh, 02h, 00h ; sub AX,2h (force imm16 encoding)
    neg AX
    push AX
    sub AX,AX
    push AX
    push AX
    push word ptr [SI + offset _stru_3B208 + 10]
    push word ptr [BP + -1ch]
    push word ptr [SI + offset _stru_3B208 + 8]
    push word ptr [SI + offset _stru_3B208 + 6]
    push word ptr [SI + offset _stru_3B208 + 4]
    push word ptr [SI + offset _stru_3B208 + 2]
    mov AX,5h
    push AX
    call sub_1C9D2
    add SP,14h
LAB_1000_aeaa:
    mov AX,24h
    imul word ptr [BP + -20h]
    mov SI,AX
    mov AX,2h
    sub AX,word ptr [BP + -24h]
    push AX
    push word ptr [SI + offset _stru_3B208 + 14]
    push word ptr [SI + offset _stru_3B208 + 12]
    push word ptr [SI + offset _stru_3B208 + 10]
    push word ptr [SI + offset _stru_3B208]
    push word ptr [SI + offset _stru_3B208 + 8]
    push word ptr [SI + offset _stru_3B208 + 6]
    push word ptr [SI + offset _stru_3B208 + 4]
    push word ptr [SI + offset _stru_3B208 + 2]
    cmp word ptr [word_3C016],-10h
    jle LAB_1000_aee4
    sub DI,DI
    jmp LAB_1000_aee7
LAB_1000_aee4:
    mov DI,1h
LAB_1000_aee7:
    shl DI,1h
    mov BX,word ptr [SI + offset _stru_3B208 + 16]
    mov CL,5h
    shl BX,CL
    push word ptr [BX + DI + offset aFlogger + 18]
    call sub_1C9D2
    add SP,14h
    jmp LAB_1000_af1d
LAB_1000_aefd:
    mov AX,0fh
    push AX
    call _sub_19E44
    add SP,2h
    push word ptr [_var_282]
    push word ptr [_var_279]
    push word ptr [_var_282]
    push word ptr [_var_279]
    call _sub_19C0C
    add SP,8h
LAB_1000_af1d:
    jmp LAB_1000_ad16
LAB_1000_af20:
    cmp word ptr [BP + -2ch],-1h
    jz LAB_1000_af32
    mov AX,word ptr [BP + -2ch]
    mov word ptr [_word_336F2],AX
    mov word ptr [_word_39604],0h
LAB_1000_af32:
    test byte ptr [_word_336F2],80h
    jz LAB_1000_af3f
    mov word ptr [_word_336F2],0ffffh
LAB_1000_af3f:
    mov word ptr [BP + -20h],0h
    jmp LAB_1000_af49
LAB_1000_af46:
    inc word ptr [BP + -20h]
LAB_1000_af49:
    cmp word ptr [BP + -20h],0ch
    jl LAB_1000_af52
    jmp LAB_1000_b026
LAB_1000_af52:
    mov AX,18h
    imul word ptr [BP + -20h]
    mov SI,AX
    cmp word ptr [SI + offset _stru_335C4 + 14],0h
    jnz LAB_1000_af64
    jmp LAB_1000_b023
LAB_1000_af64:
    push word ptr [SI + offset _stru_335C4 + 4]
    push word ptr [SI + offset _stru_335C4 + 2]
    push word ptr [SI + offset _stru_335C4]
    call sub_1C488
    add SP,6h
    cmp word ptr [_var_279],-1h
    jnz LAB_1000_af80
    jmp LAB_1000_b023
LAB_1000_af80:
    cmp word ptr [word_3C016],-20h
    jle LAB_1000_aff8
    mov AX,18h
    imul word ptr [BP + -20h]
    mov SI,AX
    test byte ptr [_keyValue],80h
    jz LAB_1000_afa3
    cmp word ptr [_keyValue],8bh
    jz LAB_1000_afa3
    mov AX,3h
    jmp LAB_1000_afa6
LAB_1000_afa3:
    mov AX,1h
LAB_1000_afa6:
    push AX
    mov AX,word ptr [SI + offset _stru_335C4 + 12]
    add AH,20h
    push AX
    push word ptr [SI + offset _stru_335C4 + 10]
    push word ptr [SI + offset _stru_335C4 + 8]
    push word ptr [SI + offset _stru_335C4 + 4]
    mov AX,word ptr [SI + offset _stru_335C4 + 2]
    sub DX,DX
    mov CL,5h
LAB_1000_afc3:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_afcd
    jmp LAB_1000_afc3
LAB_1000_afcd:
    push DX
    push AX
    mov AX,word ptr [SI + offset _stru_335C4]
    sub DX,DX
    mov CL,5h
LAB_1000_afd7:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_afe1
    jmp LAB_1000_afd7
LAB_1000_afe1:
    push DX
    push AX
    mov AX,12h
    imul word ptr [SI + offset _stru_335C4 + 16]
    mov BX,AX
    push word ptr [BX + offset _sams + 16]
    call sub_1C9D2
    add SP,14h
    jmp LAB_1000_b023
LAB_1000_aff8:
    cmp word ptr [BP + -20h],8h
    jge LAB_1000_b003
    mov AX,0ch
    jmp LAB_1000_b006
LAB_1000_b003:
    mov AX,0dh
LAB_1000_b006:
    push AX
    call _sub_19E44
    add SP,2h
    push word ptr [_var_282]
    push word ptr [_var_279]
    push word ptr [_var_282]
    push word ptr [_var_279]
    call _sub_19C0C
    add SP,8h
LAB_1000_b023:
    jmp LAB_1000_af46
LAB_1000_b026:
    cmp word ptr [word_3BFA2],0h
    jle LAB_1000_b097
    push word ptr [word_3BFA2]
    push word ptr [word_3BED6]
    push word ptr [word_3BEC2]
    call sub_1C488
    add SP,6h
    cmp word ptr [word_3C016],0h
    jge LAB_1000_b097
    cmp word ptr [word_3C016],0ff00h
    jle LAB_1000_b097
    cmp word ptr [word_3B4DC],0h
    jle LAB_1000_b05a
    mov AX,4h
    jmp LAB_1000_b05d
LAB_1000_b05a:
    mov AX,3h
LAB_1000_b05d:
    push AX
    sub AX,AX
    push AX
    push AX
    push AX
    push word ptr [word_3BFA2]
    mov AX,word ptr [word_3BED6]
    sub DX,DX
    mov CL,5h
LAB_1000_b06e:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_b078
    jmp LAB_1000_b06e
LAB_1000_b078:
    push DX
    push AX
    mov AX,word ptr [word_3BEC2]
    sub DX,DX
    mov CL,5h
LAB_1000_b081:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_b08b
    jmp LAB_1000_b081
LAB_1000_b08b:
    push DX
    push AX
    mov AX,0eh
    push AX
    call sub_1C9D2
    add SP,14h
LAB_1000_b097:
    test byte ptr [_keyValue],80h
    jnz LAB_1000_b0a1
    jmp LAB_1000_b141
LAB_1000_b0a1:
    cmp word ptr [_keyValue],8bh
    jnz LAB_1000_b0ac
    jmp LAB_1000_b141
LAB_1000_b0ac:
    cmp word ptr [_var_547],0h
    jnz LAB_1000_b0bd
    cmp word ptr [word_3BE3C],0h
    jz LAB_1000_b0bd
    jmp LAB_1000_b141
LAB_1000_b0bd:
    mov AX,2h
    sub AX,word ptr [BP + -24h]
    push AX
    push word ptr [_var_545]
    push word ptr [_var_544]
    push word ptr [_var_542]
    mov AX,word ptr [_var_547]
    db 05h, 10h, 00h ; add AX,10h (force imm16 encoding)
    push AX
    sub AX,AX
    mov DX,100h
    sub AX,word ptr [_dword_3B7F8]
    sbb DX,word ptr [_dword_3B7F8+2]
    push DX
    push AX
    push word ptr [_dword_3B7DA+2]
    push word ptr [_dword_3B7DA]
    mov AL,byte ptr [_planeFlags]
    and AL,1h
    cmp AL,1h
    sbb CX,CX
    neg CX
    add CX,6h
    push CX
    call sub_1C9D2
    add SP,14h
    cmp word ptr [_var_547],3e8h
    jnc LAB_1000_b141
    cmp word ptr [_word_330BC],0h
    jnz LAB_1000_b141
    mov AX,2h
    push AX
    sub AX,AX
    push AX
    push AX
    push word ptr [_var_542]
    push word ptr [_word_3BEBE]
    mov DX,100h
    sub AX,word ptr [_dword_3B7F8]
    sbb DX,word ptr [_dword_3B7F8+2]
    push DX
    push AX
    push word ptr [_dword_3B7DA+2]
    push word ptr [_dword_3B7DA]
    mov AX,15h
    push AX
    call sub_1C9D2
    add SP,14h
LAB_1000_b141:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
sub_1A9F8 endp
; ------------------------------seg000:0xb146------------------------------
; ------------------------------seg000:0xb147------------------------------
sub_1B147 proc near
    push BP
    mov BP,SP
    sub SP,34h
    push DI
    push SI
    mov AX,word ptr [word_39402]
    mov word ptr [_var_675],AX
    mov word ptr [word_39402],0h
    mov word ptr [BP + -1eh],0h
    jmp LAB_1000_b165
LAB_1000_b162:
    inc word ptr [BP + -1eh]
LAB_1000_b165:
    cmp word ptr [BP + -1eh],0ch
    jge LAB_1000_b1bf
    mov AX,18h
    imul word ptr [BP + -1eh]
    mov SI,AX
    cmp word ptr [SI + offset _stru_335C4 + 14],0h
    jz LAB_1000_b1bd
    push word ptr [SI + offset _stru_335C4 + 4]
    push word ptr [SI + offset _stru_335C4 + 2]
    push word ptr [SI + offset _stru_335C4]
    call sub_1C488
    add SP,6h
    cmp word ptr [_var_279],-1h
    jz LAB_1000_b1bd
    cmp word ptr [BP + -1eh],8h
    jge LAB_1000_b19e
    mov AX,0eh
    jmp LAB_1000_b1a1
LAB_1000_b19e:
    mov AX,0ah
LAB_1000_b1a1:
    push AX
    call _sub_19E44
    add SP,2h
    sub AX,AX
    push AX
    mov AX,6h
    push AX
    push word ptr [_var_282]
    push word ptr [_var_279]
    call sub_1C1B9
    add SP,8h
LAB_1000_b1bd:
    jmp LAB_1000_b162
LAB_1000_b1bf:
    mov AX,word ptr [_word_330C4]
    shl AX,1h
    shl AX,1h
    db 05h, 08h, 00h ; add AX,8h (force imm16 encoding)
    push AX
    call sub_15557
    add SP,2h
    mov CX,AX
    mov AX,200h
    cwd
    idiv CX
    mov word ptr [BP + -2eh],AX
    mov word ptr [BP + -1eh],0h
    jmp LAB_1000_b1e5
LAB_1000_b1e2:
    inc word ptr [BP + -1eh]
LAB_1000_b1e5:
    mov AX,word ptr [word_3AFA4]
    db 05h, 04h, 00h ; add AX,4h (force imm16 encoding)
    cmp word ptr [BP + -1eh],AX
    jl LAB_1000_b1f3
    jmp LAB_1000_b5be
LAB_1000_b1f3:
    mov AX,word ptr [BP + -1eh]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    shl AX,1h
    mov SI,AX
    cmp word ptr [SI + offset word_3C5AC],0h
    jnz LAB_1000_b20c
    jmp LAB_1000_b5bb
LAB_1000_b20c:
    push word ptr [SI + offset word_3C5B0]
    push word ptr [SI + offset word_3C5AE]
    push word ptr [SI + offset word_3C5AC]
    call sub_1C488
    add SP,6h
    mov AX,word ptr [_var_279]
    mov word ptr [BP + -2ch],AX
    mov AX,word ptr [_var_282]
    mov word ptr [BP + -32h],AX
    mov AX,word ptr [word_3C016]
    mov word ptr [BP + -4h],AX
    mov AX,word ptr [BP + -1eh]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    shl AX,1h
    mov SI,AX
    mov AX,word ptr [SI + offset word_3C5B6]
    sar AX,1h
    add AX,word ptr [SI + offset word_3C5B0]
    push AX
    mov AX,word ptr [SI + offset word_3C5B4]
    sar AX,1h
    add AX,word ptr [SI + offset word_3C5AE]
    push AX
    mov AX,word ptr [SI + offset word_3C5B2]
    sar AX,1h
    add AX,word ptr [SI + offset word_3C5AC]
    push AX
    call sub_1C488
    add SP,6h
    cmp word ptr [_var_279],-1h
    jnz LAB_1000_b270
    jmp LAB_1000_b5bb
LAB_1000_b270:
    cmp word ptr [BP + -2ch],-1h
    jnz LAB_1000_b279
    jmp LAB_1000_b5bb
LAB_1000_b279:
    mov AX,word ptr [_word_336E8]
    sar AX,1h
    sub AX,word ptr [BP + -1eh]
    db 25h, 07h, 00h ; and AX,7h (force imm16 encoding)
    mov word ptr [BP + -2ah],AX
    mov AX,word ptr [word_3AFA4]
    cmp word ptr [BP + -1eh],AX
    jge LAB_1000_b294
    mov AX,0dh
    jmp LAB_1000_b297
LAB_1000_b294:
    mov AX,0ch
LAB_1000_b297:
    push AX
    call _sub_19E44
    add SP,2h
    push word ptr [BP + -32h]
    push word ptr [BP + -2ch]
    push word ptr [_var_282]
    push word ptr [_var_279]
    call _sub_19C0C
    add SP,8h
    mov word ptr [BP + -0eh],0h
    mov AX,word ptr [word_3AFA4]
    cmp word ptr [BP + -1eh],AX
    jl LAB_1000_b2c2
    jmp LAB_1000_b3e0
LAB_1000_b2c2:
    mov word ptr [BP + -20h],0h
    jmp LAB_1000_b2cc
LAB_1000_b2c9:
    inc word ptr [BP + -20h]
LAB_1000_b2cc:
    mov AX,word ptr [_word_3C046]
    cmp word ptr [BP + -20h],AX
    jl LAB_1000_b2d7
    jmp LAB_1000_b3dd
LAB_1000_b2d7:
    mov AX,24h
    imul word ptr [BP + -20h]
    mov SI,AX
    mov AL,byte ptr [SI + offset _stru_3B208 + 18]
    and AL,22h
    cmp AL,2h
    jz LAB_1000_b2ec
    jmp LAB_1000_b3da
LAB_1000_b2ec:
    mov AX,24h
    imul word ptr [BP + -20h]
    mov BX,AX
    mov DI,word ptr [BP + -1eh]
    mov AX,DI
    shl DI,1h
    add DI,AX
    shl DI,1h
    shl DI,1h
    mov AX,word ptr [DI + offset word_3C5AE]
    sub AX,word ptr [BX + offset word_3B206]
    push AX
    call _abs
    add SP,2h
    mov CX,AX
    mov AX,24h
    imul word ptr [BP + -20h]
    mov BX,AX
    mov DI,word ptr [BP + -1eh]
    mov AX,DI
    shl DI,1h
    add DI,AX
    shl DI,1h
    shl DI,1h
    mov AX,word ptr [DI + offset word_3C5AC]
    sub AX,word ptr [BX + offset word_3B204]
    push AX
    mov DI,CX
    call _abs
    add SP,2h
    mov BX,word ptr [BP + -1eh]
    mov CX,BX
    shl BX,1h
    add BX,CX
    shl BX,1h
    shl BX,1h
    mov CX,word ptr [BX + offset word_3C5B0]
    sub CX,word ptr [SI + offset _stru_3B208]
    push CX
    mov word ptr [BP + -34h],AX
    call _abs
    add SP,2h
    mov CL,5h
    sar AX,CL
    add AX,word ptr [BP + -34h]
    add AX,DI
    mov word ptr [BP + -2ah],AX
    push AX
    call _abs
    add SP,2h
    mov word ptr [BP + -2ah],AX
    mov AX,word ptr [BP + -2eh]
    cwd
    mov CX,word ptr [word_330B8]
    inc CX
    idiv CX
    mov SI,AX
    cmp word ptr [BP + -2ah],SI
    jge LAB_1000_b3da
    mov word ptr [BP + -0eh],1h
    mov AX,24h
    imul word ptr [BP + -20h]
    mov BX,AX
    or byte ptr [BX + offset _stru_3B208 + 18],10h
    mov word ptr [word_39606],1h
    mov AX,word ptr [BP + -2ah]
    shl AX,1h
    cmp AX,SI
    jge LAB_1000_b3da
    push word ptr [BP + -20h]
    call sub_186F8
    add SP,2h
    mov AX,offset aDestroyedByGun
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    mov word ptr [word_39606],8h
    mov BX,word ptr [BP + -1eh]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    shl BX,1h
    mov word ptr [BX + offset word_3C5AC],0h
LAB_1000_b3da:
    jmp LAB_1000_b2c9
LAB_1000_b3dd:
    jmp LAB_1000_b476
LAB_1000_b3e0:
    mov BX,word ptr [BP + -1eh]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    shl BX,1h
    mov AX,word ptr [BX + offset word_3C5AE]
    sub AX,word ptr [_word_3BED0]
    push AX
    call _abs
    add SP,2h
    mov BX,word ptr [BP + -1eh]
    mov CX,BX
    shl BX,1h
    add BX,CX
    shl BX,1h
    shl BX,1h
    mov CX,word ptr [BX + offset word_3C5AC]
    sub CX,word ptr [_word_3BEC0]
    push CX
    mov SI,AX
    call _abs
    add SP,2h
    mov BX,word ptr [BP + -1eh]
    mov CX,BX
    shl BX,1h
    add BX,CX
    shl BX,1h
    shl BX,1h
    mov CX,word ptr [BX + offset word_3C5B0]
    sub CX,word ptr [_var_547]
    push CX
    mov DI,AX
    call _abs
    add SP,2h
    mov CL,5h
    sar AX,CL
    add AX,DI
    add AX,SI
    mov word ptr [BP + -2ah],AX
    push AX
    call _abs
    add SP,2h
    mov word ptr [BP + -2ah],AX
    db 3Dh, 20h, 00h ; cmp AX,20h (force imm16 encoding)
    jge LAB_1000_b476
    mov word ptr [BP + -0eh],1h
    mov AX,offset aHitByGunfire
    push AX
    call tempStrcpy
    add SP,2h
    mov AX,20h
    cwd
    mov CX,4h
    sub CX,word ptr [word_330B8]
    idiv CX
    cmp AX,word ptr [BP + -2ah]
    jle LAB_1000_b476
    call sub_18A44
LAB_1000_b476:
    cmp word ptr [BP + -0eh],0h
    jz LAB_1000_b4a6
    mov AX,word ptr [BP + -1eh]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    shl AX,1h
    mov SI,AX
    mov AX,word ptr [SI + offset word_3C5AC]
    mov word ptr [word_3BEBC],AX
    mov AX,word ptr [SI + offset word_3C5AE]
    mov word ptr [word_3BEC8],AX
    mov AX,word ptr [SI + offset word_3C5B0]
    mov word ptr [word_3BECE],AX
    mov word ptr [word_39606],0ffffh
LAB_1000_b4a6:
    mov AX,word ptr [BP + -1eh]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    shl AX,1h
    mov SI,AX
    cmp word ptr [SI + offset word_3C5B0],0h
    jl LAB_1000_b4bf
    jmp LAB_1000_b5bb
LAB_1000_b4bf:
    cmp word ptr [word_39606],0h
    jg LAB_1000_b4e1
    mov AX,word ptr [SI + offset word_3C5AC]
    mov word ptr [word_3BEBC],AX
    mov AX,word ptr [SI + offset word_3C5AE]
    mov word ptr [word_3BEC8],AX
    mov AX,word ptr [SI + offset word_3C5B0]
    mov word ptr [word_3BECE],AX
    mov word ptr [word_39606],0ffffh
LAB_1000_b4e1:
    mov BX,word ptr [BP + -1eh]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    shl BX,1h
    mov word ptr [BX + offset word_3C5AC],0h
    push word ptr [word_3BEC8]
    push word ptr [word_3BEBC]
    call sub_1C6BE
    add SP,4h
    mov word ptr [BP + -8h],AX
    db 3Dh, 0FFh, 0FFh ; cmp AX,0ffffh (force imm16 encoding)
    jnz LAB_1000_b50d
    jmp LAB_1000_b5bb
LAB_1000_b50d:
    mov BX,AX
    mov CL,4h
    shl BX,CL
    test byte ptr [BX + offset _stru_3AA5E + 6],80h
    jz LAB_1000_b51d
    jmp LAB_1000_b5bb
LAB_1000_b51d:
    mov BX,word ptr [word_39808]
    mov AX,word ptr [BX + 4h]
    mov DX,word ptr [BX + 6h]
    mov CL,5h
LAB_1000_b529:
    sar DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_b533
    jmp LAB_1000_b529
LAB_1000_b533:
    mov word ptr [BP + -24h],AX
    mov BX,word ptr [word_39808]
    mov AX,word ptr [BX + 8h]
    mov DX,word ptr [BX + 0ah]
    mov CL,5h
LAB_1000_b542:
    sar DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_b54c
    jmp LAB_1000_b542
LAB_1000_b54c:
    sub AX,8000h
    neg AX
    mov word ptr [BP + -26h],AX
    mov AX,word ptr [word_3BEC8]
    sub AX,word ptr [BP + -26h]
    push AX
    mov AX,word ptr [word_3BEBC]
    sub AX,word ptr [BP + -24h]
    push AX
    call _sub_1CFA6
    add SP,4h
    mov CX,AX
    mov AX,18h
    cwd
    mov BX,word ptr [word_330B8]
    add BX,2h
    idiv BX
    cmp CX,AX
    jge LAB_1000_b5bb
    mov BX,word ptr [BP + -8h]
    mov CL,4h
    shl BX,CL
    mov AL,byte ptr [BX + offset _stru_3AA5E + 12]
    and AL,7fh
    cmp AL,byte ptr [_byte_3C02A]
    jz LAB_1000_b5bb
    push word ptr [BP + -8h]
    call sub_187EA
    add SP,2h
    mov AX,offset aDestroyedByG_0
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    mov word ptr [word_39606],8h
    mov word ptr [word_3BECE],0h
LAB_1000_b5bb:
    jmp LAB_1000_b1e2
LAB_1000_b5be:
    cmp word ptr [word_39606],0h
    jnz LAB_1000_b5c8
    jmp LAB_1000_b6d2
LAB_1000_b5c8:
    push word ptr [word_3BECE]
    push word ptr [word_3BEC8]
    push word ptr [word_3BEBC]
    call sub_1C488
    add SP,6h
    cmp word ptr [_var_279],-1h
    jnz LAB_1000_b5e4
    jmp LAB_1000_b6c2
LAB_1000_b5e4:
    mov AX,100h
    cwd
    mov CX,word ptr [word_3C016]
    idiv CX
    push AX
    call _abs
    add SP,2h
    mov word ptr [BP + -22h],AX
    mov word ptr [BP + -1eh],0h
    jmp LAB_1000_b602
LAB_1000_b5ff:
    inc word ptr [BP + -1eh]
LAB_1000_b602:
    cmp word ptr [BP + -1eh],8h
    jl LAB_1000_b60b
    jmp LAB_1000_b6c2
LAB_1000_b60b:
    mov AX,4h
    push AX
    call randlmul
    add SP,2h
    db 05h, 0Ch, 00h ; add AX,0ch (force imm16 encoding)
    push AX
    call _sub_19E44
    add SP,2h
    cmp word ptr [word_3BECE],0h
    jle LAB_1000_b65e
    mov AX,word ptr [BP + -22h]
    shl AX,1h
    push AX
    call randlmul
    add SP,2h
    sub AX,word ptr [BP + -22h]
    add AX,word ptr [_var_282]
    push AX
    mov AX,word ptr [BP + -22h]
    shl AX,1h
    push AX
    call randlmul
    add SP,2h
    sub AX,word ptr [BP + -22h]
    add AX,word ptr [_var_279]
    push AX
    push word ptr [_var_282]
    push word ptr [_var_279]
    call _sub_19C0C
    add SP,8h
    jmp LAB_1000_b6bf
LAB_1000_b65e:
    mov AX,6000h
    push AX
    call randlmul
    add SP,2h
    sub AX,3000h
    mov word ptr [BP + -0ch],AX
    cmp word ptr [_word_330C2],0h
    jz LAB_1000_b67b
    mov AX,word ptr [_var_545]
    sub word ptr [BP + -0ch],AX
LAB_1000_b67b:
    push word ptr [BP + -22h]
    call randlmul
    add SP,2h
    mov word ptr [BP + -4h],AX
    push AX
    push word ptr [BP + -0ch]
    call _sub_1D178
    add SP,4h
    add AX,word ptr [_var_279]
    mov word ptr [BP + -2ch],AX
    push word ptr [BP + -4h]
    push word ptr [BP + -0ch]
    call _sub_1D190
    add SP,4h
    mov CX,word ptr [_var_282]
    sub CX,AX
    mov word ptr [BP + -32h],CX
    push CX
    push word ptr [BP + -2ch]
    push word ptr [_var_282]
    push word ptr [_var_279]
    call _sub_19C0C
    add SP,8h
LAB_1000_b6bf:
    jmp LAB_1000_b5ff
LAB_1000_b6c2:
    push word ptr [word_39606]
    call _sub_1D1C8
    add SP,2h
    sub word ptr [word_39606],AX
    jmp LAB_1000_b6d8
LAB_1000_b6d2:
    mov word ptr [_word_39604],0h
LAB_1000_b6d8:
    cmp word ptr [_word_330C2],0h
    jnz LAB_1000_b6e2
    jmp LAB_1000_c1b3
LAB_1000_b6e2:
    cmp word ptr [_var_593],0h
    jz LAB_1000_b6ef
    mov word ptr [_var_593],0h
LAB_1000_b6ef:
    cmp word ptr [_word_330BC],0h
    jz LAB_1000_b6fb
    mov AX,2h
    jmp LAB_1000_b6fe
LAB_1000_b6fb:
    mov AX,word ptr [_word_330BC]
LAB_1000_b6fe:
    push AX
    call _copySomeMem
    add SP,2h
    mov AX,0fh
    push AX
    call _sub_19E44
    add SP,2h
    mov AX,0c7h
    push AX
    mov AX,13fh
    push AX
    mov AX,0c7h
    push AX
    mov AX,13fh
    push AX
    call _sub_19BE1
    add SP,8h
    mov word ptr [_var_671],0h
    cmp word ptr [_word_3C45C],2h
    jz LAB_1000_b735
    jmp LAB_1000_b8ff
LAB_1000_b735:
    cmp word ptr [_keyValue],0h
    jz LAB_1000_b73f
    jmp LAB_1000_b8ff
LAB_1000_b73f:
    cmp word ptr [_word_336F4],0h
    jge LAB_1000_b749
    jmp LAB_1000_b8ff
LAB_1000_b749:
    mov SI,word ptr [_word_336F4]
    mov CL,4h
    shl SI,CL
    sub AX,AX
    push AX
    push word ptr [SI + offset _stru_3AA5E + 2]
    push word ptr [SI + offset _stru_3AA5E]
    call sub_1C488
    add SP,6h
    mov BX,word ptr [_missileSpecIndex]
    shl BX,1h
    shl BX,1h
    mov AX,1ah
    imul word ptr [BX + offset _missileSpecIndex]
    mov BX,AX
    mov AX,word ptr [BX + offset _missiles + 22]
    mov word ptr [BP + -1ah],AX
    db 3Dh, 1Ch, 00h ; cmp AX,1ch (force imm16 encoding)
    jnz LAB_1000_b7aa
    push word ptr [_word_336F4]
    call sub_1C7A2
    add SP,2h
    mov DX,word ptr [_var_547]
    mov CL,5h
    shr DX,CL
    mov CX,DX
    shl DX,1h
    shl DX,1h
    add DX,CX
    cmp AX,DX
    jnc LAB_1000_b7aa
    cmp word ptr [word_3C016],0h
    jge LAB_1000_b7aa
    mov word ptr [_var_671],1h
LAB_1000_b7aa:
    cmp word ptr [_var_279],-1h
    jnz LAB_1000_b7b4
    jmp LAB_1000_b8ff
LAB_1000_b7b4:
    cmp word ptr [_word_330BC],0h
    jz LAB_1000_b7c0
    mov AX,8h
    jmp LAB_1000_b7c2
LAB_1000_b7c0:
    sub AX,AX
LAB_1000_b7c2:
    push AX
    call _sub_19E44
    add SP,2h
    mov word ptr [BP + -6h],0h
    push word ptr [_word_336F4]
    mov BX,word ptr [_missileSpecIndex]
    shl BX,1h
    shl BX,1h
    push word ptr [BX + offset _missileSpecIndex]
    call sub_1A224
    add SP,4h
    or AX,AX
    jz LAB_1000_b7ed
    mov AX,4h
    jmp LAB_1000_b7ef
LAB_1000_b7ed:
    sub AX,AX
LAB_1000_b7ef:
    mov word ptr [BP + -30h],AX
    or AX,AX
    jnz LAB_1000_b7f9
    jmp LAB_1000_b8bb
LAB_1000_b7f9:
    cmp word ptr [BP + -1ah],4h
    jnz LAB_1000_b811
    mov BX,word ptr [_word_336F4]
    mov CL,4h
    shl BX,CL
    cmp word ptr [BX + offset _stru_3AA5E + 4],0h
    jnz LAB_1000_b811
    jmp LAB_1000_b8bb
LAB_1000_b811:
    mov BX,word ptr [_missileSpecIndex]
    shl BX,1h
    shl BX,1h
    cmp word ptr [BX + offset _missileSpecIndex + 2],0h
    jnz LAB_1000_b823
    jmp LAB_1000_b8b9
LAB_1000_b823:
    mov AX,0fh
    push AX
    call _sub_19E44
    add SP,2h
    mov AX,word ptr [_var_282]
    db 2Dh, 38h, 00h ; sub AX,38h (force imm16 encoding)
    push AX
    mov AX,word ptr [_var_279]
    db 2Dh, 0A0h, 00h ; sub AX,0a0h (force imm16 encoding)
    push AX
    call _sub_1CFA6
    add SP,4h
    db 3Dh, 30h, 00h ; cmp AX,30h (force imm16 encoding)
    jl LAB_1000_b84d
    cmp word ptr [_var_671],0h
    jz LAB_1000_b8b3
LAB_1000_b84d:
    mov AX,12h
    imul word ptr [BP + -1ah]
    mov SI,AX
    mov AX,word ptr [word_3C016]
    neg AX
    cwd
    mov CX,7h
    idiv CX
    cmp AX,word ptr [SI + offset _sams + 8]
    jge LAB_1000_b8b3
    cmp word ptr [SI + offset _sams + 12],CX
    jz LAB_1000_b8b3
    cmp word ptr [SI + offset _sams + 12],1ch
    jnz LAB_1000_b87a
    cmp word ptr [_var_671],0h
    jz LAB_1000_b8b1
LAB_1000_b87a:
    mov word ptr [_var_671],1h
    mov word ptr [BP + -6h],1h
    mov AX,12h
    imul word ptr [BP + -1ah]
    mov BX,AX
    mov AX,word ptr [word_3C016]
    neg AX
    sar AX,1h
    sar AX,1h
    cmp word ptr [BX + offset _sams + 8],AX
    jle LAB_1000_b8b1
    cmp byte ptr [_gfxModeUnset],0h
    jz LAB_1000_b8a7
    sub AX,AX
    jmp LAB_1000_b8aa
LAB_1000_b8a7:
    mov AX,0ch
LAB_1000_b8aa:
    push AX
    call _sub_19E44
    add SP,2h
LAB_1000_b8b1:
    jmp LAB_1000_b8b9
LAB_1000_b8b3:
    mov word ptr [_var_671],0h
LAB_1000_b8b9:
    jmp LAB_1000_b8dc
LAB_1000_b8bb:
    cmp word ptr [BP + -1ah],-1h
    jz LAB_1000_b8d6
    cmp word ptr [_word_330BC],0h
    jz LAB_1000_b8cd
    mov AX,8h
    jmp LAB_1000_b8cf
LAB_1000_b8cd:
    sub AX,AX
LAB_1000_b8cf:
    push AX
    call _sub_19E44
    add SP,2h
LAB_1000_b8d6:
    mov word ptr [_var_671],0h
LAB_1000_b8dc:
    push word ptr [BP + -6h]
    cmp word ptr [BP + -30h],0h
    jz LAB_1000_b8ed
    mov AX,word ptr [BP + -30h]
    db 05h, 05h, 00h ; add AX,5h (force imm16 encoding)
    jmp LAB_1000_b8f0
LAB_1000_b8ed:
    mov AX,9h
LAB_1000_b8f0:
    push AX
    push word ptr [_var_282]
    push word ptr [_var_279]
    call sub_1C1B9
    add SP,8h
LAB_1000_b8ff:
    cmp word ptr [word_336F8],0h
    jle LAB_1000_b94a
    cmp word ptr [word_3BE96],0h
    jl LAB_1000_b94a
    mov SI,word ptr [word_3BE96]
    mov CL,4h
    shl SI,CL
    sub AX,AX
    push AX
    push word ptr [SI + offset _stru_3AA5E + 2]
    push word ptr [SI + offset _stru_3AA5E]
    call sub_1C488
    add SP,6h
    mov AX,word ptr [_word_330C4]
    sub AX,word ptr [word_336F8]
    push AX
    push word ptr [word_38F72]
    mov BX,word ptr [word_3BE96]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _word_3AA5C]
    shl BX,1h
    push word ptr [BX + offset _word_3C0A2]
    call sub_1C371
    add SP,6h
LAB_1000_b94a:
    and byte ptr [_var_730],0fdh
    mov BX,word ptr [_var_564]
    mov word ptr [BX + 2h],4h
    mov BX,word ptr [_var_565]
    mov word ptr [BX + 2h],4h
    cmp word ptr [_word_3C09E],13h
    jz LAB_1000_b96b
    jmp LAB_1000_bbb6
LAB_1000_b96b:
    cmp word ptr [_word_3C45C],2h
    jz LAB_1000_b97c
    cmp word ptr [_word_3C45C],0h
    jz LAB_1000_b97c
    jmp LAB_1000_bbb6
LAB_1000_b97c:
    cmp word ptr [_word_336F4],-1h
    jnz LAB_1000_b986
    jmp LAB_1000_bbb6
LAB_1000_b986:
    mov AX,word ptr [_word_336F4]
    db 25h, 7Fh, 00h ; and AX,7fh (force imm16 encoding)
    mov word ptr [BP + -28h],AX
    mov SI,AX
    mov CL,4h
    shl SI,CL
    mov AX,0ffffh
    push AX
    mov AX,1h
    push AX
    sub AX,AX
    push AX
    push AX
    push AX
    push AX
    push word ptr [SI + offset _stru_3AA5E + 2]
    push word ptr [SI + offset _stru_3AA5E]
    push word ptr [BP + -28h]
    call sub_1C864
    add SP,2h
    push AX
    call sub_1CB42
    add SP,12h
    call sub_1C2F8
    push word ptr [BP + -28h]
    call sub_1C7A2
    add SP,2h
    push AX
    call sub_1C40B
    add SP,2h
    mov AX,0fh
    push AX
    mov AX,0aah
    push AX
    mov AX,0f4h
    push AX
    mov AX,offset strBuf
    push AX
    call _draw2Strings
    add SP,8h
    mov BX,word ptr [BP + -28h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _stru_3AA5E + 12]
    and BX,7fh
    shl BX,1h
    push word ptr [BX + offset _word_3C0A2]
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,0fh
    push AX
    mov AX,82h
    push AX
    mov AX,offset strBuf
    push AX
    call _strlen
    add SP,2h
    shl AX,1h
    sub AX,10ch
    neg AX
    push AX
    mov AX,offset strBuf
    push AX
    call _draw2Strings
    add SP,8h
    mov BX,word ptr [BP + -28h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _word_3AA5C]
    shl BX,1h
    push word ptr [BX + offset _word_3C0A2]
    call _strlen
    add SP,2h
    or AX,AX
    jz LAB_1000_bab1
    mov BX,word ptr [BP + -28h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _stru_3AA5E + 12]
    and BX,7fh
    shl BX,1h
    push word ptr [BX + offset _word_3C0A2]
    call _strlen
    add SP,2h
    or AX,AX
    jz LAB_1000_ba64
    mov AX,offset aAt_0
    jmp LAB_1000_ba67
LAB_1000_ba64:
    mov AX,5bf2h
LAB_1000_ba67:
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov BX,word ptr [BP + -28h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _word_3AA5C]
    shl BX,1h
    push word ptr [BX + offset _word_3C0A2]
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,0fh
    push AX
    mov AX,88h
    push AX
    mov AX,offset strBuf
    push AX
    call _strlen
    add SP,2h
    shl AX,1h
    sub AX,10ch
    neg AX
    push AX
    mov AX,offset strBuf
    push AX
    call _draw2Strings
    add SP,8h
LAB_1000_bab1:
    cmp word ptr [_word_3C45C],0h
    jnz LAB_1000_baf3
    mov SI,word ptr [_word_336F4]
    mov CL,4h
    shl SI,CL
    sub AX,AX
    push AX
    push word ptr [SI + offset _stru_3AA5E + 2]
    push word ptr [SI + offset _stru_3AA5E]
    call sub_1C488
    add SP,6h
    mov AX,0fh
    push AX
    call _sub_19E44
    add SP,2h
    sub AX,AX
    push AX
    mov AX,8h
    push AX
    push word ptr [_var_282]
    push word ptr [_var_279]
    call sub_1C1B9
    add SP,8h
    jmp LAB_1000_bb99
LAB_1000_baf3:
    mov AX,word ptr [_word_336F4]
    cmp word ptr [word_3B146],AX
    jnz LAB_1000_bb15
    mov AX,0fh
    push AX
    mov AX,8eh
    push AX
    mov AX,0ech
    push AX
    mov AX,offset aPrimaryTarget
    push AX
    call _draw2Strings
    add SP,8h
    jmp LAB_1000_bb99
LAB_1000_bb15:
    mov AX,word ptr [_word_336F4]
    cmp word ptr [word_3B158],AX
    jnz LAB_1000_bb36
    mov AX,0fh
    push AX
    mov AX,8eh
    push AX
    mov AX,0ech
    push AX
    mov AX,offset aSecondaryTarget
    push AX
    call _draw2Strings
    add SP,8h
    jmp LAB_1000_bb99
LAB_1000_bb36:
    test byte ptr [_word_336E8],1h
    jnz LAB_1000_bb99
    cmp word ptr [word_330BA],2h
    jge LAB_1000_bb59
    mov BX,word ptr [BP + -28h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _stru_3AA5E + 12]
    and BX,7fh
    test byte ptr [BX + offset _byte_3BFA4],0c0h
    jnz LAB_1000_bb83
LAB_1000_bb59:
    mov SI,word ptr [BP + -28h]
    mov CL,4h
    shl SI,CL
    test word ptr [SI + offset _stru_3AA5E + 6],500h
    jnz LAB_1000_bb83
    mov DI,word ptr [SI + offset _stru_3AA5E + 2]
    mov CL,0bh
    shr DI,CL
    mov CL,4h
    shl DI,CL
    mov BX,word ptr [SI + offset _stru_3AA5E]
    mov CL,0bh
    shr BX,CL
    test byte ptr [BX + DI + offset _byte_3AFAC],1h
    jz LAB_1000_bb99
LAB_1000_bb83:
    mov AX,0fh
    push AX
    mov AX,8eh
    push AX
    mov AX,0fch
    push AX
    mov AX,offset aNoTarget
    push AX
    call _draw2Strings
    add SP,8h
LAB_1000_bb99:
    mov AX,word ptr [_var_542]
    add AX,word ptr [_word_3C6AC+206h]
    sub AX,word ptr [_var_674]
    push AX
    call _abs
    add SP,2h
    cmp AX,2000h
    jle LAB_1000_bbb6
    mov word ptr [_word_336F4],0ffffh
LAB_1000_bbb6:
    mov AX,1h
    push AX
    call sub_1D21E
    add SP,2h
    mov word ptr [_var_677],AX
    cmp word ptr [_word_3C45C],1h
    jz LAB_1000_bbcd
    jmp LAB_1000_bccd
LAB_1000_bbcd:
    cmp word ptr [_keyValue],0h
    jz LAB_1000_bbd7
    jmp LAB_1000_bccd
LAB_1000_bbd7:
    test byte ptr [_word_336F2],80h
    jz LAB_1000_bbe1
    jmp LAB_1000_bccd
LAB_1000_bbe1:
    mov AX,24h
    imul word ptr [_word_336F2]
    mov SI,AX
    push word ptr [SI + offset _stru_3B208]
    push word ptr [SI + offset word_3B206]
    push word ptr [SI + offset word_3B204]
    call sub_1C488
    add SP,6h
    cmp word ptr [_var_279],-1h
    jnz LAB_1000_bc06
    jmp LAB_1000_bccd
LAB_1000_bc06:
    cmp word ptr [_word_330BC],0h
    jz LAB_1000_bc12
    mov AX,8h
    jmp LAB_1000_bc14
LAB_1000_bc12:
    sub AX,AX
LAB_1000_bc14:
    push AX
    call _sub_19E44
    add SP,2h
    mov word ptr [BP + -6h],0h
    mov SI,word ptr [_missileSpecIndex]
    mov CL,2h
    shl SI,CL
    mov AX,1ah
    imul word ptr [SI + offset _missileSpecIndex]
    mov BX,AX
    mov AX,word ptr [BX + offset _missiles + 22]
    mov word ptr [BP + -1ah],AX
    cmp word ptr [SI + offset _missileSpecIndex + 2],0h
    jz LAB_1000_bcb8
    mov AX,12h
    imul word ptr [BP + -1ah]
    mov BX,AX
    cmp word ptr [BX + offset _sams + 12],7h
    jnz LAB_1000_bcb8
    mov AX,0fh
    push AX
    call _sub_19E44
    add SP,2h
    mov AX,word ptr [_var_282]
    db 2Dh, 38h, 00h ; sub AX,38h (force imm16 encoding)
    push AX
    mov AX,word ptr [_var_279]
    db 2Dh, 0A0h, 00h ; sub AX,0a0h (force imm16 encoding)
    push AX
    call _sub_1CFA6
    add SP,4h
    db 3Dh, 30h, 00h ; cmp AX,30h (force imm16 encoding)
    jge LAB_1000_bcb8
    mov AX,word ptr [word_3C016]
    neg AX
    mov SI,AX
    mov AX,12h
    imul word ptr [BP + -1ah]
    mov BX,AX
    mov DI,word ptr [BX + offset _sams + 8]
    mov AX,SI
    mov CL,3h
    sar AX,CL
    cmp AX,DI
    jge LAB_1000_bcb8
    mov word ptr [_var_671],1h
    mov word ptr [BP + -6h],1h
    mov AX,SI
    sar AX,1h
    sar AX,1h
    cmp AX,DI
    jge LAB_1000_bcb8
    cmp byte ptr [_gfxModeUnset],0h
    jz LAB_1000_bcae
    sub AX,AX
    jmp LAB_1000_bcb1
LAB_1000_bcae:
    mov AX,0ch
LAB_1000_bcb1:
    push AX
    call _sub_19E44
    add SP,2h
LAB_1000_bcb8:
    push word ptr [BP + -6h]
    mov AX,9h
    push AX
    push word ptr [_var_282]
    push word ptr [_var_279]
    call sub_1C1B9
    add SP,8h
LAB_1000_bccd:
    cmp word ptr [_word_3C09E],13h
    jz LAB_1000_bcd7
    jmp LAB_1000_be32
LAB_1000_bcd7:
    cmp word ptr [_word_3C45C],1h
    jz LAB_1000_bce1
    jmp LAB_1000_be32
LAB_1000_bce1:
    cmp word ptr [_word_336F2],-1h
    jnz LAB_1000_bceb
    jmp LAB_1000_be32
LAB_1000_bceb:
    mov AX,word ptr [_word_336F2]
    db 25h, 7Fh, 00h ; and AX,7fh (force imm16 encoding)
    mov word ptr [BP + -28h],AX
    mov AX,24h
    imul word ptr [BP + -28h]
    mov SI,AX
    mov AX,1h
    push AX
    push AX
    push word ptr [SI + offset _stru_3B208 + 14]
    push word ptr [SI + offset _stru_3B208 + 12]
    push word ptr [SI + offset _stru_3B208 + 10]
    push word ptr [SI + offset _stru_3B208]
    push word ptr [SI + offset word_3B206]
    push word ptr [SI + offset word_3B204]
    mov BX,word ptr [SI + offset _stru_3B208 + 16]
    mov CL,5h
    shl BX,CL
    push word ptr [BX + offset aFlogger + 18]
    call sub_1CB42
    add SP,12h
    call sub_1C2F8
    mov AX,24h
    imul word ptr [BP + -28h]
    mov SI,AX
    mov AX,word ptr [_word_3BED0]
    sub AX,word ptr [SI + offset word_3B206]
    push AX
    mov AX,word ptr [_word_3BEC0]
    sub AX,word ptr [SI + offset word_3B204]
    push AX
    call _sub_1CFA6
    add SP,4h
    push AX
    call sub_1C40B
    add SP,2h
    mov AX,0fh
    push AX
    mov AX,0aah
    push AX
    mov AX,0f4h
    push AX
    mov AX,offset strBuf
    push AX
    call _draw2Strings
    add SP,8h
    mov AX,24h
    imul word ptr [BP + -28h]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_3B208 + 16]
    mov word ptr [BP + -1eh],AX
    mov CL,5h
    shl AX,CL
    add AX,2c8h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,word ptr [BP + -1eh]
    mov CL,5h
    shl AX,CL
    add AX,2cfh
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,0fh
    push AX
    mov AX,86h
    push AX
    mov AX,0f8h
    push AX
    mov AX,offset strBuf
    push AX
    call _draw2Strings
    add SP,8h
    mov BX,word ptr [BP + -1eh]
    mov CL,5h
    shl BX,CL
    cmp word ptr [BX + offset aFlogger + 16],-1h
    jnz LAB_1000_bde0
    test byte ptr [_word_336E8],1h
    jnz LAB_1000_bde0
    mov AX,0fh
    push AX
    mov AX,8ch
    push AX
    mov AX,0fch
    push AX
    mov AX,offset aNoTarget_0
    push AX
    call _draw2Strings
    add SP,8h
LAB_1000_bde0:
    cmp word ptr [_word_38FDC],0h
    jz LAB_1000_be32
    test byte ptr [_word_336E8],1h
    jz LAB_1000_be32
    mov AX,24h
    imul word ptr [BP + -28h]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_3B208 + 20]
    cwd
    push DX
    push AX
    mov AX,8000h
    sub AX,word ptr [SI + offset _stru_3B208 + 12]
    sub CX,CX
    push CX
    push AX
    call __aNlmul
    mov CL,0fh
LAB_1000_be0d:
    shr DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_be17
    jmp LAB_1000_be0d
LAB_1000_be17:
    mov word ptr [_var_676],AX
    push AX
    push word ptr [SI + offset _stru_3B208 + 14]
    call _sub_1D178
    add SP,4h
    push AX
    call _abs
    add SP,2h
    sar AX,1h
    sub word ptr [_var_676],AX
LAB_1000_be32:
    mov BX,word ptr [_var_564]
    mov word ptr [BX + 2h],2h
    mov BX,word ptr [_var_565]
    mov word ptr [BX + 2h],2h
    cmp word ptr [word_336F8],0h
    jle LAB_1000_be9c
    cmp word ptr [word_3BE96],0h
    jge LAB_1000_be9c
    mov AX,0ffffh
    sub AX,word ptr [word_3BE96]
    mov word ptr [BP + -1eh],AX
    mov AX,24h
    imul word ptr [BP + -1eh]
    mov SI,AX
    push word ptr [SI + offset _stru_3B208]
    push word ptr [SI + offset word_3B206]
    push word ptr [SI + offset word_3B204]
    call sub_1C488
    add SP,6h
    mov AX,word ptr [_word_330C4]
    sub AX,word ptr [word_336F8]
    push AX
    push word ptr [word_38F72]
    mov AX,24h
    imul word ptr [BP + -1eh]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_3B208 + 16]
    mov CL,5h
    shl AX,CL
    add AX,2c8h
    push AX
    call sub_1C371
    add SP,6h
LAB_1000_be9c:
    cmp word ptr [_word_3C45C],2h
    jz LAB_1000_bea6
    jmp LAB_1000_c149
LAB_1000_bea6:
    cmp word ptr [_keyValue],0h
    jz LAB_1000_beb0
    jmp LAB_1000_c149
LAB_1000_beb0:
    mov BX,word ptr [_missileSpecIndex]
    shl BX,1h
    shl BX,1h
    mov AX,1ah
    imul word ptr [BX + offset _missileSpecIndex]
    mov BX,AX
    mov AX,word ptr [BX + offset _missiles + 22]
    mov word ptr [BP + -10h],AX
    db 3Dh, 1Eh, 00h ; cmp AX,1eh (force imm16 encoding)
    jz LAB_1000_bed0
    jmp LAB_1000_bfb6
LAB_1000_bed0:
    push word ptr [_var_545]
    call _abs
    add SP,2h
    cmp AX,2000h
    jl LAB_1000_bee2
    jmp LAB_1000_bfb6
LAB_1000_bee2:
    call sub_1C82D
    mov word ptr [BP + -0ch],AX
    mov AX,20h
    push AX
    mov AX,word ptr [BP + -0ch]
    neg AX
    push AX
    call _sub_1D178
    add SP,4h
    mov CX,AX
    inc CX
    push word ptr [_var_548]
    push word ptr [BP + -0ch]
    mov SI,CX
    call _sub_1D190
    add SP,4h
    cwd
    idiv SI
    mov word ptr [BP + -16h],AX
    push AX
    push word ptr [_var_542]
    call _sub_1D178
    add SP,4h
    add AX,word ptr [_word_3BEC0]
    mov word ptr [BP + -24h],AX
    push word ptr [BP + -16h]
    push word ptr [_var_542]
    call _sub_1D190
    add SP,4h
    mov CX,word ptr [_word_3BED0]
    sub CX,AX
    mov word ptr [BP + -26h],CX
    sub AX,AX
    push AX
    push CX
    push word ptr [BP + -24h]
    call sub_1C488
    add SP,6h
    cmp word ptr [_var_279],-1h
    jnz LAB_1000_bf76
    mov AX,60h
    sub AX,word ptr [_word_3C008]
    push AX
    push word ptr [_var_545]
    call _sub_1D178
    add SP,4h
    shl AX,1h
    shl AX,1h
    cwd
    mov CX,3h
    idiv CX
    db 05h, 0A0h, 00h ; add AX,0a0h (force imm16 encoding)
    mov word ptr [_var_279],AX
    mov word ptr [_var_282],60h
    jmp LAB_1000_bf96
LAB_1000_bf76:
    mov AX,0ch
    push AX
    call _sub_19E44
    add SP,2h
    mov AX,1h
    push AX
    mov AX,5h
    push AX
    push word ptr [_var_282]
    push word ptr [_var_279]
    call sub_1C1B9
    add SP,8h
LAB_1000_bf96:
    mov AX,0fh
    push AX
    call _sub_19E44
    add SP,2h
    push word ptr [_var_282]
    push word ptr [_var_279]
    push word ptr [_word_3C008]
    mov AX,0a0h
    push AX
    call sub_19DB0
    add SP,8h
LAB_1000_bfb6:
    cmp word ptr [BP + -10h],1eh
    jz LAB_1000_bfc5
    cmp word ptr [BP + -10h],1dh
    jz LAB_1000_bfc5
    jmp LAB_1000_c149
LAB_1000_bfc5:
    cmp word ptr [_word_336F4],0h
    jge LAB_1000_bfcf
    jmp LAB_1000_c149
LAB_1000_bfcf:
    push word ptr [_var_547]
    mov AX,80h
    push AX
    push word ptr [_var_542]
    call _sub_1D190
    add SP,4h
    mov BX,word ptr [_word_336F4]
    mov CL,4h
    shl BX,CL
    mov CX,word ptr [BX + offset _stru_3AA5E + 2]
    sub CX,AX
    push CX
    mov AX,80h
    push AX
    push word ptr [_var_542]
    call _sub_1D178
    add SP,4h
    mov BX,word ptr [_word_336F4]
    mov CL,4h
    shl BX,CL
    mov CX,word ptr [BX + offset _stru_3AA5E]
    add CX,AX
    push CX
    call sub_1C488
    add SP,6h
    cmp word ptr [_var_279],-1h
    jnz LAB_1000_c01d
    jmp LAB_1000_c149
LAB_1000_c01d:
    cmp word ptr [BP + -10h],1eh
    jnz LAB_1000_c058
    mov SI,word ptr [_word_336F4]
    mov CL,4h
    shl SI,CL
    mov AX,40h
    push AX
    sub AX,AX
    push AX
    mov AX,word ptr [BP + -26h]
    sub AX,word ptr [SI + offset _stru_3AA5E + 2]
    push AX
    mov AX,word ptr [BP + -24h]
    sub AX,word ptr [SI + offset _stru_3AA5E]
    push AX
    call _sub_1CFA6
    add SP,4h
    mov CL,3h
    sar AX,CL
    push AX
    call _sub_1CF64
    add SP,6h
    mov word ptr [word_3C016],AX
    jmp LAB_1000_c077
LAB_1000_c058:
    mov AX,40h
    push AX
    sub AX,AX
    push AX
    push word ptr [_word_336F4]
    call sub_1C7A2
    add SP,2h
    mov CL,3h
    sar AX,CL
    push AX
    call _sub_1CF64
    add SP,6h
    mov word ptr [word_3C016],AX
LAB_1000_c077:
    mov AX,0ch
    push AX
    call _sub_19E44
    add SP,2h
    mov AX,9fh
    sub AX,word ptr [word_3C016]
    mov SI,AX
    mov AX,1eh
    push AX
    push SI
    mov AX,21h
    push AX
    push SI
    call _sub_19C0C
    add SP,8h
    mov SI,word ptr [word_3C016]
    add SI,0a0h
    mov AX,1eh
    push AX
    push SI
    mov AX,21h
    push AX
    push SI
    call _sub_19C0C
    add SP,8h
    mov AX,1eh
    push AX
    mov AX,word ptr [word_3C016]
    db 05h, 0A0h, 00h ; add AX,0a0h (force imm16 encoding)
    push AX
    mov AX,1eh
    push AX
    mov AX,9fh
    sub AX,word ptr [word_3C016]
    push AX
    call _sub_19C0C
    add SP,8h
    mov AX,0fh
    push AX
    call _sub_19E44
    add SP,2h
    mov AX,word ptr [_var_282]
    db 2Dh, 04h, 00h ; sub AX,4h (force imm16 encoding)
    push AX
    push word ptr [_var_279]
    push word ptr [_var_282]
    mov AX,word ptr [_var_279]
    db 2Dh, 04h, 00h ; sub AX,4h (force imm16 encoding)
    push AX
    call sub_19DB0
    add SP,8h
    push word ptr [_var_282]
    mov AX,word ptr [_var_279]
    db 05h, 04h, 00h ; add AX,4h (force imm16 encoding)
    push AX
    mov AX,word ptr [_var_282]
    db 2Dh, 04h, 00h ; sub AX,4h (force imm16 encoding)
    push AX
    push word ptr [_var_279]
    call sub_19DB0
    add SP,8h
    mov AX,word ptr [_var_282]
    db 05h, 04h, 00h ; add AX,4h (force imm16 encoding)
    push AX
    push word ptr [_var_279]
    push word ptr [_var_282]
    mov AX,word ptr [_var_279]
    db 05h, 04h, 00h ; add AX,4h (force imm16 encoding)
    push AX
    call sub_19DB0
    add SP,8h
    push word ptr [_var_282]
    mov AX,word ptr [_var_279]
    db 2Dh, 04h, 00h ; sub AX,4h (force imm16 encoding)
    push AX
    mov AX,word ptr [_var_282]
    db 05h, 04h, 00h ; add AX,4h (force imm16 encoding)
    push AX
    push word ptr [_var_279]
    call sub_19DB0
    add SP,8h
LAB_1000_c149:
    cmp word ptr [word_39606],0h
    jz LAB_1000_c193
    cmp word ptr [_word_3C09E],13h
    jnz LAB_1000_c193
    cmp word ptr [_word_39604],0h
    jz LAB_1000_c193
    cmp word ptr [word_39402],0h
    jz LAB_1000_c193
    sub AX,AX
    push AX
    mov AX,20h
    push AX
    push AX
    mov AX,3fh
    push AX
    push word ptr [word_39606]
    call _abs
    add SP,2h
    db 2Dh, 08h, 00h ; sub AX,8h (force imm16 encoding)
    neg AX
    mov CL,5h
    shl AX,CL
    push AX
    mov AX,8ch
    push AX
    mov AX,0fch
    push AX
    call _sub_1A8C8
    add SP,0eh
LAB_1000_c193:
    cmp word ptr [_word_3C09E],13h
    jnz LAB_1000_c1b3
    cmp word ptr [_var_675],0h
    jz LAB_1000_c1b3
    cmp word ptr [word_39402],0h
    jnz LAB_1000_c1b3
    mov AX,3h
    push AX
    push AX
    call _sub_19FCC
    add SP,4h
LAB_1000_c1b3:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
sub_1B147 endp
; ------------------------------seg000:0xc1b8------------------------------
; ------------------------------seg000:0xc1b9------------------------------
sub_1C1B9 proc near
    push BP
    mov BP,SP
    sub SP,0ah
    push SI
    cmp word ptr [_word_330C2],0h
    jnz LAB_1000_c1ca
    jmp LAB_1000_c2f3
LAB_1000_c1ca:
    cmp byte ptr [_var_456],0h
    jz LAB_1000_c1d4
    sar word ptr [BP + 8h],1h
LAB_1000_c1d4:
    mov AX,word ptr [BP + 8h]
    mov CX,AX
    sar CX,1h
    sar CX,1h
    sub AX,CX
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [BP + 4h]
    add AX,word ptr [BP + 8h]
    mov word ptr [BP + -8h],AX
    mov AX,word ptr [BP + 4h]
    sub AX,word ptr [BP + 8h]
    mov word ptr [BP + -4h],AX
    mov AX,word ptr [BP + 6h]
    add AX,word ptr [BP + -2h]
    mov word ptr [BP + -0ah],AX
    mov AX,word ptr [BP + 6h]
    sub AX,word ptr [BP + -2h]
    mov word ptr [BP + -6h],AX
    cmp word ptr [BP + 0ah],0h
    jnz LAB_1000_c255
    push word ptr [BP + -0ah]
    push word ptr [BP + -4h]
    push AX
    push word ptr [BP + -4h]
    call sub_19DB0
    add SP,8h
    push word ptr [BP + -0ah]
    push word ptr [BP + -8h]
    push word ptr [BP + -0ah]
    push word ptr [BP + -4h]
    call sub_19DB0
    add SP,8h
    push word ptr [BP + -6h]
    push word ptr [BP + -8h]
    push word ptr [BP + -0ah]
    push word ptr [BP + -8h]
    call sub_19DB0
    add SP,8h
    push word ptr [BP + -6h]
    push word ptr [BP + -4h]
    push word ptr [BP + -6h]
    push word ptr [BP + -8h]
    call sub_19DB0
    add SP,8h
    jmp LAB_1000_c2f3
LAB_1000_c255:
    mov AX,word ptr [BP + 6h]
    mov CX,word ptr [BP + -2h]
    sar CX,1h
    sub AX,CX
    push AX
    push word ptr [BP + -8h]
    push word ptr [BP + -6h]
    push word ptr [BP + 4h]
    call sub_19DB0
    add SP,8h
    mov SI,word ptr [BP + -2h]
    sar SI,1h
    mov AX,word ptr [BP + 6h]
    add AX,SI
    push AX
    push word ptr [BP + -8h]
    mov AX,word ptr [BP + 6h]
    sub AX,SI
    push AX
    push word ptr [BP + -8h]
    call sub_19DB0
    add SP,8h
    push word ptr [BP + -0ah]
    push word ptr [BP + 4h]
    mov AX,word ptr [BP + -2h]
    sar AX,1h
    add AX,word ptr [BP + 6h]
    push AX
    push word ptr [BP + -8h]
    call sub_19DB0
    add SP,8h
    mov AX,word ptr [BP + -2h]
    sar AX,1h
    add AX,word ptr [BP + 6h]
    push AX
    push word ptr [BP + -4h]
    push word ptr [BP + -0ah]
    push word ptr [BP + 4h]
    call sub_19DB0
    add SP,8h
    mov SI,word ptr [BP + -2h]
    sar SI,1h
    mov AX,word ptr [BP + 6h]
    sub AX,SI
    push AX
    push word ptr [BP + -4h]
    mov AX,word ptr [BP + 6h]
    add AX,SI
    push AX
    push word ptr [BP + -4h]
    call sub_19DB0
    add SP,8h
    push word ptr [BP + -6h]
    push word ptr [BP + 4h]
    mov AX,word ptr [BP + 6h]
    mov CX,word ptr [BP + -2h]
    sar CX,1h
    sub AX,CX
    push AX
    push word ptr [BP + -4h]
    call sub_19DB0
    add SP,8h
LAB_1000_c2f3:
    pop SI
    mov SP,BP
    pop BP
    ret
sub_1C1B9 endp
; ------------------------------seg000:0xc2f7------------------------------
; ------------------------------seg000:0xc2f8------------------------------
sub_1C2F8 proc near
    push BP
    mov BP,SP
    sub SP,4h
    cmp word ptr [_var_671],0h
    jz LAB_1000_c36d
    cmp word ptr [_word_330C2],0h
    jz LAB_1000_c36d
    cmp byte ptr [_byte_3C5A0],0h
    jz LAB_1000_c329
    mov AX,0eh
    push AX
    mov AX,96h
    push AX
    mov AX,0f4h
    push AX
    mov AX,offset aMissileLock
    push AX
    call _draw2Strings
    add SP,8h
LAB_1000_c329:
    mov AX,0eh
    push AX
    call _sub_19E44
    add SP,2h
    mov word ptr [BP + -2h],10ch
    mov word ptr [BP + -4h],9ch
    mov AX,9ch
    push AX
    mov AX,116h
    push AX
    mov AX,9ch
    push AX
    mov AX,102h
    push AX
    call _sub_19BE1
    add SP,8h
    mov AX,word ptr [BP + -4h]
    db 05h, 08h, 00h ; add AX,8h (force imm16 encoding)
    push AX
    push word ptr [BP + -2h]
    mov AX,word ptr [BP + -4h]
    db 2Dh, 08h, 00h ; sub AX,8h (force imm16 encoding)
    push AX
    push word ptr [BP + -2h]
    call _sub_19BE1
    add SP,8h
LAB_1000_c36d:
    mov SP,BP
    pop BP
    ret
sub_1C2F8 endp
; ------------------------------seg000:0xc370------------------------------
; ------------------------------seg000:0xc371------------------------------
sub_1C371 proc near
    push BP
    mov BP,SP
    cmp word ptr [_var_279],-1h
    jnz LAB_1000_c37e
    jmp LAB_1000_c407
LAB_1000_c37e:
    push word ptr [BP + 6h]
    call _sub_19E44
    add SP,2h
    mov AX,word ptr [_var_279]
    cmp word ptr [BP + 8h],AX
    jge LAB_1000_c3c4
    mov AX,13fh
    sub AX,word ptr [BP + 8h]
    cmp AX,word ptr [_var_279]
    jle LAB_1000_c3c4
    mov AX,word ptr [_var_282]
    cmp word ptr [BP + 8h],AX
    jge LAB_1000_c3c4
    mov AX,58h
    sub AX,word ptr [BP + 8h]
    cmp AX,word ptr [_var_282]
    jle LAB_1000_c3c4
    mov AX,1h
    push AX
    push word ptr [BP + 8h]
    push word ptr [_var_282]
    push word ptr [_var_279]
    call sub_1C1B9
    add SP,8h
LAB_1000_c3c4:
    cmp word ptr [_var_279],14h
    jle LAB_1000_c407
    cmp word ptr [_var_279],118h
    jge LAB_1000_c407
    cmp word ptr [_var_282],0h
    jle LAB_1000_c407
    cmp word ptr [_var_282],52h
    jge LAB_1000_c407
    push word ptr [word_38F72]
    mov AX,word ptr [_var_282]
    db 05h, 05h, 00h ; add AX,5h (force imm16 encoding)
    push AX
    push word ptr [BP + 4h]
    call _strlen
    add SP,2h
    shl AX,1h
    mov CX,word ptr [_var_279]
    sub CX,AX
    push CX
    push word ptr [BP + 4h]
    call _draw2Strings
    add SP,8h
LAB_1000_c407:
    mov SP,BP
    pop BP
    ret
sub_1C371 endp
; ------------------------------seg000:0xc40a------------------------------
; ------------------------------seg000:0xc40b------------------------------
sub_1C40B proc near
    push BP
    mov BP,SP
    sub SP,0ah
    mov AX,offset aRange
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,0ah
    push AX
    mov AX,offset unk_3C030
    push AX
    mov AX,word ptr [BP + 4h]
    mov CL,6h
    sar AX,CL
    push AX
    call _itoa
    add SP,6h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,5c3bh
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,0ah
    push AX
    mov AX,offset unk_3C030
    push AX
    mov AX,word ptr [BP + 4h]
    db 25h, 3Fh, 00h ; and AX,3fh (force imm16 encoding)
    shl AX,1h
    cwd
    mov CX,0dh
    idiv CX
    push AX
    call _itoa
    add SP,6h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset aKm
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov SP,BP
    pop BP
    ret
sub_1C40B endp
; ------------------------------seg000:0xc487------------------------------
; ------------------------------seg000:0xc488------------------------------
sub_1C488 proc near
    push BP
    mov BP,SP
    sub SP,12h
    mov AX,word ptr [_word_3BEC0]
    sub AX,word ptr [BP + 4h]
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [BP + 6h]
    sub AX,word ptr [_word_3BED0]
    mov word ptr [BP + -8h],AX
    mov AX,word ptr [BP + 8h]
    sub AX,word ptr [_var_547]
    mov CL,5h
    sar AX,CL
    mov word ptr [BP + -0eh],AX
    test byte ptr [_keyValue],80h
    jz LAB_1000_c516
    mov AX,word ptr [_dword_3B7DA]
    mov DX,word ptr [_dword_3B7DA+2]
    sub AX,word ptr [_dword_3B1FE]
    sbb DX,word ptr [_dword_3B1FE+2]
LAB_1000_c4c5:
    sar DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_c4cf
    jmp LAB_1000_c4c5
LAB_1000_c4cf:
    sub word ptr [BP + -2h],AX
    mov AX,word ptr [_dword_3B7F8]
    mov DX,word ptr [_dword_3B7F8+2]
    sub AX,word ptr [_dword_3B4D4]
    sbb DX,word ptr [_dword_3B4D4+2]
    mov CL,5h
LAB_1000_c4e3:
    sar DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_c4ed
    jmp LAB_1000_c4e3
LAB_1000_c4ed:
    sub word ptr [BP + -8h],AX
    mov AX,word ptr [_word_3B4DE]
    cwd
    mov CX,word ptr [_var_547]
    sub BX,BX
    sub CX,AX
    sbb BX,DX
    neg CX
    adc BX,0h
    neg BX
    mov AX,CX
    mov CL,5h
LAB_1000_c509:
    sar BX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_c513
    jmp LAB_1000_c509
LAB_1000_c513:
    sub word ptr [BP + -0eh],AX
LAB_1000_c516:
    push word ptr [BP + -0eh]
    push word ptr [BP + -8h]
    push word ptr [BP + -2h]
    sub AX,AX
    push AX
    call sub_1C661
    add SP,8h
    mov word ptr [BP + -6h],AX
    mov word ptr [BP + -4h],DX
    push word ptr [BP + -0eh]
    push word ptr [BP + -8h]
    push word ptr [BP + -2h]
    mov AX,1h
    push AX
    call sub_1C661
    add SP,8h
    mov word ptr [BP + -0ch],AX
    mov word ptr [BP + -0ah],DX
    push word ptr [BP + -0eh]
    push word ptr [BP + -8h]
    push word ptr [BP + -2h]
    mov AX,2h
    push AX
    call sub_1C661
    add SP,8h
    mov word ptr [BP + -12h],AX
    mov word ptr [BP + -10h],DX
    or DX,DX
    jl LAB_1000_c56d
    mov word ptr [_var_279],0ffffh
    jmp LAB_1000_c65d
LAB_1000_c56d:
    cmp byte ptr [_var_456],0h
    jz LAB_1000_c580
    sar word ptr [BP + -4h],1h
    rcr word ptr [BP + -6h],1h
    sar word ptr [BP + -0ah],1h
    rcr word ptr [BP + -0ch],1h
LAB_1000_c580:
    mov AX,word ptr [BP + -12h]
    mov DX,word ptr [BP + -10h]
    neg AX
    adc DX,0h
    neg DX
    cmp DX,word ptr [BP + -4h]
    jl LAB_1000_c5ab
    jg LAB_1000_c599
    cmp AX,word ptr [BP + -6h]
    jc LAB_1000_c5ab
LAB_1000_c599:
    mov AX,word ptr [BP + -12h]
    mov DX,word ptr [BP + -10h]
    cmp word ptr [BP + -4h],DX
    jg LAB_1000_c5b4
    jl LAB_1000_c5ab
    cmp word ptr [BP + -6h],AX
    jnc LAB_1000_c5b4
LAB_1000_c5ab:
    mov word ptr [_var_279],0ffffh
    jmp LAB_1000_c65d
LAB_1000_c5b4:
    push word ptr [BP + -10h]
    push word ptr [BP + -12h]
    mov AX,word ptr [BP + -6h]
    mov DX,word ptr [BP + -4h]
    mov DH,DL
    mov DL,AH
    mov AH,AL
    sub AL,AL
    push DX
    push AX
    call __aNldiv
    db 05h, 0A0h, 00h ; add AX,0a0h (force imm16 encoding)
    mov word ptr [_var_279],AX
    push word ptr [BP + -10h]
    push word ptr [BP + -12h]
    mov AX,word ptr [BP + -0ch]
    mov DX,word ptr [BP + -0ah]
    mov DH,DL
    mov DL,AH
    mov AH,AL
    sub AL,AL
    push DX
    push AX
    call __aNldiv
    mov word ptr [_var_282],AX
    sar AX,1h
    sar AX,1h
    sub word ptr [_var_282],AX
    mov BX,word ptr [_var_564]
    cmp word ptr [BX + 10h],0c7h
    jnz LAB_1000_c607
    mov AX,64h
    jmp LAB_1000_c60a
LAB_1000_c607:
    mov AX,38h
LAB_1000_c60a:
    add word ptr [_var_282],AX
    mov AX,word ptr [BP + -12h]
    mov DX,word ptr [BP + -10h]
    mov CL,3h
LAB_1000_c616:
    sar DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_c620
    jmp LAB_1000_c616
LAB_1000_c620:
    mov word ptr [word_3C016],AX
    cmp word ptr [_var_279],0h
    jl LAB_1000_c632
    cmp word ptr [_var_279],13fh
    jle LAB_1000_c63e
LAB_1000_c632:
    mov AX,word ptr [_var_279]
    mov word ptr [_var_673],AX
    mov word ptr [_var_279],0ffffh
LAB_1000_c63e:
    cmp word ptr [_var_282],0h
    jl LAB_1000_c651
    mov BX,word ptr [_var_564]
    mov AX,word ptr [_var_282]
    cmp word ptr [BX + 10h],AX
    jge LAB_1000_c65d
LAB_1000_c651:
    mov AX,word ptr [_var_279]
    mov word ptr [_var_673],AX
    mov word ptr [_var_279],0ffffh
LAB_1000_c65d:
    mov SP,BP
    pop BP
    ret
sub_1C488 endp
; ------------------------------seg000:0xc660------------------------------
; ------------------------------seg000:0xc661------------------------------
sub_1C661 proc near
    push BP
    mov BP,SP
    sub SP,4h
    push word ptr [BP + 6h]
    mov BX,word ptr [BP + 4h]
    shl BX,1h
    push word ptr [BX + offset _unk_3A948]
    call sub_13B2F
    add SP,4h
    cwd
    mov word ptr [BP + -4h],AX
    mov word ptr [BP + -2h],DX
    push word ptr [BP + 0ah]
    mov BX,word ptr [BP + 4h]
    shl BX,1h
    push word ptr [BX + offset _unk_3A948 + 6]
    call sub_13B2F
    add SP,4h
    cwd
    add word ptr [BP + -4h],AX
    adc word ptr [BP + -2h],DX
    push word ptr [BP + 8h]
    mov BX,word ptr [BP + 4h]
    shl BX,1h
    push word ptr [BX + offset _unk_3A948 + 12]
    call sub_13B2F
    add SP,4h
    cwd
    add word ptr [BP + -4h],AX
    adc word ptr [BP + -2h],DX
    mov AX,word ptr [BP + -4h]
    mov DX,word ptr [BP + -2h]
    jmp LAB_1000_c6ba
LAB_1000_c6ba:
    mov SP,BP
    pop BP
    ret
sub_1C661 endp
; ------------------------------seg000:0xc6bd------------------------------
; ------------------------------seg000:0xc6be------------------------------
sub_1C6BE proc near
    push BP
    mov BP,SP
    sub SP,2h
    push SI
    mov AX,word ptr [BP + 6h]
    cwd
    sub AX,8000h
    sbb DX,0h
    neg AX
    adc DX,0h
    neg DX
    mov CL,5h
LAB_1000_c6d8:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_c6e2
    jmp LAB_1000_c6d8
LAB_1000_c6e2:
    push DX
    push AX
    mov AX,word ptr [BP + 4h]
    cwd
    mov CL,5h
LAB_1000_c6ea:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_c6f4
    jmp LAB_1000_c6ea
LAB_1000_c6f4:
    push DX
    push AX
    call sub_12FDA
    add SP,8h
    mov word ptr [word_39808],AX
    or AX,AX
    jnz LAB_1000_c706
    jmp LAB_1000_c798
LAB_1000_c706:
    mov BX,AX
    mov AX,word ptr [BX + 4h]
    mov DX,word ptr [BX + 6h]
    mov CL,5h
LAB_1000_c710:
    sar DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_c71a
    jmp LAB_1000_c710
LAB_1000_c71a:
    mov word ptr [BP + 4h],AX
    mov BX,word ptr [word_39808]
    mov AX,word ptr [BX + 8h]
    mov DX,word ptr [BX + 0ah]
    mov CL,5h
LAB_1000_c729:
    sar DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_c733
    jmp LAB_1000_c729
LAB_1000_c733:
    sub AX,8000h
    neg AX
    mov word ptr [BP + 6h],AX
    mov word ptr [BP + -2h],1h
    jmp LAB_1000_c745
LAB_1000_c742:
    inc word ptr [BP + -2h]
LAB_1000_c745:
    mov AX,word ptr [_word_3BED2]
    cmp word ptr [BP + -2h],AX
    jge LAB_1000_c76d
    mov SI,word ptr [BP + -2h]
    mov CL,4h
    shl SI,CL
    mov AX,word ptr [SI + offset _stru_3AA5E]
    cmp word ptr [BP + 4h],AX
    jnz LAB_1000_c76b
    mov AX,word ptr [SI + offset _stru_3AA5E + 2]
    cmp word ptr [BP + 6h],AX
    jnz LAB_1000_c76b
    mov AX,word ptr [BP + -2h]
    jmp LAB_1000_c79d
LAB_1000_c76b:
    jmp LAB_1000_c742
LAB_1000_c76d:
    mov AX,word ptr [BP + 4h]
    mov word ptr [_stru_3AA5E],AX
    mov AX,word ptr [BP + 6h]
    mov word ptr [_var_762],AX
    mov BX,word ptr [word_39808]
    mov AX,word ptr [BX]
    add AH,1h
    mov word ptr [_var_767],AX
    cmp word ptr [word_336F6],0h
    jnz LAB_1000_c792
    mov word ptr [word_336F6],0ffffh
LAB_1000_c792:
    sub AX,AX
    jmp LAB_1000_c79d
    db 0EBh
    db 05h
LAB_1000_c798:
    mov AX,0ffffh
    jmp LAB_1000_c79d
LAB_1000_c79d:
    pop SI
    mov SP,BP
    pop BP
    ret
sub_1C6BE endp
; ------------------------------seg000:0xc7a1------------------------------
; ------------------------------seg000:0xc7a2------------------------------
sub_1C7A2 equ _sub_1C7A2
; ------------------------------seg000:0xc7c5------------------------------
; ------------------------------seg000:0xc7c6------------------------------
sub_1C7C6 proc near
    push BP
    mov BP,SP
    push SI
    mov AX,24h
    imul word ptr [BP + 4h]
    mov SI,AX
    sub AX,AX
    push AX
    push word ptr [SI + offset word_3B206]
    push word ptr [SI + offset word_3B204]
    call sub_1C7EA
    add SP,6h
    jmp LAB_1000_c7e5
LAB_1000_c7e5:
    pop SI
    mov SP,BP
    pop BP
    ret
sub_1C7C6 endp
; ------------------------------seg000:0xc7e9------------------------------
; ------------------------------seg000:0xc7ea------------------------------
sub_1C7EA equ _sub_1C7EA
; ------------------------------seg000:0xc82c------------------------------
; ------------------------------seg000:0xc82d------------------------------
sub_1C82D proc near
    push BP
    mov BP,SP
    mov AX,word ptr [_var_547]
    add AH,10h
    sub CX,CX
    push CX
    push AX
    push word ptr [_var_544]
    call _abs
    add SP,2h
    sub AX,4000h
    neg AX
    cwd
    mov CL,0ch
LAB_1000_c84c:
    shl AX,1h
    rcl DX,1h
    dec CL
    jz LAB_1000_c856
    jmp LAB_1000_c84c
LAB_1000_c856:
    push DX
    push AX
    call __aNuldiv
    sub AX,4000h
    jmp LAB_1000_c860
LAB_1000_c860:
    mov SP,BP
    pop BP
    ret
sub_1C82D endp
; ------------------------------seg000:0xc863------------------------------
; ------------------------------seg000:0xc864------------------------------
sub_1C864 proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    mov CL,4h
    shl BX,CL
    test byte ptr [BX + offset _stru_3AA5E + 6],80h
    jz LAB_1000_c893
    push word ptr [BP + 4h]
    call sub_1C8A4
    add SP,2h
    or AX,AX
    jz LAB_1000_c888
    mov AL,byte ptr [_byte_3BEC4]
    cbw
    jmp LAB_1000_c88c
LAB_1000_c888:
    mov AL,byte ptr [_byte_3C02A]
    cbw
LAB_1000_c88c:
    add AH,1h
    jmp LAB_1000_c8a0
    db 0EBh
    db 0Dh
LAB_1000_c893:
    mov BX,word ptr [BP + 4h]
    mov CL,4h
    shl BX,CL
    mov AX,word ptr [BX + offset _stru_3AA5E + 12]
    jmp LAB_1000_c8a0
LAB_1000_c8a0:
    mov SP,BP
    pop BP
    ret
sub_1C864 endp
; ------------------------------seg000:0xc8a3------------------------------
; ------------------------------seg000:0xc8a4------------------------------
sub_1C8A4 proc near
    push BP
    mov BP,SP
    sub SP,2h
    mov BX,word ptr [BP + 4h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + offset _stru_3AA5E + 12]
    and BX,7fh
    mov AL,byte ptr [BX + offset _byte_3BFA4]
    db 25h, 0Fh, 00h ; and AX,0fh (force imm16 encoding)
    mov word ptr [BP + -2h],AX
    db 3Dh, 0Ch, 00h ; cmp AX,0ch (force imm16 encoding)
    jz LAB_1000_c8d1
    db 3Dh, 09h, 00h ; cmp AX,9h (force imm16 encoding)
    jz LAB_1000_c8d1
    db 3Dh, 0Bh, 00h ; cmp AX,0bh (force imm16 encoding)
    jnz LAB_1000_c8d6
LAB_1000_c8d1:
    mov AX,1h
    jmp LAB_1000_c8d8
LAB_1000_c8d6:
    sub AX,AX
LAB_1000_c8d8:
    jmp LAB_1000_c8da
LAB_1000_c8da:
    mov SP,BP
    pop BP
    ret
    nop
sub_1C8A4 endp
; ------------------------------seg000:0xc8dd------------------------------
; ------------------------------seg000:0xc9d2------------------------------
sub_1C9D2 proc near
    push BP
    mov BP,SP
    sub SP,10h
    push word ptr [BP + 4h]
    call sub_1CF32
    add SP,2h
    mov word ptr [BP + -4h],AX
    cmp byte ptr [_byte_3C5A0],0h
    jnz LAB_1000_c9f0
    mov AX,word ptr [_var_564]
    jmp LAB_1000_c9f3
LAB_1000_c9f0:
    mov AX,word ptr [_var_565]
LAB_1000_c9f3:
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    sub AX,word ptr [_dword_3B7DA]
    sbb DX,word ptr [_dword_3B7DA+2]
    mov word ptr [BP + -8h],AX
    mov word ptr [BP + -6h],DX
    mov AX,word ptr [BP + 0ah]
    mov DX,word ptr [BP + 0ch]
    add AX,word ptr [_dword_3B7F8]
    adc DX,word ptr [_dword_3B7F8+2]
    db 2Dh, 00h, 00h ; sub AX,0h (force imm16 encoding)
    sbb DX,100h
    mov word ptr [BP + -0ch],AX
    mov word ptr [BP + -0ah],DX
    mov AX,word ptr [BP + 0eh]
    sub AX,word ptr [_var_547]
    mov word ptr [BP + -0eh],AX
    test byte ptr [_keyValue],80h
    jz LAB_1000_ca6a
    mov AX,word ptr [_dword_3B7DA]
    mov DX,word ptr [_dword_3B7DA+2]
    sub AX,word ptr [_dword_3B1FE]
    sbb DX,word ptr [_dword_3B1FE+2]
    add word ptr [BP + -8h],AX
    adc word ptr [BP + -6h],DX
    mov AX,word ptr [_dword_3B4D4]
    mov DX,word ptr [_dword_3B4D4+2]
    sub AX,word ptr [_dword_3B7F8]
    sbb DX,word ptr [_dword_3B7F8+2]
    add word ptr [BP + -0ch],AX
    adc word ptr [BP + -0ah],DX
    mov AX,word ptr [_var_547]
    sub AX,word ptr [_word_3B4DE]
    add word ptr [BP + -0eh],AX
LAB_1000_ca6a:
    cmp byte ptr [_var_456],0h
    jz LAB_1000_ca7a
    mov AX,word ptr [BP + 16h]
    db 2Dh, 02h, 00h ; sub AX,2h (force imm16 encoding)
    jmp LAB_1000_ca80
    db 90h
LAB_1000_ca7a:
    mov AX,word ptr [BP + 16h]
    db 2Dh, 03h, 00h ; sub AX,3h (force imm16 encoding)
LAB_1000_ca80:
    mov word ptr [BP + 16h],AX
    or AX,AX
    jle LAB_1000_ca9f
    push AX
    lea AX,[BP + -8h]
    push AX
    call unknown_libname_1
    push word ptr [BP + 16h]
    lea AX,[BP + -0ch]
    push AX
    call unknown_libname_1
    mov CL,byte ptr [BP + 16h]
    shl word ptr [BP + -0eh],CL
LAB_1000_ca9f:
    cmp word ptr [BP + 16h],0h
    jge LAB_1000_cac7
    mov AX,word ptr [BP + 16h]
    neg AX
    mov byte ptr [BP + -10h],AL
    push word ptr [BP + -10h]
    lea AX,[BP + -8h]
    push AX
    call unknown_libname_2
    push word ptr [BP + -10h]
    lea AX,[BP + -0ch]
    push AX
    call unknown_libname_2
    mov CL,byte ptr [BP + -10h]
    sar word ptr [BP + -0eh],CL
LAB_1000_cac7:
    push word ptr [BP + -6h]
    push word ptr [BP + -8h]
    call _labs
    add SP,4h
    cwd
    or DX,DX
    jg LAB_1000_cb3e
    jl LAB_1000_cadf
    cmp AX,7fffh
    jnc LAB_1000_cb3e
LAB_1000_cadf:
    push word ptr [BP + -0ah]
    push word ptr [BP + -0ch]
    call _labs
    add SP,4h
    cwd
    or DX,DX
    jg LAB_1000_cb3e
    jl LAB_1000_caf7
    cmp AX,7fffh
    jnc LAB_1000_cb3e
LAB_1000_caf7:
    mov AX,word ptr [BP + -0eh]
    neg AX
    push AX
    sub AX,AX
    push AX
    push AX
    call sub_13A90
    add SP,6h
    mov word ptr [word_3C16C],1h
    cmp word ptr [BP + 0eh],1h
    sbb AX,AX
    inc AX
    push AX
    mov AX,word ptr [BP + -0ch]
    neg AX
    push AX
    push word ptr [BP + -8h]
    push word ptr [BP + 14h]
    push word ptr [BP + 12h]
    mov AX,word ptr [BP + 10h]
    neg AX
    push AX
    mov BX,word ptr [BP + -4h]
        db 8Dh, 87h, 00h, 00h ; lea AX,[BX + 0h] (force disp16 encoding)
        mov DX,228dh
    push DX
    push AX
    call far ptr sub_20104
    add SP,10h
LAB_1000_cb3e:
    mov SP,BP
    pop BP
    ret
sub_1C9D2 endp
; ------------------------------seg000:0xcb41------------------------------
; ------------------------------seg000:0xcb42------------------------------
sub_1CB42 proc near
    push BP
    mov BP,SP
    sub SP,1eh
    push SI
    mov word ptr [word_39402],1h
    cmp word ptr [BP + 12h],1h
    jnz LAB_1000_cb6d
    cmp word ptr [_word_38FDC],0h
    jnz LAB_1000_cb6d
    cmp byte ptr [_gfxModeUnset],0h
    jz LAB_1000_cb6d
    test byte ptr [_word_336E8],3h
    jz LAB_1000_cb6d
    jmp LAB_1000_cf2c
LAB_1000_cb6d:
    push word ptr [BP + 4h]
    call sub_1CF32
    add SP,2h
    mov word ptr [BP + -10h],AX
    cmp byte ptr [_byte_3C5A0],0h
    jnz LAB_1000_cb8a
    mov BX,word ptr [_var_568]
    mov word ptr [BX],0h
    jmp LAB_1000_cb92
LAB_1000_cb8a:
    mov BX,word ptr [_var_568]
    mov word ptr [BX],1h
LAB_1000_cb92:
    cmp word ptr [BP + 12h],2h
    jl LAB_1000_cb9b
    jmp LAB_1000_cd48
LAB_1000_cb9b:
    mov word ptr [_var_685],0h
    mov AX,word ptr [BP + 6h]
    sub AX,word ptr [_word_3BEC0]
    mov word ptr [BP + -18h],AX
    mov AX,word ptr [BP + 8h]
    sub AX,word ptr [_word_3BED0]
    mov word ptr [BP + -1ah],AX
    mov AX,word ptr [BP + 0ah]
    sub AX,word ptr [_var_547]
    mov CL,5h
    sar AX,CL
    mov word ptr [BP + -1ch],AX
    mov AX,word ptr [BP + -1ah]
    neg AX
    push AX
    push word ptr [BP + -18h]
    call _sub_1D008
    add SP,4h
    mov word ptr [BP + -6h],AX
    push word ptr [BP + -1ah]
    push word ptr [BP + -18h]
    call _sub_1CFA6
    add SP,4h
    push AX
    push word ptr [BP + -1ch]
    call _sub_1D008
    add SP,4h
    mov word ptr [BP + -0eh],AX
    push word ptr [BP + -1ah]
    push word ptr [BP + -18h]
    call _sub_1CFA6
    add SP,4h
    push AX
    push word ptr [BP + -1ch]
    call _sub_1CFA6
    add SP,4h
    mov word ptr [BP + -8h],AX
    cmp word ptr [BP + 12h],1h
    jnz LAB_1000_cc42
    mov word ptr [_var_680],AX
    mov CL,4h
    sar AX,CL
    add AX,190h
    mov word ptr [_var_682],AX
    mov CL,5h
    shl AX,CL
    cwd
    mov CX,word ptr [BP + -8h]
    inc CX
    idiv CX
    mov word ptr [_var_683],AX
    mov AX,word ptr [_var_682]
    shl AX,1h
    shl AX,1h
    mov word ptr [BP + -8h],AX
    mov AX,word ptr [BP + -6h]
    mov word ptr [_var_681],AX
    mov AX,word ptr [BP + -0eh]
    mov word ptr [_var_684],AX
    jmp LAB_1000_cce0
    db 90h
LAB_1000_cc42:
    mov AX,word ptr [_var_680]
    mov CL,5h
    shl AX,CL
    cwd
    mov CX,word ptr [BP + -8h]
    inc CX
    idiv CX
    mov word ptr [_var_683],AX
    cmp AX,100h
    jle LAB_1000_cc5e
    mov word ptr [_var_683],100h
LAB_1000_cc5e:
    cmp word ptr [_var_683],4h
    jge LAB_1000_cc6b
    mov word ptr [_var_683],4h
LAB_1000_cc6b:
    mov AX,word ptr [BP + -6h]
    sub AX,word ptr [_var_681]
    mov CL,5h
    sar AX,CL
    imul word ptr [_var_683]
    mov word ptr [BP + -16h],AX
    mov AX,word ptr [BP + -0eh]
    sub AX,word ptr [_var_684]
    sar AX,CL
    imul word ptr [_var_683]
    mov word ptr [BP + -0ah],AX
    push word ptr [BP + -16h]
    call _abs
    add SP,2h
    cmp AX,1000h
    jle LAB_1000_cc9e
    jmp LAB_1000_cf2c
LAB_1000_cc9e:
    push word ptr [BP + -0ah]
    call _abs
    add SP,2h
    cmp AX,1000h
    jle LAB_1000_ccaf
    jmp LAB_1000_cf2c
LAB_1000_ccaf:
    mov AX,word ptr [BP + -16h]
    shl AX,1h
    shl AX,1h
    add AX,word ptr [_var_681]
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [BP + -0ah]
    shl AX,1h
    shl AX,1h
    add AX,word ptr [_var_684]
    mov word ptr [BP + -0eh],AX
    mov AX,word ptr [_var_682]
    mov CL,5h
    shl AX,CL
    cwd
    mov CX,word ptr [_var_683]
    idiv CX
    shl AX,1h
    shl AX,1h
    mov word ptr [BP + -8h],AX
LAB_1000_cce0:
    push word ptr [BP + -8h]
    push word ptr [BP + -0eh]
    call _sub_1D190
    add SP,4h
    mov word ptr [BP + -14h],AX
    mov byte ptr [_var_594],2h
    cmp word ptr [BP + 14h],0h
    jge LAB_1000_cd07
    mov AL,byte ptr [BP + 14h]
    add AL,2h
    mov byte ptr [_var_594],AL
    mov word ptr [BP + 14h],0h
LAB_1000_cd07:
    push word ptr [BP + -14h]
    push word ptr [BP + -6h]
    call _sub_1D178
    add SP,4h
    mov CL,byte ptr [BP + 14h]
    sar AX,CL
    mov word ptr [BP + -18h],AX
    push word ptr [BP + -14h]
    push word ptr [BP + -6h]
    call _sub_1D190
    add SP,4h
    neg AX
    mov CL,byte ptr [BP + 14h]
    sar AX,CL
    mov word ptr [BP + -1ah],AX
    push word ptr [BP + -8h]
    push word ptr [BP + -0eh]
    call _sub_1D178
    add SP,4h
    mov CL,byte ptr [BP + 14h]
    sar AX,CL
    mov word ptr [BP + -1ch],AX
    jmp LAB_1000_cd8b
    db 90h
LAB_1000_cd48:
    mov AX,word ptr [BP + 6h]
    sub AX,word ptr [_word_3BEC0]
    mov CL,4h
    shl AX,CL
    mov word ptr [BP + -18h],AX
    mov AX,word ptr [BP + 8h]
    sub AX,word ptr [_word_3BED0]
    shl AX,CL
    mov word ptr [BP + -1ah],AX
    mov AX,word ptr [BP + 0ah]
    sub AX,word ptr [_var_547]
    sar AX,1h
    mov word ptr [BP + -1ch],AX
    mov AX,word ptr [_var_542]
    mov word ptr [_var_681],AX
    mov AX,word ptr [word_38FCE]
    mov word ptr [_var_684],AX
    mov AX,word ptr [_var_545]
    mov word ptr [_var_685],AX
    mov word ptr [_var_683],20h
    mov byte ptr [_var_594],2h
LAB_1000_cd8b:
    cmp word ptr [BP + 12h],1h
    jz LAB_1000_cd9a
    cmp word ptr [BP + 12h],3h
    jz LAB_1000_cd9a
    jmp LAB_1000_ce82
LAB_1000_cd9a:
    mov AX,word ptr [_var_683]
    cwd
    push DX
    push AX
    mov AX,word ptr [_var_684]
    sar AX,1h
    sar AX,1h
    cwd
    push DX
    push AX
    call __aNlmul
    mov CL,5h
LAB_1000_cdaf:
    sar DX,1h
    rcr AX,1h
    dec CL
    jnz LAB_1000_cdaf
    db 05h, 9Ch, 00h ; add AX,9ch (force imm16 encoding)
    mov word ptr [BP + -4h],AX
    db 3Dh, 80h, 00h ; cmp AX,80h (force imm16 encoding)
    jl LAB_1000_cdca
    cmp word ptr [_var_684],0e800h
    jge LAB_1000_cdcf
LAB_1000_cdca:
    mov word ptr [BP + -4h],80h
LAB_1000_cdcf:
    cmp word ptr [BP + -4h],0b8h
    jg LAB_1000_cdde
    cmp word ptr [_var_684],1800h
    jle LAB_1000_cde3
LAB_1000_cdde:
    mov word ptr [BP + -4h],0b8h
LAB_1000_cde3:
    mov BX,word ptr [_var_568]
    mov AL,byte ptr [byte_3419A]
    sub AH,AH
    mov word ptr [BX + 4h],AX
    cmp word ptr [BP + -4h],80h
    jz LAB_1000_ce11
    push word ptr [BP + -4h]
    mov AX,130h
    push AX
    mov AX,80h
    push AX
    mov AX,0e8h
    push AX
    push word ptr [_var_568]
    call far ptr _sub_21444
    add SP,0ah
LAB_1000_ce11:
    mov ES,word ptr [_var_653]
    mov AL,ES:[2fh]
    sub AH,AH
    mov word ptr [BP + -12h],AX
    mov BX,word ptr [BP + 4h]
    and BX,7fh
    mov AL,byte ptr [BX + offset _byte_3BFA4]
    cbw
    mov word ptr [BP + -0ch],AX
    test byte ptr [BP + -0ch],10h
    jz LAB_1000_ce37
    mov word ptr [BP + -12h],8h
LAB_1000_ce37:
    mov AL,byte ptr [BP + -0ch]
    and AL,0fh
    mov byte ptr [BP + -1eh],AL
    cmp AL,0ch
    jz LAB_1000_ce4b
    cmp AL,9h
    jz LAB_1000_ce4b
    cmp AL,0bh
    jnz LAB_1000_ce50
LAB_1000_ce4b:
    mov word ptr [BP + -12h],1h
LAB_1000_ce50:
    mov BX,word ptr [_var_568]
    mov SI,word ptr [BP + -12h]
    mov AL,byte ptr [SI + offset byte_3419C]
    sub AH,AH
    mov word ptr [BX + 4h],AX
    cmp word ptr [BP + -4h],0b8h
    jz LAB_1000_ce82
    mov AX,0b8h
    push AX
    mov AX,130h
    push AX
    push word ptr [BP + -4h]
    mov AX,0e8h
    push AX
    push word ptr [_var_568]
    call far ptr _sub_21444
    add SP,0ah
LAB_1000_ce82:
    mov byte ptr [_var_316],1h
    sub AX,AX
    push AX
    push AX
    push AX
    push AX
    push word ptr [_var_685]
    push word ptr [_var_684]
    mov AX,word ptr [_var_681]
    neg AX
    push AX
    push word ptr [_var_568]
    call sub_13932
    add SP,10h
    push word ptr [BP + -1ch]
    mov AX,word ptr [BP + -1ah]
    neg AX
    push AX
    push word ptr [BP + -18h]
    push word ptr [BP + 10h]
    push word ptr [BP + 0eh]
    mov AX,word ptr [BP + 0ch]
    neg AX
    push AX
    mov BX,word ptr [BP + -10h]
    db 8Dh, 87h, 00h, 00h ; lea AX,[BX + 0h] (force disp16 encoding)
    mov DX,228dh
    push DX
    push AX
    call far ptr sub_20104
    add SP,10h
    call sub_139AA
    mov byte ptr [_var_316],0h
    cmp word ptr [BP + 12h],1h
    jnz LAB_1000_cf27
    mov AX,offset aBrg
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,0ah
    push AX
    mov AX,offset unk_3C030
    push AX
    mov AX,word ptr [_var_681]
    sub DX,DX
    mov CX,0b6h
    div CX
    push AX
    call _itoa
    add SP,6h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,0fh
    push AX
    mov AX,0b0h
    push AX
    mov AX,0f8h
    push AX
    mov AX,offset strBuf
    push AX
    call _draw2Strings
    add SP,8h
LAB_1000_cf27:
    mov byte ptr [_var_594],0h
LAB_1000_cf2c:
    pop SI
    mov SP,BP
    pop BP
    ret
    nop
sub_1CB42 endp
; ------------------------------seg000:0xcf30------------------------------
; ------------------------------seg000:0xcf32------------------------------
sub_1CF32 proc near
    push BP
    mov BP,SP
    test word ptr [BP + 4h],100h
    jz LAB_1000_cf4a
    mov BX,word ptr [BP + 4h]
    and BX,7fh
    shl BX,1h
    mov AX,word ptr [BX + offset _buf3d3]
    pop BP
    ret
LAB_1000_cf4a:
    mov BX,word ptr [BP + 4h]
    shl BX,1h
    mov BX,word ptr [BX + offset _flt15_buf1]
    lea AX,[BX + 0add4h]
    mov DX,228dh
    mov CX,0h
    mov BX,228dh
    sub AX,CX
    pop BP
    ret
sub_1CF32 endp
; ------------------------------seg000:0xcf63------------------------------
; ------------------------------seg000:0xcf64------------------------------
; _sub_1CF64 - now in C (egame2.c)
; ------------------------------seg000:0xcf8d------------------------------
; ------------------------------seg000:0xcf8e------------------------------
routine_163 equ _sub_1CF8E
; ------------------------------seg000:0xcfa6------------------------------
_sub_1CFA6 proc near
    push BP
    mov BP,SP
    sub SP,4h
    push word ptr [BP + 4h]
    call _abs
    add SP,2h
    mov word ptr [BP + 4h],AX
    push word ptr [BP + 6h]
    call _abs
    add SP,2h
    mov word ptr [BP + 6h],AX
    cmp word ptr [BP + 4h],AX
    jle LAB_1000_cfd4
    mov AX,word ptr [BP + 4h]
    cwd
    mov CX,AX
    mov AX,word ptr [BP + 6h]
    jmp LAB_1000_cfdd
LAB_1000_cfd4:
    mov AX,word ptr [BP + 6h]
    cwd
    mov CX,AX
    mov AX,word ptr [BP + 4h]
LAB_1000_cfdd:
    sar AX,1h
    mov BX,DX
    cwd
    add AX,CX
    adc DX,BX
    mov word ptr [BP + -4h],AX
    mov word ptr [BP + -2h],DX
    or DX,DX
    jl LAB_1000_d001
    jg LAB_1000_cff7
    cmp AX,7fffh
    jbe LAB_1000_d001
LAB_1000_cff7:
    mov word ptr [BP + -4h],7fffh
    mov word ptr [BP + -2h],0h
LAB_1000_d001:
    mov AX,word ptr [BP + -4h]
    mov SP,BP
    pop BP
    ret
_sub_1CFA6 endp
; ------------------------------seg000:0xd007------------------------------
; ------------------------------seg000:0xd008------------------------------
_sub_1D008 proc near
    push BP
    mov BP,SP
    sub SP,0eh
    push SI
    cmp word ptr [BP + 4h],0h
    jnz LAB_1000_d02a
    cmp word ptr [BP + 6h],0h
    jle LAB_1000_d022
    sub AX,AX
    pop SI
    mov SP,BP
    pop BP
    ret
LAB_1000_d022:
    mov AX,8000h
    pop SI
    mov SP,BP
    pop BP
    ret
LAB_1000_d02a:
    cmp word ptr [BP + 6h],0h
    jnz LAB_1000_d046
    cmp word ptr [BP + 4h],0h
    jle LAB_1000_d03e
    mov AX,4000h
    pop SI
    mov SP,BP
    pop BP
    ret
LAB_1000_d03e:
    mov AX,0c000h
    pop SI
    mov SP,BP
    pop BP
    ret
LAB_1000_d046:
    push word ptr [BP + 6h]
    call _abs
    add SP,2h
    push word ptr [BP + 4h]
    mov SI,AX
    call _abs
    add SP,2h
    cmp AX,SI
    jle LAB_1000_d08c
    push word ptr [BP + 6h]
    call _abs
    add SP,2h
    cwd
    mov CL,0eh
LAB_1000_d06a:
    shl AX,1h
    rcl DX,1h
    dec CL
    jnz LAB_1000_d06a
    mov word ptr [BP + -8h],AX
    mov word ptr [BP + -6h],DX
    push word ptr [BP + 4h]
    call _abs
    add SP,2h
    mov word ptr [BP + -0ah],AX
    mov word ptr [BP + -0ch],1h
    jmp LAB_1000_d0b7
    db 90h
LAB_1000_d08c:
    push word ptr [BP + 4h]
    call _abs
    add SP,2h
    cwd
    mov CL,0eh
LAB_1000_d098:
    shl AX,1h
    rcl DX,1h
    dec CL
    jnz LAB_1000_d098
    mov word ptr [BP + -8h],AX
    mov word ptr [BP + -6h],DX
    push word ptr [BP + 6h]
    call _abs
    add SP,2h
    mov word ptr [BP + -0ah],AX
    mov word ptr [BP + -0ch],0h
LAB_1000_d0b7:
    mov AX,word ptr [BP + -0ah]
    cwd
    push DX
    push AX
    push word ptr [BP + -6h]
    push word ptr [BP + -8h]
    call __aNldiv
    mov word ptr [BP + -0eh],AX
    cwd
    push DX
    push AX
    mov AX,0b00h
    cwd
    push DX
    push AX
    mov AX,1333h
    sub AX,word ptr [BP + -0eh]
    push AX
    call _abs
    add SP,2h
    cwd
    push DX
    push AX
    call __aNlmul
    mov CL,0eh
LAB_1000_d0e7:
    sar DX,1h
    rcr AX,1h
    dec CL
    jnz LAB_1000_d0e7
    sub AX,2800h
    sbb DX,0h
    neg AX
    adc DX,0h
    neg DX
    push DX
    push AX
    call __aNlmul
    mov CL,0eh
LAB_1000_d103:
    sar DX,1h
    rcr AX,1h
    dec CL
    jnz LAB_1000_d103
    mov word ptr [BP + -2h],AX
    cmp word ptr [BP + 4h],0h
    jle LAB_1000_d142
    cmp word ptr [BP + 6h],0h
    jle LAB_1000_d12e
    cmp word ptr [BP + -0ch],0h
    jz LAB_1000_d128
    mov AX,4000h
LAB_1000_d123:
    sub AX,word ptr [BP + -2h]
    jmp LAB_1000_d170
LAB_1000_d128:
    mov AX,word ptr [BP + -2h]
    jmp LAB_1000_d170
    db 90h
LAB_1000_d12e:
    cmp word ptr [BP + -0ch],0h
    jz LAB_1000_d13c
    mov AX,word ptr [BP + -2h]
    add AH,40h
    jmp LAB_1000_d170
LAB_1000_d13c:
    mov AX,8000h
    jmp LAB_1000_d123
    db 90h
LAB_1000_d142:
    cmp word ptr [BP + 6h],0h
    jle LAB_1000_d15e
    cmp word ptr [BP + -0ch],0h
    jz LAB_1000_d156
    mov AX,word ptr [BP + -2h]
    add AH,0c0h
    jmp LAB_1000_d170
LAB_1000_d156:
    mov AX,word ptr [BP + -2h]
    neg AX
    jmp LAB_1000_d170
    db 90h
LAB_1000_d15e:
    cmp word ptr [BP + -0ch],0h
    jz LAB_1000_d16a
    mov AX,0c000h
    jmp LAB_1000_d123
    db 90h
LAB_1000_d16a:
    mov AX,word ptr [BP + -2h]
    add AH,80h
LAB_1000_d170:
    mov word ptr [BP + -4h],AX
    pop SI
    mov SP,BP
    pop BP
    ret
_sub_1D008 endp
; ------------------------------seg000:0xd177------------------------------
; ------------------------------seg000:0xd178------------------------------
; _sub_1D178 - now in C (egame2.c)
; ------------------------------seg000:0xd18f------------------------------
; ------------------------------seg000:0xd190------------------------------
; _sub_1D190 - now in C (egame2.c)
; ------------------------------seg000:0xd1a4------------------------------
    nop
    nop
; ------------------------------seg000:0xd1e8------------------------------
sub_1D1E8 proc near
    cmp word ptr [word_330BE],0h
    jnz LAB_1000_d1f5
    call getTimeOfDay
    mov word ptr [_var_686],AX
LAB_1000_d1f5:
    push word ptr [_var_686]
    call _srand
    add SP,2h
    ret
sub_1D1E8 endp
; ------------------------------seg000:0xd1ff------------------------------
; ------------------------------seg000:0xd200------------------------------
randlmul equ _sub_1D200
; ------------------------------seg000:0xd21d------------------------------
; ------------------------------seg000:0xd21e------------------------------
sub_1D21E proc near
    push BP
    mov BP,SP
    sub SP,2h
    cmp word ptr [word_330BE],0h
    jz LAB_1000_d232
    mov word ptr [BP + -2h],0h
    jmp LAB_1000_d258
LAB_1000_d232:
    les BX,dword ptr [_commData]
    cmp word ptr ES:[BX + 72h],0h
    jz LAB_1000_d24a
    push word ptr [BP + 4h]
    call far ptr misc_jump_5d_readJoy
    add SP,2h
    jmp LAB_1000_d24c
LAB_1000_d24a:
    sub AX,AX
LAB_1000_d24c:
    mov BX,word ptr [BP + 4h]
    shl BX,1h
    add AX,word ptr [BX + offset word_38606]
    mov word ptr [BP + -2h],AX
LAB_1000_d258:
    mov AX,word ptr [BP + -2h]
    mov SP,BP
    pop BP
    ret
    nop
sub_1D21E endp
; ------------------------------seg000:0xd25e------------------------------
; ------------------------------seg000:0xd260------------------------------
PUBLIC _keyDispatch
keyDispatch proc near
_keyDispatch equ keyDispatch
    push BP
    mov BP,SP
    sub SP,0eh
    push DI
    push SI
    sub AX,AX
    mov word ptr [_var_599],AX
    mov word ptr [_var_598],AX
    cmp word ptr [BP + 4h],AX
    jnz LAB_1000_d278
    jmp LAB_1000_d958
LAB_1000_d278:
    mov AX,word ptr [BP + 4h]
    jmp LAB_1000_d747
LAB_1000_d27e:
    call sub_1DBE0
    jmp LAB_1000_d88c
LAB_1000_d284:
    inc word ptr [_var_588]
    cmp word ptr [_var_588],2h
    jle LAB_1000_d295
    mov word ptr [_var_588],0h
LAB_1000_d295:
    mov AX,word ptr [_var_588]
    jmp LAB_1000_d2cc
LAB_1000_d29a:
    mov AX,offset aLong
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    jmp LAB_1000_d2dc
LAB_1000_d2aa:
    mov AX,offset aMedium
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    jmp LAB_1000_d2dc
LAB_1000_d2ba:
    mov AX,offset aShort
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    jmp LAB_1000_d2dc
    db 0EBh
    db 10h
LAB_1000_d2cc:
    or AX,AX
    jz LAB_1000_d29a
    db 3Dh, 01h, 00h ; cmp AX,1h (force imm16 encoding)
    jz LAB_1000_d2aa
    db 3Dh, 02h, 00h ; cmp AX,2h (force imm16 encoding)
    jz LAB_1000_d2ba
    jmp LAB_1000_d2dc
LAB_1000_d2dc:
    mov AX,offset aRangeRadar
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    jmp LAB_1000_d88c
LAB_1000_d2f7:
    call zoomIn
    jmp LAB_1000_d88c
LAB_1000_d2fd:
    call zoomOut
    jmp LAB_1000_d88c
LAB_1000_d303:
    mov AX,1h
    push AX
    call countermeasures
    add SP,2h
    jmp LAB_1000_d88c
LAB_1000_d310:
    mov AX,2h
    push AX
    call countermeasures
    add SP,2h
    jmp LAB_1000_d88c
LAB_1000_d31d:
    mov AX,word ptr [_word_3BEBE]
    cmp word ptr [_var_547],AX
    jz LAB_1000_d33f
    xor byte ptr [_planeFlags],1h
    mov word ptr [word_336EC],0h
    mov AX,2h
    push AX
    mov AX,20h
    push AX
    call makeSound
    add SP,4h
LAB_1000_d33f:
    test byte ptr [_planeFlags],1h
    jnz LAB_1000_d349
    call sub_1DB9C
LAB_1000_d349:
    jmp LAB_1000_d88c
LAB_1000_d34c:
    dec word ptr [_word_38FDC]
    jns LAB_1000_d367
    call far ptr _gfx_jump_3f_modecode
    db 3Dh, 03h, 00h ; cmp AX,3h (force imm16 encoding)
    jnz LAB_1000_d361
    mov AX,3h
    jmp LAB_1000_d364
LAB_1000_d361:
    mov AX,2h
LAB_1000_d364:
    mov word ptr [_word_38FDC],AX
LAB_1000_d367:
    mov AX,offset aDetailLevel
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,0ah
    push AX
    mov AX,offset unk_3C030
    push AX
    push word ptr [_word_38FDC]
    call _itoa
    add SP,6h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    call sub_1DB2B
    jmp LAB_1000_d88c
LAB_1000_d3a2:
    inc word ptr [_var_596]
    cmp word ptr [_var_596],2h
    jle LAB_1000_d3b3
    mov word ptr [_var_596],0h
LAB_1000_d3b3:
    mov AX,offset aKybdSensitivit
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,0ah
    push AX
    mov AX,offset unk_3C030
    push AX
    mov AX,word ptr [_var_596]
    inc AX
    push AX
    call _itoa
    add SP,6h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    jmp LAB_1000_d88c
LAB_1000_d3ec:
    mov AX,offset aMemoryAvailabl
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,0ah
    push AX
    lea AX,[BP + -0eh]
    push AX
    push word ptr [allocSize]
    call _itoa
    add SP,6h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    jmp LAB_1000_d88c
LAB_1000_d424:
    mov AX,offset aJiffiesFrame
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,0ah
    push AX
    mov AX,offset unk_3C030
    push AX
    push word ptr [word_3C6AE]
    call _itoa
    add SP,6h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    jmp LAB_1000_d88c
LAB_1000_d45c:
    cmp word ptr [_word_3370A],1h
    jnz LAB_1000_d47a
    mov word ptr [_word_3370A],2h
    mov CX,2h
    mov AX,word ptr [_word_330C4]
    cwd
    idiv CX
    mov word ptr [_word_330C4],AX
    call sub_1DAAE
    jmp LAB_1000_d47d
LAB_1000_d47a:
    call sub_1DB9C
LAB_1000_d47d:
    jmp LAB_1000_d88c
LAB_1000_d480:
    inc word ptr [_var_600]
    mov AX,word ptr [_var_600]
    db 25h, 03h, 00h ; and AX,3h (force imm16 encoding)
    mov word ptr [_var_600],AX
    mov AX,offset aSounds
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,0ah
    push AX
    mov AX,offset unk_3C030
    push AX
    mov AX,3h
    sub AX,word ptr [_var_600]
    push AX
    call _itoa
    add SP,6h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    call sub_1DA8D
    jmp LAB_1000_d88c
LAB_1000_d4cc:
    xor byte ptr [_word_330BC],1h
    cmp byte ptr [_byte_32933],0h
    jz LAB_1000_d4db
    call _setupDac
LAB_1000_d4db:
    jmp LAB_1000_d88c
LAB_1000_d4de:
    xor byte ptr [_var_730],10h
    test word ptr [_planeFlags],1000h
    jz LAB_1000_d4f4
    les BX,dword ptr [_commData]
    or byte ptr ES:[BX + 30h],1h
LAB_1000_d4f4:
    jmp LAB_1000_d88c
LAB_1000_d4f7:
    mov word ptr [_missileSpecIndex],0h
    cmp word ptr [_word_3C45C],1h
    jz LAB_1000_d50a
    mov word ptr [_word_39604],0h
LAB_1000_d50a:
    mov word ptr [_word_3C45C],1h
    call selectMissile
    jmp LAB_1000_d88c
LAB_1000_d516:
    mov word ptr [_missileSpecIndex],1h
    mov word ptr [_word_3C45C],1h
    jmp LAB_1000_d52a
    db 0C7h
    db 06h
    db 54h
    db 6Dh
    db 00h
    db 00h
LAB_1000_d52a:
    call selectMissile
    jmp LAB_1000_d88c
LAB_1000_d530:
    mov word ptr [_missileSpecIndex],2h
    cmp word ptr [_word_3C45C],2h
    jz LAB_1000_d543
    mov word ptr [_word_39604],0h
LAB_1000_d543:
    mov word ptr [_word_3C45C],2h
    call selectMissile
    jmp LAB_1000_d88c
LAB_1000_d54f:
    inc word ptr [_word_3370E]
    cmp word ptr [_word_3370E],2h
    jle LAB_1000_d560
    mov word ptr [_word_3370E],0h
LAB_1000_d560:
    mov AX,offset aDirector
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    cmp word ptr [_word_3370E],0h
    jz LAB_1000_d594
    mov AX,0ah
    push AX
    mov AX,offset unk_3C030
    push AX
    push word ptr [_word_3370E]
    call _itoa
    add SP,6h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    jmp LAB_1000_d5a2
LAB_1000_d594:
    mov AX,offset aOff
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
LAB_1000_d5a2:
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    jmp LAB_1000_d88c
LAB_1000_d5af:
    inc word ptr [_waypointIndex]
    cmp word ptr [_waypointIndex],3h
    jle LAB_1000_d5c0
    mov word ptr [_waypointIndex],1h
LAB_1000_d5c0:
    mov AX,word ptr [_waypointIndex]
    jmp LAB_1000_d5f1
LAB_1000_d5c5:
    mov AX,offset aWaypointPrimar
    push AX
    call tempStrcpy
    add SP,2h
    jmp LAB_1000_d602
LAB_1000_d5d1:
    mov AX,offset aWaypointSecond
    push AX
    call tempStrcpy
    add SP,2h
    jmp LAB_1000_d602
LAB_1000_d5dd:
    mov AX,offset aWaypointFriend
    push AX
    call tempStrcpy
    add SP,2h
    mov AX,word ptr [_word_3C16A]
    mov word ptr [word_3B15A],AX
    jmp LAB_1000_d602
    db 0EBh
    db 11h
LAB_1000_d5f1:
    db 3Dh, 01h, 00h ; cmp AX,1h (force imm16 encoding)
    jz LAB_1000_d5c5
    db 3Dh, 02h, 00h ; cmp AX,2h (force imm16 encoding)
    jz LAB_1000_d5d1
    db 3Dh, 03h, 00h ; cmp AX,3h (force imm16 encoding)
    jz LAB_1000_d5dd
    jmp LAB_1000_d602
LAB_1000_d602:
    jmp LAB_1000_d88c
LAB_1000_d605:
    cmp word ptr [_word_330B6],0h
    jz LAB_1000_d61e
    mov word ptr [_word_330B6],0h
    mov AX,offset aAutopilotOff
    push AX
    call tempStrcpy
    add SP,2h
    jmp LAB_1000_d636
LAB_1000_d61e:
    mov AX,word ptr [_var_547]
    cmp AX,3e8h
    jge LAB_1000_d629
    mov AX,3e8h
LAB_1000_d629:
    mov word ptr [_word_330B6],AX
    mov AX,offset aAutopilotOn
    push AX
    call tempStrcpy
    add SP,2h
LAB_1000_d636:
    jmp LAB_1000_d88c
LAB_1000_d639:
    or byte ptr [_word_336F4],80h
    jmp LAB_1000_d88c
LAB_1000_d641:
    mov word ptr [_var_598],1h
    jmp LAB_1000_d88c
LAB_1000_d64a:
    mov word ptr [_var_599],1h
    jmp LAB_1000_d88c
LAB_1000_d653:
    mov word ptr [_keyValue],0h
    jmp LAB_1000_d88c
LAB_1000_d65c:
    mov word ptr [_keyValue],44h
    jmp LAB_1000_d88c
LAB_1000_d665:
    mov word ptr [_keyValue],42h
    jmp LAB_1000_d88c
LAB_1000_d66e:
    mov word ptr [_keyValue],43h
    jmp LAB_1000_d88c
LAB_1000_d677:
    mov word ptr [_keyValue],41h
    jmp LAB_1000_d88c
LAB_1000_d680:
    mov word ptr [_keyValue],87h
    jmp LAB_1000_d88c
LAB_1000_d689:
    mov word ptr [_keyValue],84h
    jmp LAB_1000_d88c
LAB_1000_d692:
    mov word ptr [_keyValue],85h
    jmp LAB_1000_d88c
LAB_1000_d69b:
    mov word ptr [_keyValue],89h
    jmp LAB_1000_d88c
LAB_1000_d6a4:
    mov word ptr [_keyValue],88h
    jmp LAB_1000_d88c
LAB_1000_d6ad:
    mov word ptr [_keyValue],8bh
    jmp LAB_1000_d88c
LAB_1000_d6b6:
    cmp word ptr [word_3BE3C],0h
    jz LAB_1000_d6c0
    jmp LAB_1000_d741
LAB_1000_d6c0:
    mov AX,2h
    push AX
    push AX
    call makeSound
    add SP,4h
    mov AX,2h
    push AX
    mov AX,22h
    push AX
    call makeSound
    add SP,4h
    mov AX,1f4h
    push AX
    call randlmul
    add SP,2h
    add AX,1f4h
    push word ptr [_var_544]
    mov SI,AX
    call _abs
    add SP,2h
    mov CL,5h
    sar AX,CL
    push word ptr [_var_545]
    mov DI,AX
    call _abs
    add SP,2h
    mov CL,5h
    sar AX,CL
    add AX,DI
    add AX,word ptr [_word_3AA5A]
    cmp AX,SI
    jle LAB_1000_d71c
    mov AX,6h
    push AX
    call sub_11B37
    add SP,2h
    jmp LAB_1000_d726
LAB_1000_d71c:
    les BX,dword ptr [_commData]
    mov word ptr ES:[BX + 26h],2h
LAB_1000_d726:
    mov word ptr [word_3BE3C],1h
    mov AX,word ptr [_word_3BEC0]
    mov word ptr [_word_3C028],AX
    mov AX,word ptr [_word_3BED0]
    mov word ptr [_word_3C03A],AX
    mov AX,word ptr [_var_547]
    db 05h, 08h, 00h ; add AX,8h (force imm16 encoding)
    mov word ptr [_word_3C040],AX
LAB_1000_d741:
    jmp LAB_1000_d88c
    db 0E9h
    db 45h
    db 01h
LAB_1000_d747:
    cmp AX,266ch
    jnz LAB_1000_d74f
    jmp LAB_1000_d31d
LAB_1000_d74f:
    jbe LAB_1000_d754
    jmp LAB_1000_d7ee
LAB_1000_d754:
    cmp AX,1970h
    jnz LAB_1000_d75c
    jmp LAB_1000_d605
LAB_1000_d75c:
    ja LAB_1000_d79e
    cmp AX,1177h
    jnz LAB_1000_d766
    jmp LAB_1000_d5af
LAB_1000_d766:
    ja LAB_1000_d77b
    cmp AX,11bh
    jnz LAB_1000_d770
    jmp LAB_1000_d6b6
LAB_1000_d770:
    cmp AX,0e08h
    jnz LAB_1000_d778
    jmp LAB_1000_d641
LAB_1000_d778:
    jmp LAB_1000_d88c
LAB_1000_d77b:
    cmp AX,1372h
    jnz LAB_1000_d783
    jmp LAB_1000_d284
LAB_1000_d783:
    cmp AX,1400h
    jnz LAB_1000_d78b
    jmp LAB_1000_d4de
LAB_1000_d78b:
    cmp AX,1474h
    jnz LAB_1000_d793
    jmp LAB_1000_d639
LAB_1000_d793:
    cmp AX,1500h
    jnz LAB_1000_d79b
    jmp LAB_1000_d27e
LAB_1000_d79b:
    jmp LAB_1000_d88c
LAB_1000_d79e:
    cmp AX,2000h
    jnz LAB_1000_d7a6
    jmp LAB_1000_d34c
LAB_1000_d7a6:
    ja LAB_1000_d7c3
    cmp AX,1c0dh
    jnz LAB_1000_d7b0
    jmp LAB_1000_d64a
LAB_1000_d7b0:
    cmp AX,1e00h
    jnz LAB_1000_d7b8
    jmp LAB_1000_d45c
LAB_1000_d7b8:
    cmp AX,1f73h
    jnz LAB_1000_d7c0
    jmp LAB_1000_d4f7
LAB_1000_d7c0:
    jmp LAB_1000_d88c
LAB_1000_d7c3:
    cmp AX,2064h
    jnz LAB_1000_d7cb
    jmp LAB_1000_d54f
LAB_1000_d7cb:
    cmp AX,2100h
    jnz LAB_1000_d7d3
    jmp LAB_1000_d424
LAB_1000_d7d3:
    cmp AX,2166h
    jnz LAB_1000_d7db
    jmp LAB_1000_d303
LAB_1000_d7db:
    cmp AX,2267h
    jnz LAB_1000_d7e3
    jmp LAB_1000_d530
LAB_1000_d7e3:
    cmp AX,2500h
    jnz LAB_1000_d7eb
    jmp LAB_1000_d3a2
LAB_1000_d7eb:
    jmp LAB_1000_d88c
LAB_1000_d7ee:
    cmp AX,3b00h
    jnz LAB_1000_d7f6
    jmp LAB_1000_d65c
LAB_1000_d7f6:
    ja LAB_1000_d83e
    cmp AX,2f00h
    jnz LAB_1000_d800
    jmp LAB_1000_d480
LAB_1000_d800:
    ja LAB_1000_d81c
    cmp AX,2c7ah
    jnz LAB_1000_d80a
    jmp LAB_1000_d2f7
LAB_1000_d80a:
    cmp AX,2d78h
    jnz LAB_1000_d812
    jmp LAB_1000_d2fd
LAB_1000_d812:
    cmp AX,2e63h
    jnz LAB_1000_d81a
    jmp LAB_1000_d310
LAB_1000_d81a:
    jmp LAB_1000_d88c
LAB_1000_d81c:
    cmp AX,3100h
    jnz LAB_1000_d824
    jmp LAB_1000_d4cc
LAB_1000_d824:
    cmp AX,3200h
    jnz LAB_1000_d82c
    jmp LAB_1000_d3ec
LAB_1000_d82c:
    cmp AX,326dh
    jnz LAB_1000_d834
    jmp LAB_1000_d516
LAB_1000_d834:
    cmp AX,3920h
    jnz LAB_1000_d83c
    jmp LAB_1000_d653
LAB_1000_d83c:
    jmp LAB_1000_d88c
LAB_1000_d83e:
    cmp AX,3f00h
    jnz LAB_1000_d846
    jmp LAB_1000_d680
LAB_1000_d846:
    ja LAB_1000_d862
    cmp AX,3c00h
    jnz LAB_1000_d850
    jmp LAB_1000_d665
LAB_1000_d850:
    cmp AX,3d00h
    jnz LAB_1000_d858
    jmp LAB_1000_d66e
LAB_1000_d858:
    cmp AX,3e00h
    jnz LAB_1000_d860
    jmp LAB_1000_d677
LAB_1000_d860:
    jmp LAB_1000_d88c
LAB_1000_d862:
    cmp AX,4000h
    jnz LAB_1000_d86a
    jmp LAB_1000_d689
LAB_1000_d86a:
    cmp AX,4100h
    jnz LAB_1000_d872
    jmp LAB_1000_d692
LAB_1000_d872:
    cmp AX,4200h
    jnz LAB_1000_d87a
    jmp LAB_1000_d69b
LAB_1000_d87a:
    cmp AX,4300h
    jnz LAB_1000_d882
    jmp LAB_1000_d6a4
LAB_1000_d882:
    cmp AX,4400h
    jnz LAB_1000_d88a
    jmp LAB_1000_d6ad
LAB_1000_d88a:
    jmp LAB_1000_d88c
LAB_1000_d88c:
    test word ptr [_planeFlags],1000h
    jnz LAB_1000_d897
    jmp LAB_1000_d94b
LAB_1000_d897:
    mov AX,word ptr [BP + 4h]
    jmp LAB_1000_d92a
LAB_1000_d89d:
    call sub_119A3
    jmp LAB_1000_d94b
LAB_1000_d8a3:
    sub AX,AX
    mov DX,2h
    mov CL,byte ptr [byte_383E5]
    or CL,CL
    jz LAB_1000_d8ba
LAB_1000_d8b0:
    sar DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_d8ba
    jmp LAB_1000_d8b0
LAB_1000_d8ba:
    add word ptr [_dword_3B7F8],AX
    adc word ptr [_dword_3B7F8+2],DX
    jmp LAB_1000_d94b
LAB_1000_d8c5:
    sub AX,AX
    mov DX,2h
    mov CL,byte ptr [byte_383E5]
    or CL,CL
    jz LAB_1000_d8dc
LAB_1000_d8d2:
    sar DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_d8dc
    jmp LAB_1000_d8d2
LAB_1000_d8dc:
    sub word ptr [_dword_3B7F8],AX
    sbb word ptr [_dword_3B7F8+2],DX
    jmp LAB_1000_d94b
LAB_1000_d8e6:
    sub AX,AX
    mov DX,2h
    mov CL,byte ptr [byte_383E5]
    or CL,CL
    jz LAB_1000_d8fd
LAB_1000_d8f3:
    sar DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_d8fd
    jmp LAB_1000_d8f3
LAB_1000_d8fd:
    sub word ptr [_dword_3B7DA],AX
    sbb word ptr [_dword_3B7DA+2],DX
    jmp LAB_1000_d94b
LAB_1000_d907:
    sub AX,AX
    mov DX,2h
    mov CL,byte ptr [byte_383E5]
    or CL,CL
    jz LAB_1000_d91e
LAB_1000_d914:
    sar DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_d91e
    jmp LAB_1000_d914
LAB_1000_d91e:
    add word ptr [_dword_3B7DA],AX
    adc word ptr [_dword_3B7DA+2],DX
    jmp LAB_1000_d94b
    db 0EBh
    db 21h
LAB_1000_d92a:
    cmp AX,1300h
    jnz LAB_1000_d932
    jmp LAB_1000_d89d
LAB_1000_d932:
    cmp AX,1f00h
    jnz LAB_1000_d93a
    jmp LAB_1000_d8a3
LAB_1000_d93a:
    cmp AX,2c00h
    jz LAB_1000_d8e6
    cmp AX,2d00h
    jz LAB_1000_d8c5
    cmp AX,2e00h
    jz LAB_1000_d907
    jmp LAB_1000_d94b
LAB_1000_d94b:
    cmp word ptr [word_3BE3C],0h
    jz LAB_1000_d958
    mov word ptr [_keyValue],8ch
LAB_1000_d958:
    cmp word ptr [_var_597],0h
    jle LAB_1000_d963
    dec word ptr [_var_597]
LAB_1000_d963:
    mov AX,1h
    push AX
    call sub_1D21E
    add SP,2h
    or AX,AX
    jz LAB_1000_d981
    cmp word ptr [_var_597],0h
    jnz LAB_1000_d981
    call sub_18AA6
    mov word ptr [_var_597],4h
LAB_1000_d981:
    test byte ptr [_planeFlags],1h
    jz LAB_1000_d98d
    mov AX,4h
    jmp LAB_1000_d9a4
LAB_1000_d98d:
    cmp word ptr [_word_3AA5A],0fah
    jl LAB_1000_d99c
    test byte ptr [_word_336E8],1h
    jz LAB_1000_d9a1
LAB_1000_d99c:
    mov AX,2h
    jmp LAB_1000_d9a4
LAB_1000_d9a1:
    mov AX,0ah
LAB_1000_d9a4:
    push AX
    mov AX,3h
    push AX
    call sub_19EB6
    add SP,4h
    test byte ptr [_planeFlags],8h
    jz LAB_1000_d9bb
    mov AX,0eh
    jmp LAB_1000_d9ca
LAB_1000_d9bb:
    cmp byte ptr [_gfxModeUnset],0h
    jz LAB_1000_d9c7
    mov AX,3h
    jmp LAB_1000_d9ca
LAB_1000_d9c7:
    mov AX,2h
LAB_1000_d9ca:
    push AX
    mov AX,2h
    push AX
    call sub_19EB6
    add SP,4h
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
keyDispatch endp
; ------------------------------seg000:0xd9da------------------------------
; ------------------------------seg000:0xd9db------------------------------
selectMissile proc near
    push BP
    mov BP,SP
    mov BX,word ptr [_missileSpecIndex]
    shl BX,1h
    shl BX,1h
    mov AX,1ah
    imul word ptr [BX + offset _missileSpecIndex]
    add AX,820h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov BX,word ptr [_missileSpecIndex]
    shl BX,1h
    shl BX,1h
    cmp word ptr [BX + offset _missileSpecIndex + 2],0h
    jnz LAB_1000_da0f
    mov AX,offset aNotAvailable
    jmp LAB_1000_da12
LAB_1000_da0f:
    mov AX,offset aArmed
LAB_1000_da12:
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    push word ptr [_missileSpecIndex]
    call _sub_11A88
    add SP,2h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    mov SP,BP
    pop BP
    ret
selectMissile endp
; ------------------------------seg000:0xda34------------------------------
; ------------------------------seg000:0xda35------------------------------
makeSound proc near
    push BP
    mov BP,SP
    mov AX,word ptr [_var_600]
    cmp word ptr [BP + 6h],AX
    jl LAB_1000_da58
    cmp word ptr [word_3BE3C],0h
    jz LAB_1000_da4d
    cmp word ptr [BP + 6h],1h
    jle LAB_1000_da58
LAB_1000_da4d:
    push word ptr [BP + 4h]
    call far ptr audio_jump_66
    add SP,2h
LAB_1000_da58:
    call sub_1DA8D
    mov SP,BP
    pop BP
    ret
makeSound endp
; ------------------------------seg000:0xda5e------------------------------
; ------------------------------seg000:0xda5f------------------------------
sub_1DA5F proc near
    push BP
    mov BP,SP
    cmp word ptr [_var_600],2h
    jge LAB_1000_da89
    cmp word ptr [word_3BE3C],0h
    jnz LAB_1000_da89
    mov BX,word ptr [BP + 4h]
    shl BX,1h
    mov AX,word ptr [_f15DgtlResult]
    cmp word ptr [BX + offset aArmed + 7],AX
    jnc LAB_1000_da89
    push word ptr [BP + 4h]
    call far ptr audio_jump_6d
    add SP,2h
LAB_1000_da89:
    mov SP,BP
    pop BP
    ret
sub_1DA5F endp
; ------------------------------seg000:0xda8c------------------------------
; ------------------------------seg000:0xda8d------------------------------
sub_1DA8D proc near
    push BP
    mov BP,SP
    cmp word ptr [_var_600],0h
    jnz LAB_1000_da9e
    cmp word ptr [word_3BE3C],0h
    jz LAB_1000_daa5
LAB_1000_da9e:
    call far ptr audio_jump_69
    jmp LAB_1000_daaa
LAB_1000_daa5:
    call far ptr audio_jump_68
LAB_1000_daaa:
    mov SP,BP
    pop BP
    ret
sub_1DA8D endp
; ------------------------------seg000:0xdaad------------------------------
; ------------------------------seg000:0xdaae------------------------------
PUBLIC _sub_1DAAE
sub_1DAAE proc near
_sub_1DAAE equ sub_1DAAE
    push BP
    mov BP,SP
    cmp word ptr [_word_330C4],0fh
    jle LAB_1000_dadd
    mov AX,4h
    push AX
    mov AX,1h
    push AX
    mov AX,78h
    cwd
    mov CX,word ptr [_word_330C4]
    idiv CX
    db 2Dh, 09h, 00h ; sub AX,9h (force imm16 encoding)
    neg AX
    sar AX,1h
    push AX
    call _sub_1CF64
    add SP,6h
    mov word ptr [_var_595],AX
    jmp LAB_1000_dae3
LAB_1000_dadd:
    mov word ptr [_var_595],0h
LAB_1000_dae3:
    mov AX,0fh
    push AX
    mov AX,4h
    sub AX,word ptr [_word_3370A]
    push AX
    push word ptr [_word_330C4]
    call _sub_1CF64
    add SP,6h
    mov word ptr [_word_330C4],AX
    mov AX,10h
    push AX
    mov AX,3h
    push AX
    mov AX,word ptr [_word_330C4]
    shl AX,1h
    push AX
    call _sub_1CF64
    add SP,6h
    mov word ptr [word_3AFA4],AX
    mov AX,0fah
    imul word ptr [_word_330C4]
    mov word ptr [word_3B0AC],AX
    mov AX,0c8h
    imul word ptr [_word_330C4]
    mov word ptr [word_3995C],AX
    mov SP,BP
    pop BP
    ret
sub_1DAAE endp
; ------------------------------seg000:0xdb2a------------------------------
; ------------------------------seg000:0xdb2b------------------------------
sub_1DB2B proc near
    push BP
    mov BP,SP
    sub SP,2h
    mov word ptr [BP + -2h],0h
    jmp LAB_1000_db3b
LAB_1000_db38:
    inc word ptr [BP + -2h]
LAB_1000_db3b:
    cmp word ptr [BP + -2h],6h
    jge LAB_1000_db62
    mov BX,word ptr [BP + -2h]
    shl BX,1h
    mov AX,20h
    mov CL,byte ptr [BP + -2h]
    mov DX,word ptr [_word_38FDC]
    cmp DX,2h
    jle LAB_1000_db58
    mov DX,2h
LAB_1000_db58:
    add CL,DL
    shl AX,CL
    mov word ptr [BX + offset byte_3419F + 13],AX
    jmp LAB_1000_db38
LAB_1000_db62:
    mov AX,word ptr [_var_195]
    add AX,word ptr [_var_194]
    mov word ptr [_var_196],AX
    mov AX,270fh
    push AX
    mov AX,1000h
    push AX
    mov AX,word ptr [_var_195]
    shl AX,1h
    push AX
    call _sub_1CF64
    add SP,6h
    mov word ptr [_var_197],AX
    mov AX,word ptr [_word_38FDC]
    db 3Dh, 02h, 00h ; cmp AX,2h (force imm16 encoding)
    jle LAB_1000_db8e
    mov AX,2h
LAB_1000_db8e:
    mov CX,0d05h
    imul CX
    add AX,CX
    mov word ptr [_var_198],AX
    mov SP,BP
    pop BP
    ret
sub_1DB2B endp
; ------------------------------seg000:0xdb9b------------------------------
; ------------------------------seg000:0xdb9c------------------------------
sub_1DB9C equ _sub_1DB9C
; ------------------------------seg000:0xdbb6------------------------------
; ------------------------------seg000:0xdbe0------------------------------
sub_1DBE0 equ _sub_1DBE0
; ------------------------------seg000:0xdbff------------------------------
    nop
; ------------------------------seg000:0xdd5e------------------------------
sub_1DD5E equ _sub_1DD5E
; ------------------------------seg000:0xdd6e------------------------------
    nop
; ------------------------------seg000:0xdd7e------------------------------
sub_1DD7E equ _sub_1DD7E
; ------------------------------seg000:0xdd91------------------------------
; ------------------------------seg000:0xdd92------------------------------
sub_1DD92 equ _sub_1DD92
; ------------------------------seg000:0xdda8------------------------------
    nop
; ------------------------------seg000:0xddaa------------------------------
sub_1DDAA equ _sub_1DDAA
    nop
; ------------------------------seg000:0xddc3------------------------------
; ------------------------------seg000:0xddc4------------------------------
_openFile proc near
    path = word ptr 4
    mode = byte ptr 6
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ah, 3Dh
    mov al, [bp+mode]
    mov bx, ss
    mov ds, bx
    mov dx, [bp+path]
    int 21h ;DOS - 2+ - OPEN DISK FILE WITH HANDLE
    jnb short loc_1DE0D
    db 3Dh ;cmp ax, 2
    dw 2
    jnz short loc_1DDEC
loc_1DDE0:
    mov bx, [bp+path]
    mov ax, offset aFileNotFound ;":File not found$"
    mov cx, 0FFFFh
    jmp loc_1DF80
loc_1DDEC:
    db 3Dh ;cmp ax, 3
    dw 3
    jz short loc_1DDE0
    db 3Dh ;cmp ax, 4
    dw 4
    jnz short loc_1DE02
    mov cx, 0FFFFh
    mov bx, [bp+path]
    mov ax, offset aNoFileBuffersAvailabl ;":No file buffers available$"
    jmp loc_1DF80
loc_1DE02:
    mov cx, ax
    mov ax, offset aOpenError ;":Open error $"
    mov bx, [bp+path]
    jmp loc_1DF80
loc_1DE0D:
    mov fileReadPos, 200h
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
_openFile endp
; ------------------------------seg000:0xde1a------------------------------
; ------------------------------seg000:0xde1b------------------------------
createFile proc near
    arg_0 = word ptr 4
    arg_2 = word ptr 6
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ah, 3Ch
    mov cx, [bp+arg_2]
    mov bx, ss
    mov ds, bx
    mov dx, [bp+arg_0]
    int 21h ;DOS - 2+ - CREATE A FILE WITH HANDLE (CREAT)
    jnb short loc_1DE64
    db 3Dh ;cmp ax, 2
    dw 2
    jnz short loc_1DE43
loc_1DE37:
    mov bx, [bp+arg_0]
    mov ax, 5F7Ch
    mov cx, 0FFFFh
    jmp loc_1DF80
loc_1DE43:
    db 3Dh ;cmp ax, 3
    dw 3
    jz short loc_1DE37
    db 3Dh ;cmp ax, 4
    dw 4
    jnz short loc_1DE59
    mov cx, 0FFFFh
    mov bx, [bp+arg_0]
    mov ax, 5F8Ch
    jmp loc_1DF80
loc_1DE59:
    mov cx, ax
    mov ax, 5FA7h
    mov bx, [bp+arg_0]
    jmp loc_1DF80
loc_1DE64:
    mov fileReadPos, 200h
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
createFile endp
_createFile equ createFile
; ------------------------------seg000:0xde71------------------------------
; ------------------------------seg000:0xde72------------------------------
_closeFile proc near
    arg_0 = word ptr 4
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ah, 3Eh
    mov bx, [bp+arg_0]
    int 21h ;DOS - 2+ - CLOSE A FILE WITH HANDLE
    jnb short loc_1DE8B
    mov dx, offset aFileClosingError ;"File closing error$"
    mov cx, 0FFFFh
    jmp printString_1DF9B
loc_1DE8B:
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
_closeFile endp
; ------------------------------seg000:0xde92------------------------------
; ------------------------------seg000:0xde94------------------------------
readFile1 proc near
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
    jnc LAB_1000_deb7
    mov DX,5fc7h
    mov CX,0ffffh
    jmp printString_1DF9B
LAB_1000_deb7:
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
readFile1 endp
_readFile1 equ readFile1
; ------------------------------seg000:0xdebe------------------------------
; ------------------------------seg000:0xdebf------------------------------
readFile2 proc near
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
    jnc LAB_1000_dee5
    mov DX,5fc7h
    mov CX,0ffffh
    jmp printString_1DF9B
LAB_1000_dee5:
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
    db 1Eh
    db 06h
    db 56h
    db 57h
    db 8Ch
    db 0D8h
    db 8Eh
    db 0C0h
    db 36h
    db 8Eh
    db 1Eh
    db 0DEh
    db 5Fh
    db 0B9h
    db 00h
    db 01h
    db 36h
    db 8Bh
    db 36h
    db 0E0h
    db 5Fh
    db 0BFh
    db 7Ch
    db 5Dh
    db 0F3h
    db 0A5h
    db 36h
    db 81h
    db 06h
    db 0E0h
    db 5Fh
    db 00h
    db 02h
    db 0B8h
    db 00h
    db 02h
    db 5Fh
    db 5Eh
    db 07h
    db 1Fh
    db 0C3h
readFile2 endp
_readFile2 equ readFile2
; ------------------------------seg000:0xdeec------------------------------
; ------------------------------seg000:0xdf16------------------------------
read512FromFileIntoBuf proc near
    push ds
    mov ah, 3Fh
    mov bx, seg @data ;mov bx, seg dseg
    mov ds, bx
    mov bx, tmpFileHandle
    mov cx, 200h
    mov dx, offset picBuf
    int 21h ;DOS - 2+ - READ FROM FILE WITH HANDLE
    jnb short loc_1DF35
    mov dx, 5FC7h
    mov cx, 0FFFFh
    jmp short printString_1DF9B
loc_1DF35:
    pop ds
    retn
read512FromFileIntoBuf endp
    nop
; ------------------------------seg000:0xdf36------------------------------
; ------------------------------seg000:0xdf4f------------------------------
sub_1DF4F proc near
    arg_0 = word ptr 4
    arg_2 = word ptr 6
    arg_4 = word ptr 8
    arg_6 = word ptr 0Ah
    arg_8 = word ptr 0Ch
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    push ds
    mov ah, 40h
    mov bx, [bp+arg_6]
    mov ds, bx
    mov bx, [bp+arg_0]
    mov cx, [bp+arg_2]
    mov dx, [bp+arg_4]
    add dx, [bp+arg_8]
    int 21h ;DOS - 2+ - WRITE TO FILE WITH HANDLE
    pop ds
    jnb short loc_1DF78
    mov dx, 5FD2h
    mov cx, 0FFFFh
    jmp short printString_1DF9B
    nop ;align 2
loc_1DF78:
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
loc_1DF80:
    push ax
    mov ax, 3
    int 10h ;- VIDEO - SET VIDEO MODE
    mov di, 0
loc_1DF89:
    cmp byte ptr [bx+di], 0
    jz short loc_1DF91
    inc di
    jmp short loc_1DF89
loc_1DF91:
    mov byte ptr [bx+di], 24h
    mov dx, bx
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    pop dx
printString_1DF9B:
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    cmp cx, 0FFFFh
    jz short loc_1DFB7
    add cx, 30h
    mov byte_3862A, cl
    mov byte_3862B, 24h
    mov dx, offset byte_3862A
    mov ah, 9
    int 21h ;DOS - PRINT STRING
loc_1DFB7:
    mov ax, 4C00h
    int 21h ;DOS - 2+ - QUIT WITH EXIT CODE (EXIT)
sub_1DF4F endp ;AL = exit code
_sub_1DF4F equ sub_1DF4F
    nop
; ------------------------------seg000:0xdfba------------------------------
; ------------------------------seg000:0xe0aa------------------------------
_picBlit proc near
    arg_0 = word ptr 4
    arg_2 = word ptr 6
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ax, offset read512FromFileIntoBuf
    mov readFromFilePtr, ax
    mov ax, [bp+arg_0]
    mov tmpFileHandle, ax
    mov ax, [bp+arg_2]
    mov tmpPageIndex, ax
    call nullsub_1
    mov si, tmpPageIndex
    call far ptr gfx_jump_38_getPageBuf
    call far ptr gfx_jump_3b_clearBuf
    mov word_389E0, 0
    mov word_389D8, 0FA00h
loc_1E0E0:
    mov di, word_389E0
    call far ptr gfx_jump_3a_getRowOffset
    mov rowOffset, ax
    call sub_1E262
    mov di, rowOffset
    mov bp, offset picDecodedRowBuf
    mov bx, word_389E0
    call far ptr gfx_jump_33_fillRow
    mov di, rowOffset
    call far ptr gfx_jump_35
    inc word_389E0
    sub word_389D8, 140h
    jnz short loc_1E0E0
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
_picBlit endp
; ------------------------------seg000:0xe11b------------------------------
; ------------------------------seg000:0xe11c------------------------------
sub_1E11C proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,offset read512FromFileIntoBuf
    mov word ptr [_var_610],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_605],AX
    mov AX,word ptr [BP + 6h]
    mov ES,AX
    call far ptr gfx_jump_3b_clearBuf
    call nullsub_1
    mov word ptr [_var_609],0h
    mov word ptr [_var_606],0fa00h
LAB_1000_e148:
    mov DI,word ptr [_var_609]
    call far ptr gfx_jump_3a_getRowOffset
    mov word ptr [_var_608],AX
    call sub_1E262
    mov DI,word ptr [_var_608]
    mov BP,offset picDecodedRowBuf
    mov BX,word ptr [_var_609]
    call far ptr gfx_jump_33_fillRow
    mov DI,word ptr [_var_608]
    call far ptr gfx_jump_41
    inc word ptr [_var_609]
    sub word ptr [_var_606],140h
    jnz LAB_1000_e148
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
sub_1E11C endp
; ------------------------------seg000:0xe1f7------------------------------
; ------------------------------seg000:0xe1f8------------------------------
sub_1E1F8 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,offset read512FromFileIntoBuf
    mov word ptr [_var_610],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_605],AX
    mov AX,word ptr [BP + 6h]
    mov ES,AX
    call far ptr gfx_jump_3b_clearBuf
    call nullsub_1
    mov word ptr [_var_609],0h
    mov word ptr [_var_606],0fa00h
LAB_1000_e224:
    mov DI,word ptr [_var_609]
    call far ptr gfx_jump_3a_getRowOffset
    mov word ptr [_var_608],AX
    call sub_1E262
    mov DI,word ptr [_var_608]
    mov BP,offset picDecodedRowBuf
    mov BX,word ptr [_var_609]
    call far ptr gfx_jump_38_getPageBuf
    mov DI,word ptr [_var_608]
    call far ptr gfx_jump_40
    inc word ptr [_var_609]
    sub word ptr [_var_606],140h
    jnz LAB_1000_e224
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
sub_1E1F8 endp
; ------------------------------seg000:0xe25f------------------------------
; ------------------------------seg000:0xe260------------------------------
nullsub_1 proc near
    ret
nullsub_1 endp
; ------------------------------seg000:0xe260------------------------------
; ------------------------------seg000:0xe262------------------------------
sub_1E262 proc near
    push es
    push ds
    pop es
    cld
    mov si, fileReadPos
    add si, offset picBuf
    shr di, 1
    jnz short loc_1E275
    call sub_1E28C
loc_1E275:
    mov cx, 140h
    mov word ptr [_var_689], cx
    mov di, offset picDecodedRowBuf
    call sub_1E309
    sub si, offset picBuf
    mov fileReadPos, si
    pop es
    retn
sub_1E262 endp
; ------------------------------seg000:0xe28b------------------------------
; ------------------------------seg000:0xe28c------------------------------
sub_1E28C proc near
    mov AX,offset picBuf
    add AX,200h
    mov word ptr [_var_687],AX
    mov AX,offset word_38F70 - 1
    mov word ptr [_var_688],AX
    mov byte ptr [_var_690],0h
    mov byte ptr [word_38D5C],0h
    cmp SI,word ptr [_var_687]
    jc LAB_1000_e2b8
    push BX
    push CX
    push DX
    call word ptr [_var_610]
    pop DX
    pop CX
    pop BX
    mov SI,offset picBuf
LAB_1000_e2b8:
    lodsw
    mov word ptr [byte_38D63],AX
    mov byte ptr [_var_697],8h
    mov byte ptr [word_38D66],1h
    or AL,AL
    jns LAB_1000_e2d0
    dec byte ptr [word_38D66]
    neg AL
LAB_1000_e2d0:
    mov byte ptr [word_38D5E],AL
sub_1E28C endp
; ------------------------------seg000:0xe2d0------------------------------
; ------------------------------seg000:0xe2d3------------------------------
sub_1E2D3 proc near
    mov byte ptr [_var_692],9h
    mov word ptr [_var_694],1ffh
    mov DX,100h
    mov word ptr [byte_38D61],DX
    mov AX,0ffffh
    xor BX,BX
    mov CX,800h
LAB_1000_e2ed:
    mov word ptr [BX + offset word_3424C], AX
    add BX,3h
    loop LAB_1000_e2ed
    mov AL,0h
    xor BX,BX
    mov CX,100h
LAB_1000_e2fd:
    mov byte ptr [BX + offset word_3424E], AL
    inc AL
    add BX,3h
    loop LAB_1000_e2fd
    ret
sub_1E2D3 endp
; ------------------------------seg000:0xe308------------------------------
; ------------------------------seg000:0xe309------------------------------
sub_1E309 proc near
    cmp byte ptr [word_38D66],0h
    jz LAB_1000_e314
    shr word ptr [_var_689],1h
LAB_1000_e314:
    mov AX,word ptr [_var_688]
    mov word ptr [_var_688],SP
    mov SP,AX
    mov DX,word ptr [byte_38D61]
LAB_1000_e321:
    cmp byte ptr [_var_690],0h
    jnz LAB_1000_e349
    call sub_1E382
    cmp AL,90h
    jz LAB_1000_e335
    mov byte ptr [word_38D5C],AL
    jmp LAB_1000_e350
    db 90h
LAB_1000_e335:
    call sub_1E382
    or AL,AL
    jnz LAB_1000_e344
    mov AL,90h
    mov byte ptr [word_38D5C],AL
    jmp LAB_1000_e350
    db 90h
LAB_1000_e344:
    dec AL
    mov byte ptr [_var_690],AL
LAB_1000_e349:
    mov AL,byte ptr [word_38D5C]
    dec byte ptr [_var_690]
LAB_1000_e350:
    cmp byte ptr [word_38D66],0h
    jz LAB_1000_e36d
    mov AH,AL
    and AL,0fh
    shr AH,1h
    shr AH,1h
    shr AH,1h
    shr AH,1h
    stosw
    dec word ptr [_var_689]
    jnz LAB_1000_e321
    jmp LAB_1000_e374
    db 90h
LAB_1000_e36d:
    stosb
    dec word ptr [_var_689]
    jnz LAB_1000_e321
LAB_1000_e374:
    mov word ptr [byte_38D61],DX
    mov AX,word ptr [_var_688]
    mov word ptr [_var_688],SP
    mov SP,AX
    ret
sub_1E309 endp
; ------------------------------seg000:0xe381------------------------------
; ------------------------------seg000:0xe382------------------------------
sub_1E382 proc near
    pop BP
    cmp SP,offset word_38F70 - 1
    jz LAB_1000_e38c
LAB_1000_e389:
    pop AX
    jmp BP
LAB_1000_e38c:
    mov BX,word ptr [byte_38D63]
    mov CL,10h
    mov CH,byte ptr [_var_697]
    sub CL,CH
    shr BX,CL
    mov CL,CH
LAB_1000_e39c:
    cmp CL,byte ptr [_var_692]
    jge LAB_1000_e3c2
    cmp SI,word ptr [_var_687]
    jc LAB_1000_e3b5
    push BX
    push CX
    push DX
    call word ptr [_var_610]
    pop DX
    pop CX
    pop BX
    mov SI,offset picBuf
LAB_1000_e3b5:
    lodsw
    mov word ptr [byte_38D63],AX
    shl AX,CL
    or BX,AX
    add CL,10h
    jmp LAB_1000_e39c
LAB_1000_e3c2:
    sub CL,byte ptr [_var_692]
    mov byte ptr [_var_697],CL
    mov AX,BX
    and AX,word ptr [_var_694]
    mov CX,AX
    cmp AX,DX
    jl LAB_1000_e3e0
    mov CX,DX
    mov AX,word ptr [_var_699]
    mov BL,byte ptr [_var_700]
    push BX
LAB_1000_e3e0:
    mov BX,AX
    add BX,AX
    add BX,AX
    mov AX,word ptr [BX + offset word_3424C]
    inc AX
    jz LAB_1000_e3f5
    dec AX
    mov BL,byte ptr [BX + offset word_3424E]
    push BX
    jmp LAB_1000_e3e0
LAB_1000_e3f5:
    mov AL,byte ptr [BX + offset word_3424E]
    mov byte ptr [_var_700],AL
    push AX
    mov BX,DX
    add BX,DX
    add BX,DX
    mov byte ptr [BX + offset word_3424E],AL
    mov AX,word ptr [_var_699]
    mov word ptr [BX + offset word_3424C],AX
    inc DX
    cmp DX,word ptr [_var_694]
    jle LAB_1000_e41e
    inc byte ptr [_var_692]
    stc
    rcl word ptr [_var_694],1h
LAB_1000_e41e:
    mov AL,byte ptr [_var_692]
    cmp AL,byte ptr [word_38D5E]
    jle LAB_1000_e42a
    call sub_1E2D3
LAB_1000_e42a:
    mov word ptr [_var_699],CX
    jmp LAB_1000_e389
sub_1E382 endp
; ------------------------------seg000:0xe42e------------------------------
; These are compiler helper wrappers called by game code
unknown_libname_1 proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    mov DX,word ptr [BX + 2h]
    mov CX,word ptr [BP + 6h]
    call __aNlshl
    mov BX,word ptr [BP + 4h]
    mov word ptr [BX],AX
    mov word ptr [BX + 2h],DX
    mov SP,BP
    pop BP
    ret 4h
unknown_libname_1 endp
unknown_libname_2 proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    mov DX,word ptr [BX + 2h]
    mov CX,word ptr [BP + 6h]
    call __aNlshr
    mov BX,word ptr [BP + 4h]
    mov word ptr [BX],AX
    mov word ptr [BX + 2h],DX
    mov SP,BP
    pop BP
    ret 4h
unknown_libname_2 endp
; ------------------------------seg000:0xf881------------------------------
; ------------------------------seg001:0x2------------------------------
sub_1F882 proc far
    retn
sub_1F882 endp
; ------------------------------seg001:0x64------------------------------
; ------------------------------seg001:0x78------------------------------
sub_1F8F8 proc near
    retn
sub_1F8F8 endp
; ------------------------------seg001:0xfa------------------------------
; ------------------------------seg001:0x113------------------------------
sub_1F993 proc near
    retn
sub_1F993 endp
; ------------------------------seg001:0x136------------------------------
; ------------------------------seg001:0x137------------------------------
sub_1F9B7 proc near
    retn
sub_1F9B7 endp
; ------------------------------seg001:0x14b------------------------------
; ------------------------------seg001:0x15d------------------------------
sub_1F9DD proc near
    retn
sub_1F9DD endp
; ------------------------------seg001:0x23e------------------------------
; ------------------------------seg001:0x23f------------------------------
sub_1FABF proc near
    retn
sub_1FABF endp
; ------------------------------seg001:0x29c------------------------------
; ------------------------------seg001:0x29d------------------------------
sub_1FB1D proc near
    retn
sub_1FB1D endp
; ------------------------------seg001:0x2d1------------------------------
; ------------------------------seg001:0x2d2------------------------------
sub_1FB52 proc near
    retn
sub_1FB52 endp
; ------------------------------seg001:0x307------------------------------
; ------------------------------seg001:0x308------------------------------
sub_1FB88 proc near
    retn
sub_1FB88 endp
; ------------------------------seg001:0x333------------------------------
; ------------------------------seg001:0x334------------------------------
sub_1FBB4 proc near
    retn
sub_1FBB4 endp
; ------------------------------seg001:0x382------------------------------
; ------------------------------seg001:0x383------------------------------
sub_1FC03 proc near
    retn
sub_1FC03 endp
; ------------------------------seg001:0x3b9------------------------------
; ------------------------------seg001:0x3ba------------------------------
sub_1FC3A proc near
    retn
sub_1FC3A endp
; ------------------------------seg001:0x40d------------------------------
; ------------------------------seg001:0x40e------------------------------
sub_1FC8E proc near
    retn
sub_1FC8E endp
; ------------------------------seg001:0x483------------------------------
; ------------------------------seg001:0x484------------------------------
sub_1FD04 proc near
    retn
sub_1FD04 endp
; ------------------------------seg001:0x4f1------------------------------
; ------------------------------seg001:0x4f2------------------------------
sub_1FD72 proc near
    retn
sub_1FD72 endp
; ------------------------------seg001:0x52c------------------------------
; ------------------------------seg001:0x52d------------------------------
sub_1FDAD proc near
    retn
sub_1FDAD endp
; ------------------------------seg001:0x54f------------------------------
; ------------------------------seg001:0x5dc------------------------------
sub_1FE5C proc near
    retn ;sp-analysis failed
sub_1FE5C endp
; ------------------------------seg001:0x669------------------------------
; ------------------------------seg001:0x66c------------------------------
sub_1FEEC proc far
    retn
sub_1FEEC endp
; ------------------------------seg001:0x67d------------------------------
; ------------------------------seg001:0x67e------------------------------
sub_1FEFE proc near
    retn
sub_1FEFE endp
; ------------------------------seg001:0x883------------------------------
; ------------------------------seg001:0x884------------------------------
sub_20104 proc far
    retn
sub_20104 endp
; ------------------------------seg001:0x907------------------------------
; ------------------------------seg001:0x908------------------------------
sub_20188 proc near
    retn
sub_20188 endp
; ------------------------------seg001:0xa08------------------------------
; ------------------------------seg001:0xa09------------------------------
sub_20289 proc near
    retn
sub_20289 endp
; ------------------------------seg001:0xa31------------------------------
; ------------------------------seg001:0xa36------------------------------
sub_202B6 proc near
    retn
sub_202B6 endp
; ------------------------------seg001:0xa46------------------------------
; ------------------------------seg001:0xa47------------------------------
sub_202C7 proc far
    retn
sub_202C7 endp
; ------------------------------seg001:0xa59------------------------------
; ------------------------------seg001:0xa5a------------------------------
sub_202DA proc far
    retn
sub_202DA endp
; ------------------------------seg001:0xa67------------------------------
; ------------------------------seg001:0xa76------------------------------
sub_202F6 proc far
    retn
sub_202F6 endp
; ------------------------------seg001:0xa7f------------------------------
; ------------------------------seg001:0xa80------------------------------
sub_20300 proc near
    retn
sub_20300 endp
; ------------------------------seg001:0xb5f------------------------------
; ------------------------------seg001:0xb60------------------------------
sub_203E0 proc near
    retn
sub_203E0 endp
; ------------------------------seg001:0xbbb------------------------------
; ------------------------------seg001:0xbca------------------------------
sub_2044A proc far
    retn
sub_2044A endp
; ------------------------------seg001:0xbe6------------------------------
; ------------------------------seg001:0xbe7------------------------------
sub_20467 proc near
    retn ;sp-analysis failed
sub_20467 endp
; ------------------------------seg001:0xcb3------------------------------
; ------------------------------seg001:0xcb4------------------------------
sub_20534 proc near
    retn
sub_20534 endp
; ------------------------------seg001:0xdd6------------------------------
; ------------------------------seg001:0xdd8------------------------------
sub_20658 proc far
    retn
sub_20658 endp
; ------------------------------seg001:0xde1------------------------------
; ------------------------------seg001:0xdf4------------------------------
sub_20674 proc near
    retn
sub_20674 endp
; ------------------------------seg001:0xf77------------------------------
; ------------------------------seg001:0x10f0------------------------------
sub_20970 proc near
    retn
sub_20970 endp
; ------------------------------seg001:0x11c2------------------------------
; ------------------------------seg001:0x11c6------------------------------
sub_20A46 proc far
    retn
sub_20A46 endp
; ------------------------------seg001:0x11d7------------------------------
; ------------------------------seg001:0x11d8------------------------------
sub_20A58 proc near
    retn
sub_20A58 endp
; ------------------------------seg001:0x1281------------------------------
; ------------------------------seg001:0x1282------------------------------
sub_20B02 proc near
    retn
sub_20B02 endp
; ------------------------------seg001:0x132c------------------------------
; ------------------------------seg001:0x132e------------------------------
_sub_20BAE proc far
    retn
_sub_20BAE endp
; ------------------------------seg001:0x1345------------------------------
; ------------------------------seg001:0x135f------------------------------
sub_20BDF proc near
    retn
sub_20BDF endp
; ------------------------------seg001:0x147a------------------------------
; ------------------------------seg001:0x147b------------------------------
sub_20CFB proc near
    retn
sub_20CFB endp
; ------------------------------seg001:0x1598------------------------------
; ------------------------------seg001:0x1599------------------------------
sub_20E19 proc near
    retn
sub_20E19 endp
; ------------------------------seg001:0x15b7------------------------------
; ------------------------------seg001:0x15b8------------------------------
sub_20E38 proc far
    retn
sub_20E38 endp
; ------------------------------seg001:0x15cc------------------------------
; ------------------------------seg001:0x15cd------------------------------
sub_20E4D proc near
    retn
sub_20E4D endp
; ------------------------------seg001:0x175b------------------------------
; ------------------------------seg001:0x175c------------------------------
sub_20FDC proc far
    retn
sub_20FDC endp
; ------------------------------seg001:0x1769------------------------------
; ------------------------------seg001:0x176a------------------------------
sub_20FEA proc near
    retn
sub_20FEA endp
; ------------------------------seg001:0x17f4------------------------------
; ------------------------------seg001:0x17f5------------------------------
sub_21075 proc near
    retn ;sp-analysis failed
sub_21075 endp
; ------------------------------seg001:0x1933------------------------------
; ------------------------------seg001:0x193a------------------------------
sub_211BA proc near
    retn
sub_211BA endp
; ------------------------------seg001:0x1989------------------------------
; ------------------------------seg001:0x19e7------------------------------
nullsub_2 proc near
    retn
nullsub_2 endp
; ------------------------------seg001:0x19e7------------------------------
; ------------------------------seg001:0x1ba2------------------------------
sub_21422 proc near
    retn
sub_21422 endp
; ------------------------------seg001:0x1bc2------------------------------
; ------------------------------seg001:0x1bc4------------------------------
_sub_21444 proc far
    retn
_sub_21444 endp
; ------------------------------seg001:0x1c34------------------------------
; ------------------------------seg001:0x1ca6------------------------------
sub_21526 proc far
    retn
sub_21526 endp
; ------------------------------seg001:0x1ca9------------------------------
; ------------------------------seg001:0x1caa------------------------------
_sub_2152A proc far
    retn
_sub_2152A endp
; ------------------------------seg001:0x1cb5------------------------------
; ------------------------------seg001:0x1cb6------------------------------
sub_21536 proc near
    retn
sub_21536 endp
; ------------------------------seg001:0x1e3f------------------------------
; ------------------------------seg001:0x1e42------------------------------
sub_216C2 proc near
    retn
sub_216C2 endp
; ------------------------------seg001:0x1e62------------------------------
; ------------------------------seg001:0x1e84------------------------------
sub_21704 proc far
    retn
sub_21704 endp
; ------------------------------seg001:0x1e99------------------------------
; ------------------------------seg001:0x1e9a------------------------------
sub_2171A proc far
    retn
sub_2171A endp
; ------------------------------seg001:0x1e9f------------------------------
; ------------------------------seg001:0x1ea0------------------------------
sub_21720 proc near
    retn
sub_21720 endp
; ------------------------------seg001:0x1ed5------------------------------
; ------------------------------seg001:0x1ed6------------------------------
sub_21756 proc near
    retn
sub_21756 endp
; ------------------------------seg001:0x1f24------------------------------
; ------------------------------seg001:0x1f34------------------------------
sub_217B4 proc near
    retn
sub_217B4 endp
; ------------------------------seg001:0x201a------------------------------
; ------------------------------seg001:0x201c------------------------------
sub_2189C proc far
    retn
sub_2189C endp
; ------------------------------seg001:0x2027------------------------------
; ------------------------------seg001:0x2028------------------------------
sub_218A8 proc near
    retn
sub_218A8 endp
; ------------------------------seg001:0x21d5------------------------------
; ------------------------------seg002:0x12------------------------------
sub_21A82 proc far
    retn
sub_21A82 endp
; ------------------------------seg002:0x15------------------------------
; ------------------------------seg002:0x16------------------------------
_sub_21A86 proc near
    retn
_sub_21A86 endp
; ------------------------------seg002:0x9a0------------------------------
; ------------------------------seg002:0x9a1------------------------------
_sub_22411 proc near
    mov ax, _gfxBufPtr
    mov word_37B7E, ax
    mov word_37B9C, ax
    mov word_37BBA, ax
    mov word_37BD8, ax
    mov _byte_37C24, 0
loc_22425:
    cmp _byte_37C24, 1
    jz short loc_2242F
    jmp loc_22545
loc_2242F:
    mov ax, 64h
    mov word_37BF7, ax
    mov al, 8
    mov byte_37BF9, al
    mov ax, 0Ah
    mov word_37BFA, ax
    mov al, 0
    mov byte_37BFC, al
    mov ax, 66h
    mov word_37BFD, ax
    mov ax, 0CCh
    mov word_37BFF, ax
    mov al, 88h
    mov byte_37BF6, al
    mov ax, 12h
    mov word_37C01, ax
    mov ax, 0AFh
    mov word_37C03, ax
    mov ax, 4
    mov word_37C05, ax
    mov ax, 2
    mov word_37C07, ax
    mov ax, 0FFE9h
    mov word_37C09, ax
    mov ax, 0FFF8h
    mov word_37C0B, ax
    mov ax, 9
    mov word_37C0D, ax
    mov ax, 17h
    mov word_37C0F, ax
    mov ax, 1Ah
    mov word_37C11, ax
    mov al, 34h
    mov byte_37C13, al
    mov ax, 1Fh
    mov word_37C14, ax
    mov ax, 0Dh
    mov word_37C16, ax
    mov ax, 50h
    mov word_37C18, ax
    mov ax, 9Fh
    mov word_37C1A, ax
    call far ptr gfx_jump_1c
    mov word_37C1C, ax
    mov ax, 42h
    mov word_37C1E, ax
    mov ax, 25h
    mov word_37C20, ax
    mov ax, 6Ch
    mov word_37C22, ax
    mov ax, 44h
    mov word_37B34, ax
    mov ax, 60h
    mov word_37B36, ax
    mov ax, 2
    mov word_37B32, ax
    mov word_37B48, ax
    mov word_37B5E, ax
    mov word_37B74, ax
    mov ax, 3Bh
    mov word_37B46, ax
    mov ax, 82h
    mov word_37B4E, ax
    mov ax, 0BCh
    mov word_37B50, ax
    mov ax, 93h
    mov word_37B9E, ax
    mov ax, 14h
    mov word_37BA0, ax
    mov ax, 99h
    mov word_37BA4, ax
    mov ax, 4Ch
    mov word_37BA6, ax
    mov ax, 0Dh
    mov word_37BA8, ax
    mov ax, 9
    mov word_37BAA, ax
    mov ax, 82h
    mov word_37B86, ax
    mov ax, 40h
    mov word_37B88, ax
    mov ax, 3Bh
    mov word_37B8A, ax
    mov ax, 2
    mov word_37B8C, ax
    mov ax, 44h
    mov word_37B60, ax
    mov ax, 7Fh
    mov word_37B64, ax
    mov ax, 0C3h
    mov word_37B66, ax
    mov ax, 3Fh
    mov word_37B72, ax
    retn
loc_22545:
    mov ax, 5Eh
    mov word_37BF7, ax
    mov al, 11h
    mov byte_37BF9, al
    mov ax, 14h
    mov word_37BFA, ax
    mov al, 1
    mov byte_37BFC, al
    mov ax, 31h
    mov word_37BFD, ax
    mov ax, 0FFh
    mov word_37BFF, ax
    mov al, 6Dh
    mov byte_37BF6, al
    mov ax, 2Dh
    mov word_37C01, ax
    mov ax, 0F8h
    mov word_37C03, ax
    mov ax, 0Ah
    mov word_37C05, ax
    mov ax, 5
    mov word_37C07, ax
    mov ax, 0FFC4h
    mov word_37C09, ax
    mov ax, 0FFF1h
    mov word_37C0B, ax
loc_22590:
    mov ax, 10h
loc_22593:
    mov word_37C0D, ax
loc_22596:
    mov ax, 3Ch
loc_22599:
    mov word_37C0F, ax
    mov ax, 34h
    mov word_37C11, ax
    mov al, 68h
    mov byte_37C13, al
    mov ax, 4Fh
    mov word_37C14, ax
    mov ax, 24h
    mov word_37C16, ax
    mov ax, 38h
    mov word_37C18, ax
    mov ax, 9Fh
    mov word_37C1A, ax
loc_225BF:
    call far ptr gfx_jump_1d
loc_225C4:
    mov word_37C1C, ax
loc_225C7:
    mov ax, 0A0h
    mov word_37C1E, ax
    mov ax, 4Ch
    mov word_37C20, ax
    mov ax, 3Ch
    mov word_37C22, ax
    mov ax, 1Ah
    mov word_37B34, ax
    mov ax, 56h
    mov word_37B36, ax
    mov ax, 0
    mov word_37B32, ax
    mov word_37B48, ax
    mov word_37B5E, ax
    mov word_37B74, ax
    mov ax, 0Ah
    mov word_37B46, ax
    mov ax, 5Ah
    mov word_37B4E, ax
    mov ax, 0E6h
    mov word_37B50, ax
    mov ax, 82h
    mov word_37B9E, ax
    mov ax, 26h
    mov word_37BA0, ax
    mov ax, 93h
    mov word_37BA4, ax
    mov ax, 30h
    mov word_37BA6, ax
    mov ax, 19h
    mov word_37BA8, ax
    mov ax, 0Fh
    mov word_37BAA, ax
    mov ax, 5Ah
    mov word_37B86, ax
    mov ax, 10h
    mov word_37B88, ax
    mov ax, 8Dh
    mov word_37B8A, ax
    mov ax, 3
    mov word_37B8C, ax
    mov ax, 14h
    mov word_37B60, ax
    mov ax, 4Eh
    mov word_37B64, ax
    mov ax, 0F1h
    mov word_37B66, ax
    mov ax, 10h
    mov word_37B72, ax
    retn
_sub_22411 endp
; ------------------------------seg002:0xbea------------------------------
; ------------------------------seg002:0xbeb------------------------------
sub_2265B proc far
    retn
sub_2265B endp
; ------------------------------seg002:0xbfa------------------------------
; ------------------------------seg002:0xbfb------------------------------
sub_2266B proc near
    retn
sub_2266B endp
; ------------------------------seg002:0xc0d------------------------------
; ------------------------------seg002:0xc0e------------------------------
sub_2267E proc far
    retn
sub_2267E endp
; ------------------------------seg002:0xc20------------------------------
; ------------------------------seg002:0xc21------------------------------
sub_22691 proc near
    retn
sub_22691 endp
; ------------------------------seg002:0xc4d------------------------------
; ------------------------------seg002:0xc4e------------------------------
sub_226BE proc near
    retn
sub_226BE endp
; ------------------------------seg002:0xca9------------------------------
; ------------------------------seg002:0xcaa------------------------------
_restoreJoystickData proc far
    mov bx, sp
    push si
    push di
    push es
    mov si, offset joyData
    les di, [bx+4]
    mov cx, 14h
    rep movsw
    pop es
    pop di
    pop si
    retf
_restoreJoystickData endp
; ------------------------------seg002:0xcbd------------------------------
; ------------------------------seg002:0xcbe------------------------------
_copyJoystickData proc far
    mov bx, sp
    push si
    push di
    push ds
    push es
    lds si, [bx+4]
    mov di, offset joyData
    push ss
    pop es
    mov cx, 14h
    rep movsw
    pop es
    pop ds
    pop di
    pop si
    retf
_copyJoystickData endp
; ------------------------------seg002:0xcd5------------------------------
; ------------------------------seg003:0x6------------------------------
_setInt9Handler proc far
    push ds
    mov ax, 40h
    mov ds, ax
    and byte ptr ds:17h, 0DFh ;40:17, keyboard flag byte?
    xor ax, ax
    mov ss:56EAh, al
loc_22757:
    mov ss:56EBh, ax
loc_2275B:
    mov ss:56EDh, al
loc_2275F:
    mov ss:56EEh, al
loc_22763:
    mov ss:56EFh, al
    mov byte ptr ss:56E8h, 80h
loc_2276D:
    mov byte ptr ss:56E9h, 80h
    xor ax, ax
    mov ds, ax
loc_22777: ;int 9, keyboard data ready
    mov bx, 24h
    mov ax, [bx]
loc_2277C:
    mov dx, [bx+2]
loc_2277F: ;store original int9 handler address
    mov word ptr cs:loc_228C4+1, ax
    mov word ptr cs:loc_228C4+3, dx
    mov ax, offset int9Handler
loc_2278B:
    mov dx, cs
    cli
    mov [bx], ax
loc_22790:
    mov [bx+2], dx
    sti
    pop ds
    retf
_setInt9Handler endp
; ------------------------------seg003:0x55------------------------------
; ------------------------------seg003:0x56------------------------------
_restoreInt9Handler proc far
    push ds
    xor ax, ax
loc_22799:
    mov ds, ax
    mov bx, 24h
loc_2279E:
    mov ax, word ptr cs:loc_228C4+1
    mov dx, word ptr cs:loc_228C4+3
loc_227A7:
    cli
    mov [bx], ax
    mov [bx+2], dx
    sti
loc_227AE:
    pop ds
    retf
_restoreInt9Handler endp
; ------------------------------seg003:0x6f------------------------------
; ------------------------------seg003:0x70------------------------------
int9Handler proc near
    sti
    pushf
loc_227B2:
    push ds
    push es
loc_227B4:
    push ax
    push bx
loc_227B6:
    mov ax, @data ;mov ax, seg dseg
    mov ds, ax
    mov ax, 40h
    mov es, ax
    mov ah, byte_37F9F
    or ah, ah
    jz short loc_227D1
loc_227C8:
    dec ah
    mov byte_37F9F, ah
    jmp loc_2288D
loc_227D1:
    in al, 60h ;8042 keyboard controller data register
    cmp byte_37F9D, 0E0h
    mov byte_37F9D, al
    jz short loc_22808
    cmp al, 0E0h
    mov ah, 1
    jz short loc_227C8
    cmp al, 0E1h
    mov ah, 3
    jz short loc_227C8
    xor ah, ah
    test byte ptr es:17h, 20h
    jz short loc_227F6
    xor ah, 1
loc_227F6:
    test byte ptr es:17h, 3
    jz short loc_22801
    xor ah, 1
loc_22801:
    or ah, ah
    jz short loc_22808
loc_22805:
    jmp loc_2288D
loc_22808:
    mov ah, al
    and al, 7Fh
    cmp al, 51h
    ja short loc_2288D
    sub al, 29h
    jb short loc_2288D
    mov bx, 56F0h
    xlat
    or al, al
    jz short loc_2288D
    test ah, 80h
    jnz short loc_22878
    cmp byte_37F9A, 0
    jnz short loc_2288D
    mov byte_37F9A, al
    cmp byte_37F9E, al
    mov byte_37F9E, al
    jnz short loc_22844
    mov bx, es:6Ch
    sub bx, word_37F9B
    cmp bx, 5
    mov bh, 7Fh
    jb short loc_22846
loc_22844:
    mov bh, 5Ah
loc_22846:
    mov bl, 80h
    sub bl, bh
    add bh, 80h
    test al, 1
    jz short loc_22855
    mov byte_37F99, bl
loc_22855:
    test al, 2
    jz short loc_2285D
    mov byte_37F99, bh
loc_2285D:
    test al, 4
    jz short loc_22865
    mov byte_37F98, bl
loc_22865:
    test al, 8
    jz short loc_2286D
    mov byte_37F98, bh
loc_2286D:
    mov bx, es:6Ch
    mov word_37F9B, bx
    jmp short loc_2288D
loc_22878:
    cmp byte_37F9A, al
    jnz short loc_2288D
loc_2287E:
    mov byte_37F9A, 0
    mov byte_37F98, 80h
    mov byte_37F99, 80h
loc_2288D:
    mov bx, es:1Ah
    cmp bx, es:1Ch
    jz short loc_228BE
    mov ax, es:[bx]
loc_2289C:
    add bx, 2
    cmp bx, es:82h
    jb short loc_228AB
    mov bx, es:80h
loc_228AB:
    cmp bx, es:1Ch
    jz short loc_228BE
loc_228B2:
    cmp ax, es:[bx]
    jnz short loc_228BE
    mov es:1Ah, bx
    jmp short loc_2289C
loc_228BE:
    pop bx
    pop ax
    pop es
    pop ds
    popf
    cli
loc_228C4:
    db 0EAh ;far jump to original handlerjmp far ptr 0:0
    dd 0
int9Handler endp
; ------------------------------seg003:0x184------------------------------
; ==============================================================================
.DATA ;dseg segment para public 'DATA' use16

unk_328B0 db 0
    db 0
word_328B2 dw 0
    db 0
    db 0
unk_328B6 db 0
    db 0
aMsRunTimeLibraryCopyr db 'MS Run-Time Library - Copyright (c) 1988, Microsoft Corp'
unk_328F0 db 11h
    db 0
aRegn_xxx db 'regn.xxx',0
aLb_xxx db 'lb.xxx',0
aPg_xxx db 'pg.xxx',0
aVn_xxx db 'vn.xxx',0
aMe_xxx db 'me.xxx',0
aNc_xxx db 'nc.xxx',0
aCe_xxx db 'ce.xxx',0
aJp_xxx db 'jp.xxx',0
aNa_xxx db 'na.xxx',0
_byte_32933 db 0
_exitCode db 81h
    db 0
_gfxModeUnset dw 0
_f15DgtlResult dw 0
_regnStr dw offset aRegn_xxx
_scenarioPlh dw offset aLb_xxx
    dw offset aPg_xxx ;"pg.xxx"
    dw offset aVn_xxx ;"vn.xxx"
    dw offset aMe_xxx ;"me.xxx"
    dw offset aNc_xxx ;"nc.xxx"
    dw offset aCe_xxx ;"ce.xxx"
    dw offset aJp_xxx ;"jp.xxx"
    dw offset aNa_xxx ;"na.xxx"
_a256pit_pic db '256pit.PIC',0
_aCockpit_pic db 'cockpit.PIC',0
    db 0
aF15dgtl_bin db 'F15DGTL.BIN',0
f15dgtlAddr dw 0
allocSize dw 0
    db 1
    db 0
    db 0
unk_32977 db 0
    db 0
    db 0
    db 3Fh
    db 1
    db 0C7h
    db 0
    db 0
    db 0
    db 0Fh
    db 0
    db 4
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_3298A dw 0C4h
word_3298C dw 0A0h
word_3298E dw 64h
    db 0
    db 0
    db 2
    db 0
    db 3
    db 0
    db 4
    db 0
    db 6
    db 0
    db 8
    db 0
    db 0Bh
    db 0
    db 0Fh
    db 0
    db 14h
    db 0
    db 1Bh
    db 0
    db 24h
    db 0
    db 30h
    db 0
    db 40h
    db 0
    db 57h
unk_329AB db 0
    db 77h
    db 0
    db 0A4h
    db 0
    db 0
    db 0
    db 0
    db 0
ovlInsaneFlag db 0
aErrorReleasingOverlay db 'Error releasing overlay memory$'
aSafeLanding db 'Safe Landing',0
aReadyForTakeof db 'Ready for takeoff',0
aWeaponsRepleni db 'Weapons replenished',0
aAutomaticLandi db 'Automatic Landing Engaged',0
    db 0
    _waypoints Waypoint 4 dup(<0>)
_waypointIndex dw 0
word_32A34 dw 0
aNone db 'None',0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
aSa2 db 'SA-2',0
    db 0
    db 0
    db 0
    db 0C8h
    db 0
    db 3
    db 0
    db 0
    db 0
aSa5 db 'SA-5',0
    db 0
    db 0
    db 0
    db 5Eh
    db 1
    db 2
    db 0
    db 0
    db 0
aSa8b db 'SA-8B',0
    db 0
    db 0
    db 7Dh
    db 0
    db 5
    db 0
    db 0
    db 0
aSa10 db 'SA-10',0
    db 0
    db 0
    db 40h
    db 1
    db 7
    db 0
    db 1
    db 0
aSa11 db 'SA-11',0
    db 0
    db 0
    db 0C8h
    db 0
    db 5
    db 0
    db 0
    db 0
aSa12 db 'SA-12',0
    db 0
    db 0
    db 22h
    db 1
    db 6
    db 0
    db 1
    db 0
aSa13 db 'SA-13',0
    db 0
    db 0
    db 7Dh
    db 0
    db 3
    db 0
    db 0
    db 0
aSaN4 db 'SA-N-4',0
    db 0
    db 0C8h
    db 0
    db 4
    db 0
    db 1
    db 0
aSaN5 db 'SA-N-5',0
    db 0
    db 96h
    db 0
    db 3
    db 0
    db 0
    db 0
aSaN6 db 'SA-N-6',0
    db 0
    db 40h
    db 1
    db 6
    db 0
    db 1
    db 0
aSaN7 db 'SA-N-7',0
    db 0
    db 0C8h
    db 0
    db 5
    db 0
    db 0
    db 0
aHawk db 'Hawk',0
    db 0
    db 0
    db 0
    db 0AFh
    db 0
    db 6
    db 0
    db 1
    db 0
aRapier db 'Rapier',0
    db 0
    db 4Bh
    db 0
    db 8
    db 0
    db 0
    db 0
aTiger db 'Tiger',0
    db 0
    db 0
    db 41h
    db 0
    db 4
    db 0
    db 0
    db 0
aSeacat db 'Seacat',0
    db 0
    db 0C8h
    db 0
    db 2
    db 0
    db 0
    db 0
aIl76 db 'IL76',0
    db 0
    db 0
    db 0
    db 0C8h
    db 0
    db 8
    db 0
    db 3
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 32h
    db 0
    db 5
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 46h
    db 0
    db 6
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 50h
    db 0
    db 7
    db 0
    db 1
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 64h
    db 0
    db 8
    db 0
    db 1
    db 0
    db 4Fh
    db 54h
    db 48h
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0F4h
    db 1
    db 5
    db 0
    db 1
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 28h
    db 0
    db 3
    db 0
    db 0
    db 0
aMig23 db 'MIG-23',0
    db 20h
aFlogger db 'Flogger',0
    db 0
    db 0
    db 0E4h
    db 2
    db 30h
    db 2
    db 3
    db 0
    db 11h
    db 0
    db 0Ah
    db 0
    db 2
    db 0
    db 0
    db 0
aMig25 db 'MIG-25',0
    db 20h
aFoxbat db 'Foxbat',0
    db 0
    db 0
    db 0
    db 3Ah
    db 2
    db 0BCh
    db 2
    db 2
    db 0
    db 12h
    db 0
    db 0
    db 0
    db 2
    db 0
    db 0
    db 0
aMig29 db 'MIG-29',0
    db 20h
aFulcrum db 'Fulcrum',0
    db 0
    db 0
    db 0BCh
    db 2
    db 90h
    db 1
    db 5
    db 0
    db 13h
    db 0
    db 14h
    db 0
    db 2
    db 0
    db 0
    db 0
aF1 db 'F-1',0
    db 0
    db 0
    db 0
    db 20h
aMirage db 'Mirage',0
    db 0
    db 0
    db 0
    db 16h
    db 3
    db 0A2h
    db 3
    db 3
    db 0
    db 14h
    db 0
    db 0
    db 0
    db 2
    db 0
    db 0
    db 0
aSu27 db 'Su-27',0
    db 0
    db 20h
aFlanker db 'Flanker',0
    db 0
    db 0
    db 0D5h
    db 2
    db 0CBh
    db 2
    db 4
    db 0
    db 13h
    db 0
    db 14h
    db 0
    db 2
    db 0
    db 0
    db 0
aIl76_0 db 'IL-76',0
    db 0
    db 20h
aMainstay db 'Mainstay',0
    db 0
    db 90h
    db 1
    db 0A0h
    db 0Fh
    db 1
    db 0
    db 10h
    db 0
    db 0Ch
    db 0
    db 2
    db 0
    db 0
    db 0
aF4e db 'F-4E',0
    db 0
    db 0
    db 20h
    db 50h
    db 68h
    db 61h
    db 6Eh
    db 74h
    db 6Fh
    db 6Dh
    db 0
    db 0
    db 0
    db 20h
    db 3
    db 8
    db 2
    db 4
    db 0
    db 12h
    db 0
    db 0Bh
    db 0
    db 2
    db 0
    db 0
    db 0
    db 46h
    db 2Dh
    db 31h
    db 34h
    db 0
    db 0
    db 0
    db 20h
    db 54h
    db 6Fh
    db 6Dh
    db 63h
    db 61h
    db 74h
    db 0
    db 0
    db 0
    db 0
    db 20h
    db 3
    db 20h
    db 3
    db 4
    db 0
    db 13h
    db 0
    db 8
    db 0
    db 2
    db 0
    db 0
    db 0
    db 46h
    db 2Dh
    db 31h
    db 38h
    db 0
    db 0
    db 0
    db 20h
    db 48h
    db 6Fh
    db 72h
    db 6Eh
    db 65h
    db 74h
    db 0
    db 0
    db 0
    db 0
    db 94h
    db 2
    db 0CDh
    db 1
    db 5
    db 0
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 2
    db 0
    db 0
    db 0
aAn72 db 'An-72',0
    db 0
    db 20h
    db 43h
    db 6Fh
    db 61h
    db 6Ch
    db 65h
    db 72h
    db 0
    db 0
    db 0
    db 0
    db 5Eh
    db 1
    db 6Ch
    db 2
    db 2
    db 0
    db 0
    db 0
    db 9
    db 0
    db 2
    db 0
    db 0
    db 0
    db 46h
    db 2Dh
    db 31h
    db 38h
    db 0
    db 0
    db 0
    db 20h
    db 48h
    db 6Fh
    db 72h
    db 6Eh
    db 65h
    db 74h
    db 0
    db 0
    db 0
    db 0
    db 94h
    db 2
    db 0CDh
    db 1
    db 5
    db 0
    db 0FFh
    db 0FFh
    db 4
    db 0
    db 2
    db 0
    db 0
    db 0
    db 4Dh
    db 49h
    db 47h
    db 2Dh
    db 32h
    db 33h
    db 0
    db 20h
    db 46h
    db 6Ch
    db 6Fh
    db 67h
    db 67h
    db 65h
    db 72h
    db 0
    db 0
    db 0
    db 0E4h
    db 2
    db 30h
    db 2
    db 3
    db 0
    db 0
    db 0
    db 4
    db 0
    db 2
    db 0
    db 0
    db 0
    db 46h
    db 2Dh
    db 31h
    db 34h
    db 0
    db 0
    db 0
    db 20h
    db 54h
    db 6Fh
    db 6Dh
    db 63h
    db 61h
    db 74h
    db 0
    db 0
    db 0
    db 0
    db 20h
    db 3
    db 20h
    db 3
    db 4
    db 0
    db 0FFh
    db 0FFh
    db 8
    db 0
    db 2
    db 0
    db 0
    db 0
    db 46h
    db 2Dh
    db 34h
    db 45h
    db 0
    db 0
    db 0
    db 20h
    db 50h
    db 68h
    db 61h
    db 6Eh
    db 74h
    db 6Fh
    db 6Dh
    db 0
    db 0
    db 0
    db 20h
    db 3
    db 8
    db 2
    db 4
    db 0
    db 0FFh
    db 0FFh
    db 0Bh
    db 0
    db 2
    db 0
    db 0
    db 0
    db 4Dh
    db 49h
    db 47h
    db 2Dh
    db 31h
    db 37h
    db 0
    db 20h
    db 46h
    db 72h
    db 65h
    db 73h
    db 63h
    db 6Fh
    db 0
    db 0
    db 0
    db 0
    db 26h
    db 2
    db 2Ch
    db 1
    db 3
    db 0
    db 11h
    db 0
    db 10h
    db 0
    db 2
    db 0
    db 0
    db 0
    db 54h
    db 75h
    db 2Dh
    db 39h
    db 35h
    db 0
    db 0
    db 20h
    db 42h
    db 65h
    db 61h
    db 72h
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 9Ah
    db 1
    db 0ECh
    db 13h
    db 1
    db 0
    db 0
    db 0
    db 12h
    db 0
    db 2
    db 0
    db 0
    db 0
    db 4Dh
    db 69h
    db 2Dh
    db 32h
    db 34h
    db 0
    db 0
    db 20h
    db 48h
    db 69h
    db 6Eh
    db 64h
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0C8h
    db 0
    db 2Ch
    db 1
    db 1
    db 0
    db 11h
    db 0
    db 13h
    db 0
    db 2
    db 0
    db 0
    db 0
    db 46h
    db 2Dh
    db 35h
    db 0
    db 0
    db 0
    db 0
    db 20h
    db 54h
    db 69h
    db 67h
    db 65h
    db 72h
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0F4h
    db 1
    db 0FAh
    db 0
    db 3
    db 0
    db 16h
    db 0
    db 16h
    db 0
    db 2
    db 0
    db 0
    db 0
    db 37h
    db 36h
    db 37h
    db 0
    db 0
    db 0
    db 0
    db 20h
    db 42h
    db 6Fh
    db 65h
    db 69h
    db 6Eh
    db 67h
    db 0
    db 0
    db 0
    db 0
    db 90h
    db 1
    db 0E8h
    db 3
    db 1
    db 0
    db 0FFh
    db 0FFh
    db 12h
    db 0
    db 2
    db 0
    db 0
    db 0
    _sams Sam <'None', 0, 0, 0, 1, 13h>
    Sam <'SA-2', 7Dh, 7D0h, 1, 4, 13h>
    Sam <'SA-5', 96h, 708h, 1, 1, 13h>
    Sam <'SA-8B', 41h, 4B0h, 2, 3, 13h>
    Sam <'SA-10', 7Dh, 708h, 3, 2, 13h>
    Sam <'SA-11', 64h, 5DCh, 2, 3, 13h>
    Sam <'SA-12', 96h, 7D0h, 3, 2, 13h>
    Sam <'SA-13', 41h, 384h, 0, 4, 13h>
    Sam <'SA-N-4', 1Eh, 4B0h, 2, 3, 13h>
    Sam <'SA-N-5', 1Eh, 384h, 0FFFFh, 4, 13h>
    Sam <'SA-N-6', 7Dh, 708h, 3, 2, 13h>
    Sam <'SA-N-7', 64h, 5DCh, 2, 3, 13h>
    Sam <'Hawk', 7Dh, 384h, 2, 3, 13h>
    Sam <'Rapier', 41h, 4B0h, 2, 4, 13h>
    Sam <'Tiger', 1Eh, 384h, 1, 3, 13h>
    Sam <'Seacat', 1Eh, 384h, 1, 3, 13h>
    Sam <'AA-2', 0Eh, 5DCh, 0FFFFh, 4, 13h>
    Sam <'AA-8', 0Ch, 708h, 0, 5, 13h>
    Sam <'AA-6', 32h, 960h, 2, 2, 13h>
    Sam <'AA-7', 22h, 708h, 2, 2, 13h>
    Sam <'AA-9', 52h, 7D0h, 2, 3, 13h>
    Sam <'AA-10', 40h, 7D0h, 3, 4, 13h>
    Sam <'AIM120', 20h, 960h, 7, 4, 1>
    Sam <'AIM-9', 11h, 7D0h, 7, 8, 1>
    Sam <'HARM', 14h, 4B0h, 4, 2, 1>
    Sam <'Penguin', 20h, 1F4h, 5, 2, 13h>
    Sam <'Harpoon', 3Ch, 1F4h, 5, 2, 13h>
    Sam <'AGM-65', 20h, 320h, 6, 2, 0Dh>
    Sam <'LGBOMB', 0Ah, 0, 1Ch, 2, 0Fh>
    Sam <'RTBOMB', 0, 0, 1Dh, 2, 0Fh>
    Sam <'FFBOMB', 0, 0, 1Eh, 2, 0Fh>
    Sam <'AIM-7W', 2Ch, 960h, 2, 4, 1>
    Sam <'AIM-9W', 0Ch, 7D0h, 0, 5, 1>
    Sam <'SA-14', 10h, 384h, 0, 5, 1>
    Sam <'AA-6', 32h, 960h, 0FFFFh, 2, 13h>
    Sam <'AA-7', 22h, 708h, 0FFFFh, 2, 13h>
    Sam <'AA-9', 52h, 7D0h, 0FFFFh, 3, 13h>
    Sam <'AA-10', 40h, 7D0h, 0, 4, 13h>
    Sam <'Equip.', 0, 0, 1Dh, 0, 0Eh>
word_33096 dw 4
word_33098 dw 1388h
word_3309A dw 0
word_3309C dw 0Ch
word_3309E dw 12h
    db 3
    db 0
    _missleSpec MissileSpec <0, 4>
    MissileSpec <1, 4>
    MissileSpec <5, 6>
    MissileSpec <0>
_missileSpecIndex dw 0
word_330B4 dw 28Ah
_word_330B6 dw 0
word_330B8 dw 1
word_330BA dw 1
_word_330BC dw 0
word_330BE dw 0
    db 1
    db 0
_word_330C2 dw 1
_word_330C4 dw 4
    _missiles Missile <'AIM-9M', 'Sidewinder', 17h, 4>
    Missile <'AIM-120', 'AMRAAM ', 16h, 4>
    Missile <'AGM-88A', 'HARM', 18h, 4>
    Missile <'AIM-7M', 'Sparrow', 16h, 4>
    Missile <'AGM-86A', 'Harpoon', 1Ah, 1>
    Missile <'AGM-65D', 'Maverick', 1Bh, 6>
    Missile <'GBU-12', 'Paveway', 1Ch, 8>
    Missile <'Mk 20', 'Rockeye', 1Dh, 2>
    Missile <'Dndl', 'Durandal', 1Dh, 2>
    Missile <'Mk 82-0', 'Slick', 1Eh, 3>
    Missile <'Mk 82-1', 'Snakeye', 1Dh, 3>
    Missile <'Mk 20', 'Rockeye II', 1Ch, 4>
    Missile <'Mk 122', 'Fireeye', 1Eh, 2>
    Missile <'CBU-72', 'Fuel-Air', 1Ch, 2>
    Missile <'Mk 35', 'IN Cluster', 1Dh, 2>
    Missile <'ISC B-1', 'Minelets', 1Dh, 1>
    Missile <'135 mm', 'Camera', 0FFFFh, 1>
    Missile <'1900lbs', 'Extra Fuel', 0FFFEh, 1>
    Missile <'20 mm', 'Guns', 0, 1>
    Missile <'Special', 'Equip', 26h, 1>
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 2
    db 6
    db 2
    db 0
    db 2
    db 5
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 6
    db 2
    db 1
    db 2
    db 2
    db 3
    db 4
    db 3
    db 3
    db 4
    db 4
    db 4
    db 1
    db 2
    db 4
    db 1
    db 2
    db 4
    db 5
    db 5
    db 4
    db 4
    db 5
    db 4
    db 4
    db 1
    db 3
    db 0
    db 0
    db 4
    db 4
    db 0
    db 0
    db 5
    db 5
    db 4
    db 4
    db 5
    db 0
    db 4
    db 0
    db 8
    db 0
    db 0
    db 2
    db 1
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 3
    db 1
    db 3
    db 4
    db 1
    db 1
    db 4
    db 2
    db 3
    db 3
    db 4
    db 0
    db 3
    db 0
    db 1
    db 4
    db 4
    db 0
    db 0
    db 4
    db 0
    db 2
    db 0
    db 4
    db 0
    db 0
    db 1
    db 1
    db 4
    db 4
    db 1
    db 1
    db 4
    db 4
    db 4
    db 4
    db 4
    db 1
    db 3
    db 2
    db 0
    db 4
    db 4
    db 0
    db 2
    db 5
    db 3
    db 3
    db 2
    db 5
    db 1
    db 3
    db 4
    db 0
    db 0
    db 6
    db 0
    db 5
    db 0
    db 0
    db 0
    db 4
    db 0
    db 5
    db 2
    db 1
    db 0
    db 6
    db 4
    db 0
    db 0
    db 6
    db 6
    db 3
    db 6
    db 6
    db 0
    db 3
    db 0
    db 6
    db 0
    db 3
    db 0
    db 0
    db 2
    db 3
    db 0
    db 0
    db 3
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 3
    db 0
    db 4
    db 4
    db 0
    db 2
    db 4
    db 4
    db 3
    db 4
    db 5
    db 0
    db 3
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_333D2 dw 0
word_333D4 dw 0
    db 0
    db 0
word_333D8 dw 0
word_333DA dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    stru_33402 struc_9 8 dup(<0>)
word_33442 dw 0
    db 3
    db 0
    db 3
    db 0
    db 2
    db 0
    db 1
    db 0
    db 0
    db 0
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FFh
    db 0FFh
    db 3
    db 0
    db 2
    db 0
    db 2
    db 0
    db 2
    db 0
    db 1
    db 0
    db 1
    db 0
    db 1
    db 0
    db 2
    db 0
    db 3
    db 0
    db 3
    db 0
    db 3
    db 0
    db 2
    db 0
    db 2
    db 0
    db 2
    db 0
    db 3
    db 0
    db 3
    db 0
    db 3
    db 0
    db 3
    db 0
    db 3
    db 0
    db 3
    db 0
    db 3
    db 0
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 3
    db 0
    db 3
    db 0
    db 3
    db 0
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FDh
    db 0FFh
    db 1
    db 0
    db 2
    db 0
    db 1
    db 0
    db 0
    db 0
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 2
    db 0
    db 3
    db 0
    db 2
    db 0
    db 2
    db 0
    db 1
    db 0
    db 1
    db 0
    db 1
    db 0
    db 0FEh
    db 0FFh
    db 4
    db 0
    db 4
    db 0
    db 3
    db 0
    db 2
    db 0
    db 1
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 0FEh
    db 0FFh
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 4
    db 0
    db 4
    db 0
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 2
    db 0
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 2
    db 0
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FFh
    db 0FFh
    db 2
    db 0
    db 3
    db 0
    db 2
    db 0
    db 2
    db 0
    db 1
    db 0
    db 1
    db 0
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 4
    db 0
    db 4
    db 0
    db 3
    db 0
    db 2
    db 0
    db 1
    db 0
    db 4
    db 0
    db 0FCh
    db 0FFh
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 0
    db 1
    db 4
    db 0
    db 0
    db 1
    db 0
    db 1
    db 0
    db 1
    db 4
    db 0
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0
    db 2
    db 4
    db 0
    db 0
    db 1
    db 0
    db 1
    db 0
    db 1
    db 0
    db 1
    db 0FCh
    db 0FFh
    db 0
    db 2
    db 4
    db 0
    db 4
    db 0
    db 0FCh
    db 0FFh
    db 0
    db 1
    db 0
    db 1
    db 0
    db 1
    db 0FCh
    db 0FFh
    db 4
    db 0
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 4
    db 0
    db 0
    db 1
    db 0FFh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 2
    db 0
    db 1
    db 0
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FFh
    db 0FFh
    _stru_335C4 struc_2 0Ch dup(<0>)
word_336E4 dw 4
word_336E6 dw 0FFFFh
_word_336E8 dw 0
_word_336EA dw 0
word_336EC dw 1
word_336EE dw 0
word_336F0 dw 0
_word_336F2 dw 0FFFFh
_word_336F4 dw 0FFFFh
word_336F6 dw 0FFFFh
word_336F8 dw 1
word_336FA dw 0
_word_336FC dw 0FFFFh
_word_336FE dw 4
word_33700 dw 0FFFFh
word_33702 dw 1
word_33704 dw 1
word_33706 dw 1
word_33708 dw 0
_word_3370A dw 1
_word_3370C dw 0FFFFh
_word_3370E dw 0
word_33710 dw 1
word_33712 dw 0
word_33714 dw 0
aStoresExhauste db 'Stores exhausted',0
aFlare db 'Flare',0
aChaff db 'Chaff',0
aReleased db ' released',0
asc_3373D db ':',0
aGun db 'GUN:',0
asc_33744 db 'L',0
    db '(',0
aS db 's',0
word_3374A dw 0
aOnPatrol db ' on patrol',0
aF15StrikeEagle db 'F15 Strike Eagle',0
aAt db ' at ',0
    db 0
; ------------------------------dseg:0xebe------------------------------
_gfx_jump_0_alloc proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_0_alloc endp
; ------------------------------dseg:0xebe------------------------------
; ------------------------------dseg:0xec3------------------------------
gfx_jump_01 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_01 endp
; ------------------------------dseg:0xec3------------------------------
; ------------------------------dseg:0xec8------------------------------
gfx_jump_02 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_02 endp
; ------------------------------dseg:0xec8------------------------------
; ------------------------------dseg:0xecd------------------------------
gfx_jump_03 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_03 endp
; ------------------------------dseg:0xecd------------------------------
; ------------------------------dseg:0xed2------------------------------
gfx_jump_04 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_04 endp
; ------------------------------dseg:0xed2------------------------------
; ------------------------------dseg:0xed7------------------------------
_gfx_jump_05_drawString proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_05_drawString endp
; ------------------------------dseg:0xed7------------------------------
; ------------------------------dseg:0xedc------------------------------
gfx_jump_06 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_06 endp
; ------------------------------dseg:0xedc------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
    db 0EAh
    db 0
    db 0
    db 0
    db 0
    db 0EAh
    db 0
    db 0
    db 0
    db 0
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0xef5------------------------------
gfx_jump_0b proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_0b endp
; ------------------------------dseg:0xef5------------------------------
; ------------------------------dseg:0xefa------------------------------
_gfx_jump_0c proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_0c endp
; ------------------------------dseg:0xefa------------------------------
; ------------------------------dseg:0xeff------------------------------
gfx_jump_0d_setCurBuf proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_0d_setCurBuf endp
; ------------------------------dseg:0xeff------------------------------
; ------------------------------dseg:0xf04------------------------------
gfx_jump_0e_setCurBuf proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_0e_setCurBuf endp
; ------------------------------dseg:0xf04------------------------------
; ------------------------------dseg:0xf09------------------------------
gfx_jump_0f_getBufPtr proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_0f_getBufPtr endp
; ------------------------------dseg:0xf09------------------------------
; ------------------------------dseg:0xf0e------------------------------
gfx_jump_10_getCurBuf proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_10_getCurBuf endp
; ------------------------------dseg:0xf0e------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0xf18------------------------------
gfx_jump_12 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_12 endp
; ------------------------------dseg:0xf18------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
    db 0EAh
    db 0
    db 0
    db 0
    db 0
    db 0EAh
    db 0
    db 0
    db 0
    db 0
    db 0EAh
    db 0
    db 0
    db 0
    db 0
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0xf36------------------------------
gfx_jump_18 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_18 endp
; ------------------------------dseg:0xf36------------------------------
; ------------------------------dseg:0xf3b------------------------------
gfx_jump_19 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_19 endp
; ------------------------------dseg:0xf3b------------------------------
; ------------------------------dseg:0xf40------------------------------
gfx_jump_1a proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_1a endp
; ------------------------------dseg:0xf40------------------------------
; ------------------------------dseg:0xf45------------------------------
gfx_jump_1b proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_1b endp
; ------------------------------dseg:0xf45------------------------------
; ------------------------------dseg:0xf4a------------------------------
gfx_jump_1c proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_1c endp
; ------------------------------dseg:0xf4a------------------------------
; ------------------------------dseg:0xf4f------------------------------
gfx_jump_1d proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_1d endp
; ------------------------------dseg:0xf4f------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0xf59------------------------------
gfx_jump_1f proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_1f endp
; ------------------------------dseg:0xf59------------------------------
; ------------------------------dseg:0xf5e------------------------------
gfx_jump_20 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_20 endp
; ------------------------------dseg:0xf5e------------------------------
; ------------------------------dseg:0xf63------------------------------
_gfx_jump_21 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_21 endp
; ------------------------------dseg:0xf63------------------------------
; ------------------------------dseg:0xf68------------------------------
gfx_jump_22 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_22 endp
; ------------------------------dseg:0xf68------------------------------
; ------------------------------dseg:0xf6d------------------------------
_gfx_jump_23 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_23 endp
; ------------------------------dseg:0xf6d------------------------------
; ------------------------------dseg:0xf72------------------------------
gfx_jump_24 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_24 endp
; ------------------------------dseg:0xf72------------------------------
; ------------------------------dseg:0xf77------------------------------
gfx_jump_25 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_25 endp
; ------------------------------dseg:0xf77------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0xf86------------------------------
gfx_jump_28 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_28 endp
; ------------------------------dseg:0xf86------------------------------
; ------------------------------dseg:0xf8b------------------------------
gfx_jump_29_switchColor proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_29_switchColor endp
; ------------------------------dseg:0xf8b------------------------------
; ------------------------------dseg:0xf90------------------------------
_gfx_jump_2a proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_2a endp
; ------------------------------dseg:0xf90------------------------------
; ------------------------------dseg:0xf95------------------------------
gfx_jump_2b proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_2b endp
; ------------------------------dseg:0xf95------------------------------
; ------------------------------dseg:0xf9a------------------------------
gfx_jump_2c proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_2c endp
; ------------------------------dseg:0xf9a------------------------------
; ------------------------------dseg:0xf9f------------------------------
_gfx_jump_2d proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_2d endp
; ------------------------------dseg:0xf9f------------------------------
; ------------------------------dseg:0xfa4------------------------------
gfx_jump_2e proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_2e endp
; ------------------------------dseg:0xfa4------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
    db 0EAh
    db 0
    db 0
    db 0
    db 0
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0xfb8------------------------------
gfx_jump_32 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_32 endp
; ------------------------------dseg:0xfb8------------------------------
; ------------------------------dseg:0xfbd------------------------------
gfx_jump_33_fillRow proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_33_fillRow endp
; ------------------------------dseg:0xfbd------------------------------
; ------------------------------dseg:0xfc2------------------------------
gfx_jump_34_fillRow proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_34_fillRow endp
; ------------------------------dseg:0xfc2------------------------------
; ------------------------------dseg:0xfc7------------------------------
gfx_jump_35 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_35 endp
; ------------------------------dseg:0xfc7------------------------------
; ------------------------------dseg:0xfcc------------------------------
gfx_jump_36_null proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_36_null endp
; ------------------------------dseg:0xfcc------------------------------
; ------------------------------dseg:0xfd1------------------------------
gfx_jump_37_null proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_37_null endp
; ------------------------------dseg:0xfd1------------------------------
; ------------------------------dseg:0xfd6------------------------------
gfx_jump_38_getPageBuf proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_38_getPageBuf endp
; ------------------------------dseg:0xfd6------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0xfe0------------------------------
gfx_jump_3a_getRowOffset proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_3a_getRowOffset endp
; ------------------------------dseg:0xfe0------------------------------
; ------------------------------dseg:0xfe5------------------------------
gfx_jump_3b_clearBuf proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_3b_clearBuf endp
; ------------------------------dseg:0xfe5------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0xfef------------------------------
_gfx_jump_3d_null proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_3d_null endp
; ------------------------------dseg:0xfef------------------------------
; ------------------------------dseg:0xff4------------------------------
gfx_jump_3e proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_3e endp
; ------------------------------dseg:0xff4------------------------------
; ------------------------------dseg:0xff9------------------------------
_gfx_jump_3f_modecode proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_3f_modecode endp
; ------------------------------dseg:0xff9------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0x1003------------------------------
gfx_jump_40 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_40 endp
; ------------------------------dseg:0x1003------------------------------
gfx_jump_41 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_41 endp
; ------------------------------dseg:0x1003------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0x1012------------------------------
_gfx_jump_44_setDac proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_44_setDac endp
; ------------------------------dseg:0x1012------------------------------
; ------------------------------dseg:0x1017------------------------------
_gfx_jump_45_retrace proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_45_retrace endp
; ------------------------------dseg:0x1017------------------------------
; ------------------------------dseg:0x101c------------------------------
_gfx_jump_46_retrace2 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_46_retrace2 endp
; ------------------------------dseg:0x101c------------------------------
; ------------------------------dseg:0x1021------------------------------
gfx_jump_47 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_47 endp
; ------------------------------dseg:0x1021------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0x102b------------------------------
gfx_jump_49 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_jump_49 endp
; ------------------------------dseg:0x102b------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0x1035------------------------------
_gfx_jump_4b_storeBufPtr proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_4b_storeBufPtr endp
; ------------------------------dseg:0x1035------------------------------
; ------------------------------dseg:0x103a------------------------------
_gfx_jump_4c proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_4c endp
; ------------------------------dseg:0x103a------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0x1049------------------------------
_gfx_jump_4f proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_4f endp
; ------------------------------dseg:0x1049------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0x1058------------------------------
_gfx_jump_52 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_jump_52 endp
; ------------------------------dseg:0x1058------------------------------
    db 0EAh, 4 dup(0)
    db 5 dup(0)
    db 5 dup(0)
    db 5 dup(0)
    db 5 dup(0)
    db 5 dup(0)
    db 5 dup(0)
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0x1085------------------------------
_misc_jump_5b_getkey proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_misc_jump_5b_getkey endp
; ------------------------------dseg:0x1085------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0x108f------------------------------
misc_jump_5d_readJoy proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
misc_jump_5d_readJoy endp
; ------------------------------dseg:0x108f------------------------------
    db 0EAh, 4 dup(0)
    db 0EAh, 4 dup(0)
    db 5 dup(0)
    db 5 dup(0)
    db 5 dup(0)
    db 5 dup(0)
; ------------------------------dseg:0x10b2------------------------------
_audio_jump_64 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_jump_64 endp
; ------------------------------dseg:0x10b2------------------------------
; ------------------------------dseg:0x10b7------------------------------
_audio_jump_65 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_jump_65 endp
; ------------------------------dseg:0x10b7------------------------------
; ------------------------------dseg:0x10bc------------------------------
audio_jump_66 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
audio_jump_66 endp
; ------------------------------dseg:0x10bc------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0x10c6------------------------------
audio_jump_68 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
audio_jump_68 endp
; ------------------------------dseg:0x10c6------------------------------
; ------------------------------dseg:0x10cb------------------------------
audio_jump_69 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
audio_jump_69 endp
; ------------------------------dseg:0x10cb------------------------------
; ------------------------------dseg:0x10d0------------------------------
audio_jump_6a proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
audio_jump_6a endp
; ------------------------------dseg:0x10d0------------------------------
; ------------------------------dseg:0x10d5------------------------------
audio_jump_6b proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
audio_jump_6b endp
; ------------------------------dseg:0x10d5------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------dseg:0x10df------------------------------
audio_jump_6d proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
audio_jump_6d endp
; ------------------------------dseg:0x10df------------------------------
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 2
    db 0
    db 2
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1
    db 0
    db 0
    db 0
    db 6Fh
    db 0
    db 0
    db 0
    db 3Fh
    db 1
word_339B0 dw 10EAh
byte_339B2 db 0
    db 0
unk_339B4 db 0
_word_339B4 equ unk_339B4
    db 1
    db 2
    db 3
    db 4
    db 0
    db 6
    db 7
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 0Fh
    db 1
    db 8
    db 0
    db 0
    db 3
    db 0
    db 8
    db 8
    db 9
    db 7
    db 7
    db 7
    db 0Dh
    db 7
    db 3
    db 0Ch
    db 0
    db 6
    db 0
    db 4
    db 0
    db 4
    db 6
    db 6
    db 0
    db 0Ch
    db 0Ch
    db 0Ch
    db 0Dh
    db 0Ch
    db 0Ch
    db 4
    db 3
    db 4
    db 4
    db 4
    db 4
    db 4
    db 4
    db 4
    db 4
    db 3
    db 4
    db 4
    db 4
    db 4
    db 4
word_339F4 dw 0FFFFh
    db 1
    db 0
    db 0
    db 0
    db 0FFh
    db 0FFh
    db 1
    db 0
    db 0
    db 0
    db 0FFh
    db 0FFh
    db 1
    db 0
    db 0
    db 0
    db 2
    db 0
    db 1
    db 0
    db 2
    db 0
    db 0
    db 0
    db 2
    db 0
    db 1
    db 0
    db 0
    db 0
    db 1
    db 0
    db 0
    db 0
    db 2
    db 0
    db 2
    db 0
    db 2
    db 0
    db 1
    db 0
    db 1
    db 0
    db 1
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 2
    db 0
    db 2
    db 0
    db 1
    db 0
    db 2
    db 0
    db 0
    db 0
    db 1
    db 0
    db 1
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1
    db 0
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 1
    db 0
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 1
    db 0
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 0FEh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0
    db 0
    db 0FEh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0
    db 0
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 0
    db 0
    db 0FEh
    db 0FFh
    db 2
    db 0
    db 0FFh
    db 0FFh
    db 1
    db 0
    db 0
    db 0
    db 0FEh
    db 0FFh
    db 2
    db 0
    db 0FFh
    db 0FFh
    db 1
    db 0
    db 0
    db 0
    db 0FEh
    db 0FFh
    db 2
    db 0
    db 0FFh
    db 0FFh
    db 1
    db 0
    db 0
    db 0
    db 2
    db 0
    db 1
    db 0
    db 2
    db 0
    db 0
    db 0
    db 2
    db 0
    db 1
    db 0
    db 0FFh
    db 0FFh
    db 2
    db 0
    db 0
    db 0
    db 1
    db 0
    db 0FEh
    db 0FFh
    db 2
    db 0
    db 0FFh
    db 0FFh
    db 1
    db 0
    db 0
    db 0
    db 2
    db 0
    db 2
    db 0
    db 2
    db 0
    db 2
    db 0
    db 2
    db 0
    db 1
    db 0
    db 1
    db 0
    db 1
    db 0
    db 1
    db 0
    db 1
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 2
    db 0
    db 2
    db 0
    db 1
    db 0
    db 2
    db 0
    db 0
    db 0
    db 1
    db 0
    db 2
    db 0
    db 0FFh
    db 0FFh
    db 1
    db 0
    db 0
    db 0
    db 2
    db 0
    db 0FEh
    db 0FFh
    db 1
    db 0
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 2
    db 0
    db 0FEh
    db 0FFh
    db 1
    db 0
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 2
    db 0
    db 0FEh
    db 0FFh
    db 1
    db 0
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 2
    db 0
    db 0FEh
    db 0FFh
    db 1
    db 0
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 0FEh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0
    db 0
    db 0FEh
    db 0FFh
    db 0FFh
    db 0FFh
    db 1
    db 0
    db 0FEh
    db 0FFh
    db 0
    db 0
    db 0FFh
    db 0FFh
    db 2
    db 0
    db 0FEh
    db 0FFh
    db 1
    db 0
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0
    db 0
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 1
    db 0
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 2
    db 0
    db 0FFh
    db 0FFh
    db 1
    db 0
    db 0
    db 0
    db 0
    db 0
word_33B74 dw 0FFFFh
    db 1
    db 0
    db 1
    db 0
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 1
    db 0
    db 0
    db 0
    db 0FFh
    db 0FFh
    db 0
    db 0
word_33B86 dw 1
    db 1
    db 0
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 1
    db 0
    db 0
    db 0
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0E0h
    db 0
    db 0F0h
word_33B9C dw 0
    db 0
    db 10h
    db 0
    db 20h
word_33BA2 dw 1
    db 1
    db 0
    db 1
    db 0
    db 1
    db 0
    db 1
    db 0
word_33BAC dw 0
word_33BAE dw 400h
    db 0
    db 1
    db 40h
    db 0
    db 10h
    db 0
    db 8
    db 0
_size3d3 dw 1
_buf3d3 dw 64h dup(0)
_size3d3_2 dw 0
_sign3dt dw 3131h
_sizes3dt dw 20h
    dw 20h
    dw 20h
    dw 20h
    dw 20h
_matrix3dt dw 0A0h dup(0)
_word_33DD0 dw 0
word_33DD2 dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
_size3d3_4 dw 0
_size3d3_5 dw 0
_size3d3_6 dw 0
_size3d3_3 dw 0
_sign3dg dw 3232h
_unk_33E1A db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 0
    db 1
    db 2
    db 3
    db 10h
    db 10h
    db 10h
    db 10h
    db 4
    db 5
    db 6
    db 7
    db 10h
    db 10h
    db 10h
    db 10h
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 11h
    db 11h
    db 11h
    db 11h
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 10h
    db 10h
    db 10h
    db 11h
    db 10h
    db 10h
    db 11h
    db 11h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 11h
    db 11h
    db 11h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 11h
    db 11h
    db 10h
    db 10h
    db 0
    db 1
    db 2
    db 3
    db 11h
    db 11h
    db 10h
    db 10h
    db 4
    db 5
    db 6
    db 7
    db 10h
    db 10h
    db 10h
    db 10h
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 10h
    db 10h
    db 10h
    db 10h
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 0
    db 1
    db 2
    db 3
    db 11h
    db 11h
    db 10h
    db 11h
    db 4
    db 5
    db 6
    db 7
    db 11h
    db 10h
    db 10h
    db 11h
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 11h
    db 11h
    db 10h
    db 10h
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 10h
    db 11h
    db 10h
    db 11h
    db 11h
    db 11h
    db 11h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 11h
    db 0
    db 1
    db 2
    db 3
    db 10h
    db 10h
    db 10h
    db 11h
    db 4
    db 5
    db 6
    db 7
    db 10h
    db 10h
    db 10h
    db 10h
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 10h
    db 10h
    db 10h
    db 10h
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 11h
    db 11h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 11h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 0
    db 1
    db 2
    db 3
    db 10h
    db 10h
    db 10h
    db 10h
    db 4
    db 5
    db 6
    db 7
    db 10h
    db 10h
    db 11h
    db 10h
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 11h
    db 11h
    db 11h
    db 11h
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 0
    db 1
    db 2
    db 3
    db 10h
    db 10h
    db 10h
    db 10h
    db 4
    db 5
    db 6
    db 7
    db 10h
    db 10h
    db 11h
    db 11h
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 10h
    db 10h
    db 11h
    db 11h
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 10h
    db 10h
    db 10h
    db 11h
    db 11h
    db 10h
    db 11h
    db 11h
    db 11h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 11h
    db 10h
    db 10h
    db 10h
    db 11h
    db 11h
    db 11h
    db 10h
    db 10h
    db 10h
    db 10h
    db 11h
    db 11h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 11h
    db 10h
    db 0
    db 1
    db 2
    db 3
    db 10h
    db 10h
    db 11h
    db 10h
    db 4
    db 5
    db 6
    db 7
    db 11h
    db 11h
    db 10h
    db 10h
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 10h
    db 10h
    db 10h
    db 10h
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 11h
    db 10h
    db 10h
    db 11h
    db 11h
    db 10h
    db 10h
    db 10h
    db 11h
    db 11h
    db 11h
    db 10h
    db 10h
    db 11h
    db 11h
    db 10h
    db 11h
    db 11h
    db 11h
    db 11h
    db 10h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 0
    db 1
    db 2
    db 3
    db 11h
    db 11h
    db 11h
    db 11h
    db 4
    db 5
    db 6
    db 7
    db 10h
    db 10h
    db 11h
    db 10h
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 10h
    db 10h
    db 11h
    db 11h
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 10h
    db 10h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 10h
    db 10h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 10h
_word_3401A dw 0
    db 0
    db 0
_a_3d3 db '.3D3',0
_aRb db 'rb',0
_aOpenErrorOn_3d3 db 'Open Error on *.3D3',0
_aBadObjFileFormat_ db 'Bad Obj file format.',0
_aObjectDataTooBig_ db 'Object data too big.',0
_aRb_0 db 'rb',0
_aPhoto_3d3 db 'photo.3d3',0
_aPleaseInsertF15DiskB db 'Please insert F15 Disk B',0
_aRb_1 db 'rb',0
_aPhoto_3d3_0 db 'photo.3d3',0
_aObjdataOverflow db 'ObjData overflow',0
_a_3dt db '.3dT',0
_aRb_2 db 'rb',0
_aOpenErrorOn_3dt db 'Open Error on *.3DT',0
_aBadTileFileFormat_ db 'Bad Tile file format.',0
_aTooManyTiles_ db 'Too many tiles.',0
_aTooMuchTileData db 'Too much tile data',0
_a_3dg db '.3dG',0
_aRb_3 db 'rb',0
aPleaseInsertScenarioD db 'Please insert scenario disk',0
_unk_34121 db 20h
    db 20h
aPressAKeyWhenReady db 'Press a key when ready',0
_aBadGridFileFormat_ db 'Bad Grid file format.',0
word_34150 dw 0
word_34152 dw 0
    db 0
    db 0
word_34156 dw 0
word_34158 dw 0
word_3415A dw 0
word_3415C dw 0
word_3415E dw 0
word_34160 dw 0
word_34162 dw 0
word_34164 dw 0
word_34166 dw 0
word_34168 dw 0
word_3416A dw 0
word_3416C dw 0
byte_3416E db 0
byte_3416F db 0
byte_34170 db 0
word_34171 dw 0
word_34173 dw 0
word_34175 dw 0
word_34177 dw 0
word_34179 dw 0
word_3417B dw 0
word_3417D dw 0
word_3417F dw 0
    db 0
    db 1
    db 0
    db 0
    db 0
word_34186 dw 3
    db 4
    db 0
    db 2
    db 0
    db 3
    db 0
    db 4
    db 0
word_34190 dw 0
word_34192 dw 0
word_34194 dw 0
byte_34196 db 3
_byte_34197 db 6
word_34198 dw 0
byte_3419A db 0
    db 0
byte_3419C db 0
_word_3419C equ byte_3419C
    db 1
    db 2
byte_3419F db 3
    db 4
    db 5
    db 6
    db 7
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 80h
    db 0
    db 0
    db 1
    db 0
    db 2
    db 0
    db 4
word_341B4 dw 800h
word_341B6 dw 1000h
word_341B8 dw 2000h
word_341BA dw 4000h
word_341BC dw 2710h
    db 10h
    db 27h
    db 10h
    db 27h
    db 10h
    db 27h
    db 10h
    db 27h
    db 10h
    db 27h
    db 10h
    db 27h
    db 10h
    db 27h
    db 0FFh
    db 0FFh
    db 0E9h
    db 0FFh
    db 0A5h
    db 0FFh
    db 4Ah
    db 0FFh
    db 95h
    db 0FEh
    db 2Bh
    db 0FDh
    db 56h
    db 0FAh
    db 0ACh
    db 0F4h
    db 2
    db 0
    db 2Ch
    db 0
    db 0ACh
    db 0
    db 58h
    db 1
    db 0ADh
    db 2
    db 58h
    db 5
    db 0B0h
    db 0Ah
    db 60h
    db 15h
    db 2
    db 0
    db 1Eh
    db 0
    db 75h
    db 0
    db 0E9h
    db 0
    db 0D1h
    db 1
    db 0A1h
    db 3
    db 41h
    db 7
    db 82h
    db 0Eh
    db 3
    db 0
    db 32h
    db 0
    db 0C5h
    db 0
    db 8Ah
    db 1
    db 12h
    db 3
    db 22h
    db 6
    db 43h
    db 0Ch
    db 86h
    db 18h
    db 2
    db 0
    db 1Ah
    db 0
    db 65h
    db 0
    db 0CAh
    db 0
    db 93h
    db 1
    db 25h
    db 3
    db 49h
    db 6
    db 91h
    db 0Ch
    db 4
    db 0
    db 53h
    db 0
    db 45h
    db 1
    db 8Ah
    db 2
    db 11h
    db 5
    db 1Eh
    db 0Ah
    db 3Bh
    db 14h
    db 76h
    db 28h
    db 2
    db 0
    db 1Fh
    db 0
    db 78h
    db 0
    db 0F0h
    db 0
    db 0DEh
    db 1
    db 0BBh
    db 3
    db 76h
    db 7
    db 0ECh
    db 0Eh
dword_3423C dd 0
word_34240 dw 0
word_34242 dw 0
word_34244 dw 0
word_34246 dw 0
word_34248 dw 0
word_3424A dw 0
word_3424C dw 0
word_3424E dw 0
word_34250 dw 0
word_34252 dw 0
word_34254 dw 0
word_34256 dw 0
byte_34258 db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_34260 dw 0
word_34262 dw 0
word_34264 dw 0
word_34266 dw 0
word_34268 dw 0
word_3426A dw 0
word_3426C dw 0
word_3426E dw 0
word_34270 dw 0
word_34272 dw 0
word_34274 dw 0
word_34276 dw 0
word_34278 dw 0
word_3427A dw 0
word_3427C dw 0
word_3427E dw 0
word_34280 dw 0
word_34282 dw 0
word_34284 dw 0
word_34286 dw 0
word_34288 dw 0
word_3428A dw 0
word_3428C dw 0
word_3428E dw 0
word_34290 dw 0
word_34292 dw 0
word_34294 dw 0
word_34296 dw 0
word_34298 dw 0
word_3429A dw 0
word_3429C dw 0
word_3429E dw 0
word_342A0 dw 0
word_342A2 dw 0
word_342A4 dw 0
word_342A6 dw 0
word_342A8 dw 0
word_342AA dw 0
word_342AC dw 0
word_342AE dw 0
word_342B0 dw 0
    db 0
    db 0
byte_342B4 db 0
    db 0
word_342B6 dw 0
word_342B8 dw 0
word_342BA dw 0
word_342BC dw 0
word_342BE dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_3449C dw 0
word_3449E dw 0
word_344A0 dw 0
word_344A2 dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_34680 dw 0
word_34682 dw 0
word_34684 dw 0
word_34686 dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
unk_34713 db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_34864 dw 0
word_34866 dw 0
word_34868 dw 0
word_3486A dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
dword_34A48 dd 0
word_34A4C dw 0
word_34A4E dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
unk_34A88 db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
dword_34C2C dd 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_35AF8 dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
_flt15_buf2 db 1040h dup(0)
word_36B7E dw 0
word_36B80 dw 0
word_36B82 dw 0
word_36B84 dw 0
_word_36B86 dw 0
byte_36B88 db 0
word_36B89 dw 0
word_36B8B dw 0
    db 0 ;align 2
    db 1
    db 0
    db 2
    db 0
    db 4
    db 0
    db 8
    db 0
    db 10h
    db 0
    db 20h
    db 0
    db 40h
    db 0
    db 80h
    db 0
    db 0
    db 1
    db 0
    db 2
    db 0
    db 4
    db 0
    db 8
    db 0
    db 10h
    db 0
    db 20h
    db 0
    db 40h
    db 0
    db 80h
byte_36BAE db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_36C10 dw 0
word_36C12 dw 0
word_36C14 dw 0
byte_36C16 db 0
byte_36C17 db 0
byte_36C18 db 0
word_36C19 dw 0
word_36C1B dw 0
word_36C1D dw 0
word_36C1F dw 0
word_36C21 dw 0
word_36C23 dw 0
word_36C25 dw 0
word_36C27 dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
byte_36C31 db 0
byte_36C32 db 0
word_36C33 dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 2Ah
    db 0
    db 2Ah
    db 0
    db 0
    db 2Ah
    db 2Ah
    db 2Ah
    db 0
    db 0
    db 2Ah
    db 0
    db 2Ah
    db 2Ah
    db 15h
    db 0
    db 2Ah
    db 2Ah
    db 2Ah
    db 15h
    db 15h
    db 15h
    db 15h
    db 15h
    db 3Fh
    db 15h
    db 3Fh
    db 15h
    db 15h
    db 3Fh
    db 3Fh
    db 3Fh
    db 15h
    db 15h
    db 3Fh
    db 15h
    db 3Fh
    db 3Fh
    db 3Fh
    db 15h
    db 3Fh
    db 3Fh
    db 3Fh
dacValues1 db 3 dup(0), 3 dup(4), 3 dup(8), 3 dup(0Ch), 3 dup(10h)
    db 3 dup(14h), 3 dup(18h), 3 dup(1Ch), 3 dup(20h), 3 dup(24h) ;f0/240 bytes of 80 rgb triplets
    db 3 dup(28h), 3 dup(2Ch), 3 dup(30h), 3 dup(34h), 3 dup(38h)
    db 3 dup(3Ch), 0, 3Fh, 2 dup(0), 38h, 2 dup(0), 31h, 2 dup(0)
    db 2Ah, 2 dup(0), 23h, 2 dup(0), 1Ch, 2 dup(0), 15h, 2 dup(0)
    db 0Eh, 0, 3Fh, 31h, 0, 39h, 2Ah, 0, 33h, 26h, 0, 2Dh
    db 20h, 0, 26h, 1Ch, 0, 20h, 17h, 0, 1Ah, 12h, 0, 14h
    db 0Eh, 0, 37h, 3Ah, 3Fh, 35h, 38h, 3Eh, 34h, 37h, 3Ch
    db 33h, 35h, 3Bh, 31h, 33h, 3Ah, 30h, 32h, 38h, 2Fh, 30h
    db 37h, 2Eh, 2Fh, 36h, 39h, 1Bh, 0, 32h, 17h, 0, 2Ch, 14h
    db 0, 25h, 11h, 0, 1Fh, 0Fh, 0, 19h, 0Ch, 0, 12h, 9, 0
    db 0Ch, 6, 0, 3Fh, 2 dup(0), 38h, 2 dup(0), 31h, 2 dup(0)
    db 2Bh, 2 dup(0), 24h, 2 dup(0), 1Dh, 2 dup(0), 17h, 2 dup(0)
    db 10h, 4 dup(0), 3Fh, 0, 1, 38h, 0, 1, 31h, 2 dup(0)
    db 2Ah, 2 dup(0), 23h, 2 dup(0), 1Ch, 2 dup(0), 15h, 2 dup(0)
    db 0Eh, 18h, 1Fh, 26h, 16h, 1Dh, 24h, 15h, 1Ch, 22h, 14h
    db 1Ah, 20h, 13h, 19h, 1Eh, 12h, 17h, 1Ch, 10h, 15h, 1Ah
    db 0Fh, 14h, 18h, 3Fh, 2Ch, 24h, 3Ah, 28h, 21h, 35h, 25h
    db 1Eh, 31h, 21h, 1Ch, 2Ch, 1Fh, 19h, 28h, 1Bh, 16h, 23h
    db 18h, 14h, 1Eh, 15h, 11h
dacValues db 34h
    db 34h
    db 34h
    db 31h
    db 33h
    db 34h
    db 2Eh
    db 32h
    db 35h
    db 2Bh
    db 32h
    db 36h
    db 28h
    db 31h
    db 37h
    db 25h
    db 30h
    db 37h
    db 22h
    db 30h
    db 38h
    db 1Eh
    db 2Fh
    db 39h
    db 1Bh
    db 2Eh
    db 3Ah
    db 17h
    db 2Dh
    db 3Ah
    db 14h
    db 2Ch
    db 3Bh
    db 10h
    db 2Bh
    db 3Ch
    db 0Ch
    db 2Ah
    db 3Dh
    db 8
    db 2Ah
    db 3Dh
    db 4
    db 28h
    db 3Eh
    db 0
    db 27h
    db 3Fh
byte_36D86 db 3 dup(34h), 2Fh, 33h, 2Fh, 2Ch, 32h, 2Bh, 27h, 31h
    db 27h, 24h, 30h, 23h, 20h, 2Fh, 20h, 1Dh, 2Fh, 1Ch, 19h
    db 2Eh, 18h, 16h, 2Dh, 15h, 12h, 2Ch, 11h, 0Fh, 2Bh, 0Eh
    db 0Ch, 2Ah, 0Bh, 9, 29h, 8, 6, 28h, 5, 4, 28h, 3, 1, 27h
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 2Ah
    db 0
    db 2Ah
    db 0
    db 0
    db 2Ah
    db 2Ah
    db 2Ah
    db 0
    db 0
    db 2Ah
    db 0
    db 2Ah
    db 2Ah
    db 15h
    db 0
    db 2Ah
    db 2Ah
    db 2Ah
    db 15h
    db 15h
    db 15h
    db 15h
    db 15h
    db 3Fh
    db 15h
    db 3Fh
    db 15h
    db 15h
    db 3Fh
    db 3Fh
    db 3Fh
    db 15h
    db 15h
    db 3Fh
    db 15h
    db 3Fh
    db 3Fh
    db 3Fh
    db 15h
    db 3Fh
    db 3Fh
    db 3Fh
    db 3
    db 3
    db 3
    db 5
    db 5
    db 2Ah
    db 5
    db 2Ah
    db 4
    db 5
    db 2Ah
    db 29h
    db 2Ah
    db 5
    db 5
    db 29h
    db 5
    db 2Ah
    db 2Ah
    db 17h
    db 5
    db 29h
    db 29h
    db 29h
    db 17h
    db 17h
    db 17h
    db 19h
    db 19h
    db 3Dh
    db 19h
    db 3Dh
    db 19h
    db 19h
    db 3Dh
    db 3Ch
    db 3Dh
    db 18h
    db 18h
    db 3Dh
    db 19h
    db 3Dh
    db 3Dh
    db 3Ch
    db 18h
    db 3Bh
    db 3Bh
    db 3Bh
    db 6
    db 6
    db 6
    db 9
    db 0Ah
    db 2Ah
    db 9
    db 2Ah
    db 9
    db 9
    db 2Ah
    db 29h
    db 2Ah
    db 9
    db 9
    db 29h
    db 0Ah
    db 2Ah
    db 2Ah
    db 1Ah
    db 0Ah
    db 27h
    db 27h
    db 27h
    db 19h
    db 19h
    db 19h
    db 1Ch
    db 1Dh
    db 3Bh
    db 1Dh
    db 3Bh
    db 1Ch
    db 1Ch
    db 3Bh
    db 3Ah
    db 3Bh
    db 1Ch
    db 1Ch
    db 3Bh
    db 1Dh
    db 3Bh
    db 3Bh
    db 3Ah
    db 1Ch
    db 37h
    db 37h
    db 37h
    db 9
    db 9
    db 9
    db 0Eh
    db 0Eh
    db 2Ah
    db 0Eh
    db 2Ah
    db 0Dh
    db 0Eh
    db 2Ah
    db 29h
    db 2Ah
    db 0Eh
    db 0Eh
    db 29h
    db 0Fh
    db 2Ah
    db 2Ah
    db 1Dh
    db 10h
    db 26h
    db 26h
    db 26h
    db 1Ah
    db 1Ah
    db 1Ah
    db 1Fh
    db 1Fh
    db 39h
    db 20h
    db 3Ah
    db 20h
    db 1Fh
    db 39h
    db 38h
    db 3Ah
    db 1Fh
    db 1Fh
    db 3Ah
    db 20h
    db 3Ah
    db 39h
    db 38h
    db 1Eh
    db 32h
    db 32h
    db 32h
    db 0Ch
    db 0Ch
    db 0Ch
    db 12h
    db 13h
    db 2Ah
    db 12h
    db 2Ah
    db 11h
    db 12h
    db 2Ah
    db 29h
    db 2Ah
    db 12h
    db 12h
    db 29h
    db 14h
    db 2Ah
    db 2Ah
    db 1Fh
    db 15h
    db 25h
    db 25h
    db 25h
    db 1Ch
    db 1Ch
    db 1Ch
    db 22h
    db 22h
    db 37h
    db 23h
    db 38h
    db 23h
    db 22h
    db 37h
    db 36h
    db 38h
    db 21h
    db 21h
    db 38h
    db 24h
    db 38h
    db 37h
    db 36h
    db 21h
    db 2Fh
    db 2Fh
    db 2Fh
    db 0Fh
    db 0Fh
    db 0Fh
    db 17h
    db 17h
    db 2Ah
    db 16h
    db 2Ah
    db 16h
    db 17h
    db 2Ah
    db 29h
    db 2Ah
    db 17h
    db 17h
    db 2Ah
    db 19h
    db 2Ah
    db 2Ah
    db 22h
    db 1Ah
    db 24h
    db 24h
    db 24h
    db 1Eh
    db 1Eh
    db 1Eh
    db 24h
    db 25h
    db 35h
    db 26h
    db 36h
    db 25h
    db 24h
    db 35h
    db 34h
    db 36h
    db 24h
    db 24h
    db 36h
    db 27h
    db 36h
    db 35h
    db 34h
    db 23h
    db 2Ah
    db 2Ah
    db 2Ah
    db 11h
    db 11h
    db 11h
    db 1Ch
    db 1Ch
    db 2Ah
    db 1Ah
    db 2Ah
    db 1Ah
    db 1Ch
    db 2Ah
    db 29h
    db 2Ah
    db 1Ch
    db 1Ch
    db 2Ah
    db 1Eh
    db 2Ah
    db 2Ah
    db 24h
    db 1Fh
    db 23h
    db 23h
    db 23h
    db 20h
    db 20h
    db 20h
    db 27h
    db 27h
    db 34h
    db 28h
    db 34h
    db 28h
    db 27h
    db 32h
    db 32h
    db 34h
    db 27h
    db 27h
    db 34h
    db 29h
    db 34h
    db 32h
    db 32h
    db 25h
    db 26h
    db 26h
    db 26h
    db 14h
    db 14h
    db 14h
    db 20h
    db 20h
    db 2Ah
    db 1Fh
    db 2Ah
    db 1Fh
    db 20h
    db 2Ah
    db 29h
    db 2Ah
    db 20h
    db 20h
    db 2Ah
    db 23h
    db 2Ah
    db 2Ah
    db 27h
    db 24h
    db 22h
    db 22h
    db 22h
    db 22h
    db 22h
    db 22h
    db 29h
    db 29h
    db 32h
    db 2Ah
    db 32h
    db 2Ah
    db 29h
    db 30h
    db 30h
    db 32h
    db 29h
    db 29h
    db 32h
    db 2Ch
    db 32h
    db 30h
    db 30h
    db 27h
    db 22h
    db 22h
    db 22h
otherDacValues db 1Fh, 10h, 1Eh, 1Dh, 0Fh, 1Eh, 1Bh, 0Fh, 1Dh, 19h, 0Eh
    db 1Ch, 17h, 0Dh, 1Bh, 15h, 0Dh, 1Ah, 13h, 0Ch, 19h, 11h ;1e0/480 bytes of 160 rgb triplets
    db 0Ch, 18h, 0Fh, 0Bh, 17h, 0Dh, 0Bh, 16h, 0Ch, 0Ah, 15h
    db 2 dup(0Ah), 14h, 9, 0Ah, 13h, 9, 0Ah, 12h, 8, 0Ah, 12h
    db 8, 0Bh, 11h, 6, 4, 1, 6, 4, 1, 7, 5, 2, 8, 6, 2, 9
    db 7, 3, 0Ah, 7, 3, 0Bh, 8, 4, 0Ch, 9, 5, 0Dh, 0Ah, 6
    db 0Dh, 0Bh, 7, 0Eh, 0Ch, 8, 0Fh, 0Dh, 8, 10h, 0Eh, 9
    db 11h, 0Fh, 0Ah, 12h, 10h, 0Ch, 13h, 11h, 0Dh, 5 dup(0)
    db 1Eh, 0, 20h, 2 dup(0), 20h, 1Fh, 1Eh, 2 dup(0), 20h
    db 0, 20h, 1Eh, 0Fh, 0, 3 dup(1Eh), 13h, 19h, 1Eh, 10h
    db 11h, 30h, 0Eh, 28h, 0Eh, 10h, 3 dup(30h), 2 dup(10h)
    db 2Ah, 2 dup(0), 2 dup(30h), 10h, 3 dup(39h), 3 dup(3)
    db 2 dup(4), 1Eh, 4, 20h, 3, 4, 20h, 1Fh, 20h, 2 dup(4)
    db 1Dh, 3, 2 dup(1Eh), 10h, 3, 3 dup(1Ch), 11h, 18h, 1Ch
    db 11h, 12h, 2Ah, 11h, 28h, 10h, 13h, 2Fh, 2Dh, 2Fh, 2 dup(12h)
    db 2Ah, 2 dup(0), 2Fh, 2Dh, 12h, 3 dup(34h), 4 dup(6)
    db 8, 1Ch, 7, 1Eh, 2 dup(6), 1Eh, 1Dh, 1Eh, 2 dup(6), 1Ah
    db 6, 1Ah, 1Eh, 12h, 7, 3 dup(1Ah), 10h, 16h, 1Ah, 14h
    db 15h, 2Ah, 13h, 26h, 12h, 15h, 2Ch, 2Bh, 2Ch, 2 dup(15h)
    db 2Ah, 2 dup(0), 2Ch, 2Bh, 15h, 3 dup(32h), 4 dup(9)
    db 0Ah, 1Ch, 9, 1Ch, 9, 0Ah, 1Eh, 1Dh, 1Eh, 2 dup(0Ah)
    db 19h, 9, 1Ah, 1Ch, 13h, 0Bh, 3 dup(1Ch), 0Fh, 14h, 18h
    db 2 dup(17h), 2Ah, 15h, 26h, 15h, 18h, 2Ch, 2Bh, 2Ch
    db 2 dup(17h), 2Ah, 2 dup(0), 2 dup(2Ah), 16h, 3 dup(2Ch)
    db 4 dup(0Ch), 0Dh, 1Ch, 0Dh, 1Ch, 2 dup(0Ch), 3 dup(1Ch)
    db 2 dup(0Ch), 19h, 0Ch, 1Ah, 1Ch, 15h, 0Eh, 3 dup(1Ah)
    db 0Eh, 12h, 16h, 2 dup(19h), 28h, 17h, 24h, 17h, 1Ah
    db 2Ah, 29h, 2Ah, 2 dup(19h), 2Ah, 2 dup(0), 2Ah, 29h
    db 19h, 3 dup(26h), 3 dup(0Fh), 2 dup(0Eh), 1Ah, 0Eh, 1Ah
    db 2 dup(0Eh), 1Ah, 19h, 1Ah, 2 dup(0Fh), 1Ah, 0Fh, 2 dup(1Ah)
    db 15h, 10h, 3 dup(1Ah), 0Ch, 11h, 14h, 19h, 1Ah, 24h
    db 1Ah, 24h, 19h, 1Dh, 2Ah, 29h, 28h, 2 dup(1Bh), 2Ah
    db 2 dup(0), 2Ah, 29h, 1Ch, 3 dup(26h), 3 dup(11h), 2 dup(0Fh)
    db 16h, 0Eh, 16h, 0Eh, 0Fh, 2 dup(16h), 1Ah, 2 dup(11h)
    db 18h, 11h, 2 dup(18h), 14h, 11h, 3 dup(18h), 0Ch, 11h
    db 14h, 2 dup(1Eh), 28h, 19h, 20h, 18h, 20h, 3 dup(28h)
    db 2 dup(1Eh), 2Ah, 2 dup(0), 2 dup(28h), 1Eh, 3 dup(22h)
    db 3 dup(14h), 2 dup(12h), 18h, 12h, 18h, 12h, 11h, 16h
    db 15h, 16h, 2 dup(11h), 16h, 12h, 2 dup(16h), 14h, 13h
    db 3 dup(16h), 0Bh, 0Fh, 12h, 1Fh, 20h, 26h, 19h, 1Eh
    db 19h, 20h, 2 dup(26h), 20h, 2 dup(1Ah), 2Ah, 2 dup(0)
    db 2 dup(26h), 1Fh, 3 dup(1Eh)
byte_37116 db 3 dup(34h), 33h, 31h, 2Fh, 32h, 2Fh, 2Ch, 32h, 2Dh
    db 28h, 31h, 2Ah, 24h, 30h, 28h, 20h, 30h, 26h, 1Dh, 2Fh
    db 24h, 19h, 2Eh, 22h, 16h, 2Eh, 20h, 12h, 2Dh, 1Eh, 0Fh
    db 2Ch, 1Ch, 0Ch, 2Ch, 1Ah, 9, 2Bh, 18h, 6, 2Ah, 16h, 3
    db 2Ah, 15h, 0
word_37146 dw 0
word_37148 dw 324h
    db 48h
    db 6
    db 6Bh
    db 9
    db 8Ch
    db 0Ch
    db 0ABh
    db 0Fh
    db 0C8h
    db 12h
    db 0E2h
    db 15h
    db 0F9h
    db 18h
    db 0Ch
    db 1Ch
    db 1Ah
    db 1Fh
    db 24h
    db 22h
    db 28h
    db 25h
    db 27h
    db 28h
    db 1Fh
    db 2Bh
    db 11h
    db 2Eh
    db 0FCh
    db 30h
    db 0DFh
    db 33h
    db 0BAh
    db 36h
    db 8Dh
    db 39h
    db 57h
    db 3Ch
    db 17h
    db 3Fh
    db 0CEh
    db 41h
    db 7Bh
    db 44h
    db 1Dh
    db 47h
    db 0B4h
    db 49h
    db 40h
    db 4Ch
    db 0C0h
    db 4Eh
    db 34h
    db 51h
    db 9Bh
    db 53h
    db 0F6h
    db 55h
    db 43h
    db 58h
    db 82h
    db 5Ah
    db 0B4h
    db 5Ch
    db 0D7h
    db 5Eh
    db 0ECh
    db 60h
    db 0F2h
    db 62h
    db 0E9h
    db 64h
    db 0D0h
    db 66h
    db 0A7h
    db 68h
    db 6Eh
    db 6Ah
    db 24h
    db 6Ch
    db 0CAh
    db 6Dh
    db 5Fh
    db 6Fh
    db 0E3h
    db 70h
    db 55h
    db 72h
    db 0B6h
    db 73h
    db 5
    db 75h
    db 42h
    db 76h
    db 6Ch
    db 77h
    db 85h
    db 78h
    db 8Ah
    db 79h
    db 7Dh
    db 7Ah
    db 5Dh
    db 7Bh
    db 2Ah
    db 7Ch
    db 0E4h
    db 7Ch
    db 8Ah
    db 7Dh
    db 1Eh
    db 7Eh
    db 9Dh
    db 7Eh
    db 0Ah
    db 7Fh
    db 62h
    db 7Fh
    db 0A7h
    db 7Fh
    db 0D9h
    db 7Fh
    db 0F6h
    db 7Fh
    db 0FFh
    db 7Fh
    db 0F6h
    db 7Fh
    db 0D9h
    db 7Fh
    db 0A7h
    db 7Fh
    db 62h
    db 7Fh
    db 0Ah
    db 7Fh
    db 9Dh
    db 7Eh
    db 1Eh
    db 7Eh
    db 8Ah
    db 7Dh
    db 0E4h
    db 7Ch
    db 2Ah
    db 7Ch
    db 5Dh
    db 7Bh
    db 7Dh
    db 7Ah
    db 8Ah
    db 79h
    db 85h
    db 78h
    db 6Ch
    db 77h
    db 42h
    db 76h
    db 5
    db 75h
    db 0B6h
    db 73h
    db 55h
    db 72h
    db 0E3h
    db 70h
    db 5Fh
    db 6Fh
    db 0CAh
    db 6Dh
    db 24h
    db 6Ch
    db 6Eh
    db 6Ah
    db 0A7h
    db 68h
    db 0D0h
    db 66h
    db 0E9h
    db 64h
    db 0F2h
    db 62h
    db 0ECh
    db 60h
    db 0D7h
    db 5Eh
    db 0B4h
    db 5Ch
    db 82h
    db 5Ah
    db 43h
    db 58h
    db 0F6h
    db 55h
    db 9Bh
    db 53h
    db 34h
    db 51h
    db 0C0h
    db 4Eh
    db 40h
    db 4Ch
    db 0B4h
    db 49h
    db 1Dh
    db 47h
    db 7Bh
    db 44h
    db 0CEh
    db 41h
    db 17h
    db 3Fh
    db 57h
    db 3Ch
    db 8Dh
    db 39h
    db 0BAh
    db 36h
    db 0DFh
    db 33h
    db 0FCh
    db 30h
    db 11h
    db 2Eh
    db 1Fh
    db 2Bh
    db 27h
    db 28h
    db 28h
    db 25h
    db 24h
    db 22h
    db 1Ah
    db 1Fh
    db 0Ch
    db 1Ch
    db 0F9h
    db 18h
    db 0E2h
    db 15h
    db 0C8h
    db 12h
    db 0ABh
    db 0Fh
    db 8Ch
    db 0Ch
    db 6Bh
    db 9
    db 48h
    db 6
    db 24h
    db 3
    db 0
    db 0
    db 0DCh
    db 0FCh
    db 0B8h
    db 0F9h
    db 95h
    db 0F6h
    db 74h
    db 0F3h
    db 55h
    db 0F0h
    db 38h
    db 0EDh
    db 1Eh
    db 0EAh
    db 7
    db 0E7h
    db 0F4h
    db 0E3h
    db 0E6h
    db 0E0h
    db 0DCh
    db 0DDh
    db 0D8h
    db 0DAh
    db 0D9h
    db 0D7h
    db 0E1h
    db 0D4h
    db 0EFh
    db 0D1h
    db 4
    db 0CFh
    db 21h
    db 0CCh
    db 46h
    db 0C9h
    db 73h
    db 0C6h
    db 0A9h
    db 0C3h
    db 0E9h
    db 0C0h
    db 32h
    db 0BEh
    db 85h
    db 0BBh
    db 0E3h
    db 0B8h
    db 4Ch
    db 0B6h
    db 0C0h
    db 0B3h
    db 40h
    db 0B1h
    db 0CCh
    db 0AEh
    db 65h
    db 0ACh
    db 0Ah
    db 0AAh
    db 0BDh
    db 0A7h
    db 7Eh
    db 0A5h
    db 4Ch
    db 0A3h
    db 29h
    db 0A1h
    db 14h
    db 9Fh
    db 0Eh
    db 9Dh
    db 17h
    db 9Bh
    db 30h
    db 99h
    db 59h
    db 97h
    db 92h
    db 95h
    db 0DCh
    db 93h
    db 36h
    db 92h
    db 0A1h
    db 90h
    db 1Dh
    db 8Fh
    db 0ABh
    db 8Dh
    db 4Ah
    db 8Ch
    db 0FBh
    db 8Ah
    db 0BEh
    db 89h
    db 94h
    db 88h
    db 7Bh
    db 87h
    db 76h
    db 86h
    db 83h
    db 85h
    db 0A3h
    db 84h
    db 0D6h
    db 83h
    db 1Ch
    db 83h
    db 76h
    db 82h
    db 0E2h
    db 81h
    db 63h
    db 81h
    db 0F6h
    db 80h
    db 9Eh
    db 80h
    db 59h
    db 80h
    db 27h
    db 80h
    db 0Ah
    db 80h
    db 1
    db 80h
    db 0Ah
    db 80h
    db 27h
    db 80h
    db 59h
    db 80h
    db 9Eh
    db 80h
    db 0F6h
    db 80h
    db 63h
    db 81h
    db 0E2h
    db 81h
    db 76h
    db 82h
    db 1Ch
    db 83h
    db 0D6h
    db 83h
    db 0A3h
    db 84h
    db 83h
    db 85h
    db 76h
    db 86h
    db 7Bh
    db 87h
    db 94h
    db 88h
    db 0BEh
    db 89h
    db 0FBh
    db 8Ah
    db 4Ah
    db 8Ch
    db 0ABh
    db 8Dh
    db 1Dh
    db 8Fh
    db 0A1h
    db 90h
    db 36h
    db 92h
    db 0DCh
    db 93h
    db 92h
    db 95h
    db 59h
    db 97h
    db 30h
    db 99h
    db 17h
    db 9Bh
    db 0Eh
    db 9Dh
    db 14h
    db 9Fh
    db 29h
    db 0A1h
    db 4Ch
    db 0A3h
    db 7Eh
    db 0A5h
    db 0BDh
    db 0A7h
    db 0Ah
    db 0AAh
    db 65h
    db 0ACh
    db 0CCh
    db 0AEh
    db 40h
    db 0B1h
    db 0C0h
    db 0B3h
    db 4Ch
    db 0B6h
    db 0E3h
    db 0B8h
    db 85h
    db 0BBh
    db 32h
    db 0BEh
    db 0E9h
    db 0C0h
    db 0A9h
    db 0C3h
    db 73h
    db 0C6h
    db 46h
    db 0C9h
    db 21h
    db 0CCh
    db 4
    db 0CFh
    db 0EFh
    db 0D1h
    db 0E1h
    db 0D4h
    db 0D9h
    db 0D7h
    db 0D8h
    db 0DAh
    db 0DCh
    db 0DDh
    db 0E6h
    db 0E0h
    db 0F4h
    db 0E3h
    db 7
    db 0E7h
    db 1Eh
    db 0EAh
    db 38h
    db 0EDh
    db 55h
    db 0F0h
    db 74h
    db 0F3h
    db 95h
    db 0F6h
    db 0B8h
    db 0F9h
    db 0DCh
    db 0FCh
    db 0
    db 0
word_37348 dw 0
word_3734A dw 324h
    db 48h
    db 6
    db 6Bh
    db 9
    db 8Ch
    db 0Ch
    db 0ABh
    db 0Fh
    db 0C8h
    db 12h
    db 0E2h
    db 15h
    db 0F9h
    db 18h
    db 0Ch
    db 1Ch
    db 1Ah
    db 1Fh
    db 24h
    db 22h
    db 28h
    db 25h
    db 27h
    db 28h
    db 1Fh
    db 2Bh
    db 11h
    db 2Eh
    db 0FCh
    db 30h
    db 0DFh
    db 33h
    db 0BAh
    db 36h
    db 8Dh
    db 39h
    db 57h
    db 3Ch
    db 17h
    db 3Fh
    db 0CEh
    db 41h
    db 7Bh
    db 44h
    db 1Dh
    db 47h
    db 0B4h
    db 49h
    db 40h
    db 4Ch
    db 0C0h
    db 4Eh
    db 34h
    db 51h
    db 9Bh
    db 53h
    db 0F6h
    db 55h
    db 43h
    db 58h
    db 82h
    db 5Ah
    db 0B4h
    db 5Ch
    db 0D7h
    db 5Eh
    db 0ECh
    db 60h
    db 0F2h
    db 62h
    db 0E9h
    db 64h
    db 0D0h
    db 66h
    db 0A7h
    db 68h
    db 6Eh
    db 6Ah
    db 24h
    db 6Ch
    db 0CAh
    db 6Dh
    db 5Fh
    db 6Fh
    db 0E3h
    db 70h
    db 55h
    db 72h
    db 0B6h
    db 73h
    db 5
    db 75h
    db 42h
    db 76h
    db 6Ch
    db 77h
    db 85h
    db 78h
    db 8Ah
    db 79h
    db 7Dh
    db 7Ah
    db 5Dh
    db 7Bh
    db 2Ah
    db 7Ch
    db 0E4h
    db 7Ch
    db 8Ah
    db 7Dh
    db 1Eh
    db 7Eh
    db 9Dh
    db 7Eh
    db 0Ah
    db 7Fh
    db 62h
    db 7Fh
    db 0A7h
    db 7Fh
    db 0D9h
    db 7Fh
    db 0F6h
    db 7Fh
    db 0FFh
    db 7Fh
    db 0F6h
    db 7Fh
    db 0D9h
    db 7Fh
    db 0A7h
    db 7Fh
    db 62h
    db 7Fh
    db 0Ah
    db 7Fh
    db 9Dh
    db 7Eh
    db 1Eh
    db 7Eh
    db 8Ah
    db 7Dh
    db 0E4h
    db 7Ch
    db 2Ah
    db 7Ch
    db 5Dh
    db 7Bh
    db 7Dh
    db 7Ah
    db 8Ah
    db 79h
    db 85h
    db 78h
    db 6Ch
    db 77h
    db 42h
    db 76h
    db 5
    db 75h
    db 0B6h
    db 73h
    db 55h
    db 72h
    db 0E3h
    db 70h
    db 5Fh
    db 6Fh
    db 0CAh
    db 6Dh
    db 24h
    db 6Ch
    db 6Eh
    db 6Ah
    db 0A7h
    db 68h
    db 0D0h
    db 66h
    db 0E9h
    db 64h
    db 0F2h
    db 62h
    db 0ECh
    db 60h
    db 0D7h
    db 5Eh
    db 0B4h
    db 5Ch
    db 82h
    db 5Ah
    db 43h
    db 58h
    db 0F6h
    db 55h
    db 9Bh
    db 53h
    db 34h
    db 51h
    db 0C0h
    db 4Eh
    db 40h
    db 4Ch
    db 0B4h
    db 49h
    db 1Dh
    db 47h
    db 7Bh
    db 44h
    db 0CEh
    db 41h
    db 17h
    db 3Fh
    db 57h
    db 3Ch
    db 8Dh
    db 39h
    db 0BAh
    db 36h
    db 0DFh
    db 33h
    db 0FCh
    db 30h
    db 11h
    db 2Eh
    db 1Fh
    db 2Bh
    db 27h
    db 28h
    db 28h
    db 25h
    db 24h
    db 22h
    db 1Ah
    db 1Fh
    db 0Ch
    db 1Ch
    db 0F9h
    db 18h
    db 0E2h
    db 15h
    db 0C8h
    db 12h
    db 0ABh
    db 0Fh
    db 8Ch
    db 0Ch
    db 6Bh
    db 9
    db 48h
    db 6
    db 24h
    db 3
    db 0
    db 0
    db 0DCh
    db 0FCh
    db 0B8h
    db 0F9h
    db 95h
    db 0F6h
    db 74h
    db 0F3h
    db 55h
    db 0F0h
    db 38h
    db 0EDh
    db 1Eh
    db 0EAh
    db 7
    db 0E7h
    db 0F4h
    db 0E3h
    db 0E6h
    db 0E0h
    db 0DCh
    db 0DDh
    db 0D8h
    db 0DAh
    db 0D9h
    db 0D7h
    db 0E1h
    db 0D4h
    db 0EFh
    db 0D1h
    db 4
    db 0CFh
    db 21h
    db 0CCh
    db 46h
    db 0C9h
    db 73h
    db 0C6h
    db 0A9h
    db 0C3h
    db 0E9h
    db 0C0h
    db 32h
    db 0BEh
    db 85h
    db 0BBh
    db 0E3h
    db 0B8h
    db 4Ch
    db 0B6h
    db 0C0h
    db 0B3h
    db 40h
    db 0B1h
    db 0CCh
    db 0AEh
    db 65h
    db 0ACh
    db 0Ah
    db 0AAh
    db 0BDh
    db 0A7h
    db 7Eh
    db 0A5h
    db 4Ch
    db 0A3h
    db 29h
    db 0A1h
    db 14h
    db 9Fh
    db 0Eh
    db 9Dh
    db 17h
    db 9Bh
    db 30h
    db 99h
    db 59h
    db 97h
    db 92h
    db 95h
    db 0DCh
    db 93h
    db 36h
    db 92h
    db 0A1h
    db 90h
    db 1Dh
    db 8Fh
    db 0ABh
    db 8Dh
    db 4Ah
    db 8Ch
    db 0FBh
    db 8Ah
    db 0BEh
    db 89h
    db 94h
    db 88h
    db 7Bh
    db 87h
    db 76h
    db 86h
    db 83h
    db 85h
    db 0A3h
    db 84h
    db 0D6h
    db 83h
    db 1Ch
    db 83h
    db 76h
    db 82h
    db 0E2h
    db 81h
    db 63h
    db 81h
    db 0F6h
    db 80h
    db 9Eh
    db 80h
    db 59h
    db 80h
    db 27h
    db 80h
    db 0Ah
    db 80h
    db 1
    db 80h
    db 0Ah
    db 80h
    db 27h
    db 80h
    db 59h
    db 80h
    db 9Eh
    db 80h
    db 0F6h
    db 80h
    db 63h
    db 81h
    db 0E2h
    db 81h
    db 76h
    db 82h
    db 1Ch
    db 83h
    db 0D6h
    db 83h
    db 0A3h
    db 84h
    db 83h
    db 85h
    db 76h
    db 86h
    db 7Bh
    db 87h
    db 94h
    db 88h
    db 0BEh
    db 89h
    db 0FBh
    db 8Ah
    db 4Ah
    db 8Ch
    db 0ABh
    db 8Dh
    db 1Dh
    db 8Fh
    db 0A1h
    db 90h
    db 36h
    db 92h
    db 0DCh
    db 93h
    db 92h
    db 95h
    db 59h
    db 97h
    db 30h
    db 99h
    db 17h
    db 9Bh
    db 0Eh
    db 9Dh
    db 14h
    db 9Fh
    db 29h
    db 0A1h
    db 4Ch
    db 0A3h
    db 7Eh
    db 0A5h
    db 0BDh
    db 0A7h
    db 0Ah
    db 0AAh
    db 65h
    db 0ACh
    db 0CCh
    db 0AEh
    db 40h
    db 0B1h
    db 0C0h
    db 0B3h
    db 4Ch
    db 0B6h
    db 0E3h
    db 0B8h
    db 85h
    db 0BBh
    db 32h
    db 0BEh
    db 0E9h
    db 0C0h
    db 0A9h
    db 0C3h
    db 73h
    db 0C6h
    db 46h
    db 0C9h
    db 21h
    db 0CCh
    db 4
    db 0CFh
    db 0EFh
    db 0D1h
    db 0E1h
    db 0D4h
    db 0D9h
    db 0D7h
    db 0D8h
    db 0DAh
    db 0DCh
    db 0DDh
    db 0E6h
    db 0E0h
    db 0F4h
    db 0E3h
    db 7
    db 0E7h
    db 1Eh
    db 0EAh
    db 38h
    db 0EDh
    db 55h
    db 0F0h
    db 74h
    db 0F3h
    db 95h
    db 0F6h
    db 0B8h
    db 0F9h
    db 0DCh
    db 0FCh
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
byte_3754E db 0
word_3754F dw 0
word_37551 dw 0
word_37553 dw 0
word_37555 dw 0
word_37557 dw 13Fh
word_37559 dw 6Fh
    db 0
    db 0
_word_3755D dw 0
_word_3755F dw 0
_word_37561 dw 0
_word_37563 dw 0
unk_37565 db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
unk_3771D db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_378D5 dw 0
word_378D7 dw 0
word_378D9 dw 0FFFFh
word_378DB dw 0
    db 0 ;align 2
byte_378DE db 0
word_378DF dw 0
word_378E1 dw 0
word_378E3 dw 0
word_378E5 dw 0
    db 0
cbreakHit db 0
origCBreakSeg dw 0
origCBreakOfs dw 0
    db 0 ;align 2
byte_378EE db 0
timerHandlerInstalled db 0
word_378F0 dw 0
word_378F2 dw 0
word_378F4 dw 0
word_378F6 dw 0
word_378F8 dw 0
word_378FA dw 0
byte_378FC db 0
word_378FD dw 0
word_378FF dw 0
word_37901 dw 0
byte_37903 db 0
word_37904 dw 0
word_37906 dw 0
    db 0
    db 0
word_3790A dw 0
_byte_3790C db 0
    db 0
    db 0
    db 0A0h
    db 1
    db 0
    db 0
    db 0
    db 0Fh
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 5Eh
    db 50h
    db 2
    db 0
    db 2
    db 0
    db 2
    db 0
    db 2
    db 0
    db 2
    db 0
    db 1
    db 0
    db 1
    db 0
    db 1
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FBh
    db 0FFh
    db 0FBh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F8h
    db 0FFh
    db 0F8h
    db 0FFh
    db 0F8h
    db 0FFh
    db 0F7h
    db 0FFh
    db 0F7h
    db 0FFh
    db 0F7h
    db 0FFh
    db 0F7h
    db 0FFh
    db 0F7h
    db 0FFh
    db 0F7h
    db 0FFh
    db 0F7h
    db 0FFh
    db 0F7h
    db 0FFh
    db 0F7h
    db 0FFh
    db 0F8h
    db 0FFh
    db 0F8h
    db 0FFh
    db 0F8h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FBh
    db 0FFh
    db 0FBh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1
    db 0
    db 1
    db 0
    db 1
    db 0
    db 2
    db 0
    db 2
    db 0
    db 2
    db 0
    db 2
    db 0
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FBh
    db 0FFh
    db 0FBh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FBh
    db 0FFh
    db 0FBh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1
    db 0
    db 1
    db 0
    db 2
    db 0
    db 2
    db 0
    db 3
    db 0
    db 3
    db 0
    db 3
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 3
    db 0
    db 3
    db 0
    db 3
    db 0
    db 2
    db 0
    db 2
    db 0
    db 1
    db 0
    db 1
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FBh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F8h
    db 0FFh
    db 0F8h
    db 0FFh
    db 0F7h
    db 0FFh
    db 0F7h
    db 0FFh
    db 0F6h
    db 0FFh
    db 0F6h
    db 0FFh
    db 0F6h
    db 0FFh
    db 0F5h
    db 0FFh
    db 0F5h
    db 0FFh
    db 0F5h
    db 0FFh
    db 0F5h
    db 0FFh
    db 0F5h
    db 0FFh
    db 0F5h
    db 0FFh
    db 0F5h
    db 0FFh
    db 0F5h
    db 0FFh
    db 0F5h
    db 0FFh
    db 0F6h
    db 0FFh
    db 0F6h
    db 0FFh
    db 0F6h
    db 0FFh
    db 0F7h
    db 0FFh
    db 0F7h
    db 0FFh
    db 0F8h
    db 0FFh
    db 0F8h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FBh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0FFh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FBh
    db 0FFh
    db 0FBh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0F9h
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FAh
    db 0FFh
    db 0FBh
    db 0FFh
    db 0FBh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FCh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FDh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FFh
    db 0FFh
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1
    db 0
    db 1
    db 0
    db 2
    db 0
    db 2
    db 0
    db 3
    db 0
    db 3
    db 0
    db 3
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 4
    db 0
    db 3
    db 0
    db 3
    db 0
    db 3
    db 0
    db 2
    db 0
    db 2
    db 0
    db 1
    db 0
    db 1
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_37B26 dw 0
    db 2
    db 0
    db 0Fh
    db 0
    db 0
    db 0
word_37B2E dw 0
word_37B30 dw 0
word_37B32 dw 0
word_37B34 dw 40h
word_37B36 dw 5Eh
    db 0
    db 0
    db 40h
    db 1
word_37B3C dw 0
    db 2
    db 0
    db 0Fh
    db 0
    db 0
    db 0
word_37B44 dw 0
word_37B46 dw 0Ah
word_37B48 dw 0
    db 0 ;align 4
    db 0
    db 0C8h
    db 0
word_37B4E dw 5Ah
word_37B50 dw 0E6h
word_37B52 dw 0
    db 2
    db 0
    db 7
    db 0
    db 0
    db 0
word_37B5A dw 0
word_37B5C dw 0
word_37B5E dw 0
word_37B60 dw 14h
    db 5Fh
    db 0
word_37B64 dw 4Eh
word_37B66 dw 0F1h
word_37B68 dw 0
    db 2
    db 0
    db 0Fh
    db 0
    db 0
    db 0
word_37B70 dw 0
word_37B72 dw 10h
word_37B74 dw 0
    db 14h
    db 0
    db 6Bh
    db 0
    db 4Eh
    db 0
    db 86h
    db 1
word_37B7E dw 0
    db 0
    db 0
word_37B82 dw 0
word_37B84 dw 0
word_37B86 dw 5Ah
word_37B88 dw 10h
word_37B8A dw 8Dh
word_37B8C dw 3
    db 0 ;align 4
    db 0
    db 0C7h
    db 0
    db 0
    db 0
    db 36h
    db 1
    db 1
    db 0Fh
    db 7
    db 0
    db 7
    db 0
word_37B9C dw 0
word_37B9E dw 0
word_37BA0 dw 29h
word_37BA2 dw 0
word_37BA4 dw 93h
word_37BA6 dw 2Eh
word_37BA8 dw 19h
word_37BAA dw 11h
    db 0
    db 0
    db 0C7h
    db 0
    db 0
    db 0
    db 36h
    db 1
    db 1
    db 0Fh
    db 7
    db 0
    db 7
    db 0
word_37BBA dw 0
    db 0B8h
    db 0
    db 10h
    db 0
word_37BC0 dw 0
    db 9Fh
    db 0
    db 1Eh
    db 0
    db 18h
    db 0
    db 10h
    db 0
    db 0
    db 0
    db 0C7h
    db 0
    db 0
    db 0
    db 3Fh
    db 1
    db 9
    db 0Dh
    db 0Fh
    db 0
    db 0Fh
    db 0
word_37BD8 dw 0
    db 0B8h
    db 0
    db 10h
    db 0
word_37BDE dw 0
    db 0A7h
    db 0
    db 1Eh
    db 0
    db 18h
    db 0
    db 10h
    db 0
    db 0
    db 0
    db 0C7h
    db 0
    db 0
    db 0
    db 3Fh
    db 1
    db 9
    db 0Dh
    db 7
    db 0
    db 7
    db 0
byte_37BF6 db 6Dh
word_37BF7 dw 61h
byte_37BF9 db 8
word_37BFA dw 0Ah
byte_37BFC db 0
word_37BFD dw 62h
word_37BFF dw 0FFh
word_37C01 dw 2Dh
word_37C03 dw 0F8h
word_37C05 dw 0
word_37C07 dw 0
word_37C09 dw 0FFC4h
word_37C0B dw 0FFF1h
word_37C0D dw 10h
word_37C0F dw 3Ch
word_37C11 dw 34h
byte_37C13 db 0
word_37C14 dw 4Fh
word_37C16 dw 24h
word_37C18 dw 38h
word_37C1A dw 9Fh
word_37C1C dw 0
word_37C1E dw 0
word_37C20 dw 0
word_37C22 dw 0
_byte_37C24 db 0
word_37C25 dw 0
word_37C27 dw 0
word_37C29 dw 0
word_37C2B dw 0
byte_37C2D db 0
byte_37C2E db 0
_byte_37C2F db 0
word_37C30 dw 0
word_37C32 dw 3030h
    db 0
byte_37C35 db 0
word_37C36 dw 0
    db 4Bh
    db 0
byte_37C3A db 0
    db 30h
    db 30h
    db 0
    db 39h
    db 30h
    db 30h
    db 0
    db 20h
    db 30h
    db 20h
    db 30h
    db 20h
    db 31h
    db 20h
    db 31h
    db 20h
    db 32h
    db 20h
    db 32h
    db 20h
    db 33h
    db 20h
    db 33h
    db 20h
    db 34h
    db 20h
    db 34h
    db 20h
    db 35h
    db 20h
    db 35h
    db 20h
    db 36h
    db 20h
    db 36h
    db 20h
    db 37h
    db 20h
    db 37h
    db 20h
    db 38h
    db 20h
    db 38h
    db 20h
    db 39h
    db 20h
    db 39h
    db 31h
    db 30h
    db 31h
    db 30h
    db 31h
    db 31h
    db 31h
    db 31h
    db 31h
    db 32h
    db 31h
    db 32h
    db 31h
    db 33h
    db 31h
    db 33h
    db 31h
    db 34h
    db 31h
    db 34h
    db 31h
    db 35h
    db 31h
    db 35h
    db 31h
    db 36h
    db 31h
    db 36h
    db 31h
    db 37h
    db 31h
    db 37h
    db 31h
    db 38h
    db 31h
    db 38h
    db 31h
    db 39h
    db 31h
    db 39h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 30h
    db 30h
    db 35h
    db 30h
    db 20h
    db 30h
    db 20h
    db 31h
    db 20h
    db 32h
    db 20h
    db 33h
    db 20h
    db 34h
    db 20h
    db 35h
    db 20h
    db 36h
    db 20h
    db 37h
    db 20h
    db 38h
    db 20h
    db 39h
    db 31h
    db 30h
    db 31h
    db 31h
    db 31h
    db 32h
    db 31h
    db 33h
    db 31h
    db 34h
    db 31h
    db 35h
    db 31h
    db 36h
    db 31h
    db 37h
    db 31h
    db 38h
    db 31h
    db 39h
    db 32h
    db 30h
    db 32h
    db 31h
    db 32h
    db 32h
    db 32h
    db 33h
    db 32h
    db 34h
    db 32h
    db 35h
    db 32h
    db 36h
    db 32h
    db 37h
    db 32h
    db 38h
    db 32h
    db 39h
    db 33h
    db 30h
    db 33h
    db 31h
    db 33h
    db 32h
    db 33h
    db 33h
    db 33h
    db 34h
    db 33h
    db 35h
    db 33h
    db 36h
    db 33h
    db 37h
    db 33h
    db 38h
    db 33h
    db 39h
    db 34h
    db 30h
    db 34h
    db 31h
    db 34h
    db 32h
    db 34h
    db 33h
    db 34h
    db 34h
    db 34h
    db 35h
    db 34h
    db 36h
    db 34h
    db 37h
    db 34h
    db 38h
    db 34h
    db 39h
    db 35h
    db 30h
    db 35h
    db 31h
    db 35h
    db 32h
    db 35h
    db 33h
    db 35h
    db 34h
    db 35h
    db 35h
    db 35h
    db 36h
    db 35h
    db 37h
    db 35h
    db 38h
    db 35h
    db 39h
    db 36h
    db 30h
    db 36h
    db 31h
    db 36h
    db 32h
    db 36h
    db 33h
    db 36h
    db 34h
    db 36h
    db 35h
    db 36h
    db 36h
    db 36h
    db 37h
    db 36h
    db 38h
    db 36h
    db 39h
    db 30h
    db 30h
    db 30h
    db 0
    db 20h
    db 20h
    db 20h
    db 0
    db 30h
    db 34h
    db 35h
    db 0
    db 20h
    db 20h
    db 20h
    db 0
    db 30h
    db 39h
    db 30h
    db 0
    db 20h
    db 20h
    db 20h
    db 0
    db 31h
    db 33h
    db 35h
    db 0
    db 20h
    db 20h
    db 20h
    db 0
    db 31h
    db 38h
    db 30h
    db 0
    db 20h
    db 20h
    db 20h
    db 0
    db 32h
    db 32h
    db 35h
    db 0
    db 20h
    db 20h
    db 20h
    db 0
    db 32h
    db 37h
    db 30h
    db 0
    db 20h
    db 20h
    db 20h
    db 0
    db 33h
    db 31h
    db 35h
    db 0
    db 20h
    db 20h
    db 20h
    db 0
    db 1Bh
    db 0
    db 18h
    db 0
    db 15h
    db 0
    db 12h
    db 0
    db 0Fh
    db 0
    db 0Ch
    db 0
    db 9
    db 0
    db 6
    db 0
    db 3
    db 0
    db 0
    db 0
    db 20h
    db 0
    db 1Eh
    db 0
    db 24h
    db 0
    db 22h
    db 0
    db 0Fh
    db 0
    db 0Ch
    db 0
    db 9
    db 0
    db 6
    db 0
    db 3
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
byte_37EEE db 0
byte_37EEF db 0
word_37EF0 dw 0
word_37EF2 dw 0
    db 2Dh
    db 37h
    db 30h
    db 0
    db 2Dh
    db 38h
    db 30h
    db 0
    db 2Dh
    db 39h
    db 30h
    db 0
    db 2Dh
    db 38h
    db 30h
    db 0
    db 2Dh
    db 37h
    db 30h
    db 0
    db 2Dh
    db 36h
    db 30h
    db 0
    db 2Dh
    db 35h
    db 30h
    db 0
    db 2Dh
    db 34h
    db 30h
    db 0
    db 2Dh
    db 33h
    db 30h
    db 0
    db 2Dh
    db 32h
    db 30h
    db 0
    db 2Dh
    db 31h
    db 30h
    db 0
    db 30h
    db 30h
    db 0
    db 0
    db 31h
    db 30h
    db 0
    db 0
    db 32h
    db 30h
    db 0
    db 0
    db 33h
    db 30h
    db 0
    db 0
    db 34h
    db 30h
    db 0
    db 0
    db 35h
    db 30h
    db 0
    db 0
    db 36h
    db 30h
    db 0
    db 0
    db 37h
    db 30h
    db 0
    db 0
    db 38h
    db 30h
    db 0
    db 0
    db 39h
    db 30h
    db 0
    db 0
    db 38h
    db 30h
    db 0
    db 0
    db 37h
    db 30h
    db 0
    db 0
word_37F50 dw 0
word_37F52 dw 0
word_37F54 dw 0
word_37F56 dw 0
word_37F58 dw 0
word_37F5A dw 0
word_37F5C dw 0
word_37F5E dw 0
word_37F60 dw 0
word_37F62 dw 0
joyData db 14h dup(0)
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_37F8C dw 0
word_37F8E dw 0
    db 0
    db 0
    db 0
    db 0
_joyAxes db 0
joyAxes_2 db 0
    db 0
    db 0
byte_37F98 db 0
byte_37F99 db 0
byte_37F9A db 0
word_37F9B dw 0
byte_37F9D db 0
byte_37F9E db 0
byte_37F9F db 0
    db 1
    db 0
    db 4
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 5
    db 1
    db 9
    db 2
    db 4
    db 80h
    db 8
    db 8
    db 6
    db 2
    db 0Ah
    db 0
aLandingGearRaised db 'Landing gear raised',0
aBrakesOn db 'Brakes on',0
a_ db '.',0
aG db 'G',0
byte_37FEC db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 12h
    db 12h
    db 12h
    db 12h
    db 12h
    db 12h
    db 12h
    db 13h
    db 13h
    db 14h
    db 14h
    db 15h
    db 16h
    db 16h
    db 17h
    db 18h
    db 19h
    db 19h
    db 1Ah
    db 1Bh
    db 1Bh
    db 1Ch
    db 1Dh
    db 1Dh
    db 1Eh
    db 1Fh
    db 1Fh
    db 20h
    db 22h
    db 24h
    db 25h
    db 27h
    db 29h
    db 2Bh
    db 2Ch
    db 2Eh
    db 30h
    db 34h
    db 38h
    db 3Ch
    db 40h
    db 48h
    db 50h
    db 60h
    db 70h
    db 80h
    db 90h
    db 0A0h
    db 0B0h
    db 0C0h
    db 0D0h
    db 0C0h
    db 0B0h
    db 0A0h
    db 90h
    db 80h
    db 70h
    db 60h
    db 50h
    db 48h
    db 40h
    db 3Ch
    db 38h
    db 34h
    db 30h
    db 2Eh
    db 2Ch
    db 2Bh
    db 29h
    db 27h
    db 25h
    db 24h
    db 22h
    db 20h
    db 1Fh
    db 1Fh
    db 1Eh
    db 1Dh
    db 1Dh
    db 1Ch
    db 1Bh
    db 1Bh
    db 1Ah
    db 19h
    db 19h
    db 18h
    db 17h
    db 16h
    db 16h
    db 15h
    db 14h
    db 14h
    db 13h
    db 13h
    db 12h
    db 12h
    db 12h
    db 12h
    db 12h
    db 12h
    db 12h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 11h
    db 10h
    db 10h
    db 10h
    db 10h
    db 10h
    db 8
    db 0
_unk_3806E db 0FFh
    db 7Fh
word_38070 dw 0
word_38072 dw 0
word_38074 dw 0
word_38076 dw 7FFFh
word_38078 dw 0
    db 0
    db 0
    db 0
    db 0
word_3807E dw 7FFFh
word_38080 dw 0
    db 0 ;align 4
    db 0
word_38084 dw 0
    db 0 ;align 4
    db 0
    db 0FFh
    db 7Fh
    db 0
    db 0
word_3808C dw 0
    db 0 ;align 4
    db 0
word_38090 dw 0
unk_38092 db 0FFh
    db 7Fh
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_3809A dw 0
word_3809C dw 0
    db 0 ;align 4
    db 0
word_380A0 dw 0
word_380A2 dw 0
word_380A4 dw 0
word_380A6 dw 0
    db 0
    db 0
word_380AA dw 0
word_380AC dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0FFh
    db 7Fh
unk_380B6 db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
_word_380C8 dw 0
_word_380CA dw 0
_word_380CC dw 0
_word_380CE dw 0
_word_380D0 dw 0
    db 0Ch
    db 0
    db 0
    db 0
    db 0
    db 0
word_380D8 dw 0
byte_380DA db 0
    db 0
    db 1
byte_380DD db 0
    db 0
    db 0
word_380E0 dw 0
word_380E2 dw 0
_a256left_pic db '256Left.Pic',0
_a256right_pic db '256Right.Pic',0
_a256rear_pic db '256Rear.Pic',0
_aLeft_pic db 'Left.Pic',0
_aRight_pic db 'Right.Pic',0
_aRear_pic db 'Rear.Pic',0
    db 0
_word_38126 dw 6Ch
_unk_38128 db 7
    db 0
    db 53h
    db 0
    db 15h
    db 0
    db 49h
    db 0
    db 5Eh
    db 0
    db 53h
    db 0
    db 5Eh
    db 0
    db 53h
    db 0
    db 15h
    db 0
    db 0FFh
    db 0FFh
    db 8
    db 0
    db 0F1h
    db 0
    db 15h
    db 0
    db 0FBh
    db 0
    db 5Eh
    db 0
    db 0F1h
    db 0
    db 5Eh
    db 0
    db 0F1h
    db 0
    db 15h
    db 0
    db 0FFh
    db 0FFh
    db 0FFh
    db 0FFh
_word_38152 dw 0
aFiring db ' firing ',0
    db 0 ;align 2
word_3815E dw 0
aFiredBy db ' fired by ',0
    db ' - ',0
aTakingOff db ' taking off',0
    db 0 ;align 2
aMisses db ' misses ',0
aDestroyedBy db ' destroyed by ',0
aDestroyedBy_0 db ' destroyed by ',0
aGroundImpact db ' ground impact',0
aHitBy db 'Hit by ',0
aIneffective db 'Ineffective',0
aHitBy_0 db ' hit by ',0
    db 0 ;align 2
aA db 'A',0
    db 1Ah
    db 0
    db 65h
    db 0
aSecond_Target db 'Second. target',0
aPrimaryTarget_0 db 'Primary target',0
a0 db ':0',0
    db ':',0
aFired db ' fired',0
    db 0
    db 0
word_38202 dw 41h
    db 1Ah
    db 0
    db 65h
    db 0
    db 0A3h
    db 0
    db 0BFh
    db 0
    db 0A9h
    db 0
    db 0C5h
    db 0
    db 3
    db 0
    db 0B4h
    db 0
    db 0BFh
    db 0
    db 0BAh
    db 0
    db 0C5h
    db 0
    db 3
    db 0
    db 0D6h
    db 0
    db 0BFh
    db 0
    db 0DCh
    db 0
    db 0C5h
    db 0
    db 3
    db 0
    db 0C5h
    db 0
    db 0BFh
    db 0
    db 0CBh
    db 0
    db 0C5h
    db 0
    db 3
    db 0
    db 2
    db 0
    db 85h
    db 0
    db 10h
    db 0
    db 8Ah
    db 0
    db 0
    db 0
    db 1Fh
    db 1
    db 85h
    db 0
    db 29h
    db 1
    db 8Ah
    db 0
    db 0
    db 0
    db 1Fh
    db 1
    db 90h
    db 0
    db 29h
    db 1
    db 95h
    db 0
    db 0
    db 0
    db 1Fh
    db 1
    db 9Bh
    db 0
    db 29h
    db 1
    db 0A0h
    db 0
    db 0
    db 0
    db 98h
    db 0
    db 72h
    db 0
    db 0A8h
    db 0
    db 75h
    db 0
    db 3
    db 0
    db 98h
    db 0
    db 0B4h
    db 0
    db 0A8h
    db 0
    db 0B7h
    db 0
    db 3
    db 0
    db 0Ah
    db 0
    db 74h
    db 0
    db 10h
    db 0
    db 78h
    db 0
    db 0Ah
    db 0
    db 13h
    db 0
    db 74h
    db 0
    db 19h
    db 0
    db 78h
    db 0
    db 0Ah
    db 0
    db 1Ch
    db 0
    db 74h
    db 0
    db 23h
    db 0
    db 78h
    db 0
    db 0Ah
    db 0
    db 0Ah
    db 0
    db 79h
    db 0
    db 10h
    db 0
    db 7Ch
    db 0
    db 0Ah
    db 0
    db 13h
    db 0
    db 79h
    db 0
    db 19h
    db 0
    db 7Ch
    db 0
    db 0Ah
    db 0
    db 1Ch
    db 0
    db 79h
    db 0
    db 23h
    db 0
    db 7Ch
    db 0
    db 0Ah
    db 0
    db 0Ah
    db 0
    db 7Dh
    db 0
    db 10h
    db 0
    db 80h
    db 0
    db 0Ah
    db 0
    db 13h
    db 0
    db 7Dh
    db 0
    db 19h
    db 0
    db 80h
    db 0
    db 0Ah
    db 0
    db 1Ch
    db 0
    db 7Dh
    db 0
    db 23h
    db 0
    db 80h
    db 0
    db 0Ah
    db 0
    db 4
    db 0
    db 2
    db 0
    db 1Eh
    db 0
    db 15h
    db 0
    db 0Dh
    db 0
    db 7
    db 0
    db 37h
    db 0
    db 23h
    db 0
    db 3Bh
    db 0
    db 7
    db 0
    db 59h
    db 0
    db 23h
    db 0
    db 50h
    db 0
    db 25h
    db 0
    db 65h
    db 0
    db 39h
    db 0
    db 2Fh
    db 0
    db 26h
    db 0
    db 4Ah
    db 0
    db 36h
    db 0
    db 11h
    db 0
    db 2Eh
    db 0
    db 36h
    db 0
    db 42h
    db 0
    db 5
    db 0
    db 36h
    db 0
    db 1Fh
    db 0
    db 47h
    db 0
    db 16h
    db 0
    db 1Dh
    db 0
    db 4Ah
    db 0
    db 21h
    db 0
    db 3
    db 0
    db 19h
    db 0
    db 6
    db 0
    db 1Ah
    db 0
    db 34h
    db 0
    db 1Ah
    db 0
    db 41h
    db 0
    db 1Bh
    db 0
    db 4
    db 0
    db 10h
    db 0
    db 8
    db 0
    db 14h
    db 0
unk_3831E db 0
    db 0
    db 2
    db 0
    db 2
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1
    db 0
    db 0
    db 0
    db 60h
    db 0
    db 0
    db 0
    db 3Fh
    db 1
_off_38334 dw offset unk_3831E
unk_38336 db 1
    db 0
    db 2
    db 0
    db 2
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1
    db 0
    db 0
    db 0
    db 60h
    db 0
    db 0
    db 0
    db 3Fh
    db 1
_off_3834C dw offset unk_38336
word_3834E dw 2
    dw 2
    dw 2
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0C7h
    dw 0
    dw 13Fh
_off_38364 dw offset word_3834E
    db 0 ;align 4
    db 0
    db 2
    db 0
    db 2
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1
    db 0
    db 70h
    db 0
    db 0A8h
    db 0
    db 18h
    db 0
    db 60h
    db 0
word_3837C dw 5AB6h
    db 0 ;align 4
    db 0
    db 2
    db 0
    db 2
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1
    db 0
    db 7Ch
    db 0
    db 0C4h
    db 0
    db 0B0h
    db 0
    db 18h
    db 1
    db 0CEh
    db 5Ah
    db 0
    db 0
    db 2
    db 0
    db 2
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1
    db 0
    db 80h
    db 0
    db 0B8h
    db 0
    db 0E8h
    db 0
    db 30h
    db 1
word_383AC dw 5AE6h
word_383AE dw 0
word_383B0 dw 0
word_383B2 dw 0
word_383B4 dw 0
word_383B6 dw 0
word_383B8 dw 0
word_383BA dw 7
word_383BC dw 7
    db 68h
    db 0
    db 0AFh
    db 0
    db 78h
    db 0
    db 0C7h
    db 0
    db 10h
    db 1
    db 1
    db 0
    db 1
    db 0
word_383CC dw 0
word_383CE dw 0
word_383D0 dw 0
word_383D2 dw 0
word_383D4 dw 0
word_383D6 dw 0
word_383D8 dw 0
word_383DA dw 0
    db 0
    db 0
    db 61h
    db 0
    db 0
    db 0
    db 3Fh
    db 1
byte_383E4 db 1
byte_383E5 db 1
    db 1
    db 0
    db 1
    db 0
word_383EA dw 8
radarRange dw 1
word_383EE dw 0
word_383F0 dw 0
_word_383F2 dw 0
_word_383F4 dw 0
_aStallWarning db 'stall warning',0
_aAccel db 'ACCEL',0
_aTraining db 'TRAINING',0
_aAutopilot db 'AUTOPILOT',0
_aPressAnyKeyToP db 'Press any key to play',0
aTac db 'Tac',0
aTrackcam db 'TrackCam ',0
aAhead db 'Ahead',0
aRear db 'Rear',0
aRight db 'Right',0
aLeft db 'Left',0
aMap db 'Map',0
    db 0
    db 0
    db 0
    db 0
    db 0
word_38460 dw 0
aDestroyedByGun db ' destroyed by gunfire',0
aHitByGunfire db 'Hit by gunfire',0
aDestroyedByG_0 db ' destroyed by gunfire',0
aAt_0 db ' at ',0
    db 0
aPrimaryTarget db 'Primary Target',0
aSecondaryTarget db 'Secondary Target',0
aNoTarget db 'No Target',0
aNoTarget_0 db 'No Target',0
aMissileLock db 'Missile Lock',0
aRange db 'Range ',0
    db 2Eh
    db 0
aKm db ' km',0
    db 0
_a_3d3_0 db '.3D3',0
_aRb_4 db 'rb',0
_aOpenErrorOn_3d3_0 db 'Open Error on *.3D3',0
_byte_3850E db 0
    db 0
_a15flt_xxx db '15FLT.xxx',0
aBrg db 'BRG ',0
    db 0 ;align 2
aLong db 'Long',0
aMedium db 'Medium',0
aShort db 'Short',0
aRangeRadar db ' range radar',0
aDetailLevel db 'Detail Level ',0
aKybdSensitivit db 'Kybd Sensitivity',0
aMemoryAvailabl db 'Memory Available:',0
aJiffiesFrame db 'Jiffies/Frame ',0
aSounds db 'Sounds ',0
aDirector db 'Director ',0
aOff db 'off',0
aWaypointPrimar db 'Waypoint: Primary Target',0
aWaypointSecond db 'Waypoint: Secondary Target',0
aWaypointFriend db 'Waypoint: Friendly Airbase',0
aAutopilotOff db 'Autopilot off',0
aAutopilotOn db 'Autopilot on',0
    db 0 ;align 2
word_38600 dw 1
word_38602 dw 2
word_38604 dw 0
word_38606 dw 0
word_38608 dw 0
word_3860A dw 0
    db 0
    db 0
aNotAvailable db ' not available',0
aArmed db ' armed',0
    db 0F3h
    db 31h
    db 96h
    db 47h
    db 92h
    db 5Ch
byte_3862A db 0
byte_3862B db 0
picBuf db 200h dup(0)
aFileNotFound db ':File not found$'
aNoFileBuffersAvailabl db ':No file buffers available$'
aOpenError db ':Open error $'
aFileClosingError db 'File closing error$'
aReadError db 'Read error$'
aWriteError db 'Write error$'
word_3888E dw 0
word_38890 dw 0
    db 0 ;align 4
    db 0
fileReadPos dw 0
tmpFileHandle dw 0
picDecodedRowBuf db 140h dup(0)
word_389D8 dw 0
tmpPageIndex dw 0
rowOffset dw 0
    db 0 ;align 4
    db 0
word_389E0 dw 0
readFromFilePtr dw 0
word_389E4 dw 0
word_389E6 dw 0
off_389E8 dw 0 ;off_389E8 dw offset __exit
word_389EA dw 0
    dw 0 ;dw seg dseg
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_38A3A dw 613Ah
aC_file_info db ';C_FILE_INFO',0
dword_38A49 dd 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_38A55 dw 0
word_38A57 dw 0
    db 0
    db 0
word_38A5B dw 0
word_38A5D dw 0
    db 0 ;align 2
byte_38A60 db 0
    db 0 ;align 2
word_38A62 dw 14h
    db 81h
    db 81h
    db 81h
    db 1
    db 1
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
argc dw 0
argv dw 0
word_38A7C dw 0
    db 0D2h
    db 61h
    dw seg @data ;dw seg dseg
    db 43h
    db 0
    db 0
    db 0
byte_38A86 db 0
byte_38A87 db 0
dword_38A88 dd 0
word_38A8C dw 0A120h
    db 5Ch
    db 0
    db 5Ch
    db 0
word_38A92 dw 0FFFFh
word_38A94 dw 1
word_38A96 dw 0
word_38A98 dw 0
    db 0
    db 16h
    db 2
    db 2
    db 18h
    db 0Dh
    db 9
    db 0Ch
    db 0Ch
    db 0Ch
    db 7
    db 8
    db 16h
    db 16h
    db 0FFh
    db 12h
    db 0Dh
    db 12h
    db 2
    db 0FFh
    db 2Ah
    db 8Dh
    db 0
    db 0
    db 2Ah
    db 8Dh
    db 1
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 2
    db 1
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 2
    db 2
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 84h
    db 3
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 2
    db 4
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1
    db 0
    db 0
    db 2
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_38BC6 dw 6296h
word_38BC8 dw 0
word_38BCA dw 0
word_38BCC dw 0
    db 0 ;align 4
    db 0
word_38BD0 dw 0
    db 0
    db 0
    db 0
byte_38BD5 db 0
word_38BD6 dw 0
    db 0
    db 0
word_38BDA dw 0
word_38BDC dw 2000h
    db 0 ;align 4
    db 0
byte_38BE0 db 0
    db 0 ;align 4
    db 0
    db 0
unk_38BE4 db 0
    db 0
word_38BE6 dw 0
dword_38BE8 dd 0
dword_38BEC dd 0
byte_38BF0 db 18h
    db 0F6h
    dw 0 ;seg_38BF2 dw seg seg004
    dw 0 ;seg_38BF4 dw seg seg004
    dw 0 ;seg_38BF6 dw seg seg004
aNmsg db '<<NMSG>>',0
    db 0 ;align 2
aR6000StackOver db 'R6000',0Dh,0Ah
    db '- stack overflow',0Dh,0Ah,0
    db 3
    db 0
aR6003IntegerDivideBy0 db 'R6003',0Dh,0Ah
    db '- integer divide by 0',0Dh,0Ah,0
    db 9
    db 0
aR6009NotEnoughSpaceFo db 'R6009',0Dh,0Ah
    db '- not enough space for environment',0Dh,0Ah,0
    db 0FCh
    db 0
    db 0Dh
    db 0Ah
    db 0
    db 0FFh
    db 0
aRunTimeError db 'run-time error ',0
    db 2
    db 0
aR6002FloatingPointNot db 'R6002',0Dh,0Ah
    db '- floating point not loaded',0Dh,0Ah,0
    db 1
    db 0
aR6001NullPointerAssig db 'R6001',0Dh,0Ah
    db '- null pointer assignment',0Dh,0Ah,0
    db 0FFh
    db 0FFh
    db 0FFh
    db 0
word_38CD2 dw 0
_farPointer dd 0
word_38CD8 dw 0
word_38CDA dw 0
word_38CDC dw 0
word_38CDE dw 0
word_38CE0 dw 0
word_38CE2 dw 0
word_38CE4 dw 0
word_38CE6 dw 0
word_38CE8 dw 0
word_38CEA dw 0
word_38CEC dw 0
word_38CEE dw 0
word_38CF0 dw 0
word_38CF2 dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
word_38CFA dw 0
word_38CFC dw 0
word_38CFE dw 0
word_38D00 dw 0
word_38D02 dw 0
word_38D04 dw 0
word_38D06 dw 0
_flt15_word1 dw 0
_flt15_buf1 db 40h dup(0)
_flt15_size dw 0
word_38D4C dw 0
word_38D4E dw 0
word_38D50 dw 0
word_38D52 dw 0
word_38D54 dw 0
word_38D56 dw 0
word_38D58 dw 0
word_38D5A dw 0
word_38D5C dw 0
word_38D5E dw 0
byte_38D60 db 0
byte_38D61 db 0
byte_38D62 db 0
byte_38D63 db 0
word_38D64 dw 0
word_38D66 dw 0
word_38D68 dw 0
byte_38D6A db 0
byte_38D6B db 0
word_38D6C dw 0
byte_38D6E db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
; ==============================================================================
; --- Symbolic labels for code references ---
ORG 00178h
_var_47 label byte
ORG 0017Eh
_var_48 label byte
ORG 00180h
_var_49 label byte
ORG 01100h
_var_134 label byte
ORG 01102h
_var_135 label byte
ORG 012FCh
_var_141 label byte
ORG 01308h
_var_143 label byte
ORG 018EAh
_var_190 label byte
ORG 01904h
_var_194 label byte
ORG 01906h
_var_195 label byte
ORG 01908h
_var_196 label byte
ORG 0190Ah
_var_197 label byte
ORG 0190Ch
_var_198 label byte
ORG 0198Ch
_var_200 label byte
ORG 0198Eh
_var_201 label byte
ORG 01990h
_var_202 label byte
ORG 01992h
_var_203 label byte
ORG 01994h
_var_204 label byte
ORG 019A8h
_var_215 label byte
ORG 019B0h
_var_216 label byte
ORG 019B2h
_var_217 label byte
ORG 019B4h
_var_218 label byte
ORG 019B6h
_var_219 label byte
ORG 019B8h
_var_220 label byte
ORG 019BEh
_var_224 label byte
ORG 019C0h
_var_225 label byte
ORG 019C2h
_var_226 label byte
ORG 019C4h
_var_227 label byte
ORG 019FCh
_var_255 label byte
ORG 019FEh
_var_256 label byte
ORG 01A00h
_var_257 label byte
ORG 01A04h
_var_258 label byte
ORG 01A06h
_var_259 label byte
ORG 01A08h
_var_260 label byte
ORG 01A0Ah
_var_261 label byte
ORG 01FB8h
_var_279 label byte
ORG 0219Ch
_var_282 label byte
ORG 042D6h
_var_315 label byte
ORG 042D8h
_var_316 label byte
ORG 04CA7h
_var_349 label byte
ORG 04CA9h
_var_350 label byte
ORG 04CADh
_var_351 label byte
ORG 04CAFh
_var_352 label byte
ORG 04CB1h
_var_353 label byte
ORG 04CB3h
_var_354 label byte
ORG 0505Ah
_var_383 label byte
ORG 05374h
_var_456 label byte
ORG 057C0h
_var_524 label byte
ORG 057C2h
_var_525 label byte
ORG 057C4h
_var_526 label byte
ORG 057C6h
_var_527 label byte
ORG 057C8h
_var_528 label byte
ORG 057CEh
_var_529 label byte
ORG 05818h
_var_542 label byte
ORG 05819h
_var_543 label byte
ORG 0581Ah
_var_544 label byte
ORG 0581Ch
_var_545 label byte
ORG 0581Eh
_var_547 label byte
ORG 05820h
_var_548 label byte
ORG 05828h
_var_549 label byte
ORG 0582Ah
_var_550 label byte
ORG 05830h
_var_552 label byte
ORG 058AEh
_var_556 label byte
ORG 05A84h
_var_564 label byte
ORG 05A9Ch
_var_565 label byte
ORG 05AB4h
_var_566 label byte
ORG 05ACCh
_var_567 label byte
ORG 05AFCh
_var_568 label byte
ORG 05AFEh
_var_569 label byte
ORG 05B00h
_var_570 label byte
ORG 05B02h
_var_571 label byte
ORG 05B04h
_var_572 label byte
ORG 05B06h
_var_573 label byte
ORG 05B08h
_var_574 label byte
ORG 05B0Ah
_var_575 label byte
ORG 05B0Ch
_var_576 label byte
ORG 05B1Ch
_var_577 label byte
ORG 05B1Eh
_var_578 label byte
ORG 05B20h
_var_579 label byte
ORG 05B22h
_var_580 label byte
ORG 05B24h
_var_581 label byte
ORG 05B26h
_var_582 label byte
ORG 05B28h
_var_583 label byte
ORG 05B2Ah
_var_584 label byte
ORG 05B34h
_var_585 label byte
ORG 05B35h
_var_586 label byte
ORG 05B3Ch
_var_588 label byte
ORG 05B3Eh
_var_589 label byte
ORG 05B40h
_var_590 label byte
ORG 05B42h
_var_591 label byte
ORG 05B44h
_var_592 label byte
ORG 05BB0h
_var_593 label byte
ORG 05C5Eh
_var_594 label byte
ORG 05D50h
_var_595 label byte
ORG 05D52h
_var_596 label byte
ORG 05D54h
_var_597 label byte
ORG 05D56h
_var_598 label byte
ORG 05D58h
_var_599 label byte
ORG 05D5Ah
_var_600 label byte
ORG 05FE6h
_var_605 label byte
ORG 06128h
_var_606 label byte
ORG 0612Ch
_var_608 label byte
ORG 06130h
_var_609 label byte
ORG 06132h
_var_610 label byte
ORG 06134h
_var_611 label byte
ORG 06138h
_var_613 label byte
ORG 0618Ah
_var_615 label byte
ORG 06199h
_var_616 label byte
ORG 0619Bh
_var_617 label byte
ORG 061A5h
_var_618 label byte
ORG 061A7h
_var_619 label byte
ORG 061ABh
_var_620 label byte
ORG 061ADh
_var_621 label byte
ORG 061C8h
_var_625 label byte
ORG 061CAh
_var_626 label byte
ORG 061CCh
_var_627 label byte
ORG 061D6h
_var_628 label byte
ORG 061D7h
_var_629 label byte
ORG 061D8h
_var_630 label byte
ORG 061E2h
_var_632 label byte
ORG 061E4h
_var_633 label byte
ORG 061E6h
_var_634 label byte
ORG 061E8h
_var_635 label byte
ORG 06316h
_var_638 label byte
ORG 06318h
_var_639 label byte
ORG 0631Ah
_var_640 label byte
ORG 0631Ch
_var_641 label byte
ORG 06320h
_var_642 label byte
ORG 06334h
_var_647 label byte
ORG 06336h
_var_648 label byte
ORG 06338h
_var_649 label byte
ORG 0633Ch
_var_650 label byte
ORG 06346h
_var_653 label byte
ORG 06422h
_var_654 label byte
ORG 06428h
_var_657 label byte
ORG 0642Ah
_var_658 label byte
ORG 0642Ch
_var_659 label byte
ORG 0642Eh
_var_660 label byte
ORG 06430h
_var_661 label byte
ORG 06432h
_var_662 label byte
ORG 06434h
_var_663 label byte
ORG 06436h
_var_664 label byte
ORG 06438h
_var_665 label byte
ORG 0643Ah
_var_666 label byte
ORG 0643Ch
_var_667 label byte
ORG 0643Eh
_var_668 label byte
ORG 06440h
_var_669 label byte
ORG 06442h
_var_670 label byte
ORG 0644Ah
_var_671 label byte
ORG 0644Ch
_var_672 label byte
ORG 0644Eh
_var_673 label byte
ORG 06450h
_var_674 label byte
ORG 06452h
_var_675 label byte
ORG 06454h
_var_676 label byte
ORG 06456h
_var_677 label byte
ORG 0649Ch
_var_680 label byte
ORG 0649Eh
_var_681 label byte
ORG 064A0h
_var_682 label byte
ORG 064A2h
_var_683 label byte
ORG 064A4h
_var_684 label byte
ORG 064A6h
_var_685 label byte
ORG 064A8h
_var_686 label byte
ORG 064AAh
_var_687 label byte
ORG 064ACh
_var_688 label byte
ORG 064AEh
_var_689 label byte
ORG 064B0h
_var_690 label byte
ORG 064B2h
_var_692 label byte
ORG 064B4h
_var_694 label byte
ORG 064BAh
_var_697 label byte
ORG 064BCh
_var_699 label byte
ORG 064BEh
_var_700 label byte

.DATA?
IFDEF DEBUG
PUBLIC __bss_start
ENDIF
__bss_start label byte
; --- BSS-region symbolic labels (offsets relative to _BSS start) ---
ORG 0008Dh
_var_727 label byte
ORG 0028Fh
_var_730 label byte
ORG 00291h
_var_732 label byte
ORG 01AF0h
_var_762 label byte
ORG 01AFAh
_var_767 label byte
ORG 022B8h
_var_810 label byte
ORG 022BAh
_var_811 label byte
ORG 00000h
word_38F70 dw ?
word_38F72 dw ?
strBuf db 18h dup(?)
byte_38F8C db ?
byte_38F8D db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_word_38FC4 dw ?
word_38FC6 dw ?
word_38FC8 dw ?
_word_38FC8 equ word_38FC8
    db ? ;align 4
    db ?
word_38FCC dw ?
_word_38FCC equ word_38FCC
word_38FCE dw ?
unk_38FD0 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
word_38FDA dw ?
_word_38FDC dw ?
word_38FDE dw ?
word_38FE0 dw ?
_dword_38FE2 dd ?
_fileHandle dw ?
word_38FE8 dw ?
_word_38FEA dw ?
word_38FEC dw ?
word_38FEE dw ?
_gameData dd ?
    db ?
    db ?
word_38FF6 dw ?
word_38FF8 dw ?
_word_38FFA dw ?
word_38FFC dw ?
_buf4_3dg db 200h dup(?)
_planeFlags dw ?
word_39200 dw ?
_buf3_3dg db 200h dup(?)
word_39402 dw ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_word_39604 dw ?
word_39606 dw ?
_buf2_3dg db 200h dup(?)
word_39808 dw ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_buf1_3dg db 100h dup(?)
_byte_3995A db ?
    db ?
word_3995C dw ?
_buf1_3dt db ?
    db ?
_buf2_3dt db ?
    db ?
_buf3_3dt db ?
    db ?
_val_3dt db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
word_3A8FE dw ?
_byte_3A900 db 40h dup(?)
_word_3A940 dw ?
    db ? ;align 4
    db ?
word_3A944 dw ?
word_3A946 dw ?
_unk_3A948 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    _stru_3A95A struc_1 10h dup(<?>)
_word_3AA5A dw ?
_word_3AA5C dw ?
    _stru_3AA5E struc_4 4Ah dup(<?>)
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
word_3AF0C dw ?
_buf3d3_1 db 96h dup(?)
word_3AFA4 dw ?
word_3AFA6 dw ?
word_3AFA8 dw ?
word_3AFAA dw ?
_byte_3AFAC db 100h dup(?)
word_3B0AC dw ?
_buf3d3_2 db 96h dup(?)
_word_3B144 dw ?
word_3B146 dw ?
_word_3B148 dw ?
_word_3B14A dw ?
word_3B14C dw ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
word_3B158 dw ?
word_3B15A dw ?
    db ?
    db ?
word_3B15E dw ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_buf3d3_3 db 96h dup(?)
_dword_3B1FE dd ?
_unk_3B202 db ?
    db ?
word_3B204 dw ?
word_3B206 dw ?
    _stru_3B208 struc_3 <?>
word_3B22C dw ?
word_3B22E dw ?
word_3B230 dw ?
word_3B232 dw ?
word_3B234 dw ?
word_3B236 dw ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
byte_3B23E db ?
    db ? ;align 2
word_3B240 dw ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
word_3B4D2 dw ?
_dword_3B4D4 dd ?
word_3B4D8 dw ?
word_3B4DA dw ?
word_3B4DC dw ?
_word_3B4DC equ word_3B4DC
_word_3B4DE dw ?
word_3B4E0 dw ?
_hercFlag db ?
    db ?
_word_3B4E4 dw ?
byte_3B4E6 db ?
byte_3B4E7 db ?
byte_3B4E8 db ?
byte_3B4E9 db ?
word_3B4EA dw ?
byte_3B4EC db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
word_3B5D6 dw ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_dword_3B7DA dd ?
word_3B7DE dw ?
word_3B7E0 dw ?
word_3B7E2 dw ?
word_3B7E4 dw ?
word_3B7E6 dw ?
word_3B7E8 dw ?
word_3B7EA dw ?
word_3B7EC dw ?
byte_3B7EE db ?
byte_3B7EF db ?
byte_3B7F0 db ?
byte_3B7F1 db ?
    db ? ;align 8
    db ?
    db ?
    db ?
    db ?
    db ?
_dword_3B7F8 dd ?
_byte_3B7FC db 640h dup(?)
word_3BE3C dw ?
_byte_3BE3E db 40h dup(?)
word_3BE7E dw ?
_byte_3BE80 db 10h dup(?)
_keyValue dw ?
_word_3BE92 dw ?
_word_3BE94 dw ?
word_3BE96 dw ?
_word_3BE98 dw ?
    db ? ;align 4
    db ?
word_3BE9C dw ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
word_3BEBC dw ?
_word_3BEBE dw ?
_word_3BEC0 dw ?
word_3BEC2 dw ?
_byte_3BEC4 db ?
    db ? ;align 4
    db ?
    db ?
word_3BEC8 dw ?
_sign3d3 dw ?
word_3BECC dw ?
word_3BECE dw ?
_word_3BED0 dw ?
_word_3BED2 dw ?
word_3BED4 dw ?
word_3BED6 dw ?
_byte_3BED8 db 64h dup(?)
word_3BF3C dw ?
word_3BF3E dw ?
_tempString db 50h dup(?)
word_3BF90 dw ?
_regs db ?
PUBLIC _byte_3BF93
_byte_3BF93 label byte
byte_3BF93 db ?
    db ?
PUBLIC _unk_3BF95
_unk_3BF95 label byte
unk_3BF95 db ?
PUBLIC _unk_3BF96
_unk_3BF96 label byte
unk_3BF96 db ?
    db ?
PUBLIC _unk_3BF98
_unk_3BF98 label byte
unk_3BF98 db ?
    db ?
    db ?
    db ?
word_3BFA0 dw ?
word_3BFA2 dw ?
_word_3BFA2 equ word_3BFA2
_byte_3BFA4 db 64h dup(?)
_word_3C008 dw ?
word_3C00A dw ?
_word_3C00C dw ?
word_3C00E dw ?
_flagFarToNear dw ?
keyScancode dw ?
_keyScancode equ keyScancode
word_3C014 dw ?
word_3C016 dw ?
word_3C018 dw ?
_word_3C018 equ word_3C018
word_3C01A dw ?
_word_3C01A equ word_3C01A
_dword_3C01C dd ?
word_3C020 dw ?
    db ? ;align 4
    db ?
_dword_3C024 dd ?
_word_3C028 dw ?
_byte_3C02A db ?
    db ? ;align 2
_word_3C02C dw ?
_word_3C02E dw ?
unk_3C030 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_word_3C03A dw ?
    db ?
    db ?
word_3C03E dw ?
_word_3C040 dw ?
word_3C042 dw ?
word_3C044 dw ?
_word_3C046 dw ?
word_3C048 dw ?
_string_3C04A db 50h dup(?)
_word_3C09A dw ?
word_3C09C dw ?
_word_3C09E dw ?
word_3C0A0 dw ?
_word_3C0A2 dw 64h dup(?)
_word_3C16A dw ?
word_3C16C dw ?
_byte_3C16E db 2EEh dup(?)
_word_3C45C dw ?
word_3C45E dw ?
_word_3C45E equ word_3C45E
_matrix3dt_2 dw 0A0h dup(?)
_byte_3C5A0 db ?
    db ?
word_3C5A2 dw ?
_word_3C5A2 equ word_3C5A2
word_3C5A4 dw ?
_word_3C5A6 dw ?
word_3C5A8 dw ?
_word_3C5AA dw ?
word_3C5AC dw ?
word_3C5AE dw ?
word_3C5B0 dw ?
word_3C5B2 dw ?
word_3C5B4 dw ?
word_3C5B6 dw ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
word_3C69C dw ?
_word_3C69E dw ?
byte_3C6A0 db ?
    db ? ;align 2
word_3C6A2 dw ?
_word_3C6A4 dw ?
_commData dd ?
word_3C6AA dw ?
_word_3C6AC dw ?
word_3C6AE dw ?
    db ? ;align 400h
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
byte_3C8B0 db ?
    db ? ;align 2
word_3C8B2 dw ?
_gfxBufPtr dw ?
_word_3C8B6 dw ?
word_3C8B8 dw ?
word_3C8BA dw ?
word_3C8BC dw ?
word_3C8BE dw ?
word_3C8C0 dw ?
word_3C8C2 dw ?
_size3d3_7 dw ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?

__bss_end label byte



END
