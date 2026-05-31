.MODEL large

EXTRN gfx_dirtyRect:far
EXTRN gfx_dirtyRect2:far
EXTRN gfx_drawLine:far
EXTRN gfx_getCurPageSeg:far
EXTRN gfx_getCurPageSeg2:far
EXTRN gfx_resetBlitOffset:far
EXTRN gfx_setPage1:far
EXTRN gfx_setPageDirect:far
EXTRN sub_13BC1:far
EXTRN sub_13BC5:far

PUBLIC sub_1F882
PUBLIC _sub_1F882
PUBLIC sub_1F8F8
PUBLIC _sub_1F8F8
PUBLIC sub_1F993
PUBLIC _sub_1F993
PUBLIC sub_1F9B7
PUBLIC _sub_1F9B7
PUBLIC sub_1F9DD
PUBLIC _sub_1F9DD
PUBLIC sub_1FABF
PUBLIC _sub_1FABF
PUBLIC sub_1FB1D
PUBLIC _sub_1FB1D
PUBLIC sub_1FB52
PUBLIC _sub_1FB52
PUBLIC sub_1FB88
PUBLIC _sub_1FB88
PUBLIC sub_1FBB4
PUBLIC _sub_1FBB4
PUBLIC sub_1FC03
PUBLIC _sub_1FC03
PUBLIC sub_1FC3A
PUBLIC _sub_1FC3A
PUBLIC sub_1FC8E
PUBLIC _sub_1FC8E
PUBLIC sub_1FD04
PUBLIC _sub_1FD04
PUBLIC sub_1FD72
PUBLIC _sub_1FD72
PUBLIC sub_1FDAD
PUBLIC _sub_1FDAD
PUBLIC sub_1FE5C
PUBLIC _sub_1FE5C
PUBLIC sub_1FEEC
PUBLIC _sub_1FEEC
PUBLIC sub_1FEFE
PUBLIC _sub_1FEFE
PUBLIC sub_20104
PUBLIC _sub_20104
PUBLIC sub_20188
PUBLIC _sub_20188
PUBLIC sub_20289
PUBLIC _sub_20289
PUBLIC sub_202B6
PUBLIC _sub_202B6
PUBLIC sub_202C7
PUBLIC _sub_202C7
PUBLIC sub_202DA
PUBLIC _sub_202DA
PUBLIC sub_202F6
PUBLIC _sub_202F6
PUBLIC sub_20300
PUBLIC _sub_20300
PUBLIC sub_203E0
PUBLIC _sub_203E0
PUBLIC sub_2044A
PUBLIC _sub_2044A
PUBLIC sub_20467
PUBLIC _sub_20467
PUBLIC sub_20534
PUBLIC _sub_20534
PUBLIC sub_20658
PUBLIC _sub_20658
PUBLIC sub_20674
PUBLIC _sub_20674
PUBLIC sub_20970
PUBLIC _sub_20970
PUBLIC sub_20A46
PUBLIC _sub_20A46
PUBLIC sub_20A58
PUBLIC _sub_20A58
PUBLIC sub_20B02
PUBLIC _sub_20B02
PUBLIC sub_20BAE
PUBLIC _sub_20BAE
PUBLIC sub_20BDF
PUBLIC _sub_20BDF
PUBLIC sub_20CFB
PUBLIC _sub_20CFB
PUBLIC sub_20E19
PUBLIC _sub_20E19
PUBLIC sub_20E38
PUBLIC _sub_20E38
PUBLIC sub_20E4D
PUBLIC _sub_20E4D
PUBLIC sub_20FDC
PUBLIC _sub_20FDC
PUBLIC sub_20FEA
PUBLIC _sub_20FEA
PUBLIC sub_21075
PUBLIC _sub_21075
PUBLIC sub_211BA
PUBLIC _sub_211BA
PUBLIC sub_21422
PUBLIC _sub_21422
PUBLIC sub_21444
PUBLIC _sub_21444
PUBLIC sub_21526
PUBLIC _sub_21526
PUBLIC sub_2152A
PUBLIC _sub_2152A
PUBLIC sub_21536
PUBLIC _sub_21536
PUBLIC sub_216C2
PUBLIC _sub_216C2
PUBLIC sub_21704
PUBLIC _sub_21704
PUBLIC sub_2171A
PUBLIC _sub_2171A
PUBLIC sub_21720
PUBLIC _sub_21720
PUBLIC sub_21756
PUBLIC _sub_21756
PUBLIC sub_217B4
PUBLIC _sub_217B4
PUBLIC sub_2189C
PUBLIC _sub_2189C
PUBLIC sub_218A8
PUBLIC _sub_218A8

seg001 segment byte public 'CODE'

sub_1F882 proc far
    PUSH BP
    MOV BP,SP
    PUSH ES
    PUSH DS
    PUSH SI
    PUSH DI
    MOV AH,[BP+0Ch]
    call far ptr gfx_setPageDirect
    CALL loc_1EA0
    MOV SI,[BP+0Ah]
    MOV CX,[BP+8h]
    DEC CX
    LODSW
    MOV [4CADh],AX
    PUSH AX
    LODSW
    MOV [4CB1h],AX
    PUSH AX
loc_0025:
    PUSH CX
    LODSW
    MOV [4CAFh],AX
    PUSH AX
    LODSW
    MOV [4CB3h],AX
    PUSH AX
    PUSH SI
    CALL loc_2028
    POP SI
    POP WORD PTR [4CB1h]
    POP WORD PTR [4CADh]
    POP CX
    LOOP short loc_0025
    POP WORD PTR [4CB3h]
    POP WORD PTR [4CAFh]
    CALL loc_2028
    MOV AX,[5029h]
    MOV CX,[502Bh]
    MOV BX,4CB5h
    call far ptr gfx_dirtyRect
    call far ptr gfx_resetBlitOffset
    POP DI
    POP SI
    POP DS
    POP ES
    POP BP
    RETF
sub_1F882 endp

    db 000h, 08Bh, 0DCh, 056h, 057h, 036h, 08Bh, 05Fh, 002h, 0D1h, 0E3h, 0D1h, 0E3h, 0E8h, 003h, 000h
    db 05Fh, 05Eh, 0C3h
sub_1F8F8 proc near
loc_0078:
    MOV CX,[BX+1DD6h]
    CMP BYTE PTR [5374h],0h
    JZ short loc_0085
    SHL CX,1
loc_0085:
    CMP BYTE PTR [5C5Eh],0h
    JZ short loc_0096
    db 087h, 0D1h
    MOV CL,[5C5Eh]
    SAR DX,CL
    db 087h, 0D1h
loc_0096:
    OR CX,CX
    JNG short loc_00E7
    MOV DX,[BX+1A0Dh]
    MOV AL,[BX+1A0Fh]
    CBW
    XCHG AX,DX
    IDIV CX
    CWD
    OR AX,AX
    ADD AX,[0DCh]
    ADC DX,BYTE PTR +0x0
    MOV [BX+1FBAh],DX
    MOV [BX+1FB8h],AX
    MOV DX,[BX+1BF1h]
    MOV AL,[BX+1BF3h]
    CBW
    XCHG AX,DX
    MOV SI,DX
    MOV DI,AX
    SAR DX,1
    RCR AX,1
    SAR DX,1
    RCR AX,1
    SUB AX,DI
    SBB DX,SI
    IDIV CX
    CWD
    OR AX,AX
    ADD AX,[0DEh]
    ADC DX,BYTE PTR +0x0
    MOV [BX+219Eh],DX
    MOV [BX+219Ch],AX
    RET
loc_00E7:
    MOV AX,8000h
    MOV [BX+1FB8h],AX
    MOV [BX+1FBAh],AX
    MOV [BX+219Ch],AX
    MOV [BX+219Eh],AX
    RET
sub_1F8F8 endp

    db 055h, 08Bh, 0ECh, 083h, 046h, 002h, 003h, 08Ah, 0C4h, 08Ah, 0E2h, 08Ah, 0D6h, 0F7h, 0F9h, 099h
    db 08Ah, 0D4h, 08Ah, 0E0h, 02Ah, 0C0h, 05Dh, 0CFh
sub_1F993 proc near
loc_0113:
    PUSH ES
    SUB AX,AX
    MOV ES,AX
    MOV AX,[ES:0h]
    MOV [18A0h],AX
    LEA AX,[0FBh]
    MOV [ES:0h],AX
    MOV AX,[ES:2h]
    MOV [18A2h],AX
    MOV AX,0F88h
    MOV [ES:2h],AX
    POP ES
    RET
sub_1F993 endp

sub_1F9B7 proc near
loc_0137:
    PUSH ES
    SUB AX,AX
    MOV ES,AX
    MOV AX,[18A0h]
    MOV [ES:0h],AX
    MOV AX,[18A2h]
    MOV [ES:2h],AX
    POP ES
    RET
sub_1F9B7 endp

    db 055h, 08Bh, 0ECh, 056h, 057h, 006h, 08Bh, 07Eh, 006h, 0E8h, 005h, 000h, 007h, 05Fh, 05Eh, 05Dh
    db 0C3h
sub_1F9DD proc near
loc_015D:
    MOV AX,[DI]
    MOV CX,[DI+2h]
    CWD
    CMP DX,CX
    JNZ short loc_01A7
    MOV SI,AX
    MOV AX,[DI+4h]
    MOV CX,[DI+6h]
    CWD
    CMP DX,CX
    JNZ short loc_01A7
    MOV CX,AX
    MOV AX,[DI+8h]
    MOV BX,[DI+0Ah]
    CWD
    CMP DX,BX
    JNZ short loc_01A7
    MOV BP,AX
    MOV AX,[DI+0Ch]
    MOV BX,[DI+0Eh]
    CWD
    CMP DX,BX
    JNZ short loc_01A7
    MOV DX,AX
    MOV AX,[4CA7h]
    CMP SI,AX
    JA short loc_01A7
    CMP BP,AX
    JA short loc_01A7
    MOV AX,[4CA9h]
    CMP CX,AX
    JA short loc_01A7
    CMP DX,AX
    JA short loc_01A7
    RET
loc_01A7:
    SUB AL,AL
    MOV [18C0h],AL
    MOV BX,[DI]
    MOV [18A6h],BX
    MOV CX,[DI+2h]
    MOV [18A8h],CX
    MOV SI,[DI+4h]
    MOV [18AAh],SI
    MOV DX,[DI+6h]
    MOV [18ACh],DX
    CALL loc_0383
    MOV [18BEh],AL
    JZ short loc_01D8
    CALL loc_03BA
    MOV [DI+2h],AX
    MOV [DI+6h],BP
loc_01D8:
    MOV BX,[DI+8h]
    MOV [18AEh],BX
    MOV CX,[DI+0Ah]
    MOV [18B0h],CX
    MOV SI,[DI+0Ch]
    MOV [18B2h],SI
    MOV DX,[DI+0Eh]
    MOV [18B4h],DX
    CALL loc_0383
    MOV [18BFh],AL
    JZ short loc_0205
    CALL loc_03BA
    MOV [DI+0Ah],AX
    MOV [DI+0Eh],BP
loc_0205:
    MOV AH,[18BEh]
    MOV AL,[18BFh]
    OR AH,AL
    TEST [18BEh],AL
    JNZ short loc_023B
    OR AL,AL
    JZ short loc_0223
    MOV AL,[18BEh]
    OR AL,AL
    JZ short loc_0227
    CALL loc_023F
    RET
loc_0223:
    CALL loc_029D
    RET
loc_0227:
    MOV BX,[18A6h]
    MOV CX,[18A8h]
    MOV SI,[18AAh]
    MOV DX,[18ACh]
    CALL loc_02D2
    RET
loc_023B:
    CALL loc_0308
    RET
sub_1F9DD endp

sub_1FABF proc near
loc_023F:
    MOV AX,[18A6h]
    MOV [18B6h],AX
    MOV AX,[18A8h]
    MOV [18B8h],AX
    MOV AX,[18AAh]
    MOV [18BAh],AX
    MOV AX,[18ACh]
    MOV [18BCh],AX
    MOV BX,[18AEh]
    MOV CX,[18B0h]
    MOV SI,[18B2h]
    MOV DX,[18B4h]
    CALL loc_0484
    JZ short loc_0276
    MOV DX,[DI+0Eh]
    MOV [DI+4h],DX
    CALL loc_0308
    RET
loc_0276:
    MOV [18C9h],BX
    MOV [18CBh],CX
    MOV [18CDh],SI
    MOV [18CFh],DX
    CALL loc_029D
    MOV BX,[18C9h]
    MOV CX,[18CBh]
    MOV SI,[18CDh]
    MOV DX,[18CFh]
    CALL loc_02D2
    RET
sub_1FABF endp

sub_1FB1D proc near
loc_029D:
    MOV [18B6h],BX
    MOV [18B8h],CX
    MOV [18BAh],SI
    MOV [18BCh],DX
    MOV BX,[18A6h]
    MOV CX,[18A8h]
    MOV SI,[18AAh]
    MOV DX,[18ACh]
    CALL loc_040E
    MOV [DI],BX
    MOV [DI+4h],SI
    MOV AX,[DI+4h]
    CMP AX,[DI+6h]
    JZ short loc_02D1
    OR BYTE PTR [DI+18h],20h
loc_02D1:
    RET
sub_1FB1D endp

sub_1FB52 proc near
loc_02D2:
    MOV [18B6h],BX
    MOV [18B8h],CX
    MOV [18BAh],SI
    MOV [18BCh],DX
    MOV BX,[18AEh]
    MOV CX,[18B0h]
    MOV SI,[18B2h]
    MOV DX,[18B4h]
    CALL loc_040E
    MOV [DI+8h],BX
    MOV [DI+0Ch],SI
    MOV AX,[DI+0Ch]
    CMP AX,[DI+0Eh]
    JZ short loc_0307
    OR BYTE PTR [DI+18h],10h
loc_0307:
    RET
sub_1FB52 endp

