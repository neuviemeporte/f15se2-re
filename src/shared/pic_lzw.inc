decodePicRow proc near
    push es
    push ds
    pop es
    cld
    mov si, word ptr picFileReadPos
    add si, offset picFileReadBuf
    shr di, 1
    jnz short @@picRowNonZero
    call picReadDataAndMakeDict
@@picRowNonZero:
    mov cx, 320
    mov word ptr picRowLength, cx
    mov di, offset picDecodedRowBuf
    call doPicDecode
    sub si, offset picFileReadBuf
    mov word ptr picFileReadPos, si
    pop es
    retn
decodePicRow endp

picReadDataAndMakeDict proc near
    mov ax, offset picFileReadBuf
    add ax, 200h
    mov word ptr picReadBufEndPtr, ax
    mov ax, offset picWorkData
    mov word ptr picWorkDataPtr, ax
    mov byte ptr picProcessFlag, 0
    mov byte ptr picLookupResult, 0
    cmp si, word ptr picReadBufEndPtr
    jb short @@picSiBelowBufEnd
    push bx
    push cx
    push dx
    call word ptr picReadFromFilePtr
    pop dx
    pop cx
    pop bx
    mov si, offset picFileReadBuf
@@picSiBelowBufEnd:
    lodsw
    mov word ptr picFileWord, ax
    mov byte ptr picRemainingBitCount, 8
    mov byte ptr picByteUnsignedFlag, 1
    or al, al
    jns short @@picByteUnsigned
    dec byte ptr picByteUnsignedFlag
    neg al
@@picByteUnsigned:
    mov byte ptr picByte, al
picReadDataAndMakeDict endp

picMakeDict proc near
    mov byte ptr picTmp9BitCount, 9
    mov word ptr picFileReadBufEnd, 1FFh
    mov dx, 256
    mov word ptr picNumberDictSlots, dx
    mov ax, 0FFFFh
    xor bx, bx
    mov cx, 2048
@@picFillFF:
    mov word ptr picDecodeDictionary[bx], ax
    add bx, 3
    loop @@picFillFF
    mov al, 0
    xor bx, bx
    mov cx, 256
@@picFillValues:
    mov byte ptr picDecodeIncrement[bx], al
    inc al
    add bx, 3
    loop @@picFillValues
    retn
picMakeDict endp

doPicDecode proc near
    cmp byte ptr picByteUnsignedFlag, 0
    jz short @@picUnsigned
    shr word ptr picRowLength, 1
@@picUnsigned:
    mov ax, word ptr picWorkDataPtr
    mov word ptr picWorkDataPtr, sp
    mov sp, ax
    mov dx, word ptr picNumberDictSlots
@@picLookupLoop:
    cmp byte ptr picProcessFlag, 0
    jnz short @@picRepeat
    call dictionaryLookup
    cmp al, 90h
    jz short @@picLookupRes90
    mov byte ptr picLookupResult, al
    jmp short @@picLookupFound
    db 90h
@@picLookupRes90:
    call dictionaryLookup
    or al, al
    jnz short @@picRleCount
    mov al, 90h
    mov byte ptr picLookupResult, al
    jmp short @@picLookupFound
    db 90h
@@picRleCount:
    dec al
    mov byte ptr picProcessFlag, al
@@picRepeat:
    mov al, byte ptr picLookupResult
    dec byte ptr picProcessFlag
@@picLookupFound:
    cmp byte ptr picByteUnsignedFlag, 0
    jz short @@picByteWasSigned
    mov ah, al
    and al, 0Fh
    shr ah, 1
    shr ah, 1
    shr ah, 1
    shr ah, 1
    stosw
    dec word ptr picRowLength
    jnz short @@picLookupLoop
    jmp short @@picRowDone
    db 90h
@@picByteWasSigned:
    stosb
    dec word ptr picRowLength
    jnz short @@picLookupLoop
@@picRowDone:
    mov word ptr picNumberDictSlots, dx
    mov ax, word ptr picWorkDataPtr
    mov word ptr picWorkDataPtr, sp
    mov sp, ax
    retn
doPicDecode endp

dictionaryLookup proc near
    pop bp
    cmp sp, offset picWorkData
    jz short @@picWorkBufOk
@@picJumpOut:
    pop ax
    jmp bp
@@picWorkBufOk:
    mov bx, word ptr picFileWord
    mov cl, 16
    mov ch, byte ptr picRemainingBitCount
    sub cl, ch
    shr bx, cl
    mov cl, ch
@@picProcessLoop:
    cmp cl, byte ptr picTmp9BitCount
    jge short @@picTooManyBits
    cmp si, word ptr picReadBufEndPtr
    jb short @@picSkipFileRead
    push bx
    push cx
    push dx
    call word ptr picReadFromFilePtr
    pop dx
    pop cx
    pop bx
    mov si, offset picFileReadBuf
@@picSkipFileRead:
    lodsw
    mov word ptr picFileWord, ax
    shl ax, cl
    or bx, ax
    add cl, 16
    jmp short @@picProcessLoop
@@picTooManyBits:
    sub cl, byte ptr picTmp9BitCount
    mov byte ptr picRemainingBitCount, cl
    mov ax, bx
    and ax, word ptr picFileReadBufEnd
    mov cx, ax
    cmp ax, dx
    jl short @@picWithinDict
    mov cx, dx
    mov ax, word ptr picSlotCounter
    mov bl, byte ptr picDictionaryIndex
    push bx
@@picWithinDict:
    mov bx, ax
    add bx, ax
    add bx, ax
    mov ax, word ptr picDecodeDictionary[bx]
    inc ax
    jz short @@picDictValNull
    dec ax
    mov bl, byte ptr picDecodeIncrement[bx]
    push bx
    jmp short @@picWithinDict
@@picDictValNull:
    mov al, byte ptr picDecodeIncrement[bx]
    mov byte ptr picDictionaryIndex, al
    push ax
    mov bx, dx
    add bx, dx
    add bx, dx
    mov byte ptr picDecodeIncrement[bx], al
    mov ax, word ptr picSlotCounter
    mov word ptr picDecodeDictionary[bx], ax
    inc dx
    cmp dx, word ptr picFileReadBufEnd
    jle short @@picSlotOk
    inc byte ptr picTmp9BitCount
    stc
    rcl word ptr picFileReadBufEnd, 1
@@picSlotOk:
    mov al, byte ptr picTmp9BitCount
    cmp al, byte ptr picByte
    jle short @@picDone
    call picMakeDict
@@picDone:
    mov word ptr picSlotCounter, cx
    jmp @@picJumpOut
dictionaryLookup endp
