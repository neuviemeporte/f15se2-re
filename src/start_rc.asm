.8086
DOSSEG
.MODEL SMALL
EXTRN _main:PROC
EXTRN _waitMdaCgaStatus:PROC
EXTRN _openFileWrapper:PROC
EXTRN _closeFileWrapper:PROC
EXTRN _cleanup:PROC
EXTRN _pilotToGameData:PROC
EXTRN _clearBriefing:PROC
EXTRN _seedRandom:PROC
EXTRN _gameDataToPilot:PROC
EXTRN _saveHallfame:PROC
EXTRN _processStoreInput:PROC
EXTRN _pilotNameInput:PROC
PUBLIC _byte_17412
PUBLIC _byte_17422
PUBLIC _word_173DE
PUBLIC _asc_174AC
PUBLIC _byte_1741A
PUBLIC _asc_174AF
PUBLIC _ranks
PUBLIC _pilotNameInputColors
PUBLIC _aMenterYourName
PUBLIC _cbreakHit
PUBLIC _word_17282
PUBLIC _a_3dg
PUBLIC _aOpenErrorOn__0
PUBLIC _aRb_0
PUBLIC _word_18188
PUBLIC _gridBuf1
PUBLIC _gridBuf2
PUBLIC _gridBuf3
PUBLIC _gridBuf4
PUBLIC _gridBuf5
PUBLIC _aBadGridFileFor
PUBLIC _gridSignature
PUBLIC _aInsufficientSy
PUBLIC _byte_1B0D3
PUBLIC _aCc00
PUBLIC _aEs00
PUBLIC _aHz00
PUBLIC _aJz00
PUBLIC _aTd00
PUBLIC _bufCoordStr
PUBLIC _aWx00
PUBLIC _aXv00
PUBLIC _byte_1B0D1
PUBLIC _byte_1B0D2
PUBLIC _word_17290
PUBLIC _word_17292
PUBLIC _word_17284
PUBLIC _word_17286
PUBLIC _word_17288
PUBLIC _word_1728A
PUBLIC _word_1728C
PUBLIC _byte_1729C
PUBLIC _word_1728E
PUBLIC _pilotSelectFlag
PUBLIC _moveDst
PUBLIC _word_1786F
PUBLIC _word_17873
PUBLIC _word_17871
PUBLIC _word_17875
PUBLIC _word_18186
PUBLIC _aOpenErrorOn_3d
PUBLIC _terrainSignature
PUBLIC _a_3dt
PUBLIC _aTooMuchTileDat
PUBLIC _aRb
PUBLIC _terrainBuf1
PUBLIC _terrainBuf2
PUBLIC _terrainBuf3
PUBLIC _terrainBuf4
PUBLIC _terrainBuf5
PUBLIC _terrainPtrUnk
PUBLIC _aTooManyTiles_
PUBLIC _aBadTileFileFor
PUBLIC _terrainIdxBuf
PUBLIC _aHiscore_pic
PUBLIC _aArmpiece_pic
PUBLIC _aWb
PUBLIC _aHallfame_0
PUBLIC _planes
PUBLIC _blinkColors
PUBLIC _blinkColorIdx
PUBLIC _word_18026
PUBLIC _word_1E24A
PUBLIC _word_17FFE
PUBLIC _word_18010
PUBLIC _hercFlag
PUBLIC _timerCounter
PUBLIC _commData
PUBLIC _aF15_spr
PUBLIC _noJoy80
PUBLIC _aTitle640_pic
PUBLIC _menuSprites
PUBLIC _bufPtr
PUBLIC _needSplash
PUBLIC _aAdv_pic
PUBLIC _aLabs_pic
PUBLIC _aF15_spr_0
PUBLIC _byte_1D5E2
PUBLIC _byte_1D5E3
PUBLIC _word_1D5D4
PUBLIC _byte_1D5E4
PUBLIC _byte_1D5E5
PUBLIC _dword_1D5D8
PUBLIC _dword_1D5DC
PUBLIC _word_1D5E0
PUBLIC _iacaSuFlag0Ptr
PUBLIC _exitCode
PUBLIC _joyDone
PUBLIC _gameData
PUBLIC _aEgraphic_exe
PUBLIC _aTitle16_pic
PUBLIC _page1Ptr
PUBLIC _intRegs
PUBLIC _selectedPilotIdx
PUBLIC _hallfameBuf
PUBLIC _screenBuf
PUBLIC _aWall_pic
PUBLIC _page1NumPtr
PUBLIC _page2NumPtr
PUBLIC _aAt
PUBLIC _byte_1B100
PUBLIC _byte_1B0FF
PUBLIC _word_1D5D6
PUBLIC _missDiffLevels
PUBLIC _missDiffDesc
PUBLIC _missTheaNames
PUBLIC _missTheaDesc
PUBLIC _missScenarioNames
PUBLIC _missScenarioDesc
PUBLIC _missTypeNames
PUBLIC _missTypeDesc
PUBLIC _missHistorical1Names
PUBLIC _missHistorical1Desc
PUBLIC _missHistorical2Names
PUBLIC _missHistorical2Desc
PUBLIC _missionStr
PUBLIC _aRb_1
PUBLIC _plh3d3Ptr
PUBLIC _enableHighlight
PUBLIC _word_19656
PUBLIC _word_182C8
PUBLIC _word_19294
PUBLIC _aPowCamp
PUBLIC _word_18994
PUBLIC _dword_1D5D0
PUBLIC _word_182BC
PUBLIC _word_192EC
PUBLIC _stru_18FC0
PUBLIC _word_182BE
PUBLIC _byte_192FC
PUBLIC _target2
PUBLIC _word_1D00A
PUBLIC _word_182C0
PUBLIC _targets
PUBLIC _word_182C2
PUBLIC _dword_1D650
PUBLIC _word_192A4
PUBLIC _word_182C4
PUBLIC _stru_1892E
PUBLIC _word_192F4
PUBLIC _word_182C6
PUBLIC _word_189B6
PUBLIC _word_19324
PUBLIC _off_19304
PUBLIC _off_19314
PUBLIC _word_1B960
PUBLIC _aSeeTechnicalSu
PUBLIC _aMissionType
PUBLIC _fileHandle
PUBLIC _scenarioCodePtr
PUBLIC _timerCounter3
PUBLIC _aTheater
PUBLIC _aDifficulty
PUBLIC _scenarioFoundArr
PUBLIC _aNoScenarioFile
PUBLIC _missionPick
PUBLIC _drawColor
PUBLIC _aRepeatLastMiss
PUBLIC _aDecodingMissio
PUBLIC _word_171B2
PUBLIC _aTemp_wld
PUBLIC _regnPlhPtr
PUBLIC _difficultySaved
PUBLIC _theaterSaved
PUBLIC _flag4Saved
PUBLIC _plhFiles
PUBLIC _worldFiles
PUBLIC _todayMissStrBuf
PUBLIC _aTakeoffFrom
PUBLIC _fontIndex
PUBLIC _aTodaySMission
PUBLIC _aOnc_0
PUBLIC _aOnc_1
PUBLIC _aPrimaryTarget
PUBLIC _aOnc_2
PUBLIC _aSecondaryTarge
PUBLIC _aRb_2
PUBLIC _aPleaseReinsert
PUBLIC _aF15_spr_1
PUBLIC _aPressSelectorW
PUBLIC _word_182BA
PUBLIC _aWb_0
PUBLIC _word_1B148
PUBLIC _word_1DD38
PUBLIC _readItemSize
PUBLIC _timerHandlerInstalled
PUBLIC _aRb_3
PUBLIC _aHallfame
PUBLIC _aPressAKeyToCon
PUBLIC _aOriginalDiskIn
PUBLIC _pageNumPtr
PUBLIC _aUseSelectorToC
PUBLIC _word_173D6
PUBLIC _word_19658
PUBLIC _word_1714A
PUBLIC _word_1715A
PUBLIC _word_1716A
PUBLIC _word_1717A
PUBLIC _word_1718A
PUBLIC _word_1965A
PUBLIC _word_1719A
PUBLIC _word_1965C
PUBLIC _word_1965E
PUBLIC _aRb_4
PUBLIC _wldReadBuf5Size
PUBLIC _wldReadBuf1
PUBLIC _wldReadBuf2
PUBLIC _wldReadBuf3
PUBLIC _wldReadBuf4
PUBLIC _wldReadBuf6
PUBLIC _wldReadBuf7
PUBLIC _wldReadBuf8
PUBLIC _wldReadBuf9
PUBLIC _wldReadBuf10
PUBLIC _wldReadBuf11
PUBLIC _wldOffsets
PUBLIC _gfx_jump_0_alloc
PUBLIC _gfx_jump_05_drawString
PUBLIC _gfx_jump_0d_setCurBuf
PUBLIC _gfx_jump_0e_setCurBuf
PUBLIC _gfx_jump_0f_getBufPtr
PUBLIC _gfx_jump_10_getCurBuf
PUBLIC _gfx_jump_11_blitSprite
PUBLIC _gfx_jump_17_bufSize
PUBLIC _gfx_jump_1f
PUBLIC _gfx_jump_20_setVal
PUBLIC _gfx_jump_21
PUBLIC _gfx_jump_22
PUBLIC _gfx_jump_23
PUBLIC _gfx_jump_25
PUBLIC _gfx_jump_28
PUBLIC _gfx_jump_29_switchColor
PUBLIC _gfx_jump_2a
PUBLIC _gfx_jump_2f_charWidth
PUBLIC _gfx_jump_30_blitToCurrent
PUBLIC _gfx_jump_33_fillRow
PUBLIC _gfx_jump_34_fillRow
PUBLIC _gfx_jump_35
PUBLIC _gfx_jump_36_null
PUBLIC _gfx_jump_37_null
PUBLIC _gfx_jump_38_getPageBuf
PUBLIC _gfx_jump_3a_getRowOffset
PUBLIC _gfx_jump_3b_clearBuf
PUBLIC _gfx_jump_3c_setMode13
PUBLIC _gfx_jump_3d_null
PUBLIC _gfx_jump_3f_modecode
PUBLIC _gfx_jump_44_setDac
PUBLIC _gfx_jump_45_retrace
PUBLIC _gfx_jump_46_retrace2
PUBLIC _gfx_jump_4b_storeBufPtr
PUBLIC _gfx_jump_4e_getVal
PUBLIC _gfx_jump_50_null
PUBLIC _gfx_jump_51_null
PUBLIC _gfx_jump_52
PUBLIC _misc_jump_5a_keybuf
PUBLIC _misc_jump_5b_getkey
PUBLIC _misc_jump_5d_readJoy
PUBLIC _misc_jump_5e_clearKeyFlags
PUBLIC _audio_jump_64
PUBLIC _audio_jump_65
PUBLIC _audio_jump_67
PUBLIC _audio_jump_6b
PUBLIC _audio_jump_6c
PUBLIC _aFileClosingError
PUBLIC _aWriteError
PUBLIC _diskTransferArea
PUBLIC _byte_172C6
PUBLIC _dictionaryIndex
PUBLIC _byte_172B7
PUBLIC _picDecodeDictionary
PUBLIC _word_17BF1
PUBLIC _picRowLength
PUBLIC _rowOffset
PUBLIC _picWorkData
PUBLIC _word_17BF3
PUBLIC _picDecodedRowBuf
PUBLIC _byte_17BF0
PUBLIC _aReadError
PUBLIC _word_17BF5
PUBLIC _word_17BF7
PUBLIC _word_17BF9
PUBLIC _picWorkDataPtr
PUBLIC _picProcessFlag0_1
PUBLIC _word_1786A
PUBLIC _aDosLied
PUBLIC _picTmp9BitCount
PUBLIC _picByteUnsignedFlag
PUBLIC _word_1782E
PUBLIC _word_1786C
PUBLIC _word_1783E
PUBLIC _word_1784E
PUBLIC _word_1737E
PUBLIC _fileReadPos
PUBLIC _ovlParBlock
PUBLIC _row
PUBLIC _readBufEndPtr
PUBLIC _picRemainingBitCount
PUBLIC _timerCounter2
PUBLIC _tmpFileHandle
PUBLIC _timerCounter4
PUBLIC _picDecodeIncrement
PUBLIC _aAlloc1M
PUBLIC _searchFCB
PUBLIC _ovlSeg1
PUBLIC _aNoFileBuffersAvailable
PUBLIC _picNumberDictSlots
PUBLIC _aOpenError
PUBLIC _ovlSeg2
PUBLIC _ovlParCnt
PUBLIC _byte_17A2F
PUBLIC _errorCodeStr
PUBLIC _tmpPageIndex
PUBLIC _word_17836
PUBLIC _word_17846
PUBLIC _word_172AA
PUBLIC _ovlInsaneFlag
PUBLIC _word_17856
PUBLIC _word_172BA
PUBLIC _word_17866
PUBLIC _screenBufSize
PUBLIC _word_172AC
PUBLIC _word_17858
PUBLIC _word_17868
PUBLIC _aOvlFail
PUBLIC _word_172AE
PUBLIC _aOvlShrink
PUBLIC _byte_17877
PUBLIC _word_17BEB
PUBLIC _origCBreakOfs
PUBLIC _word_17BFB
PUBLIC _picSlotCounter
PUBLIC _word_172B1
PUBLIC _origCBreakSeg
PUBLIC _word_17BED
PUBLIC _picFileReadBufEnd
PUBLIC _readFromFilePtr
PUBLIC _word_172B3
PUBLIC _word_172A4
PUBLIC _byte_172B0
PUBLIC _fileReadBuf
PUBLIC _word_172B5
PUBLIC _byte_172A2
PUBLIC _word_172A6
PUBLIC _picByte
PUBLIC _aFileNotFound
PUBLIC _aEnoughMem
PUBLIC _byte_19ADB
PUBLIC _picFileWord
PUBLIC _word_172A8
PUBLIC _word_172B8
PUBLIC _picLookupResult
PUBLIC _aFileNFound
PUBLIC _aOvlOvrrun
; ---------------------------------------------------------------------------

