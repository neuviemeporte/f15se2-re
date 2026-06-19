/*
 * egfarbu2.c - Far runtime buffers for 3D world/model data.
 *
 * byte_228D0: 3D region/object data buffer (0xADD4 bytes).
 * byte_2D6A4: 15FLT.3D3 aircraft model buffer (0x520C bytes).
 *
 * The two MUST share one far segment (their relative order within it does not
 * matter). shapeDataOffset() (egmath.c) addresses aircraft models as the
 * segment-ignored far-offset difference &byte_2D6A4[off] - byte_228D0, and
 * drawWorldObject() re-adds it to byte_228D0; that round-trip is pure offset
 * algebra that only resolves when both buffers live in the same segment.
 * Total 0xADD4 + 0x520C = 0xFFE0 fits one 64 KB segment.
 */

#if !defined(MSDOS)
#define far
#endif

char far byte_228D0[0xADD4];
char far byte_2D6A4[0x520C];
