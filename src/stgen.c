/* Mission generation */
// offsets based on F-15 SE2 v451.03 start.exe (unpacked) MD5: cf6e997ed4582cf82db6ec37d2b1a6fd
#include "struct.h"
#include "stcode.h"
#include "stdata.h"
#include "stgen.h"
#include "stparse.h"
#include "strand.h"
#include "stterr.h"
#include "pointers.h"
#include "comm.h"
#include "debug.h"
#include "const.h"
#include "shared/common.h"

#include <memory.h>
#include <dos.h>
#include <stdarg.h>
#include <time.h>
#include <string.h>
#include <stdio.h>

/* Private helpers for this translation unit. */
void runGenerator();
int findOrPlaceItem(int, int, int);
int itemDistance(int, int);
void positionUnit(int, int);
int approxDistance(int, int);
void parseWorld(const char *);
int calcBearing(int, int);
int setMoveDstComm7A(const char *filename, const char* mode);
void memAppend(void *ptr, int itemsz, int count, FILE* unused);
void doNothing(FILE*);
char *formatGridRef(int16, int16, int16);
int clampValue(int, int, int);

void missionGenerate() {
    TRACE(("missionGenerate(): entering"));
    difficultySaved = gameData->difficulty;
    theaterSaved = gameData->theater & 3;
    flag4Saved = gameData->isCampaignMission;
    TRACE(("missionGenerate(): parsing world %s", worldFiles[gameData->theater]));
    parseWorld(worldFiles[gameData->theater]);
    mystrcpy(regnPlhPtr, plhFiles[gameData->theater]);
    TRACE(("missionGenerate(): parsing grid/terrain"));
    parseGridTerrain();
    TRACE(("missionGenerate(): running generator"));
    runGenerator();
    TRACE(("missionGenerate(): returning"));
}

