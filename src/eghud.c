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


void otherKeyDispatch(void) {
    // Local variables - names chosen to match MSC 5.1 hash-based stack layout
    // Within same hash bucket: first declared → highest BP offset (LIFO)
    // Dummies fill gaps to achieve sub sp, 0x3E (31 word slots)
    int16 p;                    // dummy:  bp-0x02 (bucket 0)
    int16 a, q;                 // dummies: bp-0x04, bp-0x06 (bucket 1)
    int16 b, aa, r;             // var_C=b at bp-0x0c, dummies at bp-0x0a,bp-0x08 (bucket 2)
    int16 ab, s, c;             // dummy=ab at bp-0x12, var_10=s at bp-0x10, var_E=c at bp-0x0e (bucket 3)
    int16 ac, t, d;             // var_18=ac at bp-0x18, var_16=t at bp-0x16, var_14=d at bp-0x14 (bucket 4)
    int16 ad, u, e;             // dummies at bp-0x1e,bp-0x1c, var_1A=e at bp-0x1a (bucket 5)
    int16 ae, v, f;             // var_24=ae at bp-0x24, var_22=v at bp-0x22, var_20=f at bp-0x20 (bucket 6)
    int16 g, w;                 // var_28=g at bp-0x28, dummy=w at bp-0x26 (bucket 7)
    int16 x, h;                 // var_2C=x at bp-0x2c, var_2A=h at bp-0x2a (bucket 8)
    int16 i, y;                 // dummies: bp-0x2e, bp-0x30 (bucket 9)
    int16 z, j;                 // var_34=z at bp-0x34, var_32=j at bp-0x32 (bucket 10)
    int16 k;                    // dummy:  bp-0x36 (bucket 11)
    int16 l;                    // var_38: bp-0x38 (bucket 12)
    int16 m;                    // dummy:  bp-0x3a (bucket 13)
    int16 n;                    // var_3C: bp-0x3c (bucket 14)
    int16 o;                    // var_3E: bp-0x3e (bucket 15)

    if (word_3BECC == 0) {
        // (MSC stores chained assignments right-to-left:
        // ref store order is thrust, setThrust, velocity, 380D0, viewZ, roll, pitch)
        word_380CA =
        word_380CC =
        word_380CE =
        word_380D0 =
        word_3A944 =
        word_380E0 =
        word_3AFA6 = 0;

        if (gameData->difficulty == 0) {
            
            word_380C8 = ((word_3BED0 - (waypoints[1].mapY)) < 0x8000) ? 0 : 0x8000;
        } else {
            word_380C8 = (gameData->theater == 6)
               ? 0  // If true, the result is 0
               : ((gameData->theater & 1) ? 0 : 0x8000); // Else, evaluate the second condition
        }

        if (stru_3AA5E[word_3B148].flags & 0x200) {
            *((unsigned char*)&word_380C8 + 1) += 4;
        }

        rebuildOrientation();
        sub_15FDB();
        word_3BECC = 1;
    }

    keyScancode = 0;
    if (kbhit()) {
        keyScancode = _bios_keybrd(0);
        if (word_336EA == 1) {
            word_3370E = 
            word_336EA = 
            keyValue = 0;
        }
    }

    while (kbhit()) {
        _bios_keybrd(0); // Flush keyboard buffer
    }

    // Main key dispatch logic
    switch ((unsigned)keyScancode) {
        case 0x0C2D: // Minus
            word_380E0 = clampRange(word_380E0 - 10, 0, 100);
            sub_15FDB();
            goto switch_break;
        case 0x0D3D: // Equal
            word_380E0 = clampRange(word_380E0 + ((word_380E0 < 10) ? 5 : 10), 0, 100);
            sub_15FDB();
            *((unsigned char*)&planeFlags) &= 0xF7; // ~8
            goto switch_break;
        case 0x1E61: // A
            word_380E0 = 0x90;
            sub_15FDB();
            *((unsigned char*)&planeFlags) &= 0xF7; // ~8
            goto switch_break;
        case 0x0D2B: // Shift-Equal
            word_380E0 = 100;
            sub_15FDB();
            *((unsigned char*)&planeFlags) &= 0xF7; // ~8
            goto post_key_B_check;
        case 0x0C5F: // Shift-Minus
            word_380E0 = 0;
            makeSound(0x10, 0);
            sub_15FDB();
            goto switch_break;
        case 0x3062: // B
            *((unsigned char*)&planeFlags) ^= 8;
        post_key_B_check:
            if (!(*((unsigned char*)&planeFlags) & 8) && word_3BEBE != 0 && word_380E0 == 100) {
                word_3A944 = 0x546;
                makeSound(0x1C, 2);
            }
            goto switch_break;
        case 0x2400: // Alt-J
            if (word_380E2 == 0) {
                initJoystickCalibration();
                word_380E2 = 40;
            }
            goto switch_break;
        case 0x1000: // Alt-Q
            finalizeMission(1);
            exitCode = 0;
            goto switch_break;
        case 0x3000: // Alt-B
            if (word_330C2 != 0) {
                gfx_copyRect(*var_564, 0, 0x61, *off_38364, 0, 0x61, 0x140, 0x67);
            }
            setDrawColor(0);
            fillRectBoth(0, 0, 0x13F, 0xC7);
            blitSprite(0, 0, 0x71, 0x37, 0x0C, 7, 0);
            waitForKeyPress();
            if (word_330C2 != 0) {
                gfx_copyRect(*off_38364, 0, 0x61, *var_564, 0, 0x61, 0x140, 0x67);
                gfx_copyRect(*off_38364, 0, 0x61, *var_565, 0, 0x61, 0x140, 0x67);
                sub_15FDB();
            }
            goto switch_break;
        case 0x1900: // Alt-P
            waitForKeyPress();
            goto switch_break;
    }

switch_break:
    if (word_380E2 != 0) {
        word_380E2--;
    }

    if (word_380E0 != 0 && word_3AFA6 == 0) {
        makeSound(0x0E, 2);
    }

    if (word_330BE != 0) {
        joyAxes[0] = 0;
        joyAxes_2[0] = 0;
    } else {
        if (commData->setupUseJoy != 0) {
            readCalibratedJoystick();
        } else {
           
            //temp_si = word_38602 + 1;
            joyAxes[0] = (unsigned char)(((int)((unsigned char)byte_37F98 - 0x80) * (word_38602 + 1)) / 3) - 0x80;
           
            joyAxes_2[0] = (unsigned char)(((int)((unsigned char)byte_37F99 - 0x80) * (word_38602 + 1)) / 3) - 0x80;
        }
    }

    word_3C00E = ((uint16)joyAxes[0] >> 4) - 8;
    if (word_3C00E < 0) word_3C00E++;

    word_3C5A4 = ((uint16)joyAxes_2[0] >> 4) - 8;
    if (word_3C5A4 < 0) word_3C5A4++;
    
    word_3C00E = -((abs(word_3C00E) + 2) * word_3C00E) * 2;
    word_3C5A4 *= 6;
    if (word_3C5A4 < 0) {
        word_3C5A4 /= 2;
    }
    
    if (word_3BEBE == word_380CE && word_3C5A4 < 0 && word_380CA <= 0) {
        word_3C5A4 = 0;
    }

    if (word_3AA5A > 0x15E && !(*((unsigned char*)&planeFlags) & 1) && word_336EC != 0) {
        word_336EC = 0;
        *((unsigned char*)&planeFlags) |= 1;
        tempStrcpy("Landing gear raised");
        makeSound(0x20, 2);
    }
    
    if (word_3BEBE == word_380CE && word_380E0 == 0 && !(*((unsigned char*)&planeFlags) & 8)) {
        *((unsigned char*)&planeFlags) |= 8;
        tempStrcpy("Brakes on");
    }

    if (word_3C00E != 0 || word_3C5A4 != 0) {
        word_330B6 = 0;
    }
    
    if (word_330B6 != 0)
    {
        x = (word_336EA != 0) ? (int16)((word_38FE0 & 0xF) << 8) - 0x800
                                   : 0;

        x = sub_1CF8E(x - word_380C8 + word_3BE92, 0xEC00, 0x1400) * 2;

        word_3C00E = -clampRange((x - word_380CC) >> 6, -24, 24);

        d = sub_1CF8E(((word_330B6 - word_380CE) << 4) - word_38FC4, 0xEC00, 0xC00);

        word_3C5A4 = clampRange((d - word_380CA) >> 7, -8, 8);

        if (waypointIndex == 3)
        {
            o = word_3AFA8;
            s = word_3B15A;

            h = stru_3AA5E[s].mapX - word_3BEC0;
            z = stru_3AA5E[s].mapY - word_3BED0;

            if (!(stru_3AA5E[s].flags & 0x200))
            {
                o = -signOf(z);
            }

            z += ((stru_3AA5E[s].flags & 0x200) ? 0x1E : 0x40) * o;

            x = abs(word_380C8);
            if (o == -1)
            {
                h = -h;
                z = -z;
                x = abs(word_380C8 - 0x8000);
            }

            d = clampRange((abs(h) + abs(z)) * 2 + x / 32, 50, 0x1000);
            if (d < 0x1000)
            {
                sub_1DB9C();
            }

            if (stru_3AA5E[s].flags & 0x200)
            {
                d += 100;
            }

            if (word_33702 != 0 && abs(x) < 0x200)
            {
                d = -20;
            }

            z = stru_3AA5E[s].mapY + (((stru_3AA5E[s].flags & 0x200) ? 0x1C : 0x38) * o);

            z += clampRange((abs(h) * 4) + (x / 16), 0, 0xC00) * o;

            *((unsigned char *)&planeFlags) &= 0xF7;

            if (x > 0x4000)
            {
                h = stru_3AA5E[s].mapX;
                d = 0x1000;
            }
            else
            {
                h = stru_3AA5E[s].mapX + (o * h * 2);
                if (word_380E0 * 80 < word_3AA5A)
                {
                    *((unsigned char *)&planeFlags) |= 8;
                }
            }

            c = computeBearing(h - word_3BEC0, word_3BED0 - z);
            n = (int16)word_3AA5A / 16;

            x = sub_1CF8E(c - word_380C8, (-n) << 8, n << 8) * 2;

            if (word_33702 != 0)
            {
                x = 0;
            }

            word_3C00E = -clampRange((x - word_380CC) >> 6, -32, 32);

            word_380E0 = clampRange((abs(x) / 256) + (d / 64), 35, 80);
            sub_15FDB();

            d = sub_1CF8E(((d - word_380CE) >> 3) + (word_38FC4 >> 7), -24, 24);

            word_3C5A4 = clampRange(d - (word_380CA >> 7), -16, 16);

            if (word_3AA5A < 0x15E)
            {
                *((unsigned char *)&planeFlags) &= 0xFE;
            }

            if (word_3BEBE == word_380CE)
            {
                word_380E0 = 0;
                word_3C00E = 0;
                planeFlags |= 8;
                word_3C5A4 = 0;
            }
        }
    }
    if (gameData->unk4 != 0) {
        ae = ((int32)word_3AA5A * (1000 - word_380CE)) >> 15;
    } else {
        ae = 0;
    }
    
    if (!((planeFlags) & 1)) {
        ae += clampRange((word_3AA5A - 200) >> 5, 0, 32);
    }
    
    if (ae > 0 && ((uint16)word_3BEBE) < ((uint16)word_380CE)) {
        word_3C00E += randomRange(ae) - (ae >> 1);
        word_3C5A4 += (randomRange(ae) - (ae >> 1)) >> 1;
    }
    
    if ((planeFlags & 1) && word_3C5A4 <= 0 && ((uint16)word_3A8FE) < ((uint16)word_3A944) && gameData->unk4 < 2 && abs(word_380CC) < 0x3000 && word_38FE8 == 0) {
        d = ((((word_38FC4) - (word_380CA)) >> 2) - word_380CE + 300) >> 2;
        if (d > 0) {
            word_3C5A4 = clampRange(d, 0, 32);
        }
    }
    
    if (word_3BE3C != 0) {
        word_3C00E = 0x40;

        word_3C5A4 = (abs(word_380CC) > 0x4000) ? 0x10 : -8; // pitch_input_modifier
        
        //word_3BE3C++;
        word_3C040 += clampRange(
            - (++word_3BE3C - 0x20),
            (int16)0xFF00 / word_330C4,
            (int16)0x80 / word_330C4
        );
        //word_3C040 += stall_decay_effect;

        if (word_3C040 < 0) {
            word_3C040 = 0;
            if ((word_38FE0 & 7) == 0) {
                finalizeMission(0);
            }
        }

        if (word_380CE == 0 && word_336F6 == -1) {
            word_336F6 = 0;
            stru_3AA5E[0].mapX = word_3BEC0;
            stru_3AA5E[0].mapY = word_3BED0;
            word_3BEBC = word_3BEC0;
            word_3BEC8 = word_3BED0;
            word_3BECE = 0;
            word_39606 = -8;
            makeSound(2, 2);
            word_3A944 = 
            word_380E0 = 0;
        }

        if ((word_3BE3C & 0xFFFC) == 0x10 && (frameTick & 3) == 1) {
            word_336F6 = -1;

            l = ((uint16)frameTick / 2) & 7;

            ((struct struc_9*)stru_33402)[l].field_0 = word_3BEC0;
            ((struct struc_9*)stru_33402)[l].field_2 = word_3BED0;
            ((struct struc_9*)stru_33402)[l].field_4 = word_380CE;

            ((struct struc_9*)stru_33402)[l].field_6 = randomRange(0x20) << 11;

            word_33442 = l;
            word_3BEBC = word_3BEC0;
            word_3BEC8 = word_3BED0;
            word_3BECE = word_380CE;
            word_39606 = -8;
            makeSound(0, 2);

            word_380CA = -0x4000;
            byte_380DD = 1;
        }
    }
    
    if (word_3BF90 != 0) {
        if (word_380E0 > -((word_3BF90 * 4) - 0x90)) {
            word_380E0 = -((word_3BF90 * 4) - 0x90);
            if (word_380E0 < 0)
                word_380E0 = 0;
            sub_15FDB();
        }
    }
    
    word_3AFA6 += ((word_380E0 - word_3AFA6) / 4) / ((int16)word_330C4);
    if (word_380E0 > word_3AFA6) word_3AFA6++;
    if (word_380E0 < word_3AFA6) word_3AFA6 = word_380E0;

    if ((((uint16)frameTick) % ((uint16)(word_330C4 << 1))) == 0 && word_380E0 != 0 && word_336EA == 0) {
        word_33098 -= ((word_380E0 * word_380E0) / 750) + 2;
        drawFuelGauge();
    }
    
    if (word_33098 <= 0) {
        word_3AFA6 = 0;
        word_33098 = 0;
    }

    word_38FDA = byte_37FEC[(abs(word_380CC) >> 8) & 0x7f];
    if (((uint16)word_3BEBE) < ((uint16)word_380CE)) {
        word_38FDA += word_3C5A4 / 2;
    }
    
    if (word_38FDA > 0x80) {
        word_38FDA = 0x80;
        word_3C5A4 = clampRange(0x80 - byte_37FEC[(abs(word_380CC) >> 8) & 0x7f], 0, word_3C5A4);
    }
    
    
    strcpy(unk_38FD0, itoa(word_38FDA / 16, strBuf, 10));
    strcat(unk_38FD0, ".");
    
    strcat(unk_38FD0, itoa((abs(word_38FDA) & 0xF) >> 1, strBuf, 10));
    strcat(unk_38FD0, "G");

    j = ((long)(word_3AFA6 - sinMul(word_380CA, 80)) * 800L) / 100L;
    
    word_3C5A6 = 100;
    j = ((((uint16)word_380CE >> 7) + 0x0400) * (int32)(j & j)) >> 10; // j & j folds to a plain load but ranks the operand "heavy", so the shift-expr is evaluated/pushed first like the ref

    word_3C5A6 = ((int32)100 * (uint32)((word_380D0 >> 6) + 0x0400)) >> 10;
    
    j = ((int32)j) * ((int32)(-((word_33098 >> 9) - 100))) / (int32)90;
    
    j = (((int32)j) * ((int32)(128 - word_38FDA))) >> 7;
    
    word_3C5A6 = ((int32)isqrt(word_38FDA * 4) * (int32)word_3C5A6) >> 3;
    word_3C5A6 = abs(word_3C5A6);

    if (!(*((unsigned char*)&planeFlags) & 1)) {
        j -= j >> 3;
    }
    
    word_3A8FE = word_3C5A6 * 27;
    e = clampRange(j, 0, 899) * 27;
    
    word_3A944 += ((((int32)e - word_3A944) / 16) / (int32)word_330C4);
    
    word_3B4DA = ((int32)word_3A8FE * 3072) / (abs(word_3A944) + 1);
    if ((uint16)word_3B4DA > 0x2000) word_3B4DA = 0x2000;
    
    word_38FC4 = cosMul(word_380CC, word_3B4DA - 0x300);
    
    if (*((unsigned char*)&planeFlags) & 8) {
        if (word_3BEBE == word_380CE) {
            word_3A944 -= (-((gameData->unk4 * 8) - 32) * 27) / word_330C4;
            if (word_3BEBE != 0 && (uint16)word_3A944 < 0x1B0) {
                 word_3A944 = 0;
            }
        } else {
             word_3A944 -= ((uint16)word_3A944 >> 4) / word_330C4;
        }
    }
    
    if ((uint16)word_3A944 > 0xAFC8) word_3A944 = 0;
    
    v = cosMul(word_380CA, word_3A944);
    word_3AA5A = (uint16)word_3A944 / 27;
    
    audio_jump_6a(word_3AA5A, word_3AFA6);
    
    ac = (((int32)sinMul(word_380CC, word_38FDA << 4)) << 7) / ((int32)((int16)((uint16)word_3A944 >> 9) + 0x20));

    ac = cosMul(word_380CA, ac);
    
    if (word_3BEBE == word_380CE) {
        ac = (word_3C00E * -1) << 6;
        word_3C00E = 0;
        if (word_3AA5A < word_3C5A6) {
            word_3C5A4 = 0;
        }
    }
    
    if (word_38FDE != 0) {
        word_3C5A4 = -0x400 - word_380CA;
        // (ref stores velocity then setThrust; chains store right-to-left)
        word_380E0 =
        word_3A944 = 0;
    }
    
    g = (((int32)word_3C00E) << 7) / ((int32)word_330C4);
    if (g != 0) {
        word_380AC = word_380A4 = cosine(g);
        word_380A6 = sine(g);
        word_380AA = -word_380A6;
        applyRotationDelta(unk_3806E, &word_380A4);
    }
    
    f = (int16)((int32)word_3C5A4 << 7) / word_330C4;
    if (f != 0) {
        word_380A2 = word_3809A = cosine(f);
        word_380A0 = sine(f);
        word_3809C = -word_380A0;
        applyRotationDelta(unk_3806E, unk_38092);
    }
    
    t = (int16)ac / word_330C4;
    if (t != 0) {
        word_38090 = word_38080 = cosine(t);
        word_38084 = sine(t);
        word_3808C = -word_38084;
        applyRotationDelta(&word_38080, unk_3806E);
    }
    
    computeHudAttitude();

    if ((uint16)word_3A8FE > (uint16)word_3A944 && (uint16)word_3BEBE < (uint16)word_380CE) {
        word_380CA -= ((uint16)word_3A8FE - (uint16)word_3A944) >> ((gameData->unk4 == 2 || word_3BF90 > 8) ? 1 : 2);
        byte_380DD = 1;
        if (word_380CA < 0 || (uint16)word_380CE < 200) {
            makeSound(0x14, 1);
        }
    }

    if (word_3BEBE == word_380CE) {
        if (word_380CC != 0) {
            word_380CC = 0;
            byte_380DD = 1;
        }
        if (word_380CA < 0 || (word_380CA > 0 && word_3AA5A < word_3C5A6)) {
            if (word_38FDE == 0) {
                word_380CA = 0;
            }
            byte_380DD = 1;
        }
    }

    word_38FDE = 0;

    byte_3C6A0[0] = ( (abs(word_380CA)) - (abs(word_380CC) / 2) > 0x1000) ? 1 : 0;
    
    if (byte_380DD) {
        rebuildOrientation();
    }
    
    b = word_380D0;
    word_3C8B6 = fixedMulQ14((((uint16)word_3A944) / 10), sine(word_380CA - word_38FC4));

    if (word_33712 == 0) {
        word_380D0 += (word_3C8B6 / word_330C4);
        
        dword_3B7DA += fixedMulQ14(v, sine(word_380C8)) / 10 / word_330C4;

        dword_3B7F8 += fixedMulQ14(v, cosine(word_380C8)) / 10 / word_330C4;
    }
    
    if ((uint16)word_380D0 > 0xf230 || (uint16)word_380D0 < (uint16)word_3BEBE) {
        word_380D0 = word_3BEBE;
    }
    if (word_380D0 > 0xEA60) word_380D0 = 0xEA60;
    
    if (word_380D0 < 0x2000) {
        word_380CE = word_380D0;
    } else if (word_380D0 < 0x4000) {
        word_380CE = ((word_380D0 - 0x2000) >> 1) + 0x2000;
    } else {
        word_380CE = ((word_380D0 - 0x4000) >> 2) + 0x3000;
    }

    if (word_3BEBE == word_380CE) {
        if (b > word_3BEBE && word_33702 != 0) {
            makeSound(0xC, 2);
            //temp_bx = word_3C16A << 4;

            if ((( ((stru_3AA5E[word_3C16A].flags & 0x200) ? 0x100 : 0x80) 
                < ((int16)(-word_3C8B6 * word_330B8) / 2))) || 
                ((gameData->unk4 != 0 && 
                    (((planeFlags & 1)!=0) || 
                        (((int16)abs(word_380CC)) > (int16)((0x30 / (word_330B8 + 1)) << 8))) ))) {
                            makeSound(0, 2);
                            waitFrameSync(0x3C);
                            finalizeMission(5);
            }
        }
        word_3C8B6 = 0;
    }
    
    l = frameTick & 0xF;
    stru_3A95A[l].heading = word_380C8;
    stru_3A95A[l].pitch = word_380CA;
    stru_3A95A[l].roll = word_380CC;
    *(int32*)&stru_3A95A[l].worldX = dword_3B7DA;
    *(int32*)&stru_3A95A[l].worldY = dword_3B7F8;
    stru_3A95A[l].alt = word_380CE;

    if (word_3C45C == 1) {
        if (word_336F2 >= 0) {
            // TODO struct
            l = clampRange((rangeApprox(word_3BEC0 - (&word_3B204)[word_336F2 * 0x12], word_3BED0 - (&word_3B206)[word_336F2 * 0x12]) * word_330C4) >> 8, 0, 12);

        } else {
            l = word_330C4 - 1;
        }

        l = (frameTick - l) & 0xF;
        
        x = word_380C8 - stru_3A95A[l].heading;
        d = word_380CA - stru_3A95A[l].pitch;
 
        word_3C6A4 = cosMul(word_380CC, ((-x) >> 2)) + sinMul(word_380CC, (d >> 2));

        word_3C6AC = sinMul(word_380CC, (x >> 2)) + cosMul(word_380CC, (d >> 1));
    }

}


