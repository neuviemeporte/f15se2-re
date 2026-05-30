.8086
DOSSEG
.MODEL SMALL

PUBLIC _gfx_allocPage
PUBLIC _gfx_drawString
PUBLIC _gfx_setPageN
PUBLIC _gfx_blitSprite
PUBLIC _gfx_getBufSize
PUBLIC _gfx_setColor
PUBLIC _gfx_switchColor
PUBLIC _gfx_copyRect
PUBLIC _gfx_setFont
PUBLIC _gfx_getAuxBufSize
PUBLIC _gfx_setFadeSteps
PUBLIC _gfx_setDac
PUBLIC _gfx_waitRetrace
PUBLIC _gfx_flipPage
PUBLIC _gfx_storeBufPtr
PUBLIC _gfx_commitPage
PUBLIC _gfx_setMonoFlag
PUBLIC _gfx_getCurPage
PUBLIC _gfx_setOvlVal1
PUBLIC _gfx_setOvlVal2
PUBLIC _gfx_setBlitOffset
PUBLIC _gfx_calcRowAddr
PUBLIC _gfx_resetBlitOffset2
PUBLIC _misc_jump_5a_keybuf
PUBLIC _misc_jump_5b_getkey
PUBLIC _misc_jump_5d_readJoy
PUBLIC _misc_jump_5e_clearKeyFlags
PUBLIC _spriteAirBlink
PUBLIC _spriteSamBlink
PUBLIC _spriteGroundBlink
PUBLIC _spriteWaypointBlink
PUBLIC _awardColor
PUBLIC _awardFont
PUBLIC _awardPage
PUBLIC _clearRectHeight
PUBLIC _clearRectWidth
PUBLIC _clearRectX
PUBLIC _clearRectY
PUBLIC _clipDivZeroHandler
PUBLIC _clipDx
PUBLIC _clipDxHalf
PUBLIC _clipDy
PUBLIC _clipDyHalf
PUBLIC _clipMaxX
PUBLIC _clipMaxY
PUBLIC _clipOutcode
PUBLIC _commData
PUBLIC _commData_seg
PUBLIC _dat_0042
PUBLIC _dat_1580
PUBLIC _dat_231c
PUBLIC _dat_4034
PUBLIC _dat_4040
PUBLIC _dat_4246
PUBLIC _dat_4a2a
PUBLIC _dat_5512
PUBLIC _dat_55de
PUBLIC _dat_5ab4
PUBLIC _dirtyMaxBuf
PUBLIC _dirtyMinBuf
PUBLIC _dirtyRectMax
PUBLIC _dirtyRectMin
PUBLIC _errorCodeStr
PUBLIC _fileReadBuf
PUBLIC _fileReadPos
PUBLIC _gameData
PUBLIC _gfxBufSeg
PUBLIC _joyAxisX
PUBLIC _joyAxisY
PUBLIC _joyCenterValues
PUBLIC _joyMaxValues
PUBLIC _joyMinValues
PUBLIC _joyRangeAbove
PUBLIC _joyRangeBelow
PUBLIC _joyRawAxis0
PUBLIC _joyRawAxis1
PUBLIC _lineX1
PUBLIC _lineX2
PUBLIC _lineY1
PUBLIC _lineY2
PUBLIC _medalScores
PUBLIC _medalThresholds
PUBLIC _nightMission
PUBLIC _origCBreakOfs
PUBLIC _origCBreakSeg
PUBLIC _ovlInsaneFlag
PUBLIC _pageStruct
PUBLIC _pageStruct2
PUBLIC _pageStruct3
PUBLIC _picByte
PUBLIC _picByteUnsignedFlag
PUBLIC _picDecodeDictionary
PUBLIC _picDecodeIncrement
PUBLIC _picDecodedRowBuf
PUBLIC _picDictionaryIndex
PUBLIC _picFileReadBufEnd
PUBLIC _picFileWord
PUBLIC _picLookupResult
PUBLIC _picNumberDictSlots
PUBLIC _picPageIndex
PUBLIC _picProcessFlag
PUBLIC _picReadBufEndPtr
PUBLIC _picReadFromFilePtr
PUBLIC _picRemainingBitCount
PUBLIC _picRow
PUBLIC _picRowLength
PUBLIC _picRowOffset
PUBLIC _picScreenBufSize
PUBLIC _picSlotCounter
PUBLIC _picTmp9BitCount
PUBLIC _picWorkDataPtr
PUBLIC _promoScores
PUBLIC _promoThresholds
PUBLIC _quitFlag
PUBLIC _randSeed
PUBLIC _randState
PUBLIC _planeArray
PUBLIC _samDataTable
PUBLIC _samWeaponTable
PUBLIC _spriteAir
PUBLIC _spriteGround
PUBLIC _spriteSam
PUBLIC _spriteWaypoint
PUBLIC _timerCalSumHi
PUBLIC _timerCalSumLo
PUBLIC _timerCountHi
PUBLIC _timerCountLo
PUBLIC _timerCounter
PUBLIC _timerCounter2
PUBLIC _timerCounter3
PUBLIC _timerDivider
PUBLIC _timerDivisor
PUBLIC _timerHandlerInstalled
PUBLIC _timerMode
PUBLIC _timerReload
PUBLIC _timerSyncRetrace
PUBLIC _timerTarget
PUBLIC _timerTick
PUBLIC _tmpFileHandle
PUBLIC _var_100
PUBLIC _var_101
PUBLIC _var_102
PUBLIC _var_103
PUBLIC _var_104
PUBLIC _var_105
PUBLIC _var_106
PUBLIC _var_107
PUBLIC _var_108
PUBLIC _var_109
PUBLIC _var_110
PUBLIC _var_111
PUBLIC _var_112
PUBLIC _var_113
PUBLIC _var_114
PUBLIC _var_115
PUBLIC _var_116
PUBLIC _var_117
PUBLIC _var_118
PUBLIC _var_119
PUBLIC _var_120
PUBLIC _var_121
PUBLIC _var_122
PUBLIC _var_125
PUBLIC _var_129
PUBLIC _var_130
PUBLIC _var_131
PUBLIC _var_151
PUBLIC _var_152
PUBLIC _var_179
PUBLIC _var_180
PUBLIC _var_203
PUBLIC _var_205
PUBLIC _var_216
PUBLIC _var_3f72
PUBLIC _var_41
PUBLIC _var_43
PUBLIC _var_61
PUBLIC _var_99
PUBLIC _var_timerFlag
; Overlay jump table proc labels (non-underscored)
PUBLIC gfx_allocPage
PUBLIC gfx_drawString
PUBLIC gfx_setPage1
PUBLIC gfx_setPageN
PUBLIC gfx_getCurPageSeg
PUBLIC gfx_getCurPageSeg2
PUBLIC gfx_blitSprite
PUBLIC gfx_getBufSize
PUBLIC gfx_setBlitOffset
PUBLIC gfx_drawLine
PUBLIC gfx_setPageDirect
PUBLIC gfx_setColor
PUBLIC gfx_resetBlitOffset
PUBLIC gfx_resetBlitOffset2
PUBLIC gfx_dirtyRect2
PUBLIC gfx_switchColor
PUBLIC gfx_copyRect
PUBLIC gfx_setFont
PUBLIC gfx_getAuxBufSize
PUBLIC gfx_fillRow
PUBLIC gfx_fillRow2
PUBLIC gfx_copyRow
PUBLIC gfx_nop36
PUBLIC gfx_getPageSeg
PUBLIC gfx_getRowOffset
PUBLIC gfx_clearPage
PUBLIC gfx_setFadeSteps
PUBLIC gfx_calcRowAddr
PUBLIC gfx_setOvlVal1
PUBLIC gfx_setOvlVal2
PUBLIC gfx_setDac
PUBLIC gfx_waitRetrace
PUBLIC gfx_flipPage
PUBLIC gfx_storeBufPtr
PUBLIC gfx_commitPage
PUBLIC gfx_nop51
PUBLIC gfx_setMonoFlag
PUBLIC gfx_getCurPage
PUBLIC misc_jump_5a_keybuf
PUBLIC misc_jump_5b_getkey
PUBLIC misc_jump_5d_readJoy
PUBLIC misc_jump_5e_clearKeyFlags
PUBLIC thunk_EXT_FUN_0000

