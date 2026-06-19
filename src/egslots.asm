.8086
DOSSEG
.MODEL SMALL

SREGS		struc ;	(sizeof=0x8, align=0x2,	copyof_10) ; XREF: load15Flt3d3/r
					; load3D3/r
_es		dw ?
_cs		dw ?
_ss		dw ?
_ds		dw ?			; XREF:	load3D3+13E/r load3D3+399/r ...
SREGS		ends
ViewSnapshot		struc ;	(sizeof=0x10, mappedto_11) ; XREF: dseg:stru_3A95A/r
field_0		dd ?			; XREF:	stepFlightModel+1198/w
					; stepFlightModel+119C/w
field_4		dd ?			; XREF:	stepFlightModel+11A7/w
					; stepFlightModel+11AB/w
field_8		dw ?			; XREF:	stepFlightModel+11B2/w
field_A		dw ?			; XREF:	stepFlightModel+117F/w
					; stepFlightModel+121D/r
field_C		dw ?			; XREF:	stepFlightModel+1186/w
					; stepFlightModel+1227/r
field_E		dw ?			; XREF:	stepFlightModel+118D/w
ViewSnapshot		ends
Projectile		struc ;	(sizeof=0x18, mappedto_12) ; XREF: dseg:stru_335C4/r
field_0		dw ?
field_2		dw ?
field_4		dw ?
field_6		dw ?
field_8		dw ?
field_A		dw ?
field_C		dw ?
field_E		dw ?
field_10	db 8 dup(?)
Projectile		ends
SimObject		struc ;	(sizeof=0x24, mappedto_13) ; XREF: dseg:stru_3B208/r
field_0		dw ?
field_2		dd ?
field_6		dd ?
field_A		db 26 dup(?)		; XREF:	updateFrame+DA8/r	updateFrame+DB0/r	...
SimObject		ends
MapTarget		struc ;	(sizeof=0x10, mappedto_14) ; XREF: dseg:g_planes/r
field_0		dw ?			; XREF:	updateTracerParticles+60/r findWaypointFeatures+60/r ...
field_2		dw ?			; XREF:	updateTracerParticles+68/r findWaypointFeatures+40/r ...
field_4		dw ?
field_6		dw ?			; XREF:	updateFrame+D7F/r
					; stepFlightModel+6C/r	...
field_8		db 4 dup(?)		; XREF:	updateFrame+D77/r
field_C		dw ?			; XREF:	placeString+A/r	placeString+43/r ...
field_E		dw ?
MapTarget		ends
Waypoint	struc ;	(sizeof=0x4, mappedto_15) ; XREF: dseg:waypoints/r
field_0		dw ?
field_2		dw ?
Waypoint	ends
Missile		struc ;	(sizeof=0x1A, mappedto_16) ; XREF: dseg:missiles/r
field_0		db 10 dup(?)		; string(C)
field_A		db 12 dup(?)		; string(C)
field_16	dw ?
field_18	dw ?
Missile		ends
Sam		struc ;	(sizeof=0x12, mappedto_17) ; XREF: dseg:sams/r
field_0		db 8 dup(?)		; string(C)
field_8		dw ?
field_A		dw ?
field_C		dw ?
field_E		dw ?
field_10	dw ?
Sam		ends
MissileSpec	struc ;	(sizeof=0x4, mappedto_18) ; XREF: dseg:missleSpec/r
weaponIdx		dw ?
ammo		dw ?
MissileSpec	ends
struc_9		struc ;	(sizeof=0x8, mappedto_19) ; XREF: dseg:stru_33402/r
field_0		dw ?
field_2		dw ?
field_4		dw ?
field_6		dw ?
struc_9		ends
DOS_SET_IRQH	 = 25h
PORT_PIT_TIME0	 = 40h
PORT_PIT_CNTRL	 = 43h
COMM_GFXOVL_SEG	 = 1Ah
COMM_SNDOVL_SEG	 = 1Ch
COMM_MISCOVL_SEG  = 1Eh
COMM_GFXBUF_PTR	 = 20h
COMM_HERC_FLAG	 = 24h
COMM_SETUP_DONE_OFFSET	= 26h
COMM_SETUP_GFXMODE_OFFSET  = 30h
COMM_UNK7	 = 38h ; weaponType
COMM_JOYDATA_OFF  = 48h
COMM_USEJOY_OFF	 = 72h
COMM_GFXMODE_OFFSET  = 78h
COMM_WORLDBUF	 = 7Ah
OFF_IACA_START	 = 4F0h
COMM_GAMEDATA_OFFSET  =	120Eh
IRQ_CBREAK	 = 1Bh
GAMEDATA_THEATER  = 38h
GAMEDATA_DIFFICULTY  = 3Eh
GAMEDATA_UNK4	 = 40h
WAYPT_PRIMARY	 = 1
WAYPT_SECONDARY	 = 2
WAYPT_BASE	 = 3
IRQ_VIDEO	 = 10h
OVL_HDR_CODESEG	 = 18h
OVL_HDR_FIRSTIDX  = 1Ch
OVL_HDR_SLOTCOUNT  = 22h
OVL_HDR_FIRSTPTR  = 24h

