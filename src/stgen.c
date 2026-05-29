/* Mission generation */
// offsets based on F-15 SE2 v451.03 start.exe (unpacked) MD5: cf6e997ed4582cf82db6ec37d2b1a6fd
#include "struct.h"
#include "start.h"
#include "pointers.h"
#include "comm.h"
#include "debug.h"
#include "const.h"

#include <memory.h>
#include <dos.h>
#include <stdarg.h>
#include <time.h>
#include <string.h>
#include <stdio.h>

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

// 4093
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
  // 409d
  attempt = missionDistAccum = 0;
  minDist = 0xfa;
  // 40a8
restart_40a8:
  do {
    TRACE(("runGenerator(): outer, %d", attempt));
    attempt = attempt + 1;
    if (999 < attempt) goto counterMore1k;
    // 40b5
    do {
      TRACE(("runGenerator(): inner"));
      if (missionPick != -1) {
        TRACE(("runGenerator(): inner branch 1"));
        // 40c6
        randIdx = randMul(targetCoordsCount[missionPick]);
        // 40e9
        targets[0].targetIdx = findOrPlaceItem(targetCoordsXPtrs[missionPick][randIdx],
          targetCoordsYPtrs[missionPick][randIdx], 1);
      }
      // 40f4
      else {
        TRACE(("runGenerator(): inner branch 2"));
        do {
          TRACE(("runGenerator(): inner branch 2 loop 1"));
          do {
            TRACE(("runGenerator(): inner branch 2 loop 2"));
            // 40f8
            randIdx = randMul(0xe0) * 0x80 + 0x840;
            // 410c
            randY = randMul(0xe0) * 0x80 + 0x840;
          // 412d
          } while ((terrainGrid[(randIdx >> 0xb) + ((randY >> 0xb) * 0x10)] & 3) != 0);
          // 413e
        } while ((targets[0].targetIdx = findOrPlaceItem(randIdx,randY,1)) == 0xffff);
      }
      TRACE(("runGenerator(): past inner check 1"));
      // 414c
      if (missionPick == 7) {
        // 4172
        targets[1].targetIdx = findOrPlaceItem(targetCoordsXPtrs[missionPick][randIdx],
          targetCoordsYPtrs[missionPick][randIdx] + 0x28, 2);
      }
      // 417e
      else if (missionPick == 2) {
        randIdx = randIdx * 2 + randMul(2);
        // 41a9
        targets[1].targetIdx = findOrPlaceItem(targetCoordsX2Alt[randIdx], targetCoordsY2Alt[randIdx], 2);
      }
      // 41b5
      else if (missionPick == 6) {
        randIdx = randMul(6) + randIdx + 1 & 7;
        // 41e0
        targets[1].targetIdx = findOrPlaceItem(targetCoordsX6[randIdx], targetCoordsY6[randIdx], 2);
      }
      // 41eb
      else {
        do {
          do {
            // 41ef
            randIdx = randMul(0xe0) * 0x80 + 0x840;
            // 4203
            randY = randMul(0xe0) * 0x80 + 0x840;
          // 4224
          } while ((terrainGrid[(randIdx >> 0xb) + (randY >> 0xb) * 0x10] & 3) != 0);
          // 4235
          targets[1].targetIdx = findOrPlaceItem(randIdx, randY, 2);
        } while ((targets[1].targetIdx == -1) || ((missionPick == 0 && (worldObjects[targets[1].targetIdx].unitType == 0))));
      }
      TRACE(("runGenerator(): past inner check 2"));
    // 4257
    } while ((targets[0].targetIdx == targets[1].targetIdx) || (itemDistance(targets[0].targetIdx, targets[1].targetIdx) >> 6) > 200);
    TRACE(("runGenerator(): passed inner"));
  // 427a
  } while ((gameData->theater != THEATER_DS) && (worldObjects[targets[0].targetIdx].objectIdx == worldObjects[targets[1].targetIdx].objectIdx));
  TRACE(("runGenerator(): past outer"));
  // 42a0
  for (slot = 0; slot < 2; slot++) {
    TRACE(("runGenerator(): loop 2, counter %d", slot));
    // 42b8
    baseDist[slot] = 0x7fff;
    // 42bd
    for (idx = worldObjectCount; idx < readItemSize; idx++) {
      // 42d3
      if (((worldObjects[idx].targetFlags & 0x500) != 0)
        && ((worldObjects[idx].targetFlags & 0x201) != 0)
        && ((worldObjects[idx].targetFlags & 0x800) == 0)) {
        // placed in var_1C in IDA, but this looks like an array, sort out stack layout later
        // 4332
        baseDist[2] = clampValue(itemDistance(targets[slot].targetIdx, idx) + ((worldObjects[idx].targetFlags & 0x100) != 0 ? randMul(100) * 0x40 + 0xc80 : 0), 0, 0x7fff);
        // 433b
        if ((baseDist[2] < 0x7000) && (randMul(0x500) + baseDist[2] < baseDist[slot])) {
          // 4357
          targets[slot].baseIdx = idx;
          baseDist[slot] = baseDist[2];
        }
      }
    }
  }
  TRACE(("runGenerator(): past loop2"));
  // 4377
  if (gameData->theater != THEATER_DS) {
    // 438a
    totalDist = (itemDistance(targets[0].targetIdx, targets[1].targetIdx) >> 6) + (baseDist[0] >> 6) + (baseDist[1] >> 6);
    // 43a5
    if (((attempt + 0x2e4 < totalDist) || (totalDist < minDist)) && ((worldObjects[targets[0].baseIdx].targetFlags & 0x200) == 0)) {
      // 43c8
      minDist -= 5 - difficultySaved;
      goto restart_40a8;
    }
  }
  // 43d7
  else {
    if (baseDist[0] == 0x7fff) {
      if (baseDist[1] == 0x7fff) goto restart_40a8;
      baseDist[0] = baseDist[1];
      // 43ee
      targets[0].baseIdx = targets[1].baseIdx;
    }
  }
  TRACE(("runGenerator(): past DS check"));
  // 43f4
  for (idx = 0; idx < 2; idx++) {
    TRACE(("runGenerator(): loop3, counter %d", idx));
    // 4407
    targets[idx].missionType = 0;
    // 4415
    for (retryCount = 0; retryCount < 2; retryCount++) {
      matchCount = 0;
      // 442d
      for (slot = 0; slot < 0x38; slot++) { // 4440
        if (objectTypeTable[worldObjects[targets[idx].targetIdx].objectIdx & 0x7f] == missionTable[slot].tensionMask
            && strcmp(wldOffsets[targets[idx].targetIdx], aPowCamp) != 0) {
          // 4487
          if ((retryCount != 0) && (matchCount == randChoice)) {
            // 4495
            targets[idx].missionType = missionTable[slot].theaterMask;
            targets[idx].missionNum = slot;
            targets[idx].missionCode = missionTable[slot].missionType;
            // 44c3
            if (missionTable[slot].objectFlag > 0) {
              // 44ca
              targets[idx].missionCode += (missionTable[slot].objectFlag << 8) ;
            }
          }
          matchCount++;
        }
      }
      // 44dd
      randChoice = randMul(matchCount);
    }
  }
  TRACE(("runGenerator(): past loop3"));
  // 44ec
  if ((targets[0].missionType == 0) || (targets[1].missionType == 0)) {
    TRACE(("runGenerator(): restart 1"));
    goto restart_40a8;
  }
  // 44fd
  if ((baseDist[0] < baseDist[1]) && (missionPick == -1)) {
    // 450c
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
  // 4578
  if (targets[0].missionType == 4) {
    TRACE(("runGenerator(): restart2"));
    goto restart_40a8;
  }
  TRACE(("runGenerator(): past restart checks"));
  // 4582
  escortMissionFlag = 0xffff;
  // 4588
  if (missionTable[targets[0].missionNum].objectFlag < 0) { //459e
    flightUnits[0].planeType = -missionTable[targets[0].missionNum].objectFlag;
  }
  // 45a5
  if (escortMissionFlag == 0) {
    flightUnits[0].fuel = DEFAULT_FUEL;
  }
  // 45b2
  for (idx = 0; idx < 2; idx++) {
    TRACE(("runGenerator(): loop4, counter %d", idx));
    // 45e2
    mystrcpy(targets[idx].coord, getItemCoordStr(targets[idx].targetIdx));
    // 45f0
    if (targets[idx].targetIdx < FIRST_REAL_ITEM) {
      swapTmp = 0x7fff;
      // 45ff
      for (slot = FIRST_REAL_ITEM; slot < readItemSize; slot++) {
        // 4611
        if ((worldObjects[slot].targetFlags & 0x500) == 0
            && itemDistance(slot, targets[idx].targetIdx) < swapTmp
            && worldObjects[slot].unitRef != 0) {
          // 4648
          swapTmp = itemDistance(slot, targets[idx].targetIdx);
          // 4679
          worldObjects[targets[idx].targetIdx].unitRef = worldObjects[slot].unitRef;
        }
      }
    }
  }
  TRACE(("runGenerator(): past loop4"));
  // 4689
  targets[0].distance = missionDistAccum >> 4;
counterMore1k:
  TRACE(("runGenerator(): counterMore1k"));
  // 46a9
  baseXPrecise = (uint32)(worldObjects[targets[0].baseIdx].x_coord) << WORLD_COORD_SHIFT;
  // 46ad
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
  // 46fa
  missionTargetX = worldObjects[targets[0].targetIdx].x_coord;
  missionTargetY = worldObjects[targets[0].targetIdx].y_coord;
  // 4710
  missionMidX = (worldObjects[targets[0].baseIdx].x_coord / 2) + (missionTargetX / 2);
  missionMidY = (worldObjects[targets[0].baseIdx].y_coord / 2) + (missionTargetY / 2);
  // 4732
  missionBase2X = worldObjects[targets[1].baseIdx].x_coord;
  missionBase2Y = worldObjects[targets[1].baseIdx].y_coord;
  missionTarget2X = worldObjects[targets[1].targetIdx].x_coord;
  missionTarget2Y = worldObjects[targets[1].targetIdx].y_coord;
  // 475c
  if (missionPick == 2) {
    missionTarget2X += (rand() & 0x1000) - 0x800;
    missionTarget2Y += (rand() & 0x1000) - 0x800;
  }
  // 477d
  if (targets[0].missionCode & 0x10) {
    missionTargetX = ((missionTargetX >> 0xa) << 0xa) + 0x200;
    missionTargetY = ((missionTargetY >> 0xa) << 0xa) + 0x200;
  }
  // 47a0
  for (idx = 0; idx < flightUnitCount - 4; idx++) { // 47cb8
    TRACE(("runGenerator(): loop5, counter %d", idx));
    // 47c4
    if ((flightUnits[idx].flags & 0x80) != 0) {
      // 47ea
      maxRange = (baseDist[0] / 4) * (4 - difficultySaved);
      // 47ed
      if ((flightUnits[idx].flags & 0x40) != 0) {
        maxRange = baseDist[0] << 1;
      }
      // 47fb
      do {
        // 480b
        baseDist[2] = randMul(worldObjectCount - FIRST_REAL_ITEM) + FIRST_REAL_ITEM;
      // 4814
      } while ((worldObjects[baseDist[2]].targetFlags & 0x100) || approxDistance(missionMidX - worldObjects[baseDist[2]].x_coord, missionMidY - worldObjects[baseDist[2]].y_coord) > (maxRange += 0x10));
      // 4841
      positionUnit(idx, baseDist[2]);
      maxRange = 0x3000;
      // 484c
      baseBearing = calcBearing(worldObjects[targets[0].baseIdx].x_coord - flightUnits[idx].x, flightUnits[idx].y - worldObjects[targets[0].baseIdx].y_coord);
      // 4877
      for (slot = 0; slot < 8; slot++) {
        // 488b
        waypointIdx = randMul(worldObjectCount) + 1;
        if ((worldObjects[waypointIdx].targetFlags & 0x400) == 0) {
          // 48bd
          bearing = calcBearing(worldObjects[waypointIdx].x_coord - flightUnits[idx].x, flightUnits[idx].y - worldObjects[waypointIdx].y_coord);
          // 48d3
          if (abs(baseBearing - bearing) < maxRange) {
            // 48e5
            maxRange = abs(baseBearing - bearing);
            // 48f3
            flightUnits[idx].waypointIdx = waypointIdx;
            break;
          }
        }
      }
    }
    // 48fb
    if (((flightUnits[idx].flags & 0x100) != 0) && (escortMissionFlag != -1)) {
      // 4919
      positionUnit(idx, playerStartLoc);
      flightUnits[idx].fuel = DEFAULT_FUEL;
    }
    // 492d
    if (idx != 0) {
      baseDist[2] = 0;
      do {
        // 4948
        waypointIdx = randMul(worldObjectCount - FIRST_REAL_ITEM) + FIRST_REAL_ITEM;
      // 4964
      } while ((((worldObjects[waypointIdx].targetFlags & 0x801) != 1) || (worldObjects[waypointIdx].patrolCount != 0)) && baseDist[2]++ < 20);
      // 496f
      worldObjects[waypointIdx].occupantType = flightUnits[idx].planeType;
      worldObjects[waypointIdx].patrolCount = randMul(theaterSaved + 1) + 1;
    } // 4996
  }
  TRACE(("runGenerator(): past loop5"));
  // 4999
  for (idx = 0; idx < groundUnitCount; idx++) { // 49ae
    TRACE(("runGenerator(): loop6, counter %d", idx));
    unitType = worldObjects[idx].unitType;
    // 49b9
    if ((unitType != 0) && (unitType != 21)) { // 49cb
      // 4a0d
      switch((gameData->isCampaignMission != 0) + randMul(5) + difficultySaved) {
      case 0:
      case 1:
      case 3:
        // 49eb
        unitType = unitTypeRemapTable[unitType].downgrade;
      case 2:
      case 4:
      case 6:
        break;
      case 5:
      case 7:
      case 8:
        // 49fb
        unitType = unitTypeRemapTable[unitType].upgrade;
        break;
      } // 4a2c
      // 4a36
      worldObjects[idx].unitType = unitType;
      if (((worldObjects[idx].targetFlags & 8) != 0) && gameData->isCampaignMission + difficultySaved + 2 < randMul(10)) { // 4a5e
        // 4a65
        worldObjects[idx].unitType = 0;
      }
    } // 4a6b
  }
  TRACE(("runGenerator(): past loop6"));
  // 4a6e
  for (randIdx = 0; (int)randIdx < 0x10; randIdx++) { // 4a7e
    for (randY = 0; randY < 0x10; randY++) { // 4a8e
      if (((terrainGrid[randY + randIdx * 0x10] & 0x10) != 0) && randMul(5) >= difficultySaved) { // 4aaf
        terrainGrid[randY + randIdx * 0x10] &= 0xef;
      }
    }
  } // 4ac2
  TRACE(("runGenerator(): past loop7"));
  commData->unk7[1] = 1;
  commData->unk7[2] = 5;
  commData->unk7[0] = 0;
  // 4ae4
  if (gameData->theater == THEATER_DS) { // 4ae8
    commData->unk7[1] = 3;
    if (missionPick != -1) { // 4afc
      // 4b0a
      commData->unk7[2] = missionPickType[missionPick];
    }
  } // 4b0e
  i = 0;
  // 4b13
  for (idx = 0; idx < 3; idx++) { // 4b23
    TRACE(("runGenerator(): loop8, counter %d", idx));
    // 4b49
    commData->unk8[idx] = weaponLoadouts[commData->unk7[idx]].qty;
  }
  TRACE(("runGenerator(): past loop8"));
  // 4b4f
  missionBits = targets[0].missionNum + targets[1].missionNum;
  nightMissionFlag = ((uint8)missionBits & 3) == 0;
  // 4b68
  missionBits = (missionBits & 0xf) << 8;
  // 4b75
  if ((targets[0].missionType == 1) || (targets[1].missionType == 1)) { // 4b83
    nightMissionFlag = 0;
  }
  // 4b89
  if ((targets[0].missionType == 4) || (targets[1].missionType == 4)) { // 4b97
    nightMissionFlag = 1;
  } // 4b9d
  missionDistAccum -= (missionBits + missionDistAccum) % 0x96;
  TRACE(("runGenerator(): exiting"));
}

