.8086
DOSSEG
.MODEL SMALL

; regshim.asm — register-call ABI glue for f15.exe's virtual gfx overlay.
;
; A handful of original MGRAPHIC slots take their arguments in registers, not
; on the stack (the ASM pic renderer in stcode.asm/pic_showpicfile.inc calls
; them as `mov di,..; call far ptr _gfx_xxx`). MSC 5.1 has no inline asm and no
; calling convention that receives args in DI/SI/BP/BX, so these tiny FAR shims
; bridge the gap: capture the register args, push them as cdecl stack args, and
; call the C body (gfx_*_impl in gfx_impl.c). DS is the caller's DGROUP on entry
; and stays unchanged, so the C bodies read caller buffers via near pointers.
;
; The gfx slot table (gfxSlotTable / slot_offsets[]) points at these shims, so
; setupOverlaySlots patches the child's JMP FAR slots to land here.

PUBLIC _gfx_getRowOffset
PUBLIC _gfx_getPageSeg
PUBLIC _gfx_fillRow
PUBLIC _gfx_copyRow
PUBLIC _gfx_clearPage
PUBLIC _gfx_setPage1
PUBLIC _gfx_getCurPageSeg
PUBLIC _gfx_getCurPageSeg2
PUBLIC _gfx_setPageDirect
PUBLIC _gfx_dirtyRect2

EXTRN _gfx_getRowOffset_impl:NEAR
EXTRN _gfx_getPageSeg_impl:NEAR
EXTRN _gfx_fillRow_impl:NEAR
EXTRN _gfx_copyRow_impl:NEAR
EXTRN _gfx_clearPage_impl:NEAR
EXTRN _gfx_setPage1_impl:NEAR
EXTRN _gfx_setCurPageSeg_impl:NEAR
EXTRN _gfx_getCurPageSeg2_impl:NEAR
EXTRN _gfx_setFillColor_impl:NEAR
EXTRN _gfx_dirtyRectFill_impl:NEAR

.CODE

; Slot 0x3a — DI = y; returns row byte offset in AX.
; MUST also leave DI = rowOffset on return: decodePicRow (pic_lzw.inc) does
; `shr di,1; jnz` on entry to decide whether to (re)initialise the LZW
; dictionary — it expects DI = rowOffset (0 on the first row, >=320 after), not
; the row number. Leaving DI = y would re-init the dict on row 1 and corrupt
; the whole decode. MGRAPHIC's getRowOffset leaves DI = rowOffset; mirror that.
_gfx_getRowOffset proc far
    push di                         ; arg: y
    call _gfx_getRowOffset_impl
    add sp, 2
    mov di, ax                      ; leave DI = rowOffset for decodePicRow
    retf
_gfx_getRowOffset endp

; Slot 0x38 — SI = page; selects current page, returns its segment in AX.
; MUST also leave ES = that segment: the original MGRAPHIC slot 0x38 does
; `mov es,[cs:si*2+pageSegTable]`, and showPicFile (pic_showpicfile.inc) relies
; on ES being the target page when the following _gfx_clearPage captures it.
_gfx_getPageSeg proc far
    push si                         ; arg: page
    call _gfx_getPageSeg_impl
    add sp, 2
    mov es, ax                      ; leave ES = page segment (matches MGRAPHIC)
    retf
_gfx_getPageSeg endp

; Slot 0x3b — ES = target segment (set by the caller: decodePic does `mov es,ax`,
; showPicFile via _gfx_getPageSeg above). Capture ES as the current page and
; clear it. fillRow/fillRow2 then write to that same captured segment, so the
; decoded rows land in the caller's buffer even when ES is later clobbered.
_gfx_clearPage proc far
    push es                         ; arg: target segment
    call _gfx_clearPage_impl
    add sp, 2
    retf
_gfx_clearPage endp

; Slot 0x33 — DI = rowOffset, BP = srcBuf, BX = rowNum.
; cdecl args pushed right-to-left: rowNum, srcBuf, rowOffset.
_gfx_fillRow proc far
    push bx                         ; arg3: rowNum
    push bp                         ; arg2: srcBuf
    push di                         ; arg1: rowOffset
    call _gfx_fillRow_impl
    add sp, 6
    retf
_gfx_fillRow endp

; Slot 0x35 — DI = rowOffset.
_gfx_copyRow proc far
    push di                         ; arg: rowOffset
    call _gfx_copyRow_impl
    add sp, 2
    retf
_gfx_copyRow endp

; --- clearRect chain (gfx_clearrect.inc) — all register-called ---
;
; clearRect does `push DS; pop ES` then far-calls slots 0x10, 0x0d, 0x20 BEFORE
; building its dirty-rect buffers with `rep stosw` (writing to ES:DI). The
; original MGRAPHIC slots preserve ES across those calls; our C bodies call
; gfx_getState(), which loads ES via MK_FP, so they WOULD clobber ES and the
; stosw fills would land in the wrong segment (leaving the buffers unfilled, so
; slot 0x28 clears nothing). These three shims therefore save/restore ES.

; Slot 0x0d — AX = page index; curPageSeg = pageSegs[AX].
; MUST preserve BX as well as ES: clearRect loads BX=pageNum, calls this, then
; reads `mov AH,[BX+6]` (the fill colour) — so BX has to survive. MGRAPHIC's
; slot 0x0d does push bx/pop bx; our C body clobbers BX, so save it here.
_gfx_setPage1 proc far
    push es                         ; preserve caller's ES (clearRect's stosw seg)
    push bx                         ; preserve BX (clearRect reads [BX+6] after)
    push ax                         ; arg: page index
    call _gfx_setPage1_impl
    add sp, 2
    pop bx
    pop es
    retf
_gfx_setPage1 endp

; Slot 0x10 — returns curPageSeg in AX (clearRect saves it). Preserve ES.
_gfx_getCurPageSeg2 proc far
    push es
    call _gfx_getCurPageSeg2_impl   ; returns AX = curPageSeg
    pop es
    retf
_gfx_getCurPageSeg2 endp

; Slot 0x0f — AX = segment; curPageSeg = AX (clearRect's restore; a SETTER).
_gfx_getCurPageSeg proc far
    push ax                         ; arg: segment
    call _gfx_setCurPageSeg_impl
    add sp, 2
    retf
_gfx_getCurPageSeg endp

; Slot 0x20 — AH = fill colour; store it for the next clear/fill. Preserve ES.
_gfx_setPageDirect proc far
    push es                         ; preserve caller's ES (clearRect's stosw seg)
    mov al, ah                      ; arg: colour (AH -> low byte)
    xor ah, ah
    push ax
    call _gfx_setFillColor_impl
    add sp, 2
    pop es
    retf
_gfx_setPageDirect endp

; Slot 0x25/0x28 — BX = &dirtyMinBuf (caller DS near), AX = yMin, CX = yMax.
; cdecl args right-to-left: yMax, yMin, minBufOff.
_gfx_dirtyRect2 proc far
    push cx                         ; arg3: yMax
    push ax                         ; arg2: yMin
    push bx                         ; arg1: minBufOff
    call _gfx_dirtyRectFill_impl
    add sp, 6
    retf
_gfx_dirtyRect2 endp

END
