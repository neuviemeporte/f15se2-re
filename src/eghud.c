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


// otherKeyDispatch (seg000:3f72-51f8) reconstructed in C (see egame_rc.asm EXTRN).
// The reconstruction's working symbol names are aliased to the current
// descriptive symbol names below, and #undef'd right after the function so
// they do not leak into the rest of this translation unit.
#define g_thrust word_3AFA6
#define g_setThrust word_380E0
#define g_velocity word_3A944
#define g_viewZ word_380CE
#define g_ourRoll word_380CC
#define g_ourPitch word_380CA
#define g_ourHead word_380C8
#define g_viewY_ word_3BED0
#define g_viewX_ word_3BEC0
#define g_planes stru_3AA5E
#define g_playerTargetIndex word_3B148
#define g_playerPlaneFlags planeFlags
#define noJoy80 joyAxes[0]
#define noJoy80_2 joyAxes_2[0]
#define g_knots word_3AA5A
#define g_frameRateScaling word_330C4
#define g_gees word_38FDA
#define g_gunHits word_3BF90
#define g_missionStatus word_330B8
#define g_autopilotAltitude word_330B6
#define g_closestThreatIndex word_3C16A
#define g_currentWeaponType word_3C45C
#define g_ViewX dword_3B7DA
#define g_ViewY dword_3B7F8
#define word_336E8 frameTick
#define var_566 off_38364
#define UpdateRotationMatrix rebuildOrientation
#define UpdateThrottleState sub_15FDB
#define PrepareToExit finalizeMission
#define DrawHUDElement fillRectBoth
#define TransformAndProjectObject_2 blitSprite
#define FixedPointMul fixedMulQ14
#define ARCTAN computeBearing
#define Dist2D rangeApprox
#define sinX sinMul
#define cosX cosMul
#define forceRange sub_1CF8E
#define gfx_jump_2a gfx_copyRect
#define abs_word abs
#define randlmul randomRange
#define sub_12278 waitFrameSync
#define sub_13B86 cosine
#define sub_13B96 sine
#define sub_151F9 applyRotationDelta
#define sub_15237 computeHudAttitude
#define sub_15557 isqrt
#define sub_1606C drawFuelGauge
#define sub_1613B waitForKeyPress
#define sub_19E44 setDrawColor
#define sub_1CF64 clampRange
#define sub_1D1C8 signOf
#define sub_2265B initJoystickCalibration
#define sub_2267E readCalibratedJoystick

