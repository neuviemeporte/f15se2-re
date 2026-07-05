#ifndef F15_SE2_EGDATA
#define F15_SE2_EGDATA
/* Public egame globals (defined in egdata.c / egslots.asm). */
#include "inttype.h"
#include "struct.h"
#include "comm.h"
#include "pointers.h"
#include <stdio.h>
#include "egtypes.h"

/*
 * The 3D world data lives in one contiguous far buffer. The aircraft-model region
 * (g_aircraftModels) sits AIRCRAFT_MODELS_OFFSET bytes into the region/object buffer
 * (g_world3dData): shapeDataOffset() (egmath.c) addresses models as the offset
 * difference &g_aircraftModels[off] - g_world3dData and drawWorldObject() re-adds it, so the
 * round-trip only resolves at that exact spacing.
 *
 * Reference build (asm): g_world3dData and g_aircraftModels are two distinct symbols pinned
 * at the right offsets by egfarbu2.asm, matching the original's codegen (which loads
 * the model segment dynamically because the two symbols are independent).
 *
 * Asm-free builds (NO_ASM / 64-bit): g_world3dData is a single contiguous buffer
 * (egfarbuf.c) and g_aircraftModels is a view into it at the fixed offset. The spacing is
 * then guaranteed by construction and is correct under both the 16-bit far model and
 * the flat 64-bit layout, with no dependence on linker placement.
 */
#ifdef BUGFIX
extern char FAR g_world3dData[];
#else
extern uint8 FAR g_world3dData[];
#endif
#ifdef NO_ASM
#define g_aircraftModels (g_world3dData + AIRCRAFT_MODELS_OFFSET)
#else
extern char FAR g_aircraftModels[];
#endif

