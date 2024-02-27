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
;	../src/pff.c: 384: static WORD ld_word (const BYTE* ptr)	/*	 Load a 2-byte little-endian word */
;	-----------------------------------------
;	 function ld_word
;	-----------------------------------------
_ld_word:
	pushw	x
;	../src/pff.c: 388: rv = ptr[1];
	ldw	x, (0x05, sp)
	ld	a, (0x1, x)
;	../src/pff.c: 389: rv = rv << 8 | ptr[0];
	ld	(0x01, sp), a
	clr	(0x02, sp)
	ldw	x, (0x05, sp)
	ld	a, (x)
	clrw	x
	or	a, (0x02, sp)
	rlwa	x
	or	a, (0x01, sp)
;	../src/pff.c: 390: return rv;
	ld	xh, a
;	../src/pff.c: 391: }
	addw	sp, #2
	ret
;	../src/pff.c: 393: static DWORD ld_dword (const BYTE* ptr)	/* Load a 4-byte little-endian word */
;	-----------------------------------------
;	 function ld_dword
;	-----------------------------------------
_ld_dword:
	sub	sp, #8
;	../src/pff.c: 397: rv = ptr[3];
	ldw	x, (0x0b, sp)
	ld	a, (0x3, x)
	clrw	x
	clrw	y
	ld	xl, a
;	../src/pff.c: 398: rv = rv << 8 | ptr[2];
	ldw	(0x02, sp), x
	clr	(0x04, sp)
	ldw	x, (0x0b, sp)
	ld	a, (0x2, x)
	clr	(0x07, sp)
	clrw	x
	clr	(0x05, sp)
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
	rrwa	x
;	../src/pff.c: 399: rv = rv << 8 | ptr[1];
	ld	(0x01, sp), a
	exg	a, yl
	ld	a, xl
	exg	a, yl
	clr	(0x04, sp)
	ldw	x, (0x0b, sp)
	ld	a, (0x1, x)
	clrw	x
	clr	(0x06, sp)
	clr	(0x05, sp)
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
;	../src/pff.c: 400: rv = rv << 8 | ptr[0];
	ldw	(0x02, sp), x
	clr	(0x04, sp)
	ldw	x, (0x0b, sp)
	ld	a, (x)
	clr	(0x07, sp)
	clrw	x
	clr	(0x05, sp)
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
	exg	a, yl
	ld	a, xh
	exg	a, yl
	ld	xh, a
;	../src/pff.c: 401: return rv;
	exgw	x, y
;	../src/pff.c: 402: }
	addw	sp, #8
	ret
;	../src/pff.c: 411: static void mem_set (void* dst, int val, int cnt) {
;	-----------------------------------------
;	 function mem_set
;	-----------------------------------------
_mem_set:
	pushw	x
;	../src/pff.c: 412: char *d = (char*)dst;
	ldw	x, (0x05, sp)
;	../src/pff.c: 413: while (cnt--) *d++ = (char)val;
	ldw	(0x01, sp), x
	ldw	y, (0x09, sp)
00101$:
	ldw	x, y
	decw	y
	tnzw	x
	jreq	00104$
	ld	a, (0x08, sp)
	ldw	x, (0x01, sp)
	ld	(x), a
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
	jra	00101$
00104$:
;	../src/pff.c: 414: }
	popw	x
	ret
;	../src/pff.c: 417: static int mem_cmp (const void* dst, const void* src, int cnt) {
;	-----------------------------------------
;	 function mem_cmp
;	-----------------------------------------
_mem_cmp:
	sub	sp, #10
;	../src/pff.c: 418: const char *d = (const char *)dst, *s = (const char *)src;
	ldw	y, (0x0d, sp)
	ldw	x, (0x0f, sp)
;	../src/pff.c: 419: int r = 0;
	clr	(0x02, sp)
	clr	(0x01, sp)
;	../src/pff.c: 420: while (cnt-- && (r = *d++ - *s++) == 0) ;
	ldw	(0x05, sp), y
	ldw	(0x07, sp), x
	ldw	y, (0x11, sp)
	ldw	(0x09, sp), y
00102$:
	ldw	y, (0x09, sp)
	ldw	(0x03, sp), y
	ldw	x, (0x09, sp)
	decw	x
	ldw	(0x09, sp), x
	ldw	x, (0x03, sp)
	jreq	00104$
	ldw	x, (0x05, sp)
	ld	a, (x)
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
	clrw	x
	ld	xl, a
	ldw	y, (0x07, sp)
	ld	a, (y)
	ldw	y, (0x07, sp)
	incw	y
	ldw	(0x07, sp), y
	ld	(0x04, sp), a
	clr	(0x03, sp)
	subw	x, (0x03, sp)
	ldw	(0x01, sp), x
	tnzw	x
	jreq	00102$
00104$:
;	../src/pff.c: 421: return r;
	ldw	x, (0x01, sp)
;	../src/pff.c: 422: }
	addw	sp, #10
	ret
;	../src/pff.c: 430: static CLUST get_fat (	/* 1:IO error, Else:Cluster status */
;	-----------------------------------------
;	 function get_fat
;	-----------------------------------------
_get_fat:
	sub	sp, #18
;	../src/pff.c: 435: FATFS *fs = FatFs;
	ldw	y, _FatFs+0
;	../src/pff.c: 440: if (clst < 2 || clst >= fs->n_fatent) return 1;	/* Range check */
	ldw	x, (0x17, sp)
	cpw	x, #0x0002
	ld	a, (0x16, sp)
	sbc	a, #0x00
	ld	a, (0x15, sp)
	sbc	a, #0x00
	jrc	00101$
	ldw	x, y
	ld	a, (0x9, x)
	ld	(0x12, sp), a
	ld	a, (0x8, x)
	ld	(0x11, sp), a
	ldw	x, (0x6, x)
	ldw	(0x0f, sp), x
	ldw	x, (0x17, sp)
	cpw	x, (0x11, sp)
	ld	a, (0x16, sp)
	sbc	a, (0x10, sp)
	ld	a, (0x15, sp)
	sbc	a, (0x0f, sp)
	jrc	00102$
00101$:
	clrw	x
	incw	x
	clrw	y
	jra	00108$
00102$:
;	../src/pff.c: 442: switch (fs->fs_type) {
	ld	a, (y)
	cp	a, #0x03
	jrne	00107$
;	../src/pff.c: 464: if (disk_readp(buf, fs->fatbase + clst / 128, ((UINT)clst % 128) * 4, 4)) break;
	ldw	x, (0x17, sp)
	ld	a, xl
	and	a, #0x7f
	ld	xl, a
	clr	a
	ld	xh, a
	sllw	x
	sllw	x
	ldw	(0x05, sp), x
	ldw	x, y
	ld	a, (0xd, x)
	ld	(0x0a, sp), a
	ld	a, (0xc, x)
	ldw	x, (0xa, x)
	ldw	(0x07, sp), x
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
	push	#0x04
	push	#0x00
	ldw	y, (0x07, sp)
	pushw	y
	pushw	x
	ldw	x, (0x15, sp)
	pushw	x
	ldw	x, sp
	addw	x, #9
	pushw	x
	call	_disk_readp
	addw	sp, #10
	tnz	a
	jrne	00107$
;	../src/pff.c: 465: return ld_dword(buf) & 0x0FFFFFFF;
	ldw	x, sp
	incw	x
	pushw	x
	call	_ld_dword
	addw	sp, #2
	ld	a, yh
	and	a, #0x0f
	ld	yh, a
	jra	00108$
;	../src/pff.c: 467: }
00107$:
;	../src/pff.c: 469: return 1;	/* An error occured at the disk I/O layer */
	clrw	x
	incw	x
	clrw	y
00108$:
;	../src/pff.c: 470: }
	addw	sp, #18
	ret
