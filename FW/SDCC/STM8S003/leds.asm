;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Linux)
;--------------------------------------------------------
	.module leds
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _leds_cathode
	.globl _leds_anode
	.globl _LedsInit
	.globl _UpdateLedState
	.globl _SetLedRaw
	.globl _GetLedState
	.globl _SetLedState
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
Fleds$ledsState$0_0$0==.
_ledsState:
	.ds 2
Lleds.UpdateLedState$ledId$1_0$325==.
_UpdateLedState_ledId_65536_325:
	.ds 1
Lleds.UpdateLedState$ledIdPrev$1_0$325==.
_UpdateLedState_ledIdPrev_65536_325:
	.ds 1
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
	G$UpdateLedState$0$0 ==.
	C$leds.c$97$1_0$325 ==.
;	../src/leds.c: 97: static uint8_t ledId = 0;
; genAssign
	clr	_UpdateLedState_ledId_65536_325+0
	C$leds.c$98$1_0$325 ==.
;	../src/leds.c: 98: static uint8_t ledIdPrev = NUM_OF_LEDS-1;
; genAssign
	mov	_UpdateLedState_ledIdPrev_65536_325+0, #0x0b
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
	G$LedsInit$0$0 ==.
	C$leds.c$55$0_0$319 ==.
;	../src/leds.c: 55: void LedsInit( void )
; genLabel
;	-----------------------------------------
;	 function LedsInit
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_LedsInit:
	C$leds.c$57$1_0$319 ==.
;	../src/leds.c: 57: ledsState = 0x00;
; genAssign
	clrw	x
	ldw	_ledsState+0, x
	C$leds.c$58$1_0$319 ==.
;	../src/leds.c: 58: GpioInit();
; genCall
	jp	_GpioInit
; genLabel
00101$:
	C$leds.c$59$1_0$319 ==.
;	../src/leds.c: 59: }
; genEndFunction
	C$leds.c$59$1_0$319 ==.
	XG$LedsInit$0$0 ==.
	ret
	Fleds$GpioInit$0$0 ==.
	C$leds.c$72$1_0$322 ==.
