.8086
DOSSEG
.MODEL SMALL

; Overlay jump table slots - patched at runtime by setupOverlaySlots.
; Each slot is 5 bytes: db 0EAh (far jmp opcode) + dd 0 (target, filled in).
; The slots MUST remain contiguous with 5-byte stride.
PUBLIC _gfx_allocPage
PUBLIC _gfx_drawString
PUBLIC _gfx_setPageN
PUBLIC _gfx_blitSprite
PUBLIC _gfx_getBufSize
PUBLIC _gfx_setBlitOffset
PUBLIC _gfx_setColor
PUBLIC _gfx_resetBlitOffset2
PUBLIC _gfx_switchColor
PUBLIC _gfx_copyRect
PUBLIC _gfx_setFont
PUBLIC _gfx_getAuxBufSize
PUBLIC _gfx_setFadeSteps
PUBLIC _gfx_calcRowAddr
PUBLIC _gfx_setOvlVal1
PUBLIC _gfx_setOvlVal2
PUBLIC _gfx_setDac
PUBLIC _gfx_waitRetrace
PUBLIC _gfx_flipPage
PUBLIC _gfx_storeBufPtr
PUBLIC _gfx_commitPage
PUBLIC _gfx_setMonoFlag
PUBLIC _gfx_getCurPage
PUBLIC _misc_jump_5a_keybuf
PUBLIC _misc_jump_5b_getkey
PUBLIC _misc_jump_5d_readJoy
PUBLIC _misc_jump_5e_clearKeyFlags
PUBLIC _gfx_nop37
PUBLIC _gfx_setPage1
PUBLIC _gfx_getCurPageSeg
PUBLIC _gfx_getCurPageSeg2
PUBLIC _gfx_drawLine
PUBLIC _gfx_setPageDirect
PUBLIC _gfx_resetBlitOffset
PUBLIC _gfx_dirtyRect2
PUBLIC _gfx_nop51
PUBLIC _gfx_fillRow
PUBLIC _gfx_fillRow2
PUBLIC _gfx_copyRow
PUBLIC _gfx_nop36
PUBLIC _gfx_getPageSeg
PUBLIC _gfx_getRowOffset
PUBLIC _gfx_clearPage

; Dirty rect buffers - MUST be contiguous (overlay hardcodes offset +0x1B8)
PUBLIC _dirtyMinBuf
PUBLIC _dirtyMaxBuf
PUBLIC _dirtyRectMin
PUBLIC _dirtyRectMax

; LZW pic decoder contiguous block
PUBLIC _picDictionaryIndex
PUBLIC _picDecodeDictionary
PUBLIC _picDecodeIncrement
PUBLIC _clipDivZeroHandler



; Award/promotion data
PUBLIC _awardColor
PUBLIC _awardFont
PUBLIC _awardPage
PUBLIC _medalScores
PUBLIC _medalThresholds
PUBLIC _promoScores
PUBLIC _promoThresholds

; Misc data/BSS variables
PUBLIC _commData
PUBLIC _commData_seg
PUBLIC _dat_1580
PUBLIC _dat_4034
PUBLIC _dat_4040
PUBLIC _dat_4246
PUBLIC _dat_4a2a
PUBLIC _dat_5512
PUBLIC _dat_55de
PUBLIC _dat_5ab4
PUBLIC _gameData
PUBLIC _gfxBufSeg
PUBLIC _var_179
PUBLIC _var_180
PUBLIC _var_203
PUBLIC _var_205
PUBLIC _var_216


.DATA

PUBLIC _var_193
PUBLIC _flightRecords
PUBLIC dat_2769

PUBLIC str_overlayRelError

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
    db 000h ; was ovlInsaneFlag, now in C
str_overlayRelError db 'Error releasing overlay memory$'
_gfx_allocPage proc far             ; slot 00
    db 0EAh, 4 dup(0)
_gfx_allocPage endp
    db 0EAh, 4 dup(0)               ; slot 01
    db 0EAh, 4 dup(0)               ; slot 02
    db 0EAh, 4 dup(0)               ; slot 03
    db 0EAh, 4 dup(0)               ; slot 04
_gfx_drawString proc far             ; slot 05
    db 0EAh, 4 dup(0)
_gfx_drawString endp
    db 0EAh, 4 dup(0)               ; slot 06
    db 0EAh, 4 dup(0)               ; slot 07
    db 0EAh, 4 dup(0)               ; slot 08
    db 0EAh, 4 dup(0)               ; slot 09
    db 0EAh, 4 dup(0)               ; slot 0a
    db 0EAh, 4 dup(0)               ; slot 0b
    db 0EAh, 4 dup(0)               ; slot 0c
