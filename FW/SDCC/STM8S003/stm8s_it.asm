;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Linux)
;--------------------------------------------------------
	.module stm8s_it
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _adcIsr
	.globl _systemTickIsr
	.globl _TRAP_IRQHandler
	.globl _TLI_IRQHandler
	.globl _AWU_IRQHandler
	.globl _CLK_IRQHandler
	.globl _EXTI_PORTA_IRQHandler
	.globl _EXTI_PORTB_IRQHandler
	.globl _EXTI_PORTC_IRQHandler
	.globl _EXTI_PORTD_IRQHandler
	.globl _EXTI_PORTE_IRQHandler
	.globl _SPI_IRQHandler
	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
	.globl _TIM1_CAP_COM_IRQHandler
	.globl _TIM2_UPD_OVF_BRK_IRQHandler
	.globl _TIM2_CAP_COM_IRQHandler
	.globl _UART1_TX_IRQHandler
	.globl _UART1_RX_IRQHandler
	.globl _I2C_IRQHandler
	.globl _ADC1_IRQHandler
	.globl _TIM4_UPD_OVF_IRQHandler
	.globl _EEPROM_EEC_IRQHandler
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
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
	G$TRAP_IRQHandler$0$0 ==.
	C$stm8s_it.c$62$0_0$313 ==.
;	../src/stm8s_it.c: 62: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
; genLabel
;	-----------------------------------------
;	 function TRAP_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TRAP_IRQHandler:
	C$stm8s_it.c$67$0_0$313 ==.
;	../src/stm8s_it.c: 67: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$67$0_0$313 ==.
	XG$TRAP_IRQHandler$0$0 ==.
	iret
	G$TLI_IRQHandler$0$0 ==.
	C$stm8s_it.c$73$0_0$315 ==.
;	../src/stm8s_it.c: 73: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
; genLabel
;	-----------------------------------------
;	 function TLI_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TLI_IRQHandler:
	C$stm8s_it.c$78$0_0$315 ==.
;	../src/stm8s_it.c: 78: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$78$0_0$315 ==.
	XG$TLI_IRQHandler$0$0 ==.
	iret
	G$AWU_IRQHandler$0$0 ==.
	C$stm8s_it.c$85$0_0$317 ==.
;	../src/stm8s_it.c: 85: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
; genLabel
;	-----------------------------------------
;	 function AWU_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_AWU_IRQHandler:
	C$stm8s_it.c$90$0_0$317 ==.
;	../src/stm8s_it.c: 90: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$90$0_0$317 ==.
	XG$AWU_IRQHandler$0$0 ==.
	iret
	G$CLK_IRQHandler$0$0 ==.
	C$stm8s_it.c$97$0_0$319 ==.
;	../src/stm8s_it.c: 97: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
; genLabel
;	-----------------------------------------
;	 function CLK_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_IRQHandler:
	C$stm8s_it.c$102$0_0$319 ==.
;	../src/stm8s_it.c: 102: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$102$0_0$319 ==.
	XG$CLK_IRQHandler$0$0 ==.
	iret
	G$EXTI_PORTA_IRQHandler$0$0 ==.
	C$stm8s_it.c$109$0_0$321 ==.
;	../src/stm8s_it.c: 109: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
; genLabel
;	-----------------------------------------
;	 function EXTI_PORTA_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_EXTI_PORTA_IRQHandler:
	C$stm8s_it.c$114$0_0$321 ==.
;	../src/stm8s_it.c: 114: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$114$0_0$321 ==.
	XG$EXTI_PORTA_IRQHandler$0$0 ==.
	iret
	G$EXTI_PORTB_IRQHandler$0$0 ==.
	C$stm8s_it.c$121$0_0$323 ==.
;	../src/stm8s_it.c: 121: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
; genLabel
;	-----------------------------------------
;	 function EXTI_PORTB_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_EXTI_PORTB_IRQHandler:
	C$stm8s_it.c$126$0_0$323 ==.
