#ifndef F15_SE2_DEBUG
#define F15_SE2_DEBUG

#include <STDLIB.H>

#ifdef DEBUG
void my_trace(const char* fmt, ...);
void my_fartrace(const char FAR *msg);
void dumpbuf(const char *filename, const char* buf, const size_t size);
#define TRACE(x) my_trace x
#else
#define TRACE(x)
#endif // DEBUG

#endif // F15_SE2_DEBUG
