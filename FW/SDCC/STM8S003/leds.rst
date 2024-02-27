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
                                     52 ;	../src/leds.c: 98: static uint8_t ledId = NUM_OF_LEDS-1;
      00807D 35 0B 02 43      [ 1]   53 	mov	_UpdateLedState_ledId_65536_325+0, #0x0b
                                     54 ;	../src/leds.c: 100: static uint8_t ledIdPrev = 0;
      008081 72 5F 02 44      [ 1]   55 	clr	_UpdateLedState_ledIdPrev_65536_325+0
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
      00863F                         69 _LedsInit:
                                     70 ;	../src/leds.c: 57: ledsState = 0x00;
      00863F 5F               [ 1]   71 	clrw	x
      008640 CF 02 41         [ 2]   72 	ldw	_ledsState+0, x
                                     73 ;	../src/leds.c: 58: GpioInit();
                                     74 ;	../src/leds.c: 59: }
      008643 CC 86 46         [ 2]   75 	jp	_GpioInit
                                     76 ;	../src/leds.c: 72: static void GpioInit( void ){
                                     77 ;	-----------------------------------------
                                     78 ;	 function GpioInit
                                     79 ;	-----------------------------------------
      008646                         80 _GpioInit:
                                     81 ;	../src/leds.c: 75: for(idx = 0; idx < NUM_OF_LEDS; idx++){
      008646 4F               [ 1]   82 	clr	a
      008647                         83 00102$:
                                     84 ;	../src/leds.c: 76: SetLedRaw(idx, LED_OFF_STATE);
      008647 88               [ 1]   85 	push	a
      008648 4B 00            [ 1]   86 	push	#0x00
      00864A 88               [ 1]   87 	push	a
      00864B CD 86 A4         [ 4]   88 	call	_SetLedRaw
      00864E 85               [ 2]   89 	popw	x
      00864F 84               [ 1]   90 	pop	a
                                     91 ;	../src/leds.c: 75: for(idx = 0; idx < NUM_OF_LEDS; idx++){
      008650 4C               [ 1]   92 	inc	a
      008651 A1 0C            [ 1]   93 	cp	a, #0x0c
      008653 25 F2            [ 1]   94 	jrc	00102$
                                     95 ;	../src/leds.c: 78: }
      008655 81               [ 4]   96 	ret
                                     97 ;	../src/leds.c: 95: void UpdateLedState( void )
                                     98 ;	-----------------------------------------
                                     99 ;	 function UpdateLedState
                                    100 ;	-----------------------------------------
      008656                        101 _UpdateLedState:
      008656 89               [ 2]  102 	pushw	x
                                    103 ;	../src/leds.c: 99: LED_STATE_T ledBit = (0x01 << ledId);
      008657 C6 02 43         [ 1]  104 	ld	a, _UpdateLedState_ledId_65536_325+0
      00865A 88               [ 1]  105 	push	a
      00865B 5F               [ 1]  106 	clrw	x
      00865C 5C               [ 1]  107 	incw	x
      00865D 4D               [ 1]  108 	tnz	a
      00865E 27 04            [ 1]  109 	jreq	00118$
      008660                        110 00117$:
      008660 58               [ 2]  111 	sllw	x
      008661 4A               [ 1]  112 	dec	a
      008662 26 FC            [ 1]  113 	jrne	00117$
      008664                        114 00118$:
      008664 84               [ 1]  115 	pop	a
      008665 1F 01            [ 2]  116 	ldw	(0x01, sp), x
                                    117 ;	../src/leds.c: 103: ledIdPrev = ledId;
      008667 C7 02 44         [ 1]  118 	ld	_UpdateLedState_ledIdPrev_65536_325+0, a
                                    119 ;	../src/leds.c: 104: ledId = (ledId == NUM_OF_LEDS-1)?0:(ledId+1);
      00866A C6 02 43         [ 1]  120 	ld	a, _UpdateLedState_ledId_65536_325+0
      00866D A1 0B            [ 1]  121 	cp	a, #0x0b
      00866F 26 03            [ 1]  122 	jrne	00105$
      008671 4F               [ 1]  123 	clr	a
      008672 20 0A            [ 2]  124 	jra	00106$
      008674                        125 00105$:
      008674 C6 02 43         [ 1]  126 	ld	a, _UpdateLedState_ledId_65536_325+0
      008677 4C               [ 1]  127 	inc	a
      008678 88               [ 1]  128 	push	a
      008679 49               [ 1]  129 	rlc	a
      00867A 4F               [ 1]  130 	clr	a
      00867B A2 00            [ 1]  131 	sbc	a, #0x00
      00867D 84               [ 1]  132 	pop	a
      00867E                        133 00106$:
      00867E C7 02 43         [ 1]  134 	ld	_UpdateLedState_ledId_65536_325+0, a
                                    135 ;	../src/leds.c: 106: SetLedRaw(ledIdPrev, LED_OFF_STATE);
      008681 4B 00            [ 1]  136 	push	#0x00
      008683 3B 02 44         [ 1]  137 	push	_UpdateLedState_ledIdPrev_65536_325+0
      008686 CD 86 A4         [ 4]  138 	call	_SetLedRaw
      008689 85               [ 2]  139 	popw	x
                                    140 ;	../src/leds.c: 107: if(ledBit&ledsState){
      00868A 7B 02            [ 1]  141 	ld	a, (0x02, sp)
      00868C C4 02 42         [ 1]  142 	and	a, _ledsState+1
      00868F 97               [ 1]  143 	ld	xl, a
      008690 7B 01            [ 1]  144 	ld	a, (0x01, sp)
      008692 C4 02 41         [ 1]  145 	and	a, _ledsState+0
      008695 95               [ 1]  146 	ld	xh, a
      008696 5D               [ 2]  147 	tnzw	x
      008697 27 09            [ 1]  148 	jreq	00103$
                                    149 ;	../src/leds.c: 108: SetLedRaw(ledId,LED_ON_STATE);
      008699 4B 01            [ 1]  150 	push	#0x01
      00869B 3B 02 43         [ 1]  151 	push	_UpdateLedState_ledId_65536_325+0
      00869E CD 86 A4         [ 4]  152 	call	_SetLedRaw
      0086A1 85               [ 2]  153 	popw	x
      0086A2                        154 00103$:
                                    155 ;	../src/leds.c: 110: }
      0086A2 85               [ 2]  156 	popw	x
      0086A3 81               [ 4]  157 	ret
                                    158 ;	../src/leds.c: 130: void SetLedRaw(uint8_t ledId, uint8_t state){
                                    159 ;	-----------------------------------------
                                    160 ;	 function SetLedRaw
                                    161 ;	-----------------------------------------
      0086A4                        162 _SetLedRaw:
      0086A4 52 0B            [ 2]  163 	sub	sp, #11
                                    164 ;	../src/leds.c: 132: ledId = ledId << 2;
      0086A6 7B 0E            [ 1]  165 	ld	a, (0x0e, sp)
      0086A8 48               [ 1]  166 	sll	a
      0086A9 48               [ 1]  167 	sll	a
      0086AA 6B 0E            [ 1]  168 	ld	(0x0e, sp), a
                                    169 ;	../src/leds.c: 134: GPIO_TypeDef * gpioPortPos = (GPIO_TypeDef * )leds_anode[ledId];
      0086AC 5F               [ 1]  170 	clrw	x
      0086AD 7B 0E            [ 1]  171 	ld	a, (0x0e, sp)
      0086AF 97               [ 1]  172 	ld	xl, a
      0086B0 58               [ 2]  173 	sllw	x
      0086B1 90 93            [ 1]  174 	ldw	y, x
      0086B3 DE 80 A2         [ 2]  175 	ldw	x, (_leds_anode+0, x)
      0086B6 1F 03            [ 2]  176 	ldw	(0x03, sp), x
                                    177 ;	../src/leds.c: 135: GPIO_TypeDef * gpioPortNeg = (GPIO_TypeDef *) leds_cathode[ledId];
      0086B8 93               [ 1]  178 	ldw	x, y
      0086B9 1C 80 D2         [ 2]  179 	addw	x, #(_leds_cathode+0)
      0086BC FE               [ 2]  180 	ldw	x, (x)
      0086BD 1F 05            [ 2]  181 	ldw	(0x05, sp), x
                                    182 ;	../src/leds.c: 136: ADDR_BANK_T gpioPinPos = leds_anode[ledId+1];
      0086BF 7B 0E            [ 1]  183 	ld	a, (0x0e, sp)
      0086C1 4C               [ 1]  184 	inc	a
      0086C2 97               [ 1]  185 	ld	xl, a
      0086C3 49               [ 1]  186 	rlc	a
      0086C4 4F               [ 1]  187 	clr	a
      0086C5 A2 00            [ 1]  188 	sbc	a, #0x00
      0086C7 95               [ 1]  189 	ld	xh, a
      0086C8 58               [ 2]  190 	sllw	x
      0086C9 90 93            [ 1]  191 	ldw	y, x
      0086CB DE 80 A2         [ 2]  192 	ldw	x, (_leds_anode+0, x)
      0086CE 1F 01            [ 2]  193 	ldw	(0x01, sp), x
                                    194 ;	../src/leds.c: 137: ADDR_BANK_T gpioPinNeg = leds_cathode[ledId+1];
      0086D0 93               [ 1]  195 	ldw	x, y
      0086D1 DE 80 D2         [ 2]  196 	ldw	x, (_leds_cathode+0, x)
      0086D4 9F               [ 1]  197 	ld	a, xl
                                    198 ;	../src/leds.c: 142: gpioPortNeg->ODR &= ~(gpioPinNeg);
      0086D5 6B 07            [ 1]  199 	ld	(0x07, sp), a
                                    200 ;	../src/leds.c: 144: gpioPortPos->DDR |= gpioPinPos;
      0086D7 1E 03            [ 2]  201 	ldw	x, (0x03, sp)
      0086D9 5C               [ 1]  202 	incw	x
      0086DA 5C               [ 1]  203 	incw	x
                                    204 ;	../src/leds.c: 145: gpioPortNeg->DDR |= gpioPinNeg;
      0086DB 16 05            [ 2]  205 	ldw	y, (0x05, sp)
      0086DD 90 5C            [ 1]  206 	incw	y
      0086DF 90 5C            [ 1]  207 	incw	y
      0086E1 17 08            [ 2]  208 	ldw	(0x08, sp), y
                                    209 ;	../src/leds.c: 141: gpioPortPos->ODR |= (gpioPinPos);
      0086E3 7B 02            [ 1]  210 	ld	a, (0x02, sp)
      0086E5 6B 0A            [ 1]  211 	ld	(0x0a, sp), a
                                    212 ;	../src/leds.c: 142: gpioPortNeg->ODR &= ~(gpioPinNeg);
      0086E7 7B 07            [ 1]  213 	ld	a, (0x07, sp)
      0086E9 43               [ 1]  214 	cpl	a
      0086EA 6B 0B            [ 1]  215 	ld	(0x0b, sp), a
                                    216 ;	../src/leds.c: 139: if(state) //turn on
      0086EC 0D 0F            [ 1]  217 	tnz	(0x0f, sp)
      0086EE 27 22            [ 1]  218 	jreq	00102$
                                    219 ;	../src/leds.c: 141: gpioPortPos->ODR |= (gpioPinPos);
      0086F0 16 03            [ 2]  220 	ldw	y, (0x03, sp)
      0086F2 90 F6            [ 1]  221 	ld	a, (y)
      0086F4 1A 0A            [ 1]  222 	or	a, (0x0a, sp)
      0086F6 16 03            [ 2]  223 	ldw	y, (0x03, sp)
      0086F8 90 F7            [ 1]  224 	ld	(y), a
                                    225 ;	../src/leds.c: 142: gpioPortNeg->ODR &= ~(gpioPinNeg);
      0086FA 16 05            [ 2]  226 	ldw	y, (0x05, sp)
      0086FC 90 F6            [ 1]  227 	ld	a, (y)
      0086FE 14 0B            [ 1]  228 	and	a, (0x0b, sp)
      008700 16 05            [ 2]  229 	ldw	y, (0x05, sp)
      008702 90 F7            [ 1]  230 	ld	(y), a
                                    231 ;	../src/leds.c: 144: gpioPortPos->DDR |= gpioPinPos;
      008704 F6               [ 1]  232 	ld	a, (x)
      008705 1A 0A            [ 1]  233 	or	a, (0x0a, sp)
      008707 F7               [ 1]  234 	ld	(x), a
                                    235 ;	../src/leds.c: 145: gpioPortNeg->DDR |= gpioPinNeg;
      008708 1E 08            [ 2]  236 	ldw	x, (0x08, sp)
      00870A F6               [ 1]  237 	ld	a, (x)
      00870B 1A 07            [ 1]  238 	or	a, (0x07, sp)
      00870D 1E 08            [ 2]  239 	ldw	x, (0x08, sp)
      00870F F7               [ 1]  240 	ld	(x), a
      008710 20 11            [ 2]  241 	jra	00104$
      008712                        242 00102$:
                                    243 ;	../src/leds.c: 149: gpioPortPos->DDR &= ~gpioPinPos;
      008712 F6               [ 1]  244 	ld	a, (x)
      008713 6B 07            [ 1]  245 	ld	(0x07, sp), a
      008715 7B 0A            [ 1]  246 	ld	a, (0x0a, sp)
      008717 43               [ 1]  247 	cpl	a
      008718 14 07            [ 1]  248 	and	a, (0x07, sp)
      00871A F7               [ 1]  249 	ld	(x), a
                                    250 ;	../src/leds.c: 150: gpioPortNeg->DDR &= ~gpioPinNeg;
      00871B 1E 08            [ 2]  251 	ldw	x, (0x08, sp)
      00871D F6               [ 1]  252 	ld	a, (x)
      00871E 14 0B            [ 1]  253 	and	a, (0x0b, sp)
      008720 1E 08            [ 2]  254 	ldw	x, (0x08, sp)
      008722 F7               [ 1]  255 	ld	(x), a
      008723                        256 00104$:
                                    257 ;	../src/leds.c: 152: }
      008723 5B 0B            [ 2]  258 	addw	sp, #11
      008725 81               [ 4]  259 	ret
                                    260 ;	../src/leds.c: 155: uint8_t GetLedState(uint8_t ledID)
                                    261 ;	-----------------------------------------
                                    262 ;	 function GetLedState
                                    263 ;	-----------------------------------------
      008726                        264 _GetLedState:
      008726 89               [ 2]  265 	pushw	x
                                    266 ;	../src/leds.c: 157: return (ledsState & (1 << ledID))?1:0;
      008727 7B 05            [ 1]  267 	ld	a, (0x05, sp)
      008729 5F               [ 1]  268 	clrw	x
      00872A 5C               [ 1]  269 	incw	x
      00872B 4D               [ 1]  270 	tnz	a
      00872C 27 04            [ 1]  271 	jreq	00111$
      00872E                        272 00110$:
      00872E 58               [ 2]  273 	sllw	x
      00872F 4A               [ 1]  274 	dec	a
      008730 26 FC            [ 1]  275 	jrne	00110$
      008732                        276 00111$:
      008732 90 CE 02 41      [ 2]  277 	ldw	y, _ledsState+0
      008736 17 01            [ 2]  278 	ldw	(0x01, sp), y
      008738 9F               [ 1]  279 	ld	a, xl
      008739 14 02            [ 1]  280 	and	a, (0x02, sp)
      00873B 02               [ 1]  281 	rlwa	x
      00873C 14 01            [ 1]  282 	and	a, (0x01, sp)
      00873E 95               [ 1]  283 	ld	xh, a
      00873F 5D               [ 2]  284 	tnzw	x
      008740 27 03            [ 1]  285 	jreq	00103$
      008742 5F               [ 1]  286 	clrw	x
      008743 5C               [ 1]  287 	incw	x
      008744 21                     288 	.byte 0x21
      008745                        289 00103$:
      008745 5F               [ 1]  290 	clrw	x
      008746                        291 00104$:
      008746 9F               [ 1]  292 	ld	a, xl
                                    293 ;	../src/leds.c: 158: }
      008747 85               [ 2]  294 	popw	x
      008748 81               [ 4]  295 	ret
                                    296 ;	../src/leds.c: 161: void SetLedState(uint8_t ledID, uint8_t state)
                                    297 ;	-----------------------------------------
                                    298 ;	 function SetLedState
                                    299 ;	-----------------------------------------
      008749                        300 _SetLedState:
      008749 89               [ 2]  301 	pushw	x
                                    302 ;	../src/leds.c: 163: if(state) ledsState |= (1 << ledID);
      00874A 7B 05            [ 1]  303 	ld	a, (0x05, sp)
      00874C CE 02 41         [ 2]  304 	ldw	x, _ledsState+0
      00874F 1F 01            [ 2]  305 	ldw	(0x01, sp), x
      008751 5F               [ 1]  306 	clrw	x
      008752 5C               [ 1]  307 	incw	x
      008753 4D               [ 1]  308 	tnz	a
      008754 27 04            [ 1]  309 	jreq	00112$
      008756                        310 00111$:
      008756 58               [ 2]  311 	sllw	x
      008757 4A               [ 1]  312 	dec	a
      008758 26 FC            [ 1]  313 	jrne	00111$
      00875A                        314 00112$:
      00875A 0D 06            [ 1]  315 	tnz	(0x06, sp)
      00875C 27 0C            [ 1]  316 	jreq	00102$
      00875E 9F               [ 1]  317 	ld	a, xl
      00875F 1A 02            [ 1]  318 	or	a, (0x02, sp)
      008761 02               [ 1]  319 	rlwa	x
      008762 1A 01            [ 1]  320 	or	a, (0x01, sp)
      008764 95               [ 1]  321 	ld	xh, a
      008765 CF 02 41         [ 2]  322 	ldw	_ledsState+0, x
      008768 20 0B            [ 2]  323 	jra	00104$
      00876A                        324 00102$:
                                    325 ;	../src/leds.c: 164: else ledsState &= ~(1 << ledID); 
      00876A 53               [ 2]  326 	cplw	x
      00876B 9F               [ 1]  327 	ld	a, xl
      00876C 14 02            [ 1]  328 	and	a, (0x02, sp)
      00876E 02               [ 1]  329 	rlwa	x
      00876F 14 01            [ 1]  330 	and	a, (0x01, sp)
      008771 95               [ 1]  331 	ld	xh, a
      008772 CF 02 41         [ 2]  332 	ldw	_ledsState+0, x
      008775                        333 00104$:
                                    334 ;	../src/leds.c: 165: }
      008775 85               [ 2]  335 	popw	x
      008776 81               [ 4]  336 	ret
                                    337 	.area CODE
                                    338 	.area CONST
      0080A2                        339 _leds_anode:
      0080A2 50 00                  340 	.dw #0x5000
      0080A4 00 08                  341 	.dw #0x0008
      0080A6 50 0A                  342 	.dw #0x500a
      0080A8 00 08                  343 	.dw #0x0008
      0080AA 50 00                  344 	.dw #0x5000
      0080AC 00 08                  345 	.dw #0x0008
      0080AE 50 05                  346 	.dw #0x5005
      0080B0 00 10                  347 	.dw #0x0010
      0080B2 50 0A                  348 	.dw #0x500a
      0080B4 00 08                  349 	.dw #0x0008
      0080B6 50 05                  350 	.dw #0x5005
      0080B8 00 10                  351 	.dw #0x0010
      0080BA 50 05                  352 	.dw #0x5005
      0080BC 00 20                  353 	.dw #0x0020
      0080BE 50 00                  354 	.dw #0x5000
      0080C0 00 08                  355 	.dw #0x0008
      0080C2 50 05                  356 	.dw #0x5005
      0080C4 00 20                  357 	.dw #0x0020
      0080C6 50 0A                  358 	.dw #0x500a
      0080C8 00 08                  359 	.dw #0x0008
      0080CA 50 05                  360 	.dw #0x5005
      0080CC 00 10                  361 	.dw #0x0010
      0080CE 50 05                  362 	.dw #0x5005
      0080D0 00 20                  363 	.dw #0x0020
      0080D2                        364 _leds_cathode:
      0080D2 50 0A                  365 	.dw #0x500a
      0080D4 00 08                  366 	.dw #0x0008
      0080D6 50 00                  367 	.dw #0x5000
      0080D8 00 08                  368 	.dw #0x0008
      0080DA 50 05                  369 	.dw #0x5005
      0080DC 00 10                  370 	.dw #0x0010
      0080DE 50 00                  371 	.dw #0x5000
      0080E0 00 08                  372 	.dw #0x0008
      0080E2 50 05                  373 	.dw #0x5005
      0080E4 00 10                  374 	.dw #0x0010
      0080E6 50 0A                  375 	.dw #0x500a
      0080E8 00 08                  376 	.dw #0x0008
      0080EA 50 00                  377 	.dw #0x5000
      0080EC 00 08                  378 	.dw #0x0008
      0080EE 50 05                  379 	.dw #0x5005
      0080F0 00 20                  380 	.dw #0x0020
      0080F2 50 0A                  381 	.dw #0x500a
      0080F4 00 08                  382 	.dw #0x0008
      0080F6 50 05                  383 	.dw #0x5005
      0080F8 00 20                  384 	.dw #0x0020
      0080FA 50 05                  385 	.dw #0x5005
      0080FC 00 20                  386 	.dw #0x0020
      0080FE 50 05                  387 	.dw #0x5005
      008100 00 10                  388 	.dw #0x0010
                                    389 	.area INITIALIZER
                                    390 	.area CABS (ABS)
