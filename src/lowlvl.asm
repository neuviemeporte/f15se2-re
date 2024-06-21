DOSSEG
.MODEL small
.DATA
    ; 0x752
    byte_172A2 DB 0
    byte_172A3 DB 0
    word_172A4 DW 0
    word_172A6 DW 0
    word_172A8 DW 0
    word_172AA DW 0
    word_172AC DW 0
    word_172AE DW 0
    byte_172B0 DB 0
    word_172B1 DW 0
    word_172B3 DW 0
    word_172B5 DW 0
    ; 0x767
    byte_172B7 DB 0
    word_172B8 DW 0
    word_172BA DW 0
    byte_172BF DB 0
    byte_172C0 DB 0
    byte_172C1 DB 0
    ; 0x998
    ovlSeg1 DW 0
    ; 0x99a
    ovlParCnt DW 0
    ovlParBlock DW 0
    ovlSeg2 DW 0
    ovlInsaneFlag DB 0
    ; 0x9a1
    aAlloc1M        db 'Allocated 1Mb of space????$'
    aDosLied        db 'MS-DOS lied to us about how much memory was available$'
    aFileNFound     db 'Filename not found$'
    aEnoughMem      db 'Not enough memory to load file$'
    aOvlFail        db 'Overlay load failed for some reason$'
    aOvlOvrrun      db 'Overlay has overrun allocated memory$'
    aOvlShrink      db 'Unable to shrink overlay memory allocation$'
    aOvlRel         db 'Error releasing overlay memory$'
    ; 0x10af
    origCBreakSeg DW 0
    origCBreakOfs DW 0

    EXTRN _gfx_slot_00_alloc:BYTE, _audio_slot_6b:BYTE, _audio_slot_6c:BYTE, _timerCounter:BYTE
.CODE
    EXTRN _cbreakHandler:PROC
    PUBLIC _installCBreakHandler, _setupOverlaySlots, _setTimerIrqHandler, _loadOverlay, _setupPIT, _copyJoystickData, _dos_alloc, _dos_printstring

; offsets of specific values in an overlay header
OVL_HDR_FIRSTIDX EQU 1Ch
OVL_HDR_SIZE1 EQU 1Eh
OVL_HDR_SIZE2 EQU 20h
OVL_HDR_SLOTCOUNT EQU 22h
OVL_HDR_FIRSTPTR EQU 244h
OVL_HDR_CODESEG EQU 18h
BDA_CRTC EQU 463h
IRQ_CBREAK EQU 1Bh

DOS_SET_IRQH EQU 25h
DOS_ALLOC_MEM EQU 48h
DOS_PRINT_STR EQU 9

IRQ_PIT EQU 8
PORT_PIT_TIME0 EQU 40h
PORT_PIT_CNTRL EQU 43h

OFF_STACK_JOYDATA EQU 0CDEh

; 0x185a
_setTimerIrqHandler proc near
                mov     word_172AE, 1
                mov     word_172B8, 1
                mov     word_172A4, 0
                mov     word_172A6, 0
                call    sub_119D4
                mov     ah, 35h ; '5'
                mov     al, 8
                int     21h             ; DOS - 2+ - GET INTERRUPT VECTOR
                                        ; AL = interrupt number
                                        ; Return: ES:BX = value of interrupt vector
                mov     word ptr cs:timerIsrPtr+1, bx
                mov     word ptr cs:timerIsrPtr+3, es
                push    ds
                mov     ah, 25h ; '%'
                mov     al, 8
                lds     dx, dword ptr cs:timerIrqHandler
                int     21h             ; DOS - SET INTERRUPT VECTOR
                                        ; AL = interrupt number
                                        ; DS:DX = new vector to be used for specified interrupt
                pop     ds
                mov     byte_172A3, 1
                retn
_setTimerIrqHandler endp

