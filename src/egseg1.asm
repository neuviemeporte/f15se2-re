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
    db 055h, 08Bh, 0ECh, 006h, 01Eh, 056h, 057h, 08Ah, 066h, 00Ch
    call far ptr gfx_setPageDirect
    db 0E8h, 08Ch, 01Eh, 08Bh, 076h, 00Ah, 08Bh, 04Eh, 008h, 049h, 0ADh, 0A3h, 0ADh, 04Ch, 050h, 0ADh
    db 0A3h, 0B1h, 04Ch, 050h, 051h, 0ADh, 0A3h, 0AFh, 04Ch, 050h, 0ADh, 0A3h, 0B3h, 04Ch, 050h, 056h
    db 0E8h, 0F4h, 01Fh, 05Eh, 08Fh, 006h, 0B1h, 04Ch, 08Fh, 006h, 0ADh, 04Ch, 059h, 0E2h, 0E5h, 08Fh
    db 006h, 0B3h, 04Ch, 08Fh, 006h, 0AFh, 04Ch, 0E8h, 0DDh, 01Fh, 0A1h, 029h, 050h, 08Bh, 00Eh, 02Bh
    db 050h, 0BBh, 0B5h, 04Ch
    call far ptr gfx_dirtyRect
    call far ptr gfx_resetBlitOffset
    db 05Fh, 05Eh, 01Fh, 007h, 05Dh, 0CBh
sub_1F882 endp

    db 000h, 08Bh, 0DCh, 056h, 057h, 036h, 08Bh, 05Fh, 002h, 0D1h, 0E3h, 0D1h, 0E3h, 0E8h, 003h, 000h
    db 05Fh, 05Eh, 0C3h
sub_1F8F8 proc near
    db 08Bh, 08Fh, 0D6h, 01Dh, 080h, 03Eh, 074h, 053h, 000h, 074h, 002h, 0D1h, 0E1h, 080h, 03Eh, 05Eh
    db 05Ch, 000h, 074h, 00Ah, 087h, 0D1h, 08Ah, 00Eh, 05Eh, 05Ch, 0D3h, 0FAh, 087h, 0D1h, 00Bh, 0C9h
    db 07Eh, 04Dh, 08Bh, 097h, 00Dh, 01Ah, 08Ah, 087h, 00Fh, 01Ah, 098h, 092h, 0F7h, 0F9h, 099h, 00Bh
    db 0C0h, 003h, 006h, 0DCh, 000h, 083h, 0D2h, 000h, 089h, 097h, 0BAh, 01Fh, 089h, 087h, 0B8h, 01Fh
    db 08Bh, 097h, 0F1h, 01Bh, 08Ah, 087h, 0F3h, 01Bh, 098h, 092h, 08Bh, 0F2h, 08Bh, 0F8h, 0D1h, 0FAh
    db 0D1h, 0D8h, 0D1h, 0FAh, 0D1h, 0D8h, 02Bh, 0C7h, 01Bh, 0D6h, 0F7h, 0F9h, 099h, 00Bh, 0C0h, 003h
    db 006h, 0DEh, 000h, 083h, 0D2h, 000h, 089h, 097h, 09Eh, 021h, 089h, 087h, 09Ch, 021h, 0C3h, 0B8h
    db 000h, 080h, 089h, 087h, 0B8h, 01Fh, 089h, 087h, 0BAh, 01Fh, 089h, 087h, 09Ch, 021h, 089h, 087h
    db 09Eh, 021h, 0C3h
sub_1F8F8 endp

    db 055h, 08Bh, 0ECh, 083h, 046h, 002h, 003h, 08Ah, 0C4h, 08Ah, 0E2h, 08Ah, 0D6h, 0F7h, 0F9h, 099h
    db 08Ah, 0D4h, 08Ah, 0E0h, 02Ah, 0C0h, 05Dh, 0CFh
sub_1F993 proc near
    db 006h, 02Bh, 0C0h, 08Eh, 0C0h, 026h, 0A1h, 000h, 000h, 0A3h, 0A0h, 018h, 08Dh, 006h, 0FBh, 000h
    db 026h, 0A3h, 000h, 000h, 026h, 0A1h, 002h, 000h, 0A3h, 0A2h, 018h, 0B8h, 088h, 00Fh, 026h, 0A3h
    db 002h, 000h, 007h, 0C3h
sub_1F993 endp

sub_1F9B7 proc near
    db 006h, 02Bh, 0C0h, 08Eh, 0C0h, 0A1h, 0A0h, 018h, 026h, 0A3h, 000h, 000h, 0A1h, 0A2h, 018h, 026h
    db 0A3h, 002h, 000h, 007h, 0C3h
sub_1F9B7 endp

    db 055h, 08Bh, 0ECh, 056h, 057h, 006h, 08Bh, 07Eh, 006h, 0E8h, 005h, 000h, 007h, 05Fh, 05Eh, 05Dh
    db 0C3h
sub_1F9DD proc near
    db 08Bh, 005h, 08Bh, 04Dh, 002h, 099h, 03Bh, 0D1h, 075h, 040h, 08Bh, 0F0h, 08Bh, 045h, 004h, 08Bh
    db 04Dh, 006h, 099h, 03Bh, 0D1h, 075h, 033h, 08Bh, 0C8h, 08Bh, 045h, 008h, 08Bh, 05Dh, 00Ah, 099h
    db 03Bh, 0D3h, 075h, 026h, 08Bh, 0E8h, 08Bh, 045h, 00Ch, 08Bh, 05Dh, 00Eh, 099h, 03Bh, 0D3h, 075h
    db 019h, 08Bh, 0D0h, 0A1h, 0A7h, 04Ch, 03Bh, 0F0h, 077h, 010h, 03Bh, 0E8h, 077h, 00Ch, 0A1h, 0A9h
    db 04Ch, 03Bh, 0C8h, 077h, 005h, 03Bh, 0D0h, 077h, 001h, 0C3h, 02Ah, 0C0h, 0A2h, 0C0h, 018h, 08Bh
    db 01Dh, 089h, 01Eh, 0A6h, 018h, 08Bh, 04Dh, 002h, 089h, 00Eh, 0A8h, 018h, 08Bh, 075h, 004h, 089h
    db 036h, 0AAh, 018h, 08Bh, 055h, 006h, 089h, 016h, 0ACh, 018h, 0E8h, 0B9h, 001h, 0A2h, 0BEh, 018h
    db 074h, 009h, 0E8h, 0E8h, 001h, 089h, 045h, 002h, 089h, 06Dh, 006h, 08Bh, 05Dh, 008h, 089h, 01Eh
    db 0AEh, 018h, 08Bh, 04Dh, 00Ah, 089h, 00Eh, 0B0h, 018h, 08Bh, 075h, 00Ch, 089h, 036h, 0B2h, 018h
    db 08Bh, 055h, 00Eh, 089h, 016h, 0B4h, 018h, 0E8h, 08Ch, 001h, 0A2h, 0BFh, 018h, 074h, 009h, 0E8h
    db 0BBh, 001h, 089h, 045h, 00Ah, 089h, 06Dh, 00Eh, 08Ah, 026h, 0BEh, 018h, 0A0h, 0BFh, 018h, 00Ah
    db 0E0h, 084h, 006h, 0BEh, 018h, 075h, 027h, 00Ah, 0C0h, 074h, 00Bh, 0A0h, 0BEh, 018h, 00Ah, 0C0h
    db 074h, 008h, 0E8h, 01Dh, 000h, 0C3h, 0E8h, 077h, 000h, 0C3h, 08Bh, 01Eh, 0A6h, 018h, 08Bh, 00Eh
    db 0A8h, 018h, 08Bh, 036h, 0AAh, 018h, 08Bh, 016h, 0ACh, 018h, 0E8h, 098h, 000h, 0C3h, 0E8h, 0CAh
    db 000h, 0C3h
sub_1F9DD endp

sub_1FABF proc near
    db 0A1h, 0A6h, 018h, 0A3h, 0B6h, 018h, 0A1h, 0A8h, 018h, 0A3h, 0B8h, 018h, 0A1h, 0AAh, 018h, 0A3h
    db 0BAh, 018h, 0A1h, 0ACh, 018h, 0A3h, 0BCh, 018h, 08Bh, 01Eh, 0AEh, 018h, 08Bh, 00Eh, 0B0h, 018h
    db 08Bh, 036h, 0B2h, 018h, 08Bh, 016h, 0B4h, 018h, 0E8h, 01Ah, 002h, 074h, 00Ah, 08Bh, 055h, 00Eh
    db 089h, 055h, 004h, 0E8h, 093h, 000h, 0C3h, 089h, 01Eh, 0C9h, 018h, 089h, 00Eh, 0CBh, 018h, 089h
    db 036h, 0CDh, 018h, 089h, 016h, 0CFh, 018h, 0E8h, 014h, 000h, 08Bh, 01Eh, 0C9h, 018h, 08Bh, 00Eh
    db 0CBh, 018h, 08Bh, 036h, 0CDh, 018h, 08Bh, 016h, 0CFh, 018h, 0E8h, 036h, 000h, 0C3h
sub_1FABF endp

sub_1FB1D proc near
    db 089h, 01Eh, 0B6h, 018h, 089h, 00Eh, 0B8h, 018h, 089h, 036h, 0BAh, 018h, 089h, 016h, 0BCh, 018h
    db 08Bh, 01Eh, 0A6h, 018h, 08Bh, 00Eh, 0A8h, 018h, 08Bh, 036h, 0AAh, 018h, 08Bh, 016h, 0ACh, 018h
    db 0E8h, 04Eh, 001h, 089h, 01Dh, 089h, 075h, 004h, 08Bh, 045h, 004h, 03Bh, 045h, 006h, 074h, 004h
    db 080h, 04Dh, 018h, 020h, 0C3h
sub_1FB1D endp

sub_1FB52 proc near
    db 089h, 01Eh, 0B6h, 018h, 089h, 00Eh, 0B8h, 018h, 089h, 036h, 0BAh, 018h, 089h, 016h, 0BCh, 018h
    db 08Bh, 01Eh, 0AEh, 018h, 08Bh, 00Eh, 0B0h, 018h, 08Bh, 036h, 0B2h, 018h, 08Bh, 016h, 0B4h, 018h
    db 0E8h, 019h, 001h, 089h, 05Dh, 008h, 089h, 075h, 00Ch, 08Bh, 045h, 00Ch, 03Bh, 045h, 00Eh, 074h
    db 004h, 080h, 04Dh, 018h, 010h, 0C3h
sub_1FB52 endp

sub_1FB88 proc near
    db 08Ah, 04Dh, 018h, 080h, 0C9h, 080h, 08Bh, 055h, 00Eh, 089h, 055h, 004h, 0A8h, 009h, 074h, 018h
    db 0BAh, 000h, 000h, 0A8h, 008h, 075h, 004h, 08Bh, 016h, 0A7h, 04Ch, 089h, 015h, 08Bh, 045h, 004h
    db 03Bh, 045h, 006h, 074h, 003h, 080h, 0C9h, 020h, 088h, 04Dh, 018h, 0C3h
sub_1FB88 endp

sub_1FBB4 proc near
    db 00Bh, 0C9h, 075h, 00Bh, 083h, 0FBh, 000h, 074h, 018h, 03Bh, 01Eh, 0A7h, 04Ch, 074h, 012h, 00Bh
    db 0D2h, 075h, 00Bh, 083h, 0FEh, 000h, 074h, 020h, 03Bh, 036h, 0A9h, 04Ch, 074h, 01Ah, 02Bh, 0C0h
    db 0C3h, 02Bh, 0C0h, 00Bh, 0D2h, 078h, 00Eh, 075h, 00Ch, 083h, 0FEh, 000h, 072h, 007h, 03Bh, 036h
    db 0A9h, 04Ch, 077h, 001h, 040h, 00Bh, 0C0h, 0C3h, 02Bh, 0C0h, 00Bh, 0C9h, 078h, 00Eh, 075h, 00Ch
    db 083h, 0FBh, 000h, 072h, 007h, 03Bh, 01Eh, 0A7h, 04Ch, 077h, 001h, 040h, 00Bh, 0C0h, 0C3h
sub_1FBB4 endp

sub_1FC03 proc near
    db 0B0h, 00Ch, 00Bh, 0C9h, 078h, 015h, 075h, 005h, 083h, 0FBh, 000h, 072h, 00Eh, 034h, 009h, 00Bh
    db 0C9h, 075h, 008h, 03Bh, 01Eh, 0A7h, 04Ch, 077h, 002h, 034h, 001h, 00Bh, 0D2h, 078h, 015h, 075h
    db 005h, 083h, 0FEh, 000h, 072h, 00Eh, 034h, 006h, 00Bh, 0D2h, 075h, 008h, 03Bh, 036h, 0A9h, 04Ch
    db 077h, 002h, 034h, 002h, 00Ah, 0C0h, 0C3h
sub_1FC03 endp

sub_1FC3A proc near
    db 0B4h, 001h, 08Bh, 0E9h, 045h, 083h, 0FDh, 001h, 077h, 022h, 08Bh, 0E9h, 0D1h, 0FDh, 033h, 0EBh
    db 081h, 0E5h, 000h, 0C0h, 075h, 016h, 08Bh, 0EAh, 045h, 083h, 0FDh, 001h, 077h, 00Eh, 08Bh, 0EAh
    db 0D1h, 0FDh, 033h, 0EEh, 081h, 0E5h, 000h, 0C0h, 075h, 002h, 02Ah, 0E4h, 008h, 026h, 0C0h, 018h
    db 08Bh, 0EEh, 0A8h, 004h, 074h, 003h, 0BDh, 000h, 000h, 0A8h, 002h, 074h, 004h, 08Bh, 02Eh, 0A9h
    db 04Ch, 0A8h, 008h, 074h, 004h, 0B8h, 000h, 000h, 0C3h, 0A8h, 001h, 074h, 004h, 0A1h, 0A7h, 04Ch
    db 0C3h, 08Bh, 0C3h, 0C3h
sub_1FC3A endp

