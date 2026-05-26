; mgraphic.asm — MCGA/VGA graphics driver overlay for F15 Strike Eagle II
;
; This is NOT a standalone executable. It is loaded as an overlay by the game.
; Entry point (cs:ip = 0:0) points to the identification string, not code.
;
; Overlay header (segment 0, data):
;   0x00-0x13: ID string "MGRAPHIC.EXE09-19-88"
;   0x14-0x17: padding (zeros)
;   0x18:      code segment paragraph (0x01d0)
;   0x1a:      size1 (overlay load calculates size from this)
;   0x1c:      first slot index (0)
;   0x1e:      size2 (used in overlay size calculation)
;   0x20:      unknown
;   0x22:      number of slots (84)
;   0x24:      slot offset array (84 words, offsets into code segment)
;
; Two segments:
;   Segment 0 (DATA): header, slot offsets, palette tables, font data, strings, variables
;   Segment 0x1d0 (CODE): actual graphics routines, preceded by row offset table
;
; The game calls overlay functions via a far jump table patched by setupOverlaySlots().
; DS is set to segment 0 (overlay data) by each routine as needed.
; The caller's DS points to the game's data segment (start.exe / egame.exe).
;
; Key code-segment data (relative to CS):
;   cs:0x000e - Row offset table (200 words: row * 320 for Mode 13h)
;   cs:0x019e - Current page segment (word)
;   cs:0x01a0 - Current blit offset (word)
;   cs:0x01a2 - Mode/flag byte
;   cs:0x0681 - Page segment table (word array, indexed by page number)
;
; Key data-segment variables (relative to DS=overlay seg 0):
;   ds:0x1c76 - charWidth (current char pixel width for rendering)
;   ds:0x1c77 - charsRemaining (chars left to render)
;   ds:0x1c78 - fontDataPtr (current font bitmap pointer)
;   ds:0x1c7a - fontBaseOffset
;   ds:0x1c7c - fontMaxWidth (0xFF = proportional)
;   ds:0x1c7d - fontBitShift
;   ds:0x1c7e - charClipWidth
;   ds:0x1c7f - rowCount (height of current char)
;   ds:0x1c80 - startRowOffset (row clipping offset)
;   ds:0x1c82 - proportionalWidthTable ptr
;   ds:0x1c84 - column start array (8 words)
;   ds:0x1c8c - clip min array (8 words?)
;   ds:0x1c94 - clip max array (8 words?)
;
; === SLOT TABLE ===
; Slot  Entry   Name
; 0x00  0x025e  gfx_alloc (allocate graphics pages)
; 0x01  0x0461  gfx_01 (clear dirty/fill)
; 0x02  0x03dc  gfx_blit (blit between pages with transparency)
; 0x03  0x0418  gfx_03 (similar to blit)
; 0x04  0x04ab  gfx_copyBlock (copy rectangular block between pages)
; 0x05  0x0369  gfx_drawString (draw clipped string)
; 0x06  0x03cd  gfx_06 (draw string variant, calls 0x7db)
; 0x07  0x0391  gfx_07 (string clip helper - clip X right)
; 0x08  0x03a5  gfx_08 (string clip helper - clip Y)
; 0x09  0x037d  gfx_09 (string clip helper - clip X left)
; 0x0a  0x03b9  gfx_0a (string clip helper - clip Y bottom)
; 0x0b  0x0615  gfx_0b (complex rendering)
; 0x0c  0x069d  gfx_0c
; 0x0d  0x06ac  gfx_setCurBuf (set current buffer/page)
; 0x0e  0x06a6  gfx_setCurBuf2
; 0x0f  0x06bd  gfx_getBufPtr
; 0x10  0x06c2  gfx_getCurBuf
; 0x11  0x07ca  gfx_blitSprite
; 0x12  0x07db  gfx_12 (sprite blit core)
; 0x13  0x0725  gfx_13
; 0x14  0x0736  gfx_14
; 0x15  0x0724  gfx_15 (retf stub)
; 0x16  0x0724  gfx_16 (retf stub, same as 0x15)
; 0x17  0x01e0  gfx_bufsize (returns buffer size info)
; 0x18  0x06c7  gfx_18
; 0x19  0x06c7  gfx_19 (same as 0x18)
; 0x1a  0x06cf  gfx_1a
; 0x1b  0x06d5  gfx_1b
; 0x1c  0x06da  gfx_1c
; 0x1d  0x06de  gfx_1d
; 0x1e  0x06e2  gfx_1e
; 0x1f  0x02f9  gfx_drawLine
; 0x20  0x02c1  gfx_20 (retf, page-related)
; 0x21  0x02bb  gfx_21 (retf)
; 0x22  0x02cd  gfx_22
; 0x23  0x02cd  gfx_23 (same as 0x22)
; 0x24  0x02ce  gfx_24 (retf)
; 0x25  0x0830  gfx_dirtyRect
; 0x26  0x06ed  gfx_26
; 0x27  0x06fe  gfx_27
; 0x28  0x0830  gfx_dirtyRect2 (same as 0x25)
; 0x29  0x08ff  gfx_switchColor
; 0x2a  0x08a8  gfx_2a
; 0x2b  0x0899  gfx_2b
; 0x2c  0x0963  gfx_2c
; 0x2d  0x0709  gfx_2d
; 0x2e  0x09be  gfx_2e
; 0x2f  0x01a3  gfx_charWidth (measure/prepare string char)
; 0x30  0x0953  gfx_blitToCurrent
; 0x31  0x01e6  gfx_31 (font setup helper)
; 0x32  0x0204  gfx_32
; 0x33  0x0a4c  gfx_fillRow (retf - no-op in MCGA?)
; 0x34  0x0a4c  gfx_fillRow2 (same as 0x33)
; 0x35  0x0a49  gfx_35
; 0x36  0x0a4a  gfx_36_null
; 0x37  0x0a4b  gfx_37_null
; 0x38  0x0a41  gfx_getPageBuf
; 0x39  0x0a2e  gfx_39
; 0x3a  0x0a26  gfx_getRowOffset
; 0x3b  0x088f  gfx_clearBuf
; 0x3c  0x0216  gfx_setMode13 (set MCGA mode 13h)
; 0x3d  0x0a40  gfx_3d_null (retf)
; 0x3e  0x070e  gfx_3e
; 0x3f  0x0720  gfx_modecode (returns mode code)
; 0x40  0x06e7  gfx_40
; 0x41  0x06f8  gfx_41
; 0x42  0x01eb  gfx_42
; 0x43  0x01f0  gfx_43
; 0x44  0x0296  gfx_setDac (set VGA DAC palette)
; 0x45  0x022a  gfx_retrace (wait for vertical retrace)
; 0x46  0x0244  gfx_retrace2 (retrace + page flip)
; 0x47  0x0725  gfx_47 (same as 0x13)
; 0x48  0x0736  gfx_48 (same as 0x14)
; 0x49  0x07ca  gfx_49 (same as 0x11)
; 0x4a  0x07db  gfx_4a (same as 0x12)
; 0x4b  0x068b  gfx_storeBufPtr
; 0x4c  0x01f5  gfx_4c
; 0x4d  0x01fa  gfx_4d
; 0x4e  0x01ff  gfx_getVal
; 0x4f  0x09b3  gfx_4f
; 0x50  0x01cf  gfx_50_null (retf)
; 0x51  0x01d0  gfx_51_null (retf)
; 0x52  0x01d1  gfx_52_null (retf)
; 0x53  0x06bc  gfx_53
;
; =============================================================================

