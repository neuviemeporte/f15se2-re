DOSSEG
.8086
.MODEL SMALL

DOS_SET_IRQH	 = 25h
IRQ_PIT		 = 8
IRQ_CBREAK	 = 1Bh
PORT_PIT_TIME0	 = 40h
PORT_PIT_CNTRL	 = 43h
BDA_CRTC	 = 463h
OVL_HDR_SIZE1	 = 1Eh
OVL_HDR_SIZE2	 = 20h


IFDEF DEBUG
    EXTRN _my_fartrace:PROC

    trace MACRO msg,v1,v2,v3,v4,v5
        popsize = 4
        push es
        push ax
        push bx
        IFNB <v5>
        push [v5]
        popsize = popsize + 2
        ENDIF
        IFNB <v4>
        push [v4]
        popsize = popsize + 2
        ENDIF
        IFNB <v3>
        push [v3]
        popsize = popsize + 2
        ENDIF
        IFNB <v2>
        push [v2]
        popsize = popsize + 2
        ENDIF
        IFNB <v1>
        push [v1]
        popsize = popsize + 2
        ENDIF
        mov ax,offset msg
        push cs
        push ax
        call _my_fartrace
        add sp,popsize
        pop bx
        pop ax
        pop es
    ENDM

    regtrace MACRO
        push es
        push ax
    ;   regstr db 'regs: ax=%x bx=%x cx=%x dx=%x si=%x di=%x ds=%x es=%x'
        push es
        push ds
        push di
        push si
        push dx
        push cx
        push bx
        push ax
        mov ax,offset regstr
        push cs
        push ax
        call _my_fartrace
        add sp,20
        pop ax
        pop es
    ENDM
ELSE
    trace MACRO msg,v1,v2,v3,v4,v5
    ENDM

    regtrace MACRO
    ENDM
ENDIF

