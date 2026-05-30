; shared_joystick.inc — Joystick polling, normalization, and data copy
;
; Required EQU definitions before INCLUDE:
;   joyRawAxis0      - word: raw joystick axis 0 reading
;   joyRawAxis1      - word: raw joystick axis 1 reading
;   joyMinValues     - word[4]: minimum axis values seen
;   joyMaxValues     - word[4]: maximum axis values seen
;   joyCenterValues  - word[4]: center calibration values
;   joyRangeBelow    - word[4]: range below center (for normalization)
;   joyRangeAbove    - word[4]: range above center (for normalization)
;   joyNormAxes      - byte[]: normalized axis output (indexed by axis)

pollJoystick proc far
    call readJoyPort
    mov BX,0
    call normalizeJoyAxis
    mov BX,1
    call normalizeJoyAxis
    mov AX,word ptr [joyNormAxes]
    retf
pollJoystick endp

readJoyPort proc near
    push BP
    xor BX,BX
    xor BP,BP
    mov CX,0FFFFh
    mov DX,201h
    cli
    out DX,AL
    jmp short $+2
    jmp short $+2
joyReadLoop:
    in AL,DX
    and AL,3
    jz short joyReadDone
    shr AL,1
    adc BX,0
    shr AL,1
    adc BP,0
    loop joyReadLoop
joyReadDone:
    sti
    mov word ptr [joyRawAxis0],BX
    mov word ptr [joyRawAxis1],BP
    pop BP
    ret
readJoyPort endp

normalizeJoyAxis proc near
    shl BX,1
    mov AX,word ptr [BX + offset joyRawAxis0]
    mov DX,AX
    sub DX,word ptr [BX + offset joyCenterValues]
    jc short joyBelowCenter
    ja short joyAboveCenter
    mov AH,80h
    jmp short joyNormDone
    db 90h
joyBelowCenter:
    neg DX
    cmp AX,word ptr [BX + offset joyMinValues]
    ja short joyNormBelow
    mov word ptr [BX + offset joyMinValues],AX
    mov word ptr [BX + offset joyRangeBelow],DX
    mov AH,0
    jmp short joyNormDone
    db 90h
joyNormBelow:
    xor AX,AX
    div word ptr [BX + offset joyRangeBelow]
    not AX
    shr AX,1
    jmp short joyNormDone
    db 90h
joyAboveCenter:
    cmp AX,word ptr [BX + offset joyMaxValues]
    jc short joyNormAbove
    mov word ptr [BX + offset joyMaxValues],AX
    mov word ptr [BX + offset joyRangeAbove],DX
    mov AH,0FFh
    jmp short joyNormDone
    db 90h
joyNormAbove:
    xor AX,AX
    div word ptr [BX + offset joyRangeAbove]
    shr AX,1
    add AH,80h
joyNormDone:
    shr BX,1
    mov byte ptr [BX + offset joyNormAxes],AH
    ret
normalizeJoyAxis endp

copyJoystickData proc far
    mov BX,SP
    push SI
    push DI
    push DS
    push ES
    lds SI,dword ptr [BX + 4]
    mov DI,offset joyMinValues
    push SS
    pop ES
    mov CX,14h
    rep movsw
    pop ES
    pop DS
    pop DI
    pop SI
    retf
copyJoystickData endp