extern struct SpriteParams gaugeSpriteParams;
extern struct SpriteParams blitSpriteParams;
extern struct BulletTrack bulletTracks[20];
extern uint8 g_dacSupported;
extern uint8 exitCode;
extern int16 gfxModeUnset;
extern int16 f15DgtlResult;
extern char *regnStr;
extern const char *scenarioPlh[];
extern int16 allocSize;
extern int16 g_sphereColor;
extern int16 g_viewCenterX;
extern int16 g_viewCenterY;
extern const int16 g_sphereRingTable[16];
extern struct Waypoint waypoints[4];
extern int16 waypointIndex;
extern int16 g_unusedWaypointTail;
extern const struct Weapon aNone[];
extern struct AircraftType aircraftTypes[]; /* 32-byte type records */
extern struct Sam sams[39];
extern int16 g_bombDamageMask;
extern int16 g_fuelRemaining;
extern int16 g_eventTimers[];
extern struct MissileSpec missleSpec[];
extern int16 missileSpecIndex;
extern int16 g_gunAmmo;
extern int16 g_autopilotAltitude;
extern int16 g_missionStatus;
extern int16 g_difficultyTier;
extern int16 g_nightMode;
extern int16 g_inputDisabled;
extern int16 g_hudVisible;
extern int16 g_frameRateScaling;
extern struct Missile missiles[20];
extern struct MapEvent mapEvents[]; /* 12-byte marker records */
extern struct Particle g_particles[8];
extern int16 g_smokeParticleSlot;
extern const int16 g_maneuverTable[3][8][8];
extern struct Projectile g_projectiles[];
extern int16 g_threatScopeRange;
extern int16 g_trackedEnemyIdx;
extern int16 frameTick;
extern int16 g_autopilotEngaged;
extern int16 g_gearDownArmed;
extern int16 g_destroyedCueDeadline;
extern int16 g_threatActiveTimer;
extern int16 g_airTargetLock;
extern int16 g_groundTargetLock;
extern int16 g_smokeSourceIdx;
extern int16 g_scopeSweepTimer;
extern int16 g_threatToneLevel;
extern int16 g_padlockAircraft;
extern int16 g_externalCamDist;
extern int16 g_prevThreatIndex;
extern int16 g_inLandingCorridor;
extern int16 g_render3DTiles;
extern int16 g_landingDoneFlag;
extern uint16 g_frameRateAccum;
extern int16 g_timeAccelMode;
extern int16 g_directorEventDeadline;
extern int16 g_directorMode;
extern int16 g_resupplyCount;
extern int16 g_autoLandingActive;
extern int16 g_landingTimer;
extern const int16 g_weaponMarkerBoxX[];
extern int16 g_weaponMarkerSel;
extern uint8 g_renderPageToggle;
extern const uint8 g_colorPalettes[];
extern const int16 g_dirGridOffsets[];
extern struct NeighborSampling g_neighborSampling;
extern const int16 g_lodObjectCount[];
extern const int16 g_lodGridDim[];
extern size_t size3d3;
extern uint16 buf3d3[];
extern uint16 size3d3_2;
extern int16 sign3dt;
extern uint16 sizes3dt[];
extern uint16 matrix3dt[5][32];
extern int16 g_modelOffsetTable[];
extern size_t size3d3_4;
extern size_t size3d3_5;
extern size_t size3d3_6;
extern size_t size3d3_3;
extern int16 sign3dg;
extern const uint8 g_theaterGrids[];
extern int16 g_unusedLoadDoneFlag;
extern const int16 g_mapTileLodTable[];
extern uint8 g_horizonGroundColor;
extern uint8 colorLut[];
extern int16 g_overlayBaseX[];
extern int16 g_overlayBaseY[];
extern int16 g_objRenderMode;
extern int16 g_viewRotMatrix[9];
extern struct VtxScratch vtxScratch;
extern uint8 flt15_buf2[];
extern const int16 g_angleLut[];
extern int16 g_clipMaxX;
extern int16 g_clipMaxY;
extern int16 g_lineX1;
extern int16 g_lineX2;
extern int16 g_lineY1;
extern int16 g_lineY2;
extern uint8 g_frameSyncPending;
extern uint8 g_timerTickByte[0x21A];
extern uint8 g_halfScaleRender;
extern uint8 g_hudDrawnFlag;
extern uint8 joyData[];
extern uint8 joyAxes[];
extern uint8 g_joyRawX;
extern uint8 g_joyRawY;
extern const uint8 g_rollGeeTable[];
extern int16 g_orientMatrix[];
extern int16 g_yawMatrix[9];
extern int16 g_pitchMatrix[9];
extern int16 g_rollMatrix[9];
extern int16 g_matrixScratch[];
extern int16 g_ourHead;
extern int16 g_ourPitch;
extern int16 g_ourRoll;
/* g_viewZ: altitude-Z. int16 for most TUs; egtarget.c reads the same storage
   as uint16 (it #defines G_VIEWZ_UNSIGNED before including this header). */
