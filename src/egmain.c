// seg000 debug code (/Zi)
#include "egame.h"
#include "offsets.h"
#include "pointers.h"
#include "debug.h"
#include "slot.h"
#include "const.h"
#include "comm.h"

#include <dos.h>
#include <conio.h>
#include <bios.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// ==== seg000:0x10 ====
int main(void) {
    uint16 FAR *commPtr;
    TRACE(("egame main: entering"));
    TRACE(("egame main: start, about to read commPtr"));
    FP_SEG(commPtr) = SEG_LOWMEM;
    FP_OFF(commPtr) = OFF_IACA_START;
    FP_SEG(commData) = *commPtr;
    FP_OFF(commData) = 0;
    FP_SEG(gameData) = *commPtr;
    FP_OFF(gameData) = COMM_GAMEDATA_OFFSET;
    TRACE(("egame main: commData=%04x:%04x gameData=%04x:%04x", FP_SEG(commData), FP_OFF(commData), FP_SEG(gameData), FP_OFF(gameData)));
    // 0x43
    TRACE(("egame main: setup overlays"));
    setupOverlaySlots(commData->gfxOvlAddr);
    setupOverlaySlots(commData->miscOvlAddr);
    setupOverlaySlots(commData->sndOvlAddr);
    // 0x6d
    hercFlag = commData->setupMono;
    gfxModeUnset = commData->gfxModeNum == 0;
    // 0x7c
    TRACE(("egame main: install cbreak"));
    installCBreakHandler();
    if (commData->setupUseJoy == 1) {
        // 0x93
        copyJoystickData(commData->joyData);
    }
    else { // 0x9d
        joyAxes[0] = joyAxes[1] = 0x80;
    }
    // 0xa5
    TRACE(("egame main: gfxInit"));
    gfxInit();
    TRACE(("egame main: after gfxInit"));
    gfx_initOverlay();
    gfx_setMonoFlag(commData->setupMono);
    if (gameData->theater < 2) { // 0xc8
        gfx_setFadeSteps(0xc);
    }
    else { // 0xd6
        gfx_setFadeSteps(0x10);
    }
    // 0xea
    gfxBufPtr = commData->gfxInitResult;
    sub_21A7E();
    TRACE(("egame main: drawCockpit"));
    drawCockpit();
    TRACE(("egame main: sub_10211"));
    sub_10211();
    if (commData->setupUseJoy == 1) {
        // 10c
        restoreJoystickData(commData->joyData);
    }
    restoreCBreakHandler();
    if (exitCode == 0) {
        regs.h.ah = 0;
        regs.h.al = 3;
        // 0x131
        int86(IRQ_VIDEO, &regs, &regs);
    }
    // 13d
    TRACE(("egame main: exiting with code %d", exitCode));
    exit(exitCode);
}

// ==== seg000:0x147 ====
void drawCockpit() {
    TRACE(("drawCockpit: enter, theater=%d", gameData->theater));
    sub_11E0E();
    load15Flt3d3();
    // 0x162
    TRACE(("drawCockpit: after load15Flt3d3, scenPlh0=%04x, scenarioPlh@%04x", (unsigned)scenarioPlh[0], (unsigned)&scenarioPlh[0]));
    strcpy(regnStr, scenarioPlh[gameData->theater]);
    TRACE(("drawCockpit: regnStr=%s", regnStr));
    TRACE(("drawCockpit: calling sub_121C6"));
    sub_121C6();
    TRACE(("drawCockpit: after sub_121C6"));
    // 0x16e
    f15DgtlResult = loadF15DgtlBin();
    TRACE(("drawCockpit: f15DgtlResult=%d", f15DgtlResult));
    // 0x179
    byte_34197 = byte_228D0[0x2f];
    // 17c
    if ((byte_32933 = gfx_getModeFlag()) != 0) {
        setupDac();
    }
     gfx_jump_44_setDac(1);
     gfx_jump_45_retrace();
     TRACE(("drawCockpit: opening pic"));
     // 1a1
     if (gfx_jump_3f_modecode() == 3) {
        openBlitClosePic(a256pit_pic, 1);
     }
     else {
        openBlitClosePic(aCockpit_pic, 1);
     }
     TRACE(("drawCockpit: pic done"));
     // 1df
     gfx_copyRect(1, 0, 0x60, 0, 0, 0x60, 0x140, 0x68);
     gfx_copyRect(1, 0, 0x60, 2, 0, 0x60, 0x140, 0x68);
     TRACE(("drawCockpit: done"));
}

