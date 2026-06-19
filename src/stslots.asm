.8086
DOSSEG
.MODEL SMALL

; Overlay jump table slots - patched at runtime by setupOverlaySlots.
; Each slot is 5 bytes: db 0EAh (far jmp opcode) + dd 0 (target, filled in).
; The slots MUST remain contiguous with 5-byte stride.
PUBLIC _gfx_allocPage
PUBLIC _gfx_drawString
PUBLIC _gfx_setPage1
PUBLIC _gfx_setPageN
PUBLIC _gfx_setCurPageSeg
PUBLIC _gfx_getCurPageSeg
PUBLIC _gfx_blitSprite
PUBLIC _gfx_getBufSize
PUBLIC _gfx_setBlitOffset
PUBLIC _gfx_drawLine
PUBLIC _gfx_setDrawColor
PUBLIC _gfx_setColor
PUBLIC _gfx_nop22
PUBLIC _gfx_nop23
PUBLIC _gfx_dirtyRect
PUBLIC _gfx_dirtyRect2
PUBLIC _gfx_switchColor
PUBLIC _gfx_copyRect
PUBLIC _gfx_setFont
PUBLIC _gfx_blitToCurrent
PUBLIC _gfx_getAuxBufSize
PUBLIC _gfx_fillRow
PUBLIC _gfx_fillRow2
PUBLIC _gfx_copyRow
PUBLIC _gfx_nop36
PUBLIC _gfx_nop37
PUBLIC _gfx_getPageSeg
PUBLIC _gfx_getRowOffset
PUBLIC _gfx_clearPage
PUBLIC _gfx_setMode13
PUBLIC _gfx_setFadeSteps
PUBLIC _gfx_calcRowAddr
PUBLIC _gfx_getModecode
PUBLIC _gfx_setOvlVal1
PUBLIC _gfx_setOvlVal2
PUBLIC _gfx_setDac
PUBLIC _gfx_waitRetrace
PUBLIC _gfx_flipPage
PUBLIC _gfx_storeBufPtr
PUBLIC _gfx_getVal
PUBLIC _gfx_commitPage
PUBLIC _gfx_nop51
PUBLIC _gfx_setMonoFlag
PUBLIC _misc_checkKeyBuf
PUBLIC _misc_getKey
PUBLIC _misc_readJoystick
PUBLIC _misc_clearKeyFlags
PUBLIC _audio_setup
PUBLIC _audio_shutdown
PUBLIC _audio_playIntro
PUBLIC _audio_timerTick
PUBLIC _audio_noiseTick

; Dirty rect buffers - MUST be contiguous (overlay hardcodes offset +0x1B8)
PUBLIC _dirtyMinBuf
PUBLIC _dirtyMaxBuf
PUBLIC _dirtyRectMin
PUBLIC _dirtyRectMax

; LZW pic decoder contiguous block
PUBLIC _picDictionaryIndex
PUBLIC _picWorkData
PUBLIC _picDecodeDictionary
PUBLIC _picDecodeIncrement
PUBLIC _clipDivZeroHandler

.DATA

; === Overlay jump table (slots 0x00 - 0x6d) ===
; Graphics slots 0x00-0x53
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
_gfx_setPage1 proc far               ; slot 0d
    db 0EAh, 4 dup(0)
_gfx_setPage1 endp
_gfx_setPageN proc far               ; slot 0e
    db 0EAh, 4 dup(0)
_gfx_setPageN endp
_gfx_setCurPageSeg proc far          ; slot 0f
    db 0EAh, 4 dup(0)
_gfx_setCurPageSeg endp
_gfx_getCurPageSeg proc far         ; slot 10
    db 0EAh, 4 dup(0)
_gfx_getCurPageSeg endp
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
_gfx_setBlitOffset proc far          ; slot 1a
    db 0EAh, 4 dup(0)
_gfx_setBlitOffset endp
    db 0EAh, 4 dup(0)               ; slot 1b
    db 0EAh, 4 dup(0)               ; slot 1c
    db 0EAh, 4 dup(0)               ; slot 1d
    db 0EAh, 4 dup(0)               ; slot 1e
_gfx_drawLine proc far               ; slot 1f
    db 0EAh, 4 dup(0)
