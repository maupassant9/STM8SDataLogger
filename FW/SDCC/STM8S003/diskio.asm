;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Linux)
;--------------------------------------------------------
	.module diskio
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SD_ReadByte
	.globl _SD_WriteByte
	.globl _SD_GetDataResponse
	.globl _SD_GetResponse
	.globl _SD_SendCmd
	.globl _SD_Detect
	.globl _SD_Init
	.globl _dly
	.globl _disk_initialize
	.globl _disk_readp
	.globl _disk_writep
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
Ldiskio.disk_writep$byteLeft$1_0$355==.
_disk_writep_byteLeft_65536_355:
	.ds 4
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
	G$disk_writep$0$0 ==.
	C$diskio.c$95$1_0$355 ==.
;	../src/diskio.c: 95: static uint32_t byteLeft = 512;
; genAssign
	ldw	x, #0x0200
	ldw	_disk_writep_byteLeft_65536_355+2, x
	clrw	x
	ldw	_disk_writep_byteLeft_65536_355+0, x
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
	G$disk_initialize$0$0 ==.
	C$diskio.c$13$0_0$341 ==.
;	../src/diskio.c: 13: DSTATUS disk_initialize ()
; genLabel
;	-----------------------------------------
;	 function disk_initialize
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_disk_initialize:
	C$diskio.c$16$1_0$341 ==.
;	../src/diskio.c: 16: if(SD_Detect() == SD_NOT_PRESENT)
; genCall
	call	_SD_Detect
; genIfx
	tnz	a
	jreq	00118$
	jp	00102$
00118$:
	C$diskio.c$17$1_0$341 ==.
;	../src/diskio.c: 17: return STA_NODISK;
; genReturn
	ld	a, #0x02
	jp	00106$
; genLabel
00102$:
	C$diskio.c$18$1_0$341 ==.
;	../src/diskio.c: 18: if(SD_Init() == SD_RESPONSE_FAILURE){
; genCall
	call	_SD_Init
; genCmpEQorNE
	inc	a
	jrne	00120$
	jp	00121$
00120$:
	jp	00104$
00121$:
; skipping generated iCode
	C$diskio.c$19$2_0$342 ==.
;	../src/diskio.c: 19: return STA_NOINIT;
; genReturn
	ld	a, #0x01
	jp	00106$
; genLabel
00104$:
	C$diskio.c$21$2_0$343 ==.
;	../src/diskio.c: 21: return 0;
; genReturn
	clr	a
; genLabel
00106$:
	C$diskio.c$23$1_0$341 ==.
;	../src/diskio.c: 23: }
; genEndFunction
	C$diskio.c$23$1_0$341 ==.
	XG$disk_initialize$0$0 ==.
	ret
	G$disk_readp$0$0 ==.
	C$diskio.c$31$1_0$345 ==.
