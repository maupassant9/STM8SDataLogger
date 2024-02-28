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
G$led_ticks$0_0$0==.
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
	G$LedMatrixInit$0$0 ==.
	C$led_matrix.c$52$0_0$320 ==.
;	../src/led_matrix.c: 52: void LedMatrixInit( void ){
; genLabel
;	-----------------------------------------
;	 function LedMatrixInit
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_LedMatrixInit:
	C$led_matrix.c$54$1_0$320 ==.
;	../src/led_matrix.c: 54: LedsInit();
; genCall
	jp	_LedsInit
; genLabel
00101$:
	C$led_matrix.c$55$1_0$320 ==.
;	../src/led_matrix.c: 55: }
; genEndFunction
	C$led_matrix.c$55$1_0$320 ==.
	XG$LedMatrixInit$0$0 ==.
	ret
	G$SetLedMode$0$0 ==.
	C$led_matrix.c$71$1_0$322 ==.
;	../src/led_matrix.c: 71: void SetLedMode(uint8_t ledID, enum led_mode_t mode)
; genLabel
;	-----------------------------------------
;	 function SetLedMode
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 9 bytes.
_SetLedMode:
	sub	sp, #9
	C$led_matrix.c$75$1_0$322 ==.
;	../src/led_matrix.c: 75: if(mode >= LED_MODE_MAX) return;
; genCmp
; genCmpTop
	ld	a, (0x0d, sp)
	cp	a, #0x04
	jrnc	00159$
	jp	00102$
00159$:
; skipping generated iCode
; genReturn
	jp	00113$
; genLabel
00102$:
	C$led_matrix.c$76$1_0$322 ==.
;	../src/led_matrix.c: 76: if(ledID >= NUM_OF_LEDS) return;
; genCmp
; genCmpTop
	ld	a, (0x0c, sp)
	cp	a, #0x0c
	jrnc	00160$
	jp	00104$
00160$:
; skipping generated iCode
; genReturn
	jp	00113$
; genLabel
00104$:
	C$led_matrix.c$78$1_0$322 ==.