_setupPIT        proc near
                mov     al, 110110b
                out     PORT_PIT_CNTRL, al ; prepare PIT
                jmp     short $+2
                xor     al, al
                out     PORT_PIT_TIME0, al ; send LSB of timer count
                jmp     short $+2
                out     PORT_PIT_TIME0, al ; send MSB
                push    ds
                mov     ah, DOS_SET_IRQH ; '%'
                mov     al, IRQ_PIT
                lds     dx, dword ptr cs:timerIsrPtr+1
                int     21h             ; DOS - SET INTERRUPT VECTOR
                                        ; AL = interrupt number
                                        ; DS:DX = new vector to be used for specified interrupt
                pop     ds
                mov     byte_172A3, 0
                retn
_setupPIT        endp

; 0x18e3
timerIrqHandler:
                out     18h, ax
                add     [bx+si], dl
                sti
                push    ax
                push    bx
                push    cx
                push    dx
                push    si
                push    di
                push    bp
                push    ds
                push    es
                mov     ax, seg @data
                mov     ds, ax
                mov     ax, word_172AA
                add     word_172A4, ax
                adc     word_172A6, 0
                dec     word_172B8
                jnz     short loc_11919
                mov     ax, word_172AE
                mov     word_172B8, ax
                call    sub_1194d
                mov     byte_172A2, 0
                call    increaseTimerCounters
loc_11919:
                cmp     word_172AE, 1
                jz      short loc_11925
                call    far ptr _audio_slot_6c
loc_11925:
                cmp     word_172A6, 0
                jnz     short loc_1193A
                mov     al, 20h ; ' '
                out     20h, al         ; Interrupt controller, 8259A.
                pop     es
                pop     ds
                pop     bp
                pop     di
                pop     si
                pop     dx
                pop     cx
                pop     bx
                pop     ax
                iret
loc_1193A:
                dec     word_172A6
                pop     es
                pop     ds
                pop     bp
                pop     di
                pop     si
                pop     dx
                pop     cx
                pop     bx
                pop     ax
                cli
; 0x1948
timerIsrPtr DB 0EAh,0,0,0,0

; 0x194d
sub_1194d       proc near
                dec     byte_172B0
                jnz     short loc_119D2
                mov     byte_172B0, 14h
                cmp     byte_172B7, 0
                jz      short loc_119A0
                xor     bl, bl
                xor     cx, cx
                mov     es, cx
                mov     dx, es:BDA_CRTC
                add     dx, 6
                cmp     dx, 3BAh
                jz      short loc_11987
loc_11973:
                cli
                in      al, dx
                test    al, 8
                jnz     short loc_119A0
                sti
                and     al, 1
                cmp     al, bl
                jz      short loc_11973
                xor     bl, 1
                loop    loc_11973
                jmp     short loc_11999
loc_11987:
                cli
                in      al, dx
                test    al, 80h
                jz      short loc_119A0
                sti
                and     al, 1
                cmp     al, bl
                jz      short loc_11973
                xor     bl, 1
                loop    loc_11987
loc_11999:
                mov     byte_172B7, 0
                jmp     short loc_119D2
loc_119A0:
                mov     dx, word_172AA
                cmp     dx, word_172A8
                jz      short loc_119B2
                mov     dx, word_172A8
                mov     word_172AA, dx
loc_119B2:
                mov     al, 36h ; '6'
                out     43h, al         ; Timer 8253-5 (AT: 8254.2).
                jmp     short $+2
                mov     al, dl
                out     40h, al         ; Timer 8253-5 (AT: 8254.2).
                jmp     short $+2
                mov     al, dh
                out     40h, al         ; Timer 8253-5 (AT: 8254.2).
                inc     word_172AC
                neg     cx
                mov     word_172BA, cx
                jz      short loc_119D2
                inc     word_172B8
loc_119D2:
                sti
                retn
sub_1194d         endp

; 0x19d4
sub_119D4       proc near
                pushf
                cli
                mov     byte_172B0, 1
                xor     ax, ax
                mov     byte_172B7, 1
                mov     word_172B3, ax
                mov     word_172B5, ax
                call    sub_11A69
                mov     bx, ax
                mov     cx, 10h