EXTRN _gfx_jump_38_getPageBuf:FAR
EXTRN _gfx_jump_3b_clearBuf:FAR
EXTRN _gfx_jump_33_fillRow:FAR
EXTRN _gfx_jump_35:FAR
EXTRN _gfx_jump_0_alloc:FAR
EXTRN _gfx_jump_10_getCurBuf:FAR
EXTRN _gfx_jump_0d_setCurBuf:FAR
EXTRN _gfx_jump_20_setVal:FAR
EXTRN _gfx_jump_28:FAR
EXTRN _gfx_jump_22:FAR
EXTRN _gfx_jump_51_null:FAR
EXTRN _gfx_jump_0f_getBufPtr:FAR
EXTRN _gfx_jump_1f:FAR
EXTRN _audio_jump_6b:FAR
EXTRN _gfx_jump_3a_getRowOffset:FAR
EXTRN _gfx_jump_34_fillRow:FAR
EXTRN _gfx_jump_36_null:FAR
EXTRN _audio_jump_6c:FAR
EXTRN _word_172AE:WORD
EXTRN _word_172B8:WORD
EXTRN _word_172A4:WORD
EXTRN _word_172A6:WORD
EXTRN _timerHandlerInstalled:BYTE
EXTRN _word_172AA:WORD
EXTRN _byte_172A2:BYTE
EXTRN _byte_172B0:BYTE
EXTRN _byte_172B7:BYTE
EXTRN _word_172AC:WORD
EXTRN _word_172BA:WORD
EXTRN _word_172B5:WORD
EXTRN _word_172B1:WORD
EXTRN _word_172B3:WORD
EXTRN _word_172A8:WORD
EXTRN _timerCounter2: BYTE
EXTRN _timerCounter3:BYTE
EXTRN _timerCounter:BYTE
EXTRN _timerCounter4:BYTE
EXTRN _searchFCB:BYTE
EXTRN _readFromFilePtr:WORD
EXTRN _tmpFileHandle:WORD
EXTRN _tmpPageIndex:WORD
EXTRN _rowOffset:WORD
EXTRN _word_1737E:WORD
EXTRN _ovlInsaneFlag:BYTE
EXTRN _aAlloc1M:BYTE
EXTRN _ovlParCnt:WORD
EXTRN _aDosLied:BYTE
EXTRN _ovlSeg1:WORD
EXTRN _ovlSeg2:WORD
EXTRN _ovlParBlock:WORD
EXTRN _aFileNFound:BYTE
EXTRN _aEnoughMem:BYTE
EXTRN _aOvlFail:BYTE
EXTRN _aOvlOvrrun:BYTE
EXTRN _aOvlShrink:BYTE
EXTRN _word_1786A:WORD
EXTRN _word_1786C:WORD
EXTRN _word_17868:WORD
EXTRN _word_17866:WORD
EXTRN _byte_17A2F:BYTE
EXTRN _byte_17877:BYTE
EXTRN _word_17BEB:WORD
EXTRN _word_17BED:WORD
EXTRN _byte_19ADB:BYTE
EXTRN _lineX1:WORD
EXTRN _lineY1:WORD
EXTRN _lineX2:WORD
EXTRN _lineY2:WORD
EXTRN _word_17BF1:WORD
EXTRN _word_17BF5:WORD
EXTRN _byte_17BF0:BYTE
EXTRN _word_17BF3:WORD
EXTRN _word_17BF7:WORD
EXTRN _word_17BF9:WORD
EXTRN _word_17BFB:WORD
EXTRN _origCBreakSeg:WORD
EXTRN _origCBreakOfs:WORD
EXTRN _cbreakHit:BYTE
EXTRN _aFileNotFound:BYTE
EXTRN _aNoFileBuffersAvailable:BYTE
EXTRN _aOpenError:BYTE
EXTRN _fileReadPos:WORD
EXTRN _fileReadBuf:BYTE
EXTRN _aReadError:BYTE
EXTRN _errorCodeStr:WORD
EXTRN _row:WORD
EXTRN _screenBufSize:WORD
EXTRN _picDecodedRowBuf:BYTE
EXTRN _picWorkData:BYTE
EXTRN _readBufEndPtr:WORD
EXTRN _picFileWord:WORD
EXTRN _picRemainingBitCount:BYTE
EXTRN _picByte:BYTE
EXTRN _picTmp9BitCount:BYTE
EXTRN _picFileReadBufEnd:WORD
EXTRN _picDecodeDictionary:WORD
EXTRN _picDecodeIncrement:BYTE
EXTRN _picRowLength:WORD
EXTRN _picWorkDataPtr:WORD
EXTRN _picNumberDictSlots:WORD
EXTRN _picLookupResult:BYTE
EXTRN _picProcessFlag0_1:BYTE
EXTRN _picByteUnsignedFlag:BYTE
EXTRN _dictionaryIndex:BYTE
EXTRN _picSlotCounter:WORD
EXTRN _word_17858:WORD
EXTRN _word_17856:WORD
EXTRN _word_1783E:WORD
EXTRN _word_1782E:WORD
EXTRN _word_17846:WORD
EXTRN _word_17836:WORD
EXTRN _word_1784E:WORD
EXTRN _joyAxes:BYTE
EXTRN _diskTransferArea:BYTE
EXTRN _byte_172C6:BYTE
EXTRN _aFileClosingError:BYTE
EXTRN _aWriteError:BYTE

PUBLIC _mystrlen
PUBLIC _mystrcat
PUBLIC _showPicFile
PUBLIC _copyJoystickData
PUBLIC _restoreTimerIrqHandler
PUBLIC _intDispatch
PUBLIC _installCBreakHandler
PUBLIC _dos_alloc
PUBLIC _loadOverlay
PUBLIC _dos_printstring
PUBLIC _clearRect
PUBLIC _restoreCbreakHandler
PUBLIC _setTimerIrqHandler
PUBLIC _getTimeOfDay
PUBLIC _decodePic
PUBLIC _nearmemset
PUBLIC _openFile
PUBLIC _picBlit
PUBLIC _setupOverlaySlots
PUBLIC _pollJoystick
PUBLIC _doFcbSearch
PUBLIC _doNothing2
PUBLIC _drawLineWrapper
PUBLIC _fileClose