void runGenerator()
{
  int attempt;
  int totalDist;
  int bearing;
  int missionBits;
  int i;
  int waypointIdx;
  int baseBearing;
  int randChoice;
  int16 swapTmp;
  int16 maxRange;
  int minDist;
  int unitType;
  int16 randIdx;
  int16 baseDist[4];
  int16 randY;
  int idx;
  int matchCount;
  int slot;
  int retryCount;

  TRACE(("runGenerator(): entering"));
  attempt = missionDistAccum = 0;
  minDist = 0xfa;
restart_40a8:
  do {
    TRACE(("runGenerator(): outer, %d", attempt));
    attempt = attempt + 1;
    if (999 < attempt) goto counterMore1k;
    do {
      TRACE(("runGenerator(): inner"));
      if (missionPick != -1) {
        TRACE(("runGenerator(): inner branch 1"));
        randIdx = randMul(targetCoordsCount[missionPick]);
        targets[0].targetIdx = findOrPlaceItem(targetCoordsXPtrs[missionPick][randIdx],
          targetCoordsYPtrs[missionPick][randIdx], 1);
      }
      else {
        TRACE(("runGenerator(): inner branch 2"));
        do {
          TRACE(("runGenerator(): inner branch 2 loop 1"));
          do {
            TRACE(("runGenerator(): inner branch 2 loop 2"));
            randIdx = randMul(0xe0) * 0x80 + 0x840;
            randY = randMul(0xe0) * 0x80 + 0x840;
          } while ((terrainGrid[(randIdx >> 0xb) + ((randY >> 0xb) * 0x10)] & 3) != 0);
        } while ((targets[0].targetIdx = findOrPlaceItem(randIdx,randY,1)) == 0xffff);
      }
      TRACE(("runGenerator(): past inner check 1"));
      if (missionPick == 7) {
        targets[1].targetIdx = findOrPlaceItem(targetCoordsXPtrs[missionPick][randIdx],
          targetCoordsYPtrs[missionPick][randIdx] + 0x28, 2);
      }
      else if (missionPick == 2) {
        randIdx = randIdx * 2 + randMul(2);
        targets[1].targetIdx = findOrPlaceItem(targetCoordsX2Alt[randIdx], targetCoordsY2Alt[randIdx], 2);
      }
      else if (missionPick == 6) {
        randIdx = randMul(6) + randIdx + 1 & 7;
        targets[1].targetIdx = findOrPlaceItem(targetCoordsX6[randIdx], targetCoordsY6[randIdx], 2);
      }
      else {
        do {
          do {
            randIdx = randMul(0xe0) * 0x80 + 0x840;
            randY = randMul(0xe0) * 0x80 + 0x840;
          } while ((terrainGrid[(randIdx >> 0xb) + (randY >> 0xb) * 0x10] & 3) != 0);
          targets[1].targetIdx = findOrPlaceItem(randIdx, randY, 2);
        } while ((targets[1].targetIdx == -1) || ((missionPick == 0 && (worldObjects[targets[1].targetIdx].unitType == 0))));
      }
      TRACE(("runGenerator(): past inner check 2"));
    } while ((targets[0].targetIdx == targets[1].targetIdx) || (itemDistance(targets[0].targetIdx, targets[1].targetIdx) >> 6) > 200);
    TRACE(("runGenerator(): passed inner"));
  } while ((gameData->theater != THEATER_DS) && (worldObjects[targets[0].targetIdx].objectIdx == worldObjects[targets[1].targetIdx].objectIdx));
  TRACE(("runGenerator(): past outer"));
  for (slot = 0; slot < 2; slot++) {
    TRACE(("runGenerator(): loop 2, counter %d", slot));
    baseDist[slot] = 0x7fff;
    for (idx = worldObjectCount; idx < readItemSize; idx++) {
      if (((worldObjects[idx].targetFlags & 0x500) != 0)
        && ((worldObjects[idx].targetFlags & 0x201) != 0)
        && ((worldObjects[idx].targetFlags & 0x800) == 0)) {
        // placed in var_1C in IDA, but this looks like an array, sort out stack layout later
        baseDist[2] = clampValue(itemDistance(targets[slot].targetIdx, idx) + ((worldObjects[idx].targetFlags & 0x100) != 0 ? randMul(100) * 0x40 + 0xc80 : 0), 0, 0x7fff);
        if ((baseDist[2] < 0x7000) && (randMul(0x500) + baseDist[2] < baseDist[slot])) {
          targets[slot].baseIdx = idx;
          baseDist[slot] = baseDist[2];
        }
      }
    }
  }
  TRACE(("runGenerator(): past loop2"));
  if (gameData->theater != THEATER_DS) {
    totalDist = (itemDistance(targets[0].targetIdx, targets[1].targetIdx) >> 6) + (baseDist[0] >> 6) + (baseDist[1] >> 6);
    if (((attempt + 0x2e4 < totalDist) || (totalDist < minDist)) && ((worldObjects[targets[0].baseIdx].targetFlags & 0x200) == 0)) {
      minDist -= 5 - difficultySaved;
      goto restart_40a8;
    }
  }
  else {
    if (baseDist[0] == 0x7fff) {
      if (baseDist[1] == 0x7fff) goto restart_40a8;
      baseDist[0] = baseDist[1];
      targets[0].baseIdx = targets[1].baseIdx;
    }
  }
  TRACE(("runGenerator(): past DS check"));
  for (idx = 0; idx < 2; idx++) {
    TRACE(("runGenerator(): loop3, counter %d", idx));
    targets[idx].missionType = 0;
    for (retryCount = 0; retryCount < 2; retryCount++) {
      matchCount = 0;
      for (slot = 0; slot < 0x38; slot++) {
        if (objectTypeTable[worldObjects[targets[idx].targetIdx].objectIdx & 0x7f] == missionTable[slot].tensionMask
            && strcmp(wldOffsets[targets[idx].targetIdx], aPowCamp) != 0) {
          if ((retryCount != 0) && (matchCount == randChoice)) {
            targets[idx].missionType = missionTable[slot].theaterMask;
            targets[idx].missionNum = slot;
            targets[idx].missionCode = missionTable[slot].missionType;
            if (missionTable[slot].objectFlag > 0) {
              targets[idx].missionCode += (missionTable[slot].objectFlag << 8) ;
            }
          }
          matchCount++;
        }
      }
      randChoice = randMul(matchCount);
    }
  }
  TRACE(("runGenerator(): past loop3"));
  if ((targets[0].missionType == 0) || (targets[1].missionType == 0)) {
    TRACE(("runGenerator(): restart 1"));
    goto restart_40a8;
  }
  if ((baseDist[0] < baseDist[1]) && (missionPick == -1)) {
    swapTmp = targets[0].targetIdx;
    targets[0].targetIdx = targets[1].targetIdx;
    targets[1].targetIdx = swapTmp;
    swapTmp = targets[0].missionType;
    targets[0].missionType = targets[1].missionType;
    targets[1].missionType = swapTmp;
    swapTmp = targets[0].baseIdx;
    targets[0].baseIdx = targets[1].baseIdx;
    targets[1].baseIdx = swapTmp;
    swapTmp = targets[0].missionNum;
    targets[0].missionNum = targets[1].missionNum;
    targets[1].missionNum = swapTmp;
    swapTmp = targets[0].missionCode;
    targets[0].missionCode = targets[1].missionCode;
    targets[1].missionCode = swapTmp;
    swapTmp = baseDist[0];
    baseDist[0] = baseDist[1];
    baseDist[1] = swapTmp;
  }
  if (targets[0].missionType == 4) {
    TRACE(("runGenerator(): restart2"));
    goto restart_40a8;
  }
  TRACE(("runGenerator(): past restart checks"));
  escortMissionFlag = 0xffff;
  if (missionTable[targets[0].missionNum].objectFlag < 0) { //459e
    flightUnits[0].planeType = -missionTable[targets[0].missionNum].objectFlag;
  }
  if (escortMissionFlag == 0) {
    flightUnits[0].fuel = DEFAULT_FUEL;
  }
  for (idx = 0; idx < 2; idx++) {
    TRACE(("runGenerator(): loop4, counter %d", idx));
    mystrcpy(targets[idx].coord, getItemCoordStr(targets[idx].targetIdx));
    if (targets[idx].targetIdx < FIRST_REAL_ITEM) {
      swapTmp = 0x7fff;
      for (slot = FIRST_REAL_ITEM; slot < readItemSize; slot++) {
        if ((worldObjects[slot].targetFlags & 0x500) == 0
            && itemDistance(slot, targets[idx].targetIdx) < swapTmp
            && worldObjects[slot].unitRef != 0) {
          swapTmp = itemDistance(slot, targets[idx].targetIdx);
          worldObjects[targets[idx].targetIdx].unitRef = worldObjects[slot].unitRef;
        }
      }
    }
  }
  TRACE(("runGenerator(): past loop4"));
  targets[0].distance = missionDistAccum >> 4;
counterMore1k:
  TRACE(("runGenerator(): counterMore1k"));
  baseXPrecise = (uint32)(worldObjects[targets[0].baseIdx].x_coord) << WORLD_COORD_SHIFT;
  /*
  Assigns the following values to made-up stack variables:
  var_34 = (long)((word_1C830 & 0x200) ? 0 : 0x708);
  var_30 = 0x8000 - (long)word_1C82C;
  example step-through values:
  1) DX:AX = 0:0708 (1800)
     BX:CX = 0:42c0 (17088)
  2) BX:CX = 0:3d40 (15680 = 32768 - 17088)
  6) DX:AX = 7:a800 (501760 = 15680 << 5)
  7) DX:AX = 7:a0f8 (499960 = 501760 - 1800)
  */
  baseYPrecise = ((0x8000 - (int32)(worldObjects[targets[0].baseIdx].y_coord)) << WORLD_COORD_SHIFT) - (int32)((worldObjects[targets[0].baseIdx].targetFlags & 0x200) ? 0 : 0x708);
  missionTargetX = worldObjects[targets[0].targetIdx].x_coord;
  missionTargetY = worldObjects[targets[0].targetIdx].y_coord;
  missionMidX = (worldObjects[targets[0].baseIdx].x_coord / 2) + (missionTargetX / 2);
  missionMidY = (worldObjects[targets[0].baseIdx].y_coord / 2) + (missionTargetY / 2);
  missionBase2X = worldObjects[targets[1].baseIdx].x_coord;
  missionBase2Y = worldObjects[targets[1].baseIdx].y_coord;
  missionTarget2X = worldObjects[targets[1].targetIdx].x_coord;
  missionTarget2Y = worldObjects[targets[1].targetIdx].y_coord;
  if (missionPick == 2) {
    missionTarget2X += (rand() & 0x1000) - 0x800;
    missionTarget2Y += (rand() & 0x1000) - 0x800;
  }
  if (targets[0].missionCode & 0x10) {
    missionTargetX = ((missionTargetX >> 0xa) << 0xa) + 0x200;
    missionTargetY = ((missionTargetY >> 0xa) << 0xa) + 0x200;
  }
  for (idx = 0; idx < flightUnitCount - 4; idx++) {
    TRACE(("runGenerator(): loop5, counter %d", idx));
    if ((flightUnits[idx].flags & 0x80) != 0) {
      maxRange = (baseDist[0] / 4) * (4 - difficultySaved);
      if ((flightUnits[idx].flags & 0x40) != 0) {
        maxRange = baseDist[0] << 1;
      }
      do {
        baseDist[2] = randMul(worldObjectCount - FIRST_REAL_ITEM) + FIRST_REAL_ITEM;
      } while ((worldObjects[baseDist[2]].targetFlags & 0x100) || approxDistance(missionMidX - worldObjects[baseDist[2]].x_coord, missionMidY - worldObjects[baseDist[2]].y_coord) > (maxRange += 0x10));
      positionUnit(idx, baseDist[2]);
      maxRange = 0x3000;
      baseBearing = calcBearing(worldObjects[targets[0].baseIdx].x_coord - flightUnits[idx].x, flightUnits[idx].y - worldObjects[targets[0].baseIdx].y_coord);
      for (slot = 0; slot < 8; slot++) {
        waypointIdx = randMul(worldObjectCount) + 1;
        if ((worldObjects[waypointIdx].targetFlags & 0x400) == 0) {
          bearing = calcBearing(worldObjects[waypointIdx].x_coord - flightUnits[idx].x, flightUnits[idx].y - worldObjects[waypointIdx].y_coord);
          if (abs(baseBearing - bearing) < maxRange) {
            maxRange = abs(baseBearing - bearing);
            flightUnits[idx].waypointIdx = waypointIdx;
            break;
          }
        }
      }
    }
    if (((flightUnits[idx].flags & 0x100) != 0) && (escortMissionFlag != -1)) {
      positionUnit(idx, playerStartLoc);
      flightUnits[idx].fuel = DEFAULT_FUEL;
    }
    if (idx != 0) {
      baseDist[2] = 0;
      do {
        waypointIdx = randMul(worldObjectCount - FIRST_REAL_ITEM) + FIRST_REAL_ITEM;
      } while ((((worldObjects[waypointIdx].targetFlags & 0x801) != 1) || (worldObjects[waypointIdx].patrolCount != 0)) && baseDist[2]++ < 20);
      worldObjects[waypointIdx].occupantType = flightUnits[idx].planeType;
      worldObjects[waypointIdx].patrolCount = randMul(theaterSaved + 1) + 1;
    }
  }
  TRACE(("runGenerator(): past loop5"));
  for (idx = 0; idx < groundUnitCount; idx++) {
    TRACE(("runGenerator(): loop6, counter %d", idx));
    unitType = worldObjects[idx].unitType;
    if ((unitType != 0) && (unitType != 21)) {
      switch((gameData->isCampaignMission != 0) + randMul(5) + difficultySaved) {
      case 0:
      case 1:
      case 3:
        unitType = unitTypeRemapTable[unitType].downgrade;
      case 2:
      case 4:
      case 6:
        break;
      case 5:
      case 7:
      case 8:
        unitType = unitTypeRemapTable[unitType].upgrade;
        break;
      }
      worldObjects[idx].unitType = unitType;
      if (((worldObjects[idx].targetFlags & 8) != 0) && gameData->isCampaignMission + difficultySaved + 2 < randMul(10)) {
        worldObjects[idx].unitType = 0;
      }
    }
  }
  TRACE(("runGenerator(): past loop6"));
  for (randIdx = 0; randIdx < 0x10; randIdx++) {
    for (randY = 0; randY < 0x10; randY++) {
      if (((terrainGrid[randY + randIdx * 0x10] & 0x10) != 0) && randMul(5) >= difficultySaved) {
        terrainGrid[randY + randIdx * 0x10] &= 0xef;
      }
    }
  }
  TRACE(("runGenerator(): past loop7"));
  commData->weaponType[1] = 1;
  commData->weaponType[2] = 5;
  commData->weaponType[0] = 0;
  if (gameData->theater == THEATER_DS) {
    commData->weaponType[1] = 3;
    if (missionPick != -1) {
      commData->weaponType[2] = missionPickType[missionPick];
    }
  }
  i = 0;
  for (idx = 0; idx < 3; idx++) {
    TRACE(("runGenerator(): loop8, counter %d", idx));
    commData->weaponCount[idx] = weaponLoadouts[commData->weaponType[idx]].qty;
  }
  TRACE(("runGenerator(): past loop8"));
  missionBits = targets[0].missionNum + targets[1].missionNum;
  nightMissionFlag = ((uint8)missionBits & 3) == 0;
  missionBits = (missionBits & 0xf) << 8;
  if ((targets[0].missionType == 1) || (targets[1].missionType == 1)) {
    nightMissionFlag = 0;
  }
  if ((targets[0].missionType == 4) || (targets[1].missionType == 4)) {
    nightMissionFlag = 1;
  }
  missionDistAccum -= (missionBits + missionDistAccum) % 0x96;
  TRACE(("runGenerator(): exiting"));
}

