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
                           000000    23 G$led_ticks$0_0$0==.
      000025                         24 _led_ticks::
      000025                         25 	.ds 48
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
                           000000    59 	G$LedMatrixInit$0$0 ==.
                           000000    60 	C$led_matrix.c$52$0_0$320 ==.
                                     61 ;	../src/led_matrix.c: 52: void LedMatrixInit( void ){
                                     62 ; genLabel
                                     63 ;	-----------------------------------------
                                     64 ;	 function LedMatrixInit
                                     65 ;	-----------------------------------------
                                     66 ;	Register assignment is optimal.
                                     67 ;	Stack space usage: 0 bytes.
      0088FB                         68 _LedMatrixInit:
                           000000    69 	C$led_matrix.c$54$1_0$320 ==.
                                     70 ;	../src/led_matrix.c: 54: LedsInit();
                                     71 ; genCall
      0088FB CC 8A A8         [ 2]   72 	jp	_LedsInit
                                     73 ; genLabel
      0088FE                         74 00101$:
                           000003    75 	C$led_matrix.c$55$1_0$320 ==.
                                     76 ;	../src/led_matrix.c: 55: }
                                     77 ; genEndFunction
                           000003    78 	C$led_matrix.c$55$1_0$320 ==.
                           000003    79 	XG$LedMatrixInit$0$0 ==.
      0088FE 81               [ 4]   80 	ret
                           000004    81 	G$SetLedMode$0$0 ==.
                           000004    82 	C$led_matrix.c$71$1_0$322 ==.
                                     83 ;	../src/led_matrix.c: 71: void SetLedMode(uint8_t ledID, enum led_mode_t mode)
                                     84 ; genLabel
                                     85 ;	-----------------------------------------
                                     86 ;	 function SetLedMode
                                     87 ;	-----------------------------------------
                                     88 ;	Register assignment might be sub-optimal.
                                     89 ;	Stack space usage: 9 bytes.
      0088FF                         90 _SetLedMode:
      0088FF 52 09            [ 2]   91 	sub	sp, #9
                           000006    92 	C$led_matrix.c$75$1_0$322 ==.
                                     93 ;	../src/led_matrix.c: 75: if(mode >= LED_MODE_MAX) return;
                                     94 ; genCmp
                                     95 ; genCmpTop
      008901 7B 0D            [ 1]   96 	ld	a, (0x0d, sp)
      008903 A1 04            [ 1]   97 	cp	a, #0x04
      008905 24 03            [ 1]   98 	jrnc	00159$
      008907 CC 89 0D         [ 2]   99 	jp	00102$
      00890A                        100 00159$:
                                    101 ; skipping generated iCode
                                    102 ; genReturn
      00890A CC 89 F2         [ 2]  103 	jp	00113$
                                    104 ; genLabel
      00890D                        105 00102$:
                           000012   106 	C$led_matrix.c$76$1_0$322 ==.
                                    107 ;	../src/led_matrix.c: 76: if(ledID >= NUM_OF_LEDS) return;
                                    108 ; genCmp
                                    109 ; genCmpTop
      00890D 7B 0C            [ 1]  110 	ld	a, (0x0c, sp)
      00890F A1 0C            [ 1]  111 	cp	a, #0x0c
      008911 24 03            [ 1]  112 	jrnc	00160$
      008913 CC 89 19         [ 2]  113 	jp	00104$
      008916                        114 00160$:
                                    115 ; skipping generated iCode
                                    116 ; genReturn
      008916 CC 89 F2         [ 2]  117 	jp	00113$
                                    118 ; genLabel
      008919                        119 00104$:
                           00001E   120 	C$led_matrix.c$78$1_0$322 ==.
                                    121 ;	../src/led_matrix.c: 78: switch(mode){
                                    122 ; genCmpEQorNE
      008919 7B 0D            [ 1]  123 	ld	a, (0x0d, sp)
      00891B A1 00            [ 1]  124 	cp	a, #0x00
      00891D 26 03            [ 1]  125 	jrne	00162$
      00891F CC 89 3F         [ 2]  126 	jp	00106$
      008922                        127 00162$:
                                    128 ; skipping generated iCode
                                    129 ; genCmpEQorNE
      008922 7B 0D            [ 1]  130 	ld	a, (0x0d, sp)
      008924 4A               [ 1]  131 	dec	a
      008925 26 03            [ 1]  132 	jrne	00165$
      008927 CC 89 5A         [ 2]  133 	jp	00107$
      00892A                        134 00165$:
                                    135 ; skipping generated iCode
                                    136 ; genCmpEQorNE
      00892A 7B 0D            [ 1]  137 	ld	a, (0x0d, sp)
      00892C A1 02            [ 1]  138 	cp	a, #0x02
      00892E 26 03            [ 1]  139 	jrne	00168$
      008930 CC 89 AF         [ 2]  140 	jp	00111$
      008933                        141 00168$:
                                    142 ; skipping generated iCode
                                    143 ; genCmpEQorNE
      008933 7B 0D            [ 1]  144 	ld	a, (0x0d, sp)
      008935 A1 03            [ 1]  145 	cp	a, #0x03
      008937 26 03            [ 1]  146 	jrne	00171$
      008939 CC 89 3F         [ 2]  147 	jp	00172$
      00893C                        148 00171$:
      00893C CC 89 F2         [ 2]  149 	jp	00113$
      00893F                        150 00172$:
                                    151 ; skipping generated iCode
                           000044   152 	C$led_matrix.c$80$2_0$323 ==.
                                    153 ;	../src/led_matrix.c: 80: case LED_OFF: led_ticks[ledID] = 0; SetLedState(ledID, mode);break;
                                    154 ; genLabel
      00893F                        155 00106$:
                                    156 ; skipping iCode since result will be rematerialized
                                    157 ; genMult
                                    158 ; genMultLit
      00893F 5F               [ 1]  159 	clrw	x
      008940 7B 0C            [ 1]  160 	ld	a, (0x0c, sp)
      008942 97               [ 1]  161 	ld	xl, a
      008943 58               [ 2]  162 	sllw	x
      008944 58               [ 2]  163 	sllw	x
                                    164 ; genPlus
      008945 1C 00 25         [ 2]  165 	addw	x, #(_led_ticks+0)
                                    166 ; genPointerSet
      008948 90 5F            [ 1]  167 	clrw	y
      00894A EF 02            [ 2]  168 	ldw	(0x2, x), y
      00894C FF               [ 2]  169 	ldw	(x), y
                                    170 ; genIPush
      00894D 7B 0D            [ 1]  171 	ld	a, (0x0d, sp)
      00894F 88               [ 1]  172 	push	a
                                    173 ; genIPush
      008950 7B 0D            [ 1]  174 	ld	a, (0x0d, sp)
      008952 88               [ 1]  175 	push	a
                                    176 ; genCall
      008953 CD 8B F4         [ 4]  177 	call	_SetLedState
      008956 85               [ 2]  178 	popw	x
                                    179 ; genGoto
      008957 CC 89 F2         [ 2]  180 	jp	00113$
                           00005F   181 	C$led_matrix.c$81$2_0$323 ==.
                                    182 ;	../src/led_matrix.c: 81: case LED_TOGGLE_SLOW: //even number is slow
                                    183 ; genLabel
      00895A                        184 00107$:
                           00005F   185 	C$led_matrix.c$82$2_0$323 ==.
                                    186 ;	../src/led_matrix.c: 82: nxtTick = sysTick + LED_TOGGLE_SLOW_TICK;
                                    187 ; genPlus
      00895A CE 00 23         [ 2]  188 	ldw	x, _sysTick+2
      00895D 1C 03 E8         [ 2]  189 	addw	x, #0x03e8
      008960 90 CE 00 21      [ 2]  190 	ldw	y, _sysTick+0
      008964 24 02            [ 1]  191 	jrnc	00173$
      008966 90 5C            [ 1]  192 	incw	y
      008968                        193 00173$:
                                    194 ; genAssign
      008968 1F 08            [ 2]  195 	ldw	(0x08, sp), x
      00896A 17 06            [ 2]  196 	ldw	(0x06, sp), y
                           000071   197 	C$led_matrix.c$83$2_0$323 ==.
                                    198 ;	../src/led_matrix.c: 83: if(nxtTick) nxtTick = 2;
                                    199 ; genIfx
      00896C 1E 08            [ 2]  200 	ldw	x, (0x08, sp)
      00896E 26 07            [ 1]  201 	jrne	00174$
      008970 1E 06            [ 2]  202 	ldw	x, (0x06, sp)
      008972 26 03            [ 1]  203 	jrne	00174$
      008974 CC 89 82         [ 2]  204 	jp	00109$
      008977                        205 00174$:
                                    206 ; genAssign
      008977 AE 00 02         [ 2]  207 	ldw	x, #0x0002
      00897A 1F 08            [ 2]  208 	ldw	(0x08, sp), x
      00897C 5F               [ 1]  209 	clrw	x
      00897D 1F 06            [ 2]  210 	ldw	(0x06, sp), x
                                    211 ; genGoto
      00897F CC 89 9C         [ 2]  212 	jp	00110$
                                    213 ; genLabel
      008982                        214 00109$:
                           000087   215 	C$led_matrix.c$84$2_0$323 ==.
                                    216 ;	../src/led_matrix.c: 84: else nxtTick = (nxtTick%2)?(nxtTick+1):nxtTick;
                                    217 ; genAnd
      008982 7B 09            [ 1]  218 	ld	a, (0x09, sp)
      008984 44               [ 1]  219 	srl	a
      008985 25 03            [ 1]  220 	jrc	00175$
      008987 CC 89 9C         [ 2]  221 	jp	00115$
      00898A                        222 00175$:
                                    223 ; skipping generated iCode
                                    224 ; genPlus
      00898A 1E 08            [ 2]  225 	ldw	x, (0x08, sp)
      00898C 1C 00 01         [ 2]  226 	addw	x, #0x0001
      00898F 16 06            [ 2]  227 	ldw	y, (0x06, sp)
      008991 24 02            [ 1]  228 	jrnc	00176$
      008993 90 5C            [ 1]  229 	incw	y
      008995                        230 00176$:
                                    231 ; genAssign
      008995 1F 08            [ 2]  232 	ldw	(0x08, sp), x
      008997 17 06            [ 2]  233 	ldw	(0x06, sp), y
                                    234 ; genGoto
      008999 CC 89 9C         [ 2]  235 	jp	00116$
                                    236 ; genLabel
      00899C                        237 00115$:
                                    238 ; genAssign
                                    239 ; genLabel
      00899C                        240 00116$:
                                    241 ; genAssign
                                    242 ; genLabel
      00899C                        243 00110$:
                           0000A1   244 	C$led_matrix.c$85$2_0$323 ==.
                                    245 ;	../src/led_matrix.c: 85: led_ticks[ledID] = nxtTick;break;
                                    246 ; skipping iCode since result will be rematerialized
                                    247 ; genMult
                                    248 ; genMultLit
      00899C 5F               [ 1]  249 	clrw	x
      00899D 7B 0C            [ 1]  250 	ld	a, (0x0c, sp)
      00899F 97               [ 1]  251 	ld	xl, a
      0089A0 58               [ 2]  252 	sllw	x
      0089A1 58               [ 2]  253 	sllw	x
                                    254 ; genPlus
      0089A2 1C 00 25         [ 2]  255 	addw	x, #(_led_ticks+0)
                                    256 ; genPointerSet
      0089A5 16 08            [ 2]  257 	ldw	y, (0x08, sp)
      0089A7 EF 02            [ 2]  258 	ldw	(0x2, x), y
      0089A9 16 06            [ 2]  259 	ldw	y, (0x06, sp)
      0089AB FF               [ 2]  260 	ldw	(x), y
                                    261 ; genGoto
      0089AC CC 89 F2         [ 2]  262 	jp	00113$
                           0000B4   263 	C$led_matrix.c$86$2_0$323 ==.
                                    264 ;	../src/led_matrix.c: 86: case LED_TOGGLE_FAST: //odd number is fast
                                    265 ; genLabel
      0089AF                        266 00111$:
                           0000B4   267 	C$led_matrix.c$87$2_0$323 ==.
                                    268 ;	../src/led_matrix.c: 87: nxtTick = sysTick + LED_TOGGLE_FAST_TICK;
                                    269 ; genPlus
      0089AF CE 00 23         [ 2]  270 	ldw	x, _sysTick+2
      0089B2 1C 01 2C         [ 2]  271 	addw	x, #0x012c
      0089B5 90 CE 00 21      [ 2]  272 	ldw	y, _sysTick+0
      0089B9 24 02            [ 1]  273 	jrnc	00177$
      0089BB 90 5C            [ 1]  274 	incw	y
      0089BD                        275 00177$:
                                    276 ; genAssign
      0089BD 1F 03            [ 2]  277 	ldw	(0x03, sp), x
      0089BF 17 01            [ 2]  278 	ldw	(0x01, sp), y
                           0000C6   279 	C$led_matrix.c$88$2_0$323 ==.
                                    280 ;	../src/led_matrix.c: 88: nxtTick = (nxtTick%2)?nxtTick:(nxtTick+1);
                                    281 ; genAnd
      0089C1 7B 04            [ 1]  282 	ld	a, (0x04, sp)
      0089C3 44               [ 1]  283 	srl	a
      0089C4 25 03            [ 1]  284 	jrc	00178$
      0089C6 CC 89 D4         [ 2]  285 	jp	00117$
      0089C9                        286 00178$:
                                    287 ; skipping generated iCode
                                    288 ; genAssign
      0089C9 16 03            [ 2]  289 	ldw	y, (0x03, sp)
      0089CB 17 08            [ 2]  290 	ldw	(0x08, sp), y
      0089CD 16 01            [ 2]  291 	ldw	y, (0x01, sp)
      0089CF 17 06            [ 2]  292 	ldw	(0x06, sp), y
                                    293 ; genGoto
      0089D1 CC 89 E2         [ 2]  294 	jp	00118$
                                    295 ; genLabel
      0089D4                        296 00117$:
                                    297 ; genPlus
      0089D4 1E 03            [ 2]  298 	ldw	x, (0x03, sp)
      0089D6 1C 00 01         [ 2]  299 	addw	x, #0x0001
      0089D9 1F 08            [ 2]  300 	ldw	(0x08, sp), x
      0089DB 1E 01            [ 2]  301 	ldw	x, (0x01, sp)
      0089DD 24 01            [ 1]  302 	jrnc	00179$
      0089DF 5C               [ 1]  303 	incw	x
      0089E0                        304 00179$:
                                    305 ; genAssign
      0089E0 1F 06            [ 2]  306 	ldw	(0x06, sp), x
                                    307 ; genLabel
      0089E2                        308 00118$:
                                    309 ; genAssign
      0089E2 16 08            [ 2]  310 	ldw	y, (0x08, sp)
                           0000E9   311 	C$led_matrix.c$89$2_0$323 ==.
                                    312 ;	../src/led_matrix.c: 89: led_ticks[ledID] = nxtTick;break;
                                    313 ; skipping iCode since result will be rematerialized
                                    314 ; genMult
                                    315 ; genMultLit
      0089E4 5F               [ 1]  316 	clrw	x
      0089E5 7B 0C            [ 1]  317 	ld	a, (0x0c, sp)
      0089E7 97               [ 1]  318 	ld	xl, a
      0089E8 58               [ 2]  319 	sllw	x
      0089E9 58               [ 2]  320 	sllw	x
                                    321 ; genPlus
      0089EA 1C 00 25         [ 2]  322 	addw	x, #(_led_ticks+0)
                                    323 ; genPointerSet
      0089ED EF 02            [ 2]  324 	ldw	(0x2, x), y
      0089EF 16 06            [ 2]  325 	ldw	y, (0x06, sp)
      0089F1 FF               [ 2]  326 	ldw	(x), y
                           0000F7   327 	C$led_matrix.c$90$1_0$322 ==.
                                    328 ;	../src/led_matrix.c: 90: }
                                    329 ; genLabel
      0089F2                        330 00113$:
                           0000F7   331 	C$led_matrix.c$91$1_0$322 ==.
                                    332 ;	../src/led_matrix.c: 91: }
                                    333 ; genEndFunction
      0089F2 5B 09            [ 2]  334 	addw	sp, #9
                           0000F9   335 	C$led_matrix.c$91$1_0$322 ==.
                           0000F9   336 	XG$SetLedMode$0$0 ==.
      0089F4 81               [ 4]  337 	ret
                           0000FA   338 	G$UpdateLeds$0$0 ==.
                           0000FA   339 	C$led_matrix.c$95$1_0$324 ==.
                                    340 ;	../src/led_matrix.c: 95: void UpdateLeds()
                                    341 ; genLabel
                                    342 ;	-----------------------------------------
                                    343 ;	 function UpdateLeds
                                    344 ;	-----------------------------------------
                                    345 ;	Register assignment might be sub-optimal.
                                    346 ;	Stack space usage: 15 bytes.
      0089F5                        347 _UpdateLeds:
      0089F5 52 0F            [ 2]  348 	sub	sp, #15
                           0000FC   349 	C$led_matrix.c$100$2_0$325 ==.
                                    350 ;	../src/led_matrix.c: 100: for(idx = 0; idx < NUM_OF_LEDS; idx++){
                                    351 ; genAssign
      0089F7 0F 0F            [ 1]  352 	clr	(0x0f, sp)
                                    353 ; skipping iCode since result will be rematerialized
                                    354 ; genLabel
      0089F9                        355 00105$:
                           0000FE   356 	C$led_matrix.c$101$3_0$326 ==.
                                    357 ;	../src/led_matrix.c: 101: tick = led_ticks[idx];
                                    358 ; genMult
                                    359 ; genMultLit
      0089F9 5F               [ 1]  360 	clrw	x
      0089FA 7B 0F            [ 1]  361 	ld	a, (0x0f, sp)
      0089FC 97               [ 1]  362 	ld	xl, a
      0089FD 58               [ 2]  363 	sllw	x
      0089FE 58               [ 2]  364 	sllw	x
                                    365 ; genPlus
      0089FF 1C 00 25         [ 2]  366 	addw	x, #(_led_ticks+0)
                                    367 ; genPointerGet
      008A02 90 93            [ 1]  368 	ldw	y, x
      008A04 90 EE 02         [ 2]  369 	ldw	y, (0x2, y)
      008A07 FE               [ 2]  370 	ldw	x, (x)
                                    371 ; genAssign
      008A08 17 0D            [ 2]  372 	ldw	(0x0d, sp), y
      008A0A 1F 0B            [ 2]  373 	ldw	(0x0b, sp), x
                           000111   374 	C$led_matrix.c$102$3_0$326 ==.
                                    375 ;	../src/led_matrix.c: 102: if((tick != 0) && (sysTick == tick)){
                                    376 ; genIfx
      008A0C 1E 0D            [ 2]  377 	ldw	x, (0x0d, sp)
      008A0E 26 07            [ 1]  378 	jrne	00137$
      008A10 1E 0B            [ 2]  379 	ldw	x, (0x0b, sp)
      008A12 26 03            [ 1]  380 	jrne	00137$
      008A14 CC 8A 95         [ 2]  381 	jp	00106$
      008A17                        382 00137$:
                                    383 ; genCmpEQorNE
      008A17 1E 0D            [ 2]  384 	ldw	x, (0x0d, sp)
      008A19 C3 00 23         [ 2]  385 	cpw	x, _sysTick+2
      008A1C 26 0A            [ 1]  386 	jrne	00139$
      008A1E 1E 0B            [ 2]  387 	ldw	x, (0x0b, sp)
      008A20 C3 00 21         [ 2]  388 	cpw	x, _sysTick+0
      008A23 26 03            [ 1]  389 	jrne	00139$
      008A25 CC 8A 2B         [ 2]  390 	jp	00140$
      008A28                        391 00139$:
      008A28 CC 8A 95         [ 2]  392 	jp	00106$
      008A2B                        393 00140$:
                                    394 ; skipping generated iCode
                           000130   395 	C$led_matrix.c$103$4_0$327 ==.
                                    396 ;	../src/led_matrix.c: 103: led_ticks[idx] += ((tick%2)?LED_TOGGLE_FAST_TICK:LED_TOGGLE_SLOW_TICK);
                                    397 ; genMult
                                    398 ; genMultLit
      008A2B 5F               [ 1]  399 	clrw	x
      008A2C 7B 0F            [ 1]  400 	ld	a, (0x0f, sp)
      008A2E 97               [ 1]  401 	ld	xl, a
      008A2F 58               [ 2]  402 	sllw	x
      008A30 58               [ 2]  403 	sllw	x
                                    404 ; genPlus
      008A31 1C 00 25         [ 2]  405 	addw	x, #(_led_ticks+0)
      008A34 1F 01            [ 2]  406 	ldw	(0x01, sp), x
                                    407 ; genPointerGet
      008A36 1E 01            [ 2]  408 	ldw	x, (0x01, sp)
      008A38 90 93            [ 1]  409 	ldw	y, x
      008A3A 90 EE 02         [ 2]  410 	ldw	y, (0x2, y)
      008A3D 17 05            [ 2]  411 	ldw	(0x05, sp), y
      008A3F FE               [ 2]  412 	ldw	x, (x)
      008A40 1F 03            [ 2]  413 	ldw	(0x03, sp), x
                                    414 ; genAnd
      008A42 7B 0E            [ 1]  415 	ld	a, (0x0e, sp)
      008A44 44               [ 1]  416 	srl	a
      008A45 25 03            [ 1]  417 	jrc	00141$
      008A47 CC 8A 52         [ 2]  418 	jp	00109$
      008A4A                        419 00141$:
                                    420 ; skipping generated iCode
                                    421 ; genAssign
      008A4A AE 01 2C         [ 2]  422 	ldw	x, #0x012c
      008A4D 1F 0D            [ 2]  423 	ldw	(0x0d, sp), x
                                    424 ; genGoto
      008A4F CC 8A 57         [ 2]  425 	jp	00110$
                                    426 ; genLabel
      008A52                        427 00109$:
                                    428 ; genAssign
      008A52 AE 03 E8         [ 2]  429 	ldw	x, #0x03e8
      008A55 1F 0D            [ 2]  430 	ldw	(0x0d, sp), x
                                    431 ; genLabel
      008A57                        432 00110$:
                                    433 ; genCast
      008A57 16 0D            [ 2]  434 	ldw	y, (0x0d, sp)
      008A59 17 09            [ 2]  435 	ldw	(0x09, sp), y
      008A5B 7B 09            [ 1]  436 	ld	a, (0x09, sp)
      008A5D 49               [ 1]  437 	rlc	a
      008A5E 4F               [ 1]  438 	clr	a
      008A5F A2 00            [ 1]  439 	sbc	a, #0x00
      008A61 6B 08            [ 1]  440 	ld	(0x08, sp), a
      008A63 6B 07            [ 1]  441 	ld	(0x07, sp), a
                                    442 ; genPlus
      008A65 1E 05            [ 2]  443 	ldw	x, (0x05, sp)
      008A67 72 FB 09         [ 2]  444 	addw	x, (0x09, sp)
      008A6A 1F 0D            [ 2]  445 	ldw	(0x0d, sp), x
      008A6C 7B 04            [ 1]  446 	ld	a, (0x04, sp)
      008A6E 19 08            [ 1]  447 	adc	a, (0x08, sp)
      008A70 6B 0C            [ 1]  448 	ld	(0x0c, sp), a
      008A72 7B 03            [ 1]  449 	ld	a, (0x03, sp)
      008A74 19 07            [ 1]  450 	adc	a, (0x07, sp)
      008A76 6B 0B            [ 1]  451 	ld	(0x0b, sp), a
                                    452 ; genPointerSet
      008A78 1E 01            [ 2]  453 	ldw	x, (0x01, sp)
      008A7A 16 0D            [ 2]  454 	ldw	y, (0x0d, sp)
      008A7C EF 02            [ 2]  455 	ldw	(0x2, x), y
      008A7E 16 0B            [ 2]  456 	ldw	y, (0x0b, sp)
      008A80 FF               [ 2]  457 	ldw	(x), y
                           000186   458 	C$led_matrix.c$104$4_0$327 ==.
                                    459 ;	../src/led_matrix.c: 104: SetLedState(idx, !GetLedState(idx));
                                    460 ; genIPush
      008A81 7B 0F            [ 1]  461 	ld	a, (0x0f, sp)
      008A83 88               [ 1]  462 	push	a
                                    463 ; genCall
      008A84 CD 8B D1         [ 4]  464 	call	_GetLedState
      008A87 5B 01            [ 2]  465 	addw	sp, #1
                                    466 ; genNot
      008A89 A0 01            [ 1]  467 	sub	a, #0x01
      008A8B 4F               [ 1]  468 	clr	a
      008A8C 49               [ 1]  469 	rlc	a
                                    470 ; genCast
                                    471 ; genAssign
                                    472 ; genIPush
      008A8D 88               [ 1]  473 	push	a
                                    474 ; genIPush
      008A8E 7B 10            [ 1]  475 	ld	a, (0x10, sp)
      008A90 88               [ 1]  476 	push	a
                                    477 ; genCall
      008A91 CD 8B F4         [ 4]  478 	call	_SetLedState
      008A94 85               [ 2]  479 	popw	x
                                    480 ; genLabel
      008A95                        481 00106$:
                           00019A   482 	C$led_matrix.c$100$2_0$325 ==.
                                    483 ;	../src/led_matrix.c: 100: for(idx = 0; idx < NUM_OF_LEDS; idx++){
                                    484 ; genPlus
      008A95 0C 0F            [ 1]  485 	inc	(0x0f, sp)
                                    486 ; genCmp
                                    487 ; genCmpTop
      008A97 7B 0F            [ 1]  488 	ld	a, (0x0f, sp)
      008A99 A1 0C            [ 1]  489 	cp	a, #0x0c
      008A9B 24 03            [ 1]  490 	jrnc	00142$
      008A9D CC 89 F9         [ 2]  491 	jp	00105$
      008AA0                        492 00142$:
                                    493 ; skipping generated iCode
                           0001A5   494 	C$led_matrix.c$108$1_0$324 ==.
                                    495 ;	../src/led_matrix.c: 108: UpdateLedState();
                                    496 ; genCall
      008AA0 5B 0F            [ 2]  497 	addw	sp, #15
      008AA2 CC 8A C3         [ 2]  498 	jp	_UpdateLedState
                                    499 ; genLabel
      008AA5                        500 00107$:
                           0001AA   501 	C$led_matrix.c$109$1_0$324 ==.
                                    502 ;	../src/led_matrix.c: 109: }
                                    503 ; genEndFunction
      008AA5 5B 0F            [ 2]  504 	addw	sp, #15
                           0001AC   505 	C$led_matrix.c$109$1_0$324 ==.
                           0001AC   506 	XG$UpdateLeds$0$0 ==.
      008AA7 81               [ 4]  507 	ret
                                    508 	.area CODE
                                    509 	.area CONST
                                    510 	.area INITIALIZER
                                    511 	.area CABS (ABS)
