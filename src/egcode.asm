.8086
DOSSEG
.MODEL SMALL

EXTRN _placeString:PROC
EXTRN _process3dg:PROC
EXTRN _findWaypointFeatures:PROC
EXTRN _rebuildOrientation:PROC
EXTRN _signedRatio16:PROC
EXTRN _drawNearestTileObject:PROC
EXTRN _addTileEntry:PROC
EXTRN _lookupTileEntry:PROC
EXTRN _projectModelVertices:PROC
EXTRN _setupViewport:PROC
EXTRN _computeAttitudeAngles:PROC
EXTRN _updateThreatAlert:PROC
EXTRN _computeThreatScore:PROC
EXTRN _computeThreatRangeBearing:PROC
EXTRN _generateRandomRadioMessage:PROC
EXTRN _appendMapEvent:PROC
EXTRN _drawWeaponAmmo:PROC
EXTRN _drawWeaponSelectMarker:PROC
EXTRN _scaleCoordToLod:PROC
EXTRN _fireAirThreat:NEAR
fireAirThreat equ _fireAirThreat
EXTRN _resetSimObjectLocks:PROC
EXTRN _zoomIn:PROC
EXTRN _zoomOut:PROC
EXTRN _disableTextBlink:PROC
EXTRN _playVoiceCue:PROC
EXTRN _exitSlowMotion:PROC
EXTRN _makeSound:PROC
EXTRN _updateEngineSound:PROC
EXTRN _waitForKeyPress:PROC
EXTRN _recalcTimeScale:PROC
EXTRN _renderFrame:PROC
EXTRN _main:PROC
EXTRN _renderHudFrame:PROC
EXTRN _signOf:PROC
EXTRN _seedRng:PROC
EXTRN _readAxisInput:PROC
EXTRN _computeMapTargetRange:PROC
EXTRN _computeSimObjectRange:PROC
EXTRN _computeTargetBearing:PROC
EXTRN _sub_21A7A:PROC
EXTRN _aspectScaleY:PROC
EXTRN _setup3DTransform:PROC
EXTRN _clampValue:PROC
EXTRN _shapeDataOffset:PROC
EXTRN _drawTargetView:PROC
EXTRN _drawWorldObject:PROC
EXTRN _scheduleTimedEvent:PROC
EXTRN _scheduleEventCheck:PROC
EXTRN _dispatchKeyScancode:PROC
EXTRN _drawTargetLabel:PROC
EXTRN _buildRangeString:PROC
EXTRN _isTargetOverWater:PROC
EXTRN _getTargetSymbol:PROC
EXTRN _computeLoftAngle:PROC
EXTRN _mapXToScreen:PROC
EXTRN _mapYToScreen:PROC
EXTRN _applyGravityFall:PROC
EXTRN _initFrameRandom:PROC
EXTRN _testWorldPosVisible:PROC
EXTRN _clearStatusPanel:PROC
EXTRN _refreshActivePanel:PROC
EXTRN _initTacMapView:PROC
EXTRN _setViewPosition:PROC
EXTRN _loadColorPalette:PROC
EXTRN _clampRange:PROC
EXTRN _rangeApprox:PROC
EXTRN _computeBearing:PROC
EXTRN _sinMul:PROC
EXTRN _cosMul:PROC
EXTRN _randomRange:PROC
EXTRN _loadRegion3D:PROC
EXTRN _valueToAngle:PROC
EXTRN _complementAngle:PROC
EXTRN _isqrt:PROC
EXTRN _drawFullscreenLine:PROC
EXTRN _drawClippedLineRegion:PROC
EXTRN _drawScreenLineOnePage:PROC
EXTRN _drawPanelText:PROC
EXTRN _fillPanelBox:PROC
EXTRN _drawColorPoint:PROC
EXTRN _setDrawColor:PROC
EXTRN _drawMapMarkerBox:PROC
EXTRN _projectMapPoint:PROC
EXTRN _drawFuelGauge:PROC
EXTRN _UpdateThrottleState:PROC
EXTRN _fillRectBoth:PROC
EXTRN _readScreenPixel:PROC
EXTRN _readMapPixelColor:PROC
EXTRN _drawMapLine:PROC
EXTRN _setTimedMessage:PROC
EXTRN _drawNumber:PROC
EXTRN _drawTacticalMap:PROC
EXTRN _setCommWorldbufPtr:PROC
EXTRN _waitFrameSync:PROC
EXTRN _fopen:PROC
EXTRN _fclose:PROC
EXTRN _fread:PROC
EXTRN _abs:PROC
EXTRN _strupr:PROC
EXTRN __chkstk:PROC
EXTRN _strcpy:PROC
EXTRN _movedata:PROC
EXTRN _segread:PROC
EXTRN _memcpy:PROC
EXTRN _getch:PROC
EXTRN _exit:PROC
EXTRN _strlen:PROC
EXTRN _int86:PROC
EXTRN _open:PROC
EXTRN _close:PROC
EXTRN _write:PROC
EXTRN _read:PROC
EXTRN _lseek:PROC
EXTRN _strcat:PROC
EXTRN _byte_228D0:BYTE
EXTRN _itoa:PROC
EXTRN _kbhit:PROC
EXTRN __bios_keybrd:PROC
EXTRN _labs:PROC
EXTRN _srand:PROC
EXTRN _rand:PROC
EXTRN __aNldiv:PROC
EXTRN __aNlmul:PROC
EXTRN __aNuldiv:PROC
EXTRN __aNlshl:PROC
EXTRN __aNlshr:PROC
EXTRN _flushall:PROC
EXTRN _stackavail:PROC
EXTRN _remove:PROC
EXTRN _createFileWrapper:PROC
EXTRN _readFile1Wrapper:PROC
EXTRN _readFile2Wrapper:PROC
EXTRN _writeFileAtRawWrapper:PROC
EXTRN _worldToTileIndex:PROC
EXTRN _computeTileBounds:PROC
EXTRN _tempStrcpy:PROC
EXTRN _selectMissile:PROC
EXTRN _bombTarget:PROC
EXTRN _markTargetReached:PROC
EXTRN _drawHudViewLine:PROC
EXTRN _switchIndicatorColor:PROC
EXTRN _drawTargetBox:PROC
EXTRN _drawMissileLock:PROC
EXTRN _projectWorldToHud:PROC
EXTRN _rotateVectorComponent:PROC
EXTRN _drawMapPoint:PROC
EXTRN _missileTargetCompat:PROC
EXTRN _plotMapObject:PROC
EXTRN _objectToScreen:PROC
EXTRN _setupLodDistances:PROC
EXTRN _tickMessageTimers:PROC
EXTRN _updateBulletsAndFire:PROC
EXTRN _updateTracerParticles:PROC
EXTRN _finalizeMission:PROC
EXTRN _doNothing3:PROC
EXTRN _doNothing4:PROC
EXTRN _setViewRotation:PROC
EXTRN _renderMapTerrain:PROC
EXTRN _drawMapTiles:PROC
EXTRN _drawMapTileObject:PROC
EXTRN _buildVertexSignMask:PROC
EXTRN _samCanAcquireTarget:NEAR
samCanAcquireTarget equ _samCanAcquireTarget
EXTRN _destroyAircraft:NEAR
destroyAircraft equ _destroyAircraft
EXTRN _spawnEnemyAircraft:NEAR
spawnEnemyAircraft equ _spawnEnemyAircraft
EXTRN _setActivePanel:near
setActivePanel equ _setActivePanel
EXTRN _destroyGroundTarget:NEAR
destroyGroundTarget equ _destroyGroundTarget
processTargetReached equ _destroyGroundTarget

EXTRN _findNearestTileObject:near
EXTRN _projectObjects:near
EXTRN _updateTargetLock:near
EXTRN _copyJoystickData:FAR
EXTRN _restoreJoystickData:FAR
EXTRN _setInt9Handler:FAR
EXTRN initJoystickCalibration:FAR
EXTRN readCalibratedJoystick:FAR
EXTRN drawPolygonOutline:FAR
EXTRN sub_1FEEC:FAR
EXTRN projectSceneObject:FAR
EXTRN sub_202C7:FAR
EXTRN sub_202F6:FAR
EXTRN _drawClipLineGlobal:FAR
EXTRN _restoreInt9Handler:FAR

EXTRN _render3DView:PROC
EXTRN _drawStringActivePage:PROC
EXTRN _drawStringBothPages:PROC

appendMapEvent equ _appendMapEvent
findWaypointFeatures equ _findWaypointFeatures
scaleCoordToLod equ _scaleCoordToLod
lookupTileEntry equ _lookupTileEntry
computeTileBounds equ _computeTileBounds
worldToTileIndex equ _worldToTileIndex
drawMapTileObject equ _drawMapTileObject
setViewPosition equ _setViewPosition
applyRotationDelta equ _applyRotationDelta
rebuildOrientation equ _rebuildOrientation
signedRatio16 equ _signedRatio16
isqrt equ _isqrt
drawFuelGauge equ _drawFuelGauge
waitForKeyPress equ _waitForKeyPress
computeThreatRangeBearing equ _computeThreatRangeBearing
updateThreatAlert equ _updateThreatAlert
computeThreatScore equ _computeThreatScore
markTargetReached equ _markTargetReached
bombTarget equ _bombTarget
refreshActivePanel equ _refreshActivePanel
initTacMapView equ _initTacMapView
mapXToScreen equ _mapXToScreen
mapYToScreen equ _mapYToScreen
plotMapObject equ _plotMapObject
objectToScreen equ _objectToScreen
readMapPixelColor equ _readMapPixelColor
EXTRN _drawMapRangeArc:near
drawMapRangeArc equ _drawMapRangeArc
drawMapLine equ _drawMapLine
drawPanelText equ _drawPanelText
readScreenPixel equ _readScreenPixel
tempStrcpy equ _tempStrcpy
setTimedMessage equ _setTimedMessage
lookupTerrainModifier equ _missileTargetCompat
drawMapMarkerBox equ _drawMapMarkerBox
projectMapPoint equ _projectMapPoint
EXTRN _blitGaugeSprite:PROC
blitGaugeSprite equ _blitGaugeSprite
EXTRN _blitSprite:PROC
blitSprite equ _blitSprite
drawTargetBox equ _drawTargetBox
drawMissileLock equ _drawMissileLock
drawTargetLabel equ _drawTargetLabel
buildRangeString equ _buildRangeString
projectWorldToHud equ _projectWorldToHud
rotateVectorComponent equ _rotateVectorComponent
computeMapTargetRange equ _computeMapTargetRange
computeSimObjectRange equ _computeSimObjectRange
computeTargetBearing equ _computeTargetBearing
computeLoftAngle equ _computeLoftAngle
getTargetSymbol equ _getTargetSymbol
isTargetOverWater equ _isTargetOverWater
shapeDataOffset equ _shapeDataOffset
forceRange equ _clampValue
randlmul equ _randomRange
selectMissile equ _selectMissile
makeSound equ _makeSound
playVoiceCue equ _playVoiceCue
updateEngineSound equ _updateEngineSound
recalcTimeScale equ _recalcTimeScale
setupLodDistances equ _setupLodDistances
exitSlowMotion equ _exitSlowMotion
disableTextBlink equ _disableTextBlink
createFileWrapper equ _createFileWrapper
readFile1Wrapper equ _readFile1Wrapper
readFile2Wrapper equ _readFile2Wrapper
writeFileAtRawWrapper equ _writeFileAtRawWrapper

; ---------------------------------------------------------------------------

SREGS		struc ;	(sizeof=0x8, align=0x2,	copyof_10) ; XREF: load15Flt3d3/r
					; load3D3/r
_es		dw ?
_cs		dw ?
_ss		dw ?
_ds		dw ?			; XREF:	load3D3+13E/r load3D3+399/r ...
SREGS		ends

; ---------------------------------------------------------------------------

ViewSnapshot		struc ;	(sizeof=0x10, mappedto_11) ; XREF: dseg:stru_3A95A/r
field_0		dd ?			; XREF:	stepFlightModel+1198/w
					; stepFlightModel+119C/w
field_4		dd ?			; XREF:	stepFlightModel+11A7/w
					; stepFlightModel+11AB/w
field_8		dw ?			; XREF:	stepFlightModel+11B2/w
field_A		dw ?			; XREF:	stepFlightModel+117F/w
					; stepFlightModel+121D/r
field_C		dw ?			; XREF:	stepFlightModel+1186/w
					; stepFlightModel+1227/r
field_E		dw ?			; XREF:	stepFlightModel+118D/w
ViewSnapshot		ends

; ---------------------------------------------------------------------------

Projectile		struc ;	(sizeof=0x18, mappedto_12) ; XREF: dseg:stru_335C4/r
field_0		dw ?
field_2		dw ?
field_4		dw ?
field_6		dw ?
field_8		dw ?
field_A		dw ?
field_C		dw ?
field_E		dw ?
field_10	db 8 dup(?)
Projectile		ends

; ---------------------------------------------------------------------------

SimObject		struc ;	(sizeof=0x24, mappedto_13) ; XREF: dseg:stru_3B208/r
field_0		dw ?
field_2		dd ?
field_6		dd ?
field_A		db 26 dup(?)		; XREF:	updateFrame+DA8/r	updateFrame+DB0/r	...
SimObject		ends

; ---------------------------------------------------------------------------

MapTarget		struc ;	(sizeof=0x10, mappedto_14) ; XREF: dseg:g_planes/r
field_0		dw ?			; XREF:	updateTracerParticles+60/r findWaypointFeatures+60/r ...
field_2		dw ?			; XREF:	updateTracerParticles+68/r findWaypointFeatures+40/r ...
field_4		dw ?
field_6		dw ?			; XREF:	updateFrame+D7F/r
					; stepFlightModel+6C/r	...
field_8		db 4 dup(?)		; XREF:	updateFrame+D77/r
field_C		dw ?			; XREF:	placeString+A/r	placeString+43/r ...
field_E		dw ?
MapTarget		ends

; ---------------------------------------------------------------------------

Waypoint	struc ;	(sizeof=0x4, mappedto_15) ; XREF: dseg:waypoints/r
field_0		dw ?
field_2		dw ?
Waypoint	ends

; ---------------------------------------------------------------------------

