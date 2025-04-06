.8086
DOSSEG
.MODEL SMALL
EXTRN _sub_155AB:PROC
EXTRN _sub_18E50:PROC
PUBLIC _commData
PUBLIC _gameData
PUBLIC _hercFlag
PUBLIC _setupOverlaySlots
PUBLIC _gfxModeUnset
PUBLIC _noJoy80
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
PUBLIC _sub_1CF64
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
PUBLIC _sub_1D190
PUBLIC _sub_1D178
PUBLIC _word_3C028
PUBLIC _word_3C03A
PUBLIC _word_330C4
PUBLIC _word_336F4
PUBLIC _stru_335C4
PUBLIC _sub_1D008
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
PUBLIC _word_3BE98
PUBLIC _byte_3C5A0
PUBLIC _sub_15FDB
PUBLIC _word_3C040
PUBLIC _word_383F4
PUBLIC _word_3BEBE
PUBLIC _sub_1A183
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
PUBLIC _copySomeMem
PUBLIC _word_38FC4
PUBLIC _waypoints
PUBLIC _word_3C008
PUBLIC _word_391FE
PUBLIC _byte_37C24
PUBLIC _string_3C04A
PUBLIC _draw2Strings
PUBLIC _word_3370A
PUBLIC _word_3C6AC
PUBLIC _missiles
PUBLIC _aAccel
PUBLIC _sub_19C0C
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
field_0		dd ?
field_4		dd ?
field_8		dw ?
field_A		dw ?
field_C		dw ?
field_E		dw ?
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

MissileSpec	struc ;	(sizeof=0x4, mappedto_18) ; XREF: dseg:missileSpec/r
field_0		dw ?
field_2		dw ?
MissileSpec	ends

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
    retn
sub_10294 endp
; ------------------------------seg000:0x296------------------------------
; ------------------------------seg000:0x297------------------------------
sub_10297 proc near
    retn
sub_10297 endp
; ------------------------------seg000:0x299------------------------------
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
    retn ;sp-analysis failed
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
; ------------------------------seg000:0x720------------------------------
sub_10720 proc near
    retn
sub_10720 endp
; ------------------------------seg000:0x14e7------------------------------
; ------------------------------seg000:0x14e8------------------------------
sub_114E8 proc near
    retn
sub_114E8 endp
; ------------------------------seg000:0x14fb------------------------------
; ------------------------------seg000:0x14fc------------------------------
countermeasures proc near
    retn
countermeasures endp
; ------------------------------seg000:0x1635------------------------------
; ------------------------------seg000:0x1636------------------------------
sub_11636 proc near
    retn
sub_11636 endp
; ------------------------------seg000:0x1675------------------------------
; ------------------------------seg000:0x1676------------------------------
sub_11676 proc near
    retn
sub_11676 endp
; ------------------------------seg000:0x1840------------------------------
; ------------------------------seg000:0x1841------------------------------
sub_11841 proc near
    retn
sub_11841 endp
; ------------------------------seg000:0x18d4------------------------------
; ------------------------------seg000:0x18d5------------------------------
sub_118D5 proc near
    retn
sub_118D5 endp
; ------------------------------seg000:0x18f5------------------------------
; ------------------------------seg000:0x18f6------------------------------
sub_118F6 proc near
    retn
sub_118F6 endp
; ------------------------------seg000:0x1970------------------------------
; ------------------------------seg000:0x1971------------------------------
sub_11971 proc near
    retn
sub_11971 endp
; ------------------------------seg000:0x19a2------------------------------
; ------------------------------seg000:0x19a3------------------------------
sub_119A3 proc near
    retn
sub_119A3 endp
; ------------------------------seg000:0x1a17------------------------------
; ------------------------------seg000:0x1a18------------------------------
_sub_11A18 proc near
    retn
_sub_11A18 endp
; ------------------------------seg000:0x1a87------------------------------
; ------------------------------seg000:0x1a88------------------------------
_sub_11A88 proc near
    retn
_sub_11A88 endp
; ------------------------------seg000:0x1b36------------------------------
; ------------------------------seg000:0x1b37------------------------------
sub_11B37 proc near
    retn
sub_11B37 endp
; ------------------------------seg000:0x1bc2------------------------------
; ------------------------------seg000:0x1bc3------------------------------
sub_11BC3 proc near
    retn
sub_11BC3 endp
; ------------------------------seg000:0x1bfc------------------------------
; ------------------------------seg000:0x1bfd------------------------------
sub_11BFD proc near
    retn
sub_11BFD endp
; ------------------------------seg000:0x1c20------------------------------
; ------------------------------seg000:0x1c21------------------------------
sub_11C21 proc near
    retn
sub_11C21 endp
; ------------------------------seg000:0x1d0f------------------------------
; ------------------------------seg000:0x1d10------------------------------
sub_11D10 proc near
    retn
sub_11D10 endp
; ------------------------------seg000:0x1d6d------------------------------
; ------------------------------seg000:0x1d6e------------------------------
placeString proc near
    retn
placeString endp
; ------------------------------seg000:0x1e0d------------------------------
; ------------------------------seg000:0x1f3e------------------------------
sub_11F3E proc near
    retn
sub_11F3E endp
; ------------------------------seg000:0x2048------------------------------
; ------------------------------seg000:0x21a9------------------------------
setCommWorldbufPtr proc near
    retn
setCommWorldbufPtr endp
; ------------------------------seg000:0x21c4------------------------------
; ------------------------------seg000:0x21c6------------------------------
callLoad3DAll proc near
    retn
callLoad3DAll endp
; ------------------------------seg000:0x21c9------------------------------
; ------------------------------seg000:0x21ca------------------------------
_sub_121CA proc near
    retn
