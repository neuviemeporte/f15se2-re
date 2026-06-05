; seg002 - HUD rendering and joystick routines
; Contains _sub_21A7A, _sub_21A7E, drawInstrumentGauges, setupInstrumentLayout, joystick routines

.MODEL large

EXTRN _byte_37C24:byte
EXTRN _byte_37C2F:byte
EXTRN _gfxModeUnset:word
EXTRN _word_380C8:word
EXTRN _word_380CA:word
EXTRN _word_380CC:word
EXTRN _word_380D0:word
EXTRN _word_3AA5A:word
EXTRN byte_37BF6:byte
EXTRN byte_37BF9:byte
EXTRN byte_37BFC:byte
EXTRN byte_37C13:byte
EXTRN byte_37C2D:byte
EXTRN byte_37C2E:byte
EXTRN byte_37C35:byte
EXTRN byte_37C3A:byte
EXTRN var_468:byte
EXTRN byte_37EEE:byte
EXTRN byte_37EEF:byte
EXTRN byte_3C6A0:byte
EXTRN unk_37565:byte
EXTRN unk_38FD0:byte
EXTRN word_37557:word
EXTRN word_37559:word
EXTRN word_37B26:word
EXTRN word_37B2E:word
EXTRN word_37B30:word
EXTRN word_37B3C:word
EXTRN word_37B44:word
EXTRN word_37B52:word
EXTRN word_37B5A:word
EXTRN word_37B5C:word
EXTRN word_37B68:word
EXTRN word_37B70:word
EXTRN word_37B7E:word
EXTRN word_37B82:word
EXTRN word_37B84:word
EXTRN word_37B9C:word
EXTRN word_37BA2:word
EXTRN word_37BC0:word
EXTRN word_37BDE:word
EXTRN word_37BF7:word
EXTRN word_37BFA:word
EXTRN word_37BFD:word
EXTRN word_37BFF:word
EXTRN word_37C01:word
EXTRN word_37C03:word
EXTRN word_37C05:word
EXTRN word_37C07:word
EXTRN word_37C09:word
EXTRN word_37C0B:word
EXTRN word_37C0D:word
EXTRN word_37C0F:word
EXTRN word_37C11:word
EXTRN word_37C14:word
EXTRN word_37C16:word
EXTRN word_37C18:word
EXTRN word_37C1A:word
EXTRN word_37C1C:word
EXTRN word_37C1E:word
EXTRN word_37C20:word
EXTRN word_37C22:word
EXTRN word_37C25:word
EXTRN word_37C27:word
EXTRN word_37C29:word
EXTRN word_37C2B:word
EXTRN word_37C30:word
EXTRN word_37C32:word
EXTRN word_37C36:word
EXTRN word_37EF0:word
EXTRN word_37EF2:word
EXTRN word_37F50:word
EXTRN word_37F52:word
EXTRN word_37F54:word
EXTRN word_37F56:word
EXTRN word_37F58:word
EXTRN word_37F5A:word
EXTRN word_37F5C:word
EXTRN word_37F5E:word
EXTRN word_37F60:word
EXTRN word_37F62:word
EXTRN word_37F6C:word
EXTRN word_37F74:word
EXTRN word_37F7C:word
EXTRN word_37F84:word
EXTRN word_37F8C:word
EXTRN word_37F8E:word
EXTRN _joyAxes:byte

; External overlay slot calls (far)
EXTRN _gfx_getDisplayPage:PROC
EXTRN gfx_fillDirty:PROC
EXTRN gfx_complexRender:PROC
EXTRN gfx_setPageDirect:PROC
EXTRN gfx_drawLine:PROC
EXTRN gfx_resetBlitOffset:PROC
EXTRN gfx_blitTransparent:PROC
EXTRN gfx_copyBlock:PROC
EXTRN gfx_blitVariant:PROC
EXTRN gfx_blitCore:PROC
EXTRN gfx_getAuxSize:PROC
EXTRN gfx_drawStringUnclipped:PROC
EXTRN gfx_setBlitOffset3:PROC
EXTRN gfx_getBlitOffset:PROC
EXTRN gfx_setClipVal1:PROC

; External routines in other segments
EXTRN sub_21526:PROC
EXTRN lookupSineFar:PROC

