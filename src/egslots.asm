.8086
DOSSEG
.MODEL SMALL


PUBLIC byte_37C2D
PUBLIC g_tapePageCounter
PUBLIC g_tapeRenderMode
PUBLIC g_compassTapeBuf
PUBLIC var_468
PUBLIC g_spanMinX
PUBLIC g_tapeText0Page
PUBLIC g_tapeText0X
PUBLIC g_tapeText0Y
PUBLIC g_tapeText1Page
PUBLIC g_tapeText1X
PUBLIC g_tapeText2Page
PUBLIC g_tapeText2X
PUBLIC g_tapeText2Y
PUBLIC g_tapeText3Page
PUBLIC g_tapeText3X
PUBLIC g_tapeSprite0SrcY
PUBLIC g_tapeSprite0Page
PUBLIC g_tapeSprite1Page
PUBLIC g_tapeSprite2Page
PUBLIC g_tapeSprite3Page
PUBLIC g_altRemainder
PUBLIC g_compassScrollIdx
PUBLIC g_compassDrawX
PUBLIC g_tapeRenderX
PUBLIC word_37C30
PUBLIC word_37C32
PUBLIC word_37C36
PUBLIC g_tapeSegmentCount
PUBLIC g_tapeDrawStr
PUBLIC g_tapeDrawStrY
PUBLIC g_tapeRollOfsB0
PUBLIC g_tapeRollOfsB1
PUBLIC g_tapeRollOfsB2
PUBLIC g_tapeRollOfsB3
PUBLIC g_tapeRollOfsA0
PUBLIC g_tapeRollOfsA1
PUBLIC g_tapeRollOfsA2
PUBLIC g_tapeRollOfsA3
PUBLIC _g_viewZ
PUBLIC _uvar_547
PUBLIC _origCBreakSeg
PUBLIC _var_143
PUBLIC _audio_setEnginePitch
PUBLIC _audio_setup
PUBLIC _audio_shutdown
PUBLIC _audio_playSound
PUBLIC _audio_playSample
PUBLIC _audio_engineDroneOn
PUBLIC _audio_engineDroneOff
PUBLIC g_tapeSprite0BufPtr
PUBLIC g_tapeSprite1BufPtr
PUBLIC g_tapeSprite2BufPtr
PUBLIC g_tapeSprite3BufPtr
PUBLIC g_tapeOriginX
PUBLIC g_tapeCursorBackShift
PUBLIC g_tapeTickPitch
PUBLIC g_tapeScaleShift
PUBLIC g_speedTapeTickStep
PUBLIC g_altTapeTickStep
PUBLIC g_headingBase
PUBLIC g_headingPixPerDeg
PUBLIC g_compassWrapLimit
PUBLIC g_headingModulus
PUBLIC g_headingWrapOffset
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
PUBLIC g_tapeText0ClipTop
PUBLIC g_tapeText0ClipBottom
PUBLIC g_tapeText0Font
PUBLIC g_tapeText1Font
PUBLIC g_tapeText2Font
PUBLIC g_tapeText3Font
PUBLIC g_tapeText1Y
PUBLIC g_tapeText1ClipX1
PUBLIC g_tapeText1ClipX2
PUBLIC g_tapeSprite1SrcX
PUBLIC g_tapeSprite1SrcY
PUBLIC g_tapeSprite1DstX
PUBLIC g_tapeSprite1DstY
PUBLIC g_tapeSprite1Width
PUBLIC g_tapeSprite1Height
PUBLIC g_tapeSprite0DstX
PUBLIC g_tapeSprite0DstY
PUBLIC g_tapeSprite0Width
PUBLIC g_tapeSprite0Height
PUBLIC g_tapeText2ClipTop
PUBLIC g_tapeText2ClipX1
PUBLIC g_tapeText2ClipX2
PUBLIC g_tapeText3Y
PUBLIC g_kbdActiveScan
PUBLIC g_kbdLastTick
PUBLIC g_kbdPrevScan
PUBLIC g_kbdLastDirKey
PUBLIC g_kbdDelayCounter
PUBLIC _misc_getKey
PUBLIC _gfx_setColor
PUBLIC _gfx_nop23
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
PUBLIC g_dacGroundPalette
PUBLIC g_dacGroundPaletteSrc
PUBLIC g_picNumberDictSlots
PUBLIC g_picFileWord
PUBLIC dacValues
PUBLIC dacValues1
PUBLIC f15dgtlAddr
PUBLIC fileReadPos
PUBLIC gfx_clearPage
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
PUBLIC timerHandlerInstalled
PUBLIC tmpFileHandle
PUBLIC tmpPageIndex
PUBLIC g_sineTableBase
PUBLIC g_sineTableDelta
PUBLIC g_picBlitBytesRemaining
PUBLIC g_picBlitCurrentRow
PUBLIC g_picLookupResult
PUBLIC g_picByte
PUBLIC g_picByteUnsignedFlag

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
ovlInsaneFlag db 0
aErrorReleasingOverlay db 'Error releasing overlay memory$'
    db 0
