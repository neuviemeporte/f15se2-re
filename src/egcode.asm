.8086
DOSSEG
.MODEL SMALL

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
EXTRN _appendMapEvent:PROC
EXTRN _scaleCoordToLod:PROC
EXTRN _fireAirThreat:NEAR
fireAirThreat equ _fireAirThreat
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
EXTRN _renderHudFrame:PROC
EXTRN _signOf:PROC
EXTRN _seedRng:PROC
EXTRN _readAxisInput:PROC
EXTRN _computeMapTargetRange:PROC
EXTRN _computeSimObjectRange:PROC
EXTRN _computeTargetBearing:PROC
EXTRN _drawInstrumentGaugesFar:PROC
EXTRN _setup3DTransform:PROC
EXTRN _clampValue:PROC
EXTRN _shapeDataOffset:PROC
EXTRN _drawWorldObject:PROC
EXTRN _scheduleTimedEvent:PROC
EXTRN _scheduleEventCheck:PROC
EXTRN _drawTargetLabel:PROC
EXTRN _buildRangeString:PROC
EXTRN _isTargetOverWater:PROC
EXTRN _getTargetSymbol:PROC
EXTRN _computeLoftAngle:PROC
EXTRN _mapXToScreen:PROC
EXTRN _mapYToScreen:PROC
EXTRN _testWorldPosVisible:PROC
EXTRN _clearStatusPanel:PROC
EXTRN _refreshActivePanel:PROC
EXTRN _initTacMapView:PROC
EXTRN _setViewPosition:PROC
EXTRN _clampRange:PROC
EXTRN _rangeApprox:PROC
EXTRN _computeBearing:PROC
EXTRN _sinMul:PROC
EXTRN _cosMul:PROC
EXTRN _randomRange:PROC
EXTRN _loadRegion3D:PROC
EXTRN _isqrt:PROC
EXTRN _drawClippedLineRegion:PROC
EXTRN _drawScreenLineOnePage:PROC
EXTRN _drawPanelText:PROC
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
EXTRN _abs:PROC
EXTRN _strupr:PROC
EXTRN _strcpy:PROC
EXTRN _strlen:PROC
EXTRN _strcat:PROC
EXTRN __aNlshl:PROC
EXTRN __aNlshr:PROC
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
EXTRN _doNothing3:PROC
EXTRN _doNothing4:PROC
EXTRN _setViewRotation:PROC
EXTRN _renderMapTerrain:PROC
EXTRN _drawMapTiles:PROC
EXTRN _drawMapTileObject:PROC
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
EXTRN _cacheScopePanel:PROC
cacheScopePanel equ _cacheScopePanel
EXTRN _restoreScopePanel:PROC
restoreScopePanel equ _restoreScopePanel
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

ViewSnapshot		struc ;	(sizeof=0x10, mappedto_11) ; XREF: dseg:g_viewSnapshotRing/r
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