sub_1FC8E proc near
    db 0A0h, 0C0h, 018h, 00Ah, 0C0h, 075h, 003h, 0E9h, 072h, 001h, 0BDh, 020h, 000h, 089h, 01Eh, 0C1h
    db 018h, 089h, 00Eh, 0C3h, 018h, 089h, 036h, 0C5h, 018h, 089h, 016h, 0C7h, 018h, 003h, 01Eh, 0B6h
    db 018h, 013h, 00Eh, 0B8h, 018h, 0D1h, 0F9h, 0D1h, 0DBh, 003h, 036h, 0BAh, 018h, 013h, 016h, 0BCh
    db 018h, 0D1h, 0FAh, 0D1h, 0DEh, 0E8h, 0EEh, 0FEh, 075h, 02Ah, 04Dh, 074h, 028h, 0E8h, 035h, 0FFh
    db 075h, 0CBh, 089h, 01Eh, 0B6h, 018h, 089h, 00Eh, 0B8h, 018h, 089h, 036h, 0BAh, 018h, 089h, 016h
    db 0BCh, 018h, 08Bh, 01Eh, 0C1h, 018h, 08Bh, 00Eh, 0C3h, 018h, 08Bh, 036h, 0C5h, 018h, 08Bh, 016h
    db 0C7h, 018h, 0EBh, 0B9h, 0C3h, 08Bh, 01Eh, 0B6h, 018h, 08Bh, 00Eh, 0B8h, 018h, 08Bh, 036h, 0BAh
    db 018h, 08Bh, 016h, 0BCh, 018h, 0C3h
sub_1FC8E endp

sub_1FD04 proc near
    db 0A0h, 0C0h, 018h, 00Ah, 0C0h, 075h, 003h, 0E9h, 0C2h, 000h, 0BDh, 020h, 000h, 089h, 01Eh, 0C1h
    db 018h, 089h, 00Eh, 0C3h, 018h, 089h, 036h, 0C5h, 018h, 089h, 016h, 0C7h, 018h, 003h, 01Eh, 0B6h
    db 018h, 013h, 00Eh, 0B8h, 018h, 0D1h, 0F9h, 0D1h, 0DBh, 003h, 036h, 0BAh, 018h, 013h, 016h, 0BCh
    db 018h, 0D1h, 0FAh, 0D1h, 0DEh, 0E8h, 0C7h, 0FEh, 074h, 031h, 04Dh, 074h, 02Eh, 084h, 006h, 0BEh
    db 018h, 074h, 0CAh, 084h, 006h, 0BFh, 018h, 075h, 022h, 089h, 01Eh, 0B6h, 018h, 089h, 00Eh, 0B8h
    db 018h, 089h, 036h, 0BAh, 018h, 089h, 016h, 0BCh, 018h, 08Bh, 01Eh, 0C1h, 018h, 08Bh, 00Eh, 0C3h
    db 018h, 08Bh, 036h, 0C5h, 018h, 08Bh, 016h, 0C7h, 018h, 0EBh, 0B2h, 00Ah, 0C0h, 0C3h
sub_1FD04 endp

sub_1FD72 proc near
    db 083h, 0FBh, 000h, 074h, 014h, 03Bh, 01Eh, 0A7h, 04Ch, 074h, 00Eh, 083h, 0FEh, 000h, 074h, 01Ah
    db 03Bh, 036h, 0A9h, 04Ch, 074h, 014h, 02Bh, 0C0h, 0C3h, 02Bh, 0C0h, 083h, 0FEh, 000h, 07Ch, 007h
    db 03Bh, 036h, 0A9h, 04Ch, 07Fh, 001h, 040h, 00Bh, 0C0h, 0C3h, 02Bh, 0C0h, 083h, 0FBh, 000h, 07Ch
    db 007h, 03Bh, 01Eh, 0A7h, 04Ch, 07Fh, 001h, 040h, 00Bh, 0C0h, 0C3h
sub_1FD72 endp

sub_1FDAD proc near
    db 0B0h, 00Ch, 083h, 0FBh, 000h, 07Ch, 00Ah, 034h, 009h, 03Bh, 01Eh, 0A7h, 04Ch, 07Fh, 002h, 034h
    db 001h, 083h, 0FEh, 000h, 07Ch, 00Ah, 034h, 006h, 03Bh, 036h, 0A9h, 04Ch, 07Fh, 002h, 034h, 002h
    db 00Ah, 0C0h, 0C3h
sub_1FDAD endp

    db 057h, 08Bh, 00Eh, 0B6h, 018h, 08Bh, 016h, 0BAh, 018h, 0BDh, 010h, 000h, 08Bh, 0FBh, 08Eh, 0C6h
    db 003h, 0D9h, 0D1h, 0FBh, 003h, 0F2h, 0D1h, 0FEh, 0E8h, 0C2h, 0FFh, 074h, 019h, 04Dh, 074h, 016h
    db 084h, 006h, 0BEh, 018h, 074h, 0E6h, 084h, 006h, 0BFh, 018h, 075h, 00Ah, 08Bh, 0CBh, 08Bh, 0D6h
    db 08Bh, 0DFh, 08Ch, 0C6h, 0EBh, 0DAh, 05Fh, 00Ah, 0C0h, 0C3h, 057h, 08Bh, 00Eh, 0B6h, 018h, 08Bh
    db 016h, 0BAh, 018h, 0BDh, 010h, 000h, 08Bh, 0FBh, 08Eh, 0C6h, 003h, 0D9h, 0D1h, 0FBh, 003h, 0F2h
    db 0D1h, 0FEh, 0E8h, 04Dh, 0FFh, 075h, 012h, 04Dh, 074h, 011h, 0E8h, 080h, 0FFh, 075h, 0E7h, 08Bh
    db 0CBh, 08Bh, 0D6h, 08Bh, 0DFh, 08Ch, 0C6h, 0EBh, 0E1h, 05Fh, 0C3h, 08Bh, 0D9h, 08Bh, 0F2h, 05Fh
    db 0C3h, 000h, 055h, 08Bh, 0ECh, 056h, 057h, 08Bh, 076h, 004h, 08Bh, 046h, 006h, 08Eh, 0C0h, 08Bh
    db 07Eh, 008h, 08Bh, 05Eh, 00Ah, 0E8h, 004h, 000h, 05Fh, 05Eh, 05Dh, 0C3h
sub_1FE5C proc near
    db 089h, 01Eh, 0E0h, 018h, 02Bh, 0EDh, 026h, 08Ah, 004h, 046h, 02Ah, 0E4h, 08Bh, 0C8h, 08Bh, 01Eh
    db 0E0h, 018h, 003h, 0D9h, 08Ah, 007h, 08Bh, 0D9h, 0D1h, 0E3h, 02Bh, 0D2h, 03Ch, 0FFh, 075h, 003h
    db 0BAh, 002h, 000h, 083h, 0FAh, 000h, 074h, 012h, 083h, 0FAh, 001h, 074h, 013h, 083h, 0FAh, 002h
    db 074h, 017h, 083h, 0FAh, 003h, 074h, 018h, 0EBh, 01Fh, 090h, 0BAh, 001h, 000h, 0EBh, 03Dh, 090h
    db 088h, 00Dh, 047h, 0BAh, 004h, 000h, 0EBh, 028h, 090h, 0BAh, 003h, 000h, 0EBh, 022h, 090h, 088h
    db 00Dh, 047h, 0BAh, 004h, 000h, 0EBh, 025h, 090h, 083h, 0EDh, 001h, 078h, 00Fh, 058h, 08Ah, 0D0h
    db 02Ah, 0F6h, 08Ah, 0CCh, 02Ah, 0EDh, 08Bh, 0D9h, 0D1h, 0E3h, 0EBh, 0B7h, 0C6h, 005h, 0FFh, 0C3h
    db 026h, 08Ah, 000h, 03Ch, 0FFh, 074h, 003h, 0EBh, 00Bh, 090h, 0EBh, 0A7h, 026h, 08Ah, 040h, 001h
    db 03Ch, 0FFh, 074h, 0F6h, 02Ah, 0E4h, 091h, 08Ah, 0E0h, 08Ah, 0C2h, 050h, 045h, 0E9h, 07Eh, 0FFh
sub_1FE5C endp

sub_1FEEC proc far
    db 055h, 08Bh, 0ECh, 08Ah, 046h, 006h, 0A2h, 0E6h, 018h, 056h, 057h, 0E8h, 004h, 000h, 05Fh, 05Eh
    db 05Dh, 0CBh
sub_1FEEC endp

sub_1FEFE proc near
    db 0A1h, 0C2h, 019h, 0F7h, 0D8h, 0A3h, 0E4h, 018h, 0A1h, 0BEh, 019h, 099h, 08Ah, 0D4h, 08Ah, 0E0h
    db 02Ah, 0C0h, 08Bh, 00Eh, 0C0h, 019h, 081h, 0F9h, 00Bh, 01Fh, 07Fh, 006h, 0B8h, 0FFh, 003h, 0EBh
    db 01Fh, 090h, 0F7h, 0F9h, 080h, 03Eh, 02Ch, 067h, 002h, 075h, 015h, 08Ah, 016h, 0B9h, 019h, 02Ah
    db 0F6h, 08Bh, 0CAh, 0D1h, 0E9h, 003h, 0D1h, 0B1h, 003h, 0D3h, 0EAh, 083h, 0C2h, 004h, 02Bh, 0C2h
    db 080h, 03Eh, 05Eh, 05Ch, 000h, 074h, 006h, 08Ah, 00Eh, 05Eh, 05Ch, 0D3h, 0E0h, 080h, 03Eh, 074h
    db 053h, 000h, 074h, 002h, 0D1h, 0F8h, 08Bh, 0E8h, 0F7h, 02Eh, 0E4h, 018h, 0D1h, 0E0h, 0D1h, 0D2h
    db 08Bh, 0D8h, 08Bh, 0CAh, 0A1h, 0DCh, 000h, 0D1h, 0E0h, 0F7h, 02Eh, 0C4h, 019h, 0D1h, 0E0h, 0D1h
    db 0D2h, 08Bh, 0F0h, 08Bh, 0FAh, 02Bh, 0C3h, 01Bh, 0D1h, 0D1h, 0E0h, 013h, 016h, 0DCh, 000h, 089h
    db 016h, 0ADh, 04Ch, 003h, 0DEh, 013h, 0CFh, 0D1h, 0E3h, 083h, 0D1h, 000h, 08Bh, 016h, 0DCh, 000h
    db 02Bh, 0D1h, 089h, 016h, 0AFh, 04Ch, 08Bh, 0C5h, 0F7h, 02Eh, 0C4h, 019h, 0D1h, 0E0h, 0D1h, 0D2h
    db 08Bh, 0F0h, 08Bh, 0FAh, 0A1h, 0DCh, 000h, 0D1h, 0E0h, 0F7h, 02Eh, 0E4h, 018h, 0D1h, 0E0h, 0D1h
    db 0D2h, 08Bh, 0D8h, 08Bh, 0CAh, 02Bh, 0C6h, 01Bh, 0D7h, 0D1h, 0E0h, 083h, 0D2h, 000h, 08Bh, 0C2h
    db 0D1h, 0F8h, 0D1h, 0F8h, 02Bh, 0D0h, 003h, 016h, 0DEh, 000h, 089h, 016h, 0B3h, 04Ch, 003h, 0F3h
    db 013h, 0F9h, 0D1h, 0E6h, 083h, 0D7h, 000h, 08Bh, 0F7h, 0D1h, 0FEh, 0D1h, 0FEh, 02Bh, 0FEh, 08Bh
    db 016h, 0DEh, 000h, 02Bh, 0D7h, 089h, 016h, 0B1h, 04Ch, 0C7h, 006h, 0E8h, 018h, 000h, 000h, 08Ah
    db 026h, 0E6h, 018h
    call far ptr gfx_setPageDirect
    db 0E8h, 027h, 017h, 0E8h, 03Ah, 015h, 073h, 044h, 083h, 03Eh, 0BEh, 019h, 000h, 078h, 013h, 08Ah
    db 026h, 0E7h, 018h
    call far ptr gfx_setPageDirect
    db 080h, 03Eh, 02Ch, 067h, 002h, 075h, 003h, 0E9h, 0E6h, 000h, 02Bh, 0F6h, 08Bh, 0FEh, 08Bh, 016h
    db 0A9h, 04Ch, 0E8h, 033h, 017h, 08Bh, 036h, 0A7h, 04Ch, 02Bh, 0FFh, 08Bh, 016h, 0A9h, 04Ch, 0E8h
    db 026h, 017h, 0A1h, 029h, 050h, 08Bh, 00Eh, 02Bh, 050h, 0BBh, 0B5h, 04Ch
    call far ptr gfx_dirtyRect
    db 0E9h, 0BCh, 000h, 0A1h, 0B1h, 04Ch, 03Bh, 006h, 0B3h, 04Ch, 075h, 00Ah, 00Bh, 0C0h, 074h, 0AFh
    db 03Bh, 006h, 0A9h, 04Ch, 074h, 0A9h, 0FFh, 036h, 0ADh, 04Ch, 0FFh, 036h, 0B1h, 04Ch, 0FFh, 036h
    db 0AFh, 04Ch, 0FFh, 036h, 0B3h, 04Ch, 0E8h, 040h, 018h, 08Fh, 006h, 0B3h, 04Ch, 08Fh, 006h, 0AFh
    db 04Ch, 08Fh, 006h, 0B1h, 04Ch, 08Fh, 006h, 0ADh, 04Ch, 02Bh, 0C0h, 08Bh, 036h, 0E8h, 018h, 033h
    db 036h, 0E4h, 018h, 079h, 003h, 0A1h, 0A7h, 04Ch, 0A3h, 0E2h, 018h, 02Bh, 0DBh, 08Bh, 02Eh, 0A9h
    db 04Ch, 08Bh, 036h, 0E8h, 018h, 033h, 036h, 0C4h, 019h, 079h, 002h, 087h, 0DDh, 08Bh, 036h, 0ADh
    db 04Ch, 08Bh, 03Eh, 0B1h, 04Ch, 03Bh, 0FBh, 074h, 00Fh, 03Bh, 0FDh, 075h, 006h, 08Bh, 0FDh, 08Bh
    db 036h, 0E2h, 018h, 08Bh, 0D3h, 0E8h, 09Fh, 016h, 08Bh, 036h, 0AFh, 04Ch, 08Bh, 03Eh, 0B3h, 04Ch
    db 03Bh, 0FBh, 074h, 00Fh, 03Bh, 0FDh, 075h, 006h, 08Bh, 0FDh, 08Bh, 036h, 0E2h, 018h, 08Bh, 0D3h
    db 0E8h, 084h, 016h, 0A1h, 029h, 050h, 08Bh, 00Eh, 02Bh, 050h, 0BBh, 0B5h, 04Ch
    call far ptr gfx_dirtyRect
    db 080h, 03Eh, 02Ch, 067h, 002h, 074h, 016h, 083h, 036h, 0E8h, 018h, 0FFh, 074h, 00Fh, 08Ah, 026h
    db 0E7h, 018h
    call far ptr gfx_setPageDirect
    db 0E8h, 025h, 016h, 0E9h, 057h, 0FFh
    call far ptr gfx_resetBlitOffset
    db 0C3h