; residual inter-table padding bytes from the original layout; the
; aNone/aircraftTypes/sams/missleSpec/missiles arrays that surrounded them are
; now defined in egdata.c.
    db 3
    db 0
    db 1
    db 0
_gfx_allocPage proc near                    ; slot 0x00
    db 0EAh, 4 dup(0)
_gfx_allocPage endp
PUBLIC gfx_fillDirty
gfx_fillDirty proc near                     ; slot 0x01
    db 0EAh, 4 dup(0)
gfx_fillDirty endp
PUBLIC gfx_blitTransparent
gfx_blitTransparent proc near               ; slot 0x03
    db 0EAh, 4 dup(0)
gfx_blitTransparent endp
PUBLIC gfx_blitVariant
gfx_blitVariant proc near                   ; slot 0x04
    db 0EAh, 4 dup(0)
gfx_blitVariant endp
PUBLIC gfx_copyBlock
gfx_copyBlock proc near                     ; slot 0x05
    db 0EAh, 4 dup(0)
gfx_copyBlock endp
_gfx_drawString proc near                   ; slot 0x06
    db 0EAh, 4 dup(0)
_gfx_drawString endp
PUBLIC gfx_drawStringUnclipped
gfx_drawStringUnclipped proc near           ; slot 0x07
    db 0EAh, 4 dup(0)
gfx_drawStringUnclipped endp
    db 0EAh, 4 dup(0)                       ; slot 0x08
    db 0EAh, 4 dup(0)                       ; slot 0x09
    db 0EAh, 4 dup(0)                       ; slot 0x0A
    db 0EAh, 4 dup(0)                       ; slot 0x0B
PUBLIC gfx_complexRender
gfx_complexRender proc near                 ; slot 0x0C
    db 0EAh, 4 dup(0)
gfx_complexRender endp
_gfx_initOverlay proc near                  ; slot 0x0D
    db 0EAh, 4 dup(0)
_gfx_initOverlay endp
PUBLIC gfx_setPage1
gfx_setPage1 proc near                      ; slot 0x0E
    db 0EAh, 4 dup(0)
gfx_setPage1 endp
gfx_setPageN proc near                      ; slot 0x0F
    db 0EAh, 4 dup(0)
gfx_setPageN endp
    PUBLIC _gfx_setPageN
    PUBLIC _gfx_setCurPageSeg
_gfx_setPageN equ gfx_setPageN
PUBLIC gfx_setCurPageSeg
PUBLIC gfx_getCurPageSeg
gfx_setCurPageSeg proc near                 ; slot 0x10
    db 0EAh, 4 dup(0)
_gfx_setCurPageSeg equ gfx_setCurPageSeg
gfx_setCurPageSeg endp
gfx_getCurPageSeg proc near                ; slot 0x11
    db 0EAh, 4 dup(0)
gfx_getCurPageSeg endp
    db 0EAh, 4 dup(0)                       ; slot 0x12
PUBLIC gfx_blitCore
gfx_blitCore proc near                      ; slot 0x13
    db 0EAh, 4 dup(0)
gfx_blitCore endp
    db 0EAh, 4 dup(0)                       ; slot 0x14
    db 0EAh, 4 dup(0)                       ; slot 0x15
    db 0EAh, 4 dup(0)                       ; slot 0x16
    db 0EAh, 4 dup(0)                       ; slot 0x17
    db 0EAh, 4 dup(0)                       ; slot 0x18
gfx_setBlitOffset2 proc near                ; slot 0x19
    db 0EAh, 4 dup(0)