sub_1FB88 proc near
loc_0308:
    MOV CL,[DI+18h]
    OR CL,80h
    MOV DX,[DI+0Eh]
    MOV [DI+4h],DX
    TEST AL,9h
    JZ short loc_0330
    MOV DX,0h
    TEST AL,8h
    JNZ short loc_0323
    MOV DX,[4CA7h]
loc_0323:
    MOV [DI],DX
    MOV AX,[DI+4h]
    CMP AX,[DI+6h]
    JZ short loc_0330
    OR CL,20h
loc_0330:
    MOV [DI+18h],CL
    RET
sub_1FB88 endp

sub_1FBB4 proc near
loc_0334:
    OR CX,CX
    JNZ short loc_0343
    CMP BX,BYTE PTR +0x0
    JZ short loc_0355
    CMP BX,[4CA7h]
    JZ short loc_0355
loc_0343:
    OR DX,DX
    JNZ short loc_0352
    CMP SI,BYTE PTR +0x0
    JZ short loc_036C
    CMP SI,[4CA9h]
    JZ short loc_036C
loc_0352:
    SUB AX,AX
    RET
loc_0355:
    SUB AX,AX
    OR DX,DX
    JS short loc_0369
    JNZ short loc_0369
    CMP SI,BYTE PTR +0x0
    JC short loc_0369
    CMP SI,[4CA9h]
    JA short loc_0369
    INC AX
loc_0369:
    OR AX,AX
    RET
loc_036C:
    SUB AX,AX
    OR CX,CX
    JS short loc_0380
    JNZ short loc_0380
    CMP BX,BYTE PTR +0x0
    JC short loc_0380
    CMP BX,[4CA7h]
    JA short loc_0380
    INC AX
loc_0380:
    OR AX,AX
    RET
sub_1FBB4 endp

sub_1FC03 proc near
loc_0383:
    MOV AL,0Ch
    OR CX,CX
    JS short loc_039E
    JNZ short loc_0390
    CMP BX,BYTE PTR +0x0
    JC short loc_039E
loc_0390:
    XOR AL,9h
    OR CX,CX
    JNZ short loc_039E
    CMP BX,[4CA7h]
    JA short loc_039E
    XOR AL,1h
loc_039E:
    OR DX,DX
    JS short loc_03B7
    JNZ short loc_03A9
    CMP SI,BYTE PTR +0x0
    JC short loc_03B7
loc_03A9:
    XOR AL,6h
    OR DX,DX
    JNZ short loc_03B7
    CMP SI,[4CA9h]
    JA short loc_03B7
    XOR AL,2h
loc_03B7:
    OR AL,AL
    RET
sub_1FC03 endp

sub_1FC3A proc near
loc_03BA:
    MOV AH,1h
    MOV BP,CX
    INC BP
    CMP BP,BYTE PTR +0x1
    JA short loc_03E6
    MOV BP,CX
    SAR BP,1
    XOR BP,BX
    AND BP,0C000h
    JNZ short loc_03E6
    MOV BP,DX
    INC BP
    CMP BP,BYTE PTR +0x1
    JA short loc_03E6
    MOV BP,DX
    SAR BP,1
    XOR BP,SI
    AND BP,0C000h
    JNZ short loc_03E6
    SUB AH,AH
loc_03E6:
    OR [18C0h],AH
    MOV BP,SI
    TEST AL,4h
    JZ short loc_03F3
    MOV BP,0h
loc_03F3:
    TEST AL,2h
    JZ short loc_03FB
    MOV BP,[4CA9h]
loc_03FB:
    TEST AL,8h
    JZ short loc_0403
    MOV AX,0h
    RET
loc_0403:
    TEST AL,1h
    JZ short loc_040B
    MOV AX,[4CA7h]
    RET
loc_040B:
    MOV AX,BX
    RET
sub_1FC3A endp

sub_1FC8E proc near
loc_040E:
    MOV AL,[18C0h]
    OR AL,AL
    JNZ short loc_0418
    JMP near ptr loc_058A
loc_0418:
    MOV BP,20h
loc_041B:
    MOV [18C1h],BX
    MOV [18C3h],CX
    MOV [18C5h],SI
    MOV [18C7h],DX
loc_042B:
    ADD BX,[18B6h]
    ADC CX,[18B8h]
    SAR CX,1
    RCR BX,1
    ADD SI,[18BAh]
    ADC DX,[18BCh]
    SAR DX,1
    RCR SI,1
    CALL loc_0334
    JNZ short loc_0472
    DEC BP
    JZ short loc_0473
    CALL loc_0383
    JNZ short loc_041B
    MOV [18B6h],BX
    MOV [18B8h],CX
    MOV [18BAh],SI
    MOV [18BCh],DX
    MOV BX,[18C1h]
    MOV CX,[18C3h]
    MOV SI,[18C5h]
    MOV DX,[18C7h]
    JMP short loc_042B
loc_0472:
    RET
loc_0473:
    MOV BX,[18B6h]
    MOV CX,[18B8h]
    MOV SI,[18BAh]
    MOV DX,[18BCh]
    RET
sub_1FC8E endp

sub_1FD04 proc near
loc_0484:
    MOV AL,[18C0h]
    OR AL,AL
    JNZ short loc_048E
    JMP near ptr loc_0550
loc_048E:
    MOV BP,20h
loc_0491:
    MOV [18C1h],BX
    MOV [18C3h],CX
    MOV [18C5h],SI
    MOV [18C7h],DX
loc_04A1:
    ADD BX,[18B6h]
    ADC CX,[18B8h]
    SAR CX,1
    RCR BX,1
    ADD SI,[18BAh]
    ADC DX,[18BCh]
    SAR DX,1
    RCR SI,1
    CALL loc_0383
    JZ short loc_04EF
    DEC BP
    JZ short loc_04EF
    TEST [18BEh],AL
    JZ short loc_0491
    TEST [18BFh],AL
    JNZ short loc_04EF
    MOV [18B6h],BX
    MOV [18B8h],CX
    MOV [18BAh],SI
    MOV [18BCh],DX
    MOV BX,[18C1h]
    MOV CX,[18C3h]
    MOV SI,[18C5h]
    MOV DX,[18C7h]
    JMP short loc_04A1
loc_04EF:
    OR AL,AL
    RET
sub_1FD04 endp

sub_1FD72 proc near
loc_04F2:
    CMP BX,BYTE PTR +0x0
    JZ short loc_050B
    CMP BX,[4CA7h]
    JZ short loc_050B
    CMP SI,BYTE PTR +0x0
    JZ short loc_051C
    CMP SI,[4CA9h]
    JZ short loc_051C
    SUB AX,AX
    RET
loc_050B:
    SUB AX,AX
    CMP SI,BYTE PTR +0x0
    JL short loc_0519
    CMP SI,[4CA9h]
    JG short loc_0519
    INC AX
loc_0519:
    OR AX,AX
    RET
loc_051C:
    SUB AX,AX
    CMP BX,BYTE PTR +0x0
    JL short loc_052A
    CMP BX,[4CA7h]
    JG short loc_052A
    INC AX
loc_052A:
    OR AX,AX
    RET
sub_1FD72 endp

sub_1FDAD proc near
loc_052D:
    MOV AL,0Ch
    CMP BX,BYTE PTR +0x0
    JL short loc_053E
    XOR AL,9h
    CMP BX,[4CA7h]
    JG short loc_053E
    XOR AL,1h
loc_053E:
    CMP SI,BYTE PTR +0x0
    JL short loc_054D
    XOR AL,6h
    CMP SI,[4CA9h]
    JG short loc_054D
    XOR AL,2h
loc_054D:
    OR AL,AL
    RET
sub_1FDAD endp

loc_0550:
    PUSH DI
    MOV CX,[18B6h]
    MOV DX,[18BAh]
    MOV BP,10h
loc_055C:
    MOV DI,BX
    MOV ES,SI
loc_0560:
    ADD BX,CX
    SAR BX,1
    ADD SI,DX
    SAR SI,1
    CALL loc_052D
    JZ short loc_0586
    DEC BP
    JZ short loc_0586
    TEST [18BEh],AL
    JZ short loc_055C
    TEST [18BFh],AL
    JNZ short loc_0586
    MOV CX,BX
    MOV DX,SI
    MOV BX,DI
    MOV SI,ES
    JMP short loc_0560
loc_0586:
    POP DI
    OR AL,AL
    RET
loc_058A:
    PUSH DI
    MOV CX,[18B6h]
    MOV DX,[18BAh]
    MOV BP,10h
loc_0596:
    MOV DI,BX
    MOV ES,SI
loc_059A:
    ADD BX,CX
    SAR BX,1
    ADD SI,DX
    SAR SI,1
    CALL loc_04F2
    JNZ short loc_05B9
    DEC BP
    JZ short loc_05BB
    CALL loc_052D
    JNZ short loc_0596
    MOV CX,BX
    MOV DX,SI
    MOV BX,DI
    MOV SI,ES
    JMP short loc_059A
loc_05B9:
    POP DI
    RET
loc_05BB:
    MOV BX,CX
    MOV SI,DX
    POP DI
    RET
    db 000h, 055h, 08Bh, 0ECh, 056h, 057h, 08Bh, 076h, 004h, 08Bh, 046h, 006h, 08Eh, 0C0h, 08Bh, 07Eh
    db 008h, 08Bh, 05Eh, 00Ah, 0E8h, 004h, 000h, 05Fh, 05Eh, 05Dh, 0C3h
sub_1FE5C proc near
loc_05DC:
    MOV [18E0h],BX
    SUB BP,BP
    MOV AL,[ES:SI]
    INC SI
    SUB AH,AH
    MOV CX,AX
loc_05EA:
    MOV BX,[18E0h]
    ADD BX,CX
    MOV AL,[BX]
    MOV BX,CX
    SHL BX,1
    SUB DX,DX
    CMP AL,0FFh
    JNZ short loc_05FF
    MOV DX,2h
loc_05FF:
    CMP DX,BYTE PTR +0x0
    JZ short loc_0616
    CMP DX,BYTE PTR +0x1
    JZ short loc_061C
    CMP DX,BYTE PTR +0x2
    JZ short loc_0625
    CMP DX,BYTE PTR +0x3
    JZ short loc_062B
    JMP short loc_0634
    NOP
loc_0616:
    MOV DX,1h
    JMP short loc_0658
    NOP
loc_061C:
    MOV [DI],CL
    INC DI
    MOV DX,4h
    JMP short loc_064C
    NOP
loc_0625:
    MOV DX,3h
    JMP short loc_064C
    NOP
loc_062B:
    MOV [DI],CL
    INC DI
    MOV DX,4h
    JMP short loc_0658
    NOP
loc_0634:
    SUB BP,BYTE PTR +0x1
    JS short loc_0648
    POP AX
    MOV DL,AL
    SUB DH,DH
    MOV CL,AH
    SUB CH,CH
    MOV BX,CX
    SHL BX,1
    JMP short loc_05FF
loc_0648:
    MOV BYTE PTR [DI],0FFh
    RET
loc_064C:
    MOV AL,[ES:BX+SI]
    CMP AL,0FFh
    JZ short loc_0656
    JMP short loc_0660
    NOP
loc_0656:
    JMP short loc_05FF
loc_0658:
    MOV AL,[ES:BX+SI+1h]
    CMP AL,0FFh
    JZ short loc_0656
loc_0660:
    SUB AH,AH
    XCHG AX,CX
    MOV AH,AL
    MOV AL,DL
    PUSH AX
    INC BP
    JMP near ptr loc_05EA
sub_1FE5C endp

sub_1FEEC proc far
    PUSH BP
    MOV BP,SP
    MOV AL,[BP+6h]
    MOV [18E6h],AL
    PUSH SI
    PUSH DI
    CALL loc_067E
    POP DI
    POP SI
    POP BP
    RETF
sub_1FEEC endp

sub_1FEFE proc near
loc_067E:
    MOV AX,[19C2h]
    NEG AX
    MOV [18E4h],AX
    MOV AX,[19BEh]
    CWD
    MOV DL,AH
    MOV AH,AL
    SUB AL,AL
    MOV CX,[19C0h]
    CMP CX,1F0Bh
    JG short loc_06A0
    MOV AX,3FFh
    JMP short loc_06BE
    NOP
loc_06A0:
    IDIV CX
    CMP BYTE PTR [672Ch],2h
    JNZ short loc_06BE
    MOV DL,[19B9h]
    SUB DH,DH
    MOV CX,DX
    SHR CX,1
    ADD DX,CX
    MOV CL,3h
    SHR DX,CL
    ADD DX,BYTE PTR +0x4
    SUB AX,DX
loc_06BE:
    CMP BYTE PTR [5C5Eh],0h
    JZ short loc_06CB
    MOV CL,[5C5Eh]
    SHL AX,CL
loc_06CB:
    CMP BYTE PTR [5374h],0h
    JZ short loc_06D4
    SAR AX,1
loc_06D4:
    MOV BP,AX
    IMUL WORD PTR [18E4h]
    SHL AX,1
    RCL DX,1
    MOV BX,AX
    MOV CX,DX
    MOV AX,[0DCh]
    SHL AX,1
    IMUL WORD PTR [19C4h]
    SHL AX,1
    RCL DX,1
    MOV SI,AX
    MOV DI,DX
    SUB AX,BX
    SBB DX,CX
    SHL AX,1
    ADC DX,[0DCh]
    MOV [4CADh],DX
    ADD BX,SI
    ADC CX,DI
    SHL BX,1
    ADC CX,BYTE PTR +0x0
    MOV DX,[0DCh]
    SUB DX,CX
    MOV [4CAFh],DX
    MOV AX,BP
    IMUL WORD PTR [19C4h]
    SHL AX,1
    RCL DX,1
    MOV SI,AX
    MOV DI,DX
    MOV AX,[0DCh]
    SHL AX,1
    IMUL WORD PTR [18E4h]
    SHL AX,1
    RCL DX,1
    MOV BX,AX
    MOV CX,DX
    SUB AX,SI
    SBB DX,DI
    SHL AX,1
    ADC DX,BYTE PTR +0x0
    MOV AX,DX
    SAR AX,1
    SAR AX,1
    SUB DX,AX
    ADD DX,[0DEh]
    MOV [4CB3h],DX
    ADD SI,BX
    ADC DI,CX
    SHL SI,1
    ADC DI,BYTE PTR +0x0
    MOV SI,DI
    SAR SI,1
    SAR SI,1
    SUB DI,SI
    MOV DX,[0DEh]
    SUB DX,DI
    MOV [4CB1h],DX
    MOV WORD PTR [18E8h],0h
    MOV AH,[18E6h]
    call far ptr gfx_setPageDirect
    CALL loc_1EA0
    CALL loc_1CB6
    JNC short loc_07C2