.DATA
; --- Data segment ---
EXTRN _missionScore:BYTE
EXTRN _missionScoreHi:BYTE
EXTRN _ejectedFlag:BYTE
EXTRN _worldBufHandle:BYTE
EXTRN _spriteBufSeg:BYTE
EXTRN _curRecordIdx:BYTE
EXTRN _var_192:BYTE
PUBLIC _var_193
PUBLIC _flightRecords
PUBLIC _timerTickCnt
PUBLIC _timerRetrace
PUBLIC _timerCounter4
PUBLIC dat_1868
PUBLIC dat_186A
PUBLIC dat_21e4
PUBLIC _dat_21e4
PUBLIC dat_2769
PUBLIC dat_3F6A
PUBLIC dat_3F6B
PUBLIC dat_3F6C
PUBLIC dat_3F6E
PUBLIC dat_3F70
PUBLIC dat_3F71
PUBLIC dat_3FB2
PUBLIC dat_3FB4
PUBLIC dat_3FB6
PUBLIC dat_3FB8
PUBLIC str_overlayRelError
PUBLIC str_fileNotFound
PUBLIC str_noFileBufs
PUBLIC str_openError
PUBLIC str_fileCloseError
PUBLIC str_readError
PUBLIC str_writeError


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
_dat_0042 label byte
dat_0042 db 20 dup(0)                                                        ; header/padding
    db 'None',    000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h ; None
    db 'SA-2',    000h, 000h, 000h, 000h, 0C8h, 000h, 003h, 000h, 000h, 000h ; SA-2
    db 'SA-5',    000h, 000h, 000h, 000h, 05Eh, 001h, 002h, 000h, 000h, 000h ; SA-5
    db 'SA-8B',   000h, 000h, 000h, 07Dh, 000h, 005h, 000h, 000h, 000h       ; SA-8B
    db 'SA-10',   000h, 000h, 000h, 040h, 001h, 007h, 000h, 001h, 000h       ; SA-10
    db 'SA-11',   000h, 000h, 000h, 0C8h, 000h, 005h, 000h, 000h, 000h       ; SA-11
    db 'SA-12',   000h, 000h, 000h, 022h, 001h, 006h, 000h, 001h, 000h       ; SA-12
    db 'SA-13',   000h, 000h, 000h, 07Dh, 000h, 003h, 000h, 000h, 000h       ; SA-13
    db 'SA-N-4',  000h, 000h, 0C8h, 000h, 004h, 000h, 001h, 000h             ; SA-N-4
    db 'SA-N-5',  000h, 000h, 096h, 000h, 003h, 000h, 000h, 000h             ; SA-N-5
    db 'SA-N-6',  000h, 000h, 040h, 001h, 006h, 000h, 001h, 000h             ; SA-N-6
    db 'SA-N-7',  000h, 000h, 0C8h, 000h, 005h, 000h, 000h, 000h             ; SA-N-7
    db 'Hawk',    000h, 000h, 000h, 000h, 0AFh, 000h, 006h, 000h, 001h, 000h ; Hawk
    db 'Rapier',  000h, 000h, 04Bh, 000h, 008h, 000h, 000h, 000h             ; Rapier
    db 'Tiger',   000h, 000h, 000h, 041h, 000h, 004h, 000h, 000h, 000h       ; Tiger
    db 'Seacat',  000h, 000h, 0C8h, 000h, 002h, 000h, 000h, 000h             ; Seacat
    db 'IL76',    000h, 000h, 000h, 000h, 0C8h, 000h, 008h, 000h, 003h, 000h ; IL76
    db 8 dup(0),  032h, 000h, 005h, 000h, 000h, 000h                          ; (unnamed)
    db 8 dup(0),  046h, 000h, 006h, 000h, 000h, 000h                          ; (unnamed)
    db 8 dup(0),  050h, 000h, 007h, 000h, 001h, 000h                          ; (unnamed)
    db 8 dup(0),  064h, 000h, 008h, 000h, 001h, 000h                          ; (unnamed)
    db 'OTH',    000h, 000h, 000h, 000h, 000h, 0F4h, 001h, 005h, 000h, 001h, 000h ; OTH
    db 8 dup(0),  028h, 000h, 003h, 000h, 000h, 000h                          ; (unnamed)