sub_1FEFE endp

sub_20104 proc far
    db 055h, 08Bh, 0ECh, 056h, 057h, 08Bh, 046h, 00Ah, 0A3h, 096h, 019h, 08Bh, 046h, 00Ch, 0A3h, 098h
    db 019h, 08Bh, 046h, 00Eh, 0A3h, 09Ah, 019h, 0C4h, 076h, 006h, 089h, 036h, 08Ch, 019h, 08Ch, 006h
    db 08Eh, 019h, 026h, 0ACh, 0A2h, 0B2h, 019h, 08Bh, 05Eh, 012h, 02Bh, 01Eh, 0B6h, 019h, 089h, 01Eh
    db 092h, 019h, 08Bh, 04Eh, 014h, 02Bh, 00Eh, 0B8h, 019h, 089h, 00Eh, 094h, 019h, 08Bh, 06Eh, 010h
    db 02Bh, 02Eh, 0B4h, 019h, 089h, 02Eh, 090h, 019h, 0E8h, 039h, 000h, 075h, 033h, 0E8h, 035h, 001h
    db 083h, 0FEh, 001h, 075h, 007h, 083h, 03Eh, 02Ch, 067h, 002h, 075h, 024h, 08Ah, 0C8h, 024h, 060h
    db 03Ch, 060h, 075h, 003h, 0E8h, 04Bh, 001h, 0F6h, 0C1h, 040h, 075h, 00Bh, 0A1h, 0B8h, 019h, 0F7h
    db 0D8h, 03Bh, 006h, 094h, 019h, 074h, 006h, 0E8h, 082h, 001h, 0EBh, 004h, 090h, 0E8h, 0E3h, 002h
    db 05Fh, 05Eh, 05Dh, 0CBh
sub_20104 endp

sub_20188 proc near
    db 056h, 0A1h, 0D2h, 019h, 0F7h, 0EBh, 08Bh, 0FAh, 08Bh, 0F0h, 0A1h, 0CCh, 019h, 0F7h, 0E9h, 003h
    db 0F0h, 013h, 0FAh, 0A1h, 0C6h, 019h, 0F7h, 0EDh, 003h, 0F0h, 013h, 0FAh, 0D1h, 0E6h, 0D1h, 0D7h
    db 089h, 036h, 09Ch, 019h, 089h, 03Eh, 09Eh, 019h, 0A1h, 0D4h, 019h, 0F7h, 0EBh, 08Bh, 0FAh, 08Bh
    db 0F0h, 0A1h, 0CEh, 019h, 0F7h, 0E9h, 003h, 0F0h, 013h, 0FAh, 0A1h, 0C8h, 019h, 0F7h, 0EDh, 003h
    db 0F0h, 013h, 0FAh, 0D1h, 0E6h, 0D1h, 0D7h, 089h, 036h, 0A0h, 019h, 089h, 03Eh, 0A2h, 019h, 0A1h
    db 0D6h, 019h, 0F7h, 0EBh, 08Bh, 0FAh, 08Bh, 0F0h, 0A1h, 0D0h, 019h, 0F7h, 0E9h, 003h, 0F0h, 013h
    db 0FAh, 0A1h, 0CAh, 019h, 0F7h, 0EDh, 003h, 0F0h, 013h, 0FAh, 0D1h, 0E6h, 0D1h, 0D7h, 089h, 036h
    db 0A4h, 019h, 089h, 03Eh, 0A6h, 019h, 03Bh, 03Eh, 00Ch, 019h, 07Fh, 07Eh, 08Bh, 01Eh, 0B2h, 019h
    db 0D1h, 0E3h, 03Bh, 0BFh, 01Ch, 019h, 07Ch, 072h, 08Bh, 036h, 0ECh, 09Dh, 08Bh, 02Eh, 0F2h, 09Dh
    db 003h, 0F3h, 003h, 0EBh, 08Ah, 00Eh, 074h, 053h, 080h, 0F1h, 001h, 08Bh, 0C7h, 099h, 033h, 0C2h
    db 02Bh, 0C2h, 08Bh, 0F8h, 003h, 004h, 0D3h, 0F8h, 08Bh, 0F0h, 0D1h, 0FEh, 0D1h, 0FEh, 003h, 0F0h
    db 0A1h, 09Eh, 019h, 099h, 033h, 0C2h, 02Bh, 0C2h, 03Bh, 0C6h, 07Fh, 03Eh, 08Bh, 0F0h, 08Bh, 0C7h
    db 003h, 046h, 000h, 0D3h, 0F8h, 08Bh, 0D8h, 080h, 03Eh, 012h, 008h, 000h, 074h, 00Ah, 0D1h, 0FBh
    db 0D1h, 0FBh, 0D1h, 0FBh, 003h, 0D8h, 0D1h, 0FBh, 0A1h, 0A2h, 019h, 099h, 033h, 0C2h, 02Bh, 0C2h
    db 03Bh, 0C3h, 07Fh, 016h, 003h, 0F0h, 0D1h, 0FEh, 0D1h, 0FEh, 003h, 0F7h, 089h, 036h, 0B0h, 019h
    db 03Bh, 036h, 00Ch, 019h, 07Fh, 004h, 02Bh, 0C0h, 05Eh, 0C3h, 0B8h, 001h, 000h, 00Bh, 0C0h, 05Eh
    db 0C3h
sub_20188 endp

sub_20289 proc near
    db 026h, 08Ah, 004h, 0A8h, 080h, 074h, 021h, 025h, 007h, 000h, 0D1h, 0E0h, 08Bh, 0D8h, 0A1h, 0B0h
    db 019h, 08Ah, 00Eh, 05Eh, 05Ch, 0D3h, 0F8h, 03Bh, 087h, 0FCh, 018h, 07Eh, 006h, 026h, 003h, 074h
    db 001h, 0EBh, 0DDh, 083h, 0C6h, 003h, 0EBh, 0D8h, 0C3h
sub_20289 endp

    db 0C4h, 036h, 08Ch, 019h
sub_202B6 proc near
    db 026h, 0ACh, 025h, 003h, 000h, 0D1h, 0E0h, 08Bh, 0D8h, 0A1h, 00Ah, 01Ah, 089h, 087h, 094h, 019h
    db 0C3h
sub_202B6 endp

sub_202C7 proc far
    db 055h, 08Bh, 0ECh, 057h, 08Bh, 04Eh, 00Ah, 08Bh, 05Eh, 008h, 08Bh, 06Eh, 006h, 0E8h, 0B1h, 0FEh
    db 05Fh, 05Dh, 0CBh
sub_202C7 endp

sub_202DA proc far
    db 056h, 0C4h, 036h, 08Ch, 019h, 0E8h, 0A7h, 0FFh, 089h, 036h, 08Ch, 019h, 05Eh, 0CBh
sub_202DA endp

    db 055h, 056h, 057h, 0C4h, 036h, 08Ch, 019h, 0E8h, 00Eh, 000h, 05Fh, 05Eh, 05Dh, 0C3h
sub_202F6 proc far
    db 055h, 056h, 057h, 0E8h, 0E4h, 000h, 05Fh, 05Eh, 05Dh, 0CBh
sub_202F6 endp

sub_20300 proc near
    db 089h, 036h, 08Ch, 019h, 08Ch, 006h, 08Eh, 019h, 08Ch, 0D8h, 08Eh, 0C0h, 0A1h, 0FCh, 019h, 03Dh
    db 023h, 000h, 07Ch, 018h, 08Bh, 01Eh, 048h, 032h, 0B9h, 022h, 000h, 0BEh, 04Ah, 032h, 0BFh, 048h
    db 032h, 0F3h, 0A5h, 08Bh, 0FBh, 048h, 0A3h, 0FCh, 019h, 0EBh, 00Ah, 090h, 0BFh, 0E8h, 02Dh, 0B1h
    db 005h, 0D3h, 0E0h, 003h, 0F8h, 0A1h, 0A4h, 019h, 08Bh, 016h, 0A6h, 019h, 08Bh, 00Eh, 0BCh, 098h
    db 08Bh, 0D9h, 0D1h, 0E1h, 0F7h, 0D9h, 083h, 0C1h, 008h, 074h, 006h, 0D1h, 0FAh, 0D1h, 0D8h, 0E2h
    db 0FAh, 083h, 0FBh, 002h, 075h, 00Ah, 083h, 03Eh, 0B2h, 019h, 005h, 075h, 003h, 083h, 0C2h, 020h
    db 08Bh, 0EFh, 050h, 052h, 0ABh, 08Bh, 0C2h, 0ABh, 0A1h, 08Ch, 019h, 0ABh, 0A1h, 08Eh, 019h, 0ABh
    db 0A1h, 090h, 019h, 0ABh, 0A1h, 092h, 019h, 0ABh, 0A1h, 094h, 019h, 0ABh, 0A1h, 096h, 019h, 0ABh
    db 0A1h, 098h, 019h, 0ABh, 0A1h, 09Ah, 019h, 0ABh, 0A1h, 09Ch, 019h, 0ABh, 0A1h, 09Eh, 019h, 0ABh
    db 0A1h, 0A0h, 019h, 0ABh, 0A1h, 0A2h, 019h, 0ABh, 0A1h, 0A4h, 019h, 0ABh, 0A1h, 0A6h, 019h, 0ABh
    db 05Ah, 058h, 08Bh, 01Eh, 0FCh, 019h, 0D1h, 0E3h, 08Bh, 0CBh, 083h, 0EBh, 002h, 078h, 00Fh, 08Bh
    db 0BFh, 048h, 032h, 03Bh, 055h, 002h, 07Fh, 0F2h, 07Ch, 004h, 03Bh, 005h, 077h, 0ECh, 083h, 0E9h
    db 002h, 08Bh, 0F9h, 081h, 0C7h, 04Ah, 032h, 08Bh, 0F1h, 081h, 0C6h, 048h, 032h, 02Bh, 0CBh, 07Eh
    db 008h, 0D1h, 0E9h, 0FAh, 0FDh, 0F3h, 0A5h, 0FCh, 0FBh, 089h, 02Dh, 0FFh, 006h, 0FCh, 019h, 0C3h
sub_20300 endp

sub_203E0 proc near
    db 083h, 03Eh, 0FCh, 019h, 000h, 074h, 054h, 0BEh, 046h, 032h, 083h, 0C6h, 002h, 056h, 08Bh, 034h
    db 083h, 0C6h, 004h, 0ADh, 0A3h, 08Ch, 019h, 0ADh, 0A3h, 08Eh, 019h, 0ADh, 0A3h, 090h, 019h, 0ADh
    db 0A3h, 092h, 019h, 0ADh, 0A3h, 094h, 019h, 0ADh, 0A3h, 096h, 019h, 0ADh, 0A3h, 098h, 019h, 0ADh
    db 0A3h, 09Ah, 019h, 0ADh, 0A3h, 09Ch, 019h, 0ADh, 0A3h, 09Eh, 019h, 0ADh, 0A3h, 0A0h, 019h, 0ADh
    db 0A3h, 0A2h, 019h, 0ADh, 0A3h, 0A4h, 019h, 0ADh, 0A3h, 0A6h, 019h, 0C4h, 036h, 08Ch, 019h, 0E8h
    db 035h, 000h, 05Eh, 0FFh, 00Eh, 0FCh, 019h, 074h, 002h, 0EBh, 0AFh, 0C3h
sub_203E0 endp

    db 055h, 056h, 057h, 0C4h, 036h, 08Ch, 019h, 0E8h, 021h, 000h, 05Fh, 05Eh, 05Dh, 0C3h
sub_2044A proc far
    db 055h, 056h, 057h, 08Bh, 00Eh, 094h, 019h, 0A1h, 092h, 019h, 08Bh, 02Eh, 090h, 019h, 0C4h, 036h
    db 08Ch, 019h, 0E8h, 0D5h, 000h, 089h, 036h, 08Ch, 019h, 05Fh, 05Eh, 05Dh, 0CBh
sub_2044A endp

