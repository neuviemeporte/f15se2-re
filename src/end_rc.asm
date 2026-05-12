.8086
DOSSEG
.MODEL SMALL

.CODE
; --- Code segment ---

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

routine_7 proc near
    push BP
    mov BP,SP
    sub SP,0eh
    push SI
    mov word ptr [BP + -8h],0h
    mov word ptr [BP + -0ah],4f0h
    les BX,dword ptr [BP + -0ah]
    mov SI,word ptr ES:[BX]
    mov word ptr [5ab8h],SI
    mov word ptr [5ab6h],0h
    mov word ptr [403ch],SI
    mov word ptr [403ah],120eh
    les BX,dword ptr [5ab6h]
    push word ptr ES:[BX + 1ah]
    call routine_14
    add SP,2h
    les BX,dword ptr [5ab6h]
    push word ptr ES:[BX + 1eh]
    call routine_14
    add SP,2h
    call far ptr routine_15
    call routine_16
    les BX,dword ptr [5ab6h]
    mov AL,byte ptr ES:[BX + 24h]
    mov [4cfah],AL
    call routine_17
    call routine_18
    les BX,dword ptr [5ab6h]
    cmp word ptr ES:[BX + 72h],1h
    jnz LAB_1000_008e
    mov AX,BX
    mov DX,ES
    add AX,48h
    push DX
    push AX
    call far ptr routine_19
    add SP,4h
    jmp LAB_1000_0096
LAB_1000_008e:
    mov AL,80h
    mov [15fbh],AL
    mov [15fah],AL
LAB_1000_0096:
    call routine_20
    call far ptr routine_21
    mov word ptr [BP + -6h],AX
    call far ptr routine_22
    mov word ptr [BP + -2h],AX
    push word ptr [BP + -6h]
    call routine_23
    add SP,2h
    mov [5ac0h],AX
    cmp word ptr [4a24h],1h
    jnz LAB_1000_00d2
    mov AX,3c8ch
    push AX
    call routine_23
    add SP,2h
    mov [5cc8h],AX
    mov [5ccch],AX
    mov word ptr [5ccah],0h
LAB_1000_00d2:
    push word ptr [BP + -2h]
    call routine_23
    add SP,2h
    mov [5cc6h],AX
    mov word ptr [550ch],3h
    les BX,dword ptr [5ab6h]
    cmp word ptr ES:[BX + 26h],2h
    jnz LAB_1000_00f2
    call routine_24
LAB_1000_00f2:
    call routine_16
    call routine_25
    call routine_26
    call routine_16
    call routine_27
    call routine_28
    mov AX,23h
    push AX
    call routine_8
    add SP,2h
    pop SI
    mov SP,BP
    pop BP
    ret
routine_7 endp

routine_26 proc near
    cmp byte ptr [15feh],0h
    jz LAB_1000_0129
    call routine_44
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
    call far ptr routine_35
    add SP,2h
    sub AX,AX
    push AX
    call far ptr routine_36
    add SP,2h
    sub AX,AX
    push AX
    call far ptr routine_37
    add SP,2h
    les BX,dword ptr [5ab6h]
    push word ptr ES:[BX + 24h]
    call far ptr routine_38
    add SP,2h
    mov AX,1h
    push AX
    call far ptr routine_39
    add SP,2h
    mov AX,1h
    push AX
    les BX,dword ptr [5ab6h]
    push word ptr ES:[BX + 20h]
    call far ptr routine_40
    mov SP,BP
    pop BP
    ret
routine_18 endp

routine_44 proc near
    push BP
    mov BP,SP
    sub SP,0eh
    cmp byte ptr [19ffh],1h
    jnz LAB_1000_0195
    call routine_62
LAB_1000_0195:
    mov byte ptr [BP + -0dh],0h
    mov byte ptr [BP + -0eh],3h
    lea AX,[BP + -0eh]
    push AX
    lea AX,[BP + -0eh]
    push AX
    mov AX,10h
    push AX
    call routine_72
    add SP,6h
    call far ptr routine_15
    mov SP,BP
    pop BP
    ret
routine_44 endp

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
    mov word ptr [55e0h],1h
    call routine_42
    mov word ptr [5608h],56d0h
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
    mov AX,4246h
    push AX
    call routine_71
    add SP,4h
    mov AX,2h
    push AX
    mov AX,5510h
    push AX
    call routine_71
    add SP,4h
    mov AX,2h
    push AX
    mov AX,4040h
    push AX
    call routine_71
    add SP,4h
    mov AX,2h
    push AX
    mov AX,5ab4h
    push AX
    call routine_71
    add SP,4h
    mov AX,[5510h]
    mov CL,4h
    shl AX,CL
    push AX
    mov AX,424eh
    push AX
    call routine_71
    add SP,4h
    mov AX,2h
    push AX
    mov AX,5602h
    push AX
    call routine_71
    add SP,4h
    mov AX,24h
    imul word ptr [5602h]
    push AX
    mov AX,4a2ah
    push AX
    call routine_71
    add SP,4h
    mov AX,64h
    push AX
    mov AX,5578h
    push AX
    call routine_71
    add SP,4h
    mov AX,64h
    push AX
    mov AX,5512h
    push AX
    call routine_71
    add SP,4h
    mov AX,2eeh
    push AX
    mov AX,56d0h
    push AX
    call routine_71
    add SP,4h
    mov AX,100h
    push AX
    mov AX,4700h
    push AX
    call routine_71
    add SP,4h
    mov AX,2h
    push AX
    mov AX,55deh
    push AX
    call routine_71
    add SP,4h
    mov AX,2h
    push AX
    mov AX,4034h
    push AX
    call routine_71
    add SP,4h
    mov AX,10h
    push AX
    mov AX,42h
    push AX
    call routine_71
    add SP,4h
    mov AX,24h
    push AX
    mov AX,4800h
    push AX
    call routine_71
    add SP,4h
    mov AX,600h
    push AX
    mov AX,4f02h
    push AX
    call routine_71
    add SP,4h
    ret
routine_42 endp

routine_71 proc near
    push BP
    mov BP,SP
    cmp word ptr [55e0h],0h
    jz LAB_1000_0312
    push word ptr [4038h]
    mov AX,1h
    push AX
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call routine_108
    jmp LAB_1000_0323
LAB_1000_0312:
    push word ptr [4038h]
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
    mov AX,[5ab6h]
    mov DX,word ptr [5ab8h]
    add AX,7ah
    mov [2550h],AX
    mov word ptr [2552h],DX
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
    push word ptr [2550h]
    push word ptr [2552h]
    call routine_140
    add SP,0ah
    add word ptr [2550h],SI
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
    push word ptr [2550h]
    push word ptr [2552h]
    push word ptr [BP + -4h]
    push DS
    call routine_140
    add SP,0ah
    add word ptr [2550h],SI
    pop SI
    mov SP,BP
    pop BP
    ret
    db 0C3h
routine_109 endp

routine_16 proc near
    jmp FUN_1000_03ad
LAB_1000_03a8:
    call far ptr routine_32
routine_16 endp

FUN_1000_03ad proc near
    call far ptr routine_31
    or AX,AX
    jz LAB_1000_03a8
    ret
FUN_1000_03ad endp

routine_66 proc near
    push BP
    mov BP,SP
    sub SP,2h
    les BX,dword ptr [5ab6h]
    cmp word ptr ES:[BX + 72h],1h
    jnz LAB_1000_03e9
LAB_1000_03c8:
    call far ptr routine_31
    or AX,AX
    jz LAB_1000_03e0
    sub AX,AX
    push AX
    call far ptr routine_61
    add SP,2h
    or AX,AX
    jz LAB_1000_03c8
LAB_1000_03e0:
    call far ptr routine_31
    or AX,AX
    jnz LAB_1000_03f1
LAB_1000_03e9:
    call far ptr routine_32
    mov word ptr [BP + -2h],AX
LAB_1000_03f1:
    cmp word ptr [BP + -2h],1000h
    jz LAB_1000_03ff
    cmp byte ptr [15feh],0h
    jz LAB_1000_0415
LAB_1000_03ff:
    call routine_44
    cmp byte ptr [15feh],0h
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

routine_56 proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 8h]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 0ah]
    mov word ptr [BX + 0ah],AX
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call far ptr routine_93
    add SP,4h
    mov SP,BP
    pop BP
    ret
routine_56 endp

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
    call far ptr routine_93
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
    call far ptr routine_111
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
    call far ptr routine_93
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
    call far ptr routine_111
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
    call far ptr routine_93
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

routine_48 proc near
    push BP
    mov BP,SP
    sub SP,2h
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call routine_83
    add SP,4h
    mov word ptr [BP + -2h],AX
    push word ptr [BP + 0ah]
    mov AX,word ptr [BP + 0ch]
    sub AX,word ptr [BP + -2h]
    cwd
    sub AX,DX
    sar AX,1h
    add AX,word ptr [BP + 8h]
    push AX
    push word ptr [BP + 6h]
    push word ptr [BP + 4h]
    call routine_56
    add SP,8h
    mov SP,BP
    pop BP
    ret
routine_48 endp

routine_83 proc near
    push BP
    mov BP,SP
    sub SP,6h
    mov AX,word ptr [BP + 6h]
    mov word ptr [BP + -4h],AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX + 0ch]
    mov word ptr [BP + -2h],AX
    mov word ptr [BP + -6h],0h
LAB_1000_0752:
    mov BX,word ptr [BP + -4h]
    cmp byte ptr [BX],0h
    jz LAB_1000_0772
    push word ptr [BP + -2h]
    inc word ptr [BP + -4h]
    mov AL,byte ptr [BX]
    sub AH,AH
    push AX
    call far ptr routine_111
    add SP,4h
    add word ptr [BP + -6h],AX
    jmp LAB_1000_0752
LAB_1000_0772:
    mov AX,word ptr [BP + -6h]
    jmp LAB_1000_0777
LAB_1000_0777:
    mov SP,BP
    pop BP
    ret
routine_83 endp

routine_107 proc near
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
routine_107 endp

routine_133 proc near
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
routine_133 endp

FUN_1000_0990 proc near
    push BP
    mov BP,SP
    mov byte ptr [1a1ah],0h
    call routine_58
LAB_1000_099b:
    mov AL,[1a1ah]
    sub AH,AH
    cmp word ptr [BP + 4h],AX
    jc LAB_1000_09a7
    jmp LAB_1000_099b
LAB_1000_09a7:
    call routine_62
    mov SP,BP
    pop BP
    ret
FUN_1000_0990 endp

routine_34 proc near
    push BP
    mov BP,SP
    call routine_69
    push AX
    call routine_70
    add SP,2h
    mov SP,BP
    pop BP
    ret
routine_34 endp

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

routine_67 proc near
    push BP
    mov BP,SP
    push SI
LAB_1000_0a46:
    mov BX,word ptr [BP + 4h]
    inc word ptr [BP + 4h]
    mov SI,word ptr [BP + 6h]
    inc word ptr [BP + 6h]
    mov AL,byte ptr [SI]
    mov byte ptr [BX],AL
    or AL,AL
    jnz LAB_1000_0a46
    pop SI
    pop BP
    ret
routine_67 endp

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

routine_68 proc near
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
routine_68 endp

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

routine_72 proc near
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
    dw 10h
    jmp LAB_1000_0bd4
    db 90h
LAB_1000_0bbe:
    dw 21h
    jmp LAB_1000_0bd4
    db 90h
LAB_1000_0bc3:
    dw 16h
    jmp LAB_1000_0bd4
    db 90h
LAB_1000_0bc8:
    dw 1ah
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
routine_72 endp

routine_87 proc near
    push BP
    mov BP,SP
    push SI
    mov BX,word ptr [BP + 6h]
    mov AX,word ptr [BP + 8h]
    cmp AX,0ah
    jz LAB_1000_0c08
    cmp AX,2h
    jz LAB_1000_0c14
    cmp AX,10h
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
    add AX,30h
    mov byte ptr [BX],AL
    inc BX
    mov AX,word ptr [BP + 4h]
    and AH,0fh
    mov AL,AH
    sub AH,AH
    add AX,30h
    mov byte ptr [BX],AL
    inc BX
    mov AX,word ptr [BP + 4h]
    and AL,0f0h
    sub AH,AH
    shr AX,CL
    add AX,30h
    mov byte ptr [BX],AL
    inc BX
    mov AX,word ptr [BP + 4h]
    and AL,0fh
    sub AH,AH
    add AX,30h
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
    test AX,DX
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
    dw 10h
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
    dw 10h
    mov AH,0eh
    mov AL,DL
    dw 10h
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

routine_45 proc near
    push BP
    mov BP,SP
    mov AH,9h
    mov DX,word ptr [BP + Stack[2h]+2h]
    dw 21h
    pop BP
    ret
    db 00h
    db 00h
routine_45 endp

routine_14 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push DS
    push BP
    mov DX,word ptr [BP + 4h]
    mov byte ptr [0fe8h],0h
    jmp LAB_1000_0d2f
    db 90h
    db 0C6h
    db 06h
    db 0E8h
    db 0Fh
    db 01h
LAB_1000_0d2f:
    mov ES,DX
    mov BX,1008h
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
    cmp byte ptr [0fe8h],0h
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
    mov byte ptr [0fe8h],0h
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
    dw 21h
    jnc LAB_1000_0d9a
    mov DX,0fe9h
    mov AH,9h
    dw 21h
    jmp LAB_1000_0daa
    db 90h
LAB_1000_0d9a:
    cmp byte ptr [0fe8h],0h
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
    dw 21h
    push BP
    mov BP,SP
    push DI
    push SI
    push BP
    push DS
    pop ES
    call far ptr routine_75
    push AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    call far ptr routine_76
    mov AH,byte ptr [BX + 4h]
    call far ptr routine_77
    call routine_78
    mov AX,word ptr [BP + 0ah]
    sub AX,word ptr [BP + 6h]
    mov [1236h],AX
    mov AX,word ptr [BP + 0ch]
    sub AX,word ptr [BP + 8h]
    inc AX
    mov [1238h],AX
    mov CX,word ptr [BP + 0ch]
    mov SI,word ptr [BP + 8h]
    mov word ptr [1234h],SI
    mov word ptr [15b9h],CX
    mov word ptr [15b7h],SI
    sub CX,SI
    inc CX
    lea DI,[1243h]
    shl SI,1h
    add DI,SI
    mov AX,word ptr [BP + 6h]
    mov [1232h],AX
    mov DX,CX
    rep stosw
    mov CX,DX
    lea DI,[13fbh]
    add DI,SI
    mov AX,word ptr [BP + 0ah]
    rep stosw
    mov BX,1243h
    mov AX,[15b7h]
    mov CX,word ptr [15b9h]
    call far ptr routine_79
    call far ptr routine_80
    mov AX,[1232h]
    mov BX,word ptr [1234h]
    mov CX,word ptr [1236h]
    mov DX,word ptr [1238h]
    call far ptr routine_81
    pop AX
    call far ptr routine_82
    pop BP
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
FUN_1000_0d70 endp

routine_47 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push BP
    push DS
    pop ES
    call far ptr routine_75
    push AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    call far ptr routine_76
    mov AH,byte ptr [BX + 6h]
    call far ptr routine_77
    call routine_78
    mov AX,word ptr [BP + 0ah]
    sub AX,word ptr [BP + 6h]
    mov [1236h],AX
    mov AX,word ptr [BP + 0ch]
    sub AX,word ptr [BP + 8h]
    inc AX
    mov [1238h],AX
    mov CX,word ptr [BP + 0ch]
    mov SI,word ptr [BP + 8h]
    mov word ptr [1234h],SI
    mov word ptr [15b9h],CX
    mov word ptr [15b7h],SI
    sub CX,SI
    inc CX
    lea DI,[1243h]
    shl SI,1h
    add DI,SI
    mov AX,word ptr [BP + 6h]
    mov [1232h],AX
    mov DX,CX
    rep stosw
    mov CX,DX
    lea DI,[13fbh]
    add DI,SI
    mov AX,word ptr [BP + 0ah]
    rep stosw
    mov BX,1243h
    mov AX,[15b7h]
    mov CX,word ptr [15b9h]
    call far ptr routine_79
    call far ptr routine_80
    mov AX,[1232h]
    mov BX,word ptr [1234h]
    mov CX,word ptr [1236h]
    mov DX,word ptr [1238h]
    call far ptr routine_81
    pop AX
    call far ptr routine_82
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
routine_47 endp

routine_78 proc near
    mov DI,word ptr [15b7h]
    or DI,DI
    js LAB_1000_0f39
    mov CX,word ptr [15b9h]
    inc CX
    sub CX,DI
    shl DI,1h
    mov BX,CX
    mov DX,DI
    add DI,1243h
    mov AX,0ffffh
    rep stosw
    mov [15b7h],AX
    mov CX,BX
    mov DI,DX
    add DI,13fbh
    sub AX,AX
    rep stosw
    mov [15b9h],AX
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
routine_78 endp

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
    lea AX,[121fh]
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
    mov AX,[123bh]
    mov BX,word ptr [123fh]
    mov CX,word ptr [123dh]
    mov DX,word ptr [1241h]
    call far ptr routine_162
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
    mov word ptr [15bdh],DX
    sar DX,1h
    mov word ptr [15c1h],DX
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
    sar word ptr [15bdh],1h
    sar word ptr [15c1h],1h
    jmp LAB_1000_1155
    db 90h
LAB_1000_10fa:
    mov CX,word ptr [123bh]
    mov DX,word ptr [123fh]
    mov SI,word ptr [123dh]
    mov DI,word ptr [1241h]
    mov BX,CX
    mov BP,DX
    call routine_161
    mov [15bch],AL
    mov BX,SI
    mov BP,DI
    call routine_161
    jnz LAB_1000_1137
    cmp byte ptr [15bch],0h
    jnz LAB_1000_1127
    jmp LAB_1000_10a0
LAB_1000_1127:
    xchg SI,CX
    xchg DI,DX
    xchg byte ptr [15bch],AL
    mov word ptr [123bh],CX
    mov word ptr [123fh],DX
LAB_1000_1137:
    test byte ptr [15bch],AL
    jnz LAB_1000_10c1
    mov BP,DX
    mov DX,SI
    sub DX,CX
    jo LAB_1000_10ce
    mov word ptr [15bdh],DX
    sar DX,1h
    mov word ptr [15c1h],DX
    mov DX,DI
    sub DX,BP
    jo LAB_1000_10ec
LAB_1000_1155:
    mov word ptr [15bfh],DX
    sar DX,1h
    mov word ptr [15c3h],DX
LAB_1000_115f:
    test AL,9h
    jz LAB_1000_119b
    sub BX,BX
    or SI,SI
    js LAB_1000_116d
    mov BX,word ptr [15c5h]
LAB_1000_116d:
    mov AX,BX
    sub AX,CX
    imul word ptr [15bfh]
    push BX
    mov BX,DX
    idiv word ptr [15bdh]
    mov BL,BH
    xor BL,byte ptr [15beh]
    jns LAB_1000_1187
    neg DX
    dec AX
LAB_1000_1187:
    sub DX,word ptr [15c1h]
    xor DH,BH
    js LAB_1000_1190
    inc AX
LAB_1000_1190:
    pop BX
    add AX,BP
    js LAB_1000_11a3
    cmp AX,word ptr [15c7h]
    jle LAB_1000_11d4
LAB_1000_119b:
    mov BX,word ptr [15c7h]
    cmp DI,BX
    jg LAB_1000_11a5
LAB_1000_11a3:
    sub BX,BX
LAB_1000_11a5:
    mov AX,BX
    sub AX,BP
    imul word ptr [15bdh]
    push BX
    mov BX,DX
    idiv word ptr [15bfh]
    mov BL,BH
    xor BL,byte ptr [15c0h]
    jns LAB_1000_11bf
    neg DX
    dec AX
LAB_1000_11bf:
    sub DX,word ptr [15c3h]
    xor DH,BH
    js LAB_1000_11c8
    inc AX
LAB_1000_11c8:
    pop BX
    add AX,CX
    js LAB_1000_11e5
    cmp AX,word ptr [15c5h]
    jg LAB_1000_11e5
    xchg AX,BX
LAB_1000_11d4:
    cmp byte ptr [15bch],0h
    jnz LAB_1000_11e8
    mov [1241h],AX
    mov word ptr [123dh],BX
    jmp LAB_1000_10a0