.8086
.MODEL SMALL

; =============================================================================
; DATA SEGMENT (overlay segment 0)
; =============================================================================
.DATA

; --- Overlay header ---
ovlIdString     db 'MGRAPHIC.EXE09-19-88'
                db 4 dup(0)             ; padding
ovlCodeSeg      dw 01D0h               ; 0x18: code segment paragraph
ovlBaseSeg      dw 0                    ; 0x1a: base segment (relocated at load time)
ovlFirstSlot    dw 0                    ; 0x1c: first slot index
ovlSize1        dw 1D0Dh               ; 0x1e: data seg size in bytes (>>4 = paragraphs)
ovlSize2        dw 0A5Ah               ; 0x20: code seg size in bytes (>>4 = paragraphs)
ovlNumSlots     dw 84                   ; 0x22: number of slots
; --- Slot offset table (84 words) ---
ovlSlotTable:
    dw 025Eh    ; slot 00 - gfx_alloc
    dw 0461h    ; slot 01 - gfx_01
    dw 03DCh    ; slot 02 - gfx_blit
    dw 0418h    ; slot 03 - gfx_03
    dw 04ABh    ; slot 04 - gfx_copyBlock
    dw 0369h    ; slot 05 - gfx_drawString
    dw 03CDh    ; slot 06 - gfx_06
    dw 0391h    ; slot 07 - gfx_07
    dw 03A5h    ; slot 08 - gfx_08
    dw 037Dh    ; slot 09 - gfx_09
    dw 03B9h    ; slot 0a - gfx_0a
    dw 0615h    ; slot 0b - gfx_0b
    dw 069Dh    ; slot 0c - gfx_0c
    dw 06ACh    ; slot 0d - gfx_setCurBuf
    dw 06A6h    ; slot 0e - gfx_setCurBuf2
    dw 06BDh    ; slot 0f - gfx_getBufPtr
    dw 06C2h    ; slot 10 - gfx_getCurBuf
    dw 07CAh    ; slot 11 - gfx_blitSprite
    dw 07DBh    ; slot 12 - gfx_12
    dw 0725h    ; slot 13 - gfx_13
    dw 0736h    ; slot 14 - gfx_14
    dw 0724h    ; slot 15 - gfx_15 (retf)
    dw 0724h    ; slot 16 - gfx_16 (retf)
    dw 01E0h    ; slot 17 - gfx_bufsize
    dw 06C7h    ; slot 18 - gfx_18
    dw 06C7h    ; slot 19 - gfx_19
    dw 06CFh    ; slot 1a - gfx_1a
    dw 06D5h    ; slot 1b - gfx_1b
    dw 06DAh    ; slot 1c - gfx_1c
    dw 06DEh    ; slot 1d - gfx_1d
    dw 06E2h    ; slot 1e - gfx_1e
    dw 02F9h    ; slot 1f - gfx_drawLine
    dw 02C1h    ; slot 20 - gfx_20
    dw 02BBh    ; slot 21 - gfx_21
    dw 02CDh    ; slot 22 - gfx_22
    dw 02CDh    ; slot 23 - gfx_23
    dw 02CEh    ; slot 24 - gfx_24
    dw 0830h    ; slot 25 - gfx_dirtyRect
    dw 06EDh    ; slot 26 - gfx_26
    dw 06FEh    ; slot 27 - gfx_27
    dw 0830h    ; slot 28 - gfx_dirtyRect2
    dw 08FFh    ; slot 29 - gfx_switchColor
    dw 08A8h    ; slot 2a - gfx_2a
    dw 0899h    ; slot 2b - gfx_2b
    dw 0963h    ; slot 2c - gfx_2c
    dw 0709h    ; slot 2d - gfx_2d
    dw 09BEh    ; slot 2e - gfx_2e
    dw 01A3h    ; slot 2f - gfx_charWidth
    dw 0953h    ; slot 30 - gfx_blitToCurrent
    dw 01E6h    ; slot 31 - gfx_31
    dw 0204h    ; slot 32 - gfx_32
    dw 0A4Ch    ; slot 33 - gfx_fillRow
    dw 0A4Ch    ; slot 34 - gfx_fillRow2
    dw 0A49h    ; slot 35 - gfx_35
    dw 0A4Ah    ; slot 36 - gfx_36_null
    dw 0A4Bh    ; slot 37 - gfx_37_null
    dw 0A41h    ; slot 38 - gfx_getPageBuf
    dw 0A2Eh    ; slot 39 - gfx_39
    dw 0A26h    ; slot 3a - gfx_getRowOffset
    dw 088Fh    ; slot 3b - gfx_clearBuf
    dw 0216h    ; slot 3c - gfx_setMode13
    dw 0A40h    ; slot 3d - gfx_3d_null
    dw 070Eh    ; slot 3e - gfx_3e
    dw 0720h    ; slot 3f - gfx_modecode
    dw 06E7h    ; slot 40 - gfx_40
    dw 06F8h    ; slot 41 - gfx_41
    dw 01EBh    ; slot 42 - gfx_42
    dw 01F0h    ; slot 43 - gfx_43
    dw 0296h    ; slot 44 - gfx_setDac
    dw 022Ah    ; slot 45 - gfx_retrace
    dw 0244h    ; slot 46 - gfx_retrace2
    dw 0725h    ; slot 47 - gfx_47
    dw 0736h    ; slot 48 - gfx_48
    dw 07CAh    ; slot 49 - gfx_49
    dw 07DBh    ; slot 4a - gfx_4a
    dw 068Bh    ; slot 4b - gfx_storeBufPtr
    dw 01F5h    ; slot 4c - gfx_4c
    dw 01FAh    ; slot 4d - gfx_4d
    dw 01FFh    ; slot 4e - gfx_getVal
    dw 09B3h    ; slot 4f - gfx_4f
    dw 01CFh    ; slot 50 - gfx_50_null
    dw 01D0h    ; slot 51 - gfx_51_null
    dw 01D1h    ; slot 52 - gfx_52_null
    dw 06BCh    ; slot 53 - gfx_53