loc_119F0:
                push    bx
                call    sub_11A69
                pop     bx
                sub     bx, ax
                add     word_172B3, bx
                adc     word_172B5, 0
                mov     bx, ax
                loop    loc_119F0
                mov     ax, word_172B3
                mov     dx, word_172B5
                add     word_172A4, ax
                adc     word_172A6, dx
                mov     cx, 10h
                div     cx
                shr     ax, 1
                mov     word_172B3, ax
                mov     bx, ax
                shr     bx, 1
                shr     bx, 1
                shr     bx, 1
                shr     bx, 1
                add     ax, bx
                xor     dx, dx
                mov     bx, 0F89h
                div     bx
                cmp     ax, 4
                jb      short loc_11A3D
                cmp     ax, 6
                ja      short loc_11A3D
                jmp     short loc_11A4B
                nop
loc_11A3D:
                mov     byte_172B7, 0
                mov     word_172B3, 4DAEh
                mov     ax, 5
loc_11A4B:
                mov     word_172B1, ax
                cmp     word_172AE, 1
                jz      short loc_11A58
                mov     word_172AE, ax
loc_11A58:
                mov     ax, word_172B3
                xor     dx, dx
                div     word_172AE
                mov     word_172AA, ax
                mov     word_172A8, ax
                popf
                retn
sub_119D4       endp

; 0x1a69
sub_11A69       proc near
                pushf
                cli
                xor     ax, ax
                mov     es, ax
                mov     dx, es:463h
                add     dx, 6
                cmp     dx, 3BAh
                jz      short loc_11A94
                xor     bx, bx
loc_11A7F:
                dec     bx
                jz      short loc_11ABA
                in      al, dx
                test    al, 8
                jnz     short loc_11A7F
                xor     bx, bx
loc_11A89:
                dec     bx
                jz      short loc_11ABA
                in      al, dx
                test    al, 8
                jz      short loc_11A89
                jmp     short loc_11AA8
                nop
loc_11A94:
                xor     bx, bx
loc_11A96:
                dec     bx
                jz      short loc_11ABA
                in      al, dx
                test    al, 80h
                jz      short loc_11A96
                xor     bx, bx
loc_11AA0:
                dec     bx
                jz      short loc_11ABA
                in      al, dx
                test    al, 80h
                jnz     short loc_11AA0
loc_11AA8:
                mov     al, 0
                out     43h, al         ; Timer 8253-5 (AT: 8254.2).
                jmp     short $+2
                in      al, 40h         ; Timer 8253-5 (AT: 8254.2).
                jmp     short $+2
                mov     bl, al
                in      al, 40h         ; Timer 8253-5 (AT: 8254.2).
                jmp     short $+2
                mov     bh, al
loc_11ABA:
                mov     ax, bx
                popf
                retn
sub_11A69       endp


; 0x1ac5
increaseTimerCounters proc near
                inc     byte_172BF
                inc     byte_172C0
                inc     _timerCounter
                inc     byte_172C1
                call    far ptr _audio_slot_6b
                retn
increaseTimerCounters endp

; 0x2983
word_12983      dw 0

; 0x2977
_dos_printstring proc near
arg_0           = word ptr  4
                push    bp
                mov     bp, sp
                mov     ah, DOS_PRINT_STR
                mov     dx, [bp+arg_0]
                int     21h             ; DOS - PRINT STRING
                                        ; DS:DX -> string terminated by "$"
                pop     bp
                retn
_dos_printstring endp

; 0x2985
_loadOverlay	proc near
arg_0		= word ptr  4
		push	bp
		mov	bp, sp
		push	di
		push	si
		push	es
		push	ds
		push	bp
		mov	dx, [bp+arg_0]
		mov	ovlInsaneFlag, 0
		jmp	short loc_1299D
		nop
		mov	ovlInsaneFlag, 1