_sub_121CA endp
; ------------------------------seg000:0x2276------------------------------
; ------------------------------seg000:0x229a------------------------------
_copySomeMem proc near
    retn
_copySomeMem endp
; ------------------------------seg000:0x22b7------------------------------
; ------------------------------seg000:0x22b8------------------------------
sub_122B8 proc near
    retn
sub_122B8 endp
; ------------------------------seg000:0x26b3------------------------------
; ------------------------------seg000:0x26b4------------------------------
sub_126B4 proc near
    retn
sub_126B4 endp
; ------------------------------seg000:0x273d------------------------------
; ------------------------------seg000:0x273e------------------------------
process3dg proc near
    retn
; ------------------------------seg000:0x2872------------------------------
process3dg endp
; ------------------------------seg000:0x2872------------------------------
; ------------------------------seg000:0x2fda------------------------------
sub_12FDA proc near
    retn
sub_12FDA endp
; ------------------------------seg000:0x3223------------------------------
; ------------------------------seg000:0x3224------------------------------
sub_13224 proc near
    retn
sub_13224 endp
; ------------------------------seg000:0x3264------------------------------
; ------------------------------seg000:0x3266------------------------------
sub_13266 proc near
    retn
sub_13266 endp
; ------------------------------seg000:0x32b8------------------------------
; ------------------------------seg000:0x32ba------------------------------
sub_132BA proc near
    retn
sub_132BA endp
; ------------------------------seg000:0x345d------------------------------
; ------------------------------seg000:0x345e------------------------------
sub_1345E proc near
    retn
sub_1345E endp
; ------------------------------seg000:0x34aa------------------------------
; ------------------------------seg000:0x34ac------------------------------
sub_134AC proc near
    retn
sub_134AC endp
; ------------------------------seg000:0x3637------------------------------
; ------------------------------seg000:0x3638------------------------------
sub_13638 proc near
    retn
sub_13638 endp
; ------------------------------seg000:0x3692------------------------------
; ------------------------------seg000:0x3694------------------------------
sub_13694 proc near
    retn
sub_13694 endp
; ------------------------------seg000:0x36d0------------------------------
; ------------------------------seg000:0x36d2------------------------------
sub_136D2 proc near
    retn
sub_136D2 endp
; ------------------------------seg000:0x3749------------------------------
; ------------------------------seg000:0x374a------------------------------
sub_1374A proc near
    retn
sub_1374A endp
; ------------------------------seg000:0x378d------------------------------
; ------------------------------seg000:0x378e------------------------------
sub_1378E proc near
    retn
sub_1378E endp
; ------------------------------seg000:0x3815------------------------------
; ------------------------------seg000:0x3816------------------------------
sub_13816 proc near
    retn
sub_13816 endp
; ------------------------------seg000:0x3920------------------------------
; ------------------------------seg000:0x3922------------------------------
sub_13922 proc near
    retn
sub_13922 endp
; ------------------------------seg000:0x3931------------------------------
; ------------------------------seg000:0x3932------------------------------
sub_13932 proc near
    retn
sub_13932 endp
; ------------------------------seg000:0x39a8------------------------------
; ------------------------------seg000:0x39aa------------------------------
sub_139AA proc near
    retn
sub_139AA endp
; ------------------------------seg000:0x39be------------------------------
; ------------------------------seg000:0x39c0------------------------------
sub_139C0 proc near
    retn
sub_139C0 endp
; ------------------------------seg000:0x3a6b------------------------------
; ------------------------------seg000:0x3a6c------------------------------
sub_13A6C proc near
    retn
sub_13A6C endp
; ------------------------------seg000:0x3a8e------------------------------
; ------------------------------seg000:0x3a90------------------------------
sub_13A90 proc near
    retn
sub_13A90 endp
; ------------------------------seg000:0x3aa6------------------------------
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
    retn
sub_13B2F endp
; ------------------------------seg000:0x3b44------------------------------
; ------------------------------seg000:0x3b86------------------------------
sub_13B86 proc near
    retn
sub_13B86 endp
; ------------------------------seg000:0x3b95------------------------------
; ------------------------------seg000:0x3b96------------------------------
sub_13B96 proc near
    retn
sub_13B96 endp
; ------------------------------seg000:0x3ba1------------------------------
; ------------------------------seg000:0x3ba2------------------------------
sub_13BA2 proc near
    retn
sub_13BA2 endp
; ------------------------------seg000:0x3bc0------------------------------
; ------------------------------seg000:0x3bc1------------------------------
sub_13BC1 proc far
    retn
sub_13BC1 endp
; ------------------------------seg000:0x3bc4------------------------------
; ------------------------------seg000:0x3bc5------------------------------
sub_13BC5 proc far
    retn
sub_13BC5 endp
; ------------------------------seg000:0x3bc8------------------------------
; ------------------------------seg000:0x3bc9------------------------------
sub_13BC9 proc near
    retn ;sp-analysis failed
sub_13BC9 endp
; ------------------------------seg000:0x3bc9------------------------------
; ------------------------------seg000:0x3bcd------------------------------
sub_13BCD proc near
    retn
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
    call far ptr sub_21A7A ;call sub_21A7A
loc_13C59:
    mov bx, 0
    mov ax, _word_38126
    call far ptr gfx_jump_2c
    mov byte_378EE, 1
    call otherKeyDispatch
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
    retn
getTimeOfDay endp
; ------------------------------seg000:0x3ee2------------------------------
; ------------------------------seg000:0x3ee3------------------------------
sub_13EE3 proc near
    retn
