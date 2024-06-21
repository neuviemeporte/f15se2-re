;TITLE hello
DOSSEG
.MODEL SMALL
;.STACK 100h
; DGROUP group trampoline
;     ASSUME DS:DGROUP

; ivt segment at 0h
; org 0
; begin label far
; ivt ends

;trampoline segment public 'DATA'


.CODE
_hello proc near
; mov ax, @DATA
; mov ds , ax
; mov bx , 1
; mov cx , lmessage
; mov dx , OFFSET message
; mov ah , 40h
; int 21h
; ret
mov	word ptr needSplash+2, 0
_hello endp
; mov ax , 4C00h
; int 21h

.DATA
needSplash dd ?

END
