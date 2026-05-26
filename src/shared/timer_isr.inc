; shared/timer_isr.inc - timerIrqHandler ISR
;
; Required EQU definitions before INCLUDE:
;   TIMER_VAR_DIVISOR   - current PIT divisor (word)
;   TIMER_VAR_COUNT_LO  - timer counter lo (word)
;   TIMER_VAR_COUNT_HI  - timer counter hi (word)
;   TIMER_VAR_TICK      - tick countdown (word)
;   TIMER_VAR_74        - tick reload value (word) (from timer_setHandler)
;   TIMER_VAR_FLAG      - timer flag (byte)
;   TIMER_INC_COUNTERS  - name of increaseTimerCounters proc
;   TIMER_CALLBACK      - name of timerIrqCallback proc
;   TIMER_AUDIO_6C_CALL - text EQU for the far call instruction
;   TIMER_VAR_71        - timer counter hi (word) (from timer_setHandler)

timerIrqHandler proc far
    sti
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push bp
    push ds
    push es
    mov ax, @data
    mov ds, ax
    mov ax, TIMER_VAR_DIVISOR
    add TIMER_VAR_COUNT_LO, ax
    adc TIMER_VAR_COUNT_HI, 0
    dec TIMER_VAR_TICK
    jnz short timerIsr_skipReload
    mov ax, TIMER_VAR_74
    mov TIMER_VAR_TICK, ax
    call TIMER_CALLBACK
    mov TIMER_VAR_FLAG, 0
    call TIMER_INC_COUNTERS
timerIsr_skipReload:
    cmp TIMER_VAR_74, 1
    jz short timerIsr_skipFarCall
    TIMER_AUDIO_6C_CALL
timerIsr_skipFarCall:
    cmp TIMER_VAR_COUNT_HI, 0
    jnz short timerIsr_chainOld
    mov al, 20h
    out 20h, al
    pop es
    pop ds
    pop bp
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    iret
timerIsr_chainOld:
    dec TIMER_VAR_COUNT_HI
    pop es
    pop ds
    pop bp
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    cli
timerIsrPtr:
    db 0EAh
    dd 0
timerIrqHandler endp
