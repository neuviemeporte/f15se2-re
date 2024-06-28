.8086
.MODEL SMALL
DGROUP GROUP startData,startBss
ASSUME DS:DGROUP

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


startCode1 segment word public 'CODE' ;startCode1 segment byte public 'CODE'
; ------------------------------startCode1:0x185a------------------------------
_setTimerIrqHandler proc near
    mov word_172AE, 1
    mov word_172B8, 1
    mov word_172A4, 0
    mov word_172A6, 0
    call sub_119D4
    mov ah, 35h
    mov al, 8
    int 21h ;DOS - 2+ - GET INTERRUPT VECTOR
    mov word ptr cs:timerIsrPtr+1, bx
    mov word ptr cs:timerIsrPtr+3, es
    push ds
    mov ah, DOS_SET_IRQH
    mov al, 8
    lds dx, cs:timerIrqAddr
    int 21h ;DOS - SET INTERRUPT VECTOR
    pop ds
    mov _timerHandlerInstalled, 1
    retn
_setTimerIrqHandler endp
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
timerIrqAddr dd timerIrqHandler
; ------------------------------startCode1:0x19d4------------------------------
sub_119D4 proc near
    pushf
    cli
    mov byte_172B0, 1
    xor ax, ax
    mov byte_172B7, 1
    mov word_172B3, ax
    mov word_172B5, ax
    call sub_11A69
    mov bx, ax
    mov cx, 10h
loc_119F0:
    push bx
    call sub_11A69
    pop bx
    sub bx, ax
    add word_172B3, bx
    adc word_172B5, 0
    mov bx, ax
    loop loc_119F0
    mov ax, word_172B3
    mov dx, word_172B5
    add word_172A4, ax
    adc word_172A6, dx
    mov cx, 10h
    div cx
    shr ax, 1
    mov word_172B3, ax
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
    mov byte_172B7, 0
    mov word_172B3, 4DAEh
    mov ax, 5
loc_11A4B:
    mov word_172B1, ax
    cmp word_172AE, 1
    jz short loc_11A58
    mov word_172AE, ax
loc_11A58:
    mov ax, word_172B3
    xor dx, dx
    div word_172AE
    mov word_172AA, ax
    mov word_172A8, ax
    popf
    retn
sub_119D4 endp
; ------------------------------startCode1:0x1a68------------------------------
; ------------------------------startCode1:0x1a69------------------------------
sub_11A69 proc near
    pushf
    cli
    xor ax, ax
    mov es, ax
    mov dx, es:463h
    add dx, 6
    cmp dx, 3BAh
    jz short loc_11A94
    xor bx, bx
loc_11A7F:
    dec bx
    jz short loc_11ABA
    in al, dx
    test al, 8
    jnz short loc_11A7F
    xor bx, bx
loc_11A89:
    dec bx
    jz short loc_11ABA
    in al, dx
    test al, 8
    jz short loc_11A89
    jmp short loc_11AA8
    nop
loc_11A94:
    xor bx, bx
loc_11A96:
    dec bx
    jz short loc_11ABA
    in al, dx
    test al, 80h
    jz short loc_11A96
    xor bx, bx
loc_11AA0:
    dec bx
    jz short loc_11ABA
    in al, dx
    test al, 80h
    jnz short loc_11AA0
loc_11AA8:
    mov al, 0
    out 43h, al ;Timer 8253-5 (AT: 8254.2).
    jmp short $+2
    in al, 40h ;Timer 8253-5 (AT: 8254.2).
    jmp short $+2
    mov bl, al
    in al, 40h ;Timer 8253-5 (AT: 8254.2).
    jmp short $+2
    mov bh, al
loc_11ABA:
    mov ax, bx
    popf
    retn
sub_11A69 endp
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
    inc timerCounter2
    inc _timerCounter3
    inc _timerCounter
    inc timerCounter4
    call far ptr _audio_jump_6b
    retn
increaseTimerCounters endp
; ------------------------------startCode1:0x1ada------------------------------
; ------------------------------startCode1:0x1adc------------------------------
_sub_11ADC proc near
    mov ah, 1Ah
    mov dx, 7A9h
    int 21h ;DOS - SET DISK TRANSFER AREA ADDRESS
    mov ah, 11h
    mov dx, offset unk_172CD
    int 21h ;DOS - SEARCH FIRST USING FCB
    or al, al
    jnz short locret_11B02
    xor ah, ah
    mov bx, 0FFFFh
loc_11AF3:
    inc bx
    mov al, [bx+776h]
    or al, al
    jz short locret_11B02
    sub al, [bx+7B1h]
    jz short loc_11AF3
locret_11B02:
    retn
_sub_11ADC endp
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
    mov ax, 326Ch
    mov readFromFilePtr, ax
    mov ax, [bp+arg_0]
    mov tmpFileHandle, ax
    mov ax, [bp+unk]
    mov tmpPageIndex, ax
    mov si, tmpPageIndex