// ==== seg000:0x211 ====
int sub_10211() {
    FP_OFF(dword_38FE2) = OFF_BDA_FLOPPYMOTOR; // floppy motor runtime in bda???
    FP_SEG(dword_38FE2) = 0;
    // 224
    if (*dword_38FE2 > 1) {
        *dword_38FE2 = 1;
    }
    audio_jump_65();
    // 241
    audio_jump_64(*(int16 FAR*)(OFF_IACA_UNK), f15DgtlResult);
    setTimerIrqHandler();
    // 250
    if (commData->setupUseJoy == 0) {
        setInt9Handler();
    }
    sub_13C3B();
    moveDataFar();
    // 266
    if (commData->setupUseJoy == 0) {
        restoreInt9Handler();
    }
    // 276
    gfx_setDacAnimCount(1);
    sub_12278(2);
    restoreTimerIrqHandler();
    audio_jump_65();
}

// ==== seg000:0x0294 routine_6 ====
int sub_10294() {
}

// ==== seg000:0x0297 routine_5 ====
int sub_10297() {
}

// ==== seg000:0x29a ====
void gfxInit() {
    int var_2;
    gfx_jump_0_alloc(0);
    var_2 = gfx_jump_0_alloc(1);
    gfx_jump_4b_storeBufPtr(var_2, 1);
    gfx_jump_4b_storeBufPtr(commData->gfxInitResult, 2);
}

// TODO: sub_10720 (seg000:0720-14e7) - large unimplemented function
// Once implemented, the register spill from this function may affect sub_114E8 codegen

// ==== seg000:0x14e8 ====
void sub_114E8(void) {
    int p, a, b, c, d, e, f, g;
    keyDispatch(keyScancode);
}

// ==== seg000:0x1636 ====
void sub_11636(void) {
    int p;
    for (p = 0; p < 4; p++) {
        if (*((int16 *)((char *)&word_333DA + p * 12)) != 0) {
            (*((int16 *)((char *)&word_333DA + p * 12)))--;
            if (*((int16 *)((char *)&word_333DA + p * 12)) == 0) {
                *((int16 *)((char *)&word_333D8 + p * 12)) = 0;
            }
        }
    }
}

void sub_11676(void) {
    register int p;
    int a;
    int b;
    int c;
    int d;
    int e;

    for (c = 0; c < word_3AFA4 + 4; c++) {
        p = c * 12;
        if (*((int16 *)((char *)&word_3C5AC + p)) != 0) {
            *((int16 *)((char *)&word_3C5AC + p)) += *((int16 *)((char *)&word_3C5B2 + p));
            *((int16 *)((char *)&word_3C5AE + p)) += *((int16 *)((char *)&word_3C5B4 + p));
            *((int16 *)((char *)&word_3C5B0 + p)) += *((int16 *)((char *)&word_3C5B6 + p));
        }
    }
    if (!(word_336E8 & 1)) {
        return;
    }
    e = (word_336E8 >> 1) % word_3AFA4;
    a = sub_1D21E(0);
    if (!a) goto no_fire;
    if (word_330B4 <= 0) goto no_fire;
    if (word_3BE3C != 0) goto no_fire;
    word_330B4 = sub_1CF64(word_330B4 - 40 / word_330C4, 0, 1000);
    makeSound(4, 2);
    d = 186 / word_330C4;
    *((int16 *)((char *)&word_3C5B6 + e * 12)) = sub_1D178(var_544, d) << 5;
    d = sub_1D190(var_544, d);
    *((int16 *)((char *)&word_3C5B2 + e * 12)) = sub_1D178(var_542, d);
    *((int16 *)((char *)&word_3C5B4 + e * 12)) = -sub_1D190(var_542, d);
    p = e * 12;
    *((int16 *)((char *)&word_3C5AC + p)) = *((int16 *)((char *)&word_3C5B2 + p)) + word_3BEC0;
    *((int16 *)((char *)&word_3C5AE + p)) = *((int16 *)((char *)&word_3C5B4 + p)) + word_3BED0;
    *((int16 *)((char *)&word_3C5B0 + p)) = *((int16 *)((char *)&word_3C5B6 + p)) + var_547 - 2;
    word_38FE8 = 1;
    goto done_fire;
no_fire:
    *((int16 *)((char *)&word_3C5AC + e * 12)) = 0;
    word_38FE8 = 0;
done_fire:
    if (a) {
        strcpy(strBuf, aGun);
        strcat(strBuf, itoa(word_330B4, unk_3C030, 10));
        sub_1A204(strBuf);
    }
}

