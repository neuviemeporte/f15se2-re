.8086
DOSSEG
.MODEL SMALL
EXTRN _placeString:PROC
EXTRN _process3dg:PROC
EXTRN _sub_11F3E:PROC
EXTRN _sub_15411:PROC
EXTRN _sub_1543B:PROC
EXTRN _sub_132BA:PROC
EXTRN _sub_13224:PROC
EXTRN _sub_13266:PROC
EXTRN _sub_13816:PROC
EXTRN _sub_139C0:PROC
PUBLIC _byte_3B4E6
PUBLIC _var_548
PUBLIC _var_47
PUBLIC _var_48
PUBLIC _var_49
PUBLIC _var_810
PUBLIC _var_811
PUBLIC _var_727
PUBLIC _var_732
PUBLIC _sub_167B4
PUBLIC _var_597

PUBLIC _aAutomaticLandi
PUBLIC _aSafeLanding
PUBLIC _aWeaponsRepleni
PUBLIC _sub_16172
PUBLIC _sub_179EE
PUBLIC _aReadyForTakeof
PUBLIC _var_660
PUBLIC _word_39402
PUBLIC _word_38FCE
PUBLIC _byte_3419A
PUBLIC _byte_3419C
PUBLIC _aBrg
PUBLIC _var_568
PUBLIC _var_680
PUBLIC _var_681
PUBLIC _var_682
PUBLIC _var_683
PUBLIC _var_684
PUBLIC _var_685
PUBLIC _var_594
PUBLIC _word_38FF8
PUBLIC _strBuf
PUBLIC _aAt
PUBLIC _aNotAvailable
PUBLIC _aArmed
PUBLIC _byte_38F8C
PUBLIC _byte_38F8D
PUBLIC _aOnPatrol
PUBLIC _aF15StrikeEagle
PUBLIC _aNone
PUBLIC byte_37C2D
PUBLIC byte_37C2E
PUBLIC byte_37C35
PUBLIC byte_37C3A
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
_sub_167B4 equ sub_167B4

_aAutomaticLandi equ aAutomaticLandi
_aSafeLanding equ aSafeLanding
_aWeaponsRepleni equ aWeaponsRepleni
_sub_16172 equ sub_16172
_sub_179EE equ sub_179EE
_aReadyForTakeof equ aReadyForTakeof
EXTRN _sub_166BE:PROC
EXTRN _routine_191:PROC
EXTRN _sub_1660E:PROC
EXTRN _sub_11C21:PROC
EXTRN _sub_11D10:PROC
EXTRN _sub_11A18:PROC
EXTRN _sub_11A88:PROC
EXTRN _sub_126B4:PROC
EXTRN _sub_11971:PROC
EXTRN _zoomIn:PROC
EXTRN _zoomOut:PROC
EXTRN _sub_1DBE0:PROC
EXTRN _sub_1DA5F:PROC
EXTRN _sub_1DB9C:PROC
EXTRN _makeSound:PROC
EXTRN _sub_1DA8D:PROC
EXTRN _sub_1613B:PROC
EXTRN _sub_1DAAE:PROC
EXTRN _sub_155AB:PROC
EXTRN _main:PROC
EXTRN _sub_18E50:PROC
EXTRN _sub_1D1C8:PROC
EXTRN _sub_1D1E8:PROC
EXTRN _sub_1D21E:PROC
EXTRN _sub_1C7A2:PROC
EXTRN _sub_1C7C6:PROC
EXTRN _sub_1C7EA:PROC
EXTRN _sub_21A7A:PROC
EXTRN _sub_13922:PROC
EXTRN _sub_13932:PROC
EXTRN _sub_1CF8E:PROC
EXTRN _sub_1CF32:PROC
EXTRN _sub_1CB42:PROC
EXTRN _sub_1C9D2:PROC
EXTRN _sub_11BFD:PROC
EXTRN _sub_11BC3:PROC
EXTRN _sub_114E8:PROC
EXTRN _sub_1C371:PROC
EXTRN _sub_1C40B:PROC
EXTRN _sub_1C8A4:PROC
EXTRN _sub_1C864:PROC
EXTRN _sub_1C82D:PROC
EXTRN _sub_198FA:PROC
EXTRN _sub_19915:PROC
EXTRN _sub_118D5:PROC
EXTRN _sub_118F6:PROC
EXTRN _sub_18DF4:PROC
EXTRN _sub_18E38:PROC
EXTRN _sub_1957A:PROC
EXTRN _sub_19595:PROC
EXTRN _sub_13A90:PROC
EXTRN _copySomeMem:PROC
EXTRN _sub_1CF64:PROC
EXTRN _sub_1CFA6:PROC
EXTRN _sub_1D008:PROC
EXTRN _sub_1D178:PROC
EXTRN _sub_1D190:PROC
EXTRN _sub_1D200:PROC
EXTRN _sub_121C6:PROC
EXTRN _sub_154B7:PROC
EXTRN _sub_15540:PROC
EXTRN _sub_15557:PROC
EXTRN _sub_19BE1:PROC
EXTRN _sub_19C84:PROC
EXTRN _sub_19D86:PROC
EXTRN _sub_19FAD:PROC
EXTRN _sub_19FCC:PROC
EXTRN _sub_19E94:PROC
EXTRN _sub_19E44:PROC
EXTRN _sub_1A740:PROC
EXTRN _sub_1A7C4:PROC
EXTRN _sub_1606C:PROC
EXTRN _sub_15FDB:PROC
EXTRN _sub_19E5D:PROC
EXTRN _sub_1A1B1:PROC
EXTRN _sub_19A4D:PROC
EXTRN _sub_19B98:PROC
EXTRN _sub_1A204:PROC
EXTRN _sub_1A183:PROC
EXTRN _sub_1A25C:PROC
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
EXTRN _byte_228D0:BYTE
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
EXTRN _sub_13694:PROC
EXTRN _sub_13638:PROC
EXTRN _tempStrcpy:PROC
EXTRN _selectMissile:PROC
EXTRN _sub_18A44:PROC
EXTRN _sub_189AA:PROC
EXTRN _sub_19DB0:PROC
EXTRN _sub_19EB6:PROC
EXTRN _sub_1C1B9:PROC
EXTRN _sub_1C2F8:PROC
EXTRN _sub_1C488:PROC
EXTRN _sub_1C661:PROC
EXTRN _routine_328:PROC
EXTRN _routine_260:PROC
EXTRN _sub_1993A:PROC
EXTRN _sub_199EC:PROC
EXTRN _sub_1DB2B:PROC
EXTRN _sub_11636:PROC
EXTRN _sub_11676:PROC
EXTRN _sub_11841:PROC
EXTRN _sub_11B37:PROC
EXTRN _sub_10294:PROC
EXTRN _sub_10297:PROC
EXTRN _sub_13A6C:PROC
EXTRN _sub_1345E:PROC
EXTRN _sub_134AC:PROC
EXTRN _sub_136D2:PROC
EXTRN _sub_1378E:PROC
EXTRN _sub_185BE:NEAR
sub_185BE equ _sub_185BE
EXTRN _sub_186F8:NEAR
sub_186F8 equ _sub_186F8
EXTRN _sub_1783A:NEAR
sub_1783A equ _sub_1783A
EXTRN _sub_194D0:near
sub_194D0 equ _sub_194D0