;startCode1 segment word public 'CODE' ;startCode1 segment byte public 'CODE'
.CODE

regstr db 'regs: ax=%04X bx=%04X cx=%04X dx=%04X si=%04X di=%04X ds=%04X es=%04X',0

timerIrqAddr	dd timerIrqHandler
word_12983	dw 0

_doNothing2 proc near
    retn
_doNothing2 endp

nullsub_1 proc near
    retn
nullsub_1 endp

; ------------------------------startCode1:0x185a------------------------------
TIMER_VAR_74 EQU <word ptr _word_172AE>
TIMER_VAR_80 EQU <word ptr _word_172B8>
TIMER_VAR_70 EQU <word ptr _word_172A4>
TIMER_VAR_71 EQU <word ptr _word_172A6>
TIMER_CALIBRATE EQU <calibrateTimerSpeed>
TIMER_ISR_PTR EQU <timerIsrPtr+1>
TIMER_IRQ_ADDR EQU <dword ptr timerIrqAddr>
TIMER_INSTALLED EQU <_timerHandlerInstalled>
INCLUDE shared/timer_setHandler.inc
; ------------------------------startCode1:0x1897------------------------------
; ------------------------------startCode1:0x1898------------------------------
_restoreTimerIrqHandler proc near
    mov al, 110110b
    out PORT_PIT_CNTRL, al ;prepare PIT
    jmp short $+2
    xor al, al
    out PORT_PIT_TIME0, al ;send LSB of timer count
    jmp short $+2
    out PORT_PIT_TIME0, al ;send MSB
    push ds
    mov ah, DOS_SET_IRQH
    mov al, IRQ_PIT
    lds dx, dword ptr cs:timerIsrPtr+1
    int 21h ;DOS - SET INTERRUPT VECTOR
    pop ds
    mov _timerHandlerInstalled, 0
    retn
_restoreTimerIrqHandler endp
; ------------------------------startCode1:0x18b8------------------------------
; ------------------------------startCode1:0x18e7------------------------------
timerIrqHandler proc far
    sti
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push bp
    push ds
    push es
    mov ax, @data
    mov ds, ax
    mov ax, _word_172AA
    add _word_172A4, ax
    adc _word_172A6, 0
    dec _word_172B8
    jnz short loc_11919
    mov ax, _word_172AE
    mov _word_172B8, ax
    call timerIrqCallback
    mov _byte_172A2, 0
    call increaseTimerCounters
loc_11919:
    cmp _word_172AE, 1
    jz short loc_11925
    call far ptr _audio_jump_6c
loc_11925:
    cmp _word_172A6, 0
    jnz short loc_1193A
    mov al, 20h
    out 20h, al ;Interrupt controller, 8259A.
    pop es
    pop ds
    pop bp
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    iret
loc_1193A:
    dec _word_172A6
    pop es
    pop ds
    pop bp
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    cli
timerIsrPtr:
    db 0EAh ;jmp far ptr 0:0
    dd 0
timerIrqHandler endp
; ------------------------------startCode1:0x1948------------------------------
; ------------------------------startCode1:0x194d------------------------------
; Called from timerIrqHandler. Decrements a tick divider; when it reaches zero,
; reprograms the 8253 PIT timer divisor, optionally waiting for video retrace
; to avoid glitches on CGA/MDA displays.
timerIrqCallback proc near
    dec _byte_172B0          ; tickDivider--
    jnz short loc_119D2      ; if not zero, skip
    mov _byte_172B0, 14h     ; reload divider = 20
    cmp _byte_172B7, 0       ; syncToRetrace flag
    jz short loc_119A0       ; if no sync needed, reprogram PIT directly
    ; Wait for vertical retrace before reprogramming timer
    xor bl, bl               ; previous vsync bit state
    xor cx, cx               ; loop counter (65536 iterations max)
    mov es, cx
    mov dx, es:BDA_CRTC      ; BIOS data area: CRTC base port
    add dx, 6                ; status register = CRTC base + 6
    cmp dx, 3BAh             ; MDA status port?
    jz short loc_11987
    ; CGA/EGA: wait for vertical retrace (bit 3)
