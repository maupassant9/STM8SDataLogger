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
      00863B                         69 _LedsInit:
                                     70 ;	../src/leds.c: 57: ledsState = 0x00;
      00863B 5F               [ 1]   71 	clrw	x
      00863C CF 02 41         [ 2]   72 	ldw	_ledsState+0, x
                                     73 ;	../src/leds.c: 58: GpioInit();
                                     74 ;	../src/leds.c: 59: }
      00863F CC 86 42         [ 2]   75 	jp	_GpioInit
                                     76 ;	../src/leds.c: 72: static void GpioInit( void ){
                                     77 ;	-----------------------------------------
                                     78 ;	 function GpioInit
                                     79 ;	-----------------------------------------
      008642                         80 _GpioInit:
                                     81 ;	../src/leds.c: 75: for(idx = 0; idx < NUM_OF_LEDS; idx++){
      008642 4F               [ 1]   82 	clr	a
      008643                         83 00102$:
                                     84 ;	../src/leds.c: 76: SetLedRaw(idx, LED_OFF_STATE);
      008643 88               [ 1]   85 	push	a
      008644 4B 00            [ 1]   86 	push	#0x00
      008646 88               [ 1]   87 	push	a
      008647 CD 86 A0         [ 4]   88 	call	_SetLedRaw
      00864A 85               [ 2]   89 	popw	x
      00864B 84               [ 1]   90 	pop	a
                                     91 ;	../src/leds.c: 75: for(idx = 0; idx < NUM_OF_LEDS; idx++){
      00864C 4C               [ 1]   92 	inc	a
      00864D A1 0C            [ 1]   93 	cp	a, #0x0c
      00864F 25 F2            [ 1]   94 	jrc	00102$
                                     95 ;	../src/leds.c: 78: }
      008651 81               [ 4]   96 	ret
                                     97 ;	../src/leds.c: 95: void UpdateLedState( void )
                                     98 ;	-----------------------------------------
                                     99 ;	 function UpdateLedState
                                    100 ;	-----------------------------------------
      008652                        101 _UpdateLedState:
      008652 89               [ 2]  102 	pushw	x
                                    103 ;	../src/leds.c: 99: LED_STATE_T ledBit = (0x01 << ledId);
      008653 C6 02 43         [ 1]  104 	ld	a, _UpdateLedState_ledId_65536_325+0
      008656 88               [ 1]  105 	push	a
      008657 5F               [ 1]  106 	clrw	x
      008658 5C               [ 1]  107 	incw	x
      008659 4D               [ 1]  108 	tnz	a
      00865A 27 04            [ 1]  109 	jreq	00118$
      00865C                        110 00117$:
      00865C 58               [ 2]  111 	sllw	x
      00865D 4A               [ 1]  112 	dec	a
      00865E 26 FC            [ 1]  113 	jrne	00117$
      008660                        114 00118$:
      008660 84               [ 1]  115 	pop	a
      008661 1F 01            [ 2]  116 	ldw	(0x01, sp), x
                                    117 ;	../src/leds.c: 103: ledIdPrev = ledId;
      008663 C7 02 44         [ 1]  118 	ld	_UpdateLedState_ledIdPrev_65536_325+0, a
                                    119 ;	../src/leds.c: 104: ledId = (ledId == NUM_OF_LEDS-1)?0:(ledId+1);
      008666 C6 02 43         [ 1]  120 	ld	a, _UpdateLedState_ledId_65536_325+0
      008669 A1 0B            [ 1]  121 	cp	a, #0x0b
      00866B 26 03            [ 1]  122 	jrne	00105$
      00866D 4F               [ 1]  123 	clr	a
      00866E 20 0A            [ 2]  124 	jra	00106$
      008670                        125 00105$:
      008670 C6 02 43         [ 1]  126 	ld	a, _UpdateLedState_ledId_65536_325+0
      008673 4C               [ 1]  127 	inc	a
      008674 88               [ 1]  128 	push	a
      008675 49               [ 1]  129 	rlc	a
      008676 4F               [ 1]  130 	clr	a
      008677 A2 00            [ 1]  131 	sbc	a, #0x00
      008679 84               [ 1]  132 	pop	a
      00867A                        133 00106$:
      00867A C7 02 43         [ 1]  134 	ld	_UpdateLedState_ledId_65536_325+0, a
                                    135 ;	../src/leds.c: 106: SetLedRaw(ledIdPrev, LED_OFF_STATE);
      00867D 4B 00            [ 1]  136 	push	#0x00
      00867F 3B 02 44         [ 1]  137 	push	_UpdateLedState_ledIdPrev_65536_325+0
      008682 CD 86 A0         [ 4]  138 	call	_SetLedRaw
      008685 85               [ 2]  139 	popw	x
                                    140 ;	../src/leds.c: 107: if(ledBit&ledsState){
      008686 7B 02            [ 1]  141 	ld	a, (0x02, sp)
      008688 C4 02 42         [ 1]  142 	and	a, _ledsState+1
      00868B 97               [ 1]  143 	ld	xl, a
      00868C 7B 01            [ 1]  144 	ld	a, (0x01, sp)
      00868E C4 02 41         [ 1]  145 	and	a, _ledsState+0
      008691 95               [ 1]  146 	ld	xh, a
      008692 5D               [ 2]  147 	tnzw	x
      008693 27 09            [ 1]  148 	jreq	00103$
                                    149 ;	../src/leds.c: 108: SetLedRaw(ledId,LED_ON_STATE);
      008695 4B 01            [ 1]  150 	push	#0x01
      008697 3B 02 43         [ 1]  151 	push	_UpdateLedState_ledId_65536_325+0
      00869A CD 86 A0         [ 4]  152 	call	_SetLedRaw
      00869D 85               [ 2]  153 	popw	x
      00869E                        154 00103$:
                                    155 ;	../src/leds.c: 110: }
      00869E 85               [ 2]  156 	popw	x
      00869F 81               [ 4]  157 	ret
                                    158 ;	../src/leds.c: 130: void SetLedRaw(uint8_t ledId, uint8_t state){
                                    159 ;	-----------------------------------------
                                    160 ;	 function SetLedRaw
                                    161 ;	-----------------------------------------
      0086A0                        162 _SetLedRaw:
      0086A0 52 10            [ 2]  163 	sub	sp, #16
                                    164 ;	../src/leds.c: 132: ledId = ledId << 2;
      0086A2 7B 13            [ 1]  165 	ld	a, (0x13, sp)
      0086A4 48               [ 1]  166 	sll	a
      0086A5 48               [ 1]  167 	sll	a
      0086A6 6B 13            [ 1]  168 	ld	(0x13, sp), a
                                    169 ;	../src/leds.c: 134: GPIO_TypeDef * gpioPortPos = (GPIO_TypeDef * )leds_anode[ledId];
      0086A8 5F               [ 1]  170 	clrw	x
      0086A9 7B 13            [ 1]  171 	ld	a, (0x13, sp)
      0086AB 97               [ 1]  172 	ld	xl, a
      0086AC 58               [ 2]  173 	sllw	x
      0086AD 90 93            [ 1]  174 	ldw	y, x
      0086AF DE 80 A2         [ 2]  175 	ldw	x, (_leds_anode+0, x)
      0086B2 1F 02            [ 2]  176 	ldw	(0x02, sp), x
                                    177 ;	../src/leds.c: 135: GPIO_TypeDef * gpioPortNeg = (GPIO_TypeDef *) leds_cathode[ledId];
      0086B4 93               [ 1]  178 	ldw	x, y
      0086B5 1C 80 D2         [ 2]  179 	addw	x, #(_leds_cathode+0)
      0086B8 FE               [ 2]  180 	ldw	x, (x)
      0086B9 1F 04            [ 2]  181 	ldw	(0x04, sp), x
                                    182 ;	../src/leds.c: 136: ADDR_BANK_T gpioPinPos = leds_anode[ledId+1];
      0086BB 7B 13            [ 1]  183 	ld	a, (0x13, sp)
      0086BD 4C               [ 1]  184 	inc	a
      0086BE 97               [ 1]  185 	ld	xl, a
      0086BF 49               [ 1]  186 	rlc	a
      0086C0 4F               [ 1]  187 	clr	a
      0086C1 A2 00            [ 1]  188 	sbc	a, #0x00
      0086C3 95               [ 1]  189 	ld	xh, a
      0086C4 58               [ 2]  190 	sllw	x
      0086C5 90 93            [ 1]  191 	ldw	y, x
      0086C7 90 DE 80 A2      [ 2]  192 	ldw	y, (_leds_anode+0, y)
                                    193 ;	../src/leds.c: 137: ADDR_BANK_T gpioPinNeg = leds_cathode[ledId+1];
      0086CB DE 80 D2         [ 2]  194 	ldw	x, (_leds_cathode+0, x)
      0086CE 1F 0F            [ 2]  195 	ldw	(0x0f, sp), x
                                    196 ;	../src/leds.c: 141: gpioPortPos->ODR |= (gpioPinPos);
      0086D0 1E 02            [ 2]  197 	ldw	x, (0x02, sp)
      0086D2 F6               [ 1]  198 	ld	a, (x)
      0086D3 6B 06            [ 1]  199 	ld	(0x06, sp), a
                                    200 ;	../src/leds.c: 142: gpioPortNeg->ODR &= ~(gpioPinNeg);
      0086D5 7B 10            [ 1]  201 	ld	a, (0x10, sp)
      0086D7 6B 01            [ 1]  202 	ld	(0x01, sp), a
                                    203 ;	../src/leds.c: 144: gpioPortPos->DDR |= gpioPinPos;
      0086D9 1E 02            [ 2]  204 	ldw	x, (0x02, sp)
      0086DB 5C               [ 1]  205 	incw	x
      0086DC 5C               [ 1]  206 	incw	x
      0086DD 1F 07            [ 2]  207 	ldw	(0x07, sp), x
                                    208 ;	../src/leds.c: 145: gpioPortNeg->DDR |= gpioPinNeg;
      0086DF 1E 04            [ 2]  209 	ldw	x, (0x04, sp)
      0086E1 5C               [ 1]  210 	incw	x
      0086E2 5C               [ 1]  211 	incw	x
      0086E3 1F 09            [ 2]  212 	ldw	(0x09, sp), x
                                    213 ;	../src/leds.c: 146: gpioPortPos->CR1 |= gpioPinPos;
      0086E5 1E 02            [ 2]  214 	ldw	x, (0x02, sp)
      0086E7 1C 00 03         [ 2]  215 	addw	x, #0x0003
      0086EA 1F 0B            [ 2]  216 	ldw	(0x0b, sp), x
                                    217 ;	../src/leds.c: 147: gpioPortNeg->CR1 |= gpioPinNeg;
      0086EC 1E 04            [ 2]  218 	ldw	x, (0x04, sp)
      0086EE 1C 00 03         [ 2]  219 	addw	x, #0x0003
      0086F1 1F 0D            [ 2]  220 	ldw	(0x0d, sp), x
                                    221 ;	../src/leds.c: 141: gpioPortPos->ODR |= (gpioPinPos);
      0086F3 61               [ 1]  222 	exg	a, yl
      0086F4 6B 10            [ 1]  223 	ld	(0x10, sp), a
      0086F6 61               [ 1]  224 	exg	a, yl
                                    225 ;	../src/leds.c: 142: gpioPortNeg->ODR &= ~(gpioPinNeg);
      0086F7 7B 01            [ 1]  226 	ld	a, (0x01, sp)
      0086F9 43               [ 1]  227 	cpl	a
      0086FA 6B 0F            [ 1]  228 	ld	(0x0f, sp), a
                                    229 ;	../src/leds.c: 139: if(state) //turn on
      0086FC 0D 14            [ 1]  230 	tnz	(0x14, sp)
      0086FE 27 31            [ 1]  231 	jreq	00102$
                                    232 ;	../src/leds.c: 141: gpioPortPos->ODR |= (gpioPinPos);
      008700 7B 06            [ 1]  233 	ld	a, (0x06, sp)
      008702 1A 10            [ 1]  234 	or	a, (0x10, sp)
      008704 1E 02            [ 2]  235 	ldw	x, (0x02, sp)
      008706 F7               [ 1]  236 	ld	(x), a
                                    237 ;	../src/leds.c: 142: gpioPortNeg->ODR &= ~(gpioPinNeg);
      008707 1E 04            [ 2]  238 	ldw	x, (0x04, sp)
      008709 F6               [ 1]  239 	ld	a, (x)
      00870A 14 0F            [ 1]  240 	and	a, (0x0f, sp)
      00870C 1E 04            [ 2]  241 	ldw	x, (0x04, sp)
      00870E F7               [ 1]  242 	ld	(x), a
                                    243 ;	../src/leds.c: 144: gpioPortPos->DDR |= gpioPinPos;
      00870F 1E 07            [ 2]  244 	ldw	x, (0x07, sp)
      008711 F6               [ 1]  245 	ld	a, (x)
      008712 1A 10            [ 1]  246 	or	a, (0x10, sp)
      008714 1E 07            [ 2]  247 	ldw	x, (0x07, sp)
      008716 F7               [ 1]  248 	ld	(x), a
                                    249 ;	../src/leds.c: 145: gpioPortNeg->DDR |= gpioPinNeg;
      008717 1E 09            [ 2]  250 	ldw	x, (0x09, sp)
      008719 F6               [ 1]  251 	ld	a, (x)
      00871A 1A 01            [ 1]  252 	or	a, (0x01, sp)
      00871C 1E 09            [ 2]  253 	ldw	x, (0x09, sp)
      00871E F7               [ 1]  254 	ld	(x), a
                                    255 ;	../src/leds.c: 146: gpioPortPos->CR1 |= gpioPinPos;
      00871F 1E 0B            [ 2]  256 	ldw	x, (0x0b, sp)
      008721 F6               [ 1]  257 	ld	a, (x)
      008722 1A 10            [ 1]  258 	or	a, (0x10, sp)
      008724 1E 0B            [ 2]  259 	ldw	x, (0x0b, sp)
      008726 F7               [ 1]  260 	ld	(x), a
                                    261 ;	../src/leds.c: 147: gpioPortNeg->CR1 |= gpioPinNeg;
      008727 1E 0D            [ 2]  262 	ldw	x, (0x0d, sp)
      008729 F6               [ 1]  263 	ld	a, (x)
      00872A 1A 01            [ 1]  264 	or	a, (0x01, sp)
      00872C 1E 0D            [ 2]  265 	ldw	x, (0x0d, sp)
      00872E F7               [ 1]  266 	ld	(x), a
      00872F 20 31            [ 2]  267 	jra	00104$
      008731                        268 00102$:
                                    269 ;	../src/leds.c: 151: gpioPortPos->ODR &= ~(gpioPinPos);
      008731 03 10            [ 1]  270 	cpl	(0x10, sp)
      008733 7B 06            [ 1]  271 	ld	a, (0x06, sp)
      008735 14 10            [ 1]  272 	and	a, (0x10, sp)
      008737 1E 02            [ 2]  273 	ldw	x, (0x02, sp)
      008739 F7               [ 1]  274 	ld	(x), a
                                    275 ;	../src/leds.c: 152: gpioPortNeg->ODR &= ~(gpioPinNeg);
      00873A 1E 04            [ 2]  276 	ldw	x, (0x04, sp)
      00873C F6               [ 1]  277 	ld	a, (x)
      00873D 14 0F            [ 1]  278 	and	a, (0x0f, sp)
      00873F 1E 04            [ 2]  279 	ldw	x, (0x04, sp)
      008741 F7               [ 1]  280 	ld	(x), a
                                    281 ;	../src/leds.c: 153: gpioPortPos->DDR &= ~gpioPinPos;
      008742 1E 07            [ 2]  282 	ldw	x, (0x07, sp)
      008744 F6               [ 1]  283 	ld	a, (x)
      008745 14 10            [ 1]  284 	and	a, (0x10, sp)
      008747 1E 07            [ 2]  285 	ldw	x, (0x07, sp)
      008749 F7               [ 1]  286 	ld	(x), a
                                    287 ;	../src/leds.c: 154: gpioPortNeg->DDR &= ~gpioPinNeg;
      00874A 1E 09            [ 2]  288 	ldw	x, (0x09, sp)
      00874C F6               [ 1]  289 	ld	a, (x)
      00874D 14 0F            [ 1]  290 	and	a, (0x0f, sp)
      00874F 1E 09            [ 2]  291 	ldw	x, (0x09, sp)
      008751 F7               [ 1]  292 	ld	(x), a
                                    293 ;	../src/leds.c: 155: gpioPortPos->CR1 &= ~gpioPinPos;
      008752 1E 0B            [ 2]  294 	ldw	x, (0x0b, sp)
      008754 F6               [ 1]  295 	ld	a, (x)
      008755 14 10            [ 1]  296 	and	a, (0x10, sp)
      008757 1E 0B            [ 2]  297 	ldw	x, (0x0b, sp)
      008759 F7               [ 1]  298 	ld	(x), a
                                    299 ;	../src/leds.c: 156: gpioPortNeg->CR1 &= ~gpioPinNeg;
      00875A 1E 0D            [ 2]  300 	ldw	x, (0x0d, sp)
      00875C F6               [ 1]  301 	ld	a, (x)
      00875D 14 0F            [ 1]  302 	and	a, (0x0f, sp)
      00875F 1E 0D            [ 2]  303 	ldw	x, (0x0d, sp)
      008761 F7               [ 1]  304 	ld	(x), a
      008762                        305 00104$:
                                    306 ;	../src/leds.c: 158: }
      008762 5B 10            [ 2]  307 	addw	sp, #16
      008764 81               [ 4]  308 	ret
                                    309 ;	../src/leds.c: 161: uint8_t GetLedState(uint8_t ledID)
                                    310 ;	-----------------------------------------
                                    311 ;	 function GetLedState
                                    312 ;	-----------------------------------------
      008765                        313 _GetLedState:
      008765 89               [ 2]  314 	pushw	x
                                    315 ;	../src/leds.c: 163: return (ledsState & (1 << ledID))?1:0;
      008766 7B 05            [ 1]  316 	ld	a, (0x05, sp)
      008768 5F               [ 1]  317 	clrw	x
      008769 5C               [ 1]  318 	incw	x
      00876A 4D               [ 1]  319 	tnz	a
      00876B 27 04            [ 1]  320 	jreq	00111$
      00876D                        321 00110$:
      00876D 58               [ 2]  322 	sllw	x
      00876E 4A               [ 1]  323 	dec	a
      00876F 26 FC            [ 1]  324 	jrne	00110$
      008771                        325 00111$:
      008771 90 CE 02 41      [ 2]  326 	ldw	y, _ledsState+0
      008775 17 01            [ 2]  327 	ldw	(0x01, sp), y
      008777 9F               [ 1]  328 	ld	a, xl
      008778 14 02            [ 1]  329 	and	a, (0x02, sp)
      00877A 02               [ 1]  330 	rlwa	x
      00877B 14 01            [ 1]  331 	and	a, (0x01, sp)
      00877D 95               [ 1]  332 	ld	xh, a
      00877E 5D               [ 2]  333 	tnzw	x
      00877F 27 03            [ 1]  334 	jreq	00103$
      008781 5F               [ 1]  335 	clrw	x
      008782 5C               [ 1]  336 	incw	x
      008783 21                     337 	.byte 0x21
      008784                        338 00103$:
      008784 5F               [ 1]  339 	clrw	x
      008785                        340 00104$:
      008785 9F               [ 1]  341 	ld	a, xl
                                    342 ;	../src/leds.c: 164: }
      008786 85               [ 2]  343 	popw	x
      008787 81               [ 4]  344 	ret
                                    345 ;	../src/leds.c: 167: void SetLedState(uint8_t ledID, uint8_t state)
                                    346 ;	-----------------------------------------
                                    347 ;	 function SetLedState
                                    348 ;	-----------------------------------------
      008788                        349 _SetLedState:
      008788 89               [ 2]  350 	pushw	x
                                    351 ;	../src/leds.c: 169: if(state) ledsState |= (1 << ledID);
      008789 7B 05            [ 1]  352 	ld	a, (0x05, sp)
      00878B CE 02 41         [ 2]  353 	ldw	x, _ledsState+0
      00878E 1F 01            [ 2]  354 	ldw	(0x01, sp), x
      008790 5F               [ 1]  355 	clrw	x
      008791 5C               [ 1]  356 	incw	x
      008792 4D               [ 1]  357 	tnz	a
      008793 27 04            [ 1]  358 	jreq	00112$
      008795                        359 00111$:
      008795 58               [ 2]  360 	sllw	x
      008796 4A               [ 1]  361 	dec	a
      008797 26 FC            [ 1]  362 	jrne	00111$
      008799                        363 00112$:
      008799 0D 06            [ 1]  364 	tnz	(0x06, sp)
      00879B 27 0C            [ 1]  365 	jreq	00102$
      00879D 9F               [ 1]  366 	ld	a, xl
      00879E 1A 02            [ 1]  367 	or	a, (0x02, sp)
      0087A0 02               [ 1]  368 	rlwa	x
      0087A1 1A 01            [ 1]  369 	or	a, (0x01, sp)
      0087A3 95               [ 1]  370 	ld	xh, a
      0087A4 CF 02 41         [ 2]  371 	ldw	_ledsState+0, x
      0087A7 20 0B            [ 2]  372 	jra	00104$
      0087A9                        373 00102$:
                                    374 ;	../src/leds.c: 170: else ledsState &= ~(1 << ledID); 
      0087A9 53               [ 2]  375 	cplw	x
      0087AA 9F               [ 1]  376 	ld	a, xl
      0087AB 14 02            [ 1]  377 	and	a, (0x02, sp)
      0087AD 02               [ 1]  378 	rlwa	x
      0087AE 14 01            [ 1]  379 	and	a, (0x01, sp)
      0087B0 95               [ 1]  380 	ld	xh, a
      0087B1 CF 02 41         [ 2]  381 	ldw	_ledsState+0, x
      0087B4                        382 00104$:
                                    383 ;	../src/leds.c: 171: }
      0087B4 85               [ 2]  384 	popw	x
      0087B5 81               [ 4]  385 	ret
                                    386 	.area CODE
                                    387 	.area CONST
      0080A2                        388 _leds_anode:
      0080A2 50 00                  389 	.dw #0x5000
      0080A4 00 08                  390 	.dw #0x0008
      0080A6 50 0A                  391 	.dw #0x500a
      0080A8 00 08                  392 	.dw #0x0008
      0080AA 50 00                  393 	.dw #0x5000
      0080AC 00 08                  394 	.dw #0x0008
      0080AE 50 05                  395 	.dw #0x5005
      0080B0 00 10                  396 	.dw #0x0010
      0080B2 50 0A                  397 	.dw #0x500a
      0080B4 00 08                  398 	.dw #0x0008
      0080B6 50 05                  399 	.dw #0x5005
      0080B8 00 10                  400 	.dw #0x0010
      0080BA 50 05                  401 	.dw #0x5005
      0080BC 00 20                  402 	.dw #0x0020
      0080BE 50 00                  403 	.dw #0x5000
      0080C0 00 08                  404 	.dw #0x0008
      0080C2 50 05                  405 	.dw #0x5005
      0080C4 00 20                  406 	.dw #0x0020
      0080C6 50 0A                  407 	.dw #0x500a
      0080C8 00 08                  408 	.dw #0x0008
      0080CA 50 05                  409 	.dw #0x5005
      0080CC 00 10                  410 	.dw #0x0010
      0080CE 50 05                  411 	.dw #0x5005
      0080D0 00 20                  412 	.dw #0x0020
      0080D2                        413 _leds_cathode:
      0080D2 50 0A                  414 	.dw #0x500a
      0080D4 00 08                  415 	.dw #0x0008
      0080D6 50 00                  416 	.dw #0x5000
      0080D8 00 08                  417 	.dw #0x0008
      0080DA 50 05                  418 	.dw #0x5005
      0080DC 00 10                  419 	.dw #0x0010
      0080DE 50 00                  420 	.dw #0x5000
      0080E0 00 08                  421 	.dw #0x0008
      0080E2 50 05                  422 	.dw #0x5005
      0080E4 00 10                  423 	.dw #0x0010
      0080E6 50 0A                  424 	.dw #0x500a
      0080E8 00 08                  425 	.dw #0x0008
      0080EA 50 00                  426 	.dw #0x5000
      0080EC 00 08                  427 	.dw #0x0008
      0080EE 50 05                  428 	.dw #0x5005
      0080F0 00 20                  429 	.dw #0x0020
      0080F2 50 0A                  430 	.dw #0x500a
      0080F4 00 08                  431 	.dw #0x0008
      0080F6 50 05                  432 	.dw #0x5005
      0080F8 00 20                  433 	.dw #0x0020
      0080FA 50 05                  434 	.dw #0x5005
      0080FC 00 20                  435 	.dw #0x0020
      0080FE 50 05                  436 	.dw #0x5005
      008100 00 10                  437 	.dw #0x0010
                                    438 	.area INITIALIZER
                                    439 	.area CABS (ABS)
