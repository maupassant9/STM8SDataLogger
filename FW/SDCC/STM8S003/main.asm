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
	.globl _pf_read
	.globl _pf_open
	.globl _pf_mount
	.globl _adcInit
	.globl _dly
	.globl _sysTickInit
	.globl _loggerCfg
	.globl _assert_failed
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
Fmain$cfg$0_0$0==.
_cfg:
	.ds 13
G$loggerCfg$0_0$0==.
_loggerCfg::
	.ds 15
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
Fmain$blkCnt$0_0$0==.
_blkCnt:
	.ds 1
Fmain$fileBlkCnt$0_0$0==.
_fileBlkCnt:
	.ds 4
Fmain$fileNoCnt$0_0$0==.
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
	G$main$0$0 ==.
	C$main.c$100$0_0$355 ==.
;	../src/main.c: 100: void main( void )
; genLabel
;	-----------------------------------------
;	 function main
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 50 bytes.
_main:
	sub	sp, #50
	C$main.c$110$1_0$355 ==.
;	../src/main.c: 110: clkInit();
; genCall
	call	_clkInit
	C$main.c$111$1_0$355 ==.
;	../src/main.c: 111: LedMatrixInit();
; genCall
	call	_LedMatrixInit
	C$main.c$112$1_0$355 ==.
;	../src/main.c: 112: sysTickInit();
; genCall
	call	_sysTickInit
	C$main.c$115$1_0$355 ==.
;	../src/main.c: 115: enableInterrupts();
;	genInline
	rim
	C$main.c$117$1_0$355 ==.
;	../src/main.c: 117: SetLedMode(0, LED_ON);
; genIPush
	push	#0x03
; genIPush
	push	#0x00
; genCall
	call	_SetLedMode
	popw	x
	C$main.c$118$1_0$355 ==.
;	../src/main.c: 118: dly(10000);
; genIPush
	push	#0x10
	push	#0x27
	clrw	x
	pushw	x
; genCall
	call	_dly
	addw	sp, #4
	C$main.c$124$1_0$355 ==.
;	../src/main.c: 124: res |= pf_mount(&fid);	
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	ldw	x, sp
	addw	x, #3
	pushw	x
; genCall
	call	_pf_mount
	popw	x
; genAssign
	ld	(0x32, sp), a
	C$main.c$125$1_0$355 ==.
;	../src/main.c: 125: res |= pf_open("CFG");
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	push	#<(___str_0+0)
	push	#((___str_0+0) >> 8)
; genCall
	call	_pf_open
	popw	x
; genOr
	or	a, (0x32, sp)
	ld	(0x32, sp), a
	C$main.c$126$1_0$355 ==.
;	../src/main.c: 126: res |= pf_read(cfg, 13 , &pbr);
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	ldw	x, sp
	incw	x
	pushw	x
; genIPush
	push	#0x0d
	push	#0x00
; genIPush
	push	#<(_cfg+0)
	push	#((_cfg+0) >> 8)
; genCall
	call	_pf_read
	addw	sp, #6
; genOr
	or	a, (0x32, sp)
	ld	(0x32, sp), a
	C$main.c$128$1_0$355 ==.
;	../src/main.c: 128: res |= GetCfg(cfg, &loggerCfg);
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	push	#<(_loggerCfg+0)
	push	#((_loggerCfg+0) >> 8)
; genIPush
	push	#<(_cfg+0)
	push	#((_cfg+0) >> 8)
; genCall
	call	_GetCfg
	addw	sp, #4
	ld	a, xl
; genCast
; genAssign
; genOr
	or	a, (0x32, sp)
; genAssign
	ld	(0x32, sp), a
	C$main.c$130$1_0$355 ==.
