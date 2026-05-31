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
    TRACE(("egame main: setup overlays"));
    setupOverlaySlots(commData->gfxOvlAddr);
    setupOverlaySlots(commData->miscOvlAddr);
    setupOverlaySlots(commData->sndOvlAddr);
    hercFlag = commData->setupMono;
    gfxModeUnset = commData->gfxModeNum == 0;
    TRACE(("egame main: install cbreak"));
    installCBreakHandler();
    if (commData->setupUseJoy == 1) {
        copyJoystickData(commData->joyData);
    }
    else {
        joyAxes[0] = joyAxes[1] = 0x80;
    }
    TRACE(("egame main: gfxInit"));
    gfxInit();
    TRACE(("egame main: after gfxInit"));
    TRACE(("egame main: calling initOverlay"));
    gfx_initOverlay();
    TRACE(("egame main: calling setMonoFlag"));
    gfx_setMonoFlag(commData->setupMono);
    TRACE(("egame main: calling setFadeSteps"));
    if (gameData->theater < 2) {
        gfx_setFadeSteps(0xc);
    }
    else {
        gfx_setFadeSteps(0x10);
    }
    gfxBufPtr = commData->gfxInitResult;
    sub_21A7E();
    TRACE(("egame main: drawCockpit"));
    drawCockpit();
    TRACE(("egame main: sub_10211"));
    sub_10211();
    if (commData->setupUseJoy == 1) {
        restoreJoystickData(commData->joyData);
    }
    restoreCBreakHandler();
    if (exitCode == 0) {
        regs.h.ah = 0;
        regs.h.al = 3;
        int86(IRQ_VIDEO, &regs, &regs);
    }
    TRACE(("egame main: exiting with code %d", exitCode));
    exit(exitCode);
}

// ==== seg000:0x147 ====
void drawCockpit() {
    TRACE(("drawCockpit: enter, theater=%d", gameData->theater));
    sub_11E0E();
    load15Flt3d3();
    TRACE(("drawCockpit: after load15Flt3d3, scenPlh0=%04x, scenarioPlh@%04x", (unsigned)scenarioPlh[0], (unsigned)&scenarioPlh[0]));
    strcpy(regnStr, scenarioPlh[gameData->theater]);
    TRACE(("drawCockpit: regnStr=%s", regnStr));
    TRACE(("drawCockpit: calling sub_121C6"));
    sub_121C6();
    TRACE(("drawCockpit: after sub_121C6"));
    f15DgtlResult = loadF15DgtlBin();
    TRACE(("drawCockpit: f15DgtlResult=%d", f15DgtlResult));
    byte_34197 = byte_228D0[0x2f];
    if ((byte_32933 = gfx_getModeFlag()) != 0) {
        setupDac();
    }
     gfx_setDac(1);
     gfx_waitRetrace();
     TRACE(("drawCockpit: opening pic"));
     if (gfx_getModecode() == 3) {
        openBlitClosePic(a256pit_pic, 1);
     }
     else {
        openBlitClosePic(aCockpit_pic, 1);
     }
     TRACE(("drawCockpit: pic done"));
     gfx_copyRect(1, 0, 0x60, 0, 0, 0x60, 0x140, 0x68);
     gfx_copyRect(1, 0, 0x60, 2, 0, 0x60, 0x140, 0x68);
     TRACE(("drawCockpit: done"));
}

// ==== seg000:0x211 ====
int sub_10211() {
    TRACE(("sub_10211: enter"));
    FP_OFF(dword_38FE2) = OFF_BDA_FLOPPYMOTOR; // floppy motor runtime in bda???
    FP_SEG(dword_38FE2) = 0;
    if (*dword_38FE2 > 1) {
        *dword_38FE2 = 1;
    }
    TRACE(("sub_10211: audio_jump_65"));
    audio_jump_65();
    TRACE(("sub_10211: audio_jump_64"));
    audio_jump_64(*(int16 FAR*)(OFF_IACA_UNK), f15DgtlResult);
    TRACE(("sub_10211: setTimerIrqHandler"));
    setTimerIrqHandler();
    if (commData->setupUseJoy == 0) {
        TRACE(("sub_10211: setInt9Handler"));
        setInt9Handler();
    }
    TRACE(("sub_10211: sub_13C3B (game loop)"));
    sub_13C3B();
    moveDataFar();
    if (commData->setupUseJoy == 0) {
        restoreInt9Handler();
    }
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
    TRACE(("gfxInit: allocPage(0)"));
    gfx_allocPage(0);
    TRACE(("gfxInit: allocPage(1)"));
    var_2 = gfx_allocPage(1);
    TRACE(("gfxInit: allocPage(1) returned %d", var_2));
    gfx_storeBufPtr(var_2, 1);
    gfx_storeBufPtr(commData->gfxInitResult, 2);
    TRACE(("gfxInit: done"));
}