_gfx_setPage1 proc far             ; slot 0d
    db 0EAh, 4 dup(0)
_gfx_setPage1 endp
_gfx_setPageN proc far             ; slot 0e
    db 0EAh, 4 dup(0)
_gfx_setPageN endp
_gfx_getCurPageSeg proc far             ; slot 0f
    db 0EAh, 4 dup(0)
_gfx_getCurPageSeg endp
_gfx_getCurPageSeg2 proc far             ; slot 10
    db 0EAh, 4 dup(0)
_gfx_getCurPageSeg2 endp
_gfx_blitSprite proc far             ; slot 11
    db 0EAh, 4 dup(0)
_gfx_blitSprite endp
    db 0EAh, 4 dup(0)               ; slot 12
    db 0EAh, 4 dup(0)               ; slot 13
    db 0EAh, 4 dup(0)               ; slot 14
    db 0EAh, 4 dup(0)               ; slot 15
    db 0EAh, 4 dup(0)               ; slot 16
_gfx_getBufSize proc far             ; slot 17
    db 0EAh, 4 dup(0)
_gfx_getBufSize endp
    db 0EAh, 4 dup(0)               ; slot 18
    db 0EAh, 4 dup(0)               ; slot 19
_gfx_setBlitOffset proc far             ; slot 1a
    db 0EAh, 4 dup(0)
_gfx_setBlitOffset endp
    db 0EAh, 4 dup(0)               ; slot 1b
    db 0EAh, 4 dup(0)               ; slot 1c
    db 0EAh, 4 dup(0)               ; slot 1d
    db 0EAh, 4 dup(0)               ; slot 1e
_gfx_drawLine proc far             ; slot 1f
    db 0EAh, 4 dup(0)
_gfx_drawLine endp
_gfx_setPageDirect proc far             ; slot 20
    db 0EAh, 4 dup(0)
_gfx_setPageDirect endp
_gfx_setColor proc far             ; slot 21
    db 0EAh, 4 dup(0)
_gfx_setColor endp
_gfx_resetBlitOffset proc far             ; slot 22
    db 0EAh, 4 dup(0)
_gfx_resetBlitOffset endp
_gfx_resetBlitOffset2 proc far             ; slot 23
    db 0EAh, 4 dup(0)
_gfx_resetBlitOffset2 endp
    db 0EAh, 4 dup(0)               ; slot 24
    db 0EAh, 4 dup(0)               ; slot 25
    db 0EAh, 4 dup(0)               ; slot 26
    db 0EAh, 4 dup(0)               ; slot 27
_gfx_dirtyRect2 proc far             ; slot 28
    db 0EAh, 4 dup(0)
_gfx_dirtyRect2 endp
_gfx_switchColor proc far             ; slot 29
    db 0EAh, 4 dup(0)
_gfx_switchColor endp
_gfx_copyRect proc far             ; slot 2a
    db 0EAh, 4 dup(0)
_gfx_copyRect endp
    db 0EAh, 4 dup(0)               ; slot 2b
    db 0EAh, 4 dup(0)               ; slot 2c
    db 0EAh, 4 dup(0)               ; slot 2d
    db 0EAh, 4 dup(0)               ; slot 2e
_gfx_setFont proc far             ; slot 2f
    db 0EAh, 4 dup(0)
_gfx_setFont endp
    db 0EAh, 4 dup(0)               ; slot 30
_gfx_getAuxBufSize proc far             ; slot 31
    db 0EAh, 4 dup(0)
_gfx_getAuxBufSize endp
    db 0EAh, 4 dup(0)               ; slot 32
_gfx_fillRow proc far             ; slot 33
    db 0EAh, 4 dup(0)
_gfx_fillRow endp
_gfx_fillRow2 proc far             ; slot 34
    db 0EAh, 4 dup(0)
_gfx_fillRow2 endp
_gfx_copyRow proc far             ; slot 35
    db 0EAh, 4 dup(0)
_gfx_copyRow endp
_gfx_nop36 proc far             ; slot 36
    db 0EAh, 4 dup(0)
_gfx_nop36 endp
_gfx_nop37 proc far             ; slot 37
    db 0EAh, 4 dup(0)
_gfx_nop37 endp
_gfx_getPageSeg proc far             ; slot 38
    db 0EAh, 4 dup(0)
