/* end_data.c — Data definitions migrated from end_rc.asm (.DATA segment)
 * See docs/end_rc_data_migration.md
 */
#include "inttype.h"

/* Rank names (index 0 = empty, 1-6 = promotable ranks) */
char str_emptyRank[] = "";
char str_1stLt[] = "1st Lieutenant.";
char str_captain[] = "Captain.";
char str_major[] = "Major.";
char str_ltColonel[] = "Lt Colonel.";
char str_colonel[] = "Colonel.";
char str_general[] = "General.";

/* Medal names */
char str_afcm[] = "Air Force Commendation Medal.";
char str_dfc[] = "Distinguished Flying Cross.";
char str_silverStar[] = "Silver Star.";
char str_afc[] = "Air Force Cross.";
char str_cmoh[] = "Congressional Medal of Honor.";

/* Award screen strings */
char str_deskPic[] = "desk.pic";
char str_deskMsg1[] = "After ditching three very expensive aircraft,";
char str_deskMsg2[] = "you are assigned a desk job.";
char str_deathPic[] = "death.pic";
char str_deathMsg1[] = "In the wake of the horrible crash,";
char str_deathMsg2[] = "your family and friends mourn your loss.";
char str_promoPic[] = "promo.pic";
char str_promoMsg1[] = "For your consistently successful missions,";
char str_promoMsg2[] = "you have been promoted to ";
char str_medalPic[] = "medal.pic";
char str_medalMsg1[] = "For your outstanding performance, you receive";
char str_medalMsg2[] = "the ";

/* Rank name pointer table */
char *rankNames[] = {
    str_emptyRank,
    str_1stLt,
    str_captain,
    str_major,
    str_ltColonel,
    str_colonel,
    str_general
};

/* Medal name pointer table */
char *medalNames[] = {
    str_afcm,
    str_dfc,
    str_silverStar,
    str_afc,
    str_cmoh
};

/* Debrief screen strings (some have leading control bytes for text formatting) */
char str_pressExit[] = "Press Selector to exit Debriefing";
char str_dot1[] = "\x8d";
char str_overall1[] = "OVERALL";
char str_missionRating1[] = "MISSION RATING";
char str_dot2[] = "\x80";
char str_trainingScore[] = "\x84Training Score";
char str_notRecorded[] = "NOT Recorded !";
char str_dot3[] = "\x8d";
char str_careerTotal[] = "CAREER TOTAL";
char str_dot4[] = "\x80";
char str_missionSummary[] = "MISSION SUMMARY";
char str_priSecTargets[] = "Pri/Sec Targets";
char str_otherTargets[] = "Other Targets";
char str_enemyPlanes[] = "Enemy Planes";
char str_friendlyTargets[] = "Friendly Targets";
char str_dot5[] = "\x8d";
char str_overall2[] = "OVERALL";
char str_missionRating2[] = "MISSION RATING";
char str_dot6[] = "\x80";
char str_missionEvent[] = "MISSION EVENT";
char str_time[] = "TIME: \x80";
char str_destroyed4[] = " ";
char str_destroyed1[] = " destroyed";
char str_destroyed2[] = " destroyed";
char str_shotDown2[] = " ";
char str_shotDown[] = " shot down";
char str_destroyed3[] = " destroyed";
char str_rearmed3[] = " ";
char str_rearmed1[] = " - Rearmed/Refueled";
char str_rearmed2[] = " - Rearmed/Refueled";
char str_hitBy[] = "Hit by ";
char str_missile[] = " missile";
char str_takeoffPoint[] = "Takeoff point:";
char str_missionEnd[] = "Mission end:\n";
char str_crashed[] = "Crashed";
char str_goodBailout[] = "Good Bailout";
char str_captured[] = "Captured";
char str_bailedDied[] = "Bailed & Died";
char str_goodLanding[] = "Good Landing";
char str_primaryObj[] = "\x8c" "PRIMARY OBJECTIVE";
char str_secndryObj[] = "\x8c" "SECNDRY OBJECTIVE";
char str_cumulative2[] = "\x8d";
char str_cumulative[] = "CUMULATIVE";
char str_missionRating3[] = "MISSION RATING";
char str_pressSelect[] = "\x80";
char str_pressNext[] = "Press Selector for next mission event";
char str_inFlight[] = "\x80" "In-Flight";
char str_timeLabel[] = "\x8d" "TIME: \x80";
char str_timeZeros[] = "\x80";
char str_timeFormat[] = "00:00:00";

/* Error strings ($ terminated for DOS int 21h/09h) */
char str_allocError[] = "Insufficient system memory - AllocBuffer$";
char str_deallocError[] = "Buffer dealloc error$";

/* Popup sprite coordinate tables (18 entries each, as int arrays) */
int popupSpriteY[] = {0, 0, 0, 0, 0, 0, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x50, 0x50, 0x50, 0x50, 0x50, 0x50};
int popupSpriteX[] = {0, 0x30, 0x60, 0x90, 0xC0, 0xF0, 0, 0x30, 0x60, 0x90, 0xC0, 0xF0, 0, 0x30, 0x60, 0x90, 0xC0, 0xF0};

/* Map view bounds */
int mapViewX1 = 0x08;
int mapViewY1 = 0x0A;
int mapViewX2 = 0xE8;
int mapViewY2 = 0xB2;

/* dat_1c8e - color/style table (16 int entries) */
int dat_1c8e[] = {
    0x0006, 0x009D, 0x00DB, 0x00BD, 0x00D9, 0x0093, 0x0039, 0x0002,
    0x0078, 0x0087, 0x0000, 0x0000, 0x0000, 0x0000, 0x008D, 0x0000
};

/* ===== BSS variables (migrated from .DATA? section of end_rc.asm) ===== */

/* Text buffer for string formatting */
char textBuf[100];

/* Unit/grid data tables */
char unitTypeTable[100];
char gridFlags[256];

/* Target data */
int target1Type[2];
char target1MiscBits[10];
int target2Type[4];
char target2MiscBits[10];

/* Score string buffer (also aliased as dat_4824 via #define in end.h) */
char scoreString[512];

/* Kill/miss counters */
int samKilled;
int samMissed;
int groundKilled;
int groundMissed;
int airKilled;
int airMissed;

/* Menu/input state */
int selectedMenuItem;
char missionResult[3];
char enterPressed;

/* Drawing state */
int lastDrawX;
int prevDrawX;
int lastDrawY;
int prevDrawY;
char popupVisible;
int primaryHit;

/* Mission scoring */
int missionScore;
int missionScoreHi;
int secondaryHit;  /* BSS had 242 bytes here but only first int is named */

/* Map state */
char ejectedFlag;
int popupX;
int popupY;

/* World data */
int worldDataReady;
char worldStrings[200];
char worldStringBuf[750];
int worldBufHandle;

/* Graphics animation state (from BSS) */
int colorTablePtr;
char inputChanged;
int colorAnimIdx;
int colorAnimEnabled;
char joyRepeatFlag;
char spriteToggle;
char animDone;
int curRecordIdx;
char dat_424e[8];
char var_425c[1188];
char dat_4804[4];
int var_192;
int var_193;
char slotInfoTable[6];
char flightRecords[1534];
unsigned int cursorX;
unsigned int cursorY;
char hercFlag[518];
int hasVgaMode[2];
int spriteBufSeg;
int vgaBufSeg;
int vgaBufOffset;
char vgaBufSeg2;  /* 1 byte in original BSS */
