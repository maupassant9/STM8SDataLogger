;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Linux)
;--------------------------------------------------------
	.module adc
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _adcBuffer1
	.globl _adcBuffer0
	.globl _buffer_rdy
	.globl _adcInit
	.globl _adcIsr
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
G$buffer_rdy$0_0$0==.
_buffer_rdy::
	.ds 1
G$adcBuffer0$0_0$0==.
_adcBuffer0::
	.ds 256
G$adcBuffer1$0_0$0==.
_adcBuffer1::
	.ds 256
Fadc$cnter$0_0$0==.
_cnter:
	.ds 2
Fadc$pCurrBuffer$0_0$0==.
_pCurrBuffer:
	.ds 2
Fadc$pCurrByte$0_0$0==.
_pCurrByte:
	.ds 2
Ladc.NextChannel$cntForChannel$1_0$329==.
_NextChannel_cntForChannel_65536_329:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
	Fadc$NextChannel$0$0 ==.
	C$adc.c$157$2_0$330 ==.
;	../src/adc.c: 157: static uint8_t cntForChannel = 8;
; genAssign
	mov	_NextChannel_cntForChannel_65536_329+0, #0x08
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
	Fadc$tim1Init$0$0 ==.
	C$adc.c$65$0_0$320 ==.
;	../src/adc.c: 65: static void tim1Init( void )
; genLabel
;	-----------------------------------------
;	 function tim1Init
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 4 bytes.
_tim1Init:
	sub	sp, #4
	C$adc.c$69$1_0$320 ==.
;	../src/adc.c: 69: TIM1->CR1 = (TIM1_CR1_ARPE|TIM1_CR1_URS);
; genPointerSet
	mov	0x5250+0, #0x84
	C$adc.c$70$1_0$320 ==.
;	../src/adc.c: 70: TIM1->CR2 = 0x20;
; genPointerSet
	mov	0x5251+0, #0x20
	C$adc.c$74$1_0$320 ==.
;	../src/adc.c: 74: period = ((((uint32_t)INPUT_FREQ_TIM1_FOR_ADC)/loggerCfg.sampFreq)/GetChannelNo());
; skipping iCode since result will be rematerialized
; genPointerGet
	ldw	x, _loggerCfg+0
; genCast
; genAssign
	clrw	y
; genIPush
	pushw	x
	pushw	y
; genIPush
	push	#0x00
	push	#0x24
	push	#0xf4
	push	#0x00
; genCall
	call	__divulong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
; genCall
	call	_GetChannelNo
; genCast
; genAssign
	clrw	x
	ld	xl, a
	clrw	y
; genIPush
	pushw	x
	pushw	y
; genIPush
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
; genCall
	call	__divulong
	addw	sp, #8
; genAssign
	ldw	(0x03, sp), x
	C$adc.c$75$1_0$320 ==.
;	../src/adc.c: 75: TIM1->ARRH = (uint8_t)((period&0xff00)>>8);
; genCast
; genAssign
	ldw	x, (0x03, sp)
; genAnd
	clr	a
	ld	xl, a
	ld	a, xh
; genRightShiftLiteral
	clrw	x
; genCast
; genAssign
; genPointerSet
	ld	0x5262, a
	C$adc.c$76$1_0$320 ==.
;	../src/adc.c: 76: TIM1->ARRL = (uint8_t)(period&0xff);
; genCast
; genAssign
	ld	a, (0x04, sp)
; genPointerSet
	ld	0x5263, a
	C$adc.c$77$1_0$320 ==.
;	../src/adc.c: 77: TIM1->EGR |= TIM1_EGR_UG;
; genPointerGet
	ld	a, 0x5257
; genOr
	or	a, #0x01
; genPointerSet
	ld	0x5257, a
	C$adc.c$78$1_0$320 ==.
;	../src/adc.c: 78: TIM1->CR1 |= TIM1_CR1_CEN;
; genPointerGet
	ld	a, 0x5250
; genOr
	or	a, #0x01
; genPointerSet
	ld	0x5250, a
; genLabel
00101$:
	C$adc.c$79$1_0$320 ==.
;	../src/adc.c: 79: }
; genEndFunction
	addw	sp, #4
	C$adc.c$79$1_0$320 ==.
	XFadc$tim1Init$0$0 ==.
	ret
	G$adcInit$0$0 ==.
	C$adc.c$90$1_0$322 ==.
;	../src/adc.c: 90: void adcInit( void )
; genLabel
;	-----------------------------------------
;	 function adcInit
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_adcInit:
	C$adc.c$92$1_0$322 ==.
