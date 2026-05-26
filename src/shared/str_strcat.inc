; shared/str_strcat.inc — String concatenation (strcat)
;
; No EQU definitions required.

mystrcat proc near
    push BP
    mov BP,SP
    push SI
strcatFindEnd:
    mov BX,word ptr [BP + 4h]
    cmp byte ptr [BX],0h
    jz strcatAtEnd
    inc word ptr [BP + 4h]
    jmp strcatFindEnd
strcatNextChar:
    inc word ptr [BP + 4h]
    mov BX,word ptr [BP + 4h]
strcatAtEnd:
    mov SI,word ptr [BP + 6h]
    inc word ptr [BP + 6h]
    mov AL,byte ptr [SI]
    mov byte ptr [BX],AL
    or AL,AL
    jnz strcatNextChar
    pop SI
    pop BP
    ret
mystrcat endp