// 4bb4
int findOrPlaceItem(int wx, int wy, int slot) {
    int j;
    // 4bf2
    if ((nearestTerrainResult = findNearestTerrain((long)wx << WORLD_COORD_SHIFT , (0x8000 - (long)wy) << WORLD_COORD_SHIFT)) != NULL) { // 4bfc
        // 4c10
        wx = ((long*)nearestTerrainResult)[1] >> WORLD_COORD_SHIFT;
        wy = -((((long*)nearestTerrainResult)[2] >> WORLD_COORD_SHIFT) - 0x8000);
        // 4c31
        for (j = FIRST_REAL_ITEM; j < readItemSize; j++) { // 4c43
            // 4c4e
            if (wx == worldObjects[j].x_coord && wy == worldObjects[j].y_coord) return j;
        } // 4c63
        worldObjects[slot].x_coord = wx;
        worldObjects[slot].y_coord = wy;
        worldObjects[slot].objectIdx = *nearestTerrainResult + 0x100;
        return slot;
    }
    // 4c8a
    return -1;
    // 4c8f
}

// 4c94
// debugcom: manhattan distance
int itemDistance(int idx1, int idx2) {
    // 4cb7
    return approxDistance(worldObjects[idx1].x_coord - worldObjects[idx2].x_coord,
        worldObjects[idx1].y_coord - worldObjects[idx2].y_coord);
}

