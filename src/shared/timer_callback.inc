; shared/timer_callback.inc - timerIrqCallback procedure
;
; Required EQU definitions before INCLUDE:
;   TIMER_VAR_DIVIDER   - tick divider byte
;   TIMER_VAR_SYNC      - sync-to-retrace flag (byte)
;   TIMER_VAR_DIVISOR   - current PIT divisor (word)
;   TIMER_VAR_TARGET    - target PIT divisor (word)
;   TIMER_VAR_TICKCNT   - tick counter (word)
;   TIMER_VAR_RETRACE   - retrace detected flag (word)
;   TIMER_VAR_TICK      - tick countdown (word)

timerIrqCallback proc near
    dec TIMER_VAR_DIVIDER
    jnz short timerCb_end
    mov TIMER_VAR_DIVIDER, 14h
    cmp TIMER_VAR_SYNC, 0
    jz short timerCb_reprogram
    xor bl, bl
    xor cx, cx
    mov es, cx
    mov dx, es:[463h]
    add dx, 6
    cmp dx, 3BAh
    jz short timerCb_mono
timerCb_color:
    cli
    in al, dx
    test al, 8
    jnz short timerCb_reprogram
    sti
    and al, 1
    cmp al, bl
    jz short timerCb_color
    xor bl, 1
    loop timerCb_color
    jmp short timerCb_timeout
timerCb_mono:
    cli
    in al, dx
    test al, 80h
    jz short timerCb_reprogram
    sti
    and al, 1
    cmp al, bl
    jz short timerCb_color
    xor bl, 1
    loop timerCb_mono
timerCb_timeout:
    mov TIMER_VAR_SYNC, 0
    jmp short timerCb_end
timerCb_reprogram:
    mov dx, TIMER_VAR_DIVISOR
    cmp dx, TIMER_VAR_TARGET
    jz short timerCb_doReprogram
    mov dx, TIMER_VAR_TARGET
    mov TIMER_VAR_DIVISOR, dx
timerCb_doReprogram:
    mov al, 36h
    out 43h, al
    jmp short $+2
    mov al, dl
    out 40h, al
    jmp short $+2
    mov al, dh
    out 40h, al
    inc TIMER_VAR_TICKCNT
    neg cx
    mov TIMER_VAR_RETRACE, cx
    jz short timerCb_end
    inc TIMER_VAR_TICK
timerCb_end:
    sti
    retn
timerIrqCallback endp