loc_077E:
    CMP WORD PTR [19BEh],BYTE PTR +0x0
    JS short loc_0798
    MOV AH,[18E7h]
    call far ptr gfx_setPageDirect
    CMP BYTE PTR [672Ch],2h
    JNZ short loc_0798
    JMP near ptr loc_087E
loc_0798:
    SUB SI,SI
    MOV DI,SI
    MOV DX,[4CA9h]
    CALL loc_1ED6
    MOV SI,[4CA7h]
    SUB DI,DI
    MOV DX,[4CA9h]
    CALL loc_1ED6
    MOV AX,[5029h]
    MOV CX,[502Bh]
    MOV BX,4CB5h
    call far ptr gfx_dirtyRect
    JMP near ptr loc_087E
loc_07C2:
    MOV AX,[4CB1h]
    CMP AX,[4CB3h]
    JNZ short loc_07D5
    OR AX,AX
    JZ short loc_077E
    CMP AX,[4CA9h]
    JZ short loc_077E
loc_07D5:
    PUSH WORD PTR [4CADh]
    PUSH WORD PTR [4CB1h]
    PUSH WORD PTR [4CAFh]
    PUSH WORD PTR [4CB3h]
    CALL loc_2028
    POP WORD PTR [4CB3h]
    POP WORD PTR [4CAFh]
    POP WORD PTR [4CB1h]
    POP WORD PTR [4CADh]
    SUB AX,AX
    MOV SI,[18E8h]
    XOR SI,[18E4h]
    JNS short loc_0807
    MOV AX,[4CA7h]
loc_0807:
    MOV [18E2h],AX
    SUB BX,BX
    MOV BP,[4CA9h]
    MOV SI,[18E8h]
    XOR SI,[19C4h]
    JNS short loc_081C
    db 087h, 0DDh
loc_081C:
    MOV SI,[4CADh]
    MOV DI,[4CB1h]
    CMP DI,BX
    JZ short loc_0837
    CMP DI,BP
    JNZ short loc_0832
    MOV DI,BP
    MOV SI,[18E2h]
loc_0832:
    MOV DX,BX
    CALL loc_1ED6
loc_0837:
    MOV SI,[4CAFh]
    MOV DI,[4CB3h]
    CMP DI,BX
    JZ short loc_0852
    CMP DI,BP
    JNZ short loc_084D
    MOV DI,BP
    MOV SI,[18E2h]
loc_084D:
    MOV DX,BX
    CALL loc_1ED6
loc_0852:
    MOV AX,[5029h]
    MOV CX,[502Bh]
    MOV BX,4CB5h
    call far ptr gfx_dirtyRect
    CMP BYTE PTR [672Ch],2h
    JZ short loc_087E
    XOR WORD PTR [18E8h],BYTE PTR -0x1
    JZ short loc_087E
    MOV AH,[18E7h]
    call far ptr gfx_setPageDirect
    CALL loc_1EA0
    JMP near ptr loc_07D5
loc_087E:
    call far ptr gfx_resetBlitOffset
    RET
sub_1FEFE endp

sub_20104 proc far
    PUSH BP
    MOV BP,SP
    PUSH SI
    PUSH DI
    MOV AX,[BP+0Ah]
    MOV [1996h],AX
    MOV AX,[BP+0Ch]
    MOV [1998h],AX
    MOV AX,[BP+0Eh]
    MOV [199Ah],AX
    LES SI,DWORD PTR [BP+6h]
    MOV [198Ch],SI
    MOV [198Eh],ES
    db 026h
    LODSB
    MOV [19B2h],AL
    MOV BX,[BP+12h]
    SUB BX,[19B6h]
    MOV [1992h],BX
    MOV CX,[BP+14h]
    SUB CX,[19B8h]
    MOV [1994h],CX
    MOV BP,[BP+10h]
    SUB BP,[19B4h]
    MOV [1990h],BP
    CALL loc_0908
    JNZ short loc_0904
    CALL loc_0A09
    CMP SI,BYTE PTR +0x1
    JNZ short loc_08E0
    CMP WORD PTR [672Ch],BYTE PTR +0x2
    JNZ short loc_0904
loc_08E0:
    MOV CL,AL
    AND AL,60h
    CMP AL,60h
    JNZ short loc_08EB
    CALL loc_0A36
loc_08EB:
    TEST CL,40h
    JNZ short loc_08FB
    MOV AX,[19B8h]
    NEG AX
    CMP AX,[1994h]
    JZ short loc_0901
loc_08FB:
    CALL loc_0A80
    JMP short loc_0904
    NOP
loc_0901:
    CALL loc_0BE7
loc_0904:
    POP DI
    POP SI
    POP BP
    RETF
sub_20104 endp

sub_20188 proc near
loc_0908:
    PUSH SI
    MOV AX,[19D2h]
    IMUL BX
    MOV DI,DX
    MOV SI,AX
    MOV AX,[19CCh]
    IMUL CX
    ADD SI,AX
    ADC DI,DX
    MOV AX,[19C6h]
    IMUL BP
    ADD SI,AX
    ADC DI,DX
    SHL SI,1
    RCL DI,1
    MOV [199Ch],SI
    MOV [199Eh],DI
    MOV AX,[19D4h]
    IMUL BX
    MOV DI,DX
    MOV SI,AX
    MOV AX,[19CEh]
    IMUL CX
    ADD SI,AX
    ADC DI,DX
    MOV AX,[19C8h]
    IMUL BP
    ADD SI,AX
    ADC DI,DX
    SHL SI,1
    RCL DI,1
    MOV [19A0h],SI
    MOV [19A2h],DI
    MOV AX,[19D6h]
    IMUL BX
    MOV DI,DX
    MOV SI,AX
    MOV AX,[19D0h]
    IMUL CX
    ADD SI,AX
    ADC DI,DX
    MOV AX,[19CAh]
    IMUL BP
    ADD SI,AX
    ADC DI,DX
    SHL SI,1
    RCL DI,1
    MOV [19A4h],SI
    MOV [19A6h],DI
    CMP DI,[190Ch]
    JG short loc_0A02
    MOV BX,[19B2h]
    SHL BX,1
    CMP DI,[BX+191Ch]
    JL short loc_0A02
    MOV SI,[9DECh]
    MOV BP,[9DF2h]
    ADD SI,BX
    ADD BP,BX
    MOV CL,[5374h]
    XOR CL,1h
    MOV AX,DI
    CWD
    XOR AX,DX
    SUB AX,DX
    MOV DI,AX
    ADD AX,[SI]
    SAR AX,CL
    MOV SI,AX
    SAR SI,1
    SAR SI,1
    ADD SI,AX
    MOV AX,[199Eh]
    CWD
    XOR AX,DX
    SUB AX,DX
    CMP AX,SI
    JG short loc_0A02
    MOV SI,AX
    MOV AX,DI
    ADD AX,[BP+0h]
    SAR AX,CL
    MOV BX,AX
    CMP BYTE PTR [812h],0h
    JZ short loc_09E0
    SAR BX,1
    SAR BX,1
    SAR BX,1
    ADD BX,AX
    SAR BX,1
loc_09E0:
    MOV AX,[19A2h]
    CWD
    XOR AX,DX
    SUB AX,DX
    CMP AX,BX
    JG short loc_0A02
    ADD SI,AX
    SAR SI,1
    SAR SI,1
    ADD SI,DI
    MOV [19B0h],SI
    CMP SI,[190Ch]
    JG short loc_0A02
    SUB AX,AX
    POP SI
    RET
loc_0A02:
    MOV AX,1h
    OR AX,AX
    POP SI
    RET
sub_20188 endp

sub_20289 proc near
loc_0A09:
    MOV AL,[ES:SI]
    TEST AL,80h
    JZ short loc_0A31
    db 025h, 007h, 000h
    SHL AX,1
    MOV BX,AX
    MOV AX,[19B0h]
    MOV CL,[5C5Eh]
    SAR AX,CL
    CMP AX,[BX+18FCh]
    JNG short loc_0A2C
    ADD SI,[ES:SI+1h]
    JMP short loc_0A09
loc_0A2C:
    ADD SI,BYTE PTR +0x3
    JMP short loc_0A09
loc_0A31:
    RET
sub_20289 endp

    db 0C4h, 036h, 08Ch, 019h
sub_202B6 proc near
loc_0A36:
    db 026h
    LODSB
    db 025h, 003h, 000h
    SHL AX,1
    MOV BX,AX
    MOV AX,[1A0Ah]
    MOV [BX+1994h],AX
    RET
sub_202B6 endp

sub_202C7 proc far
    PUSH BP
    MOV BP,SP
    PUSH DI
    MOV CX,[BP+0Ah]
    MOV BX,[BP+8h]
    MOV BP,[BP+6h]
    CALL loc_0908
    POP DI
    POP BP
    RETF
sub_202C7 endp

sub_202DA proc far
    PUSH SI
    LES SI,DWORD PTR [198Ch]
    CALL loc_0A09
    MOV [198Ch],SI
    POP SI
    RETF
sub_202DA endp

    db 055h, 056h, 057h, 0C4h, 036h, 08Ch, 019h, 0E8h, 00Eh, 000h, 05Fh, 05Eh, 05Dh, 0C3h
sub_202F6 proc far
    PUSH BP
    PUSH SI
    PUSH DI
    CALL loc_0B60
    POP DI
    POP SI
    POP BP
    RETF
sub_202F6 endp

sub_20300 proc near
loc_0A80:
    MOV [198Ch],SI
    MOV [198Eh],ES
    MOV AX,DS
    MOV ES,AX
    MOV AX,[19FCh]
    db 03Dh, 023h, 000h
    JL short loc_0AAC
    MOV BX,[3248h]
    MOV CX,22h
    MOV SI,324Ah
    MOV DI,3248h
    REP movsw
    MOV DI,BX
    DEC AX
    MOV [19FCh],AX
    JMP short loc_0AB5
    NOP
loc_0AAC:
    MOV DI,2DE8h
    MOV CL,5h
    SHL AX,CL
    ADD DI,AX
loc_0AB5:
    MOV AX,[19A4h]
    MOV DX,[19A6h]
    MOV CX,[98BCh]
    MOV BX,CX
    SHL CX,1
    NEG CX
    ADD CX,BYTE PTR +0x8
    JZ short loc_0AD1
loc_0ACB:
    SAR DX,1
    RCR AX,1
    LOOP short loc_0ACB
loc_0AD1:
    CMP BX,BYTE PTR +0x2
    JNZ short loc_0AE0
    CMP WORD PTR [19B2h],BYTE PTR +0x5
    JNZ short loc_0AE0
    ADD DX,BYTE PTR +0x20
loc_0AE0:
    MOV BP,DI
    PUSH AX
    PUSH DX
    STOSW
    MOV AX,DX
    STOSW
    MOV AX,[198Ch]
    STOSW
    MOV AX,[198Eh]
    STOSW
    MOV AX,[1990h]
    STOSW
    MOV AX,[1992h]
    STOSW
    MOV AX,[1994h]
    STOSW
    MOV AX,[1996h]
    STOSW
    MOV AX,[1998h]
    STOSW
    MOV AX,[199Ah]
    STOSW
    MOV AX,[199Ch]
    STOSW
    MOV AX,[199Eh]
    STOSW
    MOV AX,[19A0h]
    STOSW
    MOV AX,[19A2h]
    STOSW
    MOV AX,[19A4h]
    STOSW
    MOV AX,[19A6h]
    STOSW
    POP DX
    POP AX
    MOV BX,[19FCh]
    SHL BX,1
    MOV CX,BX
loc_0B2A:
    SUB BX,BYTE PTR +0x2
    JS short loc_0B3E
    MOV DI,[BX+3248h]
    CMP DX,[DI+2h]
    JG short loc_0B2A
    JL short loc_0B3E
    CMP AX,[DI]
    JA short loc_0B2A
loc_0B3E:
    SUB CX,BYTE PTR +0x2
    MOV DI,CX
    ADD DI,324Ah
    MOV SI,CX
    ADD SI,3248h
    SUB CX,BX
    JNG short loc_0B59
    SHR CX,1
    CLI
    STD
    REP movsw
    CLD
    STI
loc_0B59:
    MOV [DI],BP
    INC WORD PTR [19FCh]
    RET
sub_20300 endp

sub_203E0 proc near
loc_0B60:
    CMP WORD PTR [19FCh],BYTE PTR +0x0
    JZ short loc_0BBB
    MOV SI,3246h
loc_0B6A:
    ADD SI,BYTE PTR +0x2
    PUSH SI
    MOV SI,[SI]
    ADD SI,BYTE PTR +0x4
    LODSW
    MOV [198Ch],AX
    LODSW
    MOV [198Eh],AX
    LODSW
    MOV [1990h],AX
    LODSW
    MOV [1992h],AX
    LODSW
    MOV [1994h],AX
    LODSW
    MOV [1996h],AX
    LODSW
    MOV [1998h],AX
    LODSW
    MOV [199Ah],AX
    LODSW
    MOV [199Ch],AX
    LODSW
    MOV [199Eh],AX
    LODSW
    MOV [19A0h],AX
    LODSW
    MOV [19A2h],AX
    LODSW
    MOV [19A4h],AX
    LODSW
    MOV [19A6h],AX
    LES SI,DWORD PTR [198Ch]
    CALL loc_0BE7
    POP SI
    DEC WORD PTR [19FCh]
    JZ short loc_0BBB
    JMP short loc_0B6A