void applyRotationDelta(int param_1, int param_2) {
    int p;
    int a;

    var_549++;
    if (!(*(char *)&var_549 & 7)) {
        *(char *)&word_380D8 = 1;
    }
    multiplyMatrix3x3Far(param_1, param_2, unk_380B6);
    memcpy(unk_3806E, unk_380B6, 0x12);
}

void computeHudAttitude(void)
{
    int p;

    var_544 = valueToAngle(-var_528);
    p = cosine(var_544);
    if (p != 0) {
        if (abs(var_525) < 0x5a81) {
            var_542 = valueToAngle(abs((int)signedRatio16(var_525, p)));
        } else {
            var_542 = complementAngle(abs((int)signedRatio16(var_529, p)));
        }
        if (var_525 <= 0 && var_529 < 0) {
            var_543 += 0x80;
        }
        if (var_525 > 0 && var_529 < 0) {
            var_542 = 0x8000 - var_542;
        }
        if (var_525 < 0 && var_529 > 0) {
            var_542 = -var_542;
        }
        if (abs(var_526) < 0x5a81) {
            var_545 = valueToAngle(abs((int)signedRatio16(var_526, p)));
        } else {
            var_545 = complementAngle(abs((int)signedRatio16(var_527, p)));
        }
        if (var_526 <= 0 && var_527 < 0) {
            *((char *)&var_545 + 1) += 0x80;
        }
        if (var_526 > 0 && var_527 < 0) {
            var_545 = 0x8000 - var_545;
        }
        if (var_526 < 0 && var_527 > 0) {
            /* Force MSC to emit sub ax, ax; sub ax, var_545. */
            var_545 = 0x10000 - var_545;
        }
    } else {
        var_545 = 0;
        var_542 = valueToAngle(var_524);
        if (var_526 <= 0 && var_527 < 0) {
            var_543 += 0x80;
        }
        if (var_526 > 0 && var_527 < 0) {
            var_542 = 0x8000 - var_542;
        }
        if (var_526 < 0 && var_527 > 0) {
            var_542 = -var_542;
        }
    }
    if (var_544 > 0x38e3 && var_544 < 0x4001) {
        *(char *)&word_380D8 = 1;
    }
    if (var_544 < (int16)0xc71d && var_544 > (int16)0xbfff) {
        *(char *)&word_380D8 = 1;
    }
    if (var_550 != 0 && var_545 == 0) {
        *(char *)&word_380D8 = 1;
    }
}


