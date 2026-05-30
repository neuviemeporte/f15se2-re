#ifndef SASSERT_H
#define SASSERT_H

#if (F15_COMPILER == F15_COMPILER_MSC51) || defined(F15_USE_STDLIB16_STUBS)
  #define SA_CAT2_(a,b) a##b
  #define SA_CAT2(a,b)  SA_CAT2_(a,b)
  #define STATIC_ASSERT(expr) typedef char SA_CAT2(sa_, __LINE__)[(expr) ? 1 : -1]
  // msg can't be expressed in MSC 5.1 so we skip the msg
  #define STATIC_ASSERT_MSG(expr, msg) typedef char SA_CAT2(sa_, __LINE__)[(expr) ? 1 : -1]
#else
  #include <assert.h>
  #define STATIC_ASSERT(expr) static_assert((expr), #expr)
  #define STATIC_ASSERT_MSG(expr, msg) static_assert((expr), msg)
#endif

#if defined(__cplusplus)
#else
#endif
    
// example usage
// STATIC_ASSERT(sizeof(SomeStruct)==0x32);

#endif /* SASSERT_H */
