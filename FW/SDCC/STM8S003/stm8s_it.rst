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
                                     70 ;	../src/stm8s_it.c: 62: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
                                     71 ;	-----------------------------------------
                                     72 ;	 function TRAP_IRQHandler
                                     73 ;	-----------------------------------------
      009C01                         74 _TRAP_IRQHandler:
                                     75 ;	../src/stm8s_it.c: 67: }
      009C01 80               [11]   76 	iret
                                     77 ;	../src/stm8s_it.c: 73: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     78 ;	-----------------------------------------
                                     79 ;	 function TLI_IRQHandler
                                     80 ;	-----------------------------------------
      009C02                         81 _TLI_IRQHandler:
                                     82 ;	../src/stm8s_it.c: 78: }
      009C02 80               [11]   83 	iret
                                     84 ;	../src/stm8s_it.c: 85: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                     85 ;	-----------------------------------------
                                     86 ;	 function AWU_IRQHandler
                                     87 ;	-----------------------------------------
      009C03                         88 _AWU_IRQHandler:
                                     89 ;	../src/stm8s_it.c: 90: }
      009C03 80               [11]   90 	iret
                                     91 ;	../src/stm8s_it.c: 97: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                     92 ;	-----------------------------------------
                                     93 ;	 function CLK_IRQHandler
                                     94 ;	-----------------------------------------
      009C04                         95 _CLK_IRQHandler:
                                     96 ;	../src/stm8s_it.c: 102: }
      009C04 80               [11]   97 	iret
                                     98 ;	../src/stm8s_it.c: 109: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                     99 ;	-----------------------------------------
                                    100 ;	 function EXTI_PORTA_IRQHandler
                                    101 ;	-----------------------------------------
      009C05                        102 _EXTI_PORTA_IRQHandler:
                                    103 ;	../src/stm8s_it.c: 114: }
      009C05 80               [11]  104 	iret
                                    105 ;	../src/stm8s_it.c: 121: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    106 ;	-----------------------------------------
                                    107 ;	 function EXTI_PORTB_IRQHandler
                                    108 ;	-----------------------------------------
      009C06                        109 _EXTI_PORTB_IRQHandler:
                                    110 ;	../src/stm8s_it.c: 126: }
      009C06 80               [11]  111 	iret
                                    112 ;	../src/stm8s_it.c: 133: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    113 ;	-----------------------------------------
                                    114 ;	 function EXTI_PORTC_IRQHandler
                                    115 ;	-----------------------------------------
      009C07                        116 _EXTI_PORTC_IRQHandler:
                                    117 ;	../src/stm8s_it.c: 138: }
      009C07 80               [11]  118 	iret
                                    119 ;	../src/stm8s_it.c: 145: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    120 ;	-----------------------------------------
                                    121 ;	 function EXTI_PORTD_IRQHandler
                                    122 ;	-----------------------------------------
      009C08                        123 _EXTI_PORTD_IRQHandler:
                                    124 ;	../src/stm8s_it.c: 150: }
      009C08 80               [11]  125 	iret
                                    126 ;	../src/stm8s_it.c: 157: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    127 ;	-----------------------------------------
                                    128 ;	 function EXTI_PORTE_IRQHandler
                                    129 ;	-----------------------------------------
      009C09                        130 _EXTI_PORTE_IRQHandler:
                                    131 ;	../src/stm8s_it.c: 162: }
      009C09 80               [11]  132 	iret
                                    133 ;	../src/stm8s_it.c: 208: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    134 ;	-----------------------------------------
                                    135 ;	 function SPI_IRQHandler
                                    136 ;	-----------------------------------------
      009C0A                        137 _SPI_IRQHandler:
                                    138 ;	../src/stm8s_it.c: 213: }
      009C0A 80               [11]  139 	iret
                                    140 ;	../src/stm8s_it.c: 220: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    141 ;	-----------------------------------------
                                    142 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    143 ;	-----------------------------------------
      009C0B                        144 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                                    145 ;	../src/stm8s_it.c: 225: }
      009C0B 80               [11]  146 	iret
                                    147 ;	../src/stm8s_it.c: 232: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    148 ;	-----------------------------------------
                                    149 ;	 function TIM1_CAP_COM_IRQHandler
                                    150 ;	-----------------------------------------
      009C0C                        151 _TIM1_CAP_COM_IRQHandler:
                                    152 ;	../src/stm8s_it.c: 237: }
      009C0C 80               [11]  153 	iret
                                    154 ;	../src/stm8s_it.c: 269: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    155 ;	-----------------------------------------
                                    156 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    157 ;	-----------------------------------------
      009C0D                        158 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    159 ;	../src/stm8s_it.c: 274: }
      009C0D 80               [11]  160 	iret
                                    161 ;	../src/stm8s_it.c: 281: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    162 ;	-----------------------------------------
                                    163 ;	 function TIM2_CAP_COM_IRQHandler
                                    164 ;	-----------------------------------------
      009C0E                        165 _TIM2_CAP_COM_IRQHandler:
                                    166 ;	../src/stm8s_it.c: 286: }
      009C0E 80               [11]  167 	iret
                                    168 ;	../src/stm8s_it.c: 323: INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
                                    169 ;	-----------------------------------------
                                    170 ;	 function UART1_TX_IRQHandler
                                    171 ;	-----------------------------------------
      009C0F                        172 _UART1_TX_IRQHandler:
                                    173 ;	../src/stm8s_it.c: 328: }
      009C0F 80               [11]  174 	iret
                                    175 ;	../src/stm8s_it.c: 335: INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
                                    176 ;	-----------------------------------------
                                    177 ;	 function UART1_RX_IRQHandler
                                    178 ;	-----------------------------------------
      009C10                        179 _UART1_RX_IRQHandler:
                                    180 ;	../src/stm8s_it.c: 340: }
      009C10 80               [11]  181 	iret
                                    182 ;	../src/stm8s_it.c: 348: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    183 ;	-----------------------------------------
                                    184 ;	 function I2C_IRQHandler
                                    185 ;	-----------------------------------------
      009C11                        186 _I2C_IRQHandler:
                                    187 ;	../src/stm8s_it.c: 353: }
      009C11 80               [11]  188 	iret
                                    189 ;	../src/stm8s_it.c: 428: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
                                    190 ;	-----------------------------------------
                                    191 ;	 function ADC1_IRQHandler
                                    192 ;	-----------------------------------------
      009C12                        193 _ADC1_IRQHandler:
      009C12 62               [ 2]  194 	div	x, a
                                    195 ;	../src/stm8s_it.c: 430: adcIsr();
      009C13 CD 82 48         [ 4]  196 	call	_adcIsr
                                    197 ;	../src/stm8s_it.c: 434: return;
                                    198 ;	../src/stm8s_it.c: 436: }
      009C16 80               [11]  199 	iret
                                    200 ;	../src/stm8s_it.c: 457: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    201 ;	-----------------------------------------
                                    202 ;	 function TIM4_UPD_OVF_IRQHandler
                                    203 ;	-----------------------------------------
      009C17                        204 _TIM4_UPD_OVF_IRQHandler:
      009C17 62               [ 2]  205 	div	x, a
                                    206 ;	../src/stm8s_it.c: 462: systemTickIsr();
      009C18 CD 84 D8         [ 4]  207 	call	_systemTickIsr
                                    208 ;	../src/stm8s_it.c: 463: }
      009C1B 80               [11]  209 	iret
                                    210 ;	../src/stm8s_it.c: 471: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    211 ;	-----------------------------------------
                                    212 ;	 function EEPROM_EEC_IRQHandler
                                    213 ;	-----------------------------------------
      009C1C                        214 _EEPROM_EEC_IRQHandler:
                                    215 ;	../src/stm8s_it.c: 476: }
      009C1C 80               [11]  216 	iret
                                    217 	.area CODE
                                    218 	.area CONST
                                    219 	.area INITIALIZER
                                    220 	.area CABS (ABS)
