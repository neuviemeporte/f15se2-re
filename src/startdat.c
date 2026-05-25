/* start_data.c — Data definitions migrated from start_rc.asm (.DATA segment)
 * See docs/start_rc_data_migration.md
 */
#include "inttype.h"

/* Filename strings */
char aLabs_pic[] = "labs.pic";
char aAdv_pic[] = "adv.pic";
char aEgraphic_exe[] = "egraphic.exe";
char aTitle640_pic[] = "Title640.Pic";
char aTitle16_pic[] = "title16.pic";
char aF15_spr[] = "f15.spr";
char aF15_spr_0[] = "f15.spr";
char aTemp_wld[] = "temp.wld";

/* UI strings */
char aWall_pic[] = "Wall.Pic";
char aDifficulty[] = "DIFFICULTY";
char aTheater[] = "THEATER";
char aRb_1[] = "rb";
char aNoScenarioFile[] = "No scenario files found";
char aSeeTechnicalSu[] = "See Technical Supplement";
char aTheater_0[] = "THEATER";
char aMissionType[] = "MISSION TYPE";

/* Mission briefing strings */
char aRepeatLastMiss[] = "Repeat last mission ? (y/n)";
char aRb_2[] = "rb";
char aF15_spr_1[] = "F15.spr";
char aPleaseReinsert[] = "Please reinsert F15 Disk A";
char aPressSelectorW[] = "<Press selector when ready>";
char aDecodingMissio[] = "decoding mission...";
char aTodaySMission[] = "TODAY'S MISSION";
char aTakeoffFrom[] = "Takeoff from:";
char aOnc_2[] = "ONC ";
char aPrimaryTarget[] = "Primary Target:";
char aOnc_0[] = "ONC ";
char aSecondaryTarge[] = "Secondary Target:";
char aOnc_1[] = "ONC ";

/* Roster / pilot strings */
char aArmpiece_pic[] = "ArmPiece.Pic";
char aHiscore_pic[] = "HiScore.Pic";
char aOriginalDiskIn[] = "Original Disk in drive.  Roster will not be saved.";
char aPressAKeyToCon[] = "Press a key to continue.";
char aUseSelectorToC[] = "Use SELECTOR to choose pilot,  ESC to enter new pilot.";
char asc_174AC[] = " (";
char asc_174AF[] = ")";
char aMenterYourName[] = "\376ENTER YOUR NAME !";
char aRb_3[] = "rb";
char aHallfame[] = "HallFame";
char aWb[] = "wb";
char aHallfame_0[] = "HallFame";

/* Overlay error strings */
char aAlloc1M[] = "Allocated 1Mb of space????$";
char aDosLied[] = "MS-DOS lied to us about how much memory was available$";
char aFileNFound[] = "Filename not found$";
char aEnoughMem[] = "Not enough memory to load file$";
char aOvlFail[] = "Overlay load failed for some reason$";
char aOvlOvrrun[] = "Overlay has overrun allocated memory$";
char aOvlShrink[] = "Unable to shrink overlay memory allocation$";
char aOvlRel[] = "Error releasing overlay memory$";

/* File I/O error strings */
char aFileNotFound[] = ":File not found$";
char aNoFileBuffersAvailable[] = ":No file buffers available$";
char aOpenError[] = ":Open error $";
char aFileClosingError[] = "File closing error$";
char aReadError[] = "Read error$";
char aWriteError[] = "Write error$";
char str_allocError[] = "Insufficient system memory - AllocBuffer$";

/* Terrain/grid file strings */
char a_3dt[] = ".3dT";
char aRb[] = "rb";
char aOpenErrorOn_3d[] = "Open Error on *.3DT, assuming new file !";
char aBadTileFileFor[] = "Bad Tile file format.";
char aTooManyTiles_[] = "Too many tiles.";
char aTooMuchTileDat[] = "Too much tile data";
char a_3dg[] = ".3dG";
char aRb_0[] = "rb";
char aOpenErrorOn__0[] = "Open Error on *.3DG, assuming new file !";
char aBadGridFileFor[] = "Bad Grid file format.";

/* Mission/scenario strings */
char aPowCamp[] = "POW Camp";
char aRb_4[] = "rb";
char aWb_0[] = "wb";
char aTd00[] = "TD00";
char aJz00[] = "JZ00";
char aXv00[] = "XV00";
char aEs00[] = "ES00";
char aWx00[] = "WX00";
char aCc00[] = "CC00";
char aHz00[] = "HZ00";
char aAt[] = " at ";

/* Overlay loader variables */
int ovlSeg1 = 0;
int ovlParCnt = 0;
int ovlParBlock = 0;
int ovlSeg2 = 0;
char ovlInsaneFlag = 0;

/* Mission selection state */
int enableHighlight = 1;

/* Direction/level lookup tables */
int word_17FFE[] = {-1, 1, 1, -1, 0, 1, 0, -1, 0};
int word_18010[] = {1, 1, -1, -1, 1, 0, -1, 0, 0, (int)0xE000, (int)0xF000};
int word_18026[] = {0, 0x1000, 0x2000, 0x400, 0x100, 0x40, 0x10, 4};

/* Terrain/grid state */
int terrainSignature = 0x3131;
int terrainDirtyFlag = 0;
int gridSignature = 0x3232;
int gridValidFlag = 0;