Missile		struc ;	(sizeof=0x1A, mappedto_16) ; XREF: dseg:missiles/r
field_0		db 10 dup(?)		; string(C)
field_A		db 12 dup(?)		; string(C)
field_16	dw ?
field_18	dw ?
Missile		ends

; ---------------------------------------------------------------------------

Sam		struc ;	(sizeof=0x12, mappedto_17) ; XREF: dseg:sams/r
field_0		db 8 dup(?)		; string(C)
field_8		dw ?
field_A		dw ?
field_C		dw ?
field_E		dw ?
field_10	dw ?
Sam		ends

; ---------------------------------------------------------------------------

MissileSpec	struc ;	(sizeof=0x4, mappedto_18) ; XREF: dseg:missleSpec/r
weaponIdx		dw ?
ammo		dw ?
MissileSpec	ends

; ---------------------------------------------------------------------------

struc_9		struc ;	(sizeof=0x8, mappedto_19) ; XREF: dseg:stru_33402/r
field_0		dw ?
field_2		dw ?
field_4		dw ?
field_6		dw ?
struc_9		ends

; ---------------------------------------------------------------------------

; enum enum_1, mappedto_2
DOS_SET_IRQH	 = 25h
PORT_PIT_TIME0	 = 40h
PORT_PIT_CNTRL	 = 43h

; ---------------------------------------------------------------------------

; enum Pointers, mappedto_3
COMM_GFXOVL_SEG	 = 1Ah
COMM_SNDOVL_SEG	 = 1Ch
COMM_MISCOVL_SEG  = 1Eh
COMM_GFXBUF_PTR	 = 20h
COMM_HERC_FLAG	 = 24h
COMM_SETUP_DONE_OFFSET	= 26h
COMM_SETUP_GFXMODE_OFFSET  = 30h
COMM_UNK7	 = 38h ; weaponType
COMM_JOYDATA_OFF  = 48h
COMM_USEJOY_OFF	 = 72h
COMM_GFXMODE_OFFSET  = 78h
COMM_WORLDBUF	 = 7Ah
OFF_IACA_START	 = 4F0h
COMM_GAMEDATA_OFFSET  =	120Eh

; ---------------------------------------------------------------------------

; enum Interrupt, mappedto_4
IRQ_CBREAK	 = 1Bh

; ---------------------------------------------------------------------------

; enum Game, mappedto_5
GAMEDATA_THEATER  = 38h
GAMEDATA_DIFFICULTY  = 3Eh
GAMEDATA_UNK4	 = 40h

; ---------------------------------------------------------------------------

; enum Misc, mappedto_6
WAYPT_PRIMARY	 = 1
WAYPT_SECONDARY	 = 2
WAYPT_BASE	 = 3
IRQ_VIDEO	 = 10h
OVL_HDR_CODESEG	 = 18h
OVL_HDR_FIRSTIDX  = 1Ch
OVL_HDR_SLOTCOUNT  = 22h
OVL_HDR_FIRSTPTR  = 24h

; ==============================================================================

; --- data symbols referenced by code (defined in egslots.asm) ---
EXTRN _allocSize:WORD
EXTRN _byte_34197:BYTE
EXTRN _byte_3790C:BYTE
EXTRN _byte_3C5A0:BYTE
EXTRN _commData:DWORD
EXTRN _frameTick:WORD
EXTRN _g_frameRateScaling:WORD
EXTRN _g_planes:BYTE
EXTRN _g_playerPlaneFlags:WORD
EXTRN _g_viewX_:WORD
EXTRN _g_viewY_:WORD
EXTRN _gameData:DWORD
EXTRN _gfxModeUnset:WORD
EXTRN _gfx_allocPage:PROC
EXTRN _gfx_copyRect:PROC
EXTRN _gfx_drawString:PROC
EXTRN _gfx_getDisplayPage:PROC
EXTRN _gfx_nop23:PROC
EXTRN _gfx_setColor:PROC
EXTRN _gfx_setFadeSteps:PROC
EXTRN _keyValue:WORD
EXTRN _sams:BYTE
EXTRN _stru_335C4:BYTE
EXTRN _stru_3B208:BYTE
EXTRN _var_200:WORD
EXTRN _var_201:WORD
EXTRN _var_315:WORD
EXTRN _var_316:BYTE
EXTRN _var_351:WORD
EXTRN _var_352:WORD
EXTRN _var_353:WORD
EXTRN _var_354:WORD
EXTRN _var_542:WORD
EXTRN _var_547:WORD
EXTRN _var_564:WORD
EXTRN _var_565:WORD
EXTRN _var_566:WORD
EXTRN _var_567:WORD
EXTRN _var_589:WORD
EXTRN _var_590:WORD
EXTRN _var_605:WORD
EXTRN _var_606:WORD
EXTRN _var_608:WORD
EXTRN _var_609:WORD
EXTRN _var_610:WORD
EXTRN _var_669:WORD
EXTRN _var_670:WORD
EXTRN _var_687:WORD
EXTRN _var_688:WORD
EXTRN _var_689:WORD
EXTRN _var_690:WORD
EXTRN _var_692:WORD
EXTRN _var_694:WORD
EXTRN _var_697:WORD
EXTRN _var_699:WORD
EXTRN _var_700:WORD
EXTRN _waypointIndex:WORD
EXTRN _word_330BC:WORD
EXTRN _word_330C2:WORD
EXTRN _word_38126:WORD
EXTRN _word_3BED2:WORD
EXTRN _word_3C046:WORD
EXTRN _word_3C09A:WORD
EXTRN aDestroyedBy:BYTE
EXTRN aDestroyedBy_0:BYTE
EXTRN aF15dgtl_bin:BYTE
EXTRN aFileClosingError:BYTE
EXTRN aFileNotFound:BYTE
EXTRN aGroundImpact:BYTE
EXTRN aHitBy:BYTE
EXTRN aHitBy_0:BYTE
EXTRN aIneffective:BYTE
EXTRN aMap:BYTE
EXTRN aMisses:BYTE
EXTRN aNoFileBuffersAvailabl:BYTE
EXTRN aOpenError:BYTE
EXTRN aReleased:BYTE
EXTRN aStoresExhauste:BYTE
EXTRN asc_3373D:BYTE
EXTRN audio_jump_6b:PROC
EXTRN audio_jump_6c:PROC
EXTRN byte_36D86:BYTE
EXTRN byte_37116:BYTE
EXTRN byte_378EE:BYTE
EXTRN byte_378FC:BYTE
EXTRN byte_37903:BYTE
EXTRN byte_383E5:WORD
EXTRN byte_3862A:BYTE
EXTRN byte_3862B:BYTE
EXTRN byte_38D61:BYTE
EXTRN byte_38D63:BYTE
EXTRN byte_3C8B0:BYTE
EXTRN dacValues:BYTE
EXTRN dacValues1:BYTE
EXTRN f15dgtlAddr:WORD
EXTRN fileReadPos:WORD
EXTRN g_missionStatus:WORD
EXTRN gfx_clearPage:PROC
EXTRN gfx_clearVga:PROC
EXTRN gfx_copyRow:PROC
EXTRN gfx_dacAnimate:PROC
EXTRN gfx_dacCycle:PROC
EXTRN gfx_fillRow:PROC
EXTRN gfx_getFreeMem:PROC
EXTRN gfx_getPageSeg:PROC
EXTRN gfx_getRowOffset:PROC
EXTRN gfx_setBlitOffset2:PROC
EXTRN gfx_setOvlVal1:PROC
EXTRN gfx_setOvlVal2:PROC
EXTRN cbreakHit:BYTE
EXTRN origCBreakOfs:WORD
EXTRN origCBreakSeg:WORD
EXTRN otherDacValues:BYTE
EXTRN ovlInsaneFlag:BYTE
EXTRN picBuf:BYTE
EXTRN picDecodedRowBuf:BYTE
EXTRN rowOffset:WORD
EXTRN strBuf:BYTE
EXTRN stru_33402:BYTE
EXTRN timerHandlerInstalled:BYTE
EXTRN tmpFileHandle:WORD
EXTRN aReadError:BYTE
EXTRN tmpPageIndex:WORD
EXTRN unk_3C030:BYTE
EXTRN word_3298C:WORD
EXTRN word_3298E:WORD
EXTRN word_3309A:WORD
EXTRN word_333D2:WORD
EXTRN word_333D4:WORD
EXTRN word_333D8:WORD
EXTRN word_333DA:WORD
EXTRN word_336F0:WORD
EXTRN word_3424C:WORD
EXTRN word_3424E:WORD
EXTRN word_37146:WORD
EXTRN word_37148:WORD
EXTRN word_37348:WORD
EXTRN word_3734A:WORD
EXTRN word_378F0:WORD
EXTRN word_378F2:WORD
EXTRN word_378F4:WORD
EXTRN word_378F6:WORD
EXTRN word_378F8:WORD
EXTRN word_378FA:WORD
EXTRN word_378FD:WORD
EXTRN word_378FF:WORD
EXTRN word_37901:WORD
EXTRN word_37904:WORD
EXTRN word_37906:WORD
EXTRN word_389D8:WORD
EXTRN word_389E0:WORD
EXTRN word_38D5C:WORD
EXTRN word_38D5E:WORD
EXTRN word_38D66:WORD
EXTRN word_38F70:WORD
EXTRN word_39606:WORD
EXTRN word_39808:WORD
EXTRN word_3B0AC:WORD
EXTRN word_3B204:WORD
EXTRN word_3B206:WORD
EXTRN word_3B4D8:WORD
EXTRN word_3B4E0:WORD
EXTRN word_3B5D6:WORD
EXTRN word_3B7DE:WORD
EXTRN word_3BEBC:WORD
EXTRN word_3BEC8:WORD
EXTRN word_3BECE:WORD
EXTRN word_3C020:WORD

PUBLIC _restoreScopePanel
PUBLIC _captureScopePanel
PUBLIC _updateThreatTargeting
PUBLIC _drawModelPoint
PUBLIC _createFile
PUBLIC _readFile1
PUBLIC _readFile2
PUBLIC _writeFileAtRaw
PUBLIC _setupOverlaySlots
PUBLIC _installCBreakHandler
PUBLIC _restoreCBreakHandler
PUBLIC _setupDac
PUBLIC _restoreTimerIrqHandler
PUBLIC _setTimerIrqHandler
PUBLIC _runGameLoop
PUBLIC _picBlit
PUBLIC _loadF15DgtlBin
PUBLIC _openFile
PUBLIC _closeFile
PUBLIC _fixedMulQ14
PUBLIC _sine
PUBLIC _redrawTacMap
PUBLIC _countermeasures
PUBLIC _drawCenteredLabelBox
PUBLIC _cosine
PUBLIC _getTimeOfDay

.CODE ;seg000 segment byte public 'CODE' use16
; ------------------------------seg000:0x294------------------------------
doNothing3 equ _doNothing3
; ------------------------------seg000:0x296------------------------------
; ------------------------------seg000:0x297------------------------------
doNothing4 equ _doNothing4
; ------------------------------seg000:0x299------------------------------
    nop
; ------------------------------seg000:0x2e2------------------------------
_loadF15DgtlBin proc near
    call far ptr gfx_getFreeMem
    mov bx, ax
    sub bx, 2
    cmp bx, 0FFFh
    jbe short loc_102F5
    mov bx, 0FFFh
loc_102F5:
    mov _allocSize, bx
    mov ah, 48h
    int 21h ;DOS - 2+ - ALLOCATE MEMORY
    mov f15dgtlAddr, ax
    sub cx, cx
    mov es, cx
    mov es:4FEh, ax
    mov ah, 3Dh
    mov al, 0
    mov dx, offset aF15dgtl_bin ;"F15DGTL.BIN"
    int 21h ;DOS - 2+ - OPEN DISK FILE WITH HANDLE
    mov bx, ax
    mov cx, _allocSize
    shl cx, 1
    shl cx, 1
    shl cx, 1
    shl cx, 1
    push ds
    mov ax, f15dgtlAddr
    mov ds, ax
    mov dx, 0
    mov ah, 3Fh
    int 21h ;DOS - 2+ - READ FROM FILE WITH HANDLE
    pop ds
    push ax
    mov ah, 3Eh
    int 21h ;DOS - 2+ - CLOSE A FILE WITH HANDLE
    pop ax
    retn
_loadF15DgtlBin endp
; ------------------------------seg000:0x333------------------------------
; ------------------------------seg000:0x334------------------------------
EXTRN _drawProjectionSphere:NEAR
; ------------------------------seg000:0x66e------------------------------
; ------------------------------seg000:0x688------------------------------
_setupOverlaySlots proc near
    arg_0 = word ptr 4
    push bp
    mov bp, sp
    push di
    push si
    push es
    push ds
    push bp
    mov dx, [bp+arg_0]
    mov ovlInsaneFlag, 0
    jmp short loc_106A0
    nop
    mov ovlInsaneFlag, 1
loc_106A0:
    mov es, dx
    mov bx, offset _gfx_allocPage
    mov di, OVL_HDR_FIRSTIDX
    mov ax, es:[di]
    mov dl, 5
    mul dl
    add bx, ax
    mov di, OVL_HDR_SLOTCOUNT
    mov cx, es:[di]
    mov si, OVL_HDR_FIRSTPTR
    mov di, OVL_HDR_CODESEG
    mov di, es:[di]
writeSlots:
    mov ax, es:[si]
    mov [bx+1], ax
    mov [bx+3], di
    add si, 2
    add bx, 5
    loop writeSlots
    cmp ovlInsaneFlag, 0
    jnz short locret_106E0
    pop bp
    pop ds
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
locret_106E0:
    retn
_setupOverlaySlots endp ;sp-analysis failed
; ------------------------------seg000:0x6e0------------------------------
    nop
    nop
