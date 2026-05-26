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
;   clearRectX      - word: min x storage
;   clearRectY      - word: min y storage
;   clearRectWidth      - word: width storage
;   clearRectHeight      - word: height storage
;   clearRectDirtyMinBuf      - array: dirty rect min x per row
;   clearRectDirtyMaxBuf      - array: dirty rect max x per row
;   clearRectDirtyMin      - word: dirtyRectMin
;   clearRectDirtyMax      - word: dirtyRectMax

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
    mov word ptr [clearRectWidth],AX
    mov AX,word ptr [BP + 0Ch]
    sub AX,word ptr [BP + 8h]
    inc AX
    mov word ptr [clearRectHeight],AX
    mov CX,word ptr [BP + 0Ch]
    mov SI,word ptr [BP + 8h]
    mov word ptr [clearRectY],SI
    mov word ptr [clearRectDirtyMax],CX
    mov word ptr [clearRectDirtyMin],SI
    sub CX,SI
    inc CX
    lea DI,word ptr [clearRectDirtyMinBuf]
    shl SI,1h
    add DI,SI
    mov AX,word ptr [BP + 6h]
    mov word ptr [clearRectX],AX
    mov DX,CX
    rep stosw
    mov CX,DX
    lea DI,word ptr [clearRectDirtyMaxBuf]
    add DI,SI
    mov AX,word ptr [BP + 0Ah]
    rep stosw
    mov BX,offset clearRectDirtyMinBuf
    mov AX,word ptr [clearRectDirtyMin]
    mov CX,word ptr [clearRectDirtyMax]
    call far ptr clearRectJump28
    call far ptr clearRectJump22
    mov AX,word ptr [clearRectX]
    mov BX,word ptr [clearRectY]
    mov CX,word ptr [clearRectWidth]
    mov DX,word ptr [clearRectHeight]
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
