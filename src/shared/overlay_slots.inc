; shared/overlay_slots.inc — Set up overlay jump table slots
;
; Required EQU definitions before INCLUDE:
;   ovlInsaneFlag     - byte: overlay "insane" flag
;   ovlJumpTable      - label: start of overlay jump table

setupOverlaySlots proc near
    push bp
    mov bp, sp
    push di
    push si
    push es
    push ds
    push bp
    mov dx, [bp+4]
    mov ovlInsaneFlag, 0
    jmp short ovlSane
    nop
    mov ovlInsaneFlag, 1
ovlSane:
    mov es, dx
    mov bx, offset ovlJumpTable
    mov di, 1Ch
    mov ax, es:[di]
    mov dl, 5
    mul dl
    add bx, ax
    mov di, 22h
    mov cx, es:[di]
    mov si, 24h
    mov di, 18h
    mov di, es:[di]
writeSlots:
    mov ax, es:[si]
    mov [bx+1], ax
    mov [bx+3], di
    add si, 2
    add bx, 5
    loop writeSlots
    cmp ovlInsaneFlag, 0
    jnz short sosExit
    pop bp
    pop ds
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
sosExit:
    retn
setupOverlaySlots endp
