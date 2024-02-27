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
                                     13 	.globl _SetLedRaw
                                     14 	.globl _UpdateLedState
                                     15 	.globl _LedsInit
                                     16 	.globl _led_ticks
                                     17 	.globl _LedMatrixInit
                                     18 	.globl _SetLedMode
                                     19 	.globl _UpdateLeds
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DATA
      000211                         24 _led_ticks::
      000211                         25 	.ds 48
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area INITIALIZED
                                     30 ;--------------------------------------------------------
                                     31 ; absolute external ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area DABS (ABS)
                                     34 
                                     35 ; default segment ordering for linker
                                     36 	.area HOME
                                     37 	.area GSINIT
                                     38 	.area GSFINAL
                                     39 	.area CONST
                                     40 	.area INITIALIZER
                                     41 	.area CODE
                                     42 
                                     43 ;--------------------------------------------------------
                                     44 ; global & static initialisations
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area GSINIT
                                     48 	.area GSFINAL
                                     49 	.area GSINIT
                                     50 ;--------------------------------------------------------
                                     51 ; Home
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
                                     54 	.area HOME
                                     55 ;--------------------------------------------------------
                                     56 ; code
                                     57 ;--------------------------------------------------------
                                     58 	.area CODE
                                     59 ;	../src/led_matrix.c: 52: void LedMatrixInit( void ){
                                     60 ;	-----------------------------------------
                                     61 ;	 function LedMatrixInit
                                     62 ;	-----------------------------------------
      0084F6                         63 _LedMatrixInit:
                                     64 ;	../src/led_matrix.c: 54: LedsInit();
                                     65 ;	../src/led_matrix.c: 55: }
      0084F6 CC 86 3F         [ 2]   66 	jp	_LedsInit
                                     67 ;	../src/led_matrix.c: 71: void SetLedMode(uint8_t ledID, enum led_mode_t mode)
                                     68 ;	-----------------------------------------
                                     69 ;	 function SetLedMode
                                     70 ;	-----------------------------------------
      0084F9                         71 _SetLedMode:
      0084F9 52 09            [ 2]   72 	sub	sp, #9
                                     73 ;	../src/led_matrix.c: 75: if(mode >= LED_MODE_MAX) return;
      0084FB 7B 0D            [ 1]   74 	ld	a, (0x0d, sp)
      0084FD A1 04            [ 1]   75 	cp	a, #0x04
      0084FF 25 03            [ 1]   76 	jrc	00102$
      008501 CC 85 CB         [ 2]   77 	jp	00113$
      008504                         78 00102$:
                                     79 ;	../src/led_matrix.c: 76: if(ledID >= NUM_OF_LEDS) return;
      008504 7B 0C            [ 1]   80 	ld	a, (0x0c, sp)
      008506 A1 0C            [ 1]   81 	cp	a, #0x0c
      008508 25 03            [ 1]   82 	jrc	00104$
      00850A CC 85 CB         [ 2]   83 	jp	00113$
      00850D                         84 00104$:
                                     85 ;	../src/led_matrix.c: 78: switch(mode){
      00850D 7B 0D            [ 1]   86 	ld	a, (0x0d, sp)
      00850F A1 00            [ 1]   87 	cp	a, #0x00
      008511 27 14            [ 1]   88 	jreq	00106$
      008513 7B 0D            [ 1]   89 	ld	a, (0x0d, sp)
      008515 4A               [ 1]   90 	dec	a
      008516 27 2A            [ 1]   91 	jreq	00107$
      008518 7B 0D            [ 1]   92 	ld	a, (0x0d, sp)
      00851A A1 02            [ 1]   93 	cp	a, #0x02
      00851C 27 6E            [ 1]   94 	jreq	00111$
      00851E 7B 0D            [ 1]   95 	ld	a, (0x0d, sp)
      008520 A1 03            [ 1]   96 	cp	a, #0x03
      008522 27 03            [ 1]   97 	jreq	00172$
      008524 CC 85 CB         [ 2]   98 	jp	00113$
      008527                         99 00172$:
                                    100 ;	../src/led_matrix.c: 80: case LED_OFF: led_ticks[ledID] = 0; SetLedRaw(ledID, mode);break;
      008527                        101 00106$:
      008527 5F               [ 1]  102 	clrw	x
      008528 7B 0C            [ 1]  103 	ld	a, (0x0c, sp)
      00852A 97               [ 1]  104 	ld	xl, a
      00852B 58               [ 2]  105 	sllw	x
      00852C 58               [ 2]  106 	sllw	x
      00852D 1C 02 11         [ 2]  107 	addw	x, #(_led_ticks+0)
      008530 90 5F            [ 1]  108 	clrw	y
      008532 EF 02            [ 2]  109 	ldw	(0x2, x), y
      008534 FF               [ 2]  110 	ldw	(x), y
      008535 7B 0D            [ 1]  111 	ld	a, (0x0d, sp)
      008537 88               [ 1]  112 	push	a
      008538 7B 0D            [ 1]  113 	ld	a, (0x0d, sp)
      00853A 88               [ 1]  114 	push	a
      00853B CD 86 A4         [ 4]  115 	call	_SetLedRaw
      00853E 85               [ 2]  116 	popw	x
      00853F CC 85 CB         [ 2]  117 	jp	00113$
                                    118 ;	../src/led_matrix.c: 81: case LED_TOGGLE_SLOW: 
      008542                        119 00107$:
                                    120 ;	../src/led_matrix.c: 82: nxtTick = sysTick + LED_TOGGLE_SLOW_TICK;
      008542 CE 02 0F         [ 2]  121 	ldw	x, _sysTick+2
      008545 1C 03 E8         [ 2]  122 	addw	x, #0x03e8
      008548 90 CE 02 0D      [ 2]  123 	ldw	y, _sysTick+0
      00854C 24 02            [ 1]  124 	jrnc	00173$
      00854E 90 5C            [ 1]  125 	incw	y
      008550                        126 00173$:
      008550 1F 08            [ 2]  127 	ldw	(0x08, sp), x
      008552 17 06            [ 2]  128 	ldw	(0x06, sp), y
                                    129 ;	../src/led_matrix.c: 83: if(nxtTick) nxtTick = 2;
      008554 1E 08            [ 2]  130 	ldw	x, (0x08, sp)
      008556 26 04            [ 1]  131 	jrne	00174$
      008558 1E 06            [ 2]  132 	ldw	x, (0x06, sp)
      00855A 27 0A            [ 1]  133 	jreq	00109$
      00855C                        134 00174$:
      00855C AE 00 02         [ 2]  135 	ldw	x, #0x0002
      00855F 1F 08            [ 2]  136 	ldw	(0x08, sp), x
      008561 5F               [ 1]  137 	clrw	x
      008562 1F 06            [ 2]  138 	ldw	(0x06, sp), x
      008564 20 14            [ 2]  139 	jra	00110$
      008566                        140 00109$:
                                    141 ;	../src/led_matrix.c: 84: else nxtTick = (nxtTick%2)?(nxtTick+1):nxtTick;
      008566 7B 09            [ 1]  142 	ld	a, (0x09, sp)
      008568 44               [ 1]  143 	srl	a
      008569 24 0F            [ 1]  144 	jrnc	00115$
      00856B 1E 08            [ 2]  145 	ldw	x, (0x08, sp)
      00856D 1C 00 01         [ 2]  146 	addw	x, #0x0001
      008570 16 06            [ 2]  147 	ldw	y, (0x06, sp)
      008572 24 02            [ 1]  148 	jrnc	00176$
      008574 90 5C            [ 1]  149 	incw	y
      008576                        150 00176$:
      008576 1F 08            [ 2]  151 	ldw	(0x08, sp), x
      008578 17 06            [ 2]  152 	ldw	(0x06, sp), y
      00857A                        153 00115$:
      00857A                        154 00110$:
                                    155 ;	../src/led_matrix.c: 85: led_ticks[ledID] = nxtTick;break;
      00857A 5F               [ 1]  156 	clrw	x
      00857B 7B 0C            [ 1]  157 	ld	a, (0x0c, sp)
      00857D 97               [ 1]  158 	ld	xl, a
      00857E 58               [ 2]  159 	sllw	x
      00857F 58               [ 2]  160 	sllw	x
      008580 1C 02 11         [ 2]  161 	addw	x, #(_led_ticks+0)
      008583 16 08            [ 2]  162 	ldw	y, (0x08, sp)
      008585 EF 02            [ 2]  163 	ldw	(0x2, x), y
      008587 16 06            [ 2]  164 	ldw	y, (0x06, sp)
      008589 FF               [ 2]  165 	ldw	(x), y
      00858A 20 3F            [ 2]  166 	jra	00113$
                                    167 ;	../src/led_matrix.c: 86: case LED_TOGGLE_FAST: 
      00858C                        168 00111$:
                                    169 ;	../src/led_matrix.c: 87: nxtTick = sysTick + LED_TOGGLE_FAST_TICK;
      00858C CE 02 0F         [ 2]  170 	ldw	x, _sysTick+2
      00858F 1C 01 2C         [ 2]  171 	addw	x, #0x012c
      008592 90 CE 02 0D      [ 2]  172 	ldw	y, _sysTick+0
      008596 24 02            [ 1]  173 	jrnc	00177$
      008598 90 5C            [ 1]  174 	incw	y
      00859A                        175 00177$:
      00859A 1F 03            [ 2]  176 	ldw	(0x03, sp), x
      00859C 17 01            [ 2]  177 	ldw	(0x01, sp), y
                                    178 ;	../src/led_matrix.c: 88: nxtTick = (nxtTick%2)?nxtTick:(nxtTick+1);
      00859E 7B 04            [ 1]  179 	ld	a, (0x04, sp)
      0085A0 44               [ 1]  180 	srl	a
      0085A1 24 0A            [ 1]  181 	jrnc	00117$
      0085A3 16 03            [ 2]  182 	ldw	y, (0x03, sp)
      0085A5 17 08            [ 2]  183 	ldw	(0x08, sp), y
      0085A7 16 01            [ 2]  184 	ldw	y, (0x01, sp)
      0085A9 17 06            [ 2]  185 	ldw	(0x06, sp), y
      0085AB 20 0E            [ 2]  186 	jra	00118$
      0085AD                        187 00117$:
      0085AD 1E 03            [ 2]  188 	ldw	x, (0x03, sp)
      0085AF 1C 00 01         [ 2]  189 	addw	x, #0x0001
      0085B2 1F 08            [ 2]  190 	ldw	(0x08, sp), x
      0085B4 1E 01            [ 2]  191 	ldw	x, (0x01, sp)
      0085B6 24 01            [ 1]  192 	jrnc	00179$
      0085B8 5C               [ 1]  193 	incw	x
      0085B9                        194 00179$:
      0085B9 1F 06            [ 2]  195 	ldw	(0x06, sp), x
      0085BB                        196 00118$:
      0085BB 16 08            [ 2]  197 	ldw	y, (0x08, sp)
                                    198 ;	../src/led_matrix.c: 89: led_ticks[ledID] = nxtTick;break;
      0085BD 5F               [ 1]  199 	clrw	x
      0085BE 7B 0C            [ 1]  200 	ld	a, (0x0c, sp)
      0085C0 97               [ 1]  201 	ld	xl, a
      0085C1 58               [ 2]  202 	sllw	x
      0085C2 58               [ 2]  203 	sllw	x
      0085C3 1C 02 11         [ 2]  204 	addw	x, #(_led_ticks+0)
      0085C6 EF 02            [ 2]  205 	ldw	(0x2, x), y
      0085C8 16 06            [ 2]  206 	ldw	y, (0x06, sp)
      0085CA FF               [ 2]  207 	ldw	(x), y
                                    208 ;	../src/led_matrix.c: 90: }
      0085CB                        209 00113$:
                                    210 ;	../src/led_matrix.c: 91: }
      0085CB 5B 09            [ 2]  211 	addw	sp, #9
      0085CD 81               [ 4]  212 	ret
                                    213 ;	../src/led_matrix.c: 95: void UpdateLeds()
                                    214 ;	-----------------------------------------
                                    215 ;	 function UpdateLeds
                                    216 ;	-----------------------------------------
      0085CE                        217 _UpdateLeds:
      0085CE 52 07            [ 2]  218 	sub	sp, #7
                                    219 ;	../src/led_matrix.c: 100: for(idx = 0; idx < NUM_OF_LEDS; idx++){
      0085D0 0F 07            [ 1]  220 	clr	(0x07, sp)
      0085D2                        221 00105$:
                                    222 ;	../src/led_matrix.c: 101: tick = led_ticks[idx];
      0085D2 5F               [ 1]  223 	clrw	x
      0085D3 7B 07            [ 1]  224 	ld	a, (0x07, sp)
      0085D5 97               [ 1]  225 	ld	xl, a
      0085D6 58               [ 2]  226 	sllw	x
      0085D7 58               [ 2]  227 	sllw	x
      0085D8 1C 02 11         [ 2]  228 	addw	x, #(_led_ticks+0)
      0085DB 1F 01            [ 2]  229 	ldw	(0x01, sp), x
      0085DD 90 93            [ 1]  230 	ldw	y, x
      0085DF 90 EE 02         [ 2]  231 	ldw	y, (0x2, y)
      0085E2 FE               [ 2]  232 	ldw	x, (x)
      0085E3 17 05            [ 2]  233 	ldw	(0x05, sp), y
      0085E5 1F 03            [ 2]  234 	ldw	(0x03, sp), x
                                    235 ;	../src/led_matrix.c: 102: if((tick != 0) && (sysTick == tick)){
      0085E7 1E 05            [ 2]  236 	ldw	x, (0x05, sp)
      0085E9 26 04            [ 1]  237 	jrne	00137$
      0085EB 1E 03            [ 2]  238 	ldw	x, (0x03, sp)
      0085ED 27 43            [ 1]  239 	jreq	00106$
      0085EF                        240 00137$:
      0085EF 1E 05            [ 2]  241 	ldw	x, (0x05, sp)
      0085F1 C3 02 0F         [ 2]  242 	cpw	x, _sysTick+2
      0085F4 26 3C            [ 1]  243 	jrne	00106$
      0085F6 1E 03            [ 2]  244 	ldw	x, (0x03, sp)
      0085F8 C3 02 0D         [ 2]  245 	cpw	x, _sysTick+0
      0085FB 26 35            [ 1]  246 	jrne	00106$
                                    247 ;	../src/led_matrix.c: 103: led_ticks[idx] = ((tick%2)?LED_TOGGLE_FAST_TICK:LED_TOGGLE_SLOW_TICK);
      0085FD 7B 06            [ 1]  248 	ld	a, (0x06, sp)
      0085FF 44               [ 1]  249 	srl	a
      008600 24 07            [ 1]  250 	jrnc	00109$
      008602 AE 01 2C         [ 2]  251 	ldw	x, #0x012c
      008605 1F 05            [ 2]  252 	ldw	(0x05, sp), x
      008607 20 05            [ 2]  253 	jra	00110$
      008609                        254 00109$:
      008609 AE 03 E8         [ 2]  255 	ldw	x, #0x03e8
      00860C 1F 05            [ 2]  256 	ldw	(0x05, sp), x
      00860E                        257 00110$:
      00860E 16 05            [ 2]  258 	ldw	y, (0x05, sp)
      008610 90 9E            [ 1]  259 	ld	a, yh
      008612 49               [ 1]  260 	rlc	a
      008613 4F               [ 1]  261 	clr	a
      008614 A2 00            [ 1]  262 	sbc	a, #0x00
      008616 6B 04            [ 1]  263 	ld	(0x04, sp), a
      008618 6B 03            [ 1]  264 	ld	(0x03, sp), a
      00861A 1E 01            [ 2]  265 	ldw	x, (0x01, sp)
      00861C EF 02            [ 2]  266 	ldw	(0x2, x), y
      00861E 16 03            [ 2]  267 	ldw	y, (0x03, sp)
      008620 FF               [ 2]  268 	ldw	(x), y
                                    269 ;	../src/led_matrix.c: 104: SetLedState(idx, ~GetLedState(idx));
      008621 7B 07            [ 1]  270 	ld	a, (0x07, sp)
      008623 88               [ 1]  271 	push	a
      008624 CD 87 26         [ 4]  272 	call	_GetLedState
      008627 5B 01            [ 2]  273 	addw	sp, #1
      008629 43               [ 1]  274 	cpl	a
      00862A 88               [ 1]  275 	push	a
      00862B 7B 08            [ 1]  276 	ld	a, (0x08, sp)
      00862D 88               [ 1]  277 	push	a
      00862E CD 87 49         [ 4]  278 	call	_SetLedState
      008631 85               [ 2]  279 	popw	x
      008632                        280 00106$:
                                    281 ;	../src/led_matrix.c: 100: for(idx = 0; idx < NUM_OF_LEDS; idx++){
      008632 0C 07            [ 1]  282 	inc	(0x07, sp)
      008634 7B 07            [ 1]  283 	ld	a, (0x07, sp)
      008636 A1 0C            [ 1]  284 	cp	a, #0x0c
      008638 25 98            [ 1]  285 	jrc	00105$
                                    286 ;	../src/led_matrix.c: 108: UpdateLedState();
      00863A 5B 07            [ 2]  287 	addw	sp, #7
                                    288 ;	../src/led_matrix.c: 109: }
      00863C CC 86 56         [ 2]  289 	jp	_UpdateLedState
                                    290 	.area CODE
                                    291 	.area CONST
                                    292 	.area INITIALIZER
                                    293 	.area CABS (ABS)
