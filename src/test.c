#include <stdio.h>
#include <stdarg.h>

#include "comm.h"
#include "pointers.h"
#include "struct.h"
#include "debug.h"

void my_assert(int arg, int lineno, const char *msg, ...) {
    va_list arg_ptr;

    if (!arg) {
        va_start(arg_ptr, msg);
        printf("\nAssertion failed on line %d: ", lineno);
        vprintf(msg, arg_ptr);
        va_end(arg_ptr);
        exit(1);
    }
}

#define ASSERT_EQ(a, b) my_assert(a == b, __LINE__, #a " == " #b " (%d != %d)\n", a, b)

void testComm() {
    printf("Testing Comm structure layout: ");
    ASSERT_EQ(offsetof(struct GameComm, gfxOvlName), COMM_GFXOVL_NAME_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, sndOvlName), COMM_SNDOVL_NAME_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, gfxOvlAddr), COMM_GFXOVL_ADDR_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, sndOvlAddr), COMM_SNDOVL_ADDR_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, miscOvlAddr), COMM_MISCOVL_ADDR_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, gfxInitResult), COMM_GFXINIT_RESULT_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, startDone), COMM_STARTDONE_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, setupMono), COMM_SETUP_MONOCHROME_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, setupDone), COMM_SETUP_DONE_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, continueFlag), COMM_CONTINUEFLAG_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, setup2), COMM_SETUP2_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, restartFlag), COMM_RESTARTFLAG_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, gfxModeChar), COMM_SETUP_GFXMODE_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, setupDetail), COMM_SETUP_DETAIL_OFFSET);

    ASSERT_EQ(offsetof(struct GameComm, weaponType), COMM_WEAPONTYPE_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, weaponCount), COMM_WEAPONCOUNT_OFFSET);

    ASSERT_EQ(offsetof(struct GameComm, joyData), COMM_SETUP_JOYDATA_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, setupT), COMM_SETUP_SWITCHT_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, setupUseJoy), COMM_SETUP_USEJOY_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, gfxModeNum), COMM_GFXMODENUM_OFFSET);
    printf("OK\n");
}

void testGame() {
    printf("Testing Game structure layout: ");
    ASSERT_EQ(offsetof(struct Game, pilotIdx), GAME_PILOTIDX_OFFSET);
    ASSERT_EQ(offsetof(struct Game, pilotName), GAME_PILOTNAME_OFFSET);
    ASSERT_EQ(offsetof(struct Game, rank), GAME_RANK_OFFSET);
    ASSERT_EQ(offsetof(struct Game, medals), GAME_MEDALS_OFFSET);
    ASSERT_EQ(offsetof(struct Game, lastScore), GAME_LASTSCORE_OFFSET);
    ASSERT_EQ(offsetof(struct Game, rankHigh), GAME_RANK_HIGH_OFFSET);
    ASSERT_EQ(offsetof(struct Game, totalScore), GAME_TOTALSCORE_OFFSET);
    ASSERT_EQ(offsetof(struct Game, theater), GAME_START_THEATER);
    ASSERT_EQ(offsetof(struct Game, isCampaignMission), GAME_IS_CAMPAIGN_MISSION_OFFSET);
    ASSERT_EQ(offsetof(struct Game, missionReady), GAME_MISSION_READY_OFFSET);
    ASSERT_EQ(offsetof(struct Game, difficulty), GAME_START_DIFFICULTY);
    ASSERT_EQ(offsetof(struct Game, rand), GAME_RAND_OFFSET);
    ASSERT_EQ(offsetof(struct Game, hallOfFameEligible), GAME_HOF_ELIGIBLE_OFFSET);
    ASSERT_EQ(offsetof(struct Game, campaignProgress), GAME_CAMPAIGN_PROGRESS_OFFSET);
    printf("OK\n");
}

void testStruct() {
    printf("Testing various structs: ");
    ASSERT_EQ(sizeof(struct WorldObject), WORLDOBJECT_SIZE);
    ASSERT_EQ(sizeof(struct FlightUnit), FLIGHTUNIT_SIZE);
    ASSERT_EQ(sizeof(struct Target), TARGETSIZE);
    ASSERT_EQ(sizeof(struct MissionTableEntry), MISSIONTABLEENTRY_SIZE);
    ASSERT_EQ(sizeof(struct UnitTypeRemap), UNITTYPEREMAP_SIZE);
    ASSERT_EQ(sizeof(struct Pilot), HALLFAME_RECORDSZ);
    ASSERT_EQ(sizeof(struct Plane), PLANESIZE);
    ASSERT_EQ(sizeof(struct TerrainPtrTable), TERRAINUNKSIZE);
    printf("OK\n");
}

void testTrace() {
    const char *str = "Foobar a = %d, b = %d, c = %d";
    int a=1,b=2,c=3;
    printf("Testing trace functions: ");
    my_trace(str, a, b, c);
    my_fartrace((const char FAR*)str, a, b, c);
    printf("OK\n");
}

int main() {
    printf("Running F15 SE2 unit test application\n");
    testComm();
    testGame();
    testStruct();
    testTrace();
    return 0;
}