; External data variables
EXTRN _gfxBufPtr:WORD
EXTRN word_37B7E:WORD
EXTRN word_37B9C:WORD
EXTRN word_37BBA:WORD
EXTRN word_37BD8:WORD
EXTRN _byte_37C24:BYTE
EXTRN word_37BF7:WORD
EXTRN byte_37BF9:BYTE
EXTRN word_37BFA:WORD
EXTRN byte_37BFC:BYTE
EXTRN word_37BFD:WORD
EXTRN word_37BFF:WORD
EXTRN byte_37BF6:BYTE
EXTRN word_37C01:WORD
EXTRN word_37C03:WORD
EXTRN word_37C05:WORD
EXTRN word_37C07:WORD
EXTRN word_37C09:WORD
EXTRN word_37C0B:WORD
EXTRN word_37C0D:WORD
EXTRN word_37C0F:WORD
EXTRN word_37C11:WORD
EXTRN byte_37C13:BYTE
EXTRN word_37C14:WORD
EXTRN word_37C16:WORD
EXTRN word_37C18:WORD
EXTRN word_37C1A:WORD
EXTRN word_37C1C:WORD
EXTRN word_37C1E:WORD
EXTRN word_37C20:WORD
EXTRN word_37C22:WORD
EXTRN word_37B34:WORD
EXTRN word_37B36:WORD
EXTRN word_37B32:WORD
EXTRN word_37B48:WORD
EXTRN word_37B5E:WORD
EXTRN word_37B74:WORD
EXTRN word_37B46:WORD
EXTRN word_37B4E:WORD
EXTRN word_37B50:WORD
EXTRN word_37B9E:WORD
EXTRN word_37BA0:WORD
EXTRN word_37BA4:WORD
EXTRN word_37BA6:WORD
EXTRN word_37BA8:WORD
EXTRN word_37BAA:WORD
EXTRN word_37B86:WORD
EXTRN word_37B88:WORD
EXTRN word_37B8A:WORD
EXTRN word_37B8C:WORD
EXTRN word_37B60:WORD
EXTRN word_37B64:WORD
EXTRN word_37B66:WORD
EXTRN word_37B72:WORD
EXTRN joyData:BYTE

seg002 SEGMENT BYTE PUBLIC 'CODE'
ASSUME CS:seg002, DS:DGROUP, SS:DGROUP

    ; 10 bytes padding at start (offsets 0x0000-0x0009)
    db 10 dup(0)

; offset 0x000A
    PUBLIC _sub_21A7A
_sub_21A7A proc far
    call drawInstrumentGauges
    retf
_sub_21A7A endp

; offset 0x000E
    PUBLIC _sub_21A7E
_sub_21A7E proc far
    call setupInstrumentLayout
    retf
_sub_21A7E endp

    ; 4 bytes padding (offsets 0x0012-0x0015)
    db 4 dup(0)

; offset 0x0016
    PUBLIC drawInstrumentGauges
drawInstrumentGauges proc near
    call far ptr _gfx_getDisplayPage
    sub AH,AH
    mov [word_37B26],AX
    mov [word_37B3C],AX
    mov [word_37B52],AX
    mov [word_37B68],AX
    mov [word_37BA2],AX
    mov [word_37B84],AX
    mov [word_37BDE],AX
    mov [word_37BC0],AX
    mov BP,offset word_37B26
    mov AX,[_word_3AA5A]
    mov DH,32h
    div DH
    mov DL,AL
    dec DL
    mov CL,byte ptr [byte_37BFC]
    db 086h, 0C4h ; xchg al,ah
    sub AH,AH
    shl AX,CL
    mov DH,5h
    div DH
    add AL,byte ptr [word_37BF7]
    mov byte ptr [word_37B30],AL
    mov byte ptr [byte_37C35],DL
    sub AL,byte ptr [byte_37BF9]
    mov byte ptr [word_37C2B],AL
    shl DL,1h
    sub DH,DH
    mov DI,DX
    mov byte ptr [byte_37C2E],4h
loc_21a7_006e:
    mov AL,byte ptr [word_37BFA]
    sub byte ptr [word_37B30],AL
    mov AX,[word_37BFD]
    mov [word_37B2E],AX
    cmp DI,28h
    jc loc_21a7_008f
    sub DI,DI
    dec byte ptr [byte_37C2E]
    mov AX,[word_37BFA]
    sub word ptr [word_37C2B],AX
    jmp loc_21a7_006e
loc_21a7_008f:
    mov AX,word ptr [DI+5392h]
    mov [word_37C30],AX
    mov AX,word ptr [DI+53E2h]
    mov [word_37C32],AX
    mov BX,offset word_37C30
    push DI
    call far ptr gfx_fillDirty
    pop DI
    inc DI
    inc DI
    dec byte ptr [byte_37C2E]
    jnz loc_21a7_006e
    mov SI,0h
    mov BX,word ptr [word_37C2B]
    mov CL,byte ptr [_byte_37C24]
    mov DL,byte ptr [byte_37C35]
    call far ptr gfx_complexRender
    mov AH,0Fh
    call far ptr gfx_setPageDirect
    cmp byte ptr [_byte_37C24],0h
    jz loc_21a7_0107
    mov AX,7Ah
    mov CX,7Ch
    mov BX,52h
    mov DX,52h
    call far ptr gfx_drawLine
    mov AX,0C4h
    mov CX,0C6h
    mov BX,52h
    mov DX,52h
    call far ptr gfx_drawLine
    mov AX,9Fh
    mov CX,9Fh
    mov BX,43h
    mov DX,44h
    call far ptr gfx_drawLine
    jmp loc_21a7_013a
    db 90h
