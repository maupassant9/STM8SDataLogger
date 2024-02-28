                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.1.0 #12072 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module adc
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _adcBuffer1
                                     12 	.globl _adcBuffer0
                                     13 	.globl _buffer_rdy
                                     14 	.globl _adcInit
                                     15 	.globl _adcIsr
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area DATA
                           000000    20 G$buffer_rdy$0_0$0==.
      000059                         21 _buffer_rdy::
      000059                         22 	.ds 1
                           000001    23 G$adcBuffer0$0_0$0==.
      00005A                         24 _adcBuffer0::
      00005A                         25 	.ds 256
                           000101    26 G$adcBuffer1$0_0$0==.
      00015A                         27 _adcBuffer1::
      00015A                         28 	.ds 256
                           000201    29 Fadc$cnter$0_0$0==.
      00025A                         30 _cnter:
      00025A                         31 	.ds 2
                           000203    32 Fadc$pCurrBuffer$0_0$0==.
      00025C                         33 _pCurrBuffer:
      00025C                         34 	.ds 2
                           000205    35 Fadc$pCurrByte$0_0$0==.
      00025E                         36 _pCurrByte:
      00025E                         37 	.ds 2
                           000207    38 Ladc.NextChannel$cntForChannel$1_0$329==.
      000260                         39 _NextChannel_cntForChannel_65536_329:
      000260                         40 	.ds 1
                                     41 ;--------------------------------------------------------
                                     42 ; ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area INITIALIZED
                                     45 ;--------------------------------------------------------
                                     46 ; absolute external ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area DABS (ABS)
                                     49 
                                     50 ; default segment ordering for linker
                                     51 	.area HOME
                                     52 	.area GSINIT
                                     53 	.area GSFINAL
                                     54 	.area CONST
                                     55 	.area INITIALIZER
                                     56 	.area CODE
                                     57 
                                     58 ;--------------------------------------------------------
                                     59 ; global & static initialisations
                                     60 ;--------------------------------------------------------
                                     61 	.area HOME
                                     62 	.area GSINIT
                                     63 	.area GSFINAL
                                     64 	.area GSINIT
                           000000    65 	Fadc$NextChannel$0$0 ==.
                           000000    66 	C$adc.c$157$2_0$330 ==.
                                     67 ;	../src/adc.c: 157: static uint8_t cntForChannel = 8;
                                     68 ; genAssign
      00809B 35 08 02 60      [ 1]   69 	mov	_NextChannel_cntForChannel_65536_329+0, #0x08
                                     70 ;--------------------------------------------------------
                                     71 ; Home
                                     72 ;--------------------------------------------------------
                                     73 	.area HOME
                                     74 	.area HOME
                                     75 ;--------------------------------------------------------
                                     76 ; code
                                     77 ;--------------------------------------------------------
                                     78 	.area CODE
                           000000    79 	Fadc$tim1Init$0$0 ==.
                           000000    80 	C$adc.c$65$0_0$320 ==.
                                     81 ;	../src/adc.c: 65: static void tim1Init( void )
                                     82 ; genLabel
                                     83 ;	-----------------------------------------
                                     84 ;	 function tim1Init
                                     85 ;	-----------------------------------------
                                     86 ;	Register assignment might be sub-optimal.
                                     87 ;	Stack space usage: 4 bytes.
      008C25                         88 _tim1Init:
      008C25 52 04            [ 2]   89 	sub	sp, #4
                           000002    90 	C$adc.c$69$1_0$320 ==.
                                     91 ;	../src/adc.c: 69: TIM1->CR1 = (TIM1_CR1_ARPE|TIM1_CR1_URS);
                                     92 ; genPointerSet
      008C27 35 84 52 50      [ 1]   93 	mov	0x5250+0, #0x84
                           000006    94 	C$adc.c$70$1_0$320 ==.
                                     95 ;	../src/adc.c: 70: TIM1->CR2 = 0x20;
                                     96 ; genPointerSet
      008C2B 35 20 52 51      [ 1]   97 	mov	0x5251+0, #0x20
                           00000A    98 	C$adc.c$74$1_0$320 ==.
                                     99 ;	../src/adc.c: 74: period = ((((uint32_t)INPUT_FREQ_TIM1_FOR_ADC)/loggerCfg.sampFreq)/GetChannelNo());
                                    100 ; skipping iCode since result will be rematerialized
                                    101 ; genPointerGet
      008C2F CE 00 0E         [ 2]  102 	ldw	x, _loggerCfg+0
                                    103 ; genCast
                                    104 ; genAssign
      008C32 90 5F            [ 1]  105 	clrw	y
                                    106 ; genIPush
      008C34 89               [ 2]  107 	pushw	x
      008C35 90 89            [ 2]  108 	pushw	y
                                    109 ; genIPush
      008C37 4B 00            [ 1]  110 	push	#0x00
      008C39 4B 24            [ 1]  111 	push	#0x24
      008C3B 4B F4            [ 1]  112 	push	#0xf4
      008C3D 4B 00            [ 1]  113 	push	#0x00
                                    114 ; genCall
      008C3F CD A0 11         [ 4]  115 	call	__divulong
      008C42 5B 08            [ 2]  116 	addw	sp, #8
      008C44 1F 03            [ 2]  117 	ldw	(0x03, sp), x
      008C46 17 01            [ 2]  118 	ldw	(0x01, sp), y
                                    119 ; genCall
      008C48 CD 8D 65         [ 4]  120 	call	_GetChannelNo
                                    121 ; genCast
                                    122 ; genAssign
      008C4B 5F               [ 1]  123 	clrw	x
      008C4C 97               [ 1]  124 	ld	xl, a
      008C4D 90 5F            [ 1]  125 	clrw	y
                                    126 ; genIPush
      008C4F 89               [ 2]  127 	pushw	x
      008C50 90 89            [ 2]  128 	pushw	y
                                    129 ; genIPush
      008C52 1E 07            [ 2]  130 	ldw	x, (0x07, sp)
      008C54 89               [ 2]  131 	pushw	x
      008C55 1E 07            [ 2]  132 	ldw	x, (0x07, sp)
      008C57 89               [ 2]  133 	pushw	x
                                    134 ; genCall
      008C58 CD A0 11         [ 4]  135 	call	__divulong
      008C5B 5B 08            [ 2]  136 	addw	sp, #8
                                    137 ; genAssign
      008C5D 1F 03            [ 2]  138 	ldw	(0x03, sp), x
                           00003A   139 	C$adc.c$75$1_0$320 ==.
                                    140 ;	../src/adc.c: 75: TIM1->ARRH = (uint8_t)((period&0xff00)>>8);
                                    141 ; genCast
                                    142 ; genAssign
      008C5F 1E 03            [ 2]  143 	ldw	x, (0x03, sp)
                                    144 ; genAnd
      008C61 4F               [ 1]  145 	clr	a
      008C62 97               [ 1]  146 	ld	xl, a
      008C63 9E               [ 1]  147 	ld	a, xh
                                    148 ; genRightShiftLiteral
      008C64 5F               [ 1]  149 	clrw	x
                                    150 ; genCast
                                    151 ; genAssign
                                    152 ; genPointerSet
      008C65 C7 52 62         [ 1]  153 	ld	0x5262, a
                           000043   154 	C$adc.c$76$1_0$320 ==.
                                    155 ;	../src/adc.c: 76: TIM1->ARRL = (uint8_t)(period&0xff);
                                    156 ; genCast
                                    157 ; genAssign
      008C68 7B 04            [ 1]  158 	ld	a, (0x04, sp)
                                    159 ; genPointerSet
      008C6A C7 52 63         [ 1]  160 	ld	0x5263, a
                           000048   161 	C$adc.c$77$1_0$320 ==.
                                    162 ;	../src/adc.c: 77: TIM1->EGR |= TIM1_EGR_UG;
                                    163 ; genPointerGet
      008C6D C6 52 57         [ 1]  164 	ld	a, 0x5257
                                    165 ; genOr
      008C70 AA 01            [ 1]  166 	or	a, #0x01
                                    167 ; genPointerSet
      008C72 C7 52 57         [ 1]  168 	ld	0x5257, a
                           000050   169 	C$adc.c$78$1_0$320 ==.
                                    170 ;	../src/adc.c: 78: TIM1->CR1 |= TIM1_CR1_CEN;
                                    171 ; genPointerGet
      008C75 C6 52 50         [ 1]  172 	ld	a, 0x5250
                                    173 ; genOr
      008C78 AA 01            [ 1]  174 	or	a, #0x01
                                    175 ; genPointerSet
      008C7A C7 52 50         [ 1]  176 	ld	0x5250, a
                                    177 ; genLabel
      008C7D                        178 00101$:
                           000058   179 	C$adc.c$79$1_0$320 ==.
                                    180 ;	../src/adc.c: 79: }
                                    181 ; genEndFunction
      008C7D 5B 04            [ 2]  182 	addw	sp, #4
                           00005A   183 	C$adc.c$79$1_0$320 ==.
                           00005A   184 	XFadc$tim1Init$0$0 ==.
      008C7F 81               [ 4]  185 	ret
                           00005B   186 	G$adcInit$0$0 ==.
                           00005B   187 	C$adc.c$90$1_0$322 ==.
                                    188 ;	../src/adc.c: 90: void adcInit( void )
                                    189 ; genLabel
                                    190 ;	-----------------------------------------
                                    191 ;	 function adcInit
                                    192 ;	-----------------------------------------
                                    193 ;	Register assignment might be sub-optimal.
                                    194 ;	Stack space usage: 0 bytes.
      008C80                        195 _adcInit:
                           00005B   196 	C$adc.c$92$1_0$322 ==.
                                    197 ;	../src/adc.c: 92: cnter = 0x00;
                                    198 ; genAssign
      008C80 5F               [ 1]  199 	clrw	x
      008C81 CF 02 5A         [ 2]  200 	ldw	_cnter+0, x
                           00005F   201 	C$adc.c$93$1_0$322 ==.
                                    202 ;	../src/adc.c: 93: pCurrBuffer = (uint8_t *)adcBuffer0;
                                    203 ; skipping iCode since result will be rematerialized
                                    204 ; skipping iCode since result will be rematerialized
                                    205 ; genAssign
      008C84 AE 00 5A         [ 2]  206 	ldw	x, #(_adcBuffer0+0)
      008C87 CF 02 5C         [ 2]  207 	ldw	_pCurrBuffer+0, x
                           000065   208 	C$adc.c$94$1_0$322 ==.
                                    209 ;	../src/adc.c: 94: pCurrByte = (uint8_t *)adcBuffer0;
                                    210 ; skipping iCode since result will be rematerialized
                                    211 ; skipping iCode since result will be rematerialized
                                    212 ; genAssign
      008C8A AE 00 5A         [ 2]  213 	ldw	x, #(_adcBuffer0+0)
      008C8D CF 02 5E         [ 2]  214 	ldw	_pCurrByte+0, x
                           00006B   215 	C$adc.c$95$1_0$322 ==.
                                    216 ;	../src/adc.c: 95: buffer_rdy = 0x00; //nenhum buffers are ready
                                    217 ; genAssign
      008C90 72 5F 00 59      [ 1]  218 	clr	_buffer_rdy+0
                           00006F   219 	C$adc.c$97$1_0$322 ==.
                                    220 ;	../src/adc.c: 97: ADC1->CR1 = 0x20;
                                    221 ; genPointerSet
      008C94 35 20 54 01      [ 1]  222 	mov	0x5401+0, #0x20
                           000073   223 	C$adc.c$100$1_0$322 ==.
                                    224 ;	../src/adc.c: 100: ADC1->CSR = NextChannel()|ADC1_CSR_EOCIE;
                                    225 ; genCall
      008C98 CD 8D 1F         [ 4]  226 	call	_NextChannel
                                    227 ; genOr
      008C9B AA 20            [ 1]  228 	or	a, #0x20
                                    229 ; genPointerSet
      008C9D C7 54 00         [ 1]  230 	ld	0x5400, a
                           00007B   231 	C$adc.c$102$1_0$322 ==.
                                    232 ;	../src/adc.c: 102: ADC1->CR2 = (loggerCfg.isFullResultion<<3)|ADC1_CR2_EXTTRIG;//(ADC1_CR2_EXTTRIG | ADC1_CR2_ALIGN);
                                    233 ; skipping iCode since result will be rematerialized
                                    234 ; genPointerGet
      008CA0 C6 00 1C         [ 1]  235 	ld	a, _loggerCfg+14
                                    236 ; genCast
                                    237 ; genAssign
                                    238 ; genLeftShiftLiteral
      008CA3 48               [ 1]  239 	sll	a
      008CA4 48               [ 1]  240 	sll	a
      008CA5 48               [ 1]  241 	sll	a
                                    242 ; genOr
      008CA6 AA 40            [ 1]  243 	or	a, #0x40
                                    244 ; genPointerSet
      008CA8 C7 54 02         [ 1]  245 	ld	0x5402, a
                           000086   246 	C$adc.c$104$1_0$322 ==.
                                    247 ;	../src/adc.c: 104: ADC1->CR3 = ADC1_CR3_DBUF;
                                    248 ; genPointerSet
      008CAB 35 80 54 03      [ 1]  249 	mov	0x5403+0, #0x80
                           00008A   250 	C$adc.c$106$1_0$322 ==.
                                    251 ;	../src/adc.c: 106: ADC1->TDRL = 0x1f;
                                    252 ; genPointerSet
      008CAF 35 1F 54 07      [ 1]  253 	mov	0x5407+0, #0x1f
                           00008E   254 	C$adc.c$108$1_0$322 ==.
                                    255 ;	../src/adc.c: 108: ADC1->CR1 |= ADC1_CR1_ADON;
                                    256 ; genPointerGet
      008CB3 C6 54 01         [ 1]  257 	ld	a, 0x5401
                                    258 ; genOr
      008CB6 AA 01            [ 1]  259 	or	a, #0x01
                                    260 ; genPointerSet
      008CB8 C7 54 01         [ 1]  261 	ld	0x5401, a
                           000096   262 	C$adc.c$110$1_0$322 ==.
                                    263 ;	../src/adc.c: 110: tim1Init();
                                    264 ; genCall
      008CBB CC 8C 25         [ 2]  265 	jp	_tim1Init
                                    266 ; genLabel
      008CBE                        267 00101$:
                           000099   268 	C$adc.c$111$1_0$322 ==.
                                    269 ;	../src/adc.c: 111: }
                                    270 ; genEndFunction
                           000099   271 	C$adc.c$111$1_0$322 ==.
                           000099   272 	XG$adcInit$0$0 ==.
      008CBE 81               [ 4]  273 	ret
                           00009A   274 	Fadc$NextByte$0$0 ==.
                           00009A   275 	C$adc.c$124$1_0$323 ==.
                                    276 ;	../src/adc.c: 124: static void NextByte()
                                    277 ; genLabel
                                    278 ;	-----------------------------------------
                                    279 ;	 function NextByte
                                    280 ;	-----------------------------------------
                                    281 ;	Register assignment might be sub-optimal.
                                    282 ;	Stack space usage: 0 bytes.
      008CBF                        283 _NextByte:
                           00009A   284 	C$adc.c$126$1_0$323 ==.
                                    285 ;	../src/adc.c: 126: INC(cnter);
                                    286 ; genCmpEQorNE
      008CBF CE 02 5A         [ 2]  287 	ldw	x, _cnter+0
      008CC2 A3 00 FF         [ 2]  288 	cpw	x, #0x00ff
      008CC5 26 03            [ 1]  289 	jrne	00127$
      008CC7 CC 8C CD         [ 2]  290 	jp	00128$
      008CCA                        291 00127$:
      008CCA CC 8C D1         [ 2]  292 	jp	00109$
      008CCD                        293 00128$:
                                    294 ; skipping generated iCode
                                    295 ; genAssign
      008CCD 5F               [ 1]  296 	clrw	x
                                    297 ; genGoto
      008CCE CC 8C D5         [ 2]  298 	jp	00110$
                                    299 ; genLabel
      008CD1                        300 00109$:
                                    301 ; genCast
                                    302 ; genAssign
      008CD1 CE 02 5A         [ 2]  303 	ldw	x, _cnter+0
                                    304 ; genPlus
      008CD4 5C               [ 1]  305 	incw	x
                                    306 ; genAssign
                                    307 ; genLabel
      008CD5                        308 00110$:
                                    309 ; genCast
                                    310 ; genAssign
                                    311 ; genAssign
      008CD5 CF 02 5A         [ 2]  312 	ldw	_cnter+0, x
                           0000B3   313 	C$adc.c$128$1_0$323 ==.
                                    314 ;	../src/adc.c: 128: if(cnter == 0){ //an overflow occurred
                                    315 ; genIfx
      008CD8 CE 02 5A         [ 2]  316 	ldw	x, _cnter+0
      008CDB 27 03            [ 1]  317 	jreq	00129$
      008CDD CC 8D 14         [ 2]  318 	jp	00105$
      008CE0                        319 00129$:
                           0000BB   320 	C$adc.c$130$2_0$324 ==.
                                    321 ;	../src/adc.c: 130: if(pCurrBuffer == (uint8_t *)adcBuffer0) {
                                    322 ; genAddrOf
      008CE0 AE 00 5A         [ 2]  323 	ldw	x, #_adcBuffer0+0
                                    324 ; genCast
                                    325 ; genAssign
                                    326 ; genCast
                                    327 ; genAssign
                                    328 ; genCmpEQorNE
      008CE3 C3 02 5C         [ 2]  329 	cpw	x, _pCurrBuffer+0
      008CE6 26 03            [ 1]  330 	jrne	00131$
      008CE8 CC 8C EE         [ 2]  331 	jp	00132$
      008CEB                        332 00131$:
      008CEB CC 8D 01         [ 2]  333 	jp	00102$
      008CEE                        334 00132$:
                                    335 ; skipping generated iCode
                           0000C9   336 	C$adc.c$131$3_0$325 ==.
                                    337 ;	../src/adc.c: 131: RELEASE_BUFF_FOR_RD(0);
                                    338 ; genOr
      008CEE 72 10 00 59      [ 1]  339 	bset	_buffer_rdy+0, #0
                           0000CD   340 	C$adc.c$132$3_0$325 ==.
                                    341 ;	../src/adc.c: 132: pCurrBuffer = (uint8_t *)adcBuffer1;
                                    342 ; skipping iCode since result will be rematerialized
                                    343 ; skipping iCode since result will be rematerialized
                                    344 ; genAssign
      008CF2 AE 01 5A         [ 2]  345 	ldw	x, #(_adcBuffer1+0)
      008CF5 CF 02 5C         [ 2]  346 	ldw	_pCurrBuffer+0, x
                           0000D3   347 	C$adc.c$133$3_0$325 ==.
                                    348 ;	../src/adc.c: 133: pCurrByte = (uint8_t *)adcBuffer1;
                                    349 ; skipping iCode since result will be rematerialized
                                    350 ; skipping iCode since result will be rematerialized
                                    351 ; genAssign
      008CF8 AE 01 5A         [ 2]  352 	ldw	x, #(_adcBuffer1+0)
      008CFB CF 02 5E         [ 2]  353 	ldw	_pCurrByte+0, x
                                    354 ; genGoto
      008CFE CC 8D 1E         [ 2]  355 	jp	00107$
                                    356 ; genLabel
      008D01                        357 00102$:
                           0000DC   358 	C$adc.c$135$3_0$326 ==.
                                    359 ;	../src/adc.c: 135: RELEASE_BUFF_FOR_RD(1);
                                    360 ; genOr
      008D01 72 12 00 59      [ 1]  361 	bset	_buffer_rdy+0, #1
                           0000E0   362 	C$adc.c$136$3_0$326 ==.
                                    363 ;	../src/adc.c: 136: pCurrBuffer = (uint8_t *)adcBuffer0;
                                    364 ; skipping iCode since result will be rematerialized
                                    365 ; skipping iCode since result will be rematerialized
                                    366 ; genAssign
      008D05 AE 00 5A         [ 2]  367 	ldw	x, #(_adcBuffer0+0)
      008D08 CF 02 5C         [ 2]  368 	ldw	_pCurrBuffer+0, x
                           0000E6   369 	C$adc.c$137$3_0$326 ==.
                                    370 ;	../src/adc.c: 137: pCurrByte =  (uint8_t *)adcBuffer0;
                                    371 ; skipping iCode since result will be rematerialized
                                    372 ; skipping iCode since result will be rematerialized
                                    373 ; genAssign
      008D0B AE 00 5A         [ 2]  374 	ldw	x, #(_adcBuffer0+0)
      008D0E CF 02 5E         [ 2]  375 	ldw	_pCurrByte+0, x
                                    376 ; genGoto
      008D11 CC 8D 1E         [ 2]  377 	jp	00107$
                                    378 ; genLabel
      008D14                        379 00105$:
                           0000EF   380 	C$adc.c$140$2_0$327 ==.
                                    381 ;	../src/adc.c: 140: pCurrByte = &pCurrBuffer[cnter];
                                    382 ; genPlus
      008D14 CE 02 5C         [ 2]  383 	ldw	x, _pCurrBuffer+0
      008D17 72 BB 02 5A      [ 2]  384 	addw	x, _cnter+0
                                    385 ; genAssign
      008D1B CF 02 5E         [ 2]  386 	ldw	_pCurrByte+0, x
                                    387 ; genLabel
      008D1E                        388 00107$:
                           0000F9   389 	C$adc.c$142$1_0$323 ==.
                                    390 ;	../src/adc.c: 142: }
                                    391 ; genEndFunction
                           0000F9   392 	C$adc.c$142$1_0$323 ==.
                           0000F9   393 	XFadc$NextByte$0$0 ==.
      008D1E 81               [ 4]  394 	ret
                           0000FA   395 	Fadc$NextChannel$0$0 ==.
                           0000FA   396 	C$adc.c$156$1_0$330 ==.
                                    397 ;	../src/adc.c: 156: static uint8_t NextChannel(void){
                                    398 ; genLabel
                                    399 ;	-----------------------------------------
                                    400 ;	 function NextChannel
                                    401 ;	-----------------------------------------
                                    402 ;	Register assignment might be sub-optimal.
                                    403 ;	Stack space usage: 2 bytes.
      008D1F                        404 _NextChannel:
      008D1F 89               [ 2]  405 	pushw	x
                                    406 ; skipping iCode since result will be rematerialized
                                    407 ; genLabel
      008D20                        408 00104$:
                           0000FB   409 	C$adc.c$160$3_0$331 ==.
                                    410 ;	../src/adc.c: 160: cntForChannel = ((8==cntForChannel)?0:(cntForChannel+1));
                                    411 ; genCmpEQorNE
      008D20 C6 02 60         [ 1]  412 	ld	a, _NextChannel_cntForChannel_65536_329+0
      008D23 A1 08            [ 1]  413 	cp	a, #0x08
      008D25 26 03            [ 1]  414 	jrne	00126$
      008D27 CC 8D 2D         [ 2]  415 	jp	00127$
      008D2A                        416 00126$:
      008D2A CC 8D 32         [ 2]  417 	jp	00108$
      008D2D                        418 00127$:
                                    419 ; skipping generated iCode
                                    420 ; genAssign
      008D2D 4F               [ 1]  421 	clr	a
      008D2E 5F               [ 1]  422 	clrw	x
                                    423 ; genGoto
      008D2F CC 8D 3D         [ 2]  424 	jp	00109$
                                    425 ; genLabel
      008D32                        426 00108$:
                                    427 ; genCast
                                    428 ; genAssign
      008D32 C6 02 60         [ 1]  429 	ld	a, _NextChannel_cntForChannel_65536_329+0
                                    430 ; genPlus
      008D35 4C               [ 1]  431 	inc	a
                                    432 ; genCast
      008D36 88               [ 1]  433 	push	a
      008D37 49               [ 1]  434 	rlc	a
      008D38 4F               [ 1]  435 	clr	a
      008D39 A2 00            [ 1]  436 	sbc	a, #0x00
      008D3B 97               [ 1]  437 	ld	xl, a
      008D3C 84               [ 1]  438 	pop	a
                                    439 ; genAssign
                                    440 ; genLabel
      008D3D                        441 00109$:
                                    442 ; genCast
                                    443 ; genAssign
      008D3D C7 02 60         [ 1]  444 	ld	_NextChannel_cntForChannel_65536_329+0, a
                           00011B   445 	C$adc.c$161$3_0$331 ==.
                                    446 ;	../src/adc.c: 161: if((0x01 << cntForChannel) & loggerCfg.channel){
                                    447 ; genAssign
      008D40 C6 02 60         [ 1]  448 	ld	a, _NextChannel_cntForChannel_65536_329+0
                                    449 ; genLeftShift
      008D43 5F               [ 1]  450 	clrw	x
      008D44 5C               [ 1]  451 	incw	x
      008D45 4D               [ 1]  452 	tnz	a
      008D46 27 04            [ 1]  453 	jreq	00129$
      008D48                        454 00128$:
      008D48 58               [ 2]  455 	sllw	x
      008D49 4A               [ 1]  456 	dec	a
      008D4A 26 FC            [ 1]  457 	jrne	00128$
      008D4C                        458 00129$:
                                    459 ; genPointerGet
      008D4C C6 00 1B         [ 1]  460 	ld	a, _loggerCfg+13
                                    461 ; genCast
                                    462 ; genAssign
      008D4F 0F 01            [ 1]  463 	clr	(0x01, sp)
                                    464 ; genAnd
      008D51 89               [ 2]  465 	pushw	x
      008D52 14 02            [ 1]  466 	and	a, (2, sp)
      008D54 85               [ 2]  467 	popw	x
      008D55 97               [ 1]  468 	ld	xl, a
      008D56 9E               [ 1]  469 	ld	a, xh
      008D57 14 01            [ 1]  470 	and	a, (0x01, sp)
      008D59 95               [ 1]  471 	ld	xh, a
                                    472 ; genIfx
      008D5A 5D               [ 2]  473 	tnzw	x
      008D5B 26 03            [ 1]  474 	jrne	00130$
      008D5D CC 8D 20         [ 2]  475 	jp	00104$
      008D60                        476 00130$:
                           00013B   477 	C$adc.c$163$4_0$332 ==.
                                    478 ;	../src/adc.c: 163: return cntForChannel;
                                    479 ; genReturn
      008D60 C6 02 60         [ 1]  480 	ld	a, _NextChannel_cntForChannel_65536_329+0
                                    481 ; genLabel
      008D63                        482 00106$:
                           00013E   483 	C$adc.c$166$2_0$330 ==.
                                    484 ;	../src/adc.c: 166: }
                                    485 ; genEndFunction
      008D63 85               [ 2]  486 	popw	x
                           00013F   487 	C$adc.c$166$2_0$330 ==.
                           00013F   488 	XFadc$NextChannel$0$0 ==.
      008D64 81               [ 4]  489 	ret
                           000140   490 	Fadc$GetChannelNo$0$0 ==.
                           000140   491 	C$adc.c$179$2_0$334 ==.
                                    492 ;	../src/adc.c: 179: static uint8_t GetChannelNo(void){
                                    493 ; genLabel
                                    494 ;	-----------------------------------------
                                    495 ;	 function GetChannelNo
                                    496 ;	-----------------------------------------
                                    497 ;	Register assignment might be sub-optimal.
                                    498 ;	Stack space usage: 4 bytes.
      008D65                        499 _GetChannelNo:
      008D65 52 04            [ 2]  500 	sub	sp, #4
                           000142   501 	C$adc.c$180$2_0$334 ==.
                                    502 ;	../src/adc.c: 180: uint8_t cnt, chNo = 0;
                                    503 ; genAssign
      008D67 0F 03            [ 1]  504 	clr	(0x03, sp)
                           000144   505 	C$adc.c$182$2_0$335 ==.
                                    506 ;	../src/adc.c: 182: for(cnt = 0; cnt < 8; cnt++){
                                    507 ; genAssign
      008D69 0F 04            [ 1]  508 	clr	(0x04, sp)
                                    509 ; skipping iCode since result will be rematerialized
                                    510 ; genLabel
      008D6B                        511 00104$:
                           000146   512 	C$adc.c$183$3_0$336 ==.
                                    513 ;	../src/adc.c: 183: if((0x01 << cnt) & loggerCfg.channel){
                                    514 ; genLeftShift
      008D6B 5F               [ 1]  515 	clrw	x
      008D6C 5C               [ 1]  516 	incw	x
      008D6D 7B 04            [ 1]  517 	ld	a, (0x04, sp)
      008D6F 27 04            [ 1]  518 	jreq	00125$
      008D71                        519 00124$:
      008D71 58               [ 2]  520 	sllw	x
      008D72 4A               [ 1]  521 	dec	a
      008D73 26 FC            [ 1]  522 	jrne	00124$
      008D75                        523 00125$:
                                    524 ; genPointerGet
      008D75 C6 00 1B         [ 1]  525 	ld	a, _loggerCfg+13
                                    526 ; genCast
                                    527 ; genAssign
      008D78 0F 01            [ 1]  528 	clr	(0x01, sp)
                                    529 ; genAnd
      008D7A 89               [ 2]  530 	pushw	x
      008D7B 14 02            [ 1]  531 	and	a, (2, sp)
      008D7D 85               [ 2]  532 	popw	x
      008D7E 97               [ 1]  533 	ld	xl, a
      008D7F 9E               [ 1]  534 	ld	a, xh
      008D80 14 01            [ 1]  535 	and	a, (0x01, sp)
      008D82 95               [ 1]  536 	ld	xh, a
                                    537 ; genIfx
      008D83 5D               [ 2]  538 	tnzw	x
      008D84 26 03            [ 1]  539 	jrne	00126$
      008D86 CC 8D 8B         [ 2]  540 	jp	00105$
      008D89                        541 00126$:
                           000164   542 	C$adc.c$184$4_0$337 ==.
                                    543 ;	../src/adc.c: 184: chNo++;
                                    544 ; genPlus
      008D89 0C 03            [ 1]  545 	inc	(0x03, sp)
                                    546 ; genLabel
      008D8B                        547 00105$:
                           000166   548 	C$adc.c$182$2_0$335 ==.
                                    549 ;	../src/adc.c: 182: for(cnt = 0; cnt < 8; cnt++){
                                    550 ; genPlus
      008D8B 0C 04            [ 1]  551 	inc	(0x04, sp)
                                    552 ; genCmp
                                    553 ; genCmpTop
      008D8D 7B 04            [ 1]  554 	ld	a, (0x04, sp)
      008D8F A1 08            [ 1]  555 	cp	a, #0x08
      008D91 24 03            [ 1]  556 	jrnc	00127$
      008D93 CC 8D 6B         [ 2]  557 	jp	00104$
      008D96                        558 00127$:
                                    559 ; skipping generated iCode
                           000171   560 	C$adc.c$187$1_0$334 ==.
                                    561 ;	../src/adc.c: 187: return chNo;
                                    562 ; genAssign
      008D96 7B 03            [ 1]  563 	ld	a, (0x03, sp)
                                    564 ; genReturn
                                    565 ; genLabel
      008D98                        566 00106$:
                           000173   567 	C$adc.c$188$1_0$334 ==.
                                    568 ;	../src/adc.c: 188: }
                                    569 ; genEndFunction
      008D98 5B 04            [ 2]  570 	addw	sp, #4
                           000175   571 	C$adc.c$188$1_0$334 ==.
                           000175   572 	XFadc$GetChannelNo$0$0 ==.
      008D9A 81               [ 4]  573 	ret
                           000176   574 	G$adcIsr$0$0 ==.
                           000176   575 	C$adc.c$246$1_0$339 ==.
                                    576 ;	../src/adc.c: 246: void adcIsr (void)
                                    577 ; genLabel
                                    578 ;	-----------------------------------------
                                    579 ;	 function adcIsr
                                    580 ;	-----------------------------------------
                                    581 ;	Register assignment might be sub-optimal.
                                    582 ;	Stack space usage: 1 bytes.
      008D9B                        583 _adcIsr:
      008D9B 88               [ 1]  584 	push	a
                           000177   585 	C$adc.c$250$1_0$339 ==.
                                    586 ;	../src/adc.c: 250: currChannel = NextChannel();
                                    587 ; genCall
      008D9C CD 8D 1F         [ 4]  588 	call	_NextChannel
                                    589 ; genAssign
      008D9F 6B 01            [ 1]  590 	ld	(0x01, sp), a
                           00017C   591 	C$adc.c$251$1_0$339 ==.
                                    592 ;	../src/adc.c: 251: if(loggerCfg.isFullResultion){
                                    593 ; skipping iCode since result will be rematerialized
                                    594 ; genPointerGet
      008DA1 C6 00 1C         [ 1]  595 	ld	a, _loggerCfg+14
                                    596 ; genIfx
      008DA4 4D               [ 1]  597 	tnz	a
      008DA5 26 03            [ 1]  598 	jrne	00110$
      008DA7 CC 8D B4         [ 2]  599 	jp	00102$
      008DAA                        600 00110$:
                           000185   601 	C$adc.c$252$2_0$340 ==.
                                    602 ;	../src/adc.c: 252: *pCurrByte = ADC1->DRL;
                                    603 ; genAssign
      008DAA CE 02 5E         [ 2]  604 	ldw	x, _pCurrByte+0
                                    605 ; genPointerGet
      008DAD C6 54 05         [ 1]  606 	ld	a, 0x5405
                                    607 ; genPointerSet
      008DB0 F7               [ 1]  608 	ld	(x), a
                           00018C   609 	C$adc.c$253$2_0$340 ==.
                                    610 ;	../src/adc.c: 253: NextByte();
                                    611 ; genCall
      008DB1 CD 8C BF         [ 4]  612 	call	_NextByte
                                    613 ; genLabel
      008DB4                        614 00102$:
                           00018F   615 	C$adc.c$255$1_0$339 ==.
                                    616 ;	../src/adc.c: 255: *pCurrByte = ADC1->DRH;
                                    617 ; genAssign
      008DB4 CE 02 5E         [ 2]  618 	ldw	x, _pCurrByte+0
                                    619 ; genPointerGet
      008DB7 C6 54 04         [ 1]  620 	ld	a, 0x5404
                                    621 ; genPointerSet
      008DBA F7               [ 1]  622 	ld	(x), a
                           000196   623 	C$adc.c$256$1_0$339 ==.
                                    624 ;	../src/adc.c: 256: NextByte();
                                    625 ; genCall
      008DBB CD 8C BF         [ 4]  626 	call	_NextByte
                           000199   627 	C$adc.c$260$1_0$339 ==.
                                    628 ;	../src/adc.c: 260: ADC1->CSR = (currChannel|ADC1_CSR_EOCIE);
                                    629 ; genOr
      008DBE 7B 01            [ 1]  630 	ld	a, (0x01, sp)
      008DC0 AA 20            [ 1]  631 	or	a, #0x20
                                    632 ; genPointerSet
      008DC2 C7 54 00         [ 1]  633 	ld	0x5400, a
                                    634 ; genLabel
      008DC5                        635 00103$:
                           0001A0   636 	C$adc.c$262$1_0$339 ==.
                                    637 ;	../src/adc.c: 262: }
                                    638 ; genEndFunction
      008DC5 84               [ 1]  639 	pop	a
                           0001A1   640 	C$adc.c$262$1_0$339 ==.
                           0001A1   641 	XG$adcIsr$0$0 ==.
      008DC6 81               [ 4]  642 	ret
                                    643 	.area CODE
                                    644 	.area CONST
                                    645 	.area INITIALIZER
                                    646 	.area CABS (ABS)
