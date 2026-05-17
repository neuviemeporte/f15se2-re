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

// 37f8
int* findNearestTerrain(int32 worldX, int32 worldY) {
    int16 tmp, dx, dist, rowOff, x1, level, dy, i, cellIdx, gridX, offsetY, y1, cell;
    int16 sy;
    int16 ty;
    uint32 fx;
    word_1D5D6 = 0x7fff;
    for (level = 1; level <= 2; level++) { // 3819
        for (i = 0; i < 9; i++) { // 382c
            // 383b
            fx = scaleCoordByLevel(level, worldX);
            // 384d
            gridX = fx >> 0xc;
            // 3856
            x1 = (int16)fx & 0xfff;
            // 3868
            fx = scaleCoordByLevel(level, worldY);
            // 387a
            y1 = fx >> 0xc;
            dy = (int16)fx & 0xfff;
            dx = word_17FFE[i];
            rowOff = word_18010[i];
            sy = word_18026[dx] - x1 + 0x800;
            tmp = word_18026[rowOff] - dy + 0x800;
            y1 += rowOff;
            // 38d2
            cell = lookupGridCell(level, gridX += dx, y1);
            // 38db
            if (cell != 0xffff) {
                // 38f2
                word_1E24A = (int16)terrainPtrUnk[level].field_0[cell];
                // 38f5
                for (cellIdx = 0; (uint16)terrainBuf2[level].field_0[cell] > cellIdx; cellIdx++) { // 3917
                    // 3920
                    if (wldReadBuf9[((uint8*)(word_1E24A))[6]] != 0) { // 3929
                        ty = *((uint16*)word_1E24A) + sy;
                        // 393b
                        offsetY = *((uint16*)word_1E24A + 1) + tmp;
                        dist = abs(ty) + abs(offsetY);
                        if (level == 1) { // 395b
                            dist >>= 2;
                        }
                        else { // 3962
                            ty <<= 2;
                            offsetY <<= 2;
                        } // 396a
                        if (dist < word_1D5D6) { // 3972
                            byte_1D5E2 = (int8)level;
                            byte_1D5E3 = (int8)cellIdx;
                            byte_1D5E4 = (int8)gridX;
                            byte_1D5E5[0] = (int8)y1;
                            // 398d
                            word_1D5E0 = word_1E24A;
                            word_1D5D4 = ((uint8*)word_1D5E0)[6];
                            word_1D5D6 = dist;
                            dword_1D5D8 = ty + worldX;
                            dword_1D5DC = offsetY + worldY;
                        }
                    }
                    // 39c2
                    word_1E24A += 7;
                } // 39ca
            } // 39ca
        } // 39cd
    } // 39d0
    if (word_1D5D6 != 0x7fff) {
        return &word_1D5D4;
    }
    else return NULL;
}

// 39e9
uint32 scaleCoordByLevel(int level, uint32 coord) {
    switch (level) { // 3a43
    case 4: // 39f1
        return coord >> 6;
    case 3:
        return coord >> 4;
    case 2:
        return coord >> 2;
    case 1:
        return coord;
    case 0:
        return coord << 1;
    }
}

// 3a61
int lookupGridCell(int16 level, int16 col, int16 row) {
    if (col < 0 || row < 0 || col >= word_18026[level + 6] || row >= word_18026[level + 6])
        return -1;
    // 3a8a
    switch (level) { // 3b61
    case 4: // 3a90
        return gridBuf1[col + (row << 2)];
    case 3: // 3aa3
        return gridBuf2[col + (row << 4)];
    case 2: // 3ab6
        return gridBuf3[(col & 3) + (((row & 3) << 2) + (lookupGridCell(3, col >> 2, row >> 2) << 4))];
    case 1: // 3aef
        return gridBuf4[(col & 3) + (((row & 3) << 2) + (lookupGridCell(2, col >> 2, row >> 2) << 4))];
    case 0: // 3b27
        return gridBuf5[(col & 3) + (((row & 3) << 2) + (lookupGridCell(1, col >> 2, row >> 2) << 4))];
    }
}