loc_11973:
    cli
    in al, dx
    test al, 8               ; vertical retrace bit
    jnz short loc_119A0      ; retrace active, proceed
    sti
    and al, 1                ; horizontal retrace bit
    cmp al, bl               ; changed since last read?
    jz short loc_11973       ; no change, keep polling
    xor bl, 1                ; toggle expected state
    loop loc_11973           ; timeout counter
    jmp short loc_11999      ; timed out, skip reprogramming
    ; MDA: wait for vertical retrace (bit 7)
loc_11987:
    cli
    in al, dx
    test al, 80h             ; MDA vertical retrace bit
    jz short loc_119A0       ; retrace active, proceed
    sti
    and al, 1
    cmp al, bl
    jz short loc_11973
    xor bl, 1
    loop loc_11987
loc_11999:
    mov _byte_172B7, 0       ; clear sync flag (timed out)
    jmp short loc_119D2
    ; Reprogram PIT channel 0 with new divisor
loc_119A0:
    mov dx, _word_172AA      ; current PIT divisor
    cmp dx, _word_172A8      ; target PIT divisor
    jz short loc_119B2       ; already matches
    mov dx, _word_172A8      ; load new target
    mov _word_172AA, dx      ; update current
loc_119B2:
    mov al, 36h              ; PIT: channel 0, mode 3, lo/hi byte
    out 43h, al              ; PIT command register
    jmp short $+2            ; I/O delay
    mov al, dl               ; divisor low byte
    out 40h, al              ; PIT channel 0 data
    jmp short $+2            ; I/O delay
    mov al, dh               ; divisor high byte
    out 40h, al              ; PIT channel 0 data
    inc _word_172AC          ; tick counter++
    neg cx                   ; CX=0 if loop completed (timed out), nonzero otherwise
    mov _word_172BA, cx      ; store retrace-detected flag
    jz short loc_119D2       ; if timed out, don't increment
    inc _word_172B8           ; retrace-synced tick counter++
loc_119D2:
    sti
    retn
timerIrqCallback endp
; ------------------------------startCode1:0x19d3------------------------------
; ------------------------------startCode1:0x19d4------------------------------
calibrateTimerSpeed proc near
    pushf
    cli
    mov _byte_172B0, 1
    xor ax, ax
    mov _byte_172B7, 1
    mov _word_172B3, ax
    mov _word_172B5, ax
    call manipulateTimer
    mov bx, ax
    mov cx, 10h
loc_119F0:
    push bx
    call manipulateTimer
    pop bx
    sub bx, ax
    add _word_172B3, bx
    adc _word_172B5, 0
    mov bx, ax
    loop loc_119F0
    mov ax, _word_172B3
    mov dx, _word_172B5
    add _word_172A4, ax
    adc _word_172A6, dx
    mov cx, 10h
    div cx
    shr ax, 1
    mov _word_172B3, ax
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
    jb short loc_11A3D
    db 3Dh ;cmp ax, 6
    dw 6
    ja short loc_11A3D
    jmp short loc_11A4B
    nop
loc_11A3D:
    mov _byte_172B7, 0
    mov _word_172B3, 4DAEh
    mov ax, 5
loc_11A4B:
    mov _word_172B1, ax
    cmp _word_172AE, 1
    jz short loc_11A58
    mov _word_172AE, ax
loc_11A58:
    mov ax, _word_172B3
    xor dx, dx
    div _word_172AE
    mov _word_172AA, ax
    mov _word_172A8, ax
    popf
    retn
calibrateTimerSpeed endp
; ------------------------------startCode1:0x1a68------------------------------
; ------------------------------startCode1:0x1a69------------------------------
INCLUDE shared/timer_manipulate.inc
; ------------------------------startCode1:0x1abd------------------------------
; ------------------------------startCode1:0x1abe------------------------------
_getTimeOfDay proc near
    xor ah, ah
    int 1Ah ;CLOCK - GET TIME OF DAY
    mov ax, dx
    retn