_planeArray label byte
    db 'MIG-23', 000h, 020h, 'Flogger', 000h, 000h, 000h, 0E4h, 002h, 030h, 002h, 003h, 000h ; MIG-23 Flogger
_samDataTable db 011h, 000h, 00Ah, 000h, 002h, 000h, 000h, 000h, 04Dh, 049h, 047h, 02Dh, 032h, 035h, 000h, 020h, 046h, 06Fh, 078h, 062h, 061h, 074h, 000h, 000h, 000h, 000h, 03Ah, 002h, 0BCh, 002h, 002h, 000h ; MIG-25 Foxbat
    db 012h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 04Dh, 049h, 047h, 02Dh, 032h, 039h, 000h, 020h, 046h, 075h, 06Ch, 063h, 072h, 075h, 06Dh, 000h, 000h, 000h, 0BCh, 002h, 090h, 001h, 005h, 000h ; MIG-29 Fulcrum
    db 013h, 000h, 014h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 031h, 000h, 000h, 000h, 000h, 020h, 04Dh, 069h, 072h, 061h, 067h, 065h, 000h, 000h, 000h, 000h, 016h, 003h, 0A2h, 003h, 003h, 000h ; F-1 Mirage
    db 014h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 053h, 075h, 02Dh, 032h, 037h, 000h, 000h, 020h, 046h, 06Ch, 061h, 06Eh, 06Bh, 065h, 072h, 000h, 000h, 000h, 0D5h, 002h, 0CBh, 002h, 004h, 000h ; Su-27 Flanker
    db 013h, 000h, 014h, 000h, 002h, 000h, 000h, 000h, 049h, 04Ch, 02Dh, 037h, 036h, 000h, 000h, 020h, 04Dh, 061h, 069h, 06Eh, 073h, 074h, 061h, 079h, 000h, 000h, 090h, 001h, 0A0h, 00Fh, 001h, 000h ; IL-76 Mainstay
    db 010h, 000h, 00Ch, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 034h, 045h, 000h, 000h, 000h, 020h, 050h, 068h, 061h, 06Eh, 074h, 06Fh, 06Dh, 000h, 000h, 000h, 020h, 003h, 008h, 002h, 004h, 000h ; F-4E Phantom
    db 012h, 000h, 00Bh, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 031h, 034h, 000h, 000h, 000h, 020h, 054h, 06Fh, 06Dh, 063h, 061h, 074h, 000h, 000h, 000h, 000h, 020h, 003h, 020h, 003h, 004h, 000h ; F-14 Tomcat
    db 013h, 000h, 008h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 031h, 038h, 000h, 000h, 000h, 020h, 048h, 06Fh, 072h, 06Eh, 065h, 074h, 000h, 000h, 000h, 000h, 094h, 002h, 0CDh, 001h, 005h, 000h ; F-18 Hornet
    db 0FFh, 0FFh, 000h, 000h, 002h, 000h, 000h, 000h, 041h, 06Eh, 02Dh, 037h, 032h, 000h, 000h, 020h, 043h, 06Fh, 061h, 06Ch, 065h, 072h, 000h, 000h, 000h, 000h, 05Eh, 001h, 06Ch, 002h, 002h, 000h ; An-72 Coaler
    db 000h, 000h, 009h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 031h, 038h, 000h, 000h, 000h, 020h, 048h, 06Fh, 072h, 06Eh, 065h, 074h, 000h, 000h, 000h, 000h, 094h, 002h, 0CDh, 001h, 005h, 000h ; F-18 Hornet
    db 0FFh, 0FFh, 004h, 000h, 002h, 000h, 000h, 000h, 04Dh, 049h, 047h, 02Dh, 032h, 033h, 000h, 020h, 046h, 06Ch, 06Fh, 067h, 067h, 065h, 072h, 000h, 000h, 000h, 0E4h, 002h, 030h, 002h, 003h, 000h ; MIG-23 Flogger
    db 000h, 000h, 004h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 031h, 034h, 000h, 000h, 000h, 020h, 054h, 06Fh, 06Dh, 063h, 061h, 074h, 000h, 000h, 000h, 000h, 020h, 003h, 020h, 003h, 004h, 000h ; F-14 Tomcat
    db 0FFh, 0FFh, 008h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 034h, 045h, 000h, 000h, 000h, 020h, 050h, 068h, 061h, 06Eh, 074h, 06Fh, 06Dh, 000h, 000h, 000h, 020h, 003h, 008h, 002h, 004h, 000h ; F-4E Phantom
    db 0FFh, 0FFh, 00Bh, 000h, 002h, 000h, 000h, 000h, 04Dh, 049h, 047h, 02Dh, 031h, 037h, 000h, 020h, 046h, 072h, 065h, 073h, 063h, 06Fh, 000h, 000h, 000h, 000h, 026h, 002h, 02Ch, 001h, 003h, 000h ; MIG-17 Fresco
    db 011h, 000h, 010h, 000h, 002h, 000h, 000h, 000h, 054h, 075h, 02Dh, 039h, 035h, 000h, 000h, 020h, 042h, 065h, 061h, 072h, 000h, 000h, 000h, 000h, 000h, 000h, 09Ah, 001h, 0ECh, 013h, 001h, 000h ; Tu-95 Bear
    db 000h, 000h, 012h, 000h, 002h, 000h, 000h, 000h, 04Dh, 069h, 02Dh, 032h, 034h, 000h, 000h, 020h, 048h, 069h, 06Eh, 064h, 000h, 000h, 000h, 000h, 000h, 000h, 0C8h, 000h, 02Ch, 001h, 001h, 000h ; Mi-24 Hind
    db 011h, 000h, 013h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 035h, 000h, 000h, 000h, 000h, 020h, 054h, 069h, 067h, 065h, 072h, 000h, 000h, 000h, 000h, 000h, 0F4h, 001h, 0FAh, 000h, 003h, 000h ; F-5 Tiger
    db 016h, 000h, 016h, 000h, 002h, 000h, 000h, 000h, 037h, 036h, 037h, 000h, 000h, 000h, 000h, 020h, 042h, 06Fh, 065h, 069h, 06Eh, 067h, 000h, 000h, 000h, 000h, 090h, 001h, 0E8h, 003h, 001h, 000h ; 767 Boeing
    db 0FFh
    db 0FFh, 012h, 000h, 002h, 000h, 000h, 000h