PUBLIC _byte_37FEC
PUBLIC _byte_380DD
PUBLIC _joyAxes_2
PUBLIC _unk_38092
PUBLIC _unk_38FD0
PUBLIC _word_38080
PUBLIC _word_38084
PUBLIC _word_3808C
PUBLIC _word_38090
PUBLIC _word_3809A
PUBLIC _word_3809C
PUBLIC _word_380A0
PUBLIC _word_380A2
PUBLIC _word_380A4
PUBLIC _word_380A6
PUBLIC _word_380AA
PUBLIC _word_380AC
PUBLIC _byte_3419A
PUBLIC _byte_3419C
PUBLIC _var_568
PUBLIC _strBuf
PUBLIC byte_37C2D
PUBLIC byte_37C2E
PUBLIC byte_37C35
PUBLIC byte_37C3A
PUBLIC var_468
PUBLIC byte_37EEE
PUBLIC byte_37EEF
PUBLIC unk_37565
PUBLIC word_37B26
PUBLIC word_37B2E
PUBLIC word_37B30
PUBLIC word_37B3C
PUBLIC word_37B44
PUBLIC word_37B52
PUBLIC word_37B5A
PUBLIC word_37B5C
PUBLIC word_37B68
PUBLIC word_37B70
PUBLIC word_37B82
PUBLIC word_37B84
PUBLIC word_37BA2
PUBLIC word_37BC0
PUBLIC word_37BDE
PUBLIC word_37C25
PUBLIC word_37C27
PUBLIC word_37C29
PUBLIC word_37C2B
PUBLIC word_37C30
PUBLIC word_37C32
PUBLIC word_37C36
PUBLIC word_37EF0
PUBLIC word_37EF2
PUBLIC word_37F50
PUBLIC word_37F52
PUBLIC word_37F54
PUBLIC word_37F56
PUBLIC word_37F58
PUBLIC word_37F5A
PUBLIC word_37F5C
PUBLIC word_37F5E
PUBLIC word_37F60
PUBLIC word_37F62
PUBLIC _var_190
PUBLIC _var_383
PUBLIC _var_456
PUBLIC _byte_37C24
PUBLIC _g_viewZ
PUBLIC _uvar_547
PUBLIC _var_200
PUBLIC _var_201
PUBLIC _word_3B7E2
PUBLIC _word_3B7EC
PUBLIC _origCBreakSeg
PUBLIC _word_34684
PUBLIC _word_34686
PUBLIC _word_34868
PUBLIC _word_34A4C
PUBLIC _var_143
PUBLIC _word_3B7E0
PUBLIC _word_3B7E4
PUBLIC _word_3B7E6
PUBLIC _word_3B7E8
PUBLIC _word_3B7EA
PUBLIC _word_33B9C
PUBLIC _word_33BA2
PUBLIC _var_198
PUBLIC _byte_3419F
PUBLIC _var_83
PUBLIC _var_279
PUBLIC _var_282
PUBLIC _var_134
PUBLIC _commData
PUBLIC _joyAxes
PUBLIC _audio_setEnginePitch
PUBLIC _audio_setup
PUBLIC _audio_shutdown
PUBLIC _audio_playSound
PUBLIC _audio_playSample
PUBLIC _audio_engineDroneOn
PUBLIC _audio_engineDroneOff
PUBLIC word_37B7E
PUBLIC word_37B9C
PUBLIC word_37BBA
PUBLIC word_37BD8
PUBLIC word_37BF7
PUBLIC byte_37BF9
PUBLIC word_37BFA
PUBLIC byte_37BFC
PUBLIC word_37BFD
PUBLIC word_37BFF
PUBLIC byte_37BF6
PUBLIC word_37C01
PUBLIC word_37C03
PUBLIC word_37C05
PUBLIC word_37C07
PUBLIC word_37C09
PUBLIC word_37C0B
PUBLIC word_37C0D
PUBLIC word_37C0F
PUBLIC word_37C11
PUBLIC byte_37C13
PUBLIC word_37C14
PUBLIC word_37C16
PUBLIC word_37C18
PUBLIC word_37C1A
PUBLIC word_37C1C
PUBLIC word_37C1E
PUBLIC word_37C20
PUBLIC word_37C22
PUBLIC word_37B34
PUBLIC word_37B36
PUBLIC word_37B32
PUBLIC word_37B48
PUBLIC word_37B5E
PUBLIC word_37B74
PUBLIC word_37B46
PUBLIC word_37B4E
PUBLIC word_37B50
PUBLIC word_37B9E
PUBLIC word_37BA0
PUBLIC word_37BA4
PUBLIC word_37BA6
PUBLIC word_37BA8
PUBLIC word_37BAA
PUBLIC word_37B86
PUBLIC word_37B88
PUBLIC word_37B8A
PUBLIC word_37B8C
PUBLIC word_37B60
PUBLIC word_37B64
PUBLIC word_37B66
PUBLIC word_37B72
PUBLIC byte_37F9A
PUBLIC word_37F9B
PUBLIC byte_37F9D
PUBLIC byte_37F9E
PUBLIC byte_37F9F
PUBLIC _byte_3790C
PUBLIC _misc_getKey
PUBLIC _unk_34121
PUBLIC _word_33BAE
PUBLIC _word_33DD0
PUBLIC _word_34186
PUBLIC _word_3419C
PUBLIC _word_339B4
PUBLIC _g_planes
PUBLIC _gfx_setColor
PUBLIC _gfx_nop23
PUBLIC _unk_38128
PUBLIC _word_38202
PUBLIC _word_3AA5C
PUBLIC _waypoints
PUBLIC _gfx_allocPage
PUBLIC _gfx_drawString
PUBLIC _gfx_initOverlay
PUBLIC _gfx_copyRect
PUBLIC _gfx_getDisplayPage
PUBLIC _gfx_setFadeSteps
PUBLIC _gfx_getModecode
PUBLIC _gfx_setDac
PUBLIC _gfx_waitRetrace
PUBLIC _gfx_flipPage
PUBLIC _gfx_storeBufPtr
PUBLIC _gfx_getModeFlag
PUBLIC _gfx_setDacAnimCount
PUBLIC _gfx_setMonoFlag
PUBLIC _mapEvents
PUBLIC _var_567
PUBLIC _var_605
PUBLIC _var_606
PUBLIC _var_608
PUBLIC _var_609
PUBLIC _var_610
PUBLIC _var_687
PUBLIC _var_688
PUBLIC _var_689
PUBLIC _var_690
PUBLIC _var_692
PUBLIC _var_694
PUBLIC _var_697
PUBLIC _var_699
PUBLIC _var_700
PUBLIC aF15dgtl_bin
PUBLIC aFileClosingError
PUBLIC aFileNotFound
PUBLIC aNoFileBuffersAvailabl
PUBLIC aOpenError
PUBLIC audio_timerTick
PUBLIC audio_noiseTick
PUBLIC byte_36D86
PUBLIC byte_37116
PUBLIC byte_378FC
PUBLIC byte_37903
PUBLIC byte_38D61
PUBLIC byte_38D63
PUBLIC dacValues
PUBLIC dacValues1
PUBLIC f15dgtlAddr
PUBLIC fileReadPos
PUBLIC gfx_clearPage
PUBLIC gfx_clearVga
PUBLIC gfx_copyRow
PUBLIC gfx_dacAnimate
PUBLIC gfx_dacCycle
PUBLIC gfx_fillRow
PUBLIC gfx_getFreeMem
PUBLIC gfx_getPageSeg
PUBLIC gfx_getRowOffset
PUBLIC gfx_setBlitOffset2
PUBLIC gfx_setOvlVal1
PUBLIC gfx_setOvlVal2
PUBLIC origCBreakOfs
PUBLIC origCBreakSeg
PUBLIC otherDacValues
PUBLIC ovlInsaneFlag
PUBLIC picDecodedRowBuf
PUBLIC rowOffset
PUBLIC strBuf
PUBLIC timerHandlerInstalled
PUBLIC tmpFileHandle
PUBLIC tmpPageIndex
PUBLIC word_37146
PUBLIC word_37148
PUBLIC word_378F0
PUBLIC word_378F2
PUBLIC word_378F4
PUBLIC word_378F6
PUBLIC word_378F8
PUBLIC word_378FA
PUBLIC word_378FD
PUBLIC word_378FF
PUBLIC word_37901
PUBLIC word_37904
PUBLIC word_37906
PUBLIC word_389D8
PUBLIC word_389E0
PUBLIC word_38D5C
PUBLIC word_38D5E
PUBLIC word_38D66

.DATA ;dseg segment para public 'DATA' use16

aF15dgtl_bin db 'F15DGTL.BIN',0
f15dgtlAddr dw 0
    db 1
    db 2 dup(0)
unk_32977 db 0
    db 2 dup(0)
    db 3Fh
    db 1
    db 0C7h
    db 3 dup(0)
    db 0Fh
    db 0
    db 4
    db 7 dup(0)
_word_3298A label byte
PUBLIC _word_32990
_word_32990 label byte
    db 2 dup(0)
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
    db 5 dup(0)
ovlInsaneFlag db 0
aErrorReleasingOverlay db 'Error releasing overlay memory$'
    db 0
    _waypoints Waypoint 4 dup(<0>)
; residual inter-table padding bytes from the original layout; the
; aNone/aircraftTypes/sams/missleSpec/missiles arrays that surrounded them are
; now defined in egdata.c.
    db 3
    db 0
    db 1
    db 0