loc_11B20:
    call far ptr _gfx_jump_38_getPageBuf
    call far ptr _gfx_jump_3b_clearBuf ;zeroes out 32000 bytes
    mov word_1737E, 0
    mov rowOffset, 0
loc_11B36:
    mov di, word_1737E
    shl di, 1
    call decodePicRow
    mov di, rowOffset
    mov bp, 1322h
loc_11B46:
    mov bx, word_1737E
    call far ptr _gfx_jump_33_fillRow
    mov di, rowOffset
    call far ptr _gfx_jump_35
    inc word_1737E
    add rowOffset, 28h
    cmp word_1737E, 2BCh
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
; ------------------------------startCode1:0x26b0------------------------------
_mystrcpy proc near
    arg_0 = word ptr 4
    source = word ptr 6
    push bp
    mov bp, sp
    push si
loc_126B4:
    mov bx, [bp+arg_0]
    inc [bp+arg_0]
    mov si, [bp+source]
    inc [bp+source]
    mov al, [si]
    mov [bx], al
    or al, al
    jnz short loc_126B4
    pop si
    pop bp
    retn
_mystrcpy endp
; ------------------------------startCode1:0x26ca------------------------------
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
_mystrcat proc near
    string = word ptr 4
    source = word ptr 6
    push bp
    mov bp, sp
    push si
loc_1271D:
    mov bx, [bp+string]
    cmp byte ptr [bx], 0 ;look for \0 in string
    jz short foundEnd
    inc [bp+string]
    jmp short loc_1271D
appendNext:
    inc [bp+string]
    mov bx, [bp+string]
foundEnd:
    mov si, [bp+source]
    inc [bp+source]
    mov al, [si]
    mov [bx], al
    or al, al
    jnz short appendNext
    pop si
    pop bp
    retn
_mystrcat endp
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
_intDispatch proc near
    arg_0 = word ptr 4
    outregs = word ptr 6
    arg_4 = word ptr 8
    push bp
    mov bp, sp
    push si
    push di
loc_127FA:
    push ax
    push bx
    push cx
    push dx
loc_127FE: ;load registers with values for int call
    mov di, [bp+outregs]
    mov ax, [di]
loc_12803:
    mov bx, [di+2]
    mov cx, [di+4]
loc_12809:
    mov dx, [di+6]
loc_1280C:
    cmp [bp+arg_0], IRQ_VIDEO
    jz short loc_12827
loc_12812:
    cmp [bp+arg_0], IRQ_DOS
    jz short loc_1282C
    cmp [bp+arg_0], IRQ_KBD
    jz short loc_12831
    cmp [bp+arg_0], IRQ_TIME
    jz short loc_12836
    jmp short loc_1283B
    nop
loc_12827:
    int 10h ;- VIDEO -
    jmp short loc_12842
    nop
loc_1282C:
    int 21h ;DOS -
    jmp short loc_12842
    nop
loc_12831:
    int 16h ;KEYBOARD -
    jmp short loc_12842
    nop
loc_12836:
    int 1Ah ;system time
    jmp short loc_12842
    nop
loc_1283B:
    sub ax, ax
    not ax
    jmp short loc_12850
    nop
loc_12842:
    mov di, [bp+arg_4]
    mov [di], ax
    mov [di+2], bx
    mov [di+4], cx
    mov [di+6], dx
loc_12850:
    pop dx
    pop cx
    pop bx
    pop ax
    pop di
    pop si
    mov sp, bp
    pop bp
    retn
_intDispatch endp
; ------------------------------startCode1:0x2859------------------------------
byte_1292B db 0Fh
; ------------------------------startCode1:0x2977------------------------------
_dos_printstring proc near
    arg_0 = word ptr 4
    push bp
    mov bp, sp
    mov ah, DOS_PRINT_STR
    mov dx, [bp+arg_0]
    int 21h ;DOS - PRINT STRING
    pop bp
    retn
_dos_printstring endp
; ------------------------------startCode1:0x2982------------------------------
word_12983 dw 0
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
    mov ovlInsaneFlag, 0
    jmp short loc_1299D
    nop
    mov ovlInsaneFlag, 1
loc_1299D:
    mov ax, seg startData
    mov es, ax
    push dx
    mov ah, 48h
    mov bx, 0FFFFh
    int 21h ;DOS - 2+ - ALLOCATE MEMORY
    jb short loc_129B6
    mov dx, offset aAlloc1M ;"Allocated 1Mb of space????$"
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp loc_12A83
loc_129B6:
    mov ah, 48h
    sub bx, 400h
    mov ovlParCnt, bx
    int 21h ;DOS - 2+ - ALLOCATE MEMORY
    jnb short loc_129CE
    mov dx, offset aDosLied ;"MS-DOS lied to us about how much memory"...
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp loc_12A83
loc_129CE:
    mov ovlSeg1, ax
    mov ovlParBlock, ax
    mov ovlSeg2, ax
    mov bx, offset ovlParBlock
    mov ax, 4B03h
    pop dx
    mov cs:word_12983, sp
    int 21h ;DOS - 2+ - LOAD OR EXECUTE (EXEC)
    jnb short loc_12A0F
    db 3Dh ;cmp ax, 2
    dw 2
    jnz short loc_129F6
    mov dx, offset aFileNFound ;"Filename not found$"
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp loc_12A83
loc_129F6:
    db 3Dh ;cmp ax, 8
    dw 8
    jnz short loc_12A05
    mov dx, offset aEnoughMem ;"Not enough memory to load file$"
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp short loc_12A83
    nop