Projectile		struc ;	(sizeof=0x18, mappedto_12) ; XREF: dseg:g_projectiles/r
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
EXTRN _g_horizonGroundColor:BYTE
EXTRN _g_timerTickByte:BYTE
EXTRN _g_frameTimingAccum:WORD
EXTRN _frameTick:WORD
EXTRN _g_frameRateScaling:WORD
EXTRN _g_playerPlaneFlags:WORD
EXTRN _g_viewX_:WORD
EXTRN _g_viewY_:WORD
EXTRN _gfx_allocPage:PROC
EXTRN _gfx_drawString:PROC
EXTRN _keyValue:WORD
EXTRN _sams:BYTE
EXTRN _g_projectiles:BYTE
EXTRN _g_simObjects:BYTE
EXTRN _g_modelStreamPtr:WORD
EXTRN _g_modelWideVtxFlag:BYTE
EXTRN _g_vtxSignMaskLo:WORD
EXTRN _g_vtxSignMaskHi:WORD
EXTRN _g_posVisibleFlag:WORD
EXTRN picOvlPageIndex:WORD
EXTRN picOvlRowOffset:WORD
EXTRN readFromFilePtr:WORD
EXTRN _g_acqRange:WORD
EXTRN _g_acqAimY:WORD
EXTRN lzw_readBufEndPtr:WORD
EXTRN lzw_workDataPtr:WORD
EXTRN lzw_rowLength:WORD
EXTRN lzw_processFlag:WORD
EXTRN lzw_bitWidth:WORD
EXTRN lzw_maxCode:WORD
EXTRN lzw_bitsLeft:WORD
EXTRN lzw_slotCounter:WORD
EXTRN lzw_dictIndex:WORD
EXTRN _g_nightMode:WORD
EXTRN _g_hudVisible:WORD
EXTRN _g_hudBottomY:WORD
EXTRN _g_planeCount:WORD
EXTRN _g_groundUnitCount:WORD
EXTRN aF15dgtl_bin:BYTE
EXTRN aFileClosingError:BYTE
EXTRN aFileNotFound:BYTE
EXTRN aNoFileBuffersAvailabl:BYTE
EXTRN aOpenError:BYTE
EXTRN audio_timerTick:PROC
EXTRN audio_noiseTick:PROC
EXTRN _g_dacGroundPaletteSrc:BYTE
g_dacGroundPaletteSrc EQU _g_dacGroundPaletteSrc
EXTRN _g_frameSyncPending:BYTE
EXTRN _g_timerDividerCounter:BYTE
EXTRN _g_timerSyncToRetrace:BYTE
EXTRN _g_exitMsgDigit:BYTE
g_exitMsgDigit EQU _g_exitMsgDigit
EXTRN _g_exitMsgTerm:BYTE
g_exitMsgTerm EQU _g_exitMsgTerm
EXTRN g_picNumberDictSlots:BYTE
EXTRN g_picFileWord:BYTE
EXTRN _g_missionEndedFlag:BYTE
EXTRN _dacValues:BYTE
dacValues EQU _dacValues
g_dacGroundPalette EQU _dacValues + 30h
EXTRN _dacValues1:BYTE
dacValues1 EQU _dacValues1
EXTRN f15dgtlAddr:WORD
EXTRN fileReadPos:WORD
EXTRN _g_missionStatus:WORD
EXTRN gfx_clearPage:PROC
EXTRN gfx_copyRow:PROC
EXTRN gfx_dacAnimate:PROC
EXTRN gfx_dacCycle:PROC
EXTRN gfx_fillRow:PROC
EXTRN gfx_getFreeMem:PROC
EXTRN gfx_getPageSeg:PROC
EXTRN gfx_getRowOffset:PROC
EXTRN gfx_setOvlVal1:PROC
EXTRN gfx_setOvlVal2:PROC
EXTRN cbreakHit:BYTE
EXTRN origCBreakOfs:WORD
EXTRN origCBreakSeg:WORD
EXTRN _otherDacValues:BYTE
otherDacValues EQU _otherDacValues
EXTRN ovlInsaneFlag:BYTE
EXTRN _picBuf:BYTE
picBuf EQU _picBuf
EXTRN picDecodedRowBuf:BYTE
EXTRN rowOffset:WORD
EXTRN timerHandlerInstalled:BYTE
EXTRN tmpFileHandle:WORD
EXTRN aReadError:BYTE
EXTRN aWriteError:BYTE
EXTRN tmpPageIndex:WORD
EXTRN _g_threatActiveTimer:WORD
; LZW pic dictionary base: overlaid scratch region migrated to egdata.c
; (struct VtxScratch vtxScratch). word_3424C/3424E are the dict value/increment
; fields at the region base; see struct.h and egseg1.asm.
EXTRN _vtxScratch:word
word_3424C equ _vtxScratch
word_3424E equ _vtxScratch+2h
EXTRN g_sineTableBase:WORD
EXTRN g_sineTableDelta:WORD
EXTRN _g_angleLut:WORD
EXTRN _g_timerElapsedLo:WORD
EXTRN _g_timerElapsedHi:WORD
EXTRN _g_timerCountdownTarget:WORD
EXTRN _g_timerReloadDivisor:WORD
EXTRN _g_timerTickCount:WORD
EXTRN _g_timerRunDivider:WORD
EXTRN _g_timerMode:WORD
EXTRN _g_timerCalSumLo:WORD
EXTRN _g_timerCalSumHi:WORD
EXTRN _g_timerTickCountdown:WORD
EXTRN _g_timerRetraceResult:WORD
EXTRN g_picBlitBytesRemaining:WORD
EXTRN g_picBlitCurrentRow:WORD
EXTRN g_picLookupResult:WORD
EXTRN g_picByte:WORD
EXTRN g_picByteUnsignedFlag:WORD
EXTRN _picWorkData:BYTE
EXTRN _g_hitEffectTimer:WORD
EXTRN _g_threatTimerInit:WORD
EXTRN _g_threatRefX:WORD
EXTRN _g_threatRefY:WORD
EXTRN _g_threatRefZ:WORD
EXTRN _g_savedSamTtl:WORD
EXTRN _g_hitMapX:WORD
EXTRN _g_hitMapY:WORD
EXTRN _g_hitAlt:WORD
EXTRN _g_loftTargetIdx:WORD

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
EXTRN _countermeasures:NEAR
countermeasures equ _countermeasures
; ------------------------------seg000:0x1635------------------------------
; ------------------------------seg000:0x19a3------------------------------
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
EXTRN _drawModelPoint:PROC
drawModelPoint equ _drawModelPoint
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
; --- two far-pointer readers (decoded from raw bytes; originally @0x3aa1) ---
loc_3aa1:                       ; dword reader, advances _g_modelStreamPtr by 4
    cmp byte ptr [_g_modelWideVtxFlag], 0
    jz  short loc_3ad1
    mov bx, [_g_modelStreamPtr]
    add word ptr [_g_modelStreamPtr], 4
    mov es, [_g_modelStreamPtr+2]
    mov ax, es:[bx]
    mov dx, es:[bx+2h]
    and ax, [_g_vtxSignMaskLo]
    and dx, [_g_vtxSignMaskHi]
    or  dx, ax
    jz  short loc_3acd
    mov ax, 1
    retn
    nop
