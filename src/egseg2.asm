; seg002 - HUD rendering and joystick routines
; Contains _drawInstrumentGaugesFar, _setupInstrumentLayoutFar, drawInstrumentGauges, setupInstrumentLayout, joystick routines

.MODEL large

EXTRN _g_halfScaleRender:byte
EXTRN _g_hudDrawnFlag:byte
EXTRN _gfxModeUnset:word
EXTRN _g_ourHead:word
EXTRN _g_ourPitch:word
EXTRN _g_ourRoll:word
EXTRN _g_altitude:word
EXTRN _g_knots:word
EXTRN g_headingBase:byte
EXTRN g_tapeCursorBackShift:byte
EXTRN g_tapeScaleShift:byte
EXTRN byte_37C13:byte
EXTRN byte_37C2D:byte
EXTRN g_tapePageCounter:byte
EXTRN g_tapeRenderMode:byte
EXTRN g_compassTapeBuf:byte
EXTRN var_468:byte
EXTRN _g_tapeColumn:byte
EXTRN _g_tapeChar:byte
EXTRN _g_highGeeFlag:byte
EXTRN g_spanMinX:byte
EXTRN _g_geeStringBuf:byte
EXTRN _g_clipMaxX:word
EXTRN _g_clipMaxY:word
EXTRN _g_lineX1:word
EXTRN _g_lineX2:word
EXTRN _g_lineY1:word
EXTRN _g_lineY2:word
EXTRN g_tapeText0Page:word
EXTRN g_tapeText0X:word
EXTRN g_tapeText0Y:word
EXTRN g_tapeText1Page:word
EXTRN g_tapeText1X:word
EXTRN g_tapeText2Page:word
EXTRN g_tapeText2X:word
EXTRN g_tapeText2Y:word
EXTRN g_tapeText3Page:word
EXTRN g_tapeText3X:word
EXTRN g_tapeSprite0BufPtr:word
EXTRN g_tapeSprite0SrcY:word
EXTRN g_tapeSprite0Page:word
EXTRN g_tapeSprite1BufPtr:word
EXTRN g_tapeSprite1Page:word
EXTRN g_tapeSprite2Page:word
EXTRN g_tapeSprite3Page:word
EXTRN g_tapeOriginX:word
EXTRN g_tapeTickPitch:word
EXTRN g_speedTapeTickStep:word
EXTRN g_altTapeTickStep:word
EXTRN g_headingPixPerDeg:word
EXTRN g_compassWrapLimit:word
EXTRN g_headingModulus:word
EXTRN g_headingWrapOffset:word
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
EXTRN g_altRemainder:word
EXTRN g_compassScrollIdx:word
EXTRN g_compassDrawX:word
EXTRN g_tapeRenderX:word
EXTRN word_37C30:word
EXTRN word_37C32:word
EXTRN word_37C36:word
EXTRN _g_tapeCursorX:word
EXTRN g_tapeSegmentCount:word
EXTRN g_tapeDrawStr:word
EXTRN g_tapeDrawStrY:word
EXTRN g_tapeRollOfsB0:word
EXTRN g_tapeRollOfsB1:word
EXTRN g_tapeRollOfsB2:word
EXTRN g_tapeRollOfsB3:word
EXTRN g_tapeRollOfsA0:word
EXTRN g_tapeRollOfsA1:word
EXTRN g_tapeRollOfsA2:word
EXTRN g_tapeRollOfsA3:word
EXTRN word_37F6C:word
EXTRN word_37F74:word
EXTRN word_37F7C:word
EXTRN word_37F84:word
EXTRN g_joyCountX:word
EXTRN g_joyCountY:word
EXTRN _joyAxes:byte

; External overlay slot calls (far)
EXTRN _gfx_getDisplayPage:PROC
EXTRN gfx_fillDirty:PROC
EXTRN gfx_complexRender:PROC
EXTRN gfx_setDrawColor:PROC
EXTRN gfx_drawLine:PROC
EXTRN gfx_nop22:PROC
EXTRN gfx_blitTransparent:PROC
EXTRN gfx_copyBlock:PROC
EXTRN gfx_blitVariant:PROC
EXTRN gfx_blitCore:PROC
EXTRN gfx_setBlitOffsetReg:PROC
EXTRN gfx_drawStringUnclipped:PROC
EXTRN gfx_setBlitOffset3:PROC
EXTRN gfx_getPresetOffset1:PROC
EXTRN gfx_getPresetOffset2:PROC

; External routines in other segments
EXTRN clipLineFar:PROC
EXTRN lookupSineFar:PROC