sub_20467 proc near
    db 08Ah, 026h, 083h, 000h, 00Ah, 0E4h, 074h, 027h, 0A0h, 0A7h, 019h, 098h, 0F6h, 0D4h, 022h, 0C4h
    db 02Ah, 0E4h, 0D1h, 0E8h, 08Ah, 0E0h, 080h, 0ECh, 000h, 079h, 002h, 02Ah, 0E4h, 080h, 0FCh, 007h
    db 07Eh, 002h, 0B4h, 007h, 0D0h, 0E4h, 0D0h, 0E4h, 0D0h, 0E4h, 0D0h, 0E4h, 080h, 0C4h, 080h, 088h
    db 026h, 0EAh, 018h, 026h, 08Ah, 004h, 024h, 03Fh, 03Ch, 03Eh, 07Ch, 008h, 074h, 003h, 0E9h, 062h
    db 00Dh, 0E9h, 0C9h, 00Eh, 0A1h, 096h, 019h, 00Bh, 006h, 098h, 019h, 00Bh, 006h, 09Ah, 019h, 00Ah
    db 0C4h, 0A2h, 0A8h, 019h, 074h, 023h, 056h, 0BFh, 0D8h, 019h, 08Bh, 00Eh, 096h, 019h, 08Bh, 036h
    db 098h, 019h, 08Bh, 02Eh, 09Ah, 019h, 0E8h, 02Bh, 008h, 0BBh, 0D8h, 019h, 0BEh, 0C6h, 019h, 0BFh
    db 0EAh, 019h, 0E8h, 071h, 009h, 05Eh, 0EBh, 037h, 090h, 0A1h, 0C6h, 019h, 0A3h, 0EAh, 019h, 0A1h
    db 0C8h, 019h, 0A3h, 0ECh, 019h, 0A1h, 0CAh, 019h, 0A3h, 0EEh, 019h, 0A1h, 0CCh, 019h, 0A3h, 0F0h
    db 019h, 0A1h, 0CEh, 019h, 0A3h, 0F2h, 019h, 0A1h, 0D0h, 019h, 0A3h, 0F4h, 019h, 0A1h, 0D2h, 019h
    db 0A3h, 0F6h, 019h, 0A1h, 0D4h, 019h, 0A3h, 0F8h, 019h, 0A1h, 0D6h, 019h, 0A3h, 0FAh, 019h, 08Bh
    db 00Eh, 094h, 019h, 0A1h, 092h, 019h, 08Bh, 02Eh, 090h, 019h, 0E8h, 010h, 000h, 0E8h, 06Ch, 0F4h
    db 0E8h, 046h, 004h, 0E8h, 02Bh, 005h, 0E8h, 0BAh, 00Ah, 0E8h, 084h, 0F4h, 0C3h
sub_20467 endp

sub_20534 proc near
    db 0F7h, 0DDh, 0F7h, 0D8h, 0F7h, 0D9h, 080h, 03Eh, 0A8h, 019h, 000h, 075h, 00Eh, 089h, 02Eh, 0CEh
    db 042h, 089h, 00Eh, 0D0h, 042h, 0A3h, 0D2h, 042h, 0E9h, 08Fh, 000h, 0A3h, 0D4h, 042h, 0E8h, 0C4h
    db 008h, 056h, 0A1h, 0D4h, 042h, 0F7h, 02Eh, 0E4h, 019h, 08Bh, 0FAh, 08Bh, 0F0h, 08Bh, 0C1h, 0F7h
    db 02Eh, 0DEh, 019h, 003h, 0F0h, 013h, 0FAh, 08Bh, 0C5h, 0F7h, 02Eh, 0D8h, 019h, 003h, 0F0h, 013h
    db 0FAh, 0D1h, 0E6h, 0D1h, 0D7h, 0D1h, 0E6h, 083h, 0D7h, 000h, 089h, 03Eh, 0CEh, 042h, 0A1h, 0D4h
    db 042h, 0F7h, 02Eh, 0E6h, 019h, 08Bh, 0FAh, 08Bh, 0F0h, 08Bh, 0C1h, 0F7h, 02Eh, 0E0h, 019h, 003h
    db 0F0h, 013h, 0FAh, 08Bh, 0C5h, 0F7h, 02Eh, 0DAh, 019h, 003h, 0F0h, 013h, 0FAh, 0D1h, 0E6h, 0D1h
    db 0D7h, 0D1h, 0E6h, 083h, 0D7h, 000h, 089h, 03Eh, 0D0h, 042h, 0A1h, 0D4h, 042h, 0F7h, 02Eh, 0E8h
    db 019h, 08Bh, 0FAh, 08Bh, 0F0h, 08Bh, 0C1h, 0F7h, 02Eh, 0E2h, 019h, 003h, 0F0h, 013h, 0FAh, 08Bh
    db 0C5h, 0F7h, 02Eh, 0DCh, 019h, 003h, 0F0h, 013h, 0FAh, 0D1h, 0E6h, 0D1h, 0D7h, 0D1h, 0E6h, 083h
    db 0D7h, 000h, 089h, 03Eh, 0D2h, 042h, 05Eh, 0E8h, 03Bh, 008h, 026h, 0ACh, 025h, 01Fh, 000h, 0A3h
    db 000h, 01Ah, 08Bh, 0C8h, 02Bh, 0C0h, 083h, 0F9h, 010h, 07Eh, 001h, 040h, 0A2h, 004h, 01Ah, 0C7h
    db 006h, 006h, 01Ah, 0FFh, 0FFh, 0C7h, 006h, 008h, 01Ah, 0FFh, 0FFh, 00Bh, 0C9h, 074h, 044h, 0BBh
    db 001h, 000h, 02Bh, 0FFh, 053h, 026h, 0ADh, 0F7h, 02Eh, 0CEh, 042h, 08Bh, 0E8h, 08Bh, 0DAh, 026h
    db 0ADh, 0F7h, 02Eh, 0D2h, 042h, 003h, 0E8h, 013h, 0DAh, 026h, 0ADh, 0F7h, 02Eh, 0D0h, 042h, 003h
    db 0E8h, 013h, 0DAh, 026h, 0ADh, 099h, 03Bh, 0DAh, 05Bh, 07Fh, 010h, 07Ch, 004h, 03Bh, 0E8h, 073h
    db 00Ah, 031h, 01Eh, 006h, 01Ah, 031h, 03Eh, 008h, 01Ah, 0FEh, 0C5h, 0D1h, 0E3h, 0D1h, 0D7h, 0FEh
    db 0C9h, 075h, 0C1h, 0A0h, 000h, 01Ah, 03Ch, 004h, 07Ch, 008h, 03Ah, 0C5h, 075h, 004h, 0FFh, 006h
    db 0D6h, 042h, 0C3h
sub_20534 endp

    db 0C3h
sub_20658 proc far
    db 055h, 056h, 057h, 0E8h, 016h, 000h, 05Fh, 05Eh, 05Dh, 0CBh
sub_20658 endp

    db 055h, 056h, 057h, 0C4h, 036h, 08Ch, 019h, 0E8h, 004h, 003h, 089h, 036h, 08Ch, 019h, 05Fh, 05Eh
    db 05Dh, 0C3h
sub_20674 proc near
    db 083h, 03Eh, 066h, 015h, 000h, 075h, 001h, 0C3h, 08Bh, 01Eh, 060h, 015h, 04Bh, 0D1h, 0E3h, 08Bh
    db 0FBh, 0D1h, 0E7h, 08Bh, 08Fh, 04Ch, 095h, 0A1h, 0C6h, 019h, 0F7h, 0E9h, 0D1h, 0E0h, 0D1h, 0D2h
    db 089h, 085h, 088h, 02Ah, 089h, 095h, 08Ah, 02Ah, 0A1h, 0C8h, 019h, 0F7h, 0E9h, 0D1h, 0E0h, 0D1h
    db 0D2h, 089h, 085h, 008h, 02Bh, 089h, 095h, 00Ah, 02Bh, 0A1h, 0CAh, 019h, 0F7h, 0E9h, 0D1h, 0E0h
    db 0D1h, 0D2h, 089h, 085h, 088h, 02Bh, 089h, 095h, 08Ah, 02Bh, 083h, 0EFh, 004h, 083h, 0EBh, 002h
    db 079h, 0C1h, 08Bh, 01Eh, 064h, 015h, 04Bh, 0D1h, 0E3h, 08Bh, 0FBh, 0D1h, 0E7h, 08Bh, 08Fh, 0D0h
    db 095h, 0A1h, 0CCh, 019h, 0F7h, 0E9h, 0D1h, 0E0h, 0D1h, 0D2h, 089h, 085h, 008h, 02Ch, 089h, 095h
    db 00Ah, 02Ch, 0A1h, 0CEh, 019h, 0F7h, 0E9h, 0D1h, 0E0h, 0D1h, 0D2h, 089h, 085h, 028h, 02Ch, 089h
    db 095h, 02Ah, 02Ch, 0A1h, 0D0h, 019h, 0F7h, 0E9h, 0D1h, 0E0h, 0D1h, 0D2h, 089h, 085h, 048h, 02Ch
    db 089h, 095h, 04Ah, 02Ch, 083h, 0EFh, 004h, 083h, 0EBh, 002h, 079h, 0C1h, 08Bh, 01Eh, 062h, 015h
    db 04Bh, 0D1h, 0E3h, 08Bh, 0FBh, 0D1h, 0E7h, 08Bh, 08Fh, 08Eh, 095h, 0A1h, 0D2h, 019h, 0F7h, 0E9h
    db 0D1h, 0E0h, 0D1h, 0D2h, 089h, 085h, 068h, 02Ch, 089h, 095h, 06Ah, 02Ch, 0A1h, 0D4h, 019h, 0F7h
    db 0E9h, 0D1h, 0E0h, 0D1h, 0D2h, 089h, 085h, 0E8h, 02Ch, 089h, 095h, 0EAh, 02Ch, 0A1h, 0D6h, 019h
    db 0F7h, 0E9h, 0D1h, 0E0h, 0D1h, 0D2h, 089h, 085h, 068h, 02Dh, 089h, 095h, 06Ah, 02Dh, 083h, 0EFh
    db 004h, 083h, 0EBh, 002h, 079h, 0C1h, 08Bh, 036h, 066h, 015h, 04Eh, 08Bh, 09Ch, 05Eh, 086h, 081h
    db 0E3h, 0FFh, 000h, 0D1h, 0E3h, 0D1h, 0E3h, 08Bh, 0BCh, 0FEh, 087h, 081h, 0E7h, 0FFh, 000h, 0D1h
    db 0E7h, 0D1h, 0E7h, 08Bh, 0ACh, 0B8h, 088h, 081h, 0E5h, 0FFh, 000h, 0D1h, 0E5h, 0D1h, 0E5h, 0C4h
    db 087h, 088h, 02Ah, 08Ch, 0C2h, 0C4h, 08Eh, 008h, 02Ch, 003h, 0C1h, 08Ch, 0C1h, 013h, 0D1h, 0C4h
    db 08Dh, 068h, 02Ch, 003h, 0C1h, 08Ch, 0C1h, 013h, 0D1h, 0D1h, 0E6h, 0D1h, 0E6h, 089h, 084h, 080h
    db 023h, 089h, 094h, 082h, 023h, 0C4h, 087h, 008h, 02Bh, 08Ch, 0C2h, 0C4h, 08Eh, 028h, 02Ch, 003h
    db 0C1h, 08Ch, 0C1h, 013h, 0D1h, 0C4h, 08Dh, 0E8h, 02Ch, 003h, 0C1h, 08Ch, 0C1h, 013h, 0D1h, 089h
    db 084h, 0D8h, 025h, 089h, 094h, 0DAh, 025h, 0C4h, 087h, 088h, 02Bh, 08Ch, 0C2h, 0C4h, 08Eh, 048h
    db 02Ch, 003h, 0C1h, 08Ch, 0C1h, 013h, 0D1h, 0C4h, 08Dh, 068h, 02Dh, 003h, 0C1h, 08Ch, 0C1h, 013h
    db 0D1h, 089h, 084h, 030h, 028h, 089h, 094h, 032h, 028h, 0D1h, 0EEh, 0D1h, 0EEh, 04Eh, 078h, 003h
    db 0E9h, 068h, 0FFh, 0C3h
sub_20674 endp

    db 08Ah, 0D8h, 083h, 0E3h, 07Fh, 0D1h, 0E3h, 0D1h, 0E3h, 089h, 01Eh, 0D9h, 042h, 0BBh, 0FCh, 0FFh
    db 083h, 0C3h, 004h, 03Bh, 01Eh, 0D9h, 042h, 07Ch, 001h, 0C3h, 0E8h, 00Dh, 00Ch, 046h, 00Bh, 0C0h
    db 074h, 0EEh, 026h, 08Bh, 06Ch, 0FFh, 081h, 0E5h, 0FFh, 000h, 08Ah, 086h, 0B8h, 088h, 02Ah, 0E4h
    db 0D1h, 0E0h, 08Bh, 0E8h, 08Bh, 08Eh, 0D0h, 095h, 026h, 08Bh, 06Ch, 0FFh, 081h, 0E5h, 0FFh, 000h
    db 08Ah, 086h, 0FEh, 087h, 02Ah, 0E4h, 0D1h, 0E0h, 08Bh, 0E8h, 08Bh, 086h, 08Eh, 095h, 0A3h, 0DBh
    db 042h, 026h, 08Bh, 06Ch, 0FFh, 081h, 0E5h, 0FFh, 000h, 08Ah, 086h, 05Eh, 086h, 02Ah, 0E4h, 0D1h
    db 0E0h, 08Bh, 0E8h, 08Bh, 0AEh, 04Ch, 095h, 056h, 0A1h, 0DBh, 042h, 0F7h, 02Eh, 0F6h, 019h, 08Bh
    db 0FAh, 08Bh, 0F0h, 0A1h, 0F0h, 019h, 0F7h, 0E9h, 003h, 0F0h, 013h, 0FAh, 0A1h, 0EAh, 019h, 0F7h
    db 0EDh, 003h, 0F0h, 013h, 0FAh, 0D1h, 0E6h, 0D1h, 0D7h, 003h, 036h, 09Ch, 019h, 013h, 03Eh, 09Eh
    db 019h, 089h, 0B7h, 00Ch, 01Ah, 089h, 0BFh, 00Eh, 01Ah, 0A1h, 0DBh, 042h, 0F7h, 02Eh, 0F8h, 019h
    db 08Bh, 0FAh, 08Bh, 0F0h, 0A1h, 0F2h, 019h, 0F7h, 0E9h, 003h, 0F0h, 013h, 0FAh, 0A1h, 0ECh, 019h
    db 0F7h, 0EDh, 003h, 0F0h, 013h, 0FAh, 0D1h, 0E6h, 0D1h, 0D7h, 003h, 036h, 0A0h, 019h, 013h, 03Eh
    db 0A2h, 019h, 089h, 0B7h, 0F0h, 01Bh, 089h, 0BFh, 0F2h, 01Bh, 0A1h, 0DBh, 042h, 0F7h, 02Eh, 0FAh
    db 019h, 08Bh, 0FAh, 08Bh, 0F0h, 0A1h, 0F4h, 019h, 0F7h, 0E9h, 003h, 0F0h, 013h, 0FAh, 0A1h, 0EEh
    db 019h, 0F7h, 0EDh, 003h, 0F0h, 013h, 0FAh, 0D1h, 0E6h, 0D1h, 0D7h, 003h, 036h, 0A4h, 019h, 013h
    db 03Eh, 0A6h, 019h, 089h, 0B7h, 0D4h, 01Dh, 089h, 0BFh, 0D6h, 01Dh, 0E8h, 002h, 0F0h, 05Eh, 0E9h
    db 00Eh, 0FFh, 0E9h, 0FBh, 0FEh, 080h, 03Eh, 0D8h, 042h, 000h, 075h, 0F6h, 08Ah, 0C8h, 083h, 0E1h
    db 07Fh, 02Bh, 0DBh, 0E8h, 014h, 00Bh, 075h, 007h, 046h, 083h, 0C3h, 004h, 0E2h, 0F5h, 0C3h, 026h
    db 0ACh, 02Ah, 0E4h, 0D1h, 0E0h, 0D1h, 0E0h, 08Bh, 0F8h, 0A1h, 09Ch, 019h, 003h, 085h, 080h, 023h
    db 089h, 087h, 00Ch, 01Ah, 0A1h, 09Eh, 019h, 013h, 085h, 082h, 023h, 089h, 087h, 00Eh, 01Ah, 0A1h
    db 0A0h, 019h, 003h, 085h, 0D8h, 025h, 089h, 087h, 0F0h, 01Bh, 0A1h, 0A2h, 019h, 013h, 085h, 0DAh
    db 025h, 089h, 087h, 0F2h, 01Bh, 0A1h, 0A4h, 019h, 003h, 085h, 030h, 028h, 089h, 087h, 0D4h, 01Dh
    db 0A1h, 0A6h, 019h, 013h, 085h, 032h, 028h, 089h, 087h, 0D6h, 01Dh, 051h, 056h, 0E8h, 090h, 0EFh
    db 05Eh, 059h, 083h, 0C3h, 004h, 0E2h, 09Ch, 0C3h
