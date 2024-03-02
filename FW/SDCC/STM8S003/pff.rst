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
      009037                         61 _ld_word:
      009037 89               [ 2]   62 	pushw	x
                                     63 ;	../src/pff.c: 388: rv = ptr[1];
      009038 1E 05            [ 2]   64 	ldw	x, (0x05, sp)
      00903A E6 01            [ 1]   65 	ld	a, (0x1, x)
                                     66 ;	../src/pff.c: 389: rv = rv << 8 | ptr[0];
      00903C 6B 01            [ 1]   67 	ld	(0x01, sp), a
      00903E 0F 02            [ 1]   68 	clr	(0x02, sp)
      009040 1E 05            [ 2]   69 	ldw	x, (0x05, sp)
      009042 F6               [ 1]   70 	ld	a, (x)
      009043 5F               [ 1]   71 	clrw	x
      009044 1A 02            [ 1]   72 	or	a, (0x02, sp)
      009046 02               [ 1]   73 	rlwa	x
      009047 1A 01            [ 1]   74 	or	a, (0x01, sp)
                                     75 ;	../src/pff.c: 390: return rv;
      009049 95               [ 1]   76 	ld	xh, a
                                     77 ;	../src/pff.c: 391: }
      00904A 5B 02            [ 2]   78 	addw	sp, #2
      00904C 81               [ 4]   79 	ret
                                     80 ;	../src/pff.c: 393: static DWORD ld_dword (const BYTE* ptr)	/* Load a 4-byte little-endian word */
                                     81 ;	-----------------------------------------
                                     82 ;	 function ld_dword
                                     83 ;	-----------------------------------------
      00904D                         84 _ld_dword:
      00904D 52 08            [ 2]   85 	sub	sp, #8
                                     86 ;	../src/pff.c: 397: rv = ptr[3];
      00904F 1E 0B            [ 2]   87 	ldw	x, (0x0b, sp)
      009051 E6 03            [ 1]   88 	ld	a, (0x3, x)
      009053 5F               [ 1]   89 	clrw	x
      009054 90 5F            [ 1]   90 	clrw	y
      009056 97               [ 1]   91 	ld	xl, a
                                     92 ;	../src/pff.c: 398: rv = rv << 8 | ptr[2];
      009057 1F 02            [ 2]   93 	ldw	(0x02, sp), x
      009059 0F 04            [ 1]   94 	clr	(0x04, sp)
      00905B 1E 0B            [ 2]   95 	ldw	x, (0x0b, sp)
      00905D E6 02            [ 1]   96 	ld	a, (0x2, x)
      00905F 0F 07            [ 1]   97 	clr	(0x07, sp)
      009061 5F               [ 1]   98 	clrw	x
      009062 0F 05            [ 1]   99 	clr	(0x05, sp)
      009064 1A 04            [ 1]  100 	or	a, (0x04, sp)
      009066 95               [ 1]  101 	ld	xh, a
      009067 7B 03            [ 1]  102 	ld	a, (0x03, sp)
      009069 1A 07            [ 1]  103 	or	a, (0x07, sp)
      00906B 90 95            [ 1]  104 	ld	yh, a
      00906D 89               [ 2]  105 	pushw	x
      00906E 7B 04            [ 1]  106 	ld	a, (0x04, sp)
      009070 1A 02            [ 1]  107 	or	a, (2, sp)
      009072 85               [ 2]  108 	popw	x
      009073 97               [ 1]  109 	ld	xl, a
      009074 90 9F            [ 1]  110 	ld	a, yl
      009076 1A 05            [ 1]  111 	or	a, (0x05, sp)
      009078 01               [ 1]  112 	rrwa	x
                                    113 ;	../src/pff.c: 399: rv = rv << 8 | ptr[1];
      009079 6B 01            [ 1]  114 	ld	(0x01, sp), a
      00907B 61               [ 1]  115 	exg	a, yl
      00907C 9F               [ 1]  116 	ld	a, xl
      00907D 61               [ 1]  117 	exg	a, yl
      00907E 0F 04            [ 1]  118 	clr	(0x04, sp)
      009080 1E 0B            [ 2]  119 	ldw	x, (0x0b, sp)
      009082 E6 01            [ 1]  120 	ld	a, (0x1, x)
      009084 5F               [ 1]  121 	clrw	x
      009085 0F 06            [ 1]  122 	clr	(0x06, sp)
      009087 0F 05            [ 1]  123 	clr	(0x05, sp)
      009089 1A 04            [ 1]  124 	or	a, (0x04, sp)
      00908B 97               [ 1]  125 	ld	xl, a
      00908C 89               [ 2]  126 	pushw	x
      00908D 90 9F            [ 1]  127 	ld	a, yl
      00908F 1A 01            [ 1]  128 	or	a, (1, sp)
      009091 85               [ 2]  129 	popw	x
      009092 95               [ 1]  130 	ld	xh, a
      009093 90 9E            [ 1]  131 	ld	a, yh
      009095 1A 06            [ 1]  132 	or	a, (0x06, sp)
      009097 90 97            [ 1]  133 	ld	yl, a
                                    134 ;	../src/pff.c: 400: rv = rv << 8 | ptr[0];
      009099 1F 02            [ 2]  135 	ldw	(0x02, sp), x
      00909B 0F 04            [ 1]  136 	clr	(0x04, sp)
      00909D 1E 0B            [ 2]  137 	ldw	x, (0x0b, sp)
      00909F F6               [ 1]  138 	ld	a, (x)
      0090A0 0F 07            [ 1]  139 	clr	(0x07, sp)
      0090A2 5F               [ 1]  140 	clrw	x
      0090A3 0F 05            [ 1]  141 	clr	(0x05, sp)
      0090A5 1A 04            [ 1]  142 	or	a, (0x04, sp)
      0090A7 95               [ 1]  143 	ld	xh, a
      0090A8 7B 03            [ 1]  144 	ld	a, (0x03, sp)
      0090AA 1A 07            [ 1]  145 	or	a, (0x07, sp)
      0090AC 90 95            [ 1]  146 	ld	yh, a
      0090AE 89               [ 2]  147 	pushw	x
      0090AF 7B 04            [ 1]  148 	ld	a, (0x04, sp)
      0090B1 1A 02            [ 1]  149 	or	a, (2, sp)
      0090B3 85               [ 2]  150 	popw	x
      0090B4 97               [ 1]  151 	ld	xl, a
      0090B5 90 9F            [ 1]  152 	ld	a, yl
      0090B7 1A 05            [ 1]  153 	or	a, (0x05, sp)
      0090B9 61               [ 1]  154 	exg	a, yl
      0090BA 9E               [ 1]  155 	ld	a, xh
      0090BB 61               [ 1]  156 	exg	a, yl
      0090BC 95               [ 1]  157 	ld	xh, a
                                    158 ;	../src/pff.c: 401: return rv;
      0090BD 51               [ 1]  159 	exgw	x, y
                                    160 ;	../src/pff.c: 402: }
      0090BE 5B 08            [ 2]  161 	addw	sp, #8
      0090C0 81               [ 4]  162 	ret
                                    163 ;	../src/pff.c: 411: static void mem_set (void* dst, int val, int cnt) {
                                    164 ;	-----------------------------------------
                                    165 ;	 function mem_set
                                    166 ;	-----------------------------------------
      0090C1                        167 _mem_set:
      0090C1 89               [ 2]  168 	pushw	x
                                    169 ;	../src/pff.c: 412: char *d = (char*)dst;
      0090C2 1E 05            [ 2]  170 	ldw	x, (0x05, sp)
                                    171 ;	../src/pff.c: 413: while (cnt--) *d++ = (char)val;
      0090C4 1F 01            [ 2]  172 	ldw	(0x01, sp), x
      0090C6 16 09            [ 2]  173 	ldw	y, (0x09, sp)
      0090C8                        174 00101$:
      0090C8 93               [ 1]  175 	ldw	x, y
      0090C9 90 5A            [ 2]  176 	decw	y
      0090CB 5D               [ 2]  177 	tnzw	x
      0090CC 27 0C            [ 1]  178 	jreq	00104$
      0090CE 7B 08            [ 1]  179 	ld	a, (0x08, sp)
      0090D0 1E 01            [ 2]  180 	ldw	x, (0x01, sp)
      0090D2 F7               [ 1]  181 	ld	(x), a
      0090D3 1E 01            [ 2]  182 	ldw	x, (0x01, sp)
      0090D5 5C               [ 1]  183 	incw	x
      0090D6 1F 01            [ 2]  184 	ldw	(0x01, sp), x
      0090D8 20 EE            [ 2]  185 	jra	00101$
      0090DA                        186 00104$:
                                    187 ;	../src/pff.c: 414: }
      0090DA 85               [ 2]  188 	popw	x
      0090DB 81               [ 4]  189 	ret
                                    190 ;	../src/pff.c: 417: static int mem_cmp (const void* dst, const void* src, int cnt) {
                                    191 ;	-----------------------------------------
                                    192 ;	 function mem_cmp
                                    193 ;	-----------------------------------------
      0090DC                        194 _mem_cmp:
      0090DC 52 0A            [ 2]  195 	sub	sp, #10
                                    196 ;	../src/pff.c: 418: const char *d = (const char *)dst, *s = (const char *)src;
      0090DE 16 0D            [ 2]  197 	ldw	y, (0x0d, sp)
      0090E0 1E 0F            [ 2]  198 	ldw	x, (0x0f, sp)
                                    199 ;	../src/pff.c: 419: int r = 0;
      0090E2 0F 02            [ 1]  200 	clr	(0x02, sp)
      0090E4 0F 01            [ 1]  201 	clr	(0x01, sp)
                                    202 ;	../src/pff.c: 420: while (cnt-- && (r = *d++ - *s++) == 0) ;
      0090E6 17 05            [ 2]  203 	ldw	(0x05, sp), y
      0090E8 1F 07            [ 2]  204 	ldw	(0x07, sp), x
      0090EA 16 11            [ 2]  205 	ldw	y, (0x11, sp)
      0090EC 17 09            [ 2]  206 	ldw	(0x09, sp), y
      0090EE                        207 00102$:
      0090EE 16 09            [ 2]  208 	ldw	y, (0x09, sp)
      0090F0 17 03            [ 2]  209 	ldw	(0x03, sp), y
      0090F2 1E 09            [ 2]  210 	ldw	x, (0x09, sp)
      0090F4 5A               [ 2]  211 	decw	x
      0090F5 1F 09            [ 2]  212 	ldw	(0x09, sp), x
      0090F7 1E 03            [ 2]  213 	ldw	x, (0x03, sp)
      0090F9 27 20            [ 1]  214 	jreq	00104$
      0090FB 1E 05            [ 2]  215 	ldw	x, (0x05, sp)
      0090FD F6               [ 1]  216 	ld	a, (x)
      0090FE 1E 05            [ 2]  217 	ldw	x, (0x05, sp)
      009100 5C               [ 1]  218 	incw	x
      009101 1F 05            [ 2]  219 	ldw	(0x05, sp), x
      009103 5F               [ 1]  220 	clrw	x
      009104 97               [ 1]  221 	ld	xl, a
      009105 16 07            [ 2]  222 	ldw	y, (0x07, sp)
      009107 90 F6            [ 1]  223 	ld	a, (y)
      009109 16 07            [ 2]  224 	ldw	y, (0x07, sp)
      00910B 90 5C            [ 1]  225 	incw	y
      00910D 17 07            [ 2]  226 	ldw	(0x07, sp), y
      00910F 6B 04            [ 1]  227 	ld	(0x04, sp), a
      009111 0F 03            [ 1]  228 	clr	(0x03, sp)
      009113 72 F0 03         [ 2]  229 	subw	x, (0x03, sp)
      009116 1F 01            [ 2]  230 	ldw	(0x01, sp), x
      009118 5D               [ 2]  231 	tnzw	x
      009119 27 D3            [ 1]  232 	jreq	00102$
      00911B                        233 00104$:
                                    234 ;	../src/pff.c: 421: return r;
      00911B 1E 01            [ 2]  235 	ldw	x, (0x01, sp)
                                    236 ;	../src/pff.c: 422: }
      00911D 5B 0A            [ 2]  237 	addw	sp, #10
      00911F 81               [ 4]  238 	ret
                                    239 ;	../src/pff.c: 430: static CLUST get_fat (	/* 1:IO error, Else:Cluster status */
                                    240 ;	-----------------------------------------
                                    241 ;	 function get_fat
                                    242 ;	-----------------------------------------
      009120                        243 _get_fat:
      009120 52 12            [ 2]  244 	sub	sp, #18
                                    245 ;	../src/pff.c: 435: FATFS *fs = FatFs;
      009122 90 CE 02 67      [ 2]  246 	ldw	y, _FatFs+0
                                    247 ;	../src/pff.c: 440: if (clst < 2 || clst >= fs->n_fatent) return 1;	/* Range check */
      009126 1E 17            [ 2]  248 	ldw	x, (0x17, sp)
      009128 A3 00 02         [ 2]  249 	cpw	x, #0x0002
      00912B 7B 16            [ 1]  250 	ld	a, (0x16, sp)
      00912D A2 00            [ 1]  251 	sbc	a, #0x00
      00912F 7B 15            [ 1]  252 	ld	a, (0x15, sp)
      009131 A2 00            [ 1]  253 	sbc	a, #0x00
      009133 25 1B            [ 1]  254 	jrc	00101$
      009135 93               [ 1]  255 	ldw	x, y
      009136 E6 09            [ 1]  256 	ld	a, (0x9, x)
      009138 6B 12            [ 1]  257 	ld	(0x12, sp), a
      00913A E6 08            [ 1]  258 	ld	a, (0x8, x)
      00913C 6B 11            [ 1]  259 	ld	(0x11, sp), a
      00913E EE 06            [ 2]  260 	ldw	x, (0x6, x)
      009140 1F 0F            [ 2]  261 	ldw	(0x0f, sp), x
      009142 1E 17            [ 2]  262 	ldw	x, (0x17, sp)
      009144 13 11            [ 2]  263 	cpw	x, (0x11, sp)
      009146 7B 16            [ 1]  264 	ld	a, (0x16, sp)
      009148 12 10            [ 1]  265 	sbc	a, (0x10, sp)
      00914A 7B 15            [ 1]  266 	ld	a, (0x15, sp)
      00914C 12 0F            [ 1]  267 	sbc	a, (0x0f, sp)
      00914E 25 06            [ 1]  268 	jrc	00102$
      009150                        269 00101$:
      009150 5F               [ 1]  270 	clrw	x
      009151 5C               [ 1]  271 	incw	x
      009152 90 5F            [ 1]  272 	clrw	y
      009154 20 6E            [ 2]  273 	jra	00108$
      009156                        274 00102$:
                                    275 ;	../src/pff.c: 442: switch (fs->fs_type) {
      009156 90 F6            [ 1]  276 	ld	a, (y)
      009158 A1 03            [ 1]  277 	cp	a, #0x03
      00915A 26 64            [ 1]  278 	jrne	00107$
                                    279 ;	../src/pff.c: 464: if (disk_readp(buf, fs->fatbase + clst / 128, ((UINT)clst % 128) * 4, 4)) break;
      00915C 1E 17            [ 2]  280 	ldw	x, (0x17, sp)
      00915E 9F               [ 1]  281 	ld	a, xl
      00915F A4 7F            [ 1]  282 	and	a, #0x7f
      009161 97               [ 1]  283 	ld	xl, a
      009162 4F               [ 1]  284 	clr	a
      009163 95               [ 1]  285 	ld	xh, a
      009164 58               [ 2]  286 	sllw	x
      009165 58               [ 2]  287 	sllw	x
      009166 1F 05            [ 2]  288 	ldw	(0x05, sp), x
      009168 93               [ 1]  289 	ldw	x, y
      009169 E6 0D            [ 1]  290 	ld	a, (0xd, x)
      00916B 6B 0A            [ 1]  291 	ld	(0x0a, sp), a
      00916D E6 0C            [ 1]  292 	ld	a, (0xc, x)
      00916F EE 0A            [ 2]  293 	ldw	x, (0xa, x)
      009171 1F 07            [ 2]  294 	ldw	(0x07, sp), x
      009173 1E 17            [ 2]  295 	ldw	x, (0x17, sp)
      009175 16 15            [ 2]  296 	ldw	y, (0x15, sp)
      009177 88               [ 1]  297 	push	a
      009178 4F               [ 1]  298 	clr	a
      009179 90 01            [ 1]  299 	rrwa	y
      00917B 01               [ 1]  300 	rrwa	x
      00917C 48               [ 1]  301 	sll	a
      00917D 59               [ 2]  302 	rlcw	x
      00917E 90 59            [ 2]  303 	rlcw	y
      009180 84               [ 1]  304 	pop	a
      009181 1F 0D            [ 2]  305 	ldw	(0x0d, sp), x
      009183 95               [ 1]  306 	ld	xh, a
      009184 41               [ 1]  307 	exg	a, xl
      009185 7B 0A            [ 1]  308 	ld	a, (0x0a, sp)
      009187 41               [ 1]  309 	exg	a, xl
      009188 72 FB 0D         [ 2]  310 	addw	x, (0x0d, sp)
      00918B 90 9F            [ 1]  311 	ld	a, yl
      00918D 19 08            [ 1]  312 	adc	a, (0x08, sp)
      00918F 6B 10            [ 1]  313 	ld	(0x10, sp), a
      009191 90 9E            [ 1]  314 	ld	a, yh
      009193 19 07            [ 1]  315 	adc	a, (0x07, sp)
      009195 6B 0F            [ 1]  316 	ld	(0x0f, sp), a
      009197 4B 04            [ 1]  317 	push	#0x04
      009199 4B 00            [ 1]  318 	push	#0x00
      00919B 16 07            [ 2]  319 	ldw	y, (0x07, sp)
      00919D 90 89            [ 2]  320 	pushw	y
      00919F 89               [ 2]  321 	pushw	x
      0091A0 1E 15            [ 2]  322 	ldw	x, (0x15, sp)
      0091A2 89               [ 2]  323 	pushw	x
      0091A3 96               [ 1]  324 	ldw	x, sp
      0091A4 1C 00 09         [ 2]  325 	addw	x, #9
      0091A7 89               [ 2]  326 	pushw	x
      0091A8 CD 82 8F         [ 4]  327 	call	_disk_readp
      0091AB 5B 0A            [ 2]  328 	addw	sp, #10
      0091AD 4D               [ 1]  329 	tnz	a
      0091AE 26 10            [ 1]  330 	jrne	00107$
                                    331 ;	../src/pff.c: 465: return ld_dword(buf) & 0x0FFFFFFF;
      0091B0 96               [ 1]  332 	ldw	x, sp
      0091B1 5C               [ 1]  333 	incw	x
      0091B2 89               [ 2]  334 	pushw	x
      0091B3 CD 90 4D         [ 4]  335 	call	_ld_dword
      0091B6 5B 02            [ 2]  336 	addw	sp, #2
      0091B8 90 9E            [ 1]  337 	ld	a, yh
      0091BA A4 0F            [ 1]  338 	and	a, #0x0f
      0091BC 90 95            [ 1]  339 	ld	yh, a
      0091BE 20 04            [ 2]  340 	jra	00108$
                                    341 ;	../src/pff.c: 467: }
      0091C0                        342 00107$:
                                    343 ;	../src/pff.c: 469: return 1;	/* An error occured at the disk I/O layer */
      0091C0 5F               [ 1]  344 	clrw	x
      0091C1 5C               [ 1]  345 	incw	x
      0091C2 90 5F            [ 1]  346 	clrw	y
      0091C4                        347 00108$:
                                    348 ;	../src/pff.c: 470: }
      0091C4 5B 12            [ 2]  349 	addw	sp, #18
      0091C6 81               [ 4]  350 	ret
                                    351 ;	../src/pff.c: 479: static DWORD clust2sect (	/* !=0: Sector number, 0: Failed - invalid cluster# */
                                    352 ;	-----------------------------------------
                                    353 ;	 function clust2sect
                                    354 ;	-----------------------------------------
      0091C7                        355 _clust2sect:
      0091C7 52 08            [ 2]  356 	sub	sp, #8
                                    357 ;	../src/pff.c: 483: FATFS *fs = FatFs;
      0091C9 CE 02 67         [ 2]  358 	ldw	x, _FatFs+0
      0091CC 1F 07            [ 2]  359 	ldw	(0x07, sp), x
                                    360 ;	../src/pff.c: 486: clst -= 2;
      0091CE 1E 0D            [ 2]  361 	ldw	x, (0x0d, sp)
      0091D0 1D 00 02         [ 2]  362 	subw	x, #0x0002
      0091D3 16 0B            [ 2]  363 	ldw	y, (0x0b, sp)
      0091D5 24 02            [ 1]  364 	jrnc	00110$
      0091D7 90 5A            [ 2]  365 	decw	y
      0091D9                        366 00110$:
      0091D9 1F 0D            [ 2]  367 	ldw	(0x0d, sp), x
      0091DB 17 0B            [ 2]  368 	ldw	(0x0b, sp), y
                                    369 ;	../src/pff.c: 487: if (clst >= (fs->n_fatent - 2)) return 0;		/* Invalid cluster# */
      0091DD 1E 07            [ 2]  370 	ldw	x, (0x07, sp)
      0091DF 90 93            [ 1]  371 	ldw	y, x
      0091E1 90 EE 08         [ 2]  372 	ldw	y, (0x8, y)
      0091E4 EE 06            [ 2]  373 	ldw	x, (0x6, x)
      0091E6 72 A2 00 02      [ 2]  374 	subw	y, #0x0002
      0091EA 17 05            [ 2]  375 	ldw	(0x05, sp), y
      0091EC 24 01            [ 1]  376 	jrnc	00111$
      0091EE 5A               [ 2]  377 	decw	x
      0091EF                        378 00111$:
      0091EF 1F 03            [ 2]  379 	ldw	(0x03, sp), x
      0091F1 1E 0D            [ 2]  380 	ldw	x, (0x0d, sp)
      0091F3 13 05            [ 2]  381 	cpw	x, (0x05, sp)
      0091F5 7B 0C            [ 1]  382 	ld	a, (0x0c, sp)
      0091F7 12 04            [ 1]  383 	sbc	a, (0x04, sp)
      0091F9 7B 0B            [ 1]  384 	ld	a, (0x0b, sp)
      0091FB 12 03            [ 1]  385 	sbc	a, (0x03, sp)
      0091FD 25 05            [ 1]  386 	jrc	00102$
      0091FF 5F               [ 1]  387 	clrw	x
      009200 90 5F            [ 1]  388 	clrw	y
      009202 20 32            [ 2]  389 	jra	00103$
      009204                        390 00102$:
                                    391 ;	../src/pff.c: 488: return (DWORD)clst * fs->csize + fs->database;
      009204 1E 07            [ 2]  392 	ldw	x, (0x07, sp)
      009206 E6 02            [ 1]  393 	ld	a, (0x2, x)
      009208 5F               [ 1]  394 	clrw	x
      009209 97               [ 1]  395 	ld	xl, a
      00920A 90 5F            [ 1]  396 	clrw	y
      00920C 89               [ 2]  397 	pushw	x
      00920D 90 89            [ 2]  398 	pushw	y
      00920F 1E 11            [ 2]  399 	ldw	x, (0x11, sp)
      009211 89               [ 2]  400 	pushw	x
      009212 1E 11            [ 2]  401 	ldw	x, (0x11, sp)
      009214 89               [ 2]  402 	pushw	x
      009215 CD 9D DA         [ 4]  403 	call	__mullong
      009218 5B 08            [ 2]  404 	addw	sp, #8
      00921A 1F 03            [ 2]  405 	ldw	(0x03, sp), x
      00921C 17 01            [ 2]  406 	ldw	(0x01, sp), y
      00921E 1E 07            [ 2]  407 	ldw	x, (0x07, sp)
      009220 90 93            [ 1]  408 	ldw	y, x
      009222 90 EE 14         [ 2]  409 	ldw	y, (0x14, y)
      009225 EE 12            [ 2]  410 	ldw	x, (0x12, x)
      009227 1F 05            [ 2]  411 	ldw	(0x05, sp), x
      009229 93               [ 1]  412 	ldw	x, y
      00922A 72 FB 03         [ 2]  413 	addw	x, (0x03, sp)
      00922D 16 05            [ 2]  414 	ldw	y, (0x05, sp)
      00922F 24 02            [ 1]  415 	jrnc	00113$
      009231 90 5C            [ 1]  416 	incw	y
      009233                        417 00113$:
      009233 72 F9 01         [ 2]  418 	addw	y, (0x01, sp)
      009236                        419 00103$:
                                    420 ;	../src/pff.c: 489: }
      009236 5B 08            [ 2]  421 	addw	sp, #8
      009238 81               [ 4]  422 	ret
                                    423 ;	../src/pff.c: 492: static CLUST get_clust (
                                    424 ;	-----------------------------------------
                                    425 ;	 function get_clust
                                    426 ;	-----------------------------------------
      009239                        427 _get_clust:
      009239 52 04            [ 2]  428 	sub	sp, #4
                                    429 ;	../src/pff.c: 501: clst = ld_word(dir+DIR_FstClusHI);
      00923B 1E 07            [ 2]  430 	ldw	x, (0x07, sp)
      00923D 1C 00 14         [ 2]  431 	addw	x, #0x0014
      009240 89               [ 2]  432 	pushw	x
      009241 CD 90 37         [ 4]  433 	call	_ld_word
      009244 5B 02            [ 2]  434 	addw	sp, #2
      009246 51               [ 1]  435 	exgw	x, y
                                    436 ;	../src/pff.c: 502: clst <<= 16;
      009247 5F               [ 1]  437 	clrw	x
      009248 1F 03            [ 2]  438 	ldw	(0x03, sp), x
      00924A 17 01            [ 2]  439 	ldw	(0x01, sp), y
                                    440 ;	../src/pff.c: 504: clst |= ld_word(dir+DIR_FstClusLO);
      00924C 1E 07            [ 2]  441 	ldw	x, (0x07, sp)
      00924E 1C 00 1A         [ 2]  442 	addw	x, #0x001a
      009251 89               [ 2]  443 	pushw	x
      009252 CD 90 37         [ 4]  444 	call	_ld_word
      009255 5B 02            [ 2]  445 	addw	sp, #2
      009257 4F               [ 1]  446 	clr	a
      009258 90 5F            [ 1]  447 	clrw	y
      00925A 1A 02            [ 1]  448 	or	a, (0x02, sp)
      00925C 90 97            [ 1]  449 	ld	yl, a
      00925E 9F               [ 1]  450 	ld	a, xl
      00925F 1A 04            [ 1]  451 	or	a, (0x04, sp)
      009261 02               [ 1]  452 	rlwa	x
      009262 1A 03            [ 1]  453 	or	a, (0x03, sp)
      009264 95               [ 1]  454 	ld	xh, a
      009265 90 9E            [ 1]  455 	ld	a, yh
      009267 1A 01            [ 1]  456 	or	a, (0x01, sp)
                                    457 ;	../src/pff.c: 506: return clst;
      009269 90 95            [ 1]  458 	ld	yh, a
                                    459 ;	../src/pff.c: 507: }
      00926B 5B 04            [ 2]  460 	addw	sp, #4
      00926D 81               [ 4]  461 	ret
                                    462 ;	../src/pff.c: 514: static FRESULT dir_rewind (
                                    463 ;	-----------------------------------------
                                    464 ;	 function dir_rewind
                                    465 ;	-----------------------------------------
      00926E                        466 _dir_rewind:
      00926E 52 0C            [ 2]  467 	sub	sp, #12
                                    468 ;	../src/pff.c: 519: FATFS *fs = FatFs;
      009270 CE 02 67         [ 2]  469 	ldw	x, _FatFs+0
      009273 1F 07            [ 2]  470 	ldw	(0x07, sp), x
                                    471 ;	../src/pff.c: 522: dj->index = 0;
      009275 16 0F            [ 2]  472 	ldw	y, (0x0f, sp)
      009277 17 05            [ 2]  473 	ldw	(0x05, sp), y
      009279 93               [ 1]  474 	ldw	x, y
      00927A 6F 01            [ 1]  475 	clr	(0x1, x)
      00927C 7F               [ 1]  476 	clr	(x)
                                    477 ;	../src/pff.c: 523: clst = dj->sclust;
      00927D 1E 05            [ 2]  478 	ldw	x, (0x05, sp)
      00927F 90 93            [ 1]  479 	ldw	y, x
      009281 90 EE 06         [ 2]  480 	ldw	y, (0x6, y)
      009284 EE 04            [ 2]  481 	ldw	x, (0x4, x)
      009286 17 0B            [ 2]  482 	ldw	(0x0b, sp), y
      009288 1F 09            [ 2]  483 	ldw	(0x09, sp), x
                                    484 ;	../src/pff.c: 524: if (clst == 1 || clst >= fs->n_fatent) {	/* Check start cluster range */
      00928A 1E 0B            [ 2]  485 	ldw	x, (0x0b, sp)
      00928C 5A               [ 2]  486 	decw	x
      00928D 26 04            [ 1]  487 	jrne	00129$
      00928F 1E 09            [ 2]  488 	ldw	x, (0x09, sp)
      009291 27 1B            [ 1]  489 	jreq	00101$
      009293                        490 00129$:
      009293 1E 07            [ 2]  491 	ldw	x, (0x07, sp)
      009295 90 93            [ 1]  492 	ldw	y, x
      009297 90 EE 08         [ 2]  493 	ldw	y, (0x8, y)
      00929A 17 03            [ 2]  494 	ldw	(0x03, sp), y
      00929C EE 06            [ 2]  495 	ldw	x, (0x6, x)
      00929E 1F 01            [ 2]  496 	ldw	(0x01, sp), x
      0092A0 1E 0B            [ 2]  497 	ldw	x, (0x0b, sp)
      0092A2 13 03            [ 2]  498 	cpw	x, (0x03, sp)
      0092A4 7B 0A            [ 1]  499 	ld	a, (0x0a, sp)
      0092A6 12 02            [ 1]  500 	sbc	a, (0x02, sp)
      0092A8 7B 09            [ 1]  501 	ld	a, (0x09, sp)
      0092AA 12 01            [ 1]  502 	sbc	a, (0x01, sp)
      0092AC 25 04            [ 1]  503 	jrc	00106$
      0092AE                        504 00101$:
                                    505 ;	../src/pff.c: 525: return FR_DISK_ERR;
      0092AE A6 01            [ 1]  506 	ld	a, #0x01
      0092B0 20 3F            [ 2]  507 	jra	00109$
                                    508 ;	../src/pff.c: 527: if (PF_FS_FAT32 && !clst && (_FS_32ONLY || fs->fs_type == FS_FAT32)) {	/* Replace cluster# 0 with root cluster# if in FAT32 */
      0092B2                        509 00106$:
      0092B2 1E 0B            [ 2]  510 	ldw	x, (0x0b, sp)
      0092B4 26 11            [ 1]  511 	jrne	00105$
      0092B6 1E 09            [ 2]  512 	ldw	x, (0x09, sp)
      0092B8 26 0D            [ 1]  513 	jrne	00105$
                                    514 ;	../src/pff.c: 528: clst = (CLUST)fs->dirbase;
      0092BA 1E 07            [ 2]  515 	ldw	x, (0x07, sp)
      0092BC 90 93            [ 1]  516 	ldw	y, x
      0092BE 90 EE 10         [ 2]  517 	ldw	y, (0x10, y)
      0092C1 17 0B            [ 2]  518 	ldw	(0x0b, sp), y
      0092C3 EE 0E            [ 2]  519 	ldw	x, (0xe, x)
      0092C5 1F 09            [ 2]  520 	ldw	(0x09, sp), x
      0092C7                        521 00105$:
                                    522 ;	../src/pff.c: 530: dj->clust = clst;						/* Current cluster */
      0092C7 1E 05            [ 2]  523 	ldw	x, (0x05, sp)
      0092C9 1C 00 08         [ 2]  524 	addw	x, #0x0008
      0092CC 16 0B            [ 2]  525 	ldw	y, (0x0b, sp)
      0092CE EF 02            [ 2]  526 	ldw	(0x2, x), y
      0092D0 16 09            [ 2]  527 	ldw	y, (0x09, sp)
      0092D2 FF               [ 2]  528 	ldw	(x), y
                                    529 ;	../src/pff.c: 531: dj->sect = (_FS_32ONLY || clst) ? clust2sect(clst) : fs->dirbase;	/* Current sector */
      0092D3 1E 05            [ 2]  530 	ldw	x, (0x05, sp)
      0092D5 1C 00 0C         [ 2]  531 	addw	x, #0x000c
      0092D8 1F 07            [ 2]  532 	ldw	(0x07, sp), x
      0092DA 1E 0B            [ 2]  533 	ldw	x, (0x0b, sp)
      0092DC 89               [ 2]  534 	pushw	x
      0092DD 1E 0B            [ 2]  535 	ldw	x, (0x0b, sp)
      0092DF 89               [ 2]  536 	pushw	x
      0092E0 CD 91 C7         [ 4]  537 	call	_clust2sect
      0092E3 5B 04            [ 2]  538 	addw	sp, #4
      0092E5 17 09            [ 2]  539 	ldw	(0x09, sp), y
      0092E7 16 07            [ 2]  540 	ldw	y, (0x07, sp)
      0092E9 90 EF 02         [ 2]  541 	ldw	(0x2, y), x
      0092EC 1E 09            [ 2]  542 	ldw	x, (0x09, sp)
      0092EE 90 FF            [ 2]  543 	ldw	(y), x
                                    544 ;	../src/pff.c: 533: return FR_OK;	/* Seek succeeded */
      0092F0 4F               [ 1]  545 	clr	a
      0092F1                        546 00109$:
                                    547 ;	../src/pff.c: 534: }
      0092F1 5B 0C            [ 2]  548 	addw	sp, #12
      0092F3 81               [ 4]  549 	ret
                                    550 ;	../src/pff.c: 543: static FRESULT dir_next (	/* FR_OK:Succeeded, FR_NO_FILE:End of table */
                                    551 ;	-----------------------------------------
                                    552 ;	 function dir_next
                                    553 ;	-----------------------------------------
      0092F4                        554 _dir_next:
      0092F4 52 14            [ 2]  555 	sub	sp, #20
                                    556 ;	../src/pff.c: 549: FATFS *fs = FatFs;
      0092F6 CE 02 67         [ 2]  557 	ldw	x, _FatFs+0
      0092F9 1F 05            [ 2]  558 	ldw	(0x05, sp), x
                                    559 ;	../src/pff.c: 552: i = dj->index + 1;
      0092FB 16 17            [ 2]  560 	ldw	y, (0x17, sp)
      0092FD 17 07            [ 2]  561 	ldw	(0x07, sp), y
      0092FF 93               [ 1]  562 	ldw	x, y
      009300 FE               [ 2]  563 	ldw	x, (x)
      009301 5C               [ 1]  564 	incw	x
                                    565 ;	../src/pff.c: 553: if (!i || !dj->sect) return FR_NO_FILE;	/* Report EOT when index has reached 65535 */
      009302 1F 09            [ 2]  566 	ldw	(0x09, sp), x
      009304 27 19            [ 1]  567 	jreq	00101$
      009306 1E 07            [ 2]  568 	ldw	x, (0x07, sp)
      009308 1C 00 0C         [ 2]  569 	addw	x, #0x000c
      00930B 1F 0B            [ 2]  570 	ldw	(0x0b, sp), x
      00930D 90 93            [ 1]  571 	ldw	y, x
      00930F 90 EE 02         [ 2]  572 	ldw	y, (0x2, y)
      009312 17 03            [ 2]  573 	ldw	(0x03, sp), y
      009314 FE               [ 2]  574 	ldw	x, (x)
      009315 1F 01            [ 2]  575 	ldw	(0x01, sp), x
      009317 1E 03            [ 2]  576 	ldw	x, (0x03, sp)
      009319 26 09            [ 1]  577 	jrne	00102$
      00931B 1E 01            [ 2]  578 	ldw	x, (0x01, sp)
      00931D 26 05            [ 1]  579 	jrne	00102$
      00931F                        580 00101$:
      00931F A6 03            [ 1]  581 	ld	a, #0x03
      009321 CC 93 FA         [ 2]  582 	jp	00117$
      009324                        583 00102$:
                                    584 ;	../src/pff.c: 555: if (!(i % 16)) {		/* Sector changed? */
      009324 16 09            [ 2]  585 	ldw	y, (0x09, sp)
      009326 17 13            [ 2]  586 	ldw	(0x13, sp), y
      009328 7B 14            [ 1]  587 	ld	a, (0x14, sp)
      00932A A5 0F            [ 1]  588 	bcp	a, #0x0f
      00932C 27 03            [ 1]  589 	jreq	00157$
      00932E CC 93 F4         [ 2]  590 	jp	00116$
      009331                        591 00157$:
                                    592 ;	../src/pff.c: 556: dj->sect++;			/* Next sector */
      009331 7B 04            [ 1]  593 	ld	a, (0x04, sp)
      009333 AB 01            [ 1]  594 	add	a, #0x01
      009335 88               [ 1]  595 	push	a
      009336 7B 04            [ 1]  596 	ld	a, (0x04, sp)
      009338 A9 00            [ 1]  597 	adc	a, #0x00
      00933A 6B 12            [ 1]  598 	ld	(0x12, sp), a
      00933C 16 02            [ 2]  599 	ldw	y, (0x02, sp)
      00933E 24 02            [ 1]  600 	jrnc	00158$
      009340 90 5C            [ 1]  601 	incw	y
      009342                        602 00158$:
      009342 84               [ 1]  603 	pop	a
      009343 1E 0B            [ 2]  604 	ldw	x, (0x0b, sp)
      009345 E7 03            [ 1]  605 	ld	(0x3, x), a
      009347 7B 11            [ 1]  606 	ld	a, (0x11, sp)
      009349 E7 02            [ 1]  607 	ld	(0x2, x), a
      00934B FF               [ 2]  608 	ldw	(x), y
                                    609 ;	../src/pff.c: 558: if (dj->clust == 0) {	/* Static table */
      00934C 1E 07            [ 2]  610 	ldw	x, (0x07, sp)
      00934E 1C 00 08         [ 2]  611 	addw	x, #0x0008
      009351 1F 0D            [ 2]  612 	ldw	(0x0d, sp), x
      009353 90 93            [ 1]  613 	ldw	y, x
      009355 90 EE 02         [ 2]  614 	ldw	y, (0x2, y)
      009358 FE               [ 2]  615 	ldw	x, (x)
      009359 1F 0F            [ 2]  616 	ldw	(0x0f, sp), x
      00935B 90 5D            [ 2]  617 	tnzw	y
      00935D 26 18            [ 1]  618 	jrne	00113$
      00935F 1E 0F            [ 2]  619 	ldw	x, (0x0f, sp)
      009361 26 14            [ 1]  620 	jrne	00113$
                                    621 ;	../src/pff.c: 559: if (i >= fs->n_rootdir) return FR_NO_FILE;	/* Report EOT when end of table */
      009363 1E 05            [ 2]  622 	ldw	x, (0x05, sp)
      009365 EE 04            [ 2]  623 	ldw	x, (0x4, x)
      009367 1F 13            [ 2]  624 	ldw	(0x13, sp), x
      009369 1E 09            [ 2]  625 	ldw	x, (0x09, sp)
      00936B 13 13            [ 2]  626 	cpw	x, (0x13, sp)
      00936D 24 03            [ 1]  627 	jrnc	00161$
      00936F CC 93 F4         [ 2]  628 	jp	00116$
      009372                        629 00161$:
      009372 A6 03            [ 1]  630 	ld	a, #0x03
      009374 CC 93 FA         [ 2]  631 	jp	00117$
      009377                        632 00113$:
                                    633 ;	../src/pff.c: 562: if (((i / 16) & (fs->csize - 1)) == 0) {	/* Cluster changed? */
      009377 04 13            [ 1]  634 	srl	(0x13, sp)
      009379 06 14            [ 1]  635 	rrc	(0x14, sp)
      00937B 04 13            [ 1]  636 	srl	(0x13, sp)
      00937D 06 14            [ 1]  637 	rrc	(0x14, sp)
      00937F 04 13            [ 1]  638 	srl	(0x13, sp)
      009381 06 14            [ 1]  639 	rrc	(0x14, sp)
      009383 04 13            [ 1]  640 	srl	(0x13, sp)
      009385 06 14            [ 1]  641 	rrc	(0x14, sp)
      009387 1E 05            [ 2]  642 	ldw	x, (0x05, sp)
      009389 E6 02            [ 1]  643 	ld	a, (0x2, x)
      00938B 5F               [ 1]  644 	clrw	x
      00938C 97               [ 1]  645 	ld	xl, a
      00938D 5A               [ 2]  646 	decw	x
      00938E 9F               [ 1]  647 	ld	a, xl
      00938F 14 14            [ 1]  648 	and	a, (0x14, sp)
      009391 02               [ 1]  649 	rlwa	x
      009392 14 13            [ 1]  650 	and	a, (0x13, sp)
      009394 95               [ 1]  651 	ld	xh, a
      009395 5D               [ 2]  652 	tnzw	x
      009396 26 5C            [ 1]  653 	jrne	00116$
                                    654 ;	../src/pff.c: 563: clst = get_fat(dj->clust);		/* Get next cluster */
      009398 90 89            [ 2]  655 	pushw	y
      00939A 1E 11            [ 2]  656 	ldw	x, (0x11, sp)
      00939C 89               [ 2]  657 	pushw	x
      00939D CD 91 20         [ 4]  658 	call	_get_fat
      0093A0 5B 04            [ 2]  659 	addw	sp, #4
      0093A2 1F 13            [ 2]  660 	ldw	(0x13, sp), x
      0093A4 17 11            [ 2]  661 	ldw	(0x11, sp), y
                                    662 ;	../src/pff.c: 564: if (clst <= 1) return FR_DISK_ERR;
      0093A6 5F               [ 1]  663 	clrw	x
      0093A7 5C               [ 1]  664 	incw	x
      0093A8 13 13            [ 2]  665 	cpw	x, (0x13, sp)
      0093AA 4F               [ 1]  666 	clr	a
      0093AB 12 12            [ 1]  667 	sbc	a, (0x12, sp)
      0093AD 4F               [ 1]  668 	clr	a
      0093AE 12 11            [ 1]  669 	sbc	a, (0x11, sp)
      0093B0 25 04            [ 1]  670 	jrc	00107$
      0093B2 A6 01            [ 1]  671 	ld	a, #0x01
      0093B4 20 44            [ 2]  672 	jra	00117$
      0093B6                        673 00107$:
                                    674 ;	../src/pff.c: 565: if (clst >= fs->n_fatent) return FR_NO_FILE;	/* Report EOT when it reached end of dynamic table */
      0093B6 1E 05            [ 2]  675 	ldw	x, (0x05, sp)
      0093B8 90 93            [ 1]  676 	ldw	y, x
      0093BA 90 EE 08         [ 2]  677 	ldw	y, (0x8, y)
      0093BD 17 05            [ 2]  678 	ldw	(0x05, sp), y
      0093BF EE 06            [ 2]  679 	ldw	x, (0x6, x)
      0093C1 1F 03            [ 2]  680 	ldw	(0x03, sp), x
      0093C3 1E 13            [ 2]  681 	ldw	x, (0x13, sp)
      0093C5 13 05            [ 2]  682 	cpw	x, (0x05, sp)
      0093C7 7B 12            [ 1]  683 	ld	a, (0x12, sp)
      0093C9 12 04            [ 1]  684 	sbc	a, (0x04, sp)
      0093CB 7B 11            [ 1]  685 	ld	a, (0x11, sp)
      0093CD 12 03            [ 1]  686 	sbc	a, (0x03, sp)
      0093CF 25 04            [ 1]  687 	jrc	00109$
      0093D1 A6 03            [ 1]  688 	ld	a, #0x03
      0093D3 20 25            [ 2]  689 	jra	00117$
      0093D5                        690 00109$:
                                    691 ;	../src/pff.c: 566: dj->clust = clst;				/* Initialize data for new cluster */
      0093D5 1E 0D            [ 2]  692 	ldw	x, (0x0d, sp)
      0093D7 16 13            [ 2]  693 	ldw	y, (0x13, sp)
      0093D9 EF 02            [ 2]  694 	ldw	(0x2, x), y
      0093DB 16 11            [ 2]  695 	ldw	y, (0x11, sp)
      0093DD FF               [ 2]  696 	ldw	(x), y
                                    697 ;	../src/pff.c: 567: dj->sect = clust2sect(clst);
      0093DE 1E 13            [ 2]  698 	ldw	x, (0x13, sp)
      0093E0 89               [ 2]  699 	pushw	x
      0093E1 1E 13            [ 2]  700 	ldw	x, (0x13, sp)
      0093E3 89               [ 2]  701 	pushw	x
      0093E4 CD 91 C7         [ 4]  702 	call	_clust2sect
      0093E7 5B 04            [ 2]  703 	addw	sp, #4
      0093E9 17 11            [ 2]  704 	ldw	(0x11, sp), y
      0093EB 16 0B            [ 2]  705 	ldw	y, (0x0b, sp)
      0093ED 90 EF 02         [ 2]  706 	ldw	(0x2, y), x
      0093F0 1E 11            [ 2]  707 	ldw	x, (0x11, sp)
      0093F2 90 FF            [ 2]  708 	ldw	(y), x
      0093F4                        709 00116$:
                                    710 ;	../src/pff.c: 572: dj->index = i;
      0093F4 1E 07            [ 2]  711 	ldw	x, (0x07, sp)
      0093F6 16 09            [ 2]  712 	ldw	y, (0x09, sp)
      0093F8 FF               [ 2]  713 	ldw	(x), y
                                    714 ;	../src/pff.c: 574: return FR_OK;
      0093F9 4F               [ 1]  715 	clr	a
      0093FA                        716 00117$:
                                    717 ;	../src/pff.c: 575: }
      0093FA 5B 14            [ 2]  718 	addw	sp, #20
      0093FC 81               [ 4]  719 	ret
                                    720 ;	../src/pff.c: 584: static FRESULT dir_find (
                                    721 ;	-----------------------------------------
                                    722 ;	 function dir_find
                                    723 ;	-----------------------------------------
      0093FD                        724 _dir_find:
      0093FD 52 07            [ 2]  725 	sub	sp, #7
                                    726 ;	../src/pff.c: 593: res = dir_rewind(dj);			/* Rewind directory object */
      0093FF 1E 0A            [ 2]  727 	ldw	x, (0x0a, sp)
      009401 89               [ 2]  728 	pushw	x
      009402 CD 92 6E         [ 4]  729 	call	_dir_rewind
      009405 85               [ 2]  730 	popw	x
                                    731 ;	../src/pff.c: 594: if (res != FR_OK) return res;
      009406 4D               [ 1]  732 	tnz	a
                                    733 ;	../src/pff.c: 596: do {
      009407 26 72            [ 1]  734 	jrne	00113$
      009409 16 0A            [ 2]  735 	ldw	y, (0x0a, sp)
      00940B 17 03            [ 2]  736 	ldw	(0x03, sp), y
      00940D 17 05            [ 2]  737 	ldw	(0x05, sp), y
      00940F                        738 00110$:
                                    739 ;	../src/pff.c: 597: res = disk_readp(dir, dj->sect, (dj->index % 16) * 32, 32)	/* Read an entry */
      00940F 1E 03            [ 2]  740 	ldw	x, (0x03, sp)
      009411 FE               [ 2]  741 	ldw	x, (x)
      009412 9F               [ 1]  742 	ld	a, xl
      009413 A4 0F            [ 1]  743 	and	a, #0x0f
      009415 97               [ 1]  744 	ld	xl, a
      009416 4F               [ 1]  745 	clr	a
      009417 95               [ 1]  746 	ld	xh, a
      009418 58               [ 2]  747 	sllw	x
      009419 58               [ 2]  748 	sllw	x
      00941A 58               [ 2]  749 	sllw	x
      00941B 58               [ 2]  750 	sllw	x
      00941C 58               [ 2]  751 	sllw	x
      00941D 1F 01            [ 2]  752 	ldw	(0x01, sp), x
      00941F 1E 05            [ 2]  753 	ldw	x, (0x05, sp)
      009421 90 93            [ 1]  754 	ldw	y, x
      009423 90 EE 0E         [ 2]  755 	ldw	y, (0xe, y)
      009426 EE 0C            [ 2]  756 	ldw	x, (0xc, x)
      009428 4B 20            [ 1]  757 	push	#0x20
      00942A 4B 00            [ 1]  758 	push	#0x00
      00942C 7B 04            [ 1]  759 	ld	a, (0x04, sp)
      00942E 88               [ 1]  760 	push	a
      00942F 7B 04            [ 1]  761 	ld	a, (0x04, sp)
      009431 88               [ 1]  762 	push	a
      009432 90 89            [ 2]  763 	pushw	y
      009434 89               [ 2]  764 	pushw	x
      009435 1E 14            [ 2]  765 	ldw	x, (0x14, sp)
      009437 89               [ 2]  766 	pushw	x
      009438 CD 82 8F         [ 4]  767 	call	_disk_readp
      00943B 5B 0A            [ 2]  768 	addw	sp, #10
      00943D 4D               [ 1]  769 	tnz	a
      00943E 27 03            [ 1]  770 	jreq	00115$
                                    771 ;	../src/pff.c: 598: ? FR_DISK_ERR : FR_OK;
      009440 A6 01            [ 1]  772 	ld	a, #0x01
      009442 21                     773 	.byte 0x21
      009443                        774 00115$:
      009443 4F               [ 1]  775 	clr	a
      009444                        776 00116$:
                                    777 ;	../src/pff.c: 599: if (res != FR_OK) break;
      009444 6B 07            [ 1]  778 	ld	(0x07, sp), a
      009446 26 31            [ 1]  779 	jrne	00112$
                                    780 ;	../src/pff.c: 600: c = dir[DIR_Name];	/* First character */
      009448 1E 0C            [ 2]  781 	ldw	x, (0x0c, sp)
                                    782 ;	../src/pff.c: 601: if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
      00944A F6               [ 1]  783 	ld	a, (x)
      00944B 26 06            [ 1]  784 	jrne	00106$
      00944D A6 03            [ 1]  785 	ld	a, #0x03
      00944F 6B 07            [ 1]  786 	ld	(0x07, sp), a
      009451 20 26            [ 2]  787 	jra	00112$
      009453                        788 00106$:
                                    789 ;	../src/pff.c: 602: if (!(dir[DIR_Attr] & AM_VOL) && !mem_cmp(dir, dj->fn, 11)) break;	/* Is it a valid entry? */
      009453 E6 0B            [ 1]  790 	ld	a, (0xb, x)
      009455 A5 08            [ 1]  791 	bcp	a, #0x08
      009457 26 15            [ 1]  792 	jrne	00108$
      009459 1E 03            [ 2]  793 	ldw	x, (0x03, sp)
      00945B EE 02            [ 2]  794 	ldw	x, (0x2, x)
      00945D 16 0C            [ 2]  795 	ldw	y, (0x0c, sp)
      00945F 4B 0B            [ 1]  796 	push	#0x0b
      009461 4B 00            [ 1]  797 	push	#0x00
      009463 89               [ 2]  798 	pushw	x
      009464 90 89            [ 2]  799 	pushw	y
      009466 CD 90 DC         [ 4]  800 	call	_mem_cmp
      009469 5B 06            [ 2]  801 	addw	sp, #6
      00946B 5D               [ 2]  802 	tnzw	x
      00946C 27 0B            [ 1]  803 	jreq	00112$
      00946E                        804 00108$:
                                    805 ;	../src/pff.c: 603: res = dir_next(dj);					/* Next entry */
      00946E 1E 03            [ 2]  806 	ldw	x, (0x03, sp)
      009470 89               [ 2]  807 	pushw	x
      009471 CD 92 F4         [ 4]  808 	call	_dir_next
      009474 85               [ 2]  809 	popw	x
                                    810 ;	../src/pff.c: 604: } while (res == FR_OK);
      009475 6B 07            [ 1]  811 	ld	(0x07, sp), a
      009477 27 96            [ 1]  812 	jreq	00110$
      009479                        813 00112$:
                                    814 ;	../src/pff.c: 606: return res;
      009479 7B 07            [ 1]  815 	ld	a, (0x07, sp)
      00947B                        816 00113$:
                                    817 ;	../src/pff.c: 607: }
      00947B 5B 07            [ 2]  818 	addw	sp, #7
      00947D 81               [ 4]  819 	ret
                                    820 ;	../src/pff.c: 651: static FRESULT create_name (
                                    821 ;	-----------------------------------------
                                    822 ;	 function create_name
                                    823 ;	-----------------------------------------
      00947E                        824 _create_name:
      00947E 52 09            [ 2]  825 	sub	sp, #9
                                    826 ;	../src/pff.c: 663: sfn = dj->fn;
      009480 1E 0C            [ 2]  827 	ldw	x, (0x0c, sp)
      009482 EE 02            [ 2]  828 	ldw	x, (0x2, x)
                                    829 ;	../src/pff.c: 664: mem_set(sfn, ' ', 11);
      009484 1F 01            [ 2]  830 	ldw	(0x01, sp), x
      009486 4B 0B            [ 1]  831 	push	#0x0b
      009488 4B 00            [ 1]  832 	push	#0x00
      00948A 4B 20            [ 1]  833 	push	#0x20
      00948C 4B 00            [ 1]  834 	push	#0x00
      00948E 89               [ 2]  835 	pushw	x
      00948F CD 90 C1         [ 4]  836 	call	_mem_set
      009492 5B 06            [ 2]  837 	addw	sp, #6
                                    838 ;	../src/pff.c: 665: si = i = 0; ni = 8;
      009494 0F 08            [ 1]  839 	clr	(0x08, sp)
      009496 A6 08            [ 1]  840 	ld	a, #0x08
      009498 6B 03            [ 1]  841 	ld	(0x03, sp), a
                                    842 ;	../src/pff.c: 666: p = *path;
      00949A 16 0E            [ 2]  843 	ldw	y, (0x0e, sp)
      00949C 93               [ 1]  844 	ldw	x, y
      00949D FE               [ 2]  845 	ldw	x, (x)
      00949E 1F 04            [ 2]  846 	ldw	(0x04, sp), x
      0094A0 0F 09            [ 1]  847 	clr	(0x09, sp)
      0094A2                        848 00120$:
                                    849 ;	../src/pff.c: 668: c = p[si++];
      0094A2 5F               [ 1]  850 	clrw	x
      0094A3 7B 09            [ 1]  851 	ld	a, (0x09, sp)
      0094A5 97               [ 1]  852 	ld	xl, a
      0094A6 72 FB 04         [ 2]  853 	addw	x, (0x04, sp)
      0094A9 0C 09            [ 1]  854 	inc	(0x09, sp)
      0094AB F6               [ 1]  855 	ld	a, (x)
                                    856 ;	../src/pff.c: 669: if (c <= ' ' || c == '/') break;	/* Break on end of segment */
      0094AC 6B 06            [ 1]  857 	ld	(0x06, sp), a
      0094AE A1 20            [ 1]  858 	cp	a, #0x20
      0094B0 22 04            [ 1]  859 	jrugt	00161$
      0094B2 0F 07            [ 1]  860 	clr	(0x07, sp)
      0094B4 20 04            [ 2]  861 	jra	00162$
      0094B6                        862 00161$:
      0094B6 A6 01            [ 1]  863 	ld	a, #0x01
      0094B8 6B 07            [ 1]  864 	ld	(0x07, sp), a
      0094BA                        865 00162$:
      0094BA 0D 07            [ 1]  866 	tnz	(0x07, sp)
      0094BC 27 3D            [ 1]  867 	jreq	00119$
      0094BE 7B 06            [ 1]  868 	ld	a, (0x06, sp)
      0094C0 A1 2F            [ 1]  869 	cp	a, #0x2f
      0094C2 27 37            [ 1]  870 	jreq	00119$
                                    871 ;	../src/pff.c: 670: if (c == '.' || i >= ni) {
      0094C4 7B 06            [ 1]  872 	ld	a, (0x06, sp)
      0094C6 A0 2E            [ 1]  873 	sub	a, #0x2e
      0094C8 26 02            [ 1]  874 	jrne	00168$
      0094CA 4C               [ 1]  875 	inc	a
      0094CB 21                     876 	.byte 0x21
      0094CC                        877 00168$:
      0094CC 4F               [ 1]  878 	clr	a
      0094CD                        879 00169$:
      0094CD 4D               [ 1]  880 	tnz	a
      0094CE 26 08            [ 1]  881 	jrne	00107$
      0094D0 88               [ 1]  882 	push	a
      0094D1 7B 09            [ 1]  883 	ld	a, (0x09, sp)
      0094D3 11 04            [ 1]  884 	cp	a, (0x04, sp)
      0094D5 84               [ 1]  885 	pop	a
      0094D6 25 15            [ 1]  886 	jrc	00111$
      0094D8                        887 00107$:
                                    888 ;	../src/pff.c: 671: if (ni != 8 || c != '.') break;
      0094D8 88               [ 1]  889 	push	a
      0094D9 7B 04            [ 1]  890 	ld	a, (0x04, sp)
      0094DB A1 08            [ 1]  891 	cp	a, #0x08
      0094DD 84               [ 1]  892 	pop	a
      0094DE 26 1B            [ 1]  893 	jrne	00119$
      0094E0 4D               [ 1]  894 	tnz	a
      0094E1 27 18            [ 1]  895 	jreq	00119$
                                    896 ;	../src/pff.c: 672: i = 8; ni = 11;
      0094E3 A6 08            [ 1]  897 	ld	a, #0x08
      0094E5 6B 08            [ 1]  898 	ld	(0x08, sp), a
      0094E7 A6 0B            [ 1]  899 	ld	a, #0x0b
      0094E9 6B 03            [ 1]  900 	ld	(0x03, sp), a
                                    901 ;	../src/pff.c: 673: continue;
      0094EB 20 B5            [ 2]  902 	jra	00120$
                                    903 ;	../src/pff.c: 683: if (PF_USE_LCC && IsLower(c)) c -= 0x20;	/* toupper */
      0094ED                        904 00111$:
                                    905 ;	../src/pff.c: 684: sfn[i++] = c;
      0094ED 7B 08            [ 1]  906 	ld	a, (0x08, sp)
      0094EF 0C 08            [ 1]  907 	inc	(0x08, sp)
      0094F1 5F               [ 1]  908 	clrw	x
      0094F2 97               [ 1]  909 	ld	xl, a
      0094F3 72 FB 01         [ 2]  910 	addw	x, (0x01, sp)
      0094F6 7B 06            [ 1]  911 	ld	a, (0x06, sp)
      0094F8 F7               [ 1]  912 	ld	(x), a
      0094F9 20 A7            [ 2]  913 	jra	00120$
      0094FB                        914 00119$:
                                    915 ;	../src/pff.c: 687: *path = &p[si];						/* Rerurn pointer to the next segment */
      0094FB 5F               [ 1]  916 	clrw	x
      0094FC 7B 09            [ 1]  917 	ld	a, (0x09, sp)
      0094FE 97               [ 1]  918 	ld	xl, a
      0094FF 72 FB 04         [ 2]  919 	addw	x, (0x04, sp)
      009502 90 FF            [ 2]  920 	ldw	(y), x
                                    921 ;	../src/pff.c: 689: sfn[11] = (c <= ' ') ? 1 : 0;		/* Set last segment flag if end of path */
      009504 16 01            [ 2]  922 	ldw	y, (0x01, sp)
      009506 72 A9 00 0B      [ 2]  923 	addw	y, #0x000b
      00950A 0D 07            [ 1]  924 	tnz	(0x07, sp)
      00950C 26 03            [ 1]  925 	jrne	00123$
      00950E 5F               [ 1]  926 	clrw	x
      00950F 5C               [ 1]  927 	incw	x
      009510 21                     928 	.byte 0x21
      009511                        929 00123$:
      009511 5F               [ 1]  930 	clrw	x
      009512                        931 00124$:
      009512 9F               [ 1]  932 	ld	a, xl
      009513 90 F7            [ 1]  933 	ld	(y), a
                                    934 ;	../src/pff.c: 691: return FR_OK;
      009515 4F               [ 1]  935 	clr	a
                                    936 ;	../src/pff.c: 692: }
      009516 5B 09            [ 2]  937 	addw	sp, #9
      009518 81               [ 4]  938 	ret
                                    939 ;	../src/pff.c: 742: static FRESULT follow_path (	/* FR_OK(0): successful, !=0: error code */
                                    940 ;	-----------------------------------------
                                    941 ;	 function follow_path
                                    942 ;	-----------------------------------------
      009519                        943 _follow_path:
      009519 52 0E            [ 2]  944 	sub	sp, #14
                                    945 ;	../src/pff.c: 751: while (*path == ' ') path++;		/* Strip leading spaces */
      00951B 16 15            [ 2]  946 	ldw	y, (0x15, sp)
      00951D                        947 00101$:
      00951D 90 F6            [ 1]  948 	ld	a, (y)
      00951F 93               [ 1]  949 	ldw	x, y
      009520 5C               [ 1]  950 	incw	x
      009521 A1 20            [ 1]  951 	cp	a, #0x20
      009523 26 06            [ 1]  952 	jrne	00131$
      009525 90 93            [ 1]  953 	ldw	y, x
      009527 1F 15            [ 2]  954 	ldw	(0x15, sp), x
      009529 20 F2            [ 2]  955 	jra	00101$
      00952B                        956 00131$:
      00952B 17 15            [ 2]  957 	ldw	(0x15, sp), y
                                    958 ;	../src/pff.c: 752: if (*path == '/') path++;			/* Strip heading separator if exist */
      00952D A1 2F            [ 1]  959 	cp	a, #0x2f
      00952F 26 02            [ 1]  960 	jrne	00105$
      009531 1F 15            [ 2]  961 	ldw	(0x15, sp), x
      009533                        962 00105$:
                                    963 ;	../src/pff.c: 753: dj->sclust = 0;						/* Set start directory (always root dir) */
      009533 16 11            [ 2]  964 	ldw	y, (0x11, sp)
      009535 17 01            [ 2]  965 	ldw	(0x01, sp), y
      009537 93               [ 1]  966 	ldw	x, y
      009538 1C 00 04         [ 2]  967 	addw	x, #0x0004
      00953B 90 5F            [ 1]  968 	clrw	y
      00953D EF 02            [ 2]  969 	ldw	(0x2, x), y
      00953F FF               [ 2]  970 	ldw	(x), y
                                    971 ;	../src/pff.c: 755: if ((BYTE)*path < ' ') {			/* Null path means the root directory */
      009540 1E 15            [ 2]  972 	ldw	x, (0x15, sp)
      009542 F6               [ 1]  973 	ld	a, (x)
      009543 A1 20            [ 1]  974 	cp	a, #0x20
      009545 24 0E            [ 1]  975 	jrnc	00130$
                                    976 ;	../src/pff.c: 756: res = dir_rewind(dj);
      009547 1E 01            [ 2]  977 	ldw	x, (0x01, sp)
      009549 89               [ 2]  978 	pushw	x
      00954A CD 92 6E         [ 4]  979 	call	_dir_rewind
      00954D 85               [ 2]  980 	popw	x
      00954E 6B 0E            [ 1]  981 	ld	(0x0e, sp), a
                                    982 ;	../src/pff.c: 757: dir[0] = 0;
      009550 1E 13            [ 2]  983 	ldw	x, (0x13, sp)
      009552 7F               [ 1]  984 	clr	(x)
      009553 20 5E            [ 2]  985 	jra	00117$
      009555                        986 00130$:
      009555 16 01            [ 2]  987 	ldw	y, (0x01, sp)
      009557 17 03            [ 2]  988 	ldw	(0x03, sp), y
      009559 16 13            [ 2]  989 	ldw	y, (0x13, sp)
      00955B 17 05            [ 2]  990 	ldw	(0x05, sp), y
      00955D 16 01            [ 2]  991 	ldw	y, (0x01, sp)
      00955F 17 07            [ 2]  992 	ldw	(0x07, sp), y
      009561                        993 00118$:
                                    994 ;	../src/pff.c: 761: res = create_name(dj, &path);	/* Get a segment */
      009561 96               [ 1]  995 	ldw	x, sp
      009562 1C 00 15         [ 2]  996 	addw	x, #21
      009565 89               [ 2]  997 	pushw	x
      009566 1E 03            [ 2]  998 	ldw	x, (0x03, sp)
      009568 89               [ 2]  999 	pushw	x
      009569 CD 94 7E         [ 4] 1000 	call	_create_name
      00956C 5B 04            [ 2] 1001 	addw	sp, #4
                                   1002 ;	../src/pff.c: 762: if (res != FR_OK) break;
      00956E 6B 0E            [ 1] 1003 	ld	(0x0e, sp), a
      009570 26 41            [ 1] 1004 	jrne	00117$
                                   1005 ;	../src/pff.c: 763: res = dir_find(dj, dir);		/* Find it */
      009572 1E 13            [ 2] 1006 	ldw	x, (0x13, sp)
      009574 89               [ 2] 1007 	pushw	x
      009575 1E 03            [ 2] 1008 	ldw	x, (0x03, sp)
      009577 89               [ 2] 1009 	pushw	x
      009578 CD 93 FD         [ 4] 1010 	call	_dir_find
      00957B 5B 04            [ 2] 1011 	addw	sp, #4
                                   1012 ;	../src/pff.c: 764: if (res != FR_OK) break;		/* Could not find the object */
      00957D 6B 0E            [ 1] 1013 	ld	(0x0e, sp), a
      00957F 26 32            [ 1] 1014 	jrne	00117$
                                   1015 ;	../src/pff.c: 765: if (dj->fn[11]) break;			/* Last segment match. Function completed. */
      009581 1E 03            [ 2] 1016 	ldw	x, (0x03, sp)
      009583 EE 02            [ 2] 1017 	ldw	x, (0x2, x)
      009585 E6 0B            [ 1] 1018 	ld	a, (0xb, x)
      009587 26 2A            [ 1] 1019 	jrne	00117$
                                   1020 ;	../src/pff.c: 766: if (!(dir[DIR_Attr] & AM_DIR)) { /* Cannot follow path because it is a file */
      009589 1E 05            [ 2] 1021 	ldw	x, (0x05, sp)
      00958B E6 0B            [ 1] 1022 	ld	a, (0xb, x)
      00958D A5 10            [ 1] 1023 	bcp	a, #0x10
      00958F 26 06            [ 1] 1024 	jrne	00113$
                                   1025 ;	../src/pff.c: 767: res = FR_NO_FILE; break;
      009591 A6 03            [ 1] 1026 	ld	a, #0x03
      009593 6B 0E            [ 1] 1027 	ld	(0x0e, sp), a
      009595 20 1C            [ 2] 1028 	jra	00117$
      009597                       1029 00113$:
                                   1030 ;	../src/pff.c: 769: dj->sclust = get_clust(dir);	/* Follow next */
      009597 1E 07            [ 2] 1031 	ldw	x, (0x07, sp)
      009599 1C 00 04         [ 2] 1032 	addw	x, #0x0004
      00959C 1F 09            [ 2] 1033 	ldw	(0x09, sp), x
      00959E 1E 13            [ 2] 1034 	ldw	x, (0x13, sp)
      0095A0 89               [ 2] 1035 	pushw	x
      0095A1 CD 92 39         [ 4] 1036 	call	_get_clust
      0095A4 5B 02            [ 2] 1037 	addw	sp, #2
      0095A6 17 0B            [ 2] 1038 	ldw	(0x0b, sp), y
      0095A8 16 09            [ 2] 1039 	ldw	y, (0x09, sp)
      0095AA 90 EF 02         [ 2] 1040 	ldw	(0x2, y), x
      0095AD 1E 0B            [ 2] 1041 	ldw	x, (0x0b, sp)
      0095AF 90 FF            [ 2] 1042 	ldw	(y), x
      0095B1 20 AE            [ 2] 1043 	jra	00118$
      0095B3                       1044 00117$:
                                   1045 ;	../src/pff.c: 773: return res;
      0095B3 7B 0E            [ 1] 1046 	ld	a, (0x0e, sp)
                                   1047 ;	../src/pff.c: 774: }
      0095B5 5B 0E            [ 2] 1048 	addw	sp, #14
      0095B7 81               [ 4] 1049 	ret
                                   1050 ;	../src/pff.c: 783: static BYTE check_fs (	/* 0:The FAT boot record, 1:Valid boot record but not an FAT, 2:Not a boot record, 3:Error */
                                   1051 ;	-----------------------------------------
                                   1052 ;	 function check_fs
                                   1053 ;	-----------------------------------------
      0095B8                       1054 _check_fs:
                                   1055 ;	../src/pff.c: 788: if (disk_readp(buf, sect, 510, 2)) {	/* Read the boot record */
      0095B8 4B 02            [ 1] 1056 	push	#0x02
      0095BA 4B 00            [ 1] 1057 	push	#0x00
      0095BC 4B FE            [ 1] 1058 	push	#0xfe
      0095BE 4B 01            [ 1] 1059 	push	#0x01
      0095C0 1E 0B            [ 2] 1060 	ldw	x, (0x0b, sp)
      0095C2 89               [ 2] 1061 	pushw	x
      0095C3 1E 0B            [ 2] 1062 	ldw	x, (0x0b, sp)
      0095C5 89               [ 2] 1063 	pushw	x
      0095C6 1E 0B            [ 2] 1064 	ldw	x, (0x0b, sp)
      0095C8 89               [ 2] 1065 	pushw	x
      0095C9 CD 82 8F         [ 4] 1066 	call	_disk_readp
      0095CC 5B 0A            [ 2] 1067 	addw	sp, #10
      0095CE 4D               [ 1] 1068 	tnz	a
      0095CF 27 03            [ 1] 1069 	jreq	00102$
                                   1070 ;	../src/pff.c: 789: return 3;
      0095D1 A6 03            [ 1] 1071 	ld	a, #0x03
      0095D3 81               [ 4] 1072 	ret
      0095D4                       1073 00102$:
                                   1074 ;	../src/pff.c: 791: if (ld_word(buf) != 0xAA55) {			/* Check record signature */
      0095D4 1E 03            [ 2] 1075 	ldw	x, (0x03, sp)
      0095D6 89               [ 2] 1076 	pushw	x
      0095D7 CD 90 37         [ 4] 1077 	call	_ld_word
      0095DA 5B 02            [ 2] 1078 	addw	sp, #2
      0095DC A3 AA 55         [ 2] 1079 	cpw	x, #0xaa55
      0095DF 27 03            [ 1] 1080 	jreq	00111$
                                   1081 ;	../src/pff.c: 792: return 2;
      0095E1 A6 02            [ 1] 1082 	ld	a, #0x02
      0095E3 81               [ 4] 1083 	ret
                                   1084 ;	../src/pff.c: 798: if (PF_FS_FAT32 && !disk_readp(buf, sect, BS_FilSysType32, 2) && ld_word(buf) == 0x4146) {	/* Check FAT32 */
      0095E4                       1085 00111$:
      0095E4 4B 02            [ 1] 1086 	push	#0x02
      0095E6 4B 00            [ 1] 1087 	push	#0x00
      0095E8 4B 52            [ 1] 1088 	push	#0x52
      0095EA 4B 00            [ 1] 1089 	push	#0x00
      0095EC 1E 0B            [ 2] 1090 	ldw	x, (0x0b, sp)
      0095EE 89               [ 2] 1091 	pushw	x
      0095EF 1E 0B            [ 2] 1092 	ldw	x, (0x0b, sp)
      0095F1 89               [ 2] 1093 	pushw	x
      0095F2 1E 0B            [ 2] 1094 	ldw	x, (0x0b, sp)
      0095F4 89               [ 2] 1095 	pushw	x
      0095F5 CD 82 8F         [ 4] 1096 	call	_disk_readp
      0095F8 5B 0A            [ 2] 1097 	addw	sp, #10
      0095FA 4D               [ 1] 1098 	tnz	a
      0095FB 26 0F            [ 1] 1099 	jrne	00110$
      0095FD 1E 03            [ 2] 1100 	ldw	x, (0x03, sp)
      0095FF 89               [ 2] 1101 	pushw	x
      009600 CD 90 37         [ 4] 1102 	call	_ld_word
      009603 5B 02            [ 2] 1103 	addw	sp, #2
      009605 A3 41 46         [ 2] 1104 	cpw	x, #0x4146
      009608 26 02            [ 1] 1105 	jrne	00110$
                                   1106 ;	../src/pff.c: 799: return 0;
      00960A 4F               [ 1] 1107 	clr	a
      00960B 81               [ 4] 1108 	ret
      00960C                       1109 00110$:
                                   1110 ;	../src/pff.c: 801: return 1;
      00960C A6 01            [ 1] 1111 	ld	a, #0x01
                                   1112 ;	../src/pff.c: 802: }
      00960E 81               [ 4] 1113 	ret
                                   1114 ;	../src/pff.c: 819: FRESULT pf_mount (
                                   1115 ;	-----------------------------------------
                                   1116 ;	 function pf_mount
                                   1117 ;	-----------------------------------------
      00960F                       1118 _pf_mount:
      00960F 52 3C            [ 2] 1119 	sub	sp, #60
                                   1120 ;	../src/pff.c: 827: FatFs = 0;
      009611 5F               [ 1] 1121 	clrw	x
      009612 CF 02 67         [ 2] 1122 	ldw	_FatFs+0, x
                                   1123 ;	../src/pff.c: 829: if (disk_initialize() & STA_NOINIT) {	/* Check if the drive is ready or not */
      009615 CD 82 7B         [ 4] 1124 	call	_disk_initialize
      009618 44               [ 1] 1125 	srl	a
      009619 24 05            [ 1] 1126 	jrnc	00102$
                                   1127 ;	../src/pff.c: 830: return FR_NOT_READY;
      00961B A6 02            [ 1] 1128 	ld	a, #0x02
      00961D CC 98 5A         [ 2] 1129 	jp	00137$
      009620                       1130 00102$:
                                   1131 ;	../src/pff.c: 834: bsect = 0;
      009620 5F               [ 1] 1132 	clrw	x
      009621 1F 33            [ 2] 1133 	ldw	(0x33, sp), x
      009623 1F 31            [ 2] 1134 	ldw	(0x31, sp), x
                                   1135 ;	../src/pff.c: 835: fmt = check_fs(buf, bsect);			/* Check sector 0 as an SFD format */
      009625 5F               [ 1] 1136 	clrw	x
      009626 89               [ 2] 1137 	pushw	x
      009627 5F               [ 1] 1138 	clrw	x
      009628 89               [ 2] 1139 	pushw	x
      009629 96               [ 1] 1140 	ldw	x, sp
      00962A 1C 00 05         [ 2] 1141 	addw	x, #5
      00962D 89               [ 2] 1142 	pushw	x
      00962E CD 95 B8         [ 4] 1143 	call	_check_fs
      009631 5B 06            [ 2] 1144 	addw	sp, #6
      009633 6B 3C            [ 1] 1145 	ld	(0x3c, sp), a
                                   1146 ;	../src/pff.c: 841: if (buf[4]) {					/* Is the partition existing? */
      009635 96               [ 1] 1147 	ldw	x, sp
      009636 1C 00 05         [ 2] 1148 	addw	x, #5
      009639 1F 39            [ 2] 1149 	ldw	(0x39, sp), x
                                   1150 ;	../src/pff.c: 836: if (fmt == 1) {						/* Not an FAT boot record, it may be FDISK format */
      00963B 7B 3C            [ 1] 1151 	ld	a, (0x3c, sp)
      00963D 4A               [ 1] 1152 	dec	a
      00963E 26 44            [ 1] 1153 	jrne	00109$
                                   1154 ;	../src/pff.c: 838: if (disk_readp(buf, bsect, MBR_Table, 16)) {	/* 1st partition entry */
      009640 4B 10            [ 1] 1155 	push	#0x10
      009642 4B 00            [ 1] 1156 	push	#0x00
      009644 4B BE            [ 1] 1157 	push	#0xbe
      009646 4B 01            [ 1] 1158 	push	#0x01
      009648 5F               [ 1] 1159 	clrw	x
      009649 89               [ 2] 1160 	pushw	x
      00964A 5F               [ 1] 1161 	clrw	x
      00964B 89               [ 2] 1162 	pushw	x
      00964C 96               [ 1] 1163 	ldw	x, sp
      00964D 1C 00 09         [ 2] 1164 	addw	x, #9
      009650 89               [ 2] 1165 	pushw	x
      009651 CD 82 8F         [ 4] 1166 	call	_disk_readp
      009654 5B 0A            [ 2] 1167 	addw	sp, #10
      009656 4D               [ 1] 1168 	tnz	a
      009657 27 06            [ 1] 1169 	jreq	00106$
                                   1170 ;	../src/pff.c: 839: fmt = 3;
      009659 A6 03            [ 1] 1171 	ld	a, #0x03
      00965B 6B 3C            [ 1] 1172 	ld	(0x3c, sp), a
      00965D 20 25            [ 2] 1173 	jra	00109$
      00965F                       1174 00106$:
                                   1175 ;	../src/pff.c: 841: if (buf[4]) {					/* Is the partition existing? */
      00965F 1E 39            [ 2] 1176 	ldw	x, (0x39, sp)
      009661 F6               [ 1] 1177 	ld	a, (x)
      009662 27 20            [ 1] 1178 	jreq	00109$
                                   1179 ;	../src/pff.c: 842: bsect = ld_dword(&buf[8]);	/* Partition offset in LBA */
      009664 96               [ 1] 1180 	ldw	x, sp
      009665 1C 00 09         [ 2] 1181 	addw	x, #9
      009668 89               [ 2] 1182 	pushw	x
      009669 CD 90 4D         [ 4] 1183 	call	_ld_dword
      00966C 5B 02            [ 2] 1184 	addw	sp, #2
      00966E 1F 33            [ 2] 1185 	ldw	(0x33, sp), x
      009670 17 31            [ 2] 1186 	ldw	(0x31, sp), y
                                   1187 ;	../src/pff.c: 843: fmt = check_fs(buf, bsect);	/* Check the partition */
      009672 1E 33            [ 2] 1188 	ldw	x, (0x33, sp)
      009674 89               [ 2] 1189 	pushw	x
      009675 1E 33            [ 2] 1190 	ldw	x, (0x33, sp)
      009677 89               [ 2] 1191 	pushw	x
      009678 96               [ 1] 1192 	ldw	x, sp
      009679 1C 00 05         [ 2] 1193 	addw	x, #5
      00967C 89               [ 2] 1194 	pushw	x
      00967D CD 95 B8         [ 4] 1195 	call	_check_fs
      009680 5B 06            [ 2] 1196 	addw	sp, #6
      009682 6B 3C            [ 1] 1197 	ld	(0x3c, sp), a
      009684                       1198 00109$:
                                   1199 ;	../src/pff.c: 847: if (fmt == 3) return FR_DISK_ERR;
      009684 7B 3C            [ 1] 1200 	ld	a, (0x3c, sp)
      009686 A1 03            [ 1] 1201 	cp	a, #0x03
      009688 26 05            [ 1] 1202 	jrne	00111$
      00968A A6 01            [ 1] 1203 	ld	a, #0x01
      00968C CC 98 5A         [ 2] 1204 	jp	00137$
      00968F                       1205 00111$:
                                   1206 ;	../src/pff.c: 848: if (fmt) return FR_NO_FILESYSTEM;	/* No valid FAT patition is found */
      00968F 0D 3C            [ 1] 1207 	tnz	(0x3c, sp)
      009691 27 05            [ 1] 1208 	jreq	00113$
      009693 A6 06            [ 1] 1209 	ld	a, #0x06
      009695 CC 98 5A         [ 2] 1210 	jp	00137$
      009698                       1211 00113$:
                                   1212 ;	../src/pff.c: 851: if (disk_readp(buf, bsect, 13, sizeof (buf))) return FR_DISK_ERR;
      009698 4B 24            [ 1] 1213 	push	#0x24
      00969A 4B 00            [ 1] 1214 	push	#0x00
      00969C 4B 0D            [ 1] 1215 	push	#0x0d
      00969E 4B 00            [ 1] 1216 	push	#0x00
      0096A0 1E 37            [ 2] 1217 	ldw	x, (0x37, sp)
      0096A2 89               [ 2] 1218 	pushw	x
      0096A3 1E 37            [ 2] 1219 	ldw	x, (0x37, sp)
      0096A5 89               [ 2] 1220 	pushw	x
      0096A6 96               [ 1] 1221 	ldw	x, sp
      0096A7 1C 00 09         [ 2] 1222 	addw	x, #9
      0096AA 89               [ 2] 1223 	pushw	x
      0096AB CD 82 8F         [ 4] 1224 	call	_disk_readp
      0096AE 5B 0A            [ 2] 1225 	addw	sp, #10
      0096B0 4D               [ 1] 1226 	tnz	a
      0096B1 27 05            [ 1] 1227 	jreq	00115$
      0096B3 A6 01            [ 1] 1228 	ld	a, #0x01
      0096B5 CC 98 5A         [ 2] 1229 	jp	00137$
      0096B8                       1230 00115$:
                                   1231 ;	../src/pff.c: 853: fsize = ld_word(buf+BPB_FATSz16-13);				/* Number of sectors per FAT */
      0096B8 96               [ 1] 1232 	ldw	x, sp
      0096B9 1C 00 0A         [ 2] 1233 	addw	x, #10
      0096BC 89               [ 2] 1234 	pushw	x
      0096BD CD 90 37         [ 4] 1235 	call	_ld_word
      0096C0 5B 02            [ 2] 1236 	addw	sp, #2
      0096C2 90 5F            [ 1] 1237 	clrw	y
      0096C4 1F 37            [ 2] 1238 	ldw	(0x37, sp), x
      0096C6 17 35            [ 2] 1239 	ldw	(0x35, sp), y
                                   1240 ;	../src/pff.c: 854: if (!fsize) fsize = ld_dword(buf+BPB_FATSz32-13);
      0096C8 1E 37            [ 2] 1241 	ldw	x, (0x37, sp)
      0096CA 26 12            [ 1] 1242 	jrne	00117$
      0096CC 1E 35            [ 2] 1243 	ldw	x, (0x35, sp)
      0096CE 26 0E            [ 1] 1244 	jrne	00117$
      0096D0 96               [ 1] 1245 	ldw	x, sp
      0096D1 1C 00 18         [ 2] 1246 	addw	x, #24
      0096D4 89               [ 2] 1247 	pushw	x
      0096D5 CD 90 4D         [ 4] 1248 	call	_ld_dword
      0096D8 5B 02            [ 2] 1249 	addw	sp, #2
      0096DA 1F 37            [ 2] 1250 	ldw	(0x37, sp), x
      0096DC 17 35            [ 2] 1251 	ldw	(0x35, sp), y
      0096DE                       1252 00117$:
                                   1253 ;	../src/pff.c: 856: fsize *= buf[BPB_NumFATs-13];						/* Number of sectors in FAT area */
      0096DE 7B 04            [ 1] 1254 	ld	a, (0x04, sp)
      0096E0 5F               [ 1] 1255 	clrw	x
      0096E1 97               [ 1] 1256 	ld	xl, a
      0096E2 90 5F            [ 1] 1257 	clrw	y
      0096E4 89               [ 2] 1258 	pushw	x
      0096E5 90 89            [ 2] 1259 	pushw	y
      0096E7 1E 3B            [ 2] 1260 	ldw	x, (0x3b, sp)
      0096E9 89               [ 2] 1261 	pushw	x
      0096EA 1E 3B            [ 2] 1262 	ldw	x, (0x3b, sp)
      0096EC 89               [ 2] 1263 	pushw	x
      0096ED CD 9D DA         [ 4] 1264 	call	__mullong
      0096F0 5B 08            [ 2] 1265 	addw	sp, #8
      0096F2 1F 27            [ 2] 1266 	ldw	(0x27, sp), x
      0096F4 17 25            [ 2] 1267 	ldw	(0x25, sp), y
                                   1268 ;	../src/pff.c: 857: fs->fatbase = bsect + ld_word(buf+BPB_RsvdSecCnt-13); /* FAT start sector (lba) */
      0096F6 16 3F            [ 2] 1269 	ldw	y, (0x3f, sp)
      0096F8 17 29            [ 2] 1270 	ldw	(0x29, sp), y
      0096FA 93               [ 1] 1271 	ldw	x, y
      0096FB 1C 00 0A         [ 2] 1272 	addw	x, #0x000a
      0096FE 1F 2B            [ 2] 1273 	ldw	(0x2b, sp), x
      009700 96               [ 1] 1274 	ldw	x, sp
      009701 5C               [ 1] 1275 	incw	x
      009702 5C               [ 1] 1276 	incw	x
      009703 1F 3B            [ 2] 1277 	ldw	(0x3b, sp), x
      009705 89               [ 2] 1278 	pushw	x
      009706 CD 90 37         [ 4] 1279 	call	_ld_word
      009709 5B 02            [ 2] 1280 	addw	sp, #2
      00970B 51               [ 1] 1281 	exgw	x, y
      00970C 4F               [ 1] 1282 	clr	a
      00970D 5F               [ 1] 1283 	clrw	x
      00970E 72 F9 33         [ 2] 1284 	addw	y, (0x33, sp)
      009711 19 32            [ 1] 1285 	adc	a, (0x32, sp)
      009713 6B 36            [ 1] 1286 	ld	(0x36, sp), a
      009715 9E               [ 1] 1287 	ld	a, xh
      009716 19 31            [ 1] 1288 	adc	a, (0x31, sp)
      009718 6B 35            [ 1] 1289 	ld	(0x35, sp), a
      00971A 1E 2B            [ 2] 1290 	ldw	x, (0x2b, sp)
      00971C EF 02            [ 2] 1291 	ldw	(0x2, x), y
      00971E 16 35            [ 2] 1292 	ldw	y, (0x35, sp)
      009720 FF               [ 2] 1293 	ldw	(x), y
                                   1294 ;	../src/pff.c: 858: fs->csize = buf[BPB_SecPerClus-13];					/* Number of sectors per cluster */
      009721 1E 29            [ 2] 1295 	ldw	x, (0x29, sp)
      009723 5C               [ 1] 1296 	incw	x
      009724 5C               [ 1] 1297 	incw	x
      009725 1F 2D            [ 2] 1298 	ldw	(0x2d, sp), x
      009727 7B 01            [ 1] 1299 	ld	a, (0x01, sp)
      009729 1E 2D            [ 2] 1300 	ldw	x, (0x2d, sp)
      00972B F7               [ 1] 1301 	ld	(x), a
                                   1302 ;	../src/pff.c: 859: fs->n_rootdir = ld_word(buf+BPB_RootEntCnt-13);		/* Nmuber of root directory entries */
      00972C 1E 29            [ 2] 1303 	ldw	x, (0x29, sp)
      00972E 1C 00 04         [ 2] 1304 	addw	x, #0x0004
      009731 1F 2F            [ 2] 1305 	ldw	(0x2f, sp), x
      009733 1E 39            [ 2] 1306 	ldw	x, (0x39, sp)
      009735 89               [ 2] 1307 	pushw	x
      009736 CD 90 37         [ 4] 1308 	call	_ld_word
      009739 5B 02            [ 2] 1309 	addw	sp, #2
      00973B 16 2F            [ 2] 1310 	ldw	y, (0x2f, sp)
      00973D 90 FF            [ 2] 1311 	ldw	(y), x
                                   1312 ;	../src/pff.c: 860: tsect = ld_word(buf+BPB_TotSec16-13);				/* Number of sectors on the file system */
      00973F 96               [ 1] 1313 	ldw	x, sp
      009740 1C 00 07         [ 2] 1314 	addw	x, #7
      009743 89               [ 2] 1315 	pushw	x
      009744 CD 90 37         [ 4] 1316 	call	_ld_word
      009747 5B 02            [ 2] 1317 	addw	sp, #2
      009749 90 5F            [ 1] 1318 	clrw	y
      00974B 1F 37            [ 2] 1319 	ldw	(0x37, sp), x
      00974D 17 35            [ 2] 1320 	ldw	(0x35, sp), y
                                   1321 ;	../src/pff.c: 861: if (!tsect) tsect = ld_dword(buf+BPB_TotSec32-13);
      00974F 5D               [ 2] 1322 	tnzw	x
      009750 26 12            [ 1] 1323 	jrne	00119$
      009752 90 5D            [ 2] 1324 	tnzw	y
      009754 26 0E            [ 1] 1325 	jrne	00119$
      009756 96               [ 1] 1326 	ldw	x, sp
      009757 1C 00 14         [ 2] 1327 	addw	x, #20
      00975A 89               [ 2] 1328 	pushw	x
      00975B CD 90 4D         [ 4] 1329 	call	_ld_dword
      00975E 5B 02            [ 2] 1330 	addw	sp, #2
      009760 1F 37            [ 2] 1331 	ldw	(0x37, sp), x
      009762 17 35            [ 2] 1332 	ldw	(0x35, sp), y
      009764                       1333 00119$:
                                   1334 ;	../src/pff.c: 863: - ld_word(buf+BPB_RsvdSecCnt-13) - fsize - fs->n_rootdir / 16
      009764 1E 3B            [ 2] 1335 	ldw	x, (0x3b, sp)
      009766 89               [ 2] 1336 	pushw	x
      009767 CD 90 37         [ 4] 1337 	call	_ld_word
      00976A 5B 02            [ 2] 1338 	addw	sp, #2
      00976C 1F 3B            [ 2] 1339 	ldw	(0x3b, sp), x
      00976E 0F 3A            [ 1] 1340 	clr	(0x3a, sp)
      009770 0F 39            [ 1] 1341 	clr	(0x39, sp)
      009772 16 37            [ 2] 1342 	ldw	y, (0x37, sp)
      009774 72 F2 3B         [ 2] 1343 	subw	y, (0x3b, sp)
      009777 7B 36            [ 1] 1344 	ld	a, (0x36, sp)
      009779 12 3A            [ 1] 1345 	sbc	a, (0x3a, sp)
      00977B 88               [ 1] 1346 	push	a
      00977C 7B 36            [ 1] 1347 	ld	a, (0x36, sp)
      00977E 12 3A            [ 1] 1348 	sbc	a, (0x3a, sp)
      009780 97               [ 1] 1349 	ld	xl, a
      009781 84               [ 1] 1350 	pop	a
      009782 72 F2 27         [ 2] 1351 	subw	y, (0x27, sp)
      009785 12 26            [ 1] 1352 	sbc	a, (0x26, sp)
      009787 6B 32            [ 1] 1353 	ld	(0x32, sp), a
      009789 9F               [ 1] 1354 	ld	a, xl
      00978A 12 25            [ 1] 1355 	sbc	a, (0x25, sp)
      00978C 1E 2F            [ 2] 1356 	ldw	x, (0x2f, sp)
      00978E FE               [ 2] 1357 	ldw	x, (x)
      00978F 54               [ 2] 1358 	srlw	x
      009790 54               [ 2] 1359 	srlw	x
      009791 54               [ 2] 1360 	srlw	x
      009792 54               [ 2] 1361 	srlw	x
      009793 1F 37            [ 2] 1362 	ldw	(0x37, sp), x
      009795 5F               [ 1] 1363 	clrw	x
      009796 0F 35            [ 1] 1364 	clr	(0x35, sp)
      009798 72 F2 37         [ 2] 1365 	subw	y, (0x37, sp)
      00979B 17 3B            [ 2] 1366 	ldw	(0x3b, sp), y
      00979D 88               [ 1] 1367 	push	a
      00979E 7B 33            [ 1] 1368 	ld	a, (0x33, sp)
      0097A0 89               [ 2] 1369 	pushw	x
      0097A1 12 02            [ 1] 1370 	sbc	a, (2, sp)
      0097A3 85               [ 2] 1371 	popw	x
      0097A4 6B 3B            [ 1] 1372 	ld	(0x3b, sp), a
      0097A6 84               [ 1] 1373 	pop	a
      0097A7 12 35            [ 1] 1374 	sbc	a, (0x35, sp)
      0097A9 6B 39            [ 1] 1375 	ld	(0x39, sp), a
                                   1376 ;	../src/pff.c: 864: ) / fs->csize + 2;
      0097AB 1E 2D            [ 2] 1377 	ldw	x, (0x2d, sp)
      0097AD F6               [ 1] 1378 	ld	a, (x)
      0097AE 5F               [ 1] 1379 	clrw	x
      0097AF 97               [ 1] 1380 	ld	xl, a
      0097B0 90 5F            [ 1] 1381 	clrw	y
      0097B2 89               [ 2] 1382 	pushw	x
      0097B3 90 89            [ 2] 1383 	pushw	y
      0097B5 1E 3F            [ 2] 1384 	ldw	x, (0x3f, sp)
      0097B7 89               [ 2] 1385 	pushw	x
      0097B8 1E 3F            [ 2] 1386 	ldw	x, (0x3f, sp)
      0097BA 89               [ 2] 1387 	pushw	x
      0097BB CD 9D 80         [ 4] 1388 	call	__divulong
      0097BE 5B 08            [ 2] 1389 	addw	sp, #8
      0097C0 17 39            [ 2] 1390 	ldw	(0x39, sp), y
      0097C2 1C 00 02         [ 2] 1391 	addw	x, #0x0002
      0097C5 51               [ 1] 1392 	exgw	x, y
      0097C6 1E 39            [ 2] 1393 	ldw	x, (0x39, sp)
      0097C8 24 01            [ 1] 1394 	jrnc	00209$
      0097CA 5C               [ 1] 1395 	incw	x
      0097CB                       1396 00209$:
      0097CB 1F 39            [ 2] 1397 	ldw	(0x39, sp), x
                                   1398 ;	../src/pff.c: 865: fs->n_fatent = (CLUST)mclst;
      0097CD 1E 29            [ 2] 1399 	ldw	x, (0x29, sp)
      0097CF 1C 00 06         [ 2] 1400 	addw	x, #0x0006
      0097D2 EF 02            [ 2] 1401 	ldw	(0x2, x), y
      0097D4 7B 3A            [ 1] 1402 	ld	a, (0x3a, sp)
      0097D6 E7 01            [ 1] 1403 	ld	(0x1, x), a
      0097D8 7B 39            [ 1] 1404 	ld	a, (0x39, sp)
      0097DA F7               [ 1] 1405 	ld	(x), a
                                   1406 ;	../src/pff.c: 867: fmt = 0;							/* Determine the FAT sub type */
      0097DB 4F               [ 1] 1407 	clr	a
                                   1408 ;	../src/pff.c: 870: if (PF_FS_FAT32 && mclst >= 0xFFF7) fmt = FS_FAT32;
      0097DC 90 A3 FF F7      [ 2] 1409 	cpw	y, #0xfff7
      0097E0 88               [ 1] 1410 	push	a
      0097E1 7B 3B            [ 1] 1411 	ld	a, (0x3b, sp)
      0097E3 A2 00            [ 1] 1412 	sbc	a, #0x00
      0097E5 7B 3A            [ 1] 1413 	ld	a, (0x3a, sp)
      0097E7 A2 00            [ 1] 1414 	sbc	a, #0x00
      0097E9 84               [ 1] 1415 	pop	a
      0097EA 25 02            [ 1] 1416 	jrc	00128$
      0097EC A6 03            [ 1] 1417 	ld	a, #0x03
      0097EE                       1418 00128$:
                                   1419 ;	../src/pff.c: 871: if (!fmt) return FR_NO_FILESYSTEM;
      0097EE 4D               [ 1] 1420 	tnz	a
      0097EF 26 04            [ 1] 1421 	jrne	00131$
      0097F1 A6 06            [ 1] 1422 	ld	a, #0x06
      0097F3 20 65            [ 2] 1423 	jra	00137$
      0097F5                       1424 00131$:
                                   1425 ;	../src/pff.c: 872: fs->fs_type = fmt;
      0097F5 1E 29            [ 2] 1426 	ldw	x, (0x29, sp)
      0097F7 F7               [ 1] 1427 	ld	(x), a
                                   1428 ;	../src/pff.c: 875: fs->dirbase = ld_dword(buf+(BPB_RootClus-13));	/* Root directory start cluster */
      0097F8 1E 29            [ 2] 1429 	ldw	x, (0x29, sp)
      0097FA 1C 00 0E         [ 2] 1430 	addw	x, #0x000e
      0097FD 1F 37            [ 2] 1431 	ldw	(0x37, sp), x
      0097FF 96               [ 1] 1432 	ldw	x, sp
      009800 1C 00 20         [ 2] 1433 	addw	x, #32
      009803 89               [ 2] 1434 	pushw	x
      009804 CD 90 4D         [ 4] 1435 	call	_ld_dword
      009807 5B 02            [ 2] 1436 	addw	sp, #2
      009809 17 39            [ 2] 1437 	ldw	(0x39, sp), y
      00980B 16 37            [ 2] 1438 	ldw	y, (0x37, sp)
      00980D 90 EF 02         [ 2] 1439 	ldw	(0x2, y), x
      009810 1E 39            [ 2] 1440 	ldw	x, (0x39, sp)
      009812 90 FF            [ 2] 1441 	ldw	(y), x
                                   1442 ;	../src/pff.c: 879: fs->database = fs->fatbase + fsize + fs->n_rootdir / 16;	/* Data start sector (lba) */
      009814 1E 29            [ 2] 1443 	ldw	x, (0x29, sp)
      009816 1C 00 12         [ 2] 1444 	addw	x, #0x0012
      009819 1F 3B            [ 2] 1445 	ldw	(0x3b, sp), x
      00981B 1E 2B            [ 2] 1446 	ldw	x, (0x2b, sp)
      00981D 90 93            [ 1] 1447 	ldw	y, x
      00981F 90 EE 02         [ 2] 1448 	ldw	y, (0x2, y)
      009822 FE               [ 2] 1449 	ldw	x, (x)
      009823 72 F9 27         [ 2] 1450 	addw	y, (0x27, sp)
      009826 17 39            [ 2] 1451 	ldw	(0x39, sp), y
      009828 9F               [ 1] 1452 	ld	a, xl
      009829 19 26            [ 1] 1453 	adc	a, (0x26, sp)
      00982B 6B 38            [ 1] 1454 	ld	(0x38, sp), a
      00982D 9E               [ 1] 1455 	ld	a, xh
      00982E 19 25            [ 1] 1456 	adc	a, (0x25, sp)
      009830 1E 2F            [ 2] 1457 	ldw	x, (0x2f, sp)
      009832 FE               [ 2] 1458 	ldw	x, (x)
      009833 54               [ 2] 1459 	srlw	x
      009834 54               [ 2] 1460 	srlw	x
      009835 54               [ 2] 1461 	srlw	x
      009836 54               [ 2] 1462 	srlw	x
      009837 51               [ 1] 1463 	exgw	x, y
      009838 5F               [ 1] 1464 	clrw	x
      009839 0F 2F            [ 1] 1465 	clr	(0x2f, sp)
      00983B 72 F9 39         [ 2] 1466 	addw	y, (0x39, sp)
      00983E 88               [ 1] 1467 	push	a
      00983F 9F               [ 1] 1468 	ld	a, xl
      009840 19 39            [ 1] 1469 	adc	a, (0x39, sp)
      009842 6B 35            [ 1] 1470 	ld	(0x35, sp), a
      009844 84               [ 1] 1471 	pop	a
      009845 19 2F            [ 1] 1472 	adc	a, (0x2f, sp)
      009847 6B 33            [ 1] 1473 	ld	(0x33, sp), a
      009849 1E 3B            [ 2] 1474 	ldw	x, (0x3b, sp)
      00984B EF 02            [ 2] 1475 	ldw	(0x2, x), y
      00984D 16 33            [ 2] 1476 	ldw	y, (0x33, sp)
      00984F FF               [ 2] 1477 	ldw	(x), y
                                   1478 ;	../src/pff.c: 881: fs->flag = 0;
      009850 1E 29            [ 2] 1479 	ldw	x, (0x29, sp)
      009852 5C               [ 1] 1480 	incw	x
      009853 7F               [ 1] 1481 	clr	(x)
                                   1482 ;	../src/pff.c: 882: FatFs = fs;
      009854 1E 29            [ 2] 1483 	ldw	x, (0x29, sp)
      009856 CF 02 67         [ 2] 1484 	ldw	_FatFs+0, x
                                   1485 ;	../src/pff.c: 884: return FR_OK;
      009859 4F               [ 1] 1486 	clr	a
      00985A                       1487 00137$:
                                   1488 ;	../src/pff.c: 885: }
      00985A 5B 3C            [ 2] 1489 	addw	sp, #60
      00985C 81               [ 4] 1490 	ret
                                   1491 ;	../src/pff.c: 894: FRESULT pf_open (
                                   1492 ;	-----------------------------------------
                                   1493 ;	 function pf_open
                                   1494 ;	-----------------------------------------
      00985D                       1495 _pf_open:
      00985D 52 46            [ 2] 1496 	sub	sp, #70
                                   1497 ;	../src/pff.c: 901: FATFS *fs = FatFs;
      00985F CE 02 67         [ 2] 1498 	ldw	x, _FatFs+0
                                   1499 ;	../src/pff.c: 904: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
      009862 1F 3D            [ 2] 1500 	ldw	(0x3d, sp), x
      009864 26 05            [ 1] 1501 	jrne	00102$
      009866 A6 05            [ 1] 1502 	ld	a, #0x05
      009868 CC 98 EB         [ 2] 1503 	jp	00108$
      00986B                       1504 00102$:
                                   1505 ;	../src/pff.c: 906: fs->flag = 0;
      00986B 1E 3D            [ 2] 1506 	ldw	x, (0x3d, sp)
      00986D 5C               [ 1] 1507 	incw	x
      00986E 1F 3F            [ 2] 1508 	ldw	(0x3f, sp), x
      009870 7F               [ 1] 1509 	clr	(x)
                                   1510 ;	../src/pff.c: 907: dj.fn = sp;
      009871 96               [ 1] 1511 	ldw	x, sp
      009872 1C 00 03         [ 2] 1512 	addw	x, #3
      009875 90 96            [ 1] 1513 	ldw	y, sp
      009877 72 A9 00 11      [ 2] 1514 	addw	y, #17
      00987B FF               [ 2] 1515 	ldw	(x), y
                                   1516 ;	../src/pff.c: 908: res = follow_path(&dj, dir, path);	/* Follow the file path */
      00987C 1E 49            [ 2] 1517 	ldw	x, (0x49, sp)
      00987E 89               [ 2] 1518 	pushw	x
      00987F 96               [ 1] 1519 	ldw	x, sp
      009880 1C 00 1F         [ 2] 1520 	addw	x, #31
      009883 89               [ 2] 1521 	pushw	x
      009884 96               [ 1] 1522 	ldw	x, sp
      009885 1C 00 05         [ 2] 1523 	addw	x, #5
      009888 89               [ 2] 1524 	pushw	x
      009889 CD 95 19         [ 4] 1525 	call	_follow_path
      00988C 5B 06            [ 2] 1526 	addw	sp, #6
      00988E 97               [ 1] 1527 	ld	xl, a
                                   1528 ;	../src/pff.c: 909: if (res != FR_OK) return res;		/* Follow failed */
      00988F 4D               [ 1] 1529 	tnz	a
      009890 27 03            [ 1] 1530 	jreq	00104$
      009892 9F               [ 1] 1531 	ld	a, xl
      009893 20 56            [ 2] 1532 	jra	00108$
      009895                       1533 00104$:
                                   1534 ;	../src/pff.c: 910: if (!dir[0] || (dir[DIR_Attr] & AM_DIR)) return FR_NO_FILE;	/* It is a directory */
      009895 7B 1D            [ 1] 1535 	ld	a, (0x1d, sp)
      009897 27 06            [ 1] 1536 	jreq	00105$
      009899 7B 28            [ 1] 1537 	ld	a, (0x28, sp)
      00989B A5 10            [ 1] 1538 	bcp	a, #0x10
      00989D 27 04            [ 1] 1539 	jreq	00106$
      00989F                       1540 00105$:
      00989F A6 03            [ 1] 1541 	ld	a, #0x03
      0098A1 20 48            [ 2] 1542 	jra	00108$
      0098A3                       1543 00106$:
                                   1544 ;	../src/pff.c: 912: fs->org_clust = get_clust(dir);		/* File start cluster */
      0098A3 1E 3D            [ 2] 1545 	ldw	x, (0x3d, sp)
      0098A5 1C 00 1E         [ 2] 1546 	addw	x, #0x001e
      0098A8 1F 41            [ 2] 1547 	ldw	(0x41, sp), x
      0098AA 96               [ 1] 1548 	ldw	x, sp
      0098AB 1C 00 1D         [ 2] 1549 	addw	x, #29
      0098AE 89               [ 2] 1550 	pushw	x
      0098AF CD 92 39         [ 4] 1551 	call	_get_clust
      0098B2 5B 02            [ 2] 1552 	addw	sp, #2
      0098B4 17 43            [ 2] 1553 	ldw	(0x43, sp), y
      0098B6 16 41            [ 2] 1554 	ldw	y, (0x41, sp)
      0098B8 90 EF 02         [ 2] 1555 	ldw	(0x2, y), x
      0098BB 1E 43            [ 2] 1556 	ldw	x, (0x43, sp)
      0098BD 90 FF            [ 2] 1557 	ldw	(y), x
                                   1558 ;	../src/pff.c: 913: fs->fsize = ld_dword(dir+DIR_FileSize);	/* File size */
      0098BF 1E 3D            [ 2] 1559 	ldw	x, (0x3d, sp)
      0098C1 1C 00 1A         [ 2] 1560 	addw	x, #0x001a
      0098C4 1F 41            [ 2] 1561 	ldw	(0x41, sp), x
      0098C6 96               [ 1] 1562 	ldw	x, sp
      0098C7 1C 00 39         [ 2] 1563 	addw	x, #57
      0098CA 89               [ 2] 1564 	pushw	x
      0098CB CD 90 4D         [ 4] 1565 	call	_ld_dword
      0098CE 5B 02            [ 2] 1566 	addw	sp, #2
      0098D0 17 43            [ 2] 1567 	ldw	(0x43, sp), y
      0098D2 16 41            [ 2] 1568 	ldw	y, (0x41, sp)
      0098D4 90 EF 02         [ 2] 1569 	ldw	(0x2, y), x
      0098D7 1E 43            [ 2] 1570 	ldw	x, (0x43, sp)
      0098D9 90 FF            [ 2] 1571 	ldw	(y), x
                                   1572 ;	../src/pff.c: 914: fs->fptr = 0;						/* File pointer */
      0098DB 1E 3D            [ 2] 1573 	ldw	x, (0x3d, sp)
      0098DD 1C 00 16         [ 2] 1574 	addw	x, #0x0016
      0098E0 90 5F            [ 1] 1575 	clrw	y
      0098E2 EF 02            [ 2] 1576 	ldw	(0x2, x), y
      0098E4 FF               [ 2] 1577 	ldw	(x), y
                                   1578 ;	../src/pff.c: 915: fs->flag = FA_OPENED;
      0098E5 1E 3F            [ 2] 1579 	ldw	x, (0x3f, sp)
      0098E7 A6 01            [ 1] 1580 	ld	a, #0x01
      0098E9 F7               [ 1] 1581 	ld	(x), a
                                   1582 ;	../src/pff.c: 917: return FR_OK;
      0098EA 4F               [ 1] 1583 	clr	a
      0098EB                       1584 00108$:
                                   1585 ;	../src/pff.c: 918: }
      0098EB 5B 46            [ 2] 1586 	addw	sp, #70
      0098ED 81               [ 4] 1587 	ret
                                   1588 ;	../src/pff.c: 928: FRESULT pf_read (
                                   1589 ;	-----------------------------------------
                                   1590 ;	 function pf_read
                                   1591 ;	-----------------------------------------
      0098EE                       1592 _pf_read:
      0098EE 52 1A            [ 2] 1593 	sub	sp, #26
                                   1594 ;	../src/pff.c: 938: BYTE cs, *rbuff = buff;
      0098F0 1E 1D            [ 2] 1595 	ldw	x, (0x1d, sp)
      0098F2 1F 01            [ 2] 1596 	ldw	(0x01, sp), x
                                   1597 ;	../src/pff.c: 939: FATFS *fs = FatFs;
      0098F4 CE 02 67         [ 2] 1598 	ldw	x, _FatFs+0
      0098F7 1F 19            [ 2] 1599 	ldw	(0x19, sp), x
                                   1600 ;	../src/pff.c: 942: *br = 0;
      0098F9 16 21            [ 2] 1601 	ldw	y, (0x21, sp)
      0098FB 17 03            [ 2] 1602 	ldw	(0x03, sp), y
      0098FD 93               [ 1] 1603 	ldw	x, y
      0098FE 6F 01            [ 1] 1604 	clr	(0x1, x)
      009900 7F               [ 1] 1605 	clr	(x)
                                   1606 ;	../src/pff.c: 943: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
      009901 1E 19            [ 2] 1607 	ldw	x, (0x19, sp)
      009903 26 05            [ 1] 1608 	jrne	00102$
      009905 A6 05            [ 1] 1609 	ld	a, #0x05
      009907 CC 9A D9         [ 2] 1610 	jp	00127$
      00990A                       1611 00102$:
                                   1612 ;	../src/pff.c: 944: if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
      00990A 1E 19            [ 2] 1613 	ldw	x, (0x19, sp)
      00990C 5C               [ 1] 1614 	incw	x
      00990D 1F 05            [ 2] 1615 	ldw	(0x05, sp), x
      00990F F6               [ 1] 1616 	ld	a, (x)
      009910 44               [ 1] 1617 	srl	a
      009911 25 05            [ 1] 1618 	jrc	00104$
      009913 A6 04            [ 1] 1619 	ld	a, #0x04
      009915 CC 9A D9         [ 2] 1620 	jp	00127$
      009918                       1621 00104$:
                                   1622 ;	../src/pff.c: 946: remain = fs->fsize - fs->fptr;
      009918 1E 19            [ 2] 1623 	ldw	x, (0x19, sp)
      00991A 90 93            [ 1] 1624 	ldw	y, x
      00991C 90 EE 1C         [ 2] 1625 	ldw	y, (0x1c, y)
      00991F EE 1A            [ 2] 1626 	ldw	x, (0x1a, x)
      009921 1F 11            [ 2] 1627 	ldw	(0x11, sp), x
      009923 1E 19            [ 2] 1628 	ldw	x, (0x19, sp)
      009925 1C 00 16         [ 2] 1629 	addw	x, #0x0016
      009928 1F 07            [ 2] 1630 	ldw	(0x07, sp), x
      00992A E6 03            [ 1] 1631 	ld	a, (0x3, x)
      00992C 6B 18            [ 1] 1632 	ld	(0x18, sp), a
      00992E E6 02            [ 1] 1633 	ld	a, (0x2, x)
      009930 6B 17            [ 1] 1634 	ld	(0x17, sp), a
      009932 FE               [ 2] 1635 	ldw	x, (x)
      009933 72 F2 17         [ 2] 1636 	subw	y, (0x17, sp)
      009936 7B 12            [ 1] 1637 	ld	a, (0x12, sp)
      009938 89               [ 2] 1638 	pushw	x
      009939 12 02            [ 1] 1639 	sbc	a, (2, sp)
      00993B 85               [ 2] 1640 	popw	x
      00993C 97               [ 1] 1641 	ld	xl, a
      00993D 7B 11            [ 1] 1642 	ld	a, (0x11, sp)
      00993F 89               [ 2] 1643 	pushw	x
      009940 12 01            [ 1] 1644 	sbc	a, (1, sp)
      009942 85               [ 2] 1645 	popw	x
      009943 17 13            [ 2] 1646 	ldw	(0x13, sp), y
      009945 95               [ 1] 1647 	ld	xh, a
                                   1648 ;	../src/pff.c: 947: if (btr > remain) btr = (UINT)remain;			/* Truncate btr by remaining bytes */
      009946 16 1F            [ 2] 1649 	ldw	y, (0x1f, sp)
      009948 17 17            [ 2] 1650 	ldw	(0x17, sp), y
      00994A 0F 16            [ 1] 1651 	clr	(0x16, sp)
      00994C 0F 15            [ 1] 1652 	clr	(0x15, sp)
      00994E 7B 14            [ 1] 1653 	ld	a, (0x14, sp)
      009950 11 18            [ 1] 1654 	cp	a, (0x18, sp)
      009952 7B 13            [ 1] 1655 	ld	a, (0x13, sp)
      009954 12 17            [ 1] 1656 	sbc	a, (0x17, sp)
      009956 9F               [ 1] 1657 	ld	a, xl
      009957 12 16            [ 1] 1658 	sbc	a, (0x16, sp)
      009959 9E               [ 1] 1659 	ld	a, xh
      00995A 12 15            [ 1] 1660 	sbc	a, (0x15, sp)
      00995C 24 04            [ 1] 1661 	jrnc	00140$
      00995E 1E 13            [ 2] 1662 	ldw	x, (0x13, sp)
      009960 1F 1F            [ 2] 1663 	ldw	(0x1f, sp), x
                                   1664 ;	../src/pff.c: 949: while (btr)	{									/* Repeat until all data transferred */
      009962                       1665 00140$:
      009962 1E 19            [ 2] 1666 	ldw	x, (0x19, sp)
      009964 1C 00 22         [ 2] 1667 	addw	x, #0x0022
      009967 1F 09            [ 2] 1668 	ldw	(0x09, sp), x
      009969 16 19            [ 2] 1669 	ldw	y, (0x19, sp)
      00996B 17 0B            [ 2] 1670 	ldw	(0x0b, sp), y
      00996D 16 19            [ 2] 1671 	ldw	y, (0x19, sp)
      00996F 17 0D            [ 2] 1672 	ldw	(0x0d, sp), y
      009971 1E 19            [ 2] 1673 	ldw	x, (0x19, sp)
      009973 1C 00 26         [ 2] 1674 	addw	x, #0x0026
      009976 1F 0F            [ 2] 1675 	ldw	(0x0f, sp), x
      009978                       1676 00124$:
      009978 1E 1F            [ 2] 1677 	ldw	x, (0x1f, sp)
      00997A 26 03            [ 1] 1678 	jrne	00197$
      00997C CC 9A D8         [ 2] 1679 	jp	00126$
      00997F                       1680 00197$:
                                   1681 ;	../src/pff.c: 950: if ((fs->fptr % 512) == 0) {				/* On the sector boundary? */
      00997F 1E 07            [ 2] 1682 	ldw	x, (0x07, sp)
      009981 90 93            [ 1] 1683 	ldw	y, x
      009983 90 EE 02         [ 2] 1684 	ldw	y, (0x2, y)
      009986 17 13            [ 2] 1685 	ldw	(0x13, sp), y
      009988 FE               [ 2] 1686 	ldw	x, (x)
      009989 1F 11            [ 2] 1687 	ldw	(0x11, sp), x
      00998B 7B 14            [ 1] 1688 	ld	a, (0x14, sp)
      00998D 6B 1A            [ 1] 1689 	ld	(0x1a, sp), a
      00998F 7B 13            [ 1] 1690 	ld	a, (0x13, sp)
      009991 A4 01            [ 1] 1691 	and	a, #0x01
      009993 6B 19            [ 1] 1692 	ld	(0x19, sp), a
      009995 5F               [ 1] 1693 	clrw	x
      009996 1F 17            [ 2] 1694 	ldw	(0x17, sp), x
      009998 1E 19            [ 2] 1695 	ldw	x, (0x19, sp)
      00999A 26 04            [ 1] 1696 	jrne	00198$
      00999C 1E 17            [ 2] 1697 	ldw	x, (0x17, sp)
      00999E 27 03            [ 1] 1698 	jreq	00199$
      0099A0                       1699 00198$:
      0099A0 CC 9A 4F         [ 2] 1700 	jp	00117$
      0099A3                       1701 00199$:
                                   1702 ;	../src/pff.c: 951: cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
      0099A3 16 12            [ 2] 1703 	ldw	y, (0x12, sp)
      0099A5 17 17            [ 2] 1704 	ldw	(0x17, sp), y
      0099A7 7B 11            [ 1] 1705 	ld	a, (0x11, sp)
      0099A9 6B 16            [ 1] 1706 	ld	(0x16, sp), a
      0099AB 0F 15            [ 1] 1707 	clr	(0x15, sp)
      0099AD 04 16            [ 1] 1708 	srl	(0x16, sp)
      0099AF 06 17            [ 1] 1709 	rrc	(0x17, sp)
      0099B1 06 18            [ 1] 1710 	rrc	(0x18, sp)
      0099B3 1E 0D            [ 2] 1711 	ldw	x, (0x0d, sp)
      0099B5 E6 02            [ 1] 1712 	ld	a, (0x2, x)
      0099B7 6B 1A            [ 1] 1713 	ld	(0x1a, sp), a
      0099B9 0A 1A            [ 1] 1714 	dec	(0x1a, sp)
      0099BB 7B 1A            [ 1] 1715 	ld	a, (0x1a, sp)
      0099BD 6B 19            [ 1] 1716 	ld	(0x19, sp), a
      0099BF 7B 18            [ 1] 1717 	ld	a, (0x18, sp)
      0099C1 6B 1A            [ 1] 1718 	ld	(0x1a, sp), a
      0099C3 14 19            [ 1] 1719 	and	a, (0x19, sp)
                                   1720 ;	../src/pff.c: 952: if (!cs) {								/* On the cluster boundary? */
      0099C5 6B 1A            [ 1] 1721 	ld	(0x1a, sp), a
      0099C7 26 48            [ 1] 1722 	jrne	00113$
                                   1723 ;	../src/pff.c: 953: if (fs->fptr == 0) {				/* On the top of the file? */
      0099C9 1E 13            [ 2] 1724 	ldw	x, (0x13, sp)
      0099CB 26 13            [ 1] 1725 	jrne	00108$
      0099CD 1E 11            [ 2] 1726 	ldw	x, (0x11, sp)
      0099CF 26 0F            [ 1] 1727 	jrne	00108$
                                   1728 ;	../src/pff.c: 954: clst = fs->org_clust;
      0099D1 1E 0B            [ 2] 1729 	ldw	x, (0x0b, sp)
      0099D3 90 93            [ 1] 1730 	ldw	y, x
      0099D5 90 EE 20         [ 2] 1731 	ldw	y, (0x20, y)
      0099D8 EE 1E            [ 2] 1732 	ldw	x, (0x1e, x)
      0099DA 17 18            [ 2] 1733 	ldw	(0x18, sp), y
      0099DC 1F 16            [ 2] 1734 	ldw	(0x16, sp), x
      0099DE 20 14            [ 2] 1735 	jra	00109$
      0099E0                       1736 00108$:
                                   1737 ;	../src/pff.c: 956: clst = get_fat(fs->curr_clust);
      0099E0 1E 09            [ 2] 1738 	ldw	x, (0x09, sp)
      0099E2 90 93            [ 1] 1739 	ldw	y, x
      0099E4 90 EE 02         [ 2] 1740 	ldw	y, (0x2, y)
      0099E7 FE               [ 2] 1741 	ldw	x, (x)
      0099E8 90 89            [ 2] 1742 	pushw	y
      0099EA 89               [ 2] 1743 	pushw	x
      0099EB CD 91 20         [ 4] 1744 	call	_get_fat
      0099EE 5B 04            [ 2] 1745 	addw	sp, #4
      0099F0 17 16            [ 2] 1746 	ldw	(0x16, sp), y
      0099F2 1F 18            [ 2] 1747 	ldw	(0x18, sp), x
      0099F4                       1748 00109$:
                                   1749 ;	../src/pff.c: 958: if (clst <= 1) ABORT(FR_DISK_ERR);
      0099F4 5F               [ 1] 1750 	clrw	x
      0099F5 5C               [ 1] 1751 	incw	x
      0099F6 13 18            [ 2] 1752 	cpw	x, (0x18, sp)
      0099F8 4F               [ 1] 1753 	clr	a
      0099F9 12 17            [ 1] 1754 	sbc	a, (0x17, sp)
      0099FB 4F               [ 1] 1755 	clr	a
      0099FC 12 16            [ 1] 1756 	sbc	a, (0x16, sp)
      0099FE 25 08            [ 1] 1757 	jrc	00111$
      009A00 1E 05            [ 2] 1758 	ldw	x, (0x05, sp)
      009A02 7F               [ 1] 1759 	clr	(x)
      009A03 A6 01            [ 1] 1760 	ld	a, #0x01
      009A05 CC 9A D9         [ 2] 1761 	jp	00127$
      009A08                       1762 00111$:
                                   1763 ;	../src/pff.c: 959: fs->curr_clust = clst;				/* Update current cluster */
      009A08 1E 09            [ 2] 1764 	ldw	x, (0x09, sp)
      009A0A 16 18            [ 2] 1765 	ldw	y, (0x18, sp)
      009A0C EF 02            [ 2] 1766 	ldw	(0x2, x), y
      009A0E 16 16            [ 2] 1767 	ldw	y, (0x16, sp)
      009A10 FF               [ 2] 1768 	ldw	(x), y
      009A11                       1769 00113$:
                                   1770 ;	../src/pff.c: 961: sect = clust2sect(fs->curr_clust);		/* Get current sector */
      009A11 1E 09            [ 2] 1771 	ldw	x, (0x09, sp)
      009A13 90 93            [ 1] 1772 	ldw	y, x
      009A15 90 EE 02         [ 2] 1773 	ldw	y, (0x2, y)
      009A18 FE               [ 2] 1774 	ldw	x, (x)
      009A19 90 89            [ 2] 1775 	pushw	y
      009A1B 89               [ 2] 1776 	pushw	x
      009A1C CD 91 C7         [ 4] 1777 	call	_clust2sect
      009A1F 5B 04            [ 2] 1778 	addw	sp, #4
      009A21 1F 18            [ 2] 1779 	ldw	(0x18, sp), x
      009A23 17 16            [ 2] 1780 	ldw	(0x16, sp), y
                                   1781 ;	../src/pff.c: 962: if (!sect) ABORT(FR_DISK_ERR);
      009A25 5D               [ 2] 1782 	tnzw	x
      009A26 26 0C            [ 1] 1783 	jrne	00115$
      009A28 90 5D            [ 2] 1784 	tnzw	y
      009A2A 26 08            [ 1] 1785 	jrne	00115$
      009A2C 1E 05            [ 2] 1786 	ldw	x, (0x05, sp)
      009A2E 7F               [ 1] 1787 	clr	(x)
      009A2F A6 01            [ 1] 1788 	ld	a, #0x01
      009A31 CC 9A D9         [ 2] 1789 	jp	00127$
      009A34                       1790 00115$:
                                   1791 ;	../src/pff.c: 963: fs->dsect = sect + cs;
      009A34 7B 1A            [ 1] 1792 	ld	a, (0x1a, sp)
      009A36 90 5F            [ 1] 1793 	clrw	y
      009A38 5F               [ 1] 1794 	clrw	x
      009A39 90 97            [ 1] 1795 	ld	yl, a
      009A3B 72 F9 18         [ 2] 1796 	addw	y, (0x18, sp)
      009A3E 9F               [ 1] 1797 	ld	a, xl
      009A3F 19 17            [ 1] 1798 	adc	a, (0x17, sp)
      009A41 6B 13            [ 1] 1799 	ld	(0x13, sp), a
      009A43 9E               [ 1] 1800 	ld	a, xh
      009A44 19 16            [ 1] 1801 	adc	a, (0x16, sp)
      009A46 6B 12            [ 1] 1802 	ld	(0x12, sp), a
      009A48 1E 0F            [ 2] 1803 	ldw	x, (0x0f, sp)
      009A4A EF 02            [ 2] 1804 	ldw	(0x2, x), y
      009A4C 16 12            [ 2] 1805 	ldw	y, (0x12, sp)
      009A4E FF               [ 2] 1806 	ldw	(x), y
      009A4F                       1807 00117$:
                                   1808 ;	../src/pff.c: 946: remain = fs->fsize - fs->fptr;
      009A4F 1E 07            [ 2] 1809 	ldw	x, (0x07, sp)
      009A51 EE 02            [ 2] 1810 	ldw	x, (0x2, x)
                                   1811 ;	../src/pff.c: 965: rcnt = 512 - (UINT)fs->fptr % 512;			/* Get partial sector data from sector buffer */
      009A53 9F               [ 1] 1812 	ld	a, xl
      009A54 6B 16            [ 1] 1813 	ld	(0x16, sp), a
      009A56 9E               [ 1] 1814 	ld	a, xh
      009A57 A4 01            [ 1] 1815 	and	a, #0x01
      009A59 6B 15            [ 1] 1816 	ld	(0x15, sp), a
      009A5B 5F               [ 1] 1817 	clrw	x
      009A5C A6 02            [ 1] 1818 	ld	a, #0x02
      009A5E 95               [ 1] 1819 	ld	xh, a
      009A5F 72 F0 15         [ 2] 1820 	subw	x, (0x15, sp)
                                   1821 ;	../src/pff.c: 966: if (rcnt > btr) rcnt = btr;
      009A62 1F 11            [ 2] 1822 	ldw	(0x11, sp), x
      009A64 13 1F            [ 2] 1823 	cpw	x, (0x1f, sp)
      009A66 23 04            [ 2] 1824 	jrule	00119$
      009A68 16 1F            [ 2] 1825 	ldw	y, (0x1f, sp)
      009A6A 17 11            [ 2] 1826 	ldw	(0x11, sp), y
      009A6C                       1827 00119$:
                                   1828 ;	../src/pff.c: 967: dr = disk_readp(rbuff, fs->dsect, (UINT)fs->fptr % 512, rcnt);
      009A6C 1E 0F            [ 2] 1829 	ldw	x, (0x0f, sp)
      009A6E 90 93            [ 1] 1830 	ldw	y, x
      009A70 90 EE 02         [ 2] 1831 	ldw	y, (0x2, y)
      009A73 FE               [ 2] 1832 	ldw	x, (x)
      009A74 1F 17            [ 2] 1833 	ldw	(0x17, sp), x
      009A76 1E 11            [ 2] 1834 	ldw	x, (0x11, sp)
      009A78 89               [ 2] 1835 	pushw	x
      009A79 1E 17            [ 2] 1836 	ldw	x, (0x17, sp)
      009A7B 89               [ 2] 1837 	pushw	x
      009A7C 90 89            [ 2] 1838 	pushw	y
      009A7E 1E 1D            [ 2] 1839 	ldw	x, (0x1d, sp)
      009A80 89               [ 2] 1840 	pushw	x
      009A81 1E 09            [ 2] 1841 	ldw	x, (0x09, sp)
      009A83 89               [ 2] 1842 	pushw	x
      009A84 CD 82 8F         [ 4] 1843 	call	_disk_readp
      009A87 5B 0A            [ 2] 1844 	addw	sp, #10
                                   1845 ;	../src/pff.c: 968: if (dr) ABORT(FR_DISK_ERR);
      009A89 4D               [ 1] 1846 	tnz	a
      009A8A 27 07            [ 1] 1847 	jreq	00121$
      009A8C 1E 05            [ 2] 1848 	ldw	x, (0x05, sp)
      009A8E 7F               [ 1] 1849 	clr	(x)
      009A8F A6 01            [ 1] 1850 	ld	a, #0x01
      009A91 20 46            [ 2] 1851 	jra	00127$
      009A93                       1852 00121$:
                                   1853 ;	../src/pff.c: 969: fs->fptr += rcnt;							/* Advances file read pointer */
      009A93 1E 07            [ 2] 1854 	ldw	x, (0x07, sp)
      009A95 90 93            [ 1] 1855 	ldw	y, x
      009A97 90 EE 02         [ 2] 1856 	ldw	y, (0x2, y)
      009A9A 17 15            [ 2] 1857 	ldw	(0x15, sp), y
      009A9C FE               [ 2] 1858 	ldw	x, (x)
      009A9D 1F 13            [ 2] 1859 	ldw	(0x13, sp), x
      009A9F 16 11            [ 2] 1860 	ldw	y, (0x11, sp)
      009AA1 4F               [ 1] 1861 	clr	a
      009AA2 5F               [ 1] 1862 	clrw	x
      009AA3 72 F9 15         [ 2] 1863 	addw	y, (0x15, sp)
      009AA6 19 14            [ 1] 1864 	adc	a, (0x14, sp)
      009AA8 6B 18            [ 1] 1865 	ld	(0x18, sp), a
      009AAA 9F               [ 1] 1866 	ld	a, xl
      009AAB 19 13            [ 1] 1867 	adc	a, (0x13, sp)
      009AAD 6B 17            [ 1] 1868 	ld	(0x17, sp), a
      009AAF 1E 07            [ 2] 1869 	ldw	x, (0x07, sp)
      009AB1 EF 02            [ 2] 1870 	ldw	(0x2, x), y
      009AB3 16 17            [ 2] 1871 	ldw	y, (0x17, sp)
      009AB5 FF               [ 2] 1872 	ldw	(x), y
                                   1873 ;	../src/pff.c: 970: btr -= rcnt; *br += rcnt;					/* Update read counter */
      009AB6 1E 1F            [ 2] 1874 	ldw	x, (0x1f, sp)
      009AB8 72 F0 11         [ 2] 1875 	subw	x, (0x11, sp)
      009ABB 1F 1F            [ 2] 1876 	ldw	(0x1f, sp), x
      009ABD 1E 03            [ 2] 1877 	ldw	x, (0x03, sp)
      009ABF FE               [ 2] 1878 	ldw	x, (x)
      009AC0 72 FB 11         [ 2] 1879 	addw	x, (0x11, sp)
      009AC3 16 03            [ 2] 1880 	ldw	y, (0x03, sp)
      009AC5 90 FF            [ 2] 1881 	ldw	(y), x
                                   1882 ;	../src/pff.c: 971: if (rbuff) rbuff += rcnt;					/* Advances the data pointer if destination is memory */
      009AC7 1E 01            [ 2] 1883 	ldw	x, (0x01, sp)
      009AC9 26 03            [ 1] 1884 	jrne	00208$
      009ACB CC 99 78         [ 2] 1885 	jp	00124$
      009ACE                       1886 00208$:
      009ACE 1E 01            [ 2] 1887 	ldw	x, (0x01, sp)
      009AD0 72 FB 11         [ 2] 1888 	addw	x, (0x11, sp)
      009AD3 1F 01            [ 2] 1889 	ldw	(0x01, sp), x
      009AD5 CC 99 78         [ 2] 1890 	jp	00124$
      009AD8                       1891 00126$:
                                   1892 ;	../src/pff.c: 974: return FR_OK;
      009AD8 4F               [ 1] 1893 	clr	a
      009AD9                       1894 00127$:
                                   1895 ;	../src/pff.c: 975: }
      009AD9 5B 1A            [ 2] 1896 	addw	sp, #26
      009ADB 81               [ 4] 1897 	ret
                                   1898 ;	../src/pff.c: 985: FRESULT pf_write (
                                   1899 ;	-----------------------------------------
                                   1900 ;	 function pf_write
                                   1901 ;	-----------------------------------------
      009ADC                       1902 _pf_write:
      009ADC 52 1C            [ 2] 1903 	sub	sp, #28
                                   1904 ;	../src/pff.c: 993: const BYTE *p = buff;
      009ADE 1E 1F            [ 2] 1905 	ldw	x, (0x1f, sp)
      009AE0 1F 05            [ 2] 1906 	ldw	(0x05, sp), x
                                   1907 ;	../src/pff.c: 996: FATFS *fs = FatFs;
      009AE2 CE 02 67         [ 2] 1908 	ldw	x, _FatFs+0
      009AE5 1F 07            [ 2] 1909 	ldw	(0x07, sp), x
                                   1910 ;	../src/pff.c: 999: *bw = 0;
      009AE7 16 23            [ 2] 1911 	ldw	y, (0x23, sp)
      009AE9 17 09            [ 2] 1912 	ldw	(0x09, sp), y
      009AEB 93               [ 1] 1913 	ldw	x, y
      009AEC 6F 01            [ 1] 1914 	clr	(0x1, x)
      009AEE 7F               [ 1] 1915 	clr	(x)
                                   1916 ;	../src/pff.c: 1000: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
      009AEF 1E 07            [ 2] 1917 	ldw	x, (0x07, sp)
      009AF1 26 05            [ 1] 1918 	jrne	00102$
      009AF3 A6 05            [ 1] 1919 	ld	a, #0x05
      009AF5 CC 9D 48         [ 2] 1920 	jp	00139$
      009AF8                       1921 00102$:
                                   1922 ;	../src/pff.c: 1001: if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
      009AF8 1E 07            [ 2] 1923 	ldw	x, (0x07, sp)
      009AFA 5C               [ 1] 1924 	incw	x
      009AFB 1F 0B            [ 2] 1925 	ldw	(0x0b, sp), x
      009AFD F6               [ 1] 1926 	ld	a, (x)
      009AFE A5 01            [ 1] 1927 	bcp	a, #0x01
      009B00 26 05            [ 1] 1928 	jrne	00104$
      009B02 A6 04            [ 1] 1929 	ld	a, #0x04
      009B04 CC 9D 48         [ 2] 1930 	jp	00139$
      009B07                       1931 00104$:
                                   1932 ;	../src/pff.c: 1004: if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
      009B07 A4 40            [ 1] 1933 	and	a, #0x40
      009B09 6B 1C            [ 1] 1934 	ld	(0x1c, sp), a
      009B0B 0F 1B            [ 1] 1935 	clr	(0x1b, sp)
                                   1936 ;	../src/pff.c: 1003: if (!btw) {		/* Finalize request */
      009B0D 1E 21            [ 2] 1937 	ldw	x, (0x21, sp)
      009B0F 26 26            [ 1] 1938 	jrne	00111$
                                   1939 ;	../src/pff.c: 1004: if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
      009B11 1E 1B            [ 2] 1940 	ldw	x, (0x1b, sp)
      009B13 27 16            [ 1] 1941 	jreq	00106$
      009B15 5F               [ 1] 1942 	clrw	x
      009B16 89               [ 2] 1943 	pushw	x
      009B17 5F               [ 1] 1944 	clrw	x
      009B18 89               [ 2] 1945 	pushw	x
      009B19 5F               [ 1] 1946 	clrw	x
      009B1A 89               [ 2] 1947 	pushw	x
      009B1B CD 83 64         [ 4] 1948 	call	_disk_writep
      009B1E 5B 06            [ 2] 1949 	addw	sp, #6
      009B20 4D               [ 1] 1950 	tnz	a
      009B21 27 08            [ 1] 1951 	jreq	00106$
      009B23 1E 0B            [ 2] 1952 	ldw	x, (0x0b, sp)
      009B25 7F               [ 1] 1953 	clr	(x)
      009B26 A6 01            [ 1] 1954 	ld	a, #0x01
      009B28 CC 9D 48         [ 2] 1955 	jp	00139$
      009B2B                       1956 00106$:
                                   1957 ;	../src/pff.c: 1005: fs->flag &= ~FA__WIP;
      009B2B 1E 0B            [ 2] 1958 	ldw	x, (0x0b, sp)
      009B2D F6               [ 1] 1959 	ld	a, (x)
      009B2E A4 BF            [ 1] 1960 	and	a, #0xbf
      009B30 1E 0B            [ 2] 1961 	ldw	x, (0x0b, sp)
      009B32 F7               [ 1] 1962 	ld	(x), a
                                   1963 ;	../src/pff.c: 1006: return FR_OK;
      009B33 4F               [ 1] 1964 	clr	a
      009B34 CC 9D 48         [ 2] 1965 	jp	00139$
      009B37                       1966 00111$:
                                   1967 ;	../src/pff.c: 1009: fs->fptr &= 0xFFFFFE00;
      009B37 1E 07            [ 2] 1968 	ldw	x, (0x07, sp)
      009B39 1C 00 16         [ 2] 1969 	addw	x, #0x0016
      009B3C 1F 13            [ 2] 1970 	ldw	(0x13, sp), x
                                   1971 ;	../src/pff.c: 1008: if (!(fs->flag & FA__WIP)) {	/* Round-down fptr to the sector boundary */
      009B3E 1E 1B            [ 2] 1972 	ldw	x, (0x1b, sp)
      009B40 26 1A            [ 1] 1973 	jrne	00112$
                                   1974 ;	../src/pff.c: 1009: fs->fptr &= 0xFFFFFE00;
      009B42 1E 13            [ 2] 1975 	ldw	x, (0x13, sp)
      009B44 E6 02            [ 1] 1976 	ld	a, (0x2, x)
      009B46 FE               [ 2] 1977 	ldw	x, (x)
      009B47 A4 FE            [ 1] 1978 	and	a, #0xfe
      009B49 90 95            [ 1] 1979 	ld	yh, a
      009B4B 4F               [ 1] 1980 	clr	a
      009B4C 90 97            [ 1] 1981 	ld	yl, a
      009B4E 02               [ 1] 1982 	rlwa	x
      009B4F 6B 19            [ 1] 1983 	ld	(0x19, sp), a
      009B51 01               [ 1] 1984 	rrwa	x
      009B52 9F               [ 1] 1985 	ld	a, xl
      009B53 1E 13            [ 2] 1986 	ldw	x, (0x13, sp)
      009B55 EF 02            [ 2] 1987 	ldw	(0x2, x), y
      009B57 E7 01            [ 1] 1988 	ld	(0x1, x), a
      009B59 7B 19            [ 1] 1989 	ld	a, (0x19, sp)
      009B5B F7               [ 1] 1990 	ld	(x), a
      009B5C                       1991 00112$:
                                   1992 ;	../src/pff.c: 1012: remain = fs->fsize - fs->fptr;
      009B5C 1E 07            [ 2] 1993 	ldw	x, (0x07, sp)
      009B5E 90 93            [ 1] 1994 	ldw	y, x
      009B60 90 EE 1C         [ 2] 1995 	ldw	y, (0x1c, y)
      009B63 EE 1A            [ 2] 1996 	ldw	x, (0x1a, x)
      009B65 1F 15            [ 2] 1997 	ldw	(0x15, sp), x
      009B67 1E 13            [ 2] 1998 	ldw	x, (0x13, sp)
      009B69 1F 0D            [ 2] 1999 	ldw	(0x0d, sp), x
      009B6B 1E 13            [ 2] 2000 	ldw	x, (0x13, sp)
      009B6D E6 03            [ 1] 2001 	ld	a, (0x3, x)
      009B6F 6B 1C            [ 1] 2002 	ld	(0x1c, sp), a
      009B71 E6 02            [ 1] 2003 	ld	a, (0x2, x)
      009B73 6B 1B            [ 1] 2004 	ld	(0x1b, sp), a
      009B75 FE               [ 2] 2005 	ldw	x, (x)
      009B76 1F 19            [ 2] 2006 	ldw	(0x19, sp), x
      009B78 72 F2 1B         [ 2] 2007 	subw	y, (0x1b, sp)
      009B7B 7B 16            [ 1] 2008 	ld	a, (0x16, sp)
      009B7D 12 1A            [ 1] 2009 	sbc	a, (0x1a, sp)
      009B7F 97               [ 1] 2010 	ld	xl, a
      009B80 7B 15            [ 1] 2011 	ld	a, (0x15, sp)
      009B82 12 19            [ 1] 2012 	sbc	a, (0x19, sp)
      009B84 17 17            [ 2] 2013 	ldw	(0x17, sp), y
      009B86 95               [ 1] 2014 	ld	xh, a
                                   2015 ;	../src/pff.c: 1013: if (btw > remain) btw = (UINT)remain;			/* Truncate btw by remaining bytes */
      009B87 16 21            [ 2] 2016 	ldw	y, (0x21, sp)
      009B89 17 1B            [ 2] 2017 	ldw	(0x1b, sp), y
      009B8B 0F 1A            [ 1] 2018 	clr	(0x1a, sp)
      009B8D 0F 19            [ 1] 2019 	clr	(0x19, sp)
      009B8F 7B 18            [ 1] 2020 	ld	a, (0x18, sp)
      009B91 11 1C            [ 1] 2021 	cp	a, (0x1c, sp)
      009B93 7B 17            [ 1] 2022 	ld	a, (0x17, sp)
      009B95 12 1B            [ 1] 2023 	sbc	a, (0x1b, sp)
      009B97 9F               [ 1] 2024 	ld	a, xl
      009B98 12 1A            [ 1] 2025 	sbc	a, (0x1a, sp)
      009B9A 9E               [ 1] 2026 	ld	a, xh
      009B9B 12 19            [ 1] 2027 	sbc	a, (0x19, sp)
      009B9D 24 04            [ 1] 2028 	jrnc	00157$
      009B9F 1E 17            [ 2] 2029 	ldw	x, (0x17, sp)
      009BA1 1F 21            [ 2] 2030 	ldw	(0x21, sp), x
                                   2031 ;	../src/pff.c: 1015: while (btw)	{									/* Repeat until all data transferred */
      009BA3                       2032 00157$:
      009BA3 1E 07            [ 2] 2033 	ldw	x, (0x07, sp)
      009BA5 1C 00 22         [ 2] 2034 	addw	x, #0x0022
      009BA8 1F 0F            [ 2] 2035 	ldw	(0x0f, sp), x
      009BAA 16 07            [ 2] 2036 	ldw	y, (0x07, sp)
      009BAC 17 11            [ 2] 2037 	ldw	(0x11, sp), y
      009BAE 16 07            [ 2] 2038 	ldw	y, (0x07, sp)
      009BB0 17 13            [ 2] 2039 	ldw	(0x13, sp), y
      009BB2                       2040 00136$:
      009BB2 1E 21            [ 2] 2041 	ldw	x, (0x21, sp)
      009BB4 26 03            [ 1] 2042 	jrne	00243$
      009BB6 CC 9D 47         [ 2] 2043 	jp	00138$
      009BB9                       2044 00243$:
                                   2045 ;	../src/pff.c: 1016: if ((UINT)fs->fptr % 512 == 0) {			/* On the sector boundary? */
      009BB9 1E 0D            [ 2] 2046 	ldw	x, (0x0d, sp)
      009BBB 90 93            [ 1] 2047 	ldw	y, x
      009BBD 90 EE 02         [ 2] 2048 	ldw	y, (0x2, y)
      009BC0 17 1A            [ 2] 2049 	ldw	(0x1a, sp), y
      009BC2 FE               [ 2] 2050 	ldw	x, (x)
      009BC3 1F 18            [ 2] 2051 	ldw	(0x18, sp), x
      009BC5 1E 1A            [ 2] 2052 	ldw	x, (0x1a, sp)
      009BC7 9E               [ 1] 2053 	ld	a, xh
      009BC8 A4 01            [ 1] 2054 	and	a, #0x01
      009BCA 95               [ 1] 2055 	ld	xh, a
      009BCB 5D               [ 2] 2056 	tnzw	x
      009BCC 27 03            [ 1] 2057 	jreq	00244$
      009BCE CC 9C 98         [ 2] 2058 	jp	00127$
      009BD1                       2059 00244$:
                                   2060 ;	../src/pff.c: 1017: cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
      009BD1 7B 18            [ 1] 2061 	ld	a, (0x18, sp)
      009BD3 6B 02            [ 1] 2062 	ld	(0x02, sp), a
      009BD5 1E 19            [ 2] 2063 	ldw	x, (0x19, sp)
      009BD7 0F 01            [ 1] 2064 	clr	(0x01, sp)
      009BD9 04 02            [ 1] 2065 	srl	(0x02, sp)
      009BDB 56               [ 2] 2066 	rrcw	x
      009BDC 16 13            [ 2] 2067 	ldw	y, (0x13, sp)
      009BDE 90 E6 02         [ 1] 2068 	ld	a, (0x2, y)
      009BE1 4A               [ 1] 2069 	dec	a
      009BE2 89               [ 2] 2070 	pushw	x
      009BE3 14 02            [ 1] 2071 	and	a, (2, sp)
      009BE5 85               [ 2] 2072 	popw	x
                                   2073 ;	../src/pff.c: 1018: if (!cs) {								/* On the cluster boundary? */
      009BE6 6B 1C            [ 1] 2074 	ld	(0x1c, sp), a
      009BE8 26 48            [ 1] 2075 	jrne	00121$
                                   2076 ;	../src/pff.c: 1019: if (fs->fptr == 0) {				/* On the top of the file? */
      009BEA 1E 1A            [ 2] 2077 	ldw	x, (0x1a, sp)
      009BEC 26 13            [ 1] 2078 	jrne	00116$
      009BEE 1E 18            [ 2] 2079 	ldw	x, (0x18, sp)
      009BF0 26 0F            [ 1] 2080 	jrne	00116$
                                   2081 ;	../src/pff.c: 1020: clst = fs->org_clust;
      009BF2 1E 11            [ 2] 2082 	ldw	x, (0x11, sp)
      009BF4 90 93            [ 1] 2083 	ldw	y, x
      009BF6 90 EE 20         [ 2] 2084 	ldw	y, (0x20, y)
      009BF9 EE 1E            [ 2] 2085 	ldw	x, (0x1e, x)
      009BFB 17 1A            [ 2] 2086 	ldw	(0x1a, sp), y
      009BFD 1F 18            [ 2] 2087 	ldw	(0x18, sp), x
      009BFF 20 14            [ 2] 2088 	jra	00117$
      009C01                       2089 00116$:
                                   2090 ;	../src/pff.c: 1022: clst = get_fat(fs->curr_clust);
      009C01 1E 0F            [ 2] 2091 	ldw	x, (0x0f, sp)
      009C03 90 93            [ 1] 2092 	ldw	y, x
      009C05 90 EE 02         [ 2] 2093 	ldw	y, (0x2, y)
      009C08 FE               [ 2] 2094 	ldw	x, (x)
      009C09 90 89            [ 2] 2095 	pushw	y
      009C0B 89               [ 2] 2096 	pushw	x
      009C0C CD 91 20         [ 4] 2097 	call	_get_fat
      009C0F 5B 04            [ 2] 2098 	addw	sp, #4
      009C11 17 18            [ 2] 2099 	ldw	(0x18, sp), y
      009C13 1F 1A            [ 2] 2100 	ldw	(0x1a, sp), x
      009C15                       2101 00117$:
                                   2102 ;	../src/pff.c: 1024: if (clst <= 1) ABORT(FR_DISK_ERR);
      009C15 5F               [ 1] 2103 	clrw	x
      009C16 5C               [ 1] 2104 	incw	x
      009C17 13 1A            [ 2] 2105 	cpw	x, (0x1a, sp)
      009C19 4F               [ 1] 2106 	clr	a
      009C1A 12 19            [ 1] 2107 	sbc	a, (0x19, sp)
      009C1C 4F               [ 1] 2108 	clr	a
      009C1D 12 18            [ 1] 2109 	sbc	a, (0x18, sp)
      009C1F 25 08            [ 1] 2110 	jrc	00119$
      009C21 1E 0B            [ 2] 2111 	ldw	x, (0x0b, sp)
      009C23 7F               [ 1] 2112 	clr	(x)
      009C24 A6 01            [ 1] 2113 	ld	a, #0x01
      009C26 CC 9D 48         [ 2] 2114 	jp	00139$
      009C29                       2115 00119$:
                                   2116 ;	../src/pff.c: 1025: fs->curr_clust = clst;				/* Update current cluster */
      009C29 1E 0F            [ 2] 2117 	ldw	x, (0x0f, sp)
      009C2B 16 1A            [ 2] 2118 	ldw	y, (0x1a, sp)
      009C2D EF 02            [ 2] 2119 	ldw	(0x2, x), y
      009C2F 16 18            [ 2] 2120 	ldw	y, (0x18, sp)
      009C31 FF               [ 2] 2121 	ldw	(x), y
      009C32                       2122 00121$:
                                   2123 ;	../src/pff.c: 1027: sect = clust2sect(fs->curr_clust);		/* Get current sector */
      009C32 1E 0F            [ 2] 2124 	ldw	x, (0x0f, sp)
      009C34 90 93            [ 1] 2125 	ldw	y, x
      009C36 90 EE 02         [ 2] 2126 	ldw	y, (0x2, y)
      009C39 FE               [ 2] 2127 	ldw	x, (x)
      009C3A 90 89            [ 2] 2128 	pushw	y
      009C3C 89               [ 2] 2129 	pushw	x
      009C3D CD 91 C7         [ 4] 2130 	call	_clust2sect
      009C40 5B 04            [ 2] 2131 	addw	sp, #4
      009C42 1F 03            [ 2] 2132 	ldw	(0x03, sp), x
      009C44 17 01            [ 2] 2133 	ldw	(0x01, sp), y
                                   2134 ;	../src/pff.c: 1028: if (!sect) ABORT(FR_DISK_ERR);
      009C46 5D               [ 2] 2135 	tnzw	x
      009C47 26 0C            [ 1] 2136 	jrne	00123$
      009C49 90 5D            [ 2] 2137 	tnzw	y
      009C4B 26 08            [ 1] 2138 	jrne	00123$
      009C4D 1E 0B            [ 2] 2139 	ldw	x, (0x0b, sp)
      009C4F 7F               [ 1] 2140 	clr	(x)
      009C50 A6 01            [ 1] 2141 	ld	a, #0x01
      009C52 CC 9D 48         [ 2] 2142 	jp	00139$
      009C55                       2143 00123$:
                                   2144 ;	../src/pff.c: 1029: fs->dsect = sect + cs;
      009C55 1E 07            [ 2] 2145 	ldw	x, (0x07, sp)
      009C57 1C 00 26         [ 2] 2146 	addw	x, #0x0026
      009C5A 90 5F            [ 1] 2147 	clrw	y
      009C5C 7B 1C            [ 1] 2148 	ld	a, (0x1c, sp)
      009C5E 90 97            [ 1] 2149 	ld	yl, a
      009C60 4F               [ 1] 2150 	clr	a
      009C61 0F 15            [ 1] 2151 	clr	(0x15, sp)
      009C63 72 F9 03         [ 2] 2152 	addw	y, (0x03, sp)
      009C66 19 02            [ 1] 2153 	adc	a, (0x02, sp)
      009C68 6B 1A            [ 1] 2154 	ld	(0x1a, sp), a
      009C6A 7B 15            [ 1] 2155 	ld	a, (0x15, sp)
      009C6C 19 01            [ 1] 2156 	adc	a, (0x01, sp)
      009C6E 6B 19            [ 1] 2157 	ld	(0x19, sp), a
      009C70 EF 02            [ 2] 2158 	ldw	(0x2, x), y
      009C72 7B 1A            [ 1] 2159 	ld	a, (0x1a, sp)
      009C74 E7 01            [ 1] 2160 	ld	(0x1, x), a
      009C76 7B 19            [ 1] 2161 	ld	a, (0x19, sp)
      009C78 F7               [ 1] 2162 	ld	(x), a
                                   2163 ;	../src/pff.c: 1030: if (disk_writep(0, fs->dsect)) ABORT(FR_DISK_ERR);	/* Initiate a sector write operation */
      009C79 90 89            [ 2] 2164 	pushw	y
      009C7B 1E 1B            [ 2] 2165 	ldw	x, (0x1b, sp)
      009C7D 89               [ 2] 2166 	pushw	x
      009C7E 5F               [ 1] 2167 	clrw	x
      009C7F 89               [ 2] 2168 	pushw	x
      009C80 CD 83 64         [ 4] 2169 	call	_disk_writep
      009C83 5B 06            [ 2] 2170 	addw	sp, #6
      009C85 4D               [ 1] 2171 	tnz	a
      009C86 27 08            [ 1] 2172 	jreq	00125$
      009C88 1E 0B            [ 2] 2173 	ldw	x, (0x0b, sp)
      009C8A 7F               [ 1] 2174 	clr	(x)
      009C8B A6 01            [ 1] 2175 	ld	a, #0x01
      009C8D CC 9D 48         [ 2] 2176 	jp	00139$
      009C90                       2177 00125$:
                                   2178 ;	../src/pff.c: 1031: fs->flag |= FA__WIP;
      009C90 1E 0B            [ 2] 2179 	ldw	x, (0x0b, sp)
      009C92 F6               [ 1] 2180 	ld	a, (x)
      009C93 AA 40            [ 1] 2181 	or	a, #0x40
      009C95 1E 0B            [ 2] 2182 	ldw	x, (0x0b, sp)
      009C97 F7               [ 1] 2183 	ld	(x), a
      009C98                       2184 00127$:
                                   2185 ;	../src/pff.c: 1033: wcnt = 512 - (UINT)fs->fptr % 512;			/* Number of bytes to write to the sector */
      009C98 1E 0D            [ 2] 2186 	ldw	x, (0x0d, sp)
      009C9A EE 02            [ 2] 2187 	ldw	x, (0x2, x)
      009C9C 9E               [ 1] 2188 	ld	a, xh
      009C9D A4 01            [ 1] 2189 	and	a, #0x01
      009C9F 6B 1B            [ 1] 2190 	ld	(0x1b, sp), a
      009CA1 9F               [ 1] 2191 	ld	a, xl
      009CA2 40               [ 1] 2192 	neg	a
      009CA3 97               [ 1] 2193 	ld	xl, a
      009CA4 A6 02            [ 1] 2194 	ld	a, #0x02
      009CA6 12 1B            [ 1] 2195 	sbc	a, (0x1b, sp)
      009CA8 95               [ 1] 2196 	ld	xh, a
                                   2197 ;	../src/pff.c: 1034: if (wcnt > btw) wcnt = btw;
      009CA9 1F 15            [ 2] 2198 	ldw	(0x15, sp), x
      009CAB 13 21            [ 2] 2199 	cpw	x, (0x21, sp)
      009CAD 23 04            [ 2] 2200 	jrule	00129$
      009CAF 16 21            [ 2] 2201 	ldw	y, (0x21, sp)
      009CB1 17 15            [ 2] 2202 	ldw	(0x15, sp), y
      009CB3                       2203 00129$:
                                   2204 ;	../src/pff.c: 1035: if (disk_writep(p, wcnt)) ABORT(FR_DISK_ERR);	/* Send data to the sector */
      009CB3 16 15            [ 2] 2205 	ldw	y, (0x15, sp)
      009CB5 17 03            [ 2] 2206 	ldw	(0x03, sp), y
      009CB7 0F 02            [ 1] 2207 	clr	(0x02, sp)
      009CB9 0F 01            [ 1] 2208 	clr	(0x01, sp)
      009CBB 1E 03            [ 2] 2209 	ldw	x, (0x03, sp)
      009CBD 89               [ 2] 2210 	pushw	x
      009CBE 1E 03            [ 2] 2211 	ldw	x, (0x03, sp)
      009CC0 89               [ 2] 2212 	pushw	x
      009CC1 1E 09            [ 2] 2213 	ldw	x, (0x09, sp)
      009CC3 89               [ 2] 2214 	pushw	x
      009CC4 CD 83 64         [ 4] 2215 	call	_disk_writep
      009CC7 5B 06            [ 2] 2216 	addw	sp, #6
      009CC9 4D               [ 1] 2217 	tnz	a
      009CCA 27 07            [ 1] 2218 	jreq	00131$
      009CCC 1E 0B            [ 2] 2219 	ldw	x, (0x0b, sp)
      009CCE 7F               [ 1] 2220 	clr	(x)
      009CCF A6 01            [ 1] 2221 	ld	a, #0x01
      009CD1 20 75            [ 2] 2222 	jra	00139$
      009CD3                       2223 00131$:
                                   2224 ;	../src/pff.c: 1036: fs->fptr += wcnt; p += wcnt;				/* Update pointers and counters */
      009CD3 1E 0D            [ 2] 2225 	ldw	x, (0x0d, sp)
      009CD5 90 93            [ 1] 2226 	ldw	y, x
      009CD7 90 EE 02         [ 2] 2227 	ldw	y, (0x2, y)
      009CDA E6 01            [ 1] 2228 	ld	a, (0x1, x)
      009CDC 88               [ 1] 2229 	push	a
      009CDD F6               [ 1] 2230 	ld	a, (x)
      009CDE 97               [ 1] 2231 	ld	xl, a
      009CDF 84               [ 1] 2232 	pop	a
      009CE0 72 F9 03         [ 2] 2233 	addw	y, (0x03, sp)
      009CE3 17 19            [ 2] 2234 	ldw	(0x19, sp), y
      009CE5 19 02            [ 1] 2235 	adc	a, (0x02, sp)
      009CE7 6B 18            [ 1] 2236 	ld	(0x18, sp), a
      009CE9 9F               [ 1] 2237 	ld	a, xl
      009CEA 19 01            [ 1] 2238 	adc	a, (0x01, sp)
      009CEC 6B 17            [ 1] 2239 	ld	(0x17, sp), a
      009CEE 1E 0D            [ 2] 2240 	ldw	x, (0x0d, sp)
      009CF0 16 19            [ 2] 2241 	ldw	y, (0x19, sp)
      009CF2 EF 02            [ 2] 2242 	ldw	(0x2, x), y
      009CF4 16 17            [ 2] 2243 	ldw	y, (0x17, sp)
      009CF6 FF               [ 2] 2244 	ldw	(x), y
      009CF7 1E 05            [ 2] 2245 	ldw	x, (0x05, sp)
      009CF9 72 FB 15         [ 2] 2246 	addw	x, (0x15, sp)
      009CFC 1F 05            [ 2] 2247 	ldw	(0x05, sp), x
                                   2248 ;	../src/pff.c: 1037: btw -= wcnt; *bw += wcnt;
      009CFE 1E 21            [ 2] 2249 	ldw	x, (0x21, sp)
      009D00 72 F0 15         [ 2] 2250 	subw	x, (0x15, sp)
      009D03 1F 21            [ 2] 2251 	ldw	(0x21, sp), x
      009D05 1E 09            [ 2] 2252 	ldw	x, (0x09, sp)
      009D07 FE               [ 2] 2253 	ldw	x, (x)
      009D08 72 FB 15         [ 2] 2254 	addw	x, (0x15, sp)
      009D0B 1F 1B            [ 2] 2255 	ldw	(0x1b, sp), x
      009D0D 1E 09            [ 2] 2256 	ldw	x, (0x09, sp)
      009D0F 16 1B            [ 2] 2257 	ldw	y, (0x1b, sp)
      009D11 FF               [ 2] 2258 	ldw	(x), y
                                   2259 ;	../src/pff.c: 1038: if ((UINT)fs->fptr % 512 == 0) {
      009D12 16 19            [ 2] 2260 	ldw	y, (0x19, sp)
      009D14 17 1B            [ 2] 2261 	ldw	(0x1b, sp), y
      009D16 7B 1C            [ 1] 2262 	ld	a, (0x1c, sp)
      009D18 6B 1A            [ 1] 2263 	ld	(0x1a, sp), a
      009D1A 7B 1B            [ 1] 2264 	ld	a, (0x1b, sp)
      009D1C A4 01            [ 1] 2265 	and	a, #0x01
      009D1E 6B 19            [ 1] 2266 	ld	(0x19, sp), a
      009D20 1E 19            [ 2] 2267 	ldw	x, (0x19, sp)
      009D22 27 03            [ 1] 2268 	jreq	00254$
      009D24 CC 9B B2         [ 2] 2269 	jp	00136$
      009D27                       2270 00254$:
                                   2271 ;	../src/pff.c: 1039: if (disk_writep(0, 0)) ABORT(FR_DISK_ERR);	/* Finalize the currtent secter write operation */
      009D27 5F               [ 1] 2272 	clrw	x
      009D28 89               [ 2] 2273 	pushw	x
      009D29 5F               [ 1] 2274 	clrw	x
      009D2A 89               [ 2] 2275 	pushw	x
      009D2B 5F               [ 1] 2276 	clrw	x
      009D2C 89               [ 2] 2277 	pushw	x
      009D2D CD 83 64         [ 4] 2278 	call	_disk_writep
      009D30 5B 06            [ 2] 2279 	addw	sp, #6
      009D32 4D               [ 1] 2280 	tnz	a
      009D33 27 07            [ 1] 2281 	jreq	00133$
      009D35 1E 0B            [ 2] 2282 	ldw	x, (0x0b, sp)
      009D37 7F               [ 1] 2283 	clr	(x)
      009D38 A6 01            [ 1] 2284 	ld	a, #0x01
      009D3A 20 0C            [ 2] 2285 	jra	00139$
      009D3C                       2286 00133$:
                                   2287 ;	../src/pff.c: 1040: fs->flag &= ~FA__WIP;
      009D3C 1E 0B            [ 2] 2288 	ldw	x, (0x0b, sp)
      009D3E F6               [ 1] 2289 	ld	a, (x)
      009D3F A4 BF            [ 1] 2290 	and	a, #0xbf
      009D41 1E 0B            [ 2] 2291 	ldw	x, (0x0b, sp)
      009D43 F7               [ 1] 2292 	ld	(x), a
      009D44 CC 9B B2         [ 2] 2293 	jp	00136$
      009D47                       2294 00138$:
                                   2295 ;	../src/pff.c: 1044: return FR_OK;
      009D47 4F               [ 1] 2296 	clr	a
      009D48                       2297 00139$:
                                   2298 ;	../src/pff.c: 1045: }
      009D48 5B 1C            [ 2] 2299 	addw	sp, #28
      009D4A 81               [ 4] 2300 	ret
                                   2301 	.area CODE
                                   2302 	.area CONST
                                   2303 	.area INITIALIZER
                                   2304 	.area CABS (ABS)
