// offsets based on F-15 SE2 v451.03 start.exe (unpacked) MD5: cf6e997ed4582cf82db6ec37d2b1a6fd
#include "struct.h"
#include "start.h"
#include "pointers.h"
#include "comm.h"

#include <memory.h>
#include <dos.h>
#include <STDARG.H>

// 37f8
int sub_137F8(int32 arg_0, int32 arg_4) {
    int16 var_2, var_4, var_6, var_8, var_A, var_C, var_E, var_10, var_12, var_16, var_18, var_1A, var_20;
    int16 var_22;
    int16 var_14;
    uint32 var_1E;
    word_1D5D6 = 0x7fff;
    for (var_C = 1; var_C <= 2; var_C++) { // 3819
        for (var_10 = 0; var_10 < 9; var_10++) { // 382c
            // 383b
            var_1E = sub_139E9(var_C, arg_0);
            // 384d
            var_16 = var_1E >> 0xc;
            // 3856
            var_A = (int16)var_1E & 0xfff;
            // 3868
            var_1E = sub_139E9(var_C, arg_4);
            // 387a
            var_1A = var_1E >> 0xc;
            var_E = (int16)var_1E & 0xfff;
            var_4 = word_17FFE[var_10];
            var_8 = word_18010[var_10];
            var_22 = word_18026[var_4] - var_A + 0x800;
            var_2 = word_18026[var_8] - var_E + 0x800;
            var_1A += var_8;
            // 38d2
            var_20 = sub_13A61(var_C, var_16 += var_4, var_1A);
            // 38db
            if (var_20 != 0xffff) {
                // 38f2
                word_1E24A = (int16)terrainPtrUnk[var_C].field_0[var_20];
                // 38f5
                for (var_12 = 0; (uint16)terrainBuf2[var_C].field_0[var_20] > var_12; var_12++) { // 3917
                    // 3920
                    if (wldReadBuf9[((uint8*)(word_1E24A))[6]] != 0) { // 3929
                        var_14 = *((uint16*)word_1E24A) + var_22;
                        // 393b
                        var_18 = *((uint16*)word_1E24A + 1) + var_2;
                        var_6 = abs(var_14) + abs(var_18);
                        if (var_C == 1) { // 395b
                            var_6 >>= 2;
                        }
                        else { // 3962
                            var_14 <<= 2;
                            var_18 <<= 2;
                        } // 396a
                        if (var_6 < word_1D5D6) { // 3972
                            byte_1D5E2 = (int8)var_C;
                            byte_1D5E3 = (int8)var_12;
                            byte_1D5E4 = (int8)var_16;
                            byte_1D5E5[0] = (int8)var_1A;
                            // 398d
                            word_1D5E0 = word_1E24A;
                            word_1D5D4 = ((uint8*)word_1D5E0)[6];
                            word_1D5D6 = var_6;
                            dword_1D5D8 = var_14 + arg_0;
                            dword_1D5DC = var_18 + arg_4;
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
int32 sub_139E9(int arg_0, uint32 arg_2) {
    switch (arg_0) { // 3a43
    case 4: // 39f1
        return arg_2 >> 6;
    case 3:
        return arg_2 >> 4;
    case 2:
        return arg_2 >> 2;
    case 1:
        return arg_2;
    case 0:
        return arg_2 << 1;
    }
}

// 3a61
int sub_13A61(int16 arg_0, int16 arg_2, int16 arg_4) {
    if (arg_0 < 0 || arg_4 < 0 || arg_2 >= word_18026[arg_0 + 6] || arg_4 >= word_18026[arg_0 + 6]) 
        return -1;
    // 3a8a
    switch (arg_0) { // 3b61
    case 4: // 3a90
        return gridBuf1[arg_2 + (arg_4 << 2)];
    case 3: // 3aa3
        return gridBuf2[arg_2 + (arg_4 << 4)];
    case 2: // 3ab6
        return gridBuf3[(arg_2 & 3) + (((arg_4 & 3) << 2) + (sub_13A61(3, arg_2 >> 2, arg_4 >> 2) << 4))];
    case 1: // 3aef
        return gridBuf4[(arg_2 & 3) + (((arg_4 & 3) << 2) + (sub_13A61(2, arg_2 >> 2, arg_4 >> 2) << 4))];
    case 0: // 3b27
        return gridBuf5[(arg_2 & 3) + (((arg_4 & 3) << 2) + (sub_13A61(1, arg_2 >> 2, arg_4 >> 2) << 4))];
    }
}

// 0x4042
void missionGenerate() {
    difficultySaved = gameData->difficulty;
    theaterSaved = gameData->theater & 3;
    flag4Saved = gameData->flag4;
    parseWorld(worldFiles[gameData->theater]);
    mystrcpy(regnPlhPtr, plhFiles[gameData->theater]);
    parseGridTerrain();
    sub_14093();
}

// 4093
void sub_14093()
{
  int var_2;
  int var_4;
  int var_6;
  int var_8;
  int var_A;
  int var_C;
  int var_E;
  int var_10;
  int16 var_12;
  int16 var_14;
  int var_16;
  int var_18;
  int16 var_1A;
  int16 var_20[4];
  int16 var_24;
  int var_26; 
  int var_28;
  int var_2A;
  int var_2C;
  
  // 409d
  var_2 = word_1DD38 = 0;
  var_16 = 0xfa;
  // 40a8
restart_40a8:
  do {
    var_2 = var_2 + 1;
    if (999 < var_2) goto counterMore1k;
    // 40b5
    do {
      if (missionPick != -1) {
        // 40c6
        var_1A = randMul(word_19324[missionPick]);
        // 40e9
        targets[0].field_2 = sub_14BB4(off_19304[missionPick][var_1A], 
          off_19314[missionPick][var_1A], 1);
      }
      // 40f4
      else {
        do {
          do {
            // 40f8
            var_1A = randMul(0xe0) * 0x80 + 0x840;
            // 410c
            var_24 = randMul(0xe0) * 0x80 + 0x840;
          // 412d
          } while ((wldReadBuf10[(var_1A >> 0xb) + ((var_24 >> 0xb) * 0x10)] & 3) != 0);
          // 413e
        } while ((targets[0].field_2 = sub_14BB4(var_1A,var_24,1)) == 0xffff);
      }
      // 414c
      if (missionPick == 7) {
        // 4172
        target2.field_2 = sub_14BB4(off_19304[missionPick][var_1A], 
          off_19314[missionPick][var_1A] + 0x28, 2);
      }
      // 417e
      else if (missionPick == 2) {
        var_1A = var_1A * 2 + randMul(2);
        // 41a9
        target2.field_2 = sub_14BB4(word_192EC[var_1A], word_192F4[var_1A], 2);
      }
      // 41b5
      else if (missionPick == 6) {
        var_1A = randMul(6) + var_1A + 1 & 7;
        // 41e0
        target2.field_2 = sub_14BB4(word_19294[var_1A], word_192A4[var_1A], 2);
      }
      // 41eb
      else {
        do {
          do {
            // 41ef
            var_1A = randMul(0xe0) * 0x80 + 0x840;
            // 4203
            var_24 = randMul(0xe0) * 0x80 + 0x840;
          // 4224
          } while ((wldReadBuf10[(var_1A >> 0xb) + (var_24 >> 0xb) * 0x10] & 3) != 0);
          // 4235
          target2.field_2 = sub_14BB4(var_1A, var_24, 2);
        } while ((target2.field_2 == -1) || ((missionPick == 0 && (wldReadBuf4[target2.field_2].field_6 == 0))));
      }
    // 4257
    } while ((targets[0].field_2 == target2.field_2) || (sub_14C94(targets[0].field_2, target2.field_2) >> 6) > 200);
  // 427a
  } while ((gameData->theater != THEATER_DS) && (wldReadBuf4[targets[0].field_2].field_E == wldReadBuf4[target2.field_2].field_E));
  // 42a0
  for (var_2A = 0; var_2A < 2; var_2A++) {
    // 42b8
    var_20[var_2A] = 0x7fff;
    // 42bd
    for (var_26 = wldReadBuf3; var_26 < readItemSize; var_26++) {
      // 42d3
      if (((wldReadBuf4[var_26].field_8 & 0x500) != 0)
        && ((wldReadBuf4[var_26].field_8 & 0x201) != 0)
        && ((wldReadBuf4[var_26].field_8 & 0x800) == 0)) {
        // placed in var_1C in IDA, but this looks like an array, sort out stack layout later
        // 4332
        var_20[2] = sub_15472(sub_14C94(targets[var_2A].field_2, var_26) + ((wldReadBuf4[var_26].field_8 & 0x100) != 0 ? randMul(100) * 0x40 + 0xc80 : 0), 0, 0x7fff);
        // 433b
        if ((var_20[2] < 0x7000) && (randMul(0x500) + var_20[2] < var_20[var_2A])) {
          // 4357 
          targets[var_2A].field_4 = var_26;
          var_20[var_2A] = var_20[2];
        }
      }
    }
  }
  // 4377
  if (gameData->theater != THEATER_DS) {
    // 438a
    var_4 = (sub_14C94(targets[0].field_2, targets[1].field_2) >> 6) + (var_20[0] >> 6) + (var_20[1] >> 6);
    // 43a5
    if (((var_2 + 0x2e4 < var_4) || (var_4 < var_16)) && ((wldReadBuf4[targets[0].field_4].field_8 & 0x200) == 0)) {
      // 43c8
      var_16 -= 5 - difficultySaved;
      goto restart_40a8;
    }
  }
  // 43d7
  else {
    if (var_20[0] == 0x7fff) {
      if (var_20[1] == 0x7fff) goto restart_40a8;
      var_20[0] = var_20[1];
      // 43ee
      targets[0].field_4 = targets[1].field_4;
    }
  }
  // 43f4
  for (var_26 = 0; var_26 < 2; var_26++) {
    // 4407
    targets[var_26].field_0 = 0;
    // 4415
    for (var_2C = 0; var_2C < 2; var_2C++) {
      var_28 = 0;
      // 442d
      for (var_2A = 0; var_2A < 0x38; var_2A++) { // 4440
        if (wldReadBuf9[wldReadBuf4[targets[var_26].field_2].field_E & 0x7f] == stru_18FC0[var_2A].field_2 
            && strcmp(wldOffsets[targets[var_26].field_2], aPowCamp) != 0) {
          // 4487
          if ((var_2C != 0) && (var_28 == var_10)) {
            // 4495
            targets[var_26].field_0 = stru_18FC0[var_2A].field_0;
            targets[var_26].field_8 = var_2A;
            targets[var_26].field_6 = stru_18FC0[var_2A].field_6;
            // 44c3
            if (stru_18FC0[var_2A].field_6 > 0) {
              // 44ca
              targets[var_26].field_6 += (stru_18FC0[var_2A].field_6 << 8) ;
            }
          }
          var_28++;
        }
      }
      // 44dd
      var_10 = randMul(var_28);
    }
  }
  // 44ec
  if ((targets[0].field_0 == 0) || (targets[1].field_0 == 0)) goto restart_40a8;
  // 44fd
  if ((var_20[0] < var_20[1]) && (missionPick == -1)) {
    // 450c
    var_12 = targets[0].field_2;
    targets[0].field_2 = targets[1].field_2;
    targets[1].field_2 = var_12;
    var_12 = targets[0].field_0;
    targets[0].field_0 = targets[1].field_0;
    targets[1].field_0 = var_12;
    var_12 = targets[0].field_4;
    targets[0].field_4 = targets[1].field_4;
    targets[1].field_4 = var_12;
    var_12 = targets[0].field_8;
    targets[0].field_8 = targets[1].field_8;
    targets[1].field_8 = var_12;
    var_12 = targets[0].field_6;
    targets[0].field_6 = targets[1].field_6;
    targets[1].field_6 = var_12;
    var_12 = var_20[0];
    var_20[0] = var_20[1];
    var_20[1] = var_12;
  }
  // 4578
  if (targets[0].field_0 == 4) goto restart_40a8;
  // 4582
  word_1B148 = 0xffff;
  // 4588
  if (stru_18FC0[targets[0].field_8].field_6 < 0) { //459e
    wldReadBuf6[0].field_16 = -stru_18FC0[targets[0].field_8].field_6;
  }
  // 45a5
  if (word_1B148 == 0) {
    wldReadBuf6[0].field_1C = 19999;
  }
  // 45b2
  for (var_26 = 0; var_26 < 2; var_26++) {
    // 45e2
    mystrcpy(targets[var_26].coord, sub_152F4(targets[var_26].field_2));
    // 45f0
    if (targets[var_26].field_2 < 3) {
      var_12 = 0x7fff;
      // 45ff
      for (var_2A = 3; var_2A < readItemSize; var_2A++) {
        // 4611
        if ((wldReadBuf4[var_2A].field_8 & 0x500) == 0
            && sub_14C94(var_2A, targets[var_26].field_2) < var_12
            && wldReadBuf4[var_2A].field_0 != 0) {
          // 4648
          var_12 = sub_14C94(var_2A, targets[var_26].field_2);
          // 4679
          wldReadBuf4[targets[var_26].field_2].field_0 = wldReadBuf4[var_2A].field_0;
        }
      }
    }
  }
  // 4689
  targets[0].field_10 = word_1DD38 >> 4;
counterMore1k:
  // 46a9
  dword_1D5D0 = (uint32)(wldReadBuf4[targets[0].field_4].field_2) << 5;
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
  dword_1D650 = ((0x8000 - (int32)(wldReadBuf4[targets[0].field_4].field_4)) << 5) - (int32)((wldReadBuf4[targets[0].field_4].field_8 & 0x200) ? 0 : 0x708);
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
  for (var_26 = 0; var_26 < wldReadBuf5Size - 4; var_26++) { // 47cb8
    // 47c4
    if ((wldReadBuf6[var_26].field_18 & 0x80) != 0) {
      // 47ea
      var_14 = (var_20[0] / 4) * (4 - difficultySaved);
      // 47ed
      if ((wldReadBuf6[var_26].field_18 & 0x40) != 0) {
        var_14 = var_20[0] << 1;
      }
      // 47fb
      do {
        // 480b
        var_20[2] = randMul(wldReadBuf3 - 3) + 3;
      // 4814
      } while ((wldReadBuf4[var_20[2]].field_8 & 0x100) || sub_14D96(word_182BA - wldReadBuf4[var_20[2]].field_2, word_182BC - wldReadBuf4[var_20[2]].field_4) > (var_14 += 0x10));
      // 4841
      sub_14CC5(var_26, var_20[2]);
      var_14 = 0x3000;
      // 484c
      var_E = sub_150EB(wldReadBuf4[targets[0].field_4].field_2 - wldReadBuf6[var_26].field_2, wldReadBuf6[var_26].field_4 - wldReadBuf4[targets[0].field_4].field_4);
      // 4877
      for (var_2A = 0; var_2A < 8; var_2A++) {
        // 488b
        var_C = randMul(wldReadBuf3) + 1;
        if ((wldReadBuf4[var_C].field_8 & 0x400) == 0) {
          // 48bd
          var_6 = sub_150EB(wldReadBuf4[var_C].field_2 - wldReadBuf6[var_26].field_2, wldReadBuf6[var_26].field_4 - wldReadBuf4[var_C].field_4);
          // 48d3
          if (abs(var_E - var_6) < var_14) {
            // 48e5
            var_14 = abs(var_E - var_6);
            // 48f3
            wldReadBuf6[var_26].field_0 = var_C;
            break;
          }
        }
      }
    }
    // 48fb
    if (((wldReadBuf6[var_26].field_18 & 0x100) != 0) && (word_1B148 != -1)) {
      // 4919
      sub_14CC5(var_26, word_1D00A);
      wldReadBuf6[var_26].field_1C = 19999;
    } 
    // 492d
    if (var_26 != 0) {
      var_20[2] = 0;
      do {
        // 4948
        var_C = randMul(wldReadBuf3 - 3) + 3;
      // 4964
      } while ((((wldReadBuf4[var_C].field_8 & 0x801) != 1) || (wldReadBuf4[var_C].field_C != 0)) && var_20[2]++ < 20);
      // 496f
      wldReadBuf4[var_C].field_A = wldReadBuf6[var_26].field_16;
      wldReadBuf4[var_C].field_C = randMul(theaterSaved + 1) + 1;
    } // 4996
  }
  // 4999
  for (var_26 = 0; var_26 < wldReadBuf2; var_26++) { // 49ae
    var_18 = wldReadBuf4[var_26].field_6;
    // 49b9
    if ((var_18 != 0) && (var_18 != 21)) { // 49cb
      // 4a0d
      switch((gameData->flag4 != 0) + randMul(5) + difficultySaved) {
      case 0:
      case 1:
      case 3:
        // 49eb
        var_18 = stru_1892E[var_18].field_2;
      case 2:
      case 4:
      case 6:
        break;
      case 5:
      case 7:
      case 8:
        // 49fb
        var_18 = stru_1892E[var_18].field_0;
        break;
      } // 4a2c
      // 4a36
      wldReadBuf4[var_26].field_6 = var_18;
      if (((wldReadBuf4[var_26].field_8 & 8) != 0) && gameData->flag4 + difficultySaved + 2 < randMul(10)) { // 4a5e
        // 4a65
        wldReadBuf4[var_26].field_6 = 0;
      }
    } // 4a6b
  }
  // 4a6e
  for (var_1A = 0; (int)var_1A < 0x10; var_1A++) { // 4a7e
    for (var_24 = 0; var_24 < 0x10; var_24++) { // 4a8e
      if (((wldReadBuf10[var_24 + var_1A * 0x10] & 0x10) != 0) && randMul(5) >= difficultySaved) { // 4aaf
        wldReadBuf10[var_24 + var_1A * 0x10] &= 0xef;
      }
    }
  } // 4ac2
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
  var_A = 0;
  // 4b13
  for (var_26 = 0; var_26 < 3; var_26++) { // 4b23
    // 4b49
    commData->unk8[var_26] = word_189B6[commData->unk7[var_26] * 0x1a];
  } 
  // 4b4f
  var_8 = targets[0].field_8 + targets[1].field_8;
  word_18994 = ((uint8)var_8 & 3) == 0;
  // 4b68
  var_8 = (var_8 & 0xf) << 8;
  // 4b75
  if ((targets[0].field_0 == 1) || (targets[1].field_0 == 1)) { // 4b83
    word_18994 = 0;
  }
  // 4b89
  if ((targets[0].field_0 == 4) || (targets[1].field_0 == 4)) { // 4b97
    word_18994 = 1;
  } // 4b9d
  word_1DD38 -= (var_8 + word_1DD38) % 0x96;
}

// 4bb4
int sub_14BB4(int arg_0, int arg_2, int arg_4) {
    int var_2;
    // 4bf2
    if ((word_1B960 = sub_137F8((long)arg_0 << 5 , (0x8000 - (long)arg_2) << 5)) != 0) { // 4bfc
        // 4c10
        arg_0 = ((long*)word_1B960)[1] >> 5;
        arg_2 = -((((long*)word_1B960)[2] >> 5) - 0x8000);
        // 4c31
        for (var_2 = 3; var_2 < readItemSize; var_2++) { // 4c43
            // 4c4e
            if (arg_0 == wldReadBuf4[var_2].field_2 && arg_2 == wldReadBuf4[var_2].field_4) return var_2;
        } // 4c63
        wldReadBuf4[arg_4].field_2 = arg_0;
        wldReadBuf4[arg_4].field_4 = arg_2;
        wldReadBuf4[arg_4].field_E = *((int*)word_1B960) + 0x100;
        return arg_4;
    }
    // 4c8a
    return -1;
    // 4c8f
}

// 4c94
// debugcom: manhattan distance
int sub_14C94(int arg_0, int arg_2) {
    // 4cb7
    return sub_14D96(wldReadBuf4[arg_0].field_2 - wldReadBuf4[arg_2].field_2, 
        wldReadBuf4[arg_0].field_4 - wldReadBuf4[arg_2].field_4);
}

// 4cc5
int sub_14CC5(int arg_0, int arg_2) {
    int var_2;
    // 4cd9
    var_2 = wldReadBuf6[arg_0].field_16;
    // 4cea
    wldReadBuf6[arg_0].field_2 = wldReadBuf4[arg_2].field_2 + 9;
    wldReadBuf6[arg_0].field_4 = wldReadBuf4[arg_2].field_4 - 0xc;
    // 4d0b
    wldReadBuf6[arg_0].field_8 = (long)wldReadBuf6[arg_0].field_2 << 5;
    wldReadBuf6[arg_0].field_C = (long)wldReadBuf6[arg_0].field_4 << 5;
    // 4d2d
    wldReadBuf6[arg_0].field_6 = wldReadBuf4[arg_2].field_8 & 0x200 ? 0x8c : 0xc;
    wldReadBuf6[arg_0].field_1A = planes[var_2].field_12;
    wldReadBuf6[arg_0].field_10 = 0xfc00;
    wldReadBuf6[arg_0].field_12 = 0;
    wldReadBuf6[arg_0].field_14 = 0;
    wldReadBuf6[arg_0].field_18 |= 0x403;
    // 4d6b
    wldReadBuf6[arg_0].field_0 = arg_2;
    // 4d8c
    wldReadBuf6[arg_0].field_1C = ((long)planes[var_2].field_14 << 0xd) / wldReadBuf6[arg_0].field_1A;
}

// 4d96
// debugcom: custom_manhattan_distance
int sub_14D96(int arg_0, int arg_2) {
    long var_2;
    // 4d9f
    arg_0 = abs(arg_0);
    arg_2 = abs(arg_2);
    // 4ddf
    var_2 = (arg_0 > arg_2) ? (long)(arg_2 >> 1) + (long)arg_0 : (long)(arg_0 >> 1) + (long)arg_2;
    // 4ddf
    if (var_2 > 0x7fff) {
        var_2 = 0x7fff;
    }
    // 4dfa
    return var_2;
}

// 4e03
void parseWorld(const char *filename) {
    int var_2, var_4;
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
    var_2 = 1;
    // 4f3d
    // iterate over the place name strings in the world data, find null bytes, build char pointer table
    for (var_4 = 0; var_4 < WORLD_BUFSZ; var_4++) {
        if (wldReadBuf11[var_4] == 0 && var_2 < 100) {
            wldOffsets[var_2++] = wldReadBuf11 + var_4 + 1;
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
int sub_150EB(int arg_0, int arg_2) {
    int16 var_2, var_4;
    int32 var_6;
    int16 var_A, var_C, var_E;
    if (arg_0 == 0) { // 50f8
        return (arg_2 > 0) ? 0 : 0x8000;
    } // 5108
    if (arg_2 == 0) { // 510e
        return (arg_0 > 0) ? 0x4000 : 0xc000;
    } // 511f
    if (abs(arg_0) > abs(arg_2)) { // 5137
        // 514d
        var_6 = (int32)abs(arg_2) << 0xe;
        var_A = abs(arg_0);
        var_C = 1;
    }
    else { // 5166
        // 517c
        var_6 = (int32)abs(arg_0) << 0xe;
        var_A = abs(arg_2);
        var_C = 0;
    } // 5193
    var_E = var_6 / (int32)var_A;
    // 51eb
    var_2 = ((0x2800 - (((int32)abs((0x1333 - var_E)) * (int32)0xb00) >> 0xe)) * (int32)var_E) >> 0xe;
    // 51ee
    if (arg_0 > 0) { // 51f4
        if (arg_2 > 0) { // 51fa
            var_4 = var_C != 0 ? 0x4000 - var_2 : var_2;
        } 
        else { // 5210
            var_4 = (var_C != 0) ? var_2 + 0x4000 : 0x8000 - var_2;
        } // 5227
    }
    else { // 5229
        if (arg_2 > 0) { // 522f
            var_4 = (var_C != 0) ? var_2 + 0xc000 : -var_2;
        }
        else { // 5247
            var_4 = (var_C != 0) ? 0xc000 - var_2 : var_2 + 0x8000;

        } // 525e
    } // 525e
    return var_4;
}

// 5268
int setMoveDstComm7A() {
    moveDst = (uint8 FAR*)(&commData->worlBuf);
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
char* sub_152F4(int arg_0) {
    // 530f
    return sub_1531C(wldReadBuf4[arg_0].field_2, wldReadBuf4[arg_0].field_4, gameData->theater);
}

// 531c
char* sub_1531C(int arg_0, int arg_2) {
    int var_2, var_4;
    switch (gameData->theater) { // 53f2
    case 0:
        mystrcpy(&bufCoordStr, aTd00);
        var_2 = 6;
        var_4 = 4;
        break;
    case 1:
        mystrcpy(&bufCoordStr, aJz00);
        var_2 = 0;
        var_4 = 0;
        break;
    case 2:
        mystrcpy(&bufCoordStr, aXv00);
        var_2 = 0;
        var_4 = 0;
        break;
    case 3:
        mystrcpy(&bufCoordStr, aEs00);
        var_2 = 0;
        var_4 = 0;
        break;
    case 4:
        mystrcpy(&bufCoordStr, aWx00);
        var_2 = 0;
        var_4 = 0;
        break;
    case 5:
        mystrcpy(&bufCoordStr, aCc00);
        var_2 = 3;
        var_4 = 5;
        break;
    case 6:
        mystrcpy(&bufCoordStr, aHz00);
        var_2 = 0;
        var_4 = 0;
        break;
    default: // 53e6
        bufCoordStr = 0;
        return &bufCoordStr;
    } // 540d
    // 5420
    arg_0 = (((arg_0 >> 5) * 0x14) >> 0xa) + var_2;
    while (arg_0 > 9) { // 5427
        arg_0 -= 0xa;
        bufCoordStr++;
    } // 5433
    byte_1B0D2 += (int8)arg_0;
    arg_2 = (((arg_2 >> 5) * 0x14) >> 0xa) + var_4;
    // 5450
    while (arg_2 > 9) {
        arg_2 -= 0xa;
        byte_1B0D1--;
    }
    byte_1B0D3[0] += 9 - (int8)arg_2;
    return &bufCoordStr;
}

// 5472
int sub_15472(int arg_0, int arg_2, int arg_4) {
    // 5478
    if (arg_0 > arg_4) return arg_4;
    // 5482
    if (arg_0 >= arg_2) return arg_0;
    // 548c
    if (arg_0 > -16384) return arg_2;
    // 5498
    return arg_4;
}

// 54a1
void sub_154A1(int arg_0) {
    // 54bc
    mystrcpy(todayMissStrBuf, wldOffsets[wldReadBuf4[arg_0].field_E & 0x7f]);
    // 54d3
    if (mystrlen(wldOffsets[wldReadBuf4[arg_0].field_0]) != 0) { // 54dd
        // 54f1
        if (mystrlen(wldOffsets[wldReadBuf4[arg_0].field_E & 0x7f]) != 0) { // 54fb
            // 5503
            mystrcat(todayMissStrBuf, aAt);
        } // 5509
        // 551e
        mystrcat(todayMissStrBuf, wldOffsets[wldReadBuf4[arg_0].field_0]);
    } // 5524
    // 5528
    if (mystrlen(todayMissStrBuf) > 0x1e) { // 5533
      byte_1B0FF = 0x2e;
      byte_1B100[0] = 0;
    }
    // 5540
}

#ifdef DEBUG
void my_trace(const char* fmt, ...) {
    static FILE *stream = NULL;
    va_list ap;
    if (stream == NULL) {
        stream = fopen("start.log", "w");
        if (stream == NULL) {
            printf("Unable to open debug stream");
            exit(1);
        }
        setbuf(stream, NULL);
        fprintf(stream, "Successfully opened debug log\n");
    }
    va_start(ap, fmt);
    vfprintf(stream, fmt, ap);
    fprintf(stream, "\n");
    fflush(stream);
    va_end(ap);
}
#endif // DEBUG