loc_21a7_0107:
    mov AX,49h
    mov CX,4Ch
    mov BX,38h
    mov DX,38h
    call far ptr gfx_drawLine
    mov AX,0F3h
    mov CX,0F6h
    mov BX,38h
    mov DX,38h
    call far ptr gfx_drawLine
    mov AX,9Fh
    mov CX,9Fh
    mov BX,14h
    mov DX,16h
    call far ptr gfx_drawLine
loc_21a7_013a:
    call far ptr gfx_resetBlitOffset
    mov AX,[_word_380D0]
    sub DX,DX
    mov CX,3E8h
    div CX
    mov BX,AX
    dec BX
    mov AX,DX
    mov word ptr [word_37C25],DX
    sub DX,DX
    mov CL,byte ptr [byte_37BFC]
    shl AX,CL
    mov CX,64h
    div CX
    shl BX,1h
    mov DI,BX
    mov BP,offset word_37B26
    mov byte ptr [byte_37C2E],4h
    cmp DI,0h
    jge loc_21a7_01e6
    mov AX,[word_37C25]
    mov DH,64h
    div DH
    mov DL,AL
    dec DL
    mov CL,byte ptr [byte_37BFC]
    db 086h, 0C4h ; xchg al,ah
    sub AH,AH
    shl AX,CL
    mov DH,0Ah
    div DH
    add AL,byte ptr [word_37BF7]
    mov byte ptr [word_37B30],AL
    mov byte ptr [byte_37C35],DL
    sub AL,byte ptr [byte_37BF9]
    mov byte ptr [word_37C2B],AL
    shl DL,1h
    sub DH,DH
    mov DI,DX
loc_21a7_01a1:
    mov AL,byte ptr [word_37BFA]
    sub byte ptr [word_37B30],AL
    mov AX,[word_37BFF]
    mov [word_37B2E],AX
    cmp DI,28h
    jc loc_21a7_01c2
    sub DI,DI
    dec byte ptr [byte_37C2E]
    mov AX,[word_37BFA]
    sub word ptr [word_37C2B],AX
    jmp loc_21a7_01a1
loc_21a7_01c2:
    mov AL,byte ptr [DI+5433h]
    mov [var_468],AL
    mov BX,offset var_468
    push DI
    call far ptr gfx_fillDirty
    pop DI
    inc DI
    inc DI
    dec byte ptr [byte_37C2E]
    jz loc_21a7_022a
    cmp DI,14h
    jc loc_21a7_01a1
    mov DI,2h
    jmp loc_21a7_01f9
    db 90h
loc_21a7_01e6:
    add AX,word ptr [word_37BF7]
    mov [word_37B30],AX
    mov byte ptr [byte_37C35],2h
    sub AL,byte ptr [byte_37BF9]
    mov byte ptr [word_37C2B],AL
loc_21a7_01f9:
    mov AL,byte ptr [word_37BFA]
    sub byte ptr [word_37B30],AL
    mov AX,[word_37BFF]
    mov [word_37B2E],AX
    cmp DI,0h
    jnz loc_21a7_0211
    mov BX,offset var_468+4
    jmp loc_21a7_021b
    db 90h
loc_21a7_0211:
    mov AX,word ptr [DI+5432h]
    mov [word_37C36],AX
    mov BX,offset word_37C36
loc_21a7_021b:
    push DI
    call far ptr gfx_fillDirty
    pop DI
    inc DI
    inc DI
    dec byte ptr [byte_37C2E]
    jnz loc_21a7_01f9
loc_21a7_022a:
    mov SI,2h
    mov BX,word ptr [word_37C2B]
    mov CL,byte ptr [_byte_37C24]
    mov DL,byte ptr [byte_37C35]
    call far ptr gfx_complexRender
    mov AX,[_word_380C8]
    sub AX,2000h
    mov DL,AH
    and AX,1F80h
    shl AX,1h
    db 086h, 0C4h ; xchg al,ah
    mov DH,byte ptr [word_37C01]
    mul DH
    shr AX,1h
    shr AX,1h
    shr AX,1h
    shr AX,1h
    shr AX,1h
    shr AX,1h
    mov [byte_37C2D],AL
    db 086h, 0C4h ; xchg al,ah
    mov AL,[byte_37BF6]
    sub AL,AH
    sub AH,AH
    mov [word_37C29],AX
    mov [word_37B44],AX
    sub DH,DH
    shr DX,1h
    shr DX,1h
    and DX,38h
    mov word ptr [word_37C27],DX
    mov BX,offset byte_37C3A+132
    add BX,DX
    mov BP,offset word_37B3C
    call far ptr gfx_blitTransparent
    mov BX,offset byte_37C3A+132
    add word ptr [word_37C27],8h
    and word ptr [word_37C27],3Fh
    add BX,word ptr [word_37C27]
    mov AX,[word_37C29]
    add AX,word ptr [word_37C01]
    mov [word_37C29],AX
    mov [word_37B44],AX
    call far ptr gfx_copyBlock
    mov BX,offset byte_37C3A+132
    add word ptr [word_37C27],8h
    and word ptr [word_37C27],3Fh
    add BX,word ptr [word_37C27]
    mov AX,[word_37C29]
    add AX,word ptr [word_37C01]
    mov [word_37C29],AX
    mov [word_37B44],AX
    call far ptr gfx_copyBlock
    mov AX,[word_37C03]
    cmp word ptr [word_37C29],AX
    jnc loc_21a7_0351
    mov BX,offset byte_37C3A+132
    add word ptr [word_37C27],8h
    and word ptr [word_37C27],3Fh
    add BX,word ptr [word_37C27]
    mov AX,word ptr [BX]
    mov word ptr [BX+4h],AX
    mov AX,word ptr [BX+2h]
    mov word ptr [BX+6h],AX
    add BX,4h
    mov AX,[word_37C29]
    add AX,word ptr [word_37C01]
    mov [word_37C29],AX
    mov [word_37B44],AX
    call far ptr gfx_blitVariant
    mov AL,[byte_37C2D]
    sub AH,AH
    mov DL,byte ptr [word_37C05]
    div DL
    db 086h, 0C4h ; xchg al,ah
    sub AH,AH
    test word ptr [_word_380C8],2000h
    jz loc_21a7_0326
    add AX,word ptr [word_37C07]