GameComm	struc ;	(sizeof=0x2, mappedto_8)
field_0		dw ?
GameComm	ends

; ---------------------------------------------------------------------------

Game		struc ;	(sizeof=0x2, mappedto_7)
field_0		dw ?
Game		ends

; ---------------------------------------------------------------------------

NoJoy80		struc ;	(sizeof=0x2, mappedto_6)
field_0		dw ?
NoJoy80		ends

; ---------------------------------------------------------------------------

FILE		struc ;	(sizeof=0x0, mappedto_5)
FILE		ends

; ---------------------------------------------------------------------------

Buf6Item	struc ;	(sizeof=0x24, mappedto_9) ; XREF: startData:wldReadBuf6/r
field_0		dw ?			; XREF:	sub_14CC5+A6/w
field_2		dw ?			; XREF:	sub_14CC5+25/w sub_14CC5+34/r
field_4		dw ?			; XREF:	sub_14CC5+30/w sub_14CC5+4E/r
field_6		db ?			; XREF:	sub_14CC5:loc_14D3D/w
		db ? ; undefined
field_8		dd ?			; XREF:	sub_14CC5:loc_14D0B/w
					; sub_14CC5+4A/w
field_C		dd ?			; XREF:	sub_14CC5:loc_14D25/w
					; sub_14CC5+64/w
field_10	dw ?			; XREF:	sub_14CC5+8B/w
field_12	dw ?			; XREF:	sub_14CC5+91/w
field_14	dw ?			; XREF:	sub_14CC5+97/w
field_16	dw ?			; XREF:	sub_14CC5+10/r
field_18	dw ?			; XREF:	sub_14CC5+9D/w
field_1A	dw ?			; XREF:	sub_14CC5+87/w sub_14CC5+AA/r
field_1C	dw ?			; XREF:	sub_14CC5+C7/w
field_1E	db 6 dup(?)
Buf6Item	ends

; ---------------------------------------------------------------------------

Buf4Item	struc ;	(sizeof=0x10, mappedto_10) ; XREF: startData:wldReadBuf4/r
field_0		dw ?			; XREF:	sub_154A1+28/r sub_154A1+6F/r
field_2		dw ?			; XREF:	sub_14BB4+96/r sub_14BB4+B9/w ...
field_4		dw ?			; XREF:	sub_14BB4+9F/r sub_14BB4+C0/w ...
field_6		dw ?
field_8		dw ?			; XREF:	sub_14CC5+68/r
field_A		dw ?
field_C		dw ?
field_E		dw ?			; XREF:	sub_14BB4+CD/w sub_154A1+A/r ...
Buf4Item	ends

; ---------------------------------------------------------------------------

Target		struc ;	(sizeof=0x12, mappedto_11) ; XREF: startData:targets/r
					; startData:target2/r
field_0		dw ?
field_2		dw ?
field_4		dw ?
field_6		dw ?
field_8		dw ?
coord		db 8 dup(?)
Target		ends

; ---------------------------------------------------------------------------

struc_9		struc ;	(sizeof=0xC, mappedto_12) ; XREF: startData:stru_18FC0/r
field_0		dw ?
field_2		dw ?
field_4		dw ?
field_6		dw ?
field_8		dw ?
field_A		dw ?
struc_9		ends

; ---------------------------------------------------------------------------

struc_10	struc ;	(sizeof=0x4, mappedto_13) ; XREF: startData:stru_1892E/r
field_0		dw ?
field_2		dw ?
struc_10	ends

; ---------------------------------------------------------------------------

Pilot		struc ;	(sizeof=0x20, mappedto_14) ; XREF: startData:hallfameBuf/r
field_0		db ?			; XREF:	processPilotInput+EB/o
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
field_16	dd ?
field_1A	dw ?
field_1C	db ?
field_1D	db ?
field_1E	db ?
field_1F	db ?
Pilot		ends

; ---------------------------------------------------------------------------

Plane		struc ;	(sizeof=0x20, mappedto_15) ; XREF: startData:planes/r
field_0		db 8 dup(?)
field_8		db 10 dup(?)
field_12	dw ?
field_14	dw ?
field_16	db 10 dup(?)
Plane		ends

; ---------------------------------------------------------------------------

TerrainUnk	struc ;	(sizeof=0x40, mappedto_16) ; XREF: startData:terrainPtrUnk/r
field_0		db ?
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
		db ? ; undefined
field_3E	dw ?
TerrainUnk	ends

; ---------------------------------------------------------------------------

; enum Pointers, mappedto_1
COMM_SNDOVL_NAME  = 0Dh
ROSTER_SCORE_LO	 = 16h
OVL_HDR_CODESEG	 = 18h
ROSTER_SCORE_HI	 = 18h
COMM_GVXOVL_SEG	 = 1Ah
ROSTER_LASTSCORE  = 1Ah
COMM_SNDOVL_SEG	 = 1Ch
OVL_HDR_FIRSTIDX  = 1Ch
ROSTER_UNK1	 = 1Ch
ROSTER_UNK2	 = 1Dh
COMM_MISCOVL_SEG  = 1Eh
OVL_HDR_SIZE1	 = 1Eh
ROSTER_THEATER	 = 1Eh
ROSTER_DIFFICULTY  = 1Fh
COMM_GFXBUF_PTR	 = 20h
OVL_HDR_SIZE2	 = 20h
GAMEDATA_UNK2	 = 20h
OVL_HDR_SLOTCOUNT  = 22h
COMM_SETUP1	 = 22h
GAMEDATA_UNK3	 = 22h
OVL_HDR_FIRSTPTR  = 24h
COMM_HERC_FLAG	 = 24h
COMM_SETUPDONE	 = 26h
COMM_UNK2	 = 28h
COMM_UNK3	 = 2Ch
GAMEDATA_LASTSCORE  = 2Eh
COMM_SETUP_GFXMODE  = 30h
COMM_BUFFER_FLAG2  = 30h
GAMEDATA_SCORE_LO  = 32h
GAMEDATA_SCORE_HI  = 34h
GAMEDATA_THEATER  = 38h
COMM_UNK7	 = 38h
GAMEDATA_FLAG4	 = 3Ah
COMM_UNK5	 = 3Ah
GAMEDATA_FLAG3	 = 3Ch
COMM_UNK6	 = 3Ch
COMM_BUFFER_DIFFICULTY	= 3Eh
SEGMENT_BDA	 = 40h
COMM_UNK8	 = 40h
COMM_BUFFER_RAND  = 42h
GAMEDATA_UNK1	 = 44h
COMM_JOYDATA_OFF  = 48h
COMM_BUFFER_FLAG1  = 4Eh
COMM_USEJOY_OFF	 = 72h
COMM_GFXMODE_OFFSET  = 78h
TIMEOUT_MPS	 = 78h
BDA_EGASW	 = 88h
TIMEOUT_ADV	 = 0B4h
BDA_CRTC	 = 463h
STACK_JOYDATA	 = 0CDEh

; ---------------------------------------------------------------------------

; enum Dos, mappedto_2
DOS_PRINT_STR	 = 9
DOS_ERROR_RMDIR	 = 10h
DOS_SET_IRQH	 = 25h
DOS_ALLOC_MEM	 = 48h

; ---------------------------------------------------------------------------

; enum Varia, mappedto_3
IRQ_PIT		 = 8
IRQ_VIDEO	 = 10h
IRQ_KBD		 = 16h
IRQ_TIME	 = 1Ah
IRQ_CBREAK	 = 1Bh
HALLFAME_RECORDSZ  = 20h
IRQ_DOS		 = 21h
PORT_PIT_TIME0	 = 40h
PORT_PIT_CNTRL	 = 43h
SCREEN_MAXY	 = 0C7h
SCREEN_MAXX	 = 13Fh

; ---------------------------------------------------------------------------

; enum Sizes, mappedto_4
FILE_READBUF_SIZE  = 200h

;  ==============================================================================

.DATA ;startData segment byte public 'DATA'
_aLabs_pic db 'labs.pic',0
_aAdv_pic db 'adv.pic',0
_aEgraphic_exe db 'egraphic.exe',0
_aTitle640_pic db 'Title640.Pic',0
_aTitle16_pic db 'title16.pic',0
_aF15_spr db 'f15.spr',0
_aF15_spr_0 db 'f15.spr',0
_aTemp_wld db 'temp.wld',0
asc_16BE2 db 0,0,0,0
    db 0Fh
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1
    db 0