;	../src/adc.c: 92: cnter = 0x00;
; genAssign
	clrw	x
	ldw	_cnter+0, x
	C$adc.c$93$1_0$322 ==.
;	../src/adc.c: 93: pCurrBuffer = (uint8_t *)adcBuffer0;
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genAssign
	ldw	x, #(_adcBuffer0+0)
	ldw	_pCurrBuffer+0, x
	C$adc.c$94$1_0$322 ==.
;	../src/adc.c: 94: pCurrByte = (uint8_t *)adcBuffer0;
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genAssign
	ldw	x, #(_adcBuffer0+0)
	ldw	_pCurrByte+0, x
	C$adc.c$95$1_0$322 ==.
;	../src/adc.c: 95: buffer_rdy = 0x00; //nenhum buffers are ready
; genAssign
	clr	_buffer_rdy+0
	C$adc.c$97$1_0$322 ==.
;	../src/adc.c: 97: ADC1->CR1 = 0x20;
; genPointerSet
	mov	0x5401+0, #0x20
	C$adc.c$100$1_0$322 ==.
;	../src/adc.c: 100: ADC1->CSR = NextChannel()|ADC1_CSR_EOCIE;
; genCall
	call	_NextChannel
; genOr
	or	a, #0x20
; genPointerSet
	ld	0x5400, a
	C$adc.c$102$1_0$322 ==.
;	../src/adc.c: 102: ADC1->CR2 = (loggerCfg.isFullResultion<<3)|ADC1_CR2_EXTTRIG;//(ADC1_CR2_EXTTRIG | ADC1_CR2_ALIGN);
; skipping iCode since result will be rematerialized
; genPointerGet
	ld	a, _loggerCfg+14
; genCast
; genAssign
; genLeftShiftLiteral
	sll	a
	sll	a
	sll	a
; genOr
	or	a, #0x40
; genPointerSet
	ld	0x5402, a
	C$adc.c$104$1_0$322 ==.
;	../src/adc.c: 104: ADC1->CR3 = ADC1_CR3_DBUF;
; genPointerSet
	mov	0x5403+0, #0x80
	C$adc.c$106$1_0$322 ==.
;	../src/adc.c: 106: ADC1->TDRL = 0x1f;
; genPointerSet
	mov	0x5407+0, #0x1f
	C$adc.c$108$1_0$322 ==.
;	../src/adc.c: 108: ADC1->CR1 |= ADC1_CR1_ADON;
; genPointerGet
	ld	a, 0x5401
; genOr
	or	a, #0x01
; genPointerSet
	ld	0x5401, a
	C$adc.c$110$1_0$322 ==.
;	../src/adc.c: 110: tim1Init();
; genCall
	jp	_tim1Init
; genLabel
00101$:
	C$adc.c$111$1_0$322 ==.
;	../src/adc.c: 111: }
; genEndFunction
	C$adc.c$111$1_0$322 ==.
	XG$adcInit$0$0 ==.
	ret
	Fadc$NextByte$0$0 ==.
	C$adc.c$124$1_0$323 ==.
;	../src/adc.c: 124: static void NextByte()
; genLabel
;	-----------------------------------------
;	 function NextByte
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_NextByte:
	C$adc.c$126$1_0$323 ==.
;	../src/adc.c: 126: INC(cnter);
; genCmpEQorNE
	ldw	x, _cnter+0
	cpw	x, #0x00ff
	jrne	00127$
	jp	00128$
00127$:
	jp	00109$
00128$:
; skipping generated iCode
; genAssign
	clrw	x
; genGoto
	jp	00110$
; genLabel
00109$:
; genCast
; genAssign
	ldw	x, _cnter+0
; genPlus
	incw	x
; genAssign
; genLabel
00110$:
; genCast
; genAssign
; genAssign
	ldw	_cnter+0, x
	C$adc.c$128$1_0$323 ==.
