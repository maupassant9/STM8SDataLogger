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
	.globl _sysTick
	.globl _sysTickInit
	.globl _dly
	.globl _systemTickIsr
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_sysTick::
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	../src/dly.c: 44: void sysTickInit( void )
;	-----------------------------------------
;	 function sysTickInit
;	-----------------------------------------
_sysTickInit:
;	../src/dly.c: 46: sysTick = 0;
	clrw	x
	ldw	_sysTick+2, x
	ldw	_sysTick+0, x
;	../src/dly.c: 47: tim4Init();
;	../src/dly.c: 48: }
	jp	_tim4Init
;	../src/dly.c: 59: static void tim4Init( void )
;	-----------------------------------------
;	 function tim4Init
;	-----------------------------------------
_tim4Init:
;	../src/dly.c: 61: TIM4->PSCR = TIM4_PRESCALER_64; //tim_clk = 250K, time_resolution = 4us
	mov	0x5347+0, #0x06
;	../src/dly.c: 62: TIM4->CR1 = (TIM4_CR1_ARPE);
	mov	0x5340+0, #0x80
;	../src/dly.c: 63: TIM4->IER = TIM4_IER_UIE;
	mov	0x5343+0, #0x01
;	../src/dly.c: 64: TIM4->ARR = TIMER_VALUE_FOR_SYSTICK;
	mov	0x5348+0, #0x19
;	../src/dly.c: 65: TIM4->CR1 |= TIM4_CR1_CEN;
	bset	21312, #0
;	../src/dly.c: 66: }
	ret
;	../src/dly.c: 79: void dly(uint32_t dt)
;	-----------------------------------------
;	 function dly
;	-----------------------------------------
_dly:
;	../src/dly.c: 81: uint32_t destSysTick = sysTick+dt;
	ldw	y, _sysTick+2
	addw	y, (0x05, sp)
	ldw	x, _sysTick+0
	jrnc	00111$
	incw	x
00111$:
	addw	x, (0x03, sp)
;	../src/dly.c: 82: while(destSysTick!=sysTick);
00101$:
	cpw	y, _sysTick+2
	jrne	00101$
	cpw	x, _sysTick+0
	jrne	00101$
	ret
	jra	00101$
;	../src/dly.c: 83: }
	ret
;	../src/dly.c: 97: void systemTickIsr (void)
;	-----------------------------------------
;	 function systemTickIsr
;	-----------------------------------------
_systemTickIsr:
;	../src/dly.c: 99: sysTick++;
	ldw	x, _sysTick+2
	ldw	y, _sysTick+0
	incw	x
	jrne	00103$
	incw	y
00103$:
	ldw	_sysTick+2, x
	ldw	_sysTick+0, y
;	../src/dly.c: 100: TIM4->SR1 &= ~TIM4_SR1_UIF;
	ld	a, 0x5344
	and	a, #0xfe
	ld	0x5344, a
;	../src/dly.c: 101: UpdateLeds();
;	../src/dly.c: 102: }
	jp	_UpdateLeds
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
