#include "eg3dvp.h"
#include "egdata.h"
#include "egtypes.h"
#include "slot.h"

// ==== seg000:0x39c0 ====
void setupViewport(char *rect) {
    int height, width;
    width = *(int *)(rect + 0x14) - *(int *)(rect + 0x12) + 1;
    height = *(int *)(rect + 0x10) - *(int *)(rect + 0x0e) + 1;
    g_viewCenterX = (width + 1 >> 1) - 1;
    g_viewCenterY = (height + 1 >> 1) - 1;
    if (*(int *)(rect + 0x0e) == 0) {
        g_viewCenterY = *(int *)(rect + 0x10) == 199 ? 0x64 : 0x38;
    }
    gfx_setOvlVal2(width - 1);
    gfx_setBlitOffset(gfx_calcRowAddr(*(int *)(rect + 0x12), *(int *)(rect + 0x0e)));
    g_clipMaxX = width - 1;
    g_clipMaxY = height - 1;
    g_overlayCenterX = g_overlayBaseX;
    g_overlayCenterY = g_overlayBaseY;
    if (g_halfScaleRender != 0) {
        g_overlayCenterX += 8;
        g_overlayCenterY += 8;
    }
    if ((char)g_hudVisible != 0) {
        g_overlayCenterY += 0x10;
    }
}
