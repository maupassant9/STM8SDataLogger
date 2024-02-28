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
      000211                         23 _led_ticks::
      000211                         24 	.ds 48
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
      0084F2                         62 _LedMatrixInit:
                                     63 ;	../src/led_matrix.c: 54: LedsInit();
                                     64 ;	../src/led_matrix.c: 55: }
      0084F2 CC 86 3B         [ 2]   65 	jp	_LedsInit
                                     66 ;	../src/led_matrix.c: 71: void SetLedMode(uint8_t ledID, enum led_mode_t mode)
                                     67 ;	-----------------------------------------
                                     68 ;	 function SetLedMode
                                     69 ;	-----------------------------------------
      0084F5                         70 _SetLedMode:
      0084F5 52 09            [ 2]   71 	sub	sp, #9
                                     72 ;	../src/led_matrix.c: 75: if(mode >= LED_MODE_MAX) return;
      0084F7 7B 0D            [ 1]   73 	ld	a, (0x0d, sp)
      0084F9 A1 04            [ 1]   74 	cp	a, #0x04
      0084FB 25 03            [ 1]   75 	jrc	00102$
      0084FD CC 85 C7         [ 2]   76 	jp	00113$
      008500                         77 00102$:
                                     78 ;	../src/led_matrix.c: 76: if(ledID >= NUM_OF_LEDS) return;
      008500 7B 0C            [ 1]   79 	ld	a, (0x0c, sp)
      008502 A1 0C            [ 1]   80 	cp	a, #0x0c
      008504 25 03            [ 1]   81 	jrc	00104$
      008506 CC 85 C7         [ 2]   82 	jp	00113$
      008509                         83 00104$:
                                     84 ;	../src/led_matrix.c: 78: switch(mode){
      008509 7B 0D            [ 1]   85 	ld	a, (0x0d, sp)
      00850B A1 00            [ 1]   86 	cp	a, #0x00
      00850D 27 14            [ 1]   87 	jreq	00106$
      00850F 7B 0D            [ 1]   88 	ld	a, (0x0d, sp)
      008511 4A               [ 1]   89 	dec	a
      008512 27 2A            [ 1]   90 	jreq	00107$
      008514 7B 0D            [ 1]   91 	ld	a, (0x0d, sp)
      008516 A1 02            [ 1]   92 	cp	a, #0x02
      008518 27 6E            [ 1]   93 	jreq	00111$
      00851A 7B 0D            [ 1]   94 	ld	a, (0x0d, sp)
      00851C A1 03            [ 1]   95 	cp	a, #0x03
      00851E 27 03            [ 1]   96 	jreq	00172$
      008520 CC 85 C7         [ 2]   97 	jp	00113$
      008523                         98 00172$:
                                     99 ;	../src/led_matrix.c: 80: case LED_OFF: led_ticks[ledID] = 0; SetLedState(ledID, mode);break;
      008523                        100 00106$:
      008523 5F               [ 1]  101 	clrw	x
      008524 7B 0C            [ 1]  102 	ld	a, (0x0c, sp)
      008526 97               [ 1]  103 	ld	xl, a
      008527 58               [ 2]  104 	sllw	x
      008528 58               [ 2]  105 	sllw	x
      008529 1C 02 11         [ 2]  106 	addw	x, #(_led_ticks+0)
      00852C 90 5F            [ 1]  107 	clrw	y
      00852E EF 02            [ 2]  108 	ldw	(0x2, x), y
      008530 FF               [ 2]  109 	ldw	(x), y
      008531 7B 0D            [ 1]  110 	ld	a, (0x0d, sp)
      008533 88               [ 1]  111 	push	a
      008534 7B 0D            [ 1]  112 	ld	a, (0x0d, sp)
      008536 88               [ 1]  113 	push	a
      008537 CD 87 88         [ 4]  114 	call	_SetLedState
      00853A 85               [ 2]  115 	popw	x
      00853B CC 85 C7         [ 2]  116 	jp	00113$
                                    117 ;	../src/led_matrix.c: 81: case LED_TOGGLE_SLOW: 
      00853E                        118 00107$:
                                    119 ;	../src/led_matrix.c: 82: nxtTick = sysTick + LED_TOGGLE_SLOW_TICK;
      00853E CE 02 0F         [ 2]  120 	ldw	x, _sysTick+2
      008541 1C 03 E8         [ 2]  121 	addw	x, #0x03e8
      008544 90 CE 02 0D      [ 2]  122 	ldw	y, _sysTick+0
      008548 24 02            [ 1]  123 	jrnc	00173$
      00854A 90 5C            [ 1]  124 	incw	y
      00854C                        125 00173$:
      00854C 1F 08            [ 2]  126 	ldw	(0x08, sp), x
      00854E 17 06            [ 2]  127 	ldw	(0x06, sp), y
                                    128 ;	../src/led_matrix.c: 83: if(nxtTick) nxtTick = 2;
      008550 1E 08            [ 2]  129 	ldw	x, (0x08, sp)
      008552 26 04            [ 1]  130 	jrne	00174$
      008554 1E 06            [ 2]  131 	ldw	x, (0x06, sp)
      008556 27 0A            [ 1]  132 	jreq	00109$
      008558                        133 00174$:
      008558 AE 00 02         [ 2]  134 	ldw	x, #0x0002
      00855B 1F 08            [ 2]  135 	ldw	(0x08, sp), x
      00855D 5F               [ 1]  136 	clrw	x
      00855E 1F 06            [ 2]  137 	ldw	(0x06, sp), x
      008560 20 14            [ 2]  138 	jra	00110$
      008562                        139 00109$:
                                    140 ;	../src/led_matrix.c: 84: else nxtTick = (nxtTick%2)?(nxtTick+1):nxtTick;
      008562 7B 09            [ 1]  141 	ld	a, (0x09, sp)
      008564 44               [ 1]  142 	srl	a
      008565 24 0F            [ 1]  143 	jrnc	00115$
      008567 1E 08            [ 2]  144 	ldw	x, (0x08, sp)
      008569 1C 00 01         [ 2]  145 	addw	x, #0x0001
      00856C 16 06            [ 2]  146 	ldw	y, (0x06, sp)
      00856E 24 02            [ 1]  147 	jrnc	00176$
      008570 90 5C            [ 1]  148 	incw	y
      008572                        149 00176$:
      008572 1F 08            [ 2]  150 	ldw	(0x08, sp), x
      008574 17 06            [ 2]  151 	ldw	(0x06, sp), y
      008576                        152 00115$:
      008576                        153 00110$:
                                    154 ;	../src/led_matrix.c: 85: led_ticks[ledID] = nxtTick;break;
      008576 5F               [ 1]  155 	clrw	x
      008577 7B 0C            [ 1]  156 	ld	a, (0x0c, sp)
      008579 97               [ 1]  157 	ld	xl, a
      00857A 58               [ 2]  158 	sllw	x
      00857B 58               [ 2]  159 	sllw	x
      00857C 1C 02 11         [ 2]  160 	addw	x, #(_led_ticks+0)
      00857F 16 08            [ 2]  161 	ldw	y, (0x08, sp)
      008581 EF 02            [ 2]  162 	ldw	(0x2, x), y
      008583 16 06            [ 2]  163 	ldw	y, (0x06, sp)
      008585 FF               [ 2]  164 	ldw	(x), y
      008586 20 3F            [ 2]  165 	jra	00113$
                                    166 ;	../src/led_matrix.c: 86: case LED_TOGGLE_FAST: 
      008588                        167 00111$:
                                    168 ;	../src/led_matrix.c: 87: nxtTick = sysTick + LED_TOGGLE_FAST_TICK;
      008588 CE 02 0F         [ 2]  169 	ldw	x, _sysTick+2
      00858B 1C 01 2C         [ 2]  170 	addw	x, #0x012c
      00858E 90 CE 02 0D      [ 2]  171 	ldw	y, _sysTick+0
      008592 24 02            [ 1]  172 	jrnc	00177$
      008594 90 5C            [ 1]  173 	incw	y
      008596                        174 00177$:
      008596 1F 03            [ 2]  175 	ldw	(0x03, sp), x
      008598 17 01            [ 2]  176 	ldw	(0x01, sp), y
                                    177 ;	../src/led_matrix.c: 88: nxtTick = (nxtTick%2)?nxtTick:(nxtTick+1);
      00859A 7B 04            [ 1]  178 	ld	a, (0x04, sp)
      00859C 44               [ 1]  179 	srl	a
      00859D 24 0A            [ 1]  180 	jrnc	00117$
      00859F 16 03            [ 2]  181 	ldw	y, (0x03, sp)
      0085A1 17 08            [ 2]  182 	ldw	(0x08, sp), y
      0085A3 16 01            [ 2]  183 	ldw	y, (0x01, sp)
      0085A5 17 06            [ 2]  184 	ldw	(0x06, sp), y
      0085A7 20 0E            [ 2]  185 	jra	00118$
      0085A9                        186 00117$:
      0085A9 1E 03            [ 2]  187 	ldw	x, (0x03, sp)
      0085AB 1C 00 01         [ 2]  188 	addw	x, #0x0001
      0085AE 1F 08            [ 2]  189 	ldw	(0x08, sp), x
      0085B0 1E 01            [ 2]  190 	ldw	x, (0x01, sp)
      0085B2 24 01            [ 1]  191 	jrnc	00179$
      0085B4 5C               [ 1]  192 	incw	x
      0085B5                        193 00179$:
      0085B5 1F 06            [ 2]  194 	ldw	(0x06, sp), x
      0085B7                        195 00118$:
      0085B7 16 08            [ 2]  196 	ldw	y, (0x08, sp)
                                    197 ;	../src/led_matrix.c: 89: led_ticks[ledID] = nxtTick;break;
      0085B9 5F               [ 1]  198 	clrw	x
      0085BA 7B 0C            [ 1]  199 	ld	a, (0x0c, sp)
      0085BC 97               [ 1]  200 	ld	xl, a
      0085BD 58               [ 2]  201 	sllw	x
      0085BE 58               [ 2]  202 	sllw	x
      0085BF 1C 02 11         [ 2]  203 	addw	x, #(_led_ticks+0)
      0085C2 EF 02            [ 2]  204 	ldw	(0x2, x), y
      0085C4 16 06            [ 2]  205 	ldw	y, (0x06, sp)
      0085C6 FF               [ 2]  206 	ldw	(x), y
                                    207 ;	../src/led_matrix.c: 90: }
      0085C7                        208 00113$:
                                    209 ;	../src/led_matrix.c: 91: }
      0085C7 5B 09            [ 2]  210 	addw	sp, #9
      0085C9 81               [ 4]  211 	ret
                                    212 ;	../src/led_matrix.c: 95: void UpdateLeds()
                                    213 ;	-----------------------------------------
                                    214 ;	 function UpdateLeds
                                    215 ;	-----------------------------------------
      0085CA                        216 _UpdateLeds:
      0085CA 52 07            [ 2]  217 	sub	sp, #7
                                    218 ;	../src/led_matrix.c: 100: for(idx = 0; idx < NUM_OF_LEDS; idx++){
      0085CC 0F 07            [ 1]  219 	clr	(0x07, sp)
      0085CE                        220 00105$:
                                    221 ;	../src/led_matrix.c: 101: tick = led_ticks[idx];
      0085CE 5F               [ 1]  222 	clrw	x
      0085CF 7B 07            [ 1]  223 	ld	a, (0x07, sp)
      0085D1 97               [ 1]  224 	ld	xl, a
      0085D2 58               [ 2]  225 	sllw	x
      0085D3 58               [ 2]  226 	sllw	x
      0085D4 1C 02 11         [ 2]  227 	addw	x, #(_led_ticks+0)
      0085D7 1F 01            [ 2]  228 	ldw	(0x01, sp), x
      0085D9 90 93            [ 1]  229 	ldw	y, x
      0085DB 90 EE 02         [ 2]  230 	ldw	y, (0x2, y)
      0085DE FE               [ 2]  231 	ldw	x, (x)
      0085DF 17 05            [ 2]  232 	ldw	(0x05, sp), y
      0085E1 1F 03            [ 2]  233 	ldw	(0x03, sp), x
                                    234 ;	../src/led_matrix.c: 102: if((tick != 0) && (sysTick == tick)){
      0085E3 1E 05            [ 2]  235 	ldw	x, (0x05, sp)
      0085E5 26 04            [ 1]  236 	jrne	00137$
      0085E7 1E 03            [ 2]  237 	ldw	x, (0x03, sp)
      0085E9 27 43            [ 1]  238 	jreq	00106$
      0085EB                        239 00137$:
      0085EB 1E 05            [ 2]  240 	ldw	x, (0x05, sp)
      0085ED C3 02 0F         [ 2]  241 	cpw	x, _sysTick+2
      0085F0 26 3C            [ 1]  242 	jrne	00106$
      0085F2 1E 03            [ 2]  243 	ldw	x, (0x03, sp)
      0085F4 C3 02 0D         [ 2]  244 	cpw	x, _sysTick+0
      0085F7 26 35            [ 1]  245 	jrne	00106$
                                    246 ;	../src/led_matrix.c: 103: led_ticks[idx] = ((tick%2)?LED_TOGGLE_FAST_TICK:LED_TOGGLE_SLOW_TICK);
      0085F9 7B 06            [ 1]  247 	ld	a, (0x06, sp)
      0085FB 44               [ 1]  248 	srl	a
      0085FC 24 07            [ 1]  249 	jrnc	00109$
      0085FE AE 01 2C         [ 2]  250 	ldw	x, #0x012c
      008601 1F 05            [ 2]  251 	ldw	(0x05, sp), x
      008603 20 05            [ 2]  252 	jra	00110$
      008605                        253 00109$:
      008605 AE 03 E8         [ 2]  254 	ldw	x, #0x03e8
      008608 1F 05            [ 2]  255 	ldw	(0x05, sp), x
      00860A                        256 00110$:
      00860A 16 05            [ 2]  257 	ldw	y, (0x05, sp)
      00860C 90 9E            [ 1]  258 	ld	a, yh
      00860E 49               [ 1]  259 	rlc	a
      00860F 4F               [ 1]  260 	clr	a
      008610 A2 00            [ 1]  261 	sbc	a, #0x00
      008612 6B 04            [ 1]  262 	ld	(0x04, sp), a
      008614 6B 03            [ 1]  263 	ld	(0x03, sp), a
      008616 1E 01            [ 2]  264 	ldw	x, (0x01, sp)
      008618 EF 02            [ 2]  265 	ldw	(0x2, x), y
      00861A 16 03            [ 2]  266 	ldw	y, (0x03, sp)
      00861C FF               [ 2]  267 	ldw	(x), y
                                    268 ;	../src/led_matrix.c: 104: SetLedState(idx, ~GetLedState(idx));
      00861D 7B 07            [ 1]  269 	ld	a, (0x07, sp)
      00861F 88               [ 1]  270 	push	a
      008620 CD 87 65         [ 4]  271 	call	_GetLedState
      008623 5B 01            [ 2]  272 	addw	sp, #1
      008625 43               [ 1]  273 	cpl	a
      008626 88               [ 1]  274 	push	a
      008627 7B 08            [ 1]  275 	ld	a, (0x08, sp)
      008629 88               [ 1]  276 	push	a
      00862A CD 87 88         [ 4]  277 	call	_SetLedState
      00862D 85               [ 2]  278 	popw	x
      00862E                        279 00106$:
                                    280 ;	../src/led_matrix.c: 100: for(idx = 0; idx < NUM_OF_LEDS; idx++){
      00862E 0C 07            [ 1]  281 	inc	(0x07, sp)
      008630 7B 07            [ 1]  282 	ld	a, (0x07, sp)
      008632 A1 0C            [ 1]  283 	cp	a, #0x0c
      008634 25 98            [ 1]  284 	jrc	00105$
                                    285 ;	../src/led_matrix.c: 108: UpdateLedState();
      008636 5B 07            [ 2]  286 	addw	sp, #7
                                    287 ;	../src/led_matrix.c: 109: }
      008638 CC 86 52         [ 2]  288 	jp	_UpdateLedState
                                    289 	.area CODE
                                    290 	.area CONST
                                    291 	.area INITIALIZER
                                    292 	.area CABS (ABS)
