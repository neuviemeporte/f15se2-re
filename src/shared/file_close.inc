; shared/file_close.inc — DOS int 21h/3Eh close file
;
; Required EQU definitions before INCLUDE:
;   fileCloseErrorStr  - string: file close error message
;   fileCloseErrExit   - label: error handler (errorAndExit)

fileClose proc near
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ah, 3Eh
    mov bx, [bp+4]
    int 21h
    jnc short closeSuccess
    mov dx, offset fileCloseErrorStr
    mov cx, 0FFFFh
    jmp fileCloseErrExit
closeSuccess:
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
fileClose endp
    db 0C3h
