; shared/file_read512.inc — Read 512 bytes from file into buffer
;
; Required EQU definitions before INCLUDE:
;   fileRead512Handle  - word: file handle variable
;   fileRead512Buf     - label: 512-byte read buffer
;   fileRead512ErrStr  - string: "Read error$"
;   fileRead512ErrExit - label: error exit routine (errorAndExit)

read512FromFileIntoBuf proc near
    push DS
    mov AH,3Fh
    mov BX,seg @data
    mov DS,BX
    mov BX,word ptr [fileRead512Handle]
    mov CX,200h
    mov DX,offset fileRead512Buf
    int 21h
    jnc short read512Success
    mov DX,offset fileRead512ErrStr
    mov CX,0FFFFh
    jmp short fileRead512ErrExit
    nop
read512Success:
    pop DS
    ret
read512FromFileIntoBuf endp