_getTimeOfDay endp
; ------------------------------startCode1:0x1ac4------------------------------
; ------------------------------startCode1:0x1ac5------------------------------
increaseTimerCounters proc near
    inc _timerCounter2
    inc _timerCounter3
    inc _timerCounter
    inc _timerCounter4
    call far ptr _audio_jump_6b
    retn
increaseTimerCounters endp
; ------------------------------startCode1:0x1ada------------------------------
; ------------------------------startCode1:0x1adc------------------------------
_doFcbSearch proc near
    mov ah, 1Ah
    mov dx, offset _diskTransferArea
    int 21h ;DOS - SET DISK TRANSFER AREA ADDRESS
    mov ah, 11h
    mov dx, offset _searchFCB
    int 21h ;DOS - SEARCH FIRST USING FCB
    or al, al
    jnz short locret_11B02
    xor ah, ah
    mov bx, 0FFFFh
loc_11AF3:
    inc bx
    mov al, _byte_172C6[bx]
    or al, al
    jz short locret_11B02
    sub al, (_diskTransferArea+8)[bx]
    jz short loc_11AF3
locret_11B02:
    retn
_doFcbSearch endp
; ------------------------------startCode1:0x1b02------------------------------
; ------------------------------startCode1:0x1b03------------------------------
_picBlit proc near
    arg_0 = word ptr 4
    unk = word ptr 6
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ax, offset read512FromFileIntoBuf
    mov _readFromFilePtr, ax
    mov ax, [bp+arg_0]
    mov _tmpFileHandle, ax
    mov ax, [bp+unk]
    mov _tmpPageIndex, ax
    mov si, _tmpPageIndex
loc_11B20:
    call far ptr _gfx_jump_38_getPageBuf
    call far ptr _gfx_jump_3b_clearBuf ;zeroes out 32000 bytes
    mov _word_1737E, 0
    mov _rowOffset, 0
loc_11B36:
    mov di, _word_1737E
    shl di, 1
    call decodePicRow
    mov di, _rowOffset
    mov bp, offset _picDecodedRowBuf
loc_11B46:
    mov bx, _word_1737E
    call far ptr _gfx_jump_33_fillRow
    mov di, _rowOffset
    call far ptr _gfx_jump_35
    inc _word_1737E
    add _rowOffset, 28h
    cmp _word_1737E, 2BCh
    jnz short loc_11B36
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
locret_11B70:
    retn
_picBlit endp
; ------------------------------startCode1:0x1b70------------------------------
; ------------------------------startCode1:0x26fd------------------------------
_mystrlen proc near
    arg_0 = word ptr 4
    push bp
    mov bp, sp
    mov ax, [bp+arg_0]
loc_12703:
    mov bx, [bp+arg_0]
    inc [bp+arg_0]
    cmp byte ptr [bx], 0
    jnz short loc_12703
loc_1270E:
    mov bx, [bp+arg_0]
    sub ax, bx
    not ax
    mov sp, bp
    pop bp
    retn
_mystrlen endp
; ------------------------------startCode1:0x2718------------------------------
; ------------------------------startCode1:0x2719------------------------------
; --- shared strcat
INCLUDE shared/str_strcat.inc
_mystrcat equ mystrcat
; ------------------------------startCode1:0x2740------------------------------
; ------------------------------startCode1:0x2764------------------------------
_nearmemset proc near
    arg_0 = word ptr 4
    count = word ptr 6
    arg_4 = word ptr 8
    push bp
    mov bp, sp
    push di
    mov ax, ds
    mov es, ax
    mov al, byte ptr [bp+count]
    mov di, [bp+arg_0]
    mov cx, [bp+arg_4]
    rep stosb
    pop di
    pop bp
    retn
