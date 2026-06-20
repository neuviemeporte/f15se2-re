// seg000 optimized code (/Ot)
#include "eg3dcam.h"
#include "egcode.h"
#include "egdata.h"
#include "egtypes.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

void setViewRotation(int rotX, int rotY, int rotZ) {
    buildRotationMatrixFar(g_viewRotMatrix, -rotX, -rotY, -rotZ);
}

// ==== seg000:0x3a90 ====
void setViewPosition(int posX, int posY, int posZ) {
    g_viewPosX = posX;
    g_viewPosY = posY;
    g_viewPosZ = posZ;
}