_gfx_getPageSeg endp
    db 0EAh, 4 dup(0)               ; slot 39
_gfx_getRowOffset proc far             ; slot 3a
    db 0EAh, 4 dup(0)
_gfx_getRowOffset endp
_gfx_clearPage proc far             ; slot 3b
    db 0EAh, 4 dup(0)
_gfx_clearPage endp
    db 0EAh, 4 dup(0)               ; slot 3c
_gfx_setFadeSteps proc far             ; slot 3d
    db 0EAh, 4 dup(0)
_gfx_setFadeSteps endp
_gfx_calcRowAddr proc far             ; slot 3e
    db 0EAh, 4 dup(0)
_gfx_calcRowAddr endp
    db 0EAh, 4 dup(0)               ; slot 3f
_gfx_setOvlVal1 proc far             ; slot 40
    db 0EAh, 4 dup(0)
_gfx_setOvlVal1 endp
_gfx_setOvlVal2 proc far             ; slot 41
    db 0EAh, 4 dup(0)
_gfx_setOvlVal2 endp
    db 0EAh, 4 dup(0)               ; slot 42
    db 0EAh, 4 dup(0)               ; slot 43
_gfx_setDac proc far             ; slot 44
    db 0EAh, 4 dup(0)
_gfx_setDac endp
_gfx_waitRetrace proc far             ; slot 45
    db 0EAh, 4 dup(0)
_gfx_waitRetrace endp
_gfx_flipPage proc far             ; slot 46
    db 0EAh, 4 dup(0)
_gfx_flipPage endp
    db 0EAh, 4 dup(0)               ; slot 47
    db 0EAh, 4 dup(0)               ; slot 48
    db 0EAh, 4 dup(0)               ; slot 49
    db 0EAh, 4 dup(0)               ; slot 4a
_gfx_storeBufPtr proc far             ; slot 4b
    db 0EAh, 4 dup(0)
_gfx_storeBufPtr endp
    db 0EAh, 4 dup(0)               ; slot 4c
    db 0EAh, 4 dup(0)               ; slot 4d
    db 0EAh, 4 dup(0)               ; slot 4e
    db 0EAh, 4 dup(0)               ; slot 4f
PUBLIC _gfx_commitPage
_gfx_commitPage proc far             ; slot 50
    db 0EAh, 4 dup(0)
_gfx_commitPage endp
_gfx_nop51 proc far             ; slot 51
    db 0EAh, 4 dup(0)
_gfx_nop51 endp
_gfx_setMonoFlag proc far             ; slot 52
    db 0EAh, 4 dup(0)
_gfx_setMonoFlag endp
_gfx_getCurPage proc far             ; slot 53
    db 0EAh, 4 dup(0)
_gfx_getCurPage endp
    db 30 dup(0)
_misc_jump_5a_keybuf proc far             ; slot 5a
    db 0EAh, 4 dup(0)
_misc_jump_5a_keybuf endp
_misc_jump_5b_getkey proc far             ; slot 5b
    db 0EAh, 4 dup(0)
_misc_jump_5b_getkey endp
    db 0EAh, 4 dup(0)               ; slot 5c
_misc_jump_5d_readJoy proc far             ; slot 5d
    db 0EAh, 4 dup(0)
_misc_jump_5d_readJoy endp
_misc_jump_5e_clearKeyFlags proc far             ; slot 5e
    db 0EAh, 4 dup(0)
_misc_jump_5e_clearKeyFlags endp
    db 0EAh, 4 dup(0)               ; slot 5f
    db 20 dup(0)
    db 0EAh, 4 dup(0)               ; slot 64
    db 0EAh, 4 dup(0)               ; slot 65
    db 0EAh, 4 dup(0)               ; slot 66
    db 0EAh, 4 dup(0)               ; slot 67
    db 0EAh, 4 dup(0)               ; slot 68
    db 0EAh, 4 dup(0)               ; slot 69
    db 0EAh, 4 dup(0)               ; slot 6a
_clipDivZeroHandler db 0EAh
    db 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h
EXTRN _clearRectX:BYTE
EXTRN _clearRectY:BYTE
EXTRN _clearRectWidth:BYTE
EXTRN _clearRectHeight:BYTE
EXTRN _lineX1:BYTE
EXTRN _lineX2:BYTE
EXTRN _lineY1:BYTE
EXTRN _lineY2:BYTE
_dirtyMinBuf db 440 dup(0FFh)
_dirtyMaxBuf db 220 dup(000h)
dat_14d7 db 41 dup(0)
dat_1500 db 128 dup(0)
_dat_1580 db 55 dup(0)
_dirtyRectMin db 0FFh
    db 0FFh