#ifdef DEBUG
extern int var_255;
extern unsigned int var_200_off;
extern unsigned int var_200_seg;
extern unsigned char byte_3790C[];
extern int word_38FDC;
void trace_gameloop(int step) {
    if (step == 100)
        TRACE(("gameloop: step %d, var_255=%d, var200=%04x:%04x, timerC=%d", step, var_255, var_200_seg, var_200_off, (int)byte_3790C[0]));
    else if (step == 4)
        TRACE(("gameloop: step %d, 38FDC=%d", step, word_38FDC));
    else if (step == 3) {
        TRACE(("gameloop: step %d, keyScan=%04x", step, keyScancode));
    }
    else
        TRACE(("gameloop: step %d", step));
}
#endif

// ==== seg000:0x0720 ====
void sub_10720(void) {
    int p;
    int a;
    int b;
    int c;
    int d;
    int e;
    TRACE(("sub_10720: enter, word_3BECC=%d", word_3BECC));

    word_3BEC0 = (int)((dword_3B7DA + 0x10L) >> 5);
    word_3BED0 = -((int)((dword_3B7F8 + 0x10L) >> 5) - 0x8000);

    if (word_3BECC == 1) {
        planeFlags = 0;
        if (gameData->difficulty == 4) {
            gameData->difficulty = 2;
            word_336EA = 1;
            var_730 |= 0x10;
            *(char far *)((char far *)commData + 0x30) |= 1;
        }
        d = (unsigned char)*((char far *)commData + 0x0d);
        if (d == 0x69 || d == 0x49) {
            var_600 = 1;
        }
        sub_11F3E();
        TRACE(("sub_10720: past 11F3E"));
        word_336F0 = 0;
        word_336F8 = 1;
        word_336F4 = word_336F2 = -1;
        var_597 = word_33096 = missileSpecIndex = word_330B6 = waypointIndex = word_32A34 = 0;
        word_3C16A = word_3BED4 = word_3BFA0 = word_3C014 = var_456 = 0;
        word_3B4D8 = word_3B4E0 = word_3B5D6 = 0;
        word_33700 = word_336F6 = -1;
        word_33098 = 10000;
        word_3BF90 = 0;
        waypointIndex = 1;
        word_3C45C = 1;
        sub_11A88(0);
        var_383 = 0x0c;
        word_330C4 = 4;
        sub_1DAAE();
        byte_383E5 = 1;
        var_588 = 1;
        p = word_3AFA8 = (gameData->theater == 6) ? 1 :
            (*((char far *)gameData + 0x38) & 1) ? 1 : -1;

        if (((stru_3AA5E[word_3B148].field_6) & 0x200) != 0) {
            dword_3B7DA -= (long)(p * 0x80);
            *(char *)&planeFlags |= 8;
        } else {
            dword_3B7F8 -= (long)(0x708 * word_3AFA8);
        }
        sub_118F6();
        TRACE(("sub_10720: past 118F6"));
        sub_11D10(8, 0);
        TRACE(("sub_10720: past 11D10"));
        sub_19595();
        TRACE(("sub_10720: past 19595"));
        sub_19EB6(3, 10);
        TRACE(("sub_10720: past 19EB6"));
        sub_194D0(0x13);
        TRACE(("sub_10720: past 194D0"));
        word_336F4 = word_336F2 = -1;
        word_330BA = 2;
        word_330B8 = gameData->difficulty;
        gameData->unk4 = 1;
        word_38FDC = *(int far *)((char far *)commData + 0x32);
        sub_1DB2B();
        *(int far *)((char far *)commData + 0x26) = 1;
        word_330B4 = 1000;
        if (word_330B8 == 0 || word_336EA != 0) {
            word_3AFA8 = ((unsigned)(word_3BED0 - var_47) < 0x8000u) ? 1 : -1;
            var_548 = 2000;
            word_3A944 = 0x1fa4;
            var_552 = 100;
            sub_15FDB();
            *(char *)&planeFlags |= 1;
            *(char *)&planeFlags &= ~8;
            if ((*(int far *)((char far *)gameData + 0x32) | *(int far *)((char far *)gameData + 0x34)) == 0 && gameData->theater != 6) {
                for (d = 0; d < word_3C046 - 4; d++) {
                    if ((d & 1) == 0) {
                        *(char *)((char *)&stru_3B208[d] + 18) |= 2;
                        stru_3B208[d].field_0 = 0x898;
                        *(int *)((char *)&stru_3B208[d] + 20) = 300;
                        *(int *)((char *)&stru_3B208[d] - 4) = d * 12 + word_3BEC0 - 0x24;
                        *(int *)((char *)&stru_3B208[d] - 2) = word_3BED0 - (d * 0x20 + 0x96) * word_3AFA8;
                        stru_3B208[d].field_2 = (long)*(int *)((char *)&stru_3B208[d] - 4) << 5;
                        stru_3B208[d].field_6 = (long)*(int *)((char *)&stru_3B208[d] - 2) << 5;
                        *(int *)((char *)&stru_3B208[d] + 10) = var_542 + (int)0x8000;
                    }
                }
            }
        }
        if (gameData->theater != 6) {
            *(char *)&byte_3B23E[0] |= 2;
            word_3B22C = 0x834;
            word_3B240 = 700;
            var_810 = word_3BEC0;
            var_811 = 0x50 * word_3AFA8 + word_3BED0;
            word_3B22E = (int)((long)var_810 << 5);
            word_3B230 = (int)(((long)var_810 << 5) >> 16);
            word_3B232 = (int)((long)var_811 << 5);
            word_3B234 = (int)(((long)var_811 << 5) >> 16);
            word_3B236 = var_542;
        }
        p = word_3AFA8 = ((unsigned)(word_3BED0 - var_47) < 0x8000u) ? 1 : -1;
        sub_119A3();
        word_3BECC = 2;
        gfx_flipPage();
        word_38FF6 = routine_191();
    }

    b = sub_1CF64(word_3BEC0, 0x100, 0x7e00);
    if (b != word_3BEC0) {
        word_3BEC0 = b;
        dword_3B7DA = (long)b << 5;
    }
    b = sub_1CF64(word_3BED0, 0x200, 0x7d00);
    if (b != word_3BED0) {
        word_3BED0 = b;
        dword_3B7F8 = (long)(0x8000 - word_3BED0) << 5;
    }

    *(char far *)0x00000417L &= 0x0f;
    TRACE(("sub_10720: past init"));
    sub_16172();
    sub_167B4();
    sub_179EE();
    TRACE(("sub_10720: past 179EE"));
    sub_11636();
    TRACE(("sub_10720: past 11636"));
    sub_11676();
    TRACE(("sub_10720: past 11676"));
    sub_11841();
    TRACE(("sub_10720: past 11841"));
    sub_118D5();
    TRACE(("sub_10720: past 118D5"));

    c = sub_199EC(word_3BEC0, word_3BED0, &b, &d);
    if (c == 0) {
        sub_195C9(word_3BEC0, word_3BED0);
    } else {
        byte_3C5A0 = -(gfx_getDisplayPage() - 1);
        gfx_copyRect(0x328b, 2, b - 3, d - 3, (int)byte_3C5A0, b - 3, d - 3, 6);
        sub_1A8C8(b - 1, d - 1, ((var_542 + 0x1000) >> 0xd & 7) * 4 + 0xa4, 4, 4, 4, 0);
        byte_3C5A0 = 1 - byte_3C5A0;
        if ((b < 0x20 || b > 0x58 || d < 0x76 || d > 0xa2) && byte_383E5 > 2) {
            byte_383E5--;
            sub_195C9(word_3BEC0, word_3BED0);
        }
    }

    word_3AF0C = word_3BEC0;
    word_3AFAA = word_3BED0;

    if (word_3370C == word_336E8) {
        if (word_336EA == 0) {
            keyValue = 0;
        }
        word_3370C = -1;
    }
    if (word_336F0 != 0) {
        word_336F0--;
    }
    if (word_336EE != 0 && word_336E8 == word_336EE) {
        word_336EE = 0;
        sub_1DA5F(2);
    }

    if ((word_336E8 & 7) != 0) goto skip_target_section;

    word_33700 = word_3C16A;
    word_38FEE = 0x7fff;
    for (d = 0; d < word_3BED2; d++) {
        if ((stru_3AA5E[d].field_6 & 0x201) != 0 &&
            (stru_3AA5E[d].field_6 & 0x500) != 0 &&
            (stru_3AA5E[d].field_6 & 0x800) == 0) {
            p = sub_1CFA6(word_3BEC0 - stru_3AA5E[d].field_0, word_3BED0 - stru_3AA5E[d].field_2);
            if (p < word_38FEE) {
                word_38FEE = p;
                word_3C16A = d;
            }
        }
    }
    if (word_33700 != word_3C16A) {
        word_3B15A = word_3C16A;
        var_48 = stru_3AA5E[word_3C16A].field_0;
        var_49 = stru_3AA5E[word_3C16A].field_2;
    }

    if ((char)word_336E8 == 0 && word_336E8 != 0) {
        if (*(int far *)((char far *)commData - 4) != (int)0xca01 ||
            *(int far *)((char far *)commData - 2) != 0x3b9a) {
            sub_11B37(1);
            exitCode = 0;
        }
    }

    if (word_33700 != word_3C16A && (stru_3AA5E[word_3C16A].field_6 & 0x800) == 0) {
        for (d = 1; d <= 2; d++) {
            e = word_3C046 - d;
            *(char *)((char *)&stru_3B208[e] + 18) &= ~2;
            c = stru_3AA5E[word_3C16A].field_6;
            if (c & 0x400) {
                *(int *)((char *)&stru_3B208[e] + 16) = 0x0d;
            } else {
                *(int *)((char *)&stru_3B208[e] + 16) = 0;
            }
            if (c & 0x100) {
                *(int *)((char *)&stru_3B208[e] + 16) = 0x12;
            }
            *(int *)((char *)unk_3B202 + (word_3C046 - d) * 36) = word_3C16A;
        }
        for (d = 3; d <= 4; d++) {
            e = word_3C046 - d;
            *(char *)((char *)&stru_3B208[e] + 18) |= 2;
            *(int *)((char *)&stru_3B208[e] - 4) = stru_3AA5E[word_3C16A].field_0;
            *(int *)((char *)&stru_3B208[e] - 2) = stru_3AA5E[word_3C16A].field_2;
            if ((stru_3AA5E[word_3C16A].field_6 & 0x200) != 0) {
                *(int *)((char *)&stru_3B208[e] - 4) += word_3AFA8 * 5;
                *(int *)((char *)&stru_3B208[e] - 2) += (d & 1) * word_3AFA8 * 0x10;
                stru_3B208[e].field_0 = 0x84;
            } else {
                *(int *)((char *)&stru_3B208[e] - 4) += 10;
                *(int *)((char *)&stru_3B208[e] - 2) += (d + word_3C16A & 3) * 0x10;
                stru_3B208[e].field_0 = 4;
            }
            stru_3B208[e].field_2 = (long)*(int *)((char *)&stru_3B208[e] - 4) << 5;
            stru_3B208[e].field_6 = (long)*(int *)((char *)&stru_3B208[e] - 2) << 5;
            *(int *)((char *)&stru_3B208[e] + 10) = -sub_1D200(0x4000);
            c = stru_3AA5E[word_3C16A].field_6;
            if (c & 0x400) {
                *(int *)((char *)&stru_3B208[e] + 16) = 8;
            } else {
                *(int *)((char *)&stru_3B208[e] + 16) = 0x0b;
            }
            if (c & 0x100) {
                *(int *)((char *)&stru_3B208[e] + 16) = 9;
            }
        }
    }

    if ((word_336E8 & 0x7f) == 0) {
        if ((stru_3AA5E[word_3C16A].field_6 & 0x800) == 0) {
            if (word_336E8 & 0x80) {
                e = word_3C046 - 1;
            } else {
                e = word_3C046 - 2;
            }
            if ((*(char *)((char *)&stru_3B208[e] + 18) & 2) == 0) {
                sub_1783A(e, word_3C16A);
                *(int *)((char *)&stru_3B208[e] + 18) = 0x207;
                stru_3B208[e].field_0 = 1000;
                *(int *)((char *)&stru_3B208[e] + 20) = 0xfa;
                stru_3B208[e].field_6 += (long)word_3AFA8 * 0x3000;
            }
        }
        word_3C014 = word_3BFA0;
        word_3BFA0 = word_3BED4;
        word_3BED4 = 0;
    }

skip_target_section:
    if (word_38FEE >= 0x200 && word_3BEBE != var_547) {
        word_33706 = 0;
        word_33702 = 0;
        goto skip_autopilot;
    }

    word_3BEBE = 0;
    word_38FFC = 0xa0;
    word_39200 = 0x800;
    if (stru_3AA5E[word_3C16A].field_6 & 0x800) {
        word_39200 = 0x400;
    }
    if (stru_3AA5E[word_3C16A].field_6 & 0x200) {
        word_3BEBE = 0x80;
        word_38FFC = 0x100;
        word_39200 = 0x3c0;
        if (var_547 == 0x80 && word_3AA5A > 0x50) {
            c = (unsigned)(word_3BED0 - stru_3AA5E[word_3C16A].field_2) * word_3AFA8;
            if (c >= 0x10 && c < 0x15) {
                b = abs(var_542 + (1 - word_3AFA8) * (int)0x4000);
                if (b < 0x2000) {
                    word_38FDE = 1;
                    makeSound(0x16, 2);
                }
            }
        }
    }
    if (gameData->unk4 == 1) {
        var_727 += 1;
        var_732 += 2;
    }
    b = abs(word_3BEC0 - stru_3AA5E[word_3C16A].field_0);
    if (b > (word_38FFC >> 5) ||
        (b = abs(word_3BED0 - stru_3AA5E[word_3C16A].field_2), b > (word_39200 >> 5))) {
        word_3BEBE = 0;
        word_33702 = 0;
    } else {
        word_33702 = 1;
        if (word_3AA5A > 1) goto end_landing_check;
        if ((word_336E8 & 7) != 0) goto end_landing_check;
        c = stru_3AA5E[word_3C16A].field_6;
        if ((c & 0x500) == 0) goto end_landing_check;
        if (word_33714 == 0) goto end_landing_check;
        if (c & 0x800) goto end_landing_check;
        word_336EC = 1;
        word_33706 = 1;
        b = word_33714;
        word_33714++;
        if (b == 1) {
            tempStrcpy((char *)aSafeLanding);
            word_330B6 = 0;
            word_33712 = 0;
            sub_1DA5F(4);
        }
        if ((planeFlags & 0x6000) == 0x6000) {
            if (word_33714 > word_330C4) {
                sub_11B37(0);
            }
        } else {
            if (word_33714 == 2) {
                word_33710++;
                sub_11D10(10, (char)word_3C16A);
            }
            if (word_33714 > word_330C4) {
                sub_119A3();
                if (word_336E8 & 8) {
                    tempStrcpy((char *)aReadyForTakeof);
                } else {
                    tempStrcpy((char *)aWeaponsRepleni);
                }
            }
        }
    }
end_landing_check:
    if (word_33706 != 0) goto skip_autopilot;
    if (word_330B8 != 0) goto skip_autopilot;
    if ((planeFlags & 0x6000) == 0) goto skip_autopilot;

    b = abs(word_3BEC0 - stru_3AA5E[word_3C16A].field_0);
    if (b < 0x10) {
        b = abs(word_3BED0 - stru_3AA5E[word_3C16A].field_2);
        if (b < 0x10) {
            var_548 = 0;
            word_3A944 = 0;
            var_552 = 0;
            dword_3B7DA = (long)stru_3AA5E[word_3C16A].field_0 << 5;
            dword_3B7F8 = (long)(0x8000 - stru_3AA5E[word_3C16A].field_2) << 5;
            goto skip_autopilot;
        }
    }
    tempStrcpy((char *)aAutomaticLandi);
    word_33712 = 1;
    d = word_330C4 * 2;
    if (d > 0x0e) {
        d = 0x0e;
    }
    word_3A944 = 0x1518;
    var_548 -= (unsigned)(var_548 - word_3BEBE) / (unsigned)d;
    if (var_548 < (unsigned)(word_3BEBE + 5)) {
        var_548 = word_3BEBE + 5;
    }
    dword_3B7DA -= (dword_3B7DA - ((long)stru_3AA5E[word_3C16A].field_0 << 5)) / (long)d;
    dword_3B7F8 -= (dword_3B7F8 - ((long)(0x8000 - stru_3AA5E[word_3C16A].field_2) << 5)) / (long)d;

skip_autopilot:
    if (word_33702 == 0) {
        if (var_547 == 0) {
            if ((gameData->unk4 != 0 || word_3BF90 > 4 || word_33098 == 0) &&
                word_3BE3C == 0 && word_3AA5A > 0x32) {
                makeSound(0, 2);
                sub_19E44(0);
                sub_19E5D(0, 0, 0x13f, 199);
                sub_12278(0x78);
                sub_11B37(1);
            }
        } else {
            word_33714 = 1;
        }
    }

    if (byte_3995A != 0 && (keyValue & 0x80) == 0) {
        if (gameData->unk4 != 0 && var_548 != 0) {
            makeSound(0, 2);
            gfx_waitRetrace();
            sub_12278(0x78);
            sub_11B37(2);
        } else {
            var_548 += 500;
            word_330B6 = 0;
        }
    }

    if ((stru_3AA5E[word_3C16A].field_6 & 0x200) == 0 || word_38FEE >= 0x500) {
        word_3C0A0 = 0;
    } else {
        word_3C0A0 = (int)((long)((int)(char)word_3AFA8 << 8) / (long)word_330C4) + word_3C0A0 & 0xfff;
    }

    word_336E8++;
    if (word_336E8 % word_330C4 == 0) {
        word_38FE0++;
        if ((word_38FE0 & 0x1f) == 0) {
            sub_11D10(9, 0);
        }
        if (word_38FE0 == 1) {
            sub_1DA5F(0);
            sub_1DA8D();
        }
        if (word_336EA != 0 && (word_38FE0 & 3) == 0) {
            sub_11C21();
        }
    }

    b = word_330C4 * 4;
    word_33708++;
    if (word_33708 >= (unsigned)b) {
        word_3C6AE = var_383 / word_330C4;
        var_383 -= (var_595 * 2 - 1) * word_330C4 * 2;
        if (var_383 < 4) {
            var_383 = 4;
        }
        b = sub_1CF64((int)((long)word_330C4 * 0x3c0 / (unsigned long)((unsigned)var_383 * (unsigned)word_3370A)), 1, 0xff);
        var_383 = 0;
        word_33708 = 0;
        c = abs(word_330C4 * 4 - b);
        if (c > 3) {
            word_330C4 = (b + 2) >> 2;
            sub_1DAAE();
        }
        word_3C09C = 0;
        for (d = 3; d < word_38FFA; d++) {
            if (*(int *)((char *)&stru_3AA5E[d] + 6 + 0x50) > 0xc0 &&
                (stru_3AA5E[d].field_6 & 0x80) == 0) {
                word_3C09C = 1;
                break;
            }
        }
        for (d = 0; d < word_3C046; d++) {
            if (*(int *)((char *)&stru_3B208[d] + 28) > 0xc0 &&
                (*(char *)((char *)&stru_3B208[d] + 18) & 2) != 0) {
                word_3C09C++;
                break;
            }
        }
    }
    sub_114E8();
}

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

    p = word_3BF90 = word_33096 = 0;
    for (; p < 3; p++) {
        missleSpec[p].weaponIdx = commData->weaponType[p];
        missleSpec[p].ammo = commData->weaponCount[p];
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
        sub_1A183(missleSpec[a].ammo, p, 0xbe, 0x0c);
    }
}