_gfx_drawLine endp
_gfx_setDrawColor proc far          ; slot 20
    db 0EAh, 4 dup(0)
_gfx_setDrawColor endp
_gfx_setColor proc far               ; slot 21
    db 0EAh, 4 dup(0)
_gfx_setColor endp
_gfx_nop22 proc far        ; slot 22
    db 0EAh, 4 dup(0)
_gfx_nop22 endp
_gfx_nop23 proc far       ; slot 23
    db 0EAh, 4 dup(0)
_gfx_nop23 endp
    db 0EAh, 4 dup(0)               ; slot 24
_gfx_dirtyRect proc far              ; slot 25
    db 0EAh, 4 dup(0)
_gfx_dirtyRect endp
    db 0EAh, 4 dup(0)               ; slot 26
    db 0EAh, 4 dup(0)               ; slot 27
_gfx_dirtyRect2 proc far             ; slot 28
    db 0EAh, 4 dup(0)
_gfx_dirtyRect2 endp
_gfx_switchColor proc far            ; slot 29
    db 0EAh, 4 dup(0)
_gfx_switchColor endp
_gfx_copyRect proc far               ; slot 2a
    db 0EAh, 4 dup(0)
_gfx_copyRect endp
    db 0EAh, 4 dup(0)               ; slot 2b
    db 0EAh, 4 dup(0)               ; slot 2c
    db 0EAh, 4 dup(0)               ; slot 2d
    db 0EAh, 4 dup(0)               ; slot 2e
_gfx_setFont proc far                ; slot 2f
    db 0EAh, 4 dup(0)
_gfx_setFont endp
_gfx_blitToCurrent proc far          ; slot 30
    db 0EAh, 4 dup(0)
_gfx_blitToCurrent endp
_gfx_getAuxBufSize proc far          ; slot 31
    db 0EAh, 4 dup(0)
_gfx_getAuxBufSize endp
    db 0EAh, 4 dup(0)               ; slot 32
_gfx_fillRow proc far                ; slot 33
    db 0EAh, 4 dup(0)
_gfx_fillRow endp
_gfx_fillRow2 proc far               ; slot 34
    db 0EAh, 4 dup(0)
_gfx_fillRow2 endp
_gfx_copyRow proc far                ; slot 35
    db 0EAh, 4 dup(0)
_gfx_copyRow endp
_gfx_nop36 proc far                  ; slot 36
    db 0EAh, 4 dup(0)
_gfx_nop36 endp
_gfx_nop37 proc far                  ; slot 37
    db 0EAh, 4 dup(0)
_gfx_nop37 endp
_gfx_getPageSeg proc far             ; slot 38
    db 0EAh, 4 dup(0)
_gfx_getPageSeg endp
    db 0EAh, 4 dup(0)               ; slot 39
_gfx_getRowOffset proc far           ; slot 3a
    db 0EAh, 4 dup(0)
_gfx_getRowOffset endp
_gfx_clearPage proc far              ; slot 3b
    db 0EAh, 4 dup(0)
_gfx_clearPage endp
_gfx_setMode13 proc far              ; slot 3c
    db 0EAh, 4 dup(0)
_gfx_setMode13 endp
_gfx_setFadeSteps proc far           ; slot 3d
    db 0EAh, 4 dup(0)
_gfx_setFadeSteps endp
_gfx_calcRowAddr proc far            ; slot 3e
    db 0EAh, 4 dup(0)
_gfx_calcRowAddr endp
_gfx_getModecode proc far            ; slot 3f
    db 0EAh, 4 dup(0)
_gfx_getModecode endp
_gfx_setOvlVal1 proc far             ; slot 40
    db 0EAh, 4 dup(0)
_gfx_setOvlVal1 endp
_gfx_setOvlVal2 proc far             ; slot 41
    db 0EAh, 4 dup(0)
_gfx_setOvlVal2 endp
    db 0EAh, 4 dup(0)               ; slot 42
    db 0EAh, 4 dup(0)               ; slot 43
_gfx_setDac proc far                 ; slot 44
    db 0EAh, 4 dup(0)
