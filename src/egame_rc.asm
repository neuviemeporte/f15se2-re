.8086
DOSSEG
.MODEL SMALL
PUBLIC _commData
;  ==============================================================================

seg001 segment byte public 'CODE' use16
    assume cs:seg001
    assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
; ------------------------------seg001:0x2------------------------------
sub_1F882 proc far
    arg_2 = word ptr 8
    arg_4 = word ptr 0Ah
    arg_6 = byte ptr 0Ch
    push bp
    mov bp, sp
    push es
    push ds
    push si
    push di
    mov ah, [bp+arg_6]
    call far ptr sub_3380E
    call sub_21720
    mov si, [bp+arg_4]
    mov cx, [bp+arg_2]
    dec cx
    lodsw
    mov word_3755D, ax
    push ax
    lodsw
    mov word_37561, ax
    push ax
loc_1F8A5:
    push cx
    lodsw
    mov word_3755F, ax
    push ax
    lodsw
    mov word_37563, ax
    push ax
    push si
    call sub_218A8
    pop si
    pop word_37561
    pop word_3755D
    pop cx
    loop loc_1F8A5
    pop word_37563
    pop word_3755F
    call sub_218A8
    mov ax, word_378D9
    mov cx, word_378DB
    mov bx, 4CB5h
    call far ptr sub_33827
sub_1F882 endp
; ------------------------------seg001:0x55------------------------------
    call far ptr sub_33818
    pop di
    pop si
    pop ds
    pop es
    pop bp
    retf
    nop
    mov bx, sp
    push si
    push di
    mov bx, ss:[bx+2]
    shl bx, 1
    shl bx, 1
    call sub_1F8F8
    pop di
    pop si
    retn
; ------------------------------seg001:0x78------------------------------
sub_1F8F8 proc near
    mov cx, [bx+1DD6h]
    cmp byte_37C24, 0
    jz short loc_1F905
    shl cx, 1
loc_1F905:
    cmp byte_3850E, 0
    jz short loc_1F916
    xchg dx, cx
    mov cl, byte_3850E
    sar dx, cl
    xchg dx, cx
loc_1F916:
    or cx, cx
    jle short loc_1F967
    mov dx, [bx+1A0Dh]
    mov al, [bx+1A0Fh]
    cbw
    xchg ax, dx
    idiv cx
    cwd
    or ax, ax
    add ax, word_3298C
    adc dx, 0
    mov [bx+1FBAh], dx
    mov [bx+1FB8h], ax
    mov dx, [bx+1BF1h]
    mov al, [bx+1BF3h]
    cbw
    xchg ax, dx
    mov si, dx
    mov di, ax
    sar dx, 1
    rcr ax, 1
    sar dx, 1
    rcr ax, 1
    sub ax, di
    sbb dx, si
    idiv cx
    cwd
    or ax, ax
    add ax, word_3298E
    adc dx, 0
    mov [bx+219Eh], dx
    mov [bx+219Ch], ax
    retn
loc_1F967:
    mov ax, 8000h
    mov [bx+1FB8h], ax
    mov [bx+1FBAh], ax
    mov [bx+219Ch], ax
    mov [bx+219Eh], ax
    retn
sub_1F8F8 endp
; ------------------------------seg001:0xfa------------------------------
    push bp
    mov bp, sp
    add word ptr [bp+2], 3
    mov al, ah
    mov ah, dl
    mov dl, dh
    idiv cx
    cwd
    mov dl, ah
    mov ah, al
    sub al, al
    pop bp
    iret
; ------------------------------seg001:0x113------------------------------
sub_1F993 proc near
    push es
    sub ax, ax
    mov es, ax
    assume es:nothing
    mov ax, es:0
    mov word_34150, ax
    lea ax, unk_329AB
    mov es:0, ax
    mov ax, es:2
    mov word_34152, ax
    mov ax, seg seg001
    mov es:2, ax
    pop es
    assume es:nothing
    retn
sub_1F993 endp
; ------------------------------seg001:0x136------------------------------
; ------------------------------seg001:0x137------------------------------
sub_1F9B7 proc near
    push es
    sub ax, ax
    mov es, ax
    assume es:nothing
    mov ax, word_34150
    mov es:0, ax
    mov ax, word_34152
    mov es:2, ax
    pop es
    assume es:nothing
    retn
sub_1F9B7 endp
; ------------------------------seg001:0x14b------------------------------
    push bp
    mov bp, sp
    push si
    push di
    push es
    mov di, [bp+6]
    call sub_1F9DD
    pop es
    pop di
    pop si
    pop bp
    retn
; ------------------------------seg001:0x15d------------------------------
sub_1F9DD proc near
    mov ax, [di]
    mov cx, [di+2]
    cwd
    cmp dx, cx
    jnz short loc_1FA27
    mov si, ax
    mov ax, [di+4]
    mov cx, [di+6]
    cwd
    cmp dx, cx
    jnz short loc_1FA27
    mov cx, ax
    mov ax, [di+8]
    mov bx, [di+0Ah]
    cwd
    cmp dx, bx
    jnz short loc_1FA27
    mov bp, ax
    mov ax, [di+0Ch]
    mov bx, [di+0Eh]
    cwd
    cmp dx, bx
    jnz short loc_1FA27
    mov dx, ax
    mov ax, word_37557
    cmp si, ax
    ja short loc_1FA27
    cmp bp, ax
    ja short loc_1FA27
    mov ax, word_37559
    cmp cx, ax
    ja short loc_1FA27
    cmp dx, ax
    ja short loc_1FA27
    retn
loc_1FA27:
    sub al, al
    mov byte_34170, al
    mov bx, [di]
    mov word_34156, bx
    mov cx, [di+2]
    mov word_34158, cx
    mov si, [di+4]
    mov word_3415A, si
    mov dx, [di+6]
    mov word_3415C, dx
    call sub_1FC03
    mov byte_3416E, al
    jz short loc_1FA58
    call sub_1FC3A
    mov [di+2], ax
    mov [di+6], bp
loc_1FA58:
    mov bx, [di+8]
    mov word_3415E, bx
    mov cx, [di+0Ah]
    mov word_34160, cx
    mov si, [di+0Ch]
    mov word_34162, si
    mov dx, [di+0Eh]
    mov word_34164, dx
    call sub_1FC03
    mov byte_3416F, al
    jz short loc_1FA85
    call sub_1FC3A
    mov [di+0Ah], ax
    mov [di+0Eh], bp
loc_1FA85:
    mov ah, byte_3416E
    mov al, byte_3416F
    or ah, al
    test byte_3416E, al
    jnz short loc_1FABB
    or al, al
    jz short loc_1FAA3
    mov al, byte_3416E
    or al, al
    jz short loc_1FAA7
    call sub_1FABF
    retn
loc_1FAA3:
    call sub_1FB1D
    retn
loc_1FAA7:
    mov bx, word_34156
    mov cx, word_34158
    mov si, word_3415A
    mov dx, word_3415C
    call sub_1FB52
    retn
loc_1FABB:
    call sub_1FB88
    retn
sub_1F9DD endp
; ------------------------------seg001:0x23e------------------------------
; ------------------------------seg001:0x23f------------------------------
sub_1FABF proc near
    mov ax, word_34156
    mov word_34166, ax
    mov ax, word_34158
    mov word_34168, ax
    mov ax, word_3415A
    mov word_3416A, ax
    mov ax, word_3415C
    mov word_3416C, ax
    mov bx, word_3415E
    mov cx, word_34160
    mov si, word_34162
    mov dx, word_34164
    call sub_1FD04
    jz short loc_1FAF6
    mov dx, [di+0Eh]
    mov [di+4], dx
    call sub_1FB88
    retn
loc_1FAF6:
    mov word_34179, bx
    mov word_3417B, cx
    mov word_3417D, si
    mov word_3417F, dx
    call sub_1FB1D
    mov bx, word_34179
    mov cx, word_3417B
    mov si, word_3417D
    mov dx, word_3417F
    call sub_1FB52
    retn
sub_1FABF endp
; ------------------------------seg001:0x29c------------------------------
; ------------------------------seg001:0x29d------------------------------
sub_1FB1D proc near
    mov word_34166, bx
    mov word_34168, cx
    mov word_3416A, si
    mov word_3416C, dx
    mov bx, word_34156
    mov cx, word_34158
    mov si, word_3415A
    mov dx, word_3415C
    call sub_1FC8E
    mov [di], bx
    mov [di+4], si
    mov ax, [di+4]
    cmp ax, [di+6]
    jz short locret_1FB51
    or byte ptr [di+18h], 20h
locret_1FB51:
    retn
sub_1FB1D endp
; ------------------------------seg001:0x2d1------------------------------
; ------------------------------seg001:0x2d2------------------------------
sub_1FB52 proc near
    mov word_34166, bx
    mov word_34168, cx
    mov word_3416A, si
    mov word_3416C, dx
    mov bx, word_3415E
    mov cx, word_34160
    mov si, word_34162
    mov dx, word_34164
    call sub_1FC8E
    mov [di+8], bx
    mov [di+0Ch], si
    mov ax, [di+0Ch]
    cmp ax, [di+0Eh]
    jz short locret_1FB87
    or byte ptr [di+18h], 10h
locret_1FB87:
    retn
sub_1FB52 endp
; ------------------------------seg001:0x307------------------------------
; ------------------------------seg001:0x308------------------------------
sub_1FB88 proc near
    mov cl, [di+18h]
    or cl, 80h
    mov dx, [di+0Eh]
    mov [di+4], dx
    test al, 9
    jz short loc_1FBB0
    mov dx, 0
    test al, 8
    jnz short loc_1FBA3
    mov dx, word_37557
loc_1FBA3:
    mov [di], dx
    mov ax, [di+4]
    cmp ax, [di+6]
    jz short loc_1FBB0
    or cl, 20h
loc_1FBB0:
    mov [di+18h], cl
    retn
sub_1FB88 endp
; ------------------------------seg001:0x333------------------------------
; ------------------------------seg001:0x334------------------------------
sub_1FBB4 proc near
    or cx, cx
    jnz short loc_1FBC3
    cmp bx, 0
    jz short loc_1FBD5
    cmp bx, word_37557
    jz short loc_1FBD5
loc_1FBC3:
    or dx, dx
    jnz short loc_1FBD2
    cmp si, 0
    jz short loc_1FBEC
    cmp si, word_37559
    jz short loc_1FBEC
loc_1FBD2:
    sub ax, ax
    retn
loc_1FBD5:
    sub ax, ax
    or dx, dx
    js short loc_1FBE9
    jnz short loc_1FBE9
    cmp si, 0
    jb short loc_1FBE9
    cmp si, word_37559
    ja short loc_1FBE9
    inc ax
loc_1FBE9:
    or ax, ax
    retn
loc_1FBEC:
    sub ax, ax
    or cx, cx
    js short loc_1FC00
    jnz short loc_1FC00
    cmp bx, 0
    jb short loc_1FC00
    cmp bx, word_37557
    ja short loc_1FC00
    inc ax
loc_1FC00:
    or ax, ax
    retn
sub_1FBB4 endp
; ------------------------------seg001:0x382------------------------------
; ------------------------------seg001:0x383------------------------------
sub_1FC03 proc near
    mov al, 0Ch
    or cx, cx
    js short loc_1FC1E
    jnz short loc_1FC10
    cmp bx, 0
    jb short loc_1FC1E
loc_1FC10:
    xor al, 9
    or cx, cx
    jnz short loc_1FC1E
    cmp bx, word_37557
    ja short loc_1FC1E
    xor al, 1
loc_1FC1E:
    or dx, dx
    js short loc_1FC37
    jnz short loc_1FC29
    cmp si, 0
    jb short loc_1FC37
loc_1FC29:
    xor al, 6
    or dx, dx
    jnz short loc_1FC37
    cmp si, word_37559
    ja short loc_1FC37
    xor al, 2
loc_1FC37:
    or al, al
    retn
sub_1FC03 endp
; ------------------------------seg001:0x3b9------------------------------
; ------------------------------seg001:0x3ba------------------------------
sub_1FC3A proc near
    mov ah, 1
    mov bp, cx
    inc bp
    cmp bp, 1
    ja short loc_1FC66
    mov bp, cx
    sar bp, 1
    xor bp, bx
    and bp, 0C000h
    jnz short loc_1FC66
    mov bp, dx
    inc bp
    cmp bp, 1
    ja short loc_1FC66
    mov bp, dx
    sar bp, 1
    xor bp, si
    and bp, 0C000h
    jnz short loc_1FC66
    sub ah, ah
loc_1FC66:
    or byte_34170, ah
    mov bp, si
    test al, 4
    jz short loc_1FC73
    mov bp, 0
loc_1FC73:
    test al, 2
    jz short loc_1FC7B
    mov bp, word_37559
loc_1FC7B:
    test al, 8
    jz short loc_1FC83
    mov ax, 0
    retn
loc_1FC83:
    test al, 1
    jz short loc_1FC8B
    mov ax, word_37557
    retn
loc_1FC8B:
    mov ax, bx
    retn
sub_1FC3A endp
; ------------------------------seg001:0x40d------------------------------
; ------------------------------seg001:0x40e------------------------------
sub_1FC8E proc near
    mov al, byte_34170
    or al, al
    jnz short loc_1FC98
    jmp loc_1FE0A
loc_1FC98:
    mov bp, 20h
loc_1FC9B:
    mov word_34171, bx
    mov word_34173, cx
    mov word_34175, si
    mov word_34177, dx
loc_1FCAB:
    add bx, word_34166
    adc cx, word_34168
    sar cx, 1
    rcr bx, 1
    add si, word_3416A
    adc dx, word_3416C
    sar dx, 1
    rcr si, 1
    call sub_1FBB4
    jnz short locret_1FCF2
    dec bp
    jz short loc_1FCF3
    call sub_1FC03
    jnz short loc_1FC9B
    mov word_34166, bx
    mov word_34168, cx
    mov word_3416A, si
    mov word_3416C, dx
    mov bx, word_34171
    mov cx, word_34173
    mov si, word_34175
    mov dx, word_34177
    jmp short loc_1FCAB
locret_1FCF2:
    retn
loc_1FCF3:
    mov bx, word_34166
    mov cx, word_34168
    mov si, word_3416A
    mov dx, word_3416C
    retn
sub_1FC8E endp
; ------------------------------seg001:0x483------------------------------
; ------------------------------seg001:0x484------------------------------
sub_1FD04 proc near
    mov al, byte_34170
    or al, al
    jnz short loc_1FD0E
    jmp loc_1FDD0
loc_1FD0E:
    mov bp, 20h
loc_1FD11:
    mov word_34171, bx
    mov word_34173, cx
    mov word_34175, si
    mov word_34177, dx
loc_1FD21:
    add bx, word_34166
    adc cx, word_34168
    sar cx, 1
    rcr bx, 1
    add si, word_3416A
    adc dx, word_3416C
    sar dx, 1
    rcr si, 1
    call sub_1FC03
    jz short loc_1FD6F
    dec bp
    jz short loc_1FD6F
    test byte_3416E, al
    jz short loc_1FD11
    test byte_3416F, al
    jnz short loc_1FD6F
    mov word_34166, bx
    mov word_34168, cx
    mov word_3416A, si
    mov word_3416C, dx
    mov bx, word_34171
    mov cx, word_34173
    mov si, word_34175
    mov dx, word_34177
    jmp short loc_1FD21
loc_1FD6F:
    or al, al
    retn
sub_1FD04 endp
; ------------------------------seg001:0x4f1------------------------------
; ------------------------------seg001:0x4f2------------------------------
sub_1FD72 proc near
    cmp bx, 0
    jz short loc_1FD8B
    cmp bx, word_37557
    jz short loc_1FD8B
    cmp si, 0
    jz short loc_1FD9C
    cmp si, word_37559
    jz short loc_1FD9C
    sub ax, ax
    retn
loc_1FD8B:
    sub ax, ax
    cmp si, 0
    jl short loc_1FD99
    cmp si, word_37559
    jg short loc_1FD99
    inc ax
loc_1FD99:
    or ax, ax
    retn
loc_1FD9C:
    sub ax, ax
    cmp bx, 0
    jl short loc_1FDAA
    cmp bx, word_37557
    jg short loc_1FDAA
    inc ax
loc_1FDAA:
    or ax, ax
    retn
sub_1FD72 endp
; ------------------------------seg001:0x52c------------------------------
; ------------------------------seg001:0x52d------------------------------
sub_1FDAD proc near
    mov al, 0Ch
    cmp bx, 0
    jl short loc_1FDBE
    xor al, 9
    cmp bx, word_37557
    jg short loc_1FDBE
    xor al, 1
loc_1FDBE:
    cmp si, 0
    jl short loc_1FDCD
    xor al, 6
    cmp si, word_37559
    jg short loc_1FDCD
    xor al, 2
