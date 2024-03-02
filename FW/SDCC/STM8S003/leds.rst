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
      000247                         22 _ledsState:
      000247                         23 	.ds 2
      000249                         24 _UpdateLedState_ledId_65536_325:
      000249                         25 	.ds 1
      00024A                         26 _UpdateLedState_ledIdPrev_65536_325:
      00024A                         27 	.ds 1
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
      008088 72 5F 02 49      [ 1]   53 	clr	_UpdateLedState_ledId_65536_325+0
                                     54 ;	../src/leds.c: 98: static uint8_t ledIdPrev = NUM_OF_LEDS-1;
      00808C 35 0B 02 4A      [ 1]   55 	mov	_UpdateLedState_ledIdPrev_65536_325+0, #0x0b
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
      008761                         69 _LedsInit:
                                     70 ;	../src/leds.c: 57: ledsState = 0x00;
      008761 5F               [ 1]   71 	clrw	x
      008762 CF 02 47         [ 2]   72 	ldw	_ledsState+0, x
                                     73 ;	../src/leds.c: 58: GpioInit();
                                     74 ;	../src/leds.c: 59: }
      008765 CC 87 68         [ 2]   75 	jp	_GpioInit
                                     76 ;	../src/leds.c: 72: static void GpioInit( void ){
                                     77 ;	-----------------------------------------
                                     78 ;	 function GpioInit
                                     79 ;	-----------------------------------------
      008768                         80 _GpioInit:
                                     81 ;	../src/leds.c: 75: for(idx = 0; idx < NUM_OF_LEDS; idx++){
      008768 4F               [ 1]   82 	clr	a
      008769                         83 00102$:
                                     84 ;	../src/leds.c: 76: SetLedRaw(idx, LED_OFF_STATE);
      008769 88               [ 1]   85 	push	a
      00876A 4B 00            [ 1]   86 	push	#0x00
      00876C 88               [ 1]   87 	push	a
      00876D CD 87 AE         [ 4]   88 	call	_SetLedRaw
      008770 85               [ 2]   89 	popw	x
      008771 84               [ 1]   90 	pop	a
                                     91 ;	../src/leds.c: 75: for(idx = 0; idx < NUM_OF_LEDS; idx++){
      008772 4C               [ 1]   92 	inc	a
      008773 A1 0C            [ 1]   93 	cp	a, #0x0c
      008775 25 F2            [ 1]   94 	jrc	00102$
                                     95 ;	../src/leds.c: 78: }
      008777 81               [ 4]   96 	ret
                                     97 ;	../src/leds.c: 95: void UpdateLedState( void )
                                     98 ;	-----------------------------------------
                                     99 ;	 function UpdateLedState
                                    100 ;	-----------------------------------------
      008778                        101 _UpdateLedState:
                                    102 ;	../src/leds.c: 101: ledId = (ledId == NUM_OF_LEDS-1)?0:(ledId+1);
      008778 C6 02 49         [ 1]  103 	ld	a, _UpdateLedState_ledId_65536_325+0
      00877B A1 0B            [ 1]  104 	cp	a, #0x0b
      00877D 26 03            [ 1]  105 	jrne	00103$
      00877F 4F               [ 1]  106 	clr	a
      008780 20 0A            [ 2]  107 	jra	00104$
      008782                        108 00103$:
      008782 C6 02 49         [ 1]  109 	ld	a, _UpdateLedState_ledId_65536_325+0
      008785 4C               [ 1]  110 	inc	a
      008786 88               [ 1]  111 	push	a
      008787 49               [ 1]  112 	rlc	a
      008788 4F               [ 1]  113 	clr	a
      008789 A2 00            [ 1]  114 	sbc	a, #0x00
      00878B 84               [ 1]  115 	pop	a
      00878C                        116 00104$:
      00878C C7 02 49         [ 1]  117 	ld	_UpdateLedState_ledId_65536_325+0, a
                                    118 ;	../src/leds.c: 103: SetLedRaw(ledIdPrev, LED_OFF_STATE);
      00878F 4B 00            [ 1]  119 	push	#0x00
      008791 3B 02 4A         [ 1]  120 	push	_UpdateLedState_ledIdPrev_65536_325+0
      008794 CD 87 AE         [ 4]  121 	call	_SetLedRaw
      008797 85               [ 2]  122 	popw	x
                                    123 ;	../src/leds.c: 104: SetLedRaw(ledId,GetLedState(ledId));
      008798 3B 02 49         [ 1]  124 	push	_UpdateLedState_ledId_65536_325+0
      00879B CD 88 71         [ 4]  125 	call	_GetLedState
      00879E 5B 01            [ 2]  126 	addw	sp, #1
      0087A0 88               [ 1]  127 	push	a
      0087A1 3B 02 49         [ 1]  128 	push	_UpdateLedState_ledId_65536_325+0
      0087A4 CD 87 AE         [ 4]  129 	call	_SetLedRaw
      0087A7 85               [ 2]  130 	popw	x
                                    131 ;	../src/leds.c: 105: ledIdPrev = ledId; 
      0087A8 55 02 49 02 4A   [ 1]  132 	mov	_UpdateLedState_ledIdPrev_65536_325+0, _UpdateLedState_ledId_65536_325+0
                                    133 ;	../src/leds.c: 106: }
      0087AD 81               [ 4]  134 	ret
                                    135 ;	../src/leds.c: 126: void SetLedRaw(uint8_t ledId, uint8_t state){
                                    136 ;	-----------------------------------------
                                    137 ;	 function SetLedRaw
                                    138 ;	-----------------------------------------
      0087AE                        139 _SetLedRaw:
      0087AE 52 0E            [ 2]  140 	sub	sp, #14
                                    141 ;	../src/leds.c: 128: if(ledId >= NUM_OF_LEDS) return;
      0087B0 7B 11            [ 1]  142 	ld	a, (0x11, sp)
      0087B2 A1 0C            [ 1]  143 	cp	a, #0x0c
      0087B4 25 03            [ 1]  144 	jrc	00102$
      0087B6 CC 88 6E         [ 2]  145 	jp	00106$
      0087B9                        146 00102$:
                                    147 ;	../src/leds.c: 129: ledId = ledId << 1;
      0087B9 08 11            [ 1]  148 	sll	(0x11, sp)
                                    149 ;	../src/leds.c: 131: GPIO_TypeDef * gpioPortPos = (GPIO_TypeDef * )leds_anode[ledId];
      0087BB 5F               [ 1]  150 	clrw	x
      0087BC 7B 11            [ 1]  151 	ld	a, (0x11, sp)
      0087BE 97               [ 1]  152 	ld	xl, a
      0087BF 58               [ 2]  153 	sllw	x
      0087C0 90 93            [ 1]  154 	ldw	y, x
      0087C2 DE 80 AD         [ 2]  155 	ldw	x, (_leds_anode+0, x)
      0087C5 1F 02            [ 2]  156 	ldw	(0x02, sp), x
                                    157 ;	../src/leds.c: 132: GPIO_TypeDef * gpioPortNeg = (GPIO_TypeDef *) leds_cathode[ledId];
      0087C7 93               [ 1]  158 	ldw	x, y
      0087C8 1C 80 DD         [ 2]  159 	addw	x, #(_leds_cathode+0)
      0087CB FE               [ 2]  160 	ldw	x, (x)
      0087CC 1F 04            [ 2]  161 	ldw	(0x04, sp), x
                                    162 ;	../src/leds.c: 133: uint8_t gpioPinPos = leds_anode[ledId+1];
      0087CE 7B 11            [ 1]  163 	ld	a, (0x11, sp)
      0087D0 4C               [ 1]  164 	inc	a
      0087D1 97               [ 1]  165 	ld	xl, a
      0087D2 49               [ 1]  166 	rlc	a
      0087D3 4F               [ 1]  167 	clr	a
      0087D4 A2 00            [ 1]  168 	sbc	a, #0x00
      0087D6 95               [ 1]  169 	ld	xh, a
      0087D7 58               [ 2]  170 	sllw	x
      0087D8 90 93            [ 1]  171 	ldw	y, x
      0087DA 1C 80 AD         [ 2]  172 	addw	x, #(_leds_anode+0)
      0087DD E6 01            [ 1]  173 	ld	a, (0x1, x)
      0087DF 6B 0E            [ 1]  174 	ld	(0x0e, sp), a
                                    175 ;	../src/leds.c: 134: uint8_t gpioPinNeg = leds_cathode[ledId+1];
      0087E1 93               [ 1]  176 	ldw	x, y
      0087E2 1C 80 DD         [ 2]  177 	addw	x, #(_leds_cathode+0)
      0087E5 E6 01            [ 1]  178 	ld	a, (0x1, x)
      0087E7 6B 01            [ 1]  179 	ld	(0x01, sp), a
                                    180 ;	../src/leds.c: 138: gpioPortPos->ODR |= (gpioPinPos);
      0087E9 1E 02            [ 2]  181 	ldw	x, (0x02, sp)
      0087EB F6               [ 1]  182 	ld	a, (x)
      0087EC 6B 06            [ 1]  183 	ld	(0x06, sp), a
                                    184 ;	../src/leds.c: 139: gpioPortNeg->ODR &= ~(gpioPinNeg);
      0087EE 7B 01            [ 1]  185 	ld	a, (0x01, sp)
      0087F0 43               [ 1]  186 	cpl	a
      0087F1 6B 07            [ 1]  187 	ld	(0x07, sp), a
                                    188 ;	../src/leds.c: 141: gpioPortPos->DDR |= gpioPinPos;
      0087F3 1E 02            [ 2]  189 	ldw	x, (0x02, sp)
      0087F5 5C               [ 1]  190 	incw	x
      0087F6 5C               [ 1]  191 	incw	x
      0087F7 1F 08            [ 2]  192 	ldw	(0x08, sp), x
                                    193 ;	../src/leds.c: 142: gpioPortNeg->DDR |= gpioPinNeg;
      0087F9 1E 04            [ 2]  194 	ldw	x, (0x04, sp)
      0087FB 5C               [ 1]  195 	incw	x
      0087FC 5C               [ 1]  196 	incw	x
      0087FD 1F 0A            [ 2]  197 	ldw	(0x0a, sp), x
                                    198 ;	../src/leds.c: 143: gpioPortPos->CR1 |= gpioPinPos;
      0087FF 16 02            [ 2]  199 	ldw	y, (0x02, sp)
      008801 72 A9 00 03      [ 2]  200 	addw	y, #0x0003
                                    201 ;	../src/leds.c: 144: gpioPortNeg->CR1 |= gpioPinNeg;
      008805 1E 04            [ 2]  202 	ldw	x, (0x04, sp)
      008807 1C 00 03         [ 2]  203 	addw	x, #0x0003
      00880A 1F 0C            [ 2]  204 	ldw	(0x0c, sp), x
                                    205 ;	../src/leds.c: 136: if(state) //turn on
      00880C 0D 12            [ 1]  206 	tnz	(0x12, sp)
      00880E 27 2F            [ 1]  207 	jreq	00104$
                                    208 ;	../src/leds.c: 138: gpioPortPos->ODR |= (gpioPinPos);
      008810 7B 06            [ 1]  209 	ld	a, (0x06, sp)
      008812 1A 0E            [ 1]  210 	or	a, (0x0e, sp)
      008814 1E 02            [ 2]  211 	ldw	x, (0x02, sp)
      008816 F7               [ 1]  212 	ld	(x), a
                                    213 ;	../src/leds.c: 139: gpioPortNeg->ODR &= ~(gpioPinNeg);
      008817 1E 04            [ 2]  214 	ldw	x, (0x04, sp)
      008819 F6               [ 1]  215 	ld	a, (x)
      00881A 14 07            [ 1]  216 	and	a, (0x07, sp)
      00881C 1E 04            [ 2]  217 	ldw	x, (0x04, sp)
      00881E F7               [ 1]  218 	ld	(x), a
                                    219 ;	../src/leds.c: 141: gpioPortPos->DDR |= gpioPinPos;
      00881F 1E 08            [ 2]  220 	ldw	x, (0x08, sp)
      008821 F6               [ 1]  221 	ld	a, (x)
      008822 1A 0E            [ 1]  222 	or	a, (0x0e, sp)
      008824 1E 08            [ 2]  223 	ldw	x, (0x08, sp)
      008826 F7               [ 1]  224 	ld	(x), a
                                    225 ;	../src/leds.c: 142: gpioPortNeg->DDR |= gpioPinNeg;
      008827 1E 0A            [ 2]  226 	ldw	x, (0x0a, sp)
      008829 F6               [ 1]  227 	ld	a, (x)
      00882A 1A 01            [ 1]  228 	or	a, (0x01, sp)
      00882C 1E 0A            [ 2]  229 	ldw	x, (0x0a, sp)
      00882E F7               [ 1]  230 	ld	(x), a
                                    231 ;	../src/leds.c: 143: gpioPortPos->CR1 |= gpioPinPos;
      00882F 90 F6            [ 1]  232 	ld	a, (y)
      008831 1A 0E            [ 1]  233 	or	a, (0x0e, sp)
      008833 90 F7            [ 1]  234 	ld	(y), a
                                    235 ;	../src/leds.c: 144: gpioPortNeg->CR1 |= gpioPinNeg;
      008835 1E 0C            [ 2]  236 	ldw	x, (0x0c, sp)
      008837 F6               [ 1]  237 	ld	a, (x)
      008838 1A 01            [ 1]  238 	or	a, (0x01, sp)
      00883A 1E 0C            [ 2]  239 	ldw	x, (0x0c, sp)
      00883C F7               [ 1]  240 	ld	(x), a
      00883D 20 2F            [ 2]  241 	jra	00106$
      00883F                        242 00104$:
                                    243 ;	../src/leds.c: 148: gpioPortPos->ODR &= ~(gpioPinPos);
      00883F 03 0E            [ 1]  244 	cpl	(0x0e, sp)
      008841 7B 06            [ 1]  245 	ld	a, (0x06, sp)
      008843 14 0E            [ 1]  246 	and	a, (0x0e, sp)
      008845 1E 02            [ 2]  247 	ldw	x, (0x02, sp)
      008847 F7               [ 1]  248 	ld	(x), a
                                    249 ;	../src/leds.c: 149: gpioPortNeg->ODR &= ~(gpioPinNeg);
      008848 1E 04            [ 2]  250 	ldw	x, (0x04, sp)
      00884A F6               [ 1]  251 	ld	a, (x)
      00884B 14 07            [ 1]  252 	and	a, (0x07, sp)
      00884D 1E 04            [ 2]  253 	ldw	x, (0x04, sp)
      00884F F7               [ 1]  254 	ld	(x), a
                                    255 ;	../src/leds.c: 150: gpioPortPos->DDR &= ~gpioPinPos;
      008850 1E 08            [ 2]  256 	ldw	x, (0x08, sp)
      008852 F6               [ 1]  257 	ld	a, (x)
      008853 14 0E            [ 1]  258 	and	a, (0x0e, sp)
      008855 1E 08            [ 2]  259 	ldw	x, (0x08, sp)
      008857 F7               [ 1]  260 	ld	(x), a
                                    261 ;	../src/leds.c: 151: gpioPortNeg->DDR &= ~gpioPinNeg;
      008858 1E 0A            [ 2]  262 	ldw	x, (0x0a, sp)
      00885A F6               [ 1]  263 	ld	a, (x)
      00885B 14 07            [ 1]  264 	and	a, (0x07, sp)
      00885D 1E 0A            [ 2]  265 	ldw	x, (0x0a, sp)
      00885F F7               [ 1]  266 	ld	(x), a
                                    267 ;	../src/leds.c: 152: gpioPortPos->CR1 &= ~gpioPinPos;
      008860 90 F6            [ 1]  268 	ld	a, (y)
      008862 14 0E            [ 1]  269 	and	a, (0x0e, sp)
      008864 90 F7            [ 1]  270 	ld	(y), a
                                    271 ;	../src/leds.c: 153: gpioPortNeg->CR1 &= ~gpioPinNeg;
      008866 1E 0C            [ 2]  272 	ldw	x, (0x0c, sp)
      008868 F6               [ 1]  273 	ld	a, (x)
      008869 14 07            [ 1]  274 	and	a, (0x07, sp)
      00886B 1E 0C            [ 2]  275 	ldw	x, (0x0c, sp)
      00886D F7               [ 1]  276 	ld	(x), a
      00886E                        277 00106$:
                                    278 ;	../src/leds.c: 155: }
      00886E 5B 0E            [ 2]  279 	addw	sp, #14
      008870 81               [ 4]  280 	ret
                                    281 ;	../src/leds.c: 158: uint8_t GetLedState(uint8_t ledID)
                                    282 ;	-----------------------------------------
                                    283 ;	 function GetLedState
                                    284 ;	-----------------------------------------
      008871                        285 _GetLedState:
                                    286 ;	../src/leds.c: 161: return (ledsState & (v << ledID))?1:0;
      008871 7B 03            [ 1]  287 	ld	a, (0x03, sp)
      008873 5F               [ 1]  288 	clrw	x
      008874 5C               [ 1]  289 	incw	x
      008875 4D               [ 1]  290 	tnz	a
      008876 27 04            [ 1]  291 	jreq	00111$
      008878                        292 00110$:
      008878 58               [ 2]  293 	sllw	x
      008879 4A               [ 1]  294 	dec	a
      00887A 26 FC            [ 1]  295 	jrne	00110$
      00887C                        296 00111$:
      00887C 9F               [ 1]  297 	ld	a, xl
      00887D C4 02 48         [ 1]  298 	and	a, _ledsState+1
      008880 02               [ 1]  299 	rlwa	x
      008881 C4 02 47         [ 1]  300 	and	a, _ledsState+0
      008884 95               [ 1]  301 	ld	xh, a
      008885 5D               [ 2]  302 	tnzw	x
      008886 27 03            [ 1]  303 	jreq	00103$
      008888 5F               [ 1]  304 	clrw	x
      008889 5C               [ 1]  305 	incw	x
      00888A 21                     306 	.byte 0x21
      00888B                        307 00103$:
      00888B 5F               [ 1]  308 	clrw	x
      00888C                        309 00104$:
      00888C 9F               [ 1]  310 	ld	a, xl
                                    311 ;	../src/leds.c: 162: }
      00888D 81               [ 4]  312 	ret
                                    313 ;	../src/leds.c: 165: void SetLedState(uint8_t ledID, uint8_t state)
                                    314 ;	-----------------------------------------
                                    315 ;	 function SetLedState
                                    316 ;	-----------------------------------------
      00888E                        317 _SetLedState:
                                    318 ;	../src/leds.c: 168: if(state) ledsState |= (v << ledID);
      00888E 7B 03            [ 1]  319 	ld	a, (0x03, sp)
      008890 5F               [ 1]  320 	clrw	x
      008891 5C               [ 1]  321 	incw	x
      008892 4D               [ 1]  322 	tnz	a
      008893 27 04            [ 1]  323 	jreq	00112$
      008895                        324 00111$:
      008895 58               [ 2]  325 	sllw	x
      008896 4A               [ 1]  326 	dec	a
      008897 26 FC            [ 1]  327 	jrne	00111$
      008899                        328 00112$:
      008899 0D 04            [ 1]  329 	tnz	(0x04, sp)
      00889B 27 0D            [ 1]  330 	jreq	00102$
      00889D 9F               [ 1]  331 	ld	a, xl
      00889E CA 02 48         [ 1]  332 	or	a, _ledsState+1
      0088A1 02               [ 1]  333 	rlwa	x
      0088A2 CA 02 47         [ 1]  334 	or	a, _ledsState+0
      0088A5 95               [ 1]  335 	ld	xh, a
      0088A6 CF 02 47         [ 2]  336 	ldw	_ledsState+0, x
      0088A9 81               [ 4]  337 	ret
      0088AA                        338 00102$:
                                    339 ;	../src/leds.c: 169: else ledsState &= ~(v << ledID); 
      0088AA 53               [ 2]  340 	cplw	x
      0088AB 9F               [ 1]  341 	ld	a, xl
      0088AC C4 02 48         [ 1]  342 	and	a, _ledsState+1
      0088AF 02               [ 1]  343 	rlwa	x
      0088B0 C4 02 47         [ 1]  344 	and	a, _ledsState+0
      0088B3 95               [ 1]  345 	ld	xh, a
      0088B4 CF 02 47         [ 2]  346 	ldw	_ledsState+0, x
                                    347 ;	../src/leds.c: 170: }
      0088B7 81               [ 4]  348 	ret
                                    349 	.area CODE
                                    350 	.area CONST
      0080AD                        351 _leds_anode:
      0080AD 50 0A                  352 	.dw #0x500a
      0080AF 00 08                  353 	.dw #0x0008
      0080B1 50 00                  354 	.dw #0x5000
      0080B3 00 08                  355 	.dw #0x0008
      0080B5 50 05                  356 	.dw #0x5005
      0080B7 00 10                  357 	.dw #0x0010
      0080B9 50 00                  358 	.dw #0x5000
      0080BB 00 08                  359 	.dw #0x0008
      0080BD 50 0A                  360 	.dw #0x500a
      0080BF 00 08                  361 	.dw #0x0008
      0080C1 50 05                  362 	.dw #0x5005
      0080C3 00 10                  363 	.dw #0x0010
      0080C5 50 05                  364 	.dw #0x5005
      0080C7 00 20                  365 	.dw #0x0020
      0080C9 50 00                  366 	.dw #0x5000
      0080CB 00 08                  367 	.dw #0x0008
      0080CD 50 05                  368 	.dw #0x5005
      0080CF 00 20                  369 	.dw #0x0020
      0080D1 50 0A                  370 	.dw #0x500a
      0080D3 00 08                  371 	.dw #0x0008
      0080D5 50 05                  372 	.dw #0x5005
      0080D7 00 10                  373 	.dw #0x0010
      0080D9 50 05                  374 	.dw #0x5005
      0080DB 00 20                  375 	.dw #0x0020
      0080DD                        376 _leds_cathode:
      0080DD 50 00                  377 	.dw #0x5000
      0080DF 00 08                  378 	.dw #0x0008
      0080E1 50 0A                  379 	.dw #0x500a
      0080E3 00 08                  380 	.dw #0x0008
      0080E5 50 00                  381 	.dw #0x5000
      0080E7 00 08                  382 	.dw #0x0008
      0080E9 50 05                  383 	.dw #0x5005
      0080EB 00 10                  384 	.dw #0x0010
      0080ED 50 05                  385 	.dw #0x5005
      0080EF 00 10                  386 	.dw #0x0010
      0080F1 50 0A                  387 	.dw #0x500a
      0080F3 00 08                  388 	.dw #0x0008
      0080F5 50 00                  389 	.dw #0x5000
      0080F7 00 08                  390 	.dw #0x0008
      0080F9 50 05                  391 	.dw #0x5005
      0080FB 00 20                  392 	.dw #0x0020
      0080FD 50 0A                  393 	.dw #0x500a
      0080FF 00 08                  394 	.dw #0x0008
      008101 50 05                  395 	.dw #0x5005
      008103 00 20                  396 	.dw #0x0020
      008105 50 05                  397 	.dw #0x5005
      008107 00 20                  398 	.dw #0x0020
      008109 50 05                  399 	.dw #0x5005
      00810B 00 10                  400 	.dw #0x0010
                                    401 	.area INITIALIZER
                                    402 	.area CABS (ABS)