LAB_1000_11e5:
    jmp LAB_1000_10c1
LAB_1000_11e8:
    mov [123fh],AX
    mov word ptr [123bh],BX
    xchg SI,CX
    xchg DI,BP
    mov AL,[15bch]
    mov byte ptr [15bch],0h
    jmp LAB_1000_115f
routine_158 endp

routine_161 proc near
    mov AL,0fh
    or BX,BX
    js LAB_1000_1206
    and AL,0f7h
LAB_1000_1206:
    cmp BX,word ptr [15c5h]
    jg LAB_1000_120e
    and AL,0feh
LAB_1000_120e:
    or BP,BP
    js LAB_1000_1214
    and AL,0fbh
LAB_1000_1214:
    cmp BP,word ptr [15c7h]
    jg LAB_1000_121c
    and AL,0fdh
LAB_1000_121c:
    or AL,AL
    ret
routine_161 endp

FUN_1000_121f proc near
    push BP
    mov BP,SP
    cmp word ptr [BP + local_res0+2h],11b0h
    mov AX,[15bfh]
    jz LAB_1000_122f
    mov AX,[15bdh]
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

routine_17 proc near
    push SI
    push DI
    push DX
    push DS
    mov SI,6ch
    call routine_33
    mov word ptr [1601h],BX
    mov [15ffh],AX
    mov AX,1000h
    mov DX,1280h
    mov DS,AX
    mov AX,251bh
    dw 21h
    pop DS
    pop DX
    pop DI
    pop SI
    ret
routine_17 endp

routine_28 proc near
    push DS
    mov AX,[15ffh]
    mov DX,word ptr [1601h]
    mov DS,AX
    mov AX,251bh
    dw 21h
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
    db 1Eh
    db 50h
    db 0B8h
    db 80h
    db 15h
    db 8Eh
    db 0D8h
    db 0C6h
    db 06h
    db 0FEh
    db 15h
    db 0FFh
    db 58h
    db 1Fh
    db 0CFh
    db 00h
    push BP
    mov BP,SP
    sub SP,4h
    sub AX,AX
    push AX
    push word ptr [BP + 4h]
    call routine_89
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
    call routine_89
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

routine_89 proc near
    push BP
    mov BP,SP
    push word ptr [BP + Stack[4h]+2h]
    push word ptr [BP + Stack[2h]+2h]
    call routine_118
    add SP,4h
    pop BP
    ret
    db 90h
routine_89 endp

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

routine_91 proc near
    push BP
    mov BP,SP
    push word ptr [BP + 4h]
    call routine_125
    add SP,2h
    pop BP
    ret
routine_91 endp

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

routine_118 proc near
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
    dw 21h
    jnc LAB_1000_13f7
    cmp AX,2h
    jnz LAB_1000_13d6
LAB_1000_13ca:
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov AX,1806h
    mov CX,0ffffh
    jmp FUN_1000_156a
LAB_1000_13d6:
    cmp AX,3h
    jz LAB_1000_13ca
    cmp AX,4h
    jnz LAB_1000_13ec
    mov CX,0ffffh
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov AX,1816h
    jmp FUN_1000_156a
LAB_1000_13ec:
    mov CX,AX
    mov AX,1831h
    mov BX,word ptr [BP + Stack[2h]+2h]
    jmp FUN_1000_156a
LAB_1000_13f7:
    mov word ptr [186eh],200h
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
routine_118 endp

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
    dw 21h
    jnc LAB_1000_144e
    cmp AX,2h
    jnz LAB_1000_142d
LAB_1000_1421:
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov AX,1806h
    mov CX,0ffffh
    jmp FUN_1000_156a
LAB_1000_142d:
    cmp AX,3h
    jz LAB_1000_1421
    cmp AX,4h
    jnz LAB_1000_1443
    mov CX,0ffffh
    mov BX,word ptr [BP + Stack[2h]+2h]
    mov AX,1816h
    jmp FUN_1000_156a
LAB_1000_1443:
    mov CX,AX
    mov AX,1831h
    mov BX,word ptr [BP + Stack[2h]+2h]
    jmp FUN_1000_156a
LAB_1000_144e:
    mov word ptr [186eh],200h
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
FUN_1000_1405 endp

routine_125 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AH,3eh
    mov BX,word ptr [BP + 4h]
    dw 21h
    jnc LAB_1000_1475
    mov DX,183eh
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
routine_125 endp

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
    dw 21h
    jnc LAB_1000_14a1
    mov DX,1851h
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
    dw 21h
    pop DS
    jnc LAB_1000_14cf
    mov DX,1851h
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
    mov BX,word ptr [CODE_2:var_63]
    mov CX,200h
    mov DX,1606h
    dw 21h
    jnc LAB_1000_151f
    mov DX,1851h
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
    mov [1870h],AX
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
    dw 21h
    pop DS
    jnc LAB_1000_1562
    mov DX,185ch
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
    dw 10h
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
    dw 21h
    pop DX
LAB_1000_1585:
    mov AH,9h
    dw 21h
    cmp CX,-1h
    jz LAB_1000_15a1
    add CX,30h
    mov byte ptr [1604h],CL
    mov byte ptr [1605h],24h
    mov DX,1604h
    mov AH,9h
    dw 21h
LAB_1000_15a1:
    mov AX,4c00h
    dw 21h
FUN_1000_156a endp

routine_54 proc near
    push BP
    mov BP,SP
    sub SP,2h
    sub AX,AX
    push AX
    push word ptr [BP + 4h]
    call routine_89
    add SP,4h
    mov word ptr [BP + -2h],AX
    push word ptr [BP + Stack[6h]+2h]
    push word ptr [BP + 6h]
    push AX
    call routine_92
    add SP,6h
    push word ptr [BP + -2h]
    call routine_91
    mov SP,BP
    pop BP
    ret
routine_54 endp

FUN_1000_15d2 proc near
    push BP
    mov BP,SP
    sub SP,2h
    sub AX,AX
    push AX
    push word ptr [BP + Stack[2h]+2h]
    call routine_89
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

routine_53 proc near
    push BP
    mov BP,SP
    sub SP,2h
    sub AX,AX
    push AX
    push word ptr [BP + Stack[2h]+2h]
    call routine_89
    add SP,4h
    mov word ptr [BP + -2h],AX
    push word ptr [BP + Stack[4h]+2h]
    push AX
    call routine_90
    add SP,4h
    push word ptr [BP + -2h]
    call routine_91
    mov SP,BP
    pop BP
    ret
    db 90h
routine_53 endp

FUN_1000_1626 proc near
    push BP
    mov BP,SP
    sub SP,2h
    sub AX,AX
    push AX
    push word ptr [BP + 4h]
    call routine_89
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
    call routine_90
    add SP,4h
    push word ptr [BP + -2h]
    call routine_91
    mov SP,BP
    pop BP
    ret
    db 90h
FUN_1000_1626 endp

routine_92 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,1500h
    mov [19bch],AX
    mov AX,word ptr [BP + 4h]
    mov [1870h],AX
    mov AX,word ptr [BP + 6h]
    mov [19b4h],AX
    call routine_120
    mov SI,word ptr [19b4h]
    call far ptr routine_126
    call far ptr routine_119
    mov word ptr [19bah],0h
    mov word ptr [19b2h],0fa00h
LAB_1000_169a:
    mov DI,word ptr [19bah]
    call far ptr routine_121
    mov [19b6h],AX
    call routine_122
    mov DI,word ptr [19b6h]
    mov BP,1872h
    mov BX,word ptr [19bah]
    call far ptr routine_127
    mov DI,word ptr [19b6h]
    call far ptr routine_128
    inc word ptr [19bah]
    sub word ptr [19b2h],140h
    jnz LAB_1000_169a
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
routine_92 endp

FUN_1000_16d6 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,1500h
    mov [19bch],AX
    mov AX,word ptr [BP + 4h]
    mov [1870h],AX
    mov AX,word ptr [BP + Stack[4h]+2h]
    mov ES,AX
    call far ptr routine_119
    call routine_120
    mov word ptr [19bah],0h
    mov word ptr [19b2h],0fa00h
LAB_1000_1702:
    mov DI,word ptr [19bah]
    call far ptr routine_121
    mov [19b6h],AX
    call routine_122
    mov DI,word ptr [19b6h]
    mov BP,1872h
    mov BX,word ptr [19bah]
    call far ptr routine_127
    mov DI,word ptr [19b6h]
    call far ptr thunk_EXT_FUN_0000
    inc word ptr [19bah]
    sub word ptr [19b2h],140h
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
    mov AX,14d7h
    mov [19bch],AX
    mov word ptr [186eh],200h
    mov word ptr [186ah],0h
    mov AX,word ptr [BP + 4h]
    mov [1868h],AX
    mov AX,word ptr [BP + Stack[4h]+2h]
    mov ES,AX
    call far ptr routine_119
    call routine_120
    mov word ptr [19bah],0h
    mov word ptr [19b2h],0fa00h
LAB_1000_1776:
    mov DI,word ptr [19bah]
    call far ptr routine_121
    mov [19b6h],AX
    call routine_122
    mov DI,word ptr [19b6h]
    mov BP,1872h
    mov BX,word ptr [19bah]
    call far ptr routine_127
    mov DI,word ptr [19b6h]
    call far ptr thunk_EXT_FUN_0000
    inc word ptr [19bah]
    sub word ptr [19b2h],140h
    jnz LAB_1000_1776
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
FUN_1000_173e endp

routine_90 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,1500h
    mov [19bch],AX
    mov AX,word ptr [BP + 4h]
    mov [1870h],AX
    mov AX,word ptr [BP + Stack[4h]+2h]
    mov ES,AX
    call far ptr routine_119
    call routine_120
    mov word ptr [19bah],0h
    mov word ptr [19b2h],0fa00h
LAB_1000_17de:
    mov DI,word ptr [19bah]
    call far ptr routine_121
    mov [19b6h],AX
    call routine_122
    mov DI,word ptr [19b6h]
    mov BP,1872h
    mov BX,word ptr [19bah]
    call far ptr routine_123
    mov DI,word ptr [19b6h]
    call far ptr routine_124
    inc word ptr [19bah]
    sub word ptr [19b2h],140h
    jnz LAB_1000_17de
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
routine_90 endp

routine_120 proc near
    ret
    db 00h
routine_120 endp

routine_122 proc near
    push ES
    push DS
    pop ES
    cld
    mov SI,word ptr [186eh]
    add SI,1606h
    shr DI,1h
    jnz LAB_1000_182f
    call routine_144
LAB_1000_182f:
    mov CX,140h
    mov word ptr [2558h],CX
    mov DI,1872h
    call routine_145
    sub SI,1606h
    mov word ptr [186eh],SI
    pop ES
    ret
routine_122 endp

routine_144 proc near
    mov AX,1606h
    add AX,200h
    mov [2554h],AX
    mov AX,2769h
    mov [2556h],AX
    mov byte ptr [255ah],0h
    mov byte ptr [255bh],0h
    cmp SI,word ptr [2554h]
    jc LAB_1000_1872
    push BX
    push CX
    push DX
    call word ptr [19bch]
    pop DX
    pop CX
    pop BX
    mov SI,1606h
LAB_1000_1872:
    lodsw
    mov [2562h],AX
    mov byte ptr [2564h],8h
    mov byte ptr [2565h],1h
    or AL,AL
    jns LAB_1000_188a
    dec byte ptr [2565h]
    neg AL
LAB_1000_188a:
    mov [255dh],AL
routine_144 endp

routine_159 proc near
    mov byte ptr [255ch],9h
    mov word ptr [255eh],1ffh
    mov DX,100h
    mov word ptr [2560h],DX
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
routine_159 endp

routine_145 proc near
    cmp byte ptr [2565h],0h
    jz LAB_1000_18ce
    shr word ptr [2558h],1h
LAB_1000_18ce:
    mov AX,[2556h]
    mov word ptr [2556h],SP
    mov SP,AX
    mov DX,word ptr [2560h]
LAB_1000_18db:
    cmp byte ptr [255ah],0h
    jnz LAB_1000_1903
    call routine_156
    cmp AL,90h
    jz LAB_1000_18ef
    mov [255bh],AL
    jmp LAB_1000_190a
    db 90h
LAB_1000_18ef:
    call routine_156
    or AL,AL
    jnz LAB_1000_18fe
    mov AL,90h
    mov [255bh],AL
    jmp LAB_1000_190a
    db 90h
LAB_1000_18fe:
    dec AL
    mov [255ah],AL
LAB_1000_1903:
    mov AL,[255bh]
    dec byte ptr [255ah]
LAB_1000_190a:
    cmp byte ptr [2565h],0h
    jz LAB_1000_1927
    mov AH,AL
    and AL,0fh
    shr AH,1h
    shr AH,1h
    shr AH,1h
    shr AH,1h
    stosw
    dec word ptr [2558h]
    jnz LAB_1000_18db
    jmp LAB_1000_192e
    db 90h
LAB_1000_1927:
    stosb
    dec word ptr [2558h]
    jnz LAB_1000_18db
LAB_1000_192e:
    mov word ptr [2560h],DX
    mov AX,[2556h]
    mov word ptr [2556h],SP
    mov SP,AX
    ret
routine_145 endp

routine_156 proc near
    pop BP
    cmp SP,2769h
    jz LAB_1000_1946
LAB_1000_1943:
    pop AX
    jmp BP
LAB_1000_1946:
    mov BX,word ptr [2562h]
    mov CL,10h
    mov CH,byte ptr [2564h]
    sub CL,CH
    shr BX,CL
    mov CL,CH
LAB_1000_1956:
    cmp CL,byte ptr [255ch]
    jge LAB_1000_197c
    cmp SI,word ptr [2554h]
    jc LAB_1000_196f
    push BX
    push CX
    push DX
    call word ptr [19bch]
    pop DX
    pop CX
    pop BX
    mov SI,1606h
LAB_1000_196f:
    lodsw
    mov [2562h],AX
    shl AX,CL
    or BX,AX
    add CL,10h
    jmp LAB_1000_1956
LAB_1000_197c:
    sub CL,byte ptr [255ch]
    mov byte ptr [2564h],CL
    mov AX,BX
    and AX,word ptr [255eh]
    mov CX,AX
    cmp AX,DX
    jl LAB_1000_199a
    mov CX,DX
    mov AX,[2566h]
    mov BL,byte ptr [2568h]
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
    mov [2568h],AL
    push AX
    mov BX,DX
    add BX,DX
    add BX,DX
    mov byte ptr [BX + 276ch],AL
    mov AX,[2566h]
    mov word ptr [BX + 276ah],AX
    inc DX
    cmp DX,word ptr [255eh]
    jle LAB_1000_19d8
    inc byte ptr [255ch]
    stc
    rcl word ptr [255eh],1h
LAB_1000_19d8:
    mov AL,[255ch]
    cmp AL,byte ptr [255dh]
    jle LAB_1000_19e4
    call routine_159
LAB_1000_19e4:
    mov word ptr [2566h],CX
    jmp LAB_1000_1943
    db 00h
routine_156 endp

routine_23 proc near
    push BP
    mov BP,SP
    sub SP,2h
    push word ptr [BP + Stack[2h]+2h]
    call routine_43
    add SP,2h
    mov word ptr [BP + -2h],AX
    cmp AX,10h
    jnc LAB_1000_1a19
    call routine_44
    mov AX,19beh
    push AX
    call routine_45
    add SP,2h
    sub AX,AX
    push AX
    call routine_8
    add SP,2h
LAB_1000_1a19:
    mov AX,word ptr [BP + -2h]
    mov SP,BP
    pop BP
    ret
routine_23 endp

routine_64 proc near
    push BP
    mov BP,SP
    push word ptr [BP + Stack[2h]+2h]
    call routine_102
    add SP,2h
    or AX,AX
    jz LAB_1000_1a46
    call routine_44
    mov AX,19e8h
    push AX
    call routine_45
    add SP,2h
    sub AX,AX
    push AX
    call routine_8
    add SP,2h
LAB_1000_1a46:
    pop BP
    ret
routine_64 endp

routine_43 proc near
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
    dw 21h
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
routine_43 endp

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
    dw 21h
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
    mov word ptr [3fb2h],0h
    mov byte ptr [3f71h],0h
    mov AL,byte ptr ES:[DI]
    inc DI
    mov [3f6bh],AL
    ret
FUN_1000_1ac2 endp

FUN_1000_1ad8 proc near
    mov byte ptr [3f6ah],9h
    mov word ptr [3f6ch],1ffh
    mov word ptr [3f6eh],100h
    mov BX,276ah
    mov AX,0ffffh
    mov CX,800h
LAB_1000_1af2:
    mov word ptr [BX],AX
    add BX,3h
    loop LAB_1000_1af2
    mov BX,276ah
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
    mov BX,word ptr [3fb2h]
    or BX,BX
    jnz LAB_1000_1b17
    call FUN_1000_1b24
LAB_1000_1b17:
    dec word ptr [3fb2h]
    mov BX,word ptr [3fb2h]
    mov AL,byte ptr [BX + 3f72h]
    ret
FUN_1000_1b0c endp

FUN_1000_1b24 proc near
    push CX
    call FUN_1000_1bc3
    mov word ptr [3fb6h],CX
    cmp CX,word ptr [3f6eh]
    jl LAB_1000_1b4b
    mov AL,[3fb8h]
    mov BX,word ptr [3fb2h]
    mov byte ptr [BX + 3f72h],AL
    inc word ptr [3fb2h]
    mov CX,word ptr [3fb4h]
    mov AX,[3f6eh]
    mov [3fb6h],AX
LAB_1000_1b4b:
    mov BX,276ah
    add BX,CX
    add BX,CX
    add BX,CX
    mov AX,word ptr [BX]
    inc AX
    jz LAB_1000_1b72
    dec AX
    mov CX,AX
    mov AL,byte ptr [BX + 2h]
    mov BX,word ptr [3fb2h]
    cmp BX,40h
    jnc LAB_1000_1b6c
    mov byte ptr [BX + 3f72h],AL
LAB_1000_1b6c:
    inc word ptr [3fb2h]
    jmp LAB_1000_1b4b
LAB_1000_1b72:
    mov AL,byte ptr [BX + 2h]
    mov [3fb8h],AL
    mov BX,word ptr [3fb2h]
    mov byte ptr [BX + 3f72h],AL
    inc word ptr [3fb2h]
    mov CX,word ptr [3f6eh]
    mov BX,276ah
    add BX,CX
    add BX,CX
    add BX,CX
    mov byte ptr [BX + 2h],AL
    mov AX,[3fb4h]
    mov word ptr [BX],AX
    inc word ptr [3f6eh]
    mov AX,[3f6eh]
    cmp AX,word ptr [3f6ch]
    jle LAB_1000_1baf
    inc byte ptr [3f6ah]
    stc
    rcl word ptr [3f6ch],1h
LAB_1000_1baf:
    mov AL,[3f6ah]
    cmp AL,byte ptr [3f6bh]
    jle LAB_1000_1bbb
    call FUN_1000_1ad8
LAB_1000_1bbb:
    mov AX,[3fb6h]
    mov [3fb4h],AX
    pop CX
    ret
FUN_1000_1b24 endp

FUN_1000_1bc3 proc near
    xor DH,DH
    mov DL,byte ptr [3f70h]
    mov BL,byte ptr [3f71h]
    mov CL,8h
    sub CL,BL
    shr DX,CL
LAB_1000_1bd3:
    cmp BL,byte ptr [3f6ah]
    jge LAB_1000_1bed
    mov AL,byte ptr ES:[DI]
    inc DI
    mov [3f70h],AL
    mov CL,BL
    xor AH,AH
    shl AX,CL
    or DX,AX
    add BL,8h
    jmp LAB_1000_1bd3
LAB_1000_1bed:
    sub BL,byte ptr [3f6ah]
    mov byte ptr [3f71h],BL
    mov CX,DX
    and CX,word ptr [3f6ch]
    ret
FUN_1000_1bc3 endp

routine_58 proc near
    mov word ptr [1a0ah],1h
    mov word ptr [1a14h],1h
    mov word ptr [1a00h],0h
    mov word ptr [1a02h],0h
    call routine_94
    mov AH,35h
    mov AL,8h
    dw 21h
    mov word ptr CS:[var_2],BX
    mov word ptr CS:[var_3],ES
    push DS
    mov AH,25h
    mov AL,8h
    lds DX,CS:dword ptr [var_1]
    dw 21h
    pop DS
    mov byte ptr [19ffh],1h
    ret
