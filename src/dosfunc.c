#include "dosfunc.h"
#include "inttype.h"
#include "output.h"
#include "memory.h"
#include "util.h"
#include "offsets.h"

#include <STDIO.H>
#include <DOS.H>
#include <STDDEF.H>
#include <STDLIB.H>
#include <ASSERT.H>

typedef enum {
    DOSF_ALLOCMEM = 0x48,
    DOSF_FREEMEM = 0x49,
    DOSF_RESIZEMEM = 0x4a,
    DOSF_LOADPROG = 0x4b,
    DOSF_RETURNCODE = 0x4d,
    DOSF_SYSVARS = 0x52,
} DosFunctions;

typedef enum {
    DOSERR_NONE = 0x00, // (0)   no error
    DOSERR_INVFUNC = 0x01, // (1)   function number invalid
    DOSERR_FILENF = 0x02, // (2)   file not found
    DOSERR_PATHNF = 0x03, // (3)   path not found
    DOSERR_HANDLES = 0x04, // (4)   too many open files (no handles available)
    DOSERR_ACCESS = 0x05, // (5)   access denied
    DOSERR_BADHANDLE = 0x06, // (6)   invalid handle
    DOSERR_MCBDEST = 0x07, // (7)   memory control block destroyed
    DOSERR_NOMEM = 0x08, // (8)   insufficient memory
    DOSERR_MCBINV = 0x09, // (9)   memory block address invalid
    DOSERR_ENVINV = 0x0A, // (10)  environment invalid (usually >32K in length)
    DOSERR_FMTINV = 0x0B, // (11)  format invalid
    DOSERR_AXSCODEINV = 0x0C, // (12)  access code invalid
    DOSERR_DATAINV = 0x0D, // (13)  data invalid
    DOSERR_RESERVED = 0x0E, // (14)  reserved
    DOSERR_OFLOW = 0x0E, // (14)  (PTS-DOS 6.51+, S/DOS 1.0+) fixup overflow
    DOSERR_DRIVEINV = 0x0F, // (15)  invalid drive
    DOSERR_RMDIRCUR = 0x10, // (16)  attempted to remove current directory
    DOSERR_NSAMEDEV = 0x11, // (17)  not same device
    DOSERR_FILESNMORE = 0x12, // (18)  no more files
} DosError;

#define PID_NONE 0
#define PID_DOS 8

static union REGS rin, rout;
static struct SREGS sreg;

uint16 dos_alloc(const size_t paragraphs) {
    int err;
    rin.h.ah = DOSF_ALLOCMEM;
    rin.x.bx = paragraphs;
    err = intdos(&rin, &rout);
    assert(err == rout.x.ax);
    if (rout.x.cflag != 0) {
        ERROR("dos_alloc: error allocating %up (%lu): error 0x%x, max avail %u", paragraphs, PARA_TO_BYTES(paragraphs), (int)err, rout.x.bx);
        return 0;
    }
    return rout.x.ax;
}

int dos_free(const uint16 segment) {
    int err;
    rin.h.ah = DOSF_FREEMEM;
    sreg.es = segment;
    err = intdosx(&rin, &rout, &sreg);
    // RBIL: "Apparently [int 21/49hhj] never returns an error 07h, despite official docs; DOS 2.1+ code contains only an error 09h exit. 
    // DOS 2.1-6.0 does not coalesce adjacent free blocks when a block is freed, only when a block is allocated or resized. 
    // The code for this function is identical in DOS 2.1-6.0 except for calls to start/end a critical section in DOS 3.0+""
    if (rout.x.cflag != 0) {
        ERROR("dos_free: error freeing segment 0x%x: error 0x%x", segment, (int)err);
        return err;
    }
    return 0;
}

uint16 dos_resize(const uint16 segment, uint16 newsize) {
    int err;
    rin.h.ah = DOSF_RESIZEMEM;
    rin.x.bx = newsize;
    sreg.es = segment;
    err = intdosx(&rin, &rout, &sreg);
    assert(err == rout.x.ax);
    if (rout.x.cflag != 0) {
        ERROR("dos_resize: error resizing segment 0x%x to %u - error 0x%x max avail %u", segment, newsize, rout.x.ax, rout.x.bx);
        return rout.x.bx;
    }
    return 0;
}