;	../src/main.c: 130: if(FR_OK == res){
; genIfx
	tnz	(0x32, sp)
	jreq	00196$
	jp	00105$
00196$:
	C$main.c$132$2_0$356 ==.
;	../src/main.c: 132: fileBlkCnt = loggerCfg.fileSzInBlock;
; skipping iCode since result will be rematerialized
; genAssign
	ldw	x, #(_loggerCfg+0)
; genPointerGet
	ldw	y, x
	ldw	y, (0x9, y)
	ldw	x, (0x7, x)
; genAssign
	ldw	_fileBlkCnt+2, y
	ldw	_fileBlkCnt+0, x
	C$main.c$133$2_0$356 ==.
;	../src/main.c: 133: fileNoCnt = loggerCfg.fileNo;
; skipping iCode since result will be rematerialized
; genPointerGet
	ldw	x, _loggerCfg+11
; genAssign
	ldw	_fileNoCnt+0, x
	C$main.c$134$2_0$356 ==.
;	../src/main.c: 134: SetLedMode(1, LED_ON);
; genIPush
	push	#0x03
; genIPush
	push	#0x01
; genCall
	call	_SetLedMode
	popw	x
	C$main.c$136$2_0$356 ==.
;	../src/main.c: 136: res |= pf_open(loggerCfg.firstFileName);
; genPlus
	ldw	x, #(_loggerCfg+0)+2
; genCast
; genAssign
; genIPush
	pushw	x
; genCall
	call	_pf_open
	popw	x
; genOr
	or	a, (0x32, sp)
	C$main.c$138$2_0$356 ==.
;	../src/main.c: 138: if(FR_OK == res){
; genIfx
	tnz	a
	jreq	00197$
	jp	00102$
00197$:
	C$main.c$141$3_0$357 ==.
;	../src/main.c: 141: fsm.state = S0_RST;
; skipping iCode since result will be rematerialized
; genPointerSet
	clr	(0x2d, sp)
	C$main.c$142$3_0$357 ==.
;	../src/main.c: 142: fsm.error = NO_ERR;
; skipping iCode since result will be rematerialized
; genPointerSet
	clr	(0x2e, sp)
; genGoto
	jp	00103$
; genLabel
00102$:
	C$main.c$145$3_0$358 ==.
;	../src/main.c: 145: fsm.state = S4_ERR;
; skipping iCode since result will be rematerialized
; genPointerSet
	ld	a, #0x04
	ld	(0x2d, sp), a
	C$main.c$146$3_0$358 ==.
;	../src/main.c: 146: fsm.error = ERR_CARD_INIT;
; skipping iCode since result will be rematerialized
; genPointerSet
	ld	a, #0x01
	ld	(0x2e, sp), a
	C$main.c$147$3_0$358 ==.
;	../src/main.c: 147: SetLedMode(1, LED_TOGGLE_FAST);
; genIPush
	push	#0x02
; genIPush
	push	#0x01
; genCall
	call	_SetLedMode
	popw	x
; genLabel
00103$:
	C$main.c$150$2_0$356 ==.
;	../src/main.c: 150: disableInterrupts();
;	genInline
	sim
	C$main.c$151$2_0$356 ==.
;	../src/main.c: 151: adcInit();
; genCall
	call	_adcInit
	C$main.c$153$2_0$356 ==.
;	../src/main.c: 153: enableInterrupts();
;	genInline
	rim
; genGoto
	jp	00106$
; genLabel
00105$:
	C$main.c$156$2_0$359 ==.
;	../src/main.c: 156: fsm.state = S4_ERR;
; skipping iCode since result will be rematerialized
; genPointerSet
	ld	a, #0x04
	ld	(0x2d, sp), a
	C$main.c$157$2_0$359 ==.
;	../src/main.c: 157: fsm.error = ERR_CARD_INIT;
; skipping iCode since result will be rematerialized
; genPointerSet
	ld	a, #0x01
	ld	(0x2e, sp), a
; genLabel
00106$:
	C$main.c$159$1_0$355 ==.
;	../src/main.c: 159: SetLedMode(0, LED_TOGGLE_SLOW);
; genIPush
	push	#0x01
; genIPush
	push	#0x00
; genCall
	call	_SetLedMode
	popw	x
	C$main.c$161$2_0$360 ==.
;	../src/main.c: 161: while(1){
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genPlus
	ldw	x, #(_loggerCfg+0)+2
	ldw	(0x2f, sp), x
; genAssign
	ldw	y, (0x2f, sp)
	ldw	(0x31, sp), y
; genLabel
00137$:
	C$main.c$166$2_0$360 ==.
;	../src/main.c: 166: switch (fsm.state){
; genPointerGet
	ld	a, (0x2d, sp)
; genCmp
; genCmpTop
	cp	a, #0x06
	jrule	00198$
	jp	00137$
00198$:
; skipping generated iCode
; genJumpTab
	clrw	x
	ld	xl, a
	sllw	x
	ldw	x, (#00199$, x)
	jp	(x)
00199$:
	.dw	#00107$
	.dw	#00117$
	.dw	#00117$
	.dw	#00118$
	.dw	#00125$
	.dw	#00129$
	.dw	#00137$
	C$main.c$167$3_0$361 ==.
;	../src/main.c: 167: case S0_RST:
; genLabel
00107$:
	C$main.c$170$3_0$361 ==.
;	../src/main.c: 170: if( 0x3 == buffer_rdy ){
; genCmpEQorNE
	ld	a, _buffer_rdy+0
	cp	a, #0x03
	jrne	00201$
	jp	00202$
00201$:
	jp	00114$
00202$:
; skipping generated iCode
	C$main.c$173$4_0$362 ==.
;	../src/main.c: 173: fsm.state = S4_ERR;
; genPointerSet
	ld	a, #0x04
	ld	(0x2d, sp), a
	C$main.c$174$4_0$362 ==.
;	../src/main.c: 174: fsm.error = ERR_BUFF_OVERLAP;
; genPlus
	ldw	x, sp
	addw	x, #46
	ld	a, xl
; genPointerSet
	ld	xl, a
	ld	a, #0x05
	ld	(x), a
; genGoto
	jp	00137$
; genLabel
00114$:
	C$main.c$175$3_0$361 ==.
;	../src/main.c: 175: } else if (0x01 == buffer_rdy) {
; genCmpEQorNE
	ld	a, _buffer_rdy+0
	dec	a
	jrne	00204$
	jp	00205$
00204$:
	jp	00111$
00205$:
; skipping generated iCode
	C$main.c$177$4_0$363 ==.
;	../src/main.c: 177: fsm.state = S1_WR_BUF0;
; genPointerSet
	ld	a, #0x01
	ld	(0x2d, sp), a
; genGoto
	jp	00137$
; genLabel
00111$:
	C$main.c$178$3_0$361 ==.
;	../src/main.c: 178: } else if ( 0x02 == buffer_rdy) {
; genCmpEQorNE
	ld	a, _buffer_rdy+0
	cp	a, #0x02
	jrne	00207$
	jp	00208$
00207$:
	jp	00137$
00208$:
; skipping generated iCode
	C$main.c$180$4_0$364 ==.
;	../src/main.c: 180: fsm.state = S2_WR_BUF1;
; genPointerSet
	ld	a, #0x02
	ld	(0x2d, sp), a
	C$main.c$182$3_0$361 ==.
;	../src/main.c: 182: break;
; genGoto
	jp	00137$
	C$main.c$184$3_0$361 ==.
;	../src/main.c: 184: case S2_WR_BUF1:
; genLabel
00117$:
	C$main.c$186$3_0$361 ==.
;	../src/main.c: 186: Wr2SD(&fsm);
; skipping iCode since result will be rematerialized
; genIPush
	ldw	x, sp
	addw	x, #45
	pushw	x
; genCall
	call	_Wr2SD
	popw	x
	C$main.c$187$3_0$361 ==.
;	../src/main.c: 187: break;
; genGoto
	jp	00137$
	C$main.c$188$3_0$361 ==.
;	../src/main.c: 188: case S3_NXT_FILE:
; genLabel
00118$:
	C$main.c$189$3_0$361 ==.
;	../src/main.c: 189: fileBlkCnt = loggerCfg.fileSzInBlock;
; genPointerGet
	ldw	x, #(_loggerCfg+0)
	ldw	y, x
	ldw	y, (0x9, y)
	ldw	x, (0x7, x)
; genAssign
	ldw	_fileBlkCnt+2, y
	ldw	_fileBlkCnt+0, x
	C$main.c$191$3_0$361 ==.
;	../src/main.c: 191: if(--fileNoCnt != 0){
; genMinus
	ldw	x, _fileNoCnt+0
	decw	x
; genAssign
	ldw	_fileNoCnt+0, x
; genIfx
	ldw	x, _fileNoCnt+0
	jrne	00209$
	jp	00123$
00209$:
	C$main.c$193$4_0$365 ==.
;	../src/main.c: 193: GetNxtFileName(loggerCfg.firstFileName);
; genCast
; genAssign
	ldw	x, (0x2f, sp)
; genIPush
	pushw	x
; genCall
	call	_GetNxtFileName
	popw	x
	C$main.c$195$4_0$365 ==.
;	../src/main.c: 195: res = pf_open(loggerCfg.firstFileName);
; genCast
; genAssign
	ldw	x, (0x31, sp)
; genIPush
	pushw	x
; genCall
	call	_pf_open
	popw	x
; genAssign
	C$main.c$196$4_0$365 ==.
;	../src/main.c: 196: if( FR_OK != res ){
; genIfx
	tnz	a
	jrne	00210$
	jp	00120$
00210$:
	C$main.c$197$5_0$366 ==.
;	../src/main.c: 197: fsm.state = S4_ERR;
; genPointerSet
	ld	a, #0x04
	ld	(0x2d, sp), a
; genGoto
	jp	00137$
; genLabel
00120$:
	C$main.c$200$5_0$367 ==.
;	../src/main.c: 200: fsm.state = S0_RST;
; genPointerSet
	clr	(0x2d, sp)
; genGoto
	jp	00137$
; genLabel
00123$:
	C$main.c$206$4_0$368 ==.
;	../src/main.c: 206: fsm.state = S5_COMPLETE;
; genPointerSet
	ld	a, #0x05
	ld	(0x2d, sp), a
	C$main.c$209$3_0$361 ==.
;	../src/main.c: 209: break;
; genGoto
	jp	00137$
	C$main.c$211$3_0$361 ==.
;	../src/main.c: 211: case S4_ERR:
; genLabel
00125$:
	C$main.c$212$3_0$361 ==.
;	../src/main.c: 212: SetLedMode(1, LED_TOGGLE_FAST);
; genIPush
	push	#0x02
; genIPush
	push	#0x01
; genCall
	call	_SetLedMode
	popw	x
	C$main.c$213$3_0$361 ==.
;	../src/main.c: 213: while(1); break;
; genLabel
00127$:
; genGoto
	jp	00127$
	C$main.c$214$3_0$361 ==.
;	../src/main.c: 214: case S5_COMPLETE:
; genLabel
00129$:
	C$main.c$215$3_0$361 ==.
;	../src/main.c: 215: SetLedMode(0, LED_ON);
; genIPush
	push	#0x03
; genIPush
	push	#0x00
; genCall
	call	_SetLedMode
	popw	x
	C$main.c$216$3_0$361 ==.
;	../src/main.c: 216: while(1);
; genLabel
00131$:
; genGoto
	jp	00131$
	C$main.c$221$1_0$355 ==.
;	../src/main.c: 221: }
; genLabel
00139$:
	C$main.c$223$1_0$355 ==.
;	../src/main.c: 223: }
; genEndFunction
	addw	sp, #50
	C$main.c$223$1_0$355 ==.
	XG$main$0$0 ==.
	ret
	Fmain$Wr2SD$0$0 ==.
	C$main.c$236$1_0$370 ==.
;	../src/main.c: 236: static void Wr2SD( fsm_t * pfsm ){
; genLabel
;	-----------------------------------------
;	 function Wr2SD
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 6 bytes.
_Wr2SD:
	sub	sp, #6
	C$main.c$243$1_0$370 ==.
;	../src/main.c: 243: if( S1_WR_BUF0 == pfsm->state){
; genAssign
	ldw	x, (0x09, sp)
; genPointerGet
	ld	a, (x)
; genCmpEQorNE
	dec	a
	jrne	00140$
	jp	00141$
00140$:
	jp	00102$
00141$:
; skipping generated iCode
	C$main.c$244$2_0$371 ==.
;	../src/main.c: 244: pBuf = adcBuffer0; bufNo = 0;
; genAddrOf
	ldw	y, #_adcBuffer0+0
; genCast
; genAssign
; genAssign
; genAssign
	clrw	x
; genGoto
	jp	00103$
; genLabel
00102$:
	C$main.c$246$2_0$372 ==.
;	../src/main.c: 246: pBuf = adcBuffer1; bufNo = 1;
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genAssign
	ldw	y, #(_adcBuffer1+0)
; genAssign
	ld	a, #0x01
	ld	xl, a
; genLabel
00103$:
	C$main.c$248$1_0$370 ==.
;	../src/main.c: 248: RELEASE_BUFF_FOR_WR(bufNo); //clear this flag
; genCast
; genAssign
; genLeftShift
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00143$
00142$:
	sll	(1, sp)
	dec	a
	jrne	00142$
00143$:
	pop	a
; genCpl
	cpl	a
; genAnd
	and	a, _buffer_rdy+0
	ld	_buffer_rdy+0, a
	C$main.c$252$1_0$370 ==.
;	../src/main.c: 252: res = pf_write((void*)pBuf,BUFFER_SZ_IN_BYTES, &pbr);
; genAddrOf
	ldw	x, sp
	incw	x
; genCast
; genAssign
; genCast
; genAssign
; genIPush
	pushw	x
; genIPush
	push	#0x00
	push	#0x01
; genIPush
	pushw	y
; genCall
	call	_pf_write
	addw	sp, #6
	C$main.c$243$1_0$370 ==.
;	../src/main.c: 243: if( S1_WR_BUF0 == pfsm->state){
; genAssign
	ldw	y, (0x09, sp)
	ldw	(0x03, sp), y
	C$main.c$259$1_0$370 ==.
;	../src/main.c: 259: pfsm->error = ERR_WR_DATA;
; genPlus
	ldw	x, (0x03, sp)
	incw	x
	ldw	(0x05, sp), x
	C$main.c$256$1_0$370 ==.
;	../src/main.c: 256: if(FR_OK != res){
; genIfx
	tnz	a
	jrne	00144$
	jp	00105$
00144$:
	C$main.c$259$2_0$373 ==.
;	../src/main.c: 259: pfsm->error = ERR_WR_DATA;
; genPointerSet
	ldw	x, (0x05, sp)
	ld	a, #0x02
	ld	(x), a
	C$main.c$260$2_0$373 ==.
;	../src/main.c: 260: pfsm->state = S4_ERR;
; genPointerSet
	ldw	x, (0x03, sp)
	ld	a, #0x04
	ld	(x), a
	C$main.c$261$2_0$373 ==.
;	../src/main.c: 261: return;
; genReturn
	jp	00112$
; genLabel
00105$:
	C$main.c$264$1_0$370 ==.
;	../src/main.c: 264: if(NO_BUFF_PER_BLK == ++blkCnt){
; genPlus
	inc	_blkCnt+0
; genCmpEQorNE
	ld	a, _blkCnt+0
	cp	a, #0x02
	jrne	00146$
	jp	00147$
00146$:
	jp	00111$
00147$:
; skipping generated iCode
	C$main.c$266$2_0$374 ==.
;	../src/main.c: 266: blkCnt = 0;
; genAssign
	clr	_blkCnt+0
	C$main.c$267$2_0$374 ==.
;	../src/main.c: 267: res = pf_write(0,0,&pbr);
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	ldw	x, sp
	incw	x
	pushw	x
; genIPush
	clrw	x
	pushw	x
; genIPush
	clrw	x
	pushw	x
; genCall
	call	_pf_write
	addw	sp, #6
	C$main.c$270$2_0$374 ==.
;	../src/main.c: 270: if(FR_OK != res){
; genIfx
	tnz	a
	jrne	00148$
	jp	00107$
00148$:
	C$main.c$272$3_0$375 ==.
;	../src/main.c: 272: pfsm->error = ERR_WR_NO_RESP;
; genPointerSet
	ldw	x, (0x05, sp)
	ld	a, #0x03
	ld	(x), a
	C$main.c$273$3_0$375 ==.
;	../src/main.c: 273: pfsm->state = S4_ERR;
; genPointerSet
	ldw	x, (0x03, sp)
	ld	a, #0x04
	ld	(x), a
	C$main.c$274$3_0$375 ==.
;	../src/main.c: 274: return;
; genReturn
	jp	00112$
; genLabel
00107$:
	C$main.c$277$2_0$374 ==.
;	../src/main.c: 277: if(0 == --fileBlkCnt){
; genMinus
	ldw	x, _fileBlkCnt+2
	subw	x, #0x0001
	ldw	y, _fileBlkCnt+0
	jrnc	00149$
	decw	y
00149$:
; genAssign
	ldw	_fileBlkCnt+2, x
	ldw	_fileBlkCnt+0, y
; genIfx
	ldw	x, _fileBlkCnt+2
	jrne	00150$
	ldw	x, _fileBlkCnt+0
	jreq	00151$
00150$:
	jp	00111$
00151$:
	C$main.c$280$3_0$376 ==.
;	../src/main.c: 280: pfsm->state = S3_NXT_FILE;
; genPointerSet
	ldw	x, (0x03, sp)
	ld	a, #0x03
	ld	(x), a
	C$main.c$281$3_0$376 ==.
;	../src/main.c: 281: return;
; genReturn
	jp	00112$
; genLabel
00111$:
	C$main.c$286$1_0$370 ==.
;	../src/main.c: 286: pfsm->state = S0_RST; 
; genPointerSet
	ldw	x, (0x03, sp)
	clr	(x)
; genLabel
00112$:
	C$main.c$287$1_0$370 ==.
;	../src/main.c: 287: }
; genEndFunction
	addw	sp, #6
	C$main.c$287$1_0$370 ==.
	XFmain$Wr2SD$0$0 ==.
	ret
	Fmain$GetNxtFileName$0$0 ==.
	C$main.c$300$1_0$378 ==.
;	../src/main.c: 300: static void GetNxtFileName( char * fname){
; genLabel
;	-----------------------------------------
;	 function GetNxtFileName
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 8 bytes.
_GetNxtFileName:
	sub	sp, #8
	C$main.c$301$2_0$378 ==.
;	../src/main.c: 301: uint8_t val = 0;
; genAssign
	clrw	x
	C$main.c$303$1_0$378 ==.
;	../src/main.c: 303: if(0x39 == fname[3]){
; genPlus
	ldw	y, (0x0b, sp)
	addw	y, #0x0003
	ldw	(0x01, sp), y
; genPointerGet
	ldw	y, (0x01, sp)
	ld	a, (y)
	ld	xl, a
; genCmpEQorNE
	ld	a, xl
	cp	a, #0x39
	jrne	00158$
	jp	00159$
00158$:
	jp	00102$
00159$:
; skipping generated iCode
	C$main.c$304$2_0$379 ==.
;	../src/main.c: 304: val = 0x01;
; genAssign
	ld	a, #0x01
	ld	xh, a
; genLabel
00102$:
	C$main.c$306$1_0$378 ==.
;	../src/main.c: 306: if(0x39 == fname[2]) {
; genPlus
	ldw	y, (0x0b, sp)
	incw	y
	incw	y
	ldw	(0x03, sp), y
; genPointerGet
	ldw	y, (0x03, sp)
	ld	a, (y)
; genCmpEQorNE
	cp	a, #0x39
	jrne	00161$
	jp	00162$
00161$:
	jp	00104$
00162$:
; skipping generated iCode
	C$main.c$307$2_0$380 ==.
;	../src/main.c: 307: val += 0x02;
; genCast
; genAssign
; genPlus
	addw	x, #512
; genLabel
00104$:
	C$main.c$309$1_0$378 ==.
;	../src/main.c: 309: if(0x39 == fname[1]) {
; genPlus
	ldw	y, (0x0b, sp)
	incw	y
	ldw	(0x05, sp), y
; genPointerGet
	ldw	y, (0x05, sp)
	ld	a, (y)
; genCmpEQorNE
	cp	a, #0x39
	jrne	00164$
	jp	00165$
00164$:
	jp	00106$
00165$:
; skipping generated iCode
	C$main.c$310$2_0$381 ==.
;	../src/main.c: 310: val += 0x04;
; genCast
; genAssign
; genPlus
	addw	x, #1024
; genLabel
00106$:
	C$main.c$312$1_0$378 ==.
;	../src/main.c: 312: if(0x39 == fname[0]) {
; genAssign
	ldw	y, (0x0b, sp)
	ldw	(0x07, sp), y
; genPointerGet
	ldw	y, (0x07, sp)
	ld	a, (y)
; genCmpEQorNE
	cp	a, #0x39
	jrne	00167$
	jp	00168$
00167$:
	jp	00108$
00168$:
; skipping generated iCode
	C$main.c$313$2_0$382 ==.
;	../src/main.c: 313: val += 0x08;
; genCast
; genAssign
; genPlus
	addw	x, #2048
; genLabel
00108$:
	C$main.c$316$1_0$378 ==.
;	../src/main.c: 316: switch(val){
; genCmpEQorNE
	ld	a, xh
	dec	a
	jrne	00170$
	jp	00109$
00170$:
; skipping generated iCode
; genCmpEQorNE
	ld	a, xh
	cp	a, #0x03
	jrne	00173$
	jp	00110$
00173$:
; skipping generated iCode
; genCmpEQorNE
	ld	a, xh
	cp	a, #0x07
	jrne	00176$
	jp	00111$
00176$:
; skipping generated iCode
; genCmpEQorNE
	ld	a, xh
	cp	a, #0x0f
	jrne	00179$
	jp	00112$
00179$:
; skipping generated iCode
; genGoto
	jp	00113$
	C$main.c$317$2_0$383 ==.
;	../src/main.c: 317: case 0x01: fname[3] = 0x30; 
; genLabel
00109$:
; genPointerSet
	ldw	x, (0x01, sp)
	ld	a, #0x30
	ld	(x), a
	C$main.c$318$2_0$383 ==.
;	../src/main.c: 318: fname[2]++;break;
; genPointerGet
	ldw	x, (0x03, sp)
	ld	a, (x)
; genPlus
	inc	a
; genPointerSet
	ldw	x, (0x03, sp)
	ld	(x), a
; genGoto
	jp	00115$
	C$main.c$319$2_0$383 ==.
;	../src/main.c: 319: case 0x03: fname[3] = 0x30; 
; genLabel
00110$:
; genPointerSet
	ldw	x, (0x01, sp)
	ld	a, #0x30
	ld	(x), a
	C$main.c$320$2_0$383 ==.
;	../src/main.c: 320: fname[2] = 0x30; 
; genPointerSet
	ldw	x, (0x03, sp)
	ld	a, #0x30
	ld	(x), a
	C$main.c$321$2_0$383 ==.
;	../src/main.c: 321: fname[1]++; break;
; genPointerGet
	ldw	x, (0x05, sp)
	ld	a, (x)
; genPlus
	inc	a
; genPointerSet
	ldw	x, (0x05, sp)
	ld	(x), a
; genGoto
	jp	00115$
	C$main.c$322$2_0$383 ==.
;	../src/main.c: 322: case 0x07: fname[3] = 0x30; 
; genLabel
00111$:
; genPointerSet
	ldw	x, (0x01, sp)
	ld	a, #0x30
	ld	(x), a
	C$main.c$323$2_0$383 ==.
;	../src/main.c: 323: fname[2] = 0x30; 
; genPointerSet
	ldw	x, (0x03, sp)
	ld	a, #0x30
	ld	(x), a
	C$main.c$324$2_0$383 ==.
;	../src/main.c: 324: fname[1] = 0x30; 
; genPointerSet
	ldw	x, (0x05, sp)
	ld	a, #0x30
	ld	(x), a
	C$main.c$325$2_0$383 ==.
;	../src/main.c: 325: fname[0]++; break;
; genPointerGet
	ldw	x, (0x07, sp)
	ld	a, (x)
; genPlus
	inc	a
; genPointerSet
	ldw	x, (0x07, sp)
	ld	(x), a
; genGoto
	jp	00115$
	C$main.c$326$2_0$383 ==.
;	../src/main.c: 326: case 0x0f: fname[3] = 0x30; 
; genLabel
00112$:
; genPointerSet
	ldw	x, (0x01, sp)
	ld	a, #0x30
	ld	(x), a
	C$main.c$327$2_0$383 ==.
;	../src/main.c: 327: fname[2] = 0x30; 
; genPointerSet
	ldw	x, (0x03, sp)
	ld	a, #0x30
	ld	(x), a
	C$main.c$328$2_0$383 ==.
;	../src/main.c: 328: fname[1] = 0x30; 
; genPointerSet
	ldw	x, (0x05, sp)
	ld	a, #0x30
	ld	(x), a
	C$main.c$329$2_0$383 ==.
;	../src/main.c: 329: fname[0] = 0x30; break;
; genPointerSet
	ldw	x, (0x07, sp)
	ld	a, #0x30
	ld	(x), a
; genGoto
	jp	00115$
	C$main.c$330$2_0$383 ==.
;	../src/main.c: 330: default: fname[3]++; break;
; genLabel
00113$:
; genPlus
	ld	a, xl
	inc	a
; genPointerSet
	ldw	x, (0x01, sp)
	ld	(x), a
	C$main.c$331$1_0$378 ==.
;	../src/main.c: 331: }
; genLabel
00115$:
	C$main.c$332$1_0$378 ==.
;	../src/main.c: 332: }
; genEndFunction
	addw	sp, #8
	C$main.c$332$1_0$378 ==.
	XFmain$GetNxtFileName$0$0 ==.
	ret
	Fmain$ConvertFileName$0$0 ==.
	C$main.c$345$1_0$385 ==.
;	../src/main.c: 345: static void ConvertFileName(uint16_t firstFileName, char * fname){
; genLabel
;	-----------------------------------------
;	 function ConvertFileName
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 4 bytes.
_ConvertFileName:
	sub	sp, #4
	C$main.c$348$1_0$385 ==.
;	../src/main.c: 348: val = firstFileName/1000;
; genCast
; genAssign
	ldw	y, (0x07, sp)
	ldw	(0x03, sp), y
; genDivMod
	ldw	x, (0x03, sp)
	ldw	y, #0x03e8
	divw	x, y
; genCast
; genAssign
; genAssign
	C$main.c$349$1_0$385 ==.
;	../src/main.c: 349: fname[0] = val + 0x30;
; genAssign
	ldw	y, (0x09, sp)
	ldw	(0x01, sp), y
; genCast
; genAssign
	ld	a, xl
; genCast
; genAssign
; genPlus
	add	a, #0x30
; genPointerSet
	ldw	y, (0x01, sp)
	ld	(y), a
	C$main.c$350$1_0$385 ==.
;	../src/main.c: 350: firstFileName -=  val*1000;
; genCast
; genAssign
; genIPush
	pushw	x
; genIPush
	push	#0xe8
	push	#0x03
; genCall
	call	__mulint
	addw	sp, #4
; genMinus
	negw	x
	addw	x, (0x03, sp)
; genCast
; genAssign
; genAssign
	ldw	(0x07, sp), x
	C$main.c$351$1_0$385 ==.
;	../src/main.c: 351: val = firstFileName/100;
; genCast
; genAssign
	ldw	y, (0x07, sp)
	ldw	(0x03, sp), y
; genDivMod
	ldw	x, (0x03, sp)
	ldw	y, #0x0064
	divw	x, y
; genCast
; genAssign
; genAssign
	C$main.c$352$1_0$385 ==.
;	../src/main.c: 352: fname[1] = val + 0x30;
; genPlus
	ldw	y, (0x01, sp)
	incw	y
; genCast
; genAssign
	ld	a, xl
; genCast
; genAssign
; genPlus
	add	a, #0x30
; genPointerSet
	ld	(y), a
	C$main.c$353$1_0$385 ==.
;	../src/main.c: 353: firstFileName -=  val*100;
; genCast
; genAssign
; genIPush
	pushw	x
; genIPush
	push	#0x64
	push	#0x00
; genCall
	call	__mulint
	addw	sp, #4
; genMinus
	negw	x
	addw	x, (0x03, sp)
; genCast
; genAssign
; genAssign
	ldw	(0x07, sp), x
	C$main.c$354$1_0$385 ==.
;	../src/main.c: 354: val = firstFileName/10;
; genCast
; genAssign
	ldw	y, (0x07, sp)
	ldw	(0x03, sp), y
; genDivMod
	ldw	x, (0x03, sp)
	ldw	y, #0x000a
	divw	x, y
; genCast
; genAssign
; genAssign
	C$main.c$355$1_0$385 ==.
;	../src/main.c: 355: fname[2] = val + 0x30;
; genPlus
	ldw	y, (0x01, sp)
	addw	y, #0x0002
; genCast
; genAssign
	ld	a, xl
; genCast
; genAssign
; genPlus
	add	a, #0x30
; genPointerSet
	ld	(y), a
	C$main.c$356$1_0$385 ==.
;	../src/main.c: 356: firstFileName -=  val*10;
; genCast
; genAssign
; genMult
; genMultLit
	pushw	x
	sllw	x
	sllw	x
	addw	x, (1, sp)
	sllw	x
	addw	sp, #2
; genMinus
	negw	x
	addw	x, (0x03, sp)
; genCast
; genAssign
; genAssign
	ldw	(0x07, sp), x
	C$main.c$357$1_0$385 ==.
;	../src/main.c: 357: fname[3] = firstFileName + 0x30;
; genPlus
	ldw	x, (0x01, sp)
	addw	x, #0x0003
; genCast
; genAssign
	ld	a, (0x08, sp)
; genCast
; genAssign
; genPlus
	add	a, #0x30
; genPointerSet
	ld	(x), a
	C$main.c$358$1_0$385 ==.
;	../src/main.c: 358: fname[4] = '\0';
; genPlus
	ldw	x, (0x01, sp)
	addw	x, #0x0004
; genPointerSet
	clr	(x)
; genLabel
00101$:
	C$main.c$359$1_0$385 ==.
;	../src/main.c: 359: }
; genEndFunction
	addw	sp, #4
	C$main.c$359$1_0$385 ==.
	XFmain$ConvertFileName$0$0 ==.
	ret
	Fmain$GetCfg$0$0 ==.
	C$main.c$374$1_0$387 ==.
;	../src/main.c: 374: static UINT GetCfg( uint8_t * pCfgBuf,  cfg_t * pcfg){
; genLabel
;	-----------------------------------------
;	 function GetCfg
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 18 bytes.
_GetCfg:
	sub	sp, #18
	C$main.c$377$1_0$387 ==.
;	../src/main.c: 377: if(!IsValidCfgBuf(pCfgBuf)) return 1; 
; genIPush
	ldw	x, (0x15, sp)
	pushw	x
; genCall
	call	_IsValidCfgBuf
	popw	x
	ld	(0x12, sp), a
; genIfx
	tnz	(0x12, sp)
	jreq	00118$
	jp	00102$
00118$:
; genReturn
	clrw	x
	incw	x
	jp	00106$
; genLabel
00102$:
	C$main.c$380$1_0$387 ==.
;	../src/main.c: 380: pcfg->sampFreq = pCfgBuf[0]+(((uint16_t)pCfgBuf[1])<<8);
; genAssign
	ldw	y, (0x17, sp)
	ldw	(0x01, sp), y
; genAssign
	ldw	y, (0x15, sp)
	ldw	(0x03, sp), y
; genPointerGet
	ldw	x, (0x03, sp)
	ld	a, (x)
; genCast
; genAssign
	clrw	x
	ld	xl, a
; genAssign
	ldw	y, (0x03, sp)
; genPointerGet
	ld	a, (0x1, y)
; genCast
; genAssign
	ld	yh, a
	clr	a
; genLeftShiftLiteral
	clr	a
; genCast
; genAssign
	ldw	(0x11, sp), x
; genPlus
	ld	yl, a
	addw	y, (0x11, sp)
; genPointerSet
	ldw	x, (0x01, sp)
	ldw	(x), y
	C$main.c$382$1_0$387 ==.
;	../src/main.c: 382: fID = pCfgBuf[2]+(((uint16_t)pCfgBuf[3])<<8);
; genAssign
	ldw	x, (0x03, sp)
; genPointerGet
	ld	a, (0x2, x)
; genCast
; genAssign
	clrw	y
	ld	yl, a
; genAssign
	ldw	x, (0x03, sp)
; genPointerGet
	ld	a, (0x3, x)
; genCast
; genAssign
	clrw	x
; genLeftShiftLiteral
	ld	xh, a
	clr	a
; genCast
; genAssign
	ldw	(0x11, sp), y
; genPlus
	ld	xl, a
	addw	x, (0x11, sp)
; genAssign
	C$main.c$384$1_0$387 ==.
;	../src/main.c: 384: ConvertFileName(fID, pcfg->firstFileName);
; genPlus
	ldw	y, (0x01, sp)
	addw	y, #0x0002
; genIPush
	pushw	y
; genIPush
	pushw	x
; genCall
	call	_ConvertFileName
	addw	sp, #4
	C$main.c$385$1_0$387 ==.
;	../src/main.c: 385: pcfg->fileNo = pCfgBuf[4]+(((uint16_t)pCfgBuf[5])<<8);
; genPlus
	ldw	y, (0x01, sp)
	addw	y, #0x000b
; genAssign
	ldw	x, (0x03, sp)
; genPointerGet
	ld	a, (0x4, x)
; genCast
; genAssign
	ld	(0x10, sp), a
	clr	(0x0f, sp)
; genAssign
	ldw	x, (0x03, sp)
; genPointerGet
	ld	a, (0x5, x)
; genCast
; genAssign
	clrw	x
; genLeftShiftLiteral
	ld	(0x11, sp), a
	clr	(0x12, sp)
; genCast
; genAssign
	ldw	x, (0x0f, sp)
; genPlus
	addw	x, (0x11, sp)
; genPointerSet
	ldw	(y), x
	C$main.c$386$1_0$387 ==.
;	../src/main.c: 386: pcfg->fileSzInBlock = pCfgBuf[6]+ \
; genPlus
	ldw	x, (0x01, sp)
	addw	x, #0x0007
	ldw	(0x05, sp), x
; genAssign
	ldw	x, (0x03, sp)
; genPointerGet
	ld	a, (0x6, x)
	ld	yl, a
; genAssign
	ldw	x, (0x03, sp)
; genPointerGet
	ld	a, (0x7, x)
; genCast
; genAssign
	clr	(0x11, sp)
	clrw	x
; genLeftShiftLiteral
	ld	xh, a
	ld	a, (0x11, sp)
	clr	(0x0a, sp)
; genCast
; genAssign
	clr	(0x11, sp)
	clr	(0x10, sp)
	clr	(0x0f, sp)
; genPlus
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
; genAssign
	ldw	x, (0x03, sp)
; genPointerGet
	ld	a, (0x8, x)
; genCast
; genAssign
	clrw	x
	clr	(0x0f, sp)
; genLeftShiftLiteral
	clr	(0x12, sp)
	clr	(0x11, sp)
; genPlus
	addw	y, (0x11, sp)
	adc	a, (0x0c, sp)
	ld	(0x08, sp), a
	ld	a, xl
	adc	a, (0x0b, sp)
	ld	(0x07, sp), a
; genAssign
	ldw	x, (0x03, sp)
; genPointerGet
	ld	a, (0x9, x)
; genCast
; genAssign
	clrw	x
	clr	(0x0f, sp)
; genLeftShiftLiteral
	clr	(0x0e, sp)
	clrw	x
; genPlus
	push	a
	ld	a, yl
	add	a, (0x0f, sp)
	ld	yl, a
	ld	a, yh
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
; genPointerSet
	ldw	x, (0x05, sp)
	ldw	(0x2, x), y
	ldw	y, (0x0f, sp)
	ldw	(x), y
	C$main.c$390$1_0$387 ==.
;	../src/main.c: 390: pcfg->channel = pCfgBuf[10];
; genPlus
	ldw	x, (0x01, sp)
	addw	x, #0x000d
; genAssign
	ldw	y, (0x03, sp)
; genPointerGet
	ld	a, (0xa, y)
; genPointerSet
	ld	(x), a
	C$main.c$391$1_0$387 ==.
;	../src/main.c: 391: if(pCfgBuf[11] == 0)
; genAssign
	ldw	x, (0x03, sp)
; genPointerGet
	ld	a, (0xb, x)
	C$main.c$393$1_0$387 ==.
;	../src/main.c: 393: pcfg->isFullResultion = false;
; genPlus
	ldw	x, (0x01, sp)
	addw	x, #0x000e
	C$main.c$391$1_0$387 ==.
;	../src/main.c: 391: if(pCfgBuf[11] == 0)
; genIfx
	tnz	a
	jreq	00119$
	jp	00104$
00119$:
	C$main.c$393$2_0$388 ==.
;	../src/main.c: 393: pcfg->isFullResultion = false;
; genPointerSet
	clr	(x)
; genGoto
	jp	00105$
; genLabel
00104$:
	C$main.c$395$2_0$389 ==.
;	../src/main.c: 395: pcfg->isFullResultion = true;
; genPointerSet
	ld	a, #0x01
	ld	(x), a
; genLabel
00105$:
	C$main.c$398$1_0$387 ==.
;	../src/main.c: 398: return 0x0;
; genReturn
	clrw	x
; genLabel
00106$:
	C$main.c$399$1_0$387 ==.
;	../src/main.c: 399: }
; genEndFunction
	addw	sp, #18
	C$main.c$399$1_0$387 ==.
	XFmain$GetCfg$0$0 ==.
	ret
	Fmain$IsValidCfgBuf$0$0 ==.
	C$main.c$413$1_0$391 ==.
;	../src/main.c: 413: static uint8_t IsValidCfgBuf(uint8_t *pCfgBuf){
; genLabel
;	-----------------------------------------
;	 function IsValidCfgBuf
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 1 bytes.
_IsValidCfgBuf:
	push	a
	C$main.c$414$2_0$391 ==.
;	../src/main.c: 414: uint8_t crc = 0;
; genAssign
	clr	(0x01, sp)
	C$main.c$415$2_0$391 ==.
;	../src/main.c: 415: int i = 0;
; genAssign
	clrw	x
	C$main.c$422$1_0$391 ==.
;	../src/main.c: 422: return false;	
; genAssign
; genLabel
00105$:
	C$main.c$416$2_0$392 ==.
;	../src/main.c: 416: for(; i < CFG_BUF_SZ - 1; i++){
; genCmp
; genCmpTop
	cpw	x, #0x000c
	jrslt	00125$
	jp	00101$
00125$:
; skipping generated iCode
	C$main.c$417$3_0$393 ==.
;	../src/main.c: 417: crc += pCfgBuf[i];		
; genPlus
	ldw	y, x
	addw	y, (0x04, sp)
; genPointerGet
	ld	a, (y)
; genPlus
	add	a, (0x01, sp)
	ld	(0x01, sp), a
	C$main.c$416$2_0$392 ==.
;	../src/main.c: 416: for(; i < CFG_BUF_SZ - 1; i++){
; genPlus
	incw	x
; genGoto
	jp	00105$
; genLabel
00101$:
	C$main.c$419$1_0$391 ==.
;	../src/main.c: 419: if(crc == pCfgBuf[CFG_BUF_SZ-1])
; genAssign
	ldw	x, (0x04, sp)
; genPointerGet
	ld	a, (0xc, x)
; genCmpEQorNE
	cp	a, (0x01, sp)
	jrne	00127$
	jp	00128$
00127$:
	jp	00103$
00128$:
; skipping generated iCode
	C$main.c$420$1_0$391 ==.
;	../src/main.c: 420: return true;
; genReturn
	ld	a, #0x01
	jp	00107$
; genLabel
00103$:
	C$main.c$422$1_0$391 ==.
;	../src/main.c: 422: return false;	
; genReturn
	clr	a
; genLabel
00107$:
	C$main.c$423$1_0$391 ==.
;	../src/main.c: 423: }
; genEndFunction
	addw	sp, #1
	C$main.c$423$1_0$391 ==.
	XFmain$IsValidCfgBuf$0$0 ==.
	ret
	Fmain$clkInit$0$0 ==.
	C$main.c$432$1_0$395 ==.
;	../src/main.c: 432: static void clkInit( void )
; genLabel
;	-----------------------------------------
;	 function clkInit
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_clkInit:
	C$main.c$435$1_0$395 ==.
;	../src/main.c: 435: CLK->CKDIVR = 0;//(CLK_PRESCALER_HSIDIV1|CLK_PRESCALER_CPUDIV1);
; genPointerSet
	mov	0x50c6+0, #0x00
	C$main.c$443$1_0$395 ==.
;	../src/main.c: 443: CLK->PCKENR1 |= (CLK_PCKENR1_TIM4|CLK_PCKENR1_SPI|CLK_PCKENR1_UART1);
; genPointerGet
	ld	a, 0x50c7
; genOr
	or	a, #0x16
; genPointerSet
	ld	0x50c7, a
	C$main.c$444$1_0$395 ==.
;	../src/main.c: 444: CLK->PCKENR2 |= (CLK_PCKENR2_ADC);
; genPointerGet
	ld	a, 0x50ca
; genOr
	or	a, #0x08
; genPointerSet
	ld	0x50ca, a
; genLabel
00101$:
	C$main.c$445$1_0$395 ==.
;	../src/main.c: 445: }
; genEndFunction
	C$main.c$445$1_0$395 ==.
	XFmain$clkInit$0$0 ==.
	ret
	G$assert_failed$0$0 ==.
	C$main.c$460$1_0$397 ==.
;	../src/main.c: 460: void assert_failed(uint8_t* file, uint32_t line)
; genLabel
;	-----------------------------------------
;	 function assert_failed
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_assert_failed:
	C$main.c$466$1_0$397 ==.
;	../src/main.c: 466: while (1)
; genLabel
00102$:
; genGoto
	jp	00102$
; genLabel
00104$:
	C$main.c$469$1_0$397 ==.
;	../src/main.c: 469: }
; genEndFunction
	C$main.c$469$1_0$397 ==.
	XG$assert_failed$0$0 ==.
	ret
	.area CODE
	.area CONST
Fmain$__str_0$0_0$0 == .
	.area CONST
___str_0:
	.ascii "CFG"
	.db 0x00
	.area CODE
	.area INITIALIZER
Fmain$__xinit_blkCnt$0_0$0 == .
__xinit__blkCnt:
	.db #0x00	; 0
Fmain$__xinit_fileBlkCnt$0_0$0 == .
__xinit__fileBlkCnt:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
Fmain$__xinit_fileNoCnt$0_0$0 == .
__xinit__fileNoCnt:
	.dw #0x0000
	.area CABS (ABS)
