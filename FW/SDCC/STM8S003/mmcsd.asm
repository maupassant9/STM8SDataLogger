;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Linux)
;--------------------------------------------------------
	.module mmcsd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SD_GetResponseVal
	.globl _dly
	.globl _SD_Init
	.globl _SD_Detect
	.globl _SD_SendCmd
	.globl _SD_GetDataResponse
	.globl _SD_GetResponse
	.globl _SD_GoIdleState
	.globl _SD_WriteByte
	.globl _SD_ReadByte
	.globl _SD_LowLevel_Init
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
	G$SD_Init$0$0 ==.
	C$mmcsd.c$90$0_0$332 ==.
;	../src/mmcsd.c: 90: uint8_t SD_Init(void)
; genLabel
;	-----------------------------------------
;	 function SD_Init
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 4 bytes.
_SD_Init:
	sub	sp, #4
	C$mmcsd.c$96$1_0$332 ==.
;	../src/mmcsd.c: 96: SD_LowLevel_Init();
; genCall
	call	_SD_LowLevel_Init
	C$mmcsd.c$99$1_0$332 ==.
;	../src/mmcsd.c: 99: SD_CS_LOW();
; genPointerGet
	ld	a, 0x500a
; genAnd
	and	a, #0xef
; genPointerSet
	ld	0x500a, a
	C$mmcsd.c$103$2_0$333 ==.
;	../src/mmcsd.c: 103: for (i = 0; i <= 9; i++)
; genAssign
	clrw	x
	clrw	y
; genAssign
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
; genLabel
00104$:
	C$mmcsd.c$106$3_0$334 ==.
;	../src/mmcsd.c: 106: SD_WriteByte(SD_DUMMY_BYTE);
; genIPush
	push	#0xff
; genCall
	call	_SD_WriteByte
	pop	a
	C$mmcsd.c$103$2_0$333 ==.
;	../src/mmcsd.c: 103: for (i = 0; i <= 9; i++)
; genPlus
	ldw	x, (0x03, sp)
	incw	x
	ldw	(0x03, sp), x
	jrne	00119$
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
00119$:
; genCmp
; genCmpTop
	ldw	x, #0x0009
	cpw	x, (0x03, sp)
	clr	a
	sbc	a, (0x02, sp)
	clr	a
	sbc	a, (0x01, sp)
	jrc	00120$
	jp	00104$
00120$:
; skipping generated iCode
	C$mmcsd.c$110$1_0$332 ==.
;	../src/mmcsd.c: 110: res = SD_GoIdleState();
; genCall
	call	_SD_GoIdleState
	C$mmcsd.c$116$1_0$332 ==.
;	../src/mmcsd.c: 116: return (res);
; genReturn
	clr	a
; genLabel
00106$:
	C$mmcsd.c$117$1_0$332 ==.
;	../src/mmcsd.c: 117: }
; genEndFunction
	addw	sp, #4
	C$mmcsd.c$117$1_0$332 ==.
	XG$SD_Init$0$0 ==.
	ret
	G$SD_Detect$0$0 ==.
	C$mmcsd.c$124$1_0$337 ==.
;	../src/mmcsd.c: 124: uint8_t SD_Detect(void)
; genLabel
;	-----------------------------------------
;	 function SD_Detect
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 1 bytes.
_SD_Detect:
	push	a
	C$mmcsd.c$126$2_0$337 ==.
;	../src/mmcsd.c: 126: __IO uint8_t status = SD_PRESENT;
; genAssign
	ld	a, #0x01
	ld	(0x01, sp), a
	C$mmcsd.c$136$1_0$337 ==.
;	../src/mmcsd.c: 136: return SD_PRESENT;
; genReturn
	ld	a, #0x01
; genLabel
00101$:
	C$mmcsd.c$138$1_0$337 ==.
;	../src/mmcsd.c: 138: }
; genEndFunction
	addw	sp, #1
	C$mmcsd.c$138$1_0$337 ==.
	XG$SD_Detect$0$0 ==.
	ret
	G$SD_SendCmd$0$0 ==.
	C$mmcsd.c$663$1_0$339 ==.
;	../src/mmcsd.c: 663: void SD_SendCmd(uint8_t Cmd, uint32_t Arg, uint8_t Crc)
; genLabel
;	-----------------------------------------
;	 function SD_SendCmd
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 10 bytes.
_SD_SendCmd:
	sub	sp, #10
	C$mmcsd.c$669$1_0$339 ==.
;	../src/mmcsd.c: 669: Frame[0] = (uint8_t)(Cmd | 0x40); /*!< Construct byte 1 */
; skipping iCode since result will be rematerialized
; genAssign
	ld	a, (0x0d, sp)
; genOr
	or	a, #0x40