; var_83: weapon/target compatibility matrix, var_83[weaponIdx*13 + (byte_3BFA4[..]&0xf)]
; (missileTargetCompat, egtacmap.c). 20 weapons x 13 target categories, 260 bytes, ending at
; word_333D2. Rows w0/w1 (Sidewinder/AMRAAM) and w16/w17/w19 are zero; type-1 weapons don't use it.
_var_83 label byte
    db 33 dup(0)
    db 2
    db 6
    db 2
    db 0
    db 2
    db 5
    db 25 dup(0)
    db 6
    db 2
    db 1
    db 2 dup(2)
    db 3
    db 4
    db 2 dup(3)
    db 3 dup(4)
    db 1
    db 2
    db 4
    db 1
    db 2
    db 4
    db 2 dup(5)
    db 2 dup(4)
    db 5
    db 2 dup(4)
    db 1
    db 3
    db 2 dup(0)
    db 2 dup(4)
    db 2 dup(0)
    db 2 dup(5)
    db 2 dup(4)
    db 5
    db 0
    db 4
    db 0
    db 8
    db 2 dup(0)
    db 2
    db 1
    db 7 dup(0)
    db 3
    db 1
    db 3
    db 4
    db 2 dup(1)
    db 4
    db 2
    db 2 dup(3)
    db 4
    db 0
    db 3
    db 0
    db 1
    db 2 dup(4)
    db 2 dup(0)
    db 4
    db 0
    db 2
    db 0
    db 4
    db 2 dup(0)
    db 2 dup(1)
    db 2 dup(4)
    db 2 dup(1)
    db 5 dup(4)
    db 1
    db 3
    db 2
    db 0
    db 2 dup(4)
    db 0
    db 2
    db 5
    db 2 dup(3)
    db 2
    db 5
    db 1
    db 3
    db 4
    db 2 dup(0)
    db 6
    db 0
    db 5
    db 3 dup(0)
    db 4
    db 0
    db 5
    db 2
    db 1
    db 0
    db 6
    db 4
    db 2 dup(0)
    db 2 dup(6)
    db 3
    db 2 dup(6)
    db 0
    db 3
    db 0
    db 6
    db 0
    db 3
    db 2 dup(0)
    db 2
    db 3
    db 2 dup(0)
    db 3
    db 28 dup(0)
    db 3
    db 0
    db 2 dup(4)
    db 0
    db 2
    db 2 dup(4)
    db 3
    db 4
    db 5
    db 0
    db 3
    db 13 dup(0)
word_333D2 label word
_mapEvents equ word_333D2
    dw 0                ; mapEvents[0].mapX
    dw 0                ; mapEvents[0].mapY (was word_333D4)
    db 2 dup(0)         ; mapEvents[0].field_4
    dw 0                ; mapEvents[0].type (was word_333D8)
    dw 0                ; mapEvents[0].ttl  (was word_333DA)
    db 38 dup(0)
    db 0
_gfx_allocPage proc near                    ; slot 0x00
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_allocPage endp
PUBLIC gfx_fillDirty
gfx_fillDirty proc near                     ; slot 0x01
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_fillDirty endp
PUBLIC gfx_blitTransparent
gfx_blitTransparent proc near               ; slot 0x03
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_blitTransparent endp
PUBLIC gfx_blitVariant
gfx_blitVariant proc near                   ; slot 0x04
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_blitVariant endp
PUBLIC gfx_copyBlock
gfx_copyBlock proc near                     ; slot 0x05
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_copyBlock endp
_gfx_drawString proc near                   ; slot 0x06
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_drawString endp
PUBLIC gfx_drawStringUnclipped
gfx_drawStringUnclipped proc near           ; slot 0x07
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_drawStringUnclipped endp
    db 0EAh, 4 dup(0)                       ; slot 0x08
    db 0EAh, 4 dup(0)                       ; slot 0x09
    db 0EAh, 4 dup(0)                       ; slot 0x0A
    db 0EAh, 4 dup(0)                       ; slot 0x0B
PUBLIC gfx_complexRender
gfx_complexRender proc near                 ; slot 0x0C
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_complexRender endp
_gfx_initOverlay proc near                  ; slot 0x0D
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_initOverlay endp
PUBLIC gfx_setPage1
gfx_setPage1 proc near                      ; slot 0x0E
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_setPage1 endp
gfx_setPageN proc near                      ; slot 0x0F
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_setPageN endp
    PUBLIC _gfx_setPageN
    PUBLIC _gfx_setCurPageSeg
_gfx_setPageN equ gfx_setPageN
PUBLIC gfx_setCurPageSeg
PUBLIC gfx_getCurPageSeg
gfx_setCurPageSeg proc near                 ; slot 0x10
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_setCurPageSeg equ gfx_setCurPageSeg
gfx_setCurPageSeg endp
gfx_getCurPageSeg proc near                ; slot 0x11
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_getCurPageSeg endp
    db 0EAh, 4 dup(0)                       ; slot 0x12
PUBLIC gfx_blitCore
gfx_blitCore proc near                      ; slot 0x13
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_blitCore endp
    db 0EAh, 4 dup(0)                       ; slot 0x14
    db 0EAh, 4 dup(0)                       ; slot 0x15
    db 0EAh, 4 dup(0)                       ; slot 0x16
    db 0EAh, 4 dup(0)                       ; slot 0x17
    db 0EAh, 4 dup(0)                       ; slot 0x18
gfx_setBlitOffset2 proc near                ; slot 0x19
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_setBlitOffset2 endp
PUBLIC _gfx_setBlitOffset2
_gfx_setBlitOffset2 equ gfx_setBlitOffset2   ; underscore alias for C caller (rasterize3DWorld)
PUBLIC gfx_setBlitOffset3
gfx_setBlitOffset3 proc near                ; slot 0x1A
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_setBlitOffset3 endp
gfx_setBlitOffset proc near                 ; slot 0x1B
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_setBlitOffset endp
    PUBLIC _gfx_setBlitOffset
_gfx_setBlitOffset equ gfx_setBlitOffset
PUBLIC gfx_setBlitOffsetReg
gfx_setBlitOffsetReg proc near                    ; slot 0x1C
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_setBlitOffsetReg endp
PUBLIC gfx_getPresetOffset1
gfx_getPresetOffset1 proc near                 ; slot 0x1D
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_getPresetOffset1 endp
PUBLIC gfx_getPresetOffset2
gfx_getPresetOffset2 proc near                   ; slot 0x1E
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_getPresetOffset2 endp
    db 0EAh, 4 dup(0)                       ; slot 0x1F
PUBLIC gfx_drawLine
gfx_drawLine proc near                      ; slot 0x20
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_drawLine endp
PUBLIC gfx_setDrawColor
gfx_setDrawColor proc near                 ; slot 0x21
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_setDrawColor endp
_gfx_setColor proc near                     ; slot 0x22
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_setColor endp
PUBLIC gfx_nop22
gfx_nop22 proc near               ; slot 0x23
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_nop22 endp
_gfx_nop23 proc near             ; slot 0x24
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_nop23 endp
gfx_plotPixel proc near                         ; slot 0x25
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_plotPixel endp
PUBLIC gfx_dirtyRect
gfx_dirtyRect proc near                     ; slot 0x26
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_dirtyRect endp
    db 0EAh, 4 dup(0)                       ; slot 0x27
    db 0EAh, 4 dup(0)                       ; slot 0x28
PUBLIC gfx_dirtyRect2
gfx_dirtyRect2 proc near                    ; slot 0x29
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_dirtyRect2 endp
PUBLIC _gfx_switchColor
_gfx_switchColor proc near                  ; slot 0x2A
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_switchColor endp
_gfx_copyRect proc near                     ; slot 0x2B
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_copyRect endp
gfx_clearVga proc near                     ; slot 0x2C
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_clearVga endp
gfx_dacAnimate proc near                    ; slot 0x2D
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_dacAnimate endp
gfx_getDisplayPage proc near               ; slot 0x2E
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_getDisplayPage endp
PUBLIC gfx_getDisplayPage
_gfx_getDisplayPage equ gfx_getDisplayPage
gfx_dacCycle proc near                     ; slot 0x2F
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_dacCycle endp
    db 0EAh, 4 dup(0)                       ; slot 0x30
    db 0EAh, 4 dup(0)                       ; slot 0x31
    db 0EAh, 4 dup(0)                       ; slot 0x32
gfx_getFreeMem proc near                     ; slot 0x33
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_getFreeMem endp
gfx_fillRow proc near                       ; slot 0x34
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_fillRow endp
gfx_fillRow2 proc near                      ; slot 0x35
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_fillRow2 endp
gfx_copyRow proc near                       ; slot 0x36
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_copyRow endp
gfx_nop36 proc near                         ; slot 0x37
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_nop36 endp
gfx_nop37 proc near                         ; slot 0x38
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_nop37 endp
gfx_getPageSeg proc near                    ; slot 0x39
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_getPageSeg endp
    db 0EAh, 4 dup(0)                       ; slot 0x3A