loc_1299D:
		mov	ax, seg @data
		mov	es, ax
		push	dx
		mov	ah, 48h	; 'H'
		mov	bx, 0FFFFh
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired
		jb	short loc_129B6
		mov	dx, offset aAlloc1M ; "Allocated 1Mb of	space????$"
		mov	ah, 9
		int	21h		; DOS -	PRINT STRING
					; DS:DX	-> string terminated by	"$"
		jmp	loc_12A83
loc_129B6:
		mov	ah, 48h	; 'H'
		sub	bx, 400h
		mov	ovlParCnt, bx
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired
		jnb	short loc_129CE
		mov	dx, offset aDosLied ; "MS-DOS lied to us about how much	memory"...
		mov	ah, 9
		int	21h		; DOS -	PRINT STRING
					; DS:DX	-> string terminated by	"$"
		jmp	loc_12A83
loc_129CE:
		mov	ovlSeg1, ax
		mov	ovlParBlock, ax
		mov	ovlSeg2, ax
		mov	bx, offset ovlParBlock
		mov	ax, 4B03h
		pop	dx
		mov	cs:word_12983, sp
		int	21h		; DOS -	2+ - LOAD OR EXECUTE (EXEC)
					; DS:DX	-> ASCIZ filename
					; ES:BX	-> parameter block
					; AL = subfunc:	called by MSC spawn(P_NOWAIT,...) when running DOS 4.x.
		jnb	short loc_12A0F
		cmp	ax, 2
		jnz	short loc_129F6
		mov	dx, offset aFileNFound ; "Filename not found$"
		mov	ah, 9
		int	21h		; DOS -	PRINT STRING
					; DS:DX	-> string terminated by	"$"
		jmp	loc_12A83
loc_129F6:
		cmp	ax, 8
		jnz	short loc_12A05
		mov	dx, offset aEnoughMem ;	"Not enough memory to load file$"
		mov	ah, 9
		int	21h		; DOS -	PRINT STRING
					; DS:DX	-> string terminated by	"$"
		jmp	short loc_12A83
		nop
loc_12A05:
		mov	dx, offset aOvlFail ; "Overlay load failed for some reason$"
		mov	ah, 9
		int	21h		; DOS -	PRINT STRING
					; DS:DX	-> string terminated by	"$"
		jmp	short loc_12A83
		nop
loc_12A0F:
		mov	sp, cs:word_12983
		mov	ax, seg @data
		mov	ss, ax
		mov	ds, ax
		mov	es, ax
		mov	ax, ovlSeg1
		mov	es, ax
		mov	di, OVL_HDR_SIZE1
		mov	bx, es:[di]
		shr	bx, 1
		shr	bx, 1
		shr	bx, 1
		shr	bx, 1
		mov	di, OVL_HDR_SIZE2
		mov	cx, es:[di]
		shr	cx, 1
		shr	cx, 1
		shr	cx, 1
		shr	cx, 1
		add	bx, cx
		cmp	bx, ovlParCnt
		jbe	short loc_12A50
		mov	dx, offset aOvlOvrrun ;	"Overlay has overrun allocated memory$"
		mov	ah, 9
		int	21h		; DOS -	PRINT STRING
					; DS:DX	-> string terminated by	"$"
		jmp	short loc_12A83
		nop
loc_12A50:
		add	bx, 8
		mov	ah, 4Ah	; 'J'
		mov	cx, ovlSeg1
		mov	es, cx
		int	21h		; DOS -	2+ - ADJUST MEMORY BLOCK SIZE (SETBLOCK)
					; ES = segment address of block	to change
					; BX = new size	in paragraphs
		jnb	short loc_12A69
		mov	dx, offset aOvlShrink ;	"Unable	to shrink overlay memory allocat"...
		mov	ah, 9
		int	21h		; DOS -	PRINT STRING
					; DS:DX	-> string terminated by	"$"
		jmp	short loc_12A83
		nop
loc_12A69:
		mov	ax, seg @data
		mov	ds, ax
		mov	es, ax
		mov	ax, ovlSeg1
		cmp	ovlInsaneFlag, 0
		jnz	short locret_12A82
		pop	bp
		pop	ds
		pop	es
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
locret_12A82:
		retn