_samWeaponTable label byte
    db 'None', 000h, 000h, 000h, 000h, 000h ; None
    db 000h, 000h, 000h, 000h, 000h, 001h, 000h, 013h, 000h, 'SA-2', 000h, 000h, 000h, 000h, 07Dh, 000h, 0D0h, 007h, 001h, 000h ; SA-2
    db 004h, 000h, 013h, 000h, 'SA-5', 000h, 000h, 000h, 000h, 096h, 000h, 008h, 007h, 001h, 000h ; SA-5
    db 001h, 000h, 013h, 000h, 'SA-8B', 000h, 000h, 000h, 041h, 000h, 0B0h, 004h, 002h, 000h ; SA-8B
    db 003h, 000h, 013h, 000h, 'SA-10', 000h, 000h, 000h, 07Dh, 000h, 008h, 007h, 003h, 000h ; SA-10
    db 002h, 000h, 013h, 000h, 'SA-11', 000h, 000h, 000h, 064h, 000h, 0DCh, 005h, 002h, 000h ; SA-11
    db 003h, 000h, 013h, 000h, 'SA-12', 000h, 000h, 000h, 096h, 000h, 0D0h, 007h, 003h, 000h ; SA-12
    db 002h, 000h, 013h, 000h, 'SA-13', 000h, 000h, 000h, 041h, 000h, 084h, 003h, 000h, 000h ; SA-13
    db 004h, 000h, 013h, 000h, 'SA-N-4', 000h, 000h, 01Eh, 000h, 0B0h, 004h, 002h, 000h ; SA-N-4
    db 003h, 000h, 013h, 000h, 'SA-N-5', 000h, 000h, 01Eh, 000h, 084h, 003h, 0FFh, 0FFh ; SA-N-5
    db 004h, 000h, 013h, 000h, 'SA-N-6', 000h, 000h, 07Dh, 000h, 008h, 007h, 003h, 000h ; SA-N-6
    db 002h, 000h, 013h, 000h, 'SA-N-7', 000h, 000h, 064h, 000h, 0DCh, 005h, 002h, 000h ; SA-N-7
    db 003h, 000h, 013h, 000h, 'Hawk', 000h, 000h, 000h, 000h, 07Dh, 000h, 084h, 003h, 002h, 000h ; Hawk
    db 003h, 000h, 013h, 000h, 'Rapier', 000h, 000h, 041h, 000h, 0B0h, 004h, 002h, 000h ; Rapier
    db 004h, 000h, 013h, 000h, 'Tiger', 000h, 000h, 000h, 01Eh, 000h, 084h, 003h, 001h, 000h ; Tiger
    db 003h, 000h, 013h, 000h, 'Seacat', 000h, 000h, 01Eh, 000h, 084h, 003h, 001h, 000h ; Seacat
    db 003h, 000h, 013h, 000h, 'AA-2', 000h, 000h, 000h, 000h, 00Eh, 000h, 0DCh, 005h, 0FFh, 0FFh ; AA-2
    db 004h, 000h, 013h, 000h, 'AA-8', 000h, 000h, 000h, 000h, 00Ch, 000h, 008h, 007h, 000h, 000h ; AA-8
    db 005h, 000h, 013h, 000h, 'AA-6', 000h, 000h, 000h, 000h, 032h, 000h, 060h, 009h, 002h, 000h ; AA-6
    db 002h, 000h, 013h, 000h, 'AA-7', 000h, 000h, 000h, 000h, 022h, 000h, 008h, 007h, 002h, 000h ; AA-7
    db 002h, 000h, 013h, 000h, 'AA-9', 000h, 000h, 000h, 000h, 052h, 000h, 0D0h, 007h, 002h, 000h ; AA-9
    db 003h, 000h, 013h, 000h, 'AA-10', 000h, 000h, 000h, 040h, 000h, 0D0h, 007h, 003h, 000h ; AA-10
    db 004h, 000h, 013h, 000h, 'AIM120', 000h, 000h, 020h, 000h, 060h, 009h, 007h, 000h ; AIM120
    db 004h, 000h, 001h, 000h, 'AIM-9', 000h, 000h, 000h, 011h, 000h, 0D0h, 007h, 007h, 000h ; AIM-9
    db 008h, 000h, 001h, 000h, 'HARM', 000h, 000h, 000h, 000h, 014h, 000h, 0B0h, 004h, 004h, 000h ; HARM
    db 002h, 000h, 001h, 000h, 'Penguin', 000h, 020h, 000h, 0F4h, 001h, 005h, 000h ; Penguin
    db 002h, 000h, 013h, 000h, 'Harpoon', 000h, 03Ch, 000h, 0F4h, 001h, 005h, 000h ; Harpoon
    db 002h, 000h, 013h, 000h, 'AGM-65', 000h, 000h, 020h, 000h, 020h, 003h, 006h, 000h ; AGM-65
    db 002h, 000h, 00Dh, 000h, 'LGBOMB', 000h, 000h, 00Ah, 000h, 000h, 000h, 01Ch, 000h ; LGBOMB
    db 002h, 000h, 00Fh, 000h, 'RTBOMB', 000h, 000h, 000h, 000h, 000h, 000h, 01Dh, 000h ; RTBOMB
    db 002h, 000h, 00Fh, 000h, 'FFBOMB', 000h, 000h, 000h, 000h, 000h, 000h, 01Eh, 000h ; FFBOMB
    db 002h, 000h, 00Fh, 000h, 'AIM-7W', 000h, 000h, 02Ch, 000h, 060h, 009h, 002h, 000h ; AIM-7W
    db 004h, 000h, 001h, 000h, 'AIM-9W', 000h, 000h, 00Ch, 000h, 0D0h, 007h, 000h, 000h ; AIM-9W
    db 005h, 000h, 001h, 000h, 'SA-14', 000h, 000h, 000h, 010h, 000h, 084h, 003h, 000h, 000h ; SA-14
    db 005h, 000h, 001h, 000h, 'AA-6', 000h, 000h, 000h, 000h, 032h, 000h, 060h, 009h, 0FFh, 0FFh ; AA-6
    db 002h, 000h, 013h, 000h, 'AA-7', 000h, 000h, 000h, 000h, 022h, 000h, 008h, 007h, 0FFh, 0FFh ; AA-7
    db 002h, 000h, 013h, 000h, 'AA-9', 000h, 000h, 000h, 000h, 052h, 000h, 0D0h, 007h, 0FFh, 0FFh ; AA-9
    db 003h, 000h, 013h, 000h, 'AA-10', 000h, 000h, 000h, 040h, 000h, 0D0h, 007h, 000h, 000h ; AA-10
    db 004h, 000h, 013h, 000h, 'Equip.', 000h, 000h, 000h, 000h, 000h, 000h, 01Dh ; Equip.
    db 000h, 000h, 000h, 00Eh, 000h, 000h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 006h, 000h, 001h
    db 000h, 007h, 000h, 003h, 000h, 006h, 000h, 002h, 000h, 005h, 000h, 007h, 000h, 004h, 000h, 002h
    db 000h, 005h, 000h, 003h, 000h, 008h, 000h, 000h, 000h, 008h, 000h, 000h, 000h, 00Ah, 000h, 00Bh
    db 000h, 00Bh, 000h, 009h, 000h, 00Ch, 000h, 00Dh, 000h, 00Ch, 000h, 00Eh, 000h, 00Dh, 000h, 00Eh
    db 000h, 00Fh, 000h, 000h, 000h, 004h, 000h, 088h, 013h, 000h, 000h, 00Ch, 000h, 012h, 000h, 003h
    db 000h, 001h, 000h, 003h, 000h, 010h, 000h, 001h, 000h, 005h, 000h, 003h, 000h, 009h, 000h, 003h
    db 000h, 000h, 000h, 08Ah, 002h, 000h, 000h, 001h, 000h, 001h, 000h
