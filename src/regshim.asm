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
PUBLIC _gfx_setCurPageSeg
PUBLIC _gfx_getCurPageSeg
PUBLIC _gfx_setDrawColor
PUBLIC _gfx_dirtyRect2
PUBLIC _gfx_drawLine
PUBLIC _gfx_blitCore
PUBLIC _gfx_fillDirty
PUBLIC _gfx_blitTransparent
PUBLIC _gfx_blitVariant
PUBLIC _gfx_copyBlock
PUBLIC _gfx_drawStringUnclipped
PUBLIC _gfx_complexRender

EXTRN _gfx_getRowOffset_impl:NEAR
EXTRN _gfx_getPageSeg_impl:NEAR
EXTRN _gfx_fillRow_impl:NEAR
EXTRN _gfx_copyRow_impl:NEAR
EXTRN _gfx_clearPage_impl:NEAR
EXTRN _gfx_setPage1_impl:NEAR
EXTRN _gfx_setCurPageSeg_impl:NEAR
EXTRN _gfx_getCurPageSeg_impl:NEAR
EXTRN _gfx_setFillColor_impl:NEAR
EXTRN _gfx_dirtyRectFill_impl:NEAR
EXTRN _gfx_drawLine_impl:NEAR
EXTRN _gfx_blitCore_impl:NEAR
EXTRN _gfx_drawStringClipped_impl:NEAR
EXTRN _gfx_complexRender_impl:NEAR

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
_gfx_getCurPageSeg proc far
    push es
    call _gfx_getCurPageSeg_impl   ; returns AX = curPageSeg
    pop es
    retf
_gfx_getCurPageSeg endp

; Slot 0x0f — AX = segment; curPageSeg = AX (clearRect's restore; a SETTER).
_gfx_setCurPageSeg proc far
    push ax                         ; arg: segment
    call _gfx_setCurPageSeg_impl
    add sp, 2
    retf
_gfx_setCurPageSeg endp

; Slot 0x20 — AH = fill colour; store it for the next clear/fill. Preserve ES.
_gfx_setDrawColor proc far
    push es                         ; preserve caller's ES (clearRect's stosw seg)
    mov al, ah                      ; arg: colour (AH -> low byte)
    xor ah, ah
    push ax
    call _gfx_setFillColor_impl
    add sp, 2
    pop es
    retf
_gfx_setDrawColor endp

; Slot 0x25/0x28 — BX = &dirtyMinBuf (caller DS near), AX = yMin, CX = yMax.
; cdecl args right-to-left: yMax, yMin, minBufOff.
; Preserve ES: MGRAPHIC's slot is hand-asm that leaves ES untouched, but the C
; body loads ES (gfx_getState + the per-row page writes leave ES=curPageSeg).
; The 3D polygon rasterizer (egseg1.asm renderPrimitiveCommand loc_1929) calls
; this as its last act and then RETs into renderPrimitiveList, which reads the
; next primitive's command bytes via ES:SI (the model far ptr). If ES is left
; pointing at the page buffer, the next vertex-count byte is read from the wrong
; segment -> garbage count -> the loc_18AB edge loop runs on garbage and the
; flight hangs from frame 2 on. Preserving ES keeps the model segment intact.
_gfx_dirtyRect2 proc far
    push es                         ; preserve caller's ES (model far-ptr seg)
    push cx                         ; arg3: yMax
    push ax                         ; arg2: yMin
    push bx                         ; arg1: minBufOff
    call _gfx_dirtyRectFill_impl
    add sp, 6
    pop es
    retf
_gfx_dirtyRect2 endp

; Slot 0x1f — AX=x1, BX=y1, CX=x2, DX=y2; draw a line into the current page
; with the stored fill colour. MGRAPHIC's slot 0x1f is register-called (the
; egame 3D/HUD asm in egseg1.asm loc_1CD8 loads AX/BX/CX/DX then calls with no
; stack args), so the C body cannot read these as cdecl args directly. Marshal
; them onto the stack (right-to-left: y2, x2, y1, x1) and call the C impl.
; MGRAPHIC's slot preserves DS/ES across the call; mirror that.
_gfx_drawLine proc far
    push ds
    push es
    push dx                         ; arg4: y2
    push cx                         ; arg3: x2
    push bx                         ; arg2: y1
    push ax                         ; arg1: x1
    call _gfx_drawLine_impl
    add sp, 8
    pop es
    pop ds
    retf