// ==== seg000:0x1841 ====
int sub_11841() {
    int p;
    int a;

    if (word_336F6 != -1) {
        for (p = 0; p < 8; p++) {
            ((struct struc_9 *)stru_33402)[p].field_4 += 0x0a;
            ((struct struc_9 *)stru_33402)[p].field_2 += ((struct struc_9 *)stru_33402)[p].field_4 >> 9;
            *(((char *)&((struct struc_9 *)stru_33402)[p].field_6) + 1) += 6;
        }
        if (!((char)word_336E8 & 0x0f)) {
            a = (word_336E8 >> 4) & 7;
            ((struct struc_9 *)stru_33402)[a].field_0 = *(int16 *)((char *)stru_3AA5E + word_336F6 * 16);
            ((struct struc_9 *)stru_33402)[a].field_2 = *(int16 *)((char *)stru_3AA5E + word_336F6 * 16 + 2);
            ((struct struc_9 *)stru_33402)[a].field_4 = 0x80;
            ((struct struc_9 *)stru_33402)[a].field_6 = sub_1D200(0x100) << 8;
            word_33442 = a;
        }
    }
}

// ==== seg000:0x18d5 ====
int sub_118D5() {
    if (word_3BFA2 > 0) {
        if (word_3B4DC > -16) {
            word_3B4DC -= 12;
        }
        word_3BFA2 += word_3B4DC;
    }
}

// ==== seg000:0x18f6 ====
void sub_118F6(void) {
    int p, a, b, c;

    sub_1D1E8();
    sub_18E38();
    word_336E8 = sub_1D200(0x1000) & 0x7ff8;
    p = word_3B14C + word_3B15E;
    word_330BC = (gameData->theater == 6 ? 5 : 9) < sub_1D200(0x10);
    if (word_330BC && byte_32933) {
        setupDac();
    }
    word_38F70 = (p & 0xF) << 8;
    word_38FE0 = 0;
}

// ==== seg000:0x1971 ====
int sub_11971() {
    int p;
    for (p = 0; p < word_3C046; p++) {
        *(int *)((char *)&stru_3B208[p] + 26) = -1;
    }
    word_336E6 = -1;
}

// ==== seg000:0x19a3 ====
void sub_119A3() {
    int p;
    char far *b;

    p = word_3BF90 = word_33096 = 0;
    for (; p < 3; p++) {
        b = (char far *)commData + p * 2;
        ((int16 *)&missileSpecIndex)[p * 2] = *(int16 far *)(b + 0x38);
        ((int16 *)&missileSpecIndex)[p * 2 + 1] = *(int16 far *)(b + 0x40);
    }
    word_330B4 = 0x3e8;
    word_33098 = 0x2710;
    word_3309E = 0x12;
    word_3309C = 0x0c;
    sub_11A18();
    sub_1606C();
    sub_15FDB();
}

// ==== seg000:0x1a18 routine_131 ====
void sub_11A18() {
    int p;
    int a;

    if (word_330C2 == 0) {
        return;
    }
    for (a = 0; a < 3; a++) {
        sub_19E44(0);
        p = (&word_38202)[a];
        sub_19E5D(p - 1, 0xbe, p + 2, (int)&allocSize);
        sub_1A183((&missileSpecIndex)[a * 2 + 1], p, 0xbe, 0x0c);
    }
}

// ==== seg000:0x1a88 ====
void sub_11A88(int param_1) {
    if (word_330C2 == 0) return;
    var_564[2] = 0;
    sub_19BE1(((int *)asc_33744)[word_3374A], 0xc4, ((int *)asc_33744)[word_3374A] + 6, 0xc4);
    var_564[2] = 7;
    sub_19BE1(((int *)asc_33744)[word_3374A], 0xc5, ((int *)asc_33744)[word_3374A] + 6, 0xc5);
    var_564[2] = 0x0c;
    sub_19BE1(((int *)asc_33744)[param_1], 0xc4, ((int *)asc_33744)[param_1] + 6, 0xc4);
    var_564[2] = 4;
    sub_19BE1(((int *)asc_33744)[param_1], 0xc5, ((int *)asc_33744)[param_1] + 6, 0xc5);
    word_3374A = param_1;
}

