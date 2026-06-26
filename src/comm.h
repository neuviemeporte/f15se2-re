#ifndef COMM_H
#define COMM_H

#include "const.h"
#include "inttype.h"
#include "sassert.h"

/* the communication structure used for exchanging data between the parts of the game has 320 paragraphs, 5120 bytes, 0x1400 */
#define COMM_SIZE_PARA 320
#define COMM_MCB_OFFSET_MAGIC1 0xc /* magic values written into COMM's MCB by f15.com, later checked by egame.exe */
#define COMM_MCB_OFFSET_MAGIC2 0xe
#define COMM_MCB_VALUE_MAGIC 0x3b9aca01
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
    int16 startDone;
    int16 setupMono;
    int16 setupDone;    /* in end.exe: landingType (1=crashed, 2=ejected, 3=landed) */
    int16 continueFlag; /* in end.exe: bailoutSurvived (0=survived) */
    int16 setup2;
    int16 restartFlag;
    int16 unk4;        /* nonzero enables crash exit in egame (set from theater table in start.exe) */
    int16 gfxModeChar; /* in end.exe: trainingFlag (nonzero if training mission) */
    int16 setupDetail;
    uint8 pad0[4];
    uint16 weaponType[4]; /* weapon type indices into weaponLoadouts[] (0=Sidewinder,1=AMRAAM,etc) */
    int16 weaponCount[4]; /* weapon quantities per slot */
    uint8 joyData[20];
    uint8 pad2[20];
    int16 setupT;
    int16 setupUseJoy;
    uint16 worldX;
    uint16 worldY;
    uint16 gfxModeNum;
    uint16 worldBuf;
};
#pragma pack()
STATIC_ASSERT(sizeof(struct GameComm) == 124);

/* end.exe debrief aliases: same struct fields, different semantics after egame writes results */
#define landingType setupDone
#define bailoutSurvived continueFlag
#define trainingFlag gfxModeChar

#define COMM_GFXOVL_NAME_OFFSET 0x0
#define COMM_SNDOVL_NAME_OFFSET 0xd
#define COMM_GFXOVL_ADDR_OFFSET 0x1a
#define COMM_SNDOVL_ADDR_OFFSET 0x1c
#define COMM_MISCOVL_ADDR_OFFSET 0x1e
#define COMM_GFXINIT_RESULT_OFFSET 0x20
#define COMM_STARTDONE_OFFSET 0x22        /* set to 1 when start module finishes pilot/mission selection */
#define COMM_SETUP_MONOCHROME_OFFSET 0x24 /* set to 1 when hercules? */
#define COMM_SETUP_DONE_OFFSET 0x26       /* set to 1 before SU exits; in end.exe: landing type (1=crashed, 2=ejected, 3=landed) */
#define COMM_CONTINUEFLAG_OFFSET 0x28     /* set to 0 in start after f15.spr; in end.exe: bailout survival (0=survived) */
#define COMM_SETUP2_OFFSET 0x2a           /* unknown purpose */
#define COMM_RESTARTFLAG_OFFSET 0x2c      /* set to 0 in start after f15.spr */
#define COMM_SETUP_GFXMODE_OFFSET 0x30    /* letter of the gfx driver, e.g. 'M' for Mgraphic.exe; in end.exe: training mission flag */
#define COMM_SETUP_DETAIL_OFFSET 0x32     /* 3 == max, default 0xffff */
#define COMM_WEAPONTYPE_OFFSET 0x38       /* weapon type indices (3 slots used) */
#define COMM_UNK5_OFFSET 0x3a             /* set to 1 in mission generator */
#define COMM_UNK6_OFFSET 0x3c             /* set to 5 in mission generator */
#define COMM_WEAPONCOUNT_OFFSET 0x40      /* weapon quantities (3 slots used) */
#define COMM_SETUP_JOYDATA_OFFSET 0x48    /* 0x14 bytes worth of some joystick-related data put here in su.exe */
#define COMM_SETUP_SWITCHT_OFFSET 0x70    /* when /T on cmdline present */
#define COMM_SETUP_USEJOY_OFFSET 0x72
#define COMM_GFXMODENUM_OFFSET 0x78 /* looks like numeric code for video driver from function 3f, mcga returns 3 */
#define COMM_WORLDBUF_OFFSET 0x7a

/* the communication structure contains a buffer at offset 0x120, whose contents seem to have some different purpose than config values */
#define COMM_BUFFER_OFFSET 0x120
#define COMM_GAMEDATA_OFFSET 0x120e

#pragma pack(1)
struct Game {
    uint16 pilotIdx;
    char pilotName[22];
    uint8 pad1[8];
    uint16 rank;
    uint16 medals;
    uint8 pad5[10];
    uint16 lastScore;
    uint16 rankHigh;
    int32 totalScore;
    uint8 pad2[2];
    uint16 theater;
    int16 isCampaignMission;
    uint16 missionReady;
    int16 difficulty;
    uint16 unk4; // checked in egame
    int16 rand;
    int16 hallOfFameEligible; // desk job?
    uint8 pad4[8];
    int16 campaignProgress;
};
#pragma pack()
STATIC_ASSERT(sizeof(struct Game) == 80);

#define GAME_PILOTIDX_OFFSET 0x0
#define GAME_PILOTNAME_OFFSET 0x2
#define GAME_RANK_OFFSET 0x20
#define GAME_MEDALS_OFFSET 0x22
#define GAME_LASTSCORE_OFFSET 0x2e
#define GAME_RANK_HIGH_OFFSET 0x30
#define GAME_TOTALSCORE_OFFSET 0x32
#define GAME_START_THEATER 0x38
#define GAME_IS_CAMPAIGN_MISSION_OFFSET 0x3a
#define GAME_MISSION_READY_OFFSET 0x3c
#define GAME_START_DIFFICULTY 0x3e
#define GAME_UNK4_OFFSET 0x40
#define GAME_RAND_OFFSET 0x42
#define GAME_RAND_OFFSET 0x42
#define GAME_HOF_ELIGIBLE_OFFSET 0x44
#define GAME_CAMPAIGN_PROGRESS_OFFSET 0x4e

#endif /* COMM_H */