_gfx_setDac endp
_gfx_waitRetrace proc far            ; slot 45
    db 0EAh, 4 dup(0)
_gfx_waitRetrace endp
_gfx_flipPage proc far               ; slot 46
    db 0EAh, 4 dup(0)
_gfx_flipPage endp
    db 0EAh, 4 dup(0)               ; slot 47
    db 0EAh, 4 dup(0)               ; slot 48
    db 0EAh, 4 dup(0)               ; slot 49
    db 0EAh, 4 dup(0)               ; slot 4a
_gfx_storeBufPtr proc far            ; slot 4b
    db 0EAh, 4 dup(0)
_gfx_storeBufPtr endp
    db 0EAh, 4 dup(0)               ; slot 4c
    db 0EAh, 4 dup(0)               ; slot 4d
_gfx_getVal proc far                 ; slot 4e
    db 0EAh, 4 dup(0)
_gfx_getVal endp
    db 0EAh, 4 dup(0)               ; slot 4f
_gfx_commitPage proc far             ; slot 50
    db 0EAh, 4 dup(0)
_gfx_commitPage endp
_gfx_nop51 proc far                  ; slot 51
    db 0EAh, 4 dup(0)
_gfx_nop51 endp
    db 0EAh, 4 dup(0)               ; slot 52
_gfx_setMonoFlag proc far            ; slot 53
    db 0EAh, 4 dup(0)
_gfx_setMonoFlag endp

; Slots 54-59 (unused in start.exe, zeroed)
    db 30 dup(0)

; Misc/input slots 5a-5f
_misc_checkKeyBuf proc far        ; slot 5a
    db 0EAh, 4 dup(0)
_misc_checkKeyBuf endp
_misc_getKey proc far        ; slot 5b
    db 0EAh, 4 dup(0)
_misc_getKey endp
    db 0EAh, 4 dup(0)               ; slot 5c
_misc_readJoystick proc far       ; slot 5d
    db 0EAh, 4 dup(0)
_misc_readJoystick endp
_misc_clearKeyFlags proc far  ; slot 5e
    db 0EAh, 4 dup(0)
_misc_clearKeyFlags endp
    db 0EAh, 4 dup(0)               ; slot 5f

; Slots 60-63 (unused padding)
    db 20 dup(0)

; Audio slots 64-6d
_audio_setup proc far              ; slot 64
    db 0EAh, 4 dup(0)
_audio_setup endp
_audio_shutdown proc far              ; slot 65
    db 0EAh, 4 dup(0)
_audio_shutdown endp
    db 0EAh, 4 dup(0)               ; slot 66
_audio_playIntro proc far              ; slot 67
    db 0EAh, 4 dup(0)
_audio_playIntro endp
    db 0EAh, 4 dup(0)               ; slot 68
    db 0EAh, 4 dup(0)               ; slot 69
    db 0EAh, 4 dup(0)               ; slot 6a
_audio_timerTick proc far              ; slot 6b
    db 0EAh, 4 dup(0)
_audio_timerTick endp
_audio_noiseTick proc far              ; slot 6c
    db 0EAh, 4 dup(0)
_audio_noiseTick endp
    db 0EAh, 4 dup(0)               ; slot 6d

; === Dirty rect buffers (MUST be contiguous) ===
; Overlay slot 0x28 hardcodes dirtyMaxBuf = dirtyMinBuf + 0x1B8
_dirtyMinBuf db 1B8h dup(0FFh)
_dirtyMaxBuf db 0D5h dup(0)
    db 2 dup(0)
    db 0E1h dup(0)
    dw 0
    dw 0
_dirtyRectMin dw 0FFFFh
_dirtyRectMax dw 0

; === LZW pic decoder contiguous block ===
; dictionaryIndex (0x201 bytes) + picWorkData (3 bytes) +
; picDecodeDictionary/picDecodeIncrement/clipDivZeroHandler (0x1800 bytes)
; All MUST remain contiguous.
_picDictionaryIndex db 0
    db 200h dup(0)
_picWorkData db 0
    db 2 dup(0)
_picDecodeDictionary dw 0
_picDecodeIncrement db 0
    db 260h dup(0)
_clipDivZeroHandler db 0
    db 159Ch dup(0)
END
