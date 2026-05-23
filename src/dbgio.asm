; Minimal debug I/O helpers for egame debug build
.8086
.MODEL SMALL

PUBLIC _dos_creat
PUBLIC _dos_open
PUBLIC _dos_write
PUBLIC _dos_close

.CODE

; int dos_creat(const char *filename)
; Creates file, returns handle or -1
_dos_creat proc near
    push BP
    mov BP, SP
    mov DX, [BP+4]     ; filename pointer
    xor CX, CX         ; normal attributes
    mov AH, 3Ch
    int 21h
    jnc @@ok
    mov AX, -1
@@ok:
    pop BP
    ret
_dos_creat endp

; int dos_open(const char *filename)
; Opens file for writing, seeks to end, returns handle or -1
_dos_open proc near
    push BP
    mov BP, SP
    mov DX, [BP+4]     ; filename pointer
    mov AX, 3D01h      ; open for writing
    int 21h
    jnc @@ok2
    mov AX, -1
    jmp @@done2
@@ok2:
    ; seek to end
    mov BX, AX
    push BX
    xor CX, CX
    xor DX, DX
    mov AX, 4202h      ; lseek from end
    int 21h
    pop AX             ; return handle
@@done2:
    pop BP
    ret
_dos_open endp

; void dos_write(int fd, const char *buf, unsigned len)
_dos_write proc near
    push BP
    mov BP, SP
    mov BX, [BP+4]     ; file handle
    mov DX, [BP+6]     ; buffer pointer
    mov CX, [BP+8]     ; length
    mov AH, 40h
    int 21h
    pop BP
    ret
_dos_write endp

; void dos_close(int fd)
_dos_close proc near
    push BP
    mov BP, SP
    mov BX, [BP+4]
    mov AH, 3Eh
    int 21h
    pop BP
    ret
_dos_close endp

END
