#ifndef DOSFUNC_H
#define DOSFUNC_H

#include "inttype.h"
#include "pointers.h"
#include <stddef.h>

uint16 dos_alloc(const size_t paragraphs);
int16 dos_free(const uint16 segment);
uint16 dos_resize(const uint16 segment, uint16 newsize);
size_t dos_getfree(void);
int16 dos_loadOverlay(const char *file, const uint16 segment);
int16 dos_runProgram(const char *file, const char FAR *cmdline);
int16 dos_loadProgram(const char *file, const char FAR *cmdline, uint16 *cs, uint16 *ss);
int16 dos_getReturnCode(void);
uint16 dos_getProcessId(void);
int16 dos_setProcessId(const uint16 pid);
void dos_mcbInfo(void);
uint16 dos_lastFreeBlock(void);
size_t dos_envSize(void);

#endif // DOSFUNC_H