routine_58 endp

routine_62 proc near
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
    dw 21h
    pop DS
    mov byte ptr [19ffh],0h
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
routine_62 endp

routine_94 proc near
    pushf
    cli
    mov byte ptr [1a0ch],1h
    xor AX,AX
    mov byte ptr [1a13h],1h
    mov [1a0fh],AX
    mov [1a11h],AX
    call routine_129
    mov BX,AX
    mov CX,10h
LAB_1000_1d92:
    push BX
    call routine_129
    pop BX
    sub BX,AX
    add word ptr [1a0fh],BX
    adc word ptr [1a11h],0h
    mov BX,AX
    loop LAB_1000_1d92
    mov AX,[1a0fh]
    mov DX,word ptr [1a11h]
    add word ptr [1a00h],AX
    adc word ptr [1a02h],DX
    mov CX,10h
    div CX
    shr AX,1h
    mov [1a0fh],AX
    mov BX,AX
    shr BX,1h
    shr BX,1h
    shr BX,1h
    shr BX,1h
    add AX,BX
    xor DX,DX
    mov BX,0f89h
    div BX
    cmp AX,4h
    jc LAB_1000_1ddf
    cmp AX,6h
    ja LAB_1000_1ddf
    jmp LAB_1000_1ded
    db 90h
LAB_1000_1ddf:
    mov byte ptr [1a13h],0h
    mov word ptr [1a0fh],4daeh
    mov AX,5h
LAB_1000_1ded:
    mov [1a0dh],AX
    cmp word ptr [1a0ah],1h
    jz LAB_1000_1dfa
    mov [1a0ah],AX
LAB_1000_1dfa:
    mov AX,[1a0fh]
    xor DX,DX
    div word ptr [1a0ah]
    mov [1a06h],AX
    mov [1a04h],AX
    popf
    ret
routine_94 endp

routine_129 proc near
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
routine_129 endp

routine_69 proc near
    xor AH,AH
    dw 1ah
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
    mov BX,word ptr [1c20h]
    mov word ptr [BX + 6h],0h
    les BX,dword ptr [5ab6h]
    cmp word ptr ES:[BX + 30h],0h
    jz LAB_1000_1e96
    jmp LAB_1000_214e
LAB_1000_1e96:
    les BX,dword ptr [403ah]
    cmp word ptr ES:[BX + 4eh],1h
    jz LAB_1000_1ea4
    jmp LAB_1000_1f4a
LAB_1000_1ea4:
    mov AX,3h
    push AX
    call far ptr routine_52
    add SP,2h
    mov BX,word ptr [1c20h]
    push word ptr [BX]
    mov AX,1ad3h
    push AX
    call routine_54
    add SP,4h
    mov AX,0fah
    push AX
    mov AX,0b3h
    push AX
    mov AX,24h
    push AX
    mov AX,1adch
    push AX
    push word ptr [1c20h]
    call routine_48
    add SP,0ah
    mov AX,0fah
    push AX
    mov AX,0bch
    push AX
    mov AX,24h
    push AX
    mov AX,1b0ah
    push AX
    push word ptr [1c20h]
    call routine_48
    add SP,0ah
    mov word ptr [1c16h],4h
    mov word ptr [1c0eh],0h
    mov word ptr [BP + -2h],0h
    jmp LAB_1000_1f0b
    db 90h
LAB_1000_1f08:
    inc word ptr [BP + -2h]
LAB_1000_1f0b:
    mov SI,word ptr [BP + -2h]
    les BX,dword ptr [403ah]
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
    mov AX,3fd0h
    push AX
    push word ptr [1c20h]
    call routine_48
    add SP,0ah
    mov word ptr [1c0eh],7h
    mov word ptr [1c16h],1h
    jmp LAB_1000_2141
    db 90h
LAB_1000_1f4a:
    les BX,dword ptr [403ah]
    cmp word ptr ES:[BX + 4eh],2h
    jnz LAB_1000_1fa8
    mov AX,2h
    push AX
    call far ptr routine_52
    add SP,2h
    mov BX,word ptr [1c20h]
    push word ptr [BX]
    mov AX,1b27h
    push AX
    call routine_54
    add SP,4h
    mov AX,0fah
    push AX
    mov AX,0adh
    push AX
    mov AX,24h
    push AX
    mov AX,1b31h
    push AX
    push word ptr [1c20h]
    call routine_48
    add SP,0ah
    mov AX,0fah
    push AX
    mov AX,0b6h
    push AX
    mov AX,24h
    push AX
    mov AX,1b54h
    push AX
    push word ptr [1c20h]
    call routine_48
    add SP,0ah
    jmp LAB_1000_2141
LAB_1000_1fa8:
    les BX,dword ptr [403ah]
    cmp word ptr ES:[BX + 20h],6h
    jc LAB_1000_1fb6
    jmp LAB_1000_206b
LAB_1000_1fb6:
    mov BX,word ptr ES:[BX + 20h]
    shl BX,1h
    shl BX,1h
    mov SI,word ptr [403ah]
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
    call far ptr routine_52
    add SP,2h
    mov BX,word ptr [1c20h]
    push word ptr [BX]
    mov AX,1b7dh
    push AX
    call routine_54
    add SP,4h
    mov word ptr [1c0eh],1h
    mov AX,0fah
    push AX
    mov AX,0aeh
    push AX
    mov AX,24h
    push AX
    mov AX,1b87h
    push AX
    push word ptr [1c20h]
    call routine_48
    add SP,0ah
    mov AX,1bb2h
    push AX
    mov AX,3fd0h
    push AX
    call routine_67
    add SP,4h
    les BX,dword ptr [403ah]
    inc word ptr ES:[BX + 20h]
    mov SI,word ptr ES:[BX + 20h]
    shl SI,1h
    push word ptr [SI + 1c3ah]
    mov AX,3fd0h
    push AX
    call routine_68
    add SP,4h
    mov AX,0fah
    push AX
    mov AX,0b7h
    push AX
    mov AX,24h
    push AX
    mov AX,3fd0h
    push AX
    push word ptr [1c20h]
    call routine_48
    add SP,0ah
    call far ptr routine_57
    call far ptr routine_49
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
    mov AX,[59beh]
    mov DX,word ptr [59c0h]
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
    les BX,dword ptr [403ah]
    test word ptr ES:[BX + 22h],AX
    jz LAB_1000_20b5
    jmp LAB_1000_214e
LAB_1000_20b5:
    call far ptr routine_50
    mov AX,0ah
    push AX
    call far ptr routine_52
    add SP,2h
    mov BX,word ptr [1c20h]
    push word ptr [BX]
    mov AX,1bcdh
    push AX
    call routine_54
    add SP,4h
    mov word ptr [1c0eh],0fh
    mov AX,0fah
    push AX
    mov AX,0aeh
    push AX
    mov AX,24h
    push AX
    mov AX,1bd7h
    push AX
    push word ptr [1c20h]
    call routine_48
    add SP,0ah
    mov AX,1c05h
    push AX
    mov AX,3fd0h
    push AX
    call routine_67
    add SP,4h
    mov BX,word ptr [BP + -2h]
    shl BX,1h
    push word ptr [BX + 1c60h]
    mov AX,3fd0h
    push AX
    call routine_68
    add SP,4h
    mov AX,0fah
    push AX
    mov AX,0b7h
    push AX
    mov AX,24h
    push AX
    mov AX,3fd0h
    push AX
    push word ptr [1c20h]
    call routine_48
    add SP,0ah
    les BX,dword ptr [403ah]
    mov AX,1h
    mov CL,byte ptr [BP + -2h]
    shl AX,CL
    or word ptr ES:[BX + 22h],AX
LAB_1000_2141:
    call far ptr routine_57
    call far ptr routine_49
    call routine_66
LAB_1000_214e:
    mov AX,0c7h
    push AX
    mov AX,13fh
    push AX
    sub AX,AX
    push AX
    push AX
    push word ptr [1c20h]
    call routine_47
    add SP,0ah
    call far ptr routine_49
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
    les BX,dword ptr [5ab6h]
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
    and AX,3h
    mov [550ch],AX
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
    mov [5502h],AX
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
    mov [55f4h],AX
    mov AX,word ptr [BP + 0ch]
    mov [55fah],AX
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
    call far ptr routine_57
    mov word ptr [3fc0h],0h
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
    mov byte ptr [3fc2h],0h
LAB_1000_22a8:
    call far ptr routine_57
    mov AX,32h
    imul word ptr [BP + -14h]
    mov SI,AX
    mov BX,word ptr [BP + 4h]
    test word ptr [BX + SI + 30h],100h
    jnz LAB_1000_22c5
    mov word ptr [3fc0h],1h
LAB_1000_22c5:
    push word ptr [BP + 0ch]
    mov AX,32h
    imul word ptr [BP + -14h]
    add AX,BX
    push AX
    push word ptr [BP + 0ah]
    call routine_98
    add SP,6h
    cmp byte ptr [3fbch],0h
    jnz LAB_1000_22e8
    cmp byte ptr [550fh],0h
    jz LAB_1000_22a8
LAB_1000_22e8:
    cmp byte ptr [550fh],0h
    jnz LAB_1000_22f2
    jmp LAB_1000_23c2
LAB_1000_22f2:
    mov AX,[5502h]
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
    imul word ptr [5502h]
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
    call far ptr routine_99
    add SP,0eh
    mov word ptr [BP + -6h],3h
    mov AX,32h
    imul word ptr [5502h]
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
    call far ptr routine_99
    add SP,0eh
    mov word ptr [BP + -6h],0dh
    mov AX,32h
    imul word ptr [5502h]
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
    call far ptr routine_99
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
    mov AX,[5502h]
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
    imul word ptr [5502h]
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
    call far ptr routine_99
    add SP,0eh
    mov word ptr [BP + -6h],3h
    mov AX,32h
    imul word ptr [5502h]
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
    call far ptr routine_99
    add SP,0eh
    mov word ptr [BP + -6h],0dh
    mov AX,32h
    imul word ptr [5502h]
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
    call far ptr routine_99
    add SP,0eh
    mov word ptr [BP + -6h],0bh
    mov AX,32h
    imul word ptr [5502h]
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
    call far ptr routine_99
    add SP,0eh
LAB_1000_2514:
    mov AX,32h
    imul word ptr [5502h]
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
    call far ptr routine_99
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
    mov [5502h],AX
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
    and AX,0fh
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
    call far ptr routine_99
    add SP,0eh
LAB_1000_25ce:
    jmp LAB_1000_25ee
LAB_1000_25d0:
    mov BX,word ptr [BP + 4h]
    mov word ptr [BX + 2eh],0h
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX + 12h]
    and AX,0fh
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
    call far ptr routine_99
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
    mov AX,[55f4h]
    cmp word ptr [BX],AX
    ja LAB_1000_263e
    cmp word ptr [BX + 4h],AX
    jc LAB_1000_263e
    mov AX,[55fah]
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
    mov [3fbah],AX
    mov byte ptr [1a1ch],0h
    sub AX,AX
    mov word ptr [BP + -0ah],AX
    mov word ptr [BP + -8h],AX
    sub AL,AL
    mov byte ptr [BP + -0ch],AL
    mov [3fc4h],AL
    mov [550fh],AL
    mov [3fbch],AL
    cmp byte ptr [3fc2h],1h
    jnz LAB_1000_268e
    mov [1a1ah],AL
    mov byte ptr [BP + -0ch],1h
LAB_1000_268e:
    les BX,dword ptr [5ab6h]
    cmp word ptr ES:[BX + 72h],1h
    jnz LAB_1000_26bb
    sub AX,AX
    push AX
    call far ptr routine_61
    add SP,2h
    mov word ptr [BP + -8h],AX
    mov AX,1h
    push AX
    call far ptr routine_61
    add SP,2h
    mov word ptr [BP + -0ah],AX
    call far ptr routine_134
LAB_1000_26bb:
    call far ptr routine_31
    or AL,AL
    jz LAB_1000_26ec
    cmp word ptr [BP + -8h],0h
    jnz LAB_1000_26ec
    cmp word ptr [BP + -0ah],0h
    jnz LAB_1000_26ec
    cmp byte ptr [15fah],4eh
    jc LAB_1000_26ec
    cmp byte ptr [15fah],0b2h
    ja LAB_1000_26ec
    cmp byte ptr [15fbh],4eh
    jc LAB_1000_26ec
    cmp byte ptr [15fbh],0b2h
    jbe LAB_1000_26f5
LAB_1000_26ec:
    cmp byte ptr [BP + -0ch],1h
    jz LAB_1000_26f5
    jmp LAB_1000_2a82
LAB_1000_26f5:
    cmp byte ptr [3fc2h],1h
    jnz LAB_1000_270c
    cmp byte ptr [1a1ah],0fh
    jbe LAB_1000_270c
    mov byte ptr [BP + -0ch],0h
    mov byte ptr [3fc2h],0h
LAB_1000_270c:
    les BX,dword ptr [5ab6h]
    cmp word ptr ES:[BX + 72h],1h
    jnz LAB_1000_2739
    sub AX,AX
    push AX
    call far ptr routine_61
    add SP,2h
    mov word ptr [BP + -8h],AX
    mov AX,1h
    push AX
    call far ptr routine_61
    add SP,2h
    mov word ptr [BP + -0ah],AX
    call far ptr routine_134
LAB_1000_2739:
    cmp byte ptr [15feh],0h
    jz LAB_1000_274f
    call routine_44
    call routine_28
    sub AX,AX
    push AX
    call routine_8
    add SP,2h
LAB_1000_274f:
    cmp word ptr [3fc0h],1h
    jnz LAB_1000_27b1
    cmp byte ptr [1a1ch],6h
    jbe LAB_1000_27b1
    mov byte ptr [1a1ch],0h
    mov SI,word ptr [3fbeh]
    shl SI,1h
    add SI,word ptr [3fbah]
    add SI,2h
    mov AX,word ptr [SI]
    mov CL,4h
    shr AX,CL
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [SI]
    and AX,0fh
    mov word ptr [BP + -4h],AX
    push AX
    push word ptr [BP + -6h]
    mov BX,word ptr [BP + 6h]
    push word ptr [BX + 0eh]
    push word ptr [BX + 0ch]
    push word ptr [BX + 0ah]
    push word ptr [BX + 8h]
    push word ptr [BP + 8h]
    call far ptr routine_99
    add SP,0eh
    inc word ptr [3fbeh]
    mov AX,[3fbeh]
    sub DX,DX
    mov BX,word ptr [3fbah]
    div word ptr [BX]
    mov word ptr [3fbeh],DX
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
    cmp byte ptr [1a1dh],12h
    ja LAB_1000_27d2
    jmp LAB_1000_2a7f
LAB_1000_27d2:
    mov byte ptr [1a1dh],0h
    cmp byte ptr [3fc3h],0h
    jnz LAB_1000_27e1
    jmp LAB_1000_2a69
LAB_1000_27e1:
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f06h]
    and AX,3fh
    jmp LAB_1000_2a3f
caseD_c_2a4a:
caseD_1_5160:
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [1caeh]
    sub AX,2h
    mov BX,word ptr [20e2h]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [1cb0h]
    sub AX,2h
    mov BX,word ptr [20e2h]
    mov word ptr [BX + 0ah],AX
    mov BX,word ptr [4a28h]
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
    mov BX,word ptr [20e2h]
    mov word ptr [BX + 2h],11eh
    jmp LAB_1000_2875
LAB_1000_286c:
    mov BX,word ptr [20e2h]
    mov word ptr [BX + 2h],12dh
LAB_1000_2875:
    push word ptr [20e2h]
    call far ptr routine_55
    add SP,2h
    jmp LAB_1000_2a67
caseD_3_2a4a:
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [1caeh]
    sub AX,2h
    mov BX,word ptr [2122h]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [1cb0h]
    sub AX,2h
    mov BX,word ptr [2122h]
    mov word ptr [BX + 0ah],AX
    push word ptr [2122h]
    call far ptr routine_55
    add SP,2h
    jmp LAB_1000_2a67
caseD_2_2a4a:
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [1caeh]
    sub AX,2h
    mov BX,word ptr [2162h]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [1cb0h]
    sub AX,2h
    mov BX,word ptr [2162h]
    mov word ptr [BX + 0ah],AX
    push word ptr [2162h]
    call far ptr routine_55
    add SP,2h
    jmp LAB_1000_2a67
caseD_5_2a4a:
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [1caeh]
    mov BX,word ptr [21e2h]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [1cb0h]
    mov BX,word ptr [21e2h]
    mov word ptr [BX + 0ah],AX
    push word ptr [21e2h]
    call far ptr routine_55
    add SP,2h
    jmp LAB_1000_2a67
caseD_8_2a4a:
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [1caeh]
    sub AX,2h
    mov BX,word ptr [2122h]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [1cb0h]
    sub AX,2h
    mov BX,word ptr [2122h]
    mov word ptr [BX + 0ah],AX
    push word ptr [2122h]
    call far ptr routine_55
    add SP,2h
    jmp LAB_1000_2a67
caseD_a_2a4a:
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [1caeh]
    mov BX,word ptr [21e2h]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [1cb0h]
    mov BX,word ptr [21e2h]
    mov word ptr [BX + 0ah],AX
    push word ptr [21e2h]
    call far ptr routine_55
    add SP,2h
    jmp LAB_1000_2a67
    db 0EBh
    db 28h
LAB_1000_2a3f:
    sub AX,1h
    cmp AX,0bh
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
    push word ptr [4a28h]
    call routine_135
    add SP,2h
caseD_6_2a4a:
caseD_7_5402:
caseD_9_5403:
caseD_b_5404:
caseD_4_5405:
    cmp byte ptr [3fc3h],1h
    sbb AX,AX
    neg AX
    mov [3fc3h],AL
LAB_1000_2a7f:
    jmp LAB_1000_26bb
LAB_1000_2a82:
    call far ptr routine_31
    or AL,AL
    jnz LAB_1000_2a95
    call far ptr routine_32
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
    cmp byte ptr [15fah],4eh
    jnc LAB_1000_2ac2
    mov word ptr [BP + -10h],4b00h
    mov byte ptr [3fc2h],1h
    jmp LAB_1000_2af9
LAB_1000_2ac2:
    cmp byte ptr [15fah],0b2h
    jbe LAB_1000_2ad5
    mov word ptr [BP + -10h],4d00h
    mov byte ptr [3fc2h],1h
    jmp LAB_1000_2af9
LAB_1000_2ad5:
    cmp byte ptr [15fbh],4eh
    jnc LAB_1000_2ae8
    mov word ptr [BP + -10h],4800h
    mov byte ptr [3fc2h],1h
    jmp LAB_1000_2af9
LAB_1000_2ae8:
    cmp byte ptr [15fbh],0b2h
    jbe LAB_1000_2af9
    mov word ptr [BP + -10h],5000h
    mov byte ptr [3fc2h],1h
LAB_1000_2af9:
    cmp byte ptr [BP + -10h],0dh
    jnz LAB_1000_2b04
    mov byte ptr [550fh],1h
LAB_1000_2b04:
    cmp word ptr [BP + -10h],1000h
    jnz LAB_1000_2b15
    mov byte ptr [15feh],1h
    mov byte ptr [550fh],1h
LAB_1000_2b15:
    cmp word ptr [BP + -10h],4800h
    jnz LAB_1000_2b39
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX + 2h]
    sub word ptr [55fah],AX
    mov AX,[55fah]
    cmp word ptr [BX + 8h],AX
    jle LAB_1000_2b34
    mov AX,word ptr [BX + 8h]
    mov [55fah],AX
LAB_1000_2b34:
    mov byte ptr [3fbch],1h
LAB_1000_2b39:
    cmp word ptr [BP + -10h],5000h
    jnz LAB_1000_2b5d
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX + 2h]
    add word ptr [55fah],AX
    mov AX,[55fah]
    cmp word ptr [BX + 0ah],AX
    jnc LAB_1000_2b58
    mov AX,word ptr [BX + 0ah]
    mov [55fah],AX
LAB_1000_2b58:
    mov byte ptr [3fbch],1h
