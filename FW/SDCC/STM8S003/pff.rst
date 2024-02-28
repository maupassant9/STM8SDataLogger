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
                           000000    22 Fpff$FatFs$0_0$0==.
      000261                         23 _FatFs:
      000261                         24 	.ds 2
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area INITIALIZED
                                     29 ;--------------------------------------------------------
                                     30 ; absolute external ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DABS (ABS)
                                     33 
                                     34 ; default segment ordering for linker
                                     35 	.area HOME
                                     36 	.area GSINIT
                                     37 	.area GSFINAL
                                     38 	.area CONST
                                     39 	.area INITIALIZER
                                     40 	.area CODE
                                     41 
                                     42 ;--------------------------------------------------------
                                     43 ; global & static initialisations
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area GSINIT
                                     49 ;--------------------------------------------------------
                                     50 ; Home
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area HOME
                                     54 ;--------------------------------------------------------
                                     55 ; code
                                     56 ;--------------------------------------------------------
                                     57 	.area CODE
                           000000    58 	Fpff$ld_word$0$0 ==.
                           000000    59 	C$pff.c$384$0_0$323 ==.
                                     60 ;	../src/pff.c: 384: static WORD ld_word (const BYTE* ptr)	/*	 Load a 2-byte little-endian word */
                                     61 ; genLabel
                                     62 ;	-----------------------------------------
                                     63 ;	 function ld_word
                                     64 ;	-----------------------------------------
                                     65 ;	Register assignment might be sub-optimal.
                                     66 ;	Stack space usage: 2 bytes.
      009130                         67 _ld_word:
      009130 89               [ 2]   68 	pushw	x
                           000001    69 	C$pff.c$388$1_0$323 ==.
                                     70 ;	../src/pff.c: 388: rv = ptr[1];
                                     71 ; genAssign
      009131 1E 05            [ 2]   72 	ldw	x, (0x05, sp)
                                     73 ; genPointerGet
      009133 E6 01            [ 1]   74 	ld	a, (0x1, x)
                                     75 ; genCast
                                     76 ; genAssign
      009135 5F               [ 1]   77 	clrw	x
                                     78 ; genAssign
                           000006    79 	C$pff.c$389$1_0$323 ==.
                                     80 ;	../src/pff.c: 389: rv = rv << 8 | ptr[0];
                                     81 ; genLeftShiftLiteral
      009136 6B 01            [ 1]   82 	ld	(0x01, sp), a
      009138 0F 02            [ 1]   83 	clr	(0x02, sp)
                                     84 ; genAssign
      00913A 1E 05            [ 2]   85 	ldw	x, (0x05, sp)
                                     86 ; genPointerGet
      00913C F6               [ 1]   87 	ld	a, (x)
                                     88 ; genCast
                                     89 ; genAssign
      00913D 5F               [ 1]   90 	clrw	x
                                     91 ; genOr
      00913E 1A 02            [ 1]   92 	or	a, (0x02, sp)
      009140 97               [ 1]   93 	ld	xl, a
      009141 9E               [ 1]   94 	ld	a, xh
      009142 1A 01            [ 1]   95 	or	a, (0x01, sp)
                                     96 ; genAssign
                           000014    97 	C$pff.c$390$1_0$323 ==.
                                     98 ;	../src/pff.c: 390: return rv;
                                     99 ; genReturn
      009144 95               [ 1]  100 	ld	xh, a
                                    101 ; genLabel
      009145                        102 00101$:
                           000015   103 	C$pff.c$391$1_0$323 ==.
                                    104 ;	../src/pff.c: 391: }
                                    105 ; genEndFunction
      009145 5B 02            [ 2]  106 	addw	sp, #2
                           000017   107 	C$pff.c$391$1_0$323 ==.
                           000017   108 	XFpff$ld_word$0$0 ==.
      009147 81               [ 4]  109 	ret
                           000018   110 	Fpff$ld_dword$0$0 ==.
                           000018   111 	C$pff.c$393$1_0$325 ==.
                                    112 ;	../src/pff.c: 393: static DWORD ld_dword (const BYTE* ptr)	/* Load a 4-byte little-endian word */
                                    113 ; genLabel
                                    114 ;	-----------------------------------------
                                    115 ;	 function ld_dword
                                    116 ;	-----------------------------------------
                                    117 ;	Register assignment might be sub-optimal.
                                    118 ;	Stack space usage: 8 bytes.
      009148                        119 _ld_dword:
      009148 52 08            [ 2]  120 	sub	sp, #8
                           00001A   121 	C$pff.c$397$1_0$325 ==.
                                    122 ;	../src/pff.c: 397: rv = ptr[3];
                                    123 ; genAssign
      00914A 1E 0B            [ 2]  124 	ldw	x, (0x0b, sp)
                                    125 ; genPointerGet
      00914C E6 03            [ 1]  126 	ld	a, (0x3, x)
                                    127 ; genCast
                                    128 ; genAssign
      00914E 5F               [ 1]  129 	clrw	x
      00914F 90 5F            [ 1]  130 	clrw	y
                                    131 ; genAssign
      009151 97               [ 1]  132 	ld	xl, a
                           000022   133 	C$pff.c$398$1_0$325 ==.
                                    134 ;	../src/pff.c: 398: rv = rv << 8 | ptr[2];
                                    135 ; genLeftShiftLiteral
      009152 1F 02            [ 2]  136 	ldw	(0x02, sp), x
      009154 0F 04            [ 1]  137 	clr	(0x04, sp)
                                    138 ; genAssign
      009156 1E 0B            [ 2]  139 	ldw	x, (0x0b, sp)
                                    140 ; genPointerGet
      009158 E6 02            [ 1]  141 	ld	a, (0x2, x)
                                    142 ; genCast
                                    143 ; genAssign
      00915A 0F 07            [ 1]  144 	clr	(0x07, sp)
      00915C 5F               [ 1]  145 	clrw	x
      00915D 0F 05            [ 1]  146 	clr	(0x05, sp)
                                    147 ; genOr
      00915F 1A 04            [ 1]  148 	or	a, (0x04, sp)
      009161 95               [ 1]  149 	ld	xh, a
      009162 7B 03            [ 1]  150 	ld	a, (0x03, sp)
      009164 1A 07            [ 1]  151 	or	a, (0x07, sp)
      009166 90 95            [ 1]  152 	ld	yh, a
      009168 89               [ 2]  153 	pushw	x
      009169 7B 04            [ 1]  154 	ld	a, (0x04, sp)
      00916B 1A 02            [ 1]  155 	or	a, (2, sp)
      00916D 85               [ 2]  156 	popw	x
      00916E 97               [ 1]  157 	ld	xl, a
      00916F 90 9F            [ 1]  158 	ld	a, yl
      009171 1A 05            [ 1]  159 	or	a, (0x05, sp)
                                    160 ; genAssign
      009173 01               [ 1]  161 	rrwa	x
                           000044   162 	C$pff.c$399$1_0$325 ==.
                                    163 ;	../src/pff.c: 399: rv = rv << 8 | ptr[1];
                                    164 ; genLeftShiftLiteral
      009174 6B 01            [ 1]  165 	ld	(0x01, sp), a
      009176 61               [ 1]  166 	exg	a, yl
      009177 9F               [ 1]  167 	ld	a, xl
      009178 61               [ 1]  168 	exg	a, yl
      009179 0F 04            [ 1]  169 	clr	(0x04, sp)
                                    170 ; genAssign
      00917B 1E 0B            [ 2]  171 	ldw	x, (0x0b, sp)
                                    172 ; genPointerGet
      00917D E6 01            [ 1]  173 	ld	a, (0x1, x)
                                    174 ; genCast
                                    175 ; genAssign
      00917F 5F               [ 1]  176 	clrw	x
      009180 0F 06            [ 1]  177 	clr	(0x06, sp)
      009182 0F 05            [ 1]  178 	clr	(0x05, sp)
                                    179 ; genOr
      009184 1A 04            [ 1]  180 	or	a, (0x04, sp)
      009186 97               [ 1]  181 	ld	xl, a
      009187 89               [ 2]  182 	pushw	x
      009188 90 9F            [ 1]  183 	ld	a, yl
      00918A 1A 01            [ 1]  184 	or	a, (1, sp)
      00918C 85               [ 2]  185 	popw	x
      00918D 95               [ 1]  186 	ld	xh, a
      00918E 90 9E            [ 1]  187 	ld	a, yh
      009190 1A 06            [ 1]  188 	or	a, (0x06, sp)
      009192 90 97            [ 1]  189 	ld	yl, a
      009194 7B 01            [ 1]  190 	ld	a, (0x01, sp)
      009196 1A 05            [ 1]  191 	or	a, (0x05, sp)
                                    192 ; genAssign
                           000068   193 	C$pff.c$400$1_0$325 ==.
                                    194 ;	../src/pff.c: 400: rv = rv << 8 | ptr[0];
                                    195 ; genLeftShiftLiteral
      009198 1F 02            [ 2]  196 	ldw	(0x02, sp), x
      00919A 0F 04            [ 1]  197 	clr	(0x04, sp)
                                    198 ; genAssign
      00919C 1E 0B            [ 2]  199 	ldw	x, (0x0b, sp)
                                    200 ; genPointerGet
      00919E F6               [ 1]  201 	ld	a, (x)
                                    202 ; genCast
                                    203 ; genAssign
      00919F 0F 07            [ 1]  204 	clr	(0x07, sp)
      0091A1 5F               [ 1]  205 	clrw	x
      0091A2 0F 05            [ 1]  206 	clr	(0x05, sp)
                                    207 ; genOr
      0091A4 1A 04            [ 1]  208 	or	a, (0x04, sp)
      0091A6 95               [ 1]  209 	ld	xh, a
      0091A7 7B 03            [ 1]  210 	ld	a, (0x03, sp)
      0091A9 1A 07            [ 1]  211 	or	a, (0x07, sp)
      0091AB 90 95            [ 1]  212 	ld	yh, a
      0091AD 89               [ 2]  213 	pushw	x
      0091AE 7B 04            [ 1]  214 	ld	a, (0x04, sp)
      0091B0 1A 02            [ 1]  215 	or	a, (2, sp)
      0091B2 85               [ 2]  216 	popw	x
      0091B3 97               [ 1]  217 	ld	xl, a
      0091B4 90 9F            [ 1]  218 	ld	a, yl
      0091B6 1A 05            [ 1]  219 	or	a, (0x05, sp)
                                    220 ; genAssign
      0091B8 61               [ 1]  221 	exg	a, yl
      0091B9 9E               [ 1]  222 	ld	a, xh
      0091BA 61               [ 1]  223 	exg	a, yl
      0091BB 95               [ 1]  224 	ld	xh, a
                           00008C   225 	C$pff.c$401$1_0$325 ==.
                                    226 ;	../src/pff.c: 401: return rv;
                                    227 ; genReturn
      0091BC 51               [ 1]  228 	exgw	x, y
                                    229 ; genLabel
      0091BD                        230 00101$:
                           00008D   231 	C$pff.c$402$1_0$325 ==.
                                    232 ;	../src/pff.c: 402: }
                                    233 ; genEndFunction
      0091BD 5B 08            [ 2]  234 	addw	sp, #8
                           00008F   235 	C$pff.c$402$1_0$325 ==.
                           00008F   236 	XFpff$ld_dword$0$0 ==.
      0091BF 81               [ 4]  237 	ret
                           000090   238 	Fpff$mem_set$0$0 ==.
                           000090   239 	C$pff.c$411$1_0$327 ==.
                                    240 ;	../src/pff.c: 411: static void mem_set (void* dst, int val, int cnt) {
                                    241 ; genLabel
                                    242 ;	-----------------------------------------
                                    243 ;	 function mem_set
                                    244 ;	-----------------------------------------
                                    245 ;	Register assignment might be sub-optimal.
                                    246 ;	Stack space usage: 2 bytes.
      0091C0                        247 _mem_set:
      0091C0 89               [ 2]  248 	pushw	x
                           000091   249 	C$pff.c$412$1_0$327 ==.
                                    250 ;	../src/pff.c: 412: char *d = (char*)dst;
                                    251 ; genCast
                                    252 ; genAssign
      0091C1 1E 05            [ 2]  253 	ldw	x, (0x05, sp)
                                    254 ; genAssign
                           000093   255 	C$pff.c$413$1_0$327 ==.
                                    256 ;	../src/pff.c: 413: while (cnt--) *d++ = (char)val;
                                    257 ; genAssign
      0091C3 1F 01            [ 2]  258 	ldw	(0x01, sp), x
                                    259 ; genAssign
      0091C5 16 09            [ 2]  260 	ldw	y, (0x09, sp)
                                    261 ; genLabel
      0091C7                        262 00101$:
                                    263 ; genAssign
      0091C7 93               [ 1]  264 	ldw	x, y
                                    265 ; genMinus
      0091C8 90 5A            [ 2]  266 	decw	y
                                    267 ; genIfx
      0091CA 5D               [ 2]  268 	tnzw	x
      0091CB 26 03            [ 1]  269 	jrne	00117$
      0091CD CC 91 DD         [ 2]  270 	jp	00104$
      0091D0                        271 00117$:
                                    272 ; genCast
                                    273 ; genAssign
      0091D0 7B 08            [ 1]  274 	ld	a, (0x08, sp)
                                    275 ; genPointerSet
      0091D2 1E 01            [ 2]  276 	ldw	x, (0x01, sp)
      0091D4 F7               [ 1]  277 	ld	(x), a
                                    278 ; genPlus
      0091D5 1E 01            [ 2]  279 	ldw	x, (0x01, sp)
      0091D7 5C               [ 1]  280 	incw	x
      0091D8 1F 01            [ 2]  281 	ldw	(0x01, sp), x
      0091DA                        282 00118$:
                                    283 ; genGoto
      0091DA CC 91 C7         [ 2]  284 	jp	00101$
                                    285 ; genLabel
      0091DD                        286 00104$:
                           0000AD   287 	C$pff.c$414$1_0$327 ==.
                                    288 ;	../src/pff.c: 414: }
                                    289 ; genEndFunction
      0091DD 85               [ 2]  290 	popw	x
                           0000AE   291 	C$pff.c$414$1_0$327 ==.
                           0000AE   292 	XFpff$mem_set$0$0 ==.
      0091DE 81               [ 4]  293 	ret
                           0000AF   294 	Fpff$mem_cmp$0$0 ==.
                           0000AF   295 	C$pff.c$417$1_0$329 ==.
                                    296 ;	../src/pff.c: 417: static int mem_cmp (const void* dst, const void* src, int cnt) {
                                    297 ; genLabel
                                    298 ;	-----------------------------------------
                                    299 ;	 function mem_cmp
                                    300 ;	-----------------------------------------
                                    301 ;	Register assignment might be sub-optimal.
                                    302 ;	Stack space usage: 10 bytes.
      0091DF                        303 _mem_cmp:
      0091DF 52 0A            [ 2]  304 	sub	sp, #10
                           0000B1   305 	C$pff.c$418$1_0$329 ==.
                                    306 ;	../src/pff.c: 418: const char *d = (const char *)dst, *s = (const char *)src;
                                    307 ; genCast
                                    308 ; genAssign
      0091E1 16 0D            [ 2]  309 	ldw	y, (0x0d, sp)
                                    310 ; genAssign
                                    311 ; genCast
                                    312 ; genAssign
      0091E3 1E 0F            [ 2]  313 	ldw	x, (0x0f, sp)
                                    314 ; genAssign
                           0000B5   315 	C$pff.c$419$1_0$329 ==.
                                    316 ;	../src/pff.c: 419: int r = 0;
                                    317 ; genAssign
      0091E5 0F 02            [ 1]  318 	clr	(0x02, sp)
      0091E7 0F 01            [ 1]  319 	clr	(0x01, sp)
                           0000B9   320 	C$pff.c$420$1_0$329 ==.
                                    321 ;	../src/pff.c: 420: while (cnt-- && (r = *d++ - *s++) == 0) ;
                                    322 ; genAssign
      0091E9 17 05            [ 2]  323 	ldw	(0x05, sp), y
                                    324 ; genAssign
      0091EB 1F 07            [ 2]  325 	ldw	(0x07, sp), x
                                    326 ; genAssign
      0091ED 16 11            [ 2]  327 	ldw	y, (0x11, sp)
      0091EF 17 09            [ 2]  328 	ldw	(0x09, sp), y
                                    329 ; genLabel
      0091F1                        330 00102$:
                                    331 ; genAssign
      0091F1 16 09            [ 2]  332 	ldw	y, (0x09, sp)
      0091F3 17 03            [ 2]  333 	ldw	(0x03, sp), y
                                    334 ; genMinus
      0091F5 1E 09            [ 2]  335 	ldw	x, (0x09, sp)
      0091F7 5A               [ 2]  336 	decw	x
      0091F8 1F 09            [ 2]  337 	ldw	(0x09, sp), x
                                    338 ; genIfx
      0091FA 1E 03            [ 2]  339 	ldw	x, (0x03, sp)
      0091FC 26 03            [ 1]  340 	jrne	00118$
      0091FE CC 92 24         [ 2]  341 	jp	00104$
      009201                        342 00118$:
                                    343 ; genPointerGet
      009201 1E 05            [ 2]  344 	ldw	x, (0x05, sp)
      009203 F6               [ 1]  345 	ld	a, (x)
                                    346 ; genPlus
      009204 1E 05            [ 2]  347 	ldw	x, (0x05, sp)
      009206 5C               [ 1]  348 	incw	x
      009207 1F 05            [ 2]  349 	ldw	(0x05, sp), x
      009209                        350 00119$:
                                    351 ; genCast
                                    352 ; genAssign
      009209 5F               [ 1]  353 	clrw	x
      00920A 97               [ 1]  354 	ld	xl, a
                                    355 ; genPointerGet
      00920B 16 07            [ 2]  356 	ldw	y, (0x07, sp)
      00920D 90 F6            [ 1]  357 	ld	a, (y)
                                    358 ; genPlus
      00920F 16 07            [ 2]  359 	ldw	y, (0x07, sp)
      009211 90 5C            [ 1]  360 	incw	y
      009213 17 07            [ 2]  361 	ldw	(0x07, sp), y
                                    362 ; genCast
                                    363 ; genAssign
      009215 6B 04            [ 1]  364 	ld	(0x04, sp), a
      009217 0F 03            [ 1]  365 	clr	(0x03, sp)
                                    366 ; genMinus
      009219 72 F0 03         [ 2]  367 	subw	x, (0x03, sp)
                                    368 ; genAssign
      00921C 1F 01            [ 2]  369 	ldw	(0x01, sp), x
                                    370 ; genIfx
      00921E 5D               [ 2]  371 	tnzw	x
      00921F 26 03            [ 1]  372 	jrne	00120$
      009221 CC 91 F1         [ 2]  373 	jp	00102$
      009224                        374 00120$:
                                    375 ; genLabel
      009224                        376 00104$:
                           0000F4   377 	C$pff.c$421$1_0$329 ==.
                                    378 ;	../src/pff.c: 421: return r;
                                    379 ; genReturn
      009224 1E 01            [ 2]  380 	ldw	x, (0x01, sp)
                                    381 ; genLabel
      009226                        382 00105$:
                           0000F6   383 	C$pff.c$422$1_0$329 ==.
                                    384 ;	../src/pff.c: 422: }
                                    385 ; genEndFunction
      009226 5B 0A            [ 2]  386 	addw	sp, #10
                           0000F8   387 	C$pff.c$422$1_0$329 ==.
                           0000F8   388 	XFpff$mem_cmp$0$0 ==.
      009228 81               [ 4]  389 	ret
                           0000F9   390 	Fpff$get_fat$0$0 ==.
                           0000F9   391 	C$pff.c$430$1_0$331 ==.
                                    392 ;	../src/pff.c: 430: static CLUST get_fat (	/* 1:IO error, Else:Cluster status */
                                    393 ; genLabel
                                    394 ;	-----------------------------------------
                                    395 ;	 function get_fat
                                    396 ;	-----------------------------------------
                                    397 ;	Register assignment might be sub-optimal.
                                    398 ;	Stack space usage: 18 bytes.
      009229                        399 _get_fat:
      009229 52 12            [ 2]  400 	sub	sp, #18
                           0000FB   401 	C$pff.c$435$2_0$331 ==.
                                    402 ;	../src/pff.c: 435: FATFS *fs = FatFs;
                                    403 ; genAssign
      00922B 90 CE 02 61      [ 2]  404 	ldw	y, _FatFs+0
                           0000FF   405 	C$pff.c$440$1_0$331 ==.
                                    406 ;	../src/pff.c: 440: if (clst < 2 || clst >= fs->n_fatent) return 1;	/* Range check */
                                    407 ; genCmp
                                    408 ; genCmpTop
      00922F 1E 17            [ 2]  409 	ldw	x, (0x17, sp)
      009231 A3 00 02         [ 2]  410 	cpw	x, #0x0002
      009234 7B 16            [ 1]  411 	ld	a, (0x16, sp)
      009236 A2 00            [ 1]  412 	sbc	a, #0x00
      009238 7B 15            [ 1]  413 	ld	a, (0x15, sp)
      00923A A2 00            [ 1]  414 	sbc	a, #0x00
      00923C 24 03            [ 1]  415 	jrnc	00125$
      00923E CC 92 5F         [ 2]  416 	jp	00101$
      009241                        417 00125$:
                                    418 ; skipping generated iCode
                                    419 ; genAssign
      009241 93               [ 1]  420 	ldw	x, y
                                    421 ; genPointerGet
      009242 E6 09            [ 1]  422 	ld	a, (0x9, x)
      009244 6B 12            [ 1]  423 	ld	(0x12, sp), a
      009246 E6 08            [ 1]  424 	ld	a, (0x8, x)
      009248 6B 11            [ 1]  425 	ld	(0x11, sp), a
      00924A EE 06            [ 2]  426 	ldw	x, (0x6, x)
      00924C 1F 0F            [ 2]  427 	ldw	(0x0f, sp), x
                                    428 ; genCmp
                                    429 ; genCmpTop
      00924E 1E 17            [ 2]  430 	ldw	x, (0x17, sp)
      009250 13 11            [ 2]  431 	cpw	x, (0x11, sp)
      009252 7B 16            [ 1]  432 	ld	a, (0x16, sp)
      009254 12 10            [ 1]  433 	sbc	a, (0x10, sp)
      009256 7B 15            [ 1]  434 	ld	a, (0x15, sp)
      009258 12 0F            [ 1]  435 	sbc	a, (0x0f, sp)
      00925A 24 03            [ 1]  436 	jrnc	00126$
      00925C CC 92 66         [ 2]  437 	jp	00102$
      00925F                        438 00126$:
                                    439 ; skipping generated iCode
                                    440 ; genLabel
      00925F                        441 00101$:
                                    442 ; genReturn
      00925F 5F               [ 1]  443 	clrw	x
      009260 5C               [ 1]  444 	incw	x
      009261 90 5F            [ 1]  445 	clrw	y
      009263 CC 92 DE         [ 2]  446 	jp	00108$
                                    447 ; genLabel
      009266                        448 00102$:
                           000136   449 	C$pff.c$442$1_0$331 ==.
                                    450 ;	../src/pff.c: 442: switch (fs->fs_type) {
                                    451 ; genPointerGet
      009266 90 F6            [ 1]  452 	ld	a, (y)
                                    453 ; genCmpEQorNE
      009268 A1 03            [ 1]  454 	cp	a, #0x03
      00926A 26 03            [ 1]  455 	jrne	00128$
      00926C CC 92 72         [ 2]  456 	jp	00129$
      00926F                        457 00128$:
      00926F CC 92 DA         [ 2]  458 	jp	00107$
      009272                        459 00129$:
                                    460 ; skipping generated iCode
                           000142   461 	C$pff.c$464$2_0$332 ==.
                                    462 ;	../src/pff.c: 464: if (disk_readp(buf, fs->fatbase + clst / 128, ((UINT)clst % 128) * 4, 4)) break;
                                    463 ; genCast
                                    464 ; genAssign
      009272 1E 17            [ 2]  465 	ldw	x, (0x17, sp)
                                    466 ; genAnd
      009274 9F               [ 1]  467 	ld	a, xl
      009275 A4 7F            [ 1]  468 	and	a, #0x7f
      009277 97               [ 1]  469 	ld	xl, a
      009278 4F               [ 1]  470 	clr	a
      009279 95               [ 1]  471 	ld	xh, a
                                    472 ; genLeftShiftLiteral
      00927A 58               [ 2]  473 	sllw	x
      00927B 58               [ 2]  474 	sllw	x
      00927C 1F 05            [ 2]  475 	ldw	(0x05, sp), x
                                    476 ; genAssign
      00927E 93               [ 1]  477 	ldw	x, y
                                    478 ; genPointerGet
      00927F E6 0D            [ 1]  479 	ld	a, (0xd, x)
      009281 6B 0A            [ 1]  480 	ld	(0x0a, sp), a
      009283 E6 0C            [ 1]  481 	ld	a, (0xc, x)
      009285 EE 0A            [ 2]  482 	ldw	x, (0xa, x)
      009287 1F 07            [ 2]  483 	ldw	(0x07, sp), x
                                    484 ; genRightShiftLiteral
      009289 1E 17            [ 2]  485 	ldw	x, (0x17, sp)
      00928B 16 15            [ 2]  486 	ldw	y, (0x15, sp)
      00928D 88               [ 1]  487 	push	a
      00928E 4F               [ 1]  488 	clr	a
      00928F 90 01            [ 1]  489 	rrwa	y
      009291 01               [ 1]  490 	rrwa	x
      009292 48               [ 1]  491 	sll	a
      009293 59               [ 2]  492 	rlcw	x
      009294 90 59            [ 2]  493 	rlcw	y
      009296 84               [ 1]  494 	pop	a
      009297 1F 0D            [ 2]  495 	ldw	(0x0d, sp), x
                                    496 ; genPlus
      009299 95               [ 1]  497 	ld	xh, a
      00929A 41               [ 1]  498 	exg	a, xl
      00929B 7B 0A            [ 1]  499 	ld	a, (0x0a, sp)
      00929D 41               [ 1]  500 	exg	a, xl
      00929E 72 FB 0D         [ 2]  501 	addw	x, (0x0d, sp)
      0092A1 90 9F            [ 1]  502 	ld	a, yl
      0092A3 19 08            [ 1]  503 	adc	a, (0x08, sp)
      0092A5 6B 10            [ 1]  504 	ld	(0x10, sp), a
      0092A7 90 9E            [ 1]  505 	ld	a, yh
      0092A9 19 07            [ 1]  506 	adc	a, (0x07, sp)
      0092AB 6B 0F            [ 1]  507 	ld	(0x0f, sp), a
                                    508 ; skipping iCode since result will be rematerialized
                                    509 ; skipping iCode since result will be rematerialized
                                    510 ; genIPush
      0092AD 4B 04            [ 1]  511 	push	#0x04
      0092AF 4B 00            [ 1]  512 	push	#0x00
                                    513 ; genIPush
      0092B1 16 07            [ 2]  514 	ldw	y, (0x07, sp)
      0092B3 90 89            [ 2]  515 	pushw	y
                                    516 ; genIPush
      0092B5 89               [ 2]  517 	pushw	x
      0092B6 1E 15            [ 2]  518 	ldw	x, (0x15, sp)
      0092B8 89               [ 2]  519 	pushw	x
                                    520 ; genIPush
      0092B9 96               [ 1]  521 	ldw	x, sp
      0092BA 1C 00 09         [ 2]  522 	addw	x, #9
      0092BD 89               [ 2]  523 	pushw	x
                                    524 ; genCall
      0092BE CD 86 47         [ 4]  525 	call	_disk_readp
      0092C1 5B 0A            [ 2]  526 	addw	sp, #10
                                    527 ; genIfx
      0092C3 4D               [ 1]  528 	tnz	a
      0092C4 27 03            [ 1]  529 	jreq	00130$
      0092C6 CC 92 DA         [ 2]  530 	jp	00107$
      0092C9                        531 00130$:
                           000199   532 	C$pff.c$465$2_0$332 ==.
                                    533 ;	../src/pff.c: 465: return ld_dword(buf) & 0x0FFFFFFF;
                                    534 ; skipping iCode since result will be rematerialized
                                    535 ; skipping iCode since result will be rematerialized
                                    536 ; genIPush
      0092C9 96               [ 1]  537 	ldw	x, sp
      0092CA 5C               [ 1]  538 	incw	x
      0092CB 89               [ 2]  539 	pushw	x
                                    540 ; genCall
      0092CC CD 91 48         [ 4]  541 	call	_ld_dword
      0092CF 5B 02            [ 2]  542 	addw	sp, #2
                                    543 ; genAnd
      0092D1 90 9E            [ 1]  544 	ld	a, yh
      0092D3 A4 0F            [ 1]  545 	and	a, #0x0f
                                    546 ; genReturn
      0092D5 90 95            [ 1]  547 	ld	yh, a
      0092D7 CC 92 DE         [ 2]  548 	jp	00108$
                           0001AA   549 	C$pff.c$467$1_0$331 ==.
                                    550 ;	../src/pff.c: 467: }
                                    551 ; genLabel
      0092DA                        552 00107$:
                           0001AA   553 	C$pff.c$469$1_0$331 ==.
                                    554 ;	../src/pff.c: 469: return 1;	/* An error occured at the disk I/O layer */
                                    555 ; genReturn
      0092DA 5F               [ 1]  556 	clrw	x
      0092DB 5C               [ 1]  557 	incw	x
      0092DC 90 5F            [ 1]  558 	clrw	y
                                    559 ; genLabel
      0092DE                        560 00108$:
                           0001AE   561 	C$pff.c$470$1_0$331 ==.
                                    562 ;	../src/pff.c: 470: }
                                    563 ; genEndFunction
      0092DE 5B 12            [ 2]  564 	addw	sp, #18
                           0001B0   565 	C$pff.c$470$1_0$331 ==.
                           0001B0   566 	XFpff$get_fat$0$0 ==.
      0092E0 81               [ 4]  567 	ret
                           0001B1   568 	Fpff$clust2sect$0$0 ==.
                           0001B1   569 	C$pff.c$479$1_0$334 ==.
                                    570 ;	../src/pff.c: 479: static DWORD clust2sect (	/* !=0: Sector number, 0: Failed - invalid cluster# */
                                    571 ; genLabel
                                    572 ;	-----------------------------------------
                                    573 ;	 function clust2sect
                                    574 ;	-----------------------------------------
                                    575 ;	Register assignment might be sub-optimal.
                                    576 ;	Stack space usage: 8 bytes.
      0092E1                        577 _clust2sect:
      0092E1 52 08            [ 2]  578 	sub	sp, #8
                           0001B3   579 	C$pff.c$483$2_0$334 ==.
                                    580 ;	../src/pff.c: 483: FATFS *fs = FatFs;
                                    581 ; genAssign
      0092E3 CE 02 61         [ 2]  582 	ldw	x, _FatFs+0
      0092E6 1F 07            [ 2]  583 	ldw	(0x07, sp), x
                           0001B8   584 	C$pff.c$486$1_0$334 ==.
                                    585 ;	../src/pff.c: 486: clst -= 2;
                                    586 ; genMinus
      0092E8 1E 0D            [ 2]  587 	ldw	x, (0x0d, sp)
      0092EA 1D 00 02         [ 2]  588 	subw	x, #0x0002
      0092ED 16 0B            [ 2]  589 	ldw	y, (0x0b, sp)
      0092EF 24 02            [ 1]  590 	jrnc	00110$
      0092F1 90 5A            [ 2]  591 	decw	y
      0092F3                        592 00110$:
                                    593 ; genAssign
      0092F3 1F 0D            [ 2]  594 	ldw	(0x0d, sp), x
      0092F5 17 0B            [ 2]  595 	ldw	(0x0b, sp), y
                           0001C7   596 	C$pff.c$487$1_0$334 ==.
                                    597 ;	../src/pff.c: 487: if (clst >= (fs->n_fatent - 2)) return 0;		/* Invalid cluster# */
                                    598 ; genAssign
      0092F7 1E 07            [ 2]  599 	ldw	x, (0x07, sp)
                                    600 ; genPointerGet
      0092F9 90 93            [ 1]  601 	ldw	y, x
      0092FB 90 EE 08         [ 2]  602 	ldw	y, (0x8, y)
      0092FE EE 06            [ 2]  603 	ldw	x, (0x6, x)
                                    604 ; genMinus
      009300 72 A2 00 02      [ 2]  605 	subw	y, #0x0002
      009304 17 05            [ 2]  606 	ldw	(0x05, sp), y
      009306 24 01            [ 1]  607 	jrnc	00111$
      009308 5A               [ 2]  608 	decw	x
      009309                        609 00111$:
      009309 1F 03            [ 2]  610 	ldw	(0x03, sp), x
                                    611 ; genCmp
                                    612 ; genCmpTop
      00930B 1E 0D            [ 2]  613 	ldw	x, (0x0d, sp)
      00930D 13 05            [ 2]  614 	cpw	x, (0x05, sp)
      00930F 7B 0C            [ 1]  615 	ld	a, (0x0c, sp)
      009311 12 04            [ 1]  616 	sbc	a, (0x04, sp)
      009313 7B 0B            [ 1]  617 	ld	a, (0x0b, sp)
      009315 12 03            [ 1]  618 	sbc	a, (0x03, sp)
      009317 24 03            [ 1]  619 	jrnc	00112$
      009319 CC 93 22         [ 2]  620 	jp	00102$
      00931C                        621 00112$:
                                    622 ; skipping generated iCode
                                    623 ; genReturn
      00931C 5F               [ 1]  624 	clrw	x
      00931D 90 5F            [ 1]  625 	clrw	y
      00931F CC 93 54         [ 2]  626 	jp	00103$
                                    627 ; genLabel
      009322                        628 00102$:
                           0001F2   629 	C$pff.c$488$1_0$334 ==.
                                    630 ;	../src/pff.c: 488: return (DWORD)clst * fs->csize + fs->database;
                                    631 ; genAssign
      009322 1E 07            [ 2]  632 	ldw	x, (0x07, sp)
                                    633 ; genPointerGet
      009324 E6 02            [ 1]  634 	ld	a, (0x2, x)
                                    635 ; genCast
                                    636 ; genAssign
      009326 5F               [ 1]  637 	clrw	x
      009327 97               [ 1]  638 	ld	xl, a
      009328 90 5F            [ 1]  639 	clrw	y
                                    640 ; genIPush
      00932A 89               [ 2]  641 	pushw	x
      00932B 90 89            [ 2]  642 	pushw	y
                                    643 ; genIPush
      00932D 1E 11            [ 2]  644 	ldw	x, (0x11, sp)
      00932F 89               [ 2]  645 	pushw	x
      009330 1E 11            [ 2]  646 	ldw	x, (0x11, sp)
      009332 89               [ 2]  647 	pushw	x
                                    648 ; genCall
      009333 CD A0 6B         [ 4]  649 	call	__mullong
      009336 5B 08            [ 2]  650 	addw	sp, #8
      009338 1F 03            [ 2]  651 	ldw	(0x03, sp), x
      00933A 17 01            [ 2]  652 	ldw	(0x01, sp), y
                                    653 ; genAssign
      00933C 1E 07            [ 2]  654 	ldw	x, (0x07, sp)
                                    655 ; genPointerGet
      00933E 90 93            [ 1]  656 	ldw	y, x
      009340 90 EE 14         [ 2]  657 	ldw	y, (0x14, y)
      009343 EE 12            [ 2]  658 	ldw	x, (0x12, x)
      009345 1F 05            [ 2]  659 	ldw	(0x05, sp), x
                                    660 ; genPlus
      009347 93               [ 1]  661 	ldw	x, y
      009348 72 FB 03         [ 2]  662 	addw	x, (0x03, sp)
      00934B 16 05            [ 2]  663 	ldw	y, (0x05, sp)
      00934D 24 02            [ 1]  664 	jrnc	00113$
      00934F 90 5C            [ 1]  665 	incw	y
      009351                        666 00113$:
      009351 72 F9 01         [ 2]  667 	addw	y, (0x01, sp)
                                    668 ; genReturn
                                    669 ; genLabel
      009354                        670 00103$:
                           000224   671 	C$pff.c$489$1_0$334 ==.
                                    672 ;	../src/pff.c: 489: }
                                    673 ; genEndFunction
      009354 5B 08            [ 2]  674 	addw	sp, #8
                           000226   675 	C$pff.c$489$1_0$334 ==.
                           000226   676 	XFpff$clust2sect$0$0 ==.
      009356 81               [ 4]  677 	ret
                           000227   678 	Fpff$get_clust$0$0 ==.
                           000227   679 	C$pff.c$492$1_0$336 ==.
                                    680 ;	../src/pff.c: 492: static CLUST get_clust (
                                    681 ; genLabel
                                    682 ;	-----------------------------------------
                                    683 ;	 function get_clust
                                    684 ;	-----------------------------------------
                                    685 ;	Register assignment might be sub-optimal.
                                    686 ;	Stack space usage: 4 bytes.
      009357                        687 _get_clust:
      009357 52 04            [ 2]  688 	sub	sp, #4
                           000229   689 	C$pff.c$501$2_0$337 ==.
                                    690 ;	../src/pff.c: 501: clst = ld_word(dir+DIR_FstClusHI);
                                    691 ; genPlus
      009359 1E 07            [ 2]  692 	ldw	x, (0x07, sp)
      00935B 1C 00 14         [ 2]  693 	addw	x, #0x0014
                                    694 ; genIPush
      00935E 89               [ 2]  695 	pushw	x
                                    696 ; genCall
      00935F CD 91 30         [ 4]  697 	call	_ld_word
      009362 5B 02            [ 2]  698 	addw	sp, #2
                                    699 ; genCast
                                    700 ; genAssign
      009364 51               [ 1]  701 	exgw	x, y
      009365 5F               [ 1]  702 	clrw	x
                                    703 ; genAssign
                           000236   704 	C$pff.c$502$2_0$337 ==.
                                    705 ;	../src/pff.c: 502: clst <<= 16;
                                    706 ; genLeftShiftLiteral
      009366 5F               [ 1]  707 	clrw	x
                                    708 ; genAssign
      009367 1F 03            [ 2]  709 	ldw	(0x03, sp), x
      009369 17 01            [ 2]  710 	ldw	(0x01, sp), y
                           00023B   711 	C$pff.c$504$1_0$336 ==.
                                    712 ;	../src/pff.c: 504: clst |= ld_word(dir+DIR_FstClusLO);
                                    713 ; genPlus
      00936B 1E 07            [ 2]  714 	ldw	x, (0x07, sp)
      00936D 1C 00 1A         [ 2]  715 	addw	x, #0x001a
                                    716 ; genIPush
      009370 89               [ 2]  717 	pushw	x
                                    718 ; genCall
      009371 CD 91 30         [ 4]  719 	call	_ld_word
      009374 5B 02            [ 2]  720 	addw	sp, #2
                                    721 ; genCast
                                    722 ; genAssign
      009376 4F               [ 1]  723 	clr	a
      009377 90 5F            [ 1]  724 	clrw	y
                                    725 ; genOr
      009379 1A 02            [ 1]  726 	or	a, (0x02, sp)
      00937B 90 97            [ 1]  727 	ld	yl, a
      00937D 9F               [ 1]  728 	ld	a, xl
      00937E 1A 04            [ 1]  729 	or	a, (0x04, sp)
      009380 97               [ 1]  730 	ld	xl, a
      009381 9E               [ 1]  731 	ld	a, xh
      009382 1A 03            [ 1]  732 	or	a, (0x03, sp)
      009384 95               [ 1]  733 	ld	xh, a
      009385 90 9E            [ 1]  734 	ld	a, yh
      009387 1A 01            [ 1]  735 	or	a, (0x01, sp)
                                    736 ; genAssign
                           000259   737 	C$pff.c$506$1_0$336 ==.
                                    738 ;	../src/pff.c: 506: return clst;
                                    739 ; genReturn
      009389 90 95            [ 1]  740 	ld	yh, a
                                    741 ; genLabel
      00938B                        742 00105$:
                           00025B   743 	C$pff.c$507$1_0$336 ==.
                                    744 ;	../src/pff.c: 507: }
                                    745 ; genEndFunction
      00938B 5B 04            [ 2]  746 	addw	sp, #4
                           00025D   747 	C$pff.c$507$1_0$336 ==.
                           00025D   748 	XFpff$get_clust$0$0 ==.
      00938D 81               [ 4]  749 	ret
                           00025E   750 	Fpff$dir_rewind$0$0 ==.
                           00025E   751 	C$pff.c$514$1_0$339 ==.
                                    752 ;	../src/pff.c: 514: static FRESULT dir_rewind (
                                    753 ; genLabel
                                    754 ;	-----------------------------------------
                                    755 ;	 function dir_rewind
                                    756 ;	-----------------------------------------
                                    757 ;	Register assignment might be sub-optimal.
                                    758 ;	Stack space usage: 12 bytes.
      00938E                        759 _dir_rewind:
      00938E 52 0C            [ 2]  760 	sub	sp, #12
                           000260   761 	C$pff.c$519$2_0$339 ==.
                                    762 ;	../src/pff.c: 519: FATFS *fs = FatFs;
                                    763 ; genAssign
      009390 CE 02 61         [ 2]  764 	ldw	x, _FatFs+0
      009393 1F 07            [ 2]  765 	ldw	(0x07, sp), x
                           000265   766 	C$pff.c$522$1_0$339 ==.
                                    767 ;	../src/pff.c: 522: dj->index = 0;
                                    768 ; genAssign
      009395 16 0F            [ 2]  769 	ldw	y, (0x0f, sp)
      009397 17 05            [ 2]  770 	ldw	(0x05, sp), y
                                    771 ; genPointerSet
      009399 1E 05            [ 2]  772 	ldw	x, (0x05, sp)
      00939B 6F 01            [ 1]  773 	clr	(0x1, x)
      00939D 7F               [ 1]  774 	clr	(x)
                           00026E   775 	C$pff.c$523$1_0$339 ==.
                                    776 ;	../src/pff.c: 523: clst = dj->sclust;
                                    777 ; genAssign
      00939E 1E 05            [ 2]  778 	ldw	x, (0x05, sp)
                                    779 ; genPointerGet
      0093A0 90 93            [ 1]  780 	ldw	y, x
      0093A2 90 EE 06         [ 2]  781 	ldw	y, (0x6, y)
      0093A5 EE 04            [ 2]  782 	ldw	x, (0x4, x)
                                    783 ; genAssign
      0093A7 17 0B            [ 2]  784 	ldw	(0x0b, sp), y
      0093A9 1F 09            [ 2]  785 	ldw	(0x09, sp), x
                           00027B   786 	C$pff.c$524$1_0$339 ==.
                                    787 ;	../src/pff.c: 524: if (clst == 1 || clst >= fs->n_fatent) {	/* Check start cluster range */
                                    788 ; genCmpEQorNE
      0093AB 1E 0B            [ 2]  789 	ldw	x, (0x0b, sp)
      0093AD 5A               [ 2]  790 	decw	x
      0093AE 26 07            [ 1]  791 	jrne	00129$
      0093B0 1E 09            [ 2]  792 	ldw	x, (0x09, sp)
      0093B2 26 03            [ 1]  793 	jrne	00129$
      0093B4 CC 93 D5         [ 2]  794 	jp	00101$
      0093B7                        795 00129$:
                                    796 ; skipping generated iCode
                                    797 ; genAssign
      0093B7 1E 07            [ 2]  798 	ldw	x, (0x07, sp)
                                    799 ; genPointerGet
      0093B9 90 93            [ 1]  800 	ldw	y, x
      0093BB 90 EE 08         [ 2]  801 	ldw	y, (0x8, y)
      0093BE 17 03            [ 2]  802 	ldw	(0x03, sp), y
      0093C0 EE 06            [ 2]  803 	ldw	x, (0x6, x)
      0093C2 1F 01            [ 2]  804 	ldw	(0x01, sp), x
                                    805 ; genCmp
                                    806 ; genCmpTop
      0093C4 1E 0B            [ 2]  807 	ldw	x, (0x0b, sp)
      0093C6 13 03            [ 2]  808 	cpw	x, (0x03, sp)
      0093C8 7B 0A            [ 1]  809 	ld	a, (0x0a, sp)
      0093CA 12 02            [ 1]  810 	sbc	a, (0x02, sp)
      0093CC 7B 09            [ 1]  811 	ld	a, (0x09, sp)
      0093CE 12 01            [ 1]  812 	sbc	a, (0x01, sp)
      0093D0 24 03            [ 1]  813 	jrnc	00131$
      0093D2 CC 93 DA         [ 2]  814 	jp	00106$
      0093D5                        815 00131$:
                                    816 ; skipping generated iCode
                                    817 ; genLabel
      0093D5                        818 00101$:
                           0002A5   819 	C$pff.c$525$2_0$340 ==.
                                    820 ;	../src/pff.c: 525: return FR_DISK_ERR;
                                    821 ; genReturn
      0093D5 A6 01            [ 1]  822 	ld	a, #0x01
      0093D7 CC 94 1B         [ 2]  823 	jp	00109$
                           0002AA   824 	C$pff.c$527$1_0$339 ==.
                                    825 ;	../src/pff.c: 527: if (PF_FS_FAT32 && !clst && (_FS_32ONLY || fs->fs_type == FS_FAT32)) {	/* Replace cluster# 0 with root cluster# if in FAT32 */
                                    826 ; genLabel
      0093DA                        827 00106$:
                                    828 ; genIfx
      0093DA 1E 0B            [ 2]  829 	ldw	x, (0x0b, sp)
      0093DC 26 04            [ 1]  830 	jrne	00132$
      0093DE 1E 09            [ 2]  831 	ldw	x, (0x09, sp)
      0093E0 27 03            [ 1]  832 	jreq	00133$
      0093E2                        833 00132$:
      0093E2 CC 93 F2         [ 2]  834 	jp	00105$
      0093E5                        835 00133$:
                           0002B5   836 	C$pff.c$528$2_0$341 ==.
                                    837 ;	../src/pff.c: 528: clst = (CLUST)fs->dirbase;
                                    838 ; genAssign
                                    839 ; genPointerGet
      0093E5 1E 07            [ 2]  840 	ldw	x, (0x07, sp)
      0093E7 90 93            [ 1]  841 	ldw	y, x
      0093E9 90 EE 10         [ 2]  842 	ldw	y, (0x10, y)
      0093EC 17 0B            [ 2]  843 	ldw	(0x0b, sp), y
      0093EE EE 0E            [ 2]  844 	ldw	x, (0xe, x)
      0093F0 1F 09            [ 2]  845 	ldw	(0x09, sp), x
                                    846 ; genAssign
                                    847 ; genLabel
      0093F2                        848 00105$:
                           0002C2   849 	C$pff.c$530$1_0$339 ==.
                                    850 ;	../src/pff.c: 530: dj->clust = clst;						/* Current cluster */
                                    851 ; genPlus
      0093F2 1E 05            [ 2]  852 	ldw	x, (0x05, sp)
      0093F4 1C 00 08         [ 2]  853 	addw	x, #0x0008
                                    854 ; genPointerSet
      0093F7 16 0B            [ 2]  855 	ldw	y, (0x0b, sp)
      0093F9 EF 02            [ 2]  856 	ldw	(0x2, x), y
      0093FB 16 09            [ 2]  857 	ldw	y, (0x09, sp)
      0093FD FF               [ 2]  858 	ldw	(x), y
                           0002CE   859 	C$pff.c$531$1_0$339 ==.
                                    860 ;	../src/pff.c: 531: dj->sect = (_FS_32ONLY || clst) ? clust2sect(clst) : fs->dirbase;	/* Current sector */
                                    861 ; genPlus
      0093FE 1E 05            [ 2]  862 	ldw	x, (0x05, sp)
      009400 1C 00 0C         [ 2]  863 	addw	x, #0x000c
      009403 1F 07            [ 2]  864 	ldw	(0x07, sp), x
                                    865 ; genIPush
      009405 1E 0B            [ 2]  866 	ldw	x, (0x0b, sp)
      009407 89               [ 2]  867 	pushw	x
      009408 1E 0B            [ 2]  868 	ldw	x, (0x0b, sp)
      00940A 89               [ 2]  869 	pushw	x
                                    870 ; genCall
      00940B CD 92 E1         [ 4]  871 	call	_clust2sect
      00940E 5B 04            [ 2]  872 	addw	sp, #4
      009410 51               [ 1]  873 	exgw	x, y
                                    874 ; genAssign
      009411 1F 09            [ 2]  875 	ldw	(0x09, sp), x
                                    876 ; genPointerSet
      009413 1E 07            [ 2]  877 	ldw	x, (0x07, sp)
      009415 EF 02            [ 2]  878 	ldw	(0x2, x), y
      009417 16 09            [ 2]  879 	ldw	y, (0x09, sp)
      009419 FF               [ 2]  880 	ldw	(x), y
                           0002EA   881 	C$pff.c$533$1_0$339 ==.
                                    882 ;	../src/pff.c: 533: return FR_OK;	/* Seek succeeded */
                                    883 ; genReturn
      00941A 4F               [ 1]  884 	clr	a
                                    885 ; genLabel
      00941B                        886 00109$:
                           0002EB   887 	C$pff.c$534$1_0$339 ==.
                                    888 ;	../src/pff.c: 534: }
                                    889 ; genEndFunction
      00941B 5B 0C            [ 2]  890 	addw	sp, #12
                           0002ED   891 	C$pff.c$534$1_0$339 ==.
                           0002ED   892 	XFpff$dir_rewind$0$0 ==.
      00941D 81               [ 4]  893 	ret
                           0002EE   894 	Fpff$dir_next$0$0 ==.
                           0002EE   895 	C$pff.c$543$1_0$343 ==.
                                    896 ;	../src/pff.c: 543: static FRESULT dir_next (	/* FR_OK:Succeeded, FR_NO_FILE:End of table */
                                    897 ; genLabel
                                    898 ;	-----------------------------------------
                                    899 ;	 function dir_next
                                    900 ;	-----------------------------------------
                                    901 ;	Register assignment might be sub-optimal.
                                    902 ;	Stack space usage: 20 bytes.
      00941E                        903 _dir_next:
      00941E 52 14            [ 2]  904 	sub	sp, #20
                           0002F0   905 	C$pff.c$549$2_0$343 ==.
                                    906 ;	../src/pff.c: 549: FATFS *fs = FatFs;
                                    907 ; genAssign
      009420 CE 02 61         [ 2]  908 	ldw	x, _FatFs+0
      009423 1F 05            [ 2]  909 	ldw	(0x05, sp), x
                           0002F5   910 	C$pff.c$552$1_0$343 ==.
                                    911 ;	../src/pff.c: 552: i = dj->index + 1;
                                    912 ; genAssign
      009425 16 17            [ 2]  913 	ldw	y, (0x17, sp)
      009427 17 07            [ 2]  914 	ldw	(0x07, sp), y
                                    915 ; genPointerGet
      009429 1E 07            [ 2]  916 	ldw	x, (0x07, sp)
      00942B FE               [ 2]  917 	ldw	x, (x)
                                    918 ; genCast
                                    919 ; genAssign
                                    920 ; genPlus
      00942C 5C               [ 1]  921 	incw	x
                                    922 ; genCast
                                    923 ; genAssign
                                    924 ; genAssign
      00942D 1F 09            [ 2]  925 	ldw	(0x09, sp), x
                           0002FF   926 	C$pff.c$553$1_0$343 ==.
                                    927 ;	../src/pff.c: 553: if (!i || !dj->sect) return FR_NO_FILE;	/* Report EOT when index has reached 65535 */
                                    928 ; genIfx
      00942F 1E 09            [ 2]  929 	ldw	x, (0x09, sp)
      009431 26 03            [ 1]  930 	jrne	00154$
      009433 CC 94 54         [ 2]  931 	jp	00101$
      009436                        932 00154$:
                                    933 ; genPlus
      009436 1E 07            [ 2]  934 	ldw	x, (0x07, sp)
      009438 1C 00 0C         [ 2]  935 	addw	x, #0x000c
      00943B 1F 0B            [ 2]  936 	ldw	(0x0b, sp), x
                                    937 ; genPointerGet
      00943D 1E 0B            [ 2]  938 	ldw	x, (0x0b, sp)
      00943F 90 93            [ 1]  939 	ldw	y, x
      009441 90 EE 02         [ 2]  940 	ldw	y, (0x2, y)
      009444 17 03            [ 2]  941 	ldw	(0x03, sp), y
      009446 FE               [ 2]  942 	ldw	x, (x)
      009447 1F 01            [ 2]  943 	ldw	(0x01, sp), x
                                    944 ; genIfx
      009449 1E 03            [ 2]  945 	ldw	x, (0x03, sp)
      00944B 26 04            [ 1]  946 	jrne	00155$
      00944D 1E 01            [ 2]  947 	ldw	x, (0x01, sp)
      00944F 27 03            [ 1]  948 	jreq	00156$
      009451                        949 00155$:
      009451 CC 94 59         [ 2]  950 	jp	00102$
      009454                        951 00156$:
                                    952 ; genLabel
      009454                        953 00101$:
                                    954 ; genReturn
      009454 A6 03            [ 1]  955 	ld	a, #0x03
      009456 CC 95 40         [ 2]  956 	jp	00117$
                                    957 ; genLabel
      009459                        958 00102$:
                           000329   959 	C$pff.c$555$1_0$343 ==.
                                    960 ;	../src/pff.c: 555: if (!(i % 16)) {		/* Sector changed? */
                                    961 ; genCast
                                    962 ; genAssign
      009459 16 09            [ 2]  963 	ldw	y, (0x09, sp)
      00945B 17 13            [ 2]  964 	ldw	(0x13, sp), y
                                    965 ; genAnd
      00945D 7B 14            [ 1]  966 	ld	a, (0x14, sp)
      00945F A5 0F            [ 1]  967 	bcp	a, #0x0f
      009461 27 03            [ 1]  968 	jreq	00157$
      009463 CC 95 3A         [ 2]  969 	jp	00116$
      009466                        970 00157$:
                                    971 ; skipping generated iCode
                           000336   972 	C$pff.c$556$2_0$344 ==.
                                    973 ;	../src/pff.c: 556: dj->sect++;			/* Next sector */
                                    974 ; genPlus
      009466 7B 04            [ 1]  975 	ld	a, (0x04, sp)
      009468 AB 01            [ 1]  976 	add	a, #0x01
      00946A 88               [ 1]  977 	push	a
      00946B 7B 04            [ 1]  978 	ld	a, (0x04, sp)
      00946D A9 00            [ 1]  979 	adc	a, #0x00
      00946F 6B 12            [ 1]  980 	ld	(0x12, sp), a
      009471 16 02            [ 2]  981 	ldw	y, (0x02, sp)
      009473 24 02            [ 1]  982 	jrnc	00158$
      009475 90 5C            [ 1]  983 	incw	y
      009477                        984 00158$:
      009477 84               [ 1]  985 	pop	a
                                    986 ; genPointerSet
      009478 1E 0B            [ 2]  987 	ldw	x, (0x0b, sp)
      00947A E7 03            [ 1]  988 	ld	(0x3, x), a
      00947C 7B 11            [ 1]  989 	ld	a, (0x11, sp)
      00947E E7 02            [ 1]  990 	ld	(0x2, x), a
      009480 FF               [ 2]  991 	ldw	(x), y
                           000351   992 	C$pff.c$558$1_0$343 ==.
                                    993 ;	../src/pff.c: 558: if (dj->clust == 0) {	/* Static table */
                                    994 ; genPlus
      009481 1E 07            [ 2]  995 	ldw	x, (0x07, sp)
      009483 1C 00 08         [ 2]  996 	addw	x, #0x0008
      009486 1F 0D            [ 2]  997 	ldw	(0x0d, sp), x
                                    998 ; genPointerGet
      009488 1E 0D            [ 2]  999 	ldw	x, (0x0d, sp)
      00948A 90 93            [ 1] 1000 	ldw	y, x
      00948C 90 EE 02         [ 2] 1001 	ldw	y, (0x2, y)
      00948F FE               [ 2] 1002 	ldw	x, (x)
      009490 1F 0F            [ 2] 1003 	ldw	(0x0f, sp), x
                                   1004 ; genIfx
      009492 90 5D            [ 2] 1005 	tnzw	y
      009494 26 04            [ 1] 1006 	jrne	00159$
      009496 1E 0F            [ 2] 1007 	ldw	x, (0x0f, sp)
      009498 27 03            [ 1] 1008 	jreq	00160$
      00949A                       1009 00159$:
      00949A CC 94 B1         [ 2] 1010 	jp	00113$
      00949D                       1011 00160$:
                           00036D  1012 	C$pff.c$559$3_0$345 ==.
                                   1013 ;	../src/pff.c: 559: if (i >= fs->n_rootdir) return FR_NO_FILE;	/* Report EOT when end of table */
                                   1014 ; genAssign
      00949D 1E 05            [ 2] 1015 	ldw	x, (0x05, sp)
                                   1016 ; genPointerGet
      00949F EE 04            [ 2] 1017 	ldw	x, (0x4, x)
      0094A1 1F 13            [ 2] 1018 	ldw	(0x13, sp), x
                                   1019 ; genCmp
                                   1020 ; genCmpTop
      0094A3 1E 09            [ 2] 1021 	ldw	x, (0x09, sp)
      0094A5 13 13            [ 2] 1022 	cpw	x, (0x13, sp)
      0094A7 24 03            [ 1] 1023 	jrnc	00161$
      0094A9 CC 95 3A         [ 2] 1024 	jp	00116$
      0094AC                       1025 00161$:
                                   1026 ; skipping generated iCode
                                   1027 ; genReturn
      0094AC A6 03            [ 1] 1028 	ld	a, #0x03
      0094AE CC 95 40         [ 2] 1029 	jp	00117$
                                   1030 ; genLabel
      0094B1                       1031 00113$:
                           000381  1032 	C$pff.c$562$3_0$346 ==.
                                   1033 ;	../src/pff.c: 562: if (((i / 16) & (fs->csize - 1)) == 0) {	/* Cluster changed? */
                                   1034 ; genRightShiftLiteral
      0094B1 04 13            [ 1] 1035 	srl	(0x13, sp)
      0094B3 06 14            [ 1] 1036 	rrc	(0x14, sp)
      0094B5 04 13            [ 1] 1037 	srl	(0x13, sp)
      0094B7 06 14            [ 1] 1038 	rrc	(0x14, sp)
      0094B9 04 13            [ 1] 1039 	srl	(0x13, sp)
      0094BB 06 14            [ 1] 1040 	rrc	(0x14, sp)
      0094BD 04 13            [ 1] 1041 	srl	(0x13, sp)
      0094BF 06 14            [ 1] 1042 	rrc	(0x14, sp)
                                   1043 ; genAssign
      0094C1 1E 05            [ 2] 1044 	ldw	x, (0x05, sp)
                                   1045 ; genPointerGet
      0094C3 E6 02            [ 1] 1046 	ld	a, (0x2, x)
                                   1047 ; genCast
                                   1048 ; genAssign
      0094C5 5F               [ 1] 1049 	clrw	x
      0094C6 97               [ 1] 1050 	ld	xl, a
                                   1051 ; genMinus
      0094C7 5A               [ 2] 1052 	decw	x
      0094C8 9F               [ 1] 1053 	ld	a, xl
                                   1054 ; genAnd
      0094C9 14 14            [ 1] 1055 	and	a, (0x14, sp)
      0094CB 97               [ 1] 1056 	ld	xl, a
      0094CC 9E               [ 1] 1057 	ld	a, xh
      0094CD 14 13            [ 1] 1058 	and	a, (0x13, sp)
      0094CF 95               [ 1] 1059 	ld	xh, a
                                   1060 ; genIfx
      0094D0 5D               [ 2] 1061 	tnzw	x
      0094D1 27 03            [ 1] 1062 	jreq	00162$
      0094D3 CC 95 3A         [ 2] 1063 	jp	00116$
      0094D6                       1064 00162$:
                           0003A6  1065 	C$pff.c$563$4_0$347 ==.
                                   1066 ;	../src/pff.c: 563: clst = get_fat(dj->clust);		/* Get next cluster */
                                   1067 ; genIPush
      0094D6 90 89            [ 2] 1068 	pushw	y
      0094D8 1E 11            [ 2] 1069 	ldw	x, (0x11, sp)
      0094DA 89               [ 2] 1070 	pushw	x
                                   1071 ; genCall
      0094DB CD 92 29         [ 4] 1072 	call	_get_fat
      0094DE 5B 04            [ 2] 1073 	addw	sp, #4
                                   1074 ; genAssign
      0094E0 1F 13            [ 2] 1075 	ldw	(0x13, sp), x
      0094E2 17 11            [ 2] 1076 	ldw	(0x11, sp), y
                           0003B4  1077 	C$pff.c$564$4_0$347 ==.
                                   1078 ;	../src/pff.c: 564: if (clst <= 1) return FR_DISK_ERR;
                                   1079 ; genCmp
                                   1080 ; genCmpTop
      0094E4 5F               [ 1] 1081 	clrw	x
      0094E5 5C               [ 1] 1082 	incw	x
      0094E6 13 13            [ 2] 1083 	cpw	x, (0x13, sp)
      0094E8 4F               [ 1] 1084 	clr	a
      0094E9 12 12            [ 1] 1085 	sbc	a, (0x12, sp)
      0094EB 4F               [ 1] 1086 	clr	a
      0094EC 12 11            [ 1] 1087 	sbc	a, (0x11, sp)
      0094EE 24 03            [ 1] 1088 	jrnc	00163$
      0094F0 CC 94 F8         [ 2] 1089 	jp	00107$
      0094F3                       1090 00163$:
                                   1091 ; skipping generated iCode
                                   1092 ; genReturn
      0094F3 A6 01            [ 1] 1093 	ld	a, #0x01
      0094F5 CC 95 40         [ 2] 1094 	jp	00117$
                                   1095 ; genLabel
      0094F8                       1096 00107$:
                           0003C8  1097 	C$pff.c$565$4_0$347 ==.
                                   1098 ;	../src/pff.c: 565: if (clst >= fs->n_fatent) return FR_NO_FILE;	/* Report EOT when it reached end of dynamic table */
                                   1099 ; genAssign
      0094F8 1E 05            [ 2] 1100 	ldw	x, (0x05, sp)
                                   1101 ; genPointerGet
      0094FA 90 93            [ 1] 1102 	ldw	y, x
      0094FC 90 EE 08         [ 2] 1103 	ldw	y, (0x8, y)
      0094FF 17 05            [ 2] 1104 	ldw	(0x05, sp), y
      009501 EE 06            [ 2] 1105 	ldw	x, (0x6, x)
      009503 1F 03            [ 2] 1106 	ldw	(0x03, sp), x
                                   1107 ; genCmp
                                   1108 ; genCmpTop
      009505 1E 13            [ 2] 1109 	ldw	x, (0x13, sp)
      009507 13 05            [ 2] 1110 	cpw	x, (0x05, sp)
      009509 7B 12            [ 1] 1111 	ld	a, (0x12, sp)
      00950B 12 04            [ 1] 1112 	sbc	a, (0x04, sp)
      00950D 7B 11            [ 1] 1113 	ld	a, (0x11, sp)
      00950F 12 03            [ 1] 1114 	sbc	a, (0x03, sp)
      009511 24 03            [ 1] 1115 	jrnc	00164$
      009513 CC 95 1B         [ 2] 1116 	jp	00109$
      009516                       1117 00164$:
                                   1118 ; skipping generated iCode
                                   1119 ; genReturn
      009516 A6 03            [ 1] 1120 	ld	a, #0x03
      009518 CC 95 40         [ 2] 1121 	jp	00117$
                                   1122 ; genLabel
      00951B                       1123 00109$:
                           0003EB  1124 	C$pff.c$566$4_0$347 ==.
                                   1125 ;	../src/pff.c: 566: dj->clust = clst;				/* Initialize data for new cluster */
                                   1126 ; genPointerSet
      00951B 1E 0D            [ 2] 1127 	ldw	x, (0x0d, sp)
      00951D 16 13            [ 2] 1128 	ldw	y, (0x13, sp)
      00951F EF 02            [ 2] 1129 	ldw	(0x2, x), y
      009521 16 11            [ 2] 1130 	ldw	y, (0x11, sp)
      009523 FF               [ 2] 1131 	ldw	(x), y
                           0003F4  1132 	C$pff.c$567$4_0$347 ==.
                                   1133 ;	../src/pff.c: 567: dj->sect = clust2sect(clst);
                                   1134 ; genIPush
      009524 1E 13            [ 2] 1135 	ldw	x, (0x13, sp)
      009526 89               [ 2] 1136 	pushw	x
      009527 1E 13            [ 2] 1137 	ldw	x, (0x13, sp)
      009529 89               [ 2] 1138 	pushw	x
                                   1139 ; genCall
      00952A CD 92 E1         [ 4] 1140 	call	_clust2sect
      00952D 5B 04            [ 2] 1141 	addw	sp, #4
      00952F 17 11            [ 2] 1142 	ldw	(0x11, sp), y
                                   1143 ; genPointerSet
      009531 16 0B            [ 2] 1144 	ldw	y, (0x0b, sp)
      009533 90 EF 02         [ 2] 1145 	ldw	(0x2, y), x
      009536 1E 11            [ 2] 1146 	ldw	x, (0x11, sp)
      009538 90 FF            [ 2] 1147 	ldw	(y), x
                                   1148 ; genLabel
      00953A                       1149 00116$:
                           00040A  1150 	C$pff.c$572$1_0$343 ==.
                                   1151 ;	../src/pff.c: 572: dj->index = i;
                                   1152 ; genPointerSet
      00953A 1E 07            [ 2] 1153 	ldw	x, (0x07, sp)
      00953C 16 09            [ 2] 1154 	ldw	y, (0x09, sp)
      00953E FF               [ 2] 1155 	ldw	(x), y
                           00040F  1156 	C$pff.c$574$1_0$343 ==.
                                   1157 ;	../src/pff.c: 574: return FR_OK;
                                   1158 ; genReturn
      00953F 4F               [ 1] 1159 	clr	a
                                   1160 ; genLabel
      009540                       1161 00117$:
                           000410  1162 	C$pff.c$575$1_0$343 ==.
                                   1163 ;	../src/pff.c: 575: }
                                   1164 ; genEndFunction
      009540 5B 14            [ 2] 1165 	addw	sp, #20
                           000412  1166 	C$pff.c$575$1_0$343 ==.
                           000412  1167 	XFpff$dir_next$0$0 ==.
      009542 81               [ 4] 1168 	ret
                           000413  1169 	Fpff$dir_find$0$0 ==.
                           000413  1170 	C$pff.c$584$1_0$349 ==.
                                   1171 ;	../src/pff.c: 584: static FRESULT dir_find (
                                   1172 ; genLabel
                                   1173 ;	-----------------------------------------
                                   1174 ;	 function dir_find
                                   1175 ;	-----------------------------------------
                                   1176 ;	Register assignment might be sub-optimal.
                                   1177 ;	Stack space usage: 13 bytes.
      009543                       1178 _dir_find:
      009543 52 0D            [ 2] 1179 	sub	sp, #13
                           000415  1180 	C$pff.c$593$1_0$349 ==.
                                   1181 ;	../src/pff.c: 593: res = dir_rewind(dj);			/* Rewind directory object */
                                   1182 ; genIPush
      009545 1E 10            [ 2] 1183 	ldw	x, (0x10, sp)
      009547 89               [ 2] 1184 	pushw	x
                                   1185 ; genCall
      009548 CD 93 8E         [ 4] 1186 	call	_dir_rewind
      00954B 85               [ 2] 1187 	popw	x
                                   1188 ; genAssign
                           00041C  1189 	C$pff.c$594$1_0$349 ==.
                                   1190 ;	../src/pff.c: 594: if (res != FR_OK) return res;
                                   1191 ; genIfx
      00954C 4D               [ 1] 1192 	tnz	a
      00954D 26 03            [ 1] 1193 	jrne	00147$
      00954F CC 95 55         [ 2] 1194 	jp	00122$
      009552                       1195 00147$:
                                   1196 ; genReturn
      009552 CC 95 F3         [ 2] 1197 	jp	00113$
                           000425  1198 	C$pff.c$596$1_0$349 ==.
                                   1199 ;	../src/pff.c: 596: do {
                                   1200 ; genLabel
      009555                       1201 00122$:
                                   1202 ; genAssign
      009555 16 12            [ 2] 1203 	ldw	y, (0x12, sp)
      009557 17 03            [ 2] 1204 	ldw	(0x03, sp), y
                                   1205 ; genAssign
      009559 16 10            [ 2] 1206 	ldw	y, (0x10, sp)
      00955B 17 05            [ 2] 1207 	ldw	(0x05, sp), y
                                   1208 ; genAssign
      00955D 16 05            [ 2] 1209 	ldw	y, (0x05, sp)
      00955F 17 07            [ 2] 1210 	ldw	(0x07, sp), y
                                   1211 ; genAssign
      009561 16 03            [ 2] 1212 	ldw	y, (0x03, sp)
      009563 17 09            [ 2] 1213 	ldw	(0x09, sp), y
                                   1214 ; genAssign
      009565 16 05            [ 2] 1215 	ldw	y, (0x05, sp)
      009567 17 0B            [ 2] 1216 	ldw	(0x0b, sp), y
                                   1217 ; genLabel
      009569                       1218 00110$:
                           000439  1219 	C$pff.c$597$2_0$350 ==.
                                   1220 ;	../src/pff.c: 597: res = disk_readp(dir, dj->sect, (dj->index % 16) * 32, 32)	/* Read an entry */
                                   1221 ; genPointerGet
      009569 1E 05            [ 2] 1222 	ldw	x, (0x05, sp)
      00956B FE               [ 2] 1223 	ldw	x, (x)
                                   1224 ; genCast
                                   1225 ; genAssign
      00956C 9F               [ 1] 1226 	ld	a, xl
                                   1227 ; genAnd
      00956D A4 0F            [ 1] 1228 	and	a, #0x0f
      00956F 97               [ 1] 1229 	ld	xl, a
      009570 4F               [ 1] 1230 	clr	a
      009571 95               [ 1] 1231 	ld	xh, a
                                   1232 ; genLeftShiftLiteral
      009572 58               [ 2] 1233 	sllw	x
      009573 58               [ 2] 1234 	sllw	x
      009574 58               [ 2] 1235 	sllw	x
      009575 58               [ 2] 1236 	sllw	x
      009576 58               [ 2] 1237 	sllw	x
      009577 1F 01            [ 2] 1238 	ldw	(0x01, sp), x
                                   1239 ; genPointerGet
      009579 1E 0B            [ 2] 1240 	ldw	x, (0x0b, sp)
      00957B 90 93            [ 1] 1241 	ldw	y, x
      00957D 90 EE 0E         [ 2] 1242 	ldw	y, (0xe, y)
      009580 EE 0C            [ 2] 1243 	ldw	x, (0xc, x)
                                   1244 ; genIPush
      009582 4B 20            [ 1] 1245 	push	#0x20
      009584 4B 00            [ 1] 1246 	push	#0x00
                                   1247 ; genIPush
      009586 7B 04            [ 1] 1248 	ld	a, (0x04, sp)
      009588 88               [ 1] 1249 	push	a
      009589 7B 04            [ 1] 1250 	ld	a, (0x04, sp)
      00958B 88               [ 1] 1251 	push	a
                                   1252 ; genIPush
      00958C 90 89            [ 2] 1253 	pushw	y
      00958E 89               [ 2] 1254 	pushw	x
                                   1255 ; genIPush
      00958F 1E 0B            [ 2] 1256 	ldw	x, (0x0b, sp)
      009591 89               [ 2] 1257 	pushw	x
                                   1258 ; genCall
      009592 CD 86 47         [ 4] 1259 	call	_disk_readp
      009595 5B 0A            [ 2] 1260 	addw	sp, #10
                                   1261 ; genIfx
      009597 4D               [ 1] 1262 	tnz	a
      009598 26 03            [ 1] 1263 	jrne	00148$
      00959A CC 95 A3         [ 2] 1264 	jp	00115$
      00959D                       1265 00148$:
                           00046D  1266 	C$pff.c$598$2_0$350 ==.
                                   1267 ;	../src/pff.c: 598: ? FR_DISK_ERR : FR_OK;
                                   1268 ; genAssign
      00959D A6 01            [ 1] 1269 	ld	a, #0x01
      00959F 5F               [ 1] 1270 	clrw	x
                                   1271 ; genGoto
      0095A0 CC 95 A5         [ 2] 1272 	jp	00116$
                                   1273 ; genLabel
      0095A3                       1274 00115$:
                                   1275 ; genAssign
      0095A3 4F               [ 1] 1276 	clr	a
      0095A4 5F               [ 1] 1277 	clrw	x
                                   1278 ; genLabel
      0095A5                       1279 00116$:
                                   1280 ; genCast
                                   1281 ; genAssign
      0095A5 6B 0D            [ 1] 1282 	ld	(0x0d, sp), a
                           000477  1283 	C$pff.c$599$2_0$350 ==.
                                   1284 ;	../src/pff.c: 599: if (res != FR_OK) break;
                                   1285 ; genIfx
      0095A7 0D 0D            [ 1] 1286 	tnz	(0x0d, sp)
      0095A9 27 03            [ 1] 1287 	jreq	00149$
      0095AB CC 95 F1         [ 2] 1288 	jp	00112$
      0095AE                       1289 00149$:
                           00047E  1290 	C$pff.c$600$2_0$350 ==.
                                   1291 ;	../src/pff.c: 600: c = dir[DIR_Name];	/* First character */
                                   1292 ; genPointerGet
      0095AE 1E 03            [ 2] 1293 	ldw	x, (0x03, sp)
      0095B0 F6               [ 1] 1294 	ld	a, (x)
                           000481  1295 	C$pff.c$601$2_0$350 ==.
                                   1296 ;	../src/pff.c: 601: if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
                                   1297 ; genIfx
      0095B1 4D               [ 1] 1298 	tnz	a
      0095B2 27 03            [ 1] 1299 	jreq	00150$
      0095B4 CC 95 BE         [ 2] 1300 	jp	00106$
      0095B7                       1301 00150$:
                                   1302 ; genAssign
      0095B7 A6 03            [ 1] 1303 	ld	a, #0x03
      0095B9 6B 0D            [ 1] 1304 	ld	(0x0d, sp), a
                                   1305 ; genGoto
      0095BB CC 95 F1         [ 2] 1306 	jp	00112$
                                   1307 ; genLabel
      0095BE                       1308 00106$:
                           00048E  1309 	C$pff.c$602$2_0$350 ==.
                                   1310 ;	../src/pff.c: 602: if (!(dir[DIR_Attr] & AM_VOL) && !mem_cmp(dir, dj->fn, 11)) break;	/* Is it a valid entry? */
                                   1311 ; genPointerGet
      0095BE 1E 09            [ 2] 1312 	ldw	x, (0x09, sp)
      0095C0 E6 0B            [ 1] 1313 	ld	a, (0xb, x)
                                   1314 ; genAnd
      0095C2 A5 08            [ 1] 1315 	bcp	a, #0x08
      0095C4 27 03            [ 1] 1316 	jreq	00151$
      0095C6 CC 95 E1         [ 2] 1317 	jp	00108$
      0095C9                       1318 00151$:
                                   1319 ; skipping generated iCode
                                   1320 ; genPointerGet
      0095C9 1E 07            [ 2] 1321 	ldw	x, (0x07, sp)
      0095CB EE 02            [ 2] 1322 	ldw	x, (0x2, x)
                                   1323 ; genCast
                                   1324 ; genAssign
                                   1325 ; genCast
                                   1326 ; genAssign
      0095CD 16 12            [ 2] 1327 	ldw	y, (0x12, sp)
                                   1328 ; genIPush
      0095CF 4B 0B            [ 1] 1329 	push	#0x0b
      0095D1 4B 00            [ 1] 1330 	push	#0x00
                                   1331 ; genIPush
      0095D3 89               [ 2] 1332 	pushw	x
                                   1333 ; genIPush
      0095D4 90 89            [ 2] 1334 	pushw	y
                                   1335 ; genCall
      0095D6 CD 91 DF         [ 4] 1336 	call	_mem_cmp
      0095D9 5B 06            [ 2] 1337 	addw	sp, #6
                                   1338 ; genIfx
      0095DB 5D               [ 2] 1339 	tnzw	x
      0095DC 26 03            [ 1] 1340 	jrne	00152$
      0095DE CC 95 F1         [ 2] 1341 	jp	00112$
      0095E1                       1342 00152$:
                                   1343 ; genLabel
      0095E1                       1344 00108$:
                           0004B1  1345 	C$pff.c$603$2_0$350 ==.
                                   1346 ;	../src/pff.c: 603: res = dir_next(dj);					/* Next entry */
                                   1347 ; genIPush
      0095E1 1E 05            [ 2] 1348 	ldw	x, (0x05, sp)
      0095E3 89               [ 2] 1349 	pushw	x
                                   1350 ; genCall
      0095E4 CD 94 1E         [ 4] 1351 	call	_dir_next
      0095E7 85               [ 2] 1352 	popw	x
                                   1353 ; genAssign
      0095E8 6B 0D            [ 1] 1354 	ld	(0x0d, sp), a
                           0004BA  1355 	C$pff.c$604$1_0$349 ==.
                                   1356 ;	../src/pff.c: 604: } while (res == FR_OK);
                                   1357 ; genIfx
      0095EA 0D 0D            [ 1] 1358 	tnz	(0x0d, sp)
      0095EC 26 03            [ 1] 1359 	jrne	00153$
      0095EE CC 95 69         [ 2] 1360 	jp	00110$
      0095F1                       1361 00153$:
                                   1362 ; genLabel
      0095F1                       1363 00112$:
                           0004C1  1364 	C$pff.c$606$1_0$349 ==.
                                   1365 ;	../src/pff.c: 606: return res;
                                   1366 ; genReturn
      0095F1 7B 0D            [ 1] 1367 	ld	a, (0x0d, sp)
                                   1368 ; genLabel
      0095F3                       1369 00113$:
                           0004C3  1370 	C$pff.c$607$1_0$349 ==.
                                   1371 ;	../src/pff.c: 607: }
                                   1372 ; genEndFunction
      0095F3 5B 0D            [ 2] 1373 	addw	sp, #13
                           0004C5  1374 	C$pff.c$607$1_0$349 ==.
                           0004C5  1375 	XFpff$dir_find$0$0 ==.
      0095F5 81               [ 4] 1376 	ret
                           0004C6  1377 	Fpff$create_name$0$0 ==.
                           0004C6  1378 	C$pff.c$651$1_0$353 ==.
                                   1379 ;	../src/pff.c: 651: static FRESULT create_name (
                                   1380 ; genLabel
                                   1381 ;	-----------------------------------------
                                   1382 ;	 function create_name
                                   1383 ;	-----------------------------------------
                                   1384 ;	Register assignment might be sub-optimal.
                                   1385 ;	Stack space usage: 9 bytes.
      0095F6                       1386 _create_name:
      0095F6 52 09            [ 2] 1387 	sub	sp, #9
                           0004C8  1388 	C$pff.c$663$1_0$353 ==.
                                   1389 ;	../src/pff.c: 663: sfn = dj->fn;
                                   1390 ; genAssign
      0095F8 1E 0C            [ 2] 1391 	ldw	x, (0x0c, sp)
                                   1392 ; genAssign
                                   1393 ; genPointerGet
      0095FA EE 02            [ 2] 1394 	ldw	x, (0x2, x)
                                   1395 ; genAssign
      0095FC 1F 01            [ 2] 1396 	ldw	(0x01, sp), x
                           0004CE  1397 	C$pff.c$664$1_0$353 ==.
                                   1398 ;	../src/pff.c: 664: mem_set(sfn, ' ', 11);
                                   1399 ; genCast
                                   1400 ; genAssign
      0095FE 1E 01            [ 2] 1401 	ldw	x, (0x01, sp)
                                   1402 ; genIPush
      009600 4B 0B            [ 1] 1403 	push	#0x0b
      009602 4B 00            [ 1] 1404 	push	#0x00
                                   1405 ; genIPush
      009604 4B 20            [ 1] 1406 	push	#0x20
      009606 4B 00            [ 1] 1407 	push	#0x00
                                   1408 ; genIPush
      009608 89               [ 2] 1409 	pushw	x
                                   1410 ; genCall
      009609 CD 91 C0         [ 4] 1411 	call	_mem_set
      00960C 5B 06            [ 2] 1412 	addw	sp, #6
                           0004DE  1413 	C$pff.c$665$1_0$353 ==.
                                   1414 ;	../src/pff.c: 665: si = i = 0; ni = 8;
                                   1415 ; genAssign
      00960E 0F 08            [ 1] 1416 	clr	(0x08, sp)
                                   1417 ; genAssign
      009610 0F 09            [ 1] 1418 	clr	(0x09, sp)
                                   1419 ; genAssign
      009612 A6 08            [ 1] 1420 	ld	a, #0x08
      009614 6B 03            [ 1] 1421 	ld	(0x03, sp), a
                           0004E6  1422 	C$pff.c$666$1_0$353 ==.
                                   1423 ;	../src/pff.c: 666: p = *path;
                                   1424 ; genAssign
      009616 16 0E            [ 2] 1425 	ldw	y, (0x0e, sp)
                                   1426 ; genPointerGet
      009618 93               [ 1] 1427 	ldw	x, y
      009619 FE               [ 2] 1428 	ldw	x, (x)
                                   1429 ; genAssign
      00961A 1F 04            [ 2] 1430 	ldw	(0x04, sp), x
                                   1431 ; genLabel
      00961C                       1432 00120$:
                           0004EC  1433 	C$pff.c$668$3_0$355 ==.
                                   1434 ;	../src/pff.c: 668: c = p[si++];
                                   1435 ; genPlus
      00961C 5F               [ 1] 1436 	clrw	x
      00961D 7B 09            [ 1] 1437 	ld	a, (0x09, sp)
      00961F 97               [ 1] 1438 	ld	xl, a
      009620 72 FB 04         [ 2] 1439 	addw	x, (0x04, sp)
                                   1440 ; genPlus
      009623 0C 09            [ 1] 1441 	inc	(0x09, sp)
                                   1442 ; genPointerGet
      009625 F6               [ 1] 1443 	ld	a, (x)
      009626 6B 06            [ 1] 1444 	ld	(0x06, sp), a
                           0004F8  1445 	C$pff.c$669$1_0$353 ==.
                                   1446 ;	../src/pff.c: 669: if (c <= ' ' || c == '/') break;	/* Break on end of segment */
                                   1447 ; genCmp
                                   1448 ; genCmpTop
      009628 7B 06            [ 1] 1449 	ld	a, (0x06, sp)
      00962A A1 20            [ 1] 1450 	cp	a, #0x20
      00962C 22 05            [ 1] 1451 	jrugt	00161$
      00962E 0F 07            [ 1] 1452 	clr	(0x07, sp)
      009630 CC 96 37         [ 2] 1453 	jp	00162$
      009633                       1454 00161$:
      009633 A6 01            [ 1] 1455 	ld	a, #0x01
      009635 6B 07            [ 1] 1456 	ld	(0x07, sp), a
      009637                       1457 00162$:
                                   1458 ; genIfx
      009637 0D 07            [ 1] 1459 	tnz	(0x07, sp)
      009639 26 03            [ 1] 1460 	jrne	00163$
      00963B CC 96 92         [ 2] 1461 	jp	00132$
      00963E                       1462 00163$:
                                   1463 ; genCmpEQorNE
      00963E 7B 06            [ 1] 1464 	ld	a, (0x06, sp)
      009640 A1 2F            [ 1] 1465 	cp	a, #0x2f
      009642 26 03            [ 1] 1466 	jrne	00165$
      009644 CC 96 92         [ 2] 1467 	jp	00132$
      009647                       1468 00165$:
                                   1469 ; skipping generated iCode
                           000517  1470 	C$pff.c$670$1_0$353 ==.
                                   1471 ;	../src/pff.c: 670: if (c == '.' || i >= ni) {
                                   1472 ; genCmpEQorNE
      009647 7B 06            [ 1] 1473 	ld	a, (0x06, sp)
      009649 A1 2E            [ 1] 1474 	cp	a, #0x2e
      00964B 26 05            [ 1] 1475 	jrne	00168$
      00964D A6 01            [ 1] 1476 	ld	a, #0x01
      00964F CC 96 53         [ 2] 1477 	jp	00169$
      009652                       1478 00168$:
      009652 4F               [ 1] 1479 	clr	a
      009653                       1480 00169$:
                                   1481 ; genIfx
      009653 4D               [ 1] 1482 	tnz	a
      009654 27 03            [ 1] 1483 	jreq	00170$
      009656 CC 96 64         [ 2] 1484 	jp	00107$
      009659                       1485 00170$:
                                   1486 ; genCmp
                                   1487 ; genCmpTop
      009659 88               [ 1] 1488 	push	a
      00965A 7B 09            [ 1] 1489 	ld	a, (0x09, sp)
      00965C 11 04            [ 1] 1490 	cp	a, (0x04, sp)
      00965E 84               [ 1] 1491 	pop	a
      00965F 24 03            [ 1] 1492 	jrnc	00171$
      009661 CC 96 83         [ 2] 1493 	jp	00111$
      009664                       1494 00171$:
                                   1495 ; skipping generated iCode
                                   1496 ; genLabel
      009664                       1497 00107$:
                           000534  1498 	C$pff.c$671$4_0$356 ==.
                                   1499 ;	../src/pff.c: 671: if (ni != 8 || c != '.') break;
                                   1500 ; genCmpEQorNE
      009664 88               [ 1] 1501 	push	a
      009665 7B 04            [ 1] 1502 	ld	a, (0x04, sp)
      009667 A1 08            [ 1] 1503 	cp	a, #0x08
      009669 84               [ 1] 1504 	pop	a
      00966A 26 03            [ 1] 1505 	jrne	00173$
      00966C CC 96 72         [ 2] 1506 	jp	00174$
      00966F                       1507 00173$:
      00966F CC 96 92         [ 2] 1508 	jp	00132$
      009672                       1509 00174$:
                                   1510 ; skipping generated iCode
                                   1511 ; genAssign
                                   1512 ; genIfx
      009672 4D               [ 1] 1513 	tnz	a
      009673 26 03            [ 1] 1514 	jrne	00175$
      009675 CC 96 92         [ 2] 1515 	jp	00132$
      009678                       1516 00175$:
                           000548  1517 	C$pff.c$672$4_0$356 ==.
                                   1518 ;	../src/pff.c: 672: i = 8; ni = 11;
                                   1519 ; genAssign
      009678 A6 08            [ 1] 1520 	ld	a, #0x08
      00967A 6B 08            [ 1] 1521 	ld	(0x08, sp), a
                                   1522 ; genAssign
      00967C A6 0B            [ 1] 1523 	ld	a, #0x0b
      00967E 6B 03            [ 1] 1524 	ld	(0x03, sp), a
                           000550  1525 	C$pff.c$673$4_0$356 ==.
                                   1526 ;	../src/pff.c: 673: continue;
                                   1527 ; genGoto
      009680 CC 96 1C         [ 2] 1528 	jp	00120$
                           000553  1529 	C$pff.c$683$4_0$358 ==.
                                   1530 ;	../src/pff.c: 683: if (PF_USE_LCC && IsLower(c)) c -= 0x20;	/* toupper */
                                   1531 ; genLabel
      009683                       1532 00111$:
                           000553  1533 	C$pff.c$684$4_0$358 ==.
                                   1534 ;	../src/pff.c: 684: sfn[i++] = c;
                                   1535 ; genAssign
      009683 7B 08            [ 1] 1536 	ld	a, (0x08, sp)
                                   1537 ; genPlus
      009685 0C 08            [ 1] 1538 	inc	(0x08, sp)
                                   1539 ; genPlus
      009687 5F               [ 1] 1540 	clrw	x
      009688 97               [ 1] 1541 	ld	xl, a
      009689 72 FB 01         [ 2] 1542 	addw	x, (0x01, sp)
                                   1543 ; genPointerSet
      00968C 7B 06            [ 1] 1544 	ld	a, (0x06, sp)
      00968E F7               [ 1] 1545 	ld	(x), a
                                   1546 ; genGoto
      00968F CC 96 1C         [ 2] 1547 	jp	00120$
                                   1548 ; genLabel
      009692                       1549 00132$:
                                   1550 ; genAssign
      009692 7B 09            [ 1] 1551 	ld	a, (0x09, sp)
                           000564  1552 	C$pff.c$687$1_0$353 ==.
                                   1553 ;	../src/pff.c: 687: *path = &p[si];						/* Rerurn pointer to the next segment */
                                   1554 ; genPlus
      009694 5F               [ 1] 1555 	clrw	x
      009695 97               [ 1] 1556 	ld	xl, a
      009696 72 FB 04         [ 2] 1557 	addw	x, (0x04, sp)
                                   1558 ; genPointerSet
      009699 90 FF            [ 2] 1559 	ldw	(y), x
                           00056B  1560 	C$pff.c$689$1_0$353 ==.
                                   1561 ;	../src/pff.c: 689: sfn[11] = (c <= ' ') ? 1 : 0;		/* Set last segment flag if end of path */
                                   1562 ; genPlus
      00969B 16 01            [ 2] 1563 	ldw	y, (0x01, sp)
      00969D 72 A9 00 0B      [ 2] 1564 	addw	y, #0x000b
                                   1565 ; genIfx
      0096A1 0D 07            [ 1] 1566 	tnz	(0x07, sp)
      0096A3 27 03            [ 1] 1567 	jreq	00176$
      0096A5 CC 96 AD         [ 2] 1568 	jp	00123$
      0096A8                       1569 00176$:
                                   1570 ; genAssign
      0096A8 5F               [ 1] 1571 	clrw	x
      0096A9 5C               [ 1] 1572 	incw	x
                                   1573 ; genGoto
      0096AA CC 96 AE         [ 2] 1574 	jp	00124$
                                   1575 ; genLabel
      0096AD                       1576 00123$:
                                   1577 ; genAssign
      0096AD 5F               [ 1] 1578 	clrw	x
                                   1579 ; genLabel
      0096AE                       1580 00124$:
                                   1581 ; genCast
                                   1582 ; genAssign
      0096AE 9F               [ 1] 1583 	ld	a, xl
                                   1584 ; genPointerSet
      0096AF 90 F7            [ 1] 1585 	ld	(y), a
                           000581  1586 	C$pff.c$691$1_0$353 ==.
                                   1587 ;	../src/pff.c: 691: return FR_OK;
                                   1588 ; genReturn
      0096B1 4F               [ 1] 1589 	clr	a
                                   1590 ; genLabel
      0096B2                       1591 00121$:
                           000582  1592 	C$pff.c$692$1_0$353 ==.
                                   1593 ;	../src/pff.c: 692: }
                                   1594 ; genEndFunction
      0096B2 5B 09            [ 2] 1595 	addw	sp, #9
                           000584  1596 	C$pff.c$692$1_0$353 ==.
                           000584  1597 	XFpff$create_name$0$0 ==.
      0096B4 81               [ 4] 1598 	ret
                           000585  1599 	Fpff$follow_path$0$0 ==.
                           000585  1600 	C$pff.c$742$1_0$360 ==.
                                   1601 ;	../src/pff.c: 742: static FRESULT follow_path (	/* FR_OK(0): successful, !=0: error code */
                                   1602 ; genLabel
                                   1603 ;	-----------------------------------------
                                   1604 ;	 function follow_path
                                   1605 ;	-----------------------------------------
                                   1606 ;	Register assignment might be sub-optimal.
                                   1607 ;	Stack space usage: 12 bytes.
      0096B5                       1608 _follow_path:
      0096B5 52 0C            [ 2] 1609 	sub	sp, #12
                           000587  1610 	C$pff.c$751$1_0$360 ==.
                                   1611 ;	../src/pff.c: 751: while (*path == ' ') path++;		/* Strip leading spaces */
                                   1612 ; genAssign
      0096B7 1E 13            [ 2] 1613 	ldw	x, (0x13, sp)
                                   1614 ; genLabel
      0096B9                       1615 00101$:
                                   1616 ; genPointerGet
      0096B9 F6               [ 1] 1617 	ld	a, (x)
                                   1618 ; genCmpEQorNE
      0096BA A1 20            [ 1] 1619 	cp	a, #0x20
      0096BC 26 03            [ 1] 1620 	jrne	00169$
      0096BE CC 96 C4         [ 2] 1621 	jp	00170$
      0096C1                       1622 00169$:
      0096C1 CC 96 CA         [ 2] 1623 	jp	00131$
      0096C4                       1624 00170$:
                                   1625 ; skipping generated iCode
                                   1626 ; genPlus
      0096C4 5C               [ 1] 1627 	incw	x
                                   1628 ; genAssign
      0096C5 1F 13            [ 2] 1629 	ldw	(0x13, sp), x
                                   1630 ; genGoto
      0096C7 CC 96 B9         [ 2] 1631 	jp	00101$
                                   1632 ; genLabel
      0096CA                       1633 00131$:
                                   1634 ; genAssign
      0096CA 1F 13            [ 2] 1635 	ldw	(0x13, sp), x
                           00059C  1636 	C$pff.c$752$1_0$360 ==.
                                   1637 ;	../src/pff.c: 752: if (*path == '/') path++;			/* Strip heading separator if exist */
                                   1638 ; genAssign
      0096CC 1E 13            [ 2] 1639 	ldw	x, (0x13, sp)
                                   1640 ; genPointerGet
      0096CE F6               [ 1] 1641 	ld	a, (x)
                                   1642 ; genCmpEQorNE
      0096CF A1 2F            [ 1] 1643 	cp	a, #0x2f
      0096D1 26 03            [ 1] 1644 	jrne	00172$
      0096D3 CC 96 D9         [ 2] 1645 	jp	00173$
      0096D6                       1646 00172$:
      0096D6 CC 96 DE         [ 2] 1647 	jp	00105$
      0096D9                       1648 00173$:
                                   1649 ; skipping generated iCode
                                   1650 ; genPlus
      0096D9 1E 13            [ 2] 1651 	ldw	x, (0x13, sp)
      0096DB 5C               [ 1] 1652 	incw	x
                                   1653 ; genAssign
      0096DC 1F 13            [ 2] 1654 	ldw	(0x13, sp), x
                                   1655 ; genLabel
      0096DE                       1656 00105$:
                           0005AE  1657 	C$pff.c$753$1_0$360 ==.
                                   1658 ;	../src/pff.c: 753: dj->sclust = 0;						/* Set start directory (always root dir) */
                                   1659 ; genAssign
      0096DE 16 0F            [ 2] 1660 	ldw	y, (0x0f, sp)
      0096E0 17 0B            [ 2] 1661 	ldw	(0x0b, sp), y
                                   1662 ; genPlus
      0096E2 1E 0B            [ 2] 1663 	ldw	x, (0x0b, sp)
      0096E4 1C 00 04         [ 2] 1664 	addw	x, #0x0004
                                   1665 ; genPointerSet
      0096E7 90 5F            [ 1] 1666 	clrw	y
      0096E9 EF 02            [ 2] 1667 	ldw	(0x2, x), y
      0096EB FF               [ 2] 1668 	ldw	(x), y
                           0005BC  1669 	C$pff.c$755$1_0$360 ==.
                                   1670 ;	../src/pff.c: 755: if ((BYTE)*path < ' ') {			/* Null path means the root directory */
                                   1671 ; genAssign
      0096EC 1E 13            [ 2] 1672 	ldw	x, (0x13, sp)
                                   1673 ; genPointerGet
      0096EE F6               [ 1] 1674 	ld	a, (x)
                                   1675 ; genCmp
                                   1676 ; genCmpTop
      0096EF A1 20            [ 1] 1677 	cp	a, #0x20
      0096F1 25 03            [ 1] 1678 	jrc	00174$
      0096F3 CC 97 05         [ 2] 1679 	jp	00130$
      0096F6                       1680 00174$:
                                   1681 ; skipping generated iCode
                           0005C6  1682 	C$pff.c$756$2_0$361 ==.
                                   1683 ;	../src/pff.c: 756: res = dir_rewind(dj);
                                   1684 ; genIPush
      0096F6 1E 0F            [ 2] 1685 	ldw	x, (0x0f, sp)
      0096F8 89               [ 2] 1686 	pushw	x
                                   1687 ; genCall
      0096F9 CD 93 8E         [ 4] 1688 	call	_dir_rewind
      0096FC 85               [ 2] 1689 	popw	x
                                   1690 ; genAssign
      0096FD 6B 0C            [ 1] 1691 	ld	(0x0c, sp), a
                           0005CF  1692 	C$pff.c$757$2_0$361 ==.
                                   1693 ;	../src/pff.c: 757: dir[0] = 0;
                                   1694 ; genAssign
      0096FF 1E 11            [ 2] 1695 	ldw	x, (0x11, sp)
                                   1696 ; genPointerSet
      009701 7F               [ 1] 1697 	clr	(x)
                                   1698 ; genGoto
      009702 CC 97 76         [ 2] 1699 	jp	00117$
                                   1700 ; genLabel
      009705                       1701 00130$:
                                   1702 ; genAssign
      009705 16 0B            [ 2] 1703 	ldw	y, (0x0b, sp)
      009707 17 01            [ 2] 1704 	ldw	(0x01, sp), y
                                   1705 ; genAssign
      009709 16 0B            [ 2] 1706 	ldw	y, (0x0b, sp)
      00970B 17 03            [ 2] 1707 	ldw	(0x03, sp), y
                                   1708 ; genAssign
      00970D 16 11            [ 2] 1709 	ldw	y, (0x11, sp)
      00970F 17 05            [ 2] 1710 	ldw	(0x05, sp), y
                                   1711 ; genLabel
      009711                       1712 00118$:
                           0005E1  1713 	C$pff.c$761$4_0$364 ==.
                                   1714 ;	../src/pff.c: 761: res = create_name(dj, &path);	/* Get a segment */
                                   1715 ; skipping iCode since result will be rematerialized
                                   1716 ; skipping iCode since result will be rematerialized
                                   1717 ; genIPush
      009711 96               [ 1] 1718 	ldw	x, sp
      009712 1C 00 13         [ 2] 1719 	addw	x, #19
      009715 89               [ 2] 1720 	pushw	x
                                   1721 ; genIPush
      009716 1E 03            [ 2] 1722 	ldw	x, (0x03, sp)
      009718 89               [ 2] 1723 	pushw	x
                                   1724 ; genCall
      009719 CD 95 F6         [ 4] 1725 	call	_create_name
      00971C 5B 04            [ 2] 1726 	addw	sp, #4
                                   1727 ; genAssign
      00971E 6B 0C            [ 1] 1728 	ld	(0x0c, sp), a
                           0005F0  1729 	C$pff.c$762$4_0$364 ==.
                                   1730 ;	../src/pff.c: 762: if (res != FR_OK) break;
                                   1731 ; genIfx
      009720 0D 0C            [ 1] 1732 	tnz	(0x0c, sp)
      009722 27 03            [ 1] 1733 	jreq	00175$
      009724 CC 97 76         [ 2] 1734 	jp	00117$
      009727                       1735 00175$:
                           0005F7  1736 	C$pff.c$763$4_0$364 ==.
                                   1737 ;	../src/pff.c: 763: res = dir_find(dj, dir);		/* Find it */
                                   1738 ; genIPush
      009727 1E 11            [ 2] 1739 	ldw	x, (0x11, sp)
      009729 89               [ 2] 1740 	pushw	x
                                   1741 ; genIPush
      00972A 1E 03            [ 2] 1742 	ldw	x, (0x03, sp)
      00972C 89               [ 2] 1743 	pushw	x
                                   1744 ; genCall
      00972D CD 95 43         [ 4] 1745 	call	_dir_find
      009730 5B 04            [ 2] 1746 	addw	sp, #4
                                   1747 ; genAssign
      009732 6B 0C            [ 1] 1748 	ld	(0x0c, sp), a
                           000604  1749 	C$pff.c$764$4_0$364 ==.
                                   1750 ;	../src/pff.c: 764: if (res != FR_OK) break;		/* Could not find the object */
                                   1751 ; genIfx
      009734 0D 0C            [ 1] 1752 	tnz	(0x0c, sp)
      009736 27 03            [ 1] 1753 	jreq	00176$
      009738 CC 97 76         [ 2] 1754 	jp	00117$
      00973B                       1755 00176$:
                           00060B  1756 	C$pff.c$765$4_0$364 ==.
                                   1757 ;	../src/pff.c: 765: if (dj->fn[11]) break;			/* Last segment match. Function completed. */
                                   1758 ; genPointerGet
      00973B 1E 03            [ 2] 1759 	ldw	x, (0x03, sp)
      00973D EE 02            [ 2] 1760 	ldw	x, (0x2, x)
                                   1761 ; genAssign
                                   1762 ; genPointerGet
      00973F E6 0B            [ 1] 1763 	ld	a, (0xb, x)
                                   1764 ; genIfx
      009741 4D               [ 1] 1765 	tnz	a
      009742 27 03            [ 1] 1766 	jreq	00177$
      009744 CC 97 76         [ 2] 1767 	jp	00117$
      009747                       1768 00177$:
                           000617  1769 	C$pff.c$766$4_0$364 ==.
                                   1770 ;	../src/pff.c: 766: if (!(dir[DIR_Attr] & AM_DIR)) { /* Cannot follow path because it is a file */
                                   1771 ; genPointerGet
      009747 1E 05            [ 2] 1772 	ldw	x, (0x05, sp)
      009749 E6 0B            [ 1] 1773 	ld	a, (0xb, x)
                                   1774 ; genAnd
      00974B A5 10            [ 1] 1775 	bcp	a, #0x10
      00974D 27 03            [ 1] 1776 	jreq	00178$
      00974F CC 97 59         [ 2] 1777 	jp	00113$
      009752                       1778 00178$:
                                   1779 ; skipping generated iCode
                           000622  1780 	C$pff.c$767$5_0$365 ==.
                                   1781 ;	../src/pff.c: 767: res = FR_NO_FILE; break;
                                   1782 ; genAssign
      009752 A6 03            [ 1] 1783 	ld	a, #0x03
      009754 6B 0C            [ 1] 1784 	ld	(0x0c, sp), a
                                   1785 ; genGoto
      009756 CC 97 76         [ 2] 1786 	jp	00117$
                                   1787 ; genLabel
      009759                       1788 00113$:
                           000629  1789 	C$pff.c$769$4_0$364 ==.
                                   1790 ;	../src/pff.c: 769: dj->sclust = get_clust(dir);	/* Follow next */
                                   1791 ; genPlus
      009759 1E 01            [ 2] 1792 	ldw	x, (0x01, sp)
      00975B 1C 00 04         [ 2] 1793 	addw	x, #0x0004
      00975E 1F 07            [ 2] 1794 	ldw	(0x07, sp), x
                                   1795 ; genIPush
      009760 1E 11            [ 2] 1796 	ldw	x, (0x11, sp)
      009762 89               [ 2] 1797 	pushw	x
                                   1798 ; genCall
      009763 CD 93 57         [ 4] 1799 	call	_get_clust
      009766 5B 02            [ 2] 1800 	addw	sp, #2
      009768 17 09            [ 2] 1801 	ldw	(0x09, sp), y
                                   1802 ; genPointerSet
      00976A 16 07            [ 2] 1803 	ldw	y, (0x07, sp)
      00976C 90 EF 02         [ 2] 1804 	ldw	(0x2, y), x
      00976F 1E 09            [ 2] 1805 	ldw	x, (0x09, sp)
      009771 90 FF            [ 2] 1806 	ldw	(y), x
                                   1807 ; genGoto
      009773 CC 97 11         [ 2] 1808 	jp	00118$
                                   1809 ; genLabel
      009776                       1810 00117$:
                           000646  1811 	C$pff.c$773$1_0$360 ==.
                                   1812 ;	../src/pff.c: 773: return res;
                                   1813 ; genReturn
      009776 7B 0C            [ 1] 1814 	ld	a, (0x0c, sp)
                                   1815 ; genLabel
      009778                       1816 00120$:
                           000648  1817 	C$pff.c$774$1_0$360 ==.
                                   1818 ;	../src/pff.c: 774: }
                                   1819 ; genEndFunction
      009778 5B 0C            [ 2] 1820 	addw	sp, #12
                           00064A  1821 	C$pff.c$774$1_0$360 ==.
                           00064A  1822 	XFpff$follow_path$0$0 ==.
      00977A 81               [ 4] 1823 	ret
                           00064B  1824 	Fpff$check_fs$0$0 ==.
                           00064B  1825 	C$pff.c$783$1_0$367 ==.
                                   1826 ;	../src/pff.c: 783: static BYTE check_fs (	/* 0:The FAT boot record, 1:Valid boot record but not an FAT, 2:Not a boot record, 3:Error */
                                   1827 ; genLabel
                                   1828 ;	-----------------------------------------
                                   1829 ;	 function check_fs
                                   1830 ;	-----------------------------------------
                                   1831 ;	Register assignment might be sub-optimal.
                                   1832 ;	Stack space usage: 0 bytes.
      00977B                       1833 _check_fs:
                           00064B  1834 	C$pff.c$788$1_0$367 ==.
                                   1835 ;	../src/pff.c: 788: if (disk_readp(buf, sect, 510, 2)) {	/* Read the boot record */
                                   1836 ; genIPush
      00977B 4B 02            [ 1] 1837 	push	#0x02
      00977D 4B 00            [ 1] 1838 	push	#0x00
                                   1839 ; genIPush
      00977F 4B FE            [ 1] 1840 	push	#0xfe
      009781 4B 01            [ 1] 1841 	push	#0x01
                                   1842 ; genIPush
      009783 1E 0B            [ 2] 1843 	ldw	x, (0x0b, sp)
      009785 89               [ 2] 1844 	pushw	x
      009786 1E 0B            [ 2] 1845 	ldw	x, (0x0b, sp)
      009788 89               [ 2] 1846 	pushw	x
                                   1847 ; genIPush
      009789 1E 0B            [ 2] 1848 	ldw	x, (0x0b, sp)
      00978B 89               [ 2] 1849 	pushw	x
                                   1850 ; genCall
      00978C CD 86 47         [ 4] 1851 	call	_disk_readp
      00978F 5B 0A            [ 2] 1852 	addw	sp, #10
                                   1853 ; genIfx
      009791 4D               [ 1] 1854 	tnz	a
      009792 26 03            [ 1] 1855 	jrne	00135$
      009794 CC 97 9C         [ 2] 1856 	jp	00102$
      009797                       1857 00135$:
                           000667  1858 	C$pff.c$789$2_0$368 ==.
                                   1859 ;	../src/pff.c: 789: return 3;
                                   1860 ; genReturn
      009797 A6 03            [ 1] 1861 	ld	a, #0x03
      009799 CC 97 E6         [ 2] 1862 	jp	00113$
                                   1863 ; genLabel
      00979C                       1864 00102$:
                           00066C  1865 	C$pff.c$791$1_0$367 ==.
                                   1866 ;	../src/pff.c: 791: if (ld_word(buf) != 0xAA55) {			/* Check record signature */
                                   1867 ; genIPush
      00979C 1E 03            [ 2] 1868 	ldw	x, (0x03, sp)
      00979E 89               [ 2] 1869 	pushw	x
                                   1870 ; genCall
      00979F CD 91 30         [ 4] 1871 	call	_ld_word
      0097A2 5B 02            [ 2] 1872 	addw	sp, #2
                                   1873 ; genCast
                                   1874 ; genAssign
                                   1875 ; genCmpEQorNE
      0097A4 A3 AA 55         [ 2] 1876 	cpw	x, #0xaa55
      0097A7 26 03            [ 1] 1877 	jrne	00137$
      0097A9 CC 97 B1         [ 2] 1878 	jp	00111$
      0097AC                       1879 00137$:
                                   1880 ; skipping generated iCode
                           00067C  1881 	C$pff.c$792$2_0$369 ==.
                                   1882 ;	../src/pff.c: 792: return 2;
                                   1883 ; genReturn
      0097AC A6 02            [ 1] 1884 	ld	a, #0x02
      0097AE CC 97 E6         [ 2] 1885 	jp	00113$
                           000681  1886 	C$pff.c$798$1_0$367 ==.
                                   1887 ;	../src/pff.c: 798: if (PF_FS_FAT32 && !disk_readp(buf, sect, BS_FilSysType32, 2) && ld_word(buf) == 0x4146) {	/* Check FAT32 */
                                   1888 ; genLabel
      0097B1                       1889 00111$:
                                   1890 ; genIPush
      0097B1 4B 02            [ 1] 1891 	push	#0x02
      0097B3 4B 00            [ 1] 1892 	push	#0x00
                                   1893 ; genIPush
      0097B5 4B 52            [ 1] 1894 	push	#0x52
      0097B7 4B 00            [ 1] 1895 	push	#0x00
                                   1896 ; genIPush
      0097B9 1E 0B            [ 2] 1897 	ldw	x, (0x0b, sp)
      0097BB 89               [ 2] 1898 	pushw	x
      0097BC 1E 0B            [ 2] 1899 	ldw	x, (0x0b, sp)
      0097BE 89               [ 2] 1900 	pushw	x
                                   1901 ; genIPush
      0097BF 1E 0B            [ 2] 1902 	ldw	x, (0x0b, sp)
      0097C1 89               [ 2] 1903 	pushw	x
                                   1904 ; genCall
      0097C2 CD 86 47         [ 4] 1905 	call	_disk_readp
      0097C5 5B 0A            [ 2] 1906 	addw	sp, #10
                                   1907 ; genIfx
      0097C7 4D               [ 1] 1908 	tnz	a
      0097C8 27 03            [ 1] 1909 	jreq	00139$
      0097CA CC 97 E4         [ 2] 1910 	jp	00110$
      0097CD                       1911 00139$:
                                   1912 ; genIPush
      0097CD 1E 03            [ 2] 1913 	ldw	x, (0x03, sp)
      0097CF 89               [ 2] 1914 	pushw	x
                                   1915 ; genCall
      0097D0 CD 91 30         [ 4] 1916 	call	_ld_word
      0097D3 5B 02            [ 2] 1917 	addw	sp, #2
                                   1918 ; genCast
                                   1919 ; genAssign
                                   1920 ; genCmpEQorNE
      0097D5 A3 41 46         [ 2] 1921 	cpw	x, #0x4146
      0097D8 26 03            [ 1] 1922 	jrne	00141$
      0097DA CC 97 E0         [ 2] 1923 	jp	00142$
      0097DD                       1924 00141$:
      0097DD CC 97 E4         [ 2] 1925 	jp	00110$
      0097E0                       1926 00142$:
                                   1927 ; skipping generated iCode
                           0006B0  1928 	C$pff.c$799$2_0$371 ==.
                                   1929 ;	../src/pff.c: 799: return 0;
                                   1930 ; genReturn
      0097E0 4F               [ 1] 1931 	clr	a
      0097E1 CC 97 E6         [ 2] 1932 	jp	00113$
                                   1933 ; genLabel
      0097E4                       1934 00110$:
                           0006B4  1935 	C$pff.c$801$1_0$367 ==.
                                   1936 ;	../src/pff.c: 801: return 1;
                                   1937 ; genReturn
      0097E4 A6 01            [ 1] 1938 	ld	a, #0x01
                                   1939 ; genLabel
      0097E6                       1940 00113$:
                           0006B6  1941 	C$pff.c$802$1_0$367 ==.
                                   1942 ;	../src/pff.c: 802: }
                                   1943 ; genEndFunction
                           0006B6  1944 	C$pff.c$802$1_0$367 ==.
                           0006B6  1945 	XFpff$check_fs$0$0 ==.
      0097E6 81               [ 4] 1946 	ret
                           0006B7  1947 	G$pf_mount$0$0 ==.
                           0006B7  1948 	C$pff.c$819$1_0$373 ==.
                                   1949 ;	../src/pff.c: 819: FRESULT pf_mount (
                                   1950 ; genLabel
                                   1951 ;	-----------------------------------------
                                   1952 ;	 function pf_mount
                                   1953 ;	-----------------------------------------
                                   1954 ;	Register assignment might be sub-optimal.
                                   1955 ;	Stack space usage: 60 bytes.
      0097E7                       1956 _pf_mount:
      0097E7 52 3C            [ 2] 1957 	sub	sp, #60
                           0006B9  1958 	C$pff.c$827$1_0$373 ==.
                                   1959 ;	../src/pff.c: 827: FatFs = 0;
                                   1960 ; genAssign
      0097E9 5F               [ 1] 1961 	clrw	x
      0097EA CF 02 61         [ 2] 1962 	ldw	_FatFs+0, x
                           0006BD  1963 	C$pff.c$829$1_0$373 ==.
                                   1964 ;	../src/pff.c: 829: if (disk_initialize() & STA_NOINIT) {	/* Check if the drive is ready or not */
                                   1965 ; genCall
      0097ED CD 86 26         [ 4] 1966 	call	_disk_initialize
                                   1967 ; genAnd
      0097F0 44               [ 1] 1968 	srl	a
      0097F1 25 03            [ 1] 1969 	jrc	00194$
      0097F3 CC 97 FB         [ 2] 1970 	jp	00102$
      0097F6                       1971 00194$:
                                   1972 ; skipping generated iCode
                           0006C6  1973 	C$pff.c$830$2_0$374 ==.
                                   1974 ;	../src/pff.c: 830: return FR_NOT_READY;
                                   1975 ; genReturn
      0097F6 A6 02            [ 1] 1976 	ld	a, #0x02
      0097F8 CC 9A 5A         [ 2] 1977 	jp	00137$
                                   1978 ; genLabel
      0097FB                       1979 00102$:
                           0006CB  1980 	C$pff.c$834$1_0$373 ==.
                                   1981 ;	../src/pff.c: 834: bsect = 0;
                                   1982 ; genAssign
      0097FB 5F               [ 1] 1983 	clrw	x
      0097FC 1F 37            [ 2] 1984 	ldw	(0x37, sp), x
      0097FE 1F 35            [ 2] 1985 	ldw	(0x35, sp), x
                           0006D0  1986 	C$pff.c$835$1_0$373 ==.
                                   1987 ;	../src/pff.c: 835: fmt = check_fs(buf, bsect);			/* Check sector 0 as an SFD format */
                                   1988 ; skipping iCode since result will be rematerialized
                                   1989 ; skipping iCode since result will be rematerialized
                                   1990 ; genIPush
      009800 5F               [ 1] 1991 	clrw	x
      009801 89               [ 2] 1992 	pushw	x
      009802 5F               [ 1] 1993 	clrw	x
      009803 89               [ 2] 1994 	pushw	x
                                   1995 ; genIPush
      009804 96               [ 1] 1996 	ldw	x, sp
      009805 1C 00 05         [ 2] 1997 	addw	x, #5
      009808 89               [ 2] 1998 	pushw	x
                                   1999 ; genCall
      009809 CD 97 7B         [ 4] 2000 	call	_check_fs
      00980C 5B 06            [ 2] 2001 	addw	sp, #6
                                   2002 ; genAssign
      00980E 6B 3C            [ 1] 2003 	ld	(0x3c, sp), a
                           0006E0  2004 	C$pff.c$836$1_0$373 ==.
                                   2005 ;	../src/pff.c: 836: if (fmt == 1) {						/* Not an FAT boot record, it may be FDISK format */
                                   2006 ; genCmpEQorNE
      009810 7B 3C            [ 1] 2007 	ld	a, (0x3c, sp)
      009812 4A               [ 1] 2008 	dec	a
      009813 26 03            [ 1] 2009 	jrne	00196$
      009815 CC 98 1B         [ 2] 2010 	jp	00197$
      009818                       2011 00196$:
      009818 CC 98 68         [ 2] 2012 	jp	00109$
      00981B                       2013 00197$:
                                   2014 ; skipping generated iCode
                           0006EB  2015 	C$pff.c$838$2_0$375 ==.
                                   2016 ;	../src/pff.c: 838: if (disk_readp(buf, bsect, MBR_Table, 16)) {	/* 1st partition entry */
                                   2017 ; skipping iCode since result will be rematerialized
                                   2018 ; skipping iCode since result will be rematerialized
                                   2019 ; genIPush
      00981B 4B 10            [ 1] 2020 	push	#0x10
      00981D 4B 00            [ 1] 2021 	push	#0x00
                                   2022 ; genIPush
      00981F 4B BE            [ 1] 2023 	push	#0xbe
      009821 4B 01            [ 1] 2024 	push	#0x01
                                   2025 ; genIPush
      009823 1E 3B            [ 2] 2026 	ldw	x, (0x3b, sp)
      009825 89               [ 2] 2027 	pushw	x
      009826 1E 3B            [ 2] 2028 	ldw	x, (0x3b, sp)
      009828 89               [ 2] 2029 	pushw	x
                                   2030 ; genIPush
      009829 96               [ 1] 2031 	ldw	x, sp
      00982A 1C 00 09         [ 2] 2032 	addw	x, #9
      00982D 89               [ 2] 2033 	pushw	x
                                   2034 ; genCall
      00982E CD 86 47         [ 4] 2035 	call	_disk_readp
      009831 5B 0A            [ 2] 2036 	addw	sp, #10
                                   2037 ; genIfx
      009833 4D               [ 1] 2038 	tnz	a
      009834 26 03            [ 1] 2039 	jrne	00198$
      009836 CC 98 40         [ 2] 2040 	jp	00106$
      009839                       2041 00198$:
                           000709  2042 	C$pff.c$839$3_0$376 ==.
                                   2043 ;	../src/pff.c: 839: fmt = 3;
                                   2044 ; genAssign
      009839 A6 03            [ 1] 2045 	ld	a, #0x03
      00983B 6B 3C            [ 1] 2046 	ld	(0x3c, sp), a
                                   2047 ; genGoto
      00983D CC 98 68         [ 2] 2048 	jp	00109$
                                   2049 ; genLabel
      009840                       2050 00106$:
                           000710  2051 	C$pff.c$841$3_0$377 ==.
                                   2052 ;	../src/pff.c: 841: if (buf[4]) {					/* Is the partition existing? */
                                   2053 ; skipping iCode since result will be rematerialized
                                   2054 ; genPointerGet
      009840 7B 05            [ 1] 2055 	ld	a, (0x05, sp)
                                   2056 ; genIfx
      009842 4D               [ 1] 2057 	tnz	a
      009843 26 03            [ 1] 2058 	jrne	00199$
      009845 CC 98 68         [ 2] 2059 	jp	00109$
      009848                       2060 00199$:
                           000718  2061 	C$pff.c$842$4_0$378 ==.
                                   2062 ;	../src/pff.c: 842: bsect = ld_dword(&buf[8]);	/* Partition offset in LBA */
                                   2063 ; skipping iCode since result will be rematerialized
                                   2064 ; genPlus
      009848 96               [ 1] 2065 	ldw	x, sp
      009849 1C 00 09         [ 2] 2066 	addw	x, #9
                                   2067 ; genCast
                                   2068 ; genAssign
                                   2069 ; genIPush
      00984C 89               [ 2] 2070 	pushw	x
                                   2071 ; genCall
      00984D CD 91 48         [ 4] 2072 	call	_ld_dword
      009850 5B 02            [ 2] 2073 	addw	sp, #2
                                   2074 ; genAssign
      009852 1F 37            [ 2] 2075 	ldw	(0x37, sp), x
      009854 17 35            [ 2] 2076 	ldw	(0x35, sp), y
                           000726  2077 	C$pff.c$843$4_0$378 ==.
                                   2078 ;	../src/pff.c: 843: fmt = check_fs(buf, bsect);	/* Check the partition */
                                   2079 ; skipping iCode since result will be rematerialized
                                   2080 ; skipping iCode since result will be rematerialized
                                   2081 ; genIPush
      009856 1E 37            [ 2] 2082 	ldw	x, (0x37, sp)
      009858 89               [ 2] 2083 	pushw	x
      009859 1E 37            [ 2] 2084 	ldw	x, (0x37, sp)
      00985B 89               [ 2] 2085 	pushw	x
                                   2086 ; genIPush
      00985C 96               [ 1] 2087 	ldw	x, sp
      00985D 1C 00 05         [ 2] 2088 	addw	x, #5
      009860 89               [ 2] 2089 	pushw	x
                                   2090 ; genCall
      009861 CD 97 7B         [ 4] 2091 	call	_check_fs
      009864 5B 06            [ 2] 2092 	addw	sp, #6
                                   2093 ; genAssign
      009866 6B 3C            [ 1] 2094 	ld	(0x3c, sp), a
                                   2095 ; genLabel
      009868                       2096 00109$:
                           000738  2097 	C$pff.c$847$1_0$373 ==.
                                   2098 ;	../src/pff.c: 847: if (fmt == 3) return FR_DISK_ERR;
                                   2099 ; genCmpEQorNE
      009868 7B 3C            [ 1] 2100 	ld	a, (0x3c, sp)
      00986A A1 03            [ 1] 2101 	cp	a, #0x03
      00986C 26 03            [ 1] 2102 	jrne	00201$
      00986E CC 98 74         [ 2] 2103 	jp	00202$
      009871                       2104 00201$:
      009871 CC 98 79         [ 2] 2105 	jp	00111$
      009874                       2106 00202$:
                                   2107 ; skipping generated iCode
                                   2108 ; genReturn
      009874 A6 01            [ 1] 2109 	ld	a, #0x01
      009876 CC 9A 5A         [ 2] 2110 	jp	00137$
                                   2111 ; genLabel
      009879                       2112 00111$:
                           000749  2113 	C$pff.c$848$1_0$373 ==.
                                   2114 ;	../src/pff.c: 848: if (fmt) return FR_NO_FILESYSTEM;	/* No valid FAT patition is found */
                                   2115 ; genIfx
      009879 0D 3C            [ 1] 2116 	tnz	(0x3c, sp)
      00987B 26 03            [ 1] 2117 	jrne	00203$
      00987D CC 98 85         [ 2] 2118 	jp	00113$
      009880                       2119 00203$:
                                   2120 ; genReturn
      009880 A6 06            [ 1] 2121 	ld	a, #0x06
      009882 CC 9A 5A         [ 2] 2122 	jp	00137$
                                   2123 ; genLabel
      009885                       2124 00113$:
                           000755  2125 	C$pff.c$851$1_0$373 ==.
                                   2126 ;	../src/pff.c: 851: if (disk_readp(buf, bsect, 13, sizeof (buf))) return FR_DISK_ERR;
                                   2127 ; skipping iCode since result will be rematerialized
                                   2128 ; skipping iCode since result will be rematerialized
                                   2129 ; genIPush
      009885 4B 24            [ 1] 2130 	push	#0x24
      009887 4B 00            [ 1] 2131 	push	#0x00
                                   2132 ; genIPush
      009889 4B 0D            [ 1] 2133 	push	#0x0d
      00988B 4B 00            [ 1] 2134 	push	#0x00
                                   2135 ; genIPush
      00988D 1E 3B            [ 2] 2136 	ldw	x, (0x3b, sp)
      00988F 89               [ 2] 2137 	pushw	x
      009890 1E 3B            [ 2] 2138 	ldw	x, (0x3b, sp)
      009892 89               [ 2] 2139 	pushw	x
                                   2140 ; genIPush
      009893 96               [ 1] 2141 	ldw	x, sp
      009894 1C 00 09         [ 2] 2142 	addw	x, #9
      009897 89               [ 2] 2143 	pushw	x
                                   2144 ; genCall
      009898 CD 86 47         [ 4] 2145 	call	_disk_readp
      00989B 5B 0A            [ 2] 2146 	addw	sp, #10
                                   2147 ; genIfx
      00989D 4D               [ 1] 2148 	tnz	a
      00989E 26 03            [ 1] 2149 	jrne	00204$
      0098A0 CC 98 A8         [ 2] 2150 	jp	00115$
      0098A3                       2151 00204$:
                                   2152 ; genReturn
      0098A3 A6 01            [ 1] 2153 	ld	a, #0x01
      0098A5 CC 9A 5A         [ 2] 2154 	jp	00137$
                                   2155 ; genLabel
      0098A8                       2156 00115$:
                           000778  2157 	C$pff.c$853$1_0$373 ==.
                                   2158 ;	../src/pff.c: 853: fsize = ld_word(buf+BPB_FATSz16-13);				/* Number of sectors per FAT */
                                   2159 ; genAddrOf
      0098A8 96               [ 1] 2160 	ldw	x, sp
      0098A9 1C 00 0A         [ 2] 2161 	addw	x, #10
                                   2162 ; genCast
                                   2163 ; genAssign
                                   2164 ; genIPush
      0098AC 89               [ 2] 2165 	pushw	x
                                   2166 ; genCall
      0098AD CD 91 30         [ 4] 2167 	call	_ld_word
      0098B0 5B 02            [ 2] 2168 	addw	sp, #2
                                   2169 ; genCast
                                   2170 ; genAssign
      0098B2 90 5F            [ 1] 2171 	clrw	y
                                   2172 ; genAssign
      0098B4 1F 3B            [ 2] 2173 	ldw	(0x3b, sp), x
      0098B6 17 39            [ 2] 2174 	ldw	(0x39, sp), y
                           000788  2175 	C$pff.c$854$1_0$373 ==.
                                   2176 ;	../src/pff.c: 854: if (!fsize) fsize = ld_dword(buf+BPB_FATSz32-13);
                                   2177 ; genIfx
      0098B8 1E 3B            [ 2] 2178 	ldw	x, (0x3b, sp)
      0098BA 26 04            [ 1] 2179 	jrne	00205$
      0098BC 1E 39            [ 2] 2180 	ldw	x, (0x39, sp)
      0098BE 27 03            [ 1] 2181 	jreq	00206$
      0098C0                       2182 00205$:
      0098C0 CC 98 D1         [ 2] 2183 	jp	00117$
      0098C3                       2184 00206$:
                                   2185 ; genAddrOf
      0098C3 96               [ 1] 2186 	ldw	x, sp
      0098C4 1C 00 18         [ 2] 2187 	addw	x, #24
                                   2188 ; genCast
                                   2189 ; genAssign
                                   2190 ; genIPush
      0098C7 89               [ 2] 2191 	pushw	x
                                   2192 ; genCall
      0098C8 CD 91 48         [ 4] 2193 	call	_ld_dword
      0098CB 5B 02            [ 2] 2194 	addw	sp, #2
                                   2195 ; genAssign
      0098CD 1F 3B            [ 2] 2196 	ldw	(0x3b, sp), x
      0098CF 17 39            [ 2] 2197 	ldw	(0x39, sp), y
                                   2198 ; genLabel
      0098D1                       2199 00117$:
                           0007A1  2200 	C$pff.c$856$1_0$373 ==.
                                   2201 ;	../src/pff.c: 856: fsize *= buf[BPB_NumFATs-13];						/* Number of sectors in FAT area */
                                   2202 ; skipping iCode since result will be rematerialized
                                   2203 ; skipping iCode since result will be rematerialized
                                   2204 ; genPointerGet
      0098D1 7B 04            [ 1] 2205 	ld	a, (0x04, sp)
                                   2206 ; genCast
                                   2207 ; genAssign
      0098D3 5F               [ 1] 2208 	clrw	x
      0098D4 97               [ 1] 2209 	ld	xl, a
      0098D5 90 5F            [ 1] 2210 	clrw	y
                                   2211 ; genIPush
      0098D7 89               [ 2] 2212 	pushw	x
      0098D8 90 89            [ 2] 2213 	pushw	y
                                   2214 ; genIPush
      0098DA 1E 3F            [ 2] 2215 	ldw	x, (0x3f, sp)
      0098DC 89               [ 2] 2216 	pushw	x
      0098DD 1E 3F            [ 2] 2217 	ldw	x, (0x3f, sp)
      0098DF 89               [ 2] 2218 	pushw	x
                                   2219 ; genCall
      0098E0 CD A0 6B         [ 4] 2220 	call	__mullong
      0098E3 5B 08            [ 2] 2221 	addw	sp, #8
                                   2222 ; genAssign
      0098E5 1F 27            [ 2] 2223 	ldw	(0x27, sp), x
      0098E7 17 25            [ 2] 2224 	ldw	(0x25, sp), y
                           0007B9  2225 	C$pff.c$857$1_0$373 ==.
                                   2226 ;	../src/pff.c: 857: fs->fatbase = bsect + ld_word(buf+BPB_RsvdSecCnt-13); /* FAT start sector (lba) */
                                   2227 ; genAssign
      0098E9 16 3F            [ 2] 2228 	ldw	y, (0x3f, sp)
      0098EB 17 29            [ 2] 2229 	ldw	(0x29, sp), y
                                   2230 ; genPlus
      0098ED 1E 29            [ 2] 2231 	ldw	x, (0x29, sp)
      0098EF 1C 00 0A         [ 2] 2232 	addw	x, #0x000a
      0098F2 1F 2B            [ 2] 2233 	ldw	(0x2b, sp), x
                                   2234 ; genMinus
      0098F4 96               [ 1] 2235 	ldw	x, sp
      0098F5 1C 00 02         [ 2] 2236 	addw	x, #-65534
                                   2237 ; genCast
                                   2238 ; genAssign
                                   2239 ; genIPush
      0098F8 89               [ 2] 2240 	pushw	x
                                   2241 ; genCall
      0098F9 CD 91 30         [ 4] 2242 	call	_ld_word
      0098FC 5B 02            [ 2] 2243 	addw	sp, #2
                                   2244 ; genCast
                                   2245 ; genAssign
      0098FE 51               [ 1] 2246 	exgw	x, y
      0098FF 4F               [ 1] 2247 	clr	a
      009900 5F               [ 1] 2248 	clrw	x
                                   2249 ; genPlus
      009901 72 F9 37         [ 2] 2250 	addw	y, (0x37, sp)
      009904 19 36            [ 1] 2251 	adc	a, (0x36, sp)
      009906 6B 3A            [ 1] 2252 	ld	(0x3a, sp), a
      009908 9E               [ 1] 2253 	ld	a, xh
      009909 19 35            [ 1] 2254 	adc	a, (0x35, sp)
      00990B 6B 39            [ 1] 2255 	ld	(0x39, sp), a
                                   2256 ; genPointerSet
      00990D 1E 2B            [ 2] 2257 	ldw	x, (0x2b, sp)
      00990F EF 02            [ 2] 2258 	ldw	(0x2, x), y
      009911 16 39            [ 2] 2259 	ldw	y, (0x39, sp)
      009913 FF               [ 2] 2260 	ldw	(x), y
                           0007E4  2261 	C$pff.c$858$1_0$373 ==.
                                   2262 ;	../src/pff.c: 858: fs->csize = buf[BPB_SecPerClus-13];					/* Number of sectors per cluster */
                                   2263 ; genPlus
      009914 1E 29            [ 2] 2264 	ldw	x, (0x29, sp)
      009916 5C               [ 1] 2265 	incw	x
      009917 5C               [ 1] 2266 	incw	x
      009918 1F 2D            [ 2] 2267 	ldw	(0x2d, sp), x
                                   2268 ; genPointerGet
      00991A 7B 01            [ 1] 2269 	ld	a, (0x01, sp)
                                   2270 ; genPointerSet
      00991C 1E 2D            [ 2] 2271 	ldw	x, (0x2d, sp)
      00991E F7               [ 1] 2272 	ld	(x), a
                           0007EF  2273 	C$pff.c$859$1_0$373 ==.
                                   2274 ;	../src/pff.c: 859: fs->n_rootdir = ld_word(buf+BPB_RootEntCnt-13);		/* Nmuber of root directory entries */
                                   2275 ; genPlus
      00991F 1E 29            [ 2] 2276 	ldw	x, (0x29, sp)
      009921 1C 00 04         [ 2] 2277 	addw	x, #0x0004
      009924 1F 2F            [ 2] 2278 	ldw	(0x2f, sp), x
                                   2279 ; genMinus
      009926 96               [ 1] 2280 	ldw	x, sp
      009927 1C 00 05         [ 2] 2281 	addw	x, #-65531
                                   2282 ; genCast
                                   2283 ; genAssign
                                   2284 ; genIPush
      00992A 89               [ 2] 2285 	pushw	x
                                   2286 ; genCall
      00992B CD 91 30         [ 4] 2287 	call	_ld_word
      00992E 5B 02            [ 2] 2288 	addw	sp, #2
                                   2289 ; genPointerSet
      009930 16 2F            [ 2] 2290 	ldw	y, (0x2f, sp)
      009932 90 FF            [ 2] 2291 	ldw	(y), x
                           000804  2292 	C$pff.c$860$1_0$373 ==.
                                   2293 ;	../src/pff.c: 860: tsect = ld_word(buf+BPB_TotSec16-13);				/* Number of sectors on the file system */
                                   2294 ; genMinus
      009934 96               [ 1] 2295 	ldw	x, sp
      009935 1C 00 07         [ 2] 2296 	addw	x, #-65529
                                   2297 ; genCast
                                   2298 ; genAssign
                                   2299 ; genIPush
      009938 89               [ 2] 2300 	pushw	x
                                   2301 ; genCall
      009939 CD 91 30         [ 4] 2302 	call	_ld_word
      00993C 5B 02            [ 2] 2303 	addw	sp, #2
                                   2304 ; genCast
                                   2305 ; genAssign
      00993E 90 5F            [ 1] 2306 	clrw	y
                                   2307 ; genAssign
      009940 1F 37            [ 2] 2308 	ldw	(0x37, sp), x
      009942 17 35            [ 2] 2309 	ldw	(0x35, sp), y
                           000814  2310 	C$pff.c$861$1_0$373 ==.
                                   2311 ;	../src/pff.c: 861: if (!tsect) tsect = ld_dword(buf+BPB_TotSec32-13);
                                   2312 ; genIfx
      009944 5D               [ 2] 2313 	tnzw	x
      009945 26 04            [ 1] 2314 	jrne	00207$
      009947 90 5D            [ 2] 2315 	tnzw	y
      009949 27 03            [ 1] 2316 	jreq	00208$
      00994B                       2317 00207$:
      00994B CC 99 5C         [ 2] 2318 	jp	00119$
      00994E                       2319 00208$:
                                   2320 ; skipping iCode since result will be rematerialized
                                   2321 ; skipping iCode since result will be rematerialized
                                   2322 ; genIPush
      00994E 96               [ 1] 2323 	ldw	x, sp
      00994F 1C 00 14         [ 2] 2324 	addw	x, #20
      009952 89               [ 2] 2325 	pushw	x
                                   2326 ; genCall
      009953 CD 91 48         [ 4] 2327 	call	_ld_dword
      009956 5B 02            [ 2] 2328 	addw	sp, #2
                                   2329 ; genAssign
      009958 1F 37            [ 2] 2330 	ldw	(0x37, sp), x
      00995A 17 35            [ 2] 2331 	ldw	(0x35, sp), y
                                   2332 ; genLabel
      00995C                       2333 00119$:
                           00082C  2334 	C$pff.c$863$1_0$373 ==.
                                   2335 ;	../src/pff.c: 863: - ld_word(buf+BPB_RsvdSecCnt-13) - fsize - fs->n_rootdir / 16
                                   2336 ; genAddrOf
      00995C 96               [ 1] 2337 	ldw	x, sp
      00995D 5C               [ 1] 2338 	incw	x
      00995E 5C               [ 1] 2339 	incw	x
                                   2340 ; genCast
                                   2341 ; genAssign
                                   2342 ; genIPush
      00995F 89               [ 2] 2343 	pushw	x
                                   2344 ; genCall
      009960 CD 91 30         [ 4] 2345 	call	_ld_word
      009963 5B 02            [ 2] 2346 	addw	sp, #2
                                   2347 ; genCast
                                   2348 ; genAssign
      009965 1F 3B            [ 2] 2349 	ldw	(0x3b, sp), x
      009967 0F 3A            [ 1] 2350 	clr	(0x3a, sp)
      009969 0F 39            [ 1] 2351 	clr	(0x39, sp)
                                   2352 ; genMinus
      00996B 16 37            [ 2] 2353 	ldw	y, (0x37, sp)
      00996D 72 F2 3B         [ 2] 2354 	subw	y, (0x3b, sp)
      009970 7B 36            [ 1] 2355 	ld	a, (0x36, sp)
      009972 12 3A            [ 1] 2356 	sbc	a, (0x3a, sp)
      009974 88               [ 1] 2357 	push	a
      009975 7B 36            [ 1] 2358 	ld	a, (0x36, sp)
      009977 12 3A            [ 1] 2359 	sbc	a, (0x3a, sp)
      009979 97               [ 1] 2360 	ld	xl, a
      00997A 84               [ 1] 2361 	pop	a
                                   2362 ; genMinus
      00997B 72 F2 27         [ 2] 2363 	subw	y, (0x27, sp)
      00997E 12 26            [ 1] 2364 	sbc	a, (0x26, sp)
      009980 6B 32            [ 1] 2365 	ld	(0x32, sp), a
      009982 9F               [ 1] 2366 	ld	a, xl
      009983 12 25            [ 1] 2367 	sbc	a, (0x25, sp)
                                   2368 ; genPointerGet
      009985 1E 2F            [ 2] 2369 	ldw	x, (0x2f, sp)
      009987 FE               [ 2] 2370 	ldw	x, (x)
                                   2371 ; genCast
                                   2372 ; genAssign
                                   2373 ; genRightShiftLiteral
      009988 54               [ 2] 2374 	srlw	x
      009989 54               [ 2] 2375 	srlw	x
      00998A 54               [ 2] 2376 	srlw	x
      00998B 54               [ 2] 2377 	srlw	x
                                   2378 ; genCast
                                   2379 ; genAssign
      00998C 1F 37            [ 2] 2380 	ldw	(0x37, sp), x
      00998E 5F               [ 1] 2381 	clrw	x
      00998F 0F 35            [ 1] 2382 	clr	(0x35, sp)
                                   2383 ; genMinus
      009991 72 F2 37         [ 2] 2384 	subw	y, (0x37, sp)
      009994 17 3B            [ 2] 2385 	ldw	(0x3b, sp), y
      009996 88               [ 1] 2386 	push	a
      009997 7B 33            [ 1] 2387 	ld	a, (0x33, sp)
      009999 89               [ 2] 2388 	pushw	x
      00999A 12 02            [ 1] 2389 	sbc	a, (2, sp)
      00999C 85               [ 2] 2390 	popw	x
      00999D 6B 3B            [ 1] 2391 	ld	(0x3b, sp), a
      00999F 84               [ 1] 2392 	pop	a
      0099A0 12 35            [ 1] 2393 	sbc	a, (0x35, sp)
      0099A2 6B 39            [ 1] 2394 	ld	(0x39, sp), a
                           000874  2395 	C$pff.c$864$1_0$373 ==.
                                   2396 ;	../src/pff.c: 864: ) / fs->csize + 2;
                                   2397 ; genPointerGet
      0099A4 1E 2D            [ 2] 2398 	ldw	x, (0x2d, sp)
      0099A6 F6               [ 1] 2399 	ld	a, (x)
                                   2400 ; genCast
                                   2401 ; genAssign
      0099A7 5F               [ 1] 2402 	clrw	x
      0099A8 97               [ 1] 2403 	ld	xl, a
      0099A9 90 5F            [ 1] 2404 	clrw	y
                                   2405 ; genIPush
      0099AB 89               [ 2] 2406 	pushw	x
      0099AC 90 89            [ 2] 2407 	pushw	y
                                   2408 ; genIPush
      0099AE 1E 3F            [ 2] 2409 	ldw	x, (0x3f, sp)
      0099B0 89               [ 2] 2410 	pushw	x
      0099B1 1E 3F            [ 2] 2411 	ldw	x, (0x3f, sp)
      0099B3 89               [ 2] 2412 	pushw	x
                                   2413 ; genCall
      0099B4 CD A0 11         [ 4] 2414 	call	__divulong
      0099B7 5B 08            [ 2] 2415 	addw	sp, #8
      0099B9 17 39            [ 2] 2416 	ldw	(0x39, sp), y
                                   2417 ; genPlus
      0099BB 1C 00 02         [ 2] 2418 	addw	x, #0x0002
      0099BE 51               [ 1] 2419 	exgw	x, y
      0099BF 1E 39            [ 2] 2420 	ldw	x, (0x39, sp)
      0099C1 24 01            [ 1] 2421 	jrnc	00209$
      0099C3 5C               [ 1] 2422 	incw	x
      0099C4                       2423 00209$:
                                   2424 ; genAssign
      0099C4 1F 39            [ 2] 2425 	ldw	(0x39, sp), x
                           000896  2426 	C$pff.c$865$1_0$373 ==.
                                   2427 ;	../src/pff.c: 865: fs->n_fatent = (CLUST)mclst;
                                   2428 ; genPlus
      0099C6 1E 29            [ 2] 2429 	ldw	x, (0x29, sp)
      0099C8 1C 00 06         [ 2] 2430 	addw	x, #0x0006
                                   2431 ; genPointerSet
      0099CB EF 02            [ 2] 2432 	ldw	(0x2, x), y
      0099CD 7B 3A            [ 1] 2433 	ld	a, (0x3a, sp)
      0099CF E7 01            [ 1] 2434 	ld	(0x1, x), a
      0099D1 7B 39            [ 1] 2435 	ld	a, (0x39, sp)
      0099D3 F7               [ 1] 2436 	ld	(x), a
                           0008A4  2437 	C$pff.c$867$1_0$373 ==.
                                   2438 ;	../src/pff.c: 867: fmt = 0;							/* Determine the FAT sub type */
                                   2439 ; genAssign
      0099D4 4F               [ 1] 2440 	clr	a
                           0008A5  2441 	C$pff.c$870$1_0$373 ==.
                                   2442 ;	../src/pff.c: 870: if (PF_FS_FAT32 && mclst >= 0xFFF7) fmt = FS_FAT32;
                                   2443 ; genCmp
                                   2444 ; genCmpTop
      0099D5 90 A3 FF F7      [ 2] 2445 	cpw	y, #0xfff7
      0099D9 88               [ 1] 2446 	push	a
      0099DA 7B 3B            [ 1] 2447 	ld	a, (0x3b, sp)
      0099DC A2 00            [ 1] 2448 	sbc	a, #0x00
      0099DE 7B 3A            [ 1] 2449 	ld	a, (0x3a, sp)
      0099E0 A2 00            [ 1] 2450 	sbc	a, #0x00
      0099E2 84               [ 1] 2451 	pop	a
      0099E3 24 03            [ 1] 2452 	jrnc	00210$
      0099E5 CC 99 EA         [ 2] 2453 	jp	00128$
      0099E8                       2454 00210$:
                                   2455 ; skipping generated iCode
                                   2456 ; genAssign
      0099E8 A6 03            [ 1] 2457 	ld	a, #0x03
                                   2458 ; genLabel
      0099EA                       2459 00128$:
                           0008BA  2460 	C$pff.c$871$1_0$373 ==.
                                   2461 ;	../src/pff.c: 871: if (!fmt) return FR_NO_FILESYSTEM;
                                   2462 ; genIfx
      0099EA 4D               [ 1] 2463 	tnz	a
      0099EB 27 03            [ 1] 2464 	jreq	00211$
      0099ED CC 99 F5         [ 2] 2465 	jp	00131$
      0099F0                       2466 00211$:
                                   2467 ; genReturn
      0099F0 A6 06            [ 1] 2468 	ld	a, #0x06
      0099F2 CC 9A 5A         [ 2] 2469 	jp	00137$
                                   2470 ; genLabel
      0099F5                       2471 00131$:
                           0008C5  2472 	C$pff.c$872$1_0$373 ==.
                                   2473 ;	../src/pff.c: 872: fs->fs_type = fmt;
                                   2474 ; genPointerSet
      0099F5 1E 29            [ 2] 2475 	ldw	x, (0x29, sp)
      0099F7 F7               [ 1] 2476 	ld	(x), a
                           0008C8  2477 	C$pff.c$875$2_0$379 ==.
                                   2478 ;	../src/pff.c: 875: fs->dirbase = ld_dword(buf+(BPB_RootClus-13));	/* Root directory start cluster */
                                   2479 ; genPlus
      0099F8 1E 29            [ 2] 2480 	ldw	x, (0x29, sp)
      0099FA 1C 00 0E         [ 2] 2481 	addw	x, #0x000e
      0099FD 1F 37            [ 2] 2482 	ldw	(0x37, sp), x
                                   2483 ; genAddrOf
      0099FF 96               [ 1] 2484 	ldw	x, sp
      009A00 1C 00 20         [ 2] 2485 	addw	x, #32
                                   2486 ; genCast
                                   2487 ; genAssign
                                   2488 ; genIPush
      009A03 89               [ 2] 2489 	pushw	x
                                   2490 ; genCall
      009A04 CD 91 48         [ 4] 2491 	call	_ld_dword
      009A07 5B 02            [ 2] 2492 	addw	sp, #2
      009A09 17 39            [ 2] 2493 	ldw	(0x39, sp), y
                                   2494 ; genPointerSet
      009A0B 16 37            [ 2] 2495 	ldw	y, (0x37, sp)
      009A0D 90 EF 02         [ 2] 2496 	ldw	(0x2, y), x
      009A10 1E 39            [ 2] 2497 	ldw	x, (0x39, sp)
      009A12 90 FF            [ 2] 2498 	ldw	(y), x
                           0008E4  2499 	C$pff.c$879$1_0$373 ==.
                                   2500 ;	../src/pff.c: 879: fs->database = fs->fatbase + fsize + fs->n_rootdir / 16;	/* Data start sector (lba) */
                                   2501 ; genPlus
      009A14 1E 29            [ 2] 2502 	ldw	x, (0x29, sp)
      009A16 1C 00 12         [ 2] 2503 	addw	x, #0x0012
      009A19 1F 3B            [ 2] 2504 	ldw	(0x3b, sp), x
                                   2505 ; genPointerGet
      009A1B 1E 2B            [ 2] 2506 	ldw	x, (0x2b, sp)
      009A1D 90 93            [ 1] 2507 	ldw	y, x
      009A1F 90 EE 02         [ 2] 2508 	ldw	y, (0x2, y)
      009A22 FE               [ 2] 2509 	ldw	x, (x)
                                   2510 ; genPlus
      009A23 72 F9 27         [ 2] 2511 	addw	y, (0x27, sp)
      009A26 17 39            [ 2] 2512 	ldw	(0x39, sp), y
      009A28 9F               [ 1] 2513 	ld	a, xl
      009A29 19 26            [ 1] 2514 	adc	a, (0x26, sp)
      009A2B 6B 38            [ 1] 2515 	ld	(0x38, sp), a
      009A2D 9E               [ 1] 2516 	ld	a, xh
      009A2E 19 25            [ 1] 2517 	adc	a, (0x25, sp)
                                   2518 ; genPointerGet
      009A30 1E 2F            [ 2] 2519 	ldw	x, (0x2f, sp)
      009A32 FE               [ 2] 2520 	ldw	x, (x)
                                   2521 ; genCast
                                   2522 ; genAssign
                                   2523 ; genRightShiftLiteral
      009A33 54               [ 2] 2524 	srlw	x
      009A34 54               [ 2] 2525 	srlw	x
      009A35 54               [ 2] 2526 	srlw	x
      009A36 54               [ 2] 2527 	srlw	x
                                   2528 ; genCast
                                   2529 ; genAssign
      009A37 51               [ 1] 2530 	exgw	x, y
      009A38 5F               [ 1] 2531 	clrw	x
      009A39 0F 2F            [ 1] 2532 	clr	(0x2f, sp)
                                   2533 ; genPlus
      009A3B 72 F9 39         [ 2] 2534 	addw	y, (0x39, sp)
      009A3E 88               [ 1] 2535 	push	a
      009A3F 9F               [ 1] 2536 	ld	a, xl
      009A40 19 39            [ 1] 2537 	adc	a, (0x39, sp)
      009A42 6B 35            [ 1] 2538 	ld	(0x35, sp), a
      009A44 84               [ 1] 2539 	pop	a
      009A45 19 2F            [ 1] 2540 	adc	a, (0x2f, sp)
      009A47 6B 33            [ 1] 2541 	ld	(0x33, sp), a
                                   2542 ; genPointerSet
      009A49 1E 3B            [ 2] 2543 	ldw	x, (0x3b, sp)
      009A4B EF 02            [ 2] 2544 	ldw	(0x2, x), y
      009A4D 16 33            [ 2] 2545 	ldw	y, (0x33, sp)
      009A4F FF               [ 2] 2546 	ldw	(x), y
                           000920  2547 	C$pff.c$881$1_0$373 ==.
                                   2548 ;	../src/pff.c: 881: fs->flag = 0;
                                   2549 ; genPlus
      009A50 1E 29            [ 2] 2550 	ldw	x, (0x29, sp)
      009A52 5C               [ 1] 2551 	incw	x
                                   2552 ; genPointerSet
      009A53 7F               [ 1] 2553 	clr	(x)
                           000924  2554 	C$pff.c$882$1_0$373 ==.
                                   2555 ;	../src/pff.c: 882: FatFs = fs;
                                   2556 ; genAssign
      009A54 1E 29            [ 2] 2557 	ldw	x, (0x29, sp)
                                   2558 ; genAssign
      009A56 CF 02 61         [ 2] 2559 	ldw	_FatFs+0, x
                           000929  2560 	C$pff.c$884$1_0$373 ==.
                                   2561 ;	../src/pff.c: 884: return FR_OK;
                                   2562 ; genReturn
      009A59 4F               [ 1] 2563 	clr	a
                                   2564 ; genLabel
      009A5A                       2565 00137$:
                           00092A  2566 	C$pff.c$885$1_0$373 ==.
                                   2567 ;	../src/pff.c: 885: }
                                   2568 ; genEndFunction
      009A5A 5B 3C            [ 2] 2569 	addw	sp, #60
                           00092C  2570 	C$pff.c$885$1_0$373 ==.
                           00092C  2571 	XG$pf_mount$0$0 ==.
      009A5C 81               [ 4] 2572 	ret
                           00092D  2573 	G$pf_open$0$0 ==.
                           00092D  2574 	C$pff.c$894$1_0$382 ==.
                                   2575 ;	../src/pff.c: 894: FRESULT pf_open (
                                   2576 ; genLabel
                                   2577 ;	-----------------------------------------
                                   2578 ;	 function pf_open
                                   2579 ;	-----------------------------------------
                                   2580 ;	Register assignment might be sub-optimal.
                                   2581 ;	Stack space usage: 70 bytes.
      009A5D                       2582 _pf_open:
      009A5D 52 46            [ 2] 2583 	sub	sp, #70
                           00092F  2584 	C$pff.c$901$2_0$382 ==.
                                   2585 ;	../src/pff.c: 901: FATFS *fs = FatFs;
                                   2586 ; genAssign
      009A5F CE 02 61         [ 2] 2587 	ldw	x, _FatFs+0
      009A62 1F 3D            [ 2] 2588 	ldw	(0x3d, sp), x
                           000934  2589 	C$pff.c$904$1_0$382 ==.
                                   2590 ;	../src/pff.c: 904: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
                                   2591 ; genIfx
      009A64 1E 3D            [ 2] 2592 	ldw	x, (0x3d, sp)
      009A66 27 03            [ 1] 2593 	jreq	00125$
      009A68 CC 9A 70         [ 2] 2594 	jp	00102$
      009A6B                       2595 00125$:
                                   2596 ; genReturn
      009A6B A6 05            [ 1] 2597 	ld	a, #0x05
      009A6D CC 9A FE         [ 2] 2598 	jp	00108$
                                   2599 ; genLabel
      009A70                       2600 00102$:
                           000940  2601 	C$pff.c$906$1_0$382 ==.
                                   2602 ;	../src/pff.c: 906: fs->flag = 0;
                                   2603 ; genPlus
      009A70 1E 3D            [ 2] 2604 	ldw	x, (0x3d, sp)
      009A72 5C               [ 1] 2605 	incw	x
      009A73 1F 3F            [ 2] 2606 	ldw	(0x3f, sp), x
                                   2607 ; genPointerSet
      009A75 1E 3F            [ 2] 2608 	ldw	x, (0x3f, sp)
      009A77 7F               [ 1] 2609 	clr	(x)
                           000948  2610 	C$pff.c$907$1_0$382 ==.
                                   2611 ;	../src/pff.c: 907: dj.fn = sp;
                                   2612 ; skipping iCode since result will be rematerialized
                                   2613 ; genPlus
      009A78 96               [ 1] 2614 	ldw	x, sp
      009A79 1C 00 03         [ 2] 2615 	addw	x, #3
                                   2616 ; skipping iCode since result will be rematerialized
                                   2617 ; skipping iCode since result will be rematerialized
                                   2618 ; genPointerSet
      009A7C 90 96            [ 1] 2619 	ldw	y, sp
      009A7E 72 A9 00 11      [ 2] 2620 	addw	y, #17
      009A82 FF               [ 2] 2621 	ldw	(x), y
                           000953  2622 	C$pff.c$908$1_0$382 ==.
                                   2623 ;	../src/pff.c: 908: res = follow_path(&dj, dir, path);	/* Follow the file path */
                                   2624 ; skipping iCode since result will be rematerialized
                                   2625 ; skipping iCode since result will be rematerialized
                                   2626 ; skipping iCode since result will be rematerialized
                                   2627 ; skipping iCode since result will be rematerialized
                                   2628 ; genIPush
      009A83 1E 49            [ 2] 2629 	ldw	x, (0x49, sp)
      009A85 89               [ 2] 2630 	pushw	x
                                   2631 ; genIPush
      009A86 96               [ 1] 2632 	ldw	x, sp
      009A87 1C 00 1F         [ 2] 2633 	addw	x, #31
      009A8A 89               [ 2] 2634 	pushw	x
                                   2635 ; genIPush
      009A8B 96               [ 1] 2636 	ldw	x, sp
      009A8C 1C 00 05         [ 2] 2637 	addw	x, #5
      009A8F 89               [ 2] 2638 	pushw	x
                                   2639 ; genCall
      009A90 CD 96 B5         [ 4] 2640 	call	_follow_path
      009A93 5B 06            [ 2] 2641 	addw	sp, #6
                                   2642 ; genAssign
      009A95 97               [ 1] 2643 	ld	xl, a
                           000966  2644 	C$pff.c$909$1_0$382 ==.
                                   2645 ;	../src/pff.c: 909: if (res != FR_OK) return res;		/* Follow failed */
                                   2646 ; genIfx
      009A96 4D               [ 1] 2647 	tnz	a
      009A97 26 03            [ 1] 2648 	jrne	00126$
      009A99 CC 9A A0         [ 2] 2649 	jp	00104$
      009A9C                       2650 00126$:
                                   2651 ; genReturn
      009A9C 9F               [ 1] 2652 	ld	a, xl
      009A9D CC 9A FE         [ 2] 2653 	jp	00108$
                                   2654 ; genLabel
      009AA0                       2655 00104$:
                           000970  2656 	C$pff.c$910$1_0$382 ==.
                                   2657 ;	../src/pff.c: 910: if (!dir[0] || (dir[DIR_Attr] & AM_DIR)) return FR_NO_FILE;	/* It is a directory */
                                   2658 ; skipping iCode since result will be rematerialized
                                   2659 ; genPointerGet
      009AA0 7B 1D            [ 1] 2660 	ld	a, (0x1d, sp)
                                   2661 ; genIfx
      009AA2 4D               [ 1] 2662 	tnz	a
      009AA3 26 03            [ 1] 2663 	jrne	00127$
      009AA5 CC 9A B1         [ 2] 2664 	jp	00105$
      009AA8                       2665 00127$:
                                   2666 ; skipping iCode since result will be rematerialized
                                   2667 ; genPointerGet
      009AA8 7B 28            [ 1] 2668 	ld	a, (0x28, sp)
                                   2669 ; genAnd
      009AAA A5 10            [ 1] 2670 	bcp	a, #0x10
      009AAC 26 03            [ 1] 2671 	jrne	00128$
      009AAE CC 9A B6         [ 2] 2672 	jp	00106$
      009AB1                       2673 00128$:
                                   2674 ; skipping generated iCode
                                   2675 ; genLabel
      009AB1                       2676 00105$:
                                   2677 ; genReturn
      009AB1 A6 03            [ 1] 2678 	ld	a, #0x03
      009AB3 CC 9A FE         [ 2] 2679 	jp	00108$
                                   2680 ; genLabel
      009AB6                       2681 00106$:
                           000986  2682 	C$pff.c$912$1_0$382 ==.
                                   2683 ;	../src/pff.c: 912: fs->org_clust = get_clust(dir);		/* File start cluster */
                                   2684 ; genPlus
      009AB6 1E 3D            [ 2] 2685 	ldw	x, (0x3d, sp)
      009AB8 1C 00 1E         [ 2] 2686 	addw	x, #0x001e
      009ABB 1F 41            [ 2] 2687 	ldw	(0x41, sp), x
                                   2688 ; skipping iCode since result will be rematerialized
                                   2689 ; skipping iCode since result will be rematerialized
                                   2690 ; genIPush
      009ABD 96               [ 1] 2691 	ldw	x, sp
      009ABE 1C 00 1D         [ 2] 2692 	addw	x, #29
      009AC1 89               [ 2] 2693 	pushw	x
                                   2694 ; genCall
      009AC2 CD 93 57         [ 4] 2695 	call	_get_clust
      009AC5 5B 02            [ 2] 2696 	addw	sp, #2
      009AC7 17 43            [ 2] 2697 	ldw	(0x43, sp), y
                                   2698 ; genPointerSet
      009AC9 16 41            [ 2] 2699 	ldw	y, (0x41, sp)
      009ACB 90 EF 02         [ 2] 2700 	ldw	(0x2, y), x
      009ACE 1E 43            [ 2] 2701 	ldw	x, (0x43, sp)
      009AD0 90 FF            [ 2] 2702 	ldw	(y), x
                           0009A2  2703 	C$pff.c$913$1_0$382 ==.
                                   2704 ;	../src/pff.c: 913: fs->fsize = ld_dword(dir+DIR_FileSize);	/* File size */
                                   2705 ; genPlus
      009AD2 1E 3D            [ 2] 2706 	ldw	x, (0x3d, sp)
      009AD4 1C 00 1A         [ 2] 2707 	addw	x, #0x001a
      009AD7 1F 41            [ 2] 2708 	ldw	(0x41, sp), x
                                   2709 ; genPlus
      009AD9 96               [ 1] 2710 	ldw	x, sp
      009ADA 1C 00 39         [ 2] 2711 	addw	x, #57
                                   2712 ; genCast
                                   2713 ; genAssign
                                   2714 ; genIPush
      009ADD 89               [ 2] 2715 	pushw	x
                                   2716 ; genCall
      009ADE CD 91 48         [ 4] 2717 	call	_ld_dword
      009AE1 5B 02            [ 2] 2718 	addw	sp, #2
      009AE3 17 43            [ 2] 2719 	ldw	(0x43, sp), y
                                   2720 ; genPointerSet
      009AE5 16 41            [ 2] 2721 	ldw	y, (0x41, sp)
      009AE7 90 EF 02         [ 2] 2722 	ldw	(0x2, y), x
      009AEA 1E 43            [ 2] 2723 	ldw	x, (0x43, sp)
      009AEC 90 FF            [ 2] 2724 	ldw	(y), x
                           0009BE  2725 	C$pff.c$914$1_0$382 ==.
                                   2726 ;	../src/pff.c: 914: fs->fptr = 0;						/* File pointer */
                                   2727 ; genPlus
      009AEE 1E 3D            [ 2] 2728 	ldw	x, (0x3d, sp)
      009AF0 1C 00 16         [ 2] 2729 	addw	x, #0x0016
                                   2730 ; genPointerSet
      009AF3 90 5F            [ 1] 2731 	clrw	y
      009AF5 EF 02            [ 2] 2732 	ldw	(0x2, x), y
      009AF7 FF               [ 2] 2733 	ldw	(x), y
                           0009C8  2734 	C$pff.c$915$1_0$382 ==.
                                   2735 ;	../src/pff.c: 915: fs->flag = FA_OPENED;
                                   2736 ; genPointerSet
      009AF8 1E 3F            [ 2] 2737 	ldw	x, (0x3f, sp)
      009AFA A6 01            [ 1] 2738 	ld	a, #0x01
      009AFC F7               [ 1] 2739 	ld	(x), a
                           0009CD  2740 	C$pff.c$917$1_0$382 ==.
                                   2741 ;	../src/pff.c: 917: return FR_OK;
                                   2742 ; genReturn
      009AFD 4F               [ 1] 2743 	clr	a
                                   2744 ; genLabel
      009AFE                       2745 00108$:
                           0009CE  2746 	C$pff.c$918$1_0$382 ==.
                                   2747 ;	../src/pff.c: 918: }
                                   2748 ; genEndFunction
      009AFE 5B 46            [ 2] 2749 	addw	sp, #70
                           0009D0  2750 	C$pff.c$918$1_0$382 ==.
                           0009D0  2751 	XG$pf_open$0$0 ==.
      009B00 81               [ 4] 2752 	ret
                           0009D1  2753 	G$pf_read$0$0 ==.
                           0009D1  2754 	C$pff.c$928$1_0$384 ==.
                                   2755 ;	../src/pff.c: 928: FRESULT pf_read (
                                   2756 ; genLabel
                                   2757 ;	-----------------------------------------
                                   2758 ;	 function pf_read
                                   2759 ;	-----------------------------------------
                                   2760 ;	Register assignment might be sub-optimal.
                                   2761 ;	Stack space usage: 26 bytes.
      009B01                       2762 _pf_read:
      009B01 52 1A            [ 2] 2763 	sub	sp, #26
                           0009D3  2764 	C$pff.c$938$2_0$384 ==.
                                   2765 ;	../src/pff.c: 938: BYTE cs, *rbuff = buff;
                                   2766 ; genCast
                                   2767 ; genAssign
      009B03 1E 1D            [ 2] 2768 	ldw	x, (0x1d, sp)
                                   2769 ; genAssign
      009B05 1F 01            [ 2] 2770 	ldw	(0x01, sp), x
                           0009D7  2771 	C$pff.c$939$2_0$384 ==.
                                   2772 ;	../src/pff.c: 939: FATFS *fs = FatFs;
                                   2773 ; genAssign
      009B07 CE 02 61         [ 2] 2774 	ldw	x, _FatFs+0
      009B0A 1F 19            [ 2] 2775 	ldw	(0x19, sp), x
                           0009DC  2776 	C$pff.c$942$1_0$384 ==.
                                   2777 ;	../src/pff.c: 942: *br = 0;
                                   2778 ; genAssign
      009B0C 16 21            [ 2] 2779 	ldw	y, (0x21, sp)
      009B0E 17 03            [ 2] 2780 	ldw	(0x03, sp), y
                                   2781 ; genPointerSet
      009B10 1E 03            [ 2] 2782 	ldw	x, (0x03, sp)
      009B12 6F 01            [ 1] 2783 	clr	(0x1, x)
      009B14 7F               [ 1] 2784 	clr	(x)
                           0009E5  2785 	C$pff.c$943$1_0$384 ==.
                                   2786 ;	../src/pff.c: 943: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
                                   2787 ; genIfx
      009B15 1E 19            [ 2] 2788 	ldw	x, (0x19, sp)
      009B17 27 03            [ 1] 2789 	jreq	00194$
      009B19 CC 9B 21         [ 2] 2790 	jp	00102$
      009B1C                       2791 00194$:
                                   2792 ; genReturn
      009B1C A6 05            [ 1] 2793 	ld	a, #0x05
      009B1E CC 9D 17         [ 2] 2794 	jp	00127$
                                   2795 ; genLabel
      009B21                       2796 00102$:
                           0009F1  2797 	C$pff.c$944$1_0$384 ==.
                                   2798 ;	../src/pff.c: 944: if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
                                   2799 ; genPlus
      009B21 1E 19            [ 2] 2800 	ldw	x, (0x19, sp)
      009B23 5C               [ 1] 2801 	incw	x
      009B24 1F 05            [ 2] 2802 	ldw	(0x05, sp), x
                                   2803 ; genPointerGet
      009B26 1E 05            [ 2] 2804 	ldw	x, (0x05, sp)
      009B28 F6               [ 1] 2805 	ld	a, (x)
                                   2806 ; genAnd
      009B29 44               [ 1] 2807 	srl	a
      009B2A 24 03            [ 1] 2808 	jrnc	00195$
      009B2C CC 9B 34         [ 2] 2809 	jp	00104$
      009B2F                       2810 00195$:
                                   2811 ; skipping generated iCode
                                   2812 ; genReturn
      009B2F A6 04            [ 1] 2813 	ld	a, #0x04
      009B31 CC 9D 17         [ 2] 2814 	jp	00127$
                                   2815 ; genLabel
      009B34                       2816 00104$:
                           000A04  2817 	C$pff.c$946$1_0$384 ==.
                                   2818 ;	../src/pff.c: 946: remain = fs->fsize - fs->fptr;
                                   2819 ; genAssign
      009B34 1E 19            [ 2] 2820 	ldw	x, (0x19, sp)
                                   2821 ; genPointerGet
      009B36 90 93            [ 1] 2822 	ldw	y, x
      009B38 90 EE 1C         [ 2] 2823 	ldw	y, (0x1c, y)
      009B3B EE 1A            [ 2] 2824 	ldw	x, (0x1a, x)
      009B3D 1F 0F            [ 2] 2825 	ldw	(0x0f, sp), x
                                   2826 ; genPlus
      009B3F 1E 19            [ 2] 2827 	ldw	x, (0x19, sp)
      009B41 1C 00 16         [ 2] 2828 	addw	x, #0x0016
      009B44 1F 17            [ 2] 2829 	ldw	(0x17, sp), x
                                   2830 ; genPointerGet
      009B46 1E 17            [ 2] 2831 	ldw	x, (0x17, sp)
      009B48 E6 03            [ 1] 2832 	ld	a, (0x3, x)
      009B4A 6B 16            [ 1] 2833 	ld	(0x16, sp), a
      009B4C E6 02            [ 1] 2834 	ld	a, (0x2, x)
      009B4E 6B 15            [ 1] 2835 	ld	(0x15, sp), a
      009B50 FE               [ 2] 2836 	ldw	x, (x)
                                   2837 ; genMinus
      009B51 72 F2 15         [ 2] 2838 	subw	y, (0x15, sp)
      009B54 7B 10            [ 1] 2839 	ld	a, (0x10, sp)
      009B56 89               [ 2] 2840 	pushw	x
      009B57 12 02            [ 1] 2841 	sbc	a, (2, sp)
      009B59 85               [ 2] 2842 	popw	x
      009B5A 97               [ 1] 2843 	ld	xl, a
      009B5B 7B 0F            [ 1] 2844 	ld	a, (0x0f, sp)
      009B5D 89               [ 2] 2845 	pushw	x
      009B5E 12 01            [ 1] 2846 	sbc	a, (1, sp)
      009B60 85               [ 2] 2847 	popw	x
                                   2848 ; genAssign
      009B61 17 11            [ 2] 2849 	ldw	(0x11, sp), y
      009B63 95               [ 1] 2850 	ld	xh, a
                           000A34  2851 	C$pff.c$947$1_0$384 ==.
                                   2852 ;	../src/pff.c: 947: if (btr > remain) btr = (UINT)remain;			/* Truncate btr by remaining bytes */
                                   2853 ; genCast
                                   2854 ; genAssign
      009B64 16 1F            [ 2] 2855 	ldw	y, (0x1f, sp)
      009B66 17 15            [ 2] 2856 	ldw	(0x15, sp), y
      009B68 0F 14            [ 1] 2857 	clr	(0x14, sp)
      009B6A 0F 13            [ 1] 2858 	clr	(0x13, sp)
                                   2859 ; genCmp
                                   2860 ; genCmpTop
      009B6C 7B 12            [ 1] 2861 	ld	a, (0x12, sp)
      009B6E 11 16            [ 1] 2862 	cp	a, (0x16, sp)
      009B70 7B 11            [ 1] 2863 	ld	a, (0x11, sp)
      009B72 12 15            [ 1] 2864 	sbc	a, (0x15, sp)
      009B74 9F               [ 1] 2865 	ld	a, xl
      009B75 12 14            [ 1] 2866 	sbc	a, (0x14, sp)
      009B77 9E               [ 1] 2867 	ld	a, xh
      009B78 12 13            [ 1] 2868 	sbc	a, (0x13, sp)
      009B7A 25 03            [ 1] 2869 	jrc	00196$
      009B7C CC 9B 83         [ 2] 2870 	jp	00140$
      009B7F                       2871 00196$:
                                   2872 ; skipping generated iCode
                                   2873 ; genCast
                                   2874 ; genAssign
      009B7F 1E 11            [ 2] 2875 	ldw	x, (0x11, sp)
                                   2876 ; genAssign
      009B81 1F 1F            [ 2] 2877 	ldw	(0x1f, sp), x
                           000A53  2878 	C$pff.c$949$1_0$384 ==.
                                   2879 ;	../src/pff.c: 949: while (btr)	{									/* Repeat until all data transferred */
                                   2880 ; genLabel
      009B83                       2881 00140$:
                                   2882 ; genAssign
      009B83 16 17            [ 2] 2883 	ldw	y, (0x17, sp)
      009B85 17 07            [ 2] 2884 	ldw	(0x07, sp), y
                                   2885 ; genPlus
      009B87 1E 19            [ 2] 2886 	ldw	x, (0x19, sp)
      009B89 1C 00 22         [ 2] 2887 	addw	x, #0x0022
      009B8C 1F 09            [ 2] 2888 	ldw	(0x09, sp), x
                                   2889 ; genAssign
      009B8E 16 19            [ 2] 2890 	ldw	y, (0x19, sp)
      009B90 17 0B            [ 2] 2891 	ldw	(0x0b, sp), y
                                   2892 ; genAssign
      009B92 16 19            [ 2] 2893 	ldw	y, (0x19, sp)
      009B94 17 0D            [ 2] 2894 	ldw	(0x0d, sp), y
                                   2895 ; genPlus
      009B96 1E 19            [ 2] 2896 	ldw	x, (0x19, sp)
      009B98 1C 00 26         [ 2] 2897 	addw	x, #0x0026
      009B9B 1F 0F            [ 2] 2898 	ldw	(0x0f, sp), x
                                   2899 ; genLabel
      009B9D                       2900 00124$:
                                   2901 ; genIfx
      009B9D 1E 1F            [ 2] 2902 	ldw	x, (0x1f, sp)
      009B9F 26 03            [ 1] 2903 	jrne	00197$
      009BA1 CC 9D 16         [ 2] 2904 	jp	00126$
      009BA4                       2905 00197$:
                           000A74  2906 	C$pff.c$950$1_0$384 ==.
                                   2907 ;	../src/pff.c: 950: if ((fs->fptr % 512) == 0) {				/* On the sector boundary? */
                                   2908 ; genPointerGet
      009BA4 1E 07            [ 2] 2909 	ldw	x, (0x07, sp)
      009BA6 90 93            [ 1] 2910 	ldw	y, x
      009BA8 90 EE 02         [ 2] 2911 	ldw	y, (0x2, y)
      009BAB 17 13            [ 2] 2912 	ldw	(0x13, sp), y
      009BAD FE               [ 2] 2913 	ldw	x, (x)
      009BAE 1F 11            [ 2] 2914 	ldw	(0x11, sp), x
                                   2915 ; genAnd
      009BB0 7B 14            [ 1] 2916 	ld	a, (0x14, sp)
      009BB2 6B 1A            [ 1] 2917 	ld	(0x1a, sp), a
      009BB4 7B 13            [ 1] 2918 	ld	a, (0x13, sp)
      009BB6 A4 01            [ 1] 2919 	and	a, #0x01
      009BB8 6B 19            [ 1] 2920 	ld	(0x19, sp), a
      009BBA 5F               [ 1] 2921 	clrw	x
      009BBB 1F 17            [ 2] 2922 	ldw	(0x17, sp), x
                                   2923 ; genIfx
      009BBD 1E 19            [ 2] 2924 	ldw	x, (0x19, sp)
      009BBF 26 04            [ 1] 2925 	jrne	00198$
      009BC1 1E 17            [ 2] 2926 	ldw	x, (0x17, sp)
      009BC3 27 03            [ 1] 2927 	jreq	00199$
      009BC5                       2928 00198$:
      009BC5 CC 9C 84         [ 2] 2929 	jp	00117$
      009BC8                       2930 00199$:
                           000A98  2931 	C$pff.c$951$3_0$386 ==.
                                   2932 ;	../src/pff.c: 951: cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
                                   2933 ; genRightShiftLiteral
      009BC8 16 12            [ 2] 2934 	ldw	y, (0x12, sp)
      009BCA 17 17            [ 2] 2935 	ldw	(0x17, sp), y
      009BCC 7B 11            [ 1] 2936 	ld	a, (0x11, sp)
      009BCE 6B 16            [ 1] 2937 	ld	(0x16, sp), a
      009BD0 0F 15            [ 1] 2938 	clr	(0x15, sp)
      009BD2 04 16            [ 1] 2939 	srl	(0x16, sp)
      009BD4 06 17            [ 1] 2940 	rrc	(0x17, sp)
      009BD6 06 18            [ 1] 2941 	rrc	(0x18, sp)
                                   2942 ; genPointerGet
      009BD8 1E 0D            [ 2] 2943 	ldw	x, (0x0d, sp)
      009BDA E6 02            [ 1] 2944 	ld	a, (0x2, x)
      009BDC 6B 1A            [ 1] 2945 	ld	(0x1a, sp), a
                                   2946 ; genCast
                                   2947 ; genAssign
                                   2948 ; genMinus
      009BDE 0A 1A            [ 1] 2949 	dec	(0x1a, sp)
                                   2950 ; genCast
                                   2951 ; genAssign
      009BE0 7B 1A            [ 1] 2952 	ld	a, (0x1a, sp)
      009BE2 6B 19            [ 1] 2953 	ld	(0x19, sp), a
                                   2954 ; genCast
                                   2955 ; genAssign
      009BE4 7B 18            [ 1] 2956 	ld	a, (0x18, sp)
      009BE6 6B 1A            [ 1] 2957 	ld	(0x1a, sp), a
                                   2958 ; genAnd
      009BE8 7B 1A            [ 1] 2959 	ld	a, (0x1a, sp)
      009BEA 14 19            [ 1] 2960 	and	a, (0x19, sp)
                                   2961 ; genAssign
      009BEC 6B 1A            [ 1] 2962 	ld	(0x1a, sp), a
                           000ABE  2963 	C$pff.c$952$3_0$386 ==.
                                   2964 ;	../src/pff.c: 952: if (!cs) {								/* On the cluster boundary? */
                                   2965 ; genIfx
      009BEE 4D               [ 1] 2966 	tnz	a
      009BEF 27 03            [ 1] 2967 	jreq	00200$
      009BF1 CC 9C 43         [ 2] 2968 	jp	00113$
      009BF4                       2969 00200$:
                           000AC4  2970 	C$pff.c$953$4_0$387 ==.
                                   2971 ;	../src/pff.c: 953: if (fs->fptr == 0) {				/* On the top of the file? */
                                   2972 ; genIfx
      009BF4 1E 13            [ 2] 2973 	ldw	x, (0x13, sp)
      009BF6 26 04            [ 1] 2974 	jrne	00201$
      009BF8 1E 11            [ 2] 2975 	ldw	x, (0x11, sp)
      009BFA 27 03            [ 1] 2976 	jreq	00202$
      009BFC                       2977 00201$:
      009BFC CC 9C 0F         [ 2] 2978 	jp	00108$
      009BFF                       2979 00202$:
                           000ACF  2980 	C$pff.c$954$5_0$388 ==.
                                   2981 ;	../src/pff.c: 954: clst = fs->org_clust;
                                   2982 ; genPointerGet
      009BFF 1E 0B            [ 2] 2983 	ldw	x, (0x0b, sp)
      009C01 90 93            [ 1] 2984 	ldw	y, x
      009C03 90 EE 20         [ 2] 2985 	ldw	y, (0x20, y)
      009C06 EE 1E            [ 2] 2986 	ldw	x, (0x1e, x)
                                   2987 ; genAssign
      009C08 17 18            [ 2] 2988 	ldw	(0x18, sp), y
      009C0A 1F 16            [ 2] 2989 	ldw	(0x16, sp), x
                                   2990 ; genGoto
      009C0C CC 9C 23         [ 2] 2991 	jp	00109$
                                   2992 ; genLabel
      009C0F                       2993 00108$:
                           000ADF  2994 	C$pff.c$956$5_0$389 ==.
                                   2995 ;	../src/pff.c: 956: clst = get_fat(fs->curr_clust);
                                   2996 ; genPointerGet
      009C0F 1E 09            [ 2] 2997 	ldw	x, (0x09, sp)
      009C11 90 93            [ 1] 2998 	ldw	y, x
      009C13 90 EE 02         [ 2] 2999 	ldw	y, (0x2, y)
      009C16 FE               [ 2] 3000 	ldw	x, (x)
                                   3001 ; genIPush
      009C17 90 89            [ 2] 3002 	pushw	y
      009C19 89               [ 2] 3003 	pushw	x
                                   3004 ; genCall
      009C1A CD 92 29         [ 4] 3005 	call	_get_fat
      009C1D 5B 04            [ 2] 3006 	addw	sp, #4
      009C1F 17 16            [ 2] 3007 	ldw	(0x16, sp), y
                                   3008 ; genAssign
      009C21 1F 18            [ 2] 3009 	ldw	(0x18, sp), x
                                   3010 ; genLabel
      009C23                       3011 00109$:
                           000AF3  3012 	C$pff.c$958$4_0$387 ==.
                                   3013 ;	../src/pff.c: 958: if (clst <= 1) ABORT(FR_DISK_ERR);
                                   3014 ; genCmp
                                   3015 ; genCmpTop
      009C23 5F               [ 1] 3016 	clrw	x
      009C24 5C               [ 1] 3017 	incw	x
      009C25 13 18            [ 2] 3018 	cpw	x, (0x18, sp)
      009C27 4F               [ 1] 3019 	clr	a
      009C28 12 17            [ 1] 3020 	sbc	a, (0x17, sp)
      009C2A 4F               [ 1] 3021 	clr	a
      009C2B 12 16            [ 1] 3022 	sbc	a, (0x16, sp)
      009C2D 24 03            [ 1] 3023 	jrnc	00203$
      009C2F CC 9C 3A         [ 2] 3024 	jp	00111$
      009C32                       3025 00203$:
                                   3026 ; skipping generated iCode
                                   3027 ; genPointerSet
      009C32 1E 05            [ 2] 3028 	ldw	x, (0x05, sp)
      009C34 7F               [ 1] 3029 	clr	(x)
                                   3030 ; genReturn
      009C35 A6 01            [ 1] 3031 	ld	a, #0x01
      009C37 CC 9D 17         [ 2] 3032 	jp	00127$
                                   3033 ; genLabel
      009C3A                       3034 00111$:
                           000B0A  3035 	C$pff.c$959$4_0$387 ==.
                                   3036 ;	../src/pff.c: 959: fs->curr_clust = clst;				/* Update current cluster */
                                   3037 ; genPointerSet
      009C3A 1E 09            [ 2] 3038 	ldw	x, (0x09, sp)
      009C3C 16 18            [ 2] 3039 	ldw	y, (0x18, sp)
      009C3E EF 02            [ 2] 3040 	ldw	(0x2, x), y
      009C40 16 16            [ 2] 3041 	ldw	y, (0x16, sp)
      009C42 FF               [ 2] 3042 	ldw	(x), y
                                   3043 ; genLabel
      009C43                       3044 00113$:
                           000B13  3045 	C$pff.c$961$3_0$386 ==.
                                   3046 ;	../src/pff.c: 961: sect = clust2sect(fs->curr_clust);		/* Get current sector */
                                   3047 ; genPointerGet
      009C43 1E 09            [ 2] 3048 	ldw	x, (0x09, sp)
      009C45 90 93            [ 1] 3049 	ldw	y, x
      009C47 90 EE 02         [ 2] 3050 	ldw	y, (0x2, y)
      009C4A FE               [ 2] 3051 	ldw	x, (x)
                                   3052 ; genIPush
      009C4B 90 89            [ 2] 3053 	pushw	y
      009C4D 89               [ 2] 3054 	pushw	x
                                   3055 ; genCall
      009C4E CD 92 E1         [ 4] 3056 	call	_clust2sect
      009C51 5B 04            [ 2] 3057 	addw	sp, #4
                                   3058 ; genAssign
      009C53 1F 18            [ 2] 3059 	ldw	(0x18, sp), x
      009C55 17 16            [ 2] 3060 	ldw	(0x16, sp), y
                           000B27  3061 	C$pff.c$962$3_0$386 ==.
                                   3062 ;	../src/pff.c: 962: if (!sect) ABORT(FR_DISK_ERR);
                                   3063 ; genIfx
      009C57 5D               [ 2] 3064 	tnzw	x
      009C58 26 04            [ 1] 3065 	jrne	00204$
      009C5A 90 5D            [ 2] 3066 	tnzw	y
      009C5C 27 03            [ 1] 3067 	jreq	00205$
      009C5E                       3068 00204$:
      009C5E CC 9C 69         [ 2] 3069 	jp	00115$
      009C61                       3070 00205$:
                                   3071 ; genPointerSet
      009C61 1E 05            [ 2] 3072 	ldw	x, (0x05, sp)
      009C63 7F               [ 1] 3073 	clr	(x)
                                   3074 ; genReturn
      009C64 A6 01            [ 1] 3075 	ld	a, #0x01
      009C66 CC 9D 17         [ 2] 3076 	jp	00127$
                                   3077 ; genLabel
      009C69                       3078 00115$:
                           000B39  3079 	C$pff.c$963$3_0$386 ==.
                                   3080 ;	../src/pff.c: 963: fs->dsect = sect + cs;
                                   3081 ; genCast
                                   3082 ; genAssign
      009C69 7B 1A            [ 1] 3083 	ld	a, (0x1a, sp)
      009C6B 90 5F            [ 1] 3084 	clrw	y
      009C6D 5F               [ 1] 3085 	clrw	x
                                   3086 ; genPlus
      009C6E 90 97            [ 1] 3087 	ld	yl, a
      009C70 72 F9 18         [ 2] 3088 	addw	y, (0x18, sp)
      009C73 9F               [ 1] 3089 	ld	a, xl
      009C74 19 17            [ 1] 3090 	adc	a, (0x17, sp)
      009C76 6B 13            [ 1] 3091 	ld	(0x13, sp), a
      009C78 9E               [ 1] 3092 	ld	a, xh
      009C79 19 16            [ 1] 3093 	adc	a, (0x16, sp)
      009C7B 6B 12            [ 1] 3094 	ld	(0x12, sp), a
                                   3095 ; genPointerSet
      009C7D 1E 0F            [ 2] 3096 	ldw	x, (0x0f, sp)
      009C7F EF 02            [ 2] 3097 	ldw	(0x2, x), y
      009C81 16 12            [ 2] 3098 	ldw	y, (0x12, sp)
      009C83 FF               [ 2] 3099 	ldw	(x), y
                                   3100 ; genLabel
      009C84                       3101 00117$:
                           000B54  3102 	C$pff.c$950$1_0$384 ==.
                                   3103 ;	../src/pff.c: 950: if ((fs->fptr % 512) == 0) {				/* On the sector boundary? */
                                   3104 ; genPointerGet
      009C84 1E 07            [ 2] 3105 	ldw	x, (0x07, sp)
      009C86 EE 02            [ 2] 3106 	ldw	x, (0x2, x)
                           000B58  3107 	C$pff.c$965$1_0$384 ==.
                                   3108 ;	../src/pff.c: 965: rcnt = 512 - (UINT)fs->fptr % 512;			/* Get partial sector data from sector buffer */
                                   3109 ; genAssign
      009C88 9F               [ 1] 3110 	ld	a, xl
                                   3111 ; genAnd
      009C89 6B 16            [ 1] 3112 	ld	(0x16, sp), a
      009C8B 9E               [ 1] 3113 	ld	a, xh
      009C8C A4 01            [ 1] 3114 	and	a, #0x01
      009C8E 6B 15            [ 1] 3115 	ld	(0x15, sp), a
                                   3116 ; genMinus
      009C90 5F               [ 1] 3117 	clrw	x
      009C91 A6 02            [ 1] 3118 	ld	a, #0x02
      009C93 95               [ 1] 3119 	ld	xh, a
      009C94 72 F0 15         [ 2] 3120 	subw	x, (0x15, sp)
                                   3121 ; genAssign
      009C97 1F 11            [ 2] 3122 	ldw	(0x11, sp), x
                           000B69  3123 	C$pff.c$966$2_0$385 ==.
                                   3124 ;	../src/pff.c: 966: if (rcnt > btr) rcnt = btr;
                                   3125 ; genCmp
                                   3126 ; genCmpTop
      009C99 1E 11            [ 2] 3127 	ldw	x, (0x11, sp)
      009C9B 13 1F            [ 2] 3128 	cpw	x, (0x1f, sp)
      009C9D 22 03            [ 1] 3129 	jrugt	00206$
      009C9F CC 9C A6         [ 2] 3130 	jp	00119$
      009CA2                       3131 00206$:
                                   3132 ; skipping generated iCode
                                   3133 ; genAssign
      009CA2 16 1F            [ 2] 3134 	ldw	y, (0x1f, sp)
      009CA4 17 11            [ 2] 3135 	ldw	(0x11, sp), y
                                   3136 ; genLabel
      009CA6                       3137 00119$:
                           000B76  3138 	C$pff.c$967$2_0$385 ==.
                                   3139 ;	../src/pff.c: 967: dr = disk_readp(rbuff, fs->dsect, (UINT)fs->fptr % 512, rcnt);
                                   3140 ; genPointerGet
      009CA6 1E 0F            [ 2] 3141 	ldw	x, (0x0f, sp)
      009CA8 90 93            [ 1] 3142 	ldw	y, x
      009CAA 90 EE 02         [ 2] 3143 	ldw	y, (0x2, y)
      009CAD FE               [ 2] 3144 	ldw	x, (x)
      009CAE 1F 17            [ 2] 3145 	ldw	(0x17, sp), x
                                   3146 ; genIPush
      009CB0 1E 11            [ 2] 3147 	ldw	x, (0x11, sp)
      009CB2 89               [ 2] 3148 	pushw	x
                                   3149 ; genIPush
      009CB3 1E 17            [ 2] 3150 	ldw	x, (0x17, sp)
      009CB5 89               [ 2] 3151 	pushw	x
                                   3152 ; genIPush
      009CB6 90 89            [ 2] 3153 	pushw	y
      009CB8 1E 1D            [ 2] 3154 	ldw	x, (0x1d, sp)
      009CBA 89               [ 2] 3155 	pushw	x
                                   3156 ; genIPush
      009CBB 1E 09            [ 2] 3157 	ldw	x, (0x09, sp)
      009CBD 89               [ 2] 3158 	pushw	x
                                   3159 ; genCall
      009CBE CD 86 47         [ 4] 3160 	call	_disk_readp
      009CC1 5B 0A            [ 2] 3161 	addw	sp, #10
                           000B93  3162 	C$pff.c$968$2_0$385 ==.
                                   3163 ;	../src/pff.c: 968: if (dr) ABORT(FR_DISK_ERR);
                                   3164 ; genIfx
      009CC3 4D               [ 1] 3165 	tnz	a
      009CC4 26 03            [ 1] 3166 	jrne	00207$
      009CC6 CC 9C D1         [ 2] 3167 	jp	00121$
      009CC9                       3168 00207$:
                                   3169 ; genPointerSet
      009CC9 1E 05            [ 2] 3170 	ldw	x, (0x05, sp)
      009CCB 7F               [ 1] 3171 	clr	(x)
                                   3172 ; genReturn
      009CCC A6 01            [ 1] 3173 	ld	a, #0x01
      009CCE CC 9D 17         [ 2] 3174 	jp	00127$
                                   3175 ; genLabel
      009CD1                       3176 00121$:
                           000BA1  3177 	C$pff.c$969$2_0$385 ==.
                                   3178 ;	../src/pff.c: 969: fs->fptr += rcnt;							/* Advances file read pointer */
                                   3179 ; genPointerGet
      009CD1 1E 07            [ 2] 3180 	ldw	x, (0x07, sp)
      009CD3 90 93            [ 1] 3181 	ldw	y, x
      009CD5 90 EE 02         [ 2] 3182 	ldw	y, (0x2, y)
      009CD8 17 15            [ 2] 3183 	ldw	(0x15, sp), y
      009CDA FE               [ 2] 3184 	ldw	x, (x)
      009CDB 1F 13            [ 2] 3185 	ldw	(0x13, sp), x
                                   3186 ; genCast
                                   3187 ; genAssign
      009CDD 16 11            [ 2] 3188 	ldw	y, (0x11, sp)
      009CDF 4F               [ 1] 3189 	clr	a
      009CE0 5F               [ 1] 3190 	clrw	x
                                   3191 ; genPlus
      009CE1 72 F9 15         [ 2] 3192 	addw	y, (0x15, sp)
      009CE4 19 14            [ 1] 3193 	adc	a, (0x14, sp)
      009CE6 6B 18            [ 1] 3194 	ld	(0x18, sp), a
      009CE8 9F               [ 1] 3195 	ld	a, xl
      009CE9 19 13            [ 1] 3196 	adc	a, (0x13, sp)
      009CEB 6B 17            [ 1] 3197 	ld	(0x17, sp), a
                                   3198 ; genPointerSet
      009CED 1E 07            [ 2] 3199 	ldw	x, (0x07, sp)
      009CEF EF 02            [ 2] 3200 	ldw	(0x2, x), y
      009CF1 16 17            [ 2] 3201 	ldw	y, (0x17, sp)
      009CF3 FF               [ 2] 3202 	ldw	(x), y
                           000BC4  3203 	C$pff.c$970$2_0$385 ==.
                                   3204 ;	../src/pff.c: 970: btr -= rcnt; *br += rcnt;					/* Update read counter */
                                   3205 ; genMinus
      009CF4 1E 1F            [ 2] 3206 	ldw	x, (0x1f, sp)
      009CF6 72 F0 11         [ 2] 3207 	subw	x, (0x11, sp)
                                   3208 ; genAssign
      009CF9 1F 1F            [ 2] 3209 	ldw	(0x1f, sp), x
                                   3210 ; genPointerGet
      009CFB 1E 03            [ 2] 3211 	ldw	x, (0x03, sp)
      009CFD FE               [ 2] 3212 	ldw	x, (x)
                                   3213 ; genPlus
      009CFE 72 FB 11         [ 2] 3214 	addw	x, (0x11, sp)
                                   3215 ; genPointerSet
      009D01 16 03            [ 2] 3216 	ldw	y, (0x03, sp)
      009D03 90 FF            [ 2] 3217 	ldw	(y), x
                           000BD5  3218 	C$pff.c$971$2_0$385 ==.
                                   3219 ;	../src/pff.c: 971: if (rbuff) rbuff += rcnt;					/* Advances the data pointer if destination is memory */
                                   3220 ; genIfx
      009D05 1E 01            [ 2] 3221 	ldw	x, (0x01, sp)
      009D07 26 03            [ 1] 3222 	jrne	00208$
      009D09 CC 9B 9D         [ 2] 3223 	jp	00124$
      009D0C                       3224 00208$:
                                   3225 ; genPlus
      009D0C 1E 01            [ 2] 3226 	ldw	x, (0x01, sp)
      009D0E 72 FB 11         [ 2] 3227 	addw	x, (0x11, sp)
                                   3228 ; genAssign
      009D11 1F 01            [ 2] 3229 	ldw	(0x01, sp), x
                                   3230 ; genGoto
      009D13 CC 9B 9D         [ 2] 3231 	jp	00124$
                                   3232 ; genLabel
      009D16                       3233 00126$:
                           000BE6  3234 	C$pff.c$974$1_0$384 ==.
                                   3235 ;	../src/pff.c: 974: return FR_OK;
                                   3236 ; genReturn
      009D16 4F               [ 1] 3237 	clr	a
                                   3238 ; genLabel
      009D17                       3239 00127$:
                           000BE7  3240 	C$pff.c$975$1_0$384 ==.
                                   3241 ;	../src/pff.c: 975: }
                                   3242 ; genEndFunction
      009D17 5B 1A            [ 2] 3243 	addw	sp, #26
                           000BE9  3244 	C$pff.c$975$1_0$384 ==.
                           000BE9  3245 	XG$pf_read$0$0 ==.
      009D19 81               [ 4] 3246 	ret
                           000BEA  3247 	G$pf_write$0$0 ==.
                           000BEA  3248 	C$pff.c$985$1_0$394 ==.
                                   3249 ;	../src/pff.c: 985: FRESULT pf_write (
                                   3250 ; genLabel
                                   3251 ;	-----------------------------------------
                                   3252 ;	 function pf_write
                                   3253 ;	-----------------------------------------
                                   3254 ;	Register assignment might be sub-optimal.
                                   3255 ;	Stack space usage: 30 bytes.
      009D1A                       3256 _pf_write:
      009D1A 52 1E            [ 2] 3257 	sub	sp, #30
                           000BEC  3258 	C$pff.c$993$2_0$394 ==.
                                   3259 ;	../src/pff.c: 993: const BYTE *p = buff;
                                   3260 ; genCast
                                   3261 ; genAssign
      009D1C 1E 21            [ 2] 3262 	ldw	x, (0x21, sp)
                                   3263 ; genAssign
      009D1E 1F 05            [ 2] 3264 	ldw	(0x05, sp), x
                           000BF0  3265 	C$pff.c$996$2_0$394 ==.
                                   3266 ;	../src/pff.c: 996: FATFS *fs = FatFs;
                                   3267 ; genAssign
      009D20 CE 02 61         [ 2] 3268 	ldw	x, _FatFs+0
      009D23 1F 07            [ 2] 3269 	ldw	(0x07, sp), x
                           000BF5  3270 	C$pff.c$999$1_0$394 ==.
                                   3271 ;	../src/pff.c: 999: *bw = 0;
                                   3272 ; genAssign
      009D25 16 25            [ 2] 3273 	ldw	y, (0x25, sp)
      009D27 17 09            [ 2] 3274 	ldw	(0x09, sp), y
                                   3275 ; genPointerSet
      009D29 1E 09            [ 2] 3276 	ldw	x, (0x09, sp)
      009D2B 6F 01            [ 1] 3277 	clr	(0x1, x)
      009D2D 7F               [ 1] 3278 	clr	(x)
                           000BFE  3279 	C$pff.c$1000$1_0$394 ==.
                                   3280 ;	../src/pff.c: 1000: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
                                   3281 ; genIfx
      009D2E 1E 07            [ 2] 3282 	ldw	x, (0x07, sp)
      009D30 27 03            [ 1] 3283 	jreq	00236$
      009D32 CC 9D 3A         [ 2] 3284 	jp	00102$
      009D35                       3285 00236$:
                                   3286 ; genReturn
      009D35 A6 05            [ 1] 3287 	ld	a, #0x05
      009D37 CC 9F D9         [ 2] 3288 	jp	00139$
                                   3289 ; genLabel
      009D3A                       3290 00102$:
                           000C0A  3291 	C$pff.c$1001$1_0$394 ==.
                                   3292 ;	../src/pff.c: 1001: if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
                                   3293 ; genPlus
      009D3A 1E 07            [ 2] 3294 	ldw	x, (0x07, sp)
      009D3C 5C               [ 1] 3295 	incw	x
      009D3D 1F 0B            [ 2] 3296 	ldw	(0x0b, sp), x
                                   3297 ; genPointerGet
      009D3F 1E 0B            [ 2] 3298 	ldw	x, (0x0b, sp)
      009D41 F6               [ 1] 3299 	ld	a, (x)
                                   3300 ; genAnd
      009D42 A5 01            [ 1] 3301 	bcp	a, #0x01
      009D44 27 03            [ 1] 3302 	jreq	00237$
      009D46 CC 9D 4E         [ 2] 3303 	jp	00104$
      009D49                       3304 00237$:
                                   3305 ; skipping generated iCode
                                   3306 ; genReturn
      009D49 A6 04            [ 1] 3307 	ld	a, #0x04
      009D4B CC 9F D9         [ 2] 3308 	jp	00139$
                                   3309 ; genLabel
      009D4E                       3310 00104$:
                           000C1E  3311 	C$pff.c$1004$1_0$394 ==.
                                   3312 ;	../src/pff.c: 1004: if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
                                   3313 ; genAnd
      009D4E A4 40            [ 1] 3314 	and	a, #0x40
      009D50 6B 1C            [ 1] 3315 	ld	(0x1c, sp), a
      009D52 0F 1B            [ 1] 3316 	clr	(0x1b, sp)
                           000C24  3317 	C$pff.c$1003$1_0$394 ==.
                                   3318 ;	../src/pff.c: 1003: if (!btw) {		/* Finalize request */
                                   3319 ; genIfx
      009D54 1E 23            [ 2] 3320 	ldw	x, (0x23, sp)
      009D56 27 03            [ 1] 3321 	jreq	00238$
      009D58 CC 9D 87         [ 2] 3322 	jp	00111$
      009D5B                       3323 00238$:
                           000C2B  3324 	C$pff.c$1004$2_0$395 ==.
                                   3325 ;	../src/pff.c: 1004: if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
                                   3326 ; genIfx
      009D5B 1E 1B            [ 2] 3327 	ldw	x, (0x1b, sp)
      009D5D 26 03            [ 1] 3328 	jrne	00239$
      009D5F CC 9D 7B         [ 2] 3329 	jp	00106$
      009D62                       3330 00239$:
                                   3331 ; genIPush
      009D62 5F               [ 1] 3332 	clrw	x
      009D63 89               [ 2] 3333 	pushw	x
      009D64 5F               [ 1] 3334 	clrw	x
      009D65 89               [ 2] 3335 	pushw	x
                                   3336 ; genIPush
      009D66 5F               [ 1] 3337 	clrw	x
      009D67 89               [ 2] 3338 	pushw	x
                                   3339 ; genCall
      009D68 CD 87 36         [ 4] 3340 	call	_disk_writep
      009D6B 5B 06            [ 2] 3341 	addw	sp, #6
                                   3342 ; genIfx
      009D6D 4D               [ 1] 3343 	tnz	a
      009D6E 26 03            [ 1] 3344 	jrne	00240$
      009D70 CC 9D 7B         [ 2] 3345 	jp	00106$
      009D73                       3346 00240$:
                                   3347 ; genPointerSet
      009D73 1E 0B            [ 2] 3348 	ldw	x, (0x0b, sp)
      009D75 7F               [ 1] 3349 	clr	(x)
                                   3350 ; genReturn
      009D76 A6 01            [ 1] 3351 	ld	a, #0x01
      009D78 CC 9F D9         [ 2] 3352 	jp	00139$
                                   3353 ; genLabel
      009D7B                       3354 00106$:
                           000C4B  3355 	C$pff.c$1005$2_0$395 ==.
                                   3356 ;	../src/pff.c: 1005: fs->flag &= ~FA__WIP;
                                   3357 ; genPointerGet
      009D7B 1E 0B            [ 2] 3358 	ldw	x, (0x0b, sp)
      009D7D F6               [ 1] 3359 	ld	a, (x)
                                   3360 ; genAnd
      009D7E A4 BF            [ 1] 3361 	and	a, #0xbf
                                   3362 ; genPointerSet
      009D80 1E 0B            [ 2] 3363 	ldw	x, (0x0b, sp)
      009D82 F7               [ 1] 3364 	ld	(x), a
                           000C53  3365 	C$pff.c$1006$2_0$395 ==.
                                   3366 ;	../src/pff.c: 1006: return FR_OK;
                                   3367 ; genReturn
      009D83 4F               [ 1] 3368 	clr	a
      009D84 CC 9F D9         [ 2] 3369 	jp	00139$
                                   3370 ; genLabel
      009D87                       3371 00111$:
                           000C57  3372 	C$pff.c$1009$1_0$394 ==.
                                   3373 ;	../src/pff.c: 1009: fs->fptr &= 0xFFFFFE00;
                                   3374 ; genPlus
      009D87 1E 07            [ 2] 3375 	ldw	x, (0x07, sp)
      009D89 1C 00 16         [ 2] 3376 	addw	x, #0x0016
      009D8C 1F 1D            [ 2] 3377 	ldw	(0x1d, sp), x
                           000C5E  3378 	C$pff.c$1008$2_0$397 ==.
                                   3379 ;	../src/pff.c: 1008: if (!(fs->flag & FA__WIP)) {	/* Round-down fptr to the sector boundary */
                                   3380 ; genIfx
      009D8E 1E 1B            [ 2] 3381 	ldw	x, (0x1b, sp)
      009D90 27 03            [ 1] 3382 	jreq	00241$
      009D92 CC 9D B3         [ 2] 3383 	jp	00112$
      009D95                       3384 00241$:
                           000C65  3385 	C$pff.c$1009$3_0$398 ==.
                                   3386 ;	../src/pff.c: 1009: fs->fptr &= 0xFFFFFE00;
                                   3387 ; genPointerGet
      009D95 1E 1D            [ 2] 3388 	ldw	x, (0x1d, sp)
      009D97 E6 03            [ 1] 3389 	ld	a, (0x3, x)
      009D99 90 97            [ 1] 3390 	ld	yl, a
      009D9B E6 02            [ 1] 3391 	ld	a, (0x2, x)
      009D9D FE               [ 2] 3392 	ldw	x, (x)
                                   3393 ; genAnd
      009D9E A4 FE            [ 1] 3394 	and	a, #0xfe
      009DA0 90 95            [ 1] 3395 	ld	yh, a
      009DA2 4F               [ 1] 3396 	clr	a
      009DA3 90 97            [ 1] 3397 	ld	yl, a
      009DA5 02               [ 1] 3398 	rlwa	x
      009DA6 6B 19            [ 1] 3399 	ld	(0x19, sp), a
      009DA8 01               [ 1] 3400 	rrwa	x
      009DA9 9F               [ 1] 3401 	ld	a, xl
                                   3402 ; genPointerSet
      009DAA 1E 1D            [ 2] 3403 	ldw	x, (0x1d, sp)
      009DAC EF 02            [ 2] 3404 	ldw	(0x2, x), y
      009DAE E7 01            [ 1] 3405 	ld	(0x1, x), a
      009DB0 7B 19            [ 1] 3406 	ld	a, (0x19, sp)
      009DB2 F7               [ 1] 3407 	ld	(x), a
                                   3408 ; genLabel
      009DB3                       3409 00112$:
                           000C83  3410 	C$pff.c$1012$1_0$394 ==.
                                   3411 ;	../src/pff.c: 1012: remain = fs->fsize - fs->fptr;
                                   3412 ; genAssign
      009DB3 1E 07            [ 2] 3413 	ldw	x, (0x07, sp)
                                   3414 ; genPointerGet
      009DB5 90 93            [ 1] 3415 	ldw	y, x
      009DB7 90 EE 1C         [ 2] 3416 	ldw	y, (0x1c, y)
      009DBA EE 1A            [ 2] 3417 	ldw	x, (0x1a, x)
      009DBC 1F 15            [ 2] 3418 	ldw	(0x15, sp), x
                                   3419 ; genPointerGet
      009DBE 1E 1D            [ 2] 3420 	ldw	x, (0x1d, sp)
      009DC0 E6 03            [ 1] 3421 	ld	a, (0x3, x)
      009DC2 6B 1C            [ 1] 3422 	ld	(0x1c, sp), a
      009DC4 E6 02            [ 1] 3423 	ld	a, (0x2, x)
      009DC6 6B 1B            [ 1] 3424 	ld	(0x1b, sp), a
      009DC8 FE               [ 2] 3425 	ldw	x, (x)
      009DC9 1F 19            [ 2] 3426 	ldw	(0x19, sp), x
                                   3427 ; genMinus
      009DCB 72 F2 1B         [ 2] 3428 	subw	y, (0x1b, sp)
      009DCE 7B 16            [ 1] 3429 	ld	a, (0x16, sp)
      009DD0 12 1A            [ 1] 3430 	sbc	a, (0x1a, sp)
      009DD2 97               [ 1] 3431 	ld	xl, a
      009DD3 7B 15            [ 1] 3432 	ld	a, (0x15, sp)
      009DD5 12 19            [ 1] 3433 	sbc	a, (0x19, sp)
                                   3434 ; genAssign
      009DD7 17 17            [ 2] 3435 	ldw	(0x17, sp), y
      009DD9 95               [ 1] 3436 	ld	xh, a
                           000CAA  3437 	C$pff.c$1013$1_0$394 ==.
                                   3438 ;	../src/pff.c: 1013: if (btw > remain) btw = (UINT)remain;			/* Truncate btw by remaining bytes */
                                   3439 ; genCast
                                   3440 ; genAssign
      009DDA 16 23            [ 2] 3441 	ldw	y, (0x23, sp)
      009DDC 17 1B            [ 2] 3442 	ldw	(0x1b, sp), y
      009DDE 0F 1A            [ 1] 3443 	clr	(0x1a, sp)
      009DE0 0F 19            [ 1] 3444 	clr	(0x19, sp)
                                   3445 ; genCmp
                                   3446 ; genCmpTop
      009DE2 7B 18            [ 1] 3447 	ld	a, (0x18, sp)
      009DE4 11 1C            [ 1] 3448 	cp	a, (0x1c, sp)
      009DE6 7B 17            [ 1] 3449 	ld	a, (0x17, sp)
      009DE8 12 1B            [ 1] 3450 	sbc	a, (0x1b, sp)
      009DEA 9F               [ 1] 3451 	ld	a, xl
      009DEB 12 1A            [ 1] 3452 	sbc	a, (0x1a, sp)
      009DED 9E               [ 1] 3453 	ld	a, xh
      009DEE 12 19            [ 1] 3454 	sbc	a, (0x19, sp)
      009DF0 25 03            [ 1] 3455 	jrc	00242$
      009DF2 CC 9D F9         [ 2] 3456 	jp	00157$
      009DF5                       3457 00242$:
                                   3458 ; skipping generated iCode
                                   3459 ; genCast
                                   3460 ; genAssign
      009DF5 1E 17            [ 2] 3461 	ldw	x, (0x17, sp)
                                   3462 ; genAssign
      009DF7 1F 23            [ 2] 3463 	ldw	(0x23, sp), x
                           000CC9  3464 	C$pff.c$1015$1_0$394 ==.
                                   3465 ;	../src/pff.c: 1015: while (btw)	{									/* Repeat until all data transferred */
                                   3466 ; genLabel
      009DF9                       3467 00157$:
                                   3468 ; genAssign
      009DF9 16 1D            [ 2] 3469 	ldw	y, (0x1d, sp)
      009DFB 17 0D            [ 2] 3470 	ldw	(0x0d, sp), y
                                   3471 ; genPlus
      009DFD 1E 07            [ 2] 3472 	ldw	x, (0x07, sp)
      009DFF 1C 00 22         [ 2] 3473 	addw	x, #0x0022
      009E02 1F 0F            [ 2] 3474 	ldw	(0x0f, sp), x
                                   3475 ; genAssign
      009E04 16 07            [ 2] 3476 	ldw	y, (0x07, sp)
      009E06 17 11            [ 2] 3477 	ldw	(0x11, sp), y
                                   3478 ; genAssign
      009E08 16 07            [ 2] 3479 	ldw	y, (0x07, sp)
      009E0A 17 13            [ 2] 3480 	ldw	(0x13, sp), y
                                   3481 ; genLabel
      009E0C                       3482 00136$:
                                   3483 ; genIfx
      009E0C 1E 23            [ 2] 3484 	ldw	x, (0x23, sp)
      009E0E 26 03            [ 1] 3485 	jrne	00243$
      009E10 CC 9F D8         [ 2] 3486 	jp	00138$
      009E13                       3487 00243$:
                           000CE3  3488 	C$pff.c$1016$1_0$394 ==.
                                   3489 ;	../src/pff.c: 1016: if ((UINT)fs->fptr % 512 == 0) {			/* On the sector boundary? */
                                   3490 ; genPointerGet
      009E13 1E 0D            [ 2] 3491 	ldw	x, (0x0d, sp)
      009E15 90 93            [ 1] 3492 	ldw	y, x
      009E17 90 EE 02         [ 2] 3493 	ldw	y, (0x2, y)
      009E1A 17 17            [ 2] 3494 	ldw	(0x17, sp), y
      009E1C FE               [ 2] 3495 	ldw	x, (x)
      009E1D 1F 15            [ 2] 3496 	ldw	(0x15, sp), x
                                   3497 ; genCast
                                   3498 ; genAssign
      009E1F 1E 17            [ 2] 3499 	ldw	x, (0x17, sp)
                                   3500 ; genAnd
      009E21 41               [ 1] 3501 	exg	a, xl
      009E22 6B 1E            [ 1] 3502 	ld	(0x1e, sp), a
      009E24 41               [ 1] 3503 	exg	a, xl
      009E25 9E               [ 1] 3504 	ld	a, xh
      009E26 A4 01            [ 1] 3505 	and	a, #0x01
      009E28 6B 1D            [ 1] 3506 	ld	(0x1d, sp), a
                                   3507 ; genIfx
      009E2A 1E 1D            [ 2] 3508 	ldw	x, (0x1d, sp)
      009E2C 27 03            [ 1] 3509 	jreq	00244$
      009E2E CC 9F 18         [ 2] 3510 	jp	00127$
      009E31                       3511 00244$:
                           000D01  3512 	C$pff.c$1017$3_0$400 ==.
                                   3513 ;	../src/pff.c: 1017: cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
                                   3514 ; genRightShiftLiteral
      009E31 16 16            [ 2] 3515 	ldw	y, (0x16, sp)
      009E33 17 1B            [ 2] 3516 	ldw	(0x1b, sp), y
      009E35 7B 15            [ 1] 3517 	ld	a, (0x15, sp)
      009E37 6B 1A            [ 1] 3518 	ld	(0x1a, sp), a
      009E39 0F 19            [ 1] 3519 	clr	(0x19, sp)
      009E3B 04 1A            [ 1] 3520 	srl	(0x1a, sp)
      009E3D 06 1B            [ 1] 3521 	rrc	(0x1b, sp)
      009E3F 06 1C            [ 1] 3522 	rrc	(0x1c, sp)
                                   3523 ; genPointerGet
      009E41 1E 13            [ 2] 3524 	ldw	x, (0x13, sp)
      009E43 E6 02            [ 1] 3525 	ld	a, (0x2, x)
      009E45 6B 1E            [ 1] 3526 	ld	(0x1e, sp), a
                                   3527 ; genCast
                                   3528 ; genAssign
                                   3529 ; genMinus
      009E47 0A 1E            [ 1] 3530 	dec	(0x1e, sp)
                                   3531 ; genCast
                                   3532 ; genAssign
      009E49 7B 1E            [ 1] 3533 	ld	a, (0x1e, sp)
      009E4B 6B 1D            [ 1] 3534 	ld	(0x1d, sp), a
                                   3535 ; genCast
                                   3536 ; genAssign
      009E4D 7B 1C            [ 1] 3537 	ld	a, (0x1c, sp)
      009E4F 6B 1E            [ 1] 3538 	ld	(0x1e, sp), a
                                   3539 ; genAnd
      009E51 7B 1E            [ 1] 3540 	ld	a, (0x1e, sp)
      009E53 14 1D            [ 1] 3541 	and	a, (0x1d, sp)
                                   3542 ; genAssign
      009E55 6B 1E            [ 1] 3543 	ld	(0x1e, sp), a
                           000D27  3544 	C$pff.c$1018$3_0$400 ==.
                                   3545 ;	../src/pff.c: 1018: if (!cs) {								/* On the cluster boundary? */
                                   3546 ; genIfx
      009E57 4D               [ 1] 3547 	tnz	a
      009E58 27 03            [ 1] 3548 	jreq	00245$
      009E5A CC 9E AC         [ 2] 3549 	jp	00121$
      009E5D                       3550 00245$:
                           000D2D  3551 	C$pff.c$1019$4_0$401 ==.
                                   3552 ;	../src/pff.c: 1019: if (fs->fptr == 0) {				/* On the top of the file? */
                                   3553 ; genIfx
      009E5D 1E 17            [ 2] 3554 	ldw	x, (0x17, sp)
      009E5F 26 04            [ 1] 3555 	jrne	00246$
      009E61 1E 15            [ 2] 3556 	ldw	x, (0x15, sp)
      009E63 27 03            [ 1] 3557 	jreq	00247$
      009E65                       3558 00246$:
      009E65 CC 9E 78         [ 2] 3559 	jp	00116$
      009E68                       3560 00247$:
                           000D38  3561 	C$pff.c$1020$5_0$402 ==.
                                   3562 ;	../src/pff.c: 1020: clst = fs->org_clust;
                                   3563 ; genPointerGet
      009E68 1E 11            [ 2] 3564 	ldw	x, (0x11, sp)
      009E6A 90 93            [ 1] 3565 	ldw	y, x
      009E6C 90 EE 20         [ 2] 3566 	ldw	y, (0x20, y)
      009E6F EE 1E            [ 2] 3567 	ldw	x, (0x1e, x)
                                   3568 ; genAssign
      009E71 17 1C            [ 2] 3569 	ldw	(0x1c, sp), y
      009E73 1F 1A            [ 2] 3570 	ldw	(0x1a, sp), x
                                   3571 ; genGoto
      009E75 CC 9E 8C         [ 2] 3572 	jp	00117$
                                   3573 ; genLabel
      009E78                       3574 00116$:
                           000D48  3575 	C$pff.c$1022$5_0$403 ==.
                                   3576 ;	../src/pff.c: 1022: clst = get_fat(fs->curr_clust);
                                   3577 ; genPointerGet
      009E78 1E 0F            [ 2] 3578 	ldw	x, (0x0f, sp)
      009E7A 90 93            [ 1] 3579 	ldw	y, x
      009E7C 90 EE 02         [ 2] 3580 	ldw	y, (0x2, y)
      009E7F FE               [ 2] 3581 	ldw	x, (x)
                                   3582 ; genIPush
      009E80 90 89            [ 2] 3583 	pushw	y
      009E82 89               [ 2] 3584 	pushw	x
                                   3585 ; genCall
      009E83 CD 92 29         [ 4] 3586 	call	_get_fat
      009E86 5B 04            [ 2] 3587 	addw	sp, #4
      009E88 17 1A            [ 2] 3588 	ldw	(0x1a, sp), y
                                   3589 ; genAssign
      009E8A 1F 1C            [ 2] 3590 	ldw	(0x1c, sp), x
                                   3591 ; genLabel
      009E8C                       3592 00117$:
                           000D5C  3593 	C$pff.c$1024$4_0$401 ==.
                                   3594 ;	../src/pff.c: 1024: if (clst <= 1) ABORT(FR_DISK_ERR);
                                   3595 ; genCmp
                                   3596 ; genCmpTop
      009E8C 5F               [ 1] 3597 	clrw	x
      009E8D 5C               [ 1] 3598 	incw	x
      009E8E 13 1C            [ 2] 3599 	cpw	x, (0x1c, sp)
      009E90 4F               [ 1] 3600 	clr	a
      009E91 12 1B            [ 1] 3601 	sbc	a, (0x1b, sp)
      009E93 4F               [ 1] 3602 	clr	a
      009E94 12 1A            [ 1] 3603 	sbc	a, (0x1a, sp)
      009E96 24 03            [ 1] 3604 	jrnc	00248$
      009E98 CC 9E A3         [ 2] 3605 	jp	00119$
      009E9B                       3606 00248$:
                                   3607 ; skipping generated iCode
                                   3608 ; genPointerSet
      009E9B 1E 0B            [ 2] 3609 	ldw	x, (0x0b, sp)
      009E9D 7F               [ 1] 3610 	clr	(x)
                                   3611 ; genReturn
      009E9E A6 01            [ 1] 3612 	ld	a, #0x01
      009EA0 CC 9F D9         [ 2] 3613 	jp	00139$
                                   3614 ; genLabel
      009EA3                       3615 00119$:
                           000D73  3616 	C$pff.c$1025$4_0$401 ==.
                                   3617 ;	../src/pff.c: 1025: fs->curr_clust = clst;				/* Update current cluster */
                                   3618 ; genPointerSet
      009EA3 1E 0F            [ 2] 3619 	ldw	x, (0x0f, sp)
      009EA5 16 1C            [ 2] 3620 	ldw	y, (0x1c, sp)
      009EA7 EF 02            [ 2] 3621 	ldw	(0x2, x), y
      009EA9 16 1A            [ 2] 3622 	ldw	y, (0x1a, sp)
      009EAB FF               [ 2] 3623 	ldw	(x), y
                                   3624 ; genLabel
      009EAC                       3625 00121$:
                           000D7C  3626 	C$pff.c$1027$3_0$400 ==.
                                   3627 ;	../src/pff.c: 1027: sect = clust2sect(fs->curr_clust);		/* Get current sector */
                                   3628 ; genPointerGet
      009EAC 1E 0F            [ 2] 3629 	ldw	x, (0x0f, sp)
      009EAE 90 93            [ 1] 3630 	ldw	y, x
      009EB0 90 EE 02         [ 2] 3631 	ldw	y, (0x2, y)
      009EB3 FE               [ 2] 3632 	ldw	x, (x)
                                   3633 ; genIPush
      009EB4 90 89            [ 2] 3634 	pushw	y
      009EB6 89               [ 2] 3635 	pushw	x
                                   3636 ; genCall
      009EB7 CD 92 E1         [ 4] 3637 	call	_clust2sect
      009EBA 5B 04            [ 2] 3638 	addw	sp, #4
                                   3639 ; genAssign
      009EBC 1F 19            [ 2] 3640 	ldw	(0x19, sp), x
      009EBE 17 17            [ 2] 3641 	ldw	(0x17, sp), y
                           000D90  3642 	C$pff.c$1028$3_0$400 ==.
                                   3643 ;	../src/pff.c: 1028: if (!sect) ABORT(FR_DISK_ERR);
                                   3644 ; genIfx
      009EC0 5D               [ 2] 3645 	tnzw	x
      009EC1 26 04            [ 1] 3646 	jrne	00249$
      009EC3 90 5D            [ 2] 3647 	tnzw	y
      009EC5 27 03            [ 1] 3648 	jreq	00250$
      009EC7                       3649 00249$:
      009EC7 CC 9E D2         [ 2] 3650 	jp	00123$
      009ECA                       3651 00250$:
                                   3652 ; genPointerSet
      009ECA 1E 0B            [ 2] 3653 	ldw	x, (0x0b, sp)
      009ECC 7F               [ 1] 3654 	clr	(x)
                                   3655 ; genReturn
      009ECD A6 01            [ 1] 3656 	ld	a, #0x01
      009ECF CC 9F D9         [ 2] 3657 	jp	00139$
                                   3658 ; genLabel
      009ED2                       3659 00123$:
                           000DA2  3660 	C$pff.c$1029$3_0$400 ==.
                                   3661 ;	../src/pff.c: 1029: fs->dsect = sect + cs;
                                   3662 ; genPlus
      009ED2 1E 07            [ 2] 3663 	ldw	x, (0x07, sp)
      009ED4 1C 00 26         [ 2] 3664 	addw	x, #0x0026
                                   3665 ; genCast
                                   3666 ; genAssign
      009ED7 90 5F            [ 1] 3667 	clrw	y
      009ED9 7B 1E            [ 1] 3668 	ld	a, (0x1e, sp)
      009EDB 90 97            [ 1] 3669 	ld	yl, a
      009EDD 4F               [ 1] 3670 	clr	a
      009EDE 0F 1B            [ 1] 3671 	clr	(0x1b, sp)
                                   3672 ; genPlus
      009EE0 72 F9 19         [ 2] 3673 	addw	y, (0x19, sp)
      009EE3 19 18            [ 1] 3674 	adc	a, (0x18, sp)
      009EE5 6B 02            [ 1] 3675 	ld	(0x02, sp), a
      009EE7 7B 1B            [ 1] 3676 	ld	a, (0x1b, sp)
      009EE9 19 17            [ 1] 3677 	adc	a, (0x17, sp)
      009EEB 6B 01            [ 1] 3678 	ld	(0x01, sp), a
                                   3679 ; genPointerSet
      009EED EF 02            [ 2] 3680 	ldw	(0x2, x), y
      009EEF 7B 02            [ 1] 3681 	ld	a, (0x02, sp)
      009EF1 E7 01            [ 1] 3682 	ld	(0x1, x), a
      009EF3 7B 01            [ 1] 3683 	ld	a, (0x01, sp)
      009EF5 F7               [ 1] 3684 	ld	(x), a
                           000DC6  3685 	C$pff.c$1030$3_0$400 ==.
                                   3686 ;	../src/pff.c: 1030: if (disk_writep(0, fs->dsect)) ABORT(FR_DISK_ERR);	/* Initiate a sector write operation */
                                   3687 ; genIPush
      009EF6 90 89            [ 2] 3688 	pushw	y
      009EF8 1E 03            [ 2] 3689 	ldw	x, (0x03, sp)
      009EFA 89               [ 2] 3690 	pushw	x
                                   3691 ; genIPush
      009EFB 5F               [ 1] 3692 	clrw	x
      009EFC 89               [ 2] 3693 	pushw	x
                                   3694 ; genCall
      009EFD CD 87 36         [ 4] 3695 	call	_disk_writep
      009F00 5B 06            [ 2] 3696 	addw	sp, #6
                                   3697 ; genIfx
      009F02 4D               [ 1] 3698 	tnz	a
      009F03 26 03            [ 1] 3699 	jrne	00251$
      009F05 CC 9F 10         [ 2] 3700 	jp	00125$
      009F08                       3701 00251$:
                                   3702 ; genPointerSet
      009F08 1E 0B            [ 2] 3703 	ldw	x, (0x0b, sp)
      009F0A 7F               [ 1] 3704 	clr	(x)
                                   3705 ; genReturn
      009F0B A6 01            [ 1] 3706 	ld	a, #0x01
      009F0D CC 9F D9         [ 2] 3707 	jp	00139$
                                   3708 ; genLabel
      009F10                       3709 00125$:
                           000DE0  3710 	C$pff.c$1031$3_0$400 ==.
                                   3711 ;	../src/pff.c: 1031: fs->flag |= FA__WIP;
                                   3712 ; genPointerGet
      009F10 1E 0B            [ 2] 3713 	ldw	x, (0x0b, sp)
      009F12 F6               [ 1] 3714 	ld	a, (x)
                                   3715 ; genOr
      009F13 AA 40            [ 1] 3716 	or	a, #0x40
                                   3717 ; genPointerSet
      009F15 1E 0B            [ 2] 3718 	ldw	x, (0x0b, sp)
      009F17 F7               [ 1] 3719 	ld	(x), a
                                   3720 ; genLabel
      009F18                       3721 00127$:
                           000DE8  3722 	C$pff.c$1033$2_0$399 ==.
                                   3723 ;	../src/pff.c: 1033: wcnt = 512 - (UINT)fs->fptr % 512;			/* Number of bytes to write to the sector */
                                   3724 ; genPointerGet
      009F18 1E 0D            [ 2] 3725 	ldw	x, (0x0d, sp)
      009F1A EE 02            [ 2] 3726 	ldw	x, (0x2, x)
                                   3727 ; genAssign
      009F1C 9E               [ 1] 3728 	ld	a, xh
                                   3729 ; genAnd
      009F1D A4 01            [ 1] 3730 	and	a, #0x01
      009F1F 6B 1D            [ 1] 3731 	ld	(0x1d, sp), a
                                   3732 ; genMinus
      009F21 9F               [ 1] 3733 	ld	a, xl
      009F22 40               [ 1] 3734 	neg	a
      009F23 97               [ 1] 3735 	ld	xl, a
      009F24 A6 02            [ 1] 3736 	ld	a, #0x02
      009F26 12 1D            [ 1] 3737 	sbc	a, (0x1d, sp)
      009F28 95               [ 1] 3738 	ld	xh, a
                                   3739 ; genAssign
      009F29 1F 17            [ 2] 3740 	ldw	(0x17, sp), x
                           000DFB  3741 	C$pff.c$1034$2_0$399 ==.
                                   3742 ;	../src/pff.c: 1034: if (wcnt > btw) wcnt = btw;
                                   3743 ; genCmp
                                   3744 ; genCmpTop
      009F2B 1E 17            [ 2] 3745 	ldw	x, (0x17, sp)
      009F2D 13 23            [ 2] 3746 	cpw	x, (0x23, sp)
      009F2F 22 03            [ 1] 3747 	jrugt	00252$
      009F31 CC 9F 38         [ 2] 3748 	jp	00129$
      009F34                       3749 00252$:
                                   3750 ; skipping generated iCode
                                   3751 ; genAssign
      009F34 16 23            [ 2] 3752 	ldw	y, (0x23, sp)
      009F36 17 17            [ 2] 3753 	ldw	(0x17, sp), y
                                   3754 ; genLabel
      009F38                       3755 00129$:
                           000E08  3756 	C$pff.c$1035$1_0$394 ==.
                                   3757 ;	../src/pff.c: 1035: if (disk_writep(p, wcnt)) ABORT(FR_DISK_ERR);	/* Send data to the sector */
                                   3758 ; genCast
                                   3759 ; genAssign
      009F38 16 17            [ 2] 3760 	ldw	y, (0x17, sp)
      009F3A 17 03            [ 2] 3761 	ldw	(0x03, sp), y
      009F3C 0F 02            [ 1] 3762 	clr	(0x02, sp)
      009F3E 0F 01            [ 1] 3763 	clr	(0x01, sp)
                                   3764 ; genIPush
      009F40 1E 03            [ 2] 3765 	ldw	x, (0x03, sp)
      009F42 89               [ 2] 3766 	pushw	x
      009F43 1E 03            [ 2] 3767 	ldw	x, (0x03, sp)
      009F45 89               [ 2] 3768 	pushw	x
                                   3769 ; genIPush
      009F46 1E 09            [ 2] 3770 	ldw	x, (0x09, sp)
      009F48 89               [ 2] 3771 	pushw	x
                                   3772 ; genCall
      009F49 CD 87 36         [ 4] 3773 	call	_disk_writep
      009F4C 5B 06            [ 2] 3774 	addw	sp, #6
                                   3775 ; genIfx
      009F4E 4D               [ 1] 3776 	tnz	a
      009F4F 26 03            [ 1] 3777 	jrne	00253$
      009F51 CC 9F 5C         [ 2] 3778 	jp	00131$
      009F54                       3779 00253$:
                                   3780 ; genPointerSet
      009F54 1E 0B            [ 2] 3781 	ldw	x, (0x0b, sp)
      009F56 7F               [ 1] 3782 	clr	(x)
                                   3783 ; genReturn
      009F57 A6 01            [ 1] 3784 	ld	a, #0x01
      009F59 CC 9F D9         [ 2] 3785 	jp	00139$
                                   3786 ; genLabel
      009F5C                       3787 00131$:
                           000E2C  3788 	C$pff.c$1036$2_0$399 ==.
                                   3789 ;	../src/pff.c: 1036: fs->fptr += wcnt; p += wcnt;				/* Update pointers and counters */
                                   3790 ; genPointerGet
      009F5C 1E 0D            [ 2] 3791 	ldw	x, (0x0d, sp)
      009F5E E6 03            [ 1] 3792 	ld	a, (0x3, x)
      009F60 88               [ 1] 3793 	push	a
      009F61 E6 02            [ 1] 3794 	ld	a, (0x2, x)
      009F63 90 95            [ 1] 3795 	ld	yh, a
      009F65 FE               [ 2] 3796 	ldw	x, (x)
      009F66 84               [ 1] 3797 	pop	a
                                   3798 ; genPlus
      009F67 1B 04            [ 1] 3799 	add	a, (0x04, sp)
      009F69 6B 1C            [ 1] 3800 	ld	(0x1c, sp), a
      009F6B 90 9E            [ 1] 3801 	ld	a, yh
      009F6D 19 03            [ 1] 3802 	adc	a, (0x03, sp)
      009F6F 6B 1B            [ 1] 3803 	ld	(0x1b, sp), a
      009F71 9F               [ 1] 3804 	ld	a, xl
      009F72 19 02            [ 1] 3805 	adc	a, (0x02, sp)
      009F74 6B 1A            [ 1] 3806 	ld	(0x1a, sp), a
      009F76 9E               [ 1] 3807 	ld	a, xh
      009F77 19 01            [ 1] 3808 	adc	a, (0x01, sp)
      009F79 6B 19            [ 1] 3809 	ld	(0x19, sp), a
                                   3810 ; genPointerSet
      009F7B 1E 0D            [ 2] 3811 	ldw	x, (0x0d, sp)
      009F7D 16 1B            [ 2] 3812 	ldw	y, (0x1b, sp)
      009F7F EF 02            [ 2] 3813 	ldw	(0x2, x), y
      009F81 16 19            [ 2] 3814 	ldw	y, (0x19, sp)
      009F83 FF               [ 2] 3815 	ldw	(x), y
                                   3816 ; genPlus
      009F84 1E 05            [ 2] 3817 	ldw	x, (0x05, sp)
      009F86 72 FB 17         [ 2] 3818 	addw	x, (0x17, sp)
                                   3819 ; genAssign
      009F89 1F 05            [ 2] 3820 	ldw	(0x05, sp), x
                           000E5B  3821 	C$pff.c$1037$2_0$399 ==.
                                   3822 ;	../src/pff.c: 1037: btw -= wcnt; *bw += wcnt;
                                   3823 ; genMinus
      009F8B 1E 23            [ 2] 3824 	ldw	x, (0x23, sp)
      009F8D 72 F0 17         [ 2] 3825 	subw	x, (0x17, sp)
                                   3826 ; genAssign
      009F90 1F 23            [ 2] 3827 	ldw	(0x23, sp), x
                                   3828 ; genPointerGet
      009F92 1E 09            [ 2] 3829 	ldw	x, (0x09, sp)
      009F94 FE               [ 2] 3830 	ldw	x, (x)
                                   3831 ; genPlus
      009F95 72 FB 17         [ 2] 3832 	addw	x, (0x17, sp)
      009F98 1F 1D            [ 2] 3833 	ldw	(0x1d, sp), x
                                   3834 ; genPointerSet
      009F9A 1E 09            [ 2] 3835 	ldw	x, (0x09, sp)
      009F9C 16 1D            [ 2] 3836 	ldw	y, (0x1d, sp)
      009F9E FF               [ 2] 3837 	ldw	(x), y
                           000E6F  3838 	C$pff.c$1038$2_0$399 ==.
                                   3839 ;	../src/pff.c: 1038: if ((UINT)fs->fptr % 512 == 0) {
                                   3840 ; genCast
                                   3841 ; genAssign
      009F9F 16 1B            [ 2] 3842 	ldw	y, (0x1b, sp)
      009FA1 17 1D            [ 2] 3843 	ldw	(0x1d, sp), y
                                   3844 ; genAnd
      009FA3 7B 1E            [ 1] 3845 	ld	a, (0x1e, sp)
      009FA5 6B 1C            [ 1] 3846 	ld	(0x1c, sp), a
      009FA7 7B 1D            [ 1] 3847 	ld	a, (0x1d, sp)
      009FA9 A4 01            [ 1] 3848 	and	a, #0x01
      009FAB 6B 1B            [ 1] 3849 	ld	(0x1b, sp), a
                                   3850 ; genIfx
      009FAD 1E 1B            [ 2] 3851 	ldw	x, (0x1b, sp)
      009FAF 27 03            [ 1] 3852 	jreq	00254$
      009FB1 CC 9E 0C         [ 2] 3853 	jp	00136$
      009FB4                       3854 00254$:
                           000E84  3855 	C$pff.c$1039$3_0$408 ==.
                                   3856 ;	../src/pff.c: 1039: if (disk_writep(0, 0)) ABORT(FR_DISK_ERR);	/* Finalize the currtent secter write operation */
                                   3857 ; genIPush
      009FB4 5F               [ 1] 3858 	clrw	x
      009FB5 89               [ 2] 3859 	pushw	x
      009FB6 5F               [ 1] 3860 	clrw	x
      009FB7 89               [ 2] 3861 	pushw	x
                                   3862 ; genIPush
      009FB8 5F               [ 1] 3863 	clrw	x
      009FB9 89               [ 2] 3864 	pushw	x
                                   3865 ; genCall
      009FBA CD 87 36         [ 4] 3866 	call	_disk_writep
      009FBD 5B 06            [ 2] 3867 	addw	sp, #6
                                   3868 ; genIfx
      009FBF 4D               [ 1] 3869 	tnz	a
      009FC0 26 03            [ 1] 3870 	jrne	00255$
      009FC2 CC 9F CD         [ 2] 3871 	jp	00133$
      009FC5                       3872 00255$:
                                   3873 ; genPointerSet
      009FC5 1E 0B            [ 2] 3874 	ldw	x, (0x0b, sp)
      009FC7 7F               [ 1] 3875 	clr	(x)
                                   3876 ; genReturn
      009FC8 A6 01            [ 1] 3877 	ld	a, #0x01
      009FCA CC 9F D9         [ 2] 3878 	jp	00139$
                                   3879 ; genLabel
      009FCD                       3880 00133$:
                           000E9D  3881 	C$pff.c$1040$3_0$408 ==.
                                   3882 ;	../src/pff.c: 1040: fs->flag &= ~FA__WIP;
                                   3883 ; genPointerGet
      009FCD 1E 0B            [ 2] 3884 	ldw	x, (0x0b, sp)
      009FCF F6               [ 1] 3885 	ld	a, (x)
                                   3886 ; genAnd
      009FD0 A4 BF            [ 1] 3887 	and	a, #0xbf
                                   3888 ; genPointerSet
      009FD2 1E 0B            [ 2] 3889 	ldw	x, (0x0b, sp)
      009FD4 F7               [ 1] 3890 	ld	(x), a
                                   3891 ; genGoto
      009FD5 CC 9E 0C         [ 2] 3892 	jp	00136$
                                   3893 ; genLabel
      009FD8                       3894 00138$:
                           000EA8  3895 	C$pff.c$1044$1_0$394 ==.
                                   3896 ;	../src/pff.c: 1044: return FR_OK;
                                   3897 ; genReturn
      009FD8 4F               [ 1] 3898 	clr	a
                                   3899 ; genLabel
      009FD9                       3900 00139$:
                           000EA9  3901 	C$pff.c$1045$1_0$394 ==.
                                   3902 ;	../src/pff.c: 1045: }
                                   3903 ; genEndFunction
      009FD9 5B 1E            [ 2] 3904 	addw	sp, #30
                           000EAB  3905 	C$pff.c$1045$1_0$394 ==.
                           000EAB  3906 	XG$pf_write$0$0 ==.
      009FDB 81               [ 4] 3907 	ret
                                   3908 	.area CODE
                                   3909 	.area CONST
                                   3910 	.area INITIALIZER
                                   3911 	.area CABS (ABS)
