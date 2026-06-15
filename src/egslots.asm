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

PUBLIC _byte_37F98
PUBLIC _byte_37F99
PUBLIC _byte_37FEC
PUBLIC _byte_380DD
PUBLIC _byte_3C6A0
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
PUBLIC _g_setThrust
PUBLIC _word_380E2
PUBLIC _word_38602
PUBLIC _g_gees
PUBLIC _word_3A8FE
PUBLIC _g_thrust
PUBLIC _word_3B4DA
PUBLIC _word_3C00E
PUBLIC _word_3C5A4
PUBLIC _byte_3B4E6
PUBLIC _var_548
PUBLIC _var_47
PUBLIC _var_48
PUBLIC _var_49
PUBLIC _var_810
PUBLIC _var_811
PUBLIC _var_727
PUBLIC _var_732
PUBLIC _var_597
PUBLIC _word_33714
PUBLIC _word_3AF0C
PUBLIC _word_33706
PUBLIC _word_3B230
PUBLIC _word_3B240
PUBLIC _word_33708
PUBLIC _word_3B232
PUBLIC _word_3C014
PUBLIC _word_3BFA0
PUBLIC _word_3B234
PUBLIC _word_3B236
PUBLIC _word_336EC
PUBLIC _word_336EE
PUBLIC _word_32A34
PUBLIC _word_3BECC
PUBLIC _var_660
PUBLIC _word_39402
PUBLIC _word_38FCE
PUBLIC _byte_3419A
PUBLIC _byte_3419C
PUBLIC _var_568
PUBLIC _var_680
PUBLIC _var_681
PUBLIC _var_682
PUBLIC _var_683
PUBLIC _var_684
PUBLIC _var_685
PUBLIC _var_594
PUBLIC _var_593
PUBLIC _var_675
PUBLIC _var_676
PUBLIC _var_677
PUBLIC _word_39606
PUBLIC _word_3BEBC
PUBLIC _word_3BEC8
PUBLIC _word_3BECE
PUBLIC _byte_3B23E
PUBLIC _word_33700
PUBLIC _word_33712
PUBLIC _word_38FDE
PUBLIC _word_38FEE
PUBLIC _word_38FFC
PUBLIC _word_39200
PUBLIC _word_3AFAA
PUBLIC _word_3B22C
PUBLIC _word_3B22E
PUBLIC _word_3C0A0
PUBLIC _word_38FF8
PUBLIC _strBuf
PUBLIC _aNotAvailable
PUBLIC _aArmed
PUBLIC _byte_38F8C
PUBLIC _byte_38F8D
PUBLIC _aNone
PUBLIC byte_37C2D
PUBLIC byte_37C2E
PUBLIC byte_37C35
PUBLIC byte_37C3A
PUBLIC var_468
PUBLIC byte_37EEE
PUBLIC byte_37EEF
PUBLIC byte_3C6A0
PUBLIC unk_37565
PUBLIC unk_38FD0
PUBLIC word_37557
PUBLIC word_37559
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
PUBLIC _var_456
PUBLIC _var_190
PUBLIC _var_383
PUBLIC _var_200
PUBLIC _var_201
PUBLIC _var_141
PUBLIC _var_657
PUBLIC _var_658
PUBLIC _var_659
PUBLIC _var_202
PUBLIC _var_203
PUBLIC _var_204
PUBLIC _var_215
PUBLIC _var_216
PUBLIC _var_217
PUBLIC _word_3B7E2
PUBLIC _word_3B7EC
PUBLIC _word_3C5A8
PUBLIC _var_665
PUBLIC _var_666
PUBLIC _var_667
PUBLIC _var_668
PUBLIC _var_556
PUBLIC _var_673
PUBLIC _word_3BECE
PUBLIC _word_39606
PUBLIC _word_3A946
PUBLIC _word_3BEC8
PUBLIC _word_38FEE
PUBLIC _word_3BEBC
PUBLIC _var_255
PUBLIC _var_261
PUBLIC _var_315
PUBLIC _var_316
PUBLIC _origCBreakSeg
PUBLIC _word_3C16C
PUBLIC _var_257
PUBLIC _var_258
PUBLIC _var_259
PUBLIC _var_260
PUBLIC _var_256
PUBLIC _word_34684
PUBLIC _word_34686
PUBLIC _word_34868
PUBLIC _word_34A4C
PUBLIC _word_3C042
PUBLIC _var_194
PUBLIC _var_195
PUBLIC _var_196
PUBLIC _var_143
PUBLIC _word_33704
PUBLIC _word_39808
PUBLIC _word_3B7E0
PUBLIC _word_3B7E4
PUBLIC _word_3B7E6
PUBLIC _word_3B7E8
PUBLIC _word_3B7EA
PUBLIC _byte_3B7EE
PUBLIC _byte_3B7EF
PUBLIC _byte_3B7F0
PUBLIC _word_339F4
PUBLIC _byte_3B7F1
PUBLIC _word_33B74
PUBLIC _word_33B86
PUBLIC _word_33B9C
PUBLIC _word_33BA2
PUBLIC _byte_3B4EC
PUBLIC _var_197
PUBLIC _var_198
PUBLIC _byte_3419F
PUBLIC _var_654
PUBLIC _var_83
PUBLIC _var_279
PUBLIC _var_282
PUBLIC _word_38F72
PUBLIC _word_38F70
PUBLIC _word_38FE0
PUBLIC _var_349
PUBLIC _var_350
PUBLIC _var_134
PUBLIC _var_135
PUBLIC _var_662
PUBLIC _commData
PUBLIC _gameData
PUBLIC _hercFlag
PUBLIC _joyAxes
PUBLIC _gfxBufPtr
PUBLIC _regs
PUBLIC _scenarioPlh
PUBLIC _regnStr
PUBLIC _byte_34197
PUBLIC _audio_jump_6a
PUBLIC _audio_jump_64
PUBLIC _audio_jump_65
PUBLIC _audio_jump_66
PUBLIC _audio_jump_6d
PUBLIC _audio_jump_68
PUBLIC _audio_jump_69
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
PUBLIC byte_37F98
PUBLIC byte_37F99
PUBLIC byte_37F9A
PUBLIC word_37F9B
PUBLIC byte_37F9D
PUBLIC byte_37F9E
PUBLIC byte_37F9F
PUBLIC _word_3C0A2
PUBLIC _flagFarToNear
PUBLIC _word_3BFA2
PUBLIC _word_3B4DC
PUBLIC _word_3C044
PUBLIC _word_3BEC2
PUBLIC _word_3BED6
PUBLIC _aFlogger
PUBLIC _byte_3C16E
PUBLIC _flt15_buf1
PUBLIC _flt15_word1
PUBLIC _flt15_buf2
PUBLIC _flt15_size
PUBLIC _byte_3B7FC
PUBLIC _byte_3790C
PUBLIC _farPointer
PUBLIC _word_3C69E
PUBLIC _word_3C046
PUBLIC _byte_3BFA4
PUBLIC _byte_3BEC4
PUBLIC _byte_3BED8
PUBLIC _byte_3C02A
PUBLIC _word_3C00C
PUBLIC _word_3AFA8
PUBLIC _stru_3B202
PUBLIC _word_3B204
PUBLIC _word_3B206
PUBLIC _byte_3AFAC
PUBLIC _word_3401A
PUBLIC _off_38334
PUBLIC _off_3834C
PUBLIC _byte_3A900
PUBLIC _misc_jump_5b_getkey
PUBLIC _unk_33E1A
PUBLIC _unk_34121
PUBLIC _word_33BAE
PUBLIC _buf1_3dg
PUBLIC _buf2_3dg
PUBLIC _buf3_3dg
PUBLIC _buf4_3dg
PUBLIC _sizes3dt
PUBLIC _matrix3dt
PUBLIC _matrix3dt_2
PUBLIC _buf_3dt
PUBLIC _buf3d3_1
PUBLIC _buf3d3_2
PUBLIC _buf3d3_3
PUBLIC _buf3d3
PUBLIC _byte_3BE3E
PUBLIC _byte_3BE80
PUBLIC _word_33DD0
PUBLIC _size3d3_7
PUBLIC _dword_3C01C
PUBLIC _g_viewZ
PUBLIC _dword_3C024
PUBLIC _word_3C02C
PUBLIC _g_ourHead
PUBLIC _g_ourPitch
PUBLIC _g_ourRoll
PUBLIC _word_3C5AA
PUBLIC _word_3BE3C
PUBLIC _word_38FF6
PUBLIC _word_33710
PUBLIC _stru_3A95A
PUBLIC _word_3C028
PUBLIC _word_3C03A
PUBLIC _word_34186
PUBLIC _word_3419C
PUBLIC _word_341DC
PUBLIC _word_341FC
PUBLIC _word_339B4
PUBLIC _word_336F6
PUBLIC _stru_33402
PUBLIC _word_33442
PUBLIC _word_33444
PUBLIC _stru_335C4
PUBLIC _var_672
PUBLIC _var_671
PUBLIC _unk_3C030
PUBLIC _var_674
PUBLIC _word_3A940
PUBLIC _word_3C02E
PUBLIC _g_currentWeaponType
PUBLIC _g_planes
PUBLIC _stru_3B208
PUBLIC _unk_3A948
PUBLIC _word_38152
PUBLIC _word_37561
PUBLIC _word_37563
PUBLIC _word_38126
PUBLIC _var_589
PUBLIC _var_590
PUBLIC _off_38364
PUBLIC _unk_3806E
PUBLIC _unk_380B6
PUBLIC _gfx_setColor
PUBLIC _gfx_nop23
PUBLIC _byte_3995A
PUBLIC _word_36B86
PUBLIC _byte_3850E
PUBLIC _unk_38128
PUBLIC _word_3755D
PUBLIC _word_3755F
PUBLIC _word_38202
PUBLIC _word_3C09A
PUBLIC _word_33098
PUBLIC _word_330B4
PUBLIC _word_3309C
PUBLIC _word_3309E
PUBLIC _word_3C09E
PUBLIC _word_3B4D2
PUBLIC _word_3C00A
PUBLIC _word_3C8B2
PUBLIC _word_3C8B8
PUBLIC _word_3C8BC
PUBLIC _word_3C8C0
PUBLIC _keyScancode
PUBLIC _var_217
PUBLIC _var_218
PUBLIC _var_219
PUBLIC _var_220
PUBLIC _var_591
PUBLIC _var_592
PUBLIC _var_595
PUBLIC _var_600
PUBLIC _word_3AFA4
PUBLIC _word_3B0AC
PUBLIC _word_3995C
PUBLIC _word_3BE98
PUBLIC _word_3C5AC
PUBLIC _word_3C5AE
PUBLIC _word_3C5B0
PUBLIC _word_3C5B2
PUBLIC _word_3C5B4
PUBLIC _word_3C5B6
PUBLIC _word_38FE8
PUBLIC _byte_3C5A0
PUBLIC _word_3C040
PUBLIC _word_383F4
PUBLIC _word_3C6A4
PUBLIC _byte_37C2F
PUBLIC _sams
PUBLIC _word_3C5A6
PUBLIC _missleSpec
PUBLIC _word_3C8B6
PUBLIC _word_3AA5C
PUBLIC _waypoints
PUBLIC _word_3C008
PUBLIC _byte_37C24
PUBLIC _string_3C04A
PUBLIC _var_564
PUBLIC _var_565
PUBLIC _var_569
PUBLIC _var_570
PUBLIC _var_571
PUBLIC _var_572
PUBLIC _var_573
PUBLIC _var_574
PUBLIC _var_575
PUBLIC _var_576
PUBLIC _var_577
PUBLIC _var_578
PUBLIC _var_579
PUBLIC _var_580
PUBLIC _var_581
PUBLIC _var_582
PUBLIC _var_583
PUBLIC _var_584
PUBLIC _var_585
PUBLIC _var_586
PUBLIC _word_383CC
PUBLIC _word_383AE
PUBLIC _word_3C6AC
PUBLIC _word_333D8
PUBLIC _word_333DA
PUBLIC _var_661
PUBLIC _var_663
PUBLIC _var_664
PUBLIC _word_3298A
PUBLIC _word_3298C
PUBLIC _word_3298E
PUBLIC _word_3BE9C
PUBLIC _word_38FC6
PUBLIC _var_224
PUBLIC _var_225
PUBLIC _var_226
PUBLIC _var_227
PUBLIC _var_596
PUBLIC _var_598
PUBLIC _var_599
PUBLIC _missiles
PUBLIC _word_336EC
PUBLIC _word_3C6AE
PUBLIC _var_730
PUBLIC _word_336F8
PUBLIC _word_336E4
PUBLIC _word_3C03E
PUBLIC _word_3BF3C
PUBLIC _word_3BF3E
PUBLIC _word_3BE7E
PUBLIC _word_3C6AA
PUBLIC _word_336FA
PUBLIC _word_3A946
PUBLIC _word_3C09C
PUBLIC _word_3BE96
PUBLIC _g_closestThreatIndex
PUBLIC _word_380D0
PUBLIC _word_380D8
PUBLIC _tempString
PUBLIC _word_383F2
PUBLIC _word_33096
PUBLIC _g_missionStatus
PUBLIC _var_669
PUBLIC _var_667
PUBLIC _var_670
PUBLIC _word_3B204
PUBLIC _word_3B206
PUBLIC _g_gunHits
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
PUBLIC _byte_383E5
PUBLIC _var_524
PUBLIC _var_525
PUBLIC _var_526
PUBLIC _var_527
PUBLIC _var_528
PUBLIC _var_529
PUBLIC _var_542
PUBLIC _var_543
PUBLIC _var_544
PUBLIC _var_545
PUBLIC _var_550
PUBLIC _var_547
PUBLIC _uvar_547
PUBLIC _var_549
PUBLIC _var_552
PUBLIC _word_336F0
PUBLIC _word_333D2
PUBLIC _mapEvents
PUBLIC _word_333D4
PUBLIC _word_3B4D8
PUBLIC _word_3B4E0
PUBLIC _word_3B5D6
PUBLIC _word_38FEC
PUBLIC _word_3BED4
PUBLIC _word_330BA
PUBLIC _word_3C016
PUBLIC _var_588
PUBLIC _word_3C018
PUBLIC _word_3C01A
PUBLIC _word_330BE
PUBLIC _var_686
PUBLIC _word_3C45E
PUBLIC _word_3C5A2
PUBLIC _word_38FC8
PUBLIC _word_38FCC
PUBLIC _var_351
PUBLIC _var_352
PUBLIC _var_353
PUBLIC _var_354
PUBLIC _var_566
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
PUBLIC aMap
PUBLIC aNoFileBuffersAvailabl
PUBLIC aOpenError
PUBLIC audio_jump_6b
PUBLIC audio_jump_6c
PUBLIC byte_36D86
PUBLIC byte_37116
PUBLIC byte_378EE
PUBLIC byte_378FC
PUBLIC byte_37903
PUBLIC byte_383E5
PUBLIC byte_3862A
PUBLIC byte_3862B
PUBLIC byte_38D61
PUBLIC byte_38D63
PUBLIC byte_3C8B0
PUBLIC dacValues
PUBLIC dacValues1
PUBLIC f15dgtlAddr
PUBLIC fileReadPos
PUBLIC g_missionStatus
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
PUBLIC picBuf
PUBLIC picDecodedRowBuf
PUBLIC rowOffset
PUBLIC strBuf
PUBLIC stru_33402
PUBLIC timerHandlerInstalled
PUBLIC tmpFileHandle
PUBLIC tmpPageIndex
PUBLIC unk_3C030
PUBLIC word_3298C
PUBLIC word_3298E
PUBLIC word_3309A
PUBLIC _word_3309A
PUBLIC word_333D2
PUBLIC word_333D4
PUBLIC word_333D8
PUBLIC word_333DA
PUBLIC word_336F0
PUBLIC word_37146
PUBLIC word_37148
PUBLIC word_37348
PUBLIC word_3734A
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
PUBLIC word_38F70
PUBLIC word_39606
PUBLIC word_39808
PUBLIC word_3B0AC
PUBLIC word_3B204
PUBLIC word_3B206
PUBLIC word_3B4D8
PUBLIC word_3B4E0
PUBLIC word_3B5D6
PUBLIC word_3B7DE
PUBLIC word_3BEBC
PUBLIC word_3BEC8
PUBLIC word_3BECE
PUBLIC word_3C020