sub_20970 proc near
    db 026h, 0ACh, 0A8h, 080h, 075h, 087h, 0A8h, 07Fh, 074h, 019h, 08Ah, 0D8h, 083h, 0E3h, 07Fh, 0D1h
    db 0E3h, 0D1h, 0E3h, 089h, 01Eh, 0D9h, 042h, 0BBh, 0FCh, 0FFh, 083h, 0C3h, 004h, 03Bh, 01Eh, 0D9h
    db 042h, 07Ch, 001h, 0C3h, 0E8h, 08Bh, 00Ah, 083h, 0C6h, 006h, 00Bh, 0C0h, 074h, 0ECh, 026h, 08Bh
    db 06Ch, 0FAh, 026h, 08Bh, 04Ch, 0FEh, 026h, 08Bh, 044h, 0FCh, 0A3h, 0DBh, 042h, 056h, 0F7h, 02Eh
    db 0F6h, 019h, 08Bh, 0FAh, 08Bh, 0F0h, 0A1h, 0F0h, 019h, 0F7h, 0E9h, 003h, 0F0h, 013h, 0FAh, 0A1h
    db 0EAh, 019h, 0F7h, 0EDh, 003h, 0F0h, 013h, 0FAh, 0D1h, 0E6h, 0D1h, 0D7h, 003h, 036h, 09Ch, 019h
    db 013h, 03Eh, 09Eh, 019h, 089h, 0B7h, 00Ch, 01Ah, 089h, 0BFh, 00Eh, 01Ah, 0A1h, 0DBh, 042h, 0F7h
    db 02Eh, 0F8h, 019h, 08Bh, 0FAh, 08Bh, 0F0h, 0A1h, 0F2h, 019h, 0F7h, 0E9h, 003h, 0F0h, 013h, 0FAh
    db 0A1h, 0ECh, 019h, 0F7h, 0EDh, 003h, 0F0h, 013h, 0FAh, 0D1h, 0E6h, 0D1h, 0D7h, 003h, 036h, 0A0h
    db 019h, 013h, 03Eh, 0A2h, 019h, 089h, 0B7h, 0F0h, 01Bh, 089h, 0BFh, 0F2h, 01Bh, 0A1h, 0DBh, 042h
    db 0F7h, 02Eh, 0FAh, 019h, 08Bh, 0FAh, 08Bh, 0F0h, 0A1h, 0F4h, 019h, 0F7h, 0E9h, 003h, 0F0h, 013h
    db 0FAh, 0A1h, 0EEh, 019h, 0F7h, 0EDh, 003h, 0F0h, 013h, 0FAh, 0D1h, 0E6h, 0D1h, 0D7h, 003h, 036h
    db 0A4h, 019h, 013h, 03Eh, 0A6h, 019h, 089h, 0B7h, 0D4h, 01Dh, 089h, 0BFh, 0D6h, 01Dh, 0E8h, 0B7h
    db 0EEh, 05Eh, 0E9h, 045h, 0FFh
sub_20970 endp

    db 000h
sub_20A46 proc far
    db 055h, 056h, 057h, 0C4h, 036h, 08Ch, 019h, 0E8h, 008h, 000h, 089h, 036h, 08Ch, 019h, 05Fh, 05Eh
    db 05Dh, 0CBh
sub_20A46 endp

sub_20A58 proc near
    db 02Ah, 0E4h, 026h, 0ACh, 00Bh, 0C0h, 074h, 015h, 08Bh, 0C8h, 02Bh, 0FFh, 081h, 0C7h, 08Eh, 032h
    db 0E8h, 0B7h, 009h, 075h, 009h, 083h, 0C6h, 002h, 083h, 0C7h, 01Ah, 0E2h, 0F3h, 0C3h, 02Ah, 0E4h
    db 026h, 0ACh, 08Bh, 0D8h, 0D1h, 0E3h, 0D1h, 0E3h, 026h, 0ACh, 08Bh, 0E8h, 0D1h, 0E5h, 0D1h, 0E5h
    db 0C6h, 045h, 018h, 000h, 083h, 0BFh, 0D6h, 01Dh, 001h, 07Ch, 02Dh, 083h, 0BEh, 0D6h, 01Dh, 001h
    db 07Ch, 01Eh, 08Bh, 087h, 0B8h, 01Fh, 089h, 005h, 08Bh, 087h, 0BAh, 01Fh, 089h, 045h, 002h, 08Bh
    db 087h, 09Ch, 021h, 089h, 045h, 004h, 08Bh, 087h, 09Eh, 021h, 089h, 045h, 006h, 0EBh, 01Ah, 090h
    db 087h, 0EBh, 0E8h, 045h, 000h, 0EBh, 012h, 090h, 083h, 0BEh, 0D6h, 01Dh, 001h, 07Dh, 007h, 080h
    db 04Dh, 018h, 080h, 0EBh, 02Bh, 090h, 0E8h, 031h, 000h, 08Bh, 086h, 0B8h, 01Fh, 089h, 045h, 008h
    db 08Bh, 086h, 0BAh, 01Fh, 089h, 045h, 00Ah, 08Bh, 086h, 09Ch, 021h, 089h, 045h, 00Ch, 08Bh, 086h
    db 09Eh, 021h, 089h, 045h, 00Eh, 051h, 056h, 0E8h, 0EBh, 0EEh, 08Eh, 006h, 08Eh, 019h, 05Eh, 059h
    db 083h, 0C7h, 01Ah, 049h, 074h, 003h, 0E9h, 067h, 0FFh, 0C3h
sub_20A58 endp

sub_20B02 proc near
    db 006h, 051h, 056h, 057h, 08Bh, 086h, 0D4h, 01Dh, 08Bh, 096h, 0D6h, 01Dh, 08Bh, 0CAh, 02Bh, 08Fh
    db 0D6h, 01Dh, 04Ah, 0F7h, 0F1h, 0D1h, 0E8h, 08Bh, 0C8h, 08Bh, 096h, 00Ch, 01Ah, 08Bh, 086h, 00Eh
    db 01Ah, 08Bh, 0F2h, 08Bh, 0F8h, 02Bh, 097h, 00Ch, 01Ah, 01Bh, 087h, 00Eh, 01Ah, 0D1h, 0E2h, 015h
    db 000h, 000h, 0F7h, 0E9h, 0D1h, 0E0h, 0D1h, 0D2h, 02Bh, 0F0h, 01Bh, 0FAh, 089h, 036h, 0ECh, 01Bh
    db 089h, 03Eh, 0EEh, 01Bh, 08Bh, 096h, 0F0h, 01Bh, 08Bh, 086h, 0F2h, 01Bh, 08Bh, 0F2h, 08Bh, 0F8h
    db 02Bh, 097h, 0F0h, 01Bh, 01Bh, 087h, 0F2h, 01Bh, 0D1h, 0E2h, 015h, 000h, 000h, 0F7h, 0E9h, 0D1h
    db 0E0h, 0D1h, 0D2h, 02Bh, 0F0h, 01Bh, 0FAh, 089h, 036h, 0D0h, 01Dh, 089h, 03Eh, 0D2h, 01Dh, 0C7h
    db 006h, 0B4h, 01Fh, 000h, 000h, 0C7h, 006h, 0B6h, 01Fh, 001h, 000h, 053h, 0BBh, 0E0h, 001h, 0E8h
    db 074h, 0EDh, 05Bh, 05Fh, 0C4h, 006h, 098h, 021h, 089h, 005h, 08Ch, 045h, 002h, 089h, 045h, 010h
    db 08Ch, 045h, 012h, 0C4h, 006h, 07Ch, 023h, 089h, 045h, 004h, 08Ch, 045h, 006h, 089h, 045h, 014h
    db 08Ch, 045h, 016h, 083h, 04Dh, 018h, 040h, 05Eh, 059h, 007h, 0C3h
sub_20B02 endp

    db 000h
sub_20BAE proc far
    db 055h, 08Bh, 0ECh, 056h, 057h, 08Bh, 07Eh, 006h, 08Bh, 04Eh, 008h, 08Bh, 076h, 00Ah, 08Bh, 06Eh
    db 00Ch, 0E8h, 01Dh, 000h, 05Fh, 05Eh, 05Dh, 0CBh
sub_20BAE endp

    db 055h, 056h, 057h, 0BFh, 0D8h, 019h, 08Bh, 00Eh, 096h, 019h, 08Bh, 036h, 098h, 019h, 08Bh, 02Eh
    db 09Ah, 019h, 0E8h, 020h, 001h, 05Fh, 05Eh, 05Dh, 0C3h
sub_20BDF proc near
    db 08Bh, 0D9h
    call far ptr sub_13BC1
    db 089h, 01Eh, 0BAh, 019h, 08Bh, 0D9h
    call far ptr sub_13BC5
    db 089h, 01Eh, 0BCh, 019h, 08Bh, 0DDh
    call far ptr sub_13BC1
    db 089h, 01Eh, 0C2h, 019h, 08Bh, 0DDh
    call far ptr sub_13BC5
    db 089h, 01Eh, 0C4h, 019h, 08Bh, 0DEh
    call far ptr sub_13BC1
    db 089h, 01Eh, 0BEh, 019h, 08Bh, 0DEh
    call far ptr sub_13BC5
    db 089h, 01Eh, 0C0h, 019h, 0A1h, 0BEh, 019h, 0F7h, 02Eh, 0C2h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh
    db 0F2h, 08Bh, 0C2h, 0F7h, 02Eh, 0BAh, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0D8h, 08Bh, 0CAh, 0A1h
    db 0BCh, 019h, 0F7h, 02Eh, 0C4h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0C3h, 013h, 0D1h, 089h, 015h
    db 0A1h, 0BEh, 019h, 0F7h, 02Eh, 0C4h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0EAh, 08Bh, 0C2h, 0F7h
    db 02Eh, 0BAh, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0D8h, 08Bh, 0CAh, 0A1h, 0BCh, 019h, 0F7h, 02Eh
    db 0C2h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 02Bh, 0D8h, 01Bh, 0CAh, 089h, 04Dh, 002h, 0A1h, 0BAh, 019h
    db 0F7h, 02Eh, 0C0h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 089h, 055h, 004h, 0A1h, 0C2h, 019h, 0F7h, 02Eh
    db 0C0h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 089h, 055h, 006h, 0A1h, 0C4h, 019h, 0F7h, 02Eh, 0C0h, 019h
    db 0D1h, 0E0h, 0D1h, 0D2h, 089h, 055h, 008h, 0A1h, 0BEh, 019h, 0F7h, 0D8h, 089h, 045h, 00Ah, 08Bh
    db 0C6h, 0F7h, 02Eh, 0BCh, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0D8h, 08Bh, 0CAh, 0A1h, 0BAh, 019h
    db 0F7h, 02Eh, 0C4h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 02Bh, 0D8h, 01Bh, 0CAh, 089h, 04Dh, 00Ch, 08Bh
    db 0C5h, 0F7h, 02Eh, 0BCh, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0D8h, 08Bh, 0CAh, 0A1h, 0BAh, 019h
    db 0F7h, 02Eh, 0C2h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0C3h, 013h, 0D1h, 089h, 055h, 00Eh, 0A1h
    db 0BCh, 019h, 0F7h, 02Eh, 0C0h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 089h, 055h, 010h, 0C3h
sub_20BDF endp