loc_1FDCD:
    or al, al
    retn
sub_1FDAD endp
; ------------------------------seg001:0x54f------------------------------
loc_1FDD0:
    push di
    mov cx, word_34166
    mov dx, word_3416A
    mov bp, 10h
loc_1FDDC:
    mov di, bx
    mov es, si
loc_1FDE0:
    add bx, cx
    sar bx, 1
    add si, dx
    sar si, 1
    call sub_1FDAD
    jz short loc_1FE06
    dec bp
    jz short loc_1FE06
    test byte_3416E, al
    jz short loc_1FDDC
    test byte_3416F, al
    jnz short loc_1FE06
    mov cx, bx
    mov dx, si
    mov bx, di
    mov si, es
    jmp short loc_1FDE0
loc_1FE06:
    pop di
    or al, al
    retn
loc_1FE0A:
    push di
    mov cx, word_34166
    mov dx, word_3416A
    mov bp, 10h
loc_1FE16:
    mov di, bx
    mov es, si
loc_1FE1A:
    add bx, cx
    sar bx, 1
    add si, dx
    sar si, 1
    call sub_1FD72
    jnz short loc_1FE39
    dec bp
    jz short loc_1FE3B
    call sub_1FDAD
    jnz short loc_1FE16
    mov cx, bx
    mov dx, si
    mov bx, di
    mov si, es
    jmp short loc_1FE1A
loc_1FE39:
    pop di
    retn
loc_1FE3B:
    mov bx, cx
    mov si, dx
    pop di
    retn
    nop
    push bp
    mov bp, sp
    push si
    push di
    mov si, [bp+4]
    mov ax, [bp+6]
    mov es, ax
    mov di, [bp+8]
    mov bx, [bp+0Ah]
    call sub_1FE5C
    pop di
    pop si
    pop bp
    retn
; ------------------------------seg001:0x5dc------------------------------
sub_1FE5C proc near
    mov word_34190, bx
    sub bp, bp
    mov al, es:[si]
    inc si
    sub ah, ah
    mov cx, ax
loc_1FE6A:
    mov bx, word_34190
    add bx, cx
    mov al, [bx]
    mov bx, cx
    shl bx, 1
    sub dx, dx
    cmp al, 0FFh
    jnz short loc_1FE7F
    mov dx, 2
loc_1FE7F:
    cmp dx, 0
    jz short loc_1FE96
    cmp dx, 1
    jz short loc_1FE9C
    cmp dx, 2
    jz short loc_1FEA5
    cmp dx, 3
    jz short loc_1FEAB
    jmp short loc_1FEB4
    nop
loc_1FE96:
    mov dx, 1
    jmp short loc_1FED8
    nop
loc_1FE9C:
    mov [di], cl
    inc di
    mov dx, 4
    jmp short loc_1FECC
    db 90h
loc_1FEA5:
    mov dx, 3
    jmp short loc_1FECC
    db 90h
loc_1FEAB:
    mov [di], cl
    inc di
    mov dx, 4
    jmp short loc_1FED8
    nop
loc_1FEB4:
    sub bp, 1
    js short loc_1FEC8
    pop ax
    mov dl, al
    sub dh, dh
    mov cl, ah
    sub ch, ch
    mov bx, cx
    shl bx, 1
    jmp short loc_1FE7F
loc_1FEC8:
    mov byte ptr [di], 0FFh
    retn
loc_1FECC:
    mov al, es:[bx+si]
    cmp al, 0FFh
    jz short loc_1FED6
    jmp short loc_1FEE0
    nop
loc_1FED6:
    jmp short loc_1FE7F
loc_1FED8:
    mov al, es:[bx+si+1]
    cmp al, 0FFh
    jz short loc_1FED6
loc_1FEE0:
    sub ah, ah
    xchg ax, cx
    mov ah, al
    mov al, dl
    push ax
    inc bp
    jmp loc_1FE6A
sub_1FE5C endp ;sp-analysis failed
; ------------------------------seg001:0x669------------------------------
; ------------------------------seg001:0x66c------------------------------
sub_1FEEC proc far
    arg_0 = byte ptr 6
    push bp
    mov bp, sp
    mov al, [bp+arg_0]
    mov byte_34196, al
    push si
    push di
    call sub_1FEFE
sub_1FEEC endp
; ------------------------------seg001:0x677------------------------------
    pop di
    pop si
    pop bp
    retf
; ------------------------------seg001:0x67e------------------------------
sub_1FEFE proc near
    mov ax, word_34272
    neg ax
    mov word_34194, ax
    mov ax, word_3426E
    cwd
    mov dl, ah
    mov ah, al
    sub al, al
    mov cx, word_34270
    cmp cx, 1F0Bh
    jg short loc_1FF20
    mov ax, 3FFh
    jmp short loc_1FF3E
    nop
loc_1FF20:
    idiv cx
    cmp byte ptr word_38FDC, 2
    jnz short loc_1FF3E
    mov dl, byte ptr word_34268+1
    sub dh, dh
    mov cx, dx
    shr cx, 1
    add dx, cx
    mov cl, 3
    shr dx, cl
    add dx, 4
    sub ax, dx
loc_1FF3E:
    cmp byte_3850E, 0
    jz short loc_1FF4B
    mov cl, byte_3850E
    shl ax, cl
loc_1FF4B:
    cmp byte_37C24, 0
    jz short loc_1FF54
    sar ax, 1
loc_1FF54:
    mov bp, ax
    imul word_34194
    shl ax, 1
    rcl dx, 1
    mov bx, ax
    mov cx, dx
    mov ax, word_3298C
    shl ax, 1
    imul word_34274
    shl ax, 1
    rcl dx, 1
    mov si, ax
    mov di, dx
    sub ax, bx
    sbb dx, cx
    shl ax, 1
    adc dx, word_3298C
    mov word_3755D, dx
    add bx, si
    adc cx, di
    shl bx, 1
    adc cx, 0
    mov dx, word_3298C
    sub dx, cx
    mov word_3755F, dx
    mov ax, bp
    imul word_34274
    shl ax, 1
    rcl dx, 1
    mov si, ax
    mov di, dx
    mov ax, word_3298C
    shl ax, 1
    imul word_34194
    shl ax, 1
    rcl dx, 1
    mov bx, ax
    mov cx, dx
    sub ax, si
    sbb dx, di
    shl ax, 1
    adc dx, 0
    mov ax, dx
    sar ax, 1
    sar ax, 1
    sub dx, ax
    add dx, word_3298E
    mov word_37563, dx
    add si, bx
    adc di, cx
    shl si, 1
    adc di, 0
    mov si, di
    sar si, 1
    sar si, 1
    sub di, si
    mov dx, word_3298E
    sub dx, di
    mov word_37561, dx
    mov word_34198, 0
    mov ah, byte_34196
    call far ptr sub_3380E
sub_1FEFE endp
; ------------------------------seg001:0x771------------------------------
    call sub_21720
    call sub_21536
    jnb short loc_20042
loc_1FFFE:
    cmp word_3426E, 0
    js short loc_20018
    mov ah, byte_34197
    call far ptr sub_3380E
    cmp byte ptr word_38FDC, 2
    jnz short loc_20018
    jmp loc_200FE
loc_20018:
    sub si, si
    mov di, si
    mov dx, word_37559
    call sub_21756
    mov si, word_37557
    sub di, di
    mov dx, word_37559
    call sub_21756
    mov ax, word_378D9
    mov cx, word_378DB
    mov bx, 4CB5h
    call far ptr sub_33827
    jmp loc_200FE
loc_20042:
    mov ax, word_37561
    cmp ax, word_37563
    jnz short loc_20055
    or ax, ax
    jz short loc_1FFFE
    cmp ax, word_37559
    jz short loc_1FFFE
loc_20055:
    push word_3755D
    push word_37561
    push word_3755F
    push word_37563
    call sub_218A8
    pop word_37563
    pop word_3755F
    pop word_37561
    pop word_3755D
    sub ax, ax
    mov si, word_34198
    xor si, word_34194
    jns short loc_20087
    mov ax, word_37557
loc_20087:
    mov word_34192, ax
    sub bx, bx
    mov bp, word_37559
    mov si, word_34198
    xor si, word_34274
    jns short loc_2009C
    xchg bx, bp
loc_2009C:
    mov si, word_3755D
    mov di, word_37561
    cmp di, bx
    jz short loc_200B7
    cmp di, bp
    jnz short loc_200B2
    mov di, bp
    mov si, word_34192
loc_200B2:
    mov dx, bx
    call sub_21756
loc_200B7:
    mov si, word_3755F
    mov di, word_37563
    cmp di, bx
    jz short loc_200D2
    cmp di, bp
    jnz short loc_200CD
    mov di, bp
    mov si, word_34192
loc_200CD:
    mov dx, bx
    call sub_21756
loc_200D2:
    mov ax, word_378D9
    mov cx, word_378DB
    mov bx, 4CB5h
    call far ptr sub_33827
    cmp byte ptr word_38FDC, 2
    jz short loc_200FE
    xor word_34198, 0FFFFh
    jz short loc_200FE
    mov ah, byte_34197
    call far ptr sub_3380E
    call sub_21720
    jmp loc_20055
loc_200FE:
    call far ptr sub_33818
    retn
; ------------------------------seg001:0x884------------------------------
sub_20104 proc far
    arg_0 = dword ptr 6
    arg_4 = word ptr 0Ah
    arg_6 = word ptr 0Ch
    arg_8 = word ptr 0Eh
    arg_A = word ptr 10h
    arg_C = word ptr 12h
    arg_E = word ptr 14h
    push bp
    mov bp, sp
    push si
    push di
    mov ax, [bp+arg_4]
    mov word_34246, ax
    mov ax, [bp+arg_6]
    mov word_34248, ax
    mov ax, [bp+arg_8]
    mov word_3424A, ax
    les si, [bp+arg_0]
    mov word ptr dword_3423C, si
    mov word ptr dword_3423C+2, es
    lods byte ptr es:[si]
    mov byte ptr word_34262, al
    mov bx, [bp+arg_C]
    sub bx, word_34266
    mov word_34242, bx
    mov cx, [bp+arg_E]
    sub cx, word_34268
    mov word_34244, cx
    mov bp, [bp+arg_A]
    sub bp, word_34264
    mov word_34240, bp
    call sub_20188
    jnz short loc_20184
    call sub_20289
    cmp si, 1
    jnz short loc_20160
    cmp word_38FDC, 2
    jnz short loc_20184
loc_20160:
    mov cl, al
    and al, 60h
    cmp al, 60h
    jnz short loc_2016B
    call sub_202B6
loc_2016B:
    test cl, 40h
    jnz short loc_2017B
    mov ax, word_34268
    neg ax
    cmp ax, word_34244
    jz short loc_20181
loc_2017B:
    call sub_20300
    jmp short loc_20184
    db 90h
loc_20181:
    call sub_20467
loc_20184:
    pop di
    pop si
    pop bp
    retf
sub_20104 endp
; ------------------------------seg001:0x907------------------------------
; ------------------------------seg001:0x908------------------------------
sub_20188 proc near
    push si
    mov ax, word_34282
    imul bx
    mov di, dx
    mov si, ax
    mov ax, word_3427C
    imul cx
    add si, ax
    adc di, dx
    mov ax, word_34276
    imul bp
    add si, ax
    adc di, dx
    shl si, 1
    rcl di, 1
    mov word_3424C, si
    mov word_3424E, di
    mov ax, word_34284
    imul bx
    mov di, dx
    mov si, ax
    mov ax, word_3427E
    imul cx
    add si, ax
    adc di, dx
    mov ax, word_34278
    imul bp
    add si, ax
    adc di, dx
    shl si, 1
    rcl di, 1
    mov word_34250, si
    mov word_34252, di
    mov ax, word_34286
    imul bx
    mov di, dx
    mov si, ax
    mov ax, word_34280
    imul cx
    add si, ax
    adc di, dx
    mov ax, word_3427A
    imul bp
    add si, ax
    adc di, dx
    shl si, 1
    rcl di, 1
    mov word_34254, si
    mov word_34256, di
    cmp di, word_341BC
    jg short loc_20282
    mov bx, word_34262
    shl bx, 1
    cmp di, [bx+191Ch]
    jl short loc_20282
    mov si, word_3C69C
    mov bp, word_3C6A2
    add si, bx
    add bp, bx
    mov cl, byte_37C24
    xor cl, 1
    mov ax, di
    cwd
    xor ax, dx
    sub ax, dx
    mov di, ax
    add ax, [si]
    sar ax, cl
    mov si, ax
    sar si, 1
    sar si, 1
    add si, ax
    mov ax, word_3424E
    cwd
    xor ax, dx
    sub ax, dx
    cmp ax, si
    jg short loc_20282
    mov si, ax
    mov ax, di
    add ax, [bp+0]
    sar ax, cl
    mov bx, ax
    cmp byte ptr word_330C2, 0
    jz short loc_20260
    sar bx, 1
    sar bx, 1
    sar bx, 1
    add bx, ax
    sar bx, 1
loc_20260:
    mov ax, word_34252
    cwd
    xor ax, dx
    sub ax, dx
    cmp ax, bx
    jg short loc_20282
    add si, ax
    sar si, 1
    sar si, 1
    add si, di
    mov word_34260, si
    cmp si, word_341BC
    jg short loc_20282
    sub ax, ax
    pop si
    retn
loc_20282:
    mov ax, 1
    or ax, ax
    pop si
    retn
sub_20188 endp
; ------------------------------seg001:0xa08------------------------------
; ------------------------------seg001:0xa09------------------------------
sub_20289 proc near
    mov al, es:[si]
    test al, 80h
    jz short locret_202B1
    db 25h ;and ax, 7
    dw 7
    shl ax, 1
    mov bx, ax
    mov ax, word_34260
    mov cl, byte_3850E
    sar ax, cl
    cmp ax, [bx+18FCh]
    jle short loc_202AC
    add si, es:[si+1]
    jmp short sub_20289
loc_202AC:
    add si, 3
    jmp short sub_20289
locret_202B1:
    retn
sub_20289 endp
; ------------------------------seg001:0xa31------------------------------
    les si, dword_3423C
; ------------------------------seg001:0xa36------------------------------
sub_202B6 proc near
    lods byte ptr es:[si]
    db 25h ;and ax, 3
    dw 3
    shl ax, 1
    mov bx, ax
    mov ax, word_342BA
    mov [bx+1994h], ax
    retn
sub_202B6 endp
; ------------------------------seg001:0xa46------------------------------
; ------------------------------seg001:0xa47------------------------------
sub_202C7 proc far
    arg_0 = word ptr 6
    arg_2 = word ptr 8
    arg_4 = word ptr 0Ah
    push bp
    mov bp, sp
    push di
    mov cx, [bp+arg_4]
    mov bx, [bp+arg_2]
    mov bp, [bp+arg_0]
    call sub_20188
    pop di
    pop bp
    retf
sub_202C7 endp
; ------------------------------seg001:0xa59------------------------------
; ------------------------------seg001:0xa5a------------------------------
sub_202DA proc far
    push si
    les si, dword_3423C
    call sub_20289
    mov word ptr dword_3423C, si
    pop si
    retf
sub_202DA endp
; ------------------------------seg001:0xa67------------------------------
    push bp
    push si
    push di
    les si, dword_3423C
    call sub_20300
    pop di
    pop si
    pop bp
    retn
; ------------------------------seg001:0xa76------------------------------
sub_202F6 proc far
    push bp
    push si
    push di
    call sub_203E0
    pop di
    pop si
    pop bp
    retf
sub_202F6 endp
; ------------------------------seg001:0xa7f------------------------------
; ------------------------------seg001:0xa80------------------------------
sub_20300 proc near
    mov word ptr dword_3423C, si
    mov word ptr dword_3423C+2, es
    mov ax, ds
    mov es, ax
    assume es:dseg
    mov ax, word_342AC
    db 3Dh ;cmp ax, 23h
    dw 23h
    jl short loc_2032C
    mov bx, word_35AF8
    mov cx, 22h
    mov si, 324Ah
    mov di, 3248h
    rep movsw
    mov di, bx
    dec ax
    mov word_342AC, ax
    jmp short loc_20335
    nop
loc_2032C:
    mov di, 2DE8h
    mov cl, 5
    shl ax, cl
    add di, ax
loc_20335:
    mov ax, word_34254
    mov dx, word_34256
    mov cx, word_3C16C
    mov bx, cx
    shl cx, 1
    neg cx
    add cx, 8
    jz short loc_20351
loc_2034B:
    sar dx, 1
    rcr ax, 1
    loop loc_2034B
loc_20351:
    cmp bx, 2
    jnz short loc_20360
    cmp word_34262, 5
    jnz short loc_20360
    add dx, 20h