// ==== seg000:0x1a88 ====
void sub_11A88(int param_1) {
    if (word_330C2 == 0) return;
    var_564[2] = 0;
    sub_19BE1(asc_33744[word_3374A], 0xc4, asc_33744[word_3374A] + 6, 0xc4);
    var_564[2] = 7;
    sub_19BE1(asc_33744[word_3374A], 0xc5, asc_33744[word_3374A] + 6, 0xc5);
    var_564[2] = 0x0c;
    sub_19BE1(asc_33744[param_1], 0xc4, asc_33744[param_1] + 6, 0xc4);
    var_564[2] = 4;
    sub_19BE1(asc_33744[param_1], 0xc5, asc_33744[param_1] + 6, 0xc5);
    word_3374A = param_1;
}

// ==== seg000:0x1b37 routine_148 ====
void sub_11B37(int arg_0) {
    TRACE(("sub_11B37: arg_0=%d, word_3BE3C=%d", arg_0, word_3BE3C));
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
    commData->weaponCount[0] = word_38FF6;
    commData->weaponCount[1] = word_33710;
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
        strcpy((char *)strBuf, (char *)(*(int16 *)&stru_3B208[p].field_10[6] * 32 + (int)aMig23)); /* 0x2c8: aircraft name table (32-byte records) */
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
    moveStuff();
    word_3C0A2[0] = byte_3C16E;
    var_2 = 1;
    for (var_4 = 0; var_4 < 750; ++var_4) {
        if (byte_3C16E[var_4] == 0 && var_2 < 100) {
            word_3C0A2[var_2++] = &byte_3C16E[var_4+1];
        }
    }
    if (gameData->difficulty != 0) { //1e6c
        dword_3B7DA = ((int32)(stru_3AA5E[word_3B148].field_0) << 5) + 2;
        dword_3B7F8 = (0x8000 - (int32)(stru_3AA5E[word_3B148].field_2)) << 5;
    }
    else {
        dword_3B7DA = ((int32)waypoints[0].field_0 << 5) + 2;
        dword_3B7F8 = (0x8000 - (int32)waypoints[0].field_2) << 5;
    }
    word_3BEC0 = (dword_3B7DA + 0x10) >> 5;
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
    moveNearFar(byte_3B7FC, 0x600);
}

