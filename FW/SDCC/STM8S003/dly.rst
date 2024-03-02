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
                                     12 	.globl _buttonState
                                     13 	.globl _sysTick
                                     14 	.globl _sysTickInit
                                     15 	.globl _dly
                                     16 	.globl _ButtonStateUpdate
                                     17 	.globl _ButtonInit
                                     18 	.globl _systemTickIsr
                                     19 	.globl _ReadButtonState
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DATA
      00020D                         24 _sysTick::
      00020D                         25 	.ds 4
      000211                         26 _buttonState::
      000211                         27 	.ds 1
      000212                         28 _ButtonStateUpdate_prev_result_65536_326:
      000212                         29 	.ds 1
      000213                         30 _ButtonStateUpdate_button_sht_ticks_65536_326:
      000213                         31 	.ds 4
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area INITIALIZED
                                     36 ;--------------------------------------------------------
                                     37 ; absolute external ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area DABS (ABS)
                                     40 
                                     41 ; default segment ordering for linker
                                     42 	.area HOME
                                     43 	.area GSINIT
                                     44 	.area GSFINAL
                                     45 	.area CONST
                                     46 	.area INITIALIZER
                                     47 	.area CODE
                                     48 
                                     49 ;--------------------------------------------------------
                                     50 ; global & static initialisations
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area GSINIT
                                     54 	.area GSFINAL
                                     55 	.area GSINIT
                                     56 ;	../src/dly.c: 90: static bool prev_result = FALSE;
      00807D 72 5F 02 12      [ 1]   57 	clr	_ButtonStateUpdate_prev_result_65536_326+0
                                     58 ;	../src/dly.c: 91: static uint32_t button_sht_ticks = 0;
      008081 5F               [ 1]   59 	clrw	x
      008082 CF 02 15         [ 2]   60 	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+2, x
      008085 CF 02 13         [ 2]   61 	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+0, x
                                     62 ;--------------------------------------------------------
                                     63 ; Home
                                     64 ;--------------------------------------------------------
                                     65 	.area HOME
                                     66 	.area HOME
                                     67 ;--------------------------------------------------------
                                     68 ; code
                                     69 ;--------------------------------------------------------
                                     70 	.area CODE
                                     71 ;	../src/dly.c: 45: void sysTickInit( void )
                                     72 ;	-----------------------------------------
                                     73 ;	 function sysTickInit
                                     74 ;	-----------------------------------------
      0084A5                         75 _sysTickInit:
                                     76 ;	../src/dly.c: 47: sysTick = 0;
      0084A5 5F               [ 1]   77 	clrw	x
      0084A6 CF 02 0F         [ 2]   78 	ldw	_sysTick+2, x
      0084A9 CF 02 0D         [ 2]   79 	ldw	_sysTick+0, x
                                     80 ;	../src/dly.c: 48: ButtonInit();
      0084AC CD 85 6B         [ 4]   81 	call	_ButtonInit
                                     82 ;	../src/dly.c: 49: tim4Init();
                                     83 ;	../src/dly.c: 51: }
      0084AF CC 84 B2         [ 2]   84 	jp	_tim4Init
                                     85 ;	../src/dly.c: 62: static void tim4Init( void )
                                     86 ;	-----------------------------------------
                                     87 ;	 function tim4Init
                                     88 ;	-----------------------------------------
      0084B2                         89 _tim4Init:
                                     90 ;	../src/dly.c: 64: TIM4->PSCR = TIM4_PRESCALER_64; //tim_clk = 250K, time_resolution = 4us
      0084B2 35 06 53 47      [ 1]   91 	mov	0x5347+0, #0x06
                                     92 ;	../src/dly.c: 65: TIM4->CR1 = (TIM4_CR1_ARPE);
      0084B6 35 80 53 40      [ 1]   93 	mov	0x5340+0, #0x80
                                     94 ;	../src/dly.c: 66: TIM4->IER = TIM4_IER_UIE;
      0084BA 35 01 53 43      [ 1]   95 	mov	0x5343+0, #0x01
                                     96 ;	../src/dly.c: 67: TIM4->ARR = TIMER_VALUE_FOR_SYSTICK;
      0084BE 35 FA 53 48      [ 1]   97 	mov	0x5348+0, #0xfa
                                     98 ;	../src/dly.c: 68: TIM4->CR1 |= TIM4_CR1_CEN;
      0084C2 72 10 53 40      [ 1]   99 	bset	21312, #0
                                    100 ;	../src/dly.c: 69: }
      0084C6 81               [ 4]  101 	ret
                                    102 ;	../src/dly.c: 82: void dly(uint32_t dt)
                                    103 ;	-----------------------------------------
                                    104 ;	 function dly
                                    105 ;	-----------------------------------------
      0084C7                        106 _dly:
                                    107 ;	../src/dly.c: 84: uint32_t destSysTick = sysTick+dt;
      0084C7 90 CE 02 0F      [ 2]  108 	ldw	y, _sysTick+2
      0084CB 72 F9 05         [ 2]  109 	addw	y, (0x05, sp)
      0084CE CE 02 0D         [ 2]  110 	ldw	x, _sysTick+0
      0084D1 24 01            [ 1]  111 	jrnc	00111$
      0084D3 5C               [ 1]  112 	incw	x
      0084D4                        113 00111$:
      0084D4 72 FB 03         [ 2]  114 	addw	x, (0x03, sp)
                                    115 ;	../src/dly.c: 85: while(destSysTick!=sysTick);
      0084D7                        116 00101$:
      0084D7 90 C3 02 0F      [ 2]  117 	cpw	y, _sysTick+2
      0084DB 26 FA            [ 1]  118 	jrne	00101$
      0084DD C3 02 0D         [ 2]  119 	cpw	x, _sysTick+0
      0084E0 26 F5            [ 1]  120 	jrne	00101$
      0084E2 81               [ 4]  121 	ret
      0084E3 20 F2            [ 2]  122 	jra	00101$
                                    123 ;	../src/dly.c: 86: }
      0084E5 81               [ 4]  124 	ret
                                    125 ;	../src/dly.c: 89: void ButtonStateUpdate(){
                                    126 ;	-----------------------------------------
                                    127 ;	 function ButtonStateUpdate
                                    128 ;	-----------------------------------------
      0084E6                        129 _ButtonStateUpdate:
                                    130 ;	../src/dly.c: 92: bool current_result = (0 == (BUTTON_PIN_PORT->IDR & BUTTON_PIN_NO));
      0084E6 C6 50 10         [ 1]  131 	ld	a, 0x5010
      0084E9 A4 10            [ 1]  132 	and	a, #0x10
      0084EB A0 00            [ 1]  133 	sub	a, #0x00
      0084ED 26 02            [ 1]  134 	jrne	00154$
      0084EF 4C               [ 1]  135 	inc	a
      0084F0 21                     136 	.byte 0x21
      0084F1                        137 00154$:
      0084F1 4F               [ 1]  138 	clr	a
      0084F2                        139 00155$:
                                    140 ;	../src/dly.c: 95: if(current_result && !prev_result){
      0084F2 4D               [ 1]  141 	tnz	a
      0084F3 27 11            [ 1]  142 	jreq	00102$
      0084F5 72 5D 02 12      [ 1]  143 	tnz	_ButtonStateUpdate_prev_result_65536_326+0
      0084F9 26 0B            [ 1]  144 	jrne	00102$
                                    145 ;	../src/dly.c: 96: prev_result = current_result;
      0084FB C7 02 12         [ 1]  146 	ld	_ButtonStateUpdate_prev_result_65536_326+0, a
                                    147 ;	../src/dly.c: 97: button_sht_ticks = 0;
      0084FE 5F               [ 1]  148 	clrw	x
      0084FF CF 02 15         [ 2]  149 	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+2, x
      008502 CF 02 13         [ 2]  150 	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+0, x
                                    151 ;	../src/dly.c: 98: return;
      008505 81               [ 4]  152 	ret
      008506                        153 00102$:
                                    154 ;	../src/dly.c: 101: if(!current_result && prev_result){
      008506 4D               [ 1]  155 	tnz	a
      008507 26 41            [ 1]  156 	jrne	00111$
      008509 72 5D 02 12      [ 1]  157 	tnz	_ButtonStateUpdate_prev_result_65536_326+0
      00850D 27 3B            [ 1]  158 	jreq	00111$
                                    159 ;	../src/dly.c: 102: prev_result = current_result;
      00850F C7 02 12         [ 1]  160 	ld	_ButtonStateUpdate_prev_result_65536_326+0, a
                                    161 ;	../src/dly.c: 104: if(button_sht_ticks > 2000) buttonState = BUTTON_LNG_PRESSED;
      008512 AE 07 D0         [ 2]  162 	ldw	x, #0x07d0
      008515 C3 02 15         [ 2]  163 	cpw	x, _ButtonStateUpdate_button_sht_ticks_65536_326+2
      008518 4F               [ 1]  164 	clr	a
      008519 C2 02 14         [ 1]  165 	sbc	a, _ButtonStateUpdate_button_sht_ticks_65536_326+1
      00851C 4F               [ 1]  166 	clr	a
      00851D C2 02 13         [ 1]  167 	sbc	a, _ButtonStateUpdate_button_sht_ticks_65536_326+0
      008520 24 06            [ 1]  168 	jrnc	00108$
      008522 35 02 02 11      [ 1]  169 	mov	_buttonState+0, #0x02
      008526 20 1A            [ 2]  170 	jra	00109$
      008528                        171 00108$:
                                    172 ;	../src/dly.c: 105: else if(button_sht_ticks > 500) buttonState = BUTTON_SHT_PRESSED;
      008528 AE 01 F4         [ 2]  173 	ldw	x, #0x01f4
      00852B C3 02 15         [ 2]  174 	cpw	x, _ButtonStateUpdate_button_sht_ticks_65536_326+2
      00852E 4F               [ 1]  175 	clr	a
      00852F C2 02 14         [ 1]  176 	sbc	a, _ButtonStateUpdate_button_sht_ticks_65536_326+1
      008532 4F               [ 1]  177 	clr	a
      008533 C2 02 13         [ 1]  178 	sbc	a, _ButtonStateUpdate_button_sht_ticks_65536_326+0
      008536 24 06            [ 1]  179 	jrnc	00105$
      008538 35 01 02 11      [ 1]  180 	mov	_buttonState+0, #0x01
      00853C 20 04            [ 2]  181 	jra	00109$
      00853E                        182 00105$:
                                    183 ;	../src/dly.c: 106: else buttonState = BUTTON_NOT_PRESSED;
      00853E 72 5F 02 11      [ 1]  184 	clr	_buttonState+0
      008542                        185 00109$:
                                    186 ;	../src/dly.c: 107: button_sht_ticks = 0;
      008542 5F               [ 1]  187 	clrw	x
      008543 CF 02 15         [ 2]  188 	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+2, x
      008546 CF 02 13         [ 2]  189 	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+0, x
                                    190 ;	../src/dly.c: 108: return;
      008549 81               [ 4]  191 	ret
      00854A                        192 00111$:
                                    193 ;	../src/dly.c: 112: if(current_result){
      00854A 4D               [ 1]  194 	tnz	a
      00854B 27 16            [ 1]  195 	jreq	00114$
                                    196 ;	../src/dly.c: 113: button_sht_ticks++;
      00854D CE 02 15         [ 2]  197 	ldw	x, _ButtonStateUpdate_button_sht_ticks_65536_326+2
      008550 1C 00 01         [ 2]  198 	addw	x, #0x0001
      008553 90 CE 02 13      [ 2]  199 	ldw	y, _ButtonStateUpdate_button_sht_ticks_65536_326+0
      008557 24 02            [ 1]  200 	jrnc	00163$
      008559 90 5C            [ 1]  201 	incw	y
      00855B                        202 00163$:
      00855B CF 02 15         [ 2]  203 	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+2, x
      00855E 90 CF 02 13      [ 2]  204 	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+0, y
      008562 81               [ 4]  205 	ret
      008563                        206 00114$:
                                    207 ;	../src/dly.c: 115: button_sht_ticks = 0;
      008563 5F               [ 1]  208 	clrw	x
      008564 CF 02 15         [ 2]  209 	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+2, x
      008567 CF 02 13         [ 2]  210 	ldw	_ButtonStateUpdate_button_sht_ticks_65536_326+0, x
                                    211 ;	../src/dly.c: 117: }
      00856A 81               [ 4]  212 	ret
                                    213 ;	../src/dly.c: 119: void ButtonInit(){
                                    214 ;	-----------------------------------------
                                    215 ;	 function ButtonInit
                                    216 ;	-----------------------------------------
      00856B                        217 _ButtonInit:
                                    218 ;	../src/dly.c: 120: BUTTON_PIN_PORT->CR2 &= (~BUTTON_PIN_NO); //Reset corresponding bit
      00856B 72 19 50 13      [ 1]  219 	bres	20499, #4
                                    220 ;	../src/dly.c: 121: BUTTON_PIN_PORT->DDR &= BUTTON_PIN_NO; // Input mode 
      00856F C6 50 11         [ 1]  221 	ld	a, 0x5011
      008572 A4 10            [ 1]  222 	and	a, #0x10
      008574 C7 50 11         [ 1]  223 	ld	0x5011, a
                                    224 ;	../src/dly.c: 122: BUTTON_PIN_PORT->CR1 &= ~BUTTON_PIN_NO; //open drain here
      008577 72 19 50 12      [ 1]  225 	bres	20498, #4
                                    226 ;	../src/dly.c: 123: }
      00857B 81               [ 4]  227 	ret
                                    228 ;	../src/dly.c: 137: void systemTickIsr (void)
                                    229 ;	-----------------------------------------
                                    230 ;	 function systemTickIsr
                                    231 ;	-----------------------------------------
      00857C                        232 _systemTickIsr:
                                    233 ;	../src/dly.c: 139: sysTick++;
      00857C CE 02 0F         [ 2]  234 	ldw	x, _sysTick+2
      00857F 90 CE 02 0D      [ 2]  235 	ldw	y, _sysTick+0
      008583 5C               [ 1]  236 	incw	x
      008584 26 02            [ 1]  237 	jrne	00103$
      008586 90 5C            [ 1]  238 	incw	y
      008588                        239 00103$:
      008588 CF 02 0F         [ 2]  240 	ldw	_sysTick+2, x
      00858B 90 CF 02 0D      [ 2]  241 	ldw	_sysTick+0, y
                                    242 ;	../src/dly.c: 140: TIM4->SR1 = ~TIM4_SR1_UIF;
      00858F 35 FE 53 44      [ 1]  243 	mov	0x5344+0, #0xfe
                                    244 ;	../src/dly.c: 141: UpdateLeds();
      008593 CD 86 D9         [ 4]  245 	call	_UpdateLeds
                                    246 ;	../src/dly.c: 142: ButtonStateUpdate();
                                    247 ;	../src/dly.c: 143: }
      008596 CC 84 E6         [ 2]  248 	jp	_ButtonStateUpdate
                                    249 ;	../src/dly.c: 146: enum button_state_t ReadButtonState()
                                    250 ;	-----------------------------------------
                                    251 ;	 function ReadButtonState
                                    252 ;	-----------------------------------------
      008599                        253 _ReadButtonState:
                                    254 ;	../src/dly.c: 148: enum button_state_t bs = buttonState;
      008599 C6 02 11         [ 1]  255 	ld	a, _buttonState+0
                                    256 ;	../src/dly.c: 149: buttonState = BUTTON_NOT_PRESSED;
      00859C 72 5F 02 11      [ 1]  257 	clr	_buttonState+0
                                    258 ;	../src/dly.c: 150: return bs;
                                    259 ;	../src/dly.c: 151: }
      0085A0 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area CONST
                                    263 	.area INITIALIZER
                                    264 	.area CABS (ABS)
