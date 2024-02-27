;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Linux)
;--------------------------------------------------------
	.module led_matrix
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SetLedState
	.globl _GetLedState
	.globl _SetLedRaw
	.globl _UpdateLedState
	.globl _LedsInit
	.globl _led_ticks
	.globl _LedMatrixInit
	.globl _SetLedMode
	.globl _UpdateLeds
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_led_ticks::
	.ds 48
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	../src/led_matrix.c: 52: void LedMatrixInit( void ){
;	-----------------------------------------
;	 function LedMatrixInit
;	-----------------------------------------
_LedMatrixInit:
;	../src/led_matrix.c: 54: LedsInit();
;	../src/led_matrix.c: 55: }
	jp	_LedsInit
;	../src/led_matrix.c: 71: void SetLedMode(uint8_t ledID, enum led_mode_t mode)
;	-----------------------------------------
;	 function SetLedMode
;	-----------------------------------------
_SetLedMode:
	sub	sp, #9
;	../src/led_matrix.c: 75: if(mode >= LED_MODE_MAX) return;
	ld	a, (0x0d, sp)
	cp	a, #0x04
	jrc	00102$
	jp	00113$
00102$:
;	../src/led_matrix.c: 76: if(ledID >= NUM_OF_LEDS) return;
	ld	a, (0x0c, sp)
	cp	a, #0x0c
	jrc	00104$
	jp	00113$
00104$:
;	../src/led_matrix.c: 78: switch(mode){
	ld	a, (0x0d, sp)
	cp	a, #0x00
	jreq	00106$
	ld	a, (0x0d, sp)
	dec	a
	jreq	00107$
	ld	a, (0x0d, sp)
	cp	a, #0x02
	jreq	00111$
	ld	a, (0x0d, sp)
	cp	a, #0x03
	jreq	00172$
	jp	00113$
00172$:
;	../src/led_matrix.c: 80: case LED_OFF: led_ticks[ledID] = 0; SetLedRaw(ledID, mode);break;
00106$:
	clrw	x
	ld	a, (0x0c, sp)
	ld	xl, a
	sllw	x
	sllw	x
	addw	x, #(_led_ticks+0)
	clrw	y
	ldw	(0x2, x), y
	ldw	(x), y
	ld	a, (0x0d, sp)
	push	a
	ld	a, (0x0d, sp)
	push	a
	call	_SetLedRaw
	popw	x
	jp	00113$
;	../src/led_matrix.c: 81: case LED_TOGGLE_SLOW: 
00107$:
;	../src/led_matrix.c: 82: nxtTick = sysTick + LED_TOGGLE_SLOW_TICK;
	ldw	x, _sysTick+2
	addw	x, #0x03e8
	ldw	y, _sysTick+0
	jrnc	00173$
	incw	y
00173$:
	ldw	(0x08, sp), x
	ldw	(0x06, sp), y
;	../src/led_matrix.c: 83: if(nxtTick) nxtTick = 2;
	ldw	x, (0x08, sp)
	jrne	00174$
	ldw	x, (0x06, sp)
	jreq	00109$
00174$:
	ldw	x, #0x0002
	ldw	(0x08, sp), x
	clrw	x
	ldw	(0x06, sp), x
	jra	00110$
00109$:
;	../src/led_matrix.c: 84: else nxtTick = (nxtTick%2)?(nxtTick+1):nxtTick;
	ld	a, (0x09, sp)
	srl	a
	jrnc	00115$
	ldw	x, (0x08, sp)
	addw	x, #0x0001
	ldw	y, (0x06, sp)
	jrnc	00176$
	incw	y
00176$:
	ldw	(0x08, sp), x
	ldw	(0x06, sp), y
00115$:
00110$:
;	../src/led_matrix.c: 85: led_ticks[ledID] = nxtTick;break;
	clrw	x
	ld	a, (0x0c, sp)
	ld	xl, a
	sllw	x
	sllw	x
	addw	x, #(_led_ticks+0)
	ldw	y, (0x08, sp)
	ldw	(0x2, x), y
	ldw	y, (0x06, sp)
	ldw	(x), y
	jra	00113$
;	../src/led_matrix.c: 86: case LED_TOGGLE_FAST: 
00111$:
;	../src/led_matrix.c: 87: nxtTick = sysTick + LED_TOGGLE_FAST_TICK;
	ldw	x, _sysTick+2
	addw	x, #0x012c
	ldw	y, _sysTick+0
	jrnc	00177$
	incw	y
00177$:
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	../src/led_matrix.c: 88: nxtTick = (nxtTick%2)?nxtTick:(nxtTick+1);
	ld	a, (0x04, sp)
	srl	a
	jrnc	00117$
	ldw	y, (0x03, sp)
	ldw	(0x08, sp), y
	ldw	y, (0x01, sp)
	ldw	(0x06, sp), y
	jra	00118$
00117$:
	ldw	x, (0x03, sp)
	addw	x, #0x0001
	ldw	(0x08, sp), x
	ldw	x, (0x01, sp)
	jrnc	00179$
	incw	x
00179$:
	ldw	(0x06, sp), x
00118$:
	ldw	y, (0x08, sp)
;	../src/led_matrix.c: 89: led_ticks[ledID] = nxtTick;break;
	clrw	x
	ld	a, (0x0c, sp)
	ld	xl, a
	sllw	x
	sllw	x
	addw	x, #(_led_ticks+0)
	ldw	(0x2, x), y
	ldw	y, (0x06, sp)
	ldw	(x), y
;	../src/led_matrix.c: 90: }
00113$:
;	../src/led_matrix.c: 91: }
	addw	sp, #9
	ret