.DATA ;dseg segment para public 'DATA' use16

aRegn_xxx db 'regn.xxx',0
aLb_xxx db 'lb.xxx',0
aPg_xxx db 'pg.xxx',0
aVn_xxx db 'vn.xxx',0
aMe_xxx db 'me.xxx',0
aNc_xxx db 'nc.xxx',0
PUBLIC _aNc_xxx
_aNc_xxx equ aNc_xxx
aCe_xxx db 'ce.xxx',0
aJp_xxx db 'jp.xxx',0
aNa_xxx db 'na.xxx',0
    db 0
_regnStr dw offset aRegn_xxx
_scenarioPlh dw offset aLb_xxx
    dw offset aPg_xxx ;"pg.xxx"
    dw offset aVn_xxx ;"vn.xxx"
    dw offset aMe_xxx ;"me.xxx"
    dw offset aNc_xxx ;"nc.xxx"
    dw offset aCe_xxx ;"ce.xxx"
    dw offset aJp_xxx ;"jp.xxx"
    dw offset aNa_xxx ;"na.xxx"
    db 0
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
word_3298A dw 0C4h
_word_3298C label byte
word_3298C dw 0A0h
_word_3298E label byte
word_3298E dw 64h
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
word_32A34 dw 0
_word_32A34 equ word_32A34
_aNone db 'None',0
    db 9 dup(0)
