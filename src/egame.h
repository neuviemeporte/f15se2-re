#ifndef F15_SE2_EGAME
#define F15_SE2_EGAME
#include "inttype.h"
#include "struct.h"
#include "comm.h"
#include "pointers.h"

#include <stdio.h>

#if !defined(MSDOS)
#define far
#ifndef pascal
#define pascal
#endif
#endif

#define __int32 long
#define __int8 char
#define __cdecl
#define __far far
#ifdef BUGFIX
extern char far byte_228D0[];
#else
extern unsigned char far byte_228D0[];
#endif
extern unsigned char far byte_228FF[];
#ifdef BUGFIX
extern char far byte_2D6A4[];
#else
extern unsigned char far byte_2D6A4[];
#endif
#define DOS_SET_IRQH 0x25
#define PORT_PIT_TIME0 0x40
#define PORT_PIT_CNTRL 0x43
#define COMM_GFXOVL_SEG 0x1a
#define COMM_SNDOVL_SEG 0x1c
#define COMM_MISCOVL_SEG 0x1e
#define COMM_GFXBUF_PTR 0x20
#define COMM_HERC_FLAG 0x24
#define COMM_SETUP_DONE_OFFSET 0x26
#define COMM_SETUP_GFXMODE_OFFSET 0x30
#define COMM_UNK7 0x38  /* weaponType */
#define COMM_JOYDATA_OFF 0x48
#define COMM_USEJOY_OFF 0x72
#define COMM_GFXMODE_OFFSET 0x78
#define COMM_WORLDBUF 0x7a
#define OFF_IACA_START 0x4f0
#define COMM_GAMEDATA_OFFSET 0x120e
#define IRQ_CBREAK 0x1b
#define GAMEDATA_THEATER 0x38
#define GAMEDATA_DIFFICULTY 0x3e
#define GAMEDATA_UNK4 0x40
#define WAYPT_PRIMARY 0x1
#define WAYPT_SECONDARY 0x2
#define WAYPT_BASE 0x3
#define IRQ_VIDEO 0x10
#define OVL_HDR_CODESEG 0x18
#define OVL_HDR_FIRSTIDX 0x1c
#define OVL_HDR_SLOTCOUNT 0x22
#define OVL_HDR_FIRSTPTR 0x24
// ==== seg000:0x147 ====
void __cdecl drawCockpit();
// ==== seg000:0x211 ====
void runGameSession();
// ==== seg000:0x294 ====
void sub_10294();
// ==== seg000:0x297 ====
void sub_10297();
// ==== seg000:0x29a ====
void __cdecl gfxInit();
// bytes outside routine, potential module boundary at 0x2e1
// ==== seg000:0x2e2 ====
int loadF15DgtlBin();
// ==== seg000:0x334 ====
void drawProjectionSphere(int arg_0);
// ==== seg000:0x688 ====
int setupOverlaySlots(uint16 addr);
// ==== seg000:0x720 ====
void updateFrame(void);
// ==== seg000:0x14e8 ====
void dispatchKeyScancode();
// ==== seg000:0x14fc ====
int countermeasures();
// ==== seg000:0x1636 ====
void tickMessageTimers();
// ==== seg000:0x1676 ====
void updateBulletsAndFire();
// ==== seg000:0x1841 ====
void updateTracerParticles();
// ==== seg000:0x18d5 ====
void applyGravityFall();
// ==== seg000:0x18f6 ====
void initFrameRandom();
// ==== seg000:0x1971 ====
void sub_11971();
// ==== seg000:0x19a3 ====
void initWeaponLoadout(void);
// ==== seg000:0x1a18 ====
void drawWeaponAmmo();
// ==== seg000:0x1a88 ====
void drawWeaponSelectMarker(int weaponIdx);
// ==== seg000:0x1b37 ====
void finalizeMission(int outcome);
// ==== seg000:0x1bc3 ====
void scheduleEventCheck(int eventObjIdx, unsigned int priority);
// ==== seg000:0x1bfd ====
void scheduleTimedEvent(int keyVal, int delay);
// ==== seg000:0x1c21 ====
void generateRandomRadioMessage();
// ==== seg000:0x1d10 ====
void appendMapEvent(int eventType, int arg_2);
// ==== seg000:0x1d6e ====
void placeString(int waypointIdx);
// ==== seg000:0x1e0e ====
void initMissionStrings();
// ==== seg000:0x1f3e ====
void findWaypointFeatures();
// ==== seg000:0x2049 ====
void moveDataFar();
// ==== seg000:0x206d ====
void moveStuff();
// ==== seg000:0x215c ====
void moveNearFar(void *nearPtr, int count);
// ==== seg000:0x21a9 ====
int setCommWorldbufPtr();
// ==== seg000:0x21c6 ====
int callLoad3DAll();
void sub_121C6();
// ==== seg000:0x21ca ====
void render3DView(int, int, int, long, long, long, int, int, int, int);
// ==== seg000:0x2278 ====
void waitFrameSync(int frames);
// ==== seg000:0x229a ====
void copySomeMem(int idx);
// ==== seg000:0x22b8 (prototype local to callers — eg3d_a.c) ====
// ==== seg000:0x26b4 ====
uint32 scaleCoordToLod(int level, uint32 coord);
// ==== seg000:0x273e ====
int process3dg(int lod, int col, int row);
// ==== seg000:0x2874 ====
void load3DAll();
// ==== seg000:0x2898 ====
void __cdecl load3D3(char *);
// ==== seg000:0x2c82 ====
void __cdecl load3DT(char *);
// ==== seg000:0x2e54 ====
void load3DG();
// ==== seg000:0x2f8c ====
void __cdecl printError(const char *);
// ==== seg000:0x2faf ====
void __cdecl strcpyFromDot(char *dst, char *src);
// ==== seg000:0x2fda ====
int16* findNearestTileObject(uint32 worldX, uint32 worldY);
// ==== seg000:0x3224 ====
void addTileEntry(char *a, int b, char c);
// ==== seg000:0x3266 ====
int lookupTileEntry(int p1, int p2, int p3, int p4);
// ==== seg000:0x32ba ====
void drawNearestTileObject(uint32 coord1, uint32 coord2, uint32 coord3);
// ==== seg000:0x345e ====
void renderMapTerrain(char *, int, int, int);
// ==== seg000:0x34ac ====
void drawMapTiles(int originX, int originY, int zoomShift);
// ==== seg000:0x3638 ====
void computeTileBounds(int *, int *, int *, int *);
// ==== seg000:0x3694 ====
void worldToTileIndex(int, int, int *, int *);
// ==== seg000:0x36d2 ====
void drawMapTileObject(char far *, int, int);
// ==== seg000:0x374a ====
int drawModelPoint();
// ==== seg000:0x378e ====
void buildVertexSignMask(int, int);
// ==== seg000:0x3816 ====
void projectModelVertices(int screenX, int screenY);
// ==== seg000:0x3922 ====
int aspectScaleY(int screenY);
// ==== seg000:0x3932 ====
void setup3DTransform(char*, int, int, int, int, int, int, int);
// ==== seg000:0x39aa ====
int rasterize3DWorld();
// ==== seg000:0x39c0 ====
void setupViewport(char *rect);
// ==== seg000:0x3a6c ====
void setViewRotation(int, int, int);
// ==== seg000:0x3a90 ====
void setViewPosition(int posX, int posY, int posZ);
// ==== seg000:0x3aee ====
void setupDac();
// ==== seg000:0x3b2f ====
int fixedMulQ14(int arg_0, int arg_2);
// ==== seg000:0x3b86 ====
int cosine(int);
// ==== seg000:0x3b96 ====
int sine(int arg_0);
// ==== seg000:0x3ba2 ====
int sineLookup();
// ==== seg000:0x3bc1 ====
int far lookupSineFar();
// ==== seg000:0x3bc5 ====
int far lookupCosineFar();
// ==== seg000:0x3bc9 ====
int lookupCosine();
// ==== seg000:0x3bcd ====
int lookupSine();
// ==== seg000:0x3bec ====
void installCBreakHandler();
// ==== seg000:0x3c0f ====
int restoreCBreakHandler();
// ==== seg000:0x3c20 ====
int getInterruptHandler();
// ==== seg000:0x3c2c ====
int far cbreakHandler();
// ==== seg000:0x3c3b ====
int runGameLoop();
// ==== seg000:0x3c47 ====
int gameMainLoop();
// ==== seg000:0x3c78 ====
int setTimerIrqHandler();
// ==== seg000:0x3cb6 ====
int restoreTimerIrqHandler();
// ==== seg000:0x3d6b ====
int sub_13D6B();
// ==== seg000:0x3df2 ====
int calibrateGameSpeed();
// ==== seg000:0x3e87 ====
int manipulateTimer();
// ==== seg000:0x3edc ====
int getTimeOfDay();
// ==== seg000:0x3ee3 ====
int advanceFrameTick();
// ==== seg000:0x3f72 ====
int otherKeyDispatch();
// ==== seg000:0x51f9 ====
void applyRotationDelta(int param_1, int param_2);
// ==== seg000:0x5237 ====
void computeHudAttitude(void);
// ==== seg000:0x5411 ====
void rebuildOrientation();
// ==== seg000:0x543b ====
unsigned signedRatio16(int, int);
// ==== seg000:0x54b7 ====
int valueToAngle(int value);
// ==== seg000:0x5540 ====
int complementAngle(int arg_0);
// ==== seg000:0x5557 ====
int isqrt();
// ==== seg000:0x55ab ====
void renderFrame();
// ==== seg000:0x5fdb ====
void sub_15FDB(void);
// ==== seg000:0x606c ====
void drawFuelGauge(void);
// ==== seg000:0x60d3 ====
void drawVectorShape(int16 *shapeData);
// ==== seg000:0x613b ====
void waitForKeyPress(void);
// ==== seg000:0x6172 ====
void updateThreatSites();
// ==== seg000:0x6346 ====
int fireGroundThreat(int);
// ==== seg000:0x660e ====
int computeThreatRangeBearing();
// ==== seg000:0x66be ====
void sub_166BE();
// ==== seg000:0x6742 ====
int computeThreatScore();
// ==== seg000:0x67b4 ====
int updateObjects();
// ==== seg000:0x7594 ====
int fireAirThreat();
// ==== seg000:0x783a ====
void spawnEnemyAircraft(int slot, int objType);
// ==== seg000:0x79ee ====
int updateThreatTargeting();
// ==== seg000:0x85be ====
int samCanAcquireTarget();
// ==== seg000:0x86f8 ====
void destroyAircraft(int objIdx);
// ==== seg000:0x87ea ====
void sub_187EA(int param_1);
// ==== seg000:0x89aa ====
int markTargetReached(int targetIdx);
// ==== seg000:0x8a44 ====
void bombTarget(void);
// ==== seg000:0x8aa6 ====
void fireMissile();
// ==== seg000:0x8df4 ====
void projectWorldPos(int worldX, int worldY, int worldZ);
// ==== seg000:0x8e38 ====
void clearStatusPanel();
// ==== seg000:0x8e50 ====
void drawCockpitHud();
// ==== seg000:0x94d0 ====
void __cdecl setActivePanel(int);
// ==== seg000:0x957a ====
void refreshActivePanel(int panelId);
// ==== seg000:0x9595 ====
void initTacMapView(void);
// ==== seg000:0x95c9 ====
int redrawTacMap(int, int);
// ==== seg000:0x9875 ====
void zoomIn(void);
// ==== seg000:0x98b4 ====
void zoomOut(void);
// ==== seg000:0x98fa ====
int mapXToScreen();
// ==== seg000:0x9915 ====
int mapYToScreen();
// ==== seg000:0x993a ====
int plotMapObject();
// ==== seg000:0x99ec ====
int objectToScreen(int mapX, int mapY, int16 *outScreenX, int16 *outScreenY);
// ==== seg000:0x9a4d ====
int readMapPixelColor(int mapX, int mapY);
// ==== seg000:0x9adb ====
void __cdecl drawMapRangeArc(int, int, int, int, int, int, int);
// ==== seg000:0x9b98 ====
void drawMapLine(int x1, int y1, int x2, int y2);
// ==== seg000:0x9be1 ====
void drawFullscreenLine(int x1, int y1, int x2, int y2);
// ==== seg000:0x9c0c ====
void drawViewportLine(int x1, int y1, int x2, int y2);
// ==== seg000:0x9c84 ====
void drawClippedLineRegion(int x1, int y1, int x2, int y2, int clipLeft, int arg_a, int arg_c, int arg_e, int drawBothPages);
// ==== seg000:0x9d86 ====
void drawScreenLineOnePage(int x1, int y1, int x2, int y2);
// ==== seg000:0x9db0 ====
void __cdecl drawHudViewLine(int, int, int, int);
// ==== seg000:0x9e44 ====
void __cdecl setDrawColor(int);
// ==== seg000:0x9e5d ====
void fillRectBoth(int x1, int y1, int x2, int y2);
// ==== seg000:0x9e94 ====
void drawColorPoint();
// ==== seg000:0x9ea0 ====
void drawMapPoint(int, int, int);
// ==== seg000:0x9eb6 ====
void switchIndicatorColor(int indicatorIdx, int color);
// ==== seg000:0x9fad ====
void __cdecl drawPanelText(int, char*, int);
// ==== seg000:0x9fcc ====
void __cdecl fillPanelBox(int, int);
// ==== seg000:0xa030 ====
int __cdecl drawCenteredLabelBox(int, char *);
// ==== seg000:0xa0cb ====
void __cdecl drawSomeStrings(const char *, int, int, int);
// ==== seg000:0xa0fe ====
void draw2Strings(const char*, int, int, int);
// ==== seg000:0xa13a ====
void __cdecl drawStringCentered(int16 *, const char *, int, int, int);
// ==== seg000:0xa183 ====
void drawNumber(int, int, int, int);
// ==== seg000:0xa1b1 ====
int readScreenPixel(int screenX, int screenY);
// ==== seg000:0xa1e4 ====
void tempStrcpy(char *src);
// ==== seg000:0xa204 ====
void setTimedMessage(char *message);
// ==== seg000:0xa224 ====
int routine_260(int param_1, int objIdx);
// ==== seg000:0xa25c ====
void drawTacticalMap(char page);
// ==== seg000:0xa740 ====
void drawMapMarkerBox(int arg_0, int arg_2, int color);
// ==== seg000:0xa7c4 ====
void projectMapPoint(int mapX, int mapY);
// ==== seg000:0xa872 ====
void blitGaugeSprite(int srcCol, int srcRow, int destX, int destY);
// ==== seg000:0xa8c8 ====
void blitSprite(int destX, int destY, int srcX, int srcY, int spriteWidth, int arg_a, int arg_c);
// ==== seg000:0xa934 ====
int cacheScopePanel();
// ==== seg000:0xa962 ====
int restoreScopePanel();
// ==== seg000:0xa9bc ====
int captureScopePanel();
// ==== seg000:0xa9f8 ====
int updateTargetLock();
// ==== seg000:0xb147 ====
int drawHudWorldOverlay();
// ==== seg000:0xc1b9 ====
void drawTargetBox(int, int, int, int);
// ==== seg000:0xc2f8 ====
void drawMissileLock(void);
// ==== seg000:0xc371 ====
void __cdecl drawTargetLabel(char *, int, int);
// ==== seg000:0xc40b ====
void buildRangeString(int rangeRaw);
// ==== seg000:0xc488 ====
void projectWorldToHud(int worldX, int worldY, int worldZ);
// ==== seg000:0xc661 ====
long rotateVectorComponent(int axis, int vecX, int vecY, int vecZ);
// ==== seg000:0xc6be ====
int findWaypointEntry();
// ==== seg000:0xc7a2 ====
void computeMapTargetRange(int targetIdx);
// ==== seg000:0xc7c6 ====
void computeSimObjectRange();
// ==== seg000:0xc7ea ====
void computeTargetBearing(int targetX, int targetY, int wantBearing);
// ==== seg000:0xc82d ====
int sub_1C82D();
// ==== seg000:0xc864 ====
int getTargetSymbol(int wpIdx);
// ==== seg000:0xc8a4 ====
int isTargetOverWater(int wpIdx);
// ==== seg000:0xc8de ====
void load15Flt3d3();
// ==== seg000:0xc9d2 ====
void drawWorldObject(int shapeId, long worldX, long worldY, int altitude, int param_5, int param_6, int param_7, int scaleShift);
// ==== seg000:0xcb42 ====
void drawTargetView();
// ==== seg000:0xcf32 ====
int shapeDataOffset(int param_1);
// ==== seg000:0xcf64 ====
int clampRange(int value, int minVal, int maxVal);
// ==== seg000:0xcf8e ====
int forceRange();
// ==== seg000:0xcfa6 ====
int rangeApprox(int dx, int dy);
// ==== seg000:0xd008 ====
int computeBearing(int arg_0, int arg_1);
// ==== seg000:0xd178 ====
int sinMul(int angle, int value);
// ==== seg000:0xd190 ====
int cosMul(int angle, int value);
// ==== seg000:0xd1c8 ====
int signOf();
// ==== seg000:0xd1e8 ====
void seedRng(void);
// ==== seg000:0xd200 ====
int randlmul();
int randomRange(int);
// ==== seg000:0xd21e ====
int readAxisInput(int param_1);
// ==== seg000:0xd260 ====
int keyDispatch(int16 scanCode);
// ==== seg000:0xd9db ====
void selectMissile();
// ==== seg000:0xda35 ====
void makeSound(int soundId, int priority);
// ==== seg000:0xda5f ====
void sub_1DA5F(int weaponIdx);
// ==== seg000:0xda8d ====
void sub_1DA8D(void);
// ==== seg000:0xdaae ====
void recalcTimeScale(void);
// ==== seg000:0xdb2b ====
void setupLodDistances(void);
// ==== seg000:0xdb9c ====
void sub_1DB9C();
// ==== seg000:0xdbe0 ====
void sub_1DBE0(void);
// ==== seg000:0xdd4c ====
int __cdecl openFileWrapper(const char *, int);
// ==== seg000:0xdd5e ====
#ifdef BUGFIX
int createFileWrapper(const char* filename, int attr);
#else
int createFileWrapper();
#endif
// ==== seg000:0xdd70 ====
void closeFileWrapper(int handle);
// ==== seg000:0xdd7e ====
int readFile1Wrapper();
// ==== seg000:0xdd92 ====
int readFile2Wrapper();
// ==== seg000:0xddaa ====
int writeFileAtRawWrapper();
// ==== seg000:0xddc4 ====
int __cdecl openFile(const char *, int);
// ==== seg000:0xde1b ====
int createFile(const char *arg_0, int arg_1);
// ==== seg000:0xde72 ====
int closeFile(int arg_0);
// ==== seg000:0xde94 ====
int readFile1(int arg_0, int arg_1, int arg_2);
// ==== seg000:0xdebf ====
int readFile2(int arg_0, int arg_1, int arg_2, int arg_3);
// ==== seg000:0xdf16 ====
int read512FromFileIntoBuf();
// ==== seg000:0xdf4f ====
int writeFileAtRaw(int arg_0, int arg_1, int arg_2, int arg_3, int arg_4);
// ==== seg000:0xdfbc ====
 // 2 parameters correct
