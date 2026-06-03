/* byte_2D6A4 (15FLT.3D3 aircraft model buffer) is now defined in egfarbu2.asm
 * contiguously after byte_228D0 in the same FAR_BSS segment, because
 * shapeDataOffset() addresses aircraft models via a same-segment offset
 * difference from byte_228D0 (see egfarbu2.asm). A standalone far array here
 * lands in a different segment and makes aircraft models read the region
 * buffer -> garbage 3D. */
#include "egame.h"