aSa2 db 'SA-2',0
    db 3 dup(0)
    db 0C8h
    db 0
    db 3
    db 3 dup(0)
aSa5 db 'SA-5',0
    db 3 dup(0)
    db 5Eh
    db 1
    db 2
    db 3 dup(0)
aSa8b db 'SA-8B',0
    db 2 dup(0)
    db 7Dh
    db 0
    db 5
    db 3 dup(0)
aSa10 db 'SA-10',0
    db 2 dup(0)
    db 40h
    db 1
    db 7
    db 0
    db 1
    db 0
aSa11 db 'SA-11',0
    db 2 dup(0)
    db 0C8h
    db 0
    db 5
    db 3 dup(0)
aSa12 db 'SA-12',0
    db 2 dup(0)
    db 22h
    db 1
    db 6
    db 0
    db 1
    db 0
aSa13 db 'SA-13',0
    db 2 dup(0)
    db 7Dh
    db 0
    db 3
    db 3 dup(0)
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
    db 3 dup(0)
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
    db 3 dup(0)
aHawk db 'Hawk',0
    db 3 dup(0)
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
    db 3 dup(0)
aTiger db 'Tiger',0
    db 2 dup(0)
    db 41h
    db 0
    db 4
    db 3 dup(0)
aSeacat db 'Seacat',0
    db 0
    db 0C8h
    db 0
    db 2
    db 3 dup(0)
aIl76 db 'IL76',0
    db 3 dup(0)
    db 0C8h
    db 0
    db 8
    db 0
    db 3
    db 9 dup(0)
    db 32h
    db 0
    db 5
    db 11 dup(0)
    db 46h
    db 0
    db 6
    db 11 dup(0)
    db 50h
    db 0
    db 7
    db 0
    db 1
    db 9 dup(0)
    db 64h
    db 0
    db 8
    db 0
    db 1
    db 0
    db 4Fh
    db 54h
    db 48h
    db 5 dup(0)
    db 0F4h
    db 1
    db 5
    db 0
    db 1
    db 9 dup(0)
    db 28h
    db 0
    db 3
    db 3 dup(0)
aMig23 label byte
_aircraftTypes equ aMig23
    db 'MIG-23',0
    db 20h
aFlogger db 'Flogger',0
_aFlogger equ aFlogger
    db 2 dup(0)
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
    db 3 dup(0)
aMig25 db 'MIG-25',0
    db 20h
aFoxbat db 'Foxbat',0
    db 3 dup(0)
    db 3Ah
    db 2
    db 0BCh
    db 2 dup(2)
    db 0
    db 12h
    db 3 dup(0)
    db 2
    db 3 dup(0)
aMig29 db 'MIG-29',0
    db 20h
aFulcrum db 'Fulcrum',0
    db 2 dup(0)
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
    db 3 dup(0)
aF1 db 'F-1',0
    db 3 dup(0)
    db 20h
aMirage db 'Mirage',0
    db 3 dup(0)
    db 16h
    db 3
    db 0A2h
    db 2 dup(3)
    db 0
    db 14h
    db 3 dup(0)
    db 2
    db 3 dup(0)
aSu27 db 'Su-27',0
    db 0
    db 20h
aFlanker db 'Flanker',0
    db 2 dup(0)
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
    db 3 dup(0)
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
    db 3 dup(0)
aF4e db 'F-4E',0
    db 2 dup(0)
    db 20h
    db 50h
    db 68h
    db 61h
    db 6Eh
    db 74h
    db 6Fh
    db 6Dh
    db 3 dup(0)
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
    db 3 dup(0)
    db 46h
    db 2Dh
    db 31h
    db 34h
    db 3 dup(0)
    db 20h
    db 54h
    db 6Fh
    db 6Dh
    db 63h
    db 61h
    db 74h
    db 4 dup(0)
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
    db 3 dup(0)
    db 46h
    db 2Dh
    db 31h
    db 38h
    db 3 dup(0)
    db 20h
    db 48h
    db 6Fh
    db 72h
    db 6Eh
    db 65h
    db 74h
    db 4 dup(0)
    db 94h
    db 2
    db 0CDh
    db 1
    db 5
    db 0
    db 2 dup(0FFh)
    db 2 dup(0)
    db 2
    db 3 dup(0)
aAn72 db 'An-72',0
    db 0
    db 20h
    db 43h
    db 6Fh
    db 61h
    db 6Ch
    db 65h
    db 72h
    db 4 dup(0)
    db 5Eh
    db 1
    db 6Ch
    db 2 dup(2)
    db 3 dup(0)
    db 9
    db 0
    db 2
    db 3 dup(0)
    db 46h
    db 2Dh
    db 31h
    db 38h
    db 3 dup(0)
    db 20h
    db 48h
    db 6Fh
    db 72h
    db 6Eh
    db 65h
    db 74h
    db 4 dup(0)
    db 94h
    db 2
    db 0CDh
    db 1
    db 5
    db 0
    db 2 dup(0FFh)
    db 4
    db 0
    db 2
    db 3 dup(0)
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
    db 2 dup(67h)
    db 65h
    db 72h
    db 3 dup(0)
    db 0E4h
    db 2
    db 30h
    db 2
    db 3
    db 3 dup(0)
    db 4
    db 0
    db 2
    db 3 dup(0)
    db 46h
    db 2Dh
    db 31h
    db 34h
    db 3 dup(0)
    db 20h
    db 54h
    db 6Fh
    db 6Dh
    db 63h
    db 61h
    db 74h
    db 4 dup(0)
    db 20h
    db 3
    db 20h
    db 3
    db 4
    db 0
    db 2 dup(0FFh)
    db 8
    db 0
    db 2
    db 3 dup(0)
    db 46h
    db 2Dh
    db 34h
    db 45h
    db 3 dup(0)
    db 20h
    db 50h
    db 68h
    db 61h
    db 6Eh
    db 74h
    db 6Fh
    db 6Dh
    db 3 dup(0)
    db 20h
    db 3
    db 8
    db 2
    db 4
    db 0
    db 2 dup(0FFh)
    db 0Bh
    db 0
    db 2
    db 3 dup(0)
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
    db 4 dup(0)
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
    db 3 dup(0)
    db 54h
    db 75h
    db 2Dh
    db 39h
    db 35h
    db 2 dup(0)
    db 20h
    db 42h
    db 65h
    db 61h
    db 72h
    db 6 dup(0)
    db 9Ah
    db 1
    db 0ECh
    db 13h
    db 1
    db 3 dup(0)
    db 12h
    db 0
    db 2
    db 3 dup(0)
    db 4Dh
    db 69h
    db 2Dh
    db 32h
    db 34h
    db 2 dup(0)
    db 20h
    db 48h
    db 69h
    db 6Eh
    db 64h
    db 6 dup(0)
    db 0C8h
    db 0
    db 2Ch
    db 2 dup(1)
    db 0
    db 11h
    db 0
    db 13h
    db 0
    db 2
    db 3 dup(0)
    db 46h
    db 2Dh
    db 35h
    db 4 dup(0)
    db 20h
    db 54h
    db 69h
    db 67h
    db 65h
    db 72h
    db 5 dup(0)
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
    db 3 dup(0)
    db 37h
    db 36h
    db 37h
    db 4 dup(0)
    db 20h
    db 42h
    db 6Fh
    db 65h
    db 69h
    db 6Eh
    db 67h
    db 4 dup(0)
    db 90h
    db 1
    db 0E8h
    db 3
    db 1
    db 0
    db 2 dup(0FFh)
    db 12h
    db 0
    db 2
    db 3 dup(0)
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
_word_33096 equ word_33096
word_33098 dw 1388h
_word_33098 equ word_33098
word_3309A dw 0
_word_3309A equ word_3309A
word_3309C dw 0Ch
_word_3309C equ word_3309C
word_3309E dw 12h
_word_3309E equ word_3309E
    db 3
    db 0
    _missleSpec MissileSpec <0, 4>
    MissileSpec <1, 4>
    MissileSpec <5, 6>
    MissileSpec <0>