sub_20CFB proc near
    db 08Bh, 0D9h
    call far ptr sub_13BC1
    db 089h, 01Eh, 0BAh, 019h, 08Bh, 0D9h
    call far ptr sub_13BC5
    db 089h, 01Eh, 0BCh, 019h, 08Bh, 0DDh
    call far ptr sub_13BC1
    db 089h, 01Eh, 0C2h, 019h, 08Bh, 0DDh
    call far ptr sub_13BC5
    db 089h, 01Eh, 0C4h, 019h, 08Bh, 0DEh
    call far ptr sub_13BC1
    db 089h, 01Eh, 0BEh, 019h, 08Bh, 0DEh
    call far ptr sub_13BC5
    db 089h, 01Eh, 0C0h, 019h, 0A1h, 0BEh, 019h, 0F7h, 02Eh, 0C2h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh
    db 0F2h, 08Bh, 0C2h, 0F7h, 02Eh, 0BAh, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0D8h, 08Bh, 0CAh, 0A1h
    db 0BCh, 019h, 0F7h, 02Eh, 0C4h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 02Bh, 0C3h, 01Bh, 0D1h, 089h, 015h
    db 0A1h, 0BEh, 019h, 0F7h, 02Eh, 0C4h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0EAh, 08Bh, 0C2h, 0F7h
    db 02Eh, 0BAh, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0D8h, 08Bh, 0CAh, 0A1h, 0BCh, 019h, 0F7h, 02Eh
    db 0C2h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0D8h, 013h, 0CAh, 089h, 04Dh, 006h, 0A1h, 0BAh, 019h
    db 0F7h, 02Eh, 0C0h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 0F7h, 0DAh, 089h, 055h, 00Ch, 0A1h, 0C2h, 019h
    db 0F7h, 02Eh, 0C0h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 0F7h, 0DAh, 089h, 055h, 002h, 0A1h, 0C4h, 019h
    db 0F7h, 02Eh, 0C0h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 089h, 055h, 008h, 0A1h, 0BEh, 019h, 089h, 045h
    db 00Eh, 08Bh, 0C6h, 0F7h, 02Eh, 0BCh, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0D8h, 08Bh, 0CAh, 0A1h
    db 0BAh, 019h, 0F7h, 02Eh, 0C4h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0D8h, 013h, 0CAh, 089h, 04Dh
    db 004h, 08Bh, 0C5h, 0F7h, 02Eh, 0BCh, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0D8h, 08Bh, 0CAh, 0A1h
    db 0BAh, 019h, 0F7h, 02Eh, 0C2h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 02Bh, 0C3h, 01Bh, 0D1h, 089h, 055h
    db 00Ah, 0A1h, 0BCh, 019h, 0F7h, 02Eh, 0C0h, 019h, 0D1h, 0E0h, 0D1h, 0D2h, 089h, 055h, 010h, 0C3h
sub_20CFB endp

sub_20E19 proc near
    db 0BBh, 0D8h, 019h, 08Bh, 047h, 002h, 087h, 047h, 006h, 089h, 047h, 002h, 08Bh, 047h, 004h, 087h
    db 047h, 00Ch, 089h, 047h, 004h, 08Bh, 047h, 00Ah, 087h, 047h, 00Eh, 089h, 047h, 00Ah, 0C3h
sub_20E19 endp

sub_20E38 proc far
    db 055h, 08Bh, 0ECh, 056h, 057h, 08Bh, 05Eh, 006h, 08Bh, 076h, 008h, 08Bh, 07Eh, 00Ah, 0E8h, 004h
    db 000h, 05Fh, 05Eh, 05Dh, 0CBh
sub_20E38 endp

sub_20E4D proc near
    db 08Bh, 007h, 0F7h, 02Ch, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0E8h, 08Bh, 0CAh, 08Bh, 047h, 002h, 0F7h
    db 06Ch, 006h, 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0E8h, 013h, 0CAh, 08Bh, 047h, 004h, 0F7h, 06Ch, 00Ch
    db 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0E8h, 013h, 0CAh, 089h, 00Dh, 08Bh, 007h, 0F7h, 06Ch, 002h, 0D1h
    db 0E0h, 0D1h, 0D2h, 08Bh, 0E8h, 08Bh, 0CAh, 08Bh, 047h, 002h, 0F7h, 06Ch, 008h, 0D1h, 0E0h, 0D1h
    db 0D2h, 003h, 0E8h, 013h, 0CAh, 08Bh, 047h, 004h, 0F7h, 06Ch, 00Eh, 0D1h, 0E0h, 0D1h, 0D2h, 003h
    db 0E8h, 013h, 0CAh, 089h, 04Dh, 002h, 08Bh, 007h, 0F7h, 06Ch, 004h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh
    db 0E8h, 08Bh, 0CAh, 08Bh, 047h, 002h, 0F7h, 06Ch, 00Ah, 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0E8h, 013h
    db 0CAh, 08Bh, 047h, 004h, 0F7h, 06Ch, 010h, 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0E8h, 013h, 0CAh, 089h
    db 04Dh, 004h, 08Bh, 047h, 006h, 0F7h, 02Ch, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0E8h, 08Bh, 0CAh, 08Bh
    db 047h, 008h, 0F7h, 06Ch, 006h, 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0E8h, 013h, 0CAh, 08Bh, 047h, 00Ah
    db 0F7h, 06Ch, 00Ch, 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0E8h, 013h, 0CAh, 089h, 04Dh, 006h, 08Bh, 047h
    db 006h, 0F7h, 06Ch, 002h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0E8h, 08Bh, 0CAh, 08Bh, 047h, 008h, 0F7h
    db 06Ch, 008h, 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0E8h, 013h, 0CAh, 08Bh, 047h, 00Ah, 0F7h, 06Ch, 00Eh
    db 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0E8h, 013h, 0CAh, 089h, 04Dh, 008h, 08Bh, 047h, 006h, 0F7h, 06Ch
    db 004h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0E8h, 08Bh, 0CAh, 08Bh, 047h, 008h, 0F7h, 06Ch, 00Ah, 0D1h
    db 0E0h, 0D1h, 0D2h, 003h, 0E8h, 013h, 0CAh, 08Bh, 047h, 00Ah, 0F7h, 06Ch, 010h, 0D1h, 0E0h, 0D1h
    db 0D2h, 003h, 0E8h, 013h, 0CAh, 089h, 04Dh, 00Ah, 08Bh, 047h, 00Ch, 0F7h, 02Ch, 0D1h, 0E0h, 0D1h
    db 0D2h, 08Bh, 0E8h, 08Bh, 0CAh, 08Bh, 047h, 00Eh, 0F7h, 06Ch, 006h, 0D1h, 0E0h, 0D1h, 0D2h, 003h
    db 0E8h, 013h, 0CAh, 08Bh, 047h, 010h, 0F7h, 06Ch, 00Ch, 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0E8h, 013h
    db 0CAh, 089h, 04Dh, 00Ch, 08Bh, 047h, 00Ch, 0F7h, 06Ch, 002h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0E8h
    db 08Bh, 0CAh, 08Bh, 047h, 00Eh, 0F7h, 06Ch, 008h, 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0E8h, 013h, 0CAh
    db 08Bh, 047h, 010h, 0F7h, 06Ch, 00Eh, 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0E8h, 013h, 0CAh, 089h, 04Dh
    db 00Eh, 08Bh, 047h, 00Ch, 0F7h, 06Ch, 004h, 0D1h, 0E0h, 0D1h, 0D2h, 08Bh, 0E8h, 08Bh, 0CAh, 08Bh
    db 047h, 00Eh, 0F7h, 06Ch, 00Ah, 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0E8h, 013h, 0CAh, 08Bh, 047h, 010h
    db 0F7h, 06Ch, 010h, 0D1h, 0E0h, 0D1h, 0D2h, 003h, 0E8h, 013h, 0CAh, 089h, 04Dh, 010h, 0C3h
sub_20E4D endp

sub_20FDC proc far
    db 055h, 056h, 057h, 0C4h, 036h, 08Ch, 019h, 0E8h, 004h, 000h, 05Fh, 05Eh, 05Dh, 0CBh
sub_20FDC endp

sub_20FEA proc near
    db 026h, 0ACh, 00Ah, 0C0h, 074h, 010h, 03Ch, 0FFh, 074h, 00Dh, 0A2h, 0FEh, 042h, 0E8h, 07Bh, 000h
    db 0FEh, 00Eh, 0FEh, 042h, 075h, 0F7h, 0C3h, 0A1h, 006h, 01Ah, 08Bh, 02Eh, 008h, 01Ah, 08Bh, 00Eh
    db 000h, 01Ah, 0BFh, 040h, 043h, 08Bh, 0DFh, 0D1h, 0EDh, 0D1h, 0D8h, 0B2h, 0FFh, 080h, 0D2h, 000h
    db 088h, 015h, 047h, 0E2h, 0F2h, 0BFh, 0FFh, 042h, 056h, 0E8h, 036h, 0EEh, 05Eh, 08Bh, 01Eh, 000h
    db 01Ah, 08Bh, 0C3h, 0D1h, 0E0h, 003h, 0F0h, 046h, 089h, 036h, 060h, 043h, 003h, 0F0h, 089h, 036h
    db 062h, 043h, 003h, 0F3h, 089h, 036h, 064h, 043h, 0BEh, 0FFh, 042h, 0ACh, 02Ah, 0E4h, 056h, 08Bh
    db 03Eh, 062h, 043h, 003h, 0F8h, 026h, 08Ah, 01Dh, 088h, 01Eh, 066h, 043h, 08Bh, 036h, 060h, 043h
    db 0D1h, 0E0h, 003h, 0F0h, 026h, 08Bh, 034h, 003h, 036h, 064h, 043h, 0E8h, 00Dh, 000h, 0FEh, 00Eh
    db 066h, 043h, 075h, 0F7h, 05Eh, 0ACh, 03Ch, 0FFh, 075h, 0D2h, 0C3h
sub_20FEA endp

sub_21075 proc near
    db 026h, 0ACh, 08Ah, 0D8h, 024h, 003h, 03Ch, 001h, 074h, 04Fh, 0E8h, 0A0h, 003h, 075h, 004h, 083h
    db 0C6h, 002h, 0C3h, 026h, 0ACh, 02Ah, 0E4h, 0D1h, 0E0h, 08Bh, 0D8h, 0D1h, 0E3h, 0D1h, 0E3h, 08Bh
    db 0CBh, 0D1h, 0E1h, 003h, 0D9h, 003h, 0D8h, 081h, 0C3h, 08Eh, 032h, 0F6h, 047h, 018h, 080h, 074h
    db 002h, 046h, 0C3h, 026h, 0ACh, 02Ah, 0E4h, 08Bh, 0F8h, 08Ah, 0A5h, 0ECh, 018h, 002h, 026h, 0EAh
    db 018h
    call far ptr gfx_setPageDirect
    db 08Bh, 04Fh, 008h, 08Bh, 057h, 00Ch, 08Bh, 007h, 08Bh, 05Fh, 004h, 056h
    call far ptr gfx_drawLine
    db 05Eh, 0C3h, 026h, 0ACh, 0D0h, 0EBh, 0D0h, 0EBh, 08Ah, 0CBh, 083h, 0E3h, 01Eh, 08Bh, 09Fh, 0DEh
    db 042h, 0F6h, 0C1h, 020h, 075h, 00Ch, 085h, 01Eh, 006h, 01Ah, 075h, 00Ch, 02Ah, 0E4h, 003h, 0F0h
    db 046h, 0C3h, 085h, 01Eh, 008h, 01Ah, 074h, 0F4h, 0A2h, 067h, 043h, 08Ah, 0D8h, 02Ah, 0FFh, 026h
    db 08Ah, 018h, 080h, 0FBh, 0FFh, 074h, 0E5h, 081h, 03Eh, 0FCh, 012h, 000h, 004h, 075h, 005h, 080h
    db 0FBh, 001h, 075h, 0D8h, 08Bh, 0FBh, 08Ah, 0A5h, 0ECh, 018h, 002h, 026h, 0EAh, 018h
    call far ptr gfx_setPageDirect
    db 0E8h, 0FEh, 005h, 08Eh, 006h, 08Eh, 019h, 0C6h, 006h, 068h, 043h, 000h, 026h, 0ACh, 02Ah, 0E4h
    db 0D1h, 0E0h, 08Bh, 0D8h, 0D1h, 0E3h, 0D1h, 0E3h, 08Bh, 0CBh, 0D1h, 0E1h, 003h, 0D9h, 003h, 0D8h
    db 081h, 0C3h, 08Eh, 032h, 0F6h, 047h, 018h, 040h, 074h, 038h, 08Bh, 047h, 010h, 08Bh, 057h, 012h
    db 08Bh, 04Fh, 014h, 08Bh, 07Fh, 016h, 080h, 03Eh, 068h, 043h, 000h, 075h, 012h, 0A3h, 069h, 043h
    db 089h, 016h, 06Bh, 043h, 089h, 00Eh, 06Dh, 043h, 089h, 03Eh, 06Fh, 043h, 0EBh, 010h, 090h, 0A3h
    db 071h, 043h, 089h, 016h, 073h, 043h, 089h, 00Eh, 075h, 043h, 089h, 03Eh, 077h, 043h, 0FEh, 006h
    db 068h, 043h, 056h, 0E8h, 035h, 000h, 05Eh, 0FEh, 00Eh, 067h, 043h, 075h, 09Fh, 046h, 056h, 080h
    db 03Eh, 068h, 043h, 002h, 07Ch, 014h, 0C6h, 006h, 081h, 043h, 000h, 0BFh, 069h, 043h, 0E8h, 03Dh
    db 0E8h, 08Eh, 006h, 08Eh, 019h, 08Bh, 0DFh, 0E8h, 011h, 000h, 0A1h, 029h, 050h, 08Bh, 00Eh, 02Bh
    db 050h, 0BBh, 0B5h, 04Ch
    call far ptr gfx_dirtyRect
    db 05Eh, 0C3h
sub_21075 endp

sub_211BA proc near
    db 0F6h, 047h, 018h, 080h, 075h, 01Ch, 08Bh, 007h, 0A3h, 0ADh, 04Ch, 08Bh, 047h, 004h, 0A3h, 0B1h
    db 04Ch, 08Bh, 047h, 008h, 0A3h, 0AFh, 04Ch, 08Bh, 047h, 00Ch, 0A3h, 0B3h, 04Ch, 053h, 0E8h, 0D9h
    db 005h, 05Bh, 0F6h, 047h, 018h, 020h, 074h, 011h, 08Bh, 037h, 08Bh, 07Fh, 004h, 08Bh, 057h, 006h
    db 053h, 0E8h, 068h, 005h, 08Eh, 006h, 08Eh, 019h, 05Bh, 0F6h, 047h, 018h, 010h, 074h, 010h, 08Bh
    db 077h, 008h, 08Bh, 07Fh, 00Ch, 08Bh, 057h, 00Eh, 0E8h, 051h, 005h, 08Eh, 006h, 08Eh, 019h, 0C3h