size_t dos_getfree(void) {
    int err;
    rin.h.ah = DOSF_ALLOCMEM;
    rin.x.bx = 0xffff; // 1,048,560 bytes
    err = intdos(&rin, &rout);
    // we expect the call to fail
    if (rout.x.cflag == 0) {
        ERROR("dos_getfree(): unexpected: succeeded in allocating 0xffff paragraphs?");
        return 0;
    }
    return rout.x.bx;
}

// Format of EXEC parameter block for AL=00h,01h,04h: 
// Offset Size Description (Table 01590) 
// 00h WORD segment of environment to copy for child process (copy caller's environment if 0000h) 
// 02h DWORD pointer to command tail to be copied into child's PSP 
// 06h DWORD pointer to first FCB to be copied into child's PSP 
// 0Ah DWORD pointer to second FCB to be copied into child's PSP 
// 0Eh DWORD (AL=01h) will hold subprogram's initial SS:SP on return 
// 12h DWORD (AL=01h) will hold entry point (CS:IP) on return
#pragma pack(1)
struct {
    uint16 envSegment;
    uint16 cmdlineOffset;
    uint16 cmdlineSegment;
    uint16 fcb1Offset;
    uint16 fcb1Segment;
    uint16 fcb2Offset;
    uint16 fcb2Segment;
    uint16 sp;
    uint16 ss;
    uint16 ip;
    uint16 cs;
} exeLoadParams;

#pragma pack(1)
struct {
    uint16 segment;
    uint16 reloc;
} ovlLoadParams;

#define DOS_LOAD_EXEC 0
#define DOS_LOAD_NOEXEC 1
#define DOS_LOAD_OVL 3

static int loadprog(const char* file, const uint16 segment, const uint8 type, const char FAR* cmdline) {
    int err;
    rin.h.ah = DOSF_LOADPROG;
    rin.h.al = type;
    rin.x.dx = (unsigned int)file;
    switch (type)
    {
    case DOS_LOAD_EXEC:
    case DOS_LOAD_NOEXEC:
        exeLoadParams.envSegment = 0; // 0 - copy caller's environment
        exeLoadParams.cmdlineOffset = FP_OFF(cmdline);
        exeLoadParams.cmdlineSegment = FP_SEG(cmdline);
        // the two FCBs are located at offsets 0x5c and 0x6c in this program's PSP
        exeLoadParams.fcb1Offset = 0x5c;
        exeLoadParams.fcb1Segment = _psp;
        exeLoadParams.fcb2Offset = 0x6c;
        exeLoadParams.fcb2Segment = _psp;
        rin.x.bx = (unsigned int)&exeLoadParams;
        if (DOS_LOAD_EXEC)
            DEBUG("dos_loadprog(): loading %s and executing with cmdline '%Fs'", file, cmdline);
        else
            DEBUG("dos_loadprog(): loading %s with cmdline '%Fs'", file, cmdline);            
        break;
    case DOS_LOAD_OVL:
        ovlLoadParams.segment = segment;
        ovlLoadParams.reloc = segment; // no idea, original does the same
        rin.x.bx = (unsigned int)&ovlLoadParams;
        INFO("dos_loadprog(): loading %s at segment 0x%x as overlay", file, segment);
        break;
    default:
        ERROR("dos_loadprog(): unsupported load type: 0x%hx", type);
        return DOSERR_INVFUNC;
    }
    err = intdos(&rin, &rout);
    if (rout.x.cflag != 0) {
        ERROR("dos_loadprog: unable to load %s at 0x%x, error 0x%x", file, segment, err);
        return err;
    }
    DEBUG("dos_loadprog(): success, ax = 0x%x, cs:ip = %X:%X, ss:sp = %X:%X", rout.x.ax, 
        exeLoadParams.cs, exeLoadParams.ip, exeLoadParams.ss, exeLoadParams.sp);
    return 0;
}

int dos_loadOverlay(const char* file, const uint16 segment) {
    return loadprog(file, segment, DOS_LOAD_OVL, NULL);
}

int dos_runProgram(const char* file, const char FAR* cmdline) {
    return loadprog(file, 0, DOS_LOAD_EXEC, cmdline);
}

