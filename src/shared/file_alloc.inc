; shared/file_alloc.inc — DOS int 21h/48h allocate memory
;
; No EQU definitions required.

dos_alloc proc near
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ah, 48h
    mov bx, [bp+4]
    shr bx, 1
    shr bx, 1
    shr bx, 1
    shr bx, 1
    test word ptr [bp+4], 0Fh
    jz short allocAligned
    inc bx
allocAligned:
    int 21h
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
dos_alloc endp
