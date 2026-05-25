; shared/file_open.inc — DOS int 21h/3Dh open file
;
; Required EQU definitions before INCLUDE:
;   fileNotFoundStr    - string: ":File not found$"
;   fileNoBufsStr      - string: ":No file buffers available$"
;   fileOpenErrorStr   - string: ":Open error $"
;   fileReadPosVar     - word: file read position variable
;   fileErrorExit      - label: error handler (errorDescAndExit)

openFile proc near
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ah, 3Dh
    mov al, byte ptr [bp+6]
    mov bx, ss
    mov ds, bx
    mov dx, [bp+4]
    int 21h
    jnc short openSuccess
    db 3Dh, 02h, 00h  ; cmp ax, 2 (force word-immediate)
    jnz short otherError
fileNotFound:
    mov bx, [bp+4]
    mov ax, offset fileNotFoundStr
    mov cx, 0FFFFh
    jmp fileErrorExit
otherError:
    db 3Dh, 03h, 00h  ; cmp ax, 3 (force word-immediate)
    jz short fileNotFound
    db 3Dh, 04h, 00h  ; cmp ax, 4 (force word-immediate)
    jnz short stillOtherError
    mov cx, 0FFFFh
    mov bx, [bp+4]
    mov ax, offset fileNoBufsStr
    jmp fileErrorExit
stillOtherError:
    mov cx, ax
    mov ax, offset fileOpenErrorStr
    mov bx, [bp+4]
    jmp fileErrorExit
openSuccess:
    mov word ptr fileReadPosVar, 200h
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
openFile endp