;	../src/led_matrix.c: 95: void UpdateLeds()
;	-----------------------------------------
;	 function UpdateLeds
;	-----------------------------------------
_UpdateLeds:
	sub	sp, #7
;	../src/led_matrix.c: 100: for(idx = 0; idx < NUM_OF_LEDS; idx++){
	clr	(0x07, sp)
00105$:
;	../src/led_matrix.c: 101: tick = led_ticks[idx];
	clrw	x
	ld	a, (0x07, sp)
	ld	xl, a
	sllw	x
	sllw	x
	addw	x, #(_led_ticks+0)
	ldw	(0x01, sp), x
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	ldw	(0x05, sp), y
	ldw	(0x03, sp), x
;	../src/led_matrix.c: 102: if((tick != 0) && (sysTick == tick)){
	ldw	x, (0x05, sp)
	jrne	00137$
	ldw	x, (0x03, sp)
	jreq	00106$
00137$:
	ldw	x, (0x05, sp)
	cpw	x, _sysTick+2
	jrne	00106$
	ldw	x, (0x03, sp)
	cpw	x, _sysTick+0
	jrne	00106$
;	../src/led_matrix.c: 103: led_ticks[idx] = ((tick%2)?LED_TOGGLE_FAST_TICK:LED_TOGGLE_SLOW_TICK);
	ld	a, (0x06, sp)
	srl	a
	jrnc	00109$
	ldw	x, #0x012c
	ldw	(0x05, sp), x
	jra	00110$
00109$:
	ldw	x, #0x03e8
	ldw	(0x05, sp), x
00110$:
	ldw	y, (0x05, sp)
	ld	a, yh
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x04, sp), a
	ld	(0x03, sp), a
	ldw	x, (0x01, sp)
	ldw	(0x2, x), y
	ldw	y, (0x03, sp)
	ldw	(x), y
;	../src/led_matrix.c: 104: SetLedState(idx, ~GetLedState(idx));
	ld	a, (0x07, sp)
	push	a
	call	_GetLedState
	addw	sp, #1
	cpl	a
	push	a
	ld	a, (0x08, sp)
	push	a
	call	_SetLedState
	popw	x
00106$:
;	../src/led_matrix.c: 100: for(idx = 0; idx < NUM_OF_LEDS; idx++){
	inc	(0x07, sp)
	ld	a, (0x07, sp)
	cp	a, #0x0c
	jrc	00105$
;	../src/led_matrix.c: 108: UpdateLedState();
	addw	sp, #7
;	../src/led_matrix.c: 109: }
	jp	_UpdateLedState
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
