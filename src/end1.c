/* end1.c — compiled with /Gs (stack probes disabled, no debug info) */
#include "pointers.h"
#include "debug.h"
#include "end.h"

void routine_91(int param_1)
{
    TRACE(("routine_91"));
    routine_125(param_1);
}

void mystrcpy(char *dst, char *src)
{
    TRACE(("mystrcpy"));
    while ((*dst++ = *src++) != 0)
        ;
}