sub_13EE3 endp
; ------------------------------seg000:0x3f01------------------------------
; ------------------------------seg000:0x3f72------------------------------
otherKeyDispatch proc near
    retn
otherKeyDispatch endp
; ------------------------------seg000:0x51f8------------------------------
; ------------------------------seg000:0x51f9------------------------------
sub_151F9 proc near
    retn
sub_151F9 endp
; ------------------------------seg000:0x5236------------------------------
; ------------------------------seg000:0x5237------------------------------
sub_15237 proc near
    retn
sub_15237 endp
; ------------------------------seg000:0x5410------------------------------
; ------------------------------seg000:0x5411------------------------------
sub_15411 proc near
    retn
sub_15411 endp
; ------------------------------seg000:0x543a------------------------------
; ------------------------------seg000:0x543b------------------------------
sub_1543B proc near
    retn
sub_1543B endp
; ------------------------------seg000:0x54b6------------------------------
; ------------------------------seg000:0x54b7------------------------------
sub_154B7 proc near
    retn
sub_154B7 endp
; ------------------------------seg000:0x553f------------------------------
; ------------------------------seg000:0x5540------------------------------
sub_15540 proc near
    retn
sub_15540 endp
; ------------------------------seg000:0x5556------------------------------
; ------------------------------seg000:0x5557------------------------------
sub_15557 proc near
    retn
sub_15557 endp
; ------------------------------seg000:0x55aa------------------------------
; ------------------------------seg000:0x5fdb------------------------------
_sub_15FDB proc near
    retn
_sub_15FDB endp
; ------------------------------seg000:0x606b------------------------------
; ------------------------------seg000:0x606c------------------------------
sub_1606C proc near
    retn
sub_1606C endp
; ------------------------------seg000:0x60d2------------------------------
; ------------------------------seg000:0x60d3------------------------------
_sub_160D3 proc near
    retn
_sub_160D3 endp
; ------------------------------seg000:0x613a------------------------------
; ------------------------------seg000:0x613b------------------------------
sub_1613B proc near
    retn
sub_1613B endp
; ------------------------------seg000:0x6171------------------------------
; ------------------------------seg000:0x6172------------------------------
sub_16172 proc near
    retn
sub_16172 endp
; ------------------------------seg000:0x6345------------------------------
; ------------------------------seg000:0x6346------------------------------
sub_16346 proc near
    retn
sub_16346 endp
; ------------------------------seg000:0x660c------------------------------
; ------------------------------seg000:0x660e------------------------------
sub_1660E proc near
    retn
sub_1660E endp
; ------------------------------seg000:0x66bd------------------------------
; ------------------------------seg000:0x66be------------------------------
sub_166BE proc near
    retn
sub_166BE endp
; ------------------------------seg000:0x6740------------------------------
; ------------------------------seg000:0x6742------------------------------
sub_16742 proc near
    retn
sub_16742 endp
; ------------------------------seg000:0x67b3------------------------------
; ------------------------------seg000:0x67b4------------------------------
sub_167B4 proc near
    retn
sub_167B4 endp
; ------------------------------seg000:0x7593------------------------------
; ------------------------------seg000:0x7594------------------------------
sub_17594 proc near
    retn
sub_17594 endp
; ------------------------------seg000:0x7838------------------------------
; ------------------------------seg000:0x783a------------------------------
sub_1783A proc near
    retn
sub_1783A endp
; ------------------------------seg000:0x79ec------------------------------
; ------------------------------seg000:0x79ee------------------------------
sub_179EE proc near
    retn
sub_179EE endp
; ------------------------------seg000:0x85bd------------------------------
; ------------------------------seg000:0x85be------------------------------
sub_185BE proc near
    retn
sub_185BE endp
; ------------------------------seg000:0x86f5------------------------------
; ------------------------------seg000:0x86f8------------------------------
sub_186F8 proc near
    retn
sub_186F8 endp
; ------------------------------seg000:0x87e8------------------------------
; ------------------------------seg000:0x87ea------------------------------
sub_187EA proc near
    retn
sub_187EA endp
; ------------------------------seg000:0x89a8------------------------------
; ------------------------------seg000:0x89aa------------------------------
sub_189AA proc near
    retn
sub_189AA endp
; ------------------------------seg000:0x8a43------------------------------
; ------------------------------seg000:0x8a44------------------------------
sub_18A44 proc near
    retn
sub_18A44 endp
; ------------------------------seg000:0x8aa4------------------------------
; ------------------------------seg000:0x8aa6------------------------------
sub_18AA6 proc near
    retn
sub_18AA6 endp
; ------------------------------seg000:0x8df3------------------------------
; ------------------------------seg000:0x8df4------------------------------
sub_18DF4 proc near
    retn
sub_18DF4 endp
; ------------------------------seg000:0x8e36------------------------------
; ------------------------------seg000:0x8e38------------------------------
sub_18E38 proc near
    retn
sub_18E38 endp
; ------------------------------seg000:0x8e4f------------------------------
; ------------------------------seg000:0x94d0------------------------------
sub_194D0 proc near
    retn
sub_194D0 endp
; ------------------------------seg000:0x9579------------------------------
; ------------------------------seg000:0x957a------------------------------
sub_1957A proc near
    retn
sub_1957A endp
; ------------------------------seg000:0x9594------------------------------
; ------------------------------seg000:0x9595------------------------------
sub_19595 proc near
    retn
sub_19595 endp
; ------------------------------seg000:0x95c8------------------------------
; ------------------------------seg000:0x95c9------------------------------
_sub_195C9 proc near
    retn
_sub_195C9 endp
; ------------------------------seg000:0x9874------------------------------
; ------------------------------seg000:0x9875------------------------------
zoomIn proc near
    retn
