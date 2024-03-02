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
_buffer_rdy::
	.ds 1
_adcBuffer0::
	.ds 256
_adcBuffer1::
	.ds 256
_cnter:
	.ds 2
_pCurrBuffer:
	.ds 2
_pCurrByte:
	.ds 2
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
;	../src/adc.c: 157: static uint8_t cntForChannel = 8;
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
;	../src/adc.c: 65: static void tim1Init( void )
;	-----------------------------------------
;	 function tim1Init
;	-----------------------------------------
_tim1Init:
	sub	sp, #4
;	../src/adc.c: 69: TIM1->CR1 = (TIM1_CR1_ARPE|TIM1_CR1_URS);
	mov	0x5250+0, #0x84
;	../src/adc.c: 70: TIM1->CR2 = 0x20;
	mov	0x5251+0, #0x20
;	../src/adc.c: 74: period = ((((uint32_t)INPUT_FREQ_TIM1_FOR_ADC)/loggerCfg.sampFreq)/GetChannelNo());
	ldw	x, _loggerCfg+0
	clrw	y
	pushw	x
	pushw	y
	push	#0x00
	push	#0x24
	push	#0xf4
	push	#0x00
	call	__divulong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
	call	_GetChannelNo
	clrw	x
	ld	xl, a
	clrw	y
	pushw	x
	pushw	y
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
;	../src/adc.c: 75: TIM1->ARRH = (uint8_t)((period&0xff00)>>8);
	ldw	(0x03, sp), x
	clr	a
	rlwa	x
	ld	0x5262, a
;	../src/adc.c: 76: TIM1->ARRL = (uint8_t)(period&0xff);
	ld	a, (0x04, sp)
	ld	0x5263, a
;	../src/adc.c: 77: TIM1->EGR |= TIM1_EGR_UG;
	bset	21079, #0
;	../src/adc.c: 78: TIM1->CR1 |= TIM1_CR1_CEN;
	bset	21072, #0
;	../src/adc.c: 79: }
	addw	sp, #4
	ret
;	../src/adc.c: 90: void adcInit( void )
;	-----------------------------------------
;	 function adcInit
;	-----------------------------------------
_adcInit:
;	../src/adc.c: 92: cnter = 0x00;
	clrw	x
	ldw	_cnter+0, x
;	../src/adc.c: 93: pCurrBuffer = (uint8_t *)adcBuffer0;
	ldw	x, #(_adcBuffer0+0)
	ldw	_pCurrBuffer+0, x
;	../src/adc.c: 94: pCurrByte = (uint8_t *)adcBuffer0;
	ldw	x, #(_adcBuffer0+0)
	ldw	_pCurrByte+0, x
;	../src/adc.c: 95: buffer_rdy = 0x00; //nenhum buffers are ready
	clr	_buffer_rdy+0
;	../src/adc.c: 97: ADC1->CR1 = 0x20;
	mov	0x5401+0, #0x20
;	../src/adc.c: 100: ADC1->CSR = NextChannel()|ADC1_CSR_EOCIE;
	call	_NextChannel
	or	a, #0x20
	ld	0x5400, a
;	../src/adc.c: 102: ADC1->CR2 = (loggerCfg.isFullResultion<<3)|ADC1_CR2_EXTTRIG;//(ADC1_CR2_EXTTRIG | ADC1_CR2_ALIGN);
	ld	a, _loggerCfg+14
	sll	a
	sll	a
	sll	a
	or	a, #0x40
	ld	0x5402, a
;	../src/adc.c: 104: ADC1->CR3 = ADC1_CR3_DBUF;
	mov	0x5403+0, #0x80
;	../src/adc.c: 106: ADC1->TDRL = 0x1f;
	mov	0x5407+0, #0x1f
;	../src/adc.c: 108: ADC1->CR1 |= ADC1_CR1_ADON;
	ld	a, 0x5401
	or	a, #0x01
	ld	0x5401, a
;	../src/adc.c: 110: tim1Init();
;	../src/adc.c: 111: }
	jp	_tim1Init
;	../src/adc.c: 124: static void NextByte()
;	-----------------------------------------
;	 function NextByte
;	-----------------------------------------
_NextByte:
;	../src/adc.c: 126: INC(cnter);
	ldw	x, _cnter+0
	cpw	x, #0x00ff
	jrne	00109$
	clrw	x
	jra	00110$
00109$:
	ldw	x, _cnter+0
	incw	x