;	../src/stm8s_it.c: 126: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$126$0_0$323 ==.
	XG$EXTI_PORTB_IRQHandler$0$0 ==.
	iret
	G$EXTI_PORTC_IRQHandler$0$0 ==.
	C$stm8s_it.c$133$0_0$325 ==.
;	../src/stm8s_it.c: 133: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
; genLabel
;	-----------------------------------------
;	 function EXTI_PORTC_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_EXTI_PORTC_IRQHandler:
	C$stm8s_it.c$138$0_0$325 ==.
;	../src/stm8s_it.c: 138: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$138$0_0$325 ==.
	XG$EXTI_PORTC_IRQHandler$0$0 ==.
	iret
	G$EXTI_PORTD_IRQHandler$0$0 ==.
	C$stm8s_it.c$145$0_0$327 ==.
;	../src/stm8s_it.c: 145: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
; genLabel
;	-----------------------------------------
;	 function EXTI_PORTD_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_EXTI_PORTD_IRQHandler:
	C$stm8s_it.c$150$0_0$327 ==.
;	../src/stm8s_it.c: 150: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$150$0_0$327 ==.
	XG$EXTI_PORTD_IRQHandler$0$0 ==.
	iret
	G$EXTI_PORTE_IRQHandler$0$0 ==.
	C$stm8s_it.c$157$0_0$329 ==.
;	../src/stm8s_it.c: 157: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
; genLabel
;	-----------------------------------------
;	 function EXTI_PORTE_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_EXTI_PORTE_IRQHandler:
	C$stm8s_it.c$162$0_0$329 ==.
;	../src/stm8s_it.c: 162: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$162$0_0$329 ==.
	XG$EXTI_PORTE_IRQHandler$0$0 ==.
	iret
	G$SPI_IRQHandler$0$0 ==.
	C$stm8s_it.c$208$0_0$331 ==.
;	../src/stm8s_it.c: 208: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
; genLabel
;	-----------------------------------------
;	 function SPI_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_SPI_IRQHandler:
	C$stm8s_it.c$213$0_0$331 ==.
;	../src/stm8s_it.c: 213: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$213$0_0$331 ==.
	XG$SPI_IRQHandler$0$0 ==.
	iret
	G$TIM1_UPD_OVF_TRG_BRK_IRQHandler$0$0 ==.
	C$stm8s_it.c$220$0_0$333 ==.
;	../src/stm8s_it.c: 220: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
; genLabel
;	-----------------------------------------
;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
	C$stm8s_it.c$225$0_0$333 ==.
;	../src/stm8s_it.c: 225: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$225$0_0$333 ==.
	XG$TIM1_UPD_OVF_TRG_BRK_IRQHandler$0$0 ==.
	iret
	G$TIM1_CAP_COM_IRQHandler$0$0 ==.
	C$stm8s_it.c$232$0_0$335 ==.
;	../src/stm8s_it.c: 232: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
; genLabel
;	-----------------------------------------
;	 function TIM1_CAP_COM_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM1_CAP_COM_IRQHandler:
	C$stm8s_it.c$237$0_0$335 ==.
;	../src/stm8s_it.c: 237: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$237$0_0$335 ==.
	XG$TIM1_CAP_COM_IRQHandler$0$0 ==.
	iret
	G$TIM2_UPD_OVF_BRK_IRQHandler$0$0 ==.
	C$stm8s_it.c$269$0_0$337 ==.
;	../src/stm8s_it.c: 269: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
; genLabel
;	-----------------------------------------
;	 function TIM2_UPD_OVF_BRK_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM2_UPD_OVF_BRK_IRQHandler:
	C$stm8s_it.c$274$0_0$337 ==.
;	../src/stm8s_it.c: 274: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$274$0_0$337 ==.
	XG$TIM2_UPD_OVF_BRK_IRQHandler$0$0 ==.
	iret
	G$TIM2_CAP_COM_IRQHandler$0$0 ==.
	C$stm8s_it.c$281$0_0$339 ==.
;	../src/stm8s_it.c: 281: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
; genLabel
;	-----------------------------------------
;	 function TIM2_CAP_COM_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM2_CAP_COM_IRQHandler:
	C$stm8s_it.c$286$0_0$339 ==.
