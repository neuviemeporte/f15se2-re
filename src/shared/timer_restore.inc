; shared/timer_restore.inc - restoreTimerIrqHandler procedure
;
; Required EQU definitions before INCLUDE:
;   TIMER_ISR_PTR       - CS-relative saved ISR pointer (from timer_setHandler)
;   TIMER_INSTALLED     - _timerHandlerInstalled byte variable (from timer_setHandler)

_restoreTimerIrqHandler proc near
    mov al, 36h
    out 43h, al
    jmp short $+2
    xor al, al
    out 40h, al
    jmp short $+2
    out 40h, al
    push ds
    mov ah, 25h
    mov al, 8
    lds dx, dword ptr cs:TIMER_ISR_PTR
    int 21h
    pop ds
    mov TIMER_INSTALLED, 0
    retn
_restoreTimerIrqHandler endp