loc_20360:
    mov bp, di
    push ax
    push dx
    stosw
    mov ax, dx
    stosw
    mov ax, word ptr dword_3423C
    stosw
    mov ax, word ptr dword_3423C+2
    stosw
    mov ax, word_34240
    stosw
    mov ax, word_34242
    stosw
    mov ax, word_34244
    stosw
    mov ax, word_34246
    stosw
    mov ax, word_34248
    stosw
    mov ax, word_3424A
    stosw
    mov ax, word_3424C
    stosw
    mov ax, word_3424E
    stosw
    mov ax, word_34250
    stosw
    mov ax, word_34252
    stosw
    mov ax, word_34254
    stosw
    mov ax, word_34256
    stosw
    pop dx
    pop ax
    mov bx, word_342AC
    shl bx, 1
    mov cx, bx
loc_203AA:
    sub bx, 2
    js short loc_203BE
    mov di, [bx+3248h]
    cmp dx, [di+2]
    jg short loc_203AA
    jl short loc_203BE
    cmp ax, [di]
    ja short loc_203AA
loc_203BE:
    sub cx, 2
    mov di, cx
    add di, 324Ah
    mov si, cx
    add si, 3248h
    sub cx, bx
    jle short loc_203D9
    shr cx, 1
    cli
    std
    rep movsw
    cld
    sti
loc_203D9:
    mov [di], bp
    inc word_342AC
    retn
sub_20300 endp
; ------------------------------seg001:0xb5f------------------------------
; ------------------------------seg001:0xb60------------------------------
sub_203E0 proc near
    cmp word_342AC, 0
    jz short locret_2043B
    mov si, 3246h
loc_203EA:
    add si, 2
    push si
    mov si, [si]
    add si, 4
    lodsw
    mov word ptr dword_3423C, ax
    lodsw
    mov word ptr dword_3423C+2, ax
    lodsw
    mov word_34240, ax
    lodsw
    mov word_34242, ax
    lodsw
    mov word_34244, ax
    lodsw
    mov word_34246, ax
    lodsw
    mov word_34248, ax
    lodsw
    mov word_3424A, ax
    lodsw
    mov word_3424C, ax
    lodsw
    mov word_3424E, ax
    lodsw
    mov word_34250, ax
    lodsw
    mov word_34252, ax
    lodsw
    mov word_34254, ax
    lodsw
    mov word_34256, ax
    les si, dword_3423C
    assume es:nothing
    call sub_20467
    pop si
    dec word_342AC
    jz short locret_2043B
    jmp short loc_203EA
locret_2043B:
    retn
sub_203E0 endp
; ------------------------------seg001:0xbbb------------------------------
    push bp
    push si
    push di
    les si, dword_3423C
    call sub_20467
    pop di
    pop si
    pop bp
    retn
; ------------------------------seg001:0xbca------------------------------
sub_2044A proc far
    push bp
    push si
    push di
    mov cx, word_34244
    mov ax, word_34242
    mov bp, word_34240
    les si, dword_3423C
    call sub_20534
    mov word ptr dword_3423C, si
    pop di
    pop si
    pop bp
    retf
sub_2044A endp
; ------------------------------seg001:0xbe6------------------------------
; ------------------------------seg001:0xbe7------------------------------
sub_20467 proc near
    mov ah, byte_32933
    or ah, ah
    jz short loc_20496
    mov al, byte ptr word_34256+1
    cbw
    not ah
    and al, ah
    sub ah, ah
    shr ax, 1
    mov ah, al
    sub ah, 0
    jns short loc_20484
    sub ah, ah
loc_20484:
    cmp ah, 7
    jle short loc_2048B
    mov ah, 7
loc_2048B:
    shl ah, 1
    shl ah, 1
    shl ah, 1
    shl ah, 1
    add ah, 80h
loc_20496:
    mov byte_3419A, ah
    mov al, es:[si]
    and al, 3Fh
    cmp al, 3Eh
    jl short loc_204AB
    jz short loc_204A8
    jmp loc_2120A
loc_204A8:
    jmp loc_21374
loc_204AB:
    mov ax, word_34246
    or ax, word_34248
    or ax, word_3424A
    or al, ah
    mov byte_34258, al
    jz short loc_204E0
    push si
    mov di, 19D8h
    mov cx, word_34246
    mov si, word_34248
    mov bp, word_3424A
    call sub_20CFB
    mov bx, 19D8h
    mov si, 19C6h
    mov di, 19EAh
    call sub_20E4D
    pop si
    jmp short loc_20516
    nop
loc_204E0:
    mov ax, word_34276
    mov word_3429A, ax
    mov ax, word_34278
    mov word_3429C, ax
    mov ax, word_3427A
    mov word_3429E, ax
    mov ax, word_3427C
    mov word_342A0, ax
    mov ax, word_3427E
    mov word_342A2, ax
    mov ax, word_34280
    mov word_342A4, ax
    mov ax, word_34282
    mov word_342A6, ax
    mov ax, word_34284
    mov word_342A8, ax
    mov ax, word_34286
    mov word_342AA, ax
loc_20516:
    mov cx, word_34244
    mov ax, word_34242
    mov bp, word_34240
    call sub_20534
    call sub_1F993
    call sub_20970
    call sub_20A58
    call sub_20FEA
    call sub_1F9B7
    retn
sub_20467 endp
; ------------------------------seg001:0xcb3------------------------------
; ------------------------------seg001:0xcb4------------------------------
sub_20534 proc near
    neg bp
    neg ax
    neg cx
    cmp byte_34258, 0
    jnz short loc_2054F
    mov word_36B7E, bp
    mov word_36B80, cx
    mov word_36B82, ax
    jmp loc_205DE
loc_2054F:
    mov word_36B84, ax
    call sub_20E19
    push si
    mov ax, word_36B84
    imul word_34294
    mov di, dx
    mov si, ax
    mov ax, cx
    imul word_3428E
    add si, ax
    adc di, dx
    mov ax, bp
    imul word_34288
    add si, ax
    adc di, dx
    shl si, 1
    rcl di, 1
    shl si, 1
    adc di, 0
    mov word_36B7E, di
    mov ax, word_36B84
    imul word_34296
    mov di, dx
    mov si, ax
    mov ax, cx
    imul word_34290
    add si, ax
    adc di, dx
    mov ax, bp
    imul word_3428A
    add si, ax
    adc di, dx
    shl si, 1
    rcl di, 1
    shl si, 1
    adc di, 0
    mov word_36B80, di
    mov ax, word_36B84
    imul word_34298
    mov di, dx
    mov si, ax
    mov ax, cx
    imul word_34292
    add si, ax
    adc di, dx
    mov ax, bp
    imul word_3428C
    add si, ax
    adc di, dx
    shl si, 1
    rcl di, 1
    shl si, 1
    adc di, 0
    mov word_36B82, di
    pop si
    call sub_20E19
loc_205DE:
    lods byte ptr es:[si]
    db 25h ;and ax, 1Fh
    dw 1Fh
    mov word_342B0, ax
    mov cx, ax
    sub ax, ax
    cmp cx, 10h
    jle short loc_205F0
    inc ax
loc_205F0:
    mov byte_342B4, al
    mov word_342B6, 0FFFFh
    mov word_342B8, 0FFFFh
    or cx, cx
    jz short loc_20647
    mov bx, 1
    sub di, di
loc_20608:
    push bx
    lods word ptr es:[si]
    imul word_36B7E
    mov bp, ax
    mov bx, dx
    lods word ptr es:[si]
    imul word_36B82
    add bp, ax
    adc bx, dx
    lods word ptr es:[si]
    imul word_36B80
    add bp, ax
    adc bx, dx
    lods word ptr es:[si]
    cwd
    cmp bx, dx
    pop bx
    jg short loc_2063F
    jl short loc_20635
    cmp bp, ax
    jnb short loc_2063F
loc_20635:
    xor word_342B6, bx
    xor word_342B8, di
    inc ch
loc_2063F:
    shl bx, 1
    rcl di, 1
    dec cl
    jnz short loc_20608
loc_20647:
    mov al, byte ptr word_342B0
    cmp al, 4
    jl short locret_20656
    cmp al, ch
    jnz short locret_20656
    inc word_36B86
locret_20656:
    retn
sub_20534 endp
; ------------------------------seg001:0xdd6------------------------------
    retn
; ------------------------------seg001:0xdd8------------------------------
sub_20658 proc far
    push bp
    push si
    push di
    call sub_20674
    pop di
    pop si
    pop bp
    retf
sub_20658 endp
; ------------------------------seg001:0xde1------------------------------
    push bp
    push si
    push di
    les si, dword_3423C
    call sub_20970
    mov word ptr dword_3423C, si
    pop di
    pop si
    pop bp
    retn
; ------------------------------seg001:0xdf4------------------------------
sub_20674 proc near
    cmp word_33E16, 0
    jnz short loc_2067C
    retn
loc_2067C:
    mov bx, word_33E10
    dec bx
    shl bx, 1
    mov di, bx
    shl di, 1
loc_20687:
    mov cx, [bx-6AB4h]
    mov ax, word_34276
    imul cx
    shl ax, 1
    rcl dx, 1
    mov [di+2A88h], ax
    mov [di+2A8Ah], dx
    mov ax, word_34278
    imul cx
    shl ax, 1
    rcl dx, 1
    mov [di+2B08h], ax
    mov [di+2B0Ah], dx
    mov ax, word_3427A
    imul cx
    shl ax, 1
    rcl dx, 1
    mov [di+2B88h], ax
    mov [di+2B8Ah], dx
    sub di, 4
    sub bx, 2
    jns short loc_20687
    mov bx, word_33E14
    dec bx
    shl bx, 1
    mov di, bx
    shl di, 1
loc_206D1:
    mov cx, [bx-6A30h]
    mov ax, word_3427C
    imul cx
    shl ax, 1
    rcl dx, 1
    mov [di+2C08h], ax
    mov [di+2C0Ah], dx
    mov ax, word_3427E
    imul cx
    shl ax, 1
    rcl dx, 1
    mov [di+2C28h], ax
    mov [di+2C2Ah], dx
    mov ax, word_34280
    imul cx
    shl ax, 1
    rcl dx, 1
    mov [di+2C48h], ax
    mov [di+2C4Ah], dx
    sub di, 4
    sub bx, 2
    jns short loc_206D1
    mov bx, word_33E12
    dec bx
    shl bx, 1
    mov di, bx
    shl di, 1
loc_2071B:
    mov cx, [bx-6A72h]
    mov ax, word_34282
    imul cx
    shl ax, 1
    rcl dx, 1
    mov [di+2C68h], ax
    mov [di+2C6Ah], dx
    mov ax, word_34284
    imul cx
    shl ax, 1
    rcl dx, 1
    mov [di+2CE8h], ax
    mov [di+2CEAh], dx
    mov ax, word_34286
    imul cx
    shl ax, 1
    rcl dx, 1
    mov [di+2D68h], ax
    mov [di+2D6Ah], dx
    sub di, 4
    sub bx, 2
    jns short loc_2071B
    mov si, word_33E16
    dec si
loc_2075F:
    mov bx, [si-79A2h]
    and bx, 0FFh
    shl bx, 1
    shl bx, 1
    mov di, [si-7802h]
    and di, 0FFh
    shl di, 1
    shl di, 1
    mov bp, [si-7748h]
    and bp, 0FFh
    shl bp, 1
    shl bp, 1
    les ax, [bx+2A88h]
    mov dx, es
    les cx, [bp+2C08h]
    add ax, cx
    mov cx, es
    adc dx, cx
    les cx, [di+2C68h]
    add ax, cx
    mov cx, es
    adc dx, cx
    shl si, 1
    shl si, 1
    mov [si+2380h], ax
    mov [si+2382h], dx
    les ax, [bx+2B08h]
    mov dx, es
    les cx, [bp+2C28h]
    add ax, cx
    mov cx, es
    adc dx, cx
    les cx, [di+2CE8h]
    add ax, cx
    mov cx, es
    adc dx, cx
    mov [si+25D8h], ax
    mov [si+25DAh], dx
    les ax, [bx+2B88h]
    mov dx, es
    les cx, [bp+2C48h]
    add ax, cx
    mov cx, es
    adc dx, cx
    les cx, [di+2D68h]
    add ax, cx
    mov cx, es
    adc dx, cx
    mov [si+2830h], ax
    mov [si+2832h], dx
    shr si, 1
    shr si, 1
    dec si
    js short locret_207F7
    jmp loc_2075F
locret_207F7:
    retn
sub_20674 endp
; ------------------------------seg001:0xf77------------------------------
loc_207F8:
    mov bl, al
    and bx, 7Fh
    shl bx, 1
    shl bx, 1
    mov word_36B89, bx
    mov bx, 0FFFCh
loc_20808:
    add bx, 4
    cmp bx, word_36B89
    jl short loc_20812
    retn
loc_20812:
    call sub_21422
    inc si
    or ax, ax
    jz short loc_20808
    mov bp, es:[si-1]
    and bp, 0FFh
    mov al, [bp-7748h]
    sub ah, ah
    shl ax, 1
    mov bp, ax
    mov cx, [bp-6A30h]
    mov bp, es:[si-1]
    and bp, 0FFh
    mov al, [bp-7802h]
    sub ah, ah
    shl ax, 1
    mov bp, ax
    mov ax, [bp-6A72h]
    mov word_36B8B, ax
    mov bp, es:[si-1]
    and bp, 0FFh
    mov al, [bp-79A2h]
    sub ah, ah
    shl ax, 1
    mov bp, ax
    mov bp, [bp-6AB4h]
    push si
    mov ax, word_36B8B
    imul word_342A6
    mov di, dx
    mov si, ax
    mov ax, word_342A0
    imul cx
    add si, ax
    adc di, dx
    mov ax, word_3429A
    imul bp
    add si, ax
    adc di, dx
    shl si, 1
    rcl di, 1
    add si, word_3424C
    adc di, word_3424E
    mov [bx+1A0Ch], si
    mov [bx+1A0Eh], di
    mov ax, word_36B8B
    imul word_342A8
    mov di, dx
    mov si, ax
    mov ax, word_342A2
    imul cx
    add si, ax
    adc di, dx
    mov ax, word_3429C
    imul bp
    add si, ax
    adc di, dx
    shl si, 1
    rcl di, 1
    add si, word_34250
    adc di, word_34252
    mov [bx+1BF0h], si
    mov [bx+1BF2h], di
    mov ax, word_36B8B
    imul word_342AA
    mov di, dx
    mov si, ax
    mov ax, word_342A4
    imul cx
    add si, ax
    adc di, dx
    mov ax, word_3429E
    imul bp
    add si, ax
    adc di, dx
    shl si, 1
    rcl di, 1
    add si, word_34254
    adc di, word_34256
    mov [bx+1DD4h], si
    mov [bx+1DD6h], di
    call sub_1F8F8
    pop si
    jmp loc_20808
loc_208FA:
    jmp loc_207F8
loc_208FD:
    cmp byte_36B88, 0
    jnz short loc_208FA
    mov cl, al
    and cx, 7Fh
    sub bx, bx
loc_2090B:
    call sub_21422
    jnz short loc_20917
    inc si
    add bx, 4
    loop loc_2090B
    retn
loc_20917:
    lods byte ptr es:[si]
    sub ah, ah
    shl ax, 1
    shl ax, 1
    mov di, ax
    mov ax, word_3424C
    add ax, [di+2380h]
    mov [bx+1A0Ch], ax
    mov ax, word_3424E
    adc ax, [di+2382h]
    mov [bx+1A0Eh], ax
    mov ax, word_34250
    add ax, [di+25D8h]
    mov [bx+1BF0h], ax
    mov ax, word_34252
    adc ax, [di+25DAh]
    mov [bx+1BF2h], ax
    mov ax, word_34254
    add ax, [di+2830h]
    mov [bx+1DD4h], ax
    mov ax, word_34256
    adc ax, [di+2832h]
    mov [bx+1DD6h], ax
    push cx
    push si
    call sub_1F8F8
    pop si
    pop cx
    add bx, 4
    loop loc_2090B
    retn
; ------------------------------seg001:0x10f0------------------------------
sub_20970 proc near
    lods byte ptr es:[si]
    test al, 80h
    jnz short loc_208FD
    test al, 7Fh
    jz short locret_20993
    mov bl, al
    and bx, 7Fh
    shl bx, 1
    shl bx, 1
    mov word_36B89, bx
    mov bx, 0FFFCh
loc_2098A:
    add bx, 4
    cmp bx, word_36B89
    jl short loc_20994
locret_20993:
    retn
