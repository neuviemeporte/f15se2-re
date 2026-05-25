showPicFile proc near
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ax, offset picReadFileFunc
    mov word ptr picReadFromFilePtr, ax
    mov ax, [bp+4]
    mov word ptr picFileHandle, ax
    mov ax, [bp+6]
    mov word ptr picPageIndex, ax
    call picInitRoutine
    mov si, word ptr picPageIndex
    call far ptr _gfx_jump_38_getPageBuf
    call far ptr _gfx_jump_3b_clearBuf
    mov word ptr picRow, 0
    mov word ptr picScreenBufSize, 0FA00h
@@showPicNextRow:
    mov di, word ptr picRow
    call far ptr _gfx_jump_3a_getRowOffset
    mov word ptr picRowOffset, ax
    call decodePicRow
    mov di, word ptr picRowOffset
    mov bp, offset picDecodedRowBuf
    mov bx, word ptr picRow
    call far ptr _gfx_jump_33_fillRow
    mov di, word ptr picRowOffset
    call far ptr _gfx_jump_35
    inc word ptr picRow
    sub word ptr picScreenBufSize, 320
    jnz short @@showPicNextRow
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
showPicFile endp