gfx_setBlitOffset2 endp
PUBLIC _gfx_setBlitOffset2
_gfx_setBlitOffset2 equ gfx_setBlitOffset2   ; underscore alias for C caller (rasterize3DWorld)
PUBLIC gfx_setBlitOffset3
gfx_setBlitOffset3 proc near                ; slot 0x1A
    db 0EAh, 4 dup(0)
gfx_setBlitOffset3 endp
gfx_setBlitOffset proc near                 ; slot 0x1B
    db 0EAh, 4 dup(0)
gfx_setBlitOffset endp
    PUBLIC _gfx_setBlitOffset
_gfx_setBlitOffset equ gfx_setBlitOffset
PUBLIC gfx_setBlitOffsetReg
gfx_setBlitOffsetReg proc near                    ; slot 0x1C
    db 0EAh, 4 dup(0)
gfx_setBlitOffsetReg endp
PUBLIC gfx_getPresetOffset1
gfx_getPresetOffset1 proc near                 ; slot 0x1D
    db 0EAh, 4 dup(0)
gfx_getPresetOffset1 endp
PUBLIC gfx_getPresetOffset2
gfx_getPresetOffset2 proc near                   ; slot 0x1E
    db 0EAh, 4 dup(0)
gfx_getPresetOffset2 endp
    db 0EAh, 4 dup(0)                       ; slot 0x1F
PUBLIC gfx_drawLine
gfx_drawLine proc near                      ; slot 0x20
    db 0EAh, 4 dup(0)
gfx_drawLine endp
PUBLIC gfx_setDrawColor
gfx_setDrawColor proc near                 ; slot 0x21
    db 0EAh, 4 dup(0)
gfx_setDrawColor endp
_gfx_setColor proc near                     ; slot 0x22
    db 0EAh, 4 dup(0)
_gfx_setColor endp
PUBLIC gfx_nop22
gfx_nop22 proc near               ; slot 0x23
    db 0EAh, 4 dup(0)
gfx_nop22 endp
_gfx_nop23 proc near             ; slot 0x24
    db 0EAh, 4 dup(0)
_gfx_nop23 endp
gfx_plotPixel proc near                         ; slot 0x25
    db 0EAh, 4 dup(0)
gfx_plotPixel endp
PUBLIC gfx_dirtyRect
gfx_dirtyRect proc near                     ; slot 0x26
    db 0EAh, 4 dup(0)
gfx_dirtyRect endp
    db 0EAh, 4 dup(0)                       ; slot 0x27
    db 0EAh, 4 dup(0)                       ; slot 0x28
PUBLIC gfx_dirtyRect2
gfx_dirtyRect2 proc near                    ; slot 0x29
    db 0EAh, 4 dup(0)
gfx_dirtyRect2 endp
PUBLIC _gfx_switchColor
_gfx_switchColor proc near                  ; slot 0x2A
    db 0EAh, 4 dup(0)
_gfx_switchColor endp
_gfx_copyRect proc near                     ; slot 0x2B
    db 0EAh, 4 dup(0)
_gfx_copyRect endp
gfx_clearVga proc near                     ; slot 0x2C
    db 0EAh, 4 dup(0)
gfx_clearVga endp
gfx_dacAnimate proc near                    ; slot 0x2D
    db 0EAh, 4 dup(0)
gfx_dacAnimate endp
gfx_getDisplayPage proc near               ; slot 0x2E
    db 0EAh, 4 dup(0)
gfx_getDisplayPage endp
PUBLIC gfx_getDisplayPage
_gfx_getDisplayPage equ gfx_getDisplayPage
gfx_dacCycle proc near                     ; slot 0x2F
    db 0EAh, 4 dup(0)
gfx_dacCycle endp
    db 0EAh, 4 dup(0)                       ; slot 0x30
    db 0EAh, 4 dup(0)                       ; slot 0x31
    db 0EAh, 4 dup(0)                       ; slot 0x32
gfx_getFreeMem proc near                     ; slot 0x33
    db 0EAh, 4 dup(0)
gfx_getFreeMem endp
gfx_fillRow proc near                       ; slot 0x34
    db 0EAh, 4 dup(0)
gfx_fillRow endp
gfx_fillRow2 proc near                      ; slot 0x35
    db 0EAh, 4 dup(0)
