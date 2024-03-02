                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.1.0 #12072 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module pff
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _disk_writep
                                     12 	.globl _disk_readp
                                     13 	.globl _disk_initialize
                                     14 	.globl _pf_mount
                                     15 	.globl _pf_open
                                     16 	.globl _pf_read
                                     17 	.globl _pf_write
                                     18 ;--------------------------------------------------------
                                     19 ; ram data
                                     20 ;--------------------------------------------------------
                                     21 	.area DATA
      000267                         22 _FatFs:
      000267                         23 	.ds 2
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area INITIALIZED
                                     28 ;--------------------------------------------------------
                                     29 ; absolute external ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DABS (ABS)
                                     32 
                                     33 ; default segment ordering for linker
                                     34 	.area HOME
                                     35 	.area GSINIT
                                     36 	.area GSFINAL
                                     37 	.area CONST
                                     38 	.area INITIALIZER
                                     39 	.area CODE
                                     40 
                                     41 ;--------------------------------------------------------
                                     42 ; global & static initialisations
                                     43 ;--------------------------------------------------------
                                     44 	.area HOME
                                     45 	.area GSINIT
                                     46 	.area GSFINAL
                                     47 	.area GSINIT
                                     48 ;--------------------------------------------------------
                                     49 ; Home
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
                                     52 	.area HOME
                                     53 ;--------------------------------------------------------
                                     54 ; code
                                     55 ;--------------------------------------------------------
                                     56 	.area CODE
                                     57 ;	../src/pff.c: 384: static WORD ld_word (const BYTE* ptr)	/*	 Load a 2-byte little-endian word */
                                     58 ;	-----------------------------------------
                                     59 ;	 function ld_word
                                     60 ;	-----------------------------------------
      009042                         61 _ld_word:
      009042 89               [ 2]   62 	pushw	x
                                     63 ;	../src/pff.c: 388: rv = ptr[1];
      009043 1E 05            [ 2]   64 	ldw	x, (0x05, sp)
      009045 E6 01            [ 1]   65 	ld	a, (0x1, x)
                                     66 ;	../src/pff.c: 389: rv = rv << 8 | ptr[0];
      009047 6B 01            [ 1]   67 	ld	(0x01, sp), a
      009049 0F 02            [ 1]   68 	clr	(0x02, sp)
      00904B 1E 05            [ 2]   69 	ldw	x, (0x05, sp)
      00904D F6               [ 1]   70 	ld	a, (x)
      00904E 5F               [ 1]   71 	clrw	x
      00904F 1A 02            [ 1]   72 	or	a, (0x02, sp)
      009051 02               [ 1]   73 	rlwa	x
      009052 1A 01            [ 1]   74 	or	a, (0x01, sp)
                                     75 ;	../src/pff.c: 390: return rv;
      009054 95               [ 1]   76 	ld	xh, a
                                     77 ;	../src/pff.c: 391: }
      009055 5B 02            [ 2]   78 	addw	sp, #2
      009057 81               [ 4]   79 	ret
                                     80 ;	../src/pff.c: 393: static DWORD ld_dword (const BYTE* ptr)	/* Load a 4-byte little-endian word */
                                     81 ;	-----------------------------------------
                                     82 ;	 function ld_dword
                                     83 ;	-----------------------------------------
      009058                         84 _ld_dword:
      009058 52 08            [ 2]   85 	sub	sp, #8
                                     86 ;	../src/pff.c: 397: rv = ptr[3];
      00905A 1E 0B            [ 2]   87 	ldw	x, (0x0b, sp)
      00905C E6 03            [ 1]   88 	ld	a, (0x3, x)
      00905E 5F               [ 1]   89 	clrw	x
      00905F 90 5F            [ 1]   90 	clrw	y
      009061 97               [ 1]   91 	ld	xl, a
                                     92 ;	../src/pff.c: 398: rv = rv << 8 | ptr[2];
      009062 1F 02            [ 2]   93 	ldw	(0x02, sp), x
      009064 0F 04            [ 1]   94 	clr	(0x04, sp)
      009066 1E 0B            [ 2]   95 	ldw	x, (0x0b, sp)
      009068 E6 02            [ 1]   96 	ld	a, (0x2, x)
      00906A 0F 07            [ 1]   97 	clr	(0x07, sp)
      00906C 5F               [ 1]   98 	clrw	x
      00906D 0F 05            [ 1]   99 	clr	(0x05, sp)
      00906F 1A 04            [ 1]  100 	or	a, (0x04, sp)
      009071 95               [ 1]  101 	ld	xh, a
      009072 7B 03            [ 1]  102 	ld	a, (0x03, sp)
      009074 1A 07            [ 1]  103 	or	a, (0x07, sp)
      009076 90 95            [ 1]  104 	ld	yh, a
      009078 89               [ 2]  105 	pushw	x
      009079 7B 04            [ 1]  106 	ld	a, (0x04, sp)
      00907B 1A 02            [ 1]  107 	or	a, (2, sp)
      00907D 85               [ 2]  108 	popw	x
      00907E 97               [ 1]  109 	ld	xl, a
      00907F 90 9F            [ 1]  110 	ld	a, yl
      009081 1A 05            [ 1]  111 	or	a, (0x05, sp)
      009083 01               [ 1]  112 	rrwa	x
                                    113 ;	../src/pff.c: 399: rv = rv << 8 | ptr[1];
      009084 6B 01            [ 1]  114 	ld	(0x01, sp), a
      009086 61               [ 1]  115 	exg	a, yl
      009087 9F               [ 1]  116 	ld	a, xl
      009088 61               [ 1]  117 	exg	a, yl
      009089 0F 04            [ 1]  118 	clr	(0x04, sp)
      00908B 1E 0B            [ 2]  119 	ldw	x, (0x0b, sp)
      00908D E6 01            [ 1]  120 	ld	a, (0x1, x)
      00908F 5F               [ 1]  121 	clrw	x
      009090 0F 06            [ 1]  122 	clr	(0x06, sp)
      009092 0F 05            [ 1]  123 	clr	(0x05, sp)
      009094 1A 04            [ 1]  124 	or	a, (0x04, sp)
      009096 97               [ 1]  125 	ld	xl, a
      009097 89               [ 2]  126 	pushw	x
      009098 90 9F            [ 1]  127 	ld	a, yl
      00909A 1A 01            [ 1]  128 	or	a, (1, sp)
      00909C 85               [ 2]  129 	popw	x
      00909D 95               [ 1]  130 	ld	xh, a
      00909E 90 9E            [ 1]  131 	ld	a, yh
      0090A0 1A 06            [ 1]  132 	or	a, (0x06, sp)
      0090A2 90 97            [ 1]  133 	ld	yl, a
                                    134 ;	../src/pff.c: 400: rv = rv << 8 | ptr[0];
      0090A4 1F 02            [ 2]  135 	ldw	(0x02, sp), x
      0090A6 0F 04            [ 1]  136 	clr	(0x04, sp)
      0090A8 1E 0B            [ 2]  137 	ldw	x, (0x0b, sp)
      0090AA F6               [ 1]  138 	ld	a, (x)
      0090AB 0F 07            [ 1]  139 	clr	(0x07, sp)
      0090AD 5F               [ 1]  140 	clrw	x
      0090AE 0F 05            [ 1]  141 	clr	(0x05, sp)
      0090B0 1A 04            [ 1]  142 	or	a, (0x04, sp)
      0090B2 95               [ 1]  143 	ld	xh, a
      0090B3 7B 03            [ 1]  144 	ld	a, (0x03, sp)
      0090B5 1A 07            [ 1]  145 	or	a, (0x07, sp)
      0090B7 90 95            [ 1]  146 	ld	yh, a
      0090B9 89               [ 2]  147 	pushw	x
      0090BA 7B 04            [ 1]  148 	ld	a, (0x04, sp)
      0090BC 1A 02            [ 1]  149 	or	a, (2, sp)
      0090BE 85               [ 2]  150 	popw	x
      0090BF 97               [ 1]  151 	ld	xl, a
      0090C0 90 9F            [ 1]  152 	ld	a, yl
      0090C2 1A 05            [ 1]  153 	or	a, (0x05, sp)
      0090C4 61               [ 1]  154 	exg	a, yl
      0090C5 9E               [ 1]  155 	ld	a, xh
      0090C6 61               [ 1]  156 	exg	a, yl
      0090C7 95               [ 1]  157 	ld	xh, a
                                    158 ;	../src/pff.c: 401: return rv;
      0090C8 51               [ 1]  159 	exgw	x, y
                                    160 ;	../src/pff.c: 402: }
      0090C9 5B 08            [ 2]  161 	addw	sp, #8
      0090CB 81               [ 4]  162 	ret
                                    163 ;	../src/pff.c: 411: static void mem_set (void* dst, int val, int cnt) {
                                    164 ;	-----------------------------------------
                                    165 ;	 function mem_set
                                    166 ;	-----------------------------------------
      0090CC                        167 _mem_set:
      0090CC 89               [ 2]  168 	pushw	x
                                    169 ;	../src/pff.c: 412: char *d = (char*)dst;
      0090CD 1E 05            [ 2]  170 	ldw	x, (0x05, sp)
                                    171 ;	../src/pff.c: 413: while (cnt--) *d++ = (char)val;
      0090CF 1F 01            [ 2]  172 	ldw	(0x01, sp), x
      0090D1 16 09            [ 2]  173 	ldw	y, (0x09, sp)
      0090D3                        174 00101$:
      0090D3 93               [ 1]  175 	ldw	x, y
      0090D4 90 5A            [ 2]  176 	decw	y
      0090D6 5D               [ 2]  177 	tnzw	x
      0090D7 27 0C            [ 1]  178 	jreq	00104$
      0090D9 7B 08            [ 1]  179 	ld	a, (0x08, sp)
      0090DB 1E 01            [ 2]  180 	ldw	x, (0x01, sp)
      0090DD F7               [ 1]  181 	ld	(x), a
      0090DE 1E 01            [ 2]  182 	ldw	x, (0x01, sp)
      0090E0 5C               [ 1]  183 	incw	x
      0090E1 1F 01            [ 2]  184 	ldw	(0x01, sp), x
      0090E3 20 EE            [ 2]  185 	jra	00101$
      0090E5                        186 00104$:
                                    187 ;	../src/pff.c: 414: }
      0090E5 85               [ 2]  188 	popw	x
      0090E6 81               [ 4]  189 	ret
                                    190 ;	../src/pff.c: 417: static int mem_cmp (const void* dst, const void* src, int cnt) {
                                    191 ;	-----------------------------------------
                                    192 ;	 function mem_cmp
                                    193 ;	-----------------------------------------
      0090E7                        194 _mem_cmp:
      0090E7 52 0A            [ 2]  195 	sub	sp, #10
                                    196 ;	../src/pff.c: 418: const char *d = (const char *)dst, *s = (const char *)src;
      0090E9 16 0D            [ 2]  197 	ldw	y, (0x0d, sp)
      0090EB 1E 0F            [ 2]  198 	ldw	x, (0x0f, sp)
                                    199 ;	../src/pff.c: 419: int r = 0;
      0090ED 0F 02            [ 1]  200 	clr	(0x02, sp)
      0090EF 0F 01            [ 1]  201 	clr	(0x01, sp)
                                    202 ;	../src/pff.c: 420: while (cnt-- && (r = *d++ - *s++) == 0) ;
      0090F1 17 05            [ 2]  203 	ldw	(0x05, sp), y
      0090F3 1F 07            [ 2]  204 	ldw	(0x07, sp), x
      0090F5 16 11            [ 2]  205 	ldw	y, (0x11, sp)
      0090F7 17 09            [ 2]  206 	ldw	(0x09, sp), y
      0090F9                        207 00102$:
      0090F9 16 09            [ 2]  208 	ldw	y, (0x09, sp)
      0090FB 17 03            [ 2]  209 	ldw	(0x03, sp), y
      0090FD 1E 09            [ 2]  210 	ldw	x, (0x09, sp)
      0090FF 5A               [ 2]  211 	decw	x
      009100 1F 09            [ 2]  212 	ldw	(0x09, sp), x
      009102 1E 03            [ 2]  213 	ldw	x, (0x03, sp)
      009104 27 20            [ 1]  214 	jreq	00104$
      009106 1E 05            [ 2]  215 	ldw	x, (0x05, sp)
      009108 F6               [ 1]  216 	ld	a, (x)
      009109 1E 05            [ 2]  217 	ldw	x, (0x05, sp)
      00910B 5C               [ 1]  218 	incw	x
      00910C 1F 05            [ 2]  219 	ldw	(0x05, sp), x
      00910E 5F               [ 1]  220 	clrw	x
      00910F 97               [ 1]  221 	ld	xl, a
      009110 16 07            [ 2]  222 	ldw	y, (0x07, sp)
      009112 90 F6            [ 1]  223 	ld	a, (y)
      009114 16 07            [ 2]  224 	ldw	y, (0x07, sp)
      009116 90 5C            [ 1]  225 	incw	y
      009118 17 07            [ 2]  226 	ldw	(0x07, sp), y
      00911A 6B 04            [ 1]  227 	ld	(0x04, sp), a
      00911C 0F 03            [ 1]  228 	clr	(0x03, sp)
      00911E 72 F0 03         [ 2]  229 	subw	x, (0x03, sp)
      009121 1F 01            [ 2]  230 	ldw	(0x01, sp), x
      009123 5D               [ 2]  231 	tnzw	x
      009124 27 D3            [ 1]  232 	jreq	00102$
      009126                        233 00104$:
                                    234 ;	../src/pff.c: 421: return r;
      009126 1E 01            [ 2]  235 	ldw	x, (0x01, sp)
                                    236 ;	../src/pff.c: 422: }
      009128 5B 0A            [ 2]  237 	addw	sp, #10
      00912A 81               [ 4]  238 	ret
                                    239 ;	../src/pff.c: 430: static CLUST get_fat (	/* 1:IO error, Else:Cluster status */
                                    240 ;	-----------------------------------------
                                    241 ;	 function get_fat
                                    242 ;	-----------------------------------------
      00912B                        243 _get_fat:
      00912B 52 12            [ 2]  244 	sub	sp, #18
                                    245 ;	../src/pff.c: 435: FATFS *fs = FatFs;
      00912D 90 CE 02 67      [ 2]  246 	ldw	y, _FatFs+0
                                    247 ;	../src/pff.c: 440: if (clst < 2 || clst >= fs->n_fatent) return 1;	/* Range check */
      009131 1E 17            [ 2]  248 	ldw	x, (0x17, sp)
      009133 A3 00 02         [ 2]  249 	cpw	x, #0x0002
      009136 7B 16            [ 1]  250 	ld	a, (0x16, sp)
      009138 A2 00            [ 1]  251 	sbc	a, #0x00
      00913A 7B 15            [ 1]  252 	ld	a, (0x15, sp)
      00913C A2 00            [ 1]  253 	sbc	a, #0x00
      00913E 25 1B            [ 1]  254 	jrc	00101$
      009140 93               [ 1]  255 	ldw	x, y
      009141 E6 09            [ 1]  256 	ld	a, (0x9, x)
      009143 6B 12            [ 1]  257 	ld	(0x12, sp), a
      009145 E6 08            [ 1]  258 	ld	a, (0x8, x)
      009147 6B 11            [ 1]  259 	ld	(0x11, sp), a
      009149 EE 06            [ 2]  260 	ldw	x, (0x6, x)
      00914B 1F 0F            [ 2]  261 	ldw	(0x0f, sp), x
      00914D 1E 17            [ 2]  262 	ldw	x, (0x17, sp)
      00914F 13 11            [ 2]  263 	cpw	x, (0x11, sp)
      009151 7B 16            [ 1]  264 	ld	a, (0x16, sp)
      009153 12 10            [ 1]  265 	sbc	a, (0x10, sp)
      009155 7B 15            [ 1]  266 	ld	a, (0x15, sp)
      009157 12 0F            [ 1]  267 	sbc	a, (0x0f, sp)
      009159 25 06            [ 1]  268 	jrc	00102$
      00915B                        269 00101$:
      00915B 5F               [ 1]  270 	clrw	x
      00915C 5C               [ 1]  271 	incw	x
      00915D 90 5F            [ 1]  272 	clrw	y
      00915F 20 6E            [ 2]  273 	jra	00108$
      009161                        274 00102$:
                                    275 ;	../src/pff.c: 442: switch (fs->fs_type) {
      009161 90 F6            [ 1]  276 	ld	a, (y)
      009163 A1 03            [ 1]  277 	cp	a, #0x03
      009165 26 64            [ 1]  278 	jrne	00107$
                                    279 ;	../src/pff.c: 464: if (disk_readp(buf, fs->fatbase + clst / 128, ((UINT)clst % 128) * 4, 4)) break;
      009167 1E 17            [ 2]  280 	ldw	x, (0x17, sp)
      009169 9F               [ 1]  281 	ld	a, xl
      00916A A4 7F            [ 1]  282 	and	a, #0x7f
      00916C 97               [ 1]  283 	ld	xl, a
      00916D 4F               [ 1]  284 	clr	a
      00916E 95               [ 1]  285 	ld	xh, a
      00916F 58               [ 2]  286 	sllw	x
      009170 58               [ 2]  287 	sllw	x
      009171 1F 05            [ 2]  288 	ldw	(0x05, sp), x
      009173 93               [ 1]  289 	ldw	x, y
      009174 E6 0D            [ 1]  290 	ld	a, (0xd, x)
      009176 6B 0A            [ 1]  291 	ld	(0x0a, sp), a
      009178 E6 0C            [ 1]  292 	ld	a, (0xc, x)
      00917A EE 0A            [ 2]  293 	ldw	x, (0xa, x)
      00917C 1F 07            [ 2]  294 	ldw	(0x07, sp), x
      00917E 1E 17            [ 2]  295 	ldw	x, (0x17, sp)
      009180 16 15            [ 2]  296 	ldw	y, (0x15, sp)
      009182 88               [ 1]  297 	push	a
      009183 4F               [ 1]  298 	clr	a
      009184 90 01            [ 1]  299 	rrwa	y
      009186 01               [ 1]  300 	rrwa	x
      009187 48               [ 1]  301 	sll	a
      009188 59               [ 2]  302 	rlcw	x
      009189 90 59            [ 2]  303 	rlcw	y
      00918B 84               [ 1]  304 	pop	a
      00918C 1F 0D            [ 2]  305 	ldw	(0x0d, sp), x
      00918E 95               [ 1]  306 	ld	xh, a
      00918F 41               [ 1]  307 	exg	a, xl
      009190 7B 0A            [ 1]  308 	ld	a, (0x0a, sp)
      009192 41               [ 1]  309 	exg	a, xl
      009193 72 FB 0D         [ 2]  310 	addw	x, (0x0d, sp)
      009196 90 9F            [ 1]  311 	ld	a, yl
      009198 19 08            [ 1]  312 	adc	a, (0x08, sp)
      00919A 6B 10            [ 1]  313 	ld	(0x10, sp), a
      00919C 90 9E            [ 1]  314 	ld	a, yh
      00919E 19 07            [ 1]  315 	adc	a, (0x07, sp)
      0091A0 6B 0F            [ 1]  316 	ld	(0x0f, sp), a
      0091A2 4B 04            [ 1]  317 	push	#0x04
      0091A4 4B 00            [ 1]  318 	push	#0x00
      0091A6 16 07            [ 2]  319 	ldw	y, (0x07, sp)
      0091A8 90 89            [ 2]  320 	pushw	y
      0091AA 89               [ 2]  321 	pushw	x
      0091AB 1E 15            [ 2]  322 	ldw	x, (0x15, sp)
      0091AD 89               [ 2]  323 	pushw	x
      0091AE 96               [ 1]  324 	ldw	x, sp
      0091AF 1C 00 09         [ 2]  325 	addw	x, #9
      0091B2 89               [ 2]  326 	pushw	x
      0091B3 CD 82 8F         [ 4]  327 	call	_disk_readp
      0091B6 5B 0A            [ 2]  328 	addw	sp, #10
      0091B8 4D               [ 1]  329 	tnz	a
      0091B9 26 10            [ 1]  330 	jrne	00107$
                                    331 ;	../src/pff.c: 465: return ld_dword(buf) & 0x0FFFFFFF;
      0091BB 96               [ 1]  332 	ldw	x, sp
      0091BC 5C               [ 1]  333 	incw	x
      0091BD 89               [ 2]  334 	pushw	x
      0091BE CD 90 58         [ 4]  335 	call	_ld_dword
      0091C1 5B 02            [ 2]  336 	addw	sp, #2
      0091C3 90 9E            [ 1]  337 	ld	a, yh
      0091C5 A4 0F            [ 1]  338 	and	a, #0x0f
      0091C7 90 95            [ 1]  339 	ld	yh, a
      0091C9 20 04            [ 2]  340 	jra	00108$
                                    341 ;	../src/pff.c: 467: }
      0091CB                        342 00107$:
                                    343 ;	../src/pff.c: 469: return 1;	/* An error occured at the disk I/O layer */
      0091CB 5F               [ 1]  344 	clrw	x
      0091CC 5C               [ 1]  345 	incw	x
      0091CD 90 5F            [ 1]  346 	clrw	y
      0091CF                        347 00108$:
                                    348 ;	../src/pff.c: 470: }
      0091CF 5B 12            [ 2]  349 	addw	sp, #18
      0091D1 81               [ 4]  350 	ret
                                    351 ;	../src/pff.c: 479: static DWORD clust2sect (	/* !=0: Sector number, 0: Failed - invalid cluster# */
                                    352 ;	-----------------------------------------
                                    353 ;	 function clust2sect
                                    354 ;	-----------------------------------------
      0091D2                        355 _clust2sect:
      0091D2 52 08            [ 2]  356 	sub	sp, #8
                                    357 ;	../src/pff.c: 483: FATFS *fs = FatFs;
      0091D4 CE 02 67         [ 2]  358 	ldw	x, _FatFs+0
      0091D7 1F 07            [ 2]  359 	ldw	(0x07, sp), x
                                    360 ;	../src/pff.c: 486: clst -= 2;
      0091D9 1E 0D            [ 2]  361 	ldw	x, (0x0d, sp)
      0091DB 1D 00 02         [ 2]  362 	subw	x, #0x0002
      0091DE 16 0B            [ 2]  363 	ldw	y, (0x0b, sp)
      0091E0 24 02            [ 1]  364 	jrnc	00110$
      0091E2 90 5A            [ 2]  365 	decw	y
      0091E4                        366 00110$:
      0091E4 1F 0D            [ 2]  367 	ldw	(0x0d, sp), x
      0091E6 17 0B            [ 2]  368 	ldw	(0x0b, sp), y
                                    369 ;	../src/pff.c: 487: if (clst >= (fs->n_fatent - 2)) return 0;		/* Invalid cluster# */
      0091E8 1E 07            [ 2]  370 	ldw	x, (0x07, sp)
      0091EA 90 93            [ 1]  371 	ldw	y, x
      0091EC 90 EE 08         [ 2]  372 	ldw	y, (0x8, y)
      0091EF EE 06            [ 2]  373 	ldw	x, (0x6, x)
      0091F1 72 A2 00 02      [ 2]  374 	subw	y, #0x0002
      0091F5 17 05            [ 2]  375 	ldw	(0x05, sp), y
      0091F7 24 01            [ 1]  376 	jrnc	00111$
      0091F9 5A               [ 2]  377 	decw	x
      0091FA                        378 00111$:
      0091FA 1F 03            [ 2]  379 	ldw	(0x03, sp), x
      0091FC 1E 0D            [ 2]  380 	ldw	x, (0x0d, sp)
      0091FE 13 05            [ 2]  381 	cpw	x, (0x05, sp)
      009200 7B 0C            [ 1]  382 	ld	a, (0x0c, sp)
      009202 12 04            [ 1]  383 	sbc	a, (0x04, sp)
      009204 7B 0B            [ 1]  384 	ld	a, (0x0b, sp)
      009206 12 03            [ 1]  385 	sbc	a, (0x03, sp)
      009208 25 05            [ 1]  386 	jrc	00102$
      00920A 5F               [ 1]  387 	clrw	x
      00920B 90 5F            [ 1]  388 	clrw	y
      00920D 20 32            [ 2]  389 	jra	00103$
      00920F                        390 00102$:
                                    391 ;	../src/pff.c: 488: return (DWORD)clst * fs->csize + fs->database;
      00920F 1E 07            [ 2]  392 	ldw	x, (0x07, sp)
      009211 E6 02            [ 1]  393 	ld	a, (0x2, x)
      009213 5F               [ 1]  394 	clrw	x
      009214 97               [ 1]  395 	ld	xl, a
      009215 90 5F            [ 1]  396 	clrw	y
      009217 89               [ 2]  397 	pushw	x
      009218 90 89            [ 2]  398 	pushw	y
      00921A 1E 11            [ 2]  399 	ldw	x, (0x11, sp)
      00921C 89               [ 2]  400 	pushw	x
      00921D 1E 11            [ 2]  401 	ldw	x, (0x11, sp)
      00921F 89               [ 2]  402 	pushw	x
      009220 CD 9D E5         [ 4]  403 	call	__mullong
      009223 5B 08            [ 2]  404 	addw	sp, #8
      009225 1F 03            [ 2]  405 	ldw	(0x03, sp), x
      009227 17 01            [ 2]  406 	ldw	(0x01, sp), y
      009229 1E 07            [ 2]  407 	ldw	x, (0x07, sp)
      00922B 90 93            [ 1]  408 	ldw	y, x
      00922D 90 EE 14         [ 2]  409 	ldw	y, (0x14, y)
      009230 EE 12            [ 2]  410 	ldw	x, (0x12, x)
      009232 1F 05            [ 2]  411 	ldw	(0x05, sp), x
      009234 93               [ 1]  412 	ldw	x, y
      009235 72 FB 03         [ 2]  413 	addw	x, (0x03, sp)
      009238 16 05            [ 2]  414 	ldw	y, (0x05, sp)
      00923A 24 02            [ 1]  415 	jrnc	00113$
      00923C 90 5C            [ 1]  416 	incw	y
      00923E                        417 00113$:
      00923E 72 F9 01         [ 2]  418 	addw	y, (0x01, sp)
      009241                        419 00103$:
                                    420 ;	../src/pff.c: 489: }
      009241 5B 08            [ 2]  421 	addw	sp, #8
      009243 81               [ 4]  422 	ret
                                    423 ;	../src/pff.c: 492: static CLUST get_clust (
                                    424 ;	-----------------------------------------
                                    425 ;	 function get_clust
                                    426 ;	-----------------------------------------
      009244                        427 _get_clust:
      009244 52 04            [ 2]  428 	sub	sp, #4
                                    429 ;	../src/pff.c: 501: clst = ld_word(dir+DIR_FstClusHI);
      009246 1E 07            [ 2]  430 	ldw	x, (0x07, sp)
      009248 1C 00 14         [ 2]  431 	addw	x, #0x0014
      00924B 89               [ 2]  432 	pushw	x
      00924C CD 90 42         [ 4]  433 	call	_ld_word
      00924F 5B 02            [ 2]  434 	addw	sp, #2
      009251 51               [ 1]  435 	exgw	x, y
                                    436 ;	../src/pff.c: 502: clst <<= 16;
      009252 5F               [ 1]  437 	clrw	x
      009253 1F 03            [ 2]  438 	ldw	(0x03, sp), x
      009255 17 01            [ 2]  439 	ldw	(0x01, sp), y
                                    440 ;	../src/pff.c: 504: clst |= ld_word(dir+DIR_FstClusLO);
      009257 1E 07            [ 2]  441 	ldw	x, (0x07, sp)
      009259 1C 00 1A         [ 2]  442 	addw	x, #0x001a
      00925C 89               [ 2]  443 	pushw	x
      00925D CD 90 42         [ 4]  444 	call	_ld_word
      009260 5B 02            [ 2]  445 	addw	sp, #2
      009262 4F               [ 1]  446 	clr	a
      009263 90 5F            [ 1]  447 	clrw	y
      009265 1A 02            [ 1]  448 	or	a, (0x02, sp)
      009267 90 97            [ 1]  449 	ld	yl, a
      009269 9F               [ 1]  450 	ld	a, xl
      00926A 1A 04            [ 1]  451 	or	a, (0x04, sp)
      00926C 02               [ 1]  452 	rlwa	x
      00926D 1A 03            [ 1]  453 	or	a, (0x03, sp)
      00926F 95               [ 1]  454 	ld	xh, a
      009270 90 9E            [ 1]  455 	ld	a, yh
      009272 1A 01            [ 1]  456 	or	a, (0x01, sp)
                                    457 ;	../src/pff.c: 506: return clst;
      009274 90 95            [ 1]  458 	ld	yh, a
                                    459 ;	../src/pff.c: 507: }
      009276 5B 04            [ 2]  460 	addw	sp, #4
      009278 81               [ 4]  461 	ret
                                    462 ;	../src/pff.c: 514: static FRESULT dir_rewind (
                                    463 ;	-----------------------------------------
                                    464 ;	 function dir_rewind
                                    465 ;	-----------------------------------------
      009279                        466 _dir_rewind:
      009279 52 0C            [ 2]  467 	sub	sp, #12
                                    468 ;	../src/pff.c: 519: FATFS *fs = FatFs;
      00927B CE 02 67         [ 2]  469 	ldw	x, _FatFs+0
      00927E 1F 07            [ 2]  470 	ldw	(0x07, sp), x
                                    471 ;	../src/pff.c: 522: dj->index = 0;
      009280 16 0F            [ 2]  472 	ldw	y, (0x0f, sp)
      009282 17 05            [ 2]  473 	ldw	(0x05, sp), y
      009284 93               [ 1]  474 	ldw	x, y
      009285 6F 01            [ 1]  475 	clr	(0x1, x)
      009287 7F               [ 1]  476 	clr	(x)
                                    477 ;	../src/pff.c: 523: clst = dj->sclust;
      009288 1E 05            [ 2]  478 	ldw	x, (0x05, sp)
      00928A 90 93            [ 1]  479 	ldw	y, x
      00928C 90 EE 06         [ 2]  480 	ldw	y, (0x6, y)
      00928F EE 04            [ 2]  481 	ldw	x, (0x4, x)
      009291 17 0B            [ 2]  482 	ldw	(0x0b, sp), y
      009293 1F 09            [ 2]  483 	ldw	(0x09, sp), x
                                    484 ;	../src/pff.c: 524: if (clst == 1 || clst >= fs->n_fatent) {	/* Check start cluster range */
      009295 1E 0B            [ 2]  485 	ldw	x, (0x0b, sp)
      009297 5A               [ 2]  486 	decw	x
      009298 26 04            [ 1]  487 	jrne	00129$
      00929A 1E 09            [ 2]  488 	ldw	x, (0x09, sp)
      00929C 27 1B            [ 1]  489 	jreq	00101$
      00929E                        490 00129$:
      00929E 1E 07            [ 2]  491 	ldw	x, (0x07, sp)
      0092A0 90 93            [ 1]  492 	ldw	y, x
      0092A2 90 EE 08         [ 2]  493 	ldw	y, (0x8, y)
      0092A5 17 03            [ 2]  494 	ldw	(0x03, sp), y
      0092A7 EE 06            [ 2]  495 	ldw	x, (0x6, x)
      0092A9 1F 01            [ 2]  496 	ldw	(0x01, sp), x
      0092AB 1E 0B            [ 2]  497 	ldw	x, (0x0b, sp)
      0092AD 13 03            [ 2]  498 	cpw	x, (0x03, sp)
      0092AF 7B 0A            [ 1]  499 	ld	a, (0x0a, sp)
      0092B1 12 02            [ 1]  500 	sbc	a, (0x02, sp)
      0092B3 7B 09            [ 1]  501 	ld	a, (0x09, sp)
      0092B5 12 01            [ 1]  502 	sbc	a, (0x01, sp)
      0092B7 25 04            [ 1]  503 	jrc	00106$
      0092B9                        504 00101$:
                                    505 ;	../src/pff.c: 525: return FR_DISK_ERR;
      0092B9 A6 01            [ 1]  506 	ld	a, #0x01
      0092BB 20 3F            [ 2]  507 	jra	00109$
                                    508 ;	../src/pff.c: 527: if (PF_FS_FAT32 && !clst && (_FS_32ONLY || fs->fs_type == FS_FAT32)) {	/* Replace cluster# 0 with root cluster# if in FAT32 */
      0092BD                        509 00106$:
      0092BD 1E 0B            [ 2]  510 	ldw	x, (0x0b, sp)
      0092BF 26 11            [ 1]  511 	jrne	00105$
      0092C1 1E 09            [ 2]  512 	ldw	x, (0x09, sp)
      0092C3 26 0D            [ 1]  513 	jrne	00105$
                                    514 ;	../src/pff.c: 528: clst = (CLUST)fs->dirbase;
      0092C5 1E 07            [ 2]  515 	ldw	x, (0x07, sp)
      0092C7 90 93            [ 1]  516 	ldw	y, x
      0092C9 90 EE 10         [ 2]  517 	ldw	y, (0x10, y)
      0092CC 17 0B            [ 2]  518 	ldw	(0x0b, sp), y
      0092CE EE 0E            [ 2]  519 	ldw	x, (0xe, x)
      0092D0 1F 09            [ 2]  520 	ldw	(0x09, sp), x
      0092D2                        521 00105$:
                                    522 ;	../src/pff.c: 530: dj->clust = clst;						/* Current cluster */
      0092D2 1E 05            [ 2]  523 	ldw	x, (0x05, sp)
      0092D4 1C 00 08         [ 2]  524 	addw	x, #0x0008
      0092D7 16 0B            [ 2]  525 	ldw	y, (0x0b, sp)
      0092D9 EF 02            [ 2]  526 	ldw	(0x2, x), y
      0092DB 16 09            [ 2]  527 	ldw	y, (0x09, sp)
      0092DD FF               [ 2]  528 	ldw	(x), y
                                    529 ;	../src/pff.c: 531: dj->sect = (_FS_32ONLY || clst) ? clust2sect(clst) : fs->dirbase;	/* Current sector */
      0092DE 1E 05            [ 2]  530 	ldw	x, (0x05, sp)
      0092E0 1C 00 0C         [ 2]  531 	addw	x, #0x000c
      0092E3 1F 07            [ 2]  532 	ldw	(0x07, sp), x
      0092E5 1E 0B            [ 2]  533 	ldw	x, (0x0b, sp)
      0092E7 89               [ 2]  534 	pushw	x
      0092E8 1E 0B            [ 2]  535 	ldw	x, (0x0b, sp)
      0092EA 89               [ 2]  536 	pushw	x
      0092EB CD 91 D2         [ 4]  537 	call	_clust2sect
      0092EE 5B 04            [ 2]  538 	addw	sp, #4
      0092F0 17 09            [ 2]  539 	ldw	(0x09, sp), y
      0092F2 16 07            [ 2]  540 	ldw	y, (0x07, sp)
      0092F4 90 EF 02         [ 2]  541 	ldw	(0x2, y), x
      0092F7 1E 09            [ 2]  542 	ldw	x, (0x09, sp)
      0092F9 90 FF            [ 2]  543 	ldw	(y), x
                                    544 ;	../src/pff.c: 533: return FR_OK;	/* Seek succeeded */
      0092FB 4F               [ 1]  545 	clr	a
      0092FC                        546 00109$:
                                    547 ;	../src/pff.c: 534: }
      0092FC 5B 0C            [ 2]  548 	addw	sp, #12
      0092FE 81               [ 4]  549 	ret
                                    550 ;	../src/pff.c: 543: static FRESULT dir_next (	/* FR_OK:Succeeded, FR_NO_FILE:End of table */
                                    551 ;	-----------------------------------------
                                    552 ;	 function dir_next
                                    553 ;	-----------------------------------------
      0092FF                        554 _dir_next:
      0092FF 52 14            [ 2]  555 	sub	sp, #20
                                    556 ;	../src/pff.c: 549: FATFS *fs = FatFs;
      009301 CE 02 67         [ 2]  557 	ldw	x, _FatFs+0
      009304 1F 05            [ 2]  558 	ldw	(0x05, sp), x
                                    559 ;	../src/pff.c: 552: i = dj->index + 1;
      009306 16 17            [ 2]  560 	ldw	y, (0x17, sp)
      009308 17 07            [ 2]  561 	ldw	(0x07, sp), y
      00930A 93               [ 1]  562 	ldw	x, y
      00930B FE               [ 2]  563 	ldw	x, (x)
      00930C 5C               [ 1]  564 	incw	x
                                    565 ;	../src/pff.c: 553: if (!i || !dj->sect) return FR_NO_FILE;	/* Report EOT when index has reached 65535 */
      00930D 1F 09            [ 2]  566 	ldw	(0x09, sp), x
      00930F 27 19            [ 1]  567 	jreq	00101$
      009311 1E 07            [ 2]  568 	ldw	x, (0x07, sp)
      009313 1C 00 0C         [ 2]  569 	addw	x, #0x000c
      009316 1F 0B            [ 2]  570 	ldw	(0x0b, sp), x
      009318 90 93            [ 1]  571 	ldw	y, x
      00931A 90 EE 02         [ 2]  572 	ldw	y, (0x2, y)
      00931D 17 03            [ 2]  573 	ldw	(0x03, sp), y
      00931F FE               [ 2]  574 	ldw	x, (x)
      009320 1F 01            [ 2]  575 	ldw	(0x01, sp), x
      009322 1E 03            [ 2]  576 	ldw	x, (0x03, sp)
      009324 26 09            [ 1]  577 	jrne	00102$
      009326 1E 01            [ 2]  578 	ldw	x, (0x01, sp)
      009328 26 05            [ 1]  579 	jrne	00102$
      00932A                        580 00101$:
      00932A A6 03            [ 1]  581 	ld	a, #0x03
      00932C CC 94 05         [ 2]  582 	jp	00117$
      00932F                        583 00102$:
                                    584 ;	../src/pff.c: 555: if (!(i % 16)) {		/* Sector changed? */
      00932F 16 09            [ 2]  585 	ldw	y, (0x09, sp)
      009331 17 13            [ 2]  586 	ldw	(0x13, sp), y
      009333 7B 14            [ 1]  587 	ld	a, (0x14, sp)
      009335 A5 0F            [ 1]  588 	bcp	a, #0x0f
      009337 27 03            [ 1]  589 	jreq	00157$
      009339 CC 93 FF         [ 2]  590 	jp	00116$
      00933C                        591 00157$:
                                    592 ;	../src/pff.c: 556: dj->sect++;			/* Next sector */
      00933C 7B 04            [ 1]  593 	ld	a, (0x04, sp)
      00933E AB 01            [ 1]  594 	add	a, #0x01
      009340 88               [ 1]  595 	push	a
      009341 7B 04            [ 1]  596 	ld	a, (0x04, sp)
      009343 A9 00            [ 1]  597 	adc	a, #0x00
      009345 6B 12            [ 1]  598 	ld	(0x12, sp), a
      009347 16 02            [ 2]  599 	ldw	y, (0x02, sp)
      009349 24 02            [ 1]  600 	jrnc	00158$
      00934B 90 5C            [ 1]  601 	incw	y
      00934D                        602 00158$:
      00934D 84               [ 1]  603 	pop	a
      00934E 1E 0B            [ 2]  604 	ldw	x, (0x0b, sp)
      009350 E7 03            [ 1]  605 	ld	(0x3, x), a
      009352 7B 11            [ 1]  606 	ld	a, (0x11, sp)
      009354 E7 02            [ 1]  607 	ld	(0x2, x), a
      009356 FF               [ 2]  608 	ldw	(x), y
                                    609 ;	../src/pff.c: 558: if (dj->clust == 0) {	/* Static table */
      009357 1E 07            [ 2]  610 	ldw	x, (0x07, sp)
      009359 1C 00 08         [ 2]  611 	addw	x, #0x0008
      00935C 1F 0D            [ 2]  612 	ldw	(0x0d, sp), x
      00935E 90 93            [ 1]  613 	ldw	y, x
      009360 90 EE 02         [ 2]  614 	ldw	y, (0x2, y)
      009363 FE               [ 2]  615 	ldw	x, (x)
      009364 1F 0F            [ 2]  616 	ldw	(0x0f, sp), x
      009366 90 5D            [ 2]  617 	tnzw	y
      009368 26 18            [ 1]  618 	jrne	00113$
      00936A 1E 0F            [ 2]  619 	ldw	x, (0x0f, sp)
      00936C 26 14            [ 1]  620 	jrne	00113$
                                    621 ;	../src/pff.c: 559: if (i >= fs->n_rootdir) return FR_NO_FILE;	/* Report EOT when end of table */
      00936E 1E 05            [ 2]  622 	ldw	x, (0x05, sp)
      009370 EE 04            [ 2]  623 	ldw	x, (0x4, x)
      009372 1F 13            [ 2]  624 	ldw	(0x13, sp), x
      009374 1E 09            [ 2]  625 	ldw	x, (0x09, sp)
      009376 13 13            [ 2]  626 	cpw	x, (0x13, sp)
      009378 24 03            [ 1]  627 	jrnc	00161$
      00937A CC 93 FF         [ 2]  628 	jp	00116$
      00937D                        629 00161$:
      00937D A6 03            [ 1]  630 	ld	a, #0x03
      00937F CC 94 05         [ 2]  631 	jp	00117$
      009382                        632 00113$:
                                    633 ;	../src/pff.c: 562: if (((i / 16) & (fs->csize - 1)) == 0) {	/* Cluster changed? */
      009382 04 13            [ 1]  634 	srl	(0x13, sp)
      009384 06 14            [ 1]  635 	rrc	(0x14, sp)
      009386 04 13            [ 1]  636 	srl	(0x13, sp)
      009388 06 14            [ 1]  637 	rrc	(0x14, sp)
      00938A 04 13            [ 1]  638 	srl	(0x13, sp)
      00938C 06 14            [ 1]  639 	rrc	(0x14, sp)
      00938E 04 13            [ 1]  640 	srl	(0x13, sp)
      009390 06 14            [ 1]  641 	rrc	(0x14, sp)
      009392 1E 05            [ 2]  642 	ldw	x, (0x05, sp)
      009394 E6 02            [ 1]  643 	ld	a, (0x2, x)
      009396 5F               [ 1]  644 	clrw	x
      009397 97               [ 1]  645 	ld	xl, a
      009398 5A               [ 2]  646 	decw	x
      009399 9F               [ 1]  647 	ld	a, xl
      00939A 14 14            [ 1]  648 	and	a, (0x14, sp)
      00939C 02               [ 1]  649 	rlwa	x
      00939D 14 13            [ 1]  650 	and	a, (0x13, sp)
      00939F 95               [ 1]  651 	ld	xh, a
      0093A0 5D               [ 2]  652 	tnzw	x
      0093A1 26 5C            [ 1]  653 	jrne	00116$
                                    654 ;	../src/pff.c: 563: clst = get_fat(dj->clust);		/* Get next cluster */
      0093A3 90 89            [ 2]  655 	pushw	y
      0093A5 1E 11            [ 2]  656 	ldw	x, (0x11, sp)
      0093A7 89               [ 2]  657 	pushw	x
      0093A8 CD 91 2B         [ 4]  658 	call	_get_fat
      0093AB 5B 04            [ 2]  659 	addw	sp, #4
      0093AD 1F 13            [ 2]  660 	ldw	(0x13, sp), x
      0093AF 17 11            [ 2]  661 	ldw	(0x11, sp), y
                                    662 ;	../src/pff.c: 564: if (clst <= 1) return FR_DISK_ERR;
      0093B1 5F               [ 1]  663 	clrw	x
      0093B2 5C               [ 1]  664 	incw	x
      0093B3 13 13            [ 2]  665 	cpw	x, (0x13, sp)
      0093B5 4F               [ 1]  666 	clr	a
      0093B6 12 12            [ 1]  667 	sbc	a, (0x12, sp)
      0093B8 4F               [ 1]  668 	clr	a
      0093B9 12 11            [ 1]  669 	sbc	a, (0x11, sp)
      0093BB 25 04            [ 1]  670 	jrc	00107$
      0093BD A6 01            [ 1]  671 	ld	a, #0x01
      0093BF 20 44            [ 2]  672 	jra	00117$
      0093C1                        673 00107$:
                                    674 ;	../src/pff.c: 565: if (clst >= fs->n_fatent) return FR_NO_FILE;	/* Report EOT when it reached end of dynamic table */
      0093C1 1E 05            [ 2]  675 	ldw	x, (0x05, sp)
      0093C3 90 93            [ 1]  676 	ldw	y, x
      0093C5 90 EE 08         [ 2]  677 	ldw	y, (0x8, y)
      0093C8 17 05            [ 2]  678 	ldw	(0x05, sp), y
      0093CA EE 06            [ 2]  679 	ldw	x, (0x6, x)
      0093CC 1F 03            [ 2]  680 	ldw	(0x03, sp), x
      0093CE 1E 13            [ 2]  681 	ldw	x, (0x13, sp)
      0093D0 13 05            [ 2]  682 	cpw	x, (0x05, sp)
      0093D2 7B 12            [ 1]  683 	ld	a, (0x12, sp)
      0093D4 12 04            [ 1]  684 	sbc	a, (0x04, sp)
      0093D6 7B 11            [ 1]  685 	ld	a, (0x11, sp)
      0093D8 12 03            [ 1]  686 	sbc	a, (0x03, sp)
      0093DA 25 04            [ 1]  687 	jrc	00109$
      0093DC A6 03            [ 1]  688 	ld	a, #0x03
      0093DE 20 25            [ 2]  689 	jra	00117$
      0093E0                        690 00109$:
                                    691 ;	../src/pff.c: 566: dj->clust = clst;				/* Initialize data for new cluster */
      0093E0 1E 0D            [ 2]  692 	ldw	x, (0x0d, sp)
      0093E2 16 13            [ 2]  693 	ldw	y, (0x13, sp)
      0093E4 EF 02            [ 2]  694 	ldw	(0x2, x), y
      0093E6 16 11            [ 2]  695 	ldw	y, (0x11, sp)
      0093E8 FF               [ 2]  696 	ldw	(x), y
                                    697 ;	../src/pff.c: 567: dj->sect = clust2sect(clst);
      0093E9 1E 13            [ 2]  698 	ldw	x, (0x13, sp)
      0093EB 89               [ 2]  699 	pushw	x
      0093EC 1E 13            [ 2]  700 	ldw	x, (0x13, sp)
      0093EE 89               [ 2]  701 	pushw	x
      0093EF CD 91 D2         [ 4]  702 	call	_clust2sect
      0093F2 5B 04            [ 2]  703 	addw	sp, #4
      0093F4 17 11            [ 2]  704 	ldw	(0x11, sp), y
      0093F6 16 0B            [ 2]  705 	ldw	y, (0x0b, sp)
      0093F8 90 EF 02         [ 2]  706 	ldw	(0x2, y), x
      0093FB 1E 11            [ 2]  707 	ldw	x, (0x11, sp)
      0093FD 90 FF            [ 2]  708 	ldw	(y), x
      0093FF                        709 00116$:
                                    710 ;	../src/pff.c: 572: dj->index = i;
      0093FF 1E 07            [ 2]  711 	ldw	x, (0x07, sp)
      009401 16 09            [ 2]  712 	ldw	y, (0x09, sp)
      009403 FF               [ 2]  713 	ldw	(x), y
                                    714 ;	../src/pff.c: 574: return FR_OK;
      009404 4F               [ 1]  715 	clr	a
      009405                        716 00117$:
                                    717 ;	../src/pff.c: 575: }
      009405 5B 14            [ 2]  718 	addw	sp, #20
      009407 81               [ 4]  719 	ret
                                    720 ;	../src/pff.c: 584: static FRESULT dir_find (
                                    721 ;	-----------------------------------------
                                    722 ;	 function dir_find
                                    723 ;	-----------------------------------------
      009408                        724 _dir_find:
      009408 52 07            [ 2]  725 	sub	sp, #7
                                    726 ;	../src/pff.c: 593: res = dir_rewind(dj);			/* Rewind directory object */
      00940A 1E 0A            [ 2]  727 	ldw	x, (0x0a, sp)
      00940C 89               [ 2]  728 	pushw	x
      00940D CD 92 79         [ 4]  729 	call	_dir_rewind
      009410 85               [ 2]  730 	popw	x
                                    731 ;	../src/pff.c: 594: if (res != FR_OK) return res;
      009411 4D               [ 1]  732 	tnz	a
                                    733 ;	../src/pff.c: 596: do {
      009412 26 72            [ 1]  734 	jrne	00113$
      009414 16 0A            [ 2]  735 	ldw	y, (0x0a, sp)
      009416 17 03            [ 2]  736 	ldw	(0x03, sp), y
      009418 17 05            [ 2]  737 	ldw	(0x05, sp), y
      00941A                        738 00110$:
                                    739 ;	../src/pff.c: 597: res = disk_readp(dir, dj->sect, (dj->index % 16) * 32, 32)	/* Read an entry */
      00941A 1E 03            [ 2]  740 	ldw	x, (0x03, sp)
      00941C FE               [ 2]  741 	ldw	x, (x)
      00941D 9F               [ 1]  742 	ld	a, xl
      00941E A4 0F            [ 1]  743 	and	a, #0x0f
      009420 97               [ 1]  744 	ld	xl, a
      009421 4F               [ 1]  745 	clr	a
      009422 95               [ 1]  746 	ld	xh, a
      009423 58               [ 2]  747 	sllw	x
      009424 58               [ 2]  748 	sllw	x
      009425 58               [ 2]  749 	sllw	x
      009426 58               [ 2]  750 	sllw	x
      009427 58               [ 2]  751 	sllw	x
      009428 1F 01            [ 2]  752 	ldw	(0x01, sp), x
      00942A 1E 05            [ 2]  753 	ldw	x, (0x05, sp)
      00942C 90 93            [ 1]  754 	ldw	y, x
      00942E 90 EE 0E         [ 2]  755 	ldw	y, (0xe, y)
      009431 EE 0C            [ 2]  756 	ldw	x, (0xc, x)
      009433 4B 20            [ 1]  757 	push	#0x20
      009435 4B 00            [ 1]  758 	push	#0x00
      009437 7B 04            [ 1]  759 	ld	a, (0x04, sp)
      009439 88               [ 1]  760 	push	a
      00943A 7B 04            [ 1]  761 	ld	a, (0x04, sp)
      00943C 88               [ 1]  762 	push	a
      00943D 90 89            [ 2]  763 	pushw	y
      00943F 89               [ 2]  764 	pushw	x
      009440 1E 14            [ 2]  765 	ldw	x, (0x14, sp)
      009442 89               [ 2]  766 	pushw	x
      009443 CD 82 8F         [ 4]  767 	call	_disk_readp
      009446 5B 0A            [ 2]  768 	addw	sp, #10
      009448 4D               [ 1]  769 	tnz	a
      009449 27 03            [ 1]  770 	jreq	00115$
                                    771 ;	../src/pff.c: 598: ? FR_DISK_ERR : FR_OK;
      00944B A6 01            [ 1]  772 	ld	a, #0x01
      00944D 21                     773 	.byte 0x21
      00944E                        774 00115$:
      00944E 4F               [ 1]  775 	clr	a
      00944F                        776 00116$:
                                    777 ;	../src/pff.c: 599: if (res != FR_OK) break;
      00944F 6B 07            [ 1]  778 	ld	(0x07, sp), a
      009451 26 31            [ 1]  779 	jrne	00112$
                                    780 ;	../src/pff.c: 600: c = dir[DIR_Name];	/* First character */
      009453 1E 0C            [ 2]  781 	ldw	x, (0x0c, sp)
                                    782 ;	../src/pff.c: 601: if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
      009455 F6               [ 1]  783 	ld	a, (x)
      009456 26 06            [ 1]  784 	jrne	00106$
      009458 A6 03            [ 1]  785 	ld	a, #0x03
      00945A 6B 07            [ 1]  786 	ld	(0x07, sp), a
      00945C 20 26            [ 2]  787 	jra	00112$
      00945E                        788 00106$:
                                    789 ;	../src/pff.c: 602: if (!(dir[DIR_Attr] & AM_VOL) && !mem_cmp(dir, dj->fn, 11)) break;	/* Is it a valid entry? */
      00945E E6 0B            [ 1]  790 	ld	a, (0xb, x)
      009460 A5 08            [ 1]  791 	bcp	a, #0x08
      009462 26 15            [ 1]  792 	jrne	00108$
      009464 1E 03            [ 2]  793 	ldw	x, (0x03, sp)
      009466 EE 02            [ 2]  794 	ldw	x, (0x2, x)
      009468 16 0C            [ 2]  795 	ldw	y, (0x0c, sp)
      00946A 4B 0B            [ 1]  796 	push	#0x0b
      00946C 4B 00            [ 1]  797 	push	#0x00
      00946E 89               [ 2]  798 	pushw	x
      00946F 90 89            [ 2]  799 	pushw	y
      009471 CD 90 E7         [ 4]  800 	call	_mem_cmp
      009474 5B 06            [ 2]  801 	addw	sp, #6
      009476 5D               [ 2]  802 	tnzw	x
      009477 27 0B            [ 1]  803 	jreq	00112$
      009479                        804 00108$:
                                    805 ;	../src/pff.c: 603: res = dir_next(dj);					/* Next entry */
      009479 1E 03            [ 2]  806 	ldw	x, (0x03, sp)
      00947B 89               [ 2]  807 	pushw	x
      00947C CD 92 FF         [ 4]  808 	call	_dir_next
      00947F 85               [ 2]  809 	popw	x
                                    810 ;	../src/pff.c: 604: } while (res == FR_OK);
      009480 6B 07            [ 1]  811 	ld	(0x07, sp), a
      009482 27 96            [ 1]  812 	jreq	00110$
      009484                        813 00112$:
                                    814 ;	../src/pff.c: 606: return res;
      009484 7B 07            [ 1]  815 	ld	a, (0x07, sp)
      009486                        816 00113$:
                                    817 ;	../src/pff.c: 607: }
      009486 5B 07            [ 2]  818 	addw	sp, #7
      009488 81               [ 4]  819 	ret
                                    820 ;	../src/pff.c: 651: static FRESULT create_name (
                                    821 ;	-----------------------------------------
                                    822 ;	 function create_name
                                    823 ;	-----------------------------------------
      009489                        824 _create_name:
      009489 52 09            [ 2]  825 	sub	sp, #9
                                    826 ;	../src/pff.c: 663: sfn = dj->fn;
      00948B 1E 0C            [ 2]  827 	ldw	x, (0x0c, sp)
      00948D EE 02            [ 2]  828 	ldw	x, (0x2, x)
                                    829 ;	../src/pff.c: 664: mem_set(sfn, ' ', 11);
      00948F 1F 01            [ 2]  830 	ldw	(0x01, sp), x
      009491 4B 0B            [ 1]  831 	push	#0x0b
      009493 4B 00            [ 1]  832 	push	#0x00
      009495 4B 20            [ 1]  833 	push	#0x20
      009497 4B 00            [ 1]  834 	push	#0x00
      009499 89               [ 2]  835 	pushw	x
      00949A CD 90 CC         [ 4]  836 	call	_mem_set
      00949D 5B 06            [ 2]  837 	addw	sp, #6
                                    838 ;	../src/pff.c: 665: si = i = 0; ni = 8;
      00949F 0F 08            [ 1]  839 	clr	(0x08, sp)
      0094A1 A6 08            [ 1]  840 	ld	a, #0x08
      0094A3 6B 03            [ 1]  841 	ld	(0x03, sp), a
                                    842 ;	../src/pff.c: 666: p = *path;
      0094A5 16 0E            [ 2]  843 	ldw	y, (0x0e, sp)
      0094A7 93               [ 1]  844 	ldw	x, y
      0094A8 FE               [ 2]  845 	ldw	x, (x)
      0094A9 1F 04            [ 2]  846 	ldw	(0x04, sp), x
      0094AB 0F 09            [ 1]  847 	clr	(0x09, sp)
      0094AD                        848 00120$:
                                    849 ;	../src/pff.c: 668: c = p[si++];
      0094AD 5F               [ 1]  850 	clrw	x
      0094AE 7B 09            [ 1]  851 	ld	a, (0x09, sp)
      0094B0 97               [ 1]  852 	ld	xl, a
      0094B1 72 FB 04         [ 2]  853 	addw	x, (0x04, sp)
      0094B4 0C 09            [ 1]  854 	inc	(0x09, sp)
      0094B6 F6               [ 1]  855 	ld	a, (x)
                                    856 ;	../src/pff.c: 669: if (c <= ' ' || c == '/') break;	/* Break on end of segment */
      0094B7 6B 06            [ 1]  857 	ld	(0x06, sp), a
      0094B9 A1 20            [ 1]  858 	cp	a, #0x20
      0094BB 22 04            [ 1]  859 	jrugt	00161$
      0094BD 0F 07            [ 1]  860 	clr	(0x07, sp)
      0094BF 20 04            [ 2]  861 	jra	00162$
      0094C1                        862 00161$:
      0094C1 A6 01            [ 1]  863 	ld	a, #0x01
      0094C3 6B 07            [ 1]  864 	ld	(0x07, sp), a
      0094C5                        865 00162$:
      0094C5 0D 07            [ 1]  866 	tnz	(0x07, sp)
      0094C7 27 3D            [ 1]  867 	jreq	00119$
      0094C9 7B 06            [ 1]  868 	ld	a, (0x06, sp)
      0094CB A1 2F            [ 1]  869 	cp	a, #0x2f
      0094CD 27 37            [ 1]  870 	jreq	00119$
                                    871 ;	../src/pff.c: 670: if (c == '.' || i >= ni) {
      0094CF 7B 06            [ 1]  872 	ld	a, (0x06, sp)
      0094D1 A0 2E            [ 1]  873 	sub	a, #0x2e
      0094D3 26 02            [ 1]  874 	jrne	00168$
      0094D5 4C               [ 1]  875 	inc	a
      0094D6 21                     876 	.byte 0x21
      0094D7                        877 00168$:
      0094D7 4F               [ 1]  878 	clr	a
      0094D8                        879 00169$:
      0094D8 4D               [ 1]  880 	tnz	a
      0094D9 26 08            [ 1]  881 	jrne	00107$
      0094DB 88               [ 1]  882 	push	a
      0094DC 7B 09            [ 1]  883 	ld	a, (0x09, sp)
      0094DE 11 04            [ 1]  884 	cp	a, (0x04, sp)
      0094E0 84               [ 1]  885 	pop	a
      0094E1 25 15            [ 1]  886 	jrc	00111$
      0094E3                        887 00107$:
                                    888 ;	../src/pff.c: 671: if (ni != 8 || c != '.') break;
      0094E3 88               [ 1]  889 	push	a
      0094E4 7B 04            [ 1]  890 	ld	a, (0x04, sp)
      0094E6 A1 08            [ 1]  891 	cp	a, #0x08
      0094E8 84               [ 1]  892 	pop	a
      0094E9 26 1B            [ 1]  893 	jrne	00119$
      0094EB 4D               [ 1]  894 	tnz	a
      0094EC 27 18            [ 1]  895 	jreq	00119$
                                    896 ;	../src/pff.c: 672: i = 8; ni = 11;
      0094EE A6 08            [ 1]  897 	ld	a, #0x08
      0094F0 6B 08            [ 1]  898 	ld	(0x08, sp), a
      0094F2 A6 0B            [ 1]  899 	ld	a, #0x0b
      0094F4 6B 03            [ 1]  900 	ld	(0x03, sp), a
                                    901 ;	../src/pff.c: 673: continue;
      0094F6 20 B5            [ 2]  902 	jra	00120$
                                    903 ;	../src/pff.c: 683: if (PF_USE_LCC && IsLower(c)) c -= 0x20;	/* toupper */
      0094F8                        904 00111$:
                                    905 ;	../src/pff.c: 684: sfn[i++] = c;
      0094F8 7B 08            [ 1]  906 	ld	a, (0x08, sp)
      0094FA 0C 08            [ 1]  907 	inc	(0x08, sp)
      0094FC 5F               [ 1]  908 	clrw	x
      0094FD 97               [ 1]  909 	ld	xl, a
      0094FE 72 FB 01         [ 2]  910 	addw	x, (0x01, sp)
      009501 7B 06            [ 1]  911 	ld	a, (0x06, sp)
      009503 F7               [ 1]  912 	ld	(x), a
      009504 20 A7            [ 2]  913 	jra	00120$
      009506                        914 00119$:
                                    915 ;	../src/pff.c: 687: *path = &p[si];						/* Rerurn pointer to the next segment */
      009506 5F               [ 1]  916 	clrw	x
      009507 7B 09            [ 1]  917 	ld	a, (0x09, sp)
      009509 97               [ 1]  918 	ld	xl, a
      00950A 72 FB 04         [ 2]  919 	addw	x, (0x04, sp)
      00950D 90 FF            [ 2]  920 	ldw	(y), x
                                    921 ;	../src/pff.c: 689: sfn[11] = (c <= ' ') ? 1 : 0;		/* Set last segment flag if end of path */
      00950F 16 01            [ 2]  922 	ldw	y, (0x01, sp)
      009511 72 A9 00 0B      [ 2]  923 	addw	y, #0x000b
      009515 0D 07            [ 1]  924 	tnz	(0x07, sp)
      009517 26 03            [ 1]  925 	jrne	00123$
      009519 5F               [ 1]  926 	clrw	x
      00951A 5C               [ 1]  927 	incw	x
      00951B 21                     928 	.byte 0x21
      00951C                        929 00123$:
      00951C 5F               [ 1]  930 	clrw	x
      00951D                        931 00124$:
      00951D 9F               [ 1]  932 	ld	a, xl
      00951E 90 F7            [ 1]  933 	ld	(y), a
                                    934 ;	../src/pff.c: 691: return FR_OK;
      009520 4F               [ 1]  935 	clr	a
                                    936 ;	../src/pff.c: 692: }
      009521 5B 09            [ 2]  937 	addw	sp, #9
      009523 81               [ 4]  938 	ret
                                    939 ;	../src/pff.c: 742: static FRESULT follow_path (	/* FR_OK(0): successful, !=0: error code */
                                    940 ;	-----------------------------------------
                                    941 ;	 function follow_path
                                    942 ;	-----------------------------------------
      009524                        943 _follow_path:
      009524 52 0E            [ 2]  944 	sub	sp, #14
                                    945 ;	../src/pff.c: 751: while (*path == ' ') path++;		/* Strip leading spaces */
      009526 16 15            [ 2]  946 	ldw	y, (0x15, sp)
      009528                        947 00101$:
      009528 90 F6            [ 1]  948 	ld	a, (y)
      00952A 93               [ 1]  949 	ldw	x, y
      00952B 5C               [ 1]  950 	incw	x
      00952C A1 20            [ 1]  951 	cp	a, #0x20
      00952E 26 06            [ 1]  952 	jrne	00131$
      009530 90 93            [ 1]  953 	ldw	y, x
      009532 1F 15            [ 2]  954 	ldw	(0x15, sp), x
      009534 20 F2            [ 2]  955 	jra	00101$
      009536                        956 00131$:
      009536 17 15            [ 2]  957 	ldw	(0x15, sp), y
                                    958 ;	../src/pff.c: 752: if (*path == '/') path++;			/* Strip heading separator if exist */
      009538 A1 2F            [ 1]  959 	cp	a, #0x2f
      00953A 26 02            [ 1]  960 	jrne	00105$
      00953C 1F 15            [ 2]  961 	ldw	(0x15, sp), x
      00953E                        962 00105$:
                                    963 ;	../src/pff.c: 753: dj->sclust = 0;						/* Set start directory (always root dir) */
      00953E 16 11            [ 2]  964 	ldw	y, (0x11, sp)
      009540 17 01            [ 2]  965 	ldw	(0x01, sp), y
      009542 93               [ 1]  966 	ldw	x, y
      009543 1C 00 04         [ 2]  967 	addw	x, #0x0004
      009546 90 5F            [ 1]  968 	clrw	y
      009548 EF 02            [ 2]  969 	ldw	(0x2, x), y
      00954A FF               [ 2]  970 	ldw	(x), y
                                    971 ;	../src/pff.c: 755: if ((BYTE)*path < ' ') {			/* Null path means the root directory */
      00954B 1E 15            [ 2]  972 	ldw	x, (0x15, sp)
      00954D F6               [ 1]  973 	ld	a, (x)
      00954E A1 20            [ 1]  974 	cp	a, #0x20
      009550 24 0E            [ 1]  975 	jrnc	00130$
                                    976 ;	../src/pff.c: 756: res = dir_rewind(dj);
      009552 1E 01            [ 2]  977 	ldw	x, (0x01, sp)
      009554 89               [ 2]  978 	pushw	x
      009555 CD 92 79         [ 4]  979 	call	_dir_rewind
      009558 85               [ 2]  980 	popw	x
      009559 6B 0E            [ 1]  981 	ld	(0x0e, sp), a
                                    982 ;	../src/pff.c: 757: dir[0] = 0;
      00955B 1E 13            [ 2]  983 	ldw	x, (0x13, sp)
      00955D 7F               [ 1]  984 	clr	(x)
      00955E 20 5E            [ 2]  985 	jra	00117$
      009560                        986 00130$:
      009560 16 01            [ 2]  987 	ldw	y, (0x01, sp)
      009562 17 03            [ 2]  988 	ldw	(0x03, sp), y
      009564 16 13            [ 2]  989 	ldw	y, (0x13, sp)
      009566 17 05            [ 2]  990 	ldw	(0x05, sp), y
      009568 16 01            [ 2]  991 	ldw	y, (0x01, sp)
      00956A 17 07            [ 2]  992 	ldw	(0x07, sp), y
      00956C                        993 00118$:
                                    994 ;	../src/pff.c: 761: res = create_name(dj, &path);	/* Get a segment */
      00956C 96               [ 1]  995 	ldw	x, sp
      00956D 1C 00 15         [ 2]  996 	addw	x, #21
      009570 89               [ 2]  997 	pushw	x
      009571 1E 03            [ 2]  998 	ldw	x, (0x03, sp)
      009573 89               [ 2]  999 	pushw	x
      009574 CD 94 89         [ 4] 1000 	call	_create_name
      009577 5B 04            [ 2] 1001 	addw	sp, #4
                                   1002 ;	../src/pff.c: 762: if (res != FR_OK) break;
      009579 6B 0E            [ 1] 1003 	ld	(0x0e, sp), a
      00957B 26 41            [ 1] 1004 	jrne	00117$
                                   1005 ;	../src/pff.c: 763: res = dir_find(dj, dir);		/* Find it */
      00957D 1E 13            [ 2] 1006 	ldw	x, (0x13, sp)
      00957F 89               [ 2] 1007 	pushw	x
      009580 1E 03            [ 2] 1008 	ldw	x, (0x03, sp)
      009582 89               [ 2] 1009 	pushw	x
      009583 CD 94 08         [ 4] 1010 	call	_dir_find
      009586 5B 04            [ 2] 1011 	addw	sp, #4
                                   1012 ;	../src/pff.c: 764: if (res != FR_OK) break;		/* Could not find the object */
      009588 6B 0E            [ 1] 1013 	ld	(0x0e, sp), a
      00958A 26 32            [ 1] 1014 	jrne	00117$
                                   1015 ;	../src/pff.c: 765: if (dj->fn[11]) break;			/* Last segment match. Function completed. */
      00958C 1E 03            [ 2] 1016 	ldw	x, (0x03, sp)
      00958E EE 02            [ 2] 1017 	ldw	x, (0x2, x)
      009590 E6 0B            [ 1] 1018 	ld	a, (0xb, x)
      009592 26 2A            [ 1] 1019 	jrne	00117$
                                   1020 ;	../src/pff.c: 766: if (!(dir[DIR_Attr] & AM_DIR)) { /* Cannot follow path because it is a file */
      009594 1E 05            [ 2] 1021 	ldw	x, (0x05, sp)
      009596 E6 0B            [ 1] 1022 	ld	a, (0xb, x)
      009598 A5 10            [ 1] 1023 	bcp	a, #0x10
      00959A 26 06            [ 1] 1024 	jrne	00113$
                                   1025 ;	../src/pff.c: 767: res = FR_NO_FILE; break;
      00959C A6 03            [ 1] 1026 	ld	a, #0x03
      00959E 6B 0E            [ 1] 1027 	ld	(0x0e, sp), a
      0095A0 20 1C            [ 2] 1028 	jra	00117$
      0095A2                       1029 00113$:
                                   1030 ;	../src/pff.c: 769: dj->sclust = get_clust(dir);	/* Follow next */
      0095A2 1E 07            [ 2] 1031 	ldw	x, (0x07, sp)
      0095A4 1C 00 04         [ 2] 1032 	addw	x, #0x0004
      0095A7 1F 09            [ 2] 1033 	ldw	(0x09, sp), x
      0095A9 1E 13            [ 2] 1034 	ldw	x, (0x13, sp)
      0095AB 89               [ 2] 1035 	pushw	x
      0095AC CD 92 44         [ 4] 1036 	call	_get_clust
      0095AF 5B 02            [ 2] 1037 	addw	sp, #2
      0095B1 17 0B            [ 2] 1038 	ldw	(0x0b, sp), y
      0095B3 16 09            [ 2] 1039 	ldw	y, (0x09, sp)
      0095B5 90 EF 02         [ 2] 1040 	ldw	(0x2, y), x
      0095B8 1E 0B            [ 2] 1041 	ldw	x, (0x0b, sp)
      0095BA 90 FF            [ 2] 1042 	ldw	(y), x
      0095BC 20 AE            [ 2] 1043 	jra	00118$
      0095BE                       1044 00117$:
                                   1045 ;	../src/pff.c: 773: return res;
      0095BE 7B 0E            [ 1] 1046 	ld	a, (0x0e, sp)
                                   1047 ;	../src/pff.c: 774: }
      0095C0 5B 0E            [ 2] 1048 	addw	sp, #14
      0095C2 81               [ 4] 1049 	ret
                                   1050 ;	../src/pff.c: 783: static BYTE check_fs (	/* 0:The FAT boot record, 1:Valid boot record but not an FAT, 2:Not a boot record, 3:Error */
                                   1051 ;	-----------------------------------------
                                   1052 ;	 function check_fs
                                   1053 ;	-----------------------------------------
      0095C3                       1054 _check_fs:
                                   1055 ;	../src/pff.c: 788: if (disk_readp(buf, sect, 510, 2)) {	/* Read the boot record */
      0095C3 4B 02            [ 1] 1056 	push	#0x02
      0095C5 4B 00            [ 1] 1057 	push	#0x00
      0095C7 4B FE            [ 1] 1058 	push	#0xfe
      0095C9 4B 01            [ 1] 1059 	push	#0x01
      0095CB 1E 0B            [ 2] 1060 	ldw	x, (0x0b, sp)
      0095CD 89               [ 2] 1061 	pushw	x
      0095CE 1E 0B            [ 2] 1062 	ldw	x, (0x0b, sp)
      0095D0 89               [ 2] 1063 	pushw	x
      0095D1 1E 0B            [ 2] 1064 	ldw	x, (0x0b, sp)
      0095D3 89               [ 2] 1065 	pushw	x
      0095D4 CD 82 8F         [ 4] 1066 	call	_disk_readp
      0095D7 5B 0A            [ 2] 1067 	addw	sp, #10
      0095D9 4D               [ 1] 1068 	tnz	a
      0095DA 27 03            [ 1] 1069 	jreq	00102$
                                   1070 ;	../src/pff.c: 789: return 3;
      0095DC A6 03            [ 1] 1071 	ld	a, #0x03
      0095DE 81               [ 4] 1072 	ret
      0095DF                       1073 00102$:
                                   1074 ;	../src/pff.c: 791: if (ld_word(buf) != 0xAA55) {			/* Check record signature */
      0095DF 1E 03            [ 2] 1075 	ldw	x, (0x03, sp)
      0095E1 89               [ 2] 1076 	pushw	x
      0095E2 CD 90 42         [ 4] 1077 	call	_ld_word
      0095E5 5B 02            [ 2] 1078 	addw	sp, #2
      0095E7 A3 AA 55         [ 2] 1079 	cpw	x, #0xaa55
      0095EA 27 03            [ 1] 1080 	jreq	00111$
                                   1081 ;	../src/pff.c: 792: return 2;
      0095EC A6 02            [ 1] 1082 	ld	a, #0x02
      0095EE 81               [ 4] 1083 	ret
                                   1084 ;	../src/pff.c: 798: if (PF_FS_FAT32 && !disk_readp(buf, sect, BS_FilSysType32, 2) && ld_word(buf) == 0x4146) {	/* Check FAT32 */
      0095EF                       1085 00111$:
      0095EF 4B 02            [ 1] 1086 	push	#0x02
      0095F1 4B 00            [ 1] 1087 	push	#0x00
      0095F3 4B 52            [ 1] 1088 	push	#0x52
      0095F5 4B 00            [ 1] 1089 	push	#0x00
      0095F7 1E 0B            [ 2] 1090 	ldw	x, (0x0b, sp)
      0095F9 89               [ 2] 1091 	pushw	x
      0095FA 1E 0B            [ 2] 1092 	ldw	x, (0x0b, sp)
      0095FC 89               [ 2] 1093 	pushw	x
      0095FD 1E 0B            [ 2] 1094 	ldw	x, (0x0b, sp)
      0095FF 89               [ 2] 1095 	pushw	x
      009600 CD 82 8F         [ 4] 1096 	call	_disk_readp
      009603 5B 0A            [ 2] 1097 	addw	sp, #10
      009605 4D               [ 1] 1098 	tnz	a
      009606 26 0F            [ 1] 1099 	jrne	00110$
      009608 1E 03            [ 2] 1100 	ldw	x, (0x03, sp)
      00960A 89               [ 2] 1101 	pushw	x
      00960B CD 90 42         [ 4] 1102 	call	_ld_word
      00960E 5B 02            [ 2] 1103 	addw	sp, #2
      009610 A3 41 46         [ 2] 1104 	cpw	x, #0x4146
      009613 26 02            [ 1] 1105 	jrne	00110$
                                   1106 ;	../src/pff.c: 799: return 0;
      009615 4F               [ 1] 1107 	clr	a
      009616 81               [ 4] 1108 	ret
      009617                       1109 00110$:
                                   1110 ;	../src/pff.c: 801: return 1;
      009617 A6 01            [ 1] 1111 	ld	a, #0x01
                                   1112 ;	../src/pff.c: 802: }
      009619 81               [ 4] 1113 	ret
                                   1114 ;	../src/pff.c: 819: FRESULT pf_mount (
                                   1115 ;	-----------------------------------------
                                   1116 ;	 function pf_mount
                                   1117 ;	-----------------------------------------
      00961A                       1118 _pf_mount:
      00961A 52 3C            [ 2] 1119 	sub	sp, #60
                                   1120 ;	../src/pff.c: 827: FatFs = 0;
      00961C 5F               [ 1] 1121 	clrw	x
      00961D CF 02 67         [ 2] 1122 	ldw	_FatFs+0, x
                                   1123 ;	../src/pff.c: 829: if (disk_initialize() & STA_NOINIT) {	/* Check if the drive is ready or not */
      009620 CD 82 7B         [ 4] 1124 	call	_disk_initialize
      009623 44               [ 1] 1125 	srl	a
      009624 24 05            [ 1] 1126 	jrnc	00102$
                                   1127 ;	../src/pff.c: 830: return FR_NOT_READY;
      009626 A6 02            [ 1] 1128 	ld	a, #0x02
      009628 CC 98 65         [ 2] 1129 	jp	00137$
      00962B                       1130 00102$:
                                   1131 ;	../src/pff.c: 834: bsect = 0;
      00962B 5F               [ 1] 1132 	clrw	x
      00962C 1F 33            [ 2] 1133 	ldw	(0x33, sp), x
      00962E 1F 31            [ 2] 1134 	ldw	(0x31, sp), x
                                   1135 ;	../src/pff.c: 835: fmt = check_fs(buf, bsect);			/* Check sector 0 as an SFD format */
      009630 5F               [ 1] 1136 	clrw	x
      009631 89               [ 2] 1137 	pushw	x
      009632 5F               [ 1] 1138 	clrw	x
      009633 89               [ 2] 1139 	pushw	x
      009634 96               [ 1] 1140 	ldw	x, sp
      009635 1C 00 05         [ 2] 1141 	addw	x, #5
      009638 89               [ 2] 1142 	pushw	x
      009639 CD 95 C3         [ 4] 1143 	call	_check_fs
      00963C 5B 06            [ 2] 1144 	addw	sp, #6
      00963E 6B 3C            [ 1] 1145 	ld	(0x3c, sp), a
                                   1146 ;	../src/pff.c: 841: if (buf[4]) {					/* Is the partition existing? */
      009640 96               [ 1] 1147 	ldw	x, sp
      009641 1C 00 05         [ 2] 1148 	addw	x, #5
      009644 1F 39            [ 2] 1149 	ldw	(0x39, sp), x
                                   1150 ;	../src/pff.c: 836: if (fmt == 1) {						/* Not an FAT boot record, it may be FDISK format */
      009646 7B 3C            [ 1] 1151 	ld	a, (0x3c, sp)
      009648 4A               [ 1] 1152 	dec	a
      009649 26 44            [ 1] 1153 	jrne	00109$
                                   1154 ;	../src/pff.c: 838: if (disk_readp(buf, bsect, MBR_Table, 16)) {	/* 1st partition entry */
      00964B 4B 10            [ 1] 1155 	push	#0x10
      00964D 4B 00            [ 1] 1156 	push	#0x00
      00964F 4B BE            [ 1] 1157 	push	#0xbe
      009651 4B 01            [ 1] 1158 	push	#0x01
      009653 5F               [ 1] 1159 	clrw	x
      009654 89               [ 2] 1160 	pushw	x
      009655 5F               [ 1] 1161 	clrw	x
      009656 89               [ 2] 1162 	pushw	x
      009657 96               [ 1] 1163 	ldw	x, sp
      009658 1C 00 09         [ 2] 1164 	addw	x, #9
      00965B 89               [ 2] 1165 	pushw	x
      00965C CD 82 8F         [ 4] 1166 	call	_disk_readp
      00965F 5B 0A            [ 2] 1167 	addw	sp, #10
      009661 4D               [ 1] 1168 	tnz	a
      009662 27 06            [ 1] 1169 	jreq	00106$
                                   1170 ;	../src/pff.c: 839: fmt = 3;
      009664 A6 03            [ 1] 1171 	ld	a, #0x03
      009666 6B 3C            [ 1] 1172 	ld	(0x3c, sp), a
      009668 20 25            [ 2] 1173 	jra	00109$
      00966A                       1174 00106$:
                                   1175 ;	../src/pff.c: 841: if (buf[4]) {					/* Is the partition existing? */
      00966A 1E 39            [ 2] 1176 	ldw	x, (0x39, sp)
      00966C F6               [ 1] 1177 	ld	a, (x)
      00966D 27 20            [ 1] 1178 	jreq	00109$
                                   1179 ;	../src/pff.c: 842: bsect = ld_dword(&buf[8]);	/* Partition offset in LBA */
      00966F 96               [ 1] 1180 	ldw	x, sp
      009670 1C 00 09         [ 2] 1181 	addw	x, #9
      009673 89               [ 2] 1182 	pushw	x
      009674 CD 90 58         [ 4] 1183 	call	_ld_dword
      009677 5B 02            [ 2] 1184 	addw	sp, #2
      009679 1F 33            [ 2] 1185 	ldw	(0x33, sp), x
      00967B 17 31            [ 2] 1186 	ldw	(0x31, sp), y
                                   1187 ;	../src/pff.c: 843: fmt = check_fs(buf, bsect);	/* Check the partition */
      00967D 1E 33            [ 2] 1188 	ldw	x, (0x33, sp)
      00967F 89               [ 2] 1189 	pushw	x
      009680 1E 33            [ 2] 1190 	ldw	x, (0x33, sp)
      009682 89               [ 2] 1191 	pushw	x
      009683 96               [ 1] 1192 	ldw	x, sp
      009684 1C 00 05         [ 2] 1193 	addw	x, #5
      009687 89               [ 2] 1194 	pushw	x
      009688 CD 95 C3         [ 4] 1195 	call	_check_fs
      00968B 5B 06            [ 2] 1196 	addw	sp, #6
      00968D 6B 3C            [ 1] 1197 	ld	(0x3c, sp), a
      00968F                       1198 00109$:
                                   1199 ;	../src/pff.c: 847: if (fmt == 3) return FR_DISK_ERR;
      00968F 7B 3C            [ 1] 1200 	ld	a, (0x3c, sp)
      009691 A1 03            [ 1] 1201 	cp	a, #0x03
      009693 26 05            [ 1] 1202 	jrne	00111$
      009695 A6 01            [ 1] 1203 	ld	a, #0x01
      009697 CC 98 65         [ 2] 1204 	jp	00137$
      00969A                       1205 00111$:
                                   1206 ;	../src/pff.c: 848: if (fmt) return FR_NO_FILESYSTEM;	/* No valid FAT patition is found */
      00969A 0D 3C            [ 1] 1207 	tnz	(0x3c, sp)
      00969C 27 05            [ 1] 1208 	jreq	00113$
      00969E A6 06            [ 1] 1209 	ld	a, #0x06
      0096A0 CC 98 65         [ 2] 1210 	jp	00137$
      0096A3                       1211 00113$:
                                   1212 ;	../src/pff.c: 851: if (disk_readp(buf, bsect, 13, sizeof (buf))) return FR_DISK_ERR;
      0096A3 4B 24            [ 1] 1213 	push	#0x24
      0096A5 4B 00            [ 1] 1214 	push	#0x00
      0096A7 4B 0D            [ 1] 1215 	push	#0x0d
      0096A9 4B 00            [ 1] 1216 	push	#0x00
      0096AB 1E 37            [ 2] 1217 	ldw	x, (0x37, sp)
      0096AD 89               [ 2] 1218 	pushw	x
      0096AE 1E 37            [ 2] 1219 	ldw	x, (0x37, sp)
      0096B0 89               [ 2] 1220 	pushw	x
      0096B1 96               [ 1] 1221 	ldw	x, sp
      0096B2 1C 00 09         [ 2] 1222 	addw	x, #9
      0096B5 89               [ 2] 1223 	pushw	x
      0096B6 CD 82 8F         [ 4] 1224 	call	_disk_readp
      0096B9 5B 0A            [ 2] 1225 	addw	sp, #10
      0096BB 4D               [ 1] 1226 	tnz	a
      0096BC 27 05            [ 1] 1227 	jreq	00115$
      0096BE A6 01            [ 1] 1228 	ld	a, #0x01
      0096C0 CC 98 65         [ 2] 1229 	jp	00137$
      0096C3                       1230 00115$:
                                   1231 ;	../src/pff.c: 853: fsize = ld_word(buf+BPB_FATSz16-13);				/* Number of sectors per FAT */
      0096C3 96               [ 1] 1232 	ldw	x, sp
      0096C4 1C 00 0A         [ 2] 1233 	addw	x, #10
      0096C7 89               [ 2] 1234 	pushw	x
      0096C8 CD 90 42         [ 4] 1235 	call	_ld_word
      0096CB 5B 02            [ 2] 1236 	addw	sp, #2
      0096CD 90 5F            [ 1] 1237 	clrw	y
      0096CF 1F 37            [ 2] 1238 	ldw	(0x37, sp), x
      0096D1 17 35            [ 2] 1239 	ldw	(0x35, sp), y
                                   1240 ;	../src/pff.c: 854: if (!fsize) fsize = ld_dword(buf+BPB_FATSz32-13);
      0096D3 1E 37            [ 2] 1241 	ldw	x, (0x37, sp)
      0096D5 26 12            [ 1] 1242 	jrne	00117$
      0096D7 1E 35            [ 2] 1243 	ldw	x, (0x35, sp)
      0096D9 26 0E            [ 1] 1244 	jrne	00117$
      0096DB 96               [ 1] 1245 	ldw	x, sp
      0096DC 1C 00 18         [ 2] 1246 	addw	x, #24
      0096DF 89               [ 2] 1247 	pushw	x
      0096E0 CD 90 58         [ 4] 1248 	call	_ld_dword
      0096E3 5B 02            [ 2] 1249 	addw	sp, #2
      0096E5 1F 37            [ 2] 1250 	ldw	(0x37, sp), x
      0096E7 17 35            [ 2] 1251 	ldw	(0x35, sp), y
      0096E9                       1252 00117$:
                                   1253 ;	../src/pff.c: 856: fsize *= buf[BPB_NumFATs-13];						/* Number of sectors in FAT area */
      0096E9 7B 04            [ 1] 1254 	ld	a, (0x04, sp)
      0096EB 5F               [ 1] 1255 	clrw	x
      0096EC 97               [ 1] 1256 	ld	xl, a
      0096ED 90 5F            [ 1] 1257 	clrw	y
      0096EF 89               [ 2] 1258 	pushw	x
      0096F0 90 89            [ 2] 1259 	pushw	y
      0096F2 1E 3B            [ 2] 1260 	ldw	x, (0x3b, sp)
      0096F4 89               [ 2] 1261 	pushw	x
      0096F5 1E 3B            [ 2] 1262 	ldw	x, (0x3b, sp)
      0096F7 89               [ 2] 1263 	pushw	x
      0096F8 CD 9D E5         [ 4] 1264 	call	__mullong
      0096FB 5B 08            [ 2] 1265 	addw	sp, #8
      0096FD 1F 27            [ 2] 1266 	ldw	(0x27, sp), x
      0096FF 17 25            [ 2] 1267 	ldw	(0x25, sp), y
                                   1268 ;	../src/pff.c: 857: fs->fatbase = bsect + ld_word(buf+BPB_RsvdSecCnt-13); /* FAT start sector (lba) */
      009701 16 3F            [ 2] 1269 	ldw	y, (0x3f, sp)
      009703 17 29            [ 2] 1270 	ldw	(0x29, sp), y
      009705 93               [ 1] 1271 	ldw	x, y
      009706 1C 00 0A         [ 2] 1272 	addw	x, #0x000a
      009709 1F 2B            [ 2] 1273 	ldw	(0x2b, sp), x
      00970B 96               [ 1] 1274 	ldw	x, sp
      00970C 5C               [ 1] 1275 	incw	x
      00970D 5C               [ 1] 1276 	incw	x
      00970E 1F 3B            [ 2] 1277 	ldw	(0x3b, sp), x
      009710 89               [ 2] 1278 	pushw	x
      009711 CD 90 42         [ 4] 1279 	call	_ld_word
      009714 5B 02            [ 2] 1280 	addw	sp, #2
      009716 51               [ 1] 1281 	exgw	x, y
      009717 4F               [ 1] 1282 	clr	a
      009718 5F               [ 1] 1283 	clrw	x
      009719 72 F9 33         [ 2] 1284 	addw	y, (0x33, sp)
      00971C 19 32            [ 1] 1285 	adc	a, (0x32, sp)
      00971E 6B 36            [ 1] 1286 	ld	(0x36, sp), a
      009720 9E               [ 1] 1287 	ld	a, xh
      009721 19 31            [ 1] 1288 	adc	a, (0x31, sp)
      009723 6B 35            [ 1] 1289 	ld	(0x35, sp), a
      009725 1E 2B            [ 2] 1290 	ldw	x, (0x2b, sp)
      009727 EF 02            [ 2] 1291 	ldw	(0x2, x), y
      009729 16 35            [ 2] 1292 	ldw	y, (0x35, sp)
      00972B FF               [ 2] 1293 	ldw	(x), y
                                   1294 ;	../src/pff.c: 858: fs->csize = buf[BPB_SecPerClus-13];					/* Number of sectors per cluster */
      00972C 1E 29            [ 2] 1295 	ldw	x, (0x29, sp)
      00972E 5C               [ 1] 1296 	incw	x
      00972F 5C               [ 1] 1297 	incw	x
      009730 1F 2D            [ 2] 1298 	ldw	(0x2d, sp), x
      009732 7B 01            [ 1] 1299 	ld	a, (0x01, sp)
      009734 1E 2D            [ 2] 1300 	ldw	x, (0x2d, sp)
      009736 F7               [ 1] 1301 	ld	(x), a
                                   1302 ;	../src/pff.c: 859: fs->n_rootdir = ld_word(buf+BPB_RootEntCnt-13);		/* Nmuber of root directory entries */
      009737 1E 29            [ 2] 1303 	ldw	x, (0x29, sp)
      009739 1C 00 04         [ 2] 1304 	addw	x, #0x0004
      00973C 1F 2F            [ 2] 1305 	ldw	(0x2f, sp), x
      00973E 1E 39            [ 2] 1306 	ldw	x, (0x39, sp)
      009740 89               [ 2] 1307 	pushw	x
      009741 CD 90 42         [ 4] 1308 	call	_ld_word
      009744 5B 02            [ 2] 1309 	addw	sp, #2
      009746 16 2F            [ 2] 1310 	ldw	y, (0x2f, sp)
      009748 90 FF            [ 2] 1311 	ldw	(y), x
                                   1312 ;	../src/pff.c: 860: tsect = ld_word(buf+BPB_TotSec16-13);				/* Number of sectors on the file system */
      00974A 96               [ 1] 1313 	ldw	x, sp
      00974B 1C 00 07         [ 2] 1314 	addw	x, #7
      00974E 89               [ 2] 1315 	pushw	x
      00974F CD 90 42         [ 4] 1316 	call	_ld_word
      009752 5B 02            [ 2] 1317 	addw	sp, #2
      009754 90 5F            [ 1] 1318 	clrw	y
      009756 1F 37            [ 2] 1319 	ldw	(0x37, sp), x
      009758 17 35            [ 2] 1320 	ldw	(0x35, sp), y
                                   1321 ;	../src/pff.c: 861: if (!tsect) tsect = ld_dword(buf+BPB_TotSec32-13);
      00975A 5D               [ 2] 1322 	tnzw	x
      00975B 26 12            [ 1] 1323 	jrne	00119$
      00975D 90 5D            [ 2] 1324 	tnzw	y
      00975F 26 0E            [ 1] 1325 	jrne	00119$
      009761 96               [ 1] 1326 	ldw	x, sp
      009762 1C 00 14         [ 2] 1327 	addw	x, #20
      009765 89               [ 2] 1328 	pushw	x
      009766 CD 90 58         [ 4] 1329 	call	_ld_dword
      009769 5B 02            [ 2] 1330 	addw	sp, #2
      00976B 1F 37            [ 2] 1331 	ldw	(0x37, sp), x
      00976D 17 35            [ 2] 1332 	ldw	(0x35, sp), y
      00976F                       1333 00119$:
                                   1334 ;	../src/pff.c: 863: - ld_word(buf+BPB_RsvdSecCnt-13) - fsize - fs->n_rootdir / 16
      00976F 1E 3B            [ 2] 1335 	ldw	x, (0x3b, sp)
      009771 89               [ 2] 1336 	pushw	x
      009772 CD 90 42         [ 4] 1337 	call	_ld_word
      009775 5B 02            [ 2] 1338 	addw	sp, #2
      009777 1F 3B            [ 2] 1339 	ldw	(0x3b, sp), x
      009779 0F 3A            [ 1] 1340 	clr	(0x3a, sp)
      00977B 0F 39            [ 1] 1341 	clr	(0x39, sp)
      00977D 16 37            [ 2] 1342 	ldw	y, (0x37, sp)
      00977F 72 F2 3B         [ 2] 1343 	subw	y, (0x3b, sp)
      009782 7B 36            [ 1] 1344 	ld	a, (0x36, sp)
      009784 12 3A            [ 1] 1345 	sbc	a, (0x3a, sp)
      009786 88               [ 1] 1346 	push	a
      009787 7B 36            [ 1] 1347 	ld	a, (0x36, sp)
      009789 12 3A            [ 1] 1348 	sbc	a, (0x3a, sp)
      00978B 97               [ 1] 1349 	ld	xl, a
      00978C 84               [ 1] 1350 	pop	a
      00978D 72 F2 27         [ 2] 1351 	subw	y, (0x27, sp)
      009790 12 26            [ 1] 1352 	sbc	a, (0x26, sp)
      009792 6B 32            [ 1] 1353 	ld	(0x32, sp), a
      009794 9F               [ 1] 1354 	ld	a, xl
      009795 12 25            [ 1] 1355 	sbc	a, (0x25, sp)
      009797 1E 2F            [ 2] 1356 	ldw	x, (0x2f, sp)
      009799 FE               [ 2] 1357 	ldw	x, (x)
      00979A 54               [ 2] 1358 	srlw	x
      00979B 54               [ 2] 1359 	srlw	x
      00979C 54               [ 2] 1360 	srlw	x
      00979D 54               [ 2] 1361 	srlw	x
      00979E 1F 37            [ 2] 1362 	ldw	(0x37, sp), x
      0097A0 5F               [ 1] 1363 	clrw	x
      0097A1 0F 35            [ 1] 1364 	clr	(0x35, sp)
      0097A3 72 F2 37         [ 2] 1365 	subw	y, (0x37, sp)
      0097A6 17 3B            [ 2] 1366 	ldw	(0x3b, sp), y
      0097A8 88               [ 1] 1367 	push	a
      0097A9 7B 33            [ 1] 1368 	ld	a, (0x33, sp)
      0097AB 89               [ 2] 1369 	pushw	x
      0097AC 12 02            [ 1] 1370 	sbc	a, (2, sp)
      0097AE 85               [ 2] 1371 	popw	x
      0097AF 6B 3B            [ 1] 1372 	ld	(0x3b, sp), a
      0097B1 84               [ 1] 1373 	pop	a
      0097B2 12 35            [ 1] 1374 	sbc	a, (0x35, sp)
      0097B4 6B 39            [ 1] 1375 	ld	(0x39, sp), a
                                   1376 ;	../src/pff.c: 864: ) / fs->csize + 2;
      0097B6 1E 2D            [ 2] 1377 	ldw	x, (0x2d, sp)
      0097B8 F6               [ 1] 1378 	ld	a, (x)
      0097B9 5F               [ 1] 1379 	clrw	x
      0097BA 97               [ 1] 1380 	ld	xl, a
      0097BB 90 5F            [ 1] 1381 	clrw	y
      0097BD 89               [ 2] 1382 	pushw	x
      0097BE 90 89            [ 2] 1383 	pushw	y
      0097C0 1E 3F            [ 2] 1384 	ldw	x, (0x3f, sp)
      0097C2 89               [ 2] 1385 	pushw	x
      0097C3 1E 3F            [ 2] 1386 	ldw	x, (0x3f, sp)
      0097C5 89               [ 2] 1387 	pushw	x
      0097C6 CD 9D 8B         [ 4] 1388 	call	__divulong
      0097C9 5B 08            [ 2] 1389 	addw	sp, #8
      0097CB 17 39            [ 2] 1390 	ldw	(0x39, sp), y
      0097CD 1C 00 02         [ 2] 1391 	addw	x, #0x0002
      0097D0 51               [ 1] 1392 	exgw	x, y
      0097D1 1E 39            [ 2] 1393 	ldw	x, (0x39, sp)
      0097D3 24 01            [ 1] 1394 	jrnc	00209$
      0097D5 5C               [ 1] 1395 	incw	x
      0097D6                       1396 00209$:
      0097D6 1F 39            [ 2] 1397 	ldw	(0x39, sp), x
                                   1398 ;	../src/pff.c: 865: fs->n_fatent = (CLUST)mclst;
      0097D8 1E 29            [ 2] 1399 	ldw	x, (0x29, sp)
      0097DA 1C 00 06         [ 2] 1400 	addw	x, #0x0006
      0097DD EF 02            [ 2] 1401 	ldw	(0x2, x), y
      0097DF 7B 3A            [ 1] 1402 	ld	a, (0x3a, sp)
      0097E1 E7 01            [ 1] 1403 	ld	(0x1, x), a
      0097E3 7B 39            [ 1] 1404 	ld	a, (0x39, sp)
      0097E5 F7               [ 1] 1405 	ld	(x), a
                                   1406 ;	../src/pff.c: 867: fmt = 0;							/* Determine the FAT sub type */
      0097E6 4F               [ 1] 1407 	clr	a
                                   1408 ;	../src/pff.c: 870: if (PF_FS_FAT32 && mclst >= 0xFFF7) fmt = FS_FAT32;
      0097E7 90 A3 FF F7      [ 2] 1409 	cpw	y, #0xfff7
      0097EB 88               [ 1] 1410 	push	a
      0097EC 7B 3B            [ 1] 1411 	ld	a, (0x3b, sp)
      0097EE A2 00            [ 1] 1412 	sbc	a, #0x00
      0097F0 7B 3A            [ 1] 1413 	ld	a, (0x3a, sp)
      0097F2 A2 00            [ 1] 1414 	sbc	a, #0x00
      0097F4 84               [ 1] 1415 	pop	a
      0097F5 25 02            [ 1] 1416 	jrc	00128$
      0097F7 A6 03            [ 1] 1417 	ld	a, #0x03
      0097F9                       1418 00128$:
                                   1419 ;	../src/pff.c: 871: if (!fmt) return FR_NO_FILESYSTEM;
      0097F9 4D               [ 1] 1420 	tnz	a
      0097FA 26 04            [ 1] 1421 	jrne	00131$
      0097FC A6 06            [ 1] 1422 	ld	a, #0x06
      0097FE 20 65            [ 2] 1423 	jra	00137$
      009800                       1424 00131$:
                                   1425 ;	../src/pff.c: 872: fs->fs_type = fmt;
      009800 1E 29            [ 2] 1426 	ldw	x, (0x29, sp)
      009802 F7               [ 1] 1427 	ld	(x), a
                                   1428 ;	../src/pff.c: 875: fs->dirbase = ld_dword(buf+(BPB_RootClus-13));	/* Root directory start cluster */
      009803 1E 29            [ 2] 1429 	ldw	x, (0x29, sp)
      009805 1C 00 0E         [ 2] 1430 	addw	x, #0x000e
      009808 1F 37            [ 2] 1431 	ldw	(0x37, sp), x
      00980A 96               [ 1] 1432 	ldw	x, sp
      00980B 1C 00 20         [ 2] 1433 	addw	x, #32
      00980E 89               [ 2] 1434 	pushw	x
      00980F CD 90 58         [ 4] 1435 	call	_ld_dword
      009812 5B 02            [ 2] 1436 	addw	sp, #2
      009814 17 39            [ 2] 1437 	ldw	(0x39, sp), y
      009816 16 37            [ 2] 1438 	ldw	y, (0x37, sp)
      009818 90 EF 02         [ 2] 1439 	ldw	(0x2, y), x
      00981B 1E 39            [ 2] 1440 	ldw	x, (0x39, sp)
      00981D 90 FF            [ 2] 1441 	ldw	(y), x
                                   1442 ;	../src/pff.c: 879: fs->database = fs->fatbase + fsize + fs->n_rootdir / 16;	/* Data start sector (lba) */
      00981F 1E 29            [ 2] 1443 	ldw	x, (0x29, sp)
      009821 1C 00 12         [ 2] 1444 	addw	x, #0x0012
      009824 1F 3B            [ 2] 1445 	ldw	(0x3b, sp), x
      009826 1E 2B            [ 2] 1446 	ldw	x, (0x2b, sp)
      009828 90 93            [ 1] 1447 	ldw	y, x
      00982A 90 EE 02         [ 2] 1448 	ldw	y, (0x2, y)
      00982D FE               [ 2] 1449 	ldw	x, (x)
      00982E 72 F9 27         [ 2] 1450 	addw	y, (0x27, sp)
      009831 17 39            [ 2] 1451 	ldw	(0x39, sp), y
      009833 9F               [ 1] 1452 	ld	a, xl
      009834 19 26            [ 1] 1453 	adc	a, (0x26, sp)
      009836 6B 38            [ 1] 1454 	ld	(0x38, sp), a
      009838 9E               [ 1] 1455 	ld	a, xh
      009839 19 25            [ 1] 1456 	adc	a, (0x25, sp)
      00983B 1E 2F            [ 2] 1457 	ldw	x, (0x2f, sp)
      00983D FE               [ 2] 1458 	ldw	x, (x)
      00983E 54               [ 2] 1459 	srlw	x
      00983F 54               [ 2] 1460 	srlw	x
      009840 54               [ 2] 1461 	srlw	x
      009841 54               [ 2] 1462 	srlw	x
      009842 51               [ 1] 1463 	exgw	x, y
      009843 5F               [ 1] 1464 	clrw	x
      009844 0F 2F            [ 1] 1465 	clr	(0x2f, sp)
      009846 72 F9 39         [ 2] 1466 	addw	y, (0x39, sp)
      009849 88               [ 1] 1467 	push	a
      00984A 9F               [ 1] 1468 	ld	a, xl
      00984B 19 39            [ 1] 1469 	adc	a, (0x39, sp)
      00984D 6B 35            [ 1] 1470 	ld	(0x35, sp), a
      00984F 84               [ 1] 1471 	pop	a
      009850 19 2F            [ 1] 1472 	adc	a, (0x2f, sp)
      009852 6B 33            [ 1] 1473 	ld	(0x33, sp), a
      009854 1E 3B            [ 2] 1474 	ldw	x, (0x3b, sp)
      009856 EF 02            [ 2] 1475 	ldw	(0x2, x), y
      009858 16 33            [ 2] 1476 	ldw	y, (0x33, sp)
      00985A FF               [ 2] 1477 	ldw	(x), y
                                   1478 ;	../src/pff.c: 881: fs->flag = 0;
      00985B 1E 29            [ 2] 1479 	ldw	x, (0x29, sp)
      00985D 5C               [ 1] 1480 	incw	x
      00985E 7F               [ 1] 1481 	clr	(x)
                                   1482 ;	../src/pff.c: 882: FatFs = fs;
      00985F 1E 29            [ 2] 1483 	ldw	x, (0x29, sp)
      009861 CF 02 67         [ 2] 1484 	ldw	_FatFs+0, x
                                   1485 ;	../src/pff.c: 884: return FR_OK;
      009864 4F               [ 1] 1486 	clr	a
      009865                       1487 00137$:
                                   1488 ;	../src/pff.c: 885: }
      009865 5B 3C            [ 2] 1489 	addw	sp, #60
      009867 81               [ 4] 1490 	ret
                                   1491 ;	../src/pff.c: 894: FRESULT pf_open (
                                   1492 ;	-----------------------------------------
                                   1493 ;	 function pf_open
                                   1494 ;	-----------------------------------------
      009868                       1495 _pf_open:
      009868 52 46            [ 2] 1496 	sub	sp, #70
                                   1497 ;	../src/pff.c: 901: FATFS *fs = FatFs;
      00986A CE 02 67         [ 2] 1498 	ldw	x, _FatFs+0
                                   1499 ;	../src/pff.c: 904: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
      00986D 1F 3D            [ 2] 1500 	ldw	(0x3d, sp), x
      00986F 26 05            [ 1] 1501 	jrne	00102$
      009871 A6 05            [ 1] 1502 	ld	a, #0x05
      009873 CC 98 F6         [ 2] 1503 	jp	00108$
      009876                       1504 00102$:
                                   1505 ;	../src/pff.c: 906: fs->flag = 0;
      009876 1E 3D            [ 2] 1506 	ldw	x, (0x3d, sp)
      009878 5C               [ 1] 1507 	incw	x
      009879 1F 3F            [ 2] 1508 	ldw	(0x3f, sp), x
      00987B 7F               [ 1] 1509 	clr	(x)
                                   1510 ;	../src/pff.c: 907: dj.fn = sp;
      00987C 96               [ 1] 1511 	ldw	x, sp
      00987D 1C 00 03         [ 2] 1512 	addw	x, #3
      009880 90 96            [ 1] 1513 	ldw	y, sp
      009882 72 A9 00 11      [ 2] 1514 	addw	y, #17
      009886 FF               [ 2] 1515 	ldw	(x), y
                                   1516 ;	../src/pff.c: 908: res = follow_path(&dj, dir, path);	/* Follow the file path */
      009887 1E 49            [ 2] 1517 	ldw	x, (0x49, sp)
      009889 89               [ 2] 1518 	pushw	x
      00988A 96               [ 1] 1519 	ldw	x, sp
      00988B 1C 00 1F         [ 2] 1520 	addw	x, #31
      00988E 89               [ 2] 1521 	pushw	x
      00988F 96               [ 1] 1522 	ldw	x, sp
      009890 1C 00 05         [ 2] 1523 	addw	x, #5
      009893 89               [ 2] 1524 	pushw	x
      009894 CD 95 24         [ 4] 1525 	call	_follow_path
      009897 5B 06            [ 2] 1526 	addw	sp, #6
      009899 97               [ 1] 1527 	ld	xl, a
                                   1528 ;	../src/pff.c: 909: if (res != FR_OK) return res;		/* Follow failed */
      00989A 4D               [ 1] 1529 	tnz	a
      00989B 27 03            [ 1] 1530 	jreq	00104$
      00989D 9F               [ 1] 1531 	ld	a, xl
      00989E 20 56            [ 2] 1532 	jra	00108$
      0098A0                       1533 00104$:
                                   1534 ;	../src/pff.c: 910: if (!dir[0] || (dir[DIR_Attr] & AM_DIR)) return FR_NO_FILE;	/* It is a directory */
      0098A0 7B 1D            [ 1] 1535 	ld	a, (0x1d, sp)
      0098A2 27 06            [ 1] 1536 	jreq	00105$
      0098A4 7B 28            [ 1] 1537 	ld	a, (0x28, sp)
      0098A6 A5 10            [ 1] 1538 	bcp	a, #0x10
      0098A8 27 04            [ 1] 1539 	jreq	00106$
      0098AA                       1540 00105$:
      0098AA A6 03            [ 1] 1541 	ld	a, #0x03
      0098AC 20 48            [ 2] 1542 	jra	00108$
      0098AE                       1543 00106$:
                                   1544 ;	../src/pff.c: 912: fs->org_clust = get_clust(dir);		/* File start cluster */
      0098AE 1E 3D            [ 2] 1545 	ldw	x, (0x3d, sp)
      0098B0 1C 00 1E         [ 2] 1546 	addw	x, #0x001e
      0098B3 1F 41            [ 2] 1547 	ldw	(0x41, sp), x
      0098B5 96               [ 1] 1548 	ldw	x, sp
      0098B6 1C 00 1D         [ 2] 1549 	addw	x, #29
      0098B9 89               [ 2] 1550 	pushw	x
      0098BA CD 92 44         [ 4] 1551 	call	_get_clust
      0098BD 5B 02            [ 2] 1552 	addw	sp, #2
      0098BF 17 43            [ 2] 1553 	ldw	(0x43, sp), y
      0098C1 16 41            [ 2] 1554 	ldw	y, (0x41, sp)
      0098C3 90 EF 02         [ 2] 1555 	ldw	(0x2, y), x
      0098C6 1E 43            [ 2] 1556 	ldw	x, (0x43, sp)
      0098C8 90 FF            [ 2] 1557 	ldw	(y), x
                                   1558 ;	../src/pff.c: 913: fs->fsize = ld_dword(dir+DIR_FileSize);	/* File size */
      0098CA 1E 3D            [ 2] 1559 	ldw	x, (0x3d, sp)
      0098CC 1C 00 1A         [ 2] 1560 	addw	x, #0x001a
      0098CF 1F 41            [ 2] 1561 	ldw	(0x41, sp), x
      0098D1 96               [ 1] 1562 	ldw	x, sp
      0098D2 1C 00 39         [ 2] 1563 	addw	x, #57
      0098D5 89               [ 2] 1564 	pushw	x
      0098D6 CD 90 58         [ 4] 1565 	call	_ld_dword
      0098D9 5B 02            [ 2] 1566 	addw	sp, #2
      0098DB 17 43            [ 2] 1567 	ldw	(0x43, sp), y
      0098DD 16 41            [ 2] 1568 	ldw	y, (0x41, sp)
      0098DF 90 EF 02         [ 2] 1569 	ldw	(0x2, y), x
      0098E2 1E 43            [ 2] 1570 	ldw	x, (0x43, sp)
      0098E4 90 FF            [ 2] 1571 	ldw	(y), x
                                   1572 ;	../src/pff.c: 914: fs->fptr = 0;						/* File pointer */
      0098E6 1E 3D            [ 2] 1573 	ldw	x, (0x3d, sp)
      0098E8 1C 00 16         [ 2] 1574 	addw	x, #0x0016
      0098EB 90 5F            [ 1] 1575 	clrw	y
      0098ED EF 02            [ 2] 1576 	ldw	(0x2, x), y
      0098EF FF               [ 2] 1577 	ldw	(x), y
                                   1578 ;	../src/pff.c: 915: fs->flag = FA_OPENED;
      0098F0 1E 3F            [ 2] 1579 	ldw	x, (0x3f, sp)
      0098F2 A6 01            [ 1] 1580 	ld	a, #0x01
      0098F4 F7               [ 1] 1581 	ld	(x), a
                                   1582 ;	../src/pff.c: 917: return FR_OK;
      0098F5 4F               [ 1] 1583 	clr	a
      0098F6                       1584 00108$:
                                   1585 ;	../src/pff.c: 918: }
      0098F6 5B 46            [ 2] 1586 	addw	sp, #70
      0098F8 81               [ 4] 1587 	ret
                                   1588 ;	../src/pff.c: 928: FRESULT pf_read (
                                   1589 ;	-----------------------------------------
                                   1590 ;	 function pf_read
                                   1591 ;	-----------------------------------------
      0098F9                       1592 _pf_read:
      0098F9 52 1A            [ 2] 1593 	sub	sp, #26
                                   1594 ;	../src/pff.c: 938: BYTE cs, *rbuff = buff;
      0098FB 1E 1D            [ 2] 1595 	ldw	x, (0x1d, sp)
      0098FD 1F 01            [ 2] 1596 	ldw	(0x01, sp), x
                                   1597 ;	../src/pff.c: 939: FATFS *fs = FatFs;
      0098FF CE 02 67         [ 2] 1598 	ldw	x, _FatFs+0
      009902 1F 19            [ 2] 1599 	ldw	(0x19, sp), x
                                   1600 ;	../src/pff.c: 942: *br = 0;
      009904 16 21            [ 2] 1601 	ldw	y, (0x21, sp)
      009906 17 03            [ 2] 1602 	ldw	(0x03, sp), y
      009908 93               [ 1] 1603 	ldw	x, y
      009909 6F 01            [ 1] 1604 	clr	(0x1, x)
      00990B 7F               [ 1] 1605 	clr	(x)
                                   1606 ;	../src/pff.c: 943: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
      00990C 1E 19            [ 2] 1607 	ldw	x, (0x19, sp)
      00990E 26 05            [ 1] 1608 	jrne	00102$
      009910 A6 05            [ 1] 1609 	ld	a, #0x05
      009912 CC 9A E4         [ 2] 1610 	jp	00127$
      009915                       1611 00102$:
                                   1612 ;	../src/pff.c: 944: if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
      009915 1E 19            [ 2] 1613 	ldw	x, (0x19, sp)
      009917 5C               [ 1] 1614 	incw	x
      009918 1F 05            [ 2] 1615 	ldw	(0x05, sp), x
      00991A F6               [ 1] 1616 	ld	a, (x)
      00991B 44               [ 1] 1617 	srl	a
      00991C 25 05            [ 1] 1618 	jrc	00104$
      00991E A6 04            [ 1] 1619 	ld	a, #0x04
      009920 CC 9A E4         [ 2] 1620 	jp	00127$
      009923                       1621 00104$:
                                   1622 ;	../src/pff.c: 946: remain = fs->fsize - fs->fptr;
      009923 1E 19            [ 2] 1623 	ldw	x, (0x19, sp)
      009925 90 93            [ 1] 1624 	ldw	y, x
      009927 90 EE 1C         [ 2] 1625 	ldw	y, (0x1c, y)
      00992A EE 1A            [ 2] 1626 	ldw	x, (0x1a, x)
      00992C 1F 11            [ 2] 1627 	ldw	(0x11, sp), x
      00992E 1E 19            [ 2] 1628 	ldw	x, (0x19, sp)
      009930 1C 00 16         [ 2] 1629 	addw	x, #0x0016
      009933 1F 07            [ 2] 1630 	ldw	(0x07, sp), x
      009935 E6 03            [ 1] 1631 	ld	a, (0x3, x)
      009937 6B 18            [ 1] 1632 	ld	(0x18, sp), a
      009939 E6 02            [ 1] 1633 	ld	a, (0x2, x)
      00993B 6B 17            [ 1] 1634 	ld	(0x17, sp), a
      00993D FE               [ 2] 1635 	ldw	x, (x)
      00993E 72 F2 17         [ 2] 1636 	subw	y, (0x17, sp)
      009941 7B 12            [ 1] 1637 	ld	a, (0x12, sp)
      009943 89               [ 2] 1638 	pushw	x
      009944 12 02            [ 1] 1639 	sbc	a, (2, sp)
      009946 85               [ 2] 1640 	popw	x
      009947 97               [ 1] 1641 	ld	xl, a
      009948 7B 11            [ 1] 1642 	ld	a, (0x11, sp)
      00994A 89               [ 2] 1643 	pushw	x
      00994B 12 01            [ 1] 1644 	sbc	a, (1, sp)
      00994D 85               [ 2] 1645 	popw	x
      00994E 17 13            [ 2] 1646 	ldw	(0x13, sp), y
      009950 95               [ 1] 1647 	ld	xh, a
                                   1648 ;	../src/pff.c: 947: if (btr > remain) btr = (UINT)remain;			/* Truncate btr by remaining bytes */
      009951 16 1F            [ 2] 1649 	ldw	y, (0x1f, sp)
      009953 17 17            [ 2] 1650 	ldw	(0x17, sp), y
      009955 0F 16            [ 1] 1651 	clr	(0x16, sp)
      009957 0F 15            [ 1] 1652 	clr	(0x15, sp)
      009959 7B 14            [ 1] 1653 	ld	a, (0x14, sp)
      00995B 11 18            [ 1] 1654 	cp	a, (0x18, sp)
      00995D 7B 13            [ 1] 1655 	ld	a, (0x13, sp)
      00995F 12 17            [ 1] 1656 	sbc	a, (0x17, sp)
      009961 9F               [ 1] 1657 	ld	a, xl
      009962 12 16            [ 1] 1658 	sbc	a, (0x16, sp)
      009964 9E               [ 1] 1659 	ld	a, xh
      009965 12 15            [ 1] 1660 	sbc	a, (0x15, sp)
      009967 24 04            [ 1] 1661 	jrnc	00140$
      009969 1E 13            [ 2] 1662 	ldw	x, (0x13, sp)
      00996B 1F 1F            [ 2] 1663 	ldw	(0x1f, sp), x
                                   1664 ;	../src/pff.c: 949: while (btr)	{									/* Repeat until all data transferred */
      00996D                       1665 00140$:
      00996D 1E 19            [ 2] 1666 	ldw	x, (0x19, sp)
      00996F 1C 00 22         [ 2] 1667 	addw	x, #0x0022
      009972 1F 09            [ 2] 1668 	ldw	(0x09, sp), x
      009974 16 19            [ 2] 1669 	ldw	y, (0x19, sp)
      009976 17 0B            [ 2] 1670 	ldw	(0x0b, sp), y
      009978 16 19            [ 2] 1671 	ldw	y, (0x19, sp)
      00997A 17 0D            [ 2] 1672 	ldw	(0x0d, sp), y
      00997C 1E 19            [ 2] 1673 	ldw	x, (0x19, sp)
      00997E 1C 00 26         [ 2] 1674 	addw	x, #0x0026
      009981 1F 0F            [ 2] 1675 	ldw	(0x0f, sp), x
      009983                       1676 00124$:
      009983 1E 1F            [ 2] 1677 	ldw	x, (0x1f, sp)
      009985 26 03            [ 1] 1678 	jrne	00197$
      009987 CC 9A E3         [ 2] 1679 	jp	00126$
      00998A                       1680 00197$:
                                   1681 ;	../src/pff.c: 950: if ((fs->fptr % 512) == 0) {				/* On the sector boundary? */
      00998A 1E 07            [ 2] 1682 	ldw	x, (0x07, sp)
      00998C 90 93            [ 1] 1683 	ldw	y, x
      00998E 90 EE 02         [ 2] 1684 	ldw	y, (0x2, y)
      009991 17 13            [ 2] 1685 	ldw	(0x13, sp), y
      009993 FE               [ 2] 1686 	ldw	x, (x)
      009994 1F 11            [ 2] 1687 	ldw	(0x11, sp), x
      009996 7B 14            [ 1] 1688 	ld	a, (0x14, sp)
      009998 6B 1A            [ 1] 1689 	ld	(0x1a, sp), a
      00999A 7B 13            [ 1] 1690 	ld	a, (0x13, sp)
      00999C A4 01            [ 1] 1691 	and	a, #0x01
      00999E 6B 19            [ 1] 1692 	ld	(0x19, sp), a
      0099A0 5F               [ 1] 1693 	clrw	x
      0099A1 1F 17            [ 2] 1694 	ldw	(0x17, sp), x
      0099A3 1E 19            [ 2] 1695 	ldw	x, (0x19, sp)
      0099A5 26 04            [ 1] 1696 	jrne	00198$
      0099A7 1E 17            [ 2] 1697 	ldw	x, (0x17, sp)
      0099A9 27 03            [ 1] 1698 	jreq	00199$
      0099AB                       1699 00198$:
      0099AB CC 9A 5A         [ 2] 1700 	jp	00117$
      0099AE                       1701 00199$:
                                   1702 ;	../src/pff.c: 951: cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
      0099AE 16 12            [ 2] 1703 	ldw	y, (0x12, sp)
      0099B0 17 17            [ 2] 1704 	ldw	(0x17, sp), y
      0099B2 7B 11            [ 1] 1705 	ld	a, (0x11, sp)
      0099B4 6B 16            [ 1] 1706 	ld	(0x16, sp), a
      0099B6 0F 15            [ 1] 1707 	clr	(0x15, sp)
      0099B8 04 16            [ 1] 1708 	srl	(0x16, sp)
      0099BA 06 17            [ 1] 1709 	rrc	(0x17, sp)
      0099BC 06 18            [ 1] 1710 	rrc	(0x18, sp)
      0099BE 1E 0D            [ 2] 1711 	ldw	x, (0x0d, sp)
      0099C0 E6 02            [ 1] 1712 	ld	a, (0x2, x)
      0099C2 6B 1A            [ 1] 1713 	ld	(0x1a, sp), a
      0099C4 0A 1A            [ 1] 1714 	dec	(0x1a, sp)
      0099C6 7B 1A            [ 1] 1715 	ld	a, (0x1a, sp)
      0099C8 6B 19            [ 1] 1716 	ld	(0x19, sp), a
      0099CA 7B 18            [ 1] 1717 	ld	a, (0x18, sp)
      0099CC 6B 1A            [ 1] 1718 	ld	(0x1a, sp), a
      0099CE 14 19            [ 1] 1719 	and	a, (0x19, sp)
                                   1720 ;	../src/pff.c: 952: if (!cs) {								/* On the cluster boundary? */
      0099D0 6B 1A            [ 1] 1721 	ld	(0x1a, sp), a
      0099D2 26 48            [ 1] 1722 	jrne	00113$
                                   1723 ;	../src/pff.c: 953: if (fs->fptr == 0) {				/* On the top of the file? */
      0099D4 1E 13            [ 2] 1724 	ldw	x, (0x13, sp)
      0099D6 26 13            [ 1] 1725 	jrne	00108$
      0099D8 1E 11            [ 2] 1726 	ldw	x, (0x11, sp)
      0099DA 26 0F            [ 1] 1727 	jrne	00108$
                                   1728 ;	../src/pff.c: 954: clst = fs->org_clust;
      0099DC 1E 0B            [ 2] 1729 	ldw	x, (0x0b, sp)
      0099DE 90 93            [ 1] 1730 	ldw	y, x
      0099E0 90 EE 20         [ 2] 1731 	ldw	y, (0x20, y)
      0099E3 EE 1E            [ 2] 1732 	ldw	x, (0x1e, x)
      0099E5 17 18            [ 2] 1733 	ldw	(0x18, sp), y
      0099E7 1F 16            [ 2] 1734 	ldw	(0x16, sp), x
      0099E9 20 14            [ 2] 1735 	jra	00109$
      0099EB                       1736 00108$:
                                   1737 ;	../src/pff.c: 956: clst = get_fat(fs->curr_clust);
      0099EB 1E 09            [ 2] 1738 	ldw	x, (0x09, sp)
      0099ED 90 93            [ 1] 1739 	ldw	y, x
      0099EF 90 EE 02         [ 2] 1740 	ldw	y, (0x2, y)
      0099F2 FE               [ 2] 1741 	ldw	x, (x)
      0099F3 90 89            [ 2] 1742 	pushw	y
      0099F5 89               [ 2] 1743 	pushw	x
      0099F6 CD 91 2B         [ 4] 1744 	call	_get_fat
      0099F9 5B 04            [ 2] 1745 	addw	sp, #4
      0099FB 17 16            [ 2] 1746 	ldw	(0x16, sp), y
      0099FD 1F 18            [ 2] 1747 	ldw	(0x18, sp), x
      0099FF                       1748 00109$:
                                   1749 ;	../src/pff.c: 958: if (clst <= 1) ABORT(FR_DISK_ERR);
      0099FF 5F               [ 1] 1750 	clrw	x
      009A00 5C               [ 1] 1751 	incw	x
      009A01 13 18            [ 2] 1752 	cpw	x, (0x18, sp)
      009A03 4F               [ 1] 1753 	clr	a
      009A04 12 17            [ 1] 1754 	sbc	a, (0x17, sp)
      009A06 4F               [ 1] 1755 	clr	a
      009A07 12 16            [ 1] 1756 	sbc	a, (0x16, sp)
      009A09 25 08            [ 1] 1757 	jrc	00111$
      009A0B 1E 05            [ 2] 1758 	ldw	x, (0x05, sp)
      009A0D 7F               [ 1] 1759 	clr	(x)
      009A0E A6 01            [ 1] 1760 	ld	a, #0x01
      009A10 CC 9A E4         [ 2] 1761 	jp	00127$
      009A13                       1762 00111$:
                                   1763 ;	../src/pff.c: 959: fs->curr_clust = clst;				/* Update current cluster */
      009A13 1E 09            [ 2] 1764 	ldw	x, (0x09, sp)
      009A15 16 18            [ 2] 1765 	ldw	y, (0x18, sp)
      009A17 EF 02            [ 2] 1766 	ldw	(0x2, x), y
      009A19 16 16            [ 2] 1767 	ldw	y, (0x16, sp)
      009A1B FF               [ 2] 1768 	ldw	(x), y
      009A1C                       1769 00113$:
                                   1770 ;	../src/pff.c: 961: sect = clust2sect(fs->curr_clust);		/* Get current sector */
      009A1C 1E 09            [ 2] 1771 	ldw	x, (0x09, sp)
      009A1E 90 93            [ 1] 1772 	ldw	y, x
      009A20 90 EE 02         [ 2] 1773 	ldw	y, (0x2, y)
      009A23 FE               [ 2] 1774 	ldw	x, (x)
      009A24 90 89            [ 2] 1775 	pushw	y
      009A26 89               [ 2] 1776 	pushw	x
      009A27 CD 91 D2         [ 4] 1777 	call	_clust2sect
      009A2A 5B 04            [ 2] 1778 	addw	sp, #4
      009A2C 1F 18            [ 2] 1779 	ldw	(0x18, sp), x
      009A2E 17 16            [ 2] 1780 	ldw	(0x16, sp), y
                                   1781 ;	../src/pff.c: 962: if (!sect) ABORT(FR_DISK_ERR);
      009A30 5D               [ 2] 1782 	tnzw	x
      009A31 26 0C            [ 1] 1783 	jrne	00115$
      009A33 90 5D            [ 2] 1784 	tnzw	y
      009A35 26 08            [ 1] 1785 	jrne	00115$
      009A37 1E 05            [ 2] 1786 	ldw	x, (0x05, sp)
      009A39 7F               [ 1] 1787 	clr	(x)
      009A3A A6 01            [ 1] 1788 	ld	a, #0x01
      009A3C CC 9A E4         [ 2] 1789 	jp	00127$
      009A3F                       1790 00115$:
                                   1791 ;	../src/pff.c: 963: fs->dsect = sect + cs;
      009A3F 7B 1A            [ 1] 1792 	ld	a, (0x1a, sp)
      009A41 90 5F            [ 1] 1793 	clrw	y
      009A43 5F               [ 1] 1794 	clrw	x
      009A44 90 97            [ 1] 1795 	ld	yl, a
      009A46 72 F9 18         [ 2] 1796 	addw	y, (0x18, sp)
      009A49 9F               [ 1] 1797 	ld	a, xl
      009A4A 19 17            [ 1] 1798 	adc	a, (0x17, sp)
      009A4C 6B 13            [ 1] 1799 	ld	(0x13, sp), a
      009A4E 9E               [ 1] 1800 	ld	a, xh
      009A4F 19 16            [ 1] 1801 	adc	a, (0x16, sp)
      009A51 6B 12            [ 1] 1802 	ld	(0x12, sp), a
      009A53 1E 0F            [ 2] 1803 	ldw	x, (0x0f, sp)
      009A55 EF 02            [ 2] 1804 	ldw	(0x2, x), y
      009A57 16 12            [ 2] 1805 	ldw	y, (0x12, sp)
      009A59 FF               [ 2] 1806 	ldw	(x), y
      009A5A                       1807 00117$:
                                   1808 ;	../src/pff.c: 946: remain = fs->fsize - fs->fptr;
      009A5A 1E 07            [ 2] 1809 	ldw	x, (0x07, sp)
      009A5C EE 02            [ 2] 1810 	ldw	x, (0x2, x)
                                   1811 ;	../src/pff.c: 965: rcnt = 512 - (UINT)fs->fptr % 512;			/* Get partial sector data from sector buffer */
      009A5E 9F               [ 1] 1812 	ld	a, xl
      009A5F 6B 16            [ 1] 1813 	ld	(0x16, sp), a
      009A61 9E               [ 1] 1814 	ld	a, xh
      009A62 A4 01            [ 1] 1815 	and	a, #0x01
      009A64 6B 15            [ 1] 1816 	ld	(0x15, sp), a
      009A66 5F               [ 1] 1817 	clrw	x
      009A67 A6 02            [ 1] 1818 	ld	a, #0x02
      009A69 95               [ 1] 1819 	ld	xh, a
      009A6A 72 F0 15         [ 2] 1820 	subw	x, (0x15, sp)
                                   1821 ;	../src/pff.c: 966: if (rcnt > btr) rcnt = btr;
      009A6D 1F 11            [ 2] 1822 	ldw	(0x11, sp), x
      009A6F 13 1F            [ 2] 1823 	cpw	x, (0x1f, sp)
      009A71 23 04            [ 2] 1824 	jrule	00119$
      009A73 16 1F            [ 2] 1825 	ldw	y, (0x1f, sp)
      009A75 17 11            [ 2] 1826 	ldw	(0x11, sp), y
      009A77                       1827 00119$:
                                   1828 ;	../src/pff.c: 967: dr = disk_readp(rbuff, fs->dsect, (UINT)fs->fptr % 512, rcnt);
      009A77 1E 0F            [ 2] 1829 	ldw	x, (0x0f, sp)
      009A79 90 93            [ 1] 1830 	ldw	y, x
      009A7B 90 EE 02         [ 2] 1831 	ldw	y, (0x2, y)
      009A7E FE               [ 2] 1832 	ldw	x, (x)
      009A7F 1F 17            [ 2] 1833 	ldw	(0x17, sp), x
      009A81 1E 11            [ 2] 1834 	ldw	x, (0x11, sp)
      009A83 89               [ 2] 1835 	pushw	x
      009A84 1E 17            [ 2] 1836 	ldw	x, (0x17, sp)
      009A86 89               [ 2] 1837 	pushw	x
      009A87 90 89            [ 2] 1838 	pushw	y
      009A89 1E 1D            [ 2] 1839 	ldw	x, (0x1d, sp)
      009A8B 89               [ 2] 1840 	pushw	x
      009A8C 1E 09            [ 2] 1841 	ldw	x, (0x09, sp)
      009A8E 89               [ 2] 1842 	pushw	x
      009A8F CD 82 8F         [ 4] 1843 	call	_disk_readp
      009A92 5B 0A            [ 2] 1844 	addw	sp, #10
                                   1845 ;	../src/pff.c: 968: if (dr) ABORT(FR_DISK_ERR);
      009A94 4D               [ 1] 1846 	tnz	a
      009A95 27 07            [ 1] 1847 	jreq	00121$
      009A97 1E 05            [ 2] 1848 	ldw	x, (0x05, sp)
      009A99 7F               [ 1] 1849 	clr	(x)
      009A9A A6 01            [ 1] 1850 	ld	a, #0x01
      009A9C 20 46            [ 2] 1851 	jra	00127$
      009A9E                       1852 00121$:
                                   1853 ;	../src/pff.c: 969: fs->fptr += rcnt;							/* Advances file read pointer */
      009A9E 1E 07            [ 2] 1854 	ldw	x, (0x07, sp)
      009AA0 90 93            [ 1] 1855 	ldw	y, x
      009AA2 90 EE 02         [ 2] 1856 	ldw	y, (0x2, y)
      009AA5 17 15            [ 2] 1857 	ldw	(0x15, sp), y
      009AA7 FE               [ 2] 1858 	ldw	x, (x)
      009AA8 1F 13            [ 2] 1859 	ldw	(0x13, sp), x
      009AAA 16 11            [ 2] 1860 	ldw	y, (0x11, sp)
      009AAC 4F               [ 1] 1861 	clr	a
      009AAD 5F               [ 1] 1862 	clrw	x
      009AAE 72 F9 15         [ 2] 1863 	addw	y, (0x15, sp)
      009AB1 19 14            [ 1] 1864 	adc	a, (0x14, sp)
      009AB3 6B 18            [ 1] 1865 	ld	(0x18, sp), a
      009AB5 9F               [ 1] 1866 	ld	a, xl
      009AB6 19 13            [ 1] 1867 	adc	a, (0x13, sp)
      009AB8 6B 17            [ 1] 1868 	ld	(0x17, sp), a
      009ABA 1E 07            [ 2] 1869 	ldw	x, (0x07, sp)
      009ABC EF 02            [ 2] 1870 	ldw	(0x2, x), y
      009ABE 16 17            [ 2] 1871 	ldw	y, (0x17, sp)
      009AC0 FF               [ 2] 1872 	ldw	(x), y
                                   1873 ;	../src/pff.c: 970: btr -= rcnt; *br += rcnt;					/* Update read counter */
      009AC1 1E 1F            [ 2] 1874 	ldw	x, (0x1f, sp)
      009AC3 72 F0 11         [ 2] 1875 	subw	x, (0x11, sp)
      009AC6 1F 1F            [ 2] 1876 	ldw	(0x1f, sp), x
      009AC8 1E 03            [ 2] 1877 	ldw	x, (0x03, sp)
      009ACA FE               [ 2] 1878 	ldw	x, (x)
      009ACB 72 FB 11         [ 2] 1879 	addw	x, (0x11, sp)
      009ACE 16 03            [ 2] 1880 	ldw	y, (0x03, sp)
      009AD0 90 FF            [ 2] 1881 	ldw	(y), x
                                   1882 ;	../src/pff.c: 971: if (rbuff) rbuff += rcnt;					/* Advances the data pointer if destination is memory */
      009AD2 1E 01            [ 2] 1883 	ldw	x, (0x01, sp)
      009AD4 26 03            [ 1] 1884 	jrne	00208$
      009AD6 CC 99 83         [ 2] 1885 	jp	00124$
      009AD9                       1886 00208$:
      009AD9 1E 01            [ 2] 1887 	ldw	x, (0x01, sp)
      009ADB 72 FB 11         [ 2] 1888 	addw	x, (0x11, sp)
      009ADE 1F 01            [ 2] 1889 	ldw	(0x01, sp), x
      009AE0 CC 99 83         [ 2] 1890 	jp	00124$
      009AE3                       1891 00126$:
                                   1892 ;	../src/pff.c: 974: return FR_OK;
      009AE3 4F               [ 1] 1893 	clr	a
      009AE4                       1894 00127$:
                                   1895 ;	../src/pff.c: 975: }
      009AE4 5B 1A            [ 2] 1896 	addw	sp, #26
      009AE6 81               [ 4] 1897 	ret
                                   1898 ;	../src/pff.c: 985: FRESULT pf_write (
                                   1899 ;	-----------------------------------------
                                   1900 ;	 function pf_write
                                   1901 ;	-----------------------------------------
      009AE7                       1902 _pf_write:
      009AE7 52 1C            [ 2] 1903 	sub	sp, #28
                                   1904 ;	../src/pff.c: 993: const BYTE *p = buff;
      009AE9 1E 1F            [ 2] 1905 	ldw	x, (0x1f, sp)
      009AEB 1F 05            [ 2] 1906 	ldw	(0x05, sp), x
                                   1907 ;	../src/pff.c: 996: FATFS *fs = FatFs;
      009AED CE 02 67         [ 2] 1908 	ldw	x, _FatFs+0
      009AF0 1F 07            [ 2] 1909 	ldw	(0x07, sp), x
                                   1910 ;	../src/pff.c: 999: *bw = 0;
      009AF2 16 23            [ 2] 1911 	ldw	y, (0x23, sp)
      009AF4 17 09            [ 2] 1912 	ldw	(0x09, sp), y
      009AF6 93               [ 1] 1913 	ldw	x, y
      009AF7 6F 01            [ 1] 1914 	clr	(0x1, x)
      009AF9 7F               [ 1] 1915 	clr	(x)
                                   1916 ;	../src/pff.c: 1000: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
      009AFA 1E 07            [ 2] 1917 	ldw	x, (0x07, sp)
      009AFC 26 05            [ 1] 1918 	jrne	00102$
      009AFE A6 05            [ 1] 1919 	ld	a, #0x05
      009B00 CC 9D 53         [ 2] 1920 	jp	00139$
      009B03                       1921 00102$:
                                   1922 ;	../src/pff.c: 1001: if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
      009B03 1E 07            [ 2] 1923 	ldw	x, (0x07, sp)
      009B05 5C               [ 1] 1924 	incw	x
      009B06 1F 0B            [ 2] 1925 	ldw	(0x0b, sp), x
      009B08 F6               [ 1] 1926 	ld	a, (x)
      009B09 A5 01            [ 1] 1927 	bcp	a, #0x01
      009B0B 26 05            [ 1] 1928 	jrne	00104$
      009B0D A6 04            [ 1] 1929 	ld	a, #0x04
      009B0F CC 9D 53         [ 2] 1930 	jp	00139$
      009B12                       1931 00104$:
                                   1932 ;	../src/pff.c: 1004: if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
      009B12 A4 40            [ 1] 1933 	and	a, #0x40
      009B14 6B 1C            [ 1] 1934 	ld	(0x1c, sp), a
      009B16 0F 1B            [ 1] 1935 	clr	(0x1b, sp)
                                   1936 ;	../src/pff.c: 1003: if (!btw) {		/* Finalize request */
      009B18 1E 21            [ 2] 1937 	ldw	x, (0x21, sp)
      009B1A 26 26            [ 1] 1938 	jrne	00111$
                                   1939 ;	../src/pff.c: 1004: if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
      009B1C 1E 1B            [ 2] 1940 	ldw	x, (0x1b, sp)
      009B1E 27 16            [ 1] 1941 	jreq	00106$
      009B20 5F               [ 1] 1942 	clrw	x
      009B21 89               [ 2] 1943 	pushw	x
      009B22 5F               [ 1] 1944 	clrw	x
      009B23 89               [ 2] 1945 	pushw	x
      009B24 5F               [ 1] 1946 	clrw	x
      009B25 89               [ 2] 1947 	pushw	x
      009B26 CD 83 64         [ 4] 1948 	call	_disk_writep
      009B29 5B 06            [ 2] 1949 	addw	sp, #6
      009B2B 4D               [ 1] 1950 	tnz	a
      009B2C 27 08            [ 1] 1951 	jreq	00106$
      009B2E 1E 0B            [ 2] 1952 	ldw	x, (0x0b, sp)
      009B30 7F               [ 1] 1953 	clr	(x)
      009B31 A6 01            [ 1] 1954 	ld	a, #0x01
      009B33 CC 9D 53         [ 2] 1955 	jp	00139$
      009B36                       1956 00106$:
                                   1957 ;	../src/pff.c: 1005: fs->flag &= ~FA__WIP;
      009B36 1E 0B            [ 2] 1958 	ldw	x, (0x0b, sp)
      009B38 F6               [ 1] 1959 	ld	a, (x)
      009B39 A4 BF            [ 1] 1960 	and	a, #0xbf
      009B3B 1E 0B            [ 2] 1961 	ldw	x, (0x0b, sp)
      009B3D F7               [ 1] 1962 	ld	(x), a
                                   1963 ;	../src/pff.c: 1006: return FR_OK;
      009B3E 4F               [ 1] 1964 	clr	a
      009B3F CC 9D 53         [ 2] 1965 	jp	00139$
      009B42                       1966 00111$:
                                   1967 ;	../src/pff.c: 1009: fs->fptr &= 0xFFFFFE00;
      009B42 1E 07            [ 2] 1968 	ldw	x, (0x07, sp)
      009B44 1C 00 16         [ 2] 1969 	addw	x, #0x0016
      009B47 1F 13            [ 2] 1970 	ldw	(0x13, sp), x
                                   1971 ;	../src/pff.c: 1008: if (!(fs->flag & FA__WIP)) {	/* Round-down fptr to the sector boundary */
      009B49 1E 1B            [ 2] 1972 	ldw	x, (0x1b, sp)
      009B4B 26 1A            [ 1] 1973 	jrne	00112$
                                   1974 ;	../src/pff.c: 1009: fs->fptr &= 0xFFFFFE00;
      009B4D 1E 13            [ 2] 1975 	ldw	x, (0x13, sp)
      009B4F E6 02            [ 1] 1976 	ld	a, (0x2, x)
      009B51 FE               [ 2] 1977 	ldw	x, (x)
      009B52 A4 FE            [ 1] 1978 	and	a, #0xfe
      009B54 90 95            [ 1] 1979 	ld	yh, a
      009B56 4F               [ 1] 1980 	clr	a
      009B57 90 97            [ 1] 1981 	ld	yl, a
      009B59 02               [ 1] 1982 	rlwa	x
      009B5A 6B 19            [ 1] 1983 	ld	(0x19, sp), a
      009B5C 01               [ 1] 1984 	rrwa	x
      009B5D 9F               [ 1] 1985 	ld	a, xl
      009B5E 1E 13            [ 2] 1986 	ldw	x, (0x13, sp)
      009B60 EF 02            [ 2] 1987 	ldw	(0x2, x), y
      009B62 E7 01            [ 1] 1988 	ld	(0x1, x), a
      009B64 7B 19            [ 1] 1989 	ld	a, (0x19, sp)
      009B66 F7               [ 1] 1990 	ld	(x), a
      009B67                       1991 00112$:
                                   1992 ;	../src/pff.c: 1012: remain = fs->fsize - fs->fptr;
      009B67 1E 07            [ 2] 1993 	ldw	x, (0x07, sp)
      009B69 90 93            [ 1] 1994 	ldw	y, x
      009B6B 90 EE 1C         [ 2] 1995 	ldw	y, (0x1c, y)
      009B6E EE 1A            [ 2] 1996 	ldw	x, (0x1a, x)
      009B70 1F 15            [ 2] 1997 	ldw	(0x15, sp), x
      009B72 1E 13            [ 2] 1998 	ldw	x, (0x13, sp)
      009B74 1F 0D            [ 2] 1999 	ldw	(0x0d, sp), x
      009B76 1E 13            [ 2] 2000 	ldw	x, (0x13, sp)
      009B78 E6 03            [ 1] 2001 	ld	a, (0x3, x)
      009B7A 6B 1C            [ 1] 2002 	ld	(0x1c, sp), a
      009B7C E6 02            [ 1] 2003 	ld	a, (0x2, x)
      009B7E 6B 1B            [ 1] 2004 	ld	(0x1b, sp), a
      009B80 FE               [ 2] 2005 	ldw	x, (x)
      009B81 1F 19            [ 2] 2006 	ldw	(0x19, sp), x
      009B83 72 F2 1B         [ 2] 2007 	subw	y, (0x1b, sp)
      009B86 7B 16            [ 1] 2008 	ld	a, (0x16, sp)
      009B88 12 1A            [ 1] 2009 	sbc	a, (0x1a, sp)
      009B8A 97               [ 1] 2010 	ld	xl, a
      009B8B 7B 15            [ 1] 2011 	ld	a, (0x15, sp)
      009B8D 12 19            [ 1] 2012 	sbc	a, (0x19, sp)
      009B8F 17 17            [ 2] 2013 	ldw	(0x17, sp), y
      009B91 95               [ 1] 2014 	ld	xh, a
                                   2015 ;	../src/pff.c: 1013: if (btw > remain) btw = (UINT)remain;			/* Truncate btw by remaining bytes */
      009B92 16 21            [ 2] 2016 	ldw	y, (0x21, sp)
      009B94 17 1B            [ 2] 2017 	ldw	(0x1b, sp), y
      009B96 0F 1A            [ 1] 2018 	clr	(0x1a, sp)
      009B98 0F 19            [ 1] 2019 	clr	(0x19, sp)
      009B9A 7B 18            [ 1] 2020 	ld	a, (0x18, sp)
      009B9C 11 1C            [ 1] 2021 	cp	a, (0x1c, sp)
      009B9E 7B 17            [ 1] 2022 	ld	a, (0x17, sp)
      009BA0 12 1B            [ 1] 2023 	sbc	a, (0x1b, sp)
      009BA2 9F               [ 1] 2024 	ld	a, xl
      009BA3 12 1A            [ 1] 2025 	sbc	a, (0x1a, sp)
      009BA5 9E               [ 1] 2026 	ld	a, xh
      009BA6 12 19            [ 1] 2027 	sbc	a, (0x19, sp)
      009BA8 24 04            [ 1] 2028 	jrnc	00157$
      009BAA 1E 17            [ 2] 2029 	ldw	x, (0x17, sp)
      009BAC 1F 21            [ 2] 2030 	ldw	(0x21, sp), x
                                   2031 ;	../src/pff.c: 1015: while (btw)	{									/* Repeat until all data transferred */
      009BAE                       2032 00157$:
      009BAE 1E 07            [ 2] 2033 	ldw	x, (0x07, sp)
      009BB0 1C 00 22         [ 2] 2034 	addw	x, #0x0022
      009BB3 1F 0F            [ 2] 2035 	ldw	(0x0f, sp), x
      009BB5 16 07            [ 2] 2036 	ldw	y, (0x07, sp)
      009BB7 17 11            [ 2] 2037 	ldw	(0x11, sp), y
      009BB9 16 07            [ 2] 2038 	ldw	y, (0x07, sp)
      009BBB 17 13            [ 2] 2039 	ldw	(0x13, sp), y
      009BBD                       2040 00136$:
      009BBD 1E 21            [ 2] 2041 	ldw	x, (0x21, sp)
      009BBF 26 03            [ 1] 2042 	jrne	00243$
      009BC1 CC 9D 52         [ 2] 2043 	jp	00138$
      009BC4                       2044 00243$:
                                   2045 ;	../src/pff.c: 1016: if ((UINT)fs->fptr % 512 == 0) {			/* On the sector boundary? */
      009BC4 1E 0D            [ 2] 2046 	ldw	x, (0x0d, sp)
      009BC6 90 93            [ 1] 2047 	ldw	y, x
      009BC8 90 EE 02         [ 2] 2048 	ldw	y, (0x2, y)
      009BCB 17 1A            [ 2] 2049 	ldw	(0x1a, sp), y
      009BCD FE               [ 2] 2050 	ldw	x, (x)
      009BCE 1F 18            [ 2] 2051 	ldw	(0x18, sp), x
      009BD0 1E 1A            [ 2] 2052 	ldw	x, (0x1a, sp)
      009BD2 9E               [ 1] 2053 	ld	a, xh
      009BD3 A4 01            [ 1] 2054 	and	a, #0x01
      009BD5 95               [ 1] 2055 	ld	xh, a
      009BD6 5D               [ 2] 2056 	tnzw	x
      009BD7 27 03            [ 1] 2057 	jreq	00244$
      009BD9 CC 9C A3         [ 2] 2058 	jp	00127$
      009BDC                       2059 00244$:
                                   2060 ;	../src/pff.c: 1017: cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
      009BDC 7B 18            [ 1] 2061 	ld	a, (0x18, sp)
      009BDE 6B 02            [ 1] 2062 	ld	(0x02, sp), a
      009BE0 1E 19            [ 2] 2063 	ldw	x, (0x19, sp)
      009BE2 0F 01            [ 1] 2064 	clr	(0x01, sp)
      009BE4 04 02            [ 1] 2065 	srl	(0x02, sp)
      009BE6 56               [ 2] 2066 	rrcw	x
      009BE7 16 13            [ 2] 2067 	ldw	y, (0x13, sp)
      009BE9 90 E6 02         [ 1] 2068 	ld	a, (0x2, y)
      009BEC 4A               [ 1] 2069 	dec	a
      009BED 89               [ 2] 2070 	pushw	x
      009BEE 14 02            [ 1] 2071 	and	a, (2, sp)
      009BF0 85               [ 2] 2072 	popw	x
                                   2073 ;	../src/pff.c: 1018: if (!cs) {								/* On the cluster boundary? */
      009BF1 6B 1C            [ 1] 2074 	ld	(0x1c, sp), a
      009BF3 26 48            [ 1] 2075 	jrne	00121$
                                   2076 ;	../src/pff.c: 1019: if (fs->fptr == 0) {				/* On the top of the file? */
      009BF5 1E 1A            [ 2] 2077 	ldw	x, (0x1a, sp)
      009BF7 26 13            [ 1] 2078 	jrne	00116$
      009BF9 1E 18            [ 2] 2079 	ldw	x, (0x18, sp)
      009BFB 26 0F            [ 1] 2080 	jrne	00116$
                                   2081 ;	../src/pff.c: 1020: clst = fs->org_clust;
      009BFD 1E 11            [ 2] 2082 	ldw	x, (0x11, sp)
      009BFF 90 93            [ 1] 2083 	ldw	y, x
      009C01 90 EE 20         [ 2] 2084 	ldw	y, (0x20, y)
      009C04 EE 1E            [ 2] 2085 	ldw	x, (0x1e, x)
      009C06 17 1A            [ 2] 2086 	ldw	(0x1a, sp), y
      009C08 1F 18            [ 2] 2087 	ldw	(0x18, sp), x
      009C0A 20 14            [ 2] 2088 	jra	00117$
      009C0C                       2089 00116$:
                                   2090 ;	../src/pff.c: 1022: clst = get_fat(fs->curr_clust);
      009C0C 1E 0F            [ 2] 2091 	ldw	x, (0x0f, sp)
      009C0E 90 93            [ 1] 2092 	ldw	y, x
      009C10 90 EE 02         [ 2] 2093 	ldw	y, (0x2, y)
      009C13 FE               [ 2] 2094 	ldw	x, (x)
      009C14 90 89            [ 2] 2095 	pushw	y
      009C16 89               [ 2] 2096 	pushw	x
      009C17 CD 91 2B         [ 4] 2097 	call	_get_fat
      009C1A 5B 04            [ 2] 2098 	addw	sp, #4
      009C1C 17 18            [ 2] 2099 	ldw	(0x18, sp), y
      009C1E 1F 1A            [ 2] 2100 	ldw	(0x1a, sp), x
      009C20                       2101 00117$:
                                   2102 ;	../src/pff.c: 1024: if (clst <= 1) ABORT(FR_DISK_ERR);
      009C20 5F               [ 1] 2103 	clrw	x
      009C21 5C               [ 1] 2104 	incw	x
      009C22 13 1A            [ 2] 2105 	cpw	x, (0x1a, sp)
      009C24 4F               [ 1] 2106 	clr	a
      009C25 12 19            [ 1] 2107 	sbc	a, (0x19, sp)
      009C27 4F               [ 1] 2108 	clr	a
      009C28 12 18            [ 1] 2109 	sbc	a, (0x18, sp)
      009C2A 25 08            [ 1] 2110 	jrc	00119$
      009C2C 1E 0B            [ 2] 2111 	ldw	x, (0x0b, sp)
      009C2E 7F               [ 1] 2112 	clr	(x)
      009C2F A6 01            [ 1] 2113 	ld	a, #0x01
      009C31 CC 9D 53         [ 2] 2114 	jp	00139$
      009C34                       2115 00119$:
                                   2116 ;	../src/pff.c: 1025: fs->curr_clust = clst;				/* Update current cluster */
      009C34 1E 0F            [ 2] 2117 	ldw	x, (0x0f, sp)
      009C36 16 1A            [ 2] 2118 	ldw	y, (0x1a, sp)
      009C38 EF 02            [ 2] 2119 	ldw	(0x2, x), y
      009C3A 16 18            [ 2] 2120 	ldw	y, (0x18, sp)
      009C3C FF               [ 2] 2121 	ldw	(x), y
      009C3D                       2122 00121$:
                                   2123 ;	../src/pff.c: 1027: sect = clust2sect(fs->curr_clust);		/* Get current sector */
      009C3D 1E 0F            [ 2] 2124 	ldw	x, (0x0f, sp)
      009C3F 90 93            [ 1] 2125 	ldw	y, x
      009C41 90 EE 02         [ 2] 2126 	ldw	y, (0x2, y)
      009C44 FE               [ 2] 2127 	ldw	x, (x)
      009C45 90 89            [ 2] 2128 	pushw	y
      009C47 89               [ 2] 2129 	pushw	x
      009C48 CD 91 D2         [ 4] 2130 	call	_clust2sect
      009C4B 5B 04            [ 2] 2131 	addw	sp, #4
      009C4D 1F 03            [ 2] 2132 	ldw	(0x03, sp), x
      009C4F 17 01            [ 2] 2133 	ldw	(0x01, sp), y
                                   2134 ;	../src/pff.c: 1028: if (!sect) ABORT(FR_DISK_ERR);
      009C51 5D               [ 2] 2135 	tnzw	x
      009C52 26 0C            [ 1] 2136 	jrne	00123$
      009C54 90 5D            [ 2] 2137 	tnzw	y
      009C56 26 08            [ 1] 2138 	jrne	00123$
      009C58 1E 0B            [ 2] 2139 	ldw	x, (0x0b, sp)
      009C5A 7F               [ 1] 2140 	clr	(x)
      009C5B A6 01            [ 1] 2141 	ld	a, #0x01
      009C5D CC 9D 53         [ 2] 2142 	jp	00139$
      009C60                       2143 00123$:
                                   2144 ;	../src/pff.c: 1029: fs->dsect = sect + cs;
      009C60 1E 07            [ 2] 2145 	ldw	x, (0x07, sp)
      009C62 1C 00 26         [ 2] 2146 	addw	x, #0x0026
      009C65 90 5F            [ 1] 2147 	clrw	y
      009C67 7B 1C            [ 1] 2148 	ld	a, (0x1c, sp)
      009C69 90 97            [ 1] 2149 	ld	yl, a
      009C6B 4F               [ 1] 2150 	clr	a
      009C6C 0F 15            [ 1] 2151 	clr	(0x15, sp)
      009C6E 72 F9 03         [ 2] 2152 	addw	y, (0x03, sp)
      009C71 19 02            [ 1] 2153 	adc	a, (0x02, sp)
      009C73 6B 1A            [ 1] 2154 	ld	(0x1a, sp), a
      009C75 7B 15            [ 1] 2155 	ld	a, (0x15, sp)
      009C77 19 01            [ 1] 2156 	adc	a, (0x01, sp)
      009C79 6B 19            [ 1] 2157 	ld	(0x19, sp), a
      009C7B EF 02            [ 2] 2158 	ldw	(0x2, x), y
      009C7D 7B 1A            [ 1] 2159 	ld	a, (0x1a, sp)
      009C7F E7 01            [ 1] 2160 	ld	(0x1, x), a
      009C81 7B 19            [ 1] 2161 	ld	a, (0x19, sp)
      009C83 F7               [ 1] 2162 	ld	(x), a
                                   2163 ;	../src/pff.c: 1030: if (disk_writep(0, fs->dsect)) ABORT(FR_DISK_ERR);	/* Initiate a sector write operation */
      009C84 90 89            [ 2] 2164 	pushw	y
      009C86 1E 1B            [ 2] 2165 	ldw	x, (0x1b, sp)
      009C88 89               [ 2] 2166 	pushw	x
      009C89 5F               [ 1] 2167 	clrw	x
      009C8A 89               [ 2] 2168 	pushw	x
      009C8B CD 83 64         [ 4] 2169 	call	_disk_writep
      009C8E 5B 06            [ 2] 2170 	addw	sp, #6
      009C90 4D               [ 1] 2171 	tnz	a
      009C91 27 08            [ 1] 2172 	jreq	00125$
      009C93 1E 0B            [ 2] 2173 	ldw	x, (0x0b, sp)
      009C95 7F               [ 1] 2174 	clr	(x)
      009C96 A6 01            [ 1] 2175 	ld	a, #0x01
      009C98 CC 9D 53         [ 2] 2176 	jp	00139$
      009C9B                       2177 00125$:
                                   2178 ;	../src/pff.c: 1031: fs->flag |= FA__WIP;
      009C9B 1E 0B            [ 2] 2179 	ldw	x, (0x0b, sp)
      009C9D F6               [ 1] 2180 	ld	a, (x)
      009C9E AA 40            [ 1] 2181 	or	a, #0x40
      009CA0 1E 0B            [ 2] 2182 	ldw	x, (0x0b, sp)
      009CA2 F7               [ 1] 2183 	ld	(x), a
      009CA3                       2184 00127$:
                                   2185 ;	../src/pff.c: 1033: wcnt = 512 - (UINT)fs->fptr % 512;			/* Number of bytes to write to the sector */
      009CA3 1E 0D            [ 2] 2186 	ldw	x, (0x0d, sp)
      009CA5 EE 02            [ 2] 2187 	ldw	x, (0x2, x)
      009CA7 9E               [ 1] 2188 	ld	a, xh
      009CA8 A4 01            [ 1] 2189 	and	a, #0x01
      009CAA 6B 1B            [ 1] 2190 	ld	(0x1b, sp), a
      009CAC 9F               [ 1] 2191 	ld	a, xl
      009CAD 40               [ 1] 2192 	neg	a
      009CAE 97               [ 1] 2193 	ld	xl, a
      009CAF A6 02            [ 1] 2194 	ld	a, #0x02
      009CB1 12 1B            [ 1] 2195 	sbc	a, (0x1b, sp)
      009CB3 95               [ 1] 2196 	ld	xh, a
                                   2197 ;	../src/pff.c: 1034: if (wcnt > btw) wcnt = btw;
      009CB4 1F 15            [ 2] 2198 	ldw	(0x15, sp), x
      009CB6 13 21            [ 2] 2199 	cpw	x, (0x21, sp)
      009CB8 23 04            [ 2] 2200 	jrule	00129$
      009CBA 16 21            [ 2] 2201 	ldw	y, (0x21, sp)
      009CBC 17 15            [ 2] 2202 	ldw	(0x15, sp), y
      009CBE                       2203 00129$:
                                   2204 ;	../src/pff.c: 1035: if (disk_writep(p, wcnt)) ABORT(FR_DISK_ERR);	/* Send data to the sector */
      009CBE 16 15            [ 2] 2205 	ldw	y, (0x15, sp)
      009CC0 17 03            [ 2] 2206 	ldw	(0x03, sp), y
      009CC2 0F 02            [ 1] 2207 	clr	(0x02, sp)
      009CC4 0F 01            [ 1] 2208 	clr	(0x01, sp)
      009CC6 1E 03            [ 2] 2209 	ldw	x, (0x03, sp)
      009CC8 89               [ 2] 2210 	pushw	x
      009CC9 1E 03            [ 2] 2211 	ldw	x, (0x03, sp)
      009CCB 89               [ 2] 2212 	pushw	x
      009CCC 1E 09            [ 2] 2213 	ldw	x, (0x09, sp)
      009CCE 89               [ 2] 2214 	pushw	x
      009CCF CD 83 64         [ 4] 2215 	call	_disk_writep
      009CD2 5B 06            [ 2] 2216 	addw	sp, #6
      009CD4 4D               [ 1] 2217 	tnz	a
      009CD5 27 07            [ 1] 2218 	jreq	00131$
      009CD7 1E 0B            [ 2] 2219 	ldw	x, (0x0b, sp)
      009CD9 7F               [ 1] 2220 	clr	(x)
      009CDA A6 01            [ 1] 2221 	ld	a, #0x01
      009CDC 20 75            [ 2] 2222 	jra	00139$
      009CDE                       2223 00131$:
                                   2224 ;	../src/pff.c: 1036: fs->fptr += wcnt; p += wcnt;				/* Update pointers and counters */
      009CDE 1E 0D            [ 2] 2225 	ldw	x, (0x0d, sp)
      009CE0 90 93            [ 1] 2226 	ldw	y, x
      009CE2 90 EE 02         [ 2] 2227 	ldw	y, (0x2, y)
      009CE5 E6 01            [ 1] 2228 	ld	a, (0x1, x)
      009CE7 88               [ 1] 2229 	push	a
      009CE8 F6               [ 1] 2230 	ld	a, (x)
      009CE9 97               [ 1] 2231 	ld	xl, a
      009CEA 84               [ 1] 2232 	pop	a
      009CEB 72 F9 03         [ 2] 2233 	addw	y, (0x03, sp)
      009CEE 17 19            [ 2] 2234 	ldw	(0x19, sp), y
      009CF0 19 02            [ 1] 2235 	adc	a, (0x02, sp)
      009CF2 6B 18            [ 1] 2236 	ld	(0x18, sp), a
      009CF4 9F               [ 1] 2237 	ld	a, xl
      009CF5 19 01            [ 1] 2238 	adc	a, (0x01, sp)
      009CF7 6B 17            [ 1] 2239 	ld	(0x17, sp), a
      009CF9 1E 0D            [ 2] 2240 	ldw	x, (0x0d, sp)
      009CFB 16 19            [ 2] 2241 	ldw	y, (0x19, sp)
      009CFD EF 02            [ 2] 2242 	ldw	(0x2, x), y
      009CFF 16 17            [ 2] 2243 	ldw	y, (0x17, sp)
      009D01 FF               [ 2] 2244 	ldw	(x), y
      009D02 1E 05            [ 2] 2245 	ldw	x, (0x05, sp)
      009D04 72 FB 15         [ 2] 2246 	addw	x, (0x15, sp)
      009D07 1F 05            [ 2] 2247 	ldw	(0x05, sp), x
                                   2248 ;	../src/pff.c: 1037: btw -= wcnt; *bw += wcnt;
      009D09 1E 21            [ 2] 2249 	ldw	x, (0x21, sp)
      009D0B 72 F0 15         [ 2] 2250 	subw	x, (0x15, sp)
      009D0E 1F 21            [ 2] 2251 	ldw	(0x21, sp), x
      009D10 1E 09            [ 2] 2252 	ldw	x, (0x09, sp)
      009D12 FE               [ 2] 2253 	ldw	x, (x)
      009D13 72 FB 15         [ 2] 2254 	addw	x, (0x15, sp)
      009D16 1F 1B            [ 2] 2255 	ldw	(0x1b, sp), x
      009D18 1E 09            [ 2] 2256 	ldw	x, (0x09, sp)
      009D1A 16 1B            [ 2] 2257 	ldw	y, (0x1b, sp)
      009D1C FF               [ 2] 2258 	ldw	(x), y
                                   2259 ;	../src/pff.c: 1038: if ((UINT)fs->fptr % 512 == 0) {
      009D1D 16 19            [ 2] 2260 	ldw	y, (0x19, sp)
      009D1F 17 1B            [ 2] 2261 	ldw	(0x1b, sp), y
      009D21 7B 1C            [ 1] 2262 	ld	a, (0x1c, sp)
      009D23 6B 1A            [ 1] 2263 	ld	(0x1a, sp), a
      009D25 7B 1B            [ 1] 2264 	ld	a, (0x1b, sp)
      009D27 A4 01            [ 1] 2265 	and	a, #0x01
      009D29 6B 19            [ 1] 2266 	ld	(0x19, sp), a
      009D2B 1E 19            [ 2] 2267 	ldw	x, (0x19, sp)
      009D2D 27 03            [ 1] 2268 	jreq	00254$
      009D2F CC 9B BD         [ 2] 2269 	jp	00136$
      009D32                       2270 00254$:
                                   2271 ;	../src/pff.c: 1039: if (disk_writep(0, 0)) ABORT(FR_DISK_ERR);	/* Finalize the currtent secter write operation */
      009D32 5F               [ 1] 2272 	clrw	x
      009D33 89               [ 2] 2273 	pushw	x
      009D34 5F               [ 1] 2274 	clrw	x
      009D35 89               [ 2] 2275 	pushw	x
      009D36 5F               [ 1] 2276 	clrw	x
      009D37 89               [ 2] 2277 	pushw	x
      009D38 CD 83 64         [ 4] 2278 	call	_disk_writep
      009D3B 5B 06            [ 2] 2279 	addw	sp, #6
      009D3D 4D               [ 1] 2280 	tnz	a
      009D3E 27 07            [ 1] 2281 	jreq	00133$
      009D40 1E 0B            [ 2] 2282 	ldw	x, (0x0b, sp)
      009D42 7F               [ 1] 2283 	clr	(x)
      009D43 A6 01            [ 1] 2284 	ld	a, #0x01
      009D45 20 0C            [ 2] 2285 	jra	00139$
      009D47                       2286 00133$:
                                   2287 ;	../src/pff.c: 1040: fs->flag &= ~FA__WIP;
      009D47 1E 0B            [ 2] 2288 	ldw	x, (0x0b, sp)
      009D49 F6               [ 1] 2289 	ld	a, (x)
      009D4A A4 BF            [ 1] 2290 	and	a, #0xbf
      009D4C 1E 0B            [ 2] 2291 	ldw	x, (0x0b, sp)
      009D4E F7               [ 1] 2292 	ld	(x), a
      009D4F CC 9B BD         [ 2] 2293 	jp	00136$
      009D52                       2294 00138$:
                                   2295 ;	../src/pff.c: 1044: return FR_OK;
      009D52 4F               [ 1] 2296 	clr	a
      009D53                       2297 00139$:
                                   2298 ;	../src/pff.c: 1045: }
      009D53 5B 1C            [ 2] 2299 	addw	sp, #28
      009D55 81               [ 4] 2300 	ret
                                   2301 	.area CODE
                                   2302 	.area CONST
                                   2303 	.area INITIALIZER
                                   2304 	.area CABS (ABS)
