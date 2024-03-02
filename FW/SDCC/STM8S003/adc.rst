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
      000001                         20 _buffer_rdy::
      000001                         21 	.ds 1
      000002                         22 _adcBuffer0::
      000002                         23 	.ds 256
      000102                         24 _adcBuffer1::
      000102                         25 	.ds 256
      000202                         26 _cnter:
      000202                         27 	.ds 2
      000204                         28 _pCurrBuffer:
      000204                         29 	.ds 2
      000206                         30 _pCurrByte:
      000206                         31 	.ds 2
      000208                         32 _NextChannel_cntForChannel_65536_329:
      000208                         33 	.ds 1
                                     34 ;--------------------------------------------------------
                                     35 ; ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area INITIALIZED
                                     38 ;--------------------------------------------------------
                                     39 ; absolute external ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area DABS (ABS)
                                     42 
                                     43 ; default segment ordering for linker
                                     44 	.area HOME
                                     45 	.area GSINIT
                                     46 	.area GSFINAL
                                     47 	.area CONST
                                     48 	.area INITIALIZER
                                     49 	.area CODE
                                     50 
                                     51 ;--------------------------------------------------------
                                     52 ; global & static initialisations
                                     53 ;--------------------------------------------------------
                                     54 	.area HOME
                                     55 	.area GSINIT
                                     56 	.area GSFINAL
                                     57 	.area GSINIT
                                     58 ;	../src/adc.c: 157: static uint8_t cntForChannel = 8;
      00806F 35 08 02 08      [ 1]   59 	mov	_NextChannel_cntForChannel_65536_329+0, #0x08
                                     60 ;--------------------------------------------------------
                                     61 ; Home
                                     62 ;--------------------------------------------------------
                                     63 	.area HOME
                                     64 	.area HOME
                                     65 ;--------------------------------------------------------
                                     66 ; code
                                     67 ;--------------------------------------------------------
                                     68 	.area CODE
                                     69 ;	../src/adc.c: 65: static void tim1Init( void )
                                     70 ;	-----------------------------------------
                                     71 ;	 function tim1Init
                                     72 ;	-----------------------------------------
      00810D                         73 _tim1Init:
      00810D 52 04            [ 2]   74 	sub	sp, #4
                                     75 ;	../src/adc.c: 69: TIM1->CR1 = (TIM1_CR1_ARPE|TIM1_CR1_URS);
      00810F 35 84 52 50      [ 1]   76 	mov	0x5250+0, #0x84
                                     77 ;	../src/adc.c: 70: TIM1->CR2 = 0x20;
      008113 35 20 52 51      [ 1]   78 	mov	0x5251+0, #0x20
                                     79 ;	../src/adc.c: 74: period = ((((uint32_t)INPUT_FREQ_TIM1_FOR_ADC)/loggerCfg.sampFreq)/GetChannelNo());
      008117 CE 02 52         [ 2]   80 	ldw	x, _loggerCfg+0
      00811A 90 5F            [ 1]   81 	clrw	y
      00811C 89               [ 2]   82 	pushw	x
      00811D 90 89            [ 2]   83 	pushw	y
      00811F 4B 00            [ 1]   84 	push	#0x00
      008121 4B 24            [ 1]   85 	push	#0x24
      008123 4B F4            [ 1]   86 	push	#0xf4
      008125 4B 00            [ 1]   87 	push	#0x00
      008127 CD 9C 36         [ 4]   88 	call	__divulong
      00812A 5B 08            [ 2]   89 	addw	sp, #8
      00812C 1F 03            [ 2]   90 	ldw	(0x03, sp), x
      00812E 17 01            [ 2]   91 	ldw	(0x01, sp), y
      008130 CD 82 19         [ 4]   92 	call	_GetChannelNo
      008133 5F               [ 1]   93 	clrw	x
      008134 97               [ 1]   94 	ld	xl, a
      008135 90 5F            [ 1]   95 	clrw	y
      008137 89               [ 2]   96 	pushw	x
      008138 90 89            [ 2]   97 	pushw	y
      00813A 1E 07            [ 2]   98 	ldw	x, (0x07, sp)
      00813C 89               [ 2]   99 	pushw	x
      00813D 1E 07            [ 2]  100 	ldw	x, (0x07, sp)
      00813F 89               [ 2]  101 	pushw	x
      008140 CD 9C 36         [ 4]  102 	call	__divulong
      008143 5B 08            [ 2]  103 	addw	sp, #8
                                    104 ;	../src/adc.c: 75: TIM1->ARRH = (uint8_t)((period&0xff00)>>8);
      008145 1F 03            [ 2]  105 	ldw	(0x03, sp), x
      008147 4F               [ 1]  106 	clr	a
      008148 02               [ 1]  107 	rlwa	x
      008149 C7 52 62         [ 1]  108 	ld	0x5262, a
                                    109 ;	../src/adc.c: 76: TIM1->ARRL = (uint8_t)(period&0xff);
      00814C 7B 04            [ 1]  110 	ld	a, (0x04, sp)
      00814E C7 52 63         [ 1]  111 	ld	0x5263, a
                                    112 ;	../src/adc.c: 77: TIM1->EGR |= TIM1_EGR_UG;
      008151 72 10 52 57      [ 1]  113 	bset	21079, #0
                                    114 ;	../src/adc.c: 78: TIM1->CR1 |= TIM1_CR1_CEN;
      008155 72 10 52 50      [ 1]  115 	bset	21072, #0
                                    116 ;	../src/adc.c: 79: }
      008159 5B 04            [ 2]  117 	addw	sp, #4
      00815B 81               [ 4]  118 	ret
                                    119 ;	../src/adc.c: 90: void adcInit( void )
                                    120 ;	-----------------------------------------
                                    121 ;	 function adcInit
                                    122 ;	-----------------------------------------
      00815C                        123 _adcInit:
                                    124 ;	../src/adc.c: 92: cnter = 0x00;
      00815C 5F               [ 1]  125 	clrw	x
      00815D CF 02 02         [ 2]  126 	ldw	_cnter+0, x
                                    127 ;	../src/adc.c: 93: pCurrBuffer = (uint8_t *)adcBuffer0;
      008160 AE 00 02         [ 2]  128 	ldw	x, #(_adcBuffer0+0)
      008163 CF 02 04         [ 2]  129 	ldw	_pCurrBuffer+0, x
                                    130 ;	../src/adc.c: 94: pCurrByte = (uint8_t *)adcBuffer0;
      008166 AE 00 02         [ 2]  131 	ldw	x, #(_adcBuffer0+0)
      008169 CF 02 06         [ 2]  132 	ldw	_pCurrByte+0, x
                                    133 ;	../src/adc.c: 95: buffer_rdy = 0x00; //nenhum buffers are ready
      00816C 72 5F 00 01      [ 1]  134 	clr	_buffer_rdy+0
                                    135 ;	../src/adc.c: 97: ADC1->CR1 = 0x20;
      008170 35 20 54 01      [ 1]  136 	mov	0x5401+0, #0x20
                                    137 ;	../src/adc.c: 100: ADC1->CSR = NextChannel()|ADC1_CSR_EOCIE;
      008174 CD 81 E3         [ 4]  138 	call	_NextChannel
      008177 AA 20            [ 1]  139 	or	a, #0x20
      008179 C7 54 00         [ 1]  140 	ld	0x5400, a
                                    141 ;	../src/adc.c: 102: ADC1->CR2 = (loggerCfg.isFullResultion<<3)|ADC1_CR2_EXTTRIG;//(ADC1_CR2_EXTTRIG | ADC1_CR2_ALIGN);
      00817C C6 02 60         [ 1]  142 	ld	a, _loggerCfg+14
      00817F 48               [ 1]  143 	sll	a
      008180 48               [ 1]  144 	sll	a
      008181 48               [ 1]  145 	sll	a
      008182 AA 40            [ 1]  146 	or	a, #0x40
      008184 C7 54 02         [ 1]  147 	ld	0x5402, a
                                    148 ;	../src/adc.c: 104: ADC1->CR3 = ADC1_CR3_DBUF;
      008187 35 80 54 03      [ 1]  149 	mov	0x5403+0, #0x80
                                    150 ;	../src/adc.c: 106: ADC1->TDRL = 0x1f;
      00818B 35 1F 54 07      [ 1]  151 	mov	0x5407+0, #0x1f
                                    152 ;	../src/adc.c: 108: ADC1->CR1 |= ADC1_CR1_ADON;
      00818F C6 54 01         [ 1]  153 	ld	a, 0x5401
      008192 AA 01            [ 1]  154 	or	a, #0x01
      008194 C7 54 01         [ 1]  155 	ld	0x5401, a
                                    156 ;	../src/adc.c: 110: tim1Init();
                                    157 ;	../src/adc.c: 111: }
      008197 CC 81 0D         [ 2]  158 	jp	_tim1Init
                                    159 ;	../src/adc.c: 124: static void NextByte()
                                    160 ;	-----------------------------------------
                                    161 ;	 function NextByte
                                    162 ;	-----------------------------------------
      00819A                        163 _NextByte:
                                    164 ;	../src/adc.c: 126: INC(cnter);
      00819A CE 02 02         [ 2]  165 	ldw	x, _cnter+0
      00819D A3 00 FF         [ 2]  166 	cpw	x, #0x00ff
      0081A0 26 03            [ 1]  167 	jrne	00109$
      0081A2 5F               [ 1]  168 	clrw	x
      0081A3 20 04            [ 2]  169 	jra	00110$
      0081A5                        170 00109$:
      0081A5 CE 02 02         [ 2]  171 	ldw	x, _cnter+0
      0081A8 5C               [ 1]  172 	incw	x
      0081A9                        173 00110$:
                                    174 ;	../src/adc.c: 128: if(cnter == 0){ //an overflow occurred
      0081A9 CF 02 02         [ 2]  175 	ldw	_cnter+0, x
      0081AC 26 2A            [ 1]  176 	jrne	00105$
                                    177 ;	../src/adc.c: 130: if(pCurrBuffer == (uint8_t *)adcBuffer0) {
      0081AE AE 00 02         [ 2]  178 	ldw	x, #(_adcBuffer0+0)
      0081B1 C3 02 04         [ 2]  179 	cpw	x, _pCurrBuffer+0
      0081B4 26 11            [ 1]  180 	jrne	00102$
                                    181 ;	../src/adc.c: 131: RELEASE_BUFF_FOR_RD(0);
      0081B6 72 10 00 01      [ 1]  182 	bset	_buffer_rdy+0, #0
                                    183 ;	../src/adc.c: 132: pCurrBuffer = (uint8_t *)adcBuffer1;
      0081BA AE 01 02         [ 2]  184 	ldw	x, #(_adcBuffer1+0)
      0081BD CF 02 04         [ 2]  185 	ldw	_pCurrBuffer+0, x
                                    186 ;	../src/adc.c: 133: pCurrByte = (uint8_t *)adcBuffer1;
      0081C0 AE 01 02         [ 2]  187 	ldw	x, #(_adcBuffer1+0)
      0081C3 CF 02 06         [ 2]  188 	ldw	_pCurrByte+0, x
      0081C6 81               [ 4]  189 	ret
      0081C7                        190 00102$:
                                    191 ;	../src/adc.c: 135: RELEASE_BUFF_FOR_RD(1);
      0081C7 72 12 00 01      [ 1]  192 	bset	_buffer_rdy+0, #1
                                    193 ;	../src/adc.c: 136: pCurrBuffer = (uint8_t *)adcBuffer0;
      0081CB AE 00 02         [ 2]  194 	ldw	x, #(_adcBuffer0+0)
      0081CE CF 02 04         [ 2]  195 	ldw	_pCurrBuffer+0, x
                                    196 ;	../src/adc.c: 137: pCurrByte =  (uint8_t *)adcBuffer0;
      0081D1 AE 00 02         [ 2]  197 	ldw	x, #(_adcBuffer0+0)
      0081D4 CF 02 06         [ 2]  198 	ldw	_pCurrByte+0, x
      0081D7 81               [ 4]  199 	ret
      0081D8                        200 00105$:
                                    201 ;	../src/adc.c: 140: pCurrByte = &pCurrBuffer[cnter];
      0081D8 CE 02 04         [ 2]  202 	ldw	x, _pCurrBuffer+0
      0081DB 72 BB 02 02      [ 2]  203 	addw	x, _cnter+0
      0081DF CF 02 06         [ 2]  204 	ldw	_pCurrByte+0, x
                                    205 ;	../src/adc.c: 142: }
      0081E2 81               [ 4]  206 	ret
                                    207 ;	../src/adc.c: 156: static uint8_t NextChannel(void){
                                    208 ;	-----------------------------------------
                                    209 ;	 function NextChannel
                                    210 ;	-----------------------------------------
      0081E3                        211 _NextChannel:
      0081E3 89               [ 2]  212 	pushw	x
      0081E4                        213 00104$:
                                    214 ;	../src/adc.c: 160: cntForChannel = ((8==cntForChannel)?0:(cntForChannel+1));
      0081E4 C6 02 08         [ 1]  215 	ld	a, _NextChannel_cntForChannel_65536_329+0
      0081E7 A1 08            [ 1]  216 	cp	a, #0x08
      0081E9 26 03            [ 1]  217 	jrne	00108$
      0081EB 4F               [ 1]  218 	clr	a
      0081EC 20 0A            [ 2]  219 	jra	00109$
      0081EE                        220 00108$:
      0081EE C6 02 08         [ 1]  221 	ld	a, _NextChannel_cntForChannel_65536_329+0
      0081F1 4C               [ 1]  222 	inc	a
      0081F2 88               [ 1]  223 	push	a
      0081F3 49               [ 1]  224 	rlc	a
      0081F4 4F               [ 1]  225 	clr	a
      0081F5 A2 00            [ 1]  226 	sbc	a, #0x00
      0081F7 84               [ 1]  227 	pop	a
      0081F8                        228 00109$:
                                    229 ;	../src/adc.c: 161: if((0x01 << cntForChannel) & loggerCfg.channel){
      0081F8 C7 02 08         [ 1]  230 	ld	_NextChannel_cntForChannel_65536_329+0, a
      0081FB 5F               [ 1]  231 	clrw	x
      0081FC 5C               [ 1]  232 	incw	x
      0081FD 4D               [ 1]  233 	tnz	a
      0081FE 27 04            [ 1]  234 	jreq	00129$
      008200                        235 00128$:
      008200 58               [ 2]  236 	sllw	x
      008201 4A               [ 1]  237 	dec	a
      008202 26 FC            [ 1]  238 	jrne	00128$
      008204                        239 00129$:
      008204 C6 02 5F         [ 1]  240 	ld	a, _loggerCfg+13
      008207 0F 01            [ 1]  241 	clr	(0x01, sp)
      008209 89               [ 2]  242 	pushw	x
      00820A 14 02            [ 1]  243 	and	a, (2, sp)
      00820C 85               [ 2]  244 	popw	x
      00820D 02               [ 1]  245 	rlwa	x
      00820E 14 01            [ 1]  246 	and	a, (0x01, sp)
      008210 95               [ 1]  247 	ld	xh, a
      008211 5D               [ 2]  248 	tnzw	x
      008212 27 D0            [ 1]  249 	jreq	00104$
                                    250 ;	../src/adc.c: 163: return cntForChannel;
      008214 C6 02 08         [ 1]  251 	ld	a, _NextChannel_cntForChannel_65536_329+0
                                    252 ;	../src/adc.c: 166: }
      008217 85               [ 2]  253 	popw	x
      008218 81               [ 4]  254 	ret
                                    255 ;	../src/adc.c: 179: static uint8_t GetChannelNo(void){
                                    256 ;	-----------------------------------------
                                    257 ;	 function GetChannelNo
                                    258 ;	-----------------------------------------
      008219                        259 _GetChannelNo:
      008219 52 04            [ 2]  260 	sub	sp, #4
                                    261 ;	../src/adc.c: 182: for(cnt = 0; cnt < 8; cnt++){
      00821B 0F 03            [ 1]  262 	clr	(0x03, sp)
      00821D 0F 04            [ 1]  263 	clr	(0x04, sp)
      00821F                        264 00104$:
                                    265 ;	../src/adc.c: 183: if((0x01 << cnt) & loggerCfg.channel){
      00821F 5F               [ 1]  266 	clrw	x
      008220 5C               [ 1]  267 	incw	x
      008221 7B 04            [ 1]  268 	ld	a, (0x04, sp)
      008223 27 04            [ 1]  269 	jreq	00125$
      008225                        270 00124$:
      008225 58               [ 2]  271 	sllw	x
      008226 4A               [ 1]  272 	dec	a
      008227 26 FC            [ 1]  273 	jrne	00124$
      008229                        274 00125$:
      008229 C6 02 5F         [ 1]  275 	ld	a, _loggerCfg+13
      00822C 0F 01            [ 1]  276 	clr	(0x01, sp)
      00822E 89               [ 2]  277 	pushw	x
      00822F 14 02            [ 1]  278 	and	a, (2, sp)
      008231 85               [ 2]  279 	popw	x
      008232 02               [ 1]  280 	rlwa	x
      008233 14 01            [ 1]  281 	and	a, (0x01, sp)
      008235 95               [ 1]  282 	ld	xh, a
      008236 5D               [ 2]  283 	tnzw	x
      008237 27 02            [ 1]  284 	jreq	00105$
                                    285 ;	../src/adc.c: 184: chNo++;
      008239 0C 03            [ 1]  286 	inc	(0x03, sp)
      00823B                        287 00105$:
                                    288 ;	../src/adc.c: 182: for(cnt = 0; cnt < 8; cnt++){
      00823B 0C 04            [ 1]  289 	inc	(0x04, sp)
      00823D 7B 04            [ 1]  290 	ld	a, (0x04, sp)
      00823F A1 08            [ 1]  291 	cp	a, #0x08
      008241 25 DC            [ 1]  292 	jrc	00104$
                                    293 ;	../src/adc.c: 187: return chNo;
      008243 7B 03            [ 1]  294 	ld	a, (0x03, sp)
                                    295 ;	../src/adc.c: 188: }
      008245 5B 04            [ 2]  296 	addw	sp, #4
      008247 81               [ 4]  297 	ret
                                    298 ;	../src/adc.c: 246: void adcIsr (void)
                                    299 ;	-----------------------------------------
                                    300 ;	 function adcIsr
                                    301 ;	-----------------------------------------
      008248                        302 _adcIsr:
      008248 88               [ 1]  303 	push	a
                                    304 ;	../src/adc.c: 250: currChannel = NextChannel();
      008249 CD 81 E3         [ 4]  305 	call	_NextChannel
      00824C 6B 01            [ 1]  306 	ld	(0x01, sp), a
                                    307 ;	../src/adc.c: 251: if(loggerCfg.isFullResultion){
      00824E C6 02 60         [ 1]  308 	ld	a, _loggerCfg+14
      008251 27 0A            [ 1]  309 	jreq	00102$
                                    310 ;	../src/adc.c: 252: *pCurrByte = ADC1->DRL;
      008253 CE 02 06         [ 2]  311 	ldw	x, _pCurrByte+0
      008256 C6 54 05         [ 1]  312 	ld	a, 0x5405
      008259 F7               [ 1]  313 	ld	(x), a
                                    314 ;	../src/adc.c: 253: NextByte();
      00825A CD 81 9A         [ 4]  315 	call	_NextByte
      00825D                        316 00102$:
                                    317 ;	../src/adc.c: 255: *pCurrByte = ADC1->DRH;
      00825D CE 02 06         [ 2]  318 	ldw	x, _pCurrByte+0
      008260 C6 54 04         [ 1]  319 	ld	a, 0x5404
      008263 F7               [ 1]  320 	ld	(x), a
                                    321 ;	../src/adc.c: 256: NextByte();
      008264 CD 81 9A         [ 4]  322 	call	_NextByte
                                    323 ;	../src/adc.c: 260: ADC1->CSR = (currChannel|ADC1_CSR_EOCIE);
      008267 7B 01            [ 1]  324 	ld	a, (0x01, sp)
      008269 AA 20            [ 1]  325 	or	a, #0x20
      00826B C7 54 00         [ 1]  326 	ld	0x5400, a
                                    327 ;	../src/adc.c: 262: }
      00826E 84               [ 1]  328 	pop	a
      00826F 81               [ 4]  329 	ret
                                    330 	.area CODE
                                    331 	.area CONST
                                    332 	.area INITIALIZER
                                    333 	.area CABS (ABS)