gfx_getRowOffset proc near                  ; slot 0x3B
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_getRowOffset endp
gfx_clearPage proc near                     ; slot 0x3C
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_clearPage endp
    db 0EAh, 4 dup(0)                       ; slot 0x3D
_gfx_setFadeSteps proc near                 ; slot 0x3E
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_setFadeSteps endp
gfx_calcRowAddr proc near                   ; slot 0x3F
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_calcRowAddr endp
    PUBLIC _gfx_calcRowAddr
_gfx_calcRowAddr equ gfx_calcRowAddr
_gfx_getModecode proc near                  ; slot 0x40
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_getModecode endp
    db 0EAh, 4 dup(0)                       ; slot 0x41
gfx_setOvlVal1 proc near                    ; slot 0x42
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_setOvlVal1 endp
gfx_setOvlVal2 proc near                    ; slot 0x43
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_setOvlVal2 endp
    PUBLIC _gfx_setOvlVal2
_gfx_setOvlVal2 equ gfx_setOvlVal2
    db 0EAh, 4 dup(0)                       ; slot 0x44
_gfx_setDac proc near                       ; slot 0x45
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_setDac endp
_gfx_waitRetrace proc near                  ; slot 0x46
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_waitRetrace endp
_gfx_flipPage proc near                     ; slot 0x47
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_flipPage endp
gfx_blitSpriteClipped proc near             ; slot 0x48
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_blitSpriteClipped endp
    PUBLIC _gfx_blitSpriteClipped
_gfx_blitSpriteClipped equ gfx_blitSpriteClipped
    db 0EAh, 4 dup(0)                       ; slot 0x49
gfx_blitSpriteOpaque proc near              ; slot 0x4A
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_blitSpriteOpaque endp
    PUBLIC _gfx_blitSpriteOpaque
_gfx_blitSpriteOpaque equ gfx_blitSpriteOpaque
    db 0EAh, 4 dup(0)                       ; slot 0x4B
_gfx_storeBufPtr proc near                  ; slot 0x4C
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_storeBufPtr endp
_gfx_getModeFlag proc near                  ; slot 0x4D
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_getModeFlag endp
    db 0EAh, 4 dup(0)                       ; slot 0x4E
    db 0EAh, 4 dup(0)                       ; slot 0x4F
_gfx_setDacAnimCount proc near              ; slot 0x50
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_setDacAnimCount endp
    db 0EAh, 4 dup(0)                       ; slot 0x51
    db 0EAh, 4 dup(0)                       ; slot 0x52
_gfx_setMonoFlag proc near                  ; slot 0x53
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_setMonoFlag endp
    db 0EAh, 4 dup(0)                       ; slot 0x54
    db 0EAh, 4 dup(0)                       ; slot 0x55
    db 0EAh, 4 dup(0)                       ; slot 0x56
    db 0EAh, 4 dup(0)                       ; slot 0x57
    db 0EAh, 4 dup(0)                       ; slot 0x58
    db 0EAh, 4 dup(0)                       ; slot 0x59
    db 0EAh, 4 dup(0)                       ; slot 0x5A
    db 0EAh, 4 dup(0)                       ; slot 0x5B
_misc_getKey proc near              ; slot 0x5C
    db 0EAh ;jmp far ptr 0:0
    dd 0
_misc_getKey endp
    db 0EAh, 4 dup(0)                       ; slot 0x5D
PUBLIC _misc_readJoystick
misc_readJoystick proc near              ; slot 0x5E
    db 0EAh ;jmp far ptr 0:0
    dd 0
misc_readJoystick endp
_misc_readJoystick equ misc_readJoystick
    db 0EAh, 4 dup(0)                       ; slot 0x5F
    db 0EAh, 4 dup(0)                       ; slot 0x60
    db 0EAh, 4 dup(0)                       ; slot 0x61
    db 0EAh, 4 dup(0)                       ; slot 0x62
    db 0EAh, 4 dup(0)                       ; slot 0x63
    db 0EAh, 4 dup(0)                       ; slot 0x64
_audio_setup proc near                    ; slot 0x65
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_setup endp
_audio_shutdown proc near                    ; slot 0x66
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_shutdown endp
_audio_playSound proc near                    ; slot 0x67
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_playSound endp
audio_playSound equ _audio_playSound
    db 0EAh, 4 dup(0)                       ; slot 0x68
_audio_engineDroneOn proc near                    ; slot 0x69
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_engineDroneOn endp
audio_engineDroneOn equ _audio_engineDroneOn
_audio_engineDroneOff proc near                    ; slot 0x6A
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_engineDroneOff endp
audio_engineDroneOff equ _audio_engineDroneOff
audio_setEnginePitch proc near                     ; slot 0x6B
    db 0EAh ;jmp far ptr 0:0
    dd 0
audio_setEnginePitch endp
_audio_setEnginePitch equ audio_setEnginePitch
audio_timerTick proc near                     ; slot 0x6C
    db 0EAh ;jmp far ptr 0:0
    dd 0
audio_timerTick endp
audio_noiseTick proc near                     ; slot 0x6D
    db 0EAh ;jmp far ptr 0:0
    dd 0
audio_noiseTick endp
_audio_playSample proc near                    ; slot 0x6E
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_playSample endp
audio_playSample equ _audio_playSample
    db 6 dup(0)
buf6data_4 db 0
    db 0
    db 2
    db 0
    db 2
    db 7 dup(0)
    db 1
    db 3 dup(0)
    db 6Fh
    db 3 dup(0)
    db 3Fh
    db 1
word_339B0 dw offset buf6data_4
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
    db 2 dup(0Fh)
    db 1
    db 8
    db 2 dup(0)
    db 3
    db 0
    db 2 dup(8)
    db 9
    db 3 dup(7)
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
    db 2 dup(6)
    db 0
    db 3 dup(0Ch)
    db 0Dh
    db 2 dup(0Ch)
    db 4
    db 3
    db 8 dup(4)
    db 3
    db 5 dup(4)
word_33B9C dw 0
_word_33B9C equ word_33B9C
    db 0
    db 10h
    db 0
    db 20h
word_33BA2 dw 1
_word_33BA2 equ word_33BA2
    db 1
    db 0
    db 1
    db 0
    db 1
    db 0
    db 1
    db 0
_word_33BAE label word
word_33BAE dw 400h
    db 0
    db 1
    db 40h
    db 0
    db 10h
    db 0
    db 8
    db 0
_word_33DD0 dw 0
word_33DD2 dw 0
    db 60 dup(0)
aPleaseInsertScenarioD db 'Please insert scenario disk',0
_unk_34121 db 20h
    db 20h
aPressAKeyWhenReady db 'Press a key when ready',0
    db 2 dup(0)
    db 0
    db 1
    db 3 dup(0)
word_34186 dw 3
_word_34186 equ word_34186
    db 4
    db 0
    db 2
    db 0
    db 3
    db 0
    db 4
    db 0
byte_3419A db 0
    db 0
byte_3419C db 0
_byte_3419C equ byte_3419C
_word_3419C equ byte_3419C
    db 1
    db 2
byte_3419F db 3
_byte_3419F equ byte_3419F
_byte_3419A equ byte_3419F
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
    db 2 dup(0)
    db 1
    db 0
    db 2
    db 0
    db 4
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
    db 2 dup(0FFh)
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
dword_3423C dw 0
word_3423E dw 0
word_3424C dw 0
word_3424E dw 0
    db 8 dup(0)
    db 8 dup(0)
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
    db 4 dup(0)