word_330B4 dw 28Ah
_word_330B4 equ word_330B4
g_missionStatus dw 1
_g_missionStatus equ g_missionStatus
word_330BA dw 1
_word_330BA equ word_330BA
word_330BE dw 0
_word_330BE equ word_330BE
    db 1
    db 0
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
; var_83: weapon/target compatibility matrix, var_83[weaponIdx*13 + (byte_3BFA4[..]&0xf)]
; (missileTargetCompat, egtacmap.c). 20 weapons x 13 target categories, 260 bytes, ending at
; word_333D2. Rows w0/w1 (Sidewinder/AMRAAM) and w16/w17/w19 are zero; type-1 weapons don't use it.
word_332CE label byte
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
    dw 0
_word_333D2 equ word_333D2
word_333D4 dw 0
_word_333D4 equ word_333D4
    db 2 dup(0)
word_333D8 dw 0
_word_333D8 equ word_333D8
word_333DA dw 0
_word_333DA equ word_333DA
    db 38 dup(0)
    stru_33402 struc_9 8 dup(<0>)
_stru_33402 equ stru_33402
word_33442 dw 0
_word_33442 equ word_33442
word_33444 label word
_word_33444 equ word_33444
    db 3
    db 0
    db 3
    db 0
    db 2
    db 0
    db 1
    db 3 dup(0)
    db 2 dup(0FFh)
    db 0FEh
    db 3 dup(0FFh)
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
    db 7 dup(0FFh)
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
    db 3 dup(0)
    db 2 dup(0FFh)
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
    db 3 dup(0FFh)
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
    db 6 dup(0FFh)
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FDh
    db 3 dup(0FFh)
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
    db 2 dup(0FFh)
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
    db 2 dup(0)
    db 1
    db 4
    db 2 dup(0)
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
    db 2 dup(0)
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
    db 2 dup(0)
    db 1
    db 2 dup(0FFh)
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
    db 4 dup(0FFh)
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FDh
    db 3 dup(0FFh)
    _stru_335C4 Projectile 0Ch dup(<0>)
word_336E4 dw 4
_word_336E4 equ word_336E4
word_336EC dw 1
_word_336EC equ word_336EC
_word_336EC equ word_336EC
word_336EE dw 0
_word_336EE equ word_336EE
word_336F0 dw 0
_word_336F0 equ word_336F0
word_336F6 dw 0FFFFh
_word_336F6 equ word_336F6
word_336F8 dw 1
_word_336F8 equ word_336F8
word_336FA dw 0
_word_336FA equ word_336FA
word_33700 dw 0FFFFh
_word_33700 equ word_33700
word_33702 dw 1
PUBLIC _word_33702
_word_33702 equ word_33702
word_33704 dw 1
_word_33704 equ word_33704
word_33706 dw 1
_word_33706 equ word_33706
word_33708 dw 0
_word_33708 equ word_33708
word_33710 dw 1
_word_33710 equ word_33710
word_33712 dw 0
_word_33712 equ word_33712
word_33714 dw 0
_word_33714 equ word_33714
asc_33744 db 'L',0
    db '(',0
aS db 's',0
word_3374A dw 0
PUBLIC _word_3374A
_word_3374A equ word_3374A
PUBLIC _asc_33744
_asc_33744 equ asc_33744
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
_misc_jump_5b_getkey proc near              ; slot 0x5C
    db 0EAh ;jmp far ptr 0:0
    dd 0
_misc_jump_5b_getkey endp
    db 0EAh, 4 dup(0)                       ; slot 0x5D
PUBLIC _misc_jump_5d_readJoy
misc_jump_5d_readJoy proc near              ; slot 0x5E
    db 0EAh ;jmp far ptr 0:0
    dd 0
misc_jump_5d_readJoy endp
_misc_jump_5d_readJoy equ misc_jump_5d_readJoy
    db 0EAh, 4 dup(0)                       ; slot 0x5F
    db 0EAh, 4 dup(0)                       ; slot 0x60
    db 0EAh, 4 dup(0)                       ; slot 0x61
    db 0EAh, 4 dup(0)                       ; slot 0x62
    db 0EAh, 4 dup(0)                       ; slot 0x63
    db 0EAh, 4 dup(0)                       ; slot 0x64
_audio_jump_64 proc near                    ; slot 0x65
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_jump_64 endp
_audio_jump_65 proc near                    ; slot 0x66
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_jump_65 endp
_audio_jump_66 proc near                    ; slot 0x67
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_jump_66 endp
audio_jump_66 equ _audio_jump_66
    db 0EAh, 4 dup(0)                       ; slot 0x68
_audio_jump_68 proc near                    ; slot 0x69
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_jump_68 endp
audio_jump_68 equ _audio_jump_68
_audio_jump_69 proc near                    ; slot 0x6A
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_jump_69 endp
audio_jump_69 equ _audio_jump_69
audio_jump_6a proc near                     ; slot 0x6B
    db 0EAh ;jmp far ptr 0:0
    dd 0
audio_jump_6a endp
_audio_jump_6a equ audio_jump_6a
audio_jump_6b proc near                     ; slot 0x6C
    db 0EAh ;jmp far ptr 0:0
    dd 0
audio_jump_6b endp
audio_jump_6c proc near                     ; slot 0x6D
    db 0EAh ;jmp far ptr 0:0
    dd 0