loc_20994:
    call sub_21422
    add si, 6
    or ax, ax
    jz short loc_2098A
    mov bp, es:[si-6]
    mov cx, es:[si-2]
    mov ax, es:[si-4]
    mov word_36B8B, ax
    push si
    imul word_342A6
    mov di, dx
    mov si, ax
    mov ax, word_342A0
    imul cx
    add si, ax
    adc di, dx
    mov ax, word_3429A
    imul bp
    add si, ax
    adc di, dx
    shl si, 1
    rcl di, 1
    add si, word_3424C
    adc di, word_3424E
    mov [bx+1A0Ch], si
    mov [bx+1A0Eh], di
    mov ax, word_36B8B
    imul word_342A8
    mov di, dx
    mov si, ax
    mov ax, word_342A2
    imul cx
    add si, ax
    adc di, dx
    mov ax, word_3429C
    imul bp
    add si, ax
    adc di, dx
    shl si, 1
    rcl di, 1
    add si, word_34250
    adc di, word_34252
    mov [bx+1BF0h], si
    mov [bx+1BF2h], di
    mov ax, word_36B8B
    imul word_342AA
    mov di, dx
    mov si, ax
    mov ax, word_342A4
    imul cx
    add si, ax
    adc di, dx
    mov ax, word_3429E
    imul bp
    add si, ax
    adc di, dx
    shl si, 1
    rcl di, 1
    add si, word_34254
    adc di, word_34256
    mov [bx+1DD4h], si
    mov [bx+1DD6h], di
    call sub_1F8F8
    pop si
    jmp loc_2098A
sub_20970 endp
; ------------------------------seg001:0x11c2------------------------------
    nop
; ------------------------------seg001:0x11c6------------------------------
sub_20A46 proc far
    push bp
    push si
    push di
    les si, dword_3423C
    call sub_20A58
    mov word ptr dword_3423C, si
    pop di
    pop si
    pop bp
    retf
sub_20A46 endp
; ------------------------------seg001:0x11d7------------------------------
; ------------------------------seg001:0x11d8------------------------------
sub_20A58 proc near
    sub ah, ah
    lods byte ptr es:[si]
    or ax, ax
    jz short locret_20A75
    mov cx, ax
    sub di, di
    add di, 328Eh
loc_20A68:
    call sub_21422
    jnz short loc_20A76
    add si, 2
    add di, 1Ah
    loop loc_20A68
locret_20A75:
    retn
loc_20A76:
    sub ah, ah
    lods byte ptr es:[si]
    mov bx, ax
    shl bx, 1
    shl bx, 1
    lods byte ptr es:[si]
    mov bp, ax
    shl bp, 1
    shl bp, 1
    mov byte ptr [di+18h], 0
    cmp word ptr [bx+1DD6h], 1
    jl short loc_20AC0
    cmp word ptr [bp+1DD6h], 1
    jl short loc_20AB8
    mov ax, [bx+1FB8h]
    mov [di], ax
    mov ax, [bx+1FBAh]
    mov [di+2], ax
    mov ax, [bx+219Ch]
    mov [di+4], ax
    mov ax, [bx+219Eh]
    mov [di+6], ax
    jmp short loc_20AD1
    nop
loc_20AB8:
    xchg bp, bx
    call sub_20B02
    jmp short loc_20AD1
    nop
loc_20AC0:
    cmp word ptr [bp+1DD6h], 1
    jge short loc_20ACE
    or byte ptr [di+18h], 80h
    jmp short loc_20AF8
    nop
loc_20ACE:
    call sub_20B02
loc_20AD1:
    mov ax, [bp+1FB8h]
    mov [di+8], ax
    mov ax, [bp+1FBAh]
    mov [di+0Ah], ax
    mov ax, [bp+219Ch]
    mov [di+0Ch], ax
    mov ax, [bp+219Eh]
    mov [di+0Eh], ax
    push cx
    push si
    call sub_1F9DD
    mov es, word ptr dword_3423C+2
    pop si
    pop cx
loc_20AF8:
    add di, 1Ah
    dec cx
    jz short locret_20B01
    jmp loc_20A68
locret_20B01:
    retn
sub_20A58 endp
; ------------------------------seg001:0x1281------------------------------
; ------------------------------seg001:0x1282------------------------------
sub_20B02 proc near
    push es
    push cx
    push si
    push di
    mov ax, [bp+1DD4h]
    mov dx, [bp+1DD6h]
    mov cx, dx
    sub cx, [bx+1DD6h]
    dec dx
    div cx
    shr ax, 1
    mov cx, ax
    mov dx, [bp+1A0Ch]
    mov ax, [bp+1A0Eh]
    mov si, dx
    mov di, ax
    sub dx, [bx+1A0Ch]
    sbb ax, [bx+1A0Eh]
    shl dx, 1
    adc ax, 0
    imul cx
    shl ax, 1
    rcl dx, 1
    sub si, ax
    sbb di, dx
    mov word_3449C, si
    mov word_3449E, di
    mov dx, [bp+1BF0h]
    mov ax, [bp+1BF2h]
    mov si, dx
    mov di, ax
    sub dx, [bx+1BF0h]
    sbb ax, [bx+1BF2h]
    shl dx, 1
    adc ax, 0
    imul cx
    shl ax, 1
    rcl dx, 1
    sub si, ax
    sbb di, dx
    mov word_34680, si
    mov word_34682, di
    mov word_34864, 0
    mov word_34866, 1
    push bx
    mov bx, 1E0h
    call sub_1F8F8
    pop bx
    pop di
    les ax, dword_34A48
    mov [di], ax
    mov word ptr [di+2], es
    mov [di+10h], ax
    mov word ptr [di+12h], es
    les ax, dword_34C2C
    mov [di+4], ax
    mov word ptr [di+6], es
    mov [di+14h], ax
    mov word ptr [di+16h], es
    or word ptr [di+18h], 40h
    pop si
    pop cx
    pop es
    retn
sub_20B02 endp
; ------------------------------seg001:0x132c------------------------------
    nop
; ------------------------------seg001:0x132e------------------------------
sub_20BAE proc far
    arg_0 = word ptr 6
    arg_2 = word ptr 8
    arg_4 = word ptr 0Ah
    arg_6 = word ptr 0Ch
    push bp
    mov bp, sp
    push si
    push di
    mov di, [bp+arg_0]
    mov cx, [bp+arg_2]
    mov si, [bp+arg_4]
    mov bp, [bp+arg_6]
    call sub_20BDF
    pop di
    pop si
    pop bp
    retf
sub_20BAE endp
; ------------------------------seg001:0x1345------------------------------
    push bp
    push si
    push di
    mov di, 19D8h
    mov cx, word_34246
    mov si, word_34248
    mov bp, word_3424A
    call sub_20CFB
    pop di
    pop si
    pop bp
    retn
; ------------------------------seg001:0x135f------------------------------
sub_20BDF proc near
    mov bx, cx
    call sub_13BC1
    mov word_3426A, bx
    mov bx, cx
    call sub_13BC5
    mov word_3426C, bx
    mov bx, bp
    call sub_13BC1
    mov word_34272, bx
    mov bx, bp
    call sub_13BC5
    mov word_34274, bx
    mov bx, si
    call sub_13BC1
    mov word_3426E, bx
    mov bx, si
    call sub_13BC5
    mov word_34270, bx
    mov ax, word_3426E
    imul word_34272
    shl ax, 1
    rcl dx, 1
    mov si, dx
    mov ax, dx
    imul word_3426A
    shl ax, 1
    rcl dx, 1
    mov bx, ax
    mov cx, dx
    mov ax, word_3426C
    imul word_34274
    shl ax, 1
    rcl dx, 1
    add ax, bx
    adc dx, cx
    mov [di], dx
    mov ax, word_3426E
    imul word_34274
    shl ax, 1
    rcl dx, 1
    mov bp, dx
    mov ax, dx
    imul word_3426A
    shl ax, 1
    rcl dx, 1
    mov bx, ax
    mov cx, dx
    mov ax, word_3426C
    imul word_34272
    shl ax, 1
    rcl dx, 1
    sub bx, ax
    sbb cx, dx
    mov [di+2], cx
    mov ax, word_3426A
    imul word_34270
    shl ax, 1
    rcl dx, 1
    mov [di+4], dx
    mov ax, word_34272
    imul word_34270
    shl ax, 1
    rcl dx, 1
    mov [di+6], dx
    mov ax, word_34274
    imul word_34270
    shl ax, 1
    rcl dx, 1
    mov [di+8], dx
    mov ax, word_3426E
    neg ax
    mov [di+0Ah], ax
    mov ax, si
    imul word_3426C
    shl ax, 1
    rcl dx, 1
    mov bx, ax
    mov cx, dx
    mov ax, word_3426A
    imul word_34274
    shl ax, 1
    rcl dx, 1
    sub bx, ax
    sbb cx, dx
    mov [di+0Ch], cx
    mov ax, bp
    imul word_3426C
    shl ax, 1
    rcl dx, 1
    mov bx, ax
    mov cx, dx
    mov ax, word_3426A
    imul word_34272
    shl ax, 1
    rcl dx, 1
    add ax, bx
    adc dx, cx
    mov [di+0Eh], dx
    mov ax, word_3426C
    imul word_34270
    shl ax, 1
    rcl dx, 1
    mov [di+10h], dx
    retn
sub_20BDF endp
; ------------------------------seg001:0x147a------------------------------
; ------------------------------seg001:0x147b------------------------------
sub_20CFB proc near
    mov bx, cx
    call sub_13BC1
    mov word_3426A, bx
    mov bx, cx
    call sub_13BC5
    mov word_3426C, bx
    mov bx, bp
    call sub_13BC1
    mov word_34272, bx
    mov bx, bp
    call sub_13BC5
    mov word_34274, bx
    mov bx, si
    call sub_13BC1
    mov word_3426E, bx
    mov bx, si
    call sub_13BC5
    mov word_34270, bx
    mov ax, word_3426E
    imul word_34272
    shl ax, 1
    rcl dx, 1
    mov si, dx
    mov ax, dx
    imul word_3426A
    shl ax, 1
    rcl dx, 1
    mov bx, ax
    mov cx, dx
    mov ax, word_3426C
    imul word_34274
    shl ax, 1
    rcl dx, 1
    sub ax, bx
    sbb dx, cx
    mov [di], dx
    mov ax, word_3426E
    imul word_34274
    shl ax, 1
    rcl dx, 1
    mov bp, dx
    mov ax, dx
    imul word_3426A
    shl ax, 1
    rcl dx, 1
    mov bx, ax
    mov cx, dx
    mov ax, word_3426C
    imul word_34272
    shl ax, 1
    rcl dx, 1
    add bx, ax
    adc cx, dx
    mov [di+6], cx
    mov ax, word_3426A
    imul word_34270
    shl ax, 1
    rcl dx, 1
    neg dx
    mov [di+0Ch], dx
    mov ax, word_34272
    imul word_34270
    shl ax, 1
    rcl dx, 1
    neg dx
    mov [di+2], dx
    mov ax, word_34274
    imul word_34270
    shl ax, 1
    rcl dx, 1
    mov [di+8], dx
    mov ax, word_3426E
    mov [di+0Eh], ax
    mov ax, si
    imul word_3426C
    shl ax, 1
    rcl dx, 1
    mov bx, ax
    mov cx, dx
    mov ax, word_3426A
    imul word_34274
    shl ax, 1
    rcl dx, 1
    add bx, ax
    adc cx, dx
    mov [di+4], cx
    mov ax, bp
    imul word_3426C
    shl ax, 1
    rcl dx, 1
    mov bx, ax
    mov cx, dx
    mov ax, word_3426A
    imul word_34272
    shl ax, 1
    rcl dx, 1
    sub ax, bx
    sbb dx, cx
    mov [di+0Ah], dx
    mov ax, word_3426C
    imul word_34270
    shl ax, 1
    rcl dx, 1
    mov [di+10h], dx
    retn
sub_20CFB endp
; ------------------------------seg001:0x1598------------------------------
; ------------------------------seg001:0x1599------------------------------
sub_20E19 proc near
    mov bx, 19D8h
    mov ax, [bx+2]
    xchg ax, [bx+6]
    mov [bx+2], ax
    mov ax, [bx+4]
    xchg ax, [bx+0Ch]
    mov [bx+4], ax
    mov ax, [bx+0Ah]
    xchg ax, [bx+0Eh]
    mov [bx+0Ah], ax
    retn
sub_20E19 endp
; ------------------------------seg001:0x15b7------------------------------
; ------------------------------seg001:0x15b8------------------------------
sub_20E38 proc far
    arg_0 = word ptr 6
    arg_2 = word ptr 8
    arg_4 = word ptr 0Ah
    push bp
    mov bp, sp
    push si
    push di
    mov bx, [bp+arg_0]
    mov si, [bp+arg_2]
    mov di, [bp+arg_4]
    call sub_20E4D
    pop di
    pop si
    pop bp
    retf
sub_20E38 endp
; ------------------------------seg001:0x15cc------------------------------
; ------------------------------seg001:0x15cd------------------------------
sub_20E4D proc near
    mov ax, [bx]
    imul word ptr [si]
    shl ax, 1
    rcl dx, 1
    mov bp, ax
    mov cx, dx
    mov ax, [bx+2]
    imul word ptr [si+6]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov ax, [bx+4]
    imul word ptr [si+0Ch]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov [di], cx
    mov ax, [bx]
    imul word ptr [si+2]
    shl ax, 1
    rcl dx, 1
    mov bp, ax
    mov cx, dx
    mov ax, [bx+2]
    imul word ptr [si+8]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov ax, [bx+4]
    imul word ptr [si+0Eh]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov [di+2], cx
    mov ax, [bx]
    imul word ptr [si+4]
    shl ax, 1
    rcl dx, 1
    mov bp, ax
    mov cx, dx
    mov ax, [bx+2]
    imul word ptr [si+0Ah]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov ax, [bx+4]
    imul word ptr [si+10h]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov [di+4], cx
    mov ax, [bx+6]
    imul word ptr [si]
    shl ax, 1
    rcl dx, 1
    mov bp, ax
    mov cx, dx
    mov ax, [bx+8]
    imul word ptr [si+6]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov ax, [bx+0Ah]
    imul word ptr [si+0Ch]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov [di+6], cx
    mov ax, [bx+6]
    imul word ptr [si+2]
    shl ax, 1
    rcl dx, 1
    mov bp, ax
    mov cx, dx
    mov ax, [bx+8]
    imul word ptr [si+8]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov ax, [bx+0Ah]
    imul word ptr [si+0Eh]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov [di+8], cx
    mov ax, [bx+6]
    imul word ptr [si+4]
    shl ax, 1
    rcl dx, 1
    mov bp, ax
    mov cx, dx
    mov ax, [bx+8]
    imul word ptr [si+0Ah]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov ax, [bx+0Ah]
    imul word ptr [si+10h]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov [di+0Ah], cx
    mov ax, [bx+0Ch]
    imul word ptr [si]
    shl ax, 1
    rcl dx, 1
    mov bp, ax
    mov cx, dx
    mov ax, [bx+0Eh]
    imul word ptr [si+6]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov ax, [bx+10h]
    imul word ptr [si+0Ch]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov [di+0Ch], cx
    mov ax, [bx+0Ch]
    imul word ptr [si+2]
    shl ax, 1
    rcl dx, 1
    mov bp, ax
    mov cx, dx
    mov ax, [bx+0Eh]
    imul word ptr [si+8]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov ax, [bx+10h]
    imul word ptr [si+0Eh]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov [di+0Eh], cx
    mov ax, [bx+0Ch]
    imul word ptr [si+4]
    shl ax, 1
    rcl dx, 1
    mov bp, ax
    mov cx, dx
    mov ax, [bx+0Eh]
    imul word ptr [si+0Ah]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov ax, [bx+10h]
    imul word ptr [si+10h]
    shl ax, 1
    rcl dx, 1
    add bp, ax
    adc cx, dx
    mov [di+10h], cx
    retn
sub_20E4D endp
; ------------------------------seg001:0x175b------------------------------
; ------------------------------seg001:0x175c------------------------------
sub_20FDC proc far
    push bp
    push si
    push di
    les si, dword_3423C
    call sub_20FEA
    pop di
    pop si
    pop bp
    retf
sub_20FDC endp
; ------------------------------seg001:0x1769------------------------------
; ------------------------------seg001:0x176a------------------------------
sub_20FEA proc near
    lods byte ptr es:[si]
    or al, al
    jz short locret_21000
    cmp al, 0FFh
    jz short loc_21001
    mov byte_36BAE, al
loc_20FF7:
    call sub_21075
    dec byte_36BAE
    jnz short loc_20FF7
locret_21000:
    retn
loc_21001:
    mov ax, word_342B6
    mov bp, word_342B8
    mov cx, word_342B0
    mov di, 4340h
    mov bx, di