unk_16BF0 db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
_bufPtr db 92h
    db 0
    db 0
    db 0
    db 0
    db 0
    db 9
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
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
unk_16C10 db 0AAh
    db 0
aLibya db 'Libya',0
aPersianGulf db 'Persian Gulf',0
aVietnam db 'Vietnam',0
aMiddleEast db 'Middle East',0
aOtherAreas db 'Other Areas',0
aAcrossTheLineO db 'Across the "Line of Death"',0
aKeepingTheSeaL db 'Keeping the Sea Lanes Open',0
aAmericaSLonges db 'America',27h,'s Longest Air War',0
aEaglesVsMigs db 'Eagles vs MiGs',0
aInsertYourScen db 'Insert your scenario disk',0
aRookie db 'Rookie',0
aPilot db 'Pilot',0
aVeteran db 'Veteran',0
aAce db 'Ace',0
aDemo db 'Demo',0
aGetOffToAGoodS db 'Get off to a good start',0
aForTheCasualPl db 'For the casual player',0
aForMoreSerious db 'For more serious players',0
aTheUltimateCha db 'The Ultimate Challenge',0
aLetSSeeWhatThi db 'Let',27h,'s see what this thing can do',0
aNc db 'nc',0
aCe db 'ce',0
aJp db 'jp',0
aNa db 'na',0
aNorthCape db 'North Cape',0
aCentralEurope db 'Central Europe',0
aDesertStorm db 'Desert Storm',0
aNorthAtlantic db 'North Atlantic',0
aOtherAreas_0 db 'Other Areas',0
aIntoTheSovietS db 'Into the Soviet',27h,'s Backyard',0
aRedStormRaging db 'Red Storm Raging',0
aTheFightForKuw db 'The Fight for Kuwait',0
aDefendingTheIc db 'Defending the Iceland-UK Gap',0
aSelectABuiltIn db 'Select a built-in area',0
aHistoricalMiss db 'Historical Missions',0
aGeneralAirStri db 'General Air Strikes',0
asc_16E46 db 0,0,0
aReenactHistory db 'Reenact history',0
aTheCoreOfTheAi db 'The core of the Air Campaign',0
asc_16E76 db 0,0,0
aSaddamSEyes db 'Saddam',27h,'s Eyes',0
aCommandAndCont db 'Command and Control',0
aScudBusting db 'Scud Busting',0
aNoNukes db 'No Nukes',0
aMoreHistorical db 'more historical missions',0
aIraqSEarlyWarn db 'Iraq',27h,'s Early Warning Radar',0
aIraqiDefenseNe db 'Iraqi Defense Nerve Center',0
aStopSaddamSTer db 'Stop Saddam',27h,'s Terror Weapon',0
aNuclearResearc db 'Nuclear Research Facility',0
unk_16F36 db 0
aBabyMilkFactory db 27h,'Baby Milk Factory',27h,0
aStopTheSpill db 'Stop the Spill',0
aBridgesToNowhe db 'Bridges to Nowhere',0
aRepublicanGuar db 'Republican Guards',0
aMoreHistoric_0 db 'more historical missions',0
aChemicalBiolog db 'Chemical/Biological Weapons Plant',0
aSeverTheOilPum db 'Sever the Oil Pumping Manifold',0
aSaddamSEliteAr db 'Saddam',27h,'s Elite Armored Units',0
aCutTheSupplyLi db 'Cut the Supply Lines',0
asc_1700B db 0
aMission db 'MISSION',0
placeholder_3d3 db 'xx.3d3',0
_aWall_pic db 'Wall.Pic',0
_aDifficulty db 'DIFFICULTY',0
_aTheater db 'THEATER',0
_aRb_1 db 'rb',0
_aNoScenarioFile db 'No scenario files found',0
_aSeeTechnicalSu db 'See Technical Supplement',0
aTheater_0 db 'THEATER',0
_aMissionType db 'MISSION TYPE',0
page1Num dw 1
    db 0
    db 0
_drawColor dw 0
    db 0Bh
    db 0
    db 0
    db 0
    db 0
    db 0
_fontIndex dw 1
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
_page1NumPtr dw offset page1Num
page2Num dw 2
unk_1709A db 0
    db 0
    db 0
    db 0
    db 0Bh
    db 0
    db 0
    db 0
    db 0
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
_page2NumPtr dw offset page2Num
unk_170B0 db 3
    db 0
unk_170B2 db 0
    db 0
    db 0
    db 0
    db 0Bh
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1
    db 0
    db 0
    db 0
unk_170C0 db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    dw offset unk_170B0
_missTheaNames dw offset aLibya
    dw offset aPersianGulf ;"Persian Gulf"
    dw offset aVietnam ;"Vietnam"
    dw offset aMiddleEast ;"Middle East"
    dw offset aOtherAreas ;"Other Areas"
_missTheaDesc dw offset aAcrossTheLineO
    dw offset aKeepingTheSeaL ;"Keeping the Sea Lanes Open"
    dw offset aAmericaSLonges ;"America's Longest Air War"
    dw offset aEaglesVsMigs ;"Eagles vs MiGs"
    dw offset aInsertYourScen ;"Insert your scenario disk"
_missDiffLevels dw offset aRookie
    dw offset aPilot ;"Pilot"
    dw offset aVeteran ;"Veteran"
    dw offset aAce ;"Ace"
    dw offset aDemo ;"Demo"
_missDiffDesc dw offset aGetOffToAGoodS
    dw offset aForTheCasualPl ;"For the casual player"
    dw offset aForMoreSerious ;"For more serious players"
    dw offset aTheUltimateCha ;"The Ultimate Challenge"
    dw offset aLetSSeeWhatThi ;"Let's see what this thing can do"
_scenarioCodePtr dw offset aNc
    dw offset aCe ;"ce"
    dw offset aJp ;"jp"
    dw offset aNa ;"na"
_missScenarioNames dw offset aNorthCape
    dw offset aCentralEurope ;"Central Europe"
    dw offset aDesertStorm ;"Desert Storm"
    dw offset aNorthAtlantic ;"North Atlantic"
    dw offset aOtherAreas_0 ;"Other Areas"
_missScenarioDesc dw offset aIntoTheSovietS
    dw offset aRedStormRaging ;"Red Storm Raging"
    dw offset aTheFightForKuw ;"The Fight for Kuwait"
    dw offset aDefendingTheIc ;"Defending the Iceland-UK Gap"
    dw offset aSelectABuiltIn ;"Select a built-in area"
_missTypeNames dw offset aHistoricalMiss
off_1710E dw offset aGeneralAirStri ;"General Air Strikes"
off_17110 dw offset asc_16E46
    dw offset asc_16E46+1
    dw offset asc_16E46+2
_missTypeDesc dw offset aReenactHistory
    dw offset aTheCoreOfTheAi ;"The core of the Air Campaign"
    dw offset asc_16E76
    dw offset asc_16E76+1
off_1711E dw offset asc_16E76+2
_missHistorical1Names dw offset aSaddamSEyes
    dw offset aCommandAndCont ;"Command and Control"
    dw offset aScudBusting ;"Scud Busting"
    dw offset aNoNukes ;"No Nukes"
    dw offset aMoreHistorical ;"more historical missions"
_missHistorical1Desc dw offset aIraqSEarlyWarn
    dw offset aIraqiDefenseNe ;"Iraqi Defense Nerve Center"
    dw offset aStopSaddamSTer ;"Stop Saddam's Terror Weapon"
    dw offset aNuclearResearc ;"Nuclear Research Facility"
off_17132 dw offset unk_16F36
_missHistorical2Names dw offset aBabyMilkFactory
    dw offset aStopTheSpill ;"Stop the Spill"
    dw offset aBridgesToNowhe ;"Bridges to Nowhere"
    dw offset aRepublicanGuar ;"Republican Guards"
    dw offset aMoreHistoric_0 ;"more historical missions"
_missHistorical2Desc dw offset aChemicalBiolog
    dw offset aSeverTheOilPum ;"Sever the Oil Pumping Manifold"
off_17142 dw offset aSaddamSEliteAr ;"Saddam's Elite Armored Units"
    dw offset aCutTheSupplyLi ;"Cut the Supply Lines"
    dw offset asc_1700B
_missionStr dw offset aMission
_word_1714A dw 1
    dw 53h ;these arrays are used in the arm animation routine, maybe coords?
    dw 0D9h
    dw 0A4h
    dw 1
    dw 1
    dw 0BFh
    dw 10Ah
_word_1715A dw 0
    dw 0
    dw 0
    dw 2Eh
    dw 3Eh
    dw 7Ch
    dw 6Ah
    dw 53h
_word_1716A dw 3Eh
    dw 3Eh
    dw 3Dh
    dw 3Eh
    dw 3Eh
    dw 3Eh
    dw 3Fh
    dw 3Eh
_word_1717A dw 1Ch
    dw 2Fh
    dw 35h
    dw 36h
    dw 37h
    dw 38h
    dw 39h
    dw 38h
_word_1718A dw 52h
    dw 5Dh
    dw 66h
    dw 66h
    dw 68h
    dw 5Ch
    dw 4Bh
    dw 35h
_word_1719A dw 3Eh
    dw 2Eh
    dw 25h
    dw 2Dh
    dw 3Eh
    dw 4Bh
    dw 5Dh
    dw 74h
_enableHighlight dw 1
_plh3d3Ptr dw offset placeholder_3d3
_missionPick dw 0FFFFh
    db 0FFh
    db 0FFh
_word_171B2 dw 1
    dw 2
    dw 3
    dw 4
    dw 5
    dw 6
    dw 7
_aRepeatLastMiss db 'Repeat last mission ? (y/n)',0
_aRb_2 db 'rb',0
_aF15_spr_1 db 'F15.spr',0
_aPleaseReinsert db 'Please reinsert F15 Disk A',0
_aPressSelectorW db '<Press selector when ready>',0
_aDecodingMissio db 'decoding mission...',0
_aTodaySMission db 'TODAY',27h,'S MISSION',0
_aTakeoffFrom db 'Takeoff from:',0
_aOnc_2 db 'ONC ',0
_aPrimaryTarget db 'Primary Target:',0
_aOnc_0 db 'ONC ',0
_aSecondaryTarge db 'Secondary Target:',0
_aOnc_1 db 'ONC ',0
    db 0
_word_17282 dw 0
_word_17284 dw 0
_word_17286 dw 0
_word_17288 dw 0
_word_1728A dw 0
_word_1728C dw 0
_word_1728E dw 0
_word_17290 dw 0
_word_17292 dw 0
    db 0
    db 0
    db 6Dh
    db 0
    db 0
    db 0
    db 3Fh
    db 1
_byte_1729C db 1
    db 1
    db 1
    db 0
    db 1
    db 0
_byte_172A2 db 0
_timerHandlerInstalled db 0
_word_172A4 dw 0
_word_172A6 dw 0
_word_172A8 dw 0
_word_172AA dw 0
_word_172AC dw 0
_word_172AE dw 0
_byte_172B0 db 0
_word_172B1 dw 0
_word_172B3 dw 0
_word_172B5 dw 0
_byte_172B7 db 0
_word_172B8 dw 0
_word_172BA dw 0
    db 0
    db 0
_timerCounter db 0
_timerCounter2 db 0
_timerCounter3 db 0
_timerCounter4 db 0
    db 2Ah
    db 2Eh
    db 2Ah