loc_3acd:
    sub ax, ax
    retn
    nop
loc_3ad1:                       ; word reader, advances _g_modelStreamPtr by 2
    mov bx, [_g_modelStreamPtr]
    add word ptr [_g_modelStreamPtr], 2
    mov es, [_g_modelStreamPtr+2]
    mov ax, es:[bx]
    and ax, [_g_vtxSignMaskLo]
    retn
    nop

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
    cmp _g_horizonGroundColor, 2
    jz short loc_13B16
    mov cx, 30h
    push si
    push di
    mov si, offset g_dacGroundPaletteSrc
    mov di, offset g_dacGroundPalette
    rep movsb
    pop di
    pop si
loc_13B16:
    mov dx, offset dacValues
    cmp _g_nightMode, 0
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
    mov AX,word ptr [BX + offset g_sineTableDelta]
    mov BX,word ptr [BX + offset g_sineTableBase]
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
    mov AX,word ptr [BX + offset _g_angleLut+2]
    mov BX,word ptr [BX + offset _g_angleLut]
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
    call far ptr _drawInstrumentGaugesFar ;call _drawInstrumentGaugesFar
loc_13C59:
    mov bx, 0
    mov ax, _g_hudBottomY
    call far ptr gfx_dacAnimate
    mov _g_frameSyncPending, 1
    call _stepFlightModel
    call updateFrame
    cmp _g_missionEndedFlag, 0
    jz short gameMainLoop
    retn
gameMainLoop endp
; ------------------------------seg000:0x3c76------------------------------
; ------------------------------seg000:0x3c78------------------------------
TIMER_VAR_74 EQU <word ptr [_g_timerRunDivider]>
TIMER_VAR_80 EQU <word ptr [_g_timerTickCountdown]>
TIMER_VAR_70 EQU <word ptr [_g_timerElapsedLo]>
TIMER_VAR_71 EQU <word ptr [_g_timerElapsedHi]>
TIMER_CALIBRATE EQU <calibrateTimerSpeed>
TIMER_ISR_PTR EQU <timerIsrPtr>
TIMER_IRQ_ADDR EQU <timerIrqAddr>
TIMER_INSTALLED EQU <byte ptr [timerHandlerInstalled]>
INCLUDE shared/timer_setHandler.inc
INCLUDE shared/timer_restore.inc
; ------------------------------seg000:0x3cd7------------------------------
setTimerRateFromCalibration proc near
    mov bx, _g_timerMode
    mov _g_timerRunDivider, bx
    mov ax, _g_timerCalSumLo
    xor dx, dx
    div bx
    mov _g_timerCountdownTarget, ax
    mov _g_timerDividerCounter, 1
    retn
setTimerRateFromCalibration endp

setTimerRateSingle proc near
    mov _g_timerRunDivider, 1
    mov ax, _g_timerCalSumLo
    mov _g_timerCountdownTarget, ax
    mov _g_timerDividerCounter, 1
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
    mov AX, _g_timerReloadDivisor
    add _g_timerElapsedLo, AX
    adc _g_timerElapsedHi, 0
    dec _g_timerTickCountdown
    jnz short @@tisr_skip
    mov AX, _g_timerRunDivider
    mov _g_timerTickCountdown, AX
    call timerIrqCallback
    mov _g_frameSyncPending, 0
    call advanceFrameTick