; genPointerSet
	ld	(0x01, sp), a
	C$mmcsd.c$671$1_0$339 ==.
;	../src/mmcsd.c: 671: Frame[1] = (uint8_t)(Arg >> 24); /*!< Construct byte 2 */
; genPlus
	ldw	x, sp
	incw	x
	incw	x
; genRightShiftLiteral
	ld	a, (0x0e, sp)
	clrw	y
	clr	(0x07, sp)
; genCast
; genAssign
; genPointerSet
	ld	(x), a
	C$mmcsd.c$673$1_0$339 ==.
;	../src/mmcsd.c: 673: Frame[2] = (uint8_t)(Arg >> 16); /*!< Construct byte 3 */
; genPlus
	ldw	x, sp
	addw	x, #3
; genRightShiftLiteral
	ldw	y, (0x0e, sp)
	clr	a
	clr	(0x07, sp)
; genCast
; genAssign
	ld	a, yl
; genPointerSet
	ld	(x), a
	C$mmcsd.c$675$1_0$339 ==.
;	../src/mmcsd.c: 675: Frame[3] = (uint8_t)(Arg >> 8); /*!< Construct byte 4 */
; genPlus
	ldw	x, sp
	addw	x, #4
; genCast
; genAssign
	ldw	y, (0x10, sp)
; genRightShiftLiteral
	clr	a
; genCast
; genAssign
	ld	a, yh
; genPointerSet
	ld	(x), a
	C$mmcsd.c$677$1_0$339 ==.
;	../src/mmcsd.c: 677: Frame[4] = (uint8_t)(Arg); /*!< Construct byte 5 */
; genPlus
	ldw	x, sp
	addw	x, #5
; genCast
; genAssign
	ld	a, (0x11, sp)
; genPointerSet
	ld	(x), a
	C$mmcsd.c$679$1_0$339 ==.
;	../src/mmcsd.c: 679: Frame[5] = (Crc); /*!< Construct CRC: byte 6 */
; genPlus
	ldw	x, sp
	addw	x, #6
; genPointerSet
	ld	a, (0x12, sp)
	ld	(x), a
	C$mmcsd.c$681$2_0$340 ==.
;	../src/mmcsd.c: 681: for (i = 0; i < 6; i++)
; genAssign
	clrw	x
	clrw	y
; skipping iCode since result will be rematerialized
; genAssign
	ldw	(0x09, sp), x
; genLabel
00102$:
	C$mmcsd.c$683$3_0$341 ==.
;	../src/mmcsd.c: 683: SD_WriteByte(Frame[i]); /*!< Send the Cmd bytes */
; genPlus
	ldw	x, sp
	incw	x
	addw	x, (0x09, sp)
; genPointerGet
	ld	a, (x)
; genIPush
	pushw	y
	push	a
; genCall
	call	_SD_WriteByte
	pop	a
	popw	y
	C$mmcsd.c$681$2_0$340 ==.
;	../src/mmcsd.c: 681: for (i = 0; i < 6; i++)
; genPlus
	ldw	x, (0x09, sp)
	incw	x
	ldw	(0x09, sp), x
	jrne	00112$
	incw	y
00112$:
; genCmp
; genCmpTop
	ldw	x, (0x09, sp)
	cpw	x, #0x0006
	ld	a, yl
	sbc	a, #0x00
	ld	a, yh
	sbc	a, #0x00
	jrnc	00113$
	jp	00102$
00113$:
; skipping generated iCode
; genLabel
00104$:
	C$mmcsd.c$685$2_0$339 ==.
;	../src/mmcsd.c: 685: }
; genEndFunction
	addw	sp, #10
	C$mmcsd.c$685$2_0$339 ==.
	XG$SD_SendCmd$0$0 ==.
	ret
	G$SD_GetDataResponse$0$0 ==.
	C$mmcsd.c$699$2_0$343 ==.
;	../src/mmcsd.c: 699: uint8_t SD_GetDataResponse(void)
; genLabel
;	-----------------------------------------
;	 function SD_GetDataResponse
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 5 bytes.
_SD_GetDataResponse:
	sub	sp, #5
	C$mmcsd.c$701$2_0$343 ==.
;	../src/mmcsd.c: 701: uint32_t i = 0;
; genAssign
	clrw	x
	clrw	y
	C$mmcsd.c$702$2_0$343 ==.
;	../src/mmcsd.c: 702: uint8_t response = 0, rvalue = 0;
; genAssign
	clr	(0x01, sp)
	C$mmcsd.c$704$1_0$343 ==.
;	../src/mmcsd.c: 704: while (i <= 64)
; genAssign
	ldw	(0x04, sp), x
	ldw	(0x02, sp), y