loc_0BBB:
    RET
sub_203E0 endp

    db 055h, 056h, 057h, 0C4h, 036h, 08Ch, 019h, 0E8h, 021h, 000h, 05Fh, 05Eh, 05Dh, 0C3h
sub_2044A proc far
    PUSH BP
    PUSH SI
    PUSH DI
    MOV CX,[1994h]
    MOV AX,[1992h]
    MOV BP,[1990h]
    LES SI,DWORD PTR [198Ch]
    CALL loc_0CB4
    MOV [198Ch],SI
    POP DI
    POP SI
    POP BP
    RETF
sub_2044A endp

sub_20467 proc near
loc_0BE7:
    MOV AH,[83h]
    OR AH,AH
    JZ short loc_0C16
    MOV AL,[19A7h]
    CBW
    NOT AH
    AND AL,AH
    SUB AH,AH
    SHR AX,1
    MOV AH,AL
    SUB AH,0h
    JNS short loc_0C04
    SUB AH,AH
loc_0C04:
    CMP AH,7h
    JNG short loc_0C0B
    MOV AH,7h
loc_0C0B:
    SHL AH,1
    SHL AH,1
    SHL AH,1
    SHL AH,1
    ADD AH,80h
loc_0C16:
    MOV [18EAh],AH
    MOV AL,[ES:SI]
    AND AL,3Fh
    CMP AL,3Eh
    JL short loc_0C2B
    JZ short loc_0C28
    JMP near ptr loc_198A
loc_0C28:
    JMP near ptr loc_1AF4
loc_0C2B:
    MOV AX,[1996h]
    OR AX,[1998h]
    OR AX,[199Ah]
    OR AL,AH
    MOV [19A8h],AL
    JZ short loc_0C60
    PUSH SI
    MOV DI,19D8h
    MOV CX,[1996h]
    MOV SI,[1998h]
    MOV BP,[199Ah]
    CALL loc_147B
    MOV BX,19D8h
    MOV SI,19C6h
    MOV DI,19EAh
    CALL loc_15CD
    POP SI
    JMP short loc_0C96
    NOP
loc_0C60:
    MOV AX,[19C6h]
    MOV [19EAh],AX
    MOV AX,[19C8h]
    MOV [19ECh],AX
    MOV AX,[19CAh]
    MOV [19EEh],AX
    MOV AX,[19CCh]
    MOV [19F0h],AX
    MOV AX,[19CEh]
    MOV [19F2h],AX
    MOV AX,[19D0h]
    MOV [19F4h],AX
    MOV AX,[19D2h]
    MOV [19F6h],AX
    MOV AX,[19D4h]
    MOV [19F8h],AX
    MOV AX,[19D6h]
    MOV [19FAh],AX
loc_0C96:
    MOV CX,[1994h]
    MOV AX,[1992h]
    MOV BP,[1990h]
    CALL loc_0CB4
    CALL loc_0113
    CALL loc_10F0
    CALL loc_11D8
    CALL loc_176A
    CALL loc_0137
    RET
sub_20467 endp

sub_20534 proc near
loc_0CB4:
    NEG BP
    NEG AX
    NEG CX
    CMP BYTE PTR [19A8h],0h
    JNZ short loc_0CCF
    MOV [42CEh],BP
    MOV [42D0h],CX
    MOV [42D2h],AX
    JMP near ptr loc_0D5E
loc_0CCF:
    MOV [42D4h],AX
    CALL loc_1599
    PUSH SI
    MOV AX,[42D4h]
    IMUL WORD PTR [19E4h]
    MOV DI,DX
    MOV SI,AX
    MOV AX,CX
    IMUL WORD PTR [19DEh]
    ADD SI,AX
    ADC DI,DX
    MOV AX,BP
    IMUL WORD PTR [19D8h]
    ADD SI,AX
    ADC DI,DX
    SHL SI,1
    RCL DI,1
    SHL SI,1
    ADC DI,BYTE PTR +0x0
    MOV [42CEh],DI
    MOV AX,[42D4h]
    IMUL WORD PTR [19E6h]
    MOV DI,DX
    MOV SI,AX
    MOV AX,CX
    IMUL WORD PTR [19E0h]
    ADD SI,AX
    ADC DI,DX
    MOV AX,BP
    IMUL WORD PTR [19DAh]
    ADD SI,AX
    ADC DI,DX
    SHL SI,1
    RCL DI,1
    SHL SI,1
    ADC DI,BYTE PTR +0x0
    MOV [42D0h],DI
    MOV AX,[42D4h]
    IMUL WORD PTR [19E8h]
    MOV DI,DX
    MOV SI,AX
    MOV AX,CX
    IMUL WORD PTR [19E2h]
    ADD SI,AX
    ADC DI,DX
    MOV AX,BP
    IMUL WORD PTR [19DCh]
    ADD SI,AX
    ADC DI,DX
    SHL SI,1
    RCL DI,1
    SHL SI,1
    ADC DI,BYTE PTR +0x0
    MOV [42D2h],DI
    POP SI
    CALL loc_1599
loc_0D5E:
    db 026h
    LODSB
    db 025h, 01Fh, 000h
    MOV [1A00h],AX
    MOV CX,AX
    SUB AX,AX
    CMP CX,BYTE PTR +0x10
    JNG short loc_0D70
    INC AX
loc_0D70:
    MOV [1A04h],AL
    MOV WORD PTR [1A06h],0FFFFh
    MOV WORD PTR [1A08h],0FFFFh
    OR CX,CX
    JZ short loc_0DC7
    MOV BX,1h
    SUB DI,DI
loc_0D88:
    PUSH BX
    db 026h
    LODSW
    IMUL WORD PTR [42CEh]
    MOV BP,AX
    MOV BX,DX
    db 026h
    LODSW
    IMUL WORD PTR [42D2h]
    ADD BP,AX
    ADC BX,DX
    db 026h
    LODSW
    IMUL WORD PTR [42D0h]
    ADD BP,AX
    ADC BX,DX
    db 026h
    LODSW
    CWD
    CMP BX,DX
    POP BX
    JG short loc_0DBF
    JL short loc_0DB5
    CMP BP,AX
    JNC short loc_0DBF
loc_0DB5:
    XOR [1A06h],BX
    XOR [1A08h],DI
    INC CH
loc_0DBF:
    SHL BX,1
    RCL DI,1
    DEC CL
    JNZ short loc_0D88
loc_0DC7:
    MOV AL,[1A00h]
    CMP AL,4h
    JL short loc_0DD6
    CMP AL,CH
    JNZ short loc_0DD6
    INC WORD PTR [42D6h]
loc_0DD6:
    RET
sub_20534 endp

    db 0C3h
sub_20658 proc far
    PUSH BP
    PUSH SI
    PUSH DI
    CALL loc_0DF4
    POP DI
    POP SI
    POP BP
    RETF
sub_20658 endp

    db 055h, 056h, 057h, 0C4h, 036h, 08Ch, 019h, 0E8h, 004h, 003h, 089h, 036h, 08Ch, 019h, 05Fh, 05Eh
    db 05Dh, 0C3h
sub_20674 proc near
loc_0DF4:
    CMP WORD PTR [1566h],BYTE PTR +0x0
    JNZ short loc_0DFC
    RET
loc_0DFC:
    MOV BX,[1560h]
    DEC BX
    SHL BX,1
    MOV DI,BX
    SHL DI,1
loc_0E07:
    MOV CX,[BX-6AB4h]
    MOV AX,[19C6h]
    IMUL CX
    SHL AX,1
    RCL DX,1
    MOV [DI+2A88h],AX
    MOV [DI+2A8Ah],DX
    MOV AX,[19C8h]
    IMUL CX
    SHL AX,1
    RCL DX,1
    MOV [DI+2B08h],AX
    MOV [DI+2B0Ah],DX
    MOV AX,[19CAh]
    IMUL CX
    SHL AX,1
    RCL DX,1
    MOV [DI+2B88h],AX
    MOV [DI+2B8Ah],DX
    SUB DI,BYTE PTR +0x4
    SUB BX,BYTE PTR +0x2
    JNS short loc_0E07
    MOV BX,[1564h]
    DEC BX
    SHL BX,1
    MOV DI,BX
    SHL DI,1
loc_0E51:
    MOV CX,[BX-6A30h]
    MOV AX,[19CCh]
    IMUL CX
    SHL AX,1
    RCL DX,1
    MOV [DI+2C08h],AX
    MOV [DI+2C0Ah],DX
    MOV AX,[19CEh]
    IMUL CX
    SHL AX,1
    RCL DX,1
    MOV [DI+2C28h],AX
    MOV [DI+2C2Ah],DX
    MOV AX,[19D0h]
    IMUL CX
    SHL AX,1
    RCL DX,1
    MOV [DI+2C48h],AX
    MOV [DI+2C4Ah],DX
    SUB DI,BYTE PTR +0x4
    SUB BX,BYTE PTR +0x2
    JNS short loc_0E51
    MOV BX,[1562h]
    DEC BX
    SHL BX,1
    MOV DI,BX
    SHL DI,1
loc_0E9B:
    MOV CX,[BX-6A72h]
    MOV AX,[19D2h]
    IMUL CX
    SHL AX,1
    RCL DX,1
    MOV [DI+2C68h],AX
    MOV [DI+2C6Ah],DX
    MOV AX,[19D4h]
    IMUL CX
    SHL AX,1
    RCL DX,1
    MOV [DI+2CE8h],AX
    MOV [DI+2CEAh],DX
    MOV AX,[19D6h]
    IMUL CX
    SHL AX,1
    RCL DX,1
    MOV [DI+2D68h],AX
    MOV [DI+2D6Ah],DX
    SUB DI,BYTE PTR +0x4
    SUB BX,BYTE PTR +0x2
    JNS short loc_0E9B
    MOV SI,[1566h]
    DEC SI
loc_0EDF:
    MOV BX,[SI-79A2h]
    AND BX,0FFh
    SHL BX,1
    SHL BX,1
    MOV DI,[SI-7802h]
    AND DI,0FFh
    SHL DI,1
    SHL DI,1
    MOV BP,[SI-7748h]
    AND BP,0FFh
    SHL BP,1
    SHL BP,1
    LES AX,DWORD PTR [BX+2A88h]
    MOV DX,ES
    LES CX,DWORD PTR [BP+2C08h]
    ADD AX,CX
    MOV CX,ES
    ADC DX,CX
    LES CX,DWORD PTR [DI+2C68h]
    ADD AX,CX
    MOV CX,ES
    ADC DX,CX
    SHL SI,1
    SHL SI,1
    MOV [SI+2380h],AX
    MOV [SI+2382h],DX
    LES AX,DWORD PTR [BX+2B08h]
    MOV DX,ES
    LES CX,DWORD PTR [BP+2C28h]
    ADD AX,CX
    MOV CX,ES
    ADC DX,CX
    LES CX,DWORD PTR [DI+2CE8h]
    ADD AX,CX
    MOV CX,ES
    ADC DX,CX
    MOV [SI+25D8h],AX
    MOV [SI+25DAh],DX
    LES AX,DWORD PTR [BX+2B88h]
    MOV DX,ES
    LES CX,DWORD PTR [BP+2C48h]
    ADD AX,CX
    MOV CX,ES
    ADC DX,CX
    LES CX,DWORD PTR [DI+2D68h]
    ADD AX,CX
    MOV CX,ES
    ADC DX,CX
    MOV [SI+2830h],AX
    MOV [SI+2832h],DX
    SHR SI,1
    SHR SI,1
    DEC SI
    JS short loc_0F77
    JMP near ptr loc_0EDF
loc_0F77:
    RET
sub_20674 endp

loc_0F78:
    MOV BL,AL
    AND BX,BYTE PTR +0x7f
    SHL BX,1
    SHL BX,1
    MOV [42D9h],BX
    MOV BX,0FFFCh
loc_0F88:
    ADD BX,BYTE PTR +0x4
    CMP BX,[42D9h]
    JL short loc_0F92
    RET
loc_0F92:
    CALL loc_1BA2
    INC SI
    OR AX,AX
    JZ short loc_0F88
    MOV BP,[ES:SI-1h]
    AND BP,0FFh
    MOV AL,[BP-7748h]
    SUB AH,AH
    SHL AX,1
    MOV BP,AX
    MOV CX,[BP-6A30h]
    MOV BP,[ES:SI-1h]
    AND BP,0FFh
    MOV AL,[BP-7802h]
    SUB AH,AH
    SHL AX,1
    MOV BP,AX
    MOV AX,[BP-6A72h]
    MOV [42DBh],AX
    MOV BP,[ES:SI-1h]
    AND BP,0FFh
    MOV AL,[BP-79A2h]
    SUB AH,AH
    SHL AX,1
    MOV BP,AX
    MOV BP,[BP-6AB4h]
    PUSH SI
    MOV AX,[42DBh]
    IMUL WORD PTR [19F6h]
    MOV DI,DX
    MOV SI,AX
    MOV AX,[19F0h]
    IMUL CX
    ADD SI,AX
    ADC DI,DX
    MOV AX,[19EAh]
    IMUL BP
    ADD SI,AX
    ADC DI,DX
    SHL SI,1
    RCL DI,1
    ADD SI,[199Ch]
    ADC DI,[199Eh]
    MOV [BX+1A0Ch],SI
    MOV [BX+1A0Eh],DI
    MOV AX,[42DBh]
    IMUL WORD PTR [19F8h]
    MOV DI,DX
    MOV SI,AX
    MOV AX,[19F2h]
    IMUL CX
    ADD SI,AX
    ADC DI,DX
    MOV AX,[19ECh]
    IMUL BP
    ADD SI,AX
    ADC DI,DX
    SHL SI,1
    RCL DI,1
    ADD SI,[19A0h]
    ADC DI,[19A2h]
    MOV [BX+1BF0h],SI
    MOV [BX+1BF2h],DI
    MOV AX,[42DBh]
    IMUL WORD PTR [19FAh]
    MOV DI,DX
    MOV SI,AX
    MOV AX,[19F4h]
    IMUL CX
    ADD SI,AX
    ADC DI,DX
    MOV AX,[19EEh]
    IMUL BP
    ADD SI,AX
    ADC DI,DX
    SHL SI,1
    RCL DI,1
    ADD SI,[19A4h]
    ADC DI,[19A6h]
    MOV [BX+1DD4h],SI
    MOV [BX+1DD6h],DI
    CALL loc_0078
    POP SI
    JMP near ptr loc_0F88