_nearmemset endp
; ------------------------------startCode1:0x2779------------------------------
; ------------------------------startCode1:0x27f5------------------------------
; --- shared interrupt dispatch routine
INCLUDE shared/overlay_dispatch.inc
_intDispatch equ intDispatch
; ------------------------------startCode1:0x2859------------------------------
; ------------------------------startCode1:0x2977------------------------------
; --- shared DOS print string routine
INCLUDE shared/file_printstring.inc
_dos_printstring equ dos_printstring
; ------------------------------startCode1:0x2982------------------------------
; ------------------------------startCode1:0x2985------------------------------
_loadOverlay proc near
    arg_0 = word ptr 4
    filename = word ptr 6
    push bp
loc_12986:
    mov bp, sp
    push di
    push si
    push es
    push ds
    push bp
    mov dx, [bp+arg_0]
    mov _ovlInsaneFlag, 0
    jmp short loc_1299D
    nop
    mov _ovlInsaneFlag, 1
loc_1299D:
    mov ax, @data
    mov es, ax
    push dx
    mov ah, 48h
    mov bx, 0FFFFh
    int 21h ;DOS - 2+ - ALLOCATE MEMORY
    jb short loc_129B6
    mov dx, offset _aAlloc1M ;"Allocated 1Mb of space????$"
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp loc_12A83
loc_129B6:
    mov ah, 48h
    sub bx, 400h
    mov _ovlParCnt, bx
    int 21h ;DOS - 2+ - ALLOCATE MEMORY
    jnb short loc_129CE
    mov dx, offset _aDosLied ;"MS-DOS lied to us about how much memory"...
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp loc_12A83
loc_129CE:
    mov _ovlSeg1, ax
    mov _ovlParBlock, ax
    mov _ovlSeg2, ax
    mov bx, offset _ovlParBlock
    mov ax, 4B03h
    pop dx
    mov cs:word_12983, sp
    int 21h ;DOS - 2+ - LOAD OR EXECUTE (EXEC)
    jnb short loc_12A0F
    db 3Dh ;cmp ax, 2
    dw 2
    jnz short loc_129F6
    mov dx, offset _aFileNFound ;"Filename not found$"
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp loc_12A83
loc_129F6:
    db 3Dh ;cmp ax, 8
    dw 8
    jnz short loc_12A05
    mov dx, offset _aEnoughMem ;"Not enough memory to load file$"
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp short loc_12A83
    nop
loc_12A05:
    mov dx, offset _aOvlFail ;"Overlay load failed for some reason$"
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp short loc_12A83
    nop
loc_12A0F:
    mov sp, cs:word_12983
    mov ax, @data
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov ax, _ovlSeg1
    mov es, ax
    mov di, OVL_HDR_SIZE1
    mov bx, es:[di]
    shr bx, 1
    shr bx, 1
    shr bx, 1
    shr bx, 1
    mov di, OVL_HDR_SIZE2
    mov cx, es:[di]
    shr cx, 1
    shr cx, 1
    shr cx, 1
    shr cx, 1
    add bx, cx
    cmp bx, _ovlParCnt
    jbe short loc_12A50
    mov dx, offset _aOvlOvrrun ;"Overlay has overrun allocated memory$"
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp short loc_12A83
    nop
loc_12A50:
    add bx, 8
    mov ah, 4Ah
    mov cx, _ovlSeg1
    mov es, cx
    int 21h ;DOS - 2+ - ADJUST MEMORY BLOCK SIZE (SETBLOCK)
    jnb short loc_12A69
    mov dx, offset _aOvlShrink ;"Unable to shrink overlay memory allocat"...
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp short loc_12A83
    nop
loc_12A69:
    mov ax, @data
    mov ds, ax
    mov es, ax
    mov ax, _ovlSeg1
    cmp _ovlInsaneFlag, 0
    jnz short locret_12A82
    pop bp
    pop ds
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
locret_12A82:
    retn
loc_12A83:
    mov ax, 4C00h
    int 21h ;DOS - 2+ - QUIT WITH EXIT CODE (EXIT)
