; shared/timer_calibrate.inc - calibrateTimerSpeed procedure
;
; Required EQU definitions before INCLUDE:
;   TIMER_VAR_DIVIDER    - tick divider byte
;   TIMER_VAR_SYNC       - sync-to-retrace flag (byte)
;   TIMER_VAR_CALSUM_LO  - calibration sum lo (word)
;   TIMER_VAR_CALSUM_HI  - calibration sum hi (word)
;   TIMER_VAR_COUNT_LO   - timer counter lo (word)
;   TIMER_VAR_COUNT_HI   - timer counter hi (word)
;   TIMER_VAR_MODE       - timer mode value (word)
;   TIMER_VAR_74         - tick reload value (word) (from timer_setHandler)
;   TIMER_VAR_DIVISOR    - current PIT divisor (word)
;   TIMER_VAR_TARGET     - target PIT divisor (word)

calibrateTimerSpeed proc near
    pushf
    cli
    mov TIMER_VAR_DIVIDER, 1
    xor ax, ax
    mov TIMER_VAR_SYNC, 1
    mov TIMER_VAR_CALSUM_LO, ax
    mov TIMER_VAR_CALSUM_HI, ax
    call manipulateTimer
    mov bx, ax
    mov cx, 10h
timerCal_loop:
    push bx
    call manipulateTimer
    pop bx
    sub bx, ax
    add TIMER_VAR_CALSUM_LO, bx
    adc TIMER_VAR_CALSUM_HI, 0
    mov bx, ax
    loop timerCal_loop
    mov ax, TIMER_VAR_CALSUM_LO
    mov dx, TIMER_VAR_CALSUM_HI
    add TIMER_VAR_COUNT_LO, ax
    adc TIMER_VAR_COUNT_HI, dx
    mov cx, 10h
    div cx
    shr ax, 1
    mov TIMER_VAR_CALSUM_LO, ax
    mov bx, ax
    shr bx, 1
    shr bx, 1
    shr bx, 1
    shr bx, 1
    add ax, bx
    xor dx, dx
    mov bx, 0F89h
    div bx
    db 3Dh
    dw 4
    jb short timerCal_noSync
    db 3Dh
    dw 6
    ja short timerCal_noSync
    jmp short timerCal_setMode
    nop
timerCal_noSync:
    mov TIMER_VAR_SYNC, 0
    mov TIMER_VAR_CALSUM_LO, 4DAEh
    mov ax, 5
timerCal_setMode:
    mov TIMER_VAR_MODE, ax
    cmp TIMER_VAR_74, 1
    jz short timerCal_skip74
    mov TIMER_VAR_74, ax
timerCal_skip74:
    mov ax, TIMER_VAR_CALSUM_LO
    xor dx, dx
    div TIMER_VAR_74
    mov TIMER_VAR_DIVISOR, ax
    mov TIMER_VAR_TARGET, ax
    popf
    retn
calibrateTimerSpeed endp