_nightMission db 001h
    db 000h, 000h, 000h, 001h, 000h, 001h, 000h, 004h, 000h, 'AIM-9M', 000h, 000h, 000h, 000h, 'Sidewinder', 000h, 000h ; AIM-9M / Sidewinder
    db 017h, 000h, 004h, 000h, 'AIM-120', 000h, 000h, 000h, 'AMRAAM', 000h, 000h, 000h, 000h, 000h, 000h ; AIM-120 / AMRAAM
    db 016h, 000h, 003h, 000h, 'AGM-88A', 000h, 000h, 000h, 'HARM', 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h ; AGM-88A / HARM
    db 018h, 000h, 001h, 000h, 'P3 ASM', 000h, 000h, 000h, 000h, 'Penguin', 000h, 000h, 000h, 000h, 000h ; P3 ASM / Penguin
    db 019h, 000h, 002h, 000h, 'AGM-86A', 000h, 000h, 000h, 'Harpoon', 000h, 000h, 000h, 000h, 000h ; AGM-86A / Harpoon
    db 01Ah, 000h, 001h, 000h, 'AGM-65D', 000h, 000h, 000h, 'Maverick', 000h, 000h, 000h, 000h ; AGM-65D / Maverick
    db 01Bh, 000h, 002h, 000h, 'GBU-12', 000h, 000h, 000h, 000h, 'Paveway', 000h, 000h, 000h, 000h, 000h ; GBU-12 / Paveway
    db 01Ch, 000h, 002h, 000h, 'Mk 20', 000h, 000h, 000h, 000h, 000h, 'Rockeye', 000h, 000h, 000h, 000h, 000h ; Mk 20 / Rockeye
    db 01Dh, 000h, 002h, 000h, 'Dndl', 000h, 000h, 000h, 000h, 000h, 000h, 'Durandal', 000h, 000h, 000h, 000h ; Dndl / Durandal
    db 01Dh, 000h, 002h, 000h, 'Mk 82-0', 000h, 000h, 000h, 'Slick', 000h, 000h, 000h, 000h, 000h, 000h, 000h ; Mk 82-0 / Slick
    db 01Eh, 000h, 003h, 000h, 'Mk 82-1', 000h, 000h, 000h, 'Snakeye', 000h, 000h, 000h, 000h, 000h ; Mk 82-1 / Snakeye
    db 01Dh, 000h, 003h, 000h, 'Mk 20', 000h, 000h, 000h, 000h, 000h, 'Rockeye II', 000h, 000h ; Mk 20 / Rockeye II
    db 01Ch, 000h, 002h, 000h, 'Mk 122', 000h, 000h, 000h, 000h, 'Fireeye', 000h, 000h, 000h, 000h, 000h ; Mk 122 / Fireeye
    db 01Eh, 000h, 002h, 000h, 'CBU-72', 000h, 000h, 000h, 000h, 'Fuel-Air', 000h, 000h, 000h, 000h ; CBU-72 / Fuel-Air
    db 01Ch, 000h, 002h, 000h, 'Mk 35', 000h, 000h, 000h, 000h, 000h, 'IN Cluster', 000h, 000h ; Mk 35 / IN Cluster
    db 01Dh, 000h, 002h, 000h, 'ISC B-1', 000h, 000h, 000h, 'Minelets', 000h, 000h, 000h, 000h ; ISC B-1 / Minelets
    db 01Dh, 000h, 001h, 000h, '135 mm', 000h, 000h, 000h, 000h, 'Camera', 000h, 000h, 000h, 000h, 000h, 000h, 0FFh ; 135 mm / Camera
    db 0FFh, 001h, 000h, '1900lbs', 000h, 000h, 000h, 'Extra Fuel', 000h, 000h ; 1900lbs / Extra Fuel
    db 0FEh, 0FFh, 001h, 000h, '20 mm', 000h, 000h, 000h, 000h, 000h, 'Guns', 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h ; 20 mm / Guns
    db 000h, 000h, 001h, 000h, 'Special', 000h, 000h, 000h, 'Equip', 000h, 000h, 000h, 000h, 000h, 000h, 000h ; Special / Equip
    db 026h, 000h, 001h
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
    db 002h, 004h, 004h, 003h, 004h, 005h, 000h, 003h
    db 127 dup(0)
    db 003h, 000h, 003h, 000h, 002h, 000h, 001h, 000h, 000h
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
    db 0FFh, 0FEh, 0FFh, 0FDh, 0FFh, 0FFh, 0FFh
    db 288 dup(0)
    db 00Fh, 000h, 007h, 000h, 004h, 000h, 001h, 000h, 02Fh
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
_ovlInsaneFlag db 000h
str_overlayRelError db 'Error releasing overlay memory$'
gfx_allocPage proc far               ; 0x1008
    db 0EAh
    dd 0