// ==== seg000:0x206d ====
int moveStuff() {
    moveNearFar(byte_3C02A, 1);
    moveNearFar(byte_3BEC4, 1);
    moveNearFar(&word_3BED2, 2);
    moveNearFar(&word_38FFA, 2);
    moveNearFar(&word_3C69E, 2);
    moveNearFar(&word_3AA5C, word_3BED2 * 16);
    moveNearFar(&word_3C046, 2);
    moveNearFar(unk_3B202, word_3C046 * 0x24);
    moveNearFar(byte_3BFA4, 0x64);
    moveNearFar(byte_3BED8, 0x64);
    moveNearFar(byte_3C16E, 0x2ee);
    moveNearFar(byte_3AFAC, 0x100);
    moveNearFar(&word_3C00C, 2);
    moveNearFar(&word_336FC, 2);
    moveNearFar(waypoints, 0x10);
    moveNearFar(&word_3B144, 0x24);
}

// ==== seg000:0x215c ====
int moveNearFar(void *nearPtr, int count) {
    void FAR *farPtr = nearPtr;
    if (flagFarToNear != 0) {
        movedata(FP_SEG(farPointer), FP_OFF(farPointer), FP_SEG(farPtr), FP_OFF(farPtr), count);
    }
    else {
        movedata(FP_SEG(farPtr), FP_OFF(farPtr), FP_SEG(farPointer), FP_OFF(farPointer), count);
    }
    farPointer += count;
}

// ==== seg000:0x21a9 ====
int setCommWorldbufPtr() {
    farPointer = (uint8 FAR*)&commData->worldBuf;
    return 0;
}

