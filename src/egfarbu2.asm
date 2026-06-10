; Original egame.exe places the far 3D data segment at paragraph 128Dh, then
; DGROUP/Data1 at 228Bh. Rebuilt code is shorter before this point, so keep a
; small loader-space pad in front of the far buffer to preserve those segment
; paragraphs. The unit harness relies on these segment bases matching the
; original exe when comparing original and rebuilt state.

DATA3_ALIGN SEGMENT PARA PUBLIC 'FAR_BSS'
    DB 0140h DUP (?)
DATA3_ALIGN ENDS

; byte_228D0 - 3D region/object data buffer (0xADD4 bytes), starts at offset 0.
; byte_2D6A4 - 15FLT.3D3 aircraft model buffer (0x520C bytes), MUST be contiguous
; right after byte_228D0 in the SAME segment. shapeDataOffset() addresses aircraft
; models as `&byte_2D6A4[off] - byte_228D0` (a 16-bit far-offset difference, segment
; ignored) and drawWorldObject() then does `byte_228D0 + that`. That round-trip only
; resolves when both buffers share one segment with byte_2D6A4 at byte_228D0 + 0xADD4
; (the original's offset diff 0xADD4 = -0x522c signed). If byte_2D6A4 is a separate
; far array the diff collapses to ~0 and aircraft models read the region buffer ->
; garbage 3D + rasterizer hang/crash. Total 0xADD4 + 0x520C = 0xFFE0, fits one segment.

Data3 SEGMENT PARA PUBLIC 'FAR_BSS'
    PUBLIC _byte_228D0
_byte_228D0 DB 0ADD4h DUP (?)
    PUBLIC _byte_2D6A4
_byte_2D6A4 DB 0520Ch DUP (?)
Data3 ENDS

END