; ------------------------------seg000:0x720------------------------------
EXTRN _updateFrame:NEAR
updateFrame equ _updateFrame
; ------------------------------seg000:0x14e7------------------------------
; ------------------------------seg000:0x14e8------------------------------
; ------------------------------seg000:0x14fb------------------------------
; ------------------------------seg000:0x14fc------------------------------
countermeasures proc near
    push BP
    mov BP,SP
    sub SP,6h
    push SI
    mov word ptr [BP + -6h],0ffffh
    mov SI,word ptr [BP + 4h]
    shl SI,1h
    add SI,7eah
    mov AX,word ptr [SI]
    dec word ptr [SI]
    or AX,AX
    jg LAB_1000_152a
    mov word ptr [SI],0h
    mov AX,offset aStoresExhauste
    push AX
    call tempStrcpy
    add SP,2h
    jmp LAB_1000_1631
LAB_1000_152a:
    mov word ptr [BP + -4h],1h
    jmp LAB_1000_1534
LAB_1000_1531:
    inc word ptr [BP + -4h]
LAB_1000_1534:
    cmp word ptr [BP + -4h],4h
    jge LAB_1000_1553
    mov BX,word ptr [BP + -4h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    shl BX,1h
    db 83h, 0bfh, 2ah, 0bh, 00h  ; CMP word ptr [BX + 0...,0x0                 ;= ??
    jnz LAB_1000_1551
    mov word ptr [BP + -6h],AX
LAB_1000_1551:
    jmp LAB_1000_1531
LAB_1000_1553:
    cmp word ptr [BP + -6h],-1h
    jnz LAB_1000_155c
    jmp LAB_1000_1623
LAB_1000_155c:
    mov AX,word ptr [BP + -6h]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    shl AX,1h
    mov SI,AX
    mov AX,word ptr [_g_viewX_]
    mov word ptr [SI + offset word_333D2], AX
    mov AX,word ptr [_g_viewY_]
    mov word ptr [SI + offset word_333D4], AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [SI + offset word_333D8], AX
    mov AX,word ptr [g_missionStatus]
    mov CX,AX
    shl AX,1h
    add AX,CX
    db 2Dh, 0Fh, 00h ; sub AX,0fh (force imm16 encoding)
    neg AX
    imul word ptr [_g_frameRateScaling]
    mov word ptr [SI + offset word_333DA], AX
    mov AX,word ptr [BP + 4h]
    jmp LAB_1000_15ab
LAB_1000_159b:
    mov word ptr [BP + -2h],0e77h
    jmp LAB_1000_15b7
LAB_1000_15a2:
    mov word ptr [BP + -2h],0e7dh
    jmp LAB_1000_15b7
    db 0EBh
    db 0Ch
LAB_1000_15ab:
    db 3Dh, 01h, 00h ; cmp AX,1h (force imm16 encoding)
    jz LAB_1000_159b
    db 3Dh, 02h, 00h ; cmp AX,2h (force imm16 encoding)
    jz LAB_1000_15a2
    jmp LAB_1000_15b7
LAB_1000_15b7:
    push word ptr [BP + -2h]
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,offset aReleased
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    push word ptr [BP + -2h]
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,offset asc_3373D
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,0ah
    push AX
    mov AX,offset unk_3C030
    push AX
    mov BX,word ptr [BP + 4h]
    shl BX,1h
    push word ptr [BX + offset word_3309A]
    call _itoa
    add SP,6h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call setTimedMessage
    add SP,2h
LAB_1000_1623:
    mov AX,2h
    push AX
    mov AX,16h
    push AX
    call makeSound
    add SP,4h
LAB_1000_1631:
    pop SI
    mov SP,BP
    pop BP
    ret
countermeasures endp
_countermeasures equ countermeasures
; ------------------------------seg000:0x1635------------------------------
; ------------------------------seg000:0x19a3------------------------------
EXTRN _initWeaponLoadout:NEAR
; ------------------------------seg000:0x1a17------------------------------
; ------------------------------seg000:0x1bc3------------------------------
scheduleEventCheck equ _scheduleEventCheck
; ------------------------------seg000:0x1bfc------------------------------
; ------------------------------seg000:0x1bfd------------------------------
scheduleTimedEvent equ _scheduleTimedEvent
; ------------------------------seg000:0x1c20------------------------------
; ------------------------------seg000:0x21c4------------------------------
    nop
; ------------------------------seg000:0x21c6------------------------------
callLoad3DAll equ _loadRegion3D
; ------------------------------seg000:0x21c9------------------------------
; _render3DView - now in C (egame2.c)
; _loadColorPalette - now in C (egame2.c)
; ------------------------------seg000:0x22b7------------------------------
; ------------------------------seg000:0x22b8------------------------------
projectObjects equ _projectObjects
; ------------------------------seg000:0x26b3------------------------------
; ------------------------------seg000:0x273e------------------------------
process3dg equ _process3dg
; ------------------------------seg000:0x2872------------------------------
; ------------------------------seg000:0x2fda------------------------------
findNearestTileObject equ _findNearestTileObject
; ------------------------------seg000:0x3223------------------------------
; ------------------------------seg000:0x3224------------------------------
addTileEntry equ _addTileEntry
; ------------------------------seg000:0x3264------------------------------
; ------------------------------seg000:0x32ba------------------------------
drawNearestTileObject equ _drawNearestTileObject
; ------------------------------seg000:0x345d------------------------------
; ------------------------------seg000:0x345e------------------------------
renderMapTerrain equ _renderMapTerrain
    nop
; ------------------------------seg000:0x34aa------------------------------
; ------------------------------seg000:0x34ac------------------------------
drawMapTiles equ _drawMapTiles


; ------------------------------seg000:0x374a------------------------------
drawModelPoint proc near
    push BP
    mov BP,SP
    mov AX,word ptr [BP + 4h]
    add AX,word ptr [word_3298C]
    mov word ptr [_var_351],AX
    mov word ptr [_var_352],AX
    mov AX,word ptr [BP + 6h]
    neg AX
    add AX,word ptr [word_3298E]
    mov word ptr [_var_353],AX
    mov word ptr [_var_354],AX
    inc word ptr [_var_200]
    mov BX,word ptr [_var_200]
    inc word ptr [_var_200]
    mov ES,word ptr [_var_201]
    mov AL,byte ptr ES:[BX]
    sub AH,AH
    push AX
    call far ptr _gfx_setColor
    add SP,2h
    call far ptr _drawClipLineGlobal
    pop BP
    ret
drawModelPoint endp
_drawModelPoint equ drawModelPoint
; ------------------------------seg000:0x3815------------------------------
; ------------------------------seg000:0x3816------------------------------
projectModelVertices equ _projectModelVertices
; ------------------------------seg000:0x3920------------------------------
; ------------------------------seg000:0x3932------------------------------
setup3DTransform equ _setup3DTransform
; ------------------------------seg000:0x39a8------------------------------
; ------------------------------seg000:0x39aa------------------------------
; rasterize3DWorld reconstructed in C (eg3dmap.c)
; ------------------------------seg000:0x39be------------------------------
; ------------------------------seg000:0x39c0------------------------------
setupViewport equ _setupViewport
; ------------------------------seg000:0x3a6b------------------------------
; ------------------------------seg000:0x3a6c------------------------------
setViewRotation equ _setViewRotation
; ------------------------------seg000:0x3a8e------------------------------
; ------------------------------seg000:0x3a90------------------------------
; raw bytes for unlabeled code between 0x3aa1 and 0x3aee
    db 80h
    db 3Eh
    db 04h
    db 1Ah
    db 00h
    db 74h
    db 29h
    db 8Bh
    db 1Eh
    db 8Ch
    db 19h
    db 83h
    db 06h
    db 8Ch
    db 19h
    db 04h
    db 8Eh
    db 06h
    db 8Eh
    db 19h
    db 26h
    db 8Bh
    db 07h
    db 26h
    db 8Bh
    db 57h
    db 02h
    db 23h
    db 06h
    db 06h
    db 1Ah
    db 23h
    db 16h
    db 08h
    db 1Ah
    db 0Bh
    db 0D0h
    db 74h
    db 05h
    db 0B8h
    db 01h
    db 00h
    db 0C3h
    db 90h
    db 2Bh
    db 0C0h
    db 0C3h
    db 90h
    db 8Bh
    db 1Eh
    db 8Ch
    db 19h
    db 83h
    db 06h
    db 8Ch
    db 19h
    db 02h
    db 8Eh
    db 06h
    db 8Eh
    db 19h
    db 26h
    db 8Bh
    db 07h
    db 23h
    db 06h
    db 06h
    db 1Ah
    db 0C3h
    db 90h

; ------------------------------seg000:0x3aa6------------------------------
    nop
    nop
    nop
; ------------------------------seg000:0x3aee------------------------------
_setupDac proc near
    mov ax, ds
    mov es, ax
    mov bx, 10h
    mov cx, 50h
    mov dx, offset dacValues1
    mov ax, 1012h
    int 10h ;- VIDEO - SET BLOCK OF DAC REGISTERS (EGA, VGA/MCGA)
    cmp _byte_34197, 2
    jz short loc_13B16
    mov cx, 30h
    push si
    push di
    mov si, offset byte_37116
    mov di, offset byte_36D86
    rep movsb
    pop di
    pop si
loc_13B16:
    mov dx, offset dacValues
    cmp _word_330BC, 0
    jz short loc_13B23
    mov dx, offset otherDacValues
loc_13B23:
    mov bx, 60h
    mov cx, 0A0h
    mov ax, 1012h
    int 10h ;- VIDEO - SET BLOCK OF DAC REGISTERS (EGA, VGA/MCGA)
    retn
_setupDac endp
; ------------------------------seg000:0x3b2e------------------------------
; ------------------------------seg000:0x3b2f------------------------------
fixedMulQ14 proc near
_fixedMulQ14:
    mov BX,SP
    mov AX,word ptr SS:[BX + 2h]
    imul word ptr SS:[BX + 4h]
    shl AX,1h
    rcl DX,1h
    shl AX,1h
    adc DX,0h
    mov AX,DX
    ret
    db 8Bh
    db 0DCh
    db 36h
    db 8Bh
    db 47h
    db 02h
    db 36h
    db 0F7h
    db 6Fh
    db 04h
    db 0D1h
    db 0E0h
    db 0D1h
    db 0D2h
    db 0C3h
    db 8Bh
    db 0DCh
    db 36h
    db 8Bh
    db 47h
    db 02h
    db 99h
    db 8Ah
    db 0D4h
    db 8Ah
    db 0E0h
    db 2Ah
    db 0C0h
    db 36h
    db 8Bh
    db 5Fh
    db 04h
    db 0Bh
    db 0DBh
    db 7Eh
    db 13h
    db 8Bh
    db 0CAh
    db 0Bh
    db 0C9h
    db 79h
    db 02h
    db 0F7h
    db 0D9h
    db 0D1h
    db 0EBh
    db 3Bh
    db 0CBh
    db 73h
    db 05h
    db 0D1h
    db 0D3h
    db 0F7h
    db 0FBh
    db 0C3h
    db 0B8h
    db 0FFh
    db 7Fh
    db 0Bh
    db 0D2h
    db 79h
    db 02h
    db 0F7h
    db 0D8h
    db 0C3h
fixedMulQ14 endp
; ------------------------------seg000:0x3b44------------------------------
; ------------------------------seg000:0x3b86------------------------------
cosine proc near
    mov BX,SP
    mov BX,word ptr SS:[BX + 2h]
    add BX,4000h
    call sineLookup
    mov AX,BX
    ret
cosine endp
_cosine equ cosine
; ------------------------------seg000:0x3b95------------------------------
; ------------------------------seg000:0x3b96------------------------------
sine proc near
_sine:
    mov BX,SP
    mov BX,word ptr SS:[BX + 2h]
    call sineLookup
    mov AX,BX
    ret
sine endp
; ------------------------------seg000:0x3ba1------------------------------
; ------------------------------seg000:0x3ba2------------------------------
sineLookup proc near
    mov DL,BL
    sub DH,DH
    mov BL,BH
    mov BH,DH
    shl BX,1h
    mov AX,word ptr [BX + offset word_37148]
    mov BX,word ptr [BX + offset word_37146]
    sub AX,BX
    imul DX
    mov DH,DL
    mov DL,AH
    shl AL,1h
    adc BX,DX
    ret
sineLookup endp
; ------------------------------seg000:0x3bc0------------------------------
; ------------------------------seg000:0x3bc1------------------------------
PUBLIC lookupSineFar
PUBLIC lookupCosineFar
lookupSineFar proc far
    call lookupSine
    retf
lookupSineFar endp
; ------------------------------seg000:0x3bc4------------------------------
; ------------------------------seg000:0x3bc5------------------------------
lookupCosineFar proc far
    call lookupCosine
    retf
lookupCosineFar endp
; ------------------------------seg000:0x3bc8------------------------------
; ------------------------------seg000:0x3bc9------------------------------
lookupCosine proc near
    add BX,4000h
lookupCosine endp
; ------------------------------seg000:0x3bc9------------------------------
; ------------------------------seg000:0x3bcd------------------------------
lookupSine proc near
    mov DL,BL
    sub DH,DH
    mov BL,BH
    mov BH,DH
    shl BX,1h
    mov AX,word ptr [BX + offset word_3734A]
    mov BX,word ptr [BX + offset word_37348]
    sub AX,BX
    imul DX
    mov DH,DL
    mov DL,AH
    shl AL,1h
    adc BX,DX
    ret
lookupSine endp
; ------------------------------seg000:0x3beb------------------------------
; ------------------------------seg000:0x3bec------------------------------
; --- Ctrl+Break: egame bindings for shared/cbreak.inc ---
cbreakSavedOfs EQU <origCBreakOfs>
cbreakSavedSeg EQU <origCBreakSeg>
cbreakFlag EQU <cbreakHit>
INCLUDE shared/cbreak.inc
IFDEF DEBUG
    PUBLIC _getRowOffsetHelper
_getRowOffsetHelper proc near
    push bp
    mov bp, sp
    mov di, [bp+4]
    call far ptr gfx_getRowOffset
    pop bp
    retn
_getRowOffsetHelper endp
ENDIF
; ------------------------------seg000:0x3c3a------------------------------
; ------------------------------seg000:0x3c3b------------------------------
_runGameLoop proc near
    push bp
    push si
    push di
    push es
    call gameMainLoop
    pop es
    pop di
    pop si
    pop bp
    retn
_runGameLoop endp
; ------------------------------seg000:0x3c46------------------------------
; ------------------------------seg000:0x3c47------------------------------
gameMainLoop proc near
    call _renderFrame
    call _renderHudFrame
    cmp _keyValue, 0
    jnz short loc_13C59
    call far ptr _sub_21A7A ;call _sub_21A7A
loc_13C59:
    mov bx, 0
    mov ax, _word_38126
    call far ptr gfx_dacAnimate
    mov byte_378EE, 1
    call _stepFlightModel
    call updateFrame
    cmp byte_3C8B0, 0
    jz short gameMainLoop
    retn
gameMainLoop endp
; ------------------------------seg000:0x3c76------------------------------
; ------------------------------seg000:0x3c78------------------------------
TIMER_VAR_74 EQU <word ptr [word_378FA]>
TIMER_VAR_80 EQU <word ptr [word_37904]>
TIMER_VAR_70 EQU <word ptr [word_378F0]>
TIMER_VAR_71 EQU <word ptr [word_378F2]>
TIMER_CALIBRATE EQU <calibrateTimerSpeed>
TIMER_ISR_PTR EQU <timerIsrPtr>
TIMER_IRQ_ADDR EQU <timerIrqAddr>
TIMER_INSTALLED EQU <byte ptr [timerHandlerInstalled]>
INCLUDE shared/timer_setHandler.inc
INCLUDE shared/timer_restore.inc
; ------------------------------seg000:0x3cd7------------------------------
setTimerRateFromCalibration proc near
    mov bx, word_378FD
    mov word_378FA, bx
    mov ax, word_378FF
    xor dx, dx
    div bx
    mov word_378F4, ax
    mov byte_378FC, 1
    retn
setTimerRateFromCalibration endp

setTimerRateSingle proc near
    mov word_378FA, 1
    mov ax, word_378FF
    mov word_378F4, ax
    mov byte_378FC, 1
    retn
setTimerRateSingle endp
; ------------------------------seg000:0x3cd6------------------------------
timerIrqAddr dd timerIsr

timerIsr proc far
    sti
    push AX
    push BX
    push CX
    push DX
    push SI
    push DI
    push BP
    push DS
    push ES
    mov AX, @data
    mov DS, AX
    mov AX, word_378F6
    add word_378F0, AX
    adc word_378F2, 0
    dec word_37904
    jnz short @@tisr_skip
    mov AX, word_378FA
    mov word_37904, AX
    call timerIrqCallback
    mov byte_378EE, 0
    call advanceFrameTick
@@tisr_skip:
    cmp word_378FA, 1
    jz short @@tisr_nochain
    call far ptr audio_jump_6c
@@tisr_nochain:
    cmp word_378F2, 0
    jnz short @@tisr_chain
    mov AL, 20h
    out 20h, AL
    pop ES
    pop DS
    pop BP
    pop DI
    pop SI
    pop DX
    pop CX
    pop BX
    pop AX
    iret
@@tisr_chain:
    dec word_378F2
    pop ES
    pop DS
    pop BP
    pop DI
    pop SI
    pop DX
    pop CX
    pop BX
    pop AX
    cli
    jmp dword ptr timerIsrPtr
timerIsr endp

timerIsrPtr dd 0
; ------------------------------seg000:0x3d6b------------------------------
; --- timer callback/calibrate: egame TIMER_VAR bindings ---
TIMER_VAR_CALSUM_HI EQU <word ptr [word_37901]>
TIMER_VAR_CALSUM_LO EQU <word ptr [word_378FF]>
TIMER_VAR_COUNT_HI EQU <word ptr [word_378F2]>
TIMER_VAR_COUNT_LO EQU <word ptr [word_378F0]>
TIMER_VAR_DIVIDER EQU <byte ptr [byte_378FC]>
TIMER_VAR_DIVISOR EQU <word ptr [word_378F6]>
TIMER_VAR_MODE EQU <word ptr [word_378FD]>
TIMER_VAR_SYNC EQU <byte ptr [byte_37903]>
TIMER_VAR_TARGET EQU <word ptr [word_378F4]>
TIMER_VAR_RETRACE EQU <word ptr [word_37906]>
TIMER_VAR_TICK EQU <word ptr [word_37904]>
TIMER_VAR_TICKCNT EQU <word ptr [word_378F8]>
INCLUDE shared/timer_callback.inc
; ------------------------------seg000:0x3df1------------------------------
; ------------------------------seg000:0x3df2------------------------------
INCLUDE shared/timer_calibrate.inc
; ------------------------------seg000:0x3e86------------------------------
; ------------------------------seg000:0x3e87------------------------------
INCLUDE shared/timer_manipulate.inc
; ------------------------------seg000:0x3edb------------------------------
; ------------------------------seg000:0x3edc------------------------------
getTimeOfDay proc near
_getTimeOfDay equ getTimeOfDay
    xor AH,AH
    int 1Ah
    mov AX,DX
    ret
getTimeOfDay endp

; (deadFunction01 pruned: an unreferenced, never-traced byte-copy of the timer
;  routine. advanceFrameTick below is the live version. Verified dead by verify-egame.)
; ------------------------------seg000:0x3ee2------------------------------
; ------------------------------seg000:0x3ee3------------------------------
advanceFrameTick proc near
    inc word ptr [_byte_3790C-2]  ; word_3790A
    inc byte ptr [_byte_3790C]    ; frame tick counter
    call far ptr gfx_dacCycle    ; MGRAPHIC slot 0x2e: VGA DAC fire animation
    call far ptr audio_jump_6b
    or ax, ax
    jz short advanceFrameTick_ret
    js short advanceFrameTick_single
    jmp setTimerRateFromCalibration
advanceFrameTick_single:
    jmp setTimerRateSingle
advanceFrameTick_ret:
    retn
advanceFrameTick endp
; ------------------------------seg000:0x3f01------------------------------
    nop
; ------------------------------seg000:0x3f72------------------------------
EXTRN _stepFlightModel:NEAR
; ------------------------------seg000:0x51f9------------------------------
EXTRN _applyRotationDelta:NEAR
; ------------------------------seg000:0x5236------------------------------
; ------------------------------seg000:0x5237------------------------------
computeAttitudeAngles equ _computeAttitudeAngles
; ------------------------------seg000:0x5fdb------------------------------
UpdateThrottleState equ _UpdateThrottleState
; ------------------------------seg000:0x606b------------------------------
; ------------------------------seg000:0x606c------------------------------
drawFuelGauge equ _drawFuelGauge
; ------------------------------seg000:0x60d2------------------------------
; ------------------------------seg000:0x60d3------------------------------
EXTRN _drawVectorShape:NEAR
drawVectorShape equ _drawVectorShape
; ------------------------------seg000:0x613a------------------------------
; ------------------------------seg000:0x613b------------------------------
waitForKeyPress equ _waitForKeyPress
; ------------------------------seg000:0x6171------------------------------
; ------------------------------seg000:0x6346------------------------------
EXTRN _fireGroundThreat:NEAR
fireGroundThreat equ _fireGroundThreat
; ------------------------------seg000:0x67b4------------------------------
EXTRN _updateObjects:NEAR
updateObjects equ _updateObjects
; ------------------------------seg000:0x7593------------------------------
; ------------------------------seg000:0x783a------------------------------
updateThreatTargeting proc near
    push BP
    mov BP,SP
    sub SP,36h
    push DI
    push SI
    mov AX,8h
    push AX
    sub AX,AX
    push AX
    call switchIndicatorColor
    add SP,4h
    mov AX,8h
    push AX
    mov AX,1h
    push AX
    call switchIndicatorColor
    add SP,4h
    cmp word ptr [word_333DA],0h
    jz LAB_1000_7a24
    mov AX,word ptr [word_333D2]
    mov word ptr [BP + -2ah],AX
    mov AX,word ptr [word_333D4]
    jmp LAB_1000_7a2d
    db 90h
LAB_1000_7a24:
    mov AX,word ptr [_g_viewX_]
    mov word ptr [BP + -2ah],AX
    mov AX,word ptr [_g_viewY_]
LAB_1000_7a2d:
    mov word ptr [BP + -30h],AX
    mov word ptr [BP + -1ch],0h
    jmp LAB_1000_83f7
LAB_1000_7a38:
    mov word ptr [BP + -10h],7fffh
    cmp word ptr [BP + -22h],7h
    jz LAB_1000_7a46
    jmp LAB_1000_7ade
LAB_1000_7a46:
    mov word ptr [BP + -20h],0h
    jmp LAB_1000_7ad3
LAB_1000_7a4e:
    mov AX,24h
    imul word ptr [BP + -20h]
    mov SI,AX
    test byte ptr [SI + offset _stru_3B208 + 18],2h
    jz LAB_1000_7ad0
    cmp word ptr [SI + offset _stru_3B208 + 20],0h
    jz LAB_1000_7ad0
    push word ptr [BP + -22h]
    push word ptr [SI + offset _stru_3B208]
    push word ptr [SI + offset word_3B206]
    push word ptr [SI + offset word_3B204]
    push word ptr [BP + -1ch]
    call samCanAcquireTarget
    add SP,0ah
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [_var_669]
    cmp word ptr [BP + -10h],AX
    jbe LAB_1000_7ad0
    cmp word ptr [BP + -2h],0h
    jz LAB_1000_7ad0
    mov AX,word ptr [_var_670]
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [_var_669]
    mov word ptr [BP + -10h],AX
    mov AX,word ptr [BP + -20h]
    mov word ptr [BP + -14h],AX
    mov AX,24h
    imul word ptr [BP + -20h]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_3B208]
    mov word ptr [BP + -32h],AX
    mov word ptr [BP + -4h],1h
    cmp word ptr [BP + -10h],180h
    jnc LAB_1000_7ad0
    or byte ptr [SI + offset _stru_3B208 + 18],10h
    mov AX,1h
    push AX
    mov AX,word ptr [BP + -20h]
    db 05h, 20h, 00h ; add AX,20h (force imm16 encoding)
    push AX
    call scheduleEventCheck
    add SP,4h
LAB_1000_7ad0:
    inc word ptr [BP + -20h]
LAB_1000_7ad3:
    mov AX,word ptr [_word_3C046]
    cmp word ptr [BP + -20h],AX
    jge LAB_1000_7ade
    jmp LAB_1000_7a4e
LAB_1000_7ade:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,12h
    imul word ptr [BP + -12h]
    mov BX,AX
    mov AX,word ptr [BX + offset _sams + 10]
    mov CL,6h
    sar AX,CL
    cmp AX,word ptr [SI + offset _stru_335C4 + 6]
    jle LAB_1000_7b0e
    test byte ptr [_frameTick],1h
    jz LAB_1000_7b0e
    inc word ptr [SI + offset _stru_335C4 + 6]
    mov AX,word ptr [SI + offset _stru_335C4 + 8]
    mov word ptr [BP + -6h],AX
LAB_1000_7b0e:
    cmp word ptr [BP + -22h],4h
    jz LAB_1000_7b29
    cmp word ptr [BP + -22h],6h
    jz LAB_1000_7b29
    cmp word ptr [BP + -22h],5h
    jz LAB_1000_7b29
    cmp word ptr [BP + -22h],1ch
    jz LAB_1000_7b29
    jmp LAB_1000_7c47
LAB_1000_7b29:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    cmp word ptr [BX + offset _stru_335C4 + 20],-1h
    jz LAB_1000_7b3b
    jmp LAB_1000_7be0
LAB_1000_7b3b:
    mov word ptr [BP + -20h],0h
    jmp LAB_1000_7b45
LAB_1000_7b42:
    inc word ptr [BP + -20h]
LAB_1000_7b45:
    mov AX,word ptr [_word_3BED2]
    cmp word ptr [BP + -20h],AX
    jl LAB_1000_7b50
    jmp LAB_1000_7c47
LAB_1000_7b50:
    cmp word ptr [BP + -22h],4h
    jnz LAB_1000_7b64
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    cmp word ptr [BX + offset _g_planes + 4],0h
    jz LAB_1000_7b42
LAB_1000_7b64:
    cmp word ptr [BP + -22h],5h
    jz LAB_1000_7b70
    cmp word ptr [BP + -22h],6h
    jnz LAB_1000_7b7e
LAB_1000_7b70:
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    test byte ptr [BX + offset _g_planes + 6],8h
    jnz LAB_1000_7b92
LAB_1000_7b7e:
    cmp word ptr [BP + -22h],5h
    jz LAB_1000_7b42
    mov BX,word ptr [BP + -20h]
    mov CL,4h
    shl BX,CL
    test byte ptr [BX + offset _g_planes + 6],8h
    jnz LAB_1000_7b42
LAB_1000_7b92:
    mov SI,word ptr [BP + -20h]
    mov CL,4h
    shl SI,CL
    push word ptr [BP + -22h]
    sub AX,AX
    push AX
    push word ptr [SI + offset _g_planes + 2]
    push word ptr [SI + offset _g_planes]
    push word ptr [BP + -1ch]
    call samCanAcquireTarget
    add SP,0ah
    mov word ptr [BP + -2h],AX
    mov AX,word ptr [_var_669]
    cmp word ptr [BP + -10h],AX
    jbe LAB_1000_7b42
    cmp word ptr [BP + -2h],0h
    jz LAB_1000_7b42
    mov AX,word ptr [_var_670]
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [_var_669]
    mov word ptr [BP + -10h],AX
    mov AX,word ptr [BP + -20h]
    mov word ptr [BP + -14h],AX
    mov word ptr [BP + -32h],0h
    mov word ptr [BP + -4h],1h
    jmp LAB_1000_7b42
LAB_1000_7be0:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_335C4 + 20]
    mov word ptr [BP + -20h],AX
    mov SI,AX
    mov CL,4h
    shl SI,CL
    push word ptr [BP + -22h]
    sub AX,AX
    push AX
    push word ptr [SI + offset _g_planes + 2]
    push word ptr [SI + offset _g_planes]
    push word ptr [BP + -1ch]
    call samCanAcquireTarget
    add SP,0ah
    mov word ptr [BP + -2h],AX
    or AX,AX
    jz LAB_1000_7c47
    mov AX,word ptr [_var_670]
    mov word ptr [BP + -6h],AX
    mov AX,word ptr [_var_669]
    mov word ptr [BP + -10h],AX
    mov AX,word ptr [BP + -20h]
    mov word ptr [BP + -14h],AX
    mov word ptr [BP + -32h],0h
    mov word ptr [BP + -4h],1h
    cmp word ptr [BP + -10h],0c0h
    jnc LAB_1000_7c47
    mov AX,1h
    push AX
    mov AX,word ptr [BP + -20h]
    db 05h, 40h, 00h ; add AX,40h (force imm16 encoding)
    push AX
    call scheduleEventCheck
    add SP,4h