loc_21a7_0326:
    cmp AX,word ptr [word_37C05]
    jl loc_21a7_0330
    sub AX,word ptr [word_37C05]
loc_21a7_0330:
    mov DI,AX
    shl DI,1h
    cmp byte ptr [_byte_37C24],1h
    jnz loc_21a7_0342
    mov AX,word ptr [DI+5512h]
    jmp loc_21a7_0346
    db 90h
loc_21a7_0342:
    mov AX,word ptr [DI+54FEh]
loc_21a7_0346:
    mov [word_37B82],AX
    mov BP,offset word_37B7E
    call far ptr gfx_blitCore
loc_21a7_0351:
    cmp byte ptr [_byte_37C24],0h
    jz loc_21a7_035b
    jmp loc_21a7_03dc
loc_21a7_035b:
    mov AX,2Eh
    mov CX,2Eh
    mov BX,60h
    mov DX,0Fh
    call far ptr gfx_drawLine
    mov AX,112h
    mov CX,112h
    mov BX,60h
    mov DX,0Fh
    call far ptr gfx_drawLine
    mov AH,8h
    call far ptr gfx_setPageDirect
    mov AX,2Dh
    mov CX,2Dh
    mov BX,60h
    mov DX,0Fh
    call far ptr gfx_drawLine
    mov AX,113h
    mov CX,113h
    mov BX,60h
    mov DX,0Fh
    call far ptr gfx_drawLine
    mov AX,113h
    mov CX,0E8h
    mov BX,0Fh
    mov DX,3h
    call far ptr gfx_drawLine
    mov AX,0E8h
    mov CX,5Ah
    mov BX,3h
    mov DX,3h
    call far ptr gfx_drawLine
    mov AX,2Dh
    mov CX,59h
    mov BX,0Fh
    mov DX,3h
    call far ptr gfx_drawLine
    jmp loc_21a7_045a
    db 90h
loc_21a7_03dc:
    mov AX,67h
    mov CX,67h
    mov BX,60h
    mov DX,3Fh
    call far ptr gfx_drawLine
    mov AX,0D9h
    mov CX,0D9h
    mov BX,60h
    mov DX,3Fh
    call far ptr gfx_drawLine
    mov AH,8h
    call far ptr gfx_setPageDirect
    mov AX,66h
    mov CX,66h
    mov BX,60h
    mov DX,3Fh
    call far ptr gfx_drawLine
    mov AX,0DAh
    mov CX,0DAh
    mov BX,60h
    mov DX,3Fh
    call far ptr gfx_drawLine
    mov AX,0D9h
    mov CX,0C4h
    mov BX,3Fh
    mov DX,39h
    call far ptr gfx_drawLine
    mov AX,0C4h
    mov CX,7Ch
    mov BX,39h
    mov DX,39h
    call far ptr gfx_drawLine
    mov AX,7Ch
    mov CX,67h
    mov BX,39h
    mov DX,3Fh
    call far ptr gfx_drawLine
loc_21a7_045a:
    call far ptr gfx_resetBlitOffset
    cmp byte ptr [_byte_37C2F],0h
    jz loc_21a7_046e
    mov BP,offset word_37B9C
    call far ptr gfx_blitCore
loc_21a7_046e:
    mov BX,offset unk_38FD0
    mov BP,offset word_37B68
    mov AX,[word_37C22]
    mov [word_37B70],AX
    call far ptr gfx_copyBlock
    mov AX,[_word_380CA]
    db 03Dh, 000h, 000h ; cmp AX,0 (force imm16 encoding)
    jge loc_21a7_0489
    neg AX