_loadOverlay endp ;AL = exit code
; ------------------------------startCode1:0x2a86------------------------------
; ------------------------------startCode1:0x2a88------------------------------
; --- shared overlay slot setup routine
ovlInsaneFlag    EQU _ovlInsaneFlag
ovlJumpTable     EQU _gfx_jump_0_alloc
INCLUDE shared/overlay_slots.inc
_setupOverlaySlots equ setupOverlaySlots
; ------------------------------startCode1:0x2ae0------------------------------
msg14 db 'clearRect(): buf 0x%x %d %d %d %d',0
msg15 db 'clearRect(): destination 0x%x',0
; ------------------------------startCode1:0x2bba------------------------------
; --- shared clearRect
clearRectGetCurBuf EQU _gfx_jump_10_getCurBuf
clearRectSetCurBuf EQU _gfx_jump_0d_setCurBuf
clearRectSetVal    EQU _gfx_jump_20_setVal
clearRectJump28    EQU _gfx_jump_28
clearRectJump22    EQU _gfx_jump_22
clearRectNull      EQU _gfx_jump_51_null
clearRectGetBufPtr EQU _gfx_jump_0f_getBufPtr
clearRectVar27     EQU _word_17866
clearRectVar28     EQU _word_17868
clearRectVar29     EQU _word_1786A
clearRectVar30     EQU _word_1786C
clearRectVar35     EQU _byte_17877
clearRectVar36     EQU _byte_17A2F
clearRectVar37     EQU _word_17BEB
clearRectVar38     EQU _word_17BED
INCLUDE shared/gfx_clearrect.inc
_clearRect equ clearRect
; ------------------------------startCode1:0x2c58------------------------------
; ------------------------------startCode1:0x2c75------------------------------
; --- shared graphics routines (clearDirtyRects, drawLineWrapper, clipAndDrawLine, computeOutcode)
dirtyRectMin     EQU _word_17BEB
dirtyRectMax     EQU _word_17BED
dirtyMinBuf      EQU _byte_17877
dirtyMaxBuf      EQU _byte_17A2F
lineX1           EQU _lineX1
lineY1           EQU _lineY1
lineX2           EQU _lineX2
lineY2           EQU _lineY2
clipDx           EQU _word_17BF1
clipDy           EQU _word_17BF3
clipDxHalf       EQU _word_17BF5
clipDyHalf       EQU _word_17BF7
clipOutcode      EQU _byte_17BF0
clipMaxX         EQU _word_17BF9
clipMaxY         EQU _word_17BFB
clipDivZeroHandler EQU _byte_19ADB
CALL_GFX_1F MACRO
    call _gfx_jump_1f
ENDM
INCLUDE shared/gfx.inc
; ------------------------------startCode1:0x2f8a------------------------------
; ------------------------------startCode1:0x2f8a------------------------------
; ------------------------------startCode1:0x2fac------------------------------
; --- shared Ctrl+Break handler (installCBreakHandler, restoreCbreakHandler, getInterruptHandler, cbreakHandler)
cbreakSavedSeg   EQU _origCBreakSeg
cbreakSavedOfs   EQU _origCBreakOfs
cbreakFlag       EQU _cbreakHit
INCLUDE shared/cbreak.inc
; ------------------------------startCode1:0x2ffa------------------------------
; ------------------------------startCode1:0x311a------------------------------
; --- shared open file routine
fileNotFoundStr  EQU _aFileNotFound
fileNoBufsStr    EQU _aNoFileBuffersAvailable
fileOpenErrorStr EQU _aOpenError
fileReadPosVar   EQU _fileReadPos
fileErrorExit    EQU errorDescAndExit
INCLUDE shared/file_open.inc
_openFile equ openFile
; ------------------------------startCode1:0x3170------------------------------
; ------------------------------startCode1:0x31c8------------------------------
; --- shared file close routine
fileCloseErrorStr EQU _aFileClosingError
fileCloseErrExit  EQU errorAndExit
INCLUDE shared/file_close.inc
_fileClose equ fileClose
; ------------------------------startCode1:0x31e8------------------------------
msg12 db 'Reading from file handle %d',0
msg13 db 'Read success, count %d',0
; ------------------------------startCode1:0x326c------------------------------
; --- shared file read 512
fileRead512Handle EQU _tmpFileHandle
fileRead512Buf    EQU _fileReadBuf
fileRead512ErrStr EQU _aReadError
fileRead512ErrExit EQU errorAndExit
INCLUDE shared/file_read512.inc
; ------------------------------startCode1:0x328c------------------------------
; ------------------------------startCode1:0x32a5------------------------------
; --- shared file write
fileWriteErrStr  EQU _aWriteError
fileWriteErrExit EQU errorAndExit
INCLUDE shared/file_write.inc
; --- shared file error handler
fileErrorCodeStr EQU _errorCodeStr
INCLUDE shared/file_error.inc
; ------------------------------startCode1:0x3310------------------------------