LAB_1000_7c47:
    cmp word ptr [BP + -4h],0h
    jnz LAB_1000_7c50
    jmp LAB_1000_7ce7
LAB_1000_7c50:
    cmp word ptr [BP + -1ch],8h
    jl LAB_1000_7c59
    jmp LAB_1000_7ce7
LAB_1000_7c59:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [_var_670]
    sub AX,word ptr [BX + offset _stru_335C4 + 8]
    push AX
    call _abs
    add SP,2h
    cmp AX,1000h
    jge LAB_1000_7ce7
    cmp word ptr [word_333DA],0h
    jnz LAB_1000_7ce7
    cmp word ptr [BP + -22h],0h
    jg LAB_1000_7c96
    test byte ptr [_frameTick],2h
    jz LAB_1000_7c96
    mov AX,0ch
    push AX
    mov AX,1h
    push AX
    call switchIndicatorColor
    add SP,4h
LAB_1000_7c96:
    cmp word ptr [BP + -22h],0h
    jz LAB_1000_7cb0
    test byte ptr [_frameTick],2h
    jnz LAB_1000_7cb0
    mov AX,0eh
    push AX
    sub AX,AX
    push AX
    call switchIndicatorColor
    add SP,4h
LAB_1000_7cb0:
    test byte ptr [_frameTick],3h
    jnz LAB_1000_7ce7
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_335C4 + 6]
    mov CL,5h
    shl AX,CL
    cmp AX,word ptr [BP + -10h]
    jbe LAB_1000_7ce7
    mov AX,1h
    push AX
    mov AX,0ah
    push AX
    call makeSound
    add SP,4h
    mov AX,2h
    push AX
    push word ptr [BP + -1ch]
    call scheduleEventCheck
    add SP,4h