;	../src/leds.c: 72: static void GpioInit( void ){
; genLabel
;	-----------------------------------------
;	 function GpioInit
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_GpioInit:
	C$leds.c$75$2_0$322 ==.
;	../src/leds.c: 75: for(idx = 0; idx < NUM_OF_LEDS; idx++){
; genAssign
	clr	a
; genLabel
00102$:
	C$leds.c$76$3_0$323 ==.
;	../src/leds.c: 76: SetLedRaw(idx, LED_OFF_STATE);
; genIPush
	push	a
	push	#0x00
; genIPush
	push	a
; genCall
	call	_SetLedRaw
	popw	x
	pop	a
	C$leds.c$75$2_0$322 ==.
;	../src/leds.c: 75: for(idx = 0; idx < NUM_OF_LEDS; idx++){
; genPlus
	inc	a
; genCmp
; genCmpTop
	cp	a, #0x0c
	jrnc	00112$
	jp	00102$
00112$:
; skipping generated iCode
; genLabel
00104$:
	C$leds.c$78$2_0$322 ==.
;	../src/leds.c: 78: }
; genEndFunction
	C$leds.c$78$2_0$322 ==.
	XFleds$GpioInit$0$0 ==.
	ret
	G$UpdateLedState$0$0 ==.
	C$leds.c$95$2_0$325 ==.
;	../src/leds.c: 95: void UpdateLedState( void )
; genLabel
;	-----------------------------------------
;	 function UpdateLedState
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_UpdateLedState:
	C$leds.c$101$1_0$325 ==.
;	../src/leds.c: 101: ledId = (ledId == NUM_OF_LEDS-1)?0:(ledId+1);
; genCmpEQorNE
	ld	a, _UpdateLedState_ledId_65536_325+0
	cp	a, #0x0b
	jrne	00111$
	jp	00112$
00111$:
	jp	00103$
00112$:
; skipping generated iCode
; genAssign
	clr	a
	clrw	x
; genGoto
	jp	00104$
; genLabel
00103$:
; genCast
; genAssign
	ld	a, _UpdateLedState_ledId_65536_325+0
; genPlus
	inc	a
; genCast
	push	a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xl, a
	pop	a
; genAssign
; genLabel
00104$:
; genCast
; genAssign
	ld	_UpdateLedState_ledId_65536_325+0, a
	C$leds.c$103$1_0$325 ==.
;	../src/leds.c: 103: SetLedRaw(ledIdPrev, LED_OFF_STATE);
; genIPush
	push	#0x00
; genIPush
	push	_UpdateLedState_ledIdPrev_65536_325+0
; genCall
	call	_SetLedRaw
	popw	x
	C$leds.c$104$1_0$325 ==.
;	../src/leds.c: 104: SetLedRaw(ledId,GetLedState(ledId));
; genIPush
	push	_UpdateLedState_ledId_65536_325+0
; genCall
	call	_GetLedState
	addw	sp, #1
; genIPush
	push	a
; genIPush
	push	_UpdateLedState_ledId_65536_325+0
; genCall
	call	_SetLedRaw
	popw	x
	C$leds.c$105$1_0$325 ==.
;	../src/leds.c: 105: ledIdPrev = ledId; 
; genAssign
	mov	_UpdateLedState_ledIdPrev_65536_325+0, _UpdateLedState_ledId_65536_325+0
; genLabel
00101$:
	C$leds.c$106$1_0$325 ==.
;	../src/leds.c: 106: }
; genEndFunction
	C$leds.c$106$1_0$325 ==.
	XG$UpdateLedState$0$0 ==.
	ret
	G$SetLedRaw$0$0 ==.
	C$leds.c$126$1_0$327 ==.
;	../src/leds.c: 126: void SetLedRaw(uint8_t ledId, uint8_t state){
; genLabel
;	-----------------------------------------
;	 function SetLedRaw
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 14 bytes.
_SetLedRaw:
	sub	sp, #14
	C$leds.c$128$1_0$327 ==.
;	../src/leds.c: 128: if(ledId >= NUM_OF_LEDS) return;
; genCmp
; genCmpTop
	ld	a, (0x11, sp)
	cp	a, #0x0c
	jrnc	00118$
	jp	00102$
00118$:
; skipping generated iCode
; genReturn
	jp	00106$
; genLabel
00102$:
	C$leds.c$129$1_0$327 ==.
;	../src/leds.c: 129: ledId = ledId << 1;
; genCast
; genAssign
	ld	a, (0x11, sp)
; genLeftShiftLiteral
	sll	a
	ld	(0x11, sp), a
	C$leds.c$131$1_1$328 ==.
;	../src/leds.c: 131: GPIO_TypeDef * gpioPortPos = (GPIO_TypeDef * )leds_anode[ledId];
; skipping iCode since result will be rematerialized
; genCast
; genAssign
	clrw	x
	ld	a, (0x11, sp)
	ld	xl, a
; genLeftShiftLiteral
	sllw	x
	exgw	x, y
; genPlus
	ldw	x, y
	addw	x, #(_leds_anode+0)
; genPointerGet
	ldw	x, (x)
; genCast
; genAssign
; genAssign
	ldw	(0x02, sp), x
	C$leds.c$132$1_1$328 ==.
;	../src/leds.c: 132: GPIO_TypeDef * gpioPortNeg = (GPIO_TypeDef *) leds_cathode[ledId];
; skipping iCode since result will be rematerialized
; genPlus
	ldw	x, y
	addw	x, #(_leds_cathode+0)
; genPointerGet
	ldw	x, (x)
; genCast
; genAssign
; genAssign
	ldw	(0x04, sp), x
	C$leds.c$133$1_1$328 ==.
;	../src/leds.c: 133: uint8_t gpioPinPos = leds_anode[ledId+1];
; genCast
; genAssign
	ld	a, (0x11, sp)
; genPlus
	inc	a
; genCast
	ld	xl, a
	ld	a, xl
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
; genLeftShiftLiteral
	sllw	x
	exgw	x, y
; genPlus
	ldw	x, y
	addw	x, #(_leds_anode+0)
; genPointerGet
	ld	a, (0x1, x)
	ld	(0x0e, sp), a
	C$leds.c$134$1_1$328 ==.
;	../src/leds.c: 134: uint8_t gpioPinNeg = leds_cathode[ledId+1];
; genPlus
	ldw	x, y
	addw	x, #(_leds_cathode+0)
; genPointerGet
	ld	a, (0x1, x)
	ld	(0x01, sp), a
	C$leds.c$138$1_1$327 ==.
;	../src/leds.c: 138: gpioPortPos->ODR |= (gpioPinPos);
; genPointerGet
	ldw	x, (0x02, sp)
	ld	a, (x)
	ld	(0x06, sp), a
	C$leds.c$139$1_1$327 ==.
;	../src/leds.c: 139: gpioPortNeg->ODR &= ~(gpioPinNeg);
; genCpl
	ld	a, (0x01, sp)
	cpl	a
	ld	(0x07, sp), a
	C$leds.c$141$1_1$327 ==.
;	../src/leds.c: 141: gpioPortPos->DDR |= gpioPinPos;
; genPlus
	ldw	x, (0x02, sp)
	incw	x
	incw	x
	ldw	(0x08, sp), x
	C$leds.c$142$1_1$327 ==.
;	../src/leds.c: 142: gpioPortNeg->DDR |= gpioPinNeg;
; genPlus
	ldw	x, (0x04, sp)
	incw	x
	incw	x
	ldw	(0x0a, sp), x
	C$leds.c$143$1_1$327 ==.
;	../src/leds.c: 143: gpioPortPos->CR1 |= gpioPinPos;
; genPlus
	ldw	y, (0x02, sp)
	addw	y, #0x0003
	C$leds.c$144$1_1$327 ==.
;	../src/leds.c: 144: gpioPortNeg->CR1 |= gpioPinNeg;
; genPlus
	ldw	x, (0x04, sp)
	addw	x, #0x0003
	ldw	(0x0c, sp), x
	C$leds.c$136$1_1$328 ==.
;	../src/leds.c: 136: if(state) //turn on
; genIfx
	tnz	(0x12, sp)
	jrne	00119$
	jp	00104$
00119$:
	C$leds.c$138$2_1$329 ==.
;	../src/leds.c: 138: gpioPortPos->ODR |= (gpioPinPos);
; genOr
	ld	a, (0x06, sp)
	or	a, (0x0e, sp)
; genPointerSet
	ldw	x, (0x02, sp)
	ld	(x), a
	C$leds.c$139$2_1$329 ==.
;	../src/leds.c: 139: gpioPortNeg->ODR &= ~(gpioPinNeg);
; genPointerGet
	ldw	x, (0x04, sp)
	ld	a, (x)
; genAnd
	and	a, (0x07, sp)
; genPointerSet
	ldw	x, (0x04, sp)
	ld	(x), a
	C$leds.c$141$2_1$329 ==.
;	../src/leds.c: 141: gpioPortPos->DDR |= gpioPinPos;
; genPointerGet
	ldw	x, (0x08, sp)
	ld	a, (x)
; genOr
	or	a, (0x0e, sp)
; genPointerSet
	ldw	x, (0x08, sp)
	ld	(x), a
	C$leds.c$142$2_1$329 ==.
;	../src/leds.c: 142: gpioPortNeg->DDR |= gpioPinNeg;
; genPointerGet
	ldw	x, (0x0a, sp)
	ld	a, (x)
; genOr
	or	a, (0x01, sp)
; genPointerSet
	ldw	x, (0x0a, sp)
	ld	(x), a
	C$leds.c$143$2_1$329 ==.
;	../src/leds.c: 143: gpioPortPos->CR1 |= gpioPinPos;
; genPointerGet
	ld	a, (y)
; genOr
	or	a, (0x0e, sp)
; genPointerSet
	ld	(y), a
	C$leds.c$144$2_1$329 ==.
;	../src/leds.c: 144: gpioPortNeg->CR1 |= gpioPinNeg;
; genPointerGet
	ldw	x, (0x0c, sp)
	ld	a, (x)
; genOr
	or	a, (0x01, sp)
; genPointerSet
	ldw	x, (0x0c, sp)
	ld	(x), a
; genGoto
	jp	00106$
; genLabel
00104$:
	C$leds.c$148$2_1$330 ==.
;	../src/leds.c: 148: gpioPortPos->ODR &= ~(gpioPinPos);
; genCpl
	cpl	(0x0e, sp)
; genAnd
	ld	a, (0x06, sp)
	and	a, (0x0e, sp)
; genPointerSet
	ldw	x, (0x02, sp)
	ld	(x), a
	C$leds.c$149$2_1$330 ==.
;	../src/leds.c: 149: gpioPortNeg->ODR &= ~(gpioPinNeg);
; genPointerGet
	ldw	x, (0x04, sp)
	ld	a, (x)
; genAnd
	and	a, (0x07, sp)
; genPointerSet
	ldw	x, (0x04, sp)
	ld	(x), a
	C$leds.c$150$2_1$330 ==.
;	../src/leds.c: 150: gpioPortPos->DDR &= ~gpioPinPos;
; genPointerGet
	ldw	x, (0x08, sp)
	ld	a, (x)
; genAnd
	and	a, (0x0e, sp)
; genPointerSet
	ldw	x, (0x08, sp)
	ld	(x), a
	C$leds.c$151$2_1$330 ==.
;	../src/leds.c: 151: gpioPortNeg->DDR &= ~gpioPinNeg;
; genPointerGet
	ldw	x, (0x0a, sp)
	ld	a, (x)
; genAnd
	and	a, (0x07, sp)
; genPointerSet
	ldw	x, (0x0a, sp)
	ld	(x), a
	C$leds.c$152$2_1$330 ==.
;	../src/leds.c: 152: gpioPortPos->CR1 &= ~gpioPinPos;
; genPointerGet
	ld	a, (y)
; genAnd
	and	a, (0x0e, sp)
; genPointerSet
	ld	(y), a
	C$leds.c$153$2_1$330 ==.
;	../src/leds.c: 153: gpioPortNeg->CR1 &= ~gpioPinNeg;
; genPointerGet
	ldw	x, (0x0c, sp)
	ld	a, (x)
; genAnd
	and	a, (0x07, sp)
; genPointerSet
	ldw	x, (0x0c, sp)
	ld	(x), a
; genLabel
00106$:
	C$leds.c$155$1_1$327 ==.
;	../src/leds.c: 155: }
; genEndFunction
	addw	sp, #14
	C$leds.c$155$1_1$327 ==.
	XG$SetLedRaw$0$0 ==.
	ret
	G$GetLedState$0$0 ==.
	C$leds.c$158$1_1$332 ==.
;	../src/leds.c: 158: uint8_t GetLedState(uint8_t ledID)
; genLabel
;	-----------------------------------------
;	 function GetLedState
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_GetLedState:
	C$leds.c$161$1_0$332 ==.
;	../src/leds.c: 161: return (ledsState & (v << ledID))?1:0;
; genAssign
	ld	a, (0x03, sp)
; genLeftShift
	clrw	x
	incw	x
	tnz	a
	jreq	00111$
00110$:
	sllw	x
	dec	a
	jrne	00110$
00111$:
; genAnd
	ld	a, xl
	and	a, _ledsState+1
	ld	xl, a
	ld	a, xh
	and	a, _ledsState+0
	ld	xh, a
; genIfx
	tnzw	x
	jrne	00112$
	jp	00103$
00112$:
; genAssign
	clrw	x
	incw	x
; genGoto
	jp	00104$
; genLabel
00103$:
; genAssign
	clrw	x
; genLabel
00104$:
; genCast
; genAssign
	ld	a, xl
; genReturn
; genLabel
00101$:
	C$leds.c$162$1_0$332 ==.
;	../src/leds.c: 162: }
; genEndFunction
	C$leds.c$162$1_0$332 ==.
	XG$GetLedState$0$0 ==.
	ret
	G$SetLedState$0$0 ==.
	C$leds.c$165$1_0$334 ==.