PUBLIC _var_456
PUBLIC _var_190
PUBLIC _var_383
PUBLIC _var_200
PUBLIC _var_201
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
PUBLIC _word_3C5A8
PUBLIC _word_34186
PUBLIC _var_673
PUBLIC _var_255
PUBLIC _var_261
PUBLIC _var_315
PUBLIC _var_316
PUBLIC _origCBreakSeg
PUBLIC _sub_10334
PUBLIC _word_3C16C
PUBLIC _sub_1374A
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
PUBLIC _word_3B146
PUBLIC _word_33704
PUBLIC _word_39808
EXTRN _sub_12FDA:near
PUBLIC _word_3B7E0
PUBLIC _word_3B7E4
PUBLIC _word_3B7E6
PUBLIC _word_3B7E8
PUBLIC _word_3B7EA
PUBLIC _byte_3B7EE
PUBLIC _byte_3B7EF
PUBLIC _byte_3B7F0
PUBLIC _byte_3B7F1
PUBLIC _word_33B74
PUBLIC _word_33B86
PUBLIC _word_33B9C
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
PUBLIC _word_3B14C
PUBLIC _word_3B15E
PUBLIC _word_38FE0
PUBLIC _var_349
PUBLIC _var_350
PUBLIC _var_134
PUBLIC _var_135
PUBLIC _sub_122B8
PUBLIC _sub_1A9F8
PUBLIC _sub_1B147
PUBLIC _var_662
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
EXTRN _copyJoystickData:FAR
PUBLIC _installCBreakHandler
PUBLIC _gfxBufPtr
EXTRN _restoreJoystickData:FAR
PUBLIC _regs
PUBLIC _exitCode
PUBLIC _restoreCBreakHandler
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
PUBLIC _audio_jump_66
PUBLIC _audio_jump_6d
PUBLIC _audio_jump_68
PUBLIC _audio_jump_69
PUBLIC _setTimerIrqHandler
PUBLIC _sub_13C3B
EXTRN _setInt9Handler:FAR
EXTRN sub_2265B:FAR
EXTRN sub_2267E:FAR
EXTRN sub_1F882:FAR
EXTRN sub_1FEEC:FAR
EXTRN sub_20104:FAR
EXTRN sub_202C7:FAR
EXTRN sub_202F6:FAR
EXTRN _sub_2152A:FAR
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
EXTRN _restoreInt9Handler:FAR
PUBLIC byte_37F98
PUBLIC byte_37F99
PUBLIC byte_37F9A
PUBLIC word_37F9B
PUBLIC byte_37F9D
PUBLIC byte_37F9E
PUBLIC byte_37F9F
PUBLIC _dword_38FE2
PUBLIC _word_3C0A2
PUBLIC _flagFarToNear
PUBLIC _word_3BFA2
PUBLIC _word_3B4DC
PUBLIC _word_3C044
PUBLIC _word_3BEC2
PUBLIC _word_3BED6
PUBLIC _aFlogger
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
PUBLIC _word_3AFA8
PUBLIC _aTakingOff
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
PUBLIC _word_33BAE
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
PUBLIC _buf_3dt
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
PUBLIC _word_3BE3C
PUBLIC _word_38FF6
PUBLIC _word_33710
PUBLIC _stru_3A95A
PUBLIC _word_336E6
PUBLIC _word_336E8
PUBLIC _word_3C028
PUBLIC _word_3C03A
PUBLIC _word_330C4
PUBLIC _sub_13B2F
PUBLIC _sub_13B96
PUBLIC _word_3419C
PUBLIC _word_339B4
PUBLIC _word_336F4
PUBLIC _word_336F6
PUBLIC _stru_33402
PUBLIC _word_33442
PUBLIC _stru_335C4


PUBLIC _var_672
PUBLIC _var_671
PUBLIC _aMissileLock
PUBLIC _aDot
PUBLIC _aRange
PUBLIC _aKm
PUBLIC _unk_3C030
PUBLIC _var_674
PUBLIC _word_3A940
PUBLIC _word_3370E

PUBLIC _word_3C02E
PUBLIC _word_3C45C
PUBLIC _word_336F2
PUBLIC _word_336EA
PUBLIC _stru_3AA5E
PUBLIC _word_3370C
PUBLIC _stru_3B208
PUBLIC _unk_3A948


PUBLIC _word_38152
PUBLIC _word_37561
PUBLIC _word_39604
PUBLIC _word_37563
PUBLIC _word_38126
PUBLIC _sub_195C9
PUBLIC _var_589
PUBLIC _var_590
PUBLIC _off_38364
PUBLIC _word_330BC
PUBLIC _unk_3806E
PUBLIC _unk_380B6

PUBLIC _a256left_pic
PUBLIC _a256right_pic
PUBLIC _a256rear_pic
PUBLIC _gfx_setColor
PUBLIC _gfx_resetBlitOffset2
EXTRN _sub_121CA:PROC
PUBLIC _aRight_pic
PUBLIC _byte_3995A
PUBLIC _aLeft_pic
PUBLIC _word_36B86
PUBLIC _byte_3850E
PUBLIC _unk_38128
PUBLIC _word_3755D

PUBLIC _word_3755F
PUBLIC _allocSize
PUBLIC _word_38202
PUBLIC _aRear_pic
PUBLIC _word_38FDC

PUBLIC _word_3C09A
PUBLIC _word_330C2
PUBLIC _word_33098
PUBLIC _word_330B4
PUBLIC _word_3309C
PUBLIC _word_3309E
PUBLIC _word_3C09E
PUBLIC _keyScancode
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
PUBLIC _aGun
PUBLIC _byte_3C5A0
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
EXTRN _draw2Strings:PROC
EXTRN _drawSomeStrings:PROC
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
PUBLIC _word_3370A
PUBLIC _word_3C6AC
PUBLIC _word_333D8
PUBLIC _word_333DA
PUBLIC _var_661
PUBLIC _var_663
PUBLIC _var_664
PUBLIC _word_3298C
PUBLIC _word_3298E
PUBLIC _missiles
PUBLIC _aAccel