// 4cc5
void positionUnit(int unit, int loc) {
    int j;
    // 4cd9
    j = flightUnits[unit].planeType;
    // 4cea
    flightUnits[unit].x = worldObjects[loc].x_coord + 9;
    flightUnits[unit].y = worldObjects[loc].y_coord - 0xc;
    // 4d0b
    flightUnits[unit].xPrecise = (long)flightUnits[unit].x << WORLD_COORD_SHIFT;
    flightUnits[unit].yPrecise = (long)flightUnits[unit].y << WORLD_COORD_SHIFT;
    // 4d2d
    flightUnits[unit].altitude = worldObjects[loc].targetFlags & 0x200 ? 0x8c : 0xc;
    flightUnits[unit].maxSpeed = planes[j].maxSpeed;
    flightUnits[unit].heading = 0xfc00;
    flightUnits[unit].pitch = 0;
    flightUnits[unit].roll = 0;
    flightUnits[unit].flags |= 0x403;
    // 4d6b
    flightUnits[unit].waypointIdx = loc;
    // 4d8c
    flightUnits[unit].fuel = ((long)planes[j].range << 0xd) / flightUnits[unit].maxSpeed;
}

// 4d96
// debugcom: custom_manhattan_distance
int approxDistance(int dx, int dy) {
    long j;
    // 4d9f
    dx = abs(dx);
    dy = abs(dy);
    // 4ddf
    j = (dx > dy) ? (long)(dy >> 1) + (long)dx : (long)(dx >> 1) + (long)dy;
    // 4ddf
    if (j > 0x7fff) {
        j = 0x7fff;
    }
    // 4dfa
    return j;
}

