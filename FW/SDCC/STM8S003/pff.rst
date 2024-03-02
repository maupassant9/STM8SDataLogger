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
      000261                         22 _FatFs:
      000261                         23 	.ds 2
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
      008EED                         61 _ld_word:
      008EED 89               [ 2]   62 	pushw	x
                                     63 ;	../src/pff.c: 388: rv = ptr[1];
      008EEE 1E 05            [ 2]   64 	ldw	x, (0x05, sp)
      008EF0 E6 01            [ 1]   65 	ld	a, (0x1, x)
                                     66 ;	../src/pff.c: 389: rv = rv << 8 | ptr[0];
      008EF2 6B 01            [ 1]   67 	ld	(0x01, sp), a
      008EF4 0F 02            [ 1]   68 	clr	(0x02, sp)
      008EF6 1E 05            [ 2]   69 	ldw	x, (0x05, sp)
      008EF8 F6               [ 1]   70 	ld	a, (x)
      008EF9 5F               [ 1]   71 	clrw	x
      008EFA 1A 02            [ 1]   72 	or	a, (0x02, sp)
      008EFC 02               [ 1]   73 	rlwa	x
      008EFD 1A 01            [ 1]   74 	or	a, (0x01, sp)
                                     75 ;	../src/pff.c: 390: return rv;
      008EFF 95               [ 1]   76 	ld	xh, a
                                     77 ;	../src/pff.c: 391: }
      008F00 5B 02            [ 2]   78 	addw	sp, #2
      008F02 81               [ 4]   79 	ret
                                     80 ;	../src/pff.c: 393: static DWORD ld_dword (const BYTE* ptr)	/* Load a 4-byte little-endian word */
                                     81 ;	-----------------------------------------
                                     82 ;	 function ld_dword
                                     83 ;	-----------------------------------------
      008F03                         84 _ld_dword:
      008F03 52 08            [ 2]   85 	sub	sp, #8
                                     86 ;	../src/pff.c: 397: rv = ptr[3];
      008F05 1E 0B            [ 2]   87 	ldw	x, (0x0b, sp)
      008F07 E6 03            [ 1]   88 	ld	a, (0x3, x)
      008F09 5F               [ 1]   89 	clrw	x
      008F0A 90 5F            [ 1]   90 	clrw	y
      008F0C 97               [ 1]   91 	ld	xl, a
                                     92 ;	../src/pff.c: 398: rv = rv << 8 | ptr[2];
      008F0D 1F 02            [ 2]   93 	ldw	(0x02, sp), x
      008F0F 0F 04            [ 1]   94 	clr	(0x04, sp)
      008F11 1E 0B            [ 2]   95 	ldw	x, (0x0b, sp)
      008F13 E6 02            [ 1]   96 	ld	a, (0x2, x)
      008F15 0F 07            [ 1]   97 	clr	(0x07, sp)
      008F17 5F               [ 1]   98 	clrw	x
      008F18 0F 05            [ 1]   99 	clr	(0x05, sp)
      008F1A 1A 04            [ 1]  100 	or	a, (0x04, sp)
      008F1C 95               [ 1]  101 	ld	xh, a
      008F1D 7B 03            [ 1]  102 	ld	a, (0x03, sp)
      008F1F 1A 07            [ 1]  103 	or	a, (0x07, sp)
      008F21 90 95            [ 1]  104 	ld	yh, a
      008F23 89               [ 2]  105 	pushw	x
      008F24 7B 04            [ 1]  106 	ld	a, (0x04, sp)
      008F26 1A 02            [ 1]  107 	or	a, (2, sp)
      008F28 85               [ 2]  108 	popw	x
      008F29 97               [ 1]  109 	ld	xl, a
      008F2A 90 9F            [ 1]  110 	ld	a, yl
      008F2C 1A 05            [ 1]  111 	or	a, (0x05, sp)
      008F2E 01               [ 1]  112 	rrwa	x
                                    113 ;	../src/pff.c: 399: rv = rv << 8 | ptr[1];
      008F2F 6B 01            [ 1]  114 	ld	(0x01, sp), a
      008F31 61               [ 1]  115 	exg	a, yl
      008F32 9F               [ 1]  116 	ld	a, xl
      008F33 61               [ 1]  117 	exg	a, yl
      008F34 0F 04            [ 1]  118 	clr	(0x04, sp)
      008F36 1E 0B            [ 2]  119 	ldw	x, (0x0b, sp)
      008F38 E6 01            [ 1]  120 	ld	a, (0x1, x)
      008F3A 5F               [ 1]  121 	clrw	x
      008F3B 0F 06            [ 1]  122 	clr	(0x06, sp)
      008F3D 0F 05            [ 1]  123 	clr	(0x05, sp)
      008F3F 1A 04            [ 1]  124 	or	a, (0x04, sp)
      008F41 97               [ 1]  125 	ld	xl, a
      008F42 89               [ 2]  126 	pushw	x
      008F43 90 9F            [ 1]  127 	ld	a, yl
      008F45 1A 01            [ 1]  128 	or	a, (1, sp)
      008F47 85               [ 2]  129 	popw	x
      008F48 95               [ 1]  130 	ld	xh, a
      008F49 90 9E            [ 1]  131 	ld	a, yh
      008F4B 1A 06            [ 1]  132 	or	a, (0x06, sp)
      008F4D 90 97            [ 1]  133 	ld	yl, a
                                    134 ;	../src/pff.c: 400: rv = rv << 8 | ptr[0];
      008F4F 1F 02            [ 2]  135 	ldw	(0x02, sp), x
      008F51 0F 04            [ 1]  136 	clr	(0x04, sp)
      008F53 1E 0B            [ 2]  137 	ldw	x, (0x0b, sp)
      008F55 F6               [ 1]  138 	ld	a, (x)
      008F56 0F 07            [ 1]  139 	clr	(0x07, sp)
      008F58 5F               [ 1]  140 	clrw	x
      008F59 0F 05            [ 1]  141 	clr	(0x05, sp)
      008F5B 1A 04            [ 1]  142 	or	a, (0x04, sp)
      008F5D 95               [ 1]  143 	ld	xh, a
      008F5E 7B 03            [ 1]  144 	ld	a, (0x03, sp)
      008F60 1A 07            [ 1]  145 	or	a, (0x07, sp)
      008F62 90 95            [ 1]  146 	ld	yh, a
      008F64 89               [ 2]  147 	pushw	x
      008F65 7B 04            [ 1]  148 	ld	a, (0x04, sp)
      008F67 1A 02            [ 1]  149 	or	a, (2, sp)
      008F69 85               [ 2]  150 	popw	x
      008F6A 97               [ 1]  151 	ld	xl, a
      008F6B 90 9F            [ 1]  152 	ld	a, yl
      008F6D 1A 05            [ 1]  153 	or	a, (0x05, sp)
      008F6F 61               [ 1]  154 	exg	a, yl
      008F70 9E               [ 1]  155 	ld	a, xh
      008F71 61               [ 1]  156 	exg	a, yl
      008F72 95               [ 1]  157 	ld	xh, a
                                    158 ;	../src/pff.c: 401: return rv;
      008F73 51               [ 1]  159 	exgw	x, y
                                    160 ;	../src/pff.c: 402: }
      008F74 5B 08            [ 2]  161 	addw	sp, #8
      008F76 81               [ 4]  162 	ret
                                    163 ;	../src/pff.c: 411: static void mem_set (void* dst, int val, int cnt) {
                                    164 ;	-----------------------------------------
                                    165 ;	 function mem_set
                                    166 ;	-----------------------------------------
      008F77                        167 _mem_set:
      008F77 89               [ 2]  168 	pushw	x
                                    169 ;	../src/pff.c: 412: char *d = (char*)dst;
      008F78 1E 05            [ 2]  170 	ldw	x, (0x05, sp)
                                    171 ;	../src/pff.c: 413: while (cnt--) *d++ = (char)val;
      008F7A 1F 01            [ 2]  172 	ldw	(0x01, sp), x
      008F7C 16 09            [ 2]  173 	ldw	y, (0x09, sp)
      008F7E                        174 00101$:
      008F7E 93               [ 1]  175 	ldw	x, y
      008F7F 90 5A            [ 2]  176 	decw	y
      008F81 5D               [ 2]  177 	tnzw	x
      008F82 27 0C            [ 1]  178 	jreq	00104$
      008F84 7B 08            [ 1]  179 	ld	a, (0x08, sp)
      008F86 1E 01            [ 2]  180 	ldw	x, (0x01, sp)
      008F88 F7               [ 1]  181 	ld	(x), a
      008F89 1E 01            [ 2]  182 	ldw	x, (0x01, sp)
      008F8B 5C               [ 1]  183 	incw	x
      008F8C 1F 01            [ 2]  184 	ldw	(0x01, sp), x
      008F8E 20 EE            [ 2]  185 	jra	00101$
      008F90                        186 00104$:
                                    187 ;	../src/pff.c: 414: }
      008F90 85               [ 2]  188 	popw	x
      008F91 81               [ 4]  189 	ret
                                    190 ;	../src/pff.c: 417: static int mem_cmp (const void* dst, const void* src, int cnt) {
                                    191 ;	-----------------------------------------
                                    192 ;	 function mem_cmp
                                    193 ;	-----------------------------------------
      008F92                        194 _mem_cmp:
      008F92 52 0A            [ 2]  195 	sub	sp, #10
                                    196 ;	../src/pff.c: 418: const char *d = (const char *)dst, *s = (const char *)src;
      008F94 16 0D            [ 2]  197 	ldw	y, (0x0d, sp)
      008F96 1E 0F            [ 2]  198 	ldw	x, (0x0f, sp)
                                    199 ;	../src/pff.c: 419: int r = 0;
      008F98 0F 02            [ 1]  200 	clr	(0x02, sp)
      008F9A 0F 01            [ 1]  201 	clr	(0x01, sp)
                                    202 ;	../src/pff.c: 420: while (cnt-- && (r = *d++ - *s++) == 0) ;
      008F9C 17 05            [ 2]  203 	ldw	(0x05, sp), y
      008F9E 1F 07            [ 2]  204 	ldw	(0x07, sp), x
      008FA0 16 11            [ 2]  205 	ldw	y, (0x11, sp)
      008FA2 17 09            [ 2]  206 	ldw	(0x09, sp), y
      008FA4                        207 00102$:
      008FA4 16 09            [ 2]  208 	ldw	y, (0x09, sp)
      008FA6 17 03            [ 2]  209 	ldw	(0x03, sp), y
      008FA8 1E 09            [ 2]  210 	ldw	x, (0x09, sp)
      008FAA 5A               [ 2]  211 	decw	x
      008FAB 1F 09            [ 2]  212 	ldw	(0x09, sp), x
      008FAD 1E 03            [ 2]  213 	ldw	x, (0x03, sp)
      008FAF 27 20            [ 1]  214 	jreq	00104$
      008FB1 1E 05            [ 2]  215 	ldw	x, (0x05, sp)
      008FB3 F6               [ 1]  216 	ld	a, (x)
      008FB4 1E 05            [ 2]  217 	ldw	x, (0x05, sp)
      008FB6 5C               [ 1]  218 	incw	x
      008FB7 1F 05            [ 2]  219 	ldw	(0x05, sp), x
      008FB9 5F               [ 1]  220 	clrw	x
      008FBA 97               [ 1]  221 	ld	xl, a
      008FBB 16 07            [ 2]  222 	ldw	y, (0x07, sp)
      008FBD 90 F6            [ 1]  223 	ld	a, (y)
      008FBF 16 07            [ 2]  224 	ldw	y, (0x07, sp)
      008FC1 90 5C            [ 1]  225 	incw	y
      008FC3 17 07            [ 2]  226 	ldw	(0x07, sp), y
      008FC5 6B 04            [ 1]  227 	ld	(0x04, sp), a
      008FC7 0F 03            [ 1]  228 	clr	(0x03, sp)
      008FC9 72 F0 03         [ 2]  229 	subw	x, (0x03, sp)
      008FCC 1F 01            [ 2]  230 	ldw	(0x01, sp), x
      008FCE 5D               [ 2]  231 	tnzw	x
      008FCF 27 D3            [ 1]  232 	jreq	00102$
      008FD1                        233 00104$:
                                    234 ;	../src/pff.c: 421: return r;
      008FD1 1E 01            [ 2]  235 	ldw	x, (0x01, sp)
                                    236 ;	../src/pff.c: 422: }
      008FD3 5B 0A            [ 2]  237 	addw	sp, #10
      008FD5 81               [ 4]  238 	ret
                                    239 ;	../src/pff.c: 430: static CLUST get_fat (	/* 1:IO error, Else:Cluster status */
                                    240 ;	-----------------------------------------
                                    241 ;	 function get_fat
                                    242 ;	-----------------------------------------
      008FD6                        243 _get_fat:
      008FD6 52 12            [ 2]  244 	sub	sp, #18
                                    245 ;	../src/pff.c: 435: FATFS *fs = FatFs;
      008FD8 90 CE 02 61      [ 2]  246 	ldw	y, _FatFs+0
                                    247 ;	../src/pff.c: 440: if (clst < 2 || clst >= fs->n_fatent) return 1;	/* Range check */
      008FDC 1E 17            [ 2]  248 	ldw	x, (0x17, sp)
      008FDE A3 00 02         [ 2]  249 	cpw	x, #0x0002
      008FE1 7B 16            [ 1]  250 	ld	a, (0x16, sp)
      008FE3 A2 00            [ 1]  251 	sbc	a, #0x00
      008FE5 7B 15            [ 1]  252 	ld	a, (0x15, sp)
      008FE7 A2 00            [ 1]  253 	sbc	a, #0x00
      008FE9 25 1B            [ 1]  254 	jrc	00101$
      008FEB 93               [ 1]  255 	ldw	x, y
      008FEC E6 09            [ 1]  256 	ld	a, (0x9, x)
      008FEE 6B 12            [ 1]  257 	ld	(0x12, sp), a
      008FF0 E6 08            [ 1]  258 	ld	a, (0x8, x)
      008FF2 6B 11            [ 1]  259 	ld	(0x11, sp), a
      008FF4 EE 06            [ 2]  260 	ldw	x, (0x6, x)
      008FF6 1F 0F            [ 2]  261 	ldw	(0x0f, sp), x
      008FF8 1E 17            [ 2]  262 	ldw	x, (0x17, sp)
      008FFA 13 11            [ 2]  263 	cpw	x, (0x11, sp)
      008FFC 7B 16            [ 1]  264 	ld	a, (0x16, sp)
      008FFE 12 10            [ 1]  265 	sbc	a, (0x10, sp)
      009000 7B 15            [ 1]  266 	ld	a, (0x15, sp)
      009002 12 0F            [ 1]  267 	sbc	a, (0x0f, sp)
      009004 25 06            [ 1]  268 	jrc	00102$
      009006                        269 00101$:
      009006 5F               [ 1]  270 	clrw	x
      009007 5C               [ 1]  271 	incw	x
      009008 90 5F            [ 1]  272 	clrw	y
      00900A 20 6E            [ 2]  273 	jra	00108$
      00900C                        274 00102$:
                                    275 ;	../src/pff.c: 442: switch (fs->fs_type) {
      00900C 90 F6            [ 1]  276 	ld	a, (y)
      00900E A1 03            [ 1]  277 	cp	a, #0x03
      009010 26 64            [ 1]  278 	jrne	00107$
                                    279 ;	../src/pff.c: 464: if (disk_readp(buf, fs->fatbase + clst / 128, ((UINT)clst % 128) * 4, 4)) break;
      009012 1E 17            [ 2]  280 	ldw	x, (0x17, sp)
      009014 9F               [ 1]  281 	ld	a, xl
      009015 A4 7F            [ 1]  282 	and	a, #0x7f
      009017 97               [ 1]  283 	ld	xl, a
      009018 4F               [ 1]  284 	clr	a
      009019 95               [ 1]  285 	ld	xh, a
      00901A 58               [ 2]  286 	sllw	x
      00901B 58               [ 2]  287 	sllw	x
      00901C 1F 05            [ 2]  288 	ldw	(0x05, sp), x
      00901E 93               [ 1]  289 	ldw	x, y
      00901F E6 0D            [ 1]  290 	ld	a, (0xd, x)
      009021 6B 0A            [ 1]  291 	ld	(0x0a, sp), a
      009023 E6 0C            [ 1]  292 	ld	a, (0xc, x)
      009025 EE 0A            [ 2]  293 	ldw	x, (0xa, x)
      009027 1F 07            [ 2]  294 	ldw	(0x07, sp), x
      009029 1E 17            [ 2]  295 	ldw	x, (0x17, sp)
      00902B 16 15            [ 2]  296 	ldw	y, (0x15, sp)
      00902D 88               [ 1]  297 	push	a
      00902E 4F               [ 1]  298 	clr	a
      00902F 90 01            [ 1]  299 	rrwa	y
      009031 01               [ 1]  300 	rrwa	x
      009032 48               [ 1]  301 	sll	a
      009033 59               [ 2]  302 	rlcw	x
      009034 90 59            [ 2]  303 	rlcw	y
      009036 84               [ 1]  304 	pop	a
      009037 1F 0D            [ 2]  305 	ldw	(0x0d, sp), x
      009039 95               [ 1]  306 	ld	xh, a
      00903A 41               [ 1]  307 	exg	a, xl
      00903B 7B 0A            [ 1]  308 	ld	a, (0x0a, sp)
      00903D 41               [ 1]  309 	exg	a, xl
      00903E 72 FB 0D         [ 2]  310 	addw	x, (0x0d, sp)
      009041 90 9F            [ 1]  311 	ld	a, yl
      009043 19 08            [ 1]  312 	adc	a, (0x08, sp)
      009045 6B 10            [ 1]  313 	ld	(0x10, sp), a
      009047 90 9E            [ 1]  314 	ld	a, yh
      009049 19 07            [ 1]  315 	adc	a, (0x07, sp)
      00904B 6B 0F            [ 1]  316 	ld	(0x0f, sp), a
      00904D 4B 04            [ 1]  317 	push	#0x04
      00904F 4B 00            [ 1]  318 	push	#0x00
      009051 16 07            [ 2]  319 	ldw	y, (0x07, sp)
      009053 90 89            [ 2]  320 	pushw	y
      009055 89               [ 2]  321 	pushw	x
      009056 1E 15            [ 2]  322 	ldw	x, (0x15, sp)
      009058 89               [ 2]  323 	pushw	x
      009059 96               [ 1]  324 	ldw	x, sp
      00905A 1C 00 09         [ 2]  325 	addw	x, #9
      00905D 89               [ 2]  326 	pushw	x
      00905E CD 82 84         [ 4]  327 	call	_disk_readp
      009061 5B 0A            [ 2]  328 	addw	sp, #10
      009063 4D               [ 1]  329 	tnz	a
      009064 26 10            [ 1]  330 	jrne	00107$
                                    331 ;	../src/pff.c: 465: return ld_dword(buf) & 0x0FFFFFFF;
      009066 96               [ 1]  332 	ldw	x, sp
      009067 5C               [ 1]  333 	incw	x
      009068 89               [ 2]  334 	pushw	x
      009069 CD 8F 03         [ 4]  335 	call	_ld_dword
      00906C 5B 02            [ 2]  336 	addw	sp, #2
      00906E 90 9E            [ 1]  337 	ld	a, yh
      009070 A4 0F            [ 1]  338 	and	a, #0x0f
      009072 90 95            [ 1]  339 	ld	yh, a
      009074 20 04            [ 2]  340 	jra	00108$
                                    341 ;	../src/pff.c: 467: }
      009076                        342 00107$:
                                    343 ;	../src/pff.c: 469: return 1;	/* An error occured at the disk I/O layer */
      009076 5F               [ 1]  344 	clrw	x
      009077 5C               [ 1]  345 	incw	x
      009078 90 5F            [ 1]  346 	clrw	y
      00907A                        347 00108$:
                                    348 ;	../src/pff.c: 470: }
      00907A 5B 12            [ 2]  349 	addw	sp, #18
      00907C 81               [ 4]  350 	ret
                                    351 ;	../src/pff.c: 479: static DWORD clust2sect (	/* !=0: Sector number, 0: Failed - invalid cluster# */
                                    352 ;	-----------------------------------------
                                    353 ;	 function clust2sect
                                    354 ;	-----------------------------------------
      00907D                        355 _clust2sect:
      00907D 52 08            [ 2]  356 	sub	sp, #8
                                    357 ;	../src/pff.c: 483: FATFS *fs = FatFs;
      00907F CE 02 61         [ 2]  358 	ldw	x, _FatFs+0
      009082 1F 07            [ 2]  359 	ldw	(0x07, sp), x
                                    360 ;	../src/pff.c: 486: clst -= 2;
      009084 1E 0D            [ 2]  361 	ldw	x, (0x0d, sp)
      009086 1D 00 02         [ 2]  362 	subw	x, #0x0002
      009089 16 0B            [ 2]  363 	ldw	y, (0x0b, sp)
      00908B 24 02            [ 1]  364 	jrnc	00110$
      00908D 90 5A            [ 2]  365 	decw	y
      00908F                        366 00110$:
      00908F 1F 0D            [ 2]  367 	ldw	(0x0d, sp), x
      009091 17 0B            [ 2]  368 	ldw	(0x0b, sp), y
                                    369 ;	../src/pff.c: 487: if (clst >= (fs->n_fatent - 2)) return 0;		/* Invalid cluster# */
      009093 1E 07            [ 2]  370 	ldw	x, (0x07, sp)
      009095 90 93            [ 1]  371 	ldw	y, x
      009097 90 EE 08         [ 2]  372 	ldw	y, (0x8, y)
      00909A EE 06            [ 2]  373 	ldw	x, (0x6, x)
      00909C 72 A2 00 02      [ 2]  374 	subw	y, #0x0002
      0090A0 17 05            [ 2]  375 	ldw	(0x05, sp), y
      0090A2 24 01            [ 1]  376 	jrnc	00111$
      0090A4 5A               [ 2]  377 	decw	x
      0090A5                        378 00111$:
      0090A5 1F 03            [ 2]  379 	ldw	(0x03, sp), x
      0090A7 1E 0D            [ 2]  380 	ldw	x, (0x0d, sp)
      0090A9 13 05            [ 2]  381 	cpw	x, (0x05, sp)
      0090AB 7B 0C            [ 1]  382 	ld	a, (0x0c, sp)
      0090AD 12 04            [ 1]  383 	sbc	a, (0x04, sp)
      0090AF 7B 0B            [ 1]  384 	ld	a, (0x0b, sp)
      0090B1 12 03            [ 1]  385 	sbc	a, (0x03, sp)
      0090B3 25 05            [ 1]  386 	jrc	00102$
      0090B5 5F               [ 1]  387 	clrw	x
      0090B6 90 5F            [ 1]  388 	clrw	y
      0090B8 20 32            [ 2]  389 	jra	00103$
      0090BA                        390 00102$:
                                    391 ;	../src/pff.c: 488: return (DWORD)clst * fs->csize + fs->database;
      0090BA 1E 07            [ 2]  392 	ldw	x, (0x07, sp)
      0090BC E6 02            [ 1]  393 	ld	a, (0x2, x)
      0090BE 5F               [ 1]  394 	clrw	x
      0090BF 97               [ 1]  395 	ld	xl, a
      0090C0 90 5F            [ 1]  396 	clrw	y
      0090C2 89               [ 2]  397 	pushw	x
      0090C3 90 89            [ 2]  398 	pushw	y
      0090C5 1E 11            [ 2]  399 	ldw	x, (0x11, sp)
      0090C7 89               [ 2]  400 	pushw	x
      0090C8 1E 11            [ 2]  401 	ldw	x, (0x11, sp)
      0090CA 89               [ 2]  402 	pushw	x
      0090CB CD 9C 90         [ 4]  403 	call	__mullong
      0090CE 5B 08            [ 2]  404 	addw	sp, #8
      0090D0 1F 03            [ 2]  405 	ldw	(0x03, sp), x
      0090D2 17 01            [ 2]  406 	ldw	(0x01, sp), y
      0090D4 1E 07            [ 2]  407 	ldw	x, (0x07, sp)
      0090D6 90 93            [ 1]  408 	ldw	y, x
      0090D8 90 EE 14         [ 2]  409 	ldw	y, (0x14, y)
      0090DB EE 12            [ 2]  410 	ldw	x, (0x12, x)
      0090DD 1F 05            [ 2]  411 	ldw	(0x05, sp), x
      0090DF 93               [ 1]  412 	ldw	x, y
      0090E0 72 FB 03         [ 2]  413 	addw	x, (0x03, sp)
      0090E3 16 05            [ 2]  414 	ldw	y, (0x05, sp)
      0090E5 24 02            [ 1]  415 	jrnc	00113$
      0090E7 90 5C            [ 1]  416 	incw	y
      0090E9                        417 00113$:
      0090E9 72 F9 01         [ 2]  418 	addw	y, (0x01, sp)
      0090EC                        419 00103$:
                                    420 ;	../src/pff.c: 489: }
      0090EC 5B 08            [ 2]  421 	addw	sp, #8
      0090EE 81               [ 4]  422 	ret
                                    423 ;	../src/pff.c: 492: static CLUST get_clust (
                                    424 ;	-----------------------------------------
                                    425 ;	 function get_clust
                                    426 ;	-----------------------------------------
      0090EF                        427 _get_clust:
      0090EF 52 04            [ 2]  428 	sub	sp, #4
                                    429 ;	../src/pff.c: 501: clst = ld_word(dir+DIR_FstClusHI);
      0090F1 1E 07            [ 2]  430 	ldw	x, (0x07, sp)
      0090F3 1C 00 14         [ 2]  431 	addw	x, #0x0014
      0090F6 89               [ 2]  432 	pushw	x
      0090F7 CD 8E ED         [ 4]  433 	call	_ld_word
      0090FA 5B 02            [ 2]  434 	addw	sp, #2
      0090FC 51               [ 1]  435 	exgw	x, y
                                    436 ;	../src/pff.c: 502: clst <<= 16;
      0090FD 5F               [ 1]  437 	clrw	x
      0090FE 1F 03            [ 2]  438 	ldw	(0x03, sp), x
      009100 17 01            [ 2]  439 	ldw	(0x01, sp), y
                                    440 ;	../src/pff.c: 504: clst |= ld_word(dir+DIR_FstClusLO);
      009102 1E 07            [ 2]  441 	ldw	x, (0x07, sp)
      009104 1C 00 1A         [ 2]  442 	addw	x, #0x001a
      009107 89               [ 2]  443 	pushw	x
      009108 CD 8E ED         [ 4]  444 	call	_ld_word
      00910B 5B 02            [ 2]  445 	addw	sp, #2
      00910D 4F               [ 1]  446 	clr	a
      00910E 90 5F            [ 1]  447 	clrw	y
      009110 1A 02            [ 1]  448 	or	a, (0x02, sp)
      009112 90 97            [ 1]  449 	ld	yl, a
      009114 9F               [ 1]  450 	ld	a, xl
      009115 1A 04            [ 1]  451 	or	a, (0x04, sp)
      009117 02               [ 1]  452 	rlwa	x
      009118 1A 03            [ 1]  453 	or	a, (0x03, sp)
      00911A 95               [ 1]  454 	ld	xh, a
      00911B 90 9E            [ 1]  455 	ld	a, yh
      00911D 1A 01            [ 1]  456 	or	a, (0x01, sp)
                                    457 ;	../src/pff.c: 506: return clst;
      00911F 90 95            [ 1]  458 	ld	yh, a
                                    459 ;	../src/pff.c: 507: }
      009121 5B 04            [ 2]  460 	addw	sp, #4
      009123 81               [ 4]  461 	ret
                                    462 ;	../src/pff.c: 514: static FRESULT dir_rewind (
                                    463 ;	-----------------------------------------
                                    464 ;	 function dir_rewind
                                    465 ;	-----------------------------------------
      009124                        466 _dir_rewind:
      009124 52 0C            [ 2]  467 	sub	sp, #12
                                    468 ;	../src/pff.c: 519: FATFS *fs = FatFs;
      009126 CE 02 61         [ 2]  469 	ldw	x, _FatFs+0
      009129 1F 07            [ 2]  470 	ldw	(0x07, sp), x
                                    471 ;	../src/pff.c: 522: dj->index = 0;
      00912B 16 0F            [ 2]  472 	ldw	y, (0x0f, sp)
      00912D 17 05            [ 2]  473 	ldw	(0x05, sp), y
      00912F 93               [ 1]  474 	ldw	x, y
      009130 6F 01            [ 1]  475 	clr	(0x1, x)
      009132 7F               [ 1]  476 	clr	(x)
                                    477 ;	../src/pff.c: 523: clst = dj->sclust;
      009133 1E 05            [ 2]  478 	ldw	x, (0x05, sp)
      009135 90 93            [ 1]  479 	ldw	y, x
      009137 90 EE 06         [ 2]  480 	ldw	y, (0x6, y)
      00913A EE 04            [ 2]  481 	ldw	x, (0x4, x)
      00913C 17 0B            [ 2]  482 	ldw	(0x0b, sp), y
      00913E 1F 09            [ 2]  483 	ldw	(0x09, sp), x
                                    484 ;	../src/pff.c: 524: if (clst == 1 || clst >= fs->n_fatent) {	/* Check start cluster range */
      009140 1E 0B            [ 2]  485 	ldw	x, (0x0b, sp)
      009142 5A               [ 2]  486 	decw	x
      009143 26 04            [ 1]  487 	jrne	00129$
      009145 1E 09            [ 2]  488 	ldw	x, (0x09, sp)
      009147 27 1B            [ 1]  489 	jreq	00101$
      009149                        490 00129$:
      009149 1E 07            [ 2]  491 	ldw	x, (0x07, sp)
      00914B 90 93            [ 1]  492 	ldw	y, x
      00914D 90 EE 08         [ 2]  493 	ldw	y, (0x8, y)
      009150 17 03            [ 2]  494 	ldw	(0x03, sp), y
      009152 EE 06            [ 2]  495 	ldw	x, (0x6, x)
      009154 1F 01            [ 2]  496 	ldw	(0x01, sp), x
      009156 1E 0B            [ 2]  497 	ldw	x, (0x0b, sp)
      009158 13 03            [ 2]  498 	cpw	x, (0x03, sp)
      00915A 7B 0A            [ 1]  499 	ld	a, (0x0a, sp)
      00915C 12 02            [ 1]  500 	sbc	a, (0x02, sp)
      00915E 7B 09            [ 1]  501 	ld	a, (0x09, sp)
      009160 12 01            [ 1]  502 	sbc	a, (0x01, sp)
      009162 25 04            [ 1]  503 	jrc	00106$
      009164                        504 00101$:
                                    505 ;	../src/pff.c: 525: return FR_DISK_ERR;
      009164 A6 01            [ 1]  506 	ld	a, #0x01
      009166 20 3F            [ 2]  507 	jra	00109$
                                    508 ;	../src/pff.c: 527: if (PF_FS_FAT32 && !clst && (_FS_32ONLY || fs->fs_type == FS_FAT32)) {	/* Replace cluster# 0 with root cluster# if in FAT32 */
      009168                        509 00106$:
      009168 1E 0B            [ 2]  510 	ldw	x, (0x0b, sp)
      00916A 26 11            [ 1]  511 	jrne	00105$
      00916C 1E 09            [ 2]  512 	ldw	x, (0x09, sp)
      00916E 26 0D            [ 1]  513 	jrne	00105$
                                    514 ;	../src/pff.c: 528: clst = (CLUST)fs->dirbase;
      009170 1E 07            [ 2]  515 	ldw	x, (0x07, sp)
      009172 90 93            [ 1]  516 	ldw	y, x
      009174 90 EE 10         [ 2]  517 	ldw	y, (0x10, y)
      009177 17 0B            [ 2]  518 	ldw	(0x0b, sp), y
      009179 EE 0E            [ 2]  519 	ldw	x, (0xe, x)
      00917B 1F 09            [ 2]  520 	ldw	(0x09, sp), x
      00917D                        521 00105$:
                                    522 ;	../src/pff.c: 530: dj->clust = clst;						/* Current cluster */
      00917D 1E 05            [ 2]  523 	ldw	x, (0x05, sp)
      00917F 1C 00 08         [ 2]  524 	addw	x, #0x0008
      009182 16 0B            [ 2]  525 	ldw	y, (0x0b, sp)
      009184 EF 02            [ 2]  526 	ldw	(0x2, x), y
      009186 16 09            [ 2]  527 	ldw	y, (0x09, sp)
      009188 FF               [ 2]  528 	ldw	(x), y
                                    529 ;	../src/pff.c: 531: dj->sect = (_FS_32ONLY || clst) ? clust2sect(clst) : fs->dirbase;	/* Current sector */
      009189 1E 05            [ 2]  530 	ldw	x, (0x05, sp)
      00918B 1C 00 0C         [ 2]  531 	addw	x, #0x000c
      00918E 1F 07            [ 2]  532 	ldw	(0x07, sp), x
      009190 1E 0B            [ 2]  533 	ldw	x, (0x0b, sp)
      009192 89               [ 2]  534 	pushw	x
      009193 1E 0B            [ 2]  535 	ldw	x, (0x0b, sp)
      009195 89               [ 2]  536 	pushw	x
      009196 CD 90 7D         [ 4]  537 	call	_clust2sect
      009199 5B 04            [ 2]  538 	addw	sp, #4
      00919B 17 09            [ 2]  539 	ldw	(0x09, sp), y
      00919D 16 07            [ 2]  540 	ldw	y, (0x07, sp)
      00919F 90 EF 02         [ 2]  541 	ldw	(0x2, y), x
      0091A2 1E 09            [ 2]  542 	ldw	x, (0x09, sp)
      0091A4 90 FF            [ 2]  543 	ldw	(y), x
                                    544 ;	../src/pff.c: 533: return FR_OK;	/* Seek succeeded */
      0091A6 4F               [ 1]  545 	clr	a
      0091A7                        546 00109$:
                                    547 ;	../src/pff.c: 534: }
      0091A7 5B 0C            [ 2]  548 	addw	sp, #12
      0091A9 81               [ 4]  549 	ret
                                    550 ;	../src/pff.c: 543: static FRESULT dir_next (	/* FR_OK:Succeeded, FR_NO_FILE:End of table */
                                    551 ;	-----------------------------------------
                                    552 ;	 function dir_next
                                    553 ;	-----------------------------------------
      0091AA                        554 _dir_next:
      0091AA 52 14            [ 2]  555 	sub	sp, #20
                                    556 ;	../src/pff.c: 549: FATFS *fs = FatFs;
      0091AC CE 02 61         [ 2]  557 	ldw	x, _FatFs+0
      0091AF 1F 05            [ 2]  558 	ldw	(0x05, sp), x
                                    559 ;	../src/pff.c: 552: i = dj->index + 1;
      0091B1 16 17            [ 2]  560 	ldw	y, (0x17, sp)
      0091B3 17 07            [ 2]  561 	ldw	(0x07, sp), y
      0091B5 93               [ 1]  562 	ldw	x, y
      0091B6 FE               [ 2]  563 	ldw	x, (x)
      0091B7 5C               [ 1]  564 	incw	x
                                    565 ;	../src/pff.c: 553: if (!i || !dj->sect) return FR_NO_FILE;	/* Report EOT when index has reached 65535 */
      0091B8 1F 09            [ 2]  566 	ldw	(0x09, sp), x
      0091BA 27 19            [ 1]  567 	jreq	00101$
      0091BC 1E 07            [ 2]  568 	ldw	x, (0x07, sp)
      0091BE 1C 00 0C         [ 2]  569 	addw	x, #0x000c
      0091C1 1F 0B            [ 2]  570 	ldw	(0x0b, sp), x
      0091C3 90 93            [ 1]  571 	ldw	y, x
      0091C5 90 EE 02         [ 2]  572 	ldw	y, (0x2, y)
      0091C8 17 03            [ 2]  573 	ldw	(0x03, sp), y
      0091CA FE               [ 2]  574 	ldw	x, (x)
      0091CB 1F 01            [ 2]  575 	ldw	(0x01, sp), x
      0091CD 1E 03            [ 2]  576 	ldw	x, (0x03, sp)
      0091CF 26 09            [ 1]  577 	jrne	00102$
      0091D1 1E 01            [ 2]  578 	ldw	x, (0x01, sp)
      0091D3 26 05            [ 1]  579 	jrne	00102$
      0091D5                        580 00101$:
      0091D5 A6 03            [ 1]  581 	ld	a, #0x03
      0091D7 CC 92 B0         [ 2]  582 	jp	00117$
      0091DA                        583 00102$:
                                    584 ;	../src/pff.c: 555: if (!(i % 16)) {		/* Sector changed? */
      0091DA 16 09            [ 2]  585 	ldw	y, (0x09, sp)
      0091DC 17 13            [ 2]  586 	ldw	(0x13, sp), y
      0091DE 7B 14            [ 1]  587 	ld	a, (0x14, sp)
      0091E0 A5 0F            [ 1]  588 	bcp	a, #0x0f
      0091E2 27 03            [ 1]  589 	jreq	00157$
      0091E4 CC 92 AA         [ 2]  590 	jp	00116$
      0091E7                        591 00157$:
                                    592 ;	../src/pff.c: 556: dj->sect++;			/* Next sector */
      0091E7 7B 04            [ 1]  593 	ld	a, (0x04, sp)
      0091E9 AB 01            [ 1]  594 	add	a, #0x01
      0091EB 88               [ 1]  595 	push	a
      0091EC 7B 04            [ 1]  596 	ld	a, (0x04, sp)
      0091EE A9 00            [ 1]  597 	adc	a, #0x00
      0091F0 6B 12            [ 1]  598 	ld	(0x12, sp), a
      0091F2 16 02            [ 2]  599 	ldw	y, (0x02, sp)
      0091F4 24 02            [ 1]  600 	jrnc	00158$
      0091F6 90 5C            [ 1]  601 	incw	y
      0091F8                        602 00158$:
      0091F8 84               [ 1]  603 	pop	a
      0091F9 1E 0B            [ 2]  604 	ldw	x, (0x0b, sp)
      0091FB E7 03            [ 1]  605 	ld	(0x3, x), a
      0091FD 7B 11            [ 1]  606 	ld	a, (0x11, sp)
      0091FF E7 02            [ 1]  607 	ld	(0x2, x), a
      009201 FF               [ 2]  608 	ldw	(x), y
                                    609 ;	../src/pff.c: 558: if (dj->clust == 0) {	/* Static table */
      009202 1E 07            [ 2]  610 	ldw	x, (0x07, sp)
      009204 1C 00 08         [ 2]  611 	addw	x, #0x0008
      009207 1F 0D            [ 2]  612 	ldw	(0x0d, sp), x
      009209 90 93            [ 1]  613 	ldw	y, x
      00920B 90 EE 02         [ 2]  614 	ldw	y, (0x2, y)
      00920E FE               [ 2]  615 	ldw	x, (x)
      00920F 1F 0F            [ 2]  616 	ldw	(0x0f, sp), x
      009211 90 5D            [ 2]  617 	tnzw	y
      009213 26 18            [ 1]  618 	jrne	00113$
      009215 1E 0F            [ 2]  619 	ldw	x, (0x0f, sp)
      009217 26 14            [ 1]  620 	jrne	00113$
                                    621 ;	../src/pff.c: 559: if (i >= fs->n_rootdir) return FR_NO_FILE;	/* Report EOT when end of table */
      009219 1E 05            [ 2]  622 	ldw	x, (0x05, sp)
      00921B EE 04            [ 2]  623 	ldw	x, (0x4, x)
      00921D 1F 13            [ 2]  624 	ldw	(0x13, sp), x
      00921F 1E 09            [ 2]  625 	ldw	x, (0x09, sp)
      009221 13 13            [ 2]  626 	cpw	x, (0x13, sp)
      009223 24 03            [ 1]  627 	jrnc	00161$
      009225 CC 92 AA         [ 2]  628 	jp	00116$
      009228                        629 00161$:
      009228 A6 03            [ 1]  630 	ld	a, #0x03
      00922A CC 92 B0         [ 2]  631 	jp	00117$
      00922D                        632 00113$:
                                    633 ;	../src/pff.c: 562: if (((i / 16) & (fs->csize - 1)) == 0) {	/* Cluster changed? */
      00922D 04 13            [ 1]  634 	srl	(0x13, sp)
      00922F 06 14            [ 1]  635 	rrc	(0x14, sp)
      009231 04 13            [ 1]  636 	srl	(0x13, sp)
      009233 06 14            [ 1]  637 	rrc	(0x14, sp)
      009235 04 13            [ 1]  638 	srl	(0x13, sp)
      009237 06 14            [ 1]  639 	rrc	(0x14, sp)
      009239 04 13            [ 1]  640 	srl	(0x13, sp)
      00923B 06 14            [ 1]  641 	rrc	(0x14, sp)
      00923D 1E 05            [ 2]  642 	ldw	x, (0x05, sp)
      00923F E6 02            [ 1]  643 	ld	a, (0x2, x)
      009241 5F               [ 1]  644 	clrw	x
      009242 97               [ 1]  645 	ld	xl, a
      009243 5A               [ 2]  646 	decw	x
      009244 9F               [ 1]  647 	ld	a, xl
      009245 14 14            [ 1]  648 	and	a, (0x14, sp)
      009247 02               [ 1]  649 	rlwa	x
      009248 14 13            [ 1]  650 	and	a, (0x13, sp)
      00924A 95               [ 1]  651 	ld	xh, a
      00924B 5D               [ 2]  652 	tnzw	x
      00924C 26 5C            [ 1]  653 	jrne	00116$
                                    654 ;	../src/pff.c: 563: clst = get_fat(dj->clust);		/* Get next cluster */
      00924E 90 89            [ 2]  655 	pushw	y
      009250 1E 11            [ 2]  656 	ldw	x, (0x11, sp)
      009252 89               [ 2]  657 	pushw	x
      009253 CD 8F D6         [ 4]  658 	call	_get_fat
      009256 5B 04            [ 2]  659 	addw	sp, #4
      009258 1F 13            [ 2]  660 	ldw	(0x13, sp), x
      00925A 17 11            [ 2]  661 	ldw	(0x11, sp), y
                                    662 ;	../src/pff.c: 564: if (clst <= 1) return FR_DISK_ERR;
      00925C 5F               [ 1]  663 	clrw	x
      00925D 5C               [ 1]  664 	incw	x
      00925E 13 13            [ 2]  665 	cpw	x, (0x13, sp)
      009260 4F               [ 1]  666 	clr	a
      009261 12 12            [ 1]  667 	sbc	a, (0x12, sp)
      009263 4F               [ 1]  668 	clr	a
      009264 12 11            [ 1]  669 	sbc	a, (0x11, sp)
      009266 25 04            [ 1]  670 	jrc	00107$
      009268 A6 01            [ 1]  671 	ld	a, #0x01
      00926A 20 44            [ 2]  672 	jra	00117$
      00926C                        673 00107$:
                                    674 ;	../src/pff.c: 565: if (clst >= fs->n_fatent) return FR_NO_FILE;	/* Report EOT when it reached end of dynamic table */
      00926C 1E 05            [ 2]  675 	ldw	x, (0x05, sp)
      00926E 90 93            [ 1]  676 	ldw	y, x
      009270 90 EE 08         [ 2]  677 	ldw	y, (0x8, y)
      009273 17 05            [ 2]  678 	ldw	(0x05, sp), y
      009275 EE 06            [ 2]  679 	ldw	x, (0x6, x)
      009277 1F 03            [ 2]  680 	ldw	(0x03, sp), x
      009279 1E 13            [ 2]  681 	ldw	x, (0x13, sp)
      00927B 13 05            [ 2]  682 	cpw	x, (0x05, sp)
      00927D 7B 12            [ 1]  683 	ld	a, (0x12, sp)
      00927F 12 04            [ 1]  684 	sbc	a, (0x04, sp)
      009281 7B 11            [ 1]  685 	ld	a, (0x11, sp)
      009283 12 03            [ 1]  686 	sbc	a, (0x03, sp)
      009285 25 04            [ 1]  687 	jrc	00109$
      009287 A6 03            [ 1]  688 	ld	a, #0x03
      009289 20 25            [ 2]  689 	jra	00117$
      00928B                        690 00109$:
                                    691 ;	../src/pff.c: 566: dj->clust = clst;				/* Initialize data for new cluster */
      00928B 1E 0D            [ 2]  692 	ldw	x, (0x0d, sp)
      00928D 16 13            [ 2]  693 	ldw	y, (0x13, sp)
      00928F EF 02            [ 2]  694 	ldw	(0x2, x), y
      009291 16 11            [ 2]  695 	ldw	y, (0x11, sp)
      009293 FF               [ 2]  696 	ldw	(x), y
                                    697 ;	../src/pff.c: 567: dj->sect = clust2sect(clst);
      009294 1E 13            [ 2]  698 	ldw	x, (0x13, sp)
      009296 89               [ 2]  699 	pushw	x
      009297 1E 13            [ 2]  700 	ldw	x, (0x13, sp)
      009299 89               [ 2]  701 	pushw	x
      00929A CD 90 7D         [ 4]  702 	call	_clust2sect
      00929D 5B 04            [ 2]  703 	addw	sp, #4
      00929F 17 11            [ 2]  704 	ldw	(0x11, sp), y
      0092A1 16 0B            [ 2]  705 	ldw	y, (0x0b, sp)
      0092A3 90 EF 02         [ 2]  706 	ldw	(0x2, y), x
      0092A6 1E 11            [ 2]  707 	ldw	x, (0x11, sp)
      0092A8 90 FF            [ 2]  708 	ldw	(y), x
      0092AA                        709 00116$:
                                    710 ;	../src/pff.c: 572: dj->index = i;
      0092AA 1E 07            [ 2]  711 	ldw	x, (0x07, sp)
      0092AC 16 09            [ 2]  712 	ldw	y, (0x09, sp)
      0092AE FF               [ 2]  713 	ldw	(x), y
                                    714 ;	../src/pff.c: 574: return FR_OK;
      0092AF 4F               [ 1]  715 	clr	a
      0092B0                        716 00117$:
                                    717 ;	../src/pff.c: 575: }
      0092B0 5B 14            [ 2]  718 	addw	sp, #20
      0092B2 81               [ 4]  719 	ret
                                    720 ;	../src/pff.c: 584: static FRESULT dir_find (
                                    721 ;	-----------------------------------------
                                    722 ;	 function dir_find
                                    723 ;	-----------------------------------------
      0092B3                        724 _dir_find:
      0092B3 52 07            [ 2]  725 	sub	sp, #7
                                    726 ;	../src/pff.c: 593: res = dir_rewind(dj);			/* Rewind directory object */
      0092B5 1E 0A            [ 2]  727 	ldw	x, (0x0a, sp)
      0092B7 89               [ 2]  728 	pushw	x
      0092B8 CD 91 24         [ 4]  729 	call	_dir_rewind
      0092BB 85               [ 2]  730 	popw	x
                                    731 ;	../src/pff.c: 594: if (res != FR_OK) return res;
      0092BC 4D               [ 1]  732 	tnz	a
                                    733 ;	../src/pff.c: 596: do {
      0092BD 26 72            [ 1]  734 	jrne	00113$
      0092BF 16 0A            [ 2]  735 	ldw	y, (0x0a, sp)
      0092C1 17 03            [ 2]  736 	ldw	(0x03, sp), y
      0092C3 17 05            [ 2]  737 	ldw	(0x05, sp), y
      0092C5                        738 00110$:
                                    739 ;	../src/pff.c: 597: res = disk_readp(dir, dj->sect, (dj->index % 16) * 32, 32)	/* Read an entry */
      0092C5 1E 03            [ 2]  740 	ldw	x, (0x03, sp)
      0092C7 FE               [ 2]  741 	ldw	x, (x)
      0092C8 9F               [ 1]  742 	ld	a, xl
      0092C9 A4 0F            [ 1]  743 	and	a, #0x0f
      0092CB 97               [ 1]  744 	ld	xl, a
      0092CC 4F               [ 1]  745 	clr	a
      0092CD 95               [ 1]  746 	ld	xh, a
      0092CE 58               [ 2]  747 	sllw	x
      0092CF 58               [ 2]  748 	sllw	x
      0092D0 58               [ 2]  749 	sllw	x
      0092D1 58               [ 2]  750 	sllw	x
      0092D2 58               [ 2]  751 	sllw	x
      0092D3 1F 01            [ 2]  752 	ldw	(0x01, sp), x
      0092D5 1E 05            [ 2]  753 	ldw	x, (0x05, sp)
      0092D7 90 93            [ 1]  754 	ldw	y, x
      0092D9 90 EE 0E         [ 2]  755 	ldw	y, (0xe, y)
      0092DC EE 0C            [ 2]  756 	ldw	x, (0xc, x)
      0092DE 4B 20            [ 1]  757 	push	#0x20
      0092E0 4B 00            [ 1]  758 	push	#0x00
      0092E2 7B 04            [ 1]  759 	ld	a, (0x04, sp)
      0092E4 88               [ 1]  760 	push	a
      0092E5 7B 04            [ 1]  761 	ld	a, (0x04, sp)
      0092E7 88               [ 1]  762 	push	a
      0092E8 90 89            [ 2]  763 	pushw	y
      0092EA 89               [ 2]  764 	pushw	x
      0092EB 1E 14            [ 2]  765 	ldw	x, (0x14, sp)
      0092ED 89               [ 2]  766 	pushw	x
      0092EE CD 82 84         [ 4]  767 	call	_disk_readp
      0092F1 5B 0A            [ 2]  768 	addw	sp, #10
      0092F3 4D               [ 1]  769 	tnz	a
      0092F4 27 03            [ 1]  770 	jreq	00115$
                                    771 ;	../src/pff.c: 598: ? FR_DISK_ERR : FR_OK;
      0092F6 A6 01            [ 1]  772 	ld	a, #0x01
      0092F8 21                     773 	.byte 0x21
      0092F9                        774 00115$:
      0092F9 4F               [ 1]  775 	clr	a
      0092FA                        776 00116$:
                                    777 ;	../src/pff.c: 599: if (res != FR_OK) break;
      0092FA 6B 07            [ 1]  778 	ld	(0x07, sp), a
      0092FC 26 31            [ 1]  779 	jrne	00112$
                                    780 ;	../src/pff.c: 600: c = dir[DIR_Name];	/* First character */
      0092FE 1E 0C            [ 2]  781 	ldw	x, (0x0c, sp)
                                    782 ;	../src/pff.c: 601: if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
      009300 F6               [ 1]  783 	ld	a, (x)
      009301 26 06            [ 1]  784 	jrne	00106$
      009303 A6 03            [ 1]  785 	ld	a, #0x03
      009305 6B 07            [ 1]  786 	ld	(0x07, sp), a
      009307 20 26            [ 2]  787 	jra	00112$
      009309                        788 00106$:
                                    789 ;	../src/pff.c: 602: if (!(dir[DIR_Attr] & AM_VOL) && !mem_cmp(dir, dj->fn, 11)) break;	/* Is it a valid entry? */
      009309 E6 0B            [ 1]  790 	ld	a, (0xb, x)
      00930B A5 08            [ 1]  791 	bcp	a, #0x08
      00930D 26 15            [ 1]  792 	jrne	00108$
      00930F 1E 03            [ 2]  793 	ldw	x, (0x03, sp)
      009311 EE 02            [ 2]  794 	ldw	x, (0x2, x)
      009313 16 0C            [ 2]  795 	ldw	y, (0x0c, sp)
      009315 4B 0B            [ 1]  796 	push	#0x0b
      009317 4B 00            [ 1]  797 	push	#0x00
      009319 89               [ 2]  798 	pushw	x
      00931A 90 89            [ 2]  799 	pushw	y
      00931C CD 8F 92         [ 4]  800 	call	_mem_cmp
      00931F 5B 06            [ 2]  801 	addw	sp, #6
      009321 5D               [ 2]  802 	tnzw	x
      009322 27 0B            [ 1]  803 	jreq	00112$
      009324                        804 00108$:
                                    805 ;	../src/pff.c: 603: res = dir_next(dj);					/* Next entry */
      009324 1E 03            [ 2]  806 	ldw	x, (0x03, sp)
      009326 89               [ 2]  807 	pushw	x
      009327 CD 91 AA         [ 4]  808 	call	_dir_next
      00932A 85               [ 2]  809 	popw	x
                                    810 ;	../src/pff.c: 604: } while (res == FR_OK);
      00932B 6B 07            [ 1]  811 	ld	(0x07, sp), a
      00932D 27 96            [ 1]  812 	jreq	00110$
      00932F                        813 00112$:
                                    814 ;	../src/pff.c: 606: return res;
      00932F 7B 07            [ 1]  815 	ld	a, (0x07, sp)
      009331                        816 00113$:
                                    817 ;	../src/pff.c: 607: }
      009331 5B 07            [ 2]  818 	addw	sp, #7
      009333 81               [ 4]  819 	ret
                                    820 ;	../src/pff.c: 651: static FRESULT create_name (
                                    821 ;	-----------------------------------------
                                    822 ;	 function create_name
                                    823 ;	-----------------------------------------
      009334                        824 _create_name:
      009334 52 09            [ 2]  825 	sub	sp, #9
                                    826 ;	../src/pff.c: 663: sfn = dj->fn;
      009336 1E 0C            [ 2]  827 	ldw	x, (0x0c, sp)
      009338 EE 02            [ 2]  828 	ldw	x, (0x2, x)
                                    829 ;	../src/pff.c: 664: mem_set(sfn, ' ', 11);
      00933A 1F 01            [ 2]  830 	ldw	(0x01, sp), x
      00933C 4B 0B            [ 1]  831 	push	#0x0b
      00933E 4B 00            [ 1]  832 	push	#0x00
      009340 4B 20            [ 1]  833 	push	#0x20
      009342 4B 00            [ 1]  834 	push	#0x00
      009344 89               [ 2]  835 	pushw	x
      009345 CD 8F 77         [ 4]  836 	call	_mem_set
      009348 5B 06            [ 2]  837 	addw	sp, #6
                                    838 ;	../src/pff.c: 665: si = i = 0; ni = 8;
      00934A 0F 08            [ 1]  839 	clr	(0x08, sp)
      00934C A6 08            [ 1]  840 	ld	a, #0x08
      00934E 6B 03            [ 1]  841 	ld	(0x03, sp), a
                                    842 ;	../src/pff.c: 666: p = *path;
      009350 16 0E            [ 2]  843 	ldw	y, (0x0e, sp)
      009352 93               [ 1]  844 	ldw	x, y
      009353 FE               [ 2]  845 	ldw	x, (x)
      009354 1F 04            [ 2]  846 	ldw	(0x04, sp), x
      009356 0F 09            [ 1]  847 	clr	(0x09, sp)
      009358                        848 00120$:
                                    849 ;	../src/pff.c: 668: c = p[si++];
      009358 5F               [ 1]  850 	clrw	x
      009359 7B 09            [ 1]  851 	ld	a, (0x09, sp)
      00935B 97               [ 1]  852 	ld	xl, a
      00935C 72 FB 04         [ 2]  853 	addw	x, (0x04, sp)
      00935F 0C 09            [ 1]  854 	inc	(0x09, sp)
      009361 F6               [ 1]  855 	ld	a, (x)
                                    856 ;	../src/pff.c: 669: if (c <= ' ' || c == '/') break;	/* Break on end of segment */
      009362 6B 06            [ 1]  857 	ld	(0x06, sp), a
      009364 A1 20            [ 1]  858 	cp	a, #0x20
      009366 22 04            [ 1]  859 	jrugt	00161$
      009368 0F 07            [ 1]  860 	clr	(0x07, sp)
      00936A 20 04            [ 2]  861 	jra	00162$
      00936C                        862 00161$:
      00936C A6 01            [ 1]  863 	ld	a, #0x01
      00936E 6B 07            [ 1]  864 	ld	(0x07, sp), a
      009370                        865 00162$:
      009370 0D 07            [ 1]  866 	tnz	(0x07, sp)
      009372 27 3D            [ 1]  867 	jreq	00119$
      009374 7B 06            [ 1]  868 	ld	a, (0x06, sp)
      009376 A1 2F            [ 1]  869 	cp	a, #0x2f
      009378 27 37            [ 1]  870 	jreq	00119$
                                    871 ;	../src/pff.c: 670: if (c == '.' || i >= ni) {
      00937A 7B 06            [ 1]  872 	ld	a, (0x06, sp)
      00937C A0 2E            [ 1]  873 	sub	a, #0x2e
      00937E 26 02            [ 1]  874 	jrne	00168$
      009380 4C               [ 1]  875 	inc	a
      009381 21                     876 	.byte 0x21
      009382                        877 00168$:
      009382 4F               [ 1]  878 	clr	a
      009383                        879 00169$:
      009383 4D               [ 1]  880 	tnz	a
      009384 26 08            [ 1]  881 	jrne	00107$
      009386 88               [ 1]  882 	push	a
      009387 7B 09            [ 1]  883 	ld	a, (0x09, sp)
      009389 11 04            [ 1]  884 	cp	a, (0x04, sp)
      00938B 84               [ 1]  885 	pop	a
      00938C 25 15            [ 1]  886 	jrc	00111$
      00938E                        887 00107$:
                                    888 ;	../src/pff.c: 671: if (ni != 8 || c != '.') break;
      00938E 88               [ 1]  889 	push	a
      00938F 7B 04            [ 1]  890 	ld	a, (0x04, sp)
      009391 A1 08            [ 1]  891 	cp	a, #0x08
      009393 84               [ 1]  892 	pop	a
      009394 26 1B            [ 1]  893 	jrne	00119$
      009396 4D               [ 1]  894 	tnz	a
      009397 27 18            [ 1]  895 	jreq	00119$
                                    896 ;	../src/pff.c: 672: i = 8; ni = 11;
      009399 A6 08            [ 1]  897 	ld	a, #0x08
      00939B 6B 08            [ 1]  898 	ld	(0x08, sp), a
      00939D A6 0B            [ 1]  899 	ld	a, #0x0b
      00939F 6B 03            [ 1]  900 	ld	(0x03, sp), a
                                    901 ;	../src/pff.c: 673: continue;
      0093A1 20 B5            [ 2]  902 	jra	00120$
                                    903 ;	../src/pff.c: 683: if (PF_USE_LCC && IsLower(c)) c -= 0x20;	/* toupper */
      0093A3                        904 00111$:
                                    905 ;	../src/pff.c: 684: sfn[i++] = c;
      0093A3 7B 08            [ 1]  906 	ld	a, (0x08, sp)
      0093A5 0C 08            [ 1]  907 	inc	(0x08, sp)
      0093A7 5F               [ 1]  908 	clrw	x
      0093A8 97               [ 1]  909 	ld	xl, a
      0093A9 72 FB 01         [ 2]  910 	addw	x, (0x01, sp)
      0093AC 7B 06            [ 1]  911 	ld	a, (0x06, sp)
      0093AE F7               [ 1]  912 	ld	(x), a
      0093AF 20 A7            [ 2]  913 	jra	00120$
      0093B1                        914 00119$:
                                    915 ;	../src/pff.c: 687: *path = &p[si];						/* Rerurn pointer to the next segment */
      0093B1 5F               [ 1]  916 	clrw	x
      0093B2 7B 09            [ 1]  917 	ld	a, (0x09, sp)
      0093B4 97               [ 1]  918 	ld	xl, a
      0093B5 72 FB 04         [ 2]  919 	addw	x, (0x04, sp)
      0093B8 90 FF            [ 2]  920 	ldw	(y), x
                                    921 ;	../src/pff.c: 689: sfn[11] = (c <= ' ') ? 1 : 0;		/* Set last segment flag if end of path */
      0093BA 16 01            [ 2]  922 	ldw	y, (0x01, sp)
      0093BC 72 A9 00 0B      [ 2]  923 	addw	y, #0x000b
      0093C0 0D 07            [ 1]  924 	tnz	(0x07, sp)
      0093C2 26 03            [ 1]  925 	jrne	00123$
      0093C4 5F               [ 1]  926 	clrw	x
      0093C5 5C               [ 1]  927 	incw	x
      0093C6 21                     928 	.byte 0x21
      0093C7                        929 00123$:
      0093C7 5F               [ 1]  930 	clrw	x
      0093C8                        931 00124$:
      0093C8 9F               [ 1]  932 	ld	a, xl
      0093C9 90 F7            [ 1]  933 	ld	(y), a
                                    934 ;	../src/pff.c: 691: return FR_OK;
      0093CB 4F               [ 1]  935 	clr	a
                                    936 ;	../src/pff.c: 692: }
      0093CC 5B 09            [ 2]  937 	addw	sp, #9
      0093CE 81               [ 4]  938 	ret
                                    939 ;	../src/pff.c: 742: static FRESULT follow_path (	/* FR_OK(0): successful, !=0: error code */
                                    940 ;	-----------------------------------------
                                    941 ;	 function follow_path
                                    942 ;	-----------------------------------------
      0093CF                        943 _follow_path:
      0093CF 52 0E            [ 2]  944 	sub	sp, #14
                                    945 ;	../src/pff.c: 751: while (*path == ' ') path++;		/* Strip leading spaces */
      0093D1 16 15            [ 2]  946 	ldw	y, (0x15, sp)
      0093D3                        947 00101$:
      0093D3 90 F6            [ 1]  948 	ld	a, (y)
      0093D5 93               [ 1]  949 	ldw	x, y
      0093D6 5C               [ 1]  950 	incw	x
      0093D7 A1 20            [ 1]  951 	cp	a, #0x20
      0093D9 26 06            [ 1]  952 	jrne	00131$
      0093DB 90 93            [ 1]  953 	ldw	y, x
      0093DD 1F 15            [ 2]  954 	ldw	(0x15, sp), x
      0093DF 20 F2            [ 2]  955 	jra	00101$
      0093E1                        956 00131$:
      0093E1 17 15            [ 2]  957 	ldw	(0x15, sp), y
                                    958 ;	../src/pff.c: 752: if (*path == '/') path++;			/* Strip heading separator if exist */
      0093E3 A1 2F            [ 1]  959 	cp	a, #0x2f
      0093E5 26 02            [ 1]  960 	jrne	00105$
      0093E7 1F 15            [ 2]  961 	ldw	(0x15, sp), x
      0093E9                        962 00105$:
                                    963 ;	../src/pff.c: 753: dj->sclust = 0;						/* Set start directory (always root dir) */
      0093E9 16 11            [ 2]  964 	ldw	y, (0x11, sp)
      0093EB 17 01            [ 2]  965 	ldw	(0x01, sp), y
      0093ED 93               [ 1]  966 	ldw	x, y
      0093EE 1C 00 04         [ 2]  967 	addw	x, #0x0004
      0093F1 90 5F            [ 1]  968 	clrw	y
      0093F3 EF 02            [ 2]  969 	ldw	(0x2, x), y
      0093F5 FF               [ 2]  970 	ldw	(x), y
                                    971 ;	../src/pff.c: 755: if ((BYTE)*path < ' ') {			/* Null path means the root directory */
      0093F6 1E 15            [ 2]  972 	ldw	x, (0x15, sp)
      0093F8 F6               [ 1]  973 	ld	a, (x)
      0093F9 A1 20            [ 1]  974 	cp	a, #0x20
      0093FB 24 0E            [ 1]  975 	jrnc	00130$
                                    976 ;	../src/pff.c: 756: res = dir_rewind(dj);
      0093FD 1E 01            [ 2]  977 	ldw	x, (0x01, sp)
      0093FF 89               [ 2]  978 	pushw	x
      009400 CD 91 24         [ 4]  979 	call	_dir_rewind
      009403 85               [ 2]  980 	popw	x
      009404 6B 0E            [ 1]  981 	ld	(0x0e, sp), a
                                    982 ;	../src/pff.c: 757: dir[0] = 0;
      009406 1E 13            [ 2]  983 	ldw	x, (0x13, sp)
      009408 7F               [ 1]  984 	clr	(x)
      009409 20 5E            [ 2]  985 	jra	00117$
      00940B                        986 00130$:
      00940B 16 01            [ 2]  987 	ldw	y, (0x01, sp)
      00940D 17 03            [ 2]  988 	ldw	(0x03, sp), y
      00940F 16 13            [ 2]  989 	ldw	y, (0x13, sp)
      009411 17 05            [ 2]  990 	ldw	(0x05, sp), y
      009413 16 01            [ 2]  991 	ldw	y, (0x01, sp)
      009415 17 07            [ 2]  992 	ldw	(0x07, sp), y
      009417                        993 00118$:
                                    994 ;	../src/pff.c: 761: res = create_name(dj, &path);	/* Get a segment */
      009417 96               [ 1]  995 	ldw	x, sp
      009418 1C 00 15         [ 2]  996 	addw	x, #21
      00941B 89               [ 2]  997 	pushw	x
      00941C 1E 03            [ 2]  998 	ldw	x, (0x03, sp)
      00941E 89               [ 2]  999 	pushw	x
      00941F CD 93 34         [ 4] 1000 	call	_create_name
      009422 5B 04            [ 2] 1001 	addw	sp, #4
                                   1002 ;	../src/pff.c: 762: if (res != FR_OK) break;
      009424 6B 0E            [ 1] 1003 	ld	(0x0e, sp), a
      009426 26 41            [ 1] 1004 	jrne	00117$
                                   1005 ;	../src/pff.c: 763: res = dir_find(dj, dir);		/* Find it */
      009428 1E 13            [ 2] 1006 	ldw	x, (0x13, sp)
      00942A 89               [ 2] 1007 	pushw	x
      00942B 1E 03            [ 2] 1008 	ldw	x, (0x03, sp)
      00942D 89               [ 2] 1009 	pushw	x
      00942E CD 92 B3         [ 4] 1010 	call	_dir_find
      009431 5B 04            [ 2] 1011 	addw	sp, #4
                                   1012 ;	../src/pff.c: 764: if (res != FR_OK) break;		/* Could not find the object */
      009433 6B 0E            [ 1] 1013 	ld	(0x0e, sp), a
      009435 26 32            [ 1] 1014 	jrne	00117$
                                   1015 ;	../src/pff.c: 765: if (dj->fn[11]) break;			/* Last segment match. Function completed. */
      009437 1E 03            [ 2] 1016 	ldw	x, (0x03, sp)
      009439 EE 02            [ 2] 1017 	ldw	x, (0x2, x)
      00943B E6 0B            [ 1] 1018 	ld	a, (0xb, x)
      00943D 26 2A            [ 1] 1019 	jrne	00117$
                                   1020 ;	../src/pff.c: 766: if (!(dir[DIR_Attr] & AM_DIR)) { /* Cannot follow path because it is a file */
      00943F 1E 05            [ 2] 1021 	ldw	x, (0x05, sp)
      009441 E6 0B            [ 1] 1022 	ld	a, (0xb, x)
      009443 A5 10            [ 1] 1023 	bcp	a, #0x10
      009445 26 06            [ 1] 1024 	jrne	00113$
                                   1025 ;	../src/pff.c: 767: res = FR_NO_FILE; break;
      009447 A6 03            [ 1] 1026 	ld	a, #0x03
      009449 6B 0E            [ 1] 1027 	ld	(0x0e, sp), a
      00944B 20 1C            [ 2] 1028 	jra	00117$
      00944D                       1029 00113$:
                                   1030 ;	../src/pff.c: 769: dj->sclust = get_clust(dir);	/* Follow next */
      00944D 1E 07            [ 2] 1031 	ldw	x, (0x07, sp)
      00944F 1C 00 04         [ 2] 1032 	addw	x, #0x0004
      009452 1F 09            [ 2] 1033 	ldw	(0x09, sp), x
      009454 1E 13            [ 2] 1034 	ldw	x, (0x13, sp)
      009456 89               [ 2] 1035 	pushw	x
      009457 CD 90 EF         [ 4] 1036 	call	_get_clust
      00945A 5B 02            [ 2] 1037 	addw	sp, #2
      00945C 17 0B            [ 2] 1038 	ldw	(0x0b, sp), y
      00945E 16 09            [ 2] 1039 	ldw	y, (0x09, sp)
      009460 90 EF 02         [ 2] 1040 	ldw	(0x2, y), x
      009463 1E 0B            [ 2] 1041 	ldw	x, (0x0b, sp)
      009465 90 FF            [ 2] 1042 	ldw	(y), x
      009467 20 AE            [ 2] 1043 	jra	00118$
      009469                       1044 00117$:
                                   1045 ;	../src/pff.c: 773: return res;
      009469 7B 0E            [ 1] 1046 	ld	a, (0x0e, sp)
                                   1047 ;	../src/pff.c: 774: }
      00946B 5B 0E            [ 2] 1048 	addw	sp, #14
      00946D 81               [ 4] 1049 	ret
                                   1050 ;	../src/pff.c: 783: static BYTE check_fs (	/* 0:The FAT boot record, 1:Valid boot record but not an FAT, 2:Not a boot record, 3:Error */
                                   1051 ;	-----------------------------------------
                                   1052 ;	 function check_fs
                                   1053 ;	-----------------------------------------
      00946E                       1054 _check_fs:
                                   1055 ;	../src/pff.c: 788: if (disk_readp(buf, sect, 510, 2)) {	/* Read the boot record */
      00946E 4B 02            [ 1] 1056 	push	#0x02
      009470 4B 00            [ 1] 1057 	push	#0x00
      009472 4B FE            [ 1] 1058 	push	#0xfe
      009474 4B 01            [ 1] 1059 	push	#0x01
      009476 1E 0B            [ 2] 1060 	ldw	x, (0x0b, sp)
      009478 89               [ 2] 1061 	pushw	x
      009479 1E 0B            [ 2] 1062 	ldw	x, (0x0b, sp)
      00947B 89               [ 2] 1063 	pushw	x
      00947C 1E 0B            [ 2] 1064 	ldw	x, (0x0b, sp)
      00947E 89               [ 2] 1065 	pushw	x
      00947F CD 82 84         [ 4] 1066 	call	_disk_readp
      009482 5B 0A            [ 2] 1067 	addw	sp, #10
      009484 4D               [ 1] 1068 	tnz	a
      009485 27 03            [ 1] 1069 	jreq	00102$
                                   1070 ;	../src/pff.c: 789: return 3;
      009487 A6 03            [ 1] 1071 	ld	a, #0x03
      009489 81               [ 4] 1072 	ret
      00948A                       1073 00102$:
                                   1074 ;	../src/pff.c: 791: if (ld_word(buf) != 0xAA55) {			/* Check record signature */
      00948A 1E 03            [ 2] 1075 	ldw	x, (0x03, sp)
      00948C 89               [ 2] 1076 	pushw	x
      00948D CD 8E ED         [ 4] 1077 	call	_ld_word
      009490 5B 02            [ 2] 1078 	addw	sp, #2
      009492 A3 AA 55         [ 2] 1079 	cpw	x, #0xaa55
      009495 27 03            [ 1] 1080 	jreq	00111$
                                   1081 ;	../src/pff.c: 792: return 2;
      009497 A6 02            [ 1] 1082 	ld	a, #0x02
      009499 81               [ 4] 1083 	ret
                                   1084 ;	../src/pff.c: 798: if (PF_FS_FAT32 && !disk_readp(buf, sect, BS_FilSysType32, 2) && ld_word(buf) == 0x4146) {	/* Check FAT32 */
      00949A                       1085 00111$:
      00949A 4B 02            [ 1] 1086 	push	#0x02
      00949C 4B 00            [ 1] 1087 	push	#0x00
      00949E 4B 52            [ 1] 1088 	push	#0x52
      0094A0 4B 00            [ 1] 1089 	push	#0x00
      0094A2 1E 0B            [ 2] 1090 	ldw	x, (0x0b, sp)
      0094A4 89               [ 2] 1091 	pushw	x
      0094A5 1E 0B            [ 2] 1092 	ldw	x, (0x0b, sp)
      0094A7 89               [ 2] 1093 	pushw	x
      0094A8 1E 0B            [ 2] 1094 	ldw	x, (0x0b, sp)
      0094AA 89               [ 2] 1095 	pushw	x
      0094AB CD 82 84         [ 4] 1096 	call	_disk_readp
      0094AE 5B 0A            [ 2] 1097 	addw	sp, #10
      0094B0 4D               [ 1] 1098 	tnz	a
      0094B1 26 0F            [ 1] 1099 	jrne	00110$
      0094B3 1E 03            [ 2] 1100 	ldw	x, (0x03, sp)
      0094B5 89               [ 2] 1101 	pushw	x
      0094B6 CD 8E ED         [ 4] 1102 	call	_ld_word
      0094B9 5B 02            [ 2] 1103 	addw	sp, #2
      0094BB A3 41 46         [ 2] 1104 	cpw	x, #0x4146
      0094BE 26 02            [ 1] 1105 	jrne	00110$
                                   1106 ;	../src/pff.c: 799: return 0;
      0094C0 4F               [ 1] 1107 	clr	a
      0094C1 81               [ 4] 1108 	ret
      0094C2                       1109 00110$:
                                   1110 ;	../src/pff.c: 801: return 1;
      0094C2 A6 01            [ 1] 1111 	ld	a, #0x01
                                   1112 ;	../src/pff.c: 802: }
      0094C4 81               [ 4] 1113 	ret
                                   1114 ;	../src/pff.c: 819: FRESULT pf_mount (
                                   1115 ;	-----------------------------------------
                                   1116 ;	 function pf_mount
                                   1117 ;	-----------------------------------------
      0094C5                       1118 _pf_mount:
      0094C5 52 3C            [ 2] 1119 	sub	sp, #60
                                   1120 ;	../src/pff.c: 827: FatFs = 0;
      0094C7 5F               [ 1] 1121 	clrw	x
      0094C8 CF 02 61         [ 2] 1122 	ldw	_FatFs+0, x
                                   1123 ;	../src/pff.c: 829: if (disk_initialize() & STA_NOINIT) {	/* Check if the drive is ready or not */
      0094CB CD 82 70         [ 4] 1124 	call	_disk_initialize
      0094CE 44               [ 1] 1125 	srl	a
      0094CF 24 05            [ 1] 1126 	jrnc	00102$
                                   1127 ;	../src/pff.c: 830: return FR_NOT_READY;
      0094D1 A6 02            [ 1] 1128 	ld	a, #0x02
      0094D3 CC 97 10         [ 2] 1129 	jp	00137$
      0094D6                       1130 00102$:
                                   1131 ;	../src/pff.c: 834: bsect = 0;
      0094D6 5F               [ 1] 1132 	clrw	x
      0094D7 1F 33            [ 2] 1133 	ldw	(0x33, sp), x
      0094D9 1F 31            [ 2] 1134 	ldw	(0x31, sp), x
                                   1135 ;	../src/pff.c: 835: fmt = check_fs(buf, bsect);			/* Check sector 0 as an SFD format */
      0094DB 5F               [ 1] 1136 	clrw	x
      0094DC 89               [ 2] 1137 	pushw	x
      0094DD 5F               [ 1] 1138 	clrw	x
      0094DE 89               [ 2] 1139 	pushw	x
      0094DF 96               [ 1] 1140 	ldw	x, sp
      0094E0 1C 00 05         [ 2] 1141 	addw	x, #5
      0094E3 89               [ 2] 1142 	pushw	x
      0094E4 CD 94 6E         [ 4] 1143 	call	_check_fs
      0094E7 5B 06            [ 2] 1144 	addw	sp, #6
      0094E9 6B 3C            [ 1] 1145 	ld	(0x3c, sp), a
                                   1146 ;	../src/pff.c: 841: if (buf[4]) {					/* Is the partition existing? */
      0094EB 96               [ 1] 1147 	ldw	x, sp
      0094EC 1C 00 05         [ 2] 1148 	addw	x, #5
      0094EF 1F 39            [ 2] 1149 	ldw	(0x39, sp), x
                                   1150 ;	../src/pff.c: 836: if (fmt == 1) {						/* Not an FAT boot record, it may be FDISK format */
      0094F1 7B 3C            [ 1] 1151 	ld	a, (0x3c, sp)
      0094F3 4A               [ 1] 1152 	dec	a
      0094F4 26 44            [ 1] 1153 	jrne	00109$
                                   1154 ;	../src/pff.c: 838: if (disk_readp(buf, bsect, MBR_Table, 16)) {	/* 1st partition entry */
      0094F6 4B 10            [ 1] 1155 	push	#0x10
      0094F8 4B 00            [ 1] 1156 	push	#0x00
      0094FA 4B BE            [ 1] 1157 	push	#0xbe
      0094FC 4B 01            [ 1] 1158 	push	#0x01
      0094FE 5F               [ 1] 1159 	clrw	x
      0094FF 89               [ 2] 1160 	pushw	x
      009500 5F               [ 1] 1161 	clrw	x
      009501 89               [ 2] 1162 	pushw	x
      009502 96               [ 1] 1163 	ldw	x, sp
      009503 1C 00 09         [ 2] 1164 	addw	x, #9
      009506 89               [ 2] 1165 	pushw	x
      009507 CD 82 84         [ 4] 1166 	call	_disk_readp
      00950A 5B 0A            [ 2] 1167 	addw	sp, #10
      00950C 4D               [ 1] 1168 	tnz	a
      00950D 27 06            [ 1] 1169 	jreq	00106$
                                   1170 ;	../src/pff.c: 839: fmt = 3;
      00950F A6 03            [ 1] 1171 	ld	a, #0x03
      009511 6B 3C            [ 1] 1172 	ld	(0x3c, sp), a
      009513 20 25            [ 2] 1173 	jra	00109$
      009515                       1174 00106$:
                                   1175 ;	../src/pff.c: 841: if (buf[4]) {					/* Is the partition existing? */
      009515 1E 39            [ 2] 1176 	ldw	x, (0x39, sp)
      009517 F6               [ 1] 1177 	ld	a, (x)
      009518 27 20            [ 1] 1178 	jreq	00109$
                                   1179 ;	../src/pff.c: 842: bsect = ld_dword(&buf[8]);	/* Partition offset in LBA */
      00951A 96               [ 1] 1180 	ldw	x, sp
      00951B 1C 00 09         [ 2] 1181 	addw	x, #9
      00951E 89               [ 2] 1182 	pushw	x
      00951F CD 8F 03         [ 4] 1183 	call	_ld_dword
      009522 5B 02            [ 2] 1184 	addw	sp, #2
      009524 1F 33            [ 2] 1185 	ldw	(0x33, sp), x
      009526 17 31            [ 2] 1186 	ldw	(0x31, sp), y
                                   1187 ;	../src/pff.c: 843: fmt = check_fs(buf, bsect);	/* Check the partition */
      009528 1E 33            [ 2] 1188 	ldw	x, (0x33, sp)
      00952A 89               [ 2] 1189 	pushw	x
      00952B 1E 33            [ 2] 1190 	ldw	x, (0x33, sp)
      00952D 89               [ 2] 1191 	pushw	x
      00952E 96               [ 1] 1192 	ldw	x, sp
      00952F 1C 00 05         [ 2] 1193 	addw	x, #5
      009532 89               [ 2] 1194 	pushw	x
      009533 CD 94 6E         [ 4] 1195 	call	_check_fs
      009536 5B 06            [ 2] 1196 	addw	sp, #6
      009538 6B 3C            [ 1] 1197 	ld	(0x3c, sp), a
      00953A                       1198 00109$:
                                   1199 ;	../src/pff.c: 847: if (fmt == 3) return FR_DISK_ERR;
      00953A 7B 3C            [ 1] 1200 	ld	a, (0x3c, sp)
      00953C A1 03            [ 1] 1201 	cp	a, #0x03
      00953E 26 05            [ 1] 1202 	jrne	00111$
      009540 A6 01            [ 1] 1203 	ld	a, #0x01
      009542 CC 97 10         [ 2] 1204 	jp	00137$
      009545                       1205 00111$:
                                   1206 ;	../src/pff.c: 848: if (fmt) return FR_NO_FILESYSTEM;	/* No valid FAT patition is found */
      009545 0D 3C            [ 1] 1207 	tnz	(0x3c, sp)
      009547 27 05            [ 1] 1208 	jreq	00113$
      009549 A6 06            [ 1] 1209 	ld	a, #0x06
      00954B CC 97 10         [ 2] 1210 	jp	00137$
      00954E                       1211 00113$:
                                   1212 ;	../src/pff.c: 851: if (disk_readp(buf, bsect, 13, sizeof (buf))) return FR_DISK_ERR;
      00954E 4B 24            [ 1] 1213 	push	#0x24
      009550 4B 00            [ 1] 1214 	push	#0x00
      009552 4B 0D            [ 1] 1215 	push	#0x0d
      009554 4B 00            [ 1] 1216 	push	#0x00
      009556 1E 37            [ 2] 1217 	ldw	x, (0x37, sp)
      009558 89               [ 2] 1218 	pushw	x
      009559 1E 37            [ 2] 1219 	ldw	x, (0x37, sp)
      00955B 89               [ 2] 1220 	pushw	x
      00955C 96               [ 1] 1221 	ldw	x, sp
      00955D 1C 00 09         [ 2] 1222 	addw	x, #9
      009560 89               [ 2] 1223 	pushw	x
      009561 CD 82 84         [ 4] 1224 	call	_disk_readp
      009564 5B 0A            [ 2] 1225 	addw	sp, #10
      009566 4D               [ 1] 1226 	tnz	a
      009567 27 05            [ 1] 1227 	jreq	00115$
      009569 A6 01            [ 1] 1228 	ld	a, #0x01
      00956B CC 97 10         [ 2] 1229 	jp	00137$
      00956E                       1230 00115$:
                                   1231 ;	../src/pff.c: 853: fsize = ld_word(buf+BPB_FATSz16-13);				/* Number of sectors per FAT */
      00956E 96               [ 1] 1232 	ldw	x, sp
      00956F 1C 00 0A         [ 2] 1233 	addw	x, #10
      009572 89               [ 2] 1234 	pushw	x
      009573 CD 8E ED         [ 4] 1235 	call	_ld_word
      009576 5B 02            [ 2] 1236 	addw	sp, #2
      009578 90 5F            [ 1] 1237 	clrw	y
      00957A 1F 37            [ 2] 1238 	ldw	(0x37, sp), x
      00957C 17 35            [ 2] 1239 	ldw	(0x35, sp), y
                                   1240 ;	../src/pff.c: 854: if (!fsize) fsize = ld_dword(buf+BPB_FATSz32-13);
      00957E 1E 37            [ 2] 1241 	ldw	x, (0x37, sp)
      009580 26 12            [ 1] 1242 	jrne	00117$
      009582 1E 35            [ 2] 1243 	ldw	x, (0x35, sp)
      009584 26 0E            [ 1] 1244 	jrne	00117$
      009586 96               [ 1] 1245 	ldw	x, sp
      009587 1C 00 18         [ 2] 1246 	addw	x, #24
      00958A 89               [ 2] 1247 	pushw	x
      00958B CD 8F 03         [ 4] 1248 	call	_ld_dword
      00958E 5B 02            [ 2] 1249 	addw	sp, #2
      009590 1F 37            [ 2] 1250 	ldw	(0x37, sp), x
      009592 17 35            [ 2] 1251 	ldw	(0x35, sp), y
      009594                       1252 00117$:
                                   1253 ;	../src/pff.c: 856: fsize *= buf[BPB_NumFATs-13];						/* Number of sectors in FAT area */
      009594 7B 04            [ 1] 1254 	ld	a, (0x04, sp)
      009596 5F               [ 1] 1255 	clrw	x
      009597 97               [ 1] 1256 	ld	xl, a
      009598 90 5F            [ 1] 1257 	clrw	y
      00959A 89               [ 2] 1258 	pushw	x
      00959B 90 89            [ 2] 1259 	pushw	y
      00959D 1E 3B            [ 2] 1260 	ldw	x, (0x3b, sp)
      00959F 89               [ 2] 1261 	pushw	x
      0095A0 1E 3B            [ 2] 1262 	ldw	x, (0x3b, sp)
      0095A2 89               [ 2] 1263 	pushw	x
      0095A3 CD 9C 90         [ 4] 1264 	call	__mullong
      0095A6 5B 08            [ 2] 1265 	addw	sp, #8
      0095A8 1F 27            [ 2] 1266 	ldw	(0x27, sp), x
      0095AA 17 25            [ 2] 1267 	ldw	(0x25, sp), y
                                   1268 ;	../src/pff.c: 857: fs->fatbase = bsect + ld_word(buf+BPB_RsvdSecCnt-13); /* FAT start sector (lba) */
      0095AC 16 3F            [ 2] 1269 	ldw	y, (0x3f, sp)
      0095AE 17 29            [ 2] 1270 	ldw	(0x29, sp), y
      0095B0 93               [ 1] 1271 	ldw	x, y
      0095B1 1C 00 0A         [ 2] 1272 	addw	x, #0x000a
      0095B4 1F 2B            [ 2] 1273 	ldw	(0x2b, sp), x
      0095B6 96               [ 1] 1274 	ldw	x, sp
      0095B7 5C               [ 1] 1275 	incw	x
      0095B8 5C               [ 1] 1276 	incw	x
      0095B9 1F 3B            [ 2] 1277 	ldw	(0x3b, sp), x
      0095BB 89               [ 2] 1278 	pushw	x
      0095BC CD 8E ED         [ 4] 1279 	call	_ld_word
      0095BF 5B 02            [ 2] 1280 	addw	sp, #2
      0095C1 51               [ 1] 1281 	exgw	x, y
      0095C2 4F               [ 1] 1282 	clr	a
      0095C3 5F               [ 1] 1283 	clrw	x
      0095C4 72 F9 33         [ 2] 1284 	addw	y, (0x33, sp)
      0095C7 19 32            [ 1] 1285 	adc	a, (0x32, sp)
      0095C9 6B 36            [ 1] 1286 	ld	(0x36, sp), a
      0095CB 9E               [ 1] 1287 	ld	a, xh
      0095CC 19 31            [ 1] 1288 	adc	a, (0x31, sp)
      0095CE 6B 35            [ 1] 1289 	ld	(0x35, sp), a
      0095D0 1E 2B            [ 2] 1290 	ldw	x, (0x2b, sp)
      0095D2 EF 02            [ 2] 1291 	ldw	(0x2, x), y
      0095D4 16 35            [ 2] 1292 	ldw	y, (0x35, sp)
      0095D6 FF               [ 2] 1293 	ldw	(x), y
                                   1294 ;	../src/pff.c: 858: fs->csize = buf[BPB_SecPerClus-13];					/* Number of sectors per cluster */
      0095D7 1E 29            [ 2] 1295 	ldw	x, (0x29, sp)
      0095D9 5C               [ 1] 1296 	incw	x
      0095DA 5C               [ 1] 1297 	incw	x
      0095DB 1F 2D            [ 2] 1298 	ldw	(0x2d, sp), x
      0095DD 7B 01            [ 1] 1299 	ld	a, (0x01, sp)
      0095DF 1E 2D            [ 2] 1300 	ldw	x, (0x2d, sp)
      0095E1 F7               [ 1] 1301 	ld	(x), a
                                   1302 ;	../src/pff.c: 859: fs->n_rootdir = ld_word(buf+BPB_RootEntCnt-13);		/* Nmuber of root directory entries */
      0095E2 1E 29            [ 2] 1303 	ldw	x, (0x29, sp)
      0095E4 1C 00 04         [ 2] 1304 	addw	x, #0x0004
      0095E7 1F 2F            [ 2] 1305 	ldw	(0x2f, sp), x
      0095E9 1E 39            [ 2] 1306 	ldw	x, (0x39, sp)
      0095EB 89               [ 2] 1307 	pushw	x
      0095EC CD 8E ED         [ 4] 1308 	call	_ld_word
      0095EF 5B 02            [ 2] 1309 	addw	sp, #2
      0095F1 16 2F            [ 2] 1310 	ldw	y, (0x2f, sp)
      0095F3 90 FF            [ 2] 1311 	ldw	(y), x
                                   1312 ;	../src/pff.c: 860: tsect = ld_word(buf+BPB_TotSec16-13);				/* Number of sectors on the file system */
      0095F5 96               [ 1] 1313 	ldw	x, sp
      0095F6 1C 00 07         [ 2] 1314 	addw	x, #7
      0095F9 89               [ 2] 1315 	pushw	x
      0095FA CD 8E ED         [ 4] 1316 	call	_ld_word
      0095FD 5B 02            [ 2] 1317 	addw	sp, #2
      0095FF 90 5F            [ 1] 1318 	clrw	y
      009601 1F 37            [ 2] 1319 	ldw	(0x37, sp), x
      009603 17 35            [ 2] 1320 	ldw	(0x35, sp), y
                                   1321 ;	../src/pff.c: 861: if (!tsect) tsect = ld_dword(buf+BPB_TotSec32-13);
      009605 5D               [ 2] 1322 	tnzw	x
      009606 26 12            [ 1] 1323 	jrne	00119$
      009608 90 5D            [ 2] 1324 	tnzw	y
      00960A 26 0E            [ 1] 1325 	jrne	00119$
      00960C 96               [ 1] 1326 	ldw	x, sp
      00960D 1C 00 14         [ 2] 1327 	addw	x, #20
      009610 89               [ 2] 1328 	pushw	x
      009611 CD 8F 03         [ 4] 1329 	call	_ld_dword
      009614 5B 02            [ 2] 1330 	addw	sp, #2
      009616 1F 37            [ 2] 1331 	ldw	(0x37, sp), x
      009618 17 35            [ 2] 1332 	ldw	(0x35, sp), y
      00961A                       1333 00119$:
                                   1334 ;	../src/pff.c: 863: - ld_word(buf+BPB_RsvdSecCnt-13) - fsize - fs->n_rootdir / 16
      00961A 1E 3B            [ 2] 1335 	ldw	x, (0x3b, sp)
      00961C 89               [ 2] 1336 	pushw	x
      00961D CD 8E ED         [ 4] 1337 	call	_ld_word
      009620 5B 02            [ 2] 1338 	addw	sp, #2
      009622 1F 3B            [ 2] 1339 	ldw	(0x3b, sp), x
      009624 0F 3A            [ 1] 1340 	clr	(0x3a, sp)
      009626 0F 39            [ 1] 1341 	clr	(0x39, sp)
      009628 16 37            [ 2] 1342 	ldw	y, (0x37, sp)
      00962A 72 F2 3B         [ 2] 1343 	subw	y, (0x3b, sp)
      00962D 7B 36            [ 1] 1344 	ld	a, (0x36, sp)
      00962F 12 3A            [ 1] 1345 	sbc	a, (0x3a, sp)
      009631 88               [ 1] 1346 	push	a
      009632 7B 36            [ 1] 1347 	ld	a, (0x36, sp)
      009634 12 3A            [ 1] 1348 	sbc	a, (0x3a, sp)
      009636 97               [ 1] 1349 	ld	xl, a
      009637 84               [ 1] 1350 	pop	a
      009638 72 F2 27         [ 2] 1351 	subw	y, (0x27, sp)
      00963B 12 26            [ 1] 1352 	sbc	a, (0x26, sp)
      00963D 6B 32            [ 1] 1353 	ld	(0x32, sp), a
      00963F 9F               [ 1] 1354 	ld	a, xl
      009640 12 25            [ 1] 1355 	sbc	a, (0x25, sp)
      009642 1E 2F            [ 2] 1356 	ldw	x, (0x2f, sp)
      009644 FE               [ 2] 1357 	ldw	x, (x)
      009645 54               [ 2] 1358 	srlw	x
      009646 54               [ 2] 1359 	srlw	x
      009647 54               [ 2] 1360 	srlw	x
      009648 54               [ 2] 1361 	srlw	x
      009649 1F 37            [ 2] 1362 	ldw	(0x37, sp), x
      00964B 5F               [ 1] 1363 	clrw	x
      00964C 0F 35            [ 1] 1364 	clr	(0x35, sp)
      00964E 72 F2 37         [ 2] 1365 	subw	y, (0x37, sp)
      009651 17 3B            [ 2] 1366 	ldw	(0x3b, sp), y
      009653 88               [ 1] 1367 	push	a
      009654 7B 33            [ 1] 1368 	ld	a, (0x33, sp)
      009656 89               [ 2] 1369 	pushw	x
      009657 12 02            [ 1] 1370 	sbc	a, (2, sp)
      009659 85               [ 2] 1371 	popw	x
      00965A 6B 3B            [ 1] 1372 	ld	(0x3b, sp), a
      00965C 84               [ 1] 1373 	pop	a
      00965D 12 35            [ 1] 1374 	sbc	a, (0x35, sp)
      00965F 6B 39            [ 1] 1375 	ld	(0x39, sp), a
                                   1376 ;	../src/pff.c: 864: ) / fs->csize + 2;
      009661 1E 2D            [ 2] 1377 	ldw	x, (0x2d, sp)
      009663 F6               [ 1] 1378 	ld	a, (x)
      009664 5F               [ 1] 1379 	clrw	x
      009665 97               [ 1] 1380 	ld	xl, a
      009666 90 5F            [ 1] 1381 	clrw	y
      009668 89               [ 2] 1382 	pushw	x
      009669 90 89            [ 2] 1383 	pushw	y
      00966B 1E 3F            [ 2] 1384 	ldw	x, (0x3f, sp)
      00966D 89               [ 2] 1385 	pushw	x
      00966E 1E 3F            [ 2] 1386 	ldw	x, (0x3f, sp)
      009670 89               [ 2] 1387 	pushw	x
      009671 CD 9C 36         [ 4] 1388 	call	__divulong
      009674 5B 08            [ 2] 1389 	addw	sp, #8
      009676 17 39            [ 2] 1390 	ldw	(0x39, sp), y
      009678 1C 00 02         [ 2] 1391 	addw	x, #0x0002
      00967B 51               [ 1] 1392 	exgw	x, y
      00967C 1E 39            [ 2] 1393 	ldw	x, (0x39, sp)
      00967E 24 01            [ 1] 1394 	jrnc	00209$
      009680 5C               [ 1] 1395 	incw	x
      009681                       1396 00209$:
      009681 1F 39            [ 2] 1397 	ldw	(0x39, sp), x
                                   1398 ;	../src/pff.c: 865: fs->n_fatent = (CLUST)mclst;
      009683 1E 29            [ 2] 1399 	ldw	x, (0x29, sp)
      009685 1C 00 06         [ 2] 1400 	addw	x, #0x0006
      009688 EF 02            [ 2] 1401 	ldw	(0x2, x), y
      00968A 7B 3A            [ 1] 1402 	ld	a, (0x3a, sp)
      00968C E7 01            [ 1] 1403 	ld	(0x1, x), a
      00968E 7B 39            [ 1] 1404 	ld	a, (0x39, sp)
      009690 F7               [ 1] 1405 	ld	(x), a
                                   1406 ;	../src/pff.c: 867: fmt = 0;							/* Determine the FAT sub type */
      009691 4F               [ 1] 1407 	clr	a
                                   1408 ;	../src/pff.c: 870: if (PF_FS_FAT32 && mclst >= 0xFFF7) fmt = FS_FAT32;
      009692 90 A3 FF F7      [ 2] 1409 	cpw	y, #0xfff7
      009696 88               [ 1] 1410 	push	a
      009697 7B 3B            [ 1] 1411 	ld	a, (0x3b, sp)
      009699 A2 00            [ 1] 1412 	sbc	a, #0x00
      00969B 7B 3A            [ 1] 1413 	ld	a, (0x3a, sp)
      00969D A2 00            [ 1] 1414 	sbc	a, #0x00
      00969F 84               [ 1] 1415 	pop	a
      0096A0 25 02            [ 1] 1416 	jrc	00128$
      0096A2 A6 03            [ 1] 1417 	ld	a, #0x03
      0096A4                       1418 00128$:
                                   1419 ;	../src/pff.c: 871: if (!fmt) return FR_NO_FILESYSTEM;
      0096A4 4D               [ 1] 1420 	tnz	a
      0096A5 26 04            [ 1] 1421 	jrne	00131$
      0096A7 A6 06            [ 1] 1422 	ld	a, #0x06
      0096A9 20 65            [ 2] 1423 	jra	00137$
      0096AB                       1424 00131$:
                                   1425 ;	../src/pff.c: 872: fs->fs_type = fmt;
      0096AB 1E 29            [ 2] 1426 	ldw	x, (0x29, sp)
      0096AD F7               [ 1] 1427 	ld	(x), a
                                   1428 ;	../src/pff.c: 875: fs->dirbase = ld_dword(buf+(BPB_RootClus-13));	/* Root directory start cluster */
      0096AE 1E 29            [ 2] 1429 	ldw	x, (0x29, sp)
      0096B0 1C 00 0E         [ 2] 1430 	addw	x, #0x000e
      0096B3 1F 37            [ 2] 1431 	ldw	(0x37, sp), x
      0096B5 96               [ 1] 1432 	ldw	x, sp
      0096B6 1C 00 20         [ 2] 1433 	addw	x, #32
      0096B9 89               [ 2] 1434 	pushw	x
      0096BA CD 8F 03         [ 4] 1435 	call	_ld_dword
      0096BD 5B 02            [ 2] 1436 	addw	sp, #2
      0096BF 17 39            [ 2] 1437 	ldw	(0x39, sp), y
      0096C1 16 37            [ 2] 1438 	ldw	y, (0x37, sp)
      0096C3 90 EF 02         [ 2] 1439 	ldw	(0x2, y), x
      0096C6 1E 39            [ 2] 1440 	ldw	x, (0x39, sp)
      0096C8 90 FF            [ 2] 1441 	ldw	(y), x
                                   1442 ;	../src/pff.c: 879: fs->database = fs->fatbase + fsize + fs->n_rootdir / 16;	/* Data start sector (lba) */
      0096CA 1E 29            [ 2] 1443 	ldw	x, (0x29, sp)
      0096CC 1C 00 12         [ 2] 1444 	addw	x, #0x0012
      0096CF 1F 3B            [ 2] 1445 	ldw	(0x3b, sp), x
      0096D1 1E 2B            [ 2] 1446 	ldw	x, (0x2b, sp)
      0096D3 90 93            [ 1] 1447 	ldw	y, x
      0096D5 90 EE 02         [ 2] 1448 	ldw	y, (0x2, y)
      0096D8 FE               [ 2] 1449 	ldw	x, (x)
      0096D9 72 F9 27         [ 2] 1450 	addw	y, (0x27, sp)
      0096DC 17 39            [ 2] 1451 	ldw	(0x39, sp), y
      0096DE 9F               [ 1] 1452 	ld	a, xl
      0096DF 19 26            [ 1] 1453 	adc	a, (0x26, sp)
      0096E1 6B 38            [ 1] 1454 	ld	(0x38, sp), a
      0096E3 9E               [ 1] 1455 	ld	a, xh
      0096E4 19 25            [ 1] 1456 	adc	a, (0x25, sp)
      0096E6 1E 2F            [ 2] 1457 	ldw	x, (0x2f, sp)
      0096E8 FE               [ 2] 1458 	ldw	x, (x)
      0096E9 54               [ 2] 1459 	srlw	x
      0096EA 54               [ 2] 1460 	srlw	x
      0096EB 54               [ 2] 1461 	srlw	x
      0096EC 54               [ 2] 1462 	srlw	x
      0096ED 51               [ 1] 1463 	exgw	x, y
      0096EE 5F               [ 1] 1464 	clrw	x
      0096EF 0F 2F            [ 1] 1465 	clr	(0x2f, sp)
      0096F1 72 F9 39         [ 2] 1466 	addw	y, (0x39, sp)
      0096F4 88               [ 1] 1467 	push	a
      0096F5 9F               [ 1] 1468 	ld	a, xl
      0096F6 19 39            [ 1] 1469 	adc	a, (0x39, sp)
      0096F8 6B 35            [ 1] 1470 	ld	(0x35, sp), a
      0096FA 84               [ 1] 1471 	pop	a
      0096FB 19 2F            [ 1] 1472 	adc	a, (0x2f, sp)
      0096FD 6B 33            [ 1] 1473 	ld	(0x33, sp), a
      0096FF 1E 3B            [ 2] 1474 	ldw	x, (0x3b, sp)
      009701 EF 02            [ 2] 1475 	ldw	(0x2, x), y
      009703 16 33            [ 2] 1476 	ldw	y, (0x33, sp)
      009705 FF               [ 2] 1477 	ldw	(x), y
                                   1478 ;	../src/pff.c: 881: fs->flag = 0;
      009706 1E 29            [ 2] 1479 	ldw	x, (0x29, sp)
      009708 5C               [ 1] 1480 	incw	x
      009709 7F               [ 1] 1481 	clr	(x)
                                   1482 ;	../src/pff.c: 882: FatFs = fs;
      00970A 1E 29            [ 2] 1483 	ldw	x, (0x29, sp)
      00970C CF 02 61         [ 2] 1484 	ldw	_FatFs+0, x
                                   1485 ;	../src/pff.c: 884: return FR_OK;
      00970F 4F               [ 1] 1486 	clr	a
      009710                       1487 00137$:
                                   1488 ;	../src/pff.c: 885: }
      009710 5B 3C            [ 2] 1489 	addw	sp, #60
      009712 81               [ 4] 1490 	ret
                                   1491 ;	../src/pff.c: 894: FRESULT pf_open (
                                   1492 ;	-----------------------------------------
                                   1493 ;	 function pf_open
                                   1494 ;	-----------------------------------------
      009713                       1495 _pf_open:
      009713 52 46            [ 2] 1496 	sub	sp, #70
                                   1497 ;	../src/pff.c: 901: FATFS *fs = FatFs;
      009715 CE 02 61         [ 2] 1498 	ldw	x, _FatFs+0
                                   1499 ;	../src/pff.c: 904: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
      009718 1F 3D            [ 2] 1500 	ldw	(0x3d, sp), x
      00971A 26 05            [ 1] 1501 	jrne	00102$
      00971C A6 05            [ 1] 1502 	ld	a, #0x05
      00971E CC 97 A1         [ 2] 1503 	jp	00108$
      009721                       1504 00102$:
                                   1505 ;	../src/pff.c: 906: fs->flag = 0;
      009721 1E 3D            [ 2] 1506 	ldw	x, (0x3d, sp)
      009723 5C               [ 1] 1507 	incw	x
      009724 1F 3F            [ 2] 1508 	ldw	(0x3f, sp), x
      009726 7F               [ 1] 1509 	clr	(x)
                                   1510 ;	../src/pff.c: 907: dj.fn = sp;
      009727 96               [ 1] 1511 	ldw	x, sp
      009728 1C 00 03         [ 2] 1512 	addw	x, #3
      00972B 90 96            [ 1] 1513 	ldw	y, sp
      00972D 72 A9 00 11      [ 2] 1514 	addw	y, #17
      009731 FF               [ 2] 1515 	ldw	(x), y
                                   1516 ;	../src/pff.c: 908: res = follow_path(&dj, dir, path);	/* Follow the file path */
      009732 1E 49            [ 2] 1517 	ldw	x, (0x49, sp)
      009734 89               [ 2] 1518 	pushw	x
      009735 96               [ 1] 1519 	ldw	x, sp
      009736 1C 00 1F         [ 2] 1520 	addw	x, #31
      009739 89               [ 2] 1521 	pushw	x
      00973A 96               [ 1] 1522 	ldw	x, sp
      00973B 1C 00 05         [ 2] 1523 	addw	x, #5
      00973E 89               [ 2] 1524 	pushw	x
      00973F CD 93 CF         [ 4] 1525 	call	_follow_path
      009742 5B 06            [ 2] 1526 	addw	sp, #6
      009744 97               [ 1] 1527 	ld	xl, a
                                   1528 ;	../src/pff.c: 909: if (res != FR_OK) return res;		/* Follow failed */
      009745 4D               [ 1] 1529 	tnz	a
      009746 27 03            [ 1] 1530 	jreq	00104$
      009748 9F               [ 1] 1531 	ld	a, xl
      009749 20 56            [ 2] 1532 	jra	00108$
      00974B                       1533 00104$:
                                   1534 ;	../src/pff.c: 910: if (!dir[0] || (dir[DIR_Attr] & AM_DIR)) return FR_NO_FILE;	/* It is a directory */
      00974B 7B 1D            [ 1] 1535 	ld	a, (0x1d, sp)
      00974D 27 06            [ 1] 1536 	jreq	00105$
      00974F 7B 28            [ 1] 1537 	ld	a, (0x28, sp)
      009751 A5 10            [ 1] 1538 	bcp	a, #0x10
      009753 27 04            [ 1] 1539 	jreq	00106$
      009755                       1540 00105$:
      009755 A6 03            [ 1] 1541 	ld	a, #0x03
      009757 20 48            [ 2] 1542 	jra	00108$
      009759                       1543 00106$:
                                   1544 ;	../src/pff.c: 912: fs->org_clust = get_clust(dir);		/* File start cluster */
      009759 1E 3D            [ 2] 1545 	ldw	x, (0x3d, sp)
      00975B 1C 00 1E         [ 2] 1546 	addw	x, #0x001e
      00975E 1F 41            [ 2] 1547 	ldw	(0x41, sp), x
      009760 96               [ 1] 1548 	ldw	x, sp
      009761 1C 00 1D         [ 2] 1549 	addw	x, #29
      009764 89               [ 2] 1550 	pushw	x
      009765 CD 90 EF         [ 4] 1551 	call	_get_clust
      009768 5B 02            [ 2] 1552 	addw	sp, #2
      00976A 17 43            [ 2] 1553 	ldw	(0x43, sp), y
      00976C 16 41            [ 2] 1554 	ldw	y, (0x41, sp)
      00976E 90 EF 02         [ 2] 1555 	ldw	(0x2, y), x
      009771 1E 43            [ 2] 1556 	ldw	x, (0x43, sp)
      009773 90 FF            [ 2] 1557 	ldw	(y), x
                                   1558 ;	../src/pff.c: 913: fs->fsize = ld_dword(dir+DIR_FileSize);	/* File size */
      009775 1E 3D            [ 2] 1559 	ldw	x, (0x3d, sp)
      009777 1C 00 1A         [ 2] 1560 	addw	x, #0x001a
      00977A 1F 41            [ 2] 1561 	ldw	(0x41, sp), x
      00977C 96               [ 1] 1562 	ldw	x, sp
      00977D 1C 00 39         [ 2] 1563 	addw	x, #57
      009780 89               [ 2] 1564 	pushw	x
      009781 CD 8F 03         [ 4] 1565 	call	_ld_dword
      009784 5B 02            [ 2] 1566 	addw	sp, #2
      009786 17 43            [ 2] 1567 	ldw	(0x43, sp), y
      009788 16 41            [ 2] 1568 	ldw	y, (0x41, sp)
      00978A 90 EF 02         [ 2] 1569 	ldw	(0x2, y), x
      00978D 1E 43            [ 2] 1570 	ldw	x, (0x43, sp)
      00978F 90 FF            [ 2] 1571 	ldw	(y), x
                                   1572 ;	../src/pff.c: 914: fs->fptr = 0;						/* File pointer */
      009791 1E 3D            [ 2] 1573 	ldw	x, (0x3d, sp)
      009793 1C 00 16         [ 2] 1574 	addw	x, #0x0016
      009796 90 5F            [ 1] 1575 	clrw	y
      009798 EF 02            [ 2] 1576 	ldw	(0x2, x), y
      00979A FF               [ 2] 1577 	ldw	(x), y
                                   1578 ;	../src/pff.c: 915: fs->flag = FA_OPENED;
      00979B 1E 3F            [ 2] 1579 	ldw	x, (0x3f, sp)
      00979D A6 01            [ 1] 1580 	ld	a, #0x01
      00979F F7               [ 1] 1581 	ld	(x), a
                                   1582 ;	../src/pff.c: 917: return FR_OK;
      0097A0 4F               [ 1] 1583 	clr	a
      0097A1                       1584 00108$:
                                   1585 ;	../src/pff.c: 918: }
      0097A1 5B 46            [ 2] 1586 	addw	sp, #70
      0097A3 81               [ 4] 1587 	ret
                                   1588 ;	../src/pff.c: 928: FRESULT pf_read (
                                   1589 ;	-----------------------------------------
                                   1590 ;	 function pf_read
                                   1591 ;	-----------------------------------------
      0097A4                       1592 _pf_read:
      0097A4 52 1A            [ 2] 1593 	sub	sp, #26
                                   1594 ;	../src/pff.c: 938: BYTE cs, *rbuff = buff;
      0097A6 1E 1D            [ 2] 1595 	ldw	x, (0x1d, sp)
      0097A8 1F 01            [ 2] 1596 	ldw	(0x01, sp), x
                                   1597 ;	../src/pff.c: 939: FATFS *fs = FatFs;
      0097AA CE 02 61         [ 2] 1598 	ldw	x, _FatFs+0
      0097AD 1F 19            [ 2] 1599 	ldw	(0x19, sp), x
                                   1600 ;	../src/pff.c: 942: *br = 0;
      0097AF 16 21            [ 2] 1601 	ldw	y, (0x21, sp)
      0097B1 17 03            [ 2] 1602 	ldw	(0x03, sp), y
      0097B3 93               [ 1] 1603 	ldw	x, y
      0097B4 6F 01            [ 1] 1604 	clr	(0x1, x)
      0097B6 7F               [ 1] 1605 	clr	(x)
                                   1606 ;	../src/pff.c: 943: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
      0097B7 1E 19            [ 2] 1607 	ldw	x, (0x19, sp)
      0097B9 26 05            [ 1] 1608 	jrne	00102$
      0097BB A6 05            [ 1] 1609 	ld	a, #0x05
      0097BD CC 99 8F         [ 2] 1610 	jp	00127$
      0097C0                       1611 00102$:
                                   1612 ;	../src/pff.c: 944: if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
      0097C0 1E 19            [ 2] 1613 	ldw	x, (0x19, sp)
      0097C2 5C               [ 1] 1614 	incw	x
      0097C3 1F 05            [ 2] 1615 	ldw	(0x05, sp), x
      0097C5 F6               [ 1] 1616 	ld	a, (x)
      0097C6 44               [ 1] 1617 	srl	a
      0097C7 25 05            [ 1] 1618 	jrc	00104$
      0097C9 A6 04            [ 1] 1619 	ld	a, #0x04
      0097CB CC 99 8F         [ 2] 1620 	jp	00127$
      0097CE                       1621 00104$:
                                   1622 ;	../src/pff.c: 946: remain = fs->fsize - fs->fptr;
      0097CE 1E 19            [ 2] 1623 	ldw	x, (0x19, sp)
      0097D0 90 93            [ 1] 1624 	ldw	y, x
      0097D2 90 EE 1C         [ 2] 1625 	ldw	y, (0x1c, y)
      0097D5 EE 1A            [ 2] 1626 	ldw	x, (0x1a, x)
      0097D7 1F 11            [ 2] 1627 	ldw	(0x11, sp), x
      0097D9 1E 19            [ 2] 1628 	ldw	x, (0x19, sp)
      0097DB 1C 00 16         [ 2] 1629 	addw	x, #0x0016
      0097DE 1F 07            [ 2] 1630 	ldw	(0x07, sp), x
      0097E0 E6 03            [ 1] 1631 	ld	a, (0x3, x)
      0097E2 6B 18            [ 1] 1632 	ld	(0x18, sp), a
      0097E4 E6 02            [ 1] 1633 	ld	a, (0x2, x)
      0097E6 6B 17            [ 1] 1634 	ld	(0x17, sp), a
      0097E8 FE               [ 2] 1635 	ldw	x, (x)
      0097E9 72 F2 17         [ 2] 1636 	subw	y, (0x17, sp)
      0097EC 7B 12            [ 1] 1637 	ld	a, (0x12, sp)
      0097EE 89               [ 2] 1638 	pushw	x
      0097EF 12 02            [ 1] 1639 	sbc	a, (2, sp)
      0097F1 85               [ 2] 1640 	popw	x
      0097F2 97               [ 1] 1641 	ld	xl, a
      0097F3 7B 11            [ 1] 1642 	ld	a, (0x11, sp)
      0097F5 89               [ 2] 1643 	pushw	x
      0097F6 12 01            [ 1] 1644 	sbc	a, (1, sp)
      0097F8 85               [ 2] 1645 	popw	x
      0097F9 17 13            [ 2] 1646 	ldw	(0x13, sp), y
      0097FB 95               [ 1] 1647 	ld	xh, a
                                   1648 ;	../src/pff.c: 947: if (btr > remain) btr = (UINT)remain;			/* Truncate btr by remaining bytes */
      0097FC 16 1F            [ 2] 1649 	ldw	y, (0x1f, sp)
      0097FE 17 17            [ 2] 1650 	ldw	(0x17, sp), y
      009800 0F 16            [ 1] 1651 	clr	(0x16, sp)
      009802 0F 15            [ 1] 1652 	clr	(0x15, sp)
      009804 7B 14            [ 1] 1653 	ld	a, (0x14, sp)
      009806 11 18            [ 1] 1654 	cp	a, (0x18, sp)
      009808 7B 13            [ 1] 1655 	ld	a, (0x13, sp)
      00980A 12 17            [ 1] 1656 	sbc	a, (0x17, sp)
      00980C 9F               [ 1] 1657 	ld	a, xl
      00980D 12 16            [ 1] 1658 	sbc	a, (0x16, sp)
      00980F 9E               [ 1] 1659 	ld	a, xh
      009810 12 15            [ 1] 1660 	sbc	a, (0x15, sp)
      009812 24 04            [ 1] 1661 	jrnc	00140$
      009814 1E 13            [ 2] 1662 	ldw	x, (0x13, sp)
      009816 1F 1F            [ 2] 1663 	ldw	(0x1f, sp), x
                                   1664 ;	../src/pff.c: 949: while (btr)	{									/* Repeat until all data transferred */
      009818                       1665 00140$:
      009818 1E 19            [ 2] 1666 	ldw	x, (0x19, sp)
      00981A 1C 00 22         [ 2] 1667 	addw	x, #0x0022
      00981D 1F 09            [ 2] 1668 	ldw	(0x09, sp), x
      00981F 16 19            [ 2] 1669 	ldw	y, (0x19, sp)
      009821 17 0B            [ 2] 1670 	ldw	(0x0b, sp), y
      009823 16 19            [ 2] 1671 	ldw	y, (0x19, sp)
      009825 17 0D            [ 2] 1672 	ldw	(0x0d, sp), y
      009827 1E 19            [ 2] 1673 	ldw	x, (0x19, sp)
      009829 1C 00 26         [ 2] 1674 	addw	x, #0x0026
      00982C 1F 0F            [ 2] 1675 	ldw	(0x0f, sp), x
      00982E                       1676 00124$:
      00982E 1E 1F            [ 2] 1677 	ldw	x, (0x1f, sp)
      009830 26 03            [ 1] 1678 	jrne	00197$
      009832 CC 99 8E         [ 2] 1679 	jp	00126$
      009835                       1680 00197$:
                                   1681 ;	../src/pff.c: 950: if ((fs->fptr % 512) == 0) {				/* On the sector boundary? */
      009835 1E 07            [ 2] 1682 	ldw	x, (0x07, sp)
      009837 90 93            [ 1] 1683 	ldw	y, x
      009839 90 EE 02         [ 2] 1684 	ldw	y, (0x2, y)
      00983C 17 13            [ 2] 1685 	ldw	(0x13, sp), y
      00983E FE               [ 2] 1686 	ldw	x, (x)
      00983F 1F 11            [ 2] 1687 	ldw	(0x11, sp), x
      009841 7B 14            [ 1] 1688 	ld	a, (0x14, sp)
      009843 6B 1A            [ 1] 1689 	ld	(0x1a, sp), a
      009845 7B 13            [ 1] 1690 	ld	a, (0x13, sp)
      009847 A4 01            [ 1] 1691 	and	a, #0x01
      009849 6B 19            [ 1] 1692 	ld	(0x19, sp), a
      00984B 5F               [ 1] 1693 	clrw	x
      00984C 1F 17            [ 2] 1694 	ldw	(0x17, sp), x
      00984E 1E 19            [ 2] 1695 	ldw	x, (0x19, sp)
      009850 26 04            [ 1] 1696 	jrne	00198$
      009852 1E 17            [ 2] 1697 	ldw	x, (0x17, sp)
      009854 27 03            [ 1] 1698 	jreq	00199$
      009856                       1699 00198$:
      009856 CC 99 05         [ 2] 1700 	jp	00117$
      009859                       1701 00199$:
                                   1702 ;	../src/pff.c: 951: cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
      009859 16 12            [ 2] 1703 	ldw	y, (0x12, sp)
      00985B 17 17            [ 2] 1704 	ldw	(0x17, sp), y
      00985D 7B 11            [ 1] 1705 	ld	a, (0x11, sp)
      00985F 6B 16            [ 1] 1706 	ld	(0x16, sp), a
      009861 0F 15            [ 1] 1707 	clr	(0x15, sp)
      009863 04 16            [ 1] 1708 	srl	(0x16, sp)
      009865 06 17            [ 1] 1709 	rrc	(0x17, sp)
      009867 06 18            [ 1] 1710 	rrc	(0x18, sp)
      009869 1E 0D            [ 2] 1711 	ldw	x, (0x0d, sp)
      00986B E6 02            [ 1] 1712 	ld	a, (0x2, x)
      00986D 6B 1A            [ 1] 1713 	ld	(0x1a, sp), a
      00986F 0A 1A            [ 1] 1714 	dec	(0x1a, sp)
      009871 7B 1A            [ 1] 1715 	ld	a, (0x1a, sp)
      009873 6B 19            [ 1] 1716 	ld	(0x19, sp), a
      009875 7B 18            [ 1] 1717 	ld	a, (0x18, sp)
      009877 6B 1A            [ 1] 1718 	ld	(0x1a, sp), a
      009879 14 19            [ 1] 1719 	and	a, (0x19, sp)
                                   1720 ;	../src/pff.c: 952: if (!cs) {								/* On the cluster boundary? */
      00987B 6B 1A            [ 1] 1721 	ld	(0x1a, sp), a
      00987D 26 48            [ 1] 1722 	jrne	00113$
                                   1723 ;	../src/pff.c: 953: if (fs->fptr == 0) {				/* On the top of the file? */
      00987F 1E 13            [ 2] 1724 	ldw	x, (0x13, sp)
      009881 26 13            [ 1] 1725 	jrne	00108$
      009883 1E 11            [ 2] 1726 	ldw	x, (0x11, sp)
      009885 26 0F            [ 1] 1727 	jrne	00108$
                                   1728 ;	../src/pff.c: 954: clst = fs->org_clust;
      009887 1E 0B            [ 2] 1729 	ldw	x, (0x0b, sp)
      009889 90 93            [ 1] 1730 	ldw	y, x
      00988B 90 EE 20         [ 2] 1731 	ldw	y, (0x20, y)
      00988E EE 1E            [ 2] 1732 	ldw	x, (0x1e, x)
      009890 17 18            [ 2] 1733 	ldw	(0x18, sp), y
      009892 1F 16            [ 2] 1734 	ldw	(0x16, sp), x
      009894 20 14            [ 2] 1735 	jra	00109$
      009896                       1736 00108$:
                                   1737 ;	../src/pff.c: 956: clst = get_fat(fs->curr_clust);
      009896 1E 09            [ 2] 1738 	ldw	x, (0x09, sp)
      009898 90 93            [ 1] 1739 	ldw	y, x
      00989A 90 EE 02         [ 2] 1740 	ldw	y, (0x2, y)
      00989D FE               [ 2] 1741 	ldw	x, (x)
      00989E 90 89            [ 2] 1742 	pushw	y
      0098A0 89               [ 2] 1743 	pushw	x
      0098A1 CD 8F D6         [ 4] 1744 	call	_get_fat
      0098A4 5B 04            [ 2] 1745 	addw	sp, #4
      0098A6 17 16            [ 2] 1746 	ldw	(0x16, sp), y
      0098A8 1F 18            [ 2] 1747 	ldw	(0x18, sp), x
      0098AA                       1748 00109$:
                                   1749 ;	../src/pff.c: 958: if (clst <= 1) ABORT(FR_DISK_ERR);
      0098AA 5F               [ 1] 1750 	clrw	x
      0098AB 5C               [ 1] 1751 	incw	x
      0098AC 13 18            [ 2] 1752 	cpw	x, (0x18, sp)
      0098AE 4F               [ 1] 1753 	clr	a
      0098AF 12 17            [ 1] 1754 	sbc	a, (0x17, sp)
      0098B1 4F               [ 1] 1755 	clr	a
      0098B2 12 16            [ 1] 1756 	sbc	a, (0x16, sp)
      0098B4 25 08            [ 1] 1757 	jrc	00111$
      0098B6 1E 05            [ 2] 1758 	ldw	x, (0x05, sp)
      0098B8 7F               [ 1] 1759 	clr	(x)
      0098B9 A6 01            [ 1] 1760 	ld	a, #0x01
      0098BB CC 99 8F         [ 2] 1761 	jp	00127$
      0098BE                       1762 00111$:
                                   1763 ;	../src/pff.c: 959: fs->curr_clust = clst;				/* Update current cluster */
      0098BE 1E 09            [ 2] 1764 	ldw	x, (0x09, sp)
      0098C0 16 18            [ 2] 1765 	ldw	y, (0x18, sp)
      0098C2 EF 02            [ 2] 1766 	ldw	(0x2, x), y
      0098C4 16 16            [ 2] 1767 	ldw	y, (0x16, sp)
      0098C6 FF               [ 2] 1768 	ldw	(x), y
      0098C7                       1769 00113$:
                                   1770 ;	../src/pff.c: 961: sect = clust2sect(fs->curr_clust);		/* Get current sector */
      0098C7 1E 09            [ 2] 1771 	ldw	x, (0x09, sp)
      0098C9 90 93            [ 1] 1772 	ldw	y, x
      0098CB 90 EE 02         [ 2] 1773 	ldw	y, (0x2, y)
      0098CE FE               [ 2] 1774 	ldw	x, (x)
      0098CF 90 89            [ 2] 1775 	pushw	y
      0098D1 89               [ 2] 1776 	pushw	x
      0098D2 CD 90 7D         [ 4] 1777 	call	_clust2sect
      0098D5 5B 04            [ 2] 1778 	addw	sp, #4
      0098D7 1F 18            [ 2] 1779 	ldw	(0x18, sp), x
      0098D9 17 16            [ 2] 1780 	ldw	(0x16, sp), y
                                   1781 ;	../src/pff.c: 962: if (!sect) ABORT(FR_DISK_ERR);
      0098DB 5D               [ 2] 1782 	tnzw	x
      0098DC 26 0C            [ 1] 1783 	jrne	00115$
      0098DE 90 5D            [ 2] 1784 	tnzw	y
      0098E0 26 08            [ 1] 1785 	jrne	00115$
      0098E2 1E 05            [ 2] 1786 	ldw	x, (0x05, sp)
      0098E4 7F               [ 1] 1787 	clr	(x)
      0098E5 A6 01            [ 1] 1788 	ld	a, #0x01
      0098E7 CC 99 8F         [ 2] 1789 	jp	00127$
      0098EA                       1790 00115$:
                                   1791 ;	../src/pff.c: 963: fs->dsect = sect + cs;
      0098EA 7B 1A            [ 1] 1792 	ld	a, (0x1a, sp)
      0098EC 90 5F            [ 1] 1793 	clrw	y
      0098EE 5F               [ 1] 1794 	clrw	x
      0098EF 90 97            [ 1] 1795 	ld	yl, a
      0098F1 72 F9 18         [ 2] 1796 	addw	y, (0x18, sp)
      0098F4 9F               [ 1] 1797 	ld	a, xl
      0098F5 19 17            [ 1] 1798 	adc	a, (0x17, sp)
      0098F7 6B 13            [ 1] 1799 	ld	(0x13, sp), a
      0098F9 9E               [ 1] 1800 	ld	a, xh
      0098FA 19 16            [ 1] 1801 	adc	a, (0x16, sp)
      0098FC 6B 12            [ 1] 1802 	ld	(0x12, sp), a
      0098FE 1E 0F            [ 2] 1803 	ldw	x, (0x0f, sp)
      009900 EF 02            [ 2] 1804 	ldw	(0x2, x), y
      009902 16 12            [ 2] 1805 	ldw	y, (0x12, sp)
      009904 FF               [ 2] 1806 	ldw	(x), y
      009905                       1807 00117$:
                                   1808 ;	../src/pff.c: 946: remain = fs->fsize - fs->fptr;
      009905 1E 07            [ 2] 1809 	ldw	x, (0x07, sp)
      009907 EE 02            [ 2] 1810 	ldw	x, (0x2, x)
                                   1811 ;	../src/pff.c: 965: rcnt = 512 - (UINT)fs->fptr % 512;			/* Get partial sector data from sector buffer */
      009909 9F               [ 1] 1812 	ld	a, xl
      00990A 6B 16            [ 1] 1813 	ld	(0x16, sp), a
      00990C 9E               [ 1] 1814 	ld	a, xh
      00990D A4 01            [ 1] 1815 	and	a, #0x01
      00990F 6B 15            [ 1] 1816 	ld	(0x15, sp), a
      009911 5F               [ 1] 1817 	clrw	x
      009912 A6 02            [ 1] 1818 	ld	a, #0x02
      009914 95               [ 1] 1819 	ld	xh, a
      009915 72 F0 15         [ 2] 1820 	subw	x, (0x15, sp)
                                   1821 ;	../src/pff.c: 966: if (rcnt > btr) rcnt = btr;
      009918 1F 11            [ 2] 1822 	ldw	(0x11, sp), x
      00991A 13 1F            [ 2] 1823 	cpw	x, (0x1f, sp)
      00991C 23 04            [ 2] 1824 	jrule	00119$
      00991E 16 1F            [ 2] 1825 	ldw	y, (0x1f, sp)
      009920 17 11            [ 2] 1826 	ldw	(0x11, sp), y
      009922                       1827 00119$:
                                   1828 ;	../src/pff.c: 967: dr = disk_readp(rbuff, fs->dsect, (UINT)fs->fptr % 512, rcnt);
      009922 1E 0F            [ 2] 1829 	ldw	x, (0x0f, sp)
      009924 90 93            [ 1] 1830 	ldw	y, x
      009926 90 EE 02         [ 2] 1831 	ldw	y, (0x2, y)
      009929 FE               [ 2] 1832 	ldw	x, (x)
      00992A 1F 17            [ 2] 1833 	ldw	(0x17, sp), x
      00992C 1E 11            [ 2] 1834 	ldw	x, (0x11, sp)
      00992E 89               [ 2] 1835 	pushw	x
      00992F 1E 17            [ 2] 1836 	ldw	x, (0x17, sp)
      009931 89               [ 2] 1837 	pushw	x
      009932 90 89            [ 2] 1838 	pushw	y
      009934 1E 1D            [ 2] 1839 	ldw	x, (0x1d, sp)
      009936 89               [ 2] 1840 	pushw	x
      009937 1E 09            [ 2] 1841 	ldw	x, (0x09, sp)
      009939 89               [ 2] 1842 	pushw	x
      00993A CD 82 84         [ 4] 1843 	call	_disk_readp
      00993D 5B 0A            [ 2] 1844 	addw	sp, #10
                                   1845 ;	../src/pff.c: 968: if (dr) ABORT(FR_DISK_ERR);
      00993F 4D               [ 1] 1846 	tnz	a
      009940 27 07            [ 1] 1847 	jreq	00121$
      009942 1E 05            [ 2] 1848 	ldw	x, (0x05, sp)
      009944 7F               [ 1] 1849 	clr	(x)
      009945 A6 01            [ 1] 1850 	ld	a, #0x01
      009947 20 46            [ 2] 1851 	jra	00127$
      009949                       1852 00121$:
                                   1853 ;	../src/pff.c: 969: fs->fptr += rcnt;							/* Advances file read pointer */
      009949 1E 07            [ 2] 1854 	ldw	x, (0x07, sp)
      00994B 90 93            [ 1] 1855 	ldw	y, x
      00994D 90 EE 02         [ 2] 1856 	ldw	y, (0x2, y)
      009950 17 15            [ 2] 1857 	ldw	(0x15, sp), y
      009952 FE               [ 2] 1858 	ldw	x, (x)
      009953 1F 13            [ 2] 1859 	ldw	(0x13, sp), x
      009955 16 11            [ 2] 1860 	ldw	y, (0x11, sp)
      009957 4F               [ 1] 1861 	clr	a
      009958 5F               [ 1] 1862 	clrw	x
      009959 72 F9 15         [ 2] 1863 	addw	y, (0x15, sp)
      00995C 19 14            [ 1] 1864 	adc	a, (0x14, sp)
      00995E 6B 18            [ 1] 1865 	ld	(0x18, sp), a
      009960 9F               [ 1] 1866 	ld	a, xl
      009961 19 13            [ 1] 1867 	adc	a, (0x13, sp)
      009963 6B 17            [ 1] 1868 	ld	(0x17, sp), a
      009965 1E 07            [ 2] 1869 	ldw	x, (0x07, sp)
      009967 EF 02            [ 2] 1870 	ldw	(0x2, x), y
      009969 16 17            [ 2] 1871 	ldw	y, (0x17, sp)
      00996B FF               [ 2] 1872 	ldw	(x), y
                                   1873 ;	../src/pff.c: 970: btr -= rcnt; *br += rcnt;					/* Update read counter */
      00996C 1E 1F            [ 2] 1874 	ldw	x, (0x1f, sp)
      00996E 72 F0 11         [ 2] 1875 	subw	x, (0x11, sp)
      009971 1F 1F            [ 2] 1876 	ldw	(0x1f, sp), x
      009973 1E 03            [ 2] 1877 	ldw	x, (0x03, sp)
      009975 FE               [ 2] 1878 	ldw	x, (x)
      009976 72 FB 11         [ 2] 1879 	addw	x, (0x11, sp)
      009979 16 03            [ 2] 1880 	ldw	y, (0x03, sp)
      00997B 90 FF            [ 2] 1881 	ldw	(y), x
                                   1882 ;	../src/pff.c: 971: if (rbuff) rbuff += rcnt;					/* Advances the data pointer if destination is memory */
      00997D 1E 01            [ 2] 1883 	ldw	x, (0x01, sp)
      00997F 26 03            [ 1] 1884 	jrne	00208$
      009981 CC 98 2E         [ 2] 1885 	jp	00124$
      009984                       1886 00208$:
      009984 1E 01            [ 2] 1887 	ldw	x, (0x01, sp)
      009986 72 FB 11         [ 2] 1888 	addw	x, (0x11, sp)
      009989 1F 01            [ 2] 1889 	ldw	(0x01, sp), x
      00998B CC 98 2E         [ 2] 1890 	jp	00124$
      00998E                       1891 00126$:
                                   1892 ;	../src/pff.c: 974: return FR_OK;
      00998E 4F               [ 1] 1893 	clr	a
      00998F                       1894 00127$:
                                   1895 ;	../src/pff.c: 975: }
      00998F 5B 1A            [ 2] 1896 	addw	sp, #26
      009991 81               [ 4] 1897 	ret
                                   1898 ;	../src/pff.c: 985: FRESULT pf_write (
                                   1899 ;	-----------------------------------------
                                   1900 ;	 function pf_write
                                   1901 ;	-----------------------------------------
      009992                       1902 _pf_write:
      009992 52 1C            [ 2] 1903 	sub	sp, #28
                                   1904 ;	../src/pff.c: 993: const BYTE *p = buff;
      009994 1E 1F            [ 2] 1905 	ldw	x, (0x1f, sp)
      009996 1F 05            [ 2] 1906 	ldw	(0x05, sp), x
                                   1907 ;	../src/pff.c: 996: FATFS *fs = FatFs;
      009998 CE 02 61         [ 2] 1908 	ldw	x, _FatFs+0
      00999B 1F 07            [ 2] 1909 	ldw	(0x07, sp), x
                                   1910 ;	../src/pff.c: 999: *bw = 0;
      00999D 16 23            [ 2] 1911 	ldw	y, (0x23, sp)
      00999F 17 09            [ 2] 1912 	ldw	(0x09, sp), y
      0099A1 93               [ 1] 1913 	ldw	x, y
      0099A2 6F 01            [ 1] 1914 	clr	(0x1, x)
      0099A4 7F               [ 1] 1915 	clr	(x)
                                   1916 ;	../src/pff.c: 1000: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
      0099A5 1E 07            [ 2] 1917 	ldw	x, (0x07, sp)
      0099A7 26 05            [ 1] 1918 	jrne	00102$
      0099A9 A6 05            [ 1] 1919 	ld	a, #0x05
      0099AB CC 9B FE         [ 2] 1920 	jp	00139$
      0099AE                       1921 00102$:
                                   1922 ;	../src/pff.c: 1001: if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
      0099AE 1E 07            [ 2] 1923 	ldw	x, (0x07, sp)
      0099B0 5C               [ 1] 1924 	incw	x
      0099B1 1F 0B            [ 2] 1925 	ldw	(0x0b, sp), x
      0099B3 F6               [ 1] 1926 	ld	a, (x)
      0099B4 A5 01            [ 1] 1927 	bcp	a, #0x01
      0099B6 26 05            [ 1] 1928 	jrne	00104$
      0099B8 A6 04            [ 1] 1929 	ld	a, #0x04
      0099BA CC 9B FE         [ 2] 1930 	jp	00139$
      0099BD                       1931 00104$:
                                   1932 ;	../src/pff.c: 1004: if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
      0099BD A4 40            [ 1] 1933 	and	a, #0x40
      0099BF 6B 1C            [ 1] 1934 	ld	(0x1c, sp), a
      0099C1 0F 1B            [ 1] 1935 	clr	(0x1b, sp)
                                   1936 ;	../src/pff.c: 1003: if (!btw) {		/* Finalize request */
      0099C3 1E 21            [ 2] 1937 	ldw	x, (0x21, sp)
      0099C5 26 26            [ 1] 1938 	jrne	00111$
                                   1939 ;	../src/pff.c: 1004: if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
      0099C7 1E 1B            [ 2] 1940 	ldw	x, (0x1b, sp)
      0099C9 27 16            [ 1] 1941 	jreq	00106$
      0099CB 5F               [ 1] 1942 	clrw	x
      0099CC 89               [ 2] 1943 	pushw	x
      0099CD 5F               [ 1] 1944 	clrw	x
      0099CE 89               [ 2] 1945 	pushw	x
      0099CF 5F               [ 1] 1946 	clrw	x
      0099D0 89               [ 2] 1947 	pushw	x
      0099D1 CD 83 59         [ 4] 1948 	call	_disk_writep
      0099D4 5B 06            [ 2] 1949 	addw	sp, #6
      0099D6 4D               [ 1] 1950 	tnz	a
      0099D7 27 08            [ 1] 1951 	jreq	00106$
      0099D9 1E 0B            [ 2] 1952 	ldw	x, (0x0b, sp)
      0099DB 7F               [ 1] 1953 	clr	(x)
      0099DC A6 01            [ 1] 1954 	ld	a, #0x01
      0099DE CC 9B FE         [ 2] 1955 	jp	00139$
      0099E1                       1956 00106$:
                                   1957 ;	../src/pff.c: 1005: fs->flag &= ~FA__WIP;
      0099E1 1E 0B            [ 2] 1958 	ldw	x, (0x0b, sp)
      0099E3 F6               [ 1] 1959 	ld	a, (x)
      0099E4 A4 BF            [ 1] 1960 	and	a, #0xbf
      0099E6 1E 0B            [ 2] 1961 	ldw	x, (0x0b, sp)
      0099E8 F7               [ 1] 1962 	ld	(x), a
                                   1963 ;	../src/pff.c: 1006: return FR_OK;
      0099E9 4F               [ 1] 1964 	clr	a
      0099EA CC 9B FE         [ 2] 1965 	jp	00139$
      0099ED                       1966 00111$:
                                   1967 ;	../src/pff.c: 1009: fs->fptr &= 0xFFFFFE00;
      0099ED 1E 07            [ 2] 1968 	ldw	x, (0x07, sp)
      0099EF 1C 00 16         [ 2] 1969 	addw	x, #0x0016
      0099F2 1F 13            [ 2] 1970 	ldw	(0x13, sp), x
                                   1971 ;	../src/pff.c: 1008: if (!(fs->flag & FA__WIP)) {	/* Round-down fptr to the sector boundary */
      0099F4 1E 1B            [ 2] 1972 	ldw	x, (0x1b, sp)
      0099F6 26 1A            [ 1] 1973 	jrne	00112$
                                   1974 ;	../src/pff.c: 1009: fs->fptr &= 0xFFFFFE00;
      0099F8 1E 13            [ 2] 1975 	ldw	x, (0x13, sp)
      0099FA E6 02            [ 1] 1976 	ld	a, (0x2, x)
      0099FC FE               [ 2] 1977 	ldw	x, (x)
      0099FD A4 FE            [ 1] 1978 	and	a, #0xfe
      0099FF 90 95            [ 1] 1979 	ld	yh, a
      009A01 4F               [ 1] 1980 	clr	a
      009A02 90 97            [ 1] 1981 	ld	yl, a
      009A04 02               [ 1] 1982 	rlwa	x
      009A05 6B 19            [ 1] 1983 	ld	(0x19, sp), a
      009A07 01               [ 1] 1984 	rrwa	x
      009A08 9F               [ 1] 1985 	ld	a, xl
      009A09 1E 13            [ 2] 1986 	ldw	x, (0x13, sp)
      009A0B EF 02            [ 2] 1987 	ldw	(0x2, x), y
      009A0D E7 01            [ 1] 1988 	ld	(0x1, x), a
      009A0F 7B 19            [ 1] 1989 	ld	a, (0x19, sp)
      009A11 F7               [ 1] 1990 	ld	(x), a
      009A12                       1991 00112$:
                                   1992 ;	../src/pff.c: 1012: remain = fs->fsize - fs->fptr;
      009A12 1E 07            [ 2] 1993 	ldw	x, (0x07, sp)
      009A14 90 93            [ 1] 1994 	ldw	y, x
      009A16 90 EE 1C         [ 2] 1995 	ldw	y, (0x1c, y)
      009A19 EE 1A            [ 2] 1996 	ldw	x, (0x1a, x)
      009A1B 1F 15            [ 2] 1997 	ldw	(0x15, sp), x
      009A1D 1E 13            [ 2] 1998 	ldw	x, (0x13, sp)
      009A1F 1F 0D            [ 2] 1999 	ldw	(0x0d, sp), x
      009A21 1E 13            [ 2] 2000 	ldw	x, (0x13, sp)
      009A23 E6 03            [ 1] 2001 	ld	a, (0x3, x)
      009A25 6B 1C            [ 1] 2002 	ld	(0x1c, sp), a
      009A27 E6 02            [ 1] 2003 	ld	a, (0x2, x)
      009A29 6B 1B            [ 1] 2004 	ld	(0x1b, sp), a
      009A2B FE               [ 2] 2005 	ldw	x, (x)
      009A2C 1F 19            [ 2] 2006 	ldw	(0x19, sp), x
      009A2E 72 F2 1B         [ 2] 2007 	subw	y, (0x1b, sp)
      009A31 7B 16            [ 1] 2008 	ld	a, (0x16, sp)
      009A33 12 1A            [ 1] 2009 	sbc	a, (0x1a, sp)
      009A35 97               [ 1] 2010 	ld	xl, a
      009A36 7B 15            [ 1] 2011 	ld	a, (0x15, sp)
      009A38 12 19            [ 1] 2012 	sbc	a, (0x19, sp)
      009A3A 17 17            [ 2] 2013 	ldw	(0x17, sp), y
      009A3C 95               [ 1] 2014 	ld	xh, a
                                   2015 ;	../src/pff.c: 1013: if (btw > remain) btw = (UINT)remain;			/* Truncate btw by remaining bytes */
      009A3D 16 21            [ 2] 2016 	ldw	y, (0x21, sp)
      009A3F 17 1B            [ 2] 2017 	ldw	(0x1b, sp), y
      009A41 0F 1A            [ 1] 2018 	clr	(0x1a, sp)
      009A43 0F 19            [ 1] 2019 	clr	(0x19, sp)
      009A45 7B 18            [ 1] 2020 	ld	a, (0x18, sp)
      009A47 11 1C            [ 1] 2021 	cp	a, (0x1c, sp)
      009A49 7B 17            [ 1] 2022 	ld	a, (0x17, sp)
      009A4B 12 1B            [ 1] 2023 	sbc	a, (0x1b, sp)
      009A4D 9F               [ 1] 2024 	ld	a, xl
      009A4E 12 1A            [ 1] 2025 	sbc	a, (0x1a, sp)
      009A50 9E               [ 1] 2026 	ld	a, xh
      009A51 12 19            [ 1] 2027 	sbc	a, (0x19, sp)
      009A53 24 04            [ 1] 2028 	jrnc	00157$
      009A55 1E 17            [ 2] 2029 	ldw	x, (0x17, sp)
      009A57 1F 21            [ 2] 2030 	ldw	(0x21, sp), x
                                   2031 ;	../src/pff.c: 1015: while (btw)	{									/* Repeat until all data transferred */
      009A59                       2032 00157$:
      009A59 1E 07            [ 2] 2033 	ldw	x, (0x07, sp)
      009A5B 1C 00 22         [ 2] 2034 	addw	x, #0x0022
      009A5E 1F 0F            [ 2] 2035 	ldw	(0x0f, sp), x
      009A60 16 07            [ 2] 2036 	ldw	y, (0x07, sp)
      009A62 17 11            [ 2] 2037 	ldw	(0x11, sp), y
      009A64 16 07            [ 2] 2038 	ldw	y, (0x07, sp)
      009A66 17 13            [ 2] 2039 	ldw	(0x13, sp), y
      009A68                       2040 00136$:
      009A68 1E 21            [ 2] 2041 	ldw	x, (0x21, sp)
      009A6A 26 03            [ 1] 2042 	jrne	00243$
      009A6C CC 9B FD         [ 2] 2043 	jp	00138$
      009A6F                       2044 00243$:
                                   2045 ;	../src/pff.c: 1016: if ((UINT)fs->fptr % 512 == 0) {			/* On the sector boundary? */
      009A6F 1E 0D            [ 2] 2046 	ldw	x, (0x0d, sp)
      009A71 90 93            [ 1] 2047 	ldw	y, x
      009A73 90 EE 02         [ 2] 2048 	ldw	y, (0x2, y)
      009A76 17 1A            [ 2] 2049 	ldw	(0x1a, sp), y
      009A78 FE               [ 2] 2050 	ldw	x, (x)
      009A79 1F 18            [ 2] 2051 	ldw	(0x18, sp), x
      009A7B 1E 1A            [ 2] 2052 	ldw	x, (0x1a, sp)
      009A7D 9E               [ 1] 2053 	ld	a, xh
      009A7E A4 01            [ 1] 2054 	and	a, #0x01
      009A80 95               [ 1] 2055 	ld	xh, a
      009A81 5D               [ 2] 2056 	tnzw	x
      009A82 27 03            [ 1] 2057 	jreq	00244$
      009A84 CC 9B 4E         [ 2] 2058 	jp	00127$
      009A87                       2059 00244$:
                                   2060 ;	../src/pff.c: 1017: cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
      009A87 7B 18            [ 1] 2061 	ld	a, (0x18, sp)
      009A89 6B 02            [ 1] 2062 	ld	(0x02, sp), a
      009A8B 1E 19            [ 2] 2063 	ldw	x, (0x19, sp)
      009A8D 0F 01            [ 1] 2064 	clr	(0x01, sp)
      009A8F 04 02            [ 1] 2065 	srl	(0x02, sp)
      009A91 56               [ 2] 2066 	rrcw	x
      009A92 16 13            [ 2] 2067 	ldw	y, (0x13, sp)
      009A94 90 E6 02         [ 1] 2068 	ld	a, (0x2, y)
      009A97 4A               [ 1] 2069 	dec	a
      009A98 89               [ 2] 2070 	pushw	x
      009A99 14 02            [ 1] 2071 	and	a, (2, sp)
      009A9B 85               [ 2] 2072 	popw	x
                                   2073 ;	../src/pff.c: 1018: if (!cs) {								/* On the cluster boundary? */
      009A9C 6B 1C            [ 1] 2074 	ld	(0x1c, sp), a
      009A9E 26 48            [ 1] 2075 	jrne	00121$
                                   2076 ;	../src/pff.c: 1019: if (fs->fptr == 0) {				/* On the top of the file? */
      009AA0 1E 1A            [ 2] 2077 	ldw	x, (0x1a, sp)
      009AA2 26 13            [ 1] 2078 	jrne	00116$
      009AA4 1E 18            [ 2] 2079 	ldw	x, (0x18, sp)
      009AA6 26 0F            [ 1] 2080 	jrne	00116$
                                   2081 ;	../src/pff.c: 1020: clst = fs->org_clust;
      009AA8 1E 11            [ 2] 2082 	ldw	x, (0x11, sp)
      009AAA 90 93            [ 1] 2083 	ldw	y, x
      009AAC 90 EE 20         [ 2] 2084 	ldw	y, (0x20, y)
      009AAF EE 1E            [ 2] 2085 	ldw	x, (0x1e, x)
      009AB1 17 1A            [ 2] 2086 	ldw	(0x1a, sp), y
      009AB3 1F 18            [ 2] 2087 	ldw	(0x18, sp), x
      009AB5 20 14            [ 2] 2088 	jra	00117$
      009AB7                       2089 00116$:
                                   2090 ;	../src/pff.c: 1022: clst = get_fat(fs->curr_clust);
      009AB7 1E 0F            [ 2] 2091 	ldw	x, (0x0f, sp)
      009AB9 90 93            [ 1] 2092 	ldw	y, x
      009ABB 90 EE 02         [ 2] 2093 	ldw	y, (0x2, y)
      009ABE FE               [ 2] 2094 	ldw	x, (x)
      009ABF 90 89            [ 2] 2095 	pushw	y
      009AC1 89               [ 2] 2096 	pushw	x
      009AC2 CD 8F D6         [ 4] 2097 	call	_get_fat
      009AC5 5B 04            [ 2] 2098 	addw	sp, #4
      009AC7 17 18            [ 2] 2099 	ldw	(0x18, sp), y
      009AC9 1F 1A            [ 2] 2100 	ldw	(0x1a, sp), x
      009ACB                       2101 00117$:
                                   2102 ;	../src/pff.c: 1024: if (clst <= 1) ABORT(FR_DISK_ERR);
      009ACB 5F               [ 1] 2103 	clrw	x
      009ACC 5C               [ 1] 2104 	incw	x
      009ACD 13 1A            [ 2] 2105 	cpw	x, (0x1a, sp)
      009ACF 4F               [ 1] 2106 	clr	a
      009AD0 12 19            [ 1] 2107 	sbc	a, (0x19, sp)
      009AD2 4F               [ 1] 2108 	clr	a
      009AD3 12 18            [ 1] 2109 	sbc	a, (0x18, sp)
      009AD5 25 08            [ 1] 2110 	jrc	00119$
      009AD7 1E 0B            [ 2] 2111 	ldw	x, (0x0b, sp)
      009AD9 7F               [ 1] 2112 	clr	(x)
      009ADA A6 01            [ 1] 2113 	ld	a, #0x01
      009ADC CC 9B FE         [ 2] 2114 	jp	00139$
      009ADF                       2115 00119$:
                                   2116 ;	../src/pff.c: 1025: fs->curr_clust = clst;				/* Update current cluster */
      009ADF 1E 0F            [ 2] 2117 	ldw	x, (0x0f, sp)
      009AE1 16 1A            [ 2] 2118 	ldw	y, (0x1a, sp)
      009AE3 EF 02            [ 2] 2119 	ldw	(0x2, x), y
      009AE5 16 18            [ 2] 2120 	ldw	y, (0x18, sp)
      009AE7 FF               [ 2] 2121 	ldw	(x), y
      009AE8                       2122 00121$:
                                   2123 ;	../src/pff.c: 1027: sect = clust2sect(fs->curr_clust);		/* Get current sector */
      009AE8 1E 0F            [ 2] 2124 	ldw	x, (0x0f, sp)
      009AEA 90 93            [ 1] 2125 	ldw	y, x
      009AEC 90 EE 02         [ 2] 2126 	ldw	y, (0x2, y)
      009AEF FE               [ 2] 2127 	ldw	x, (x)
      009AF0 90 89            [ 2] 2128 	pushw	y
      009AF2 89               [ 2] 2129 	pushw	x
      009AF3 CD 90 7D         [ 4] 2130 	call	_clust2sect
      009AF6 5B 04            [ 2] 2131 	addw	sp, #4
      009AF8 1F 03            [ 2] 2132 	ldw	(0x03, sp), x
      009AFA 17 01            [ 2] 2133 	ldw	(0x01, sp), y
                                   2134 ;	../src/pff.c: 1028: if (!sect) ABORT(FR_DISK_ERR);
      009AFC 5D               [ 2] 2135 	tnzw	x
      009AFD 26 0C            [ 1] 2136 	jrne	00123$
      009AFF 90 5D            [ 2] 2137 	tnzw	y
      009B01 26 08            [ 1] 2138 	jrne	00123$
      009B03 1E 0B            [ 2] 2139 	ldw	x, (0x0b, sp)
      009B05 7F               [ 1] 2140 	clr	(x)
      009B06 A6 01            [ 1] 2141 	ld	a, #0x01
      009B08 CC 9B FE         [ 2] 2142 	jp	00139$
      009B0B                       2143 00123$:
                                   2144 ;	../src/pff.c: 1029: fs->dsect = sect + cs;
      009B0B 1E 07            [ 2] 2145 	ldw	x, (0x07, sp)
      009B0D 1C 00 26         [ 2] 2146 	addw	x, #0x0026
      009B10 90 5F            [ 1] 2147 	clrw	y
      009B12 7B 1C            [ 1] 2148 	ld	a, (0x1c, sp)
      009B14 90 97            [ 1] 2149 	ld	yl, a
      009B16 4F               [ 1] 2150 	clr	a
      009B17 0F 15            [ 1] 2151 	clr	(0x15, sp)
      009B19 72 F9 03         [ 2] 2152 	addw	y, (0x03, sp)
      009B1C 19 02            [ 1] 2153 	adc	a, (0x02, sp)
      009B1E 6B 1A            [ 1] 2154 	ld	(0x1a, sp), a
      009B20 7B 15            [ 1] 2155 	ld	a, (0x15, sp)
      009B22 19 01            [ 1] 2156 	adc	a, (0x01, sp)
      009B24 6B 19            [ 1] 2157 	ld	(0x19, sp), a
      009B26 EF 02            [ 2] 2158 	ldw	(0x2, x), y
      009B28 7B 1A            [ 1] 2159 	ld	a, (0x1a, sp)
      009B2A E7 01            [ 1] 2160 	ld	(0x1, x), a
      009B2C 7B 19            [ 1] 2161 	ld	a, (0x19, sp)
      009B2E F7               [ 1] 2162 	ld	(x), a
                                   2163 ;	../src/pff.c: 1030: if (disk_writep(0, fs->dsect)) ABORT(FR_DISK_ERR);	/* Initiate a sector write operation */
      009B2F 90 89            [ 2] 2164 	pushw	y
      009B31 1E 1B            [ 2] 2165 	ldw	x, (0x1b, sp)
      009B33 89               [ 2] 2166 	pushw	x
      009B34 5F               [ 1] 2167 	clrw	x
      009B35 89               [ 2] 2168 	pushw	x
      009B36 CD 83 59         [ 4] 2169 	call	_disk_writep
      009B39 5B 06            [ 2] 2170 	addw	sp, #6
      009B3B 4D               [ 1] 2171 	tnz	a
      009B3C 27 08            [ 1] 2172 	jreq	00125$
      009B3E 1E 0B            [ 2] 2173 	ldw	x, (0x0b, sp)
      009B40 7F               [ 1] 2174 	clr	(x)
      009B41 A6 01            [ 1] 2175 	ld	a, #0x01
      009B43 CC 9B FE         [ 2] 2176 	jp	00139$
      009B46                       2177 00125$:
                                   2178 ;	../src/pff.c: 1031: fs->flag |= FA__WIP;
      009B46 1E 0B            [ 2] 2179 	ldw	x, (0x0b, sp)
      009B48 F6               [ 1] 2180 	ld	a, (x)
      009B49 AA 40            [ 1] 2181 	or	a, #0x40
      009B4B 1E 0B            [ 2] 2182 	ldw	x, (0x0b, sp)
      009B4D F7               [ 1] 2183 	ld	(x), a
      009B4E                       2184 00127$:
                                   2185 ;	../src/pff.c: 1033: wcnt = 512 - (UINT)fs->fptr % 512;			/* Number of bytes to write to the sector */
      009B4E 1E 0D            [ 2] 2186 	ldw	x, (0x0d, sp)
      009B50 EE 02            [ 2] 2187 	ldw	x, (0x2, x)
      009B52 9E               [ 1] 2188 	ld	a, xh
      009B53 A4 01            [ 1] 2189 	and	a, #0x01
      009B55 6B 1B            [ 1] 2190 	ld	(0x1b, sp), a
      009B57 9F               [ 1] 2191 	ld	a, xl
      009B58 40               [ 1] 2192 	neg	a
      009B59 97               [ 1] 2193 	ld	xl, a
      009B5A A6 02            [ 1] 2194 	ld	a, #0x02
      009B5C 12 1B            [ 1] 2195 	sbc	a, (0x1b, sp)
      009B5E 95               [ 1] 2196 	ld	xh, a
                                   2197 ;	../src/pff.c: 1034: if (wcnt > btw) wcnt = btw;
      009B5F 1F 15            [ 2] 2198 	ldw	(0x15, sp), x
      009B61 13 21            [ 2] 2199 	cpw	x, (0x21, sp)
      009B63 23 04            [ 2] 2200 	jrule	00129$
      009B65 16 21            [ 2] 2201 	ldw	y, (0x21, sp)
      009B67 17 15            [ 2] 2202 	ldw	(0x15, sp), y
      009B69                       2203 00129$:
                                   2204 ;	../src/pff.c: 1035: if (disk_writep(p, wcnt)) ABORT(FR_DISK_ERR);	/* Send data to the sector */
      009B69 16 15            [ 2] 2205 	ldw	y, (0x15, sp)
      009B6B 17 03            [ 2] 2206 	ldw	(0x03, sp), y
      009B6D 0F 02            [ 1] 2207 	clr	(0x02, sp)
      009B6F 0F 01            [ 1] 2208 	clr	(0x01, sp)
      009B71 1E 03            [ 2] 2209 	ldw	x, (0x03, sp)
      009B73 89               [ 2] 2210 	pushw	x
      009B74 1E 03            [ 2] 2211 	ldw	x, (0x03, sp)
      009B76 89               [ 2] 2212 	pushw	x
      009B77 1E 09            [ 2] 2213 	ldw	x, (0x09, sp)
      009B79 89               [ 2] 2214 	pushw	x
      009B7A CD 83 59         [ 4] 2215 	call	_disk_writep
      009B7D 5B 06            [ 2] 2216 	addw	sp, #6
      009B7F 4D               [ 1] 2217 	tnz	a
      009B80 27 07            [ 1] 2218 	jreq	00131$
      009B82 1E 0B            [ 2] 2219 	ldw	x, (0x0b, sp)
      009B84 7F               [ 1] 2220 	clr	(x)
      009B85 A6 01            [ 1] 2221 	ld	a, #0x01
      009B87 20 75            [ 2] 2222 	jra	00139$
      009B89                       2223 00131$:
                                   2224 ;	../src/pff.c: 1036: fs->fptr += wcnt; p += wcnt;				/* Update pointers and counters */
      009B89 1E 0D            [ 2] 2225 	ldw	x, (0x0d, sp)
      009B8B 90 93            [ 1] 2226 	ldw	y, x
      009B8D 90 EE 02         [ 2] 2227 	ldw	y, (0x2, y)
      009B90 E6 01            [ 1] 2228 	ld	a, (0x1, x)
      009B92 88               [ 1] 2229 	push	a
      009B93 F6               [ 1] 2230 	ld	a, (x)
      009B94 97               [ 1] 2231 	ld	xl, a
      009B95 84               [ 1] 2232 	pop	a
      009B96 72 F9 03         [ 2] 2233 	addw	y, (0x03, sp)
      009B99 17 19            [ 2] 2234 	ldw	(0x19, sp), y
      009B9B 19 02            [ 1] 2235 	adc	a, (0x02, sp)
      009B9D 6B 18            [ 1] 2236 	ld	(0x18, sp), a
      009B9F 9F               [ 1] 2237 	ld	a, xl
      009BA0 19 01            [ 1] 2238 	adc	a, (0x01, sp)
      009BA2 6B 17            [ 1] 2239 	ld	(0x17, sp), a
      009BA4 1E 0D            [ 2] 2240 	ldw	x, (0x0d, sp)
      009BA6 16 19            [ 2] 2241 	ldw	y, (0x19, sp)
      009BA8 EF 02            [ 2] 2242 	ldw	(0x2, x), y
      009BAA 16 17            [ 2] 2243 	ldw	y, (0x17, sp)
      009BAC FF               [ 2] 2244 	ldw	(x), y
      009BAD 1E 05            [ 2] 2245 	ldw	x, (0x05, sp)
      009BAF 72 FB 15         [ 2] 2246 	addw	x, (0x15, sp)
      009BB2 1F 05            [ 2] 2247 	ldw	(0x05, sp), x
                                   2248 ;	../src/pff.c: 1037: btw -= wcnt; *bw += wcnt;
      009BB4 1E 21            [ 2] 2249 	ldw	x, (0x21, sp)
      009BB6 72 F0 15         [ 2] 2250 	subw	x, (0x15, sp)
      009BB9 1F 21            [ 2] 2251 	ldw	(0x21, sp), x
      009BBB 1E 09            [ 2] 2252 	ldw	x, (0x09, sp)
      009BBD FE               [ 2] 2253 	ldw	x, (x)
      009BBE 72 FB 15         [ 2] 2254 	addw	x, (0x15, sp)
      009BC1 1F 1B            [ 2] 2255 	ldw	(0x1b, sp), x
      009BC3 1E 09            [ 2] 2256 	ldw	x, (0x09, sp)
      009BC5 16 1B            [ 2] 2257 	ldw	y, (0x1b, sp)
      009BC7 FF               [ 2] 2258 	ldw	(x), y
                                   2259 ;	../src/pff.c: 1038: if ((UINT)fs->fptr % 512 == 0) {
      009BC8 16 19            [ 2] 2260 	ldw	y, (0x19, sp)
      009BCA 17 1B            [ 2] 2261 	ldw	(0x1b, sp), y
      009BCC 7B 1C            [ 1] 2262 	ld	a, (0x1c, sp)
      009BCE 6B 1A            [ 1] 2263 	ld	(0x1a, sp), a
      009BD0 7B 1B            [ 1] 2264 	ld	a, (0x1b, sp)
      009BD2 A4 01            [ 1] 2265 	and	a, #0x01
      009BD4 6B 19            [ 1] 2266 	ld	(0x19, sp), a
      009BD6 1E 19            [ 2] 2267 	ldw	x, (0x19, sp)
      009BD8 27 03            [ 1] 2268 	jreq	00254$
      009BDA CC 9A 68         [ 2] 2269 	jp	00136$
      009BDD                       2270 00254$:
                                   2271 ;	../src/pff.c: 1039: if (disk_writep(0, 0)) ABORT(FR_DISK_ERR);	/* Finalize the currtent secter write operation */
      009BDD 5F               [ 1] 2272 	clrw	x
      009BDE 89               [ 2] 2273 	pushw	x
      009BDF 5F               [ 1] 2274 	clrw	x
      009BE0 89               [ 2] 2275 	pushw	x
      009BE1 5F               [ 1] 2276 	clrw	x
      009BE2 89               [ 2] 2277 	pushw	x
      009BE3 CD 83 59         [ 4] 2278 	call	_disk_writep
      009BE6 5B 06            [ 2] 2279 	addw	sp, #6
      009BE8 4D               [ 1] 2280 	tnz	a
      009BE9 27 07            [ 1] 2281 	jreq	00133$
      009BEB 1E 0B            [ 2] 2282 	ldw	x, (0x0b, sp)
      009BED 7F               [ 1] 2283 	clr	(x)
      009BEE A6 01            [ 1] 2284 	ld	a, #0x01
      009BF0 20 0C            [ 2] 2285 	jra	00139$
      009BF2                       2286 00133$:
                                   2287 ;	../src/pff.c: 1040: fs->flag &= ~FA__WIP;
      009BF2 1E 0B            [ 2] 2288 	ldw	x, (0x0b, sp)
      009BF4 F6               [ 1] 2289 	ld	a, (x)
      009BF5 A4 BF            [ 1] 2290 	and	a, #0xbf
      009BF7 1E 0B            [ 2] 2291 	ldw	x, (0x0b, sp)
      009BF9 F7               [ 1] 2292 	ld	(x), a
      009BFA CC 9A 68         [ 2] 2293 	jp	00136$
      009BFD                       2294 00138$:
                                   2295 ;	../src/pff.c: 1044: return FR_OK;
      009BFD 4F               [ 1] 2296 	clr	a
      009BFE                       2297 00139$:
                                   2298 ;	../src/pff.c: 1045: }
      009BFE 5B 1C            [ 2] 2299 	addw	sp, #28
      009C00 81               [ 4] 2300 	ret
                                   2301 	.area CODE
                                   2302 	.area CONST
                                   2303 	.area INITIALIZER
                                   2304 	.area CABS (ABS)