unk_172C5 db 0
_byte_172C6 db 49h
    db 3
    db 46h
    db 31h
unk_172CA db 35h
    db 41h
    db 0
_searchFCB db 0FFh
    db 0
    db 0
    db 0
    db 0
    db 0
    db 8
    db 0
    db 3Fh ;? ; filename to search for
    db 3Fh
    db 3Fh
    db 3Fh
    db 3Fh
    db 3Fh
    db 3Fh
    db 3Fh
    db 3Fh
    db 3Fh
    db 3Fh
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
_diskTransferArea db 85h dup(0)
_word_1737E dw 0
a2ndLt_ db '2nd Lt. ',0
a1stLt_ db '1st Lt. ',0
aCapt_ db 'Capt. ',0
aMajor db 'Major ',0
aLtCol_ db 'Lt Col. ',0
aColonel db 'Colonel ',0
aGen_ db 'Gen. ',0
_aArmpiece_pic db 'ArmPiece.Pic',0
_aHiscore_pic db 'HiScore.Pic',0
_pilotSelectFlag db 0
unk_173D2 db 0
unk_173D3 db 0
    db 0
    db 0
_word_173D6 dw 7
    db 0
    db 0
    db 0
    db 0
unk_173DC db 0
    db 0
_word_173DE dw 1
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
_screenBuf dw offset unk_173D2
unk_173EA db 0
    db 0
    db 0
    db 0
    db 0Ch
    db 0
    db 0
    db 0
    db 0
    db 0
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
_pageNumPtr dw offset unk_173EA
    db 0
    db 0
_ranks dw offset a2ndLt_
    dw offset a1stLt_ ;"1st Lt. "
    dw offset aCapt_ ;"Capt. "
    dw offset aMajor ;"Major "
    dw offset aLtCol_ ;"Lt Col. "
    dw offset aColonel ;"Colonel "
    dw offset aGen_ ;"Gen. "
_byte_17412 db 82h
    db 71h
    db 81h
    db 70h
    db 6Fh
    db 0A1h
    db 9Fh
    db 0
_byte_1741A db 80h
    db 80h
    db 0B3h
    db 0B3h
    db 91h
    db 91h
    db 0A2h
    db 0
_byte_17422 db 9
    db 0Bh
    db 0Bh
    db 0Dh
    db 2Fh
    db 0Bh
    db 0Fh
_aOriginalDiskIn db 'Original Disk in drive.  Roster will not be saved.',0
_aPressAKeyToCon db 'Press a key to continue.',0
_aUseSelectorToC db 'Use SELECTOR to choose pilot,  ESC to enter new pilot.',0
_asc_174AC db ' (',0
_asc_174AF db ')',0
    db 0
_blinkColors dw 7
    dw 0Fh
_blinkColorIdx dw 0
_aMenterYourName db 'ŒENTER YOUR NAME !',0
    db 0
_pilotNameInputColors dw 0
    db 8 ;grey name input box
    db 0
_aRb_3 db 'rb',0
_aHallfame db 'HallFame',0
_aWb db 'wb',0
_aHallfame_0 db 'HallFame',0
_ovlSeg1 dw 0
_ovlParCnt dw 0
_ovlParBlock dw 0
_ovlSeg2 dw 0
_ovlInsaneFlag db 0
_aAlloc1M db 'Allocated 1Mb of space????$'
_aDosLied db 'MS-DOS lied to us about how much memory was available$'
_aFileNFound db 'Filename not found$'
_aEnoughMem db 'Not enough memory to load file$'
_aOvlFail db 'Overlay load failed for some reason$'
_aOvlOvrrun db 'Overlay has overrun allocated memory$'
_aOvlShrink db 'Unable to shrink overlay memory allocation$'
aOvlRel db 'Error releasing overlay memory$'
    db 0
; ------------------------------startData:0xab8------------------------------
_gfx_jump_0_alloc proc far
    db 0EAh ;jmp far ptr gfx_slot_0_alloc
    dd 0
_gfx_jump_0_alloc endp
; ------------------------------startData:0xab8------------------------------
    db 0EAh ;jmp far ptr gfx_slot_01
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_02
    dd 0
    db 0EAh ;jmp gfx_slot_03
    dd 0
    db 0EAh ;jmp gfx_slot_04
    dd 0
; ------------------------------startData:0xad1------------------------------
_gfx_jump_05_drawString proc near
    db 0EAh ;jmp gfx_slot_05_t04
    dd 0
_gfx_jump_05_drawString endp
; ------------------------------startData:0xad1------------------------------
    db 0EAh ;jmp gfx_slot_06
    dd 0
    db 0EAh ;jmp gfx_slot_07
    dd 0
    db 0EAh ;jmp gfx_slot_08
    dd 0
    db 0EAh ;jmp gfx_slot_09
    dd 0
    db 0EAh ;jmp gfx_slot_0a
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_0b
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_0c
    dd 0
; ------------------------------startData:0xaf9------------------------------
_gfx_jump_0d_setCurBuf proc far
    db 0EAh ;jmp gfx_slot_0d_setCurBuf
    dd 0
_gfx_jump_0d_setCurBuf endp
; ------------------------------startData:0xaf9------------------------------
; ------------------------------startData:0xafe------------------------------
_gfx_jump_0e_setCurBuf proc near
    db 0EAh ;jmp far ptr gfx_slot_0e_setCurBuf
    dd 0
_gfx_jump_0e_setCurBuf endp
; ------------------------------startData:0xafe------------------------------
; ------------------------------startData:0xb03------------------------------
_gfx_jump_0f_getBufPtr proc far
    db 0EAh ;jmp gfx_slot_0f_getButPtr
    dd 0
_gfx_jump_0f_getBufPtr endp
; ------------------------------startData:0xb03------------------------------
; ------------------------------startData:0xb08------------------------------
_gfx_jump_10_getCurBuf proc far
    db 0EAh ;jmp gfx_slot_10_getCurBuf
    dd 0
_gfx_jump_10_getCurBuf endp
; ------------------------------startData:0xb08------------------------------
; ------------------------------startData:0xb0d------------------------------
_gfx_jump_11_blitSprite proc near
    db 0EAh ;jmp gfx_slot_11
    dd 0
_gfx_jump_11_blitSprite endp
; ------------------------------startData:0xb0d------------------------------
    db 0EAh ;jmp gfx_slot_12
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_13
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_14
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_15
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_15
    dd 0
; ------------------------------startData:0xb2b------------------------------
_gfx_jump_17_bufSize proc far
    db 0EAh ;jmp gfx_slot_17
    dd 0
_gfx_jump_17_bufSize endp
; ------------------------------startData:0xb2b------------------------------
    db 0EAh ;jmp far ptr gfx_slot_18
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_18
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_1a
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_1b
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_1c
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_1d
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_1e
    dd 0
; ------------------------------startData:0xb53------------------------------
_gfx_jump_1f proc far
    db 0EAh ;jmp gfx_slot_1f
    dd 0
_gfx_jump_1f endp
; ------------------------------startData:0xb53------------------------------
; ------------------------------startData:0xb58------------------------------
_gfx_jump_20_setVal proc far
    db 0EAh ;jmp gfx_slot_20_setVal
    dd 0
_gfx_jump_20_setVal endp
; ------------------------------startData:0xb58------------------------------
; ------------------------------startData:0xb5d------------------------------
_gfx_jump_21 proc near
    db 0EAh ;jmp far ptr gfx_slot_21
    dd 0
_gfx_jump_21 endp
; ------------------------------startData:0xb5d------------------------------
; ------------------------------startData:0xb62------------------------------
_gfx_jump_22 proc near
    db 0EAh ;jmp gfx_slot_22_nullsub
    dd 0
_gfx_jump_22 endp
; ------------------------------startData:0xb62------------------------------
; ------------------------------startData:0xb67------------------------------
_gfx_jump_23 proc far
    db 0EAh ;jmp gfx_slot_22_nullsub
    dd 0
_gfx_jump_23 endp
; ------------------------------startData:0xb67------------------------------
    db 0EAh ;jmp far ptr gfx_slot_24
    dd 0
; ------------------------------startData:0xb71------------------------------
_gfx_jump_25 proc near
    db 0EAh ;jmp far ptr gfx_slot_25
    dd 0
_gfx_jump_25 endp
; ------------------------------startData:0xb71------------------------------
    db 0EAh ;jmp far ptr gfx_slot_26
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_27
    dd 0
; ------------------------------startData:0xb80------------------------------
_gfx_jump_28 proc near
    db 0EAh ;jmp far ptr gfx_slot_25
    dd 0
_gfx_jump_28 endp
; ------------------------------startData:0xb80------------------------------
; ------------------------------startData:0xb85------------------------------
_gfx_jump_29_switchColor proc near
    db 0EAh ;jmp far ptr gfx_slot_29_fillRect
    dd 0
_gfx_jump_29_switchColor endp
; ------------------------------startData:0xb85------------------------------
; ------------------------------startData:0xb8a------------------------------
_gfx_jump_2a proc near
    db 0EAh ;jmp gfx_slot_2a
    dd 0
_gfx_jump_2a endp
; ------------------------------startData:0xb8a------------------------------
    db 0EAh ;jmp far ptr gfx_slot_2b
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_2c_blitPage1
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_2d
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_2e
    dd 0
; ------------------------------startData:0xba3------------------------------
_gfx_jump_2f_charWidth proc far
    db 0EAh ;jmp gfx_slot_2f
    dd 0
_gfx_jump_2f_charWidth endp
; ------------------------------startData:0xba3------------------------------
; ------------------------------startData:0xba8------------------------------
_gfx_jump_30_blitToCurrent proc near
    db 0EAh ;jmp far ptr gfx_slot_30_blitToCurrent
    dd 0
_gfx_jump_30_blitToCurrent endp
; ------------------------------startData:0xba8------------------------------
    db 0EAh ;jmp gfx_slot_31
    dd 0
    db 0EAh ;jmp gfx_slot_32
    dd 0
; ------------------------------startData:0xbb7------------------------------
_gfx_jump_33_fillRow proc near
    db 0EAh ;args: ss, bpjmp far ptr gfx_slot_33_memcpyRow
    dd 0
_gfx_jump_33_fillRow endp
; ------------------------------startData:0xbb7------------------------------
; ------------------------------startData:0xbbc------------------------------
_gfx_jump_34_fillRow proc near
    db 0EAh ;args: ss, bpjmp far ptr gfx_slot_33_memcpyRow
    dd 0
_gfx_jump_34_fillRow endp
; ------------------------------startData:0xbbc------------------------------
; ------------------------------startData:0xbc1------------------------------
_gfx_jump_35 proc near
    db 0EAh ;jmp far ptr gfx_slot_35_null
    dd 0
_gfx_jump_35 endp
; ------------------------------startData:0xbc1------------------------------
; ------------------------------startData:0xbc6------------------------------
_gfx_jump_36_null proc near
    db 0EAh ;jmp far ptr gfx_slot_36_null
    dd 0
_gfx_jump_36_null endp
; ------------------------------startData:0xbc6------------------------------
; ------------------------------startData:0xbcb------------------------------
_gfx_jump_37_null proc near
    db 0EAh ;jmp far ptr gfx_slot_37_null
    dd 0