; genLabel
00108$:
; genCmp
; genCmpTop
	ldw	x, #0x0040
	cpw	x, (0x04, sp)
	clr	a
	sbc	a, (0x03, sp)
	clr	a
	sbc	a, (0x02, sp)
	jrnc	00156$
	jp	00111$
00156$:
; skipping generated iCode
	C$mmcsd.c$707$2_0$344 ==.
;	../src/mmcsd.c: 707: response = SD_ReadByte();
; genCall
	call	_SD_ReadByte
; genAssign
	C$mmcsd.c$709$2_0$344 ==.
;	../src/mmcsd.c: 709: response &= 0x1F;
; genAnd
	and	a, #0x1f
	ld	(0x01, sp), a
	C$mmcsd.c$710$2_0$344 ==.
;	../src/mmcsd.c: 710: switch (response)
; genCmpEQorNE
	ld	a, (0x01, sp)
	cp	a, #0x05
	jrne	00158$
	jp	00101$
00158$:
; skipping generated iCode
; genCmpEQorNE
	ld	a, (0x01, sp)
	cp	a, #0x0b
	jrne	00161$
	jp	00102$
00161$:
; skipping generated iCode
; genCmpEQorNE
	ld	a, (0x01, sp)
	cp	a, #0x0d
	jrne	00164$
	jp	00103$
00164$:
; skipping generated iCode
; genGoto
	jp	00104$
	C$mmcsd.c$712$3_0$345 ==.
;	../src/mmcsd.c: 712: case SD_DATA_OK:
; genLabel
00101$:
	C$mmcsd.c$714$4_0$346 ==.
;	../src/mmcsd.c: 714: rvalue = SD_DATA_OK;
; genAssign
	ld	a, #0x05
	C$mmcsd.c$715$4_0$346 ==.
;	../src/mmcsd.c: 715: break;
; genGoto
	jp	00105$
	C$mmcsd.c$717$3_0$345 ==.
;	../src/mmcsd.c: 717: case SD_DATA_CRC_ERROR:
; genLabel
00102$:
	C$mmcsd.c$718$3_0$345 ==.
;	../src/mmcsd.c: 718: return SD_DATA_CRC_ERROR;
; genReturn
	ld	a, #0x0b
	jp	00114$
	C$mmcsd.c$719$3_0$345 ==.
;	../src/mmcsd.c: 719: case SD_DATA_WRITE_ERROR:
; genLabel
00103$:
	C$mmcsd.c$720$3_0$345 ==.
;	../src/mmcsd.c: 720: return SD_DATA_WRITE_ERROR;
; genReturn
	ld	a, #0x0d
	jp	00114$
	C$mmcsd.c$721$3_0$345 ==.
;	../src/mmcsd.c: 721: default:
; genLabel
00104$:
	C$mmcsd.c$723$4_0$347 ==.
;	../src/mmcsd.c: 723: rvalue = SD_DATA_OTHER_ERROR;
; genAssign
	ld	a, #0xff
	C$mmcsd.c$726$2_0$344 ==.
;	../src/mmcsd.c: 726: }
; genLabel
00105$:
	C$mmcsd.c$728$2_0$344 ==.
;	../src/mmcsd.c: 728: if (rvalue == SD_DATA_OK)
; genCmpEQorNE
	cp	a, #0x05
	jrne	00167$
	jp	00111$
00167$:
; skipping generated iCode
	C$mmcsd.c$731$2_0$344 ==.
;	../src/mmcsd.c: 731: i++;
; genPlus
	ldw	x, (0x04, sp)
	incw	x
	ldw	(0x04, sp), x
	jrne	00169$
	ldw	x, (0x02, sp)
	incw	x
	ldw	(0x02, sp), x
00169$:
; genGoto
	jp	00108$
	C$mmcsd.c$735$1_0$343 ==.
;	../src/mmcsd.c: 735: while (SD_ReadByte() == 0);
; genLabel
00111$:
; genCall
	call	_SD_ReadByte
; genIfx
	tnz	a
	jrne	00170$
	jp	00111$
00170$:
	C$mmcsd.c$738$1_0$343 ==.
;	../src/mmcsd.c: 738: return response;
; genReturn
	ld	a, (0x01, sp)
; genLabel
00114$:
	C$mmcsd.c$739$1_0$343 ==.
;	../src/mmcsd.c: 739: }
; genEndFunction
	addw	sp, #5
	C$mmcsd.c$739$1_0$343 ==.
	XG$SD_GetDataResponse$0$0 ==.
	ret
	G$SD_GetResponse$0$0 ==.
	C$mmcsd.c$748$1_0$349 ==.
;	../src/mmcsd.c: 748: uint8_t SD_GetResponse(uint8_t Response)
; genLabel
;	-----------------------------------------
;	 function SD_GetResponse
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 4 bytes.
_SD_GetResponse:
	sub	sp, #4
	C$mmcsd.c$750$2_0$349 ==.