// ==== seg000:0x1b37 routine_148 ====
void sub_11B37(int arg_0) {
    if (word_3BE3C != 0 && arg_0 != 0) {
        return;
    }
    *((uint8 *)&word_3C6AC + 0x204) = 1;
    commData->continueFlag = arg_0;
    if (arg_0 == 0 && word_3BE3C == 0) {
        commData->setupDone = 3;
    }
    *(int16 far *)((char far *)commData + 0x74) = word_3BEC0;
    *(int16 far *)((char far *)commData + 0x76) = word_3BED0;
    *(int16 far *)((char far *)commData + 0x34) = word_33096;
    *(int16 far *)((char far *)commData + 0x36) = word_3BF90;
    commData->unk8[0] = word_38FF6;
    commData->unk8[1] = word_33710;
    sub_11D10(8, 0);
}

// ==== seg000:0x1bc3 ====
void sub_11BC3(int arg_0, unsigned int arg_2) {
    if (arg_2 > (unsigned int)word_3370E) return;
    if (word_3370C != -1) return;
    word_3C02E = arg_0;
    sub_11BFD(0x89, word_3370E == 1 ? 3 : 4);
}

// ==== seg000:0x1bfd scheduleTimedEvent ====
void sub_11BFD(int arg_0, int arg_2) {
    if (word_3370E == 0) {
        return;
    }
    keyValue = arg_0;
    word_3370C = arg_2 * word_330C4 + word_336E8;
}

// ==== seg000:0x1c21 routine_180 ====
void sub_11C21(void) {
    int p;

    if (word_3370C != -1) {
        return;
    }
    word_330B6 = 500;
    word_3370E = 2;
    switch (sub_1D200(3)) {
    case 0:
        p = sub_1D200(word_3BED2 - 3) + 3;
        word_3C02E = p + 0x40;
        keyValue = 0x89;
        placeString(p);
        tempStrcpy((char *)strBuf);
        break;
    case 1:
        do {
            p = sub_1D200(word_3C046);
        } while (*(int16 *)&stru_3B208[p].field_10[10] == 0);
        word_3C02E = p + 0x20;
        keyValue = 0x89;
        strcpy((char *)strBuf, (char *)(*(int16 *)&stru_3B208[p].field_10[6] * 32 + 0x2c8)); /* 0x2c8: aircraft name table (32-byte records) */
        strcat((char *)strBuf, (char *)aOnPatrol);
        tempStrcpy((char *)strBuf);
        break;
    case 2:
        keyValue = 0x87;
        tempStrcpy((char *)aF15StrikeEagle);
        break;
    }
}

// ==== seg000:0x1d10 ====
void sub_11D10(int arg_0, int arg_2) {
    if (var_654 >= 255) {
        return;
    }
    *(int *)&byte_3B7FC[var_654 * 6] = word_38FE0;
    byte_3B7FC[var_654 * 6 + 2] = (unsigned)word_3BEC0 >> 7;
    byte_3B7FC[var_654 * 6 + 3] = (unsigned)word_3BED0 >> 7;
    byte_3B7FC[var_654 * 6 + 4] = arg_0;
    byte_3B7FC[var_654 * 6 + 5] = arg_2;
    var_654++;
    byte_3B7FC[var_654 * 6 + 4] = 0;
}

// ==== seg000:0x1d6e placeString ====
void placeString(int param_1) {
    strcpy(strBuf, word_3C0A2[(stru_3AA5E[param_1].field_C) & 0x7f]);
    if (strlen(word_3C0A2[(&word_3AA5C)[param_1 * 8]])) {
        if (strlen(word_3C0A2[(stru_3AA5E[param_1].field_C) & 0x7f])) {
            strcat(strBuf, aAt);
        }
        strcat(strBuf, word_3C0A2[(&word_3AA5C)[param_1 * 8]]);
    }
    if ((int)strlen(strBuf) > 25) {
        byte_38F8C = '.';
        byte_38F8D[0] = 0;
    }
}