loc_12A05:
    mov dx, offset aOvlFail ;"Overlay load failed for some reason$"
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp short loc_12A83
    nop
loc_12A0F:
    mov sp, cs:word_12983
    mov ax, seg startData
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov ax, ovlSeg1
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
    cmp bx, ovlParCnt
    jbe short loc_12A50
    mov dx, offset aOvlOvrrun ;"Overlay has overrun allocated memory$"
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp short loc_12A83
    nop
loc_12A50:
    add bx, 8
    mov ah, 4Ah
    mov cx, ovlSeg1
    mov es, cx
    int 21h ;DOS - 2+ - ADJUST MEMORY BLOCK SIZE (SETBLOCK)
    jnb short loc_12A69
    mov dx, offset aOvlShrink ;"Unable to shrink overlay memory allocat"...
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    jmp short loc_12A83
    nop
loc_12A69:
    mov ax, seg startData
    mov ds, ax
    mov es, ax
    mov ax, ovlSeg1
    cmp ovlInsaneFlag, 0
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
_setupOverlaySlots proc near
    arg_0 = word ptr 4
    ovlSegment = word ptr 6
    push bp
    mov bp, sp
    push di
    push si
    push es
    push ds
    push bp
    mov dx, [bp+arg_0]
    mov ovlInsaneFlag, 0
    jmp short ovlSane
    nop
    mov ovlInsaneFlag, 1
ovlSane:
    mov es, dx
    mov bx, offset _gfx_jump_0_alloc
    mov di, OVL_HDR_FIRSTIDX
    mov ax, es:[di]
    mov dl, 5
    mul dl ;ax = al*dl
    add bx, ax ;bx = address of first slot in jump table
    mov di, OVL_HDR_SLOTCOUNT
    mov cx, es:[di]
    mov si, OVL_HDR_FIRSTPTR
    mov di, OVL_HDR_CODESEG
    mov di, es:[di]
writeSlots:
    mov ax, es:[si]
    mov [bx+1], ax
    mov [bx+3], di
    add si, 2 ;next word in jump offset array
    add bx, 5 ;next slot in jump table (5 bytes each)
    loop writeSlots
    cmp ovlInsaneFlag, 0
    jnz short sos_exit
    pop bp
    pop ds
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
sos_exit:
    retn
_setupOverlaySlots endp
; ------------------------------startCode1:0x2ae0------------------------------
; ------------------------------startCode1:0x2bba------------------------------
_clearRect proc near
    buf = word ptr 4
    maxy = word ptr 6
    y = word ptr 8
    maxx = word ptr 0Ah
    arg_8 = word ptr 0Ch
    push bp
    mov bp, sp
    push di
    push si
    push bp
    push ds
    pop es
    call _gfx_jump_10_getCurBuf
    push ax
    mov bx, [bp+buf]
    mov ax, [bx]
    call _gfx_jump_0d_setCurBuf
    mov ah, [bx+6]
    call _gfx_jump_20_setVal ;saves value of ah to gfx data
    call sub_12C75
    mov ax, [bp+maxx]
    sub ax, [bp+maxy]
    mov word_1786A, ax
    mov ax, [bp+arg_8]
    sub ax, [bp+y]
    inc ax
    mov word_1786C, ax
    mov cx, [bp+arg_8]
    mov si, [bp+y]
    mov word_17868, si
    mov word_17BED, cx
    mov word_17BEB, si
    sub cx, si
    inc cx
    lea di, byte_17877
    shl si, 1
    add di, si
    mov ax, [bp+maxy]
    mov word_17866, ax
    mov dx, cx
    rep stosw
    mov cx, dx
    lea di, byte_17A2F
    add di, si
    mov ax, [bp+maxx]
    rep stosw
    mov bx, offset byte_17877
    mov ax, word_17BEB
    mov cx, word_17BED
    call far ptr _gfx_jump_28
    call far ptr _gfx_jump_22
    mov ax, word_17866
    mov bx, word_17868
    mov cx, word_1786A
    mov dx, word_1786C
    call _gfx_jump_51_null
    pop ax
    call _gfx_jump_0f_getBufPtr
    pop bp
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
_clearRect endp
; ------------------------------startCode1:0x2c58------------------------------
; ------------------------------startCode1:0x2c75------------------------------
sub_12C75 proc near
    mov di, word_17BEB
    or di, di
    js short locret_12CA5
    mov cx, word_17BED
    inc cx
    sub cx, di
    shl di, 1
    mov bx, cx
    mov dx, di
    add di, 0D27h
    mov ax, 0FFFFh
    rep stosw
    mov word_17BEB, ax
    mov cx, bx
    mov di, dx
    add di, 0EDFh
    sub ax, ax
    rep stosw
    mov word_17BED, ax