gfx_allocPage endp
_gfx_allocPage equ gfx_allocPage
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_drawString proc far               ; 0x1021
    db 0EAh
    dd 0
gfx_drawString endp
_gfx_drawString equ gfx_drawString
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h
    db 000h, 000h, 000h
gfx_setPage1 proc far               ; 0x1049
    db 0EAh
    dd 0
gfx_setPage1 endp
gfx_setPageN proc far               ; 0x104E
    db 0EAh
    dd 0
gfx_setPageN endp
_gfx_setPageN equ gfx_setPageN
gfx_getCurPageSeg proc far               ; 0x1053
    db 0EAh
    dd 0
gfx_getCurPageSeg endp
gfx_getCurPageSeg2 proc far               ; 0x1058
    db 0EAh
    dd 0
gfx_getCurPageSeg2 endp
gfx_blitSprite proc far               ; 0x105D
    db 0EAh
    dd 0
gfx_blitSprite endp
_gfx_blitSprite equ gfx_blitSprite
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h
gfx_getBufSize proc far               ; 0x107B
    db 0EAh
    dd 0
gfx_getBufSize endp
_gfx_getBufSize equ gfx_getBufSize
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h
gfx_setBlitOffset proc far               ; 0x108A
    db 0EAh
    dd 0
gfx_setBlitOffset endp
_gfx_setBlitOffset equ gfx_setBlitOffset
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_drawLine proc far               ; 0x10A3
    db 0EAh
    dd 0
gfx_drawLine endp
gfx_setPageDirect proc far               ; 0x10A8
    db 0EAh
    dd 0
gfx_setPageDirect endp
gfx_setColor proc far               ; 0x10AD
    db 0EAh
    dd 0
gfx_setColor endp
_gfx_setColor equ gfx_setColor
gfx_resetBlitOffset proc far               ; 0x10B2
    db 0EAh
    dd 0
gfx_resetBlitOffset endp
gfx_resetBlitOffset2 proc far               ; 0x10B7
    db 0EAh
    dd 0
gfx_resetBlitOffset2 endp
_gfx_resetBlitOffset2 equ gfx_resetBlitOffset2
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_dirtyRect2 proc far               ; 0x10D0
    db 0EAh
    dd 0
gfx_dirtyRect2 endp
gfx_switchColor proc far
    db 0EAh
    dd 0
gfx_switchColor endp
_gfx_switchColor equ gfx_switchColor
gfx_copyRect proc far               ; 0x10DA
    db 0EAh
    dd 0
gfx_copyRect endp
_gfx_copyRect equ gfx_copyRect
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_setFont proc far               ; 0x10F3
    db 0EAh
    dd 0
gfx_setFont endp
_gfx_setFont equ gfx_setFont
    db 0EAh, 000h, 000h, 000h, 000h