int findOrPlaceItem(int wx, int wy, int slot) {
    int objIdx;
    if ((nearestTerrainResult = findNearestTerrain((int32)wx << WORLD_COORD_SHIFT, (0x8000 - (int32)wy) << WORLD_COORD_SHIFT)) != NULL) {
        wx = ((int32*)nearestTerrainResult)[1] >> WORLD_COORD_SHIFT;
        wy = -((((int32*)nearestTerrainResult)[2] >> WORLD_COORD_SHIFT) - 0x8000);
        for (objIdx = FIRST_REAL_ITEM; objIdx < readItemSize; objIdx++) {
            if (wx == worldObjects[objIdx].x_coord && wy == worldObjects[objIdx].y_coord) return objIdx;
        }
        worldObjects[slot].x_coord = wx;
        worldObjects[slot].y_coord = wy;
        worldObjects[slot].objectIdx = *nearestTerrainResult + 0x100;
        return slot;
    }
    return -1;
}

// debugcom: manhattan distance
int itemDistance(int idx1, int idx2) {
    return approxDistance(worldObjects[idx1].x_coord - worldObjects[idx2].x_coord,
        worldObjects[idx1].y_coord - worldObjects[idx2].y_coord);
}

void positionUnit(int unit, int loc) {
    int planeType;
    planeType = flightUnits[unit].planeType;
    flightUnits[unit].x = worldObjects[loc].x_coord + 9;
    flightUnits[unit].y = worldObjects[loc].y_coord - 0xc;
    flightUnits[unit].xPrecise = (long)flightUnits[unit].x << WORLD_COORD_SHIFT;
    flightUnits[unit].yPrecise = (long)flightUnits[unit].y << WORLD_COORD_SHIFT;
    flightUnits[unit].altitude = worldObjects[loc].targetFlags & 0x200 ? 0x8c : 0xc;
    flightUnits[unit].maxSpeed = planes[planeType].maxSpeed;
    flightUnits[unit].heading = 0xfc00;
    flightUnits[unit].pitch = 0;
    flightUnits[unit].roll = 0;
    flightUnits[unit].flags |= 0x403;
    flightUnits[unit].waypointIdx = loc;
    flightUnits[unit].fuel = ((long)planes[planeType].range << 0xd) / flightUnits[unit].maxSpeed;
}

