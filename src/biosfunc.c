#include "biosfunc.h"
#include "memory.h"
#include "pointers.h"
#include "inttype.h"
#include "offsets.h"

void bios_clearkeyflags() {
    uint16 FAR *bios_keyflags = MK_FP(SEG_LOWMEM, OFF_BDA_KEYFLAGS);
    *bios_keyflags = 0;    
}