;	../src/mmcsd.c: 750: uint32_t Count = 0xFFF;
; genAssign
	ldw	y, #0x0fff
	clrw	x
	C$mmcsd.c$753$1_0$349 ==.
;	../src/mmcsd.c: 753: while ((SD_ReadByte() != Response) && Count) 
; genAssign
	ldw	(0x03, sp), y
; genLabel
00102$:
; genCall
	pushw	x
	call	_SD_ReadByte
	popw	x
; genCmpEQorNE
	cp	a, (0x07, sp)
	jrne	00132$
	jp	00114$
00132$:
; skipping generated iCode
; genIfx
	ldw	y, (0x03, sp)
	jrne	00134$
	tnzw	x
	jrne	00134$
	jp	00114$
00134$:
	C$mmcsd.c$755$2_0$350 ==.
;	../src/mmcsd.c: 755: Count--;
; genMinus
	ldw	y, (0x03, sp)
	subw	y, #0x0001
	ldw	(0x03, sp), y
	jrnc	00135$
	decw	x
00135$:
; genGoto
	jp	00102$
; genLabel
00114$:
; genAssign
	ldw	y, (0x03, sp)
	C$mmcsd.c$757$1_0$349 ==.
;	../src/mmcsd.c: 757: if (Count == 0)
; genIfx
	tnzw	y
	jrne	00136$
	tnzw	x
	jreq	00137$
00136$:
	jp	00106$
00137$:
	C$mmcsd.c$760$2_0$351 ==.
;	../src/mmcsd.c: 760: return SD_RESPONSE_FAILURE;
; genReturn
	ld	a, #0xff
	jp	00108$
; genLabel
00106$:
	C$mmcsd.c$765$2_0$352 ==.
;	../src/mmcsd.c: 765: return SD_RESPONSE_NO_ERROR;
; genReturn
	clr	a
; genLabel
00108$:
	C$mmcsd.c$767$1_0$349 ==.
;	../src/mmcsd.c: 767: }
; genEndFunction
	addw	sp, #4
	C$mmcsd.c$767$1_0$349 ==.
	XG$SD_GetResponse$0$0 ==.
	ret
	G$SD_GetResponseVal$0$0 ==.
	C$mmcsd.c$772$1_0$354 ==.
;	../src/mmcsd.c: 772: void SD_GetResponseVal(uint8_t *pResp, uint8_t response)
; genLabel
;	-----------------------------------------
;	 function SD_GetResponseVal
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_SD_GetResponseVal:
	C$mmcsd.c$775$1_0$354 ==.
;	../src/mmcsd.c: 775: if(SD_GetResponse(response) == SD_RESPONSE_FAILURE)
; genIPush
	ld	a, (0x05, sp)
	push	a
; genCall
	call	_SD_GetResponse
	addw	sp, #1
	C$mmcsd.c$777$1_0$354 ==.
;	../src/mmcsd.c: 777: *pResp++ = 0xff;
; genAssign
	ldw	y, (0x03, sp)
; genPlus
	ldw	x, y
	incw	x
	C$mmcsd.c$775$1_0$354 ==.
;	../src/mmcsd.c: 775: if(SD_GetResponse(response) == SD_RESPONSE_FAILURE)
; genCmpEQorNE
	inc	a
	jrne	00112$
	jp	00113$
00112$:
	jp	00102$
00113$:
; skipping generated iCode
	C$mmcsd.c$777$2_0$355 ==.
;	../src/mmcsd.c: 777: *pResp++ = 0xff;
; genPointerSet
	ld	a, #0xff
	ld	(y), a
; genAssign
	ldw	(0x03, sp), x
; genGoto
	jp	00103$
; genLabel
00102$:
	C$mmcsd.c$779$2_0$356 ==.
;	../src/mmcsd.c: 779: *pResp++ = response;
; genPointerSet
	ld	a, (0x05, sp)
	ld	(y), a
; genAssign
	ldw	(0x03, sp), x
; genLabel
00103$:
	C$mmcsd.c$782$1_0$354 ==.
;	../src/mmcsd.c: 782: *pResp++ = SD_ReadByte();
; genAssign
	ldw	x, (0x03, sp)
; genCall
	pushw	x
	call	_SD_ReadByte
	popw	x
; genPointerSet
	ld	(x), a
; genPlus
	incw	x
; genAssign
	ldw	(0x03, sp), x
	C$mmcsd.c$783$1_0$354 ==.
;	../src/mmcsd.c: 783: *pResp++ = SD_ReadByte();
; genAssign
	ldw	x, (0x03, sp)
; genCall
	pushw	x
	call	_SD_ReadByte
	popw	x
; genPointerSet
	ld	(x), a
; genPlus
	incw	x
