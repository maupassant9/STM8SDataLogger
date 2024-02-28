                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.1.0 #12072 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_it
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _adcIsr
                                     12 	.globl _systemTickIsr
                                     13 	.globl _TRAP_IRQHandler
                                     14 	.globl _TLI_IRQHandler
                                     15 	.globl _AWU_IRQHandler
                                     16 	.globl _CLK_IRQHandler
                                     17 	.globl _EXTI_PORTA_IRQHandler
                                     18 	.globl _EXTI_PORTB_IRQHandler
                                     19 	.globl _EXTI_PORTC_IRQHandler
                                     20 	.globl _EXTI_PORTD_IRQHandler
                                     21 	.globl _EXTI_PORTE_IRQHandler
                                     22 	.globl _SPI_IRQHandler
                                     23 	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                     24 	.globl _TIM1_CAP_COM_IRQHandler
                                     25 	.globl _TIM2_UPD_OVF_BRK_IRQHandler
                                     26 	.globl _TIM2_CAP_COM_IRQHandler
                                     27 	.globl _UART1_TX_IRQHandler
                                     28 	.globl _UART1_RX_IRQHandler
                                     29 	.globl _I2C_IRQHandler
                                     30 	.globl _ADC1_IRQHandler
                                     31 	.globl _TIM4_UPD_OVF_IRQHandler
                                     32 	.globl _EEPROM_EEC_IRQHandler
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area DATA
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area INITIALIZED
                                     41 ;--------------------------------------------------------
                                     42 ; absolute external ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area DABS (ABS)
                                     45 
                                     46 ; default segment ordering for linker
                                     47 	.area HOME
                                     48 	.area GSINIT
                                     49 	.area GSFINAL
                                     50 	.area CONST
                                     51 	.area INITIALIZER
                                     52 	.area CODE
                                     53 
                                     54 ;--------------------------------------------------------
                                     55 ; global & static initialisations
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area GSINIT
                                     59 	.area GSFINAL
                                     60 	.area GSINIT
                                     61 ;--------------------------------------------------------
                                     62 ; Home
                                     63 ;--------------------------------------------------------
                                     64 	.area HOME
                                     65 	.area HOME
                                     66 ;--------------------------------------------------------
                                     67 ; code
                                     68 ;--------------------------------------------------------
                                     69 	.area CODE
                           000000    70 	G$TRAP_IRQHandler$0$0 ==.
                           000000    71 	C$stm8s_it.c$62$0_0$313 ==.
                                     72 ;	../src/stm8s_it.c: 62: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
                                     73 ; genLabel
                                     74 ;	-----------------------------------------
                                     75 ;	 function TRAP_IRQHandler
                                     76 ;	-----------------------------------------
                                     77 ;	Register assignment is optimal.
                                     78 ;	Stack space usage: 0 bytes.
      009FDC                         79 _TRAP_IRQHandler:
                           000000    80 	C$stm8s_it.c$67$0_0$313 ==.
                                     81 ;	../src/stm8s_it.c: 67: }
                                     82 ; genLabel
      009FDC                         83 00101$:
                                     84 ; genEndFunction
                           000000    85 	C$stm8s_it.c$67$0_0$313 ==.
                           000000    86 	XG$TRAP_IRQHandler$0$0 ==.
      009FDC 80               [11]   87 	iret
                           000001    88 	G$TLI_IRQHandler$0$0 ==.
                           000001    89 	C$stm8s_it.c$73$0_0$315 ==.
                                     90 ;	../src/stm8s_it.c: 73: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     91 ; genLabel
                                     92 ;	-----------------------------------------
                                     93 ;	 function TLI_IRQHandler
                                     94 ;	-----------------------------------------
                                     95 ;	Register assignment is optimal.
                                     96 ;	Stack space usage: 0 bytes.
      009FDD                         97 _TLI_IRQHandler:
                           000001    98 	C$stm8s_it.c$78$0_0$315 ==.
                                     99 ;	../src/stm8s_it.c: 78: }
                                    100 ; genLabel
      009FDD                        101 00101$:
                                    102 ; genEndFunction
                           000001   103 	C$stm8s_it.c$78$0_0$315 ==.
                           000001   104 	XG$TLI_IRQHandler$0$0 ==.
      009FDD 80               [11]  105 	iret
                           000002   106 	G$AWU_IRQHandler$0$0 ==.
                           000002   107 	C$stm8s_it.c$85$0_0$317 ==.
                                    108 ;	../src/stm8s_it.c: 85: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                    109 ; genLabel
                                    110 ;	-----------------------------------------
                                    111 ;	 function AWU_IRQHandler
                                    112 ;	-----------------------------------------
                                    113 ;	Register assignment is optimal.
                                    114 ;	Stack space usage: 0 bytes.
      009FDE                        115 _AWU_IRQHandler:
                           000002   116 	C$stm8s_it.c$90$0_0$317 ==.
                                    117 ;	../src/stm8s_it.c: 90: }
                                    118 ; genLabel
      009FDE                        119 00101$:
                                    120 ; genEndFunction
                           000002   121 	C$stm8s_it.c$90$0_0$317 ==.
                           000002   122 	XG$AWU_IRQHandler$0$0 ==.
      009FDE 80               [11]  123 	iret
                           000003   124 	G$CLK_IRQHandler$0$0 ==.
                           000003   125 	C$stm8s_it.c$97$0_0$319 ==.
                                    126 ;	../src/stm8s_it.c: 97: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                    127 ; genLabel
                                    128 ;	-----------------------------------------
                                    129 ;	 function CLK_IRQHandler
                                    130 ;	-----------------------------------------
                                    131 ;	Register assignment is optimal.
                                    132 ;	Stack space usage: 0 bytes.
      009FDF                        133 _CLK_IRQHandler:
                           000003   134 	C$stm8s_it.c$102$0_0$319 ==.
                                    135 ;	../src/stm8s_it.c: 102: }
                                    136 ; genLabel
      009FDF                        137 00101$:
                                    138 ; genEndFunction
                           000003   139 	C$stm8s_it.c$102$0_0$319 ==.
                           000003   140 	XG$CLK_IRQHandler$0$0 ==.
      009FDF 80               [11]  141 	iret
                           000004   142 	G$EXTI_PORTA_IRQHandler$0$0 ==.
                           000004   143 	C$stm8s_it.c$109$0_0$321 ==.
                                    144 ;	../src/stm8s_it.c: 109: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                    145 ; genLabel
                                    146 ;	-----------------------------------------
                                    147 ;	 function EXTI_PORTA_IRQHandler
                                    148 ;	-----------------------------------------
                                    149 ;	Register assignment is optimal.
                                    150 ;	Stack space usage: 0 bytes.
      009FE0                        151 _EXTI_PORTA_IRQHandler:
                           000004   152 	C$stm8s_it.c$114$0_0$321 ==.
                                    153 ;	../src/stm8s_it.c: 114: }
                                    154 ; genLabel
      009FE0                        155 00101$:
                                    156 ; genEndFunction
                           000004   157 	C$stm8s_it.c$114$0_0$321 ==.
                           000004   158 	XG$EXTI_PORTA_IRQHandler$0$0 ==.
      009FE0 80               [11]  159 	iret
                           000005   160 	G$EXTI_PORTB_IRQHandler$0$0 ==.
                           000005   161 	C$stm8s_it.c$121$0_0$323 ==.
                                    162 ;	../src/stm8s_it.c: 121: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    163 ; genLabel
                                    164 ;	-----------------------------------------
                                    165 ;	 function EXTI_PORTB_IRQHandler
                                    166 ;	-----------------------------------------
                                    167 ;	Register assignment is optimal.
                                    168 ;	Stack space usage: 0 bytes.
      009FE1                        169 _EXTI_PORTB_IRQHandler:
                           000005   170 	C$stm8s_it.c$126$0_0$323 ==.
                                    171 ;	../src/stm8s_it.c: 126: }
                                    172 ; genLabel
      009FE1                        173 00101$:
                                    174 ; genEndFunction
                           000005   175 	C$stm8s_it.c$126$0_0$323 ==.
                           000005   176 	XG$EXTI_PORTB_IRQHandler$0$0 ==.
      009FE1 80               [11]  177 	iret
                           000006   178 	G$EXTI_PORTC_IRQHandler$0$0 ==.
                           000006   179 	C$stm8s_it.c$133$0_0$325 ==.
                                    180 ;	../src/stm8s_it.c: 133: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    181 ; genLabel
                                    182 ;	-----------------------------------------
                                    183 ;	 function EXTI_PORTC_IRQHandler
                                    184 ;	-----------------------------------------
                                    185 ;	Register assignment is optimal.
                                    186 ;	Stack space usage: 0 bytes.
      009FE2                        187 _EXTI_PORTC_IRQHandler:
                           000006   188 	C$stm8s_it.c$138$0_0$325 ==.
                                    189 ;	../src/stm8s_it.c: 138: }
                                    190 ; genLabel
      009FE2                        191 00101$:
                                    192 ; genEndFunction
                           000006   193 	C$stm8s_it.c$138$0_0$325 ==.
                           000006   194 	XG$EXTI_PORTC_IRQHandler$0$0 ==.
      009FE2 80               [11]  195 	iret
                           000007   196 	G$EXTI_PORTD_IRQHandler$0$0 ==.
                           000007   197 	C$stm8s_it.c$145$0_0$327 ==.
                                    198 ;	../src/stm8s_it.c: 145: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    199 ; genLabel
                                    200 ;	-----------------------------------------
                                    201 ;	 function EXTI_PORTD_IRQHandler
                                    202 ;	-----------------------------------------
                                    203 ;	Register assignment is optimal.
                                    204 ;	Stack space usage: 0 bytes.
      009FE3                        205 _EXTI_PORTD_IRQHandler:
                           000007   206 	C$stm8s_it.c$150$0_0$327 ==.
                                    207 ;	../src/stm8s_it.c: 150: }
                                    208 ; genLabel
      009FE3                        209 00101$:
                                    210 ; genEndFunction
                           000007   211 	C$stm8s_it.c$150$0_0$327 ==.
                           000007   212 	XG$EXTI_PORTD_IRQHandler$0$0 ==.
      009FE3 80               [11]  213 	iret
                           000008   214 	G$EXTI_PORTE_IRQHandler$0$0 ==.
                           000008   215 	C$stm8s_it.c$157$0_0$329 ==.
                                    216 ;	../src/stm8s_it.c: 157: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    217 ; genLabel
                                    218 ;	-----------------------------------------
                                    219 ;	 function EXTI_PORTE_IRQHandler
                                    220 ;	-----------------------------------------
                                    221 ;	Register assignment is optimal.
                                    222 ;	Stack space usage: 0 bytes.
      009FE4                        223 _EXTI_PORTE_IRQHandler:
                           000008   224 	C$stm8s_it.c$162$0_0$329 ==.
                                    225 ;	../src/stm8s_it.c: 162: }
                                    226 ; genLabel
      009FE4                        227 00101$:
                                    228 ; genEndFunction
                           000008   229 	C$stm8s_it.c$162$0_0$329 ==.
                           000008   230 	XG$EXTI_PORTE_IRQHandler$0$0 ==.
      009FE4 80               [11]  231 	iret
                           000009   232 	G$SPI_IRQHandler$0$0 ==.
                           000009   233 	C$stm8s_it.c$208$0_0$331 ==.
                                    234 ;	../src/stm8s_it.c: 208: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    235 ; genLabel
                                    236 ;	-----------------------------------------
                                    237 ;	 function SPI_IRQHandler
                                    238 ;	-----------------------------------------
                                    239 ;	Register assignment is optimal.
                                    240 ;	Stack space usage: 0 bytes.
      009FE5                        241 _SPI_IRQHandler:
                           000009   242 	C$stm8s_it.c$213$0_0$331 ==.
                                    243 ;	../src/stm8s_it.c: 213: }
                                    244 ; genLabel
      009FE5                        245 00101$:
                                    246 ; genEndFunction
                           000009   247 	C$stm8s_it.c$213$0_0$331 ==.
                           000009   248 	XG$SPI_IRQHandler$0$0 ==.
      009FE5 80               [11]  249 	iret
                           00000A   250 	G$TIM1_UPD_OVF_TRG_BRK_IRQHandler$0$0 ==.
                           00000A   251 	C$stm8s_it.c$220$0_0$333 ==.
                                    252 ;	../src/stm8s_it.c: 220: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    253 ; genLabel
                                    254 ;	-----------------------------------------
                                    255 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    256 ;	-----------------------------------------
                                    257 ;	Register assignment is optimal.
                                    258 ;	Stack space usage: 0 bytes.
      009FE6                        259 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                           00000A   260 	C$stm8s_it.c$225$0_0$333 ==.
                                    261 ;	../src/stm8s_it.c: 225: }
                                    262 ; genLabel
      009FE6                        263 00101$:
                                    264 ; genEndFunction
                           00000A   265 	C$stm8s_it.c$225$0_0$333 ==.
                           00000A   266 	XG$TIM1_UPD_OVF_TRG_BRK_IRQHandler$0$0 ==.
      009FE6 80               [11]  267 	iret
                           00000B   268 	G$TIM1_CAP_COM_IRQHandler$0$0 ==.
                           00000B   269 	C$stm8s_it.c$232$0_0$335 ==.
                                    270 ;	../src/stm8s_it.c: 232: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    271 ; genLabel
                                    272 ;	-----------------------------------------
                                    273 ;	 function TIM1_CAP_COM_IRQHandler
                                    274 ;	-----------------------------------------
                                    275 ;	Register assignment is optimal.
                                    276 ;	Stack space usage: 0 bytes.
      009FE7                        277 _TIM1_CAP_COM_IRQHandler:
                           00000B   278 	C$stm8s_it.c$237$0_0$335 ==.
                                    279 ;	../src/stm8s_it.c: 237: }
                                    280 ; genLabel
      009FE7                        281 00101$:
                                    282 ; genEndFunction
                           00000B   283 	C$stm8s_it.c$237$0_0$335 ==.
                           00000B   284 	XG$TIM1_CAP_COM_IRQHandler$0$0 ==.
      009FE7 80               [11]  285 	iret
                           00000C   286 	G$TIM2_UPD_OVF_BRK_IRQHandler$0$0 ==.
                           00000C   287 	C$stm8s_it.c$269$0_0$337 ==.
                                    288 ;	../src/stm8s_it.c: 269: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    289 ; genLabel
                                    290 ;	-----------------------------------------
                                    291 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    292 ;	-----------------------------------------
                                    293 ;	Register assignment is optimal.
                                    294 ;	Stack space usage: 0 bytes.
      009FE8                        295 _TIM2_UPD_OVF_BRK_IRQHandler:
                           00000C   296 	C$stm8s_it.c$274$0_0$337 ==.
                                    297 ;	../src/stm8s_it.c: 274: }
                                    298 ; genLabel
      009FE8                        299 00101$:
                                    300 ; genEndFunction
                           00000C   301 	C$stm8s_it.c$274$0_0$337 ==.
                           00000C   302 	XG$TIM2_UPD_OVF_BRK_IRQHandler$0$0 ==.
      009FE8 80               [11]  303 	iret
                           00000D   304 	G$TIM2_CAP_COM_IRQHandler$0$0 ==.
                           00000D   305 	C$stm8s_it.c$281$0_0$339 ==.
                                    306 ;	../src/stm8s_it.c: 281: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    307 ; genLabel
                                    308 ;	-----------------------------------------
                                    309 ;	 function TIM2_CAP_COM_IRQHandler
                                    310 ;	-----------------------------------------
                                    311 ;	Register assignment is optimal.
                                    312 ;	Stack space usage: 0 bytes.
      009FE9                        313 _TIM2_CAP_COM_IRQHandler:
                           00000D   314 	C$stm8s_it.c$286$0_0$339 ==.
                                    315 ;	../src/stm8s_it.c: 286: }
                                    316 ; genLabel
      009FE9                        317 00101$:
                                    318 ; genEndFunction
                           00000D   319 	C$stm8s_it.c$286$0_0$339 ==.
                           00000D   320 	XG$TIM2_CAP_COM_IRQHandler$0$0 ==.
      009FE9 80               [11]  321 	iret
                           00000E   322 	G$UART1_TX_IRQHandler$0$0 ==.
                           00000E   323 	C$stm8s_it.c$323$0_0$341 ==.
                                    324 ;	../src/stm8s_it.c: 323: INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
                                    325 ; genLabel
                                    326 ;	-----------------------------------------
                                    327 ;	 function UART1_TX_IRQHandler
                                    328 ;	-----------------------------------------
                                    329 ;	Register assignment is optimal.
                                    330 ;	Stack space usage: 0 bytes.
      009FEA                        331 _UART1_TX_IRQHandler:
                           00000E   332 	C$stm8s_it.c$328$0_0$341 ==.
                                    333 ;	../src/stm8s_it.c: 328: }
                                    334 ; genLabel
      009FEA                        335 00101$:
                                    336 ; genEndFunction
                           00000E   337 	C$stm8s_it.c$328$0_0$341 ==.
                           00000E   338 	XG$UART1_TX_IRQHandler$0$0 ==.
      009FEA 80               [11]  339 	iret
                           00000F   340 	G$UART1_RX_IRQHandler$0$0 ==.
                           00000F   341 	C$stm8s_it.c$335$0_0$343 ==.
                                    342 ;	../src/stm8s_it.c: 335: INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
                                    343 ; genLabel
                                    344 ;	-----------------------------------------
                                    345 ;	 function UART1_RX_IRQHandler
                                    346 ;	-----------------------------------------
                                    347 ;	Register assignment is optimal.
                                    348 ;	Stack space usage: 0 bytes.
      009FEB                        349 _UART1_RX_IRQHandler:
                           00000F   350 	C$stm8s_it.c$340$0_0$343 ==.
                                    351 ;	../src/stm8s_it.c: 340: }
                                    352 ; genLabel
      009FEB                        353 00101$:
                                    354 ; genEndFunction
                           00000F   355 	C$stm8s_it.c$340$0_0$343 ==.
                           00000F   356 	XG$UART1_RX_IRQHandler$0$0 ==.
      009FEB 80               [11]  357 	iret
                           000010   358 	G$I2C_IRQHandler$0$0 ==.
                           000010   359 	C$stm8s_it.c$348$0_0$345 ==.
                                    360 ;	../src/stm8s_it.c: 348: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    361 ; genLabel
                                    362 ;	-----------------------------------------
                                    363 ;	 function I2C_IRQHandler
                                    364 ;	-----------------------------------------
                                    365 ;	Register assignment is optimal.
                                    366 ;	Stack space usage: 0 bytes.
      009FEC                        367 _I2C_IRQHandler:
                           000010   368 	C$stm8s_it.c$353$0_0$345 ==.
                                    369 ;	../src/stm8s_it.c: 353: }
                                    370 ; genLabel
      009FEC                        371 00101$:
                                    372 ; genEndFunction
                           000010   373 	C$stm8s_it.c$353$0_0$345 ==.
                           000010   374 	XG$I2C_IRQHandler$0$0 ==.
      009FEC 80               [11]  375 	iret
                           000011   376 	G$ADC1_IRQHandler$0$0 ==.
                           000011   377 	C$stm8s_it.c$428$0_0$346 ==.
                                    378 ;	../src/stm8s_it.c: 428: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
                                    379 ; genLabel
                                    380 ;	-----------------------------------------
                                    381 ;	 function ADC1_IRQHandler
                                    382 ;	-----------------------------------------
                                    383 ;	Register assignment is optimal.
                                    384 ;	Stack space usage: 0 bytes.
      009FED                        385 _ADC1_IRQHandler:
                                    386 ;	Reset bit 6 of reg CC. Hardware bug workaround.
      009FED 62               [ 2]  387 	div	x, a
                           000012   388 	C$stm8s_it.c$430$1_0$346 ==.
                                    389 ;	../src/stm8s_it.c: 430: adcIsr();
                                    390 ; genCall
      009FEE CD 8D 9B         [ 4]  391 	call	_adcIsr
                           000015   392 	C$stm8s_it.c$434$1_0$346 ==.
                                    393 ;	../src/stm8s_it.c: 434: return;
                                    394 ; genReturn
                                    395 ; genLabel
      009FF1                        396 00101$:
                           000015   397 	C$stm8s_it.c$436$1_0$346 ==.
                                    398 ;	../src/stm8s_it.c: 436: }
                                    399 ; genEndFunction
                           000015   400 	C$stm8s_it.c$436$1_0$346 ==.
                           000015   401 	XG$ADC1_IRQHandler$0$0 ==.
      009FF1 80               [11]  402 	iret
                           000016   403 	G$TIM4_UPD_OVF_IRQHandler$0$0 ==.
                           000016   404 	C$stm8s_it.c$457$1_0$347 ==.
                                    405 ;	../src/stm8s_it.c: 457: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    406 ; genLabel
                                    407 ;	-----------------------------------------
                                    408 ;	 function TIM4_UPD_OVF_IRQHandler
                                    409 ;	-----------------------------------------
                                    410 ;	Register assignment is optimal.
                                    411 ;	Stack space usage: 0 bytes.
      009FF2                        412 _TIM4_UPD_OVF_IRQHandler:
                                    413 ;	Reset bit 6 of reg CC. Hardware bug workaround.
      009FF2 62               [ 2]  414 	div	x, a
                           000017   415 	C$stm8s_it.c$462$1_0$347 ==.
                                    416 ;	../src/stm8s_it.c: 462: systemTickIsr();
                                    417 ; genCall
      009FF3 CD 88 E0         [ 4]  418 	call	_systemTickIsr
                                    419 ; genLabel
      009FF6                        420 00101$:
                           00001A   421 	C$stm8s_it.c$463$1_0$347 ==.
                                    422 ;	../src/stm8s_it.c: 463: }
                                    423 ; genEndFunction
                           00001A   424 	C$stm8s_it.c$463$1_0$347 ==.
                           00001A   425 	XG$TIM4_UPD_OVF_IRQHandler$0$0 ==.
      009FF6 80               [11]  426 	iret
                           00001B   427 	G$EEPROM_EEC_IRQHandler$0$0 ==.
                           00001B   428 	C$stm8s_it.c$471$1_0$349 ==.
                                    429 ;	../src/stm8s_it.c: 471: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    430 ; genLabel
                                    431 ;	-----------------------------------------
                                    432 ;	 function EEPROM_EEC_IRQHandler
                                    433 ;	-----------------------------------------
                                    434 ;	Register assignment is optimal.
                                    435 ;	Stack space usage: 0 bytes.
      009FF7                        436 _EEPROM_EEC_IRQHandler:
                           00001B   437 	C$stm8s_it.c$476$1_0$349 ==.
                                    438 ;	../src/stm8s_it.c: 476: }
                                    439 ; genLabel
      009FF7                        440 00101$:
                                    441 ; genEndFunction
                           00001B   442 	C$stm8s_it.c$476$1_0$349 ==.
                           00001B   443 	XG$EEPROM_EEC_IRQHandler$0$0 ==.
      009FF7 80               [11]  444 	iret
                                    445 	.area CODE
                                    446 	.area CONST
                                    447 	.area INITIALIZER
                                    448 	.area CABS (ABS)