loc_107A:
    JMP near ptr loc_0F78
loc_107D:
    CMP BYTE PTR [42D8h],0h
    JNZ short loc_107A
    MOV CL,AL
    AND CX,BYTE PTR +0x7f
    SUB BX,BX
loc_108B:
    CALL loc_1BA2
    JNZ short loc_1097
    INC SI
    ADD BX,BYTE PTR +0x4
    LOOP short loc_108B
    RET
loc_1097:
    db 026h
    LODSB
    SUB AH,AH
    SHL AX,1
    SHL AX,1
    MOV DI,AX
    MOV AX,[199Ch]
    ADD AX,[DI+2380h]
    MOV [BX+1A0Ch],AX
    MOV AX,[199Eh]
    ADC AX,[DI+2382h]
    MOV [BX+1A0Eh],AX
    MOV AX,[19A0h]
    ADD AX,[DI+25D8h]
    MOV [BX+1BF0h],AX
    MOV AX,[19A2h]
    ADC AX,[DI+25DAh]
    MOV [BX+1BF2h],AX
    MOV AX,[19A4h]
    ADD AX,[DI+2830h]
    MOV [BX+1DD4h],AX
    MOV AX,[19A6h]
    ADC AX,[DI+2832h]
    MOV [BX+1DD6h],AX
    PUSH CX
    PUSH SI
    CALL loc_0078
    POP SI
    POP CX
    ADD BX,BYTE PTR +0x4
    LOOP short loc_108B
    RET
sub_20970 proc near
loc_10F0:
    db 026h
    LODSB
    TEST AL,80h
    JNZ short loc_107D
    TEST AL,7Fh
    JZ short loc_1113
    MOV BL,AL
    AND BX,BYTE PTR +0x7f
    SHL BX,1
    SHL BX,1
    MOV [42D9h],BX
    MOV BX,0FFFCh
loc_110A:
    ADD BX,BYTE PTR +0x4
    CMP BX,[42D9h]
    JL short loc_1114
loc_1113:
    RET
loc_1114:
    CALL loc_1BA2
    ADD SI,BYTE PTR +0x6
    OR AX,AX
    JZ short loc_110A
    MOV BP,[ES:SI-6h]
    MOV CX,[ES:SI-2h]
    MOV AX,[ES:SI-4h]
    MOV [42DBh],AX
    PUSH SI
    IMUL WORD PTR [19F6h]
    MOV DI,DX
    MOV SI,AX
    MOV AX,[19F0h]
    IMUL CX
    ADD SI,AX
    ADC DI,DX
    MOV AX,[19EAh]
    IMUL BP
    ADD SI,AX
    ADC DI,DX
    SHL SI,1
    RCL DI,1
    ADD SI,[199Ch]
    ADC DI,[199Eh]
    MOV [BX+1A0Ch],SI
    MOV [BX+1A0Eh],DI
    MOV AX,[42DBh]
    IMUL WORD PTR [19F8h]
    MOV DI,DX
    MOV SI,AX
    MOV AX,[19F2h]
    IMUL CX
    ADD SI,AX
    ADC DI,DX
    MOV AX,[19ECh]
    IMUL BP
    ADD SI,AX
    ADC DI,DX
    SHL SI,1
    RCL DI,1
    ADD SI,[19A0h]
    ADC DI,[19A2h]
    MOV [BX+1BF0h],SI
    MOV [BX+1BF2h],DI
    MOV AX,[42DBh]
    IMUL WORD PTR [19FAh]
    MOV DI,DX
    MOV SI,AX
    MOV AX,[19F4h]
    IMUL CX
    ADD SI,AX
    ADC DI,DX
    MOV AX,[19EEh]
    IMUL BP
    ADD SI,AX
    ADC DI,DX
    SHL SI,1
    RCL DI,1
    ADD SI,[19A4h]
    ADC DI,[19A6h]
    MOV [BX+1DD4h],SI
    MOV [BX+1DD6h],DI
    CALL loc_0078
    POP SI
    JMP near ptr loc_110A
sub_20970 endp

    db 000h
sub_20A46 proc far
    db 055h
    db 056h
    PUSH DI
    LES SI,DWORD PTR [198Ch]
    CALL loc_11D8
    MOV [198Ch],SI
    POP DI
    POP SI
    POP BP
    RETF
sub_20A46 endp

sub_20A58 proc near
loc_11D8:
    SUB AH,AH
    db 026h
    LODSB
    OR AX,AX
    JZ short loc_11F5
    MOV CX,AX
    SUB DI,DI
    ADD DI,328Eh
loc_11E8:
    CALL loc_1BA2
    JNZ short loc_11F6
    ADD SI,BYTE PTR +0x2
    ADD DI,BYTE PTR +0x1a
    LOOP short loc_11E8
loc_11F5:
    RET
loc_11F6:
    SUB AH,AH
    db 026h
    LODSB
    MOV BX,AX
    SHL BX,1
    SHL BX,1
    db 026h
    LODSB
    MOV BP,AX
    SHL BP,1
    SHL BP,1
    MOV BYTE PTR [DI+18h],0h
    CMP WORD PTR [BX+1DD6h],BYTE PTR +0x1
    JL short loc_1240
    CMP WORD PTR [BP+1DD6h],BYTE PTR +0x1
    JL short loc_1238
    MOV AX,[BX+1FB8h]
    MOV [DI],AX
    MOV AX,[BX+1FBAh]
    MOV [DI+2h],AX
    MOV AX,[BX+219Ch]
    MOV [DI+4h],AX
    MOV AX,[BX+219Eh]
    MOV [DI+6h],AX
    JMP short loc_1251
    NOP
loc_1238:
    db 087h, 0EBh
    CALL loc_1282
    JMP short loc_1251
    NOP
loc_1240:
    CMP WORD PTR [BP+1DD6h],BYTE PTR +0x1
    JNL short loc_124E
    OR BYTE PTR [DI+18h],80h
    JMP short loc_1278
    NOP
loc_124E:
    CALL loc_1282
loc_1251:
    MOV AX,[BP+1FB8h]
    MOV [DI+8h],AX
    MOV AX,[BP+1FBAh]
    MOV [DI+0Ah],AX
    MOV AX,[BP+219Ch]
    MOV [DI+0Ch],AX
    MOV AX,[BP+219Eh]
    MOV [DI+0Eh],AX
    PUSH CX
    PUSH SI
    CALL loc_015D
    MOV ES,[198Eh]
    POP SI
    POP CX
loc_1278:
    ADD DI,BYTE PTR +0x1a
    DEC CX
    JZ short loc_1281
    JMP near ptr loc_11E8
loc_1281:
    RET
sub_20A58 endp

sub_20B02 proc near
loc_1282:
    PUSH ES
    PUSH CX
    PUSH SI
    PUSH DI
    MOV AX,[BP+1DD4h]
    MOV DX,[BP+1DD6h]
    MOV CX,DX
    SUB CX,[BX+1DD6h]
    DEC DX
    DIV CX
    SHR AX,1
    MOV CX,AX
    MOV DX,[BP+1A0Ch]
    MOV AX,[BP+1A0Eh]
    MOV SI,DX
    MOV DI,AX
    SUB DX,[BX+1A0Ch]
    SBB AX,[BX+1A0Eh]
    SHL DX,1
    db 015h, 000h, 000h
    IMUL CX
    SHL AX,1
    RCL DX,1
    SUB SI,AX
    SBB DI,DX
    MOV [1BECh],SI
    MOV [1BEEh],DI
    MOV DX,[BP+1BF0h]
    MOV AX,[BP+1BF2h]
    MOV SI,DX
    MOV DI,AX
    SUB DX,[BX+1BF0h]
    SBB AX,[BX+1BF2h]
    SHL DX,1
    db 015h, 000h, 000h
    IMUL CX
    SHL AX,1
    RCL DX,1
    SUB SI,AX
    SBB DI,DX
    MOV [1DD0h],SI
    MOV [1DD2h],DI
    MOV WORD PTR [1FB4h],0h
    MOV WORD PTR [1FB6h],1h
    PUSH BX
    MOV BX,1E0h
    CALL loc_0078
    POP BX
    POP DI
    LES AX,DWORD PTR [2198h]
    MOV [DI],AX
    MOV [DI+2h],ES
    MOV [DI+10h],AX
    MOV [DI+12h],ES
    LES AX,DWORD PTR [237Ch]
    MOV [DI+4h],AX
    MOV [DI+6h],ES
    MOV [DI+14h],AX
    MOV [DI+16h],ES
    OR WORD PTR [DI+18h],BYTE PTR +0x40
    POP SI
    POP CX
    POP ES
    RET
sub_20B02 endp

    db 000h
sub_20BAE proc far
    db 055h
    db 08Bh
    IN AL,DX
    PUSH SI
    PUSH DI
    MOV DI,[BP+6h]
    MOV CX,[BP+8h]
    MOV SI,[BP+0Ah]
    MOV BP,[BP+0Ch]
    CALL loc_135F
    POP DI
    POP SI
    POP BP
    RETF
sub_20BAE endp

    db 055h, 056h, 057h, 0BFh, 0D8h, 019h, 08Bh, 00Eh, 096h, 019h, 08Bh, 036h, 098h, 019h, 08Bh, 02Eh
    db 09Ah, 019h, 0E8h, 020h, 001h, 05Fh, 05Eh, 05Dh, 0C3h
sub_20BDF proc near
loc_135F:
    MOV BX,CX
    call far ptr sub_13BC1
    MOV [19BAh],BX
    MOV BX,CX
    call far ptr sub_13BC5
    MOV [19BCh],BX
    MOV BX,BP
    call far ptr sub_13BC1
    MOV [19C2h],BX
    MOV BX,BP
    call far ptr sub_13BC5
    MOV [19C4h],BX
    MOV BX,SI
    call far ptr sub_13BC1
    MOV [19BEh],BX
    MOV BX,SI
    call far ptr sub_13BC5
    MOV [19C0h],BX
    MOV AX,[19BEh]
    IMUL WORD PTR [19C2h]
    SHL AX,1
    RCL DX,1
    MOV SI,DX
    MOV AX,DX
    IMUL WORD PTR [19BAh]
    SHL AX,1
    RCL DX,1
    MOV BX,AX
    MOV CX,DX
    MOV AX,[19BCh]
    IMUL WORD PTR [19C4h]
    SHL AX,1
    RCL DX,1
    ADD AX,BX
    ADC DX,CX
    MOV [DI],DX
    MOV AX,[19BEh]
    IMUL WORD PTR [19C4h]
    SHL AX,1
    RCL DX,1
    MOV BP,DX
    MOV AX,DX
    IMUL WORD PTR [19BAh]
    SHL AX,1
    RCL DX,1
    MOV BX,AX
    MOV CX,DX
    MOV AX,[19BCh]
    IMUL WORD PTR [19C2h]
    SHL AX,1
    RCL DX,1
    SUB BX,AX
    SBB CX,DX
    MOV [DI+2h],CX
    MOV AX,[19BAh]
    IMUL WORD PTR [19C0h]
    SHL AX,1
    RCL DX,1
    MOV [DI+4h],DX
    MOV AX,[19C2h]
    IMUL WORD PTR [19C0h]
    SHL AX,1
    RCL DX,1
    MOV [DI+6h],DX
    MOV AX,[19C4h]
    IMUL WORD PTR [19C0h]
    SHL AX,1
    RCL DX,1
    MOV [DI+8h],DX
    MOV AX,[19BEh]
    NEG AX
    MOV [DI+0Ah],AX
    MOV AX,SI
    IMUL WORD PTR [19BCh]
    SHL AX,1
    RCL DX,1
    MOV BX,AX
    MOV CX,DX
    MOV AX,[19BAh]
    IMUL WORD PTR [19C4h]
    SHL AX,1
    RCL DX,1
    SUB BX,AX
    SBB CX,DX
    MOV [DI+0Ch],CX
    MOV AX,BP
    IMUL WORD PTR [19BCh]
    SHL AX,1
    RCL DX,1
    MOV BX,AX
    MOV CX,DX
    MOV AX,[19BAh]
    IMUL WORD PTR [19C2h]
    SHL AX,1
    RCL DX,1
    ADD AX,BX
    ADC DX,CX
    MOV [DI+0Eh],DX
    MOV AX,[19BCh]
    IMUL WORD PTR [19C0h]
    SHL AX,1
    RCL DX,1
    MOV [DI+10h],DX
    RET
sub_20BDF endp