_gfx_jump_37_null endp
; ------------------------------startData:0xbcb------------------------------
; ------------------------------startData:0xbd0------------------------------
_gfx_jump_38_getPageBuf proc near
    db 0EAh ;index to word offsetjmp far ptr gfx_slot_38_getBuf
    dd 0
_gfx_jump_38_getPageBuf endp
; ------------------------------startData:0xbd0------------------------------
    db 0EAh ;jmp far ptr gfx_slot_39
    dd 0
; ------------------------------startData:0xbda------------------------------
_gfx_jump_3a_getRowOffset proc near
    db 0EAh ;index *= 2, word index?jmp far ptr gfx_slot_3a_getRowOffset
    dd 0
_gfx_jump_3a_getRowOffset endp
; ------------------------------startData:0xbda------------------------------
; ------------------------------startData:0xbdf------------------------------
_gfx_jump_3b_clearBuf proc near
    db 0EAh ;jmp far ptr gfx_slot_3b_clearBuf
    dd 0
_gfx_jump_3b_clearBuf endp
; ------------------------------startData:0xbdf------------------------------
; ------------------------------startData:0xbe4------------------------------
_gfx_jump_3c_setMode13 proc far
    db 0EAh ;mode 13h: 40x25 halfwidthjmp far ptr gfx_slot_3c_setMode13
    dd 0
_gfx_jump_3c_setMode13 endp
; ------------------------------startData:0xbe4------------------------------
; ------------------------------startData:0xbe9------------------------------
_gfx_jump_3d_null proc near
    db 0EAh ;jmp far ptr gfx_slot_3d_null
    dd 0
_gfx_jump_3d_null endp
; ------------------------------startData:0xbe9------------------------------
    db 0EAh ;jmp far ptr gfx_slot_3e
    dd 0
; ------------------------------startData:0xbf3------------------------------
_gfx_jump_3f_modecode proc far
    db 0EAh ;jmp gfx_slot_3f_ax3
    dd 0
_gfx_jump_3f_modecode endp
; ------------------------------startData:0xbf3------------------------------
    db 0EAh ;jmp far ptr gfx_slot_40
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_41
    dd 0
    db 0EAh ;jmp gfx_slot_42
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_43
    dd 0
; ------------------------------startData:0xc0c------------------------------
_gfx_jump_44_setDac proc far
    db 0EAh ;jmp gfx_slot_44_setDac
    dd 0
_gfx_jump_44_setDac endp
; ------------------------------startData:0xc0c------------------------------
; ------------------------------startData:0xc11------------------------------
_gfx_jump_45_retrace proc far
    db 0EAh ;jmp gfx_slot_45_retrace
    dd 0
_gfx_jump_45_retrace endp
; ------------------------------startData:0xc11------------------------------
; ------------------------------startData:0xc16------------------------------
_gfx_jump_46_retrace2 proc far
    db 0EAh ;jmp gfx_slot_46_retrace2
    dd 0
_gfx_jump_46_retrace2 endp
; ------------------------------startData:0xc16------------------------------
    db 0EAh ;jmp far ptr gfx_slot_13
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_14
    dd 0
    db 0EAh ;jmp gfx_slot_11
    dd 0
    db 0EAh ;jmp gfx_slot_12
    dd 0
; ------------------------------startData:0xc2f------------------------------
_gfx_jump_4b_storeBufPtr proc far
    db 0EAh ;jmp gfx_slot_4b_storeBufPtr
    dd 0
_gfx_jump_4b_storeBufPtr endp
; ------------------------------startData:0xc2f------------------------------
    db 0EAh ;jmp far ptr gfx_slot_4c
    dd 0
    db 0EAh ;jmp far ptr gfx_slot_4d
    dd 0
; ------------------------------startData:0xc3e------------------------------
_gfx_jump_4e_getVal proc far
    db 0EAh ;jmp gfx_slot_4e_getVal
    dd 0
_gfx_jump_4e_getVal endp
; ------------------------------startData:0xc3e------------------------------
    db 0EAh ;jmp gfx_slot_4f
    dd 0
; ------------------------------startData:0xc48------------------------------
_gfx_jump_50_null proc far
    db 0EAh ;jmp gfx_slot_50_null
    dd 0
_gfx_jump_50_null endp
; ------------------------------startData:0xc48------------------------------
; ------------------------------startData:0xc4d------------------------------
_gfx_jump_51_null proc far
    db 0EAh ;jmp gfx_slot_51_null
    dd 0
_gfx_jump_51_null endp
; ------------------------------startData:0xc4d------------------------------
    db 0EAh ;jmp gfx_slot_52
    dd 0
; ------------------------------startData:0xc57------------------------------
_gfx_jump_52 proc near
    db 0EAh ;jmp gfx_slot_52_null
    dd 0
_gfx_jump_52 endp
; ------------------------------startData:0xc57------------------------------
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
; ------------------------------startData:0xc7a------------------------------
_misc_jump_5a_keybuf proc near
    db 0EAh ;jmp far ptr misc_5a_checkKeyBuf
    dd 0
_misc_jump_5a_keybuf endp
; ------------------------------startData:0xc7a------------------------------
; ------------------------------startData:0xc7f------------------------------
_misc_jump_5b_getkey proc near
    db 0EAh ;jmp far ptr misc_5b_getKey
    dd 0
_misc_jump_5b_getkey endp
; ------------------------------startData:0xc7f------------------------------
    db 0EAh ;jmp far ptr misc_5c_dosGetKey
    dd 0
; ------------------------------startData:0xc89------------------------------
_misc_jump_5d_readJoy proc near
    db 0EAh ;jmp far ptr misc_5d_readJoy
    dd 0
_misc_jump_5d_readJoy endp
; ------------------------------startData:0xc89------------------------------
; ------------------------------startData:0xc8e------------------------------
_misc_jump_5e_clearKeyFlags proc near
    db 0EAh ;jmp far ptr misc_5e_5f_clearKeyFlags
    dd 0
_misc_jump_5e_clearKeyFlags endp
; ------------------------------startData:0xc8e------------------------------
    db 0EAh ;jmp far ptr misc_5e_5f_clearKeyFlags
    dd 0
    db 0
    db 0
    db 0
    db 0
unk_177EC db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
unk_177F6 db 0
    db 0
    db 0
    db 0
    db 0
    db 0
; ------------------------------startData:0xcac------------------------------
_audio_jump_64 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_jump_64 endp
; ------------------------------startData:0xcac------------------------------
; ------------------------------startData:0xcb1------------------------------
_audio_jump_65 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_jump_65 endp
; ------------------------------startData:0xcb1------------------------------
    db 0EAh ;jmp far ptr 0:0
    dd 0
; ------------------------------startData:0xcbb------------------------------
_audio_jump_67 proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_jump_67 endp
; ------------------------------startData:0xcbb------------------------------
unk_17810 db 0EAh
    db 0
unk_17812 db 0
unk_17813 db 0
unk_17814 db 0
unk_17815 db 0EAh
unk_17816 db 0
    db 0
    db 0
    db 0
    db 0EAh
    db 0
    db 0
    db 0
    db 0
; ------------------------------startData:0xccf------------------------------
_audio_jump_6b proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_jump_6b endp
; ------------------------------startData:0xccf------------------------------
; ------------------------------startData:0xcd4------------------------------
_audio_jump_6c proc near
    db 0EAh ;jmp far ptr 0:0
    dd 0
_audio_jump_6c endp
; ------------------------------startData:0xcd4------------------------------
    db 0EAh
    db 0
    db 0
    db 0
    db 0
_word_1782E dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
_word_17836 dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
_word_1783E dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
_word_17846 dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
_word_1784E dw 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
_word_17856 dw 0
_word_17858 dw 0
    db 0
    db 0
    db 0
    db 0
_noJoy80 db 8 dup( 0)
_word_17866 dw 0
_word_17868 dw 0
_word_1786A dw 0
_word_1786C dw 0
    db 0
_word_1786F dw 0
_word_17871 dw 0
_word_17873 dw 0
_word_17875 dw 0
_byte_17877 db 162h dup(0FFh)
byte_179D9 db 56h dup(0FFh)
_byte_17A2F db 0AAh dup(0)
byte_17AD9 db 2Bh dup(0)
unk_17B04 db 0
    db 0
byte_17B06 db 0E1h dup(0)
word_17BE7 dw 0
word_17BE9 dw 0
_word_17BEB dw 0FFFFh
_word_17BED dw 0
    db 0
_byte_17BF0 db 0
_word_17BF1 dw 0
_word_17BF3 dw 0
_word_17BF5 dw 0
_word_17BF7 dw 0
_word_17BF9 dw 13Fh
_word_17BFB dw 6Fh
    db 0
_cbreakHit db 0
_origCBreakSeg dw 0
_origCBreakOfs dw 0
    db 0
_errorCodeStr dw 0
_fileReadBuf db 100h dup( 0)
byte_17D06 db 10h dup(0)
byte_17D16 db 1Bh dup(0)
byte_17D31 db 20h dup(0)
byte_17D51 db 21h dup(0)
byte_17D72 db 94h dup(0)
_aFileNotFound db ':File not found$'
_aNoFileBuffersAvailable db ':No file buffers available$'
_aOpenError db ':Open error $'
_aFileClosingError db 'File closing error$'
_aReadError db 'Read error$'
_aWriteError db 'Write error$'
word_17E68 dw 0
word_17E6A dw 0
    db 0
    db 0
_fileReadPos dw 0
_tmpFileHandle dw 0
_picDecodedRowBuf db 140h dup( 0)
_screenBufSize dw 0
_tmpPageIndex dw 0
_rowOffset dw 0
    db 0
    db 0
_row dw 0
_readFromFilePtr dw 0
_aInsufficientSy db 'Insufficient system memory - AllocBuffer$',0
aBufferDeallocE db 'Buffer dealloc error$',0
_word_17FFE dw 0FFFFh, 2 dup(1), 0FFFFh, 0, 1, 0, 0FFFFh, 0
_word_18010 dw 2 dup(1), 2 dup(0FFFFh), 1, 0, 0FFFFh, 2 dup(0), 0E000h
    dw 0F000h
_word_18026 dw 0, 1000h, 2000h, 400h, 100h, 40h, 10h, 4
_terrainSignature dw 3131h
_terrainBuf1 dw 5 dup(20h)
    _terrainBuf2 TerrainUnk 5 dup(<0>)
_gridSignature dw 3232h
    db 0FFh
    db 0FFh
_word_18186 dw 0
_word_18188 dw 0
_a_3dt db '.3dT',0
_aRb db 'rb',0
_aOpenErrorOn_3d db 'Open Error on *.3DT, assuming new file !',0
_aBadTileFileFor db 'Bad Tile file format.',0
_aTooManyTiles_ db 'Too many tiles.',0
_aTooMuchTileDat db 'Too much tile data',0
_a_3dg db '.3dG',0
_aRb_0 db 'rb',0
_aOpenErrorOn__0 db 'Open Error on *.3DG, assuming new file !',0
_aBadGridFileFor db 'Bad Grid file format.',0
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
aLibya_wld db 'Libya.wld',0
aGulf_wld db 'gulf.wld',0
aVn_wld db 'vn.wld',0
aMe_wld db 'me.wld',0
aNc_wld db 'nc.wld',0
aCe_wld db 'ce.wld',0
aJp_wld db 'jp.wld',0
aNa_wld db 'na.wld',0
_word_182BA dw 0
_word_182BC dw 0
_word_182BE dw 0
_word_182C0 dw 0
_word_182C2 dw 0
_word_182C4 dw 0
_word_182C6 dw 0
_word_182C8 dw 0
    db 0
    db 0
    db 0
    db 0
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
    db 'È',0
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
    db '}',0
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
    db 'È',0
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
    db '}',0
    db 3
    db 0
    db 0
    db 0