_dirtyRectMax db 000h
    db 000h, 000h
EXTRN _clipOutcode:BYTE
EXTRN _clipDx:BYTE
EXTRN _clipDy:BYTE
EXTRN _clipDxHalf:BYTE
EXTRN _clipDyHalf:BYTE
EXTRN _clipMaxX:BYTE
EXTRN _clipMaxY:BYTE
EXTRN _joyMinValues:BYTE
EXTRN _joyMaxValues:BYTE
EXTRN _joyCenterValues:BYTE
EXTRN _joyRangeBelow:BYTE
EXTRN _joyRangeAbove:BYTE
EXTRN _joyRawAxis0:BYTE
EXTRN _joyRawAxis1:BYTE
EXTRN _joyAxisX:BYTE
EXTRN _joyAxisY:BYTE
_ps_var86_target db 000h, 000h, 000h, 000h
_awardColor db 007h
    db 7 dup(0)
_awardFont db 001h
    db 9 dup(0)
_awardPage dw offset _ps_var86_target
_ps_var86_2 db 000h, 000h, 000h, 000h, 009h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h
    db 7 dup(0)
    dw offset _ps_var86_2
_promoScores dw 05DCh  ; 1500 - first rank score threshold
_promoThresholds dw 0000h
    dd 6000, 12000, 25000, 50000, 100000
_medalScores dw 03E8h  ; 1000 - first medal score threshold
_medalThresholds dw 0000h
    dd 2500, 4000, 6400, 7800
    db 004h, 003h, 003h, 002h, 007h, 005h, 003h, 002h, 008h, 007h, 004h, 002h, 008h, 006h, 005h
    db 003h

EXTRN _quitFlag:BYTE
EXTRN _origCBreakSeg:BYTE
EXTRN _origCBreakOfs:BYTE
EXTRN _var_timerFlag:BYTE
EXTRN _timerHandlerInstalled:BYTE
EXTRN _timerCountLo:BYTE
EXTRN _timerCountHi:BYTE
EXTRN _timerTarget:BYTE
EXTRN _timerDivisor:BYTE
EXTRN _timerTickCnt:BYTE
EXTRN _timerReload:BYTE
EXTRN _timerDivider:BYTE
EXTRN _timerMode:BYTE
EXTRN _timerCalSumLo:BYTE
EXTRN _timerCalSumHi:BYTE
EXTRN _timerSyncRetrace:BYTE
EXTRN _timerTick:BYTE
EXTRN _timerRetrace:BYTE
EXTRN _timerCounter:BYTE
EXTRN _timerCounter4:BYTE
EXTRN _timerCounter2:BYTE
EXTRN _timerCounter3:BYTE
EXTRN _var_151:BYTE
EXTRN _var_152:BYTE
EXTRN _picReadBufEndPtr:BYTE
EXTRN _picWorkDataPtr:BYTE
EXTRN _picRowLength:BYTE
EXTRN _picProcessFlag:BYTE
EXTRN _picLookupResult:BYTE
EXTRN _picTmp9BitCount:BYTE
EXTRN _picByte:BYTE
EXTRN _picFileReadBufEnd:BYTE
EXTRN _picNumberDictSlots:BYTE
EXTRN _picFileWord:BYTE
EXTRN _picRemainingBitCount:BYTE
EXTRN _picByteUnsignedFlag:BYTE
EXTRN _picSlotCounter:BYTE
EXTRN _dat_3F6A:BYTE
EXTRN _dat_3F6B:BYTE
EXTRN _dat_3F6C:BYTE
EXTRN _dat_3F6E:BYTE
EXTRN _dat_3F70:BYTE
EXTRN _dat_3F71:BYTE
EXTRN _var_3f72:BYTE
EXTRN _dat_3FB2:BYTE
EXTRN _dat_3FB4:BYTE
EXTRN _dat_3FB6:BYTE
EXTRN _dat_3FB8:BYTE
EXTRN _var_3fc6:BYTE
EXTRN _randSeed:BYTE
EXTRN _randState:BYTE

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

.DATA?
; --- BSS ---
_picDictionaryIndex db 423 dup(?)
dat_270f db 90 dup(?)
dat_2769 db ?
_picDecodeDictionary db 2 dup(?)
_picDecodeIncrement db 6142 dup(?)

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

END