loc_21011:
    shr bp, 1
    rcr ax, 1
    mov dl, 0FFh
    adc dl, 0
    mov [di], dl
    inc di
    loop loc_21011
    mov di, 42FFh
    push si
    call sub_1FE5C
    pop si
    mov bx, word_342B0
    mov ax, bx
    shl ax, 1
    add si, ax
    inc si
    mov word_36C10, si
    add si, ax
    mov word_36C12, si
    add si, bx
    mov word_36C14, si
    mov si, 42FFh
    lodsb
loc_21046:
    sub ah, ah
    push si
    mov di, word_36C12
    add di, ax
    mov bl, es:[di]
    mov byte_36C16, bl
    mov si, word_36C10
    shl ax, 1
    add si, ax
    mov si, es:[si]
    add si, word_36C14
loc_21065:
    call sub_21075
    dec byte_36C16
    jnz short loc_21065
    pop si
    lodsb
    cmp al, 0FFh
    jnz short loc_21046
    retn
sub_20FEA endp
; ------------------------------seg001:0x17f4------------------------------
; ------------------------------seg001:0x17f5------------------------------
sub_21075 proc near
    lods byte ptr es:[si]
    mov bl, al
    and al, 3
    cmp al, 1
    jz short loc_210CE
    call sub_21422
    jnz short loc_21088
    add si, 2
    retn
loc_21088:
    lods byte ptr es:[si]
    sub ah, ah
    shl ax, 1
    mov bx, ax
    shl bx, 1
    shl bx, 1
    mov cx, bx
    shl cx, 1
    add bx, cx
    add bx, ax
    add bx, 328Eh
    test byte ptr [bx+18h], 80h
    jz short loc_210A8
    inc si
    retn
loc_210A8:
    lods byte ptr es:[si]
    sub ah, ah
    mov di, ax
    mov ah, [di+18ECh]
    add ah, byte_3419A
    call far ptr sub_3380E
    mov cx, [bx+8]
    mov dx, [bx+0Ch]
    mov ax, [bx]
    mov bx, [bx+4]
    push si
    call far ptr sub_33809
    pop si
    retn
loc_210CE:
    lods byte ptr es:[si]
    shr bl, 1
    shr bl, 1
    mov cl, bl
    and bx, 1Eh
    mov bx, [bx+42DEh]
    test cl, 20h
    jnz short loc_210EE
    test word_342B6, bx
    jnz short loc_210F4
loc_210E8:
    sub ah, ah
    add si, ax
    inc si
    retn
loc_210EE:
    test word_342B8, bx
    jz short loc_210E8
loc_210F4:
    mov byte_36C17, al
    mov bl, al
    sub bh, bh
    mov bl, es:[bx+si]
    cmp bl, 0FFh
    jz short loc_210E8
    cmp word_33BAC, 400h
    jnz short loc_21110
    cmp bl, 1
    jnz short loc_210E8
loc_21110:
    mov di, bx
    mov ah, [di+18ECh]
    add ah, byte_3419A
    call far ptr sub_3380E
    call sub_21720
    mov es, word ptr dword_3423C+2
    mov byte_36C18, 0
loc_2112B:
    lods byte ptr es:[si]
    sub ah, ah
    shl ax, 1
    mov bx, ax
    shl bx, 1
    shl bx, 1
    mov cx, bx
    shl cx, 1
    add bx, cx
    add bx, ax
    add bx, 328Eh
    test byte ptr [bx+18h], 40h
    jz short loc_21181
    mov ax, [bx+10h]
    mov dx, [bx+12h]
    mov cx, [bx+14h]
    mov di, [bx+16h]
    cmp byte_36C18, 0
    jnz short loc_2116E
    mov word_36C19, ax
    mov word_36C1B, dx
    mov word_36C1D, cx
    mov word_36C1F, di
    jmp short loc_2117D
    nop
loc_2116E:
    mov word_36C21, ax
    mov word_36C23, dx
    mov word_36C25, cx
    mov word_36C27, di
loc_2117D:
    inc byte_36C18
loc_21181:
    push si
    call sub_211BA
    pop si
    dec byte_36C17
    jnz short loc_2112B
    inc si
    push si
    cmp byte_36C18, 2
    jl short loc_211A9
    mov byte_36C31, 0
    mov di, 4369h
    call sub_1F9DD
    mov es, word ptr dword_3423C+2
    mov bx, di
    call sub_211BA
loc_211A9:
    mov ax, word_378D9
    mov cx, word_378DB
    mov bx, 4CB5h
    call far ptr sub_33827
sub_21075 endp
; ------------------------------seg001:0x1933------------------------------
    pop si
    retn
; ------------------------------seg001:0x193a------------------------------
sub_211BA proc near
    test byte ptr [bx+18h], 80h
    jnz short loc_211DC
    mov ax, [bx]
    mov word_3755D, ax
    mov ax, [bx+4]
    mov word_37561, ax
    mov ax, [bx+8]
    mov word_3755F, ax
    mov ax, [bx+0Ch]
    mov word_37563, ax
    push bx
    call sub_217B4
    pop bx
loc_211DC:
    test byte ptr [bx+18h], 20h
    jz short loc_211F3
    mov si, [bx]
    mov di, [bx+4]
    mov dx, [bx+6]
    push bx
    call sub_21756
    mov es, word ptr dword_3423C+2
    pop bx
loc_211F3:
    test byte ptr [bx+18h], 10h
    jz short locret_21209
    mov si, [bx+8]
    mov di, [bx+0Ch]
    mov dx, [bx+0Eh]
    call sub_21756
    mov es, word ptr dword_3423C+2
locret_21209:
    retn
sub_211BA endp
; ------------------------------seg001:0x1989------------------------------
loc_2120A:
    mov ax, word_34256
    db 3Dh ;cmp ax, 1
    dw 1
    jl short nullsub_2
    mov word_34686, ax
    mov ax, word_34254
    mov word_34684, ax
    mov ax, word_3424C
    mov word_342BC, ax
    mov ax, word_3424E
    mov word_342BE, ax
    mov ax, word_34250
    mov word_344A0, ax
    mov ax, word_34252
    mov word_344A2, ax
    inc si
    lods byte ptr es:[si]
    sub ah, ah
    mov di, ax
    mov ah, [di+18ECh]
    add ah, byte_3419A
    call far ptr sub_3380E
    call sub_1F993
    sub bx, bx
    call sub_1F8F8
    call sub_1F9B7
    mov ax, word_34868
    mov word_3755D, ax
    mov word_3755F, ax
    mov ax, word_34A4C
    mov word_37561, ax
    mov word_37563, ax
    call sub_21536
loc_21268:
    lods byte ptr es:[si]
    sub ah, ah
    mov di, ax
    mov bl, [di-7748h]
    sub bh, bh
    shl bx, 1
    mov cx, [bx-6A30h]
    mov bl, [di-7802h]
    sub bh, bh
    shl bx, 1
    mov ax, [bx-6A72h]
    mov word_36C33, ax
    mov bl, [di-79A2h]
    sub bh, bh
    shl bx, 1
    mov bx, [bx-6AB4h]
    push si
    mov ax, word_36C33
    imul word_342A6
    mov di, dx
    mov si, ax
    mov ax, word_342A0
    imul cx
    add si, ax
    adc di, dx
    mov ax, word_3429A
    imul bx
    add si, ax
    adc di, dx
    shl si, 1
    rcl di, 1
    add si, word_3424C
    adc di, word_3424E
    mov word_342BC, si
    mov word_342BE, di
    mov ax, word_36C33
    imul word_342A8
    mov di, dx
    mov si, ax
    mov ax, word_342A2
    imul cx
    add si, ax
    adc di, dx
    mov ax, word_3429C
    imul bx
    add si, ax
    adc di, dx
    shl si, 1
    rcl di, 1
    add si, word_34250
    adc di, word_34252
    mov word_344A0, si
    mov word_344A2, di
    mov ax, word_36C33
    imul word_342AA
    mov di, dx
    mov si, ax
    mov ax, word_342A4
    imul cx
    add si, ax
    adc di, dx
    mov ax, word_3429E
    imul bx
    add si, ax
    adc di, dx
    shl si, 1
    rcl di, 1
    add si, word_34254
    adc di, word_34256
    mov word_34684, si
    mov word_34686, di
    mov bx, 8
    cmp di, 1388h
    jg short loc_2133C
    dec bx
    cmp di, 9C4h
    jg short loc_2133C
    mov bx, 0Fh
loc_2133C:
    mov ah, [bx+18ECh]
    call far ptr sub_3380E
    sub bx, bx
    call sub_1F8F8
    mov ax, word_34868
    mov word_3755D, ax
    mov word_3755F, ax
    mov ax, word_34A4C
    mov word_37561, ax
    mov word_37563, ax
    call sub_21536
    pop si
    mov es, word ptr dword_3423C+2
    dec byte_36C32
    jz short loc_2136D
    jmp loc_21268
loc_2136D:
    call sub_1F9B7
    retn
loc_21371:
    jmp loc_21268
loc_21374:
    call sub_1F993
    add si, 2
    lods byte ptr es:[si]
    mov byte_36C32, al
    cmp byte_36B88, 0
    jnz short loc_21371
loc_21386:
    lods byte ptr es:[si]
    sub ah, ah
    shl ax, 1
    shl ax, 1
    mov di, ax
    mov ax, [di+2830h]
    add ax, word_34254
    mov word_34684, ax
    mov ax, [di+2832h]
    adc ax, word_34256
    db 3Dh ;cmp ax, 1
    dw 1
    jl short loc_21415
    mov word_34686, ax
    mov dx, ax
    mov ax, [di+2380h]
    add ax, word_3424C
    mov word_342BC, ax
    mov ax, [di+2382h]
    adc ax, word_3424E
    mov word_342BE, ax
    mov ax, [di+25D8h]
    add ax, word_34250
    mov word_344A0, ax
    mov ax, [di+25DAh]
    adc ax, word_34252
    mov word_344A2, ax
    mov bx, 8
    cmp dx, 1388h
    jg short loc_213EC
    dec bx
    cmp dx, 9C4h
    jg short loc_213EC
    mov bx, 0Fh
loc_213EC:
    mov ah, [bx+18ECh]
    call far ptr sub_3380E
    push si
    sub bx, bx
    call sub_1F8F8
    mov ax, word_34868
    mov word_3755D, ax
    mov word_3755F, ax
    mov ax, word_34A4C
    mov word_37561, ax
    mov word_37563, ax
    call sub_21536
    pop si
    mov es, word ptr dword_3423C+2
loc_21415:
    dec byte_36C32
    jz short loc_2141E
    jmp loc_21386
loc_2141E:
    call sub_1F9B7
    retn
; ------------------------------seg001:0x1ba2------------------------------
sub_21422 proc near
    cmp byte_342B4, 0
    jnz short loc_21430
    lods word ptr es:[si]
    and ax, word_342B6
    retn
loc_21430:
    lods word ptr es:[si]
    mov dx, es:[si]
    add si, 2
    and ax, word_342B6
    and dx, word_342B8
    or ax, dx
    retn
sub_21422 endp
; ------------------------------seg001:0x1bc2------------------------------
    nop
; ------------------------------seg001:0x1bc4------------------------------
sub_21444 proc far
    push bp
    mov bp, sp
    push di
    push si
    push bp
    push ds
    pop es
    assume es:dseg
    call far ptr sub_337BE
sub_21444 endp
; ------------------------------seg001:0x1bcc------------------------------
    push ax
    mov bx, [bp+6]
    mov ax, [bx]
    call far ptr sub_337AF
    mov ah, [bx+4]
    call far ptr sub_3380E
    call sub_21720
    mov cx, [bp+0Eh]
    mov si, [bp+0Ah]
    mov word_378DB, cx
    mov word_378D9, si
    sub cx, si
    inc cx
    lea di, unk_37565
    shl si, 1
    add di, si
    mov ax, [bp+8]
    mov dx, cx
    rep stosw
    mov cx, dx
    lea di, unk_3771D
    add di, si
    mov ax, [bp+0Ch]
    rep stosw
    mov bx, 4CB5h
    mov ax, word_378D9
    mov cx, word_378DB
    call far ptr sub_33836
    call far ptr sub_33818
    pop ax
    call far ptr sub_337B9
    pop bp
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
    push bp
    mov bp, sp
    push di
    push si
    push bp
    push ds
    pop es
    call far ptr sub_337BE
    push ax
    mov bx, [bp+6]
    mov ax, [bx]
    call far ptr sub_337AF
    mov ah, [bx+6]
    call far ptr sub_3380E
    call sub_21720
    mov cx, [bp+0Eh]
    mov si, [bp+0Ah]
    mov word_378DB, cx
    mov word_378D9, si
    sub cx, si
    inc cx
    lea di, unk_37565
    shl si, 1
    add di, si
    mov ax, [bp+8]
    mov dx, cx
    rep stosw
    mov cx, dx
    lea di, unk_3771D
    add di, si
    mov ax, [bp+0Ch]
    rep stosw
    mov bx, 4CB5h
    mov ax, word_378D9
    mov cx, word_378DB
    call far ptr sub_33836
    call far ptr sub_33818
    pop ax
    call far ptr sub_337B9
    pop bp
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
; ------------------------------seg001:0x1ca6------------------------------
sub_21526 proc far
    call sub_21536
    retf
sub_21526 endp
; ------------------------------seg001:0x1ca9------------------------------
; ------------------------------seg001:0x1caa------------------------------
sub_2152A proc far
    push bp
    push si
    push di
    push es
    call sub_21536
    pop es
    assume es:nothing
    pop di
    pop si
    pop bp
    retf
sub_2152A endp
; ------------------------------seg001:0x1cb5------------------------------
; ------------------------------seg001:0x1cb6------------------------------
sub_21536 proc near
    sub ax, ax
    mov es, ax
    assume es:nothing
    push word ptr es:0
    push word ptr es:2
    lea ax, unk_34713
    mov es:0, ax
    mov word ptr es:2, seg seg001
    push ds
    pop es
    assume es:dseg
    jmp short loc_215BE
    nop
loc_21558:
    sub ax, ax
    mov es, ax
    assume es:nothing
    pop word ptr es:2
    pop word ptr es:0
    push ds
    pop es
    assume es:dseg
    mov ax, word_3755D
    mov bx, word_37561
    mov cx, word_3755F
    mov dx, word_37563
    call far ptr sub_33809
    clc
    retn
loc_2157E:
    sub ax, ax
    mov es, ax
    assume es:nothing
    pop word ptr es:2
    pop word ptr es:0
    push ds
    pop es
    assume es:dseg
    stc
    retn
loc_21590:
    cmc
    rcr dx, 1
    mov word_3754F, dx
    sar dx, 1
    mov word_37553, dx
    mov dx, di
    sub dx, bp
    jno short loc_215A9
    cmc
    rcr dx, 1
    jmp short loc_21619
    db 90h
loc_215A9:
    sar dx, 1
    jmp short loc_21619
    nop
loc_215AE:
    cmc
    rcr dx, 1
    sar word_3754F, 1
    sar word_37553, 1
    jmp short loc_21619
    nop
loc_215BC:
    jmp short loc_2157E
loc_215BE:
    mov cx, word_3755D
    mov dx, word_37561
    mov si, word_3755F
    mov di, word_37563
    mov bx, cx
    mov bp, dx
    call sub_216C2
    mov byte_3754E, al
    mov bx, si
    mov bp, di
    call sub_216C2
    jnz short loc_215FB
    cmp byte_3754E, 0
    jnz short loc_215EB
    jmp loc_21558
loc_215EB:
    xchg cx, si
    xchg dx, di
    xchg al, byte_3754E
    mov word_3755D, cx
    mov word_37561, dx
loc_215FB:
    test byte_3754E, al
    jnz short loc_215BC
    mov bp, dx
    mov dx, si
    sub dx, cx
    jo short loc_21590
    mov word_3754F, dx
    sar dx, 1
    mov word_37553, dx
    mov dx, di
    sub dx, bp
    jo short loc_215AE
loc_21619:
    mov word_37551, dx
    sar dx, 1
    mov word_37555, dx
loc_21623:
    test al, 9
    jz short loc_2165F
    sub bx, bx
    or si, si
    js short loc_21631
    mov bx, word_37557
loc_21631:
    mov ax, bx
    sub ax, cx
    imul word_37551
    push bx
    mov bx, dx
    idiv word_3754F
    mov bl, bh
    xor bl, byte ptr word_3754F+1
    jns short loc_2164B
    neg dx
    dec ax
loc_2164B:
    sub dx, word_37553
    xor dh, bh
    js short loc_21654
    inc ax
loc_21654:
    pop bx
    add ax, bp
    js short loc_21667
    cmp ax, word_37559
    jle short loc_21698