// 4e03
void parseWorld(const char *filename) {
    int j, l;
    // 4e10
    if ((fileHandle = fopen(filename, aRb_4)) == NULL) return;
    // 4e30
    // fread(buffer, size, count, stream)
    fread(wldReadBuf1, 2, 1, fileHandle);
    fread(&readItemSize, 2, 1, fileHandle);
    fread(&groundUnitCount, 2, 1, fileHandle);
    fread(&worldObjectCount, 2, 1, fileHandle);
    fread(worldObjects, BUF4ITEMSIZE, readItemSize, fileHandle);
    fread(&flightUnitCount, 2, 1, fileHandle);
    fread(flightUnits, BUF6ITEMSIZE, flightUnitCount, fileHandle);
    fread(wldReadBuf7, BUF7SIZE, 1, fileHandle);
    fread(wldReadBuf8, BUF7SIZE, 1, fileHandle);
    fread(objectTypeTable, BUF7SIZE, 1, fileHandle);
    fread(terrainGrid, 1, BUF10SIZE, fileHandle);
    fread(wldReadBuf11, 1, WORLD_BUFSZ, fileHandle);
    // 4f2c
    fclose(fileHandle);
    wldOffsets[0] = wldReadBuf11;
    j = 1;
    // 4f3d
    // iterate over the place name strings in the world data, find null bytes, build char pointer table
    for (l = 0; l < WORLD_BUFSZ; l++) {
        if (wldReadBuf11[l] == 0 && j < 100) {
            wldOffsets[j++] = wldReadBuf11 + l + 1;
        }
    }
}