; External data variables
EXTRN _gfxBufPtr:WORD
EXTRN g_tapeSprite0BufPtr:WORD
EXTRN g_tapeSprite1BufPtr:WORD
EXTRN g_tapeSprite2BufPtr:WORD
EXTRN g_tapeSprite3BufPtr:WORD
EXTRN _g_halfScaleRender:BYTE
EXTRN g_tapeOriginX:WORD
EXTRN g_tapeCursorBackShift:BYTE
EXTRN g_tapeTickPitch:WORD
EXTRN g_tapeScaleShift:BYTE
EXTRN g_speedTapeTickStep:WORD
EXTRN g_altTapeTickStep:WORD
EXTRN g_headingBase:BYTE
EXTRN g_headingPixPerDeg:WORD
EXTRN g_compassWrapLimit:WORD
EXTRN g_headingModulus:WORD
EXTRN g_headingWrapOffset:WORD
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
EXTRN g_tapeText0ClipTop:WORD
EXTRN g_tapeText0ClipBottom:WORD
EXTRN g_tapeText0Font:WORD
EXTRN g_tapeText1Font:WORD
EXTRN g_tapeText2Font:WORD
EXTRN g_tapeText3Font:WORD
EXTRN g_tapeText1Y:WORD
EXTRN g_tapeText1ClipX1:WORD
EXTRN g_tapeText1ClipX2:WORD
EXTRN g_tapeSprite1SrcX:WORD
EXTRN g_tapeSprite1SrcY:WORD
EXTRN g_tapeSprite1DstX:WORD
EXTRN g_tapeSprite1DstY:WORD
EXTRN g_tapeSprite1Width:WORD
EXTRN g_tapeSprite1Height:WORD
EXTRN g_tapeSprite0DstX:WORD
EXTRN g_tapeSprite0DstY:WORD
EXTRN g_tapeSprite0Width:WORD
EXTRN g_tapeSprite0Height:WORD
EXTRN g_tapeText2ClipTop:WORD
EXTRN g_tapeText2ClipX1:WORD
EXTRN g_tapeText2ClipX2:WORD
EXTRN g_tapeText3Y:WORD
EXTRN joyData:BYTE
EXTRN _g_timerTickByte:byte

seg002 SEGMENT BYTE PUBLIC 'CODE'
ASSUME CS:seg002, DS:DGROUP, SS:DGROUP

    ; 10 bytes padding at start (offsets 0x0000-0x0009)
    db 10 dup(0)

; offset 0x000A
    PUBLIC _drawInstrumentGaugesFar
_drawInstrumentGaugesFar proc far
    call drawInstrumentGauges
    retf
_drawInstrumentGaugesFar endp

; offset 0x000E
    PUBLIC _setupInstrumentLayoutFar
_setupInstrumentLayoutFar proc far
    call setupInstrumentLayout
    retf
_setupInstrumentLayoutFar endp

    ; 4 bytes padding (offsets 0x0012-0x0015)
    db 4 dup(0)

; offset 0x0016
    PUBLIC drawInstrumentGauges
drawInstrumentGauges proc near
    call far ptr _gfx_getDisplayPage
    sub AH,AH
    mov [g_tapeText0Page],AX
    mov [g_tapeText1Page],AX
    mov [g_tapeText2Page],AX
    mov [g_tapeText3Page],AX
    mov [g_tapeSprite1Page],AX
    mov [g_tapeSprite0Page],AX
    mov [g_tapeSprite3Page],AX
    mov [g_tapeSprite2Page],AX
    mov BP,offset g_tapeText0Page
    mov AX,[_g_knots]
    mov DH,32h
    div DH
    mov DL,AL
    dec DL
    mov CL,byte ptr [g_tapeScaleShift]
    db 086h, 0C4h ; xchg al,ah
    sub AH,AH
    shl AX,CL
    mov DH,5h
    div DH
    add AL,byte ptr [g_tapeOriginX]
    mov byte ptr [g_tapeText0Y],AL
    mov byte ptr [g_tapeRenderMode],DL
    sub AL,byte ptr [g_tapeCursorBackShift]
    mov byte ptr [g_tapeRenderX],AL
    shl DL,1h
    sub DH,DH
    mov DI,DX
    mov byte ptr [g_tapePageCounter],4h
loc_21a7_006e:
    mov AL,byte ptr [g_tapeTickPitch]
    sub byte ptr [g_tapeText0Y],AL
    mov AX,[g_speedTapeTickStep]
    mov [g_tapeText0X],AX
    cmp DI,28h
    jc loc_21a7_008f
    sub DI,DI
    dec byte ptr [g_tapePageCounter]
    mov AX,[g_tapeTickPitch]
    sub word ptr [g_tapeRenderX],AX
    jmp loc_21a7_006e