loc_2165F:
    mov bx, word_37559
    cmp di, bx
    jg short loc_21669
loc_21667:
    sub bx, bx
loc_21669:
    mov ax, bx
    sub ax, bp
    imul word_3754F
    push bx
    mov bx, dx
    idiv word_37551
    mov bl, bh
    xor bl, byte ptr word_37551+1
    jns short loc_21683
    neg dx
    dec ax
loc_21683:
    sub dx, word_37555
    xor dh, bh
    js short loc_2168C
    inc ax
loc_2168C:
    pop bx
    add ax, cx
    js short loc_216A9
    cmp ax, word_37557
    jg short loc_216A9
    xchg ax, bx
loc_21698:
    cmp byte_3754E, 0
    jnz short loc_216AC
    mov word_37563, ax
    mov word_3755F, bx
    jmp loc_21558
loc_216A9:
    jmp loc_2157E
loc_216AC:
    mov word_37561, ax
    mov word_3755D, bx
    xchg cx, si
    xchg bp, di
    mov al, byte_3754E
    mov byte_3754E, 0
    jmp loc_21623
sub_21536 endp
; ------------------------------seg001:0x1e3f------------------------------
; ------------------------------seg001:0x1e42------------------------------
sub_216C2 proc near
    mov al, 0Fh
    or bx, bx
    js short loc_216CA
    and al, 0F7h
loc_216CA:
    cmp bx, word_37557
    jg short loc_216D2
    and al, 0FEh
loc_216D2:
    or bp, bp
    js short loc_216D8
    and al, 0FBh
loc_216D8:
    cmp bp, word_37559
    jg short loc_216E0
    and al, 0FDh
loc_216E0:
    or al, al
    retn
sub_216C2 endp
; ------------------------------seg001:0x1e62------------------------------
    push bp
    mov bp, sp
    cmp word ptr [bp+2], 1DF4h
    mov ax, word_37551
    jz short loc_216F3
    mov ax, word_3754F
loc_216F3:
    xor dx, ax
    mov ax, 7F00h
    jns short loc_216FC
    neg ax
loc_216FC:
    add word ptr [bp+2], 4
    sub dx, dx
    pop bp
    iret
; ------------------------------seg001:0x1e84------------------------------
sub_21704 proc far
    push di
    push si
    push bp
    mov ax, word_378D9
    mov cx, word_378DB
    mov bx, 4CB5h
    call far ptr sub_33827
sub_21704 endp
; ------------------------------seg001:0x1e91------------------------------
    pop bp
    pop si
    pop di
    retf
; ------------------------------seg001:0x1e9a------------------------------
sub_2171A proc far
    push di
    call sub_21720
    pop di
    retf
sub_2171A endp
; ------------------------------seg001:0x1e9f------------------------------
; ------------------------------seg001:0x1ea0------------------------------
sub_21720 proc near
    mov di, word_378D9
    or di, di
    js short locret_21755
    mov ax, seg dseg
    mov es, ax
    mov cx, word_378DB
    inc cx
    sub cx, di
    shl di, 1
    mov bx, cx
    mov dx, di
    add di, 4CB5h
    mov ax, 0FFFFh
    rep stosw
    mov word_378D9, ax
    mov cx, bx
    mov di, dx
    add di, 4E6Dh
    sub ax, ax
    rep stosw
    mov word_378DB, ax
locret_21755:
    retn
sub_21720 endp
; ------------------------------seg001:0x1ed5------------------------------
; ------------------------------seg001:0x1ed6------------------------------
sub_21756 proc near
    mov ax, seg dseg
    mov es, ax
    mov cx, di
    or si, si
    lea di, unk_37565
    jz short loc_2176F
    cmp si, word_37557
    jnz short locret_217A4
    lea di, unk_3771D
loc_2176F:
    cmp cx, dx
    jge short loc_21775
    xchg cx, dx
loc_21775:
    or dx, dx
    jns short loc_2177B
    sub dx, dx
loc_2177B:
    cmp cx, word_37559
    jle short loc_21785
    mov cx, word_37559
loc_21785:
    cmp cx, word_378DB
    jbe short loc_2178F
    mov word_378DB, cx
loc_2178F:
    cmp dx, word_378D9
    jnb short loc_21799
    mov word_378D9, dx
loc_21799:
    add di, dx
    add di, dx
    sub cx, dx
    inc cx
    mov ax, si
    rep stosw
locret_217A4:
    retn
sub_21756 endp
; ------------------------------seg001:0x1f24------------------------------
loc_217A5:
    sub si, si
    or bx, bx
    js short sub_21756
    mov si, word_37557
    cmp bx, si
    jg short sub_21756
    retn
; ------------------------------seg001:0x1f34------------------------------
sub_217B4 proc near
    mov ax, word_3755F
    cmp ax, word_3755D
    jnb short loc_217D6
    mov bx, word_3755D
    mov word_3755F, bx
    mov word_3755D, ax
    mov ax, word_37563
    mov bx, word_37561
    mov word_37563, bx
    mov word_37561, ax
loc_217D6:
    mov bx, word_3755F
    sub bx, word_3755D
    mov word_378D5, bx
    mov ax, word_37563
    mov dx, ax
    mov cx, word_37561
    sub ax, cx
    mov bp, 2
    jns short loc_217F8
    xchg cx, dx
    neg bp
    neg ax
loc_217F8:
    mov word_378D7, ax
    cmp dx, word_378DB
    jbe short loc_21805
    mov word_378DB, dx
loc_21805:
    cmp cx, word_378D9
    jnb short loc_2180F
    mov word_378D9, cx
loc_2180F:
    cmp ax, bx
    jnb short loc_2185E
    mov di, word_37561
    shl di, 1
    mov ax, word_3755D
    mov dx, word_378D5
    mov cx, dx
    mov bx, cx
    inc bx
    shr bx, 1
    neg bx
    mov si, word_378D7
    jmp short loc_2183F
    nop
loc_21830:
    cmp ax, [di+4E6Dh]
    jbe short loc_2183A
    mov [di+4E6Dh], ax
loc_2183A:
    inc ax
    sub bx, dx
    add di, bp
loc_2183F:
    cmp ax, [di+4CB5h]
    jnb short loc_21849
    mov [di+4CB5h], ax
loc_21849:
    dec cx
    js short loc_21853
    add bx, si
    jns short loc_21830
    inc ax
    jmp short loc_21849
loc_21853:
    cmp ax, [di+4E6Dh]
    jbe short locret_2185D
    mov [di+4E6Dh], ax
locret_2185D:
    retn
loc_2185E:
    mov di, word_37561
    shl di, 1
    mov ax, word_3755D
    mov dx, word_378D7
    mov cx, dx
    mov bx, cx
    inc bx
    shr bx, 1
    neg bx
    mov si, word_378D5
loc_21878:
    cmp ax, [di+4CB5h]
    jnb short loc_21882
    mov [di+4CB5h], ax
loc_21882:
    cmp ax, [di+4E6Dh]
    jbe short loc_2188C
    mov [di+4E6Dh], ax
loc_2188C:
    dec cx
    js short locret_2189A
    add di, bp
    add bx, si
    js short loc_21878
    sub bx, dx
    inc ax
    jmp short loc_21878
locret_2189A:
    retn
sub_217B4 endp
; ------------------------------seg001:0x201a------------------------------
    nop
; ------------------------------seg001:0x201c------------------------------
sub_2189C proc far
    push es
    push si
    push di
    push bp
    call sub_218A8
    pop bp
    pop di
    pop si
    pop es
    assume es:nothing
    retf
sub_2189C endp
; ------------------------------seg001:0x2027------------------------------
; ------------------------------seg001:0x2028------------------------------
sub_218A8 proc near
    sub ax, ax
    mov es, ax
    assume es:nothing
    push word ptr es:0
    push word ptr es:2
    lea ax, unk_34A88
    mov es:0, ax
    mov word ptr es:2, seg seg001
    push ds
    pop es
    assume es:dseg
    jmp short loc_21917
    nop
loc_218CA:
    sub ax, ax
    mov es, ax
    assume es:nothing
    pop word ptr es:2
    pop word ptr es:0
    push ds
    pop es
    assume es:dseg
    retn
loc_218DB:
    and al, byte_378DE
    test al, 6
    jnz short loc_218CA
    mov bx, cx
    jmp loc_21A1A
loc_218E8:
    jmp loc_21A45
loc_218EB:
    cmc
    rcr dx, 1
    mov word_378DF, dx
    sar dx, 1
    mov word_378E3, dx
    mov dx, di
    sub dx, bp
    jno short loc_21904
    cmc
    rcr dx, 1
    jmp short loc_2196F
    nop
loc_21904:
    sar dx, 1
    jmp short loc_2196F
    db 90h
loc_21909:
    cmc
    rcr dx, 1
    sar word_378DF, 1
    sar word_378E3, 1
    jmp short loc_2196F
    db 90h
loc_21917:
    mov cx, word_3755D
    mov dx, word_37561
    mov si, word_3755F
    mov di, word_37563
    mov bx, cx
    mov bp, dx
    call sub_216C2
    mov byte_378DE, al
    mov bx, si
    mov bp, di
    call sub_216C2
    jnz short loc_21951
    cmp byte_378DE, 0
    jz short loc_218E8
    xchg cx, si
    xchg dx, di
    xchg al, byte_378DE
    mov word_3755D, cx
    mov word_37561, dx
loc_21951:
    mov bp, dx
    test byte_378DE, al
    jnz short loc_218DB
    mov dx, si
    sub dx, cx
    jo short loc_218EB
    mov word_378DF, dx
    sar dx, 1
    mov word_378E3, dx
    mov dx, di
    sub dx, bp
    jo short loc_21909
loc_2196F:
    mov word_378E1, dx
    sar dx, 1
    mov word_378E5, dx
loc_21979:
    test al, 9
    jz short loc_219B9
    sub bx, bx
    or si, si
    js short loc_21987
    mov bx, word_37557
loc_21987:
    mov ax, bx
    sub ax, cx
    imul word_378E1
    push bx
    mov bx, dx
    idiv word_378DF
    or ax, ax
    or ax, ax
    mov bl, bh
    xor bl, byte ptr word_378DF+1
    jns short loc_219A5
    neg dx
    dec ax
loc_219A5:
    sub dx, word_378E3
    xor dh, bh
    js short loc_219AE
    inc ax
loc_219AE:
    pop bx
    add ax, bp
    js short loc_219C1
    cmp ax, word_37559
    jle short loc_219F6
loc_219B9:
    mov bx, word_37559
    cmp di, bx
    jg short loc_219C3
loc_219C1:
    sub bx, bx
loc_219C3:
    mov ax, bx
    sub ax, bp
    imul word_378DF
    push bx
    mov bx, dx
    idiv word_378E1
    or ax, ax
    or ax, ax
    mov bl, bh
    xor bl, byte ptr word_378E1+1
    jns short loc_219E1
    neg dx
    dec ax
loc_219E1:
    sub dx, word_378E5
    xor dh, bh
    js short loc_219EA
    inc ax
loc_219EA:
    pop bx
    add ax, cx
    xchg ax, bx
    js short loc_21A1A
    cmp bx, word_37557
    jg short loc_21A1A
loc_219F6:
    push ax
    push bx
    push cx
    push si
    push di
    mov dx, di
    mov di, ax
    mov si, bx
    call sub_21756
    pop di
    pop si
    pop cx
    pop bx
    pop ax
    cmp byte_378DE, 0
    jnz short loc_21A2F
    mov word_37563, ax
    mov word_3755F, bx
    jmp short loc_21A45
    nop
loc_21A1A:
    mov dx, bp
    sub ax, ax
    mov es, ax
    assume es:nothing
    pop word ptr es:2
    pop word ptr es:0
    push ds
    pop es
    assume es:dseg
    jmp loc_217A5
loc_21A2F:
    mov word_37561, ax
    mov word_3755D, bx
    xchg cx, si
    xchg bp, di
    mov al, byte_378DE
    mov byte_378DE, 0
    jmp loc_21979
loc_21A45:
    sub ax, ax
    mov es, ax
    assume es:nothing
    pop word ptr es:2
    pop word ptr es:0
    push ds
    pop es
    assume es:dseg
    jmp sub_217B4
sub_218A8 endp
; ------------------------------seg001:0x21d5------------------------------
    push bp
    mov bp, sp
    cmp word ptr [bp+2], 214Eh
    mov ax, word_378E1
    jz short loc_21A68
    mov ax, word_378DF
loc_21A68:
    xor dx, ax
    mov ax, 7F00h
    jns short loc_21A71
    neg ax
loc_21A71:
    add word ptr [bp+2], 4
    sub dx, dx
    pop bp
    iret
seg001 ends
;  ==============================================================================

;  ==============================================================================


seg002 segment byte public 'CODE' use16
    assume cs:seg002
    assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
    nop
; ------------------------------seg002:0xa------------------------------
sub_21A7A proc far
    call sub_21A86
sub_21A7A endp
; ------------------------------seg002:0xa------------------------------
    retf
; ------------------------------seg002:0xe------------------------------
sub_21A7E proc far
    call sub_22411
sub_21A7E endp
; ------------------------------seg002:0xe------------------------------
    retf
    call loc_22425
    retf
; ------------------------------seg002:0x16------------------------------
sub_21A86 proc near
    call far ptr sub_3384F
    sub ah, ah
    mov word_37B26, ax
    mov word_37B3C, ax
    mov word_37B52, ax
    mov word_37B68, ax
    mov word_37BA2, ax
    mov word_37B84, ax
    mov word_37BDE, ax
    mov word_37BC0, ax
    mov bp, 5276h
    mov ax, word_3AA5A
    mov dh, 32h
    div dh
    mov dl, al
    dec dl
    mov cl, byte_37BFC
    xchg al, ah
    sub ah, ah
    shl ax, cl
    mov dh, 5
    div dh
    add al, byte ptr word_37BF7
    mov byte ptr word_37B30, al
    mov byte_37C35, dl
    sub al, byte_37BF9
    mov byte ptr word_37C2B, al
    shl dl, 1
    sub dh, dh
    mov di, dx
    mov byte_37C2E, 4
loc_21ADE:
    mov al, byte ptr word_37BFA
    sub byte ptr word_37B30, al
    mov ax, word_37BFD
    mov word_37B2E, ax
    cmp di, 28h
    jb short loc_21AFF
    sub di, di
    dec byte_37C2E
    mov ax, word_37BFA
    sub word_37C2B, ax
    jmp short loc_21ADE
loc_21AFF:
    mov ax, [di+5392h]
    mov word_37C30, ax
    mov ax, [di+53E2h]
    mov word_37C32, ax
    mov bx, 5380h
    push di
    call far ptr sub_33773
    pop di
    inc di
    inc di
    dec byte_37C2E
    jnz short loc_21ADE
    mov si, 0
    mov bx, word_37C2B
    mov cl, byte_37C24
    mov dl, byte_37C35
    call far ptr sub_337A5
    mov ah, 0Fh
    call far ptr sub_3380E
    cmp byte_37C24, 0
    jz short loc_21B77
    mov ax, 7Ah
    mov cx, 7Ch
    mov bx, 52h
    mov dx, 52h
    call far ptr sub_33809
    mov ax, 0C4h
    mov cx, 0C6h
    mov bx, 52h
    mov dx, 52h
    call far ptr sub_33809
    mov ax, 9Fh
    mov cx, 9Fh
    mov bx, 43h
    mov dx, 44h
    call far ptr sub_33809
    jmp short loc_21BAA
    db 90h
loc_21B77:
    mov ax, 49h
    mov cx, 4Ch
    mov bx, 38h
    mov dx, 38h
    call far ptr sub_33809
    mov ax, 0F3h
    mov cx, 0F6h
    mov bx, 38h
    mov dx, 38h
    call far ptr sub_33809
    mov ax, 9Fh
    mov cx, 9Fh
    mov bx, 14h
    mov dx, 16h
    call far ptr sub_33809
loc_21BAA:
    call far ptr sub_33818
    mov ax, word_380D0
    sub dx, dx
    mov cx, 3E8h
    div cx
    mov bx, ax
    dec bx
    mov ax, dx
    mov word_37C25, dx
    sub dx, dx
    mov cl, byte_37BFC
    shl ax, cl
    mov cx, 64h
    div cx
    shl bx, 1
    mov di, bx
    mov bp, 5276h
    mov byte_37C2E, 4
    cmp di, 0
    jge short loc_21C56
    mov ax, word_37C25
    mov dh, 64h
    div dh
    mov dl, al
    dec dl
    mov cl, byte_37BFC
    xchg al, ah
    sub ah, ah
    shl ax, cl
    mov dh, 0Ah
    div dh
    add al, byte ptr word_37BF7
    mov byte ptr word_37B30, al
    mov byte_37C35, dl
    sub al, byte_37BF9
    mov byte ptr word_37C2B, al
    shl dl, 1
    sub dh, dh
    mov di, dx