aSaN4 db 'SA-N-4',0
    db 0
    db 'È',0
    db 4
    db 0
    db 1
    db 0
aSaN5 db 'SA-N-5',0
    db 0
aC db '–',0
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
    db 'È',0
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
aK db 'K',0
    db 8,0
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
    db 'È',0
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
_planes db 4Dh, 49h, 47h, 2Dh, 32h, 33h, 0, 20h ;field_0 ; 19 items
    db 46h, 6Ch, 6Fh, 2 dup(67h), 65h, 72h, 3 dup(0) ;field_8
    dw 2E4h ;field_12
    dw 230h ;field_14
    db 3, 0, 11h, 0, 0Ah, 0, 2, 3 dup(0) ;field_16
    db 4Dh, 49h, 47h, 2Dh, 32h, 35h, 0, 20h ;field_0
    db 46h, 6Fh, 78h, 62h, 61h, 74h, 4 dup(0) ;field_8
    dw 23Ah ;field_12
    dw 2BCh ;field_14
    db 2, 0, 12h, 3 dup(0), 2, 3 dup(0) ;field_16
    db 4Dh, 49h, 47h, 2Dh, 32h, 39h, 0, 20h ;field_0
    db 46h, 75h, 6Ch, 63h, 72h, 75h, 6Dh, 3 dup(0) ;field_8
    dw 2BCh ;field_12
    dw 190h ;field_14
    db 5, 0, 13h, 0, 14h, 0, 2, 3 dup(0) ;field_16
    db 46h, 2Dh, 31h, 4 dup(0), 20h ;field_0
    db 4Dh, 69h, 72h, 61h, 67h, 65h, 4 dup(0) ;field_8
    dw 316h ;field_12
    dw 3A2h ;field_14
    db 3, 0, 14h, 3 dup(0), 2, 3 dup(0) ;field_16
    db 53h, 75h, 2Dh, 32h, 37h, 2 dup(0), 20h ;field_0
    db 46h, 6Ch, 61h, 6Eh, 6Bh, 65h, 72h, 3 dup(0) ;field_8
    dw 2D5h ;field_12
    dw 2CBh ;field_14
    db 4, 0, 13h, 0, 14h, 0, 2, 3 dup(0) ;field_16
    db 49h, 4Ch, 2Dh, 37h, 36h, 2 dup(0), 20h ;field_0
    db 4Dh, 61h, 69h, 6Eh, 73h, 74h, 61h, 79h, 2 dup(0) ;field_8
    dw 190h ;field_12
    dw 0FA0h ;field_14
    db 1, 0, 10h, 0, 0Ch, 0, 2, 3 dup(0) ;field_16
    db 46h, 2Dh, 34h, 45h, 3 dup(0), 20h ;field_0
    db 50h, 68h, 61h, 6Eh, 74h, 6Fh, 6Dh, 3 dup(0) ;field_8
    dw 320h ;field_12
    dw 208h ;field_14
    db 4, 0, 12h, 0, 0Bh, 0, 2, 3 dup(0) ;field_16
    db 46h, 2Dh, 31h, 34h, 3 dup(0), 20h ;field_0
    db 54h, 6Fh, 6Dh, 63h, 61h, 74h, 4 dup(0) ;field_8
    dw 320h ;field_12
    dw 320h ;field_14
    db 4, 0, 13h, 0, 8, 0, 2, 3 dup(0) ;field_16
    db 46h, 2Dh, 31h, 38h, 3 dup(0), 20h ;field_0
    db 48h, 6Fh, 72h, 6Eh, 65h, 74h, 4 dup(0) ;field_8
    dw 294h ;field_12
    dw 1CDh ;field_14
    db 5, 0, 2 dup(0FFh), 2 dup(0), 2, 3 dup(0) ;field_16
    db 41h, 6Eh, 2Dh, 37h, 32h, 2 dup(0), 20h ;field_0
    db 43h, 6Fh, 61h, 6Ch, 65h, 72h, 4 dup(0) ;field_8
    dw 15Eh ;field_12
    dw 26Ch ;field_14
    db 2, 3 dup(0), 9, 0, 2, 3 dup(0) ;field_16
    db 46h, 2Dh, 31h, 38h, 3 dup(0), 20h ;field_0
    db 48h, 6Fh, 72h, 6Eh, 65h, 74h, 4 dup(0) ;field_8
    dw 294h ;field_12
    dw 1CDh ;field_14
    db 5, 0, 2 dup(0FFh), 4, 0, 2, 3 dup(0) ;field_16
    db 4Dh, 49h, 47h, 2Dh, 32h, 33h, 0, 20h ;field_0
    db 46h, 6Ch, 6Fh, 2 dup(67h), 65h, 72h, 3 dup(0) ;field_8
    dw 2E4h ;field_12
    dw 230h ;field_14
    db 3, 3 dup(0), 4, 0, 2, 3 dup(0) ;field_16
    db 46h, 2Dh, 31h, 34h, 3 dup(0), 20h ;field_0
    db 54h, 6Fh, 6Dh, 63h, 61h, 74h, 4 dup(0) ;field_8
    dw 320h ;field_12
    dw 320h ;field_14
    db 4, 0, 2 dup(0FFh), 8, 0, 2, 3 dup(0) ;field_16
    db 46h, 2Dh, 34h, 45h, 3 dup(0), 20h ;field_0
    db 50h, 68h, 61h, 6Eh, 74h, 6Fh, 6Dh, 3 dup(0) ;field_8
    dw 320h ;field_12
    dw 208h ;field_14
    db 4, 0, 2 dup(0FFh), 0Bh, 0, 2, 3 dup(0) ;field_16
    db 4Dh, 49h, 47h, 2Dh, 31h, 37h, 0, 20h ;field_0
    db 46h, 72h, 65h, 73h, 63h, 6Fh, 4 dup(0) ;field_8
    dw 226h ;field_12
    dw 12Ch ;field_14
    db 3, 0, 11h, 0, 10h, 0, 2, 3 dup(0) ;field_16
    db 54h, 75h, 2Dh, 39h, 35h, 2 dup(0), 20h ;field_0
    db 42h, 65h, 61h, 72h, 6 dup(0) ;field_8
    dw 19Ah ;field_12
    dw 13ECh ;field_14
    db 1, 3 dup(0), 12h, 0, 2, 3 dup(0) ;field_16
    db 4Dh, 69h, 2Dh, 32h, 34h, 2 dup(0), 20h ;field_0
    db 48h, 69h, 6Eh, 64h, 6 dup(0) ;field_8
    dw 0C8h ;field_12
    dw 12Ch ;field_14
    db 1, 0, 11h, 0, 13h, 0, 2, 3 dup(0) ;field_16
    db 46h, 2Dh, 35h, 4 dup(0), 20h ;field_0
    db 54h, 69h, 67h, 65h, 72h, 5 dup(0) ;field_8
    dw 1F4h ;field_12
    dw 0FAh ;field_14
    db 3, 0, 16h, 0, 16h, 0, 2, 3 dup(0) ;field_16
    db 37h, 36h, 37h, 4 dup(0), 20h ;field_0
    db 42h, 6Fh, 65h, 69h, 6Eh, 67h, 4 dup(0) ;field_8
    dw 190h ;field_12
    dw 3E8h ;field_14
    db 1, 0, 2 dup(0FFh), 12h, 0, 2, 3 dup(0) ;field_16
aNone_0 db 'None',0
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
    db 13h
    db 0
aSa2_0 db 'SA-2',0
    db 0
    db 0
    db 0
    db 7Dh
    db 0
    db 0D0h
    db 7
    db 1
    db 0
    db 4
    db 0
    db 13h
    db 0
aSa5_0 db 'SA-5',0
    db 0
    db 0
    db 0
aC_0 db '–',0
    db 8
    db 7
    db 1
    db 0
    db 1
    db 0
    db 13h
    db 0
aSa8b_0 db 'SA-8B',0
    db 0
    db 0
    db 41h
    db 0
    db 0B0h
    db 4
    db 2
    db 0
    db 3
    db 0
    db 13h
    db 0
aSa10_0 db 'SA-10',0
    db 0
    db 0
unk_186C0 db 7Dh
    db 0
    db 8
    db 7
    db 3
    db 0
unk_186C6 db 2
    db 0
    db 13h
    db 0
aSa11_0 db 'SA-11',0
    db 0
    db 0
    db 64h
    db 0
    db 0DCh
    db 5
    db 2
    db 0
    db 3
    db 0
    db 13h
    db 0
aSa12_0 db 'SA-12',0
    db 0
    db 0
    db 96h
    db 0
    db 0D0h
    db 7
    db 3
    db 0
    db 2
    db 0
    db 13h
    db 0
aSa13_0 db 'SA-13',0
    db 0
    db 0
    db 41h
    db 0
    db 84h
    db 3
    db 0
    db 0
    db 4
    db 0
    db 13h
    db 0
aSaN4_0 db 'SA-N-4',0
    db 0
    db 1Eh
    db 0
    db 0B0h
    db 4
    db 2
    db 0
    db 3
    db 0
    db 13h
    db 0
aSaN5_0 db 'SA-N-5',0
    db 0
    db 1Eh
    db 0
    db 84h
    db 3
    db 0FFh
    db 0FFh
    db 4
    db 0
    db 13h
    db 0
aSaN6_0 db 'SA-N-6',0
    db 0
    db 7Dh
    db 0
    db 8
    db 7
    db 3
    db 0
    db 2
    db 0
    db 13h
    db 0
aSaN7_0 db 'SA-N-7',0
    db 0
    db 64h
    db 0
    db 0DCh
    db 5
    db 2
    db 0
    db 3
    db 0
    db 13h
    db 0
aHawk_0 db 'Hawk',0
    db 0
    db 0
    db 0
    db 7Dh
    db 0
    db 84h
    db 3
    db 2
    db 0
    db 3
    db 0
    db 13h
    db 0
aRapier_0 db 'Rapier',0
    db 0
    db 41h
    db 0
    db 0B0h
    db 4
    db 2
    db 0
    db 4
    db 0
    db 13h
    db 0
aTiger_1 db 'Tiger',0
    db 0
    db 0
    db 1Eh
    db 0
    db 84h
    db 3
    db 1
    db 0
    db 3
    db 0
    db 13h
    db 0
aSeacat_0 db 'Seacat',0
    db 0
    db 1Eh
    db 0
    db 84h
    db 3
    db 1
    db 0
    db 3
    db 0
    db 13h
    db 0
aAa2 db 'AA-2',0
    db 0
    db 0
    db 0
    db 0Eh
    db 0
    db 0DCh
    db 5
    db 0FFh
    db 0FFh
    db 4
    db 0
    db 13h
    db 0