PUBLIC _sub_1A030
PUBLIC _aStallWarning
PUBLIC _aSecond_Target
PUBLIC _aPrimaryTarget_0
PUBLIC _var_730
PUBLIC _waypointIndex
PUBLIC _aAutopilot
PUBLIC _word_38FEA
PUBLIC _word_3BE92
PUBLIC _word_336F8
PUBLIC _word_3B158
PUBLIC _word_3BE96
PUBLIC _word_3C16A
PUBLIC _word_380D0
PUBLIC _word_380D8
PUBLIC _tempString
PUBLIC _word_383F2
PUBLIC _word_330B6
PUBLIC _word_33096
PUBLIC _word_330B8
PUBLIC _var_669
PUBLIC _var_670
PUBLIC _word_3BF90

PUBLIC _missileSpecIndex
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
PUBLIC _var_542
PUBLIC _var_544
PUBLIC _var_545
PUBLIC _var_547
PUBLIC _var_549
PUBLIC _var_552
PUBLIC _word_336F0
PUBLIC _word_333D2
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
PUBLIC _getTimeOfDay
PUBLIC _word_3C45E
PUBLIC _word_3C5A2
PUBLIC _word_38FC8
PUBLIC _word_38FCC

sub_11D10 equ _sub_11D10
sub_11F3E equ _sub_11F3E
sub_126B4 equ _sub_126B4
sub_13266 equ _sub_13266
sub_13638 equ _sub_13638
sub_13694 equ _sub_13694
sub_136D2 equ _sub_136D2
sub_13A90 equ _sub_13A90
sub_151F9 equ _sub_151F9
sub_15411 equ _sub_15411
sub_1543B equ _sub_1543B
sub_15557 equ _sub_15557
sub_1606C equ _sub_1606C
sub_1613B equ _sub_1613B
sub_1660E equ _sub_1660E
sub_166BE equ _sub_166BE
routine_191 equ _routine_191
sub_189AA equ _sub_189AA
sub_18A44 equ _sub_18A44
sub_1957A equ _sub_1957A
sub_19595 equ _sub_19595
sub_198FA equ _sub_198FA
sub_19915 equ _sub_19915
sub_1993A equ _sub_1993A
sub_199EC equ _sub_199EC
sub_19A4D equ _sub_19A4D
EXTRN _sub_19ADB:near
sub_19ADB equ _sub_19ADB
sub_19B98 equ _sub_19B98
sub_19FAD equ _sub_19FAD
sub_1A1B1 equ _sub_1A1B1
tempStrcpy equ _tempStrcpy
sub_1A204 equ _sub_1A204
sub_1A224 equ _routine_260
sub_1A740 equ _sub_1A740
sub_1A7C4 equ _sub_1A7C4
EXTRN _sub_1A872:PROC
sub_1A872 equ _sub_1A872
EXTRN _sub_1A8C8:PROC
sub_1A8C8 equ _sub_1A8C8
sub_1C1B9 equ _sub_1C1B9
sub_1C2F8 equ _sub_1C2F8
sub_1C371 equ _sub_1C371
sub_1C40B equ _sub_1C40B
sub_1C488 equ _sub_1C488
sub_1C661 equ _sub_1C661
sub_1C7A2 equ _sub_1C7A2
sub_1C7C6 equ _sub_1C7C6
sub_1C7EA equ _sub_1C7EA
sub_1C82D equ _sub_1C82D
sub_1C864 equ _sub_1C864
sub_1C8A4 equ _sub_1C8A4
sub_1CF32 equ _sub_1CF32
forceRange equ _sub_1CF8E
randlmul equ _sub_1D200
selectMissile equ _selectMissile
makeSound equ _makeSound
sub_1DA5F equ _sub_1DA5F
sub_1DA8D equ _sub_1DA8D
sub_1DAAE equ _sub_1DAAE
sub_1DB2B equ _sub_1DB2B
sub_1DB9C equ _sub_1DB9C
sub_1DBE0 equ _sub_1DBE0
sub_1DD5E equ _sub_1DD5E
sub_1DD7E equ _sub_1DD7E
sub_1DD92 equ _sub_1DD92
sub_1DDAA equ _sub_1DDAA

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
sub_10294 equ _sub_10294
; ------------------------------seg000:0x296------------------------------
; ------------------------------seg000:0x297------------------------------
sub_10297 equ _sub_10297
; ------------------------------seg000:0x299------------------------------
    nop
; ------------------------------seg000:0x2e2------------------------------
_loadF15DgtlBin proc near
    call far ptr gfx_fontSetup
    mov bx, ax
    sub bx, 2
    cmp bx, 0FFFh
    jbe short loc_102F5
    mov bx, 0FFFh
loc_102F5:
    mov _allocSize, bx
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
    mov cx, _allocSize
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
_sub_10334 equ sub_10334
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
    mov bx, offset _gfx_allocPage
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
EXTRN _sub_10720:NEAR
sub_10720 equ _sub_10720
; ------------------------------seg000:0x14e7------------------------------
; ------------------------------seg000:0x14e8------------------------------
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
; ------------------------------seg000:0x1675------------------------------
; ------------------------------seg000:0x1676------------------------------
; ------------------------------seg000:0x1840------------------------------
; ------------------------------seg000:0x1841------------------------------
; ------------------------------seg000:0x18d4------------------------------
; ------------------------------seg000:0x18d5------------------------------
; ------------------------------seg000:0x18f5------------------------------
; ------------------------------seg000:0x18f6------------------------------
; ------------------------------seg000:0x1970------------------------------
; ------------------------------seg000:0x1971------------------------------
; ------------------------------seg000:0x19a2------------------------------
; ------------------------------seg000:0x19a3------------------------------
EXTRN _sub_119A3:NEAR
; ------------------------------seg000:0x1a17------------------------------
; ------------------------------seg000:0x1a18------------------------------
; sub_11A18 moved to egame1.c
; ------------------------------seg000:0x1a87------------------------------
; ------------------------------seg000:0x1a88------------------------------
; ------------------------------seg000:0x1b36------------------------------
; ------------------------------seg000:0x1b37------------------------------
; ------------------------------seg000:0x1bc2------------------------------
; ------------------------------seg000:0x1bc3------------------------------
sub_11BC3 equ _sub_11BC3
; ------------------------------seg000:0x1bfc------------------------------
; ------------------------------seg000:0x1bfd------------------------------
sub_11BFD equ _sub_11BFD
; ------------------------------seg000:0x1c20------------------------------
; ------------------------------seg000:0x1c21------------------------------
; ------------------------------seg000:0x1d0f------------------------------
; ------------------------------seg000:0x1d10------------------------------
; ------------------------------seg000:0x1d6d------------------------------
; ------------------------------seg000:0x1d6e------------------------------