locret_12CA5:
    retn
sub_12C75 endp
; ------------------------------startCode1:0x2ca5------------------------------
; ------------------------------startCode1:0x2dea------------------------------
_sub_12DEA proc near
    push bp
    push si
    push di
    push es
    call sub_12DF6
    pop es
    pop di
    pop si
    pop bp
    retn
_sub_12DEA endp
; ------------------------------startCode1:0x2df5------------------------------
; ------------------------------startCode1:0x2df6------------------------------
sub_12DF6 proc near
    arg_109F = word ptr 10A1h
    sub ax, ax
    mov es, ax
    push word ptr es:0
    lea ax, byte_19ADB
    mov es:0, ax
    push ds
    pop es
    jmp short loc_12E66
    nop
loc_12E0C:
    sub ax, ax
    mov es, ax
    pop word ptr es:0
    push ds
    pop es
    mov ax, _word_1786F
    mov bx, _word_17873
    mov cx, _word_17871
    mov dx, _word_17875
    call _gfx_jump_1f
    clc
    retn
loc_12E2D:
    sub ax, ax
    mov es, ax
    pop word ptr es:0
    push ds
    pop es
    stc
    retn
loc_12E3A:
    cmc
    rcr dx, 1
    mov word_17BF1, dx
    sar dx, 1
    mov word_17BF5, dx
    mov dx, di
    sub dx, bp
    jno short loc_12E53
    cmc
    rcr dx, 1
    jmp short loc_12EC1
    nop
loc_12E53:
    sar dx, 1
    jmp short loc_12EC1
    nop
loc_12E58:
    cmc
    rcr dx, 1
    sar word_17BF1, 1
    sar word_17BF5, 1
    jmp short loc_12EC1
    nop
loc_12E66:
    mov cx, _word_1786F
    mov dx, _word_17873
    mov si, _word_17871
    mov di, _word_17875
    mov bx, cx
    mov bp, dx
    call sub_12F6A
    mov byte_17BF0, al
    mov bx, si
    mov bp, di
    call sub_12F6A
    jnz short loc_12EA3
    cmp byte_17BF0, 0
    jnz short loc_12E93
    jmp loc_12E0C
loc_12E93:
    xchg cx, si
    xchg dx, di
    xchg al, byte_17BF0
    mov _word_1786F, cx
    mov _word_17873, dx
loc_12EA3:
    test byte_17BF0, al
    jnz short loc_12E2D
    mov bp, dx
    mov dx, si
    sub dx, cx
    jo short loc_12E3A
    mov word_17BF1, dx
    sar dx, 1
    mov word_17BF5, dx
    mov dx, di
    sub dx, bp
    jo short loc_12E58
loc_12EC1:
    mov word_17BF3, dx
    sar dx, 1
    mov word_17BF7, dx
loc_12ECB:
    test al, 9
    jz short loc_12F07
    sub bx, bx
    or si, si
    js short loc_12ED9
    mov bx, word_17BF9
loc_12ED9:
    mov ax, bx
    sub ax, cx
    imul word_17BF3
    push bx
    mov bx, dx
    idiv word_17BF1
    mov bl, bh
    xor bl, byte ptr word_17BF1+1
    jns short loc_12EF3
    neg dx
    dec ax
loc_12EF3:
    sub dx, word_17BF5
    xor dh, bh
    js short loc_12EFC
    inc ax
loc_12EFC:
    pop bx
    add ax, bp
    js short loc_12F0F
    cmp ax, word_17BFB
    jle short loc_12F40
loc_12F07:
    mov bx, word_17BFB
    cmp di, bx
    jg short loc_12F11
loc_12F0F:
    sub bx, bx
loc_12F11:
    mov ax, bx
    sub ax, bp
    imul word_17BF1
    push bx
    mov bx, dx
    idiv word_17BF3
    mov bl, bh
    xor bl, byte ptr word_17BF3+1
    jns short loc_12F2B
    neg dx
    dec ax
loc_12F2B:
    sub dx, word_17BF7
    xor dh, bh
    js short loc_12F34
    inc ax
loc_12F34:
    pop bx
    add ax, cx
    js short loc_12F51
    cmp ax, word_17BF9
    jg short loc_12F51
    xchg ax, bx
loc_12F40:
    cmp byte_17BF0, 0
    jnz short loc_12F54
    mov _word_17875, ax
    mov _word_17871, bx
    jmp loc_12E0C
loc_12F51:
    jmp loc_12E2D
