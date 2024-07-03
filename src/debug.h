#ifndef F15_SE2_DEBUG
#define F15_SE2_DEBUG

#ifdef DEBUG
void TRACE(const char* fmt, ...);
#else
#define TRACE
#endif // DEBUG

#endif // F15_SE2_DEBUG
