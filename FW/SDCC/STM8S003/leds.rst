                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.1.0 #12072 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module leds
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _leds_cathode
                                     12 	.globl _leds_anode
                                     13 	.globl _LedsInit
                                     14 	.globl _UpdateLedState
                                     15 	.globl _SetLedRaw
                                     16 	.globl _GetLedState
                                     17 	.globl _SetLedState
                                     18 ;--------------------------------------------------------
                                     19 ; ram data
                                     20 ;--------------------------------------------------------
                                     21 	.area DATA
      000241                         22 _ledsState:
      000241                         23 	.ds 2
      000243                         24 _UpdateLedState_ledId_65536_325:
      000243                         25 	.ds 1
      000244                         26 _UpdateLedState_ledIdPrev_65536_325:
      000244                         27 	.ds 1
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area INITIALIZED
                                     32 ;--------------------------------------------------------
                                     33 ; absolute external ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DABS (ABS)
                                     36 
                                     37 ; default segment ordering for linker
                                     38 	.area HOME
                                     39 	.area GSINIT
                                     40 	.area GSFINAL
                                     41 	.area CONST
                                     42 	.area INITIALIZER
                                     43 	.area CODE
                                     44 
                                     45 ;--------------------------------------------------------
                                     46 ; global & static initialisations
                                     47 ;--------------------------------------------------------
                                     48 	.area HOME
                                     49 	.area GSINIT
                                     50 	.area GSFINAL
                                     51 	.area GSINIT
                                     52 ;	../src/leds.c: 97: static uint8_t ledId = 0;
      00807D 72 5F 02 43      [ 1]   53 	clr	_UpdateLedState_ledId_65536_325+0
                                     54 ;	../src/leds.c: 98: static uint8_t ledIdPrev = NUM_OF_LEDS-1;
      008081 35 0B 02 44      [ 1]   55 	mov	_UpdateLedState_ledIdPrev_65536_325+0, #0x0b
                                     56 ;--------------------------------------------------------
                                     57 ; Home
                                     58 ;--------------------------------------------------------
                                     59 	.area HOME
                                     60 	.area HOME
                                     61 ;--------------------------------------------------------
                                     62 ; code
                                     63 ;--------------------------------------------------------
                                     64 	.area CODE
                                     65 ;	../src/leds.c: 55: void LedsInit( void )
                                     66 ;	-----------------------------------------
                                     67 ;	 function LedsInit
                                     68 ;	-----------------------------------------
      008652                         69 _LedsInit:
                                     70 ;	../src/leds.c: 57: ledsState = 0x00;
      008652 5F               [ 1]   71 	clrw	x
      008653 CF 02 41         [ 2]   72 	ldw	_ledsState+0, x
                                     73 ;	../src/leds.c: 58: GpioInit();
                                     74 ;	../src/leds.c: 59: }
      008656 CC 86 59         [ 2]   75 	jp	_GpioInit
                                     76 ;	../src/leds.c: 72: static void GpioInit( void ){
                                     77 ;	-----------------------------------------
                                     78 ;	 function GpioInit
                                     79 ;	-----------------------------------------
      008659                         80 _GpioInit:
                                     81 ;	../src/leds.c: 75: for(idx = 0; idx < NUM_OF_LEDS; idx++){
      008659 4F               [ 1]   82 	clr	a
      00865A                         83 00102$:
                                     84 ;	../src/leds.c: 76: SetLedRaw(idx, LED_OFF_STATE);
      00865A 88               [ 1]   85 	push	a
      00865B 4B 00            [ 1]   86 	push	#0x00
      00865D 88               [ 1]   87 	push	a
      00865E CD 86 9F         [ 4]   88 	call	_SetLedRaw
      008661 85               [ 2]   89 	popw	x
      008662 84               [ 1]   90 	pop	a
                                     91 ;	../src/leds.c: 75: for(idx = 0; idx < NUM_OF_LEDS; idx++){
      008663 4C               [ 1]   92 	inc	a
      008664 A1 0C            [ 1]   93 	cp	a, #0x0c
      008666 25 F2            [ 1]   94 	jrc	00102$
                                     95 ;	../src/leds.c: 78: }
      008668 81               [ 4]   96 	ret
                                     97 ;	../src/leds.c: 95: void UpdateLedState( void )
                                     98 ;	-----------------------------------------
                                     99 ;	 function UpdateLedState
                                    100 ;	-----------------------------------------
      008669                        101 _UpdateLedState:
                                    102 ;	../src/leds.c: 101: ledId = (ledId == NUM_OF_LEDS-1)?0:(ledId+1);
      008669 C6 02 43         [ 1]  103 	ld	a, _UpdateLedState_ledId_65536_325+0
      00866C A1 0B            [ 1]  104 	cp	a, #0x0b
      00866E 26 03            [ 1]  105 	jrne	00103$
      008670 4F               [ 1]  106 	clr	a
      008671 20 0A            [ 2]  107 	jra	00104$
      008673                        108 00103$:
      008673 C6 02 43         [ 1]  109 	ld	a, _UpdateLedState_ledId_65536_325+0
      008676 4C               [ 1]  110 	inc	a
      008677 88               [ 1]  111 	push	a
      008678 49               [ 1]  112 	rlc	a
      008679 4F               [ 1]  113 	clr	a
      00867A A2 00            [ 1]  114 	sbc	a, #0x00
      00867C 84               [ 1]  115 	pop	a
      00867D                        116 00104$:
      00867D C7 02 43         [ 1]  117 	ld	_UpdateLedState_ledId_65536_325+0, a
                                    118 ;	../src/leds.c: 103: SetLedRaw(ledIdPrev, LED_OFF_STATE);
      008680 4B 00            [ 1]  119 	push	#0x00
      008682 3B 02 44         [ 1]  120 	push	_UpdateLedState_ledIdPrev_65536_325+0
      008685 CD 86 9F         [ 4]  121 	call	_SetLedRaw
      008688 85               [ 2]  122 	popw	x
                                    123 ;	../src/leds.c: 104: SetLedRaw(ledId,GetLedState(ledId));
      008689 3B 02 43         [ 1]  124 	push	_UpdateLedState_ledId_65536_325+0
      00868C CD 87 62         [ 4]  125 	call	_GetLedState
      00868F 5B 01            [ 2]  126 	addw	sp, #1
      008691 88               [ 1]  127 	push	a
      008692 3B 02 43         [ 1]  128 	push	_UpdateLedState_ledId_65536_325+0
      008695 CD 86 9F         [ 4]  129 	call	_SetLedRaw
      008698 85               [ 2]  130 	popw	x
                                    131 ;	../src/leds.c: 105: ledIdPrev = ledId; 
      008699 55 02 43 02 44   [ 1]  132 	mov	_UpdateLedState_ledIdPrev_65536_325+0, _UpdateLedState_ledId_65536_325+0
                                    133 ;	../src/leds.c: 106: }
      00869E 81               [ 4]  134 	ret
                                    135 ;	../src/leds.c: 126: void SetLedRaw(uint8_t ledId, uint8_t state){
                                    136 ;	-----------------------------------------
                                    137 ;	 function SetLedRaw
                                    138 ;	-----------------------------------------
      00869F                        139 _SetLedRaw:
      00869F 52 0E            [ 2]  140 	sub	sp, #14
                                    141 ;	../src/leds.c: 128: if(ledId >= NUM_OF_LEDS) return;
      0086A1 7B 11            [ 1]  142 	ld	a, (0x11, sp)
      0086A3 A1 0C            [ 1]  143 	cp	a, #0x0c
      0086A5 25 03            [ 1]  144 	jrc	00102$
      0086A7 CC 87 5F         [ 2]  145 	jp	00106$
      0086AA                        146 00102$:
                                    147 ;	../src/leds.c: 129: ledId = ledId << 1;
      0086AA 08 11            [ 1]  148 	sll	(0x11, sp)
                                    149 ;	../src/leds.c: 131: GPIO_TypeDef * gpioPortPos = (GPIO_TypeDef * )leds_anode[ledId];
      0086AC 5F               [ 1]  150 	clrw	x
      0086AD 7B 11            [ 1]  151 	ld	a, (0x11, sp)
      0086AF 97               [ 1]  152 	ld	xl, a
      0086B0 58               [ 2]  153 	sllw	x
      0086B1 90 93            [ 1]  154 	ldw	y, x
      0086B3 DE 80 A2         [ 2]  155 	ldw	x, (_leds_anode+0, x)
      0086B6 1F 02            [ 2]  156 	ldw	(0x02, sp), x
                                    157 ;	../src/leds.c: 132: GPIO_TypeDef * gpioPortNeg = (GPIO_TypeDef *) leds_cathode[ledId];
      0086B8 93               [ 1]  158 	ldw	x, y
      0086B9 1C 80 D2         [ 2]  159 	addw	x, #(_leds_cathode+0)
      0086BC FE               [ 2]  160 	ldw	x, (x)
      0086BD 1F 04            [ 2]  161 	ldw	(0x04, sp), x
                                    162 ;	../src/leds.c: 133: uint8_t gpioPinPos = leds_anode[ledId+1];
      0086BF 7B 11            [ 1]  163 	ld	a, (0x11, sp)
      0086C1 4C               [ 1]  164 	inc	a
      0086C2 97               [ 1]  165 	ld	xl, a
      0086C3 49               [ 1]  166 	rlc	a
      0086C4 4F               [ 1]  167 	clr	a
      0086C5 A2 00            [ 1]  168 	sbc	a, #0x00
      0086C7 95               [ 1]  169 	ld	xh, a
      0086C8 58               [ 2]  170 	sllw	x
      0086C9 90 93            [ 1]  171 	ldw	y, x
      0086CB 1C 80 A2         [ 2]  172 	addw	x, #(_leds_anode+0)
      0086CE E6 01            [ 1]  173 	ld	a, (0x1, x)
      0086D0 6B 0E            [ 1]  174 	ld	(0x0e, sp), a
                                    175 ;	../src/leds.c: 134: uint8_t gpioPinNeg = leds_cathode[ledId+1];
      0086D2 93               [ 1]  176 	ldw	x, y
      0086D3 1C 80 D2         [ 2]  177 	addw	x, #(_leds_cathode+0)
      0086D6 E6 01            [ 1]  178 	ld	a, (0x1, x)
      0086D8 6B 01            [ 1]  179 	ld	(0x01, sp), a
                                    180 ;	../src/leds.c: 138: gpioPortPos->ODR |= (gpioPinPos);
      0086DA 1E 02            [ 2]  181 	ldw	x, (0x02, sp)
      0086DC F6               [ 1]  182 	ld	a, (x)
      0086DD 6B 06            [ 1]  183 	ld	(0x06, sp), a
                                    184 ;	../src/leds.c: 139: gpioPortNeg->ODR &= ~(gpioPinNeg);
      0086DF 7B 01            [ 1]  185 	ld	a, (0x01, sp)
      0086E1 43               [ 1]  186 	cpl	a
      0086E2 6B 07            [ 1]  187 	ld	(0x07, sp), a
                                    188 ;	../src/leds.c: 141: gpioPortPos->DDR |= gpioPinPos;
      0086E4 1E 02            [ 2]  189 	ldw	x, (0x02, sp)
      0086E6 5C               [ 1]  190 	incw	x
      0086E7 5C               [ 1]  191 	incw	x
      0086E8 1F 08            [ 2]  192 	ldw	(0x08, sp), x
                                    193 ;	../src/leds.c: 142: gpioPortNeg->DDR |= gpioPinNeg;
      0086EA 1E 04            [ 2]  194 	ldw	x, (0x04, sp)
      0086EC 5C               [ 1]  195 	incw	x
      0086ED 5C               [ 1]  196 	incw	x
      0086EE 1F 0A            [ 2]  197 	ldw	(0x0a, sp), x
                                    198 ;	../src/leds.c: 143: gpioPortPos->CR1 |= gpioPinPos;
      0086F0 16 02            [ 2]  199 	ldw	y, (0x02, sp)
      0086F2 72 A9 00 03      [ 2]  200 	addw	y, #0x0003
                                    201 ;	../src/leds.c: 144: gpioPortNeg->CR1 |= gpioPinNeg;
      0086F6 1E 04            [ 2]  202 	ldw	x, (0x04, sp)
      0086F8 1C 00 03         [ 2]  203 	addw	x, #0x0003
      0086FB 1F 0C            [ 2]  204 	ldw	(0x0c, sp), x
                                    205 ;	../src/leds.c: 136: if(state) //turn on
      0086FD 0D 12            [ 1]  206 	tnz	(0x12, sp)
      0086FF 27 2F            [ 1]  207 	jreq	00104$
                                    208 ;	../src/leds.c: 138: gpioPortPos->ODR |= (gpioPinPos);
      008701 7B 06            [ 1]  209 	ld	a, (0x06, sp)
      008703 1A 0E            [ 1]  210 	or	a, (0x0e, sp)
      008705 1E 02            [ 2]  211 	ldw	x, (0x02, sp)
      008707 F7               [ 1]  212 	ld	(x), a
                                    213 ;	../src/leds.c: 139: gpioPortNeg->ODR &= ~(gpioPinNeg);
      008708 1E 04            [ 2]  214 	ldw	x, (0x04, sp)
      00870A F6               [ 1]  215 	ld	a, (x)
      00870B 14 07            [ 1]  216 	and	a, (0x07, sp)
      00870D 1E 04            [ 2]  217 	ldw	x, (0x04, sp)
      00870F F7               [ 1]  218 	ld	(x), a
                                    219 ;	../src/leds.c: 141: gpioPortPos->DDR |= gpioPinPos;
      008710 1E 08            [ 2]  220 	ldw	x, (0x08, sp)
      008712 F6               [ 1]  221 	ld	a, (x)
      008713 1A 0E            [ 1]  222 	or	a, (0x0e, sp)
      008715 1E 08            [ 2]  223 	ldw	x, (0x08, sp)
      008717 F7               [ 1]  224 	ld	(x), a
                                    225 ;	../src/leds.c: 142: gpioPortNeg->DDR |= gpioPinNeg;
      008718 1E 0A            [ 2]  226 	ldw	x, (0x0a, sp)
      00871A F6               [ 1]  227 	ld	a, (x)
      00871B 1A 01            [ 1]  228 	or	a, (0x01, sp)
      00871D 1E 0A            [ 2]  229 	ldw	x, (0x0a, sp)
      00871F F7               [ 1]  230 	ld	(x), a
                                    231 ;	../src/leds.c: 143: gpioPortPos->CR1 |= gpioPinPos;
      008720 90 F6            [ 1]  232 	ld	a, (y)
      008722 1A 0E            [ 1]  233 	or	a, (0x0e, sp)
      008724 90 F7            [ 1]  234 	ld	(y), a
                                    235 ;	../src/leds.c: 144: gpioPortNeg->CR1 |= gpioPinNeg;
      008726 1E 0C            [ 2]  236 	ldw	x, (0x0c, sp)
      008728 F6               [ 1]  237 	ld	a, (x)
      008729 1A 01            [ 1]  238 	or	a, (0x01, sp)
      00872B 1E 0C            [ 2]  239 	ldw	x, (0x0c, sp)
      00872D F7               [ 1]  240 	ld	(x), a
      00872E 20 2F            [ 2]  241 	jra	00106$
      008730                        242 00104$:
                                    243 ;	../src/leds.c: 148: gpioPortPos->ODR &= ~(gpioPinPos);
      008730 03 0E            [ 1]  244 	cpl	(0x0e, sp)
      008732 7B 06            [ 1]  245 	ld	a, (0x06, sp)
      008734 14 0E            [ 1]  246 	and	a, (0x0e, sp)
      008736 1E 02            [ 2]  247 	ldw	x, (0x02, sp)
      008738 F7               [ 1]  248 	ld	(x), a
                                    249 ;	../src/leds.c: 149: gpioPortNeg->ODR &= ~(gpioPinNeg);
      008739 1E 04            [ 2]  250 	ldw	x, (0x04, sp)
      00873B F6               [ 1]  251 	ld	a, (x)
      00873C 14 07            [ 1]  252 	and	a, (0x07, sp)
      00873E 1E 04            [ 2]  253 	ldw	x, (0x04, sp)
      008740 F7               [ 1]  254 	ld	(x), a
                                    255 ;	../src/leds.c: 150: gpioPortPos->DDR &= ~gpioPinPos;
      008741 1E 08            [ 2]  256 	ldw	x, (0x08, sp)
      008743 F6               [ 1]  257 	ld	a, (x)
      008744 14 0E            [ 1]  258 	and	a, (0x0e, sp)
      008746 1E 08            [ 2]  259 	ldw	x, (0x08, sp)
      008748 F7               [ 1]  260 	ld	(x), a
                                    261 ;	../src/leds.c: 151: gpioPortNeg->DDR &= ~gpioPinNeg;
      008749 1E 0A            [ 2]  262 	ldw	x, (0x0a, sp)
      00874B F6               [ 1]  263 	ld	a, (x)
      00874C 14 07            [ 1]  264 	and	a, (0x07, sp)
      00874E 1E 0A            [ 2]  265 	ldw	x, (0x0a, sp)
      008750 F7               [ 1]  266 	ld	(x), a
                                    267 ;	../src/leds.c: 152: gpioPortPos->CR1 &= ~gpioPinPos;
      008751 90 F6            [ 1]  268 	ld	a, (y)
      008753 14 0E            [ 1]  269 	and	a, (0x0e, sp)
      008755 90 F7            [ 1]  270 	ld	(y), a
                                    271 ;	../src/leds.c: 153: gpioPortNeg->CR1 &= ~gpioPinNeg;
      008757 1E 0C            [ 2]  272 	ldw	x, (0x0c, sp)
      008759 F6               [ 1]  273 	ld	a, (x)
      00875A 14 07            [ 1]  274 	and	a, (0x07, sp)
      00875C 1E 0C            [ 2]  275 	ldw	x, (0x0c, sp)
      00875E F7               [ 1]  276 	ld	(x), a
      00875F                        277 00106$:
                                    278 ;	../src/leds.c: 155: }
      00875F 5B 0E            [ 2]  279 	addw	sp, #14
      008761 81               [ 4]  280 	ret
                                    281 ;	../src/leds.c: 158: uint8_t GetLedState(uint8_t ledID)
                                    282 ;	-----------------------------------------
                                    283 ;	 function GetLedState
                                    284 ;	-----------------------------------------
      008762                        285 _GetLedState:
                                    286 ;	../src/leds.c: 161: return (ledsState & (v << ledID))?1:0;
      008762 7B 03            [ 1]  287 	ld	a, (0x03, sp)
      008764 5F               [ 1]  288 	clrw	x
      008765 5C               [ 1]  289 	incw	x
      008766 4D               [ 1]  290 	tnz	a
      008767 27 04            [ 1]  291 	jreq	00111$
      008769                        292 00110$:
      008769 58               [ 2]  293 	sllw	x
      00876A 4A               [ 1]  294 	dec	a
      00876B 26 FC            [ 1]  295 	jrne	00110$
      00876D                        296 00111$:
      00876D 9F               [ 1]  297 	ld	a, xl
      00876E C4 02 42         [ 1]  298 	and	a, _ledsState+1
      008771 02               [ 1]  299 	rlwa	x
      008772 C4 02 41         [ 1]  300 	and	a, _ledsState+0
      008775 95               [ 1]  301 	ld	xh, a
      008776 5D               [ 2]  302 	tnzw	x
      008777 27 03            [ 1]  303 	jreq	00103$
      008779 5F               [ 1]  304 	clrw	x
      00877A 5C               [ 1]  305 	incw	x
      00877B 21                     306 	.byte 0x21
      00877C                        307 00103$:
      00877C 5F               [ 1]  308 	clrw	x
      00877D                        309 00104$:
      00877D 9F               [ 1]  310 	ld	a, xl
                                    311 ;	../src/leds.c: 162: }
      00877E 81               [ 4]  312 	ret
                                    313 ;	../src/leds.c: 165: void SetLedState(uint8_t ledID, uint8_t state)
                                    314 ;	-----------------------------------------
                                    315 ;	 function SetLedState
                                    316 ;	-----------------------------------------
      00877F                        317 _SetLedState:
                                    318 ;	../src/leds.c: 168: if(state) ledsState |= (v << ledID);
      00877F 7B 03            [ 1]  319 	ld	a, (0x03, sp)
      008781 5F               [ 1]  320 	clrw	x
      008782 5C               [ 1]  321 	incw	x
      008783 4D               [ 1]  322 	tnz	a
      008784 27 04            [ 1]  323 	jreq	00112$
      008786                        324 00111$:
      008786 58               [ 2]  325 	sllw	x
      008787 4A               [ 1]  326 	dec	a
      008788 26 FC            [ 1]  327 	jrne	00111$
      00878A                        328 00112$:
      00878A 0D 04            [ 1]  329 	tnz	(0x04, sp)
      00878C 27 0D            [ 1]  330 	jreq	00102$
      00878E 9F               [ 1]  331 	ld	a, xl
      00878F CA 02 42         [ 1]  332 	or	a, _ledsState+1
      008792 02               [ 1]  333 	rlwa	x
      008793 CA 02 41         [ 1]  334 	or	a, _ledsState+0
      008796 95               [ 1]  335 	ld	xh, a
      008797 CF 02 41         [ 2]  336 	ldw	_ledsState+0, x
      00879A 81               [ 4]  337 	ret
      00879B                        338 00102$:
                                    339 ;	../src/leds.c: 169: else ledsState &= ~(v << ledID); 
      00879B 53               [ 2]  340 	cplw	x
      00879C 9F               [ 1]  341 	ld	a, xl
      00879D C4 02 42         [ 1]  342 	and	a, _ledsState+1
      0087A0 02               [ 1]  343 	rlwa	x
      0087A1 C4 02 41         [ 1]  344 	and	a, _ledsState+0
      0087A4 95               [ 1]  345 	ld	xh, a
      0087A5 CF 02 41         [ 2]  346 	ldw	_ledsState+0, x
                                    347 ;	../src/leds.c: 170: }
      0087A8 81               [ 4]  348 	ret
                                    349 	.area CODE
                                    350 	.area CONST
      0080A2                        351 _leds_anode:
      0080A2 50 0A                  352 	.dw #0x500a
      0080A4 00 08                  353 	.dw #0x0008
      0080A6 50 00                  354 	.dw #0x5000
      0080A8 00 08                  355 	.dw #0x0008
      0080AA 50 05                  356 	.dw #0x5005
      0080AC 00 10                  357 	.dw #0x0010
      0080AE 50 00                  358 	.dw #0x5000
      0080B0 00 08                  359 	.dw #0x0008
      0080B2 50 0A                  360 	.dw #0x500a
      0080B4 00 08                  361 	.dw #0x0008
      0080B6 50 05                  362 	.dw #0x5005
      0080B8 00 10                  363 	.dw #0x0010
      0080BA 50 05                  364 	.dw #0x5005
      0080BC 00 20                  365 	.dw #0x0020
      0080BE 50 00                  366 	.dw #0x5000
      0080C0 00 08                  367 	.dw #0x0008
      0080C2 50 05                  368 	.dw #0x5005
      0080C4 00 20                  369 	.dw #0x0020
      0080C6 50 0A                  370 	.dw #0x500a
      0080C8 00 08                  371 	.dw #0x0008
      0080CA 50 05                  372 	.dw #0x5005
      0080CC 00 10                  373 	.dw #0x0010
      0080CE 50 05                  374 	.dw #0x5005
      0080D0 00 20                  375 	.dw #0x0020
      0080D2                        376 _leds_cathode:
      0080D2 50 00                  377 	.dw #0x5000
      0080D4 00 08                  378 	.dw #0x0008
      0080D6 50 0A                  379 	.dw #0x500a
      0080D8 00 08                  380 	.dw #0x0008
      0080DA 50 00                  381 	.dw #0x5000
      0080DC 00 08                  382 	.dw #0x0008
      0080DE 50 05                  383 	.dw #0x5005
      0080E0 00 10                  384 	.dw #0x0010
      0080E2 50 05                  385 	.dw #0x5005
      0080E4 00 10                  386 	.dw #0x0010
      0080E6 50 0A                  387 	.dw #0x500a
      0080E8 00 08                  388 	.dw #0x0008
      0080EA 50 00                  389 	.dw #0x5000
      0080EC 00 08                  390 	.dw #0x0008
      0080EE 50 05                  391 	.dw #0x5005
      0080F0 00 20                  392 	.dw #0x0020
      0080F2 50 0A                  393 	.dw #0x500a
      0080F4 00 08                  394 	.dw #0x0008
      0080F6 50 05                  395 	.dw #0x5005
      0080F8 00 20                  396 	.dw #0x0020
      0080FA 50 05                  397 	.dw #0x5005
      0080FC 00 20                  398 	.dw #0x0020
      0080FE 50 05                  399 	.dw #0x5005
      008100 00 10                  400 	.dw #0x0010
                                    401 	.area INITIALIZER
                                    402 	.area CABS (ABS)