loc_21a7_008f:
    mov AX,word ptr [DI+offset var_468+8h]
    mov [word_37C30],AX
    mov AX,word ptr [DI+offset var_468+58h]
    mov [word_37C32],AX
    mov BX,offset word_37C30
    push DI
    call far ptr gfx_fillDirty
    pop DI
    inc DI
    inc DI
    dec byte ptr [g_tapePageCounter]
    jnz loc_21a7_006e
    mov SI,0h
    mov BX,word ptr [g_tapeRenderX]
    mov CL,byte ptr [_g_halfScaleRender]
    mov DL,byte ptr [g_tapeRenderMode]
    call far ptr gfx_complexRender
    mov AH,0Fh
    call far ptr gfx_setDrawColor
    cmp byte ptr [_g_halfScaleRender],0h
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
    call far ptr gfx_nop22
    mov AX,[_g_altitude]
    sub DX,DX
    mov CX,3E8h
    div CX
    mov BX,AX
    dec BX
    mov AX,DX
    mov word ptr [g_altRemainder],DX
    sub DX,DX
    mov CL,byte ptr [g_tapeScaleShift]
    shl AX,CL
    mov CX,64h
    div CX
    shl BX,1h
    mov DI,BX
    mov BP,offset g_tapeText0Page
    mov byte ptr [g_tapePageCounter],4h
    cmp DI,0h
    jge loc_21a7_01e6
    mov AX,[g_altRemainder]
    mov DH,64h
    div DH
    mov DL,AL
    dec DL
    mov CL,byte ptr [g_tapeScaleShift]
    db 086h, 0C4h ; xchg al,ah
    sub AH,AH
    shl AX,CL
    mov DH,0Ah
    div DH
    add AL,byte ptr [g_tapeOriginX]
    mov byte ptr [g_tapeText0Y],AL
    mov byte ptr [g_tapeRenderMode],DL
    sub AL,byte ptr [g_tapeCursorBackShift]
    mov byte ptr [g_tapeRenderX],AL
    shl DL,1h
    sub DH,DH
    mov DI,DX
loc_21a7_01a1:
    mov AL,byte ptr [g_tapeTickPitch]
    sub byte ptr [g_tapeText0Y],AL
    mov AX,[g_altTapeTickStep]
    mov [g_tapeText0X],AX
    cmp DI,28h
    jc loc_21a7_01c2
    sub DI,DI
    dec byte ptr [g_tapePageCounter]
    mov AX,[g_tapeTickPitch]
    sub word ptr [g_tapeRenderX],AX
    jmp loc_21a7_01a1
loc_21a7_01c2:
    mov AL,byte ptr [DI+offset var_468+0A9h]
    mov [var_468],AL
    mov BX,offset var_468
    push DI
    call far ptr gfx_fillDirty
    pop DI
    inc DI
    inc DI
    dec byte ptr [g_tapePageCounter]
    jz loc_21a7_022a
    cmp DI,14h
    jc loc_21a7_01a1
    mov DI,2h
    jmp loc_21a7_01f9
    db 90h
loc_21a7_01e6:
    add AX,word ptr [g_tapeOriginX]
    mov [g_tapeText0Y],AX
    mov byte ptr [g_tapeRenderMode],2h
    sub AL,byte ptr [g_tapeCursorBackShift]
    mov byte ptr [g_tapeRenderX],AL
loc_21a7_01f9:
    mov AL,byte ptr [g_tapeTickPitch]
    sub byte ptr [g_tapeText0Y],AL
    mov AX,[g_altTapeTickStep]
    mov [g_tapeText0X],AX
    cmp DI,0h
    jnz loc_21a7_0211
    mov BX,offset var_468+4
    jmp loc_21a7_021b
    db 90h
loc_21a7_0211:
    mov AX,word ptr [DI+offset var_468+0A8h]
    mov [word_37C36],AX
    mov BX,offset word_37C36
loc_21a7_021b:
    push DI
    call far ptr gfx_fillDirty
    pop DI
    inc DI
    inc DI
    dec byte ptr [g_tapePageCounter]
    jnz loc_21a7_01f9
loc_21a7_022a:
    mov SI,2h
    mov BX,word ptr [g_tapeRenderX]
    mov CL,byte ptr [_g_halfScaleRender]
    mov DL,byte ptr [g_tapeRenderMode]
    call far ptr gfx_complexRender
    mov AX,[_g_ourHead]
    sub AX,2000h
    mov DL,AH
    and AX,1F80h
    shl AX,1h
    db 086h, 0C4h ; xchg al,ah
    mov DH,byte ptr [g_headingPixPerDeg]
    mul DH
    shr AX,1h
    shr AX,1h
    shr AX,1h
    shr AX,1h
    shr AX,1h
    shr AX,1h
    mov [byte_37C2D],AL
    db 086h, 0C4h ; xchg al,ah
    mov AL,[g_headingBase]
    sub AL,AH
    sub AH,AH
    mov [g_compassDrawX],AX
    mov [g_tapeText1X],AX
    sub DH,DH
    shr DX,1h
    shr DX,1h
    and DX,38h
    mov word ptr [g_compassScrollIdx],DX
    mov BX,offset g_compassTapeBuf+132
    add BX,DX
    mov BP,offset g_tapeText1Page
    call far ptr gfx_blitTransparent
    mov BX,offset g_compassTapeBuf+132
    add word ptr [g_compassScrollIdx],8h
    and word ptr [g_compassScrollIdx],3Fh
    add BX,word ptr [g_compassScrollIdx]
    mov AX,[g_compassDrawX]
    add AX,word ptr [g_headingPixPerDeg]
    mov [g_compassDrawX],AX
    mov [g_tapeText1X],AX
    call far ptr gfx_copyBlock
    mov BX,offset g_compassTapeBuf+132
    add word ptr [g_compassScrollIdx],8h
    and word ptr [g_compassScrollIdx],3Fh
    add BX,word ptr [g_compassScrollIdx]
    mov AX,[g_compassDrawX]
    add AX,word ptr [g_headingPixPerDeg]
    mov [g_compassDrawX],AX
    mov [g_tapeText1X],AX
    call far ptr gfx_copyBlock
    mov AX,[g_compassWrapLimit]
    cmp word ptr [g_compassDrawX],AX
    jnc loc_21a7_0351
    mov BX,offset g_compassTapeBuf+132
    add word ptr [g_compassScrollIdx],8h
    and word ptr [g_compassScrollIdx],3Fh
    add BX,word ptr [g_compassScrollIdx]
    mov AX,word ptr [BX]
    mov word ptr [BX+4h],AX
    mov AX,word ptr [BX+2h]
    mov word ptr [BX+6h],AX
    add BX,4h
    mov AX,[g_compassDrawX]
    add AX,word ptr [g_headingPixPerDeg]
    mov [g_compassDrawX],AX
    mov [g_tapeText1X],AX
    call far ptr gfx_blitVariant
    mov AL,[byte_37C2D]
    sub AH,AH
    mov DL,byte ptr [g_headingModulus]
    div DL
    db 086h, 0C4h ; xchg al,ah
    sub AH,AH
    test word ptr [_g_ourHead],2000h
    jz loc_21a7_0326
    add AX,word ptr [g_headingWrapOffset]
