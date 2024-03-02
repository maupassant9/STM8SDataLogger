                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.1.0 #12072 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module led_matrix
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _SetLedState
                                     12 	.globl _GetLedState
                                     13 	.globl _UpdateLedState
                                     14 	.globl _LedsInit
                                     15 	.globl _led_ticks
                                     16 	.globl _LedMatrixInit
                                     17 	.globl _SetLedMode
                                     18 	.globl _UpdateLeds
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area DATA
      000217                         23 _led_ticks::
      000217                         24 	.ds 48
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area INITIALIZED
                                     29 ;--------------------------------------------------------
                                     30 ; absolute external ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DABS (ABS)
                                     33 
                                     34 ; default segment ordering for linker
                                     35 	.area HOME
                                     36 	.area GSINIT
                                     37 	.area GSFINAL
                                     38 	.area CONST
                                     39 	.area INITIALIZER
                                     40 	.area CODE
                                     41 
                                     42 ;--------------------------------------------------------
                                     43 ; global & static initialisations
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area GSINIT
                                     49 ;--------------------------------------------------------
                                     50 ; Home
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area HOME
                                     54 ;--------------------------------------------------------
                                     55 ; code
                                     56 ;--------------------------------------------------------
                                     57 	.area CODE
                                     58 ;	../src/led_matrix.c: 52: void LedMatrixInit( void ){
                                     59 ;	-----------------------------------------
                                     60 ;	 function LedMatrixInit
                                     61 ;	-----------------------------------------
      0085A1                         62 _LedMatrixInit:
                                     63 ;	../src/led_matrix.c: 54: LedsInit();
                                     64 ;	../src/led_matrix.c: 55: }
      0085A1 CC 87 61         [ 2]   65 	jp	_LedsInit
                                     66 ;	../src/led_matrix.c: 71: void SetLedMode(uint8_t ledID, enum led_mode_t mode)
                                     67 ;	-----------------------------------------
                                     68 ;	 function SetLedMode
                                     69 ;	-----------------------------------------
      0085A4                         70 _SetLedMode:
      0085A4 52 09            [ 2]   71 	sub	sp, #9
                                     72 ;	../src/led_matrix.c: 75: if(mode >= LED_MODE_MAX) return;
      0085A6 7B 0D            [ 1]   73 	ld	a, (0x0d, sp)
      0085A8 A1 04            [ 1]   74 	cp	a, #0x04
      0085AA 25 03            [ 1]   75 	jrc	00102$
      0085AC CC 86 8A         [ 2]   76 	jp	00115$
      0085AF                         77 00102$:
                                     78 ;	../src/led_matrix.c: 76: if(ledID >= NUM_OF_LEDS) return;
      0085AF 7B 0C            [ 1]   79 	ld	a, (0x0c, sp)
      0085B1 A1 0C            [ 1]   80 	cp	a, #0x0c
      0085B3 25 03            [ 1]   81 	jrc	00104$
      0085B5 CC 86 8A         [ 2]   82 	jp	00115$
      0085B8                         83 00104$:
                                     84 ;	../src/led_matrix.c: 77: if(GetLedMode(ledID) == mode) return;
      0085B8 7B 0C            [ 1]   85 	ld	a, (0x0c, sp)
      0085BA 88               [ 1]   86 	push	a
      0085BB CD 86 8D         [ 4]   87 	call	_GetLedMode
      0085BE 84               [ 1]   88 	pop	a
      0085BF 7B 0D            [ 1]   89 	ld	a, (0x0d, sp)
      0085C1 6B 09            [ 1]   90 	ld	(0x09, sp), a
      0085C3 0F 08            [ 1]   91 	clr	(0x08, sp)
      0085C5 13 08            [ 2]   92 	cpw	x, (0x08, sp)
      0085C7 26 03            [ 1]   93 	jrne	00106$
      0085C9 CC 86 8A         [ 2]   94 	jp	00115$
      0085CC                         95 00106$:
                                     96 ;	../src/led_matrix.c: 79: switch(mode){
      0085CC 7B 0D            [ 1]   97 	ld	a, (0x0d, sp)
      0085CE A1 00            [ 1]   98 	cp	a, #0x00
      0085D0 27 14            [ 1]   99 	jreq	00108$
      0085D2 7B 0D            [ 1]  100 	ld	a, (0x0d, sp)
      0085D4 4A               [ 1]  101 	dec	a
      0085D5 27 2A            [ 1]  102 	jreq	00109$
      0085D7 7B 0D            [ 1]  103 	ld	a, (0x0d, sp)
      0085D9 A1 02            [ 1]  104 	cp	a, #0x02
      0085DB 27 6E            [ 1]  105 	jreq	00113$
      0085DD 7B 0D            [ 1]  106 	ld	a, (0x0d, sp)
      0085DF A1 03            [ 1]  107 	cp	a, #0x03
      0085E1 27 03            [ 1]  108 	jreq	00182$
      0085E3 CC 86 8A         [ 2]  109 	jp	00115$
      0085E6                        110 00182$:
                                    111 ;	../src/led_matrix.c: 81: case LED_OFF: led_ticks[ledID] = 0; SetLedState(ledID, mode);break;
      0085E6                        112 00108$:
      0085E6 5F               [ 1]  113 	clrw	x
      0085E7 7B 0C            [ 1]  114 	ld	a, (0x0c, sp)
      0085E9 97               [ 1]  115 	ld	xl, a
      0085EA 58               [ 2]  116 	sllw	x
      0085EB 58               [ 2]  117 	sllw	x
      0085EC 1C 02 17         [ 2]  118 	addw	x, #(_led_ticks+0)
      0085EF 90 5F            [ 1]  119 	clrw	y
      0085F1 EF 02            [ 2]  120 	ldw	(0x2, x), y
      0085F3 FF               [ 2]  121 	ldw	(x), y
      0085F4 7B 0D            [ 1]  122 	ld	a, (0x0d, sp)
      0085F6 88               [ 1]  123 	push	a
      0085F7 7B 0D            [ 1]  124 	ld	a, (0x0d, sp)
      0085F9 88               [ 1]  125 	push	a
      0085FA CD 88 8E         [ 4]  126 	call	_SetLedState
      0085FD 85               [ 2]  127 	popw	x
      0085FE CC 86 8A         [ 2]  128 	jp	00115$
                                    129 ;	../src/led_matrix.c: 82: case LED_TOGGLE_SLOW: //even number is slow
      008601                        130 00109$:
                                    131 ;	../src/led_matrix.c: 83: nxtTick = sysTick + LED_TOGGLE_SLOW_TICK;
      008601 CE 02 0F         [ 2]  132 	ldw	x, _sysTick+2
      008604 1C 03 E8         [ 2]  133 	addw	x, #0x03e8
      008607 90 CE 02 0D      [ 2]  134 	ldw	y, _sysTick+0
      00860B 24 02            [ 1]  135 	jrnc	00183$
      00860D 90 5C            [ 1]  136 	incw	y
      00860F                        137 00183$:
      00860F 1F 08            [ 2]  138 	ldw	(0x08, sp), x
      008611 17 06            [ 2]  139 	ldw	(0x06, sp), y
                                    140 ;	../src/led_matrix.c: 84: if(nxtTick) nxtTick = 2;
      008613 1E 08            [ 2]  141 	ldw	x, (0x08, sp)
      008615 26 04            [ 1]  142 	jrne	00184$
      008617 1E 06            [ 2]  143 	ldw	x, (0x06, sp)
      008619 27 0A            [ 1]  144 	jreq	00111$
      00861B                        145 00184$:
      00861B AE 00 02         [ 2]  146 	ldw	x, #0x0002
      00861E 1F 08            [ 2]  147 	ldw	(0x08, sp), x
      008620 5F               [ 1]  148 	clrw	x
      008621 1F 06            [ 2]  149 	ldw	(0x06, sp), x
      008623 20 14            [ 2]  150 	jra	00112$
      008625                        151 00111$:
                                    152 ;	../src/led_matrix.c: 85: else nxtTick = (nxtTick%2)?(nxtTick+1):nxtTick;
      008625 7B 09            [ 1]  153 	ld	a, (0x09, sp)
      008627 44               [ 1]  154 	srl	a
      008628 24 0F            [ 1]  155 	jrnc	00117$
      00862A 1E 08            [ 2]  156 	ldw	x, (0x08, sp)
      00862C 1C 00 01         [ 2]  157 	addw	x, #0x0001
      00862F 16 06            [ 2]  158 	ldw	y, (0x06, sp)
      008631 24 02            [ 1]  159 	jrnc	00186$
      008633 90 5C            [ 1]  160 	incw	y
      008635                        161 00186$:
      008635 1F 08            [ 2]  162 	ldw	(0x08, sp), x
      008637 17 06            [ 2]  163 	ldw	(0x06, sp), y
      008639                        164 00117$:
      008639                        165 00112$:
                                    166 ;	../src/led_matrix.c: 86: led_ticks[ledID] = nxtTick;break;
      008639 5F               [ 1]  167 	clrw	x
      00863A 7B 0C            [ 1]  168 	ld	a, (0x0c, sp)
      00863C 97               [ 1]  169 	ld	xl, a
      00863D 58               [ 2]  170 	sllw	x
      00863E 58               [ 2]  171 	sllw	x
      00863F 1C 02 17         [ 2]  172 	addw	x, #(_led_ticks+0)
      008642 16 08            [ 2]  173 	ldw	y, (0x08, sp)
      008644 EF 02            [ 2]  174 	ldw	(0x2, x), y
      008646 16 06            [ 2]  175 	ldw	y, (0x06, sp)
      008648 FF               [ 2]  176 	ldw	(x), y
      008649 20 3F            [ 2]  177 	jra	00115$
                                    178 ;	../src/led_matrix.c: 87: case LED_TOGGLE_FAST: //odd number is fast
      00864B                        179 00113$:
                                    180 ;	../src/led_matrix.c: 88: nxtTick = sysTick + LED_TOGGLE_FAST_TICK;
      00864B CE 02 0F         [ 2]  181 	ldw	x, _sysTick+2
      00864E 1C 00 64         [ 2]  182 	addw	x, #0x0064
      008651 90 CE 02 0D      [ 2]  183 	ldw	y, _sysTick+0
      008655 24 02            [ 1]  184 	jrnc	00187$
      008657 90 5C            [ 1]  185 	incw	y
      008659                        186 00187$:
      008659 1F 03            [ 2]  187 	ldw	(0x03, sp), x
      00865B 17 01            [ 2]  188 	ldw	(0x01, sp), y
                                    189 ;	../src/led_matrix.c: 89: nxtTick = (nxtTick%2)?nxtTick:(nxtTick+1);
      00865D 7B 04            [ 1]  190 	ld	a, (0x04, sp)
      00865F 44               [ 1]  191 	srl	a
      008660 24 0A            [ 1]  192 	jrnc	00119$
      008662 16 03            [ 2]  193 	ldw	y, (0x03, sp)
      008664 17 08            [ 2]  194 	ldw	(0x08, sp), y
      008666 16 01            [ 2]  195 	ldw	y, (0x01, sp)
      008668 17 06            [ 2]  196 	ldw	(0x06, sp), y
      00866A 20 0E            [ 2]  197 	jra	00120$
      00866C                        198 00119$:
      00866C 1E 03            [ 2]  199 	ldw	x, (0x03, sp)
      00866E 1C 00 01         [ 2]  200 	addw	x, #0x0001
      008671 1F 08            [ 2]  201 	ldw	(0x08, sp), x
      008673 1E 01            [ 2]  202 	ldw	x, (0x01, sp)
      008675 24 01            [ 1]  203 	jrnc	00189$
      008677 5C               [ 1]  204 	incw	x
      008678                        205 00189$:
      008678 1F 06            [ 2]  206 	ldw	(0x06, sp), x
      00867A                        207 00120$:
      00867A 16 08            [ 2]  208 	ldw	y, (0x08, sp)
                                    209 ;	../src/led_matrix.c: 90: led_ticks[ledID] = nxtTick;break;
      00867C 5F               [ 1]  210 	clrw	x
      00867D 7B 0C            [ 1]  211 	ld	a, (0x0c, sp)
      00867F 97               [ 1]  212 	ld	xl, a
      008680 58               [ 2]  213 	sllw	x
      008681 58               [ 2]  214 	sllw	x
      008682 1C 02 17         [ 2]  215 	addw	x, #(_led_ticks+0)
      008685 EF 02            [ 2]  216 	ldw	(0x2, x), y
      008687 16 06            [ 2]  217 	ldw	y, (0x06, sp)
      008689 FF               [ 2]  218 	ldw	(x), y
                                    219 ;	../src/led_matrix.c: 91: }
      00868A                        220 00115$:
                                    221 ;	../src/led_matrix.c: 92: }
      00868A 5B 09            [ 2]  222 	addw	sp, #9
      00868C 81               [ 4]  223 	ret
                                    224 ;	../src/led_matrix.c: 94: static enum let_mode_t GetLedMode(uint8_t ledID)
                                    225 ;	-----------------------------------------
                                    226 ;	 function GetLedMode
                                    227 ;	-----------------------------------------
      00868D                        228 _GetLedMode:
      00868D 52 08            [ 2]  229 	sub	sp, #8
                                    230 ;	../src/led_matrix.c: 96: uint32_t tick = led_ticks[ledID];
      00868F 5F               [ 1]  231 	clrw	x
      008690 7B 0B            [ 1]  232 	ld	a, (0x0b, sp)
      008692 97               [ 1]  233 	ld	xl, a
      008693 58               [ 2]  234 	sllw	x
      008694 58               [ 2]  235 	sllw	x
      008695 1C 02 17         [ 2]  236 	addw	x, #(_led_ticks+0)
      008698 90 93            [ 1]  237 	ldw	y, x
      00869A 90 EE 02         [ 2]  238 	ldw	y, (0x2, y)
      00869D 17 03            [ 2]  239 	ldw	(0x03, sp), y
      00869F FE               [ 2]  240 	ldw	x, (x)
      0086A0 1F 01            [ 2]  241 	ldw	(0x01, sp), x
      0086A2 16 03            [ 2]  242 	ldw	y, (0x03, sp)
      0086A4 17 07            [ 2]  243 	ldw	(0x07, sp), y
      0086A6 16 01            [ 2]  244 	ldw	y, (0x01, sp)
      0086A8 17 05            [ 2]  245 	ldw	(0x05, sp), y
                                    246 ;	../src/led_matrix.c: 98: if(0 == tick) return GetLedState(ledID)?LED_ON:LED_OFF;
      0086AA 1E 03            [ 2]  247 	ldw	x, (0x03, sp)
      0086AC 26 1D            [ 1]  248 	jrne	00102$
      0086AE 1E 01            [ 2]  249 	ldw	x, (0x01, sp)
      0086B0 26 19            [ 1]  250 	jrne	00102$
      0086B2 7B 0B            [ 1]  251 	ld	a, (0x0b, sp)
      0086B4 88               [ 1]  252 	push	a
      0086B5 CD 88 71         [ 4]  253 	call	_GetLedState
      0086B8 5B 01            [ 2]  254 	addw	sp, #1
      0086BA 6B 08            [ 1]  255 	ld	(0x08, sp), a
      0086BC 27 06            [ 1]  256 	jreq	00107$
      0086BE AE 00 03         [ 2]  257 	ldw	x, #0x0003
      0086C1 1F 07            [ 2]  258 	ldw	(0x07, sp), x
      0086C3 BC                     259 	.byte 0xbc
      0086C4                        260 00107$:
      0086C4 5F               [ 1]  261 	clrw	x
      0086C5 1F 07            [ 2]  262 	ldw	(0x07, sp), x
      0086C7                        263 00108$:
      0086C7 1E 07            [ 2]  264 	ldw	x, (0x07, sp)
      0086C9 20 0B            [ 2]  265 	jra	00105$
      0086CB                        266 00102$:
                                    267 ;	../src/led_matrix.c: 99: if(tick % 2) return LED_TOGGLE_FAST;
      0086CB 7B 08            [ 1]  268 	ld	a, (0x08, sp)
      0086CD 44               [ 1]  269 	srl	a
      0086CE 24 04            [ 1]  270 	jrnc	00104$
      0086D0 AE 00 02         [ 2]  271 	ldw	x, #0x0002
                                    272 ;	../src/led_matrix.c: 100: return LED_TOGGLE_SLOW; 
      0086D3 C5                     273 	.byte 0xc5
      0086D4                        274 00104$:
      0086D4 5F               [ 1]  275 	clrw	x
      0086D5 5C               [ 1]  276 	incw	x
      0086D6                        277 00105$:
                                    278 ;	../src/led_matrix.c: 101: }
      0086D6 5B 08            [ 2]  279 	addw	sp, #8
      0086D8 81               [ 4]  280 	ret
                                    281 ;	../src/led_matrix.c: 105: void UpdateLeds()
                                    282 ;	-----------------------------------------
                                    283 ;	 function UpdateLeds
                                    284 ;	-----------------------------------------
      0086D9                        285 _UpdateLeds:
      0086D9 52 0B            [ 2]  286 	sub	sp, #11
                                    287 ;	../src/led_matrix.c: 110: for(idx = 0; idx < NUM_OF_LEDS; idx++){
      0086DB 0F 0B            [ 1]  288 	clr	(0x0b, sp)
      0086DD                        289 00105$:
                                    290 ;	../src/led_matrix.c: 111: tick = led_ticks[idx];
      0086DD 5F               [ 1]  291 	clrw	x
      0086DE 7B 0B            [ 1]  292 	ld	a, (0x0b, sp)
      0086E0 97               [ 1]  293 	ld	xl, a
      0086E1 58               [ 2]  294 	sllw	x
      0086E2 58               [ 2]  295 	sllw	x
      0086E3 1C 02 17         [ 2]  296 	addw	x, #(_led_ticks+0)
      0086E6 1F 05            [ 2]  297 	ldw	(0x05, sp), x
      0086E8 90 93            [ 1]  298 	ldw	y, x
      0086EA 90 EE 02         [ 2]  299 	ldw	y, (0x2, y)
      0086ED 17 09            [ 2]  300 	ldw	(0x09, sp), y
      0086EF FE               [ 2]  301 	ldw	x, (x)
      0086F0 1F 07            [ 2]  302 	ldw	(0x07, sp), x
      0086F2 16 09            [ 2]  303 	ldw	y, (0x09, sp)
      0086F4 17 03            [ 2]  304 	ldw	(0x03, sp), y
      0086F6 16 07            [ 2]  305 	ldw	y, (0x07, sp)
      0086F8 17 01            [ 2]  306 	ldw	(0x01, sp), y
                                    307 ;	../src/led_matrix.c: 112: if((tick != 0) && (sysTick == tick)){
      0086FA 1E 03            [ 2]  308 	ldw	x, (0x03, sp)
      0086FC 26 04            [ 1]  309 	jrne	00137$
      0086FE 1E 01            [ 2]  310 	ldw	x, (0x01, sp)
      008700 27 4F            [ 1]  311 	jreq	00106$
      008702                        312 00137$:
      008702 1E 03            [ 2]  313 	ldw	x, (0x03, sp)
      008704 C3 02 0F         [ 2]  314 	cpw	x, _sysTick+2
      008707 26 48            [ 1]  315 	jrne	00106$
      008709 1E 01            [ 2]  316 	ldw	x, (0x01, sp)
      00870B C3 02 0D         [ 2]  317 	cpw	x, _sysTick+0
      00870E 26 41            [ 1]  318 	jrne	00106$
                                    319 ;	../src/led_matrix.c: 113: led_ticks[idx] += ((tick%2)?LED_TOGGLE_FAST_TICK:LED_TOGGLE_SLOW_TICK);
      008710 7B 04            [ 1]  320 	ld	a, (0x04, sp)
      008712 44               [ 1]  321 	srl	a
      008713 24 07            [ 1]  322 	jrnc	00109$
      008715 AE 00 64         [ 2]  323 	ldw	x, #0x0064
      008718 1F 03            [ 2]  324 	ldw	(0x03, sp), x
      00871A 20 05            [ 2]  325 	jra	00110$
      00871C                        326 00109$:
      00871C AE 03 E8         [ 2]  327 	ldw	x, #0x03e8
      00871F 1F 03            [ 2]  328 	ldw	(0x03, sp), x
      008721                        329 00110$:
      008721 16 03            [ 2]  330 	ldw	y, (0x03, sp)
      008723 5F               [ 1]  331 	clrw	x
      008724 90 5D            [ 2]  332 	tnzw	y
      008726 2A 01            [ 1]  333 	jrpl	00142$
      008728 5A               [ 2]  334 	decw	x
      008729                        335 00142$:
      008729 72 F9 09         [ 2]  336 	addw	y, (0x09, sp)
      00872C 9F               [ 1]  337 	ld	a, xl
      00872D 19 08            [ 1]  338 	adc	a, (0x08, sp)
      00872F 6B 02            [ 1]  339 	ld	(0x02, sp), a
      008731 9E               [ 1]  340 	ld	a, xh
      008732 19 07            [ 1]  341 	adc	a, (0x07, sp)
      008734 6B 01            [ 1]  342 	ld	(0x01, sp), a
      008736 1E 05            [ 2]  343 	ldw	x, (0x05, sp)
      008738 EF 02            [ 2]  344 	ldw	(0x2, x), y
      00873A 16 01            [ 2]  345 	ldw	y, (0x01, sp)
      00873C FF               [ 2]  346 	ldw	(x), y
                                    347 ;	../src/led_matrix.c: 114: SetLedState(idx, !GetLedState(idx));
      00873D 7B 0B            [ 1]  348 	ld	a, (0x0b, sp)
      00873F 88               [ 1]  349 	push	a
      008740 CD 88 71         [ 4]  350 	call	_GetLedState
      008743 5B 01            [ 2]  351 	addw	sp, #1
      008745 A0 01            [ 1]  352 	sub	a, #0x01
      008747 4F               [ 1]  353 	clr	a
      008748 49               [ 1]  354 	rlc	a
      008749 88               [ 1]  355 	push	a
      00874A 7B 0C            [ 1]  356 	ld	a, (0x0c, sp)
      00874C 88               [ 1]  357 	push	a
      00874D CD 88 8E         [ 4]  358 	call	_SetLedState
      008750 85               [ 2]  359 	popw	x
      008751                        360 00106$:
                                    361 ;	../src/led_matrix.c: 110: for(idx = 0; idx < NUM_OF_LEDS; idx++){
      008751 0C 0B            [ 1]  362 	inc	(0x0b, sp)
      008753 7B 0B            [ 1]  363 	ld	a, (0x0b, sp)
      008755 A1 0C            [ 1]  364 	cp	a, #0x0c
      008757 24 03            [ 1]  365 	jrnc	00143$
      008759 CC 86 DD         [ 2]  366 	jp	00105$
      00875C                        367 00143$:
                                    368 ;	../src/led_matrix.c: 118: UpdateLedState();
      00875C 5B 0B            [ 2]  369 	addw	sp, #11
                                    370 ;	../src/led_matrix.c: 119: }
      00875E CC 87 78         [ 2]  371 	jp	_UpdateLedState
                                    372 	.area CODE
                                    373 	.area CONST
                                    374 	.area INITIALIZER
                                    375 	.area CABS (ABS)
