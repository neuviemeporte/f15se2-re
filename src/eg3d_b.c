// seg000 debug code (/Zi)
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


// TODO: projectObjects (seg000:22b8-26b3) - belongs in egame2.c
// Once implemented, try merging egame2.c + egame1e.c (if register spill doesn't affect codegen)

// ==== seg000:0x26b4 ====
uint32 scaleCoordToLod(int level, uint32 coord) {
    switch (level) {
    case 4:
        return (coord + 0x20) >> 6;
    case 3:
        return (coord + 8) >> 4;
    case 2:
        return (coord + 2) >> 2;
    case 1:
        return coord;
    case 0:
        return coord << 1;
    }
}