; ------------------------------seg000:0x1e0d------------------------------
; ------------------------------seg000:0x1f3e------------------------------
; ------------------------------seg000:0x2048------------------------------
; ------------------------------seg000:0x21a9------------------------------
; ------------------------------seg000:0x21c4------------------------------
    nop
; ------------------------------seg000:0x21c6------------------------------
callLoad3DAll equ _sub_121C6
; ------------------------------seg000:0x21c9------------------------------
; _sub_121CA - now in C (egame2.c)
; _copySomeMem - now in C (egame2.c)
; ------------------------------seg000:0x22b7------------------------------
; ------------------------------seg000:0x22b8------------------------------
IFDEF DEBUG
EXTRN _trace_gameloop:NEAR
ENDIF
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
IFDEF DEBUG
    push ax
    push word ptr [word_3C16C]
    call _trace_gameloop
    add sp, 2
    pop ax
ENDIF
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
    mov word ptr [_var_201],seg _byte_228D0
    mov AX,0h
    mov DX,seg _byte_228D0
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
    mov word ptr [_var_201],seg _byte_228D0
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
    mov word ptr [_var_201],seg _byte_228D0
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
_sub_122B8 equ sub_122B8
; ------------------------------seg000:0x26b3------------------------------
; ------------------------------seg000:0x26b4------------------------------
; ------------------------------seg000:0x273d------------------------------
; ------------------------------seg000:0x273e------------------------------
process3dg equ _process3dg
; ------------------------------seg000:0x2872------------------------------
; ------------------------------seg000:0x2fda------------------------------
sub_12FDA equ _sub_12FDA
; ------------------------------seg000:0x3223------------------------------
; ------------------------------seg000:0x3224------------------------------
sub_13224 equ _sub_13224
; ------------------------------seg000:0x3264------------------------------
; ------------------------------seg000:0x3266------------------------------
; ------------------------------seg000:0x32b8------------------------------
; ------------------------------seg000:0x32ba------------------------------
sub_132BA equ _sub_132BA
; ------------------------------seg000:0x345d------------------------------
; ------------------------------seg000:0x345e------------------------------
sub_1345E equ _sub_1345E
    nop
; ------------------------------seg000:0x34aa------------------------------
; ------------------------------seg000:0x34ac------------------------------
sub_134AC equ _sub_134AC


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
    call far ptr _gfx_setColor
    add SP,2h
    call far ptr _sub_2152A
    pop BP
    ret
sub_1374A endp
_sub_1374A equ sub_1374A
; ------------------------------seg000:0x3815------------------------------
; ------------------------------seg000:0x3816------------------------------
sub_13816 equ _sub_13816
; ------------------------------seg000:0x3920------------------------------
; ------------------------------seg000:0x3932------------------------------
sub_13932 equ _sub_13932
; ------------------------------seg000:0x39a8------------------------------
; ------------------------------seg000:0x39aa------------------------------
IFDEF DEBUG
EXTRN _trace_gameloop:NEAR
ENDIF
sub_139AA proc near
IFDEF DEBUG
    push ax
    mov ax, 100
    push ax
    call _trace_gameloop
    add sp, 2
    pop ax
ENDIF
    call far ptr sub_202F6
IFDEF DEBUG
    push ax
    mov ax, 101
    push ax
    call _trace_gameloop
    add sp, 2
    pop ax
ENDIF
    call far ptr gfx_setBlitOffset2
IFDEF DEBUG
    push ax
    mov ax, 102
    push ax
    call _trace_gameloop
    add sp, 2
    pop ax
ENDIF
    call far ptr _gfx_resetBlitOffset2
IFDEF DEBUG
    push ax
    mov ax, 103
    push ax
    call _trace_gameloop
    add sp, 2
    pop ax
ENDIF
    mov byte ptr [_var_316],0h
    ret
    nop
sub_139AA endp
    PUBLIC _sub_139AA
_sub_139AA equ sub_139AA
; ------------------------------seg000:0x39be------------------------------
; ------------------------------seg000:0x39c0------------------------------
sub_139C0 equ _sub_139C0
; ------------------------------seg000:0x3a6b------------------------------
; ------------------------------seg000:0x3a6c------------------------------
sub_13A6C equ _sub_13A6C
; ------------------------------seg000:0x3a8e------------------------------
; ------------------------------seg000:0x3a90------------------------------
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
PUBLIC sub_13BC1
PUBLIC sub_13BC5
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
    retf
cbreakHandler endp
IFDEF DEBUG
    PUBLIC _getRowOffsetHelper
_getRowOffsetHelper proc near
    push bp
    mov bp, sp
    mov di, [bp+4]
    call far ptr gfx_getRowOffset
    pop bp
    retn
_getRowOffsetHelper endp
ENDIF
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
IFDEF DEBUG
EXTRN _trace_gameloop:NEAR
ENDIF
sub_13C47 proc near
    call _sub_155AB
    call _sub_18E50
    cmp _keyValue, 0
    jnz short loc_13C59
IFDEF DEBUG
    mov ax, 1
    push ax
    call _trace_gameloop
    add sp, 2
ENDIF
    call far ptr _sub_21A7A ;call _sub_21A7A
loc_13C59:
IFDEF DEBUG
    mov ax, 2
    push ax
    call _trace_gameloop
    add sp, 2
ENDIF
    mov bx, 0
    mov ax, _word_38126
    call far ptr gfx_dacAnimate
IFDEF DEBUG
    mov ax, 3
    push ax
    call _trace_gameloop
    add sp, 2
ENDIF
    mov byte_378EE, 1
    call _otherKeyDispatch
IFDEF DEBUG
    mov ax, 4
    push ax
    call _trace_gameloop
    add sp, 2
ENDIF
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
timerIrqAddr dd timerIsr

timerIsr proc far
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
    mov AX, @data
    mov DS, AX
    mov AX, word_378F6
    add word_378F0, AX
    adc word_378F2, 0
    dec word_37904
    jnz short @@tisr_skip
    mov AX, word_378FA
    mov word_37904, AX
    call sub_13D6B
    mov byte_378EE, 0
    call sub_13EE3
