#ifndef OVERLAY_H
#define OVERLAY_H

#include "inttype.h"
#include "pointers.h"

/* typedef for a pointer to an overlay function */
typedef uint16 (FAR *OverlayFunc)(uint16); 

uint16 overlay_load(const char* filename);
OverlayFunc overlay_functionAddress(const uint16 ovlLoadSegment, const uint16 funcNumber);

#endif // OVERLAY_H