LAB_1000_2b5d:
    cmp word ptr [BP + -10h],4d00h
    jnz LAB_1000_2b80
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    add word ptr [55f4h],AX
    mov AX,[55f4h]
    cmp word ptr [BX + 6h],AX
    jnc LAB_1000_2b7b
    mov AX,word ptr [BX + 6h]
    mov [55f4h],AX
LAB_1000_2b7b:
    mov byte ptr [3fbch],1h
LAB_1000_2b80:
    cmp word ptr [BP + -10h],4b00h
    jnz LAB_1000_2bb1
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    sub word ptr [55f4h],AX
    mov AX,[55f4h]
    cmp word ptr [BX + 4h],AX
    jle LAB_1000_2b9e
    mov AX,word ptr [BX + 4h]
    mov [55f4h],AX
LAB_1000_2b9e:
    mov AX,[55fah]
    cmp word ptr [BX + 8h],AX
    jle LAB_1000_2bac
    mov AX,word ptr [BX]
    add word ptr [55f4h],AX
LAB_1000_2bac:
    mov byte ptr [3fbch],1h
LAB_1000_2bb1:
    mov BX,word ptr [BP + 6h]
    test word ptr [BX + 30h],800h
    jz LAB_1000_2bcc
    test word ptr [BX + 30h],1000h
    jz LAB_1000_2bcc
    push word ptr [4a28h]
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
    and AX,7h
    cmp AX,7h
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
    call routine_47
    add SP,0ah
    mov BX,word ptr [BP + 8h]
    mov word ptr [BX + 4h],0h
    lea AX,[BP + -6h]
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,1cb6h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,8h
    push AX
    mov AX,82h
    push AX
    mov AX,0f0h
    push AX
    mov AX,50h
    push AX
    mov AX,4824h
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
    call routine_47
    add SP,0ah
    cmp byte ptr [55feh],1h
    jnz LAB_1000_2cc2
    mov AX,28h
    push AX
    mov AX,30h
    push AX
    push word ptr [5cc4h]
    push word ptr [5cc2h]
    sub AX,AX
    push AX
    mov AX,96h
    push AX
    sub AX,AX
    push AX
    mov AX,1h
    push AX
    call far ptr routine_103
    add SP,10h
    mov byte ptr [55feh],0h
LAB_1000_2cc2:
    mov word ptr [4a28h],0h
    mov AX,270fh
    push AX
    push word ptr [BP + 8h]
    call routine_132
    add SP,4h
    mov [4f00h],AX
    push AX
    call routine_63
    add SP,2h
    mov [59beh],AX
    mov word ptr [59c0h],DX
    mov AX,1cd8h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,1cdah
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,57h
    push AX
    mov AX,46h
    push AX
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_48
    add SP,0ah
    mov AX,1ce2h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,57h
    push AX
    mov AX,4eh
    push AX
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_48
    add SP,0ah
    mov AX,1cf1h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    lea AX,[BP + -1eh]
    push AX
    push word ptr [59c0h]
    push word ptr [59beh]
    call routine_107
    add SP,6h
    lea AX,[BP + -1eh]
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,57h
    push AX
    mov AX,56h
    push AX
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_48
    add SP,0ah
    les BX,dword ptr [5ab6h]
    cmp word ptr ES:[BX + 30h],0h
    jz LAB_1000_2dc9
    mov AX,57h
    push AX
    mov AX,60h
    push AX
    mov AX,0e8h
    push AX
    mov AX,1cf3h
    push AX
    push word ptr [BP + 8h]
    call routine_48
    add SP,0ah
    mov AX,57h
    push AX
    mov AX,68h
    push AX
    mov AX,0e8h
    push AX
    mov AX,1d03h
    push AX
    push word ptr [BP + 8h]
    call routine_48
    add SP,0ah
    jmp LAB_1000_2e53
LAB_1000_2dc9:
    mov AX,1d12h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,1d14h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,57h
    push AX
    mov AX,6ch
    push AX
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_48
    add SP,0ah
    mov AX,1d21h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    lea AX,[BP + -1eh]
    push AX
    les BX,dword ptr [403ah]
    mov AX,word ptr ES:[BX + 32h]
    mov DX,word ptr ES:[BX + 34h]
    add AX,word ptr [59beh]
    adc DX,word ptr [59c0h]
    push DX
    push AX
    call routine_107
    add SP,6h
    lea AX,[BP + -1eh]
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,57h
    push AX
    mov AX,74h
    push AX
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_48
    add SP,0ah
LAB_1000_2e53:
    mov BX,word ptr [BP + 8h]
    mov word ptr [BX + 4h],0dh
    mov AX,1d23h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,57h
    push AX
    mov AX,14h
    push AX
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_48
    add SP,0ah
    mov BX,word ptr [BP + 8h]
    mov word ptr [BX + 4h],0h
    mov AX,1d33h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,1eh
    push AX
    mov AX,0f0h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_56
    add SP,8h
    mov AX,4824h
    push AX
    mov AX,[5600h]
    add AX,word ptr [59c2h]
    push AX
    call routine_133
    add SP,4h
    mov AX,1eh
    push AX
    mov AX,131h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_56
    add SP,8h
    mov AX,1d43h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,26h
    push AX
    mov AX,0f0h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_56
    add SP,8h
    mov AX,4824h
    push AX
    mov AX,[5508h]
    add AX,word ptr [5abah]
    sub AX,word ptr [5600h]
    sub AX,word ptr [59c2h]
    push AX
    call routine_133
    add SP,4h
    mov AX,26h
    push AX
    mov AX,131h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_56
    add SP,8h
    mov AX,1d51h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,2eh
    push AX
    mov AX,0f0h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_56
    add SP,8h
    mov AX,4824h
    push AX
    push word ptr [4248h]
    call routine_133
    add SP,4h
    mov AX,2eh
    push AX
    mov AX,131h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_56
    add SP,8h
    mov AX,1d5eh
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,36h
    push AX
    mov AX,0f0h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_56
    add SP,8h
    mov AX,4824h
    push AX
    mov AX,[550ah]
    add AX,word ptr [5abeh]
    add AX,word ptr [424ah]
    push AX
    call routine_133
    add SP,4h
    mov AX,36h
    push AX
    mov AX,131h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_56
    add SP,8h
    mov byte ptr [55eeh],1h
LAB_1000_2fbf:
    mov AX,32h
    mul word ptr [BP + 6h]
    mov SI,AX
    mov BX,word ptr [BP + 4h]
    test word ptr [BX + SI + 30h],1000h
    jnz LAB_1000_2fd4
    jmp LAB_1000_35db
LAB_1000_2fd4:
    cmp byte ptr [55eeh],1h
    jz LAB_1000_2fde
    jmp LAB_1000_30cc
LAB_1000_2fde:
    mov byte ptr [55eeh],0h
    mov byte ptr [55feh],0h
    push word ptr [2082h]
    call far ptr routine_55
    add SP,2h
    sub AX,AX
    mov [55fch],AX
    mov [55f2h],AX
    mov [4a28h],AX
    mov AX,95h
    push AX
    mov AX,13fh
    push AX
    mov AX,0ah
    push AX
    mov AX,0ebh
    push AX
    push word ptr [BP + 8h]
    call routine_47
    add SP,0ah
    mov AX,100h
    push AX
    call routine_63
    add SP,2h
    mov [59beh],AX
    mov word ptr [59c0h],DX
    mov AX,1d6fh
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,1d71h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,57h
    push AX
    mov AX,64h
    push AX
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_48
    add SP,0ah
    mov AX,1d79h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,57h
    push AX
    mov AX,6ch
    push AX
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_48
    add SP,0ah
    mov AX,1d88h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    lea AX,[BP + -1eh]
    push AX
    push word ptr [59c0h]
    push word ptr [59beh]
    call routine_107
    add SP,6h
    lea AX,[BP + -1eh]
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,57h
    push AX
    mov AX,74h
    push AX
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_48
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
    call routine_47
    add SP,0ah
    mov BX,word ptr [BP + 8h]
    mov word ptr [BX + 4h],0dh
    mov AX,1d8ah
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,57h
    push AX
    mov AX,14h
    push AX
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_48
    add SP,0ah
    mov AX,1d98h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    lea AX,[BP + -1eh]
    push AX
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    push word ptr [BX + 4f02h]
    call routine_106
    add SP,4h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,1eh
    push AX
    mov AX,0f0h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_56
    add SP,8h
    mov AX,[4a28h]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AL,byte ptr [SI + 4f07h]
    and AX,7fh
    mov word ptr [BP + -20h],AX
    mov AL,byte ptr [SI + 4f06h]
    and AX,3fh
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
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,1da0h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + 425ch]
    and BX,7fh
    shl BX,1h
    push word ptr [BX + 5608h]
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,1da2h
    push AX
    mov AX,4824h
    push AX
    call routine_68
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
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,1dadh
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
LAB_1000_3206:
    jmp caseD_4_343d
caseD_3_343d:
    mov AX,word ptr [BP + -20h]
    mov CL,5h
    shl AX,CL
    add AX,198h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,1db8h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,word ptr [BP + -20h]
    mov CL,5h
    shl AX,CL
    add AX,19fh
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,1dbah
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    jmp caseD_4_343d
caseD_2_343d:
    mov BX,word ptr [BP + -20h]
    shl BX,1h
    push word ptr [BX + 5608h]
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,1dc5h
    push AX
    mov AX,4824h
    push AX
    call routine_68
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
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,1dd0h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    mov BX,word ptr [BX + 425ch]
    and BX,7fh
    shl BX,1h
    push word ptr [BX + 5608h]
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,1dd2h
    push AX
    mov AX,4824h
    push AX
    call routine_68
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
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,1de6h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
LAB_1000_32ff:
    jmp caseD_4_343d
caseD_5_343d:
    mov AX,1dfah
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,12h
    mul word ptr [BP + -20h]
    add AX,3f8h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,1e02h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    jmp caseD_4_343d
caseD_8_343d:
    cmp word ptr [4a28h],0h
    jnz LAB_1000_338f
    mov AX,1e0bh
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov BX,word ptr [4804h]
    mov CL,4h
    shl BX,CL
    mov SI,word ptr [BX + 424eh]
    or SI,SI
    jz LAB_1000_336e
    mov BX,SI
    shl BX,1h
    push word ptr [BX + 5608h]
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    jmp LAB_1000_338c
LAB_1000_336e:
    mov BX,word ptr [4804h]
    mov CL,4h
    shl BX,CL
    mov BL,byte ptr [BX + 425ch]
    sub BH,BH
    shl BX,1h
    push word ptr [BX + 5608h]
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
LAB_1000_338c:
    jmp LAB_1000_342e
LAB_1000_338f:
    mov AX,1e1ah
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    les BX,dword ptr [5ab6h]
    mov AX,word ptr ES:[BX + 26h]
    jmp LAB_1000_341d
LAB_1000_33a7:
    mov AX,1e28h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    jmp LAB_1000_342e
LAB_1000_33b7:
    les BX,dword ptr [5ab6h]
    cmp word ptr ES:[BX + 28h],0h
    jnz LAB_1000_33d9
    cmp word ptr [550ch],0h
    jz LAB_1000_33d9
    mov AX,1e30h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    jmp LAB_1000_3409
LAB_1000_33d9:
    les BX,dword ptr [5ab6h]
    cmp word ptr ES:[BX + 28h],0h
    jnz LAB_1000_33fb
    cmp word ptr [550ch],0h
    jnz LAB_1000_33fb
    mov AX,1e3dh
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    jmp LAB_1000_3409
LAB_1000_33fb:
    mov AX,1e46h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
LAB_1000_3409:
    jmp LAB_1000_342e
LAB_1000_340b:
    mov AX,1e54h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    jmp LAB_1000_342e
    db 0EBh
    db 11h
LAB_1000_341d:
    cmp AX,1h
    jz LAB_1000_33a7
    cmp AX,2h
    jz LAB_1000_33b7
    cmp AX,3h
    jz LAB_1000_340b
    jmp LAB_1000_342e
LAB_1000_342e:
    jmp caseD_4_343d
    db 0EBh
    db 28h
LAB_1000_3432:
    sub AX,1h
    cmp AX,0bh
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
caseD_4_6450:
    mov AX,8h
    push AX
    mov AX,26h
    push AX
    mov AX,0f0h
    push AX
    mov AX,50h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_130
    add SP,0ch
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],80h
    jz LAB_1000_34b1
    mov AX,1e61h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,57h
    push AX
    mov BX,word ptr [BP + 8h]
    push word ptr [BX + 0ah]
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push BX
    call routine_48
    add SP,0ah
LAB_1000_34b1:
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],40h
    jz LAB_1000_34eb
    mov AX,1e74h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,57h
    push AX
    mov BX,word ptr [BP + 8h]
    push word ptr [BX + 0ah]
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push BX
    call routine_48
    add SP,0ah
LAB_1000_34eb:
    push word ptr [4a28h]
    call routine_63
    add SP,2h
    mov [59beh],AX
    mov word ptr [59c0h],DX
    mov AX,1e87h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,1e89h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,57h
    push AX
    mov AX,46h
    push AX
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_48
    add SP,0ah
    mov AX,1e94h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,57h
    push AX
    mov AX,4eh
    push AX
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_48
    add SP,0ah
    mov AX,1ea3h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    lea AX,[BP + -1eh]
    push AX
    push word ptr [59c0h]
    push word ptr [59beh]
    call routine_107
    add SP,6h
    lea AX,[BP + -1eh]
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,57h
    push AX
    mov AX,56h
    push AX
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 8h]
    call routine_48
    add SP,0ah
    call routine_131
    lea AX,[BP + -6h]
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    mov AX,1ea5h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,8h
    push AX
    mov AX,82h
    push AX
    mov AX,0f0h
    push AX
    mov AX,50h
    push AX
    mov AX,4824h
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
    and AX,3fh
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
    add AX,word ptr [1caeh]
    sub AX,2h
    mov BX,word ptr [20c2h]
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
    add AX,word ptr [1cb0h]
    sub AX,2h
    mov BX,word ptr [20c2h]
    mov word ptr [BX + 0ah],AX
    mov BX,word ptr [4a28h]
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
    mov BX,word ptr [20c2h]
    mov word ptr [BX + 2h],11eh
    jmp LAB_1000_3675
LAB_1000_366c:
    mov BX,word ptr [20c2h]
    mov word ptr [BX + 2h],12dh
LAB_1000_3675:
    push word ptr [20c2h]
    call far ptr routine_55
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
    add AX,word ptr [1caeh]
    sub AX,2h
    mov BX,word ptr [2102h]
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
    add AX,word ptr [1cb0h]
    sub AX,2h
    mov BX,word ptr [2102h]
    mov word ptr [BX + 0ah],AX
    push word ptr [2102h]
    call far ptr routine_55
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
    add AX,word ptr [1caeh]
    sub AX,2h
    mov BX,word ptr [2142h]
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
    add AX,word ptr [1cb0h]
    sub AX,2h
    mov BX,word ptr [2142h]
    mov word ptr [BX + 0ah],AX
    push word ptr [2142h]
    call far ptr routine_55
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
    add AX,word ptr [1caeh]
    mov BX,word ptr [21c2h]
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
    add AX,word ptr [1cb0h]
    mov BX,word ptr [21c2h]
    mov word ptr [BX + 0ah],AX
    push word ptr [21c2h]
    call far ptr routine_55
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
    add AX,word ptr [1caeh]
    sub AX,2h
    mov BX,word ptr [2102h]
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
    add AX,word ptr [1cb0h]
    sub AX,2h
    mov BX,word ptr [2102h]
    mov word ptr [BX + 0ah],AX
    push word ptr [2102h]
    call far ptr routine_55
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
    add AX,word ptr [1caeh]
    mov BX,word ptr [21c2h]
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
    add AX,word ptr [1cb0h]
    mov BX,word ptr [21c2h]
    mov word ptr [BX + 0ah],AX
    push word ptr [21c2h]
    call far ptr routine_55
    add SP,2h
    jmp caseD_3_3840
    db 0EBh
    db 28h
LAB_1000_3835:
    sub AX,1h
    cmp AX,0bh
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
    cmp byte ptr [55feh],1h
    jnz LAB_1000_389a
    mov AX,28h
    push AX
    mov AX,30h
    push AX
    push word ptr [5cc4h]
    push word ptr [5cc2h]
    sub AX,AX
    push AX
    mov AX,96h
    push AX
    sub AX,AX
    push AX
    mov AX,1h
    push AX
    call far ptr routine_103
    add SP,10h
    mov byte ptr [55feh],0h
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
    call routine_47
    add SP,0ah
    mov AX,26h
    push AX
    mov AX,0f0h
    push AX
    mov AX,1ecbh
    push AX
    push word ptr [BP + 4h]
    call routine_56
    add SP,8h
LAB_1000_38c8:
    inc word ptr [4a28h]
    mov BX,word ptr [4a28h]
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
    call routine_47
    add SP,0ah
    mov AX,1ed6h
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    lea AX,[BP + -16h]
    push AX
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    push word ptr [BX + 4f02h]
    call routine_106
    add SP,4h
    push AX
    mov AX,4824h
    push AX
    call routine_68
    add SP,4h
    mov AX,1eh
    push AX
    mov AX,0f0h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 4h]
    call routine_56
    add SP,8h
    sub AX,AX
    push AX
    call far ptr routine_104
    add SP,2h
    cmp word ptr [55f2h],0h
    jnz LAB_1000_39b9
    cmp word ptr [55fch],0h
    jnz LAB_1000_39b9
    mov AX,[4a28h]
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
    mov AL,[4f05h]
    cbw
    push AX
    mov AL,[4f04h]
    cbw
    push AX
    call routine_105
    add SP,8h
    mov AX,[4a28h]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AL,byte ptr [SI + 4f04h]
    cbw
    mov [55f2h],AX
    mov AL,byte ptr [SI + 4f05h]
    cbw
    mov [55fch],AX
    jmp LAB_1000_39f5
LAB_1000_39b9:
    mov AX,[4a28h]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AL,byte ptr [SI + 4f04h]
    cbw
    mov [55f0h],AX
    mov AL,byte ptr [SI + 4f05h]
    cbw
    mov [55f8h],AX
    push word ptr [55fch]
    push word ptr [55f2h]
    push AX
    push word ptr [55f0h]
    call routine_105
    add SP,8h
    mov AX,[55f0h]
    mov [55f2h],AX
    mov AX,[55f8h]
    mov [55fch],AX
LAB_1000_39f5:
    push word ptr [4a28h]
    call routine_63
    add SP,2h
    mov [59beh],AX
    mov word ptr [59c0h],DX
    mov AX,1edfh
    push AX
    mov AX,4824h
    push AX
    call routine_67
    add SP,4h
    lea AX,[BP + -16h]
    push AX
    push word ptr [59c0h]
    push word ptr [59beh]
    call routine_107
    add SP,6h
    lea AX,[BP + -16h]
    push AX
    mov AX,4824h
    push AX
    call routine_68
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
    call routine_47
    add SP,0ah
    mov AX,57h
    push AX
    mov AX,56h
    push AX
    mov AX,0e8h
    push AX
    mov AX,4824h
    push AX
    push word ptr [BP + 4h]
    call routine_48
    add SP,0ah
    mov byte ptr [1a1ah],0h
LAB_1000_3a6b:
    cmp byte ptr [1a1ah],5h
    ja LAB_1000_3a74
    jmp LAB_1000_3a6b
LAB_1000_3a74:
    jmp LAB_1000_38c8
LAB_1000_3a77:
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],3fh
    jnz LAB_1000_3a8e
    dec word ptr [4a28h]
LAB_1000_3a8e:
    sub AX,AX
    push AX
    call far ptr routine_104
    add SP,2h
    cmp word ptr [55f2h],0h
    jnz LAB_1000_3aef
    cmp word ptr [55fch],0h
    jnz LAB_1000_3aef
    mov AX,[4a28h]
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
    mov AL,[4f05h]
    cbw
    push AX
    mov AL,[4f04h]
    cbw
    push AX
    call routine_105
    add SP,8h
    mov AX,[4a28h]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AL,byte ptr [SI + 4f04h]
    cbw
    mov [55f2h],AX
    mov AL,byte ptr [SI + 4f05h]
    cbw
    mov [55fch],AX
    jmp LAB_1000_3b2b