// debugcom: custom_manhattan_distance
int approxDistance(int dx, int dy) {
    long dist;
    dx = abs(dx);
    dy = abs(dy);
    dist = (dx > dy) ? (long)(dy >> 1) + (long)dx : (long)(dx >> 1) + (long)dy;
    if (dist > 0x7fff) {
        dist = 0x7fff;
    }
    return dist;
}

void parseWorld(const char *filename) {
    int nameIdx, scanPos;
    if ((fileHandle = fopen(filename, "rb")) == NULL) return;
    // fread(buffer, size, count, stream)
    fread(wldReadBuf1, 2, 1, fileHandle);
    fread(&readItemSize, 2, 1, fileHandle);
    fread(&groundUnitCount, 2, 1, fileHandle);
    fread(&worldObjectCount, 2, 1, fileHandle);
    fread(worldObjects, WORLDOBJECT_SIZE, readItemSize, fileHandle);
    fread(&flightUnitCount, 2, 1, fileHandle);
    fread(flightUnits, FLIGHTUNIT_SIZE, flightUnitCount, fileHandle);
    fread(wldReadBuf7, BUF7SIZE, 1, fileHandle);
    fread(wldReadBuf8, BUF7SIZE, 1, fileHandle);
    fread(objectTypeTable, BUF7SIZE, 1, fileHandle);
    fread(terrainGrid, 1, BUF10SIZE, fileHandle);
    fread(wldReadBuf11, 1, WORLD_BUFSZ, fileHandle);
    fclose(fileHandle);
    wldOffsets[0] = wldReadBuf11;
    nameIdx = 1;
    // iterate over the place name strings in the world data, find null bytes, build char pointer table
    for (scanPos = 0; scanPos < WORLD_BUFSZ; scanPos++) {
        if (wldReadBuf11[scanPos] == 0 && nameIdx < 100) {
            wldOffsets[nameIdx++] = wldReadBuf11 + scanPos + 1;
        }
    }
}