int otherKeyDispatch(void) {
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



    // seg000:3F7A
    if (word_3BECC == 0) {
        // seg000:3F81 (MSC stores chained assignments right-to-left:
        // ref store order is thrust, setThrust, velocity, 380D0, viewZ, roll, pitch)
        g_ourPitch =
        g_ourRoll =
        g_viewZ =
        word_380D0 =
        g_velocity =
        g_setThrust =
        g_thrust = 0;

        // seg000:3F9C
        if (gameData->difficulty == 0) {
            
            // seg000:3FA2
            g_ourHead = ((g_viewY_ - (waypoints[1].mapY)) < 0x8000) ? 0 : 0x8000;
        } else {
            // seg000:3FBA
            g_ourHead = (gameData->theater == 6)
               ? 0  // If true, the result is 0
               : ((gameData->theater & 1) ? 0 : 0x8000); // Else, evaluate the second condition
        }

        // seg000:3FDE
        if (g_planes[g_playerTargetIndex].flags & 0x200) {
            // seg000:3FE6
            *((unsigned char*)&g_ourHead + 1) += 4;
        }

        // seg000:3FEB
        UpdateRotationMatrix();
        // seg000:3FEE
        UpdateThrottleState();
        // seg000:3FF1
        word_3BECC = 1;
    }

    // seg000:3FF7
    keyScancode = 0;
    // seg000:3FFD
    if (kbhit()) {
        // seg000:4007
        keyScancode = _bios_keybrd(0);
        // seg000:4010
        if (word_336EA == 1) {
            // seg000:4019
            word_3370E = 
            word_336EA = 
            keyValue = 0;
        }
    }

    // seg000:4022
    while (kbhit()) {
        // seg000:402C
        _bios_keybrd(0); // Flush keyboard buffer
    }

    // Main key dispatch logic
    // seg000:4037
    switch ((unsigned)keyScancode) {
        // seg000:41F5
        case 0x0C2D: // Minus
            // seg000:403A
            g_setThrust = sub_1CF64(g_setThrust - 10, 0, 100);
            // seg000:4051
            UpdateThrottleState();
            // seg000:4054
            goto switch_break;
        // seg000:420D
        case 0x0D3D: // Equal
            // seg000:4057
            g_setThrust = sub_1CF64(g_setThrust + ((g_setThrust < 10) ? 5 : 10), 0, 100);
            // seg000:407B
            UpdateThrottleState();
            // seg000:407E
            *((unsigned char*)&g_playerPlaneFlags) &= 0xF7; // ~8
            // seg000:4083
            goto switch_break;
        // seg000:421C
        case 0x1E61: // A
            // seg000:4086
            g_setThrust = 0x90;
            // seg000:408C
            UpdateThrottleState();
            // seg000:408F
            *((unsigned char*)&g_playerPlaneFlags) &= 0xF7; // ~8
            // seg000:4094
            goto switch_break;
        // seg000:4205
        case 0x0D2B: // Shift-Equal
            // seg000:4097
            g_setThrust = 100;
            // seg000:409D
            UpdateThrottleState();
            // seg000:40A0
            *((unsigned char*)&g_playerPlaneFlags) &= 0xF7; // ~8
            // seg000:40A5
            goto post_key_B_check;
        // seg000:41FD
        case 0x0C5F: // Shift-Minus
            // seg000:40A7
            g_setThrust = 0;
            // seg000:40B4
            makeSound(0x10, 0);
            // seg000:40BA
            UpdateThrottleState();
            // seg000:40BD
            goto switch_break;
        // seg000:4234
        case 0x3062: // B
            // seg000:40C0
            *((unsigned char*)&g_playerPlaneFlags) ^= 8;
        // seg000:40C5
        post_key_B_check:
            // seg000:40C5
            if (!(*((unsigned char*)&g_playerPlaneFlags) & 8) && word_3BEBE != 0 && g_setThrust == 100) {
                // seg000:40DA
                g_velocity = 0x546;
                // seg000:40E8
                makeSound(0x1C, 2);
            }
            // seg000:40EE
            goto switch_break;
        // seg000:4224
        case 0x2400: // Alt-J
            // seg000:40F1
            if (word_380E2 == 0) {
                // seg000:40F8
                sub_2265B();
                // seg000:40FD
                word_380E2 = 40;
            }
            // seg000:4103
            goto switch_break;
        // seg000:41EB
        case 0x1000: // Alt-Q
            // seg000:410A
            PrepareToExit(1);
            // seg000:4110
            exitCode = 0;
            // seg000:4115
            goto switch_break;
        // seg000:422C
        case 0x3000: // Alt-B
            // seg000:4118
            if (word_330C2 != 0) {
                // seg000:4141
                gfx_jump_2a(*var_564, 0, 0x61, *var_566, 0, 0x61, 0x140, 0x67);
            }
            // seg000:414C
            sub_19E44(0);
            // seg000:415E
            DrawHUDElement(0, 0, 0x13F, 0xC7);
            // seg000:417B
            TransformAndProjectObject_2(0, 0, 0x71, 0x37, 0x0C, 7, 0);
            // seg000:4181
            sub_1613B();
            // seg000:4184
            if (word_330C2 != 0) {
                // seg000:41AD
                gfx_jump_2a(*var_566, 0, 0x61, *var_564, 0, 0x61, 0x140, 0x67);
                // seg000:41D7
                gfx_jump_2a(*var_566, 0, 0x61, *var_565, 0, 0x61, 0x140, 0x67);
                // seg000:41DF
                UpdateThrottleState();
            }
            // seg000:41E2
            goto switch_break;
        // seg000:4217
        case 0x1900: // Alt-P
            // seg000:41E4
            sub_1613B();
            // seg000:41E7
            goto switch_break;
    }

// seg000:423E
switch_break:
    // seg000:423E
    if (word_380E2 != 0) {
        // seg000:4245
        word_380E2--;
    }

    // seg000:4249
    if (g_setThrust != 0 && g_thrust == 0) {
        // seg000:425F
        makeSound(0x0E, 2);
    }

    // seg000:4265
    if (word_330BE != 0) {
        // seg000:426C
        noJoy80 = 0;
        // seg000:4271
        noJoy80_2 = 0;
    } else {
        // seg000:427C
        if (commData->setupUseJoy != 0) {
            // seg000:4283
            sub_2267E();
        } else {
           
            // seg000:4294
            //temp_si = word_38602 + 1;
            noJoy80 = (unsigned char)(((int)((unsigned char)byte_37F98 - 0x80) * (word_38602 + 1)) / 3) - 0x80;
           
            // seg000:42A9
            noJoy80_2 = (unsigned char)(((int)((unsigned char)byte_37F99 - 0x80) * (word_38602 + 1)) / 3) - 0x80;
        }
    }

    // seg000:42B6
    word_3C00E = ((uint16)noJoy80 >> 4) - 8;
    // seg000:42C5
    if (word_3C00E < 0) word_3C00E++;

    // seg000:42CD
    word_3C5A4 = ((uint16)noJoy80_2 >> 4) - 8;
    // seg000:42DC
    if (word_3C5A4 < 0) word_3C5A4++;
    
    // seg000:42E4
    word_3C00E = -((abs(word_3C00E) + 2) * word_3C00E) * 2;
    // seg000:42FC
    word_3C5A4 *= 6;
    // seg000:4306
    if (word_3C5A4 < 0) {
        // seg000:430E
        word_3C5A4 /= 2;
    }
    
    // seg000:4316
    if (word_3BEBE == g_viewZ && word_3C5A4 < 0 && g_ourPitch <= 0) {
        // seg000:432A
        word_3C5A4 = 0;
    }

    // seg000:4330
    if (g_knots > 0x15E && !(*((unsigned char*)&g_playerPlaneFlags) & 1) && word_336EC != 0) {
        // seg000:4346
        word_336EC = 0;
        // seg000:434C
        *((unsigned char*)&g_playerPlaneFlags) |= 1;
        // seg000:4355
        tempStrcpy("Landing gear raised");
        // seg000:4363
        makeSound(0x20, 2);
    }
    
    // seg000:4369
    if (word_3BEBE == g_viewZ && g_setThrust == 0 && !(*((unsigned char*)&g_playerPlaneFlags) & 8)) {
        // seg000:4380
        *((unsigned char*)&g_playerPlaneFlags) |= 8;
        // seg000:4389
        tempStrcpy("Brakes on");
    }

    // seg000:438F
    if (word_3C00E != 0 || word_3C5A4 != 0) {
        // seg000:439D
        g_autopilotAltitude = 0;
    }
    
    // seg000:43A3
    if (g_autopilotAltitude != 0)
    {
        // seg000:43AD
        x = (word_336EA != 0) ? (int16)((word_38FE0 & 0xF) << 8) - 0x800
                                   : 0;

        // seg000:43DE
        x = forceRange(x - g_ourHead + word_3BE92, 0xEC00, 0x1400) * 2;

        // seg000:43FD
        word_3C00E = -sub_1CF64((x - g_ourRoll) >> 6, -24, 24);

        // seg000:4420
        d = forceRange(((g_autopilotAltitude - g_viewZ) << 4) - word_38FC4, 0xEC00, 0xC00);

        // seg000:443D
        word_3C5A4 = sub_1CF64((d - g_ourPitch) >> 7, -8, 8);

        // seg000:4446
        if (waypointIndex == 3)
        {
            // seg000:4450
            o = word_3AFA8;
            // seg000:4456
            s = word_3B15A;

            // seg000:4462
            h = g_planes[s].mapX - g_viewX_;
            // seg000:446D
            z = g_planes[s].mapY - g_viewY_;

            // seg000:4478
            if (!(g_planes[s].flags & 0x200))
            {
                // seg000:4481
                o = -sub_1D1C8(z);
            }

            // seg000:4493
            z += ((g_planes[s].flags & 0x200) ? 0x1E : 0x40) * o;

            // seg000:44A9
            x = abs(g_ourHead);
            // seg000:44B6
            if (o == -1)
            {
                // seg000:44BC
                h = -h;
                // seg000:44C4
                z = -z;
                // seg000:44D3
                x = abs(g_ourHead - 0x8000);
            }

            // seg000:4514
            d = sub_1CF64((abs(h) + abs(z)) * 2 + x / 32, 50, 0x1000);
            // seg000:451D
            if (d < 0x1000)
            {
                // seg000:4522
                sub_1DB9C();
            }

            // seg000:452C
            if (g_planes[s].flags & 0x200)
            {
                // seg000:4534
                d += 100;
            }

            // seg000:4538
            if (word_33702 != 0 && abs(x) < 0x200)
            {
                // seg000:454D
                d = -20;
            }

            // seg000:4552
            z = g_planes[s].mapY + (((g_planes[s].flags & 0x200) ? 0x1C : 0x38) * o);

            // seg000:459F
            z += sub_1CF64((abs(h) * 4) + (x / 16), 0, 0xC00) * o;

            // seg000:45AB
            *((unsigned char *)&g_playerPlaneFlags) &= 0xF7;

            // seg000:45B0
            if (x > 0x4000)
            {
                // seg000:45BE
                h = g_planes[s].mapX;
                // seg000:45C5
                d = 0x1000;
            }
            else
            {
                // seg000:45CC
                h = g_planes[s].mapX + (o * h * 2);
                // seg000:45E5
                if (g_setThrust * 80 < g_knots)
                {
                    // seg000:45EF
                    *((unsigned char *)&g_playerPlaneFlags) |= 8;
                }
            }

            // seg000:4603
            c = ARCTAN(h - g_viewX_, g_viewY_ - z);
            // seg000:460C
            n = (int16)g_knots / 16;

            // seg000:4638
            x = forceRange(c - g_ourHead, (-n) << 8, n << 8) * 2;

            // seg000:4643
            if (word_33702 != 0)
            {
                // seg000:464A
                x = 0;
            }

            // seg000:4663
            word_3C00E = -sub_1CF64((x - g_ourRoll) >> 6, -32, 32);

            // seg000:46A5
            g_setThrust = sub_1CF64((abs(x) / 256) + (d / 64), 35, 80);
            // seg000:46AE
            UpdateThrottleState();

            // seg000:46CF
            d = forceRange(((d - g_viewZ) >> 3) + (word_38FC4 >> 7), -24, 24);

            // seg000:46EE
            word_3C5A4 = sub_1CF64(d - (g_ourPitch >> 7), -16, 16);

            // seg000:46F7
            if (g_knots < 0x15E)
            {
                // seg000:46FF
                *((unsigned char *)&g_playerPlaneFlags) &= 0xFE;
            }

            // seg000:4704
            if (word_3BEBE == g_viewZ)
            {
                // seg000:470D
                g_setThrust = 0;
                // seg000:4713
                word_3C00E = 0;
                // seg000:4719
                g_playerPlaneFlags |= 8;
                // seg000:471E
                word_3C5A4 = 0;
            }
        }
    }
    // seg000:4724
    if (gameData->unk4 != 0) {
        // seg000:473F
        ae = ((int32)g_knots * (1000 - g_viewZ)) >> 15;
    } else {
        // seg000:4753
        ae = 0;
    }
    
    // seg000:4758
    if (!((g_playerPlaneFlags) & 1)) {
        // seg000:4771
        ae += sub_1CF64((g_knots - 200) >> 5, 0, 32);
    }
    
    // seg000:477A
    if (ae > 0 && ((uint16)word_3BEBE) < ((uint16)g_viewZ)) {
        // seg000:478C
        word_3C00E += randlmul(ae) - (ae >> 1);
        // seg000:47A0
        word_3C5A4 += (randlmul(ae) - (ae >> 1)) >> 1;
    }
    
    // seg000:47B3
    if ((g_playerPlaneFlags & 1) && word_3C5A4 <= 0 && ((uint16)word_3A8FE) < ((uint16)g_velocity) && gameData->unk4 < 2 && abs(g_ourRoll) < 0x3000 && word_38FE8 == 0) {
        // seg000:47EB
        d = ((((word_38FC4) - (g_ourPitch)) >> 2) - g_viewZ + 300) >> 2;
        // seg000:4804
        if (d > 0) {
            // seg000:4812
            word_3C5A4 = sub_1CF64(d, 0, 32);
        }
    }
    
    // seg000:481B
    if (word_3BE3C != 0) {
        // seg000:4825
        word_3C00E = 0x40;

        // seg000:482B
        word_3C5A4 = (abs(g_ourRoll) > 0x4000) ? 0x10 : -8; // pitch_input_modifier
        
        // seg000:4864
        //word_3BE3C++;
        word_3C040 += sub_1CF64(
            - (++word_3BE3C - 0x20),
            (int16)0xFF00 / g_frameRateScaling,
            (int16)0x80 / g_frameRateScaling
        );
        //word_3C040 += stall_decay_effect;

        // seg000:486E
        if (word_3C040 < 0) {
            // seg000:4870
            word_3C040 = 0;
            // seg000:4876
            if ((word_38FE0 & 7) == 0) {
                // seg000:4880
                PrepareToExit(0);
            }
        }

        // seg000:4886
        if (g_viewZ == 0 && word_336F6 == -1) {
            // seg000:4894
            word_336F6 = 0;
            // seg000:489A
            g_planes[0].mapX = g_viewX_;
            // seg000:48A0
            g_planes[0].mapY = g_viewY_;
            // seg000:48A6
            word_3BEBC = g_viewX_;
            // seg000:48AC
            word_3BEC8 = g_viewY_;
            // seg000:48B2
            word_3BECE = 0;
            // seg000:48B8
            word_39606 = -8;
            // seg000:48C3
            makeSound(2, 2);
            // seg000:48CB
            g_velocity = 
            g_setThrust = 0;
        }

        // seg000:48D1
        if ((word_3BE3C & 0xFFFC) == 0x10 && (word_336E8 & 3) == 1) {
            // seg000:48E4
            word_336F6 = -1;

            // seg000:48ED
            l = ((uint16)word_336E8 / 2) & 7;

            // seg000:48FB
            ((struct struc_9*)stru_33402)[l].field_0 = g_viewX_;
            // seg000:4902
            ((struct struc_9*)stru_33402)[l].field_2 = g_viewY_;
            // seg000:4909
            ((struct struc_9*)stru_33402)[l].field_4 = g_viewZ;

            // seg000:4914
            ((struct struc_9*)stru_33402)[l].field_6 = randlmul(0x20) << 11;

            // seg000:4922
            word_33442 = l;
            // seg000:4928
            word_3BEBC = g_viewX_;
            // seg000:492E
            word_3BEC8 = g_viewY_;
            // seg000:4934
            word_3BECE = g_viewZ;
            // seg000:493A
            word_39606 = -8;
            // seg000:4947
            makeSound(0, 2);

            // seg000:494D
            g_ourPitch = -0x4000;
            // seg000:4953
            byte_380DD = 1;
        }
    }
    
    // seg000:4958
    if (g_gunHits != 0) {
        // seg000:496D
        if (g_setThrust > -((g_gunHits * 4) - 0x90)) {
            // seg000:4973
            g_setThrust = -((g_gunHits * 4) - 0x90);
            // seg000:4977
            if (g_setThrust < 0)
                // seg000:497B
                g_setThrust = 0;
            // seg000:4981
            UpdateThrottleState();
        }
    }
    
    // seg000:4984
    g_thrust += ((g_setThrust - g_thrust) / 4) / ((int16)g_frameRateScaling);
    // seg000:49A7
    if (g_setThrust > g_thrust) g_thrust++;
    // seg000:49B4
    if (g_setThrust < g_thrust) g_thrust = g_setThrust;

    // seg000:49C0
    if ((((uint16)word_336E8) % ((uint16)(g_frameRateScaling << 1))) == 0 && g_setThrust != 0 && word_336EA == 0) {
        // seg000:49ED
        word_33098 -= ((g_setThrust * g_setThrust) / 750) + 2;
        // seg000:49F1
        sub_1606C();
    }
    
    // seg000:49F4
    if (word_33098 <= 0) {
        // seg000:49FB
        g_thrust = 0;
        // seg000:4A01
        word_33098 = 0;
    }

    // seg000:4A07
    g_gees = byte_37FEC[(abs(g_ourRoll) >> 8) & 0x7f];
    // seg000:4A23
    if (((uint16)word_3BEBE) < ((uint16)g_viewZ)) {
        // seg000:4A34
        g_gees += word_3C5A4 / 2;
    }
    
    // seg000:4A38
    if (g_gees > 0x80) {
        // seg000:4A40
        g_gees = 0x80;
        // seg000:4A6C
        word_3C5A4 = sub_1CF64(0x80 - byte_37FEC[(abs(g_ourRoll) >> 8) & 0x7f], 0, word_3C5A4);
    }
    
    
    // seg000:4A9A
    strcpy(unk_38FD0, itoa(g_gees / 16, strBuf, 10));
    // seg000:4AA8
    strcat(unk_38FD0, ".");
    
    // seg000:4AD3
    strcat(unk_38FD0, itoa((abs(g_gees) & 0xF) >> 1, strBuf, 10));
    // seg000:4AE1
    strcat(unk_38FD0, "G");

    // seg000:4AFB
    j = ((long)(g_thrust - sinX(g_ourPitch, 80)) * 800L) / 100L;
    
    // seg000:4B16
    word_3C5A6 = 100;
    // seg000:4B30
    j = ((((uint16)g_viewZ >> 7) + 0x0400) * (int32)(j & j)) >> 10; // j & j folds to a plain load but ranks the operand "heavy", so the shift-expr is evaluated/pushed first like the ref

    // seg000:4B56
    word_3C5A6 = ((int32)100 * (uint32)((word_380D0 >> 6) + 0x0400)) >> 10;
    
    // seg000:4B83
    j = ((int32)j) * ((int32)(-((word_33098 >> 9) - 100))) / (int32)90;
    
    // seg000:4B9E
    j = (((int32)j) * ((int32)(128 - g_gees))) >> 7;
    
    // seg000:4BC7
    word_3C5A6 = ((int32)sub_15557(g_gees * 4) * (int32)word_3C5A6) >> 3;
    // seg000:4BDA
    word_3C5A6 = abs(word_3C5A6);

    // seg000:4BE3
    if (!(*((unsigned char*)&g_playerPlaneFlags) & 1)) {
        // seg000:4BEA
        j -= j >> 3;
    }
    
    // seg000:4BF4
    word_3A8FE = word_3C5A6 * 27;
    // seg000:4C08
    e = sub_1CF64(j, 0, 899) * 27;
    
    // seg000:4C39
    g_velocity += ((((int32)e - g_velocity) / 16) / (int32)g_frameRateScaling);
    
    // seg000:4C5F
    word_3B4DA = ((int32)word_3A8FE * 3072) / (abs(g_velocity) + 1);
    // seg000:4C65
    if ((uint16)word_3B4DA > 0x2000) word_3B4DA = 0x2000;
    
    // seg000:4C7B
    word_38FC4 = cosX(g_ourRoll, word_3B4DA - 0x300);
    
    // seg000:4C84
    if (*((unsigned char*)&g_playerPlaneFlags) & 8) {
        // seg000:4C8B
        if (word_3BEBE == g_viewZ) {
            // seg000:4CB0
            g_velocity -= (-((gameData->unk4 * 8) - 32) * 27) / g_frameRateScaling;
            // seg000:4CB8
            if (word_3BEBE != 0 && (uint16)g_velocity < 0x1B0) {
                 // seg000:4CC7
                 g_velocity = 0;
            }
        } else {
             // seg000:4CD8
             g_velocity -= ((uint16)g_velocity >> 4) / g_frameRateScaling;
        }
    }
    
    // seg000:4CE0
    if ((uint16)g_velocity > 0xAFC8) g_velocity = 0;
    
    // seg000:4CF6
    v = cosX(g_ourPitch, g_velocity);
    // seg000:4D07
    g_knots = (uint16)g_velocity / 27;
    
    // seg000:4D11
    audio_jump_6a(g_knots, g_thrust);
    
    // seg000:4D47
    ac = (((int32)sinX(g_ourRoll, g_gees << 4)) << 7) / ((int32)((int16)((uint16)g_velocity >> 9) + 0x20));

    // seg000:4D52
    ac = cosX(g_ourPitch, ac);
    
    // seg000:4D5B
    if (word_3BEBE == g_viewZ) {
        // seg000:4D64
        ac = (word_3C00E * -1) << 6;
        // seg000:4D70
        word_3C00E = 0;
        // seg000:4D76
        if (g_knots < word_3C5A6) {
            // seg000:4D7F
            word_3C5A4 = 0;
        }
    }
    
    // seg000:4D85
    if (word_38FDE != 0) {
        // seg000:4D8C
        word_3C5A4 = -0x400 - g_ourPitch;
        // seg000:4D96 (ref stores velocity then setThrust; chains store right-to-left)
        g_setThrust =
        g_velocity = 0;
    }
    
    // seg000:4DB6
    g = (((int32)word_3C00E) << 7) / ((int32)g_frameRateScaling);
    // seg000:4DBC
    if (g != 0) {
        // seg000:4DC1
        word_380AC = word_380A4 = sub_13B86(g);
        // seg000:4DD0
        word_380A6 = sub_13B96(g);
        // seg000:4DD9
        word_380AA = -word_380A6;
        // seg000:4DE6
        sub_151F9(unk_3806E, &word_380A4);
    }
    
    // seg000:4DF8
    f = (int16)((int32)word_3C5A4 << 7) / g_frameRateScaling;
    // seg000:4DFD
    if (f != 0) {
        // seg000:4E02
        word_380A2 = word_3809A = sub_13B86(f);
        // seg000:4E11
        word_380A0 = sub_13B96(f);
        // seg000:4E1A
        word_3809C = -word_380A0;
        // seg000:4E27
        sub_151F9(unk_3806E, unk_38092);
    }
    
    // seg000:4E35
    t = (int16)ac / g_frameRateScaling;
    // seg000:4E3A
    if (t != 0) {
        // seg000:4E3F
        word_38090 = word_38080 = sub_13B86(t);
        // seg000:4E4E
        word_38084 = sub_13B96(t);
        // seg000:4E57
        word_3808C = -word_38084;
        // seg000:4E64
        sub_151F9(&word_38080, unk_3806E);
    }
    
    // seg000:4E6A
    sub_15237();

    // seg000:4E6D
    if ((uint16)word_3A8FE > (uint16)g_velocity && (uint16)word_3BEBE < (uint16)g_viewZ) {
        // seg000:4E9A
        g_ourPitch -= ((uint16)word_3A8FE - (uint16)g_velocity) >> ((gameData->unk4 == 2 || g_gunHits > 8) ? 1 : 2);
        // seg000:4EA4
        byte_380DD = 1;
        // seg000:4EA9
        if (g_ourPitch < 0 || (uint16)g_viewZ < 200) {
            // seg000:4EC0
            makeSound(0x14, 1);
        }
    }

    // seg000:4EC6
    if (word_3BEBE == g_viewZ) {
        // seg000:4ECF
        if (g_ourRoll != 0) {
            // seg000:4ED6
            g_ourRoll = 0;
            // seg000:4EDC
            byte_380DD = 1;
        }
        // seg000:4EE1
        if (g_ourPitch < 0 || (g_ourPitch > 0 && g_knots < word_3C5A6)) {
            // seg000:4EF3
            if (word_38FDE == 0) {
                // seg000:4EFA
                g_ourPitch = 0;
            }
            // seg000:4F00
            byte_380DD = 1;
        }
    }

    // seg000:4F05
    word_38FDE = 0;

    // seg000:4F0B
    byte_3C6A0[0] = ( (abs(g_ourPitch)) - (abs(g_ourRoll) / 2) > 0x1000) ? 1 : 0;
    
    // seg000:4F36
    if (byte_380DD) {
        // seg000:4F3D
        UpdateRotationMatrix();
    }
    
    // seg000:4F40
    b = word_380D0;
    // seg000:4F60
    word_3C8B6 = FixedPointMul((((uint16)g_velocity) / 10), sub_13B96(g_ourPitch - word_38FC4));

    // seg000:4F69
    if (word_33712 == 0) {
        // seg000:4F75
        word_380D0 += (word_3C8B6 / g_frameRateScaling);
        
        // seg000:4F9A
        g_ViewX += FixedPointMul(v, sub_13B96(g_ourHead)) / 10 / g_frameRateScaling;

        // seg000:4FC4
        g_ViewY += FixedPointMul(v, sub_13B86(g_ourHead)) / 10 / g_frameRateScaling;
    }
    
    // seg000:4FCF
    if ((uint16)word_380D0 > 0xf230 || (uint16)word_380D0 < (uint16)word_3BEBE) {
        // seg000:4FE0
        word_380D0 = word_3BEBE;
    }
    // seg000:4FE6
    if (word_380D0 > 0xEA60) word_380D0 = 0xEA60;
    
    // seg000:4FF4
    if (word_380D0 < 0x2000) {
        // seg000:4FFC
        g_viewZ = word_380D0;
    } else if (word_380D0 < 0x4000) {
        // seg000:500C
        g_viewZ = ((word_380D0 - 0x2000) >> 1) + 0x2000;
    } else {
        // seg000:501C
        g_viewZ = ((word_380D0 - 0x4000) >> 2) + 0x3000;
    }

    // seg000:502C
    if (word_3BEBE == g_viewZ) {
        // seg000:5038
        if (b > word_3BEBE && word_33702 != 0) {
            // seg000:5055
            makeSound(0xC, 2);
            //temp_bx = g_closestThreatIndex << 4;

            // seg000:5063
            if ((( ((g_planes[g_closestThreatIndex].flags & 0x200) ? 0x100 : 0x80) 
                < ((int16)(-word_3C8B6 * g_missionStatus) / 2))) || 
                ((gameData->unk4 != 0 && 
                    (((g_playerPlaneFlags & 1)!=0) || 
                        (((int16)abs(g_ourRoll)) > (int16)((0x30 / (g_missionStatus + 1)) << 8))) ))) {
                            // seg000:50B8
                            makeSound(0, 2);
                            // seg000:50C9
                            sub_12278(0x3C);
                            // seg000:50D3
                            PrepareToExit(5);
            }
        }
        // seg000:50D9
        word_3C8B6 = 0;
    }
    
    // seg000:50DF
    l = word_336E8 & 0xF;
    // seg000:50EE
    stru_3A95A[l].heading = g_ourHead;
    // seg000:50F5
    stru_3A95A[l].pitch = g_ourPitch;
    // seg000:50FC
    stru_3A95A[l].roll = g_ourRoll;
    // seg000:510A
    *(int32*)&stru_3A95A[l].worldX = g_ViewX;
    // seg000:5119
    *(int32*)&stru_3A95A[l].worldY = g_ViewY;
    // seg000:5121
    stru_3A95A[l].alt = g_viewZ;

    // seg000:5128
    if (g_currentWeaponType == 1) {
        // seg000:5132
        if (word_336F2 >= 0) {
            // TODO struct
            // seg000:5168
            l = sub_1CF64((Dist2D(g_viewX_ - (&word_3B204)[word_336F2 * 0x12], g_viewY_ - (&word_3B206)[word_336F2 * 0x12]) * g_frameRateScaling) >> 8, 0, 12);

        } else {
            // seg000:5173
            l = g_frameRateScaling - 1;
        }

        // seg000:517A
        l = (word_336E8 - l) & 0xF;
        
        // seg000:518C
        x = g_ourHead - stru_3A95A[l].heading;
        // seg000:5196
        d = g_ourPitch - stru_3A95A[l].pitch;
 
        // seg000:51BF
        word_3C6A4 = cosX(g_ourRoll, ((-x) >> 2)) + sinX(g_ourRoll, (d >> 2));

        // seg000:51E8
        word_3C6AC = sinX(g_ourRoll, (x >> 2)) + cosX(g_ourRoll, (d >> 1));
    }

    // seg000:51F8
} // 51f9

