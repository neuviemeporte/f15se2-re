; shared/overlay_dispatch.inc — Software interrupt dispatch via register structure
;
; No EQU definitions required.

intDispatch proc near
    push bp
    mov bp, sp
    push si
    push di
    push ax
    push bx
    push cx
    push dx
    mov di, [bp+6]
    mov ax, [di]
    mov bx, [di+2]
    mov cx, [di+4]
    mov dx, [di+6]
    cmp word ptr [bp+4], 10h
    jz short idispVideo
    cmp word ptr [bp+4], 21h
    jz short idispDos
    cmp word ptr [bp+4], 16h
    jz short idispKbd
    cmp word ptr [bp+4], 1Ah
    jz short idispTime
    jmp short idispBad
    nop
idispVideo:
    int 10h
    jmp short idispStore
    nop
idispDos:
    int 21h
    jmp short idispStore
    nop
idispKbd:
    int 16h
    jmp short idispStore
    nop
idispTime:
    int 1Ah
    jmp short idispStore
    nop
idispBad:
    sub ax, ax
    not ax
    jmp short idispDone
    nop
idispStore:
    mov di, [bp+8]
    mov [di], ax
    mov [di+2], bx
    mov [di+4], cx
    mov [di+6], dx
idispDone:
    pop dx
    pop cx
    pop bx
    pop ax
    pop di
    pop si
    mov sp, bp
    pop bp
    retn
intDispatch endp
