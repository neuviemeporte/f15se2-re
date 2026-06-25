// seg000 optimized code (/Ot)
#include "eg3dcam.h"
#include "egcode.h"
#include "egdata.h"
#include "egtypes.h"
#include "offsets.h"
#include "pointers.h"
#include "log.h"
#include "slot.h"
#include "const.h"

#include <dos.h>
#include <memory.h>

void setViewRotation(int rotX, int rotY, int rotZ) {
    buildRotationMatrixFar(g_viewRotMatrix, -rotX, -rotY, -rotZ);
}

// ==== seg000:0x3a90 ====
void setViewPosition(int viewX, int viewY, int viewZ) { /* Original: SetViewPos(X,Y,Z). Store viewer coordinates for 3D transforms. */
    g_viewPosX = viewX;
    g_viewPosY = viewY;
    g_viewPosZ = viewZ;
}
