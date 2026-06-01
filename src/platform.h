#ifndef F15_PLATFORM_H
#define F15_PLATFORM_H

#define F15_MEMORY_MODEL_HUGE 0
#define F15_MEMORY_MODEL_LARGE 1
#define F15_MEMORY_MODEL_COMPACT 2
#define F15_MEMORY_MODEL_MEDIUM 3
#define F15_MEMORY_MODEL_SMALL 4
#define F15_MEMORY_MODEL_TINY 5

#if defined(MSDOS)
  #if defined(_M_I86HM) || defined(M_I86HM)
    #define F15_DOS_MEMORY_MODEL F15_MEMORY_MODEL_HUGE
  #elif defined(_M_I86LM) || defined(M_I86LM)
    #define F15_DOS_MEMORY_MODEL F15_MEMORY_MODEL_LARGE
  #elif defined(_M_I86CM) || defined(M_I86CM)
    #define F15_DOS_MEMORY_MODEL F15_MEMORY_MODEL_COMPACT
  #elif defined(_M_I86MM) || defined(M_I86MM)
    #define F15_DOS_MEMORY_MODEL F15_MEMORY_MODEL_MEDIUM
  #elif defined(_M_I86SM) || defined(M_I86SM)
    #define F15_DOS_MEMORY_MODEL F15_MEMORY_MODEL_SMALL
  #elif defined(_M_I86TM) || defined(M_I86TM)
    #define F15_DOS_MEMORY_MODEL F15_MEMORY_MODEL_TINY
  #else
    #error Unknown memory model
  #endif
  #if F15_DOS_MEMORY_MODEL != F15_MEMORY_MODEL_SMALL
    #error Wrong memory model
  #endif
#endif

#if defined(MSDOS)
  #define F15_PTR_BITS 16
#else
  #if defined(_WIN64) || defined(_M_X64) || defined(_M_AMD64) || defined(__x86_64__) || defined(__amd64__) || defined(__aarch64__) || defined(_M_ARM64)
    #define F15_PTR_BITS 64
  #elif defined(__SIZEOF_POINTER__) && (__SIZEOF_POINTER__ == 8)
    #define F15_PTR_BITS 64
  #elif defined(__SIZEOF_POINTER__) && (__SIZEOF_POINTER__ == 4)
    #define F15_PTR_BITS 32
  #elif defined(_WIN32) || defined(_M_IX86) || defined(__i386__) || defined(__386__)
    #define F15_PTR_BITS 32
  #else
    #error Cannot detect pointer width
  #endif
#endif

#if defined(MSDOS)
  #define F15_EQUAL_BINARY
#endif

#define F15_TARGET_MSDOS 0
#define F15_TARGET_LINUX 1
#define F15_TARGET_WINDOWS 2

#if !defined(MSDOS)
  #define register
#endif

#endif // F15_PLATFORM_H