void openBlitClosePic(char* path, int arg_2);
// ==== seg000:0xe0aa ====
 // 2 parameters correct
void picBlit(int handle, int unk);
// ==== seg000:0xe11c ====
int picBlitOverlay2();
// ==== seg000:0xe1f8 ====
int picBlitOverlay1();
// ==== seg000:0xe260 ====
int nullsub_1();
// ==== seg000:0xe262 ====
void decodePicRow();
// ==== seg000:0xe28c ====
int picReadDataAndMakeDict();
// ==== seg000:0xe2d3 ====
int picMakeDict();
// ==== seg000:0xe309 ====
int doPicDecode();
// ==== seg000:0xe382 ====
int dictionaryLookup();
// ==== seg000:0xe631 ====
int callNearTermTable();
// ==== seg000:0xe640 ====
int callFarTermTable();
// ==== seg000:0xece4 ====
void pascal shiftLongLeftInPlace(int count, long *ptr);
// ==== seg000:0xed04 ====
void pascal shiftLongRightInPlace(int count, long *ptr);
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
int far drawPolygonOutline(int, int, int*, int);
// ==== seg001:0x78 ====
int projectVertexToScreen();
// ==== seg001:0x113 ====
int installDivZeroHandler();
// ==== seg001:0x137 ====
int installDivZeroVector();
// ==== seg001:0x15d ====
int clipLineSegment();
// ==== seg001:0x23f ====
int sub_1FABF();
// ==== seg001:0x29d ====
int writeClippedStart();
// ==== seg001:0x2d2 ====
int writeClippedEnd();
// ==== seg001:0x308 ====
int rejectClippedLine();
// ==== seg001:0x334 ====
int clipPointInside();
// ==== seg001:0x383 ====
int clipComputeOutcode();
// ==== seg001:0x3ba ====
int clampToClipEdge();
// ==== seg001:0x40e ====
int clipMidpointSubdivide();
// ==== seg001:0x484 ====
int clipLineMidpoint();
// ==== seg001:0x4f2 ====
int pointOnClipEdge();
// ==== seg001:0x52d ====
int computeClipOutcode();
// ==== seg001:0x5dc ====
int sub_1FE5C();
// ==== seg001:0x66c ====
int far sub_1FEEC(int);
// ==== seg001:0x67e ====
int sub_1FEFE();
// ==== seg001:0x884 ====
#ifdef NO_ASM
void far projectSceneObject(char *, int, int, int, int, int, int);
#else
void far projectSceneObject();
#endif
// ==== seg001:0x908 ====
int transformAndCullObject();
// ==== seg001:0xa09 ====
int skipDisplayListByLod();
// ==== seg001:0xa36 ====
int sub_202B6();
// ==== seg001:0xa47 ====
int far sub_202C7(int, int, int);
// ==== seg001:0xa5a ====
int far advanceModelPointerLod();
// ==== seg001:0xa76 ====
int far sub_202F6();
// ==== seg001:0xa80 ====
int insertSortedObject();
// ==== seg001:0xb60 ====
int renderSortedList();
// ==== seg001:0xbca ====
int far sub_2044A();
// ==== seg001:0xbe7 ====
int processSceneObject();
// ==== seg001:0xcb4 ====
int rotatePoint3d();
// ==== seg001:0xdd8 ====
int far sub_20658();
// ==== seg001:0xdf4 ====
int transformModelVertices();
// ==== seg001:0x10f0 ====
int transformVertexList();
// ==== seg001:0x11c6 ====
int far projectModelEdgesFar();
// ==== seg001:0x11d8 ====
int projectModelEdges();
// ==== seg001:0x1282 ====
int clipEdgeNearPlane();
// ==== seg001:0x132e ====
int far buildRotationMatrixFar(int16* param_1, int param_2, int param_3, int param_4);
// ==== seg001:0x135f ====
int buildRotationMatrix();
// ==== seg001:0x147b ====
int buildInverseRotationMatrix();
// ==== seg001:0x1599 ====
int transposeOrientationMatrix();
// ==== seg001:0x15b8 ====
int far multiplyMatrix3x3Far(int param_1, int param_2, int16* param_3);
// ==== seg001:0x15cd ====
int multiplyMatrix3x3();
// ==== seg001:0x175c ====
int far drawModelDisplayList();
// ==== seg001:0x176a ====
int renderPrimitiveList();
// ==== seg001:0x17f5 ====
int renderPrimitiveCommand();
// ==== seg001:0x193a ====
int drawPrimitiveEdges();
// ==== seg001:0x19e7 ====
int nullsub_2();
// ==== seg001:0x1ba2 ====
int testVisibilityMask();
// ==== seg001:0x1bc4 ====
int far fillSpanRect(int16* param_1, int param_2, int param_3, int param_4, int param_5);
// ==== seg001:0x1ca6 ====
int far sub_21526();
// ==== seg001:0x1caa ====
int far drawClipLineGlobal();
// ==== seg001:0x1cb6 ====
int clipLineCohenSutherland();
// ==== seg001:0x1e42 ====
int computeLineOutcode();
// ==== seg001:0x1e84 ====
int far flushSpanDirtyRect();
// ==== seg001:0x1e9a ====
int far resetScanlineSpans();
// ==== seg001:0x1ea0 ====
int resetScanlineSpansImpl();
// ==== seg001:0x1ed6 ====
int clampScanlineSpan();
// ==== seg001:0x1f34 ====
int rasterizeEdgeSpan();
// ==== seg001:0x201c ====
int far clipAndRasterizeEdge();
// ==== seg001:0x2028 ====
int clipAndRasterizeEdgeImpl();
// bytes outside routine, potential module boundary at 0x9
// ==== seg002:0xa ====
void far sub_21A7A();
// ==== seg002:0xe ====
void __cdecl __far sub_21A7E();
// ==== seg002:0x12 ====
int far sub_21A82();
// ==== seg002:0x16 ====
int sub_21A86();
// ==== seg002:0x9a1 ====
void __cdecl sub_22411();
// ==== seg002:0xbeb ====
int far initJoystickCalibration();
// ==== seg002:0xbfb ====
int seedJoystickBaseline();
// ==== seg002:0xc0e ====
int far readCalibratedJoystick();
// ==== seg002:0xc21 ====
int readJoystickHardware();
// ==== seg002:0xc4e ====
int computeJoystickAxis();
// ==== seg002:0xcaa ====
int far restoreJoystickData(uint8 FAR *ptr);
// ==== seg002:0xcbe ====
void far copyJoystickData(uint8 FAR *ptr);
// ==== seg003:0x6 ====
int far setInt9Handler();
// ==== seg003:0x56 ====
int far restoreInt9Handler();
// ==== seg003:0x70 ====
int int9Handler();
// bytes outside routine, potential module boundary at 0x189
extern uint8 unk_328B0[];
extern int16 word_328B2;
extern uint8 unk_328B6[];
extern char aMsRunTimeLibraryCopyr[];
extern uint8 unk_328F0[];
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
extern uint8 exitCode;
extern int16 gfxModeUnset;
extern int16 f15DgtlResult;
extern char *regnStr;
extern char *scenarioPlh[];
extern char a256pit_pic[];
extern char aCockpit_pic[];
extern uint8 aF15dgtl_bin[];
extern int16 f15dgtlAddr;
extern int allocSize;
extern uint8 unk_32977[];
extern int16 word_3298A;
extern int16 word_3298C;
extern int16 word_3298E;
extern int16 word_32990;
extern uint8 unk_329AB[];
extern uint8 ovlInsaneFlag;
extern uint8 aErrorReleasingOverlay[];
extern char aSafeLanding[];
extern char aReadyForTakeof[];
extern char aWeaponsRepleni[];
extern char aAutomaticLandi[];
extern struct Waypoint waypoints[];
extern int16 waypointIndex;
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
extern uint8 aAn72[];
extern struct Sam sams[39];
extern int16 word_33096;
extern int16 word_33098;
extern int16 word_3309A;
extern int16 word_3309C;
extern int16 word_3309E;
extern struct MissileSpec missleSpec[];
extern int16 missileSpecIndex;
extern int16 word_330B4;
extern int16 word_330B6;
extern int16 word_330B8;
extern int16 word_330BA;
extern int16 word_330BC;
extern int16 word_330BE;
extern int16 word_330C2;
extern int16 word_330C4;
extern struct Missile missiles[20];
extern int16 word_333D2;
extern int16 word_333D4;
extern int16 word_333D8;
extern int16 word_333DA;
extern struct MissionTableEntry stru_33402[];
extern int16 word_33442;
extern struct Projectile stru_335C4[];
extern int16 word_336E4;
extern int16 word_336E6;
/* Free-running per-frame counter (DGROUP 0x336E8). Incremented once per
 * gameMainLoop iteration in updateFrame(). NOT the RNG seed (that's the C
 * lib rand()/srand via seedRng) and NOT a wall-clock/ms counter (real time
 * is tracked by var_383 + the BIOS timer, which recalibrate the rate
 * word_330C4). initFrameRandom() seeds it with a RANDOM phase
 * (randomRange(0x1000) & 0x7ff8), so its absolute value is meaningless --
 * only deltas, deadlines (word_3370C = delay*word_330C4 + frameTick) and low
 * bits (& 7/& 0xf, % word_330C4) matter, e.g. animation/AI phase staggering. */