zoomIn endp
; ------------------------------seg000:0x98b3------------------------------
; ------------------------------seg000:0x98b4------------------------------
zoomOut proc near
    retn
zoomOut endp
; ------------------------------seg000:0x98f9------------------------------
; ------------------------------seg000:0x98fa------------------------------
sub_198FA proc near
    retn
sub_198FA endp
; ------------------------------seg000:0x9914------------------------------
; ------------------------------seg000:0x9915------------------------------
sub_19915 proc near
    retn
sub_19915 endp
; ------------------------------seg000:0x9939------------------------------
; ------------------------------seg000:0x993a------------------------------
sub_1993A proc near
    retn
sub_1993A endp
; ------------------------------seg000:0x99eb------------------------------
; ------------------------------seg000:0x99ec------------------------------
sub_199EC proc near
    retn
sub_199EC endp
; ------------------------------seg000:0x9a4c------------------------------
; ------------------------------seg000:0x9a4d------------------------------
sub_19A4D proc near
    retn
sub_19A4D endp
; ------------------------------seg000:0x9ada------------------------------
; ------------------------------seg000:0x9adb------------------------------
sub_19ADB proc near
    retn
sub_19ADB endp
; ------------------------------seg000:0x9b97------------------------------
; ------------------------------seg000:0x9b98------------------------------
sub_19B98 proc near
    retn
sub_19B98 endp
; ------------------------------seg000:0x9be0------------------------------
; ------------------------------seg000:0x9be1------------------------------
sub_19BE1 proc near
    retn
sub_19BE1 endp
; ------------------------------seg000:0x9c0b------------------------------
; ------------------------------seg000:0x9c0c------------------------------
_sub_19C0C proc near
    retn
_sub_19C0C endp
; ------------------------------seg000:0x9c83------------------------------
; ------------------------------seg000:0x9c84------------------------------
sub_19C84 proc near
    retn
sub_19C84 endp
; ------------------------------seg000:0x9d85------------------------------
; ------------------------------seg000:0x9d86------------------------------
sub_19D86 proc near
    retn
sub_19D86 endp
; ------------------------------seg000:0x9daf------------------------------
; ------------------------------seg000:0x9db0------------------------------
sub_19DB0 proc near
    retn
sub_19DB0 endp
; ------------------------------seg000:0x9e43------------------------------
; ------------------------------seg000:0x9e94------------------------------
sub_19E94 proc near
    retn
sub_19E94 endp
; ------------------------------seg000:0x9eb5------------------------------
; ------------------------------seg000:0x9eb6------------------------------
sub_19EB6 proc near
    retn
sub_19EB6 endp
; ------------------------------seg000:0x9f46------------------------------
; ------------------------------seg000:0x9fad------------------------------
sub_19FAD proc near
    retn
sub_19FAD endp
; ------------------------------seg000:0x9fcb------------------------------
; ------------------------------seg000:0x9fcc------------------------------
_sub_19FCC proc near
    retn
_sub_19FCC endp
; ------------------------------seg000:0xa02f------------------------------
; ------------------------------seg000:0xa030------------------------------
sub_1A030 proc near
    retn
sub_1A030 endp
; ------------------------------seg000:0xa0ca------------------------------
; ------------------------------seg000:0xa0fe------------------------------
_draw2Strings proc near
    retn
_draw2Strings endp
; ------------------------------seg000:0xa139------------------------------
; ------------------------------seg000:0xa183------------------------------
_sub_1A183 proc near
    retn
_sub_1A183 endp
; ------------------------------seg000:0xa1b0------------------------------
; ------------------------------seg000:0xa1b1------------------------------
sub_1A1B1 proc near
    retn
sub_1A1B1 endp
; ------------------------------seg000:0xa1e3------------------------------
; ------------------------------seg000:0xa1e4------------------------------
tempStrcpy proc near
    retn
tempStrcpy endp
; ------------------------------seg000:0xa203------------------------------
; ------------------------------seg000:0xa204------------------------------
sub_1A204 proc near
    retn
sub_1A204 endp
; ------------------------------seg000:0xa223------------------------------
; ------------------------------seg000:0xa224------------------------------
sub_1A224 proc near
    retn
sub_1A224 endp
; ------------------------------seg000:0xa25a------------------------------
; ------------------------------seg000:0xa25c------------------------------
_sub_1A25C proc near
    retn
_sub_1A25C endp
; ------------------------------seg000:0xa73e------------------------------
; ------------------------------seg000:0xa740------------------------------
sub_1A740 proc near
    retn
sub_1A740 endp
; ------------------------------seg000:0xa7c3------------------------------
; ------------------------------seg000:0xa7c4------------------------------
sub_1A7C4 proc near
    retn
sub_1A7C4 endp
; ------------------------------seg000:0xa870------------------------------
; ------------------------------seg000:0xa872------------------------------
sub_1A872 proc near
    retn
sub_1A872 endp
; ------------------------------seg000:0xa8c7------------------------------
; ------------------------------seg000:0xa8c8------------------------------
_sub_1A8C8 proc near
    retn
_sub_1A8C8 endp
; ------------------------------seg000:0xa933------------------------------
; ------------------------------seg000:0xa934------------------------------
sub_1A934 proc near
    retn
sub_1A934 endp
; ------------------------------seg000:0xa961------------------------------
; ------------------------------seg000:0xa962------------------------------
sub_1A962 proc near
    retn
sub_1A962 endp
; ------------------------------seg000:0xa9bb------------------------------
; ------------------------------seg000:0xa9bc------------------------------
sub_1A9BC proc near
    retn
