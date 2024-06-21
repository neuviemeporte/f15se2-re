#define SENTINEL 1
//#define MOCK_STARTUP 1
#define IMPORT_LIBC 1
#define LIBC_OVERRIDE 1

#ifdef LIBC_OVERRIDE
void itoa() {}
void _setargv() {}
void _setenvp() {}
void strcat() {}
void strcpy() {}
void memcpy() {}
#endif

#ifdef IMPORT_LIBC
void exit();
void getch();
void fclose();
void fopen();
void fread();
void fwrite();
void lseek();
void strcmp();
void getche();
void movedata();
void inp();
void putch();
void abs();
void srand();
void rand();

void _aNldiv();
void _aNlmul();
void _aNlrem();
void _aNNaldiv();
#endif


#ifdef SENTINEL
/* initialized data */
const char foobar[] = "hello_c_data";
int barfoo = 0xabcd;
const char foobaz[] = "something_else";
/* uninitialized (BSS) data */
int x;
int y;
#endif

#ifdef MOCK_STARTUP
int _acrtused; // trick linker into thinking startup code is already there
#endif

void flushall();
void fflush();

int main() {
#ifdef IMPORT_LIBC
    rand();
    fclose();
    fopen();
    fread();
    fwrite();
    lseek();
    strcmp();
    getche();
    getch();
    movedata();
    inp();
    putch();
    abs();
    srand();

    _aNldiv();
    _aNlmul();
    _aNlrem();
    _aNNaldiv();

    exit();
#endif
    x = 1;
    y = 2;
    return 0;
}

