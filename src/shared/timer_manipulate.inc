; shared/timer_manipulate.inc - manipulateTimer procedure
; No EQU definitions required - this function uses only port I/O and BDA.

manipulateTimer proc near
    pushf
    cli
    xor ax, ax
    mov es, ax
    mov dx, es:463h
    add dx, 6
    cmp dx, 3BAh
    jz short @@monochrome
    xor bx, bx
@@wait_retrace_off:
    dec bx
    jz short @@timeout
    in al, dx
    test al, 8
    jnz short @@wait_retrace_off
    xor bx, bx
@@wait_retrace_on:
    dec bx
    jz short @@timeout
    in al, dx
    test al, 8
    jz short @@wait_retrace_on
    jmp short @@read_timer
    nop
@@monochrome:
    xor bx, bx
@@wait_vblank_off:
    dec bx
    jz short @@timeout
    in al, dx
    test al, 80h
    jz short @@wait_vblank_off
    xor bx, bx
@@wait_vblank_on:
    dec bx
    jz short @@timeout
    in al, dx
    test al, 80h
    jnz short @@wait_vblank_on
@@read_timer:
    mov al, 0
    out 43h, al
    jmp short $+2
    in al, 40h
    jmp short $+2
    mov bl, al
    in al, 40h
    jmp short $+2
    mov bh, al
@@timeout:
    mov ax, bx
    popf
    retn
manipulateTimer endp
