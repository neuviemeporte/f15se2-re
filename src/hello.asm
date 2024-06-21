; DOSSEG
; .MODEL SMALL
; .DATA
;     MSG     DB  "Hello, asm World!", 0Dh, 0Ah, '$'
; .CODE

; _main proc
;     mov ax, @data
;     mov ds,ax
;     MOV     AH, 09h
;     MOV     DX, OFFSET MSG
;     INT     21h
;     MOV     AH, 4Ch
;     INT     21h
; _main endp

; END _main

DOSSEG
.MODEL SMALL
.DATA
    MSG     DB  "Hello, crt World!", 0Dh, 0Ah, '$'
.CODE

;EXTRN __astart:PROC,_fopen:PROC,_fclose:PROC
EXTRN __astart:PROC,_fclose:PROC,_fopen:PROC
;,_fread:PROC,_fwrite:PROC,_lseek:PROC,_strcmp:PROC,_getche:PROC,_getch:PROC,_movedata:PROC,_inp:PROC,_putch:PROC,_abs:PROC,_srand:PROC,_rand:PROC
PUBLIC _main

_main proc
    ; mov ax, @data
    ; mov ds,ax
    MOV     AH, 09h
    MOV     DX, OFFSET MSG
    INT     21h
    MOV     AH, 4Ch
    INT     21h
    call _fclose
    call _fopen
    ; call _fread
    ; call _fwrite
    ; call _lseek
    ; call _strcmp
    ; call _getche
    ; call _getch
    ; call _movedata
    ; call _inp
    ; call _putch
    ; call _abs
    ; call _srand
    ; call _rand
_main endp

END __astart