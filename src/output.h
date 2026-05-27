#ifndef OUTPUT_H
#define OUTPUT_H

#include "inttype.h"
#include "pointers.h"

#include <dos.h>
#include <stddef.h>

void log_open(bool append);
void log_close();

void INFO(const char *format, ...);
void ERROR(const char *format, ...);
void FATAL(const char *format, ...);
void DEBUG(const char *format, ...);
void dumpregs(const union REGS *regs);
void hexdump(const void FAR *buf, const size_t size, const size_t off, const int header);

#endif // OUTPUT_H