#undef g_thrust
#undef g_setThrust
#undef g_velocity
#undef g_viewZ
#undef g_ourRoll
#undef g_ourPitch
#undef g_ourHead
#undef g_viewY_
#undef g_viewX_
#undef g_planes
#undef g_playerTargetIndex
#undef g_playerPlaneFlags
#undef noJoy80
#undef noJoy80_2
#undef g_knots
#undef g_frameRateScaling
#undef g_gees
#undef g_gunHits
#undef g_missionStatus
#undef g_autopilotAltitude
#undef g_closestThreatIndex
#undef g_currentWeaponType
#undef g_ViewX
#undef g_ViewY
#undef word_336E8
#undef var_566
#undef UpdateRotationMatrix
#undef UpdateThrottleState
#undef PrepareToExit
#undef DrawHUDElement
#undef TransformAndProjectObject_2
#undef FixedPointMul
#undef ARCTAN
#undef Dist2D
#undef sinX
#undef cosX
#undef forceRange
#undef gfx_jump_2a
#undef abs_word
#undef randlmul
#undef sub_12278
#undef sub_13B86
#undef sub_13B96
#undef sub_151F9
#undef sub_15237
#undef sub_15557
#undef sub_1606C
#undef sub_1613B
#undef sub_19E44
#undef sub_1CF64
#undef sub_1D1C8
#undef sub_2265B
#undef sub_2267E

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

// ==== seg000:0x5237 ====
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
            var_545 = -var_545;
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

// ==== seg000:0x5411 ====

void rebuildOrientation() {
    buildRotationMatrixFar(unk_3806E, var_542, var_544, var_545);
    *(char *)&word_380D8 = 0;
    var_549 = 0;
}

// ==== seg000:0x543b ====
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

// ==== seg000:0x54b7 ====
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

// ==== seg000:0x5540 ====
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

// ==== seg000:0x55ab ====
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
            gfx_resetBlitOffset2();
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
        gfx_resetBlitOffset2();
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

// ==== seg000:0x5fdb ====
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
// ==== seg000:0x606c ====
void drawFuelGauge(void) {
    if (word_330C2 == 0) {
        return;
    }
    setDrawColor(0);
    fillRectBoth(5, 0x6d, 0x0a, 0x98);
    setDrawColor(word_33098 > 2000 ? 2 : 14);
    fillRectBoth(5, -(word_33098 / 250 - 0x98), 0x0a, 0x98);
}

// ==== seg000:0x60d3 ====
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

// ==== seg000:0x613b ====
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

// updateThreatSites (seg000:0x6172) lives in eghud_g.c (/Gs without /Zi)
// because its loop block scheduling only matches when compiled without /Zi.