int dos_loadProgram(const char* file, const char FAR* cmdline, uint16 *cs, uint16 *ss) {
    int err;
    if ((err = loadprog(file, 0, DOS_LOAD_NOEXEC, cmdline)) != 0)
        return err;
    *cs = exeLoadParams.cs;
    *ss = exeLoadParams.ss;
    return 0;
}

int dos_getReturnCode(void) {
    int err;
    rin.h.ah = DOSF_RETURNCODE;
    err = intdos(&rin, &rout);
    // AH = termination type
    // 00h normal (INT 20,INT 21/AH=00h, or INT 21/AH=4Ch)
    // 01h control-C abort
    // 02h critical error abort
    // 03h terminate and stay resident (INT 21/AH=31h or INT 27)
    // AL = return code
    return rout.h.al;
}

uint16 dos_getProcessId(void) {

}

int dos_setProcessId(const uint16 pid) {

}

#pragma pack(1)
struct MCB {
    char type;
    uint16 pid;
    uint16 size;
    uint8 reserved[3];
    char desc[8];
};

static uint8 FAR* dos_sysvars(void) {
    rin.h.ah = DOSF_SYSVARS; 
    intdosx(&rin, &rout, &sreg);
    return MK_FP(sreg.es, rout.x.bx);
}

void dos_mcbInfo(void) {
    uint16 segment = 0;
    uint8 FAR *lol = NULL;
    struct MCB FAR *mcb = NULL;
    size_t total = 0, alloc = 0, free = 0;
    int i = 0;
    char strbuf[128];
    // get segment of first mcb from list of lists
    lol = dos_sysvars();
    // first mcb's segment is in LoL at offset -2
    segment = *((uint16 FAR*)(lol - 2));
    mcb = MK_FP(segment, 0);
    INFO("Walking the MCB chain, LoL @ %p", lol);
    while (mcb) {
        switch (mcb->type) {
        case 'M':
        case 'Z':
            total += mcb->size;
            sprintf(strbuf, "desc = '%.8Fs'", mcb->desc);
            switch(mcb->pid) {
            case PID_NONE:
                strcat(strbuf, " <--- free");
                free += mcb->size;
                break;
            case PID_DOS:
                strcat(strbuf, " <--- DOS");
                // fall through
            default:
                alloc += mcb->size;
            }
            INFO("#%03d [0x%04x]: pid = 0x%04x, size = %05up, %s", i++, segment, mcb->pid, mcb->size, strbuf);
            break;
        default:
            ERROR("unexpected MCB type: %Xh", mcb->type);
            return;
        }
        if (mcb->type == 'Z') { // last mcb
            mcb = NULL;
        }
        else { // next mcb
            segment += mcb->size + 1;
            mcb = MK_FP(segment, 0);
        }
    }
    sprintf(strbuf, "summary: total %s", sizeString(total));
    sprintf(strbuf + strlen(strbuf), ", alloc %s", sizeString(alloc));
    sprintf(strbuf + strlen(strbuf), ", free %s",  sizeString(free));
    INFO("%s", strbuf);
}

uint16 dos_lastFreeBlock(void) {
    uint16 segment = 0;
    uint8 FAR *lol = NULL;
    struct MCB FAR *mcb = NULL;
    // get segment of first mcb from list of lists
    lol = dos_sysvars();
    // first mcb's segment is in LoL at offset -2
    segment = *((uint16 FAR*)(lol - 2));
    mcb = MK_FP(segment, 0);
    while (mcb) {
        switch (mcb->type) {
        case 'M':
            break;
        case 'Z':
            if (mcb->pid == PID_NONE)
                return segment;
            else
                return 0;
            break;
        default:
            ERROR("unexpected MCB type: %Xh", mcb->type);
            return;
        }
        if (mcb->type == 'Z') { // last mcb
            mcb = NULL;
        }
        else { // next mcb
            segment += mcb->size + 1;
            mcb = MK_FP(segment, 0);
        }
    }
    return 0;
}

size_t dos_envSize(void) {
    const size_t envSegment = *(const uint16 FAR*)MK_FP(_psp, 0x2c);
    const struct MCB FAR *envMcb = MK_FP(envSegment - 1, 0);
    return envMcb->size;
}