gfx_fillRow2 endp
gfx_copyRow proc near                       ; slot 0x36
    db 0EAh, 4 dup(0)
gfx_copyRow endp
gfx_nop36 proc near                         ; slot 0x37
    db 0EAh, 4 dup(0)
gfx_nop36 endp
gfx_nop37 proc near                         ; slot 0x38
    db 0EAh, 4 dup(0)
gfx_nop37 endp
gfx_getPageSeg proc near                    ; slot 0x39
    db 0EAh, 4 dup(0)
gfx_getPageSeg endp
    db 0EAh, 4 dup(0)                       ; slot 0x3A
gfx_getRowOffset proc near                  ; slot 0x3B
    db 0EAh, 4 dup(0)
gfx_getRowOffset endp
gfx_clearPage proc near                     ; slot 0x3C
    db 0EAh, 4 dup(0)
gfx_clearPage endp
    db 0EAh, 4 dup(0)                       ; slot 0x3D
_gfx_setFadeSteps proc near                 ; slot 0x3E
    db 0EAh, 4 dup(0)
_gfx_setFadeSteps endp
gfx_calcRowAddr proc near                   ; slot 0x3F
    db 0EAh, 4 dup(0)
gfx_calcRowAddr endp
    PUBLIC _gfx_calcRowAddr
_gfx_calcRowAddr equ gfx_calcRowAddr
_gfx_getModecode proc near                  ; slot 0x40
    db 0EAh, 4 dup(0)
_gfx_getModecode endp
    db 0EAh, 4 dup(0)                       ; slot 0x41
gfx_setOvlVal1 proc near                    ; slot 0x42
    db 0EAh, 4 dup(0)
gfx_setOvlVal1 endp
gfx_setOvlVal2 proc near                    ; slot 0x43
    db 0EAh, 4 dup(0)
gfx_setOvlVal2 endp
    PUBLIC _gfx_setOvlVal2
_gfx_setOvlVal2 equ gfx_setOvlVal2
    db 0EAh, 4 dup(0)                       ; slot 0x44
_gfx_setDac proc near                       ; slot 0x45
    db 0EAh, 4 dup(0)
_gfx_setDac endp
_gfx_waitRetrace proc near                  ; slot 0x46
    db 0EAh, 4 dup(0)
_gfx_waitRetrace endp
_gfx_flipPage proc near                     ; slot 0x47
    db 0EAh, 4 dup(0)
_gfx_flipPage endp
gfx_blitSpriteClipped proc near             ; slot 0x48
    db 0EAh, 4 dup(0)
gfx_blitSpriteClipped endp
    PUBLIC _gfx_blitSpriteClipped
_gfx_blitSpriteClipped equ gfx_blitSpriteClipped
    db 0EAh, 4 dup(0)                       ; slot 0x49
gfx_blitSpriteOpaque proc near              ; slot 0x4A
    db 0EAh, 4 dup(0)
gfx_blitSpriteOpaque endp
    PUBLIC _gfx_blitSpriteOpaque
_gfx_blitSpriteOpaque equ gfx_blitSpriteOpaque
    db 0EAh, 4 dup(0)                       ; slot 0x4B
_gfx_storeBufPtr proc near                  ; slot 0x4C
    db 0EAh, 4 dup(0)
_gfx_storeBufPtr endp
_gfx_getModeFlag proc near                  ; slot 0x4D
    db 0EAh, 4 dup(0)
_gfx_getModeFlag endp
    db 0EAh, 4 dup(0)                       ; slot 0x4E
    db 0EAh, 4 dup(0)                       ; slot 0x4F
_gfx_setDacAnimCount proc near              ; slot 0x50
    db 0EAh, 4 dup(0)
_gfx_setDacAnimCount endp
    db 0EAh, 4 dup(0)                       ; slot 0x51
    db 0EAh, 4 dup(0)                       ; slot 0x52
_gfx_setMonoFlag proc near                  ; slot 0x53
    db 0EAh, 4 dup(0)
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
    db 0EAh, 4 dup(0)
_misc_getKey endp
    db 0EAh, 4 dup(0)                       ; slot 0x5D
PUBLIC _misc_readJoystick
misc_readJoystick proc near              ; slot 0x5E
    db 0EAh, 4 dup(0)