; genAssign
	ldw	(0x03, sp), x
	C$mmcsd.c$784$1_0$354 ==.
;	../src/mmcsd.c: 784: *pResp++ = SD_ReadByte();
; genAssign
	ldw	x, (0x03, sp)
; genCall
	pushw	x
	call	_SD_ReadByte
	popw	x
; genPointerSet
	ld	(x), a
; genPlus
	incw	x
; genAssign
	ldw	(0x03, sp), x
	C$mmcsd.c$785$1_0$354 ==.
;	../src/mmcsd.c: 785: *pResp++ = SD_ReadByte();
; genAssign
	ldw	x, (0x03, sp)
; genCall
	pushw	x
	call	_SD_ReadByte
	popw	x
; genPointerSet
	ld	(x), a
; genPlus
	incw	x
; genAssign
	ldw	(0x03, sp), x
	C$mmcsd.c$786$1_0$354 ==.
;	../src/mmcsd.c: 786: *pResp = SD_ReadByte();
; genAssign
	ldw	x, (0x03, sp)
; genCall
	pushw	x
	call	_SD_ReadByte
	popw	x
; genPointerSet
	ld	(x), a
; genLabel
00104$:
	C$mmcsd.c$787$1_0$354 ==.
;	../src/mmcsd.c: 787: }
; genEndFunction
	C$mmcsd.c$787$1_0$354 ==.
	XG$SD_GetResponseVal$0$0 ==.
	ret
	G$SD_GoIdleState$0$0 ==.
	C$mmcsd.c$871$1_0$358 ==.
;	../src/mmcsd.c: 871: uint8_t SD_GoIdleState(void)
; genLabel
;	-----------------------------------------
;	 function SD_GoIdleState
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 6 bytes.
_SD_GoIdleState:
	sub	sp, #6
	C$mmcsd.c$874$2_0$358 ==.
;	../src/mmcsd.c: 874: uint8_t resp[6] = {0};
; skipping iCode since result will be rematerialized
; genPointerSet
	clr	(0x01, sp)
; genPlus
	ldw	x, sp
	incw	x
	incw	x
; genPointerSet
	clr	(x)
; genPlus
	ldw	x, sp
	addw	x, #3
; genPointerSet
	clr	(x)
; genPlus
	ldw	x, sp
	addw	x, #4
; genPointerSet
	clr	(x)
; genPlus
	ldw	x, sp
	addw	x, #5
; genPointerSet
	clr	(x)
; genPlus
	ldw	x, sp
	addw	x, #6
; genPointerSet
	clr	(x)
	C$mmcsd.c$876$1_0$358 ==.
;	../src/mmcsd.c: 876: SD_CS_LOW();
; genPointerGet
	ld	a, 0x500a
; genAnd
	and	a, #0xef
; genPointerSet
	ld	0x500a, a
	C$mmcsd.c$879$1_0$358 ==.
;	../src/mmcsd.c: 879: SD_SendCmd(SD_CMD_GO_IDLE_STATE, (uint32_t)0, 0x95);
; genIPush
	push	#0x95
; genIPush
	clrw	x
	pushw	x
	clrw	x
	pushw	x
; genIPush
	push	#0x00
; genCall
	call	_SD_SendCmd
	addw	sp, #6
	C$mmcsd.c$882$1_0$358 ==.
;	../src/mmcsd.c: 882: if (SD_GetResponse(SD_IN_IDLE_STATE))
; genIPush
	push	#0x01
; genCall
	call	_SD_GetResponse
	addw	sp, #1
; genIfx
	tnz	a
	jrne	00157$
	jp	00102$
00157$:
	C$mmcsd.c$885$2_0$359 ==.
;	../src/mmcsd.c: 885: return SD_RESPONSE_FAILURE;
; genReturn
	ld	a, #0xff
	jp	00116$
; genLabel
00102$:
	C$mmcsd.c$888$1_0$358 ==.
;	../src/mmcsd.c: 888: SD_SendCmd(SD_CMD_IF_COND, (uint32_t)0x156, 0x43);
; genIPush
	push	#0x43
; genIPush
	push	#0x56
	push	#0x01
	clrw	x
	pushw	x
; genIPush
	push	#0x08
; genCall
	call	_SD_SendCmd
	addw	sp, #6
	C$mmcsd.c$889$1_0$358 ==.
;	../src/mmcsd.c: 889: SD_GetResponseVal(resp,0x01);
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	push	#0x01
; genIPush
	ldw	x, sp
	incw	x
	incw	x
	pushw	x
; genCall
	call	_SD_GetResponseVal
	addw	sp, #3
	C$mmcsd.c$890$1_0$358 ==.