#ifdef G_VIEWZ_UNSIGNED
extern uint16 g_viewZ;
#else
extern int16 g_viewZ;
#endif
extern uint16 g_altitude;
extern char g_orientationDirty;
extern int16 g_setThrust;
extern int16 g_joyCalibTimer;
extern int16 g_hudBottomY;
extern const int16 g_rearViewShape[];
extern int16 g_lastViewKey;
extern const int16 ammoNumX[];
extern int16 g_tacmapIndicators[];
extern int16 *g_pageFront;
extern int16 *g_pageBack;
extern int16 *g_pageOffscreen;
extern int16 g_mapZoomLevel;
extern char g_rollWasNonzero;
extern int16 g_rotationCounter;
extern int16 g_lastSpawnTick;
extern int16 g_radarScopeRange;
extern int16 g_mapCenterX;
extern int16 g_mapCenterY;
extern int16 g_hudMsgTimer;
extern int16 g_dirMsgTimer;
extern uint8 g_extraScaleShift;
extern char a15flt_xxx[];
extern int16 g_axisInputAccum[];
extern const int16 voiceCueThresholds[];
extern uint8 FAR *farPointer;
extern int16 flt15HeaderWord;
extern uint8 flt15_buf1[];
extern size_t flt15_size;
extern int16 g_unusedFrameVal;
extern int16 g_scopeArcColor;
extern char strBuf[];
extern uint8 g_strTruncDot;
extern uint8 g_strTruncTerm[];
extern int16 g_rollPitchTrim;
extern int16 g_sphereTiltZ;
extern int16 g_scopeCenterX;
extern int16 g_scopeCenterY;
extern int16 g_extViewPitch;
extern char g_geeStringBuf[];
extern int16 g_gees;
extern int16 g_detailLevel;
extern int16 g_autoCrashDive;
extern int16 g_missionTick;
extern uint8 FAR *g_floppyMotorPtr;
extern FILE *fileHandle;
extern int16 g_gunFiredFlag;
extern int16 g_damageTakenFlag;
extern int16 g_threatRefHead;
extern int16 g_nearestThreatRange;
extern struct Game FAR *gameData;
extern int16 g_finalThreatScore;
extern int16 g_tileEntryCount;
extern int16 g_targetEntityCount;
extern int16 g_attackRangeX;
extern uint8 buf4_3dg[];
extern int16 g_playerPlaneFlags;
extern int16 g_attackRangeY;
extern uint8 buf3_3dg[];
extern int16 g_targetInHudFlag;
extern int16 g_lockedTargetKilled;
extern int16 g_hitEffectTimer;
extern uint8 buf2_3dg[];
extern struct TileObject *g_nearestTileObj;
extern uint8 buf1_3dg[];
extern char g_savedPosVisible;
extern int16 g_threatDisplayTtl;
extern uint8 buf_3dt[]; // #define MAX_TILE_DATA
extern int16 g_stallSpeed;
extern uint8 g_topLodGrid[];
extern int16 g_lastMissileSlot;
extern int16 g_velocity;
extern int16 g_enemyThreatCount;
extern int16 g_camRotMatrix[];
extern struct ViewSnapshot g_viewSnapshotRing[];
extern int16 g_knots;
extern struct GroundTargetTable g_planeTable;
extern int16 g_unusedViewXSnap;
extern uint8 buf3d3_1[];
extern int16 g_bulletTrackCount;
extern int16 g_thrust;
extern int16 g_northSouthSign;
extern int16 g_unusedViewYSnap;
extern uint8 g_mapCellFlags[0x100];
extern int16 g_threatTimerInit;
extern uint8 buf3d3_2[];
extern struct TargetSlot g_targetSlots[2];
extern uint8 buf3d3_3[];
extern int32 g_camEyeX;
extern struct SimObject g_simObjects[];
extern int16 g_aamLockCooldown;
extern int32 g_camEyeY;
extern int16 g_threatRefX;
extern int16 g_liftForce;
extern int16 g_wreckFallVel;
extern int16 g_camEyeZ;
extern int16 g_threatRefY;
extern uint8 hercFlag;
extern int16 g_viewRoll;
extern struct DynTileOverride g_dynTileEntries[]; // overlaps the following bytes with structs
extern int16 g_threatRefZ;
extern int32 g_ViewX;
extern int16 g_savedSamTtl;
extern struct TileObject nearestTile;
extern int32 g_ViewY;
extern struct ReplayLog g_replayLog;
extern int16 g_ejectState;
extern uint8 g_modelVertY[];
extern int16 g_scopeArcRange;
extern uint8 g_modelVertZ[];
extern int16 keyValue;
extern int16 g_waypointBearing;
extern int16 g_viewPitch;
extern int16 g_threatLabelTarget;
extern int16 g_skyColorIndex;
extern int16 g_sphereRingRadii[];
extern int16 g_hitMapX;
extern int16 g_groundAltitude;
extern int16 g_viewX_;
extern int16 g_wreckX;
extern uint8 g_waterTargetId[];
extern int16 g_hitMapY;
extern int16 sign3d3;
extern int16 g_initPhase;
extern int16 g_hitAlt;
extern int16 g_viewY_;
extern int16 g_planeCount;
extern int16 g_unusedEventHist0;
extern int16 g_wreckY;
extern uint8 g_tileKillTally[0x64];
extern int16 g_scopeArcStart;
extern int16 g_scopeArcEnd;
extern char tempString[80];
extern int16 g_gunHits;
extern union REGS regs;
extern uint8 g_biosPixelPage;
extern int16 g_biosPixelX;
extern int16 g_biosPixelY;
extern int16 g_unusedEventHist1;
extern int16 g_wreckAlt;
extern uint8 g_shapeTargetCategory[UNIT_STATE_COUNT];
extern int16 g_flightPathMarkerY;
extern int16 g_aamLockActive;
extern int16 g_unusedSavedWord;
extern int16 g_rollInput;
extern int16 flagFarToNear;
extern int16 keyScancode;
extern int16 g_unusedEventHist2;
extern int16 g_projDepth;
extern int16 g_scopeClipLeft;
extern int16 g_scopeClipTop;
extern int32 g_viewTargetX;
extern int16 g_loftTargetIdx;
extern int32 g_viewTargetY;
extern int16 g_crashCamX;
extern uint8 g_landTargetId[];
extern int16 g_viewTargetAlt;
extern int16 g_viewTargetObj;
extern char g_itoaScratch[];
extern int16 g_crashCamY;
extern int16 g_prevScopeRange;
extern int16 g_crashCamZ;
extern int16 g_tileZoomShift;
extern int16 g_enemyAirRemaining;
extern int16 g_groundUnitCount;
extern int16 g_enemyGroundRemaining;
extern char string_3C04A[80];
extern int16 g_mapMode;
extern int16 g_enemyAlertFlag;
extern int16 g_activePanelMode;
extern int16 g_targetLeadAngle;
extern char *g_targetNameTable[];
extern int16 g_closestThreatIndex;
extern int16 g_curLod;
extern char g_stringPool[0x2EE];
extern int16 g_currentWeaponType;
extern int16 g_scopeClipRight;
extern struct TileSceneObject *matrix3dt_2[5][32];
extern char g_drawPage;
extern int16 g_scopeClipBottom;
extern int16 g_pitchInput;
extern int16 g_cornerSpeed;
extern struct TileSceneObject *g_curTileEntry;
extern int16 g_viewHeading;
extern int16 *g_overlayCenterX;
extern int16 g_planeScanCount;
extern uint8 g_highGeeFlag[];
extern int16 *g_overlayCenterY;
extern int16 g_aamSeekerX;
extern struct GameComm FAR *commData;
extern int16 g_threatRadarFlag;
extern int16 g_aamSeekerY;
extern int16 g_jiffiesPerFrame;
extern uint8 g_missionEndedFlag[];
extern int16 g_viewHeadingOffset;
extern int16 gfxBufPtr;
extern int16 g_climbRate;
extern struct Proj3d g_proj3d;
extern size_t size3d3_7;
extern int16 g_viewPosX;
extern int16 g_viewPosY;
extern const int8 g_targetCompatTable[];
extern int16 g_viewPosZ;
extern int16 *g_mapTerrainMode;
extern uint16 g_frameTimingAccum;
extern int16 g_offscreenProjX;
extern int16 *g_viewParams;
extern int16 g_sphereRadius;
extern int16 g_sphereDistZ;
extern int16 g_spherePitch;
extern int16 g_sphereRoll;
extern int16 g_frameSyncWait;
extern int16 g_kbdSensitivity;
extern int16 g_fireCooldown;
extern int16 g_objColorBase;
extern int16 g_eventLogCount;
extern int16 g_objLocalX;
extern int16 g_objLocalY;
extern int16 g_objLocalZ;
extern int16 g_tileEntryIdx;
extern int16 g_tileWorldSize;
extern int16 g_tileGridDim;
extern int16 g_mapOriginX;
extern int16 g_mapOriginY;
extern int16 g_threatSpec;
extern int16 g_activeThreatCount;
extern int16 g_acqRange;
extern int16 g_acqAimY;
extern int16 g_lockToneFlag;
extern int16 g_targetRange;
extern int16 g_unusedHudFlag;
extern int16 g_targetBearing;
extern int16 g_prevKillMarker;
extern int16 g_aamLeadDist;
extern int16 g_axisInput1;
extern int16 *g_targetViewParams;
extern int16 g_trkRange;
extern int16 g_trkBearing;
extern int16 g_trkSize;
extern int16 g_trkScale;
extern int16 g_trkPitch;
extern int16 g_trkRoll;
extern int16 g_rngSeed;
extern uint16 g_wingmanX;
extern uint16 g_wingmanY;
extern uint8 g_objShade;
extern int16 g_lodDistBase;
extern int16 g_lodDistScale;
extern int16 g_lodDistNear;
extern int16 g_lodDistFar;
extern char FAR *g_modelStreamPtr;
extern int16 g_objRelX;
extern int16 g_objRelY;
extern int16 g_objTransform[4];
extern uint8 g_objHasRotation;
extern int16 g_objDistance;
extern int16 g_modelVtxCount;
extern int16 g_modelEdgeCount;
extern int16 g_modelWideVtxFlag;
extern int16 g_vtxSignMaskLo;
extern int16 g_vtxSignMaskHi;
extern int16 g_sortedObjCount;
extern int16 g_spinAngle;
extern int16 g_posVisibleFlag;
extern uint8 g_offscreenRender;
extern int16 g_modelEvenOddBit;
extern int16 g_mapLodIndex;