sub_1A9BC endp
; ------------------------------seg000:0xa9f7------------------------------
; ------------------------------seg000:0xa9f8------------------------------
sub_1A9F8 proc near
    retn
sub_1A9F8 endp
; ------------------------------seg000:0xb146------------------------------
; ------------------------------seg000:0xb147------------------------------
sub_1B147 proc near
    retn
sub_1B147 endp
; ------------------------------seg000:0xc1b8------------------------------
; ------------------------------seg000:0xc1b9------------------------------
sub_1C1B9 proc near
    retn
sub_1C1B9 endp
; ------------------------------seg000:0xc2f7------------------------------
; ------------------------------seg000:0xc2f8------------------------------
sub_1C2F8 proc near
    retn
sub_1C2F8 endp
; ------------------------------seg000:0xc370------------------------------
; ------------------------------seg000:0xc371------------------------------
sub_1C371 proc near
    retn
sub_1C371 endp
; ------------------------------seg000:0xc40a------------------------------
; ------------------------------seg000:0xc40b------------------------------
sub_1C40B proc near
    retn
sub_1C40B endp
; ------------------------------seg000:0xc487------------------------------
; ------------------------------seg000:0xc488------------------------------
sub_1C488 proc near
    retn
sub_1C488 endp
; ------------------------------seg000:0xc660------------------------------
; ------------------------------seg000:0xc661------------------------------
sub_1C661 proc near
    retn
sub_1C661 endp
; ------------------------------seg000:0xc6bd------------------------------
; ------------------------------seg000:0xc6be------------------------------
sub_1C6BE proc near
    retn
sub_1C6BE endp
; ------------------------------seg000:0xc7a1------------------------------
; ------------------------------seg000:0xc7a2------------------------------
sub_1C7A2 proc near
    retn
sub_1C7A2 endp
; ------------------------------seg000:0xc7c5------------------------------
; ------------------------------seg000:0xc7c6------------------------------
sub_1C7C6 proc near
    retn
sub_1C7C6 endp
; ------------------------------seg000:0xc7e9------------------------------
; ------------------------------seg000:0xc7ea------------------------------
sub_1C7EA proc near
    retn
sub_1C7EA endp
; ------------------------------seg000:0xc82c------------------------------
; ------------------------------seg000:0xc82d------------------------------
sub_1C82D proc near
    retn
sub_1C82D endp
; ------------------------------seg000:0xc863------------------------------
; ------------------------------seg000:0xc864------------------------------
sub_1C864 proc near
    retn
sub_1C864 endp
; ------------------------------seg000:0xc8a3------------------------------
; ------------------------------seg000:0xc8a4------------------------------
sub_1C8A4 proc near
    retn
sub_1C8A4 endp
; ------------------------------seg000:0xc8dd------------------------------
; ------------------------------seg000:0xc9d2------------------------------
sub_1C9D2 proc near
    retn
sub_1C9D2 endp
; ------------------------------seg000:0xcb41------------------------------
; ------------------------------seg000:0xcb42------------------------------
sub_1CB42 proc near
    retn
sub_1CB42 endp
; ------------------------------seg000:0xcf30------------------------------
; ------------------------------seg000:0xcf32------------------------------
sub_1CF32 proc near
    retn
sub_1CF32 endp
; ------------------------------seg000:0xcf63------------------------------
; ------------------------------seg000:0xcf64------------------------------
_sub_1CF64 proc near
    retn
_sub_1CF64 endp
; ------------------------------seg000:0xcf8d------------------------------
; ------------------------------seg000:0xcf8e------------------------------
sub_1CF8E proc near
    retn
sub_1CF8E endp
; ------------------------------seg000:0xcfa5------------------------------
; ------------------------------seg000:0xcfa6------------------------------
_sub_1CFA6 proc near
    retn
_sub_1CFA6 endp
; ------------------------------seg000:0xd007------------------------------
; ------------------------------seg000:0xd008------------------------------
_sub_1D008 proc near
    retn
_sub_1D008 endp
; ------------------------------seg000:0xd177------------------------------
; ------------------------------seg000:0xd178------------------------------
_sub_1D178 proc near
    retn
_sub_1D178 endp
; ------------------------------seg000:0xd18f------------------------------
; ------------------------------seg000:0xd190------------------------------
_sub_1D190 proc near
    retn
_sub_1D190 endp
; ------------------------------seg000:0xd1a4------------------------------
; ------------------------------seg000:0xd1c8------------------------------
sub_1D1C8 proc near
    retn
sub_1D1C8 endp
; ------------------------------seg000:0xd1e6------------------------------
; ------------------------------seg000:0xd1e8------------------------------
sub_1D1E8 proc near
    retn
sub_1D1E8 endp
; ------------------------------seg000:0xd1ff------------------------------
; ------------------------------seg000:0xd200------------------------------
sub_1D200 proc near
    retn
sub_1D200 endp
; ------------------------------seg000:0xd21d------------------------------
; ------------------------------seg000:0xd21e------------------------------
sub_1D21E proc near
    retn
sub_1D21E endp
; ------------------------------seg000:0xd25e------------------------------
; ------------------------------seg000:0xd260------------------------------
keyDispatch proc near
    retn
keyDispatch endp
; ------------------------------seg000:0xd9da------------------------------
; ------------------------------seg000:0xd9db------------------------------
selectMissile proc near
    retn
selectMissile endp
; ------------------------------seg000:0xda34------------------------------
; ------------------------------seg000:0xda35------------------------------
sub_1DA35 proc near
    retn
sub_1DA35 endp
; ------------------------------seg000:0xda5e------------------------------
; ------------------------------seg000:0xda5f------------------------------
sub_1DA5F proc near
    retn
