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


void stepFlightModel(void) {
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
        g_ourPitch =
        g_ourRoll =
        g_viewZ =
        word_380D0 =
        g_velocity =
        g_setThrust =
        g_thrust = 0;

        if (gameData->difficulty == 0) {

            g_ourHead = ((g_viewY_ - (waypoints[1].mapY)) < 0x8000) ? 0 : 0x8000;
        } else {
            g_ourHead = (gameData->theater == 6)
               ? 0  // If true, the result is 0
               : ((gameData->theater & 1) ? 0 : 0x8000); // Else, evaluate the second condition
        }

        if (g_planes[g_playerTargetIndex].flags & 0x200) {
            *((unsigned char*)&g_ourHead + 1) += 4;
        }

        rebuildOrientation();
        UpdateThrottleState();
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
            g_setThrust = clampRange(g_setThrust - 10, 0, 100);
            UpdateThrottleState();
            goto switch_break;
        case 0x0D3D: // Equal
            g_setThrust = clampRange(g_setThrust + ((g_setThrust < 10) ? 5 : 10), 0, 100);
            UpdateThrottleState();
            *((unsigned char*)&g_playerPlaneFlags) &= 0xF7; // ~8
            goto switch_break;
        case 0x1E61: // A
            g_setThrust = 0x90;
            UpdateThrottleState();
            *((unsigned char*)&g_playerPlaneFlags) &= 0xF7; // ~8
            goto switch_break;
        case 0x0D2B: // Shift-Equal
            g_setThrust = 100;
            UpdateThrottleState();
            *((unsigned char*)&g_playerPlaneFlags) &= 0xF7; // ~8
            goto post_key_B_check;
        case 0x0C5F: // Shift-Minus
            g_setThrust = 0;
            makeSound(0x10, 0);
            UpdateThrottleState();
            goto switch_break;
        case 0x3062: // B
            *((unsigned char*)&g_playerPlaneFlags) ^= 8;
        post_key_B_check:
            if (!(*((unsigned char*)&g_playerPlaneFlags) & 8) && word_3BEBE != 0 && g_setThrust == 100) {
                g_velocity = 0x546;
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
                gfx_copyRect(*var_564, 0, 0x61, *off_38364, 0, 0x61, 0x140, (int)aNc_xxx);
            }
            setDrawColor(0);
            fillRectBoth(0, 0, 0x13F, 0xC7);
            blitSprite(0, 0, 0x71, 0x37, 0x0C, 7, 0);
            waitForKeyPress();
            if (word_330C2 != 0) {
                gfx_copyRect(*off_38364, 0, 0x61, *var_564, 0, 0x61, 0x140, (int)aNc_xxx);
                gfx_copyRect(*off_38364, 0, 0x61, *var_565, 0, 0x61, 0x140, (int)aNc_xxx);
                UpdateThrottleState();
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

    if (g_setThrust != 0 && g_thrust == 0) {
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

    if (word_3BEBE == g_viewZ && word_3C5A4 < 0 && g_ourPitch <= 0) {
        word_3C5A4 = 0;
    }

    if (g_knots > 0x15E && !(*((unsigned char*)&g_playerPlaneFlags) & 1) && word_336EC != 0) {
        word_336EC = 0;
        *((unsigned char*)&g_playerPlaneFlags) |= 1;
        tempStrcpy((char *)aLandingGearRaised);
        makeSound(0x20, 2);
    }

    if (word_3BEBE == g_viewZ && g_setThrust == 0 && !(*((unsigned char*)&g_playerPlaneFlags) & 8)) {
        *((unsigned char*)&g_playerPlaneFlags) |= 8;
        tempStrcpy((char *)aBrakesOn);
    }

    if (word_3C00E != 0 || word_3C5A4 != 0) {
        g_autopilotAltitude = 0;
    }

    if (g_autopilotAltitude != 0)
    {
        x = (word_336EA != 0) ? (int16)((word_38FE0 & 0xF) << 8) - 0x800
                                   : 0;

        x = clampValue(x - g_ourHead + word_3BE92, 0xEC00, 0x1400) * 2;

        word_3C00E = -clampRange((x - g_ourRoll) >> 6, -24, 24);

        d = clampValue(((g_autopilotAltitude - g_viewZ) << 4) - word_38FC4, 0xEC00, 0xC00);

        word_3C5A4 = clampRange((d - g_ourPitch) >> 7, -8, 8);

        if (waypointIndex == 3)
        {
            o = word_3AFA8;
            s = word_3B15A;

            h = g_planes[s].mapX - g_viewX_;
            z = g_planes[s].mapY - g_viewY_;

            if (!(g_planes[s].flags & 0x200))
            {
                o = -signOf(z);
            }

            z += ((g_planes[s].flags & 0x200) ? 0x1E : 0x40) * o;

            x = abs(g_ourHead);
            if (o == -1)
            {
                h = -h;
                z = -z;
                x = abs(g_ourHead - 0x8000);
            }

            d = clampRange((abs(h) + abs(z)) * 2 + x / 32, 50, 0x1000);
            if (d < 0x1000)
            {
                exitSlowMotion();
            }

            if (g_planes[s].flags & 0x200)
            {
                d += 100;
            }

            if (word_33702 != 0 && abs(x) < 0x200)
            {
                d = -20;
            }

            z = g_planes[s].mapY + (((g_planes[s].flags & 0x200) ? 0x1C : 0x38) * o);

            z += clampRange((abs(h) * 4) + (x / 16), 0, 0xC00) * o;

            *((unsigned char *)&g_playerPlaneFlags) &= 0xF7;

            if (x > 0x4000)
            {
                h = g_planes[s].mapX;
                d = 0x1000;
            }
            else
            {
                h = g_planes[s].mapX + (o * h * 2);
                if (g_setThrust * 80 < g_knots)
                {
                    *((unsigned char *)&g_playerPlaneFlags) |= 8;
                }
            }

            c = computeBearing(h - g_viewX_, g_viewY_ - z);
            n = (int16)g_knots / 16;

            x = clampValue(c - g_ourHead, (-n) << 8, n << 8) * 2;

            if (word_33702 != 0)
            {
                x = 0;
            }

            word_3C00E = -clampRange((x - g_ourRoll) >> 6, -32, 32);

            g_setThrust = clampRange((abs(x) / 256) + (d / 64), 35, 80);
            UpdateThrottleState();

            d = clampValue(((d - g_viewZ) >> 3) + (word_38FC4 >> 7), -24, 24);

            word_3C5A4 = clampRange(d - (g_ourPitch >> 7), -16, 16);

            if (g_knots < 0x15E)
            {
                *((unsigned char *)&g_playerPlaneFlags) &= 0xFE;
            }

            if (word_3BEBE == g_viewZ)
            {
                g_setThrust = 0;
                word_3C00E = 0;
                g_playerPlaneFlags |= 8;
                word_3C5A4 = 0;
            }
        }
    }
    if (gameData->unk4 != 0) {
        ae = ((int32)g_knots * (1000 - g_viewZ)) >> 15;
    } else {
        ae = 0;
    }

    if (!((g_playerPlaneFlags) & 1)) {
        ae += clampRange((g_knots - 200) >> 5, 0, 32);
    }

    if (ae > 0 && ((uint16)word_3BEBE) < ((uint16)g_viewZ)) {
        word_3C00E += randomRange(ae) - (ae >> 1);
        word_3C5A4 += (randomRange(ae) - (ae >> 1)) >> 1;
    }

    if ((g_playerPlaneFlags & 1) && word_3C5A4 <= 0 && ((uint16)word_3A8FE) < ((uint16)g_velocity) && gameData->unk4 < 2 && abs(g_ourRoll) < 0x3000 && word_38FE8 == 0) {
        d = ((((word_38FC4) - (g_ourPitch)) >> 2) - g_viewZ + 300) >> 2;
        if (d > 0) {
            word_3C5A4 = clampRange(d, 0, 32);
        }
    }

    if (word_3BE3C != 0) {
        word_3C00E = 0x40;

        word_3C5A4 = (abs(g_ourRoll) > 0x4000) ? 0x10 : -8; // pitch_input_modifier

        //word_3BE3C++;
        word_3C040 += clampRange(
            - (++word_3BE3C - 0x20),
            (int16)0xFF00 / g_frameRateScaling,
            (int16)0x80 / g_frameRateScaling
        );
        //word_3C040 += stall_decay_effect;

        if (word_3C040 < 0) {
            word_3C040 = 0;
            if ((word_38FE0 & 7) == 0) {
                finalizeMission(0);
            }
        }

        if (g_viewZ == 0 && word_336F6 == -1) {
            word_336F6 = 0;
            g_planes[0].mapX = g_viewX_;
            g_planes[0].mapY = g_viewY_;
            word_3BEBC = g_viewX_;
            word_3BEC8 = g_viewY_;
            word_3BECE = 0;
            word_39606 = -8;
            makeSound(2, 2);
            g_velocity =
            g_setThrust = 0;
        }

        if ((word_3BE3C & 0xFFFC) == 0x10 && (frameTick & 3) == 1) {
            word_336F6 = -1;

            l = ((uint16)frameTick / 2) & 7;

            ((struct struc_9*)stru_33402)[l].field_0 = g_viewX_;
            ((struct struc_9*)stru_33402)[l].field_2 = g_viewY_;
            ((struct struc_9*)stru_33402)[l].field_4 = g_viewZ;

            ((struct struc_9*)stru_33402)[l].field_6 = randomRange(0x20) << 11;

            word_33442 = l;
            word_3BEBC = g_viewX_;
            word_3BEC8 = g_viewY_;
            word_3BECE = g_viewZ;
            word_39606 = -8;
            makeSound(0, 2);

            g_ourPitch = -0x4000;
            byte_380DD = 1;
        }
    }

    if (g_gunHits != 0) {
        if (g_setThrust > -((g_gunHits * 4) - 0x90)) {
            g_setThrust = -((g_gunHits * 4) - 0x90);
            if (g_setThrust < 0)
                g_setThrust = 0;
            UpdateThrottleState();
        }
    }

    g_thrust += ((g_setThrust - g_thrust) / 4) / ((int16)g_frameRateScaling);
    if (g_setThrust > g_thrust) g_thrust++;
    if (g_setThrust < g_thrust) g_thrust = g_setThrust;

    if ((((uint16)frameTick) % ((uint16)(g_frameRateScaling << 1))) == 0 && g_setThrust != 0 && word_336EA == 0) {
        word_33098 -= ((g_setThrust * g_setThrust) / 750) + 2;
        drawFuelGauge();
    }

    if (word_33098 <= 0) {
        g_thrust = 0;
        word_33098 = 0;
    }

    g_gees = byte_37FEC[(abs(g_ourRoll) >> 8) & 0x7f];
    if (((uint16)word_3BEBE) < ((uint16)g_viewZ)) {
        g_gees += word_3C5A4 / 2;
    }

    if (g_gees > 0x80) {
        g_gees = 0x80;
        word_3C5A4 = clampRange(0x80 - byte_37FEC[(abs(g_ourRoll) >> 8) & 0x7f], 0, word_3C5A4);
    }


    strcpy(unk_38FD0, itoa(g_gees / 16, strBuf, 10));
    strcat(unk_38FD0, (char *)a_);

    strcat(unk_38FD0, itoa((abs(g_gees) & 0xF) >> 1, strBuf, 10));
    strcat(unk_38FD0, (char *)aG);

    j = ((long)(g_thrust - sinMul(g_ourPitch, 80)) * 800L) / 100L;

    word_3C5A6 = 100;
    j = ((((uint16)g_viewZ >> 7) + 0x0400) * (int32)(j & j)) >> 10; // j & j folds to a plain load but ranks the operand "heavy", so the shift-expr is evaluated/pushed first like the ref

    word_3C5A6 = ((int32)100 * (uint32)((word_380D0 >> 6) + 0x0400)) >> 10;

    j = ((int32)j) * ((int32)(-((word_33098 >> 9) - 100))) / (int32)90;

    j = (((int32)j) * ((int32)(128 - g_gees))) >> 7;

    word_3C5A6 = ((int32)isqrt(g_gees * 4) * (int32)word_3C5A6) >> 3;
    word_3C5A6 = abs(word_3C5A6);

    if (!(*((unsigned char*)&g_playerPlaneFlags) & 1)) {
        j -= j >> 3;
    }

    word_3A8FE = word_3C5A6 * 27;
    e = clampRange(j, 0, 899) * 27;

    g_velocity += ((((int32)e - g_velocity) / 16) / (int32)g_frameRateScaling);

    word_3B4DA = ((int32)word_3A8FE * 3072) / (abs(g_velocity) + 1);
    if ((uint16)word_3B4DA > 0x2000) word_3B4DA = 0x2000;

    word_38FC4 = cosMul(g_ourRoll, word_3B4DA - 0x300);

    if (*((unsigned char*)&g_playerPlaneFlags) & 8) {
        if (word_3BEBE == g_viewZ) {
            g_velocity -= (-((gameData->unk4 * 8) - 32) * 27) / g_frameRateScaling;
            if (word_3BEBE != 0 && (uint16)g_velocity < 0x1B0) {
                 g_velocity = 0;
            }
        } else {
             g_velocity -= ((uint16)g_velocity >> 4) / g_frameRateScaling;
        }
    }

    if ((uint16)g_velocity > 0xAFC8) g_velocity = 0;

    v = cosMul(g_ourPitch, g_velocity);
    g_knots = (uint16)g_velocity / 27;

    audio_jump_6a(g_knots, g_thrust);

    ac = (((int32)sinMul(g_ourRoll, g_gees << 4)) << 7) / ((int32)((int16)((uint16)g_velocity >> 9) + 0x20));

    ac = cosMul(g_ourPitch, ac);

    if (word_3BEBE == g_viewZ) {
        ac = (word_3C00E * -1) << 6;
        word_3C00E = 0;
        if (g_knots < word_3C5A6) {
            word_3C5A4 = 0;
        }
    }

    if (word_38FDE != 0) {
        word_3C5A4 = -0x400 - g_ourPitch;
        // (ref stores velocity then setThrust; chains store right-to-left)
        g_setThrust =
        g_velocity = 0;
    }

    g = (((int32)word_3C00E) << 7) / ((int32)g_frameRateScaling);
    if (g != 0) {
        word_380AC = word_380A4 = cosine(g);
        word_380A6 = sine(g);
        word_380AA = -word_380A6;
        applyRotationDelta(unk_3806E, &word_380A4);
    }

    f = (int16)((int32)word_3C5A4 << 7) / g_frameRateScaling;
    if (f != 0) {
        word_380A2 = word_3809A = cosine(f);
        word_380A0 = sine(f);
        word_3809C = -word_380A0;
        applyRotationDelta(unk_3806E, unk_38092);
    }

    t = (int16)ac / g_frameRateScaling;
    if (t != 0) {
        word_38090 = word_38080 = cosine(t);
        word_38084 = sine(t);
        word_3808C = -word_38084;
        applyRotationDelta(&word_38080, unk_3806E);
    }

    computeAttitudeAngles();

    if ((uint16)word_3A8FE > (uint16)g_velocity && (uint16)word_3BEBE < (uint16)g_viewZ) {
        g_ourPitch -= ((uint16)word_3A8FE - (uint16)g_velocity) >> ((gameData->unk4 == 2 || g_gunHits > 8) ? 1 : 2);
        byte_380DD = 1;
        if (g_ourPitch < 0 || (uint16)g_viewZ < 200) {
            makeSound(0x14, 1);
        }
    }

    if (word_3BEBE == g_viewZ) {
        if (g_ourRoll != 0) {
            g_ourRoll = 0;
            byte_380DD = 1;
        }
        if (g_ourPitch < 0 || (g_ourPitch > 0 && g_knots < word_3C5A6)) {
            if (word_38FDE == 0) {
                g_ourPitch = 0;
            }
            byte_380DD = 1;
        }
    }

    word_38FDE = 0;

    byte_3C6A0[0] = ( (abs(g_ourPitch)) - (abs(g_ourRoll) / 2) > 0x1000) ? 1 : 0;

    if (byte_380DD) {
        rebuildOrientation();
    }

    b = word_380D0;
    word_3C8B6 = fixedMulQ14((((uint16)g_velocity) / 10), sine(g_ourPitch - word_38FC4));

    if (word_33712 == 0) {
        word_380D0 += (word_3C8B6 / g_frameRateScaling);

        g_ViewX += fixedMulQ14(v, sine(g_ourHead)) / 10 / g_frameRateScaling;

        g_ViewY += fixedMulQ14(v, cosine(g_ourHead)) / 10 / g_frameRateScaling;
    }

    if ((uint16)word_380D0 > 0xf230 || (uint16)word_380D0 < (uint16)word_3BEBE) {
        word_380D0 = word_3BEBE;
    }
    if (word_380D0 > 0xEA60) word_380D0 = 0xEA60;

    if (word_380D0 < 0x2000) {
        g_viewZ = word_380D0;
    } else if (word_380D0 < 0x4000) {
        g_viewZ = ((word_380D0 - 0x2000) >> 1) + 0x2000;
    } else {
        g_viewZ = ((word_380D0 - 0x4000) >> 2) + 0x3000;
    }

    if (word_3BEBE == g_viewZ) {
        if (b > word_3BEBE && word_33702 != 0) {
            makeSound(0xC, 2);
            //temp_bx = g_closestThreatIndex << 4;

            if ((( ((g_planes[g_closestThreatIndex].flags & 0x200) ? 0x100 : 0x80)
                < ((int16)(-word_3C8B6 * g_missionStatus) / 2))) ||
                ((gameData->unk4 != 0 &&
                    (((g_playerPlaneFlags & 1)!=0) ||
                        (((int16)abs(g_ourRoll)) > (int16)((0x30 / (g_missionStatus + 1)) << 8))) ))) {
                            makeSound(0, 2);
                            waitFrameSync(0x3C);
                            finalizeMission(5);
            }
        }
        word_3C8B6 = 0;
    }

    l = frameTick & 0xF;
    stru_3A95A[l].heading = g_ourHead;
    stru_3A95A[l].pitch = g_ourPitch;
    stru_3A95A[l].roll = g_ourRoll;
    *(int32*)&stru_3A95A[l].worldX = g_ViewX;
    *(int32*)&stru_3A95A[l].worldY = g_ViewY;
    stru_3A95A[l].alt = g_viewZ;

    if (g_currentWeaponType == 1) {
        if (word_336F2 >= 0) {
            // TODO struct
            l = clampRange((rangeApprox(g_viewX_ - word_3B204[word_336F2 * 0x12], g_viewY_ - word_3B206[word_336F2 * 0x12]) * g_frameRateScaling) >> 8, 0, 12);

        } else {
            l = g_frameRateScaling - 1;
        }

        l = (frameTick - l) & 0xF;

        x = g_ourHead - stru_3A95A[l].heading;
        d = g_ourPitch - stru_3A95A[l].pitch;

        word_3C6A4 = cosMul(g_ourRoll, ((-x) >> 2)) + sinMul(g_ourRoll, (d >> 2));

        word_3C6AC = sinMul(g_ourRoll, (x >> 2)) + cosMul(g_ourRoll, (d >> 1));
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

void computeAttitudeAngles(void)
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
        if (word_37348[b] <= a) {
            c = word_3734A[b] - word_37348[b];
            p = (int)((long)(a - word_37348[b]) * 256L / (long)c) + b * 256;
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
    dword_3B1FE = dword_3C01C = g_ViewX;
    dword_3B4D4 = g_ViewY;
    dword_3C024 = 0x100000 - g_ViewY;
    TRACE(("renderFrame: past assigns"));
    word_3B4DE = g_viewZ + 0x18;
    word_3C02C = g_viewZ;
    var_2 = word_336FE = clampRange(word_336FE, 2, 8);
    TRACE(("renderFrame: past clamp, keyValue=%d", keyValue));
    switch(keyValue) {
    case 0:
    case 0x44:
        word_3C5AA = g_ourHead;
        word_3BE94 = g_ourPitch;
        word_3B4E4 = g_ourRoll;
        break;
    case 0x41:
        word_3C5AA = g_ourHead + 0x8000;
        word_3BE94 = -g_ourPitch;
        word_3B4E4 = -g_ourRoll;
        break;
    case 0x43:
        word_3C5AA = g_ourHead + 0x4000;
        word_3BE94 = -g_ourRoll;
        word_3B4E4 = g_ourPitch;
        break;
    case 0x42:
        word_3C5AA = g_ourHead - 0x4000;
        word_3BE94 = g_ourRoll;
        word_3B4E4 = -g_ourPitch;
        break;
    case 0x84:
        var_E = (frameTick - ((g_frameRateScaling  + 1) / 2) - 1) & 0xf;
        word_3C5AA = stru_3A95A[var_E].heading;
        word_3BE94 = stru_3A95A[var_E].pitch;
        word_3B4E4 = stru_3A95A[var_E].roll;
        dword_3B1FE = stru_3A95A[var_E].worldX;
        dword_3B4D4 = stru_3A95A[var_E].worldY;
        word_3B4DE = stru_3A95A[var_E].alt;
        break;
    case 0x85:
        word_3C5AA = g_ourHead - 0x4000;
        word_3BE94 = 0;
        word_3B4E4 = 0;
        dword_3B1FE = sinMul(g_ourHead + 0x4000, 0x18 << var_2) + g_ViewX;
        dword_3B4D4 = cosMul(g_ourHead + 0x4000, 0x18 << var_2) + g_ViewY;
        break;
    case 0x86:
        word_3C5AA = 0x8000;
        word_3BE94 = 0;
        word_3B4E4 = 0;
        dword_3B4D4 = (0x18 << var_2) + g_ViewY;
        break;
    case 0x87:
        word_3C5AA = g_ourHead;
        word_3BE94 = 0;
        word_3B4E4 = 0;
        dword_3B1FE = sinMul(g_ourHead + 0x8000, 0x18 << var_2) + g_ViewX;
        dword_3B4D4 = cosMul(g_ourHead + 0x8000, 0x18 << var_2) + g_ViewY;
        word_3B4DE = (4 << var_2) + g_viewZ;
        break;
    case 0x88:
    case 0x89:
    case 0x8b:
        if (keyValue != 0x89) {
            if (g_currentWeaponType == 1) {
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
                    stru_335C4[word_3C02E].worldX = g_ourHead;
                    stru_335C4[word_3C02E].worldY = g_ourPitch;
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
            dword_3C01C = (uint32)g_planes[word_3C02E & 0x3f].mapX << 5;
            dword_3C024 = (uint32)g_planes[word_3C02E & 0x3f].mapY << 5;
            word_3C02C = g_planes[word_3C02E & 0x3f].flags & 0x200 ? 0xc8 : 0x32;
            var_2 = 7;
            if (word_336EA != 0 && word_3370C == -1) var_2 = 6;
        }
        if (word_3370E == 0) var_2 = var_4;
        var_A = (dword_3C01C >> 5) - g_viewX_;
        var_C = (dword_3C024 >> 5) - g_viewY_;
        var_6 = rangeApprox(var_A, var_C);
        word_3C5AA = computeBearing(var_A, -var_C);
        word_3BE94 = -computeBearing((word_3C02C - g_viewZ) >> 5, var_6);
        word_3B4E4 = 0;
        var_8 = cosMul(word_3BE94, 0x18 << var_2);
        if (word_3C02E & 0x60 || word_3370E != 0) {
            if (keyValue == 0x88) {
                dword_3B1FE = sinMul(word_3C5AA + 0x8000, var_8) + g_ViewX;
                dword_3B4D4 = cosMul(word_3C5AA + 0x8000, var_8) + g_ViewY;
                word_3B4DE = sinMul(word_3BE94, 0x18 << var_2) + (4 << var_2) + g_viewZ;
                word_3BE94 = -word_3BE94;
            }
            else {
                dword_3B1FE = sinMul(word_3C5AA, var_8) + dword_3C01C;
                dword_3B4D4 = cosMul(word_3C5AA, var_8) - dword_3C024 + 0x100000;
                word_3B4DE = (4 << var_2) - sinMul(word_3BE94, 0x18 << var_2) + word_3C02C;
                if (word_3C02E & 0x40 && g_planes[word_3C02E & 0x3f].flags & 0x200 && word_3B4DE < 0x84) {
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
            UpdateThrottleState();
            drawWeaponAmmo();
            drawWeaponSelectMarker(missileSpecIndex);
            if (word_3C09A == 0) {
                redrawTacMap(g_viewX_, g_viewY_);
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
    loadColorPalette(word_330BC);
    *(uint8*)(&word_36B86) = 0;
    render3DView(-word_3C5AA, word_3BE94, word_3B4E4, dword_3B1FE, dword_3B4D4, (int32)word_3B4DE, 0, 0, 0x140, off_38334[8] + 1);
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

void UpdateThrottleState(void) {
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
    updateEngineSound();
    var_383 = p;
}