word_342BC dw 0
word_342BE dw 0
    db 476 dup(0)
word_3449C dw 0
word_3449E dw 0
word_344A0 dw 0
word_344A2 dw 0
    db 476 dup(0)
word_34680 dw 0
word_34682 dw 0
word_34684 dw 0
_word_34684 equ word_34684
word_34686 dw 0
_word_34686 equ word_34686
    db 139 dup(0)
unk_34713 db 0
    db 336 dup(0)
word_34864 dw 0
word_34866 dw 0
word_34868 dw 0
_word_34868 equ word_34868
word_3486A dw 0
    db 476 dup(0)
dword_34A48 dd 0
word_34A4C dw 0
_word_34A4C equ word_34A4C
word_34A4E dw 0
    db 56 dup(0)
unk_34A88 db 0
    db 419 dup(0)
dword_34C2C dd 0
    db 3784 dup(0)
word_35AF8 dw 0
    db 68 dup(0)
word_36B7E dw 0
word_36B80 dw 0
word_36B82 dw 0
word_36B84 dw 0
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
    db 2 dup(0)
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
    db 97 dup(0)
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
    db 8 dup(0)
byte_36C31 db 0
byte_36C32 db 0
word_36C33 dw 0
    db 6 dup(0)
    db 2Ah
    db 0
    db 2Ah
    db 2 dup(0)
    db 3 dup(2Ah)
    db 2 dup(0)
    db 2Ah
    db 0
    db 2 dup(2Ah)
    db 15h
    db 0
    db 3 dup(2Ah)
    db 5 dup(15h)
    db 3Fh
    db 15h
    db 3Fh
    db 2 dup(15h)
    db 3 dup(3Fh)
    db 2 dup(15h)
    db 3Fh
    db 15h
    db 3 dup(3Fh)
    db 15h
    db 3 dup(3Fh)
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
    db 2 dup(34h)
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
    db 6 dup(0)
    db 2Ah
    db 0
    db 2Ah
    db 2 dup(0)
    db 3 dup(2Ah)
    db 2 dup(0)
    db 2Ah
    db 0
    db 2 dup(2Ah)
    db 15h
    db 0
    db 3 dup(2Ah)
    db 5 dup(15h)
    db 3Fh
    db 15h
    db 3Fh
    db 2 dup(15h)
    db 3 dup(3Fh)
    db 2 dup(15h)
    db 3Fh
    db 15h
    db 3 dup(3Fh)
    db 15h
    db 3 dup(3Fh)
    db 3 dup(3)
    db 2 dup(5)
    db 2Ah
    db 5
    db 2Ah
    db 4
    db 5
    db 2Ah
    db 29h
    db 2Ah
    db 2 dup(5)
    db 29h
    db 5
    db 2 dup(2Ah)
    db 17h
    db 5
    db 3 dup(29h)
    db 3 dup(17h)
    db 2 dup(19h)
    db 3Dh
    db 19h
    db 3Dh
    db 2 dup(19h)
    db 3Dh
    db 3Ch
    db 3Dh
    db 2 dup(18h)
    db 3Dh
    db 19h
    db 2 dup(3Dh)
    db 3Ch
    db 18h
    db 3 dup(3Bh)
    db 3 dup(6)
    db 9
    db 0Ah
    db 2Ah
    db 9
    db 2Ah
    db 2 dup(9)
    db 2Ah
    db 29h
    db 2Ah
    db 2 dup(9)
    db 29h
    db 0Ah
    db 2 dup(2Ah)
    db 1Ah
    db 0Ah
    db 3 dup(27h)
    db 3 dup(19h)
    db 1Ch
    db 1Dh
    db 3Bh
    db 1Dh
    db 3Bh
    db 2 dup(1Ch)
    db 3Bh
    db 3Ah
    db 3Bh
    db 2 dup(1Ch)
    db 3Bh
    db 1Dh
    db 2 dup(3Bh)
    db 3Ah
    db 1Ch
    db 3 dup(37h)
    db 3 dup(9)
    db 2 dup(0Eh)
    db 2Ah
    db 0Eh
    db 2Ah
    db 0Dh
    db 0Eh
    db 2Ah
    db 29h
    db 2Ah
    db 2 dup(0Eh)
    db 29h
    db 0Fh
    db 2 dup(2Ah)
    db 1Dh
    db 10h
    db 3 dup(26h)
    db 3 dup(1Ah)
    db 2 dup(1Fh)
    db 39h
    db 20h
    db 3Ah
    db 20h
    db 1Fh
    db 39h
    db 38h
    db 3Ah
    db 2 dup(1Fh)
    db 3Ah
    db 20h
    db 3Ah
    db 39h
    db 38h
    db 1Eh
    db 3 dup(32h)
    db 3 dup(0Ch)
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
    db 2 dup(12h)
    db 29h
    db 14h
    db 2 dup(2Ah)
    db 1Fh
    db 15h
    db 3 dup(25h)
    db 3 dup(1Ch)
    db 2 dup(22h)
    db 37h
    db 23h
    db 38h
    db 23h
    db 22h
    db 37h
    db 36h
    db 38h
    db 2 dup(21h)
    db 38h
    db 24h
    db 38h
    db 37h
    db 36h
    db 21h
    db 3 dup(2Fh)
    db 3 dup(0Fh)
    db 2 dup(17h)
    db 2Ah
    db 16h
    db 2Ah
    db 16h
    db 17h
    db 2Ah
    db 29h
    db 2Ah
    db 2 dup(17h)
    db 2Ah
    db 19h
    db 2 dup(2Ah)
    db 22h
    db 1Ah
    db 3 dup(24h)
    db 3 dup(1Eh)
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
    db 2 dup(24h)
    db 36h
    db 27h
    db 36h
    db 35h
    db 34h
    db 23h
    db 3 dup(2Ah)
    db 3 dup(11h)
    db 2 dup(1Ch)
    db 2Ah
    db 1Ah
    db 2Ah
    db 1Ah
    db 1Ch
    db 2Ah
    db 29h
    db 2Ah
    db 2 dup(1Ch)
    db 2Ah
    db 1Eh
    db 2 dup(2Ah)
    db 24h
    db 1Fh
    db 3 dup(23h)
    db 3 dup(20h)
    db 2 dup(27h)
    db 34h
    db 28h
    db 34h
    db 28h
    db 27h
    db 2 dup(32h)
    db 34h
    db 2 dup(27h)
    db 34h
    db 29h
    db 34h
    db 2 dup(32h)
    db 25h
    db 3 dup(26h)
    db 3 dup(14h)
    db 2 dup(20h)
    db 2Ah
    db 1Fh
    db 2Ah
    db 1Fh
    db 20h
    db 2Ah
    db 29h
    db 2Ah
    db 2 dup(20h)
    db 2Ah
    db 23h
    db 2 dup(2Ah)
    db 27h
    db 24h
    db 6 dup(22h)
    db 2 dup(29h)
    db 32h
    db 2Ah
    db 32h
    db 2Ah
    db 29h
    db 2 dup(30h)
    db 32h
    db 2 dup(29h)
    db 32h
    db 2Ch
    db 32h
    db 2 dup(30h)
    db 27h
    db 3 dup(22h)
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
    db 2 dup(28h)
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
    db 2 dup(0)
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
    db 2 dup(0)
word_37348 dw 0
_word_37348 equ word_37348
PUBLIC _word_37348
word_3734A dw 324h
_word_3734A equ word_3734A
PUBLIC _word_3734A
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
    db 2 dup(28h)
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
    db 2 dup(0)
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
    db 6 dup(0)
byte_3754E db 0
word_3754F dw 0
word_37551 dw 0
word_37553 dw 0
word_37555 dw 0
    db 2 dup(0)
unk_37565 db 0FFh
    db 439 dup(0FFh)