_gfx_drawLine endp

; Slot 0x12/0x4a — BP = near pointer (caller DS) to an 8-word sprite param block.
; MGRAPHIC's slot 0x12 is register-called (egame loads BP=offset block then
; `call far ptr gfx_blitCore`), so the C body cannot read the block as a cdecl
; arg directly — push BP as the single cdecl arg. MGRAPHIC's slot wraps its body
; in push ds/es .. pop es/ds, preserving both across the blit; mirror that.
_gfx_blitCore proc far
    push ds
    push es
    push bp                         ; arg1: block pointer (caller DS near)
    call _gfx_blitCore_impl
    add sp, 2
    pop es
    pop ds
    retf
_gfx_blitCore endp

; --- Register-called glyph slots (0x01/0x02/0x03/0x04/0x06) ---
; The egame HUD/label code (egseg2.asm) sets BP = param block (kept across the
; loop) and BX = string, then `call far ptr gfx_xxx`. The MGRAPHIC originals
; enter the shared glyph engine with BP/BX already in registers. Marshal them
; into gfx_drawStringClipped_impl(params, string, mode) — args right-to-left:
; mode, string, params. `mode` selects clip stages: 1=horizontal, 2=vertical,
; 3=both, 0=none. .8086 has no `push imm`, so stage mode through AX. MGRAPHIC's
; engine brackets its body with push ds/es .. pop es/ds; mirror that (the label
; loop continues to read its model via the caller's ES/DS after the call).

_gfx_glyphCall macro modeval
    push ds
    push es
    mov ax, modeval
    push ax                         ; arg3: mode
    push bx                         ; arg2: string
    push bp                         ; arg1: param block (caller DS near)
    call _gfx_drawStringClipped_impl
    add sp, 6
    pop es
    pop ds
    retf
endm

_gfx_fillDirty proc far             ; slot 0x01 — vertical clip
    _gfx_glyphCall 2
_gfx_fillDirty endp

_gfx_blitTransparent proc far       ; slot 0x02 — horizontal clip (right edge)
    _gfx_glyphCall 1
_gfx_blitTransparent endp

_gfx_blitVariant proc far           ; slot 0x03 — horizontal clip (left edge)
    _gfx_glyphCall 1
_gfx_blitVariant endp

_gfx_copyBlock proc far             ; slot 0x04 — core, no clip
    _gfx_glyphCall 0
_gfx_copyBlock endp

_gfx_drawStringUnclipped proc far   ; slot 0x06 — full clip chain
    _gfx_glyphCall 3
_gfx_drawStringUnclipped endp

; Slot 0x0b — BX=row, DX=orientation, CX=mode-gate, SI=ladder variant; the HUD
; pitch-ladder renderer (egseg2.asm drawInstrumentGauges loads BX/DX/CX/SI then
; `call far ptr gfx_complexRender`). MGRAPHIC's slot is register-called and reads
; its geometry table via a relocated `mov ds,<dataseg>`; our C body carries the
; baked table, so just marshal the registers into the cdecl impl. Args pushed
; right-to-left: si, cx, dx, bx. MGRAPHIC brackets its body with push ds/es ..
; pop es/ds (it sets DS=dataseg, ES=curPageSeg internally); mirror that so the
; caller's DS/ES survive (drawInstrumentGauges keeps BP/model regs across calls).
_gfx_complexRender proc far
    push ds
    push es
    push si                         ; arg4: si
    push cx                         ; arg3: cx
    push dx                         ; arg2: dx
    push bx                         ; arg1: bx
    call _gfx_complexRender_impl
    add sp, 8
    pop es
    pop ds
    retf
_gfx_complexRender endp

END
