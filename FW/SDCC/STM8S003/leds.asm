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
_ledsState:
	.ds 2
_UpdateLedState_ledId_65536_325:
	.ds 1
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
;	../src/leds.c: 97: static uint8_t ledId = 0;
	clr	_UpdateLedState_ledId_65536_325+0
;	../src/leds.c: 98: static uint8_t ledIdPrev = NUM_OF_LEDS-1;
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
;	../src/leds.c: 55: void LedsInit( void )
;	-----------------------------------------
;	 function LedsInit
;	-----------------------------------------
_LedsInit:
;	../src/leds.c: 57: ledsState = 0x00;
	clrw	x
	ldw	_ledsState+0, x
;	../src/leds.c: 58: GpioInit();
;	../src/leds.c: 59: }
	jp	_GpioInit
;	../src/leds.c: 72: static void GpioInit( void ){
;	-----------------------------------------
;	 function GpioInit
;	-----------------------------------------
_GpioInit:
;	../src/leds.c: 75: for(idx = 0; idx < NUM_OF_LEDS; idx++){
	clr	a
00102$:
;	../src/leds.c: 76: SetLedRaw(idx, LED_OFF_STATE);
	push	a
	push	#0x00
	push	a
	call	_SetLedRaw
	popw	x
	pop	a
;	../src/leds.c: 75: for(idx = 0; idx < NUM_OF_LEDS; idx++){
	inc	a
	cp	a, #0x0c
	jrc	00102$
;	../src/leds.c: 78: }
	ret
;	../src/leds.c: 95: void UpdateLedState( void )
;	-----------------------------------------
;	 function UpdateLedState
;	-----------------------------------------
_UpdateLedState:
;	../src/leds.c: 101: ledId = (ledId == NUM_OF_LEDS-1)?0:(ledId+1);
	ld	a, _UpdateLedState_ledId_65536_325+0
	cp	a, #0x0b
	jrne	00103$
	clr	a
	jra	00104$
00103$:
	ld	a, _UpdateLedState_ledId_65536_325+0
	inc	a
	push	a
	rlc	a
	clr	a
	sbc	a, #0x00
	pop	a
00104$:
	ld	_UpdateLedState_ledId_65536_325+0, a
;	../src/leds.c: 103: SetLedRaw(ledIdPrev, LED_OFF_STATE);
	push	#0x00
	push	_UpdateLedState_ledIdPrev_65536_325+0
	call	_SetLedRaw
	popw	x
;	../src/leds.c: 104: SetLedRaw(ledId,GetLedState(ledId));
	push	_UpdateLedState_ledId_65536_325+0
	call	_GetLedState
	addw	sp, #1
	push	a
	push	_UpdateLedState_ledId_65536_325+0
	call	_SetLedRaw
	popw	x
;	../src/leds.c: 105: ledIdPrev = ledId; 
	mov	_UpdateLedState_ledIdPrev_65536_325+0, _UpdateLedState_ledId_65536_325+0
;	../src/leds.c: 106: }
	ret
;	../src/leds.c: 126: void SetLedRaw(uint8_t ledId, uint8_t state){
;	-----------------------------------------
;	 function SetLedRaw
;	-----------------------------------------
_SetLedRaw:
	sub	sp, #14
;	../src/leds.c: 128: if(ledId >= NUM_OF_LEDS) return;
	ld	a, (0x11, sp)
	cp	a, #0x0c
	jrc	00102$
	jp	00106$
00102$:
;	../src/leds.c: 129: ledId = ledId << 1;
	sll	(0x11, sp)
;	../src/leds.c: 131: GPIO_TypeDef * gpioPortPos = (GPIO_TypeDef * )leds_anode[ledId];
	clrw	x
	ld	a, (0x11, sp)
	ld	xl, a
	sllw	x
	ldw	y, x
	ldw	x, (_leds_anode+0, x)
	ldw	(0x02, sp), x
;	../src/leds.c: 132: GPIO_TypeDef * gpioPortNeg = (GPIO_TypeDef *) leds_cathode[ledId];
	ldw	x, y
	addw	x, #(_leds_cathode+0)
	ldw	x, (x)
	ldw	(0x04, sp), x
;	../src/leds.c: 133: uint8_t gpioPinPos = leds_anode[ledId+1];
	ld	a, (0x11, sp)
	inc	a
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	sllw	x
	ldw	y, x
	addw	x, #(_leds_anode+0)
	ld	a, (0x1, x)
	ld	(0x0e, sp), a
;	../src/leds.c: 134: uint8_t gpioPinNeg = leds_cathode[ledId+1];
	ldw	x, y
	addw	x, #(_leds_cathode+0)
	ld	a, (0x1, x)
	ld	(0x01, sp), a
;	../src/leds.c: 138: gpioPortPos->ODR |= (gpioPinPos);
	ldw	x, (0x02, sp)
	ld	a, (x)
	ld	(0x06, sp), a
;	../src/leds.c: 139: gpioPortNeg->ODR &= ~(gpioPinNeg);
	ld	a, (0x01, sp)
	cpl	a
	ld	(0x07, sp), a
;	../src/leds.c: 141: gpioPortPos->DDR |= gpioPinPos;
	ldw	x, (0x02, sp)
	incw	x
	incw	x
	ldw	(0x08, sp), x
;	../src/leds.c: 142: gpioPortNeg->DDR |= gpioPinNeg;
	ldw	x, (0x04, sp)
	incw	x
	incw	x
	ldw	(0x0a, sp), x
;	../src/leds.c: 143: gpioPortPos->CR1 |= gpioPinPos;
	ldw	y, (0x02, sp)
	addw	y, #0x0003
;	../src/leds.c: 144: gpioPortNeg->CR1 |= gpioPinNeg;
	ldw	x, (0x04, sp)
	addw	x, #0x0003
	ldw	(0x0c, sp), x
;	../src/leds.c: 136: if(state) //turn on
	tnz	(0x12, sp)
	jreq	00104$
;	../src/leds.c: 138: gpioPortPos->ODR |= (gpioPinPos);
	ld	a, (0x06, sp)
	or	a, (0x0e, sp)
	ldw	x, (0x02, sp)
	ld	(x), a
;	../src/leds.c: 139: gpioPortNeg->ODR &= ~(gpioPinNeg);
	ldw	x, (0x04, sp)
	ld	a, (x)
	and	a, (0x07, sp)
	ldw	x, (0x04, sp)
	ld	(x), a
;	../src/leds.c: 141: gpioPortPos->DDR |= gpioPinPos;
	ldw	x, (0x08, sp)
	ld	a, (x)
	or	a, (0x0e, sp)
	ldw	x, (0x08, sp)
	ld	(x), a
;	../src/leds.c: 142: gpioPortNeg->DDR |= gpioPinNeg;
	ldw	x, (0x0a, sp)
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, (0x0a, sp)
	ld	(x), a
;	../src/leds.c: 143: gpioPortPos->CR1 |= gpioPinPos;
	ld	a, (y)
	or	a, (0x0e, sp)
	ld	(y), a
;	../src/leds.c: 144: gpioPortNeg->CR1 |= gpioPinNeg;
	ldw	x, (0x0c, sp)
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, (0x0c, sp)
	ld	(x), a
	jra	00106$
00104$:
;	../src/leds.c: 148: gpioPortPos->ODR &= ~(gpioPinPos);
	cpl	(0x0e, sp)
	ld	a, (0x06, sp)
	and	a, (0x0e, sp)
	ldw	x, (0x02, sp)
	ld	(x), a
;	../src/leds.c: 149: gpioPortNeg->ODR &= ~(gpioPinNeg);
	ldw	x, (0x04, sp)
	ld	a, (x)
	and	a, (0x07, sp)
	ldw	x, (0x04, sp)
	ld	(x), a
;	../src/leds.c: 150: gpioPortPos->DDR &= ~gpioPinPos;
	ldw	x, (0x08, sp)
	ld	a, (x)
	and	a, (0x0e, sp)
	ldw	x, (0x08, sp)
	ld	(x), a
;	../src/leds.c: 151: gpioPortNeg->DDR &= ~gpioPinNeg;
	ldw	x, (0x0a, sp)
	ld	a, (x)
	and	a, (0x07, sp)
	ldw	x, (0x0a, sp)
	ld	(x), a
;	../src/leds.c: 152: gpioPortPos->CR1 &= ~gpioPinPos;
	ld	a, (y)
	and	a, (0x0e, sp)
	ld	(y), a
;	../src/leds.c: 153: gpioPortNeg->CR1 &= ~gpioPinNeg;
	ldw	x, (0x0c, sp)
	ld	a, (x)
	and	a, (0x07, sp)
	ldw	x, (0x0c, sp)
	ld	(x), a
00106$:
;	../src/leds.c: 155: }
	addw	sp, #14
	ret
;	../src/leds.c: 158: uint8_t GetLedState(uint8_t ledID)
;	-----------------------------------------
;	 function GetLedState
;	-----------------------------------------
_GetLedState:
;	../src/leds.c: 161: return (ledsState & (v << ledID))?1:0;
	ld	a, (0x03, sp)
	clrw	x
	incw	x
	tnz	a
	jreq	00111$
00110$:
	sllw	x
	dec	a
	jrne	00110$
00111$:
	ld	a, xl
	and	a, _ledsState+1
	rlwa	x
	and	a, _ledsState+0
	ld	xh, a
	tnzw	x
	jreq	00103$
	clrw	x
	incw	x
	.byte 0x21
00103$:
	clrw	x
00104$:
	ld	a, xl
;	../src/leds.c: 162: }
	ret
;	../src/leds.c: 165: void SetLedState(uint8_t ledID, uint8_t state)
;	-----------------------------------------
;	 function SetLedState
;	-----------------------------------------
_SetLedState:
;	../src/leds.c: 168: if(state) ledsState |= (v << ledID);
	ld	a, (0x03, sp)
	clrw	x
	incw	x
	tnz	a
	jreq	00112$
00111$:
	sllw	x
	dec	a
	jrne	00111$
00112$:
	tnz	(0x04, sp)
	jreq	00102$
	ld	a, xl
	or	a, _ledsState+1
	rlwa	x
	or	a, _ledsState+0
	ld	xh, a
	ldw	_ledsState+0, x
	ret
00102$:
;	../src/leds.c: 169: else ledsState &= ~(v << ledID); 
	cplw	x
	ld	a, xl
	and	a, _ledsState+1
	rlwa	x
	and	a, _ledsState+0
	ld	xh, a
	ldw	_ledsState+0, x
;	../src/leds.c: 170: }
	ret
	.area CODE
	.area CONST
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