;	../src/pff.c: 479: static DWORD clust2sect (	/* !=0: Sector number, 0: Failed - invalid cluster# */
;	-----------------------------------------
;	 function clust2sect
;	-----------------------------------------
_clust2sect:
	sub	sp, #8
;	../src/pff.c: 483: FATFS *fs = FatFs;
	ldw	x, _FatFs+0
	ldw	(0x07, sp), x
;	../src/pff.c: 486: clst -= 2;
	ldw	x, (0x0d, sp)
	subw	x, #0x0002
	ldw	y, (0x0b, sp)
	jrnc	00110$
	decw	y
00110$:
	ldw	(0x0d, sp), x
	ldw	(0x0b, sp), y
;	../src/pff.c: 487: if (clst >= (fs->n_fatent - 2)) return 0;		/* Invalid cluster# */
	ldw	x, (0x07, sp)
	ldw	y, x
	ldw	y, (0x8, y)
	ldw	x, (0x6, x)
	subw	y, #0x0002
	ldw	(0x05, sp), y
	jrnc	00111$
	decw	x
00111$:
	ldw	(0x03, sp), x
	ldw	x, (0x0d, sp)
	cpw	x, (0x05, sp)
	ld	a, (0x0c, sp)
	sbc	a, (0x04, sp)
	ld	a, (0x0b, sp)
	sbc	a, (0x03, sp)
	jrc	00102$
	clrw	x
	clrw	y
	jra	00103$
00102$:
;	../src/pff.c: 488: return (DWORD)clst * fs->csize + fs->database;
	ldw	x, (0x07, sp)
	ld	a, (0x2, x)
	clrw	x
	ld	xl, a
	clrw	y
	pushw	x
	pushw	y
	ldw	x, (0x11, sp)
	pushw	x
	ldw	x, (0x11, sp)
	pushw	x
	call	__mullong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
	ldw	x, (0x07, sp)
	ldw	y, x
	ldw	y, (0x14, y)
	ldw	x, (0x12, x)
	ldw	(0x05, sp), x
	ldw	x, y
	addw	x, (0x03, sp)
	ldw	y, (0x05, sp)
	jrnc	00113$
	incw	y
00113$:
	addw	y, (0x01, sp)
00103$:
;	../src/pff.c: 489: }
	addw	sp, #8
	ret
;	../src/pff.c: 492: static CLUST get_clust (
;	-----------------------------------------
;	 function get_clust
;	-----------------------------------------
_get_clust:
	sub	sp, #4
;	../src/pff.c: 501: clst = ld_word(dir+DIR_FstClusHI);
	ldw	x, (0x07, sp)
	addw	x, #0x0014
	pushw	x
	call	_ld_word
	addw	sp, #2
	exgw	x, y
;	../src/pff.c: 502: clst <<= 16;
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	../src/pff.c: 504: clst |= ld_word(dir+DIR_FstClusLO);
	ldw	x, (0x07, sp)
	addw	x, #0x001a
	pushw	x
	call	_ld_word
	addw	sp, #2
	clr	a
	clrw	y
	or	a, (0x02, sp)
	ld	yl, a
	ld	a, xl
	or	a, (0x04, sp)
	rlwa	x
	or	a, (0x03, sp)
	ld	xh, a
	ld	a, yh
	or	a, (0x01, sp)
;	../src/pff.c: 506: return clst;
	ld	yh, a
;	../src/pff.c: 507: }
	addw	sp, #4
	ret