audio_jump_6c endp
_audio_jump_6d proc near                    ; slot 0x6E
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_jump_6d endp
audio_jump_6d equ _audio_jump_6d
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
word_339F4 dw 0FFFFh
_word_339F4 equ word_339F4
    db 1
    db 3 dup(0)
    db 2 dup(0FFh)
    db 1
    db 3 dup(0)
    db 2 dup(0FFh)
    db 1
    db 3 dup(0)
    db 2
    db 0
    db 1
    db 0
    db 2
    db 3 dup(0)
    db 2
    db 0
    db 1
    db 3 dup(0)
    db 1
    db 3 dup(0)
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
    db 7 dup(0)
    db 2
    db 0
    db 2
    db 0
    db 1
    db 0
    db 2
    db 3 dup(0)
    db 1
    db 0
    db 1
    db 5 dup(0)
    db 1
    db 0
    db 2 dup(0FFh)
    db 2 dup(0)
    db 1
    db 0
    db 2 dup(0FFh)
    db 2 dup(0)
    db 1
    db 0
    db 2 dup(0FFh)
    db 2 dup(0)
    db 0FEh
    db 3 dup(0FFh)
    db 0FEh
    db 0FFh
    db 2 dup(0)
    db 0FEh
    db 3 dup(0FFh)
    db 2 dup(0)
    db 2 dup(0FFh)
    db 2 dup(0)
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 7 dup(0FFh)
    db 6 dup(0)
    db 0FEh
    db 0FFh
    db 0FEh
    db 3 dup(0FFh)
    db 0FEh
    db 0FFh
    db 2 dup(0)
    db 4 dup(0FFh)
    db 4 dup(0)
    db 0FEh
    db 0FFh
    db 2
    db 0
    db 2 dup(0FFh)
    db 1
    db 3 dup(0)
    db 0FEh
    db 0FFh
    db 2
    db 0
    db 2 dup(0FFh)
    db 1
    db 3 dup(0)
    db 0FEh
    db 0FFh
    db 2
    db 0
    db 2 dup(0FFh)
    db 1
    db 3 dup(0)
    db 2
    db 0
    db 1
    db 0
    db 2
    db 3 dup(0)
    db 2
    db 0
    db 1
    db 0
    db 2 dup(0FFh)
    db 2
    db 3 dup(0)
    db 1
    db 0
    db 0FEh
    db 0FFh
    db 2
    db 0
    db 2 dup(0FFh)
    db 1
    db 3 dup(0)
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
    db 11 dup(0)
    db 2
    db 0
    db 2
    db 0
    db 1
    db 0
    db 2
    db 3 dup(0)
    db 1
    db 0
    db 2
    db 0
    db 2 dup(0FFh)
    db 1
    db 3 dup(0)
    db 2
    db 0
    db 0FEh
    db 0FFh
    db 1
    db 0
    db 2 dup(0FFh)
    db 2 dup(0)
    db 2
    db 0
    db 0FEh
    db 0FFh
    db 1
    db 0
    db 2 dup(0FFh)
    db 2 dup(0)
    db 2
    db 0
    db 0FEh
    db 0FFh
    db 1
    db 0
    db 2 dup(0FFh)
    db 2 dup(0)
    db 2
    db 0
    db 0FEh
    db 0FFh
    db 1
    db 0
    db 2 dup(0FFh)
    db 2 dup(0)
    db 0FEh
    db 3 dup(0FFh)
    db 0FEh
    db 0FFh
    db 2 dup(0)
    db 0FEh
    db 3 dup(0FFh)
    db 1
    db 0
    db 0FEh
    db 0FFh
    db 2 dup(0)
    db 2 dup(0FFh)
    db 2
    db 0
    db 0FEh
    db 0FFh
    db 1
    db 0
    db 2 dup(0FFh)
    db 2 dup(0)
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 0FFh
    db 0FEh
    db 11 dup(0FFh)
    db 10 dup(0)
    db 0FEh
    db 0FFh
    db 0FEh
    db 3 dup(0FFh)
    db 0FEh
    db 0FFh
    db 2 dup(0)
    db 2 dup(0FFh)
    db 0FEh
    db 0FFh
    db 1
    db 0
    db 2 dup(0FFh)
    db 0FEh
    db 0FFh
    db 2
    db 0
    db 2 dup(0FFh)
    db 1
    db 5 dup(0)
word_33B74 dw 0FFFFh
_word_33B74 equ word_33B74
    db 1
    db 0
    db 1
    db 0
    db 2 dup(0FFh)
    db 2 dup(0)
    db 1
    db 3 dup(0)
    db 2 dup(0FFh)
    db 2 dup(0)
word_33B86 dw 1
_word_33B86 equ word_33B86
    db 1
    db 0
    db 4 dup(0FFh)
    db 1
    db 3 dup(0)
    db 2 dup(0FFh)
    db 5 dup(0)
    db 0E0h
    db 0
    db 0F0h
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
word_33BAC dw 0
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
_buf3d3 dw 64h dup(0)
_sizes3dt dw 20h
    dw 20h
    dw 20h
    dw 20h
    dw 20h
_matrix3dt dw 0A0h dup(0)
_word_33DD0 dw 0
word_33DD2 dw 0
    db 60 dup(0)
_unk_33E1A db 10h
    db 17 dup(10h)
    db 0
    db 1
    db 2
    db 3
    db 4 dup(10h)
    db 4
    db 5
    db 6
    db 7
    db 4 dup(10h)
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 4 dup(11h)
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 7 dup(11h)
    db 3 dup(10h)
    db 11h
    db 2 dup(10h)
    db 2 dup(11h)
    db 8 dup(10h)
    db 3 dup(11h)
    db 6 dup(10h)
    db 2 dup(11h)
    db 2 dup(10h)
    db 0
    db 1
    db 2
    db 3
    db 2 dup(11h)
    db 2 dup(10h)
    db 4
    db 5
    db 6
    db 7
    db 4 dup(10h)
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 4 dup(10h)
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 18 dup(10h)
    db 18 dup(11h)
    db 0
    db 1
    db 2
    db 3
    db 2 dup(11h)
    db 10h
    db 11h
    db 4
    db 5
    db 6
    db 7
    db 11h
    db 2 dup(10h)
    db 11h
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 2 dup(11h)
    db 2 dup(10h)
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 18 dup(10h)
    db 5 dup(11h)
    db 10h
    db 11h
    db 10h
    db 4 dup(11h)
    db 5 dup(10h)
    db 11h
    db 0
    db 1
    db 2
    db 3
    db 3 dup(10h)
    db 11h
    db 4
    db 5
    db 6
    db 7
    db 4 dup(10h)
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 4 dup(10h)
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 18 dup(10h)
    db 2 dup(11h)
    db 7 dup(10h)
    db 11h
    db 8 dup(10h)
    db 0
    db 1
    db 2
    db 3
    db 4 dup(10h)
    db 4
    db 5
    db 6
    db 7
    db 2 dup(10h)
    db 11h
    db 10h
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 4 dup(11h)
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 18 dup(11h)
    db 18 dup(10h)
    db 0
    db 1
    db 2
    db 3
    db 4 dup(10h)
    db 4
    db 5
    db 6
    db 7
    db 2 dup(10h)
    db 2 dup(11h)
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 2 dup(10h)
    db 2 dup(11h)
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 3 dup(10h)
    db 2 dup(11h)
    db 10h
    db 3 dup(11h)
    db 6 dup(10h)
    db 11h
    db 3 dup(10h)
    db 3 dup(11h)
    db 4 dup(10h)
    db 2 dup(11h)
    db 6 dup(10h)
    db 11h
    db 10h
    db 0
    db 1
    db 2
    db 3
    db 2 dup(10h)
    db 11h
    db 10h
    db 4
    db 5
    db 6
    db 7
    db 2 dup(11h)
    db 2 dup(10h)
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 4 dup(10h)
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 10 dup(10h)
    db 11h
    db 2 dup(10h)
    db 2 dup(11h)
    db 3 dup(10h)
    db 3 dup(11h)
    db 2 dup(10h)
    db 2 dup(11h)
    db 10h
    db 4 dup(11h)
    db 10h
    db 5 dup(11h)
    db 0
    db 1
    db 2
    db 3
    db 4 dup(11h)
    db 4
    db 5
    db 6
    db 7
    db 2 dup(10h)
    db 11h
    db 10h
    db 8
    db 9
    db 0Ah
    db 0Bh
    db 2 dup(10h)
    db 2 dup(11h)
    db 0Ch
    db 0Dh
    db 0Eh
    db 0Fh
    db 2 dup(10h)
    db 6 dup(11h)
    db 2 dup(10h)
    db 7 dup(11h)
    db 10h
_word_3401A dw 0
    db 2 dup(0)
aPleaseInsertScenarioD db 'Please insert scenario disk',0
_unk_34121 db 20h
    db 20h
aPressAKeyWhenReady db 'Press a key when ready',0
word_34150 dw 0
word_34152 dw 0
    db 2 dup(0)
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
word_34190 dw 0
word_34192 dw 0
word_34194 dw 0
byte_34196 db 3
_byte_34197 db 6
word_34198 dw 0
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
word_341DC db 2
_word_341DC equ word_341DC
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
word_341FC db 3
_word_341FC equ word_341FC
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
dword_3423C dw 0
word_3423E dw 0
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
PUBLIC _word_34256
_word_34256 equ word_34256
byte_34258 db 0
    db 7 dup(0)
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
    db 2 dup(0)
byte_342B4 db 0
    db 0
word_342B6 dw 0
word_342B8 dw 0
word_342BA dw 0
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
word_37557 dw 13Fh
word_37559 dw 6Fh
    db 2 dup(0)
