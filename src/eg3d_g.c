// seg000 optimized code (/Ot)
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>


void setViewRotation(int arg_0, int arg_2, int arg_4) {
    buildRotationMatrixFar((uint8*)&word_34276, -arg_0, -arg_2, -arg_4);
}

// ==== seg000:0x3a90 ====
void setViewPosition(int arg_0, int arg_2, int arg_4) {
    var_218 = arg_0;
    var_219 = arg_2;
    var_220 = arg_4;
}

