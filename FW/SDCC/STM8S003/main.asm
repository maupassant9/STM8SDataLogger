;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _SetLedMode
	.globl _LedMatrixInit
	.globl _pf_write
	.globl _dly
	.globl _sysTickInit
	.globl _loggerCfg
	.globl _assert_failed
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_cfg:
	.ds 13
_loggerCfg::
	.ds 15
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_blkCnt:
	.ds 1
_fileBlkCnt:
	.ds 4
_fileNoCnt:
	.ds 2
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

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
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
	int _TRAP_IRQHandler ; trap
	int _TLI_IRQHandler ; int0
	int _AWU_IRQHandler ; int1
	int _CLK_IRQHandler ; int2
	int _EXTI_PORTA_IRQHandler ; int3
	int _EXTI_PORTB_IRQHandler ; int4
	int _EXTI_PORTC_IRQHandler ; int5
	int _EXTI_PORTD_IRQHandler ; int6
	int _EXTI_PORTE_IRQHandler ; int7
	int 0x000000 ; int8
	int 0x000000 ; int9
	int _SPI_IRQHandler ; int10
	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
	int _TIM1_CAP_COM_IRQHandler ; int12
	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
	int _TIM2_CAP_COM_IRQHandler ; int14
	int 0x000000 ; int15
	int 0x000000 ; int16
	int _UART1_TX_IRQHandler ; int17
	int _UART1_RX_IRQHandler ; int18
	int _I2C_IRQHandler ; int19
	int 0x000000 ; int20
	int 0x000000 ; int21
	int _ADC1_IRQHandler ; int22
	int _TIM4_UPD_OVF_IRQHandler ; int23
	int _EEPROM_EEC_IRQHandler ; int24
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	../src/main.c: 99: void main( void )
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #47
;	../src/main.c: 109: clkInit();
	call	_clkInit
;	../src/main.c: 110: LedMatrixInit();
	call	_LedMatrixInit
;	../src/main.c: 111: sysTickInit();
	call	_sysTickInit
;	../src/main.c: 114: enableInterrupts();
	rim