unk_3771D db 0
    db 439 dup(0)
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
PUBLIC cbreakHit
cbreakHit db 0
origCBreakSeg dw 0
_origCBreakSeg equ origCBreakSeg
origCBreakOfs dw 0
    db 0 ;align 2
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
    db 2 dup(0)
word_3790A dw 0
_byte_3790C db 0
    db 2 dup(0)
    db 0A0h
    db 1
    db 3 dup(0)
    db 0Fh
    db 15 dup(0)
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
    db 9 dup(0)
    db 4 dup(0FFh)
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
    db 5 dup(0FFh)
    db 8 dup(0)
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
    db 2 dup(0FFh)
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
    db 3 dup(0FFh)
    db 8 dup(0)
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
    db 25 dup(0)
    db 4 dup(0FFh)
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
    db 5 dup(0FFh)
    db 14 dup(0)
    db 2 dup(0FFh)
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
    db 3 dup(0FFh)
    db 8 dup(0)
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
    db 9 dup(0)
word_37B26 dw 0
    db 2
    db 0
    db 0Fh
    db 3 dup(0)
word_37B2E dw 0
word_37B30 dw 0
word_37B32 dw 0
word_37B34 dw 40h
word_37B36 dw 5Eh
    db 2 dup(0)
    db 40h
    db 1
word_37B3C dw 0
    db 2
    db 0
    db 0Fh
    db 3 dup(0)
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
    db 3 dup(0)
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
    db 3 dup(0)
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
    db 2 dup(0)
word_37B82 dw 0
word_37B84 dw 0
word_37B86 dw 5Ah
word_37B88 dw 10h
word_37B8A dw 8Dh
word_37B8C dw 3
    db 0 ;align 4
    db 0
    db 0C7h
    db 3 dup(0)
    db 36h
    db 2 dup(1)
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
    db 2 dup(0)
    db 0C7h
    db 3 dup(0)
    db 36h
    db 2 dup(1)
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
    db 3 dup(0)
    db 0C7h
    db 3 dup(0)
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
    db 3 dup(0)
    db 0C7h
    db 3 dup(0)
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
word_37C30 dw 0
word_37C32 dw 3030h
    db 0
byte_37C35 db 0
word_37C36 dw 0
    db 4Bh
    db 0
; var_468 (DGROUP 0x538a): speed/altitude tape scale scratch buffer.
; byte_37C3A (the heading/compass tape buffer) was wrongly labelled here, 0xB0
; bytes too early, so byte_37C3A+132 (the "000 045 090 135 180 225 270 315"
; cardinal labels) read garbage and the compass rendered as solid blocks.
; The label now sits at its correct offset 0x543a below. Data bytes unchanged.
; egseg2's tape code (which wrote/read this scratch) now references var_468.
var_468 db 0
    db 2 dup(30h)
    db 0
    db 39h
    db 2 dup(30h)
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
    db 5 dup(31h)
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
    db 2 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
    db 35h
    db 3 dup(30h)
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
byte_37C3A db 20h                ; DGROUP 0x543a: heading/compass tape buffer
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
    db 3 dup(31h)
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
    db 3 dup(32h)
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
    db 3 dup(33h)
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
    db 3 dup(34h)
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
    db 3 dup(35h)
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
    db 3 dup(36h)
    db 37h
    db 36h
    db 38h
    db 36h
    db 39h
    db 3 dup(30h)
    db 0
    db 3 dup(20h)
    db 0
    db 30h
    db 34h
    db 35h
    db 0
    db 3 dup(20h)
    db 0
    db 30h
    db 39h
    db 30h
    db 0
    db 3 dup(20h)
    db 0
    db 31h
    db 33h
    db 35h
    db 0
    db 3 dup(20h)
    db 0
    db 31h
    db 38h
    db 30h
    db 0
    db 3 dup(20h)
    db 0
    db 2 dup(32h)
    db 35h
    db 0
    db 3 dup(20h)
    db 0
    db 32h
    db 37h
    db 30h
    db 0
    db 3 dup(20h)
    db 0
    db 33h
    db 31h
    db 35h
    db 0
    db 3 dup(20h)
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
    db 3 dup(0)
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
    db 283 dup(0)
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
    db 2 dup(30h)
    db 2 dup(0)
    db 31h
    db 30h
    db 2 dup(0)
    db 32h
    db 30h
    db 2 dup(0)
    db 33h
    db 30h
    db 2 dup(0)
    db 34h
    db 30h
    db 2 dup(0)
    db 35h
    db 30h
    db 2 dup(0)
    db 36h
    db 30h
    db 2 dup(0)
    db 37h
    db 30h
    db 2 dup(0)
    db 38h
    db 30h
    db 2 dup(0)
    db 39h
    db 30h
    db 2 dup(0)
    db 38h
    db 30h
    db 2 dup(0)
    db 37h
    db 30h
    db 2 dup(0)
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
PUBLIC joyData
PUBLIC word_37F6C
PUBLIC word_37F74
PUBLIC word_37F7C
PUBLIC word_37F84
PUBLIC word_37F8C
PUBLIC word_37F8E
joyData db 8 dup(0)
word_37F6C dw 0
    db 6 dup(0)
word_37F74 dw 0
    db 6 dup(0)
word_37F7C dw 0
    db 6 dup(0)
word_37F84 dw 0
    db 6 dup(0)
word_37F8C dw 0
word_37F8E dw 0
    db 4 dup(0)
_joyAxes db 0
joyAxes_2 db 0
_joyAxes_2 equ joyAxes_2
    db 2 dup(0)
byte_37F9A db 0
word_37F9B dw 0
byte_37F9D db 0
byte_37F9E db 0
byte_37F9F db 0
    db 1
    db 0
    db 4
    db 27 dup(0)
    db 5
    db 1
    db 9
    db 2
    db 4
    db 80h
    db 2 dup(8)
    db 6
    db 2
    db 0Ah
    db 0
byte_37FEC db 10h
_byte_37FEC equ byte_37FEC
    db 5 dup(10h)
    db 8 dup(11h)
    db 7 dup(12h)
    db 2 dup(13h)
    db 2 dup(14h)
    db 15h
    db 2 dup(16h)
    db 17h
    db 18h
    db 2 dup(19h)
    db 1Ah
    db 2 dup(1Bh)
    db 1Ch
    db 2 dup(1Dh)
    db 1Eh
    db 2 dup(1Fh)
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
    db 2 dup(1Fh)
    db 1Eh
    db 2 dup(1Dh)
    db 1Ch
    db 2 dup(1Bh)
    db 1Ah
    db 2 dup(19h)
    db 18h
    db 17h
    db 2 dup(16h)
    db 15h
    db 2 dup(14h)
    db 2 dup(13h)
    db 7 dup(12h)
    db 8 dup(11h)
    db 5 dup(10h)
    db 8
    db 0
word_38080 dw 0
_word_38080 equ word_38080
    db 0 ;align 4
    db 0
word_38084 dw 0
_word_38084 equ word_38084
    db 0 ;align 4
    db 0
    db 0FFh
    db 7Fh
    db 2 dup(0)
word_3808C dw 0
_word_3808C equ word_3808C
    db 0 ;align 4
    db 0
word_38090 dw 0
_word_38090 equ word_38090
unk_38092 db 0FFh
_unk_38092 equ unk_38092
    db 7Fh
    db 6 dup(0)
word_3809A dw 0
_word_3809A equ word_3809A
word_3809C dw 0
_word_3809C equ word_3809C
    db 0 ;align 4
    db 0
word_380A0 dw 0
_word_380A0 equ word_380A0
word_380A2 dw 0
_word_380A2 equ word_380A2
word_380A4 dw 0
_word_380A4 equ word_380A4
word_380A6 dw 0
_word_380A6 equ word_380A6
    db 2 dup(0)