@@tisr_skip:
    cmp _g_timerRunDivider, 1
    jz short @@tisr_nochain
    call far ptr audio_noiseTick
@@tisr_nochain:
    cmp _g_timerElapsedHi, 0
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
    dec _g_timerElapsedHi
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
TIMER_VAR_CALSUM_HI EQU <word ptr [_g_timerCalSumHi]>
TIMER_VAR_CALSUM_LO EQU <word ptr [_g_timerCalSumLo]>
TIMER_VAR_COUNT_HI EQU <word ptr [_g_timerElapsedHi]>
TIMER_VAR_COUNT_LO EQU <word ptr [_g_timerElapsedLo]>
TIMER_VAR_DIVIDER EQU <byte ptr [_g_timerDividerCounter]>
TIMER_VAR_DIVISOR EQU <word ptr [_g_timerReloadDivisor]>
TIMER_VAR_MODE EQU <word ptr [_g_timerMode]>
TIMER_VAR_SYNC EQU <byte ptr [_g_timerSyncToRetrace]>
TIMER_VAR_TARGET EQU <word ptr [_g_timerCountdownTarget]>
TIMER_VAR_RETRACE EQU <word ptr [_g_timerRetraceResult]>
TIMER_VAR_TICK EQU <word ptr [_g_timerTickCountdown]>
TIMER_VAR_TICKCNT EQU <word ptr [_g_timerTickCount]>
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
    inc word ptr [_g_frameTimingAccum]       ; frame-rate timing accumulator
    inc byte ptr [_g_timerTickByte]    ; frame tick counter
    call far ptr gfx_dacCycle    ; MGRAPHIC slot 0x2e: VGA DAC fire animation
    call far ptr audio_timerTick
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
EXTRN _updateThreatTargeting:NEAR
updateThreatTargeting equ _updateThreatTargeting
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
    push word ptr [BP + 6h]
    call _strlen
    add SP,2h
    or AX,AX
    jz LAB_1000_a04d
    cmp word ptr [_g_hudVisible],0h
    jnz LAB_1000_a04f
LAB_1000_a04d:
    jmp LAB_1000_a0c7
LAB_1000_a04f:
    cmp word ptr [BP + 4h],1h
    jnz LAB_1000_a066
    mov word ptr [BP + -2h],18h
    mov word ptr [BP + -6h],60h
    mov word ptr [BP + -4h],70h
    jmp LAB_1000_a075
LAB_1000_a066:
    mov word ptr [BP + -2h],78h
    mov word ptr [BP + -6h],0c7h
    mov word ptr [BP + -4h],68h
LAB_1000_a075:
    sub word ptr [BP + -4h],8h
    mov AX,8h
    push AX
    call _setDrawColor
    add SP,2h
    mov AX,word ptr [BP + -4h]
    db 05h, 04h, 00h ; add AX,4h (force imm16 encoding)
    push AX
    mov AX,word ptr [BP + -6h]
    db 2Dh, 05h, 00h ; sub AX,5h (force imm16 encoding)
    push AX
    push word ptr [BP + -4h]
    mov AX,word ptr [BP + -2h]
    db 05h, 05h, 00h ; add AX,5h (force imm16 encoding)
    push AX
    call _fillRectBoth
    add SP,8h
    mov AX,0bh
    push AX
    push word ptr [BP + -4h]
    push word ptr [BP + 6h]
    call _strlen
    add SP,2h
    shl AX,1h
    mov CX,word ptr [BP + -2h]
    add CX,word ptr [BP + -6h]
    sar CX,1h
    sub CX,AX
    push CX
    push word ptr [BP + 6h]
    call _drawStringBothPages
    add SP,8h
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
; cacheScopePanel reconstructed in C (egui.c)
; ------------------------------seg000:0xa961------------------------------
; ------------------------------seg000:0xa962------------------------------
; restoreScopePanel reconstructed in C (egui.c)
; ------------------------------seg000:0xa9bb------------------------------
; ------------------------------seg000:0xa9bc------------------------------
; captureScopePanel reconstructed in C (egui.c)
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
    mov ax, offset aFileNotFound ;":File not found$"
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
    mov ax, offset aNoFileBuffersAvailabl ;":No file buffers available$"
    jmp loc_1DF80