@@tisr_skip:
    cmp word_378FA, 1
    jz short @@tisr_nochain
    call far ptr timerIsrPtr
@@tisr_nochain:
    cmp word_378F2, 0
    jnz short @@tisr_chain
    mov AL, 20h
    out 20h, AL
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
@@tisr_chain:
    dec word_378F2
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
    jmp dword ptr timerIsrPtr
timerIsr endp

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
_getTimeOfDay equ getTimeOfDay
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
    inc word ptr [_byte_3790C-2]  ; word_3790A
    inc byte ptr [_byte_3790C]    ; frame tick counter
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
    call _sub_11B37
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
    call far ptr _gfx_copyRect
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
    call far ptr _gfx_copyRect
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
    call far ptr _gfx_copyRect
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
    call forceRange
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
    call forceRange
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
    call forceRange
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
    call forceRange
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
    cmp word ptr [word_3A8FE],AX
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
    call _sub_11B37
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
    mov word ptr [word_3A8FE],AX
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
    mov AX,word ptr [word_3A8FE]
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
    cmp word ptr [word_3A8FE],AX
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
    mov AX,word ptr [word_3A8FE]
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
    call _sub_11B37
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
EXTRN _sub_151F9:NEAR
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
    mov byte ptr [_word_380D8],1h
LAB_1000_53e5:
    cmp word ptr [_var_544],0c71dh
    jge LAB_1000_53fa
    cmp word ptr [_var_544],0bfffh
    jle LAB_1000_53fa
    mov byte ptr [_word_380D8],1h
LAB_1000_53fa:
    cmp byte ptr [_var_550],0h
    jz LAB_1000_540d
    cmp word ptr [_var_545],0h
    jnz LAB_1000_540d
    mov byte ptr [_word_380D8],1h
LAB_1000_540d:
    mov SP,BP
    pop BP
    ret
sub_15237 endp
; ------------------------------seg000:0x5fdb------------------------------
sub_15FDB equ _sub_15FDB
; ------------------------------seg000:0x606b------------------------------
; ------------------------------seg000:0x606c------------------------------
sub_1606C equ _sub_1606C
; ------------------------------seg000:0x60d2------------------------------
; ------------------------------seg000:0x60d3------------------------------
EXTRN _sub_160D3:NEAR
sub_160D3 equ _sub_160D3
; ------------------------------seg000:0x613a------------------------------
; ------------------------------seg000:0x613b------------------------------
sub_1613B equ _sub_1613B
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
    mov AX,word ptr [BX + offset _aNone + 12]
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
    call _placeString
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
; ------------------------------seg000:0x86f8------------------------------
; sub_186F8 - replaced by C implementation
; ------------------------------seg000:0x87e8------------------------------
; ------------------------------seg000:0x87ea------------------------------
sub_187EA proc near
    push BP
    mov BP,SP
    sub SP,6h
    push SI
    push word ptr [BP + 4h]
    call _placeString
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
; ------------------------------seg000:0x8aa4------------------------------
    nop
; ------------------------------seg000:0x8aa6------------------------------
EXTRN _sub_18AA6:NEAR
sub_18AA6 equ _sub_18AA6
; ------------------------------seg000:0x8df3------------------------------
; ------------------------------seg000:0x8df4------------------------------
sub_18DF4 equ _sub_18DF4
; ------------------------------seg000:0x8e36------------------------------
; ------------------------------seg000:0x8e38------------------------------
sub_18E38 equ _sub_18E38
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
    call far ptr _gfx_setFadeSteps
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
    call far ptr _gfx_setFadeSteps
    add SP,2h
    jmp LAB_1000_96e2
LAB_1000_96d6:
    mov AX,10h
    push AX
    call far ptr _gfx_setFadeSteps
    add SP,2h
LAB_1000_96e2:
    mov AL,byte ptr [_byte_3C5A0]
    cbw
    mov word ptr [BP + -0ah],AX
    call far ptr _gfx_getDisplayPage
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
    call far ptr _gfx_getDisplayPage
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
    call far ptr _gfx_copyRect
    add SP,10h
LAB_1000_986a:
    call sub_1A962
    call _sub_11971
LAB_1000_9870:
    pop SI
    mov SP,BP
    pop BP
    ret
_sub_195C9 endp
; ------------------------------seg000:0x9874------------------------------
; ------------------------------seg000:0x9c0c------------------------------
zoomIn equ _zoomIn
; ------------------------------seg000:0x98b3------------------------------
zoomOut equ _zoomOut
; ------------------------------seg000:0x9c0c------------------------------
EXTRN _sub_19C0C:near
sub_19C0C equ _sub_19C0C
; ------------------------------seg000:0x9c83------------------------------

; ------------------------------seg000:0x9c84------------------------------
EXTRN _sub_19C84:near
EXTRN _sub_1C6BE:near
sub_19C84 equ _sub_19C84
; ------------------------------seg000:0x9d85------------------------------
; ------------------------------seg000:0x9d86------------------------------
sub_19D86 equ _sub_19D86
; ------------------------------seg000:0x9daf------------------------------
; ------------------------------seg000:0x9db0------------------------------
sub_19DB0 equ _sub_19DB0
; sub_19E44 moved to egame1.c

; sub_19E5D moved to C

routine_328 equ _routine_328

; sub_19EB6 moved to C

sub_19EB6 equ _sub_19EB6
; ------------------------------seg000:0x9f46------------------------------
; ------------------------------seg000:0x9fcc------------------------------
; _sub_19FCC - now in C (egame1.c)
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
; _drawSomeStrings - now in C (egame1.c)
; ------------------------------seg000:0xa0fe------------------------------
; _draw2Strings - now in C (egame1.c)
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
    call far ptr _gfx_drawString
    add SP,6h
    mov SP,BP
    pop BP
    ret