word_380AA dw 0
_word_380AA equ word_380AA
word_380AC dw 0
_word_380AC equ word_380AC
    db 6 dup(0)
    db 0FFh
    db 7Fh
_g_viewZ dw 0
    db 0Ch
    db 5 dup(0)
    db 3 dup(0)
    db 0
    db 1
byte_380DD db 0
_byte_380DD equ byte_380DD
    db 2 dup(0)
    db 0
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
    db 2 dup(0FFh)
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
    db 4 dup(0FFh)
    db 0 ;align 2
    db 0 ;align 2
    db 0 ;align 2
PUBLIC _aA
aA db 'A',0
_aA equ aA
    db 1Ah
    db 0
    db 65h
    db 0
    db 0    ; was aEmpty_5950 (empty string, now in egdata.c)
    db 0
_word_38202 dw 41h
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
    db 3 dup(0)
    db 1Fh
    db 1
    db 85h
    db 0
    db 29h
    db 1
    db 8Ah
    db 3 dup(0)
    db 1Fh
    db 1
    db 90h
    db 0
    db 29h
    db 1
    db 95h
    db 3 dup(0)
    db 1Fh
    db 1
    db 9Bh
    db 0
    db 29h
    db 1
    db 0A0h
    db 3 dup(0)
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
    db 7 dup(0)
    db 1
    db 3 dup(0)
    db 60h
    db 3 dup(0)
    db 3Fh
    db 1
_unk_3831E equ unk_3831E
PUBLIC _unk_3831E
unk_38336 db 1
    db 0
    db 2
    db 0
    db 2
    db 7 dup(0)
    db 1
    db 3 dup(0)
    db 60h
    db 3 dup(0)
    db 3Fh
    db 1
_unk_38336 equ unk_38336
PUBLIC _unk_38336
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
_word_3834E equ word_3834E
PUBLIC _word_3834E
buf6data_0 db 0 ;align 4
    db 0
    db 2
    db 0
    db 2
    db 7 dup(0)
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
word_3837C dw offset buf6data_0
    db 0 ;align 4
    db 0
    db 2
    db 0
    db 2
    db 7 dup(0)
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
buf6data_1 db 0
    db 0
    db 2
    db 0
    db 2
    db 7 dup(0)
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
word_383AC dw offset buf6data_1
    db 1
    db 0
    db 1
    db 0
aTac db 'Tac',0
    db 5 dup(0)
    db 0
    db 0
    db 0
    db 0 ;align 2
    db 0 ;align 2
aFileNotFound db ':File not found$'
aNoFileBuffersAvailabl db ':No file buffers available$'
aOpenError db ':Open error $'
aFileClosingError db 'File closing error$'
PUBLIC aReadError
aReadError db 'Read error$'
PUBLIC aWriteError
aWriteError db 'Write error$'
PUBLIC word_3888E
word_3888E dw 0
PUBLIC word_38890
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
; --- LZW decoder state (EQU targets for _var_687 through _var_700) ---
lzw_readBufEndPtr dw 0     ; _var_687
lzw_workDataPtr dw 0       ; _var_688
lzw_rowLength dw 0         ; _var_689
lzw_processFlag dw 0       ; _var_690
lzw_bitWidth dw 0          ; _var_692
lzw_maxCode dw 0           ; _var_694
lzw_bitsLeft dw 0          ; _var_697
lzw_slotCounter dw 0       ; _var_699
lzw_dictIndex dw 0         ; _var_700
; --- end LZW state ---
word_389E4 dw 0
word_389E6 dw 0
off_389E8 dw 0 ;off_389E8 dw offset __exit
word_389EA dw 0
    dw 0 ;dw seg dseg
    db 76 dup(0)
word_38A3A dw offset lzw_processFlag
aC_file_info db ';C_FILE_INFO',0
dword_38A49 dd 0
    db 8 dup(0)
word_38A55 dw 0
word_38A57 dw 0
    db 2 dup(0)
word_38A5B dw 0
word_38A5D dw 0
    db 0 ;align 2
byte_38A60 db 0
    db 0 ;align 2
word_38A62 dw 14h
    db 3 dup(81h)
    db 2 dup(1)
    db 15 dup(0)
argc dw 0
argv dw 0
word_38A7C dw 0
    db 0D2h
    db 61h
    dw seg @data ;dw seg dseg
    db 43h
    db 3 dup(0)
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
    db 2 dup(2)
    db 18h
    db 0Dh
    db 9
    db 3 dup(0Ch)
    db 7
    db 8
    db 2 dup(16h)
    db 0FFh
    db 12h
    db 0Dh
    db 12h
    db 2
    db 0FFh
    db 2Ah
    db 8Dh
    db 2 dup(0)
    db 2Ah
    db 8Dh
    db 1
    db 7 dup(0)
    db 2
    db 1
    db 6 dup(0)
    db 2 dup(2)
    db 6 dup(0)
    db 84h
    db 3
    db 6 dup(0)
    db 2
    db 4
    db 94 dup(0)
buf6data_3 db 0
    db 25 dup(0)
    db 1
    db 2 dup(0)
    db 2
    db 116 dup(0)
word_38BC6 dw offset buf6data_3
word_38BC8 dw 0
word_38BCA dw 0
word_38BCC dw 0
    db 0 ;align 4
    db 0
word_38BD0 dw 0
    db 3 dup(0)
byte_38BD5 db 0
word_38BD6 dw 0
    db 2 dup(0)
word_38BDA dw 0
word_38BDC dw 2000h
    db 0 ;align 4
    db 0
byte_38BE0 db 0
    db 0 ;align 4
    db 2 dup(0)
unk_38BE4 db 0
    db 0
word_38BE6 dw 0
dword_38BE8 dd 0
dword_38BEC dd 0
byte_38BF0 db 18h
    db 0F6h
    dw 0 ;seg_38BF2 dw seg seg004
    dw 0 ;seg_38BF4 dw seg seg004
seg_38BF6 dw 0 ;seg_38BF6 dw seg seg004
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
    db 3 dup(0FFh)
    db 0
    db 6 dup(0)
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
    db 506 dup(0)
; --- Variables created for ORG-based _var_* labels whose targets didn't exist ---
word_32A28 dw 0
word_32A2E dw 0
word_32A30 dw 0
word_33BB8 dw 0
word_383EC dw 0
word_38896 dw 0
word_389DC dw 0
byte_38A4B db 0
    db 0 ;align
