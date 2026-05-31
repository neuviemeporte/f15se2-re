; seg003 - Keyboard IRQ handler segment
; Contains setInt9Handler, restoreInt9Handler, and the keyboard ISR

.8086

DGROUP GROUP NULL, _DATA, _BSS
NULL SEGMENT WORD PUBLIC 'BEGDATA'
NULL ENDS
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
_BSS SEGMENT WORD PUBLIC 'BSS'
_BSS ENDS

EXTRN byte_37F98:BYTE
EXTRN byte_37F99:BYTE
EXTRN byte_37F9A:BYTE
EXTRN word_37F9B:WORD
EXTRN byte_37F9D:BYTE
EXTRN byte_37F9E:BYTE
EXTRN byte_37F9F:BYTE

seg003 SEGMENT BYTE PUBLIC 'CODE'
ASSUME CS:seg003, DS:DGROUP, SS:DGROUP

    ; padding before first routine (matches original 6 bytes at seg start)
    db 6 dup(0)

; offset 0x0006
    PUBLIC _setInt9Handler
_setInt9Handler proc far
    push ds
    mov ax, 40h
    mov ds, ax
    and byte ptr ds:17h, 0DFh
    xor ax, ax
    mov ss:56EAh, al
    mov ss:56EBh, ax
    mov ss:56EDh, al
    mov ss:56EEh, al
    mov ss:56EFh, al
    mov byte ptr ss:56E8h, 80h
    mov byte ptr ss:56E9h, 80h
    xor ax, ax
    mov ds, ax
    mov bx, 24h
    mov ax, [bx]
    mov dx, [bx+2]
    mov word ptr cs:savedInt9Ofs, ax
    mov word ptr cs:savedInt9Seg, dx
    mov ax, offset int9Handler
    mov dx, cs
    cli
    mov [bx], ax
    mov [bx+2], dx
    sti
    pop ds
    retf
_setInt9Handler endp

; offset 0x0056
    PUBLIC _restoreInt9Handler
_restoreInt9Handler proc far
    push ds
    xor ax, ax
    mov ds, ax
    mov bx, 24h
    mov ax, word ptr cs:savedInt9Ofs
    mov dx, word ptr cs:savedInt9Seg
    cli
    mov [bx], ax
    mov [bx+2], dx
    sti
    pop ds
    retf
_restoreInt9Handler endp

; offset 0x0070
int9Handler proc near
    sti
    pushf
    push ds
    push es
    push ax
    push bx
    mov ax, DGROUP
    mov ds, ax
    mov ax, 40h
    mov es, ax
    mov ah, byte_37F9F
    or ah, ah
    jz short @@checkScan
@@delayKey:
    dec ah
    mov byte_37F9F, ah
    jmp @@flushKbd
@@checkScan:
    in al, 60h
    cmp byte_37F9D, 0E0h
    mov byte_37F9D, al
    jz short @@processKey
    cmp al, 0E0h
    mov ah, 1
    jz short @@delayKey
    cmp al, 0E1h
    mov ah, 3
    jz short @@delayKey
    xor ah, ah
    test byte ptr es:17h, 20h
    jz short @@noNumLock
    xor ah, 1
@@noNumLock:
    test byte ptr es:17h, 3
    jz short @@noShift
    xor ah, 1
@@noShift:
    or ah, ah
    jz short @@processKey
@@jumpFlush:
    jmp @@flushKbd
@@processKey:
    mov ah, al
    and al, 7Fh
    cmp al, 51h
    ja short @@flushKbd
    sub al, 29h
    jb short @@flushKbd
    mov bx, 56F0h
    xlat
    or al, al
    jz short @@flushKbd
    test ah, 80h
    jnz short @@keyRelease
    cmp byte_37F9A, 0
    jnz short @@flushKbd
    mov byte_37F9A, al
    cmp byte_37F9E, al
    mov byte_37F9E, al
    jnz short @@newKey
    mov bx, es:6Ch
    sub bx, word_37F9B
    cmp bx, 5
    mov bh, 7Fh
    jb short @@setSpeed
@@newKey:
    mov bh, 5Ah
@@setSpeed:
    mov bl, 80h
    sub bl, bh
    add bh, 80h
    test al, 1
    jz short @@noLeft
    mov byte_37F99, bl
@@noLeft:
    test al, 2
    jz short @@noRight
    mov byte_37F99, bh
@@noRight:
    test al, 4
    jz short @@noUp
    mov byte_37F98, bl
@@noUp:
    test al, 8
    jz short @@noDown
    mov byte_37F98, bh
@@noDown:
    mov bx, es:6Ch
    mov word_37F9B, bx
    jmp short @@flushKbd
@@keyRelease:
    cmp byte_37F9A, al
    jnz short @@flushKbd
    mov byte_37F9A, 0
    mov byte_37F98, 80h
    mov byte_37F99, 80h
@@flushKbd:
    mov bx, es:1Ah
    cmp bx, es:1Ch
    jz short @@done
    mov ax, es:[bx]
@@flushLoop:
    add bx, 2
    cmp bx, es:82h
    jb short @@noWrap
    mov bx, es:80h
@@noWrap:
    cmp bx, es:1Ch
    jz short @@done
    cmp ax, es:[bx]
    jnz short @@done
    mov es:1Ah, bx
    jmp short @@flushLoop
@@done:
    pop bx
    pop ax
    pop es
    pop ds
    popf
    cli
    db 0EAh         ; far jump opcode
savedInt9Ofs dw 0   ; offset 0x0185
savedInt9Seg dw 0   ; offset 0x0187
    ; extra padding bytes to match original segment size
    db 0, 0
int9Handler endp

seg003 ENDS

END
