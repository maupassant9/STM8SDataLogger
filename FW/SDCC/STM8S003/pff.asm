;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Linux)
;--------------------------------------------------------
	.module pff
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _disk_writep
	.globl _disk_readp
	.globl _disk_initialize
	.globl _pf_mount
	.globl _pf_open
	.globl _pf_read
	.globl _pf_write
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
Fpff$FatFs$0_0$0==.
_FatFs:
	.ds 2
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
	Fpff$ld_word$0$0 ==.
	C$pff.c$384$0_0$323 ==.
;	../src/pff.c: 384: static WORD ld_word (const BYTE* ptr)	/*	 Load a 2-byte little-endian word */
; genLabel
;	-----------------------------------------
;	 function ld_word
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 2 bytes.
_ld_word:
	pushw	x
	C$pff.c$388$1_0$323 ==.
;	../src/pff.c: 388: rv = ptr[1];
; genAssign
	ldw	x, (0x05, sp)
; genPointerGet
	ld	a, (0x1, x)
; genCast
; genAssign
	clrw	x
; genAssign
	C$pff.c$389$1_0$323 ==.
;	../src/pff.c: 389: rv = rv << 8 | ptr[0];
; genLeftShiftLiteral
	ld	(0x01, sp), a
	clr	(0x02, sp)
; genAssign
	ldw	x, (0x05, sp)
; genPointerGet
	ld	a, (x)
; genCast
; genAssign
	clrw	x
; genOr
	or	a, (0x02, sp)
	ld	xl, a
	ld	a, xh
	or	a, (0x01, sp)
; genAssign
	C$pff.c$390$1_0$323 ==.
;	../src/pff.c: 390: return rv;
; genReturn
	ld	xh, a
; genLabel
00101$:
	C$pff.c$391$1_0$323 ==.
;	../src/pff.c: 391: }
; genEndFunction
	addw	sp, #2
	C$pff.c$391$1_0$323 ==.
	XFpff$ld_word$0$0 ==.
	ret
	Fpff$ld_dword$0$0 ==.
	C$pff.c$393$1_0$325 ==.
;	../src/pff.c: 393: static DWORD ld_dword (const BYTE* ptr)	/* Load a 4-byte little-endian word */
; genLabel
;	-----------------------------------------
;	 function ld_dword
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 8 bytes.
_ld_dword:
	sub	sp, #8
	C$pff.c$397$1_0$325 ==.
;	../src/pff.c: 397: rv = ptr[3];
; genAssign
	ldw	x, (0x0b, sp)
; genPointerGet
	ld	a, (0x3, x)
; genCast
; genAssign
	clrw	x
	clrw	y
; genAssign
	ld	xl, a
	C$pff.c$398$1_0$325 ==.
;	../src/pff.c: 398: rv = rv << 8 | ptr[2];
; genLeftShiftLiteral
	ldw	(0x02, sp), x
	clr	(0x04, sp)
; genAssign
	ldw	x, (0x0b, sp)
; genPointerGet
	ld	a, (0x2, x)
; genCast
; genAssign
	clr	(0x07, sp)
	clrw	x
	clr	(0x05, sp)
; genOr
	or	a, (0x04, sp)
	ld	xh, a
	ld	a, (0x03, sp)
	or	a, (0x07, sp)
	ld	yh, a
	pushw	x
	ld	a, (0x04, sp)
	or	a, (2, sp)
	popw	x
	ld	xl, a
	ld	a, yl
	or	a, (0x05, sp)
; genAssign
	rrwa	x
	C$pff.c$399$1_0$325 ==.
;	../src/pff.c: 399: rv = rv << 8 | ptr[1];
; genLeftShiftLiteral
	ld	(0x01, sp), a
	exg	a, yl
	ld	a, xl
	exg	a, yl
	clr	(0x04, sp)
; genAssign
	ldw	x, (0x0b, sp)
; genPointerGet
	ld	a, (0x1, x)
; genCast
; genAssign
	clrw	x
	clr	(0x06, sp)
	clr	(0x05, sp)
; genOr
	or	a, (0x04, sp)
	ld	xl, a
	pushw	x
	ld	a, yl
	or	a, (1, sp)
	popw	x
	ld	xh, a
	ld	a, yh
	or	a, (0x06, sp)
	ld	yl, a
	ld	a, (0x01, sp)
	or	a, (0x05, sp)
; genAssign
	C$pff.c$400$1_0$325 ==.
;	../src/pff.c: 400: rv = rv << 8 | ptr[0];
; genLeftShiftLiteral
	ldw	(0x02, sp), x
	clr	(0x04, sp)
; genAssign
	ldw	x, (0x0b, sp)
; genPointerGet
	ld	a, (x)
; genCast
; genAssign
	clr	(0x07, sp)
	clrw	x
	clr	(0x05, sp)
; genOr
	or	a, (0x04, sp)
	ld	xh, a
	ld	a, (0x03, sp)
	or	a, (0x07, sp)
	ld	yh, a
	pushw	x
	ld	a, (0x04, sp)
	or	a, (2, sp)
	popw	x
	ld	xl, a
	ld	a, yl
	or	a, (0x05, sp)
; genAssign
	exg	a, yl
	ld	a, xh
	exg	a, yl
	ld	xh, a
	C$pff.c$401$1_0$325 ==.
;	../src/pff.c: 401: return rv;
; genReturn
	exgw	x, y
; genLabel
00101$:
	C$pff.c$402$1_0$325 ==.
;	../src/pff.c: 402: }
; genEndFunction
	addw	sp, #8
	C$pff.c$402$1_0$325 ==.
	XFpff$ld_dword$0$0 ==.
	ret
	Fpff$mem_set$0$0 ==.
	C$pff.c$411$1_0$327 ==.
;	../src/pff.c: 411: static void mem_set (void* dst, int val, int cnt) {
; genLabel
;	-----------------------------------------
;	 function mem_set
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 2 bytes.
_mem_set:
	pushw	x
	C$pff.c$412$1_0$327 ==.
;	../src/pff.c: 412: char *d = (char*)dst;
; genCast
; genAssign
	ldw	x, (0x05, sp)
; genAssign
	C$pff.c$413$1_0$327 ==.
;	../src/pff.c: 413: while (cnt--) *d++ = (char)val;
; genAssign
	ldw	(0x01, sp), x
; genAssign
	ldw	y, (0x09, sp)
; genLabel
00101$:
; genAssign
	ldw	x, y
; genMinus
	decw	y
; genIfx
	tnzw	x
	jrne	00117$
	jp	00104$
00117$:
; genCast
; genAssign
	ld	a, (0x08, sp)
; genPointerSet
	ldw	x, (0x01, sp)
	ld	(x), a
; genPlus
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
00118$:
; genGoto
	jp	00101$
; genLabel
00104$:
	C$pff.c$414$1_0$327 ==.
;	../src/pff.c: 414: }
; genEndFunction
	popw	x
	C$pff.c$414$1_0$327 ==.
	XFpff$mem_set$0$0 ==.
	ret
	Fpff$mem_cmp$0$0 ==.
	C$pff.c$417$1_0$329 ==.
;	../src/pff.c: 417: static int mem_cmp (const void* dst, const void* src, int cnt) {
; genLabel
;	-----------------------------------------
;	 function mem_cmp
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 10 bytes.
_mem_cmp:
	sub	sp, #10
	C$pff.c$418$1_0$329 ==.
;	../src/pff.c: 418: const char *d = (const char *)dst, *s = (const char *)src;
; genCast
; genAssign
	ldw	y, (0x0d, sp)
; genAssign
; genCast
; genAssign
	ldw	x, (0x0f, sp)
; genAssign
	C$pff.c$419$1_0$329 ==.
;	../src/pff.c: 419: int r = 0;
; genAssign
	clr	(0x02, sp)
	clr	(0x01, sp)
	C$pff.c$420$1_0$329 ==.
;	../src/pff.c: 420: while (cnt-- && (r = *d++ - *s++) == 0) ;
; genAssign
	ldw	(0x05, sp), y
; genAssign
	ldw	(0x07, sp), x
; genAssign
	ldw	y, (0x11, sp)
	ldw	(0x09, sp), y
; genLabel
00102$:
; genAssign
	ldw	y, (0x09, sp)
	ldw	(0x03, sp), y
; genMinus
	ldw	x, (0x09, sp)
	decw	x
	ldw	(0x09, sp), x
; genIfx
	ldw	x, (0x03, sp)
	jrne	00118$
	jp	00104$
00118$:
; genPointerGet
	ldw	x, (0x05, sp)
	ld	a, (x)
; genPlus
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
00119$:
; genCast
; genAssign
	clrw	x
	ld	xl, a
; genPointerGet
	ldw	y, (0x07, sp)
	ld	a, (y)
; genPlus
	ldw	y, (0x07, sp)
	incw	y
	ldw	(0x07, sp), y
; genCast
; genAssign
	ld	(0x04, sp), a
	clr	(0x03, sp)
; genMinus
	subw	x, (0x03, sp)
; genAssign
	ldw	(0x01, sp), x
; genIfx
	tnzw	x
	jrne	00120$
	jp	00102$
00120$:
; genLabel
00104$:
	C$pff.c$421$1_0$329 ==.
;	../src/pff.c: 421: return r;
; genReturn
	ldw	x, (0x01, sp)
; genLabel
00105$:
	C$pff.c$422$1_0$329 ==.
;	../src/pff.c: 422: }
; genEndFunction
	addw	sp, #10
	C$pff.c$422$1_0$329 ==.
	XFpff$mem_cmp$0$0 ==.
	ret
	Fpff$get_fat$0$0 ==.
	C$pff.c$430$1_0$331 ==.
;	../src/pff.c: 430: static CLUST get_fat (	/* 1:IO error, Else:Cluster status */
; genLabel
;	-----------------------------------------
;	 function get_fat
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 18 bytes.
_get_fat:
	sub	sp, #18
	C$pff.c$435$2_0$331 ==.
;	../src/pff.c: 435: FATFS *fs = FatFs;
; genAssign
	ldw	y, _FatFs+0
	C$pff.c$440$1_0$331 ==.
;	../src/pff.c: 440: if (clst < 2 || clst >= fs->n_fatent) return 1;	/* Range check */
; genCmp
; genCmpTop
	ldw	x, (0x17, sp)
	cpw	x, #0x0002
	ld	a, (0x16, sp)
	sbc	a, #0x00
	ld	a, (0x15, sp)
	sbc	a, #0x00
	jrnc	00125$
	jp	00101$
00125$:
; skipping generated iCode
; genAssign
	ldw	x, y
; genPointerGet
	ld	a, (0x9, x)
	ld	(0x12, sp), a
	ld	a, (0x8, x)
	ld	(0x11, sp), a
	ldw	x, (0x6, x)
	ldw	(0x0f, sp), x
; genCmp
; genCmpTop
	ldw	x, (0x17, sp)
	cpw	x, (0x11, sp)
	ld	a, (0x16, sp)
	sbc	a, (0x10, sp)
	ld	a, (0x15, sp)
	sbc	a, (0x0f, sp)
	jrnc	00126$
	jp	00102$
00126$:
; skipping generated iCode
; genLabel
00101$:
; genReturn
	clrw	x
	incw	x
	clrw	y
	jp	00108$
; genLabel
00102$:
	C$pff.c$442$1_0$331 ==.
;	../src/pff.c: 442: switch (fs->fs_type) {
; genPointerGet
	ld	a, (y)
; genCmpEQorNE
	cp	a, #0x03
	jrne	00128$
	jp	00129$
00128$:
	jp	00107$
00129$:
; skipping generated iCode
	C$pff.c$464$2_0$332 ==.
;	../src/pff.c: 464: if (disk_readp(buf, fs->fatbase + clst / 128, ((UINT)clst % 128) * 4, 4)) break;
; genCast
; genAssign
	ldw	x, (0x17, sp)
; genAnd
	ld	a, xl
	and	a, #0x7f
	ld	xl, a
	clr	a
	ld	xh, a
; genLeftShiftLiteral
	sllw	x
	sllw	x
	ldw	(0x05, sp), x
; genAssign
	ldw	x, y
; genPointerGet
	ld	a, (0xd, x)
	ld	(0x0a, sp), a
	ld	a, (0xc, x)
	ldw	x, (0xa, x)
	ldw	(0x07, sp), x
; genRightShiftLiteral
	ldw	x, (0x17, sp)
	ldw	y, (0x15, sp)
	push	a
	clr	a
	rrwa	y
	rrwa	x
	sll	a
	rlcw	x
	rlcw	y
	pop	a
	ldw	(0x0d, sp), x
; genPlus
	ld	xh, a
	exg	a, xl
	ld	a, (0x0a, sp)
	exg	a, xl
	addw	x, (0x0d, sp)
	ld	a, yl
	adc	a, (0x08, sp)
	ld	(0x10, sp), a
	ld	a, yh
	adc	a, (0x07, sp)
	ld	(0x0f, sp), a
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	push	#0x04
	push	#0x00
; genIPush
	ldw	y, (0x07, sp)
	pushw	y
; genIPush
	pushw	x
	ldw	x, (0x15, sp)
	pushw	x
; genIPush
	ldw	x, sp
	addw	x, #9
	pushw	x
; genCall
	call	_disk_readp
	addw	sp, #10
; genIfx
	tnz	a
	jreq	00130$
	jp	00107$
00130$:
	C$pff.c$465$2_0$332 ==.
;	../src/pff.c: 465: return ld_dword(buf) & 0x0FFFFFFF;
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	ldw	x, sp
	incw	x
	pushw	x
; genCall
	call	_ld_dword
	addw	sp, #2
; genAnd
	ld	a, yh
	and	a, #0x0f
; genReturn
	ld	yh, a
	jp	00108$
	C$pff.c$467$1_0$331 ==.
;	../src/pff.c: 467: }
; genLabel
00107$:
	C$pff.c$469$1_0$331 ==.
;	../src/pff.c: 469: return 1;	/* An error occured at the disk I/O layer */
; genReturn
	clrw	x
	incw	x
	clrw	y
; genLabel
00108$:
	C$pff.c$470$1_0$331 ==.
;	../src/pff.c: 470: }
; genEndFunction
	addw	sp, #18
	C$pff.c$470$1_0$331 ==.
	XFpff$get_fat$0$0 ==.
	ret
	Fpff$clust2sect$0$0 ==.
	C$pff.c$479$1_0$334 ==.
