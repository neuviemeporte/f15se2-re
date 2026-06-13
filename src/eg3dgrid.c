// seg000 debug code (/Zi)
#include "egame.h"
#include "offsets.h"

int process3dg(int lod, int col, int row)
{
    if (lod == 4) {
        col += 2;
        row += 2;
    }
    if (col < 0 || row < 0 || col >= (&word_33BAE)[lod] || row >= (&word_33BAE)[lod]) {
        return 0;
    }
    switch (lod) {
    case 4:
        return byte_3A900[col + (row << 3)];
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