LAB_1000_3aef:
    mov AX,[4a28h]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    mov SI,AX
    mov AL,byte ptr [SI + 4f04h]
    cbw
    mov [55f0h],AX
    mov AL,byte ptr [SI + 4f05h]
    cbw
    mov [55f8h],AX
    push word ptr [55fch]
    push word ptr [55f2h]
    push AX
    push word ptr [55f0h]
    call routine_105
    add SP,8h
    mov AX,[55f0h]
    mov [55f2h],AX
    mov AX,[55f8h]
    mov [55fch],AX
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
    call far ptr routine_104
    add SP,2h
    cmp word ptr [BP + -4h],0h
    jnz LAB_1000_3b8e
    sub AX,AX
    push AX
    push AX
    mov AL,[4f05h]
    cbw
    push AX
    mov AL,[4f04h]
    cbw
    push AX
    call routine_147
    add SP,8h
    mov AL,[4f04h]
    cbw
    mov word ptr [BP + -6h],AX
    mov AL,[4f05h]
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
    mov AX,[4808h]
    add AX,word ptr [481ah]
    mov word ptr [BP + -4h],AX
    mov AL,byte ptr [BP + -4h]
    and AL,3h
    cmp AL,1h
    sbb CX,CX
    neg CX
    mov word ptr [71ch],CX
    cmp word ptr [4800h],1h
    jz LAB_1000_3c46
    cmp word ptr [4812h],1h
    jnz LAB_1000_3c4c
LAB_1000_3c46:
    mov word ptr [71ch],0h
LAB_1000_3c4c:
    cmp word ptr [4800h],4h
    jz LAB_1000_3c5a
    cmp word ptr [4812h],4h
    jnz LAB_1000_3c60
LAB_1000_3c5a:
    mov word ptr [71ch],1h
LAB_1000_3c60:
    mov AX,word ptr [BP + -4h]
    and AX,0fh
    mov CH,AL
    sub CL,CL
    add word ptr [BP + param_1+2h],CX
    mov AX,1ee1h
    push AX
    push word ptr [BP + 6h]
    call routine_67
    add SP,4h
    mov AX,word ptr [BP + param_1+2h]
    sub DX,DX
    mov CX,708h
    div CX
    mov word ptr [BP + -2h],AX
    mov BX,word ptr [BP + 6h]
    mov AL,[71ch]
    inc AL
    add byte ptr [BX],AL
    mov AX,word ptr [BP + -2h]
    cwd
    mov CX,0ah
    idiv CX
    mov BX,word ptr [BP + 6h]
    add byte ptr [BX + 1h],DL
    mov AX,word ptr [BP + param_1+2h]
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
    mov AX,word ptr [BP + param_1+2h]
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
    mov AX,[1caeh]
    cmp word ptr [BP + -2h],AX
    jc LAB_1000_3d85
    mov AX,[1cb2h]
    cmp word ptr [BP + -2h],AX
    jnc LAB_1000_3d85
    mov AX,[1cb0h]
    cmp word ptr [BP + -4h],AX
    jc LAB_1000_3d85
    mov AX,[1cb4h]
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
    push word ptr [1cb4h]
    push word ptr [1cb0h]
    push word ptr [1cb2h]
    push word ptr [1caeh]
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
    push word ptr [1cb4h]
    push word ptr [1cb0h]
    push word ptr [1cb2h]
    push word ptr [1caeh]
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
    call far ptr routine_150
    add SP,4h
    push AX
    call far ptr routine_151
    add SP,2h
    mov AX,word ptr [BP + -4h]
    dec AX
    mov [15c5h],AX
    mov AX,word ptr [BP + -2h]
    dec AX
    mov [15c7h],AX
    push AX
    call far ptr routine_152
    add SP,2h
    push word ptr [15c5h]
    call far ptr routine_153
    add SP,2h
    mov AX,word ptr [BP + 4h]
    mov [123bh],AX
    mov AX,word ptr [BP + 6h]
    mov [123fh],AX
    mov AX,word ptr [BP + 8h]
    mov [123dh],AX
    mov AX,word ptr [BP + 0ah]
    mov [1241h],AX
    call routine_154
    call far ptr routine_155
    mov word ptr [15c5h],13fh
    mov word ptr [15c7h],0c7h
    mov AX,0c7h
    push AX
    call far ptr routine_152
    add SP,2h
    push word ptr [15c5h]
    call far ptr routine_153
    add SP,2h
    sub AX,AX
    push AX
    call far ptr routine_151
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
    mov [59c2h],AX
    mov [5600h],AX
    mov [5abeh],AX
    mov [5abah],AX
    mov [550ah],AX
    mov [424ah],AX
    mov [5508h],AX
    mov [4248h],AX
    mov word ptr [BP + -10h],1h
    mov word ptr [BP + -0ah],AX
    mov word ptr [BP + -0ch],AX
    les BX,dword ptr [5ab6h]
    mov AX,word ptr ES:[BX + 40h]
    mov word ptr [BP + -2h],AX
    cmp AX,0fh
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
    and AX,3fh
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
    mov word ptr [5600h],1h
    inc word ptr [5abah]
    jmp LAB_1000_3fb6
LAB_1000_3f6c:
    mov BX,word ptr [BP + -6h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],40h
    jz LAB_1000_3f8a
    mov word ptr [59c2h],1h
    inc word ptr [5abah]
    jmp LAB_1000_3fb6
LAB_1000_3f8a:
    mov BX,word ptr [BP + -0eh]
    and BX,7fh
    test byte ptr [BX + 5578h],40h
    jz LAB_1000_3f9d
    inc word ptr [5abeh]
    jmp LAB_1000_3fb6
LAB_1000_3f9d:
    mov BX,word ptr [BP + -0eh]
    mov CL,4h
    shl BX,CL
    test word ptr [BX + 4256h],500h
    jnz LAB_1000_3fb2
    inc word ptr [5abah]
    jmp LAB_1000_3fb6
LAB_1000_3fb2:
    inc word ptr [5abeh]
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
    mov word ptr [5600h],1h
    inc word ptr [4248h]
    jmp LAB_1000_4010
LAB_1000_3fd7:
    mov BX,word ptr [BP + -6h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],40h
    jz LAB_1000_3ff5
    mov word ptr [59c2h],1h
    inc word ptr [4248h]
    jmp LAB_1000_4010
LAB_1000_3ff5:
    mov BX,word ptr [BP + -0eh]
    and BX,7fh
    mov CL,5h
    shl BX,CL
    cmp word ptr [BX + 1b0h],-1h
    jnz LAB_1000_400c
    inc word ptr [424ah]
    jmp LAB_1000_4010
LAB_1000_400c:
    inc word ptr [4248h]
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
    mov word ptr [5600h],1h
    inc word ptr [5508h]
    jmp LAB_1000_4096
LAB_1000_4031:
    mov BX,word ptr [BP + -6h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    test byte ptr [BX + 4f06h],40h
    jz LAB_1000_404f
    mov word ptr [59c2h],1h
    inc word ptr [5508h]
    jmp LAB_1000_4096
LAB_1000_404f:
    mov BX,word ptr [BP + -0eh]
    and BX,7fh
    test byte ptr [BX + 5578h],40h
    jz LAB_1000_4062
    inc word ptr [550ah]
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
    inc word ptr [5508h]
    jmp LAB_1000_4096
LAB_1000_4092:
    inc word ptr [550ah]
LAB_1000_4096:
    jmp LAB_1000_40ce
LAB_1000_4098:
    inc word ptr [BP + -10h]
    jmp LAB_1000_40ce
    db 0EBh
    db 2Fh
LAB_1000_409f:
    cmp AX,1h
    jnz LAB_1000_40a7
    jmp LAB_1000_3f4e
LAB_1000_40a7:
    cmp AX,2h
    jnz LAB_1000_40af
    jmp LAB_1000_4013
LAB_1000_40af:
    cmp AX,3h
    jnz LAB_1000_40b7
    jmp LAB_1000_3fb9
LAB_1000_40b7:
    cmp AX,8h
    jnz LAB_1000_40bf
    jmp LAB_1000_3f40
LAB_1000_40bf:
    cmp AX,0ah
    jz LAB_1000_4098
    cmp AX,0ch
    jnz LAB_1000_40cc
    jmp LAB_1000_3f4e
LAB_1000_40cc:
    jmp LAB_1000_40ce
LAB_1000_40ce:
    jmp LAB_1000_3f09
LAB_1000_40d1:
    mov CX,19h
    mov AX,[5abah]
    mov DX,word ptr [5abeh]
    shl DX,1h
    sub AX,DX
    imul word ptr [BP + -2h]
    imul CX
    cwd
    mov CX,32h
    les BX,dword ptr [403ah]
    mov BX,word ptr ES:[BX + 3eh]
    inc BX
    mov SI,AX
    mov AX,[4248h]
    mov DI,word ptr [424ah]
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
    mov AX,[5508h]
    mov SI,word ptr [550ah]
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
    imul word ptr [5600h]
    imul CX
    cwd
    add BX,AX
    adc SI,DX
    mov CX,64h
    mov AX,word ptr [BP + -2h]
    imul word ptr [59c2h]
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
    les BX,dword ptr [5ab6h]
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
    cmp AX,1h
    jz LAB_1000_4183
    cmp AX,2h
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
    cmp byte ptr [55feh],1h
    jnz LAB_1000_420c
    mov AX,28h
    push AX
    mov AX,30h
    push AX
    push word ptr [5cc4h]
    push word ptr [5cc2h]
    sub AX,AX
    push AX
    mov AX,96h
    push AX
    sub AX,AX
    push AX
    mov AX,1h
    push AX
    call far ptr routine_103
    add SP,10h
    mov byte ptr [55feh],0h
LAB_1000_420c:
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f06h]
    and AX,3fh
    mov word ptr [BP + -4h],AX
    jmp LAB_1000_42d2
caseD_1_42dd:
    mov BX,word ptr [4a28h]
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
    cmp word ptr [4a28h],0h
    jnz LAB_1000_4280
    mov word ptr [BP + -4h],8h
    jmp LAB_1000_42c7
LAB_1000_4280:
    les BX,dword ptr [5ab6h]
    cmp word ptr ES:[BX + 26h],3h
    jnz LAB_1000_4297
    mov byte ptr [55eeh],1h
    mov word ptr [BP + -4h],7h
    jmp LAB_1000_42c7
LAB_1000_4297:
    cmp word ptr ES:[BX + 26h],1h
    jnz LAB_1000_42aa
    mov byte ptr [55eeh],1h
    mov word ptr [BP + -4h],0eh
    jmp LAB_1000_42c7
LAB_1000_42aa:
    cmp word ptr [550ch],0h
    jnz LAB_1000_42bd
    mov byte ptr [55eeh],1h
    mov word ptr [BP + -4h],0bh
    jmp LAB_1000_42c7
LAB_1000_42bd:
    mov byte ptr [55eeh],1h
    mov word ptr [BP + -4h],0dh
LAB_1000_42c7:
    jmp caseD_4_42dd
caseD_a_42dd:
    mov word ptr [BP + -4h],0ah
    jmp caseD_4_42dd
    db 0EBh
    db 28h
LAB_1000_42d2:
    sub AX,1h
    cmp AX,0bh
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
caseD_4_8045:
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [1caeh]
    cmp AX,73h
    jnc LAB_1000_4383
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [1cb0h]
    cmp AX,59h
    jnc LAB_1000_4383
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [1caeh]
    add AX,0ah
    mov [5cc2h],AX
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [1cb0h]
    add AX,0ah
    mov [5cc4h],AX
    jmp LAB_1000_44d8
LAB_1000_4383:
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [1caeh]
    cmp AX,73h
    jc LAB_1000_440c
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [1cb0h]
    cmp AX,59h
    jnc LAB_1000_440c
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [1caeh]
    sub AX,3ah
    mov [5cc2h],AX
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [1cb0h]
    add AX,0ah
    mov [5cc4h],AX
    jmp LAB_1000_44d8
LAB_1000_440c:
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [1caeh]
    cmp AX,73h
    jc LAB_1000_4494
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [1cb0h]
    cmp AX,59h
    jc LAB_1000_4494
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [1caeh]
    sub AX,3ah
    mov [5cc2h],AX
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [1cb0h]
    sub AX,28h
    mov [5cc4h],AX
    jmp LAB_1000_44d8
