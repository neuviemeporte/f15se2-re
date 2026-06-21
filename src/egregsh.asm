.8086
DOSSEG
.MODEL SMALL

; egregsh.asm — cdecl -> register marshaling for register-called MGRAPHIC slots,
; for the standalone noasm_build/egame.exe (which runs under the ORIGINAL
; MGRAPHIC.EXE overlay, whose slots take args in registers).
;
; This is the INVERSE of regshim.asm. regshim bridges register-call -> cdecl so
; the overlay's *C* reimplementation (gfx_impl.c) can be reached from the
; register-passing game asm. Here the overlay is the real MGRAPHIC binary
; (register-called slots), and the caller is the C renderer (eghudr/eghudm/
; egtacmap), which only knows cdecl. The verified ASM build sidesteps this: its
; egslots.asm slot trampolines are bare `JMP FAR` thunks, so the register args
; the hand-asm (egseg1/egseg2) sets up pass straight through. The C trampolines
; in slottram.c instead push cdecl stack args, which a register-called slot never
; reads — drawing lines from garbage AX/BX/CX/DX. These shims marshal the cdecl
; args into the registers each slot expects, then far-call the patched overlay
; slot via the gfxFarTableExported[] entry setupOverlaySlots filled in.

PUBLIC _gfx_drawLine
PUBLIC _gfx_setCurPageSegReg
PUBLIC _gfx_dirtyRect
PUBLIC _gfx_drawGlyphStr

EXTRN _gfxFarTableExported:WORD

.CODE

; Clipped glyph-string draw. MGRAPHIC's glyph engine lives in the register-called
; slots 0x01-0x06 (the misnamed gfx_fillDirty/blitTransparent/blitVariant/
; copyBlock/drawStringUnclipped): BP = param-block (g_tapeTextN descriptor:
; page/colour/x/y/font + clip rect), BX = string. The slot index selects which
; clip-stage chain runs (vertical clip for the speed/altitude tape, horizontal
; for the compass strip, etc.), so the HUD passes the exact slot the original
; egseg2.asm used per call site. DS stays the caller's DGROUP (descriptor +
; string are near DGROUP offsets, as in the original). cdecl args (far):
;   [bp+6]=descriptor (-> BP)  [bp+8]=string (-> BX)  [bp+10]=slot index
_gfx_drawGlyphStr proc far
    push bp
    mov bp, sp
    push si
    push di
    push ds
    push es
    mov bx, [bp+8]          ; string -> BX
    mov ax, [bp+10]         ; slot index
    add ax, ax
    add ax, ax              ; * 4 (dword table entries)
    mov si, ax
    mov bp, [bp+6]          ; descriptor -> BP (frame args already read)
    call dword ptr [_gfxFarTableExported + si]
    pop es
    pop ds
    pop di
    pop si
    pop bp
    retf
_gfx_drawGlyphStr endp

; Slot 0x0f (gfxFarTableExported[15]) — AX = segment; set the current page seg.
; (slottram.c's gfx_setCurPageSeg is void/register-broken; this is the cdecl
; entry the C renderer's fillSpanRect uses to save/restore curPageSeg.)
; cdecl arg (far): [bp+6] = seg
_gfx_setCurPageSegReg proc far
    push bp
    mov bp, sp
    push si
    push di
    push ds
    push es
    mov ax, [bp+6]
    call dword ptr [_gfxFarTableExported + 15*4]
    pop es
    pop ds
    pop di
    pop si
    pop bp
    retf
_gfx_setCurPageSegReg endp

; Slot 0x1f (gfxFarTableExported[31]) — AX=x1, BX=y1, CX=x2, DX=y2; draw a line
; into the current page with the stored fill colour. cdecl args (far):
;   [bp+6]=x1 [bp+8]=y1 [bp+10]=x2 [bp+12]=y2
_gfx_drawLine proc far
    push bp
    mov bp, sp
    push si
    push di
    push ds
    push es
    mov ax, [bp+6]
    mov bx, [bp+8]
    mov cx, [bp+10]
    mov dx, [bp+12]
    call dword ptr [_gfxFarTableExported + 31*4]
    pop es
    pop ds
    pop di
    pop si
    pop bp
    retf
_gfx_drawLine endp

; Slot 0x25 (gfxFarTableExported[37]) — BX = near offset of the per-scanline
; span buffer (g_spanBuf.minX), AX = yMin, CX = yMax; flush the accumulated
; spans into the current page. cdecl args (far):
;   [bp+6]=spanBuf [bp+8]=yMin [bp+10]=yMax
_gfx_dirtyRect proc far
    push bp
    mov bp, sp
    push si
    push di
    push ds
    push es
    mov bx, [bp+6]
    mov ax, [bp+8]
    mov cx, [bp+10]
    call dword ptr [_gfxFarTableExported + 37*4]
    pop es
    pop ds
    pop di
    pop si
    pop bp
    retf
_gfx_dirtyRect endp

END
