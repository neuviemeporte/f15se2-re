.8086
DOSSEG
.MODEL SMALL

Stack equ 0
local_res0 equ 0
param_1 equ 4h
param_2 equ 6h
param_3 equ 8h
a equ 2h
b equ 6h

.CODE
EXTRN _routine_91:PROC
EXTRN _actualDrawString:PROC
EXTRN _stringWidth:PROC
EXTRN _drawString:PROC
EXTRN _mystrcpy:PROC
EXTRN _cleanup:PROC
EXTRN _routine_34:PROC
EXTRN _loadPic:PROC
EXTRN _openShowPic:PROC
EXTRN _allocBuffer:PROC
IFDEF DEBUG
EXTRN _my_trace:PROC
ENDIF
PUBLIC _gfx_jump_05_drawString
PUBLIC _gfx_jump_2f_charWidth
PUBLIC _var_69
PUBLIC _str_allocError

; --- Code segment ---

PUBLIC _main
routine_10 proc near
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
    db 00h
routine_10 endp

_main:
main proc near
    push BP
    mov BP,SP
    sub SP,0eh
    push SI
IFDEF DEBUG
    mov AX,offset _trace_main_enter
    push AX
    call _my_trace
    add SP,2
ENDIF
    mov word ptr [BP + -8h],0h
    mov word ptr [BP + -0ah],4f0h
    les BX,dword ptr [BP + -0ah]
    mov SI,word ptr ES:[BX]
    mov word ptr [_var_223],SI
    mov word ptr [_var_222],0h
    mov word ptr [_var_179],SI
    mov word ptr [_var_178],120eh
IFDEF DEBUG
    mov AX,offset _trace_main_r14
    push AX
    call _my_trace
    add SP,2
ENDIF
    les BX,dword ptr [_var_222]
    push word ptr ES:[BX + 1ah]
    call routine_14
    add SP,2h
    les BX,dword ptr [_var_222]
    push word ptr ES:[BX + 1eh]
    call routine_14
    add SP,2h
IFDEF DEBUG
    mov AX,offset _trace_main_misc5e
    push AX
    call _my_trace
    add SP,2
ENDIF
    call far ptr misc_jump_5e_clearKeyFlags
IFDEF DEBUG
    mov AX,offset _trace_main_r16
    push AX
    call _my_trace
    add SP,2
ENDIF
    call routine_16
    les BX,dword ptr [_var_222]
    mov AL,byte ptr ES:[BX + 24h]
    mov byte ptr [_var_191],AL
IFDEF DEBUG
    mov AX,offset _trace_main_cbreak
    push AX
    call _my_trace
    add SP,2
ENDIF
    call installCBreakHandler
IFDEF DEBUG
    mov AX,offset _trace_main_r18
    push AX
    call _my_trace
    add SP,2
ENDIF
    call routine_18
    les BX,dword ptr [_var_222]
    cmp word ptr ES:[BX + 72h],1h
    jnz LAB_1000_008e
    mov AX,BX
    mov DX,ES
    db 05h, 48h, 00h  ; add AX,48h (force word-immediate encoding)
    push DX
    push AX
    call far ptr copyJoystickData
    add SP,4h
    jmp LAB_1000_0096
LAB_1000_008e:
    mov AL,80h
    mov byte ptr [_var_56],AL
    mov byte ptr [_var_55],AL
LAB_1000_0096:
IFDEF DEBUG
    mov AX,offset _trace_main_r20
    push AX
    call _my_trace
    add SP,2
ENDIF
    call routine_20
    call far ptr gfx_jump_31
    mov word ptr [BP + -6h],AX
    call far ptr gfx_jump_17_bufSize
    mov word ptr [BP + -2h],AX
    push word ptr [BP + -6h]
    call allocBuffer
    add SP,2h
    mov word ptr [_var_226],AX
    cmp word ptr [_var_189],1h
    jnz LAB_1000_00d2
    mov AX,3c8ch
    push AX
    call allocBuffer
    add SP,2h
    mov word ptr [_var_230],AX
    mov word ptr [_var_232],AX
    mov word ptr [_var_231],0h
LAB_1000_00d2:
    push word ptr [BP + -2h]
    call allocBuffer
    add SP,2h
    mov word ptr [_var_229],AX
    mov word ptr [_var_201],3h
    les BX,dword ptr [_var_222]
    cmp word ptr ES:[BX + 26h],2h
    jnz LAB_1000_00f2
    call routine_24
LAB_1000_00f2:
    call routine_16
IFDEF DEBUG
    mov AX,offset _trace_main_r25
    push AX
    call _my_trace
    add SP,2
ENDIF
    call routine_25
    call routine_26
    call routine_16
IFDEF DEBUG
    mov AX,offset _trace_main_r27
    push AX
    call _my_trace
    add SP,2
ENDIF
    call routine_27
    call routine_28
IFDEF DEBUG
    mov AX,offset _trace_main_r8
    push AX
    call _my_trace
    add SP,2
ENDIF
    mov AX,23h
    push AX
    call routine_8
    add SP,2h
    pop SI
    mov SP,BP
    pop BP
    ret
main endp

routine_26 proc near
    cmp byte ptr [_var_57],0h
    jz LAB_1000_0129
    call cleanup
    call routine_28
    sub AX,AX
    push AX
    call routine_8
    add SP,2h
LAB_1000_0129:
    ret
routine_26 endp

routine_18 proc near
    push BP
    mov BP,SP
    sub SP,10h
    call routine_34
    sub AX,AX
    push AX
    call far ptr gfx_jump_0e_setCurBuf
    add SP,2h
    sub AX,AX
    push AX
    call far ptr gfx_jump_0_alloc
    add SP,2h
    sub AX,AX
    push AX
    call far ptr gfx_jump_53
    add SP,2h
    les BX,dword ptr [_var_222]
    push word ptr ES:[BX + 24h]
    call far ptr gfx_jump_52
    add SP,2h
    mov AX,1h
    push AX
    call far ptr gfx_jump_44_setDac
    add SP,2h
    mov AX,1h
    push AX
    les BX,dword ptr [_var_222]
    push word ptr ES:[BX + 20h]
    call far ptr gfx_jump_4b_storeBufPtr
    mov SP,BP
    pop BP
    ret
routine_18 endp

cleanup equ _cleanup

routine_6 proc near
    ret
routine_6 endp

routine_5 proc near
    ret
routine_5 endp

routine_20 proc near
    push BP
    mov BP,SP
    sub SP,4h
    call routine_41
    mov word ptr [_var_206],1h
    call routine_42
    mov word ptr [_var_217],offset _var_218
    mov word ptr [BP + -2h],1h
    mov word ptr [BP + -4h],0h
LAB_1000_01dc:
    mov BX,word ptr [BP + -4h]
    cmp byte ptr [BX + 56d0h],0h
    jnz LAB_1000_01fe
    cmp word ptr [BP + -2h],64h
    jge LAB_1000_01fe
    mov BX,word ptr [BP + -2h]
    inc word ptr [BP + -2h]
    shl BX,1h
    mov AX,word ptr [BP + -4h]
    add AX,56d1h
    mov word ptr [BX + 5608h],AX
LAB_1000_01fe:
    inc word ptr [BP + -4h]
    cmp word ptr [BP + -4h],2eeh
    jl LAB_1000_01dc
    mov SP,BP
    pop BP
    ret
routine_20 endp

routine_42 proc near
    mov AX,2h
    push AX
    mov AX,offset dat_4246
    push AX
    call routine_71
    add SP,4h
    mov AX,2h
    push AX
    mov AX,offset _var_203
    push AX
    call routine_71
    add SP,4h
    mov AX,2h
    push AX
    mov AX,offset dat_4040
    push AX
    call routine_71
    add SP,4h
    mov AX,2h
    push AX
    mov AX,offset dat_5ab4
    push AX
    call routine_71
    add SP,4h
    mov AX,word ptr [_var_203]
    mov CL,4h
    shl AX,CL
    push AX
    mov AX,offset dat_424e
    push AX
    call routine_71
    add SP,4h
    mov AX,2h
    push AX
    mov AX,offset _var_216
    push AX
    call routine_71
    add SP,4h
    mov AX,24h
    imul word ptr [_var_216]
    push AX
    mov AX,offset dat_4a2a
    push AX
    call routine_71
    add SP,4h
    mov AX,64h
    push AX
    mov AX,offset _var_204
    push AX
    call routine_71
    add SP,4h
    mov AX,64h
    push AX
    mov AX,offset dat_5512
    push AX
    call routine_71
    add SP,4h
    mov AX,2eeh
    push AX
    mov AX,offset _var_218
    push AX
    call routine_71
    add SP,4h
    mov AX,100h
    push AX
    mov AX,offset _var_184
    push AX
    call routine_71
    add SP,4h
    mov AX,2h
    push AX
    mov AX,offset dat_55de
    push AX
    call routine_71
    add SP,4h
    mov AX,2h
    push AX
    mov AX,offset dat_4034
    push AX
    call routine_71
    add SP,4h
    mov AX,10h
    push AX
    mov AX,offset dat_0042
    push AX
    call routine_71
    add SP,4h
    mov AX,24h
    push AX
    mov AX,offset _var_185
    push AX
    call routine_71
    add SP,4h
    mov AX,600h
    push AX
    mov AX,offset _var_193
    push AX
    call routine_71
    add SP,4h
    ret
routine_42 endp

routine_71 proc near
    push BP
    mov BP,SP
    cmp word ptr [_var_206],0h
    jz LAB_1000_0312
    push word ptr [_var_177]
    mov AX,1h
    push AX
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call routine_108
    jmp LAB_1000_0323
LAB_1000_0312:
    push word ptr [_var_177]
    mov AX,1h
    push AX
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call routine_109
LAB_1000_0323:
    add SP,8h
    pop BP
    ret
routine_71 endp

routine_41 proc near
    mov AX,word ptr [_var_222]
    mov DX,word ptr [_var_223]
    db 05h, 7Ah, 00h  ; add AX,7Ah (force word-immediate)
    mov word ptr [_var_151],AX
    mov word ptr [_var_152],DX
    mov AX,1h
    ret
routine_41 endp

routine_108 proc near
    push BP
    mov BP,SP
    sub SP,4h
    push SI
    mov AX,word ptr [BP + 4h]
    mov word ptr [BP + -4h],AX
    mov word ptr [BP + -2h],DS
    mov AX,word ptr [BP + 6h]
    imul word ptr [BP + 8h]
    mov SI,AX
    push SI
    push word ptr [BP + -4h]
    push DS
    push word ptr [_var_151]
    push word ptr [_var_152]
    call routine_140
    add SP,0ah
    add word ptr [_var_151],SI
    pop SI
    mov SP,BP
    pop BP
    ret
routine_108 endp

routine_109 proc near
    push BP
    mov BP,SP
    sub SP,4h
    push SI
    mov AX,word ptr [BP + 4h]
    mov word ptr [BP + -4h],AX
    mov word ptr [BP + -2h],DS
    mov AX,word ptr [BP + 6h]
    imul word ptr [BP + 8h]
    mov SI,AX
    push SI
    push word ptr [_var_151]
    push word ptr [_var_152]
    push word ptr [BP + -4h]
    push DS
    call routine_140
    add SP,0ah
    add word ptr [_var_151],SI
    pop SI
    mov SP,BP
    pop BP
    ret
    db 0C3h
routine_109 endp

routine_16 proc near
    jmp FUN_1000_03ad
LAB_1000_03a8:
    call far ptr misc_jump_5b_getkey
routine_16 endp

FUN_1000_03ad proc near
    call far ptr misc_jump_5a_keybuf
    or AX,AX
    jz LAB_1000_03a8
    ret
FUN_1000_03ad endp

routine_66 proc near
    push BP
    mov BP,SP
    sub SP,2h
    les BX,dword ptr [_var_222]
    cmp word ptr ES:[BX + 72h],1h
    jnz LAB_1000_03e9
LAB_1000_03c8:
    call far ptr misc_jump_5a_keybuf
    or AX,AX
    jz LAB_1000_03e0
    sub AX,AX
    push AX
    call far ptr misc_jump_5d_readJoy
    add SP,2h
    or AX,AX
    jz LAB_1000_03c8
LAB_1000_03e0:
    call far ptr misc_jump_5a_keybuf
    or AX,AX
    jnz LAB_1000_03f1
LAB_1000_03e9:
    call far ptr misc_jump_5b_getkey
    mov word ptr [BP + -2h],AX
LAB_1000_03f1:
    cmp word ptr [BP + -2h],1000h
    jz LAB_1000_03ff
    cmp byte ptr [_var_57],0h
    jz LAB_1000_0415
LAB_1000_03ff:
    call cleanup
    cmp byte ptr [_var_57],0h
    jz LAB_1000_040c
    call routine_28
LAB_1000_040c:
    sub AX,AX
    push AX
    call routine_8
    add SP,2h
LAB_1000_0415:
    mov SP,BP
    pop BP
    ret
    db 90h
routine_66 endp

FUN_1000_041a proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 0ah]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 0ch]
    mov word ptr [BX + 0ah],AX
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call FUN_1000_0469
    add SP,6h
    mov SP,BP
    pop BP
    ret
FUN_1000_041a endp

actualDrawString equ _actualDrawString

FUN_1000_0469 proc near
    push BP
    mov BP,SP
    sub SP,0c8h
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    lea AX,[BP + 0ff38h]
    push AX
    call FUN_1000_0a74
    add SP,6h
    lea AX,[BP + 0ff38h]
    push AX
    push word ptr [BP + 4h]
    call far ptr gfx_jump_05_drawString
    add SP,4h
    mov SP,BP
    pop BP
    ret
FUN_1000_0469 endp

FUN_1000_0495 proc near
    push BP
    mov BP,SP
    sub SP,20eh
    push SI
    mov AX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    mov word ptr [BP + -14h],AX
    mov word ptr [BP + -12h],DX
    mov word ptr [BP + -6h],AX
    mov word ptr [BP + -4h],DX
    mov word ptr [BP + -0ah],AX
    mov word ptr [BP + -8h],DX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX + 0ch]
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [BP + 0eh]
    mov word ptr [BX + 0ah],AX
    mov byte ptr [BP + -16h],1h
LAB_1000_04c8:
    cmp byte ptr [BP + -16h],0h
    jnz LAB_1000_04d1
    jmp LAB_1000_05dd
LAB_1000_04d1:
    sub AX,AX
    mov word ptr [BP + -0ch],AX
    mov word ptr [BP + -18h],AX
LAB_1000_04d9:
    mov AX,word ptr [BP + 0ah]
    cmp word ptr [BP + -18h],AX
    jnc LAB_1000_0512
    les BX,dword ptr [BP + -0ah]
    mov AL,byte ptr ES:[BX]
    mov byte ptr [BP + -20eh],AL
    or AL,AL
    jz LAB_1000_0512
    cmp AL,0dh
    jz LAB_1000_0512
    cmp AL,0ah
    jz LAB_1000_0512
    push word ptr [BP + -2h]
    inc word ptr [BP + -0ah]
    mov AL,byte ptr ES:[BX]
    cbw
    push AX
    call far ptr gfx_jump_2f_charWidth
    add SP,4h
    add word ptr [BP + -18h],AX
    inc word ptr [BP + -0ch]
    jmp LAB_1000_04d9
LAB_1000_0512:
    mov AX,word ptr [BP + 0ah]
    cmp word ptr [BP + -18h],AX
    jc LAB_1000_0520
    dec word ptr [BP + -0ah]
    dec word ptr [BP + -0ch]
LAB_1000_0520:
    les BX,dword ptr [BP + -0ah]
    mov AL,byte ptr ES:[BX]
    mov byte ptr [BP + -20eh],AL
    cmp AL,20h
    jz LAB_1000_0550
    or AL,AL
    jz LAB_1000_0550
    cmp AL,0dh
    jz LAB_1000_0550
    cmp AL,0ah
    jz LAB_1000_0550
    cmp AL,2dh
    jz LAB_1000_0550
    mov AX,word ptr [BP + -14h]
    mov DX,word ptr [BP + -12h]
    cmp BX,AX
    jbe LAB_1000_0550
    dec word ptr [BP + -0ah]
    dec word ptr [BP + -0ch]
    jmp LAB_1000_0520
LAB_1000_0550:
    mov BX,word ptr [BP + -0ah]
    cmp byte ptr ES:[BX],2dh
    jnz LAB_1000_055c
    inc word ptr [BP + -0ch]
LAB_1000_055c:
    les BX,dword ptr [BP + -6h]
    cmp byte ptr ES:[BX],20h
    jnz LAB_1000_056a
    inc word ptr [BP + -6h]
    jmp LAB_1000_055c
LAB_1000_056a:
    les BX,dword ptr [BP + -0ah]
    cmp byte ptr ES:[BX],0h
    jnz LAB_1000_0577
    mov byte ptr [BP + -16h],0h
LAB_1000_0577:
    cmp word ptr [BP + -0ch],0h
    jz LAB_1000_05cb
    push word ptr [BP + -0ch]
    push word ptr [BP + -4h]
    push word ptr [BP + -6h]
    lea AX,[BP + 0fdf4h]
    push AX
    call FUN_1000_0b40
    add SP,8h
    mov SI,word ptr [BP + -0ch]
    mov byte ptr [BP + SI + 0fdf4h],0h
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 0ch]
    mov word ptr [BX + 8h],AX
    lea AX,[BP + 0fdf4h]
    push AX
    push word ptr [BP + 4h]
    call far ptr gfx_jump_05_drawString
    add SP,4h
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 10h]
    add word ptr [BX + 0ah],AX
    les BX,dword ptr [BP + -0ah]
    cmp byte ptr ES:[BX],0dh
    jnz LAB_1000_05cb
    mov BX,word ptr [BP + 4h]
    add word ptr [BX + 0ah],2h
LAB_1000_05cb:
    inc word ptr [BP + -0ah]
    mov AX,word ptr [BP + -0ah]
    mov DX,word ptr [BP + -8h]
    mov word ptr [BP + -6h],AX
    mov word ptr [BP + -4h],DX
    jmp LAB_1000_04c8
LAB_1000_05dd:
    pop SI
    mov SP,BP
    pop BP
    ret
FUN_1000_0495 endp

routine_130 proc near
    push BP
    mov BP,SP
    sub SP,3fah
    push SI
    mov AX,word ptr [BP + 6h]
    mov word ptr [BP + -0ch],AX
    mov word ptr [BP + -4h],AX
    mov word ptr [BP + -6h],AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX + 0ch]
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [BP + 0ch]
    mov word ptr [BX + 0ah],AX
    mov byte ptr [BP + -0eh],1h
LAB_1000_0609:
    cmp byte ptr [BP + -0eh],0h
    jnz LAB_1000_0612
    jmp LAB_1000_06fc
LAB_1000_0612:
    sub AX,AX
    mov word ptr [BP + -8h],AX
    mov word ptr [BP + -10h],AX
LAB_1000_061a:
    mov AX,word ptr [BP + 8h]
    cmp word ptr [BP + -10h],AX
    jnc LAB_1000_0652
    mov BX,word ptr [BP + -6h]
    mov AL,byte ptr [BX]
    mov byte ptr [BP + -3fah],AL
    or AL,AL
    jz LAB_1000_0652
    cmp AL,0dh
    jz LAB_1000_0652
    cmp AL,0ah
    jz LAB_1000_0652
    push word ptr [BP + -2h]
    inc word ptr [BP + -6h]
    mov AL,byte ptr [BX]
    sub AH,AH
    push AX
    call far ptr gfx_jump_2f_charWidth
    add SP,4h
    add word ptr [BP + -10h],AX
    inc word ptr [BP + -8h]
    jmp LAB_1000_061a
LAB_1000_0652:
    mov AX,word ptr [BP + 8h]
    cmp word ptr [BP + -10h],AX
    jc LAB_1000_0660
    dec word ptr [BP + -6h]
    dec word ptr [BP + -8h]
LAB_1000_0660:
    mov BX,word ptr [BP + -6h]
    mov AL,byte ptr [BX]
    mov byte ptr [BP + -3fah],AL
    cmp AL,20h
    jz LAB_1000_068c
    or AL,AL
    jz LAB_1000_068c
    cmp AL,0dh
    jz LAB_1000_068c
    cmp AL,0ah
    jz LAB_1000_068c
    cmp AL,2dh
    jz LAB_1000_068c
    mov AX,word ptr [BP + -0ch]
    cmp BX,AX
    jbe LAB_1000_068c
    dec word ptr [BP + -6h]
    dec word ptr [BP + -8h]
    jmp LAB_1000_0660
LAB_1000_068c:
    mov BX,word ptr [BP + -6h]
    cmp byte ptr [BX],2dh
    jnz LAB_1000_0697
    inc word ptr [BP + -8h]
LAB_1000_0697:
    cmp byte ptr [BX],0h
    jnz LAB_1000_06a0
    mov byte ptr [BP + -0eh],0h
LAB_1000_06a0:
    cmp word ptr [BP + -8h],0h
    jz LAB_1000_06f0
    push word ptr [BP + -8h]
    push word ptr [BP + -4h]
    lea AX,[BP + 0fc08h]
    push AX
    call routine_146
    add SP,6h
    mov SI,word ptr [BP + -8h]
    mov byte ptr [BP + SI + 0fc08h],0h
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 0ah]
    mov word ptr [BX + 8h],AX
    lea AX,[BP + 0fc08h]
    push AX
    push word ptr [BP + 4h]
    call far ptr gfx_jump_05_drawString
    add SP,4h
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 0eh]
    add word ptr [BX + 0ah],AX
    mov BX,word ptr [BP + -6h]
    cmp byte ptr [BX],0dh
    jnz LAB_1000_06f0
    mov BX,word ptr [BP + 4h]
    add word ptr [BX + 0ah],2h
LAB_1000_06f0:
    inc word ptr [BP + -6h]
    mov AX,word ptr [BP + -6h]
    mov word ptr [BP + -4h],AX
    jmp LAB_1000_0609
LAB_1000_06fc:
    pop SI
    mov SP,BP
    pop BP
    ret
routine_130 endp

drawString equ _drawString

stringWidth equ _stringWidth

my_ltoa proc near
    push BP
    mov BP,SP
    sub SP,0ch
    push SI
    mov AX,word ptr [BP + 8h]
    mov word ptr [BP + -8h],AX
    cmp word ptr [BP + 6h],0h
    jge LAB_1000_07aa
    mov AX,word ptr [BP + 4h]
    mov DX,word ptr [BP + 6h]
    neg AX
    adc DX,0h
    neg DX
    mov word ptr [BP + 4h],AX
    mov word ptr [BP + 6h],DX
    mov BX,word ptr [BP + -8h]
    mov byte ptr [BX],2dh
    inc word ptr [BP + -8h]
LAB_1000_07aa:
    mov AX,0ah
    cwd
    push DX
    push AX
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call routine_139
    mov byte ptr [BP + -6h],AL
    mov AX,0ah
    cwd
    push DX
    push AX
    lea AX,[BP + 4h]
    push AX
    call routine_101
    mov AX,0ah
    cwd
    push DX
    push AX
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call routine_139
    mov byte ptr [BP + -5h],AL
    mov AX,0ah
    cwd
    push DX
    push AX
    lea AX,[BP + 4h]
    push AX
    call routine_101
    mov AX,0ah
    cwd
    push DX
    push AX
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call routine_139
    mov byte ptr [BP + -4h],AL
    mov AX,0ah
    cwd
    push DX
    push AX
    lea AX,[BP + 4h]
    push AX
    call routine_101
    mov AX,0ah
    cwd
    push DX
    push AX
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call routine_139
    mov byte ptr [BP + -3h],AL
    mov AX,0ah
    cwd
    push DX
    push AX
    lea AX,[BP + 4h]
    push AX
    call routine_101
    mov AX,0ah
    cwd
    push DX
    push AX
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call routine_139
    mov byte ptr [BP + -2h],AL
    mov AX,0ah
    cwd
    push DX
    push AX
    lea AX,[BP + 4h]
    push AX
    call routine_101
    mov AX,0ah
    cwd
    push DX
    push AX
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call routine_139
    mov byte ptr [BP + -1h],AL
    mov byte ptr [BP + -0ah],0h
    mov byte ptr [BP + -0ch],5h
    jmp LAB_1000_0864
LAB_1000_0861:
    dec byte ptr [BP + -0ch]
LAB_1000_0864:
    cmp byte ptr [BP + -0ch],0h
    jle LAB_1000_087a
    mov AL,byte ptr [BP + -0ch]
    cbw
    mov SI,AX
    cmp byte ptr [BP + SI + -6h],0h
    jz LAB_1000_0878
    jmp LAB_1000_087a
LAB_1000_0878:
    jmp LAB_1000_0861
LAB_1000_087a:
    cmp byte ptr [BP + -0ch],2h
    jnz LAB_1000_088f
    cmp byte ptr [BP + -0ah],1h
    jnz LAB_1000_088f
    mov BX,word ptr [BP + -8h]
    mov byte ptr [BX],2ch
    inc word ptr [BP + -8h]
LAB_1000_088f:
    mov AL,byte ptr [BP + -0ch]
    cbw
    mov SI,AX
    mov AL,byte ptr [BP + SI + -6h]
    add AL,30h
    mov BX,word ptr [BP + -8h]
    mov byte ptr [BX],AL
    mov byte ptr [BP + -0ah],1h
    inc word ptr [BP + -8h]
    dec byte ptr [BP + -0ch]
    jns LAB_1000_087a
    mov BX,word ptr [BP + -8h]
    mov byte ptr [BX],0h
    pop SI
    mov SP,BP
    pop BP
    ret
my_ltoa endp

my_itoa proc near
    push BP
    mov BP,SP
    sub SP,0ch
    push SI
    mov AX,word ptr [BP + 6h]
    mov word ptr [BP + -8h],AX
    cmp word ptr [BP + 4h],0h
    jge LAB_1000_08da
    mov AX,word ptr [BP + 4h]
    neg AX
    mov word ptr [BP + 4h],AX
    mov BX,word ptr [BP + -8h]
    mov byte ptr [BX],2dh
    inc word ptr [BP + -8h]
LAB_1000_08da:
    mov AX,word ptr [BP + 4h]
    cwd
    mov CX,0ah
    idiv CX
    mov byte ptr [BP + -6h],DL
    mov AX,word ptr [BP + 4h]
    cwd
    idiv CX
    mov word ptr [BP + 4h],AX
    cwd
    idiv CX
    mov byte ptr [BP + -5h],DL
    mov AX,word ptr [BP + 4h]
    cwd
    idiv CX
    mov word ptr [BP + 4h],AX
    cwd
    idiv CX
    mov byte ptr [BP + -4h],DL
    mov AX,word ptr [BP + 4h]
    cwd
    idiv CX
    mov word ptr [BP + 4h],AX
    cwd
    idiv CX
    mov byte ptr [BP + -3h],DL
    mov AX,word ptr [BP + 4h]
    cwd
    idiv CX
    mov word ptr [BP + 4h],AX
    cwd
    idiv CX
    mov byte ptr [BP + -2h],DL
    mov AX,word ptr [BP + 4h]
    cwd
    idiv CX
    mov word ptr [BP + 4h],AX
    cwd
    idiv CX
    mov byte ptr [BP + -1h],DL
    mov byte ptr [BP + -0ah],0h
    mov byte ptr [BP + -0ch],5h
    jmp LAB_1000_093e
LAB_1000_093b:
    dec byte ptr [BP + -0ch]
LAB_1000_093e:
    cmp byte ptr [BP + -0ch],0h
    jle LAB_1000_0954
    mov AL,byte ptr [BP + -0ch]
    cbw
    mov SI,AX
    cmp byte ptr [BP + SI + -6h],0h
    jz LAB_1000_0952
    jmp LAB_1000_0954
LAB_1000_0952:
    jmp LAB_1000_093b
LAB_1000_0954:
    cmp byte ptr [BP + -0ch],2h
    jnz LAB_1000_0969
    cmp byte ptr [BP + -0ah],1h
    jnz LAB_1000_0969
    mov BX,word ptr [BP + -8h]
    mov byte ptr [BX],2ch
    inc word ptr [BP + -8h]
LAB_1000_0969:
    mov AL,byte ptr [BP + -0ch]
    cbw
    mov SI,AX
    mov AL,byte ptr [BP + SI + -6h]
    add AL,30h
    mov BX,word ptr [BP + -8h]
    mov byte ptr [BX],AL
    mov byte ptr [BP + -0ah],1h
    inc word ptr [BP + -8h]
    dec byte ptr [BP + -0ch]
    jns LAB_1000_0954
    mov BX,word ptr [BP + -8h]
    mov byte ptr [BX],0h
    pop SI
    mov SP,BP
    pop BP
    ret
my_itoa endp

FUN_1000_0990 proc near
    push BP
    mov BP,SP
    mov byte ptr [_var_81],0h
    call setTimerIrqHandler
LAB_1000_099b:
    mov AL,byte ptr [_var_81]
    sub AH,AH
    cmp word ptr [BP + 4h],AX
    jc LAB_1000_09a7
    jmp LAB_1000_099b
LAB_1000_09a7:
    call restoreTimerIrqHandler
    mov SP,BP
    pop BP
    ret
FUN_1000_0990 endp

routine_34 equ _routine_34

FUN_1000_09bf proc near
    push BP
    mov BP,SP
    call FUN_1000_4cca
    cwd
    push DX
    push AX
    sub AX,AX
    push AX
    push word ptr [BP + 4h]
    call __aNlmul
    mov CL,0fh
LAB_1000_09d3:
    sar DX,1h
    rcr AX,1h
    dec CL
    jz LAB_1000_09dd
    jmp LAB_1000_09d3
LAB_1000_09dd:
    jmp LAB_1000_09df
LAB_1000_09df:
    mov SP,BP
    pop BP
    ret
    db 90h
FUN_1000_09bf endp

FUN_1000_09e4 proc near
    push BP
    mov BP,SP
    mov DX,word ptr [BP + 4h]
    sub AX,AX
    mov AL,byte ptr [BP + 6h]
    out DX,AL
    pop BP
    ret
FUN_1000_09e4 endp

FUN_1000_09f2 proc near
    push BP
    mov BP,SP
    push DS
    pop ES
    mov SI,word ptr [BP + 4h]
LAB_1000_09fa:
    cmp byte ptr [SI],0h
    jz LAB_1000_0a10
    mov AL,byte ptr [SI]
    cmp AL,61h
    jl LAB_1000_0a0d
    cmp AL,7ah
    jg LAB_1000_0a0d
    sub AL,20h
    mov byte ptr [SI],AL
LAB_1000_0a0d:
    inc SI
    jmp LAB_1000_09fa
LAB_1000_0a10:
    pop BP
    ret
FUN_1000_09f2 endp

FUN_1000_0a12 proc near
    push BP
    mov BP,SP
    push DS
    pop ES
    mov SI,word ptr [BP + 4h]
    mov DI,word ptr [BP + 6h]
LAB_1000_0a1d:
    cmp byte ptr [SI],0h
    jnz LAB_1000_0a2a
    cmp byte ptr [DI],0h
    jz LAB_1000_0a37
    jmp LAB_1000_0a3d
    db 90h
LAB_1000_0a2a:
    cmp byte ptr [DI],0h
    jz LAB_1000_0a3d
    mov AL,byte ptr [SI]
    cmp AL,byte ptr [DI]
    jnz LAB_1000_0a3d
    jmp LAB_1000_0a1d
LAB_1000_0a37:
    mov AX,1h
    jmp LAB_1000_0a40
    db 90h
LAB_1000_0a3d:
    mov AX,0h
LAB_1000_0a40:
    pop BP
    ret
FUN_1000_0a12 endp

mystrcpy equ _mystrcpy

FUN_1000_0a5d proc near
    push BP
    mov BP,SP
    push SI
    push DI
    push ES
    les DI,dword ptr [BP + 4h]
    mov SI,word ptr [BP + 8h]
LAB_1000_0a69:
    lodsb
    stosb
    or AL,AL
    jnz LAB_1000_0a69
    pop ES
    pop DI
    pop SI
    pop BP
    ret
FUN_1000_0a5d endp

FUN_1000_0a74 proc near
    push BP
    mov BP,SP
    push SI
    push DI
    push ES
    push DS
    push DS
    pop ES
    lds SI,dword ptr [BP + 6h]
    mov DI,word ptr [BP + 4h]
LAB_1000_0a83:
    lodsb
    stosb
    or AL,AL
    jnz LAB_1000_0a83
    pop DS
    pop ES
    pop DI
    pop SI
    pop BP
    ret
FUN_1000_0a74 endp

FUN_1000_0a8f proc near
    push BP
    mov BP,SP
    mov AX,word ptr [BP + 4h]
LAB_1000_0a95:
    mov BX,word ptr [BP + 4h]
    inc word ptr [BP + 4h]
    cmp byte ptr [BX],0h
    jnz LAB_1000_0a95
    mov BX,word ptr [BP + 4h]
    sub AX,BX
    not AX
    mov SP,BP
    pop BP
    ret
FUN_1000_0a8f endp

mystrcat proc near
    push BP
    mov BP,SP
    push SI
LAB_1000_0aaf:
    mov BX,word ptr [BP + 4h]
    cmp byte ptr [BX],0h
    jz LAB_1000_0ac2
    inc word ptr [BP + 4h]
    jmp LAB_1000_0aaf
LAB_1000_0abc:
    inc word ptr [BP + 4h]
    mov BX,word ptr [BP + 4h]
LAB_1000_0ac2:
    mov SI,word ptr [BP + 6h]
    inc word ptr [BP + 6h]
    mov AL,byte ptr [SI]
    mov byte ptr [BX],AL
    or AL,AL
    jnz LAB_1000_0abc
    pop SI
    pop BP
    ret
    push BP
    mov BP,SP
    push SI
    mov AX,word ptr [BP + 6h]
LAB_1000_0ada:
    mov BX,word ptr [BP + 4h]
    cmp byte ptr [BX],0h
    jz LAB_1000_0aeb
    cmp byte ptr [BX],AL
    jz LAB_1000_0af1
    inc word ptr [BP + 4h]
    jmp LAB_1000_0ada
LAB_1000_0aeb:
    mov AX,0h
    jmp LAB_1000_0af3
    db 90h
LAB_1000_0af1:
    mov AX,BX
LAB_1000_0af3:
    pop SI
    pop BP
    ret
mystrcat endp

FUN_1000_0af6 proc near
    push BP
    mov BP,SP
    push DI
    mov AX,DS
    mov ES,AX
    mov AL,byte ptr [BP + 6h]
    mov DI,word ptr [BP + 4h]
    mov CX,word ptr [BP + 8h]
    rep stosb
    pop DI
    pop BP
    ret
FUN_1000_0af6 endp

FUN_1000_0b0c proc near
    push BP
    mov BP,SP
    push SI
    push ES
    mov AL,byte ptr [BP + 8h]
    les DI,dword ptr [BP + 4h]
    mov CX,word ptr [BP + 0ah]
    rep stosb
    pop ES
    pop SI
    mov SP,BP
    pop BP
    ret
FUN_1000_0b0c endp

routine_146 proc near
    push BP
    mov BP,SP
    push SI
    mov CX,word ptr [BP + 8h]
LAB_1000_0b29:
    mov SI,word ptr [BP + 4h]
    inc word ptr [BP + 4h]
    mov BX,word ptr [BP + 6h]
    inc word ptr [BP + 6h]
    mov DL,byte ptr [BX]
    mov byte ptr [SI],DL
    loop LAB_1000_0b29
    pop SI
    mov SP,BP
    pop BP
    ret
routine_146 endp

FUN_1000_0b40 proc near
    push BP
    mov BP,SP
    push SI
    push DI
    push ES
    push DS
    push DS
    pop ES
    mov CX,word ptr [BP + 0ah]
    mov DI,word ptr [BP + 4h]
    lds SI,dword ptr [BP + 6h]
    rep movsb
    pop DS
    pop ES
    pop DI
    pop SI
    mov SP,BP
    pop BP
    ret
FUN_1000_0b40 endp

FUN_1000_0b5c proc near
    push BP
    mov BP,SP
    push SI
    mov CX,word ptr [BP + 8h]
LAB_1000_0b63:
    mov SI,word ptr [BP + 4h]
    inc word ptr [BP + 4h]
    mov AX,word ptr [SI]
    mov BX,word ptr [BP + 6h]
    inc word ptr [BP + 6h]
    cmp AX,word ptr [BX]
    loopz LAB_1000_0b63
    or CX,CX
    jz LAB_1000_0b7f
    mov AX,0h
    jmp LAB_1000_0b82
    db 90h
LAB_1000_0b7f:
    mov AX,1h
LAB_1000_0b82:
    pop SI
    mov SP,BP
    pop BP
    ret
FUN_1000_0b5c endp

PUBLIC _intDispatch
_intDispatch:
intDispatch proc near
    push BP
    mov BP,SP
    push SI
    push DI
    push AX
    push BX
    push CX
    push DX
    mov DI,word ptr [BP + 6h]
    mov AX,word ptr [DI]
    mov BX,word ptr [DI + 2h]
    mov CX,word ptr [DI + 4h]
    mov DX,word ptr [DI + 6h]
    cmp word ptr [BP + 4h],10h
    jz LAB_1000_0bb9
    cmp word ptr [BP + 4h],21h
    jz LAB_1000_0bbe
    cmp word ptr [BP + 4h],16h
    jz LAB_1000_0bc3
    cmp word ptr [BP + 4h],1ah
    jz LAB_1000_0bc8
    jmp LAB_1000_0bcd
    db 90h
LAB_1000_0bb9:
    int 10h
    jmp LAB_1000_0bd4
    db 90h
LAB_1000_0bbe:
    int 21h
    jmp LAB_1000_0bd4
    db 90h
LAB_1000_0bc3:
    int 16h
    jmp LAB_1000_0bd4
    db 90h
LAB_1000_0bc8:
    int 1Ah
    jmp LAB_1000_0bd4
    db 90h
LAB_1000_0bcd:
    sub AX,AX
    not AX
    jmp LAB_1000_0be2
    db 90h
LAB_1000_0bd4:
    mov DI,word ptr [BP + 8h]
    mov word ptr [DI],AX
    mov word ptr [DI + 2h],BX
    mov word ptr [DI + 4h],CX
    mov word ptr [DI + 6h],DX
LAB_1000_0be2:
    pop DX
    pop CX
    pop BX
    pop AX
    pop DI
    pop SI
    mov SP,BP
    pop BP
    ret
intDispatch endp

routine_87 proc near
    push BP
    mov BP,SP
    push SI
    mov BX,word ptr [BP + 6h]
    mov AX,word ptr [BP + 8h]
    db 3Dh, 0Ah, 00h  ; cmp AX,0Ah (force word-immediate)
    jz LAB_1000_0c08
    db 3Dh, 02h, 00h  ; cmp AX,02h (force word-immediate)
    jz LAB_1000_0c14
    db 3Dh, 10h, 00h  ; cmp AX,10h (force word-immediate)
    jz LAB_1000_0c0e
    jmp LAB_1000_0c1a
    db 90h
LAB_1000_0c08:
    call routine_117
    jmp LAB_1000_0c24
    db 90h
LAB_1000_0c0e:
    call routine_115
    jmp LAB_1000_0c24
    db 90h
LAB_1000_0c14:
    call routine_116
    jmp LAB_1000_0c24
    db 90h
LAB_1000_0c1a:
    mov BX,word ptr [BP + 6h]
    mov word ptr [BX],0h
    mov AX,0h
LAB_1000_0c24:
    pop SI
    mov SP,BP
    pop BP
    ret
routine_87 endp

routine_117 proc near
    sub CX,CX
    mov AX,word ptr [BP + 4h]
    mov SI,0ah
    or AX,AX
    jns LAB_1000_0c3b
    mov byte ptr [BX],2dh
    inc BX
    neg AX
LAB_1000_0c3b:
    sub DX,DX
    div SI
    add DX,30h
    push DX
    inc CX
    or AX,AX
    jnz LAB_1000_0c3b
    mov AX,CX
LAB_1000_0c4a:
    pop DX
    mov byte ptr [BX],DL
    inc BX
    loop LAB_1000_0c4a
    mov byte ptr [BX],0h
    ret
routine_117 endp

routine_115 proc near
    mov CX,4h
    mov AX,word ptr [BP + 4h]
    and AH,0f0h
    mov AL,AH
    sub AH,AH
    shr AX,CL
    db 05h, 30h, 00h  ; add AX,30h (force word-immediate)
    mov byte ptr [BX],AL
    inc BX
    mov AX,word ptr [BP + 4h]
    and AH,0fh
    mov AL,AH
    sub AH,AH
    db 05h, 30h, 00h  ; add AX,30h (force word-immediate)
    mov byte ptr [BX],AL
    inc BX
    mov AX,word ptr [BP + 4h]
    and AL,0f0h
    sub AH,AH
    shr AX,CL
    db 05h, 30h, 00h  ; add AX,30h (force word-immediate)
    mov byte ptr [BX],AL
    inc BX
    mov AX,word ptr [BP + 4h]
    and AL,0fh
    sub AH,AH
    db 05h, 30h, 00h  ; add AX,30h (force word-immediate)
    mov byte ptr [BX],AL
    inc BX
    mov byte ptr [BX],0h
    mov AX,4h
    ret
routine_115 endp

routine_116 proc near
    mov DX,word ptr [BP + 4h]
    sub AX,AX
    mov AH,80h
LAB_1000_0ca3:
    db 85h, 0D0h  ; test DX,AX (match ref operand order)
    jnz LAB_1000_0cae
    mov byte ptr [BX],30h
    inc BX
    jmp LAB_1000_0cb2
    db 90h
LAB_1000_0cae:
    mov byte ptr [BX],31h
    inc BX
LAB_1000_0cb2:
    shr AX,1h
    jnc LAB_1000_0ca3
    mov byte ptr [BX],0h
    mov AX,10h
    ret
DAT_1000_0cbd:
    db 0Fh
    push BP
    mov BP,SP
    push SI
    mov AH,2h
    xor BH,BH
    mov DH,byte ptr [BP + 4h]
    mov DL,byte ptr [BP + 6h]
    cmp DX,-1h
    jz LAB_1000_0cd3
    int 10h
LAB_1000_0cd3:
    mov BL,byte ptr CS:[0cbdh]
    xor BH,BH
    mov CX,1h
    mov SI,word ptr [BP + 8h]
LAB_1000_0ce0:
    lodsb
    or AL,AL
    jz LAB_1000_0d06
    cmp AL,0ffh
    jz LAB_1000_0cf9
    mov DL,AL
    mov AH,9h
    mov AL,20h
    int 10h
    mov AH,0eh
    mov AL,DL
    int 10h
    jmp LAB_1000_0ce0
LAB_1000_0cf9:
    lodsb
    or AL,AL
    jz LAB_1000_0d06
    mov CS:[0cbdh],AL
    mov BL,AL
    jmp LAB_1000_0ce0
LAB_1000_0d06:
    pop SI
    pop BP
    ret
routine_116 endp

PUBLIC _dos_printstring
_dos_printstring:
dos_printstring proc near
    push BP
    mov BP,SP
    mov AH,9h
    mov DX,word ptr [BP + Stack[2h]+2h]
    int 21h
    pop BP
    ret
    db 00h
    db 00h
dos_printstring endp

routine_14 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push DS
    push BP
    mov DX,word ptr [BP + 4h]
    mov byte ptr [_var_25],0h
    jmp LAB_1000_0d2f
    db 90h
    db 0C6h
    db 06h
    db 0E8h
    db 0Fh
    db 01h
LAB_1000_0d2f:
    mov ES,DX
    mov BX,offset gfx_jump_0_alloc
    mov DI,1ch
    mov AX,word ptr ES:[DI]
    mov DL,5h
    mul DL
    add BX,AX
    mov DI,22h
    mov CX,word ptr ES:[DI]
    mov SI,24h
    mov DI,18h
    mov DI,word ptr ES:[DI]
LAB_1000_0d4f:
    mov AX,word ptr ES:[SI]
    mov word ptr [BX + 1h],AX
    mov word ptr [BX + 3h],DI
    add SI,2h
    add BX,5h
    loop LAB_1000_0d4f
    cmp byte ptr [_var_25],0h
    jnz LAB_1000_0d6f
    pop BP
    pop DS
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
LAB_1000_0d6f:
    ret
routine_14 endp

FUN_1000_0d70 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push DS
    push BP
    mov AX,word ptr [BP + 4h]
    mov byte ptr [_var_25],0h
    jmp LAB_1000_0d88
    db 90h
    db 0C6h
    db 06h
    db 0E8h
    db 0Fh
    db 01h
LAB_1000_0d88:
    mov ES,AX
    mov AH,49h
    int 21h
    jnc LAB_1000_0d9a
    mov DX,offset str_overlayRelError
    mov AH,9h
    int 21h
    jmp LAB_1000_0daa
    db 90h
LAB_1000_0d9a:
    cmp byte ptr [_var_25],0h
    jnz LAB_1000_0da9
    pop BP
    pop DS
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
LAB_1000_0da9:
    ret
LAB_1000_0daa:
    mov AX,4c00h
    int 21h
    push BP
    mov BP,SP
    push DI
    push SI
    push BP
    push DS
    pop ES
    call far ptr gfx_jump_10_getCurBuf
    push AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    call far ptr gfx_jump_0d_setCurBuf
    mov AH,byte ptr [BX + 4h]
    call far ptr gfx_jump_20_setVal
    call sub_12C75
    mov AX,word ptr [BP + 0ah]
    sub AX,word ptr [BP + 6h]
    mov word ptr [_var_29],AX
    mov AX,word ptr [BP + 0ch]
    sub AX,word ptr [BP + 8h]
    inc AX
    mov word ptr [_var_30],AX
    mov CX,word ptr [BP + 0ch]
    mov SI,word ptr [BP + 8h]
    mov word ptr [_var_28],SI
    mov word ptr [_var_38],CX
    mov word ptr [_var_37],SI
    sub CX,SI
    inc CX
    lea DI,word ptr [_var_35]
    shl SI,1h
    add DI,SI
    mov AX,word ptr [BP + 6h]
    mov word ptr [_var_27],AX
    mov DX,CX
    rep stosw
    mov CX,DX
    lea DI,word ptr [_var_36]
    add DI,SI
    mov AX,word ptr [BP + 0ah]
    rep stosw
    mov BX,offset _var_35
    mov AX,word ptr [_var_37]
    mov CX,word ptr [_var_38]
    call far ptr gfx_jump_28
    call far ptr gfx_jump_22
    mov AX,word ptr [_var_27]
    mov BX,word ptr [_var_28]
    mov CX,word ptr [_var_29]
    mov DX,word ptr [_var_30]
    call far ptr gfx_jump_51_null
    pop AX
    call far ptr gfx_jump_0f_getBufPtr
    pop BP
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
FUN_1000_0d70 endp

clearRect proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push BP
    push DS
    pop ES
    call far ptr gfx_jump_10_getCurBuf
    push AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    call far ptr gfx_jump_0d_setCurBuf
    mov AH,byte ptr [BX + 6h]
    call far ptr gfx_jump_20_setVal
    call sub_12C75
    mov AX,word ptr [BP + 0ah]
    sub AX,word ptr [BP + 6h]
    mov word ptr [_var_29],AX
    mov AX,word ptr [BP + 0ch]
    sub AX,word ptr [BP + 8h]
    inc AX
    mov word ptr [_var_30],AX
    mov CX,word ptr [BP + 0ch]
    mov SI,word ptr [BP + 8h]
    mov word ptr [_var_28],SI
    mov word ptr [_var_38],CX
    mov word ptr [_var_37],SI
    sub CX,SI
    inc CX
    lea DI,word ptr [_var_35]
    shl SI,1h
    add DI,SI
    mov AX,word ptr [BP + 6h]
    mov word ptr [_var_27],AX
    mov DX,CX
    rep stosw
    mov CX,DX
    lea DI,word ptr [_var_36]
    add DI,SI
    mov AX,word ptr [BP + 0ah]
    rep stosw
    mov BX,offset _var_35
    mov AX,word ptr [_var_37]
    mov CX,word ptr [_var_38]
    call far ptr gfx_jump_28
    call far ptr gfx_jump_22
    mov AX,word ptr [_var_27]
    mov BX,word ptr [_var_28]
    mov CX,word ptr [_var_29]
    mov DX,word ptr [_var_30]
    call far ptr gfx_jump_51_null
    pop AX
    call far ptr gfx_jump_0f_getBufPtr
    pop BP
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
    db 57h
    db 56h
    db 55h
    db 0A1h
    db 0B7h
    db 15h
    db 8Bh
    db 0Eh
    db 0B9h
    db 15h
    db 0BBh
    db 43h
    db 12h
    db 9Ah
    db 0C1h
    db 10h
    db 80h
    db 15h
    db 5Dh
    db 5Eh
    db 5Fh
    db 0C3h
    db 57h
    db 0E8h
    db 02h
    db 00h
    db 5Fh
    db 0C3h
clearRect endp

sub_12C75 proc near
    mov DI,word ptr [_var_37]
    or DI,DI
    js LAB_1000_0f39
    mov CX,word ptr [_var_38]
    inc CX
    sub CX,DI
    shl DI,1h
    mov BX,CX
    mov DX,DI
    add DI,offset _var_35
    mov AX,0ffffh
    rep stosw
    mov word ptr [_var_37],AX
    mov CX,BX
    mov DI,DX
    add DI,offset _var_36
    sub AX,AX
    rep stosw
    mov word ptr [_var_38],AX
LAB_1000_0f39:
    ret
    db 8Bh
    db 0CFh
    db 0Bh
    db 0F6h
    db 8Dh
    db 3Eh
    db 43h
    db 12h
    db 74h
    db 0Ah
    db 3Bh
    db 36h
    db 0C5h
    db 15h
    db 75h
    db 39h
    db 8Dh
    db 3Eh
    db 0FBh
    db 13h
    db 3Bh
    db 0CAh
    db 7Dh
    db 02h
    db 87h
    db 0CAh
    db 0Bh
    db 0D2h
    db 79h
    db 02h
    db 2Bh
    db 0D2h
    db 3Bh
    db 0Eh
    db 0C7h
    db 15h
    db 7Eh
    db 04h
    db 8Bh
    db 0Eh
    db 0C7h
    db 15h
    db 3Bh
    db 0Eh
    db 0B9h
    db 15h
    db 76h
    db 04h
    db 89h
    db 0Eh
    db 0B9h
    db 15h
    db 3Bh
    db 16h
    db 0B7h
    db 15h
    db 73h
    db 04h
    db 89h
    db 16h
    db 0B7h
    db 15h
    db 03h
    db 0FAh
    db 03h
    db 0FAh
    db 2Bh
    db 0CAh
    db 41h
    db 8Bh
    db 0C6h
    db 0F3h
    db 0ABh
    db 0C3h
    db 2Bh
    db 0F6h
    db 0Bh
    db 0DBh
    db 78h
    db 0B0h
    db 8Bh
    db 36h
    db 0C5h
    db 15h
    db 3Bh
    db 0DEh
    db 7Fh
    db 0A8h
    db 0C3h
    db 0A1h
    db 3Dh
    db 12h
    db 3Bh
    db 06h
    db 3Bh
    db 12h
    db 73h
    db 19h
    db 8Bh
    db 1Eh
    db 3Bh
    db 12h
    db 89h
    db 1Eh
    db 3Dh
    db 12h
    db 0A3h
    db 3Bh
    db 12h
    db 0A1h
    db 41h
    db 12h
    db 8Bh
    db 1Eh
    db 3Fh
    db 12h
    db 89h
    db 1Eh
    db 41h
    db 12h
    db 0A3h
    db 3Fh
    db 12h
    db 8Bh
    db 1Eh
    db 3Dh
    db 12h
    db 2Bh
    db 1Eh
    db 3Bh
    db 12h
    db 89h
    db 1Eh
    db 0B3h
    db 15h
    db 0A1h
    db 41h
    db 12h
    db 8Bh
    db 0D0h
    db 8Bh
    db 0Eh
    db 3Fh
    db 12h
    db 2Bh
    db 0C1h
    db 0BDh
    db 02h
    db 00h
    db 79h
    db 06h
    db 87h
    db 0CAh
    db 0F7h
    db 0DDh
    db 0F7h
    db 0D8h
    db 0A3h
    db 0B5h
    db 15h
    db 3Bh
    db 16h
    db 0B9h
    db 15h
    db 76h
    db 04h
    db 89h
    db 16h
    db 0B9h
    db 15h
    db 3Bh
    db 0Eh
    db 0B7h
    db 15h
    db 73h
    db 04h
    db 89h
    db 0Eh
    db 0B7h
    db 15h
    db 3Bh
    db 0C3h
    db 73h
    db 4Bh
    db 8Bh
    db 3Eh
    db 3Fh
    db 12h
    db 0D1h
    db 0E7h
    db 0A1h
    db 3Bh
    db 12h
    db 8Bh
    db 16h
    db 0B3h
    db 15h
    db 8Bh
    db 0CAh
    db 8Bh
    db 0D9h
    db 43h
    db 0D1h
    db 0EBh
    db 0F7h
    db 0DBh
    db 8Bh
    db 36h
    db 0B5h
    db 15h
    db 0EBh
    db 10h
    db 90h
    db 3Bh
    db 85h
    db 0FBh
    db 13h
    db 76h
    db 04h
    db 89h
    db 85h
    db 0FBh
    db 13h
    db 40h
    db 2Bh
    db 0DAh
    db 03h
    db 0FDh
    db 3Bh
    db 85h
    db 43h
    db 12h
    db 73h
    db 04h
    db 89h
    db 85h
    db 43h
    db 12h
    db 49h
    db 78h
    db 07h
    db 03h
    db 0DEh
    db 79h
    db 0E0h
    db 40h
    db 0EBh
    db 0F6h
    db 3Bh
    db 85h
    db 0FBh
    db 13h
    db 76h
    db 04h
    db 89h
    db 85h
    db 0FBh
    db 13h
    db 0C3h
    db 8Bh
    db 3Eh
    db 3Fh
    db 12h
    db 0D1h
    db 0E7h
    db 0A1h
    db 3Bh
    db 12h
    db 8Bh
    db 16h
    db 0B5h
    db 15h
    db 8Bh
    db 0CAh
    db 8Bh
    db 0D9h
    db 43h
    db 0D1h
    db 0EBh
    db 0F7h
    db 0DBh
    db 8Bh
    db 36h
    db 0B3h
    db 15h
    db 3Bh
    db 85h
    db 43h
    db 12h
    db 73h
    db 04h
    db 89h
    db 85h
    db 43h
    db 12h
    db 3Bh
    db 85h
    db 0FBh
    db 13h
    db 76h
    db 04h
    db 89h
    db 85h
    db 0FBh
    db 13h
    db 49h
    db 78h
    db 0Bh
    db 03h
    db 0FDh
    db 03h
    db 0DEh
    db 78h
    db 0E3h
    db 2Bh
    db 0DAh
    db 40h
    db 0EBh
    db 0DEh
    db 0C3h
    db 0E8h
    db 0Dh
    db 00h
    db 0CBh
sub_12C75 endp

routine_154 proc near
    push BP
    push SI
    push DI
    push ES
    call routine_158
    pop ES
    pop DI
    pop SI
    pop BP
    ret
routine_154 endp

routine_158 proc near
    sub AX,AX
    mov ES,AX
    push word ptr ES:[0h]
    lea AX,word ptr [_var_26]
    mov ES:[0h],AX
    push DS
    pop ES
    jmp LAB_1000_10fa
    db 90h
LAB_1000_10a0:
    sub AX,AX
    mov ES,AX
    pop word ptr ES:[0h]
    push DS
    pop ES
    mov AX,word ptr [_var_31]
    mov BX,word ptr [_var_33]
    mov CX,word ptr [_var_32]
    mov DX,word ptr [_var_34]
    call far ptr gfx_jump_1f
    clc
    ret
LAB_1000_10c1:
    sub AX,AX
    mov ES,AX
    pop word ptr ES:[0h]
    push DS
    pop ES
    stc
    ret
LAB_1000_10ce:
    cmc
    rcr DX,1h
    mov word ptr [_var_40],DX
    sar DX,1h
    mov word ptr [_var_44],DX
    mov DX,DI
    sub DX,BP
    jno LAB_1000_10e7
    cmc
    rcr DX,1h
    jmp LAB_1000_1155
    db 90h
LAB_1000_10e7:
    sar DX,1h
    jmp LAB_1000_1155
    db 90h
LAB_1000_10ec:
    cmc
    rcr DX,1h
    sar word ptr [_var_40],1h
    sar word ptr [_var_44],1h
    jmp LAB_1000_1155
    db 90h
LAB_1000_10fa:
    mov CX,word ptr [_var_31]
    mov DX,word ptr [_var_33]
    mov SI,word ptr [_var_32]
    mov DI,word ptr [_var_34]
    mov BX,CX
    mov BP,DX
    call sub_12F6A
    mov byte ptr [_var_39],AL
    mov BX,SI
    mov BP,DI
    call sub_12F6A
    jnz LAB_1000_1137
    cmp byte ptr [_var_39],0h
    jnz LAB_1000_1127
    jmp LAB_1000_10a0
LAB_1000_1127:
    db 87h, 0CEh  ; xchg CX,SI
    db 87h, 0D7h  ; xchg DX,DI
    xchg byte ptr [_var_39],AL
    mov word ptr [_var_31],CX
    mov word ptr [_var_33],DX
LAB_1000_1137:
    test byte ptr [_var_39],AL
    jnz LAB_1000_10c1
    mov BP,DX
    mov DX,SI
    sub DX,CX
    jo LAB_1000_10ce
    mov word ptr [_var_40],DX
    sar DX,1h
    mov word ptr [_var_44],DX
    mov DX,DI
    sub DX,BP
    jo LAB_1000_10ec
LAB_1000_1155:
    mov word ptr [_var_42],DX
    sar DX,1h
    mov word ptr [_var_45],DX
LAB_1000_115f:
    test AL,9h
    jz LAB_1000_119b
    sub BX,BX
    or SI,SI
    js LAB_1000_116d
    mov BX,word ptr [_var_46]
LAB_1000_116d:
    mov AX,BX
    sub AX,CX
    imul word ptr [_var_42]
    push BX
    mov BX,DX
    idiv word ptr [_var_40]
    mov BL,BH
    xor BL,byte ptr [_var_41]
    jns LAB_1000_1187
    neg DX
    dec AX
LAB_1000_1187:
    sub DX,word ptr [_var_44]
    xor DH,BH
    js LAB_1000_1190
    inc AX
LAB_1000_1190:
    pop BX
    add AX,BP
    js LAB_1000_11a3
    cmp AX,word ptr [_var_47]
    jle LAB_1000_11d4
LAB_1000_119b:
    mov BX,word ptr [_var_47]
    cmp DI,BX
    jg LAB_1000_11a5
LAB_1000_11a3:
    sub BX,BX
LAB_1000_11a5:
    mov AX,BX
    sub AX,BP
    imul word ptr [_var_40]
    push BX
    mov BX,DX
    idiv word ptr [_var_42]
    mov BL,BH
    xor BL,byte ptr [_var_43]
    jns LAB_1000_11bf
    neg DX
    dec AX
LAB_1000_11bf:
    sub DX,word ptr [_var_45]
    xor DH,BH
    js LAB_1000_11c8
    inc AX
LAB_1000_11c8:
    pop BX
    add AX,CX
    js LAB_1000_11e5
    cmp AX,word ptr [_var_46]
    jg LAB_1000_11e5
    xchg AX,BX
LAB_1000_11d4:
    cmp byte ptr [_var_39],0h
    jnz LAB_1000_11e8
    mov word ptr [_var_34],AX
    mov word ptr [_var_32],BX
    jmp LAB_1000_10a0
LAB_1000_11e5:
    jmp LAB_1000_10c1
LAB_1000_11e8:
    mov word ptr [_var_33],AX
    mov word ptr [_var_31],BX
    db 87h, 0CEh  ; xchg CX,SI
    db 87h, 0EFh  ; xchg BP,DI
    mov AL,byte ptr [_var_39]
    mov byte ptr [_var_39],0h
    jmp LAB_1000_115f
routine_158 endp

sub_12F6A proc near
    mov AL,0fh
    or BX,BX
    js LAB_1000_1206
    and AL,0f7h
LAB_1000_1206:
    cmp BX,word ptr [_var_46]
    jg LAB_1000_120e
    and AL,0feh
LAB_1000_120e:
    or BP,BP
    js LAB_1000_1214
    and AL,0fbh
LAB_1000_1214:
    cmp BP,word ptr [_var_47]
    jg LAB_1000_121c
    and AL,0fdh
LAB_1000_121c:
    or AL,AL
    ret
sub_12F6A endp

FUN_1000_121f proc near
    push BP
    mov BP,SP
    cmp word ptr [BP + local_res0+2h],11b0h
    mov AX,word ptr [_var_42]
    jz LAB_1000_122f
    mov AX,word ptr [_var_40]
LAB_1000_122f:
    xor DX,AX
    mov AX,7f00h
    jns LAB_1000_1238
    neg AX
LAB_1000_1238:
    add word ptr [BP + local_res0+2h],4h
    sub DX,DX
    pop BP
    iret
FUN_1000_121f endp

installCBreakHandler proc near
    push SI
    push DI
    push DX
    push DS
    mov SI,6ch
    call routine_33
    mov word ptr [_var_59],BX
    mov word ptr [_var_58],AX
    mov AX,seg @code
    mov DX,offset cbreakHandler
    mov DS,AX
    mov AX,251bh
    int 21h
    pop DS
    pop DX
    pop DI
    pop SI
    ret
installCBreakHandler endp

routine_28 proc near
    push DS
    mov AX,word ptr [_var_58]
    mov DX,word ptr [_var_59]
    mov DS,AX
    mov AX,251bh
    int 21h
    pop DS
    ret
routine_28 endp

routine_33 proc near
    push DS
    xor AX,AX
    mov DS,AX
    mov BX,word ptr [SI]
    mov AX,word ptr [SI + 2h]
    pop DS
    ret
cbreakHandler:
    push DS
    push AX
    mov AX,seg @data
    mov DS,AX
    mov byte ptr [_var_57],0FFh
    pop AX
    pop DS
    iret
    db 00h
    push BP
    mov BP,SP
    sub SP,4h
    sub AX,AX
    push AX
    push word ptr [BP + 4h]
    call openFileWrapper
    add SP,4h
    mov word ptr [BP + -4h],AX
    push word ptr [BP + 6h]
    mov AX,0ffffh
    push AX
    push word ptr [BP + -4h]
    call FUN_1000_1368
    add SP,6h
    mov word ptr [BP + -2h],AX
    push word ptr [BP + -4h]
    call routine_91
    mov AX,word ptr [BP + -2h]
    mov SP,BP
    pop BP
    ret
    db 90h
routine_33 endp

FUN_1000_12c6 proc near
    push BP
    mov BP,SP
    sub SP,4h
    sub AX,AX
    push AX
    push word ptr [BP + 4h]
    call openFileWrapper
    add SP,4h
    mov word ptr [BP + -4h],AX
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    mov AX,0ffffh
    push AX
    push word ptr [BP + -4h]
    call FUN_1000_137c
    add SP,8h
    mov word ptr [BP + -2h],AX
    push word ptr [BP + -4h]
    call routine_91
    mov AX,word ptr [BP + -2h]
    mov SP,BP
    pop BP
    ret
FUN_1000_12c6 endp

FUN_1000_12fe proc near
    push BP
    mov BP,SP
    sub SP,4h
    sub AX,AX
    push AX
    push word ptr [BP + 4h]
    call FUN_1000_1348
    add SP,4h
    mov word ptr [BP + -4h],AX
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BP + 0ch]
    push AX
    call FUN_1000_1394
    add SP,0ah
    mov word ptr [BP + -2h],AX
    push word ptr [BP + -4h]
    call routine_91
    mov AX,word ptr [BP + -2h]
    mov SP,BP
    pop BP
    ret
FUN_1000_12fe endp

PUBLIC _openFileWrapper
_openFileWrapper:
openFileWrapper proc near
    push BP
    mov BP,SP
    push word ptr [BP + Stack[4h]+2h]
    push word ptr [BP + Stack[2h]+2h]
    call openFile
    add SP,4h
    pop BP
    ret
    db 90h
openFileWrapper endp

FUN_1000_1348 proc near
    push BP
    mov BP,SP
    push word ptr [BP + Stack[4h]+2h]
    push word ptr [BP + Stack[2h]+2h]
    call FUN_1000_1405
    add SP,4h
    pop BP
    ret
    db 90h
FUN_1000_1348 endp

routine_91 equ _routine_91

FUN_1000_1368 proc near
    push BP
    mov BP,SP
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call FUN_1000_147e
    add SP,6h
    pop BP
    ret
FUN_1000_1368 endp

FUN_1000_137c proc near
    push BP
    mov BP,SP
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call FUN_1000_14a9
    add SP,8h
    pop BP
    ret
    db 90h
FUN_1000_137c endp

FUN_1000_1394 proc near
    push BP
    mov BP,SP
    push word ptr [BP + 0ch]
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call FUN_1000_1539
    add SP,0ah
    pop BP
    ret
FUN_1000_1394 endp

openFile proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AH,3dh
    mov AL,byte ptr [BP + Stack[4h]+2h]
    mov BX,SS
    mov DS,BX
    mov DX,word ptr [BP + Stack[2h]+2h]
    int 21h
    jnc LAB_1000_13f7
    db 3Dh, 02h, 00h  ; cmp AX,02h (force word-immediate)
    jnz LAB_1000_13d6
LAB_1000_13ca:
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov AX,offset str_fileNotFound
    mov CX,0ffffh
    jmp FUN_1000_156a
LAB_1000_13d6:
    db 3Dh, 03h, 00h  ; cmp AX,03h (force word-immediate)
    jz LAB_1000_13ca
    db 3Dh, 04h, 00h  ; cmp AX,04h (force word-immediate)
    jnz LAB_1000_13ec
    mov CX,0ffffh
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov AX,offset str_noFileBufs
    jmp FUN_1000_156a
LAB_1000_13ec:
    mov CX,AX
    mov AX,offset str_openError
    mov BX,word ptr [BP + Stack[2h]+2h]
    jmp FUN_1000_156a
LAB_1000_13f7:
    mov word ptr [_var_62],200h
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
openFile endp

FUN_1000_1405 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AH,3ch
    mov CX,word ptr [BP + Stack[4h]+2h]
    mov BX,SS
    mov DS,BX
    mov DX,word ptr [BP + Stack[2h]+2h]
    int 21h
    jnc LAB_1000_144e
    db 3Dh, 02h, 00h  ; cmp AX,02h (force word-immediate)
    jnz LAB_1000_142d
LAB_1000_1421:
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov AX,offset str_fileNotFound
    mov CX,0ffffh
    jmp FUN_1000_156a
LAB_1000_142d:
    db 3Dh, 03h, 00h  ; cmp AX,03h (force word-immediate)
    jz LAB_1000_1421
    db 3Dh, 04h, 00h  ; cmp AX,04h (force word-immediate)
    jnz LAB_1000_1443
    mov CX,0ffffh
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov AX,offset str_noFileBufs
    jmp FUN_1000_156a
LAB_1000_1443:
    mov CX,AX
    mov AX,offset str_openError
    mov BX,word ptr [BP + Stack[2h]+2h]
    jmp FUN_1000_156a
LAB_1000_144e:
    mov word ptr [_var_62],200h
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
FUN_1000_1405 endp

PUBLIC _routine_125
_routine_125:
fileClose proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AH,3eh
    mov BX,word ptr [BP + 4h]
    int 21h
    jnc LAB_1000_1475
    mov DX,offset str_fileCloseError
    mov CX,0ffffh
    jmp LAB_1000_1585
LAB_1000_1475:
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
    db 0C3h
fileClose endp

FUN_1000_147e proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AH,3fh
    mov BX,SS
    mov DS,BX
    mov BX,word ptr [BP + 4h]
    mov CX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    int 21h
    jnc LAB_1000_14a1
    mov DX,offset str_readError
    mov CX,0ffffh
    jmp LAB_1000_1585
LAB_1000_14a1:
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
FUN_1000_147e endp

FUN_1000_14a9 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    push DS
    mov AH,3fh
    mov BX,word ptr [BP + 0ah]
    mov DS,BX
    mov BX,word ptr [BP + 4h]
    mov CX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    int 21h
    pop DS
    jnc LAB_1000_14cf
    mov DX,offset str_readError
    mov CX,0ffffh
    jmp LAB_1000_1585
LAB_1000_14cf:
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
    db 1Eh
    db 06h
    db 56h
    db 57h
    db 8Ch
    db 0D8h
    db 8Eh
    db 0C0h
    db 36h
    db 8Eh
    db 1Eh
    db 68h
    db 18h
    db 0B9h
    db 00h
    db 01h
    db 36h
    db 8Bh
    db 36h
    db 6Ah
    db 18h
    db 0BFh
    db 06h
    db 16h
    db 0F3h
    db 0A5h
    db 36h
    db 81h
    db 06h
    db 6Ah
    db 18h
    db 00h
    db 02h
    db 0B8h
    db 00h
    db 02h
    db 5Fh
    db 5Eh
    db 07h
    db 1Fh
    db 0C3h
FUN_1000_14a9 endp

FUN_1000_1500 proc near
    push DS
    mov AH,3fh
    mov BX,1580h
    mov DS,BX
    mov BX,word ptr [_var_63]
    mov CX,200h
    mov DX,offset dat_1606
    int 21h
    jnc LAB_1000_151f
    mov DX,offset str_readError
    mov CX,0ffffh
    jmp LAB_1000_1585
    db 90h
LAB_1000_151f:
    pop DS
    ret
FUN_1000_1500 endp

FUN_1000_1521 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_63],AX
    call FUN_1000_1500
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
FUN_1000_1521 endp

FUN_1000_1539 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    push DS
    mov AH,40h
    mov BX,word ptr [BP + 0ah]
    mov DS,BX
    mov BX,word ptr [BP + 4h]
    mov CX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    add DX,word ptr [BP + 0ch]
    int 21h
    pop DS
    jnc LAB_1000_1562
    mov DX,offset str_writeError
    mov CX,0ffffh
    jmp LAB_1000_1585
    db 90h
LAB_1000_1562:
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
FUN_1000_1539 endp

FUN_1000_156a proc near
    push AX
    mov AX,3h
    int 10h
    mov DI,0h
LAB_1000_1573:
    cmp byte ptr [BX + DI],0h
    jz LAB_1000_157b
    inc DI
    jmp LAB_1000_1573
LAB_1000_157b:
    mov byte ptr [BX + DI],24h
    mov DX,BX
    mov AH,9h
    int 21h
    pop DX
LAB_1000_1585:
    mov AH,9h
    int 21h
    cmp CX,-1h
    jz LAB_1000_15a1
    add CX,30h
    mov byte ptr [_var_60],CL
    mov byte ptr [_var_61],24h
    mov DX,offset _var_60
    mov AH,9h
    int 21h
LAB_1000_15a1:
    mov AX,4c00h
    int 21h
FUN_1000_156a endp

openShowPic equ _openShowPic

FUN_1000_15d2 proc near
    push BP
    mov BP,SP
    sub SP,2h
    sub AX,AX
    push AX
    push word ptr [BP + Stack[2h]+2h]
    call openFileWrapper
    add SP,4h
    mov word ptr [BP + -2h],AX
    push word ptr [BP + Stack[4h]+2h]
    push AX
    call FUN_1000_16d6
    add SP,4h
    push word ptr [BP + -2h]
    call routine_91
    mov SP,BP
    pop BP
    ret
    db 90h
FUN_1000_15d2 endp

loadPic equ _loadPic

FUN_1000_1626 proc near
    push BP
    mov BP,SP
    sub SP,2h
    sub AX,AX
    push AX
    push word ptr [BP + 4h]
    call openFileWrapper
    add SP,4h
    mov word ptr [BP + -2h],AX
    sub AX,AX
    push AX
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + -2h]
    call FUN_1000_4c20
    add SP,8h
    push word ptr [BP + 6h]
    push word ptr [BP + -2h]
    call decodePic
    add SP,4h
    push word ptr [BP + -2h]
    call routine_91
    mov SP,BP
    pop BP
    ret
    db 90h
FUN_1000_1626 endp

PUBLIC _showPicFile
_showPicFile:
showPicFile proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,offset dat_1500
    mov word ptr [_var_68],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_63],AX
    mov AX,word ptr [BP + 6h]
    mov word ptr [_var_65],AX
    call routine_120
    mov SI,word ptr [_var_65]
    call far ptr gfx_jump_38_getPageBuf
    call far ptr gfx_jump_3b_clearBuf
    mov word ptr [_var_67],0h
    mov word ptr [_var_64],0fa00h
LAB_1000_169a:
    mov DI,word ptr [_var_67]
    call far ptr gfx_jump_3a_getRowOffset
    mov word ptr [_var_66],AX
    call decodePicRow
    mov DI,word ptr [_var_66]
    mov BP,offset dat_1872
    mov BX,word ptr [_var_67]
    call far ptr gfx_jump_33_fillRow
    mov DI,word ptr [_var_66]
    call far ptr gfx_jump_35
    inc word ptr [_var_67]
    sub word ptr [_var_64],140h
    jnz LAB_1000_169a
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
showPicFile endp

FUN_1000_16d6 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,offset dat_1500
    mov word ptr [_var_68],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_63],AX
    mov AX,word ptr [BP + Stack[4h]+2h]
    mov ES,AX
    call far ptr gfx_jump_3b_clearBuf
    call routine_120
    mov word ptr [_var_67],0h
    mov word ptr [_var_64],0fa00h
LAB_1000_1702:
    mov DI,word ptr [_var_67]
    call far ptr gfx_jump_3a_getRowOffset
    mov word ptr [_var_66],AX
    call decodePicRow
    mov DI,word ptr [_var_66]
    mov BP,offset dat_1872
    mov BX,word ptr [_var_67]
    call far ptr gfx_jump_33_fillRow
    mov DI,word ptr [_var_66]
    call far ptr thunk_EXT_FUN_0000
    inc word ptr [_var_67]
    sub word ptr [_var_64],140h
    jnz LAB_1000_1702
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
FUN_1000_16d6 endp

FUN_1000_173e proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,offset dat_14d7
    mov word ptr [_var_68],AX
    mov word ptr [_var_62],200h
    mov word ptr [dat_186A],0h
    mov AX,word ptr [BP + 4h]
    mov word ptr [dat_1868],AX
    mov AX,word ptr [BP + Stack[4h]+2h]
    mov ES,AX
    call far ptr gfx_jump_3b_clearBuf
    call routine_120
    mov word ptr [_var_67],0h
    mov word ptr [_var_64],0fa00h
LAB_1000_1776:
    mov DI,word ptr [_var_67]
    call far ptr gfx_jump_3a_getRowOffset
    mov word ptr [_var_66],AX
    call decodePicRow
    mov DI,word ptr [_var_66]
    mov BP,offset dat_1872
    mov BX,word ptr [_var_67]
    call far ptr gfx_jump_33_fillRow
    mov DI,word ptr [_var_66]
    call far ptr thunk_EXT_FUN_0000
    inc word ptr [_var_67]
    sub word ptr [_var_64],140h
    jnz LAB_1000_1776
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
FUN_1000_173e endp

PUBLIC _decodePic
_decodePic:
decodePic proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,offset dat_1500
    mov word ptr [_var_68],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_63],AX
    mov AX,word ptr [BP + Stack[4h]+2h]
    mov ES,AX
    call far ptr gfx_jump_3b_clearBuf
    call routine_120
    mov word ptr [_var_67],0h
    mov word ptr [_var_64],0fa00h
LAB_1000_17de:
    mov DI,word ptr [_var_67]
    call far ptr gfx_jump_3a_getRowOffset
    mov word ptr [_var_66],AX
    call decodePicRow
    mov DI,word ptr [_var_66]
    mov BP,offset dat_1872
    mov BX,word ptr [_var_67]
    call far ptr gfx_jump_34_fillRow
    mov DI,word ptr [_var_66]
    call far ptr gfx_jump_36_null
    inc word ptr [_var_67]
    sub word ptr [_var_64],140h
    jnz LAB_1000_17de
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
decodePic endp

routine_120 proc near
    ret
    db 00h
routine_120 endp

decodePicRow proc near
    push ES
    push DS
    pop ES
    cld
    mov SI,word ptr [_var_62]
    add SI,offset dat_1606
    shr DI,1h
    jnz LAB_1000_182f
    call picReadDataAndMakeDict
LAB_1000_182f:
    mov CX,140h
    mov word ptr [_var_155],CX
    mov DI,offset dat_1872
    call routine_145
    sub SI,offset dat_1606
    mov word ptr [_var_62],SI
    pop ES
    ret
decodePicRow endp

picReadDataAndMakeDict proc near
    mov AX,offset dat_1606
    add AX,200h
    mov word ptr [_var_153],AX
    mov AX,offset dat_2769
    mov word ptr [_var_154],AX
    mov byte ptr [_var_156],0h
    mov byte ptr [_var_157],0h
    cmp SI,word ptr [_var_153]
    jc LAB_1000_1872
    push BX
    push CX
    push DX
    call word ptr [_var_68]
    pop DX
    pop CX
    pop BX
    mov SI,offset dat_1606
LAB_1000_1872:
    lodsw
    mov word ptr [_var_162],AX
    mov byte ptr [_var_163],8h
    mov byte ptr [_var_164],1h
    or AL,AL
    jns LAB_1000_188a
    dec byte ptr [_var_164]
    neg AL
LAB_1000_188a:
    mov byte ptr [_var_159],AL
picReadDataAndMakeDict endp

picMakeDict proc near
    mov byte ptr [_var_158],9h
    mov word ptr [_var_160],1ffh
    mov DX,100h
    mov word ptr [_var_161],DX
    mov AX,0ffffh
    xor BX,BX
    mov CX,800h
LAB_1000_18a7:
    mov word ptr [BX + 276ah],AX
    add BX,3h
    loop LAB_1000_18a7
    mov AL,0h
    xor BX,BX
    mov CX,100h
LAB_1000_18b7:
    mov byte ptr [BX + 276ch],AL
    inc AL
    add BX,3h
    loop LAB_1000_18b7
    ret
picMakeDict endp

routine_145 proc near
    cmp byte ptr [_var_164],0h
    jz LAB_1000_18ce
    shr word ptr [_var_155],1h
LAB_1000_18ce:
    mov AX,word ptr [_var_154]
    mov word ptr [_var_154],SP
    mov SP,AX
    mov DX,word ptr [_var_161]
LAB_1000_18db:
    cmp byte ptr [_var_156],0h
    jnz LAB_1000_1903
    call dictionaryLookup
    cmp AL,90h
    jz LAB_1000_18ef
    mov byte ptr [_var_157],AL
    jmp LAB_1000_190a
    db 90h
LAB_1000_18ef:
    call dictionaryLookup
    or AL,AL
    jnz LAB_1000_18fe
    mov AL,90h
    mov byte ptr [_var_157],AL
    jmp LAB_1000_190a
    db 90h
LAB_1000_18fe:
    dec AL
    mov byte ptr [_var_156],AL
LAB_1000_1903:
    mov AL,byte ptr [_var_157]
    dec byte ptr [_var_156]
LAB_1000_190a:
    cmp byte ptr [_var_164],0h
    jz LAB_1000_1927
    mov AH,AL
    and AL,0fh
    shr AH,1h
    shr AH,1h
    shr AH,1h
    shr AH,1h
    stosw
    dec word ptr [_var_155]
    jnz LAB_1000_18db
    jmp LAB_1000_192e
    db 90h
LAB_1000_1927:
    stosb
    dec word ptr [_var_155]
    jnz LAB_1000_18db
LAB_1000_192e:
    mov word ptr [_var_161],DX
    mov AX,word ptr [_var_154]
    mov word ptr [_var_154],SP
    mov SP,AX
    ret
routine_145 endp

dictionaryLookup proc near
    pop BP
    cmp SP,2769h
    jz LAB_1000_1946
LAB_1000_1943:
    pop AX
    jmp BP
LAB_1000_1946:
    mov BX,word ptr [_var_162]
    mov CL,10h
    mov CH,byte ptr [_var_163]
    sub CL,CH
    shr BX,CL
    mov CL,CH
LAB_1000_1956:
    cmp CL,byte ptr [_var_158]
    jge LAB_1000_197c
    cmp SI,word ptr [_var_153]
    jc LAB_1000_196f
    push BX
    push CX
    push DX
    call word ptr [_var_68]
    pop DX
    pop CX
    pop BX
    mov SI,offset dat_1606
LAB_1000_196f:
    lodsw
    mov word ptr [_var_162],AX
    shl AX,CL
    or BX,AX
    add CL,10h
    jmp LAB_1000_1956
LAB_1000_197c:
    sub CL,byte ptr [_var_158]
    mov byte ptr [_var_163],CL
    mov AX,BX
    and AX,word ptr [_var_160]
    mov CX,AX
    cmp AX,DX
    jl LAB_1000_199a
    mov CX,DX
    mov AX,word ptr [_var_165]
    mov BL,byte ptr [_var_166]
    push BX
LAB_1000_199a:
    mov BX,AX
    add BX,AX
    add BX,AX
    mov AX,word ptr [BX + 276ah]
    inc AX
    jz LAB_1000_19af
    dec AX
    mov BL,byte ptr [BX + 276ch]
    push BX
    jmp LAB_1000_199a
LAB_1000_19af:
    mov AL,byte ptr [BX + 276ch]
    mov byte ptr [_var_166],AL
    push AX
    mov BX,DX
    add BX,DX
    add BX,DX
    mov byte ptr [BX + 276ch],AL
    mov AX,word ptr [_var_165]
    mov word ptr [BX + 276ah],AX
    inc DX
    cmp DX,word ptr [_var_160]
    jle LAB_1000_19d8
    inc byte ptr [_var_158]
    stc
    rcl word ptr [_var_160],1h
LAB_1000_19d8:
    mov AL,byte ptr [_var_158]
    cmp AL,byte ptr [_var_159]
    jle LAB_1000_19e4
    call picMakeDict
LAB_1000_19e4:
    mov word ptr [_var_165],CX
    jmp LAB_1000_1943
    db 00h
dictionaryLookup endp

allocBuffer equ _allocBuffer

routine_64 proc near
    push BP
    mov BP,SP
    push word ptr [BP + Stack[2h]+2h]
    call routine_102
    add SP,2h
    or AX,AX
    jz LAB_1000_1a46
    call cleanup
    mov AX,offset str_deallocError
    push AX
    call dos_printstring
    add SP,2h
    sub AX,AX
    push AX
    call routine_8
    add SP,2h
LAB_1000_1a46:
    pop BP
    ret
routine_64 endp

PUBLIC _dos_alloc
_dos_alloc:
dos_alloc proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AH,48h
    mov BX,word ptr [BP + Stack[2h]+2h]
    shr BX,1h
    shr BX,1h
    shr BX,1h
    shr BX,1h
    test word ptr [BP + Stack[2h]+2h],0fh
    jz LAB_1000_1a64
    inc BX
LAB_1000_1a64:
    int 21h
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
dos_alloc endp

routine_102 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AH,49h
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov ES,BX
    int 21h
    jc LAB_1000_1a83
    mov AX,0h
LAB_1000_1a83:
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
    db 00h
    push BP
    mov BP,SP
    push DI
    mov AX,word ptr [BP + 8h]
    mov ES,AX
    xor DI,DI
    call FUN_1000_1ac2
    mov CX,word ptr [BP + 4h]
    or CX,CX
    jz LAB_1000_1aaa
LAB_1000_1aa1:
    call FUN_1000_1b0c
    or AL,AL
    jnz LAB_1000_1aa1
    loop LAB_1000_1aa1
LAB_1000_1aaa:
    mov BX,word ptr [BP + 6h]
    mov CX,200h
LAB_1000_1ab0:
    push BX
    call FUN_1000_1b0c
    pop BX
    mov byte ptr [BX],AL
    inc BX
    or AL,AL
    loopnz LAB_1000_1ab0
    mov AX,word ptr [BP + 6h]
    pop DI
    pop BP
    ret
routine_102 endp

FUN_1000_1ac2 proc near
    call FUN_1000_1ad8
    mov word ptr [dat_3FB2],0h
    mov byte ptr [dat_3F71],0h
    mov AL,byte ptr ES:[DI]
    inc DI
    mov byte ptr [dat_3F6B],AL
    ret
FUN_1000_1ac2 endp

FUN_1000_1ad8 proc near
    mov byte ptr [dat_3F6A],9h
    mov word ptr [dat_3F6C],1ffh
    mov word ptr [dat_3F6E],100h
    mov BX,offset _var_167
    mov AX,0ffffh
    mov CX,800h
LAB_1000_1af2:
    mov word ptr [BX],AX
    add BX,3h
    loop LAB_1000_1af2
    mov BX,offset _var_167
    mov AL,0h
    mov CX,100h
LAB_1000_1b01:
    mov byte ptr [BX + 2h],AL
    inc AL
    add BX,3h
    loop LAB_1000_1b01
    ret
FUN_1000_1ad8 endp

FUN_1000_1b0c proc near
    mov BX,word ptr [dat_3FB2]
    or BX,BX
    jnz LAB_1000_1b17
    call FUN_1000_1b24
LAB_1000_1b17:
    dec word ptr [dat_3FB2]
    mov BX,word ptr [dat_3FB2]
    mov AL,byte ptr [BX + 3f72h]
    ret
FUN_1000_1b0c endp

FUN_1000_1b24 proc near
    push CX
    call FUN_1000_1bc3
    mov word ptr [dat_3FB6],CX
    cmp CX,word ptr [dat_3F6E]
    jl LAB_1000_1b4b
    mov AL,byte ptr [dat_3FB8]
    mov BX,word ptr [dat_3FB2]
    mov byte ptr [BX + 3f72h],AL
    inc word ptr [dat_3FB2]
    mov CX,word ptr [dat_3FB4]
    mov AX,word ptr [dat_3F6E]
    mov word ptr [dat_3FB6],AX
LAB_1000_1b4b:
    mov BX,offset _var_167
    add BX,CX
    add BX,CX
    add BX,CX
    mov AX,word ptr [BX]
    inc AX
    jz LAB_1000_1b72
    dec AX
    mov CX,AX
    mov AL,byte ptr [BX + 2h]
    mov BX,word ptr [dat_3FB2]
    cmp BX,40h
    jnc LAB_1000_1b6c
    mov byte ptr [BX + 3f72h],AL
LAB_1000_1b6c:
    inc word ptr [dat_3FB2]
    jmp LAB_1000_1b4b
LAB_1000_1b72:
    mov AL,byte ptr [BX + 2h]
    mov byte ptr [dat_3FB8],AL
    mov BX,word ptr [dat_3FB2]
    mov byte ptr [BX + 3f72h],AL
    inc word ptr [dat_3FB2]
    mov CX,word ptr [dat_3F6E]
    mov BX,offset _var_167
    add BX,CX
    add BX,CX
    add BX,CX
    mov byte ptr [BX + 2h],AL
    mov AX,word ptr [dat_3FB4]
    mov word ptr [BX],AX
    inc word ptr [dat_3F6E]
    mov AX,word ptr [dat_3F6E]
    cmp AX,word ptr [dat_3F6C]
    jle LAB_1000_1baf
    inc byte ptr [dat_3F6A]
    stc
    rcl word ptr [dat_3F6C],1h
LAB_1000_1baf:
    mov AL,byte ptr [dat_3F6A]
    cmp AL,byte ptr [dat_3F6B]
    jle LAB_1000_1bbb
    call FUN_1000_1ad8
LAB_1000_1bbb:
    mov AX,word ptr [dat_3FB6]
    mov word ptr [dat_3FB4],AX
    pop CX
    ret
FUN_1000_1b24 endp

FUN_1000_1bc3 proc near
    xor DH,DH
    mov DL,byte ptr [dat_3F70]
    mov BL,byte ptr [dat_3F71]
    mov CL,8h
    sub CL,BL
    shr DX,CL
LAB_1000_1bd3:
    cmp BL,byte ptr [dat_3F6A]
    jge LAB_1000_1bed
    mov AL,byte ptr ES:[DI]
    inc DI
    mov byte ptr [dat_3F70],AL
    mov CL,BL
    xor AH,AH
    shl AX,CL
    or DX,AX
    add BL,8h
    jmp LAB_1000_1bd3
LAB_1000_1bed:
    sub BL,byte ptr [dat_3F6A]
    mov byte ptr [dat_3F71],BL
    mov CX,DX
    and CX,word ptr [dat_3F6C]
    ret
FUN_1000_1bc3 endp

setTimerIrqHandler proc near
    mov word ptr [_var_74],1h
    mov word ptr [_var_80],1h
    mov word ptr [_var_70],0h
    mov word ptr [_var_71],0h
    call sub_13DF2
    mov AH,35h
    mov AL,8h
    int 21h
    mov word ptr CS:[var_2],BX
    mov word ptr CS:[var_3],ES
    push DS
    mov AH,25h
    mov AL,8h
    lds DX,CS:dword ptr [var_1]
    int 21h
    pop DS
    mov byte ptr [_var_69],1h
    ret
setTimerIrqHandler endp

PUBLIC _restoreTimerIrqHandler
_restoreTimerIrqHandler:
restoreTimerIrqHandler proc near
    mov AL,36h
    out 43h,AL
    jmp LAB_1000_1c40
LAB_1000_1c40:
    xor AL,AL
    out 40h,AL
    jmp LAB_1000_1c46
LAB_1000_1c46:
    out 40h,AL
    push DS
    mov AH,25h
    mov AL,8h
    lds DX,CS:dword ptr [var_2]
    int 21h
    pop DS
    mov byte ptr [_var_69],0h
    ret
    db 8Bh
    db 1Eh
    db 0Dh
    db 1Ah
    db 89h
    db 1Eh
    db 0Ah
    db 1Ah
    db 0A1h
    db 0Fh
    db 1Ah
    db 33h
    db 0D2h
    db 0F7h
    db 0F3h
    db 0A3h
    db 04h
    db 1Ah
    db 0C6h
    db 06h
    db 0Ch
    db 1Ah
    db 01h
    db 0C3h
    db 0C7h
    db 06h
    db 0Ah
    db 1Ah
    db 01h
    db 00h
    db 0A1h
    db 0Fh
    db 1Ah
    db 0A3h
    db 04h
    db 1Ah
    db 0C6h
    db 06h
    db 0Ch
    db 1Ah
    db 01h
    db 0C3h
var_1:
    dd 10001C89h
    db 0FBh
    db 50h
    db 53h
    db 51h
    db 52h
    db 56h
    db 57h
    db 55h
    db 1Eh
    db 06h
    db 0B8h
    db 80h
    db 15h
    db 8Eh
    db 0D8h
    db 0A1h
    db 06h
    db 1Ah
    db 01h
    db 06h
    db 00h
    db 1Ah
    db 83h
    db 16h
    db 02h
    db 1Ah
    db 00h
    db 0FFh
    db 0Eh
    db 14h
    db 1Ah
    db 75h
    db 11h
    db 0A1h
    db 0Ah
    db 1Ah
    db 0A3h
    db 14h
    db 1Ah
    db 0E8h
    db 3Ch
    db 00h
    db 0C6h
    db 06h
    db 0FEh
    db 19h
    db 00h
    db 0E8h
    db 0ACh
    db 01h
    db 83h
    db 3Eh
    db 0Ah
    db 1Ah
    db 01h
    db 74h
    db 05h
    db 9Ah
    db 24h
    db 12h
    db 80h
    db 15h
    db 83h
    db 3Eh
    db 02h
    db 1Ah
    db 00h
    db 75h
    db 0Eh
    db 0B0h
    db 20h
    db 0E6h
    db 20h
    db 07h
    db 1Fh
    db 5Dh
    db 5Fh
    db 5Eh
    db 5Ah
    db 59h
    db 5Bh
    db 58h
    db 0CFh
    db 0FFh
    db 0Eh
    db 02h
    db 1Ah
    db 07h
    db 1Fh
    db 5Dh
    db 5Fh
    db 5Eh
    db 5Ah
    db 59h
    db 5Bh
    db 58h
    db 0FAh
    db 0EAh
var_2:
    dw 0000h
var_3:
    dw 0000h
    db 0FEh
    db 0Eh
    db 0Ch
    db 1Ah
    db 75h
    db 7Fh
    db 0C6h
    db 06h
    db 0Ch
    db 1Ah
    db 14h
    db 80h
    db 3Eh
    db 13h
    db 1Ah
    db 00h
    db 74h
    db 41h
    db 32h
    db 0DBh
    db 33h
    db 0C9h
    db 8Eh
    db 0C1h
    db 26h
    db 8Bh
    db 16h
    db 63h
    db 04h
    db 83h
    db 0C2h
    db 06h
    db 81h
    db 0FAh
    db 0BAh
    db 03h
    db 74h
    db 14h
    db 0FAh
    db 0ECh
    db 0A8h
    db 08h
    db 75h
    db 27h
    db 0FBh
    db 24h
    db 01h
    db 3Ah
    db 0C3h
    db 74h
    db 0F3h
    db 80h
    db 0F3h
    db 01h
    db 0E2h
    db 0EEh
    db 0EBh
    db 12h
    db 0FAh
    db 0ECh
    db 0A8h
    db 80h
    db 74h
    db 13h
    db 0FBh
    db 24h
    db 01h
    db 3Ah
    db 0C3h
    db 74h
    db 0DFh
    db 80h
    db 0F3h
    db 01h
    db 0E2h
    db 0EEh
    db 0C6h
    db 06h
    db 13h
    db 1Ah
    db 00h
    db 0EBh
    db 32h
    db 8Bh
    db 16h
    db 06h
    db 1Ah
    db 3Bh
    db 16h
    db 04h
    db 1Ah
    db 74h
    db 08h
    db 8Bh
    db 16h
    db 04h
    db 1Ah
    db 89h
    db 16h
    db 06h
    db 1Ah
    db 0B0h
    db 36h
    db 0E6h
    db 43h
    db 0EBh
    db 00h
    db 8Ah
    db 0C2h
    db 0E6h
    db 40h
    db 0EBh
    db 00h
    db 8Ah
    db 0C6h
    db 0E6h
    db 40h
    db 0FFh
    db 06h
    db 08h
    db 1Ah
    db 0F7h
    db 0D9h
    db 89h
    db 0Eh
    db 16h
    db 1Ah
    db 74h
    db 04h
    db 0FFh
    db 06h
    db 14h
    db 1Ah
    db 0FBh
    db 0C3h
restoreTimerIrqHandler endp

sub_13DF2 proc near
    pushf
    cli
    mov byte ptr [_var_75],1h
    xor AX,AX
    mov byte ptr [_var_79],1h
    mov word ptr [_var_77],AX
    mov word ptr [_var_78],AX
    call manipulateTimer
    mov BX,AX
    mov CX,10h
LAB_1000_1d92:
    push BX
    call manipulateTimer
    pop BX
    sub BX,AX
    add word ptr [_var_77],BX
    adc word ptr [_var_78],0h
    mov BX,AX
    loop LAB_1000_1d92
    mov AX,word ptr [_var_77]
    mov DX,word ptr [_var_78]
    add word ptr [_var_70],AX
    adc word ptr [_var_71],DX
    mov CX,10h
    div CX
    shr AX,1h
    mov word ptr [_var_77],AX
    mov BX,AX
    shr BX,1h
    shr BX,1h
    shr BX,1h
    shr BX,1h
    add AX,BX
    xor DX,DX
    mov BX,offset dat_0f89
    div BX
    db 3Dh, 04h, 00h  ; cmp AX,04h (force word-immediate)
    jc LAB_1000_1ddf
    db 3Dh, 06h, 00h  ; cmp AX,06h (force word-immediate)
    ja LAB_1000_1ddf
    jmp LAB_1000_1ded
    db 90h
LAB_1000_1ddf:
    mov byte ptr [_var_79],0h
    mov word ptr [_var_77],4daeh
    mov AX,5h
LAB_1000_1ded:
    mov word ptr [_var_76],AX
    cmp word ptr [_var_74],1h
    jz LAB_1000_1dfa
    mov word ptr [_var_74],AX
LAB_1000_1dfa:
    mov AX,word ptr [_var_77]
    xor DX,DX
    div word ptr [_var_74]
    mov word ptr [_var_73],AX
    mov word ptr [_var_72],AX
    popf
    ret
sub_13DF2 endp

manipulateTimer proc near
    pushf
    cli
    xor AX,AX
    mov ES,AX
    mov DX,word ptr ES:[463h]
    add DX,6h
    cmp DX,3bah
    jz LAB_1000_1e36
    xor BX,BX
LAB_1000_1e21:
    dec BX
    jz LAB_1000_1e5c
    in AL,DX
    test AL,8h
    jnz LAB_1000_1e21
    xor BX,BX
LAB_1000_1e2b:
    dec BX
    jz LAB_1000_1e5c
    in AL,DX
    test AL,8h
    jz LAB_1000_1e2b
    jmp LAB_1000_1e4a
    db 90h
LAB_1000_1e36:
    xor BX,BX
LAB_1000_1e38:
    dec BX
    jz LAB_1000_1e5c
    in AL,DX
    test AL,80h
    jz LAB_1000_1e38
    xor BX,BX
LAB_1000_1e42:
    dec BX
    jz LAB_1000_1e5c
    in AL,DX
    test AL,80h
    jnz LAB_1000_1e42
LAB_1000_1e4a:
    mov AL,0h
    out 43h,AL
    jmp LAB_1000_1e50
LAB_1000_1e50:
    in AL,40h
    jmp LAB_1000_1e54
LAB_1000_1e54:
    mov BL,AL
    in AL,40h
    jmp LAB_1000_1e5a
LAB_1000_1e5a:
    mov BH,AL
LAB_1000_1e5c:
    mov AX,BX
    popf
    ret
manipulateTimer endp

PUBLIC _routine_69
_routine_69:
routine_69 proc near
    xor AH,AH
    int 1Ah
    mov AX,DX
    ret
    db 0FEh
    db 06h
    db 1Bh
    db 1Ah
    db 0FEh
    db 06h
    db 1Ch
    db 1Ah
    db 0FEh
    db 06h
    db 1Ah
    db 1Ah
    db 0FEh
    db 06h
    db 1Dh
    db 1Ah
    db 0C3h
routine_69 endp

routine_27 proc near
    push BP
    mov BP,SP
    sub SP,2h
    push SI
    mov BX,word ptr [_var_86]
    mov word ptr [BX + 6h],0h
    les BX,dword ptr [_var_222]
    cmp word ptr ES:[BX + 30h],0h
    jz LAB_1000_1e96
    jmp LAB_1000_214e
LAB_1000_1e96:
    les BX,dword ptr [_var_178]
    cmp word ptr ES:[BX + 4eh],1h
    jz LAB_1000_1ea4
    jmp LAB_1000_1f4a
LAB_1000_1ea4:
    mov AX,3h
    push AX
    call far ptr gfx_jump_3d_null
    add SP,2h
    mov BX,word ptr [_var_86]
    push word ptr [BX]
    mov AX,offset str_deskPic
    push AX
    call openShowPic
    add SP,4h
    mov AX,0fah
    push AX
    mov AX,0b3h
    push AX
    mov AX,24h
    push AX
    mov AX,offset str_deskMsg1
    push AX
    push word ptr [_var_86]
    call drawString
    add SP,0ah
    mov AX,0fah
    push AX
    mov AX,0bch
    push AX
    mov AX,24h
    push AX
    mov AX,offset str_deskMsg2
    push AX
    push word ptr [_var_86]
    call drawString
    add SP,0ah
    mov word ptr [_var_85],4h
    mov word ptr [_var_84],0h
    mov word ptr [BP + -2h],0h
    jmp LAB_1000_1f0b
    db 90h
LAB_1000_1f08:
    inc word ptr [BP + -2h]
LAB_1000_1f0b:
    mov SI,word ptr [BP + -2h]
    les BX,dword ptr [_var_178]
    mov AL,byte ptr ES:[BX + SI + 2h]
    mov BX,SI
    mov byte ptr [BX + 3fd0h],AL
    or AL,AL
    jnz LAB_1000_1f08
    mov AX,5fh
    push AX
    mov AX,99h
    push AX
    mov AX,0c1h
    push AX
    mov AX,offset _var_176
    push AX
    push word ptr [_var_86]
    call drawString
    add SP,0ah
    mov word ptr [_var_84],7h
    mov word ptr [_var_85],1h
    jmp LAB_1000_2141
    db 90h
LAB_1000_1f4a:
    les BX,dword ptr [_var_178]
    cmp word ptr ES:[BX + 4eh],2h
    jnz LAB_1000_1fa8
    mov AX,2h
    push AX
    call far ptr gfx_jump_3d_null
    add SP,2h
    mov BX,word ptr [_var_86]
    push word ptr [BX]
    mov AX,offset str_deathPic
    push AX
    call openShowPic
    add SP,4h
    mov AX,0fah
    push AX
    mov AX,0adh
    push AX
    mov AX,24h
    push AX
    mov AX,offset str_deathMsg1
    push AX
    push word ptr [_var_86]
    call drawString
    add SP,0ah
    mov AX,0fah
    push AX
    mov AX,0b6h
    push AX
    mov AX,24h
    push AX
    mov AX,offset str_deathMsg2
    push AX
    push word ptr [_var_86]
    call drawString
    add SP,0ah
    jmp LAB_1000_2141
LAB_1000_1fa8:
    les BX,dword ptr [_var_178]
    cmp word ptr ES:[BX + 20h],6h
    jc LAB_1000_1fb6
    jmp LAB_1000_206b
LAB_1000_1fb6:
    mov BX,word ptr ES:[BX + 20h]
    shl BX,1h
    shl BX,1h
    mov SI,word ptr [_var_178]
    mov AX,word ptr ES:[SI + 32h]
    mov DX,word ptr ES:[SI + 34h]
    cmp word ptr [BX + 1c4ah],DX
    jle LAB_1000_1fd3
    jmp LAB_1000_206b
LAB_1000_1fd3:
    jl LAB_1000_1fde
    cmp word ptr [BX + 1c48h],AX
    jc LAB_1000_1fde
    jmp LAB_1000_206b
LAB_1000_1fde:
    mov AX,6h
    push AX
    call far ptr gfx_jump_3d_null
    add SP,2h
    mov BX,word ptr [_var_86]
    push word ptr [BX]
    mov AX,offset str_promoPic
    push AX
    call openShowPic
    add SP,4h
    mov word ptr [_var_84],1h
    mov AX,0fah
    push AX
    mov AX,0aeh
    push AX
    mov AX,24h
    push AX
    mov AX,offset str_promoMsg1
    push AX
    push word ptr [_var_86]
    call drawString
    add SP,0ah
    mov AX,offset str_promoMsg2
    push AX
    mov AX,offset _var_176
    push AX
    call mystrcpy
    add SP,4h
    les BX,dword ptr [_var_178]
    inc word ptr ES:[BX + 20h]
    mov SI,word ptr ES:[BX + 20h]
    shl SI,1h
    push word ptr [SI + 1c3ah]
    mov AX,offset _var_176
    push AX
    call mystrcat
    add SP,4h
    mov AX,0fah
    push AX
    mov AX,0b7h
    push AX
    mov AX,24h
    push AX
    mov AX,offset _var_176
    push AX
    push word ptr [_var_86]
    call drawString
    add SP,0ah
    call far ptr gfx_jump_50
    call far ptr gfx_jump_46_retrace2
    call routine_66
LAB_1000_206b:
    mov word ptr [BP + -2h],4h
    jmp LAB_1000_2075
LAB_1000_2072:
    dec word ptr [BP + -2h]
LAB_1000_2075:
    cmp word ptr [BP + -2h],0h
    jl LAB_1000_2097
    mov BX,word ptr [BP + -2h]
    shl BX,1h
    shl BX,1h
    mov AX,word ptr [_var_219]
    mov DX,word ptr [_var_220]
    cmp word ptr [BX + 1c6ch],DX
    jg LAB_1000_2072
    jl LAB_1000_2097
    cmp word ptr [BX + 1c6ah],AX
    jnc LAB_1000_2072
LAB_1000_2097:
    cmp word ptr [BP + -2h],0h
    jge LAB_1000_20a0
    jmp LAB_1000_214e
LAB_1000_20a0:
    mov AX,1h
    mov CL,byte ptr [BP + -2h]
    shl AX,CL
    les BX,dword ptr [_var_178]
    test word ptr ES:[BX + 22h],AX
    jz LAB_1000_20b5
    jmp LAB_1000_214e
LAB_1000_20b5:
    call far ptr gfx_jump_45_retrace
    mov AX,0ah
    push AX
    call far ptr gfx_jump_3d_null
    add SP,2h
    mov BX,word ptr [_var_86]
    push word ptr [BX]
    mov AX,offset str_medalPic
    push AX
    call openShowPic
    add SP,4h
    mov word ptr [_var_84],0fh
    mov AX,0fah
    push AX
    mov AX,0aeh
    push AX
    mov AX,24h
    push AX
    mov AX,offset str_medalMsg1
    push AX
    push word ptr [_var_86]
    call drawString
    add SP,0ah
    mov AX,offset str_medalMsg2
    push AX
    mov AX,offset _var_176
    push AX
    call mystrcpy
    add SP,4h
    mov BX,word ptr [BP + -2h]
    shl BX,1h
    push word ptr [BX + 1c60h]
    mov AX,offset _var_176
    push AX
    call mystrcat
    add SP,4h
    mov AX,0fah
    push AX
    mov AX,0b7h
    push AX
    mov AX,24h
    push AX
    mov AX,offset _var_176
    push AX
    push word ptr [_var_86]
    call drawString
    add SP,0ah
    les BX,dword ptr [_var_178]
    mov AX,1h
    mov CL,byte ptr [BP + -2h]
    shl AX,CL
    or word ptr ES:[BX + 22h],AX
LAB_1000_2141:
    call far ptr gfx_jump_50
    call far ptr gfx_jump_46_retrace2
    call routine_66
LAB_1000_214e:
    mov AX,0c7h
    push AX
    mov AX,13fh
    push AX
    sub AX,AX
    push AX
    push AX
    push word ptr [_var_86]
    call clearRect
    add SP,0ah
    call far ptr gfx_jump_46_retrace2
    pop SI
    mov SP,BP
    pop BP
    ret
routine_27 endp

routine_24 proc near
    push BP
    mov BP,SP
    sub SP,4h
    push SI
    les BX,dword ptr [_var_222]
    mov AX,word ptr ES:[BX + 74h]
    mov CL,0bh
    shr AX,CL
    mov word ptr [BP + -2h],AX
    mov AX,word ptr ES:[BX + 76h]
    shr AX,CL
    mov word ptr [BP + -4h],AX
    mov SI,AX
    mov CL,4h
    shl SI,CL
    mov BX,word ptr [BP + -2h]
    mov AL,byte ptr [BX + SI + 4700h]
    db 25h, 03h, 00h  ; and AX,3h (force word-immediate)
    mov word ptr [_var_201],AX
    pop SI
    mov SP,BP
    pop BP
    ret
    db 90h
routine_24 endp

routine_59 proc near
    push BP
    mov BP,SP
    sub SP,24h
    push SI
    mov byte ptr [BP + -2h],0dh
    mov byte ptr [BP + -1h],0h
    mov byte ptr [BP + -8h],89h
    mov byte ptr [BP + -7h],0h
    mov byte ptr [BP + -4h],8dh
    mov byte ptr [BP + -3h],0h
    mov byte ptr [BP + -0eh],80h
    mov byte ptr [BP + -0dh],0h
    mov word ptr [BP + -0ah],0h
    jmp LAB_1000_21d7
LAB_1000_21d4:
    inc word ptr [BP + -0ah]
LAB_1000_21d7:
    mov AX,word ptr [BP + 8h]
    cmp word ptr [BP + -0ah],AX
    jge LAB_1000_2239
    mov AX,32h
    imul word ptr [BP + -0ah]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    add SI,2eh
    cmp word ptr [SI],2h
    jnz LAB_1000_2220
    mov AX,word ptr [BP + -0ah]
    mov word ptr [_var_198],AX
    mov word ptr [SI],0h
    push word ptr [BP + 0eh]
    mov AX,32h
    imul word ptr [BP + -0ah]
    add AX,word ptr [BP + 4h]
    push AX
    call routine_95
    add SP,4h
    push word ptr [BP + 0eh]
    push word ptr [BP + -0ah]
    push word ptr [BP + 4h]
    call routine_96
    add SP,6h
    jmp LAB_1000_2237
LAB_1000_2220:
    mov AX,32h
    imul word ptr [BP + -0ah]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    add SI,2eh
    cmp word ptr [SI],3h
    jz LAB_1000_2237
    mov word ptr [SI],0h
LAB_1000_2237:
    jmp LAB_1000_21d4
LAB_1000_2239:
    mov AX,word ptr [BP + 0ah]
    mov word ptr [_var_210],AX
    mov AX,word ptr [BP + 0ch]
    mov word ptr [_var_212],AX
    pop SI
    mov SP,BP
    pop BP
    ret
routine_59 endp

routine_60 proc near
    push BP
    mov BP,SP
    sub SP,2ah
    push DI
    push SI
    mov byte ptr [BP + -2h],0dh
    mov byte ptr [BP + -1h],0h
    mov byte ptr [BP + -0ch],89h
    mov byte ptr [BP + -0bh],0h
    mov byte ptr [BP + -8h],8dh
    mov byte ptr [BP + -7h],0h
    mov byte ptr [BP + -12h],80h
    mov byte ptr [BP + -11h],0h
    call far ptr gfx_jump_50
    mov word ptr [_var_172],0h
    mov word ptr [BP + -14h],0h
LAB_1000_2282:
    mov AX,32h
    imul word ptr [BP + -14h]
    add AX,word ptr [BP + 4h]
    push AX
    call routine_97
    add SP,2h
    or AX,AX
    jnz LAB_1000_22a3
    mov AX,word ptr [BP + 8h]
    cmp word ptr [BP + -14h],AX
    jge LAB_1000_22a3
    inc word ptr [BP + -14h]
    jmp LAB_1000_2282
LAB_1000_22a3:
    mov byte ptr [_var_173],0h
LAB_1000_22a8:
    call far ptr gfx_jump_50
    mov AX,32h
    imul word ptr [BP + -14h]
    mov SI,AX
    mov BX,word ptr [BP + 4h]
    test word ptr [BX + SI + 30h],100h
    jnz LAB_1000_22c5
    mov word ptr [_var_172],1h
LAB_1000_22c5:
    push word ptr [BP + 0ch]
    mov AX,32h
    imul word ptr [BP + -14h]
    add AX,BX
    push AX
    push word ptr [BP + 0ah]
    call routine_98
    add SP,6h
    cmp byte ptr [_var_170],0h
    jnz LAB_1000_22e8
    cmp byte ptr [_var_202],0h
    jz LAB_1000_22a8
LAB_1000_22e8:
    cmp byte ptr [_var_202],0h
    jnz LAB_1000_22f2
    jmp LAB_1000_23c2
LAB_1000_22f2:
    mov AX,word ptr [_var_198]
    cmp word ptr [BP + -14h],AX
    jz LAB_1000_2320
    mov word ptr [BP + -14h],0h
LAB_1000_22ff:
    mov AX,32h
    imul word ptr [BP + -14h]
    add AX,word ptr [BP + 4h]
    push AX
    call routine_97
    add SP,2h
    or AX,AX
    jnz LAB_1000_2320
    mov AX,word ptr [BP + 8h]
    cmp word ptr [BP + -14h],AX
    jge LAB_1000_2320
    inc word ptr [BP + -14h]
    jmp LAB_1000_22ff
LAB_1000_2320:
    mov AX,32h
    imul word ptr [_var_198]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    cmp word ptr [SI + 10h],0h
    jz LAB_1000_2335
    jmp LAB_1000_23bc
LAB_1000_2335:
    mov word ptr [BP + -6h],0bh
    mov word ptr [BP + -4h],9h
    mov AX,9h
    push AX
    mov AX,0bh
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
    mov word ptr [BP + -6h],3h
    mov AX,32h
    imul word ptr [_var_198]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    push word ptr [BP + -4h]
    mov AX,3h
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
    mov word ptr [BP + -6h],0dh
    mov AX,32h
    imul word ptr [_var_198]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    push word ptr [BP + -4h]
    mov AX,0dh
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
LAB_1000_23bc:
    jmp LAB_1000_2578
    db 0E9h
    db 0B3h
    db 01h
LAB_1000_23c2:
    mov word ptr [BP + -14h],0h
LAB_1000_23c7:
    mov AX,32h
    imul word ptr [BP + -14h]
    add AX,word ptr [BP + 4h]
    push AX
    call routine_97
    add SP,2h
    or AX,AX
    jnz LAB_1000_23e8
    mov AX,word ptr [BP + 8h]
    cmp word ptr [BP + -14h],AX
    jge LAB_1000_23e8
    inc word ptr [BP + -14h]
    jmp LAB_1000_23c7
LAB_1000_23e8:
    mov AX,word ptr [_var_198]
    cmp word ptr [BP + -14h],AX
    jnz LAB_1000_23f3
    jmp LAB_1000_2575
LAB_1000_23f3:
    mov AX,32h
    imul word ptr [BP + -14h]
    mov SI,AX
    mov BX,word ptr [BP + 4h]
    test byte ptr [BX + SI + 30h],8h
    jnz LAB_1000_2407
    jmp LAB_1000_2562
LAB_1000_2407:
    mov word ptr [BP + -0eh],0h
    jmp LAB_1000_2411
LAB_1000_240e:
    inc word ptr [BP + -0eh]
LAB_1000_2411:
    mov AX,word ptr [BP + 8h]
    cmp word ptr [BP + -0eh],AX
    jge LAB_1000_2449
    mov AX,32h
    imul word ptr [BP + -0eh]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    cmp word ptr [SI + 2eh],0h
    jz LAB_1000_2447
    mov AX,32h
    imul word ptr [BP + -14h]
    mov DI,AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [SI + 2ch]
    cmp word ptr [BX + DI + 2ch],AX
    jnz LAB_1000_2447
    push word ptr [BP + 0ch]
    push SI
    call routine_95
    add SP,4h
LAB_1000_2447:
    jmp LAB_1000_240e
LAB_1000_2449:
    mov AX,32h
    imul word ptr [_var_198]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    cmp word ptr [SI + 10h],0h
    jz LAB_1000_245e
    jmp LAB_1000_2514
LAB_1000_245e:
    mov word ptr [BP + -6h],9h
    mov word ptr [BP + -4h],6h
    mov AX,6h
    push AX
    mov AX,9h
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
    mov word ptr [BP + -6h],3h
    mov AX,32h
    imul word ptr [_var_198]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    push word ptr [BP + -4h]
    mov AX,3h
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
    mov word ptr [BP + -6h],0dh
    mov AX,32h
    imul word ptr [_var_198]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    push word ptr [BP + -4h]
    mov AX,0dh
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
    mov word ptr [BP + -6h],0bh
    mov AX,32h
    imul word ptr [_var_198]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    push word ptr [BP + -4h]
    mov AX,0bh
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
LAB_1000_2514:
    mov AX,32h
    imul word ptr [_var_198]
    mov SI,AX
    add SI,word ptr [BP + 4h]
    cmp word ptr [SI + 10h],1h
    jnz LAB_1000_254f
    mov word ptr [BP + -6h],8h
    mov word ptr [BP + -4h],7h
    mov AX,7h
    push AX
    mov AX,8h
    push AX
    push word ptr [SI + 0eh]
    push word ptr [SI + 0ch]
    push word ptr [SI + 0ah]
    push word ptr [SI + 8h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
LAB_1000_254f:
    push word ptr [BP + 0ch]
    mov AX,32h
    imul word ptr [BP + -14h]
    add AX,word ptr [BP + 4h]
    push AX
    call routine_95
    add SP,4h
LAB_1000_2562:
    mov AX,word ptr [BP + -14h]
    mov word ptr [_var_198],AX
    push word ptr [BP + 0ch]
    push AX
    push word ptr [BP + 4h]
    call routine_96
    add SP,6h
LAB_1000_2575:
    jmp LAB_1000_22a8
LAB_1000_2578:
    mov AX,word ptr [BP + -14h]
    jmp LAB_1000_257d
LAB_1000_257d:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
routine_60 endp

routine_95 proc near
    push BP
    mov BP,SP
    sub SP,8h
    mov BX,word ptr [BP + 4h]
    cmp word ptr [BX + 2eh],0h
    jnz LAB_1000_25d0
    mov word ptr [BX + 2eh],1h
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX + 12h]
    mov CL,4h
    shr AX,CL
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [BX + 12h]
    db 25h, 0Fh, 00h  ; and AX,0Fh (force word-immediate)
    mov word ptr [BP + -2h],AX
    cmp word ptr [BX + 12h],0h
    jz LAB_1000_25ce
    push AX
    push word ptr [BP + -6h]
    push word ptr [BX + 0eh]
    push word ptr [BX + 0ch]
    push word ptr [BX + 0ah]
    push word ptr [BX + 8h]
    push word ptr [BP + 6h]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
LAB_1000_25ce:
    jmp LAB_1000_25ee
LAB_1000_25d0:
    mov BX,word ptr [BP + 4h]
    mov word ptr [BX + 2eh],0h
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX + 12h]
    db 25h, 0Fh, 00h  ; and AX,0Fh (force word-immediate)
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [BX + 12h]
    mov CL,4h
    shr AX,CL
    mov word ptr [BP + -2h],AX
LAB_1000_25ee:
    mov BX,word ptr [BP + 4h]
    cmp word ptr [BX + 12h],0h
    jz LAB_1000_2614
    push word ptr [BP + -2h]
    push word ptr [BP + -6h]
    push word ptr [BX + 0eh]
    push word ptr [BX + 0ch]
    push word ptr [BX + 0ah]
    push word ptr [BX + 8h]
    push word ptr [BP + 6h]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
LAB_1000_2614:
    mov SP,BP
    pop BP
    ret
routine_95 endp

routine_97 proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [_var_210]
    cmp word ptr [BX],AX
    ja LAB_1000_263e
    cmp word ptr [BX + 4h],AX
    jc LAB_1000_263e
    mov AX,word ptr [_var_212]
    cmp word ptr [BX + 2h],AX
    ja LAB_1000_263e
    cmp word ptr [BX + 6h],AX
    jc LAB_1000_263e
    mov AX,1h
    jmp LAB_1000_2642
    db 0EBh
    db 04h
LAB_1000_263e:
    sub AX,AX
    jmp LAB_1000_2642
LAB_1000_2642:
    mov SP,BP
    pop BP
    ret
routine_97 endp

routine_98 proc near
    push BP
    mov BP,SP
    sub SP,12h
    push SI
    mov BX,word ptr [BP + 6h]
    mov AX,word ptr [BX + 10h]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    add AX,CX
    shl AX,1h
    add AX,1c8eh
    mov word ptr [_var_169],AX
    mov byte ptr [_var_82],0h
    sub AX,AX
    mov word ptr [BP + -0ah],AX
    mov word ptr [BP + -8h],AX
    sub AL,AL
    mov byte ptr [BP + -0ch],AL
    mov byte ptr [_var_175],AL
    mov byte ptr [_var_202],AL
    mov byte ptr [_var_170],AL
    cmp byte ptr [_var_173],1h
    jnz LAB_1000_268e
    mov byte ptr [_var_81],AL
    mov byte ptr [BP + -0ch],1h
LAB_1000_268e:
    les BX,dword ptr [_var_222]
    cmp word ptr ES:[BX + 72h],1h
    jnz LAB_1000_26bb
    sub AX,AX
    push AX
    call far ptr misc_jump_5d_readJoy
    add SP,2h
    mov word ptr [BP + -8h],AX
    mov AX,1h
    push AX
    call far ptr misc_jump_5d_readJoy
    add SP,2h
    mov word ptr [BP + -0ah],AX
    call far ptr routine_134
LAB_1000_26bb:
    call far ptr misc_jump_5a_keybuf
    or AL,AL
    jz LAB_1000_26ec
    cmp word ptr [BP + -8h],0h
    jnz LAB_1000_26ec
    cmp word ptr [BP + -0ah],0h
    jnz LAB_1000_26ec
    cmp byte ptr [_var_55],4eh
    jc LAB_1000_26ec
    cmp byte ptr [_var_55],0b2h
    ja LAB_1000_26ec
    cmp byte ptr [_var_56],4eh
    jc LAB_1000_26ec
    cmp byte ptr [_var_56],0b2h
    jbe LAB_1000_26f5
LAB_1000_26ec:
    cmp byte ptr [BP + -0ch],1h
    jz LAB_1000_26f5
    jmp LAB_1000_2a82
LAB_1000_26f5:
    cmp byte ptr [_var_173],1h
    jnz LAB_1000_270c
    cmp byte ptr [_var_81],0fh
    jbe LAB_1000_270c
    mov byte ptr [BP + -0ch],0h
    mov byte ptr [_var_173],0h
LAB_1000_270c:
    les BX,dword ptr [_var_222]
    cmp word ptr ES:[BX + 72h],1h
    jnz LAB_1000_2739
    sub AX,AX
    push AX
    call far ptr misc_jump_5d_readJoy
    add SP,2h
    mov word ptr [BP + -8h],AX
    mov AX,1h
    push AX
    call far ptr misc_jump_5d_readJoy
    add SP,2h
    mov word ptr [BP + -0ah],AX
    call far ptr routine_134
LAB_1000_2739:
    cmp byte ptr [_var_57],0h
    jz LAB_1000_274f
    call cleanup
    call routine_28
    sub AX,AX
    push AX
    call routine_8
    add SP,2h
LAB_1000_274f:
    cmp word ptr [_var_172],1h
    jnz LAB_1000_27b1
    cmp byte ptr [_var_82],6h
    jbe LAB_1000_27b1
    mov byte ptr [_var_82],0h
    mov SI,word ptr [_var_171]
    shl SI,1h
    add SI,word ptr [_var_169]
    add SI,2h
    mov AX,word ptr [SI]
    mov CL,4h
    shr AX,CL
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [SI]
    db 25h, 0Fh, 00h  ; and AX,0Fh (force word-immediate)
    mov word ptr [BP + -4h],AX
    push AX
    push word ptr [BP + -6h]
    mov BX,word ptr [BP + 6h]
    push word ptr [BX + 0eh]
    push word ptr [BX + 0ch]
    push word ptr [BX + 0ah]
    push word ptr [BX + 8h]
    push word ptr [BP + 8h]
    call far ptr gfx_jump_29_switchColor
    add SP,0eh
    inc word ptr [_var_171]
    mov AX,word ptr [_var_171]
    sub DX,DX
    mov BX,word ptr [_var_169]
    div word ptr [BX]
    mov word ptr [_var_171],DX
LAB_1000_27b1:
    mov BX,word ptr [BP + 6h]
    test word ptr [BX + 30h],800h
    jnz LAB_1000_27be
    jmp LAB_1000_2a7f
LAB_1000_27be:
    test word ptr [BX + 30h],1000h
    jnz LAB_1000_27c8
    jmp LAB_1000_2a7f
LAB_1000_27c8:
    cmp byte ptr [_var_83],12h
    ja LAB_1000_27d2
    jmp LAB_1000_2a7f
LAB_1000_27d2:
    mov byte ptr [_var_83],0h
    cmp byte ptr [_var_174],0h
    jnz LAB_1000_27e1
    jmp LAB_1000_2a69
LAB_1000_27e1:
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f06h]
    db 25h, 3Fh, 00h  ; and AX,3Fh (force word-immediate)
    jmp LAB_1000_2a3f
caseD_c_2a4a:
caseD_1_5160:
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_20E2]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_20E2]
    mov word ptr [BX + 0ah],AX
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov BL,byte ptr [BX + 4f07h]
    and BX,7fh
    mov CL,4h
    shl BX,CL
    test byte ptr [BX + 4256h],8h
    jz LAB_1000_286c
    mov BX,word ptr [dat_20E2]
    mov word ptr [BX + 2h],11eh
    jmp LAB_1000_2875
LAB_1000_286c:
    mov BX,word ptr [dat_20E2]
    mov word ptr [BX + 2h],12dh
LAB_1000_2875:
    push word ptr [dat_20E2]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    jmp LAB_1000_2a67
caseD_3_2a4a:
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_2122]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_2122]
    mov word ptr [BX + 0ah],AX
    push word ptr [dat_2122]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    jmp LAB_1000_2a67
caseD_2_2a4a:
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_2162]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_2162]
    mov word ptr [BX + 0ah],AX
    push word ptr [dat_2162]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    jmp LAB_1000_2a67
caseD_5_2a4a:
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    mov BX,word ptr [dat_21E2]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    mov BX,word ptr [dat_21E2]
    mov word ptr [BX + 0ah],AX
    push word ptr [dat_21E2]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    jmp LAB_1000_2a67
caseD_8_2a4a:
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_2122]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_2122]
    mov word ptr [BX + 0ah],AX
    push word ptr [dat_2122]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    jmp LAB_1000_2a67
caseD_a_2a4a:
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    mov BX,word ptr [dat_21E2]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    mov BX,word ptr [dat_21E2]
    mov word ptr [BX + 0ah],AX
    push word ptr [dat_21E2]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    jmp LAB_1000_2a67
    db 0EBh
    db 28h
LAB_1000_2a3f:
    db 2Dh, 01h, 00h  ; sub AX,1h (force word-immediate)
    db 3Dh, 0Bh, 00h  ; cmp AX,0Bh (force word-immediate)
    ja LAB_1000_2a67
    add AX,AX
    xchg AX,BX
switchD_27f7:
    jmp word ptr CS:[BX + 2a4fh]
var_4:
    dw 27F7h
    dw 28DFh
    dw 2884h
    dw 2A73h
    dw 293Ah
    dw 2A73h
    dw 2A73h
    dw 298Fh
    dw 2A73h
    dw 29E9h
    dw 2A73h
    dw 27F7h
LAB_1000_2a67:
    jmp caseD_4_2a4a
LAB_1000_2a69:
    push word ptr [_var_190]
    call routine_135
    add SP,2h
caseD_6_2a4a:
caseD_7_5402:
caseD_9_5403:
caseD_b_5404:
caseD_4_2a4a:
caseD_4_5405:
    cmp byte ptr [_var_174],1h
    sbb AX,AX
    neg AX
    mov byte ptr [_var_174],AL
LAB_1000_2a7f:
    jmp LAB_1000_26bb
LAB_1000_2a82:
    call far ptr misc_jump_5a_keybuf
    or AL,AL
    jnz LAB_1000_2a95
    call far ptr misc_jump_5b_getkey
    mov word ptr [BP + -10h],AX
    jmp LAB_1000_2af9
LAB_1000_2a95:
    cmp word ptr [BP + -8h],1h
    jnz LAB_1000_2aa2
    mov word ptr [BP + -10h],0dh
    jmp LAB_1000_2af9
LAB_1000_2aa2:
    cmp word ptr [BP + -0ah],1h
    jnz LAB_1000_2aaf
    mov word ptr [BP + -10h],1bh
    jmp LAB_1000_2af9
LAB_1000_2aaf:
    cmp byte ptr [_var_55],4eh
    jnc LAB_1000_2ac2
    mov word ptr [BP + -10h],4b00h
    mov byte ptr [_var_173],1h
    jmp LAB_1000_2af9
LAB_1000_2ac2:
    cmp byte ptr [_var_55],0b2h
    jbe LAB_1000_2ad5
    mov word ptr [BP + -10h],4d00h
    mov byte ptr [_var_173],1h
    jmp LAB_1000_2af9
LAB_1000_2ad5:
    cmp byte ptr [_var_56],4eh
    jnc LAB_1000_2ae8
    mov word ptr [BP + -10h],offset _var_185
    mov byte ptr [_var_173],1h
    jmp LAB_1000_2af9
LAB_1000_2ae8:
    cmp byte ptr [_var_56],0b2h
    jbe LAB_1000_2af9
    mov word ptr [BP + -10h],5000h
    mov byte ptr [_var_173],1h
LAB_1000_2af9:
    cmp byte ptr [BP + -10h],0dh
    jnz LAB_1000_2b04
    mov byte ptr [_var_202],1h
LAB_1000_2b04:
    cmp word ptr [BP + -10h],1000h
    jnz LAB_1000_2b15
    mov byte ptr [_var_57],1h
    mov byte ptr [_var_202],1h
LAB_1000_2b15:
    cmp word ptr [BP + -10h],4800h
    jnz LAB_1000_2b39
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX + 2h]
    sub word ptr [_var_212],AX
    mov AX,word ptr [_var_212]
    cmp word ptr [BX + 8h],AX
    jle LAB_1000_2b34
    mov AX,word ptr [BX + 8h]
    mov word ptr [_var_212],AX
LAB_1000_2b34:
    mov byte ptr [_var_170],1h
LAB_1000_2b39:
    cmp word ptr [BP + -10h],5000h
    jnz LAB_1000_2b5d
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX + 2h]
    add word ptr [_var_212],AX
    mov AX,word ptr [_var_212]
    cmp word ptr [BX + 0ah],AX
    jnc LAB_1000_2b58
    mov AX,word ptr [BX + 0ah]
    mov word ptr [_var_212],AX
LAB_1000_2b58:
    mov byte ptr [_var_170],1h
LAB_1000_2b5d:
    cmp word ptr [BP + -10h],4d00h
    jnz LAB_1000_2b80
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    add word ptr [_var_210],AX
    mov AX,word ptr [_var_210]
    cmp word ptr [BX + 6h],AX
    jnc LAB_1000_2b7b
    mov AX,word ptr [BX + 6h]
    mov word ptr [_var_210],AX
LAB_1000_2b7b:
    mov byte ptr [_var_170],1h
LAB_1000_2b80:
    cmp word ptr [BP + -10h],4b00h
    jnz LAB_1000_2bb1
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    sub word ptr [_var_210],AX
    mov AX,word ptr [_var_210]
    cmp word ptr [BX + 4h],AX
    jle LAB_1000_2b9e
    mov AX,word ptr [BX + 4h]
    mov word ptr [_var_210],AX
LAB_1000_2b9e:
    mov AX,word ptr [_var_212]
    cmp word ptr [BX + 8h],AX
    jle LAB_1000_2bac
    mov AX,word ptr [BX]
    add word ptr [_var_210],AX
LAB_1000_2bac:
    mov byte ptr [_var_170],1h
LAB_1000_2bb1:
    mov BX,word ptr [BP + 6h]
    test word ptr [BX + 30h],800h
    jz LAB_1000_2bcc
    test word ptr [BX + 30h],1000h
    jz LAB_1000_2bcc
    push word ptr [_var_190]
    call routine_135
    add SP,2h
LAB_1000_2bcc:
    pop SI
    mov SP,BP
    pop BP
    ret
routine_98 endp

routine_96 proc near
    push BP
    mov BP,SP
    sub SP,22h
    push DI
    push SI
    mov byte ptr [BP + -2h],0ah
    mov byte ptr [BP + -1h],0h
    mov byte ptr [BP + -6h],89h
    mov byte ptr [BP + -5h],0h
    mov byte ptr [BP + -4h],8dh
    mov byte ptr [BP + -3h],0h
    mov byte ptr [BP + -0ah],80h
    mov byte ptr [BP + -9h],0h
    mov AX,32h
    mul word ptr [BP + 6h]
    mov DI,AX
    mov BX,word ptr [BP + 4h]
    mov SI,word ptr [BX + DI + 30h]
    test SI,800h
    jnz LAB_1000_2c10
    jmp LAB_1000_35db
LAB_1000_2c10:
    mov AX,SI
    db 25h, 07h, 00h  ; and AX,7h (force word-immediate)
    db 3Dh, 07h, 00h  ; cmp AX,7h (force word-immediate)
    jz LAB_1000_2c1d
    jmp LAB_1000_2fbf
LAB_1000_2c1d:
    mov AX,95h
    push AX
    mov AX,13fh
    push AX
    mov AX,0ah
    push AX
    mov AX,0ebh
    push AX
    push word ptr [BP + 8h]
    call clearRect
    add SP,0ah
    mov BX,word ptr [BP + 8h]
    mov word ptr [BX + 4h],0h
    lea AX,[BP + -6h]
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_pressExit
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,8h
    push AX
    mov AX,82h
    push AX
    mov AX,0f0h
    push AX
    mov AX,50h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call routine_130
    add SP,0ch
    mov AX,7eh
    push AX
    mov AX,12ch
    push AX
    mov AX,64h
    push AX
    mov AX,0f0h
    push AX
    push word ptr [BP + 8h]
    call clearRect
    add SP,0ah
    cmp byte ptr [_var_214],1h
    jnz LAB_1000_2cc2
    mov AX,28h
    push AX
    mov AX,30h
    push AX
    push word ptr [_var_228]
    push word ptr [_var_227]
    sub AX,AX
    push AX
    mov AX,96h
    push AX
    sub AX,AX
    push AX
    mov AX,1h
    push AX
    call far ptr gfx_jump_2a
    add SP,10h
    mov byte ptr [_var_214],0h
LAB_1000_2cc2:
    mov word ptr [_var_190],0h
    mov AX,offset dat_270f
    push AX
    push word ptr [BP + 8h]
    call routine_132
    add SP,4h
    mov word ptr [_var_192],AX
    push AX
    call routine_63
    add SP,2h
    mov word ptr [_var_219],AX
    mov word ptr [_var_220],DX
    mov AX,offset str_dot1
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_overall1
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,46h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call drawString
    add SP,0ah
    mov AX,offset str_missionRating1
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,57h
    push AX
    mov AX,4eh
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call drawString
    add SP,0ah
    mov AX,offset str_dot2
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    lea AX,[BP + -1eh]
    push AX
    push word ptr [_var_220]
    push word ptr [_var_219]
    call my_ltoa
    add SP,6h
    lea AX,[BP + -1eh]
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,56h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call drawString
    add SP,0ah
    les BX,dword ptr [_var_222]
    cmp word ptr ES:[BX + 30h],0h
    jz LAB_1000_2dc9
    mov AX,57h
    push AX
    mov AX,60h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset str_trainingScore
    push AX
    push word ptr [BP + 8h]
    call drawString
    add SP,0ah
    mov AX,57h
    push AX
    mov AX,68h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset str_notRecorded
    push AX
    push word ptr [BP + 8h]
    call drawString
    add SP,0ah
    jmp LAB_1000_2e53
LAB_1000_2dc9:
    mov AX,offset str_dot3
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_careerTotal
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,6ch
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call drawString
    add SP,0ah
    mov AX,offset str_dot4
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    lea AX,[BP + -1eh]
    push AX
    les BX,dword ptr [_var_178]
    mov AX,word ptr ES:[BX + 32h]
    mov DX,word ptr ES:[BX + 34h]
    add AX,word ptr [_var_219]
    adc DX,word ptr [_var_220]
    push DX
    push AX
    call my_ltoa
    add SP,6h
    lea AX,[BP + -1eh]
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,74h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call drawString
    add SP,0ah
LAB_1000_2e53:
    mov BX,word ptr [BP + 8h]
    mov word ptr [BX + 4h],0dh
    mov AX,offset str_missionSummary
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,57h
    push AX
    mov AX,14h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call drawString
    add SP,0ah
    mov BX,word ptr [BP + 8h]
    mov word ptr [BX + 4h],0h
    mov AX,offset str_priSecTargets
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,1eh
    push AX
    mov AX,0f0h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call actualDrawString
    add SP,8h
    mov AX,offset dat_4824
    push AX
    mov AX,word ptr [_var_215]
    add AX,word ptr [_var_221]
    push AX
    call my_itoa
    add SP,4h
    mov AX,1eh
    push AX
    mov AX,131h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call actualDrawString
    add SP,8h
    mov AX,offset str_otherTargets
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,26h
    push AX
    mov AX,0f0h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call actualDrawString
    add SP,8h
    mov AX,offset dat_4824
    push AX
    mov AX,word ptr [_var_199]
    add AX,word ptr [_var_224]
    sub AX,word ptr [_var_215]
    sub AX,word ptr [_var_221]
    push AX
    call my_itoa
    add SP,4h
    mov AX,26h
    push AX
    mov AX,131h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call actualDrawString
    add SP,8h
    mov AX,offset str_enemyPlanes
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,2eh
    push AX
    mov AX,0f0h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call actualDrawString
    add SP,8h
    mov AX,offset dat_4824
    push AX
    push word ptr [_var_181]
    call my_itoa
    add SP,4h
    mov AX,2eh
    push AX
    mov AX,131h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call actualDrawString
    add SP,8h
    mov AX,offset str_friendlyTargets
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,36h
    push AX
    mov AX,0f0h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call actualDrawString
    add SP,8h
    mov AX,offset dat_4824
    push AX
    mov AX,word ptr [_var_200]
    add AX,word ptr [_var_225]
    add AX,word ptr [_var_182]
    push AX
    call my_itoa
    add SP,4h
    mov AX,36h
    push AX
    mov AX,131h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call actualDrawString
    add SP,8h
    mov byte ptr [_var_207],1h
LAB_1000_2fbf:
    mov AX,32h
    mul word ptr [BP + 6h]
    mov SI,AX
    mov BX,word ptr [BP + 4h]
    test word ptr [BX + SI + 30h],1000h
    jnz LAB_1000_2fd4
    jmp LAB_1000_35db
LAB_1000_2fd4:
    cmp byte ptr [_var_207],1h
    jz LAB_1000_2fde
    jmp LAB_1000_30cc
LAB_1000_2fde:
    mov byte ptr [_var_207],0h
    mov byte ptr [_var_214],0h
    push word ptr [_var_102]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    sub AX,AX
    mov word ptr [_var_213],AX
    mov word ptr [_var_209],AX
    mov word ptr [_var_190],AX
    mov AX,95h
    push AX
    mov AX,13fh
    push AX
    mov AX,0ah
    push AX
    mov AX,0ebh
    push AX
    push word ptr [BP + 8h]
    call clearRect
    add SP,0ah
    mov AX,100h
    push AX
    call routine_63
    add SP,2h
    mov word ptr [_var_219],AX
    mov word ptr [_var_220],DX
    mov AX,offset str_dot5
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_overall2
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,64h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call drawString
    add SP,0ah
    mov AX,offset str_missionRating2
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,57h
    push AX
    mov AX,6ch
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call drawString
    add SP,0ah
    mov AX,offset str_dot6
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    lea AX,[BP + -1eh]
    push AX
    push word ptr [_var_220]
    push word ptr [_var_219]
    call my_ltoa
    add SP,6h
    lea AX,[BP + -1eh]
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,74h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call drawString
    add SP,0ah
LAB_1000_30cc:
    mov AX,63h
    push AX
    mov AX,13fh
    push AX
    mov AX,0ah
    push AX
    mov AX,0ebh
    push AX
    push word ptr [BP + 8h]
    call clearRect
    add SP,0ah
    mov BX,word ptr [BP + 8h]
    mov word ptr [BX + 4h],0dh
    mov AX,offset str_missionEvent
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,57h
    push AX
    mov AX,14h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call drawString
    add SP,0ah
    mov AX,offset str_time
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    lea AX,[BP + -1eh]
    push AX
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    push word ptr [BX + 4f02h]
    call routine_106
    add SP,4h
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,1eh
    push AX
    mov AX,0f0h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call actualDrawString
    add SP,8h
    mov AX,word ptr [_var_190]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AL,byte ptr [SI + 4f07h]
    db 25h, 7Fh, 00h  ; and AX,7Fh (force word-immediate)
    mov word ptr [BP + -20h],AX
    mov AL,byte ptr [SI + 4f06h]
    db 25h, 3Fh, 00h  ; and AX,3Fh (force word-immediate)
    jmp LAB_1000_3432
caseD_c_343d:
caseD_1_6128:
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    mov SI,word ptr [BX + 424eh]
    or SI,SI
    jz LAB_1000_31da
    mov BX,SI
    shl BX,1h
    push word ptr [BX + 5608h]
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_destroyed4
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + 425ch]
    and BX,7fh
    shl BX,1h
    push word ptr [BX + 5608h]
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,offset str_destroyed1
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    jmp LAB_1000_3206
LAB_1000_31da:
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + 425ch]
    and BX,7fh
    shl BX,1h
    push word ptr [BX + 5608h]
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_destroyed2
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
LAB_1000_3206:
    jmp caseD_4_343d
caseD_3_343d:
    mov AX,word ptr [BP + -20h]
    mov CL,5h
    shl AX,CL
    add AX,198h
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_shotDown2
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,word ptr [BP + -20h]
    mov CL,5h
    shl AX,CL
    add AX,19fh
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,offset str_shotDown
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    jmp caseD_4_343d
caseD_2_343d:
    mov BX,word ptr [BP + -20h]
    shl BX,1h
    push word ptr [BX + 5608h]
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_destroyed3
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    jmp caseD_4_343d
caseD_a_343d:
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    mov SI,word ptr [BX + 424eh]
    or SI,SI
    jz LAB_1000_32d3
    mov BX,SI
    shl BX,1h
    push word ptr [BX + 5608h]
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_rearmed3
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + 425ch]
    and BX,7fh
    shl BX,1h
    push word ptr [BX + 5608h]
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,offset str_rearmed1
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    jmp LAB_1000_32ff
LAB_1000_32d3:
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + 425ch]
    and BX,7fh
    shl BX,1h
    push word ptr [BX + 5608h]
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_rearmed2
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
LAB_1000_32ff:
    jmp caseD_4_343d
caseD_5_343d:
    mov AX,offset str_hitBy
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,12h
    mul word ptr [BP + -20h]
    add AX,3f8h
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,offset str_missile
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    jmp caseD_4_343d
caseD_8_343d:
    cmp word ptr [_var_190],0h
    jnz LAB_1000_338f
    mov AX,offset str_takeoffPoint
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov BX,word ptr [dat_4804]
    mov CL,4h
    shl BX,CL
    mov SI,word ptr [BX + 424eh]
    or SI,SI
    jz LAB_1000_336e
    mov BX,SI
    shl BX,1h
    push word ptr [BX + 5608h]
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    jmp LAB_1000_338c
LAB_1000_336e:
    mov BX,word ptr [dat_4804]
    mov CL,4h
    shl BX,CL
    mov BL,byte ptr [BX + 425ch]
    sub BH,BH
    shl BX,1h
    push word ptr [BX + 5608h]
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
LAB_1000_338c:
    jmp LAB_1000_342e
LAB_1000_338f:
    mov AX,offset str_missionEnd
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    les BX,dword ptr [_var_222]
    mov AX,word ptr ES:[BX + 26h]
    jmp LAB_1000_341d
LAB_1000_33a7:
    mov AX,offset str_crashed
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    jmp LAB_1000_342e
LAB_1000_33b7:
    les BX,dword ptr [_var_222]
    cmp word ptr ES:[BX + 28h],0h
    jnz LAB_1000_33d9
    cmp word ptr [_var_201],0h
    jz LAB_1000_33d9
    mov AX,offset str_goodBailout
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    jmp LAB_1000_3409
LAB_1000_33d9:
    les BX,dword ptr [_var_222]
    cmp word ptr ES:[BX + 28h],0h
    jnz LAB_1000_33fb
    cmp word ptr [_var_201],0h
    jnz LAB_1000_33fb
    mov AX,offset str_captured
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    jmp LAB_1000_3409
LAB_1000_33fb:
    mov AX,offset str_bailedDied
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
LAB_1000_3409:
    jmp LAB_1000_342e
LAB_1000_340b:
    mov AX,offset str_goodLanding
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    jmp LAB_1000_342e
    db 0EBh
    db 11h
LAB_1000_341d:
    db 3Dh, 01h, 00h  ; cmp AX,1h (force word-immediate)
    jz LAB_1000_33a7
    db 3Dh, 02h, 00h  ; cmp AX,2h (force word-immediate)
    jz LAB_1000_33b7
    db 3Dh, 03h, 00h  ; cmp AX,3h (force word-immediate)
    jz LAB_1000_340b
    jmp LAB_1000_342e
LAB_1000_342e:
    jmp caseD_4_343d
    db 0EBh
    db 28h
LAB_1000_3432:
    db 2Dh, 01h, 00h  ; sub AX,1h (force word-immediate)
    db 3Dh, 0Bh, 00h  ; cmp AX,0Bh (force word-immediate)
    ja caseD_4_343d
    add AX,AX
    xchg AX,BX
switchD_317d:
    jmp word ptr CS:[BX + 3442h]
var_5:
    dw 317Dh
    dw 3252h
    dw 3209h
    dw 345Ah
    dw 3302h
    dw 345Ah
    dw 345Ah
    dw 3335h
    dw 345Ah
    dw 3276h
    dw 345Ah
    dw 317Dh
caseD_6_3206:
caseD_7_3332:
caseD_9_6448:
caseD_b_6449:
caseD_4_343d:
caseD_4_6450:
    mov AX,8h
    push AX
    mov AX,26h
    push AX
    mov AX,0f0h
    push AX
    mov AX,50h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call routine_130
    add SP,0ch
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],80h
    jz LAB_1000_34b1
    mov AX,offset str_primaryObj
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,57h
    push AX
    mov BX,word ptr [BP + 8h]
    push word ptr [BX + 0ah]
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push BX
    call drawString
    add SP,0ah
LAB_1000_34b1:
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],40h
    jz LAB_1000_34eb
    mov AX,offset str_secndryObj
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,57h
    push AX
    mov BX,word ptr [BP + 8h]
    push word ptr [BX + 0ah]
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push BX
    call drawString
    add SP,0ah
LAB_1000_34eb:
    push word ptr [_var_190]
    call routine_63
    add SP,2h
    mov word ptr [_var_219],AX
    mov word ptr [_var_220],DX
    mov AX,offset str_cumulative2
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_cumulative
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,46h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call drawString
    add SP,0ah
    mov AX,offset str_missionRating3
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,57h
    push AX
    mov AX,4eh
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call drawString
    add SP,0ah
    mov AX,offset str_pressSelect
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    lea AX,[BP + -1eh]
    push AX
    push word ptr [_var_220]
    push word ptr [_var_219]
    call my_ltoa
    add SP,6h
    lea AX,[BP + -1eh]
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,57h
    push AX
    mov AX,56h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call drawString
    add SP,0ah
    call routine_131
    lea AX,[BP + -6h]
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    mov AX,offset str_pressNext
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,8h
    push AX
    mov AX,82h
    push AX
    mov AX,0f0h
    push AX
    mov AX,50h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 8h]
    call routine_130
    add SP,0ch
LAB_1000_35db:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
routine_96 endp

routine_135 proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f06h]
    db 25h, 3Fh, 00h  ; and AX,3Fh (force word-immediate)
    jmp LAB_1000_3835
caseD_b_3840:
caseD_0_6634:
    mov BX,word ptr [BP + 4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_20C2]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [BP + 4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_20C2]
    mov word ptr [BX + 0ah],AX
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov BL,byte ptr [BX + 4f07h]
    and BX,7fh
    mov CL,4h
    shl BX,CL
    test byte ptr [BX + 4256h],8h
    jz LAB_1000_366c
    mov BX,word ptr [dat_20C2]
    mov word ptr [BX + 2h],11eh
    jmp LAB_1000_3675
LAB_1000_366c:
    mov BX,word ptr [dat_20C2]
    mov word ptr [BX + 2h],12dh
LAB_1000_3675:
    push word ptr [dat_20C2]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    jmp caseD_3_3840
caseD_2_3840:
    mov BX,word ptr [BP + 4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_2102]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [BP + 4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_2102]
    mov word ptr [BX + 0ah],AX
    push word ptr [dat_2102]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    jmp caseD_3_3840
caseD_1_3840:
    mov BX,word ptr [BP + 4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_2142]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [BP + 4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_2142]
    mov word ptr [BX + 0ah],AX
    push word ptr [dat_2142]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    jmp caseD_3_3840
caseD_4_3840:
    mov BX,word ptr [BP + 4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    mov BX,word ptr [dat_21C2]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [BP + 4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    mov BX,word ptr [dat_21C2]
    mov word ptr [BX + 0ah],AX
    push word ptr [dat_21C2]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    jmp caseD_3_3840
caseD_7_3840:
    mov BX,word ptr [BP + 4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_2102]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [BP + 4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    db 2Dh, 02h, 00h  ; sub AX,02h (force word-immediate)
    mov BX,word ptr [dat_2102]
    mov word ptr [BX + 0ah],AX
    push word ptr [dat_2102]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    jmp caseD_3_3840
caseD_9_3840:
    mov BX,word ptr [BP + 4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    mov BX,word ptr [dat_21C2]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [BP + 4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    mov BX,word ptr [dat_21C2]
    mov word ptr [BX + 0ah],AX
    push word ptr [dat_21C2]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    jmp caseD_3_3840
    db 0EBh
    db 28h
LAB_1000_3835:
    db 2Dh, 01h, 00h  ; sub AX,1h (force word-immediate)
    db 3Dh, 0Bh, 00h  ; cmp AX,0Bh (force word-immediate)
    ja caseD_3_3840
    add AX,AX
    xchg AX,BX
switchD_35f9:
    jmp word ptr CS:[BX + 3845h]
var_6:
    dw 35F9h
    dw 36DDh
    dw 3684h
    dw 385Dh
    dw 3736h
    dw 385Dh
    dw 385Dh
    dw 3789h
    dw 385Dh
    dw 37E1h
    dw 385Dh
    dw 35F9h
caseD_5_3681:
caseD_6_37df:
caseD_8_6871:
caseD_a_6872:
caseD_3_3840:
caseD_3_6873:
    mov SP,BP
    pop BP
    ret
routine_135 endp

routine_65 proc near
    push BP
    mov BP,SP
    sub SP,18h
    push SI
    cmp byte ptr [_var_214],1h
    jnz LAB_1000_389a
    mov AX,28h
    push AX
    mov AX,30h
    push AX
    push word ptr [_var_228]
    push word ptr [_var_227]
    sub AX,AX
    push AX
    mov AX,96h
    push AX
    sub AX,AX
    push AX
    mov AX,1h
    push AX
    call far ptr gfx_jump_2a
    add SP,10h
    mov byte ptr [_var_214],0h
LAB_1000_389a:
    mov AX,45h
    push AX
    mov AX,13fh
    push AX
    mov AX,1eh
    push AX
    mov AX,0e9h
    push AX
    push word ptr [BP + 4h]
    call clearRect
    add SP,0ah
    mov AX,26h
    push AX
    mov AX,0f0h
    push AX
    mov AX,offset str_inFlight
    push AX
    push word ptr [BP + 4h]
    call actualDrawString
    add SP,8h
LAB_1000_38c8:
    inc word ptr [_var_190]
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],3fh
    jnz LAB_1000_38e2
    jmp LAB_1000_3a77
LAB_1000_38e2:
    mov BX,AX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f06h]
    and AL,3fh
    cmp AL,9h
    jz LAB_1000_38f7
    jmp LAB_1000_3a77
LAB_1000_38f7:
    mov AX,25h
    push AX
    mov AX,13fh
    push AX
    mov AX,1eh
    push AX
    mov AX,0f0h
    push AX
    push word ptr [BP + 4h]
    call clearRect
    add SP,0ah
    mov AX,offset str_timeLabel
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    lea AX,[BP + -16h]
    push AX
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    push word ptr [BX + 4f02h]
    call routine_106
    add SP,4h
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,1eh
    push AX
    mov AX,0f0h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 4h]
    call actualDrawString
    add SP,8h
    sub AX,AX
    push AX
    call far ptr gfx_jump_21
    add SP,2h
    cmp word ptr [_var_209],0h
    jnz LAB_1000_39b9
    cmp word ptr [_var_213],0h
    jnz LAB_1000_39b9
    mov AX,word ptr [_var_190]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AL,byte ptr [SI + 4f05h]
    cbw
    push AX
    mov AL,byte ptr [SI + 4f04h]
    cbw
    push AX
    mov AL,byte ptr [_var_195]
    cbw
    push AX
    mov AL,byte ptr [_var_194]
    cbw
    push AX
    call routine_105
    add SP,8h
    mov AX,word ptr [_var_190]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AL,byte ptr [SI + 4f04h]
    cbw
    mov word ptr [_var_209],AX
    mov AL,byte ptr [SI + 4f05h]
    cbw
    mov word ptr [_var_213],AX
    jmp LAB_1000_39f5
LAB_1000_39b9:
    mov AX,word ptr [_var_190]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AL,byte ptr [SI + 4f04h]
    cbw
    mov word ptr [_var_208],AX
    mov AL,byte ptr [SI + 4f05h]
    cbw
    mov word ptr [_var_211],AX
    push word ptr [_var_213]
    push word ptr [_var_209]
    push AX
    push word ptr [_var_208]
    call routine_105
    add SP,8h
    mov AX,word ptr [_var_208]
    mov word ptr [_var_209],AX
    mov AX,word ptr [_var_211]
    mov word ptr [_var_213],AX
LAB_1000_39f5:
    push word ptr [_var_190]
    call routine_63
    add SP,2h
    mov word ptr [_var_219],AX
    mov word ptr [_var_220],DX
    mov AX,offset str_timeZeros
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcpy
    add SP,4h
    lea AX,[BP + -16h]
    push AX
    push word ptr [_var_220]
    push word ptr [_var_219]
    call my_ltoa
    add SP,6h
    lea AX,[BP + -16h]
    push AX
    mov AX,offset dat_4824
    push AX
    call mystrcat
    add SP,4h
    mov AX,5eh
    push AX
    mov AX,13fh
    push AX
    mov AX,56h
    push AX
    mov AX,0e8h
    push AX
    push word ptr [BP + 4h]
    call clearRect
    add SP,0ah
    mov AX,57h
    push AX
    mov AX,56h
    push AX
    mov AX,0e8h
    push AX
    mov AX,offset dat_4824
    push AX
    push word ptr [BP + 4h]
    call drawString
    add SP,0ah
    mov byte ptr [_var_81],0h
LAB_1000_3a6b:
    cmp byte ptr [_var_81],5h
    ja LAB_1000_3a74
    jmp LAB_1000_3a6b
LAB_1000_3a74:
    jmp LAB_1000_38c8
LAB_1000_3a77:
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],3fh
    jnz LAB_1000_3a8e
    dec word ptr [_var_190]
LAB_1000_3a8e:
    sub AX,AX
    push AX
    call far ptr gfx_jump_21
    add SP,2h
    cmp word ptr [_var_209],0h
    jnz LAB_1000_3aef
    cmp word ptr [_var_213],0h
    jnz LAB_1000_3aef
    mov AX,word ptr [_var_190]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AL,byte ptr [SI + 4f05h]
    cbw
    push AX
    mov AL,byte ptr [SI + 4f04h]
    cbw
    push AX
    mov AL,byte ptr [_var_195]
    cbw
    push AX
    mov AL,byte ptr [_var_194]
    cbw
    push AX
    call routine_105
    add SP,8h
    mov AX,word ptr [_var_190]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AL,byte ptr [SI + 4f04h]
    cbw
    mov word ptr [_var_209],AX
    mov AL,byte ptr [SI + 4f05h]
    cbw
    mov word ptr [_var_213],AX
    jmp LAB_1000_3b2b
LAB_1000_3aef:
    mov AX,word ptr [_var_190]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AL,byte ptr [SI + 4f04h]
    cbw
    mov word ptr [_var_208],AX
    mov AL,byte ptr [SI + 4f05h]
    cbw
    mov word ptr [_var_211],AX
    push word ptr [_var_213]
    push word ptr [_var_209]
    push AX
    push word ptr [_var_208]
    call routine_105
    add SP,8h
    mov AX,word ptr [_var_208]
    mov word ptr [_var_209],AX
    mov AX,word ptr [_var_211]
    mov word ptr [_var_213],AX
LAB_1000_3b2b:
    pop SI
    mov SP,BP
    pop BP
    ret
routine_65 endp

routine_132 proc near
    push BP
    mov BP,SP
    sub SP,1eh
    push SI
    mov word ptr [BP + -4h],0ffffh
LAB_1000_3b3c:
    inc word ptr [BP + -4h]
    mov BX,word ptr [BP + -4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],3fh
    jz LAB_1000_3bca
    mov AX,word ptr [BP + 6h]
    cmp word ptr [BP + -4h],AX
    ja LAB_1000_3bca
    sub AX,AX
    push AX
    call far ptr gfx_jump_21
    add SP,2h
    cmp word ptr [BP + -4h],0h
    jnz LAB_1000_3b8e
    sub AX,AX
    push AX
    push AX
    mov AL,byte ptr [_var_195]
    cbw
    push AX
    mov AL,byte ptr [_var_194]
    cbw
    push AX
    call routine_147
    add SP,8h
    mov AL,byte ptr [_var_194]
    cbw
    mov word ptr [BP + -6h],AX
    mov AL,byte ptr [_var_195]
    cbw
    mov word ptr [BP + -0ah],AX
    jmp LAB_1000_3bc7
LAB_1000_3b8e:
    mov AX,word ptr [BP + -4h]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AL,byte ptr [SI + 4f04h]
    cbw
    mov word ptr [BP + -2h],AX
    mov AL,byte ptr [SI + 4f05h]
    cbw
    mov word ptr [BP + -8h],AX
    push word ptr [BP + -0ah]
    push word ptr [BP + -6h]
    push AX
    push word ptr [BP + -2h]
    call routine_105
    add SP,8h
    mov AX,word ptr [BP + -2h]
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [BP + -8h]
    mov word ptr [BP + -0ah],AX
LAB_1000_3bc7:
    jmp LAB_1000_3b3c
LAB_1000_3bca:
    mov word ptr [BP + -4h],0ffffh
LAB_1000_3bcf:
    inc word ptr [BP + -4h]
    mov BX,word ptr [BP + -4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],3fh
    jz LAB_1000_3c0c
    mov AX,word ptr [BP + 6h]
    cmp word ptr [BP + -4h],AX
    ja LAB_1000_3c0c
    mov BX,word ptr [BP + -4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f06h]
    and AL,3fh
    cmp AL,9h
    jz LAB_1000_3c0a
    push word ptr [BP + -4h]
    call routine_135
    add SP,2h
LAB_1000_3c0a:
    jmp LAB_1000_3bcf
LAB_1000_3c0c:
    dec word ptr [BP + -4h]
    mov AX,word ptr [BP + -4h]
    jmp LAB_1000_3c14
LAB_1000_3c14:
    pop SI
    mov SP,BP
    pop BP
    ret
routine_132 endp

routine_106 proc near
    push BP
    mov BP,SP
    sub SP,8h
    mov AX,word ptr [_var_186]
    add AX,word ptr [_var_188]
    mov word ptr [BP + -4h],AX
    mov AL,byte ptr [BP + -4h]
    and AL,3h
    cmp AL,1h
    sbb CX,CX
    neg CX
    mov word ptr [_var_24],CX
    cmp word ptr [_var_185],1h
    jz LAB_1000_3c46
    cmp word ptr [_var_187],1h
    jnz LAB_1000_3c4c
LAB_1000_3c46:
    mov word ptr [_var_24],0h
LAB_1000_3c4c:
    cmp word ptr [_var_185],4h
    jz LAB_1000_3c5a
    cmp word ptr [_var_187],4h
    jnz LAB_1000_3c60
LAB_1000_3c5a:
    mov word ptr [_var_24],1h
LAB_1000_3c60:
    mov AX,word ptr [BP + -4h]
    db 25h, 0Fh, 00h  ; and AX,0Fh (force word-immediate)
    mov CH,AL
    sub CL,CL
    add word ptr [BP + param_1],CX
    mov AX,offset str_timeFormat
    push AX
    push word ptr [BP + 6h]
    call mystrcpy
    add SP,4h
    mov AX,word ptr [BP + param_1]
    sub DX,DX
    mov CX,708h
    div CX
    mov word ptr [BP + -2h],AX
    mov BX,word ptr [BP + 6h]
    mov AL,byte ptr [_var_24]
    inc AL
    add byte ptr [BX],AL
    mov AX,word ptr [BP + -2h]
    cwd
    mov CX,0ah
    idiv CX
    mov BX,word ptr [BP + 6h]
    add byte ptr [BX + 1h],DL
    mov AX,word ptr [BP + param_1]
    sub DX,DX
    mov CX,1eh
    div CX
    sub DX,DX
    mov CX,3ch
    div CX
    mov word ptr [BP + -6h],DX
    mov AX,DX
    cwd
    mov CX,0ah
    idiv CX
    mov BX,word ptr [BP + 6h]
    add byte ptr [BX + 3h],AL
    mov AX,word ptr [BP + -6h]
    cwd
    idiv CX
    mov BX,word ptr [BP + 6h]
    add byte ptr [BX + 4h],DL
    mov AX,word ptr [BP + param_1]
    shl AX,1h
    sub DX,DX
    mov CX,3ch
    div CX
    mov word ptr [BP + -8h],DX
    mov AX,DX
    cwd
    mov CX,0ah
    idiv CX
    mov BX,word ptr [BP + 6h]
    add byte ptr [BX + 6h],AL
    mov AX,word ptr [BP + -8h]
    cwd
    idiv CX
    mov BX,word ptr [BP + 6h]
    add byte ptr [BX + 7h],DL
    mov AX,word ptr [BP + 6h]
    jmp LAB_1000_3cfc
LAB_1000_3cfc:
    mov SP,BP
    pop BP
    ret
routine_106 endp

routine_137 proc near
    push BP
    mov BP,SP
    mov AL,byte ptr [BP + 4h]
    sub AH,AH
    mov CL,7h
    shl AX,CL
    sub DX,DX
    mov CX,92h
    div CX
    jmp LAB_1000_3d15
LAB_1000_3d15:
    mov SP,BP
    pop BP
    ret
routine_137 endp

routine_136 proc near
    push BP
    mov BP,SP
    mov AL,byte ptr [BP + 4h]
    sub AH,AH
    mov CL,7h
    shl AX,CL
    sub DX,DX
    mov CX,0c3h
    div CX
    jmp LAB_1000_3d2e
LAB_1000_3d2e:
    mov SP,BP
    pop BP
    ret
routine_136 endp

routine_147 proc near
    push BP
    mov BP,SP
    sub SP,4h
    push word ptr [BP + 4h]
    call routine_137
    add SP,2h
    mov word ptr [BP + -2h],AX
    push word ptr [BP + 6h]
    call routine_136
    add SP,2h
    mov word ptr [BP + -4h],AX
    cmp word ptr [BP + 8h],-1h
    jz LAB_1000_3d85
    mov AX,word ptr [_var_93]
    cmp word ptr [BP + -2h],AX
    jc LAB_1000_3d85
    mov AX,word ptr [_var_95]
    cmp word ptr [BP + -2h],AX
    jnc LAB_1000_3d85
    mov AX,word ptr [_var_94]
    cmp word ptr [BP + -4h],AX
    jc LAB_1000_3d85
    mov AX,word ptr [_var_96]
    cmp word ptr [BP + -4h],AX
    jnc LAB_1000_3d85
    push word ptr [BP + 8h]
    push word ptr [BP + -4h]
    push word ptr [BP + -2h]
    call routine_157
    add SP,6h
LAB_1000_3d85:
    mov SP,BP
    pop BP
    ret
routine_147 endp

routine_105 proc near
    push BP
    mov BP,SP
    mov AX,1h
    push AX
    push word ptr [_var_96]
    push word ptr [_var_94]
    push word ptr [_var_95]
    push word ptr [_var_93]
    push word ptr [BP + 0ah]
    call routine_136
    add SP,2h
    push AX
    push word ptr [BP + 8h]
    call routine_137
    add SP,2h
    push AX
    push word ptr [BP + 6h]
    call routine_136
    add SP,2h
    push AX
    push word ptr [BP + 4h]
    call routine_137
    add SP,2h
    push AX
    call routine_138
    add SP,12h
    mov SP,BP
    pop BP
    ret
routine_105 endp

routine_160 proc near
    push BP
    mov BP,SP
    mov AX,1h
    push AX
    push word ptr [_var_96]
    push word ptr [_var_94]
    push word ptr [_var_95]
    push word ptr [_var_93]
    push word ptr [BP + 0ah]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call routine_138
    add SP,12h
    mov SP,BP
    pop BP
    ret
routine_160 endp

routine_138 proc near
    push BP
    mov BP,SP
    sub SP,4h
    mov AX,word ptr [BP + 0eh]
    sub AX,word ptr [BP + 0ch]
    mov word ptr [BP + -4h],AX
    mov AX,word ptr [BP + 12h]
    sub AX,word ptr [BP + 10h]
    mov word ptr [BP + -2h],AX
    push word ptr [BP + 10h]
    push word ptr [BP + 0ch]
    call far ptr gfx_jump_3e
    add SP,4h
    push AX
    call far ptr gfx_jump_1a
    add SP,2h
    mov AX,word ptr [BP + -4h]
    dec AX
    mov word ptr [_var_46],AX
    mov AX,word ptr [BP + -2h]
    dec AX
    mov word ptr [_var_47],AX
    push AX
    call far ptr gfx_jump_40
    add SP,2h
    push word ptr [_var_46]
    call far ptr gfx_jump_41
    add SP,2h
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_31],AX
    mov AX,word ptr [BP + 6h]
    mov word ptr [_var_33],AX
    mov AX,word ptr [BP + 8h]
    mov word ptr [_var_32],AX
    mov AX,word ptr [BP + 0ah]
    mov word ptr [_var_34],AX
    call routine_154
    call far ptr gfx_jump_23
    mov word ptr [_var_46],13fh
    mov word ptr [_var_47],0c7h
    mov AX,0c7h
    push AX
    call far ptr gfx_jump_40
    add SP,2h
    push word ptr [_var_46]
    call far ptr gfx_jump_41
    add SP,2h
    sub AX,AX
    push AX
    call far ptr gfx_jump_1a
    add SP,2h
    mov SP,BP
    pop BP
    ret
routine_138 endp

routine_157 proc near
    push BP
    mov BP,SP
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call routine_160
    add SP,8h
    mov SP,BP
    pop BP
    ret
routine_157 endp

routine_63 proc near
    push BP
    mov BP,SP
    sub SP,10h
    push DI
    push SI
    sub AX,AX
    mov word ptr [BP + -8h],AX
    mov word ptr [_var_221],AX
    mov word ptr [_var_215],AX
    mov word ptr [_var_225],AX
    mov word ptr [_var_224],AX
    mov word ptr [_var_200],AX
    mov word ptr [_var_182],AX
    mov word ptr [_var_199],AX
    mov word ptr [_var_181],AX
    mov word ptr [BP + -10h],1h
    mov word ptr [BP + -0ah],AX
    mov word ptr [BP + -0ch],AX
    les BX,dword ptr [_var_222]
    mov AX,word ptr ES:[BX + 40h]
    mov word ptr [BP + -2h],AX
    db 3Dh, 0Fh, 00h  ; cmp AX,0Fh (force word-immediate)
    jle LAB_1000_3f02
    mov word ptr [BP + -2h],0fh
LAB_1000_3f02:
    mov word ptr [BP + -6h],0h
    jmp LAB_1000_3f0c
LAB_1000_3f09:
    inc word ptr [BP + -6h]
LAB_1000_3f0c:
    mov AX,word ptr [BP + 4h]
    cmp word ptr [BP + -6h],AX
    jbe LAB_1000_3f17
    jmp LAB_1000_40d1
LAB_1000_3f17:
    mov AX,word ptr [BP + -6h]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    cmp byte ptr [SI + 4f06h],0h
    jnz LAB_1000_3f2e
    jmp LAB_1000_40d1
LAB_1000_3f2e:
    mov AL,byte ptr [SI + 4f07h]
    cbw
    mov word ptr [BP + -0eh],AX
    mov AL,byte ptr [SI + 4f06h]
    db 25h, 3Fh, 00h  ; and AX,3Fh (force word-immediate)
    jmp LAB_1000_409f
LAB_1000_3f40:
    cmp word ptr [BP + -6h],0h
    jz LAB_1000_3f4b
    mov word ptr [BP + -8h],1h
LAB_1000_3f4b:
    jmp LAB_1000_40ce
LAB_1000_3f4e:
    mov BX,word ptr [BP + -6h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],80h
    jz LAB_1000_3f6c
    mov word ptr [_var_215],1h
    inc word ptr [_var_224]
    jmp LAB_1000_3fb6
LAB_1000_3f6c:
    mov BX,word ptr [BP + -6h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],40h
    jz LAB_1000_3f8a
    mov word ptr [_var_221],1h
    inc word ptr [_var_224]
    jmp LAB_1000_3fb6
LAB_1000_3f8a:
    mov BX,word ptr [BP + -0eh]
    and BX,7fh
    test byte ptr [BX + 5578h],40h
    jz LAB_1000_3f9d
    inc word ptr [_var_225]
    jmp LAB_1000_3fb6
LAB_1000_3f9d:
    mov BX,word ptr [BP + -0eh]
    mov CL,4h
    shl BX,CL
    test word ptr [BX + 4256h],500h
    jnz LAB_1000_3fb2
    inc word ptr [_var_224]
    jmp LAB_1000_3fb6
LAB_1000_3fb2:
    inc word ptr [_var_225]
LAB_1000_3fb6:
    jmp LAB_1000_40ce
LAB_1000_3fb9:
    mov BX,word ptr [BP + -6h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],80h
    jz LAB_1000_3fd7
    mov word ptr [_var_215],1h
    inc word ptr [_var_181]
    jmp LAB_1000_4010
LAB_1000_3fd7:
    mov BX,word ptr [BP + -6h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],40h
    jz LAB_1000_3ff5
    mov word ptr [_var_221],1h
    inc word ptr [_var_181]
    jmp LAB_1000_4010
LAB_1000_3ff5:
    mov BX,word ptr [BP + -0eh]
    and BX,7fh
    mov CL,5h
    shl BX,CL
    cmp word ptr [BX + 1b0h],-1h
    jnz LAB_1000_400c
    inc word ptr [_var_182]
    jmp LAB_1000_4010
LAB_1000_400c:
    inc word ptr [_var_181]
LAB_1000_4010:
    jmp LAB_1000_40ce
LAB_1000_4013:
    mov BX,word ptr [BP + -6h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],80h
    jz LAB_1000_4031
    mov word ptr [_var_215],1h
    inc word ptr [_var_199]
    jmp LAB_1000_4096
LAB_1000_4031:
    mov BX,word ptr [BP + -6h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],40h
    jz LAB_1000_404f
    mov word ptr [_var_221],1h
    inc word ptr [_var_199]
    jmp LAB_1000_4096
LAB_1000_404f:
    mov BX,word ptr [BP + -0eh]
    and BX,7fh
    test byte ptr [BX + 5578h],40h
    jz LAB_1000_4062
    inc word ptr [_var_200]
    jmp LAB_1000_4096
LAB_1000_4062:
    mov AX,word ptr [BP + -6h]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov DI,word ptr [SI + 4f05h]
    and DI,0ffh
    mov CL,4h
    shr DI,CL
    shl DI,CL
    mov BL,byte ptr [SI + 4f04h]
    sub BH,BH
    shr BX,CL
    test byte ptr [BX + DI + 4700h],3h
    jnz LAB_1000_4092
    inc word ptr [_var_199]
    jmp LAB_1000_4096
LAB_1000_4092:
    inc word ptr [_var_200]
LAB_1000_4096:
    jmp LAB_1000_40ce
LAB_1000_4098:
    inc word ptr [BP + -10h]
    jmp LAB_1000_40ce
    db 0EBh
    db 2Fh
LAB_1000_409f:
    db 3Dh, 01h, 00h  ; cmp AX,1h (force word-immediate)
    jnz LAB_1000_40a7
    jmp LAB_1000_3f4e
LAB_1000_40a7:
    db 3Dh, 02h, 00h  ; cmp AX,2h (force word-immediate)
    jnz LAB_1000_40af
    jmp LAB_1000_4013
LAB_1000_40af:
    db 3Dh, 03h, 00h  ; cmp AX,3h (force word-immediate)
    jnz LAB_1000_40b7
    jmp LAB_1000_3fb9
LAB_1000_40b7:
    db 3Dh, 08h, 00h  ; cmp AX,8h (force word-immediate)
    jnz LAB_1000_40bf
    jmp LAB_1000_3f40
LAB_1000_40bf:
    db 3Dh, 0Ah, 00h  ; cmp AX,0Ah (force word-immediate)
    jz LAB_1000_4098
    db 3Dh, 0Ch, 00h  ; cmp AX,0Ch (force word-immediate)
    jnz LAB_1000_40cc
    jmp LAB_1000_3f4e
LAB_1000_40cc:
    jmp LAB_1000_40ce
LAB_1000_40ce:
    jmp LAB_1000_3f09
LAB_1000_40d1:
    mov CX,19h
    mov AX,word ptr [_var_224]
    mov DX,word ptr [_var_225]
    shl DX,1h
    sub AX,DX
    imul word ptr [BP + -2h]
    imul CX
    cwd
    mov CX,32h
    les BX,dword ptr [_var_178]
    mov BX,word ptr ES:[BX + 3eh]
    inc BX
    mov SI,AX
    mov AX,word ptr [_var_181]
    mov DI,word ptr [_var_182]
    shl DI,1h
    sub AX,DI
    mov DI,DX
    imul BX
    imul CX
    cwd
    add AX,SI
    adc DX,DI
    mov CX,14h
    mov BX,AX
    mov AX,word ptr [_var_199]
    mov SI,word ptr [_var_200]
    shl SI,1h
    sub AX,SI
    mov SI,DX
    imul word ptr [BP + -2h]
    imul CX
    cwd
    add BX,AX
    adc SI,DX
    mov CX,0c8h
    mov AX,word ptr [BP + -2h]
    imul word ptr [_var_215]
    imul CX
    cwd
    add BX,AX
    adc SI,DX
    mov CX,64h
    mov AX,word ptr [BP + -2h]
    imul word ptr [_var_221]
    imul CX
    cwd
    add BX,AX
    adc SI,DX
    mov word ptr [BP + -0ch],BX
    mov word ptr [BP + -0ah],SI
    mov AX,word ptr [BP + -10h]
    inc AX
    cwd
    push DX
    push AX
    mov AX,BX
    mov DX,SI
    shl AX,1h
    rcl DX,1h
    push DX
    push AX
    call routine_100
    mov word ptr [BP + -0ch],AX
    mov word ptr [BP + -0ah],DX
    cmp word ptr [BP + -8h],0h
    jz LAB_1000_41c5
    or DX,DX
    jge LAB_1000_4179
    sub AX,AX
    mov word ptr [BP + -0ah],AX
    mov word ptr [BP + -0ch],AX
LAB_1000_4179:
    les BX,dword ptr [_var_222]
    mov AX,word ptr ES:[BX + 26h]
    jmp LAB_1000_41b9
LAB_1000_4183:
    mov AX,2h
    cwd
    push DX
    push AX
    lea AX,[BP + -0ch]
    push AX
    call routine_101
    jmp LAB_1000_41c5
LAB_1000_4192:
    mov AX,4h
    cwd
    push DX
    push AX
    mov AX,word ptr [BP + -0ch]
    mov DX,word ptr [BP + -0ah]
    mov CX,AX
    mov BX,DX
    shl AX,1h
    rcl DX,1h
    add AX,CX
    adc DX,BX
    push DX
    push AX
    call routine_100
    mov word ptr [BP + -0ch],AX
    mov word ptr [BP + -0ah],DX
    jmp LAB_1000_41c5
    db 0EBh
    db 0Ch
LAB_1000_41b9:
    db 3Dh, 01h, 00h  ; cmp AX,1h (force word-immediate)
    jz LAB_1000_4183
    db 3Dh, 02h, 00h  ; cmp AX,2h (force word-immediate)
    jz LAB_1000_4192
    jmp LAB_1000_41c5
LAB_1000_41c5:
    mov AX,word ptr [BP + -0ch]
    mov DX,word ptr [BP + -0ah]
    jmp LAB_1000_41cd
LAB_1000_41cd:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
routine_63 endp

routine_131 proc near
    push BP
    mov BP,SP
    sub SP,4h
    push SI
    cmp byte ptr [_var_214],1h
    jnz LAB_1000_420c
    mov AX,28h
    push AX
    mov AX,30h
    push AX
    push word ptr [_var_228]
    push word ptr [_var_227]
    sub AX,AX
    push AX
    mov AX,96h
    push AX
    sub AX,AX
    push AX
    mov AX,1h
    push AX
    call far ptr gfx_jump_2a
    add SP,10h
    mov byte ptr [_var_214],0h
LAB_1000_420c:
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f06h]
    db 25h, 3Fh, 00h  ; and AX,3Fh (force word-immediate)
    mov word ptr [BP + -4h],AX
    jmp LAB_1000_42d2
caseD_1_42dd:
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov BL,byte ptr [BX + 4f07h]
    and BX,7fh
    mov CL,4h
    shl BX,CL
    test byte ptr [BX + 4256h],8h
    jz LAB_1000_424a
    mov word ptr [BP + -4h],0fh
    jmp LAB_1000_424f
LAB_1000_424a:
    mov word ptr [BP + -4h],0h
LAB_1000_424f:
    jmp caseD_4_42dd
caseD_c_42dd:
    mov word ptr [BP + -4h],2h
    jmp caseD_4_42dd
caseD_3_42dd:
    mov word ptr [BP + -4h],1h
    jmp caseD_4_42dd
caseD_2_42dd:
    mov word ptr [BP + -4h],2h
    jmp caseD_4_42dd
caseD_5_42dd:
    mov word ptr [BP + -4h],3h
    jmp caseD_4_42dd
caseD_8_42dd:
    cmp word ptr [_var_190],0h
    jnz LAB_1000_4280
    mov word ptr [BP + -4h],8h
    jmp LAB_1000_42c7
LAB_1000_4280:
    les BX,dword ptr [_var_222]
    cmp word ptr ES:[BX + 26h],3h
    jnz LAB_1000_4297
    mov byte ptr [_var_207],1h
    mov word ptr [BP + -4h],7h
    jmp LAB_1000_42c7
LAB_1000_4297:
    cmp word ptr ES:[BX + 26h],1h
    jnz LAB_1000_42aa
    mov byte ptr [_var_207],1h
    mov word ptr [BP + -4h],0eh
    jmp LAB_1000_42c7
LAB_1000_42aa:
    cmp word ptr [_var_201],0h
    jnz LAB_1000_42bd
    mov byte ptr [_var_207],1h
    mov word ptr [BP + -4h],0bh
    jmp LAB_1000_42c7
LAB_1000_42bd:
    mov byte ptr [_var_207],1h
    mov word ptr [BP + -4h],0dh
LAB_1000_42c7:
    jmp caseD_4_42dd
caseD_a_42dd:
    mov word ptr [BP + -4h],0ah
    jmp caseD_4_42dd
    db 0EBh
    db 28h
LAB_1000_42d2:
    db 2Dh, 01h, 00h  ; sub AX,1h (force word-immediate)
    db 3Dh, 0Bh, 00h  ; cmp AX,0Bh (force word-immediate)
    ja caseD_4_42dd
    add AX,AX
    xchg AX,BX
switchD_4225:
    jmp word ptr CS:[BX + 42e2h]
var_7:
    dw 4225h
    dw 4262h
    dw 425Ah
    dw 42FAh
    dw 426Ah
    dw 42FAh
    dw 42FAh
    dw 4272h
    dw 42FAh
    dw 42C9h
    dw 42FAh
    dw 4252h
caseD_6_424f:
caseD_7_426f:
caseD_9_42dd:
caseD_b_8044:
caseD_4_42dd:
caseD_4_8045:
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    db 3Dh, 73h, 00h  ; cmp AX,73h (force word-immediate)
    jnc LAB_1000_4383
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    db 3Dh, 59h, 00h  ; cmp AX,59h (force word-immediate)
    jnc LAB_1000_4383
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    db 05h, 0Ah, 00h  ; add AX,0Ah (force word-immediate)
    mov word ptr [_var_227],AX
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    db 05h, 0Ah, 00h  ; add AX,0Ah (force word-immediate)
    mov word ptr [_var_228],AX
    jmp LAB_1000_44d8
LAB_1000_4383:
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    db 3Dh, 73h, 00h  ; cmp AX,73h (force word-immediate)
    jc LAB_1000_440c
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    db 3Dh, 59h, 00h  ; cmp AX,59h (force word-immediate)
    jnc LAB_1000_440c
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    db 2Dh, 3Ah, 00h  ; sub AX,3Ah (force word-immediate)
    mov word ptr [_var_227],AX
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    db 05h, 0Ah, 00h  ; add AX,0Ah (force word-immediate)
    mov word ptr [_var_228],AX
    jmp LAB_1000_44d8
LAB_1000_440c:
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    db 3Dh, 73h, 00h  ; cmp AX,73h (force word-immediate)
    jc LAB_1000_4494
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    db 3Dh, 59h, 00h  ; cmp AX,59h (force word-immediate)
    jc LAB_1000_4494
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    db 2Dh, 3Ah, 00h  ; sub AX,3Ah (force word-immediate)
    mov word ptr [_var_227],AX
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    db 2Dh, 28h, 00h  ; sub AX,28h (force word-immediate)
    mov word ptr [_var_228],AX
    jmp LAB_1000_44d8
LAB_1000_4494:
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [_var_93]
    db 05h, 0Ah, 00h  ; add AX,0Ah (force word-immediate)
    mov word ptr [_var_227],AX
    mov BX,word ptr [_var_190]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [_var_94]
    db 2Dh, 28h, 00h  ; sub AX,28h (force word-immediate)
    mov word ptr [_var_228],AX
LAB_1000_44d8:
    mov AX,28h
    push AX
    mov AX,30h
    push AX
    mov AX,96h
    push AX
    sub AX,AX
    push AX
    mov AX,1h
    push AX
    push word ptr [_var_228]
    push word ptr [_var_227]
    sub AX,AX
    push AX
    call far ptr gfx_jump_2a
    add SP,10h
    mov SI,word ptr [BP + -4h]
    shl SI,1h
    mov AX,28h
    push AX
    mov AX,30h
    push AX
    push word ptr [_var_228]
    push word ptr [_var_227]
    sub AX,AX
    push AX
    push word ptr [SI + 1eeah]
    push word ptr [SI + 1f0eh]
    mov AX,1h
    push AX
    call far ptr gfx_jump_2a
    add SP,10h
    mov byte ptr [_var_214],1h
    pop SI
    mov SP,BP
    pop BP
    ret
routine_131 endp

routine_25 proc near
    push BP
    mov BP,SP
    sub SP,14h
    mov byte ptr [BP + -2h],0dh
    mov byte ptr [BP + -1h],0h
    mov byte ptr [BP + -0ch],9h
    mov byte ptr [BP + -0bh],0ah
    mov byte ptr [BP + -0ah],0h
    mov byte ptr [BP + -14h],8eh
    mov byte ptr [BP + -13h],0h
    mov byte ptr [BP + -10h],8fh
    mov byte ptr [BP + -0fh],0h
    jmp LAB_1000_45c4
LAB_1000_4560:
    mov AX,0c7h
    push AX
    mov AX,13fh
    push AX
    sub AX,AX
    push AX
    push AX
    push word ptr [_var_99]
    call clearRect
    add SP,0ah
    mov AX,13fh
    push AX
    mov AX,5ah
    push AX
    sub AX,AX
    push AX
    mov AX,offset str_insertScenario
    push AX
    push word ptr [_var_99]
    call drawString
    add SP,0ah
    mov BX,word ptr [_var_99]
    mov word ptr [BX + 0ch],4h
    mov AX,13fh
    push AX
    mov AX,64h
    push AX
    sub AX,AX
    push AX
    mov AX,offset str_pressKey1
    push AX
    push word ptr [_var_99]
    call drawString
    add SP,0ah
    mov BX,word ptr [_var_99]
    mov word ptr [BX + 0ch],1h
    call far ptr gfx_jump_46_retrace2
    call far ptr misc_jump_5b_getkey
LAB_1000_45c4:
    mov AX,offset str_modeRb1
    push AX
    les BX,dword ptr [_var_178]
    mov BX,word ptr ES:[BX + 38h]
    shl BX,1h
    push word ptr [BX + 2256h]
    call routine_46
    add SP,4h
    mov word ptr [_var_177],AX
    or AX,AX
    jnz LAB_1000_45e6
    jmp LAB_1000_4560
LAB_1000_45e6:
    call far ptr gfx_jump_45_retrace
    push word ptr [_var_177]
    call routine_51
    add SP,2h
    mov AX,9h
    push AX
    call far ptr gfx_jump_3d_null
    add SP,2h
    call far ptr gfx_jump_17_bufSize
    push AX
    call allocBuffer
    add SP,2h
    mov word ptr [_var_229],AX
    push AX
    les BX,dword ptr [_var_178]
    mov BX,word ptr ES:[BX + 38h]
    shl BX,1h
    push word ptr [BX + 2256h]
    call loadPic
    add SP,4h
    mov AX,word ptr [_var_229]
    mov word ptr [BP + -4h],AX
    jmp LAB_1000_4692
    db 90h
LAB_1000_462e:
    mov AX,0c7h
    push AX
    mov AX,13fh
    push AX
    sub AX,AX
    push AX
    push AX
    push word ptr [_var_99]
    call clearRect
    add SP,0ah
    mov AX,13fh
    push AX
    mov AX,5ah
    push AX
    sub AX,AX
    push AX
    mov AX,offset str_insertDiskA
    push AX
    push word ptr [_var_99]
    call drawString
    add SP,0ah
    mov BX,word ptr [_var_99]
    mov word ptr [BX + 0ch],4h
    mov AX,13fh
    push AX
    mov AX,64h
    push AX
    sub AX,AX
    push AX
    mov AX,offset str_pressKey2
    push AX
    push word ptr [_var_99]
    call drawString
    add SP,0ah
    mov BX,word ptr [_var_99]
    mov word ptr [BX + 0ch],1h
    call far ptr gfx_jump_46_retrace2
    call far ptr misc_jump_5b_getkey
LAB_1000_4692:
    mov AX,offset str_modeRb2
    push AX
    mov AX,offset str_dbicons1
    push AX
    call routine_46
    add SP,4h
    mov word ptr [_var_177],AX
    or AX,AX
    jz LAB_1000_462e
    call far ptr gfx_jump_45_retrace
    push word ptr [_var_177]
    call routine_51
    add SP,2h
    mov AX,8h
    push AX
    call far ptr gfx_jump_3d_null
    add SP,2h
    mov AX,1h
    push AX
    mov AX,offset str_dbicons2
    push AX
    call openShowPic
    add SP,4h
    mov AX,word ptr [BP + -4h]
    mov word ptr [_var_101],AX
    mov word ptr [_var_103],AX
    mov word ptr [_var_105],AX
    mov word ptr [_var_106],AX
    mov word ptr [_var_107],AX
    mov word ptr [_var_108],AX
    mov word ptr [_var_109],AX
    mov word ptr [_var_110],AX
    mov word ptr [_var_111],AX
    mov word ptr [_var_112],AX
    mov word ptr [_var_113],AX
    mov word ptr [_var_114],AX
    call far ptr gfx_jump_45_retrace
    mov AX,0c7h
    push AX
    mov AX,13fh
    push AX
    sub AX,AX
    push AX
    push AX
    push word ptr [_var_99]
    call clearRect
    add SP,0ah
    push word ptr [_var_102]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    push word ptr [_var_104]
    call far ptr gfx_jump_11_blitSprite
    add SP,2h
    mov BX,word ptr [_var_99]
    mov word ptr [BX + 4h],0h
    mov AX,1h
    push AX
    mov AX,6ah
    push AX
    mov AX,offset str_missionDebrief
    push AX
    push word ptr [_var_99]
    call actualDrawString
    add SP,8h
    mov BX,word ptr [_var_99]
    mov word ptr [BX + 4h],6h
    mov word ptr [BP + -0eh],96h
    mov word ptr [BP + -8h],0h
LAB_1000_475c:
    push word ptr [BP + -0eh]
    mov AX,0ech
    push AX
    mov BX,word ptr [BP + -8h]
    shl BX,1h
    push word ptr [BX + 2266h]
    push word ptr [_var_99]
    call actualDrawString
    add SP,8h
    add word ptr [BP + -0eh],0ah
    inc word ptr [BP + -8h]
    cmp word ptr [BP + -8h],2h
    jl LAB_1000_475c
    mov word ptr [BP + -12h],0h
    mov byte ptr [_var_207],1h
    mov word ptr [_var_190],0h
IFDEF DEBUG
    mov AX,offset _trace_before_gfx50
    push AX
    call _my_trace
    add SP,2
ENDIF
    call far ptr gfx_jump_50
    call far ptr gfx_jump_46_retrace2
    call setTimerIrqHandler
    mov word ptr [BP + -6h],1h
LAB_1000_47a5:
    mov AX,32h
    imul word ptr [BP + -12h]
    mov BX,AX
    mov word ptr [BX + 2212h],2h
    push word ptr [_var_100]
    mov AX,word ptr [BP + -12h]
    mov CX,AX
    shl AX,1h
    shl AX,1h
    add AX,CX
    shl AX,1h
    add AX,97h
    push AX
    mov AX,0fah
    push AX
    mov AX,2h
    push AX
    push word ptr [_var_205]
    mov AX,offset dat_21e4
    push AX
    call routine_59
    add SP,0ch
    push word ptr [_var_100]
    push word ptr [_var_116]
    mov AX,2h
    push AX
    push word ptr [_var_205]
    mov AX,offset dat_21e4
    push AX
    call routine_60
    add SP,0ah
    mov word ptr [BP + -12h],AX
    or AX,AX
    jz LAB_1000_4806
    db 3Dh, 01h, 00h  ; cmp AX,1h (force word-immediate)
    jz LAB_1000_4838
    jmp LAB_1000_481c
LAB_1000_4806:
    push word ptr [_var_100]
    call routine_65
    add SP,2h
    cmp byte ptr [_var_180],1h
    jnz LAB_1000_481c
    mov word ptr [BP + -12h],1h
LAB_1000_481c:
    les BX,dword ptr [_var_222]
    cmp word ptr ES:[BX + 72h],1h
    jnz LAB_1000_485b
LAB_1000_4827:
    sub AX,AX
    push AX
    call far ptr misc_jump_5d_readJoy
    add SP,2h
    or AX,AX
    jz LAB_1000_4840
    jmp LAB_1000_4827
LAB_1000_4838:
    mov word ptr [BP + -6h],0h
    jmp LAB_1000_481c
    db 90h
LAB_1000_4840:
    mov byte ptr [_var_81],0h
LAB_1000_4845:
    cmp byte ptr [_var_81],5h
    jbe LAB_1000_4845
LAB_1000_484c:
    sub AX,AX
    push AX
    call far ptr misc_jump_5d_readJoy
    add SP,2h
    or AX,AX
    jnz LAB_1000_484c
LAB_1000_485b:
    cmp word ptr [BP + -6h],0h
    jz LAB_1000_4864
    jmp LAB_1000_47a5
LAB_1000_4864:
    call restoreTimerIrqHandler
    call far ptr gfx_jump_45_retrace
    push word ptr [_var_192]
    call routine_63
    add SP,2h
    mov word ptr [_var_219],AX
    mov word ptr [_var_220],DX
    les BX,dword ptr [_var_178]
    mov word ptr ES:[BX + 44h],0h
    les BX,dword ptr [_var_222]
    cmp word ptr ES:[BX + 30h],0h
    jnz LAB_1000_490f
    les BX,dword ptr [_var_178]
    mov AX,word ptr [_var_219]
    mov word ptr ES:[BX + 44h],AX
    les BX,dword ptr [_var_178]
    mov AX,word ptr ES:[BX + 2eh]
    sub DX,DX
    cmp DX,word ptr [_var_220]
    ja LAB_1000_48bc
    jc LAB_1000_48b5
    cmp AX,word ptr [_var_219]
    jnc LAB_1000_48bc
LAB_1000_48b5:
    mov AX,word ptr [_var_219]
    mov word ptr ES:[BX + 2eh],AX
LAB_1000_48bc:
    les BX,dword ptr [_var_178]
    mov AX,word ptr [_var_219]
    mov DX,word ptr [_var_220]
    add word ptr ES:[BX + 32h],AX
    adc word ptr ES:[BX + 34h],DX
    les BX,dword ptr [_var_222]
    cmp word ptr ES:[BX + 26h],1h
    jnz LAB_1000_48e4
    les BX,dword ptr [_var_178]
    mov word ptr ES:[BX + 4eh],2h
LAB_1000_48e4:
    les BX,dword ptr [_var_222]
    cmp word ptr ES:[BX + 26h],2h
    jnz LAB_1000_490f
    cmp word ptr ES:[BX + 28h],0h
    jnz LAB_1000_490f
    les BX,dword ptr [_var_178]
    inc word ptr ES:[BX + 30h]
    cmp word ptr ES:[BX + 30h],3h
    jc LAB_1000_490f
    les BX,dword ptr [_var_178]
    mov word ptr ES:[BX + 4eh],1h
LAB_1000_490f:
    push word ptr [_var_229]
    call routine_64
    mov SP,BP
    pop BP
    ret
    db 90h
    db 90h
routine_25 endp

start proc near
    mov AH,30h
    int 21h
    cmp AL,2h
    jnc LAB_1000_4926
    int 20h
LAB_1000_4926:
    mov DI,seg @data
    mov SI,word ptr [2h]
    sub SI,DI
    cmp SI,1000h
    jc LAB_1000_4938
    mov SI,1000h
LAB_1000_4938:
    cli
    mov SS,DI
    add SP,offset __stack_top
    sti
    jnc LAB_1000_4952
    push SS
    pop DS
    call routine_2
    xor AX,AX
    push AX
    call routine_3
    mov AX,4cffh
    int 21h
LAB_1000_4952:
    and SP,0fffeh
    mov word ptr SS:word ptr [_var_122],SP
    mov word ptr SS:word ptr [_var_120],SP
    mov AX,SI
    mov CL,4h
    shl AX,CL
    dec AX
    mov SS:word ptr [_var_119],AX
    add SI,DI
    mov word ptr [2h],SI
    mov BX,ES
    sub BX,SI
    neg BX
    mov AH,4ah
    int 21h
    mov word ptr SS:[_var_127],DS
    push SS
    pop ES
    cld
    mov DI,offset _var_151
    mov CX,offset __bss_end
    sub CX,DI
    xor AX,AX
    rep stosb
    push SS
    pop DS
    call routine_4
    push SS
    pop DS
    call routine_5
    call routine_6
    xor BP,BP
    push word ptr [_var_134]
    push word ptr [_var_133]
    push word ptr [_var_132]
    call main
    push AX
    call routine_8
    mov AX,seg @data
    mov DS,AX
    mov AX,3h
LAB_1000_49bf:
    push AX
    call routine_2
    call routine_3
    mov AX,0ffh
    push AX
    call word ptr [_var_121]
start endp

routine_4 proc near
    mov AH,30h
    int 21h
    mov word ptr [_var_128],AX
    mov AX,3500h
    int 21h
    mov word ptr [_var_123],BX
    mov word ptr [_var_124],ES
    push CS
    pop DS
    mov AX,2500h
    mov DX,49b0h
    int 21h
    push SS
    pop DS
    mov CX,word ptr [_var_148]
    jcxz LAB_1000_4a22
    mov ES,word ptr [_var_127]
    mov SI,word ptr ES:[2ch]
    lds AX,dword ptr [_var_149]
    mov DX,DS
    xor BX,BX
    call far ptr [_var_147]
    jnc LAB_1000_4a11
    push SS
    pop DS
    jmp FUN_1000_4ea4
LAB_1000_4a11:
    lds AX,SS:dword ptr [_var_150]
    mov DX,DS
    mov BX,3h
    call far ptr [_var_147]
    push SS
    pop DS
LAB_1000_4a22:
    mov ES,word ptr [_var_127]
    mov CX,word ptr ES:[2ch]
    jcxz LAB_1000_4a63
    mov ES,CX
    xor DI,DI
LAB_1000_4a31:
    cmp byte ptr ES:[DI],0h
    jz LAB_1000_4a63
    mov CX,0ch
    mov SI,22c2h
    repe cmpsb
    jz LAB_1000_4a4c
    mov CX,7fffh
    xor AX,AX
    repne scasb
    jnz LAB_1000_4a63
    jmp LAB_1000_4a31
LAB_1000_4a4c:
    push ES
    push DS
    pop ES
    pop DS
    mov SI,DI
    mov DI,offset _var_131
    lodsb
    cbw
    xchg AX,CX
LAB_1000_4a58:
    lodsb
    inc AL
    jz LAB_1000_4a5e
    dec AX
LAB_1000_4a5e:
    stosb
    loop LAB_1000_4a58
    push SS
    pop DS
LAB_1000_4a63:
    mov BX,4h
LAB_1000_4a66:
    and byte ptr [BX + 22eah],0bfh
    mov AX,4400h
    int 21h
    jc LAB_1000_4a7c
    test DL,80h
    jz LAB_1000_4a7c
    or byte ptr [BX + 22eah],40h
LAB_1000_4a7c:
    dec BX
    jns LAB_1000_4a66
    mov SI,2474h
    mov DI,2474h
    call routine_12
    mov SI,2474h
    mov DI,2474h
    call routine_13
    ret
routine_4 endp

PUBLIC _routine_8
_routine_8:
routine_8 proc near
    push BP
    mov BP,SP
    mov SI,3fc6h
    mov DI,3fc6h
    call routine_13
    mov SI,2474h
    mov DI,offset str_nmsg
    call routine_13
    jmp LAB_1000_4aac
routine_8 endp

routine_9 proc near
    push BP
    mov BP,SP
LAB_1000_4aac:
    mov SI,offset str_nmsg
    mov DI,offset str_nmsg
    call routine_13
    mov SI,offset str_nmsg
    mov DI,offset str_nmsg
    call routine_12
    call routine_29
    or AX,AX
    jz LAB_1000_4ad0
    cmp word ptr [BP + 4h],0h
    jnz LAB_1000_4ad0
    mov word ptr [BP + 4h],0ffh
LAB_1000_4ad0:
    mov CX,0fh
    mov BX,5h
LAB_1000_4ad6:
    test byte ptr [BX + 22eah],1h
    jz LAB_1000_4ae1
    mov AH,3eh
    int 21h
LAB_1000_4ae1:
    inc BX
    loop LAB_1000_4ad6
    call routine_30
    mov AX,word ptr [BP + 4h]
    mov AH,4ch
    int 21h
routine_9 endp

routine_30 proc near
    mov CX,word ptr [_var_148]
    jcxz LAB_1000_4afb
    mov BX,2h
    call far ptr [_var_147]
LAB_1000_4afb:
    push DS
    lds DX,dword ptr [_var_123]
    mov AX,2500h
    int 21h
    pop DS
    cmp byte ptr [_var_135],0h
    jz LAB_1000_4b1a
    push DS
    mov AL,byte ptr [_var_136]
    lds DX,dword ptr [_var_137]
    mov AH,25h
    int 21h
    pop DS
LAB_1000_4b1a:
    ret
routine_30 endp

routine_13 proc near
    cmp SI,DI
    jnc LAB_1000_4b29
    dec DI
    dec DI
    mov CX,word ptr [DI]
    jcxz routine_13
    call CX
    jmp routine_13
LAB_1000_4b29:
    ret
routine_13 endp

routine_12 proc near
    cmp SI,DI
    jnc LAB_1000_4b3c
    sub DI,4h
    mov AX,word ptr [DI]
    or AX,word ptr [DI + 2h]
    jz routine_12
    call far ptr [DI]
    jmp routine_12
LAB_1000_4b3c:
    ret
    db 00h
routine_12 endp

routine_51 proc near
    push BP
    mov BP,SP
    sub SP,10h
    push DI
    push SI
    mov SI,word ptr [BP + 4h]
    mov DI,0ffffh
    test byte ptr [SI + 6h],83h
    jnz LAB_1000_4b55
    jmp LAB_1000_4bec
LAB_1000_4b55:
    test byte ptr [SI + 6h],40h
    jz LAB_1000_4b5e
    jmp LAB_1000_4bec
LAB_1000_4b5e:
    push SI
    call routine_84
    add SP,2h
    mov DI,AX
    mov BX,SI
    sub BX,2330h
    mov CL,3h
    sar BX,CL
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AX,word ptr [BX + 23d4h]
    mov word ptr [BP + -4h],AX
    push SI
    call routine_85
    add SP,2h
    mov AL,byte ptr [SI + 7h]
    cbw
    push AX
    call routine_86
    add SP,2h
    or AX,AX
    jl LAB_1000_4be9
    cmp word ptr [BP + -4h],0h
    jz LAB_1000_4bec
    mov AX,2312h
    push AX
    lea AX,[BP + -0eh]
    push AX
    call mystrcpy
    add SP,4h
    lea AX,[BP + -0ch]
    mov word ptr [BP + -2h],AX
    mov BX,AX
    cmp byte ptr [BX + -2h],5ch
    jz LAB_1000_4bc8
    mov AX,2314h
    push AX
    lea AX,[BP + -0eh]
    push AX
    call mystrcat
    add SP,4h
    jmp LAB_1000_4bcb
LAB_1000_4bc8:
    dec word ptr [BP + -2h]
LAB_1000_4bcb:
    mov AX,0ah
    push AX
    push word ptr [BP + -2h]
    push word ptr [BP + -4h]
    call routine_87
    add SP,6h
    lea AX,[BP + -0eh]
    push AX
    call routine_88
    add SP,2h
    or AX,AX
    jz LAB_1000_4bec
LAB_1000_4be9:
    mov DI,0ffffh
LAB_1000_4bec:
    mov byte ptr [SI + 6h],0h
    mov AX,DI
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
routine_51 endp

routine_46 proc near
    push BP
    mov BP,SP
    sub SP,2h
    push SI
    call routine_73
    mov SI,AX
    or SI,SI
    jz LAB_1000_4c18
    push SI
    push word ptr [BP + param_2+2h]
    push word ptr [BP + 4h]
    call routine_74
    add SP,6h
    jmp LAB_1000_4c1a
    db 90h
LAB_1000_4c18:
    sub AX,AX
LAB_1000_4c1a:
    pop SI
    mov SP,BP
    pop BP
    ret
    db 90h
routine_46 endp

FUN_1000_4c20 proc near
    push BP
    mov BP,SP
    sub SP,4h
    mov BX,word ptr [BP + 4h]
    cmp BX,word ptr [_var_130]
    jc LAB_1000_4c34
    mov AX,900h
    jmp LAB_1000_4c5e
LAB_1000_4c34:
    test word ptr [BP + 8h],8000h
    jz LAB_1000_4c83
    cmp word ptr [BP + 0ah],0h
    jz LAB_1000_4c5b
    xor CX,CX
    mov DX,CX
    mov AX,4201h
    int 21h
    jc LAB_1000_4c97
    test word ptr [BP + 0ah],2h
    jnz LAB_1000_4c61
    add AX,word ptr [BP + 6h]
    adc DX,word ptr [BP + 8h]
    jns LAB_1000_4c83
LAB_1000_4c5b:
    mov AX,1600h
LAB_1000_4c5e:
    stc
    jmp LAB_1000_4c97
LAB_1000_4c61:
    mov word ptr [BP + -2h],DX
    mov word ptr [BP + -4h],AX
    mov DX,CX
    mov AX,4202h
    int 21h
    add AX,word ptr [BP + 6h]
    adc DX,word ptr [BP + 8h]
    jns LAB_1000_4c83
    mov CX,word ptr [BP + -2h]
    mov DX,word ptr [BP + -4h]
    mov AX,4200h
    int 21h
    jmp LAB_1000_4c5b
LAB_1000_4c83:
    mov DX,word ptr [BP + 6h]
    mov CX,word ptr [BP + 8h]
    mov AL,byte ptr [BP + 0ah]
    mov AH,42h
    int 21h
    jc LAB_1000_4c97
    and byte ptr [BX + 22eah],0fdh
LAB_1000_4c97:
    jmp FUN_1000_4f33
FUN_1000_4c20 endp

routine_140 proc near
    push BP
    mov BP,SP
    push SI
    push DI
    push DS
    mov DS,word ptr [BP + 4h]
    mov SI,word ptr [BP + 6h]
    mov ES,word ptr [BP + 8h]
    mov DI,word ptr [BP + 0ah]
    mov CX,word ptr [BP + 0ch]
    rep movsb
    pop DS
    pop DI
    pop SI
    mov SP,BP
    pop BP
    ret
routine_140 endp

PUBLIC _routine_70
_routine_70:
routine_70 proc near
    push BP
    mov BP,SP
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_138],AX
    mov word ptr [_var_139],0h
    pop BP
    ret
    db 90h
routine_70 endp

FUN_1000_4cca proc near
    mov AX,43fdh
    mov DX,3h
    push DX
    push AX
    push word ptr [_var_139]
    push word ptr [_var_138]
    call __aNlmul
    add AX,9ec3h
    adc DX,26h
    mov word ptr [_var_138],AX
    mov word ptr [_var_139],DX
    mov AX,DX
    and AH,7fh
    ret
FUN_1000_4cca endp

routine_100 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push BX
    xor DI,DI
    mov AX,word ptr [BP + 6h]
    or AX,AX
    jge LAB_1000_4d10
    inc DI
    mov DX,word ptr [BP + 4h]
    neg AX
    neg DX
    db 1Dh, 00h, 00h  ; sbb AX,0h (force word-immediate)
    mov word ptr [BP + 6h],AX
    mov word ptr [BP + 4h],DX
LAB_1000_4d10:
    mov AX,word ptr [BP + 0ah]
    or AX,AX
    jge LAB_1000_4d28
    inc DI
    mov DX,word ptr [BP + 8h]
    neg AX
    neg DX
    db 1Dh, 00h, 00h  ; sbb AX,0h (force word-immediate)
    mov word ptr [BP + 0ah],AX
    mov word ptr [BP + 8h],DX
LAB_1000_4d28:
    or AX,AX
    jnz LAB_1000_4d41
    mov CX,word ptr [BP + 8h]
    mov AX,word ptr [BP + 6h]
    xor DX,DX
    div CX
    mov BX,AX
    mov AX,word ptr [BP + 4h]
    div CX
    mov DX,BX
    jmp LAB_1000_4d79
LAB_1000_4d41:
    mov BX,AX
    mov CX,word ptr [BP + 8h]
    mov DX,word ptr [BP + 6h]
    mov AX,word ptr [BP + 4h]
LAB_1000_4d4c:
    shr BX,1h
    rcr CX,1h
    shr DX,1h
    rcr AX,1h
    or BX,BX
    jnz LAB_1000_4d4c
    div CX
    mov SI,AX
    mul word ptr [BP + 0ah]
    xchg AX,CX
    mov AX,word ptr [BP + 8h]
    mul SI
    add DX,CX
    jc LAB_1000_4d75
    cmp DX,word ptr [BP + 6h]
    ja LAB_1000_4d75
    jc LAB_1000_4d76
    cmp AX,word ptr [BP + 4h]
    jbe LAB_1000_4d76
LAB_1000_4d75:
    dec SI
LAB_1000_4d76:
    xor DX,DX
    xchg AX,SI
LAB_1000_4d79:
    dec DI
    jnz LAB_1000_4d83
    neg DX
    neg AX
    sbb DX,0h
LAB_1000_4d83:
    pop BX
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret 8h
routine_100 endp

__aNlmul proc near
    push BP
    mov BP,SP
    mov AX,word ptr [BP + a+4h]
    mov BX,word ptr [BP + b+4h]
    or BX,AX
    mov BX,word ptr [BP + b+2h]
    jnz LAB_1000_4da7
    mov AX,word ptr [BP + a+2h]
    mul BX
    mov SP,BP
    pop BP
    ret 8h
LAB_1000_4da7:
    mul BX
    mov CX,AX
    mov AX,word ptr [BP + a+2h]
    mul word ptr [BP + b+4h]
    add CX,AX
    mov AX,word ptr [BP + a+2h]
    mul BX
    add DX,CX
    mov SP,BP
    pop BP
    ret 8h
__aNlmul endp

routine_139 proc near
    push BP
    mov BP,SP
    push BX
    push DI
    xor DI,DI
    mov AX,word ptr [BP + 6h]
    or AX,AX
    jge LAB_1000_4ddf
    inc DI
    mov DX,word ptr [BP + 4h]
    neg AX
    neg DX
    db 1Dh, 00h, 00h  ; sbb AX,0h (force word-immediate)
    mov word ptr [BP + 6h],AX
    mov word ptr [BP + 4h],DX
LAB_1000_4ddf:
    mov AX,word ptr [BP + 0ah]
    or AX,AX
    jge LAB_1000_4df6
    mov DX,word ptr [BP + 8h]
    neg AX
    neg DX
    db 1Dh, 00h, 00h  ; sbb AX,0h (force word-immediate)
    mov word ptr [BP + 0ah],AX
    mov word ptr [BP + 8h],DX
LAB_1000_4df6:
    or AX,AX
    jnz LAB_1000_4e12
    mov CX,word ptr [BP + 8h]
    mov AX,word ptr [BP + 6h]
    xor DX,DX
    div CX
    mov AX,word ptr [BP + 4h]
    div CX
    mov AX,DX
    xor DX,DX
    dec DI
    jns LAB_1000_4e53
    jmp LAB_1000_4e5a
LAB_1000_4e12:
    mov BX,AX
    mov CX,word ptr [BP + 8h]
    mov DX,word ptr [BP + 6h]
    mov AX,word ptr [BP + 4h]
LAB_1000_4e1d:
    shr BX,1h
    rcr CX,1h
    shr DX,1h
    rcr AX,1h
    or BX,BX
    jnz LAB_1000_4e1d
    div CX
    mov CX,AX
    mul word ptr [BP + 0ah]
    xchg AX,CX
    mul word ptr [BP + 8h]
    add DX,CX
    jc LAB_1000_4e44
    cmp DX,word ptr [BP + 6h]
    ja LAB_1000_4e44
    jc LAB_1000_4e4a
    cmp AX,word ptr [BP + 4h]
    jbe LAB_1000_4e4a
LAB_1000_4e44:
    sub AX,word ptr [BP + 8h]
    sbb DX,word ptr [BP + 0ah]
LAB_1000_4e4a:
    sub AX,word ptr [BP + 4h]
    sbb DX,word ptr [BP + 6h]
    dec DI
    jns LAB_1000_4e5a
LAB_1000_4e53:
    neg DX
    neg AX
    sbb DX,0h
LAB_1000_4e5a:
    pop DI
    pop BX
    mov SP,BP
    pop BP
    ret 8h
routine_139 endp

routine_101 proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    push word ptr [BP + 8h]
    push word ptr [BP + 6h]
    push word ptr [BX + 2h]
    push word ptr [BX]
    call routine_100
    mov BX,word ptr [BP + 4h]
    mov word ptr [BX + 2h],DX
    mov word ptr [BX],AX
    mov SP,BP
    pop BP
    ret 6h
routine_101 endp

routine_2 proc near
    push BP
    mov BP,SP
    mov AX,0fch
    push AX
    call routine_3
    cmp word ptr [_var_140],0h
    jz LAB_1000_4e99
    call word ptr [_var_140]
LAB_1000_4e99:
    mov AX,0ffh
    push AX
    call routine_3
    mov SP,BP
    pop BP
    ret
routine_2 endp

FUN_1000_4ea4 proc near
    mov AX,2h
    jmp LAB_1000_49bf
FUN_1000_4ea4 endp

routine_29 proc near
    push SI
    xor SI,SI
    mov CX,42h
    xor AH,AH
    cld
LAB_1000_4eb3:
    lodsb
    xor AH,AL
    loop LAB_1000_4eb3
    xor AH,55h
    jz LAB_1000_4eca
    call routine_2
    mov AX,1h
    push AX
    call routine_3
    mov AX,1h
LAB_1000_4eca:
    pop SI
    ret
routine_29 endp

routine_11 proc near
    push BP
    mov BP,SP
    push SI
    push DI
    push DS
    pop ES
    mov DX,word ptr [BP + param_1+2h]
    mov SI,247eh
LAB_1000_4ed9:
    lodsw
    cmp AX,DX
    jz LAB_1000_4eee
    inc AX
    xchg AX,SI
    jz LAB_1000_4eee
    xchg AX,DI
    xor AX,AX
    mov CX,0ffffh
    repne scasb
    mov SI,DI
    jmp LAB_1000_4ed9
LAB_1000_4eee:
    xchg AX,SI
    pop DI
    pop SI
    mov SP,BP
    pop BP
    ret 2h
routine_11 endp

routine_3 proc near
    push BP
    mov BP,SP
    push DI
    push word ptr [BP + 4h]
    call routine_11
    or AX,AX
    jz LAB_1000_4f19
    xchg AX,DX
    mov DI,DX
    xor AX,AX
    mov CX,0ffffh
    repne scasb
    not CX
    dec CX
    mov BX,2h
    mov AH,40h
    int 21h
LAB_1000_4f19:
    pop DI
    mov SP,BP
    pop BP
    ret 2h
routine_3 endp

FUN_1000_4f20 proc near
    jc LAB_1000_4f35
    xor AX,AX
    mov SP,BP
    pop BP
    ret
    db 73h
    db 0F8h
    db 50h
    db 0E8h
    db 18h
    db 00h
    db 58h
    db 8Bh
    db 0E5h
    db 5Dh
    db 0C3h
FUN_1000_4f20 endp

FUN_1000_4f33 proc near
    jnc LAB_1000_4f3c
LAB_1000_4f35:
    call routine_114
    mov AX,0ffffh
    cwd
LAB_1000_4f3c:
    mov SP,BP
    pop BP
    ret
    db 32h
    db 0E4h
    db 0E8h
    db 01h
    db 00h
    db 0C3h
FUN_1000_4f33 endp

routine_114 proc near
    mov byte ptr [_var_129],AL
    or AH,AH
    jnz LAB_1000_4f70
    cmp byte ptr [_var_128],3h
    jc LAB_1000_4f61
    cmp AL,22h
    jnc LAB_1000_4f65
    cmp AL,20h
    jc LAB_1000_4f61
    mov AL,5h
    jmp LAB_1000_4f67
    db 90h
LAB_1000_4f61:
    cmp AL,13h
    jbe LAB_1000_4f67
LAB_1000_4f65:
    mov AL,13h
LAB_1000_4f67:
    mov BX,231ch
    xlat
LAB_1000_4f6b:
    cbw
    mov word ptr [_var_125],AX
    ret
LAB_1000_4f70:
    mov AL,AH
    jmp LAB_1000_4f6b
routine_114 endp

routine_85 proc near
    push BP
    mov BP,SP
    push SI
    mov SI,word ptr [BP + 4h]
    test byte ptr [SI + 6h],83h
    jz LAB_1000_4f9e
    test byte ptr [SI + 6h],8h
    jz LAB_1000_4f9e
    push word ptr [SI + 4h]
    call routine_113
    add SP,2h
    and byte ptr [SI + 6h],0f7h
    sub AX,AX
    mov word ptr [SI],AX
    mov word ptr [SI + 4h],AX
    mov word ptr [SI + 2h],AX
LAB_1000_4f9e:
    pop SI
    pop BP
    ret
    db 90h
routine_85 endp

routine_74 proc near
    push BP
    mov BP,SP
    sub SP,0ah
    push DI
    push SI
    mov SI,word ptr [BP + param_3+2h]
    mov BX,word ptr [BP + param_2+2h]
    mov AL,byte ptr [BX]
    cbw
    db 3Dh, 61h, 00h  ; cmp AX,61h (force word-immediate)
    jz LAB_1000_4fe0
    db 3Dh, 72h, 00h  ; cmp AX,72h (force word-immediate)
    jz LAB_1000_4fc8
    db 3Dh, 77h, 00h  ; cmp AX,77h (force word-immediate)
    jz LAB_1000_4fd6
LAB_1000_4fc2:
    sub AX,AX
    jmp LAB_1000_5094
    db 90h
LAB_1000_4fc8:
    sub DI,DI
    mov byte ptr [BP + -4h],1h
LAB_1000_4fce:
    mov CX,1h
    mov DL,byte ptr [BP + -4h]
    jmp LAB_1000_4ff5
LAB_1000_4fd6:
    mov DI,301h
LAB_1000_4fd9:
    mov byte ptr [BP + -4h],2h
    jmp LAB_1000_4fce
    db 90h
LAB_1000_4fe0:
    mov DI,109h
    jmp LAB_1000_4fd9
    db 90h
LAB_1000_4fe6:
    test DI,2h
    jnz LAB_1000_502b
    db 81h, 0CFh, 02h, 00h  ; or DI,2h (force word-immediate)
    and DI,0fffeh
    mov DL,80h
LAB_1000_4ff5:
    inc word ptr [BP + param_2+2h]
    mov BX,word ptr [BP + param_2+2h]
    cmp byte ptr [BX],0h
    jz LAB_1000_5036
    or CX,CX
    jz LAB_1000_5036
    mov AL,byte ptr [BX]
    cbw
    db 3Dh, 2Bh, 00h  ; cmp AX,2Bh (force word-immediate)
    jz LAB_1000_4fe6
    db 3Dh, 62h, 00h  ; cmp AX,62h (force word-immediate)
    jz LAB_1000_5024
    db 3Dh, 74h, 00h  ; cmp AX,74h (force word-immediate)
    jnz LAB_1000_502b
    mov AX,DI
    test AX,0c000h
    jnz LAB_1000_502b
    or DI,4000h
    jmp LAB_1000_4ff5
    db 90h
LAB_1000_5024:
    mov AX,DI
    test AX,0c000h
    jz LAB_1000_5030
LAB_1000_502b:
    sub CX,CX
    jmp LAB_1000_4ff5
    db 90h
LAB_1000_5030:
    or DI,8000h
    jmp LAB_1000_4ff5
LAB_1000_5036:
    mov byte ptr [BP + -4h],DL
    mov word ptr [BP + -2h],CX
    mov AX,1a4h
    push AX
    push DI
    push word ptr [BP + 4h]
    call routine_110
    add SP,6h
    mov word ptr [BP + -6h],AX
    or AX,AX
    jge LAB_1000_5054
    jmp LAB_1000_4fc2
LAB_1000_5054:
    mov AL,byte ptr [BP + -4h]
    mov byte ptr [SI + 6h],AL
    inc word ptr [_var_144]
    mov AX,SI
    sub AX,2330h
    mov CL,3h
    sar AX,CL
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    add AX,23d0h
    mov word ptr [BP + -8h],AX
    sub AL,AL
    mov BX,word ptr [BP + -8h]
    mov byte ptr [BX],AL
    cbw
    mov word ptr [SI + 2h],AX
    mov word ptr [BX + 4h],0h
    sub AX,AX
    mov word ptr [SI],AX
    mov word ptr [SI + 4h],AX
    mov AL,byte ptr [BP + -6h]
    mov byte ptr [SI + 7h],AL
    mov AX,SI
LAB_1000_5094:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
routine_74 endp

routine_84 proc near
    push BP
    mov BP,SP
    sub SP,4h
    push DI
    push SI
    mov SI,word ptr [BP + 4h]
    sub DI,DI
    mov AL,byte ptr [SI + 6h]
    and AL,3h
    cmp AL,2h
    jnz LAB_1000_50f6
    test byte ptr [SI + 6h],8h
    jnz LAB_1000_50cf
    mov BX,SI
    sub BX,2330h
    mov CL,3h
    sar BX,CL
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 23d0h],1h
    jz LAB_1000_50f6
LAB_1000_50cf:
    mov AX,word ptr [SI]
    sub AX,word ptr [SI + 4h]
    mov word ptr [BP + -4h],AX
    or AX,AX
    jle LAB_1000_50f6
    push AX
    push word ptr [SI + 4h]
    mov AL,byte ptr [SI + 7h]
    cbw
    push AX
    call routine_112
    add SP,6h
    cmp AX,word ptr [BP + -4h]
    jz LAB_1000_50f6
    or byte ptr [SI + 6h],20h
    mov DI,0ffffh
LAB_1000_50f6:
    mov AX,word ptr [SI + 4h]
    mov word ptr [SI],AX
    mov word ptr [SI + 2h],0h
    mov AX,DI
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
routine_84 endp

routine_73 proc near
    push BP
    mov BP,SP
    sub SP,2h
    push SI
    mov SI,2330h
    mov CX,word ptr [_var_143]
LAB_1000_5116:
    test byte ptr [SI + 6h],83h
    jnz LAB_1000_5132
    sub AX,AX
    mov word ptr [SI + 2h],AX
    mov byte ptr [SI + 6h],AL
    mov word ptr [SI + 4h],AX
    mov word ptr [SI],AX
    mov byte ptr [SI + 7h],0ffh
    mov AX,SI
    jmp LAB_1000_513d
    db 90h
LAB_1000_5132:
    mov AX,SI
    add SI,8h
    cmp AX,CX
    jnz LAB_1000_5116
    sub AX,AX
LAB_1000_513d:
    pop SI
    mov SP,BP
    pop BP
    ret
routine_73 endp

routine_86 proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    cmp BX,word ptr [_var_130]
    jc LAB_1000_5154
    mov AX,900h
    stc
    jmp LAB_1000_515f
LAB_1000_5154:
    mov AH,3eh
    int 21h
    jc LAB_1000_515f
    mov byte ptr [BX + 22eah],0h
LAB_1000_515f:
    jmp FUN_1000_4f20
routine_86 endp

routine_88 proc near
    push BP
    mov BP,SP
    mov DX,word ptr [BP + Stack[2h]+2h]
    mov AH,41h
    int 21h
    jmp FUN_1000_4f20
    db 00h
routine_88 endp

routine_110 proc near
    push BP
    mov BP,SP
    sub SP,4h
    xor BH,BH
    mov byte ptr [BP + -2h],BH
    mov AX,word ptr [BP + 6h]
    mov CX,AX
    mov byte ptr [BP + -4h],0h
    test AX,8000h
    jnz LAB_1000_5199
    test AX,4000h
    jnz LAB_1000_5195
    test byte ptr [_var_145],80h
    jnz LAB_1000_5199
LAB_1000_5195:
    mov byte ptr [BP + -4h],80h
LAB_1000_5199:
    mov DX,word ptr [BP + 4h]
    and AL,3h
    or AL,BH
    mov AH,3dh
    int 21h
    jnc LAB_1000_51b8
    db 3Dh, 02h, 00h  ; cmp AX,2h (force word-immediate)
    jnz LAB_1000_51b4
    test CX,100h
    jz LAB_1000_51b4
    jmp LAB_1000_5255
LAB_1000_51b4:
    stc
    jmp FUN_1000_4f33
LAB_1000_51b8:
    xchg AX,BX
    mov AX,CX
    and AX,500h
    cmp AX,500h
    jnz LAB_1000_51cc
    mov AH,3eh
    int 21h
    mov AX,1100h
    jmp LAB_1000_51b4
LAB_1000_51cc:
    mov byte ptr [BP + -3h],1h
    mov AX,4400h
    int 21h
    test DL,80h
    jz LAB_1000_51de
    or byte ptr [BP + -4h],40h
LAB_1000_51de:
    test byte ptr [BP + -4h],40h
    jz LAB_1000_51e7
    jmp LAB_1000_52bc
LAB_1000_51e7:
    mov AX,word ptr [BP + 6h]
    test AX,200h
    jz LAB_1000_520c
    db 0A9h, 03h, 00h  ; test AX,3h (force word-immediate)
    jz LAB_1000_51fd
    xor CX,CX
    mov AH,40h
    int 21h
    jmp LAB_1000_52bc
LAB_1000_51fd:
    mov AH,3eh
    int 21h
    mov DX,word ptr [BP + 4h]
    mov AX,4300h
    int 21h
    jmp LAB_1000_5272
    db 90h
LAB_1000_520c:
    test byte ptr [BP + -4h],80h
    jnz LAB_1000_5215
    jmp LAB_1000_52bc
LAB_1000_5215:
    db 0A9h, 02h, 00h  ; test AX,2h (force word-immediate)
    jnz LAB_1000_521d
    jmp LAB_1000_52bc
LAB_1000_521d:
    mov CX,0ffffh
    mov DX,CX
    mov AX,4202h
    int 21h
    neg CX
    lea DX,[BP + -1h]
    mov AH,3fh
    int 21h
    or AX,AX
    jz LAB_1000_5249
    cmp byte ptr [BP + -1h],1ah
    jnz LAB_1000_5249
    neg CX
    mov DX,CX
    mov AX,4202h
    int 21h
    xor CX,CX
    mov AH,40h
    int 21h
LAB_1000_5249:
    xor CX,CX
    mov DX,CX
    mov AX,4200h
    int 21h
    jmp LAB_1000_52bc
    db 90h
LAB_1000_5255:
    mov byte ptr [BP + -3h],0h
    mov CX,word ptr [BP + 8h]
    call routine_141
    mov word ptr [BP + 8h],CX
    test byte ptr [BP + -2h],0ffh
    jnz LAB_1000_526f
    test word ptr [BP + 6h],2h
    jnz LAB_1000_5272
LAB_1000_526f:
    and CL,0feh
LAB_1000_5272:
    mov DX,word ptr [BP + 4h]
    mov AH,3ch
    int 21h
    jnc LAB_1000_527e
LAB_1000_527b:
    jmp FUN_1000_4f33
LAB_1000_527e:
    xchg AX,BX
    test byte ptr [BP + -2h],0ffh
    jnz LAB_1000_528c
    test word ptr [BP + 6h],2h
    jnz LAB_1000_52bc
LAB_1000_528c:
    mov AH,3eh
    int 21h
    mov AL,byte ptr [BP + 6h]
    and AL,3h
    or AL,byte ptr [BP + -2h]
    mov DX,word ptr [BP + 4h]
    mov AH,3dh
    int 21h
    jc LAB_1000_527b
    xchg AX,BX
    test byte ptr [BP + -3h],1h
    jnz LAB_1000_52bc
    test word ptr [BP + 8h],1h
    jz LAB_1000_52bc
    or CL,1h
    mov DX,word ptr [BP + 4h]
    mov AX,4301h
    int 21h
    jc LAB_1000_527b
LAB_1000_52bc:
    test byte ptr [BP + -4h],40h
    jnz LAB_1000_52ff
    mov DX,word ptr [BP + 4h]
    mov AX,4300h
    int 21h
    mov AX,CX
    xor CL,CL
    db 25h, 01h, 00h  ; and AX,1h (force word-immediate)
    jz LAB_1000_52d5
    mov CL,10h
LAB_1000_52d5:
    test word ptr [BP + 6h],8h
    jz LAB_1000_52df
    or CL,20h
LAB_1000_52df:
    cmp BX,word ptr [_var_130]
    jc LAB_1000_52ef
    mov AH,3eh
    int 21h
    mov AX,1800h
    jmp LAB_1000_51b4
LAB_1000_52ef:
    or CL,byte ptr [BP + -4h]
    or CL,1h
    mov byte ptr [BX + 22eah],CL
    mov AX,BX
    mov SP,BP
    pop BP
    ret
LAB_1000_52ff:
    xor CL,CL
    jmp LAB_1000_52df
routine_110 endp

routine_141 proc near
    mov AX,word ptr [_var_126]
    not AX
    and AX,CX
    xor CX,CX
    test AL,80h
    jnz LAB_1000_5313
    or CL,1h
LAB_1000_5313:
    ret
routine_141 endp

routine_112 proc near
    push BP
    mov BP,SP
    sub SP,8h
    mov BX,word ptr [BP + 4h]
    cmp BX,word ptr [_var_130]
    jc LAB_1000_532a
    mov AX,900h
    stc
LAB_1000_5327:
    jmp FUN_1000_4f33
LAB_1000_532a:
    test byte ptr [BX + 22eah],20h
    jz LAB_1000_533c
    mov AX,4202h
    xor CX,CX
    mov DX,CX
    int 21h
    jc LAB_1000_5327
LAB_1000_533c:
    test byte ptr [BX + 22eah],80h
    jz LAB_1000_53b1
    mov DX,word ptr [BP + 6h]
    push DS
    pop ES
    xor AX,AX
    mov word ptr [BP + -2h],AX
    mov word ptr [BP + -4h],AX
    cld
    push DI
    push SI
    mov DI,DX
    mov SI,DX
    mov word ptr [BP + -8h],SP
    mov CX,word ptr [BP + 8h]
    jcxz LAB_1000_53b3
    mov AL,0ah
    repne scasb
    jnz LAB_1000_53af
    call routine_142
    cmp AX,0a8h
    jbe LAB_1000_53b5
    sub SP,2h
    mov BX,SP
    mov DX,200h
    cmp AX,228h
    jnc LAB_1000_537d
    mov DX,80h
LAB_1000_537d:
    sub SP,DX
    mov DX,SP
    mov DI,DX
    push SS
    pop ES
    mov CX,word ptr [BP + 8h]
LAB_1000_5388:
    lodsb
    cmp AL,0ah
    jz LAB_1000_5399
LAB_1000_538d:
    cmp DI,BX
    jz LAB_1000_53aa
LAB_1000_5391:
    stosb
    loop LAB_1000_5388
    call routine_143
    jmp FUN_1000_53fa
LAB_1000_5399:
    mov AL,0dh
    cmp DI,BX
    jnz LAB_1000_53a2
    call routine_143
LAB_1000_53a2:
    stosb
    mov AL,0ah
    inc word ptr [BP + -4h]
    jmp LAB_1000_538d
LAB_1000_53aa:
    call routine_143
    jmp LAB_1000_5391
LAB_1000_53af:
    pop SI
    pop DI
LAB_1000_53b1:
    jmp FUN_1000_5408
LAB_1000_53b3:
    jmp FUN_1000_53fa
LAB_1000_53b5:
    xor AX,AX
    jmp LAB_1000_49bf
routine_112 endp

routine_143 proc near
    push AX
    push BX
    push CX
    mov CX,DI
    sub CX,DX
    jcxz LAB_1000_53d3
    mov BX,word ptr [BP + 4h]
    mov AH,40h
    int 21h
    jc LAB_1000_53d9
    add word ptr [BP + -2h],AX
    or AX,AX
    jz LAB_1000_53d9
LAB_1000_53d3:
    pop CX
    pop BX
    pop AX
    mov DI,DX
    ret
LAB_1000_53d9:
    add SP,8h
    jnc LAB_1000_53e2
    mov AH,9h
    jmp LAB_1000_5400
LAB_1000_53e2:
    test byte ptr [BX + 22eah],40h
    jz LAB_1000_53f4
    mov BX,word ptr [BP + 6h]
    cmp byte ptr [BX],1ah
    jnz LAB_1000_53f4
    clc
    jmp LAB_1000_5400
LAB_1000_53f4:
    stc
    mov AX,1c00h
    jmp LAB_1000_5400
routine_143 endp

FUN_1000_53fa proc near
    mov AX,word ptr [BP + -2h]
    sub AX,word ptr [BP + -4h]
LAB_1000_5400:
    mov SP,word ptr [BP + -8h]
    pop SI
    pop DI
LAB_1000_5405:
    jmp FUN_1000_4f33
FUN_1000_53fa endp

FUN_1000_5408 proc near
    mov CX,word ptr [BP + 8h]
    or CX,CX
    jnz LAB_1000_5414
    mov AX,CX
    jmp FUN_1000_4f33
LAB_1000_5414:
    mov DX,word ptr [BP + 6h]
    mov AH,40h
    int 21h
    jnc LAB_1000_5421
    mov AH,9h
    jmp LAB_1000_5405
LAB_1000_5421:
    or AX,AX
    jnz LAB_1000_5405
    test byte ptr [BX + 22eah],40h
    jz LAB_1000_5436
    mov BX,DX
    cmp byte ptr [BX],1ah
    jnz LAB_1000_5436
    clc
    jmp LAB_1000_5405
LAB_1000_5436:
    stc
    mov AX,1c00h
    jmp LAB_1000_5405
FUN_1000_5408 endp

routine_113 proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    or BX,BX
    jz LAB_1000_544a
    or byte ptr [BX + -2h],1h
LAB_1000_544a:
    mov SP,BP
    pop BP
    ret
    push BP
    mov BP,SP
    push SI
    push DI
    mov BX,offset dat_244C
    cmp word ptr [BX],0h
    jnz LAB_1000_5484
    push DS
    pop ES
    mov AX,5h
    call FUN_1000_561a
    jnz LAB_1000_546a
    xor AX,AX
    cwd
    jmp LAB_1000_548e
LAB_1000_546a:
    inc AX
    and AL,0feh
    mov word ptr [dat_244C],AX
    mov word ptr [dat_244E],AX
    xchg AX,SI
    mov word ptr [SI],1h
    add SI,4h
    mov word ptr [SI + -2h],0fffeh
    mov word ptr [dat_2452],SI
LAB_1000_5484:
    mov CX,word ptr [BP + Stack[2h]+2h]
    mov AX,DS
    mov ES,AX
    call FUN_1000_54db
LAB_1000_548e:
    pop DI
    pop SI
    mov SP,BP
    pop BP
    ret
routine_113 endp

FUN_1000_5494 proc near
    push BP
    mov BP,SP
    sub SP,4h
    push DI
    push SI
    mov SI,2330h
    sub DI,DI
    jmp LAB_1000_54b8
    db 90h
LAB_1000_54a4:
    test byte ptr [SI + 6h],83h
    jz LAB_1000_54b5
    push SI
    call routine_84
    add SP,2h
    inc AX
    jz LAB_1000_54b5
    inc DI
LAB_1000_54b5:
    add SI,8h
LAB_1000_54b8:
    cmp word ptr [_var_143],SI
    jnc LAB_1000_54a4
    mov AX,DI
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
FUN_1000_5494 endp

routine_142 proc near
    pop CX
    mov AX,word ptr [_var_146]
    cmp AX,SP
    jnc LAB_1000_54d4
    sub AX,SP
    neg AX
LAB_1000_54d2:
    jmp CX
LAB_1000_54d4:
    xor AX,AX
    jmp LAB_1000_54d2
LAB_1000_54d8:
    jmp LAB_1000_55a9
FUN_1000_54db:
    inc CX
    jz LAB_1000_54d8
    and CL,0feh
    cmp CX,-12h
    jnc LAB_1000_54d8
    mov SI,word ptr [BX + 2h]
    cld
    lodsw
    mov DI,SI
    test AL,1h
    jz LAB_1000_5533
LAB_1000_54f1:
    dec AX
    cmp AX,CX
    jnc LAB_1000_550b
    mov DX,AX
    add SI,AX
    lodsw
    test AL,1h
    jz LAB_1000_5533
    add AX,DX
    db 05h, 02h, 00h  ; add AX,2h (force word-immediate)
    mov SI,DI
    mov word ptr [SI + -2h],AX
    jmp LAB_1000_54f1
LAB_1000_550b:
    mov DI,SI
    jz LAB_1000_551b
    add DI,CX
    mov word ptr [SI + -2h],CX
    sub AX,CX
    dec AX
    mov word ptr [DI],AX
    jmp LAB_1000_5520
LAB_1000_551b:
    add DI,CX
    dec byte ptr [SI + -2h]
LAB_1000_5520:
    mov AX,SI
    mov DX,DS
    mov CX,SS
    cmp DX,CX
    jz LAB_1000_552f
    mov word ptr ES:[245ch],DS
LAB_1000_552f:
    mov word ptr [BX + 2h],DI
    ret
LAB_1000_5533:
    mov byte ptr ES:[2462h],2h
LAB_1000_5539:
    cmp AX,0fffeh
    jz LAB_1000_5563
    mov DI,SI
    add SI,AX
LAB_1000_5542:
    lodsw
    test AL,1h
    jz LAB_1000_5539
    mov DI,SI
LAB_1000_5549:
    dec AX
    cmp AX,CX
    jnc LAB_1000_550b
    mov DX,AX
    add SI,AX
    lodsw
    test AL,1h
    jz LAB_1000_5539
    add AX,DX
    db 05h, 02h, 00h  ; add AX,2h (force word-immediate)
    mov SI,DI
    mov word ptr [SI + -2h],AX
    jmp LAB_1000_5549
LAB_1000_5563:
    mov AX,word ptr [BX + 8h]
    or AX,AX
    jz LAB_1000_556e
    mov DS,AX
    jmp LAB_1000_5582
LAB_1000_556e:
    dec byte ptr ES:[2462h]
    jz LAB_1000_5586
    mov AX,DS
    mov DI,SS
    cmp AX,DI
    jz LAB_1000_5582
    mov DS,word ptr ES:[2458h]
LAB_1000_5582:
    mov SI,word ptr [BX]
    jmp LAB_1000_5542
LAB_1000_5586:
    mov SI,word ptr [BX + 6h]
    xor AX,AX
    call FUN_1000_55f8
    cmp AX,SI
    jz LAB_1000_559f
    and AL,1h
    inc AX
    inc AX
    cbw
    call FUN_1000_55f8
    jz LAB_1000_55a9
    dec byte ptr [DI + -2h]
LAB_1000_559f:
    call FUN_1000_55be
    jz LAB_1000_55a9
    xchg AX,SI
    dec SI
    dec SI
    jmp LAB_1000_5542
LAB_1000_55a9:
    mov AX,DS
    mov CX,SS
    cmp AX,CX
    jz LAB_1000_55b5
    mov ES:[245ch],AX
LAB_1000_55b5:
    mov AX,word ptr [BX]
    mov word ptr [BX + 2h],AX
    xor AX,AX
    cwd
    ret
routine_142 endp

FUN_1000_55be proc near
    push CX
    mov AX,word ptr [DI + -2h]
    test AL,1h
    jz LAB_1000_55c9
    sub CX,AX
    dec CX
LAB_1000_55c9:
    inc CX
    inc CX
    mov DX,7fffh
LAB_1000_55ce:
    cmp DX,word ptr ES:[245eh]
    jbe LAB_1000_55d9
    shr DX,1h
    jnz LAB_1000_55ce
LAB_1000_55d9:
    mov AX,CX
    add AX,SI
    jc LAB_1000_55f4
    add AX,DX
    jc LAB_1000_55f0
    not DX
    and AX,DX
    sub AX,SI
    call FUN_1000_55f8
    jnz LAB_1000_55f6
    not DX
LAB_1000_55f0:
    shr DX,1h
    jnz LAB_1000_55d9
LAB_1000_55f4:
    xor AX,AX
LAB_1000_55f6:
    pop CX
    ret
FUN_1000_55be endp

FUN_1000_55f8 proc near
    push DX
    push CX
    call FUN_1000_561a
    jz LAB_1000_5617
    push DI
    mov DI,SI
    mov SI,AX
    add SI,DX
    mov word ptr [SI + -2h],0fffeh
    mov word ptr [BX + 6h],SI
    mov DX,SI
    sub DX,DI
    dec DX
    mov word ptr [DI + -2h],DX
    pop AX
LAB_1000_5617:
    pop CX
    pop DX
    ret
FUN_1000_55f8 endp

FUN_1000_561a proc near
    push BX
    push AX
    xor DX,DX
    push DS
    push DX
    push DX
    push AX
    mov AX,1h
    push AX
    push ES
    pop DS
    call FUN_1000_5650
    add SP,8h
    cmp DX,-1h
    pop DS
    pop DX
    pop BX
    jz LAB_1000_5638
    or DX,DX
LAB_1000_5638:
    ret
    db 00h
    db 59h
    db 8Bh
    db 0DCh
    db 2Bh
    db 0D8h
    db 72h
    db 0Ah
    db 3Bh
    db 1Eh
    db 64h
    db 24h
    db 72h
    db 04h
    db 8Bh
    db 0E3h
    db 0FFh
    db 0E1h
    db 33h
    db 0C0h
    db 0E9h
    db 6Fh
    db 0F3h
FUN_1000_561a endp

FUN_1000_5650 proc near
    push BP
    mov BP,SP
    push SI
    push DI
    push ES
    cmp word ptr [BP + 8h],0h
    jnz LAB_1000_5694
    mov DI,offset _var_122
    mov DX,word ptr [BP + 6h]
    mov AX,word ptr [BP + 4h]
    dec AX
    jnz LAB_1000_566f
    call FUN_1000_56be
    jc LAB_1000_5694
    jmp LAB_1000_56b7
LAB_1000_566f:
    mov SI,word ptr [dat_22C0]
    dec AX
    jz LAB_1000_5687
    cmp SI,DI
    jz LAB_1000_5687
    mov AX,word ptr [SI + 2h]
    mov word ptr [BP + Stack[0ah]+2h],AX
    push SI
    call FUN_1000_56be
    pop SI
    jnc LAB_1000_56b7
LAB_1000_5687:
    add SI,4h
    cmp SI,22c0h
    jnc LAB_1000_5694
    or DX,DX
    jnz LAB_1000_569a
LAB_1000_5694:
    mov AX,0ffffh
    cwd
    jmp LAB_1000_56b7
LAB_1000_569a:
    mov BX,DX
    add BX,0fh
    rcr BX,1h
    mov CL,3h
    shr BX,CL
    mov AH,48h
    int 21h
    jc LAB_1000_5694
    xchg AX,DX
    mov word ptr [SI],AX
    mov word ptr [SI + 2h],DX
    mov word ptr [dat_22C0],SI
    xor AX,AX
LAB_1000_56b7:
    pop ES
    pop DI
    pop SI
    mov SP,BP
    pop BP
    ret
FUN_1000_5650 endp

FUN_1000_56be proc near
    mov CX,word ptr [BP + 0ch]
    mov SI,DI
LAB_1000_56c3:
    cmp word ptr [SI + 2h],CX
    jz LAB_1000_56d4
    add SI,4h
    cmp SI,22c0h
    jnz LAB_1000_56c3
    stc
    jmp LAB_1571_0003
LAB_1000_56d4:
    mov BX,DX
    add BX,word ptr [SI]
    jc LAB_1571_0003
    mov DX,BX
    mov ES,CX
    cmp SI,DI
    jnz LAB_1000_56e8
    cmp word ptr [_var_119],BX
    jnc LAB_1000_570e
LAB_1000_56e8:
    add BX,0fh
    rcr BX,1h
    shr BX,1h
    shr BX,1h
    shr BX,1h
    cmp SI,DI
    jnz LAB_1000_5700
    add BX,CX
    mov AX,word ptr [_var_127]
    sub BX,AX
    mov ES,AX
LAB_1000_5700:
    mov AH,4ah
    int 21h
    jc LAB_1571_0003
    cmp SI,DI
    jnz LAB_1000_570e
    mov word ptr [_var_119],DX
LAB_1000_570e:
    xchg AX,DX
    xchg word ptr [SI],AX
    mov DX,CX
LAB_1571_0003:
    ret
    db 0E8h
    db 33h
    db 00h
    db 0BBh
    db 00h
    db 00h
    db 0E8h
    db 07h
    db 00h
    db 0BBh
    db 01h
    db 00h
    db 0E8h
    db 01h
    db 00h
    db 0CBh
    db 0D1h
    db 0E3h
    db 8Bh
    db 87h
    db 0F2h
    db 15h
    db 89h
    db 87h
    db 0DAh
    db 15h
    db 89h
    db 87h
    db 0CAh
    db 15h
    db 89h
    db 87h
    db 0D2h
    db 15h
    db 0C3h
FUN_1000_56be endp

routine_134 proc far
    call readJoyPort
    mov BX,0h
    call routine_149
    mov BX,1h
    call routine_149
    mov AX,word ptr [_var_55]
    retf
routine_134 endp

readJoyPort proc near
    push BP
    xor BX,BX
    xor BP,BP
    mov CX,0ffffh
    mov DX,201h
    cli
    out DX,AL
    jmp LAB_1571_0049
LAB_1571_0049:
    jmp LAB_1571_004b
LAB_1571_004b:
    in AL,DX
    and AL,3h
    jz LAB_1571_005c
    shr AL,1h
    adc BX,0h
    shr AL,1h
    adc BP,0h
    loop LAB_1571_004b
LAB_1571_005c:
    sti
    mov word ptr [_var_53],BX
    mov word ptr [_var_54],BP
    pop BP
    ret
readJoyPort endp

routine_149 proc near
    shl BX,1h
    mov AX,word ptr [BX + 15f2h]
    mov DX,AX
    sub DX,word ptr [BX + 15dah]
    jc LAB_1571_007c
    ja LAB_1571_009e
    mov AH,80h
    jmp LAB_1571_00bc
    db 90h
LAB_1571_007c:
    neg DX
    cmp AX,word ptr [BX + 15cah]
    ja LAB_1571_0091
    mov word ptr [BX + 15cah],AX
    mov word ptr [BX + 15e2h],DX
    mov AH,0h
    jmp LAB_1571_00bc
    db 90h
LAB_1571_0091:
    xor AX,AX
    div word ptr [BX + 15e2h]
    not AX
    shr AX,1h
    jmp LAB_1571_00bc
    db 90h
LAB_1571_009e:
    cmp AX,word ptr [BX + 15d2h]
    jc LAB_1571_00b1
    mov word ptr [BX + 15d2h],AX
    mov word ptr [BX + 15eah],DX
    mov AH,0ffh
    jmp LAB_1571_00bc
    db 90h
LAB_1571_00b1:
    xor AX,AX
    div word ptr [BX + 15eah]
    shr AX,1h
    add AH,80h
LAB_1571_00bc:
    shr BX,1h
    mov byte ptr [BX + 15fah],AH
    ret
    db 8Bh
    db 0DCh
    db 56h
    db 57h
    db 06h
    db 0BEh
    db 0CAh
    db 15h
    db 0C4h
    db 7Fh
    db 04h
    db 0B9h
    db 14h
    db 00h
    db 0F3h
    db 0A5h
    db 07h
    db 5Fh
    db 5Eh
    db 0CBh
routine_149 endp

copyJoystickData proc far
    mov BX,SP
    push SI
    push DI
    push DS
    push ES
    lds SI,dword ptr [BX + 4h]
    mov DI,offset _var_48
    push SS
    pop ES
    mov CX,14h
    rep movsw
    pop ES
    pop DS
    pop DI
    pop SI
    retf
    db 00h
copyJoystickData endp





.DATA
; --- Data segment ---

    db 000h
_var_8 db 000h
_var_9 db 000h
_var_10 db 000h
_var_11 db 000h
    db 000h
_var_12 db 000h
_var_13 db 000h
_var_14 db 04Dh
    db 053h
_var_15 db 020h
    db 052h
_var_16 db 075h
    db 06Eh
_var_17 db 02Dh
    db 054h
_var_18 db 069h
    db 06Dh
_var_19 db 065h
    db 020h, 04Ch, 069h, 062h, 072h, 061h, 072h, 079h, 020h, 02Dh, 020h, 043h, 06Fh, 070h, 079h, 072h
    db 069h, 067h, 068h, 074h, 020h, 028h, 063h, 029h, 020h
_var_20 db 031h
    db 039h
_var_21 db 038h
    db 038h
_var_22 db 02Ch
    db 020h, 04Dh, 069h, 063h, 072h, 06Fh, 073h, 06Fh, 066h, 074h, 020h, 043h, 06Fh, 072h, 070h, 011h
    db 000h
dat_0042 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 04Eh, 06Fh, 06Eh, 065h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 053h, 041h, 02Dh, 032h, 000h, 000h, 000h, 000h, 0C8h, 000h, 003h, 000h, 000h, 000h, 053h
    db 041h, 02Dh, 035h, 000h, 000h, 000h, 000h, 05Eh, 001h, 002h, 000h, 000h, 000h, 053h, 041h, 02Dh
    db 038h, 042h, 000h, 000h, 000h, 07Dh, 000h, 005h, 000h, 000h, 000h, 053h, 041h, 02Dh, 031h, 030h
    db 000h, 000h, 000h, 040h, 001h, 007h, 000h, 001h, 000h, 053h, 041h, 02Dh, 031h, 031h, 000h, 000h
    db 000h, 0C8h, 000h, 005h, 000h, 000h, 000h, 053h, 041h, 02Dh, 031h, 032h, 000h, 000h, 000h, 022h
    db 001h, 006h, 000h, 001h, 000h, 053h, 041h, 02Dh, 031h, 033h, 000h, 000h, 000h, 07Dh, 000h, 003h
    db 000h, 000h, 000h, 053h, 041h, 02Dh, 04Eh, 02Dh, 034h, 000h, 000h, 0C8h, 000h, 004h, 000h, 001h
    db 000h, 053h, 041h, 02Dh, 04Eh, 02Dh, 035h, 000h, 000h, 096h, 000h, 003h, 000h, 000h, 000h, 053h
    db 041h, 02Dh, 04Eh, 02Dh, 036h, 000h, 000h, 040h, 001h, 006h, 000h, 001h, 000h, 053h, 041h, 02Dh
    db 04Eh, 02Dh, 037h, 000h, 000h, 0C8h, 000h, 005h, 000h, 000h, 000h, 048h, 061h, 077h, 06Bh, 000h
    db 000h, 000h, 000h, 0AFh, 000h, 006h, 000h, 001h, 000h, 052h, 061h, 070h, 069h, 065h, 072h, 000h
    db 000h, 04Bh, 000h, 008h, 000h, 000h, 000h, 054h, 069h, 067h, 065h, 072h, 000h, 000h, 000h, 041h
    db 000h, 004h, 000h, 000h, 000h, 053h, 065h, 061h, 063h, 061h, 074h, 000h, 000h, 0C8h, 000h, 002h
    db 000h, 000h, 000h, 049h, 04Ch, 037h, 036h, 000h, 000h, 000h, 000h, 0C8h, 000h, 008h, 000h, 003h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 032h, 000h, 005h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 046h, 000h, 006h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 050h, 000h, 007h, 000h, 001h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 064h, 000h, 008h, 000h, 001h, 000h, 04Fh, 054h, 048h, 000h, 000h, 000h, 000h
    db 000h, 0F4h, 001h, 005h, 000h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h
    db 000h, 003h, 000h, 000h, 000h, 04Dh, 049h, 047h, 02Dh, 032h, 033h, 000h, 020h, 046h, 06Ch, 06Fh
    db 067h, 067h, 065h, 072h, 000h, 000h, 000h, 0E4h, 002h, 030h, 002h, 003h, 000h
_var_23 db 011h
    db 000h, 00Ah, 000h, 002h, 000h, 000h, 000h, 04Dh, 049h, 047h, 02Dh, 032h, 035h, 000h, 020h, 046h
    db 06Fh, 078h, 062h, 061h, 074h, 000h, 000h, 000h, 000h, 03Ah, 002h, 0BCh, 002h, 002h, 000h, 012h
    db 000h, 000h, 000h, 002h, 000h, 000h, 000h, 04Dh, 049h, 047h, 02Dh, 032h, 039h, 000h, 020h, 046h
    db 075h, 06Ch, 063h, 072h, 075h, 06Dh, 000h, 000h, 000h, 0BCh, 002h, 090h, 001h, 005h, 000h, 013h
    db 000h, 014h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 031h, 000h, 000h, 000h, 000h, 020h, 04Dh
    db 069h, 072h, 061h, 067h, 065h, 000h, 000h, 000h, 000h, 016h, 003h, 0A2h, 003h, 003h, 000h, 014h
    db 000h, 000h, 000h, 002h, 000h, 000h, 000h, 053h, 075h, 02Dh, 032h, 037h, 000h, 000h, 020h, 046h
    db 06Ch, 061h, 06Eh, 06Bh, 065h, 072h, 000h, 000h, 000h, 0D5h, 002h, 0CBh, 002h, 004h, 000h, 013h
    db 000h, 014h, 000h, 002h, 000h, 000h, 000h, 049h, 04Ch, 02Dh, 037h, 036h, 000h, 000h, 020h, 04Dh
    db 061h, 069h, 06Eh, 073h, 074h, 061h, 079h, 000h, 000h, 090h, 001h, 0A0h, 00Fh, 001h, 000h, 010h
    db 000h, 00Ch, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 034h, 045h, 000h, 000h, 000h, 020h, 050h
    db 068h, 061h, 06Eh, 074h, 06Fh, 06Dh, 000h, 000h, 000h, 020h, 003h, 008h, 002h, 004h, 000h, 012h
    db 000h, 00Bh, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 031h, 034h, 000h, 000h, 000h, 020h, 054h
    db 06Fh, 06Dh, 063h, 061h, 074h, 000h, 000h, 000h, 000h, 020h, 003h, 020h, 003h, 004h, 000h, 013h
    db 000h, 008h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 031h, 038h, 000h, 000h, 000h, 020h, 048h
    db 06Fh, 072h, 06Eh, 065h, 074h, 000h, 000h, 000h, 000h, 094h, 002h, 0CDh, 001h, 005h, 000h, 0FFh
    db 0FFh, 000h, 000h, 002h, 000h, 000h, 000h, 041h, 06Eh, 02Dh, 037h, 032h, 000h, 000h, 020h, 043h
    db 06Fh, 061h, 06Ch, 065h, 072h, 000h, 000h, 000h, 000h, 05Eh, 001h, 06Ch, 002h, 002h, 000h, 000h
    db 000h, 009h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 031h, 038h, 000h, 000h, 000h, 020h, 048h
    db 06Fh, 072h, 06Eh, 065h, 074h, 000h, 000h, 000h, 000h, 094h, 002h, 0CDh, 001h, 005h, 000h, 0FFh
    db 0FFh, 004h, 000h, 002h, 000h, 000h, 000h, 04Dh, 049h, 047h, 02Dh, 032h, 033h, 000h, 020h, 046h
    db 06Ch, 06Fh, 067h, 067h, 065h, 072h, 000h, 000h, 000h, 0E4h, 002h, 030h, 002h, 003h, 000h, 000h
    db 000h, 004h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 031h, 034h, 000h, 000h, 000h, 020h, 054h
    db 06Fh, 06Dh, 063h, 061h, 074h, 000h, 000h, 000h, 000h, 020h, 003h, 020h, 003h, 004h, 000h, 0FFh
    db 0FFh, 008h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 034h, 045h, 000h, 000h, 000h, 020h, 050h
    db 068h, 061h, 06Eh, 074h, 06Fh, 06Dh, 000h, 000h, 000h, 020h, 003h, 008h, 002h, 004h, 000h, 0FFh
    db 0FFh, 00Bh, 000h, 002h, 000h, 000h, 000h, 04Dh, 049h, 047h, 02Dh, 031h, 037h, 000h, 020h, 046h
    db 072h, 065h, 073h, 063h, 06Fh, 000h, 000h, 000h, 000h, 026h, 002h, 02Ch, 001h, 003h, 000h, 011h
    db 000h, 010h, 000h, 002h, 000h, 000h, 000h, 054h, 075h, 02Dh, 039h, 035h, 000h, 000h, 020h, 042h
    db 065h, 061h, 072h, 000h, 000h, 000h, 000h, 000h, 000h, 09Ah, 001h, 0ECh, 013h, 001h, 000h, 000h
    db 000h, 012h, 000h, 002h, 000h, 000h, 000h, 04Dh, 069h, 02Dh, 032h, 034h, 000h, 000h, 020h, 048h
    db 069h, 06Eh, 064h, 000h, 000h, 000h, 000h, 000h, 000h, 0C8h, 000h, 02Ch, 001h, 001h, 000h, 011h
    db 000h, 013h, 000h, 002h, 000h, 000h, 000h, 046h, 02Dh, 035h, 000h, 000h, 000h, 000h, 020h, 054h
    db 069h, 067h, 065h, 072h, 000h, 000h, 000h, 000h, 000h, 0F4h, 001h, 0FAh, 000h, 003h, 000h, 016h
    db 000h, 016h, 000h, 002h, 000h, 000h, 000h, 037h, 036h, 037h, 000h, 000h, 000h, 000h, 020h, 042h
    db 06Fh, 065h, 069h, 06Eh, 067h, 000h, 000h, 000h, 000h, 090h, 001h, 0E8h, 003h, 001h, 000h, 0FFh
    db 0FFh, 012h, 000h, 002h, 000h, 000h, 000h, 04Eh, 06Fh, 06Eh, 065h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 001h, 000h, 013h, 000h, 053h, 041h, 02Dh, 032h, 000h, 000h, 000h
    db 000h, 07Dh, 000h, 0D0h, 007h, 001h, 000h, 004h, 000h, 013h, 000h, 053h, 041h, 02Dh, 035h, 000h
    db 000h, 000h, 000h, 096h, 000h, 008h, 007h, 001h, 000h, 001h, 000h, 013h, 000h, 053h, 041h, 02Dh
    db 038h, 042h, 000h, 000h, 000h, 041h, 000h, 0B0h, 004h, 002h, 000h, 003h, 000h, 013h, 000h, 053h
    db 041h, 02Dh, 031h, 030h, 000h, 000h, 000h, 07Dh, 000h, 008h, 007h, 003h, 000h, 002h, 000h, 013h
    db 000h, 053h, 041h, 02Dh, 031h, 031h, 000h, 000h, 000h, 064h, 000h, 0DCh, 005h, 002h, 000h, 003h
    db 000h, 013h, 000h, 053h, 041h, 02Dh, 031h, 032h, 000h, 000h, 000h, 096h, 000h, 0D0h, 007h, 003h
    db 000h, 002h, 000h, 013h, 000h, 053h, 041h, 02Dh, 031h, 033h, 000h, 000h, 000h, 041h, 000h, 084h
    db 003h, 000h, 000h, 004h, 000h, 013h, 000h, 053h, 041h, 02Dh, 04Eh, 02Dh, 034h, 000h, 000h, 01Eh
    db 000h, 0B0h, 004h, 002h, 000h, 003h, 000h, 013h, 000h, 053h, 041h, 02Dh, 04Eh, 02Dh, 035h, 000h
    db 000h, 01Eh, 000h, 084h, 003h, 0FFh, 0FFh, 004h, 000h, 013h, 000h, 053h, 041h, 02Dh, 04Eh, 02Dh
    db 036h, 000h, 000h, 07Dh, 000h, 008h, 007h, 003h, 000h, 002h, 000h, 013h, 000h, 053h, 041h, 02Dh
    db 04Eh, 02Dh, 037h, 000h, 000h, 064h, 000h, 0DCh, 005h, 002h, 000h, 003h, 000h, 013h, 000h, 048h
    db 061h, 077h, 06Bh, 000h, 000h, 000h, 000h, 07Dh, 000h, 084h, 003h, 002h, 000h, 003h, 000h, 013h
    db 000h, 052h, 061h, 070h, 069h, 065h, 072h, 000h, 000h, 041h, 000h, 0B0h, 004h, 002h, 000h, 004h
    db 000h, 013h, 000h, 054h, 069h, 067h, 065h, 072h, 000h, 000h, 000h, 01Eh, 000h, 084h, 003h, 001h
    db 000h, 003h, 000h, 013h, 000h, 053h, 065h, 061h, 063h, 061h, 074h, 000h, 000h, 01Eh, 000h, 084h
    db 003h, 001h, 000h, 003h, 000h, 013h, 000h, 041h, 041h, 02Dh, 032h, 000h, 000h, 000h, 000h, 00Eh
    db 000h, 0DCh, 005h, 0FFh, 0FFh, 004h, 000h, 013h, 000h, 041h, 041h, 02Dh, 038h, 000h, 000h, 000h
    db 000h, 00Ch, 000h, 008h, 007h, 000h, 000h, 005h, 000h, 013h, 000h, 041h, 041h, 02Dh, 036h, 000h
    db 000h, 000h, 000h, 032h, 000h, 060h, 009h, 002h, 000h, 002h, 000h, 013h, 000h, 041h, 041h, 02Dh
    db 037h, 000h, 000h, 000h, 000h, 022h, 000h, 008h, 007h, 002h, 000h, 002h, 000h, 013h, 000h, 041h
    db 041h, 02Dh, 039h, 000h, 000h, 000h, 000h, 052h, 000h, 0D0h, 007h, 002h, 000h, 003h, 000h, 013h
    db 000h, 041h, 041h, 02Dh, 031h, 030h, 000h, 000h, 000h, 040h, 000h, 0D0h, 007h, 003h, 000h, 004h
    db 000h, 013h, 000h, 041h, 049h, 04Dh, 031h, 032h, 030h, 000h, 000h, 020h, 000h, 060h, 009h, 007h
    db 000h, 004h, 000h, 001h, 000h, 041h, 049h, 04Dh, 02Dh, 039h, 000h, 000h, 000h, 011h, 000h, 0D0h
    db 007h, 007h, 000h, 008h, 000h, 001h, 000h, 048h, 041h, 052h, 04Dh, 000h, 000h, 000h, 000h, 014h
    db 000h, 0B0h, 004h, 004h, 000h, 002h, 000h, 001h, 000h, 050h, 065h, 06Eh, 067h, 075h, 069h, 06Eh
    db 000h, 020h, 000h, 0F4h, 001h, 005h, 000h, 002h, 000h, 013h, 000h, 048h, 061h, 072h, 070h, 06Fh
    db 06Fh, 06Eh, 000h, 03Ch, 000h, 0F4h, 001h, 005h, 000h, 002h, 000h, 013h, 000h, 041h, 047h, 04Dh
    db 02Dh, 036h, 035h, 000h, 000h, 020h, 000h, 020h, 003h, 006h, 000h, 002h, 000h, 00Dh, 000h, 04Ch
    db 047h, 042h, 04Fh, 04Dh, 042h, 000h, 000h, 00Ah, 000h, 000h, 000h, 01Ch, 000h, 002h, 000h, 00Fh
    db 000h, 052h, 054h, 042h, 04Fh, 04Dh, 042h, 000h, 000h, 000h, 000h, 000h, 000h, 01Dh, 000h, 002h
    db 000h, 00Fh, 000h, 046h, 046h, 042h, 04Fh, 04Dh, 042h, 000h, 000h, 000h, 000h, 000h, 000h, 01Eh
    db 000h, 002h, 000h, 00Fh, 000h, 041h, 049h, 04Dh, 02Dh, 037h, 057h, 000h, 000h, 02Ch, 000h, 060h
    db 009h, 002h, 000h, 004h, 000h, 001h, 000h, 041h, 049h, 04Dh, 02Dh, 039h, 057h, 000h, 000h, 00Ch
    db 000h, 0D0h, 007h, 000h, 000h, 005h, 000h, 001h, 000h, 053h, 041h, 02Dh, 031h, 034h, 000h, 000h
    db 000h, 010h, 000h, 084h, 003h, 000h, 000h, 005h, 000h, 001h, 000h, 041h, 041h, 02Dh, 036h, 000h
    db 000h, 000h, 000h, 032h, 000h, 060h, 009h, 0FFh, 0FFh, 002h, 000h, 013h, 000h, 041h, 041h, 02Dh
    db 037h, 000h, 000h, 000h, 000h, 022h, 000h, 008h, 007h, 0FFh, 0FFh, 002h, 000h, 013h, 000h, 041h
    db 041h, 02Dh, 039h, 000h, 000h, 000h, 000h, 052h, 000h, 0D0h, 007h, 0FFh, 0FFh, 003h, 000h, 013h
    db 000h, 041h, 041h, 02Dh, 031h, 030h, 000h, 000h, 000h, 040h, 000h, 0D0h, 007h, 000h, 000h, 004h
    db 000h, 013h, 000h, 045h, 071h, 075h, 069h, 070h, 02Eh, 000h, 000h, 000h, 000h, 000h, 000h, 01Dh
    db 000h, 000h, 000h, 00Eh, 000h, 000h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 006h, 000h, 001h
    db 000h, 007h, 000h, 003h, 000h, 006h, 000h, 002h, 000h, 005h, 000h, 007h, 000h, 004h, 000h, 002h
    db 000h, 005h, 000h, 003h, 000h, 008h, 000h, 000h, 000h, 008h, 000h, 000h, 000h, 00Ah, 000h, 00Bh
    db 000h, 00Bh, 000h, 009h, 000h, 00Ch, 000h, 00Dh, 000h, 00Ch, 000h, 00Eh, 000h, 00Dh, 000h, 00Eh
    db 000h, 00Fh, 000h, 000h, 000h, 004h, 000h, 088h, 013h, 000h, 000h, 00Ch, 000h, 012h, 000h, 003h
    db 000h, 001h, 000h, 003h, 000h, 010h, 000h, 001h, 000h, 005h, 000h, 003h, 000h, 009h, 000h, 003h
    db 000h, 000h, 000h, 08Ah, 002h, 000h, 000h, 001h, 000h, 001h, 000h
_var_24 db 001h
    db 000h, 000h, 000h, 001h, 000h, 001h, 000h, 004h, 000h, 041h, 049h, 04Dh, 02Dh, 039h, 04Dh, 000h
    db 000h, 000h, 000h, 053h, 069h, 064h, 065h, 077h, 069h, 06Eh, 064h, 065h, 072h, 000h, 000h, 017h
    db 000h, 004h, 000h, 041h, 049h, 04Dh, 02Dh, 031h, 032h, 030h, 000h, 000h, 000h, 041h, 04Dh, 052h
    db 041h, 041h, 04Dh, 000h, 000h, 000h, 000h, 000h, 000h, 016h, 000h, 003h, 000h, 041h, 047h, 04Dh
    db 02Dh, 038h, 038h, 041h, 000h, 000h, 000h, 048h, 041h, 052h, 04Dh, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 018h, 000h, 001h, 000h, 050h, 033h, 020h, 041h, 053h, 04Dh, 000h, 000h, 000h
    db 000h, 050h, 065h, 06Eh, 067h, 075h, 069h, 06Eh, 000h, 000h, 000h, 000h, 000h, 019h, 000h, 002h
    db 000h, 041h, 047h, 04Dh, 02Dh, 038h, 036h, 041h, 000h, 000h, 000h, 048h, 061h, 072h, 070h, 06Fh
    db 06Fh, 06Eh, 000h, 000h, 000h, 000h, 000h, 01Ah, 000h, 001h, 000h, 041h, 047h, 04Dh, 02Dh, 036h
    db 035h, 044h, 000h, 000h, 000h, 04Dh, 061h, 076h, 065h, 072h, 069h, 063h, 06Bh, 000h, 000h, 000h
    db 000h, 01Bh, 000h, 002h, 000h, 047h, 042h, 055h, 02Dh, 031h, 032h, 000h, 000h, 000h, 000h, 050h
    db 061h, 076h, 065h, 077h, 061h, 079h, 000h, 000h, 000h, 000h, 000h, 01Ch, 000h, 002h, 000h, 04Dh
    db 06Bh, 020h, 032h, 030h, 000h, 000h, 000h, 000h, 000h, 052h, 06Fh, 063h, 06Bh, 065h, 079h, 065h
    db 000h, 000h, 000h, 000h, 000h, 01Dh, 000h, 002h, 000h, 044h, 06Eh, 064h, 06Ch, 000h, 000h, 000h
    db 000h, 000h, 000h, 044h, 075h, 072h, 061h, 06Eh, 064h, 061h, 06Ch, 000h, 000h, 000h, 000h, 01Dh
    db 000h, 002h, 000h, 04Dh, 06Bh, 020h, 038h, 032h, 02Dh, 030h, 000h, 000h, 000h, 053h, 06Ch, 069h
    db 063h, 06Bh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 01Eh, 000h, 003h, 000h, 04Dh, 06Bh, 020h
    db 038h, 032h, 02Dh, 031h, 000h, 000h, 000h, 053h, 06Eh, 061h, 06Bh, 065h, 079h, 065h, 000h, 000h
    db 000h, 000h, 000h, 01Dh, 000h, 003h, 000h, 04Dh, 06Bh, 020h, 032h, 030h, 000h, 000h, 000h, 000h
    db 000h, 052h, 06Fh, 063h, 06Bh, 065h, 079h, 065h, 020h, 049h, 049h, 000h, 000h, 01Ch, 000h, 002h
    db 000h, 04Dh, 06Bh, 020h, 031h, 032h, 032h, 000h, 000h, 000h, 000h, 046h, 069h, 072h, 065h, 065h
    db 079h, 065h, 000h, 000h, 000h, 000h, 000h, 01Eh, 000h, 002h, 000h, 043h, 042h, 055h, 02Dh, 037h
    db 032h, 000h, 000h, 000h, 000h, 046h, 075h, 065h, 06Ch, 02Dh, 041h, 069h, 072h, 000h, 000h, 000h
    db 000h, 01Ch, 000h, 002h, 000h, 04Dh, 06Bh, 020h, 033h, 035h, 000h, 000h, 000h, 000h, 000h, 049h
    db 04Eh, 020h, 043h, 06Ch, 075h, 073h, 074h, 065h, 072h, 000h, 000h, 01Dh, 000h, 002h, 000h, 049h
    db 053h, 043h, 020h, 042h, 02Dh, 031h, 000h, 000h, 000h, 04Dh, 069h, 06Eh, 065h, 06Ch, 065h, 074h
    db 073h, 000h, 000h, 000h, 000h, 01Dh, 000h, 001h, 000h, 031h, 033h, 035h, 020h, 06Dh, 06Dh, 000h
    db 000h, 000h, 000h, 043h, 061h, 06Dh, 065h, 072h, 061h, 000h, 000h, 000h, 000h, 000h, 000h, 0FFh
    db 0FFh, 001h, 000h, 031h, 039h, 030h, 030h, 06Ch, 062h, 073h, 000h, 000h, 000h, 045h, 078h, 074h
    db 072h, 061h, 020h, 046h, 075h, 065h, 06Ch, 000h, 000h, 0FEh, 0FFh, 001h, 000h, 032h, 030h, 020h
    db 06Dh, 06Dh, 000h, 000h, 000h, 000h, 000h, 047h, 075h, 06Eh, 073h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 001h, 000h, 053h, 070h, 065h, 063h, 069h, 061h, 06Ch, 000h, 000h
    db 000h, 045h, 071h, 075h, 069h, 070h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 026h, 000h, 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 006h, 000h, 000h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 006h, 002h, 001h, 002h, 002h, 003h, 004h, 003h, 003h, 004h, 004h, 004h, 001h, 002h, 004h
    db 001h, 002h, 004h, 005h, 005h, 004h, 004h, 005h, 004h, 004h, 000h, 003h, 000h, 000h, 004h, 004h
    db 000h, 000h, 005h, 005h, 004h, 004h, 005h, 000h, 004h, 000h, 008h, 000h, 000h, 002h, 001h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 003h, 001h, 003h, 004h, 001h, 001h, 004h, 002h, 003h, 003h
    db 004h, 000h, 003h, 000h, 001h, 004h, 004h, 000h, 000h, 004h, 000h, 002h, 000h, 004h, 000h, 000h
    db 000h, 000h, 004h, 004h, 000h, 000h, 004h, 004h, 004h, 004h, 004h, 000h, 003h, 002h, 000h, 004h
    db 004h, 000h, 002h, 005h, 003h, 003h, 002h, 005h, 001h, 003h, 004h, 000h, 000h, 006h, 000h, 005h
    db 000h, 000h, 000h, 004h, 000h, 005h, 002h, 001h, 000h, 006h, 004h, 000h, 000h, 006h, 006h, 003h
    db 006h, 006h, 000h, 003h, 000h, 006h, 000h, 003h, 000h, 000h, 002h, 003h, 000h, 000h, 003h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 004h, 004h, 000h
    db 002h, 004h, 004h, 003h, 004h, 005h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 003h, 000h, 002h, 000h, 001h, 000h, 000h
    db 000h, 0FFh, 0FFh, 0FEh, 0FFh, 0FFh, 0FFh, 003h, 000h, 002h, 000h, 002h, 000h, 002h, 000h, 001h
    db 000h, 001h, 000h, 001h, 000h, 002h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 002h, 000h, 002h
    db 000h, 002h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h
    db 000h, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 003h, 000h, 003h, 000h, 003h, 000h, 0FDh, 0FFh, 0FDh
    db 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FEh, 0FFh, 0FEh, 0FFh, 0FEh
    db 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FEh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FEh
    db 0FFh, 0FEh, 0FFh, 0FEh, 0FFh, 0FDh, 0FFh, 001h, 000h, 002h, 000h, 001h, 000h, 000h, 000h, 0FFh
    db 0FFh, 0FEh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 002h, 000h, 003h, 000h, 002h, 000h, 002h, 000h, 001h
    db 000h, 001h, 000h, 001h, 000h, 0FEh, 0FFh, 004h, 000h, 004h, 000h, 003h, 000h, 002h, 000h, 001h
    db 000h, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 0FEh
    db 0FFh, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 0FCh, 0FFh, 0FCh, 0FFh, 004h
    db 000h, 004h, 000h, 004h, 000h, 004h, 000h, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 004h
    db 000h, 004h, 000h, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 002h, 000h, 0FCh
    db 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FFh, 0FFh, 0FDh
    db 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 002h, 000h, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FEh
    db 0FFh, 0FEh, 0FFh, 0FDh, 0FFh, 0FFh, 0FFh, 002h, 000h, 003h, 000h, 002h, 000h, 002h, 000h, 001h
    db 000h, 001h, 000h, 0FFh, 0FFh, 0FEh, 0FFh, 004h, 000h, 004h, 000h, 003h, 000h, 002h, 000h, 001h
    db 000h, 004h, 000h, 0FCh, 0FFh, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 004h, 000h, 000h
    db 001h, 004h, 000h, 000h, 001h, 000h, 001h, 000h, 001h, 004h, 000h, 0FCh, 0FFh, 0FCh, 0FFh, 000h
    db 002h, 004h, 000h, 000h, 001h, 000h, 001h, 000h, 001h, 000h, 001h, 0FCh, 0FFh, 000h, 002h, 004h
    db 000h, 004h, 000h, 0FCh, 0FFh, 000h, 001h, 000h, 001h, 000h, 001h, 0FCh, 0FFh, 004h, 000h, 0FCh
    db 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 004h, 000h, 000h, 001h, 0FFh, 0FFh, 0FDh
    db 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 002h, 000h, 001h, 000h, 0FFh, 0FFh, 0FFh, 0FFh, 0FEh
    db 0FFh, 0FEh, 0FFh, 0FDh, 0FFh, 0FFh, 0FFh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 007h, 000h, 004h, 000h, 001h, 000h, 02Fh
    db 000h, 000h, 000h, 00Fh, 000h, 007h, 000h, 004h, 000h, 001h, 000h, 02Fh, 000h, 000h, 000h, 00Fh
    db 000h, 001h, 000h, 003h, 000h, 001h, 000h, 03Ah, 000h, 000h, 000h, 00Fh, 000h, 006h, 000h, 003h
    db 000h, 001h, 000h, 03Ah, 000h, 000h, 000h, 00Fh, 000h, 003h, 000h, 001h, 000h, 002h, 000h, 000h
    db 000h, 000h, 000h, 00Fh, 000h, 006h, 000h, 002h, 000h, 002h, 000h, 000h, 000h, 000h, 000h, 00Fh
    db 000h, 006h, 000h, 002h, 000h, 003h, 000h, 000h, 000h, 001h, 000h, 00Fh, 000h, 007h, 000h, 001h
    db 000h, 004h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 006h, 000h, 002h, 000h, 004h, 000h, 000h
    db 000h, 000h, 000h, 00Fh, 000h, 001h, 000h, 001h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 00Fh
    db 000h, 007h, 000h, 002h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 007h, 000h, 001h
    db 000h, 006h, 000h, 000h, 000h, 009h, 000h, 00Fh, 000h, 004h, 000h, 002h, 000h, 006h, 000h, 000h
    db 000h, 009h, 000h, 00Fh, 000h, 003h, 000h, 001h, 000h, 007h, 000h, 000h, 000h, 004h, 000h, 00Fh
    db 000h, 007h, 000h, 002h, 000h, 007h, 000h, 000h, 000h, 004h, 000h, 00Fh, 000h, 007h, 000h, 001h
    db 000h, 016h, 000h, 000h, 000h, 005h, 000h, 00Fh, 000h, 007h, 000h, 002h, 000h, 016h, 000h, 000h
    db 000h, 005h, 000h, 00Fh, 000h, 007h, 000h, 001h, 000h, 016h, 000h, 000h, 000h, 006h, 000h, 00Fh
    db 000h, 007h, 000h, 002h, 000h, 016h, 000h, 000h, 000h, 006h, 000h, 00Fh, 000h, 003h, 000h, 001h
    db 000h, 016h, 000h, 022h, 000h, 006h, 000h, 00Fh, 000h, 007h, 000h, 002h, 000h, 016h, 000h, 022h
    db 000h, 006h, 000h, 003h, 000h, 003h, 000h, 001h, 000h, 017h, 000h, 000h, 000h, 00Bh, 000h, 003h
    db 000h, 007h, 000h, 002h, 000h, 017h, 000h, 002h, 000h, 00Bh, 000h, 00Fh, 000h, 001h, 000h, 001h
    db 000h, 00Ah, 000h, 000h, 000h, 003h, 000h, 00Fh, 000h, 006h, 000h, 002h, 000h, 00Ah, 000h, 000h
    db 000h, 003h, 000h, 00Fh, 000h, 007h, 000h, 001h, 000h, 00Ch, 000h, 000h, 000h, 007h, 000h, 003h
    db 000h, 007h, 000h, 002h, 000h, 00Ch, 000h, 002h, 000h, 007h, 000h, 003h, 000h, 007h, 000h, 002h
    db 000h, 00Ch, 000h, 000h, 000h, 007h, 000h, 003h, 000h, 007h, 000h, 001h, 000h, 00Dh, 000h, 000h
    db 000h, 001h, 000h, 003h, 000h, 007h, 000h, 002h, 000h, 00Dh, 000h, 000h, 000h, 001h, 000h, 002h
    db 000h, 003h, 000h, 001h, 000h, 00Eh, 000h, 000h, 000h, 008h, 000h, 002h, 000h, 007h, 000h, 002h
    db 000h, 00Eh, 000h, 000h, 000h, 008h, 000h, 003h, 000h, 003h, 000h, 001h, 000h, 00Fh, 000h, 000h
    db 000h, 002h, 000h, 003h, 000h, 007h, 000h, 002h, 000h, 00Fh, 000h, 000h, 000h, 002h, 000h, 00Fh
    db 000h, 003h, 000h, 001h, 000h, 010h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 006h, 000h, 002h
    db 000h, 010h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 003h, 000h, 001h, 000h, 011h, 000h, 022h
    db 000h, 000h, 000h, 003h, 000h, 007h, 000h, 002h, 000h, 011h, 000h, 022h, 000h, 000h, 000h, 00Fh
    db 000h, 003h, 000h, 001h, 000h, 012h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 006h, 000h, 002h
    db 000h, 012h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 001h, 000h, 001h, 000h, 013h, 000h, 000h
    db 000h, 000h, 000h, 00Fh, 000h, 007h, 000h, 002h, 000h, 013h, 000h, 000h, 000h, 000h, 000h, 00Bh
    db 000h, 007h, 000h, 001h, 000h, 009h, 000h, 000h, 000h, 000h, 000h, 00Bh, 000h, 007h, 000h, 002h
    db 000h, 009h, 000h, 000h, 000h, 000h, 000h, 00Ch, 000h, 006h, 000h, 002h, 000h, 009h, 000h, 002h
    db 000h, 000h, 000h, 00Fh, 000h, 006h, 000h, 001h, 000h, 014h, 000h, 000h, 000h, 000h, 000h, 00Fh
    db 000h, 006h, 000h, 002h, 000h, 014h, 000h, 000h, 000h, 000h, 000h, 00Ch, 000h, 006h, 000h, 005h
    db 000h, 015h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 007h, 000h, 005h
dat_0f89 db 000h
    db 015h, 000h, 000h, 000h, 000h, 000h, 00Ch, 000h, 006h, 000h, 007h, 000h, 015h, 000h, 000h, 000h
    db 000h, 000h, 003h, 000h, 003h, 000h, 007h, 000h, 015h, 000h, 000h, 000h, 000h, 000h, 00Bh, 000h
    db 001h, 000h, 007h, 000h, 015h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 003h, 000h, 006h, 000h
    db 015h, 000h, 000h, 000h, 0F1h, 0FFh, 00Ch, 000h, 006h, 000h, 008h, 000h, 015h, 000h, 000h, 000h
    db 0F1h, 0FFh, 00Dh, 000h, 006h, 000h, 008h, 000h, 015h, 000h, 000h, 000h, 0FBh, 0FFh, 00Fh, 000h
    db 007h, 000h, 008h, 000h, 015h, 000h, 000h, 000h, 0FEh, 0FFh, 000h, 000h, 000h, 000h
_var_25 db 000h
str_overlayRelError db 045h
    db 072h, 072h, 06Fh, 072h, 020h, 072h, 065h, 06Ch, 065h, 061h, 073h, 069h, 06Eh, 067h, 020h, 06Fh
    db 076h, 065h, 072h, 06Ch, 061h, 079h, 020h, 06Dh, 065h, 06Dh, 06Fh, 072h, 079h, 024h
gfx_jump_0_alloc proc far               ; 0x1008
    db 0EAh
    dd 0
gfx_jump_0_alloc endp
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_jump_05_drawString proc far               ; 0x1021
    db 0EAh
    dd 0
gfx_jump_05_drawString endp
_gfx_jump_05_drawString equ gfx_jump_05_drawString
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h
    db 000h, 000h, 000h
gfx_jump_0d_setCurBuf proc far               ; 0x1049
    db 0EAh
    dd 0
gfx_jump_0d_setCurBuf endp
gfx_jump_0e_setCurBuf proc far               ; 0x104E
    db 0EAh
    dd 0
gfx_jump_0e_setCurBuf endp
gfx_jump_0f_getBufPtr proc far               ; 0x1053
    db 0EAh
    dd 0
gfx_jump_0f_getBufPtr endp
gfx_jump_10_getCurBuf proc far               ; 0x1058
    db 0EAh
    dd 0
gfx_jump_10_getCurBuf endp
gfx_jump_11_blitSprite proc far               ; 0x105D
    db 0EAh
    dd 0
gfx_jump_11_blitSprite endp
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h
gfx_jump_17_bufSize proc far               ; 0x107B
    db 0EAh
    dd 0
gfx_jump_17_bufSize endp
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h
gfx_jump_1a proc far               ; 0x108A
    db 0EAh
    dd 0
gfx_jump_1a endp
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_jump_1f proc far               ; 0x10A3
    db 0EAh
    dd 0
gfx_jump_1f endp
gfx_jump_20_setVal proc far               ; 0x10A8
    db 0EAh
    dd 0
gfx_jump_20_setVal endp
gfx_jump_21 proc far               ; 0x10AD
    db 0EAh
    dd 0
gfx_jump_21 endp
gfx_jump_22 proc far               ; 0x10B2
    db 0EAh
    dd 0
gfx_jump_22 endp
gfx_jump_23 proc far               ; 0x10B7
    db 0EAh
    dd 0
gfx_jump_23 endp
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_jump_28 proc far               ; 0x10D0
    db 0EAh
    dd 0
gfx_jump_28 endp
gfx_jump_29_switchColor proc far               ; 0x10D5
    db 0EAh
    dd 0
gfx_jump_29_switchColor endp
gfx_jump_2a proc far               ; 0x10DA
    db 0EAh
    dd 0
gfx_jump_2a endp
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_jump_2f_charWidth proc far               ; 0x10F3
    db 0EAh
    dd 0
gfx_jump_2f_charWidth endp
_gfx_jump_2f_charWidth equ gfx_jump_2f_charWidth
    db 0EAh, 000h, 000h, 000h, 000h
gfx_jump_31 proc far               ; 0x10FD
    db 0EAh
    dd 0
gfx_jump_31 endp
    db 0EAh, 000h, 000h, 000h, 000h
gfx_jump_33_fillRow proc far               ; 0x1107
    db 0EAh
    dd 0
gfx_jump_33_fillRow endp
gfx_jump_34_fillRow proc far               ; 0x110C
    db 0EAh
    dd 0
gfx_jump_34_fillRow endp
gfx_jump_35 proc far               ; 0x1111
    db 0EAh
    dd 0
gfx_jump_35 endp
gfx_jump_36_null proc far               ; 0x1116
    db 0EAh
    dd 0
gfx_jump_36_null endp
thunk_EXT_FUN_0000 proc far               ; 0x111B
    db 0EAh
    dd 0
thunk_EXT_FUN_0000 endp
gfx_jump_38_getPageBuf proc far               ; 0x1120
    db 0EAh
    dd 0
gfx_jump_38_getPageBuf endp
    db 0EAh, 000h, 000h, 000h, 000h
gfx_jump_3a_getRowOffset proc far               ; 0x112A
    db 0EAh
    dd 0
gfx_jump_3a_getRowOffset endp
gfx_jump_3b_clearBuf proc far               ; 0x112F
    db 0EAh
    dd 0
gfx_jump_3b_clearBuf endp
    db 0EAh, 000h, 000h, 000h, 000h
gfx_jump_3d_null proc far               ; 0x1139
    db 0EAh
    dd 0
gfx_jump_3d_null endp
gfx_jump_3e proc far               ; 0x113E
    db 0EAh
    dd 0
gfx_jump_3e endp
    db 0EAh, 000h, 000h, 000h, 000h
gfx_jump_40 proc far               ; 0x1148
    db 0EAh
    dd 0
gfx_jump_40 endp
gfx_jump_41 proc far               ; 0x114D
    db 0EAh
    dd 0
gfx_jump_41 endp
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h
gfx_jump_44_setDac proc far               ; 0x115C
    db 0EAh
    dd 0
gfx_jump_44_setDac endp
gfx_jump_45_retrace proc far               ; 0x1161
    db 0EAh
    dd 0
gfx_jump_45_retrace endp
gfx_jump_46_retrace2 proc far               ; 0x1166
    db 0EAh
    dd 0
gfx_jump_46_retrace2 endp
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_jump_4b_storeBufPtr proc far               ; 0x117F
    db 0EAh
    dd 0
gfx_jump_4b_storeBufPtr endp
    db 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh
    db 000h, 000h, 000h, 000h
gfx_jump_50 proc far               ; 0x1198
    db 0EAh
    dd 0
gfx_jump_50 endp
gfx_jump_51_null proc far               ; 0x119D
    db 0EAh
    dd 0
gfx_jump_51_null endp
gfx_jump_52 proc far               ; 0x11A2
    db 0EAh
    dd 0
gfx_jump_52 endp
gfx_jump_53 proc far               ; 0x11A7
    db 0EAh
    dd 0
gfx_jump_53 endp
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
misc_jump_5a_keybuf proc far               ; 0x11CA
    db 0EAh
    dd 0
misc_jump_5a_keybuf endp
misc_jump_5b_getkey proc far               ; 0x11CF
    db 0EAh
    dd 0
misc_jump_5b_getkey endp
    db 0EAh, 000h, 000h, 000h, 000h
misc_jump_5d_readJoy proc far               ; 0x11D9
    db 0EAh
    dd 0
misc_jump_5d_readJoy endp
misc_jump_5e_clearKeyFlags proc far               ; 0x11DE
    db 0EAh
    dd 0
misc_jump_5e_clearKeyFlags endp
PUBLIC _misc_jump_5e_clearKeyFlags
_misc_jump_5e_clearKeyFlags equ misc_jump_5e_clearKeyFlags
    db 0EAh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h
    db 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h
    db 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h
_var_26 db 0EAh
    db 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 0EAh, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h
_var_27 db 000h
    db 000h
_var_28 db 000h
    db 000h
_var_29 db 000h
    db 000h
_var_30 db 000h
    db 000h, 000h
_var_31 db 000h
    db 000h
_var_32 db 000h
    db 000h
_var_33 db 000h
    db 000h
_var_34 db 000h
    db 000h
_var_35 db 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
_var_36 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
dat_14d7 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
dat_1500 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h
_var_37 db 0FFh
    db 0FFh
_var_38 db 000h
    db 000h, 000h
_var_39 db 000h
_var_40 db 000h
_var_41 db 000h
_var_42 db 000h
_var_43 db 000h
_var_44 db 000h
    db 000h
_var_45 db 000h
    db 000h
_var_46 db 03Fh
    db 001h
_var_47 db 06Fh
    db 000h, 000h
_var_48 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_49 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_50 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_51 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_52 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_53 db 000h
    db 000h
_var_54 db 000h
    db 000h, 000h, 000h, 000h, 000h
_var_55 db 000h
_var_56 db 000h
    db 000h, 000h
_var_57 db 000h
_var_58 db 000h
    db 000h
_var_59 db 000h
    db 000h, 000h
_var_60 db 000h
_var_61 db 000h
dat_1606 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
str_fileNotFound db 03Ah
    db 046h, 069h, 06Ch, 065h, 020h, 06Eh, 06Fh, 074h, 020h, 066h, 06Fh, 075h, 06Eh, 064h, 024h
str_noFileBufs db 03Ah
    db 04Eh, 06Fh, 020h, 066h, 069h, 06Ch, 065h, 020h, 062h, 075h, 066h, 066h, 065h, 072h, 073h, 020h
    db 061h, 076h, 061h, 069h, 06Ch, 061h, 062h, 06Ch, 065h, 024h
str_openError db 03Ah
    db 04Fh, 070h, 065h, 06Eh, 020h, 065h, 072h, 072h, 06Fh, 072h, 020h, 024h
str_fileCloseError db 046h
    db 069h, 06Ch, 065h, 020h, 063h, 06Ch, 06Fh, 073h, 069h, 06Eh, 067h, 020h, 065h, 072h, 072h, 06Fh
    db 072h, 024h
str_readError db 052h
    db 065h, 061h, 064h, 020h, 065h, 072h, 072h, 06Fh, 072h, 024h
str_writeError db 057h
    db 072h, 069h, 074h, 065h, 020h, 065h, 072h, 072h, 06Fh, 072h, 024h
dat_1868 db 000h
    db 000h
dat_186A db 000h
    db 000h, 000h, 000h
_var_62 db 000h
    db 000h
_var_63 db 000h
    db 000h
dat_1872 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_64 db 000h
    db 000h
_var_65 db 000h
    db 000h
_var_66 db 000h
    db 000h, 000h, 000h
_var_67 db 000h
    db 000h
_var_68 db 000h
    db 000h
_str_allocError label byte
str_allocError db 049h
    db 06Eh, 073h, 075h, 066h, 066h, 069h, 063h, 069h, 065h, 06Eh, 074h, 020h, 073h, 079h, 073h, 074h
    db 065h, 06Dh, 020h, 06Dh, 065h, 06Dh, 06Fh, 072h, 079h, 020h, 02Dh, 020h, 041h, 06Ch, 06Ch, 06Fh
    db 063h, 042h, 075h, 066h, 066h, 065h, 072h, 024h, 000h
str_deallocError db 042h
    db 075h, 066h, 066h, 065h, 072h, 020h, 064h, 065h, 061h, 06Ch, 06Ch, 06Fh, 063h, 020h, 065h, 072h
    db 072h, 06Fh, 072h, 024h, 000h, 000h
_var_69 db 000h
_var_70 db 000h
    db 000h
_var_71 db 000h
    db 000h
_var_72 db 000h
    db 000h
_var_73 db 000h
    db 000h, 000h, 000h
_var_74 db 000h
    db 000h
_var_75 db 000h
_var_76 db 000h
    db 000h
_var_77 db 000h
    db 000h
_var_78 db 000h
    db 000h
_var_79 db 000h
_var_80 db 000h
    db 000h, 000h, 000h, 000h, 000h
_var_81 db 000h
    db 000h
_var_82 db 000h
_var_83 db 000h
    db 000h, 031h, 073h, 074h, 020h, 04Ch, 069h, 065h, 075h, 074h, 065h, 06Eh, 061h, 06Eh, 074h, 02Eh
    db 000h, 043h, 061h, 070h, 074h, 061h, 069h, 06Eh, 02Eh, 000h, 04Dh, 061h, 06Ah, 06Fh, 072h, 02Eh
    db 000h, 04Ch, 074h, 020h, 043h, 06Fh, 06Ch, 06Fh, 06Eh, 065h, 06Ch, 02Eh, 000h, 043h, 06Fh, 06Ch
    db 06Fh, 06Eh, 065h, 06Ch, 02Eh, 000h, 047h, 065h, 06Eh, 065h, 072h, 061h, 06Ch, 02Eh, 000h, 041h
    db 069h, 072h, 020h, 046h, 06Fh, 072h, 063h, 065h, 020h, 043h, 06Fh, 06Dh, 06Dh, 065h, 06Eh, 064h
    db 061h, 074h, 069h, 06Fh, 06Eh, 020h, 04Dh, 065h, 064h, 061h, 06Ch, 02Eh, 000h, 044h, 069h, 073h
    db 074h, 069h, 06Eh, 067h, 075h, 069h, 073h, 068h, 065h, 064h, 020h, 046h, 06Ch, 079h, 069h, 06Eh
    db 067h, 020h, 043h, 072h, 06Fh, 073h, 073h, 02Eh, 000h, 053h, 069h, 06Ch, 076h, 065h, 072h, 020h
    db 053h, 074h, 061h, 072h, 02Eh, 000h, 041h, 069h, 072h, 020h, 046h, 06Fh, 072h, 063h, 065h, 020h
    db 043h, 072h, 06Fh, 073h, 073h, 02Eh, 000h, 043h, 06Fh, 06Eh, 067h, 072h, 065h, 073h, 073h, 069h
    db 06Fh, 06Eh, 061h, 06Ch, 020h, 04Dh, 065h, 064h, 061h, 06Ch, 020h, 06Fh, 066h, 020h, 048h, 06Fh
    db 06Eh, 06Fh, 072h, 02Eh, 000h
str_deskPic db 064h
    db 065h, 073h, 06Bh, 02Eh, 070h, 069h, 063h, 000h
str_deskMsg1 db 041h
    db 066h, 074h, 065h, 072h, 020h, 064h, 069h, 074h, 063h, 068h, 069h, 06Eh, 067h, 020h, 074h, 068h
    db 072h, 065h, 065h, 020h, 076h, 065h, 072h, 079h, 020h, 065h, 078h, 070h, 065h, 06Eh, 073h, 069h
    db 076h, 065h, 020h, 061h, 069h, 072h, 063h, 072h, 061h, 066h, 074h, 02Ch, 000h
str_deskMsg2 db 079h
    db 06Fh, 075h, 020h, 061h, 072h, 065h, 020h, 061h, 073h, 073h, 069h, 067h, 06Eh, 065h, 064h, 020h
    db 061h, 020h, 064h, 065h, 073h, 06Bh, 020h, 06Ah, 06Fh, 062h, 02Eh, 000h
str_deathPic db 064h
    db 065h, 061h, 074h, 068h, 02Eh, 070h, 069h, 063h, 000h
str_deathMsg1 db 049h
    db 06Eh, 020h, 074h, 068h, 065h, 020h, 077h, 061h, 06Bh, 065h, 020h, 06Fh, 066h, 020h, 074h, 068h
    db 065h, 020h, 068h, 06Fh, 072h, 072h, 069h, 062h, 06Ch, 065h, 020h, 063h, 072h, 061h, 073h, 068h
    db 02Ch, 000h
str_deathMsg2 db 079h
    db 06Fh, 075h, 072h, 020h, 066h, 061h, 06Dh, 069h, 06Ch, 079h, 020h, 061h, 06Eh, 064h, 020h, 066h
    db 072h, 069h, 065h, 06Eh, 064h, 073h, 020h, 06Dh, 06Fh, 075h, 072h, 06Eh, 020h, 079h, 06Fh, 075h
    db 072h, 020h, 06Ch, 06Fh, 073h, 073h, 02Eh, 000h
str_promoPic db 070h
    db 072h, 06Fh, 06Dh, 06Fh, 02Eh, 070h, 069h, 063h, 000h
str_promoMsg1 db 046h
    db 06Fh, 072h, 020h, 079h, 06Fh, 075h, 072h, 020h, 063h, 06Fh, 06Eh, 073h, 069h, 073h, 074h, 065h
    db 06Eh, 074h, 06Ch, 079h, 020h, 073h, 075h, 063h, 063h, 065h, 073h, 073h, 066h, 075h, 06Ch, 020h
    db 06Dh, 069h, 073h, 073h, 069h, 06Fh, 06Eh, 073h, 02Ch, 000h
str_promoMsg2 db 079h
    db 06Fh, 075h, 020h, 068h, 061h, 076h, 065h, 020h, 062h, 065h, 065h, 06Eh, 020h, 070h, 072h, 06Fh
    db 06Dh, 06Fh, 074h, 065h, 064h, 020h, 074h, 06Fh, 020h, 000h
str_medalPic db 06Dh
    db 065h, 064h, 061h, 06Ch, 02Eh, 070h, 069h, 063h, 000h
str_medalMsg1 db 046h
    db 06Fh, 072h, 020h, 079h, 06Fh, 075h, 072h, 020h, 06Fh, 075h, 074h, 073h, 074h, 061h, 06Eh, 064h
    db 069h, 06Eh, 067h, 020h, 070h, 065h, 072h, 066h, 06Fh, 072h, 06Dh, 061h, 06Eh, 063h, 065h, 02Ch
    db 020h, 079h, 06Fh, 075h, 020h, 072h, 065h, 063h, 065h, 069h, 076h, 065h, 000h
str_medalMsg2 db 074h
    db 068h, 065h, 020h, 000h, 000h, 000h, 000h, 000h
_var_84 db 007h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_85 db 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_86 db 00Ah
    db 01Ch, 000h, 000h, 000h, 000h, 009h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 022h, 01Ch
_var_87 db 01Eh
    db 01Ah, 01Fh, 01Ah, 02Fh, 01Ah, 038h, 01Ah, 03Fh, 01Ah, 04Bh, 01Ah, 054h, 01Ah
_var_88 db 0DCh
    db 005h
_var_89 db 000h
    db 000h, 070h, 017h, 000h, 000h, 0E0h, 02Eh, 000h, 000h, 0A8h, 061h, 000h, 000h, 050h, 0C3h, 000h
    db 000h, 0A0h, 086h, 001h, 000h
_var_90 db 05Dh
    db 01Ah, 07Bh, 01Ah, 097h, 01Ah, 0A4h, 01Ah, 0B5h, 01Ah
_var_91 db 0E8h
    db 003h
_var_92 db 000h
    db 000h, 0C4h, 009h, 000h, 000h, 0A0h, 00Fh, 000h, 000h, 000h, 019h, 000h, 000h, 078h, 01Eh, 000h
    db 000h, 004h, 003h, 003h, 002h, 007h, 005h, 003h, 002h, 008h, 007h, 004h, 002h, 008h, 006h, 005h
    db 003h, 006h, 000h, 09Dh, 000h, 0DBh, 000h, 0BDh, 000h, 0D9h, 000h, 093h, 000h, 039h, 000h, 002h
    db 000h, 078h, 000h, 087h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 08Dh, 000h, 000h
    db 000h
_var_93 db 008h
    db 000h
_var_94 db 00Ah
    db 000h
_var_95 db 0E8h
    db 000h
_var_96 db 0B2h
    db 000h
str_pressExit db 050h
    db 072h, 065h, 073h, 073h, 020h, 053h, 065h, 06Ch, 065h, 063h, 074h, 06Fh, 072h, 020h, 074h, 06Fh
    db 020h, 065h, 078h, 069h, 074h, 020h, 044h, 065h, 062h, 072h, 069h, 065h, 066h, 069h, 06Eh, 067h
    db 000h
str_dot1 db 08Dh
    db 000h
str_overall1 db 04Fh
    db 056h, 045h, 052h, 041h, 04Ch, 04Ch, 000h
str_missionRating1 db 04Dh
    db 049h, 053h, 053h, 049h, 04Fh, 04Eh, 020h, 052h, 041h, 054h, 049h, 04Eh, 047h, 000h
str_dot2 db 080h
    db 000h
str_trainingScore db 084h
    db 054h, 072h, 061h, 069h, 06Eh, 069h, 06Eh, 067h, 020h, 053h, 063h, 06Fh, 072h, 065h, 000h
str_notRecorded db 04Eh
    db 04Fh, 054h, 020h, 052h, 065h, 063h, 06Fh, 072h, 064h, 065h, 064h, 020h, 021h, 000h
str_dot3 db 08Dh
    db 000h
str_careerTotal db 043h
    db 041h, 052h, 045h, 045h, 052h, 020h, 054h, 04Fh, 054h, 041h, 04Ch, 000h
str_dot4 db 080h
    db 000h
str_missionSummary db 04Dh
    db 049h, 053h, 053h, 049h, 04Fh, 04Eh, 020h, 053h, 055h, 04Dh, 04Dh, 041h, 052h, 059h, 000h
str_priSecTargets db 050h
    db 072h, 069h, 02Fh, 053h, 065h, 063h, 020h, 054h, 061h, 072h, 067h, 065h, 074h, 073h, 000h
str_otherTargets db 04Fh
    db 074h, 068h, 065h, 072h, 020h, 054h, 061h, 072h, 067h, 065h, 074h, 073h, 000h
str_enemyPlanes db 045h
    db 06Eh, 065h, 06Dh, 079h, 020h, 050h, 06Ch, 061h, 06Eh, 065h, 073h, 000h
str_friendlyTargets db 046h
    db 072h, 069h, 065h, 06Eh, 064h, 06Ch, 079h, 020h, 054h, 061h, 072h, 067h, 065h, 074h, 073h, 000h
str_dot5 db 08Dh
    db 000h
str_overall2 db 04Fh
    db 056h, 045h, 052h, 041h, 04Ch, 04Ch, 000h
str_missionRating2 db 04Dh
    db 049h, 053h, 053h, 049h, 04Fh, 04Eh, 020h, 052h, 041h, 054h, 049h, 04Eh, 047h, 000h
str_dot6 db 080h
    db 000h
str_missionEvent db 04Dh
    db 049h, 053h, 053h, 049h, 04Fh, 04Eh, 020h, 045h, 056h, 045h, 04Eh, 054h, 000h
str_time db 054h
    db 049h, 04Dh, 045h, 03Ah, 020h, 080h, 000h
str_destroyed4 db 020h
    db 000h
str_destroyed1 db 020h
    db 064h, 065h, 073h, 074h, 072h, 06Fh, 079h, 065h, 064h, 000h
str_destroyed2 db 020h
    db 064h, 065h, 073h, 074h, 072h, 06Fh, 079h, 065h, 064h, 000h
str_shotDown2 db 020h
    db 000h
str_shotDown db 020h
    db 073h, 068h, 06Fh, 074h, 020h, 064h, 06Fh, 077h, 06Eh, 000h
str_destroyed3 db 020h
    db 064h, 065h, 073h, 074h, 072h, 06Fh, 079h, 065h, 064h, 000h
str_rearmed3 db 020h
    db 000h
str_rearmed1 db 020h
    db 02Dh, 020h, 052h, 065h, 061h, 072h, 06Dh, 065h, 064h, 02Fh, 052h, 065h, 066h, 075h, 065h, 06Ch
    db 065h, 064h, 000h
str_rearmed2 db 020h
    db 02Dh, 020h, 052h, 065h, 061h, 072h, 06Dh, 065h, 064h, 02Fh, 052h, 065h, 066h, 075h, 065h, 06Ch
    db 065h, 064h, 000h
str_hitBy db 048h
    db 069h, 074h, 020h, 062h, 079h, 020h, 000h
str_missile db 020h
    db 06Dh, 069h, 073h, 073h, 069h, 06Ch, 065h, 000h
str_takeoffPoint db 054h
    db 061h, 06Bh, 065h, 06Fh, 066h, 066h, 020h, 070h, 06Fh, 069h, 06Eh, 074h, 03Ah, 000h
str_missionEnd db 04Dh
    db 069h, 073h, 073h, 069h, 06Fh, 06Eh, 020h, 065h, 06Eh, 064h, 03Ah, 00Ah, 000h
str_crashed db 043h
    db 072h, 061h, 073h, 068h, 065h, 064h, 000h
str_goodBailout db 047h
    db 06Fh, 06Fh, 064h, 020h, 042h, 061h, 069h, 06Ch, 06Fh, 075h, 074h, 000h
str_captured db 043h
    db 061h, 070h, 074h, 075h, 072h, 065h, 064h, 000h
str_bailedDied db 042h
    db 061h, 069h, 06Ch, 065h, 064h, 020h, 026h, 020h, 044h, 069h, 065h, 064h, 000h
str_goodLanding db 047h
    db 06Fh, 06Fh, 064h, 020h, 04Ch, 061h, 06Eh, 064h, 069h, 06Eh, 067h, 000h
str_primaryObj db 08Ch
    db 050h, 052h, 049h, 04Dh, 041h, 052h, 059h, 020h, 04Fh, 042h, 04Ah, 045h, 043h, 054h, 049h, 056h
    db 045h, 000h
str_secndryObj db 08Ch
    db 053h, 045h, 043h, 04Eh, 044h, 052h, 059h, 020h, 04Fh, 042h, 04Ah, 045h, 043h, 054h, 049h, 056h
    db 045h, 000h
str_cumulative2 db 08Dh
    db 000h
str_cumulative db 043h
    db 055h, 04Dh, 055h, 04Ch, 041h, 054h, 049h, 056h, 045h, 000h
str_missionRating3 db 04Dh
    db 049h, 053h, 053h, 049h, 04Fh, 04Eh, 020h, 052h, 041h, 054h, 049h, 04Eh, 047h, 000h
str_pressSelect db 080h
    db 000h
str_pressNext db 050h
    db 072h, 065h, 073h, 073h, 020h, 053h, 065h, 06Ch, 065h, 063h, 074h, 06Fh, 072h, 020h, 066h, 06Fh
    db 072h, 020h, 06Eh, 065h, 078h, 074h, 020h, 06Dh, 069h, 073h, 073h, 069h, 06Fh, 06Eh, 020h, 065h
    db 076h, 065h, 06Eh, 074h, 000h
str_inFlight db 080h
    db 049h, 06Eh, 02Dh, 046h, 06Ch, 069h, 067h, 068h, 074h, 000h
str_timeLabel db 08Dh
    db 054h, 049h, 04Dh, 045h, 03Ah, 020h, 080h, 000h
str_timeZeros db 080h
    db 000h
str_timeFormat db 030h
    db 030h, 03Ah, 030h, 030h, 03Ah, 030h, 030h, 000h
_var_97 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 000h, 028h, 000h, 028h
    db 000h, 028h, 000h, 028h, 000h, 028h, 000h, 050h, 000h, 050h, 000h, 050h, 000h, 050h, 000h, 050h
    db 000h, 050h, 000h
_var_98 db 000h
    db 000h, 030h, 000h, 060h, 000h, 090h, 000h, 0C0h, 000h, 0F0h, 000h, 000h, 000h, 030h, 000h, 060h
    db 000h, 090h, 000h, 0C0h, 000h, 0F0h, 000h, 000h, 000h, 030h, 000h, 060h, 000h, 090h, 000h, 0C0h
    db 000h, 0F0h, 000h, 06Ch, 069h, 062h, 079h, 061h, 02Eh, 073h, 070h, 072h, 000h, 070h, 065h, 072h
    db 073h, 069h, 061h, 06Eh, 02Eh, 073h, 070h, 072h, 000h, 076h, 06Eh, 02Eh, 073h, 070h, 072h, 000h
    db 06Dh, 065h, 02Eh, 073h, 070h, 072h, 000h, 06Eh, 063h, 061h, 070h, 065h, 02Eh, 073h, 070h, 072h
    db 000h, 063h, 065h, 075h, 072h, 06Fh, 070h, 065h, 02Eh, 073h, 070h, 072h, 000h, 06Ah, 070h, 02Eh
    db 073h, 070h, 072h, 000h, 06Eh, 061h, 02Eh, 073h, 070h, 072h, 000h, 052h, 065h, 076h, 069h, 065h
    db 077h, 020h, 04Dh, 069h, 073h, 073h, 069h, 06Fh, 06Eh, 000h, 045h, 078h, 069h, 074h, 020h, 044h
    db 065h, 062h, 072h, 069h, 065h, 066h, 069h, 06Eh, 067h, 000h
str_modeRb1 db 072h
    db 062h, 000h
str_insertScenario db 050h
    db 06Ch, 065h, 061h, 073h, 065h, 020h, 069h, 06Eh, 073h, 065h, 072h, 074h, 020h, 073h, 063h, 065h
    db 06Eh, 061h, 072h, 069h, 06Fh, 020h, 064h, 069h, 073h, 06Bh, 000h
str_pressKey1 db 03Ch
    db 050h, 072h, 065h, 073h, 073h, 020h, 061h, 020h, 06Bh, 065h, 079h, 020h, 077h, 068h, 065h, 06Eh
    db 020h, 072h, 065h, 061h, 064h, 079h, 03Eh, 000h
str_modeRb2 db 072h
    db 062h, 000h
str_dbicons1 db 064h
    db 062h, 069h, 063h, 06Fh, 06Eh, 073h, 02Eh, 073h, 070h, 072h, 000h
str_insertDiskA db 050h
    db 06Ch, 065h, 061h, 073h, 065h, 020h, 069h, 06Eh, 073h, 065h, 072h, 074h, 020h, 046h, 031h, 035h
    db 020h, 044h, 069h, 073h, 06Bh, 020h, 041h, 000h
str_pressKey2 db 03Ch
    db 050h, 072h, 065h, 073h, 073h, 020h, 061h, 020h, 06Bh, 065h, 079h, 020h, 077h, 068h, 065h, 06Eh
    db 020h, 072h, 065h, 061h, 064h, 079h, 03Eh, 000h
str_dbicons2 db 064h
    db 062h, 069h, 063h, 06Fh, 06Eh, 073h, 02Eh, 073h, 070h, 072h, 000h
str_missionDebrief db 020h
    db 020h, 04Dh, 049h, 053h, 053h, 049h, 04Fh, 04Eh, 020h, 044h, 045h, 042h, 052h, 049h, 045h, 046h
    db 049h, 04Eh, 047h, 000h, 000h, 000h, 000h, 000h, 000h, 002h, 000h, 00Fh, 000h, 000h, 000h, 000h
    db 000h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_99 db 034h
    db 020h, 000h, 000h, 000h, 000h, 000h, 000h, 00Fh, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_100 db 04Ch
    db 020h
_var_101 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 008h, 000h, 00Ah, 000h, 0E0h, 000h, 0A8h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
_var_102 db 064h
    db 020h
_var_103 db 000h
    db 000h, 000h, 000h, 0B2h, 000h, 000h, 000h, 000h, 000h, 0B2h, 000h, 040h, 001h, 015h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
_var_104 db 084h
    db 020h
_var_105 db 000h
    db 000h, 02Dh, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
dat_20C2 db 0A4h
    db 020h
_var_106 db 000h
    db 000h, 02Dh, 001h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
dat_20E2 db 0C4h
    db 020h
_var_107 db 000h
    db 000h, 023h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
dat_2102 db 0E4h
    db 020h
_var_108 db 000h
    db 000h, 023h, 001h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
dat_2122 db 004h
    db 021h
_var_109 db 000h
    db 000h, 017h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
dat_2142 db 024h
    db 021h
_var_110 db 000h
    db 000h, 017h, 001h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
dat_2162 db 044h
    db 021h
_var_111 db 000h
    db 000h, 01Eh, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h, 064h, 021h
_var_112 db 000h
    db 000h, 01Eh, 001h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 005h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h, 084h, 021h
_var_113 db 000h
    db 000h, 02Ah, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 001h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
dat_21C2 db 0A4h
    db 021h
_var_114 db 000h
    db 000h, 02Ah, 001h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 001h, 000h, 000h
    db 000h, 0C7h, 000h, 000h, 000h, 036h, 001h, 009h, 000h, 000h, 000h, 000h, 000h
dat_21E2 db 0C4h
    db 021h
dat_21e4 db 0ECh
    db 000h, 096h, 000h, 03Ch, 001h, 09Fh, 000h, 0ECh, 000h, 096h, 000h, 03Ch, 001h, 09Fh, 000h, 000h
    db 000h, 069h, 000h, 098h, 000h, 008h, 000h, 011h, 001h, 039h, 000h, 007h, 000h, 04Ch, 020h, 01Ah
    db 000h, 007h, 000h, 0FAh, 000h, 03Ch, 000h, 0A4h, 020h, 0C4h, 020h, 000h, 000h
_var_115 db 000h
    db 000h, 008h, 018h, 0ECh, 000h, 0A0h, 000h, 03Ch, 001h, 0A9h, 000h, 0ECh, 000h, 0A0h, 000h, 03Ch
    db 001h, 0A9h, 000h, 000h, 000h, 069h, 000h, 098h, 000h, 008h, 000h, 011h, 001h, 039h, 000h, 007h
    db 000h, 04Ch, 020h, 01Ah, 000h, 007h, 000h, 0FAh, 000h, 03Ch, 000h, 0A4h, 020h, 0C4h, 020h, 000h
    db 000h, 000h, 000h, 00Fh, 008h, 000h, 000h, 00Ah, 000h, 0FAh, 000h, 0FAh, 000h, 097h, 000h, 0A1h
    db 000h
_var_116 db 048h
    db 022h
_var_117 db 032h
    db 01Fh, 03Ch, 01Fh, 048h, 01Fh, 04Fh, 01Fh, 056h, 01Fh, 060h, 01Fh, 06Ch, 01Fh, 073h, 01Fh
_var_118 db 07Ah
    db 01Fh, 089h, 01Fh
_var_119 db 000h
    db 000h
_var_120 db 000h
    db 000h
_var_121 db 0A9h
    db 04Ah
_var_122 db 000h
    db 000h, 080h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
dat_22C0 db 070h
    db 022h, 03Bh, 043h, 05Fh, 046h, 049h, 04Ch, 045h, 05Fh, 049h, 04Eh, 046h, 04Fh, 000h
_var_123 db 000h
    db 000h
_var_124 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_var_125 db 000h
    db 000h
_var_126 db 000h
    db 000h, 000h, 000h
_var_127 db 000h
    db 000h
_var_128 db 000h
    db 000h, 000h
_var_129 db 000h
    db 000h
_var_130 db 014h
    db 000h
_var_131 db 081h
    db 081h, 081h, 001h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h
_var_132 db 000h
    db 000h
_var_133 db 000h
    db 000h
_var_134 db 000h
    db 000h, 008h, 023h, 080h, 005h, 043h, 000h, 000h, 000h
_var_135 db 000h
_var_136 db 000h
_var_137 db 000h
    db 000h, 000h, 000h, 05Ch, 000h, 05Ch, 000h
_var_138 db 001h
    db 000h
_var_139 db 000h
    db 000h
_var_140 db 000h
    db 000h, 000h, 016h, 002h, 002h, 018h, 00Dh, 009h, 00Ch, 00Ch, 00Ch, 007h, 008h, 016h, 016h, 0FFh
    db 012h, 00Dh, 012h, 002h, 0FFh, 0FEh, 04Ch, 000h, 000h, 0FEh, 04Ch, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 002h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 002h, 002h, 000h, 000h, 000h
    db 000h, 000h, 000h, 084h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 002h, 004h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h
_var_141 db 001h
    db 000h, 000h, 002h
_var_142 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h
_var_143 db 0C8h
    db 023h
_var_144 db 000h
    db 000h
dat_244C db 000h
    db 000h
dat_244E db 000h
    db 000h, 000h, 000h
dat_2452 db 000h
    db 000h, 000h, 000h, 000h
_var_145 db 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 000h
_var_146 db 0D0h
    db 05Dh, 000h, 000h
_var_147 db 000h
    db 000h
_var_148 db 000h
    db 000h
_var_149 db 000h
    db 000h, 000h, 000h
_var_150 db 000h
    db 000h, 000h, 000h, 094h, 054h
str_nmsg db 03Ch
    db 03Ch, 04Eh, 04Dh, 053h, 047h, 03Eh, 03Eh, 000h, 000h, 052h, 036h, 030h, 030h, 030h, 00Dh, 00Ah
    db 02Dh, 020h, 073h, 074h, 061h, 063h, 06Bh, 020h, 06Fh, 076h, 065h, 072h, 066h, 06Ch, 06Fh, 077h
    db 00Dh, 00Ah, 000h, 003h, 000h, 052h, 036h, 030h, 030h, 033h, 00Dh, 00Ah, 02Dh, 020h, 069h, 06Eh
    db 074h, 065h, 067h, 065h, 072h, 020h, 064h, 069h, 076h, 069h, 064h, 065h, 020h, 062h, 079h, 020h
    db 030h, 00Dh, 00Ah, 000h, 009h, 000h, 052h, 036h, 030h, 030h, 039h, 00Dh, 00Ah, 02Dh, 020h, 06Eh
    db 06Fh, 074h, 020h, 065h, 06Eh, 06Fh, 075h, 067h, 068h, 020h, 073h, 070h, 061h, 063h, 065h, 020h
    db 066h, 06Fh, 072h, 020h, 065h, 06Eh, 076h, 069h, 072h, 06Fh, 06Eh, 06Dh, 065h, 06Eh, 074h, 00Dh
    db 00Ah, 000h, 0FCh, 000h, 00Dh, 00Ah, 000h, 0FFh, 000h, 072h, 075h, 06Eh, 02Dh, 074h, 069h, 06Dh
    db 065h, 020h, 065h, 072h, 072h, 06Fh, 072h, 020h, 000h, 002h, 000h, 052h, 036h, 030h, 030h, 032h
    db 00Dh, 00Ah, 02Dh, 020h, 066h, 06Ch, 06Fh, 061h, 074h, 069h, 06Eh, 067h, 020h, 070h, 06Fh, 069h
    db 06Eh, 074h, 020h, 06Eh, 06Fh, 074h, 020h, 06Ch, 06Fh, 061h, 064h, 065h, 064h, 00Dh, 00Ah, 000h
    db 001h, 000h, 052h, 036h, 030h, 030h, 031h, 00Dh, 00Ah, 02Dh, 020h, 06Eh, 075h, 06Ch, 06Ch, 020h
    db 070h, 06Fh, 069h, 06Eh, 074h, 065h, 072h, 020h, 061h, 073h, 073h, 069h, 067h, 06Eh, 06Dh, 065h
    db 06Eh, 074h, 00Dh, 00Ah, 000h, 0FFh, 0FFh, 0FFh

IFDEF DEBUG
_trace_main_enter db 'main: enter', 0
_trace_main_r14 db 'main: routine_14', 0
_trace_main_misc5e db 'main: misc_jump_5e_clearKeyFlags', 0
_trace_main_r16 db 'main: routine_16', 0
_trace_main_cbreak db 'main: installCBreakHandler', 0
_trace_main_r18 db 'main: routine_18', 0
_trace_main_r20 db 'main: routine_20', 0
_trace_main_r25 db 'main: routine_25', 0
_trace_main_r27 db 'main: routine_27', 0
_trace_main_r8 db 'main: routine_8', 0
_trace_crt0_bss_done db 'crt0: bss cleared, calling routine_4', 0
_trace_crt0_calling_main db 'crt0: calling main', 0
_trace_before_gfx50 db 'routine_25: before gfx_jump_50', 0
ENDIF

.DATA?
; --- BSS ---

    db 1 dup(?)
_var_151 db 2 dup(?)
_var_152 db 2 dup(?)
_var_153 db 2 dup(?)
_var_154 db 2 dup(?)
_var_155 db 2 dup(?)
_var_156 db ?
_var_157 db ?
_var_158 db ?
_var_159 db ?
_var_160 db 2 dup(?)
_var_161 db 2 dup(?)
_var_162 db 2 dup(?)
_var_163 db ?
_var_164 db ?
_var_165 db 2 dup(?)
_var_166 db 423 dup(?)
dat_270f db 90 dup(?)
dat_2769 db ?
_var_167 db 2 dup(?)
_var_168 db 6142 dup(?)
dat_3F6A db ?
dat_3F6B db ?
dat_3F6C db 2 dup(?)
dat_3F6E db 2 dup(?)
dat_3F70 db ?
dat_3F71 db 65 dup(?)
dat_3FB2 db 2 dup(?)
dat_3FB4 db 2 dup(?)
dat_3FB6 db 2 dup(?)
dat_3FB8 db 2 dup(?)
_var_169 db 2 dup(?)
_var_170 db 2 dup(?)
_var_171 db 2 dup(?)
_var_172 db 2 dup(?)
_var_173 db ?
_var_174 db ?
_var_175 db 12 dup(?)
_var_176 db 100 dup(?)
dat_4034 db 4 dup(?)
_var_177 db 2 dup(?)
_var_178 db 2 dup(?)
_var_179 db 4 dup(?)
dat_4040 db 516 dup(?)
_var_180 db 2 dup(?)
dat_4246 db 2 dup(?)
_var_181 db 2 dup(?)
_var_182 db 4 dup(?)
dat_424e db 8 dup(?)
_var_183 db 1194 dup(?)
_var_184 db 256 dup(?)
_var_185 db 4 dup(?)
dat_4804 db 4 dup(?)
_var_186 db 10 dup(?)
_var_187 db 8 dup(?)
_var_188 db 10 dup(?)
dat_4824 db 512 dup(?)
_var_189 db 4 dup(?)
_var_190 db 2 dup(?)
dat_4a2a db 720 dup(?)
_var_191 db 518 dup(?)
_var_192 db 2 dup(?)
_var_193 db 2 dup(?)
_var_194 db ?
_var_195 db ?
_var_196 db ?
_var_197 db 1531 dup(?)
_var_198 db 6 dup(?)
_var_199 db 2 dup(?)
_var_200 db 2 dup(?)
_var_201 db 3 dup(?)
_var_202 db ?
_var_203 db 2 dup(?)
dat_5512 db 102 dup(?)
_var_204 db 100 dup(?)
_var_205 db 2 dup(?)
dat_55de db 2 dup(?)
_var_206 db 14 dup(?)
_var_207 db 2 dup(?)
_var_208 db 2 dup(?)
_var_209 db 2 dup(?)
_var_210 db 4 dup(?)
_var_211 db 2 dup(?)
_var_212 db 2 dup(?)
_var_213 db 2 dup(?)
_var_214 db 2 dup(?)
_var_215 db 2 dup(?)
_var_216 db 6 dup(?)
_var_217 db 200 dup(?)
_var_218 db 750 dup(?)
_var_219 db 2 dup(?)
_var_220 db 2 dup(?)
_var_221 db 242 dup(?)
dat_5ab4 db 2 dup(?)
_var_222 db 2 dup(?)
_var_223 db 2 dup(?)
_var_224 db 4 dup(?)
_var_225 db 2 dup(?)
_var_226 db 514 dup(?)
_var_227 db 2 dup(?)
_var_228 db 2 dup(?)
_var_229 db 2 dup(?)
_var_230 db 2 dup(?)
_var_231 db 2 dup(?)
_var_232 db ?

__bss_end label byte

; Stack size must match the original (0x800 = 2048 bytes)
__stack_top equ __bss_end + 0800h

END start