loc_21C11:
    mov al, byte ptr word_37BFA
    sub byte ptr word_37B30, al
    mov ax, word_37BFF
    mov word_37B2E, ax
    cmp di, 28h
    jb short loc_21C32
    sub di, di
    dec byte_37C2E
    mov ax, word_37BFA
    sub word_37C2B, ax
    jmp short loc_21C11
loc_21C32:
    mov al, [di+5433h]
    mov byte_37C3A, al
    mov bx, 538Ah
    push di
    call far ptr sub_33773
    pop di
    inc di
    inc di
    dec byte_37C2E
    jz short loc_21C9A
    cmp di, 14h
    jb short loc_21C11
    mov di, 2
    jmp short loc_21C69
    nop
loc_21C56:
    add ax, word_37BF7
    mov word_37B30, ax
    mov byte_37C35, 2
    sub al, byte_37BF9
    mov byte ptr word_37C2B, al
loc_21C69:
    mov al, byte ptr word_37BFA
    sub byte ptr word_37B30, al
    mov ax, word_37BFF
    mov word_37B2E, ax
    cmp di, 0
    jnz short loc_21C81
    mov bx, 538Eh
    jmp short loc_21C8B
    db 90h
loc_21C81:
    mov ax, [di+5432h]
    mov word_37C36, ax
    mov bx, 5386h
loc_21C8B:
    push di
    call far ptr sub_33773
    pop di
    inc di
    inc di
    dec byte_37C2E
    jnz short loc_21C69
loc_21C9A:
    mov si, 2
    mov bx, word_37C2B
    mov cl, byte_37C24
    mov dl, byte_37C35
    call far ptr sub_337A5
    mov ax, word_380C8
    db 2Dh ;sub ax, 2000h
    dw 2000h
    mov dl, ah
    db 25h ;and ax, 1F80h
    dw 1F80h
    shl ax, 1
    xchg al, ah
    mov dh, byte ptr word_37C01
    mul dh
    shr ax, 1
    shr ax, 1
    shr ax, 1
    shr ax, 1
    shr ax, 1
    shr ax, 1
    mov byte_37C2D, al
    xchg al, ah
    mov al, byte_37BF6
    sub al, ah
    sub ah, ah
    mov word_37C29, ax
    mov word_37B44, ax
    sub dh, dh
    shr dx, 1
    shr dx, 1
    and dx, 38h
    mov word_37C27, dx
    mov bx, 54BEh
    add bx, dx
    mov bp, 528Ch
    call far ptr sub_33778
    mov bx, 54BEh
    add word_37C27, 8
    and word_37C27, 3Fh
    add bx, word_37C27
    mov ax, word_37C29
    add ax, word_37C01
    mov word_37C29, ax
    mov word_37B44, ax
    call far ptr sub_33782
    mov bx, 54BEh
    add word_37C27, 8
    and word_37C27, 3Fh
    add bx, word_37C27
    mov ax, word_37C29
    add ax, word_37C01
    mov word_37C29, ax
    mov word_37B44, ax
    call far ptr sub_33782
    mov ax, word_37C03
    cmp word_37C29, ax
    jnb short loc_21DC1
    mov bx, 54BEh
    add word_37C27, 8
    and word_37C27, 3Fh
    add bx, word_37C27
    mov ax, [bx]
    mov [bx+4], ax
    mov ax, [bx+2]
    mov [bx+6], ax
    add bx, 4
    mov ax, word_37C29
    add ax, word_37C01
    mov word_37C29, ax
    mov word_37B44, ax
    call far ptr sub_3377D
    mov al, byte_37C2D
    sub ah, ah
    mov dl, byte ptr word_37C05
    div dl
    xchg al, ah
    sub ah, ah
    test word_380C8, 2000h
    jz short loc_21D96
    add ax, word_37C07
loc_21D96:
    cmp ax, word_37C05
    jl short loc_21DA0
    sub ax, word_37C05
loc_21DA0:
    mov di, ax
    shl di, 1
    cmp byte_37C24, 1
    jnz short loc_21DB2
    mov ax, [di+5512h]
    jmp short loc_21DB6
    nop
loc_21DB2:
    mov ax, [di+54FEh]
loc_21DB6:
    mov word_37B82, ax
    mov bp, 52CEh
    call far ptr sub_337C8
loc_21DC1:
    cmp byte_37C24, 0
    jz short loc_21DCB
    jmp loc_21E4C
loc_21DCB:
    mov ax, 2Eh
    mov cx, 2Eh
    mov bx, 60h
    mov dx, 0Fh
    call far ptr sub_33809
    mov ax, 112h
    mov cx, 112h
    mov bx, 60h
    mov dx, 0Fh
    call far ptr sub_33809
    mov ah, 8
    call far ptr sub_3380E
    mov ax, 2Dh
    mov cx, 2Dh
    mov bx, 60h
    mov dx, 0Fh
    call far ptr sub_33809
    mov ax, 113h
    mov cx, 113h
    mov bx, 60h
    mov dx, 0Fh
    call far ptr sub_33809
    mov ax, 113h
    mov cx, 0E8h
    mov bx, 0Fh
    mov dx, 3
    call far ptr sub_33809
    mov ax, 0E8h
    mov cx, 5Ah
    mov bx, 3
    mov dx, 3
    call far ptr sub_33809
    mov ax, 2Dh
    mov cx, 59h
    mov bx, 0Fh
    mov dx, 3
    call far ptr sub_33809
    jmp short loc_21ECA
    nop
loc_21E4C:
    mov ax, 67h
    mov cx, 67h
    mov bx, 60h
    mov dx, 3Fh
    call far ptr sub_33809
    mov ax, 0D9h
    mov cx, 0D9h
    mov bx, 60h
    mov dx, 3Fh
    call far ptr sub_33809
    mov ah, 8
    call far ptr sub_3380E
    mov ax, 66h
    mov cx, 66h
    mov bx, 60h
    mov dx, 3Fh
    call far ptr sub_33809
    mov ax, 0DAh
    mov cx, 0DAh
    mov bx, 60h
    mov dx, 3Fh
    call far ptr sub_33809
    mov ax, 0D9h
    mov cx, 0C4h
    mov bx, 3Fh
    mov dx, 39h
    call far ptr sub_33809
    mov ax, 0C4h
    mov cx, 7Ch
    mov bx, 39h
    mov dx, 39h
    call far ptr sub_33809
    mov ax, 7Ch
    mov cx, 67h
    mov bx, 39h
    mov dx, 3Fh
    call far ptr sub_33809
loc_21ECA:
    call far ptr sub_33818
    cmp byte_37C2F, 0
    jz short loc_21EDE
    mov bp, 52ECh
    call far ptr sub_337C8
loc_21EDE:
    mov bx, 6720h
    mov bp, 52B8h
    mov ax, word_37C22
    mov word_37B70, ax
    call far ptr sub_33782
    mov ax, word_380CA
    db 3Dh ;cmp ax, 0
    dw 0
    jge short loc_21EF9
    neg ax
loc_21EF9:
    shr ax, 1
    shr ax, 1
    shr ax, 1
    shr ax, 1
    shr ax, 1
    shr ax, 1
    mov bx, 168h
    mul bx
    mov al, ah
    mov ah, dl
    mov bl, 28h
    div bl
    mov ch, al
    mov al, ah
    sub ah, ah
    mov bh, byte ptr word_37C11
    mul bh
    mov bx, 28h
    mov dx, 0
    div bx
    cmp word_380CA, 0
    jge short loc_21F35
    mov ah, byte ptr word_37C11
    sub ah, al
    xchg ah, al
loc_21F35:
    add al, byte_37C13
    sub ah, ah
    mov bx, ax
    cmp word_380CA, 0
    jge short loc_21F48
    neg ch
    dec ch
loc_21F48:
    mov al, ch
    cbw
    db 2Dh ;sub ax, 2
    dw 2
    mov word_37EF0, ax
    mov dx, ax
    mov cl, 5
    mov di, 0
    mov si, di
    mov ch, 0
loc_21F5C:
    cmp dl, 9
    jz short loc_21F74
    jg short loc_21F77
    cmp dl, 0F7h
    jz short loc_21F7D
    jl short loc_21F7A
    cmp dl, 0
    jz short loc_21F7D
    jg short loc_21FD4
    jmp loc_22142
loc_21F74:
    jmp loc_2208C
loc_21F77:
    jmp loc_22030
loc_21F7A:
    jmp loc_220D0
loc_21F7D:
    mov ax, word_37C09
    mov [di+5526h], ax
    mov ax, word_37C0B
    mov [di+5528h], ax
    mov ax, word_37C0D
    mov [di+552Ah], ax
    mov ax, word_37C0F
    mov [di+552Ch], ax
    mov [di+5596h], bx
    mov [di+5598h], bx
    mov [di+559Ah], bx
    mov [di+559Ch], bx
    mov byte ptr [si+5606h], 1
    mov byte ptr [si+5607h], 1
    mov [si+5622h], di
    add di, 6
    mov [si+5623h], di
    add di, 2
    add si, 2
    sub bx, word_37C11
    add ch, 2
    inc dl
    dec cl
    jnz short loc_21F5C
    jmp loc_221B1
loc_21FD4:
    mov ax, word_37C09
    mov [di+5526h], ax
    mov [di+5528h], ax
    mov ax, word_37C0F
    mov [di+552Ah], ax
    mov [di+552Ch], ax
    mov [di+5598h], bx
    mov [di+559Ah], bx
    mov ax, bx
    db 05h ;add ax, 5
    dw 5
    mov [di+5596h], ax
    mov [di+559Ch], ax
    mov byte ptr [si+5606h], 3
    mov byte ptr [si+5607h], 0
    add di, 2
    mov [si+5622h], di
    add di, 2
    mov [si+5623h], di
    add di, 4
    add si, 2
    sub bx, word_37C11
    add ch, 3
    inc dl
    dec cl
    jnz short loc_2202D
    jmp loc_221B1
loc_2202D:
    jmp loc_21F5C
loc_22030:
    mov ax, word_37C09
    mov [di+5526h], ax
    mov [di+5528h], ax
    mov ax, word_37C0F
    mov [di+552Ah], ax
    mov [di+552Ch], ax
    mov [di+5598h], bx
    mov [di+559Ah], bx
    mov ax, bx
    db 2Dh ;sub ax, 5
    dw 5
    mov [di+5596h], ax
    mov [di+559Ch], ax
    mov byte ptr [si+5606h], 3
    mov byte ptr [si+5607h], 0
    add di, 2
    mov [si+5622h], di
    add di, 2
    mov [si+5623h], di
    add di, 4
    add si, 2
    sub bx, word_37C11
    add ch, 3
    inc dl
    dec cl
    jnz short loc_22089
    jmp loc_221B1
loc_22089:
    jmp loc_21F5C
loc_2208C:
    mov ax, word_37C09
    mov [di+5526h], ax
    mov ax, word_37C0F
    mov [di+5528h], ax
    mov [di+5596h], bx
    mov [di+5598h], bx
    mov byte ptr [si+5606h], 1
    mov byte ptr [si+5607h], 0
    mov [si+5622h], di
    add di, 2
    mov [si+5623h], di
    add di, 2
    add si, 2
    sub bx, word_37C11
    add ch, 1
    inc dl
    dec cl
    jnz short loc_220CD
    jmp loc_221B1
loc_220CD:
    jmp loc_21F5C
loc_220D0:
    mov ax, word_37C09
    mov [di+5526h], ax
    mov [di+5528h], ax
    mov ax, word_37C0B
    mov [di+552Ah], ax
    mov ax, word_37C0D
    mov [di+552Ch], ax
    mov ax, word_37C0F
    mov [di+552Eh], ax
    mov [di+5530h], ax
    mov [di+5598h], bx
    mov [di+559Ah], bx
    mov [di+559Ch], bx
    mov [di+559Eh], bx
    mov ax, bx
    db 05h ;add ax, 5
    dw 5
    mov [di+5596h], ax
    mov [di+55A0h], ax
    mov byte ptr [si+5606h], 2
    mov byte ptr [si+5607h], 2
    add di, 2
    mov [si+5622h], di
    add di, 6
    mov [si+5623h], di
    add di, 4
    add si, 2
    sub bx, word_37C11
    add ch, 4
    inc dl
    dec cl
    jnz short loc_2213F
    jmp short loc_221B1
    db 90h
loc_2213F:
    jmp loc_21F5C
loc_22142:
    mov ax, word_37C09
    mov [di+5526h], ax
    mov [di+5528h], ax
    mov ax, word_37C0B
    mov [di+552Ah], ax
    mov ax, word_37C0D
    mov [di+552Ch], ax
    mov ax, word_37C0F
    mov [di+552Eh], ax
    mov [di+5530h], ax
    mov [di+5598h], bx
    mov [di+559Ah], bx
    mov [di+559Ch], bx
    mov [di+559Eh], bx
    mov ax, bx
    db 2Dh ;sub ax, 5
    dw 5
    mov [di+5596h], ax
    mov [di+55A0h], ax
    mov byte ptr [si+5606h], 2
    mov byte ptr [si+5607h], 2
    add di, 2
    mov [si+5622h], di
    add di, 6
    mov [si+5623h], di
    add di, 4
    add si, 2
    sub bx, word_37C11
    add ch, 4
    inc dl
    dec cl
    jz short loc_221B1
    jmp loc_21F5C
loc_221B1:
    mov byte_37EEF, ch
    sub di, 2
    mov bx, word_380CC
    neg bx
    add bx, 4000h
    call sub_13BC1
    mov bp, bx
    mov bx, word_380CC
    neg bx
    call sub_13BC1
loc_221D4:
    mov ax, bp
    imul word ptr [di+5526h]
    shl ax, 1
    rcl dx, 1
    mov si, dx
    mov ax, bp
    imul word ptr [di+5596h]
    push bx
    push cx
    mov bx, ax
    mov cx, dx
    shl ax, 1
    rcl dx, 1
    add ax, bx
    adc dx, cx
    sar dx, 1
    pop cx
    pop bx
    mov cx, dx
    mov ax, bx
    imul word ptr [di+5596h]
    shl ax, 1
    rcl dx, 1
    sub si, dx
    mov ax, bx
    imul word ptr [di+5526h]
    push bx
    push cx
    mov bx, ax
    mov cx, dx
    shl ax, 1
    rcl dx, 1
    add ax, bx
    adc dx, cx
    sar dx, 1
    pop cx
    pop bx
    add cx, dx
    mov [di+5526h], si
    mov [di+5596h], cx
    sub di, 2
    jns short loc_221D4
    push word_37557
    push word_37559
    cmp byte_3C6A0, 0
    jnz short loc_2223F
    jmp loc_22403
loc_2223F:
    mov ah, 7
    cmp byte ptr word_32936, 0
    jz short loc_2224A
    mov ah, 0
loc_2224A:
    call far ptr sub_3380E
    mov ax, word_37C1C
    call far ptr sub_337F5
    mov ax, word_37C1E
    mov word_37557, ax
    mov ax, word_37C20
    mov word_37559, ax
    mov di, 0
    mov si, di
    mov byte_37EEE, 0
loc_2226D:
    mov ax, [di+5526h]
    add ax, word_37C14
    mov word_3755D, ax
    mov ax, [di+5596h]
    add ax, word_37C16
    mov word_37561, ax
    mov ax, [di+5528h]
    add ax, word_37C14
    mov word_3755F, ax
    mov ax, [di+5598h]
    add ax, word_37C16
    mov word_37563, ax
    push di
    push si
    call sub_21526
    pop si
    pop di
    add di, 2
    inc byte_37EEE
    dec byte ptr [si+5606h]
    jnz short loc_2226D
    add di, 2
    inc si
    cmp byte ptr [si+5606h], 0
    jnz short loc_222BB
    inc si
loc_222BB:
    mov bl, byte_37EEF
    cmp byte_37EEE, bl
    jl short loc_2226D
    call far ptr sub_33818
    add word_37EF0, 0Bh
    mov si, 0
    mov word_37EF2, 5
    mov bp, 52A2h
    mov ax, word_380CC
    shr ah, 1
    shr ah, 1
    xchg ah, al
    sub ah, ah
    mov di, ax
    shl di, 1
    mov ax, [di+5076h]
    mov word_37F5C, ax
    mov ax, [di+50F6h]
    mov word_37F5E, ax
    mov ax, [di+5176h]
    mov word_37F60, ax
    mov ax, [di+51F6h]
    mov word_37F62, ax
    mov ax, word_380CC
    add ah, 80h
    shr ah, 1
    shr ah, 1
    xchg ah, al
    sub ah, ah
    mov di, ax
    shl di, 1
    mov ax, [di+5076h]
    mov word_37F54, ax
    mov ax, [di+50F6h]
    mov word_37F56, ax
    mov ax, [di+5176h]
    mov word_37F58, ax
    mov ax, [di+51F6h]
    mov word_37F5A, ax
