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
G$sysTick$0_0$0==.
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
	G$sysTickInit$0$0 ==.
	C$dly.c$44$0_0$321 ==.
;	../src/dly.c: 44: void sysTickInit( void )
; genLabel
;	-----------------------------------------
;	 function sysTickInit
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_sysTickInit:
	C$dly.c$46$1_0$321 ==.
;	../src/dly.c: 46: sysTick = 0;
; genAssign
	clrw	x
	ldw	_sysTick+2, x
	ldw	_sysTick+0, x
	C$dly.c$47$1_0$321 ==.
;	../src/dly.c: 47: tim4Init();
; genCall
	jp	_tim4Init
; genLabel
00101$:
	C$dly.c$48$1_0$321 ==.
;	../src/dly.c: 48: }
; genEndFunction
	C$dly.c$48$1_0$321 ==.
	XG$sysTickInit$0$0 ==.
	ret
	Fdly$tim4Init$0$0 ==.
	C$dly.c$59$1_0$323 ==.
;	../src/dly.c: 59: static void tim4Init( void )
; genLabel
;	-----------------------------------------
;	 function tim4Init
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_tim4Init:
	C$dly.c$61$1_0$323 ==.
;	../src/dly.c: 61: TIM4->PSCR = TIM4_PRESCALER_64; //tim_clk = 250K, time_resolution = 4us
; genPointerSet
	mov	0x5347+0, #0x06
	C$dly.c$62$1_0$323 ==.
;	../src/dly.c: 62: TIM4->CR1 = (TIM4_CR1_ARPE);
; genPointerSet
	mov	0x5340+0, #0x80
	C$dly.c$63$1_0$323 ==.
;	../src/dly.c: 63: TIM4->IER = TIM4_IER_UIE;
; genPointerSet
	mov	0x5343+0, #0x01
	C$dly.c$64$1_0$323 ==.
;	../src/dly.c: 64: TIM4->ARR = TIMER_VALUE_FOR_SYSTICK;
; genPointerSet
	mov	0x5348+0, #0xfa
	C$dly.c$65$1_0$323 ==.
;	../src/dly.c: 65: TIM4->CR1 |= TIM4_CR1_CEN;
; genPointerGet
	ld	a, 0x5340
; genOr
	or	a, #0x01
; genPointerSet
	ld	0x5340, a
; genLabel
00101$:
	C$dly.c$66$1_0$323 ==.
;	../src/dly.c: 66: }
; genEndFunction
	C$dly.c$66$1_0$323 ==.
	XFdly$tim4Init$0$0 ==.
	ret
	G$dly$0$0 ==.
	C$dly.c$79$1_0$325 ==.
;	../src/dly.c: 79: void dly(uint32_t dt)
; genLabel
;	-----------------------------------------
;	 function dly
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_dly:
	C$dly.c$81$1_0$325 ==.
;	../src/dly.c: 81: uint32_t destSysTick = sysTick+dt;
; genPlus
	ldw	y, _sysTick+2
	addw	y, (0x05, sp)
	ldw	x, _sysTick+0
	jrnc	00111$
	incw	x
00111$:
	addw	x, (0x03, sp)
; genAssign
	C$dly.c$82$1_0$325 ==.
;	../src/dly.c: 82: while(destSysTick!=sysTick);
; genLabel
00101$:
; genCmpEQorNE
	cpw	y, _sysTick+2
	jrne	00113$
	cpw	x, _sysTick+0
	jrne	00113$
	jp	00114$
00113$:
	jp	00101$
00114$:
; skipping generated iCode
; genLabel
00104$:
	C$dly.c$83$1_0$325 ==.
;	../src/dly.c: 83: }
; genEndFunction
	C$dly.c$83$1_0$325 ==.
	XG$dly$0$0 ==.
	ret
	G$systemTickIsr$0$0 ==.
	C$dly.c$97$1_0$327 ==.
;	../src/dly.c: 97: void systemTickIsr (void)
; genLabel
;	-----------------------------------------
;	 function systemTickIsr
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_systemTickIsr:
	C$dly.c$99$1_0$327 ==.
;	../src/dly.c: 99: sysTick++;
; genAssign
	ldw	x, _sysTick+2
	ldw	y, _sysTick+0
; genPlus
	incw	x
	jrne	00103$
	incw	y
00103$:
; genAssign
	ldw	_sysTick+2, x
	ldw	_sysTick+0, y
	C$dly.c$100$1_0$327 ==.
;	../src/dly.c: 100: TIM4->SR1 = ~TIM4_SR1_UIF;
; genPointerSet
	mov	0x5344+0, #0xfe
	C$dly.c$101$1_0$327 ==.
;	../src/dly.c: 101: UpdateLeds();
; genCall
	jp	_UpdateLeds
; genLabel
00101$:
	C$dly.c$102$1_0$327 ==.
;	../src/dly.c: 102: }
; genEndFunction
	C$dly.c$102$1_0$327 ==.
	XG$systemTickIsr$0$0 ==.
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
