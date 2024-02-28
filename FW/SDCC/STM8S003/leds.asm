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
;	../src/leds.c: 98: static uint8_t ledId = NUM_OF_LEDS-1;
	mov	_UpdateLedState_ledId_65536_325+0, #0x0b
;	../src/leds.c: 100: static uint8_t ledIdPrev = 0;
	clr	_UpdateLedState_ledIdPrev_65536_325+0
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
	pushw	x
;	../src/leds.c: 99: LED_STATE_T ledBit = (0x01 << ledId);
	ld	a, _UpdateLedState_ledId_65536_325+0
	push	a
	clrw	x
	incw	x
	tnz	a
	jreq	00118$
00117$:
	sllw	x
	dec	a
	jrne	00117$
00118$:
	pop	a
	ldw	(0x01, sp), x
;	../src/leds.c: 103: ledIdPrev = ledId;
	ld	_UpdateLedState_ledIdPrev_65536_325+0, a
;	../src/leds.c: 104: ledId = (ledId == NUM_OF_LEDS-1)?0:(ledId+1);
	ld	a, _UpdateLedState_ledId_65536_325+0
	cp	a, #0x0b
	jrne	00105$
	clr	a
	jra	00106$
00105$:
	ld	a, _UpdateLedState_ledId_65536_325+0
	inc	a
	push	a
	rlc	a
	clr	a
	sbc	a, #0x00
	pop	a
00106$:
	ld	_UpdateLedState_ledId_65536_325+0, a
;	../src/leds.c: 106: SetLedRaw(ledIdPrev, LED_OFF_STATE);
	push	#0x00
	push	_UpdateLedState_ledIdPrev_65536_325+0
	call	_SetLedRaw
	popw	x
;	../src/leds.c: 107: if(ledBit&ledsState){
	ld	a, (0x02, sp)
	and	a, _ledsState+1
	ld	xl, a
	ld	a, (0x01, sp)
	and	a, _ledsState+0
	ld	xh, a
	tnzw	x
	jreq	00103$
;	../src/leds.c: 108: SetLedRaw(ledId,LED_ON_STATE);
	push	#0x01
	push	_UpdateLedState_ledId_65536_325+0
	call	_SetLedRaw
	popw	x
00103$:
;	../src/leds.c: 110: }
	popw	x
	ret
;	../src/leds.c: 130: void SetLedRaw(uint8_t ledId, uint8_t state){
;	-----------------------------------------
;	 function SetLedRaw
;	-----------------------------------------
_SetLedRaw:
	sub	sp, #16
;	../src/leds.c: 132: ledId = ledId << 2;
	ld	a, (0x13, sp)
	sll	a
	sll	a
	ld	(0x13, sp), a
;	../src/leds.c: 134: GPIO_TypeDef * gpioPortPos = (GPIO_TypeDef * )leds_anode[ledId];
	clrw	x
	ld	a, (0x13, sp)
	ld	xl, a
	sllw	x
	ldw	y, x
	ldw	x, (_leds_anode+0, x)
	ldw	(0x02, sp), x
;	../src/leds.c: 135: GPIO_TypeDef * gpioPortNeg = (GPIO_TypeDef *) leds_cathode[ledId];
	ldw	x, y
	addw	x, #(_leds_cathode+0)
	ldw	x, (x)
	ldw	(0x04, sp), x
;	../src/leds.c: 136: ADDR_BANK_T gpioPinPos = leds_anode[ledId+1];
	ld	a, (0x13, sp)
	inc	a
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	sllw	x
	ldw	y, x
	ldw	y, (_leds_anode+0, y)
;	../src/leds.c: 137: ADDR_BANK_T gpioPinNeg = leds_cathode[ledId+1];
	ldw	x, (_leds_cathode+0, x)
	ldw	(0x0f, sp), x
;	../src/leds.c: 141: gpioPortPos->ODR |= (gpioPinPos);
	ldw	x, (0x02, sp)
	ld	a, (x)
	ld	(0x06, sp), a
;	../src/leds.c: 142: gpioPortNeg->ODR &= ~(gpioPinNeg);
	ld	a, (0x10, sp)
	ld	(0x01, sp), a
;	../src/leds.c: 144: gpioPortPos->DDR |= gpioPinPos;
	ldw	x, (0x02, sp)
	incw	x
	incw	x
	ldw	(0x07, sp), x
;	../src/leds.c: 145: gpioPortNeg->DDR |= gpioPinNeg;
	ldw	x, (0x04, sp)
	incw	x
	incw	x
	ldw	(0x09, sp), x
;	../src/leds.c: 146: gpioPortPos->CR1 |= gpioPinPos;
	ldw	x, (0x02, sp)
	addw	x, #0x0003
	ldw	(0x0b, sp), x
;	../src/leds.c: 147: gpioPortNeg->CR1 |= gpioPinNeg;
	ldw	x, (0x04, sp)
	addw	x, #0x0003
	ldw	(0x0d, sp), x
;	../src/leds.c: 141: gpioPortPos->ODR |= (gpioPinPos);
	exg	a, yl
	ld	(0x10, sp), a
	exg	a, yl
;	../src/leds.c: 142: gpioPortNeg->ODR &= ~(gpioPinNeg);
	ld	a, (0x01, sp)
	cpl	a
	ld	(0x0f, sp), a
;	../src/leds.c: 139: if(state) //turn on
	tnz	(0x14, sp)
	jreq	00102$
;	../src/leds.c: 141: gpioPortPos->ODR |= (gpioPinPos);
	ld	a, (0x06, sp)
	or	a, (0x10, sp)
	ldw	x, (0x02, sp)
	ld	(x), a
;	../src/leds.c: 142: gpioPortNeg->ODR &= ~(gpioPinNeg);
	ldw	x, (0x04, sp)
	ld	a, (x)
	and	a, (0x0f, sp)
	ldw	x, (0x04, sp)
	ld	(x), a
;	../src/leds.c: 144: gpioPortPos->DDR |= gpioPinPos;
	ldw	x, (0x07, sp)
	ld	a, (x)
	or	a, (0x10, sp)
	ldw	x, (0x07, sp)
	ld	(x), a
;	../src/leds.c: 145: gpioPortNeg->DDR |= gpioPinNeg;
	ldw	x, (0x09, sp)
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, (0x09, sp)
	ld	(x), a
;	../src/leds.c: 146: gpioPortPos->CR1 |= gpioPinPos;
	ldw	x, (0x0b, sp)
	ld	a, (x)
	or	a, (0x10, sp)
	ldw	x, (0x0b, sp)
	ld	(x), a
;	../src/leds.c: 147: gpioPortNeg->CR1 |= gpioPinNeg;
	ldw	x, (0x0d, sp)
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, (0x0d, sp)
	ld	(x), a
	jra	00104$
00102$:
;	../src/leds.c: 151: gpioPortPos->ODR &= ~(gpioPinPos);
	cpl	(0x10, sp)
	ld	a, (0x06, sp)
	and	a, (0x10, sp)
	ldw	x, (0x02, sp)
	ld	(x), a
;	../src/leds.c: 152: gpioPortNeg->ODR &= ~(gpioPinNeg);
	ldw	x, (0x04, sp)
	ld	a, (x)
	and	a, (0x0f, sp)
	ldw	x, (0x04, sp)
	ld	(x), a
;	../src/leds.c: 153: gpioPortPos->DDR &= ~gpioPinPos;
	ldw	x, (0x07, sp)
	ld	a, (x)
	and	a, (0x10, sp)
	ldw	x, (0x07, sp)
	ld	(x), a
;	../src/leds.c: 154: gpioPortNeg->DDR &= ~gpioPinNeg;
	ldw	x, (0x09, sp)
	ld	a, (x)
	and	a, (0x0f, sp)
	ldw	x, (0x09, sp)
	ld	(x), a
;	../src/leds.c: 155: gpioPortPos->CR1 &= ~gpioPinPos;
	ldw	x, (0x0b, sp)
	ld	a, (x)
	and	a, (0x10, sp)
	ldw	x, (0x0b, sp)
	ld	(x), a
;	../src/leds.c: 156: gpioPortNeg->CR1 &= ~gpioPinNeg;
	ldw	x, (0x0d, sp)
	ld	a, (x)
	and	a, (0x0f, sp)
	ldw	x, (0x0d, sp)
	ld	(x), a
00104$:
;	../src/leds.c: 158: }
	addw	sp, #16
	ret