LAB_1000_7ce7:
    cmp word ptr [BP + -6h],0h
    jnz LAB_1000_7cf0
    jmp LAB_1000_7e48
LAB_1000_7cf0:
    cmp word ptr [BP + -4h],0h
    jnz LAB_1000_7cf9
    jmp LAB_1000_7e48
LAB_1000_7cf9:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BP + -6h]
    sub AX,word ptr [BX + offset _stru_335C4 + 8]
    mov word ptr [BP + -1ah],AX
    cmp word ptr [BP + -1ch],8h
    jge LAB_1000_7d32
    mov AH,byte ptr [g_missionStatus]
    sub AL,AL
    add AH,1h
    push AX
    mov AX,word ptr [g_missionStatus]
    inc AX
    neg AX
    mov CH,AL
    sub CL,CL
    push CX
    push word ptr [BP + -1ah]
    call _clampRange
    add SP,6h
    mov word ptr [BP + -1ah],AX
LAB_1000_7d32:
    mov AX,12h
    imul word ptr [BP + -12h]
    mov BX,AX
    mov SI,word ptr [BX + offset _sams + 14]
    mov CL,7h
    shl SI,CL
    push SI
    mov AX,SI
    neg AX
    push AX
    push word ptr [BP + -1ah]
    call _clampRange
    add SP,6h
    mov word ptr [BP + -1ah],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,word ptr [BP + -1ah]
    shl AX,1h
    shl AX,1h
    cwd
    mov CX,word ptr [_g_frameRateScaling]
    idiv CX
    add word ptr [SI + offset _stru_335C4 + 8],AX
    mov AX,word ptr [BP + -1ah]
    shl AX,1h
    mov word ptr [SI + offset _stru_335C4 + 12],AX
    cmp word ptr [BP + -1ch],8h
    jge LAB_1000_7da4
    cmp word ptr [BP + -10h],400h
    jnc LAB_1000_7da4
    push word ptr [BP + -10h]
    call _abs
    add SP,2h
    push AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BP + -32h]
    sub AX,word ptr [BX + offset _stru_335C4 + 4]
    mov CL,4h
    sar AX,CL
    jmp LAB_1000_7de7
    db 90h
LAB_1000_7da4:
    push word ptr [BP + -10h]
    call _abs
    add SP,2h
    push AX
    push word ptr [BP + -10h]
    call _abs
    add SP,2h
    cmp AX,140h
    jle LAB_1000_7dcc
    push word ptr [BP + -10h]
    call _abs
    add SP,2h
    mov CL,3h
    sar AX,CL
    jmp LAB_1000_7dce
    db 90h
LAB_1000_7dcc:
    sub AX,AX
LAB_1000_7dce:
    mov CX,AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BP + -32h]
    sub AX,word ptr [BX + offset _stru_335C4 + 4]
    mov DX,CX
    mov CL,5h
    sar AX,CL
    add AX,DX
LAB_1000_7de7:
    push AX
    call _computeBearing
    add SP,4h
    mov word ptr [BP + -6h],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BP + -6h]
    sub AX,word ptr [BX + offset _stru_335C4 + 10]
    mov word ptr [BP + -24h],AX
    mov AX,12h
    imul word ptr [BP + -12h]
    mov BX,AX
    mov SI,word ptr [BX + offset _sams + 14]
    mov AX,SI
    mov CL,9h
    shl AX,CL
    push AX
    mov AX,SI
    mov CL,0bh
    shl AX,CL
    neg AX
    push AX
    push word ptr [BP + -24h]
    call _clampRange
    add SP,6h
    mov word ptr [BP + -24h],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BP + -24h]
    shl AX,1h
    shl AX,1h
    cwd
    mov CX,word ptr [_g_frameRateScaling]
    idiv CX
    add word ptr [BX + offset _stru_335C4 + 10],AX
    jmp LAB_1000_7e74
    db 90h
LAB_1000_7e48:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    add SI,0d1eh
    cmp word ptr [SI],0h
    jle LAB_1000_7e74
    cmp word ptr [BP + -22h],1eh
    jz LAB_1000_7e74
    push word ptr [SI]
    call _signOf
    add SP,2h
    mov CL,0ch
    shl AX,CL
    cwd
    mov CX,word ptr [_g_frameRateScaling]
    idiv CX
    sub word ptr [SI],AX
LAB_1000_7e74:
    cmp word ptr [BP + -22h],1ch
    jnz LAB_1000_7e90
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    add SI,0d1eh
    cmp word ptr [SI],0f800h
    jle LAB_1000_7e90
    mov word ptr [SI],0f800h
LAB_1000_7e90:
    cmp word ptr [BP + -22h],1eh
    jz LAB_1000_7ea5
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    cmp word ptr [BX + offset _stru_335C4 + 4],1h
    jnz LAB_1000_7ec9
LAB_1000_7ea5:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,800h
    cwd
    mov CX,word ptr [_g_frameRateScaling]
    idiv CX
    sub word ptr [SI + offset _stru_335C4 + 10],AX
    mov AX,word ptr [SI + offset _stru_335C4 + 22]
    cmp word ptr [SI + offset _stru_335C4 + 10],AX
    jge LAB_1000_7ec9
    mov word ptr [SI + offset _stru_335C4 + 10],AX
LAB_1000_7ec9:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    push word ptr [SI + offset _stru_335C4 + 6]
    push word ptr [SI + offset _stru_335C4 + 10]
    call _cosMul
    add SP,4h
    mov CL,3h
    shl AX,CL
    cwd
    mov CX,word ptr [_g_frameRateScaling]
    idiv CX
    mov word ptr [BP + -16h],AX
    cmp word ptr [BP + -22h],1eh
    jnz LAB_1000_7f0e
    mov CX,2h
    cwd
    idiv CX
    mov word ptr [BP + -16h],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_335C4 + 6]
    mov CL,7h
    shl AX,CL
    jmp LAB_1000_7f1c
LAB_1000_7f0e:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AH,byte ptr [SI + offset _stru_335C4 + 6]
    sub AL,AL
LAB_1000_7f1c:
    cwd
    mov CX,word ptr [_g_frameRateScaling]
    idiv CX
    push AX
    push word ptr [SI + offset _stru_335C4 + 10]
    call _sinMul
    add SP,4h
    add word ptr [SI + offset _stru_335C4 + 4],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    push word ptr [BP + -16h]
    push word ptr [SI + offset _stru_335C4 + 8]
    call _sinMul
    add SP,4h
    add word ptr [SI + offset _stru_335C4],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    push word ptr [BP + -16h]
    push word ptr [SI + offset _stru_335C4 + 8]
    call _cosMul
    add SP,4h
    sub word ptr [SI + offset _stru_335C4 + 2],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    dec word ptr [BX + offset _stru_335C4 + 14]
    cmp word ptr [BP + -1ch],8h
    jge LAB_1000_7f99
    cmp word ptr [BP + -4h],0h
    jnz LAB_1000_7f8c
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    and byte ptr [BX + offset _stru_335C4 + 4],0feh
    jmp LAB_1000_7f99
    db 90h
LAB_1000_7f8c:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    or byte ptr [BX + offset _stru_335C4 + 4],1h
LAB_1000_7f99:
    mov byte ptr [_var_315],0h
    mov AL,byte ptr [BP + -1ch]
    and AL,3h
    mov CL,byte ptr [_frameTick]
    and CL,3h
    cmp AL,CL
    jnz LAB_1000_7fc8
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    push word ptr [SI + offset _stru_335C4 + 4]
    push word ptr [SI + offset _stru_335C4 + 2]
    push word ptr [SI + offset _stru_335C4]
    call testWorldPosVisible
    add SP,6h
LAB_1000_7fc8:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    cmp word ptr [BX + offset _stru_335C4 + 4],0h
    jl LAB_1000_7fe1
    cmp byte ptr [_var_315],0h
    jnz LAB_1000_7fe1
    jmp LAB_1000_81a3
LAB_1000_7fe1:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_335C4]
    mov word ptr [word_3BEBC],AX
    mov AX,word ptr [SI + offset _stru_335C4 + 2]
    mov word ptr [word_3BEC8],AX
    mov AX,word ptr [SI + offset _stru_335C4 + 4]
    mov word ptr [word_3BECE],AX
    mov word ptr [word_39606],0fffdh
    mov AX,word ptr [SI + offset _stru_335C4 + 14]
    mov word ptr [word_3B7DE],AX
    mov word ptr [SI + offset _stru_335C4 + 14],0h
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,1ah
    imul word ptr [BX + offset _stru_335C4 + 18]
    add AX,820h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    cmp word ptr [BP + -22h],1eh
    jz LAB_1000_8043
    cmp word ptr [BP + -22h],1dh
    jz LAB_1000_8043
    cmp word ptr [BP + -22h],1ch
    jz LAB_1000_8043
    jmp LAB_1000_8172
LAB_1000_8043:
    mov AX,1h
    push AX
    sub AX,AX
    push AX
    call scheduleTimedEvent
    add SP,4h
    mov AX,2h
    push AX
    push AX
    call makeSound
    add SP,4h
    mov AX,offset aMisses
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov SI,word ptr [word_3C020]
    mov CL,4h
    shl SI,CL
    mov AX,word ptr [word_3BEC8]
    sub AX,word ptr [SI + offset _g_planes + 2]
    push AX
    mov AX,word ptr [word_3BEBC]
    sub AX,word ptr [SI + offset _g_planes]
    push AX
    call _rangeApprox
    add SP,4h
    mov word ptr [BP + -0eh],AX
    mov AX,100h
    cwd
    mov CX,word ptr [g_missionStatus]
    inc CX
    idiv CX
    cmp AX,word ptr [BP + -0eh]
    jbe LAB_1000_80aa
    push word ptr [word_3C020]
    call processTargetReached
    add SP,2h
    mov AX,offset aDestroyedBy
    jmp LAB_1000_813b
LAB_1000_80aa:
    push word ptr [word_3BEC8]
    push word ptr [word_3BEBC]
    call findWaypointEntry
    add SP,4h
    mov word ptr [BP + -36h],AX
    db 3Dh, 0FFh, 0FFh ; cmp AX,0ffffh (force imm16 encoding)
    jnz LAB_1000_80c3
    jmp LAB_1000_8199
LAB_1000_80c3:
    mov BX,AX
    mov CL,4h
    shl BX,CL
    test byte ptr [BX + offset _g_planes + 6],80h
    jz LAB_1000_80d3
    jmp LAB_1000_8199
LAB_1000_80d3:
    mov BX,word ptr [word_39808]
    mov AX,word ptr [BX + 4h]
    mov DX,word ptr [BX + 6h]
    mov CL,5h
LAB_1000_80df:
    sar DX,1h
    rcr AX,1h
    dec CL
    jnz LAB_1000_80df
    mov word ptr [BP + -26h],AX
    mov BX,word ptr [word_39808]
    mov AX,word ptr [BX + 8h]
    mov DX,word ptr [BX + 0ah]
    mov CL,5h
LAB_1000_80f6:
    sar DX,1h
    rcr AX,1h
    dec CL
    jnz LAB_1000_80f6
    sub AX,8000h
    neg AX
    mov word ptr [BP + -2ch],AX
    mov AX,word ptr [word_3BEC8]
    sub AX,word ptr [BP + -2ch]
    push AX
    mov AX,word ptr [word_3BEBC]
    sub AX,word ptr [BP + -26h]
    push AX
    call _rangeApprox
    add SP,4h
    mov word ptr [BP + -0eh],AX
    mov AX,180h
    cwd
    mov CX,word ptr [g_missionStatus]
    add CX,2h
    idiv CX
    cmp AX,word ptr [BP + -0eh]
    jbe LAB_1000_8199
    push word ptr [BP + -36h]
    call processTargetReached
    add SP,2h
    mov AX,offset aDestroyedBy_0
LAB_1000_813b:
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,1ah
    imul word ptr [BX + offset _stru_335C4 + 18]
    add AX,820h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov word ptr [word_39606],8h
    mov word ptr [word_3BECE],0h
    jmp LAB_1000_8199
    db 90h