gfx_getAuxBufSize proc far               ; 0x10FD
    db 0EAh
    dd 0
gfx_getAuxBufSize endp
_gfx_getAuxBufSize equ gfx_getAuxBufSize
    db 0EAh, 000h, 000h, 000h, 000h
gfx_fillRow proc far               ; 0x1107
    db 0EAh
    dd 0
gfx_fillRow endp
gfx_fillRow2 proc far               ; 0x110C
    db 0EAh
    dd 0
gfx_fillRow2 endp
gfx_copyRow proc far               ; 0x1111
    db 0EAh
    dd 0
gfx_copyRow endp
gfx_nop36 proc far               ; 0x1116
    db 0EAh
    dd 0
gfx_nop36 endp
thunk_EXT_FUN_0000 proc far               ; 0x111B
    db 0EAh
    dd 0
thunk_EXT_FUN_0000 endp
gfx_getPageSeg proc far               ; 0x1120
    db 0EAh
    dd 0
gfx_getPageSeg endp
    db 0EAh, 000h, 000h, 000h, 000h
gfx_getRowOffset proc far               ; 0x112A
    db 0EAh
    dd 0
gfx_getRowOffset endp
gfx_clearPage proc far               ; 0x112F
    db 0EAh
    dd 0
gfx_clearPage endp
    db 0EAh, 000h, 000h, 000h, 000h
gfx_setFadeSteps proc far               ; 0x1139
    db 0EAh
    dd 0
gfx_setFadeSteps endp
_gfx_setFadeSteps equ gfx_setFadeSteps
gfx_calcRowAddr proc far               ; 0x113E
    db 0EAh
    dd 0
gfx_calcRowAddr endp
_gfx_calcRowAddr equ gfx_calcRowAddr
    db 0EAh, 000h, 000h, 000h, 000h
gfx_setOvlVal1 proc far               ; 0x1148
    db 0EAh
    dd 0
gfx_setOvlVal1 endp
_gfx_setOvlVal1 equ gfx_setOvlVal1
gfx_setOvlVal2 proc far               ; 0x114D
    db 0EAh
    dd 0
gfx_setOvlVal2 endp
_gfx_setOvlVal2 equ gfx_setOvlVal2
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h
gfx_setDac proc far               ; 0x115C
    db 0EAh
    dd 0
gfx_setDac endp
_gfx_setDac equ gfx_setDac
gfx_waitRetrace proc far               ; 0x1161
    db 0EAh
    dd 0
gfx_waitRetrace endp
_gfx_waitRetrace equ gfx_waitRetrace
gfx_flipPage proc far               ; 0x1166
    db 0EAh
    dd 0
gfx_flipPage endp
_gfx_flipPage equ gfx_flipPage
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_storeBufPtr proc far               ; 0x117F
    db 0EAh
    dd 0
gfx_storeBufPtr endp
_gfx_storeBufPtr equ gfx_storeBufPtr
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
PUBLIC _gfx_commitPage
gfx_commitPage proc far               ; 0x1198
    db 0EAh
    dd 0
gfx_commitPage endp
_gfx_commitPage equ gfx_commitPage
gfx_nop51 proc far               ; 0x119D
    db 0EAh
    dd 0
gfx_nop51 endp
gfx_setMonoFlag proc far               ; 0x11A2
    db 0EAh
    dd 0
gfx_setMonoFlag endp
_gfx_setMonoFlag equ gfx_setMonoFlag
gfx_getCurPage proc far               ; 0x11A7
    db 0EAh
    dd 0
gfx_getCurPage endp
_gfx_getCurPage equ gfx_getCurPage
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
_clipDivZeroHandler db 0EAh
    db 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h
_clearRectX db 000h
    db 000h
_clearRectY db 000h
    db 000h
_clearRectWidth db 000h
    db 000h
_clearRectHeight db 000h
    db 000h, 000h
_lineX1 db 000h
    db 000h
_lineX2 db 000h
    db 000h
_lineY1 db 000h
    db 000h
_lineY2 db 000h
    db 000h
_dirtyMinBuf db 440 dup(0FFh)
_dirtyMaxBuf db 220 dup(000h)
dat_14d7 db 41 dup(0)
dat_1500 db 128 dup(0)
_dat_1580 db 55 dup(0)
_dirtyRectMin db 0FFh
    db 0FFh
_dirtyRectMax db 000h
    db 000h, 000h
_clipOutcode db 000h
_clipDx db 000h
_var_41 db 000h
_clipDy db 000h
_var_43 db 000h
_clipDxHalf db 000h
    db 000h
_clipDyHalf db 000h
    db 000h
_clipMaxX db 03Fh
    db 001h
_clipMaxY db 06Fh
    db 000h, 000h
_joyMinValues db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_joyMaxValues db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_joyCenterValues db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_joyRangeBelow db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_joyRangeAbove db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_joyRawAxis0 db 000h
    db 000h
_joyRawAxis1 db 000h
    db 000h, 000h, 000h, 000h, 000h
_joyAxisX db 000h
_joyAxisY db 000h
    db 000h, 000h
_quitFlag db 000h
_origCBreakSeg db 000h
    db 000h
_origCBreakOfs db 000h
    db 000h, 000h
_errorCodeStr db 000h
_var_61 db 000h
_fileReadBuf db 512 dup(0)
str_fileNotFound db ':File not found$'
str_noFileBufs db ':No file buffers available$'
str_openError db ':Open error $'
str_fileCloseError db 'File closing error$'
str_readError db 'Read error$'
str_writeError db 'Write error$'
dat_1868 db 000h
    db 000h
dat_186A db 000h
    db 000h, 000h, 000h
_fileReadPos db 000h
    db 000h