aAa8 db 'AA-8',0
    db 0
    db 0
    db 0
    db 0Ch
    db 0
    db 8
    db 7
    db 0
    db 0
    db 5
    db 0
    db 13h
    db 0
aAa6 db 'AA-6',0
    db 0
    db 0
    db 0
a2_0 db '2',0
    db 60h
    db 9
    db 2
    db 0
    db 2
    db 0
    db 13h
    db 0
aAa7 db 'AA-7',0
    db 0
    db 0
    db 0
    db 22h
    db 0
    db 8
    db 7
    db 2
    db 0
    db 2
    db 0
    db 13h
    db 0
aAa9 db 'AA-9',0
    db 0
    db 0
    db 0
aR db 'R',0
    db 0D0h
    db 7
    db 2
    db 0
    db 3
    db 0
    db 13h
    db 0
aAa10 db 'AA-10',0
    db 0
    db 0
    db 40h
    db 0
    db 0D0h
    db 7
    db 3
    db 0
    db 4
    db 0
    db 13h
    db 0
aAim120 db 'AIM120',0
    db 0
    db ' ',0
    db '`',9,7,0
    db 4
    db 0
    db 1
    db 0
aAim9 db 'AIM-9',0
    db 0
    db 0
    db 11h
    db 0
    db 0D0h
    db 7
    db 7
    db 0
    db 8
    db 0
    db 1
    db 0
aHarm db 'HARM',0
    db 0
    db 0
    db 0
    db 14h
    db 0
    db 0B0h
    db 4
    db 4
    db 0
    db 2
    db 0
    db 1
    db 0
aPenguin db 'Penguin',0
    db ' ',0
    db 0F4h
    db 1
    db 5
    db 0
    db 2
    db 0
    db 13h
    db 0
aHarpoon db 'Harpoon',0
    db '<',0
    db 0F4h
    db 1
    db 5
    db 0
    db 2
    db 0
    db 13h
    db 0
aAgm65 db 'AGM-65',0
    db 0
    db ' ',0
    db 20h
    db 3
    db 6
    db 0
    db 2
    db 0
    db 0Dh
    db 0
aLgbomb db 'LGBOMB',0
    db 0
    db 0Ah,0
    db 0
    db 0
    db 1Ch
    db 0
    db 2
    db 0
    db 0Fh
    db 0
aRtbomb db 'RTBOMB',0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1Dh
    db 0
    db 2
    db 0
    db 0Fh
    db 0
aFfbomb db 'FFBOMB',0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1Eh
    db 0
    db 2
    db 0
    db 0Fh
    db 0
aAim7w db 'AIM-7W',0
    db 0
    db ',',0
    db 60h
    db 9
    db 2
    db 0
    db 4
    db 0
    db 1
    db 0
aAim9w db 'AIM-9W',0
    db 0
    db 0Ch
    db 0
    db 0D0h
    db 7
    db 0
    db 0
    db 5
    db 0
    db 1
    db 0
aSa14 db 'SA-14',0
    db 0
    db 0
    db 10h
    db 0
    db 84h
    db 3
    db 0
    db 0
    db 5
    db 0
    db 1
    db 0
aAa6_0 db 'AA-6',0
    db 0
    db 0
    db 0
a2_1 db '2',0
    db 60h
    db 9
    db 0FFh
    db 0FFh
    db 2
    db 0
    db 13h
    db 0
aAa7_0 db 'AA-7',0
    db 0
    db 0
    db 0
    db 22h
    db 0
    db 8
    db 7
    db 0FFh
    db 0FFh
    db 2
    db 0
    db 13h
    db 0
aAa9_0 db 'AA-9',0
    db 0
    db 0
    db 0
aR_0 db 'R',0
    db 0D0h
    db 7
    db 0FFh
    db 0FFh
    db 3
    db 0
    db 13h
    db 0
aAa10_0 db 'AA-10',0
    db 0
    db 0
    db 40h
    db 0
    db 0D0h
    db 7
    db 0
    db 0
    db 4
    db 0
    db 13h
    db 0
aEquip_ db 'Equip.',0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1Dh
    db 0
    db 0
    db 0
    db 0Eh
    db 0
    _stru_1892E struc_10 <0, 0>
    struc_10 <2, 0>
    db 6
    db 0
    db 1
    db 0
    db 7
    db 0
    db 3
    db 0
    db 6
    db 0
    db 2
    db 0
    db 5
    db 0
    db 7
    db 0
    db 4
    db 0
    db 2
    db 0
    db 5
    db 0
    db 3
    db 0
    db 8
    db 0
    db 0
    db 0
    db 8
    db 0
    db 0
    db 0
    db 0Ah
    db 0
    db 0Bh
    db 0
    db 0Bh
    db 0
    db 9
    db 0
    db 0Ch
    db 0
    db 0Dh
    db 0
    db 0Ch
    db 0
    db 0Eh
    db 0
    db 0Dh
    db 0
    db 0Eh
    db 0
    db 0Fh
    db 0
    db 0
    db 0
    db 4
    db 0
    db 88h
    db 13h
    db 0
    db 0
    db 0Ch
    db 0
    db 12h
    db 0
    db 3
    db 0
    db 0
    db 0
    db 4
    db 0
    db 1
    db 0
    db 4
    db 0
    db 5
    db 0
    db 6
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 8Ah
    db 2
    db 0
    db 0
_difficultySaved dw 1
    db 1
    db 0
_word_18994 dw 0
    db 0
    db 0
    db 1
    db 0
    db 1
    db 0
    db 4
    db 0
aAim9m db 'AIM-9M',0
    db 0
    db 0
    db 0
aSidewinder db 'Sidewinder',0
    db 0
    db 17h
    db 0
_word_189B6 dw 4
aAim120_0 db 'AIM-120',0
    db 0
    db 0
aAmraam db 'AMRAAM ',0
    db 0
    db 0
    db 0
    db 0
    db 16h
    db 0
    db 4
    db 0
aAgm88a db 'AGM-88A',0
    db 0
    db 0
aHarm_0 db 'HARM',0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 18h
    db 0
    db 4
    db 0
aAim7m db 'AIM-7M',0
    db 0
    db 0
    db 0
aSparrow db 'Sparrow',0
    db 0
    db 0
    db 0
    db 0
    db 16h
    db 0
    db 4
    db 0
aAgm86a db 'AGM-86A',0
    db 0
    db 0
aHarpoon_0 db 'Harpoon',0
    db 0
    db 0
    db 0
    db 0
    db 1Ah
    db 0
    db 1
    db 0
aAgm65d db 'AGM-65D',0
    db 0
    db 0
aMaverick db 'Maverick',0
    db 0
    db 0
    db 0
    db 1Bh
    db 0
    db 6
    db 0
aGbu12 db 'GBU-12',0
    db 0
    db 0
    db 0
aPaveway db 'Paveway',0
    db 0
    db 0
    db 0
    db 0
    db 1Ch
    db 0
    db 8
    db 0
aMk20 db 'Mk 20',0
    db 0
    db 0
    db 0
    db 0
aRockeye db 'Rockeye',0
    db 0
    db 0
    db 0
    db 0
    db 1Dh
    db 0
    db 2
    db 0
aDndl db 'Dndl',0
    db 0
    db 0
    db 0
    db 0
    db 0
aDurandal db 'Durandal',0
    db 0
    db 0
    db 0
    db 1Dh
    db 0
    db 2
    db 0
aMk820 db 'Mk 82-0',0
    db 0
    db 0
aSlick db 'Slick',0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 1Eh
    db 0
    db 3
    db 0
aMk821 db 'Mk 82-1',0
    db 0
    db 0
aSnakeye db 'Snakeye',0
    db 0
    db 0
    db 0
    db 0
    db 1Dh
    db 0
    db 3
    db 0
aMk20_0 db 'Mk 20',0
    db 0
    db 0
    db 0
    db 0
aRockeyeIi db 'Rockeye II',0
    db 0
    db 1Ch
    db 0
    db 4
    db 0
aMk122 db 'Mk 122',0
    db 0
    db 0
    db 0
aFireeye db 'Fireeye',0
    db 0
    db 0
    db 0
    db 0
    db 1Eh
    db 0
    db 2
    db 0
aCbu72 db 'CBU-72',0
    db 0
    db 0
    db 0
aFuelAir db 'Fuel-Air',0
    db 0
    db 0
    db 0
    db 1Ch
    db 0
    db 2
    db 0
aMk35 db 'Mk 35',0
    db 0
    db 0
    db 0
    db 0
aInCluster db 'IN Cluster',0
    db 0
    db 1Dh
    db 0
    db 2
    db 0
aIscB1 db 'ISC B-1',0
    db 0
    db 0
aMinelets db 'Minelets',0
    db 0
    db 0
    db 0
    db 1Dh
    db 0
    db 1
    db 0
a135Mm db '135 mm',0
    db 0
    db 0
    db 0
aCamera db 'Camera',0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0FFh
    db 0FFh
    db 1
    db 0
a1900lbs db '1900lbs',0
    db 0
    db 0
aExtraFuel db 'Extra Fuel',0
    db 0
    db 0FEh
    db 0FFh
    db 1
    db 0
a20Mm db '20 mm',0
    db 0
    db 0
    db 0
    db 0
aGuns db 'Guns',0
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
aSpecial db 'Special',0
    db 0
    db 0
