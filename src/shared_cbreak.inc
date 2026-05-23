;
; shared_cbreak.inc - Ctrl+Break handler shared between start.exe and end.exe
;
; Required EQU definitions before INCLUDE:
;   cbreakSavedSeg - word variable for saved handler segment
;   cbreakSavedOfs - word variable for saved handler offset
;   cbreakFlag     - byte variable set to 0FFh on Ctrl+Break
;

_installCBreakHandler proc near
    push si
    push di
    push dx
    push ds
    mov si, 6Ch    ; IRQ_CBREAK (1Bh) * 4
    call getInterruptHandler
    mov word ptr cbreakSavedOfs, bx
    mov word ptr cbreakSavedSeg, ax
    mov ax, seg @code
    mov dx, offset cbreakHandler
    mov ds, ax
    mov ax, 251Bh
    int 21h        ; DOS - SET INTERRUPT VECTOR
    pop ds
    pop dx
    pop di
    pop si
    retn
_installCBreakHandler endp

_restoreCbreakHandler proc near
    push ds
    mov ax, word ptr cbreakSavedSeg
    mov dx, word ptr cbreakSavedOfs
    mov ds, ax
    mov ax, 251Bh
    int 21h        ; DOS - SET INTERRUPT VECTOR
    pop ds
    retn
_restoreCbreakHandler endp

getInterruptHandler proc near
    push ds
    xor ax, ax
    mov ds, ax
    mov bx, [si]
    mov ax, [si+2]
    pop ds
    retn
getInterruptHandler endp

cbreakHandler proc far
    push ds
    push ax
    mov ax, @data
    mov ds, ax
    mov byte ptr cbreakFlag, 0FFh
    pop ax
    pop ds
    iret
cbreakHandler endp