00110$:
;	../src/adc.c: 128: if(cnter == 0){ //an overflow occurred
	ldw	_cnter+0, x
	jrne	00105$
;	../src/adc.c: 130: if(pCurrBuffer == (uint8_t *)adcBuffer0) {
	ldw	x, #(_adcBuffer0+0)
	cpw	x, _pCurrBuffer+0
	jrne	00102$
;	../src/adc.c: 131: RELEASE_BUFF_FOR_RD(0);
	bset	_buffer_rdy+0, #0
;	../src/adc.c: 132: pCurrBuffer = (uint8_t *)adcBuffer1;
	ldw	x, #(_adcBuffer1+0)
	ldw	_pCurrBuffer+0, x
;	../src/adc.c: 133: pCurrByte = (uint8_t *)adcBuffer1;
	ldw	x, #(_adcBuffer1+0)
	ldw	_pCurrByte+0, x
	ret
00102$:
;	../src/adc.c: 135: RELEASE_BUFF_FOR_RD(1);
	bset	_buffer_rdy+0, #1
;	../src/adc.c: 136: pCurrBuffer = (uint8_t *)adcBuffer0;
	ldw	x, #(_adcBuffer0+0)
	ldw	_pCurrBuffer+0, x
;	../src/adc.c: 137: pCurrByte =  (uint8_t *)adcBuffer0;
	ldw	x, #(_adcBuffer0+0)
	ldw	_pCurrByte+0, x
	ret
00105$:
;	../src/adc.c: 140: pCurrByte = &pCurrBuffer[cnter];
	ldw	x, _pCurrBuffer+0
	addw	x, _cnter+0
	ldw	_pCurrByte+0, x
;	../src/adc.c: 142: }
	ret
;	../src/adc.c: 156: static uint8_t NextChannel(void){
;	-----------------------------------------
;	 function NextChannel
;	-----------------------------------------
_NextChannel:
	pushw	x
00104$:
;	../src/adc.c: 160: cntForChannel = ((8==cntForChannel)?0:(cntForChannel+1));
	ld	a, _NextChannel_cntForChannel_65536_329+0
	cp	a, #0x08
	jrne	00108$
	clr	a
	jra	00109$
00108$:
	ld	a, _NextChannel_cntForChannel_65536_329+0
	inc	a
	push	a
	rlc	a
	clr	a
	sbc	a, #0x00
	pop	a
00109$:
;	../src/adc.c: 161: if((0x01 << cntForChannel) & loggerCfg.channel){
	ld	_NextChannel_cntForChannel_65536_329+0, a
	clrw	x
	incw	x
	tnz	a
	jreq	00129$
00128$:
	sllw	x
	dec	a
	jrne	00128$
00129$:
	ld	a, _loggerCfg+13
	clr	(0x01, sp)
	pushw	x
	and	a, (2, sp)
	popw	x
	rlwa	x
	and	a, (0x01, sp)
	ld	xh, a
	tnzw	x
	jreq	00104$
;	../src/adc.c: 163: return cntForChannel;
	ld	a, _NextChannel_cntForChannel_65536_329+0
;	../src/adc.c: 166: }
	popw	x
	ret
;	../src/adc.c: 179: static uint8_t GetChannelNo(void){
;	-----------------------------------------
;	 function GetChannelNo
;	-----------------------------------------
_GetChannelNo:
	sub	sp, #4
;	../src/adc.c: 182: for(cnt = 0; cnt < 8; cnt++){
	clr	(0x03, sp)
	clr	(0x04, sp)
00104$:
;	../src/adc.c: 183: if((0x01 << cnt) & loggerCfg.channel){
	clrw	x
	incw	x
	ld	a, (0x04, sp)
	jreq	00125$
00124$:
	sllw	x
	dec	a
	jrne	00124$
00125$:
	ld	a, _loggerCfg+13
	clr	(0x01, sp)
	pushw	x
	and	a, (2, sp)
	popw	x
	rlwa	x
	and	a, (0x01, sp)
	ld	xh, a
	tnzw	x
	jreq	00105$
;	../src/adc.c: 184: chNo++;
	inc	(0x03, sp)
00105$:
;	../src/adc.c: 182: for(cnt = 0; cnt < 8; cnt++){
	inc	(0x04, sp)
	ld	a, (0x04, sp)
	cp	a, #0x08
	jrc	00104$
;	../src/adc.c: 187: return chNo;
	ld	a, (0x03, sp)
;	../src/adc.c: 188: }
	addw	sp, #4
	ret
;	../src/adc.c: 246: void adcIsr (void)
;	-----------------------------------------
;	 function adcIsr
;	-----------------------------------------
_adcIsr:
	push	a
;	../src/adc.c: 250: currChannel = NextChannel();
	call	_NextChannel
	ld	(0x01, sp), a
;	../src/adc.c: 251: if(loggerCfg.isFullResultion){
	ld	a, _loggerCfg+14
	jreq	00102$
;	../src/adc.c: 252: *pCurrByte = ADC1->DRL;
	ldw	x, _pCurrByte+0
	ld	a, 0x5405
	ld	(x), a
;	../src/adc.c: 253: NextByte();
	call	_NextByte
00102$:
;	../src/adc.c: 255: *pCurrByte = ADC1->DRH;
	ldw	x, _pCurrByte+0
	ld	a, 0x5404
	ld	(x), a
;	../src/adc.c: 256: NextByte();
	call	_NextByte
;	../src/adc.c: 260: ADC1->CSR = (currChannel|ADC1_CSR_EOCIE);
	ld	a, (0x01, sp)
	or	a, #0x20
	ld	0x5400, a
;	../src/adc.c: 262: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