sub_1DA5F endp
; ------------------------------seg000:0xda8c------------------------------
; ------------------------------seg000:0xda8d------------------------------
sub_1DA8D proc near
    retn
sub_1DA8D endp
; ------------------------------seg000:0xdaad------------------------------
; ------------------------------seg000:0xdaae------------------------------
sub_1DAAE proc near
    retn
sub_1DAAE endp
; ------------------------------seg000:0xdb2a------------------------------
; ------------------------------seg000:0xdb2b------------------------------
sub_1DB2B proc near
    retn
sub_1DB2B endp
; ------------------------------seg000:0xdb9b------------------------------
; ------------------------------seg000:0xdb9c------------------------------
sub_1DB9C proc near
    retn
sub_1DB9C endp
; ------------------------------seg000:0xdbb6------------------------------
; ------------------------------seg000:0xdbe0------------------------------
sub_1DBE0 proc near
    retn
sub_1DBE0 endp
; ------------------------------seg000:0xdbff------------------------------
; ------------------------------seg000:0xdd5e------------------------------
sub_1DD5E proc near
    retn
sub_1DD5E endp
; ------------------------------seg000:0xdd6e------------------------------
; ------------------------------seg000:0xdd7e------------------------------
sub_1DD7E proc near
    retn
sub_1DD7E endp
; ------------------------------seg000:0xdd91------------------------------
; ------------------------------seg000:0xdd92------------------------------
sub_1DD92 proc near
    retn
sub_1DD92 endp
; ------------------------------seg000:0xdda8------------------------------
; ------------------------------seg000:0xddaa------------------------------
sub_1DDAA proc near
    retn
sub_1DDAA endp
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
    retn
readFile1 endp
; ------------------------------seg000:0xdebe------------------------------
; ------------------------------seg000:0xdebf------------------------------
readFile2 proc near
    retn
readFile2 endp
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
    nop
loc_1DF35:
    pop ds
    retn
read512FromFileIntoBuf endp
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
    mov dx, 5D7Ah
    mov ah, 9
    int 21h ;DOS - PRINT STRING
loc_1DFB7:
    mov ax, 4C00h
    int 21h ;DOS - 2+ - QUIT WITH EXIT CODE (EXIT)
sub_1DF4F endp ;AL = exit code
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
    retn
sub_1E11C endp
; ------------------------------seg000:0xe1f7------------------------------
; ------------------------------seg000:0xe1f8------------------------------
sub_1E1F8 proc near
    retn
sub_1E1F8 endp
; ------------------------------seg000:0xe25f------------------------------
; ------------------------------seg000:0xe260------------------------------
nullsub_1 proc near
    retn
nullsub_1 endp
; ------------------------------seg000:0xe260------------------------------
; ------------------------------seg000:0xe262------------------------------
sub_1E262 proc near
    push es
    push ds
    pop es
    cld
    mov si, fileReadPos
    add si, 5D7Ch
    shr di, 1
    jnz short loc_1E275
    call sub_1E28C
loc_1E275:
    mov cx, 140h
    mov word_38D5E, cx
    mov di, 5FE8h
    call sub_1E309
    sub si, 5D7Ch
    mov fileReadPos, si
    pop es
    retn
sub_1E262 endp
; ------------------------------seg000:0xe28b------------------------------
; ------------------------------seg000:0xe28c------------------------------
sub_1E28C proc near
    retn ;sp-analysis failed
sub_1E28C endp
; ------------------------------seg000:0xe2d0------------------------------
; ------------------------------seg000:0xe2d3------------------------------
sub_1E2D3 proc near
    retn
sub_1E2D3 endp
; ------------------------------seg000:0xe308------------------------------
; ------------------------------seg000:0xe309------------------------------
sub_1E309 proc near
    retn
sub_1E309 endp
; ------------------------------seg000:0xe381------------------------------
; ------------------------------seg000:0xe382------------------------------
sub_1E382 proc near
    retn ;sp-analysis failed
sub_1E382 endp
; ------------------------------seg000:0xe42e------------------------------
; ------------------------------seg000:0xe432------------------------------
start proc near
    retn ;sp-analysis failed
start endp
; ------------------------------seg000:0xe4e0------------------------------
; ------------------------------seg000:0xe4e4------------------------------
__cinit proc near
    retn
__cinit endp
; ------------------------------seg000:0xe5a7------------------------------
; ------------------------------seg000:0xe5a8------------------------------
_exit proc near
    retn
_exit endp
; ------------------------------seg000:0xe5bd------------------------------
; ------------------------------seg000:0xe5bf------------------------------
__exit proc near
    retn ;AL = exit code
__exit endp
; ------------------------------seg000:0xe602------------------------------
; ------------------------------seg000:0xe604------------------------------
__ctermsub proc near
    retn
__ctermsub endp
; ------------------------------seg000:0xe630------------------------------
; ------------------------------seg000:0xe631------------------------------
sub_1E631 proc near
    retn
sub_1E631 endp
; ------------------------------seg000:0xe63f------------------------------
; ------------------------------seg000:0xe640------------------------------
sub_1E640 proc near
    retn
sub_1E640 endp
; ------------------------------seg000:0xe652------------------------------
; ------------------------------seg000:0xe654------------------------------
__chkstk proc near
    retn
__chkstk endp
; ------------------------------seg000:0xe667------------------------------
; ------------------------------seg000:0xe66a------------------------------
_fclose proc near
    retn
_fclose endp
; ------------------------------seg000:0xe723------------------------------
; ------------------------------seg000:0xe724------------------------------
_fopen proc near
    retn
