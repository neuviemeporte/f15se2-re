// seg000 debug code (/Zi)
#include "egame.h"
#include "offsets.h"

int process3dg(int param_1, int param_2, int param_3)
{
    if (param_1 == 4) {
        param_2 += 2;
        param_3 += 2;
    }
    if (param_2 < 0 || param_3 < 0 || param_2 >= (&word_33BAE)[param_1] || param_3 >= (&word_33BAE)[param_1]) {
        return 0;
    }
    switch (param_1) {
    case 4:
        return byte_3A900[param_2 + (param_3 << 3)];
    case 3:
        return buf1_3dg[param_2 + (param_3 << 4)];
    case 2:
        return buf2_3dg[(param_2 & 3) + ((param_3 & 3) << 2) + (process3dg(3, param_2 >> 2, param_3 >> 2) << 4)];
    case 1:
        return buf3_3dg[(param_2 & 3) + ((param_3 & 3) << 2) + (process3dg(2, param_2 >> 2, param_3 >> 2) << 4)];
    case 0:
        return buf4_3dg[(param_2 & 3) + ((param_3 & 3) << 2) + (process3dg(1, param_2 >> 2, param_3 >> 2) << 4)];
    }
}