;	../src/adc.c: 128: if(cnter == 0){ //an overflow occurred
; genIfx
	ldw	x, _cnter+0
	jreq	00129$
	jp	00105$
00129$:
	C$adc.c$130$2_0$324 ==.
;	../src/adc.c: 130: if(pCurrBuffer == (uint8_t *)adcBuffer0) {
; genAddrOf
	ldw	x, #_adcBuffer0+0
; genCast
; genAssign
; genCast
; genAssign
; genCmpEQorNE
	cpw	x, _pCurrBuffer+0
	jrne	00131$
	jp	00132$
00131$:
	jp	00102$
00132$:
; skipping generated iCode
	C$adc.c$131$3_0$325 ==.
;	../src/adc.c: 131: RELEASE_BUFF_FOR_RD(0);
; genOr
	bset	_buffer_rdy+0, #0
	C$adc.c$132$3_0$325 ==.
;	../src/adc.c: 132: pCurrBuffer = (uint8_t *)adcBuffer1;
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genAssign
	ldw	x, #(_adcBuffer1+0)
	ldw	_pCurrBuffer+0, x
	C$adc.c$133$3_0$325 ==.
;	../src/adc.c: 133: pCurrByte = (uint8_t *)adcBuffer1;
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genAssign
	ldw	x, #(_adcBuffer1+0)
	ldw	_pCurrByte+0, x
; genGoto
	jp	00107$
; genLabel
00102$:
	C$adc.c$135$3_0$326 ==.
;	../src/adc.c: 135: RELEASE_BUFF_FOR_RD(1);
; genOr
	bset	_buffer_rdy+0, #1
	C$adc.c$136$3_0$326 ==.
;	../src/adc.c: 136: pCurrBuffer = (uint8_t *)adcBuffer0;
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genAssign
	ldw	x, #(_adcBuffer0+0)
	ldw	_pCurrBuffer+0, x
	C$adc.c$137$3_0$326 ==.
;	../src/adc.c: 137: pCurrByte =  (uint8_t *)adcBuffer0;
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genAssign
	ldw	x, #(_adcBuffer0+0)
	ldw	_pCurrByte+0, x
; genGoto
	jp	00107$
; genLabel
00105$:
	C$adc.c$140$2_0$327 ==.
;	../src/adc.c: 140: pCurrByte = &pCurrBuffer[cnter];
; genPlus
	ldw	x, _pCurrBuffer+0
	addw	x, _cnter+0
; genAssign
	ldw	_pCurrByte+0, x
; genLabel
00107$:
	C$adc.c$142$1_0$323 ==.
;	../src/adc.c: 142: }
; genEndFunction
	C$adc.c$142$1_0$323 ==.
	XFadc$NextByte$0$0 ==.
	ret
	Fadc$NextChannel$0$0 ==.
	C$adc.c$156$1_0$330 ==.
;	../src/adc.c: 156: static uint8_t NextChannel(void){
; genLabel
;	-----------------------------------------
;	 function NextChannel
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 2 bytes.
_NextChannel:
	pushw	x
; skipping iCode since result will be rematerialized
; genLabel
00104$:
	C$adc.c$160$3_0$331 ==.
;	../src/adc.c: 160: cntForChannel = ((8==cntForChannel)?0:(cntForChannel+1));
; genCmpEQorNE
	ld	a, _NextChannel_cntForChannel_65536_329+0
	cp	a, #0x08
	jrne	00126$
	jp	00127$
00126$:
	jp	00108$
00127$:
; skipping generated iCode
; genAssign
	clr	a
	clrw	x
; genGoto
	jp	00109$
; genLabel
00108$:
; genCast
; genAssign
	ld	a, _NextChannel_cntForChannel_65536_329+0
; genPlus
	inc	a
; genCast
	push	a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xl, a
	pop	a
; genAssign
; genLabel
00109$:
; genCast
; genAssign
	ld	_NextChannel_cntForChannel_65536_329+0, a
	C$adc.c$161$3_0$331 ==.
;	../src/adc.c: 161: if((0x01 << cntForChannel) & loggerCfg.channel){
; genAssign
	ld	a, _NextChannel_cntForChannel_65536_329+0
; genLeftShift
	clrw	x
	incw	x
	tnz	a
	jreq	00129$
00128$:
	sllw	x
	dec	a
	jrne	00128$
00129$:
; genPointerGet
	ld	a, _loggerCfg+13
; genCast
; genAssign
	clr	(0x01, sp)
; genAnd
	pushw	x
	and	a, (2, sp)
	popw	x
	ld	xl, a
	ld	a, xh
	and	a, (0x01, sp)
	ld	xh, a
; genIfx
	tnzw	x
	jrne	00130$
	jp	00104$
00130$:
	C$adc.c$163$4_0$332 ==.
;	../src/adc.c: 163: return cntForChannel;
; genReturn
	ld	a, _NextChannel_cntForChannel_65536_329+0
; genLabel
00106$:
	C$adc.c$166$2_0$330 ==.
;	../src/adc.c: 166: }
; genEndFunction
	popw	x
	C$adc.c$166$2_0$330 ==.
	XFadc$NextChannel$0$0 ==.
	ret
	Fadc$GetChannelNo$0$0 ==.
	C$adc.c$179$2_0$334 ==.
;	../src/adc.c: 179: static uint8_t GetChannelNo(void){
; genLabel
;	-----------------------------------------
;	 function GetChannelNo
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 4 bytes.
_GetChannelNo:
	sub	sp, #4
	C$adc.c$180$2_0$334 ==.
;	../src/adc.c: 180: uint8_t cnt, chNo = 0;
; genAssign
	clr	(0x03, sp)
	C$adc.c$182$2_0$335 ==.
;	../src/adc.c: 182: for(cnt = 0; cnt < 8; cnt++){
; genAssign
	clr	(0x04, sp)
; skipping iCode since result will be rematerialized
; genLabel
00104$:
	C$adc.c$183$3_0$336 ==.
;	../src/adc.c: 183: if((0x01 << cnt) & loggerCfg.channel){
; genLeftShift
	clrw	x
	incw	x
	ld	a, (0x04, sp)
	jreq	00125$
00124$:
	sllw	x
	dec	a
	jrne	00124$
00125$:
; genPointerGet
	ld	a, _loggerCfg+13
; genCast
; genAssign
	clr	(0x01, sp)
; genAnd
	pushw	x
	and	a, (2, sp)
	popw	x
	ld	xl, a
	ld	a, xh
	and	a, (0x01, sp)
	ld	xh, a
; genIfx
	tnzw	x
	jrne	00126$
	jp	00105$
00126$:
	C$adc.c$184$4_0$337 ==.
;	../src/adc.c: 184: chNo++;
; genPlus
	inc	(0x03, sp)
; genLabel
00105$:
	C$adc.c$182$2_0$335 ==.
;	../src/adc.c: 182: for(cnt = 0; cnt < 8; cnt++){
; genPlus
	inc	(0x04, sp)
; genCmp
; genCmpTop
	ld	a, (0x04, sp)
	cp	a, #0x08
	jrnc	00127$
	jp	00104$
00127$:
; skipping generated iCode
	C$adc.c$187$1_0$334 ==.
;	../src/adc.c: 187: return chNo;
; genAssign
	ld	a, (0x03, sp)
; genReturn
; genLabel
00106$:
	C$adc.c$188$1_0$334 ==.
;	../src/adc.c: 188: }
; genEndFunction
	addw	sp, #4
	C$adc.c$188$1_0$334 ==.
	XFadc$GetChannelNo$0$0 ==.
	ret
	G$adcIsr$0$0 ==.
	C$adc.c$246$1_0$339 ==.
;	../src/adc.c: 246: void adcIsr (void)
; genLabel
;	-----------------------------------------
;	 function adcIsr
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 1 bytes.
_adcIsr:
	push	a
	C$adc.c$250$1_0$339 ==.
;	../src/adc.c: 250: currChannel = NextChannel();
; genCall
	call	_NextChannel
; genAssign
	ld	(0x01, sp), a
	C$adc.c$251$1_0$339 ==.
;	../src/adc.c: 251: if(loggerCfg.isFullResultion){
; skipping iCode since result will be rematerialized
; genPointerGet
	ld	a, _loggerCfg+14
; genIfx
	tnz	a
	jrne	00110$
	jp	00102$
00110$:
	C$adc.c$252$2_0$340 ==.
;	../src/adc.c: 252: *pCurrByte = ADC1->DRL;
; genAssign
	ldw	x, _pCurrByte+0
; genPointerGet
	ld	a, 0x5405
; genPointerSet
	ld	(x), a
	C$adc.c$253$2_0$340 ==.
;	../src/adc.c: 253: NextByte();
; genCall
	call	_NextByte
; genLabel
00102$:
	C$adc.c$255$1_0$339 ==.
;	../src/adc.c: 255: *pCurrByte = ADC1->DRH;
; genAssign
	ldw	x, _pCurrByte+0
; genPointerGet
	ld	a, 0x5404
; genPointerSet
	ld	(x), a
	C$adc.c$256$1_0$339 ==.
;	../src/adc.c: 256: NextByte();
; genCall
	call	_NextByte
	C$adc.c$260$1_0$339 ==.
;	../src/adc.c: 260: ADC1->CSR = (currChannel|ADC1_CSR_EOCIE);
; genOr
	ld	a, (0x01, sp)
	or	a, #0x20
; genPointerSet
	ld	0x5400, a
; genLabel
00103$:
	C$adc.c$262$1_0$339 ==.
;	../src/adc.c: 262: }
; genEndFunction
	pop	a
	C$adc.c$262$1_0$339 ==.
	XG$adcIsr$0$0 ==.
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
