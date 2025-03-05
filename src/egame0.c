#include "debug.h"
#include "egame.h"
#include "offsets.h"
#include "pointers.h"

#include <dos.h>

int main(void) {
    uint16 FAR *commPtr;
    FP_SEG(commPtr) = SEG_LOWMEM;
    FP_OFF(commPtr) = OFF_IACA_START;
    FP_SEG(commData) = *commPtr;
    FP_OFF(commData) = 0;    
    return 0;
}