LAB_1000_8172:
    cmp word ptr [BP + -1ch],8h
    jl LAB_1000_81a3
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [_g_frameRateScaling]
    shl AX,1h
    cmp word ptr [BX + offset _stru_335C4 + 14],AX
    jle LAB_1000_81a3
    mov AX,offset aGroundImpact
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
LAB_1000_8199:
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
LAB_1000_81a3:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,word ptr [BP + -32h]
    sub AX,word ptr [SI + offset _stru_335C4 + 4]
    push AX
    call _abs
    add SP,2h
    mov CL,5h
    sar AX,CL
    add AX,word ptr [BP + -10h]
    mov CX,AX
    mov AX,word ptr [SI + offset _stru_335C4 + 6]
    mov DX,CX
    mov CL,4h
    shl AX,CL
    mov CX,DX
    cwd
    mov BX,word ptr [_g_frameRateScaling]
    idiv BX
    cmp CX,AX
    jc LAB_1000_81dc
    jmp LAB_1000_83ac
LAB_1000_81dc:
    cmp word ptr [BP + -4h],0h
    jnz LAB_1000_81e5
    jmp LAB_1000_83ac
LAB_1000_81e5:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_335C4]
    mov word ptr [word_3BEBC],AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,word ptr [SI + offset _stru_335C4 + 2]
    mov word ptr [word_3BEC8],AX
    mov AX,word ptr [SI + offset _stru_335C4 + 4]
    mov word ptr [word_3BECE],AX
    mov word ptr [word_39606],8h
    cmp word ptr [SI + offset _stru_335C4 + 14],0h
    jz LAB_1000_821e
    mov AX,word ptr [SI + offset _stru_335C4 + 14]
    mov word ptr [word_3B7DE],AX
LAB_1000_821e:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov word ptr [BX + offset _stru_335C4 + 14],0h
    cmp word ptr [BP + -1ch],8h
    jge LAB_1000_82ac
    cmp word ptr [word_333DA],0h
    jz LAB_1000_823c
    jmp LAB_1000_83ac
LAB_1000_823c:
    mov AX,offset aHitBy
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
    mov AX,12h
    imul word ptr [BP + -12h]
    add AX,528h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
    call bombTarget
    mov AX,word ptr [_frameTick]
    sar AX,1h
    db 25h, 07h, 00h ; and AX,7h (force imm16 encoding)
    mov word ptr [BP + -34h],AX
    mov SI,AX
    mov CL,3h
    shl SI,CL
    mov AX,word ptr [word_3BEBC]
    mov word ptr [SI + offset stru_33402],AX
    mov AX,word ptr [word_3BEC8]
    mov word ptr [SI + offset stru_33402 + 2],AX
    mov AX,word ptr [word_3BECE]
    mov word ptr [SI + offset stru_33402 + 4],AX
    test word ptr [_g_playerPlaneFlags],1000h
    jz LAB_1000_829c
    jmp LAB_1000_83ac
LAB_1000_829c:
    push word ptr [BP + -12h]
    mov AX,5h
    push AX
    call appendMapEvent
    add SP,4h
    jmp LAB_1000_83ac
LAB_1000_82ac:
    cmp word ptr [BP + -22h],7h
    jnz LAB_1000_8306
    push word ptr [BP + -14h]
    call destroyAircraft
    add SP,2h
    mov AX,word ptr [_frameTick]
    sar AX,1h
    db 25h, 07h, 00h ; and AX,7h (force imm16 encoding)
    mov word ptr [BP + -34h],AX
    mov AX,24h
    imul word ptr [BP + -14h]
    mov SI,AX
    mov DI,word ptr [BP + -34h]
    mov CL,3h
    shl DI,CL
    mov AX,word ptr [SI + offset word_3B204]
    mov word ptr [word_3BEBC],AX
    mov word ptr [DI + offset stru_33402],AX
    mov AX,word ptr [SI + offset word_3B206]
    mov word ptr [word_3BEC8],AX
    mov word ptr [DI + offset stru_33402 + 2],AX
    mov AX,24h
    imul word ptr [BP + -14h]
    mov BX,AX
    mov AX,word ptr [BX + offset _stru_3B208]
    mov word ptr [word_3BECE],AX
    mov BX,word ptr [BP + -34h]
    shl BX,CL
    mov word ptr [BX + offset stru_33402 + 4],AX
    jmp LAB_1000_8380
    db 90h
LAB_1000_8306:
    mov AX,4h
    push AX
    call randlmul
    add SP,2h
    push word ptr [BP + -14h]
    mov CX,AX
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    push word ptr [BX + offset _stru_335C4 + 18]
    mov SI,CX
    call lookupTerrainModifier
    add SP,4h
    cmp AX,SI
    jg LAB_1000_8340
    mov AX,word ptr [_g_frameRateScaling]
    mov CX,AX
    shl AX,1h
    shl AX,1h
    add AX,CX
    shl AX,1h
    cmp AX,word ptr [word_3B7DE]
    ja LAB_1000_834c
LAB_1000_8340:
    push word ptr [BP + -14h]
    call processTargetReached
    add SP,2h
    jmp LAB_1000_835a
    db 90h
LAB_1000_834c:
    mov AX,offset aIneffective
    push AX
    mov AX,offset strBuf
    push AX
    call _strcpy
    add SP,4h
LAB_1000_835a:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov word ptr [BX + offset _stru_335C4 + 14],0h
    mov AX,word ptr [word_3B0AC]
    mov word ptr [word_336F0],AX
    mov AX,word ptr [word_3BEBC]
    mov word ptr [word_3B4D8],AX
    mov AX,word ptr [word_3BEC8]
    mov word ptr [word_3B4E0],AX
    mov word ptr [word_3B5D6],0bb8h
LAB_1000_8380:
    mov AX,offset aHitBy_0
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,12h
    imul word ptr [BP + -12h]
    add AX,528h
    push AX
    mov AX,offset strBuf
    push AX
    call _strcat
    add SP,4h
    mov AX,offset strBuf
    push AX
    call tempStrcpy
    add SP,2h
LAB_1000_83ac:
    cmp word ptr [BP + -1ch],8h
    jge LAB_1000_83f4
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    cmp word ptr [SI + offset _stru_335C4 + 14],0h
    jz LAB_1000_83f4
    push word ptr [SI + offset _stru_335C4 + 2]
    push word ptr [SI + offset _stru_335C4]
    call readMapPixelColor
    add SP,4h
    mov word ptr [SI + offset _stru_335C4 + 20],AX
    test byte ptr [_frameTick],1h
    jz LAB_1000_83f4
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    mov AX,0eh
    push AX
    push word ptr [SI + offset _stru_335C4 + 2]
    push word ptr [SI + offset _stru_335C4]
    call plotMapObject
    add SP,6h
LAB_1000_83f4:
    inc word ptr [BP + -1ch]
LAB_1000_83f7:
    cmp word ptr [BP + -1ch],0ch
    jl LAB_1000_8400
    jmp LAB_1000_85b8
LAB_1000_8400:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    cmp word ptr [SI + offset _stru_335C4 + 14],0h
    jz LAB_1000_83f4
    mov AX,word ptr [SI + offset _stru_335C4 + 16]
    mov word ptr [BP + -12h],AX
    mov word ptr [BP + -4h],0h
    mov word ptr [BP + -6h],0h
    mov AX,12h
    imul word ptr [BP + -12h]
    mov BX,AX
    mov AX,word ptr [BX + offset _sams + 12]
    mov word ptr [BP + -22h],AX
    cmp word ptr [BP + -1ch],8h
    jl LAB_1000_8438
    jmp LAB_1000_7a38
LAB_1000_8438:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    push word ptr [SI + offset _stru_335C4 + 20]
    push word ptr [SI + offset _stru_335C4 + 2]
    push word ptr [SI + offset _stru_335C4]
    call plotMapObject
    add SP,6h
    mov AX,word ptr [_var_547]
    mov word ptr [BP + -32h],AX
    push word ptr [BP + -22h]
    push AX
    push word ptr [BP + -30h]
    push word ptr [BP + -2ah]
    push word ptr [BP + -1ch]
    call samCanAcquireTarget
    add SP,0ah
    mov word ptr [BP + -4h],AX
    mov AX,word ptr [_var_669]
    mov word ptr [BP + -10h],AX
    mov AX,word ptr [_var_670]
    mov word ptr [BP + -6h],AX
    mov word ptr [BP + -20h],1h