void exportWorldToComm(const char *filename) {
    int unused;
    if ((fileHandle = (FILE*)setMoveDstComm7A(filename, "wb")) == NULL) return;
    memAppend(wldReadBuf1, 2, 1, fileHandle);
    memAppend(&readItemSize, 2, 1, fileHandle);
    memAppend(&groundUnitCount, 2, 1, fileHandle);
    memAppend(&worldObjectCount, 2, 1, fileHandle);
    memAppend(worldObjects, 0x10, readItemSize, fileHandle);
    memAppend(&flightUnitCount, 2, 1, fileHandle);
    memAppend(flightUnits, 0x24, flightUnitCount, fileHandle);
    memAppend(wldReadBuf7, 0x64, 1, fileHandle);
    memAppend(wldReadBuf8, 0x64, 1, fileHandle);
    memAppend(wldReadBuf11, 1, WORLD_BUFSZ, fileHandle);
    memAppend(terrainGrid, 1, 0x100, fileHandle);
    memAppend(&missionDistAccum, 2, 1, fileHandle);
    memAppend(&escortMissionFlag, 2, 1, fileHandle);
    memAppend(&missionMidX, 4, 4, fileHandle);
    memAppend(targets, 0x12, 2, fileHandle);
    doNothing(fileHandle);
}