misc_readJoystick endp
_misc_readJoystick equ misc_readJoystick
    db 0EAh, 4 dup(0)                       ; slot 0x5F
    db 0EAh, 4 dup(0)                       ; slot 0x60
    db 0EAh, 4 dup(0)                       ; slot 0x61
    db 0EAh, 4 dup(0)                       ; slot 0x62
    db 0EAh, 4 dup(0)                       ; slot 0x63
    db 0EAh, 4 dup(0)                       ; slot 0x64
_audio_setup proc near                    ; slot 0x65
    db 0EAh, 4 dup(0)
_audio_setup endp
_audio_shutdown proc near                    ; slot 0x66
    db 0EAh, 4 dup(0)
_audio_shutdown endp
_audio_playSound proc near                    ; slot 0x67
    db 0EAh, 4 dup(0)
_audio_playSound endp
audio_playSound equ _audio_playSound
    db 0EAh, 4 dup(0)                       ; slot 0x68
_audio_engineDroneOn proc near                    ; slot 0x69
    db 0EAh, 4 dup(0)
_audio_engineDroneOn endp
audio_engineDroneOn equ _audio_engineDroneOn
_audio_engineDroneOff proc near                    ; slot 0x6A
    db 0EAh, 4 dup(0)
_audio_engineDroneOff endp
audio_engineDroneOff equ _audio_engineDroneOff
audio_setEnginePitch proc near                     ; slot 0x6B
    db 0EAh, 4 dup(0)
audio_setEnginePitch endp
_audio_setEnginePitch equ audio_setEnginePitch
audio_timerTick proc near                     ; slot 0x6C
    db 0EAh, 4 dup(0)
audio_timerTick endp
audio_noiseTick proc near                     ; slot 0x6D
    db 0EAh, 4 dup(0)
audio_noiseTick endp
_audio_playSample proc near                    ; slot 0x6E
    db 0EAh, 4 dup(0)
_audio_playSample endp
audio_playSample equ _audio_playSample
    db 6 dup(0)
    db 0
aPleaseInsertScenarioD db 'Please insert scenario disk',0
    db 2 dup(0)
    db 0
    db 1
    db 3 dup(0)
; Overlaid scratch region (word_3424C..0x35AF7, 0x1878 bytes) migrated to
; egdata.c as struct VtxScratch vtxScratch: the LZW pic dictionary time-shares
; this memory with the render/numerator scratch and the vertex-projection
; cluster. egseg1.asm/egcode.asm reach the sub-objects via _vtxScratch EQUs.
word_35AF8 dw 0
    db 68 dup(0)
g_vtxScale dw 0
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
g_clipVtxA0 dw 0
g_clipVtxA1 dw 0
g_clipVtxA2 dw 0
g_clipVtxA3 dw 0
g_clipVtxB0 dw 0
g_clipVtxB1 dw 0
g_clipVtxB2 dw 0
g_clipVtxB3 dw 0
    db 8 dup(0)
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
g_dacGroundPalette db 3 dup(34h), 2Fh, 33h, 2Fh, 2Ch, 32h, 2Bh, 27h, 31h
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
g_dacGroundPaletteSrc db 3 dup(34h), 33h, 31h, 2Fh, 32h, 2Fh, 2Ch, 32h, 2Dh
    db 28h, 31h, 2Ah, 24h, 30h, 28h, 20h, 30h, 26h, 1Dh, 2Fh
    db 24h, 19h, 2Eh, 22h, 16h, 2Eh, 20h, 12h, 2Dh, 1Eh, 0Fh
    db 2Ch, 1Ch, 0Ch, 2Ch, 1Ah, 9, 2Bh, 18h, 6, 2Ah, 16h, 3
    db 2Ah, 15h, 0
g_sineTableBase dw 0
g_sineTableDelta dw 324h
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
g_spanMinX db 0FFh
    db 439 dup(0FFh)
g_spanMaxX db 0
    db 439 dup(0)
    db 0
PUBLIC cbreakHit
cbreakHit db 0
origCBreakSeg dw 0
_origCBreakSeg equ origCBreakSeg
origCBreakOfs dw 0
    db 0 ;align 2
timerHandlerInstalled db 0
    db 2 dup(0)
g_tapeText0Page dw 0
    db 2
    db 0
    db 0Fh
    db 3 dup(0)