_fopen endp
; ------------------------------seg000:0xe74a------------------------------
; ------------------------------seg000:0xe74c------------------------------
_fread proc near
    retn
_fread endp
; ------------------------------seg000:0xe931------------------------------
; ------------------------------seg000:0xe932------------------------------
_lseek proc near
    retn
_lseek endp
; ------------------------------seg000:0xe9a9------------------------------
; ------------------------------seg000:0xe9ac------------------------------
_strcat proc near
    retn
_strcat endp
; ------------------------------seg000:0xe9ea------------------------------
; ------------------------------seg000:0xe9ec------------------------------
_strcpy proc near
    retn
_strcpy endp
; ------------------------------seg000:0xea1d------------------------------
; ------------------------------seg000:0xea1e------------------------------
_strlen proc near
    retn
_strlen endp
; ------------------------------seg000:0xea38------------------------------
; ------------------------------seg000:0xea3a------------------------------
_itoa proc near
    retn
_itoa endp
; ------------------------------seg000:0xea52------------------------------
; ------------------------------seg000:0xea56------------------------------
_kbhit proc near
    retn
_kbhit endp
; ------------------------------seg000:0xea65------------------------------
; ------------------------------seg000:0xea66------------------------------
_getche proc near
    retn
_getche endp
; ------------------------------seg000:0xea68------------------------------
; ------------------------------seg000:0xea6a------------------------------
_getch proc near
    retn
_getch endp
; ------------------------------seg000:0xea80------------------------------
; ------------------------------seg000:0xea82------------------------------
_int86 proc near
    retn
_int86 endp
; ------------------------------seg000:0xeaff------------------------------
; ------------------------------seg000:0xeb00------------------------------
_movedata proc near
    retn
_movedata endp
; ------------------------------seg000:0xeb1d------------------------------
; ------------------------------seg000:0xeb1e------------------------------
_segread proc near
    retn
_segread endp
; ------------------------------seg000:0xeb32------------------------------
; ------------------------------seg000:0xeb34------------------------------
_outp proc near
    retn
_outp endp
; ------------------------------seg000:0xeb41------------------------------
; ------------------------------seg000:0xeb42------------------------------
_strupr proc near
    retn
_strupr endp
; ------------------------------seg000:0xeb63------------------------------
; ------------------------------seg000:0xeb64------------------------------
_memcpy proc near
    retn
_memcpy endp
; ------------------------------seg000:0xeb8f------------------------------
; ------------------------------seg000:0xeb90------------------------------
_abs proc near
    retn
_abs endp
; ------------------------------seg000:0xeba4------------------------------
; ------------------------------seg000:0xeba6------------------------------
_labs proc near
    retn
_labs endp
; ------------------------------seg000:0xebc6------------------------------
; ------------------------------seg000:0xebc8------------------------------
_srand proc near
    retn
_srand endp
; ------------------------------seg000:0xebd8------------------------------
; ------------------------------seg000:0xebda------------------------------
_rand proc near
    retn
_rand endp
; ------------------------------seg000:0xebff------------------------------
; ------------------------------seg000:0xec00------------------------------
__bios_keybrd proc near
    retn
__bios_keybrd endp
; ------------------------------seg000:0xec13------------------------------
; ------------------------------seg000:0xec14------------------------------
__aNldiv proc near
    retn
__aNldiv endp
; ------------------------------seg000:0xecad------------------------------
; ------------------------------seg000:0xecb0------------------------------
__aNlmul proc near
    retn
__aNlmul endp
; ------------------------------seg000:0xece1------------------------------
; ------------------------------seg000:0xece4------------------------------
unknown_libname_1 proc near
    retn
unknown_libname_1 endp
; ------------------------------seg000:0xed00------------------------------
; ------------------------------seg000:0xed04------------------------------
unknown_libname_2 proc near
    retn
unknown_libname_2 endp
; ------------------------------seg000:0xed20------------------------------
; ------------------------------seg000:0xed24------------------------------
__aNuldiv proc near
    retn
__aNuldiv endp
; ------------------------------seg000:0xed82------------------------------
; ------------------------------seg000:0xed86------------------------------
__FF_MSGBANNER proc near
    retn
__FF_MSGBANNER endp
; ------------------------------seg000:0xeda5------------------------------
; ------------------------------seg000:0xedac------------------------------
__nullcheck proc near
    retn
__nullcheck endp
; ------------------------------seg000:0xedcd------------------------------
; ------------------------------seg000:0xedce------------------------------
__NMSG_TEXT proc near
    retn
__NMSG_TEXT endp
; ------------------------------seg000:0xedf6------------------------------
; ------------------------------seg000:0xedf9------------------------------
__NMSG_WRITE proc near
    retn
__NMSG_WRITE endp
; ------------------------------seg000:0xee1f------------------------------
; ------------------------------seg000:0xee42------------------------------
__maperror proc near
    retn
__maperror endp
; ------------------------------seg000:0xee47------------------------------
; ------------------------------seg000:0xee48------------------------------
sub_1EE48 proc near
    retn
sub_1EE48 endp
; ------------------------------seg000:0xee74------------------------------
; ------------------------------seg000:0xee76------------------------------
__filbuf proc near
    retn
__filbuf endp
; ------------------------------seg000:0xef35------------------------------
; ------------------------------seg000:0xef36------------------------------
__freebuf proc near
    retn
__freebuf endp
; ------------------------------seg000:0xef62------------------------------
; ------------------------------seg000:0xef64------------------------------
__openfile proc near
    retn
__openfile endp
; ------------------------------seg000:0xf05b------------------------------
; ------------------------------seg000:0xf05c------------------------------
_fflush proc near
    retn
