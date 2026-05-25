; shared/timer_setHandler.inc - setTimerIrqHandler procedure
;
; Required EQU definitions before INCLUDE:
;   TIMER_VAR_74        - timer counter/divider (word ptr)
;   TIMER_VAR_80        - timer counter (word ptr)
;   TIMER_VAR_70        - timer word variable (zeroed on init)
;   TIMER_VAR_71        - timer word variable (zeroed on init)
;   TIMER_CALIBRATE     - calibration routine name
;   TIMER_ISR_PTR       - CS-relative saved ISR pointer
;   TIMER_IRQ_ADDR      - CS-relative dword pointer to IRQ handler
;   TIMER_INSTALLED     - _timerHandlerInstalled byte variable

_setTimerIrqHandler proc near
    mov TIMER_VAR_74, 1
    mov TIMER_VAR_80, 1
    mov TIMER_VAR_70, 0
    mov TIMER_VAR_71, 0
    call TIMER_CALIBRATE
    mov ah, 35h
    mov al, 8
    int 21h
    mov word ptr cs:TIMER_ISR_PTR, bx
    mov word ptr cs:TIMER_ISR_PTR+2, es
    push ds
    mov ah, 25h
    mov al, 8
    lds dx, cs:TIMER_IRQ_ADDR
    int 21h
    pop ds
    mov TIMER_INSTALLED, 1
    retn
_setTimerIrqHandler endp