;	../src/mmcsd.c: 890: if(resp[0]==0x01){
; genPointerGet
	ld	a, (0x01, sp)
; genCmpEQorNE
	dec	a
	jrne	00159$
	jp	00160$
00159$:
	jp	00123$
00160$:
; skipping generated iCode
	C$mmcsd.c$892$2_0$360 ==.
;	../src/mmcsd.c: 892: if ((resp[3] == 0x01)&&(resp[4] == 0x56)){
; skipping iCode since result will be rematerialized
; genPointerGet
	ld	a, (0x04, sp)
; genCmpEQorNE
	dec	a
	jrne	00162$
	jp	00163$
00162$:
	jp	00107$
00163$:
; skipping generated iCode
; skipping iCode since result will be rematerialized
; genPointerGet
	ld	a, (0x05, sp)
; genCmpEQorNE
	cp	a, #0x56
	jrne	00165$
	jp	00166$
00165$:
	jp	00107$
00166$:
; skipping generated iCode
	C$mmcsd.c$895$4_0$362 ==.
;	../src/mmcsd.c: 895: do{
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genLabel
00103$:
	C$mmcsd.c$896$4_0$362 ==.
;	../src/mmcsd.c: 896: SD_SendCmd(SD_CMD_55, (uint32_t)0, 0x01);
; genIPush
	push	#0x01
; genIPush
	clrw	x
	pushw	x
	clrw	x
	pushw	x
; genIPush
	push	#0x37
; genCall
	call	_SD_SendCmd
	addw	sp, #6
	C$mmcsd.c$897$4_0$362 ==.
;	../src/mmcsd.c: 897: SD_GetResponseVal(resp,0x01);
; skipping iCode since result will be rematerialized
; genIPush
	push	#0x01
; genIPush
	ldw	x, sp
	incw	x
	incw	x
	pushw	x
; genCall
	call	_SD_GetResponseVal
	addw	sp, #3
	C$mmcsd.c$898$4_0$362 ==.
;	../src/mmcsd.c: 898: dly((uint32_t)10);
; genIPush
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
; genCall
	call	_dly
	addw	sp, #4
	C$mmcsd.c$899$4_0$362 ==.
;	../src/mmcsd.c: 899: SD_SendCmd(SD_ACMD_41&0x7f, (1UL<<30), 0x1);
; genIPush
	push	#0x01
; genIPush
	clrw	x
	pushw	x
	push	#0x00
	push	#0x40
; genIPush
	push	#0x69
; genCall
	call	_SD_SendCmd
	addw	sp, #6
	C$mmcsd.c$900$4_0$362 ==.
;	../src/mmcsd.c: 900: dly((uint32_t)1000);
; genIPush
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
; genCall
	call	_dly
	addw	sp, #4
	C$mmcsd.c$901$4_0$362 ==.
;	../src/mmcsd.c: 901: SD_GetResponseVal(resp,0x00);
; genCast
; genAssign
	ldw	x, sp
	incw	x
; genIPush
	push	#0x00
; genIPush
	pushw	x
; genCall
	call	_SD_GetResponseVal
	addw	sp, #3
	C$mmcsd.c$902$3_0$361 ==.
;	../src/mmcsd.c: 902: } while(resp[0]); //until resved 0x0
; genPointerGet
	ld	a, (0x01, sp)
; genIfx
	tnz	a
	jreq	00167$
	jp	00103$
00167$:
	C$mmcsd.c$904$3_0$361 ==.
;	../src/mmcsd.c: 904: SD_SendCmd(SD_CMD_58, (uint32_t)0,0x01);
; genIPush
	push	#0x01
; genIPush
	clrw	x
	pushw	x
	clrw	x
	pushw	x
; genIPush
	push	#0x3a
; genCall
	call	_SD_SendCmd
	addw	sp, #6
	C$mmcsd.c$905$3_0$361 ==.
;	../src/mmcsd.c: 905: SD_GetResponseVal(resp,58);
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	push	#0x3a
; genIPush
	ldw	x, sp
	incw	x
	incw	x
	pushw	x
; genCall
	call	_SD_GetResponseVal
	addw	sp, #3
	C$mmcsd.c$906$3_0$361 ==.
;	../src/mmcsd.c: 906: return SD_RESPONSE_NO_ERROR;
; genReturn
	clr	a
	jp	00116$
; genLabel
00107$:
	C$mmcsd.c$909$3_0$363 ==.
;	../src/mmcsd.c: 909: return SD_RESPONSE_FAILURE;
; genReturn
	ld	a, #0xff
	jp	00116$
	C$mmcsd.c$914$1_0$358 ==.
;	../src/mmcsd.c: 914: do{
; genLabel
00123$:
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genLabel
00110$:
	C$mmcsd.c$915$3_0$365 ==.
;	../src/mmcsd.c: 915: SD_SendCmd(SD_CMD_55, 0, 0x01);
; genIPush
	push	#0x01
; genIPush
	clrw	x
	pushw	x
	clrw	x
	pushw	x
; genIPush
	push	#0x37
; genCall
	call	_SD_SendCmd
	addw	sp, #6
	C$mmcsd.c$916$3_0$365 ==.
;	../src/mmcsd.c: 916: SD_GetResponseVal(resp,0x01);
; skipping iCode since result will be rematerialized
; genIPush
	push	#0x01
; genIPush
	ldw	x, sp
	incw	x
	incw	x
	pushw	x
; genCall
	call	_SD_GetResponseVal
	addw	sp, #3
	C$mmcsd.c$917$3_0$365 ==.
;	../src/mmcsd.c: 917: dly((uint32_t)1000);
; genIPush
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
; genCall
	call	_dly
	addw	sp, #4
	C$mmcsd.c$918$3_0$365 ==.
;	../src/mmcsd.c: 918: SD_SendCmd(SD_ACMD_41&0x7f, 0UL, 0x1);
; genIPush
	push	#0x01
; genIPush
	clrw	x
	pushw	x
	clrw	x
	pushw	x
; genIPush
	push	#0x69
; genCall
	call	_SD_SendCmd
	addw	sp, #6
	C$mmcsd.c$919$3_0$365 ==.
;	../src/mmcsd.c: 919: SD_GetResponseVal(resp,0x00);
; skipping iCode since result will be rematerialized
; genIPush
	push	#0x00
; genIPush
	ldw	x, sp
	incw	x
	incw	x
	pushw	x
; genCall
	call	_SD_GetResponseVal
	addw	sp, #3
	C$mmcsd.c$920$3_0$365 ==.
;	../src/mmcsd.c: 920: dly((uint32_t)1000);
; genIPush
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
; genCall
	call	_dly
	addw	sp, #4
	C$mmcsd.c$921$2_0$364 ==.
;	../src/mmcsd.c: 921: } while(resp[0]);
; genPointerGet
	ld	a, (0x01, sp)
; genIfx
	tnz	a
	jreq	00168$
	jp	00110$
00168$:
	C$mmcsd.c$926$1_0$358 ==.
;	../src/mmcsd.c: 926: SD_CS_HIGH();
; genPointerGet
	ld	a, 0x500a
; genOr
	or	a, #0x10
; genPointerSet
	ld	0x500a, a
	C$mmcsd.c$929$1_0$358 ==.
;	../src/mmcsd.c: 929: SD_WriteByte(SD_DUMMY_BYTE);
; genIPush
	push	#0xff
; genCall
	call	_SD_WriteByte
	pop	a
	C$mmcsd.c$931$1_0$358 ==.
;	../src/mmcsd.c: 931: return SD_RESPONSE_NO_ERROR;
; genReturn
	clr	a
; genLabel
00116$:
	C$mmcsd.c$932$1_0$358 ==.
;	../src/mmcsd.c: 932: }
; genEndFunction
	addw	sp, #6
	C$mmcsd.c$932$1_0$358 ==.
	XG$SD_GoIdleState$0$0 ==.
	ret
	G$SD_WriteByte$0$0 ==.
	C$mmcsd.c$941$1_0$367 ==.
;	../src/mmcsd.c: 941: uint8_t SD_WriteByte(uint8_t Data)
; genLabel
;	-----------------------------------------
;	 function SD_WriteByte
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_SD_WriteByte:
	C$mmcsd.c$944$1_0$367 ==.
;	../src/mmcsd.c: 944: while (SPI->SR & (SPI_FLAG_TXE) == 0)
; genPointerGet
; Dummy read
	ld	a, 0x5203
	C$mmcsd.c$948$1_0$367 ==.
;	../src/mmcsd.c: 948: SPI->DR = (Data);
; genPointerSet
	ldw	x, #0x5204
	ld	a, (0x03, sp)
	ld	(x), a
	C$mmcsd.c$951$1_0$367 ==.
;	../src/mmcsd.c: 951: while (SPI->SR & (SPI_FLAG_RXNE) == 0)
; genPointerGet
; Dummy read
	ld	a, 0x5203
	C$mmcsd.c$955$1_0$367 ==.
;	../src/mmcsd.c: 955: return SPI->DR;
; genPointerGet
	ld	a, 0x5204
; genReturn
; genLabel
00107$:
	C$mmcsd.c$956$1_0$367 ==.
;	../src/mmcsd.c: 956: }
; genEndFunction
	C$mmcsd.c$956$1_0$367 ==.
	XG$SD_WriteByte$0$0 ==.
	ret
	G$SD_ReadByte$0$0 ==.
	C$mmcsd.c$963$1_0$371 ==.