_drawStringCentered endp
; _sub_1A183 - now in C (egame1.c)
; ------------------------------seg000:0xa1b0------------------------------
; _sub_1A25C - now in C (egame2.c)
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
    call far ptr _gfx_copyRect
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
    call far ptr _gfx_copyRect
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
    call far ptr _gfx_copyRect
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
    call far ptr _gfx_copyRect
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
_sub_1A9F8 equ sub_1A9F8
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
    call _sub_1CB42
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
    call _sub_1CB42
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
_sub_1B147 equ sub_1B147
; ------------------------------seg000:0xc6be------------------------------
sub_1C6BE equ _sub_1C6BE
; ------------------------------seg000:0xc9d2------------------------------
sub_1C9D2 equ _sub_1C9D2
; ------------------------------seg000:0xcb41------------------------------
; ------------------------------seg000:0xcb42------------------------------
; ------------------------------seg000:0xcf30------------------------------
; ------------------------------seg000:0xcf32------------------------------
; ------------------------------seg000:0xcf63------------------------------
; ------------------------------seg000:0xcf64------------------------------
; _sub_1CF64 - now in C (egame2.c)
; ------------------------------seg000:0xcf8d------------------------------
; _sub_1CFA6 - now in C (egame2.c)
; ------------------------------seg000:0xcfa6------------------------------
; ------------------------------seg000:0xd007------------------------------
; ------------------------------seg000:0xd008------------------------------
; _sub_1D008 - now in C (egame1.c)
sub_1D008 equ _sub_1D008
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
sub_1D1E8 equ _sub_1D1E8
; ------------------------------seg000:0xd1ff------------------------------
; ------------------------------seg000:0xd21e------------------------------
sub_1D21E equ _sub_1D21E
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
    call far ptr _gfx_getModecode
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
    push word ptr [_allocSize]
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
    call _sub_11B37
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
    call _sub_119A3
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
    mov word ptr [_var_610], ax
    mov ax, [bp+arg_0]
    mov tmpFileHandle, ax
    mov ax, [bp+arg_2]
    mov tmpPageIndex, ax
    call nullsub_1
    mov si, tmpPageIndex
    call far ptr gfx_getPageSeg
    call far ptr gfx_clearPage
    mov word_389E0, 0
    mov word_389D8, 0FA00h
loc_1E0E0:
    mov di, word_389E0
    call far ptr gfx_getRowOffset
    mov rowOffset, ax
    call sub_1E262
    mov di, rowOffset
    mov bp, offset picDecodedRowBuf
    mov bx, word_389E0
    call far ptr gfx_fillRow
    mov di, rowOffset
    call far ptr gfx_copyRow
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
    call far ptr gfx_clearPage
    call nullsub_1
    mov word ptr [_var_609],0h
    mov word ptr [_var_606],0fa00h
LAB_1000_e148:
    mov DI,word ptr [_var_609]
    call far ptr gfx_getRowOffset
    mov word ptr [_var_608],AX
    call sub_1E262
    mov DI,word ptr [_var_608]
    mov BP,offset picDecodedRowBuf
    mov BX,word ptr [_var_609]
    call far ptr gfx_fillRow
    mov DI,word ptr [_var_608]
    call far ptr gfx_setOvlVal2
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
    call far ptr gfx_clearPage
    call nullsub_1
    mov word ptr [_var_609],0h
    mov word ptr [_var_606],0fa00h
LAB_1000_e224:
    mov DI,word ptr [_var_609]
    call far ptr gfx_getRowOffset
    mov word ptr [_var_608],AX
    call sub_1E262
    mov DI,word ptr [_var_608]
    mov BP,offset picDecodedRowBuf
    mov BX,word ptr [_var_609]
    call far ptr gfx_getPageSeg
    mov DI,word ptr [_var_608]
    call far ptr gfx_setOvlVal1
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
PUBLIC unknown_libname_1
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
PUBLIC unknown_libname_2
; ------------------------------seg000:0xf881------------------------------
; seg002 code moved to egseg2.asm
; seg003 code moved to egseg3.asm
; ==============================================================================
; NOTE: The first 0x42 bytes of DGROUP (NULL segment) are provided by slibce.lib.
; The seg001 raw binary code uses DGROUP-relative offsets for data access.
; ORG values in _DATA correspond to DGROUP offsets (offset = ORG value).
; _DATA starts at DGROUP:0x42 (after the 0x42-byte NULL segment from the library).
; Therefore the first ORG value used must be >= 0x42.
.DATA ;dseg segment para public 'DATA' use16

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
_allocSize dw 0
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
_word_3298C label byte
word_3298C dw 0A0h
_word_3298E label byte
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
PUBLIC _word_32A34
_word_32A34 equ word_32A34
_aNone db 'None',0
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
_aFlogger equ aFlogger
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
_word_33096 equ word_33096
word_33098 dw 1388h
_word_33098 equ word_33098
word_3309A dw 0
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
_missileSpecIndex dw 0
word_330B4 dw 28Ah
_word_330B4 equ word_330B4
_word_330B6 dw 0
word_330B8 dw 1
_word_330B8 equ word_330B8
word_330BA dw 1
_word_330BA equ word_330BA
_word_330BC dw 0
word_330BE dw 0
_word_330BE equ word_330BE
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
_word_333D2 equ word_333D2
word_333D4 dw 0
_word_333D4 equ word_333D4
    db 0
    db 0
word_333D8 dw 0
_word_333D8 equ word_333D8
word_333DA dw 0
_word_333DA equ word_333DA
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
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
_stru_33402 equ stru_33402
word_33442 dw 0
_word_33442 equ word_33442
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
_word_336E6 dw 0FFFFh
_word_336E8 dw 0
_word_336EA dw 0
word_336EC dw 1
PUBLIC _word_336EC
_word_336EC equ word_336EC
word_336EE dw 0
PUBLIC _word_336EE
_word_336EE equ word_336EE
word_336F0 dw 0
_word_336F0 equ word_336F0
_word_336F2 dw 0FFFFh
_word_336F4 dw 0FFFFh
word_336F6 dw 0FFFFh
_word_336F6 equ word_336F6
word_336F8 dw 1
_word_336F8 equ word_336F8
word_336FA dw 0
_word_336FC dw 0FFFFh
_word_336FE dw 4
word_33700 dw 0FFFFh
PUBLIC _word_33700
_word_33700 equ word_33700
word_33702 dw 1
PUBLIC _word_33702
_word_33702 equ word_33702
word_33704 dw 1
_word_33704 equ word_33704
word_33706 dw 1
PUBLIC _word_33706
_word_33706 equ word_33706
word_33708 dw 0
PUBLIC _word_33708
_word_33708 equ word_33708
_word_3370A dw 1
_word_3370C dw 0FFFFh
_word_3370E dw 0
word_33710 dw 1
_word_33710 equ word_33710
word_33712 dw 0
PUBLIC _word_33712
_word_33712 equ word_33712
word_33714 dw 0
PUBLIC _word_33714
_word_33714 equ word_33714
aStoresExhauste db 'Stores exhausted',0
aFlare db 'Flare',0
aChaff db 'Chaff',0
aReleased db ' released',0
asc_3373D db ':',0
aGun db 'GUN:',0
_aGun equ aGun
asc_33744 db 'L',0
    db '(',0
