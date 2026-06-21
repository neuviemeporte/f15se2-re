.8086
DOSSEG
.MODEL SMALL


PUBLIC g_spanMinX
PUBLIC g_tapeSegmentCount
PUBLIC _origCBreakSeg
PUBLIC _audio_setEnginePitch
PUBLIC _audio_setup
PUBLIC _audio_shutdown
PUBLIC _audio_playSound
PUBLIC _audio_playSample
PUBLIC _audio_engineDroneOn
PUBLIC _audio_engineDroneOff
PUBLIC g_kbdActiveScan
PUBLIC g_kbdLastTick
PUBLIC g_kbdPrevScan
PUBLIC g_kbdLastDirKey
PUBLIC g_kbdDelayCounter
PUBLIC g_kbdDirKeyTable
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
PUBLIC picOvlPageIndex
PUBLIC picOvlRowOffset
PUBLIC readFromFilePtr
PUBLIC lzw_readBufEndPtr
PUBLIC lzw_workDataPtr
PUBLIC lzw_rowLength
PUBLIC lzw_processFlag
PUBLIC lzw_bitWidth
PUBLIC lzw_maxCode
PUBLIC lzw_bitsLeft
PUBLIC lzw_slotCounter
PUBLIC lzw_dictIndex
PUBLIC aF15dgtl_bin
PUBLIC aFileClosingError
PUBLIC aFileNotFound
PUBLIC aNoFileBuffersAvailabl
PUBLIC aOpenError
PUBLIC audio_timerTick
PUBLIC audio_noiseTick
PUBLIC g_picNumberDictSlots
PUBLIC g_picFileWord
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

; --- data symbols (definitions in .DATA / .DATA? below) ---
PUBLIC cbreakHit
PUBLIC joyData
PUBLIC word_37F6C
PUBLIC word_37F74
PUBLIC word_37F7C
PUBLIC word_37F84
PUBLIC g_joyCountX
PUBLIC g_joyCountY
PUBLIC aReadError
PUBLIC aWriteError
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
PUBLIC _picWorkData

.DATA ;dseg segment para public 'DATA' use16

aF15dgtl_bin db 'F15DGTL.BIN',0
f15dgtlAddr dw 0
ovlInsaneFlag db 0
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
cbreakHit db 0
origCBreakSeg dw 0
_origCBreakSeg equ origCBreakSeg
origCBreakOfs dw 0
    db 0 ;align 2
timerHandlerInstalled db 0
    db 2 dup(0)
g_tapeSegmentCount dw 0
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
; keyboard scancode -> direction-key bitmask table; egseg3 indexes it by
; (scancode - 29h), range 0..28h, via xlat on offset g_kbdDirKeyTable.
g_kbdDirKeyTable db 1
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
aFileNotFound db ':File not found$'
aNoFileBuffersAvailabl db ':No file buffers available$'
aOpenError db ':Open error $'
aFileClosingError db 'File closing error$'
aReadError db 'Read error$'
aWriteError db 'Write error$'
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
; --- LZW decoder state ---
lzw_readBufEndPtr dw 0
lzw_workDataPtr dw 0
lzw_rowLength dw 0
lzw_processFlag dw 0
lzw_bitWidth dw 0
lzw_maxCode dw 0
lzw_bitsLeft dw 0
lzw_slotCounter dw 0
lzw_dictIndex dw 0
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
; --- Pic-overlay blit temps (page index / row offset) ---
picOvlPageIndex dw 0
picOvlRowOffset dw 0
; ==============================================================================

.DATA?
IFDEF DEBUG
PUBLIC __bss_start
ENDIF
__bss_start label byte
; LZW pic decoder traversal scratch. shared/pic_lzw.inc (bound in egcode.asm)
; runs the dictionary chain as a coroutine on the CPU stack seeded at
; picWorkData; pushes grow downward into the bytes below the label. Mirrors the
; _picWorkData scratch in stslots.asm / endslots.asm.
    db 201h dup(?)
_picWorkData label byte

__bss_end label byte

END