;	../src/led_matrix.c: 78: switch(mode){
; genCmpEQorNE
	ld	a, (0x0d, sp)
	cp	a, #0x00
	jrne	00162$
	jp	00106$
00162$:
; skipping generated iCode
; genCmpEQorNE
	ld	a, (0x0d, sp)
	dec	a
	jrne	00165$
	jp	00107$
00165$:
; skipping generated iCode
; genCmpEQorNE
	ld	a, (0x0d, sp)
	cp	a, #0x02
	jrne	00168$
	jp	00111$
00168$:
; skipping generated iCode
; genCmpEQorNE
	ld	a, (0x0d, sp)
	cp	a, #0x03
	jrne	00171$
	jp	00172$
00171$:
	jp	00113$
00172$:
; skipping generated iCode
	C$led_matrix.c$80$2_0$323 ==.
;	../src/led_matrix.c: 80: case LED_OFF: led_ticks[ledID] = 0; SetLedState(ledID, mode);break;
; genLabel
00106$:
; skipping iCode since result will be rematerialized
; genMult
; genMultLit
	clrw	x
	ld	a, (0x0c, sp)
	ld	xl, a
	sllw	x
	sllw	x
; genPlus
	addw	x, #(_led_ticks+0)
; genPointerSet
	clrw	y
	ldw	(0x2, x), y
	ldw	(x), y
; genIPush
	ld	a, (0x0d, sp)
	push	a
; genIPush
	ld	a, (0x0d, sp)
	push	a
; genCall
	call	_SetLedState
	popw	x
; genGoto
	jp	00113$
	C$led_matrix.c$81$2_0$323 ==.
;	../src/led_matrix.c: 81: case LED_TOGGLE_SLOW: //even number is slow
; genLabel
00107$:
	C$led_matrix.c$82$2_0$323 ==.
;	../src/led_matrix.c: 82: nxtTick = sysTick + LED_TOGGLE_SLOW_TICK;
; genPlus
	ldw	x, _sysTick+2
	addw	x, #0x03e8
	ldw	y, _sysTick+0
	jrnc	00173$
	incw	y
00173$:
; genAssign
	ldw	(0x08, sp), x
	ldw	(0x06, sp), y
	C$led_matrix.c$83$2_0$323 ==.
;	../src/led_matrix.c: 83: if(nxtTick) nxtTick = 2;
; genIfx
	ldw	x, (0x08, sp)
	jrne	00174$
	ldw	x, (0x06, sp)
	jrne	00174$
	jp	00109$
00174$:
; genAssign
	ldw	x, #0x0002
	ldw	(0x08, sp), x
	clrw	x
	ldw	(0x06, sp), x
; genGoto
	jp	00110$
; genLabel
00109$:
	C$led_matrix.c$84$2_0$323 ==.
;	../src/led_matrix.c: 84: else nxtTick = (nxtTick%2)?(nxtTick+1):nxtTick;
; genAnd
	ld	a, (0x09, sp)
	srl	a
	jrc	00175$
	jp	00115$
00175$:
; skipping generated iCode
; genPlus
	ldw	x, (0x08, sp)
	addw	x, #0x0001
	ldw	y, (0x06, sp)
	jrnc	00176$
	incw	y
00176$:
; genAssign
	ldw	(0x08, sp), x
	ldw	(0x06, sp), y
; genGoto
	jp	00116$
; genLabel
00115$:
; genAssign
; genLabel
00116$:
; genAssign
; genLabel
00110$:
	C$led_matrix.c$85$2_0$323 ==.
;	../src/led_matrix.c: 85: led_ticks[ledID] = nxtTick;break;
; skipping iCode since result will be rematerialized
; genMult
; genMultLit
	clrw	x
	ld	a, (0x0c, sp)
	ld	xl, a
	sllw	x
	sllw	x
; genPlus
	addw	x, #(_led_ticks+0)
; genPointerSet
	ldw	y, (0x08, sp)
	ldw	(0x2, x), y
	ldw	y, (0x06, sp)
	ldw	(x), y
; genGoto
	jp	00113$
	C$led_matrix.c$86$2_0$323 ==.
;	../src/led_matrix.c: 86: case LED_TOGGLE_FAST: //odd number is fast
; genLabel
00111$:
	C$led_matrix.c$87$2_0$323 ==.
;	../src/led_matrix.c: 87: nxtTick = sysTick + LED_TOGGLE_FAST_TICK;
; genPlus
	ldw	x, _sysTick+2
	addw	x, #0x012c
	ldw	y, _sysTick+0
	jrnc	00177$
	incw	y
00177$:
; genAssign
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
	C$led_matrix.c$88$2_0$323 ==.
;	../src/led_matrix.c: 88: nxtTick = (nxtTick%2)?nxtTick:(nxtTick+1);
; genAnd
	ld	a, (0x04, sp)
	srl	a
	jrc	00178$
	jp	00117$
00178$:
; skipping generated iCode
; genAssign
	ldw	y, (0x03, sp)
	ldw	(0x08, sp), y
	ldw	y, (0x01, sp)
	ldw	(0x06, sp), y
; genGoto
	jp	00118$
; genLabel
00117$:
; genPlus
	ldw	x, (0x03, sp)
	addw	x, #0x0001
	ldw	(0x08, sp), x
	ldw	x, (0x01, sp)
	jrnc	00179$
	incw	x
00179$:
; genAssign
	ldw	(0x06, sp), x
; genLabel
00118$:
; genAssign
	ldw	y, (0x08, sp)
	C$led_matrix.c$89$2_0$323 ==.
;	../src/led_matrix.c: 89: led_ticks[ledID] = nxtTick;break;
; skipping iCode since result will be rematerialized
; genMult
; genMultLit
	clrw	x
	ld	a, (0x0c, sp)
	ld	xl, a
	sllw	x
	sllw	x
; genPlus
	addw	x, #(_led_ticks+0)
; genPointerSet
	ldw	(0x2, x), y
	ldw	y, (0x06, sp)
	ldw	(x), y
	C$led_matrix.c$90$1_0$322 ==.
;	../src/led_matrix.c: 90: }
; genLabel
00113$:
	C$led_matrix.c$91$1_0$322 ==.
;	../src/led_matrix.c: 91: }
; genEndFunction
	addw	sp, #9
	C$led_matrix.c$91$1_0$322 ==.
	XG$SetLedMode$0$0 ==.
	ret
	G$UpdateLeds$0$0 ==.
	C$led_matrix.c$95$1_0$324 ==.
;	../src/led_matrix.c: 95: void UpdateLeds()
; genLabel
;	-----------------------------------------
;	 function UpdateLeds
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 15 bytes.
_UpdateLeds:
	sub	sp, #15
	C$led_matrix.c$100$2_0$325 ==.