/* HUD gauge data. */
extern uint8 g_tapeDigitStrip[];
extern uint8 g_compassTapeBuf[];
extern uint8 g_pitchLabelTable[92];
/* HUD tape/sprite descriptor blocks (gfx slot param blocks). */
extern int16 g_tapeText0[11];
extern int16 g_tapeText1[11];
extern int16 g_tapeText2[11];
extern int16 g_tapeText3[11];
extern int16 g_tapeSprite0[15];
extern int16 g_tapeSprite1[15];
extern int16 g_tapeSprite2[15];
extern int16 g_tapeSprite3[15];
/* HUD layout scalars + label scratch */
extern int16 g_tapeOriginX;
extern int16 g_tapeTickPitch;
extern int16 g_speedTapeTickStep;
extern int16 g_altTapeTickStep;
extern int16 g_headingPixPerDeg;
extern int16 g_compassWrapLimit;
extern int16 g_headingModulus;
extern int16 g_headingWrapOffset;
extern int16 g_pitchVtxX0;
extern int16 g_pitchVtxX1;
extern int16 g_pitchVtxX2;
extern int16 g_pitchVtxX3;
extern int16 g_pitchRungVStep;
extern int16 g_pitchDrawX;
extern int16 g_pitchDrawY;
extern int16 g_pitchLabelY;
extern int16 g_pitchLabelX;
extern int16 g_pitchBlitOfs;
extern int16 g_pitchClipMaxX;
extern int16 g_pitchClipMaxY;
extern int16 g_geeReadoutX;
extern int16 g_altRemainder;
extern int16 g_compassScrollIdx;
extern int16 g_compassDrawX;
extern int16 g_tapeRenderX;
extern int16 g_tapeRollOfsB0;
extern int16 g_tapeRollOfsB1;
extern int16 g_tapeRollOfsB2;
extern int16 g_tapeRollOfsB3;
extern int16 g_tapeRollOfsA0;
extern int16 g_tapeRollOfsA1;
extern int16 g_tapeRollOfsA2;
extern int16 g_tapeRollOfsA3;
extern uint8 g_headingBase;
extern uint8 g_tapeCursorBackShift;
extern uint8 g_tapeScaleShift;
extern uint8 g_pitchCenterY;
extern uint8 g_compassMarkerPhase;
extern uint8 g_tapePageCounter;
extern uint8 g_tapeRenderMode;
extern uint8 g_speedLabelBuf[6];
extern uint8 g_altLabelBuf[4];
extern uint8 g_tapeDrawStr[4];

/* VGA DAC palette tables. g_dacGroundPalette is the +0x30 window into dacValues. */
extern const uint8 dacValues1[];
extern uint8 dacValues[];
extern const uint8 otherDacValues[];
extern const uint8 g_dacGroundPaletteSrc[];

#endif /* F15_SE2_EGDATA */