_fflush endp
; ------------------------------seg000:0xf0c9------------------------------
; ------------------------------seg000:0xf0ca------------------------------
__getstream proc near
    retn
__getstream endp
; ------------------------------seg000:0xf103------------------------------
; ------------------------------seg000:0xf104------------------------------
_close proc near
    retn
_close endp
; ------------------------------seg000:0xf121------------------------------
; ------------------------------seg000:0xf124------------------------------
_read proc near
    retn
_read endp
; ------------------------------seg000:0xf1ff------------------------------
; ------------------------------seg000:0xf262------------------------------
_remove proc near
    retn
_remove endp
; ------------------------------seg000:0xf26c------------------------------
; ------------------------------seg000:0xf270------------------------------
__aNlshl proc near
    retn
__aNlshl endp
; ------------------------------seg000:0xf27a------------------------------
; ------------------------------seg000:0xf27c------------------------------
__aNlshr proc near
    retn
__aNlshr endp
; ------------------------------seg000:0xf286------------------------------
; ------------------------------seg000:0xf288------------------------------
__getbuf proc near
    retn
__getbuf endp
; ------------------------------seg000:0xf2f3------------------------------
; ------------------------------seg000:0xf2f4------------------------------
_open proc near
    retn
_open endp
; ------------------------------seg000:0xf485------------------------------
; ------------------------------seg000:0xf487------------------------------
__cXENIXtoDOSmode proc near
    retn
__cXENIXtoDOSmode endp
; ------------------------------seg000:0xf497------------------------------
; ------------------------------seg000:0xf498------------------------------
_write proc near
    retn
_write endp
; ------------------------------seg000:0xf53b------------------------------
; ------------------------------seg000:0xf53e------------------------------
sub_1F53E proc near
    retn ;sp-analysis failed
sub_1F53E endp
; ------------------------------seg000:0xf589------------------------------
; ------------------------------seg000:0xf5c0------------------------------
unknown_libname_3 proc near
    retn
unknown_libname_3 endp
; ------------------------------seg000:0xf5d1------------------------------
; ------------------------------seg000:0xf5d2------------------------------
unknown_libname_4 proc near
    retn
unknown_libname_4 endp
; ------------------------------seg000:0xf617------------------------------
; ------------------------------seg000:0xf618------------------------------
_flushall proc near
    retn
_flushall endp
; ------------------------------seg000:0xf649------------------------------
; ------------------------------seg000:0xf64a------------------------------
_stackavail proc near
    retn ;sp-analysis failed
_stackavail endp
; ------------------------------seg000:0xf65a------------------------------
; ------------------------------seg000:0xf65f------------------------------
__amalloc proc near
    retn
__amalloc endp
; ------------------------------seg000:0xf741------------------------------
; ------------------------------seg000:0xf742------------------------------
__amexpand proc near
    retn
__amexpand endp
; ------------------------------seg000:0xf77b------------------------------
; ------------------------------seg000:0xf77c------------------------------
__amlink proc near
    retn
__amlink endp
; ------------------------------seg000:0xf79d------------------------------
; ------------------------------seg000:0xf79e------------------------------
__amallocbrk proc near
    retn
__amallocbrk endp
; ------------------------------seg000:0xf7bc------------------------------
; ------------------------------seg000:0xf7be------------------------------
_brkctl proc near
    retn
_brkctl endp
; ------------------------------seg000:0xf82b------------------------------
; ------------------------------seg000:0xf82c------------------------------
sub_1F82C proc near
    retn
sub_1F82C endp
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
; ------------------------------seg002:0xa------------------------------
sub_21A7A proc far
    retn
sub_21A7A endp
; ------------------------------seg002:0xd------------------------------
; ------------------------------seg002:0x12------------------------------
sub_21A82 proc far
    retn
sub_21A82 endp
; ------------------------------seg002:0x15------------------------------
; ------------------------------seg002:0x16------------------------------
sub_21A86 proc near
    retn
sub_21A86 endp
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
    call far ptr gfx_jump_1d
    mov word_37C1C, ax
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
word_33402 dw 0
word_33404 dw 0
word_33406 dw 0
unk_33408 db 0
byte_33409 db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
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
_noJoy80 db 0
noJoy80_2 db 0
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
    db 0FFh
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
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
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
    db 0 ;align 2
    db 1
byte_380DD db 0
    db 0 ;align 4
    db 0
word_380E0 dw 0
word_380E2 dw 0
_a256left_pic db '256Left.Pic',0
_a256right_pic db '256Right.Pic',0
_a256rear_pic db '256Rear.Pic',0
_aLeft_pic db 'Left.Pic',0
_aRight_pic db 'Right.Pic',0
_aRear_pic db 'Rear.Pic',0
    db 0 ;align 2
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
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
; ==============================================================================
.DATA?
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
    db ? ;align 4
    db ?
word_38FCC dw ?
word_38FCE dw ?
    db ?
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
_word_391FE dw ?
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
    db ?
    db ?
    db ?
    db ?
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
byte_3BF93 db ?
    db ?
unk_3BF95 db ?
unk_3BF96 db ?
    db ?
unk_3BF98 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
word_3BFA0 dw ?
word_3BFA2 dw ?
_byte_3BFA4 db 64h dup(?)
_word_3C008 dw ?
word_3C00A dw ?
_word_3C00C dw ?
word_3C00E dw ?
_flagFarToNear dw ?
word_3C012 dw ?
word_3C014 dw ?
word_3C016 dw ?
word_3C018 dw ?
word_3C01A dw ?
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
_matrix3dt_2 dw 0A0h dup(?)
_byte_3C5A0 db ?
    db ?
word_3C5A2 dw ?
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
END