sub_20CFB proc near
loc_147B:
    MOV BX,CX
    call far ptr sub_13BC1
    MOV [19BAh],BX
    MOV BX,CX
    call far ptr sub_13BC5
    MOV [19BCh],BX
    MOV BX,BP
    call far ptr sub_13BC1
    MOV [19C2h],BX
    MOV BX,BP
    call far ptr sub_13BC5
    MOV [19C4h],BX
    MOV BX,SI
    call far ptr sub_13BC1
    MOV [19BEh],BX
    MOV BX,SI
    call far ptr sub_13BC5
    MOV [19C0h],BX
    MOV AX,[19BEh]
    IMUL WORD PTR [19C2h]
    SHL AX,1
    RCL DX,1
    MOV SI,DX
    MOV AX,DX
    IMUL WORD PTR [19BAh]
    SHL AX,1
    RCL DX,1
    MOV BX,AX
    MOV CX,DX
    MOV AX,[19BCh]
    IMUL WORD PTR [19C4h]
    SHL AX,1
    RCL DX,1
    SUB AX,BX
    SBB DX,CX
    MOV [DI],DX
    MOV AX,[19BEh]
    IMUL WORD PTR [19C4h]
    SHL AX,1
    RCL DX,1
    MOV BP,DX
    MOV AX,DX
    IMUL WORD PTR [19BAh]
    SHL AX,1
    RCL DX,1
    MOV BX,AX
    MOV CX,DX
    MOV AX,[19BCh]
    IMUL WORD PTR [19C2h]
    SHL AX,1
    RCL DX,1
    ADD BX,AX
    ADC CX,DX
    MOV [DI+6h],CX
    MOV AX,[19BAh]
    IMUL WORD PTR [19C0h]
    SHL AX,1
    RCL DX,1
    NEG DX
    MOV [DI+0Ch],DX
    MOV AX,[19C2h]
    IMUL WORD PTR [19C0h]
    SHL AX,1
    RCL DX,1
    NEG DX
    MOV [DI+2h],DX
    MOV AX,[19C4h]
    IMUL WORD PTR [19C0h]
    SHL AX,1
    RCL DX,1
    MOV [DI+8h],DX
    MOV AX,[19BEh]
    MOV [DI+0Eh],AX
    MOV AX,SI
    IMUL WORD PTR [19BCh]
    SHL AX,1
    RCL DX,1
    MOV BX,AX
    MOV CX,DX
    MOV AX,[19BAh]
    IMUL WORD PTR [19C4h]
    SHL AX,1
    RCL DX,1
    ADD BX,AX
    ADC CX,DX
    MOV [DI+4h],CX
    MOV AX,BP
    IMUL WORD PTR [19BCh]
    SHL AX,1
    RCL DX,1
    MOV BX,AX
    MOV CX,DX
    MOV AX,[19BAh]
    IMUL WORD PTR [19C2h]
    SHL AX,1
    RCL DX,1
    SUB AX,BX
    SBB DX,CX
    MOV [DI+0Ah],DX
    MOV AX,[19BCh]
    IMUL WORD PTR [19C0h]
    SHL AX,1
    RCL DX,1
    MOV [DI+10h],DX
    RET
sub_20CFB endp

sub_20E19 proc near
loc_1599:
    MOV BX,19D8h
    MOV AX,[BX+2h]
    XCHG [BX+6h],AX
    MOV [BX+2h],AX
    MOV AX,[BX+4h]
    XCHG [BX+0Ch],AX
    MOV [BX+4h],AX
    MOV AX,[BX+0Ah]
    XCHG [BX+0Eh],AX
    MOV [BX+0Ah],AX
    RET
sub_20E19 endp

sub_20E38 proc far
    PUSH BP
    MOV BP,SP
    PUSH SI
    PUSH DI
    MOV BX,[BP+6h]
    MOV SI,[BP+8h]
    MOV DI,[BP+0Ah]
    CALL loc_15CD
    POP DI
    POP SI
    POP BP
    RETF
sub_20E38 endp

sub_20E4D proc near
loc_15CD:
    MOV AX,[BX]
    IMUL WORD PTR [SI]
    SHL AX,1
    RCL DX,1
    MOV BP,AX
    MOV CX,DX
    MOV AX,[BX+2h]
    IMUL WORD PTR [SI+6h]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV AX,[BX+4h]
    IMUL WORD PTR [SI+0Ch]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV [DI],CX
    MOV AX,[BX]
    IMUL WORD PTR [SI+2h]
    SHL AX,1
    RCL DX,1
    MOV BP,AX
    MOV CX,DX
    MOV AX,[BX+2h]
    IMUL WORD PTR [SI+8h]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV AX,[BX+4h]
    IMUL WORD PTR [SI+0Eh]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV [DI+2h],CX
    MOV AX,[BX]
    IMUL WORD PTR [SI+4h]
    SHL AX,1
    RCL DX,1
    MOV BP,AX
    MOV CX,DX
    MOV AX,[BX+2h]
    IMUL WORD PTR [SI+0Ah]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV AX,[BX+4h]
    IMUL WORD PTR [SI+10h]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV [DI+4h],CX
    MOV AX,[BX+6h]
    IMUL WORD PTR [SI]
    SHL AX,1
    RCL DX,1
    MOV BP,AX
    MOV CX,DX
    MOV AX,[BX+8h]
    IMUL WORD PTR [SI+6h]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV AX,[BX+0Ah]
    IMUL WORD PTR [SI+0Ch]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV [DI+6h],CX
    MOV AX,[BX+6h]
    IMUL WORD PTR [SI+2h]
    SHL AX,1
    RCL DX,1
    MOV BP,AX
    MOV CX,DX
    MOV AX,[BX+8h]
    IMUL WORD PTR [SI+8h]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV AX,[BX+0Ah]
    IMUL WORD PTR [SI+0Eh]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV [DI+8h],CX
    MOV AX,[BX+6h]
    IMUL WORD PTR [SI+4h]
    SHL AX,1
    RCL DX,1
    MOV BP,AX
    MOV CX,DX
    MOV AX,[BX+8h]
    IMUL WORD PTR [SI+0Ah]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV AX,[BX+0Ah]
    IMUL WORD PTR [SI+10h]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV [DI+0Ah],CX
    MOV AX,[BX+0Ch]
    IMUL WORD PTR [SI]
    SHL AX,1
    RCL DX,1
    MOV BP,AX
    MOV CX,DX
    MOV AX,[BX+0Eh]
    IMUL WORD PTR [SI+6h]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV AX,[BX+10h]
    IMUL WORD PTR [SI+0Ch]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV [DI+0Ch],CX
    MOV AX,[BX+0Ch]
    IMUL WORD PTR [SI+2h]
    SHL AX,1
    RCL DX,1
    MOV BP,AX
    MOV CX,DX
    MOV AX,[BX+0Eh]
    IMUL WORD PTR [SI+8h]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV AX,[BX+10h]
    IMUL WORD PTR [SI+0Eh]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV [DI+0Eh],CX
    MOV AX,[BX+0Ch]
    IMUL WORD PTR [SI+4h]
    SHL AX,1
    RCL DX,1
    MOV BP,AX
    MOV CX,DX
    MOV AX,[BX+0Eh]
    IMUL WORD PTR [SI+0Ah]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV AX,[BX+10h]
    IMUL WORD PTR [SI+10h]
    SHL AX,1
    RCL DX,1
    ADD BP,AX
    ADC CX,DX
    MOV [DI+10h],CX
    RET
sub_20E4D endp

sub_20FDC proc far
    PUSH BP
    PUSH SI
    PUSH DI
    LES SI,DWORD PTR [198Ch]
    CALL loc_176A
    POP DI
    POP SI
    POP BP
    RETF
sub_20FDC endp

sub_20FEA proc near
loc_176A:
    db 026h
    LODSB
    OR AL,AL
    JZ short loc_1780
    CMP AL,0FFh
    JZ short loc_1781
    MOV [42FEh],AL
loc_1777:
    CALL loc_17F5
    DEC BYTE PTR [42FEh]
    JNZ short loc_1777
loc_1780:
    RET
loc_1781:
    MOV AX,[1A06h]
    MOV BP,[1A08h]
    MOV CX,[1A00h]
    MOV DI,4340h
    MOV BX,DI
loc_1791:
    SHR BP,1
    RCR AX,1
    MOV DL,0FFh
    ADC DL,0h
    MOV [DI],DL
    INC DI
    LOOP short loc_1791
    MOV DI,42FFh
    PUSH SI
    CALL loc_05DC
    POP SI
    MOV BX,[1A00h]
    MOV AX,BX
    SHL AX,1
    ADD SI,AX
    INC SI
    MOV [4360h],SI
    ADD SI,AX
    MOV [4362h],SI
    ADD SI,BX
    MOV [4364h],SI
    MOV SI,42FFh
    LODSB
loc_17C6:
    SUB AH,AH
    PUSH SI
    MOV DI,[4362h]
    ADD DI,AX
    MOV BL,[ES:DI]
    MOV [4366h],BL
    MOV SI,[4360h]
    SHL AX,1
    ADD SI,AX
    MOV SI,[ES:SI]
    ADD SI,[4364h]
loc_17E5:
    CALL loc_17F5
    DEC BYTE PTR [4366h]
    JNZ short loc_17E5
    POP SI
    LODSB
    CMP AL,0FFh
    JNZ short loc_17C6
    RET
sub_20FEA endp

sub_21075 proc near
loc_17F5:
    db 026h
    LODSB
    MOV BL,AL
    AND AL,3h
    CMP AL,1h
    JZ short loc_184E
    CALL loc_1BA2
    JNZ short loc_1808
    ADD SI,BYTE PTR +0x2
    RET
loc_1808:
    db 026h
    LODSB
    SUB AH,AH
    SHL AX,1
    MOV BX,AX
    SHL BX,1
    SHL BX,1
    MOV CX,BX
    SHL CX,1
    ADD BX,CX
    ADD BX,AX
    ADD BX,328Eh
    TEST BYTE PTR [BX+18h],80h
    JZ short loc_1828
    INC SI
    RET
loc_1828:
    db 026h
    LODSB
    SUB AH,AH
    MOV DI,AX
    MOV AH,[DI+18ECh]
    ADD AH,[18EAh]
    call far ptr gfx_setPageDirect
    MOV CX,[BX+8h]
    MOV DX,[BX+0Ch]
    MOV AX,[BX]
    MOV BX,[BX+4h]
    PUSH SI
    call far ptr gfx_drawLine
    POP SI
    RET
loc_184E:
    db 026h
    LODSB
    SHR BL,1
    SHR BL,1
    MOV CL,BL
    AND BX,BYTE PTR +0x1e
    MOV BX,[BX+42DEh]
    TEST CL,20h
    JNZ short loc_186E
    TEST [1A06h],BX
    JNZ short loc_1874
loc_1868:
    SUB AH,AH
    ADD SI,AX
    INC SI
    RET
loc_186E:
    TEST [1A08h],BX
    JZ short loc_1868
loc_1874:
    MOV [4367h],AL
    MOV BL,AL
    SUB BH,BH
    MOV BL,[ES:BX+SI]
    CMP BL,0FFh
    JZ short loc_1868
    CMP WORD PTR [12FCh],400h
    JNZ short loc_1890
    CMP BL,1h
    JNZ short loc_1868
loc_1890:
    MOV DI,BX
    MOV AH,[DI+18ECh]
    ADD AH,[18EAh]
    call far ptr gfx_setPageDirect
    CALL loc_1EA0
    MOV ES,[198Eh]
    MOV BYTE PTR [4368h],0h
loc_18AB:
    db 026h
    LODSB
    SUB AH,AH
    SHL AX,1
    MOV BX,AX
    SHL BX,1
    SHL BX,1
    MOV CX,BX
    SHL CX,1
    ADD BX,CX
    ADD BX,AX
    ADD BX,328Eh
    TEST BYTE PTR [BX+18h],40h
    JZ short loc_1901
    MOV AX,[BX+10h]
    MOV DX,[BX+12h]
    MOV CX,[BX+14h]
    MOV DI,[BX+16h]
    CMP BYTE PTR [4368h],0h
    JNZ short loc_18EE
    MOV [4369h],AX
    MOV [436Bh],DX
    MOV [436Dh],CX
    MOV [436Fh],DI
    JMP short loc_18FD
    NOP
loc_18EE:
    MOV [4371h],AX
    MOV [4373h],DX
    MOV [4375h],CX
    MOV [4377h],DI
loc_18FD:
    INC BYTE PTR [4368h]
loc_1901:
    PUSH SI
    CALL loc_193A
    POP SI
    DEC BYTE PTR [4367h]
    JNZ short loc_18AB
    INC SI
    PUSH SI
    CMP BYTE PTR [4368h],2h
    JL short loc_1929
    MOV BYTE PTR [4381h],0h
    MOV DI,4369h
    CALL loc_015D
    MOV ES,[198Eh]
    MOV BX,DI
    CALL loc_193A
loc_1929:
    MOV AX,[5029h]
    MOV CX,[502Bh]
    MOV BX,4CB5h
    call far ptr gfx_dirtyRect
    POP SI
    RET
sub_21075 endp

sub_211BA proc near
loc_193A:
    TEST BYTE PTR [BX+18h],80h
    JNZ short loc_195C
    MOV AX,[BX]
    MOV [4CADh],AX
    MOV AX,[BX+4h]
    MOV [4CB1h],AX
    MOV AX,[BX+8h]
    MOV [4CAFh],AX
    MOV AX,[BX+0Ch]
    MOV [4CB3h],AX
    PUSH BX
    CALL loc_1F34
    POP BX
loc_195C:
    TEST BYTE PTR [BX+18h],20h
    JZ short loc_1973
    MOV SI,[BX]
    MOV DI,[BX+4h]
    MOV DX,[BX+6h]
    PUSH BX
    CALL loc_1ED6
    MOV ES,[198Eh]
    POP BX
loc_1973:
    TEST BYTE PTR [BX+18h],10h
    JZ short loc_1989
    MOV SI,[BX+8h]
    MOV DI,[BX+0Ch]
    MOV DX,[BX+0Eh]
    CALL loc_1ED6
    MOV ES,[198Eh]
loc_1989:
    RET
sub_211BA endp

loc_198A:
    MOV AX,[19A6h]
    db 03Dh, 001h, 000h
    JL short loc_19E7
    MOV [1DD6h],AX
    MOV AX,[19A4h]
    MOV [1DD4h],AX
    MOV AX,[199Ch]
    MOV [1A0Ch],AX
    MOV AX,[199Eh]
    MOV [1A0Eh],AX
    MOV AX,[19A0h]
    MOV [1BF0h],AX
    MOV AX,[19A2h]
    MOV [1BF2h],AX
    INC SI
    db 026h
    LODSB
    SUB AH,AH
    MOV DI,AX
    MOV AH,[DI+18ECh]
    ADD AH,[18EAh]
    call far ptr gfx_setPageDirect
    CALL loc_0113
    SUB BX,BX
    CALL loc_0078
    CALL loc_0137
    MOV AX,[1FB8h]
    MOV [4CADh],AX
    MOV [4CAFh],AX
    MOV AX,[219Ch]
    MOV [4CB1h],AX
    MOV [4CB3h],AX
    CALL loc_1CB6