word_38A78 dw 0
word_38A7A dw 0
; ==============================================================================
; --- Symbolic labels for code references ---
ORG 01100h
_var_134 EQU word_339B0
ORG 01308h
_var_143 EQU word_33BB8
ORG 018EAh
_var_190 EQU byte_3419A
ORG 01904h
ORG 01906h
ORG 01908h
ORG 0190Ah
ORG 0190Ch
_var_198 EQU word_341BC
ORG 0198Ch
_var_200 EQU dword_3423C
PUBLIC _var_200_off
_var_200_off EQU dword_3423C
ORG 0198Eh
_var_201 EQU word_3423E
PUBLIC _var_200_seg
_var_200_seg EQU word_3423E
ORG 01990h
ORG 01992h
ORG 01994h
ORG 019B0h
ORG 019B4h
ORG 019B6h
ORG 01A0Ah
ORG 01FB8h
_var_279 EQU word_34868
ORG 0219Ch
_var_282 EQU word_34A4C
ORG 0505Ah
_var_383 EQU word_3790A
ORG 05374h
_var_456 EQU _byte_37C24
ORG 057C0h
ORG 057C2h
ORG 057C4h
ORG 057C6h
ORG 057C8h
ORG 057CEh
ORG 05818h
ORG 05819h
ORG 0581Ah
ORG 0581Eh
_uvar_547 EQU _g_viewZ
ORG 05830h
ORG 058AEh
ORG 05ACCh
_var_567 EQU word_3837C
ORG 05AFCh
_var_568 EQU word_383AC
ORG 05AFEh
ORG 05B00h
ORG 05B02h
ORG 05B04h
ORG 05B06h
ORG 05B08h
ORG 05B0Ah
ORG 05B0Ch
ORG 05B1Ch
ORG 05B1Eh
ORG 05B20h
ORG 05B22h
ORG 05B24h
ORG 05B26h
ORG 05B28h
ORG 05B2Ah
ORG 05B34h
ORG 05B35h
ORG 05C5Eh
ORG 05FE6h
_var_605 EQU word_38896
ORG 06128h
_var_606 EQU word_389D8
ORG 0612Ch
_var_608 EQU word_389DC
ORG 06130h
_var_609 EQU word_389E0
ORG 06132h
_var_610 EQU readFromFilePtr
ORG 06134h
_var_611 EQU word_389E4
ORG 06138h
_var_613 EQU off_389E8
ORG 0618Ah
_var_615 EQU word_38A3A
ORG 06199h
_var_616 EQU dword_38A49
ORG 0619Bh
_var_617 EQU byte_38A4B
ORG 061A5h
_var_618 EQU word_38A55
ORG 061A7h
_var_619 EQU word_38A57
ORG 061ABh
_var_620 EQU word_38A5B
ORG 061ADh
_var_621 EQU word_38A5D
ORG 061C8h
_var_625 EQU word_38A78
ORG 061CAh
_var_626 EQU word_38A7A
ORG 061CCh
_var_627 EQU word_38A7C
ORG 061D6h
_var_628 EQU byte_38A86
ORG 061D7h
_var_629 EQU byte_38A87
ORG 061D8h
_var_630 EQU dword_38A88
ORG 061E2h
_var_632 EQU word_38A92
ORG 061E4h
_var_633 EQU word_38A94
ORG 061E6h
_var_634 EQU word_38A96
ORG 061E8h
_var_635 EQU word_38A98
ORG 06316h
_var_638 EQU word_38BC6
ORG 06318h
_var_639 EQU word_38BC8
ORG 0631Ah
_var_640 EQU word_38BCA
ORG 0631Ch
_var_641 EQU word_38BCC
ORG 06320h
_var_642 EQU word_38BD0
ORG 06334h
_var_647 EQU unk_38BE4
ORG 06336h
_var_648 EQU word_38BE6
ORG 06338h
_var_649 EQU dword_38BE8
ORG 0633Ch
_var_650 EQU dword_38BEC
ORG 06346h
_var_653 EQU seg_38BF6
ORG 064AAh
_var_687 EQU lzw_readBufEndPtr
ORG 064ACh
_var_688 EQU lzw_workDataPtr
ORG 064AEh
_var_689 EQU lzw_rowLength
ORG 064B0h
_var_690 EQU lzw_processFlag
ORG 064B2h
_var_692 EQU lzw_bitWidth
ORG 064B4h
_var_694 EQU lzw_maxCode
ORG 064BAh
_var_697 EQU lzw_bitsLeft
ORG 064BCh
_var_699 EQU lzw_slotCounter
ORG 064BEh
_var_700 EQU lzw_dictIndex

.DATA?
IFDEF DEBUG
PUBLIC __bss_start
ENDIF
__bss_start label byte
ORG 00000h
PUBLIC _word_38F70
word_38F70 dw ?
_word_38F70 equ word_38F70
strBuf db 18h dup(?)
_strBuf equ strBuf
    db 54 dup(?)
_word_38FC6 label byte
    db ? ;align 4
    db ?
unk_38FD0 db ?
_unk_38FD0 equ unk_38FD0
    db 9 dup(?)
    db 2 dup(?)
    db 512 dup(?)
    db 80 dup(?)
    db ?

; Matrix3dEntry7 storage.
; 571 full records * 7 bytes + 3 spare bytes = 4000 bytes. => #define MAX_TILE_DATA 4000

_word_3AA5C dw ?
    _g_planes MapTarget 4Ah dup(<?>)
    db 14 dup(?)
    db ?
word_3B7E0 dw ?
_word_3B7E0 equ word_3B7E0
word_3B7E2 dw ?
_word_3B7E2 equ word_3B7E2
word_3B7E4 dw ?
_word_3B7E4 equ word_3B7E4
word_3B7E6 dw ?
_word_3B7E6 equ word_3B7E6
word_3B7E8 dw ?
_word_3B7E8 equ word_3B7E8
word_3B7EA dw ?
_word_3B7EA equ word_3B7EA
word_3B7EC dw ?
_word_3B7EC equ word_3B7EC
    db ? ;align 8
    db 5 dup(?)
    db ? ;align 4
    db ?
PUBLIC _word_3B7E2
PUBLIC _word_3B7EC
    db ? ;align 2
_commData dd ?
PUBLIC byte_36BAE
PUBLIC byte_36C16
PUBLIC byte_36C17
PUBLIC byte_36C18
PUBLIC byte_36C31
PUBLIC byte_36C32
PUBLIC byte_3754E
PUBLIC byte_378DE
PUBLIC dword_34A48
PUBLIC dword_34C2C
PUBLIC unk_329AB
PUBLIC unk_34713
PUBLIC unk_34A88
PUBLIC unk_3771D
PUBLIC word_3424C
PUBLIC word_3424E
PUBLIC word_34278
PUBLIC word_3427A
PUBLIC word_3427C
PUBLIC word_3427E
PUBLIC word_34280
PUBLIC word_34282
PUBLIC word_34284
PUBLIC word_34286
PUBLIC word_34288
PUBLIC word_3428A
PUBLIC word_3428C
PUBLIC word_3428E
PUBLIC word_34290
PUBLIC word_34292
PUBLIC word_34294
PUBLIC word_34296
PUBLIC word_34298
PUBLIC word_3429A
PUBLIC word_3429C
PUBLIC word_3429E
PUBLIC word_342A0
PUBLIC word_342A2
PUBLIC word_342A4
PUBLIC word_342A6
PUBLIC word_342A8
PUBLIC word_342AA
PUBLIC word_342BC
PUBLIC word_342BE
PUBLIC word_3449C
PUBLIC word_3449E
PUBLIC word_344A0
PUBLIC word_344A2
PUBLIC word_34680
PUBLIC word_34682
PUBLIC word_34864
PUBLIC word_34866
PUBLIC word_35AF8
PUBLIC word_36B7E
PUBLIC word_36B80
PUBLIC word_36B82
PUBLIC word_36B84
PUBLIC word_36B89
PUBLIC word_36B8B
PUBLIC word_36C10
PUBLIC word_36C12
PUBLIC word_36C14
PUBLIC word_36C19
PUBLIC word_36C1B
PUBLIC word_36C1D
PUBLIC word_36C1F
PUBLIC word_36C21
PUBLIC word_36C23
PUBLIC word_36C25
PUBLIC word_36C27
PUBLIC word_36C33
PUBLIC word_3754F
PUBLIC word_37551
PUBLIC word_37553
PUBLIC word_37555
PUBLIC word_378D5
PUBLIC word_378D7
PUBLIC word_378D9
PUBLIC word_378DB
PUBLIC word_378DF
PUBLIC word_378E1
PUBLIC word_378E3
PUBLIC word_378E5
PUBLIC word_3837C
PUBLIC word_383AC
PUBLIC word_38A3A
PUBLIC word_38BC6
PUBLIC buf6data_0
PUBLIC buf6data_1
PUBLIC buf6data_3
PUBLIC lzw_processFlag
PUBLIC buf6data_4
PUBLIC _word_34276
_word_34276 equ word_34276
    db ? ;align 400h
    db 511 dup(?)
    db ? ;align 2
    db 12 dup(?)

__bss_end label byte

END