loc_22334:
    mov di, word_37EF0
    shl di, 1
    shl di, 1
    mov ax, [di+5644h]
    mov word_37F50, ax
    mov ax, [di+5646h]
    mov word_37F52, ax
    mov bx, di
    mov di, [si+5622h]
    and di, 0FFh
    mov ax, [di+5526h]
    cmp bx, 2Ch
    jge short loc_22364
    add ax, word_37F58
    jmp short loc_22368
    nop
loc_22364:
    add ax, word_37F54
loc_22368:
    add ax, word_37C1A
    mov word_37B5A, ax
    mov ax, [di+5596h]
    cmp di, 2Ch
    jge short loc_2237F
    add ax, word_37F5A
    jmp short loc_22383
    db 90h
loc_2237F:
    add ax, word_37F56
loc_22383:
    add ax, word_37C18
    mov word_37B5C, ax
    mov bx, 56A0h
    push si
    call far ptr sub_3378C
    pop si
    inc si
    mov di, word_37EF0
    shl di, 1
    shl di, 1
    mov ax, [di+5644h]
    mov word_37F50, ax
    mov ax, [di+5646h]
    mov word_37F52, ax
    mov bx, di
    mov di, [si+5622h]
    and di, 0FFh
    mov ax, [di+5526h]
    cmp bx, 2Ch
    jge short loc_223C5
    add ax, word_37F60
    jmp short loc_223C9
    db 90h
loc_223C5:
    add ax, word_37F5C
loc_223C9:
    add ax, word_37C1A
    mov word_37B5A, ax
    mov ax, [di+5596h]
    cmp di, 2Ch
    jge short loc_223E0
    add ax, word_37F62
    jmp short loc_223E4
    nop
loc_223E0:
    add ax, word_37F5E
loc_223E4:
    add ax, word_37C18
    mov word_37B5C, ax
    mov bx, 56A0h
    push si
    call far ptr sub_3378C
    pop si
    inc si
    inc word_37EF0
    dec word_37EF2
    jz short loc_22403
    jmp loc_22334
loc_22403:
    pop word_37559
    pop word_37557
    call far ptr sub_337EB
sub_21A86 endp
; ------------------------------seg002:0x99b------------------------------
    retn
; ------------------------------seg002:0x9a1------------------------------
sub_22411 proc near
    mov ax, word_3C8B4
    mov word_37B7E, ax
    mov word_37B9C, ax
    mov word_37BBA, ax
    mov word_37BD8, ax
    mov byte_37C24, 0
loc_22425:
    cmp byte_37C24, 1
    jz short loc_2242F
    jmp loc_22545
loc_2242F:
    mov ax, 64h
    mov word_37BF7, ax
    mov al, 8
    mov byte_37BF9, al
    mov ax, 0Ah
    mov word_37BFA, ax
    mov al, 0
    mov byte_37BFC, al
    mov ax, 66h
    mov word_37BFD, ax
    mov ax, 0CCh
    mov word_37BFF, ax
    mov al, 88h
    mov byte_37BF6, al
    mov ax, 12h
    mov word_37C01, ax
    mov ax, 0AFh
    mov word_37C03, ax
    mov ax, 4
    mov word_37C05, ax
    mov ax, 2
    mov word_37C07, ax
    mov ax, 0FFE9h
    mov word_37C09, ax
    mov ax, 0FFF8h
    mov word_37C0B, ax
    mov ax, 9
    mov word_37C0D, ax
    mov ax, 17h
    mov word_37C0F, ax
    mov ax, 1Ah
    mov word_37C11, ax
    mov al, 34h
    mov byte_37C13, al
    mov ax, 1Fh
    mov word_37C14, ax
    mov ax, 0Dh
    mov word_37C16, ax
    mov ax, 50h
    mov word_37C18, ax
    mov ax, 9Fh
    mov word_37C1A, ax
    call far ptr sub_337FA
    mov word_37C1C, ax
    mov ax, 42h
    mov word_37C1E, ax
    mov ax, 25h
    mov word_37C20, ax
    mov ax, 6Ch
    mov word_37C22, ax
    mov ax, 44h
    mov word_37B34, ax
    mov ax, 60h
    mov word_37B36, ax
    mov ax, 2
    mov word_37B32, ax
    mov word_37B48, ax
    mov word_37B5E, ax
    mov word_37B74, ax
    mov ax, 3Bh
    mov word_37B46, ax
    mov ax, 82h
    mov word_37B4E, ax
    mov ax, 0BCh
    mov word_37B50, ax
    mov ax, 93h
    mov word_37B9E, ax
    mov ax, 14h
    mov word_37BA0, ax
    mov ax, 99h
    mov word_37BA4, ax
    mov ax, 4Ch
    mov word_37BA6, ax
    mov ax, 0Dh
    mov word_37BA8, ax
    mov ax, 9
    mov word_37BAA, ax
    mov ax, 82h
    mov word_37B86, ax
    mov ax, 40h
    mov word_37B88, ax
    mov ax, 3Bh
    mov word_37B8A, ax
    mov ax, 2
    mov word_37B8C, ax
    mov ax, 44h
    mov word_37B60, ax
    mov ax, 7Fh
    mov word_37B64, ax
    mov ax, 0C3h
    mov word_37B66, ax
    mov ax, 3Fh
    mov word_37B72, ax
    retn
loc_22545:
    mov ax, 5Eh
    mov word_37BF7, ax
    mov al, 11h
    mov byte_37BF9, al
    mov ax, 14h
    mov word_37BFA, ax
    mov al, 1
    mov byte_37BFC, al
    mov ax, 31h
    mov word_37BFD, ax
    mov ax, 0FFh
    mov word_37BFF, ax
    mov al, 6Dh
    mov byte_37BF6, al
    mov ax, 2Dh
    mov word_37C01, ax
    mov ax, 0F8h
    mov word_37C03, ax
    mov ax, 0Ah
    mov word_37C05, ax
    mov ax, 5
    mov word_37C07, ax
    mov ax, 0FFC4h
    mov word_37C09, ax
    mov ax, 0FFF1h
    mov word_37C0B, ax
    mov ax, 10h
    mov word_37C0D, ax
    mov ax, 3Ch
    mov word_37C0F, ax
    mov ax, 34h
    mov word_37C11, ax
    mov al, 68h
    mov byte_37C13, al
    mov ax, 4Fh
    mov word_37C14, ax
    mov ax, 24h
    mov word_37C16, ax
    mov ax, 38h
    mov word_37C18, ax
    mov ax, 9Fh
    mov word_37C1A, ax
    call far ptr sub_337FF
sub_22411 endp
; ------------------------------seg002:0xb4f------------------------------
    mov word_37C1C, ax
    mov ax, 0A0h
    mov word_37C1E, ax
    mov ax, 4Ch
    mov word_37C20, ax
    mov ax, 3Ch
    mov word_37C22, ax
    mov ax, 1Ah
    mov word_37B34, ax
    mov ax, 56h
    mov word_37B36, ax
    mov ax, 0
    mov word_37B32, ax
    mov word_37B48, ax
    mov word_37B5E, ax
    mov word_37B74, ax
    mov ax, 0Ah
    mov word_37B46, ax
    mov ax, 5Ah
    mov word_37B4E, ax
    mov ax, 0E6h
    mov word_37B50, ax
    mov ax, 82h
    mov word_37B9E, ax
    mov ax, 26h
    mov word_37BA0, ax
    mov ax, 93h
    mov word_37BA4, ax
    mov ax, 30h
    mov word_37BA6, ax
    mov ax, 19h
    mov word_37BA8, ax
    mov ax, 0Fh
    mov word_37BAA, ax
    mov ax, 5Ah
    mov word_37B86, ax
    mov ax, 10h
    mov word_37B88, ax
    mov ax, 8Dh
    mov word_37B8A, ax
    mov ax, 3
    mov word_37B8C, ax
    mov ax, 14h
    mov word_37B60, ax
    mov ax, 4Eh
    mov word_37B64, ax
    mov ax, 0F1h
    mov word_37B66, ax
    mov ax, 10h
    mov word_37B72, ax
    retn
; ------------------------------seg002:0xbeb------------------------------
sub_2265B proc far
    call sub_22691
    mov bx, 0
    call sub_2266B
    mov bx, 1
    call sub_2266B
    retf
sub_2265B endp
; ------------------------------seg002:0xbfa------------------------------
; ------------------------------seg002:0xbfb------------------------------
sub_2266B proc near
    shl bx, 1
    mov ax, [bx+56DCh]
    mov [bx+56C4h], ax
    mov [bx+56B4h], ax
    mov [bx+56BCh], ax
    retn
sub_2266B endp
; ------------------------------seg002:0xc0d------------------------------
; ------------------------------seg002:0xc0e------------------------------
sub_2267E proc far
    call sub_22691
    mov bx, 0
    call sub_226BE
    mov bx, 1
    call sub_226BE
    mov ax, word_37F94
    retf
sub_2267E endp
; ------------------------------seg002:0xc20------------------------------
; ------------------------------seg002:0xc21------------------------------
sub_22691 proc near
    push bp
    xor bx, bx
    xor bp, bp
    mov cx, 0FFFFh
    mov dx, 201h
    cli
    out dx, al ;Game I/O port
    jmp short $+2
loc_226A0:
    jmp short $+2
loc_226A2:
    in al, dx ;Game I/O port
    and al, 3
    jz short loc_226B3
    shr al, 1
    adc bx, 0
    shr al, 1
    adc bp, 0
    loop loc_226A2
loc_226B3:
    sti
    mov word_37F8C, bx
    mov word_37F8E, bp
    pop bp
    retn
sub_22691 endp
; ------------------------------seg002:0xc4d------------------------------
; ------------------------------seg002:0xc4e------------------------------
sub_226BE proc near
    shl bx, 1
    mov ax, [bx+56DCh]
    mov dx, ax
    sub dx, [bx+56C4h]
    jb short loc_226D3
    ja short loc_226F5
    mov ah, 80h
    jmp short loc_22713
    db 90h
loc_226D3:
    neg dx
    cmp ax, [bx+56B4h]
    ja short loc_226E8
    mov [bx+56B4h], ax
    mov [bx+56CCh], dx
    mov ah, 0
    jmp short loc_22713
    nop
loc_226E8:
    xor ax, ax
    div word ptr [bx+56CCh]
    not ax
    shr ax, 1
    jmp short loc_22713
    db 90h
loc_226F5:
    cmp ax, [bx+56BCh]
    jb short loc_22708
    mov [bx+56BCh], ax
    mov [bx+56D4h], dx
    mov ah, 0FFh
    jmp short loc_22713
    nop
loc_22708:
    xor ax, ax
    div word ptr [bx+56D4h]
    shr ax, 1
    add ah, 80h
loc_22713:
    shr bx, 1
    mov [bx+56E4h], ah
    retn
sub_226BE endp
; ------------------------------seg002:0xca9------------------------------
; ------------------------------seg002:0xcaa------------------------------
sub_2271A proc far
    mov bx, sp
    push si
    push di
    push es
    mov si, 56B4h
    les di, [bx+4]
    mov cx, 14h
    rep movsw
    pop es
    pop di
    pop si
    retf
sub_2271A endp
; ------------------------------seg002:0xcbd------------------------------
; ------------------------------seg002:0xcbe------------------------------
sub_2272E proc far
    mov bx, sp
    push si
    push di
    push ds
    push es
    lds si, [bx+4]
    mov di, 56B4h
    push ss
    pop es
    mov cx, 14h
    rep movsw
    pop es
    pop ds
    pop di
    pop si
    retf
sub_2272E endp
; ------------------------------seg002:0xcd5------------------------------
seg002 ends
;  ==============================================================================

;  ==============================================================================


seg003 segment byte public 'CODE' use16
    assume cs:seg003
    assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
; ------------------------------seg003:0x6------------------------------
sub_22746 proc far
    push ds
    mov ax, 40h
    mov ds, ax
    assume ds:nothing
    and byte ptr ds:17h, 0DFh
    xor ax, ax
    mov ss:56EAh, al
    mov ss:56EBh, ax
    mov ss:56EDh, al
    mov ss:56EEh, al
    mov ss:56EFh, al
    mov byte ptr ss:56E8h, 80h
    mov byte ptr ss:56E9h, 80h
    xor ax, ax
    mov ds, ax
    assume ds:nothing
    mov bx, 24h
    mov ax, [bx]
    mov dx, [bx+2]
    mov cs:word_228C5, ax
    mov cs:word_228C7, dx
    mov ax, 70h
    mov dx, cs
    cli
    mov [bx], ax
    mov [bx+2], dx
    sti
    pop ds
    assume ds:dseg
    retf
sub_22746 endp
; ------------------------------seg003:0x55------------------------------
; ------------------------------seg003:0x56------------------------------
sub_22796 proc far
    push ds
    xor ax, ax
    mov ds, ax
    assume ds:nothing
    mov bx, 24h
    mov ax, cs:word_228C5
    mov dx, cs:word_228C7
    cli
    mov [bx], ax
    mov [bx+2], dx
    sti
    pop ds
    assume ds:dseg
    retf
sub_22796 endp
; ------------------------------seg003:0x6f------------------------------
    db 0FBh, 9Ch, 1Eh, 6, 50h, 53h, 0B8h
    dw seg dseg
    db 8Eh, 0D8h, 0B8h, 40h, 0, 8Eh, 0C0h, 8Ah, 26h, 0EFh
    db 56h, 0Ah, 0E4h, 74h, 9, 0FEh, 0CCh, 88h, 26h, 0EFh
    db 56h, 0E9h, 0BCh, 0, 0E4h, 60h, 80h, 3Eh, 0EDh, 56h
    db 0E0h, 0A2h, 0EDh, 56h, 74h, 2Bh, 3Ch, 0E0h, 0B4h, 1
    db 74h, 0E5h, 3Ch, 0E1h, 0B4h, 3, 74h, 0DFh, 32h, 0E4h
    db 26h, 0F6h, 6, 17h, 0, 20h, 74h, 3, 80h, 0F4h, 1, 26h
    db 0F6h, 6, 17h, 0, 3, 74h, 3, 80h, 0F4h, 1, 0Ah, 0E4h
    db 74h, 3, 0E9h, 85h, 0, 8Ah, 0E0h, 24h, 7Fh, 3Ch, 51h
    db 77h, 7Dh, 2Ch, 29h, 72h, 79h, 0BBh, 0F0h, 56h, 0D7h
    db 0Ah, 0C0h, 74h, 71h, 0F6h, 0C4h, 80h, 75h, 57h, 80h
    db 3Eh, 0EAh, 56h, 0, 75h, 65h, 0A2h, 0EAh, 56h, 38h, 6
    db 0EEh, 56h, 0A2h, 0EEh, 56h, 75h, 10h, 26h, 8Bh, 1Eh
    db 6Ch, 0, 2Bh, 1Eh, 0EBh, 56h, 83h, 0FBh, 5, 0B7h, 7Fh
    db 72h, 2, 0B7h, 5Ah, 0B3h, 80h, 2Ah, 0DFh, 80h, 0C7h
    db 80h, 0A8h, 1, 74h, 4, 88h, 1Eh, 0E9h, 56h, 0A8h, 2
    db 74h, 4, 88h, 3Eh, 0E9h, 56h, 0A8h, 4, 74h, 4, 88h, 1Eh
    db 0E8h, 56h, 0A8h, 8, 74h, 4, 88h, 3Eh, 0E8h, 56h, 26h
    db 8Bh, 1Eh, 6Ch, 0, 89h, 1Eh, 0EBh, 56h, 0EBh, 15h, 38h
    db 6, 0EAh, 56h, 75h, 0Fh, 0C6h, 6, 0EAh, 56h, 0, 0C6h
    db 6, 0E8h, 56h, 80h, 0C6h, 6, 0E9h, 56h, 80h, 26h, 8Bh
    db 1Eh, 1Ah, 0, 26h, 3Bh, 1Eh, 1Ch, 0, 74h, 25h, 26h, 8Bh
    db 7, 83h, 0C3h, 2, 26h, 3Bh, 1Eh, 82h, 0, 72h, 5, 26h
    db 8Bh, 1Eh, 80h, 0, 26h, 3Bh, 1Eh, 1Ch, 0, 74h, 0Ch, 26h
    db 3Bh, 7, 75h, 7, 26h, 89h, 1Eh, 1Ah, 0, 0EBh, 0DEh, 5Bh
    db 58h, 7, 1Fh, 9Dh, 0FAh, 0EAh
word_228C5 dw 0
word_228C7 dw 0
