#include <stdio.h>
#include <stdarg.h>

#include "comm.h"
#include "pointers.h"
#include "struct.h"

void assert(int arg, int lineno, const char *msg, ...) {
    va_list arg_ptr;

    if (!arg) {
        va_start(arg_ptr, msg);
        printf("\nAssertion failed on line %d: ", lineno);
        vprintf(msg, arg_ptr);
        va_end(arg_ptr);
        exit(1);
    }
}

#define ASSERT_EQ(a, b) assert(a == b, __LINE__, #a " == " #b " (%d != %d)\n", a, b)

void testComm() {
    printf("Testing Comm structure layout: ");
    ASSERT_EQ(offsetof(struct GameComm, gfxOvlName), COMM_GFXOVL_NAME_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, sndOvlName), COMM_SNDOVL_NAME_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, gfxOvlAddr), COMM_GFXOVL_ADDR_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, sndOvlAddr), COMM_SNDOVL_ADDR_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, miscOvlAddr), COMM_MISCOVL_ADDR_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, gfxInitResult), COMM_GFXINIT_RESULT_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, setup1), COMM_SETUP1_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, setupMono), COMM_SETUP_MONOCHROME_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, setupDone), COMM_SETUP_DONE_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, unk2), COMM_UNK2_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, setup2), COMM_SETUP2_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, unk3), COMM_UNK3_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, gfxModeChar), COMM_SETUP_GFXMODE_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, setupDetail), COMM_SETUP_DETAIL_OFFSET);

    ASSERT_EQ(offsetof(struct GameComm, unk7), COMM_UNK7_OFFSET);
    ASSERT_EQ(offsetof(struct GameComm, unk8), COMM_UNK8_OFFSET);

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
    ASSERT_EQ(offsetof(struct Game, unk2), GAME_UNK2_OFFSET);
    ASSERT_EQ(offsetof(struct Game, unk3), GAME_UNK3_OFFSET);
    ASSERT_EQ(offsetof(struct Game, lastScore), GAME_LASTSCORE_OFFSET);
    ASSERT_EQ(offsetof(struct Game, flag2), GAME_START_FLAG2_OFFSET);
    ASSERT_EQ(offsetof(struct Game, totalScore), GAME_TOTALSCORE_OFFSET);
    ASSERT_EQ(offsetof(struct Game, theater), GAME_START_THEATER);
    ASSERT_EQ(offsetof(struct Game, flag4), GAME_FLAG4_OFFSET);
    ASSERT_EQ(offsetof(struct Game, flag3), GAME_FLAG3_OFFSET);
    ASSERT_EQ(offsetof(struct Game, difficulty), GAME_START_DIFFICULTY);
    ASSERT_EQ(offsetof(struct Game, rand), GAME_RAND_OFFSET);
    ASSERT_EQ(offsetof(struct Game, unk1), GAME_UNK1_OFFSET);
    ASSERT_EQ(offsetof(struct Game, flag1), GAME_START_FLAG1_OFFSET);
    printf("OK\n");
}

void testStruct() {
    printf("Testing various structs: ");
    ASSERT_EQ(sizeof(struct Buf4Item), BUF4ITEMSIZE);
    ASSERT_EQ(sizeof(struct Buf6Item), BUF6ITEMSIZE);
    ASSERT_EQ(sizeof(struct Target), TARGETSIZE);
    ASSERT_EQ(sizeof(struct struc_9), STRUC9SIZE);
    ASSERT_EQ(sizeof(struct struc_10), STRUC10SIZE);
    ASSERT_EQ(sizeof(struct Pilot), HALLFAME_RECORDSZ);
    ASSERT_EQ(sizeof(struct Plane), PLANESIZE);
    ASSERT_EQ(sizeof(struct TerrainUnk), TERRAINUNKSIZE);
    printf("OK\n");
}

int main() {
    printf("Running F15 SE2 unit test application\n");
    testComm();
    testGame();
    testStruct();
    return 0;
}