;	../src/stm8s_it.c: 286: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$286$0_0$339 ==.
	XG$TIM2_CAP_COM_IRQHandler$0$0 ==.
	iret
	G$UART1_TX_IRQHandler$0$0 ==.
	C$stm8s_it.c$323$0_0$341 ==.
;	../src/stm8s_it.c: 323: INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
; genLabel
;	-----------------------------------------
;	 function UART1_TX_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_UART1_TX_IRQHandler:
	C$stm8s_it.c$328$0_0$341 ==.
;	../src/stm8s_it.c: 328: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$328$0_0$341 ==.
	XG$UART1_TX_IRQHandler$0$0 ==.
	iret
	G$UART1_RX_IRQHandler$0$0 ==.
	C$stm8s_it.c$335$0_0$343 ==.
;	../src/stm8s_it.c: 335: INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
; genLabel
;	-----------------------------------------
;	 function UART1_RX_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_UART1_RX_IRQHandler:
	C$stm8s_it.c$340$0_0$343 ==.
;	../src/stm8s_it.c: 340: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$340$0_0$343 ==.
	XG$UART1_RX_IRQHandler$0$0 ==.
	iret
	G$I2C_IRQHandler$0$0 ==.
	C$stm8s_it.c$348$0_0$345 ==.
;	../src/stm8s_it.c: 348: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
; genLabel
;	-----------------------------------------
;	 function I2C_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_I2C_IRQHandler:
	C$stm8s_it.c$353$0_0$345 ==.
;	../src/stm8s_it.c: 353: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$353$0_0$345 ==.
	XG$I2C_IRQHandler$0$0 ==.
	iret
	G$ADC1_IRQHandler$0$0 ==.
	C$stm8s_it.c$428$0_0$346 ==.
;	../src/stm8s_it.c: 428: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
; genLabel
;	-----------------------------------------
;	 function ADC1_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_ADC1_IRQHandler:
;	Reset bit 6 of reg CC. Hardware bug workaround.
	div	x, a
	C$stm8s_it.c$430$1_0$346 ==.
;	../src/stm8s_it.c: 430: adcIsr();
; genCall
	call	_adcIsr
	C$stm8s_it.c$434$1_0$346 ==.
;	../src/stm8s_it.c: 434: return;
; genReturn
; genLabel
00101$:
	C$stm8s_it.c$436$1_0$346 ==.
;	../src/stm8s_it.c: 436: }
; genEndFunction
	C$stm8s_it.c$436$1_0$346 ==.
	XG$ADC1_IRQHandler$0$0 ==.
	iret
	G$TIM4_UPD_OVF_IRQHandler$0$0 ==.
	C$stm8s_it.c$457$1_0$347 ==.
;	../src/stm8s_it.c: 457: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
; genLabel
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_UPD_OVF_IRQHandler:
;	Reset bit 6 of reg CC. Hardware bug workaround.
	div	x, a
	C$stm8s_it.c$462$1_0$347 ==.
;	../src/stm8s_it.c: 462: systemTickIsr();
; genCall
	call	_systemTickIsr
; genLabel
00101$:
	C$stm8s_it.c$463$1_0$347 ==.
;	../src/stm8s_it.c: 463: }
; genEndFunction
	C$stm8s_it.c$463$1_0$347 ==.
	XG$TIM4_UPD_OVF_IRQHandler$0$0 ==.
	iret
	G$EEPROM_EEC_IRQHandler$0$0 ==.
	C$stm8s_it.c$471$1_0$349 ==.
;	../src/stm8s_it.c: 471: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
; genLabel
;	-----------------------------------------
;	 function EEPROM_EEC_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_EEPROM_EEC_IRQHandler:
	C$stm8s_it.c$476$1_0$349 ==.
;	../src/stm8s_it.c: 476: }
; genLabel
00101$:
; genEndFunction
	C$stm8s_it.c$476$1_0$349 ==.
	XG$EEPROM_EEC_IRQHandler$0$0 ==.
	iret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