aS db 's',0
word_3374A dw 0
PUBLIC _word_3374A
_word_3374A equ word_3374A
PUBLIC _asc_33744
_asc_33744 equ asc_33744
aOnPatrol db ' on patrol',0
_aOnPatrol equ aOnPatrol
aF15StrikeEagle db 'F15 Strike Eagle',0
_aF15StrikeEagle equ aF15StrikeEagle
aAt db ' at ',0
_aAt equ aAt
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
    PUBLIC _gfx_getCurPageSeg
_gfx_setPageN equ gfx_setPageN
_gfx_getCurPageSeg equ gfx_getCurPageSeg
PUBLIC gfx_getCurPageSeg
PUBLIC gfx_getCurPageSeg2
gfx_getCurPageSeg proc near                 ; slot 0x10
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_getCurPageSeg endp
gfx_getCurPageSeg2 proc near                ; slot 0x11
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_getCurPageSeg2 endp
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
PUBLIC gfx_getAuxSize
gfx_getAuxSize proc near                    ; slot 0x1C
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_getAuxSize endp
PUBLIC gfx_getBlitOffset
gfx_getBlitOffset proc near                 ; slot 0x1D
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_getBlitOffset endp
PUBLIC gfx_setClipVal1
gfx_setClipVal1 proc near                   ; slot 0x1E
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_setClipVal1 endp
    db 0EAh, 4 dup(0)                       ; slot 0x1F
PUBLIC gfx_drawLine
gfx_drawLine proc near                      ; slot 0x20
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_drawLine endp
PUBLIC gfx_setPageDirect
gfx_setPageDirect proc near                 ; slot 0x21
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_setPageDirect endp
_gfx_setColor proc near                     ; slot 0x22
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_setColor endp
PUBLIC gfx_resetBlitOffset
gfx_resetBlitOffset proc near               ; slot 0x23
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_resetBlitOffset endp
_gfx_resetBlitOffset2 proc near             ; slot 0x24
    db 0EAh ;jmp far ptr 0:0
    dd 0
_gfx_resetBlitOffset2 endp
gfx_nop24 proc near                         ; slot 0x25
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_nop24 endp
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
gfx_unknown2b proc near                     ; slot 0x2C
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_unknown2b endp
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
gfx_unknown2e proc near                     ; slot 0x2F
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_unknown2e endp
    db 0EAh, 4 dup(0)                       ; slot 0x30
    db 0EAh, 4 dup(0)                       ; slot 0x31
    db 0EAh, 4 dup(0)                       ; slot 0x32
gfx_fontSetup proc near                     ; slot 0x33
    db 0EAh ;jmp far ptr 0:0
    dd 0
gfx_fontSetup endp
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
audio_jump_6b proc near                     ; slot 0x6C
    db 0EAh ;jmp far ptr 0:0
    dd 0
audio_jump_6b endp
    db 0EAh, 4 dup(0)                       ; slot 0x6D
_audio_jump_6d proc near                    ; slot 0x6E
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_jump_6d endp
audio_jump_6d equ _audio_jump_6d
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
_word_33B74 equ word_33B74
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
_word_33B86 equ word_33B86
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
_word_33B9C equ word_33B9C
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
_byte_3419A equ byte_3419A
    db 0
byte_3419C db 0
_byte_3419C equ byte_3419C
_word_3419C equ byte_3419C
    db 1
    db 2
byte_3419F db 3
_byte_3419F equ byte_3419F
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
_word_34684 equ word_34684
word_34686 dw 0
_word_34686 equ word_34686
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
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
_word_34868 equ word_34868
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
_word_34A4C equ word_34A4C
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
_unk_380B6 db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
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
_word_380D8 dw 0
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
_aTakingOff label byte
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
PUBLIC _aA
aA db 'A',0
_aA equ aA
    db 1Ah
    db 0
    db 65h
    db 0
_aSecond_Target db 'Second. target',0
_aPrimaryTarget_0 db 'Primary target',0
PUBLIC _a0
a0 db ':0',0
_a0 equ a0
    db ':',0
PUBLIC _aFired
aFired db ' fired',0
_aFired equ aFired
    db 0
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
    db 1
    db 1
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
_byte_383E5 equ byte_383E5
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
PUBLIC _aTrackcam
_aTrackcam db 'TrackCam ',0
PUBLIC _aAhead
_aAhead db 'Ahead',0
PUBLIC _aRear
_aRear db 'Rear',0
PUBLIC _aRight
_aRight db 'Right',0
PUBLIC _aLeft
_aLeft db 'Left',0
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
_aMissileLock label byte
aMissileLock db 'Missile Lock',0
_aRange label byte
aRange db 'Range ',0
_aDot label byte
aDot db 2Eh,0
_aKm label byte
aKm db ' km',0
    db 0
_a_3d3_0 db '.3D3',0
_aRb_4 db 'rb',0
_aOpenErrorOn_3d3_0 db 'Open Error on *.3D3',0
_byte_3850E db 0
    db 0
_a15flt_xxx db '15FLT.xxx',0
aBrg db 'BRG ',0
_aBrg equ aBrg
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
word_38600 dw 0
word_38602 dw 2
word_38604 dw 0
word_38606 dw 0
PUBLIC _word_38606
_word_38606 equ word_38606
word_38608 dw 0
word_3860A dw 0
    db 0
    db 0
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
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
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
; --- Variables created for ORG-based _var_* labels whose targets didn't exist ---
word_32A28 dw 0
word_32A2E dw 0
word_32A30 dw 0
word_332CE dw 0
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
_var_47 EQU word_32A28
ORG 0017Eh
_var_48 EQU word_32A2E
ORG 00180h
_var_49 EQU word_32A30
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
_var_542 EQU _word_380C8
ORG 05819h
_var_543 EQU _word_380C8 + 1
ORG 0581Ah
_var_544 EQU _word_380CA
ORG 0581Ch
_var_545 EQU _word_380CC
ORG 0581Eh
_var_547 EQU _word_380CE
ORG 05820h
_var_548 EQU _word_380D0
ORG 05828h
_var_549 EQU _word_380D8
ORG 0582Ah
_var_550 EQU byte_380DA
ORG 05830h
_var_552 EQU word_380E0
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
_var_586 EQU byte_383E5
ORG 05B3Ch
_var_588 EQU word_383EC
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
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
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
_word_38FCE equ word_38FCE
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
PUBLIC _word_38FDE
_word_38FDE equ word_38FDE
word_38FE0 dw ?
_word_38FE0 equ word_38FE0
_dword_38FE2 dd ?
_fileHandle dw ?
word_38FE8 dw ?
_word_38FE8 equ word_38FE8
_word_38FEA dw ?
word_38FEC dw ?
_word_38FEC equ word_38FEC
word_38FEE dw ?
PUBLIC _word_38FEE
_word_38FEE equ word_38FEE
_gameData dd ?
    db ?
    db ?