;	../src/pff.c: 479: static DWORD clust2sect (	/* !=0: Sector number, 0: Failed - invalid cluster# */
; genLabel
;	-----------------------------------------
;	 function clust2sect
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 8 bytes.
_clust2sect:
	sub	sp, #8
	C$pff.c$483$2_0$334 ==.
;	../src/pff.c: 483: FATFS *fs = FatFs;
; genAssign
	ldw	x, _FatFs+0
	ldw	(0x07, sp), x
	C$pff.c$486$1_0$334 ==.
;	../src/pff.c: 486: clst -= 2;
; genMinus
	ldw	x, (0x0d, sp)
	subw	x, #0x0002
	ldw	y, (0x0b, sp)
	jrnc	00110$
	decw	y
00110$:
; genAssign
	ldw	(0x0d, sp), x
	ldw	(0x0b, sp), y
	C$pff.c$487$1_0$334 ==.
;	../src/pff.c: 487: if (clst >= (fs->n_fatent - 2)) return 0;		/* Invalid cluster# */
; genAssign
	ldw	x, (0x07, sp)
; genPointerGet
	ldw	y, x
	ldw	y, (0x8, y)
	ldw	x, (0x6, x)
; genMinus
	subw	y, #0x0002
	ldw	(0x05, sp), y
	jrnc	00111$
	decw	x
00111$:
	ldw	(0x03, sp), x
; genCmp
; genCmpTop
	ldw	x, (0x0d, sp)
	cpw	x, (0x05, sp)
	ld	a, (0x0c, sp)
	sbc	a, (0x04, sp)
	ld	a, (0x0b, sp)
	sbc	a, (0x03, sp)
	jrnc	00112$
	jp	00102$
00112$:
; skipping generated iCode
; genReturn
	clrw	x
	clrw	y
	jp	00103$
; genLabel
00102$:
	C$pff.c$488$1_0$334 ==.
;	../src/pff.c: 488: return (DWORD)clst * fs->csize + fs->database;
; genAssign
	ldw	x, (0x07, sp)
; genPointerGet
	ld	a, (0x2, x)
; genCast
; genAssign
	clrw	x
	ld	xl, a
	clrw	y
; genIPush
	pushw	x
	pushw	y
; genIPush
	ldw	x, (0x11, sp)
	pushw	x
	ldw	x, (0x11, sp)
	pushw	x
; genCall
	call	__mullong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
; genAssign
	ldw	x, (0x07, sp)
; genPointerGet
	ldw	y, x
	ldw	y, (0x14, y)
	ldw	x, (0x12, x)
	ldw	(0x05, sp), x
; genPlus
	ldw	x, y
	addw	x, (0x03, sp)
	ldw	y, (0x05, sp)
	jrnc	00113$
	incw	y
00113$:
	addw	y, (0x01, sp)
; genReturn
; genLabel
00103$:
	C$pff.c$489$1_0$334 ==.
;	../src/pff.c: 489: }
; genEndFunction
	addw	sp, #8
	C$pff.c$489$1_0$334 ==.
	XFpff$clust2sect$0$0 ==.
	ret
	Fpff$get_clust$0$0 ==.
	C$pff.c$492$1_0$336 ==.
;	../src/pff.c: 492: static CLUST get_clust (
; genLabel
;	-----------------------------------------
;	 function get_clust
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 4 bytes.
_get_clust:
	sub	sp, #4
	C$pff.c$501$2_0$337 ==.
;	../src/pff.c: 501: clst = ld_word(dir+DIR_FstClusHI);
; genPlus
	ldw	x, (0x07, sp)
	addw	x, #0x0014
; genIPush
	pushw	x
; genCall
	call	_ld_word
	addw	sp, #2
; genCast
; genAssign
	exgw	x, y
	clrw	x
; genAssign
	C$pff.c$502$2_0$337 ==.
;	../src/pff.c: 502: clst <<= 16;
; genLeftShiftLiteral
	clrw	x
; genAssign
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
	C$pff.c$504$1_0$336 ==.
;	../src/pff.c: 504: clst |= ld_word(dir+DIR_FstClusLO);
; genPlus
	ldw	x, (0x07, sp)
	addw	x, #0x001a
; genIPush
	pushw	x
; genCall
	call	_ld_word
	addw	sp, #2
; genCast
; genAssign
	clr	a
	clrw	y
; genOr
	or	a, (0x02, sp)
	ld	yl, a
	ld	a, xl
	or	a, (0x04, sp)
	ld	xl, a
	ld	a, xh
	or	a, (0x03, sp)
	ld	xh, a
	ld	a, yh
	or	a, (0x01, sp)
; genAssign
	C$pff.c$506$1_0$336 ==.
;	../src/pff.c: 506: return clst;
; genReturn
	ld	yh, a
; genLabel
00105$:
	C$pff.c$507$1_0$336 ==.
;	../src/pff.c: 507: }
; genEndFunction
	addw	sp, #4
	C$pff.c$507$1_0$336 ==.
	XFpff$get_clust$0$0 ==.
	ret
	Fpff$dir_rewind$0$0 ==.
	C$pff.c$514$1_0$339 ==.