;	../src/main.c: 117: for(i = 0; i < NUM_OF_LEDS; i++){
	clr	(0x2f, sp)
00141$:
;	../src/main.c: 118: SetLedMode(i, LED_ON);
	push	#0x03
	ld	a, (0x30, sp)
	push	a
	call	_SetLedMode
	popw	x
;	../src/main.c: 119: dly(1000);
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
	call	_dly
	addw	sp, #4
;	../src/main.c: 120: SetLedMode(i, LED_OFF);
	push	#0x00
	ld	a, (0x30, sp)
	push	a
	call	_SetLedMode
	popw	x
;	../src/main.c: 121: SetLedMode(i+1, LED_ON);
	ld	a, (0x2f, sp)
	inc	a
	push	#0x03
	push	a
	call	_SetLedMode
	popw	x
;	../src/main.c: 117: for(i = 0; i < NUM_OF_LEDS; i++){
	inc	(0x2f, sp)
	ld	a, (0x2f, sp)
	cp	a, #0x0c
	jrc	00141$
;	../src/main.c: 124: for(i = 0; i < NUM_OF_LEDS; i++){
	clr	(0x2f, sp)
00143$:
;	../src/main.c: 125: SetLedMode(i, (i%2)?LED_TOGGLE_FAST:LED_TOGGLE_SLOW);
	ld	a, (0x2f, sp)
	srl	a
	jrnc	00147$
	ld	a, #0x02
	.byte 0xc5
00147$:
	ld	a, #0x01
00148$:
	push	a
	ld	a, (0x30, sp)
	push	a
	call	_SetLedMode
	popw	x
;	../src/main.c: 126: dly(10000);
	push	#0x10
	push	#0x27
	clrw	x
	pushw	x
	call	_dly
	addw	sp, #4
;	../src/main.c: 124: for(i = 0; i < NUM_OF_LEDS; i++){
	inc	(0x2f, sp)
	ld	a, (0x2f, sp)
	cp	a, #0x0c
	jrc	00143$
;	../src/main.c: 129: while(1);
00104$:
	jra	00104$
;	../src/main.c: 230: }
;	../src/main.c: 232: }
	addw	sp, #47
	ret
;	../src/main.c: 245: static void Wr2SD( fsm_t * pfsm ){
;	-----------------------------------------
;	 function Wr2SD
;	-----------------------------------------
_Wr2SD:
	sub	sp, #6
;	../src/main.c: 252: if( S1_WR_BUF0 == pfsm->state){
	ldw	y, (0x09, sp)
	ldw	(0x03, sp), y
	ldw	x, y
	ld	a, (x)
	dec	a
	jrne	00102$
;	../src/main.c: 253: pBuf = adcBuffer0; bufNo = 0;
	ldw	x, #_adcBuffer0+0
	clr	a
	jra	00103$
00102$:
;	../src/main.c: 255: pBuf = adcBuffer1; bufNo = 1;
	ldw	x, #(_adcBuffer1+0)
	ld	a, #0x01
00103$:
;	../src/main.c: 257: RELEASE_BUFF_FOR_WR(bufNo); //clear this flag
	ld	(0x06, sp), a
	ld	a, #0x01
	push	a
	ld	a, (0x07, sp)
	jreq	00143$
00142$:
	sll	(1, sp)
	dec	a
	jrne	00142$
00143$:
	pop	a
	cpl	a
	and	a, _buffer_rdy+0
	ld	_buffer_rdy+0, a
;	../src/main.c: 260: SetLedMode(0, LED_ON);
	pushw	x
	push	#0x03
	push	#0x00
	call	_SetLedMode
	popw	x
	popw	x
;	../src/main.c: 261: res = pf_write((void*)pBuf,BUFFER_SZ_IN_BYTES, &pbr);
	exgw	x, y
	ldw	x, sp
	incw	x
	pushw	x
	push	#0x00
	push	#0x01
	pushw	y
	call	_pf_write
	addw	sp, #6
;	../src/main.c: 263: SetLedMode(0, LED_OFF);
	push	a
	push	#0x00
	push	#0x00
	call	_SetLedMode
	popw	x
	pop	a
;	../src/main.c: 268: pfsm->error = ERR_WR_DATA;
	ldw	x, (0x03, sp)
	incw	x
	ldw	(0x05, sp), x
;	../src/main.c: 265: if(FR_OK != res){
	tnz	a
	jreq	00105$
;	../src/main.c: 268: pfsm->error = ERR_WR_DATA;
	ldw	x, (0x05, sp)
	ld	a, #0x02
	ld	(x), a
;	../src/main.c: 269: pfsm->state = S4_ERR;
	ldw	x, (0x03, sp)
	ld	a, #0x04
	ld	(x), a
;	../src/main.c: 270: return;
	jra	00112$
00105$:
;	../src/main.c: 273: if(NO_BUFF_PER_BLK == ++blkCnt){
	inc	_blkCnt+0
	ld	a, _blkCnt+0
	cp	a, #0x02
	jrne	00111$
;	../src/main.c: 275: blkCnt = 0;
	clr	_blkCnt+0
;	../src/main.c: 276: res = pf_write(0,0,&pbr);
	ldw	x, sp
	incw	x
	pushw	x
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	call	_pf_write
	addw	sp, #6
;	../src/main.c: 279: if(FR_OK != res){
	tnz	a
	jreq	00107$
;	../src/main.c: 281: pfsm->error = ERR_WR_NO_RESP;
	ldw	x, (0x05, sp)
	ld	a, #0x03
	ld	(x), a
;	../src/main.c: 282: pfsm->state = S4_ERR;
	ldw	x, (0x03, sp)
	ld	a, #0x04
	ld	(x), a
;	../src/main.c: 283: return;
	jra	00112$
00107$:
;	../src/main.c: 286: if(0 == --fileBlkCnt){
	ldw	x, _fileBlkCnt+2
	subw	x, #0x0001
	ldw	y, _fileBlkCnt+0
	jrnc	00149$
	decw	y
00149$:
	ldw	_fileBlkCnt+2, x
	ldw	_fileBlkCnt+0, y
	ldw	x, _fileBlkCnt+2
	jrne	00111$
	ldw	x, _fileBlkCnt+0
	jrne	00111$
;	../src/main.c: 289: pfsm->state = S3_NXT_FILE;
	ldw	x, (0x03, sp)
	ld	a, #0x03
	ld	(x), a
;	../src/main.c: 290: return;
	jra	00112$
00111$:
;	../src/main.c: 295: pfsm->state = S0_RST; 
	ldw	x, (0x03, sp)
	clr	(x)
00112$:
;	../src/main.c: 296: }
	addw	sp, #6
	ret
;	../src/main.c: 309: static void GetNxtFileName( char * fname){
;	-----------------------------------------
;	 function GetNxtFileName
;	-----------------------------------------
_GetNxtFileName:
	sub	sp, #5
;	../src/main.c: 310: uint8_t val = 0;
	clr	(0x01, sp)
;	../src/main.c: 312: if(0x39 == fname[3]){
	ldw	x, (0x08, sp)
	ld	a, (0x3, x)
;	../src/main.c: 313: val = 0x01;
	sub	a, #0x39
	jrne	00102$
	inc	a
	ld	(0x01, sp), a
00102$:
;	../src/main.c: 315: if(0x39 == fname[2]) {
	ldw	x, (0x08, sp)
	ld	a, (0x2, x)
	cp	a, #0x39
	jrne	00104$
;	../src/main.c: 316: val += 0x02;
	ld	a, (0x01, sp)
	add	a, #0x02
	ld	(0x01, sp), a
00104$:
;	../src/main.c: 318: if(0x39 == fname[1]) {
	ldw	x, (0x08, sp)
	ld	a, (0x1, x)
	cp	a, #0x39
	jrne	00106$
;	../src/main.c: 319: val += 0x04;
	ld	a, (0x01, sp)
	add	a, #0x04
	ld	(0x01, sp), a
00106$:
;	../src/main.c: 321: if(0x39 == fname[0]) {
	ldw	y, (0x08, sp)
	ldw	(0x02, sp), y
	ldw	x, y
	ld	a, (x)
	cp	a, #0x39
	jrne	00108$
;	../src/main.c: 322: val += 0x08;
	ld	a, (0x01, sp)
	add	a, #0x08
	ld	(0x01, sp), a
00108$:
;	../src/main.c: 326: case 0x01: fname[3] = 0x30; 
	ldw	x, (0x02, sp)
	addw	x, #0x0003
;	../src/main.c: 327: fname[2]++;break;
	ldw	y, (0x02, sp)
	incw	y
	incw	y
	ldw	(0x04, sp), y
;	../src/main.c: 325: switch(val){
	ld	a, (0x01, sp)
	dec	a
	jreq	00109$
;	../src/main.c: 330: fname[1]++; break;
	ldw	y, (0x02, sp)
	incw	y
;	../src/main.c: 325: switch(val){
	ld	a, (0x01, sp)
	cp	a, #0x03
	jreq	00110$
	ld	a, (0x01, sp)
	cp	a, #0x07
	jreq	00111$
	ld	a, (0x01, sp)
	cp	a, #0x0f
	jreq	00112$
	jra	00113$
;	../src/main.c: 326: case 0x01: fname[3] = 0x30; 
00109$:
	ld	a, #0x30
	ld	(x), a
;	../src/main.c: 327: fname[2]++;break;
	ldw	x, (0x04, sp)
	inc	(x)
	jra	00115$
;	../src/main.c: 328: case 0x03: fname[3] = 0x30; 
00110$:
	ld	a, #0x30
	ld	(x), a
;	../src/main.c: 329: fname[2] = 0x30; 
	ldw	x, (0x04, sp)
	ld	a, #0x30
	ld	(x), a
;	../src/main.c: 330: fname[1]++; break;
	inc	(y)
	jra	00115$
;	../src/main.c: 331: case 0x07: fname[3] = 0x30; 
00111$:
	ld	a, #0x30
	ld	(x), a
;	../src/main.c: 332: fname[2] = 0x30; 
	ldw	x, (0x04, sp)
;	../src/main.c: 333: fname[1] = 0x30; 
	ld	a, #0x30
	ld	(x), a
	ld	(y), a
;	../src/main.c: 334: fname[0]++; break;
	ldw	x, (0x02, sp)
	inc	(x)
	jra	00115$
;	../src/main.c: 335: case 0x0f: fname[3] = 0x30; 
00112$:
	ld	a, #0x30
	ld	(x), a
;	../src/main.c: 336: fname[2] = 0x30; 
	ldw	x, (0x04, sp)
;	../src/main.c: 337: fname[1] = 0x30; 
	ld	a, #0x30
	ld	(x), a
	ld	(y), a
;	../src/main.c: 338: fname[0] = 0x30; break;
	ldw	x, (0x02, sp)
	ld	a, #0x30
	ld	(x), a
	jra	00115$
;	../src/main.c: 339: default: fname[3]++; break;
00113$:
	inc	(x)
;	../src/main.c: 340: }
00115$:
;	../src/main.c: 341: }
	addw	sp, #5
	ret
;	../src/main.c: 354: static void ConvertFileName(uint16_t firstFileName, char * fname){
;	-----------------------------------------
;	 function ConvertFileName
;	-----------------------------------------
_ConvertFileName:
	sub	sp, #4
;	../src/main.c: 357: val = firstFileName/1000;
	ldw	y, (0x07, sp)
	ldw	(0x03, sp), y
	ldw	x, y
	ldw	y, #0x03e8
	divw	x, y
;	../src/main.c: 358: fname[0] = val + 0x30;
	ldw	y, (0x09, sp)
	ldw	(0x01, sp), y
	ld	a, xl
	add	a, #0x30
	ldw	y, (0x01, sp)
	ld	(y), a
;	../src/main.c: 359: firstFileName -=  val*1000;
	pushw	x
	push	#0xe8
	push	#0x03
	call	__mulint
	addw	sp, #4
	negw	x
	addw	x, (0x03, sp)
;	../src/main.c: 360: val = firstFileName/100;
	ldw	(0x07, sp), x
	ldw	(0x03, sp), x
	ldw	y, #0x0064
	divw	x, y
;	../src/main.c: 361: fname[1] = val + 0x30;
	ldw	y, (0x01, sp)
	incw	y
	ld	a, xl
	add	a, #0x30
	ld	(y), a
;	../src/main.c: 362: firstFileName -=  val*100;
	pushw	x
	push	#0x64
	push	#0x00
	call	__mulint
	addw	sp, #4
	negw	x
	addw	x, (0x03, sp)
;	../src/main.c: 363: val = firstFileName/10;
	ldw	(0x07, sp), x
	ldw	(0x03, sp), x
	ldw	y, #0x000a
	divw	x, y
;	../src/main.c: 364: fname[2] = val + 0x30;
	ldw	y, (0x01, sp)
	addw	y, #0x0002
	ld	a, xl
	add	a, #0x30
	ld	(y), a
;	../src/main.c: 365: firstFileName -=  val*10;
	pushw	x
	sllw	x
	sllw	x
	addw	x, (1, sp)
	sllw	x
	addw	sp, #2
	negw	x
	addw	x, (0x03, sp)
	ldw	(0x07, sp), x
;	../src/main.c: 366: fname[3] = firstFileName + 0x30;
	ldw	x, (0x01, sp)
	addw	x, #0x0003
	ld	a, (0x08, sp)
	add	a, #0x30
	ld	(x), a
;	../src/main.c: 367: fname[4] = '\0';
	ldw	x, (0x01, sp)
	clr	(0x0004, x)
;	../src/main.c: 368: }
	addw	sp, #4
	ret
;	../src/main.c: 383: static UINT GetCfg( uint8_t * pCfgBuf,  cfg_t * pcfg){
;	-----------------------------------------
;	 function GetCfg
;	-----------------------------------------
_GetCfg:
	sub	sp, #18
;	../src/main.c: 386: if(!IsValidCfgBuf(pCfgBuf)) return 1; 
	ldw	x, (0x15, sp)
	pushw	x
	call	_IsValidCfgBuf
	popw	x
	ld	(0x12, sp), a
	jrne	00102$
	clrw	x
	incw	x
	jp	00106$
00102$:
;	../src/main.c: 389: pcfg->sampFreq = pCfgBuf[0]+(((uint16_t)pCfgBuf[1])<<8);
	ldw	y, (0x17, sp)
	ldw	(0x01, sp), y
	ldw	y, (0x15, sp)
	ldw	(0x03, sp), y
	ldw	x, y
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	y, (0x03, sp)
	ld	a, (0x1, y)
	ld	yh, a
	clr	a
	ldw	(0x11, sp), x
	ld	yl, a
	addw	y, (0x11, sp)
	ldw	x, (0x01, sp)
	ldw	(x), y
;	../src/main.c: 391: fID = pCfgBuf[2]+(((uint16_t)pCfgBuf[3])<<8);
	ldw	x, (0x03, sp)
	ld	a, (0x2, x)
	clrw	y
	ld	yl, a
	ldw	x, (0x03, sp)
	ld	a, (0x3, x)
	ld	xh, a
	clr	a
	ldw	(0x11, sp), y
	ld	xl, a
	addw	x, (0x11, sp)
;	../src/main.c: 393: ConvertFileName(fID, pcfg->firstFileName);
	ldw	y, (0x01, sp)
	addw	y, #0x0002
	pushw	y
	pushw	x
	call	_ConvertFileName
	addw	sp, #4
;	../src/main.c: 394: pcfg->fileNo = pCfgBuf[4]+(((uint16_t)pCfgBuf[5])<<8);
	ldw	y, (0x01, sp)
	addw	y, #0x000b
	ldw	x, (0x03, sp)
	ld	a, (0x4, x)
	ld	(0x10, sp), a
	clr	(0x0f, sp)
	ldw	x, (0x03, sp)
	ld	a, (0x5, x)
	ld	(0x11, sp), a
	clr	(0x12, sp)
	ldw	x, (0x0f, sp)
	addw	x, (0x11, sp)
	ldw	(y), x
;	../src/main.c: 395: pcfg->fileSzInBlock = pCfgBuf[6]+ \
	ldw	x, (0x01, sp)
	addw	x, #0x0007
	ldw	(0x05, sp), x
	ldw	x, (0x03, sp)
	ld	a, (0x6, x)
	ld	yl, a
	ldw	x, (0x03, sp)
	ld	a, (0x7, x)
	clr	(0x11, sp)
	clrw	x
	ld	xh, a
	ld	a, (0x11, sp)
	clr	(0x0a, sp)
	clr	(0x11, sp)
	clr	(0x10, sp)
	clr	(0x0f, sp)
	push	a
	ld	a, yl
	add	a, (0x0b, sp)
	ld	yl, a
	ld	a, xh
	adc	a, (0x12, sp)
	ld	yh, a
	pop	a
	adc	a, (0x10, sp)
	ld	(0x0c, sp), a
	ld	a, xl
	adc	a, (0x0f, sp)
	ld	(0x0b, sp), a
	ldw	x, (0x03, sp)
	ld	a, (0x8, x)
	clrw	x
	clr	(0x0f, sp)
	clr	(0x12, sp)
	clr	(0x11, sp)
	addw	y, (0x11, sp)
	adc	a, (0x0c, sp)
	ld	(0x08, sp), a
	ld	a, xl
	adc	a, (0x0b, sp)
	ld	(0x07, sp), a
	ldw	x, (0x03, sp)
	ld	a, (0x9, x)
	clr	(0x0f, sp)
	clr	(0x0e, sp)
	clrw	x
	push	a
	ld	a, yl
	add	a, (0x0f, sp)
	rlwa	y
	pushw	x
	adc	a, (2, sp)
	popw	x
	ld	yh, a
	ld	a, xh
	adc	a, (0x09, sp)
	ld	(0x11, sp), a
	pop	a
	adc	a, (0x07, sp)
	ld	(0x0f, sp), a
	ldw	x, (0x05, sp)
	ldw	(0x2, x), y
	ldw	y, (0x0f, sp)
	ldw	(x), y
;	../src/main.c: 399: pcfg->channel = pCfgBuf[10];
	ldw	x, (0x01, sp)
	addw	x, #0x000d
	ldw	y, (0x03, sp)
	ld	a, (0xa, y)
	ld	(x), a
;	../src/main.c: 400: if(pCfgBuf[11] == 0)
	ldw	x, (0x03, sp)
	ld	a, (0xb, x)
;	../src/main.c: 402: pcfg->isFullResultion = false;
	ldw	x, (0x01, sp)
	addw	x, #0x000e
;	../src/main.c: 400: if(pCfgBuf[11] == 0)
	tnz	a
	jrne	00104$
;	../src/main.c: 402: pcfg->isFullResultion = false;
	clr	(x)
	jra	00105$
00104$:
;	../src/main.c: 404: pcfg->isFullResultion = true;
	ld	a, #0x01
	ld	(x), a
00105$:
;	../src/main.c: 407: return 0x0;
	clrw	x
00106$:
;	../src/main.c: 408: }
	addw	sp, #18
	ret
;	../src/main.c: 422: static uint8_t IsValidCfgBuf(uint8_t *pCfgBuf){
;	-----------------------------------------
;	 function IsValidCfgBuf
;	-----------------------------------------
_IsValidCfgBuf:
	push	a
;	../src/main.c: 423: uint8_t crc = 0;
	clr	(0x01, sp)
;	../src/main.c: 431: return false;	
	clrw	x
00105$:
;	../src/main.c: 425: for(; i < CFG_BUF_SZ - 1; i++){
	cpw	x, #0x000c
	jrsge	00101$
;	../src/main.c: 426: crc += pCfgBuf[i];		
	ldw	y, x
	addw	y, (0x04, sp)
	ld	a, (y)
	add	a, (0x01, sp)
	ld	(0x01, sp), a
;	../src/main.c: 425: for(; i < CFG_BUF_SZ - 1; i++){
	incw	x
	jra	00105$
00101$:
;	../src/main.c: 428: if(crc == pCfgBuf[CFG_BUF_SZ-1])
	ldw	x, (0x04, sp)
	ld	a, (0xc, x)
;	../src/main.c: 429: return true;
	sub	a, (0x01, sp)
	jrne	00103$
	inc	a
;	../src/main.c: 431: return false;	
	.byte 0x21
00103$:
	clr	a
00107$:
;	../src/main.c: 432: }
	addw	sp, #1
	ret
;	../src/main.c: 441: static void clkInit( void )
;	-----------------------------------------
;	 function clkInit
;	-----------------------------------------
_clkInit:
;	../src/main.c: 444: CLK->CKDIVR = 0;//(CLK_PRESCALER_HSIDIV1|CLK_PRESCALER_CPUDIV1);
	mov	0x50c6+0, #0x00
;	../src/main.c: 452: CLK->PCKENR1 |= (CLK_PCKENR1_TIM4|CLK_PCKENR1_SPI|CLK_PCKENR1_UART1);
	ld	a, 0x50c7
	or	a, #0x16
	ld	0x50c7, a
;	../src/main.c: 453: CLK->PCKENR2 |= (CLK_PCKENR2_ADC);
	bset	20682, #3
;	../src/main.c: 454: }
	ret
;	../src/main.c: 469: void assert_failed(uint8_t* file, uint32_t line)
;	-----------------------------------------
;	 function assert_failed
;	-----------------------------------------
_assert_failed:
;	../src/main.c: 475: while (1)
00102$:
	jra	00102$
;	../src/main.c: 478: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	.ascii "CFG"
	.db 0x00
	.area CODE
	.area INITIALIZER
__xinit__blkCnt:
	.db #0x00	; 0
__xinit__fileBlkCnt:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
__xinit__fileNoCnt:
	.dw #0x0000
	.area CABS (ABS)
