#ifndef F15_SE2_START
#define F15_SE2_START
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
#define COMM_SNDOVL_NAME 0xd
#define ROSTER_SCORE_LO 0x16
#define OVL_HDR_CODESEG 0x18
#define ROSTER_SCORE_HI 0x18
#define COMM_GVXOVL_SEG 0x1a
#define ROSTER_LASTSCORE 0x1a
#define COMM_SNDOVL_SEG 0x1c
#define OVL_HDR_FIRSTIDX 0x1c
#define ROSTER_UNK1 0x1c
#define ROSTER_UNK2 0x1d
#define COMM_MISCOVL_SEG 0x1e
#define OVL_HDR_SIZE1 0x1e
#define ROSTER_THEATER 0x1e
#define ROSTER_DIFFICULTY 0x1f
#define COMM_GFXBUF_PTR 0x20
#define OVL_HDR_SIZE2 0x20
#define GAMEDATA_UNK2 0x20
#define OVL_HDR_SLOTCOUNT 0x22
#define COMM_SETUP1 0x22
#define GAMEDATA_UNK3 0x22
#define OVL_HDR_FIRSTPTR 0x24
#define COMM_HERC_FLAG 0x24
#define COMM_SETUPDONE 0x26
#define COMM_UNK2 0x28
#define COMM_UNK3 0x2c
#define GAMEDATA_LASTSCORE 0x2e
#define COMM_SETUP_GFXMODE 0x30
#define COMM_BUFFER_FLAG2 0x30
#define GAMEDATA_SCORE_LO 0x32
#define GAMEDATA_SCORE_HI 0x34
#define GAMEDATA_THEATER 0x38
#define COMM_UNK7 0x38
#define GAMEDATA_FLAG4 0x3a
#define COMM_UNK5 0x3a
#define GAMEDATA_FLAG3 0x3c
#define COMM_UNK6 0x3c
#define COMM_BUFFER_DIFFICULTY 0x3e
#define SEGMENT_BDA 0x40
#define COMM_UNK8 0x40
#define COMM_BUFFER_RAND 0x42
#define GAMEDATA_UNK1 0x44
#define COMM_JOYDATA_OFF 0x48
#define COMM_BUFFER_FLAG1 0x4e
#define COMM_USEJOY_OFF 0x72
#define COMM_GFXMODE_OFFSET 0x78
#define TIMEOUT_MPS 0x78
#define BDA_EGASW 0x88
#define TIMEOUT_ADV 0xb4
#define BDA_CRTC 0x463
#define STACK_JOYDATA 0xcde
#define DOS_PRINT_STR 0x9
#define DOS_ERROR_RMDIR 0x10
#define DOS_SET_IRQH 0x25
#define DOS_ALLOC_MEM 0x48
#define IRQ_PIT 0x8
#define IRQ_VIDEO 0x10
#define IRQ_KBD 0x16
#define IRQ_TIME 0x1a
#define IRQ_CBREAK 0x1b
#define HALLFAME_RECORDSZ 0x20
#define IRQ_DOS 0x21
#define PORT_PIT_TIME0 0x40
#define PORT_PIT_CNTRL 0x43
#define SCREEN_MAXY 0xc7
#define SCREEN_MAXX 0x13f
#define FILE_READBUF_SIZE 0x200
// ==== startCode1:0x483 ====
int sub_10483();
// ==== startCode1:0x4a0 ====
void initGraphics(void);
// ==== startCode1:0x511 ====
int cleanup();
// ==== startCode1:0x544 ====
int setargv();
// ==== startCode1:0x547 ====
int setenvp();
// ==== startCode1:0x54a ====
void clearKeybuf(void);
// ==== startCode1:0x561 ====
void waitJoyKey(void);
// ==== startCode1:0x571 ====
int joyOrKey();
// ==== startCode1:0x5d5 ====
void waitMdaCgaStatus(int);
// ==== startCode1:0x635 ====
void drawLine(int *pageNum, int x1, int y1, int x2, int y2, int color);
// ==== startCode1:0x674 ====
int showPic640(char *filename);
// bytes outside routine, potential module boundary at 0x6c7
// ==== startCode1:0x6c8 ====
void missionSelect(void);
// ==== startCode1:0x90e ====
int __cdecl missionMenuSelect(char **names, char **desc, char *title, int s);
// ==== startCode1:0xa9f ====
void animateArm(int, int);
// ==== startCode1:0xcdb ====
int askRepeatMission(void);
// ==== startCode1:0xd3a ====
void checkDiskA(void);
// ==== startCode1:0xdca ====
void missionDecode(void);
// ==== startCode1:0xe0a ====
void printMission(void);
// ==== startCode1:0x10ab ====
int processStoreInput();
// ==== startCode1:0x1229 ====
void clearBriefing(void);
// ==== startCode1:0x124a ====
int __cdecl showSprite(int, int, int, int, int, int, int);
// ==== startCode1:0x12b8 ====
void __cdecl actualDrawString(int *arg_pageNum, const char *arg_string, int arg_x, int arg_y);
// ==== startCode1:0x12df ====
int sub_112DF();
// ==== startCode1:0x130b ====
int unreach_1130B();
// ==== startCode1:0x1458 ====
int sub_11458();
// ==== startCode1:0x1577 ====
void __cdecl drawString(int *, const char *, int, int, int);
// ==== startCode1:0x15ae ====
int __cdecl stringWidth(int *, const char *);
// ==== startCode1:0x15f1 ====
int __cdecl my_ltoa(__int32, char *);
// ==== startCode1:0x172c ====
int __cdecl my_itoa(int, char *);
// ==== startCode1:0x1824 ====
int seedRandom();
// ==== startCode1:0x1835 ====
int __cdecl randMul(unsigned int);
// bytes outside routine, potential module boundary at 0x1859
// ==== startCode1:0x185a ====
void setTimerIrqHandler(void);
// ==== startCode1:0x1898 ====
void restoreTimerIrqHandler(void);
// ==== startCode1:0x18b9 ====
int sub_118B9();
// ==== startCode1:0x18d1 ====
int sub_118D1();
// ==== startCode1:0x18e7 ====
int far timerIrqHandler();
// ==== startCode1:0x194d ====
int sub_1194D();
// ==== startCode1:0x19d4 ====
int sub_119D4();
// ==== startCode1:0x1a69 ====
int sub_11A69();
// ==== startCode1:0x1abe ====
int getTimeOfDay();
// ==== startCode1:0x1ac5 ====
int increaseTimerCounters();
// bytes outside routine, potential module boundary at 0x1adb
// ==== startCode1:0x1adc ====
int doFcbSearch();
// ==== startCode1:0x1b03 ====
void picBlit(int handle, int unk);
// bytes outside routine, potential module boundary at 0x1b71
// ==== startCode1:0x1b72 ====
void pilotSelect(int ps_needSplash);
// bytes outside routine, potential module boundary at 0x1c07
// ==== startCode1:0x1c08 ====
int updateHallfame();
// bytes outside routine, potential module boundary at 0x1d31
// ==== startCode1:0x1d32 ====
void displayPilots(void);
// ==== startCode1:0x1d80 ====
void __cdecl printPilot(int);
// bytes outside routine, potential module boundary at 0x1f43
// ==== startCode1:0x1f44 ====
int processPilotInput();
// ==== startCode1:0x210a ====
int sub_1210A();
// ==== startCode1:0x2182 ====
void __cdecl gameDataToPilot(struct Pilot *pilot);
// ==== startCode1:0x2232 ====
void pilotToGameData(unsigned __int8 *pilotData);
// ==== startCode1:0x22ec ====
int __cdecl pilotNameInput(int *, int, int, int, struct Pilot *);
// ==== startCode1:0x24e4 ====
void loadHallfame(void);
// ==== startCode1:0x2542 ====
int saveHallfame();
// ==== startCode1:0x25a0 ====
int getJoyKey();
// bytes outside routine, potential module boundary at 0x25e3
// ==== startCode1:0x25e4 ====
int sub_125E4();
// bytes outside routine, potential module boundary at 0x2651
// ==== startCode1:0x2652 ====
int sub_12652();
// ==== startCode1:0x2660 ====
int sub_12660();
// ==== startCode1:0x2680 ====
int sub_12680();
// ==== startCode1:0x26b0 ====
void mystrcpy(char *dest, const char *source);
// ==== startCode1:0x26cb ====
int sub_126CB();
// ==== startCode1:0x26e2 ====
int sub_126E2();
// ==== startCode1:0x26fd ====
int mystrlen();
// ==== startCode1:0x2719 ====
int mystrcat();
// ==== startCode1:0x2741 ====
int sub_12741();
// ==== startCode1:0x2764 ====
void nearmemset(void *dst, char value, int count);
// ==== startCode1:0x277a ====
void farmemset(char far *dst, char value, int count);
// ==== startCode1:0x2790 ====
int my_memcpy();
// ==== startCode1:0x27ae ====
int unreach_127AE();
// ==== startCode1:0x27ca ====
int sub_127CA();
// ==== startCode1:0x27f5 ====
void intDispatch(int intNum, char *inregs, char *outregs);
// ==== startCode1:0x285a ====
int myItoa();
// ==== startCode1:0x2897 ====
int base10_itoa();
// ==== startCode1:0x28c2 ====
int base16_itoa();
// ==== startCode1:0x290a ====
int base2_itoa();
// ==== startCode1:0x292c ====
int unreach_1292C();
// ==== startCode1:0x2977 ====
int dos_printstring();
// ==== startCode1:0x2985 ====
int loadOverlay(const char *filename);
// ==== startCode1:0x2a88 ====
void setupOverlaySlots(int ovlSegment);
// ==== startCode1:0x2ae1 ====
int unreach_12AE1();
// ==== startCode1:0x2b1b ====
int sub_12B1B();
// ==== startCode1:0x2bba ====
void __cdecl clearRect(int *buf, int x, int y, int maxx, int maxy);
// ==== startCode1:0x2c59 ====
int unreach_12C59();
// ==== startCode1:0x2c6f ====
int sub_12C6F();
// ==== startCode1:0x2c75 ====
int sub_12C75();
// bytes outside routine, potential module boundary at 0x2d7a
// ==== startCode1:0x2dea ====
int sub_12DEA();
// ==== startCode1:0x2df6 ====
int sub_12DF6();
// ==== startCode1:0x2f6a ====
int sub_12F6A();
// ==== startCode1:0x2f8b ====
int far sub_12F8B();
// ==== startCode1:0x2fac ====
int installCBreakHandler();
// ==== startCode1:0x2fcf ====
void restoreCbreakHandler(void);
// ==== startCode1:0x2fe0 ====
int getInterruptHandler();
// ==== startCode1:0x2fec ====
int far cbreakHandler();
// bytes outside routine, potential module boundary at 0x2ffb
// ==== startCode1:0x2ffc ====
int unreach_12FFC(int filename, int a);
// bytes outside routine, potential module boundary at 0x3031
// ==== startCode1:0x3032 ====
int unreach_13032(int filename, int a, int b);
// ==== startCode1:0x306a ====
int unreach_1306A();
// ==== startCode1:0x30a2 ====
int openFileWrapper(char *filename, int mode);
// bytes outside routine, potential module boundary at 0x30b3
// ==== startCode1:0x30b4 ====
int unreach_130B4();
// bytes outside routine, potential module boundary at 0x30c5
// ==== startCode1:0x30c6 ====
int closeFileWrapper(int handle);
// ==== startCode1:0x30d4 ====
int unreach_130D4();
// ==== startCode1:0x30e8 ====
int unreach_130E8();
// ==== startCode1:0x3100 ====
int unreach_13100();
// ==== startCode1:0x311a ====
int openFile(char *filename, int mode);
// ==== startCode1:0x3171 ====
int unreach_13171();
// ==== startCode1:0x31c8 ====
int fileClose(int handle);
// ==== startCode1:0x31ea ====
int unreach_131EA();
// ==== startCode1:0x3215 ====
int unreach_13215();
// ==== startCode1:0x3243 ====
int unreach_13243();
// ==== startCode1:0x326c ====
int read512FromFileIntoBuf();
// ==== startCode1:0x328d ====
int unreach_1328D();
// ==== startCode1:0x32a5 ====
int sub_132A5();
// ==== startCode1:0x3312 ====
void openShowPic(char *filename, int pageNum, int garbage);
// ==== startCode1:0x333e ====
int unreach_1333E(int filename, int a);
// ==== startCode1:0x3368 ====
void __cdecl loadPic(char *, unsigned int);
// bytes outside routine, potential module boundary at 0x3391
// ==== startCode1:0x3392 ====
void unreach_loadPicAt();
// bytes outside routine, potential module boundary at 0x33cf
// ==== startCode1:0x33d0 ====
void showPicFile(int handle, int pageNum);
// ==== startCode1:0x3442 ====
int unreach_13442();
// ==== startCode1:0x34aa ====
int unreach_134AA();
// ==== startCode1:0x351e ====
int decodePic();
// ==== startCode1:0x3586 ====
int nullsub_1();
// bytes outside routine, potential module boundary at 0x3587
// ==== startCode1:0x3588 ====
int decodePicRow();
// ==== startCode1:0x35b2 ====
int picReadDataAndMakeDict();
// ==== startCode1:0x35f9 ====
int picMakeDict();
// ==== startCode1:0x362f ====
int doPicDecode();
// ==== startCode1:0x36a8 ====
int dictionaryLookup();
// bytes outside routine, potential module boundary at 0x3757
// ==== startCode1:0x3758 ====
unsigned int __cdecl allocBuffer(int sz);
// ==== startCode1:0x378c ====
int unreach_freeBuffer(int freeSeg);
// ==== startCode1:0x37b4 ====
unsigned int __cdecl dos_alloc(int sz);
// ==== startCode1:0x37da ====
int unreach_dos_freeMem(int freeSeg);
// bytes outside routine, potential module boundary at 0x37f7
// ==== startCode1:0x37f8 ====
int *__cdecl sub_137F8(__int32, __int32);
// ==== startCode1:0x39e9 ====
unsigned __int32 __cdecl sub_139E9(int, unsigned __int32);
// ==== startCode1:0x3a61 ====
int __cdecl sub_13A61(int, int, int);
// bytes outside routine, potential module boundary at 0x3b89
// ==== startCode1:0x3b8a ====
void parseGridTerrain(void);
// ==== startCode1:0x3b9e ====
int parseTerrain(char *dest);
// bytes outside routine, potential module boundary at 0x3d4b
// ==== startCode1:0x3d4c ====
int parseGrid();
// ==== startCode1:0x3e8c ====
int __cdecl subReadKey(char *);
// ==== startCode1:0x3ea8 ====
int sub_13EA8(char *dest, char *source);
// ==== startCode1:0x3ed2 ====
int unreach_13ED2();
// ==== startCode1:0x3f08 ====
int unreach_13F08();
// ==== startCode1:0x3f1e ====
int unreach_initPicDictionary();
// ==== startCode1:0x3f52 ====
int unreach_13F52();
// ==== startCode1:0x3f6a ====
int unreach_13F6A();
// ==== startCode1:0x4009 ====
int unreach_14009();
// ==== startCode1:0x4042 ====
void missionGenerate(void);
// ==== startCode1:0x4093 ====
void sub_14093();
// ==== startCode1:0x4bb4 ====
int __cdecl sub_14BB4(int, int, int);
// ==== startCode1:0x4c94 ====
int __cdecl sub_14C94(int, int);
// ==== startCode1:0x4cc5 ====
int __cdecl sub_14CC5(int, int);
// ==== startCode1:0x4d96 ====
int __cdecl sub_14D96(int, int);
// ==== startCode1:0x4e03 ====
void __cdecl parseWorld(const char *);
// ==== startCode1:0x4f76 ====
void writeWorld(const char *filename);
// ==== startCode1:0x50e8 ====
int doNothing2();
// ==== startCode1:0x50eb ====
int __cdecl sub_150EB(int, int);
// ==== startCode1:0x5268 ====
int setMoveDstComm7A();
// ==== startCode1:0x5285 ====
int unreach_15285();
// ==== startCode1:0x52bb ====
int memAppend();
// ==== startCode1:0x52f1 ====
int doNothing();
// ==== startCode1:0x52f4 ====
char *__cdecl sub_152F4(int);
// ==== startCode1:0x531c ====
char *__cdecl sub_1531C(int, int);
// ==== startCode1:0x5472 ====
int __cdecl sub_15472(int, int, int);
// ==== startCode1:0x54a1 ====
void __cdecl sub_154A1(int arg_0);
// ==== startCode1:0x5741 ====
int sub_15741();
// ==== startCode1:0x5750 ====
int sub_15750();
// bytes outside routine, potential module boundary at 0x5763
// ==== startCode1:0x5f0a ====
int sub_15F0A();
// bytes outside routine, potential module boundary at 0x6419
// ==== startCode1:0x64c0 ====
int sub_164C0();
// bytes outside routine, potential module boundary at 0x654f
// ==== startCode1:0x6a06 ====
int sub_16A06();
// ==== startCode2:0x1c ====
int unreach_16A6C();
// ==== startCode2:0x2f ====
int far sub_16A7F();
// ==== startCode2:0x42 ====
int readJoyPort();
// ==== startCode2:0x6f ====
int sub_16ABF();
// ==== startCode2:0xdf ====
int far copyJoystickData();
extern uint8 crt0_start[];
extern int16 crt0_16B52;
extern uint8 byte_16B54[];
extern uint8 unk_16B56;
extern uint8 unk_16B57;
extern uint8 aMsRunTimeLibra[];
extern uint8 unk_16B90;
extern uint8 crt0_end;
extern uint8 aLabs_pic[];
extern uint8 aAdv_pic[];
extern uint8 aEgraphic_exe[];
extern uint8 aTitle640_pic[];
extern uint8 aTitle16_pic[];
extern uint8 aF15_spr[];
extern char aF15_spr_0[];
extern uint8 aTemp_wld[];
extern uint8 asc_16BE2[];
extern uint8 unk_16BF0[];
extern char *bufPtr;
extern uint8 unk_16C10[];
extern uint8 aLibya[];
extern uint8 aPersianGulf[];
extern uint8 aVietnam[];
extern uint8 aMiddleEast[];
extern uint8 aOtherAreas[];
extern uint8 aAcrossTheLineO[];
extern uint8 aKeepingTheSeaL[];
extern uint8 aAmericaSLonges[];
extern uint8 aEaglesVsMigs[];
extern uint8 aInsertYourScen[];
extern uint8 aRookie[];
extern uint8 aPilot[];
extern uint8 aVeteran[];
extern uint8 aAce[];
extern uint8 aDemo[];
extern uint8 aGetOffToAGoodS[];
extern uint8 aForTheCasualPl[];
extern uint8 aForMoreSerious[];
extern uint8 aTheUltimateCha[];
extern uint8 aLetSSeeWhatThi[];
extern uint8 aNc[];
extern uint8 aCe[];
extern uint8 aJp[];
extern uint8 aNa[];
extern uint8 aNorthCape[];
extern uint8 aCentralEurope[];
extern uint8 aDesertStorm[];
extern uint8 aNorthAtlantic[];
extern uint8 aOtherAreas_0[];
extern uint8 aIntoTheSovietS[];
extern uint8 aRedStormRaging[];
extern uint8 aTheFightForKuw[];
extern uint8 aDefendingTheIc[];
extern uint8 aSelectABuiltIn[];
extern uint8 aHistoricalMiss[];
extern uint8 aGeneralAirStri[];
extern uint8 asc_16E46[];
extern uint8 aReenactHistory[];
extern uint8 aTheCoreOfTheAi[];
extern uint8 asc_16E76[];
extern uint8 aSaddamSEyes[];
extern uint8 aCommandAndCont[];
extern uint8 aScudBusting[];
extern uint8 aNoNukes[];
extern uint8 aMoreHistorical[];
extern uint8 aIraqSEarlyWarn[];
extern uint8 aIraqiDefenseNe[];
extern uint8 aStopSaddamSTer[];
extern uint8 aNuclearResearc[];
extern uint8 unk_16F36;
extern uint8 aBabyMilkFactory[];
extern uint8 aStopTheSpill[];
extern uint8 aBridgesToNowhe[];
extern uint8 aRepublicanGuar[];
extern uint8 aMoreHistoric_0[];
extern uint8 aChemicalBiolog[];
extern uint8 aSeverTheOilPum[];
extern uint8 aSaddamSEliteAr[];
extern uint8 aCutTheSupplyLi[];
extern uint8 asc_1700B;
extern uint8 aMission[];
extern uint8 placeholder_3d3[];
extern uint8 aWall_pic[];
extern uint8 aDifficulty[];
extern uint8 aTheater[];
extern uint8 aRb_1[];
extern char aNoScenarioFile[];
extern char aSeeTechnicalSu[];
extern uint8 aTheater_0[];
extern uint8 aMissionType[];
extern int16 page1Num;
extern int16 drawColor;
extern int16 fontIndex;
extern int *page1NumPtr;
extern int16 page2Num;
extern uint8 unk_1709A[];
extern int *page2NumPtr;
extern uint8 unk_170B0[];
extern uint8 unk_170B2[];
extern uint8 unk_170C0[];
extern char *missTheaNames[];
extern char *missTheaDesc[];
extern char *missDiffLevels[];
extern char *missDiffDesc[];
extern char *scenarioCodePtr[];
extern char *missScenarioNames[];
extern char *missScenarioDesc[];
extern char *missTypeNames[];
extern int16 off_1710E;
extern int16 off_17110;
extern char *missTypeDesc[];
extern int16 off_1711E;
extern char *missHistorical1Names[];
extern char *missHistorical1Desc[];
extern int16 off_17132;
extern char *missHistorical2Names[];
extern char *missHistorical2Desc[];
extern int16 off_17142;
extern char *missionStr;
extern int16 word_1714A[];
extern int16 word_1715A[];
extern int16 word_1716A[];
extern int16 word_1717A[];
extern int16 word_1718A[];
extern int16 word_1719A[];
extern int16 enableHighlight;
extern char *plh3d3Ptr;
extern int16 missionPick;
extern int16 word_171B2[];
extern char aRepeatLastMiss[];
extern uint8 aRb_2[];
extern uint8 aF15_spr_1[];
extern char aPleaseReinsert[];
extern char aPressSelectorW[];
extern char aDecodingMissio[];
extern char aTodaySMission[];
extern char aTakeoffFrom[];
extern char aOnc_2[];
extern char aPrimaryTarget[];
extern char aOnc_0[];
extern char aSecondaryTarge[];
extern char aOnc_1[];
extern int16 word_17282;
extern int16 word_17284;
extern int16 word_17286;
extern int16 word_17288;
extern int16 word_1728A;
extern int16 word_1728C;
extern int16 word_1728E;
extern int16 word_17290;
extern int16 word_17292;
extern uint8 byte_1729C[];
extern uint8 byte_172A2;
extern uint8 timerHandlerInstalled;
extern int16 word_172A4;
extern int16 word_172A6;
extern int16 word_172A8;
extern int16 word_172AA;
extern int16 word_172AC;
extern int16 word_172AE;
extern uint8 byte_172B0;
extern int16 word_172B1;
extern int16 word_172B3;
extern int16 word_172B5;
extern uint8 byte_172B7;
extern int16 word_172B8;
extern int16 word_172BA;
extern uint8 timerCounter;
extern uint8 timerCounter2;
extern uint8 timerCounter3;
extern uint8 timerCounter4[];
extern uint8 unk_172C5;
extern uint8 byte_172C6[];
extern uint8 unk_172CA[];
extern uint8 searchFCB[];
extern uint8 diskTransferArea[];
extern int16 word_1737E;
extern uint8 a2ndLt_[];
extern uint8 a1stLt_[];
extern uint8 aCapt_[];
extern uint8 aMajor[];
extern uint8 aLtCol_[];
extern uint8 aColonel[];
extern uint8 aGen_[];
extern char aArmpiece_pic[];
extern uint8 aHiscore_pic[];
extern uint8 pilotSelectFlag;
extern uint8 unk_173D2;
extern uint8 unk_173D3[];
extern int16 word_173D6;
extern uint8 unk_173DC[];
extern int16 word_173DE;
extern int *screenBuf;
extern uint8 unk_173EA[];
extern int *pageNumPtr;
extern char *ranks[];
extern unsigned __int8 byte_17412[];
extern unsigned __int8 byte_1741A[];
extern unsigned __int8 byte_17422[];
extern char aOriginalDiskIn[];
extern char aPressAKeyToCon[];
extern char aUseSelectorToC[];
extern char asc_174AC[];
extern char asc_174AF[];
extern int word_174B2[];
extern int16 word_174B6;
extern char aMenterYourName[];
extern int pilotNameInputColors[];
extern uint8 aRb_3[];
extern uint8 aHallfame[];
extern uint8 aWb[];
extern uint8 aHallfame_0[];
extern int16 ovlSeg1;
extern int16 ovlParCnt;
extern int16 ovlParBlock;
extern int16 ovlSeg2;
extern uint8 ovlInsaneFlag;
extern uint8 aAlloc1M[];
extern uint8 aDosLied[];
extern uint8 aFileNFound[];
extern uint8 aEnoughMem[];
extern uint8 aOvlFail[];
extern uint8 aOvlOvrrun[];
extern uint8 aOvlShrink[];
extern uint8 aOvlRel[];
extern uint8 jmp_gfx_slot_0_alloc[];
extern uint8 jmp_gfx_slot_01[];
extern uint8 jmp_gfx_slot_02[];
extern uint8 jmp_gfx_slot_03[];
extern uint8 jmp_gfx_slot_04[];
extern uint8 jmp_gfx_slot_05_t04[];
extern uint8 jmp_gfx_slot_06[];
extern uint8 jmp_gfx_slot_07[];
extern uint8 jmp_gfx_slot_08[];
extern uint8 jmp_gfx_slot_09[];
extern uint8 jmp_gfx_slot_0a[];
extern uint8 jmp_gfx_slot_0b[];
extern uint8 jmp_gfx_slot_0c[];
extern uint8 jmp_gfx_slot_0d_setCurBuf[];
extern uint8 jmp_gfx_slot_0e_setCurBuf[];
extern uint8 jmp_gfx_slot_0f_getButPtr[];
extern uint8 jmp_gfx_slot_10_getCurBuf[];
extern uint8 jmp_gfx_slot_11[];
extern uint8 jmp_gfx_slot_12[];
extern uint8 jmp_gfx_slot_13[];
extern uint8 jmp_gfx_slot_14[];
extern uint8 jmp_gfx_slot_15[];
extern uint8 jmp_gfx_slot_15[];
extern uint8 jmp_gfx_slot_17[];
extern uint8 jmp_gfx_slot_18[];
extern uint8 jmp_gfx_slot_18[];
extern uint8 jmp_gfx_slot_1a[];
extern uint8 jmp_gfx_slot_1b[];
extern uint8 jmp_gfx_slot_1c[];
extern uint8 jmp_gfx_slot_1d[];
extern uint8 jmp_gfx_slot_1e[];
extern uint8 jmp_gfx_slot_1f[];
extern uint8 jmp_gfx_slot_20_setVal[];
extern uint8 jmp_gfx_slot_21[];
extern uint8 jmp_gfx_slot_22_nullsub[];
extern uint8 jmp_gfx_slot_22_nullsub[];
extern uint8 jmp_gfx_slot_24[];
extern uint8 jmp_gfx_slot_25[];
extern uint8 jmp_gfx_slot_26[];
extern uint8 jmp_gfx_slot_27[];
extern uint8 jmp_gfx_slot_25[];
extern uint8 jmp_gfx_slot_29_fillRect[];
extern uint8 jmp_gfx_slot_2a[];
extern uint8 jmp_gfx_slot_2b[];
extern uint8 jmp_gfx_slot_2c_blitPage1[];
extern uint8 jmp_gfx_slot_2d[];
extern uint8 jmp_gfx_slot_2e[];
extern uint8 jmp_gfx_slot_2f[];
extern uint8 jmp_gfx_slot_30_blitToCurrent[];
extern uint8 jmp_gfx_slot_31[];
extern uint8 jmp_gfx_slot_32[];
extern uint8 jmp_gfx_slot_33_memcpyRow[];
extern uint8 jmp_gfx_slot_33_memcpyRow[];
extern uint8 jmp_gfx_slot_35_null[];
extern uint8 jmp_gfx_slot_36_null[];
extern uint8 jmp_gfx_slot_37_null[];
extern uint8 jmp_gfx_slot_38_getBuf[];
extern uint8 jmp_gfx_slot_39[];
extern uint8 jmp_gfx_slot_3a_getRowOffset[];
extern uint8 jmp_gfx_slot_3b_clearBuf[];
extern uint8 jmp_gfx_slot_3c_setMode13[];
extern uint8 jmp_gfx_slot_3d_null[];
extern uint8 jmp_gfx_slot_3e[];
extern uint8 jmp_gfx_slot_3f_ax3[];
extern uint8 jmp_gfx_slot_40[];
extern uint8 jmp_gfx_slot_41[];
extern uint8 jmp_gfx_slot_42[];
extern uint8 jmp_gfx_slot_43[];
extern uint8 jmp_gfx_slot_44_setDac[];
extern uint8 jmp_gfx_slot_45_retrace[];
extern uint8 jmp_gfx_slot_46_retrace2[];
extern uint8 jmp_gfx_slot_13[];
extern uint8 jmp_gfx_slot_14[];
extern uint8 jmp_gfx_slot_11[];
extern uint8 jmp_gfx_slot_12[];
extern uint8 jmp_gfx_slot_4b_storeBufPtr[];
extern uint8 jmp_gfx_slot_4c[];
extern uint8 jmp_gfx_slot_4d[];
extern uint8 jmp_gfx_slot_4e_getVal[];
extern uint8 jmp_gfx_slot_4f[];
extern uint8 jmp_gfx_slot_50_null[];
extern uint8 jmp_gfx_slot_51_null[];
extern uint8 jmp_gfx_slot_52[];
extern uint8 jmp_gfx_slot_52_null[];
extern uint8 jmp_misc_5a_checkKeyBuf[];
extern uint8 jmp_misc_5b_getKey[];
extern uint8 jmp_misc_5c_dosGetKey[];
extern uint8 jmp_misc_5d_readJoy[];
extern uint8 jmp_misc_5e_5f_clearKeyFlags[];
extern uint8 jmp_misc_5e_5f_clearKeyFlags[];
extern uint8 unk_177EC[];
extern uint8 unk_177F6[];
extern uint8 jmp_0[];
extern uint8 jmp_0[];
extern uint8 jmp_0[];
extern uint8 jmp_0[];
extern uint8 unk_17810[];
extern uint8 unk_17812;
extern uint8 unk_17813;
extern uint8 unk_17814;
extern uint8 unk_17815;
extern uint8 unk_17816[];
extern uint8 jmp_0[];
extern uint8 jmp_0[];
extern int16 word_1782E;
extern int16 word_17836;
extern int16 word_1783E;
extern int16 word_17846;
extern int16 word_1784E;
extern int16 word_17856;
extern int16 word_17858;
extern unsigned __int8 noJoy80[];
extern int16 word_17866;
extern int16 word_17868;
extern int16 word_1786A;
extern int16 word_1786C;
extern int16 word_1786F;
extern int16 word_17871;
extern int16 word_17873;
extern int16 word_17875;
extern uint8 byte_17877[];
extern uint8 byte_179D9[];
extern uint8 byte_17A2F[];
extern uint8 byte_17AD9[];
extern uint8 unk_17B04[];
extern uint8 byte_17B06[];
extern int16 word_17BE7;
extern int16 word_17BE9;
extern int16 word_17BEB;
extern int16 word_17BED;
extern uint8 byte_17BF0;
extern int16 word_17BF1;
extern int16 word_17BF3;
extern int16 word_17BF5;
extern int16 word_17BF7;
extern int16 word_17BF9;
extern int16 word_17BFB;
extern uint8 cbreakHit;
extern int16 origCBreakSeg;
extern int16 origCBreakOfs;
extern int16 errorCodeStr;
extern uint8 fileReadBuf[];
extern uint8 byte_17D06[];
extern uint8 byte_17D16[];
extern uint8 byte_17D31[];
extern uint8 byte_17D51[];
extern uint8 byte_17D72[];
extern uint8 aFileNotFound[];
extern uint8 aNoFileBuffersAvailable[];
extern uint8 aOpenError[];
extern uint8 aFileClosingError[];
extern uint8 aReadError[];
extern uint8 aWriteError[];
extern int16 word_17E68;
extern int16 word_17E6A;
extern int16 fileReadPos;
extern int16 tmpFileHandle;
extern uint8 picDecodedRowBuf[];
extern int16 screenBufSize;
extern int16 tmpPageIndex;
extern int16 rowOffset;
extern int16 row;
extern int16 readFromFilePtr;
extern uint8 aInsufficientSy[];
extern uint8 aBufferDeallocE[];
extern int word_17FFE[];
extern int word_18010[];
extern int word_18026[];
extern int16 terrainSignature;
extern unsigned int terrainBuf1[];
extern struct TerrainUnk terrainBuf2[];
extern int16 gridSignature;
extern int16 word_18186;
extern int16 word_18188;
extern char a_3dt[];
extern uint8 aRb[];
extern char aOpenErrorOn_3d[];
extern char aBadTileFileFor[];
extern uint8 aTooManyTiles_[];
extern uint8 aTooMuchTileDat[];
extern char a_3dg[];
extern uint8 aRb_0[];
extern char aOpenErrorOn__0[];
extern char aBadGridFileFor[];
extern uint8 aRegn_xxx[];
extern uint8 aLb_xxx[];
extern uint8 aPg_xxx[];
extern uint8 aVn_xxx[];
extern uint8 aMe_xxx[];
extern uint8 aNc_xxx[];
extern uint8 aCe_xxx[];
extern uint8 aJp_xxx[];
extern uint8 aNa_xxx[];
extern uint8 aLibya_wld[];
extern uint8 aGulf_wld[];
extern uint8 aVn_wld[];
extern uint8 aMe_wld[];
extern uint8 aNc_wld[];
extern uint8 aCe_wld[];
extern uint8 aJp_wld[];
extern uint8 aNa_wld[];
extern int16 word_182BA;
extern int16 word_182BC;
extern unsigned int word_182BE;
extern unsigned int word_182C0;
extern int16 word_182C2;
extern int16 word_182C4;
extern int16 word_182C6;
extern int16 word_182C8;
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
extern uint8 aC[];
extern uint8 aSaN6[];
extern uint8 aSaN7[];
extern uint8 aHawk[];
extern uint8 aRapier[];
extern uint8 aK[];
extern uint8 aTiger[];
extern uint8 aSeacat[];
extern uint8 aIl76[];
extern struct Plane planes[];
extern uint8 aNone_0[];
extern uint8 aSa2_0[];
extern uint8 aSa5_0[];
extern uint8 aC_0[];
extern uint8 aSa8b_0[];
extern uint8 aSa10_0[];
extern uint8 unk_186C0[];
extern uint8 unk_186C6[];
extern uint8 aSa11_0[];
extern uint8 aSa12_0[];
extern uint8 aSa13_0[];
extern uint8 aSaN4_0[];
extern uint8 aSaN5_0[];
extern uint8 aSaN6_0[];
extern uint8 aSaN7_0[];
extern uint8 aHawk_0[];
extern uint8 aRapier_0[];
extern uint8 aTiger_1[];
extern uint8 aSeacat_0[];
extern uint8 aAa2[];
extern uint8 aAa8[];
extern uint8 aAa6[];
extern uint8 a2_0[];
extern uint8 aAa7[];
extern uint8 aAa9[];
extern uint8 aR[];
extern uint8 aAa10[];
extern uint8 aAim120[];
extern uint8 aAim9[];
extern uint8 aHarm[];
extern uint8 aPenguin[];
extern uint8 aHarpoon[];
extern uint8 aAgm65[];
extern uint8 aLgbomb[];
extern uint8 aRtbomb[];
extern uint8 aFfbomb[];
extern uint8 aAim7w[];
extern uint8 aAim9w[];
extern uint8 aSa14[];
extern uint8 aAa6_0[];
extern uint8 a2_1[];
extern uint8 aAa7_0[];
extern uint8 aAa9_0[];
extern uint8 aR_0[];
extern uint8 aAa10_0[];
extern uint8 aEquip_[];
extern struct struc_10 stru_1892E[];
extern int difficultySaved;
extern int16 word_18994;
extern uint8 aAim9m[];
extern uint8 aSidewinder[];
extern int word_189B6[];
extern uint8 aAim120_0[];
extern uint8 aAmraam[];
extern uint8 aAgm88a[];
extern uint8 aHarm_0[];
extern uint8 aAim7m[];
extern uint8 aSparrow[];
extern uint8 aAgm86a[];
extern uint8 aHarpoon_0[];
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
extern struct struc_9 stru_18FC0[];
extern char *regnPlhPtr;
extern char *plhFiles[];
extern int16 off_19262[];
extern char *worldFiles[];
extern uint8 unk_19284[];
extern uint8 unk_19288[];
extern uint8 unk_1928C[];
extern uint8 unk_19290[];
extern int16 word_19294[];
extern int16 word_192A4[];
extern uint8 asc_192B4[];
extern uint8 unk_192BC[];
extern uint8 unk_192C4[];
extern uint8 unk_192C6[];
extern uint8 asc_192C8[];
extern uint8 asc_192CE[];
extern uint8 unk_192D4[];
extern uint8 unk_192DA[];
extern uint8 unk_192E0[];
extern uint8 unk_192E6[];
extern int16 word_192EC[];
extern int16 word_192F4[];
extern uint8 byte_192FC[];
extern int *off_19304[];
extern int *off_19314[];
extern int16 word_19324[];
extern uint8 aPowCamp[];
extern uint8 aRb_4[];
extern uint8 aWb_0[];
extern uint8 aTd00[];
extern uint8 aJz00[];
extern uint8 aXv00[];
extern uint8 aEs00[];
extern uint8 aWx00[];
extern uint8 aCc00[];
extern uint8 aHz00[];
extern uint8 aAt[];
extern int16 LIBC_DATA_START;
extern int16 word_19370;
extern int16 off_19372;
extern int16 word_19374;
extern int16 word_193C4;
extern uint8 aC_file_info[];
extern uint32 dword_193D3;
extern int16 word_193DF;
extern int16 word_193E1;
extern int16 word_193E5;
extern int16 word_193E7;
extern uint8 byte_193EA[];
extern int16 word_193EC;
extern int16 word_19402;
extern int16 word_19404;
extern int16 word_19406;
extern uint8 byte_19410;
extern uint8 byte_19411;
extern uint32 dword_19412;
extern int16 word_1941A;
extern int16 word_1941C;
extern int16 word_1941E;
extern int16 word_19420;
extern int16 __iob;
extern uint8 __iob2[];
extern int16 word_1954E;
extern int16 word_19550;
extern int16 word_19552;
extern int16 word_19554;
extern int16 word_19558;
extern int16 word_1955C;
extern uint8 byte_1955F;
extern int16 word_19560;
extern int16 word_19564;
extern int16 word_19566;
extern uint8 byte_1956A[];
extern uint8 unk_1956E[];
extern int16 word_19570;
extern uint32 dword_19572;
extern uint32 dword_19576;
extern uint8 aR6000StackOverflow[];
extern uint8 aR6003IntegerDivideBy0[];
extern uint8 aR6009NotEnoughSpaceForEn[];
extern uint8 aRunTimeError[];
extern uint8 aR6002FloatingPointNotLoa[];
extern uint8 aR6001NullPointerAssignme[];
extern uint8 LIBC_DATA_END[];
extern int word_19656;
extern int word_19658;
extern int word_1965A;
extern int word_1965C;
extern int word_1965E;
extern int16 readBufEndPtr;
extern int16 picWorkDataPtr;
extern int16 picRowLength;
extern uint8 picProcessFlag0_1;
extern uint8 picLookupResult;
extern uint8 picTmp9BitCount;
extern uint8 picByte;
extern int16 picFileReadBufEnd;
extern int16 picNumberDictSlots;
extern int16 picFileWord;
extern uint8 picRemainingBitCount;
extern uint8 picByteUnsignedFlag;
extern int16 picSlotCounter;
extern uint8 dictionaryIndex[];
extern uint8 unk_19775[];
extern uint8 unk_19778[];
extern uint8 byte_1977A[];
extern uint8 picWorkData[];
extern int16 picDecodeDictionary;
extern uint8 picDecodeIncrement[];
extern uint8 byte_19A3C[];
extern uint8 byte_19ADB[];
extern uint8 byte_19B3C[];
extern uint8 byte_19CBC[];
extern uint8 byte_19DBC[];
extern uint8 byte_1B078;
extern uint8 byte_1B079;
extern int16 word_1B07A;
extern int16 word_1B07C;
extern uint8 byte_1B07E;
extern uint8 byte_1B07F[];
extern int16 word_1B0C0;
extern int16 word_1B0C2;
extern int16 word_1B0C4;
extern uint8 byte_1B0C6[];
extern int16 flag4Saved;
extern int16 theaterSaved;
extern unsigned __int8 far *moveDst;
extern uint8 bufCoordStr;
extern uint8 byte_1B0D1;
extern uint8 byte_1B0D2;
extern uint8 byte_1B0D3[];
extern uint8 CRT0_BSS_START[];
extern uint8 CRT0_BSS_END[];
extern char todayMissStrBuf[];
extern uint8 byte_1B0FF;
extern uint8 byte_1B100[];
extern int16 word_1B148;
extern int far *iacaSuFlag0Ptr;
extern FILE *fileHandle;
extern struct Game far *gameData;
extern int16 wldReadBuf2;
extern uint8 byte_1B15A[];
extern uint8 gridBuf5[];
extern uint8 gridBuf4[];
extern int16 page1Ptr;
extern uint8 libc_bufout[];
extern uint8 gridBuf3[];
extern int *word_1B960;
extern uint8 gridBuf2[];
extern uint8 terrainBuf3[];
extern uint8 terrainBuf4[];
extern uint8 terrainBuf5[];
extern unsigned __int8 terrainIdxBuf[];
extern unsigned __int8 wldReadBuf1[];
extern unsigned __int8 gridBuf1[];
extern char scenarioFoundArr[];
extern uint8 byte_1C822;
extern uint8 byte_1C823;
extern uint8 byte_1C824;
extern uint8 byte_1C825;
extern uint8 byte_1C826[];
extern struct Buf4Item wldReadBuf4[];
extern char wldReadBuf10[256];
extern int far *needSplash;
extern struct Target targets[];
extern struct Target target2;
extern int word_1D00A;
extern struct Buf6Item wldReadBuf6[];
extern uint8 hercFlag;
extern uint8 byte_1D2DD[];
extern uint8 libc_bufin[];
extern uint32 dword_1D5D0;
extern int16 word_1D5D4;
extern int16 word_1D5D6;
extern uint32 dword_1D5D8;
extern uint32 dword_1D5DC;
extern int16 word_1D5E0;
extern uint8 byte_1D5E2;
extern uint8 byte_1D5E3;
extern uint8 byte_1D5E4;
extern uint8 byte_1D5E5[];
extern uint8 exitCode[];
extern char wldReadBuf9[];
extern uint32 dword_1D650;
extern uint8 byte_1D654[];
extern uint8 byte_1DBC6[];
extern uint8 byte_1DC3C[];
extern int readItemSize;
extern uint8 wldReadBuf8[];
extern uint8 intRegs[];
extern uint8 unk_1DCD2[];
extern uint8 wldReadBuf7[];
extern int16 word_1DD38;
extern int hallfameCount;
extern int wldReadBuf5Size;
extern uint8 joyDone[];
extern char *wldOffsets[];
extern uint8 wldReadBuf11[];
extern struct TerrainUnk terrainPtrUnk[];
extern int16 word_1E24A;
extern uint8 byte_1E24C[];
extern unsigned int wldReadBuf3;
extern struct GameComm far *commData;
extern struct Pilot hallfameBuf[];
extern uint8 libc_buferr[];
extern unsigned int menuSprites;
#endif // F15_SE2_START