loc_21a7_0326:
    cmp AX,word ptr [g_headingModulus]
    jl loc_21a7_0330
    sub AX,word ptr [g_headingModulus]
loc_21a7_0330:
    mov DI,AX
    shl DI,1h
    cmp byte ptr [_g_halfScaleRender],1h
    jnz loc_21a7_0342
    mov AX,word ptr [DI+offset g_compassTapeBuf+0D8h]
    jmp loc_21a7_0346
    db 90h
loc_21a7_0342:
    mov AX,word ptr [DI+offset g_compassTapeBuf+0C4h]
loc_21a7_0346:
    mov [g_tapeSprite0SrcY],AX
    mov BP,offset g_tapeSprite0BufPtr
    call far ptr gfx_blitCore
loc_21a7_0351:
    cmp byte ptr [_g_halfScaleRender],0h
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
    call far ptr gfx_setDrawColor
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
    call far ptr gfx_setDrawColor
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
    call far ptr gfx_nop22
    cmp byte ptr [_g_hudDrawnFlag],0h
    jz loc_21a7_046e
    mov BP,offset g_tapeSprite1BufPtr
    call far ptr gfx_blitCore
loc_21a7_046e:
    mov BX,offset _g_geeStringBuf
    mov BP,offset g_tapeText3Page
    mov AX,[word_37C22]
    mov [g_tapeText3X],AX
    call far ptr gfx_copyBlock
    mov AX,[_g_ourPitch]
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
    cmp word ptr [_g_ourPitch],0h
    jge loc_21a7_04c5
    mov AH,byte ptr [word_37C11]
    sub AH,AL
    db 086h, 0E0h ; xchg ah,al
loc_21a7_04c5:
    add AL,byte ptr [byte_37C13]
    sub AH,AH
    mov BX,AX
    cmp word ptr [_g_ourPitch],0h
    jge loc_21a7_04d8
    neg CH
    dec CH