;	../src/leds.c: 165: void SetLedState(uint8_t ledID, uint8_t state)
; genLabel
;	-----------------------------------------
;	 function SetLedState
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_SetLedState:
	C$leds.c$167$2_0$334 ==.
;	../src/leds.c: 167: uint16_t v = 1;
; genAssign
	clrw	x
	incw	x
	C$leds.c$168$1_0$334 ==.
;	../src/leds.c: 168: if(state) ledsState |= (v << ledID);
; genAssign
	ld	a, (0x03, sp)
; genLeftShift
	tnz	a
	jreq	00112$
00111$:
	sllw	x
	dec	a
	jrne	00111$
00112$:
; genIfx
	tnz	(0x04, sp)
	jrne	00113$
	jp	00102$
00113$:
; genOr
	ld	a, xl
	or	a, _ledsState+1
	ld	xl, a
	ld	a, xh
	or	a, _ledsState+0
	ld	xh, a
; genAssign
	ldw	_ledsState+0, x
; genGoto
	jp	00104$
; genLabel
00102$:
	C$leds.c$169$1_0$334 ==.
;	../src/leds.c: 169: else ledsState &= ~(v << ledID); 
; genCpl
	cplw	x
	ld	a, xl
; genAnd
	and	a, _ledsState+1
	ld	xl, a
	ld	a, xh
	and	a, _ledsState+0
	ld	xh, a
