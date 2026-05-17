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
    int16 j, dx, n, p, x1, k, dy, i, cx, gx, q, y1, cur;
    int16 sy;
    int16 ty;
    uint32 fx;
    word_1D5D6 = 0x7fff;
    for (k = 1; k <= 2; k++) { // 3819
        for (i = 0; i < 9; i++) { // 382c
            // 383b
            fx = scaleCoordByLevel(k, worldX);
            // 384d
            gx = fx >> 0xc;
            // 3856
            x1 = (int16)fx & 0xfff;
            // 3868
            fx = scaleCoordByLevel(k, worldY);
            // 387a
            y1 = fx >> 0xc;
            dy = (int16)fx & 0xfff;
            dx = word_17FFE[i];
            p = word_18010[i];
            sy = word_18026[dx] - x1 + 0x800;
            j = word_18026[p] - dy + 0x800;
            y1 += p;
            // 38d2
            cur = lookupGridCell(k, gx += dx, y1);
            // 38db
            if (cur != 0xffff) {
                // 38f2
                word_1E24A = (int16)terrainPtrUnk[k].field_0[cur];
                // 38f5
                for (cx = 0; (uint16)terrainBuf2[k].field_0[cur] > cx; cx++) { // 3917
                    // 3920
                    if (wldReadBuf9[((uint8*)(word_1E24A))[6]] != 0) { // 3929
                        ty = *((uint16*)word_1E24A) + sy;
                        // 393b
                        q = *((uint16*)word_1E24A + 1) + j;
                        n = abs(ty) + abs(q);
                        if (k == 1) { // 395b
                            n >>= 2;
                        }
                        else { // 3962
                            ty <<= 2;
                            q <<= 2;
                        } // 396a
                        if (n < word_1D5D6) { // 3972
                            byte_1D5E2 = (int8)k;
                            byte_1D5E3 = (int8)cx;
                            byte_1D5E4 = (int8)gx;
                            byte_1D5E5[0] = (int8)y1;
                            // 398d
                            word_1D5E0 = word_1E24A;
                            word_1D5D4 = ((uint8*)word_1D5E0)[6];
                            word_1D5D6 = n;
                            dword_1D5D8 = ty + worldX;
                            dword_1D5DC = q + worldY;
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
  int j;
  int l;
  int n;
  int p;
  int i;
  int k;
  int m;
  int y;
  int16 cx;
  int16 ty;
  int gx;
  int q;
  int16 cur;
  int16 raw[4];
  int16 col;
  int num;
  int r;
  int off;
  int dy;

  TRACE(("runGenerator(): entering"));
  // 409d
  j = word_1DD38 = 0;
  gx = 0xfa;
  // 40a8
restart_40a8:
  do {
    TRACE(("runGenerator(): outer, %d", j));
    j = j + 1;
    if (999 < j) goto counterMore1k;
    // 40b5
    do {
      TRACE(("runGenerator(): inner"));
      if (missionPick != -1) {
        TRACE(("runGenerator(): inner branch 1"));
        // 40c6
        cur = randMul(word_19324[missionPick]);
        // 40e9
        targets[0].field_2 = findOrPlaceItem(off_19304[missionPick][cur],
          off_19314[missionPick][cur], 1);
      }
      // 40f4
      else {
        TRACE(("runGenerator(): inner branch 2"));
        do {
          TRACE(("runGenerator(): inner branch 2 loop 1"));
          do {
            TRACE(("runGenerator(): inner branch 2 loop 2"));
            // 40f8
            cur = randMul(0xe0) * 0x80 + 0x840;
            // 410c
            col = randMul(0xe0) * 0x80 + 0x840;
          // 412d
          } while ((wldReadBuf10[(cur >> 0xb) + ((col >> 0xb) * 0x10)] & 3) != 0);
          // 413e
        } while ((targets[0].field_2 = findOrPlaceItem(cur,col,1)) == 0xffff);
      }
      TRACE(("runGenerator(): past inner check 1"));
      // 414c
      if (missionPick == 7) {
        // 4172
        target2.field_2 = findOrPlaceItem(off_19304[missionPick][cur],
          off_19314[missionPick][cur] + 0x28, 2);
      }
      // 417e
      else if (missionPick == 2) {
        cur = cur * 2 + randMul(2);
        // 41a9
        target2.field_2 = findOrPlaceItem(word_192EC[cur], word_192F4[cur], 2);
      }
      // 41b5
      else if (missionPick == 6) {
        cur = randMul(6) + cur + 1 & 7;
        // 41e0
        target2.field_2 = findOrPlaceItem(word_19294[cur], word_192A4[cur], 2);
      }
      // 41eb
      else {
        do {
          do {
            // 41ef
            cur = randMul(0xe0) * 0x80 + 0x840;
            // 4203
            col = randMul(0xe0) * 0x80 + 0x840;
          // 4224
          } while ((wldReadBuf10[(cur >> 0xb) + (col >> 0xb) * 0x10] & 3) != 0);
          // 4235
          target2.field_2 = findOrPlaceItem(cur, col, 2);
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
  for (off = 0; off < 2; off++) {
    TRACE(("runGenerator(): loop 2, counter %d", off));
    // 42b8
    raw[off] = 0x7fff;
    // 42bd
    for (num = wldReadBuf3; num < readItemSize; num++) {
      // 42d3
      if (((wldReadBuf4[num].field_8 & 0x500) != 0)
        && ((wldReadBuf4[num].field_8 & 0x201) != 0)
        && ((wldReadBuf4[num].field_8 & 0x800) == 0)) {
        // placed in var_1C in IDA, but this looks like an array, sort out stack layout later
        // 4332
        raw[2] = clampValue(itemDistance(targets[off].field_2, num) + ((wldReadBuf4[num].field_8 & 0x100) != 0 ? randMul(100) * 0x40 + 0xc80 : 0), 0, 0x7fff);
        // 433b
        if ((raw[2] < 0x7000) && (randMul(0x500) + raw[2] < raw[off])) {
          // 4357
          targets[off].field_4 = num;
          raw[off] = raw[2];
        }
      }
    }
  }
  TRACE(("runGenerator(): past loop2"));
  // 4377
  if (gameData->theater != THEATER_DS) {
    // 438a
    l = (itemDistance(targets[0].field_2, targets[1].field_2) >> 6) + (raw[0] >> 6) + (raw[1] >> 6);
    // 43a5
    if (((j + 0x2e4 < l) || (l < gx)) && ((wldReadBuf4[targets[0].field_4].field_8 & 0x200) == 0)) {
      // 43c8
      gx -= 5 - difficultySaved;
      goto restart_40a8;
    }
  }
  // 43d7
  else {
    if (raw[0] == 0x7fff) {
      if (raw[1] == 0x7fff) goto restart_40a8;
      raw[0] = raw[1];
      // 43ee
      targets[0].field_4 = targets[1].field_4;
    }
  }
  TRACE(("runGenerator(): past DS check"));
  // 43f4
  for (num = 0; num < 2; num++) {
    TRACE(("runGenerator(): loop3, counter %d", num));
    // 4407
    targets[num].field_0 = 0;
    // 4415
    for (dy = 0; dy < 2; dy++) {
      r = 0;
      // 442d
      for (off = 0; off < 0x38; off++) { // 4440
        if (wldReadBuf9[wldReadBuf4[targets[num].field_2].field_E & 0x7f] == stru_18FC0[off].field_2
            && strcmp(wldOffsets[targets[num].field_2], aPowCamp) != 0) {
          // 4487
          if ((dy != 0) && (r == y)) {
            // 4495
            targets[num].field_0 = stru_18FC0[off].field_0;
            targets[num].field_8 = off;
            targets[num].field_6 = stru_18FC0[off].field_4;
            // 44c3
            if (stru_18FC0[off].field_6 > 0) {
              // 44ca
              targets[num].field_6 += (stru_18FC0[off].field_6 << 8) ;
            }
          }
          r++;
        }
      }
      // 44dd
      y = randMul(r);
    }
  }
  TRACE(("runGenerator(): past loop3"));
  // 44ec
  if ((targets[0].field_0 == 0) || (targets[1].field_0 == 0)) {
    TRACE(("runGenerator(): restart 1"));
    goto restart_40a8;
  }
  // 44fd
  if ((raw[0] < raw[1]) && (missionPick == -1)) {
    // 450c
    cx = targets[0].field_2;
    targets[0].field_2 = targets[1].field_2;
    targets[1].field_2 = cx;
    cx = targets[0].field_0;
    targets[0].field_0 = targets[1].field_0;
    targets[1].field_0 = cx;
    cx = targets[0].field_4;
    targets[0].field_4 = targets[1].field_4;
    targets[1].field_4 = cx;
    cx = targets[0].field_8;
    targets[0].field_8 = targets[1].field_8;
    targets[1].field_8 = cx;
    cx = targets[0].field_6;
    targets[0].field_6 = targets[1].field_6;
    targets[1].field_6 = cx;
    cx = raw[0];
    raw[0] = raw[1];
    raw[1] = cx;
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
  for (num = 0; num < 2; num++) {
    TRACE(("runGenerator(): loop4, counter %d", num));
    // 45e2
    mystrcpy(targets[num].coord, getItemCoordStr(targets[num].field_2));
    // 45f0
    if (targets[num].field_2 < FIRST_REAL_ITEM) {
      cx = 0x7fff;
      // 45ff
      for (off = FIRST_REAL_ITEM; off < readItemSize; off++) {
        // 4611
        if ((wldReadBuf4[off].field_8 & 0x500) == 0
            && itemDistance(off, targets[num].field_2) < cx
            && wldReadBuf4[off].field_0 != 0) {
          // 4648
          cx = itemDistance(off, targets[num].field_2);
          // 4679
          wldReadBuf4[targets[num].field_2].field_0 = wldReadBuf4[off].field_0;
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
  for (num = 0; num < wldReadBuf5Size - 4; num++) { // 47cb8
    TRACE(("runGenerator(): loop5, counter %d", num));
    // 47c4
    if ((wldReadBuf6[num].field_18 & 0x80) != 0) {
      // 47ea
      ty = (raw[0] / 4) * (4 - difficultySaved);
      // 47ed
      if ((wldReadBuf6[num].field_18 & 0x40) != 0) {
        ty = raw[0] << 1;
      }
      // 47fb
      do {
        // 480b
        raw[2] = randMul(wldReadBuf3 - FIRST_REAL_ITEM) + FIRST_REAL_ITEM;
      // 4814
      } while ((wldReadBuf4[raw[2]].field_8 & 0x100) || approxDistance(word_182BA - wldReadBuf4[raw[2]].field_2, word_182BC - wldReadBuf4[raw[2]].field_4) > (ty += 0x10));
      // 4841
      positionUnit(num, raw[2]);
      ty = 0x3000;
      // 484c
      m = calcBearing(wldReadBuf4[targets[0].field_4].field_2 - wldReadBuf6[num].field_2, wldReadBuf6[num].field_4 - wldReadBuf4[targets[0].field_4].field_4);
      // 4877
      for (off = 0; off < 8; off++) {
        // 488b
        k = randMul(wldReadBuf3) + 1;
        if ((wldReadBuf4[k].field_8 & 0x400) == 0) {
          // 48bd
          n = calcBearing(wldReadBuf4[k].field_2 - wldReadBuf6[num].field_2, wldReadBuf6[num].field_4 - wldReadBuf4[k].field_4);
          // 48d3
          if (abs(m - n) < ty) {
            // 48e5
            ty = abs(m - n);
            // 48f3
            wldReadBuf6[num].field_0 = k;
            break;
          }
        }
      }
    }
    // 48fb
    if (((wldReadBuf6[num].field_18 & 0x100) != 0) && (word_1B148 != -1)) {
      // 4919
      positionUnit(num, word_1D00A);
      wldReadBuf6[num].field_1C = DEFAULT_FUEL;
    }
    // 492d
    if (num != 0) {
      raw[2] = 0;
      do {
        // 4948
        k = randMul(wldReadBuf3 - FIRST_REAL_ITEM) + FIRST_REAL_ITEM;
      // 4964
      } while ((((wldReadBuf4[k].field_8 & 0x801) != 1) || (wldReadBuf4[k].field_C != 0)) && raw[2]++ < 20);
      // 496f
      wldReadBuf4[k].field_A = wldReadBuf6[num].field_16;
      wldReadBuf4[k].field_C = randMul(theaterSaved + 1) + 1;
    } // 4996
  }
  TRACE(("runGenerator(): past loop5"));
  // 4999
  for (num = 0; num < wldReadBuf2; num++) { // 49ae
    TRACE(("runGenerator(): loop6, counter %d", num));
    q = wldReadBuf4[num].field_6;
    // 49b9
    if ((q != 0) && (q != 21)) { // 49cb
      // 4a0d
      switch((gameData->isCampaignMission != 0) + randMul(5) + difficultySaved) {
      case 0:
      case 1:
      case 3:
        // 49eb
        q = stru_1892E[q].field_2;
      case 2:
      case 4:
      case 6:
        break;
      case 5:
      case 7:
      case 8:
        // 49fb
        q = stru_1892E[q].field_0;
        break;
      } // 4a2c
      // 4a36
      wldReadBuf4[num].field_6 = q;
      if (((wldReadBuf4[num].field_8 & 8) != 0) && gameData->isCampaignMission + difficultySaved + 2 < randMul(10)) { // 4a5e
        // 4a65
        wldReadBuf4[num].field_6 = 0;
      }
    } // 4a6b
  }
  TRACE(("runGenerator(): past loop6"));
  // 4a6e
  for (cur = 0; (int)cur < 0x10; cur++) { // 4a7e
    for (col = 0; col < 0x10; col++) { // 4a8e
      if (((wldReadBuf10[col + cur * 0x10] & 0x10) != 0) && randMul(5) >= difficultySaved) { // 4aaf
        wldReadBuf10[col + cur * 0x10] &= 0xef;
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
  for (num = 0; num < 3; num++) { // 4b23
    TRACE(("runGenerator(): loop8, counter %d", num));
    // 4b49
    commData->unk8[num] = word_189B6[commData->unk7[num] * 0x34];
  }
  TRACE(("runGenerator(): past loop8"));
  // 4b4f
  p = targets[0].field_8 + targets[1].field_8;
  word_18994 = ((uint8)p & 3) == 0;
  // 4b68
  p = (p & 0xf) << 8;
  // 4b75
  if ((targets[0].field_0 == 1) || (targets[1].field_0 == 1)) { // 4b83
    word_18994 = 0;
  }
  // 4b89
  if ((targets[0].field_0 == 4) || (targets[1].field_0 == 4)) { // 4b97
    word_18994 = 1;
  } // 4b9d
  word_1DD38 -= (p + word_1DD38) % 0x96;
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
    int16 j, l;
    int32 n;
    int16 i, k, m;
    if (dx == 0) { // 50f8
        return (dy > 0) ? 0 : BEARING_SOUTH;
    } // 5108
    if (dy == 0) { // 510e
        return (dx > 0) ? BEARING_EAST : BEARING_WEST;
    } // 511f
    if (abs(dx) > abs(dy)) { // 5137
        // 514d
        n = (int32)abs(dy) << 0xe;
        i = abs(dx);
        k = 1;
    }
    else { // 5166
        // 517c
        n = (int32)abs(dx) << 0xe;
        i = abs(dy);
        k = 0;
    } // 5193
    m = n / (int32)i;
    // 51eb
    j = ((0x2800 - (((int32)abs((0x1333 - m)) * (int32)0xb00) >> 0xe)) * (int32)m) >> 0xe;
    // 51ee
    if (dx > 0) { // 51f4
        if (dy > 0) { // 51fa
            l = k != 0 ? BEARING_EAST - j : j;
        }
        else { // 5210
            l = (k != 0) ? j + BEARING_EAST : BEARING_SOUTH - j;
        } // 5227
    }
    else { // 5229
        if (dy > 0) { // 522f
            l = (k != 0) ? j + BEARING_WEST : -j;
        }
        else { // 5247
            l = (k != 0) ? BEARING_WEST - j : j + BEARING_SOUTH;

        } // 525e
    } // 525e
    return l;
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
    int j, l;
    switch (gameData->theater) { // 53f2
    case 0:
        mystrcpy(&bufCoordStr, aTd00);
        j = 6;
        l = 4;
        break;
    case 1:
        mystrcpy(&bufCoordStr, aJz00);
        j = 0;
        l = 0;
        break;
    case 2:
        mystrcpy(&bufCoordStr, aXv00);
        j = 0;
        l = 0;
        break;
    case 3:
        mystrcpy(&bufCoordStr, aEs00);
        j = 0;
        l = 0;
        break;
    case 4:
        mystrcpy(&bufCoordStr, aWx00);
        j = 0;
        l = 0;
        break;
    case 5:
        mystrcpy(&bufCoordStr, aCc00);
        j = 3;
        l = 5;
        break;
    case 6:
        mystrcpy(&bufCoordStr, aHz00);
        j = 0;
        l = 0;
        break;
    default: // 53e6
        bufCoordStr = 0;
        return &bufCoordStr;
    } // 540d
    // 5420
    wx = (((wx >> WORLD_COORD_SHIFT) * 0x14) >> 0xa) + j;
    while (wx > 9) { // 5427
        wx -= 0xa;
        bufCoordStr++;
    } // 5433
    byte_1B0D2 += (int8)wx;
    wy = (((wy >> WORLD_COORD_SHIFT) * 0x14) >> 0xa) + l;
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