loc_19E7:
    RET
loc_19E8:
    db 026h
    LODSB
    SUB AH,AH
    MOV DI,AX
    MOV BL,[DI-7748h]
    SUB BH,BH
    SHL BX,1
    MOV CX,[BX-6A30h]
    MOV BL,[DI-7802h]
    SUB BH,BH
    SHL BX,1
    MOV AX,[BX-6A72h]
    MOV [4383h],AX
    MOV BL,[DI-79A2h]
    SUB BH,BH
    SHL BX,1
    MOV BX,[BX-6AB4h]
    PUSH SI
    MOV AX,[4383h]
    IMUL WORD PTR [19F6h]
    MOV DI,DX
    MOV SI,AX
    MOV AX,[19F0h]
    IMUL CX
    ADD SI,AX
    ADC DI,DX
    MOV AX,[19EAh]
    IMUL BX
    ADD SI,AX
    ADC DI,DX
    SHL SI,1
    RCL DI,1
    ADD SI,[199Ch]
    ADC DI,[199Eh]
    MOV [1A0Ch],SI
    MOV [1A0Eh],DI
    MOV AX,[4383h]
    IMUL WORD PTR [19F8h]
    MOV DI,DX
    MOV SI,AX
    MOV AX,[19F2h]
    IMUL CX
    ADD SI,AX
    ADC DI,DX
    MOV AX,[19ECh]
    IMUL BX
    ADD SI,AX
    ADC DI,DX
    SHL SI,1
    RCL DI,1
    ADD SI,[19A0h]
    ADC DI,[19A2h]
    MOV [1BF0h],SI
    MOV [1BF2h],DI
    MOV AX,[4383h]
    IMUL WORD PTR [19FAh]
    MOV DI,DX
    MOV SI,AX
    MOV AX,[19F4h]
    IMUL CX
    ADD SI,AX
    ADC DI,DX
    MOV AX,[19EEh]
    IMUL BX
    ADD SI,AX
    ADC DI,DX
    SHL SI,1
    RCL DI,1
    ADD SI,[19A4h]
    ADC DI,[19A6h]
    MOV [1DD4h],SI
    MOV [1DD6h],DI
    MOV BX,8h
    CMP DI,1388h
    JG short loc_1ABC
    DEC BX
    CMP DI,9C4h
    JG short loc_1ABC
    MOV BX,0Fh
loc_1ABC:
    MOV AH,[BX+18ECh]
    call far ptr gfx_setPageDirect
    SUB BX,BX
    CALL loc_0078
    MOV AX,[1FB8h]
    MOV [4CADh],AX
    MOV [4CAFh],AX
    MOV AX,[219Ch]
    MOV [4CB1h],AX
    MOV [4CB3h],AX
    CALL loc_1CB6
    POP SI
    MOV ES,[198Eh]
    DEC BYTE PTR [4382h]
    JZ short loc_1AED
    JMP near ptr loc_19E8
loc_1AED:
    CALL loc_0137
    RET
loc_1AF1:
    JMP near ptr loc_19E8
loc_1AF4:
    CALL loc_0113
    ADD SI,BYTE PTR +0x2
    db 026h
    LODSB
    MOV [4382h],AL
    CMP BYTE PTR [42D8h],0h
    JNZ short loc_1AF1
loc_1B06:
    db 026h
    LODSB
    SUB AH,AH
    SHL AX,1
    SHL AX,1
    MOV DI,AX
    MOV AX,[DI+2830h]
    ADD AX,[19A4h]
    MOV [1DD4h],AX
    MOV AX,[DI+2832h]
    ADC AX,[19A6h]
    db 03Dh, 001h, 000h
    JL short loc_1B95
    MOV [1DD6h],AX
    MOV DX,AX
    MOV AX,[DI+2380h]
    ADD AX,[199Ch]
    MOV [1A0Ch],AX
    MOV AX,[DI+2382h]
    ADC AX,[199Eh]
    MOV [1A0Eh],AX
    MOV AX,[DI+25D8h]
    ADD AX,[19A0h]
    MOV [1BF0h],AX
    MOV AX,[DI+25DAh]
    ADC AX,[19A2h]
    MOV [1BF2h],AX
    MOV BX,8h
    CMP DX,1388h
    JG short loc_1B6C
    DEC BX
    CMP DX,9C4h
    JG short loc_1B6C
    MOV BX,0Fh
loc_1B6C:
    MOV AH,[BX+18ECh]
    call far ptr gfx_setPageDirect
    PUSH SI
    SUB BX,BX
    CALL loc_0078
    MOV AX,[1FB8h]
    MOV [4CADh],AX
    MOV [4CAFh],AX
    MOV AX,[219Ch]
    MOV [4CB1h],AX
    MOV [4CB3h],AX
    CALL loc_1CB6
    POP SI
    MOV ES,[198Eh]
loc_1B95:
    DEC BYTE PTR [4382h]
    JZ short loc_1B9E
    JMP near ptr loc_1B06
loc_1B9E:
    CALL loc_0137
    RET
sub_21422 proc near
loc_1BA2:
    CMP BYTE PTR [1A04h],0h
    JNZ short loc_1BB0
    db 026h
    LODSW
    AND AX,[1A06h]
    RET
loc_1BB0:
    db 026h
    LODSW
    MOV DX,[ES:SI]
    ADD SI,BYTE PTR +0x2
    AND AX,[1A06h]
    AND DX,[1A08h]
    OR AX,DX
    RET
sub_21422 endp

    db 000h
sub_21444 proc far
    db 055h
    db 08Bh
    IN AL,DX
    PUSH DI
    PUSH SI
    PUSH BP
    PUSH DS
    POP ES
    call far ptr gfx_getCurPageSeg2
    PUSH AX
    MOV BX,[BP+6h]
    MOV AX,[BX]
    call far ptr gfx_setPage1
    MOV AH,[BX+4h]
    call far ptr gfx_setPageDirect
    CALL loc_1EA0
    MOV CX,[BP+0Eh]
    MOV SI,[BP+0Ah]
    MOV [502Bh],CX
    MOV [5029h],SI
    SUB CX,SI
    INC CX
    LEA DI,[4CB5h]
    SHL SI,1
    ADD DI,SI
    MOV AX,[BP+8h]
    MOV DX,CX
    REP stosw
    MOV CX,DX
    LEA DI,[4E6Dh]
    ADD DI,SI
    MOV AX,[BP+0Ch]
    REP stosw
    MOV BX,4CB5h
    MOV AX,[5029h]
    MOV CX,[502Bh]
    call far ptr gfx_dirtyRect2
    call far ptr gfx_resetBlitOffset
    POP AX
    call far ptr gfx_getCurPageSeg
    POP BP
    POP SI
    POP DI
    MOV SP,BP
    POP BP
    RETF
sub_21444 endp

    db 055h, 08Bh, 0ECh, 057h, 056h, 055h, 01Eh, 007h, 09Ah, 00Eh, 00Fh, 08Bh, 022h, 050h, 08Bh, 05Eh
    db 006h, 08Bh, 007h, 09Ah, 0FFh, 00Eh, 08Bh, 022h, 08Ah, 067h, 006h, 09Ah, 05Eh, 00Fh, 08Bh, 022h
    db 0E8h, 048h, 002h, 08Bh, 04Eh, 00Eh, 08Bh, 076h, 00Ah, 089h, 00Eh, 02Bh, 050h, 089h, 036h, 029h
    db 050h, 02Bh, 0CEh, 041h, 08Dh, 03Eh, 0B5h, 04Ch, 0D1h, 0E6h, 003h, 0FEh, 08Bh, 046h, 008h, 08Bh
    db 0D1h, 0F3h, 0ABh, 08Bh, 0CAh, 08Dh, 03Eh, 06Dh, 04Eh, 003h, 0FEh, 08Bh, 046h, 00Ch, 0F3h, 0ABh
    db 0BBh, 0B5h, 04Ch, 0A1h, 029h, 050h, 08Bh, 00Eh, 02Bh, 050h, 09Ah, 086h, 00Fh, 08Bh, 022h, 09Ah
    db 068h, 00Fh, 08Bh, 022h, 058h, 09Ah, 009h, 00Fh, 08Bh, 022h, 05Dh, 05Eh, 05Fh, 08Bh, 0E5h, 05Dh
    db 0C3h
sub_21526 proc far
    CALL loc_1CB6
    RETF
sub_21526 endp

sub_2152A proc far
    PUSH BP
    PUSH SI
    PUSH DI
    PUSH ES
    CALL loc_1CB6
    POP ES
    POP DI
    POP SI
    POP BP
    RETF
sub_2152A endp

sub_21536 proc near
loc_1CB6:
    SUB AX,AX
    MOV ES,AX
    PUSH WORD PTR [ES:0h]
    PUSH WORD PTR [ES:2h]
    LEA AX,[1E63h]
    MOV [ES:0h],AX
    MOV WORD PTR [ES:2h],0F88h
    PUSH DS
    POP ES
    JMP short loc_1D3E
    NOP
loc_1CD8:
    SUB AX,AX
    MOV ES,AX
    POP WORD PTR [ES:2h]
    POP WORD PTR [ES:0h]
    PUSH DS
    POP ES
    MOV AX,[4CADh]
    MOV BX,[4CB1h]
    MOV CX,[4CAFh]
    MOV DX,[4CB3h]
    call far ptr gfx_drawLine
    CLC
    RET
loc_1CFE:
    SUB AX,AX
    MOV ES,AX
    POP WORD PTR [ES:2h]
    POP WORD PTR [ES:0h]
    PUSH DS
    POP ES
    STC
    RET
loc_1D10:
    CMC
    RCR DX,1
    MOV [4C9Fh],DX
    SAR DX,1
    MOV [4CA3h],DX
    MOV DX,DI
    SUB DX,BP
    JNO short loc_1D29
    CMC
    RCR DX,1
    JMP short loc_1D99
    NOP
loc_1D29:
    SAR DX,1
    JMP short loc_1D99
    NOP
loc_1D2E:
    CMC
    RCR DX,1
    SAR WORD PTR [4C9Fh],1
    SAR WORD PTR [4CA3h],1
    JMP short loc_1D99
    NOP
loc_1D3C:
    JMP short loc_1CFE
loc_1D3E:
    MOV CX,[4CADh]
    MOV DX,[4CB1h]
    MOV SI,[4CAFh]
    MOV DI,[4CB3h]
    MOV BX,CX
    MOV BP,DX
    CALL loc_1E42
    MOV [4C9Eh],AL
    MOV BX,SI
    MOV BP,DI
    CALL loc_1E42
    JNZ short loc_1D7B
    CMP BYTE PTR [4C9Eh],0h
    JNZ short loc_1D6B
    JMP near ptr loc_1CD8
loc_1D6B:
    db 087h, 0CEh
    db 087h, 0D7h
    XCHG [4C9Eh],AL
    MOV [4CADh],CX
    MOV [4CB1h],DX
loc_1D7B:
    TEST [4C9Eh],AL
    JNZ short loc_1D3C
    MOV BP,DX
    MOV DX,SI
    SUB DX,CX
    JO short loc_1D10
    MOV [4C9Fh],DX
    SAR DX,1
    MOV [4CA3h],DX
    MOV DX,DI
    SUB DX,BP
    JO short loc_1D2E
loc_1D99:
    MOV [4CA1h],DX
    SAR DX,1
    MOV [4CA5h],DX
loc_1DA3:
    TEST AL,9h
    JZ short loc_1DDF
    SUB BX,BX
    OR SI,SI
    JS short loc_1DB1
    MOV BX,[4CA7h]
loc_1DB1:
    MOV AX,BX
    SUB AX,CX
    IMUL WORD PTR [4CA1h]
    PUSH BX
    MOV BX,DX
    IDIV WORD PTR [4C9Fh]
    MOV BL,BH
    XOR BL,[4CA0h]
    JNS short loc_1DCB
    NEG DX
    DEC AX
loc_1DCB:
    SUB DX,[4CA3h]
    XOR DH,BH
    JS short loc_1DD4
    INC AX
loc_1DD4:
    POP BX
    ADD AX,BP
    JS short loc_1DE7
    CMP AX,[4CA9h]
    JNG short loc_1E18
loc_1DDF:
    MOV BX,[4CA9h]
    CMP DI,BX
    JG short loc_1DE9
loc_1DE7:
    SUB BX,BX
loc_1DE9:
    MOV AX,BX
    SUB AX,BP
    IMUL WORD PTR [4C9Fh]
    PUSH BX
    MOV BX,DX
    IDIV WORD PTR [4CA1h]
    MOV BL,BH
    XOR BL,[4CA2h]
    JNS short loc_1E03
    NEG DX
    DEC AX
loc_1E03:
    SUB DX,[4CA5h]
    XOR DH,BH
    JS short loc_1E0C
    INC AX
loc_1E0C:
    POP BX
    ADD AX,CX
    JS short loc_1E29
    CMP AX,[4CA7h]
    JG short loc_1E29
    XCHG AX,BX
loc_1E18:
    CMP BYTE PTR [4C9Eh],0h
    JNZ short loc_1E2C
    MOV [4CB3h],AX
    MOV [4CAFh],BX
    JMP near ptr loc_1CD8
loc_1E29:
    JMP near ptr loc_1CFE
loc_1E2C:
    MOV [4CB1h],AX
    MOV [4CADh],BX
    db 087h, 0CEh
    db 087h, 0EFh
    MOV AL,[4C9Eh]
    MOV BYTE PTR [4C9Eh],0h
    JMP near ptr loc_1DA3
sub_21536 endp

sub_216C2 proc near
loc_1E42:
    MOV AL,0Fh
    OR BX,BX
    JS short loc_1E4A
    AND AL,0F7h
loc_1E4A:
    CMP BX,[4CA7h]
    JG short loc_1E52
    AND AL,0FEh
loc_1E52:
    OR BP,BP
    JS short loc_1E58
    AND AL,0FBh