; --- Data between slot table and palette data ---
; Offset 0xCC in data segment: referenced by code (palette index?)
; From the hex dump, 0x19c onwards contains various tables
; TODO: fully map out data segment contents

; =============================================================================
; Strings (found in data segment)
; =============================================================================
; At data seg offset ~0x1d22:
;   "Insufficient memory for MCGA graphics$"
;   "MCGA is not supported on your machine$"
; At data seg offset ~0x1ecc:
;   "Copyright (C) 1988 by MicroProse Software, All Rights Reserved"

; =============================================================================
; CODE SEGMENT (overlay segment 0x1d0)
; =============================================================================
; .CODE

; The code segment has the following layout:
;   cs:0x0000-0x000d  Initial bytes (possibly code/data preamble)
;   cs:0x000e-0x019d  Row offset table: 200 words, rowOffsets[i] = i * 320
;   cs:0x019e         curPageSeg: current page segment (word)
;   cs:0x01a0         blitOffset: current blit base offset (word)
;   cs:0x01a2         modeFlag: byte (initialized to 1)
;   cs:0x01a3         Start of executable code
;   ...
;   cs:0x0681         pageSegs: page segment table (word array)
;   ...
;   cs:0x0a59         End of code segment

; --- Row offset table (200 entries for Mode 13h: 320x200) ---
; rowOffsets  dw 0, 320, 640, 960, ... (i*320 for i=0..199)

