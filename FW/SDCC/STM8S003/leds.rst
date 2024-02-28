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
                           000000    22 Fleds$ledsState$0_0$0==.
      000055                         23 _ledsState:
      000055                         24 	.ds 2
                           000002    25 Lleds.UpdateLedState$ledId$1_0$325==.
      000057                         26 _UpdateLedState_ledId_65536_325:
      000057                         27 	.ds 1
                           000003    28 Lleds.UpdateLedState$ledIdPrev$1_0$325==.
      000058                         29 _UpdateLedState_ledIdPrev_65536_325:
      000058                         30 	.ds 1
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area INITIALIZED
                                     35 ;--------------------------------------------------------
                                     36 ; absolute external ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area DABS (ABS)
                                     39 
                                     40 ; default segment ordering for linker
                                     41 	.area HOME
                                     42 	.area GSINIT
                                     43 	.area GSFINAL
                                     44 	.area CONST
                                     45 	.area INITIALIZER
                                     46 	.area CODE
                                     47 
                                     48 ;--------------------------------------------------------
                                     49 ; global & static initialisations
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
                                     52 	.area GSINIT
                                     53 	.area GSFINAL
                                     54 	.area GSINIT
                           000000    55 	G$UpdateLedState$0$0 ==.
                           000000    56 	C$leds.c$97$1_0$325 ==.
                                     57 ;	../src/leds.c: 97: static uint8_t ledId = 0;
                                     58 ; genAssign
      008093 72 5F 00 57      [ 1]   59 	clr	_UpdateLedState_ledId_65536_325+0
                           000004    60 	C$leds.c$98$1_0$325 ==.
                                     61 ;	../src/leds.c: 98: static uint8_t ledIdPrev = NUM_OF_LEDS-1;
                                     62 ; genAssign
      008097 35 0B 00 58      [ 1]   63 	mov	_UpdateLedState_ledIdPrev_65536_325+0, #0x0b
                                     64 ;--------------------------------------------------------
                                     65 ; Home
                                     66 ;--------------------------------------------------------
                                     67 	.area HOME
                                     68 	.area HOME
                                     69 ;--------------------------------------------------------
                                     70 ; code
                                     71 ;--------------------------------------------------------
                                     72 	.area CODE
                           000000    73 	G$LedsInit$0$0 ==.
                           000000    74 	C$leds.c$55$0_0$319 ==.
                                     75 ;	../src/leds.c: 55: void LedsInit( void )
                                     76 ; genLabel
                                     77 ;	-----------------------------------------
                                     78 ;	 function LedsInit
                                     79 ;	-----------------------------------------
                                     80 ;	Register assignment is optimal.
                                     81 ;	Stack space usage: 0 bytes.
      008AA8                         82 _LedsInit:
                           000000    83 	C$leds.c$57$1_0$319 ==.
                                     84 ;	../src/leds.c: 57: ledsState = 0x00;
                                     85 ; genAssign
      008AA8 5F               [ 1]   86 	clrw	x
      008AA9 CF 00 55         [ 2]   87 	ldw	_ledsState+0, x
                           000004    88 	C$leds.c$58$1_0$319 ==.
                                     89 ;	../src/leds.c: 58: GpioInit();
                                     90 ; genCall
      008AAC CC 8A B0         [ 2]   91 	jp	_GpioInit
                                     92 ; genLabel
      008AAF                         93 00101$:
                           000007    94 	C$leds.c$59$1_0$319 ==.
                                     95 ;	../src/leds.c: 59: }
                                     96 ; genEndFunction
                           000007    97 	C$leds.c$59$1_0$319 ==.
                           000007    98 	XG$LedsInit$0$0 ==.
      008AAF 81               [ 4]   99 	ret
                           000008   100 	Fleds$GpioInit$0$0 ==.
                           000008   101 	C$leds.c$72$1_0$322 ==.
                                    102 ;	../src/leds.c: 72: static void GpioInit( void ){
                                    103 ; genLabel
                                    104 ;	-----------------------------------------
                                    105 ;	 function GpioInit
                                    106 ;	-----------------------------------------
                                    107 ;	Register assignment is optimal.
                                    108 ;	Stack space usage: 0 bytes.
      008AB0                        109 _GpioInit:
                           000008   110 	C$leds.c$75$2_0$322 ==.
                                    111 ;	../src/leds.c: 75: for(idx = 0; idx < NUM_OF_LEDS; idx++){
                                    112 ; genAssign
      008AB0 4F               [ 1]  113 	clr	a
                                    114 ; genLabel
      008AB1                        115 00102$:
                           000009   116 	C$leds.c$76$3_0$323 ==.
                                    117 ;	../src/leds.c: 76: SetLedRaw(idx, LED_OFF_STATE);
                                    118 ; genIPush
      008AB1 88               [ 1]  119 	push	a
      008AB2 4B 00            [ 1]  120 	push	#0x00
                                    121 ; genIPush
      008AB4 88               [ 1]  122 	push	a
                                    123 ; genCall
      008AB5 CD 8B 02         [ 4]  124 	call	_SetLedRaw
      008AB8 85               [ 2]  125 	popw	x
      008AB9 84               [ 1]  126 	pop	a
                           000012   127 	C$leds.c$75$2_0$322 ==.
                                    128 ;	../src/leds.c: 75: for(idx = 0; idx < NUM_OF_LEDS; idx++){
                                    129 ; genPlus
      008ABA 4C               [ 1]  130 	inc	a
                                    131 ; genCmp
                                    132 ; genCmpTop
      008ABB A1 0C            [ 1]  133 	cp	a, #0x0c
      008ABD 24 03            [ 1]  134 	jrnc	00112$
      008ABF CC 8A B1         [ 2]  135 	jp	00102$
      008AC2                        136 00112$:
                                    137 ; skipping generated iCode
                                    138 ; genLabel
      008AC2                        139 00104$:
                           00001A   140 	C$leds.c$78$2_0$322 ==.
                                    141 ;	../src/leds.c: 78: }
                                    142 ; genEndFunction
                           00001A   143 	C$leds.c$78$2_0$322 ==.
                           00001A   144 	XFleds$GpioInit$0$0 ==.
      008AC2 81               [ 4]  145 	ret
                           00001B   146 	G$UpdateLedState$0$0 ==.
                           00001B   147 	C$leds.c$95$2_0$325 ==.
                                    148 ;	../src/leds.c: 95: void UpdateLedState( void )
                                    149 ; genLabel
                                    150 ;	-----------------------------------------
                                    151 ;	 function UpdateLedState
                                    152 ;	-----------------------------------------
                                    153 ;	Register assignment might be sub-optimal.
                                    154 ;	Stack space usage: 0 bytes.
      008AC3                        155 _UpdateLedState:
                           00001B   156 	C$leds.c$101$1_0$325 ==.
                                    157 ;	../src/leds.c: 101: ledId = (ledId == NUM_OF_LEDS-1)?0:(ledId+1);
                                    158 ; genCmpEQorNE
      008AC3 C6 00 57         [ 1]  159 	ld	a, _UpdateLedState_ledId_65536_325+0
      008AC6 A1 0B            [ 1]  160 	cp	a, #0x0b
      008AC8 26 03            [ 1]  161 	jrne	00111$
      008ACA CC 8A D0         [ 2]  162 	jp	00112$
      008ACD                        163 00111$:
      008ACD CC 8A D5         [ 2]  164 	jp	00103$
      008AD0                        165 00112$:
                                    166 ; skipping generated iCode
                                    167 ; genAssign
      008AD0 4F               [ 1]  168 	clr	a
      008AD1 5F               [ 1]  169 	clrw	x
                                    170 ; genGoto
      008AD2 CC 8A E0         [ 2]  171 	jp	00104$
                                    172 ; genLabel
      008AD5                        173 00103$:
                                    174 ; genCast
                                    175 ; genAssign
      008AD5 C6 00 57         [ 1]  176 	ld	a, _UpdateLedState_ledId_65536_325+0
                                    177 ; genPlus
      008AD8 4C               [ 1]  178 	inc	a
                                    179 ; genCast
      008AD9 88               [ 1]  180 	push	a
      008ADA 49               [ 1]  181 	rlc	a
      008ADB 4F               [ 1]  182 	clr	a
      008ADC A2 00            [ 1]  183 	sbc	a, #0x00
      008ADE 97               [ 1]  184 	ld	xl, a
      008ADF 84               [ 1]  185 	pop	a
                                    186 ; genAssign
                                    187 ; genLabel
      008AE0                        188 00104$:
                                    189 ; genCast
                                    190 ; genAssign
      008AE0 C7 00 57         [ 1]  191 	ld	_UpdateLedState_ledId_65536_325+0, a
                           00003B   192 	C$leds.c$103$1_0$325 ==.
                                    193 ;	../src/leds.c: 103: SetLedRaw(ledIdPrev, LED_OFF_STATE);
                                    194 ; genIPush
      008AE3 4B 00            [ 1]  195 	push	#0x00
                                    196 ; genIPush
      008AE5 3B 00 58         [ 1]  197 	push	_UpdateLedState_ledIdPrev_65536_325+0
                                    198 ; genCall
      008AE8 CD 8B 02         [ 4]  199 	call	_SetLedRaw
      008AEB 85               [ 2]  200 	popw	x
                           000044   201 	C$leds.c$104$1_0$325 ==.
                                    202 ;	../src/leds.c: 104: SetLedRaw(ledId,GetLedState(ledId));
                                    203 ; genIPush
      008AEC 3B 00 57         [ 1]  204 	push	_UpdateLedState_ledId_65536_325+0
                                    205 ; genCall
      008AEF CD 8B D1         [ 4]  206 	call	_GetLedState
      008AF2 5B 01            [ 2]  207 	addw	sp, #1
                                    208 ; genIPush
      008AF4 88               [ 1]  209 	push	a
                                    210 ; genIPush
      008AF5 3B 00 57         [ 1]  211 	push	_UpdateLedState_ledId_65536_325+0
                                    212 ; genCall
      008AF8 CD 8B 02         [ 4]  213 	call	_SetLedRaw
      008AFB 85               [ 2]  214 	popw	x
                           000054   215 	C$leds.c$105$1_0$325 ==.
                                    216 ;	../src/leds.c: 105: ledIdPrev = ledId; 
                                    217 ; genAssign
      008AFC 55 00 57 00 58   [ 1]  218 	mov	_UpdateLedState_ledIdPrev_65536_325+0, _UpdateLedState_ledId_65536_325+0
                                    219 ; genLabel
      008B01                        220 00101$:
                           000059   221 	C$leds.c$106$1_0$325 ==.
                                    222 ;	../src/leds.c: 106: }
                                    223 ; genEndFunction
                           000059   224 	C$leds.c$106$1_0$325 ==.
                           000059   225 	XG$UpdateLedState$0$0 ==.
      008B01 81               [ 4]  226 	ret
                           00005A   227 	G$SetLedRaw$0$0 ==.
                           00005A   228 	C$leds.c$126$1_0$327 ==.
                                    229 ;	../src/leds.c: 126: void SetLedRaw(uint8_t ledId, uint8_t state){
                                    230 ; genLabel
                                    231 ;	-----------------------------------------
                                    232 ;	 function SetLedRaw
                                    233 ;	-----------------------------------------
                                    234 ;	Register assignment might be sub-optimal.
                                    235 ;	Stack space usage: 14 bytes.
      008B02                        236 _SetLedRaw:
      008B02 52 0E            [ 2]  237 	sub	sp, #14
                           00005C   238 	C$leds.c$128$1_0$327 ==.
                                    239 ;	../src/leds.c: 128: if(ledId >= NUM_OF_LEDS) return;
                                    240 ; genCmp
                                    241 ; genCmpTop
      008B04 7B 11            [ 1]  242 	ld	a, (0x11, sp)
      008B06 A1 0C            [ 1]  243 	cp	a, #0x0c
      008B08 24 03            [ 1]  244 	jrnc	00118$
      008B0A CC 8B 10         [ 2]  245 	jp	00102$
      008B0D                        246 00118$:
                                    247 ; skipping generated iCode
                                    248 ; genReturn
      008B0D CC 8B CE         [ 2]  249 	jp	00106$
                                    250 ; genLabel
      008B10                        251 00102$:
                           000068   252 	C$leds.c$129$1_0$327 ==.
                                    253 ;	../src/leds.c: 129: ledId = ledId << 1;
                                    254 ; genCast
                                    255 ; genAssign
      008B10 7B 11            [ 1]  256 	ld	a, (0x11, sp)
                                    257 ; genLeftShiftLiteral
      008B12 48               [ 1]  258 	sll	a
      008B13 6B 11            [ 1]  259 	ld	(0x11, sp), a
                           00006D   260 	C$leds.c$131$1_1$328 ==.
                                    261 ;	../src/leds.c: 131: GPIO_TypeDef * gpioPortPos = (GPIO_TypeDef * )leds_anode[ledId];
                                    262 ; skipping iCode since result will be rematerialized
                                    263 ; genCast
                                    264 ; genAssign
      008B15 5F               [ 1]  265 	clrw	x
      008B16 7B 11            [ 1]  266 	ld	a, (0x11, sp)
      008B18 97               [ 1]  267 	ld	xl, a
                                    268 ; genLeftShiftLiteral
      008B19 58               [ 2]  269 	sllw	x
      008B1A 51               [ 1]  270 	exgw	x, y
                                    271 ; genPlus
      008B1B 93               [ 1]  272 	ldw	x, y
      008B1C 1C 80 A6         [ 2]  273 	addw	x, #(_leds_anode+0)
                                    274 ; genPointerGet
      008B1F FE               [ 2]  275 	ldw	x, (x)
                                    276 ; genCast
                                    277 ; genAssign
                                    278 ; genAssign
      008B20 1F 02            [ 2]  279 	ldw	(0x02, sp), x
                           00007A   280 	C$leds.c$132$1_1$328 ==.
                                    281 ;	../src/leds.c: 132: GPIO_TypeDef * gpioPortNeg = (GPIO_TypeDef *) leds_cathode[ledId];
                                    282 ; skipping iCode since result will be rematerialized
                                    283 ; genPlus
      008B22 93               [ 1]  284 	ldw	x, y
      008B23 1C 80 D6         [ 2]  285 	addw	x, #(_leds_cathode+0)
                                    286 ; genPointerGet
      008B26 FE               [ 2]  287 	ldw	x, (x)
                                    288 ; genCast
                                    289 ; genAssign
                                    290 ; genAssign
      008B27 1F 04            [ 2]  291 	ldw	(0x04, sp), x
                           000081   292 	C$leds.c$133$1_1$328 ==.
                                    293 ;	../src/leds.c: 133: uint8_t gpioPinPos = leds_anode[ledId+1];
                                    294 ; genCast
                                    295 ; genAssign
      008B29 7B 11            [ 1]  296 	ld	a, (0x11, sp)
                                    297 ; genPlus
      008B2B 4C               [ 1]  298 	inc	a
                                    299 ; genCast
      008B2C 97               [ 1]  300 	ld	xl, a
      008B2D 9F               [ 1]  301 	ld	a, xl
      008B2E 49               [ 1]  302 	rlc	a
      008B2F 4F               [ 1]  303 	clr	a
      008B30 A2 00            [ 1]  304 	sbc	a, #0x00
      008B32 95               [ 1]  305 	ld	xh, a
                                    306 ; genLeftShiftLiteral
      008B33 58               [ 2]  307 	sllw	x
      008B34 51               [ 1]  308 	exgw	x, y
                                    309 ; genPlus
      008B35 93               [ 1]  310 	ldw	x, y
      008B36 1C 80 A6         [ 2]  311 	addw	x, #(_leds_anode+0)
                                    312 ; genPointerGet
      008B39 E6 01            [ 1]  313 	ld	a, (0x1, x)
      008B3B 6B 0E            [ 1]  314 	ld	(0x0e, sp), a
                           000095   315 	C$leds.c$134$1_1$328 ==.
                                    316 ;	../src/leds.c: 134: uint8_t gpioPinNeg = leds_cathode[ledId+1];
                                    317 ; genPlus
      008B3D 93               [ 1]  318 	ldw	x, y
      008B3E 1C 80 D6         [ 2]  319 	addw	x, #(_leds_cathode+0)
                                    320 ; genPointerGet
      008B41 E6 01            [ 1]  321 	ld	a, (0x1, x)
      008B43 6B 01            [ 1]  322 	ld	(0x01, sp), a
                           00009D   323 	C$leds.c$138$1_1$327 ==.
                                    324 ;	../src/leds.c: 138: gpioPortPos->ODR |= (gpioPinPos);
                                    325 ; genPointerGet
      008B45 1E 02            [ 2]  326 	ldw	x, (0x02, sp)
      008B47 F6               [ 1]  327 	ld	a, (x)
      008B48 6B 06            [ 1]  328 	ld	(0x06, sp), a
                           0000A2   329 	C$leds.c$139$1_1$327 ==.
                                    330 ;	../src/leds.c: 139: gpioPortNeg->ODR &= ~(gpioPinNeg);
                                    331 ; genCpl
      008B4A 7B 01            [ 1]  332 	ld	a, (0x01, sp)
      008B4C 43               [ 1]  333 	cpl	a
      008B4D 6B 07            [ 1]  334 	ld	(0x07, sp), a
                           0000A7   335 	C$leds.c$141$1_1$327 ==.
                                    336 ;	../src/leds.c: 141: gpioPortPos->DDR |= gpioPinPos;
                                    337 ; genPlus
      008B4F 1E 02            [ 2]  338 	ldw	x, (0x02, sp)
      008B51 5C               [ 1]  339 	incw	x
      008B52 5C               [ 1]  340 	incw	x
      008B53 1F 08            [ 2]  341 	ldw	(0x08, sp), x
                           0000AD   342 	C$leds.c$142$1_1$327 ==.
                                    343 ;	../src/leds.c: 142: gpioPortNeg->DDR |= gpioPinNeg;
                                    344 ; genPlus
      008B55 1E 04            [ 2]  345 	ldw	x, (0x04, sp)
      008B57 5C               [ 1]  346 	incw	x
      008B58 5C               [ 1]  347 	incw	x
      008B59 1F 0A            [ 2]  348 	ldw	(0x0a, sp), x
                           0000B3   349 	C$leds.c$143$1_1$327 ==.
                                    350 ;	../src/leds.c: 143: gpioPortPos->CR1 |= gpioPinPos;
                                    351 ; genPlus
      008B5B 16 02            [ 2]  352 	ldw	y, (0x02, sp)
      008B5D 72 A9 00 03      [ 2]  353 	addw	y, #0x0003
                           0000B9   354 	C$leds.c$144$1_1$327 ==.
                                    355 ;	../src/leds.c: 144: gpioPortNeg->CR1 |= gpioPinNeg;
                                    356 ; genPlus
      008B61 1E 04            [ 2]  357 	ldw	x, (0x04, sp)
      008B63 1C 00 03         [ 2]  358 	addw	x, #0x0003
      008B66 1F 0C            [ 2]  359 	ldw	(0x0c, sp), x
                           0000C0   360 	C$leds.c$136$1_1$328 ==.
                                    361 ;	../src/leds.c: 136: if(state) //turn on
                                    362 ; genIfx
      008B68 0D 12            [ 1]  363 	tnz	(0x12, sp)
      008B6A 26 03            [ 1]  364 	jrne	00119$
      008B6C CC 8B 9F         [ 2]  365 	jp	00104$
      008B6F                        366 00119$:
                           0000C7   367 	C$leds.c$138$2_1$329 ==.
                                    368 ;	../src/leds.c: 138: gpioPortPos->ODR |= (gpioPinPos);
                                    369 ; genOr
      008B6F 7B 06            [ 1]  370 	ld	a, (0x06, sp)
      008B71 1A 0E            [ 1]  371 	or	a, (0x0e, sp)
                                    372 ; genPointerSet
      008B73 1E 02            [ 2]  373 	ldw	x, (0x02, sp)
      008B75 F7               [ 1]  374 	ld	(x), a
                           0000CE   375 	C$leds.c$139$2_1$329 ==.
                                    376 ;	../src/leds.c: 139: gpioPortNeg->ODR &= ~(gpioPinNeg);
                                    377 ; genPointerGet
      008B76 1E 04            [ 2]  378 	ldw	x, (0x04, sp)
      008B78 F6               [ 1]  379 	ld	a, (x)
                                    380 ; genAnd
      008B79 14 07            [ 1]  381 	and	a, (0x07, sp)
                                    382 ; genPointerSet
      008B7B 1E 04            [ 2]  383 	ldw	x, (0x04, sp)
      008B7D F7               [ 1]  384 	ld	(x), a
                           0000D6   385 	C$leds.c$141$2_1$329 ==.
                                    386 ;	../src/leds.c: 141: gpioPortPos->DDR |= gpioPinPos;
                                    387 ; genPointerGet
      008B7E 1E 08            [ 2]  388 	ldw	x, (0x08, sp)
      008B80 F6               [ 1]  389 	ld	a, (x)
                                    390 ; genOr
      008B81 1A 0E            [ 1]  391 	or	a, (0x0e, sp)
                                    392 ; genPointerSet
      008B83 1E 08            [ 2]  393 	ldw	x, (0x08, sp)
      008B85 F7               [ 1]  394 	ld	(x), a
                           0000DE   395 	C$leds.c$142$2_1$329 ==.
                                    396 ;	../src/leds.c: 142: gpioPortNeg->DDR |= gpioPinNeg;
                                    397 ; genPointerGet
      008B86 1E 0A            [ 2]  398 	ldw	x, (0x0a, sp)
      008B88 F6               [ 1]  399 	ld	a, (x)
                                    400 ; genOr
      008B89 1A 01            [ 1]  401 	or	a, (0x01, sp)
                                    402 ; genPointerSet
      008B8B 1E 0A            [ 2]  403 	ldw	x, (0x0a, sp)
      008B8D F7               [ 1]  404 	ld	(x), a
                           0000E6   405 	C$leds.c$143$2_1$329 ==.
                                    406 ;	../src/leds.c: 143: gpioPortPos->CR1 |= gpioPinPos;
                                    407 ; genPointerGet
      008B8E 90 F6            [ 1]  408 	ld	a, (y)
                                    409 ; genOr
      008B90 1A 0E            [ 1]  410 	or	a, (0x0e, sp)
                                    411 ; genPointerSet
      008B92 90 F7            [ 1]  412 	ld	(y), a
                           0000EC   413 	C$leds.c$144$2_1$329 ==.
                                    414 ;	../src/leds.c: 144: gpioPortNeg->CR1 |= gpioPinNeg;
                                    415 ; genPointerGet
      008B94 1E 0C            [ 2]  416 	ldw	x, (0x0c, sp)
      008B96 F6               [ 1]  417 	ld	a, (x)
                                    418 ; genOr
      008B97 1A 01            [ 1]  419 	or	a, (0x01, sp)
                                    420 ; genPointerSet
      008B99 1E 0C            [ 2]  421 	ldw	x, (0x0c, sp)
      008B9B F7               [ 1]  422 	ld	(x), a
                                    423 ; genGoto
      008B9C CC 8B CE         [ 2]  424 	jp	00106$
                                    425 ; genLabel
      008B9F                        426 00104$:
                           0000F7   427 	C$leds.c$148$2_1$330 ==.
                                    428 ;	../src/leds.c: 148: gpioPortPos->ODR &= ~(gpioPinPos);
                                    429 ; genCpl
      008B9F 03 0E            [ 1]  430 	cpl	(0x0e, sp)
                                    431 ; genAnd
      008BA1 7B 06            [ 1]  432 	ld	a, (0x06, sp)
      008BA3 14 0E            [ 1]  433 	and	a, (0x0e, sp)
                                    434 ; genPointerSet
      008BA5 1E 02            [ 2]  435 	ldw	x, (0x02, sp)
      008BA7 F7               [ 1]  436 	ld	(x), a
                           000100   437 	C$leds.c$149$2_1$330 ==.
                                    438 ;	../src/leds.c: 149: gpioPortNeg->ODR &= ~(gpioPinNeg);
                                    439 ; genPointerGet
      008BA8 1E 04            [ 2]  440 	ldw	x, (0x04, sp)
      008BAA F6               [ 1]  441 	ld	a, (x)
                                    442 ; genAnd
      008BAB 14 07            [ 1]  443 	and	a, (0x07, sp)
                                    444 ; genPointerSet
      008BAD 1E 04            [ 2]  445 	ldw	x, (0x04, sp)
      008BAF F7               [ 1]  446 	ld	(x), a
                           000108   447 	C$leds.c$150$2_1$330 ==.
                                    448 ;	../src/leds.c: 150: gpioPortPos->DDR &= ~gpioPinPos;
                                    449 ; genPointerGet
      008BB0 1E 08            [ 2]  450 	ldw	x, (0x08, sp)
      008BB2 F6               [ 1]  451 	ld	a, (x)
                                    452 ; genAnd
      008BB3 14 0E            [ 1]  453 	and	a, (0x0e, sp)
                                    454 ; genPointerSet
      008BB5 1E 08            [ 2]  455 	ldw	x, (0x08, sp)
      008BB7 F7               [ 1]  456 	ld	(x), a
                           000110   457 	C$leds.c$151$2_1$330 ==.
                                    458 ;	../src/leds.c: 151: gpioPortNeg->DDR &= ~gpioPinNeg;
                                    459 ; genPointerGet
      008BB8 1E 0A            [ 2]  460 	ldw	x, (0x0a, sp)
      008BBA F6               [ 1]  461 	ld	a, (x)
                                    462 ; genAnd
      008BBB 14 07            [ 1]  463 	and	a, (0x07, sp)
                                    464 ; genPointerSet
      008BBD 1E 0A            [ 2]  465 	ldw	x, (0x0a, sp)
      008BBF F7               [ 1]  466 	ld	(x), a
                           000118   467 	C$leds.c$152$2_1$330 ==.
                                    468 ;	../src/leds.c: 152: gpioPortPos->CR1 &= ~gpioPinPos;
                                    469 ; genPointerGet
      008BC0 90 F6            [ 1]  470 	ld	a, (y)
                                    471 ; genAnd
      008BC2 14 0E            [ 1]  472 	and	a, (0x0e, sp)
                                    473 ; genPointerSet
      008BC4 90 F7            [ 1]  474 	ld	(y), a
                           00011E   475 	C$leds.c$153$2_1$330 ==.
                                    476 ;	../src/leds.c: 153: gpioPortNeg->CR1 &= ~gpioPinNeg;
                                    477 ; genPointerGet
      008BC6 1E 0C            [ 2]  478 	ldw	x, (0x0c, sp)
      008BC8 F6               [ 1]  479 	ld	a, (x)
                                    480 ; genAnd
      008BC9 14 07            [ 1]  481 	and	a, (0x07, sp)
                                    482 ; genPointerSet
      008BCB 1E 0C            [ 2]  483 	ldw	x, (0x0c, sp)
      008BCD F7               [ 1]  484 	ld	(x), a
                                    485 ; genLabel
      008BCE                        486 00106$:
                           000126   487 	C$leds.c$155$1_1$327 ==.
                                    488 ;	../src/leds.c: 155: }
                                    489 ; genEndFunction
      008BCE 5B 0E            [ 2]  490 	addw	sp, #14
                           000128   491 	C$leds.c$155$1_1$327 ==.
                           000128   492 	XG$SetLedRaw$0$0 ==.
      008BD0 81               [ 4]  493 	ret
                           000129   494 	G$GetLedState$0$0 ==.
                           000129   495 	C$leds.c$158$1_1$332 ==.
                                    496 ;	../src/leds.c: 158: uint8_t GetLedState(uint8_t ledID)
                                    497 ; genLabel
                                    498 ;	-----------------------------------------
                                    499 ;	 function GetLedState
                                    500 ;	-----------------------------------------
                                    501 ;	Register assignment might be sub-optimal.
                                    502 ;	Stack space usage: 0 bytes.
      008BD1                        503 _GetLedState:
                           000129   504 	C$leds.c$161$1_0$332 ==.
                                    505 ;	../src/leds.c: 161: return (ledsState & (v << ledID))?1:0;
                                    506 ; genAssign
      008BD1 7B 03            [ 1]  507 	ld	a, (0x03, sp)
                                    508 ; genLeftShift
      008BD3 5F               [ 1]  509 	clrw	x
      008BD4 5C               [ 1]  510 	incw	x
      008BD5 4D               [ 1]  511 	tnz	a
      008BD6 27 04            [ 1]  512 	jreq	00111$
      008BD8                        513 00110$:
      008BD8 58               [ 2]  514 	sllw	x
      008BD9 4A               [ 1]  515 	dec	a
      008BDA 26 FC            [ 1]  516 	jrne	00110$
      008BDC                        517 00111$:
                                    518 ; genAnd
      008BDC 9F               [ 1]  519 	ld	a, xl
      008BDD C4 00 56         [ 1]  520 	and	a, _ledsState+1
      008BE0 97               [ 1]  521 	ld	xl, a
      008BE1 9E               [ 1]  522 	ld	a, xh
      008BE2 C4 00 55         [ 1]  523 	and	a, _ledsState+0
      008BE5 95               [ 1]  524 	ld	xh, a
                                    525 ; genIfx
      008BE6 5D               [ 2]  526 	tnzw	x
      008BE7 26 03            [ 1]  527 	jrne	00112$
      008BE9 CC 8B F1         [ 2]  528 	jp	00103$
      008BEC                        529 00112$:
                                    530 ; genAssign
      008BEC 5F               [ 1]  531 	clrw	x
      008BED 5C               [ 1]  532 	incw	x
                                    533 ; genGoto
      008BEE CC 8B F2         [ 2]  534 	jp	00104$
                                    535 ; genLabel
      008BF1                        536 00103$:
                                    537 ; genAssign
      008BF1 5F               [ 1]  538 	clrw	x
                                    539 ; genLabel
      008BF2                        540 00104$:
                                    541 ; genCast
                                    542 ; genAssign
      008BF2 9F               [ 1]  543 	ld	a, xl
                                    544 ; genReturn
                                    545 ; genLabel
      008BF3                        546 00101$:
                           00014B   547 	C$leds.c$162$1_0$332 ==.
                                    548 ;	../src/leds.c: 162: }
                                    549 ; genEndFunction
                           00014B   550 	C$leds.c$162$1_0$332 ==.
                           00014B   551 	XG$GetLedState$0$0 ==.
      008BF3 81               [ 4]  552 	ret
                           00014C   553 	G$SetLedState$0$0 ==.
                           00014C   554 	C$leds.c$165$1_0$334 ==.
                                    555 ;	../src/leds.c: 165: void SetLedState(uint8_t ledID, uint8_t state)
                                    556 ; genLabel
                                    557 ;	-----------------------------------------
                                    558 ;	 function SetLedState
                                    559 ;	-----------------------------------------
                                    560 ;	Register assignment might be sub-optimal.
                                    561 ;	Stack space usage: 0 bytes.
      008BF4                        562 _SetLedState:
                           00014C   563 	C$leds.c$167$2_0$334 ==.
                                    564 ;	../src/leds.c: 167: uint16_t v = 1;
                                    565 ; genAssign
      008BF4 5F               [ 1]  566 	clrw	x
      008BF5 5C               [ 1]  567 	incw	x
                           00014E   568 	C$leds.c$168$1_0$334 ==.
                                    569 ;	../src/leds.c: 168: if(state) ledsState |= (v << ledID);
                                    570 ; genAssign
      008BF6 7B 03            [ 1]  571 	ld	a, (0x03, sp)
                                    572 ; genLeftShift
      008BF8 4D               [ 1]  573 	tnz	a
      008BF9 27 04            [ 1]  574 	jreq	00112$
      008BFB                        575 00111$:
      008BFB 58               [ 2]  576 	sllw	x
      008BFC 4A               [ 1]  577 	dec	a
      008BFD 26 FC            [ 1]  578 	jrne	00111$
      008BFF                        579 00112$:
                                    580 ; genIfx
      008BFF 0D 04            [ 1]  581 	tnz	(0x04, sp)
      008C01 26 03            [ 1]  582 	jrne	00113$
      008C03 CC 8C 16         [ 2]  583 	jp	00102$
      008C06                        584 00113$:
                                    585 ; genOr
      008C06 9F               [ 1]  586 	ld	a, xl
      008C07 CA 00 56         [ 1]  587 	or	a, _ledsState+1
      008C0A 97               [ 1]  588 	ld	xl, a
      008C0B 9E               [ 1]  589 	ld	a, xh
      008C0C CA 00 55         [ 1]  590 	or	a, _ledsState+0
      008C0F 95               [ 1]  591 	ld	xh, a
                                    592 ; genAssign
      008C10 CF 00 55         [ 2]  593 	ldw	_ledsState+0, x
                                    594 ; genGoto
      008C13 CC 8C 24         [ 2]  595 	jp	00104$
                                    596 ; genLabel
      008C16                        597 00102$:
                           00016E   598 	C$leds.c$169$1_0$334 ==.
                                    599 ;	../src/leds.c: 169: else ledsState &= ~(v << ledID); 
                                    600 ; genCpl
      008C16 53               [ 2]  601 	cplw	x
      008C17 9F               [ 1]  602 	ld	a, xl
                                    603 ; genAnd
      008C18 C4 00 56         [ 1]  604 	and	a, _ledsState+1
      008C1B 97               [ 1]  605 	ld	xl, a
      008C1C 9E               [ 1]  606 	ld	a, xh
      008C1D C4 00 55         [ 1]  607 	and	a, _ledsState+0
      008C20 95               [ 1]  608 	ld	xh, a
                                    609 ; genAssign
      008C21 CF 00 55         [ 2]  610 	ldw	_ledsState+0, x
                                    611 ; genLabel
      008C24                        612 00104$:
                           00017C   613 	C$leds.c$170$1_0$334 ==.
                                    614 ;	../src/leds.c: 170: }
                                    615 ; genEndFunction
                           00017C   616 	C$leds.c$170$1_0$334 ==.
                           00017C   617 	XG$SetLedState$0$0 ==.
      008C24 81               [ 4]  618 	ret
                                    619 	.area CODE
                                    620 	.area CONST
                           000000   621 G$leds_anode$0_0$0 == .
      0080A6                        622 _leds_anode:
      0080A6 50 0A                  623 	.dw #0x500a
      0080A8 00 08                  624 	.dw #0x0008
      0080AA 50 00                  625 	.dw #0x5000
      0080AC 00 08                  626 	.dw #0x0008
      0080AE 50 05                  627 	.dw #0x5005
      0080B0 00 10                  628 	.dw #0x0010
      0080B2 50 00                  629 	.dw #0x5000
      0080B4 00 08                  630 	.dw #0x0008
      0080B6 50 0A                  631 	.dw #0x500a
      0080B8 00 08                  632 	.dw #0x0008
      0080BA 50 05                  633 	.dw #0x5005
      0080BC 00 10                  634 	.dw #0x0010
      0080BE 50 05                  635 	.dw #0x5005
      0080C0 00 20                  636 	.dw #0x0020
      0080C2 50 00                  637 	.dw #0x5000
      0080C4 00 08                  638 	.dw #0x0008
      0080C6 50 05                  639 	.dw #0x5005
      0080C8 00 20                  640 	.dw #0x0020
      0080CA 50 0A                  641 	.dw #0x500a
      0080CC 00 08                  642 	.dw #0x0008
      0080CE 50 05                  643 	.dw #0x5005
      0080D0 00 10                  644 	.dw #0x0010
      0080D2 50 05                  645 	.dw #0x5005
      0080D4 00 20                  646 	.dw #0x0020
                           000030   647 G$leds_cathode$0_0$0 == .
      0080D6                        648 _leds_cathode:
      0080D6 50 00                  649 	.dw #0x5000
      0080D8 00 08                  650 	.dw #0x0008
      0080DA 50 0A                  651 	.dw #0x500a
      0080DC 00 08                  652 	.dw #0x0008
      0080DE 50 00                  653 	.dw #0x5000
      0080E0 00 08                  654 	.dw #0x0008
      0080E2 50 05                  655 	.dw #0x5005
      0080E4 00 10                  656 	.dw #0x0010
      0080E6 50 05                  657 	.dw #0x5005
      0080E8 00 10                  658 	.dw #0x0010
      0080EA 50 0A                  659 	.dw #0x500a
      0080EC 00 08                  660 	.dw #0x0008
      0080EE 50 00                  661 	.dw #0x5000
      0080F0 00 08                  662 	.dw #0x0008
      0080F2 50 05                  663 	.dw #0x5005
      0080F4 00 20                  664 	.dw #0x0020
      0080F6 50 0A                  665 	.dw #0x500a
      0080F8 00 08                  666 	.dw #0x0008
      0080FA 50 05                  667 	.dw #0x5005
      0080FC 00 20                  668 	.dw #0x0020
      0080FE 50 05                  669 	.dw #0x5005
      008100 00 20                  670 	.dw #0x0020
      008102 50 05                  671 	.dw #0x5005
      008104 00 10                  672 	.dw #0x0010
                                    673 	.area INITIALIZER
                                    674 	.area CABS (ABS)