;	../src/mmcsd.c: 963: uint8_t SD_ReadByte(void)
; genLabel
;	-----------------------------------------
;	 function SD_ReadByte
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_SD_ReadByte:
	C$mmcsd.c$968$1_0$371 ==.
;	../src/mmcsd.c: 968: while (SPI->SR&(SPI_FLAG_TXE) == 0)
; genPointerGet
; Dummy read
	ld	a, 0x5203
	C$mmcsd.c$971$1_0$371 ==.
;	../src/mmcsd.c: 971: SPI->DR = SD_DUMMY_BYTE;
; genPointerSet
	mov	0x5204+0, #0xff
	C$mmcsd.c$974$1_0$371 ==.
;	../src/mmcsd.c: 974: while (SPI->SR&(SPI_FLAG_RXNE) == 0)
; genPointerGet
; Dummy read
	ld	a, 0x5203
	C$mmcsd.c$977$1_0$371 ==.
;	../src/mmcsd.c: 977: Data = (uint8_t)SPI->DR;
; genPointerGet
	ld	a, 0x5204
	C$mmcsd.c$980$1_0$371 ==.
;	../src/mmcsd.c: 980: return Data;
; genReturn
; genLabel
00107$:
	C$mmcsd.c$981$1_0$371 ==.
;	../src/mmcsd.c: 981: }
; genEndFunction
	C$mmcsd.c$981$1_0$371 ==.
	XG$SD_ReadByte$0$0 ==.
	ret
	G$SD_LowLevel_Init$0$0 ==.
	C$mmcsd.c$1025$1_0$375 ==.
