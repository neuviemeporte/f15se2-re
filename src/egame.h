#ifndef F15_SE2_EGAME
#define F15_SE2_EGAME
#include "inttype.h"
#include "struct.h"
#include "comm.h"

#include <stdio.h>

#if !defined(MSDOS) && !defined(__MSDOS__)
#define far
#endif

#define __int32 long
#define __int8 char
#define __cdecl
#define __far far
// ==== seg000:0x147 ====
int sub_10147();
// ==== seg000:0x211 ====
int sub_10211();
// ==== seg000:0x294 ====
int sub_10294();
// ==== seg000:0x297 ====
int sub_10297();
// ==== seg000:0x29a ====
int sub_1029A();
// ==== seg000:0x2e2 ====
int sub_102E2();
// ==== seg000:0x334 ====
int sub_10334();
// ==== seg000:0x688 ====
int sub_10688();
// ==== seg000:0x720 ====
int sub_10720();
// ==== seg000:0x14e8 ====
int sub_114E8();
// ==== seg000:0x14fc ====
int sub_114FC();
// ==== seg000:0x1636 ====
int sub_11636();
// ==== seg000:0x1676 ====
int sub_11676();
// ==== seg000:0x1841 ====
int sub_11841();
// ==== seg000:0x18d5 ====
int sub_118D5();
// ==== seg000:0x18f6 ====
int sub_118F6();
// ==== seg000:0x1971 ====
int sub_11971();
// ==== seg000:0x19a3 ====
int sub_119A3();
// ==== seg000:0x1a18 ====
int sub_11A18();
// ==== seg000:0x1a88 ====
int sub_11A88();
// ==== seg000:0x1b37 ====
int sub_11B37();
// ==== seg000:0x1bc3 ====
int sub_11BC3();
// ==== seg000:0x1bfd ====
int sub_11BFD();
// ==== seg000:0x1c21 ====
int sub_11C21();
// ==== seg000:0x1d10 ====
int sub_11D10();
// ==== seg000:0x1d6e ====
int sub_11D6E();
// ==== seg000:0x1e0e ====
int sub_11E0E();
// ==== seg000:0x1f3e ====
int sub_11F3E();
// ==== seg000:0x2049 ====
int sub_12049();
// ==== seg000:0x206d ====
int sub_1206D();
// ==== seg000:0x215c ====
int sub_1215C();
// ==== seg000:0x21a9 ====
int sub_121A9();
// ==== seg000:0x21c6 ====
int sub_121C6();
// ==== seg000:0x21ca ====
int sub_121CA();
// ==== seg000:0x2278 ====
int sub_12278();
// ==== seg000:0x229a ====
int sub_1229A();
// ==== seg000:0x22b8 ====
int sub_122B8();
// ==== seg000:0x26b4 ====
int sub_126B4();
// ==== seg000:0x273e ====
int sub_1273E();
// ==== seg000:0x2874 ====
int sub_12874();
// ==== seg000:0x2898 ====
int sub_12898();
// ==== seg000:0x2c82 ====
int sub_12C82();
// ==== seg000:0x2e54 ====
int sub_12E54();
// ==== seg000:0x2f8c ====
int sub_12F8C();
// ==== seg000:0x2faf ====
int __cdecl sub_12FAF(char *);
// ==== seg000:0x2fda ====
int sub_12FDA();
// ==== seg000:0x3224 ====
int sub_13224();
// ==== seg000:0x3266 ====
int sub_13266();
// ==== seg000:0x32ba ====
int sub_132BA();
// ==== seg000:0x345e ====
int sub_1345E();
// ==== seg000:0x34ac ====
int sub_134AC();
// ==== seg000:0x3638 ====
int sub_13638();
// ==== seg000:0x3694 ====
int sub_13694();
// ==== seg000:0x36d2 ====
int sub_136D2();
// ==== seg000:0x374a ====
int sub_1374A();
// ==== seg000:0x378e ====
int sub_1378E();
// ==== seg000:0x3816 ====
int sub_13816();
// ==== seg000:0x3922 ====
int sub_13922();
// ==== seg000:0x3932 ====
int sub_13932();
// ==== seg000:0x39aa ====
int sub_139AA();
// ==== seg000:0x39c0 ====
int sub_139C0();
// ==== seg000:0x3a6c ====
int sub_13A6C();
// ==== seg000:0x3a90 ====
int sub_13A90();
// ==== seg000:0x3aee ====
int sub_13AEE();
// ==== seg000:0x3b2f ====
int sub_13B2F();
// ==== seg000:0x3b86 ====
int sub_13B86();
// ==== seg000:0x3b96 ====
int sub_13B96();
// ==== seg000:0x3ba2 ====
int sub_13BA2();
// ==== seg000:0x3bc1 ====
int far sub_13BC1();
// ==== seg000:0x3bc5 ====
int far sub_13BC5();
// ==== seg000:0x3bc9 ====
int sub_13BC9();
// ==== seg000:0x3bcd ====
int sub_13BCD();
// ==== seg000:0x3bec ====
int sub_13BEC();
// ==== seg000:0x3c0f ====
int sub_13C0F();
// ==== seg000:0x3c20 ====
int sub_13C20();
// ==== seg000:0x3c3b ====
int sub_13C3B();
// ==== seg000:0x3c47 ====
int sub_13C47();
// ==== seg000:0x3c78 ====
int setTimerIrqHandler();
// ==== seg000:0x3cb6 ====
int restoreTimerIrqHandler();
// ==== seg000:0x3d6b ====
int sub_13D6B();
// ==== seg000:0x3df2 ====
int sub_13DF2();
// ==== seg000:0x3e87 ====
int sub_13E87();
// ==== seg000:0x3edc ====
int sub_13EDC();
// ==== seg000:0x3ee3 ====
int sub_13EE3();
// ==== seg000:0x3f72 ====
int sub_13F72();
// ==== seg000:0x51f9 ====
int sub_151F9();
// ==== seg000:0x5237 ====
int sub_15237();
// ==== seg000:0x5411 ====
int sub_15411();
// ==== seg000:0x543b ====
int sub_1543B();
// ==== seg000:0x54b7 ====
int sub_154B7();
// ==== seg000:0x5540 ====
int sub_15540();
// ==== seg000:0x5557 ====
int sub_15557();
// ==== seg000:0x55ab ====
int sub_155AB();
// ==== seg000:0x5fdb ====
int sub_15FDB();
// ==== seg000:0x606c ====
int sub_1606C();
// ==== seg000:0x60d3 ====
int sub_160D3();
// ==== seg000:0x613b ====
int sub_1613B();
// ==== seg000:0x6172 ====
int sub_16172();
// ==== seg000:0x6346 ====
int sub_16346();
// ==== seg000:0x660e ====
int sub_1660E();
// ==== seg000:0x66be ====
int sub_166BE();
// ==== seg000:0x6742 ====
int sub_16742();
// ==== seg000:0x67b4 ====
int sub_167B4();
// ==== seg000:0x7594 ====
int sub_17594();
// ==== seg000:0x783a ====
int sub_1783A();
// ==== seg000:0x79ee ====
int sub_179EE();
// ==== seg000:0x85be ====
int sub_185BE();
// ==== seg000:0x86f8 ====
int sub_186F8();
// ==== seg000:0x87ea ====
int sub_187EA();
// ==== seg000:0x89aa ====
int sub_189AA();
// ==== seg000:0x8a44 ====
int sub_18A44();
// ==== seg000:0x8aa6 ====
int sub_18AA6();
// ==== seg000:0x8df4 ====
int sub_18DF4();
// ==== seg000:0x8e38 ====
int sub_18E38();
// ==== seg000:0x8e50 ====
int sub_18E50();
// bytes outside routine, potential module boundary at 0x9422
// ==== seg000:0x94d0 ====
int sub_194D0();
// ==== seg000:0x957a ====
int sub_1957A();
// ==== seg000:0x9595 ====
int sub_19595();
// ==== seg000:0x95c9 ====
int sub_195C9();
// ==== seg000:0x9875 ====
int sub_19875();
// ==== seg000:0x98b4 ====
int sub_198B4();
// ==== seg000:0x98fa ====
int sub_198FA();
// ==== seg000:0x9915 ====
int sub_19915();
// ==== seg000:0x993a ====
int sub_1993A();
// ==== seg000:0x99ec ====
int sub_199EC();
// ==== seg000:0x9a4d ====
int sub_19A4D();
// ==== seg000:0x9adb ====
int sub_19ADB();
// ==== seg000:0x9b98 ====
int sub_19B98();
// ==== seg000:0x9be1 ====
int sub_19BE1();
// ==== seg000:0x9c0c ====
int sub_19C0C();
// ==== seg000:0x9c84 ====
int sub_19C84();
// ==== seg000:0x9d86 ====
int sub_19D86();
// ==== seg000:0x9db0 ====
int sub_19DB0();
// ==== seg000:0x9e44 ====
int sub_19E44();
// ==== seg000:0x9e5d ====
int sub_19E5D();
// ==== seg000:0x9e94 ====
int sub_19E94();
// ==== seg000:0x9eb6 ====
int sub_19EB6();
// ==== seg000:0x9fad ====
int __cdecl sub_19FAD(int, char *);
// ==== seg000:0x9fcc ====
int sub_19FCC();
// ==== seg000:0xa030 ====
int __cdecl sub_1A030(int, char *);
// ==== seg000:0xa0cb ====
int __cdecl sub_1A0CB(char *, int, int);
// bytes outside routine, potential module boundary at 0xa0f6
// ==== seg000:0xa0fe ====
int __cdecl sub_1A0FE(char *, int, int);
// ==== seg000:0xa13a ====
int __cdecl sub_1A13A(int, char *, int, int);
// ==== seg000:0xa183 ====
int sub_1A183();
// ==== seg000:0xa1b1 ====
int sub_1A1B1();
// ==== seg000:0xa1e4 ====
int sub_1A1E4();
// ==== seg000:0xa204 ====
int sub_1A204();
// ==== seg000:0xa224 ====
int sub_1A224();
// ==== seg000:0xa25c ====
int sub_1A25C();
// ==== seg000:0xa740 ====
int sub_1A740();
// ==== seg000:0xa7c4 ====
int sub_1A7C4();
// ==== seg000:0xa872 ====
int sub_1A872();
// ==== seg000:0xa8c8 ====
int sub_1A8C8();
// ==== seg000:0xa934 ====
int sub_1A934();
// ==== seg000:0xa962 ====
int sub_1A962();
// ==== seg000:0xa9bc ====
int sub_1A9BC();
// ==== seg000:0xa9f8 ====
int sub_1A9F8();
// ==== seg000:0xb147 ====
int sub_1B147();
// ==== seg000:0xc1b9 ====
int sub_1C1B9();
// ==== seg000:0xc2f8 ====
int sub_1C2F8();
// ==== seg000:0xc371 ====
int __cdecl sub_1C371(char *, int);
// ==== seg000:0xc40b ====
int sub_1C40B();
// ==== seg000:0xc488 ====
int sub_1C488();
// ==== seg000:0xc661 ====
int sub_1C661();
// ==== seg000:0xc6be ====
int sub_1C6BE();
// ==== seg000:0xc7a2 ====
int sub_1C7A2();
// ==== seg000:0xc7c6 ====
int sub_1C7C6();
// ==== seg000:0xc7ea ====
int sub_1C7EA();
// ==== seg000:0xc82d ====
int sub_1C82D();
// ==== seg000:0xc864 ====
int sub_1C864();
// ==== seg000:0xc8a4 ====
int sub_1C8A4();
// ==== seg000:0xc8de ====
int sub_1C8DE();
// ==== seg000:0xc9d2 ====
int sub_1C9D2();
// ==== seg000:0xcb42 ====
int sub_1CB42();
// ==== seg000:0xcf32 ====
int sub_1CF32();
// ==== seg000:0xcf64 ====
int sub_1CF64();
// ==== seg000:0xcf8e ====
int sub_1CF8E();
// ==== seg000:0xcfa6 ====
int sub_1CFA6();
// ==== seg000:0xd008 ====
int sub_1D008();
// ==== seg000:0xd178 ====
int sub_1D178();
// ==== seg000:0xd190 ====
int sub_1D190();
// ==== seg000:0xd1c8 ====
int sub_1D1C8();
// ==== seg000:0xd1e8 ====
int sub_1D1E8();
// ==== seg000:0xd200 ====
int sub_1D200();
// ==== seg000:0xd21e ====
int sub_1D21E();
// ==== seg000:0xd260 ====
int sub_1D260();
// ==== seg000:0xd9db ====
int sub_1D9DB();
// ==== seg000:0xda35 ====
int sub_1DA35();
// ==== seg000:0xda5f ====
int sub_1DA5F();
// ==== seg000:0xda8d ====
int sub_1DA8D();
// ==== seg000:0xdaae ====
int sub_1DAAE();
// ==== seg000:0xdb2b ====
int sub_1DB2B();
// ==== seg000:0xdb9c ====
int sub_1DB9C();
// ==== seg000:0xdbe0 ====
int sub_1DBE0();
// ==== seg000:0xdd4c ====
int sub_1DD4C();
// ==== seg000:0xdd5e ====
int sub_1DD5E();
// ==== seg000:0xdd70 ====
int sub_1DD70();
// ==== seg000:0xdd7e ====
int sub_1DD7E();
// ==== seg000:0xdd92 ====
int sub_1DD92();
// ==== seg000:0xddaa ====
int sub_1DDAA();
// ==== seg000:0xddc4 ====
int sub_1DDC4();
// ==== seg000:0xde1b ====
int sub_1DE1B();
// ==== seg000:0xde72 ====
int sub_1DE72();
// ==== seg000:0xde94 ====
int sub_1DE94();
// ==== seg000:0xdebf ====
int sub_1DEBF();
// ==== seg000:0xdf16 ====
int read512FromFileIntoBuf();
// ==== seg000:0xdf4f ====
int sub_1DF4F();
// ==== seg000:0xdfbc ====
int sub_1DFBC();
// ==== seg000:0xe0aa ====
int picBlit();
// ==== seg000:0xe11c ====
int sub_1E11C();
// ==== seg000:0xe1f8 ====
int sub_1E1F8();
// ==== seg000:0xe260 ====
int nullsub_1();
// ==== seg000:0xe262 ====
int sub_1E262();
// ==== seg000:0xe28c ====
int sub_1E28C();
// ==== seg000:0xe2d3 ====
int sub_1E2D3();
// ==== seg000:0xe309 ====
int sub_1E309();
// ==== seg000:0xe382 ====
int sub_1E382();
// ==== seg000:0xe631 ====
int sub_1E631();
// ==== seg000:0xe640 ====
int sub_1E640();
// ==== seg000:0xece4 ====
int unknown_libname_1();
// ==== seg000:0xed04 ====
int unknown_libname_2();
// ==== seg000:0xee48 ====
int sub_1EE48();
// ==== seg000:0xf53e ====
int sub_1F53E();
// ==== seg000:0xf5c0 ====
int unknown_libname_3();
// ==== seg000:0xf5d2 ====
int unknown_libname_4();
// ==== seg000:0xf82c ====
int sub_1F82C();
// ==== seg001:0x2 ====
int far sub_1F882();
// ==== seg001:0x78 ====
int sub_1F8F8();
// ==== seg001:0x113 ====
int sub_1F993();
// ==== seg001:0x137 ====
int sub_1F9B7();
// ==== seg001:0x15d ====
int sub_1F9DD();
// ==== seg001:0x23f ====
int sub_1FABF();
// ==== seg001:0x29d ====
int sub_1FB1D();
// ==== seg001:0x2d2 ====
int sub_1FB52();
// ==== seg001:0x308 ====
int sub_1FB88();
// ==== seg001:0x334 ====
int sub_1FBB4();
// ==== seg001:0x383 ====
int sub_1FC03();
// ==== seg001:0x3ba ====
int sub_1FC3A();
// ==== seg001:0x40e ====
int sub_1FC8E();
// ==== seg001:0x484 ====
int sub_1FD04();
// ==== seg001:0x4f2 ====
int sub_1FD72();
// ==== seg001:0x52d ====
int sub_1FDAD();
// ==== seg001:0x5dc ====
int sub_1FE5C();
// ==== seg001:0x66c ====
int far sub_1FEEC();
// ==== seg001:0x67e ====
int sub_1FEFE();
// ==== seg001:0x884 ====
int far sub_20104();
// ==== seg001:0x908 ====
int sub_20188();
// ==== seg001:0xa09 ====
int sub_20289();
// ==== seg001:0xa36 ====
int sub_202B6();
// ==== seg001:0xa47 ====
int far sub_202C7();
// ==== seg001:0xa5a ====
int far sub_202DA();
// ==== seg001:0xa76 ====
int far sub_202F6();
// ==== seg001:0xa80 ====
int sub_20300();
// ==== seg001:0xb60 ====
int sub_203E0();
// ==== seg001:0xbca ====
int far sub_2044A();
// ==== seg001:0xbe7 ====
int sub_20467();
// ==== seg001:0xcb4 ====
int sub_20534();
// ==== seg001:0xdd8 ====
int far sub_20658();
// ==== seg001:0xdf4 ====
int sub_20674();
// ==== seg001:0x10f0 ====
int sub_20970();
// ==== seg001:0x11c6 ====
int far sub_20A46();
// ==== seg001:0x11d8 ====
int sub_20A58();
// ==== seg001:0x1282 ====
int sub_20B02();
// ==== seg001:0x132e ====
int far sub_20BAE();
// ==== seg001:0x135f ====
int sub_20BDF();
// ==== seg001:0x147b ====
int sub_20CFB();
// ==== seg001:0x1599 ====
int sub_20E19();
// ==== seg001:0x15b8 ====
int far sub_20E38();
// ==== seg001:0x15cd ====
int sub_20E4D();
// ==== seg001:0x175c ====
int far sub_20FDC();
// ==== seg001:0x176a ====
int sub_20FEA();
// ==== seg001:0x17f5 ====
int sub_21075();
// ==== seg001:0x193a ====
int sub_211BA();
// ==== seg001:0x19e7 ====
int nullsub_2();
// ==== seg001:0x1ba2 ====
int sub_21422();
// ==== seg001:0x1bc4 ====
int far sub_21444();
// ==== seg001:0x1ca6 ====
int far sub_21526();
// ==== seg001:0x1caa ====
int far sub_2152A();
// ==== seg001:0x1cb6 ====
int sub_21536();
// ==== seg001:0x1e42 ====
int sub_216C2();
// ==== seg001:0x1e84 ====
int far sub_21704();
// ==== seg001:0x1e9a ====
int far sub_2171A();
// ==== seg001:0x1ea0 ====
int sub_21720();
// ==== seg001:0x1ed6 ====
int sub_21756();
// ==== seg001:0x1f34 ====
int sub_217B4();
// ==== seg001:0x201c ====
int far sub_2189C();
// ==== seg001:0x2028 ====
int sub_218A8();
// ==== seg002:0xa ====
int far sub_21A7A();
// ==== seg002:0xe ====
int far sub_21A7E();
// ==== seg002:0x16 ====
int sub_21A86();
// ==== seg002:0x9a1 ====
int sub_22411();
// ==== seg002:0xbeb ====
int far sub_2265B();
// ==== seg002:0xbfb ====
int sub_2266B();
// ==== seg002:0xc0e ====
int far sub_2267E();
// ==== seg002:0xc21 ====
int sub_22691();
// ==== seg002:0xc4e ====
int sub_226BE();
// ==== seg002:0xcaa ====
int far sub_2271A();
// ==== seg002:0xcbe ====
int far sub_2272E();
// ==== seg003:0x6 ====
int far sub_22746();
// ==== seg003:0x56 ====
int far sub_22796();
extern int16 word_328B2;
extern uint8 aMsRunTimeLibraryCopyr[];
extern uint8 aRegn_xxx[];
extern uint8 aLb_xxx[];
extern uint8 aPg_xxx[];
extern uint8 aVn_xxx[];
extern uint8 aMe_xxx[];
extern uint8 aNc_xxx[];
extern uint8 aCe_xxx[];
extern uint8 aJp_xxx[];
extern uint8 aNa_xxx[];
extern uint8 byte_32933;
extern uint8 byte_32934[];
extern int16 word_32936;
extern int16 word_32938;
extern char *off_3293A;
extern uint8 a256pit_pic[];
extern uint8 aCockpit_pic[];
extern uint8 aF15dgtl_bin[];
extern int word_32972;
extern int16 word_3298A;
extern int16 word_3298C;
extern int16 word_3298E;
extern uint8 unk_329AB[];
extern uint8 ovlInsaneFlag;
extern uint8 aErrorReleasingOverlay[];
extern uint8 aSafeLanding[];
extern uint8 aReadyForTakeof[];
extern uint8 aWeaponsRepleni[];
extern uint8 aAutomaticLandi[];
extern int16 word_32A22;
extern int16 word_32A24;
extern int16 word_32A28;
extern int16 word_32A2E;
extern int16 word_32A30;
extern int16 word_32A32;
extern int16 word_32A34;
extern uint8 aNone[];
extern uint8 aSa2[];
extern uint8 aSa5[];
extern uint8 aSa8b[];
extern uint8 aSa10[];
extern uint8 aSa11[];
extern uint8 aSa12[];
extern uint8 aSa13[];
extern uint8 aSaN4[];
extern uint8 aSaN5[];
extern uint8 aSaN6[];
extern uint8 aSaN7[];
extern uint8 aHawk[];
extern uint8 aRapier[];
extern uint8 aTiger[];
extern uint8 aSeacat[];
extern uint8 aIl76[];
extern uint8 aMig23[];
extern uint8 aFlogger[];
extern uint8 aMig25[];
extern uint8 aFoxbat[];
extern uint8 aMig29[];
extern uint8 aFulcrum[];
extern uint8 aF1[];
extern uint8 aMirage[];
extern uint8 aSu27[];
extern uint8 aFlanker[];
extern uint8 aIl76_0[];
extern uint8 aMainstay[];
extern uint8 aF4e[];
extern int16 word_33096;
extern int16 word_33098;
extern int16 word_3309C;
extern int16 word_3309E;
extern int16 word_330B2;
extern int word_330B4;
extern int16 word_330B6;
extern int16 word_330B8;
extern int16 word_330BA;
extern int16 word_330BC;
extern int16 word_330BE;
extern int16 word_330C2;
extern int16 word_330C4;
extern uint8 aAim9m[];
extern uint8 aSidewinder[];
extern uint8 aAim120[];
extern uint8 aAmraam[];
extern uint8 aAgm88a[];
extern uint8 aHarm[];
extern uint8 aAim7m[];
extern uint8 aSparrow[];
extern uint8 aAgm86a[];
extern uint8 aHarpoon[];
extern uint8 aAgm65d[];
extern uint8 aMaverick[];
extern uint8 aGbu12[];
extern uint8 aPaveway[];
extern uint8 aMk20[];
extern uint8 aRockeye[];
extern uint8 aDndl[];
extern uint8 aDurandal[];
extern uint8 aMk820[];
extern uint8 aSlick[];
extern uint8 aMk821[];
extern uint8 aSnakeye[];
extern uint8 aMk20_0[];
extern uint8 aRockeyeIi[];
extern uint8 aMk122[];
extern uint8 aFireeye[];
extern uint8 aCbu72[];
extern uint8 aFuelAir[];
extern uint8 aMk35[];
extern uint8 aInCluster[];
extern uint8 aIscB1[];
extern uint8 aMinelets[];
extern uint8 a135Mm[];
extern uint8 aCamera[];
extern uint8 a1900lbs[];
extern uint8 aExtraFuel[];
extern uint8 a20Mm[];
extern uint8 aGuns[];
extern uint8 aSpecial[];
extern uint8 aEquip[];
extern int16 word_333D2;
extern int16 word_333D4;
extern int16 word_333DA;
extern int16 word_33442;
extern int16 word_336E4;
extern int16 word_336E6;
extern int16 word_336E8;
extern int16 word_336EA;
extern int16 word_336EC;
extern int16 word_336EE;
extern int16 word_336F0;
extern int16 word_336F2;
extern int16 word_336F4;
extern int16 word_336F6;
extern int16 word_336F8;
extern int16 word_336FA;
extern int16 word_336FC;
extern int16 word_336FE;
extern int16 word_33700;
extern int16 word_33702;
extern int16 word_33704;
extern int16 word_33706;
extern int16 word_33708;
extern int16 word_3370A;
extern int16 word_3370C;
extern int word_3370E;
extern int16 word_33710;
extern int16 word_33712;
extern int16 word_33714;
extern uint8 aStoresExhauste[];
extern uint8 aFlare[];
extern uint8 aChaff[];
extern uint8 aReleased[];
extern uint8 aGun[];
extern uint8 aS[];
extern int16 word_3374A;
extern uint8 aOnPatrol[];
extern uint8 aF15StrikeEagle[];
extern uint8 aAt[];
extern uint8 jmp_0[];
extern uint8 jmp_1[];
extern uint8 jmp_2[];
extern uint8 jmp_3[];
extern uint8 jmp_4[];
extern uint8 jmp_5[];
extern uint8 jmp_6[];
extern uint8 jmp_7[];
extern uint8 jmp_8[];
extern uint8 jmp_9[];
extern uint8 jmp_10[];
extern uint8 jmp_11[];
extern uint8 jmp_12[];
extern uint8 jmp_13[];
extern uint8 jmp_14[];
extern uint8 jmp_15[];
extern uint8 jmp_16[];
extern uint8 jmp_17[];
extern uint8 jmp_18[];
extern uint8 jmp_19[];
extern uint8 jmp_20[];
extern uint8 jmp_21[];
extern uint8 jmp_22[];
extern uint8 jmp_23[];
extern uint8 jmp_24[];
extern uint8 jmp_25[];
extern uint8 jmp_26[];
extern uint8 jmp_27[];
extern uint8 jmp_28[];
extern uint8 jmp_29[];
extern uint8 jmp_30[];
extern uint8 jmp_31[];
extern uint8 jmp_32[];
extern uint8 jmp_33[];
extern uint8 jmp_34[];
extern uint8 jmp_35[];
extern uint8 jmp_36[];
extern uint8 jmp_37[];
extern uint8 jmp_38[];
extern uint8 jmp_39[];
extern uint8 jmp_40[];
extern uint8 jmp_41[];
extern uint8 jmp_42[];
extern uint8 jmp_43[];
extern uint8 jmp_44[];
extern uint8 jmp_45[];
extern uint8 jmp_46[];
extern uint8 jmp_47[];
extern uint8 jmp_48[];
extern uint8 jmp_49[];
extern uint8 jmp_50[];
extern uint8 jmp_51[];
extern uint8 jmp_52[];
extern uint8 jmp_53[];
extern uint8 jmp_54[];
extern uint8 jmp_55[];
extern uint8 jmp_56[];
extern uint8 jmp_57[];
extern uint8 jmp_58[];
extern uint8 jmp_59[];
extern uint8 jmp_60[];
extern uint8 jmp_61[];
extern uint8 jmp_62[];
extern uint8 jmp_63[];
extern uint8 jmp_64[];
extern uint8 jmp_65[];
extern int16 word_339B0;
extern uint8 byte_339B2[];
extern int16 word_33BAC;
extern size_t word_33BB8;
extern int16 word_33C82;
extern int16 word_33C84;
extern size_t word_33E10;
extern size_t word_33E12;
extern size_t word_33E14;
extern size_t word_33E16;
extern int16 word_33E18;
extern int16 word_3401A;
extern uint8 a_3d3[];
extern uint8 aRb[];
extern uint8 aOpenErrorOn_3d3[];
extern uint8 aBadObjFileFormat_[];
extern uint8 aObjectDataTooBig_[];
extern uint8 aRb_0[];
extern uint8 aPhoto_3d3[];
extern uint8 aPleaseInsertF15DiskB[];
extern uint8 aRb_1[];
extern uint8 aPhoto_3d3_0[];
extern uint8 aObjdataOverflow[];
extern uint8 a_3dt[];
extern uint8 aRb_2[];
extern uint8 aOpenErrorOn_3dt[];
extern uint8 aBadTileFileFormat_[];
extern uint8 aTooManyTiles_[];
extern uint8 aTooMuchTileData[];
extern uint8 a_3dg[];
extern uint8 aRb_3[];
extern uint8 aPleaseInsertScenarioD[];
extern uint8 aPressAKeyWhenReady[];
extern uint8 aBadGridFileFormat_[];
extern int16 word_34150;
extern int16 word_34152;
extern int16 word_34156;
extern int16 word_34158;
extern int16 word_3415A;
extern int16 word_3415C;
extern int16 word_3415E;
extern int16 word_34160;
extern int16 word_34162;
extern int16 word_34164;
extern int16 word_34166;
extern int16 word_34168;
extern int16 word_3416A;
extern int16 word_3416C;
extern uint8 byte_3416E;
extern uint8 byte_3416F;
extern uint8 byte_34170;
extern int16 word_34171;
extern int16 word_34173;
extern int16 word_34175;
extern int16 word_34177;
extern int16 word_34179;
extern int16 word_3417B;
extern int16 word_3417D;
extern int16 word_3417F;
extern int16 word_34190;
extern int16 word_34192;
extern int16 word_34194;
extern uint8 byte_34196;
extern uint8 byte_34197;
extern int16 word_34198;
extern uint8 byte_3419A[];
extern uint8 byte_3419F[];
extern int16 word_341B4;
extern int16 word_341B6;
extern int16 word_341B8;
extern int16 word_341BA;
extern int16 word_341BC;
extern uint32 dword_3423C;
extern int16 word_34240;
extern int16 word_34242;
extern int16 word_34244;
extern int16 word_34246;
extern int16 word_34248;
extern int16 word_3424A;
extern int16 word_3424C;
extern int16 word_3424E;
extern int16 word_34250;
extern int16 word_34252;
extern int16 word_34254;
extern int16 word_34256;
extern uint8 byte_34258[];
extern int16 word_34260;
extern int16 word_34262;
extern int16 word_34264;
extern int16 word_34266;
extern int16 word_34268;
extern int16 word_3426A;
extern int16 word_3426C;
extern int16 word_3426E;
extern int16 word_34270;
extern int16 word_34272;
extern int16 word_34274;
extern int16 word_34276;
extern int16 word_34278;
extern int16 word_3427A;
extern int16 word_3427C;
extern int16 word_3427E;
extern int16 word_34280;
extern int16 word_34282;
extern int16 word_34284;
extern int16 word_34286;
extern int16 word_34288;
extern int16 word_3428A;
extern int16 word_3428C;
extern int16 word_3428E;
extern int16 word_34290;
extern int16 word_34292;
extern int16 word_34294;
extern int16 word_34296;
extern int16 word_34298;
extern int16 word_3429A;
extern int16 word_3429C;
extern int16 word_3429E;
extern int16 word_342A0;
extern int16 word_342A2;
extern int16 word_342A4;
extern int16 word_342A6;
extern int16 word_342A8;
extern int16 word_342AA;
extern int16 word_342AC;
extern int16 word_342AE;
extern int16 word_342B0;
extern uint8 byte_342B4[];
extern int16 word_342B6;
extern int16 word_342B8;
extern int16 word_342BA;
extern int16 word_342BC;
extern int16 word_342BE;
extern int16 word_3449C;
extern int16 word_3449E;
extern int16 word_344A0;
extern int16 word_344A2;
extern int16 word_34680;
extern int16 word_34682;
extern int16 word_34684;
extern int16 word_34686;
extern uint8 unk_34713[];
extern int16 word_34864;
extern int16 word_34866;
extern int16 word_34868;
extern uint32 dword_34A48;
extern int16 word_34A4C;
extern uint8 unk_34A88[];
extern uint32 dword_34C2C;
extern int16 word_35AF8;
extern int16 word_36B7E;
extern int16 word_36B80;
extern int16 word_36B82;
extern int16 word_36B84;
extern int16 word_36B86;
extern uint8 byte_36B88;
extern int16 word_36B89;
extern int16 word_36B8B;
extern uint8 byte_36BAE[];
extern int16 word_36C10;
extern int16 word_36C12;
extern int16 word_36C14;
extern uint8 byte_36C16;
extern uint8 byte_36C17;
extern uint8 byte_36C18;
extern int16 word_36C19;
extern int16 word_36C1B;
extern int16 word_36C1D;
extern int16 word_36C1F;
extern int16 word_36C21;
extern int16 word_36C23;
extern int16 word_36C25;
extern int16 word_36C27;
extern uint8 byte_36C31;
extern uint8 byte_36C32;
extern int16 word_36C33;
extern uint8 byte_3754E;
extern int16 word_3754F;
extern int16 word_37551;
extern int16 word_37553;
extern int16 word_37555;
extern int16 word_37557;
extern int16 word_37559;
extern int16 word_3755D;
extern int16 word_3755F;
extern int16 word_37561;
extern int16 word_37563;
extern uint8 unk_37565[];
extern uint8 unk_3771D[];
extern int16 word_378D5;
extern int16 word_378D7;
extern int16 word_378D9;
extern int16 word_378DB;
extern uint8 byte_378DE;
extern int16 word_378DF;
extern int16 word_378E1;
extern int16 word_378E3;
extern int16 word_378E5;
extern uint8 byte_378E8;
extern int16 word_378E9;
extern int16 word_378EB;
extern uint8 byte_378EE;
extern uint8 timerHandlerInstalled;
extern int16 word_378F0;
extern int16 word_378F2;
extern int16 word_378F4;
extern int16 word_378F6;
extern int16 word_378F8;
extern int16 word_378FA;
extern uint8 byte_378FC;
extern int16 word_378FD;
extern int16 word_378FF;
extern int16 word_37901;
extern uint8 byte_37903;
extern int16 word_37904;
extern int16 word_37906;
extern int16 word_3790A;
extern uint8 byte_3790C[];
extern int16 word_37B26;
extern int16 word_37B2E;
extern int16 word_37B30;
extern int16 word_37B32;
extern int16 word_37B34;
extern int16 word_37B36;
extern int16 word_37B3C;
extern int16 word_37B44;
extern int16 word_37B46;
extern int16 word_37B48;
extern int16 word_37B4E;
extern int16 word_37B50;
extern int16 word_37B52;
extern int16 word_37B5A;
extern int16 word_37B5C;
extern int16 word_37B5E;
extern int16 word_37B60;
extern int16 word_37B64;
extern int16 word_37B66;
extern int16 word_37B68;
extern int16 word_37B70;
extern int16 word_37B72;
extern int16 word_37B74;
extern int16 word_37B7E;
extern int16 word_37B82;
extern int16 word_37B84;
extern int16 word_37B86;
extern int16 word_37B88;
extern int16 word_37B8A;
extern int16 word_37B8C;
extern int16 word_37B9C;
extern int16 word_37B9E;
extern int16 word_37BA0;
extern int16 word_37BA2;
extern int16 word_37BA4;
extern int16 word_37BA6;
extern int16 word_37BA8;
extern int16 word_37BAA;
extern int16 word_37BBA;
extern int16 word_37BC0;
extern int16 word_37BD8;
extern int16 word_37BDE;
extern uint8 byte_37BF6;
extern int16 word_37BF7;
extern uint8 byte_37BF9;
extern int16 word_37BFA;
extern uint8 byte_37BFC;
extern int16 word_37BFD;
extern int16 word_37BFF;
extern int16 word_37C01;
extern int16 word_37C03;
extern int16 word_37C05;
extern int16 word_37C07;
extern int16 word_37C09;
extern int16 word_37C0B;
extern int16 word_37C0D;
extern int16 word_37C0F;
extern int16 word_37C11;
extern uint8 byte_37C13;
extern int16 word_37C14;
extern int16 word_37C16;
extern int16 word_37C18;
extern int16 word_37C1A;
extern int16 word_37C1C;
extern int16 word_37C1E;
extern int16 word_37C20;
extern int16 word_37C22;
extern uint8 byte_37C24;
extern int16 word_37C25;
extern int16 word_37C27;
extern int16 word_37C29;
extern int16 word_37C2B;
extern uint8 byte_37C2D;
extern uint8 byte_37C2E;
extern uint8 byte_37C2F;
extern int16 word_37C30;
extern int16 word_37C32;
extern uint8 byte_37C35;
extern int16 word_37C36;
extern uint8 byte_37C3A[];
extern uint8 byte_37EEE;
extern uint8 byte_37EEF;
extern int16 word_37EF0;
extern int16 word_37EF2;
extern int16 word_37F50;
extern int16 word_37F52;
extern int16 word_37F54;
extern int16 word_37F56;
extern int16 word_37F58;
extern int16 word_37F5A;
extern int16 word_37F5C;
extern int16 word_37F5E;
extern int16 word_37F60;
extern int16 word_37F62;
extern int16 word_37F8C;
extern int16 word_37F8E;
extern int16 word_37F94;
extern uint8 byte_37F98;
extern uint8 byte_37F99[];
extern int16 word_38070;
extern int word_38072;
extern int word_38074;
extern int16 word_38076;
extern int16 word_38078;
extern int16 word_3807E;
extern int16 word_38080;
extern int16 word_38084;
extern int16 word_3808C;
extern int16 word_38090;
extern int16 word_3809A;
extern int16 word_3809C;
extern int16 word_380A0;
extern int16 word_380A2;
extern int16 word_380A4;
extern int16 word_380A6;
extern int16 word_380AA;
extern int16 word_380AC;
extern int word_380C8;
extern int word_380CA;
extern int word_380CC;
extern int16 word_380CE;
extern int16 word_380D0;
extern int16 word_380D8;
extern uint8 byte_380DA[];
extern uint8 byte_380DD[];
extern int16 word_380E0;
extern int16 word_380E2;
extern uint8 a256left_pic[];
extern uint8 a256right_pic[];
extern uint8 a256rear_pic[];
extern uint8 aLeft_pic[];
extern uint8 aRight_pic[];
extern uint8 aRear_pic[];
extern int16 word_38126;
extern int16 word_38152;
extern uint8 aFiring[];
extern int16 word_3815E;
extern uint8 aFiredBy[];
extern uint8 aTakingOff[];
extern uint8 aMisses[];
extern uint8 aDestroyedBy[];
extern uint8 aDestroyedBy_0[];
extern uint8 aGroundImpact[];
extern uint8 aHitBy[];
extern uint8 aIneffective[];
extern uint8 aHitBy_0[];
extern uint8 aA[];
extern int word_38334;
extern int word_3834C;
extern int16 word_38364;
extern int16 word_3837C;
extern int16 word_383AC;
extern int16 word_383AE;
extern int16 word_383B0;
extern int16 word_383B2;
extern int16 word_383B4;
extern int16 word_383B6;
extern int16 word_383B8;
extern int16 word_383BA;
extern int16 word_383BC;
extern int16 word_383CC;
extern int16 word_383CE;
extern int16 word_383D0;
extern int16 word_383D2;
extern int16 word_383D4;
extern int16 word_383D6;
extern int16 word_383D8;
extern int16 word_383DA;
extern uint8 byte_383E4;
extern uint8 byte_383E5[];
extern int16 word_383EA;
extern int16 word_383EC;
extern int16 word_383EE;
extern int16 word_383F0;
extern int16 word_383F2;
extern int16 word_383F4;
extern uint8 aStallWarning[];
extern uint8 aAccel[];
extern uint8 aTraining[];
extern uint8 aAutopilot[];
extern uint8 aPressAnyKeyToP[];
extern uint8 aTac[];
extern uint8 aTrackcam[];
extern uint8 aAhead[];
extern uint8 aRear[];
extern uint8 aRight[];
extern uint8 aLeft[];
extern uint8 aMap[];
extern int16 word_38460;
extern uint8 aDestroyedByGun[];
extern uint8 aHitByGunfire[];
extern uint8 aDestroyedByG_0[];
extern uint8 aAt_0[];
extern uint8 byte_3850E[];
extern uint8 a15flt_xxx[];
extern uint8 aBrg[];
extern uint8 aLong[];
extern uint8 aMedium[];
extern uint8 aShort[];
extern uint8 aRangeRadar[];
extern uint8 aDetailLevel[];
extern uint8 aKybdSensitivit[];
extern uint8 aMemoryAvailabl[];
extern uint8 aJiffiesFrame[];
extern uint8 aSounds[];
extern uint8 aDirector[];
extern uint8 aOff[];
extern uint8 aWaypointPrimar[];
extern uint8 aWaypointSecond[];
extern uint8 aWaypointFriend[];
extern uint8 aAutopilotOff[];
extern uint8 aAutopilotOn[];
extern int16 word_38600;
extern int16 word_38602;
extern int16 word_38604;
extern int16 word_38606;
extern int16 word_38608;
extern int16 word_3860A;
extern uint8 byte_3862A;
extern uint8 byte_3862B[];
extern int16 word_3888E;
extern int16 word_38890;
extern int16 word_38894;
extern int16 tmpFileHandle;
extern uint8 picDecodedRowBuf[];
extern int16 word_389D8;
extern int16 tmpPageIndex;
extern int16 rowOffset;
extern int16 word_389E0;
extern int16 readFromFilePtr;
extern int16 word_389E4;
extern int16 word_389E6;
extern int16 off_389E8;
extern int16 word_389EA;
extern int16 word_38A3A;
extern uint8 aC_file_info[];
extern uint32 dword_38A49;
extern int16 word_38A55;
extern int16 word_38A57;
extern int16 word_38A5B;
extern int16 word_38A5D;
extern uint8 byte_38A60[];
extern int16 word_38A62;
extern int argc;
extern char **argv;
extern int16 word_38A7C;
extern uint8 byte_38A86;
extern uint8 byte_38A87;
extern uint32 dword_38A88;
extern int16 word_38A8C;
extern int16 word_38A92;
extern int16 word_38A94;
extern int16 word_38A96;
extern int16 word_38A98;
extern int16 word_38BC6;
extern int16 word_38BC8;
extern int16 word_38BCA;
extern int16 word_38BCC;
extern int16 word_38BD0;
extern uint8 byte_38BD5;
extern int16 word_38BD6;
extern int16 word_38BDA;
extern int16 word_38BDC;
extern uint8 byte_38BE0[];
extern uint8 unk_38BE4[];
extern int16 word_38BE6;
extern uint32 dword_38BE8;
extern uint32 dword_38BEC;
extern uint8 byte_38BF0[];
extern int16 seg_38BF2;
extern int16 seg_38BF4;
extern int16 seg_38BF6;
extern uint8 aNmsg[];
extern uint8 aR6000StackOver[];
extern uint8 aR6003IntegerDivideBy0[];
extern uint8 aR6009NotEnoughSpaceFo[];
extern uint8 aRunTimeError[];
extern uint8 aR6002FloatingPointNot[];
extern uint8 aR6001NullPointerAssig[];
extern int16 word_38CD2;
extern unsigned int word_38CD4;
extern unsigned int word_38CD6;
extern int16 word_38CD8;
extern int16 word_38CDA;
extern int16 word_38CDC;
extern int16 word_38CDE;
extern int16 word_38CE0;
extern int16 word_38CE2;
extern int16 word_38CE4;
extern int16 word_38CE6;
extern int16 word_38CE8;
extern int16 word_38CEA;
extern int16 word_38CEC;
extern int16 word_38CEE;
extern int16 word_38CF0;
extern int16 word_38CF2;
extern int16 word_38CFA;
extern int16 word_38CFC;
extern int16 word_38CFE;
extern int16 word_38D00;
extern int16 word_38D02;
extern int16 word_38D04;
extern int16 word_38D06;
extern size_t word_38D4A;
extern int16 word_38D4C;
extern int16 word_38D4E;
extern int16 word_38D50;
extern int16 word_38D52;
extern int16 word_38D54;
extern int16 word_38D56;
extern unsigned int word_38D58;
extern int16 word_38D5A;
extern int16 word_38D5C;
extern int16 word_38D5E;
extern uint8 byte_38D60;
extern uint8 byte_38D61;
extern uint8 byte_38D62;
extern uint8 byte_38D63;
extern int16 word_38D64;
extern int16 word_38D66;
extern int16 word_38D68;
extern uint8 byte_38D6A;
extern uint8 byte_38D6B;
extern int16 word_38D6C;
extern uint8 byte_38D6E[];
extern int16 word_38F70;
extern int word_38F72;
extern uint8 byte_38F8C;
extern uint8 byte_38F8D[];
extern int16 word_38FC4;
extern int16 word_38FC6;
extern int16 word_38FC8;
extern int16 word_38FCC;
extern int16 word_38FCE;
extern int word_38FDA;
extern int word_38FDC;
extern int16 word_38FDE;
extern int16 word_38FE0;
extern uint32 dword_38FE2;
extern size_t word_38FE6;
extern int16 word_38FE8;
extern int16 word_38FEA;
extern int16 word_38FEC;
extern int16 word_38FEE;
extern struct Game far *gameData;
extern int16 word_38FF6;
extern int16 word_38FF8;
extern int16 word_38FFA;
extern int16 word_38FFC;
extern int16 word_391FE;
extern int16 word_39200;
extern int16 word_39402;
extern int16 word_39604;
extern int word_39606;
extern int16 word_39808;
extern uint8 byte_3995A[];
extern int16 word_3995C;
extern int16 word_3A8FE;
extern int16 word_3A940;
extern int word_3A944;
extern int16 word_3A946;
extern int16 word_3AA5A;
extern int16 word_3AA5E;
extern int16 word_3AA60;
extern int16 word_3AA6A;
extern int16 word_3AF0C;
extern int16 word_3AFA4;
extern int16 word_3AFA6;
extern int16 word_3AFA8;
extern int16 word_3AFAA;
extern int16 word_3B0AC;
extern int16 word_3B144;
extern int16 word_3B146;
extern int16 word_3B148;
extern int16 word_3B14C;
extern int16 word_3B158;
extern int16 word_3B15A;
extern int16 word_3B15E;
extern int16 word_3B1FE;
extern int16 word_3B200;
extern int16 word_3B228;
extern int16 word_3B22A;
extern int16 word_3B22C;
extern int16 word_3B22E;
extern int16 word_3B230;
extern int16 word_3B232;
extern int16 word_3B234;
extern int16 word_3B236;
extern uint8 byte_3B23E[];
extern int16 word_3B240;
extern int16 word_3B4D2;
extern int16 word_3B4D4;
extern int16 word_3B4D6;
extern int16 word_3B4D8;
extern int16 word_3B4DA;
extern int16 word_3B4DC;
extern int16 word_3B4DE;
extern int16 word_3B4E0;
extern uint8 byte_3B4E2[];
extern int16 word_3B4E4;
extern int16 word_3B5D6;
extern int16 word_3B7DA;
extern int16 word_3B7DC;
extern int16 word_3B7DE;
extern int16 word_3B7E0;
extern int16 word_3B7E2;
extern int16 word_3B7E4;
extern int16 word_3B7E6;
extern int16 word_3B7E8;
extern int16 word_3B7EA;
extern int16 word_3B7EC;
extern uint8 byte_3B7EE;
extern uint8 byte_3B7EF;
extern uint8 byte_3B7F0;
extern uint8 byte_3B7F1[];
extern int16 word_3B7F8;
extern int16 word_3B7FA;
extern int16 word_3BE3C;
extern int16 word_3BE7E;
extern int16 word_3BE90;
extern int16 word_3BE92;
extern int word_3BE94;
extern int16 word_3BE96;
extern int16 word_3BE98;
extern int16 word_3BE9C;
extern int16 word_3BEBC;
extern int16 word_3BEBE;
extern int16 word_3BEC0;
extern int16 word_3BEC2;
extern uint8 byte_3BEC4[];
extern int16 word_3BEC8;
extern int16 word_3BECA;
extern int16 word_3BECC;
extern int16 word_3BECE;
extern int16 word_3BED0;
extern int16 word_3BED2;
extern int16 word_3BED4;
extern int16 word_3BED6;
extern int16 word_3BF3C;
extern int16 word_3BF3E;
extern int16 word_3BF90;
extern uint8 byte_3BF92;
extern uint8 byte_3BF93[];
extern uint8 byte_3BF95;
extern int16 word_3BF96;
extern int16 word_3BF98;
extern int16 word_3BFA0;
extern int16 word_3BFA2;
extern int16 word_3C008;
extern int16 word_3C00A;
extern int word_3C00E;
extern int16 word_3C010;
extern int16 word_3C012;
extern int16 word_3C014;
extern int16 word_3C016;
extern int16 word_3C018;
extern int16 word_3C01A;
extern int16 word_3C01C;
extern int16 word_3C01E;
extern int16 word_3C020;
extern int16 word_3C024;
extern int16 word_3C026;
extern int16 word_3C028;
extern uint8 byte_3C02A[];
extern int16 word_3C02C;
extern int16 word_3C02E;
extern int16 word_3C03A;
extern int16 word_3C03E;
extern int16 word_3C040;
extern int16 word_3C042;
extern int16 word_3C044;
extern int16 word_3C046;
extern int16 word_3C048;
extern int16 word_3C09A;
extern int16 word_3C09C;
extern int16 word_3C09E;
extern int16 word_3C0A0;
extern int16 word_3C0A2;
extern int16 word_3C16A;
extern int16 word_3C16C;
extern int16 word_3C45C;
extern int16 word_3C45E;
extern uint8 byte_3C5A0[];
extern int16 word_3C5A2;
extern int16 word_3C5A4;
extern int16 word_3C5A6;
extern int16 word_3C5A8;
extern int16 word_3C5AA;
extern int16 word_3C69C;
extern int16 word_3C69E;
extern uint8 byte_3C6A0[];
extern int16 word_3C6A2;
extern int16 word_3C6A4;
extern struct GameComm far *commData;
extern int16 word_3C6AA;
extern int16 word_3C6AC;
extern int word_3C6AE;
extern uint8 byte_3C8B0[];
extern int16 word_3C8B2;
extern int16 word_3C8B4;
extern int16 word_3C8B6;
extern int16 word_3C8B8;
extern int16 word_3C8BA;
extern int16 word_3C8BC;
extern int16 word_3C8BE;
extern int16 word_3C8C0;
extern int16 word_3C8C2;
extern size_t word_3C8C4;
#endif // F15_SE2_EGAME
