// seg000 optimized code (/Ot)
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>


void setViewRotation(int rotX, int rotY, int rotZ) {
    buildRotationMatrixFar((uint8*)&word_34276, -rotX, -rotY, -rotZ);
}

// ==== seg000:0x3a90 ====
void setViewPosition(int posX, int posY, int posZ) {
    var_218 = posX;
    var_219 = posY;
    var_220 = posZ;
}