loc_21a7_04d8:
    mov AL,CH
    cbw
    db 02Dh, 002h, 000h ; sub AX,2 (force imm16 encoding)
    mov [_g_tapeCursorX],AX
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
    mov word ptr [DI+offset g_compassTapeBuf+0ECh],AX
    mov AX,[word_37C0B]
    mov word ptr [DI+offset g_compassTapeBuf+0EEh],AX
    mov AX,[word_37C0D]
    mov word ptr [DI+offset g_compassTapeBuf+0F0h],AX
    mov AX,[word_37C0F]
    mov word ptr [DI+offset g_compassTapeBuf+0F2h],AX
    mov word ptr [DI+offset g_compassTapeBuf+15Ch],BX
    mov word ptr [DI+offset g_compassTapeBuf+15Eh],BX
    mov word ptr [DI+offset g_compassTapeBuf+160h],BX
    mov word ptr [DI+offset g_compassTapeBuf+162h],BX
    mov byte ptr [SI+offset g_compassTapeBuf+1CCh],1h
    mov byte ptr [SI+offset g_compassTapeBuf+1CDh],1h
    mov word ptr [SI+offset g_compassTapeBuf+1E8h],DI
    add DI,6h
    mov word ptr [SI+offset g_compassTapeBuf+1E9h],DI
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
    mov word ptr [DI+offset g_compassTapeBuf+0ECh],AX
    mov word ptr [DI+offset g_compassTapeBuf+0EEh],AX
    mov AX,[word_37C0F]
    mov word ptr [DI+offset g_compassTapeBuf+0F0h],AX
    mov word ptr [DI+offset g_compassTapeBuf+0F2h],AX
    mov word ptr [DI+offset g_compassTapeBuf+15Eh],BX
    mov word ptr [DI+offset g_compassTapeBuf+160h],BX
    mov AX,BX
    db 005h, 005h, 000h ; add AX,5 (force imm16 encoding)
    mov word ptr [DI+offset g_compassTapeBuf+15Ch],AX
    mov word ptr [DI+offset g_compassTapeBuf+162h],AX
    mov byte ptr [SI+offset g_compassTapeBuf+1CCh],3h
    mov byte ptr [SI+offset g_compassTapeBuf+1CDh],0h
    add DI,2h
    mov word ptr [SI+offset g_compassTapeBuf+1E8h],DI
    add DI,2h
    mov word ptr [SI+offset g_compassTapeBuf+1E9h],DI
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
    mov word ptr [DI+offset g_compassTapeBuf+0ECh],AX
    mov word ptr [DI+offset g_compassTapeBuf+0EEh],AX
    mov AX,[word_37C0F]
    mov word ptr [DI+offset g_compassTapeBuf+0F0h],AX
    mov word ptr [DI+offset g_compassTapeBuf+0F2h],AX
    mov word ptr [DI+offset g_compassTapeBuf+15Eh],BX
    mov word ptr [DI+offset g_compassTapeBuf+160h],BX
    mov AX,BX
    db 02Dh, 005h, 000h ; sub AX,5 (force imm16 encoding)
    mov word ptr [DI+offset g_compassTapeBuf+15Ch],AX
    mov word ptr [DI+offset g_compassTapeBuf+162h],AX
    mov byte ptr [SI+offset g_compassTapeBuf+1CCh],3h
    mov byte ptr [SI+offset g_compassTapeBuf+1CDh],0h
    add DI,2h
    mov word ptr [SI+offset g_compassTapeBuf+1E8h],DI
    add DI,2h
    mov word ptr [SI+offset g_compassTapeBuf+1E9h],DI
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
    mov word ptr [DI+offset g_compassTapeBuf+0ECh],AX
    mov AX,[word_37C0F]
    mov word ptr [DI+offset g_compassTapeBuf+0EEh],AX
    mov word ptr [DI+offset g_compassTapeBuf+15Ch],BX
    mov word ptr [DI+offset g_compassTapeBuf+15Eh],BX
    mov byte ptr [SI+offset g_compassTapeBuf+1CCh],1h
    mov byte ptr [SI+offset g_compassTapeBuf+1CDh],0h
    mov word ptr [SI+offset g_compassTapeBuf+1E8h],DI
    add DI,2h
    mov word ptr [SI+offset g_compassTapeBuf+1E9h],DI
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
    mov word ptr [DI+offset g_compassTapeBuf+0ECh],AX
    mov word ptr [DI+offset g_compassTapeBuf+0EEh],AX
    mov AX,[word_37C0B]
    mov word ptr [DI+offset g_compassTapeBuf+0F0h],AX
    mov AX,[word_37C0D]
    mov word ptr [DI+offset g_compassTapeBuf+0F2h],AX
    mov AX,[word_37C0F]
    mov word ptr [DI+offset g_compassTapeBuf+0F4h],AX
    mov word ptr [DI+offset g_compassTapeBuf+0F6h],AX
    mov word ptr [DI+offset g_compassTapeBuf+15Eh],BX
    mov word ptr [DI+offset g_compassTapeBuf+160h],BX
    mov word ptr [DI+offset g_compassTapeBuf+162h],BX
    mov word ptr [DI+offset g_compassTapeBuf+164h],BX
    mov AX,BX
    db 005h, 005h, 000h ; add AX,5 (force imm16 encoding)
    mov word ptr [DI+offset g_compassTapeBuf+15Ch],AX
    mov word ptr [DI+offset g_compassTapeBuf+166h],AX
    mov byte ptr [SI+offset g_compassTapeBuf+1CCh],2h
    mov byte ptr [SI+offset g_compassTapeBuf+1CDh],2h
    add DI,2h
    mov word ptr [SI+offset g_compassTapeBuf+1E8h],DI
    add DI,6h
    mov word ptr [SI+offset g_compassTapeBuf+1E9h],DI
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
    mov word ptr [DI+offset g_compassTapeBuf+0ECh],AX
    mov word ptr [DI+offset g_compassTapeBuf+0EEh],AX
    mov AX,[word_37C0B]
    mov word ptr [DI+offset g_compassTapeBuf+0F0h],AX
    mov AX,[word_37C0D]
    mov word ptr [DI+offset g_compassTapeBuf+0F2h],AX
    mov AX,[word_37C0F]
    mov word ptr [DI+offset g_compassTapeBuf+0F4h],AX
    mov word ptr [DI+offset g_compassTapeBuf+0F6h],AX
    mov word ptr [DI+offset g_compassTapeBuf+15Eh],BX
    mov word ptr [DI+offset g_compassTapeBuf+160h],BX
    mov word ptr [DI+offset g_compassTapeBuf+162h],BX
    mov word ptr [DI+offset g_compassTapeBuf+164h],BX
    mov AX,BX
    db 02Dh, 005h, 000h ; sub AX,5 (force imm16 encoding)
    mov word ptr [DI+offset g_compassTapeBuf+15Ch],AX
    mov word ptr [DI+offset g_compassTapeBuf+166h],AX
    mov byte ptr [SI+offset g_compassTapeBuf+1CCh],2h
    mov byte ptr [SI+offset g_compassTapeBuf+1CDh],2h
    add DI,2h
    mov word ptr [SI+offset g_compassTapeBuf+1E8h],DI
    add DI,6h
    mov word ptr [SI+offset g_compassTapeBuf+1E9h],DI
    add DI,4h
    add SI,2h
    sub BX,word ptr [word_37C11]
    add CH,4h
    inc DL
    dec CL
    jz loc_21a7_0741
    jmp loc_21a7_04ec