// ==== seg000:0x1e0e ====
int sub_11E0E() {
    int var_2, var_4;
    setCommWorldbufPtr();
    flagFarToNear = 1;
    // 1e1e
    moveStuff();
    word_3C0A2[0] = byte_3C16E;
    var_2 = 1;
    // 1e2c
    for (var_4 = 0; var_4 < 750; ++var_4) {
        // 1e40
        if (byte_3C16E[var_4] == 0 && var_2 < 100) {
            word_3C0A2[var_2++] = &byte_3C16E[var_4+1];
        }
    } // 1e61
    if (gameData->difficulty != 0) { //1e6c
        // 1e8c
        dword_3B7DA = ((int32)(stru_3AA5E[word_3B148].field_0) << 5) + 2;
        // 1eb1
        dword_3B7F8 = (0x8000 - (int32)(stru_3AA5E[word_3B148].field_2)) << 5;
    }
    else { // 1eba
        // 1ed1
        dword_3B7DA = ((int32)waypoints[0].field_0 << 5) + 2;
        // 1ef5
        dword_3B7F8 = (0x8000 - (int32)waypoints[0].field_2) << 5;
    } // 1efc
    // 1f15
    word_3BEC0 = (dword_3B7DA + 0x10) >> 5;
    // 1f36
    word_3BED0 = 0x8000 - ((dword_3B7F8 + 0x10) >> 5);
}

// ==== seg000:0x1f3e ====
void sub_11F3E() {
    int a;
    int p;

    a = var_143;
    for (p = 0; p < 2; p++) {
        if (word_3B14A[p * 9] >> 8 != 0) {
            word_39808 = sub_12FDA(
                (unsigned long)(unsigned)stru_3AA5E[(&word_3B146)[p * 9]].field_0 << 5,
                (0x8000L - (unsigned long)(unsigned)stru_3AA5E[(&word_3B146)[p * 9]].field_2) << 5);
            if (word_39808 != 0) {
                byte_3BFA4[a] = byte_3BFA4[*word_39808];
                strcpy(word_3C0A2[a], (char *)word_3C0A2[*word_39808]);
                word_3C0A2[a + 1] = word_3C0A2[a] + strlen(word_3C0A2[a]) + 1;
                sub_13224((char *)word_39808, sub_1CF32(a + 0x100), a + 0x100);
            }
            stru_3AA5E[(&word_3B146)[p * 9]].field_C = a + 0x100;
            a++;
        }
    }
    word_33704 = 0;
}

// ==== seg000:0x2049 ====
int moveDataFar() {
    int unused1, unused2;
    setCommWorldbufPtr();
    flagFarToNear = 0;
    moveStuff();
    // 2063
    moveNearFar(byte_3B7FC, 0x600);
}

// ==== seg000:0x206d ====
int moveStuff() {
    moveNearFar(byte_3C02A, 1);
    moveNearFar(byte_3BEC4, 1);
    // 2094
    moveNearFar(&word_3BED2, 2);
    moveNearFar(&word_38FFA, 2);
    moveNearFar(&word_3C69E, 2);
    // 20c2
    moveNearFar(&word_3AA5C, word_3BED2 * 16);
    moveNearFar(&word_3C046, 2);
    moveNearFar(unk_3B202, word_3C046 * 0x24);
    // 20f0
    moveNearFar(byte_3BFA4, 0x64);
    moveNearFar(byte_3BED8, 0x64);
    moveNearFar(byte_3C16E, 0x2ee);
    // 211a
    moveNearFar(byte_3AFAC, 0x100);
    moveNearFar(&word_3C00C, 2);
    moveNearFar(&word_336FC, 2);
    // 2144
    moveNearFar(waypoints, 0x10);
    moveNearFar(&word_3B144, 0x24);
}

// ==== seg000:0x215c ====
int moveNearFar(void *nearPtr, int count) {
    void FAR *farPtr = nearPtr;
    if (flagFarToNear != 0) { // 2172
        movedata(FP_SEG(farPointer), FP_OFF(farPointer), FP_SEG(farPtr), FP_OFF(farPtr), count);
    }
    else { // 2187
        movedata(FP_SEG(farPtr), FP_OFF(farPtr), FP_SEG(farPointer), FP_OFF(farPointer), count);
    } // 219e
    farPointer += count;
}

// ==== seg000:0x21a9 ====
int setCommWorldbufPtr() {
    farPointer = (uint8 FAR*)&commData->worldBuf;
    return 0;
}