void rebuildOrientation() {
    buildRotationMatrixFar(unk_3806E, var_542, var_544, var_545);
    *(char *)&word_380D8 = 0;
    var_549 = 0;
}

unsigned signedRatio16(int numerator, int denominator) {
    char p = 1;
    char a = 1;
    long b;
    long d;

    if (numerator < 0) p = -1;
    if (denominator < 0) a = -1;
    b = (long)(numerator < 0 ? -numerator : numerator);
    d = (long)(denominator < 0 ? -denominator : denominator);
    return (unsigned)((unsigned int)((((unsigned long)(unsigned int)b) << 16) / d >> 1)) * (unsigned)(int)p * (unsigned)(int)a;
done:
    ;
}

int valueToAngle(int value) {
    int p;
    int a;
    int b;
    int c;

    if (value == (int)0x8000) return (int)0xc000;
    a = abs(value);
    b = (a >> 9) + 1;
    for (; b >= 0; b--) {
        if ((&word_37348)[b] <= a) {
            c = (&word_3734A)[b] - (&word_37348)[b];
            p = (int)((long)(a - (&word_37348)[b]) * 256L / (long)c) + b * 256;
            break;
        }
    }
    if (value < 0) {
        p = -p;
    }
    return p;
}

int complementAngle(int arg_0) {
    return 0x4000 - valueToAngle(arg_0);
}