; --- Variables in code segment ---
; curPageSeg  dw 0        ; cs:0x019e
; blitOffset  dw 0        ; cs:0x01a0
; modeFlag    db 1        ; cs:0x01a2

; =============================================================================
; ROUTINE DESCRIPTIONS (annotated from disassembly)
; =============================================================================

; ---- slot 0x2f: gfx_charWidth (cs:0x01a3) ----
; Measure character width for proportional fonts
; Entry: called with string in [ss:bx], params on stack via bp
; Uses font width table at [ds:0x1c82], max width at [ds:0x1c7c]
;
; push bp / mov bp,sp / push di / push ds
; Sets DS to overlay data segment (mov ax,0; mov ds,ax)
; Reads page number from [bp+0], looks up page segment from cs:0x681
; Sets up font rendering state variables

; ---- slot 0x50: gfx_50_null (cs:0x01cf) ----
; No-op stub (RETF)

; ---- slot 0x51: gfx_51_null (cs:0x01d0) ----
; No-op stub (RETF)

; ---- slot 0x52: gfx_52_null (cs:0x01d1) ----
; No-op stub (RETF)

; ---- slot 0x17: gfx_bufsize (cs:0x01e0) ----
; Returns buffer size info
; Uses cs:0x01a2 byte and cs:row offset table
; mov ax, [cs:word_01d2] / retf  (various small getters at 0x1e0-0x213)