extern int16 frameTick;
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
extern uint16 word_33708;
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
extern uint8 asc_3373D[];
extern char aGun[];
extern int16 asc_33744[];
extern uint8 aS[];
extern int16 word_3374A;
extern char aOnPatrol[];
extern char aF15StrikeEagle[];
extern char aAt[];
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
extern uint8 unk_339B4[];
extern int16 word_339F4;
extern int16 word_33B74;
extern int16 word_33B86;
extern int16 word_33B9C;
extern int16 word_33BA2;
extern int16 word_33BAC;
extern int16 word_33BAE;
extern size_t size3d3;
extern unsigned int buf3d3[];
extern unsigned int size3d3_2;
extern int16 sign3dt;
extern unsigned int sizes3dt[];
extern unsigned int matrix3dt[5][32];
extern int word_33DD0[];
extern int16 word_33DD2;
extern size_t size3d3_4;
extern size_t size3d3_5;
extern size_t size3d3_6;
extern size_t size3d3_3;
extern int16 sign3dg;
extern uint8 unk_33E1A[];
extern int16 word_3401A;
extern char a_3d3[];
extern char aRb[];
extern char aOpenErrorOn_3d3[];
extern char aBadObjFileFormat_[];
extern char aObjectDataTooBig_[];
extern char aRb_0[];
extern char aPhoto_3d3[];
extern char aPleaseInsertF15DiskB[];
extern char aRb_1[];
extern char aPhoto_3d3_0[];
extern char aObjdataOverflow[];
extern char a_3dt[];
extern char aRb_2[];
extern char aOpenErrorOn_3dt[];
extern char aBadTileFileFormat_[];
extern char aTooManyTiles_[];
extern char aTooMuchTileData[];
extern char a_3dg[];
extern char aRb_3[];
extern uint8 aPleaseInsertScenarioD[];
extern char unk_34121[];
extern uint8 aPressAKeyWhenReady[];
extern char aBadGridFileFormat_[];
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
extern int16 word_34186;
extern int16 word_34190;
extern int16 word_34192;
extern int16 word_34194;
extern uint8 byte_34196;
extern uint8 byte_34197;
extern int16 word_34198;
extern uint8 byte_3419A[];
extern uint8 byte_3419C[];
extern uint8 byte_3419F[];
extern int16 word_341B4;
extern int16 word_341B6;
extern int16 word_341B8;
extern int16 word_341BA;
extern int16 word_341BC;
extern int32 dword_3423C;
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
extern int16 word_3486A;
extern int32 dword_34A48;
extern int16 word_34A4C;
extern int16 word_34A4E;
extern uint8 unk_34A88[];
extern int32 dword_34C2C;
extern int16 word_35AF8;
extern uint8 flt15_buf2[];
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
extern uint8 dacValues1[];
extern uint8 dacValues[];
extern uint8 byte_36D86[];
extern uint8 otherDacValues[];
extern uint8 byte_37116[];
extern int16 word_37146;
extern int16 word_37148;
extern int16 word_37348;
extern int16 word_3734A;
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
extern uint8 cbreakHit;
extern int16 origCBreakSeg;
extern int16 origCBreakOfs;
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
extern uint8 joyData[];
extern int16 word_37F8C;
extern int16 word_37F8E;
extern uint8 joyAxes[];
extern uint8 joyAxes_2[];
extern uint8 byte_37F98;
extern uint8 byte_37F99;
extern uint8 byte_37F9A;
extern int16 word_37F9B;
extern uint8 byte_37F9D;
extern uint8 byte_37F9E;
extern uint8 byte_37F9F[];
extern uint8 aLandingGearRaised[];
extern uint8 aBrakesOn[];
extern uint8 a_[];
extern uint8 aG[];
extern uint8 byte_37FEC[];
extern int16 unk_3806E[];
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
extern uint8 unk_38092[];
extern int16 word_3809A;
extern int16 word_3809C;
extern int16 word_380A0;
extern int16 word_380A2;
extern int16 word_380A4;
extern int16 word_380A6;
extern int16 word_380AA;
extern int16 word_380AC;
extern int16 unk_380B6[];
extern int word_380C8;
extern int word_380CA;
extern int word_380CC;
extern int16 word_380CE;
extern unsigned int word_380D0;
extern int16 word_380D8;
extern uint8 byte_380DA[];
extern char byte_380DD;
extern int16 word_380E0;
extern int16 word_380E2;
extern char a256left_pic[];
extern char a256right_pic[];
extern char a256rear_pic[];
extern char aLeft_pic[];
extern char aRight_pic[];
extern char aRear_pic[];
extern int16 word_38126;
extern int16 unk_38128[];
extern int16 word_38152;
extern uint8 aFiring[];
extern int16 word_3815E;
extern uint8 aFiredBy[];
extern char aTakingOff[];
extern char aDash[];
extern char aColon[];
extern uint8 aEmpty_5950[];
extern uint8 aMisses[];
extern uint8 aDestroyedBy[];
extern uint8 aDestroyedBy_0[];
extern uint8 aGroundImpact[];
extern uint8 aHitBy[];
extern uint8 aIneffective[];
extern uint8 aHitBy_0[];
extern uint8 aA[];
extern char aSecond_Target[];
extern char aPrimaryTarget_0[];
extern char a0[];
extern char aFired[];
extern int16 word_38202;
extern int16 unk_3831E[];
extern int16 *off_38334;
extern int16 unk_38336[];
extern int16 *off_3834C;
extern int16 word_3834E[];
extern int16 *off_38364;
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
extern int16 byte_383E5;
extern int16 var_524;
extern int16 var_525;
extern int16 var_526;
extern int16 var_527;
extern int16 var_528;
extern int16 var_529;
extern int16 var_542;
extern char var_543;
extern int16 var_544;
extern int16 var_545;
extern char var_550;
extern int16 var_547;
extern uint16 var_548;
extern int16 var_549;
extern int16 var_552;
extern int16 var_588;
extern int16 var_589;
extern int16 var_590;
extern int16 word_383EA;
extern int16 radarRange;
extern int16 word_383EE;
extern int16 word_383F0;
extern int16 word_383F2;
extern int16 word_383F4;
extern char aStallWarning[];
extern char aAccel[];
extern char aTraining[];
extern char aAutopilot[];
extern char aPressAnyKeyToP[];
extern uint8 aTac[];
extern char aTrackcam[];
extern char aAhead[];
extern char aRear[];
extern char aRight[];
extern char aLeft[];
extern char aMap[];
extern int16 word_38460;
extern uint8 aDestroyedByGun[];
extern uint8 aHitByGunfire[];
extern uint8 aDestroyedByG_0[];
extern char aAt_0[];
extern uint8 aPrimaryTarget[];
extern uint8 aSecondaryTarget[];
extern uint8 aNoTarget[];
extern uint8 aNoTarget_0[];
extern char aMissileLock[];
extern char aRange[];
extern char aDot[];
extern char aKm[];
extern char a_3d3_0[];
extern char aRb_4[];
extern char aOpenErrorOn_3d3_0[];
extern char byte_3850E;
extern char a15flt_xxx[];
extern char aBrg[];
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
extern uint8 aNotAvailable[];
extern uint8 aArmed[];
extern uint8 byte_3862A;
extern uint8 byte_3862B;
extern uint8 picBuf[];
extern uint8 aFileNotFound[];
extern uint8 aNoFileBuffersAvailabl[];
extern uint8 aOpenError[];
extern uint8 aFileClosingError[];
extern uint8 aReadError[];
extern uint8 aWriteError[];
extern int16 word_3888E;
extern int16 word_38890;
extern int16 fileReadPos;
extern int16 tmpFileHandle;
extern uint8 picDecodedRowBuf[];
extern int16 word_389D8;
extern int16 picPageIndex;
extern int16 picRowOffset;
extern int16 word_389E0;
extern int16 picReadFromFilePtr;
extern int16 word_389E4;
extern int16 word_389E6;
extern int16 off_389E8;
extern int16 word_389EA;
extern int16 word_38A3A;
extern uint8 aC_file_info[];
extern int32 dword_38A49;
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
extern int32 dword_38A88;
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
extern int32 dword_38BE8;
extern int32 dword_38BEC;
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
extern uint8 far *farPointer;
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
extern int16 flt15_word1;
extern uint8 flt15_buf1[];
extern size_t flt15_size;
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
extern char strBuf[];
extern uint8 byte_38F8C;
extern uint8 byte_38F8D[];
extern int16 word_38FC4;
extern int16 word_38FC6;
extern int16 word_38FC8;
extern int16 word_38FCC;
extern int16 word_38FCE;
extern uint8 unk_38FD0[];
extern int word_38FDA;
extern int word_38FDC;
extern int16 word_38FDE;
extern int16 word_38FE0;
extern uint8 far *dword_38FE2;
extern FILE *fileHandle;
extern int16 word_38FE8;
extern int16 word_38FEA;
extern int16 word_38FEC;
extern int16 word_38FEE;
extern struct Game far *gameData;
extern int16 word_38FF6;
extern int16 word_38FF8;
extern int16 word_38FFA;
extern int16 word_38FFC;
extern uint8 buf4_3dg[];
extern int16 planeFlags;
extern int16 word_39200;
extern uint8 buf3_3dg[];
extern int16 word_39402;
extern int16 word_39604;
extern int word_39606;
extern uint8 buf2_3dg[];
extern int16* word_39808;
extern uint8 buf1_3dg[];
extern char byte_3995A;
extern int16 word_3995C;
extern uint8 buf_3dt[]; // #define MAX_TILE_DATA
extern int16 word_3A8FE;
extern uint8 byte_3A900[];
extern int16 word_3A940;
extern int word_3A944;
extern int16 word_3A946;
extern int16 unk_3A948[];
extern struct ViewSnapshot stru_3A95A[];
extern int16 word_3AA5A;
extern int16 word_3AA5C;
extern struct MapTarget stru_3AA5E[];
extern int16 word_3AF0C;
extern uint8 buf3d3_1[];
extern int16 word_3AFA4;
extern int16 word_3AFA6;
extern int16 word_3AFA8;
extern int16 word_3AFAA;
extern uint8 byte_3AFAC[];
extern int16 word_3B0AC;
extern uint8 buf3d3_2[];
extern int16 word_3B144;
extern int16 word_3B146;
extern int16 word_3B148;
extern int word_3B14A[];
extern int16 word_3B14C;
extern int16 word_3B158;
extern int16 word_3B15A;
extern int16 word_3B15E;
extern uint8 buf3d3_3[];
extern int32 dword_3B1FE;
extern struct SimObject stru_3B202[];
extern int16 word_3B22C;
extern int32 word_3B22E;
extern int32 word_3B232;
extern int16 word_3B236;
extern uint8 byte_3B23E[];
extern int16 word_3B240;
extern int16 word_3B4D2;
extern int32 dword_3B4D4;
extern int16 word_3B4D8;
extern int16 word_3B4DA;
extern int16 word_3B4DC;
extern int16 word_3B4DE;
extern int16 word_3B4E0;
extern uint8 hercFlag;
extern int16 word_3B4E4;
extern struct Unknown3B4E6Record8 byte_3B4E6[]; // overlaps the following bytes with structs
extern uint8 byte_3B4E7;
extern uint8 byte_3B4E8;
extern uint8 byte_3B4E9;
extern int16 word_3B4EA;
extern uint8 byte_3B4EC[];
extern int16 word_3B5D6;
extern int32 dword_3B7DA;
extern int16 word_3B7DE;
extern int16 word_3B7E0;
extern int16 word_3B7E2;
extern int16 word_3B7E4;
extern int16 word_3B7E6;
extern int16 word_3B7E8;
extern int16 word_3B7EA;
extern struct Matrix3dEntry7 *word_3B7EC;
extern uint8 byte_3B7EE;
extern uint8 byte_3B7EF;
extern uint8 byte_3B7F0;
extern uint8 byte_3B7F1[];
extern int32 dword_3B7F8;
extern uint8 byte_3B7FC[];
extern int16 word_3BE3C;
extern uint8 byte_3BE3E[];
extern int16 word_3BE7E;
extern uint8 byte_3BE80[];
extern int16 keyValue;
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
extern int16 sign3d3;
extern int16 word_3BECC;
extern int16 word_3BECE;
extern int16 word_3BED0;
extern int16 word_3BED2;
extern int16 word_3BED4;
extern int16 word_3BED6;
extern uint8 byte_3BED8[];
extern int16 word_3BF3C;
extern int16 word_3BF3E;
extern char tempString[80];
extern int16 word_3BF90;
extern union REGS regs;
extern uint8 byte_3BF93[];
extern uint8 unk_3BF95;
extern int16 unk_3BF96;
extern int16 unk_3BF98;
extern int16 word_3BFA0;
extern int16 word_3BFA2;
#define UNIT_STATE_COUNT 0x64
extern uint8 byte_3BFA4[UNIT_STATE_COUNT];
extern int16 word_3C008;
extern int16 word_3C00A;
extern int16 word_3C00C;
extern int word_3C00E;
extern int16 flagFarToNear;
extern int16 keyScancode;
extern int16 word_3C014;
extern int16 word_3C016;
extern int16 word_3C018;
extern int16 word_3C01A;
extern int32 dword_3C01C;
extern int16 word_3C020;
extern int32 dword_3C024;
extern int16 word_3C028;
extern uint8 byte_3C02A[];
extern int16 word_3C02C;
extern int16 word_3C02E;
extern char unk_3C030[];
extern int16 word_3C03A;
extern int16 word_3C03E;
extern int16 word_3C040;
extern int16 word_3C042;
extern int16 word_3C044;
extern int16 word_3C046;
extern int16 word_3C048;
extern char string_3C04A[80];
extern int16 word_3C09A;
extern int16 word_3C09C;
extern int16 word_3C09E;
extern int16 word_3C0A0;
extern char* word_3C0A2[];
extern int16 word_3C16A;
extern int16 word_3C16C;
extern char byte_3C16E[];
extern int16 word_3C45C;
extern int16 word_3C45E;
extern struct Matrix3dEntry7 *matrix3dt_2[5][32];
extern char byte_3C5A0;
extern int16 word_3C5A2;
extern int16 word_3C5A4;
extern int16 word_3C5A6;
extern struct Matrix3dEntry7 *word_3C5A8;
extern int16 word_3C5AA;
extern int16 word_3C5AC;
extern int16 word_3C5AE;
extern int16 word_3C5B0;
extern int16 word_3C5B2;
extern int16 word_3C5B4;
extern int16 word_3C5B6;
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
extern int16 gfxBufPtr;
extern int16 word_3C8B6;
extern int16 word_3C8B8;
extern int16 word_3C8BA;
extern int16 word_3C8BC;
extern int16 word_3C8BE;
extern int16 word_3C8C0;
extern int16 word_3C8C2;
extern size_t size3d3_7;
extern int16 word_339B4[];
extern int16 word_3419C[];
extern int16 var_218;
extern int16 var_219;
extern int16 var_279;
extern int8 var_83[];
extern int16 var_282;
extern int16 var_220;
extern int16 *var_564;
extern int16 *var_565;
extern int16 var_569;
extern int16 var_570;
extern int16 var_571;
extern int16 var_572;
extern int16 var_573;
extern int16 var_574;
extern int16 var_575;
extern int16 var_576;
extern int16 var_577;
extern int16 var_578;
extern int16 var_579;
extern int16 var_580;
extern int16 var_581;
extern int16 var_582;
extern int16 var_583;
extern int16 var_584;
extern uint8 var_585;
extern uint8 var_586;
extern int16 var_591;
extern int8 var_456;
extern uint16 var_383;
extern int16 var_673;
extern int16 var_592;
extern int16 *var_134;
extern int16 var_135;
extern int16 var_224;
extern int16 var_225;
extern int16 var_226;
extern int16 var_227;
extern int16 var_595;
extern int16 var_597;
extern uint8 var_594;
extern int16 var_600;
extern int16 var_349;
extern int16 var_350;
#define var_351 (*(int16 *)((char *)&var_349 + 6))
#define var_352 (*(int16 *)((char *)&var_349 + 8))
#define var_353 (*(int16 *)((char *)&var_349 + 10))
#define var_354 (*(int16 *)((char *)&var_349 + 12))
extern int16 var_141;
extern int16 var_654;
extern int16 var_657;
extern int16 var_658;
extern int16 var_659;
extern int16 var_660;
extern int16 var_661;
extern int16 var_662;
extern int16 var_663;
extern int16 var_664;
extern int16 var_669;
extern int16 var_670;
extern int16 var_671;
extern int16 var_672;
extern int16 var_674;
extern int16 *var_568;
extern int16 var_680;
extern int16 var_681;
extern int16 var_682;
extern int16 var_683;
extern int16 var_684;
extern int16 var_685;
extern int16 var_686;
extern uint8 var_730;
extern uint8 var_727;
extern uint8 var_732;
extern uint16 var_810;
extern uint16 var_811;
extern int16 var_143;
extern uint8 var_190;
extern int16 var_194;
extern int16 var_195;
extern int16 var_196;
extern int16 var_197;
extern int16 var_198;
extern char far *var_200;
extern int16 var_202;
extern int16 var_203;
extern int16 var_204;
extern uint8 var_215;
extern int16 var_216;
extern uint8 var_217;
extern int16 var_256;
extern int16 var_257;
extern int16 var_258;
extern int16 var_259;
extern int16 var_260;
extern int16 var_255;
extern int16 var_261;
extern int16 var_315;
extern uint8 var_316;
extern int16 var_665;
extern int16 var_666;

#if defined(MSDOS)
extern int rand();
#endif
extern long _aNlmul(long, long);

extern int16 var_47;
extern int16 var_48;
extern int16 var_49;

#endif // F15_SE2_EGAME
