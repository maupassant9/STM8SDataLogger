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
	jp	00115$
00102$:
;	../src/led_matrix.c: 76: if(ledID >= NUM_OF_LEDS) return;
	ld	a, (0x0c, sp)
	cp	a, #0x0c
	jrc	00104$
	jp	00115$
00104$:
;	../src/led_matrix.c: 77: if(GetLedMode(ledID) == mode) return;
	ld	a, (0x0c, sp)
	push	a
	call	_GetLedMode
	pop	a
	ld	a, (0x0d, sp)
	ld	(0x09, sp), a
	clr	(0x08, sp)
	cpw	x, (0x08, sp)
	jrne	00106$
	jp	00115$
00106$:
;	../src/led_matrix.c: 79: switch(mode){
	ld	a, (0x0d, sp)
	cp	a, #0x00
	jreq	00108$
	ld	a, (0x0d, sp)
	dec	a
	jreq	00109$
	ld	a, (0x0d, sp)
	cp	a, #0x02
	jreq	00113$
	ld	a, (0x0d, sp)
	cp	a, #0x03
	jreq	00182$
	jp	00115$
00182$:
;	../src/led_matrix.c: 81: case LED_OFF: led_ticks[ledID] = 0; SetLedState(ledID, mode);break;
00108$:
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
	call	_SetLedState
	popw	x
	jp	00115$
;	../src/led_matrix.c: 82: case LED_TOGGLE_SLOW: //even number is slow
00109$:
;	../src/led_matrix.c: 83: nxtTick = sysTick + LED_TOGGLE_SLOW_TICK;
	ldw	x, _sysTick+2
	addw	x, #0x03e8
	ldw	y, _sysTick+0
	jrnc	00183$
	incw	y
00183$:
	ldw	(0x08, sp), x
	ldw	(0x06, sp), y
;	../src/led_matrix.c: 84: if(nxtTick) nxtTick = 2;
	ldw	x, (0x08, sp)
	jrne	00184$
	ldw	x, (0x06, sp)
	jreq	00111$
00184$:
	ldw	x, #0x0002
	ldw	(0x08, sp), x
	clrw	x
	ldw	(0x06, sp), x
	jra	00112$
00111$:
;	../src/led_matrix.c: 85: else nxtTick = (nxtTick%2)?(nxtTick+1):nxtTick;
	ld	a, (0x09, sp)
	srl	a
	jrnc	00117$
	ldw	x, (0x08, sp)
	addw	x, #0x0001
	ldw	y, (0x06, sp)
	jrnc	00186$
	incw	y
00186$:
	ldw	(0x08, sp), x
	ldw	(0x06, sp), y
00117$:
00112$:
;	../src/led_matrix.c: 86: led_ticks[ledID] = nxtTick;break;
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
	jra	00115$
;	../src/led_matrix.c: 87: case LED_TOGGLE_FAST: //odd number is fast
00113$:
;	../src/led_matrix.c: 88: nxtTick = sysTick + LED_TOGGLE_FAST_TICK;
	ldw	x, _sysTick+2
	addw	x, #0x0064
	ldw	y, _sysTick+0
	jrnc	00187$
	incw	y
00187$:
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	../src/led_matrix.c: 89: nxtTick = (nxtTick%2)?nxtTick:(nxtTick+1);
	ld	a, (0x04, sp)
	srl	a
	jrnc	00119$
	ldw	y, (0x03, sp)
	ldw	(0x08, sp), y
	ldw	y, (0x01, sp)
	ldw	(0x06, sp), y
	jra	00120$
00119$:
	ldw	x, (0x03, sp)
	addw	x, #0x0001
	ldw	(0x08, sp), x
	ldw	x, (0x01, sp)
	jrnc	00189$
	incw	x
00189$:
	ldw	(0x06, sp), x
00120$:
	ldw	y, (0x08, sp)
;	../src/led_matrix.c: 90: led_ticks[ledID] = nxtTick;break;
	clrw	x
	ld	a, (0x0c, sp)
	ld	xl, a
	sllw	x
	sllw	x
	addw	x, #(_led_ticks+0)
	ldw	(0x2, x), y
	ldw	y, (0x06, sp)
	ldw	(x), y
;	../src/led_matrix.c: 91: }
00115$:
;	../src/led_matrix.c: 92: }
	addw	sp, #9
	ret
;	../src/led_matrix.c: 94: static enum let_mode_t GetLedMode(uint8_t ledID)
;	-----------------------------------------
;	 function GetLedMode
;	-----------------------------------------
_GetLedMode:
	sub	sp, #8
