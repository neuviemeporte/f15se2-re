; shared/file_write.inc — Write to file at raw position
;
; Required EQU definitions before INCLUDE:
;   fileWriteErrStr  - string: "Write error$"
;   fileWriteErrExit - label: error exit routine (errorAndExit)

writeFileAtRaw proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    push DS
    mov AH,40h
    mov BX,word ptr [BP + 0Ah]
    mov DS,BX
    mov BX,word ptr [BP + 4h]
    mov CX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    add DX,word ptr [BP + 0Ch]
    int 21h
    pop DS
    jnc short writeSuccess
    mov DX,offset fileWriteErrStr
    mov CX,0FFFFh
    jmp short fileWriteErrExit
    nop
writeSuccess:
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
writeFileAtRaw endp
