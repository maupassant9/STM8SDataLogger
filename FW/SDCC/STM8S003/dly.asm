;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Linux)
;--------------------------------------------------------
	.module dly
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UpdateLeds
	.globl _buttonState
	.globl _sysTick
	.globl _sysTickInit
	.globl _dly
	.globl _ButtonStateUpdate
	.globl _ButtonInit
	.globl _systemTickIsr
	.globl _ReadButtonState
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_sysTick::
	.ds 4
_buttonState::
	.ds 1
_ButtonStateUpdate_prev_result_65536_326:
	.ds 1
_ButtonStateUpdate_button_sht_ticks_65536_326:
	.ds 4
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
;	../src/dly.c: 90: static bool prev_result = FALSE;
	clr	_ButtonStateUpdate_prev_result_65536_326+0
;	../src/dly.c: 91: static uint32_t button_sht_ticks = 0;
	clrw	x
	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+2, x
	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+0, x
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	../src/dly.c: 45: void sysTickInit( void )
;	-----------------------------------------
;	 function sysTickInit
;	-----------------------------------------
_sysTickInit:
;	../src/dly.c: 47: sysTick = 0;
	clrw	x
	ldw	_sysTick+2, x
	ldw	_sysTick+0, x
;	../src/dly.c: 48: ButtonInit();
	call	_ButtonInit
;	../src/dly.c: 49: tim4Init();
;	../src/dly.c: 51: }
	jp	_tim4Init
;	../src/dly.c: 62: static void tim4Init( void )
;	-----------------------------------------
;	 function tim4Init
;	-----------------------------------------
_tim4Init:
;	../src/dly.c: 64: TIM4->PSCR = TIM4_PRESCALER_64; //tim_clk = 250K, time_resolution = 4us
	mov	0x5347+0, #0x06
;	../src/dly.c: 65: TIM4->CR1 = (TIM4_CR1_ARPE);
	mov	0x5340+0, #0x80
;	../src/dly.c: 66: TIM4->IER = TIM4_IER_UIE;
	mov	0x5343+0, #0x01
;	../src/dly.c: 67: TIM4->ARR = TIMER_VALUE_FOR_SYSTICK;
	mov	0x5348+0, #0xfa
;	../src/dly.c: 68: TIM4->CR1 |= TIM4_CR1_CEN;
	bset	21312, #0
;	../src/dly.c: 69: }
	ret
;	../src/dly.c: 82: void dly(uint32_t dt)
;	-----------------------------------------
;	 function dly
;	-----------------------------------------
_dly:
;	../src/dly.c: 84: uint32_t destSysTick = sysTick+dt;
	ldw	y, _sysTick+2
	addw	y, (0x05, sp)
	ldw	x, _sysTick+0
	jrnc	00111$
	incw	x
00111$:
	addw	x, (0x03, sp)
;	../src/dly.c: 85: while(destSysTick!=sysTick);
00101$:
	cpw	y, _sysTick+2
	jrne	00101$
	cpw	x, _sysTick+0
	jrne	00101$
	ret
	jra	00101$
;	../src/dly.c: 86: }
	ret
