decodePic proc near
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
    mov es, ax
    call far ptr _gfx_clearPage
    call picInitRoutine
    mov word ptr picRow, 0
    mov word ptr picScreenBufSize, 0FA00h
@@decodePicNextRow:
    mov di, word ptr picRow
    call far ptr _gfx_getRowOffset
    mov word ptr picRowOffset, ax
    call decodePicRow
    mov di, word ptr picRowOffset
    mov bp, offset picDecodedRowBuf
    mov bx, word ptr picRow
    call far ptr _gfx_fillRow2
    mov di, word ptr picRowOffset
    call far ptr _gfx_nop36
    inc word ptr picRow
    sub word ptr picScreenBufSize, 320
    jnz short @@decodePicNextRow
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
decodePic endp