;	../src/pff.c: 514: static FRESULT dir_rewind (
;	-----------------------------------------
;	 function dir_rewind
;	-----------------------------------------
_dir_rewind:
	sub	sp, #12
;	../src/pff.c: 519: FATFS *fs = FatFs;
	ldw	x, _FatFs+0
	ldw	(0x07, sp), x
;	../src/pff.c: 522: dj->index = 0;
	ldw	y, (0x0f, sp)
	ldw	(0x05, sp), y
	ldw	x, y
	clr	(0x1, x)
	clr	(x)
;	../src/pff.c: 523: clst = dj->sclust;
	ldw	x, (0x05, sp)
	ldw	y, x
	ldw	y, (0x6, y)
	ldw	x, (0x4, x)
	ldw	(0x0b, sp), y
	ldw	(0x09, sp), x
;	../src/pff.c: 524: if (clst == 1 || clst >= fs->n_fatent) {	/* Check start cluster range */
	ldw	x, (0x0b, sp)
	decw	x
	jrne	00129$
	ldw	x, (0x09, sp)
	jreq	00101$
00129$:
	ldw	x, (0x07, sp)
	ldw	y, x
	ldw	y, (0x8, y)
	ldw	(0x03, sp), y
	ldw	x, (0x6, x)
	ldw	(0x01, sp), x
	ldw	x, (0x0b, sp)
	cpw	x, (0x03, sp)
	ld	a, (0x0a, sp)
	sbc	a, (0x02, sp)
	ld	a, (0x09, sp)
	sbc	a, (0x01, sp)
	jrc	00106$
00101$:
;	../src/pff.c: 525: return FR_DISK_ERR;
	ld	a, #0x01
	jra	00109$
;	../src/pff.c: 527: if (PF_FS_FAT32 && !clst && (_FS_32ONLY || fs->fs_type == FS_FAT32)) {	/* Replace cluster# 0 with root cluster# if in FAT32 */
00106$:
	ldw	x, (0x0b, sp)
	jrne	00105$
	ldw	x, (0x09, sp)
	jrne	00105$
;	../src/pff.c: 528: clst = (CLUST)fs->dirbase;
	ldw	x, (0x07, sp)
	ldw	y, x
	ldw	y, (0x10, y)
	ldw	(0x0b, sp), y
	ldw	x, (0xe, x)
	ldw	(0x09, sp), x
00105$:
;	../src/pff.c: 530: dj->clust = clst;						/* Current cluster */
	ldw	x, (0x05, sp)
	addw	x, #0x0008
	ldw	y, (0x0b, sp)
	ldw	(0x2, x), y
	ldw	y, (0x09, sp)
	ldw	(x), y
;	../src/pff.c: 531: dj->sect = (_FS_32ONLY || clst) ? clust2sect(clst) : fs->dirbase;	/* Current sector */
	ldw	x, (0x05, sp)
	addw	x, #0x000c
	ldw	(0x07, sp), x
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	call	_clust2sect
	addw	sp, #4
	ldw	(0x09, sp), y
	ldw	y, (0x07, sp)
	ldw	(0x2, y), x
	ldw	x, (0x09, sp)
	ldw	(y), x
;	../src/pff.c: 533: return FR_OK;	/* Seek succeeded */
	clr	a
00109$:
;	../src/pff.c: 534: }
	addw	sp, #12
	ret
;	../src/pff.c: 543: static FRESULT dir_next (	/* FR_OK:Succeeded, FR_NO_FILE:End of table */
;	-----------------------------------------
;	 function dir_next
;	-----------------------------------------
_dir_next:
	sub	sp, #20
;	../src/pff.c: 549: FATFS *fs = FatFs;
	ldw	x, _FatFs+0
	ldw	(0x05, sp), x
;	../src/pff.c: 552: i = dj->index + 1;
	ldw	y, (0x17, sp)
	ldw	(0x07, sp), y
	ldw	x, y
	ldw	x, (x)
	incw	x
;	../src/pff.c: 553: if (!i || !dj->sect) return FR_NO_FILE;	/* Report EOT when index has reached 65535 */
	ldw	(0x09, sp), x
	jreq	00101$
	ldw	x, (0x07, sp)
	addw	x, #0x000c
	ldw	(0x0b, sp), x
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	(0x03, sp), y
	ldw	x, (x)
	ldw	(0x01, sp), x
	ldw	x, (0x03, sp)
	jrne	00102$
	ldw	x, (0x01, sp)
	jrne	00102$
00101$:
	ld	a, #0x03
	jp	00117$
00102$:
;	../src/pff.c: 555: if (!(i % 16)) {		/* Sector changed? */
	ldw	y, (0x09, sp)
	ldw	(0x13, sp), y
	ld	a, (0x14, sp)
	bcp	a, #0x0f
	jreq	00157$
	jp	00116$
00157$:
;	../src/pff.c: 556: dj->sect++;			/* Next sector */
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
	ldw	x, (0x0b, sp)
	ld	(0x3, x), a
	ld	a, (0x11, sp)
	ld	(0x2, x), a
	ldw	(x), y
;	../src/pff.c: 558: if (dj->clust == 0) {	/* Static table */
	ldw	x, (0x07, sp)
	addw	x, #0x0008
	ldw	(0x0d, sp), x
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	ldw	(0x0f, sp), x
	tnzw	y
	jrne	00113$
	ldw	x, (0x0f, sp)
	jrne	00113$
;	../src/pff.c: 559: if (i >= fs->n_rootdir) return FR_NO_FILE;	/* Report EOT when end of table */
	ldw	x, (0x05, sp)
	ldw	x, (0x4, x)
	ldw	(0x13, sp), x
	ldw	x, (0x09, sp)
	cpw	x, (0x13, sp)
	jrnc	00161$
	jp	00116$
00161$:
	ld	a, #0x03
	jp	00117$
00113$:
;	../src/pff.c: 562: if (((i / 16) & (fs->csize - 1)) == 0) {	/* Cluster changed? */
	srl	(0x13, sp)
	rrc	(0x14, sp)
	srl	(0x13, sp)
	rrc	(0x14, sp)
	srl	(0x13, sp)
	rrc	(0x14, sp)
	srl	(0x13, sp)
	rrc	(0x14, sp)
	ldw	x, (0x05, sp)
	ld	a, (0x2, x)
	clrw	x
	ld	xl, a
	decw	x
	ld	a, xl
	and	a, (0x14, sp)
	rlwa	x
	and	a, (0x13, sp)
	ld	xh, a
	tnzw	x
	jrne	00116$
;	../src/pff.c: 563: clst = get_fat(dj->clust);		/* Get next cluster */
	pushw	y
	ldw	x, (0x11, sp)
	pushw	x
	call	_get_fat
	addw	sp, #4
	ldw	(0x13, sp), x
	ldw	(0x11, sp), y
;	../src/pff.c: 564: if (clst <= 1) return FR_DISK_ERR;
	clrw	x
	incw	x
	cpw	x, (0x13, sp)
	clr	a
	sbc	a, (0x12, sp)
	clr	a
	sbc	a, (0x11, sp)
	jrc	00107$
	ld	a, #0x01
	jra	00117$
00107$:
;	../src/pff.c: 565: if (clst >= fs->n_fatent) return FR_NO_FILE;	/* Report EOT when it reached end of dynamic table */
	ldw	x, (0x05, sp)
	ldw	y, x
	ldw	y, (0x8, y)
	ldw	(0x05, sp), y
	ldw	x, (0x6, x)
	ldw	(0x03, sp), x
	ldw	x, (0x13, sp)
	cpw	x, (0x05, sp)
	ld	a, (0x12, sp)
	sbc	a, (0x04, sp)
	ld	a, (0x11, sp)
	sbc	a, (0x03, sp)
	jrc	00109$
	ld	a, #0x03
	jra	00117$
00109$:
;	../src/pff.c: 566: dj->clust = clst;				/* Initialize data for new cluster */
	ldw	x, (0x0d, sp)
	ldw	y, (0x13, sp)
	ldw	(0x2, x), y
	ldw	y, (0x11, sp)
	ldw	(x), y
;	../src/pff.c: 567: dj->sect = clust2sect(clst);
	ldw	x, (0x13, sp)
	pushw	x
	ldw	x, (0x13, sp)
	pushw	x
	call	_clust2sect
	addw	sp, #4
	ldw	(0x11, sp), y
	ldw	y, (0x0b, sp)
	ldw	(0x2, y), x
	ldw	x, (0x11, sp)
	ldw	(y), x
00116$:
;	../src/pff.c: 572: dj->index = i;
	ldw	x, (0x07, sp)
	ldw	y, (0x09, sp)
	ldw	(x), y
;	../src/pff.c: 574: return FR_OK;
	clr	a
00117$:
;	../src/pff.c: 575: }
	addw	sp, #20
	ret
;	../src/pff.c: 584: static FRESULT dir_find (
;	-----------------------------------------
;	 function dir_find
;	-----------------------------------------
_dir_find:
	sub	sp, #7
;	../src/pff.c: 593: res = dir_rewind(dj);			/* Rewind directory object */
	ldw	x, (0x0a, sp)
	pushw	x
	call	_dir_rewind
	popw	x
;	../src/pff.c: 594: if (res != FR_OK) return res;
	tnz	a
;	../src/pff.c: 596: do {
	jrne	00113$
	ldw	y, (0x0a, sp)
	ldw	(0x03, sp), y
	ldw	(0x05, sp), y
00110$:
;	../src/pff.c: 597: res = disk_readp(dir, dj->sect, (dj->index % 16) * 32, 32)	/* Read an entry */
	ldw	x, (0x03, sp)
	ldw	x, (x)
	ld	a, xl
	and	a, #0x0f
	ld	xl, a
	clr	a
	ld	xh, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x01, sp), x
	ldw	x, (0x05, sp)
	ldw	y, x
	ldw	y, (0xe, y)
	ldw	x, (0xc, x)
	push	#0x20
	push	#0x00
	ld	a, (0x04, sp)
	push	a
	ld	a, (0x04, sp)
	push	a
	pushw	y
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	call	_disk_readp
	addw	sp, #10
	tnz	a
	jreq	00115$
;	../src/pff.c: 598: ? FR_DISK_ERR : FR_OK;
	ld	a, #0x01
	.byte 0x21
00115$:
	clr	a
00116$:
;	../src/pff.c: 599: if (res != FR_OK) break;
	ld	(0x07, sp), a
	jrne	00112$
;	../src/pff.c: 600: c = dir[DIR_Name];	/* First character */
	ldw	x, (0x0c, sp)
;	../src/pff.c: 601: if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
	ld	a, (x)
	jrne	00106$
	ld	a, #0x03
	ld	(0x07, sp), a
	jra	00112$
00106$:
;	../src/pff.c: 602: if (!(dir[DIR_Attr] & AM_VOL) && !mem_cmp(dir, dj->fn, 11)) break;	/* Is it a valid entry? */
	ld	a, (0xb, x)
	bcp	a, #0x08
	jrne	00108$
	ldw	x, (0x03, sp)
	ldw	x, (0x2, x)
	ldw	y, (0x0c, sp)
	push	#0x0b
	push	#0x00
	pushw	x
	pushw	y
	call	_mem_cmp
	addw	sp, #6
	tnzw	x
	jreq	00112$
00108$:
;	../src/pff.c: 603: res = dir_next(dj);					/* Next entry */
	ldw	x, (0x03, sp)
	pushw	x
	call	_dir_next
	popw	x
;	../src/pff.c: 604: } while (res == FR_OK);
	ld	(0x07, sp), a
	jreq	00110$
00112$:
;	../src/pff.c: 606: return res;
	ld	a, (0x07, sp)
00113$:
;	../src/pff.c: 607: }
	addw	sp, #7
	ret
;	../src/pff.c: 651: static FRESULT create_name (
;	-----------------------------------------
;	 function create_name
;	-----------------------------------------
_create_name:
	sub	sp, #9
;	../src/pff.c: 663: sfn = dj->fn;
	ldw	x, (0x0c, sp)
	ldw	x, (0x2, x)
;	../src/pff.c: 664: mem_set(sfn, ' ', 11);
	ldw	(0x01, sp), x
	push	#0x0b
	push	#0x00
	push	#0x20
	push	#0x00
	pushw	x
	call	_mem_set
	addw	sp, #6
;	../src/pff.c: 665: si = i = 0; ni = 8;
	clr	(0x08, sp)
	ld	a, #0x08
	ld	(0x03, sp), a
;	../src/pff.c: 666: p = *path;
	ldw	y, (0x0e, sp)
	ldw	x, y
	ldw	x, (x)
	ldw	(0x04, sp), x
	clr	(0x09, sp)
00120$:
;	../src/pff.c: 668: c = p[si++];
	clrw	x
	ld	a, (0x09, sp)
	ld	xl, a
	addw	x, (0x04, sp)
	inc	(0x09, sp)
	ld	a, (x)
;	../src/pff.c: 669: if (c <= ' ' || c == '/') break;	/* Break on end of segment */
	ld	(0x06, sp), a
	cp	a, #0x20
	jrugt	00161$
	clr	(0x07, sp)
	jra	00162$
00161$:
	ld	a, #0x01
	ld	(0x07, sp), a
00162$:
	tnz	(0x07, sp)
	jreq	00119$
	ld	a, (0x06, sp)
	cp	a, #0x2f
	jreq	00119$
;	../src/pff.c: 670: if (c == '.' || i >= ni) {
	ld	a, (0x06, sp)
	sub	a, #0x2e
	jrne	00168$
	inc	a
	.byte 0x21
00168$:
	clr	a
00169$:
	tnz	a
	jrne	00107$
	push	a
	ld	a, (0x09, sp)
	cp	a, (0x04, sp)
	pop	a
	jrc	00111$
00107$:
;	../src/pff.c: 671: if (ni != 8 || c != '.') break;
	push	a
	ld	a, (0x04, sp)
	cp	a, #0x08
	pop	a
	jrne	00119$
	tnz	a
	jreq	00119$
;	../src/pff.c: 672: i = 8; ni = 11;
	ld	a, #0x08
	ld	(0x08, sp), a
	ld	a, #0x0b
	ld	(0x03, sp), a
;	../src/pff.c: 673: continue;
	jra	00120$
;	../src/pff.c: 683: if (PF_USE_LCC && IsLower(c)) c -= 0x20;	/* toupper */
00111$:
;	../src/pff.c: 684: sfn[i++] = c;
	ld	a, (0x08, sp)
	inc	(0x08, sp)
	clrw	x
	ld	xl, a
	addw	x, (0x01, sp)
	ld	a, (0x06, sp)
	ld	(x), a
	jra	00120$
00119$:
;	../src/pff.c: 687: *path = &p[si];						/* Rerurn pointer to the next segment */
	clrw	x
	ld	a, (0x09, sp)
	ld	xl, a
	addw	x, (0x04, sp)
	ldw	(y), x
;	../src/pff.c: 689: sfn[11] = (c <= ' ') ? 1 : 0;		/* Set last segment flag if end of path */
	ldw	y, (0x01, sp)
	addw	y, #0x000b
	tnz	(0x07, sp)
	jrne	00123$
	clrw	x
	incw	x
	.byte 0x21
00123$:
	clrw	x
00124$:
	ld	a, xl
	ld	(y), a
;	../src/pff.c: 691: return FR_OK;
	clr	a
;	../src/pff.c: 692: }
	addw	sp, #9
	ret
;	../src/pff.c: 742: static FRESULT follow_path (	/* FR_OK(0): successful, !=0: error code */
;	-----------------------------------------
;	 function follow_path
;	-----------------------------------------
_follow_path:
	sub	sp, #14
;	../src/pff.c: 751: while (*path == ' ') path++;		/* Strip leading spaces */
	ldw	y, (0x15, sp)
00101$:
	ld	a, (y)
	ldw	x, y
	incw	x
	cp	a, #0x20
	jrne	00131$
	ldw	y, x
	ldw	(0x15, sp), x
	jra	00101$
00131$:
	ldw	(0x15, sp), y
;	../src/pff.c: 752: if (*path == '/') path++;			/* Strip heading separator if exist */
	cp	a, #0x2f
	jrne	00105$
	ldw	(0x15, sp), x
00105$:
;	../src/pff.c: 753: dj->sclust = 0;						/* Set start directory (always root dir) */
	ldw	y, (0x11, sp)
	ldw	(0x01, sp), y
	ldw	x, y
	addw	x, #0x0004
	clrw	y
	ldw	(0x2, x), y
	ldw	(x), y
;	../src/pff.c: 755: if ((BYTE)*path < ' ') {			/* Null path means the root directory */
	ldw	x, (0x15, sp)
	ld	a, (x)
	cp	a, #0x20
	jrnc	00130$
;	../src/pff.c: 756: res = dir_rewind(dj);
	ldw	x, (0x01, sp)
	pushw	x
	call	_dir_rewind
	popw	x
	ld	(0x0e, sp), a
;	../src/pff.c: 757: dir[0] = 0;
	ldw	x, (0x13, sp)
	clr	(x)
	jra	00117$
00130$:
	ldw	y, (0x01, sp)
	ldw	(0x03, sp), y
	ldw	y, (0x13, sp)
	ldw	(0x05, sp), y
	ldw	y, (0x01, sp)
	ldw	(0x07, sp), y
00118$:
;	../src/pff.c: 761: res = create_name(dj, &path);	/* Get a segment */
	ldw	x, sp
	addw	x, #21
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	call	_create_name
	addw	sp, #4
;	../src/pff.c: 762: if (res != FR_OK) break;
	ld	(0x0e, sp), a
	jrne	00117$
;	../src/pff.c: 763: res = dir_find(dj, dir);		/* Find it */
	ldw	x, (0x13, sp)
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	call	_dir_find
	addw	sp, #4
;	../src/pff.c: 764: if (res != FR_OK) break;		/* Could not find the object */
	ld	(0x0e, sp), a
	jrne	00117$
;	../src/pff.c: 765: if (dj->fn[11]) break;			/* Last segment match. Function completed. */
	ldw	x, (0x03, sp)
	ldw	x, (0x2, x)
	ld	a, (0xb, x)
	jrne	00117$
;	../src/pff.c: 766: if (!(dir[DIR_Attr] & AM_DIR)) { /* Cannot follow path because it is a file */
	ldw	x, (0x05, sp)
	ld	a, (0xb, x)
	bcp	a, #0x10
	jrne	00113$
;	../src/pff.c: 767: res = FR_NO_FILE; break;
	ld	a, #0x03
	ld	(0x0e, sp), a
	jra	00117$
00113$:
;	../src/pff.c: 769: dj->sclust = get_clust(dir);	/* Follow next */
	ldw	x, (0x07, sp)
	addw	x, #0x0004
	ldw	(0x09, sp), x
	ldw	x, (0x13, sp)
	pushw	x
	call	_get_clust
	addw	sp, #2
	ldw	(0x0b, sp), y
	ldw	y, (0x09, sp)
	ldw	(0x2, y), x
	ldw	x, (0x0b, sp)
	ldw	(y), x
	jra	00118$
00117$:
;	../src/pff.c: 773: return res;
	ld	a, (0x0e, sp)
;	../src/pff.c: 774: }
	addw	sp, #14
	ret
;	../src/pff.c: 783: static BYTE check_fs (	/* 0:The FAT boot record, 1:Valid boot record but not an FAT, 2:Not a boot record, 3:Error */
;	-----------------------------------------
;	 function check_fs
;	-----------------------------------------
_check_fs:
;	../src/pff.c: 788: if (disk_readp(buf, sect, 510, 2)) {	/* Read the boot record */
	push	#0x02
	push	#0x00
	push	#0xfe
	push	#0x01
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	call	_disk_readp
	addw	sp, #10
	tnz	a
	jreq	00102$
;	../src/pff.c: 789: return 3;
	ld	a, #0x03
	ret
00102$:
;	../src/pff.c: 791: if (ld_word(buf) != 0xAA55) {			/* Check record signature */
	ldw	x, (0x03, sp)
	pushw	x
	call	_ld_word
	addw	sp, #2
	cpw	x, #0xaa55
	jreq	00111$
;	../src/pff.c: 792: return 2;
	ld	a, #0x02
	ret
;	../src/pff.c: 798: if (PF_FS_FAT32 && !disk_readp(buf, sect, BS_FilSysType32, 2) && ld_word(buf) == 0x4146) {	/* Check FAT32 */
00111$:
	push	#0x02
	push	#0x00
	push	#0x52
	push	#0x00
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	call	_disk_readp
	addw	sp, #10
	tnz	a
	jrne	00110$
	ldw	x, (0x03, sp)
	pushw	x
	call	_ld_word
	addw	sp, #2
	cpw	x, #0x4146
	jrne	00110$
;	../src/pff.c: 799: return 0;
	clr	a
	ret
00110$:
;	../src/pff.c: 801: return 1;
	ld	a, #0x01
;	../src/pff.c: 802: }
	ret
;	../src/pff.c: 819: FRESULT pf_mount (
;	-----------------------------------------
;	 function pf_mount
;	-----------------------------------------
_pf_mount:
	sub	sp, #60
;	../src/pff.c: 827: FatFs = 0;
	clrw	x
	ldw	_FatFs+0, x
;	../src/pff.c: 829: if (disk_initialize() & STA_NOINIT) {	/* Check if the drive is ready or not */
	call	_disk_initialize
	srl	a
	jrnc	00102$
;	../src/pff.c: 830: return FR_NOT_READY;
	ld	a, #0x02
	jp	00137$
00102$:
;	../src/pff.c: 834: bsect = 0;
	clrw	x
	ldw	(0x33, sp), x
	ldw	(0x31, sp), x
;	../src/pff.c: 835: fmt = check_fs(buf, bsect);			/* Check sector 0 as an SFD format */
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	ldw	x, sp
	addw	x, #5
	pushw	x
	call	_check_fs
	addw	sp, #6
	ld	(0x3c, sp), a
;	../src/pff.c: 841: if (buf[4]) {					/* Is the partition existing? */
	ldw	x, sp
	addw	x, #5
	ldw	(0x39, sp), x
;	../src/pff.c: 836: if (fmt == 1) {						/* Not an FAT boot record, it may be FDISK format */
	ld	a, (0x3c, sp)
	dec	a
	jrne	00109$
;	../src/pff.c: 838: if (disk_readp(buf, bsect, MBR_Table, 16)) {	/* 1st partition entry */
	push	#0x10
	push	#0x00
	push	#0xbe
	push	#0x01
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	ldw	x, sp
	addw	x, #9
	pushw	x
	call	_disk_readp
	addw	sp, #10
	tnz	a
	jreq	00106$
;	../src/pff.c: 839: fmt = 3;
	ld	a, #0x03
	ld	(0x3c, sp), a
	jra	00109$
00106$:
;	../src/pff.c: 841: if (buf[4]) {					/* Is the partition existing? */
	ldw	x, (0x39, sp)
	ld	a, (x)
	jreq	00109$
;	../src/pff.c: 842: bsect = ld_dword(&buf[8]);	/* Partition offset in LBA */
	ldw	x, sp
	addw	x, #9
	pushw	x
	call	_ld_dword
	addw	sp, #2
	ldw	(0x33, sp), x
	ldw	(0x31, sp), y
;	../src/pff.c: 843: fmt = check_fs(buf, bsect);	/* Check the partition */
	ldw	x, (0x33, sp)
	pushw	x
	ldw	x, (0x33, sp)
	pushw	x
	ldw	x, sp
	addw	x, #5
	pushw	x
	call	_check_fs
	addw	sp, #6
	ld	(0x3c, sp), a
00109$:
;	../src/pff.c: 847: if (fmt == 3) return FR_DISK_ERR;
	ld	a, (0x3c, sp)
	cp	a, #0x03
	jrne	00111$
	ld	a, #0x01
	jp	00137$
00111$:
;	../src/pff.c: 848: if (fmt) return FR_NO_FILESYSTEM;	/* No valid FAT patition is found */
	tnz	(0x3c, sp)
	jreq	00113$
	ld	a, #0x06
	jp	00137$
00113$:
;	../src/pff.c: 851: if (disk_readp(buf, bsect, 13, sizeof (buf))) return FR_DISK_ERR;
	push	#0x24
	push	#0x00
	push	#0x0d
	push	#0x00
	ldw	x, (0x37, sp)
	pushw	x
	ldw	x, (0x37, sp)
	pushw	x
	ldw	x, sp
	addw	x, #9
	pushw	x
	call	_disk_readp
	addw	sp, #10
	tnz	a
	jreq	00115$
	ld	a, #0x01
	jp	00137$
00115$:
;	../src/pff.c: 853: fsize = ld_word(buf+BPB_FATSz16-13);				/* Number of sectors per FAT */
	ldw	x, sp
	addw	x, #10
	pushw	x
	call	_ld_word
	addw	sp, #2
	clrw	y
	ldw	(0x37, sp), x
	ldw	(0x35, sp), y
;	../src/pff.c: 854: if (!fsize) fsize = ld_dword(buf+BPB_FATSz32-13);
	ldw	x, (0x37, sp)
	jrne	00117$
	ldw	x, (0x35, sp)
	jrne	00117$
	ldw	x, sp
	addw	x, #24
	pushw	x
	call	_ld_dword
	addw	sp, #2
	ldw	(0x37, sp), x
	ldw	(0x35, sp), y
00117$:
;	../src/pff.c: 856: fsize *= buf[BPB_NumFATs-13];						/* Number of sectors in FAT area */
	ld	a, (0x04, sp)
	clrw	x
	ld	xl, a
	clrw	y
	pushw	x
	pushw	y
	ldw	x, (0x3b, sp)
	pushw	x
	ldw	x, (0x3b, sp)
	pushw	x
	call	__mullong
	addw	sp, #8
	ldw	(0x27, sp), x
	ldw	(0x25, sp), y
;	../src/pff.c: 857: fs->fatbase = bsect + ld_word(buf+BPB_RsvdSecCnt-13); /* FAT start sector (lba) */
	ldw	y, (0x3f, sp)
	ldw	(0x29, sp), y
	ldw	x, y
	addw	x, #0x000a
	ldw	(0x2b, sp), x
	ldw	x, sp
	incw	x
	incw	x
	ldw	(0x3b, sp), x
	pushw	x
	call	_ld_word
	addw	sp, #2
	exgw	x, y
	clr	a
	clrw	x
	addw	y, (0x33, sp)
	adc	a, (0x32, sp)
	ld	(0x36, sp), a
	ld	a, xh
	adc	a, (0x31, sp)
	ld	(0x35, sp), a
	ldw	x, (0x2b, sp)
	ldw	(0x2, x), y
	ldw	y, (0x35, sp)
	ldw	(x), y
;	../src/pff.c: 858: fs->csize = buf[BPB_SecPerClus-13];					/* Number of sectors per cluster */
	ldw	x, (0x29, sp)
	incw	x
	incw	x
	ldw	(0x2d, sp), x
	ld	a, (0x01, sp)
	ldw	x, (0x2d, sp)
	ld	(x), a
;	../src/pff.c: 859: fs->n_rootdir = ld_word(buf+BPB_RootEntCnt-13);		/* Nmuber of root directory entries */
	ldw	x, (0x29, sp)
	addw	x, #0x0004
	ldw	(0x2f, sp), x
	ldw	x, (0x39, sp)
	pushw	x
	call	_ld_word
	addw	sp, #2
	ldw	y, (0x2f, sp)
	ldw	(y), x
;	../src/pff.c: 860: tsect = ld_word(buf+BPB_TotSec16-13);				/* Number of sectors on the file system */
	ldw	x, sp
	addw	x, #7
	pushw	x
	call	_ld_word
	addw	sp, #2
	clrw	y
	ldw	(0x37, sp), x
	ldw	(0x35, sp), y
;	../src/pff.c: 861: if (!tsect) tsect = ld_dword(buf+BPB_TotSec32-13);
	tnzw	x
	jrne	00119$
	tnzw	y
	jrne	00119$
	ldw	x, sp
	addw	x, #20
	pushw	x
	call	_ld_dword
	addw	sp, #2
	ldw	(0x37, sp), x
	ldw	(0x35, sp), y
00119$:
;	../src/pff.c: 863: - ld_word(buf+BPB_RsvdSecCnt-13) - fsize - fs->n_rootdir / 16
	ldw	x, (0x3b, sp)
	pushw	x
	call	_ld_word
	addw	sp, #2
	ldw	(0x3b, sp), x
	clr	(0x3a, sp)
	clr	(0x39, sp)
	ldw	y, (0x37, sp)
	subw	y, (0x3b, sp)
	ld	a, (0x36, sp)
	sbc	a, (0x3a, sp)
	push	a
	ld	a, (0x36, sp)
	sbc	a, (0x3a, sp)
	ld	xl, a
	pop	a
	subw	y, (0x27, sp)
	sbc	a, (0x26, sp)
	ld	(0x32, sp), a
	ld	a, xl
	sbc	a, (0x25, sp)
	ldw	x, (0x2f, sp)
	ldw	x, (x)
	srlw	x
	srlw	x
	srlw	x
	srlw	x
	ldw	(0x37, sp), x
	clrw	x
	clr	(0x35, sp)
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
;	../src/pff.c: 864: ) / fs->csize + 2;
	ldw	x, (0x2d, sp)
	ld	a, (x)
	clrw	x
	ld	xl, a
	clrw	y
	pushw	x
	pushw	y
	ldw	x, (0x3f, sp)
	pushw	x
	ldw	x, (0x3f, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x39, sp), y
	addw	x, #0x0002
	exgw	x, y
	ldw	x, (0x39, sp)
	jrnc	00209$
	incw	x
00209$:
	ldw	(0x39, sp), x
;	../src/pff.c: 865: fs->n_fatent = (CLUST)mclst;
	ldw	x, (0x29, sp)
	addw	x, #0x0006
	ldw	(0x2, x), y
	ld	a, (0x3a, sp)
	ld	(0x1, x), a
	ld	a, (0x39, sp)
	ld	(x), a
;	../src/pff.c: 867: fmt = 0;							/* Determine the FAT sub type */
	clr	a
;	../src/pff.c: 870: if (PF_FS_FAT32 && mclst >= 0xFFF7) fmt = FS_FAT32;
	cpw	y, #0xfff7
	push	a
	ld	a, (0x3b, sp)
	sbc	a, #0x00
	ld	a, (0x3a, sp)
	sbc	a, #0x00
	pop	a
	jrc	00128$
	ld	a, #0x03
00128$:
;	../src/pff.c: 871: if (!fmt) return FR_NO_FILESYSTEM;
	tnz	a
	jrne	00131$
	ld	a, #0x06
	jra	00137$
00131$:
;	../src/pff.c: 872: fs->fs_type = fmt;
	ldw	x, (0x29, sp)
	ld	(x), a
;	../src/pff.c: 875: fs->dirbase = ld_dword(buf+(BPB_RootClus-13));	/* Root directory start cluster */
	ldw	x, (0x29, sp)
	addw	x, #0x000e
	ldw	(0x37, sp), x
	ldw	x, sp
	addw	x, #32
	pushw	x
	call	_ld_dword
	addw	sp, #2
	ldw	(0x39, sp), y
	ldw	y, (0x37, sp)
	ldw	(0x2, y), x
	ldw	x, (0x39, sp)
	ldw	(y), x
;	../src/pff.c: 879: fs->database = fs->fatbase + fsize + fs->n_rootdir / 16;	/* Data start sector (lba) */
	ldw	x, (0x29, sp)
	addw	x, #0x0012
	ldw	(0x3b, sp), x
	ldw	x, (0x2b, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	addw	y, (0x27, sp)
	ldw	(0x39, sp), y
	ld	a, xl
	adc	a, (0x26, sp)
	ld	(0x38, sp), a
	ld	a, xh
	adc	a, (0x25, sp)
	ldw	x, (0x2f, sp)
	ldw	x, (x)
	srlw	x
	srlw	x
	srlw	x
	srlw	x
	exgw	x, y
	clrw	x
	clr	(0x2f, sp)
	addw	y, (0x39, sp)
	push	a
	ld	a, xl
	adc	a, (0x39, sp)
	ld	(0x35, sp), a
	pop	a
	adc	a, (0x2f, sp)
	ld	(0x33, sp), a
	ldw	x, (0x3b, sp)
	ldw	(0x2, x), y
	ldw	y, (0x33, sp)
	ldw	(x), y
;	../src/pff.c: 881: fs->flag = 0;
	ldw	x, (0x29, sp)
	incw	x
	clr	(x)
;	../src/pff.c: 882: FatFs = fs;
	ldw	x, (0x29, sp)
	ldw	_FatFs+0, x
;	../src/pff.c: 884: return FR_OK;
	clr	a
00137$:
;	../src/pff.c: 885: }
	addw	sp, #60
	ret
;	../src/pff.c: 894: FRESULT pf_open (
;	-----------------------------------------
;	 function pf_open
;	-----------------------------------------
_pf_open:
	sub	sp, #70
;	../src/pff.c: 901: FATFS *fs = FatFs;
	ldw	x, _FatFs+0
;	../src/pff.c: 904: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
	ldw	(0x3d, sp), x
	jrne	00102$
	ld	a, #0x05
	jp	00108$
00102$:
;	../src/pff.c: 906: fs->flag = 0;
	ldw	x, (0x3d, sp)
	incw	x
	ldw	(0x3f, sp), x
	clr	(x)
;	../src/pff.c: 907: dj.fn = sp;
	ldw	x, sp
	addw	x, #3
	ldw	y, sp
	addw	y, #17
	ldw	(x), y
;	../src/pff.c: 908: res = follow_path(&dj, dir, path);	/* Follow the file path */
	ldw	x, (0x49, sp)
	pushw	x
	ldw	x, sp
	addw	x, #31
	pushw	x
	ldw	x, sp
	addw	x, #5
	pushw	x
	call	_follow_path
	addw	sp, #6
	ld	xl, a
;	../src/pff.c: 909: if (res != FR_OK) return res;		/* Follow failed */
	tnz	a
	jreq	00104$
	ld	a, xl
	jra	00108$
00104$:
;	../src/pff.c: 910: if (!dir[0] || (dir[DIR_Attr] & AM_DIR)) return FR_NO_FILE;	/* It is a directory */
	ld	a, (0x1d, sp)
	jreq	00105$
	ld	a, (0x28, sp)
	bcp	a, #0x10
	jreq	00106$
00105$:
	ld	a, #0x03
	jra	00108$
00106$:
;	../src/pff.c: 912: fs->org_clust = get_clust(dir);		/* File start cluster */
	ldw	x, (0x3d, sp)
	addw	x, #0x001e
	ldw	(0x41, sp), x
	ldw	x, sp
	addw	x, #29
	pushw	x
	call	_get_clust
	addw	sp, #2
	ldw	(0x43, sp), y
	ldw	y, (0x41, sp)
	ldw	(0x2, y), x
	ldw	x, (0x43, sp)
	ldw	(y), x
;	../src/pff.c: 913: fs->fsize = ld_dword(dir+DIR_FileSize);	/* File size */
	ldw	x, (0x3d, sp)
	addw	x, #0x001a
	ldw	(0x41, sp), x
	ldw	x, sp
	addw	x, #57
	pushw	x
	call	_ld_dword
	addw	sp, #2
	ldw	(0x43, sp), y
	ldw	y, (0x41, sp)
	ldw	(0x2, y), x
	ldw	x, (0x43, sp)
	ldw	(y), x
;	../src/pff.c: 914: fs->fptr = 0;						/* File pointer */
	ldw	x, (0x3d, sp)
	addw	x, #0x0016
	clrw	y
	ldw	(0x2, x), y
	ldw	(x), y
;	../src/pff.c: 915: fs->flag = FA_OPENED;
	ldw	x, (0x3f, sp)
	ld	a, #0x01
	ld	(x), a
;	../src/pff.c: 917: return FR_OK;
	clr	a
00108$:
;	../src/pff.c: 918: }
	addw	sp, #70
	ret
;	../src/pff.c: 928: FRESULT pf_read (
;	-----------------------------------------
;	 function pf_read
;	-----------------------------------------
_pf_read:
	sub	sp, #26
;	../src/pff.c: 938: BYTE cs, *rbuff = buff;
	ldw	x, (0x1d, sp)
	ldw	(0x01, sp), x
;	../src/pff.c: 939: FATFS *fs = FatFs;
	ldw	x, _FatFs+0
	ldw	(0x19, sp), x
;	../src/pff.c: 942: *br = 0;
	ldw	y, (0x21, sp)
	ldw	(0x03, sp), y
	ldw	x, y
	clr	(0x1, x)
	clr	(x)
;	../src/pff.c: 943: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
	ldw	x, (0x19, sp)
	jrne	00102$
	ld	a, #0x05
	jp	00127$
00102$:
;	../src/pff.c: 944: if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
	ldw	x, (0x19, sp)
	incw	x
	ldw	(0x05, sp), x
	ld	a, (x)
	srl	a
	jrc	00104$
	ld	a, #0x04
	jp	00127$
00104$:
;	../src/pff.c: 946: remain = fs->fsize - fs->fptr;
	ldw	x, (0x19, sp)
	ldw	y, x
	ldw	y, (0x1c, y)
	ldw	x, (0x1a, x)
	ldw	(0x11, sp), x
	ldw	x, (0x19, sp)
	addw	x, #0x0016
	ldw	(0x07, sp), x
	ld	a, (0x3, x)
	ld	(0x18, sp), a
	ld	a, (0x2, x)
	ld	(0x17, sp), a
	ldw	x, (x)
	subw	y, (0x17, sp)
	ld	a, (0x12, sp)
	pushw	x
	sbc	a, (2, sp)
	popw	x
	ld	xl, a
	ld	a, (0x11, sp)
	pushw	x
	sbc	a, (1, sp)
	popw	x
	ldw	(0x13, sp), y
	ld	xh, a
;	../src/pff.c: 947: if (btr > remain) btr = (UINT)remain;			/* Truncate btr by remaining bytes */
	ldw	y, (0x1f, sp)
	ldw	(0x17, sp), y
	clr	(0x16, sp)
	clr	(0x15, sp)
	ld	a, (0x14, sp)
	cp	a, (0x18, sp)
	ld	a, (0x13, sp)
	sbc	a, (0x17, sp)
	ld	a, xl
	sbc	a, (0x16, sp)
	ld	a, xh
	sbc	a, (0x15, sp)
	jrnc	00140$
	ldw	x, (0x13, sp)
	ldw	(0x1f, sp), x
;	../src/pff.c: 949: while (btr)	{									/* Repeat until all data transferred */
00140$:
	ldw	x, (0x19, sp)
	addw	x, #0x0022
	ldw	(0x09, sp), x
	ldw	y, (0x19, sp)
	ldw	(0x0b, sp), y
	ldw	y, (0x19, sp)
	ldw	(0x0d, sp), y
	ldw	x, (0x19, sp)
	addw	x, #0x0026
	ldw	(0x0f, sp), x
00124$:
	ldw	x, (0x1f, sp)
	jrne	00197$
	jp	00126$
00197$:
;	../src/pff.c: 950: if ((fs->fptr % 512) == 0) {				/* On the sector boundary? */
	ldw	x, (0x07, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	(0x13, sp), y
	ldw	x, (x)
	ldw	(0x11, sp), x
	ld	a, (0x14, sp)
	ld	(0x1a, sp), a
	ld	a, (0x13, sp)
	and	a, #0x01
	ld	(0x19, sp), a
	clrw	x
	ldw	(0x17, sp), x
	ldw	x, (0x19, sp)
	jrne	00198$
	ldw	x, (0x17, sp)
	jreq	00199$
00198$:
	jp	00117$
00199$:
;	../src/pff.c: 951: cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
	ldw	y, (0x12, sp)
	ldw	(0x17, sp), y
	ld	a, (0x11, sp)
	ld	(0x16, sp), a
	clr	(0x15, sp)
	srl	(0x16, sp)
	rrc	(0x17, sp)
	rrc	(0x18, sp)
	ldw	x, (0x0d, sp)
	ld	a, (0x2, x)
	ld	(0x1a, sp), a
	dec	(0x1a, sp)
	ld	a, (0x1a, sp)
	ld	(0x19, sp), a
	ld	a, (0x18, sp)
	ld	(0x1a, sp), a
	and	a, (0x19, sp)
;	../src/pff.c: 952: if (!cs) {								/* On the cluster boundary? */
	ld	(0x1a, sp), a
	jrne	00113$
;	../src/pff.c: 953: if (fs->fptr == 0) {				/* On the top of the file? */
	ldw	x, (0x13, sp)
	jrne	00108$
	ldw	x, (0x11, sp)
	jrne	00108$
;	../src/pff.c: 954: clst = fs->org_clust;
	ldw	x, (0x0b, sp)
	ldw	y, x
	ldw	y, (0x20, y)
	ldw	x, (0x1e, x)
	ldw	(0x18, sp), y
	ldw	(0x16, sp), x
	jra	00109$
00108$:
;	../src/pff.c: 956: clst = get_fat(fs->curr_clust);
	ldw	x, (0x09, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	pushw	y
	pushw	x
	call	_get_fat
	addw	sp, #4
	ldw	(0x16, sp), y
	ldw	(0x18, sp), x
00109$:
;	../src/pff.c: 958: if (clst <= 1) ABORT(FR_DISK_ERR);
	clrw	x
	incw	x
	cpw	x, (0x18, sp)
	clr	a
	sbc	a, (0x17, sp)
	clr	a
	sbc	a, (0x16, sp)
	jrc	00111$
	ldw	x, (0x05, sp)
	clr	(x)
	ld	a, #0x01
	jp	00127$
00111$:
;	../src/pff.c: 959: fs->curr_clust = clst;				/* Update current cluster */
	ldw	x, (0x09, sp)
	ldw	y, (0x18, sp)
	ldw	(0x2, x), y
	ldw	y, (0x16, sp)
	ldw	(x), y
00113$:
;	../src/pff.c: 961: sect = clust2sect(fs->curr_clust);		/* Get current sector */
	ldw	x, (0x09, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	pushw	y
	pushw	x
	call	_clust2sect
	addw	sp, #4
	ldw	(0x18, sp), x
	ldw	(0x16, sp), y
;	../src/pff.c: 962: if (!sect) ABORT(FR_DISK_ERR);
	tnzw	x
	jrne	00115$
	tnzw	y
	jrne	00115$
	ldw	x, (0x05, sp)
	clr	(x)
	ld	a, #0x01
	jp	00127$
00115$:
;	../src/pff.c: 963: fs->dsect = sect + cs;
	ld	a, (0x1a, sp)
	clrw	y
	clrw	x
	ld	yl, a
	addw	y, (0x18, sp)
	ld	a, xl
	adc	a, (0x17, sp)
	ld	(0x13, sp), a
	ld	a, xh
	adc	a, (0x16, sp)
	ld	(0x12, sp), a
	ldw	x, (0x0f, sp)
	ldw	(0x2, x), y
	ldw	y, (0x12, sp)
	ldw	(x), y
00117$:
;	../src/pff.c: 946: remain = fs->fsize - fs->fptr;
	ldw	x, (0x07, sp)
	ldw	x, (0x2, x)
;	../src/pff.c: 965: rcnt = 512 - (UINT)fs->fptr % 512;			/* Get partial sector data from sector buffer */
	ld	a, xl
	ld	(0x16, sp), a
	ld	a, xh
	and	a, #0x01
	ld	(0x15, sp), a
	clrw	x
	ld	a, #0x02
	ld	xh, a
	subw	x, (0x15, sp)
;	../src/pff.c: 966: if (rcnt > btr) rcnt = btr;
	ldw	(0x11, sp), x
	cpw	x, (0x1f, sp)
	jrule	00119$
	ldw	y, (0x1f, sp)
	ldw	(0x11, sp), y
00119$:
;	../src/pff.c: 967: dr = disk_readp(rbuff, fs->dsect, (UINT)fs->fptr % 512, rcnt);
	ldw	x, (0x0f, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	ldw	(0x17, sp), x
	ldw	x, (0x11, sp)
	pushw	x
	ldw	x, (0x17, sp)
	pushw	x
	pushw	y
	ldw	x, (0x1d, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	call	_disk_readp
	addw	sp, #10
;	../src/pff.c: 968: if (dr) ABORT(FR_DISK_ERR);
	tnz	a
	jreq	00121$
	ldw	x, (0x05, sp)
	clr	(x)
	ld	a, #0x01
	jra	00127$
00121$:
;	../src/pff.c: 969: fs->fptr += rcnt;							/* Advances file read pointer */
	ldw	x, (0x07, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	(0x15, sp), y
	ldw	x, (x)
	ldw	(0x13, sp), x
	ldw	y, (0x11, sp)
	clr	a
	clrw	x
	addw	y, (0x15, sp)
	adc	a, (0x14, sp)
	ld	(0x18, sp), a
	ld	a, xl
	adc	a, (0x13, sp)
	ld	(0x17, sp), a
	ldw	x, (0x07, sp)
	ldw	(0x2, x), y
	ldw	y, (0x17, sp)
	ldw	(x), y
;	../src/pff.c: 970: btr -= rcnt; *br += rcnt;					/* Update read counter */
	ldw	x, (0x1f, sp)
	subw	x, (0x11, sp)
	ldw	(0x1f, sp), x
	ldw	x, (0x03, sp)
	ldw	x, (x)
	addw	x, (0x11, sp)
	ldw	y, (0x03, sp)
	ldw	(y), x
;	../src/pff.c: 971: if (rbuff) rbuff += rcnt;					/* Advances the data pointer if destination is memory */
	ldw	x, (0x01, sp)
	jrne	00208$
	jp	00124$
00208$:
	ldw	x, (0x01, sp)
	addw	x, (0x11, sp)
	ldw	(0x01, sp), x
	jp	00124$
00126$:
;	../src/pff.c: 974: return FR_OK;
	clr	a
00127$:
;	../src/pff.c: 975: }
	addw	sp, #26
	ret
;	../src/pff.c: 985: FRESULT pf_write (
;	-----------------------------------------
;	 function pf_write
;	-----------------------------------------
_pf_write:
	sub	sp, #28
;	../src/pff.c: 993: const BYTE *p = buff;
	ldw	x, (0x1f, sp)
	ldw	(0x05, sp), x
;	../src/pff.c: 996: FATFS *fs = FatFs;
	ldw	x, _FatFs+0
	ldw	(0x07, sp), x
;	../src/pff.c: 999: *bw = 0;
	ldw	y, (0x23, sp)
	ldw	(0x09, sp), y
	ldw	x, y
	clr	(0x1, x)
	clr	(x)
;	../src/pff.c: 1000: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
	ldw	x, (0x07, sp)
	jrne	00102$
	ld	a, #0x05
	jp	00139$
00102$:
;	../src/pff.c: 1001: if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x0b, sp), x
	ld	a, (x)
	bcp	a, #0x01
	jrne	00104$
	ld	a, #0x04
	jp	00139$
00104$:
;	../src/pff.c: 1004: if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
	and	a, #0x40
	ld	(0x1c, sp), a
	clr	(0x1b, sp)
;	../src/pff.c: 1003: if (!btw) {		/* Finalize request */
	ldw	x, (0x21, sp)
	jrne	00111$
;	../src/pff.c: 1004: if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
	ldw	x, (0x1b, sp)
	jreq	00106$
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	call	_disk_writep
	addw	sp, #6
	tnz	a
	jreq	00106$
	ldw	x, (0x0b, sp)
	clr	(x)
	ld	a, #0x01
	jp	00139$
00106$:
;	../src/pff.c: 1005: fs->flag &= ~FA__WIP;
	ldw	x, (0x0b, sp)
	ld	a, (x)
	and	a, #0xbf
	ldw	x, (0x0b, sp)
	ld	(x), a
;	../src/pff.c: 1006: return FR_OK;
	clr	a
	jp	00139$
00111$:
;	../src/pff.c: 1009: fs->fptr &= 0xFFFFFE00;
	ldw	x, (0x07, sp)
	addw	x, #0x0016
	ldw	(0x13, sp), x
;	../src/pff.c: 1008: if (!(fs->flag & FA__WIP)) {	/* Round-down fptr to the sector boundary */
	ldw	x, (0x1b, sp)
	jrne	00112$
;	../src/pff.c: 1009: fs->fptr &= 0xFFFFFE00;
	ldw	x, (0x13, sp)
	ld	a, (0x2, x)
	ldw	x, (x)
	and	a, #0xfe
	ld	yh, a
	clr	a
	ld	yl, a
	rlwa	x
	ld	(0x19, sp), a
	rrwa	x
	ld	a, xl
	ldw	x, (0x13, sp)
	ldw	(0x2, x), y
	ld	(0x1, x), a
	ld	a, (0x19, sp)
	ld	(x), a
00112$:
;	../src/pff.c: 1012: remain = fs->fsize - fs->fptr;
	ldw	x, (0x07, sp)
	ldw	y, x
	ldw	y, (0x1c, y)
	ldw	x, (0x1a, x)
	ldw	(0x15, sp), x
	ldw	x, (0x13, sp)
	ldw	(0x0d, sp), x
	ldw	x, (0x13, sp)
	ld	a, (0x3, x)
	ld	(0x1c, sp), a
	ld	a, (0x2, x)
	ld	(0x1b, sp), a
	ldw	x, (x)
	ldw	(0x19, sp), x
	subw	y, (0x1b, sp)
	ld	a, (0x16, sp)
	sbc	a, (0x1a, sp)
	ld	xl, a
	ld	a, (0x15, sp)
	sbc	a, (0x19, sp)
	ldw	(0x17, sp), y
	ld	xh, a
;	../src/pff.c: 1013: if (btw > remain) btw = (UINT)remain;			/* Truncate btw by remaining bytes */
	ldw	y, (0x21, sp)
	ldw	(0x1b, sp), y
	clr	(0x1a, sp)
	clr	(0x19, sp)
	ld	a, (0x18, sp)
	cp	a, (0x1c, sp)
	ld	a, (0x17, sp)
	sbc	a, (0x1b, sp)
	ld	a, xl
	sbc	a, (0x1a, sp)
	ld	a, xh
	sbc	a, (0x19, sp)
	jrnc	00157$
	ldw	x, (0x17, sp)
	ldw	(0x21, sp), x
;	../src/pff.c: 1015: while (btw)	{									/* Repeat until all data transferred */
00157$:
	ldw	x, (0x07, sp)
	addw	x, #0x0022
	ldw	(0x0f, sp), x
	ldw	y, (0x07, sp)
	ldw	(0x11, sp), y
	ldw	y, (0x07, sp)
	ldw	(0x13, sp), y
00136$:
	ldw	x, (0x21, sp)
	jrne	00243$
	jp	00138$
00243$:
;	../src/pff.c: 1016: if ((UINT)fs->fptr % 512 == 0) {			/* On the sector boundary? */
	ldw	x, (0x0d, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	(0x1a, sp), y
	ldw	x, (x)
	ldw	(0x18, sp), x
	ldw	x, (0x1a, sp)
	ld	a, xh
	and	a, #0x01
	ld	xh, a
	tnzw	x
	jreq	00244$
	jp	00127$
00244$:
;	../src/pff.c: 1017: cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
	ld	a, (0x18, sp)
	ld	(0x02, sp), a
	ldw	x, (0x19, sp)
	clr	(0x01, sp)
	srl	(0x02, sp)
	rrcw	x
	ldw	y, (0x13, sp)
	ld	a, (0x2, y)
	dec	a
	pushw	x
	and	a, (2, sp)
	popw	x
;	../src/pff.c: 1018: if (!cs) {								/* On the cluster boundary? */
	ld	(0x1c, sp), a
	jrne	00121$
;	../src/pff.c: 1019: if (fs->fptr == 0) {				/* On the top of the file? */
	ldw	x, (0x1a, sp)
	jrne	00116$
	ldw	x, (0x18, sp)
	jrne	00116$
;	../src/pff.c: 1020: clst = fs->org_clust;
	ldw	x, (0x11, sp)
	ldw	y, x
	ldw	y, (0x20, y)
	ldw	x, (0x1e, x)
	ldw	(0x1a, sp), y
	ldw	(0x18, sp), x
	jra	00117$
00116$:
;	../src/pff.c: 1022: clst = get_fat(fs->curr_clust);
	ldw	x, (0x0f, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	pushw	y
	pushw	x
	call	_get_fat
	addw	sp, #4
	ldw	(0x18, sp), y
	ldw	(0x1a, sp), x
00117$:
;	../src/pff.c: 1024: if (clst <= 1) ABORT(FR_DISK_ERR);
	clrw	x
	incw	x
	cpw	x, (0x1a, sp)
	clr	a
	sbc	a, (0x19, sp)
	clr	a
	sbc	a, (0x18, sp)
	jrc	00119$
	ldw	x, (0x0b, sp)
	clr	(x)
	ld	a, #0x01
	jp	00139$
00119$:
;	../src/pff.c: 1025: fs->curr_clust = clst;				/* Update current cluster */
	ldw	x, (0x0f, sp)
	ldw	y, (0x1a, sp)
	ldw	(0x2, x), y
	ldw	y, (0x18, sp)
	ldw	(x), y
00121$:
;	../src/pff.c: 1027: sect = clust2sect(fs->curr_clust);		/* Get current sector */
	ldw	x, (0x0f, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ldw	x, (x)
	pushw	y
	pushw	x
	call	_clust2sect
	addw	sp, #4
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	../src/pff.c: 1028: if (!sect) ABORT(FR_DISK_ERR);
	tnzw	x
	jrne	00123$
	tnzw	y
	jrne	00123$
	ldw	x, (0x0b, sp)
	clr	(x)
	ld	a, #0x01
	jp	00139$
00123$:
;	../src/pff.c: 1029: fs->dsect = sect + cs;
	ldw	x, (0x07, sp)
	addw	x, #0x0026
	clrw	y
	ld	a, (0x1c, sp)
	ld	yl, a
	clr	a
	clr	(0x15, sp)
	addw	y, (0x03, sp)
	adc	a, (0x02, sp)
	ld	(0x1a, sp), a
	ld	a, (0x15, sp)
	adc	a, (0x01, sp)
	ld	(0x19, sp), a
	ldw	(0x2, x), y
	ld	a, (0x1a, sp)
	ld	(0x1, x), a
	ld	a, (0x19, sp)
	ld	(x), a
;	../src/pff.c: 1030: if (disk_writep(0, fs->dsect)) ABORT(FR_DISK_ERR);	/* Initiate a sector write operation */
	pushw	y
	ldw	x, (0x1b, sp)
	pushw	x
	clrw	x
	pushw	x
	call	_disk_writep
	addw	sp, #6
	tnz	a
	jreq	00125$
	ldw	x, (0x0b, sp)
	clr	(x)
	ld	a, #0x01
	jp	00139$
00125$:
;	../src/pff.c: 1031: fs->flag |= FA__WIP;
	ldw	x, (0x0b, sp)
	ld	a, (x)
	or	a, #0x40
	ldw	x, (0x0b, sp)
	ld	(x), a
00127$:
;	../src/pff.c: 1033: wcnt = 512 - (UINT)fs->fptr % 512;			/* Number of bytes to write to the sector */
	ldw	x, (0x0d, sp)
	ldw	x, (0x2, x)
	ld	a, xh
	and	a, #0x01
	ld	(0x1b, sp), a
	ld	a, xl
	neg	a
	ld	xl, a
	ld	a, #0x02
	sbc	a, (0x1b, sp)
	ld	xh, a
;	../src/pff.c: 1034: if (wcnt > btw) wcnt = btw;
	ldw	(0x15, sp), x
	cpw	x, (0x21, sp)
	jrule	00129$
	ldw	y, (0x21, sp)
	ldw	(0x15, sp), y
00129$:
;	../src/pff.c: 1035: if (disk_writep(p, wcnt)) ABORT(FR_DISK_ERR);	/* Send data to the sector */
	ldw	y, (0x15, sp)
	ldw	(0x03, sp), y
	clr	(0x02, sp)
	clr	(0x01, sp)
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	call	_disk_writep
	addw	sp, #6
	tnz	a
	jreq	00131$
	ldw	x, (0x0b, sp)
	clr	(x)
	ld	a, #0x01
	jra	00139$
00131$:
;	../src/pff.c: 1036: fs->fptr += wcnt; p += wcnt;				/* Update pointers and counters */
	ldw	x, (0x0d, sp)
	ldw	y, x
	ldw	y, (0x2, y)
	ld	a, (0x1, x)
	push	a
	ld	a, (x)
	ld	xl, a
	pop	a
	addw	y, (0x03, sp)
	ldw	(0x19, sp), y
	adc	a, (0x02, sp)
	ld	(0x18, sp), a
	ld	a, xl
	adc	a, (0x01, sp)
	ld	(0x17, sp), a
	ldw	x, (0x0d, sp)
	ldw	y, (0x19, sp)
	ldw	(0x2, x), y
	ldw	y, (0x17, sp)
	ldw	(x), y
	ldw	x, (0x05, sp)
	addw	x, (0x15, sp)
	ldw	(0x05, sp), x
;	../src/pff.c: 1037: btw -= wcnt; *bw += wcnt;
	ldw	x, (0x21, sp)
	subw	x, (0x15, sp)
	ldw	(0x21, sp), x
	ldw	x, (0x09, sp)
	ldw	x, (x)
	addw	x, (0x15, sp)
	ldw	(0x1b, sp), x
	ldw	x, (0x09, sp)
	ldw	y, (0x1b, sp)
	ldw	(x), y
;	../src/pff.c: 1038: if ((UINT)fs->fptr % 512 == 0) {
	ldw	y, (0x19, sp)
	ldw	(0x1b, sp), y
	ld	a, (0x1c, sp)
	ld	(0x1a, sp), a
	ld	a, (0x1b, sp)
	and	a, #0x01
	ld	(0x19, sp), a
	ldw	x, (0x19, sp)
	jreq	00254$
	jp	00136$
00254$:
;	../src/pff.c: 1039: if (disk_writep(0, 0)) ABORT(FR_DISK_ERR);	/* Finalize the currtent secter write operation */
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	call	_disk_writep
	addw	sp, #6
	tnz	a
	jreq	00133$
	ldw	x, (0x0b, sp)
	clr	(x)
	ld	a, #0x01
	jra	00139$
00133$:
;	../src/pff.c: 1040: fs->flag &= ~FA__WIP;
	ldw	x, (0x0b, sp)
	ld	a, (x)
	and	a, #0xbf
	ldw	x, (0x0b, sp)
	ld	(x), a
	jp	00136$
00138$:
;	../src/pff.c: 1044: return FR_OK;
	clr	a
00139$:
;	../src/pff.c: 1045: }
	addw	sp, #28
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