loc_21a7_0489:
    shr AX,1h
    shr AX,1h
    shr AX,1h
    shr AX,1h
    shr AX,1h
    shr AX,1h
    mov BX,168h
    mul BX
    mov AL,AH
    mov AH,DL
    mov BL,28h
    div BL
    mov CH,AL
    mov AL,AH
    sub AH,AH
    mov BH,byte ptr [word_37C11]
    mul BH
    mov BX,28h
    mov DX,0h
    div BX
    cmp word ptr [_word_380CA],0h
    jge loc_21a7_04c5
    mov AH,byte ptr [word_37C11]
    sub AH,AL
    db 086h, 0E0h ; xchg ah,al
loc_21a7_04c5:
    add AL,byte ptr [byte_37C13]
    sub AH,AH
    mov BX,AX
    cmp word ptr [_word_380CA],0h
    jge loc_21a7_04d8
    neg CH
    dec CH
loc_21a7_04d8:
    mov AL,CH
    cbw
    db 02Dh, 002h, 000h ; sub AX,2 (force imm16 encoding)
    mov [word_37EF0],AX
    mov DX,AX
    mov CL,5h
    mov DI,0h
    mov SI,DI
    mov CH,0h
loc_21a7_04ec:
    cmp DL,9h
    jz loc_21a7_0504
    jg loc_21a7_0507
    cmp DL,0F7h
    jz loc_21a7_050d
    jl loc_21a7_050a
    cmp DL,0h
    jz loc_21a7_050d
    jg loc_21a7_0564
    jmp loc_21a7_06d2
loc_21a7_0504:
    jmp loc_21a7_061c
loc_21a7_0507:
    jmp loc_21a7_05c0
loc_21a7_050a:
    jmp loc_21a7_0660
loc_21a7_050d:
    mov AX,[word_37C09]
    mov word ptr [DI+5526h],AX
    mov AX,[word_37C0B]
    mov word ptr [DI+5528h],AX
    mov AX,[word_37C0D]
    mov word ptr [DI+552Ah],AX
    mov AX,[word_37C0F]
    mov word ptr [DI+552Ch],AX
    mov word ptr [DI+5596h],BX
    mov word ptr [DI+5598h],BX
    mov word ptr [DI+559Ah],BX
    mov word ptr [DI+559Ch],BX
    mov byte ptr [SI+5606h],1h
    mov byte ptr [SI+5607h],1h
    mov word ptr [SI+5622h],DI
    add DI,6h
    mov word ptr [SI+5623h],DI
    add DI,2h
    add SI,2h
    sub BX,word ptr [word_37C11]
    add CH,2h
    inc DL
    dec CL
    jnz loc_21a7_04ec
    jmp loc_21a7_0741
loc_21a7_0564:
    mov AX,[word_37C09]
    mov word ptr [DI+5526h],AX
    mov word ptr [DI+5528h],AX
    mov AX,[word_37C0F]
    mov word ptr [DI+552Ah],AX
    mov word ptr [DI+552Ch],AX
    mov word ptr [DI+5598h],BX
    mov word ptr [DI+559Ah],BX
    mov AX,BX
    db 005h, 005h, 000h ; add AX,5 (force imm16 encoding)
    mov word ptr [DI+5596h],AX
    mov word ptr [DI+559Ch],AX
    mov byte ptr [SI+5606h],3h
    mov byte ptr [SI+5607h],0h
    add DI,2h
    mov word ptr [SI+5622h],DI
    add DI,2h
    mov word ptr [SI+5623h],DI
    add DI,4h
    add SI,2h
    sub BX,word ptr [word_37C11]
    add CH,3h
    inc DL
    dec CL
    jnz loc_21a7_05bd
    jmp loc_21a7_0741
loc_21a7_05bd:
    jmp loc_21a7_04ec
loc_21a7_05c0:
    mov AX,[word_37C09]
    mov word ptr [DI+5526h],AX
    mov word ptr [DI+5528h],AX
    mov AX,[word_37C0F]
    mov word ptr [DI+552Ah],AX
    mov word ptr [DI+552Ch],AX
    mov word ptr [DI+5598h],BX
    mov word ptr [DI+559Ah],BX
    mov AX,BX
    db 02Dh, 005h, 000h ; sub AX,5 (force imm16 encoding)
    mov word ptr [DI+5596h],AX
    mov word ptr [DI+559Ch],AX
    mov byte ptr [SI+5606h],3h
    mov byte ptr [SI+5607h],0h
    add DI,2h
    mov word ptr [SI+5622h],DI
    add DI,2h
    mov word ptr [SI+5623h],DI
    add DI,4h
    add SI,2h
    sub BX,word ptr [word_37C11]
    add CH,3h
    inc DL
    dec CL
    jnz loc_21a7_0619
    jmp loc_21a7_0741
loc_21a7_0619:
    jmp loc_21a7_04ec