// 0x4f76
void writeWorld(const char *filename) {
    int unused;
    if ((fileHandle = (FILE*)setMoveDstComm7A(filename, aWb_0)) == NULL) return;
    // 0x4fa3
    memAppend(wldReadBuf1, 2, 1, fileHandle);
    // 0x4fb9
    memAppend(&readItemSize, 2, 1, fileHandle);
    // 0x4fcf
    memAppend(&groundUnitCount, 2, 1, fileHandle);
    // 0x4fe5
    memAppend(&worldObjectCount, 2, 1, fileHandle);
    // 0x4ffb
    memAppend(worldObjects, 0x10, readItemSize, fileHandle);
    // 0x5011
    memAppend(&flightUnitCount, 2, 1, fileHandle);
    // 0x5027
    memAppend(flightUnits, 0x24, flightUnitCount, fileHandle);
    // 0x503c
    memAppend(wldReadBuf7, 0x64, 1, fileHandle);
    // 0x5053
    memAppend(wldReadBuf8, 0x64, 1, fileHandle);
    // 0x5069
    memAppend(wldReadBuf11, 1, WORLD_BUFSZ, fileHandle);
    // 0x507f
    memAppend(terrainGrid, 1, 0x100, fileHandle);
    // 0x5095
    memAppend(&missionDistAccum, 2, 1, fileHandle);
    // 0x50ab
    memAppend(&escortMissionFlag, 2, 1, fileHandle);
    // 0x50be
    memAppend(&missionMidX, 4, 4, fileHandle);
    // 0x50d4
    memAppend(targets, 0x12, 2, fileHandle);
    // 0x50de
    doNothing(fileHandle);
}