;	../src/led_matrix.c: 100: for(idx = 0; idx < NUM_OF_LEDS; idx++){
; genAssign
	clr	(0x0f, sp)
; skipping iCode since result will be rematerialized
; genLabel
00105$:
	C$led_matrix.c$101$3_0$326 ==.
;	../src/led_matrix.c: 101: tick = led_ticks[idx];
; genMult
; genMultLit
	clrw	x
	ld	a, (0x0f, sp)
	ld	xl, a
	sllw	x
	sllw	x
; genPlus
	addw	x, #(_led_ticks+0)
; genPointerGet
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
; genAssign
	ldw	(0x0d, sp), y
	ldw	(0x0b, sp), x
	C$led_matrix.c$102$3_0$326 ==.
;	../src/led_matrix.c: 102: if((tick != 0) && (sysTick == tick)){
; genIfx
	ldw	x, (0x0d, sp)
	jrne	00137$
	ldw	x, (0x0b, sp)
	jrne	00137$
	jp	00106$
00137$:
; genCmpEQorNE
	ldw	x, (0x0d, sp)
	cpw	x, _sysTick+2
	jrne	00139$
	ldw	x, (0x0b, sp)
	cpw	x, _sysTick+0
	jrne	00139$
	jp	00140$
00139$:
	jp	00106$
00140$:
; skipping generated iCode
	C$led_matrix.c$103$4_0$327 ==.
;	../src/led_matrix.c: 103: led_ticks[idx] += ((tick%2)?LED_TOGGLE_FAST_TICK:LED_TOGGLE_SLOW_TICK);
; genMult
; genMultLit
	clrw	x
	ld	a, (0x0f, sp)
	ld	xl, a
	sllw	x
	sllw	x
; genPlus
	addw	x, #(_led_ticks+0)
	ldw	(0x01, sp), x
; genPointerGet
	ldw	x, (0x01, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	(0x05, sp), y
	ldw	x, (x)
	ldw	(0x03, sp), x
; genAnd
	ld	a, (0x0e, sp)
	srl	a
	jrc	00141$
	jp	00109$
00141$:
; skipping generated iCode
; genAssign
	ldw	x, #0x012c
	ldw	(0x0d, sp), x
; genGoto
	jp	00110$
; genLabel
00109$:
; genAssign
	ldw	x, #0x03e8
	ldw	(0x0d, sp), x
; genLabel
00110$:
; genCast
	ldw	y, (0x0d, sp)
	ldw	(0x09, sp), y
	ld	a, (0x09, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x08, sp), a
	ld	(0x07, sp), a
; genPlus
	ldw	x, (0x05, sp)
	addw	x, (0x09, sp)
	ldw	(0x0d, sp), x
	ld	a, (0x04, sp)
	adc	a, (0x08, sp)
	ld	(0x0c, sp), a
	ld	a, (0x03, sp)
	adc	a, (0x07, sp)
	ld	(0x0b, sp), a
; genPointerSet
	ldw	x, (0x01, sp)
	ldw	y, (0x0d, sp)
	ldw	(0x2, x), y
	ldw	y, (0x0b, sp)
	ldw	(x), y
	C$led_matrix.c$104$4_0$327 ==.
;	../src/led_matrix.c: 104: SetLedState(idx, !GetLedState(idx));
; genIPush
	ld	a, (0x0f, sp)
	push	a
; genCall
	call	_GetLedState
	addw	sp, #1
; genNot
	sub	a, #0x01
	clr	a
	rlc	a
; genCast
; genAssign
; genIPush
	push	a
; genIPush
	ld	a, (0x10, sp)
	push	a
; genCall
	call	_SetLedState
	popw	x
; genLabel
00106$:
	C$led_matrix.c$100$2_0$325 ==.
;	../src/led_matrix.c: 100: for(idx = 0; idx < NUM_OF_LEDS; idx++){
; genPlus
	inc	(0x0f, sp)
; genCmp
; genCmpTop
	ld	a, (0x0f, sp)
	cp	a, #0x0c
	jrnc	00142$
	jp	00105$
00142$:
; skipping generated iCode
	C$led_matrix.c$108$1_0$324 ==.
;	../src/led_matrix.c: 108: UpdateLedState();
; genCall
	addw	sp, #15
	jp	_UpdateLedState
; genLabel
00107$:
	C$led_matrix.c$109$1_0$324 ==.
;	../src/led_matrix.c: 109: }
; genEndFunction
	addw	sp, #15
	C$led_matrix.c$109$1_0$324 ==.
	XG$UpdateLeds$0$0 ==.
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