loc_12F54:
    mov _word_17873, ax
    mov _word_1786F, bx
    xchg cx, si
    xchg bp, di
    mov al, byte_17BF0
    mov byte_17BF0, 0
    jmp loc_12ECB
sub_12DF6 endp
; ------------------------------startCode1:0x2f67------------------------------
; ------------------------------startCode1:0x2f6a------------------------------
sub_12F6A proc near
    mov al, 0Fh
    or bx, bx
    js short loc_12F72
    and al, 0F7h
loc_12F72:
    cmp bx, word_17BF9
    jg short loc_12F7A
    and al, 0FEh
loc_12F7A:
    or bp, bp
    js short loc_12F80
    and al, 0FBh
loc_12F80:
    cmp bp, word_17BFB
    jg short loc_12F88
    and al, 0FDh
loc_12F88:
    or al, al
    retn
sub_12F6A endp
; ------------------------------startCode1:0x2f8a------------------------------
; ------------------------------startCode1:0x2fac------------------------------
_installCBreakHandler proc near
    push si
    push di
    push dx
    push ds
    mov si, IRQ_CBREAK*4
    call getInterruptHandler
    mov origCBreakOfs, bx
    mov origCBreakSeg, ax
    mov ax, seg startCode1
    mov dx, offset cbreakHandler
    mov ds, ax
    mov ax, 251Bh ;1B - cbreak interrupt
    int 21h ;DOS - SET INTERRUPT VECTOR
    pop ds
    pop dx
    pop di
    pop si
    retn
_installCBreakHandler endp
; ------------------------------startCode1:0x2fce------------------------------
; ------------------------------startCode1:0x2fcf------------------------------
_restoreCbreakHandler proc near
    push ds
    mov ax, origCBreakSeg
    mov dx, origCBreakOfs
    mov ds, ax
    mov ax, 251Bh
    int 21h ;DOS - SET INTERRUPT VECTOR
    pop ds
    retn
_restoreCbreakHandler endp
; ------------------------------startCode1:0x2fdf------------------------------
; ------------------------------startCode1:0x2fe0------------------------------
getInterruptHandler proc near
    push ds
    xor ax, ax
    mov ds, ax
    mov bx, [si]
    mov ax, [si+2]
    pop ds
    retn
getInterruptHandler endp
; ------------------------------startCode1:0x2feb------------------------------
; ------------------------------startCode1:0x2fec------------------------------
cbreakHandler proc far
    push ds
    push ax
    mov ax, seg startData
    mov ds, ax
    mov _cbreakHit, 0FFh
    pop ax
    pop ds
    iret
cbreakHandler endp
; ------------------------------startCode1:0x2ffa------------------------------
; ------------------------------startCode1:0x311a------------------------------
_openFile proc near
    arg_0 = word ptr 4
    mode = word ptr 6
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ah, 3Dh
    mov al, byte ptr [bp+mode]
    mov bx, ss
    mov ds, bx
    mov dx, [bp+arg_0]
    int 21h ;DOS - 2+ - OPEN DISK FILE WITH HANDLE
    jnb short openSuccess
    db 3Dh ;ax == 2: file not foundcmp ax, 2
    dw 2
    jnz short otherError ;error 03: path not found
fileNotFound:
    mov bx, [bp+arg_0]
    mov ax, offset aFileNotFound ;":File not found$"
    mov cx, 0FFFFh
    jmp errorDescAndExit ;ax: pointer to error message
otherError:
    db 3Dh ;error 03: path not foundcmp ax, 3
    dw 3
    jz short fileNotFound
    db 3Dh ;error 04: too many open filescmp ax, 4
    dw 4
    jnz short stillOtherError
    mov cx, 0FFFFh
    mov bx, [bp+arg_0]
    mov ax, offset aNoFileBuffersAvailable ;":No file buffers available$"
    jmp errorDescAndExit ;ax: pointer to error message
stillOtherError:
    mov cx, ax
    mov ax, offset aOpenError ;":Open error $"
    mov bx, [bp+arg_0]
    jmp errorDescAndExit ;ax: pointer to error message
openSuccess:
    mov fileReadPos, 200h
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
_openFile endp
; ------------------------------startCode1:0x3170------------------------------
; ------------------------------startCode1:0x31c8------------------------------
_fileClose proc near
    arg_0 = word ptr 4
    handle = word ptr 6
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ah, 3Eh
    mov bx, [bp+arg_0]
    int 21h ;DOS - 2+ - CLOSE A FILE WITH HANDLE
    jnb short loc_131E1
    mov dx, 12EEh
    mov cx, 0FFFFh
    jmp errorAndExit
