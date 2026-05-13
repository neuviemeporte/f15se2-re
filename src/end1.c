/* end1.c — compiled with /Gs (stack probes disabled, no debug info) */
#include "end.h"

void routine_91(int param_1)
{
    routine_125(param_1);
}

void mystrcpy(char *dst, char *src)
{
    while ((*dst++ = *src++) != 0)
        ;
}