_tmpFileHandle db 000h
    db 000h
_picDecodedRowBuf db 320 dup(0)
_picScreenBufSize db 000h
    db 000h
_picPageIndex db 000h
    db 000h
_picRowOffset db 000h
    db 000h, 000h, 000h
_picRow db 000h
    db 000h
_picReadFromFilePtr db 000h
    db 000h
_var_timerFlag db 000h
_timerHandlerInstalled db 000h
_timerCountLo db 000h
    db 000h
_timerCountHi db 000h
    db 000h
_timerTarget db 000h
    db 000h
_timerDivisor db 000h
    db 000h
_timerTickCnt db 000h
    db 000h
_timerReload db 000h
    db 000h
_timerDivider db 000h
_timerMode db 000h
    db 000h
_timerCalSumLo db 000h
    db 000h
_timerCalSumHi db 000h
    db 000h
_timerSyncRetrace db 000h
_timerTick db 000h
    db 000h
_timerRetrace db 000h
    db 000h, 000h, 000h
_timerCounter db 000h
_timerCounter4 db 000h
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

EXTRN _str_libya_spr:BYTE
EXTRN _str_persian_spr:BYTE
EXTRN _str_vn_spr:BYTE
EXTRN _str_me_spr:BYTE
EXTRN _str_ncape_spr:BYTE
EXTRN _str_ceurope_spr:BYTE
EXTRN _str_jp_spr:BYTE
EXTRN _str_na_spr:BYTE
EXTRN _str_reviewMission:BYTE
EXTRN _str_exitDebriefing:BYTE
EXTRN _str_modeRb1:BYTE
EXTRN _str_insertScenario:BYTE
EXTRN _str_pressKey1:BYTE
EXTRN _str_modeRb2:BYTE
EXTRN _str_dbicons1:BYTE
EXTRN _str_insertDiskA:BYTE
EXTRN _str_pressKey2:BYTE
EXTRN _str_dbicons2:BYTE
EXTRN _str_missionDebrief:BYTE
str_libya_spr equ _str_libya_spr
str_persian_spr equ _str_persian_spr
str_vn_spr equ _str_vn_spr
str_me_spr equ _str_me_spr
str_ncape_spr equ _str_ncape_spr
str_ceurope_spr equ _str_ceurope_spr
str_jp_spr equ _str_jp_spr
str_na_spr equ _str_na_spr
str_reviewMission equ _str_reviewMission
str_exitDebriefing equ _str_exitDebriefing
str_modeRb1 equ _str_modeRb1
str_insertScenario equ _str_insertScenario
str_pressKey1 equ _str_pressKey1
str_modeRb2 equ _str_modeRb2
str_dbicons1 equ _str_dbicons1
str_insertDiskA equ _str_insertDiskA
str_pressKey2 equ _str_pressKey2
str_dbicons2 equ _str_dbicons2
str_missionDebrief equ _str_missionDebrief
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
_dat_21e4 label byte
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
str_nmsg db '<<NMSG>>'
_nmsgEntries db 000h, 000h, 'R6000', 0Dh, 0Ah, '- stack overflow', 0Dh, 0Ah, 000h
    db 003h, 000h, 'R6003', 0Dh, 0Ah, '- integer divide by 0', 0Dh, 0Ah, 000h
    db 009h, 000h, 'R6009', 0Dh, 0Ah, '- not enough space for environment', 0Dh, 0Ah, 000h
    db 0FCh, 000h, 0Dh, 0Ah, 000h
    db 0FFh, 000h, 'run-time error ', 000h
    db 002h, 000h, 'R6002', 0Dh, 0Ah, '- floating point n'
_nmsgNotLoaded db 'ot loaded', 0Dh, 0Ah, 000h
    db 001h, 000h, 'R6001', 0Dh, 0Ah, '- null pointer assignment', 0Dh, 0Ah, 000h, 0FFh, 0FFh, 0FFh

.DATA?
; --- BSS ---

    db 1 dup(?)
_var_151 db 2 dup(?)
_var_152 db 2 dup(?)
_picReadBufEndPtr db 2 dup(?)
_picWorkDataPtr db 2 dup(?)
_picRowLength db 2 dup(?)
_picProcessFlag db ?
_picLookupResult db ?
_picTmp9BitCount db ?
_picByte db ?
_picFileReadBufEnd db 2 dup(?)
_picNumberDictSlots db 2 dup(?)
_picFileWord db 2 dup(?)
_picRemainingBitCount db ?
_picByteUnsignedFlag db ?
_picSlotCounter db 2 dup(?)
_picDictionaryIndex db 423 dup(?)
dat_270f db 90 dup(?)
dat_2769 db ?
_picDecodeDictionary db 2 dup(?)
_picDecodeIncrement db 6142 dup(?)
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
_dat_4034 label byte
dat_4034 db 4 dup(?)
_gameData db 2 dup(?)
_var_179 db 4 dup(?)
_dat_4040 label byte
dat_4040 db 516 dup(?)
_var_180 db 2 dup(?)
_dat_4246 label byte
dat_4246 db 2 dup(?)
_dat_4a2a label byte
dat_4a2a db 720 dup(?)
_var_203 db 2 dup(?)
_dat_5512 label byte
dat_5512 db 102 dup(?)
_var_205 db 2 dup(?)
_dat_55de label byte
dat_55de db 2 dup(?)
_var_216 db 6 dup(?)
_dat_5ab4 label byte
dat_5ab4 db 2 dup(?)
_commData db 2 dup(?)
_commData_seg db 2 dup(?)
_gfxBufSeg db 514 dup(?)

_var_193 db 2 dup(?)
_flightRecords db 1534 dup(?)

__bss_end label byte

; Stack size must match the original (0x800 = 2048 bytes)

END