loc_21a7_0741:
    mov byte ptr [_g_tapeChar],CH
    sub DI,2h
    mov BX,word ptr [_g_ourRoll]
    neg BX
    add BX,4000h
    call far ptr lookupSineFar
    mov BP,BX
    mov BX,word ptr [_g_ourRoll]
    neg BX
    call far ptr lookupSineFar
loc_21a7_0764:
    mov AX,BP
    imul word ptr [DI+offset g_compassTapeBuf+0ECh]
    shl AX,1h
    rcl DX,1h
    mov SI,DX
    mov AX,BP
    imul word ptr [DI+offset g_compassTapeBuf+15Ch]
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
    imul word ptr [DI+offset g_compassTapeBuf+15Ch]
    shl AX,1h
    rcl DX,1h
    sub SI,DX
    mov AX,BX
    imul word ptr [DI+offset g_compassTapeBuf+0ECh]
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
    mov word ptr [DI+offset g_compassTapeBuf+0ECh],SI
    mov word ptr [DI+offset g_compassTapeBuf+15Ch],CX
    sub DI,2h
    jns loc_21a7_0764
    push word ptr [_g_clipMaxX]
    push word ptr [_g_clipMaxY]
    cmp byte ptr [_g_highGeeFlag],0h
    jnz loc_21a7_07cf
    jmp loc_21a7_0993
loc_21a7_07cf:
    mov AH,7h
    cmp byte ptr [_gfxModeUnset],0h
    jz loc_21a7_07da
    mov AH,0h
loc_21a7_07da:
    call far ptr gfx_setDrawColor
    mov AX,[word_37C1C]
    call far ptr gfx_setBlitOffsetReg
    mov AX,[word_37C1E]
    mov [_g_clipMaxX],AX
    mov AX,[word_37C20]
    mov [_g_clipMaxY],AX
    mov DI,0h
    mov SI,DI
    mov byte ptr [_g_tapeColumn],0h
loc_21a7_07fd:
    mov AX,word ptr [DI+offset g_compassTapeBuf+0ECh]
    add AX,word ptr [word_37C14]
    mov [_g_lineX1],AX
    mov AX,word ptr [DI+offset g_compassTapeBuf+15Ch]
    add AX,word ptr [word_37C16]
    mov word ptr [_g_lineY1],AX
    mov AX,word ptr [DI+offset g_compassTapeBuf+0EEh]
    add AX,word ptr [word_37C14]
    mov [_g_lineX2],AX
    mov AX,word ptr [DI+offset g_compassTapeBuf+15Eh]
    add AX,word ptr [word_37C16]
    mov word ptr [_g_lineY2],AX
    push DI
    push SI
    call far ptr clipLineFar
    pop SI
    pop DI
    add DI,2h
    inc byte ptr [_g_tapeColumn]
    dec byte ptr [SI+offset g_compassTapeBuf+1CCh]
    jnz loc_21a7_07fd
    add DI,2h
    inc SI
    cmp byte ptr [SI+offset g_compassTapeBuf+1CCh],0h
    jnz loc_21a7_084b
    inc SI
loc_21a7_084b:
    mov BL,byte ptr [_g_tapeChar]
    cmp byte ptr [_g_tapeColumn],BL
    jl loc_21a7_07fd
    call far ptr gfx_nop22
    add word ptr [_g_tapeCursorX],0Bh
    mov SI,0h
    mov word ptr [g_tapeSegmentCount],5h
    mov BP,offset g_tapeText2Page
    mov AX,[_g_ourRoll]
    shr AH,1h
    shr AH,1h
    db 086h, 0E0h ; xchg ah,al
    sub AH,AH
    mov DI,AX
    shl DI,1h
    mov AX,word ptr [DI+offset _g_timerTickByte+1Ah]
    mov [g_tapeRollOfsA0],AX
    mov AX,word ptr [DI+offset _g_timerTickByte+9Ah]
    mov [g_tapeRollOfsA1],AX
    mov AX,word ptr [DI+offset _g_timerTickByte+11Ah]
    mov [g_tapeRollOfsA2],AX
    mov AX,word ptr [DI+offset _g_timerTickByte+19Ah]
    mov [g_tapeRollOfsA3],AX
    mov AX,[_g_ourRoll]
    add AH,80h
    shr AH,1h
    shr AH,1h
    db 086h, 0E0h ; xchg ah,al
    sub AH,AH
    mov DI,AX
    shl DI,1h
    mov AX,word ptr [DI+offset _g_timerTickByte+1Ah]
    mov [g_tapeRollOfsB0],AX
    mov AX,word ptr [DI+offset _g_timerTickByte+9Ah]
    mov [g_tapeRollOfsB1],AX
    mov AX,word ptr [DI+offset _g_timerTickByte+11Ah]
    mov [g_tapeRollOfsB2],AX
    mov AX,word ptr [DI+offset _g_timerTickByte+19Ah]
    mov [g_tapeRollOfsB3],AX
