/*
 * egfarbu2.c - Far runtime buffer for 3D world/model data (asm-free builds).
 *
 * This is the NO_ASM / 64-bit counterpart of egfarbu2.asm. byte_228D0 is one
 * contiguous buffer split into two regions:
 *   - [0 .. AIRCRAFT_MODELS_OFFSET-1]  3D region/object data  (byte_228D0 region)
 *   - [AIRCRAFT_MODELS_OFFSET .. end]  15FLT.3D3 aircraft models (byte_2D6A4 region)
 *
 * byte_2D6A4 is defined in egame.h as a view into this buffer at the fixed offset,
 * so the +AIRCRAFT_MODELS_OFFSET spacing that shapeDataOffset() depends on is
 * guaranteed by construction rather than by linker placement. The reference build
 * uses egfarbu2.asm instead, where the two regions are distinct symbols.
 */

#include "egame.h"

#ifdef NO_ASM
#ifdef BUGFIX
char far byte_228D0[AIRCRAFT_MODELS_OFFSET + 0x520C];
#else
unsigned char far byte_228D0[AIRCRAFT_MODELS_OFFSET + 0x520C];
#endif
#endif /* NO_ASM */