LAB_1000_4494:
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f04h]
    cbw
    push AX
    call routine_137
    add SP,2h
    add AX,word ptr [1caeh]
    add AX,0ah
    mov [5cc2h],AX
    mov BX,word ptr [4a28h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    mov AL,byte ptr [BX + 4f05h]
    cbw
    push AX
    call routine_136
    add SP,2h
    add AX,word ptr [1cb0h]
    sub AX,28h
    mov [5cc4h],AX
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
    push word ptr [5cc4h]
    push word ptr [5cc2h]
    sub AX,AX
    push AX
    call far ptr routine_103
    add SP,10h
    mov SI,word ptr [BP + -4h]
    shl SI,1h
    mov AX,28h
    push AX
    mov AX,30h
    push AX
    push word ptr [5cc4h]
    push word ptr [5cc2h]
    sub AX,AX
    push AX
    push word ptr [SI + 1eeah]
    push word ptr [SI + 1f0eh]
    mov AX,1h
    push AX
    call far ptr routine_103
    add SP,10h
    mov byte ptr [55feh],1h
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
    push word ptr [204ah]
    call routine_47
    add SP,0ah
    mov AX,13fh
    push AX
    mov AX,5ah
    push AX
    sub AX,AX
    push AX
    mov AX,1f9ch
    push AX
    push word ptr [204ah]
    call routine_48
    add SP,0ah
    mov BX,word ptr [204ah]
    mov word ptr [BX + 0ch],4h
    mov AX,13fh
    push AX
    mov AX,64h
    push AX
    sub AX,AX
    push AX
    mov AX,1fb8h
    push AX
    push word ptr [204ah]
    call routine_48
    add SP,0ah
    mov BX,word ptr [204ah]
    mov word ptr [BX + 0ch],1h
    call far ptr routine_49
    call far ptr routine_32
LAB_1000_45c4:
    mov AX,1f99h
    push AX
    les BX,dword ptr [403ah]
    mov BX,word ptr ES:[BX + 38h]
    shl BX,1h
    push word ptr [BX + 2256h]
    call routine_46
    add SP,4h
    mov [4038h],AX
    or AX,AX
    jnz LAB_1000_45e6
    jmp LAB_1000_4560
LAB_1000_45e6:
    call far ptr routine_50
    push word ptr [4038h]
    call routine_51
    add SP,2h
    mov AX,9h
    push AX
    call far ptr routine_52
    add SP,2h
    call far ptr routine_22
    push AX
    call routine_23
    add SP,2h
    mov [5cc6h],AX
    push AX
    les BX,dword ptr [403ah]
    mov BX,word ptr ES:[BX + 38h]
    shl BX,1h
    push word ptr [BX + 2256h]
    call routine_53
    add SP,4h
    mov AX,[5cc6h]
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
    push word ptr [204ah]
    call routine_47
    add SP,0ah
    mov AX,13fh
    push AX
    mov AX,5ah
    push AX
    sub AX,AX
    push AX
    mov AX,1fe0h
    push AX
    push word ptr [204ah]
    call routine_48
    add SP,0ah
    mov BX,word ptr [204ah]
    mov word ptr [BX + 0ch],4h
    mov AX,13fh
    push AX
    mov AX,64h
    push AX
    sub AX,AX
    push AX
    mov AX,1ff9h
    push AX
    push word ptr [204ah]
    call routine_48
    add SP,0ah
    mov BX,word ptr [204ah]
    mov word ptr [BX + 0ch],1h
    call far ptr routine_49
    call far ptr routine_32
LAB_1000_4692:
    mov AX,1fd1h
    push AX
    mov AX,1fd4h
    push AX
    call routine_46
    add SP,4h
    mov [4038h],AX
    or AX,AX
    jz LAB_1000_462e
    call far ptr routine_50
    push word ptr [4038h]
    call routine_51
    add SP,2h
    mov AX,8h
    push AX
    call far ptr routine_52
    add SP,2h
    mov AX,1h
    push AX
    mov AX,2012h
    push AX
    call routine_54
    add SP,4h
    mov AX,word ptr [BP + -4h]
    mov [2064h],AX
    mov [2084h],AX
    mov [20a4h],AX
    mov [20c4h],AX
    mov [20e4h],AX
    mov [2104h],AX
    mov [2124h],AX
    mov [2144h],AX
    mov [2164h],AX
    mov [2184h],AX
    mov [21a4h],AX
    mov [21c4h],AX
    call far ptr routine_50
    mov AX,0c7h
    push AX
    mov AX,13fh
    push AX
    sub AX,AX
    push AX
    push AX
    push word ptr [204ah]
    call routine_47
    add SP,0ah
    push word ptr [2082h]
    call far ptr routine_55
    add SP,2h
    push word ptr [20a2h]
    call far ptr routine_55
    add SP,2h
    mov BX,word ptr [204ah]
    mov word ptr [BX + 4h],0h
    mov AX,1h
    push AX
    mov AX,6ah
    push AX
    mov AX,201eh
    push AX
    push word ptr [204ah]
    call routine_56
    add SP,8h
    mov BX,word ptr [204ah]
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
    push word ptr [204ah]
    call routine_56
    add SP,8h
    add word ptr [BP + -0eh],0ah
    inc word ptr [BP + -8h]
    cmp word ptr [BP + -8h],2h
    jl LAB_1000_475c
    mov word ptr [BP + -12h],0h
    mov byte ptr [55eeh],1h
    mov word ptr [4a28h],0h
    call far ptr routine_57
    call far ptr routine_49
    call routine_58
    mov word ptr [BP + -6h],1h
LAB_1000_47a5:
    mov AX,32h
    imul word ptr [BP + -12h]
    mov BX,AX
    mov word ptr [BX + 2212h],2h
    push word ptr [2062h]
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
    push word ptr [55dch]
    mov AX,21e4h
    push AX
    call routine_59
    add SP,0ch
    push word ptr [2062h]
    push word ptr [2254h]
    mov AX,2h
    push AX
    push word ptr [55dch]
    mov AX,21e4h
    push AX
    call routine_60
    add SP,0ah
    mov word ptr [BP + -12h],AX
    or AX,AX
    jz LAB_1000_4806
    cmp AX,1h
    jz LAB_1000_4838
    jmp LAB_1000_481c
LAB_1000_4806:
    push word ptr [2062h]
    call routine_65
    add SP,2h
    cmp byte ptr [4244h],1h
    jnz LAB_1000_481c
    mov word ptr [BP + -12h],1h
LAB_1000_481c:
    les BX,dword ptr [5ab6h]
    cmp word ptr ES:[BX + 72h],1h
    jnz LAB_1000_485b
LAB_1000_4827:
    sub AX,AX
    push AX
    call far ptr routine_61
    add SP,2h
    or AX,AX
    jz LAB_1000_4840
    jmp LAB_1000_4827
LAB_1000_4838:
    mov word ptr [BP + -6h],0h
    jmp LAB_1000_481c
    db 90h
LAB_1000_4840:
    mov byte ptr [1a1ah],0h
LAB_1000_4845:
    cmp byte ptr [1a1ah],5h
    jbe LAB_1000_4845
LAB_1000_484c:
    sub AX,AX
    push AX
    call far ptr routine_61
    add SP,2h
    or AX,AX
    jnz LAB_1000_484c
LAB_1000_485b:
    cmp word ptr [BP + -6h],0h
    jz LAB_1000_4864
    jmp LAB_1000_47a5
LAB_1000_4864:
    call routine_62
    call far ptr routine_50
    push word ptr [4f00h]
    call routine_63
    add SP,2h
    mov [59beh],AX
    mov word ptr [59c0h],DX
    les BX,dword ptr [403ah]
    mov word ptr ES:[BX + 44h],0h
    les BX,dword ptr [5ab6h]
    cmp word ptr ES:[BX + 30h],0h
    jnz LAB_1000_490f
    les BX,dword ptr [403ah]
    mov AX,[59beh]
    mov word ptr ES:[BX + 44h],AX
    les BX,dword ptr [403ah]
    mov AX,word ptr ES:[BX + 2eh]
    sub DX,DX
    cmp DX,word ptr [59c0h]
    ja LAB_1000_48bc
    jc LAB_1000_48b5
    cmp AX,word ptr [59beh]
    jnc LAB_1000_48bc
LAB_1000_48b5:
    mov AX,[59beh]
    mov word ptr ES:[BX + 2eh],AX
LAB_1000_48bc:
    les BX,dword ptr [403ah]
    mov AX,[59beh]
    mov DX,word ptr [59c0h]
    add word ptr ES:[BX + 32h],AX
    adc word ptr ES:[BX + 34h],DX
    les BX,dword ptr [5ab6h]
    cmp word ptr ES:[BX + 26h],1h
    jnz LAB_1000_48e4
    les BX,dword ptr [403ah]
    mov word ptr ES:[BX + 4eh],2h
LAB_1000_48e4:
    les BX,dword ptr [5ab6h]
    cmp word ptr ES:[BX + 26h],2h
    jnz LAB_1000_490f
    cmp word ptr ES:[BX + 28h],0h
    jnz LAB_1000_490f
    les BX,dword ptr [403ah]
    inc word ptr ES:[BX + 30h]
    cmp word ptr ES:[BX + 30h],3h
    jc LAB_1000_490f
    les BX,dword ptr [403ah]
    mov word ptr ES:[BX + 4eh],1h
LAB_1000_490f:
    push word ptr [5cc6h]
    call routine_64
    mov SP,BP
    pop BP
    ret
    db 90h
    db 90h
routine_25 endp

start proc near
    mov AH,30h
    dw 21h
    cmp AL,2h
    jnc LAB_1000_4926
    dw 20h
LAB_1000_4926:
    mov DI,1580h
    mov SI,word ptr [2h]
    sub SI,DI
    cmp SI,1000h
    jc LAB_1000_4938
    mov SI,1000h
LAB_1000_4938:
    cli
    mov SS,DI
    add SP,5cceh
    sti
    jnc LAB_1000_4952
    push SS
    pop DS
    call routine_2
    xor AX,AX
    push AX
    call routine_3
    mov AX,4cffh
    dw 21h
LAB_1000_4952:
    and SP,0fffeh
    mov word ptr SS:[CODE_2:var_122],SP
    mov word ptr SS:[CODE_2:var_120],SP
    mov AX,SI
    mov CL,4h
    shl AX,CL
    dec AX
    mov SS:[CODE_2:var_119],AX
    add SI,DI
    mov word ptr [CODE_2:var_9],SI
    mov BX,ES
    sub BX,SI
    neg BX
    mov AH,4ah
    dw 21h
    mov word ptr SS:[CODE_2:var_127],DS
    push SS
    pop ES
    cld
    mov DI,2550h
    mov CX,5cd0h
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
    push word ptr [CODE_2:var_134]
    push word ptr [CODE_2:var_133]
    push word ptr [CODE_2:var_132]
    call routine_7
    push AX
    call routine_8
    mov AX,1580h
    mov DS,AX
    mov AX,3h
LAB_1000_49bf:
    push AX
    call routine_2
    call routine_3
    mov AX,0ffh
    push AX
    call word ptr [226eh]
start endp

routine_4 proc near
    mov AH,30h
    dw 21h
    mov [22e3h],AX
    mov AX,3500h
    dw 21h
    mov word ptr [22cfh],BX
    mov word ptr [22d1h],ES
    push CS
    pop DS
    mov AX,2500h
    mov DX,49b0h
    dw 21h
    push SS
    pop DS
    mov CX,word ptr [246ah]
    jcxz LAB_1000_4a22
    mov ES,word ptr [22e1h]
    mov SI,word ptr ES:[2ch]
    lds AX,dword ptr [246ch]
    mov DX,DS
    xor BX,BX
    call far ptr [2468h]
    jnc LAB_1000_4a11
    push SS
    pop DS
    jmp FUN_1000_4ea4
LAB_1000_4a11:
    lds AX,SS:dword ptr [2470h]
    mov DX,DS
    mov BX,3h
    call far ptr [2468h]
    push SS
    pop DS
LAB_1000_4a22:
    mov ES,word ptr [22e1h]
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
    mov DI,22eah
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
    dw 21h
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

routine_8 proc near
    push BP
    mov BP,SP
    mov SI,3fc6h
    mov DI,3fc6h
    call routine_13
    mov SI,2474h
    mov DI,2476h
    call routine_13
    jmp LAB_1000_4aac
routine_8 endp

routine_9 proc near
    push BP
    mov BP,SP
LAB_1000_4aac:
    mov SI,2476h
    mov DI,2476h
    call routine_13
    mov SI,2476h
    mov DI,2476h
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
    dw 21h
LAB_1000_4ae1:
    inc BX
    loop LAB_1000_4ad6
    call routine_30
    mov AX,word ptr [BP + 4h]
    mov AH,4ch
    dw 21h
routine_9 endp

routine_30 proc near
    mov CX,word ptr [246ah]
    jcxz LAB_1000_4afb
    mov BX,2h
    call far ptr [2468h]
LAB_1000_4afb:
    push DS
    lds DX,dword ptr [22cfh]
    mov AX,2500h
    dw 21h
    pop DS
    cmp byte ptr [230ch],0h
    jz LAB_1000_4b1a
    push DS
    mov AL,[230dh]
    lds DX,dword ptr [230eh]
    mov AH,25h
    dw 21h
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
    call routine_67
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
    call routine_68
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
    cmp BX,word ptr [22e8h]
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
    dw 21h
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
    dw 21h
    add AX,word ptr [BP + 6h]
    adc DX,word ptr [BP + 8h]
    jns LAB_1000_4c83
    mov CX,word ptr [BP + -2h]
    mov DX,word ptr [BP + -4h]
    mov AX,4200h
    dw 21h
    jmp LAB_1000_4c5b
LAB_1000_4c83:
    mov DX,word ptr [BP + 6h]
    mov CX,word ptr [BP + 8h]
    mov AL,byte ptr [BP + 0ah]
    mov AH,42h
    dw 21h
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

routine_70 proc near
    push BP
    mov BP,SP
    mov AX,word ptr [BP + 4h]
    mov [2316h],AX
    mov word ptr [2318h],0h
    pop BP
    ret
    db 90h
routine_70 endp

FUN_1000_4cca proc near
    mov AX,43fdh
    mov DX,3h
    push DX
    push AX
    push word ptr [2318h]
    push word ptr [2316h]
    call __aNlmul
    add AX,9ec3h
    adc DX,26h
    mov [2316h],AX
    mov word ptr [2318h],DX
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
    sbb AX,0h
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
    sbb AX,0h
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
    sbb AX,0h
    mov word ptr [BP + 6h],AX
    mov word ptr [BP + 4h],DX
LAB_1000_4ddf:
    mov AX,word ptr [BP + 0ah]
    or AX,AX
    jge LAB_1000_4df6
    mov DX,word ptr [BP + 8h]
    neg AX
    neg DX
    sbb AX,0h
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
    cmp word ptr [231ah],0h
    jz LAB_1000_4e99
    call word ptr [231ah]
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
    dw 21h
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
    mov [22e6h],AL
    or AH,AH
    jnz LAB_1000_4f70
    cmp byte ptr [22e3h],3h
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
    mov [22dbh],AX
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
    cmp AX,61h
    jz LAB_1000_4fe0
    cmp AX,72h
    jz LAB_1000_4fc8
    cmp AX,77h
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
    or DI,2h
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
    cmp AX,2bh
    jz LAB_1000_4fe6
    cmp AX,62h
    jz LAB_1000_5024
    cmp AX,74h
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
    inc word ptr [244ah]
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
    mov CX,word ptr [2448h]
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
    cmp BX,word ptr [22e8h]
    jc LAB_1000_5154
    mov AX,900h
    stc
    jmp LAB_1000_515f
LAB_1000_5154:
    mov AH,3eh
    dw 21h
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
    dw 21h
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
    test byte ptr [2457h],80h
    jnz LAB_1000_5199
LAB_1000_5195:
    mov byte ptr [BP + -4h],80h
LAB_1000_5199:
    mov DX,word ptr [BP + 4h]
    and AL,3h
    or AL,BH
    mov AH,3dh
    dw 21h
    jnc LAB_1000_51b8
    cmp AX,2h
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
    dw 21h
    mov AX,1100h
    jmp LAB_1000_51b4
LAB_1000_51cc:
    mov byte ptr [BP + -3h],1h
    mov AX,4400h
    dw 21h
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
    test AX,3h
    jz LAB_1000_51fd
    xor CX,CX
    mov AH,40h
    dw 21h
    jmp LAB_1000_52bc
LAB_1000_51fd:
    mov AH,3eh
    dw 21h
    mov DX,word ptr [BP + 4h]
    mov AX,4300h
    dw 21h
    jmp LAB_1000_5272
    db 90h
LAB_1000_520c:
    test byte ptr [BP + -4h],80h
    jnz LAB_1000_5215
    jmp LAB_1000_52bc
LAB_1000_5215:
    test AX,2h
    jnz LAB_1000_521d
    jmp LAB_1000_52bc
LAB_1000_521d:
    mov CX,0ffffh
    mov DX,CX
    mov AX,4202h
    dw 21h
    neg CX
    lea DX,[BP + -1h]
    mov AH,3fh
    dw 21h
    or AX,AX
    jz LAB_1000_5249
    cmp byte ptr [BP + -1h],1ah
    jnz LAB_1000_5249
    neg CX
    mov DX,CX
    mov AX,4202h
    dw 21h
    xor CX,CX
    mov AH,40h
    dw 21h
LAB_1000_5249:
    xor CX,CX
    mov DX,CX
    mov AX,4200h
    dw 21h
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
    dw 21h
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
    dw 21h
    mov AL,byte ptr [BP + 6h]
    and AL,3h
    or AL,byte ptr [BP + -2h]
    mov DX,word ptr [BP + 4h]
    mov AH,3dh
    dw 21h
    jc LAB_1000_527b
    xchg AX,BX
    test byte ptr [BP + -3h],1h
    jnz LAB_1000_52bc
    test word ptr [BP + 8h],1h
    jz LAB_1000_52bc
    or CL,1h
    mov DX,word ptr [BP + 4h]
    mov AX,4301h
    dw 21h
    jc LAB_1000_527b
LAB_1000_52bc:
    test byte ptr [BP + -4h],40h
    jnz LAB_1000_52ff
    mov DX,word ptr [BP + 4h]
    mov AX,4300h
    dw 21h
    mov AX,CX
    xor CL,CL
    and AX,1h
    jz LAB_1000_52d5
    mov CL,10h
LAB_1000_52d5:
    test word ptr [BP + 6h],8h
    jz LAB_1000_52df
    or CL,20h
LAB_1000_52df:
    cmp BX,word ptr [22e8h]
    jc LAB_1000_52ef
    mov AH,3eh
    dw 21h
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
    mov AX,[22ddh]
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
    cmp BX,word ptr [22e8h]
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
    dw 21h
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
    dw 21h
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
    dw 21h
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
    mov BX,244ch
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
    mov [244ch],AX
    mov [244eh],AX
    xchg AX,SI
    mov word ptr [SI],1h
    add SI,4h
    mov word ptr [SI + -2h],0fffeh
    mov word ptr [2452h],SI
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
    cmp word ptr [2448h],SI
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
    mov AX,[2464h]
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
    add AX,2h
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
    add AX,2h
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
    mov DI,2270h
    mov DX,word ptr [BP + 6h]
    mov AX,word ptr [BP + 4h]
    dec AX
    jnz LAB_1000_566f
    call FUN_1000_56be
    jc LAB_1000_5694
    jmp LAB_1000_56b7
LAB_1000_566f:
    mov SI,word ptr [22c0h]
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
    dw 21h
    jc LAB_1000_5694
    xchg AX,DX
    mov word ptr [SI],AX
    mov word ptr [SI + 2h],DX
    mov word ptr [22c0h],SI
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
    jmp CODE_1:LAB_1571_0003
LAB_1000_56d4:
    mov BX,DX
    add BX,word ptr [SI]
    jc CODE_1:LAB_1571_0003
    mov DX,BX
    mov ES,CX
    cmp SI,DI
    jnz LAB_1000_56e8
    cmp word ptr [226ah],BX
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
    mov AX,[22e1h]
    sub BX,AX
    mov ES,AX
LAB_1000_5700:
    mov AH,4ah
    dw 21h
    jc CODE_1:LAB_1571_0003
    cmp SI,DI
    jnz LAB_1000_570e
    mov word ptr [226ah],DX
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
    call routine_148
    mov BX,0h
    call routine_149
    mov BX,1h
    call routine_149
    mov AX,[15fah]
    retf
routine_134 endp

routine_148 proc near
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
    mov word ptr [15f2h],BX
    mov word ptr [15f4h],BP
    pop BP
    ret
routine_148 endp

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

routine_19 proc far
    mov BX,SP
    push SI
    push DI
    push DS
    push ES
    lds SI,dword ptr [BX + 4h]
    mov DI,15cah
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
routine_19 endp


.DATA
; --- Data segment ---

    db 00h
_var_8 db 00h
_var_9 db 00h, 00h  ; undefined2 0000h
_var_11 db 00h
    db 00h
_var_12 db 00h
_var_13 db 00h
_var_14 db 4Dh
    db 53h
_var_15 db 20h
    db 52h
_var_16 db 75h
    db 6Eh
_var_17 db 2Dh
    db 54h
_var_18 db 69h
    db 6Dh
_var_19 db 65h
    db 20h, 4Ch, 69h, 62h, 72h, 61h, 72h, 79h, 20h, 2Dh, 20h, 43h, 6Fh, 70h, 79h, 72h
    db 69h, 67h, 68h, 74h, 20h, 28h, 63h, 29h, 20h
_var_20 db 31h
    db 39h
_var_21 db 38h
    db 38h
_var_22 db 2Ch
    db 20h, 4Dh, 69h, 63h, 72h, 6Fh, 73h, 6Fh, 66h, 74h, 20h, 43h, 6Fh, 72h, 70h, 11h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 4Eh, 6Fh, 6Eh, 65h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 53h, 41h, 2Dh, 32h, 00h, 00h, 00h, 00h, 0C8h, 00h, 03h, 00h, 00h
    db 00h, 53h, 41h, 2Dh, 35h, 00h, 00h, 00h, 00h, 5Eh, 01h, 02h, 00h, 00h, 00h, 53h
    db 41h, 2Dh, 38h, 42h, 00h, 00h, 00h, 7Dh, 00h, 05h, 00h, 00h, 00h, 53h, 41h, 2Dh
    db 31h, 30h, 00h, 00h, 00h, 40h, 01h, 07h, 00h, 01h, 00h, 53h, 41h, 2Dh, 31h, 31h
    db 00h, 00h, 00h, 0C8h, 00h, 05h, 00h, 00h, 00h, 53h, 41h, 2Dh, 31h, 32h, 00h, 00h
    db 00h, 22h, 01h, 06h, 00h, 01h, 00h, 53h, 41h, 2Dh, 31h, 33h, 00h, 00h, 00h, 7Dh
    db 00h, 03h, 00h, 00h, 00h, 53h, 41h, 2Dh, 4Eh, 2Dh, 34h, 00h, 00h, 0C8h, 00h, 04h
    db 00h, 01h, 00h, 53h, 41h, 2Dh, 4Eh, 2Dh, 35h, 00h, 00h, 96h, 00h, 03h, 00h, 00h
    db 00h, 53h, 41h, 2Dh, 4Eh, 2Dh, 36h, 00h, 00h, 40h, 01h, 06h, 00h, 01h, 00h, 53h
    db 41h, 2Dh, 4Eh, 2Dh, 37h, 00h, 00h, 0C8h, 00h, 05h, 00h, 00h, 00h, 48h, 61h, 77h
    db 6Bh, 00h, 00h, 00h, 00h, 0AFh, 00h, 06h, 00h, 01h, 00h, 4Bh, 00h, 08h, 00h, 00h
    db 00h
    db 'Tiger', 0
    db 00h, 00h, 41h, 00h, 04h, 00h, 00h, 00h, 0C8h, 00h, 02h, 00h, 00h, 00h, 49h, 4Ch
    db 37h, 36h, 00h, 00h, 00h, 00h, 0C8h, 00h, 08h, 00h, 03h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 32h, 00h, 05h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 46h, 00h, 06h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 50h, 00h, 07h, 00h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 64h, 00h
    db 08h, 00h, 01h, 00h, 4Fh, 54h, 48h, 00h, 00h, 00h, 00h, 00h, 0F4h, 01h, 05h, 00h
    db 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 28h, 00h, 03h, 00h, 00h, 00h
    db 4Dh, 49h, 47h, 2Dh, 32h, 33h, 00h, 00h, 00h, 0E4h, 02h, 30h, 02h, 03h, 00h
_var_23 db 11h
    db 00h, 0Ah, 00h, 02h, 00h, 00h, 00h, 4Dh, 49h, 47h, 2Dh, 32h, 35h, 00h, 20h, 46h
    db 6Fh, 78h, 62h, 61h, 74h, 00h, 00h, 00h, 00h, 3Ah, 02h, 0BCh, 02h, 02h, 00h, 12h
    db 00h, 00h, 00h, 02h, 00h, 00h, 00h, 4Dh, 49h, 47h, 2Dh, 32h, 39h, 00h, 00h, 00h
    db 0BCh, 02h, 90h, 01h, 05h, 00h, 13h, 00h, 14h, 00h, 02h, 00h, 00h, 00h, 46h, 2Dh
    db 31h, 00h, 00h, 00h, 00h, 00h, 00h, 16h, 03h, 0A2h, 03h, 03h, 00h, 14h, 00h, 00h
    db 00h, 02h, 00h, 00h, 00h, 53h, 75h, 2Dh, 32h, 37h, 00h, 00h, 00h, 00h, 0D5h, 02h
    db 0CBh, 02h, 04h, 00h, 13h, 00h, 14h, 00h, 02h, 00h, 00h, 00h, 49h, 4Ch, 2Dh, 37h
    db 36h, 00h, 00h, 00h, 90h, 01h, 0A0h, 0Fh, 01h, 00h, 10h, 00h, 0Ch, 00h, 02h, 00h
    db 00h, 00h, 46h, 2Dh, 34h, 45h, 00h, 00h, 00h, 00h, 00h, 20h, 03h, 08h, 02h, 04h
    db 00h, 12h, 00h, 0Bh, 00h, 02h, 00h, 00h, 00h, 46h, 2Dh, 31h, 34h, 00h, 00h, 00h
    db 00h, 00h, 20h, 03h, 20h, 03h, 04h, 00h, 13h, 00h, 08h, 00h, 02h, 00h, 00h, 00h
    db 46h, 2Dh, 31h, 38h, 00h, 00h, 00h, 00h, 00h, 94h, 02h, 0CDh, 01h, 05h, 00h, 0FFh
    db 0FFh, 00h, 00h, 02h, 00h, 00h, 00h, 41h, 6Eh, 2Dh, 37h, 32h, 00h, 00h, 00h, 00h
    db 5Eh, 01h, 6Ch, 02h, 02h, 00h, 00h, 00h, 09h, 00h, 02h, 00h, 00h, 00h, 46h, 2Dh
    db 31h, 38h, 00h, 00h, 00h, 00h, 00h, 94h, 02h, 0CDh, 01h, 05h, 00h, 0FFh, 0FFh, 04h
    db 00h, 02h, 00h, 00h, 00h, 4Dh, 49h, 47h, 2Dh, 32h, 33h, 00h, 00h, 00h, 0E4h, 02h
    db 30h, 02h, 03h, 00h, 00h, 00h, 04h, 00h, 02h, 00h, 00h, 00h, 46h, 2Dh, 31h, 34h
    db 00h, 00h, 00h, 00h, 00h, 20h, 03h, 20h, 03h, 04h, 00h, 0FFh, 0FFh, 08h, 00h, 02h
    db 00h, 00h, 00h, 46h, 2Dh, 34h, 45h, 00h, 00h, 00h, 00h, 00h, 20h, 03h, 08h, 02h
    db 04h, 00h, 0FFh, 0FFh, 0Bh, 00h, 02h, 00h, 00h, 00h, 4Dh, 49h, 47h, 2Dh, 31h, 37h
    db 00h, 00h, 00h, 26h, 02h, 2Ch, 01h, 03h, 00h, 11h, 00h, 10h, 00h, 02h, 00h, 00h
    db 00h, 54h, 75h, 2Dh, 39h, 35h, 00h, 00h, 00h, 00h, 9Ah, 01h, 0ECh, 13h, 01h, 00h
    db 00h, 00h, 12h, 00h, 02h, 00h, 00h, 00h, 4Dh, 69h, 2Dh, 32h, 34h, 00h, 00h, 00h
    db 00h, 0C8h, 00h, 2Ch, 01h, 01h, 00h, 11h, 00h, 13h, 00h, 02h, 00h, 00h, 00h, 46h
    db 2Dh, 35h, 00h, 00h, 00h, 00h, 00h, 00h, 0F4h, 01h, 0FAh, 00h, 03h, 00h, 16h, 00h
    db 16h, 00h, 02h, 00h, 00h, 00h, 37h, 36h, 37h, 00h, 00h, 00h, 00h, 00h, 00h, 90h
    db 01h, 0E8h, 03h, 01h, 00h, 0FFh, 0FFh, 12h, 00h, 02h, 00h, 00h, 00h, 4Eh, 6Fh, 6Eh
    db 65h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 00h, 13h, 00h, 53h
    db 41h, 2Dh, 32h, 00h, 00h, 00h, 00h, 7Dh, 00h, 0D0h, 07h, 01h, 00h, 04h, 00h, 13h
    db 00h, 53h, 41h, 2Dh, 35h, 00h, 00h, 00h, 00h, 96h, 00h, 08h, 07h, 01h, 00h, 01h
    db 00h, 13h, 00h, 53h, 41h, 2Dh, 38h, 42h, 00h, 00h, 00h, 41h, 00h, 0B0h, 04h, 02h
    db 00h, 03h, 00h, 13h, 00h, 53h, 41h, 2Dh, 31h, 30h, 00h, 00h, 00h, 7Dh, 00h, 08h
    db 07h, 03h, 00h, 02h, 00h, 13h, 00h, 53h, 41h, 2Dh, 31h, 31h, 00h, 00h, 00h, 64h
    db 00h, 0DCh, 05h, 02h, 00h, 03h, 00h, 13h, 00h, 53h, 41h, 2Dh, 31h, 32h, 00h, 00h
    db 00h, 96h, 00h, 0D0h, 07h, 03h, 00h, 02h, 00h, 13h, 00h, 53h, 41h, 2Dh, 31h, 33h
    db 00h, 00h, 00h, 41h, 00h, 84h, 03h, 00h, 00h, 04h, 00h, 13h, 00h, 53h, 41h, 2Dh
    db 4Eh, 2Dh, 34h, 00h, 00h, 1Eh, 00h, 0B0h, 04h, 02h, 00h, 03h, 00h, 13h, 00h, 53h
    db 41h, 2Dh, 4Eh, 2Dh, 35h, 00h, 00h, 1Eh, 00h, 84h, 03h, 0FFh, 0FFh, 04h, 00h, 13h
    db 00h, 53h, 41h, 2Dh, 4Eh, 2Dh, 36h, 00h, 00h, 7Dh, 00h, 08h, 07h, 03h, 00h, 02h
    db 00h, 13h, 00h, 53h, 41h, 2Dh, 4Eh, 2Dh, 37h, 00h, 00h, 64h, 00h, 0DCh, 05h, 02h
    db 00h, 03h, 00h, 13h, 00h, 48h, 61h, 77h, 6Bh, 00h, 00h, 00h, 00h, 7Dh, 00h, 84h
    db 03h, 02h, 00h, 03h, 00h, 13h, 00h, 00h, 41h, 00h, 0B0h, 04h, 02h, 00h, 04h, 00h
    db 13h, 00h, 1Eh, 00h, 84h, 03h, 01h, 00h, 03h, 00h, 13h, 00h, 00h, 1Eh, 00h, 84h
    db 03h, 01h, 00h, 03h, 00h, 13h, 00h, 41h, 41h, 2Dh, 32h, 00h, 00h, 00h, 00h, 0Eh
    db 00h, 0DCh, 05h, 0FFh, 0FFh, 04h, 00h, 13h, 00h, 41h, 41h, 2Dh, 38h, 00h, 00h, 00h
    db 00h, 0Ch, 00h, 08h, 07h, 00h, 00h, 05h, 00h, 13h, 00h, 41h, 41h, 2Dh, 36h, 00h
    db 00h, 00h, 00h, 32h, 00h, 60h, 09h, 02h, 00h, 02h, 00h, 13h, 00h, 41h, 41h, 2Dh
    db 37h, 00h, 00h, 00h, 00h, 22h, 00h, 08h, 07h, 02h, 00h, 02h, 00h, 13h, 00h, 41h
    db 41h, 2Dh, 39h, 00h, 00h, 00h, 00h, 52h, 00h, 0D0h, 07h, 02h, 00h, 03h, 00h, 13h
    db 00h, 41h, 41h, 2Dh, 31h, 30h, 00h, 00h, 00h, 40h, 00h, 0D0h, 07h, 03h, 00h, 04h
    db 00h, 13h, 00h, 41h, 49h, 4Dh, 31h, 32h, 30h, 00h, 00h, 20h, 00h, 60h, 09h, 07h
    db 00h, 04h, 00h, 01h, 00h, 41h, 49h, 4Dh, 2Dh, 39h, 00h, 00h, 00h, 11h, 00h, 0D0h
    db 07h, 07h, 00h, 08h, 00h, 01h, 00h, 48h, 41h, 52h, 4Dh, 00h, 00h, 00h, 00h, 14h
    db 00h, 0B0h, 04h, 04h, 00h, 02h, 00h, 01h, 00h, 20h, 00h, 0F4h, 01h, 05h, 00h, 02h
    db 00h, 13h, 00h, 3Ch, 00h, 0F4h, 01h, 05h, 00h, 02h, 00h, 13h, 00h, 41h, 47h, 4Dh
    db 2Dh, 36h, 35h, 00h, 00h, 20h, 00h, 20h, 03h, 06h, 00h, 02h, 00h, 0Dh, 00h, 4Ch
    db 47h, 42h, 4Fh, 4Dh, 42h, 00h, 00h, 0Ah, 00h, 00h, 00h, 1Ch, 00h, 02h, 00h, 0Fh
    db 00h, 52h, 54h, 42h, 4Fh, 4Dh, 42h, 00h, 00h, 00h, 00h, 00h, 00h, 1Dh, 00h, 02h
    db 00h, 0Fh, 00h, 46h, 46h, 42h, 4Fh, 4Dh, 42h, 00h, 00h, 00h, 00h, 00h, 00h, 1Eh
    db 00h, 02h, 00h, 0Fh, 00h, 41h, 49h, 4Dh, 2Dh, 37h, 57h, 00h, 00h, 2Ch, 00h, 60h
    db 09h, 02h, 00h, 04h, 00h, 01h, 00h, 41h, 49h, 4Dh, 2Dh, 39h, 57h, 00h, 00h, 0Ch
    db 00h, 0D0h, 07h, 00h, 00h, 05h, 00h, 01h, 00h, 53h, 41h, 2Dh, 31h, 34h, 00h, 00h
    db 00h, 10h, 00h, 84h, 03h, 00h, 00h, 05h, 00h, 01h, 00h, 41h, 41h, 2Dh, 36h, 00h
    db 00h, 00h, 00h, 32h, 00h, 60h, 09h, 0FFh, 0FFh, 02h, 00h, 13h, 00h, 41h, 41h, 2Dh
    db 37h, 00h, 00h, 00h, 00h, 22h, 00h, 08h, 07h, 0FFh, 0FFh, 02h, 00h, 13h, 00h, 41h
    db 41h, 2Dh, 39h, 00h, 00h, 00h, 00h, 52h, 00h, 0D0h, 07h, 0FFh, 0FFh, 03h, 00h, 13h
    db 00h, 41h, 41h, 2Dh, 31h, 30h, 00h, 00h, 00h, 40h, 00h, 0D0h, 07h, 00h, 00h, 04h
    db 00h, 13h, 00h, 45h, 71h, 75h, 69h, 70h, 2Eh, 00h, 00h, 00h, 00h, 00h, 00h, 1Dh
    db 00h, 00h, 00h, 0Eh, 00h, 00h, 00h, 00h, 00h, 02h, 00h, 00h, 00h, 06h, 00h, 01h
    db 00h, 07h, 00h, 03h, 00h, 06h, 00h, 02h, 00h, 05h, 00h, 07h, 00h, 04h, 00h, 02h
    db 00h, 05h, 00h, 03h, 00h, 08h, 00h, 00h, 00h, 08h, 00h, 00h, 00h, 0Ah, 00h, 0Bh
    db 00h, 0Bh, 00h, 09h, 00h, 0Ch, 00h, 0Dh, 00h, 0Ch, 00h, 0Eh, 00h, 0Dh, 00h, 0Eh
    db 00h, 0Fh, 00h, 00h, 00h, 04h, 00h, 88h, 13h, 00h, 00h, 0Ch, 00h, 12h, 00h, 03h
    db 00h, 01h, 00h, 03h, 00h, 10h, 00h, 01h, 00h, 05h, 00h, 03h, 00h, 09h, 00h, 03h
    db 00h, 00h, 00h, 8Ah, 02h, 00h, 00h, 01h, 00h, 01h, 00h
_var_24 db 01h
    db 00h, 00h, 00h, 01h, 00h, 01h, 00h, 04h, 00h, 41h, 49h, 4Dh, 2Dh, 39h, 4Dh, 00h
    db 00h, 00h, 00h, 17h, 00h, 04h, 00h, 41h, 49h, 4Dh, 2Dh, 31h, 32h, 30h, 00h, 00h
    db 00h, 41h, 4Dh, 52h, 41h, 41h, 4Dh, 00h, 00h, 00h, 00h, 00h, 00h, 16h, 00h, 03h
    db 00h, 41h, 47h, 4Dh, 2Dh, 38h, 38h, 41h, 00h, 00h, 00h, 48h, 41h, 52h, 4Dh, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 18h, 00h, 01h, 00h, 50h, 33h, 20h, 41h, 53h
    db 4Dh, 00h, 00h, 00h, 00h, 00h, 00h, 19h, 00h, 02h, 00h, 41h, 47h, 4Dh, 2Dh, 38h
    db 36h, 41h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 1Ah, 00h, 01h, 00h, 41h, 47h, 4Dh
    db 2Dh, 36h, 35h, 44h, 00h, 00h, 00h, 00h, 00h, 1Bh, 00h, 02h, 00h, 47h, 42h, 55h
    db 2Dh, 31h, 32h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 1Ch, 00h, 02h, 00h, 4Dh
    db 6Bh, 20h, 32h, 30h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 1Dh, 00h, 02h, 00h, 44h
    db 6Eh, 64h, 6Ch, 00h, 00h, 00h, 00h, 00h, 00h, 1Dh, 00h, 02h, 00h, 4Dh, 6Bh, 20h
    db 38h, 32h, 2Dh, 30h, 00h, 00h, 00h
    db 'Slick', 0
    db 00h, 00h, 00h, 00h, 00h, 00h, 1Eh, 00h, 03h, 00h, 4Dh, 6Bh, 20h, 38h, 32h, 2Dh
    db 31h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 1Dh, 00h, 03h, 00h, 4Dh, 6Bh, 20h, 32h
    db 30h, 00h, 00h, 00h, 00h, 00h, 00h, 1Ch, 00h, 02h, 00h, 4Dh, 6Bh, 20h, 31h, 32h
    db 32h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 1Eh, 00h, 02h, 00h, 43h, 42h, 55h
    db 2Dh, 37h, 32h, 00h, 00h, 00h, 00h, 00h, 00h, 1Ch, 00h, 02h, 00h, 4Dh, 6Bh, 20h
    db 33h, 35h, 00h, 00h, 00h, 00h, 00h, 1Dh, 00h, 02h, 00h, 49h, 53h, 43h, 20h, 42h
    db 2Dh, 31h, 00h, 00h, 00h, 00h, 00h, 1Dh, 00h, 01h, 00h, 31h, 33h, 35h, 20h, 6Dh
    db 6Dh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0FFh, 0FFh, 01h, 00h, 31h, 39h, 30h
    db 30h, 6Ch, 62h, 73h, 00h, 00h, 00h, 00h, 0FEh, 0FFh, 01h, 00h, 32h, 30h, 20h, 6Dh
    db 6Dh, 00h, 00h, 00h, 00h, 00h, 47h, 75h, 6Eh, 73h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 01h, 00h, 00h, 00h, 45h, 71h, 75h, 69h, 70h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 26h, 00h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 06h, 00h, 00h, 00h, 05h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 06h, 02h, 01h, 02h, 02h, 03h, 04h, 03h
    db 03h, 04h, 04h, 04h, 01h, 02h, 04h, 01h, 02h, 04h, 05h, 05h, 04h, 04h, 05h, 04h
    db 04h, 00h, 03h, 00h, 00h, 04h, 04h, 00h, 00h, 05h, 05h, 04h, 04h, 05h, 00h, 04h
    db 00h, 08h, 00h, 00h, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 03h, 01h, 03h
    db 04h, 01h, 01h, 04h, 02h, 03h, 03h, 04h, 00h, 03h, 00h, 01h, 04h, 04h, 00h, 00h
    db 04h, 00h, 02h, 00h, 04h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 04h, 04h, 04h
    db 04h, 04h, 00h, 03h, 02h, 00h, 04h, 04h, 00h, 02h, 05h, 03h, 03h, 02h, 05h, 01h
    db 03h, 04h, 00h, 00h, 06h, 00h, 05h, 00h, 00h, 00h, 04h, 00h, 05h, 02h, 01h, 00h
    db 06h, 04h, 00h, 00h, 06h, 06h, 03h, 06h, 06h, 00h, 03h, 00h, 06h, 00h, 03h, 00h
    db 00h, 02h, 03h, 00h, 00h, 03h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 03h, 00h, 04h, 04h, 00h, 02h, 04h, 04h, 03h, 04h, 05h, 00h, 03h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 03h, 00h
    db 03h, 00h, 02h, 00h, 01h, 00h, 00h, 00h, 0FFh, 0FFh, 0FEh, 0FFh, 0FFh, 0FFh, 03h, 00h
    db 02h, 00h, 02h, 00h, 02h, 00h, 01h, 00h, 01h, 00h, 01h, 00h, 02h, 00h, 03h, 00h
    db 03h, 00h, 03h, 00h, 02h, 00h, 02h, 00h, 02h, 00h, 03h, 00h, 03h, 00h, 03h, 00h
    db 03h, 00h, 03h, 00h, 03h, 00h, 03h, 00h, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 03h, 00h
    db 03h, 00h, 03h, 00h, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh
    db 0FDh, 0FFh, 0FEh, 0FFh, 0FEh, 0FFh, 0FEh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 0FEh, 0FFh
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FEh, 0FFh, 0FEh, 0FFh, 0FEh, 0FFh, 0FDh, 0FFh, 01h, 00h
    db 02h, 00h, 01h, 00h, 00h, 00h, 0FFh, 0FFh, 0FEh, 0FFh, 0FDh, 0FFh, 0FDh, 0FFh, 02h, 00h
    db 03h, 00h, 02h, 00h, 02h, 00h, 01h, 00h, 01h, 00h, 01h, 00h, 0FEh, 0FFh, 04h, 00h
    db 04h, 00h, 03h, 00h, 02h, 00h, 01h, 00h, 04h, 00h, 04h, 00h, 04h, 00h, 04h, 00h
    db 04h, 00h, 04h, 00h, 04h, 00h, 0FEh, 0FFh, 04h, 00h, 04h, 00h, 04h, 00h, 04h, 00h
    db 04h, 00h, 0FCh, 0FFh, 0FCh, 0FFh, 04h, 00h, 04h, 00h, 04h, 00h, 04h, 00h, 0FCh, 0FFh
    db 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 04h, 00h, 04h, 00h, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh
    db 0FCh, 0FFh, 0FCh, 0FFh, 02h, 00h, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh
    db 0FCh, 0FFh, 0FCh, 0FFh, 0FFh, 0FFh, 0FDh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 02h, 00h
    db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FEh, 0FFh, 0FEh, 0FFh, 0FDh, 0FFh, 0FFh, 0FFh, 02h, 00h
    db 03h, 00h, 02h, 00h, 02h, 00h, 01h, 00h, 01h, 00h, 0FFh, 0FFh, 0FEh, 0FFh, 04h, 00h
    db 04h, 00h, 03h, 00h, 02h, 00h, 01h, 00h, 04h, 00h, 0FCh, 0FFh, 04h, 00h, 04h, 00h
    db 04h, 00h, 04h, 00h, 04h, 00h, 00h, 01h, 04h, 00h, 00h, 01h, 00h, 01h, 00h, 01h
    db 04h, 00h, 0FCh, 0FFh, 0FCh, 0FFh, 00h, 02h, 04h, 00h, 00h, 01h, 00h, 01h, 00h, 01h
    db 00h, 01h, 0FCh, 0FFh, 00h, 02h, 04h, 00h, 04h, 00h, 0FCh, 0FFh, 00h, 01h, 00h, 01h
    db 00h, 01h, 0FCh, 0FFh, 04h, 00h, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh
    db 04h, 00h, 00h, 01h, 0FFh, 0FFh, 0FDh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 0FCh, 0FFh, 02h, 00h
    db 01h, 00h, 0FFh, 0FFh, 0FFh, 0FFh, 0FEh, 0FFh, 0FEh, 0FFh, 0FDh, 0FFh, 0FFh, 0FFh, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h
    db 07h, 00h, 04h, 00h, 01h, 00h, 2Fh, 00h, 00h, 00h, 0Fh, 00h, 07h, 00h, 04h, 00h
    db 01h, 00h, 2Fh, 00h, 00h, 00h, 0Fh, 00h, 01h, 00h, 03h, 00h, 01h, 00h, 3Ah, 00h
    db 00h, 00h, 0Fh, 00h, 06h, 00h, 03h, 00h, 01h, 00h, 3Ah, 00h, 00h, 00h, 0Fh, 00h
    db 03h, 00h, 01h, 00h, 02h, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h, 06h, 00h, 02h, 00h
    db 02h, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h, 06h, 00h, 02h, 00h, 03h, 00h, 00h, 00h
    db 01h, 00h, 0Fh, 00h, 07h, 00h, 01h, 00h, 04h, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h
    db 06h, 00h, 02h, 00h, 04h, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h, 01h, 00h, 01h, 00h
    db 05h, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h, 07h, 00h, 02h, 00h, 05h, 00h, 00h, 00h
    db 00h, 00h, 0Fh, 00h, 07h, 00h, 01h, 00h, 06h, 00h, 00h, 00h, 09h, 00h, 0Fh, 00h
    db 04h, 00h, 02h, 00h, 06h, 00h, 00h, 00h, 09h, 00h, 0Fh, 00h, 03h, 00h, 01h, 00h
    db 07h, 00h, 00h, 00h, 04h, 00h, 0Fh, 00h, 07h, 00h, 02h, 00h, 07h, 00h, 00h, 00h
    db 04h, 00h, 0Fh, 00h, 07h, 00h, 01h, 00h, 16h, 00h, 00h, 00h, 05h, 00h, 0Fh, 00h
    db 07h, 00h, 02h, 00h, 16h, 00h, 00h, 00h, 05h, 00h, 0Fh, 00h, 07h, 00h, 01h, 00h
    db 16h, 00h, 00h, 00h, 06h, 00h, 0Fh, 00h, 07h, 00h, 02h, 00h, 16h, 00h, 00h, 00h
    db 06h, 00h, 0Fh, 00h, 03h, 00h, 01h, 00h, 16h, 00h, 22h, 00h, 06h, 00h, 0Fh, 00h
    db 07h, 00h, 02h, 00h, 16h, 00h, 22h, 00h, 06h, 00h, 03h, 00h, 03h, 00h, 01h, 00h
    db 17h, 00h, 00h, 00h, 0Bh, 00h, 03h, 00h, 07h, 00h, 02h, 00h, 17h, 00h, 02h, 00h
    db 0Bh, 00h, 0Fh, 00h, 01h, 00h, 01h, 00h, 0Ah, 00h, 00h, 00h, 03h, 00h, 0Fh, 00h
    db 06h, 00h, 02h, 00h, 0Ah, 00h, 00h, 00h, 03h, 00h, 0Fh, 00h, 07h, 00h, 01h, 00h
    db 0Ch, 00h, 00h, 00h, 07h, 00h, 03h, 00h, 07h, 00h, 02h, 00h, 0Ch, 00h, 02h, 00h
    db 07h, 00h, 03h, 00h, 07h, 00h, 02h, 00h, 0Ch, 00h, 00h, 00h, 07h, 00h, 03h, 00h
    db 07h, 00h, 01h, 00h, 0Dh, 00h, 00h, 00h, 01h, 00h, 03h, 00h, 07h, 00h, 02h, 00h
    db 0Dh, 00h, 00h, 00h, 01h, 00h, 02h, 00h, 03h, 00h, 01h, 00h, 0Eh, 00h, 00h, 00h
    db 08h, 00h, 02h, 00h, 07h, 00h, 02h, 00h, 0Eh, 00h, 00h, 00h, 08h, 00h, 03h, 00h
    db 03h, 00h, 01h, 00h, 0Fh, 00h, 00h, 00h, 02h, 00h, 03h, 00h, 07h, 00h, 02h, 00h
    db 0Fh, 00h, 00h, 00h, 02h, 00h, 0Fh, 00h, 03h, 00h, 01h, 00h, 10h, 00h, 00h, 00h
    db 00h, 00h, 0Fh, 00h, 06h, 00h, 02h, 00h, 10h, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h
    db 03h, 00h, 01h, 00h, 11h, 00h, 22h, 00h, 00h, 00h, 03h, 00h, 07h, 00h, 02h, 00h
    db 11h, 00h, 22h, 00h, 00h, 00h, 0Fh, 00h, 03h, 00h, 01h, 00h, 12h, 00h, 00h, 00h
    db 00h, 00h, 0Fh, 00h, 06h, 00h, 02h, 00h, 12h, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h
    db 01h, 00h, 01h, 00h, 13h, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h, 07h, 00h, 02h, 00h
    db 13h, 00h, 00h, 00h, 00h, 00h, 0Bh, 00h, 07h, 00h, 01h, 00h, 09h, 00h, 00h, 00h
    db 00h, 00h, 0Bh, 00h, 07h, 00h, 02h, 00h, 09h, 00h, 00h, 00h, 00h, 00h, 0Ch, 00h
    db 06h, 00h, 02h, 00h, 09h, 00h, 02h, 00h, 00h, 00h, 0Fh, 00h, 06h, 00h, 01h, 00h
    db 14h, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h, 06h, 00h, 02h, 00h, 14h, 00h, 00h, 00h
    db 00h, 00h, 0Ch, 00h, 06h, 00h, 05h, 00h, 15h, 00h, 00h, 00h, 00h, 00h, 03h, 00h
    db 07h, 00h, 05h, 00h, 15h, 00h, 00h, 00h, 00h, 00h, 0Ch, 00h, 06h, 00h, 07h, 00h
    db 15h, 00h, 00h, 00h, 00h, 00h, 03h, 00h, 03h, 00h, 07h, 00h, 15h, 00h, 00h, 00h
    db 00h, 00h, 0Bh, 00h, 01h, 00h, 07h, 00h, 15h, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h
    db 03h, 00h, 06h, 00h, 15h, 00h, 00h, 00h, 0F1h, 0FFh, 0Ch, 00h, 06h, 00h, 08h, 00h
    db 15h, 00h, 00h, 00h, 0F1h, 0FFh, 0Dh, 00h, 06h, 00h, 08h, 00h, 15h, 00h, 00h, 00h
    db 0FBh, 0FFh, 0Fh, 00h, 07h, 00h, 08h, 00h, 15h, 00h, 00h, 00h, 0FEh, 0FFh, 00h, 00h
    db 00h, 00h
_var_25 db 00h
    db 45h, 72h, 72h, 6Fh, 72h, 20h, 72h, 65h, 6Ch, 65h, 61h, 73h, 69h, 6Eh, 67h, 20h
    db 6Fh, 76h, 65h, 72h, 6Ch, 61h, 79h, 20h, 6Dh, 65h, 6Dh, 6Fh, 72h, 79h, 24h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h
    db 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h
    db 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h
    db 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h
    db 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h
    db 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h
    db 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h
    db 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h
    db 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h
    db 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah, 00h, 00h, 00h, 00h  ; JMPF LAB_0000_0000
    db 0eah  ; align align(1)
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h
    db 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h
    db 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h
_var_26 db 0EAh
    db 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 0EAh, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h
_var_27 db 00h
    db 00h
_var_28 db 00h
    db 00h
_var_29 db 00h
    db 00h
_var_30 db 00h
    db 00h, 00h
_var_31 db 00h
    db 00h
_var_32 db 00h
    db 00h
_var_33 db 00h
    db 00h
_var_34 db 00h
    db 00h
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
_var_36 db 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
_var_37 db 0FFh
    db 0FFh
_var_38 db 00h
    db 00h, 00h
_var_39 db 00h
_var_40 db 00h
_var_41 db 00h
_var_42 db 00h
_var_43 db 00h
_var_44 db 00h
    db 00h
_var_45 db 00h
    db 00h
_var_46 db 3Fh
    db 01h
_var_47 db 6Fh
    db 00h, 00h
_var_48 db 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h
_var_49 db 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h
_var_50 db 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h
_var_51 db 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h
_var_52 db 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h
_var_53 db 00h
    db 00h
_var_54 db 00h
    db 00h, 00h, 00h, 00h, 00h
_var_55 db 00h
_var_56 db 00h
    db 00h, 00h
_var_57 db 00h
_var_58 db 00h
    db 00h
_var_59 db 00h
    db 00h, 00h
_var_60 db 00h
_var_61 db 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h
_var_62 db 00h
    db 00h
_var_63 db 00h, 00h  ; undefined2 0000h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
_var_64 db 00h
    db 00h
_var_65 db 00h
    db 00h
_var_66 db 00h
    db 00h, 00h, 00h
_var_67 db 00h
    db 00h
_var_68 db 00h
    db 00h
_var_70 db 00h
    db 00h
_var_71 db 00h
    db 00h
_var_72 db 00h
    db 00h
_var_73 db 00h
    db 00h, 00h, 00h
_var_74 db 00h
    db 00h
_var_75 db 00h
_var_76 db 00h
    db 00h
_var_77 db 00h
    db 00h
_var_78 db 00h
    db 00h
_var_79 db 00h
_var_80 db 00h
    db 00h, 00h, 00h, 00h, 00h
_var_81 db 00h
    db 00h
_var_82 db 00h
_var_83 db 00h
    db 00h, 4Dh, 61h, 6Ah, 6Fh, 72h, 2Eh, 00h, 74h, 68h, 65h, 20h, 00h, 00h, 00h, 00h
    db 00h
_var_84 db 07h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h
_var_85 db 01h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
_var_86 db 0Ah
    db 1Ch, 00h, 00h, 00h, 00h, 09h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 03h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 22h, 1Ch
_var_87 db 1Eh
    db 1Ah, 1Fh, 1Ah, 2Fh, 1Ah, 38h, 1Ah, 3Fh, 1Ah, 4Bh, 1Ah, 54h, 1Ah
_var_88 db 0DCh
    db 05h
_var_89 db 00h
    db 00h, 70h, 17h, 00h, 00h, 0E0h, 2Eh, 00h, 00h, 0A8h, 61h, 00h, 00h, 50h, 0C3h, 00h
    db 00h, 0A0h, 86h, 01h, 00h
_var_90 db 5Dh
    db 1Ah, 7Bh, 1Ah, 97h, 1Ah, 0A4h, 1Ah, 0B5h, 1Ah
_var_91 db 0E8h
    db 03h
_var_92 db 00h
    db 00h, 0C4h, 09h, 00h, 00h, 0A0h, 0Fh, 00h, 00h, 00h, 19h, 00h, 00h, 78h, 1Eh, 00h
    db 00h, 04h, 03h, 03h, 02h, 07h, 05h, 03h, 02h, 08h, 07h, 04h, 02h, 08h, 06h, 05h
    db 03h, 06h, 00h, 9Dh, 00h, 0DBh, 00h, 0BDh, 00h, 0D9h, 00h, 93h, 00h, 39h, 00h, 02h
    db 00h, 78h, 00h, 87h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 8Dh, 00h, 00h
    db 00h
_var_93 db 08h
    db 00h
_var_94 db 0Ah
    db 00h
_var_95 db 0E8h
    db 00h
_var_96 db 0B2h
    db 00h, 8Dh, 00h, 80h, 00h, 84h, 8Dh, 00h, 80h, 00h, 8Dh, 00h, 80h, 00h, 54h, 49h
    db 4Dh, 45h, 3Ah, 20h, 80h, 00h, 20h, 00h, 20h, 00h, 20h, 00h, 8Ch, 8Ch, 8Dh, 00h
    db 80h, 00h, 80h, 8Dh, 54h, 49h, 4Dh, 45h, 3Ah, 20h, 80h, 00h, 80h, 00h, 30h, 30h
    db 3Ah, 30h, 30h, 3Ah, 30h, 30h, 00h
_var_97 db 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 28h, 00h, 28h, 00h, 28h
    db 00h, 28h, 00h, 28h, 00h, 28h, 00h, 50h, 00h, 50h, 00h, 50h, 00h, 50h, 00h, 50h
    db 00h, 50h, 00h
_var_98 db 00h
    db 00h, 30h, 00h, 60h, 00h, 90h, 00h, 0C0h, 00h, 0F0h, 00h, 00h, 00h, 30h, 00h, 60h
    db 00h, 90h, 00h, 0C0h, 00h, 0F0h, 00h, 00h, 00h, 30h, 00h, 60h, 00h, 90h, 00h, 0C0h
    db 00h, 0F0h, 00h, 76h, 6Eh, 2Eh, 73h, 70h, 72h, 00h, 6Dh, 65h, 2Eh, 73h, 70h, 72h
    db 00h, 6Ah, 70h, 2Eh, 73h, 70h, 72h, 00h, 6Eh, 61h, 2Eh, 73h, 70h, 72h, 00h, 72h
    db 62h, 00h, 72h, 62h, 00h, 00h, 00h, 00h, 00h, 02h, 00h, 0Fh, 00h, 00h, 00h, 00h
    db 00h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
_var_99 db 34h
    db 20h, 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h, 00h, 00h, 00h, 00h, 03h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h
_var_100 db 4Ch
    db 20h
_var_101 db 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 08h, 00h, 0Ah, 00h, 0E0h, 00h, 0A8h, 00h, 00h
    db 00h, 0C7h, 00h, 00h, 00h, 36h, 01h, 09h, 00h, 00h, 00h, 00h, 00h
_var_102 db 64h
    db 20h
_var_103 db 00h
    db 00h, 00h, 00h, 0B2h, 00h, 00h, 00h, 00h, 00h, 0B2h, 00h, 40h, 01h, 15h, 00h, 00h
    db 00h, 0C7h, 00h, 00h, 00h, 36h, 01h, 09h, 00h, 00h, 00h, 00h, 00h
_var_104 db 84h
    db 20h
_var_105 db 00h
    db 00h, 2Dh, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 05h, 00h, 05h, 00h, 00h
    db 00h, 0C7h, 00h, 00h, 00h, 36h, 01h, 09h, 00h, 00h, 00h, 00h, 00h, 0A4h, 20h
_var_106 db 00h
    db 00h, 2Dh, 01h, 05h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 05h, 00h, 05h, 00h, 00h
    db 00h, 0C7h, 00h, 00h, 00h, 36h, 01h, 09h, 00h, 00h, 00h, 00h, 00h, 0C4h, 20h
_var_107 db 00h
    db 00h, 23h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 05h, 00h, 05h, 00h, 00h
    db 00h, 0C7h, 00h, 00h, 00h, 36h, 01h, 09h, 00h, 00h, 00h, 00h, 00h, 0E4h, 20h
_var_108 db 00h
    db 00h, 23h, 01h, 05h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 05h, 00h, 05h, 00h, 00h
    db 00h, 0C7h, 00h, 00h, 00h, 36h, 01h, 09h, 00h, 00h, 00h, 00h, 00h, 04h, 21h
_var_109 db 00h
    db 00h, 17h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 05h, 00h, 05h, 00h, 00h
    db 00h, 0C7h, 00h, 00h, 00h, 36h, 01h, 09h, 00h, 00h, 00h, 00h, 00h, 24h, 21h
_var_110 db 00h
    db 00h, 17h, 01h, 05h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 05h, 00h, 05h, 00h, 00h
    db 00h, 0C7h, 00h, 00h, 00h, 36h, 01h, 09h, 00h, 00h, 00h, 00h, 00h, 44h, 21h
_var_111 db 00h
    db 00h, 1Eh, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 05h, 00h, 05h, 00h, 00h
    db 00h, 0C7h, 00h, 00h, 00h, 36h, 01h, 09h, 00h, 00h, 00h, 00h, 00h, 64h, 21h
_var_112 db 00h
    db 00h, 1Eh, 01h, 05h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 05h, 00h, 05h, 00h, 00h
    db 00h, 0C7h, 00h, 00h, 00h, 36h, 01h, 09h, 00h, 00h, 00h, 00h, 00h, 84h, 21h
_var_113 db 00h
    db 00h, 2Ah, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 00h, 01h, 00h, 00h
    db 00h, 0C7h, 00h, 00h, 00h, 36h, 01h, 09h, 00h, 00h, 00h, 00h, 00h, 0A4h, 21h
_var_114 db 00h
    db 00h, 2Ah, 01h, 05h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 00h, 01h, 00h, 00h
    db 00h, 0C7h, 00h, 00h, 00h, 36h, 01h, 09h, 00h, 00h, 00h, 00h, 00h, 0C4h, 21h, 0ECh
    db 00h, 96h, 00h, 3Ch, 01h, 9Fh, 00h, 0ECh, 00h, 96h, 00h, 3Ch, 01h, 9Fh, 00h, 00h
    db 00h, 69h, 00h, 98h, 00h, 08h, 00h, 11h, 01h, 39h, 00h, 07h, 00h, 4Ch, 20h, 1Ah
    db 00h, 07h, 00h, 0FAh, 00h, 3Ch, 00h, 0A4h, 20h, 0C4h, 20h, 00h, 00h
_var_115 db 00h
    db 00h, 08h, 18h, 0ECh, 00h, 0A0h, 00h, 3Ch, 01h, 0A9h, 00h, 0ECh, 00h, 0A0h, 00h, 3Ch
    db 01h, 0A9h, 00h, 00h, 00h, 69h, 00h, 98h, 00h, 08h, 00h, 11h, 01h, 39h, 00h, 07h
    db 00h, 4Ch, 20h, 1Ah, 00h, 07h, 00h, 0FAh, 00h, 3Ch, 00h, 0A4h, 20h, 0C4h, 20h, 00h
    db 00h, 00h, 00h, 0Fh, 08h, 00h, 00h, 0Ah, 00h, 0FAh, 00h, 0FAh, 00h, 97h, 00h, 0A1h
    db 00h
_var_116 db 48h
    db 22h
_var_117 db 32h
    db 1Fh, 3Ch, 1Fh, 48h, 1Fh, 4Fh, 1Fh, 56h, 1Fh, 60h, 1Fh, 6Ch, 1Fh, 73h, 1Fh
_var_118 db 7Ah
    db 1Fh, 89h, 1Fh
_var_119 db 00h, 00h  ; undefined2 0000h
_var_120 db 00h, 00h  ; undefined2 0000h
_var_121 db 0a9h, 4ah  ; undefined2 4AA9h
_var_122 db 00h, 00h  ; undefined2 0000h
    db 80h, 15h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
OFF_1580_22c0 db 00h
_var_124 db 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
_var_125 db 00h
    db 00h
_var_126 db 00h
    db 00h, 00h, 00h
_var_127 db 00h, 00h  ; undefined2 0000h
_var_128 db 00h
    db 00h, 00h
_var_129 db 00h
    db 00h
_var_130 db 14h
    db 00h
_var_131 db 81h
    db 81h, 81h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h
_var_132 db 00h, 00h  ; undefined2 0000h
_var_133 db 00h, 00h  ; undefined2 0000h
_var_134 db 00h, 00h  ; undefined2 0000h
    db 08h, 23h, 80h, 15h, 43h, 00h, 00h, 00h
_var_135 db 00h
_var_136 db 00h
_var_137 db 00h
    db 00h, 00h, 00h, 5Ch, 00h, 5Ch, 00h
_var_138 db 01h
    db 00h
_var_139 db 00h
    db 00h
_var_140 db 00h
    db 00h, 00h, 16h, 02h, 02h, 18h, 0Dh, 09h, 0Ch, 0Ch, 0Ch, 07h, 08h, 16h, 16h, 0FFh
    db 12h, 0Dh, 12h, 02h, 0FFh, 0FEh, 4Ch, 00h, 00h, 0FEh, 4Ch, 01h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 02h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 02h, 02h, 00h, 00h, 00h
    db 00h, 00h, 00h, 84h, 03h, 00h, 00h, 00h, 00h, 00h, 00h, 02h, 04h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h
_var_141 db 01h
    db 00h, 00h, 02h
_var_142 db 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h
_var_143 db 0C8h
    db 23h
_var_144 db 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
_var_145 db 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 20h, 00h, 00h, 00h, 00h
_var_146 db 0D0h
    db 5Dh, 00h, 00h
_var_147 db 00h
    db 00h
_var_148 db 00h
    db 00h
_var_149 db 00h
    db 00h, 00h, 00h
_var_150 db 00h
    db 00h, 00h, 00h, 94h, 54h, 3Ch, 3Ch, 4Eh, 4Dh, 53h, 47h, 3Eh, 3Eh, 00h, 00h, 03h
    db 00h, 09h, 00h, 0FCh, 00h, 0Dh, 0Ah, 00h, 0FFh, 00h, 02h, 00h, 01h, 00h, 0FFh, 0FFh
    db 0FFh, 00h
_var_151 db 00h  ; undefined1 00h
_DAT_1580_2551 db 00h  ; undefined1 00h
_var_152 db 00h
    db 00h
_var_153 db 00h
    db 00h
_var_154 db 00h
    db 00h
_var_155 db 00h
    db 00h
_var_156 db 00h
_var_157 db 00h
_var_158 db 00h
_var_159 db 00h
_var_160 db 00h
    db 00h
_var_161 db 00h
    db 00h
_var_162 db 00h
    db 00h
_var_163 db 00h
_var_164 db 00h
_var_165 db 00h
    db 00h
_var_166 db 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h
_var_167 db 00h
    db 00h
_var_168 db 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
_var_169 db 00h
    db 00h
_var_170 db 00h
    db 00h
_var_171 db 00h
    db 00h
_var_172 db 00h
    db 00h
_var_173 db 00h
_var_174 db 00h
_var_175 db 00h
    db 00h

.DATA?
; --- BSS ---

    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_176 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_177 db ?
    db ?
_var_178 db ?
    db ?
_var_179 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_180 db ?
    db ?
    db ?
    db ?
_var_181 db ?
    db ?
_var_182 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_183 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_184 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_185 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_186 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_187 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_188 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_189 db ?
    db ?
    db ?
    db ?
_var_190 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_191 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_192 db ?
    db ?
_var_193 db ?
    db ?
_var_194 db ?
_var_195 db ?
_var_196 db ?
_var_197 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_198 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_199 db ?
    db ?
_var_200 db ?
    db ?
_var_201 db ?
    db ?
    db ?
_var_202 db ?
_var_203 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_204 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_205 db ?
    db ?
    db ?
    db ?
_var_206 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_207 db ?
    db ?
_var_208 db ?
    db ?
_var_209 db ?
    db ?
_var_210 db ?
    db ?
    db ?
    db ?
_var_211 db ?
    db ?
_var_212 db ?
    db ?
_var_213 db ?
    db ?
_var_214 db ?
    db ?
_var_215 db ?
    db ?
_var_216 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_217 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_218 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_219 db ?
    db ?
_var_220 db ?
    db ?
_var_221 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_222 db ?
    db ?
_var_223 db ?
    db ?
_var_224 db ?
    db ?
    db ?
    db ?
_var_225 db ?
    db ?
_var_226 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
_var_227 db ?
    db ?
_var_228 db ?
    db ?
_var_229 db ?
    db ?
_var_230 db ?
    db ?
_var_231 db ?
    db ?
_var_232 db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?
    db ?

END
