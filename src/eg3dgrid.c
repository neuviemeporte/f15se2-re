// seg000 debug code (/Zi)
#include "eg3dgrid.h"
#include "egdata.h"
#include "egtypes.h"
#include "offsets.h"

int16 process3dg(int16 lod, int16 col, int16 row) {
    if (lod == 4) {
        col += 2;
        row += 2;
    }
    if (col < 0 || row < 0 || col >= g_lodGridDim[lod] || row >= g_lodGridDim[lod]) {
        return 0;
    }
    switch (lod) {
    case 4:
        return g_topLodGrid[col + (row << 3)];
    case 3:
        return buf1_3dg[col + (row << 4)];
    case 2:
        return buf2_3dg[(col & 3) + ((row & 3) << 2) + (process3dg(3, col >> 2, row >> 2) << 4)];
    case 1:
        return buf3_3dg[(col & 3) + ((row & 3) << 2) + (process3dg(2, col >> 2, row >> 2) << 4)];
    case 0:
        return buf4_3dg[(col & 3) + ((row & 3) << 2) + (process3dg(1, col >> 2, row >> 2) << 4)];
    }
}
