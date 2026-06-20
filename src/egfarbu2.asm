; g_world3dData - 3D region/object data buffer (0xADD4 bytes), starts at offset 0.
; g_aircraftModels - 15FLT.3D3 aircraft model buffer (0x520C bytes), MUST be contiguous
; right after g_world3dData in the SAME segment. shapeDataOffset() addresses aircraft
; models as `&g_aircraftModels[off] - g_world3dData` (a 16-bit far-offset difference, segment
; ignored) and drawWorldObject() then does `g_world3dData + that`. That round-trip only
; resolves when both buffers share one segment with g_aircraftModels at g_world3dData + 0xADD4
; (the original's offset diff 0xADD4 = -0x522c signed). If g_aircraftModels is a separate
; far array the diff collapses to ~0 and aircraft models read the region buffer ->
; garbage 3D + rasterizer hang/crash. Total 0xADD4 + 0x520C = 0xFFE0, fits one segment.

FARBUF1_BSS SEGMENT PARA PUBLIC 'FAR_BSS'
    PUBLIC _g_world3dData
_g_world3dData DB 0ADD4h DUP (?)
    PUBLIC _g_aircraftModels
_g_aircraftModels DB 0520Ch DUP (?)
FARBUF1_BSS ENDS

END
