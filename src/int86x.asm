;	Static Name Aliases
;
	TITLE   source.c
	NAME    source

	.8087
_TEXT	SEGMENT  WORD PUBLIC 'CODE'
_TEXT	ENDS
_DATA	SEGMENT  WORD PUBLIC 'DATA'
_DATA	ENDS
CONST	SEGMENT  WORD PUBLIC 'CONST'
CONST	ENDS
_BSS	SEGMENT  WORD PUBLIC 'BSS'
_BSS	ENDS
DGROUP	GROUP	CONST, _BSS, _DATA
	ASSUME  CS: _TEXT, DS: DGROUP, SS: DGROUP
PUBLIC  _txt
EXTRN	__acrtused:ABS
EXTRN	__chkstk:NEAR
EXTRN	_printf:NEAR
EXTRN	_int86x:NEAR
EXTRN	_segread:NEAR
_DATA      SEGMENT
$SG248	DB	'Test$',  00H
$SG255	DB	'Return value from int86x(): %d',  0aH,  00H
_txt	DW	DGROUP:$SG248
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 6
	PUBLIC	_main
_main	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,38
	call	__chkstk
;	seg = -38
;	in = -14
;	out = -28
;	ret = -30
; Line 10
	mov	BYTE PTR [bp-13],9
; Line 11
	mov	WORD PTR [bp-8],OFFSET DGROUP:_txt
; Line 12
	lea	ax,WORD PTR [bp-38]	;seg
	push	ax
	call	_segread
	add	sp,2
; Line 13
	lea	ax,WORD PTR [bp-38]	;seg
	push	ax
	lea	ax,WORD PTR [bp-28]	;out
	push	ax
	lea	ax,WORD PTR [bp-14]	;in
	push	ax
	mov	ax,33
	push	ax
	call	_int86x
	add	sp,8
	mov	WORD PTR [bp-30],ax	;ret
; Line 14
	push	ax
	mov	ax,OFFSET DGROUP:$SG255
	push	ax
	call	_printf
; Line 15
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
	nop	

_main	ENDP
_TEXT	ENDS
END