;	../src/diskio.c: 31: DRESULT disk_readp (
; genLabel
;	-----------------------------------------
;	 function disk_readp
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 12 bytes.
_disk_readp:
	sub	sp, #12
	C$diskio.c$38$2_0$345 ==.
;	../src/diskio.c: 38: DRESULT res = RES_ERROR;
; genAssign
	ld	a, #0x01
	ld	(0x0b, sp), a
	C$diskio.c$41$1_0$345 ==.
;	../src/diskio.c: 41: SD_CS_LOW();
; genPointerGet
	ld	a, 0x500a
; genAnd
	and	a, #0xef
; genPointerSet
	ld	0x500a, a
	C$diskio.c$44$1_0$345 ==.
;	../src/diskio.c: 44: SD_SendCmd(SD_CMD_READ_SINGLE_BLOCK, sector, 0xFF);
; genIPush
	push	#0xff
; genIPush
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
; genIPush
	push	#0x11
; genCall
	call	_SD_SendCmd
	addw	sp, #6
	C$diskio.c$47$1_0$345 ==.
;	../src/diskio.c: 47: if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
; genIPush
	push	#0x00
; genCall
	call	_SD_GetResponse
	addw	sp, #1
	ld	(0x0c, sp), a
; genIfx
	tnz	(0x0c, sp)
	jreq	00162$
	jp	00107$
00162$:
	C$diskio.c$50$2_0$346 ==.
;	../src/diskio.c: 50: if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
; genIPush
	push	#0xfe
; genCall
	call	_SD_GetResponse
	addw	sp, #1
; genIfx
	tnz	a
	jreq	00163$
	jp	00107$
00163$:
	C$diskio.c$53$4_0$348 ==.
;	../src/diskio.c: 53: for(i = 0; i < offset; i++){
; genAssign
	clrw	x
	clrw	y
; genAssign
	ldw	(0x0b, sp), x
	ldw	(0x09, sp), y
; genLabel
00109$:
; genCast
; genAssign
	ldw	y, (0x15, sp)
	ldw	(0x07, sp), y
	clr	(0x06, sp)
	clr	(0x05, sp)
; genCmp
; genCmpTop
	ldw	x, (0x0b, sp)
	cpw	x, (0x07, sp)
	ld	a, (0x0a, sp)
	sbc	a, (0x06, sp)
	ld	a, (0x09, sp)
	sbc	a, (0x05, sp)
	jrc	00164$
	jp	00127$
00164$:
; skipping generated iCode
	C$diskio.c$54$5_0$349 ==.
;	../src/diskio.c: 54: SD_ReadByte();
; genCall
	call	_SD_ReadByte
	C$diskio.c$53$4_0$348 ==.
;	../src/diskio.c: 53: for(i = 0; i < offset; i++){
; genPlus
	ldw	x, (0x0b, sp)
	incw	x
	ldw	(0x0b, sp), x
	jrne	00165$
	ldw	x, (0x09, sp)
	incw	x
	ldw	(0x09, sp), x
00165$:
; genGoto
	jp	00109$
; genLabel
00127$:
; genAssign
	ldw	x, (0x0b, sp)
; genPlus
	ldw	y, (0x15, sp)
	addw	y, (0x17, sp)
	ldw	(0x01, sp), y
; genAssign
	ldw	y, (0x0f, sp)
	ldw	(0x07, sp), y
; genAssign
	ldw	(0x0b, sp), x
	ldw	y, (0x09, sp)
; genLabel
00112$:
	C$diskio.c$56$4_0$350 ==.
;	../src/diskio.c: 56: for (; i < offset+count; i++)
; genCast
; genAssign
	ldw	x, (0x01, sp)
	ldw	(0x05, sp), x
	clr	(0x04, sp)
	clr	(0x03, sp)
; genCmp
; genCmpTop
	ldw	x, (0x0b, sp)
	cpw	x, (0x05, sp)
	ld	a, yl
	sbc	a, (0x04, sp)
	ld	a, yh
	sbc	a, (0x03, sp)
	jrc	00166$
	jp	00128$
00166$:
; skipping generated iCode
	C$diskio.c$59$5_0$351 ==.
;	../src/diskio.c: 59: *buff = SD_ReadByte();
; genCall
	pushw	y
	call	_SD_ReadByte
	popw	y
; genPointerSet
	ldw	x, (0x07, sp)
	ld	(x), a
	C$diskio.c$62$5_0$351 ==.
;	../src/diskio.c: 62: buff++;
; genPlus
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x07, sp), x
00167$:
	C$diskio.c$56$4_0$350 ==.
;	../src/diskio.c: 56: for (; i < offset+count; i++)
; genPlus
	ldw	x, (0x0b, sp)
	incw	x
	ldw	(0x0b, sp), x
	jrne	00168$
	incw	y
00168$:
; genGoto
	jp	00112$
; genLabel
00128$:
; genAssign
	ldw	x, (0x0b, sp)
; genAssign
; genLabel
00115$:
	C$diskio.c$64$4_0$352 ==.
;	../src/diskio.c: 64: for(;i < 512; i++){
; genCmp
; genCmpTop
	cpw	x, #0x0200
	ld	a, yl
	sbc	a, #0x00
	ld	a, yh
	sbc	a, #0x00
	jrc	00169$
	jp	00103$
00169$:
; skipping generated iCode
	C$diskio.c$65$5_0$353 ==.
;	../src/diskio.c: 65: SD_ReadByte();
; genCall
	pushw	x
	pushw	y
	call	_SD_ReadByte
	popw	y
	popw	x
	C$diskio.c$64$4_0$352 ==.
;	../src/diskio.c: 64: for(;i < 512; i++){
; genPlus
	incw	x
	jrne	00170$
	incw	y
00170$:
; genGoto
	jp	00115$
; genLabel
00103$:
	C$diskio.c$68$3_0$347 ==.
;	../src/diskio.c: 68: SD_ReadByte();
; genCall
	call	_SD_ReadByte
	C$diskio.c$69$3_0$347 ==.
;	../src/diskio.c: 69: SD_ReadByte();
; genCall
	call	_SD_ReadByte
	C$diskio.c$71$3_0$347 ==.
;	../src/diskio.c: 71: res = RES_OK;
; genAssign
	clr	(0x0b, sp)
; genLabel
00107$:
	C$diskio.c$75$1_0$345 ==.
;	../src/diskio.c: 75: SD_CS_HIGH();
; genPointerGet
	ld	a, 0x500a
; genOr
	or	a, #0x10
; genPointerSet
	ld	0x500a, a
	C$diskio.c$78$1_0$345 ==.
;	../src/diskio.c: 78: SD_WriteByte(SD_DUMMY_BYTE);
; genIPush
	push	#0xff
; genCall
	call	_SD_WriteByte
	pop	a
	C$diskio.c$81$1_0$345 ==.
;	../src/diskio.c: 81: return res;
; genReturn
	ld	a, (0x0b, sp)
; genLabel
00117$:
	C$diskio.c$82$1_0$345 ==.
;	../src/diskio.c: 82: }
; genEndFunction
	addw	sp, #12
	C$diskio.c$82$1_0$345 ==.
	XG$disk_readp$0$0 ==.
	ret
	G$disk_writep$0$0 ==.
	C$diskio.c$90$1_0$355 ==.
;	../src/diskio.c: 90: DRESULT disk_writep (
; genLabel
;	-----------------------------------------
;	 function disk_writep
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 6 bytes.
_disk_writep:
	sub	sp, #6
	C$diskio.c$97$2_0$355 ==.
;	../src/diskio.c: 97: DRESULT res = RES_ERROR;
; genAssign
	ld	a, #0x01
	ld	(0x02, sp), a
	C$diskio.c$99$1_0$355 ==.
;	../src/diskio.c: 99: if (!buff) {
; genIfx
	ldw	x, (0x09, sp)
	jreq	00193$
	jp	00139$
00193$:
	C$diskio.c$100$2_0$356 ==.
;	../src/diskio.c: 100: if (sc) {
; genIfx
	ldw	x, (0x0d, sp)
	jrne	00194$
	ldw	x, (0x0b, sp)
	jrne	00194$
	jp	00103$
00194$:
	C$diskio.c$102$3_0$357 ==.
;	../src/diskio.c: 102: SD_CS_LOW();
; genPointerGet
	ld	a, 0x500a
; genAnd
	and	a, #0xef
; genPointerSet
	ld	0x500a, a
	C$diskio.c$104$3_0$357 ==.
;	../src/diskio.c: 104: SD_SendCmd(SD_CMD_WRITE_SINGLE_BLOCK, sc, 0xFF);
; genIPush
	push	#0xff
; genIPush
	ldw	x, (0x0e, sp)
	pushw	x
	ldw	x, (0x0e, sp)
	pushw	x
; genIPush
	push	#0x18
; genCall
	call	_SD_SendCmd
	addw	sp, #6
	C$diskio.c$107$3_0$357 ==.
;	../src/diskio.c: 107: if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
; genIPush
	push	#0x00
; genCall
	call	_SD_GetResponse
	addw	sp, #1
; genIfx
	tnz	a
	jreq	00195$
	jp	00120$
00195$:
	C$diskio.c$110$4_0$358 ==.
;	../src/diskio.c: 110: SD_WriteByte(SD_DUMMY_BYTE);
; genIPush
	push	#0xff
; genCall
	call	_SD_WriteByte
	pop	a
	C$diskio.c$112$4_0$358 ==.
;	../src/diskio.c: 112: SD_WriteByte(0xFE);
; genIPush
	push	#0xfe
; genCall
	call	_SD_WriteByte
	pop	a
	C$diskio.c$113$4_0$358 ==.
;	../src/diskio.c: 113: byteLeft = 512;
; genAssign
	ldw	x, #0x0200
	ldw	_disk_writep_byteLeft_65536_355+2, x
	clrw	x
	ldw	_disk_writep_byteLeft_65536_355+0, x
	C$diskio.c$114$4_0$358 ==.
;	../src/diskio.c: 114: res =  RES_OK;
; genAssign
	clr	(0x02, sp)
; genGoto
	jp	00120$
	C$diskio.c$118$3_0$359 ==.
;	../src/diskio.c: 118: while((byteLeft--)) {
; genLabel
00103$:
; genAssign
	ldw	x, _disk_writep_byteLeft_65536_355+2
	ldw	(0x05, sp), x
	ldw	x, _disk_writep_byteLeft_65536_355+0
	ldw	(0x03, sp), x
; genMinus
	ldw	x, _disk_writep_byteLeft_65536_355+2
	subw	x, #0x0001
	ldw	y, _disk_writep_byteLeft_65536_355+0
	jrnc	00196$
	decw	y
00196$:
; genAssign
	ldw	_disk_writep_byteLeft_65536_355+2, x
	ldw	_disk_writep_byteLeft_65536_355+0, y
; genIfx
	ldw	x, (0x05, sp)
	jrne	00197$
	ldw	x, (0x03, sp)
	jrne	00197$
	jp	00105$
00197$:
	C$diskio.c$119$4_0$360 ==.
;	../src/diskio.c: 119: SD_WriteByte(0);
; genIPush
	push	#0x00
; genCall
	call	_SD_WriteByte
	pop	a
; genGoto
	jp	00103$
; genLabel
00105$:
	C$diskio.c$122$3_0$359 ==.
;	../src/diskio.c: 122: SD_WriteByte(0);
; genIPush
	push	#0x00
; genCall
	call	_SD_WriteByte
	pop	a
	C$diskio.c$123$3_0$359 ==.
;	../src/diskio.c: 123: SD_WriteByte(0);
; genIPush
	push	#0x00
; genCall
	call	_SD_WriteByte
	pop	a
	C$diskio.c$126$3_0$359 ==.
;	../src/diskio.c: 126: if (SD_GetDataResponse() == SD_DATA_OK){
; genCall
	call	_SD_GetDataResponse
; genCmpEQorNE
	cp	a, #0x05
	jrne	00199$
	jp	00200$
00199$:
	jp	00110$
00200$:
; skipping generated iCode
	C$diskio.c$127$5_0$362 ==.
;	../src/diskio.c: 127: for (byteLeft = 5000;
; genAssign
	ldw	x, #0x1388
	ldw	_disk_writep_byteLeft_65536_355+2, x
	clrw	x
	ldw	_disk_writep_byteLeft_65536_355+0, x
; genLabel
00123$:
	C$diskio.c$128$5_0$362 ==.
;	../src/diskio.c: 128: (SD_ReadByte() != 0xFF) && byteLeft;
; genCall
	call	_SD_ReadByte
; genCmpEQorNE
	inc	a
	jrne	00202$
	jp	00106$
00202$:
; skipping generated iCode
; genIfx
	ldw	x, _disk_writep_byteLeft_65536_355+2
	jrne	00204$
	ldw	x, _disk_writep_byteLeft_65536_355+0
	jrne	00204$
	jp	00106$
00204$:
	C$diskio.c$130$6_0$363 ==.
;	../src/diskio.c: 130: dly(1);
; genIPush
	push	#0x01
	clrw	x
	pushw	x
	push	#0x00
; genCall
	call	_dly
	addw	sp, #4
	C$diskio.c$129$5_0$362 ==.
;	../src/diskio.c: 129: byteLeft--) {	/* Wait for ready */
; genMinus
	ldw	x, _disk_writep_byteLeft_65536_355+2
	subw	x, #0x0001
	ldw	y, _disk_writep_byteLeft_65536_355+0
	jrnc	00205$
	decw	y
00205$:
; genAssign
	ldw	_disk_writep_byteLeft_65536_355+2, x
	ldw	_disk_writep_byteLeft_65536_355+0, y
; genGoto
	jp	00123$
; genLabel
00106$:
	C$diskio.c$132$4_0$361 ==.
;	../src/diskio.c: 132: if(byteLeft) res = RES_OK;
; genIfx
	ldw	x, _disk_writep_byteLeft_65536_355+2
	jrne	00206$
	ldw	x, _disk_writep_byteLeft_65536_355+0
	jrne	00206$
	jp	00110$
00206$:
; genAssign
	clr	(0x02, sp)
; genLabel
00110$:
	C$diskio.c$136$3_0$359 ==.
;	../src/diskio.c: 136: SD_CS_HIGH();
; genPointerGet
	ld	a, 0x500a
; genOr
	or	a, #0x10
; genPointerSet
	ld	0x500a, a
	C$diskio.c$138$3_0$359 ==.
;	../src/diskio.c: 138: SD_WriteByte(SD_DUMMY_BYTE);
; genIPush
	push	#0xff
; genCall
	call	_SD_WriteByte
	pop	a
; genGoto
	jp	00120$
	C$diskio.c$143$1_0$355 ==.
;	../src/diskio.c: 143: while((byteLeft)&&(sc))
; genLabel
00139$:
; genAssign
	ldw	y, (0x09, sp)
	ldw	(0x01, sp), y
; genAssign
	ldw	y, (0x0d, sp)
	ldw	(0x05, sp), y
	ldw	y, (0x0b, sp)
	ldw	(0x03, sp), y
; genLabel
00115$:
; genIfx
	ldw	x, _disk_writep_byteLeft_65536_355+2
	jrne	00207$
	ldw	x, _disk_writep_byteLeft_65536_355+0
	jrne	00207$
	jp	00117$
00207$:
; genIfx
	ldw	x, (0x05, sp)
	jrne	00208$
	ldw	x, (0x03, sp)
	jrne	00208$
	jp	00117$
00208$:
	C$diskio.c$146$3_0$365 ==.
;	../src/diskio.c: 146: SD_WriteByte(*buff);
; genPointerGet
	ldw	x, (0x01, sp)
	ld	a, (x)
; genIPush
	push	a
; genCall
	call	_SD_WriteByte
	pop	a
	C$diskio.c$148$3_0$365 ==.
;	../src/diskio.c: 148: buff++;byteLeft--;sc--;
; genPlus
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
00209$:
; genMinus
	ldw	x, _disk_writep_byteLeft_65536_355+2
	subw	x, #0x0001
	ldw	y, _disk_writep_byteLeft_65536_355+0
	jrnc	00210$
	decw	y
00210$:
; genAssign
	ldw	_disk_writep_byteLeft_65536_355+2, x
	ldw	_disk_writep_byteLeft_65536_355+0, y
; genMinus
	ldw	x, (0x05, sp)
	subw	x, #0x0001
	ldw	(0x05, sp), x
	ldw	x, (0x03, sp)
	jrnc	00211$
	decw	x
00211$:
	ldw	(0x03, sp), x
; genGoto
	jp	00115$
; genLabel
00117$:
	C$diskio.c$150$2_0$364 ==.
;	../src/diskio.c: 150: res = RES_OK;
; genAssign
	clr	(0x02, sp)
; genLabel
00120$:
	C$diskio.c$153$1_0$355 ==.
;	../src/diskio.c: 153: return res;
; genReturn
	ld	a, (0x02, sp)
; genLabel
00125$:
	C$diskio.c$154$1_0$355 ==.
;	../src/diskio.c: 154: }
; genEndFunction
	addw	sp, #6
	C$diskio.c$154$1_0$355 ==.
	XG$disk_writep$0$0 ==.
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