sub_211BA endp

    db 0A1h, 0A6h, 019h, 03Dh, 001h, 000h, 07Ch, 055h, 0A3h, 0D6h, 01Dh, 0A1h, 0A4h, 019h, 0A3h, 0D4h
    db 01Dh, 0A1h, 09Ch, 019h, 0A3h, 00Ch, 01Ah, 0A1h, 09Eh, 019h, 0A3h, 00Eh, 01Ah, 0A1h, 0A0h, 019h
    db 0A3h, 0F0h, 01Bh, 0A1h, 0A2h, 019h, 0A3h, 0F2h, 01Bh, 046h, 026h, 0ACh, 02Ah, 0E4h, 08Bh, 0F8h
    db 08Ah, 0A5h, 0ECh, 018h, 002h, 026h, 0EAh, 018h
    call far ptr gfx_setPageDirect
    db 0E8h, 049h, 0E7h, 02Bh, 0DBh, 0E8h, 0A9h, 0E6h, 0E8h, 065h, 0E7h, 0A1h, 0B8h, 01Fh, 0A3h, 0ADh
    db 04Ch, 0A3h, 0AFh, 04Ch, 0A1h, 09Ch, 021h, 0A3h, 0B1h, 04Ch, 0A3h, 0B3h, 04Ch, 0E8h, 0CFh, 002h
    db 0C3h, 026h, 0ACh, 02Ah, 0E4h, 08Bh, 0F8h, 08Ah, 09Dh, 0B8h, 088h, 02Ah, 0FFh, 0D1h, 0E3h, 08Bh
    db 08Fh, 0D0h, 095h, 08Ah, 09Dh, 0FEh, 087h, 02Ah, 0FFh, 0D1h, 0E3h, 08Bh, 087h, 08Eh, 095h, 0A3h
    db 083h, 043h, 08Ah, 09Dh, 05Eh, 086h, 02Ah, 0FFh, 0D1h, 0E3h, 08Bh, 09Fh, 04Ch, 095h, 056h, 0A1h
    db 083h, 043h, 0F7h, 02Eh, 0F6h, 019h, 08Bh, 0FAh, 08Bh, 0F0h, 0A1h, 0F0h, 019h, 0F7h, 0E9h, 003h
    db 0F0h, 013h, 0FAh, 0A1h, 0EAh, 019h, 0F7h, 0EBh, 003h, 0F0h, 013h, 0FAh, 0D1h, 0E6h, 0D1h, 0D7h
    db 003h, 036h, 09Ch, 019h, 013h, 03Eh, 09Eh, 019h, 089h, 036h, 00Ch, 01Ah, 089h, 03Eh, 00Eh, 01Ah
    db 0A1h, 083h, 043h, 0F7h, 02Eh, 0F8h, 019h, 08Bh, 0FAh, 08Bh, 0F0h, 0A1h, 0F2h, 019h, 0F7h, 0E9h
    db 003h, 0F0h, 013h, 0FAh, 0A1h, 0ECh, 019h, 0F7h, 0EBh, 003h, 0F0h, 013h, 0FAh, 0D1h, 0E6h, 0D1h
    db 0D7h, 003h, 036h, 0A0h, 019h, 013h, 03Eh, 0A2h, 019h, 089h, 036h, 0F0h, 01Bh, 089h, 03Eh, 0F2h
    db 01Bh, 0A1h, 083h, 043h, 0F7h, 02Eh, 0FAh, 019h, 08Bh, 0FAh, 08Bh, 0F0h, 0A1h, 0F4h, 019h, 0F7h
    db 0E9h, 003h, 0F0h, 013h, 0FAh, 0A1h, 0EEh, 019h, 0F7h, 0EBh, 003h, 0F0h, 013h, 0FAh, 0D1h, 0E6h
    db 0D1h, 0D7h, 003h, 036h, 0A4h, 019h, 013h, 03Eh, 0A6h, 019h, 089h, 036h, 0D4h, 01Dh, 089h, 03Eh
    db 0D6h, 01Dh, 0BBh, 008h, 000h, 081h, 0FFh, 088h, 013h, 07Fh, 00Ah, 04Bh, 081h, 0FFh, 0C4h, 009h
    db 07Fh, 003h, 0BBh, 00Fh, 000h, 08Ah, 0A7h, 0ECh, 018h
    call far ptr gfx_setPageDirect
    db 02Bh, 0DBh, 0E8h, 0AEh, 0E5h, 0A1h, 0B8h, 01Fh, 0A3h, 0ADh, 04Ch, 0A3h, 0AFh, 04Ch, 0A1h, 09Ch
    db 021h, 0A3h, 0B1h, 04Ch, 0A3h, 0B3h, 04Ch, 0E8h, 0D7h, 001h, 05Eh, 08Eh, 006h, 08Eh, 019h, 0FEh
    db 00Eh, 082h, 043h, 074h, 003h, 0E9h, 0FBh, 0FEh, 0E8h, 047h, 0E6h, 0C3h, 0E9h, 0F4h, 0FEh, 0E8h
    db 01Ch, 0E6h, 083h, 0C6h, 002h, 026h, 0ACh, 0A2h, 082h, 043h, 080h, 03Eh, 0D8h, 042h, 000h, 075h
    db 0EBh, 026h, 0ACh, 02Ah, 0E4h, 0D1h, 0E0h, 0D1h, 0E0h, 08Bh, 0F8h, 08Bh, 085h, 030h, 028h, 003h
    db 006h, 0A4h, 019h, 0A3h, 0D4h, 01Dh, 08Bh, 085h, 032h, 028h, 013h, 006h, 0A6h, 019h, 03Dh, 001h
    db 000h, 07Ch, 06Dh, 0A3h, 0D6h, 01Dh, 08Bh, 0D0h, 08Bh, 085h, 080h, 023h, 003h, 006h, 09Ch, 019h
    db 0A3h, 00Ch, 01Ah, 08Bh, 085h, 082h, 023h, 013h, 006h, 09Eh, 019h, 0A3h, 00Eh, 01Ah, 08Bh, 085h
    db 0D8h, 025h, 003h, 006h, 0A0h, 019h, 0A3h, 0F0h, 01Bh, 08Bh, 085h, 0DAh, 025h, 013h, 006h, 0A2h
    db 019h, 0A3h, 0F2h, 01Bh, 0BBh, 008h, 000h, 081h, 0FAh, 088h, 013h, 07Fh, 00Ah, 04Bh, 081h, 0FAh
    db 0C4h, 009h, 07Fh, 003h, 0BBh, 00Fh, 000h, 08Ah, 0A7h, 0ECh, 018h
    call far ptr gfx_setPageDirect
    db 056h, 02Bh, 0DBh, 0E8h, 0FDh, 0E4h, 0A1h, 0B8h, 01Fh, 0A3h, 0ADh, 04Ch, 0A3h, 0AFh, 04Ch, 0A1h
    db 09Ch, 021h, 0A3h, 0B1h, 04Ch, 0A3h, 0B3h, 04Ch, 0E8h, 026h, 001h, 05Eh, 08Eh, 006h, 08Eh, 019h
    db 0FEh, 00Eh, 082h, 043h, 074h, 003h, 0E9h, 068h, 0FFh, 0E8h, 096h, 0E5h, 0C3h
sub_21422 proc near
    db 080h, 03Eh, 004h, 01Ah, 000h, 075h, 007h, 026h, 0ADh, 023h, 006h, 006h, 01Ah, 0C3h, 026h, 0ADh
    db 026h, 08Bh, 014h, 083h, 0C6h, 002h, 023h, 006h, 006h, 01Ah, 023h, 016h, 008h, 01Ah, 00Bh, 0C2h
    db 0C3h
sub_21422 endp

    db 000h
sub_21444 proc far
    db 055h, 08Bh, 0ECh, 057h, 056h, 055h, 01Eh, 007h
    call far ptr gfx_getCurPageSeg2
    db 050h, 08Bh, 05Eh, 006h, 08Bh, 007h
    call far ptr gfx_setPage1
    db 08Ah, 067h, 004h
    call far ptr gfx_setPageDirect
    db 0E8h, 0B9h, 002h, 08Bh, 04Eh, 00Eh, 08Bh, 076h, 00Ah, 089h, 00Eh, 02Bh, 050h, 089h, 036h, 029h
    db 050h, 02Bh, 0CEh, 041h, 08Dh, 03Eh, 0B5h, 04Ch, 0D1h, 0E6h, 003h, 0FEh, 08Bh, 046h, 008h, 08Bh
    db 0D1h, 0F3h, 0ABh, 08Bh, 0CAh, 08Dh, 03Eh, 06Dh, 04Eh, 003h, 0FEh, 08Bh, 046h, 00Ch, 0F3h, 0ABh
    db 0BBh, 0B5h, 04Ch, 0A1h, 029h, 050h, 08Bh, 00Eh, 02Bh, 050h
    call far ptr gfx_dirtyRect2
    call far ptr gfx_resetBlitOffset
    db 058h
    call far ptr gfx_getCurPageSeg
    db 05Dh, 05Eh, 05Fh, 08Bh, 0E5h, 05Dh, 0CBh
sub_21444 endp

    db 055h, 08Bh, 0ECh, 057h, 056h, 055h, 01Eh, 007h
    call far ptr gfx_getCurPageSeg2
    db 050h, 08Bh, 05Eh, 006h, 08Bh, 007h
    call far ptr gfx_setPage1
    db 08Ah, 067h, 006h
    call far ptr gfx_setPageDirect
    db 0E8h, 048h, 002h, 08Bh, 04Eh, 00Eh, 08Bh, 076h, 00Ah, 089h, 00Eh, 02Bh, 050h, 089h, 036h, 029h
    db 050h, 02Bh, 0CEh, 041h, 08Dh, 03Eh, 0B5h, 04Ch, 0D1h, 0E6h, 003h, 0FEh, 08Bh, 046h, 008h, 08Bh
    db 0D1h, 0F3h, 0ABh, 08Bh, 0CAh, 08Dh, 03Eh, 06Dh, 04Eh, 003h, 0FEh, 08Bh, 046h, 00Ch, 0F3h, 0ABh
    db 0BBh, 0B5h, 04Ch, 0A1h, 029h, 050h, 08Bh, 00Eh, 02Bh, 050h
    call far ptr gfx_dirtyRect2
    call far ptr gfx_resetBlitOffset
    db 058h
    call far ptr gfx_getCurPageSeg
    db 05Dh, 05Eh, 05Fh, 08Bh, 0E5h, 05Dh, 0C3h
sub_21526 proc far
    db 0E8h, 00Dh, 000h, 0CBh
sub_21526 endp

sub_2152A proc far
    db 055h, 056h, 057h, 006h, 0E8h, 005h, 000h, 007h, 05Fh, 05Eh, 05Dh, 0CBh
sub_2152A endp

sub_21536 proc near
    db 02Bh, 0C0h, 08Eh, 0C0h, 026h, 0FFh, 036h, 000h, 000h, 026h, 0FFh, 036h, 002h, 000h, 08Dh, 006h
    db 063h, 01Eh, 026h, 0A3h, 000h, 000h, 026h, 0C7h, 006h, 002h, 000h, 088h, 00Fh, 01Eh, 007h, 0EBh
    db 067h, 090h, 02Bh, 0C0h, 08Eh, 0C0h, 026h, 08Fh, 006h, 002h, 000h, 026h, 08Fh, 006h, 000h, 000h
    db 01Eh, 007h, 0A1h, 0ADh, 04Ch, 08Bh, 01Eh, 0B1h, 04Ch, 08Bh, 00Eh, 0AFh, 04Ch, 08Bh, 016h, 0B3h
    db 04Ch
    call far ptr gfx_drawLine
    db 0F8h, 0C3h, 02Bh, 0C0h, 08Eh, 0C0h, 026h, 08Fh, 006h, 002h, 000h, 026h, 08Fh, 006h, 000h, 000h
    db 01Eh, 007h, 0F9h, 0C3h, 0F5h, 0D1h, 0DAh, 089h, 016h, 09Fh, 04Ch, 0D1h, 0FAh, 089h, 016h, 0A3h
    db 04Ch, 08Bh, 0D7h, 02Bh, 0D5h, 071h, 006h, 0F5h, 0D1h, 0DAh, 0EBh, 071h, 090h, 0D1h, 0FAh, 0EBh
    db 06Ch, 090h, 0F5h, 0D1h, 0DAh, 0D1h, 03Eh, 09Fh, 04Ch, 0D1h, 03Eh, 0A3h, 04Ch, 0EBh, 05Eh, 090h
    db 0EBh, 0C0h, 08Bh, 00Eh, 0ADh, 04Ch, 08Bh, 016h, 0B1h, 04Ch, 08Bh, 036h, 0AFh, 04Ch, 08Bh, 03Eh
    db 0B3h, 04Ch, 08Bh, 0D9h, 08Bh, 0EAh, 0E8h, 0EDh, 000h, 0A2h, 09Eh, 04Ch, 08Bh, 0DEh, 08Bh, 0EFh
    db 0E8h, 0E3h, 000h, 075h, 01Ah, 080h, 03Eh, 09Eh, 04Ch, 000h, 075h, 003h, 0E9h, 06Dh, 0FFh, 087h
    db 0CEh, 087h, 0D7h, 086h, 006h, 09Eh, 04Ch, 089h, 00Eh, 0ADh, 04Ch, 089h, 016h, 0B1h, 04Ch, 084h
    db 006h, 09Eh, 04Ch, 075h, 0BBh, 08Bh, 0EAh, 08Bh, 0D6h, 02Bh, 0D1h, 070h, 087h, 089h, 016h, 09Fh
    db 04Ch, 0D1h, 0FAh, 089h, 016h, 0A3h, 04Ch, 08Bh, 0D7h, 02Bh, 0D5h, 070h, 095h, 089h, 016h, 0A1h
    db 04Ch, 0D1h, 0FAh, 089h, 016h, 0A5h, 04Ch, 0A8h, 009h, 074h, 038h, 02Bh, 0DBh, 00Bh, 0F6h, 078h
    db 004h, 08Bh, 01Eh, 0A7h, 04Ch, 08Bh, 0C3h, 02Bh, 0C1h, 0F7h, 02Eh, 0A1h, 04Ch, 053h, 08Bh, 0DAh
    db 0F7h, 03Eh, 09Fh, 04Ch, 08Ah, 0DFh, 032h, 01Eh, 0A0h, 04Ch, 079h, 003h, 0F7h, 0DAh, 048h, 02Bh
    db 016h, 0A3h, 04Ch, 032h, 0F7h, 078h, 001h, 040h, 05Bh, 003h, 0C5h, 078h, 00Eh, 03Bh, 006h, 0A9h
    db 04Ch, 07Eh, 039h, 08Bh, 01Eh, 0A9h, 04Ch, 03Bh, 0FBh, 07Fh, 002h, 02Bh, 0DBh, 08Bh, 0C3h, 02Bh
    db 0C5h, 0F7h, 02Eh, 09Fh, 04Ch, 053h, 08Bh, 0DAh, 0F7h, 03Eh, 0A1h, 04Ch, 08Ah, 0DFh, 032h, 01Eh
    db 0A2h, 04Ch, 079h, 003h, 0F7h, 0DAh, 048h, 02Bh, 016h, 0A5h, 04Ch, 032h, 0F7h, 078h, 001h, 040h
    db 05Bh, 003h, 0C1h, 078h, 018h, 03Bh, 006h, 0A7h, 04Ch, 07Fh, 012h, 093h, 080h, 03Eh, 09Eh, 04Ch
    db 000h, 075h, 00Dh, 0A3h, 0B3h, 04Ch, 089h, 01Eh, 0AFh, 04Ch, 0E9h, 0AFh, 0FEh, 0E9h, 0D2h, 0FEh
    db 0A3h, 0B1h, 04Ch, 089h, 01Eh, 0ADh, 04Ch, 087h, 0CEh, 087h, 0EFh, 0A0h, 09Eh, 04Ch, 0C6h, 006h
    db 09Eh, 04Ch, 000h, 0E9h, 061h, 0FFh