loc_21a7_08c4:
    mov DI,word ptr [_g_tapeCursorX]
    shl DI,1h
    shl DI,1h
    mov AX,word ptr [DI+offset g_tapeSegmentCount+2h]
    mov [g_tapeDrawStr],AX
    mov AX,word ptr [DI+offset g_tapeSegmentCount+4h]
    mov [g_tapeDrawStrY],AX
    mov BX,DI
    mov DI,word ptr [SI+offset g_compassTapeBuf+1E8h]
    and DI,0FFh
    mov AX,word ptr [DI+offset g_compassTapeBuf+0ECh]
    cmp BX,2Ch
    jge loc_21a7_08f4
    add AX,word ptr [g_tapeRollOfsB2]
    jmp loc_21a7_08f8
    db 90h
loc_21a7_08f4:
    add AX,word ptr [g_tapeRollOfsB0]
loc_21a7_08f8:
    add AX,word ptr [word_37C1A]
    mov [g_tapeText2X],AX
    mov AX,word ptr [DI+offset g_compassTapeBuf+15Ch]
    cmp DI,2Ch
    jge loc_21a7_090f
    add AX,word ptr [g_tapeRollOfsB3]
    jmp loc_21a7_0913
    db 90h
loc_21a7_090f:
    add AX,word ptr [g_tapeRollOfsB1]
loc_21a7_0913:
    add AX,word ptr [word_37C18]
    mov [g_tapeText2Y],AX
    mov BX,offset g_tapeDrawStr
    push SI
    call far ptr gfx_drawStringUnclipped
    pop SI
    inc SI
    mov DI,word ptr [_g_tapeCursorX]
    shl DI,1h
    shl DI,1h
    mov AX,word ptr [DI+offset g_tapeSegmentCount+2h]
    mov [g_tapeDrawStr],AX
    mov AX,word ptr [DI+offset g_tapeSegmentCount+4h]
    mov [g_tapeDrawStrY],AX
    mov BX,DI
    mov DI,word ptr [SI+offset g_compassTapeBuf+1E8h]
    and DI,0FFh
    mov AX,word ptr [DI+offset g_compassTapeBuf+0ECh]
    cmp BX,2Ch
    jge loc_21a7_0955
    add AX,word ptr [g_tapeRollOfsA2]
    jmp loc_21a7_0959
    db 90h
loc_21a7_0955:
    add AX,word ptr [g_tapeRollOfsA0]
loc_21a7_0959:
    add AX,word ptr [word_37C1A]
    mov [g_tapeText2X],AX
    mov AX,word ptr [DI+offset g_compassTapeBuf+15Ch]
    cmp DI,2Ch
    jge loc_21a7_0970
    add AX,word ptr [g_tapeRollOfsA3]
    jmp loc_21a7_0974
    db 90h
loc_21a7_0970:
    add AX,word ptr [g_tapeRollOfsA1]
loc_21a7_0974:
    add AX,word ptr [word_37C18]
    mov [g_tapeText2Y],AX
    mov BX,offset g_tapeDrawStr
    push SI
    call far ptr gfx_drawStringUnclipped
    pop SI
    inc SI
    inc word ptr [_g_tapeCursorX]
    dec word ptr [g_tapeSegmentCount]
    jz loc_21a7_0993
    jmp loc_21a7_08c4
loc_21a7_0993:
    pop word ptr [_g_clipMaxY]
    pop word ptr [_g_clipMaxX]
    call far ptr gfx_setBlitOffset3
    ret

drawInstrumentGauges endp

; setupInstrumentLayout - display configuration setup
    PUBLIC setupInstrumentLayout
setupInstrumentLayout proc near
    mov ax, _gfxBufPtr
    mov g_tapeSprite0BufPtr, ax
    mov g_tapeSprite1BufPtr, ax
    mov g_tapeSprite2BufPtr, ax
    mov g_tapeSprite3BufPtr, ax
    mov _g_halfScaleRender, 0
loc_22425:
    cmp _g_halfScaleRender, 1
    jz short loc_2242F
    jmp loc_22545