_word_3755D dw 0
_word_3755F dw 0
_word_37561 dw 0
_word_37563 dw 0
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
byte_378EE db 0
PUBLIC _byte_378EE
_byte_378EE equ byte_378EE
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
_byte_37C2F db 0
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
byte_37F98 db 0
_byte_37F98 equ byte_37F98
byte_37F99 db 0
_byte_37F99 equ byte_37F99
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
_unk_3806E db 0FFh
    db 7Fh
word_38070 dw 0
word_38072 dw 0
word_38074 dw 0
word_38076 dw 7FFFh
word_38078 dw 0
    db 4 dup(0)
word_3807E dw 7FFFh
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
_unk_380B6 db 0
    db 17 dup(0)
_g_ourHead dw 0
_g_ourPitch dw 0
_g_ourRoll dw 0
_g_viewZ dw 0
_word_380D0 dw 0
    db 0Ch
    db 5 dup(0)
var_549_stor dw 0
byte_380DA db 0
    db 0
    db 1
byte_380DD db 0
_byte_380DD equ byte_380DD
_word_380D8 equ byte_380DD
    db 2 dup(0)
g_setThrust dw 0
_g_setThrust equ g_setThrust
word_380E2 dw 0
_word_380E2 equ word_380E2
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
_word_38152 dw 0
    db 0 ;align 2
word_3815E dw 0
    db 0 ;align 2
PUBLIC aMisses
aMisses db ' misses ',0
PUBLIC aDestroyedBy
aDestroyedBy db ' destroyed by ',0
PUBLIC aDestroyedBy_0
aDestroyedBy_0 db ' destroyed by ',0
PUBLIC aGroundImpact
aGroundImpact db ' ground impact',0
PUBLIC aHitBy
aHitBy db 'Hit by ',0
PUBLIC aIneffective
aIneffective db 'Ineffective',0
PUBLIC aHitBy_0
aHitBy_0 db ' hit by ',0
    db 0 ;align 2
PUBLIC _aA
aA db 'A',0
_aA equ aA
    db 1Ah
    db 0
    db 65h
    db 0
aEmpty_5950 db 0
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
_off_38334 dw offset unk_3831E
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
_word_383AE dw 0
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
    db 2 dup(1)
    db 0
    db 1
    db 0
_word_383CC dw 0
word_383CE dw 0
word_383D0 dw 0
word_383D2 dw 0
word_383D4 dw 0
word_383D6 dw 0
word_383D8 dw 0
word_383DA dw 0
    db 2 dup(0)
    db 61h
    db 3 dup(0)
    db 3Fh
    db 1
byte_383E4 db 1
var_586 db 1
    db 1
    db 0
    db 1
    db 0
byte_383E5 dw 8
_byte_383E5 equ byte_383E5
radarRange dw 1
word_383EE dw 0
word_383F0 dw 0
_word_383F2 dw 0
_word_383F4 dw 0
aTac db 'Tac',0
aMap db 'Map',0
    db 5 dup(0)
word_38460 dw 0
    db 0
    db 0
_byte_3850E db 0
    db 0
    db 0 ;align 2
    db 0 ;align 2
word_38600 dw 0
word_38602 dw 2
_word_38602 equ word_38602
word_38604 dw 0
word_38606 dw 0
PUBLIC _word_38606
_word_38606 equ word_38606
word_38608 dw 0
word_3860A dw 0
    db 2 dup(0)
aNotAvailable db ' not available',0
_aNotAvailable equ aNotAvailable
aArmed db ' armed',0
_aArmed equ aArmed
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
    db 6 dup(0)
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
ORG 00178h
_var_47 EQU _waypoints + 6
ORG 0017Eh
_var_48 EQU _waypoints + 0Ch
ORG 00180h
_var_49 EQU _waypoints + 0Eh
ORG 00A1Eh
_var_83 EQU word_332CE
ORG 01100h
_var_134 EQU word_339B0
ORG 01102h
_var_135 EQU byte_339B2
ORG 012FCh
_var_141 EQU word_33BAC
ORG 01308h
_var_143 EQU word_33BB8
ORG 018EAh
_var_190 EQU byte_3419A
ORG 01904h
_var_194 EQU word_341B4
ORG 01906h
_var_195 EQU word_341B6
ORG 01908h
_var_196 EQU word_341B8
ORG 0190Ah
_var_197 EQU word_341BA
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
_var_202 EQU word_34240
ORG 01992h
_var_203 EQU word_34242
ORG 01994h
_var_204 EQU word_34244
ORG 019A8h
_var_215 EQU byte_34258
ORG 019B0h
_var_216 EQU word_34260
ORG 019B2h
_var_217 EQU word_34262
ORG 019B4h
_var_218 EQU word_34264
ORG 019B6h
_var_219 EQU word_34266
ORG 019B8h
_var_220 EQU word_34268
ORG 019BEh
_var_224 EQU word_3426E
ORG 019C0h
_var_225 EQU word_34270
ORG 019C2h
_var_226 EQU word_34272
ORG 019C4h
_var_227 EQU word_34274
ORG 019FCh
_var_255 EQU word_342AC
ORG 019FEh
_var_256 EQU word_342AE
ORG 01A00h
_var_257 EQU word_342B0
ORG 01A04h
_var_258 EQU byte_342B4
ORG 01A06h
_var_259 EQU word_342B6
ORG 01A08h
_var_260 EQU word_342B8
ORG 01A0Ah
_var_261 EQU word_342BA
ORG 01FB8h
_var_279 EQU word_34868
ORG 0219Ch
_var_282 EQU word_34A4C
ORG 042D6h
_var_315 EQU _word_36B86
ORG 042D8h
_var_316 EQU byte_36B88
ORG 04CA7h
_var_349 EQU word_37557
ORG 04CA9h
_var_350 EQU word_37559
ORG 04CADh
_var_351 EQU _word_3755D
ORG 04CAFh
_var_352 EQU _word_3755F
ORG 04CB1h
_var_353 EQU _word_37561
ORG 04CB3h
_var_354 EQU _word_37563
ORG 0505Ah
_var_383 EQU word_3790A
ORG 05374h
_var_456 EQU _byte_37C24
ORG 057C0h
_var_524 EQU word_38070
ORG 057C2h
_var_525 EQU word_38072
ORG 057C4h
_var_526 EQU word_38074
ORG 057C6h
_var_527 EQU word_38076
ORG 057C8h
_var_528 EQU word_38078
ORG 057CEh
_var_529 EQU word_3807E
ORG 05818h
_var_542 EQU _g_ourHead
ORG 05819h
_var_543 EQU _g_ourHead + 1
ORG 0581Ah
_var_544 EQU _g_ourPitch
ORG 0581Ch
_var_545 EQU _g_ourRoll
ORG 0581Eh
_var_547 EQU _g_viewZ
_uvar_547 EQU _g_viewZ
ORG 05820h
_var_548 EQU _word_380D0
ORG 05828h
_var_549 EQU var_549_stor
ORG 0582Ah
_var_550 EQU byte_380DA
ORG 05830h
_var_552 EQU g_setThrust
ORG 058AEh
_var_556 EQU word_3815E
ORG 05A84h
_var_564 EQU _off_38334
ORG 05A9Ch
_var_565 EQU _off_3834C
ORG 05AB4h
_var_566 EQU _off_38364
ORG 05ACCh
_var_567 EQU word_3837C
ORG 05AFCh
_var_568 EQU word_383AC
ORG 05AFEh
_var_569 EQU _word_383AE
ORG 05B00h
_var_570 EQU word_383B0
ORG 05B02h
_var_571 EQU word_383B2
ORG 05B04h
_var_572 EQU word_383B4
ORG 05B06h
_var_573 EQU word_383B6
ORG 05B08h
_var_574 EQU word_383B8
ORG 05B0Ah
_var_575 EQU word_383BA
ORG 05B0Ch
_var_576 EQU word_383BC
ORG 05B1Ch
_var_577 EQU _word_383CC
ORG 05B1Eh
_var_578 EQU word_383CE
ORG 05B20h
_var_579 EQU word_383D0
ORG 05B22h
_var_580 EQU word_383D2
ORG 05B24h
_var_581 EQU word_383D4
ORG 05B26h
_var_582 EQU word_383D6
ORG 05B28h
_var_583 EQU word_383D8
ORG 05B2Ah
_var_584 EQU word_383DA
ORG 05B34h
_var_585 EQU byte_383E4
ORG 05B35h
_var_586 EQU var_586
ORG 05B3Ch
_var_588 EQU radarRange
ORG 05B3Eh
_var_589 EQU word_383EE
ORG 05B40h
_var_590 EQU word_383F0
ORG 05B42h
_var_591 EQU _word_383F2
ORG 05B44h
_var_592 EQU _word_383F4
ORG 05BB0h
_var_593 EQU word_38460
ORG 05C5Eh
_var_594 EQU _byte_3850E
ORG 05D50h
_var_595 EQU word_38600
ORG 05D52h
_var_596 EQU word_38602
ORG 05D54h
_var_597 EQU word_38604
ORG 05D56h
_var_598 EQU word_38606
ORG 05D58h
_var_599 EQU word_38608
ORG 05D5Ah
_var_600 EQU word_3860A
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
ORG 06422h
_var_654 EQU word_38CD2
ORG 06428h
_var_657 EQU word_38CD8
ORG 0642Ah
_var_658 EQU word_38CDA
ORG 0642Ch
_var_659 EQU word_38CDC
ORG 0642Eh
_var_660 EQU word_38CDE
ORG 06430h
_var_661 EQU word_38CE0
ORG 06432h
_var_662 EQU word_38CE2
ORG 06434h
_var_663 EQU word_38CE4
ORG 06436h
_var_664 EQU word_38CE6
ORG 06438h
_var_665 EQU word_38CE8
ORG 0643Ah
_var_666 EQU word_38CEA
ORG 0643Ch
_var_667 EQU word_38CEC
ORG 0643Eh
_var_668 EQU word_38CEE
ORG 06440h
_var_669 EQU word_38CF0
ORG 06442h
_var_670 EQU word_38CF2
ORG 0644Ah
_var_671 EQU word_38CFA
ORG 0644Ch
_var_672 EQU word_38CFC
ORG 0644Eh
_var_673 EQU word_38CFE
ORG 06450h
_var_674 EQU word_38D00
ORG 06452h
_var_675 EQU word_38D02
ORG 06454h
_var_676 EQU word_38D04
ORG 06456h
_var_677 EQU word_38D06
ORG 0649Ch
_var_680 EQU word_38D4C
ORG 0649Eh
_var_681 EQU word_38D4E
ORG 064A0h
_var_682 EQU word_38D50
ORG 064A2h
_var_683 EQU word_38D52
ORG 064A4h
_var_684 EQU word_38D54
ORG 064A6h
_var_685 EQU word_38D56
ORG 064A8h
_var_686 EQU word_38D58
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
_word_38F70 equ word_38F70
word_38F72 dw ?
_word_38F72 equ word_38F72
strBuf db 18h dup(?)
_strBuf equ strBuf
byte_38F8C db ?
_byte_38F8C equ byte_38F8C
byte_38F8D db ?
_byte_38F8D equ byte_38F8D
    db 54 dup(?)