; genAssign
	ldw	_ledsState+0, x
; genLabel
00104$:
	C$leds.c$170$1_0$334 ==.
;	../src/leds.c: 170: }
; genEndFunction
	C$leds.c$170$1_0$334 ==.
	XG$SetLedState$0$0 ==.
	ret
	.area CODE
	.area CONST
G$leds_anode$0_0$0 == .
_leds_anode:
	.dw #0x500a
	.dw #0x0008
	.dw #0x5000
	.dw #0x0008
	.dw #0x5005
	.dw #0x0010
	.dw #0x5000
	.dw #0x0008
	.dw #0x500a
	.dw #0x0008
	.dw #0x5005
	.dw #0x0010
	.dw #0x5005
	.dw #0x0020
	.dw #0x5000
	.dw #0x0008
	.dw #0x5005
	.dw #0x0020
	.dw #0x500a
	.dw #0x0008
	.dw #0x5005
	.dw #0x0010
	.dw #0x5005
	.dw #0x0020
G$leds_cathode$0_0$0 == .
_leds_cathode:
	.dw #0x5000
	.dw #0x0008
	.dw #0x500a
	.dw #0x0008
	.dw #0x5000
	.dw #0x0008
	.dw #0x5005
	.dw #0x0010
	.dw #0x5005
	.dw #0x0010
	.dw #0x500a
	.dw #0x0008
	.dw #0x5000
	.dw #0x0008
	.dw #0x5005
	.dw #0x0020
	.dw #0x500a
	.dw #0x0008
	.dw #0x5005
	.dw #0x0020
	.dw #0x5005
	.dw #0x0020
	.dw #0x5005
	.dw #0x0010
	.area INITIALIZER
	.area CABS (ABS)
