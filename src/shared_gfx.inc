;
; shared_gfx.inc - Graphics routines shared between start.exe and end.exe
;
; Required EQU definitions before INCLUDE:
;   dirtyRectMin, dirtyRectMax, dirtyMinBuf, dirtyMaxBuf
;   lineX1, lineY1, lineX2, lineY2
;   clipDx, clipDy, clipDxHalf, clipDyHalf
;   clipOutcode, clipMaxX, clipMaxY, clipDivZeroHandler
;   CALL_GFX_1F (macro)
;

clearDirtyRects proc near
    mov di, word ptr dirtyRectMin
    or di, di
    js short cdr_done
    mov cx, word ptr dirtyRectMax
    inc cx
    sub cx, di
    shl di, 1
    mov bx, cx
    mov dx, di
    add di, offset dirtyMinBuf
    mov ax, 0FFFFh
    rep stosw
    mov word ptr dirtyRectMin, ax
    mov cx, bx
    mov di, dx
    add di, offset dirtyMaxBuf
    sub ax, ax
    rep stosw
    mov word ptr dirtyRectMax, ax
cdr_done:
    retn
clearDirtyRects endp

_drawLineWrapper proc near
    push bp
    push si
    push di
    push es
    call clipAndDrawLine
    pop es
    pop di
    pop si
    pop bp
    retn
_drawLineWrapper endp

clipAndDrawLine proc near
    sub ax, ax
    mov es, ax
    push word ptr es:0
    lea ax, clipDivZeroHandler
    mov es:0, ax
    push ds
    pop es
    jmp short cadl_start
    nop
cadl_drawLine:
    sub ax, ax
    mov es, ax
    pop word ptr es:0
    push ds
    pop es
    mov ax, word ptr lineX1
    mov bx, word ptr lineY1
    mov cx, word ptr lineX2
    mov dx, word ptr lineY2
    CALL_GFX_1F
    clc
    retn
cadl_clipped:
    sub ax, ax
    mov es, ax
    pop word ptr es:0
    push ds
    pop es
    stc
    retn
cadl_dxOverflow:
    cmc
    rcr dx, 1
    mov word ptr clipDx, dx
    sar dx, 1
    mov word ptr clipDxHalf, dx
    mov dx, di
    sub dx, bp
    jno short cadl_storeDy
    cmc
    rcr dx, 1
    jmp short cadl_dyReady
    nop
cadl_storeDy:
    sar dx, 1
    jmp short cadl_dyReady
    nop
cadl_bothOverflow:
    cmc
    rcr dx, 1
    sar word ptr clipDx, 1
    sar word ptr clipDxHalf, 1
    jmp short cadl_dyReady
    nop
cadl_start:
    mov cx, word ptr lineX1
    mov dx, word ptr lineY1
    mov si, word ptr lineX2
    mov di, word ptr lineY2
    mov bx, cx
    mov bp, dx
    call computeOutcode
    mov byte ptr clipOutcode, al
    mov bx, si
    mov bp, di
    call computeOutcode
    jnz short cadl_testBoth
    cmp byte ptr clipOutcode, 0
    jnz short cadl_swap
    jmp cadl_drawLine
cadl_swap:
    xchg cx, si
    xchg dx, di
    xchg al, byte ptr clipOutcode
    mov word ptr lineX1, cx
    mov word ptr lineY1, dx
cadl_testBoth:
    test byte ptr clipOutcode, al
    jnz short cadl_clipped
    mov bp, dx
    mov dx, si
    sub dx, cx
    jo short cadl_dxOverflow
    mov word ptr clipDx, dx
    sar dx, 1
    mov word ptr clipDxHalf, dx
    mov dx, di
    sub dx, bp
    jo short cadl_bothOverflow
cadl_dyReady:
    mov word ptr clipDy, dx
    sar dx, 1
    mov word ptr clipDyHalf, dx
cadl_clipLoop:
    test al, 9
    jz short cadl_clipY
    sub bx, bx
    or si, si
    js short cadl_gotX
    mov bx, word ptr clipMaxX
cadl_gotX:
    mov ax, bx
    sub ax, cx
    imul word ptr clipDy
    push bx
    mov bx, dx
    idiv word ptr clipDx
    mov bl, bh
    xor bl, byte ptr clipDx+1
    jns short cadl_noNegX
    neg dx
    dec ax
cadl_noNegX:
    sub dx, word ptr clipDxHalf
    xor dh, bh
    js short cadl_skipIncX
    inc ax
cadl_skipIncX:
    pop bx
    add ax, bp
    js short cadl_zeroBx
    cmp ax, word ptr clipMaxY
    jle short cadl_storeResult
cadl_clipY:
    mov bx, word ptr clipMaxY
    cmp di, bx
    jg short cadl_doClipY
cadl_zeroBx:
    sub bx, bx
cadl_doClipY:
    mov ax, bx
    sub ax, bp
    imul word ptr clipDx
    push bx
    mov bx, dx
    idiv word ptr clipDy
    mov bl, bh
    xor bl, byte ptr clipDy+1
    jns short cadl_noNegY
    neg dx
    dec ax
cadl_noNegY:
    sub dx, word ptr clipDyHalf
    xor dh, bh
    js short cadl_skipIncY
    inc ax
cadl_skipIncY:
    pop bx
    add ax, cx
    js short cadl_reject
    cmp ax, word ptr clipMaxX
    jg short cadl_reject
    xchg ax, bx
cadl_storeResult:
    cmp byte ptr clipOutcode, 0
    jnz short cadl_storeFirst
    mov word ptr lineY2, ax
    mov word ptr lineX2, bx
    jmp cadl_drawLine
cadl_reject:
    jmp cadl_clipped
cadl_storeFirst:
    mov word ptr lineY1, ax
    mov word ptr lineX1, bx
    xchg cx, si
    xchg bp, di
    mov al, byte ptr clipOutcode
    mov byte ptr clipOutcode, 0
    jmp cadl_clipLoop
clipAndDrawLine endp

computeOutcode proc near
    mov al, 0Fh
    or bx, bx
    js short co_skipRight
    and al, 0F7h
co_skipRight:
    cmp bx, word ptr clipMaxX
    jg short co_skipLeft
    and al, 0FEh
co_skipLeft:
    or bp, bp
    js short co_skipBottom
    and al, 0FBh
co_skipBottom:
    cmp bp, word ptr clipMaxY
    jg short co_skipTop
    and al, 0FDh
co_skipTop:
    or al, al
    retn
computeOutcode endp