aEquip db 'Equip',0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 26h
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
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
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
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0
    db 0Fh
    db 0
    db 7
    db 0
    _stru_18FC0 struc_9 <4, 1, 2Fh, 0, 0Fh, 7>
    struc_9 <4, 1, 2Fh, 0, 0Fh, 1> ;55 items? routine 4093 counts i = 0; i < 0x38
    struc_9 <3, 1, 3Ah, 0, 0Fh, 6>
    struc_9 <3, 1, 3Ah, 0, 0Fh, 3>
    struc_9 <1, 2, 0, 0, 0Fh, 6>
    struc_9 <2, 2, 0, 0, 0Fh, 6>
    struc_9 <2, 3, 0, 1, 0Fh, 7>
    struc_9 <1, 4, 0, 0, 0Fh, 6>
    struc_9 <2, 4, 0, 0, 0Fh, 1>
    struc_9 <1, 5, 0, 0, 0Fh, 7>
    struc_9 <2, 5, 0, 0, 0Fh, 7>
    struc_9 <1, 6, 0, 9, 0Fh, 4>
    struc_9 <2, 6, 0, 9, 0Fh, 3>
    struc_9 <1, 7, 0, 4, 0Fh, 7>
    struc_9 <2, 7, 0, 4, 0Fh, 7>
    struc_9 <1, 16h, 0, 5, 0Fh, 7>
    struc_9 <2, 16h, 0, 5, 0Fh, 7>
    struc_9 <1, 16h, 0, 6, 0Fh, 7>
    struc_9 <2, 16h, 0, 6, 0Fh, 3>
    struc_9 <1, 16h, 22h, 6, 0Fh, 7>
    struc_9 <2, 16h, 22h, 6, 3, 3>
    struc_9 <1, 17h, 0, 0Bh, 3, 7>
    struc_9 <2, 17h, 2, 0Bh, 0Fh, 1>
    struc_9 <1, 0Ah, 0, 3, 0Fh, 6>
    struc_9 <2, 0Ah, 0, 3, 0Fh, 7>
    struc_9 <1, 0Ch, 0, 7, 3, 7>
    struc_9 <2, 0Ch, 2, 7, 3, 7>
    struc_9 <2, 0Ch, 0, 7, 3, 7>
    struc_9 <1, 0Dh, 0, 1, 3, 7>
    struc_9 <2, 0Dh, 0, 1, 2, 3>
    struc_9 <1, 0Eh, 0, 8, 2, 7>
    struc_9 <2, 0Eh, 0, 8, 3, 3>
    struc_9 <1, 0Fh, 0, 2, 3, 7>
    struc_9 <2, 0Fh, 0, 2, 0Fh, 3>
    struc_9 <1, 10h, 0, 0, 0Fh, 6>
    struc_9 <2, 10h, 0, 0, 0Fh, 3>
    struc_9 <1, 11h, 22h, 0, 3, 7>
    struc_9 <2, 11h, 22h, 0, 0Fh, 3>
    struc_9 <1, 12h, 0, 0, 0Fh, 6>
    struc_9 <2, 12h, 0, 0, 0Fh, 1>
    struc_9 <1, 13h, 0, 0, 0Fh, 7>
    struc_9 <2, 13h, 0, 0, 0Bh, 7>
    struc_9 <1, 9, 0, 0, 0Bh, 7>
    struc_9 <2, 9, 0, 0, 0Ch, 6>
    struc_9 <2, 9, 2, 0, 0Fh, 6>
    struc_9 <1, 14h, 0, 0, 0Fh, 6>
    struc_9 <2, 14h, 0, 0, 0Ch, 6>
    struc_9 <5, 15h, 0, 0, 3, 7>
    struc_9 <5, 15h, 0, 0, 0Ch, 6>
    struc_9 <7, 15h, 0, 0, 3, 3>
    struc_9 <7, 15h, 0, 0, 0Bh, 1>
    struc_9 <7, 15h, 0, 0, 0Fh, 3>
    struc_9 <6, 15h, 0, 0FFF1h, 0Ch, 6>
    struc_9 <8, 15h, 0, 0FFF1h, 0Dh, 6>
    struc_9 <8, 15h, 0, 0FFFBh, 0Fh, 7>
    db 8
    db 0
    db 15h
    db 0
    db 0
    db 0
    db 0FEh
    db 0FFh
_regnPlhPtr dw offset aRegn_xxx
_plhFiles dw offset aLb_xxx
    dw offset aPg_xxx ;"pg.xxx"
off_19262 dw offset aVn_xxx ;"vn.xxx"
    dw offset aMe_xxx ;"me.xxx"
    dw offset aNc_xxx ;"nc.xxx"
    dw offset aCe_xxx ;"ce.xxx"
    dw offset aJp_xxx ;"jp.xxx"
    dw offset aNa_xxx ;"na.xxx"
_worldFiles dw offset aLibya_wld
    dw offset aGulf_wld ;"gulf.wld"
    dw offset aVn_wld ;"vn.wld"
    dw offset aMe_wld ;"me.wld"
    dw offset aNc_wld ;"nc.wld"
    dw offset aCe_wld ;"ce.wld"
    dw offset aJp_wld ;"jp.wld"
    dw offset aNa_wld ;"na.wld"
    dw 5958h
    db 30h
    db 30h
    db 0
    db 0
unk_19284 db 0C0h
    db 3Dh
    db 0C0h
    db 25h
unk_19288 db 0C0h
    db 43h
    db 0C0h
    db 3Bh
unk_1928C db 0C0h
    db 26h
    db 40h
    db 27h
unk_19290 db 40h
    db 21h
    db 0C0h
    db 21h
_word_19294 dw 48C0h
    dw 10C0h
    dw 40C0h
    dw 44C0h
    dw 24C0h
    dw 0EC0h
    dw 12C0h
    dw 50C0h
_word_192A4 dw 2940h
    dw 2140h
    dw 2540h
    dw 2540h
    dw 2140h
    dw 0B40h
    dw 740h
    dw 3540h
asc_192B4 db 0,'/',0,1Bh,0,'=',0
    db 15h
unk_192BC db 0
    db 2Bh
    db 0
    db 13h
    db 0
    db 2Dh
    db 0
    db 35h
unk_192C4 db 0C0h
    db 5Ah
unk_192C6 db 0C0h
    db 3Ah
asc_192C8 db 0,'!',0,9,0
    db 11h
asc_192CE db 0,'#',0,9,0
    db 5
unk_192D4 db 40h
    db 4Dh
    db 40h
    db 4Ch
    db 40h
    db 4Dh
unk_192DA db 40h
    db 39h
    db 0C0h
    db 39h
    db 0C0h
    db 39h
unk_192E0 db 0C0h
    db 45h
    db 40h
    db 3Dh
    db 0C0h
    db 0Dh
unk_192E6 db 0C0h
    db 3Ch
    db 40h
    db 43h
    db 0C0h
    db 24h
_word_192EC dw 3CC0h
    dw 3C40h
    dw 24C0h
    dw 2440h
_word_192F4 dw 4240h
    dw 42C0h
    dw 3A40h
    dw 3AC0h
_byte_192FC db 2
    db 6
    db 5
    db 6
    db 6
    db 6
    db 6
    db 0Bh
_off_19304 dw offset unk_192E0
    dw offset unk_1928C
    dw offset unk_19284
    dw offset asc_192C8 ;"!\t"
    dw offset asc_192B4 ;"/\x1B="
    dw offset unk_192C4
    dw offset _word_19294
    dw offset unk_192D4
_off_19314 dw offset unk_192E6
    dw offset unk_19290
    dw offset unk_19288
    dw offset asc_192CE ;"#\t"
    dw offset unk_192BC
    dw offset unk_192C6
    dw offset _word_192A4
    dw offset unk_192DA
_word_19324 dw 3
    dw 2
    dw 2
    dw 3
    dw 4
    dw 1
    dw 8
    dw 3
    dw 0
_aPowCamp db 'POW Camp',0
_aRb_4 db 'rb',0
_aWb_0 db 'wb',0
_aTd00 db 'TD00',0
_aJz00 db 'JZ00',0
_aXv00 db 'XV00',0
_aEs00 db 'ES00',0
_aWx00 db 'WX00',0
_aCc00 db 'CC00',0
_aHz00 db 'HZ00',0
_aAt db ' at ',0
    db 0
    db 0
_word_19656 dw 0
_word_19658 dw 0
_word_1965A dw 0
_word_1965C dw 0
_word_1965E dw 0
_readBufEndPtr dw 0
_picWorkDataPtr dw 0
_picRowLength dw 0
_picProcessFlag0_1 db 0
_picLookupResult db 0
_picTmp9BitCount db 0
_picByte db 0
_picFileReadBufEnd dw 0
_picNumberDictSlots dw 0
_picFileWord dw 0
_picRemainingBitCount db 0
_picByteUnsignedFlag db 0
_picSlotCounter dw 0
_dictionaryIndex db 0
    db 100h dup(0)
unk_19775 db 0
    db 0
    db 0
unk_19778 db 0
    db 0
byte_1977A db 0FBh dup(0)
_picWorkData db 0
    db 0
    db 0
_picDecodeDictionary dw 0
_picDecodeIncrement db 0
    db 1C1h dup(0)
byte_19A3C db 9Fh dup(0)
_byte_19ADB db 61h dup(0)
byte_19B3C db 180h dup(0)
byte_19CBC db 100h dup(0)
byte_19DBC db 12BCh dup(0)
byte_1B078 db 0
byte_1B079 db 0
word_1B07A dw 0
word_1B07C dw 0
byte_1B07E db 0
byte_1B07F db 0
    db 40h dup(0)
word_1B0C0 dw 0
word_1B0C2 dw 0
word_1B0C4 dw 0
byte_1B0C6 db 0
    db 0
_flag4Saved dw 0
_theaterSaved dw 0
_moveDst dd 0
_bufCoordStr db 0
_byte_1B0D1 db 0
_byte_1B0D2 db 0
_byte_1B0D3 db 0
    db 0
    db 0
;  ==============================================================================

.DATA?
    db ?
_todayMissStrBuf db 1Dh dup(?)
_byte_1B0FF db ?
_byte_1B100 db ?
    db 47h dup(?)
_word_1B148 dw ?
_iacaSuFlag0Ptr dd ?
    db ?
    db ?
_fileHandle dw ?
    db ?
    db ?
_gameData dd ?
_wldReadBuf2 dw ?
byte_1B15A db ?
    db ?
_gridBuf5 db 200h dup(?)
    db ?
    db ?
_gridBuf4 db 200h dup(?)
_page1Ptr dw ?
_gridBuf3 db 200h dup(?)
_word_1B960 dw ?
_gridBuf2 db 100h dup(?)
_terrainBuf3 db ?
    db ?
_terrainBuf4 db ?
    db ?
_terrainBuf5 db ?
    db ?
_terrainIdxBuf db 0DA6h dup(?)
_wldReadBuf1 db ?
    db ?
_gridBuf1 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_scenarioFoundArr db ?
byte_1C822 db ?
byte_1C823 db ?
byte_1C824 db ?
byte_1C825 db ?
byte_1C826 db ?
    db ?
    _wldReadBuf4 Buf4Item 4Bh dup(<?>)
    db ?
    db ?
_wldReadBuf10 db 100h dup( ?)
_needSplash dd ?
    _targets Target <?>
    _target2 Target <?>
    db 208h dup(?)
_word_1D00A dw ?
    _wldReadBuf6 Buf6Item 13h dup(<?>)
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_hercFlag db ?
byte_1D2DD db 0F3h dup(?)
_dword_1D5D0 dd ?
_word_1D5D4 dw ?
_word_1D5D6 dw ?
_dword_1D5D8 dd ?
_dword_1D5DC dd ?
_word_1D5E0 dw ?
_byte_1D5E2 db ?
_byte_1D5E3 db ?
_byte_1D5E4 db ?
_byte_1D5E5 db ?
    db 4 dup(?)
_exitCode db ?
    db ?
_wldReadBuf9 db 64h dup( ?)
_dword_1D650 dd ?
byte_1D654 db 572h dup(?)
byte_1DBC6 db 76h dup(?)
byte_1DC3C db 22h dup(?)
_readItemSize dw ?
_wldReadBuf8 db 64h dup( ?)
    db ?
    db ?
_intRegs db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
unk_1DCD2 db ?
    db ?
_wldReadBuf7 db 64h dup( ?)
_word_1DD38 dw ?
    db ?
    db ?
_selectedPilotIdx dw ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_wldReadBuf5Size dw ?
    db ?
    db ?
_joyDone db ?
    db ?
    db ?
    db ?
_wldOffsets dw 64h dup(?)
_wldReadBuf11 db 2EEh dup( ?)
    db ?
    db ?
    _terrainPtrUnk TerrainUnk 5 dup(<?>)
_word_1E24A dw ?
byte_1E24C db 0F0h dup(?)
_wldReadBuf3 dw ?
    db ?
    db ?
    db ?
    db ?
_commData dd ?
    _hallfameBuf Pilot 8 dup(<?>)
    db ?
    db ?
    db ?
    db ?
_menuSprites dw ?
    db 14h dup(?)
END
