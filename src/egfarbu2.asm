; byte_228D0 - 3D region/object data buffer (0xADD4 bytes), starts at offset 0.
; byte_2D6A4 - 15FLT.3D3 aircraft model buffer (0x520C bytes), MUST be contiguous
; right after byte_228D0 in the SAME segment. shapeDataOffset() addresses aircraft
; models as `&byte_2D6A4[off] - byte_228D0` (a 16-bit far-offset difference, segment
; ignored) and drawWorldObject() then does `byte_228D0 + that`. That round-trip only
; resolves when both buffers share one segment with byte_2D6A4 at byte_228D0 + 0xADD4
; (the original's offset diff 0xADD4 = -0x522c signed). If byte_2D6A4 is a separate
; far array the diff collapses to ~0 and aircraft models read the region buffer ->
; garbage 3D + rasterizer hang/crash. Total 0xADD4 + 0x520C = 0xFFE0, fits one segment.

FARBUF1_BSS SEGMENT PARA PUBLIC 'FAR_BSS'
    PUBLIC _byte_228D0
_byte_228D0 DB 0ADD4h DUP (?)
    PUBLIC _byte_2D6A4
_byte_2D6A4 DB 0520Ch DUP (?)
FARBUF1_BSS ENDS

END