int isqrt(int value) {
    int p;
    int a;
    value = abs(value);
    if (value < 4) {
        return 1;
    }
    a = value >> 2;
    do {
        p = value / a;
        a = (a + p) >> 1;
    } while (abs(a - p) > 1);
    return a;
}

// something to do with view switching?
void renderFrame() {
    int var_2, var_4, var_6, var_8, var_A, var_C, var_E;
    TRACE(("renderFrame: enter"));
    dword_3B1FE = dword_3C01C = dword_3B7DA;
    dword_3B4D4 = dword_3B7F8;
    dword_3C024 = 0x100000 - dword_3B7F8;
    TRACE(("renderFrame: past assigns"));
    word_3B4DE = word_380CE + 0x18;
    word_3C02C = word_380CE;
    var_2 = word_336FE = clampRange(word_336FE, 2, 8);
    TRACE(("renderFrame: past clamp, keyValue=%d", keyValue));
    switch(keyValue) {
    case 0:
    case 0x44:
        word_3C5AA = word_380C8;
        word_3BE94 = word_380CA;
        word_3B4E4 = word_380CC;
        break;
    case 0x41:
        word_3C5AA = word_380C8 + 0x8000;
        word_3BE94 = -word_380CA;
        word_3B4E4 = -word_380CC;
        break;
    case 0x43:
        word_3C5AA = word_380C8 + 0x4000;
        word_3BE94 = -word_380CC;
        word_3B4E4 = word_380CA;
        break;
    case 0x42:
        word_3C5AA = word_380C8 - 0x4000;
        word_3BE94 = word_380CC;
        word_3B4E4 = -word_380CA;
        break;
    case 0x84:
        var_E = (frameTick - ((word_330C4  + 1) / 2) - 1) & 0xf;
        word_3C5AA = stru_3A95A[var_E].heading;
        word_3BE94 = stru_3A95A[var_E].pitch;
        word_3B4E4 = stru_3A95A[var_E].roll;
        dword_3B1FE = stru_3A95A[var_E].worldX;
        dword_3B4D4 = stru_3A95A[var_E].worldY;
        word_3B4DE = stru_3A95A[var_E].alt;
        break;
    case 0x85:
        word_3C5AA = word_380C8 - 0x4000;
        word_3BE94 = 0;
        word_3B4E4 = 0;
        dword_3B1FE = sinMul(word_380C8 + 0x4000, 0x18 << var_2) + dword_3B7DA;
        dword_3B4D4 = cosMul(word_380C8 + 0x4000, 0x18 << var_2) + dword_3B7F8;
        break;
    case 0x86:
        word_3C5AA = 0x8000;
        word_3BE94 = 0;
        word_3B4E4 = 0;
        dword_3B4D4 = (0x18 << var_2) + dword_3B7F8;
        break;
    case 0x87:
        word_3C5AA = word_380C8;
        word_3BE94 = 0;
        word_3B4E4 = 0;
        dword_3B1FE = sinMul(word_380C8 + 0x8000, 0x18 << var_2) + dword_3B7DA;
        dword_3B4D4 = cosMul(word_380C8 + 0x8000, 0x18 << var_2) + dword_3B7F8;
        word_3B4DE = (4 << var_2) + word_380CE;
        break;
    case 0x88:
    case 0x89:
    case 0x8b:
        if (keyValue != 0x89) {
            if (word_3C45C == 1) {
                // XXX: test byte ptr word_336F2, 80h -> check which byte is tested, other byte ptr instructions in this routine
                if (!(word_336F2 & 0x80)) word_3C02E = word_336F2 + 0x20;
            }
            else {
                if (!(word_336F4 & 0x80)) word_3C02E = word_336F4 + 0x40;
            }
        }
        else {
            if (word_3370E == 0) word_3C02E = word_3A940;
        }
        var_4 = var_2;
        if (!(word_3C02E & 0x40)) {
            if (!(word_3C02E & 0x20)) {
                if (stru_335C4[word_3C02E].ttl != 0) {
                    dword_3C01C = (uint32)(stru_335C4[word_3C02E].mapX) << 5;
                    dword_3C024 = (uint32)(stru_335C4[word_3C02E].mapY) << 5;
                    word_3C02C = stru_335C4[word_3C02E].alt;
                }
                else {
                    stru_335C4[word_3C02E].worldX = word_380C8;
                    stru_335C4[word_3C02E].worldY = word_380CA;
                    if (word_3370E != 0) keyValue = 0x87;
                }
                var_2 = 5;
            }
            else {
                // .... word_3C02E & 0x1f
                dword_3C01C = stru_3B202[word_3C02E & 0x1f].worldX;
                dword_3C024 = stru_3B202[word_3C02E & 0x1f].worldY;
                word_3C02C = stru_3B202[word_3C02E & 0x1f].alt;
                var_2 = 5;
            }
        }
        else {
            dword_3C01C = (uint32)stru_3AA5E[word_3C02E & 0x3f].mapX << 5;
            dword_3C024 = (uint32)stru_3AA5E[word_3C02E & 0x3f].mapY << 5;
            word_3C02C = stru_3AA5E[word_3C02E & 0x3f].flags & 0x200 ? 0xc8 : 0x32;
            var_2 = 7;
            if (word_336EA != 0 && word_3370C == -1) var_2 = 6;
        }
        if (word_3370E == 0) var_2 = var_4;
        var_A = (dword_3C01C >> 5) - word_3BEC0;
        var_C = (dword_3C024 >> 5) - word_3BED0;
        var_6 = rangeApprox(var_A, var_C);
        word_3C5AA = computeBearing(var_A, -var_C);
        word_3BE94 = -computeBearing((word_3C02C - word_380CE) >> 5, var_6);
        word_3B4E4 = 0;
        var_8 = cosMul(word_3BE94, 0x18 << var_2);
        if (word_3C02E & 0x60 || word_3370E != 0) {
            if (keyValue == 0x88) {
                dword_3B1FE = sinMul(word_3C5AA + 0x8000, var_8) + dword_3B7DA;
                dword_3B4D4 = cosMul(word_3C5AA + 0x8000, var_8) + dword_3B7F8;
                word_3B4DE = sinMul(word_3BE94, 0x18 << var_2) + (4 << var_2) + word_380CE;
                word_3BE94 = -word_3BE94;
            }
            else {
                dword_3B1FE = sinMul(word_3C5AA, var_8) + dword_3C01C;
                dword_3B4D4 = cosMul(word_3C5AA, var_8) - dword_3C024 + 0x100000;
                word_3B4DE = (4 << var_2) - sinMul(word_3BE94, 0x18 << var_2) + word_3C02C;
                if (word_3C02E & 0x40 && stru_3AA5E[word_3C02E & 0x3f].flags & 0x200 && word_3B4DE < 0x84) {
                    word_3B4DE = 0x84;
                }
                word_3C5AA += 0x8000;
            }
        }
        else {
            word_3C5AA = stru_335C4[word_3C02E].worldX;
            word_3BE94 = stru_335C4[word_3C02E].worldY - 0x400;
            var_8 = cosMul(word_3BE94, 0x10 << var_2);
            dword_3B1FE = dword_3C01C - sinMul(word_3C5AA, var_8);
            dword_3B4D4 = 0x100000 - (cosMul(word_3C5AA, var_8) + dword_3C024);
            word_3B4DE = word_3C02C - sinMul(word_3BE94, 0x10 << var_2);
        }
        break;
    case 0x8c:
        word_3BE94 = 0xf400;
        word_3B4E4 = 0;
        dword_3B1FE = (int32)word_3C028 << 5;
        dword_3B4D4 = (0x8000 - (int32)word_3C03A) << 5;
        word_3B4DE = word_3C040;
        break;
    }
    if (abs(word_3BE94) > 0x4000 || word_3BE94 == 0x8000) {
        word_3BE94 = 0x8000 - word_3BE94;
        word_3C5AA += 0x8000;
        word_3B4E4 = 0x8000 - word_3B4E4;
    }
    if (keyValue == 0) {
        memcpy(unk_3A948, unk_3806E, 0x12);
    }
    else {
        buildRotationMatrixFar(unk_3A948, word_3C5AA, word_3BE94, word_3B4E4);
    }
    word_3B4DE = word_3B4DE < 0x10 ? 0x10 : word_3B4DE;
    var_E = word_330C2;
    word_330C2 = (keyValue & 0xc0) == 0;
    if (var_E != word_330C2) {
        gfx_waitRetrace();
        if (word_330C2 != 0) {
            gfx_nop23();
            // the pointer arguments are probably rastports, RectCopy?
            gfx_copyRect(*off_38364, 0, 0x61, *off_38334, 0, 0x61, 0x140, 0x67);
            gfx_copyRect(*off_38364, 0, 0x61, *off_3834C, 0, 0x61, 0x140, 0x67);
            sub_15FDB();
            drawWeaponAmmo();
            drawWeaponSelectMarker(missileSpecIndex);
            if (word_3C09A == 0) {
                redrawTacMap(word_3BEC0, word_3BED0);
            }
            word_336F4 = word_336F2 = 0xffff;
            fillPanelBox(3, 3);
            word_39604 = 0;
        }
        else {
            gfx_copyRect(*off_38334, 0, 0x61, *off_38364, 0, 0x61, 0x140, 0x67);
        }
    }
    if (keyValue != word_38152) {
        if (keyValue == 0x42 || keyValue == 0x43 || keyValue == 0x41) {
            gfx_waitRetrace();
            if (gfx_getModecode() == 3) {
                openBlitClosePic(keyValue == 0x42 ? a256left_pic : keyValue == 0x43 ? a256right_pic : a256rear_pic, *off_38334);
            }
            else {
                openBlitClosePic(keyValue == 0x42 ? aLeft_pic : keyValue == 0x43 ? aRight_pic : aRear_pic, *off_38334);
            }
            gfx_copyRect(*off_38334, 0, 0x61, *off_3834C, 0, 0x61, 0x140, 0x67);
            off_38334[8] = off_3834C[8] = 0x60;
        }
        else {
            off_38334[8] = off_3834C[8] = word_330C2 != 0 ? 0x60 : 0xc7;
        }
        word_38152 = keyValue;
    }
    byte_34197 = byte_228D0[0x2f];
    *(uint8*)(&word_3BE98) = 3;
    if (word_38FDC == 0 && commData->gfxModeNum != 0) {
        byte_34197 = 3;
        *(uint8*)(&word_3BE98) = 0x0b;
    }
    copySomeMem(word_330BC);
    *(uint8*)(&word_36B86) = 0;
#if defined(DEBUG) && defined(DISABLE_3D)
    /* Skip the whole 3D render (incl. drawHudWorldOverlay HUD) to get continuous frames. */
#else
    /* clip height = viewport bottom (rastport word [8], i.e. byte 0x10). The
       reconstruction previously used [0x10] (byte 0x20), which is where the 3D
       engine writes the per-frame horizon -> the 3D drew down over the whole
       cockpit and drove the rasterizer into the freeze. The original renderFrame
       reads off_38334[8]+1 (Ghidra FUN_1000_55ab). */
    render3DView(-word_3C5AA, word_3BE94, word_3B4E4, dword_3B1FE, dword_3B4D4, (int32)word_3B4DE, 0, 0, 0x140, off_38334[8] + 1);
#endif
    byte_3850E = 0;
    byte_3995A = word_36B86;
    if (keyValue == 0x41) {
        drawVectorShape(unk_38128);
        gfx_setColor(0xf);
        word_3755D = 0xf1;
        word_37561 = 0x15;
        word_3755F = 0xfb;
        word_37563 = 0x5e;
        drawClipLineGlobal();
        word_3755D = 0x53;
        word_37561 = 0x15;
        word_3755F = 0x49;
        word_37563 = 0x5e;
        drawClipLineGlobal();
        gfx_nop23();
        var_E = byte_3C5A0;
        byte_3C5A0 = gfx_getDisplayPage();
        blitSprite(0x6b, 0x30, 0xd1, 0, 0x6f, 0x2f, 0);
        blitSprite(0x41, 0x5f, 0x7d, 0x36, 0xc3, 2, 0);
        byte_3C5A0 = var_E;
    }
    gfx_flipPage();
    word_38126 = (word_3C09E == 0x13 || word_3C09A == 1 || word_330C2 == 0) ? 0xc8 : 0x61;
    TRACE(("renderFrame: exit"));
}