// 50eb
int calcBearing(int dx, int dy) {
    int16 angle, result;
    int32 ratio;
    int16 divisor, swapped, quotient;
    if (dx == 0) { // 50f8
        return (dy > 0) ? 0 : BEARING_SOUTH;
    } // 5108
    if (dy == 0) { // 510e
        return (dx > 0) ? BEARING_EAST : BEARING_WEST;
    } // 511f
    if (abs(dx) > abs(dy)) { // 5137
        // 514d
        ratio = (int32)abs(dy) << 0xe;
        divisor = abs(dx);
        swapped = 1;
    }
    else { // 5166
        // 517c
        ratio = (int32)abs(dx) << 0xe;
        divisor = abs(dy);
        swapped = 0;
    } // 5193
    quotient = ratio / (int32)divisor;
    // 51eb
    angle = ((0x2800 - (((int32)abs((0x1333 - quotient)) * (int32)0xb00) >> 0xe)) * (int32)quotient) >> 0xe;
    // 51ee
    if (dx > 0) { // 51f4
        if (dy > 0) { // 51fa
            result = swapped != 0 ? BEARING_EAST - angle : angle;
        }
        else { // 5210
            result = (swapped != 0) ? angle + BEARING_EAST : BEARING_SOUTH - angle;
        } // 5227
    }
    else { // 5229
        if (dy > 0) { // 522f
            result = (swapped != 0) ? angle + BEARING_WEST : -angle;
        }
        else { // 5247
            result = (swapped != 0) ? BEARING_WEST - angle : angle + BEARING_SOUTH;

        } // 525e
    } // 525e
    return result;
}