loc_21a7_061c:
    mov AX,[word_37C09]
    mov word ptr [DI+5526h],AX
    mov AX,[word_37C0F]
    mov word ptr [DI+5528h],AX
    mov word ptr [DI+5596h],BX
    mov word ptr [DI+5598h],BX
    mov byte ptr [SI+5606h],1h
    mov byte ptr [SI+5607h],0h
    mov word ptr [SI+5622h],DI
    add DI,2h
    mov word ptr [SI+5623h],DI
    add DI,2h
    add SI,2h
    sub BX,word ptr [word_37C11]
    add CH,1h
    inc DL
    dec CL
    jnz loc_21a7_065d
    jmp loc_21a7_0741
loc_21a7_065d:
    jmp loc_21a7_04ec
loc_21a7_0660:
    mov AX,[word_37C09]
    mov word ptr [DI+5526h],AX
    mov word ptr [DI+5528h],AX
    mov AX,[word_37C0B]
    mov word ptr [DI+552Ah],AX
    mov AX,[word_37C0D]
    mov word ptr [DI+552Ch],AX
    mov AX,[word_37C0F]
    mov word ptr [DI+552Eh],AX
    mov word ptr [DI+5530h],AX
    mov word ptr [DI+5598h],BX
    mov word ptr [DI+559Ah],BX
    mov word ptr [DI+559Ch],BX
    mov word ptr [DI+559Eh],BX
    mov AX,BX
    db 005h, 005h, 000h ; add AX,5 (force imm16 encoding)
    mov word ptr [DI+5596h],AX
    mov word ptr [DI+55A0h],AX
    mov byte ptr [SI+5606h],2h
    mov byte ptr [SI+5607h],2h
    add DI,2h
    mov word ptr [SI+5622h],DI
    add DI,6h
    mov word ptr [SI+5623h],DI
    add DI,4h
    add SI,2h
    sub BX,word ptr [word_37C11]
    add CH,4h
    inc DL
    dec CL
    jnz loc_21a7_06cf
    jmp loc_21a7_0741
    db 90h
loc_21a7_06cf:
    jmp loc_21a7_04ec
loc_21a7_06d2:
    mov AX,[word_37C09]
    mov word ptr [DI+5526h],AX
    mov word ptr [DI+5528h],AX
    mov AX,[word_37C0B]
    mov word ptr [DI+552Ah],AX
    mov AX,[word_37C0D]
    mov word ptr [DI+552Ch],AX
    mov AX,[word_37C0F]
    mov word ptr [DI+552Eh],AX
    mov word ptr [DI+5530h],AX
    mov word ptr [DI+5598h],BX
    mov word ptr [DI+559Ah],BX
    mov word ptr [DI+559Ch],BX
    mov word ptr [DI+559Eh],BX
    mov AX,BX
    db 02Dh, 005h, 000h ; sub AX,5 (force imm16 encoding)
    mov word ptr [DI+5596h],AX
    mov word ptr [DI+55A0h],AX
    mov byte ptr [SI+5606h],2h
    mov byte ptr [SI+5607h],2h
    add DI,2h
    mov word ptr [SI+5622h],DI
    add DI,6h
    mov word ptr [SI+5623h],DI
    add DI,4h
    add SI,2h
    sub BX,word ptr [word_37C11]
    add CH,4h
    inc DL
    dec CL
    jz loc_21a7_0741
    jmp loc_21a7_04ec
loc_21a7_0741:
    mov byte ptr [byte_37EEF],CH
    sub DI,2h
    mov BX,word ptr [_word_380CC]
    neg BX
    add BX,4000h
    call far ptr lookupSineFar
    mov BP,BX
    mov BX,word ptr [_word_380CC]
    neg BX
    call far ptr lookupSineFar
loc_21a7_0764:
    mov AX,BP
    imul word ptr [DI+5526h]
    shl AX,1h
    rcl DX,1h
    mov SI,DX
    mov AX,BP
    imul word ptr [DI+5596h]
    push BX
    push CX
    mov BX,AX
    mov CX,DX
    shl AX,1h
    rcl DX,1h
    add AX,BX
    adc DX,CX
    sar DX,1h
    pop CX
    pop BX
    mov CX,DX
    mov AX,BX
    imul word ptr [DI+5596h]
    shl AX,1h
    rcl DX,1h
    sub SI,DX
    mov AX,BX
    imul word ptr [DI+5526h]
    push BX
    push CX
    mov BX,AX
    mov CX,DX
    shl AX,1h
    rcl DX,1h
    add AX,BX
    adc DX,CX
    sar DX,1h
    pop CX
    pop BX
    add CX,DX
    mov word ptr [DI+5526h],SI
    mov word ptr [DI+5596h],CX
    sub DI,2h
    jns loc_21a7_0764
    push word ptr [word_37557]
    push word ptr [word_37559]
    cmp byte ptr [byte_3C6A0],0h
    jnz loc_21a7_07cf
    jmp loc_21a7_0993
loc_21a7_07cf:
    mov AH,7h
    cmp byte ptr [_gfxModeUnset],0h
    jz loc_21a7_07da
    mov AH,0h