;	../src/pff.c: 514: static FRESULT dir_rewind (
; genLabel
;	-----------------------------------------
;	 function dir_rewind
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 12 bytes.
_dir_rewind:
	sub	sp, #12
	C$pff.c$519$2_0$339 ==.
;	../src/pff.c: 519: FATFS *fs = FatFs;
; genAssign
	ldw	x, _FatFs+0
	ldw	(0x07, sp), x
	C$pff.c$522$1_0$339 ==.
;	../src/pff.c: 522: dj->index = 0;
; genAssign
	ldw	y, (0x0f, sp)
	ldw	(0x05, sp), y
; genPointerSet
	ldw	x, (0x05, sp)
	clr	(0x1, x)
	clr	(x)
	C$pff.c$523$1_0$339 ==.
;	../src/pff.c: 523: clst = dj->sclust;
; genAssign
	ldw	x, (0x05, sp)
; genPointerGet
	ldw	y, x
	ldw	y, (0x6, y)
	ldw	x, (0x4, x)
; genAssign
	ldw	(0x0b, sp), y
	ldw	(0x09, sp), x
	C$pff.c$524$1_0$339 ==.
;	../src/pff.c: 524: if (clst == 1 || clst >= fs->n_fatent) {	/* Check start cluster range */
; genCmpEQorNE
	ldw	x, (0x0b, sp)
	decw	x
	jrne	00129$
	ldw	x, (0x09, sp)
	jrne	00129$
	jp	00101$
00129$:
; skipping generated iCode
; genAssign
	ldw	x, (0x07, sp)
; genPointerGet
	ldw	y, x
	ldw	y, (0x8, y)
	ldw	(0x03, sp), y
	ldw	x, (0x6, x)
	ldw	(0x01, sp), x
; genCmp
; genCmpTop
	ldw	x, (0x0b, sp)
	cpw	x, (0x03, sp)
	ld	a, (0x0a, sp)
	sbc	a, (0x02, sp)
	ld	a, (0x09, sp)
	sbc	a, (0x01, sp)
	jrnc	00131$
	jp	00106$
00131$:
; skipping generated iCode
; genLabel
00101$:
	C$pff.c$525$2_0$340 ==.
;	../src/pff.c: 525: return FR_DISK_ERR;
; genReturn
	ld	a, #0x01
	jp	00109$
	C$pff.c$527$1_0$339 ==.
;	../src/pff.c: 527: if (PF_FS_FAT32 && !clst && (_FS_32ONLY || fs->fs_type == FS_FAT32)) {	/* Replace cluster# 0 with root cluster# if in FAT32 */
; genLabel
00106$:
; genIfx
	ldw	x, (0x0b, sp)
	jrne	00132$
	ldw	x, (0x09, sp)
	jreq	00133$
00132$:
	jp	00105$
00133$:
	C$pff.c$528$2_0$341 ==.
;	../src/pff.c: 528: clst = (CLUST)fs->dirbase;
; genAssign
; genPointerGet
	ldw	x, (0x07, sp)
	ldw	y, x
	ldw	y, (0x10, y)
	ldw	(0x0b, sp), y
	ldw	x, (0xe, x)
	ldw	(0x09, sp), x
; genAssign
; genLabel
00105$:
	C$pff.c$530$1_0$339 ==.
;	../src/pff.c: 530: dj->clust = clst;						/* Current cluster */
; genPlus
	ldw	x, (0x05, sp)
	addw	x, #0x0008
; genPointerSet
	ldw	y, (0x0b, sp)
	ldw	(0x2, x), y
	ldw	y, (0x09, sp)
	ldw	(x), y
	C$pff.c$531$1_0$339 ==.
;	../src/pff.c: 531: dj->sect = (_FS_32ONLY || clst) ? clust2sect(clst) : fs->dirbase;	/* Current sector */
; genPlus
	ldw	x, (0x05, sp)
	addw	x, #0x000c
	ldw	(0x07, sp), x
; genIPush
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
; genCall
	call	_clust2sect
	addw	sp, #4
	exgw	x, y
; genAssign
	ldw	(0x09, sp), x
; genPointerSet
	ldw	x, (0x07, sp)
	ldw	(0x2, x), y
	ldw	y, (0x09, sp)
	ldw	(x), y
	C$pff.c$533$1_0$339 ==.
;	../src/pff.c: 533: return FR_OK;	/* Seek succeeded */
; genReturn
	clr	a
; genLabel
00109$:
	C$pff.c$534$1_0$339 ==.
;	../src/pff.c: 534: }
; genEndFunction
	addw	sp, #12
	C$pff.c$534$1_0$339 ==.
	XFpff$dir_rewind$0$0 ==.
	ret
	Fpff$dir_next$0$0 ==.
	C$pff.c$543$1_0$343 ==.
;	../src/pff.c: 543: static FRESULT dir_next (	/* FR_OK:Succeeded, FR_NO_FILE:End of table */
; genLabel
;	-----------------------------------------
;	 function dir_next
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 20 bytes.
_dir_next:
	sub	sp, #20
	C$pff.c$549$2_0$343 ==.
;	../src/pff.c: 549: FATFS *fs = FatFs;
; genAssign
	ldw	x, _FatFs+0
	ldw	(0x05, sp), x
	C$pff.c$552$1_0$343 ==.
;	../src/pff.c: 552: i = dj->index + 1;
; genAssign
	ldw	y, (0x17, sp)
	ldw	(0x07, sp), y
; genPointerGet
	ldw	x, (0x07, sp)
	ldw	x, (x)
; genCast
; genAssign
; genPlus
	incw	x
; genCast
; genAssign
; genAssign
	ldw	(0x09, sp), x
	C$pff.c$553$1_0$343 ==.
;	../src/pff.c: 553: if (!i || !dj->sect) return FR_NO_FILE;	/* Report EOT when index has reached 65535 */
; genIfx
	ldw	x, (0x09, sp)
	jrne	00154$
	jp	00101$
00154$:
; genPlus
	ldw	x, (0x07, sp)
	addw	x, #0x000c
	ldw	(0x0b, sp), x
; genPointerGet
	ldw	x, (0x0b, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	(0x03, sp), y
	ldw	x, (x)
	ldw	(0x01, sp), x
; genIfx
	ldw	x, (0x03, sp)
	jrne	00155$
	ldw	x, (0x01, sp)
	jreq	00156$
00155$:
	jp	00102$
00156$:
; genLabel
00101$:
; genReturn
	ld	a, #0x03
	jp	00117$
; genLabel
00102$:
	C$pff.c$555$1_0$343 ==.
;	../src/pff.c: 555: if (!(i % 16)) {		/* Sector changed? */
; genCast
; genAssign
	ldw	y, (0x09, sp)
	ldw	(0x13, sp), y
; genAnd
	ld	a, (0x14, sp)
	bcp	a, #0x0f
	jreq	00157$
	jp	00116$
00157$:
; skipping generated iCode
	C$pff.c$556$2_0$344 ==.
;	../src/pff.c: 556: dj->sect++;			/* Next sector */
; genPlus
	ld	a, (0x04, sp)
	add	a, #0x01
	push	a
	ld	a, (0x04, sp)
	adc	a, #0x00
	ld	(0x12, sp), a
	ldw	y, (0x02, sp)
	jrnc	00158$
	incw	y
00158$:
	pop	a
; genPointerSet
	ldw	x, (0x0b, sp)
	ld	(0x3, x), a
	ld	a, (0x11, sp)
	ld	(0x2, x), a
	ldw	(x), y
	C$pff.c$558$1_0$343 ==.
;	../src/pff.c: 558: if (dj->clust == 0) {	/* Static table */
; genPlus
	ldw	x, (0x07, sp)
	addw	x, #0x0008
	ldw	(0x0d, sp), x
; genPointerGet
	ldw	x, (0x0d, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	ldw	(0x0f, sp), x
; genIfx
	tnzw	y
	jrne	00159$
	ldw	x, (0x0f, sp)
	jreq	00160$
00159$:
	jp	00113$
00160$:
	C$pff.c$559$3_0$345 ==.
;	../src/pff.c: 559: if (i >= fs->n_rootdir) return FR_NO_FILE;	/* Report EOT when end of table */
; genAssign
	ldw	x, (0x05, sp)
; genPointerGet
	ldw	x, (0x4, x)
	ldw	(0x13, sp), x
; genCmp
; genCmpTop
	ldw	x, (0x09, sp)
	cpw	x, (0x13, sp)
	jrnc	00161$
	jp	00116$
00161$:
; skipping generated iCode
; genReturn
	ld	a, #0x03
	jp	00117$
; genLabel
00113$:
	C$pff.c$562$3_0$346 ==.
;	../src/pff.c: 562: if (((i / 16) & (fs->csize - 1)) == 0) {	/* Cluster changed? */
; genRightShiftLiteral
	srl	(0x13, sp)
	rrc	(0x14, sp)
	srl	(0x13, sp)
	rrc	(0x14, sp)
	srl	(0x13, sp)
	rrc	(0x14, sp)
	srl	(0x13, sp)
	rrc	(0x14, sp)
; genAssign
	ldw	x, (0x05, sp)
; genPointerGet
	ld	a, (0x2, x)
; genCast
; genAssign
	clrw	x
	ld	xl, a
; genMinus
	decw	x
	ld	a, xl
; genAnd
	and	a, (0x14, sp)
	ld	xl, a
	ld	a, xh
	and	a, (0x13, sp)
	ld	xh, a
; genIfx
	tnzw	x
	jreq	00162$
	jp	00116$
00162$:
	C$pff.c$563$4_0$347 ==.
;	../src/pff.c: 563: clst = get_fat(dj->clust);		/* Get next cluster */
; genIPush
	pushw	y
	ldw	x, (0x11, sp)
	pushw	x
; genCall
	call	_get_fat
	addw	sp, #4
; genAssign
	ldw	(0x13, sp), x
	ldw	(0x11, sp), y
	C$pff.c$564$4_0$347 ==.
;	../src/pff.c: 564: if (clst <= 1) return FR_DISK_ERR;
; genCmp
; genCmpTop
	clrw	x
	incw	x
	cpw	x, (0x13, sp)
	clr	a
	sbc	a, (0x12, sp)
	clr	a
	sbc	a, (0x11, sp)
	jrnc	00163$
	jp	00107$
00163$:
; skipping generated iCode
; genReturn
	ld	a, #0x01
	jp	00117$
; genLabel
00107$:
	C$pff.c$565$4_0$347 ==.
;	../src/pff.c: 565: if (clst >= fs->n_fatent) return FR_NO_FILE;	/* Report EOT when it reached end of dynamic table */
; genAssign
	ldw	x, (0x05, sp)
; genPointerGet
	ldw	y, x
	ldw	y, (0x8, y)
	ldw	(0x05, sp), y
	ldw	x, (0x6, x)
	ldw	(0x03, sp), x
; genCmp
; genCmpTop
	ldw	x, (0x13, sp)
	cpw	x, (0x05, sp)
	ld	a, (0x12, sp)
	sbc	a, (0x04, sp)
	ld	a, (0x11, sp)
	sbc	a, (0x03, sp)
	jrnc	00164$
	jp	00109$
00164$:
; skipping generated iCode
; genReturn
	ld	a, #0x03
	jp	00117$
; genLabel
00109$:
	C$pff.c$566$4_0$347 ==.
;	../src/pff.c: 566: dj->clust = clst;				/* Initialize data for new cluster */
; genPointerSet
	ldw	x, (0x0d, sp)
	ldw	y, (0x13, sp)
	ldw	(0x2, x), y
	ldw	y, (0x11, sp)
	ldw	(x), y
	C$pff.c$567$4_0$347 ==.
;	../src/pff.c: 567: dj->sect = clust2sect(clst);
; genIPush
	ldw	x, (0x13, sp)
	pushw	x
	ldw	x, (0x13, sp)
	pushw	x
; genCall
	call	_clust2sect
	addw	sp, #4
	ldw	(0x11, sp), y
; genPointerSet
	ldw	y, (0x0b, sp)
	ldw	(0x2, y), x
	ldw	x, (0x11, sp)
	ldw	(y), x
; genLabel
00116$:
	C$pff.c$572$1_0$343 ==.
;	../src/pff.c: 572: dj->index = i;
; genPointerSet
	ldw	x, (0x07, sp)
	ldw	y, (0x09, sp)
	ldw	(x), y
	C$pff.c$574$1_0$343 ==.
;	../src/pff.c: 574: return FR_OK;
; genReturn
	clr	a
; genLabel
00117$:
	C$pff.c$575$1_0$343 ==.
;	../src/pff.c: 575: }
; genEndFunction
	addw	sp, #20
	C$pff.c$575$1_0$343 ==.
	XFpff$dir_next$0$0 ==.
	ret
	Fpff$dir_find$0$0 ==.
	C$pff.c$584$1_0$349 ==.
;	../src/pff.c: 584: static FRESULT dir_find (
; genLabel
;	-----------------------------------------
;	 function dir_find
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 13 bytes.
_dir_find:
	sub	sp, #13
	C$pff.c$593$1_0$349 ==.
;	../src/pff.c: 593: res = dir_rewind(dj);			/* Rewind directory object */
; genIPush
	ldw	x, (0x10, sp)
	pushw	x
; genCall
	call	_dir_rewind
	popw	x
; genAssign
	C$pff.c$594$1_0$349 ==.
;	../src/pff.c: 594: if (res != FR_OK) return res;
; genIfx
	tnz	a
	jrne	00147$
	jp	00122$
00147$:
; genReturn
	jp	00113$
	C$pff.c$596$1_0$349 ==.
;	../src/pff.c: 596: do {
; genLabel
00122$:
; genAssign
	ldw	y, (0x12, sp)
	ldw	(0x03, sp), y
; genAssign
	ldw	y, (0x10, sp)
	ldw	(0x05, sp), y
; genAssign
	ldw	y, (0x05, sp)
	ldw	(0x07, sp), y
; genAssign
	ldw	y, (0x03, sp)
	ldw	(0x09, sp), y
; genAssign
	ldw	y, (0x05, sp)
	ldw	(0x0b, sp), y
; genLabel
00110$:
	C$pff.c$597$2_0$350 ==.
;	../src/pff.c: 597: res = disk_readp(dir, dj->sect, (dj->index % 16) * 32, 32)	/* Read an entry */
; genPointerGet
	ldw	x, (0x05, sp)
	ldw	x, (x)
; genCast
; genAssign
	ld	a, xl
; genAnd
	and	a, #0x0f
	ld	xl, a
	clr	a
	ld	xh, a
; genLeftShiftLiteral
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x01, sp), x
; genPointerGet
	ldw	x, (0x0b, sp)
	ldw	y, x
	ldw	y, (0xe, y)
	ldw	x, (0xc, x)
; genIPush
	push	#0x20
	push	#0x00
; genIPush
	ld	a, (0x04, sp)
	push	a
	ld	a, (0x04, sp)
	push	a
; genIPush
	pushw	y
	pushw	x
; genIPush
	ldw	x, (0x0b, sp)
	pushw	x
; genCall
	call	_disk_readp
	addw	sp, #10
; genIfx
	tnz	a
	jrne	00148$
	jp	00115$
00148$:
	C$pff.c$598$2_0$350 ==.
;	../src/pff.c: 598: ? FR_DISK_ERR : FR_OK;
; genAssign
	ld	a, #0x01
	clrw	x
; genGoto
	jp	00116$
; genLabel
00115$:
; genAssign
	clr	a
	clrw	x
; genLabel
00116$:
; genCast
; genAssign
	ld	(0x0d, sp), a
	C$pff.c$599$2_0$350 ==.
;	../src/pff.c: 599: if (res != FR_OK) break;
; genIfx
	tnz	(0x0d, sp)
	jreq	00149$
	jp	00112$
00149$:
	C$pff.c$600$2_0$350 ==.
;	../src/pff.c: 600: c = dir[DIR_Name];	/* First character */
; genPointerGet
	ldw	x, (0x03, sp)
	ld	a, (x)
	C$pff.c$601$2_0$350 ==.
;	../src/pff.c: 601: if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
; genIfx
	tnz	a
	jreq	00150$
	jp	00106$
00150$:
; genAssign
	ld	a, #0x03
	ld	(0x0d, sp), a
; genGoto
	jp	00112$
; genLabel
00106$:
	C$pff.c$602$2_0$350 ==.
;	../src/pff.c: 602: if (!(dir[DIR_Attr] & AM_VOL) && !mem_cmp(dir, dj->fn, 11)) break;	/* Is it a valid entry? */
; genPointerGet
	ldw	x, (0x09, sp)
	ld	a, (0xb, x)
; genAnd
	bcp	a, #0x08
	jreq	00151$
	jp	00108$
00151$:
; skipping generated iCode
; genPointerGet
	ldw	x, (0x07, sp)
	ldw	x, (0x2, x)
; genCast
; genAssign
; genCast
; genAssign
	ldw	y, (0x12, sp)
; genIPush
	push	#0x0b
	push	#0x00
; genIPush
	pushw	x
; genIPush
	pushw	y
; genCall
	call	_mem_cmp
	addw	sp, #6
; genIfx
	tnzw	x
	jrne	00152$
	jp	00112$
00152$:
; genLabel
00108$:
	C$pff.c$603$2_0$350 ==.
;	../src/pff.c: 603: res = dir_next(dj);					/* Next entry */
; genIPush
	ldw	x, (0x05, sp)
	pushw	x
; genCall
	call	_dir_next
	popw	x
; genAssign
	ld	(0x0d, sp), a
	C$pff.c$604$1_0$349 ==.
;	../src/pff.c: 604: } while (res == FR_OK);
; genIfx
	tnz	(0x0d, sp)
	jrne	00153$
	jp	00110$
00153$:
; genLabel
00112$:
	C$pff.c$606$1_0$349 ==.
;	../src/pff.c: 606: return res;
; genReturn
	ld	a, (0x0d, sp)
; genLabel
00113$:
	C$pff.c$607$1_0$349 ==.
;	../src/pff.c: 607: }
; genEndFunction
	addw	sp, #13
	C$pff.c$607$1_0$349 ==.
	XFpff$dir_find$0$0 ==.
	ret
	Fpff$create_name$0$0 ==.
	C$pff.c$651$1_0$353 ==.
;	../src/pff.c: 651: static FRESULT create_name (
; genLabel
;	-----------------------------------------
;	 function create_name
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 9 bytes.
_create_name:
	sub	sp, #9
	C$pff.c$663$1_0$353 ==.
;	../src/pff.c: 663: sfn = dj->fn;
; genAssign
	ldw	x, (0x0c, sp)
; genAssign
; genPointerGet
	ldw	x, (0x2, x)
; genAssign
	ldw	(0x01, sp), x
	C$pff.c$664$1_0$353 ==.
;	../src/pff.c: 664: mem_set(sfn, ' ', 11);
; genCast
; genAssign
	ldw	x, (0x01, sp)
; genIPush
	push	#0x0b
	push	#0x00
; genIPush
	push	#0x20
	push	#0x00
; genIPush
	pushw	x
; genCall
	call	_mem_set
	addw	sp, #6
	C$pff.c$665$1_0$353 ==.
;	../src/pff.c: 665: si = i = 0; ni = 8;
; genAssign
	clr	(0x08, sp)
; genAssign
	clr	(0x09, sp)
; genAssign
	ld	a, #0x08
	ld	(0x03, sp), a
	C$pff.c$666$1_0$353 ==.
;	../src/pff.c: 666: p = *path;
; genAssign
	ldw	y, (0x0e, sp)
; genPointerGet
	ldw	x, y
	ldw	x, (x)
; genAssign
	ldw	(0x04, sp), x
; genLabel
00120$:
	C$pff.c$668$3_0$355 ==.
;	../src/pff.c: 668: c = p[si++];
; genPlus
	clrw	x
	ld	a, (0x09, sp)
	ld	xl, a
	addw	x, (0x04, sp)
; genPlus
	inc	(0x09, sp)
; genPointerGet
	ld	a, (x)
	ld	(0x06, sp), a
	C$pff.c$669$1_0$353 ==.
;	../src/pff.c: 669: if (c <= ' ' || c == '/') break;	/* Break on end of segment */
; genCmp
; genCmpTop
	ld	a, (0x06, sp)
	cp	a, #0x20
	jrugt	00161$
	clr	(0x07, sp)
	jp	00162$
00161$:
	ld	a, #0x01
	ld	(0x07, sp), a
00162$:
; genIfx
	tnz	(0x07, sp)
	jrne	00163$
	jp	00132$
00163$:
; genCmpEQorNE
	ld	a, (0x06, sp)
	cp	a, #0x2f
	jrne	00165$
	jp	00132$
00165$:
; skipping generated iCode
	C$pff.c$670$1_0$353 ==.
;	../src/pff.c: 670: if (c == '.' || i >= ni) {
; genCmpEQorNE
	ld	a, (0x06, sp)
	cp	a, #0x2e
	jrne	00168$
	ld	a, #0x01
	jp	00169$
00168$:
	clr	a
00169$:
; genIfx
	tnz	a
	jreq	00170$
	jp	00107$
00170$:
; genCmp
; genCmpTop
	push	a
	ld	a, (0x09, sp)
	cp	a, (0x04, sp)
	pop	a
	jrnc	00171$
	jp	00111$
00171$:
; skipping generated iCode
; genLabel
00107$:
	C$pff.c$671$4_0$356 ==.
;	../src/pff.c: 671: if (ni != 8 || c != '.') break;
; genCmpEQorNE
	push	a
	ld	a, (0x04, sp)
	cp	a, #0x08
	pop	a
	jrne	00173$
	jp	00174$
00173$:
	jp	00132$
00174$:
; skipping generated iCode
; genAssign
; genIfx
	tnz	a
	jrne	00175$
	jp	00132$
00175$:
	C$pff.c$672$4_0$356 ==.
;	../src/pff.c: 672: i = 8; ni = 11;
; genAssign
	ld	a, #0x08
	ld	(0x08, sp), a
; genAssign
	ld	a, #0x0b
	ld	(0x03, sp), a
	C$pff.c$673$4_0$356 ==.
;	../src/pff.c: 673: continue;
; genGoto
	jp	00120$
	C$pff.c$683$4_0$358 ==.
;	../src/pff.c: 683: if (PF_USE_LCC && IsLower(c)) c -= 0x20;	/* toupper */
; genLabel
00111$:
	C$pff.c$684$4_0$358 ==.
;	../src/pff.c: 684: sfn[i++] = c;
; genAssign
	ld	a, (0x08, sp)
; genPlus
	inc	(0x08, sp)
; genPlus
	clrw	x
	ld	xl, a
	addw	x, (0x01, sp)
; genPointerSet
	ld	a, (0x06, sp)
	ld	(x), a
; genGoto
	jp	00120$
; genLabel
00132$:
; genAssign
	ld	a, (0x09, sp)
	C$pff.c$687$1_0$353 ==.
;	../src/pff.c: 687: *path = &p[si];						/* Rerurn pointer to the next segment */
; genPlus
	clrw	x
	ld	xl, a
	addw	x, (0x04, sp)
; genPointerSet
	ldw	(y), x
	C$pff.c$689$1_0$353 ==.
;	../src/pff.c: 689: sfn[11] = (c <= ' ') ? 1 : 0;		/* Set last segment flag if end of path */
; genPlus
	ldw	y, (0x01, sp)
	addw	y, #0x000b
; genIfx
	tnz	(0x07, sp)
	jreq	00176$
	jp	00123$
00176$:
; genAssign
	clrw	x
	incw	x
; genGoto
	jp	00124$
; genLabel
00123$:
; genAssign
	clrw	x
; genLabel
00124$:
; genCast
; genAssign
	ld	a, xl
; genPointerSet
	ld	(y), a
	C$pff.c$691$1_0$353 ==.
;	../src/pff.c: 691: return FR_OK;
; genReturn
	clr	a
; genLabel
00121$:
	C$pff.c$692$1_0$353 ==.
;	../src/pff.c: 692: }
; genEndFunction
	addw	sp, #9
	C$pff.c$692$1_0$353 ==.
	XFpff$create_name$0$0 ==.
	ret
	Fpff$follow_path$0$0 ==.
	C$pff.c$742$1_0$360 ==.
;	../src/pff.c: 742: static FRESULT follow_path (	/* FR_OK(0): successful, !=0: error code */
; genLabel
;	-----------------------------------------
;	 function follow_path
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 12 bytes.
_follow_path:
	sub	sp, #12
	C$pff.c$751$1_0$360 ==.
;	../src/pff.c: 751: while (*path == ' ') path++;		/* Strip leading spaces */
; genAssign
	ldw	x, (0x13, sp)
; genLabel
00101$:
; genPointerGet
	ld	a, (x)
; genCmpEQorNE
	cp	a, #0x20
	jrne	00169$
	jp	00170$
00169$:
	jp	00131$
00170$:
; skipping generated iCode
; genPlus
	incw	x
; genAssign
	ldw	(0x13, sp), x
; genGoto
	jp	00101$
; genLabel
00131$:
; genAssign
	ldw	(0x13, sp), x
	C$pff.c$752$1_0$360 ==.
;	../src/pff.c: 752: if (*path == '/') path++;			/* Strip heading separator if exist */
; genAssign
	ldw	x, (0x13, sp)
; genPointerGet
	ld	a, (x)
; genCmpEQorNE
	cp	a, #0x2f
	jrne	00172$
	jp	00173$
00172$:
	jp	00105$
00173$:
; skipping generated iCode
; genPlus
	ldw	x, (0x13, sp)
	incw	x
; genAssign
	ldw	(0x13, sp), x
; genLabel
00105$:
	C$pff.c$753$1_0$360 ==.
;	../src/pff.c: 753: dj->sclust = 0;						/* Set start directory (always root dir) */
; genAssign
	ldw	y, (0x0f, sp)
	ldw	(0x0b, sp), y
; genPlus
	ldw	x, (0x0b, sp)
	addw	x, #0x0004
; genPointerSet
	clrw	y
	ldw	(0x2, x), y
	ldw	(x), y
	C$pff.c$755$1_0$360 ==.
;	../src/pff.c: 755: if ((BYTE)*path < ' ') {			/* Null path means the root directory */
; genAssign
	ldw	x, (0x13, sp)
; genPointerGet
	ld	a, (x)
; genCmp
; genCmpTop
	cp	a, #0x20
	jrc	00174$
	jp	00130$
00174$:
; skipping generated iCode
	C$pff.c$756$2_0$361 ==.
;	../src/pff.c: 756: res = dir_rewind(dj);
; genIPush
	ldw	x, (0x0f, sp)
	pushw	x
; genCall
	call	_dir_rewind
	popw	x
; genAssign
	ld	(0x0c, sp), a
	C$pff.c$757$2_0$361 ==.
;	../src/pff.c: 757: dir[0] = 0;
; genAssign
	ldw	x, (0x11, sp)
; genPointerSet
	clr	(x)
; genGoto
	jp	00117$
; genLabel
00130$:
; genAssign
	ldw	y, (0x0b, sp)
	ldw	(0x01, sp), y
; genAssign
	ldw	y, (0x0b, sp)
	ldw	(0x03, sp), y
; genAssign
	ldw	y, (0x11, sp)
	ldw	(0x05, sp), y
; genLabel
00118$:
	C$pff.c$761$4_0$364 ==.
;	../src/pff.c: 761: res = create_name(dj, &path);	/* Get a segment */
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	ldw	x, sp
	addw	x, #19
	pushw	x
; genIPush
	ldw	x, (0x03, sp)
	pushw	x
; genCall
	call	_create_name
	addw	sp, #4
; genAssign
	ld	(0x0c, sp), a
	C$pff.c$762$4_0$364 ==.
;	../src/pff.c: 762: if (res != FR_OK) break;
; genIfx
	tnz	(0x0c, sp)
	jreq	00175$
	jp	00117$
00175$:
	C$pff.c$763$4_0$364 ==.
;	../src/pff.c: 763: res = dir_find(dj, dir);		/* Find it */
; genIPush
	ldw	x, (0x11, sp)
	pushw	x
; genIPush
	ldw	x, (0x03, sp)
	pushw	x
; genCall
	call	_dir_find
	addw	sp, #4
; genAssign
	ld	(0x0c, sp), a
	C$pff.c$764$4_0$364 ==.
;	../src/pff.c: 764: if (res != FR_OK) break;		/* Could not find the object */
; genIfx
	tnz	(0x0c, sp)
	jreq	00176$
	jp	00117$
00176$:
	C$pff.c$765$4_0$364 ==.
;	../src/pff.c: 765: if (dj->fn[11]) break;			/* Last segment match. Function completed. */
; genPointerGet
	ldw	x, (0x03, sp)
	ldw	x, (0x2, x)
; genAssign
; genPointerGet
	ld	a, (0xb, x)
; genIfx
	tnz	a
	jreq	00177$
	jp	00117$
00177$:
	C$pff.c$766$4_0$364 ==.
;	../src/pff.c: 766: if (!(dir[DIR_Attr] & AM_DIR)) { /* Cannot follow path because it is a file */
; genPointerGet
	ldw	x, (0x05, sp)
	ld	a, (0xb, x)
; genAnd
	bcp	a, #0x10
	jreq	00178$
	jp	00113$
00178$:
; skipping generated iCode
	C$pff.c$767$5_0$365 ==.
;	../src/pff.c: 767: res = FR_NO_FILE; break;
; genAssign
	ld	a, #0x03
	ld	(0x0c, sp), a
; genGoto
	jp	00117$
; genLabel
00113$:
	C$pff.c$769$4_0$364 ==.
;	../src/pff.c: 769: dj->sclust = get_clust(dir);	/* Follow next */
; genPlus
	ldw	x, (0x01, sp)
	addw	x, #0x0004
	ldw	(0x07, sp), x
; genIPush
	ldw	x, (0x11, sp)
	pushw	x
; genCall
	call	_get_clust
	addw	sp, #2
	ldw	(0x09, sp), y
; genPointerSet
	ldw	y, (0x07, sp)
	ldw	(0x2, y), x
	ldw	x, (0x09, sp)
	ldw	(y), x
; genGoto
	jp	00118$
; genLabel
00117$:
	C$pff.c$773$1_0$360 ==.
;	../src/pff.c: 773: return res;
; genReturn
	ld	a, (0x0c, sp)
; genLabel
00120$:
	C$pff.c$774$1_0$360 ==.
;	../src/pff.c: 774: }
; genEndFunction
	addw	sp, #12
	C$pff.c$774$1_0$360 ==.
	XFpff$follow_path$0$0 ==.
	ret
	Fpff$check_fs$0$0 ==.
	C$pff.c$783$1_0$367 ==.
;	../src/pff.c: 783: static BYTE check_fs (	/* 0:The FAT boot record, 1:Valid boot record but not an FAT, 2:Not a boot record, 3:Error */
; genLabel
;	-----------------------------------------
;	 function check_fs
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_check_fs:
	C$pff.c$788$1_0$367 ==.
;	../src/pff.c: 788: if (disk_readp(buf, sect, 510, 2)) {	/* Read the boot record */
; genIPush
	push	#0x02
	push	#0x00
; genIPush
	push	#0xfe
	push	#0x01
; genIPush
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
; genIPush
	ldw	x, (0x0b, sp)
	pushw	x
; genCall
	call	_disk_readp
	addw	sp, #10
; genIfx
	tnz	a
	jrne	00135$
	jp	00102$
00135$:
	C$pff.c$789$2_0$368 ==.
;	../src/pff.c: 789: return 3;
; genReturn
	ld	a, #0x03
	jp	00113$
; genLabel
00102$:
	C$pff.c$791$1_0$367 ==.
;	../src/pff.c: 791: if (ld_word(buf) != 0xAA55) {			/* Check record signature */
; genIPush
	ldw	x, (0x03, sp)
	pushw	x
; genCall
	call	_ld_word
	addw	sp, #2
; genCast
; genAssign
; genCmpEQorNE
	cpw	x, #0xaa55
	jrne	00137$
	jp	00111$
00137$:
; skipping generated iCode
	C$pff.c$792$2_0$369 ==.
;	../src/pff.c: 792: return 2;
; genReturn
	ld	a, #0x02
	jp	00113$
	C$pff.c$798$1_0$367 ==.
;	../src/pff.c: 798: if (PF_FS_FAT32 && !disk_readp(buf, sect, BS_FilSysType32, 2) && ld_word(buf) == 0x4146) {	/* Check FAT32 */
; genLabel
00111$:
; genIPush
	push	#0x02
	push	#0x00
; genIPush
	push	#0x52
	push	#0x00
; genIPush
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
; genIPush
	ldw	x, (0x0b, sp)
	pushw	x
; genCall
	call	_disk_readp
	addw	sp, #10
; genIfx
	tnz	a
	jreq	00139$
	jp	00110$
00139$:
; genIPush
	ldw	x, (0x03, sp)
	pushw	x
; genCall
	call	_ld_word
	addw	sp, #2
; genCast
; genAssign
; genCmpEQorNE
	cpw	x, #0x4146
	jrne	00141$
	jp	00142$
00141$:
	jp	00110$
00142$:
; skipping generated iCode
	C$pff.c$799$2_0$371 ==.
;	../src/pff.c: 799: return 0;
; genReturn
	clr	a
	jp	00113$
; genLabel
00110$:
	C$pff.c$801$1_0$367 ==.
;	../src/pff.c: 801: return 1;
; genReturn
	ld	a, #0x01
; genLabel
00113$:
	C$pff.c$802$1_0$367 ==.
;	../src/pff.c: 802: }
; genEndFunction
	C$pff.c$802$1_0$367 ==.
	XFpff$check_fs$0$0 ==.
	ret
	G$pf_mount$0$0 ==.
	C$pff.c$819$1_0$373 ==.
;	../src/pff.c: 819: FRESULT pf_mount (
; genLabel
;	-----------------------------------------
;	 function pf_mount
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 60 bytes.
_pf_mount:
	sub	sp, #60
	C$pff.c$827$1_0$373 ==.
;	../src/pff.c: 827: FatFs = 0;
; genAssign
	clrw	x
	ldw	_FatFs+0, x
	C$pff.c$829$1_0$373 ==.
;	../src/pff.c: 829: if (disk_initialize() & STA_NOINIT) {	/* Check if the drive is ready or not */
; genCall
	call	_disk_initialize
; genAnd
	srl	a
	jrc	00194$
	jp	00102$
00194$:
; skipping generated iCode
	C$pff.c$830$2_0$374 ==.
;	../src/pff.c: 830: return FR_NOT_READY;
; genReturn
	ld	a, #0x02
	jp	00137$
; genLabel
00102$:
	C$pff.c$834$1_0$373 ==.
;	../src/pff.c: 834: bsect = 0;
; genAssign
	clrw	x
	ldw	(0x37, sp), x
	ldw	(0x35, sp), x
	C$pff.c$835$1_0$373 ==.
;	../src/pff.c: 835: fmt = check_fs(buf, bsect);			/* Check sector 0 as an SFD format */
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	clrw	x
	pushw	x
	clrw	x
	pushw	x
; genIPush
	ldw	x, sp
	addw	x, #5
	pushw	x
; genCall
	call	_check_fs
	addw	sp, #6
; genAssign
	ld	(0x3c, sp), a
	C$pff.c$836$1_0$373 ==.
;	../src/pff.c: 836: if (fmt == 1) {						/* Not an FAT boot record, it may be FDISK format */
; genCmpEQorNE
	ld	a, (0x3c, sp)
	dec	a
	jrne	00196$
	jp	00197$
00196$:
	jp	00109$
00197$:
; skipping generated iCode
	C$pff.c$838$2_0$375 ==.
;	../src/pff.c: 838: if (disk_readp(buf, bsect, MBR_Table, 16)) {	/* 1st partition entry */
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	push	#0x10
	push	#0x00
; genIPush
	push	#0xbe
	push	#0x01
; genIPush
	ldw	x, (0x3b, sp)
	pushw	x
	ldw	x, (0x3b, sp)
	pushw	x
; genIPush
	ldw	x, sp
	addw	x, #9
	pushw	x
; genCall
	call	_disk_readp
	addw	sp, #10
; genIfx
	tnz	a
	jrne	00198$
	jp	00106$
00198$:
	C$pff.c$839$3_0$376 ==.
;	../src/pff.c: 839: fmt = 3;
; genAssign
	ld	a, #0x03
	ld	(0x3c, sp), a
; genGoto
	jp	00109$
; genLabel
00106$:
	C$pff.c$841$3_0$377 ==.
;	../src/pff.c: 841: if (buf[4]) {					/* Is the partition existing? */
; skipping iCode since result will be rematerialized
; genPointerGet
	ld	a, (0x05, sp)
; genIfx
	tnz	a
	jrne	00199$
	jp	00109$
00199$:
	C$pff.c$842$4_0$378 ==.
;	../src/pff.c: 842: bsect = ld_dword(&buf[8]);	/* Partition offset in LBA */
; skipping iCode since result will be rematerialized
; genPlus
	ldw	x, sp
	addw	x, #9
; genCast
; genAssign
; genIPush
	pushw	x
; genCall
	call	_ld_dword
	addw	sp, #2
; genAssign
	ldw	(0x37, sp), x
	ldw	(0x35, sp), y
	C$pff.c$843$4_0$378 ==.
;	../src/pff.c: 843: fmt = check_fs(buf, bsect);	/* Check the partition */
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	ldw	x, (0x37, sp)
	pushw	x
	ldw	x, (0x37, sp)
	pushw	x
; genIPush
	ldw	x, sp
	addw	x, #5
	pushw	x
; genCall
	call	_check_fs
	addw	sp, #6
; genAssign
	ld	(0x3c, sp), a
; genLabel
00109$:
	C$pff.c$847$1_0$373 ==.
;	../src/pff.c: 847: if (fmt == 3) return FR_DISK_ERR;
; genCmpEQorNE
	ld	a, (0x3c, sp)
	cp	a, #0x03
	jrne	00201$
	jp	00202$
00201$:
	jp	00111$
00202$:
; skipping generated iCode
; genReturn
	ld	a, #0x01
	jp	00137$
; genLabel
00111$:
	C$pff.c$848$1_0$373 ==.
;	../src/pff.c: 848: if (fmt) return FR_NO_FILESYSTEM;	/* No valid FAT patition is found */
; genIfx
	tnz	(0x3c, sp)
	jrne	00203$
	jp	00113$
00203$:
; genReturn
	ld	a, #0x06
	jp	00137$
; genLabel
00113$:
	C$pff.c$851$1_0$373 ==.
;	../src/pff.c: 851: if (disk_readp(buf, bsect, 13, sizeof (buf))) return FR_DISK_ERR;
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	push	#0x24
	push	#0x00
; genIPush
	push	#0x0d
	push	#0x00
; genIPush
	ldw	x, (0x3b, sp)
	pushw	x
	ldw	x, (0x3b, sp)
	pushw	x
; genIPush
	ldw	x, sp
	addw	x, #9
	pushw	x
; genCall
	call	_disk_readp
	addw	sp, #10
; genIfx
	tnz	a
	jrne	00204$
	jp	00115$
00204$:
; genReturn
	ld	a, #0x01
	jp	00137$
; genLabel
00115$:
	C$pff.c$853$1_0$373 ==.
;	../src/pff.c: 853: fsize = ld_word(buf+BPB_FATSz16-13);				/* Number of sectors per FAT */
; genAddrOf
	ldw	x, sp
	addw	x, #10
; genCast
; genAssign
; genIPush
	pushw	x
; genCall
	call	_ld_word
	addw	sp, #2
; genCast
; genAssign
	clrw	y
; genAssign
	ldw	(0x3b, sp), x
	ldw	(0x39, sp), y
	C$pff.c$854$1_0$373 ==.
;	../src/pff.c: 854: if (!fsize) fsize = ld_dword(buf+BPB_FATSz32-13);
; genIfx
	ldw	x, (0x3b, sp)
	jrne	00205$
	ldw	x, (0x39, sp)
	jreq	00206$
00205$:
	jp	00117$
00206$:
; genAddrOf
	ldw	x, sp
	addw	x, #24
; genCast
; genAssign
; genIPush
	pushw	x
; genCall
	call	_ld_dword
	addw	sp, #2
; genAssign
	ldw	(0x3b, sp), x
	ldw	(0x39, sp), y
; genLabel
00117$:
	C$pff.c$856$1_0$373 ==.
;	../src/pff.c: 856: fsize *= buf[BPB_NumFATs-13];						/* Number of sectors in FAT area */
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genPointerGet
	ld	a, (0x04, sp)
; genCast
; genAssign
	clrw	x
	ld	xl, a
	clrw	y
; genIPush
	pushw	x
	pushw	y
; genIPush
	ldw	x, (0x3f, sp)
	pushw	x
	ldw	x, (0x3f, sp)
	pushw	x
; genCall
	call	__mullong
	addw	sp, #8
; genAssign
	ldw	(0x27, sp), x
	ldw	(0x25, sp), y
	C$pff.c$857$1_0$373 ==.
;	../src/pff.c: 857: fs->fatbase = bsect + ld_word(buf+BPB_RsvdSecCnt-13); /* FAT start sector (lba) */
; genAssign
	ldw	y, (0x3f, sp)
	ldw	(0x29, sp), y
; genPlus
	ldw	x, (0x29, sp)
	addw	x, #0x000a
	ldw	(0x2b, sp), x
; genMinus
	ldw	x, sp
	addw	x, #-65534
; genCast
; genAssign
; genIPush
	pushw	x
; genCall
	call	_ld_word
	addw	sp, #2
; genCast
; genAssign
	exgw	x, y
	clr	a
	clrw	x
; genPlus
	addw	y, (0x37, sp)
	adc	a, (0x36, sp)
	ld	(0x3a, sp), a
	ld	a, xh
	adc	a, (0x35, sp)
	ld	(0x39, sp), a
; genPointerSet
	ldw	x, (0x2b, sp)
	ldw	(0x2, x), y
	ldw	y, (0x39, sp)
	ldw	(x), y
	C$pff.c$858$1_0$373 ==.
;	../src/pff.c: 858: fs->csize = buf[BPB_SecPerClus-13];					/* Number of sectors per cluster */
; genPlus
	ldw	x, (0x29, sp)
	incw	x
	incw	x
	ldw	(0x2d, sp), x
; genPointerGet
	ld	a, (0x01, sp)
; genPointerSet
	ldw	x, (0x2d, sp)
	ld	(x), a
	C$pff.c$859$1_0$373 ==.
;	../src/pff.c: 859: fs->n_rootdir = ld_word(buf+BPB_RootEntCnt-13);		/* Nmuber of root directory entries */
; genPlus
	ldw	x, (0x29, sp)
	addw	x, #0x0004
	ldw	(0x2f, sp), x
; genMinus
	ldw	x, sp
	addw	x, #-65531
; genCast
; genAssign
; genIPush
	pushw	x
; genCall
	call	_ld_word
	addw	sp, #2
; genPointerSet
	ldw	y, (0x2f, sp)
	ldw	(y), x
	C$pff.c$860$1_0$373 ==.
;	../src/pff.c: 860: tsect = ld_word(buf+BPB_TotSec16-13);				/* Number of sectors on the file system */
; genMinus
	ldw	x, sp
	addw	x, #-65529
; genCast
; genAssign
; genIPush
	pushw	x
; genCall
	call	_ld_word
	addw	sp, #2
; genCast
; genAssign
	clrw	y
; genAssign
	ldw	(0x37, sp), x
	ldw	(0x35, sp), y
	C$pff.c$861$1_0$373 ==.
;	../src/pff.c: 861: if (!tsect) tsect = ld_dword(buf+BPB_TotSec32-13);
; genIfx
	tnzw	x
	jrne	00207$
	tnzw	y
	jreq	00208$
00207$:
	jp	00119$
00208$:
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	ldw	x, sp
	addw	x, #20
	pushw	x
; genCall
	call	_ld_dword
	addw	sp, #2
; genAssign
	ldw	(0x37, sp), x
	ldw	(0x35, sp), y
; genLabel
00119$:
	C$pff.c$863$1_0$373 ==.
;	../src/pff.c: 863: - ld_word(buf+BPB_RsvdSecCnt-13) - fsize - fs->n_rootdir / 16
; genAddrOf
	ldw	x, sp
	incw	x
	incw	x
; genCast
; genAssign
; genIPush
	pushw	x
; genCall
	call	_ld_word
	addw	sp, #2
; genCast
; genAssign
	ldw	(0x3b, sp), x
	clr	(0x3a, sp)
	clr	(0x39, sp)
; genMinus
	ldw	y, (0x37, sp)
	subw	y, (0x3b, sp)
	ld	a, (0x36, sp)
	sbc	a, (0x3a, sp)
	push	a
	ld	a, (0x36, sp)
	sbc	a, (0x3a, sp)
	ld	xl, a
	pop	a
; genMinus
	subw	y, (0x27, sp)
	sbc	a, (0x26, sp)
	ld	(0x32, sp), a
	ld	a, xl
	sbc	a, (0x25, sp)
; genPointerGet
	ldw	x, (0x2f, sp)
	ldw	x, (x)
; genCast
; genAssign
; genRightShiftLiteral
	srlw	x
	srlw	x
	srlw	x
	srlw	x
; genCast
; genAssign
	ldw	(0x37, sp), x
	clrw	x
	clr	(0x35, sp)
; genMinus
	subw	y, (0x37, sp)
	ldw	(0x3b, sp), y
	push	a
	ld	a, (0x33, sp)
	pushw	x
	sbc	a, (2, sp)
	popw	x
	ld	(0x3b, sp), a
	pop	a
	sbc	a, (0x35, sp)
	ld	(0x39, sp), a
	C$pff.c$864$1_0$373 ==.
;	../src/pff.c: 864: ) / fs->csize + 2;
; genPointerGet
	ldw	x, (0x2d, sp)
	ld	a, (x)
; genCast
; genAssign
	clrw	x
	ld	xl, a
	clrw	y
; genIPush
	pushw	x
	pushw	y
; genIPush
	ldw	x, (0x3f, sp)
	pushw	x
	ldw	x, (0x3f, sp)
	pushw	x
; genCall
	call	__divulong
	addw	sp, #8
	ldw	(0x39, sp), y
; genPlus
	addw	x, #0x0002
	exgw	x, y
	ldw	x, (0x39, sp)
	jrnc	00209$
	incw	x
00209$:
; genAssign
	ldw	(0x39, sp), x
	C$pff.c$865$1_0$373 ==.
;	../src/pff.c: 865: fs->n_fatent = (CLUST)mclst;
; genPlus
	ldw	x, (0x29, sp)
	addw	x, #0x0006
; genPointerSet
	ldw	(0x2, x), y
	ld	a, (0x3a, sp)
	ld	(0x1, x), a
	ld	a, (0x39, sp)
	ld	(x), a
	C$pff.c$867$1_0$373 ==.
;	../src/pff.c: 867: fmt = 0;							/* Determine the FAT sub type */
; genAssign
	clr	a
	C$pff.c$870$1_0$373 ==.
;	../src/pff.c: 870: if (PF_FS_FAT32 && mclst >= 0xFFF7) fmt = FS_FAT32;
; genCmp
; genCmpTop
	cpw	y, #0xfff7
	push	a
	ld	a, (0x3b, sp)
	sbc	a, #0x00
	ld	a, (0x3a, sp)
	sbc	a, #0x00
	pop	a
	jrnc	00210$
	jp	00128$
00210$:
; skipping generated iCode
; genAssign
	ld	a, #0x03
; genLabel
00128$:
	C$pff.c$871$1_0$373 ==.
;	../src/pff.c: 871: if (!fmt) return FR_NO_FILESYSTEM;
; genIfx
	tnz	a
	jreq	00211$
	jp	00131$
00211$:
; genReturn
	ld	a, #0x06
	jp	00137$
; genLabel
00131$:
	C$pff.c$872$1_0$373 ==.
;	../src/pff.c: 872: fs->fs_type = fmt;
; genPointerSet
	ldw	x, (0x29, sp)
	ld	(x), a
	C$pff.c$875$2_0$379 ==.
;	../src/pff.c: 875: fs->dirbase = ld_dword(buf+(BPB_RootClus-13));	/* Root directory start cluster */
; genPlus
	ldw	x, (0x29, sp)
	addw	x, #0x000e
	ldw	(0x37, sp), x
; genAddrOf
	ldw	x, sp
	addw	x, #32
; genCast
; genAssign
; genIPush
	pushw	x
; genCall
	call	_ld_dword
	addw	sp, #2
	ldw	(0x39, sp), y
; genPointerSet
	ldw	y, (0x37, sp)
	ldw	(0x2, y), x
	ldw	x, (0x39, sp)
	ldw	(y), x
	C$pff.c$879$1_0$373 ==.
;	../src/pff.c: 879: fs->database = fs->fatbase + fsize + fs->n_rootdir / 16;	/* Data start sector (lba) */
; genPlus
	ldw	x, (0x29, sp)
	addw	x, #0x0012
	ldw	(0x3b, sp), x
; genPointerGet
	ldw	x, (0x2b, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
; genPlus
	addw	y, (0x27, sp)
	ldw	(0x39, sp), y
	ld	a, xl
	adc	a, (0x26, sp)
	ld	(0x38, sp), a
	ld	a, xh
	adc	a, (0x25, sp)
; genPointerGet
	ldw	x, (0x2f, sp)
	ldw	x, (x)
; genCast
; genAssign
; genRightShiftLiteral
	srlw	x
	srlw	x
	srlw	x
	srlw	x
; genCast
; genAssign
	exgw	x, y
	clrw	x
	clr	(0x2f, sp)
; genPlus
	addw	y, (0x39, sp)
	push	a
	ld	a, xl
	adc	a, (0x39, sp)
	ld	(0x35, sp), a
	pop	a
	adc	a, (0x2f, sp)
	ld	(0x33, sp), a
; genPointerSet
	ldw	x, (0x3b, sp)
	ldw	(0x2, x), y
	ldw	y, (0x33, sp)
	ldw	(x), y
	C$pff.c$881$1_0$373 ==.
;	../src/pff.c: 881: fs->flag = 0;
; genPlus
	ldw	x, (0x29, sp)
	incw	x
; genPointerSet
	clr	(x)
	C$pff.c$882$1_0$373 ==.
;	../src/pff.c: 882: FatFs = fs;
; genAssign
	ldw	x, (0x29, sp)
; genAssign
	ldw	_FatFs+0, x
	C$pff.c$884$1_0$373 ==.
;	../src/pff.c: 884: return FR_OK;
; genReturn
	clr	a
; genLabel
00137$:
	C$pff.c$885$1_0$373 ==.
;	../src/pff.c: 885: }
; genEndFunction
	addw	sp, #60
	C$pff.c$885$1_0$373 ==.
	XG$pf_mount$0$0 ==.
	ret
	G$pf_open$0$0 ==.
	C$pff.c$894$1_0$382 ==.
;	../src/pff.c: 894: FRESULT pf_open (
; genLabel
;	-----------------------------------------
;	 function pf_open
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 70 bytes.
_pf_open:
	sub	sp, #70
	C$pff.c$901$2_0$382 ==.
;	../src/pff.c: 901: FATFS *fs = FatFs;
; genAssign
	ldw	x, _FatFs+0
	ldw	(0x3d, sp), x
	C$pff.c$904$1_0$382 ==.
;	../src/pff.c: 904: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
; genIfx
	ldw	x, (0x3d, sp)
	jreq	00125$
	jp	00102$
00125$:
; genReturn
	ld	a, #0x05
	jp	00108$
; genLabel
00102$:
	C$pff.c$906$1_0$382 ==.
;	../src/pff.c: 906: fs->flag = 0;
; genPlus
	ldw	x, (0x3d, sp)
	incw	x
	ldw	(0x3f, sp), x
; genPointerSet
	ldw	x, (0x3f, sp)
	clr	(x)
	C$pff.c$907$1_0$382 ==.
;	../src/pff.c: 907: dj.fn = sp;
; skipping iCode since result will be rematerialized
; genPlus
	ldw	x, sp
	addw	x, #3
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genPointerSet
	ldw	y, sp
	addw	y, #17
	ldw	(x), y
	C$pff.c$908$1_0$382 ==.
;	../src/pff.c: 908: res = follow_path(&dj, dir, path);	/* Follow the file path */
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	ldw	x, (0x49, sp)
	pushw	x
; genIPush
	ldw	x, sp
	addw	x, #31
	pushw	x
; genIPush
	ldw	x, sp
	addw	x, #5
	pushw	x
; genCall
	call	_follow_path
	addw	sp, #6
; genAssign
	ld	xl, a
	C$pff.c$909$1_0$382 ==.
;	../src/pff.c: 909: if (res != FR_OK) return res;		/* Follow failed */
; genIfx
	tnz	a
	jrne	00126$
	jp	00104$
00126$:
; genReturn
	ld	a, xl
	jp	00108$
; genLabel
00104$:
	C$pff.c$910$1_0$382 ==.
;	../src/pff.c: 910: if (!dir[0] || (dir[DIR_Attr] & AM_DIR)) return FR_NO_FILE;	/* It is a directory */
; skipping iCode since result will be rematerialized
; genPointerGet
	ld	a, (0x1d, sp)
; genIfx
	tnz	a
	jrne	00127$
	jp	00105$
00127$:
; skipping iCode since result will be rematerialized
; genPointerGet
	ld	a, (0x28, sp)
; genAnd
	bcp	a, #0x10
	jrne	00128$
	jp	00106$
00128$:
; skipping generated iCode
; genLabel
00105$:
; genReturn
	ld	a, #0x03
	jp	00108$
; genLabel
00106$:
	C$pff.c$912$1_0$382 ==.
;	../src/pff.c: 912: fs->org_clust = get_clust(dir);		/* File start cluster */
; genPlus
	ldw	x, (0x3d, sp)
	addw	x, #0x001e
	ldw	(0x41, sp), x
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	ldw	x, sp
	addw	x, #29
	pushw	x
; genCall
	call	_get_clust
	addw	sp, #2
	ldw	(0x43, sp), y
; genPointerSet
	ldw	y, (0x41, sp)
	ldw	(0x2, y), x
	ldw	x, (0x43, sp)
	ldw	(y), x
	C$pff.c$913$1_0$382 ==.
;	../src/pff.c: 913: fs->fsize = ld_dword(dir+DIR_FileSize);	/* File size */
; genPlus
	ldw	x, (0x3d, sp)
	addw	x, #0x001a
	ldw	(0x41, sp), x
; genPlus
	ldw	x, sp
	addw	x, #57
; genCast
; genAssign
; genIPush
	pushw	x
; genCall
	call	_ld_dword
	addw	sp, #2
	ldw	(0x43, sp), y
; genPointerSet
	ldw	y, (0x41, sp)
	ldw	(0x2, y), x
	ldw	x, (0x43, sp)
	ldw	(y), x
	C$pff.c$914$1_0$382 ==.
;	../src/pff.c: 914: fs->fptr = 0;						/* File pointer */
; genPlus
	ldw	x, (0x3d, sp)
	addw	x, #0x0016
; genPointerSet
	clrw	y
	ldw	(0x2, x), y
	ldw	(x), y
	C$pff.c$915$1_0$382 ==.
;	../src/pff.c: 915: fs->flag = FA_OPENED;
; genPointerSet
	ldw	x, (0x3f, sp)
	ld	a, #0x01
	ld	(x), a
	C$pff.c$917$1_0$382 ==.
;	../src/pff.c: 917: return FR_OK;
; genReturn
	clr	a
; genLabel
00108$:
	C$pff.c$918$1_0$382 ==.
;	../src/pff.c: 918: }
; genEndFunction
	addw	sp, #70
	C$pff.c$918$1_0$382 ==.
	XG$pf_open$0$0 ==.
	ret
	G$pf_read$0$0 ==.
	C$pff.c$928$1_0$384 ==.
;	../src/pff.c: 928: FRESULT pf_read (
; genLabel
;	-----------------------------------------
;	 function pf_read
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 26 bytes.
_pf_read:
	sub	sp, #26
	C$pff.c$938$2_0$384 ==.
;	../src/pff.c: 938: BYTE cs, *rbuff = buff;
; genCast
; genAssign
	ldw	x, (0x1d, sp)
; genAssign
	ldw	(0x01, sp), x
	C$pff.c$939$2_0$384 ==.
;	../src/pff.c: 939: FATFS *fs = FatFs;
; genAssign
	ldw	x, _FatFs+0
	ldw	(0x19, sp), x
	C$pff.c$942$1_0$384 ==.
;	../src/pff.c: 942: *br = 0;
; genAssign
	ldw	y, (0x21, sp)
	ldw	(0x03, sp), y
; genPointerSet
	ldw	x, (0x03, sp)
	clr	(0x1, x)
	clr	(x)
	C$pff.c$943$1_0$384 ==.
;	../src/pff.c: 943: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
; genIfx
	ldw	x, (0x19, sp)
	jreq	00194$
	jp	00102$
00194$:
; genReturn
	ld	a, #0x05
	jp	00127$
; genLabel
00102$:
	C$pff.c$944$1_0$384 ==.
;	../src/pff.c: 944: if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
; genPlus
	ldw	x, (0x19, sp)
	incw	x
	ldw	(0x05, sp), x
; genPointerGet
	ldw	x, (0x05, sp)
	ld	a, (x)
; genAnd
	srl	a
	jrnc	00195$
	jp	00104$
00195$:
; skipping generated iCode
; genReturn
	ld	a, #0x04
	jp	00127$
; genLabel
00104$:
	C$pff.c$946$1_0$384 ==.
;	../src/pff.c: 946: remain = fs->fsize - fs->fptr;
; genAssign
	ldw	x, (0x19, sp)
; genPointerGet
	ldw	y, x
	ldw	y, (0x1c, y)
	ldw	x, (0x1a, x)
	ldw	(0x0f, sp), x
; genPlus
	ldw	x, (0x19, sp)
	addw	x, #0x0016
	ldw	(0x17, sp), x
; genPointerGet
	ldw	x, (0x17, sp)
	ld	a, (0x3, x)
	ld	(0x16, sp), a
	ld	a, (0x2, x)
	ld	(0x15, sp), a
	ldw	x, (x)
; genMinus
	subw	y, (0x15, sp)
	ld	a, (0x10, sp)
	pushw	x
	sbc	a, (2, sp)
	popw	x
	ld	xl, a
	ld	a, (0x0f, sp)
	pushw	x
	sbc	a, (1, sp)
	popw	x
; genAssign
	ldw	(0x11, sp), y
	ld	xh, a
	C$pff.c$947$1_0$384 ==.
;	../src/pff.c: 947: if (btr > remain) btr = (UINT)remain;			/* Truncate btr by remaining bytes */
; genCast
; genAssign
	ldw	y, (0x1f, sp)
	ldw	(0x15, sp), y
	clr	(0x14, sp)
	clr	(0x13, sp)
; genCmp
; genCmpTop
	ld	a, (0x12, sp)
	cp	a, (0x16, sp)
	ld	a, (0x11, sp)
	sbc	a, (0x15, sp)
	ld	a, xl
	sbc	a, (0x14, sp)
	ld	a, xh
	sbc	a, (0x13, sp)
	jrc	00196$
	jp	00140$
00196$:
; skipping generated iCode
; genCast
; genAssign
	ldw	x, (0x11, sp)
; genAssign
	ldw	(0x1f, sp), x
	C$pff.c$949$1_0$384 ==.
;	../src/pff.c: 949: while (btr)	{									/* Repeat until all data transferred */
; genLabel
00140$:
; genAssign
	ldw	y, (0x17, sp)
	ldw	(0x07, sp), y
; genPlus
	ldw	x, (0x19, sp)
	addw	x, #0x0022
	ldw	(0x09, sp), x
; genAssign
	ldw	y, (0x19, sp)
	ldw	(0x0b, sp), y
; genAssign
	ldw	y, (0x19, sp)
	ldw	(0x0d, sp), y
; genPlus
	ldw	x, (0x19, sp)
	addw	x, #0x0026
	ldw	(0x0f, sp), x
; genLabel
00124$:
; genIfx
	ldw	x, (0x1f, sp)
	jrne	00197$
	jp	00126$
00197$:
	C$pff.c$950$1_0$384 ==.
;	../src/pff.c: 950: if ((fs->fptr % 512) == 0) {				/* On the sector boundary? */
; genPointerGet
	ldw	x, (0x07, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	(0x13, sp), y
	ldw	x, (x)
	ldw	(0x11, sp), x
; genAnd
	ld	a, (0x14, sp)
	ld	(0x1a, sp), a
	ld	a, (0x13, sp)
	and	a, #0x01
	ld	(0x19, sp), a
	clrw	x
	ldw	(0x17, sp), x
; genIfx
	ldw	x, (0x19, sp)
	jrne	00198$
	ldw	x, (0x17, sp)
	jreq	00199$
00198$:
	jp	00117$
00199$:
	C$pff.c$951$3_0$386 ==.
;	../src/pff.c: 951: cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
; genRightShiftLiteral
	ldw	y, (0x12, sp)
	ldw	(0x17, sp), y
	ld	a, (0x11, sp)
	ld	(0x16, sp), a
	clr	(0x15, sp)
	srl	(0x16, sp)
	rrc	(0x17, sp)
	rrc	(0x18, sp)
; genPointerGet
	ldw	x, (0x0d, sp)
	ld	a, (0x2, x)
	ld	(0x1a, sp), a
; genCast
; genAssign
; genMinus
	dec	(0x1a, sp)
; genCast
; genAssign
	ld	a, (0x1a, sp)
	ld	(0x19, sp), a
; genCast
; genAssign
	ld	a, (0x18, sp)
	ld	(0x1a, sp), a
; genAnd
	ld	a, (0x1a, sp)
	and	a, (0x19, sp)
; genAssign
	ld	(0x1a, sp), a
	C$pff.c$952$3_0$386 ==.
;	../src/pff.c: 952: if (!cs) {								/* On the cluster boundary? */
; genIfx
	tnz	a
	jreq	00200$
	jp	00113$
00200$:
	C$pff.c$953$4_0$387 ==.
;	../src/pff.c: 953: if (fs->fptr == 0) {				/* On the top of the file? */
; genIfx
	ldw	x, (0x13, sp)
	jrne	00201$
	ldw	x, (0x11, sp)
	jreq	00202$
00201$:
	jp	00108$
00202$:
	C$pff.c$954$5_0$388 ==.
;	../src/pff.c: 954: clst = fs->org_clust;
; genPointerGet
	ldw	x, (0x0b, sp)
	ldw	y, x
	ldw	y, (0x20, y)
	ldw	x, (0x1e, x)
; genAssign
	ldw	(0x18, sp), y
	ldw	(0x16, sp), x
; genGoto
	jp	00109$
; genLabel
00108$:
	C$pff.c$956$5_0$389 ==.
;	../src/pff.c: 956: clst = get_fat(fs->curr_clust);
; genPointerGet
	ldw	x, (0x09, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
; genIPush
	pushw	y
	pushw	x
; genCall
	call	_get_fat
	addw	sp, #4
	ldw	(0x16, sp), y
; genAssign
	ldw	(0x18, sp), x
; genLabel
00109$:
	C$pff.c$958$4_0$387 ==.
;	../src/pff.c: 958: if (clst <= 1) ABORT(FR_DISK_ERR);
; genCmp
; genCmpTop
	clrw	x
	incw	x
	cpw	x, (0x18, sp)
	clr	a
	sbc	a, (0x17, sp)
	clr	a
	sbc	a, (0x16, sp)
	jrnc	00203$
	jp	00111$
00203$:
; skipping generated iCode
; genPointerSet
	ldw	x, (0x05, sp)
	clr	(x)
; genReturn
	ld	a, #0x01
	jp	00127$
; genLabel
00111$:
	C$pff.c$959$4_0$387 ==.
;	../src/pff.c: 959: fs->curr_clust = clst;				/* Update current cluster */
; genPointerSet
	ldw	x, (0x09, sp)
	ldw	y, (0x18, sp)
	ldw	(0x2, x), y
	ldw	y, (0x16, sp)
	ldw	(x), y
; genLabel
00113$:
	C$pff.c$961$3_0$386 ==.
;	../src/pff.c: 961: sect = clust2sect(fs->curr_clust);		/* Get current sector */
; genPointerGet
	ldw	x, (0x09, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
; genIPush
	pushw	y
	pushw	x
; genCall
	call	_clust2sect
	addw	sp, #4
; genAssign
	ldw	(0x18, sp), x
	ldw	(0x16, sp), y
	C$pff.c$962$3_0$386 ==.
;	../src/pff.c: 962: if (!sect) ABORT(FR_DISK_ERR);
; genIfx
	tnzw	x
	jrne	00204$
	tnzw	y
	jreq	00205$
00204$:
	jp	00115$
00205$:
; genPointerSet
	ldw	x, (0x05, sp)
	clr	(x)
; genReturn
	ld	a, #0x01
	jp	00127$
; genLabel
00115$:
	C$pff.c$963$3_0$386 ==.
;	../src/pff.c: 963: fs->dsect = sect + cs;
; genCast
; genAssign
	ld	a, (0x1a, sp)
	clrw	y
	clrw	x
; genPlus
	ld	yl, a
	addw	y, (0x18, sp)
	ld	a, xl
	adc	a, (0x17, sp)
	ld	(0x13, sp), a
	ld	a, xh
	adc	a, (0x16, sp)
	ld	(0x12, sp), a
; genPointerSet
	ldw	x, (0x0f, sp)
	ldw	(0x2, x), y
	ldw	y, (0x12, sp)
	ldw	(x), y
; genLabel
00117$:
	C$pff.c$950$1_0$384 ==.
;	../src/pff.c: 950: if ((fs->fptr % 512) == 0) {				/* On the sector boundary? */
; genPointerGet
	ldw	x, (0x07, sp)
	ldw	x, (0x2, x)
	C$pff.c$965$1_0$384 ==.
;	../src/pff.c: 965: rcnt = 512 - (UINT)fs->fptr % 512;			/* Get partial sector data from sector buffer */
; genAssign
	ld	a, xl
; genAnd
	ld	(0x16, sp), a
	ld	a, xh
	and	a, #0x01
	ld	(0x15, sp), a
; genMinus
	clrw	x
	ld	a, #0x02
	ld	xh, a
	subw	x, (0x15, sp)
; genAssign
	ldw	(0x11, sp), x
	C$pff.c$966$2_0$385 ==.
;	../src/pff.c: 966: if (rcnt > btr) rcnt = btr;
; genCmp
; genCmpTop
	ldw	x, (0x11, sp)
	cpw	x, (0x1f, sp)
	jrugt	00206$
	jp	00119$
00206$:
; skipping generated iCode
; genAssign
	ldw	y, (0x1f, sp)
	ldw	(0x11, sp), y
; genLabel
00119$:
	C$pff.c$967$2_0$385 ==.
;	../src/pff.c: 967: dr = disk_readp(rbuff, fs->dsect, (UINT)fs->fptr % 512, rcnt);
; genPointerGet
	ldw	x, (0x0f, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	ldw	(0x17, sp), x
; genIPush
	ldw	x, (0x11, sp)
	pushw	x
; genIPush
	ldw	x, (0x17, sp)
	pushw	x
; genIPush
	pushw	y
	ldw	x, (0x1d, sp)
	pushw	x
; genIPush
	ldw	x, (0x09, sp)
	pushw	x
; genCall
	call	_disk_readp
	addw	sp, #10
	C$pff.c$968$2_0$385 ==.
;	../src/pff.c: 968: if (dr) ABORT(FR_DISK_ERR);
; genIfx
	tnz	a
	jrne	00207$
	jp	00121$
00207$:
; genPointerSet
	ldw	x, (0x05, sp)
	clr	(x)
; genReturn
	ld	a, #0x01
	jp	00127$
; genLabel
00121$:
	C$pff.c$969$2_0$385 ==.
;	../src/pff.c: 969: fs->fptr += rcnt;							/* Advances file read pointer */
; genPointerGet
	ldw	x, (0x07, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	(0x15, sp), y
	ldw	x, (x)
	ldw	(0x13, sp), x
; genCast
; genAssign
	ldw	y, (0x11, sp)
	clr	a
	clrw	x
; genPlus
	addw	y, (0x15, sp)
	adc	a, (0x14, sp)
	ld	(0x18, sp), a
	ld	a, xl
	adc	a, (0x13, sp)
	ld	(0x17, sp), a
; genPointerSet
	ldw	x, (0x07, sp)
	ldw	(0x2, x), y
	ldw	y, (0x17, sp)
	ldw	(x), y
	C$pff.c$970$2_0$385 ==.
;	../src/pff.c: 970: btr -= rcnt; *br += rcnt;					/* Update read counter */
; genMinus
	ldw	x, (0x1f, sp)
	subw	x, (0x11, sp)
; genAssign
	ldw	(0x1f, sp), x
; genPointerGet
	ldw	x, (0x03, sp)
	ldw	x, (x)
; genPlus
	addw	x, (0x11, sp)
; genPointerSet
	ldw	y, (0x03, sp)
	ldw	(y), x
	C$pff.c$971$2_0$385 ==.
;	../src/pff.c: 971: if (rbuff) rbuff += rcnt;					/* Advances the data pointer if destination is memory */
; genIfx
	ldw	x, (0x01, sp)
	jrne	00208$
	jp	00124$
00208$:
; genPlus
	ldw	x, (0x01, sp)
	addw	x, (0x11, sp)
; genAssign
	ldw	(0x01, sp), x
; genGoto
	jp	00124$
; genLabel
00126$:
	C$pff.c$974$1_0$384 ==.
;	../src/pff.c: 974: return FR_OK;
; genReturn
	clr	a
; genLabel
00127$:
	C$pff.c$975$1_0$384 ==.
;	../src/pff.c: 975: }
; genEndFunction
	addw	sp, #26
	C$pff.c$975$1_0$384 ==.
	XG$pf_read$0$0 ==.
	ret
	G$pf_write$0$0 ==.
	C$pff.c$985$1_0$394 ==.
;	../src/pff.c: 985: FRESULT pf_write (
; genLabel
;	-----------------------------------------
;	 function pf_write
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 30 bytes.
_pf_write:
	sub	sp, #30
	C$pff.c$993$2_0$394 ==.
;	../src/pff.c: 993: const BYTE *p = buff;
; genCast
; genAssign
	ldw	x, (0x21, sp)
; genAssign
	ldw	(0x05, sp), x
	C$pff.c$996$2_0$394 ==.
;	../src/pff.c: 996: FATFS *fs = FatFs;
; genAssign
	ldw	x, _FatFs+0
	ldw	(0x07, sp), x
	C$pff.c$999$1_0$394 ==.
;	../src/pff.c: 999: *bw = 0;
; genAssign
	ldw	y, (0x25, sp)
	ldw	(0x09, sp), y
; genPointerSet
	ldw	x, (0x09, sp)
	clr	(0x1, x)
	clr	(x)
	C$pff.c$1000$1_0$394 ==.
;	../src/pff.c: 1000: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
; genIfx
	ldw	x, (0x07, sp)
	jreq	00236$
	jp	00102$
00236$:
; genReturn
	ld	a, #0x05
	jp	00139$
; genLabel
00102$:
	C$pff.c$1001$1_0$394 ==.
;	../src/pff.c: 1001: if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
; genPlus
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x0b, sp), x
; genPointerGet
	ldw	x, (0x0b, sp)
	ld	a, (x)
; genAnd
	bcp	a, #0x01
	jreq	00237$
	jp	00104$
00237$:
; skipping generated iCode
; genReturn
	ld	a, #0x04
	jp	00139$
; genLabel
00104$:
	C$pff.c$1004$1_0$394 ==.
;	../src/pff.c: 1004: if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
; genAnd
	and	a, #0x40
	ld	(0x1c, sp), a
	clr	(0x1b, sp)
	C$pff.c$1003$1_0$394 ==.
;	../src/pff.c: 1003: if (!btw) {		/* Finalize request */
; genIfx
	ldw	x, (0x23, sp)
	jreq	00238$
	jp	00111$
00238$:
	C$pff.c$1004$2_0$395 ==.
;	../src/pff.c: 1004: if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
; genIfx
	ldw	x, (0x1b, sp)
	jrne	00239$
	jp	00106$
00239$:
; genIPush
	clrw	x
	pushw	x
	clrw	x
	pushw	x
; genIPush
	clrw	x
	pushw	x
; genCall
	call	_disk_writep
	addw	sp, #6
; genIfx
	tnz	a
	jrne	00240$
	jp	00106$
00240$:
; genPointerSet
	ldw	x, (0x0b, sp)
	clr	(x)
; genReturn
	ld	a, #0x01
	jp	00139$
; genLabel
00106$:
	C$pff.c$1005$2_0$395 ==.
;	../src/pff.c: 1005: fs->flag &= ~FA__WIP;
; genPointerGet
	ldw	x, (0x0b, sp)
	ld	a, (x)
; genAnd
	and	a, #0xbf
; genPointerSet
	ldw	x, (0x0b, sp)
	ld	(x), a
	C$pff.c$1006$2_0$395 ==.
;	../src/pff.c: 1006: return FR_OK;
; genReturn
	clr	a
	jp	00139$
; genLabel
00111$:
	C$pff.c$1009$1_0$394 ==.
;	../src/pff.c: 1009: fs->fptr &= 0xFFFFFE00;
; genPlus
	ldw	x, (0x07, sp)
	addw	x, #0x0016
	ldw	(0x1d, sp), x
	C$pff.c$1008$2_0$397 ==.
;	../src/pff.c: 1008: if (!(fs->flag & FA__WIP)) {	/* Round-down fptr to the sector boundary */
; genIfx
	ldw	x, (0x1b, sp)
	jreq	00241$
	jp	00112$
00241$:
	C$pff.c$1009$3_0$398 ==.
;	../src/pff.c: 1009: fs->fptr &= 0xFFFFFE00;
; genPointerGet
	ldw	x, (0x1d, sp)
	ld	a, (0x3, x)
	ld	yl, a
	ld	a, (0x2, x)
	ldw	x, (x)
; genAnd
	and	a, #0xfe
	ld	yh, a
	clr	a
	ld	yl, a
	rlwa	x
	ld	(0x19, sp), a
	rrwa	x
	ld	a, xl
; genPointerSet
	ldw	x, (0x1d, sp)
	ldw	(0x2, x), y
	ld	(0x1, x), a
	ld	a, (0x19, sp)
	ld	(x), a
; genLabel
00112$:
	C$pff.c$1012$1_0$394 ==.
;	../src/pff.c: 1012: remain = fs->fsize - fs->fptr;
; genAssign
	ldw	x, (0x07, sp)
; genPointerGet
	ldw	y, x
	ldw	y, (0x1c, y)
	ldw	x, (0x1a, x)
	ldw	(0x15, sp), x
; genPointerGet
	ldw	x, (0x1d, sp)
	ld	a, (0x3, x)
	ld	(0x1c, sp), a
	ld	a, (0x2, x)
	ld	(0x1b, sp), a
	ldw	x, (x)
	ldw	(0x19, sp), x
; genMinus
	subw	y, (0x1b, sp)
	ld	a, (0x16, sp)
	sbc	a, (0x1a, sp)
	ld	xl, a
	ld	a, (0x15, sp)
	sbc	a, (0x19, sp)
; genAssign
	ldw	(0x17, sp), y
	ld	xh, a
	C$pff.c$1013$1_0$394 ==.
;	../src/pff.c: 1013: if (btw > remain) btw = (UINT)remain;			/* Truncate btw by remaining bytes */
; genCast
; genAssign
	ldw	y, (0x23, sp)
	ldw	(0x1b, sp), y
	clr	(0x1a, sp)
	clr	(0x19, sp)
; genCmp
; genCmpTop
	ld	a, (0x18, sp)
	cp	a, (0x1c, sp)
	ld	a, (0x17, sp)
	sbc	a, (0x1b, sp)
	ld	a, xl
	sbc	a, (0x1a, sp)
	ld	a, xh
	sbc	a, (0x19, sp)
	jrc	00242$
	jp	00157$
00242$:
; skipping generated iCode
; genCast
; genAssign
	ldw	x, (0x17, sp)
; genAssign
	ldw	(0x23, sp), x
	C$pff.c$1015$1_0$394 ==.
;	../src/pff.c: 1015: while (btw)	{									/* Repeat until all data transferred */
; genLabel
00157$:
; genAssign
	ldw	y, (0x1d, sp)
	ldw	(0x0d, sp), y
; genPlus
	ldw	x, (0x07, sp)
	addw	x, #0x0022
	ldw	(0x0f, sp), x
; genAssign
	ldw	y, (0x07, sp)
	ldw	(0x11, sp), y
; genAssign
	ldw	y, (0x07, sp)
	ldw	(0x13, sp), y
; genLabel
00136$:
; genIfx
	ldw	x, (0x23, sp)
	jrne	00243$
	jp	00138$
00243$:
	C$pff.c$1016$1_0$394 ==.
;	../src/pff.c: 1016: if ((UINT)fs->fptr % 512 == 0) {			/* On the sector boundary? */
; genPointerGet
	ldw	x, (0x0d, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	(0x17, sp), y
	ldw	x, (x)
	ldw	(0x15, sp), x
; genCast
; genAssign
	ldw	x, (0x17, sp)
; genAnd
	exg	a, xl
	ld	(0x1e, sp), a
	exg	a, xl
	ld	a, xh
	and	a, #0x01
	ld	(0x1d, sp), a
; genIfx
	ldw	x, (0x1d, sp)
	jreq	00244$
	jp	00127$
00244$:
	C$pff.c$1017$3_0$400 ==.
;	../src/pff.c: 1017: cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
; genRightShiftLiteral
	ldw	y, (0x16, sp)
	ldw	(0x1b, sp), y
	ld	a, (0x15, sp)
	ld	(0x1a, sp), a
	clr	(0x19, sp)
	srl	(0x1a, sp)
	rrc	(0x1b, sp)
	rrc	(0x1c, sp)
; genPointerGet
	ldw	x, (0x13, sp)
	ld	a, (0x2, x)
	ld	(0x1e, sp), a
; genCast
; genAssign
; genMinus
	dec	(0x1e, sp)
; genCast
; genAssign
	ld	a, (0x1e, sp)
	ld	(0x1d, sp), a
; genCast
; genAssign
	ld	a, (0x1c, sp)
	ld	(0x1e, sp), a
; genAnd
	ld	a, (0x1e, sp)
	and	a, (0x1d, sp)
; genAssign
	ld	(0x1e, sp), a
	C$pff.c$1018$3_0$400 ==.
;	../src/pff.c: 1018: if (!cs) {								/* On the cluster boundary? */
; genIfx
	tnz	a
	jreq	00245$
	jp	00121$
00245$:
	C$pff.c$1019$4_0$401 ==.
;	../src/pff.c: 1019: if (fs->fptr == 0) {				/* On the top of the file? */
; genIfx
	ldw	x, (0x17, sp)
	jrne	00246$
	ldw	x, (0x15, sp)
	jreq	00247$
00246$:
	jp	00116$
00247$:
	C$pff.c$1020$5_0$402 ==.
;	../src/pff.c: 1020: clst = fs->org_clust;
; genPointerGet
	ldw	x, (0x11, sp)
	ldw	y, x
	ldw	y, (0x20, y)
	ldw	x, (0x1e, x)
; genAssign
	ldw	(0x1c, sp), y
	ldw	(0x1a, sp), x
; genGoto
	jp	00117$
; genLabel
00116$:
	C$pff.c$1022$5_0$403 ==.
;	../src/pff.c: 1022: clst = get_fat(fs->curr_clust);
; genPointerGet
	ldw	x, (0x0f, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
; genIPush
	pushw	y
	pushw	x
; genCall
	call	_get_fat
	addw	sp, #4
	ldw	(0x1a, sp), y
; genAssign
	ldw	(0x1c, sp), x
; genLabel
00117$:
	C$pff.c$1024$4_0$401 ==.
;	../src/pff.c: 1024: if (clst <= 1) ABORT(FR_DISK_ERR);
; genCmp
; genCmpTop
	clrw	x
	incw	x
	cpw	x, (0x1c, sp)
	clr	a
	sbc	a, (0x1b, sp)
	clr	a
	sbc	a, (0x1a, sp)
	jrnc	00248$
	jp	00119$
00248$:
; skipping generated iCode
; genPointerSet
	ldw	x, (0x0b, sp)
	clr	(x)
; genReturn
	ld	a, #0x01
	jp	00139$
; genLabel
00119$:
	C$pff.c$1025$4_0$401 ==.
;	../src/pff.c: 1025: fs->curr_clust = clst;				/* Update current cluster */
; genPointerSet
	ldw	x, (0x0f, sp)
	ldw	y, (0x1c, sp)
	ldw	(0x2, x), y
	ldw	y, (0x1a, sp)
	ldw	(x), y
; genLabel
00121$:
	C$pff.c$1027$3_0$400 ==.
;	../src/pff.c: 1027: sect = clust2sect(fs->curr_clust);		/* Get current sector */
; genPointerGet
	ldw	x, (0x0f, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
; genIPush
	pushw	y
	pushw	x
; genCall
	call	_clust2sect
	addw	sp, #4
; genAssign
	ldw	(0x19, sp), x
	ldw	(0x17, sp), y
	C$pff.c$1028$3_0$400 ==.
;	../src/pff.c: 1028: if (!sect) ABORT(FR_DISK_ERR);
; genIfx
	tnzw	x
	jrne	00249$
	tnzw	y
	jreq	00250$
00249$:
	jp	00123$
00250$:
; genPointerSet
	ldw	x, (0x0b, sp)
	clr	(x)
; genReturn
	ld	a, #0x01
	jp	00139$
; genLabel
00123$:
	C$pff.c$1029$3_0$400 ==.
;	../src/pff.c: 1029: fs->dsect = sect + cs;
; genPlus
	ldw	x, (0x07, sp)
	addw	x, #0x0026
; genCast
; genAssign
	clrw	y
	ld	a, (0x1e, sp)
	ld	yl, a
	clr	a
	clr	(0x1b, sp)
; genPlus
	addw	y, (0x19, sp)
	adc	a, (0x18, sp)
	ld	(0x02, sp), a
	ld	a, (0x1b, sp)
	adc	a, (0x17, sp)
	ld	(0x01, sp), a
; genPointerSet
	ldw	(0x2, x), y
	ld	a, (0x02, sp)
	ld	(0x1, x), a
	ld	a, (0x01, sp)
	ld	(x), a
	C$pff.c$1030$3_0$400 ==.
;	../src/pff.c: 1030: if (disk_writep(0, fs->dsect)) ABORT(FR_DISK_ERR);	/* Initiate a sector write operation */
; genIPush
	pushw	y
	ldw	x, (0x03, sp)
	pushw	x
; genIPush
	clrw	x
	pushw	x
; genCall
	call	_disk_writep
	addw	sp, #6
; genIfx
	tnz	a
	jrne	00251$
	jp	00125$
00251$:
; genPointerSet
	ldw	x, (0x0b, sp)
	clr	(x)
; genReturn
	ld	a, #0x01
	jp	00139$
; genLabel
00125$:
	C$pff.c$1031$3_0$400 ==.
;	../src/pff.c: 1031: fs->flag |= FA__WIP;
; genPointerGet
	ldw	x, (0x0b, sp)
	ld	a, (x)
; genOr
	or	a, #0x40
; genPointerSet
	ldw	x, (0x0b, sp)
	ld	(x), a
; genLabel
00127$:
	C$pff.c$1033$2_0$399 ==.
;	../src/pff.c: 1033: wcnt = 512 - (UINT)fs->fptr % 512;			/* Number of bytes to write to the sector */
; genPointerGet
	ldw	x, (0x0d, sp)
	ldw	x, (0x2, x)
; genAssign
	ld	a, xh
; genAnd
	and	a, #0x01
	ld	(0x1d, sp), a
; genMinus
	ld	a, xl
	neg	a
	ld	xl, a
	ld	a, #0x02
	sbc	a, (0x1d, sp)
	ld	xh, a
; genAssign
	ldw	(0x17, sp), x
	C$pff.c$1034$2_0$399 ==.
;	../src/pff.c: 1034: if (wcnt > btw) wcnt = btw;
; genCmp
; genCmpTop
	ldw	x, (0x17, sp)
	cpw	x, (0x23, sp)
	jrugt	00252$
	jp	00129$
00252$:
; skipping generated iCode
; genAssign
	ldw	y, (0x23, sp)
	ldw	(0x17, sp), y
; genLabel
00129$:
	C$pff.c$1035$1_0$394 ==.
;	../src/pff.c: 1035: if (disk_writep(p, wcnt)) ABORT(FR_DISK_ERR);	/* Send data to the sector */
; genCast
; genAssign
	ldw	y, (0x17, sp)
	ldw	(0x03, sp), y
	clr	(0x02, sp)
	clr	(0x01, sp)
; genIPush
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
; genIPush
	ldw	x, (0x09, sp)
	pushw	x
; genCall
	call	_disk_writep
	addw	sp, #6
; genIfx
	tnz	a
	jrne	00253$
	jp	00131$
00253$:
; genPointerSet
	ldw	x, (0x0b, sp)
	clr	(x)
; genReturn
	ld	a, #0x01
	jp	00139$
; genLabel
00131$:
	C$pff.c$1036$2_0$399 ==.
;	../src/pff.c: 1036: fs->fptr += wcnt; p += wcnt;				/* Update pointers and counters */
; genPointerGet
	ldw	x, (0x0d, sp)
	ld	a, (0x3, x)
	push	a
	ld	a, (0x2, x)
	ld	yh, a
	ldw	x, (x)
	pop	a
; genPlus
	add	a, (0x04, sp)
	ld	(0x1c, sp), a
	ld	a, yh
	adc	a, (0x03, sp)
	ld	(0x1b, sp), a
	ld	a, xl
	adc	a, (0x02, sp)
	ld	(0x1a, sp), a
	ld	a, xh
	adc	a, (0x01, sp)
	ld	(0x19, sp), a
; genPointerSet
	ldw	x, (0x0d, sp)
	ldw	y, (0x1b, sp)
	ldw	(0x2, x), y
	ldw	y, (0x19, sp)
	ldw	(x), y
; genPlus
	ldw	x, (0x05, sp)
	addw	x, (0x17, sp)
; genAssign
	ldw	(0x05, sp), x
	C$pff.c$1037$2_0$399 ==.
;	../src/pff.c: 1037: btw -= wcnt; *bw += wcnt;
; genMinus
	ldw	x, (0x23, sp)
	subw	x, (0x17, sp)
; genAssign
	ldw	(0x23, sp), x
; genPointerGet
	ldw	x, (0x09, sp)
	ldw	x, (x)
; genPlus
	addw	x, (0x17, sp)
	ldw	(0x1d, sp), x
; genPointerSet
	ldw	x, (0x09, sp)
	ldw	y, (0x1d, sp)
	ldw	(x), y
	C$pff.c$1038$2_0$399 ==.
;	../src/pff.c: 1038: if ((UINT)fs->fptr % 512 == 0) {
; genCast
; genAssign
	ldw	y, (0x1b, sp)
	ldw	(0x1d, sp), y
; genAnd
	ld	a, (0x1e, sp)
	ld	(0x1c, sp), a
	ld	a, (0x1d, sp)
	and	a, #0x01
	ld	(0x1b, sp), a
; genIfx
	ldw	x, (0x1b, sp)
	jreq	00254$
	jp	00136$
00254$:
	C$pff.c$1039$3_0$408 ==.
;	../src/pff.c: 1039: if (disk_writep(0, 0)) ABORT(FR_DISK_ERR);	/* Finalize the currtent secter write operation */
; genIPush
	clrw	x
	pushw	x
	clrw	x
	pushw	x
; genIPush
	clrw	x
	pushw	x
; genCall
	call	_disk_writep
	addw	sp, #6
; genIfx
	tnz	a
	jrne	00255$
	jp	00133$
00255$:
; genPointerSet
	ldw	x, (0x0b, sp)
	clr	(x)
; genReturn
	ld	a, #0x01
	jp	00139$
; genLabel
00133$:
	C$pff.c$1040$3_0$408 ==.
;	../src/pff.c: 1040: fs->flag &= ~FA__WIP;
; genPointerGet
	ldw	x, (0x0b, sp)
	ld	a, (x)
; genAnd
	and	a, #0xbf
; genPointerSet
	ldw	x, (0x0b, sp)
	ld	(x), a
; genGoto
	jp	00136$
; genLabel
00138$:
	C$pff.c$1044$1_0$394 ==.
;	../src/pff.c: 1044: return FR_OK;
; genReturn
	clr	a
; genLabel
00139$:
	C$pff.c$1045$1_0$394 ==.
;	../src/pff.c: 1045: }
; genEndFunction
	addw	sp, #30
	C$pff.c$1045$1_0$394 ==.
	XG$pf_write$0$0 ==.
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
