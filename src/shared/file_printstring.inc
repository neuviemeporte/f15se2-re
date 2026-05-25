; shared/file_printstring.inc — DOS int 21h/09h print string
;
; No EQU definitions required.

dos_printstring proc near
    push bp
    mov bp, sp
    mov ah, 9
    mov dx, [bp+4]
    int 21h
    pop bp
    retn
dos_printstring endp
    db 0, 0