word_38FF6 dw ?
_word_38FF6 equ word_38FF6
word_38FF8 dw ?
_word_38FF8 equ word_38FF8
_word_38FFA dw ?
word_38FFC dw ?
PUBLIC _word_38FFC
_word_38FFC equ word_38FFC
_buf4_3dg db 200h dup(?)
_planeFlags dw ?
word_39200 dw ?
PUBLIC _word_39200
_word_39200 equ word_39200
_buf3_3dg db 200h dup(?)
word_39402 dw ?
_word_39402 equ word_39402
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
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
_word_39808 equ word_39808
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
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
_word_3995C equ word_3995C

; Matrix3dEntry7 storage.
; 571 full records * 7 bytes + 3 spare bytes = 4000 bytes. => #define MAX_TILE_DATA 4000
_buf_3dt db 4000 dup(?)

word_3A8FE dw ?
_byte_3A900 db 40h dup(?)
_word_3A940 dw ?
    db ? ;align 4
    db ?
word_3A944 dw ?
PUBLIC _word_3A944
_word_3A944 equ word_3A944
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
PUBLIC _word_3AF0C
_word_3AF0C equ word_3AF0C
_buf3d3_1 db 96h dup(?)
word_3AFA4 dw ?
_word_3AFA4 equ word_3AFA4
word_3AFA6 dw ?
_word_3AFA8 label word
word_3AFA8 dw ?
word_3AFAA dw ?
PUBLIC _word_3AFAA
_word_3AFAA equ word_3AFAA
_byte_3AFAC db 100h dup(?)
word_3B0AC dw ?
_word_3B0AC equ word_3B0AC
_buf3d3_2 db 96h dup(?)
_word_3B144 dw ?
word_3B146 dw ?
_word_3B146 equ word_3B146
_word_3B148 dw ?
_word_3B14A dw ?
word_3B14C dw ?
_word_3B14C equ word_3B14C
    db ?
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
_word_3B158 equ word_3B158
word_3B15A dw ?
PUBLIC _word_3B15A
_word_3B15A equ word_3B15A
    db ?
    db ?
word_3B15E dw ?
_word_3B15E equ word_3B15E
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
PUBLIC _word_3B22C
_word_3B22C equ word_3B22C
word_3B22E dw ?
PUBLIC _word_3B22E
_word_3B22E equ word_3B22E
word_3B230 dw ?
PUBLIC _word_3B230
_word_3B230 equ word_3B230
word_3B232 dw ?
PUBLIC _word_3B232
_word_3B232 equ word_3B232
word_3B234 dw ?
PUBLIC _word_3B234
_word_3B234 equ word_3B234
word_3B236 dw ?
PUBLIC _word_3B236
_word_3B236 equ word_3B236
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
byte_3B23E db ?
PUBLIC _byte_3B23E
_byte_3B23E equ byte_3B23E
    db ? ;align 2
word_3B240 dw ?
PUBLIC _word_3B240
_word_3B240 equ word_3B240
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
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
_word_3B4D8 equ word_3B4D8
word_3B4DA dw ?
word_3B4DC dw ?
_word_3B4DC equ word_3B4DC
_word_3B4DE dw ?
word_3B4E0 dw ?
_word_3B4E0 equ word_3B4E0
_hercFlag db ?
    db ?
_word_3B4E4 dw ?
byte_3B4E6 db ?
_byte_3B4E6 equ byte_3B4E6
byte_3B4E7 db ?
byte_3B4E8 db ?
byte_3B4E9 db ?
word_3B4EA dw ?
byte_3B4EC db ?
_byte_3B4EC equ byte_3B4EC
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
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
_word_3B5D6 equ word_3B5D6
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
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
    db ?
    db ?
    db ?
    db ?
    db ?
_dword_3B7F8 dd ?
_byte_3B7FC db 640h dup(?)
word_3BE3C dw ?
_word_3BE3C equ word_3BE3C
_byte_3BE3E db 40h dup(?)
word_3BE7E dw ?
_byte_3BE80 db 10h dup(?)
_keyValue dw ?
_word_3BE92 dw ?
_word_3BE94 dw ?
word_3BE96 dw ?
_word_3BE96 equ word_3BE96
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
_word_3BEC2 equ word_3BEC2
_byte_3BEC4 db ?
    db ? ;align 4
    db ?
    db ?
word_3BEC8 dw ?
_sign3d3 dw ?
word_3BECC dw ?
PUBLIC _word_3BECC
_word_3BECC equ word_3BECC
word_3BECE dw ?
_word_3BED0 dw ?
_word_3BED2 dw ?
word_3BED4 dw ?
_word_3BED4 equ word_3BED4
word_3BED6 dw ?
_word_3BED6 equ word_3BED6
_byte_3BED8 db 64h dup(?)
word_3BF3C dw ?
word_3BF3E dw ?
_tempString db 50h dup(?)
word_3BF90 dw ?
_word_3BF90 equ word_3BF90
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
PUBLIC _word_3BFA0
_word_3BFA0 equ word_3BFA0
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
PUBLIC _word_3C014
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
_word_3C042 equ word_3C042
word_3C044 dw ?
_word_3C044 equ word_3C044
_word_3C046 dw ?
word_3C048 dw ?
_string_3C04A db 50h dup(?)
_word_3C09A dw ?
word_3C09C dw ?
PUBLIC _word_3C09C
_word_3C09C equ word_3C09C
_word_3C09E dw ?
word_3C0A0 dw ?
PUBLIC _word_3C0A0
_word_3C0A0 equ word_3C0A0
_word_3C0A2 dw 64h dup(?)
_word_3C16A dw ?
word_3C16C dw ?
_word_3C16C equ word_3C16C
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
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    PUBLIC _word_3C69C
word_3C69C dw ?
_word_3C69C equ word_3C69C
_word_3C69E dw ?
byte_3C6A0 db ?
    db ? ;align 2
    PUBLIC _word_3C6A2
word_3C6A2 dw ?
_word_3C6A2 equ word_3C6A2
_word_3C6A4 dw ?
_commData dd ?
word_3C6AA dw ?
_word_3C6AC dw ?
word_3C6AE dw ?
PUBLIC _word_3C6AE
_word_3C6AE equ word_3C6AE
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
    PUBLIC _byte_3C8B0
_byte_3C8B0 label byte
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
