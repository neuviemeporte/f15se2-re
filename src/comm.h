#ifndef COMM_H
#define COMM_H

#include "const.h"
#include "inttype.h"

/* the communication structure used for exchanging data between the parts of the game has 320 paragraphs, 5120 bytes, 0x1400 */
#define COMM_SIZE_PARA 0x140
#define COMM_MCB_OFFSET_MAGIC1 0xc /* magic values written into COMM's MCB by f15.com, later checked by egame.exe */
#define COMM_MCB_OFFSET_MAGIC2 0xe
#define COMM_MCB_VALUE_MAGIC1 0xca01
#define COMM_MCB_VALUE_MAGIC2 0x3b9a

#pragma pack(1)
struct GameComm {
    char gfxOvlName[FILENAME_LENGTH];
    char sndOvlName[FILENAME_LENGTH];
    uint16 gfxOvlAddr; 
    uint16 sndOvlAddr;
    uint16 miscOvlAddr;
    int16 gfxInitResult;
    int16 setup1;
    int16 setupMono;
    int16 setupDone;
    int16 unk2;
    int16 setup2;
    int16 unk3;
    int16 unk4;
    int16 gfxModeChar;
    int16 setupDetail;
    uint8 pad0[4];
    uint16 unk7[4];
    // int16 unk5;
    // int16 unk6;
    // uint8 pad4[2];
    int16 unk8[4];
//    uint8 pad1[6];
    uint8 joyData[0x14];
    uint8 pad2[0x14];
    int16 setupT;
    int16 setupUseJoy;
    uint8 pad3[4];
    uint16 gfxModeNum;
    uint16 worlBuf;
};

#define COMM_GFXOVL_NAME_OFFSET 0x0
#define COMM_SNDOVL_NAME_OFFSET 0xd
#define COMM_GFXOVL_ADDR_OFFSET 0x1a
#define COMM_SNDOVL_ADDR_OFFSET 0x1c
#define COMM_MISCOVL_ADDR_OFFSET 0x1e
#define COMM_GFXINIT_RESULT_OFFSET 0x20
#define COMM_SETUP1_OFFSET 0x22 /* unknown purpose  */
#define COMM_SETUP_MONOCHROME_OFFSET 0x24 /* set to 1 when hercules? */
#define COMM_SETUP_DONE_OFFSET 0x26 /* set to 1 before SU exits */
#define COMM_UNK2_OFFSET 0x28 /* set to 0 in start after f15.spr */
#define COMM_SETUP2_OFFSET 0x2a /* unknown purpose */
#define COMM_UNK3_OFFSET 0x2c /* set to 0 in start after f15.spr */
#define COMM_SETUP_GFXMODE_OFFSET 0x30 /* letter of the gfx driver, e.g. 'M' for Mgraphic.exe */
#define COMM_SETUP_DETAIL_OFFSET 0x32 /* 3 == max, default 0xffff */
#define COMM_UNK7_OFFSET 0x38 /* set to 0 in mission generator */
#define COMM_UNK5_OFFSET 0x3a /* set to 1 in mission generator */
#define COMM_UNK6_OFFSET 0x3c /* set to 5 in mission generator */
#define COMM_UNK8_OFFSET 0x40 /* set to 5 in mission generator */
#define COMM_SETUP_JOYDATA_OFFSET 0x48 /* 0x14 bytes worth of some joystick-related data put here in su.exe */
#define COMM_SETUP_SWITCHT_OFFSET 0x70 /* when /T on cmdline present */
#define COMM_SETUP_USEJOY_OFFSET 0x72
#define COMM_GFXMODENUM_OFFSET 0x78 /* looks like numeric code for video driver from function 3f, mcga returns 3 */
#define COMM_WORLDBUF_OFFSET 0x7a

/* the communication structure contains a buffer at offset 0x120, whose contents seem to have some different purpose than config values */
#define COMM_BUFFER_OFFSET 0x120
#define COMM_GAMEDATA_OFFSET 0x120e 

#pragma pack(1)
struct Game {
    uint16 pilotIdx;
    char pilotName[0x16];
    uint8 pad1[0x8];
    uint16 unk2; // score? (dword)
    uint16 unk3;
    uint8 pad5[0xa];
    uint16 lastScore;
    int16 flag2;
    int32 totalScore;
    uint8 pad2[2];
    uint16 theater;
    int16 flag4;
    uint16 flag3;
    int16 difficulty;
    uint16 unk4; // checked in egame
    int16 rand;
    int16 unk1; // desk job?
    uint8 pad4[8];
    int16 flag1;
};

#define GAME_PILOTIDX_OFFSET 0x0
#define GAME_PILOTNAME_OFFSET 0x2
#define GAME_UNK2_OFFSET 0x20 // probably something to do with rank or medals
#define GAME_UNK3_OFFSET 0x22 // ditto
#define GAME_LASTSCORE_OFFSET 0x2e
#define GAME_START_FLAG2_OFFSET 0x30
#define GAME_TOTALSCORE_OFFSET 0x32
#define GAME_START_THEATER 0x38
#define GAME_FLAG4_OFFSET 0x3a
#define GAME_FLAG3_OFFSET 0x3c
#define GAME_START_DIFFICULTY 0x3e
#define GAME_UNK4_OFFSET 0x40
#define GAME_RAND_OFFSET 0x42
#define GAME_RAND_OFFSET 0x42
#define GAME_UNK1_OFFSET 0x44
#define GAME_START_FLAG1_OFFSET 0x4e

#endif /* COMM_H */ 
