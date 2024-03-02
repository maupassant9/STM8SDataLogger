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
;	../src/diskio.c: 95: static uint32_t byteLeft = 512;
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
;	../src/diskio.c: 13: DSTATUS disk_initialize ()
;	-----------------------------------------
;	 function disk_initialize
;	-----------------------------------------
_disk_initialize:
;	../src/diskio.c: 16: if(SD_Detect() == SD_NOT_PRESENT)
	call	_SD_Detect
	tnz	a
	jrne	00102$
;	../src/diskio.c: 17: return STA_NODISK;
	ld	a, #0x02
	ret
00102$:
;	../src/diskio.c: 18: if(SD_Init() == SD_RESPONSE_FAILURE){
	call	_SD_Init
	inc	a
	jrne	00104$
;	../src/diskio.c: 19: return STA_NOINIT;
	ld	a, #0x01
	ret
00104$:
;	../src/diskio.c: 21: return 0;
	clr	a
;	../src/diskio.c: 23: }
	ret
;	../src/diskio.c: 31: DRESULT disk_readp (
;	-----------------------------------------
;	 function disk_readp
;	-----------------------------------------
_disk_readp:
	sub	sp, #12
;	../src/diskio.c: 38: DRESULT res = RES_ERROR;
	ld	a, #0x01
	ld	(0x0b, sp), a
;	../src/diskio.c: 41: SD_CS_LOW();
	ld	a, 0x500a
	and	a, #0xef
	ld	0x500a, a
;	../src/diskio.c: 44: SD_SendCmd(SD_CMD_READ_SINGLE_BLOCK, sector, 0xFF);
	push	#0xff
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	push	#0x11
	call	_SD_SendCmd
	addw	sp, #6
;	../src/diskio.c: 47: if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
	push	#0x00
	call	_SD_GetResponse
	addw	sp, #1
	ld	(0x0c, sp), a
	jreq	00162$
	jp	00107$
00162$:
;	../src/diskio.c: 50: if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
	push	#0xfe
	call	_SD_GetResponse
	addw	sp, #1
	tnz	a
	jreq	00163$
	jp	00107$
00163$:
;	../src/diskio.c: 53: for(i = 0; i < offset; i++){
	clrw	x
	ldw	(0x0b, sp), x
	ldw	(0x09, sp), x
00109$:
	ldw	y, (0x15, sp)
	ldw	(0x07, sp), y
	clr	(0x06, sp)
	clr	(0x05, sp)
	ldw	x, (0x0b, sp)
	cpw	x, (0x07, sp)
	ld	a, (0x0a, sp)
	sbc	a, (0x06, sp)
	ld	a, (0x09, sp)
	sbc	a, (0x05, sp)
	jrnc	00124$
;	../src/diskio.c: 54: SD_ReadByte();
	call	_SD_ReadByte
;	../src/diskio.c: 53: for(i = 0; i < offset; i++){
	ldw	x, (0x0b, sp)
	incw	x
	ldw	(0x0b, sp), x
	jrne	00109$
	ldw	x, (0x09, sp)
	incw	x
	ldw	(0x09, sp), x
	jra	00109$
00124$:
	ldw	x, (0x15, sp)
	addw	x, (0x17, sp)
	ldw	(0x05, sp), x
	ldw	y, (0x0f, sp)
	ldw	(0x07, sp), y
00112$:
;	../src/diskio.c: 56: for (; i < offset+count; i++)
	ldw	y, (0x05, sp)
	ldw	(0x03, sp), y
	clr	(0x02, sp)
	clr	(0x01, sp)
	ldw	x, (0x0b, sp)
	cpw	x, (0x03, sp)
	ld	a, (0x0a, sp)
	sbc	a, (0x02, sp)
	ld	a, (0x09, sp)
	sbc	a, (0x01, sp)
	jrnc	00126$
;	../src/diskio.c: 59: *buff = SD_ReadByte();
	call	_SD_ReadByte
	ldw	x, (0x07, sp)
	ld	(x), a
;	../src/diskio.c: 62: buff++;
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x07, sp), x
;	../src/diskio.c: 56: for (; i < offset+count; i++)
	ldw	x, (0x0b, sp)
	incw	x
	ldw	(0x0b, sp), x
	jrne	00112$
	ldw	x, (0x09, sp)
	incw	x
	ldw	(0x09, sp), x
	jra	00112$
00126$:
	ldw	y, (0x0b, sp)
	ldw	x, (0x09, sp)
00115$:
;	../src/diskio.c: 64: for(;i < 512; i++){
	cpw	y, #0x0200
	ld	a, xl
	sbc	a, #0x00
	ld	a, xh
	sbc	a, #0x00
	jrnc	00103$
;	../src/diskio.c: 65: SD_ReadByte();
	pushw	x
	pushw	y
	call	_SD_ReadByte
	popw	y
	popw	x
;	../src/diskio.c: 64: for(;i < 512; i++){
	incw	y
	jrne	00115$
	incw	x
	jra	00115$
00103$:
;	../src/diskio.c: 68: SD_ReadByte();
	call	_SD_ReadByte
;	../src/diskio.c: 69: SD_ReadByte();
	call	_SD_ReadByte
;	../src/diskio.c: 71: res = RES_OK;
	clr	(0x0b, sp)
00107$:
;	../src/diskio.c: 75: SD_CS_HIGH();
	bset	20490, #4
;	../src/diskio.c: 78: SD_WriteByte(SD_DUMMY_BYTE);
	push	#0xff
	call	_SD_WriteByte
	pop	a
;	../src/diskio.c: 81: return res;
	ld	a, (0x0b, sp)
;	../src/diskio.c: 82: }
	addw	sp, #12
	ret
;	../src/diskio.c: 90: DRESULT disk_writep (
;	-----------------------------------------
;	 function disk_writep
;	-----------------------------------------
_disk_writep:
	sub	sp, #6
;	../src/diskio.c: 97: DRESULT res = RES_ERROR;
	ld	a, #0x01
	ld	(0x02, sp), a
;	../src/diskio.c: 99: if (!buff) {
	ldw	x, (0x09, sp)
	jreq	00193$
	jp	00139$
00193$:
;	../src/diskio.c: 100: if (sc) {
	ldw	x, (0x0d, sp)
	jrne	00194$
	ldw	x, (0x0b, sp)
	jreq	00103$
00194$:
;	../src/diskio.c: 102: SD_CS_LOW();
	ld	a, 0x500a
	and	a, #0xef
	ld	0x500a, a
;	../src/diskio.c: 104: SD_SendCmd(SD_CMD_WRITE_SINGLE_BLOCK, sc, 0xFF);
	push	#0xff
	ldw	x, (0x0e, sp)
	pushw	x
	ldw	x, (0x0e, sp)
	pushw	x
	push	#0x18
	call	_SD_SendCmd
	addw	sp, #6
;	../src/diskio.c: 107: if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
	push	#0x00
	call	_SD_GetResponse
	addw	sp, #1
	tnz	a
	jreq	00195$
	jp	00120$
00195$:
;	../src/diskio.c: 110: SD_WriteByte(SD_DUMMY_BYTE);
	push	#0xff
	call	_SD_WriteByte
	pop	a
;	../src/diskio.c: 112: SD_WriteByte(0xFE);
	push	#0xfe
	call	_SD_WriteByte
	pop	a
;	../src/diskio.c: 113: byteLeft = 512;
	ldw	x, #0x0200
	ldw	_disk_writep_byteLeft_65536_355+2, x
	clrw	x
	ldw	_disk_writep_byteLeft_65536_355+0, x
;	../src/diskio.c: 114: res =  RES_OK;
	clr	(0x02, sp)
	jp	00120$
;	../src/diskio.c: 118: while((byteLeft--)) {
00103$:
	ldw	x, _disk_writep_byteLeft_65536_355+2
	ldw	(0x05, sp), x
	ldw	x, _disk_writep_byteLeft_65536_355+0
	ldw	(0x03, sp), x
	ldw	x, _disk_writep_byteLeft_65536_355+2
	subw	x, #0x0001
	ldw	y, _disk_writep_byteLeft_65536_355+0
	jrnc	00196$
	decw	y
00196$:
	ldw	_disk_writep_byteLeft_65536_355+2, x
	ldw	_disk_writep_byteLeft_65536_355+0, y
	ldw	x, (0x05, sp)
	jrne	00197$
	ldw	x, (0x03, sp)
	jreq	00105$
00197$:
;	../src/diskio.c: 119: SD_WriteByte(0);
	push	#0x00
	call	_SD_WriteByte
	pop	a
	jra	00103$
00105$:
;	../src/diskio.c: 122: SD_WriteByte(0);
	push	#0x00
	call	_SD_WriteByte
	pop	a
;	../src/diskio.c: 123: SD_WriteByte(0);
	push	#0x00
	call	_SD_WriteByte
	pop	a
;	../src/diskio.c: 126: if (SD_GetDataResponse() == SD_DATA_OK){
	call	_SD_GetDataResponse
	cp	a, #0x05
	jrne	00110$
;	../src/diskio.c: 127: for (byteLeft = 5000;
	ldw	x, #0x1388
	ldw	_disk_writep_byteLeft_65536_355+2, x
	clrw	x
	ldw	_disk_writep_byteLeft_65536_355+0, x
00123$:
;	../src/diskio.c: 128: (SD_ReadByte() != 0xFF) && byteLeft;
	call	_SD_ReadByte
	inc	a
	jreq	00106$
	ldw	x, _disk_writep_byteLeft_65536_355+2
	jrne	00204$
	ldw	x, _disk_writep_byteLeft_65536_355+0
	jreq	00106$
00204$:
;	../src/diskio.c: 130: dly(1);
	push	#0x01
	clrw	x
	pushw	x
	push	#0x00
	call	_dly
	addw	sp, #4
;	../src/diskio.c: 129: byteLeft--) {	/* Wait for ready */
	ldw	x, _disk_writep_byteLeft_65536_355+2
	subw	x, #0x0001
	ldw	y, _disk_writep_byteLeft_65536_355+0
	jrnc	00205$
	decw	y
00205$:
	ldw	_disk_writep_byteLeft_65536_355+2, x
	ldw	_disk_writep_byteLeft_65536_355+0, y
	jra	00123$
00106$:
;	../src/diskio.c: 132: if(byteLeft) res = RES_OK;
	ldw	x, _disk_writep_byteLeft_65536_355+2
	jrne	00206$
	ldw	x, _disk_writep_byteLeft_65536_355+0
	jreq	00110$
00206$:
	clr	(0x02, sp)
00110$:
;	../src/diskio.c: 136: SD_CS_HIGH();
	bset	20490, #4
;	../src/diskio.c: 138: SD_WriteByte(SD_DUMMY_BYTE);
	push	#0xff
	call	_SD_WriteByte
	pop	a
	jra	00120$
;	../src/diskio.c: 143: while((byteLeft)&&(sc))
00139$:
	ldw	y, (0x09, sp)
	ldw	(0x01, sp), y
	ldw	y, (0x0d, sp)
	ldw	(0x05, sp), y
	ldw	y, (0x0b, sp)
	ldw	(0x03, sp), y
00115$:
	ldw	x, _disk_writep_byteLeft_65536_355+2
	jrne	00207$
	ldw	x, _disk_writep_byteLeft_65536_355+0
	jreq	00117$
00207$:
	ldw	x, (0x05, sp)
	jrne	00208$
	ldw	x, (0x03, sp)
	jreq	00117$
00208$:
;	../src/diskio.c: 146: SD_WriteByte(*buff);
	ldw	x, (0x01, sp)
	ld	a, (x)
	push	a
	call	_SD_WriteByte
	pop	a
;	../src/diskio.c: 148: buff++;byteLeft--;sc--;
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
	ldw	x, _disk_writep_byteLeft_65536_355+2
	subw	x, #0x0001
	ldw	y, _disk_writep_byteLeft_65536_355+0
	jrnc	00210$
	decw	y
00210$:
	ldw	_disk_writep_byteLeft_65536_355+2, x
	ldw	_disk_writep_byteLeft_65536_355+0, y
	ldw	x, (0x05, sp)
	subw	x, #0x0001
	ldw	(0x05, sp), x
	ldw	x, (0x03, sp)
	jrnc	00211$
	decw	x
00211$:
	ldw	(0x03, sp), x
	jra	00115$
00117$:
;	../src/diskio.c: 150: res = RES_OK;
	clr	(0x02, sp)
00120$:
;	../src/diskio.c: 153: return res;
	ld	a, (0x02, sp)
;	../src/diskio.c: 154: }
	addw	sp, #6
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