// 5268
int setMoveDstComm7A(const char *filename, const char* arg_1) {
    moveDst = (uint8 FAR*)(&commData->worldBuf);
    return 1;
}

// 52bb
void memAppend(void *ptr, int itemsz, int count, FILE* unused) {
    void FAR *farptr;
    farptr = ptr;
    // 52dd
    movedata(FP_SEG(farptr), FP_OFF(farptr), FP_SEG(moveDst), FP_OFF(moveDst), itemsz * count);
    moveDst += itemsz * count;
}

// 52f1
void doNothing(FILE* handle) {
}

// 52f4
char* getItemCoordStr(int16 idx) {
    // 530f
    return formatGridRef(worldObjects[idx].x_coord, worldObjects[idx].y_coord, gameData->theater);
}

// 531c
char* formatGridRef(int16 wx, int16 wy, int16 theater) {
    int gridOffX, gridOffY;
    (void*)theater;
    switch (gameData->theater) { // 53f2
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
    default: // 53e6
        bufCoordStr = 0;
        return &bufCoordStr;
    } // 540d
    // 5420
    wx = (((wx >> WORLD_COORD_SHIFT) * 0x14) >> 0xa) + gridOffX;
    while (wx > 9) { // 5427
        wx -= 0xa;
        bufCoordStr++;
    } // 5433
    gridRefCol += (int8)wx;
    wy = (((wy >> WORLD_COORD_SHIFT) * 0x14) >> 0xa) + gridOffY;
    // 5450
    while (wy > 9) {
        wy -= 0xa;
        gridRefRow--;
    }
    gridRefRowDigit[0] += 9 - (int8)wy;
    return &bufCoordStr;
}

// 5472
int clampValue(int val, int lo, int hi) {
    // 5478
    if (val > hi) return hi;
    // 5482
    if (val >= lo) return val;
    // 548c
    if (val > -16384) return lo;
    // 5498
    return hi;
}

// 54a1
void placeString(int idx) {
    // 54bc
    mystrcpy(todayMissStrBuf, wldOffsets[worldObjects[idx].objectIdx & 0x7f]);
    // 54d3
    if (mystrlen(wldOffsets[worldObjects[idx].unitRef]) != 0) { // 54dd
        // 54f1
        if (mystrlen(wldOffsets[worldObjects[idx].objectIdx & 0x7f]) != 0) { // 54fb
            // 5503
            mystrcat(todayMissStrBuf, aAt);
        } // 5509
        // 551e
        mystrcat(todayMissStrBuf, wldOffsets[worldObjects[idx].unitRef]);
    } // 5524
    // 5528
    if (mystrlen(todayMissStrBuf) > 0x1e) { // 5533
      missionStrTrunc = 0x2e;
      missionStrTruncEnd[0] = 0;
    }
    // 5540
}
