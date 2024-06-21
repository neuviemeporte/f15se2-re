#ifndef DOSFUNC_H
#define DOSFUNC_H

#include "inttype.h"
#include "pointers.h"
#include <STDDEF.H>

uint16 dos_alloc(const size_t paragraphs);
int dos_free(const uint16 segment);
uint16 dos_resize(const uint16 segment, uint16 newsize);
size_t dos_getfree(void);
int dos_loadOverlay(const char* file, const uint16 segment);
int dos_runProgram(const char* file, const char FAR* cmdline);
int dos_loadProgram(const char* file, const char FAR* cmdline, uint16 *cs, uint16 *ss);
int dos_getReturnCode(void);
uint16 dos_getProcessId(void);
int dos_setProcessId(const uint16 pid);
void dos_mcbInfo(void);
uint16 dos_lastFreeBlock(void);
size_t dos_envSize(void);

#endif //DOSFUNC_H