; ---- slot 0x3c: gfx_setMode13 (cs:0x0216) ----
; Set MCGA/VGA Mode 13h (320x200x256)
;   push es
;   mov ax, 0000h       ; DS = overlay data seg
;   mov ds, ax
;   mov es, [cs:019eh]  ; ES = current page segment
;   mov ax, 0013h
;   int 10h             ; Set video mode 13h
;   mov ah, 0Fh
;   int 10h             ; Get current video mode
;   cmp al, 13h         ; Verify mode was set
;   jnz error           ; If not, return error
;   ; ... set up page clearing, palette initialization ...

; ---- slot 0x45: gfx_retrace (cs:0x022a) ----
; Wait for vertical retrace
;   mov dx, 03DAh       ; VGA status register
;   in al, dx
;   test al, 8          ; Check vertical retrace bit
;   jnz @@wait          ; Wait until not in retrace
;   in al, dx
;   test al, 8
;   jz @@wait2          ; Then wait for retrace to start
;   retf

; ---- slot 0x46: gfx_retrace2 (cs:0x0244) ----
; Retrace + page flip (copy page to VGA)
;   Calls gfx_retrace, then does rep movsw to copy buffer to A000:0000

; ---- slot 0x44: gfx_setDac (cs:0x0296) ----
; Set VGA DAC palette registers
; Uses palette tables in the data segment
; Writes to port 3C8h (DAC address) and 3C9h (DAC data)

; ---- slot 0x1f: gfx_drawLine (cs:0x02F9) ----
; Bresenham line drawing
; Reads line endpoints from caller's data segment (lineX1, lineY1, etc.)
; Draws pixel by pixel into the current page buffer

; ---- slot 0x05: gfx_drawString (cs:0x0369) ----
; Draw a text string with clipping
; Clips against page boundaries, then calls sprite blit (0x7db)
; Has multiple entry points for different clipping configurations

; ---- slot 0x02: gfx_blit (cs:0x03DC) ----
; Blit a rectangular region between pages with transparency (skip zero bytes)
; Parameters specify source/dest pages, coords, and dimensions

; ---- slot 0x04: gfx_copyBlock (cs:0x04AB) ----
; Copy a rectangular block between pages (no transparency check)
; Uses rep movsb for each row

; ---- slot 0x0b: gfx_0b (cs:0x0615) ----
; Complex rendering (possibly terrain or polygon fill)

; ---- slot 0x4b: gfx_storeBufPtr (cs:0x068B) ----
; Store a segment value into the page segment table
;   mov bx, sp
;   mov ax, [ss:bx+4]   ; segment value
;   mov bx, [ss:bx+6]   ; page index
;   shl bx, 1
;   mov [cs:bx+0x681], ax  ; store in page seg table
;   retf

; ---- slot 0x25/0x28: gfx_dirtyRect (cs:0x0830) ----
; Mark a rectangular region as dirty (for partial screen updates)
; Reads dirty buffer from caller's DS, updates min/max row tracking

; ---- slot 0x3b: gfx_clearBuf (cs:0x088F) ----
; Clear a page buffer (fill with zeros)
;   mov cx, 7D00h       ; 32000 words = 64000 bytes = 320*200
;   xor ax, ax
;   xor di, di
;   rep stosw
;   retf

; ---- slot 0x29: gfx_switchColor (cs:0x08FF) ----
; Switch one color for another in a rectangular region
; Scans pixels, replaces matching color with new color

; ---- slot 0x3a: gfx_getRowOffset (cs:0x0A26) ----
; Get row byte offset for a given Y coordinate
;   mov bx, sp
;   mov bx, [ss:bx+4]   ; Y coordinate
;   shl bx, 1
;   mov ax, [cs:bx+0Eh] ; look up in row offset table
;   retf

; ---- slot 0x38: gfx_getPageBuf (cs:0x0A41) ----
; Get page segment for a given page index
;   mov bx, sp
;   mov bx, [ss:bx+4]
;   shl bx, 1
;   mov ax, [cs:bx+0x681]
;   retf

; ---- slot 0x33/0x34: gfx_fillRow (cs:0x0A4C) ----
; No-op in MCGA mode (RETF) - used by other drivers for row fill ops

END
