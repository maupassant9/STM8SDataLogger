                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.1.0 #12072 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module dly
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _UpdateLeds
                                     12 	.globl _sysTick
                                     13 	.globl _sysTickInit
                                     14 	.globl _dly
                                     15 	.globl _systemTickIsr
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area DATA
      00020D                         20 _sysTick::
      00020D                         21 	.ds 4
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area INITIALIZED
                                     26 ;--------------------------------------------------------
                                     27 ; absolute external ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area DABS (ABS)
                                     30 
                                     31 ; default segment ordering for linker
                                     32 	.area HOME
                                     33 	.area GSINIT
                                     34 	.area GSFINAL
                                     35 	.area CONST
                                     36 	.area INITIALIZER
                                     37 	.area CODE
                                     38 
                                     39 ;--------------------------------------------------------
                                     40 ; global & static initialisations
                                     41 ;--------------------------------------------------------
                                     42 	.area HOME
                                     43 	.area GSINIT
                                     44 	.area GSFINAL
                                     45 	.area GSINIT
                                     46 ;--------------------------------------------------------
                                     47 ; Home
                                     48 ;--------------------------------------------------------
                                     49 	.area HOME
                                     50 	.area HOME
                                     51 ;--------------------------------------------------------
                                     52 ; code
                                     53 ;--------------------------------------------------------
                                     54 	.area CODE
                                     55 ;	../src/dly.c: 44: void sysTickInit( void )
                                     56 ;	-----------------------------------------
                                     57 ;	 function sysTickInit
                                     58 ;	-----------------------------------------
      00849A                         59 _sysTickInit:
                                     60 ;	../src/dly.c: 46: sysTick = 0;
      00849A 5F               [ 1]   61 	clrw	x
      00849B CF 02 0F         [ 2]   62 	ldw	_sysTick+2, x
      00849E CF 02 0D         [ 2]   63 	ldw	_sysTick+0, x
                                     64 ;	../src/dly.c: 47: tim4Init();
                                     65 ;	../src/dly.c: 48: }
      0084A1 CC 84 A4         [ 2]   66 	jp	_tim4Init
                                     67 ;	../src/dly.c: 59: static void tim4Init( void )
                                     68 ;	-----------------------------------------
                                     69 ;	 function tim4Init
                                     70 ;	-----------------------------------------
      0084A4                         71 _tim4Init:
                                     72 ;	../src/dly.c: 61: TIM4->PSCR = TIM4_PRESCALER_64; //tim_clk = 250K, time_resolution = 4us
      0084A4 35 06 53 47      [ 1]   73 	mov	0x5347+0, #0x06
                                     74 ;	../src/dly.c: 62: TIM4->CR1 = (TIM4_CR1_ARPE);
      0084A8 35 80 53 40      [ 1]   75 	mov	0x5340+0, #0x80
                                     76 ;	../src/dly.c: 63: TIM4->IER = TIM4_IER_UIE;
      0084AC 35 01 53 43      [ 1]   77 	mov	0x5343+0, #0x01
                                     78 ;	../src/dly.c: 64: TIM4->ARR = TIMER_VALUE_FOR_SYSTICK;
      0084B0 35 19 53 48      [ 1]   79 	mov	0x5348+0, #0x19
                                     80 ;	../src/dly.c: 65: TIM4->CR1 |= TIM4_CR1_CEN;
      0084B4 72 10 53 40      [ 1]   81 	bset	21312, #0
                                     82 ;	../src/dly.c: 66: }
      0084B8 81               [ 4]   83 	ret
                                     84 ;	../src/dly.c: 79: void dly(uint32_t dt)
                                     85 ;	-----------------------------------------
                                     86 ;	 function dly
                                     87 ;	-----------------------------------------
      0084B9                         88 _dly:
                                     89 ;	../src/dly.c: 81: uint32_t destSysTick = sysTick+dt;
      0084B9 90 CE 02 0F      [ 2]   90 	ldw	y, _sysTick+2
      0084BD 72 F9 05         [ 2]   91 	addw	y, (0x05, sp)
      0084C0 CE 02 0D         [ 2]   92 	ldw	x, _sysTick+0
      0084C3 24 01            [ 1]   93 	jrnc	00111$
      0084C5 5C               [ 1]   94 	incw	x
      0084C6                         95 00111$:
      0084C6 72 FB 03         [ 2]   96 	addw	x, (0x03, sp)
                                     97 ;	../src/dly.c: 82: while(destSysTick!=sysTick);
      0084C9                         98 00101$:
      0084C9 90 C3 02 0F      [ 2]   99 	cpw	y, _sysTick+2
      0084CD 26 FA            [ 1]  100 	jrne	00101$
      0084CF C3 02 0D         [ 2]  101 	cpw	x, _sysTick+0
      0084D2 26 F5            [ 1]  102 	jrne	00101$
      0084D4 81               [ 4]  103 	ret
      0084D5 20 F2            [ 2]  104 	jra	00101$
                                    105 ;	../src/dly.c: 83: }
      0084D7 81               [ 4]  106 	ret
                                    107 ;	../src/dly.c: 97: void systemTickIsr (void)
                                    108 ;	-----------------------------------------
                                    109 ;	 function systemTickIsr
                                    110 ;	-----------------------------------------
      0084D8                        111 _systemTickIsr:
                                    112 ;	../src/dly.c: 99: sysTick++;
      0084D8 CE 02 0F         [ 2]  113 	ldw	x, _sysTick+2
      0084DB 90 CE 02 0D      [ 2]  114 	ldw	y, _sysTick+0
      0084DF 5C               [ 1]  115 	incw	x
      0084E0 26 02            [ 1]  116 	jrne	00103$
      0084E2 90 5C            [ 1]  117 	incw	y
      0084E4                        118 00103$:
      0084E4 CF 02 0F         [ 2]  119 	ldw	_sysTick+2, x
      0084E7 90 CF 02 0D      [ 2]  120 	ldw	_sysTick+0, y
                                    121 ;	../src/dly.c: 100: TIM4->SR1 = ~TIM4_SR1_UIF;
      0084EB 35 FE 53 44      [ 1]  122 	mov	0x5344+0, #0xfe
                                    123 ;	../src/dly.c: 101: UpdateLeds();
                                    124 ;	../src/dly.c: 102: }
      0084EF CC 85 CA         [ 2]  125 	jp	_UpdateLeds
                                    126 	.area CODE
                                    127 	.area CONST
                                    128 	.area INITIALIZER
                                    129 	.area CABS (ABS)