_word_38FC6 label byte
word_38FC6 dw ?
word_38FC8 dw ?
_word_38FC8 equ word_38FC8
    db ? ;align 4
    db ?
word_38FCC dw ?
_word_38FCC equ word_38FCC
word_38FCE dw ?
_word_38FCE equ word_38FCE
unk_38FD0 db ?
_unk_38FD0 equ unk_38FD0
    db 9 dup(?)
g_gees dw ?
_g_gees equ g_gees
word_38FDE dw ?
_word_38FDE equ word_38FDE
word_38FE0 dw ?
_word_38FE0 equ word_38FE0
word_38FE8 dw ?
_word_38FE8 equ word_38FE8
word_38FEC dw ?
_word_38FEC equ word_38FEC
word_38FEE dw ?
_word_38FEE equ word_38FEE
_gameData dd ?
    db 2 dup(?)
word_38FF6 dw ?
_word_38FF6 equ word_38FF6
word_38FF8 dw ?
_word_38FF8 equ word_38FF8
word_38FFC dw ?
_word_38FFC equ word_38FFC
_buf4_3dg db 200h dup(?)
word_39200 dw ?
_word_39200 equ word_39200
_buf3_3dg db 200h dup(?)
word_39402 dw ?
_word_39402 equ word_39402
    db 512 dup(?)
word_39606 dw ?
_word_39606 equ word_39606
_buf2_3dg db 200h dup(?)
word_39808 dw ?
_word_39808 equ word_39808
    db 80 dup(?)
_buf1_3dg db 100h dup(?)
_byte_3995A db ?
    db ?
word_3995C dw ?
_word_3995C equ word_3995C

; Matrix3dEntry7 storage.
; 571 full records * 7 bytes + 3 spare bytes = 4000 bytes. => #define MAX_TILE_DATA 4000
_buf_3dt db 4000 dup(?)

word_3A8FE dw ?
_word_3A8FE equ word_3A8FE
_byte_3A900 db 40h dup(?)
_word_3A940 dw ?
    db ? ;align 4
    db ?
g_velocity dw ?
PUBLIC _g_velocity
_g_velocity equ g_velocity
word_3A946 dw ?
_word_3A946 equ word_3A946
_unk_3A948 db ?
    db 17 dup(?)
    _stru_3A95A ViewSnapshot 10h dup(<?>)
_word_3AA5C dw ?
    _g_planes MapTarget 4Ah dup(<?>)
    db 14 dup(?)
word_3AF0C dw ?
_word_3AF0C equ word_3AF0C
_buf3d3_1 db 96h dup(?)
word_3AFA4 dw ?
_word_3AFA4 equ word_3AFA4
g_thrust dw ?
_g_thrust equ g_thrust
_word_3AFA8 label word
word_3AFA8 dw ?
word_3AFAA dw ?
_word_3AFAA equ word_3AFAA
_byte_3AFAC db 100h dup(?)
word_3B0AC dw ?
_word_3B0AC equ word_3B0AC
_buf3d3_2 db 96h dup(?)
_buf3d3_3 db 96h dup(?)
_stru_3B202 db ?
    db ?
_word_3B204 label byte
word_3B204 dw ?
word_3B206 dw ?
_word_3B206 equ word_3B206
    _stru_3B208 SimObject <?>
word_3B22C dw ?
_word_3B22C equ word_3B22C
word_3B22E dw ?
_word_3B22E equ word_3B22E
word_3B230 dw ?
_word_3B230 equ word_3B230
word_3B232 dw ?
_word_3B232 equ word_3B232
word_3B234 dw ?
_word_3B234 equ word_3B234
word_3B236 dw ?
_word_3B236 equ word_3B236
    db 6 dup(?)
byte_3B23E db ?
_byte_3B23E equ byte_3B23E
    db ? ;align 2
word_3B240 dw ?
_word_3B240 equ word_3B240
    db 656 dup(?)
word_3B4D2 dw ?
_word_3B4D2 equ word_3B4D2
word_3B4D8 dw ?
_word_3B4D8 equ word_3B4D8
word_3B4DA dw ?
_word_3B4DA equ word_3B4DA
word_3B4DC dw ?
_word_3B4DC equ word_3B4DC
word_3B4E0 dw ?
_word_3B4E0 equ word_3B4E0
_hercFlag db ?
    db ?
byte_3B4E6 db ?
_byte_3B4E6 equ byte_3B4E6
byte_3B4E7 db ?
byte_3B4E8 db ?
byte_3B4E9 db ?
word_3B4EA dw ?
byte_3B4EC db ?
_byte_3B4EC equ byte_3B4EC
    db 233 dup(?)
word_3B5D6 dw ?
_word_3B5D6 equ word_3B5D6
    db 514 dup(?)
word_3B7DE dw ?
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
byte_3B7EE db ?
_byte_3B7EE equ byte_3B7EE
byte_3B7EF db ?
_byte_3B7EF equ byte_3B7EF
byte_3B7F0 db ?
_byte_3B7F0 equ byte_3B7F0
byte_3B7F1 db ?
_byte_3B7F1 equ byte_3B7F1
    db ? ;align 8
    db 5 dup(?)