;	../src/dly.c: 89: void ButtonStateUpdate(){
;	-----------------------------------------
;	 function ButtonStateUpdate
;	-----------------------------------------
_ButtonStateUpdate:
;	../src/dly.c: 92: bool current_result = (0 == (BUTTON_PIN_PORT->IDR & BUTTON_PIN_NO));
	ld	a, 0x5010
	and	a, #0x10
	sub	a, #0x00
	jrne	00154$
	inc	a
	.byte 0x21
00154$:
	clr	a
00155$:
;	../src/dly.c: 95: if(current_result && !prev_result){
	tnz	a
	jreq	00102$
	tnz	_ButtonStateUpdate_prev_result_65536_326+0
	jrne	00102$
;	../src/dly.c: 96: prev_result = current_result;
	ld	_ButtonStateUpdate_prev_result_65536_326+0, a
;	../src/dly.c: 97: button_sht_ticks = 0;
	clrw	x
	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+2, x
	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+0, x
;	../src/dly.c: 98: return;
	ret
00102$:
;	../src/dly.c: 101: if(!current_result && prev_result){
	tnz	a
	jrne	00111$
	tnz	_ButtonStateUpdate_prev_result_65536_326+0
	jreq	00111$
;	../src/dly.c: 102: prev_result = current_result;
	ld	_ButtonStateUpdate_prev_result_65536_326+0, a
;	../src/dly.c: 104: if(button_sht_ticks > 2000) buttonState = BUTTON_LNG_PRESSED;
	ldw	x, #0x07d0
	cpw	x, _ButtonStateUpdate_button_sht_ticks_65536_326+2
	clr	a
	sbc	a, _ButtonStateUpdate_button_sht_ticks_65536_326+1
	clr	a
	sbc	a, _ButtonStateUpdate_button_sht_ticks_65536_326+0
	jrnc	00108$
	mov	_buttonState+0, #0x02
	jra	00109$
00108$:
;	../src/dly.c: 105: else if(button_sht_ticks > 500) buttonState = BUTTON_SHT_PRESSED;
	ldw	x, #0x01f4
	cpw	x, _ButtonStateUpdate_button_sht_ticks_65536_326+2
	clr	a
	sbc	a, _ButtonStateUpdate_button_sht_ticks_65536_326+1
	clr	a
	sbc	a, _ButtonStateUpdate_button_sht_ticks_65536_326+0
	jrnc	00105$
	mov	_buttonState+0, #0x01
	jra	00109$
00105$:
;	../src/dly.c: 106: else buttonState = BUTTON_NOT_PRESSED;
	clr	_buttonState+0
00109$:
;	../src/dly.c: 107: button_sht_ticks = 0;
	clrw	x
	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+2, x
	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+0, x
;	../src/dly.c: 108: return;
	ret
00111$:
;	../src/dly.c: 112: if(current_result){
	tnz	a
	jreq	00114$
;	../src/dly.c: 113: button_sht_ticks++;
	ldw	x, _ButtonStateUpdate_button_sht_ticks_65536_326+2
	addw	x, #0x0001
	ldw	y, _ButtonStateUpdate_button_sht_ticks_65536_326+0
	jrnc	00163$
	incw	y
00163$:
	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+2, x
	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+0, y
	ret
00114$:
;	../src/dly.c: 115: button_sht_ticks = 0;
	clrw	x
	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+2, x
	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+0, x
;	../src/dly.c: 117: }
	ret
;	../src/dly.c: 119: void ButtonInit(){
;	-----------------------------------------
;	 function ButtonInit
;	-----------------------------------------
_ButtonInit:
;	../src/dly.c: 120: BUTTON_PIN_PORT->CR2 &= (~BUTTON_PIN_NO); //Reset corresponding bit
	bres	20499, #4
;	../src/dly.c: 121: BUTTON_PIN_PORT->DDR &= BUTTON_PIN_NO; // Input mode 
	ld	a, 0x5011
	and	a, #0x10
	ld	0x5011, a
;	../src/dly.c: 122: BUTTON_PIN_PORT->CR1 &= ~BUTTON_PIN_NO; //open drain here
	bres	20498, #4
;	../src/dly.c: 123: }
	ret
;	../src/dly.c: 137: void systemTickIsr (void)
;	-----------------------------------------
;	 function systemTickIsr
;	-----------------------------------------
_systemTickIsr:
;	../src/dly.c: 139: sysTick++;
	ldw	x, _sysTick+2
	ldw	y, _sysTick+0
	incw	x
	jrne	00103$
	incw	y
00103$:
	ldw	_sysTick+2, x
	ldw	_sysTick+0, y
;	../src/dly.c: 140: TIM4->SR1 = ~TIM4_SR1_UIF;
	mov	0x5344+0, #0xfe
;	../src/dly.c: 141: UpdateLeds();
	call	_UpdateLeds
;	../src/dly.c: 142: ButtonStateUpdate();
;	../src/dly.c: 143: }
	jp	_ButtonStateUpdate
;	../src/dly.c: 146: enum button_state_t ReadButtonState()
;	-----------------------------------------
;	 function ReadButtonState
;	-----------------------------------------
_ReadButtonState:
;	../src/dly.c: 148: enum button_state_t bs = buttonState;
	ld	a, _buttonState+0
;	../src/dly.c: 149: buttonState = BUTTON_NOT_PRESSED;
	clr	_buttonState+0
;	../src/dly.c: 150: return bs;
;	../src/dly.c: 151: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