int calcBearing(int dx, int dy) {
    int16 angle, result;
    int32 ratio;
    int16 divisor, swapped, quotient;
    if (dx == 0) {
        return (dy > 0) ? 0 : BEARING_SOUTH;
    }
    if (dy == 0) {
        return (dx > 0) ? BEARING_EAST : BEARING_WEST;
    }
    if (abs(dx) > abs(dy)) {
        ratio = (int32)abs(dy) << 0xe;
        divisor = abs(dx);
        swapped = 1;
    }
    else {
        ratio = (int32)abs(dx) << 0xe;
        divisor = abs(dy);
        swapped = 0;
    }
    quotient = ratio / (int32)divisor;
    angle = ((0x2800 - (((int32)abs((0x1333 - quotient)) * (int32)0xb00) >> 0xe)) * (int32)quotient) >> 0xe;
    if (dx > 0) {
        if (dy > 0) {
            result = swapped != 0 ? BEARING_EAST - angle : angle;
        }
        else {
            result = (swapped != 0) ? angle + BEARING_EAST : BEARING_SOUTH - angle;
        }
    }
    else {
        if (dy > 0) {
            result = (swapped != 0) ? angle + BEARING_WEST : -angle;
        }
        else {
            result = (swapped != 0) ? BEARING_WEST - angle : angle + BEARING_SOUTH;

        }
    }
    return result;
}