msg1 db 'showPicFile(): entering, handle %d pagenum %d',0
msg2 db 'showPicFile(): after gfx_3b_clearbuf, handle %d pageidx %d',0
msg3 db 'showPicFile(): after fillrow',0
msg4 db 'showPicFile(): exiting',0
msg5 db 'showPicFile(): gfx_35 returned',0
msg6 db 'showPicFile(): ---row %u, rowOffset 0x%x',0
msg8 db 'showPicFile(): before loop, screenBufSize = 0x%x',0

; --- shared pic decoding routines
picFileReadPos       EQU _fileReadPos
picFileReadBuf       EQU _fileReadBuf
picDecodedRowBuf     EQU _picDecodedRowBuf
picRowLength         EQU _picRowLength
picScreenBufSize     EQU _screenBufSize
picPageIndex         EQU _tmpPageIndex
picRowOffset         EQU _rowOffset
picRow               EQU _row
picReadFromFilePtr   EQU _readFromFilePtr
picFileHandle        EQU _tmpFileHandle
picReadBufEndPtr     EQU _readBufEndPtr
picWorkData          EQU _picWorkData
picWorkDataPtr       EQU _picWorkDataPtr
picProcessFlag       EQU _picProcessFlag0_1
picLookupResult      EQU _picLookupResult
picFileWord          EQU _picFileWord
picRemainingBitCount EQU _picRemainingBitCount
picByteUnsignedFlag  EQU _picByteUnsignedFlag
picByte              EQU _picByte
picTmp9BitCount      EQU _picTmp9BitCount
picFileReadBufEnd    EQU _picFileReadBufEnd
picNumberDictSlots   EQU _picNumberDictSlots
picDecodeDictionary  EQU _picDecodeDictionary
picDecodeIncrement   EQU _picDecodeIncrement
picSlotCounter       EQU _picSlotCounter
picDictionaryIndex   EQU _dictionaryIndex
picInitRoutine       EQU nullsub_1
picReadFileFunc      EQU read512FromFileIntoBuf
INCLUDE shared/pic_showpicfile.inc
INCLUDE shared/pic_decodepic.inc
; ------------------------------startCode1:0x3585------------------------------
msg9 db 'decodePicRow(): finished making dict',0
msg10 db 'decodePicRow(): after doPicDecode',0
msg11 db 'decodePicRow(): exiting',0
; ------------------------------startCode1:0x3588------------------------------
INCLUDE shared/pic_lzw.inc
_showPicFile EQU showPicFile
_decodePic EQU decodePic
; ------------------------------startCode1:0x3754------------------------------
; ------------------------------startCode1:0x37b4------------------------------
; --- shared DOS memory allocate routine
INCLUDE shared/file_alloc.inc
_dos_alloc equ dos_alloc
; ------------------------------startCode1:0x37d9------------------------------
; ------------------------------startCode2:0x2f------------------------------
; --- shared joystick routines
joyRawAxis0      EQU _word_17856
joyRawAxis1      EQU _word_17858
joyMinValues     EQU _word_1782E
joyMaxValues     EQU _word_17836
joyCenterValues  EQU _word_1783E
joyRangeBelow    EQU _word_17846
joyRangeAbove    EQU _word_1784E
joyNormAxes      EQU _joyAxes
INCLUDE shared/joystick.inc
_pollJoystick equ pollJoystick
_copyJoystickData equ copyJoystickData
; ------------------------------startCode2:0xf6------------------------------


;startCode1 ends




end