;	../src/mmcsd.c: 1025: void SD_LowLevel_Init(void)
; genLabel
;	-----------------------------------------
;	 function SD_LowLevel_Init
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_SD_LowLevel_Init:
	C$mmcsd.c$1035$1_0$375 ==.
;	../src/mmcsd.c: 1035: SPI->CR1 = SPI_FIRSTBIT_MSB | SPI_BAUDRATEPRESCALER_64|SPI_CLOCKPOLARITY_HIGH | SPI_CLOCKPHASE_2EDGE;
; genPointerSet
	mov	0x5200+0, #0x2b
	C$mmcsd.c$1037$1_0$375 ==.
;	../src/mmcsd.c: 1037: SPI->CR2 = SPI_DATADIRECTION_2LINES_FULLDUPLEX|SPI_NSS_SOFT|SPI_CR2_SSI;
; genPointerSet
	mov	0x5201+0, #0x03
	C$mmcsd.c$1039$1_0$375 ==.
;	../src/mmcsd.c: 1039: SPI->CR1 |= SPI_MODE_MASTER;
; genPointerGet
	ld	a, 0x5200
; genOr
	or	a, #0x04
; genPointerSet
	ld	0x5200, a
	C$mmcsd.c$1041$1_0$375 ==.
;	../src/mmcsd.c: 1041: SPI->CRCPR = 0x07;
; genPointerSet
	mov	0x5205+0, #0x07
	C$mmcsd.c$1044$1_0$375 ==.
;	../src/mmcsd.c: 1044: SPI->CR1 |= SPI_CR1_SPE;
; genPointerGet
	ld	a, 0x5200
; genOr
	or	a, #0x40
; genPointerSet
	ld	0x5200, a
	C$mmcsd.c$1048$1_0$375 ==.
;	../src/mmcsd.c: 1048: SD_CS_GPIO_PORT->CR2 &= (~SD_CS_PIN); //Reset corresponding bit
; genPointerGet
	ld	a, 0x500e
; genAnd
	and	a, #0xef
; genPointerSet
	ld	0x500e, a
	C$mmcsd.c$1049$1_0$375 ==.
;	../src/mmcsd.c: 1049: SD_CS_GPIO_PORT->ODR |= SD_CS_PIN; // high level
; genPointerGet
	ld	a, 0x500a
; genOr
	or	a, #0x10
; genPointerSet
	ld	0x500a, a
	C$mmcsd.c$1050$1_0$375 ==.
;	../src/mmcsd.c: 1050: SD_CS_GPIO_PORT->DDR |= SD_CS_PIN; // output mode 
; genPointerGet
	ld	a, 0x500c
; genOr
	or	a, #0x10
; genPointerSet
	ld	0x500c, a
	C$mmcsd.c$1051$1_0$375 ==.
;	../src/mmcsd.c: 1051: SD_CS_GPIO_PORT->CR1 &= ~SD_CS_PIN; //open drain here
; genPointerGet
	ld	a, 0x500d
; genAnd
	and	a, #0xef
; genPointerSet
	ld	0x500d, a
; genLabel
00101$:
	C$mmcsd.c$1052$1_0$375 ==.
;	../src/mmcsd.c: 1052: }
; genEndFunction
	C$mmcsd.c$1052$1_0$375 ==.
	XG$SD_LowLevel_Init$0$0 ==.
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