void sub_15FDB(void) {
    if (word_330C2 != 0) {
        setDrawColor(0);
#ifdef BUGFIX
        fillRectBoth(0xd4, 0x7f, 0xde, 0xaf);
#else
        fillRectBoth(0xd4, 0x7f, 0xde, 0xaf, 0xc4);
#endif
        setDrawColor(0x0c);
        fillRectBoth(0xd4, -(var_552 / 3 - 0xaf), 0xde, 0xaf);
        if (100 < var_552) {
            setDrawColor(0x0e);
            fillRectBoth(0xd4, -(var_552 / 3 - 0xaf), 0xde, 0x8e);
        }
    }
}
void drawFuelGauge(void) {
    if (word_330C2 == 0) {
        return;
    }
    setDrawColor(0);
    fillRectBoth(5, 0x6d, 0x0a, 0x98);
    setDrawColor(word_33098 > 2000 ? 2 : 14);
    fillRectBoth(5, -(word_33098 / 250 - 0x98), 0x0a, 0x98);
}

void drawVectorShape(int16 *shapeData) {
    while (*shapeData != -1) {
        gfx_setColor(((uint8 *)word_3419C)[*shapeData++]);
        resetScanlineSpans();
        shapeData += 2;
        while (*shapeData != -1) {
            var_351 = shapeData[-2];
            var_353 = shapeData[-1];
            var_352 = *shapeData++;
            var_354 = *shapeData++;
            clipAndRasterizeEdge();
        }
        flushSpanDirtyRect();
        shapeData++;
    }
}

void waitForKeyPress(void) {
    int p;

    audio_jump_69();
    p = var_383;
loop:
    while (kbhit() == 0)
        ;
    if (_bios_keybrd(0) == 0x1900)
        goto loop;
    sub_1DA8D();
    var_383 = p;
}