loc_131E1:
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
_fileClose endp
; ------------------------------startCode1:0x31e8------------------------------
; ------------------------------startCode1:0x326c------------------------------
read512FromFileIntoBuf proc near
    push ds
    mov ah, 3Fh
    mov bx, seg startData
    mov ds, bx
    mov bx, tmpFileHandle
    mov cx, 200h ;read 512 bytes at most (int returns number of chars
    mov dx, offset fileReadBuf
    int 21h ;DOS - 2+ - READ FROM FILE WITH HANDLE
    jnb short readSuccess
    mov dx, offset aReadError ;"Read error$"
    mov cx, 0FFFFh
    jmp short errorAndExit
    nop
readSuccess:
    pop ds
    retn
read512FromFileIntoBuf endp
; ------------------------------startCode1:0x328c------------------------------
; ------------------------------startCode1:0x33d0------------------------------
_showPicFile proc near
    handle = word ptr 4
    pageNum = word ptr 6
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ax, offset read512FromFileIntoBuf
    mov readFromFilePtr, ax
    mov ax, [bp+handle]
    mov tmpFileHandle, ax
    mov ax, [bp+pageNum]
    mov tmpPageIndex, ax
    call nullsub_1
    mov si, tmpPageIndex
    ; get either vmem addr or allocated page buffer into es
    call far ptr _gfx_jump_38_getPageBuf 
    call far ptr _gfx_jump_3b_clearBuf ;zeroes out 32000 bytes
    mov row, 0
    mov screenBufSize, 0FA00h
nextRow:
    mov di, row ;argument for gfx slot
    call far ptr _gfx_jump_3a_getRowOffset ;returned in ax
    mov rowOffset, ax
    call decodePicRow
    mov di, rowOffset
    mov bp, offset picDecodedRowBuf ;source for memcpy
    mov bx, row
    call far ptr _gfx_jump_33_fillRow ;destination: es:di (gfx page:rowOffset)
    mov di, rowOffset
    call far ptr _gfx_jump_35
    inc row
    sub screenBufSize, 320
    jnz short nextRow ;argument for gfx slot
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
_showPicFile endp
; ------------------------------startCode1:0x3441------------------------------
; ------------------------------startCode1:0x351e------------------------------
_decodePic proc near
    handle = word ptr 4
    buffer = word ptr 6
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ax, offset read512FromFileIntoBuf
    mov readFromFilePtr, ax
    mov ax, [bp+handle]
    mov tmpFileHandle, ax
    mov ax, [bp+buffer]
    mov es, ax
    call far ptr _gfx_jump_3b_clearBuf ;zeroes out 32000 bytes
    call nullsub_1
    mov row, 0
    mov screenBufSize, 0FA00h
loc_1354A:
    mov di, row
    call far ptr _gfx_jump_3a_getRowOffset ;returned in ax
    mov rowOffset, ax
    call decodePicRow
    mov di, rowOffset
    mov bp, offset picDecodedRowBuf
    mov bx, row
    call far ptr _gfx_jump_34_fillRow
    mov di, rowOffset
    call far ptr _gfx_jump_36_null
    inc row
    sub screenBufSize, 320
    jnz short loc_1354A
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
_decodePic endp
; ------------------------------startCode1:0x3585------------------------------
; ------------------------------startCode1:0x3588------------------------------
decodePicRow proc near
    push es
    push ds
    pop es
    cld
    mov si, fileReadPos
    add si, offset fileReadBuf
    shr di, 1 ;di: row /2?
    jnz short rowNonZero
    ; otherwise (row zero), initialize dictionary for decode?
    call picReadDataAndMakeDict 
rowNonZero:
    mov cx, 320
    mov picRowLength, cx
    mov di, offset picDecodedRowBuf
    call doPicDecode
    sub si, offset fileReadBuf
    mov fileReadPos, si ;reset buf ptr to beginning
    pop es
    retn
decodePicRow endp
; ------------------------------startCode1:0x35b1------------------------------
; ------------------------------startCode1:0x35b2------------------------------
picReadDataAndMakeDict proc near
    mov ax, offset fileReadBuf
    add ax, FILE_READBUF_SIZE
    mov readBufEndPtr, ax
    mov ax, offset picWorkData
    mov picWorkDataPtr, ax
    mov picProcessFlag0_1, 0
    mov picLookupResult, 0
    ; si: index to unprocessed data? if not at end then don't read more?
    cmp si, readBufEndPtr 
    jb short siBelowBufEnd ;otherwise (at end) read more data into buffer
    push bx
    push cx
    push dx
    call readFromFilePtr ;read from file into static buffer
    pop dx
    pop cx
    pop bx
    mov si, offset fileReadBuf ;reseat si to buffer start
siBelowBufEnd:
    lodsw ;ds:si -> ax
    mov picFileWord, ax
    mov picRemainingBitCount, 8
    mov picByteUnsignedFlag, 1
    or al, al ;update flags based on al contents
    ; check if symbol has sign bit set: literal or LZW sequence?
    jns short picByteUnsigned 
    dec picByteUnsignedFlag ;byte has sign set, clear flag
    neg al
picByteUnsigned:
    mov picByte, al ;continues to next routine
picReadDataAndMakeDict endp
; ------------------------------startCode1:0x35f6------------------------------
; ------------------------------startCode1:0x35f9------------------------------
picMakeDict proc near
    mov picTmp9BitCount, 9
    mov picFileReadBufEnd, 1FFh
    mov dx, 256
    mov picNumberDictSlots, dx
    mov ax, 0FFFFh
    xor bx, bx
    mov cx, 2048
fillFF:
    mov picDecodeDictionary[bx], ax ;make a pattern of ff ff 00, ff ff 00, ...
    add bx, 3
    loop fillFF ;make a pattern of ff ff 00, ff ff 00, ...
    mov al, 0
    xor bx, bx
    mov cx, 256
fillSubsequentValues:
    mov picDecodeIncrement[bx], al
    inc al
    add bx, 3
    loop fillSubsequentValues ;put 01, 02, 03... in the gaps between the ff's
    retn
picMakeDict endp
; ------------------------------startCode1:0x362e------------------------------
; ------------------------------startCode1:0x362f------------------------------
doPicDecode proc near
    cmp picByteUnsignedFlag, 0
    jz short unsigned_loc_1363A
    shr picRowLength, 1 ;rowLength / 2, number of words
unsigned_loc_1363A:
    mov ax, picWorkDataPtr
    mov picWorkDataPtr, sp
    mov sp, ax
    mov dx, picNumberDictSlots
lookupLoop:
    cmp picProcessFlag0_1, 0
    jnz short loc_1366F
    call dictionaryLookup
dictionaryLookupResCheck: ;magic marker?
    cmp al, 90h
    jz short lookupRes90
    mov picLookupResult, al
    jmp short lookupFound
    nop
lookupRes90:
    call dictionaryLookup
    or al, al
    jnz short loc_1366A
    mov al, 90h
    mov picLookupResult, al
    jmp short lookupFound
    nop
loc_1366A:
    dec al
    mov picProcessFlag0_1, al
loc_1366F:
    mov al, picLookupResult
    dec picProcessFlag0_1
lookupFound:
    cmp picByteUnsignedFlag, 0
    jz short byteWasSigned ;store literal?
    mov ah, al
    and al, 0Fh ;what's the point?
    shr ah, 1 ;ah / 16, shift out lower nibble
    shr ah, 1
    shr ah, 1
    shr ah, 1
    stosw ;ax -> es:di, points to picDecodedBuf
    dec picRowLength ;count off words
    jnz short lookupLoop
    jmp short rowDone
    nop
byteWasSigned:
    stosb ;store literal?
    dec picRowLength
    jnz short lookupLoop
rowDone:
    mov picNumberDictSlots, dx
    mov ax, picWorkDataPtr
    mov picWorkDataPtr, sp
    mov sp, ax
    retn
doPicDecode endp
; ------------------------------startCode1:0x36a7------------------------------
; ------------------------------startCode1:0x36a8------------------------------
dictionaryLookup proc near
    pop bp ;pop caller return address
    cmp sp, offset picWorkData ;make sure we have the work data buffer in sp
    jz short workBufOk
jumpOut:
    pop ax
    jmp bp ;synonym for retn
workBufOk:
    mov bx, picFileWord
    mov cl, 16 ;size of code word, 16 bits?
    mov ch, picRemainingBitCount
    sub cl, ch ;subtract number of bits
    shr bx, cl
    mov cl, ch ;remaining number of bits
; ------------------------------startCode1:0x36c2------------------------------
processLoop:
    cmp cl, picTmp9BitCount
    jge short tooManyBits
    cmp si, readBufEndPtr ;check if read buffer empty
    jb short skipFileRead
    push bx
    push cx
    push dx
    call readFromFilePtr
    pop dx
    pop cx
    pop bx
    mov si, offset fileReadBuf ;reseat pointer to file beginning
skipFileRead:
    lodsw
    mov picFileWord, ax
    shl ax, cl ;shift the next word from the file by the remaining amount of bits
    or bx, ax
    add cl, 16 ;add 16 bits to the counter
; ------------------------------startCode1:0x36e6------------------------------
jmp short processLoop
tooManyBits:
    sub cl, picTmp9BitCount
    mov picRemainingBitCount, cl
    mov ax, bx
    and ax, picFileReadBufEnd
    mov cx, ax
    cmp ax, dx ;compare to the number of dictionary slots
    jl short withinDictionary
    mov cx, dx
    mov ax, picSlotCounter
    mov bl, dictionaryIndex
    push bx
withinDictionary:
    mov bx, ax
    add bx, ax
    add bx, ax
    mov ax, picDecodeDictionary[bx] ;initially ffff
    inc ax
    jz short dictValNull ;if ffff
    dec ax
    mov bl, picDecodeIncrement[bx]
    push bx
    jmp short withinDictionary
dictValNull:
    mov al, picDecodeIncrement[bx] ;al = 00..ff index from dictionary
    mov dictionaryIndex, al
    push ax
    mov bx, dx ;bx *= 3, past the dictionary?
    add bx, dx
    add bx, dx
    mov picDecodeIncrement[bx], al
    mov ax, picSlotCounter
    mov picDecodeDictionary[bx], ax
    inc dx ;makes it go past the allocated 01..ff slots?
    cmp dx, picFileReadBufEnd
    jle short slotCountNotPastBufEnd
    inc picTmp9BitCount
    stc
    rcl picFileReadBufEnd, 1
slotCountNotPastBufEnd:
    mov al, picTmp9BitCount
    cmp al, picByte
    jle short done
    call picMakeDict ;looks like a dictionary for LZW decoding?
done:
    mov picSlotCounter, cx
    jmp jumpOut ;jump out of routine?
dictionaryLookup endp
; ------------------------------startCode1:0x3754------------------------------
; ------------------------------startCode1:0x37b4------------------------------
_dos_alloc proc near
    arg_0 = word ptr 4
    sz = word ptr 6
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ah, DOS_ALLOC_MEM
    mov bx, [bp+arg_0]
    shr bx, 1
    shr bx, 1
    shr bx, 1
    shr bx, 1
    test [bp+arg_0], 0Fh
    jz short loc_137D0
    inc bx
loc_137D0:
    int 21h ;DOS - 2+ - ALLOCATE MEMORY
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
_dos_alloc endp
; ------------------------------startCode1:0x37d9------------------------------
startCode1 ends
;  ==============================================================================

;  ==============================================================================


startCode2 segment byte public 'CODE'
; ------------------------------startCode2:0x2f------------------------------
_sub_16A7F proc far
    call readJoyPort
loc_16A82:
    mov bx, 0
loc_16A85:
    call sub_16ABF
loc_16A88:
    mov bx, 1
loc_16A8B:
    call sub_16ABF
loc_16A8E: ;sub_16ABF puts some value there
    mov ax, word ptr _noJoy80
    retf
_sub_16A7F endp
; ------------------------------startCode2:0x41------------------------------
; ------------------------------startCode2:0x42------------------------------
readJoyPort proc near
    push bp
loc_16A93:
    xor bx, bx
    xor bp, bp
loc_16A97:
    mov cx, 0FFFFh
loc_16A9A:
    mov dx, 201h
    cli
loc_16A9E: ;Game I/O port
    out dx, al ;bits 0-3: Coordinates (resistive, time-dependent inputs)
    jmp short $+2
    jmp short $+2
loc_16AA3:
    in al, dx ;Game I/O port
    and al, 3
    jz short loc_16AB4
    shr al, 1
    adc bx, 0
    shr al, 1
loc_16AAF:
    adc bp, 0
    loop loc_16AA3
loc_16AB4:
    sti
    mov word_17856, bx
loc_16AB9:
    mov word_17858, bp
loc_16ABD:
    pop bp
    retn
readJoyPort endp
; ------------------------------startCode2:0x6e------------------------------
; ------------------------------startCode2:0x6f------------------------------
sub_16ABF proc near
    shl bx, 1
loc_16AC1:
    mov ax, word_17856[bx]
    mov dx, ax
loc_16AC7:
    sub dx, word_1783E[bx]
    jb short loc_16AD4
loc_16ACD:
    ja short loc_16AF6
loc_16ACF:
    mov ah, 80h
loc_16AD1:
    jmp short done_16B14
    nop
loc_16AD4:
    neg dx
loc_16AD6:
    cmp ax, word_1782E[bx]
    ja short loc_16AE9
loc_16ADC:
    mov word_1782E[bx], ax
loc_16AE0:
    mov word_17846[bx], dx
    mov ah, 0
    jmp short done_16B14
    nop
loc_16AE9:
    xor ax, ax
    div word_17846[bx]
loc_16AEF:
    not ax
    shr ax, 1
    jmp short done_16B14
    nop
loc_16AF6:
    cmp ax, word_17836[bx]
    jb short loc_16B09
loc_16AFC:
    mov word_17836[bx], ax
    mov word_1784E[bx], dx
loc_16B04:
    mov ah, 0FFh
    jmp short done_16B14
    nop
loc_16B09:
    xor ax, ax
    div word_1784E[bx]
loc_16B0F:
    shr ax, 1
    add ah, 80h
done_16B14:
    shr bx, 1
loc_16B16:
    mov _noJoy80[bx], ah
    retn
sub_16ABF endp
; ------------------------------startCode2:0xca------------------------------
; ------------------------------startCode2:0xdf------------------------------
_copyJoystickData proc far
    mov bx, sp ;stack pointer to bx
    push si
loc_16B32:
    push di
    push ds
    push es
    lds si, [bx+4] ;take far pointer argument off the stack, set as source
    mov di, STACK_JOYDATA
loc_16B3B:
    push ss
    pop es
    mov cx, 14h
    rep movsw ;copy 20 bytes from argument address to ss:cde
    pop es
    pop ds
    pop di
    pop si
    retf
_copyJoystickData endp
; ------------------------------startCode2:0xf6------------------------------
byte_16B47 db 9 dup(0)
startCode2 ends

end