loc_1DE59:
    mov cx, ax
    mov ax, offset aOpenError ;":Open error $"
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
    mov DX, offset aReadError ;"Read error$"
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
    mov DX, offset aReadError ;"Read error$"
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
    mov dx, offset aWriteError ;"Write error$"
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
    mov g_exitMsgDigit, cl
    mov g_exitMsgTerm, 24h
    mov dx, offset g_exitMsgDigit
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
    mov word ptr [readFromFilePtr], ax
    mov ax, [bp+arg_0]
    mov tmpFileHandle, ax
    mov ax, [bp+arg_2]
    mov tmpPageIndex, ax
    call nullsub_1
    mov si, tmpPageIndex
    call far ptr gfx_getPageSeg
    call far ptr gfx_clearPage
    mov g_picBlitCurrentRow, 0
    mov g_picBlitBytesRemaining, 0FA00h
loc_1E0E0:
    mov di, g_picBlitCurrentRow
    call far ptr gfx_getRowOffset
    mov rowOffset, ax
    call decodePicRow
    mov di, rowOffset
    mov bp, offset picDecodedRowBuf
    mov bx, g_picBlitCurrentRow
    call far ptr gfx_fillRow
    mov di, rowOffset
    call far ptr gfx_copyRow
    inc g_picBlitCurrentRow
    sub g_picBlitBytesRemaining, 140h
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
    mov word ptr [readFromFilePtr],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [picOvlPageIndex],AX
    mov AX,word ptr [BP + 6h]
    mov ES,AX
    call far ptr gfx_clearPage
    call nullsub_1
    mov word ptr [g_picBlitCurrentRow],0h
    mov word ptr [g_picBlitBytesRemaining],0fa00h
LAB_1000_e148:
    mov DI,word ptr [g_picBlitCurrentRow]
    call far ptr gfx_getRowOffset
    mov word ptr [picOvlRowOffset],AX
    call decodePicRow
    mov DI,word ptr [picOvlRowOffset]
    mov BP,offset picDecodedRowBuf
    mov BX,word ptr [g_picBlitCurrentRow]
    call far ptr gfx_fillRow
    mov DI,word ptr [picOvlRowOffset]
    call far ptr gfx_setOvlVal2
    inc word ptr [g_picBlitCurrentRow]
    sub word ptr [g_picBlitBytesRemaining],140h
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
    mov word ptr [readFromFilePtr],AX
    mov AX,word ptr [BP + 4h]
    mov word ptr [picOvlPageIndex],AX
    mov AX,word ptr [BP + 6h]
    mov ES,AX
    call far ptr gfx_clearPage
    call nullsub_1
    mov word ptr [g_picBlitCurrentRow],0h
    mov word ptr [g_picBlitBytesRemaining],0fa00h
LAB_1000_e224:
    mov DI,word ptr [g_picBlitCurrentRow]
    call far ptr gfx_getRowOffset
    mov word ptr [picOvlRowOffset],AX
    call decodePicRow
    mov DI,word ptr [picOvlRowOffset]
    mov BP,offset picDecodedRowBuf
    mov BX,word ptr [g_picBlitCurrentRow]
    call far ptr gfx_getPageSeg
    mov DI,word ptr [picOvlRowOffset]
    call far ptr gfx_setOvlVal1
    inc word ptr [g_picBlitCurrentRow]
    sub word ptr [g_picBlitBytesRemaining],140h
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
picRowLength EQU <lzw_rowLength>
picReadBufEndPtr EQU <lzw_readBufEndPtr>
picWorkData EQU <_picWorkData>
picWorkDataPtr EQU <lzw_workDataPtr>
picProcessFlag EQU <lzw_processFlag>
picLookupResult EQU <g_picLookupResult>
picFileWord EQU <g_picFileWord>
picRemainingBitCount EQU <lzw_bitsLeft>
picByteUnsignedFlag EQU <g_picByteUnsignedFlag>
picByte EQU <g_picByte>
picTmp9BitCount EQU <lzw_bitWidth>
picFileReadBufEnd EQU <lzw_maxCode>
picNumberDictSlots EQU <g_picNumberDictSlots>
picDecodeDictionary EQU <word_3424C>
picDecodeIncrement EQU <word_3424E>
picReadFromFilePtr EQU <readFromFilePtr>
picSlotCounter EQU <lzw_slotCounter>
picDictionaryIndex EQU <lzw_dictIndex>
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