loc_2242F:
    mov ax, 64h
    mov g_tapeOriginX, ax
    mov al, 8
    mov g_tapeCursorBackShift, al
    mov ax, 0Ah
    mov g_tapeTickPitch, ax
    mov al, 0
    mov g_tapeScaleShift, al
    mov ax, 66h
    mov g_speedTapeTickStep, ax
    mov ax, 0CCh
    mov g_altTapeTickStep, ax
    mov al, 88h
    mov g_headingBase, al
    mov ax, 12h
    mov g_headingPixPerDeg, ax
    mov ax, 0AFh
    mov g_compassWrapLimit, ax
    mov ax, 4
    mov g_headingModulus, ax
    mov ax, 2
    mov g_headingWrapOffset, ax
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
    call far ptr gfx_getPresetOffset1
    mov word_37C1C, ax
    mov ax, 42h
    mov word_37C1E, ax
    mov ax, 25h
    mov word_37C20, ax
    mov ax, 6Ch
    mov word_37C22, ax
    mov ax, 44h
    mov g_tapeText0ClipTop, ax
    mov ax, 60h
    mov g_tapeText0ClipBottom, ax
    mov ax, 2
    mov g_tapeText0Font, ax
    mov g_tapeText1Font, ax
    mov g_tapeText2Font, ax
    mov g_tapeText3Font, ax
    mov ax, 3Bh
    mov g_tapeText1Y, ax
    mov ax, 82h
    mov g_tapeText1ClipX1, ax
    mov ax, 0BCh
    mov g_tapeText1ClipX2, ax
    mov ax, 93h
    mov g_tapeSprite1SrcX, ax
    mov ax, 14h
    mov g_tapeSprite1SrcY, ax
    mov ax, 99h
    mov g_tapeSprite1DstX, ax
    mov ax, 4Ch
    mov g_tapeSprite1DstY, ax
    mov ax, 0Dh
    mov g_tapeSprite1Width, ax
    mov ax, 9
    mov g_tapeSprite1Height, ax
    mov ax, 82h
    mov g_tapeSprite0DstX, ax
    mov ax, 40h
    mov g_tapeSprite0DstY, ax
    mov ax, 3Bh
    mov g_tapeSprite0Width, ax
    mov ax, 2
    mov g_tapeSprite0Height, ax
    mov ax, 44h
    mov g_tapeText2ClipTop, ax
    mov ax, 7Fh
    mov g_tapeText2ClipX1, ax
    mov ax, 0C3h
    mov g_tapeText2ClipX2, ax
    mov ax, 3Fh
    mov g_tapeText3Y, ax
    retn
loc_22545:
    mov ax, 5Eh
    mov g_tapeOriginX, ax
    mov al, 11h
    mov g_tapeCursorBackShift, al
    mov ax, 14h
    mov g_tapeTickPitch, ax
    mov al, 1
    mov g_tapeScaleShift, al
    mov ax, 31h
    mov g_speedTapeTickStep, ax
    mov ax, 0FFh
    mov g_altTapeTickStep, ax
    mov al, 6Dh
    mov g_headingBase, al
    mov ax, 2Dh
    mov g_headingPixPerDeg, ax
    mov ax, 0F8h
    mov g_compassWrapLimit, ax
    mov ax, 0Ah
    mov g_headingModulus, ax
    mov ax, 5
    mov g_headingWrapOffset, ax
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
    call far ptr gfx_getPresetOffset2
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
    mov g_tapeText0ClipTop, ax
    mov ax, 56h
    mov g_tapeText0ClipBottom, ax
    mov ax, 0
    mov g_tapeText0Font, ax
    mov g_tapeText1Font, ax
    mov g_tapeText2Font, ax
    mov g_tapeText3Font, ax
    mov ax, 0Ah
    mov g_tapeText1Y, ax
    mov ax, 5Ah
    mov g_tapeText1ClipX1, ax
    mov ax, 0E6h
    mov g_tapeText1ClipX2, ax
    mov ax, 82h
    mov g_tapeSprite1SrcX, ax
    mov ax, 26h
    mov g_tapeSprite1SrcY, ax
    mov ax, 93h
    mov g_tapeSprite1DstX, ax
    mov ax, 30h
    mov g_tapeSprite1DstY, ax
    mov ax, 19h
    mov g_tapeSprite1Width, ax
    mov ax, 0Fh
    mov g_tapeSprite1Height, ax
    mov ax, 5Ah
    mov g_tapeSprite0DstX, ax
    mov ax, 10h
    mov g_tapeSprite0DstY, ax
    mov ax, 8Dh
    mov g_tapeSprite0Width, ax
    mov ax, 3
    mov g_tapeSprite0Height, ax
    mov ax, 14h
    mov g_tapeText2ClipTop, ax
    mov ax, 4Eh
    mov g_tapeText2ClipX1, ax
    mov ax, 0F1h
    mov g_tapeText2ClipX2, ax
    mov ax, 10h
    mov g_tapeText3Y, ax
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
    PUBLIC _initJoystickCalibration
_initJoystickCalibration equ initJoystickCalibration

; routine_248 - joystick data init helper
routine_248 proc near
    shl BX,1
    mov AX,[BX+g_joyCountX]
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
    PUBLIC _readCalibratedJoystick
_readCalibratedJoystick equ readCalibratedJoystick

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
    mov [g_joyCountX],BX
    mov [g_joyCountY],BP
    pop BP
    ret
routine_246 endp

; routine_247 - joystick calibration compute
routine_247 proc near
    shl BX,1
    mov AX,[BX+g_joyCountX]
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