loc_12A83:
		mov	ax, 4C00h
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
_loadOverlay	endp			; AL = exit code

; 0x2a88
_setupOverlaySlots proc near
ovlSegment      = word ptr  4
                push    bp
                mov     bp, sp
                push    di
                push    si
                push    es
                push    ds
                push    bp
                mov     dx, [bp+ovlSegment]
                mov     ovlInsaneFlag, 0
                jmp     short ovlSane
                nop
                mov     ovlInsaneFlag, 1 ; no idea what's the use of this
ovlSane:
                mov     es, dx
                mov     bx, offset _gfx_slot_00_alloc
                mov     di, OVL_HDR_FIRSTIDX
                mov     ax, es:[di]
                mov     dl, 5
                mul     dl              ; ax = al*dl
                add     bx, ax          ; bx = address of first slot in jump table
                mov     di, OVL_HDR_SLOTCOUNT
                mov     cx, es:[di]
                mov     si, OVL_HDR_FIRSTPTR
                mov     di, OVL_HDR_CODESEG
                mov     di, es:[di]
writeSlots:
                mov     ax, es:[si]
                mov     [bx+1], ax
                mov     [bx+3], di
                add     si, 2           ; next word in jump offset array
                add     bx, 5           ; next slot in jump table (5 bytes each)
                loop    writeSlots
                cmp     ovlInsaneFlag, 0
                jnz     short exit
                pop     bp
                pop     ds
                pop     es
                pop     si
                pop     di
                mov     sp, bp
                pop     bp
exit:
                retn
_setupOverlaySlots endp

; 0x2fac
_installCBreakHandler proc near
    push    si
    push    di
    push    dx
    push    ds
    mov     si, IRQ_CBREAK*4
    call    getInterruptHandler
    mov     origCBreakOfs, bx
    mov     origCBreakSeg, ax
    mov     ax, seg @code
    mov     dx, offset _cbreakHandler
    mov     ds, ax
    mov     ax, 251Bh       ; 1B - cbreak interrupt
    int     21h             ; DOS - SET INTERRUPT VECTOR
                            ; AL = interrupt number
                            ; DS:DX = new vector to be used for specified interrupt
    pop     ds
    pop     dx
    pop     di
    pop     si
    ret
_installCBreakHandler endp

; 0x2fe0
; puts irq handler vector addr in ax:bx
getInterruptHandler proc near
    push    ds
    xor     ax, ax
    mov     ds, ax
    mov     bx, [si]
    mov     ax, [si+2]
    pop     ds
    ret
getInterruptHandler endp

; 0x37b4
_dos_alloc       proc near
arg_size            = word ptr  4
                push    bp
                mov     bp, sp
                push    di
                push    si
                push    es
                push    bp
                mov     ah, DOS_ALLOC_MEM ; 'H'
                mov     bx, [bp+arg_size]
                shr     bx, 1
                shr     bx, 1
                shr     bx, 1
                shr     bx, 1
                test    [bp+arg_size], 0Fh
                jz      short loc_137D0
                inc     bx
loc_137D0:                              ; CODE XREF: dos_alloc+19j
                int     21h             ; DOS - 2+ - ALLOCATE MEMORY
                                        ; BX = number of 16-byte paragraphs desired
                pop     bp
                pop     es
                pop     si
                pop     di
                mov     sp, bp
                pop     bp
                retn
_dos_alloc       endp


; 16a5:df
_copyJoystickData proc far
                mov     bx, sp          ; stack pointer to bx
                push    si
                push    di
                push    ds
                push    es
                lds     si, [bx+4]      ; take far pointer argument off the stack, set as source
                mov     di, OFF_STACK_JOYDATA
                push    ss
                pop     es
                mov     cx, 14h
                rep movsw               ; copy 20 bytes from argument address to ss:cde
                pop     es
                pop     ds
                pop     di
                pop     si
                retf
_copyJoystickData endp

    END