loc_21a7_07da:
    call far ptr gfx_setPageDirect
    mov AX,[word_37C1C]
    call far ptr gfx_getAuxSize
    mov AX,[word_37C1E]
    mov [word_37557],AX
    mov AX,[word_37C20]
    mov [word_37559],AX
    mov DI,0h
    mov SI,DI
    mov byte ptr [byte_37EEE],0h
loc_21a7_07fd:
    mov AX,word ptr [DI+5526h]
    add AX,word ptr [word_37C14]
    mov [word_37559+4],AX
    mov AX,word ptr [DI+5596h]
    add AX,word ptr [word_37C16]
    mov word ptr [unk_37565-4],AX
    mov AX,word ptr [DI+5528h]
    add AX,word ptr [word_37C14]
    mov [word_37559+6],AX
    mov AX,word ptr [DI+5598h]
    add AX,word ptr [word_37C16]
    mov word ptr [unk_37565-2],AX
    push DI
    push SI
    call far ptr sub_21526
    pop SI
    pop DI
    add DI,2h
    inc byte ptr [byte_37EEE]
    dec byte ptr [SI+5606h]
    jnz loc_21a7_07fd
    add DI,2h
    inc SI
    cmp byte ptr [SI+5606h],0h
    jnz loc_21a7_084b
    inc SI
loc_21a7_084b:
    mov BL,byte ptr [byte_37EEF]
    cmp byte ptr [byte_37EEE],BL
    jl loc_21a7_07fd
    call far ptr gfx_resetBlitOffset
    add word ptr [word_37EF0],0Bh
    mov SI,0h
    mov word ptr [word_37EF2],5h
    mov BP,offset word_37B52
    mov AX,[_word_380CC]
    shr AH,1h
    shr AH,1h
    db 086h, 0E0h ; xchg ah,al
    sub AH,AH
    mov DI,AX
    shl DI,1h
    mov AX,word ptr [DI+5076h]
    mov [word_37F5C],AX
    mov AX,word ptr [DI+50F6h]
    mov [word_37F5E],AX
    mov AX,word ptr [DI+5176h]
    mov [word_37F60],AX
    mov AX,word ptr [DI+51F6h]
    mov [word_37F62],AX
    mov AX,[_word_380CC]
    add AH,80h
    shr AH,1h
    shr AH,1h
    db 086h, 0E0h ; xchg ah,al
    sub AH,AH
    mov DI,AX
    shl DI,1h
    mov AX,word ptr [DI+5076h]
    mov [word_37F54],AX
    mov AX,word ptr [DI+50F6h]
    mov [word_37F56],AX
    mov AX,word ptr [DI+5176h]
    mov [word_37F58],AX
    mov AX,word ptr [DI+51F6h]
    mov [word_37F5A],AX
loc_21a7_08c4:
    mov DI,word ptr [word_37EF0]
    shl DI,1h
    shl DI,1h
    mov AX,word ptr [DI+5644h]
    mov [word_37F50],AX
    mov AX,word ptr [DI+5646h]
    mov [word_37F52],AX
    mov BX,DI
    mov DI,word ptr [SI+5622h]
    and DI,0FFh
    mov AX,word ptr [DI+5526h]
    cmp BX,2Ch
    jge loc_21a7_08f4
    add AX,word ptr [word_37F58]
    jmp loc_21a7_08f8
    db 90h
loc_21a7_08f4:
    add AX,word ptr [word_37F54]
loc_21a7_08f8:
    add AX,word ptr [word_37C1A]
    mov [word_37B5A],AX
    mov AX,word ptr [DI+5596h]
    cmp DI,2Ch
    jge loc_21a7_090f
    add AX,word ptr [word_37F5A]
    jmp loc_21a7_0913
    db 90h
loc_21a7_090f:
    add AX,word ptr [word_37F56]
loc_21a7_0913:
    add AX,word ptr [word_37C18]
    mov [word_37B5C],AX
    mov BX,offset word_37F50
    push SI
    call far ptr gfx_drawStringUnclipped
    pop SI
    inc SI
    mov DI,word ptr [word_37EF0]
    shl DI,1h
    shl DI,1h
    mov AX,word ptr [DI+5644h]
    mov [word_37F50],AX
    mov AX,word ptr [DI+5646h]
    mov [word_37F52],AX
    mov BX,DI
    mov DI,word ptr [SI+5622h]
    and DI,0FFh
    mov AX,word ptr [DI+5526h]
    cmp BX,2Ch
    jge loc_21a7_0955
    add AX,word ptr [word_37F60]
    jmp loc_21a7_0959
    db 90h
loc_21a7_0955:
    add AX,word ptr [word_37F5C]
loc_21a7_0959:
    add AX,word ptr [word_37C1A]
    mov [word_37B5A],AX
    mov AX,word ptr [DI+5596h]
    cmp DI,2Ch
    jge loc_21a7_0970
    add AX,word ptr [word_37F62]
    jmp loc_21a7_0974
    db 90h
