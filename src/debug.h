#ifndef F15_SE2_DEBUG
#define F15_SE2_DEBUG

#include <stdlib.h>
#include "pointers.h"

#ifdef DEBUG
void my_trace(const char* fmt, ...);
void my_fartrace(const char FAR *msg);
void dumpbuf(const char *filename, const char far *buf, uint32 size);
void changeext(char *filename, const char *ext);
void log_close();
#define TRACE(x) do { } while(0)
#define TRACE_KEY(x) my_trace x
#else
#define TRACE(x)
#define TRACE_KEY(x)
#endif // DEBUG

#endif // F15_SE2_DEBUG