;	../src/led_matrix.c: 96: uint32_t tick = led_ticks[ledID];
	clrw	x
	ld	a, (0x0b, sp)
	ld	xl, a
	sllw	x
	sllw	x
	addw	x, #(_led_ticks+0)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	(0x03, sp), y
	ldw	x, (x)
	ldw	(0x01, sp), x
	ldw	y, (0x03, sp)
	ldw	(0x07, sp), y
	ldw	y, (0x01, sp)
	ldw	(0x05, sp), y
;	../src/led_matrix.c: 98: if(0 == tick) return GetLedState(ledID)?LED_ON:LED_OFF;
	ldw	x, (0x03, sp)
	jrne	00102$
	ldw	x, (0x01, sp)
	jrne	00102$
	ld	a, (0x0b, sp)
	push	a
	call	_GetLedState
	addw	sp, #1
	ld	(0x08, sp), a
	jreq	00107$
	ldw	x, #0x0003
	ldw	(0x07, sp), x
	.byte 0xbc
00107$:
	clrw	x
	ldw	(0x07, sp), x
00108$:
	ldw	x, (0x07, sp)
	jra	00105$
00102$:
;	../src/led_matrix.c: 99: if(tick % 2) return LED_TOGGLE_FAST;
	ld	a, (0x08, sp)
	srl	a
	jrnc	00104$
	ldw	x, #0x0002
;	../src/led_matrix.c: 100: return LED_TOGGLE_SLOW; 
	.byte 0xc5
00104$:
	clrw	x
	incw	x
00105$:
;	../src/led_matrix.c: 101: }
	addw	sp, #8
	ret
;	../src/led_matrix.c: 105: void UpdateLeds()
;	-----------------------------------------
;	 function UpdateLeds
;	-----------------------------------------
_UpdateLeds:
	sub	sp, #11
;	../src/led_matrix.c: 110: for(idx = 0; idx < NUM_OF_LEDS; idx++){
	clr	(0x0b, sp)
00105$:
;	../src/led_matrix.c: 111: tick = led_ticks[idx];
	clrw	x
	ld	a, (0x0b, sp)
	ld	xl, a
	sllw	x
	sllw	x
	addw	x, #(_led_ticks+0)
	ldw	(0x05, sp), x
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	(0x09, sp), y
	ldw	x, (x)
	ldw	(0x07, sp), x
	ldw	y, (0x09, sp)
	ldw	(0x03, sp), y
	ldw	y, (0x07, sp)
	ldw	(0x01, sp), y
;	../src/led_matrix.c: 112: if((tick != 0) && (sysTick == tick)){
	ldw	x, (0x03, sp)
	jrne	00137$
	ldw	x, (0x01, sp)
	jreq	00106$
00137$:
	ldw	x, (0x03, sp)
	cpw	x, _sysTick+2
	jrne	00106$
	ldw	x, (0x01, sp)
	cpw	x, _sysTick+0
	jrne	00106$
;	../src/led_matrix.c: 113: led_ticks[idx] += ((tick%2)?LED_TOGGLE_FAST_TICK:LED_TOGGLE_SLOW_TICK);
	ld	a, (0x04, sp)
	srl	a
	jrnc	00109$
	ldw	x, #0x0064
	ldw	(0x03, sp), x
	jra	00110$
00109$:
	ldw	x, #0x03e8
	ldw	(0x03, sp), x
00110$:
	ldw	y, (0x03, sp)
	clrw	x
	tnzw	y
	jrpl	00142$
	decw	x
00142$:
	addw	y, (0x09, sp)
	ld	a, xl
	adc	a, (0x08, sp)
	ld	(0x02, sp), a
	ld	a, xh
	adc	a, (0x07, sp)
	ld	(0x01, sp), a
	ldw	x, (0x05, sp)
	ldw	(0x2, x), y
	ldw	y, (0x01, sp)
	ldw	(x), y
;	../src/led_matrix.c: 114: SetLedState(idx, !GetLedState(idx));
	ld	a, (0x0b, sp)
	push	a
	call	_GetLedState
	addw	sp, #1
	sub	a, #0x01
	clr	a
	rlc	a
	push	a
	ld	a, (0x0c, sp)
	push	a
	call	_SetLedState
	popw	x
00106$:
;	../src/led_matrix.c: 110: for(idx = 0; idx < NUM_OF_LEDS; idx++){
	inc	(0x0b, sp)
	ld	a, (0x0b, sp)
	cp	a, #0x0c
	jrnc	00143$
	jp	00105$
00143$:
;	../src/led_matrix.c: 118: UpdateLedState();
	addw	sp, #11
;	../src/led_matrix.c: 119: }
	jp	_UpdateLedState
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