g_tapeText0X dw 0
g_tapeText0Y dw 0
g_tapeText0Font dw 0
g_tapeText0ClipTop dw 40h
g_tapeText0ClipBottom dw 5Eh
    db 2 dup(0)
    db 40h
    db 1
g_tapeText1Page dw 0
    db 2
    db 0
    db 0Fh
    db 3 dup(0)
g_tapeText1X dw 0
g_tapeText1Y dw 0Ah
g_tapeText1Font dw 0
    db 0 ;align 4
    db 0
    db 0C8h
    db 0
g_tapeText1ClipX1 dw 5Ah
g_tapeText1ClipX2 dw 0E6h
g_tapeText2Page dw 0
    db 2
    db 0
    db 7
    db 3 dup(0)
g_tapeText2X dw 0
g_tapeText2Y dw 0
g_tapeText2Font dw 0
g_tapeText2ClipTop dw 14h
    db 5Fh
    db 0
g_tapeText2ClipX1 dw 4Eh
g_tapeText2ClipX2 dw 0F1h
g_tapeText3Page dw 0
    db 2
    db 0
    db 0Fh
    db 3 dup(0)
g_tapeText3X dw 0
g_tapeText3Y dw 10h
g_tapeText3Font dw 0
    db 14h
    db 0
    db 6Bh
    db 0
    db 4Eh
    db 0
    db 86h
    db 1
g_tapeSprite0BufPtr dw 0
    db 2 dup(0)
g_tapeSprite0SrcY dw 0
g_tapeSprite0Page dw 0
g_tapeSprite0DstX dw 5Ah
g_tapeSprite0DstY dw 10h
g_tapeSprite0Width dw 8Dh
g_tapeSprite0Height dw 3
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
g_tapeSprite1BufPtr dw 0
g_tapeSprite1SrcX dw 0
g_tapeSprite1SrcY dw 29h
g_tapeSprite1Page dw 0
g_tapeSprite1DstX dw 93h
g_tapeSprite1DstY dw 2Eh
g_tapeSprite1Width dw 19h
g_tapeSprite1Height dw 11h
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
g_tapeSprite2BufPtr dw 0
    db 0B8h
    db 0
    db 10h
    db 0
g_tapeSprite2Page dw 0
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
g_tapeSprite3BufPtr dw 0
    db 0B8h
    db 0
    db 10h
    db 0
g_tapeSprite3Page dw 0
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
g_headingBase db 6Dh
g_tapeOriginX dw 61h
g_tapeCursorBackShift db 8
g_tapeTickPitch dw 0Ah
g_tapeScaleShift db 0
g_speedTapeTickStep dw 62h
g_altTapeTickStep dw 0FFh
g_headingPixPerDeg dw 2Dh
g_compassWrapLimit dw 0F8h
g_headingModulus dw 0
g_headingWrapOffset dw 0
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
g_altRemainder dw 0
g_compassScrollIdx dw 0
g_compassDrawX dw 0
g_tapeRenderX dw 0
byte_37C2D db 0
g_tapePageCounter db 0
word_37C30 dw 0
word_37C32 dw 3030h
    db 0
g_tapeRenderMode db 0
word_37C36 dw 0
    db 4Bh
    db 0
