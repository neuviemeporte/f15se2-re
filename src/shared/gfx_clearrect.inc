; shared/gfx_clearrect.inc — Clear a rectangular area
;
; Required EQU definitions before INCLUDE:
;   clearRectGetCurBuf  - far proc: gfx_jump_10_getCurBuf
;   clearRectSetCurBuf  - far proc: gfx_jump_0d_setCurBuf
;   clearRectSetVal     - far proc: gfx_jump_20_setVal
;   clearRectJump28     - far proc: gfx_jump_28
;   clearRectJump22     - far proc: gfx_jump_22
;   clearRectNull       - far proc: gfx_jump_51_null
;   clearRectGetBufPtr  - far proc: gfx_jump_0f_getBufPtr
;   clearRectVar27      - word: min x storage
;   clearRectVar28      - word: min y storage
;   clearRectVar29      - word: width storage
;   clearRectVar30      - word: height storage
;   clearRectVar35      - array: dirty rect min x per row
;   clearRectVar36      - array: dirty rect max x per row
;   clearRectVar37      - word: dirtyRectMin
;   clearRectVar38      - word: dirtyRectMax

clearRect proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push BP
    push DS
    pop ES
    call far ptr clearRectGetCurBuf
    push AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    call far ptr clearRectSetCurBuf
    mov AH,byte ptr [BX + 6h]
    call far ptr clearRectSetVal
    call clearDirtyRects
    mov AX,word ptr [BP + 0Ah]
    sub AX,word ptr [BP + 6h]
    mov word ptr [clearRectVar29],AX
    mov AX,word ptr [BP + 0Ch]
    sub AX,word ptr [BP + 8h]
    inc AX
    mov word ptr [clearRectVar30],AX
    mov CX,word ptr [BP + 0Ch]
    mov SI,word ptr [BP + 8h]
    mov word ptr [clearRectVar28],SI
    mov word ptr [clearRectVar38],CX
    mov word ptr [clearRectVar37],SI
    sub CX,SI
    inc CX
    lea DI,word ptr [clearRectVar35]
    shl SI,1h
    add DI,SI
    mov AX,word ptr [BP + 6h]
    mov word ptr [clearRectVar27],AX
    mov DX,CX
    rep stosw
    mov CX,DX
    lea DI,word ptr [clearRectVar36]
    add DI,SI
    mov AX,word ptr [BP + 0Ah]
    rep stosw
    mov BX,offset clearRectVar35
    mov AX,word ptr [clearRectVar37]
    mov CX,word ptr [clearRectVar38]
    call far ptr clearRectJump28
    call far ptr clearRectJump22
    mov AX,word ptr [clearRectVar27]
    mov BX,word ptr [clearRectVar28]
    mov CX,word ptr [clearRectVar29]
    mov DX,word ptr [clearRectVar30]
    call far ptr clearRectNull
    pop AX
    call far ptr clearRectGetBufPtr
    pop BP
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
clearRect endp