LAB_1000_847f:
    mov BX,word ptr [BP + -20h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    shl BX,1h
    db 83h, 0bfh, 28h, 0bh, 01h  ; CMP word ptr [BX + 0...,0x1                 ;= ??
    jnz LAB_1000_8499
    cmp word ptr [BP + -22h],0h
    jle LAB_1000_84f2
LAB_1000_8499:
    mov BX,word ptr [BP + -20h]
    mov AX,BX
    shl BX,1h
    add BX,AX
    shl BX,1h
    shl BX,1h
    db 83h, 0bfh, 28h, 0bh, 02h  ; CMP word ptr [BX + 0...,0x2                 ;= ??
    jnz LAB_1000_8528
    cmp word ptr [BP + -22h],1h
    jz LAB_1000_84f2
    cmp word ptr [BP + -22h],2h
    jz LAB_1000_84f2
    cmp word ptr [BP + -22h],3h
    jnz LAB_1000_8528
    mov AX,word ptr [BP + -6h]
    sub AX,word ptr [_var_542]
    mov CL,8h
    sar AX,CL
    push AX
    call _abs
    add SP,2h
    db 2Dh, 40h, 00h ; sub AX,40h (force imm16 encoding)
    push AX
    call _abs
    add SP,2h
    mov CX,word ptr [g_missionStatus]
    mov DX,CX
    shl CX,1h
    add CX,DX
    shl CX,1h
    shl CX,1h
    sub CX,40h
    neg CX
    cmp CX,AX
    jle LAB_1000_8528
LAB_1000_84f2:
    mov AX,word ptr [BP + -20h]
    mov CX,AX
    shl AX,1h
    add AX,CX
    shl AX,1h
    shl AX,1h
    mov SI,AX
    push word ptr [BP + -22h]
    push word ptr [_var_547]
    push word ptr [SI + offset word_333D4]
    push word ptr [SI + offset word_333D2]
    push word ptr [BP + -1ch]
    call samCanAcquireTarget
    add SP,0ah
    mov word ptr [BP + -2h],AX
    or AX,AX
    jz LAB_1000_8528
    mov word ptr [BP + -6h],AX
    mov word ptr [BP + -4h],0h
LAB_1000_8528:
    inc word ptr [BP + -20h]
    cmp word ptr [BP + -20h],4h
    jge LAB_1000_8534
    jmp LAB_1000_847f
LAB_1000_8534:
    cmp word ptr [BP + -10h],200h
    jbe LAB_1000_8585
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov SI,word ptr [BX + offset _stru_335C4 + 22]
    cmp SI,2h
    jle LAB_1000_855e
    mov BX,SI
    mov CL,4h
    shl BX,CL
    test byte ptr [BX + offset _g_planes + 6],10h
    jnz LAB_1000_855e
    mov word ptr [BP + -4h],0h
LAB_1000_855e:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov BX,AX
    mov SI,word ptr [BX + offset _stru_335C4 + 22]
    or SI,SI
    jg LAB_1000_8585
    mov AX,SI
    neg AX
    mov CX,24h
    imul CX
    mov BX,AX
    test byte ptr [BX + offset _stru_3B208 + 18],8h
    jnz LAB_1000_8585
    mov word ptr [BP + -4h],0h
LAB_1000_8585:
    mov AX,18h
    imul word ptr [BP + -1ch]
    mov SI,AX
    add SI,0d1ah
    mov AX,12h
    imul word ptr [BP + -12h]
    mov BX,AX
    mov AX,word ptr [BX + offset _sams + 10]
    mov CL,6h
    sar AX,CL
    cmp AX,word ptr [SI]
    jg LAB_1000_85a8
    jmp LAB_1000_7c47
LAB_1000_85a8:
    test byte ptr [_frameTick],1h
    jnz LAB_1000_85b2
    jmp LAB_1000_7c47
LAB_1000_85b2:
    inc word ptr [SI]
    jmp LAB_1000_7c47
    db 90h
LAB_1000_85b8:
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
updateThreatTargeting endp
_updateThreatTargeting equ updateThreatTargeting
; ------------------------------seg000:0x86f8------------------------------
; ------------------------------seg000:0x8aa4------------------------------
    nop
; ------------------------------seg000:0x8aa6------------------------------
EXTRN _fireMissile:NEAR
fireMissile equ _fireMissile
; ------------------------------seg000:0x8df3------------------------------
; ------------------------------seg000:0x8df4------------------------------
testWorldPosVisible equ _testWorldPosVisible
; ------------------------------seg000:0x8e36------------------------------
; ------------------------------seg000:0x8e38------------------------------
clearStatusPanel equ _clearStatusPanel
; ------------------------------seg000:0x95c9------------------------------
_redrawTacMap proc near
    push BP
    mov BP,SP
    sub SP,10h
    push SI
    mov word ptr [_word_3C09A],0h
    cmp word ptr [_word_330C2],0h
    jnz LAB_1000_95e0
    jmp LAB_1000_9870
LAB_1000_95e0:
    sub AX,AX
    push AX
    mov AX,offset aMap
    push AX
    mov AX,1h
    push AX
    call drawPanelText
    add SP,6h
    mov AX,48h
    mov CL,9h
    sub CL,byte ptr [byte_383E5]
    shl AX,CL
    mov word ptr [BP + -6h],AX
    mov AX,7fffh
    sub AX,word ptr [BP + -6h]
    push AX
    push word ptr [BP + -6h]
    mov AX,4000h
    mov CL,byte ptr [byte_383E5]
    sar AX,CL
    push AX
    push word ptr [_var_542]
    call _sinMul
    add SP,4h
    add AX,word ptr [BP + 4h]
    push AX
    call _clampRange
    add SP,6h
    mov word ptr [_var_589],AX
    mov AX,38h
    mov CL,9h
    sub CL,byte ptr [byte_383E5]
    shl AX,CL
    cwd
    mov CX,3h
    idiv CX
    shl AX,1h
    shl AX,1h
    mov word ptr [BP + -6h],AX
    mov AX,7fffh
    sub AX,word ptr [BP + -6h]
    push AX
    push word ptr [BP + -6h]
    mov AX,4000h
    mov CL,byte ptr [byte_383E5]
    sar AX,CL
    push AX
    push word ptr [_var_542]
    call _cosMul
    add SP,4h
    mov CX,word ptr [BP + 6h]
    sub CX,AX
    push CX
    call _clampRange
    add SP,6h
    mov word ptr [_var_590],AX
    les BX,dword ptr [_commData]
    cmp word ptr ES:[BX + 78h],0h
    jz LAB_1000_967e
    sub AX,AX
    jmp LAB_1000_9681
LAB_1000_967e:
    mov AX,3h
LAB_1000_9681:
    push AX
    call _loadColorPalette
    add SP,2h
    mov AX,13h
    push AX
    call far ptr _gfx_setFadeSteps
    add SP,2h
    mov AX,9h
    sub AX,word ptr [byte_383E5]
    push AX
    mov AX,word ptr [_var_590]
    cwd
    sub AX,DX
    sar AX,1h
    sub AX,4000h
    neg AX
    push AX
    mov AX,word ptr [_var_589]
    cwd
    sub AX,DX
    sar AX,1h
    push AX
    push word ptr [_var_567]
    call renderMapTerrain
    add SP,8h
    les BX,dword ptr [_gameData]
    cmp word ptr ES:[BX + 38h],2h
    jnc LAB_1000_96d6
    mov AX,0ch
    push AX
    call far ptr _gfx_setFadeSteps
    add SP,2h
    jmp LAB_1000_96e2
LAB_1000_96d6:
    mov AX,10h
    push AX
    call far ptr _gfx_setFadeSteps
    add SP,2h
LAB_1000_96e2:
    mov AL,byte ptr [_byte_3C5A0]
    cbw
    mov word ptr [BP + -0ah],AX
    call far ptr _gfx_getDisplayPage
    mov byte ptr [_byte_3C5A0],AL
    mov word ptr [BP + -6h],1h
    jmp LAB_1000_96fb
LAB_1000_96f8:
    inc word ptr [BP + -6h]
LAB_1000_96fb:
    mov AX,word ptr [_word_3BED2]
    cmp word ptr [BP + -6h],AX
    jl LAB_1000_9706
    jmp LAB_1000_97be
LAB_1000_9706:
    mov SI,word ptr [BP + -6h]
    mov CL,4h
    shl SI,CL
    cmp word ptr [SI + offset _g_planes + 4],0h
    jz LAB_1000_9754
    test byte ptr [SI + offset _g_planes + 6],80h
    jnz LAB_1000_9754
    lea AX,[BP + -4h]
    push AX
    lea AX,[BP + -2h]
    push AX
    push word ptr [SI + offset _g_planes + 2]
    push word ptr [SI + offset _g_planes]
    call objectToScreen
    add SP,8h
    or AX,AX
    jz LAB_1000_9754
    sub AX,AX
    push AX
    mov AX,4h
    push AX
    push AX
    sub AX,AX
    push AX
    mov AX,0a4h
    push AX
    mov AX,word ptr [BP + -4h]
    dec AX
    push AX
    mov AX,word ptr [BP + -2h]
    dec AX
    push AX
    call _blitSprite ; Render SAM radar sites
    add SP,0eh
LAB_1000_9754:
    mov BX,word ptr [BP + -6h]
    mov CL,4h
    shl BX,CL
    mov SI,word ptr [BX + offset _g_planes + 6]
    mov AX,SI
    and AX,481h
    cmp AX,401h
    jz LAB_1000_976f
    test SI,200h
    jz LAB_1000_97bb
LAB_1000_976f:
    mov SI,word ptr [BP + -6h]
    mov CL,4h
    shl SI,CL
    lea AX,[BP + -4h]
    push AX
    lea AX,[BP + -2h]
    push AX
    push word ptr [SI + offset _g_planes + 2]
    push word ptr [SI + offset _g_planes]
    call objectToScreen
    add SP,8h
    or AX,AX
    jz LAB_1000_97bb
    sub AX,AX
    push AX
    mov AX,4h
    push AX
    push AX
    sub AX,AX
    push AX
    cmp byte ptr [_gfxModeUnset],0h
    jz LAB_1000_97a7
    mov AX,0ach
    jmp LAB_1000_97aa
LAB_1000_97a7:
    mov AX,0b0h
LAB_1000_97aa:
    push AX
    mov AX,word ptr [BP + -4h]
    dec AX
    push AX
    mov AX,word ptr [BP + -2h]
    dec AX
    push AX
    call _blitSprite
    add SP,0eh
LAB_1000_97bb:
    jmp LAB_1000_96f8
LAB_1000_97be:
    mov word ptr [BP + -6h],0h
    jmp LAB_1000_97c8
LAB_1000_97c5:
    inc word ptr [BP + -6h]
LAB_1000_97c8:
    cmp word ptr [BP + -6h],2h
    jge LAB_1000_982a
    mov AX,4000h
    mov CL,byte ptr [BP + -6h]
    sar AX,CL
    test word ptr [_g_playerPlaneFlags],AX
    jnz LAB_1000_9828
    mov SI,word ptr [BP + -6h]
    mov CL,2h
    shl SI,CL
    lea AX,[BP + -4h]
    push AX
    lea AX,[BP + -2h]
    push AX
    push word ptr [SI + offset _waypointIndex + 6]
    push word ptr [SI + offset _waypointIndex + 4]
    call objectToScreen
    add SP,8h
    or AX,AX
    jz LAB_1000_9828
    sub AX,AX
    push AX
    mov AX,4h
    push AX
    push AX
    sub AX,AX
    push AX
    cmp byte ptr [_gfxModeUnset],0h
    jz LAB_1000_9814
    mov AX,offset aF15dgtl_bin
    jmp LAB_1000_9817
LAB_1000_9814:
    mov AX,0a8h
LAB_1000_9817:
    push AX
    mov AX,word ptr [BP + -4h]
    dec AX
    push AX
    mov AX,word ptr [BP + -2h]
    dec AX
    push AX
    call _blitSprite ; Draw targets
    add SP,0eh
LAB_1000_9828:
    jmp LAB_1000_97c5
LAB_1000_982a:
    mov AL,byte ptr [BP + -0ah]
    mov byte ptr [_byte_3C5A0],AL
    call far ptr _gfx_getDisplayPage
    or AL,AL
    jnz LAB_1000_983e
    call cacheScopePanel
    jmp LAB_1000_986a
LAB_1000_983e:
    mov AX,38h
    push AX
    mov AX,48h
    push AX
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_566]
    push word ptr [BX]
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_565]
    push word ptr [BX]
    call far ptr _gfx_copyRect
    add SP,10h
LAB_1000_986a:
    call restoreScopePanel
    call _resetSimObjectLocks
LAB_1000_9870:
    pop SI
    mov SP,BP
    pop BP
    ret
_redrawTacMap endp
; ------------------------------seg000:0x9874------------------------------
; ------------------------------seg000:0x9c0c------------------------------
zoomIn equ _zoomIn
; ------------------------------seg000:0x98b3------------------------------
zoomOut equ _zoomOut
; ------------------------------seg000:0x9c0c------------------------------
EXTRN _drawViewportLine:near
drawViewportLine equ _drawViewportLine
; ------------------------------seg000:0x9c83------------------------------

; ------------------------------seg000:0x9c84------------------------------
EXTRN _drawClippedLineRegion:near
EXTRN _findWaypointEntry:near
drawClippedLineRegion equ _drawClippedLineRegion
; ------------------------------seg000:0x9d85------------------------------
; ------------------------------seg000:0x9d86------------------------------
drawScreenLineOnePage equ _drawScreenLineOnePage
; ------------------------------seg000:0x9daf------------------------------
; ------------------------------seg000:0x9db0------------------------------
drawHudViewLine equ _drawHudViewLine
drawMapPoint equ _drawMapPoint
switchIndicatorColor equ _switchIndicatorColor
; ------------------------------seg000:0x9f46------------------------------
; ------------------------------seg000:0xa030------------------------------
drawCenteredLabelBox proc near
    push BP
    mov BP,SP
    sub SP,6h
    jmp LAB_1000_a0c7
    db 0FFh
    db 76h
    db 06h
    db 0E8h
    db 0DFh
    db 49h
    db 83h
    db 0C4h
    db 02h
    db 0Bh
    db 0C0h
    db 74h
    db 07h
    db 83h
    db 3Eh
    db 12h
    db 08h
    db 00h
    db 75h
    db 02h
    db 0EBh
    db 78h
    db 83h
    db 7Eh
    db 04h
    db 01h
    db 75h
    db 11h
    db 0C7h
    db 46h
    db 0FEh
    db 18h
    db 00h
    db 0C7h
    db 46h
    db 0FAh
    db 60h
    db 00h
    db 0C7h
    db 46h
    db 0FCh
    db 70h
    db 00h
    db 0EBh
    db 0Fh
    db 0C7h
    db 46h
    db 0FEh
    db 78h
    db 00h
    db 0C7h
    db 46h
    db 0FAh
    db 0C7h
    db 00h
    db 0C7h
    db 46h
    db 0FCh
    db 68h
    db 00h
    db 83h
    db 6Eh
    db 0FCh
    db 08h
    db 0B8h
    db 08h
    db 00h
    db 50h
    db 0E8h
    db 0C4h
    db 0FDh
    db 83h
    db 0C4h
    db 02h
    db 8Bh
    db 46h
    db 0FCh
    db 05h
    db 04h
    db 00h
    db 50h
    db 8Bh
    db 46h
    db 0FAh
    db 2Dh
    db 05h
    db 00h
    db 50h
    db 0FFh
    db 76h
    db 0FCh
    db 8Bh
    db 46h
    db 0FEh
    db 05h
    db 05h
    db 00h
    db 50h
    db 0E8h
    db 0BFh
    db 0FDh
    db 83h
    db 0C4h
    db 08h
    db 0B8h
    db 0Bh
    db 00h
    db 50h
    db 0FFh
    db 76h
    db 0FCh
    db 0FFh
    db 76h
    db 06h
    db 0E8h
    db 70h
    db 49h
    db 83h
    db 0C4h
    db 02h
    db 0D1h
    db 0E0h
    db 8Bh
    db 4Eh
    db 0FEh
    db 03h
    db 4Eh
    db 0FAh
    db 0D1h
    db 0F9h
    db 2Bh
    db 0C8h
    db 51h
    db 0FFh
    db 76h
    db 06h
    db 0E8h
    db 07h
    db 00h
    db 83h
    db 0C4h
    db 08h
LAB_1000_a0c7:
    mov SP,BP
    pop BP
    ret
drawCenteredLabelBox endp
_drawCenteredLabelBox equ drawCenteredLabelBox
; ------------------------------seg000:0xa0ca------------------------------
; ------------------------------seg000:0xa139------------------------------
_drawStringCentered proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    mov word ptr [BX + 0ch],0h
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 8h]
    mov word ptr [BX + 8h],AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 0ah]
    mov word ptr [BX + 0ah],AX
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BP + 0ch]
    mov word ptr [BX + 4h],AX
    push word ptr [BP + 6h]
    call _strlen
    add SP,2h
    push AX
    push word ptr [BP + 6h]
    call _strupr
    add SP,2h
    push AX
    push word ptr [BP + 4h]
    call far ptr _gfx_drawString
    add SP,6h
    mov SP,BP
    pop BP
    ret
_drawStringCentered endp
; ------------------------------seg000:0xa1b0------------------------------
; ------------------------------seg000:0xa934------------------------------
cacheScopePanel proc near
    mov AX,39h
    push AX
    mov AX,49h
    push AX
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_566]
    push word ptr [BX]
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_564]
    push word ptr [BX]
    call far ptr _gfx_copyRect
    add SP,10h
    ret
    nop
cacheScopePanel endp
; ------------------------------seg000:0xa961------------------------------
; ------------------------------seg000:0xa962------------------------------
restoreScopePanel proc near
    mov AX,39h
    push AX
    mov AX,49h
    push AX
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_564]
    push word ptr [BX]
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_566]
    push word ptr [BX]
    call far ptr _gfx_copyRect
    add SP,10h
    mov AX,39h
    push AX
    mov AX,49h
    push AX
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_565]
    push word ptr [BX]
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_564]
    push word ptr [BX]
    call far ptr _gfx_copyRect
    add SP,10h
    ret
    nop
restoreScopePanel endp
_restoreScopePanel equ restoreScopePanel
; ------------------------------seg000:0xa9bb------------------------------
; ------------------------------seg000:0xa9bc------------------------------
captureScopePanel proc near
    mov AX,39h
    push AX
    mov AX,49h
    push AX
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    cmp byte ptr [_byte_3C5A0],0h
    jz LAB_1000_a9da
    mov BX,word ptr [_var_565]
    jmp LAB_1000_a9de
    db 90h
LAB_1000_a9da:
    mov BX,word ptr [_var_564]
LAB_1000_a9de:
    mov AX,word ptr [BX]
    push AX
    mov AX,70h
    push AX
    mov AX,18h
    push AX
    mov BX,word ptr [_var_566]
    push word ptr [BX]
    call far ptr _gfx_copyRect
    add SP,10h
    ret
captureScopePanel endp
_captureScopePanel equ captureScopePanel
; ------------------------------seg000:0xa9f7------------------------------
; ------------------------------seg000:0xa9f8------------------------------
updateTargetLock equ _updateTargetLock
; ------------------------------seg000:0xb146------------------------------
; ------------------------------seg000:0xb147------------------------------
EXTRN _drawHudWorldOverlay:NEAR
drawHudWorldOverlay equ _drawHudWorldOverlay
; ------------------------------seg000:0xc6be------------------------------
findWaypointEntry equ _findWaypointEntry
; ------------------------------seg000:0xc9d2------------------------------
drawWorldObject equ _drawWorldObject
; ------------------------------seg000:0xcb41------------------------------
; ------------------------------seg000:0xd008------------------------------
computeBearing equ _computeBearing
; ------------------------------seg000:0xd177------------------------------
; ------------------------------seg000:0xd178------------------------------
; _sinMul - now in C (egame2.c)
; ------------------------------seg000:0xd18f------------------------------
; ------------------------------seg000:0xd190------------------------------
; _cosMul - now in C (egame2.c)
; ------------------------------seg000:0xd1a4------------------------------
    nop
    nop