int setMoveDstComm7A(const char *filename, const char* mode) {
    moveDst = (uint8 FAR*)(&commData->worldBuf);
    return 1;
}

void memAppend(void *ptr, int itemsz, int count, FILE* unused) {
    void FAR *farptr;
    farptr = ptr;
    movedata(FP_SEG(farptr), FP_OFF(farptr), FP_SEG(moveDst), FP_OFF(moveDst), itemsz * count);
    moveDst += itemsz * count;
}

void doNothing(FILE* handle) {
}

char* getItemCoordStr(int16 idx) {
    return formatGridRef(worldObjects[idx].x_coord, worldObjects[idx].y_coord, gameData->theater);
}

char* formatGridRef(int16 wx, int16 wy, int16 theater) {
    int gridOffX, gridOffY;
    (void)theater;
    switch (gameData->theater) {
    case 0:
        mystrcpy(&bufCoordStr, aTd00);
        gridOffX = 6;
        gridOffY = 4;
        break;
    case 1:
        mystrcpy(&bufCoordStr, aJz00);
        gridOffX = 0;
        gridOffY = 0;
        break;
    case 2:
        mystrcpy(&bufCoordStr, aXv00);
        gridOffX = 0;
        gridOffY = 0;
        break;
    case 3:
        mystrcpy(&bufCoordStr, aEs00);
        gridOffX = 0;
        gridOffY = 0;
        break;
    case 4:
        mystrcpy(&bufCoordStr, aWx00);
        gridOffX = 0;
        gridOffY = 0;
        break;
    case 5:
        mystrcpy(&bufCoordStr, aCc00);
        gridOffX = 3;
        gridOffY = 5;
        break;
    case 6:
        mystrcpy(&bufCoordStr, aHz00);
        gridOffX = 0;
        gridOffY = 0;
        break;
    default:
        bufCoordStr = 0;
        return &bufCoordStr;
    }
    wx = (((wx >> WORLD_COORD_SHIFT) * 0x14) >> 0xa) + gridOffX;
    while (wx > 9) {
        wx -= 0xa;
        bufCoordStr++;
    }
    gridRefCol += (int8)wx;
    wy = (((wy >> WORLD_COORD_SHIFT) * 0x14) >> 0xa) + gridOffY;
    while (wy > 9) {
        wy -= 0xa;
        gridRefRow--;
    }
    gridRefRowDigit[0] += 9 - (int8)wy;
    return &bufCoordStr;
}

int clampValue(int val, int lo, int hi) {
    if (val > hi) return hi;
    if (val >= lo) return val;
    if (val > -16384) return lo;
    return hi;
}

void buildTargetLabel(int idx) {
    mystrcpy(todayMissStrBuf, wldOffsets[worldObjects[idx].objectIdx & 0x7f]);
    if (mystrlen(wldOffsets[worldObjects[idx].unitRef]) != 0) {
        if (mystrlen(wldOffsets[worldObjects[idx].objectIdx & 0x7f]) != 0) {
            mystrcat(todayMissStrBuf, aAt);
        }
        mystrcat(todayMissStrBuf, wldOffsets[worldObjects[idx].unitRef]);
    }
    if (mystrlen(todayMissStrBuf) > 0x1e) {
      missionStrTrunc = 0x2e;
      missionStrTruncEnd[0] = 0;
    }
}
