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
                           000000    20 G$sysTick$0_0$0==.
      000021                         21 _sysTick::
      000021                         22 	.ds 4
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area INITIALIZED
                                     27 ;--------------------------------------------------------
                                     28 ; absolute external ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DABS (ABS)
                                     31 
                                     32 ; default segment ordering for linker
                                     33 	.area HOME
                                     34 	.area GSINIT
                                     35 	.area GSFINAL
                                     36 	.area CONST
                                     37 	.area INITIALIZER
                                     38 	.area CODE
                                     39 
                                     40 ;--------------------------------------------------------
                                     41 ; global & static initialisations
                                     42 ;--------------------------------------------------------
                                     43 	.area HOME
                                     44 	.area GSINIT
                                     45 	.area GSFINAL
                                     46 	.area GSINIT
                                     47 ;--------------------------------------------------------
                                     48 ; Home
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area HOME
                                     52 ;--------------------------------------------------------
                                     53 ; code
                                     54 ;--------------------------------------------------------
                                     55 	.area CODE
                           000000    56 	G$sysTickInit$0$0 ==.
                           000000    57 	C$dly.c$44$0_0$321 ==.
                                     58 ;	../src/dly.c: 44: void sysTickInit( void )
                                     59 ; genLabel
                                     60 ;	-----------------------------------------
                                     61 ;	 function sysTickInit
                                     62 ;	-----------------------------------------
                                     63 ;	Register assignment is optimal.
                                     64 ;	Stack space usage: 0 bytes.
      00889A                         65 _sysTickInit:
                           000000    66 	C$dly.c$46$1_0$321 ==.
                                     67 ;	../src/dly.c: 46: sysTick = 0;
                                     68 ; genAssign
      00889A 5F               [ 1]   69 	clrw	x
      00889B CF 00 23         [ 2]   70 	ldw	_sysTick+2, x
      00889E CF 00 21         [ 2]   71 	ldw	_sysTick+0, x
                           000007    72 	C$dly.c$47$1_0$321 ==.
                                     73 ;	../src/dly.c: 47: tim4Init();
                                     74 ; genCall
      0088A1 CC 88 A5         [ 2]   75 	jp	_tim4Init
                                     76 ; genLabel
      0088A4                         77 00101$:
                           00000A    78 	C$dly.c$48$1_0$321 ==.
                                     79 ;	../src/dly.c: 48: }
                                     80 ; genEndFunction
                           00000A    81 	C$dly.c$48$1_0$321 ==.
                           00000A    82 	XG$sysTickInit$0$0 ==.
      0088A4 81               [ 4]   83 	ret
                           00000B    84 	Fdly$tim4Init$0$0 ==.
                           00000B    85 	C$dly.c$59$1_0$323 ==.
                                     86 ;	../src/dly.c: 59: static void tim4Init( void )
                                     87 ; genLabel
                                     88 ;	-----------------------------------------
                                     89 ;	 function tim4Init
                                     90 ;	-----------------------------------------
                                     91 ;	Register assignment is optimal.
                                     92 ;	Stack space usage: 0 bytes.
      0088A5                         93 _tim4Init:
                           00000B    94 	C$dly.c$61$1_0$323 ==.
                                     95 ;	../src/dly.c: 61: TIM4->PSCR = TIM4_PRESCALER_64; //tim_clk = 250K, time_resolution = 4us
                                     96 ; genPointerSet
      0088A5 35 06 53 47      [ 1]   97 	mov	0x5347+0, #0x06
                           00000F    98 	C$dly.c$62$1_0$323 ==.
                                     99 ;	../src/dly.c: 62: TIM4->CR1 = (TIM4_CR1_ARPE);
                                    100 ; genPointerSet
      0088A9 35 80 53 40      [ 1]  101 	mov	0x5340+0, #0x80
                           000013   102 	C$dly.c$63$1_0$323 ==.
                                    103 ;	../src/dly.c: 63: TIM4->IER = TIM4_IER_UIE;
                                    104 ; genPointerSet
      0088AD 35 01 53 43      [ 1]  105 	mov	0x5343+0, #0x01
                           000017   106 	C$dly.c$64$1_0$323 ==.
                                    107 ;	../src/dly.c: 64: TIM4->ARR = TIMER_VALUE_FOR_SYSTICK;
                                    108 ; genPointerSet
      0088B1 35 FA 53 48      [ 1]  109 	mov	0x5348+0, #0xfa
                           00001B   110 	C$dly.c$65$1_0$323 ==.
                                    111 ;	../src/dly.c: 65: TIM4->CR1 |= TIM4_CR1_CEN;
                                    112 ; genPointerGet
      0088B5 C6 53 40         [ 1]  113 	ld	a, 0x5340
                                    114 ; genOr
      0088B8 AA 01            [ 1]  115 	or	a, #0x01
                                    116 ; genPointerSet
      0088BA C7 53 40         [ 1]  117 	ld	0x5340, a
                                    118 ; genLabel
      0088BD                        119 00101$:
                           000023   120 	C$dly.c$66$1_0$323 ==.
                                    121 ;	../src/dly.c: 66: }
                                    122 ; genEndFunction
                           000023   123 	C$dly.c$66$1_0$323 ==.
                           000023   124 	XFdly$tim4Init$0$0 ==.
      0088BD 81               [ 4]  125 	ret
                           000024   126 	G$dly$0$0 ==.
                           000024   127 	C$dly.c$79$1_0$325 ==.
                                    128 ;	../src/dly.c: 79: void dly(uint32_t dt)
                                    129 ; genLabel
                                    130 ;	-----------------------------------------
                                    131 ;	 function dly
                                    132 ;	-----------------------------------------
                                    133 ;	Register assignment might be sub-optimal.
                                    134 ;	Stack space usage: 0 bytes.
      0088BE                        135 _dly:
                           000024   136 	C$dly.c$81$1_0$325 ==.
                                    137 ;	../src/dly.c: 81: uint32_t destSysTick = sysTick+dt;
                                    138 ; genPlus
      0088BE 90 CE 00 23      [ 2]  139 	ldw	y, _sysTick+2
      0088C2 72 F9 05         [ 2]  140 	addw	y, (0x05, sp)
      0088C5 CE 00 21         [ 2]  141 	ldw	x, _sysTick+0
      0088C8 24 01            [ 1]  142 	jrnc	00111$
      0088CA 5C               [ 1]  143 	incw	x
      0088CB                        144 00111$:
      0088CB 72 FB 03         [ 2]  145 	addw	x, (0x03, sp)
                                    146 ; genAssign
                           000034   147 	C$dly.c$82$1_0$325 ==.
                                    148 ;	../src/dly.c: 82: while(destSysTick!=sysTick);
                                    149 ; genLabel
      0088CE                        150 00101$:
                                    151 ; genCmpEQorNE
      0088CE 90 C3 00 23      [ 2]  152 	cpw	y, _sysTick+2
      0088D2 26 08            [ 1]  153 	jrne	00113$
      0088D4 C3 00 21         [ 2]  154 	cpw	x, _sysTick+0
      0088D7 26 03            [ 1]  155 	jrne	00113$
      0088D9 CC 88 DF         [ 2]  156 	jp	00114$
      0088DC                        157 00113$:
      0088DC CC 88 CE         [ 2]  158 	jp	00101$
      0088DF                        159 00114$:
                                    160 ; skipping generated iCode
                                    161 ; genLabel
      0088DF                        162 00104$:
                           000045   163 	C$dly.c$83$1_0$325 ==.
                                    164 ;	../src/dly.c: 83: }
                                    165 ; genEndFunction
                           000045   166 	C$dly.c$83$1_0$325 ==.
                           000045   167 	XG$dly$0$0 ==.
      0088DF 81               [ 4]  168 	ret
                           000046   169 	G$systemTickIsr$0$0 ==.
                           000046   170 	C$dly.c$97$1_0$327 ==.
                                    171 ;	../src/dly.c: 97: void systemTickIsr (void)
                                    172 ; genLabel
                                    173 ;	-----------------------------------------
                                    174 ;	 function systemTickIsr
                                    175 ;	-----------------------------------------
                                    176 ;	Register assignment might be sub-optimal.
                                    177 ;	Stack space usage: 0 bytes.
      0088E0                        178 _systemTickIsr:
                           000046   179 	C$dly.c$99$1_0$327 ==.
                                    180 ;	../src/dly.c: 99: sysTick++;
                                    181 ; genAssign
      0088E0 CE 00 23         [ 2]  182 	ldw	x, _sysTick+2
      0088E3 90 CE 00 21      [ 2]  183 	ldw	y, _sysTick+0
                                    184 ; genPlus
      0088E7 5C               [ 1]  185 	incw	x
      0088E8 26 02            [ 1]  186 	jrne	00103$
      0088EA 90 5C            [ 1]  187 	incw	y
      0088EC                        188 00103$:
                                    189 ; genAssign
      0088EC CF 00 23         [ 2]  190 	ldw	_sysTick+2, x
      0088EF 90 CF 00 21      [ 2]  191 	ldw	_sysTick+0, y
                           000059   192 	C$dly.c$100$1_0$327 ==.
                                    193 ;	../src/dly.c: 100: TIM4->SR1 = ~TIM4_SR1_UIF;
                                    194 ; genPointerSet
      0088F3 35 FE 53 44      [ 1]  195 	mov	0x5344+0, #0xfe
                           00005D   196 	C$dly.c$101$1_0$327 ==.
                                    197 ;	../src/dly.c: 101: UpdateLeds();
                                    198 ; genCall
      0088F7 CC 89 F5         [ 2]  199 	jp	_UpdateLeds
                                    200 ; genLabel
      0088FA                        201 00101$:
                           000060   202 	C$dly.c$102$1_0$327 ==.
                                    203 ;	../src/dly.c: 102: }
                                    204 ; genEndFunction
                           000060   205 	C$dly.c$102$1_0$327 ==.
                           000060   206 	XG$systemTickIsr$0$0 ==.
      0088FA 81               [ 4]  207 	ret
                                    208 	.area CODE
                                    209 	.area CONST
                                    210 	.area INITIALIZER
                                    211 	.area CABS (ABS)