; ------------------------------seg000:0xd1e8------------------------------
seedRng equ _seedRng
; ------------------------------seg000:0xd1ff------------------------------
; ------------------------------seg000:0xd21e------------------------------
readAxisInput equ _readAxisInput
; ------------------------------seg000:0xd25e------------------------------
; ------------------------------seg000:0xd260------------------------------
EXTRN _keyDispatch:NEAR
keyDispatch equ _keyDispatch
; ------------------------------seg000:0xddc4------------------------------
_openFile proc near
    path = word ptr 4
    mode = byte ptr 6
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ah, 3Dh
    mov al, [bp+mode]
    mov bx, ss
    mov ds, bx
    mov dx, [bp+path]
    int 21h ;DOS - 2+ - OPEN DISK FILE WITH HANDLE
    jnb short loc_1DE0D
    db 3Dh ;cmp ax, 2
    dw 2
    jnz short loc_1DDEC
loc_1DDE0:
    mov bx, [bp+path]
    mov ax, offset aFileNotFound ;":File not found$"
    mov cx, 0FFFFh
    jmp loc_1DF80
loc_1DDEC:
    db 3Dh ;cmp ax, 3
    dw 3
    jz short loc_1DDE0
    db 3Dh ;cmp ax, 4
    dw 4
    jnz short loc_1DE02
    mov cx, 0FFFFh
    mov bx, [bp+path]
    mov ax, offset aNoFileBuffersAvailabl ;":No file buffers available$"
    jmp loc_1DF80
loc_1DE02:
    mov cx, ax
    mov ax, offset aOpenError ;":Open error $"
    mov bx, [bp+path]
    jmp loc_1DF80
loc_1DE0D:
    mov fileReadPos, 200h
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
_openFile endp
; ------------------------------seg000:0xde1a------------------------------
; ------------------------------seg000:0xde1b------------------------------
createFile proc near
    arg_0 = word ptr 4
    arg_2 = word ptr 6
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ah, 3Ch
    mov cx, [bp+arg_2]
    mov bx, ss
    mov ds, bx
    mov dx, [bp+arg_0]
    int 21h ;DOS - 2+ - CREATE A FILE WITH HANDLE (CREAT)
    jnb short loc_1DE64
    db 3Dh ;cmp ax, 2
    dw 2
    jnz short loc_1DE43
loc_1DE37:
    mov bx, [bp+arg_0]
    mov ax, 5F7Ch
    mov cx, 0FFFFh
    jmp loc_1DF80
loc_1DE43:
    db 3Dh ;cmp ax, 3
    dw 3
    jz short loc_1DE37
    db 3Dh ;cmp ax, 4
    dw 4
    jnz short loc_1DE59
    mov cx, 0FFFFh
    mov bx, [bp+arg_0]
    mov ax, 5F8Ch
    jmp loc_1DF80
loc_1DE59:
    mov cx, ax
    mov ax, 5FA7h
    mov bx, [bp+arg_0]
    jmp loc_1DF80
loc_1DE64:
    mov fileReadPos, 200h
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
createFile endp
_createFile equ createFile
; ------------------------------seg000:0xde71------------------------------
; ------------------------------seg000:0xde72------------------------------
; --- _closeFile: egame bindings for shared/file_close.inc ---
fileCloseErrorStr EQU <aFileClosingError>
fileCloseErrExit  EQU <printString_1DF9B>
INCLUDE shared/file_close.inc
_closeFile equ fileClose
; ------------------------------seg000:0xde92------------------------------
; ------------------------------seg000:0xde94------------------------------
readFile1 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AH,3fh
    mov BX,SS
    mov DS,BX
    mov BX,word ptr [BP + 4h]
    mov CX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    int 21h
    jnc LAB_1000_deb7
    mov DX,5fc7h
    mov CX,0ffffh
    jmp printString_1DF9B
LAB_1000_deb7:
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
readFile1 endp
_readFile1 equ readFile1
; ------------------------------seg000:0xdebe------------------------------
; ------------------------------seg000:0xdebf------------------------------
readFile2 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    push DS
    mov AH,3fh
    mov BX,word ptr [BP + 0ah]
    mov DS,BX
    mov BX,word ptr [BP + 4h]
    mov CX,word ptr [BP + 6h]
    mov DX,word ptr [BP + 8h]
    int 21h
    pop DS
    jnc LAB_1000_dee5
    mov DX,5fc7h
    mov CX,0ffffh
    jmp printString_1DF9B
LAB_1000_dee5:
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
    db 1Eh
    db 06h
    db 56h
    db 57h
    db 8Ch
    db 0D8h
    db 8Eh
    db 0C0h
    db 36h
    db 8Eh
    db 1Eh
    db 0DEh
    db 5Fh
    db 0B9h
    db 00h
    db 01h
    db 36h
    db 8Bh
    db 36h
    db 0E0h
    db 5Fh
    db 0BFh
    db 7Ch
    db 5Dh
    db 0F3h
    db 0A5h
    db 36h
    db 81h
    db 06h
    db 0E0h
    db 5Fh
    db 00h
    db 02h
    db 0B8h
    db 00h
    db 02h
    db 5Fh
    db 5Eh
    db 07h
    db 1Fh
    db 0C3h
readFile2 endp
_readFile2 equ readFile2
; ------------------------------seg000:0xdeec------------------------------
; ------------------------------seg000:0xdf16------------------------------
; --- read512: egame bindings for shared/file_read512.inc ---
fileRead512Handle  EQU <tmpFileHandle>
fileRead512Buf     EQU <picBuf>
fileRead512ErrStr  EQU <aReadError>
fileRead512ErrExit EQU <printString_1DF9B>
INCLUDE shared/file_read512.inc
    nop
; ------------------------------seg000:0xdf36------------------------------
; ------------------------------seg000:0xdf4f------------------------------
writeFileAtRaw proc near
    arg_0 = word ptr 4
    arg_2 = word ptr 6
    arg_4 = word ptr 8
    arg_6 = word ptr 0Ah
    arg_8 = word ptr 0Ch
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    push ds
    mov ah, 40h
    mov bx, [bp+arg_6]
    mov ds, bx
    mov bx, [bp+arg_0]
    mov cx, [bp+arg_2]
    mov dx, [bp+arg_4]
    add dx, [bp+arg_8]
    int 21h ;DOS - 2+ - WRITE TO FILE WITH HANDLE
    pop ds
    jnb short loc_1DF78
    mov dx, 5FD2h
    mov cx, 0FFFFh
    jmp short printString_1DF9B
    nop ;align 2
loc_1DF78:
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
loc_1DF80:
    push ax
    mov ax, 3
    int 10h ;- VIDEO - SET VIDEO MODE
    mov di, 0
loc_1DF89:
    cmp byte ptr [bx+di], 0
    jz short loc_1DF91
    inc di
    jmp short loc_1DF89
loc_1DF91:
    mov byte ptr [bx+di], 24h
    mov dx, bx
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    pop dx
printString_1DF9B:
    mov ah, 9
    int 21h ;DOS - PRINT STRING
    cmp cx, 0FFFFh
    jz short loc_1DFB7
    add cx, 30h
    mov byte_3862A, cl
    mov byte_3862B, 24h
    mov dx, offset byte_3862A
    mov ah, 9
    int 21h ;DOS - PRINT STRING
loc_1DFB7:
    mov ax, 4C00h
    int 21h ;DOS - 2+ - QUIT WITH EXIT CODE (EXIT)
writeFileAtRaw endp ;AL = exit code
_writeFileAtRaw equ writeFileAtRaw
    nop
; ------------------------------seg000:0xdfba------------------------------
; ------------------------------seg000:0xe0aa------------------------------
_picBlit proc near
    arg_0 = word ptr 4
    arg_2 = word ptr 6
    push bp
    mov bp, sp
    push di
    push si
    push es
    push bp
    mov ax, offset read512FromFileIntoBuf
    mov word ptr [_var_610], ax
    mov ax, [bp+arg_0]
    mov tmpFileHandle, ax
    mov ax, [bp+arg_2]
    mov tmpPageIndex, ax
    call nullsub_1
    mov si, tmpPageIndex
    call far ptr gfx_getPageSeg
    call far ptr gfx_clearPage
    mov word_389E0, 0
    mov word_389D8, 0FA00h
loc_1E0E0:
    mov di, word_389E0
    call far ptr gfx_getRowOffset
    mov rowOffset, ax
    call decodePicRow
    mov di, rowOffset
    mov bp, offset picDecodedRowBuf
    mov bx, word_389E0
    call far ptr gfx_fillRow
    mov di, rowOffset
    call far ptr gfx_copyRow
    inc word_389E0
    sub word_389D8, 140h
    jnz short loc_1E0E0
    pop bp
    pop es
    pop si
    pop di
    mov sp, bp
    pop bp
    retn
_picBlit endp
; ------------------------------seg000:0xe11b------------------------------
; ------------------------------seg000:0xe11c------------------------------
picBlitOverlay2 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,offset read512FromFileIntoBuf
    mov word ptr [_var_610],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_605],AX
    mov AX,word ptr [BP + 6h]
    mov ES,AX
    call far ptr gfx_clearPage
    call nullsub_1
    mov word ptr [_var_609],0h
    mov word ptr [_var_606],0fa00h
LAB_1000_e148:
    mov DI,word ptr [_var_609]
    call far ptr gfx_getRowOffset
    mov word ptr [_var_608],AX
    call decodePicRow
    mov DI,word ptr [_var_608]
    mov BP,offset picDecodedRowBuf
    mov BX,word ptr [_var_609]
    call far ptr gfx_fillRow
    mov DI,word ptr [_var_608]
    call far ptr gfx_setOvlVal2
    inc word ptr [_var_609]
    sub word ptr [_var_606],140h
    jnz LAB_1000_e148
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
picBlitOverlay2 endp
; ------------------------------seg000:0xe1f7------------------------------
; ------------------------------seg000:0xe1f8------------------------------
picBlitOverlay1 proc near
    push BP
    mov BP,SP
    push DI
    push SI
    push ES
    push BP
    mov AX,offset read512FromFileIntoBuf
    mov word ptr [_var_610],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [_var_605],AX
    mov AX,word ptr [BP + 6h]
    mov ES,AX
    call far ptr gfx_clearPage
    call nullsub_1
    mov word ptr [_var_609],0h
    mov word ptr [_var_606],0fa00h
LAB_1000_e224:
    mov DI,word ptr [_var_609]
    call far ptr gfx_getRowOffset
    mov word ptr [_var_608],AX
    call decodePicRow
    mov DI,word ptr [_var_608]
    mov BP,offset picDecodedRowBuf
    mov BX,word ptr [_var_609]
    call far ptr gfx_getPageSeg
    mov DI,word ptr [_var_608]
    call far ptr gfx_setOvlVal1
    inc word ptr [_var_609]
    sub word ptr [_var_606],140h
    jnz LAB_1000_e224
    pop BP
    pop ES
    pop SI
    pop DI
    mov SP,BP
    pop BP
    ret
picBlitOverlay1 endp
; ------------------------------seg000:0xe25f------------------------------
; ------------------------------seg000:0xe260------------------------------
nullsub_1 proc near
    ret
nullsub_1 endp
; ------------------------------seg000:0xe260------------------------------
; ------------------------------seg000:0xe262------------------------------
; --- LZW pic decoder: egame symbol bindings for shared/pic_lzw.inc ---
picFileReadPos EQU <fileReadPos>
picFileReadBuf EQU <picBuf>
picRowLength EQU <_var_689>
picReadBufEndPtr EQU <_var_687>
picWorkData EQU <word_38F70 - 1>
picWorkDataPtr EQU <_var_688>
picProcessFlag EQU <_var_690>
picLookupResult EQU <word_38D5C>
picFileWord EQU <byte_38D63>
picRemainingBitCount EQU <_var_697>
picByteUnsignedFlag EQU <word_38D66>
picByte EQU <word_38D5E>
picTmp9BitCount EQU <_var_692>
picFileReadBufEnd EQU <_var_694>
picNumberDictSlots EQU <byte_38D61>
picDecodeDictionary EQU <word_3424C>
picDecodeIncrement EQU <word_3424E>
picReadFromFilePtr EQU <_var_610>
picSlotCounter EQU <_var_699>
picDictionaryIndex EQU <_var_700>
INCLUDE shared/pic_lzw.inc
; ------------------------------seg000:0xe42e------------------------------
; These are compiler helper wrappers called by game code
shiftLongLeftInPlace proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    mov DX,word ptr [BX + 2h]
    mov CX,word ptr [BP + 6h]
    call __aNlshl
    mov BX,word ptr [BP + 4h]
    mov word ptr [BX],AX
    mov word ptr [BX + 2h],DX
    mov SP,BP
    pop BP
    ret 4h
shiftLongLeftInPlace endp
PUBLIC shiftLongLeftInPlace
shiftLongRightInPlace proc near
    push BP
    mov BP,SP
    mov BX,word ptr [BP + 4h]
    mov AX,word ptr [BX]
    mov DX,word ptr [BX + 2h]
    mov CX,word ptr [BP + 6h]
    call __aNlshr
    mov BX,word ptr [BP + 4h]
    mov word ptr [BX],AX
    mov word ptr [BX + 2h],DX
    mov SP,BP
    pop BP
    ret 4h
shiftLongRightInPlace endp
PUBLIC shiftLongRightInPlace
; ==============================================================================
; NOTE: The first 0x42 bytes of DGROUP (NULL segment) are provided by slibce.lib.
; The seg001 raw binary code uses DGROUP-relative offsets for data access.
; ORG values in _DATA correspond to DGROUP offsets (offset = ORG value).
; _DATA starts at DGROUP:0x42 (after the 0x42-byte NULL segment from the library).
; Therefore the first ORG value used must be >= 0x42.

END