sub_21536 endp

sub_216C2 proc near
    db 0B0h, 00Fh, 00Bh, 0DBh, 078h, 002h, 024h, 0F7h, 03Bh, 01Eh, 0A7h, 04Ch, 07Fh, 002h, 024h, 0FEh
    db 00Bh, 0EDh, 078h, 002h, 024h, 0FBh, 03Bh, 02Eh, 0A9h, 04Ch, 07Fh, 002h, 024h, 0FDh, 00Ah, 0C0h
    db 0C3h
sub_216C2 endp

    db 055h, 08Bh, 0ECh, 081h, 07Eh, 002h, 0F4h, 01Dh, 0A1h, 0A1h, 04Ch, 074h, 003h, 0A1h, 09Fh, 04Ch
    db 033h, 0D0h, 0B8h, 000h, 07Fh, 079h, 002h, 0F7h, 0D8h, 083h, 046h, 002h, 004h, 02Bh, 0D2h, 05Dh
    db 0CFh
sub_21704 proc far
    db 057h, 056h, 055h, 0A1h, 029h, 050h, 08Bh, 00Eh, 02Bh, 050h, 0BBh, 0B5h, 04Ch
    call far ptr gfx_dirtyRect
    db 05Dh, 05Eh, 05Fh, 0CBh
sub_21704 endp

sub_2171A proc far
    db 057h, 0E8h, 002h, 000h, 05Fh, 0CBh
sub_2171A endp

sub_21720 proc near
    db 08Bh, 03Eh, 029h, 050h, 00Bh, 0FFh, 078h, 02Dh, 0B8h, 08Bh, 022h, 08Eh, 0C0h, 08Bh, 00Eh, 02Bh
    db 050h, 041h, 02Bh, 0CFh, 0D1h, 0E7h, 08Bh, 0D9h, 08Bh, 0D7h, 081h, 0C7h, 0B5h, 04Ch, 0B8h, 0FFh
    db 0FFh, 0F3h, 0ABh, 0A3h, 029h, 050h, 08Bh, 0CBh, 08Bh, 0FAh, 081h, 0C7h, 06Dh, 04Eh, 02Bh, 0C0h
    db 0F3h, 0ABh, 0A3h, 02Bh, 050h, 0C3h
sub_21720 endp

sub_21756 proc near
    db 0B8h, 08Bh, 022h, 08Eh, 0C0h, 08Bh, 0CFh, 00Bh, 0F6h, 08Dh, 03Eh, 0B5h, 04Ch, 074h, 00Ah, 03Bh
    db 036h, 0A7h, 04Ch, 075h, 039h, 08Dh, 03Eh, 06Dh, 04Eh, 03Bh, 0CAh, 07Dh, 002h, 087h, 0CAh, 00Bh
    db 0D2h, 079h, 002h, 02Bh, 0D2h, 03Bh, 00Eh, 0A9h, 04Ch, 07Eh, 004h, 08Bh, 00Eh, 0A9h, 04Ch, 03Bh
    db 00Eh, 02Bh, 050h, 076h, 004h, 089h, 00Eh, 02Bh, 050h, 03Bh, 016h, 029h, 050h, 073h, 004h, 089h
    db 016h, 029h, 050h, 003h, 0FAh, 003h, 0FAh, 02Bh, 0CAh, 041h, 08Bh, 0C6h, 0F3h, 0ABh, 0C3h
sub_21756 endp

    db 02Bh, 0F6h, 00Bh, 0DBh, 078h, 0ABh, 08Bh, 036h, 0A7h, 04Ch, 03Bh, 0DEh, 07Fh, 0A3h, 0C3h
sub_217B4 proc near
    db 0A1h, 0AFh, 04Ch, 03Bh, 006h, 0ADh, 04Ch, 073h, 019h, 08Bh, 01Eh, 0ADh, 04Ch, 089h, 01Eh, 0AFh
    db 04Ch, 0A3h, 0ADh, 04Ch, 0A1h, 0B3h, 04Ch, 08Bh, 01Eh, 0B1h, 04Ch, 089h, 01Eh, 0B3h, 04Ch, 0A3h
    db 0B1h, 04Ch, 08Bh, 01Eh, 0AFh, 04Ch, 02Bh, 01Eh, 0ADh, 04Ch, 089h, 01Eh, 025h, 050h, 0A1h, 0B3h
    db 04Ch, 08Bh, 0D0h, 08Bh, 00Eh, 0B1h, 04Ch, 02Bh, 0C1h, 0BDh, 002h, 000h, 079h, 006h, 087h, 0CAh
    db 0F7h, 0DDh, 0F7h, 0D8h, 0A3h, 027h, 050h, 03Bh, 016h, 02Bh, 050h, 076h, 004h, 089h, 016h, 02Bh
    db 050h, 03Bh, 00Eh, 029h, 050h, 073h, 004h, 089h, 00Eh, 029h, 050h, 03Bh, 0C3h, 073h, 04Bh, 08Bh
    db 03Eh, 0B1h, 04Ch, 0D1h, 0E7h, 0A1h, 0ADh, 04Ch, 08Bh, 016h, 025h, 050h, 08Bh, 0CAh, 08Bh, 0D9h
    db 043h, 0D1h, 0EBh, 0F7h, 0DBh, 08Bh, 036h, 027h, 050h, 0EBh, 010h, 090h, 03Bh, 085h, 06Dh, 04Eh
    db 076h, 004h, 089h, 085h, 06Dh, 04Eh, 040h, 02Bh, 0DAh, 003h, 0FDh, 03Bh, 085h, 0B5h, 04Ch, 073h
    db 004h, 089h, 085h, 0B5h, 04Ch, 049h, 078h, 007h, 003h, 0DEh, 079h, 0E0h, 040h, 0EBh, 0F6h, 03Bh
    db 085h, 06Dh, 04Eh, 076h, 004h, 089h, 085h, 06Dh, 04Eh, 0C3h, 08Bh, 03Eh, 0B1h, 04Ch, 0D1h, 0E7h
    db 0A1h, 0ADh, 04Ch, 08Bh, 016h, 027h, 050h, 08Bh, 0CAh, 08Bh, 0D9h, 043h, 0D1h, 0EBh, 0F7h, 0DBh
    db 08Bh, 036h, 025h, 050h, 03Bh, 085h, 0B5h, 04Ch, 073h, 004h, 089h, 085h, 0B5h, 04Ch, 03Bh, 085h
    db 06Dh, 04Eh, 076h, 004h, 089h, 085h, 06Dh, 04Eh, 049h, 078h, 00Bh, 003h, 0FDh, 003h, 0DEh, 078h
    db 0E3h, 02Bh, 0DAh, 040h, 0EBh, 0DEh, 0C3h
sub_217B4 endp

    db 000h
sub_2189C proc far
    db 006h, 056h, 057h, 055h, 0E8h, 005h, 000h, 05Dh, 05Fh, 05Eh, 007h, 0CBh
sub_2189C endp

sub_218A8 proc near
    db 02Bh, 0C0h, 08Eh, 0C0h, 026h, 0FFh, 036h, 000h, 000h, 026h, 0FFh, 036h, 002h, 000h, 08Dh, 006h
    db 0D8h, 021h, 026h, 0A3h, 000h, 000h, 026h, 0C7h, 006h, 002h, 000h, 088h, 00Fh, 01Eh, 007h, 0EBh
    db 04Eh, 090h, 02Bh, 0C0h, 08Eh, 0C0h, 026h, 08Fh, 006h, 002h, 000h, 026h, 08Fh, 006h, 000h, 000h
    db 01Eh, 007h, 0C3h, 022h, 006h, 02Eh, 050h, 0A8h, 006h, 075h, 0E7h, 08Bh, 0D9h, 0E9h, 032h, 001h
    db 0E9h, 05Ah, 001h, 0F5h, 0D1h, 0DAh, 089h, 016h, 02Fh, 050h, 0D1h, 0FAh, 089h, 016h, 033h, 050h
    db 08Bh, 0D7h, 02Bh, 0D5h, 071h, 006h, 0F5h, 0D1h, 0DAh, 0EBh, 06Ch, 090h, 0D1h, 0FAh, 0EBh, 067h
    db 090h, 0F5h, 0D1h, 0DAh, 0D1h, 03Eh, 02Fh, 050h, 0D1h, 03Eh, 033h, 050h, 0EBh, 059h, 090h, 08Bh
    db 00Eh, 0ADh, 04Ch, 08Bh, 016h, 0B1h, 04Ch, 08Bh, 036h, 0AFh, 04Ch, 08Bh, 03Eh, 0B3h, 04Ch, 08Bh
    db 0D9h, 08Bh, 0EAh, 0E8h, 094h, 0FDh, 0A2h, 02Eh, 050h, 08Bh, 0DEh, 08Bh, 0EFh, 0E8h, 08Ah, 0FDh
    db 075h, 017h, 080h, 03Eh, 02Eh, 050h, 000h, 074h, 0A7h, 087h, 0CEh, 087h, 0D7h, 086h, 006h, 02Eh
    db 050h, 089h, 00Eh, 0ADh, 04Ch, 089h, 016h, 0B1h, 04Ch, 08Bh, 0EAh, 084h, 006h, 02Eh, 050h, 075h
    db 082h, 08Bh, 0D6h, 02Bh, 0D1h, 070h, 08Ch, 089h, 016h, 02Fh, 050h, 0D1h, 0FAh, 089h, 016h, 033h
    db 050h, 08Bh, 0D7h, 02Bh, 0D5h, 070h, 09Ah, 089h, 016h, 031h, 050h, 0D1h, 0FAh, 089h, 016h, 035h
    db 050h, 0A8h, 009h, 074h, 03Ch, 02Bh, 0DBh, 00Bh, 0F6h, 078h, 004h, 08Bh, 01Eh, 0A7h, 04Ch, 08Bh
    db 0C3h, 02Bh, 0C1h, 0F7h, 02Eh, 031h, 050h, 053h, 08Bh, 0DAh, 0F7h, 03Eh, 02Fh, 050h, 00Bh, 0C0h
    db 00Bh, 0C0h, 08Ah, 0DFh, 032h, 01Eh, 030h, 050h, 079h, 003h, 0F7h, 0DAh, 048h, 02Bh, 016h, 033h
    db 050h, 032h, 0F7h, 078h, 001h, 040h, 05Bh, 003h, 0C5h, 078h, 00Eh, 03Bh, 006h, 0A9h, 04Ch, 07Eh
    db 03Dh, 08Bh, 01Eh, 0A9h, 04Ch, 03Bh, 0FBh, 07Fh, 002h, 02Bh, 0DBh, 08Bh, 0C3h, 02Bh, 0C5h, 0F7h
    db 02Eh, 02Fh, 050h, 053h, 08Bh, 0DAh, 0F7h, 03Eh, 031h, 050h, 00Bh, 0C0h, 00Bh, 0C0h, 08Ah, 0DFh
    db 032h, 01Eh, 032h, 050h, 079h, 003h, 0F7h, 0DAh, 048h, 02Bh, 016h, 035h, 050h, 032h, 0F7h, 078h
    db 001h, 040h, 05Bh, 003h, 0C1h, 093h, 078h, 02Ah, 03Bh, 01Eh, 0A7h, 04Ch, 07Fh, 024h, 050h, 053h
    db 051h, 056h, 057h, 08Bh, 0D7h, 08Bh, 0F8h, 08Bh, 0F3h, 0E8h, 052h, 0FDh, 05Fh, 05Eh, 059h, 05Bh
    db 058h, 080h, 03Eh, 02Eh, 050h, 000h, 075h, 01Fh, 0A3h, 0B3h, 04Ch, 089h, 01Eh, 0AFh, 04Ch, 0EBh
    db 02Ch, 090h, 08Bh, 0D5h, 02Bh, 0C0h, 08Eh, 0C0h, 026h, 08Fh, 006h, 002h, 000h, 026h, 08Fh, 006h
    db 000h, 000h, 01Eh, 007h, 0E9h, 076h, 0FDh, 0A3h, 0B1h, 04Ch, 089h, 01Eh, 0ADh, 04Ch, 087h, 0CEh
    db 087h, 0EFh, 0A0h, 02Eh, 050h, 0C6h, 006h, 02Eh, 050h, 000h, 0E9h, 034h, 0FFh, 02Bh, 0C0h, 08Eh
    db 0C0h, 026h, 08Fh, 006h, 002h, 000h, 026h, 08Fh, 006h, 000h, 000h, 01Eh, 007h, 0E9h, 05Ch, 0FDh
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