loc_1E58:
    CMP BP,[4CA9h]
    JG short loc_1E60
    AND AL,0FDh
loc_1E60:
    OR AL,AL
    RET
sub_216C2 endp

    db 055h, 08Bh, 0ECh, 081h, 07Eh, 002h, 0F4h, 01Dh, 0A1h, 0A1h, 04Ch, 074h, 003h, 0A1h, 09Fh, 04Ch
    db 033h, 0D0h, 0B8h, 000h, 07Fh, 079h, 002h, 0F7h, 0D8h, 083h, 046h, 002h, 004h, 02Bh, 0D2h, 05Dh
    db 0CFh
sub_21704 proc far
    PUSH DI
    PUSH SI
    PUSH BP
    MOV AX,[5029h]
    MOV CX,[502Bh]
    MOV BX,4CB5h
    call far ptr gfx_dirtyRect
    POP BP
    POP SI
    POP DI
    RETF
sub_21704 endp

sub_2171A proc far
    PUSH DI
    CALL loc_1EA0
    POP DI
    RETF
sub_2171A endp

sub_21720 proc near
loc_1EA0:
    MOV DI,[5029h]
    OR DI,DI
    JS short loc_1ED5
    MOV AX,228Bh
    MOV ES,AX
    MOV CX,[502Bh]
    INC CX
    SUB CX,DI
    SHL DI,1
    MOV BX,CX
    MOV DX,DI
    ADD DI,4CB5h
    MOV AX,0FFFFh
    REP stosw
    MOV [5029h],AX
    MOV CX,BX
    MOV DI,DX
    ADD DI,4E6Dh
    SUB AX,AX
    REP stosw
    MOV [502Bh],AX
loc_1ED5:
    RET
sub_21720 endp

sub_21756 proc near
loc_1ED6:
    MOV AX,228Bh
    MOV ES,AX
    MOV CX,DI
    OR SI,SI
    LEA DI,[4CB5h]
    JZ short loc_1EEF
    CMP SI,[4CA7h]
    JNZ short loc_1F24
    LEA DI,[4E6Dh]
loc_1EEF:
    CMP CX,DX
    JNL short loc_1EF5
    db 087h, 0CAh
loc_1EF5:
    OR DX,DX
    JNS short loc_1EFB
    SUB DX,DX
loc_1EFB:
    CMP CX,[4CA9h]
    JNG short loc_1F05
    MOV CX,[4CA9h]
loc_1F05:
    CMP CX,[502Bh]
    JNA short loc_1F0F
    MOV [502Bh],CX
loc_1F0F:
    CMP DX,[5029h]
    JNC short loc_1F19
    MOV [5029h],DX
loc_1F19:
    ADD DI,DX
    ADD DI,DX
    SUB CX,DX
    INC CX
    MOV AX,SI
    REP stosw
loc_1F24:
    RET
sub_21756 endp

loc_1F25:
    SUB SI,SI
    OR BX,BX
    JS short loc_1ED6
    MOV SI,[4CA7h]
    CMP BX,SI
    JG short loc_1ED6
    RET
sub_217B4 proc near
loc_1F34:
    MOV AX,[4CAFh]
    CMP AX,[4CADh]
    JNC short loc_1F56
    MOV BX,[4CADh]
    MOV [4CAFh],BX
    MOV [4CADh],AX
    MOV AX,[4CB3h]
    MOV BX,[4CB1h]
    MOV [4CB3h],BX
    MOV [4CB1h],AX
loc_1F56:
    MOV BX,[4CAFh]
    SUB BX,[4CADh]
    MOV [5025h],BX
    MOV AX,[4CB3h]
    MOV DX,AX
    MOV CX,[4CB1h]
    SUB AX,CX
    MOV BP,2h
    JNS short loc_1F78
    db 087h, 0CAh
    NEG BP
    NEG AX
loc_1F78:
    MOV [5027h],AX
    CMP DX,[502Bh]
    JNA short loc_1F85
    MOV [502Bh],DX
loc_1F85:
    CMP CX,[5029h]
    JNC short loc_1F8F
    MOV [5029h],CX
loc_1F8F:
    CMP AX,BX
    JNC short loc_1FDE
    MOV DI,[4CB1h]
    SHL DI,1
    MOV AX,[4CADh]
    MOV DX,[5025h]
    MOV CX,DX
    MOV BX,CX
    INC BX
    SHR BX,1
    NEG BX
    MOV SI,[5027h]
    JMP short loc_1FBF
    NOP
loc_1FB0:
    CMP AX,[DI+4E6Dh]
    JNA short loc_1FBA
    MOV [DI+4E6Dh],AX
loc_1FBA:
    INC AX
    SUB BX,DX
    ADD DI,BP
loc_1FBF:
    CMP AX,[DI+4CB5h]
    JNC short loc_1FC9
    MOV [DI+4CB5h],AX
loc_1FC9:
    DEC CX
    JS short loc_1FD3
    ADD BX,SI
    JNS short loc_1FB0
    INC AX
    JMP short loc_1FC9
loc_1FD3:
    CMP AX,[DI+4E6Dh]
    JNA short loc_1FDD
    MOV [DI+4E6Dh],AX
loc_1FDD:
    RET
loc_1FDE:
    MOV DI,[4CB1h]
    SHL DI,1
    MOV AX,[4CADh]
    MOV DX,[5027h]
    MOV CX,DX
    MOV BX,CX
    INC BX
    SHR BX,1
    NEG BX
    MOV SI,[5025h]
loc_1FF8:
    CMP AX,[DI+4CB5h]
    JNC short loc_2002
    MOV [DI+4CB5h],AX
loc_2002:
    CMP AX,[DI+4E6Dh]
    JNA short loc_200C
    MOV [DI+4E6Dh],AX
loc_200C:
    DEC CX
    JS short loc_201A
    ADD DI,BP
    ADD BX,SI
    JS short loc_1FF8
    SUB BX,DX
    INC AX
    JMP short loc_1FF8
loc_201A:
    RET
sub_217B4 endp

    db 000h
sub_2189C proc far
    db 006h
    db 056h
    db 057h
    PUSH BP
    CALL loc_2028
    POP BP
    POP DI
    POP SI
    POP ES
    RETF
sub_2189C endp

sub_218A8 proc near
loc_2028:
    SUB AX,AX
    MOV ES,AX
    PUSH WORD PTR [ES:0h]
    PUSH WORD PTR [ES:2h]
    LEA AX,[21D8h]
    MOV [ES:0h],AX
    MOV WORD PTR [ES:2h],0F88h
    PUSH DS
    POP ES
    JMP short loc_2097
    NOP
loc_204A:
    SUB AX,AX
    MOV ES,AX
    POP WORD PTR [ES:2h]
    POP WORD PTR [ES:0h]
    PUSH DS
    POP ES
    RET
loc_205B:
    AND AL,[502Eh]
    TEST AL,6h
    JNZ short loc_204A
    MOV BX,CX
    JMP near ptr loc_219A
loc_2068:
    JMP near ptr loc_21C5
loc_206B:
    CMC
    RCR DX,1
    MOV [502Fh],DX
    SAR DX,1
    MOV [5033h],DX
    MOV DX,DI
    SUB DX,BP
    JNO short loc_2084
    CMC
    RCR DX,1
    JMP short loc_20EF
    NOP
loc_2084:
    SAR DX,1
    JMP short loc_20EF
    NOP
loc_2089:
    CMC
    RCR DX,1
    SAR WORD PTR [502Fh],1
    SAR WORD PTR [5033h],1
    JMP short loc_20EF
    NOP
loc_2097:
    MOV CX,[4CADh]
    MOV DX,[4CB1h]
    MOV SI,[4CAFh]
    MOV DI,[4CB3h]
    MOV BX,CX
    MOV BP,DX
    CALL loc_1E42
    MOV [502Eh],AL
    MOV BX,SI
    MOV BP,DI
    CALL loc_1E42
    JNZ short loc_20D1
    CMP BYTE PTR [502Eh],0h
    JZ short loc_2068
    db 087h, 0CEh
    db 087h, 0D7h
    XCHG [502Eh],AL
    MOV [4CADh],CX
    MOV [4CB1h],DX
loc_20D1:
    MOV BP,DX
    TEST [502Eh],AL
    JNZ short loc_205B
    MOV DX,SI
    SUB DX,CX
    JO short loc_206B
    MOV [502Fh],DX
    SAR DX,1
    MOV [5033h],DX
    MOV DX,DI
    SUB DX,BP
    JO short loc_2089
loc_20EF:
    MOV [5031h],DX
    SAR DX,1
    MOV [5035h],DX
loc_20F9:
    TEST AL,9h
    JZ short loc_2139
    SUB BX,BX
    OR SI,SI
    JS short loc_2107
    MOV BX,[4CA7h]
loc_2107:
    MOV AX,BX
    SUB AX,CX
    IMUL WORD PTR [5031h]
    PUSH BX
    MOV BX,DX
    IDIV WORD PTR [502Fh]
    OR AX,AX
    OR AX,AX
    MOV BL,BH
    XOR BL,[5030h]
    JNS short loc_2125
    NEG DX
    DEC AX
loc_2125:
    SUB DX,[5033h]
    XOR DH,BH
    JS short loc_212E
    INC AX
loc_212E:
    POP BX
    ADD AX,BP
    JS short loc_2141
    CMP AX,[4CA9h]
    JNG short loc_2176
loc_2139:
    MOV BX,[4CA9h]
    CMP DI,BX
    JG short loc_2143
loc_2141:
    SUB BX,BX
loc_2143:
    MOV AX,BX
    SUB AX,BP
    IMUL WORD PTR [502Fh]
    PUSH BX
    MOV BX,DX
    IDIV WORD PTR [5031h]
    OR AX,AX
    OR AX,AX
    MOV BL,BH
    XOR BL,[5032h]
    JNS short loc_2161
    NEG DX
    DEC AX
loc_2161:
    SUB DX,[5035h]
    XOR DH,BH
    JS short loc_216A
    INC AX
loc_216A:
    POP BX
    ADD AX,CX
    XCHG AX,BX
    JS short loc_219A
    CMP BX,[4CA7h]
    JG short loc_219A
loc_2176:
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH SI
    PUSH DI
    MOV DX,DI
    MOV DI,AX
    MOV SI,BX
    CALL loc_1ED6
    POP DI
    POP SI
    POP CX
    POP BX
    POP AX
    CMP BYTE PTR [502Eh],0h
    JNZ short loc_21AF
    MOV [4CB3h],AX
    MOV [4CAFh],BX
    JMP short loc_21C5
    NOP
loc_219A:
    MOV DX,BP
    SUB AX,AX
    MOV ES,AX
    POP WORD PTR [ES:2h]
    POP WORD PTR [ES:0h]
    PUSH DS
    POP ES
    JMP near ptr loc_1F25
loc_21AF:
    MOV [4CB1h],AX
    MOV [4CADh],BX
    db 087h, 0CEh
    db 087h, 0EFh
    MOV AL,[502Eh]
    MOV BYTE PTR [502Eh],0h
    JMP near ptr loc_20F9
loc_21C5:
    SUB AX,AX
    MOV ES,AX
    POP WORD PTR [ES:2h]
    POP WORD PTR [ES:0h]
    PUSH DS
    POP ES
    JMP near ptr loc_1F34
sub_218A8 endp


seg001 ends

_sub_1F882 EQU sub_1F882
_sub_1F8F8 EQU sub_1F8F8
_sub_1F993 EQU sub_1F993
_sub_1F9B7 EQU sub_1F9B7
_sub_1F9DD EQU sub_1F9DD
_sub_1FABF EQU sub_1FABF
_sub_1FB1D EQU sub_1FB1D
_sub_1FB52 EQU sub_1FB52
_sub_1FB88 EQU sub_1FB88
_sub_1FBB4 EQU sub_1FBB4
_sub_1FC03 EQU sub_1FC03
_sub_1FC3A EQU sub_1FC3A
_sub_1FC8E EQU sub_1FC8E
_sub_1FD04 EQU sub_1FD04
_sub_1FD72 EQU sub_1FD72
_sub_1FDAD EQU sub_1FDAD
_sub_1FE5C EQU sub_1FE5C
_sub_1FEEC EQU sub_1FEEC
_sub_1FEFE EQU sub_1FEFE
_sub_20104 EQU sub_20104
_sub_20188 EQU sub_20188
_sub_20289 EQU sub_20289
_sub_202B6 EQU sub_202B6
_sub_202C7 EQU sub_202C7
_sub_202DA EQU sub_202DA
_sub_202F6 EQU sub_202F6
_sub_20300 EQU sub_20300
_sub_203E0 EQU sub_203E0
_sub_2044A EQU sub_2044A
_sub_20467 EQU sub_20467
_sub_20534 EQU sub_20534
_sub_20658 EQU sub_20658
_sub_20674 EQU sub_20674
_sub_20970 EQU sub_20970
_sub_20A46 EQU sub_20A46
_sub_20A58 EQU sub_20A58
_sub_20B02 EQU sub_20B02
_sub_20BAE EQU sub_20BAE
_sub_20BDF EQU sub_20BDF
_sub_20CFB EQU sub_20CFB
_sub_20E19 EQU sub_20E19
_sub_20E38 EQU sub_20E38
_sub_20E4D EQU sub_20E4D
_sub_20FDC EQU sub_20FDC
_sub_20FEA EQU sub_20FEA
_sub_21075 EQU sub_21075
_sub_211BA EQU sub_211BA
_sub_21422 EQU sub_21422
_sub_21444 EQU sub_21444
_sub_21526 EQU sub_21526
_sub_2152A EQU sub_2152A
_sub_21536 EQU sub_21536
_sub_216C2 EQU sub_216C2
_sub_21704 EQU sub_21704
_sub_2171A EQU sub_2171A
_sub_21720 EQU sub_21720
_sub_21756 EQU sub_21756
_sub_217B4 EQU sub_217B4
_sub_2189C EQU sub_2189C
_sub_218A8 EQU sub_218A8

end
