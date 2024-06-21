#ifndef OVL_H
#define OVL_H

#include "pointers.h"

#define JMPTABLE_SLOT_SIZE 5 /* 0xea far jump opcode + 4 bytes for far address */
#define JMPTABLE_SLOT_COUNT 110
typedef int (FAR* OverlaySlot)();

/* deliberately mismatched declaration; declare the array from the .c file as a function, 
 so it's callable while living in the data segment  */
int FAR overlay_jumptable();

#define OVERLAY_FUNC(index) ((OverlaySlot)(((uint8 FAR*)overlay_jumptable) + (index * JMPTABLE_SLOT_SIZE)))

#endif /* OVL_H */