;	../src/leds.c: 161: uint8_t GetLedState(uint8_t ledID)
;	-----------------------------------------
;	 function GetLedState
;	-----------------------------------------
_GetLedState:
	pushw	x
;	../src/leds.c: 163: return (ledsState & (1 << ledID))?1:0;
	ld	a, (0x05, sp)
	clrw	x
	incw	x
	tnz	a
	jreq	00111$
00110$:
	sllw	x
	dec	a
	jrne	00110$
00111$:
	ldw	y, _ledsState+0
	ldw	(0x01, sp), y
	ld	a, xl
	and	a, (0x02, sp)
	rlwa	x
	and	a, (0x01, sp)
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
;	../src/leds.c: 164: }
	popw	x
	ret
;	../src/leds.c: 167: void SetLedState(uint8_t ledID, uint8_t state)
;	-----------------------------------------
;	 function SetLedState
;	-----------------------------------------
_SetLedState:
	pushw	x
;	../src/leds.c: 169: if(state) ledsState |= (1 << ledID);
	ld	a, (0x05, sp)
	ldw	x, _ledsState+0
	ldw	(0x01, sp), x
	clrw	x
	incw	x
	tnz	a
	jreq	00112$
00111$:
	sllw	x
	dec	a
	jrne	00111$
00112$:
	tnz	(0x06, sp)
	jreq	00102$
	ld	a, xl
	or	a, (0x02, sp)
	rlwa	x
	or	a, (0x01, sp)
	ld	xh, a
	ldw	_ledsState+0, x
	jra	00104$
00102$:
;	../src/leds.c: 170: else ledsState &= ~(1 << ledID); 
	cplw	x
	ld	a, xl
	and	a, (0x02, sp)
	rlwa	x
	and	a, (0x01, sp)
	ld	xh, a
	ldw	_ledsState+0, x
00104$:
;	../src/leds.c: 171: }
	popw	x
	ret
	.area CODE
	.area CONST
_leds_anode:
	.dw #0x5000
	.dw #0x0008
	.dw #0x500a
	.dw #0x0008
	.dw #0x5000
	.dw #0x0008
	.dw #0x5005
	.dw #0x0010
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
	.dw #0x500a
	.dw #0x0008
	.dw #0x5000
	.dw #0x0008
	.dw #0x5005
	.dw #0x0010
	.dw #0x5000
	.dw #0x0008
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