; var_468 (DGROUP 0x538a): speed/altitude tape scale scratch buffer.
; g_compassTapeBuf (the heading/compass tape buffer) was wrongly labelled here, 0xB0
; bytes too early, so g_compassTapeBuf+132 (the "000 045 090 135 180 225 270 315"
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
g_compassTapeBuf db 20h                ; DGROUP 0x543a: heading/compass tape buffer
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
g_tapeSegmentCount dw 0
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
g_tapeDrawStr dw 0
g_tapeDrawStrY dw 0
g_tapeRollOfsB0 dw 0
g_tapeRollOfsB1 dw 0
g_tapeRollOfsB2 dw 0
g_tapeRollOfsB3 dw 0
g_tapeRollOfsA0 dw 0
g_tapeRollOfsA1 dw 0
g_tapeRollOfsA2 dw 0
g_tapeRollOfsA3 dw 0
PUBLIC joyData
PUBLIC word_37F6C
PUBLIC word_37F74
PUBLIC word_37F7C
PUBLIC word_37F84
PUBLIC g_joyCountX
PUBLIC g_joyCountY
joyData db 8 dup(0)
word_37F6C dw 0
    db 6 dup(0)
word_37F74 dw 0
    db 6 dup(0)
word_37F7C dw 0
    db 6 dup(0)
word_37F84 dw 0
    db 6 dup(0)
g_joyCountX dw 0
g_joyCountY dw 0
    db 4 dup(0)
    db 2 dup(0)
g_kbdActiveScan db 0
g_kbdLastTick dw 0
g_kbdPrevScan db 0
g_kbdLastDirKey db 0
g_kbdDelayCounter db 0
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
    db 0
_g_viewZ dw 0
    db 0Ch
    db 5 dup(0)
    db 3 dup(0)
    db 0
    db 1
    db 0
    db 2 dup(0)
    db 0
    db 0 ;align 2
    db 0 ;align 2
    db 0 ;align 2
    db 0    ; was aEmpty_5950 (empty string, now in egdata.c)
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
g_picBlitBytesRemaining dw 0
tmpPageIndex dw 0
rowOffset dw 0
    db 0 ;align 4
    db 0
g_picBlitCurrentRow dw 0
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
word_38A3A dw offset lzw_processFlag
buf6data_3 db 0
    db 25 dup(0)
    db 1
    db 2 dup(0)
    db 2
    db 116 dup(0)
word_38BC6 dw offset buf6data_3
word_38D5A dw 0
g_picLookupResult dw 0
g_picByte dw 0
byte_38D60 db 0
g_picNumberDictSlots db 0
byte_38D62 db 0
g_picFileWord db 0
word_38D64 dw 0
g_picByteUnsignedFlag dw 0
word_38D68 dw 0
byte_38D6A db 0
byte_38D6B db 0
word_38D6C dw 0
byte_38D6E db 0
    db 506 dup(0)
; --- Backing storage for _var_* labels whose original targets didn't exist ---
word_33BB8 dw 0     ; _var_143
word_38896 dw 0     ; _var_605
word_389DC dw 0     ; _var_608
; ==============================================================================
; --- Symbolic labels for code references ---
_var_143 EQU word_33BB8
_uvar_547 EQU _g_viewZ
_var_605 EQU word_38896
_var_606 EQU g_picBlitBytesRemaining
_var_608 EQU word_389DC
_var_609 EQU g_picBlitCurrentRow
_var_610 EQU readFromFilePtr
_var_687 EQU lzw_readBufEndPtr
_var_688 EQU lzw_workDataPtr
_var_689 EQU lzw_rowLength
_var_690 EQU lzw_processFlag
_var_692 EQU lzw_bitWidth
_var_694 EQU lzw_maxCode
_var_697 EQU lzw_bitsLeft
_var_699 EQU lzw_slotCounter
_var_700 EQU lzw_dictIndex

.DATA?
IFDEF DEBUG
PUBLIC __bss_start
ENDIF
__bss_start label byte
ORG 00000h
; LZW pic decoder traversal scratch. shared/pic_lzw.inc (bound in egcode.asm)
; runs the dictionary chain as a coroutine on the CPU stack seeded at
; picWorkData; pushes grow downward into the bytes below the label. Mirrors the
; _picWorkData scratch in stslots.asm / endslots.asm.
    db 201h dup(?)
PUBLIC _picWorkData
_picWorkData label byte
_g_sphereTiltZ label byte
    db ? ;align 4
    db ?

; TileSceneObject storage.
; 571 full records * 7 bytes + 3 spare bytes = 4000 bytes. => #define MAX_TILE_DATA 4000

    db ? ;align 2
PUBLIC byte_36BAE
PUBLIC g_spanMaxX
PUBLIC word_35AF8
PUBLIC g_vtxScale
PUBLIC g_clipVtxA0
PUBLIC g_clipVtxA1
PUBLIC g_clipVtxA2
PUBLIC g_clipVtxA3
PUBLIC g_clipVtxB0
PUBLIC g_clipVtxB1
PUBLIC g_clipVtxB2
PUBLIC g_clipVtxB3
PUBLIC word_38A3A
PUBLIC word_38BC6
    db ? ;align 400h
    db 511 dup(?)
    db ? ;align 2
    db 12 dup(?)

__bss_end label byte

END
