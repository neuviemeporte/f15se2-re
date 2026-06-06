// seg000 non-debug code (/Gs, no /Zi)
// Functions whose block scheduling only matches when compiled without /Zi.
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"
#include "comm.h"

#include <dos.h>
#include <conio.h>
#include <bios.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// ==== seg000:0x6172 ====
int updateThreatSites()
{
    int p, a, b, c, d, e;

    if ((word_336F8 == 0 || word_3C03E != word_336E4) && word_330C2 != 0) {
        if (word_336F8 == 0 && word_3C09A == 0) {
            restoreScopePanel();
            word_3BF3C = 0;
            word_3BF3E = 0x100;
        }
    }

    for (d = 0; d < word_38FFA; d++) {
        if (stru_3AA5E[d].field_4 != 0 &&
            !(stru_3AA5E[d].flags & 0x80) &&
            ((d * (frameTick >> 10) * 7 & 7) <= 7 ||
            stru_3AA5E[d].field_8 != 0 ||
            (stru_3AA5E[d].flags & 0x100) != 0)) {
            stru_3AA5E[d].field_A -= 1;
            if (stru_3AA5E[d].field_A <= 0) {
                stru_3AA5E[d].field_A =
                    ((int)(char)word_330C4 << 8) /
                    ((stru_3AA5E[d].field_8 >> 3) + 0x20) + d / 2;
            }
            if (stru_3AA5E[d].field_A == 4 && word_336F8 < 0) {
                fireGroundThreat(d);
                stru_3AA5E[d].flags |= 0x02;
            }
        } else {
            stru_3AA5E[d].flags &= ~0x02;
        }
    }

    if (commData->gfxModeNum == 0) {
        word_38F72 = 0;
    }

    if (word_3C09A == 0 && word_336F8 > 0 && word_330C2 != 0 && word_3BE7E > 1) {
        if (word_38FDC != 0 && commData->gfxModeNum != 0) {
            captureScopePanel();
            a = (int)((long)clampRange(word_330C4 - word_336F8, 1, word_330C4) * (long)word_3BE7E / (long)word_330C4) << 6;
        } else {
            a = word_3BE7E << 6;
            word_3BE7E = 0;
        }
        if (word_3BE96 >= 0) {
            drawMapRangeArc(stru_3AA5E[word_3BE96].mapX,
                      stru_3AA5E[word_3BE96].mapY,
                      a, word_38F72, word_3C6AA,
                      word_3BF3C, word_3BF3E);
        }
    }

    word_336F8--;
}
