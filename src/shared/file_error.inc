; shared/file_error.inc — File error handler (print message and exit)
;
; Required EQU definitions before INCLUDE:
;   fileErrorCodeStr   - 2-byte buffer for error code digit + '$'

errorDescAndExit:
    push ax
    mov ax, 3
    int 10h
    mov di, 0
findStringLength:
    cmp byte ptr [bx+di], 0
    jz short foundNull
    inc di
    jmp short findStringLength
foundNull:
    mov byte ptr [bx+di], 24h
    mov dx, bx
    mov ah, 9
    int 21h
    pop dx
errorAndExit:
    mov ah, 9
    int 21h
    cmp cx, 0FFFFh
    jz short exitToDos
    add cx, 30h
    mov byte ptr [fileErrorCodeStr], cl
    mov byte ptr [fileErrorCodeStr+1], 24h
    mov dx, offset fileErrorCodeStr
    mov ah, 9
    int 21h
exitToDos:
    mov ax, 4C00h
    int 21h