loc_21a7_0970:
    add AX,word ptr [word_37F5E]
loc_21a7_0974:
    add AX,word ptr [word_37C18]
    mov [word_37B5C],AX
    mov BX,offset word_37F50
    push SI
    call far ptr gfx_drawStringUnclipped
    pop SI
    inc SI
    inc word ptr [word_37EF0]
    dec word ptr [word_37EF2]
    jz loc_21a7_0993
    jmp loc_21a7_08c4
loc_21a7_0993:
    pop word ptr [word_37559]
    pop word ptr [word_37557]
    call far ptr gfx_setBlitOffset3
    ret

drawInstrumentGauges endp

; setupInstrumentLayout - display configuration setup
    PUBLIC setupInstrumentLayout
setupInstrumentLayout proc near
    mov ax, _gfxBufPtr
    mov word_37B7E, ax
    mov word_37B9C, ax
    mov word_37BBA, ax
    mov word_37BD8, ax
    mov _byte_37C24, 0
loc_22425:
    cmp _byte_37C24, 1
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
    call far ptr gfx_getBlitOffset
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
loc_22590:
    mov ax, 10h
loc_22593:
    mov word_37C0D, ax
loc_22596:
    mov ax, 3Ch
loc_22599:
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
loc_225BF:
    call far ptr gfx_setClipVal1
loc_225C4:
    mov word_37C1C, ax
loc_225C7:
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
setupInstrumentLayout endp

; routine_167 - joystick init
    PUBLIC initJoystickCalibration
initJoystickCalibration proc far
    call routine_246
    mov BX,0
    call routine_248
    mov BX,1
    call routine_248
    retf
initJoystickCalibration endp

; routine_248 - joystick data init helper
routine_248 proc near
    shl BX,1
    mov AX,[BX+word_37F8C]
    mov [BX+word_37F74],AX
    mov word ptr [BX+joyData],AX
    mov [BX+word_37F6C],AX
    ret
routine_248 endp

; routine_166 - joystick calibration entry
    PUBLIC readCalibratedJoystick
readCalibratedJoystick proc far
    call routine_246
    mov BX,0
    call routine_247
    mov BX,1
    call routine_247
    mov AX,word ptr [_joyAxes]
    retf
readCalibratedJoystick endp

; routine_246 - joystick read (hardware port 201h)
routine_246 proc near
    push BP
    xor BX,BX
    xor BP,BP
    mov CX,0FFFFh
    mov DX,201h
    cli
    out DX,AL
    jmp short $+2
    jmp short $+2
loc_246_loop:
    in AL,DX
    and AL,3
    jz loc_246_done
    shr AL,1
    adc BX,0
    shr AL,1
    adc BP,0
    loop loc_246_loop
loc_246_done:
    sti
    mov [word_37F8C],BX
    mov [word_37F8E],BP
    pop BP
    ret
routine_246 endp

; routine_247 - joystick calibration compute
routine_247 proc near
    shl BX,1
    mov AX,[BX+word_37F8C]
    mov DX,AX
    sub DX,[BX+word_37F74]
    jc loc_247_neg
    ja loc_247_pos
    mov AH,80h
    jmp short loc_247_store
    nop
loc_247_neg:
    neg DX
    cmp AX,word ptr [BX+joyData]
    ja loc_247_neg_div
    mov word ptr [BX+joyData],AX
    mov [BX+word_37F7C],DX
    mov AH,0
    jmp short loc_247_store
    nop
loc_247_neg_div:
    xor AX,AX
    div word ptr [BX+word_37F7C]
    not AX
    shr AX,1
    jmp short loc_247_store
    nop
loc_247_pos:
    cmp AX,[BX+word_37F6C]
    jc loc_247_pos_div
    mov [BX+word_37F6C],AX
    mov [BX+word_37F84],DX
    mov AH,0FFh
    jmp short loc_247_store
    nop
loc_247_pos_div:
    xor AX,AX
    div word ptr [BX+word_37F84]
    shr AX,1
    add AH,80h
loc_247_store:
    shr BX,1
    mov [BX+_joyAxes],AH
    ret
routine_247 endp

; _restoreJoystickData - copy joystick data to caller buffer
    PUBLIC _restoreJoystickData
_restoreJoystickData proc far
    mov bx, sp
    push si
    push di
    push es
    mov si, offset joyData
    les di, [bx+4]
    mov cx, 14h
    rep movsw
    pop es
    pop di
    pop si
    retf
_restoreJoystickData endp

; _copyJoystickData - copy caller buffer to joystick data
    PUBLIC _copyJoystickData
_copyJoystickData proc far
    mov bx, sp
    push si
    push di
    push ds
    push es
    lds si, [bx+4]
    mov di, offset joyData
    push ss
    pop es
    mov cx, 14h
    rep movsw
    pop es
    pop ds
    pop di
    pop si
    retf
_copyJoystickData endp

seg002 ENDS
END