_byte_3B7FC db 640h dup(?)
word_3BE3C dw ?
_word_3BE3C equ word_3BE3C
_byte_3BE3E db 40h dup(?)
word_3BE7E dw ?
_word_3BE7E equ word_3BE7E
_byte_3BE80 db 10h dup(?)
word_3BE96 dw ?
_word_3BE96 equ word_3BE96
_word_3BE98 dw ?
    db ? ;align 4
    db ?
_word_3BE9C label byte
word_3BE9C dw ?
    db 30 dup(?)
word_3BEBC dw ?
_word_3BEBC equ word_3BEBC
word_3BEC2 dw ?
_word_3BEC2 equ word_3BEC2
_byte_3BEC4 db ?
    db ? ;align 4
    db 2 dup(?)
word_3BEC8 dw ?
_word_3BEC8 equ word_3BEC8
word_3BECC dw ?
_word_3BECC equ word_3BECC
word_3BECE dw ?
_word_3BECE equ word_3BECE
word_3BED4 dw ?
_word_3BED4 equ word_3BED4
word_3BED6 dw ?
_word_3BED6 equ word_3BED6
_byte_3BED8 db 64h dup(?)
word_3BF3C dw ?
_word_3BF3C equ word_3BF3C
word_3BF3E dw ?
_word_3BF3E equ word_3BF3E
_tempString db 50h dup(?)
g_gunHits dw ?
_g_gunHits equ g_gunHits
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
    db 3 dup(?)
word_3BFA0 dw ?
_word_3BFA0 equ word_3BFA0
word_3BFA2 dw ?
_word_3BFA2 equ word_3BFA2
_byte_3BFA4 db 64h dup(?)
_word_3C008 dw ?
word_3C00A dw ?
_word_3C00A equ word_3C00A
_word_3C00C dw ?
word_3C00E dw ?
_word_3C00E equ word_3C00E
_flagFarToNear dw ?
keyScancode dw ?
_keyScancode equ keyScancode
word_3C014 dw ?
_word_3C014 equ word_3C014
word_3C016 dw ?
_word_3C016 equ word_3C016
word_3C018 dw ?
_word_3C018 equ word_3C018
word_3C01A dw ?
_word_3C01A equ word_3C01A
_dword_3C01C dd ?
word_3C020 dw ?
PUBLIC _word_3C020
PUBLIC _word_3B7E2
PUBLIC _word_3B7EC
PUBLIC _word_3C5A8
_word_3C020 equ word_3C020
    db ? ;align 4
    db ?
_dword_3C024 dd ?
_word_3C028 dw ?
_byte_3C02A db ?
    db ? ;align 2
_word_3C02C dw ?
_word_3C02E dw ?
_unk_3C030 label byte
unk_3C030 db ?
    db 9 dup(?)
_word_3C03A dw ?
    db 2 dup(?)
word_3C03E dw ?
_word_3C03E equ word_3C03E
_word_3C040 dw ?
word_3C042 dw ?
_word_3C042 equ word_3C042
word_3C044 dw ?
_word_3C044 equ word_3C044
_word_3C046 dw ?
PUBLIC _word_3C048
word_3C048 dw ?
_word_3C048 equ word_3C048
_string_3C04A db 50h dup(?)
_word_3C09A dw ?
word_3C09C dw ?
_word_3C09C equ word_3C09C
_word_3C09E dw ?
word_3C0A0 dw ?
_word_3C0A0 equ word_3C0A0
_word_3C0A2 dw 64h dup(?)
_g_closestThreatIndex dw ?
word_3C16C dw ?
_word_3C16C equ word_3C16C
_byte_3C16E db 2EEh dup(?)
_g_currentWeaponType dw ?
word_3C45E dw ?
_word_3C45E equ word_3C45E
_matrix3dt_2 dw 0A0h dup(?)
_byte_3C5A0 db ?
    db ?
word_3C5A2 dw ?
_word_3C5A2 equ word_3C5A2
word_3C5A4 dw ?
_word_3C5A4 equ word_3C5A4
_word_3C5A6 dw ?
word_3C5A8 dw ?
_word_3C5A8 equ word_3C5A8
_word_3C5AA dw ?
word_3C5AC dw ?
_word_3C5AC equ word_3C5AC
word_3C5AE dw ?
_word_3C5AE equ word_3C5AE
word_3C5B0 dw ?
_word_3C5B0 equ word_3C5B0
word_3C5B2 dw ?
_word_3C5B2 equ word_3C5B2
word_3C5B4 dw ?
_word_3C5B4 equ word_3C5B4
word_3C5B6 dw ?
_word_3C5B6 equ word_3C5B6
    db 228 dup(?)
    PUBLIC _word_3C69C
word_3C69C dw ?
_word_3C69C equ word_3C69C
_word_3C69E dw ?
byte_3C6A0 db ?
_byte_3C6A0 equ byte_3C6A0
    db ? ;align 2
    PUBLIC _word_3C6A2
word_3C6A2 dw ?
_word_3C6A2 equ word_3C6A2
_word_3C6A4 dw ?
_commData dd ?
word_3C6AA dw ?
_word_3C6AA equ word_3C6AA
_word_3C6AC dw ?
word_3C6AE dw ?
_word_3C6AE equ word_3C6AE
PUBLIC _word_3C6AE
PUBLIC byte_3416E
PUBLIC byte_3416F
PUBLIC byte_34170
PUBLIC byte_34196
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
PUBLIC word_33BAC
PUBLIC word_34150
PUBLIC word_34152
PUBLIC word_34156
PUBLIC word_34158
PUBLIC word_3415A
PUBLIC word_3415C
PUBLIC word_3415E
PUBLIC word_34160
PUBLIC word_34162
PUBLIC word_34164
PUBLIC word_34166
PUBLIC word_34168
PUBLIC word_3416A
PUBLIC word_3416C
PUBLIC word_34171
PUBLIC word_34173
PUBLIC word_34175
PUBLIC word_34177
PUBLIC word_34179
PUBLIC word_3417B
PUBLIC word_3417D
PUBLIC word_3417F
PUBLIC word_34190
PUBLIC word_34192
PUBLIC word_34194
PUBLIC word_34198
PUBLIC word_34246
PUBLIC word_34248
PUBLIC word_3424A
PUBLIC word_3424C
PUBLIC word_3424E
PUBLIC word_34250
PUBLIC word_34252
PUBLIC word_34254
PUBLIC word_34256
PUBLIC word_34268
PUBLIC word_3426A
PUBLIC word_3426C
PUBLIC word_3426E
PUBLIC word_34270
PUBLIC word_34272
PUBLIC word_34274
PUBLIC word_34276
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
PUBLIC word_3C16C
PUBLIC word_3C69C
PUBLIC word_3C6A2
PUBLIC word_3837C
PUBLIC word_383AC
PUBLIC word_38A3A
PUBLIC word_38BC6
PUBLIC buf6data_0
PUBLIC buf6data_1
PUBLIC buf6data_3
PUBLIC lzw_processFlag
PUBLIC buf6data_4
PUBLIC aEmpty_5950
PUBLIC aMig23
PUBLIC _aMig23
PUBLIC _aircraftTypes
_aMig23 equ aMig23
PUBLIC _aEmpty_5950
_aEmpty_5950 equ aEmpty_5950
PUBLIC _aMap
_aMap equ aMap
PUBLIC _word_34276
_word_34276 equ word_34276
_word_3C6AE equ word_3C6AE
    db ? ;align 400h
    db 511 dup(?)
    PUBLIC _byte_3C8B0
_byte_3C8B0 label byte
byte_3C8B0 db ?
    db ? ;align 2
word_3C8B2 dw ?
_word_3C8B2 equ word_3C8B2
_gfxBufPtr dw ?
_word_3C8B6 dw ?
word_3C8B8 dw ?
_word_3C8B8 equ word_3C8B8
word_3C8BA dw ?
word_3C8BC dw ?
_word_3C8BC equ word_3C8BC
word_3C8BE dw ?
word_3C8C0 dw ?
_word_3C8C0 equ word_3C8C0
word_3C8C2 dw ?
_size3d3_7 dw ?
    db 10 dup(?)

__bss_end label byte

END