// 0x4042
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
  attempt = word_1DD38 = 0;
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
        randIdx = randMul(word_19324[missionPick]);
        // 40e9
        targets[0].field_2 = findOrPlaceItem(off_19304[missionPick][randIdx],
          off_19314[missionPick][randIdx], 1);
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
          } while ((wldReadBuf10[(randIdx >> 0xb) + ((randY >> 0xb) * 0x10)] & 3) != 0);
          // 413e
        } while ((targets[0].field_2 = findOrPlaceItem(randIdx,randY,1)) == 0xffff);
      }
      TRACE(("runGenerator(): past inner check 1"));
      // 414c
      if (missionPick == 7) {
        // 4172
        target2.field_2 = findOrPlaceItem(off_19304[missionPick][randIdx],
          off_19314[missionPick][randIdx] + 0x28, 2);
      }
      // 417e
      else if (missionPick == 2) {
        randIdx = randIdx * 2 + randMul(2);
        // 41a9
        target2.field_2 = findOrPlaceItem(word_192EC[randIdx], word_192F4[randIdx], 2);
      }
      // 41b5
      else if (missionPick == 6) {
        randIdx = randMul(6) + randIdx + 1 & 7;
        // 41e0
        target2.field_2 = findOrPlaceItem(word_19294[randIdx], word_192A4[randIdx], 2);
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
          } while ((wldReadBuf10[(randIdx >> 0xb) + (randY >> 0xb) * 0x10] & 3) != 0);
          // 4235
          target2.field_2 = findOrPlaceItem(randIdx, randY, 2);
        } while ((target2.field_2 == -1) || ((missionPick == 0 && (wldReadBuf4[target2.field_2].field_6 == 0))));
      }
      TRACE(("runGenerator(): past inner check 2"));
    // 4257
    } while ((targets[0].field_2 == target2.field_2) || (itemDistance(targets[0].field_2, target2.field_2) >> 6) > 200);
    TRACE(("runGenerator(): passed inner"));
  // 427a
  } while ((gameData->theater != THEATER_DS) && (wldReadBuf4[targets[0].field_2].field_E == wldReadBuf4[target2.field_2].field_E));
  TRACE(("runGenerator(): past outer"));
  // 42a0
  for (slot = 0; slot < 2; slot++) {
    TRACE(("runGenerator(): loop 2, counter %d", slot));
    // 42b8
    baseDist[slot] = 0x7fff;
    // 42bd
    for (idx = wldReadBuf3; idx < readItemSize; idx++) {
      // 42d3
      if (((wldReadBuf4[idx].field_8 & 0x500) != 0)
        && ((wldReadBuf4[idx].field_8 & 0x201) != 0)
        && ((wldReadBuf4[idx].field_8 & 0x800) == 0)) {
        // placed in var_1C in IDA, but this looks like an array, sort out stack layout later
        // 4332
        baseDist[2] = clampValue(itemDistance(targets[slot].field_2, idx) + ((wldReadBuf4[idx].field_8 & 0x100) != 0 ? randMul(100) * 0x40 + 0xc80 : 0), 0, 0x7fff);
        // 433b
        if ((baseDist[2] < 0x7000) && (randMul(0x500) + baseDist[2] < baseDist[slot])) {
          // 4357
          targets[slot].field_4 = idx;
          baseDist[slot] = baseDist[2];
        }
      }
    }
  }
  TRACE(("runGenerator(): past loop2"));
  // 4377
  if (gameData->theater != THEATER_DS) {
    // 438a
    totalDist = (itemDistance(targets[0].field_2, targets[1].field_2) >> 6) + (baseDist[0] >> 6) + (baseDist[1] >> 6);
    // 43a5
    if (((attempt + 0x2e4 < totalDist) || (totalDist < minDist)) && ((wldReadBuf4[targets[0].field_4].field_8 & 0x200) == 0)) {
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
      targets[0].field_4 = targets[1].field_4;
    }
  }
  TRACE(("runGenerator(): past DS check"));
  // 43f4
  for (idx = 0; idx < 2; idx++) {
    TRACE(("runGenerator(): loop3, counter %d", idx));
    // 4407
    targets[idx].field_0 = 0;
    // 4415
    for (retryCount = 0; retryCount < 2; retryCount++) {
      matchCount = 0;
      // 442d
      for (slot = 0; slot < 0x38; slot++) { // 4440
        if (wldReadBuf9[wldReadBuf4[targets[idx].field_2].field_E & 0x7f] == stru_18FC0[slot].field_2
            && strcmp(wldOffsets[targets[idx].field_2], aPowCamp) != 0) {
          // 4487
          if ((retryCount != 0) && (matchCount == randChoice)) {
            // 4495
            targets[idx].field_0 = stru_18FC0[slot].field_0;
            targets[idx].field_8 = slot;
            targets[idx].field_6 = stru_18FC0[slot].field_4;
            // 44c3
            if (stru_18FC0[slot].field_6 > 0) {
              // 44ca
              targets[idx].field_6 += (stru_18FC0[slot].field_6 << 8) ;
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
  if ((targets[0].field_0 == 0) || (targets[1].field_0 == 0)) {
    TRACE(("runGenerator(): restart 1"));
    goto restart_40a8;
  }
  // 44fd
  if ((baseDist[0] < baseDist[1]) && (missionPick == -1)) {
    // 450c
    swapTmp = targets[0].field_2;
    targets[0].field_2 = targets[1].field_2;
    targets[1].field_2 = swapTmp;
    swapTmp = targets[0].field_0;
    targets[0].field_0 = targets[1].field_0;
    targets[1].field_0 = swapTmp;
    swapTmp = targets[0].field_4;
    targets[0].field_4 = targets[1].field_4;
    targets[1].field_4 = swapTmp;
    swapTmp = targets[0].field_8;
    targets[0].field_8 = targets[1].field_8;
    targets[1].field_8 = swapTmp;
    swapTmp = targets[0].field_6;
    targets[0].field_6 = targets[1].field_6;
    targets[1].field_6 = swapTmp;
    swapTmp = baseDist[0];
    baseDist[0] = baseDist[1];
    baseDist[1] = swapTmp;
  }
  // 4578
  if (targets[0].field_0 == 4) {
    TRACE(("runGenerator(): restart2"));
    goto restart_40a8;
  }
  TRACE(("runGenerator(): past restart checks"));
  // 4582
  word_1B148 = 0xffff;
  // 4588
  if (stru_18FC0[targets[0].field_8].field_6 < 0) { //459e
    wldReadBuf6[0].field_16 = -stru_18FC0[targets[0].field_8].field_6;
  }
  // 45a5
  if (word_1B148 == 0) {
    wldReadBuf6[0].field_1C = DEFAULT_FUEL;
  }
  // 45b2
  for (idx = 0; idx < 2; idx++) {
    TRACE(("runGenerator(): loop4, counter %d", idx));
    // 45e2
    mystrcpy(targets[idx].coord, getItemCoordStr(targets[idx].field_2));
    // 45f0
    if (targets[idx].field_2 < FIRST_REAL_ITEM) {
      swapTmp = 0x7fff;
      // 45ff
      for (slot = FIRST_REAL_ITEM; slot < readItemSize; slot++) {
        // 4611
        if ((wldReadBuf4[slot].field_8 & 0x500) == 0
            && itemDistance(slot, targets[idx].field_2) < swapTmp
            && wldReadBuf4[slot].field_0 != 0) {
          // 4648
          swapTmp = itemDistance(slot, targets[idx].field_2);
          // 4679
          wldReadBuf4[targets[idx].field_2].field_0 = wldReadBuf4[slot].field_0;
        }
      }
    }
  }
  TRACE(("runGenerator(): past loop4"));
  // 4689
  targets[0].field_10 = word_1DD38 >> 4;
counterMore1k:
  TRACE(("runGenerator(): counterMore1k"));
  // 46a9
  dword_1D5D0 = (uint32)(wldReadBuf4[targets[0].field_4].field_2) << WORLD_COORD_SHIFT;
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
  dword_1D650 = ((0x8000 - (int32)(wldReadBuf4[targets[0].field_4].field_4)) << WORLD_COORD_SHIFT) - (int32)((wldReadBuf4[targets[0].field_4].field_8 & 0x200) ? 0 : 0x708);
  // 46fa
  word_182BE = wldReadBuf4[targets[0].field_2].field_2;
  word_182C0 = wldReadBuf4[targets[0].field_2].field_4;
  // 4710
  word_182BA = (wldReadBuf4[targets[0].field_4].field_2 / 2) + (word_182BE / 2);
  word_182BC = (wldReadBuf4[targets[0].field_4].field_4 / 2) + (word_182C0 / 2);
  // 4732
  word_182C6 = wldReadBuf4[targets[1].field_4].field_2;
  word_182C8 = wldReadBuf4[targets[1].field_4].field_4;
  word_182C2 = wldReadBuf4[targets[1].field_2].field_2;
  word_182C4 = wldReadBuf4[targets[1].field_2].field_4;
  // 475c
  if (missionPick == 2) {
    word_182C2 += (rand() & 0x1000) - 0x800;
    word_182C4 += (rand() & 0x1000) - 0x800;
  }
  // 477d
  if ((uint8)targets[0].field_6 & 0x10 != 0) {
    word_182BE = ((word_182BE >> 0xa) << 0xa) + 0x200;
    word_182C0 = ((word_182C0 >> 0xa) << 0xa) + 0x200;
  }
  // 47a0
  for (idx = 0; idx < wldReadBuf5Size - 4; idx++) { // 47cb8
    TRACE(("runGenerator(): loop5, counter %d", idx));
    // 47c4
    if ((wldReadBuf6[idx].field_18 & 0x80) != 0) {
      // 47ea
      maxRange = (baseDist[0] / 4) * (4 - difficultySaved);
      // 47ed
      if ((wldReadBuf6[idx].field_18 & 0x40) != 0) {
        maxRange = baseDist[0] << 1;
      }
      // 47fb
      do {
        // 480b
        baseDist[2] = randMul(wldReadBuf3 - FIRST_REAL_ITEM) + FIRST_REAL_ITEM;
      // 4814
      } while ((wldReadBuf4[baseDist[2]].field_8 & 0x100) || approxDistance(word_182BA - wldReadBuf4[baseDist[2]].field_2, word_182BC - wldReadBuf4[baseDist[2]].field_4) > (maxRange += 0x10));
      // 4841
      positionUnit(idx, baseDist[2]);
      maxRange = 0x3000;
      // 484c
      baseBearing = calcBearing(wldReadBuf4[targets[0].field_4].field_2 - wldReadBuf6[idx].field_2, wldReadBuf6[idx].field_4 - wldReadBuf4[targets[0].field_4].field_4);
      // 4877
      for (slot = 0; slot < 8; slot++) {
        // 488b
        waypointIdx = randMul(wldReadBuf3) + 1;
        if ((wldReadBuf4[waypointIdx].field_8 & 0x400) == 0) {
          // 48bd
          bearing = calcBearing(wldReadBuf4[waypointIdx].field_2 - wldReadBuf6[idx].field_2, wldReadBuf6[idx].field_4 - wldReadBuf4[waypointIdx].field_4);
          // 48d3
          if (abs(baseBearing - bearing) < maxRange) {
            // 48e5
            maxRange = abs(baseBearing - bearing);
            // 48f3
            wldReadBuf6[idx].field_0 = waypointIdx;
            break;
          }
        }
      }
    }
    // 48fb
    if (((wldReadBuf6[idx].field_18 & 0x100) != 0) && (word_1B148 != -1)) {
      // 4919
      positionUnit(idx, word_1D00A);
      wldReadBuf6[idx].field_1C = DEFAULT_FUEL;
    }
    // 492d
    if (idx != 0) {
      baseDist[2] = 0;
      do {
        // 4948
        waypointIdx = randMul(wldReadBuf3 - FIRST_REAL_ITEM) + FIRST_REAL_ITEM;
      // 4964
      } while ((((wldReadBuf4[waypointIdx].field_8 & 0x801) != 1) || (wldReadBuf4[waypointIdx].field_C != 0)) && baseDist[2]++ < 20);
      // 496f
      wldReadBuf4[waypointIdx].field_A = wldReadBuf6[idx].field_16;
      wldReadBuf4[waypointIdx].field_C = randMul(theaterSaved + 1) + 1;
    } // 4996
  }
  TRACE(("runGenerator(): past loop5"));
  // 4999
  for (idx = 0; idx < wldReadBuf2; idx++) { // 49ae
    TRACE(("runGenerator(): loop6, counter %d", idx));
    unitType = wldReadBuf4[idx].field_6;
    // 49b9
    if ((unitType != 0) && (unitType != 21)) { // 49cb
      // 4a0d
      switch((gameData->isCampaignMission != 0) + randMul(5) + difficultySaved) {
      case 0:
      case 1:
      case 3:
        // 49eb
        unitType = stru_1892E[unitType].field_2;
      case 2:
      case 4:
      case 6:
        break;
      case 5:
      case 7:
      case 8:
        // 49fb
        unitType = stru_1892E[unitType].field_0;
        break;
      } // 4a2c
      // 4a36
      wldReadBuf4[idx].field_6 = unitType;
      if (((wldReadBuf4[idx].field_8 & 8) != 0) && gameData->isCampaignMission + difficultySaved + 2 < randMul(10)) { // 4a5e
        // 4a65
        wldReadBuf4[idx].field_6 = 0;
      }
    } // 4a6b
  }
  TRACE(("runGenerator(): past loop6"));
  // 4a6e
  for (randIdx = 0; (int)randIdx < 0x10; randIdx++) { // 4a7e
    for (randY = 0; randY < 0x10; randY++) { // 4a8e
      if (((wldReadBuf10[randY + randIdx * 0x10] & 0x10) != 0) && randMul(5) >= difficultySaved) { // 4aaf
        wldReadBuf10[randY + randIdx * 0x10] &= 0xef;
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
      commData->unk7[2] = byte_192FC[missionPick];
    }
  } // 4b0e
  i = 0;
  // 4b13
  for (idx = 0; idx < 3; idx++) { // 4b23
    TRACE(("runGenerator(): loop8, counter %d", idx));
    // 4b49
    commData->unk8[idx] = word_189B6[commData->unk7[idx] * 0x34];
  }
  TRACE(("runGenerator(): past loop8"));
  // 4b4f
  missionBits = targets[0].field_8 + targets[1].field_8;
  word_18994 = ((uint8)missionBits & 3) == 0;
  // 4b68
  missionBits = (missionBits & 0xf) << 8;
  // 4b75
  if ((targets[0].field_0 == 1) || (targets[1].field_0 == 1)) { // 4b83
    word_18994 = 0;
  }
  // 4b89
  if ((targets[0].field_0 == 4) || (targets[1].field_0 == 4)) { // 4b97
    word_18994 = 1;
  } // 4b9d
  word_1DD38 -= (missionBits + word_1DD38) % 0x96;
  TRACE(("runGenerator(): exiting"));
}

// 4bb4
int findOrPlaceItem(int wx, int wy, int slot) {
    int j;
    // 4bf2
    if ((word_1B960 = findNearestTerrain((long)wx << WORLD_COORD_SHIFT , (0x8000 - (long)wy) << WORLD_COORD_SHIFT)) != NULL) { // 4bfc
        // 4c10
        wx = ((long*)word_1B960)[1] >> WORLD_COORD_SHIFT;
        wy = -((((long*)word_1B960)[2] >> WORLD_COORD_SHIFT) - 0x8000);
        // 4c31
        for (j = FIRST_REAL_ITEM; j < readItemSize; j++) { // 4c43
            // 4c4e
            if (wx == wldReadBuf4[j].field_2 && wy == wldReadBuf4[j].field_4) return j;
        } // 4c63
        wldReadBuf4[slot].field_2 = wx;
        wldReadBuf4[slot].field_4 = wy;
        wldReadBuf4[slot].field_E = *word_1B960 + 0x100;
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
    return approxDistance(wldReadBuf4[idx1].field_2 - wldReadBuf4[idx2].field_2,
        wldReadBuf4[idx1].field_4 - wldReadBuf4[idx2].field_4);
}

// 4cc5
int positionUnit(int unit, int loc) {
    int j;
    // 4cd9
    j = wldReadBuf6[unit].field_16;
    // 4cea
    wldReadBuf6[unit].field_2 = wldReadBuf4[loc].field_2 + 9;
    wldReadBuf6[unit].field_4 = wldReadBuf4[loc].field_4 - 0xc;
    // 4d0b
    wldReadBuf6[unit].field_8 = (long)wldReadBuf6[unit].field_2 << WORLD_COORD_SHIFT;
    wldReadBuf6[unit].field_C = (long)wldReadBuf6[unit].field_4 << WORLD_COORD_SHIFT;
    // 4d2d
    wldReadBuf6[unit].field_6 = wldReadBuf4[loc].field_8 & 0x200 ? 0x8c : 0xc;
    wldReadBuf6[unit].field_1A = planes[j].field_12;
    wldReadBuf6[unit].field_10 = 0xfc00;
    wldReadBuf6[unit].field_12 = 0;
    wldReadBuf6[unit].field_14 = 0;
    wldReadBuf6[unit].field_18 |= 0x403;
    // 4d6b
    wldReadBuf6[unit].field_0 = loc;
    // 4d8c
    wldReadBuf6[unit].field_1C = ((long)planes[j].field_14 << 0xd) / wldReadBuf6[unit].field_1A;
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
    fread(&wldReadBuf2, 2, 1, fileHandle);
    fread(&wldReadBuf3, 2, 1, fileHandle);
    fread(wldReadBuf4, BUF4ITEMSIZE, readItemSize, fileHandle);
    fread(&wldReadBuf5Size, 2, 1, fileHandle);
    fread(wldReadBuf6, BUF6ITEMSIZE, wldReadBuf5Size, fileHandle);
    fread(wldReadBuf7, BUF7SIZE, 1, fileHandle);
    fread(wldReadBuf8, BUF7SIZE, 1, fileHandle);
    fread(wldReadBuf9, BUF7SIZE, 1, fileHandle);
    fread(wldReadBuf10, 1, BUF10SIZE, fileHandle);
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
    memAppend(&wldReadBuf2, 2, 1, fileHandle);
    // 0x4fe5
    memAppend(&wldReadBuf3, 2, 1, fileHandle);
    // 0x4ffb
    memAppend(wldReadBuf4, 0x10, readItemSize, fileHandle);
    // 0x5011
    memAppend(&wldReadBuf5Size, 2, 1, fileHandle);
    // 0x5027
    memAppend(wldReadBuf6, 0x24, wldReadBuf5Size, fileHandle);
    // 0x503c
    memAppend(wldReadBuf7, 0x64, 1, fileHandle);
    // 0x5053
    memAppend(wldReadBuf8, 0x64, 1, fileHandle);
    // 0x5069
    memAppend(wldReadBuf11, 1, WORLD_BUFSZ, fileHandle);
    // 0x507f
    memAppend(wldReadBuf10, 1, 0x100, fileHandle);
    // 0x5095
    memAppend(&word_1DD38, 2, 1, fileHandle);
    // 0x50ab
    memAppend(&word_1B148, 2, 1, fileHandle);
    // 0x50be
    memAppend(&word_182BA, 4, 4, fileHandle);
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
int setMoveDstComm7A() {
    moveDst = (uint8 FAR*)(&commData->worldBuf);
    return 1;
}

// 52bb
int memAppend(void *ptr, int itemsz, int count, int unused) {
    void FAR *farptr;
    farptr = ptr;
    // 52dd
    movedata(FP_SEG(farptr), FP_OFF(farptr), FP_SEG(moveDst), FP_OFF(moveDst), itemsz * count);
    moveDst += itemsz * count;
}

// 52f1
int doNothing() {
}

// 52f4
char* getItemCoordStr(int idx) {
    // 530f
    return formatGridRef(wldReadBuf4[idx].field_2, wldReadBuf4[idx].field_4, gameData->theater);
}

// 531c
char* formatGridRef(int wx, int wy) {
    int gridOffX, gridOffY;
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
    byte_1B0D2 += (int8)wx;
    wy = (((wy >> WORLD_COORD_SHIFT) * 0x14) >> 0xa) + gridOffY;
    // 5450
    while (wy > 9) {
        wy -= 0xa;
        byte_1B0D1--;
    }
    byte_1B0D3[0] += 9 - (int8)wy;
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
    mystrcpy(todayMissStrBuf, wldOffsets[wldReadBuf4[idx].field_E & 0x7f]);
    // 54d3
    if (mystrlen(wldOffsets[wldReadBuf4[idx].field_0]) != 0) { // 54dd
        // 54f1
        if (mystrlen(wldOffsets[wldReadBuf4[idx].field_E & 0x7f]) != 0) { // 54fb
            // 5503
            mystrcat(todayMissStrBuf, aAt);
        } // 5509
        // 551e
        mystrcat(todayMissStrBuf, wldOffsets[wldReadBuf4[idx].field_0]);
    } // 5524
    // 5528
    if (mystrlen(todayMissStrBuf) > 0x1e) { // 5533
      byte_1B0FF = 0x2e;
      byte_1B100[0] = 0;
    }
    // 5540
}
