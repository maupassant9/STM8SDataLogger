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
      008E06                         61 _ld_word:
      008E06 89               [ 2]   62 	pushw	x
                                     63 ;	../src/pff.c: 388: rv = ptr[1];
      008E07 1E 05            [ 2]   64 	ldw	x, (0x05, sp)
      008E09 E6 01            [ 1]   65 	ld	a, (0x1, x)
                                     66 ;	../src/pff.c: 389: rv = rv << 8 | ptr[0];
      008E0B 6B 01            [ 1]   67 	ld	(0x01, sp), a
      008E0D 0F 02            [ 1]   68 	clr	(0x02, sp)
      008E0F 1E 05            [ 2]   69 	ldw	x, (0x05, sp)
      008E11 F6               [ 1]   70 	ld	a, (x)
      008E12 5F               [ 1]   71 	clrw	x
      008E13 1A 02            [ 1]   72 	or	a, (0x02, sp)
      008E15 02               [ 1]   73 	rlwa	x
      008E16 1A 01            [ 1]   74 	or	a, (0x01, sp)
                                     75 ;	../src/pff.c: 390: return rv;
      008E18 95               [ 1]   76 	ld	xh, a
                                     77 ;	../src/pff.c: 391: }
      008E19 5B 02            [ 2]   78 	addw	sp, #2
      008E1B 81               [ 4]   79 	ret
                                     80 ;	../src/pff.c: 393: static DWORD ld_dword (const BYTE* ptr)	/* Load a 4-byte little-endian word */
                                     81 ;	-----------------------------------------
                                     82 ;	 function ld_dword
                                     83 ;	-----------------------------------------
      008E1C                         84 _ld_dword:
      008E1C 52 08            [ 2]   85 	sub	sp, #8
                                     86 ;	../src/pff.c: 397: rv = ptr[3];
      008E1E 1E 0B            [ 2]   87 	ldw	x, (0x0b, sp)
      008E20 E6 03            [ 1]   88 	ld	a, (0x3, x)
      008E22 5F               [ 1]   89 	clrw	x
      008E23 90 5F            [ 1]   90 	clrw	y
      008E25 97               [ 1]   91 	ld	xl, a
                                     92 ;	../src/pff.c: 398: rv = rv << 8 | ptr[2];
      008E26 1F 02            [ 2]   93 	ldw	(0x02, sp), x
      008E28 0F 04            [ 1]   94 	clr	(0x04, sp)
      008E2A 1E 0B            [ 2]   95 	ldw	x, (0x0b, sp)
      008E2C E6 02            [ 1]   96 	ld	a, (0x2, x)
      008E2E 0F 07            [ 1]   97 	clr	(0x07, sp)
      008E30 5F               [ 1]   98 	clrw	x
      008E31 0F 05            [ 1]   99 	clr	(0x05, sp)
      008E33 1A 04            [ 1]  100 	or	a, (0x04, sp)
      008E35 95               [ 1]  101 	ld	xh, a
      008E36 7B 03            [ 1]  102 	ld	a, (0x03, sp)
      008E38 1A 07            [ 1]  103 	or	a, (0x07, sp)
      008E3A 90 95            [ 1]  104 	ld	yh, a
      008E3C 89               [ 2]  105 	pushw	x
      008E3D 7B 04            [ 1]  106 	ld	a, (0x04, sp)
      008E3F 1A 02            [ 1]  107 	or	a, (2, sp)
      008E41 85               [ 2]  108 	popw	x
      008E42 97               [ 1]  109 	ld	xl, a
      008E43 90 9F            [ 1]  110 	ld	a, yl
      008E45 1A 05            [ 1]  111 	or	a, (0x05, sp)
      008E47 01               [ 1]  112 	rrwa	x
                                    113 ;	../src/pff.c: 399: rv = rv << 8 | ptr[1];
      008E48 6B 01            [ 1]  114 	ld	(0x01, sp), a
      008E4A 61               [ 1]  115 	exg	a, yl
      008E4B 9F               [ 1]  116 	ld	a, xl
      008E4C 61               [ 1]  117 	exg	a, yl
      008E4D 0F 04            [ 1]  118 	clr	(0x04, sp)
      008E4F 1E 0B            [ 2]  119 	ldw	x, (0x0b, sp)
      008E51 E6 01            [ 1]  120 	ld	a, (0x1, x)
      008E53 5F               [ 1]  121 	clrw	x
      008E54 0F 06            [ 1]  122 	clr	(0x06, sp)
      008E56 0F 05            [ 1]  123 	clr	(0x05, sp)
      008E58 1A 04            [ 1]  124 	or	a, (0x04, sp)
      008E5A 97               [ 1]  125 	ld	xl, a
      008E5B 89               [ 2]  126 	pushw	x
      008E5C 90 9F            [ 1]  127 	ld	a, yl
      008E5E 1A 01            [ 1]  128 	or	a, (1, sp)
      008E60 85               [ 2]  129 	popw	x
      008E61 95               [ 1]  130 	ld	xh, a
      008E62 90 9E            [ 1]  131 	ld	a, yh
      008E64 1A 06            [ 1]  132 	or	a, (0x06, sp)
      008E66 90 97            [ 1]  133 	ld	yl, a
                                    134 ;	../src/pff.c: 400: rv = rv << 8 | ptr[0];
      008E68 1F 02            [ 2]  135 	ldw	(0x02, sp), x
      008E6A 0F 04            [ 1]  136 	clr	(0x04, sp)
      008E6C 1E 0B            [ 2]  137 	ldw	x, (0x0b, sp)
      008E6E F6               [ 1]  138 	ld	a, (x)
      008E6F 0F 07            [ 1]  139 	clr	(0x07, sp)
      008E71 5F               [ 1]  140 	clrw	x
      008E72 0F 05            [ 1]  141 	clr	(0x05, sp)
      008E74 1A 04            [ 1]  142 	or	a, (0x04, sp)
      008E76 95               [ 1]  143 	ld	xh, a
      008E77 7B 03            [ 1]  144 	ld	a, (0x03, sp)
      008E79 1A 07            [ 1]  145 	or	a, (0x07, sp)
      008E7B 90 95            [ 1]  146 	ld	yh, a
      008E7D 89               [ 2]  147 	pushw	x
      008E7E 7B 04            [ 1]  148 	ld	a, (0x04, sp)
      008E80 1A 02            [ 1]  149 	or	a, (2, sp)
      008E82 85               [ 2]  150 	popw	x
      008E83 97               [ 1]  151 	ld	xl, a
      008E84 90 9F            [ 1]  152 	ld	a, yl
      008E86 1A 05            [ 1]  153 	or	a, (0x05, sp)
      008E88 61               [ 1]  154 	exg	a, yl
      008E89 9E               [ 1]  155 	ld	a, xh
      008E8A 61               [ 1]  156 	exg	a, yl
      008E8B 95               [ 1]  157 	ld	xh, a
                                    158 ;	../src/pff.c: 401: return rv;
      008E8C 51               [ 1]  159 	exgw	x, y
                                    160 ;	../src/pff.c: 402: }
      008E8D 5B 08            [ 2]  161 	addw	sp, #8
      008E8F 81               [ 4]  162 	ret
                                    163 ;	../src/pff.c: 411: static void mem_set (void* dst, int val, int cnt) {
                                    164 ;	-----------------------------------------
                                    165 ;	 function mem_set
                                    166 ;	-----------------------------------------
      008E90                        167 _mem_set:
      008E90 89               [ 2]  168 	pushw	x
                                    169 ;	../src/pff.c: 412: char *d = (char*)dst;
      008E91 1E 05            [ 2]  170 	ldw	x, (0x05, sp)
                                    171 ;	../src/pff.c: 413: while (cnt--) *d++ = (char)val;
      008E93 1F 01            [ 2]  172 	ldw	(0x01, sp), x
      008E95 16 09            [ 2]  173 	ldw	y, (0x09, sp)
      008E97                        174 00101$:
      008E97 93               [ 1]  175 	ldw	x, y
      008E98 90 5A            [ 2]  176 	decw	y
      008E9A 5D               [ 2]  177 	tnzw	x
      008E9B 27 0C            [ 1]  178 	jreq	00104$
      008E9D 7B 08            [ 1]  179 	ld	a, (0x08, sp)
      008E9F 1E 01            [ 2]  180 	ldw	x, (0x01, sp)
      008EA1 F7               [ 1]  181 	ld	(x), a
      008EA2 1E 01            [ 2]  182 	ldw	x, (0x01, sp)
      008EA4 5C               [ 1]  183 	incw	x
      008EA5 1F 01            [ 2]  184 	ldw	(0x01, sp), x
      008EA7 20 EE            [ 2]  185 	jra	00101$
      008EA9                        186 00104$:
                                    187 ;	../src/pff.c: 414: }
      008EA9 85               [ 2]  188 	popw	x
      008EAA 81               [ 4]  189 	ret
                                    190 ;	../src/pff.c: 417: static int mem_cmp (const void* dst, const void* src, int cnt) {
                                    191 ;	-----------------------------------------
                                    192 ;	 function mem_cmp
                                    193 ;	-----------------------------------------
      008EAB                        194 _mem_cmp:
      008EAB 52 0A            [ 2]  195 	sub	sp, #10
                                    196 ;	../src/pff.c: 418: const char *d = (const char *)dst, *s = (const char *)src;
      008EAD 16 0D            [ 2]  197 	ldw	y, (0x0d, sp)
      008EAF 1E 0F            [ 2]  198 	ldw	x, (0x0f, sp)
                                    199 ;	../src/pff.c: 419: int r = 0;
      008EB1 0F 02            [ 1]  200 	clr	(0x02, sp)
      008EB3 0F 01            [ 1]  201 	clr	(0x01, sp)
                                    202 ;	../src/pff.c: 420: while (cnt-- && (r = *d++ - *s++) == 0) ;
      008EB5 17 05            [ 2]  203 	ldw	(0x05, sp), y
      008EB7 1F 07            [ 2]  204 	ldw	(0x07, sp), x
      008EB9 16 11            [ 2]  205 	ldw	y, (0x11, sp)
      008EBB 17 09            [ 2]  206 	ldw	(0x09, sp), y
      008EBD                        207 00102$:
      008EBD 16 09            [ 2]  208 	ldw	y, (0x09, sp)
      008EBF 17 03            [ 2]  209 	ldw	(0x03, sp), y
      008EC1 1E 09            [ 2]  210 	ldw	x, (0x09, sp)
      008EC3 5A               [ 2]  211 	decw	x
      008EC4 1F 09            [ 2]  212 	ldw	(0x09, sp), x
      008EC6 1E 03            [ 2]  213 	ldw	x, (0x03, sp)
      008EC8 27 20            [ 1]  214 	jreq	00104$
      008ECA 1E 05            [ 2]  215 	ldw	x, (0x05, sp)
      008ECC F6               [ 1]  216 	ld	a, (x)
      008ECD 1E 05            [ 2]  217 	ldw	x, (0x05, sp)
      008ECF 5C               [ 1]  218 	incw	x
      008ED0 1F 05            [ 2]  219 	ldw	(0x05, sp), x
      008ED2 5F               [ 1]  220 	clrw	x
      008ED3 97               [ 1]  221 	ld	xl, a
      008ED4 16 07            [ 2]  222 	ldw	y, (0x07, sp)
      008ED6 90 F6            [ 1]  223 	ld	a, (y)
      008ED8 16 07            [ 2]  224 	ldw	y, (0x07, sp)
      008EDA 90 5C            [ 1]  225 	incw	y
      008EDC 17 07            [ 2]  226 	ldw	(0x07, sp), y
      008EDE 6B 04            [ 1]  227 	ld	(0x04, sp), a
      008EE0 0F 03            [ 1]  228 	clr	(0x03, sp)
      008EE2 72 F0 03         [ 2]  229 	subw	x, (0x03, sp)
      008EE5 1F 01            [ 2]  230 	ldw	(0x01, sp), x
      008EE7 5D               [ 2]  231 	tnzw	x
      008EE8 27 D3            [ 1]  232 	jreq	00102$
      008EEA                        233 00104$:
                                    234 ;	../src/pff.c: 421: return r;
      008EEA 1E 01            [ 2]  235 	ldw	x, (0x01, sp)
                                    236 ;	../src/pff.c: 422: }
      008EEC 5B 0A            [ 2]  237 	addw	sp, #10
      008EEE 81               [ 4]  238 	ret
                                    239 ;	../src/pff.c: 430: static CLUST get_fat (	/* 1:IO error, Else:Cluster status */
                                    240 ;	-----------------------------------------
                                    241 ;	 function get_fat
                                    242 ;	-----------------------------------------
      008EEF                        243 _get_fat:
      008EEF 52 12            [ 2]  244 	sub	sp, #18
                                    245 ;	../src/pff.c: 435: FATFS *fs = FatFs;
      008EF1 90 CE 02 61      [ 2]  246 	ldw	y, _FatFs+0
                                    247 ;	../src/pff.c: 440: if (clst < 2 || clst >= fs->n_fatent) return 1;	/* Range check */
      008EF5 1E 17            [ 2]  248 	ldw	x, (0x17, sp)
      008EF7 A3 00 02         [ 2]  249 	cpw	x, #0x0002
      008EFA 7B 16            [ 1]  250 	ld	a, (0x16, sp)
      008EFC A2 00            [ 1]  251 	sbc	a, #0x00
      008EFE 7B 15            [ 1]  252 	ld	a, (0x15, sp)
      008F00 A2 00            [ 1]  253 	sbc	a, #0x00
      008F02 25 1B            [ 1]  254 	jrc	00101$
      008F04 93               [ 1]  255 	ldw	x, y
      008F05 E6 09            [ 1]  256 	ld	a, (0x9, x)
      008F07 6B 12            [ 1]  257 	ld	(0x12, sp), a
      008F09 E6 08            [ 1]  258 	ld	a, (0x8, x)
      008F0B 6B 11            [ 1]  259 	ld	(0x11, sp), a
      008F0D EE 06            [ 2]  260 	ldw	x, (0x6, x)
      008F0F 1F 0F            [ 2]  261 	ldw	(0x0f, sp), x
      008F11 1E 17            [ 2]  262 	ldw	x, (0x17, sp)
      008F13 13 11            [ 2]  263 	cpw	x, (0x11, sp)
      008F15 7B 16            [ 1]  264 	ld	a, (0x16, sp)
      008F17 12 10            [ 1]  265 	sbc	a, (0x10, sp)
      008F19 7B 15            [ 1]  266 	ld	a, (0x15, sp)
      008F1B 12 0F            [ 1]  267 	sbc	a, (0x0f, sp)
      008F1D 25 06            [ 1]  268 	jrc	00102$
      008F1F                        269 00101$:
      008F1F 5F               [ 1]  270 	clrw	x
      008F20 5C               [ 1]  271 	incw	x
      008F21 90 5F            [ 1]  272 	clrw	y
      008F23 20 6E            [ 2]  273 	jra	00108$
      008F25                        274 00102$:
                                    275 ;	../src/pff.c: 442: switch (fs->fs_type) {
      008F25 90 F6            [ 1]  276 	ld	a, (y)
      008F27 A1 03            [ 1]  277 	cp	a, #0x03
      008F29 26 64            [ 1]  278 	jrne	00107$
                                    279 ;	../src/pff.c: 464: if (disk_readp(buf, fs->fatbase + clst / 128, ((UINT)clst % 128) * 4, 4)) break;
      008F2B 1E 17            [ 2]  280 	ldw	x, (0x17, sp)
      008F2D 9F               [ 1]  281 	ld	a, xl
      008F2E A4 7F            [ 1]  282 	and	a, #0x7f
      008F30 97               [ 1]  283 	ld	xl, a
      008F31 4F               [ 1]  284 	clr	a
      008F32 95               [ 1]  285 	ld	xh, a
      008F33 58               [ 2]  286 	sllw	x
      008F34 58               [ 2]  287 	sllw	x
      008F35 1F 05            [ 2]  288 	ldw	(0x05, sp), x
      008F37 93               [ 1]  289 	ldw	x, y
      008F38 E6 0D            [ 1]  290 	ld	a, (0xd, x)
      008F3A 6B 0A            [ 1]  291 	ld	(0x0a, sp), a
      008F3C E6 0C            [ 1]  292 	ld	a, (0xc, x)
      008F3E EE 0A            [ 2]  293 	ldw	x, (0xa, x)
      008F40 1F 07            [ 2]  294 	ldw	(0x07, sp), x
      008F42 1E 17            [ 2]  295 	ldw	x, (0x17, sp)
      008F44 16 15            [ 2]  296 	ldw	y, (0x15, sp)
      008F46 88               [ 1]  297 	push	a
      008F47 4F               [ 1]  298 	clr	a
      008F48 90 01            [ 1]  299 	rrwa	y
      008F4A 01               [ 1]  300 	rrwa	x
      008F4B 48               [ 1]  301 	sll	a
      008F4C 59               [ 2]  302 	rlcw	x
      008F4D 90 59            [ 2]  303 	rlcw	y
      008F4F 84               [ 1]  304 	pop	a
      008F50 1F 0D            [ 2]  305 	ldw	(0x0d, sp), x
      008F52 95               [ 1]  306 	ld	xh, a
      008F53 41               [ 1]  307 	exg	a, xl
      008F54 7B 0A            [ 1]  308 	ld	a, (0x0a, sp)
      008F56 41               [ 1]  309 	exg	a, xl
      008F57 72 FB 0D         [ 2]  310 	addw	x, (0x0d, sp)
      008F5A 90 9F            [ 1]  311 	ld	a, yl
      008F5C 19 08            [ 1]  312 	adc	a, (0x08, sp)
      008F5E 6B 10            [ 1]  313 	ld	(0x10, sp), a
      008F60 90 9E            [ 1]  314 	ld	a, yh
      008F62 19 07            [ 1]  315 	adc	a, (0x07, sp)
      008F64 6B 0F            [ 1]  316 	ld	(0x0f, sp), a
      008F66 4B 04            [ 1]  317 	push	#0x04
      008F68 4B 00            [ 1]  318 	push	#0x00
      008F6A 16 07            [ 2]  319 	ldw	y, (0x07, sp)
      008F6C 90 89            [ 2]  320 	pushw	y
      008F6E 89               [ 2]  321 	pushw	x
      008F6F 1E 15            [ 2]  322 	ldw	x, (0x15, sp)
      008F71 89               [ 2]  323 	pushw	x
      008F72 96               [ 1]  324 	ldw	x, sp
      008F73 1C 00 09         [ 2]  325 	addw	x, #9
      008F76 89               [ 2]  326 	pushw	x
      008F77 CD 82 84         [ 4]  327 	call	_disk_readp
      008F7A 5B 0A            [ 2]  328 	addw	sp, #10
      008F7C 4D               [ 1]  329 	tnz	a
      008F7D 26 10            [ 1]  330 	jrne	00107$
                                    331 ;	../src/pff.c: 465: return ld_dword(buf) & 0x0FFFFFFF;
      008F7F 96               [ 1]  332 	ldw	x, sp
      008F80 5C               [ 1]  333 	incw	x
      008F81 89               [ 2]  334 	pushw	x
      008F82 CD 8E 1C         [ 4]  335 	call	_ld_dword
      008F85 5B 02            [ 2]  336 	addw	sp, #2
      008F87 90 9E            [ 1]  337 	ld	a, yh
      008F89 A4 0F            [ 1]  338 	and	a, #0x0f
      008F8B 90 95            [ 1]  339 	ld	yh, a
      008F8D 20 04            [ 2]  340 	jra	00108$
                                    341 ;	../src/pff.c: 467: }
      008F8F                        342 00107$:
                                    343 ;	../src/pff.c: 469: return 1;	/* An error occured at the disk I/O layer */
      008F8F 5F               [ 1]  344 	clrw	x
      008F90 5C               [ 1]  345 	incw	x
      008F91 90 5F            [ 1]  346 	clrw	y
      008F93                        347 00108$:
                                    348 ;	../src/pff.c: 470: }
      008F93 5B 12            [ 2]  349 	addw	sp, #18
      008F95 81               [ 4]  350 	ret
                                    351 ;	../src/pff.c: 479: static DWORD clust2sect (	/* !=0: Sector number, 0: Failed - invalid cluster# */
                                    352 ;	-----------------------------------------
                                    353 ;	 function clust2sect
                                    354 ;	-----------------------------------------
      008F96                        355 _clust2sect:
      008F96 52 08            [ 2]  356 	sub	sp, #8
                                    357 ;	../src/pff.c: 483: FATFS *fs = FatFs;
      008F98 CE 02 61         [ 2]  358 	ldw	x, _FatFs+0
      008F9B 1F 07            [ 2]  359 	ldw	(0x07, sp), x
                                    360 ;	../src/pff.c: 486: clst -= 2;
      008F9D 1E 0D            [ 2]  361 	ldw	x, (0x0d, sp)
      008F9F 1D 00 02         [ 2]  362 	subw	x, #0x0002
      008FA2 16 0B            [ 2]  363 	ldw	y, (0x0b, sp)
      008FA4 24 02            [ 1]  364 	jrnc	00110$
      008FA6 90 5A            [ 2]  365 	decw	y
      008FA8                        366 00110$:
      008FA8 1F 0D            [ 2]  367 	ldw	(0x0d, sp), x
      008FAA 17 0B            [ 2]  368 	ldw	(0x0b, sp), y
                                    369 ;	../src/pff.c: 487: if (clst >= (fs->n_fatent - 2)) return 0;		/* Invalid cluster# */
      008FAC 1E 07            [ 2]  370 	ldw	x, (0x07, sp)
      008FAE 90 93            [ 1]  371 	ldw	y, x
      008FB0 90 EE 08         [ 2]  372 	ldw	y, (0x8, y)
      008FB3 EE 06            [ 2]  373 	ldw	x, (0x6, x)
      008FB5 72 A2 00 02      [ 2]  374 	subw	y, #0x0002
      008FB9 17 05            [ 2]  375 	ldw	(0x05, sp), y
      008FBB 24 01            [ 1]  376 	jrnc	00111$
      008FBD 5A               [ 2]  377 	decw	x
      008FBE                        378 00111$:
      008FBE 1F 03            [ 2]  379 	ldw	(0x03, sp), x
      008FC0 1E 0D            [ 2]  380 	ldw	x, (0x0d, sp)
      008FC2 13 05            [ 2]  381 	cpw	x, (0x05, sp)
      008FC4 7B 0C            [ 1]  382 	ld	a, (0x0c, sp)
      008FC6 12 04            [ 1]  383 	sbc	a, (0x04, sp)
      008FC8 7B 0B            [ 1]  384 	ld	a, (0x0b, sp)
      008FCA 12 03            [ 1]  385 	sbc	a, (0x03, sp)
      008FCC 25 05            [ 1]  386 	jrc	00102$
      008FCE 5F               [ 1]  387 	clrw	x
      008FCF 90 5F            [ 1]  388 	clrw	y
      008FD1 20 32            [ 2]  389 	jra	00103$
      008FD3                        390 00102$:
                                    391 ;	../src/pff.c: 488: return (DWORD)clst * fs->csize + fs->database;
      008FD3 1E 07            [ 2]  392 	ldw	x, (0x07, sp)
      008FD5 E6 02            [ 1]  393 	ld	a, (0x2, x)
      008FD7 5F               [ 1]  394 	clrw	x
      008FD8 97               [ 1]  395 	ld	xl, a
      008FD9 90 5F            [ 1]  396 	clrw	y
      008FDB 89               [ 2]  397 	pushw	x
      008FDC 90 89            [ 2]  398 	pushw	y
      008FDE 1E 11            [ 2]  399 	ldw	x, (0x11, sp)
      008FE0 89               [ 2]  400 	pushw	x
      008FE1 1E 11            [ 2]  401 	ldw	x, (0x11, sp)
      008FE3 89               [ 2]  402 	pushw	x
      008FE4 CD 9B A9         [ 4]  403 	call	__mullong
      008FE7 5B 08            [ 2]  404 	addw	sp, #8
      008FE9 1F 03            [ 2]  405 	ldw	(0x03, sp), x
      008FEB 17 01            [ 2]  406 	ldw	(0x01, sp), y
      008FED 1E 07            [ 2]  407 	ldw	x, (0x07, sp)
      008FEF 90 93            [ 1]  408 	ldw	y, x
      008FF1 90 EE 14         [ 2]  409 	ldw	y, (0x14, y)
      008FF4 EE 12            [ 2]  410 	ldw	x, (0x12, x)
      008FF6 1F 05            [ 2]  411 	ldw	(0x05, sp), x
      008FF8 93               [ 1]  412 	ldw	x, y
      008FF9 72 FB 03         [ 2]  413 	addw	x, (0x03, sp)
      008FFC 16 05            [ 2]  414 	ldw	y, (0x05, sp)
      008FFE 24 02            [ 1]  415 	jrnc	00113$
      009000 90 5C            [ 1]  416 	incw	y
      009002                        417 00113$:
      009002 72 F9 01         [ 2]  418 	addw	y, (0x01, sp)
      009005                        419 00103$:
                                    420 ;	../src/pff.c: 489: }
      009005 5B 08            [ 2]  421 	addw	sp, #8
      009007 81               [ 4]  422 	ret
                                    423 ;	../src/pff.c: 492: static CLUST get_clust (
                                    424 ;	-----------------------------------------
                                    425 ;	 function get_clust
                                    426 ;	-----------------------------------------
      009008                        427 _get_clust:
      009008 52 04            [ 2]  428 	sub	sp, #4
                                    429 ;	../src/pff.c: 501: clst = ld_word(dir+DIR_FstClusHI);
      00900A 1E 07            [ 2]  430 	ldw	x, (0x07, sp)
      00900C 1C 00 14         [ 2]  431 	addw	x, #0x0014
      00900F 89               [ 2]  432 	pushw	x
      009010 CD 8E 06         [ 4]  433 	call	_ld_word
      009013 5B 02            [ 2]  434 	addw	sp, #2
      009015 51               [ 1]  435 	exgw	x, y
                                    436 ;	../src/pff.c: 502: clst <<= 16;
      009016 5F               [ 1]  437 	clrw	x
      009017 1F 03            [ 2]  438 	ldw	(0x03, sp), x
      009019 17 01            [ 2]  439 	ldw	(0x01, sp), y
                                    440 ;	../src/pff.c: 504: clst |= ld_word(dir+DIR_FstClusLO);
      00901B 1E 07            [ 2]  441 	ldw	x, (0x07, sp)
      00901D 1C 00 1A         [ 2]  442 	addw	x, #0x001a
      009020 89               [ 2]  443 	pushw	x
      009021 CD 8E 06         [ 4]  444 	call	_ld_word
      009024 5B 02            [ 2]  445 	addw	sp, #2
      009026 4F               [ 1]  446 	clr	a
      009027 90 5F            [ 1]  447 	clrw	y
      009029 1A 02            [ 1]  448 	or	a, (0x02, sp)
      00902B 90 97            [ 1]  449 	ld	yl, a
      00902D 9F               [ 1]  450 	ld	a, xl
      00902E 1A 04            [ 1]  451 	or	a, (0x04, sp)
      009030 02               [ 1]  452 	rlwa	x
      009031 1A 03            [ 1]  453 	or	a, (0x03, sp)
      009033 95               [ 1]  454 	ld	xh, a
      009034 90 9E            [ 1]  455 	ld	a, yh
      009036 1A 01            [ 1]  456 	or	a, (0x01, sp)
                                    457 ;	../src/pff.c: 506: return clst;
      009038 90 95            [ 1]  458 	ld	yh, a
                                    459 ;	../src/pff.c: 507: }
      00903A 5B 04            [ 2]  460 	addw	sp, #4
      00903C 81               [ 4]  461 	ret
                                    462 ;	../src/pff.c: 514: static FRESULT dir_rewind (
                                    463 ;	-----------------------------------------
                                    464 ;	 function dir_rewind
                                    465 ;	-----------------------------------------
      00903D                        466 _dir_rewind:
      00903D 52 0C            [ 2]  467 	sub	sp, #12
                                    468 ;	../src/pff.c: 519: FATFS *fs = FatFs;
      00903F CE 02 61         [ 2]  469 	ldw	x, _FatFs+0
      009042 1F 07            [ 2]  470 	ldw	(0x07, sp), x
                                    471 ;	../src/pff.c: 522: dj->index = 0;
      009044 16 0F            [ 2]  472 	ldw	y, (0x0f, sp)
      009046 17 05            [ 2]  473 	ldw	(0x05, sp), y
      009048 93               [ 1]  474 	ldw	x, y
      009049 6F 01            [ 1]  475 	clr	(0x1, x)
      00904B 7F               [ 1]  476 	clr	(x)
                                    477 ;	../src/pff.c: 523: clst = dj->sclust;
      00904C 1E 05            [ 2]  478 	ldw	x, (0x05, sp)
      00904E 90 93            [ 1]  479 	ldw	y, x
      009050 90 EE 06         [ 2]  480 	ldw	y, (0x6, y)
      009053 EE 04            [ 2]  481 	ldw	x, (0x4, x)
      009055 17 0B            [ 2]  482 	ldw	(0x0b, sp), y
      009057 1F 09            [ 2]  483 	ldw	(0x09, sp), x
                                    484 ;	../src/pff.c: 524: if (clst == 1 || clst >= fs->n_fatent) {	/* Check start cluster range */
      009059 1E 0B            [ 2]  485 	ldw	x, (0x0b, sp)
      00905B 5A               [ 2]  486 	decw	x
      00905C 26 04            [ 1]  487 	jrne	00129$
      00905E 1E 09            [ 2]  488 	ldw	x, (0x09, sp)
      009060 27 1B            [ 1]  489 	jreq	00101$
      009062                        490 00129$:
      009062 1E 07            [ 2]  491 	ldw	x, (0x07, sp)
      009064 90 93            [ 1]  492 	ldw	y, x
      009066 90 EE 08         [ 2]  493 	ldw	y, (0x8, y)
      009069 17 03            [ 2]  494 	ldw	(0x03, sp), y
      00906B EE 06            [ 2]  495 	ldw	x, (0x6, x)
      00906D 1F 01            [ 2]  496 	ldw	(0x01, sp), x
      00906F 1E 0B            [ 2]  497 	ldw	x, (0x0b, sp)
      009071 13 03            [ 2]  498 	cpw	x, (0x03, sp)
      009073 7B 0A            [ 1]  499 	ld	a, (0x0a, sp)
      009075 12 02            [ 1]  500 	sbc	a, (0x02, sp)
      009077 7B 09            [ 1]  501 	ld	a, (0x09, sp)
      009079 12 01            [ 1]  502 	sbc	a, (0x01, sp)
      00907B 25 04            [ 1]  503 	jrc	00106$
      00907D                        504 00101$:
                                    505 ;	../src/pff.c: 525: return FR_DISK_ERR;
      00907D A6 01            [ 1]  506 	ld	a, #0x01
      00907F 20 3F            [ 2]  507 	jra	00109$
                                    508 ;	../src/pff.c: 527: if (PF_FS_FAT32 && !clst && (_FS_32ONLY || fs->fs_type == FS_FAT32)) {	/* Replace cluster# 0 with root cluster# if in FAT32 */
      009081                        509 00106$:
      009081 1E 0B            [ 2]  510 	ldw	x, (0x0b, sp)
      009083 26 11            [ 1]  511 	jrne	00105$
      009085 1E 09            [ 2]  512 	ldw	x, (0x09, sp)
      009087 26 0D            [ 1]  513 	jrne	00105$
                                    514 ;	../src/pff.c: 528: clst = (CLUST)fs->dirbase;
      009089 1E 07            [ 2]  515 	ldw	x, (0x07, sp)
      00908B 90 93            [ 1]  516 	ldw	y, x
      00908D 90 EE 10         [ 2]  517 	ldw	y, (0x10, y)
      009090 17 0B            [ 2]  518 	ldw	(0x0b, sp), y
      009092 EE 0E            [ 2]  519 	ldw	x, (0xe, x)
      009094 1F 09            [ 2]  520 	ldw	(0x09, sp), x
      009096                        521 00105$:
                                    522 ;	../src/pff.c: 530: dj->clust = clst;						/* Current cluster */
      009096 1E 05            [ 2]  523 	ldw	x, (0x05, sp)
      009098 1C 00 08         [ 2]  524 	addw	x, #0x0008
      00909B 16 0B            [ 2]  525 	ldw	y, (0x0b, sp)
      00909D EF 02            [ 2]  526 	ldw	(0x2, x), y
      00909F 16 09            [ 2]  527 	ldw	y, (0x09, sp)
      0090A1 FF               [ 2]  528 	ldw	(x), y
                                    529 ;	../src/pff.c: 531: dj->sect = (_FS_32ONLY || clst) ? clust2sect(clst) : fs->dirbase;	/* Current sector */
      0090A2 1E 05            [ 2]  530 	ldw	x, (0x05, sp)
      0090A4 1C 00 0C         [ 2]  531 	addw	x, #0x000c
      0090A7 1F 07            [ 2]  532 	ldw	(0x07, sp), x
      0090A9 1E 0B            [ 2]  533 	ldw	x, (0x0b, sp)
      0090AB 89               [ 2]  534 	pushw	x
      0090AC 1E 0B            [ 2]  535 	ldw	x, (0x0b, sp)
      0090AE 89               [ 2]  536 	pushw	x
      0090AF CD 8F 96         [ 4]  537 	call	_clust2sect
      0090B2 5B 04            [ 2]  538 	addw	sp, #4
      0090B4 17 09            [ 2]  539 	ldw	(0x09, sp), y
      0090B6 16 07            [ 2]  540 	ldw	y, (0x07, sp)
      0090B8 90 EF 02         [ 2]  541 	ldw	(0x2, y), x
      0090BB 1E 09            [ 2]  542 	ldw	x, (0x09, sp)
      0090BD 90 FF            [ 2]  543 	ldw	(y), x
                                    544 ;	../src/pff.c: 533: return FR_OK;	/* Seek succeeded */
      0090BF 4F               [ 1]  545 	clr	a
      0090C0                        546 00109$:
                                    547 ;	../src/pff.c: 534: }
      0090C0 5B 0C            [ 2]  548 	addw	sp, #12
      0090C2 81               [ 4]  549 	ret
                                    550 ;	../src/pff.c: 543: static FRESULT dir_next (	/* FR_OK:Succeeded, FR_NO_FILE:End of table */
                                    551 ;	-----------------------------------------
                                    552 ;	 function dir_next
                                    553 ;	-----------------------------------------
      0090C3                        554 _dir_next:
      0090C3 52 14            [ 2]  555 	sub	sp, #20
                                    556 ;	../src/pff.c: 549: FATFS *fs = FatFs;
      0090C5 CE 02 61         [ 2]  557 	ldw	x, _FatFs+0
      0090C8 1F 05            [ 2]  558 	ldw	(0x05, sp), x
                                    559 ;	../src/pff.c: 552: i = dj->index + 1;
      0090CA 16 17            [ 2]  560 	ldw	y, (0x17, sp)
      0090CC 17 07            [ 2]  561 	ldw	(0x07, sp), y
      0090CE 93               [ 1]  562 	ldw	x, y
      0090CF FE               [ 2]  563 	ldw	x, (x)
      0090D0 5C               [ 1]  564 	incw	x
                                    565 ;	../src/pff.c: 553: if (!i || !dj->sect) return FR_NO_FILE;	/* Report EOT when index has reached 65535 */
      0090D1 1F 09            [ 2]  566 	ldw	(0x09, sp), x
      0090D3 27 19            [ 1]  567 	jreq	00101$
      0090D5 1E 07            [ 2]  568 	ldw	x, (0x07, sp)
      0090D7 1C 00 0C         [ 2]  569 	addw	x, #0x000c
      0090DA 1F 0B            [ 2]  570 	ldw	(0x0b, sp), x
      0090DC 90 93            [ 1]  571 	ldw	y, x
      0090DE 90 EE 02         [ 2]  572 	ldw	y, (0x2, y)
      0090E1 17 03            [ 2]  573 	ldw	(0x03, sp), y
      0090E3 FE               [ 2]  574 	ldw	x, (x)
      0090E4 1F 01            [ 2]  575 	ldw	(0x01, sp), x
      0090E6 1E 03            [ 2]  576 	ldw	x, (0x03, sp)
      0090E8 26 09            [ 1]  577 	jrne	00102$
      0090EA 1E 01            [ 2]  578 	ldw	x, (0x01, sp)
      0090EC 26 05            [ 1]  579 	jrne	00102$
      0090EE                        580 00101$:
      0090EE A6 03            [ 1]  581 	ld	a, #0x03
      0090F0 CC 91 C9         [ 2]  582 	jp	00117$
      0090F3                        583 00102$:
                                    584 ;	../src/pff.c: 555: if (!(i % 16)) {		/* Sector changed? */
      0090F3 16 09            [ 2]  585 	ldw	y, (0x09, sp)
      0090F5 17 13            [ 2]  586 	ldw	(0x13, sp), y
      0090F7 7B 14            [ 1]  587 	ld	a, (0x14, sp)
      0090F9 A5 0F            [ 1]  588 	bcp	a, #0x0f
      0090FB 27 03            [ 1]  589 	jreq	00157$
      0090FD CC 91 C3         [ 2]  590 	jp	00116$
      009100                        591 00157$:
                                    592 ;	../src/pff.c: 556: dj->sect++;			/* Next sector */
      009100 7B 04            [ 1]  593 	ld	a, (0x04, sp)
      009102 AB 01            [ 1]  594 	add	a, #0x01
      009104 88               [ 1]  595 	push	a
      009105 7B 04            [ 1]  596 	ld	a, (0x04, sp)
      009107 A9 00            [ 1]  597 	adc	a, #0x00
      009109 6B 12            [ 1]  598 	ld	(0x12, sp), a
      00910B 16 02            [ 2]  599 	ldw	y, (0x02, sp)
      00910D 24 02            [ 1]  600 	jrnc	00158$
      00910F 90 5C            [ 1]  601 	incw	y
      009111                        602 00158$:
      009111 84               [ 1]  603 	pop	a
      009112 1E 0B            [ 2]  604 	ldw	x, (0x0b, sp)
      009114 E7 03            [ 1]  605 	ld	(0x3, x), a
      009116 7B 11            [ 1]  606 	ld	a, (0x11, sp)
      009118 E7 02            [ 1]  607 	ld	(0x2, x), a
      00911A FF               [ 2]  608 	ldw	(x), y
                                    609 ;	../src/pff.c: 558: if (dj->clust == 0) {	/* Static table */
      00911B 1E 07            [ 2]  610 	ldw	x, (0x07, sp)
      00911D 1C 00 08         [ 2]  611 	addw	x, #0x0008
      009120 1F 0D            [ 2]  612 	ldw	(0x0d, sp), x
      009122 90 93            [ 1]  613 	ldw	y, x
      009124 90 EE 02         [ 2]  614 	ldw	y, (0x2, y)
      009127 FE               [ 2]  615 	ldw	x, (x)
      009128 1F 0F            [ 2]  616 	ldw	(0x0f, sp), x
      00912A 90 5D            [ 2]  617 	tnzw	y
      00912C 26 18            [ 1]  618 	jrne	00113$
      00912E 1E 0F            [ 2]  619 	ldw	x, (0x0f, sp)
      009130 26 14            [ 1]  620 	jrne	00113$
                                    621 ;	../src/pff.c: 559: if (i >= fs->n_rootdir) return FR_NO_FILE;	/* Report EOT when end of table */
      009132 1E 05            [ 2]  622 	ldw	x, (0x05, sp)
      009134 EE 04            [ 2]  623 	ldw	x, (0x4, x)
      009136 1F 13            [ 2]  624 	ldw	(0x13, sp), x
      009138 1E 09            [ 2]  625 	ldw	x, (0x09, sp)
      00913A 13 13            [ 2]  626 	cpw	x, (0x13, sp)
      00913C 24 03            [ 1]  627 	jrnc	00161$
      00913E CC 91 C3         [ 2]  628 	jp	00116$
      009141                        629 00161$:
      009141 A6 03            [ 1]  630 	ld	a, #0x03
      009143 CC 91 C9         [ 2]  631 	jp	00117$
      009146                        632 00113$:
                                    633 ;	../src/pff.c: 562: if (((i / 16) & (fs->csize - 1)) == 0) {	/* Cluster changed? */
      009146 04 13            [ 1]  634 	srl	(0x13, sp)
      009148 06 14            [ 1]  635 	rrc	(0x14, sp)
      00914A 04 13            [ 1]  636 	srl	(0x13, sp)
      00914C 06 14            [ 1]  637 	rrc	(0x14, sp)
      00914E 04 13            [ 1]  638 	srl	(0x13, sp)
      009150 06 14            [ 1]  639 	rrc	(0x14, sp)
      009152 04 13            [ 1]  640 	srl	(0x13, sp)
      009154 06 14            [ 1]  641 	rrc	(0x14, sp)
      009156 1E 05            [ 2]  642 	ldw	x, (0x05, sp)
      009158 E6 02            [ 1]  643 	ld	a, (0x2, x)
      00915A 5F               [ 1]  644 	clrw	x
      00915B 97               [ 1]  645 	ld	xl, a
      00915C 5A               [ 2]  646 	decw	x
      00915D 9F               [ 1]  647 	ld	a, xl
      00915E 14 14            [ 1]  648 	and	a, (0x14, sp)
      009160 02               [ 1]  649 	rlwa	x
      009161 14 13            [ 1]  650 	and	a, (0x13, sp)
      009163 95               [ 1]  651 	ld	xh, a
      009164 5D               [ 2]  652 	tnzw	x
      009165 26 5C            [ 1]  653 	jrne	00116$
                                    654 ;	../src/pff.c: 563: clst = get_fat(dj->clust);		/* Get next cluster */
      009167 90 89            [ 2]  655 	pushw	y
      009169 1E 11            [ 2]  656 	ldw	x, (0x11, sp)
      00916B 89               [ 2]  657 	pushw	x
      00916C CD 8E EF         [ 4]  658 	call	_get_fat
      00916F 5B 04            [ 2]  659 	addw	sp, #4
      009171 1F 13            [ 2]  660 	ldw	(0x13, sp), x
      009173 17 11            [ 2]  661 	ldw	(0x11, sp), y
                                    662 ;	../src/pff.c: 564: if (clst <= 1) return FR_DISK_ERR;
      009175 5F               [ 1]  663 	clrw	x
      009176 5C               [ 1]  664 	incw	x
      009177 13 13            [ 2]  665 	cpw	x, (0x13, sp)
      009179 4F               [ 1]  666 	clr	a
      00917A 12 12            [ 1]  667 	sbc	a, (0x12, sp)
      00917C 4F               [ 1]  668 	clr	a
      00917D 12 11            [ 1]  669 	sbc	a, (0x11, sp)
      00917F 25 04            [ 1]  670 	jrc	00107$
      009181 A6 01            [ 1]  671 	ld	a, #0x01
      009183 20 44            [ 2]  672 	jra	00117$
      009185                        673 00107$:
                                    674 ;	../src/pff.c: 565: if (clst >= fs->n_fatent) return FR_NO_FILE;	/* Report EOT when it reached end of dynamic table */
      009185 1E 05            [ 2]  675 	ldw	x, (0x05, sp)
      009187 90 93            [ 1]  676 	ldw	y, x
      009189 90 EE 08         [ 2]  677 	ldw	y, (0x8, y)
      00918C 17 05            [ 2]  678 	ldw	(0x05, sp), y
      00918E EE 06            [ 2]  679 	ldw	x, (0x6, x)
      009190 1F 03            [ 2]  680 	ldw	(0x03, sp), x
      009192 1E 13            [ 2]  681 	ldw	x, (0x13, sp)
      009194 13 05            [ 2]  682 	cpw	x, (0x05, sp)
      009196 7B 12            [ 1]  683 	ld	a, (0x12, sp)
      009198 12 04            [ 1]  684 	sbc	a, (0x04, sp)
      00919A 7B 11            [ 1]  685 	ld	a, (0x11, sp)
      00919C 12 03            [ 1]  686 	sbc	a, (0x03, sp)
      00919E 25 04            [ 1]  687 	jrc	00109$
      0091A0 A6 03            [ 1]  688 	ld	a, #0x03
      0091A2 20 25            [ 2]  689 	jra	00117$
      0091A4                        690 00109$:
                                    691 ;	../src/pff.c: 566: dj->clust = clst;				/* Initialize data for new cluster */
      0091A4 1E 0D            [ 2]  692 	ldw	x, (0x0d, sp)
      0091A6 16 13            [ 2]  693 	ldw	y, (0x13, sp)
      0091A8 EF 02            [ 2]  694 	ldw	(0x2, x), y
      0091AA 16 11            [ 2]  695 	ldw	y, (0x11, sp)
      0091AC FF               [ 2]  696 	ldw	(x), y
                                    697 ;	../src/pff.c: 567: dj->sect = clust2sect(clst);
      0091AD 1E 13            [ 2]  698 	ldw	x, (0x13, sp)
      0091AF 89               [ 2]  699 	pushw	x
      0091B0 1E 13            [ 2]  700 	ldw	x, (0x13, sp)
      0091B2 89               [ 2]  701 	pushw	x
      0091B3 CD 8F 96         [ 4]  702 	call	_clust2sect
      0091B6 5B 04            [ 2]  703 	addw	sp, #4
      0091B8 17 11            [ 2]  704 	ldw	(0x11, sp), y
      0091BA 16 0B            [ 2]  705 	ldw	y, (0x0b, sp)
      0091BC 90 EF 02         [ 2]  706 	ldw	(0x2, y), x
      0091BF 1E 11            [ 2]  707 	ldw	x, (0x11, sp)
      0091C1 90 FF            [ 2]  708 	ldw	(y), x
      0091C3                        709 00116$:
                                    710 ;	../src/pff.c: 572: dj->index = i;
      0091C3 1E 07            [ 2]  711 	ldw	x, (0x07, sp)
      0091C5 16 09            [ 2]  712 	ldw	y, (0x09, sp)
      0091C7 FF               [ 2]  713 	ldw	(x), y
                                    714 ;	../src/pff.c: 574: return FR_OK;
      0091C8 4F               [ 1]  715 	clr	a
      0091C9                        716 00117$:
                                    717 ;	../src/pff.c: 575: }
      0091C9 5B 14            [ 2]  718 	addw	sp, #20
      0091CB 81               [ 4]  719 	ret
                                    720 ;	../src/pff.c: 584: static FRESULT dir_find (
                                    721 ;	-----------------------------------------
                                    722 ;	 function dir_find
                                    723 ;	-----------------------------------------
      0091CC                        724 _dir_find:
      0091CC 52 07            [ 2]  725 	sub	sp, #7
                                    726 ;	../src/pff.c: 593: res = dir_rewind(dj);			/* Rewind directory object */
      0091CE 1E 0A            [ 2]  727 	ldw	x, (0x0a, sp)
      0091D0 89               [ 2]  728 	pushw	x
      0091D1 CD 90 3D         [ 4]  729 	call	_dir_rewind
      0091D4 85               [ 2]  730 	popw	x
                                    731 ;	../src/pff.c: 594: if (res != FR_OK) return res;
      0091D5 4D               [ 1]  732 	tnz	a
                                    733 ;	../src/pff.c: 596: do {
      0091D6 26 72            [ 1]  734 	jrne	00113$
      0091D8 16 0A            [ 2]  735 	ldw	y, (0x0a, sp)
      0091DA 17 03            [ 2]  736 	ldw	(0x03, sp), y
      0091DC 17 05            [ 2]  737 	ldw	(0x05, sp), y
      0091DE                        738 00110$:
                                    739 ;	../src/pff.c: 597: res = disk_readp(dir, dj->sect, (dj->index % 16) * 32, 32)	/* Read an entry */
      0091DE 1E 03            [ 2]  740 	ldw	x, (0x03, sp)
      0091E0 FE               [ 2]  741 	ldw	x, (x)
      0091E1 9F               [ 1]  742 	ld	a, xl
      0091E2 A4 0F            [ 1]  743 	and	a, #0x0f
      0091E4 97               [ 1]  744 	ld	xl, a
      0091E5 4F               [ 1]  745 	clr	a
      0091E6 95               [ 1]  746 	ld	xh, a
      0091E7 58               [ 2]  747 	sllw	x
      0091E8 58               [ 2]  748 	sllw	x
      0091E9 58               [ 2]  749 	sllw	x
      0091EA 58               [ 2]  750 	sllw	x
      0091EB 58               [ 2]  751 	sllw	x
      0091EC 1F 01            [ 2]  752 	ldw	(0x01, sp), x
      0091EE 1E 05            [ 2]  753 	ldw	x, (0x05, sp)
      0091F0 90 93            [ 1]  754 	ldw	y, x
      0091F2 90 EE 0E         [ 2]  755 	ldw	y, (0xe, y)
      0091F5 EE 0C            [ 2]  756 	ldw	x, (0xc, x)
      0091F7 4B 20            [ 1]  757 	push	#0x20
      0091F9 4B 00            [ 1]  758 	push	#0x00
      0091FB 7B 04            [ 1]  759 	ld	a, (0x04, sp)
      0091FD 88               [ 1]  760 	push	a
      0091FE 7B 04            [ 1]  761 	ld	a, (0x04, sp)
      009200 88               [ 1]  762 	push	a
      009201 90 89            [ 2]  763 	pushw	y
      009203 89               [ 2]  764 	pushw	x
      009204 1E 14            [ 2]  765 	ldw	x, (0x14, sp)
      009206 89               [ 2]  766 	pushw	x
      009207 CD 82 84         [ 4]  767 	call	_disk_readp
      00920A 5B 0A            [ 2]  768 	addw	sp, #10
      00920C 4D               [ 1]  769 	tnz	a
      00920D 27 03            [ 1]  770 	jreq	00115$
                                    771 ;	../src/pff.c: 598: ? FR_DISK_ERR : FR_OK;
      00920F A6 01            [ 1]  772 	ld	a, #0x01
      009211 21                     773 	.byte 0x21
      009212                        774 00115$:
      009212 4F               [ 1]  775 	clr	a
      009213                        776 00116$:
                                    777 ;	../src/pff.c: 599: if (res != FR_OK) break;
      009213 6B 07            [ 1]  778 	ld	(0x07, sp), a
      009215 26 31            [ 1]  779 	jrne	00112$
                                    780 ;	../src/pff.c: 600: c = dir[DIR_Name];	/* First character */
      009217 1E 0C            [ 2]  781 	ldw	x, (0x0c, sp)
                                    782 ;	../src/pff.c: 601: if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
      009219 F6               [ 1]  783 	ld	a, (x)
      00921A 26 06            [ 1]  784 	jrne	00106$
      00921C A6 03            [ 1]  785 	ld	a, #0x03
      00921E 6B 07            [ 1]  786 	ld	(0x07, sp), a
      009220 20 26            [ 2]  787 	jra	00112$
      009222                        788 00106$:
                                    789 ;	../src/pff.c: 602: if (!(dir[DIR_Attr] & AM_VOL) && !mem_cmp(dir, dj->fn, 11)) break;	/* Is it a valid entry? */
      009222 E6 0B            [ 1]  790 	ld	a, (0xb, x)
      009224 A5 08            [ 1]  791 	bcp	a, #0x08
      009226 26 15            [ 1]  792 	jrne	00108$
      009228 1E 03            [ 2]  793 	ldw	x, (0x03, sp)
      00922A EE 02            [ 2]  794 	ldw	x, (0x2, x)
      00922C 16 0C            [ 2]  795 	ldw	y, (0x0c, sp)
      00922E 4B 0B            [ 1]  796 	push	#0x0b
      009230 4B 00            [ 1]  797 	push	#0x00
      009232 89               [ 2]  798 	pushw	x
      009233 90 89            [ 2]  799 	pushw	y
      009235 CD 8E AB         [ 4]  800 	call	_mem_cmp
      009238 5B 06            [ 2]  801 	addw	sp, #6
      00923A 5D               [ 2]  802 	tnzw	x
      00923B 27 0B            [ 1]  803 	jreq	00112$
      00923D                        804 00108$:
                                    805 ;	../src/pff.c: 603: res = dir_next(dj);					/* Next entry */
      00923D 1E 03            [ 2]  806 	ldw	x, (0x03, sp)
      00923F 89               [ 2]  807 	pushw	x
      009240 CD 90 C3         [ 4]  808 	call	_dir_next
      009243 85               [ 2]  809 	popw	x
                                    810 ;	../src/pff.c: 604: } while (res == FR_OK);
      009244 6B 07            [ 1]  811 	ld	(0x07, sp), a
      009246 27 96            [ 1]  812 	jreq	00110$
      009248                        813 00112$:
                                    814 ;	../src/pff.c: 606: return res;
      009248 7B 07            [ 1]  815 	ld	a, (0x07, sp)
      00924A                        816 00113$:
                                    817 ;	../src/pff.c: 607: }
      00924A 5B 07            [ 2]  818 	addw	sp, #7
      00924C 81               [ 4]  819 	ret
                                    820 ;	../src/pff.c: 651: static FRESULT create_name (
                                    821 ;	-----------------------------------------
                                    822 ;	 function create_name
                                    823 ;	-----------------------------------------
      00924D                        824 _create_name:
      00924D 52 09            [ 2]  825 	sub	sp, #9
                                    826 ;	../src/pff.c: 663: sfn = dj->fn;
      00924F 1E 0C            [ 2]  827 	ldw	x, (0x0c, sp)
      009251 EE 02            [ 2]  828 	ldw	x, (0x2, x)
                                    829 ;	../src/pff.c: 664: mem_set(sfn, ' ', 11);
      009253 1F 01            [ 2]  830 	ldw	(0x01, sp), x
      009255 4B 0B            [ 1]  831 	push	#0x0b
      009257 4B 00            [ 1]  832 	push	#0x00
      009259 4B 20            [ 1]  833 	push	#0x20
      00925B 4B 00            [ 1]  834 	push	#0x00
      00925D 89               [ 2]  835 	pushw	x
      00925E CD 8E 90         [ 4]  836 	call	_mem_set
      009261 5B 06            [ 2]  837 	addw	sp, #6
                                    838 ;	../src/pff.c: 665: si = i = 0; ni = 8;
      009263 0F 08            [ 1]  839 	clr	(0x08, sp)
      009265 A6 08            [ 1]  840 	ld	a, #0x08
      009267 6B 03            [ 1]  841 	ld	(0x03, sp), a
                                    842 ;	../src/pff.c: 666: p = *path;
      009269 16 0E            [ 2]  843 	ldw	y, (0x0e, sp)
      00926B 93               [ 1]  844 	ldw	x, y
      00926C FE               [ 2]  845 	ldw	x, (x)
      00926D 1F 04            [ 2]  846 	ldw	(0x04, sp), x
      00926F 0F 09            [ 1]  847 	clr	(0x09, sp)
      009271                        848 00120$:
                                    849 ;	../src/pff.c: 668: c = p[si++];
      009271 5F               [ 1]  850 	clrw	x
      009272 7B 09            [ 1]  851 	ld	a, (0x09, sp)
      009274 97               [ 1]  852 	ld	xl, a
      009275 72 FB 04         [ 2]  853 	addw	x, (0x04, sp)
      009278 0C 09            [ 1]  854 	inc	(0x09, sp)
      00927A F6               [ 1]  855 	ld	a, (x)
                                    856 ;	../src/pff.c: 669: if (c <= ' ' || c == '/') break;	/* Break on end of segment */
      00927B 6B 06            [ 1]  857 	ld	(0x06, sp), a
      00927D A1 20            [ 1]  858 	cp	a, #0x20
      00927F 22 04            [ 1]  859 	jrugt	00161$
      009281 0F 07            [ 1]  860 	clr	(0x07, sp)
      009283 20 04            [ 2]  861 	jra	00162$
      009285                        862 00161$:
      009285 A6 01            [ 1]  863 	ld	a, #0x01
      009287 6B 07            [ 1]  864 	ld	(0x07, sp), a
      009289                        865 00162$:
      009289 0D 07            [ 1]  866 	tnz	(0x07, sp)
      00928B 27 3D            [ 1]  867 	jreq	00119$
      00928D 7B 06            [ 1]  868 	ld	a, (0x06, sp)
      00928F A1 2F            [ 1]  869 	cp	a, #0x2f
      009291 27 37            [ 1]  870 	jreq	00119$
                                    871 ;	../src/pff.c: 670: if (c == '.' || i >= ni) {
      009293 7B 06            [ 1]  872 	ld	a, (0x06, sp)
      009295 A0 2E            [ 1]  873 	sub	a, #0x2e
      009297 26 02            [ 1]  874 	jrne	00168$
      009299 4C               [ 1]  875 	inc	a
      00929A 21                     876 	.byte 0x21
      00929B                        877 00168$:
      00929B 4F               [ 1]  878 	clr	a
      00929C                        879 00169$:
      00929C 4D               [ 1]  880 	tnz	a
      00929D 26 08            [ 1]  881 	jrne	00107$
      00929F 88               [ 1]  882 	push	a
      0092A0 7B 09            [ 1]  883 	ld	a, (0x09, sp)
      0092A2 11 04            [ 1]  884 	cp	a, (0x04, sp)
      0092A4 84               [ 1]  885 	pop	a
      0092A5 25 15            [ 1]  886 	jrc	00111$
      0092A7                        887 00107$:
                                    888 ;	../src/pff.c: 671: if (ni != 8 || c != '.') break;
      0092A7 88               [ 1]  889 	push	a
      0092A8 7B 04            [ 1]  890 	ld	a, (0x04, sp)
      0092AA A1 08            [ 1]  891 	cp	a, #0x08
      0092AC 84               [ 1]  892 	pop	a
      0092AD 26 1B            [ 1]  893 	jrne	00119$
      0092AF 4D               [ 1]  894 	tnz	a
      0092B0 27 18            [ 1]  895 	jreq	00119$
                                    896 ;	../src/pff.c: 672: i = 8; ni = 11;
      0092B2 A6 08            [ 1]  897 	ld	a, #0x08
      0092B4 6B 08            [ 1]  898 	ld	(0x08, sp), a
      0092B6 A6 0B            [ 1]  899 	ld	a, #0x0b
      0092B8 6B 03            [ 1]  900 	ld	(0x03, sp), a
                                    901 ;	../src/pff.c: 673: continue;
      0092BA 20 B5            [ 2]  902 	jra	00120$
                                    903 ;	../src/pff.c: 683: if (PF_USE_LCC && IsLower(c)) c -= 0x20;	/* toupper */
      0092BC                        904 00111$:
                                    905 ;	../src/pff.c: 684: sfn[i++] = c;
      0092BC 7B 08            [ 1]  906 	ld	a, (0x08, sp)
      0092BE 0C 08            [ 1]  907 	inc	(0x08, sp)
      0092C0 5F               [ 1]  908 	clrw	x
      0092C1 97               [ 1]  909 	ld	xl, a
      0092C2 72 FB 01         [ 2]  910 	addw	x, (0x01, sp)
      0092C5 7B 06            [ 1]  911 	ld	a, (0x06, sp)
      0092C7 F7               [ 1]  912 	ld	(x), a
      0092C8 20 A7            [ 2]  913 	jra	00120$
      0092CA                        914 00119$:
                                    915 ;	../src/pff.c: 687: *path = &p[si];						/* Rerurn pointer to the next segment */
      0092CA 5F               [ 1]  916 	clrw	x
      0092CB 7B 09            [ 1]  917 	ld	a, (0x09, sp)
      0092CD 97               [ 1]  918 	ld	xl, a
      0092CE 72 FB 04         [ 2]  919 	addw	x, (0x04, sp)
      0092D1 90 FF            [ 2]  920 	ldw	(y), x
                                    921 ;	../src/pff.c: 689: sfn[11] = (c <= ' ') ? 1 : 0;		/* Set last segment flag if end of path */
      0092D3 16 01            [ 2]  922 	ldw	y, (0x01, sp)
      0092D5 72 A9 00 0B      [ 2]  923 	addw	y, #0x000b
      0092D9 0D 07            [ 1]  924 	tnz	(0x07, sp)
      0092DB 26 03            [ 1]  925 	jrne	00123$
      0092DD 5F               [ 1]  926 	clrw	x
      0092DE 5C               [ 1]  927 	incw	x
      0092DF 21                     928 	.byte 0x21
      0092E0                        929 00123$:
      0092E0 5F               [ 1]  930 	clrw	x
      0092E1                        931 00124$:
      0092E1 9F               [ 1]  932 	ld	a, xl
      0092E2 90 F7            [ 1]  933 	ld	(y), a
                                    934 ;	../src/pff.c: 691: return FR_OK;
      0092E4 4F               [ 1]  935 	clr	a
                                    936 ;	../src/pff.c: 692: }
      0092E5 5B 09            [ 2]  937 	addw	sp, #9
      0092E7 81               [ 4]  938 	ret
                                    939 ;	../src/pff.c: 742: static FRESULT follow_path (	/* FR_OK(0): successful, !=0: error code */
                                    940 ;	-----------------------------------------
                                    941 ;	 function follow_path
                                    942 ;	-----------------------------------------
      0092E8                        943 _follow_path:
      0092E8 52 0E            [ 2]  944 	sub	sp, #14
                                    945 ;	../src/pff.c: 751: while (*path == ' ') path++;		/* Strip leading spaces */
      0092EA 16 15            [ 2]  946 	ldw	y, (0x15, sp)
      0092EC                        947 00101$:
      0092EC 90 F6            [ 1]  948 	ld	a, (y)
      0092EE 93               [ 1]  949 	ldw	x, y
      0092EF 5C               [ 1]  950 	incw	x
      0092F0 A1 20            [ 1]  951 	cp	a, #0x20
      0092F2 26 06            [ 1]  952 	jrne	00131$
      0092F4 90 93            [ 1]  953 	ldw	y, x
      0092F6 1F 15            [ 2]  954 	ldw	(0x15, sp), x
      0092F8 20 F2            [ 2]  955 	jra	00101$
      0092FA                        956 00131$:
      0092FA 17 15            [ 2]  957 	ldw	(0x15, sp), y
                                    958 ;	../src/pff.c: 752: if (*path == '/') path++;			/* Strip heading separator if exist */
      0092FC A1 2F            [ 1]  959 	cp	a, #0x2f
      0092FE 26 02            [ 1]  960 	jrne	00105$
      009300 1F 15            [ 2]  961 	ldw	(0x15, sp), x
      009302                        962 00105$:
                                    963 ;	../src/pff.c: 753: dj->sclust = 0;						/* Set start directory (always root dir) */
      009302 16 11            [ 2]  964 	ldw	y, (0x11, sp)
      009304 17 01            [ 2]  965 	ldw	(0x01, sp), y
      009306 93               [ 1]  966 	ldw	x, y
      009307 1C 00 04         [ 2]  967 	addw	x, #0x0004
      00930A 90 5F            [ 1]  968 	clrw	y
      00930C EF 02            [ 2]  969 	ldw	(0x2, x), y
      00930E FF               [ 2]  970 	ldw	(x), y
                                    971 ;	../src/pff.c: 755: if ((BYTE)*path < ' ') {			/* Null path means the root directory */
      00930F 1E 15            [ 2]  972 	ldw	x, (0x15, sp)
      009311 F6               [ 1]  973 	ld	a, (x)
      009312 A1 20            [ 1]  974 	cp	a, #0x20
      009314 24 0E            [ 1]  975 	jrnc	00130$
                                    976 ;	../src/pff.c: 756: res = dir_rewind(dj);
      009316 1E 01            [ 2]  977 	ldw	x, (0x01, sp)
      009318 89               [ 2]  978 	pushw	x
      009319 CD 90 3D         [ 4]  979 	call	_dir_rewind
      00931C 85               [ 2]  980 	popw	x
      00931D 6B 0E            [ 1]  981 	ld	(0x0e, sp), a
                                    982 ;	../src/pff.c: 757: dir[0] = 0;
      00931F 1E 13            [ 2]  983 	ldw	x, (0x13, sp)
      009321 7F               [ 1]  984 	clr	(x)
      009322 20 5E            [ 2]  985 	jra	00117$
      009324                        986 00130$:
      009324 16 01            [ 2]  987 	ldw	y, (0x01, sp)
      009326 17 03            [ 2]  988 	ldw	(0x03, sp), y
      009328 16 13            [ 2]  989 	ldw	y, (0x13, sp)
      00932A 17 05            [ 2]  990 	ldw	(0x05, sp), y
      00932C 16 01            [ 2]  991 	ldw	y, (0x01, sp)
      00932E 17 07            [ 2]  992 	ldw	(0x07, sp), y
      009330                        993 00118$:
                                    994 ;	../src/pff.c: 761: res = create_name(dj, &path);	/* Get a segment */
      009330 96               [ 1]  995 	ldw	x, sp
      009331 1C 00 15         [ 2]  996 	addw	x, #21
      009334 89               [ 2]  997 	pushw	x
      009335 1E 03            [ 2]  998 	ldw	x, (0x03, sp)
      009337 89               [ 2]  999 	pushw	x
      009338 CD 92 4D         [ 4] 1000 	call	_create_name
      00933B 5B 04            [ 2] 1001 	addw	sp, #4
                                   1002 ;	../src/pff.c: 762: if (res != FR_OK) break;
      00933D 6B 0E            [ 1] 1003 	ld	(0x0e, sp), a
      00933F 26 41            [ 1] 1004 	jrne	00117$
                                   1005 ;	../src/pff.c: 763: res = dir_find(dj, dir);		/* Find it */
      009341 1E 13            [ 2] 1006 	ldw	x, (0x13, sp)
      009343 89               [ 2] 1007 	pushw	x
      009344 1E 03            [ 2] 1008 	ldw	x, (0x03, sp)
      009346 89               [ 2] 1009 	pushw	x
      009347 CD 91 CC         [ 4] 1010 	call	_dir_find
      00934A 5B 04            [ 2] 1011 	addw	sp, #4
                                   1012 ;	../src/pff.c: 764: if (res != FR_OK) break;		/* Could not find the object */
      00934C 6B 0E            [ 1] 1013 	ld	(0x0e, sp), a
      00934E 26 32            [ 1] 1014 	jrne	00117$
                                   1015 ;	../src/pff.c: 765: if (dj->fn[11]) break;			/* Last segment match. Function completed. */
      009350 1E 03            [ 2] 1016 	ldw	x, (0x03, sp)
      009352 EE 02            [ 2] 1017 	ldw	x, (0x2, x)
      009354 E6 0B            [ 1] 1018 	ld	a, (0xb, x)
      009356 26 2A            [ 1] 1019 	jrne	00117$
                                   1020 ;	../src/pff.c: 766: if (!(dir[DIR_Attr] & AM_DIR)) { /* Cannot follow path because it is a file */
      009358 1E 05            [ 2] 1021 	ldw	x, (0x05, sp)
      00935A E6 0B            [ 1] 1022 	ld	a, (0xb, x)
      00935C A5 10            [ 1] 1023 	bcp	a, #0x10
      00935E 26 06            [ 1] 1024 	jrne	00113$
                                   1025 ;	../src/pff.c: 767: res = FR_NO_FILE; break;
      009360 A6 03            [ 1] 1026 	ld	a, #0x03
      009362 6B 0E            [ 1] 1027 	ld	(0x0e, sp), a
      009364 20 1C            [ 2] 1028 	jra	00117$
      009366                       1029 00113$:
                                   1030 ;	../src/pff.c: 769: dj->sclust = get_clust(dir);	/* Follow next */
      009366 1E 07            [ 2] 1031 	ldw	x, (0x07, sp)
      009368 1C 00 04         [ 2] 1032 	addw	x, #0x0004
      00936B 1F 09            [ 2] 1033 	ldw	(0x09, sp), x
      00936D 1E 13            [ 2] 1034 	ldw	x, (0x13, sp)
      00936F 89               [ 2] 1035 	pushw	x
      009370 CD 90 08         [ 4] 1036 	call	_get_clust
      009373 5B 02            [ 2] 1037 	addw	sp, #2
      009375 17 0B            [ 2] 1038 	ldw	(0x0b, sp), y
      009377 16 09            [ 2] 1039 	ldw	y, (0x09, sp)
      009379 90 EF 02         [ 2] 1040 	ldw	(0x2, y), x
      00937C 1E 0B            [ 2] 1041 	ldw	x, (0x0b, sp)
      00937E 90 FF            [ 2] 1042 	ldw	(y), x
      009380 20 AE            [ 2] 1043 	jra	00118$
      009382                       1044 00117$:
                                   1045 ;	../src/pff.c: 773: return res;
      009382 7B 0E            [ 1] 1046 	ld	a, (0x0e, sp)
                                   1047 ;	../src/pff.c: 774: }
      009384 5B 0E            [ 2] 1048 	addw	sp, #14
      009386 81               [ 4] 1049 	ret
                                   1050 ;	../src/pff.c: 783: static BYTE check_fs (	/* 0:The FAT boot record, 1:Valid boot record but not an FAT, 2:Not a boot record, 3:Error */
                                   1051 ;	-----------------------------------------
                                   1052 ;	 function check_fs
                                   1053 ;	-----------------------------------------
      009387                       1054 _check_fs:
                                   1055 ;	../src/pff.c: 788: if (disk_readp(buf, sect, 510, 2)) {	/* Read the boot record */
      009387 4B 02            [ 1] 1056 	push	#0x02
      009389 4B 00            [ 1] 1057 	push	#0x00
      00938B 4B FE            [ 1] 1058 	push	#0xfe
      00938D 4B 01            [ 1] 1059 	push	#0x01
      00938F 1E 0B            [ 2] 1060 	ldw	x, (0x0b, sp)
      009391 89               [ 2] 1061 	pushw	x
      009392 1E 0B            [ 2] 1062 	ldw	x, (0x0b, sp)
      009394 89               [ 2] 1063 	pushw	x
      009395 1E 0B            [ 2] 1064 	ldw	x, (0x0b, sp)
      009397 89               [ 2] 1065 	pushw	x
      009398 CD 82 84         [ 4] 1066 	call	_disk_readp
      00939B 5B 0A            [ 2] 1067 	addw	sp, #10
      00939D 4D               [ 1] 1068 	tnz	a
      00939E 27 03            [ 1] 1069 	jreq	00102$
                                   1070 ;	../src/pff.c: 789: return 3;
      0093A0 A6 03            [ 1] 1071 	ld	a, #0x03
      0093A2 81               [ 4] 1072 	ret
      0093A3                       1073 00102$:
                                   1074 ;	../src/pff.c: 791: if (ld_word(buf) != 0xAA55) {			/* Check record signature */
      0093A3 1E 03            [ 2] 1075 	ldw	x, (0x03, sp)
      0093A5 89               [ 2] 1076 	pushw	x
      0093A6 CD 8E 06         [ 4] 1077 	call	_ld_word
      0093A9 5B 02            [ 2] 1078 	addw	sp, #2
      0093AB A3 AA 55         [ 2] 1079 	cpw	x, #0xaa55
      0093AE 27 03            [ 1] 1080 	jreq	00111$
                                   1081 ;	../src/pff.c: 792: return 2;
      0093B0 A6 02            [ 1] 1082 	ld	a, #0x02
      0093B2 81               [ 4] 1083 	ret
                                   1084 ;	../src/pff.c: 798: if (PF_FS_FAT32 && !disk_readp(buf, sect, BS_FilSysType32, 2) && ld_word(buf) == 0x4146) {	/* Check FAT32 */
      0093B3                       1085 00111$:
      0093B3 4B 02            [ 1] 1086 	push	#0x02
      0093B5 4B 00            [ 1] 1087 	push	#0x00
      0093B7 4B 52            [ 1] 1088 	push	#0x52
      0093B9 4B 00            [ 1] 1089 	push	#0x00
      0093BB 1E 0B            [ 2] 1090 	ldw	x, (0x0b, sp)
      0093BD 89               [ 2] 1091 	pushw	x
      0093BE 1E 0B            [ 2] 1092 	ldw	x, (0x0b, sp)
      0093C0 89               [ 2] 1093 	pushw	x
      0093C1 1E 0B            [ 2] 1094 	ldw	x, (0x0b, sp)
      0093C3 89               [ 2] 1095 	pushw	x
      0093C4 CD 82 84         [ 4] 1096 	call	_disk_readp
      0093C7 5B 0A            [ 2] 1097 	addw	sp, #10
      0093C9 4D               [ 1] 1098 	tnz	a
      0093CA 26 0F            [ 1] 1099 	jrne	00110$
      0093CC 1E 03            [ 2] 1100 	ldw	x, (0x03, sp)
      0093CE 89               [ 2] 1101 	pushw	x
      0093CF CD 8E 06         [ 4] 1102 	call	_ld_word
      0093D2 5B 02            [ 2] 1103 	addw	sp, #2
      0093D4 A3 41 46         [ 2] 1104 	cpw	x, #0x4146
      0093D7 26 02            [ 1] 1105 	jrne	00110$
                                   1106 ;	../src/pff.c: 799: return 0;
      0093D9 4F               [ 1] 1107 	clr	a
      0093DA 81               [ 4] 1108 	ret
      0093DB                       1109 00110$:
                                   1110 ;	../src/pff.c: 801: return 1;
      0093DB A6 01            [ 1] 1111 	ld	a, #0x01
                                   1112 ;	../src/pff.c: 802: }
      0093DD 81               [ 4] 1113 	ret
                                   1114 ;	../src/pff.c: 819: FRESULT pf_mount (
                                   1115 ;	-----------------------------------------
                                   1116 ;	 function pf_mount
                                   1117 ;	-----------------------------------------
      0093DE                       1118 _pf_mount:
      0093DE 52 3C            [ 2] 1119 	sub	sp, #60
                                   1120 ;	../src/pff.c: 827: FatFs = 0;
      0093E0 5F               [ 1] 1121 	clrw	x
      0093E1 CF 02 61         [ 2] 1122 	ldw	_FatFs+0, x
                                   1123 ;	../src/pff.c: 829: if (disk_initialize() & STA_NOINIT) {	/* Check if the drive is ready or not */
      0093E4 CD 82 70         [ 4] 1124 	call	_disk_initialize
      0093E7 44               [ 1] 1125 	srl	a
      0093E8 24 05            [ 1] 1126 	jrnc	00102$
                                   1127 ;	../src/pff.c: 830: return FR_NOT_READY;
      0093EA A6 02            [ 1] 1128 	ld	a, #0x02
      0093EC CC 96 29         [ 2] 1129 	jp	00137$
      0093EF                       1130 00102$:
                                   1131 ;	../src/pff.c: 834: bsect = 0;
      0093EF 5F               [ 1] 1132 	clrw	x
      0093F0 1F 33            [ 2] 1133 	ldw	(0x33, sp), x
      0093F2 1F 31            [ 2] 1134 	ldw	(0x31, sp), x
                                   1135 ;	../src/pff.c: 835: fmt = check_fs(buf, bsect);			/* Check sector 0 as an SFD format */
      0093F4 5F               [ 1] 1136 	clrw	x
      0093F5 89               [ 2] 1137 	pushw	x
      0093F6 5F               [ 1] 1138 	clrw	x
      0093F7 89               [ 2] 1139 	pushw	x
      0093F8 96               [ 1] 1140 	ldw	x, sp
      0093F9 1C 00 05         [ 2] 1141 	addw	x, #5
      0093FC 89               [ 2] 1142 	pushw	x
      0093FD CD 93 87         [ 4] 1143 	call	_check_fs
      009400 5B 06            [ 2] 1144 	addw	sp, #6
      009402 6B 3C            [ 1] 1145 	ld	(0x3c, sp), a
                                   1146 ;	../src/pff.c: 841: if (buf[4]) {					/* Is the partition existing? */
      009404 96               [ 1] 1147 	ldw	x, sp
      009405 1C 00 05         [ 2] 1148 	addw	x, #5
      009408 1F 39            [ 2] 1149 	ldw	(0x39, sp), x
                                   1150 ;	../src/pff.c: 836: if (fmt == 1) {						/* Not an FAT boot record, it may be FDISK format */
      00940A 7B 3C            [ 1] 1151 	ld	a, (0x3c, sp)
      00940C 4A               [ 1] 1152 	dec	a
      00940D 26 44            [ 1] 1153 	jrne	00109$
                                   1154 ;	../src/pff.c: 838: if (disk_readp(buf, bsect, MBR_Table, 16)) {	/* 1st partition entry */
      00940F 4B 10            [ 1] 1155 	push	#0x10
      009411 4B 00            [ 1] 1156 	push	#0x00
      009413 4B BE            [ 1] 1157 	push	#0xbe
      009415 4B 01            [ 1] 1158 	push	#0x01
      009417 5F               [ 1] 1159 	clrw	x
      009418 89               [ 2] 1160 	pushw	x
      009419 5F               [ 1] 1161 	clrw	x
      00941A 89               [ 2] 1162 	pushw	x
      00941B 96               [ 1] 1163 	ldw	x, sp
      00941C 1C 00 09         [ 2] 1164 	addw	x, #9
      00941F 89               [ 2] 1165 	pushw	x
      009420 CD 82 84         [ 4] 1166 	call	_disk_readp
      009423 5B 0A            [ 2] 1167 	addw	sp, #10
      009425 4D               [ 1] 1168 	tnz	a
      009426 27 06            [ 1] 1169 	jreq	00106$
                                   1170 ;	../src/pff.c: 839: fmt = 3;
      009428 A6 03            [ 1] 1171 	ld	a, #0x03
      00942A 6B 3C            [ 1] 1172 	ld	(0x3c, sp), a
      00942C 20 25            [ 2] 1173 	jra	00109$
      00942E                       1174 00106$:
                                   1175 ;	../src/pff.c: 841: if (buf[4]) {					/* Is the partition existing? */
      00942E 1E 39            [ 2] 1176 	ldw	x, (0x39, sp)
      009430 F6               [ 1] 1177 	ld	a, (x)
      009431 27 20            [ 1] 1178 	jreq	00109$
                                   1179 ;	../src/pff.c: 842: bsect = ld_dword(&buf[8]);	/* Partition offset in LBA */
      009433 96               [ 1] 1180 	ldw	x, sp
      009434 1C 00 09         [ 2] 1181 	addw	x, #9
      009437 89               [ 2] 1182 	pushw	x
      009438 CD 8E 1C         [ 4] 1183 	call	_ld_dword
      00943B 5B 02            [ 2] 1184 	addw	sp, #2
      00943D 1F 33            [ 2] 1185 	ldw	(0x33, sp), x
      00943F 17 31            [ 2] 1186 	ldw	(0x31, sp), y
                                   1187 ;	../src/pff.c: 843: fmt = check_fs(buf, bsect);	/* Check the partition */
      009441 1E 33            [ 2] 1188 	ldw	x, (0x33, sp)
      009443 89               [ 2] 1189 	pushw	x
      009444 1E 33            [ 2] 1190 	ldw	x, (0x33, sp)
      009446 89               [ 2] 1191 	pushw	x
      009447 96               [ 1] 1192 	ldw	x, sp
      009448 1C 00 05         [ 2] 1193 	addw	x, #5
      00944B 89               [ 2] 1194 	pushw	x
      00944C CD 93 87         [ 4] 1195 	call	_check_fs
      00944F 5B 06            [ 2] 1196 	addw	sp, #6
      009451 6B 3C            [ 1] 1197 	ld	(0x3c, sp), a
      009453                       1198 00109$:
                                   1199 ;	../src/pff.c: 847: if (fmt == 3) return FR_DISK_ERR;
      009453 7B 3C            [ 1] 1200 	ld	a, (0x3c, sp)
      009455 A1 03            [ 1] 1201 	cp	a, #0x03
      009457 26 05            [ 1] 1202 	jrne	00111$
      009459 A6 01            [ 1] 1203 	ld	a, #0x01
      00945B CC 96 29         [ 2] 1204 	jp	00137$
      00945E                       1205 00111$:
                                   1206 ;	../src/pff.c: 848: if (fmt) return FR_NO_FILESYSTEM;	/* No valid FAT patition is found */
      00945E 0D 3C            [ 1] 1207 	tnz	(0x3c, sp)
      009460 27 05            [ 1] 1208 	jreq	00113$
      009462 A6 06            [ 1] 1209 	ld	a, #0x06
      009464 CC 96 29         [ 2] 1210 	jp	00137$
      009467                       1211 00113$:
                                   1212 ;	../src/pff.c: 851: if (disk_readp(buf, bsect, 13, sizeof (buf))) return FR_DISK_ERR;
      009467 4B 24            [ 1] 1213 	push	#0x24
      009469 4B 00            [ 1] 1214 	push	#0x00
      00946B 4B 0D            [ 1] 1215 	push	#0x0d
      00946D 4B 00            [ 1] 1216 	push	#0x00
      00946F 1E 37            [ 2] 1217 	ldw	x, (0x37, sp)
      009471 89               [ 2] 1218 	pushw	x
      009472 1E 37            [ 2] 1219 	ldw	x, (0x37, sp)
      009474 89               [ 2] 1220 	pushw	x
      009475 96               [ 1] 1221 	ldw	x, sp
      009476 1C 00 09         [ 2] 1222 	addw	x, #9
      009479 89               [ 2] 1223 	pushw	x
      00947A CD 82 84         [ 4] 1224 	call	_disk_readp
      00947D 5B 0A            [ 2] 1225 	addw	sp, #10
      00947F 4D               [ 1] 1226 	tnz	a
      009480 27 05            [ 1] 1227 	jreq	00115$
      009482 A6 01            [ 1] 1228 	ld	a, #0x01
      009484 CC 96 29         [ 2] 1229 	jp	00137$
      009487                       1230 00115$:
                                   1231 ;	../src/pff.c: 853: fsize = ld_word(buf+BPB_FATSz16-13);				/* Number of sectors per FAT */
      009487 96               [ 1] 1232 	ldw	x, sp
      009488 1C 00 0A         [ 2] 1233 	addw	x, #10
      00948B 89               [ 2] 1234 	pushw	x
      00948C CD 8E 06         [ 4] 1235 	call	_ld_word
      00948F 5B 02            [ 2] 1236 	addw	sp, #2
      009491 90 5F            [ 1] 1237 	clrw	y
      009493 1F 37            [ 2] 1238 	ldw	(0x37, sp), x
      009495 17 35            [ 2] 1239 	ldw	(0x35, sp), y
                                   1240 ;	../src/pff.c: 854: if (!fsize) fsize = ld_dword(buf+BPB_FATSz32-13);
      009497 1E 37            [ 2] 1241 	ldw	x, (0x37, sp)
      009499 26 12            [ 1] 1242 	jrne	00117$
      00949B 1E 35            [ 2] 1243 	ldw	x, (0x35, sp)
      00949D 26 0E            [ 1] 1244 	jrne	00117$
      00949F 96               [ 1] 1245 	ldw	x, sp
      0094A0 1C 00 18         [ 2] 1246 	addw	x, #24
      0094A3 89               [ 2] 1247 	pushw	x
      0094A4 CD 8E 1C         [ 4] 1248 	call	_ld_dword
      0094A7 5B 02            [ 2] 1249 	addw	sp, #2
      0094A9 1F 37            [ 2] 1250 	ldw	(0x37, sp), x
      0094AB 17 35            [ 2] 1251 	ldw	(0x35, sp), y
      0094AD                       1252 00117$:
                                   1253 ;	../src/pff.c: 856: fsize *= buf[BPB_NumFATs-13];						/* Number of sectors in FAT area */
      0094AD 7B 04            [ 1] 1254 	ld	a, (0x04, sp)
      0094AF 5F               [ 1] 1255 	clrw	x
      0094B0 97               [ 1] 1256 	ld	xl, a
      0094B1 90 5F            [ 1] 1257 	clrw	y
      0094B3 89               [ 2] 1258 	pushw	x
      0094B4 90 89            [ 2] 1259 	pushw	y
      0094B6 1E 3B            [ 2] 1260 	ldw	x, (0x3b, sp)
      0094B8 89               [ 2] 1261 	pushw	x
      0094B9 1E 3B            [ 2] 1262 	ldw	x, (0x3b, sp)
      0094BB 89               [ 2] 1263 	pushw	x
      0094BC CD 9B A9         [ 4] 1264 	call	__mullong
      0094BF 5B 08            [ 2] 1265 	addw	sp, #8
      0094C1 1F 27            [ 2] 1266 	ldw	(0x27, sp), x
      0094C3 17 25            [ 2] 1267 	ldw	(0x25, sp), y
                                   1268 ;	../src/pff.c: 857: fs->fatbase = bsect + ld_word(buf+BPB_RsvdSecCnt-13); /* FAT start sector (lba) */
      0094C5 16 3F            [ 2] 1269 	ldw	y, (0x3f, sp)
      0094C7 17 29            [ 2] 1270 	ldw	(0x29, sp), y
      0094C9 93               [ 1] 1271 	ldw	x, y
      0094CA 1C 00 0A         [ 2] 1272 	addw	x, #0x000a
      0094CD 1F 2B            [ 2] 1273 	ldw	(0x2b, sp), x
      0094CF 96               [ 1] 1274 	ldw	x, sp
      0094D0 5C               [ 1] 1275 	incw	x
      0094D1 5C               [ 1] 1276 	incw	x
      0094D2 1F 3B            [ 2] 1277 	ldw	(0x3b, sp), x
      0094D4 89               [ 2] 1278 	pushw	x
      0094D5 CD 8E 06         [ 4] 1279 	call	_ld_word
      0094D8 5B 02            [ 2] 1280 	addw	sp, #2
      0094DA 51               [ 1] 1281 	exgw	x, y
      0094DB 4F               [ 1] 1282 	clr	a
      0094DC 5F               [ 1] 1283 	clrw	x
      0094DD 72 F9 33         [ 2] 1284 	addw	y, (0x33, sp)
      0094E0 19 32            [ 1] 1285 	adc	a, (0x32, sp)
      0094E2 6B 36            [ 1] 1286 	ld	(0x36, sp), a
      0094E4 9E               [ 1] 1287 	ld	a, xh
      0094E5 19 31            [ 1] 1288 	adc	a, (0x31, sp)
      0094E7 6B 35            [ 1] 1289 	ld	(0x35, sp), a
      0094E9 1E 2B            [ 2] 1290 	ldw	x, (0x2b, sp)
      0094EB EF 02            [ 2] 1291 	ldw	(0x2, x), y
      0094ED 16 35            [ 2] 1292 	ldw	y, (0x35, sp)
      0094EF FF               [ 2] 1293 	ldw	(x), y
                                   1294 ;	../src/pff.c: 858: fs->csize = buf[BPB_SecPerClus-13];					/* Number of sectors per cluster */
      0094F0 1E 29            [ 2] 1295 	ldw	x, (0x29, sp)
      0094F2 5C               [ 1] 1296 	incw	x
      0094F3 5C               [ 1] 1297 	incw	x
      0094F4 1F 2D            [ 2] 1298 	ldw	(0x2d, sp), x
      0094F6 7B 01            [ 1] 1299 	ld	a, (0x01, sp)
      0094F8 1E 2D            [ 2] 1300 	ldw	x, (0x2d, sp)
      0094FA F7               [ 1] 1301 	ld	(x), a
                                   1302 ;	../src/pff.c: 859: fs->n_rootdir = ld_word(buf+BPB_RootEntCnt-13);		/* Nmuber of root directory entries */
      0094FB 1E 29            [ 2] 1303 	ldw	x, (0x29, sp)
      0094FD 1C 00 04         [ 2] 1304 	addw	x, #0x0004
      009500 1F 2F            [ 2] 1305 	ldw	(0x2f, sp), x
      009502 1E 39            [ 2] 1306 	ldw	x, (0x39, sp)
      009504 89               [ 2] 1307 	pushw	x
      009505 CD 8E 06         [ 4] 1308 	call	_ld_word
      009508 5B 02            [ 2] 1309 	addw	sp, #2
      00950A 16 2F            [ 2] 1310 	ldw	y, (0x2f, sp)
      00950C 90 FF            [ 2] 1311 	ldw	(y), x
                                   1312 ;	../src/pff.c: 860: tsect = ld_word(buf+BPB_TotSec16-13);				/* Number of sectors on the file system */
      00950E 96               [ 1] 1313 	ldw	x, sp
      00950F 1C 00 07         [ 2] 1314 	addw	x, #7
      009512 89               [ 2] 1315 	pushw	x
      009513 CD 8E 06         [ 4] 1316 	call	_ld_word
      009516 5B 02            [ 2] 1317 	addw	sp, #2
      009518 90 5F            [ 1] 1318 	clrw	y
      00951A 1F 37            [ 2] 1319 	ldw	(0x37, sp), x
      00951C 17 35            [ 2] 1320 	ldw	(0x35, sp), y
                                   1321 ;	../src/pff.c: 861: if (!tsect) tsect = ld_dword(buf+BPB_TotSec32-13);
      00951E 5D               [ 2] 1322 	tnzw	x
      00951F 26 12            [ 1] 1323 	jrne	00119$
      009521 90 5D            [ 2] 1324 	tnzw	y
      009523 26 0E            [ 1] 1325 	jrne	00119$
      009525 96               [ 1] 1326 	ldw	x, sp
      009526 1C 00 14         [ 2] 1327 	addw	x, #20
      009529 89               [ 2] 1328 	pushw	x
      00952A CD 8E 1C         [ 4] 1329 	call	_ld_dword
      00952D 5B 02            [ 2] 1330 	addw	sp, #2
      00952F 1F 37            [ 2] 1331 	ldw	(0x37, sp), x
      009531 17 35            [ 2] 1332 	ldw	(0x35, sp), y
      009533                       1333 00119$:
                                   1334 ;	../src/pff.c: 863: - ld_word(buf+BPB_RsvdSecCnt-13) - fsize - fs->n_rootdir / 16
      009533 1E 3B            [ 2] 1335 	ldw	x, (0x3b, sp)
      009535 89               [ 2] 1336 	pushw	x
      009536 CD 8E 06         [ 4] 1337 	call	_ld_word
      009539 5B 02            [ 2] 1338 	addw	sp, #2
      00953B 1F 3B            [ 2] 1339 	ldw	(0x3b, sp), x
      00953D 0F 3A            [ 1] 1340 	clr	(0x3a, sp)
      00953F 0F 39            [ 1] 1341 	clr	(0x39, sp)
      009541 16 37            [ 2] 1342 	ldw	y, (0x37, sp)
      009543 72 F2 3B         [ 2] 1343 	subw	y, (0x3b, sp)
      009546 7B 36            [ 1] 1344 	ld	a, (0x36, sp)
      009548 12 3A            [ 1] 1345 	sbc	a, (0x3a, sp)
      00954A 88               [ 1] 1346 	push	a
      00954B 7B 36            [ 1] 1347 	ld	a, (0x36, sp)
      00954D 12 3A            [ 1] 1348 	sbc	a, (0x3a, sp)
      00954F 97               [ 1] 1349 	ld	xl, a
      009550 84               [ 1] 1350 	pop	a
      009551 72 F2 27         [ 2] 1351 	subw	y, (0x27, sp)
      009554 12 26            [ 1] 1352 	sbc	a, (0x26, sp)
      009556 6B 32            [ 1] 1353 	ld	(0x32, sp), a
      009558 9F               [ 1] 1354 	ld	a, xl
      009559 12 25            [ 1] 1355 	sbc	a, (0x25, sp)
      00955B 1E 2F            [ 2] 1356 	ldw	x, (0x2f, sp)
      00955D FE               [ 2] 1357 	ldw	x, (x)
      00955E 54               [ 2] 1358 	srlw	x
      00955F 54               [ 2] 1359 	srlw	x
      009560 54               [ 2] 1360 	srlw	x
      009561 54               [ 2] 1361 	srlw	x
      009562 1F 37            [ 2] 1362 	ldw	(0x37, sp), x
      009564 5F               [ 1] 1363 	clrw	x
      009565 0F 35            [ 1] 1364 	clr	(0x35, sp)
      009567 72 F2 37         [ 2] 1365 	subw	y, (0x37, sp)
      00956A 17 3B            [ 2] 1366 	ldw	(0x3b, sp), y
      00956C 88               [ 1] 1367 	push	a
      00956D 7B 33            [ 1] 1368 	ld	a, (0x33, sp)
      00956F 89               [ 2] 1369 	pushw	x
      009570 12 02            [ 1] 1370 	sbc	a, (2, sp)
      009572 85               [ 2] 1371 	popw	x
      009573 6B 3B            [ 1] 1372 	ld	(0x3b, sp), a
      009575 84               [ 1] 1373 	pop	a
      009576 12 35            [ 1] 1374 	sbc	a, (0x35, sp)
      009578 6B 39            [ 1] 1375 	ld	(0x39, sp), a
                                   1376 ;	../src/pff.c: 864: ) / fs->csize + 2;
      00957A 1E 2D            [ 2] 1377 	ldw	x, (0x2d, sp)
      00957C F6               [ 1] 1378 	ld	a, (x)
      00957D 5F               [ 1] 1379 	clrw	x
      00957E 97               [ 1] 1380 	ld	xl, a
      00957F 90 5F            [ 1] 1381 	clrw	y
      009581 89               [ 2] 1382 	pushw	x
      009582 90 89            [ 2] 1383 	pushw	y
      009584 1E 3F            [ 2] 1384 	ldw	x, (0x3f, sp)
      009586 89               [ 2] 1385 	pushw	x
      009587 1E 3F            [ 2] 1386 	ldw	x, (0x3f, sp)
      009589 89               [ 2] 1387 	pushw	x
      00958A CD 9B 4F         [ 4] 1388 	call	__divulong
      00958D 5B 08            [ 2] 1389 	addw	sp, #8
      00958F 17 39            [ 2] 1390 	ldw	(0x39, sp), y
      009591 1C 00 02         [ 2] 1391 	addw	x, #0x0002
      009594 51               [ 1] 1392 	exgw	x, y
      009595 1E 39            [ 2] 1393 	ldw	x, (0x39, sp)
      009597 24 01            [ 1] 1394 	jrnc	00209$
      009599 5C               [ 1] 1395 	incw	x
      00959A                       1396 00209$:
      00959A 1F 39            [ 2] 1397 	ldw	(0x39, sp), x
                                   1398 ;	../src/pff.c: 865: fs->n_fatent = (CLUST)mclst;
      00959C 1E 29            [ 2] 1399 	ldw	x, (0x29, sp)
      00959E 1C 00 06         [ 2] 1400 	addw	x, #0x0006
      0095A1 EF 02            [ 2] 1401 	ldw	(0x2, x), y
      0095A3 7B 3A            [ 1] 1402 	ld	a, (0x3a, sp)
      0095A5 E7 01            [ 1] 1403 	ld	(0x1, x), a
      0095A7 7B 39            [ 1] 1404 	ld	a, (0x39, sp)
      0095A9 F7               [ 1] 1405 	ld	(x), a
                                   1406 ;	../src/pff.c: 867: fmt = 0;							/* Determine the FAT sub type */
      0095AA 4F               [ 1] 1407 	clr	a
                                   1408 ;	../src/pff.c: 870: if (PF_FS_FAT32 && mclst >= 0xFFF7) fmt = FS_FAT32;
      0095AB 90 A3 FF F7      [ 2] 1409 	cpw	y, #0xfff7
      0095AF 88               [ 1] 1410 	push	a
      0095B0 7B 3B            [ 1] 1411 	ld	a, (0x3b, sp)
      0095B2 A2 00            [ 1] 1412 	sbc	a, #0x00
      0095B4 7B 3A            [ 1] 1413 	ld	a, (0x3a, sp)
      0095B6 A2 00            [ 1] 1414 	sbc	a, #0x00
      0095B8 84               [ 1] 1415 	pop	a
      0095B9 25 02            [ 1] 1416 	jrc	00128$
      0095BB A6 03            [ 1] 1417 	ld	a, #0x03
      0095BD                       1418 00128$:
                                   1419 ;	../src/pff.c: 871: if (!fmt) return FR_NO_FILESYSTEM;
      0095BD 4D               [ 1] 1420 	tnz	a
      0095BE 26 04            [ 1] 1421 	jrne	00131$
      0095C0 A6 06            [ 1] 1422 	ld	a, #0x06
      0095C2 20 65            [ 2] 1423 	jra	00137$
      0095C4                       1424 00131$:
                                   1425 ;	../src/pff.c: 872: fs->fs_type = fmt;
      0095C4 1E 29            [ 2] 1426 	ldw	x, (0x29, sp)
      0095C6 F7               [ 1] 1427 	ld	(x), a
                                   1428 ;	../src/pff.c: 875: fs->dirbase = ld_dword(buf+(BPB_RootClus-13));	/* Root directory start cluster */
      0095C7 1E 29            [ 2] 1429 	ldw	x, (0x29, sp)
      0095C9 1C 00 0E         [ 2] 1430 	addw	x, #0x000e
      0095CC 1F 37            [ 2] 1431 	ldw	(0x37, sp), x
      0095CE 96               [ 1] 1432 	ldw	x, sp
      0095CF 1C 00 20         [ 2] 1433 	addw	x, #32
      0095D2 89               [ 2] 1434 	pushw	x
      0095D3 CD 8E 1C         [ 4] 1435 	call	_ld_dword
      0095D6 5B 02            [ 2] 1436 	addw	sp, #2
      0095D8 17 39            [ 2] 1437 	ldw	(0x39, sp), y
      0095DA 16 37            [ 2] 1438 	ldw	y, (0x37, sp)
      0095DC 90 EF 02         [ 2] 1439 	ldw	(0x2, y), x
      0095DF 1E 39            [ 2] 1440 	ldw	x, (0x39, sp)
      0095E1 90 FF            [ 2] 1441 	ldw	(y), x
                                   1442 ;	../src/pff.c: 879: fs->database = fs->fatbase + fsize + fs->n_rootdir / 16;	/* Data start sector (lba) */
      0095E3 1E 29            [ 2] 1443 	ldw	x, (0x29, sp)
      0095E5 1C 00 12         [ 2] 1444 	addw	x, #0x0012
      0095E8 1F 3B            [ 2] 1445 	ldw	(0x3b, sp), x
      0095EA 1E 2B            [ 2] 1446 	ldw	x, (0x2b, sp)
      0095EC 90 93            [ 1] 1447 	ldw	y, x
      0095EE 90 EE 02         [ 2] 1448 	ldw	y, (0x2, y)
      0095F1 FE               [ 2] 1449 	ldw	x, (x)
      0095F2 72 F9 27         [ 2] 1450 	addw	y, (0x27, sp)
      0095F5 17 39            [ 2] 1451 	ldw	(0x39, sp), y
      0095F7 9F               [ 1] 1452 	ld	a, xl
      0095F8 19 26            [ 1] 1453 	adc	a, (0x26, sp)
      0095FA 6B 38            [ 1] 1454 	ld	(0x38, sp), a
      0095FC 9E               [ 1] 1455 	ld	a, xh
      0095FD 19 25            [ 1] 1456 	adc	a, (0x25, sp)
      0095FF 1E 2F            [ 2] 1457 	ldw	x, (0x2f, sp)
      009601 FE               [ 2] 1458 	ldw	x, (x)
      009602 54               [ 2] 1459 	srlw	x
      009603 54               [ 2] 1460 	srlw	x
      009604 54               [ 2] 1461 	srlw	x
      009605 54               [ 2] 1462 	srlw	x
      009606 51               [ 1] 1463 	exgw	x, y
      009607 5F               [ 1] 1464 	clrw	x
      009608 0F 2F            [ 1] 1465 	clr	(0x2f, sp)
      00960A 72 F9 39         [ 2] 1466 	addw	y, (0x39, sp)
      00960D 88               [ 1] 1467 	push	a
      00960E 9F               [ 1] 1468 	ld	a, xl
      00960F 19 39            [ 1] 1469 	adc	a, (0x39, sp)
      009611 6B 35            [ 1] 1470 	ld	(0x35, sp), a
      009613 84               [ 1] 1471 	pop	a
      009614 19 2F            [ 1] 1472 	adc	a, (0x2f, sp)
      009616 6B 33            [ 1] 1473 	ld	(0x33, sp), a
      009618 1E 3B            [ 2] 1474 	ldw	x, (0x3b, sp)
      00961A EF 02            [ 2] 1475 	ldw	(0x2, x), y
      00961C 16 33            [ 2] 1476 	ldw	y, (0x33, sp)
      00961E FF               [ 2] 1477 	ldw	(x), y
                                   1478 ;	../src/pff.c: 881: fs->flag = 0;
      00961F 1E 29            [ 2] 1479 	ldw	x, (0x29, sp)
      009621 5C               [ 1] 1480 	incw	x
      009622 7F               [ 1] 1481 	clr	(x)
                                   1482 ;	../src/pff.c: 882: FatFs = fs;
      009623 1E 29            [ 2] 1483 	ldw	x, (0x29, sp)
      009625 CF 02 61         [ 2] 1484 	ldw	_FatFs+0, x
                                   1485 ;	../src/pff.c: 884: return FR_OK;
      009628 4F               [ 1] 1486 	clr	a
      009629                       1487 00137$:
                                   1488 ;	../src/pff.c: 885: }
      009629 5B 3C            [ 2] 1489 	addw	sp, #60
      00962B 81               [ 4] 1490 	ret
                                   1491 ;	../src/pff.c: 894: FRESULT pf_open (
                                   1492 ;	-----------------------------------------
                                   1493 ;	 function pf_open
                                   1494 ;	-----------------------------------------
      00962C                       1495 _pf_open:
      00962C 52 46            [ 2] 1496 	sub	sp, #70
                                   1497 ;	../src/pff.c: 901: FATFS *fs = FatFs;
      00962E CE 02 61         [ 2] 1498 	ldw	x, _FatFs+0
                                   1499 ;	../src/pff.c: 904: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
      009631 1F 3D            [ 2] 1500 	ldw	(0x3d, sp), x
      009633 26 05            [ 1] 1501 	jrne	00102$
      009635 A6 05            [ 1] 1502 	ld	a, #0x05
      009637 CC 96 BA         [ 2] 1503 	jp	00108$
      00963A                       1504 00102$:
                                   1505 ;	../src/pff.c: 906: fs->flag = 0;
      00963A 1E 3D            [ 2] 1506 	ldw	x, (0x3d, sp)
      00963C 5C               [ 1] 1507 	incw	x
      00963D 1F 3F            [ 2] 1508 	ldw	(0x3f, sp), x
      00963F 7F               [ 1] 1509 	clr	(x)
                                   1510 ;	../src/pff.c: 907: dj.fn = sp;
      009640 96               [ 1] 1511 	ldw	x, sp
      009641 1C 00 03         [ 2] 1512 	addw	x, #3
      009644 90 96            [ 1] 1513 	ldw	y, sp
      009646 72 A9 00 11      [ 2] 1514 	addw	y, #17
      00964A FF               [ 2] 1515 	ldw	(x), y
                                   1516 ;	../src/pff.c: 908: res = follow_path(&dj, dir, path);	/* Follow the file path */
      00964B 1E 49            [ 2] 1517 	ldw	x, (0x49, sp)
      00964D 89               [ 2] 1518 	pushw	x
      00964E 96               [ 1] 1519 	ldw	x, sp
      00964F 1C 00 1F         [ 2] 1520 	addw	x, #31
      009652 89               [ 2] 1521 	pushw	x
      009653 96               [ 1] 1522 	ldw	x, sp
      009654 1C 00 05         [ 2] 1523 	addw	x, #5
      009657 89               [ 2] 1524 	pushw	x
      009658 CD 92 E8         [ 4] 1525 	call	_follow_path
      00965B 5B 06            [ 2] 1526 	addw	sp, #6
      00965D 97               [ 1] 1527 	ld	xl, a
                                   1528 ;	../src/pff.c: 909: if (res != FR_OK) return res;		/* Follow failed */
      00965E 4D               [ 1] 1529 	tnz	a
      00965F 27 03            [ 1] 1530 	jreq	00104$
      009661 9F               [ 1] 1531 	ld	a, xl
      009662 20 56            [ 2] 1532 	jra	00108$
      009664                       1533 00104$:
                                   1534 ;	../src/pff.c: 910: if (!dir[0] || (dir[DIR_Attr] & AM_DIR)) return FR_NO_FILE;	/* It is a directory */
      009664 7B 1D            [ 1] 1535 	ld	a, (0x1d, sp)
      009666 27 06            [ 1] 1536 	jreq	00105$
      009668 7B 28            [ 1] 1537 	ld	a, (0x28, sp)
      00966A A5 10            [ 1] 1538 	bcp	a, #0x10
      00966C 27 04            [ 1] 1539 	jreq	00106$
      00966E                       1540 00105$:
      00966E A6 03            [ 1] 1541 	ld	a, #0x03
      009670 20 48            [ 2] 1542 	jra	00108$
      009672                       1543 00106$:
                                   1544 ;	../src/pff.c: 912: fs->org_clust = get_clust(dir);		/* File start cluster */
      009672 1E 3D            [ 2] 1545 	ldw	x, (0x3d, sp)
      009674 1C 00 1E         [ 2] 1546 	addw	x, #0x001e
      009677 1F 41            [ 2] 1547 	ldw	(0x41, sp), x
      009679 96               [ 1] 1548 	ldw	x, sp
      00967A 1C 00 1D         [ 2] 1549 	addw	x, #29
      00967D 89               [ 2] 1550 	pushw	x
      00967E CD 90 08         [ 4] 1551 	call	_get_clust
      009681 5B 02            [ 2] 1552 	addw	sp, #2
      009683 17 43            [ 2] 1553 	ldw	(0x43, sp), y
      009685 16 41            [ 2] 1554 	ldw	y, (0x41, sp)
      009687 90 EF 02         [ 2] 1555 	ldw	(0x2, y), x
      00968A 1E 43            [ 2] 1556 	ldw	x, (0x43, sp)
      00968C 90 FF            [ 2] 1557 	ldw	(y), x
                                   1558 ;	../src/pff.c: 913: fs->fsize = ld_dword(dir+DIR_FileSize);	/* File size */
      00968E 1E 3D            [ 2] 1559 	ldw	x, (0x3d, sp)
      009690 1C 00 1A         [ 2] 1560 	addw	x, #0x001a
      009693 1F 41            [ 2] 1561 	ldw	(0x41, sp), x
      009695 96               [ 1] 1562 	ldw	x, sp
      009696 1C 00 39         [ 2] 1563 	addw	x, #57
      009699 89               [ 2] 1564 	pushw	x
      00969A CD 8E 1C         [ 4] 1565 	call	_ld_dword
      00969D 5B 02            [ 2] 1566 	addw	sp, #2
      00969F 17 43            [ 2] 1567 	ldw	(0x43, sp), y
      0096A1 16 41            [ 2] 1568 	ldw	y, (0x41, sp)
      0096A3 90 EF 02         [ 2] 1569 	ldw	(0x2, y), x
      0096A6 1E 43            [ 2] 1570 	ldw	x, (0x43, sp)
      0096A8 90 FF            [ 2] 1571 	ldw	(y), x
                                   1572 ;	../src/pff.c: 914: fs->fptr = 0;						/* File pointer */
      0096AA 1E 3D            [ 2] 1573 	ldw	x, (0x3d, sp)
      0096AC 1C 00 16         [ 2] 1574 	addw	x, #0x0016
      0096AF 90 5F            [ 1] 1575 	clrw	y
      0096B1 EF 02            [ 2] 1576 	ldw	(0x2, x), y
      0096B3 FF               [ 2] 1577 	ldw	(x), y
                                   1578 ;	../src/pff.c: 915: fs->flag = FA_OPENED;
      0096B4 1E 3F            [ 2] 1579 	ldw	x, (0x3f, sp)
      0096B6 A6 01            [ 1] 1580 	ld	a, #0x01
      0096B8 F7               [ 1] 1581 	ld	(x), a
                                   1582 ;	../src/pff.c: 917: return FR_OK;
      0096B9 4F               [ 1] 1583 	clr	a
      0096BA                       1584 00108$:
                                   1585 ;	../src/pff.c: 918: }
      0096BA 5B 46            [ 2] 1586 	addw	sp, #70
      0096BC 81               [ 4] 1587 	ret
                                   1588 ;	../src/pff.c: 928: FRESULT pf_read (
                                   1589 ;	-----------------------------------------
                                   1590 ;	 function pf_read
                                   1591 ;	-----------------------------------------
      0096BD                       1592 _pf_read:
      0096BD 52 1A            [ 2] 1593 	sub	sp, #26
                                   1594 ;	../src/pff.c: 938: BYTE cs, *rbuff = buff;
      0096BF 1E 1D            [ 2] 1595 	ldw	x, (0x1d, sp)
      0096C1 1F 01            [ 2] 1596 	ldw	(0x01, sp), x
                                   1597 ;	../src/pff.c: 939: FATFS *fs = FatFs;
      0096C3 CE 02 61         [ 2] 1598 	ldw	x, _FatFs+0
      0096C6 1F 19            [ 2] 1599 	ldw	(0x19, sp), x
                                   1600 ;	../src/pff.c: 942: *br = 0;
      0096C8 16 21            [ 2] 1601 	ldw	y, (0x21, sp)
      0096CA 17 03            [ 2] 1602 	ldw	(0x03, sp), y
      0096CC 93               [ 1] 1603 	ldw	x, y
      0096CD 6F 01            [ 1] 1604 	clr	(0x1, x)
      0096CF 7F               [ 1] 1605 	clr	(x)
                                   1606 ;	../src/pff.c: 943: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
      0096D0 1E 19            [ 2] 1607 	ldw	x, (0x19, sp)
      0096D2 26 05            [ 1] 1608 	jrne	00102$
      0096D4 A6 05            [ 1] 1609 	ld	a, #0x05
      0096D6 CC 98 A8         [ 2] 1610 	jp	00127$
      0096D9                       1611 00102$:
                                   1612 ;	../src/pff.c: 944: if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
      0096D9 1E 19            [ 2] 1613 	ldw	x, (0x19, sp)
      0096DB 5C               [ 1] 1614 	incw	x
      0096DC 1F 05            [ 2] 1615 	ldw	(0x05, sp), x
      0096DE F6               [ 1] 1616 	ld	a, (x)
      0096DF 44               [ 1] 1617 	srl	a
      0096E0 25 05            [ 1] 1618 	jrc	00104$
      0096E2 A6 04            [ 1] 1619 	ld	a, #0x04
      0096E4 CC 98 A8         [ 2] 1620 	jp	00127$
      0096E7                       1621 00104$:
                                   1622 ;	../src/pff.c: 946: remain = fs->fsize - fs->fptr;
      0096E7 1E 19            [ 2] 1623 	ldw	x, (0x19, sp)
      0096E9 90 93            [ 1] 1624 	ldw	y, x
      0096EB 90 EE 1C         [ 2] 1625 	ldw	y, (0x1c, y)
      0096EE EE 1A            [ 2] 1626 	ldw	x, (0x1a, x)
      0096F0 1F 11            [ 2] 1627 	ldw	(0x11, sp), x
      0096F2 1E 19            [ 2] 1628 	ldw	x, (0x19, sp)
      0096F4 1C 00 16         [ 2] 1629 	addw	x, #0x0016
      0096F7 1F 07            [ 2] 1630 	ldw	(0x07, sp), x
      0096F9 E6 03            [ 1] 1631 	ld	a, (0x3, x)
      0096FB 6B 18            [ 1] 1632 	ld	(0x18, sp), a
      0096FD E6 02            [ 1] 1633 	ld	a, (0x2, x)
      0096FF 6B 17            [ 1] 1634 	ld	(0x17, sp), a
      009701 FE               [ 2] 1635 	ldw	x, (x)
      009702 72 F2 17         [ 2] 1636 	subw	y, (0x17, sp)
      009705 7B 12            [ 1] 1637 	ld	a, (0x12, sp)
      009707 89               [ 2] 1638 	pushw	x
      009708 12 02            [ 1] 1639 	sbc	a, (2, sp)
      00970A 85               [ 2] 1640 	popw	x
      00970B 97               [ 1] 1641 	ld	xl, a
      00970C 7B 11            [ 1] 1642 	ld	a, (0x11, sp)
      00970E 89               [ 2] 1643 	pushw	x
      00970F 12 01            [ 1] 1644 	sbc	a, (1, sp)
      009711 85               [ 2] 1645 	popw	x
      009712 17 13            [ 2] 1646 	ldw	(0x13, sp), y
      009714 95               [ 1] 1647 	ld	xh, a
                                   1648 ;	../src/pff.c: 947: if (btr > remain) btr = (UINT)remain;			/* Truncate btr by remaining bytes */
      009715 16 1F            [ 2] 1649 	ldw	y, (0x1f, sp)
      009717 17 17            [ 2] 1650 	ldw	(0x17, sp), y
      009719 0F 16            [ 1] 1651 	clr	(0x16, sp)
      00971B 0F 15            [ 1] 1652 	clr	(0x15, sp)
      00971D 7B 14            [ 1] 1653 	ld	a, (0x14, sp)
      00971F 11 18            [ 1] 1654 	cp	a, (0x18, sp)
      009721 7B 13            [ 1] 1655 	ld	a, (0x13, sp)
      009723 12 17            [ 1] 1656 	sbc	a, (0x17, sp)
      009725 9F               [ 1] 1657 	ld	a, xl
      009726 12 16            [ 1] 1658 	sbc	a, (0x16, sp)
      009728 9E               [ 1] 1659 	ld	a, xh
      009729 12 15            [ 1] 1660 	sbc	a, (0x15, sp)
      00972B 24 04            [ 1] 1661 	jrnc	00140$
      00972D 1E 13            [ 2] 1662 	ldw	x, (0x13, sp)
      00972F 1F 1F            [ 2] 1663 	ldw	(0x1f, sp), x
                                   1664 ;	../src/pff.c: 949: while (btr)	{									/* Repeat until all data transferred */
      009731                       1665 00140$:
      009731 1E 19            [ 2] 1666 	ldw	x, (0x19, sp)
      009733 1C 00 22         [ 2] 1667 	addw	x, #0x0022
      009736 1F 09            [ 2] 1668 	ldw	(0x09, sp), x
      009738 16 19            [ 2] 1669 	ldw	y, (0x19, sp)
      00973A 17 0B            [ 2] 1670 	ldw	(0x0b, sp), y
      00973C 16 19            [ 2] 1671 	ldw	y, (0x19, sp)
      00973E 17 0D            [ 2] 1672 	ldw	(0x0d, sp), y
      009740 1E 19            [ 2] 1673 	ldw	x, (0x19, sp)
      009742 1C 00 26         [ 2] 1674 	addw	x, #0x0026
      009745 1F 0F            [ 2] 1675 	ldw	(0x0f, sp), x
      009747                       1676 00124$:
      009747 1E 1F            [ 2] 1677 	ldw	x, (0x1f, sp)
      009749 26 03            [ 1] 1678 	jrne	00197$
      00974B CC 98 A7         [ 2] 1679 	jp	00126$
      00974E                       1680 00197$:
                                   1681 ;	../src/pff.c: 950: if ((fs->fptr % 512) == 0) {				/* On the sector boundary? */
      00974E 1E 07            [ 2] 1682 	ldw	x, (0x07, sp)
      009750 90 93            [ 1] 1683 	ldw	y, x
      009752 90 EE 02         [ 2] 1684 	ldw	y, (0x2, y)
      009755 17 13            [ 2] 1685 	ldw	(0x13, sp), y
      009757 FE               [ 2] 1686 	ldw	x, (x)
      009758 1F 11            [ 2] 1687 	ldw	(0x11, sp), x
      00975A 7B 14            [ 1] 1688 	ld	a, (0x14, sp)
      00975C 6B 1A            [ 1] 1689 	ld	(0x1a, sp), a
      00975E 7B 13            [ 1] 1690 	ld	a, (0x13, sp)
      009760 A4 01            [ 1] 1691 	and	a, #0x01
      009762 6B 19            [ 1] 1692 	ld	(0x19, sp), a
      009764 5F               [ 1] 1693 	clrw	x
      009765 1F 17            [ 2] 1694 	ldw	(0x17, sp), x
      009767 1E 19            [ 2] 1695 	ldw	x, (0x19, sp)
      009769 26 04            [ 1] 1696 	jrne	00198$
      00976B 1E 17            [ 2] 1697 	ldw	x, (0x17, sp)
      00976D 27 03            [ 1] 1698 	jreq	00199$
      00976F                       1699 00198$:
      00976F CC 98 1E         [ 2] 1700 	jp	00117$
      009772                       1701 00199$:
                                   1702 ;	../src/pff.c: 951: cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
      009772 16 12            [ 2] 1703 	ldw	y, (0x12, sp)
      009774 17 17            [ 2] 1704 	ldw	(0x17, sp), y
      009776 7B 11            [ 1] 1705 	ld	a, (0x11, sp)
      009778 6B 16            [ 1] 1706 	ld	(0x16, sp), a
      00977A 0F 15            [ 1] 1707 	clr	(0x15, sp)
      00977C 04 16            [ 1] 1708 	srl	(0x16, sp)
      00977E 06 17            [ 1] 1709 	rrc	(0x17, sp)
      009780 06 18            [ 1] 1710 	rrc	(0x18, sp)
      009782 1E 0D            [ 2] 1711 	ldw	x, (0x0d, sp)
      009784 E6 02            [ 1] 1712 	ld	a, (0x2, x)
      009786 6B 1A            [ 1] 1713 	ld	(0x1a, sp), a
      009788 0A 1A            [ 1] 1714 	dec	(0x1a, sp)
      00978A 7B 1A            [ 1] 1715 	ld	a, (0x1a, sp)
      00978C 6B 19            [ 1] 1716 	ld	(0x19, sp), a
      00978E 7B 18            [ 1] 1717 	ld	a, (0x18, sp)
      009790 6B 1A            [ 1] 1718 	ld	(0x1a, sp), a
      009792 14 19            [ 1] 1719 	and	a, (0x19, sp)
                                   1720 ;	../src/pff.c: 952: if (!cs) {								/* On the cluster boundary? */
      009794 6B 1A            [ 1] 1721 	ld	(0x1a, sp), a
      009796 26 48            [ 1] 1722 	jrne	00113$
                                   1723 ;	../src/pff.c: 953: if (fs->fptr == 0) {				/* On the top of the file? */
      009798 1E 13            [ 2] 1724 	ldw	x, (0x13, sp)
      00979A 26 13            [ 1] 1725 	jrne	00108$
      00979C 1E 11            [ 2] 1726 	ldw	x, (0x11, sp)
      00979E 26 0F            [ 1] 1727 	jrne	00108$
                                   1728 ;	../src/pff.c: 954: clst = fs->org_clust;
      0097A0 1E 0B            [ 2] 1729 	ldw	x, (0x0b, sp)
      0097A2 90 93            [ 1] 1730 	ldw	y, x
      0097A4 90 EE 20         [ 2] 1731 	ldw	y, (0x20, y)
      0097A7 EE 1E            [ 2] 1732 	ldw	x, (0x1e, x)
      0097A9 17 18            [ 2] 1733 	ldw	(0x18, sp), y
      0097AB 1F 16            [ 2] 1734 	ldw	(0x16, sp), x
      0097AD 20 14            [ 2] 1735 	jra	00109$
      0097AF                       1736 00108$:
                                   1737 ;	../src/pff.c: 956: clst = get_fat(fs->curr_clust);
      0097AF 1E 09            [ 2] 1738 	ldw	x, (0x09, sp)
      0097B1 90 93            [ 1] 1739 	ldw	y, x
      0097B3 90 EE 02         [ 2] 1740 	ldw	y, (0x2, y)
      0097B6 FE               [ 2] 1741 	ldw	x, (x)
      0097B7 90 89            [ 2] 1742 	pushw	y
      0097B9 89               [ 2] 1743 	pushw	x
      0097BA CD 8E EF         [ 4] 1744 	call	_get_fat
      0097BD 5B 04            [ 2] 1745 	addw	sp, #4
      0097BF 17 16            [ 2] 1746 	ldw	(0x16, sp), y
      0097C1 1F 18            [ 2] 1747 	ldw	(0x18, sp), x
      0097C3                       1748 00109$:
                                   1749 ;	../src/pff.c: 958: if (clst <= 1) ABORT(FR_DISK_ERR);
      0097C3 5F               [ 1] 1750 	clrw	x
      0097C4 5C               [ 1] 1751 	incw	x
      0097C5 13 18            [ 2] 1752 	cpw	x, (0x18, sp)
      0097C7 4F               [ 1] 1753 	clr	a
      0097C8 12 17            [ 1] 1754 	sbc	a, (0x17, sp)
      0097CA 4F               [ 1] 1755 	clr	a
      0097CB 12 16            [ 1] 1756 	sbc	a, (0x16, sp)
      0097CD 25 08            [ 1] 1757 	jrc	00111$
      0097CF 1E 05            [ 2] 1758 	ldw	x, (0x05, sp)
      0097D1 7F               [ 1] 1759 	clr	(x)
      0097D2 A6 01            [ 1] 1760 	ld	a, #0x01
      0097D4 CC 98 A8         [ 2] 1761 	jp	00127$
      0097D7                       1762 00111$:
                                   1763 ;	../src/pff.c: 959: fs->curr_clust = clst;				/* Update current cluster */
      0097D7 1E 09            [ 2] 1764 	ldw	x, (0x09, sp)
      0097D9 16 18            [ 2] 1765 	ldw	y, (0x18, sp)
      0097DB EF 02            [ 2] 1766 	ldw	(0x2, x), y
      0097DD 16 16            [ 2] 1767 	ldw	y, (0x16, sp)
      0097DF FF               [ 2] 1768 	ldw	(x), y
      0097E0                       1769 00113$:
                                   1770 ;	../src/pff.c: 961: sect = clust2sect(fs->curr_clust);		/* Get current sector */
      0097E0 1E 09            [ 2] 1771 	ldw	x, (0x09, sp)
      0097E2 90 93            [ 1] 1772 	ldw	y, x
      0097E4 90 EE 02         [ 2] 1773 	ldw	y, (0x2, y)
      0097E7 FE               [ 2] 1774 	ldw	x, (x)
      0097E8 90 89            [ 2] 1775 	pushw	y
      0097EA 89               [ 2] 1776 	pushw	x
      0097EB CD 8F 96         [ 4] 1777 	call	_clust2sect
      0097EE 5B 04            [ 2] 1778 	addw	sp, #4
      0097F0 1F 18            [ 2] 1779 	ldw	(0x18, sp), x
      0097F2 17 16            [ 2] 1780 	ldw	(0x16, sp), y
                                   1781 ;	../src/pff.c: 962: if (!sect) ABORT(FR_DISK_ERR);
      0097F4 5D               [ 2] 1782 	tnzw	x
      0097F5 26 0C            [ 1] 1783 	jrne	00115$
      0097F7 90 5D            [ 2] 1784 	tnzw	y
      0097F9 26 08            [ 1] 1785 	jrne	00115$
      0097FB 1E 05            [ 2] 1786 	ldw	x, (0x05, sp)
      0097FD 7F               [ 1] 1787 	clr	(x)
      0097FE A6 01            [ 1] 1788 	ld	a, #0x01
      009800 CC 98 A8         [ 2] 1789 	jp	00127$
      009803                       1790 00115$:
                                   1791 ;	../src/pff.c: 963: fs->dsect = sect + cs;
      009803 7B 1A            [ 1] 1792 	ld	a, (0x1a, sp)
      009805 90 5F            [ 1] 1793 	clrw	y
      009807 5F               [ 1] 1794 	clrw	x
      009808 90 97            [ 1] 1795 	ld	yl, a
      00980A 72 F9 18         [ 2] 1796 	addw	y, (0x18, sp)
      00980D 9F               [ 1] 1797 	ld	a, xl
      00980E 19 17            [ 1] 1798 	adc	a, (0x17, sp)
      009810 6B 13            [ 1] 1799 	ld	(0x13, sp), a
      009812 9E               [ 1] 1800 	ld	a, xh
      009813 19 16            [ 1] 1801 	adc	a, (0x16, sp)
      009815 6B 12            [ 1] 1802 	ld	(0x12, sp), a
      009817 1E 0F            [ 2] 1803 	ldw	x, (0x0f, sp)
      009819 EF 02            [ 2] 1804 	ldw	(0x2, x), y
      00981B 16 12            [ 2] 1805 	ldw	y, (0x12, sp)
      00981D FF               [ 2] 1806 	ldw	(x), y
      00981E                       1807 00117$:
                                   1808 ;	../src/pff.c: 946: remain = fs->fsize - fs->fptr;
      00981E 1E 07            [ 2] 1809 	ldw	x, (0x07, sp)
      009820 EE 02            [ 2] 1810 	ldw	x, (0x2, x)
                                   1811 ;	../src/pff.c: 965: rcnt = 512 - (UINT)fs->fptr % 512;			/* Get partial sector data from sector buffer */
      009822 9F               [ 1] 1812 	ld	a, xl
      009823 6B 16            [ 1] 1813 	ld	(0x16, sp), a
      009825 9E               [ 1] 1814 	ld	a, xh
      009826 A4 01            [ 1] 1815 	and	a, #0x01
      009828 6B 15            [ 1] 1816 	ld	(0x15, sp), a
      00982A 5F               [ 1] 1817 	clrw	x
      00982B A6 02            [ 1] 1818 	ld	a, #0x02
      00982D 95               [ 1] 1819 	ld	xh, a
      00982E 72 F0 15         [ 2] 1820 	subw	x, (0x15, sp)
                                   1821 ;	../src/pff.c: 966: if (rcnt > btr) rcnt = btr;
      009831 1F 11            [ 2] 1822 	ldw	(0x11, sp), x
      009833 13 1F            [ 2] 1823 	cpw	x, (0x1f, sp)
      009835 23 04            [ 2] 1824 	jrule	00119$
      009837 16 1F            [ 2] 1825 	ldw	y, (0x1f, sp)
      009839 17 11            [ 2] 1826 	ldw	(0x11, sp), y
      00983B                       1827 00119$:
                                   1828 ;	../src/pff.c: 967: dr = disk_readp(rbuff, fs->dsect, (UINT)fs->fptr % 512, rcnt);
      00983B 1E 0F            [ 2] 1829 	ldw	x, (0x0f, sp)
      00983D 90 93            [ 1] 1830 	ldw	y, x
      00983F 90 EE 02         [ 2] 1831 	ldw	y, (0x2, y)
      009842 FE               [ 2] 1832 	ldw	x, (x)
      009843 1F 17            [ 2] 1833 	ldw	(0x17, sp), x
      009845 1E 11            [ 2] 1834 	ldw	x, (0x11, sp)
      009847 89               [ 2] 1835 	pushw	x
      009848 1E 17            [ 2] 1836 	ldw	x, (0x17, sp)
      00984A 89               [ 2] 1837 	pushw	x
      00984B 90 89            [ 2] 1838 	pushw	y
      00984D 1E 1D            [ 2] 1839 	ldw	x, (0x1d, sp)
      00984F 89               [ 2] 1840 	pushw	x
      009850 1E 09            [ 2] 1841 	ldw	x, (0x09, sp)
      009852 89               [ 2] 1842 	pushw	x
      009853 CD 82 84         [ 4] 1843 	call	_disk_readp
      009856 5B 0A            [ 2] 1844 	addw	sp, #10
                                   1845 ;	../src/pff.c: 968: if (dr) ABORT(FR_DISK_ERR);
      009858 4D               [ 1] 1846 	tnz	a
      009859 27 07            [ 1] 1847 	jreq	00121$
      00985B 1E 05            [ 2] 1848 	ldw	x, (0x05, sp)
      00985D 7F               [ 1] 1849 	clr	(x)
      00985E A6 01            [ 1] 1850 	ld	a, #0x01
      009860 20 46            [ 2] 1851 	jra	00127$
      009862                       1852 00121$:
                                   1853 ;	../src/pff.c: 969: fs->fptr += rcnt;							/* Advances file read pointer */
      009862 1E 07            [ 2] 1854 	ldw	x, (0x07, sp)
      009864 90 93            [ 1] 1855 	ldw	y, x
      009866 90 EE 02         [ 2] 1856 	ldw	y, (0x2, y)
      009869 17 15            [ 2] 1857 	ldw	(0x15, sp), y
      00986B FE               [ 2] 1858 	ldw	x, (x)
      00986C 1F 13            [ 2] 1859 	ldw	(0x13, sp), x
      00986E 16 11            [ 2] 1860 	ldw	y, (0x11, sp)
      009870 4F               [ 1] 1861 	clr	a
      009871 5F               [ 1] 1862 	clrw	x
      009872 72 F9 15         [ 2] 1863 	addw	y, (0x15, sp)
      009875 19 14            [ 1] 1864 	adc	a, (0x14, sp)
      009877 6B 18            [ 1] 1865 	ld	(0x18, sp), a
      009879 9F               [ 1] 1866 	ld	a, xl
      00987A 19 13            [ 1] 1867 	adc	a, (0x13, sp)
      00987C 6B 17            [ 1] 1868 	ld	(0x17, sp), a
      00987E 1E 07            [ 2] 1869 	ldw	x, (0x07, sp)
      009880 EF 02            [ 2] 1870 	ldw	(0x2, x), y
      009882 16 17            [ 2] 1871 	ldw	y, (0x17, sp)
      009884 FF               [ 2] 1872 	ldw	(x), y
                                   1873 ;	../src/pff.c: 970: btr -= rcnt; *br += rcnt;					/* Update read counter */
      009885 1E 1F            [ 2] 1874 	ldw	x, (0x1f, sp)
      009887 72 F0 11         [ 2] 1875 	subw	x, (0x11, sp)
      00988A 1F 1F            [ 2] 1876 	ldw	(0x1f, sp), x
      00988C 1E 03            [ 2] 1877 	ldw	x, (0x03, sp)
      00988E FE               [ 2] 1878 	ldw	x, (x)
      00988F 72 FB 11         [ 2] 1879 	addw	x, (0x11, sp)
      009892 16 03            [ 2] 1880 	ldw	y, (0x03, sp)
      009894 90 FF            [ 2] 1881 	ldw	(y), x
                                   1882 ;	../src/pff.c: 971: if (rbuff) rbuff += rcnt;					/* Advances the data pointer if destination is memory */
      009896 1E 01            [ 2] 1883 	ldw	x, (0x01, sp)
      009898 26 03            [ 1] 1884 	jrne	00208$
      00989A CC 97 47         [ 2] 1885 	jp	00124$
      00989D                       1886 00208$:
      00989D 1E 01            [ 2] 1887 	ldw	x, (0x01, sp)
      00989F 72 FB 11         [ 2] 1888 	addw	x, (0x11, sp)
      0098A2 1F 01            [ 2] 1889 	ldw	(0x01, sp), x
      0098A4 CC 97 47         [ 2] 1890 	jp	00124$
      0098A7                       1891 00126$:
                                   1892 ;	../src/pff.c: 974: return FR_OK;
      0098A7 4F               [ 1] 1893 	clr	a
      0098A8                       1894 00127$:
                                   1895 ;	../src/pff.c: 975: }
      0098A8 5B 1A            [ 2] 1896 	addw	sp, #26
      0098AA 81               [ 4] 1897 	ret
                                   1898 ;	../src/pff.c: 985: FRESULT pf_write (
                                   1899 ;	-----------------------------------------
                                   1900 ;	 function pf_write
                                   1901 ;	-----------------------------------------
      0098AB                       1902 _pf_write:
      0098AB 52 1C            [ 2] 1903 	sub	sp, #28
                                   1904 ;	../src/pff.c: 993: const BYTE *p = buff;
      0098AD 1E 1F            [ 2] 1905 	ldw	x, (0x1f, sp)
      0098AF 1F 05            [ 2] 1906 	ldw	(0x05, sp), x
                                   1907 ;	../src/pff.c: 996: FATFS *fs = FatFs;
      0098B1 CE 02 61         [ 2] 1908 	ldw	x, _FatFs+0
      0098B4 1F 07            [ 2] 1909 	ldw	(0x07, sp), x
                                   1910 ;	../src/pff.c: 999: *bw = 0;
      0098B6 16 23            [ 2] 1911 	ldw	y, (0x23, sp)
      0098B8 17 09            [ 2] 1912 	ldw	(0x09, sp), y
      0098BA 93               [ 1] 1913 	ldw	x, y
      0098BB 6F 01            [ 1] 1914 	clr	(0x1, x)
      0098BD 7F               [ 1] 1915 	clr	(x)
                                   1916 ;	../src/pff.c: 1000: if (!fs) return FR_NOT_ENABLED;		/* Check file system */
      0098BE 1E 07            [ 2] 1917 	ldw	x, (0x07, sp)
      0098C0 26 05            [ 1] 1918 	jrne	00102$
      0098C2 A6 05            [ 1] 1919 	ld	a, #0x05
      0098C4 CC 9B 17         [ 2] 1920 	jp	00139$
      0098C7                       1921 00102$:
                                   1922 ;	../src/pff.c: 1001: if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
      0098C7 1E 07            [ 2] 1923 	ldw	x, (0x07, sp)
      0098C9 5C               [ 1] 1924 	incw	x
      0098CA 1F 0B            [ 2] 1925 	ldw	(0x0b, sp), x
      0098CC F6               [ 1] 1926 	ld	a, (x)
      0098CD A5 01            [ 1] 1927 	bcp	a, #0x01
      0098CF 26 05            [ 1] 1928 	jrne	00104$
      0098D1 A6 04            [ 1] 1929 	ld	a, #0x04
      0098D3 CC 9B 17         [ 2] 1930 	jp	00139$
      0098D6                       1931 00104$:
                                   1932 ;	../src/pff.c: 1004: if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
      0098D6 A4 40            [ 1] 1933 	and	a, #0x40
      0098D8 6B 1C            [ 1] 1934 	ld	(0x1c, sp), a
      0098DA 0F 1B            [ 1] 1935 	clr	(0x1b, sp)
                                   1936 ;	../src/pff.c: 1003: if (!btw) {		/* Finalize request */
      0098DC 1E 21            [ 2] 1937 	ldw	x, (0x21, sp)
      0098DE 26 26            [ 1] 1938 	jrne	00111$
                                   1939 ;	../src/pff.c: 1004: if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
      0098E0 1E 1B            [ 2] 1940 	ldw	x, (0x1b, sp)
      0098E2 27 16            [ 1] 1941 	jreq	00106$
      0098E4 5F               [ 1] 1942 	clrw	x
      0098E5 89               [ 2] 1943 	pushw	x
      0098E6 5F               [ 1] 1944 	clrw	x
      0098E7 89               [ 2] 1945 	pushw	x
      0098E8 5F               [ 1] 1946 	clrw	x
      0098E9 89               [ 2] 1947 	pushw	x
      0098EA CD 83 59         [ 4] 1948 	call	_disk_writep
      0098ED 5B 06            [ 2] 1949 	addw	sp, #6
      0098EF 4D               [ 1] 1950 	tnz	a
      0098F0 27 08            [ 1] 1951 	jreq	00106$
      0098F2 1E 0B            [ 2] 1952 	ldw	x, (0x0b, sp)
      0098F4 7F               [ 1] 1953 	clr	(x)
      0098F5 A6 01            [ 1] 1954 	ld	a, #0x01
      0098F7 CC 9B 17         [ 2] 1955 	jp	00139$
      0098FA                       1956 00106$:
                                   1957 ;	../src/pff.c: 1005: fs->flag &= ~FA__WIP;
      0098FA 1E 0B            [ 2] 1958 	ldw	x, (0x0b, sp)
      0098FC F6               [ 1] 1959 	ld	a, (x)
      0098FD A4 BF            [ 1] 1960 	and	a, #0xbf
      0098FF 1E 0B            [ 2] 1961 	ldw	x, (0x0b, sp)
      009901 F7               [ 1] 1962 	ld	(x), a
                                   1963 ;	../src/pff.c: 1006: return FR_OK;
      009902 4F               [ 1] 1964 	clr	a
      009903 CC 9B 17         [ 2] 1965 	jp	00139$
      009906                       1966 00111$:
                                   1967 ;	../src/pff.c: 1009: fs->fptr &= 0xFFFFFE00;
      009906 1E 07            [ 2] 1968 	ldw	x, (0x07, sp)
      009908 1C 00 16         [ 2] 1969 	addw	x, #0x0016
      00990B 1F 13            [ 2] 1970 	ldw	(0x13, sp), x
                                   1971 ;	../src/pff.c: 1008: if (!(fs->flag & FA__WIP)) {	/* Round-down fptr to the sector boundary */
      00990D 1E 1B            [ 2] 1972 	ldw	x, (0x1b, sp)
      00990F 26 1A            [ 1] 1973 	jrne	00112$
                                   1974 ;	../src/pff.c: 1009: fs->fptr &= 0xFFFFFE00;
      009911 1E 13            [ 2] 1975 	ldw	x, (0x13, sp)
      009913 E6 02            [ 1] 1976 	ld	a, (0x2, x)
      009915 FE               [ 2] 1977 	ldw	x, (x)
      009916 A4 FE            [ 1] 1978 	and	a, #0xfe
      009918 90 95            [ 1] 1979 	ld	yh, a
      00991A 4F               [ 1] 1980 	clr	a
      00991B 90 97            [ 1] 1981 	ld	yl, a
      00991D 02               [ 1] 1982 	rlwa	x
      00991E 6B 19            [ 1] 1983 	ld	(0x19, sp), a
      009920 01               [ 1] 1984 	rrwa	x
      009921 9F               [ 1] 1985 	ld	a, xl
      009922 1E 13            [ 2] 1986 	ldw	x, (0x13, sp)
      009924 EF 02            [ 2] 1987 	ldw	(0x2, x), y
      009926 E7 01            [ 1] 1988 	ld	(0x1, x), a
      009928 7B 19            [ 1] 1989 	ld	a, (0x19, sp)
      00992A F7               [ 1] 1990 	ld	(x), a
      00992B                       1991 00112$:
                                   1992 ;	../src/pff.c: 1012: remain = fs->fsize - fs->fptr;
      00992B 1E 07            [ 2] 1993 	ldw	x, (0x07, sp)
      00992D 90 93            [ 1] 1994 	ldw	y, x
      00992F 90 EE 1C         [ 2] 1995 	ldw	y, (0x1c, y)
      009932 EE 1A            [ 2] 1996 	ldw	x, (0x1a, x)
      009934 1F 15            [ 2] 1997 	ldw	(0x15, sp), x
      009936 1E 13            [ 2] 1998 	ldw	x, (0x13, sp)
      009938 1F 0D            [ 2] 1999 	ldw	(0x0d, sp), x
      00993A 1E 13            [ 2] 2000 	ldw	x, (0x13, sp)
      00993C E6 03            [ 1] 2001 	ld	a, (0x3, x)
      00993E 6B 1C            [ 1] 2002 	ld	(0x1c, sp), a
      009940 E6 02            [ 1] 2003 	ld	a, (0x2, x)
      009942 6B 1B            [ 1] 2004 	ld	(0x1b, sp), a
      009944 FE               [ 2] 2005 	ldw	x, (x)
      009945 1F 19            [ 2] 2006 	ldw	(0x19, sp), x
      009947 72 F2 1B         [ 2] 2007 	subw	y, (0x1b, sp)
      00994A 7B 16            [ 1] 2008 	ld	a, (0x16, sp)
      00994C 12 1A            [ 1] 2009 	sbc	a, (0x1a, sp)
      00994E 97               [ 1] 2010 	ld	xl, a
      00994F 7B 15            [ 1] 2011 	ld	a, (0x15, sp)
      009951 12 19            [ 1] 2012 	sbc	a, (0x19, sp)
      009953 17 17            [ 2] 2013 	ldw	(0x17, sp), y
      009955 95               [ 1] 2014 	ld	xh, a
                                   2015 ;	../src/pff.c: 1013: if (btw > remain) btw = (UINT)remain;			/* Truncate btw by remaining bytes */
      009956 16 21            [ 2] 2016 	ldw	y, (0x21, sp)
      009958 17 1B            [ 2] 2017 	ldw	(0x1b, sp), y
      00995A 0F 1A            [ 1] 2018 	clr	(0x1a, sp)
      00995C 0F 19            [ 1] 2019 	clr	(0x19, sp)
      00995E 7B 18            [ 1] 2020 	ld	a, (0x18, sp)
      009960 11 1C            [ 1] 2021 	cp	a, (0x1c, sp)
      009962 7B 17            [ 1] 2022 	ld	a, (0x17, sp)
      009964 12 1B            [ 1] 2023 	sbc	a, (0x1b, sp)
      009966 9F               [ 1] 2024 	ld	a, xl
      009967 12 1A            [ 1] 2025 	sbc	a, (0x1a, sp)
      009969 9E               [ 1] 2026 	ld	a, xh
      00996A 12 19            [ 1] 2027 	sbc	a, (0x19, sp)
      00996C 24 04            [ 1] 2028 	jrnc	00157$
      00996E 1E 17            [ 2] 2029 	ldw	x, (0x17, sp)
      009970 1F 21            [ 2] 2030 	ldw	(0x21, sp), x
                                   2031 ;	../src/pff.c: 1015: while (btw)	{									/* Repeat until all data transferred */
      009972                       2032 00157$:
      009972 1E 07            [ 2] 2033 	ldw	x, (0x07, sp)
      009974 1C 00 22         [ 2] 2034 	addw	x, #0x0022
      009977 1F 0F            [ 2] 2035 	ldw	(0x0f, sp), x
      009979 16 07            [ 2] 2036 	ldw	y, (0x07, sp)
      00997B 17 11            [ 2] 2037 	ldw	(0x11, sp), y
      00997D 16 07            [ 2] 2038 	ldw	y, (0x07, sp)
      00997F 17 13            [ 2] 2039 	ldw	(0x13, sp), y
      009981                       2040 00136$:
      009981 1E 21            [ 2] 2041 	ldw	x, (0x21, sp)
      009983 26 03            [ 1] 2042 	jrne	00243$
      009985 CC 9B 16         [ 2] 2043 	jp	00138$
      009988                       2044 00243$:
                                   2045 ;	../src/pff.c: 1016: if ((UINT)fs->fptr % 512 == 0) {			/* On the sector boundary? */
      009988 1E 0D            [ 2] 2046 	ldw	x, (0x0d, sp)
      00998A 90 93            [ 1] 2047 	ldw	y, x
      00998C 90 EE 02         [ 2] 2048 	ldw	y, (0x2, y)
      00998F 17 1A            [ 2] 2049 	ldw	(0x1a, sp), y
      009991 FE               [ 2] 2050 	ldw	x, (x)
      009992 1F 18            [ 2] 2051 	ldw	(0x18, sp), x
      009994 1E 1A            [ 2] 2052 	ldw	x, (0x1a, sp)
      009996 9E               [ 1] 2053 	ld	a, xh
      009997 A4 01            [ 1] 2054 	and	a, #0x01
      009999 95               [ 1] 2055 	ld	xh, a
      00999A 5D               [ 2] 2056 	tnzw	x
      00999B 27 03            [ 1] 2057 	jreq	00244$
      00999D CC 9A 67         [ 2] 2058 	jp	00127$
      0099A0                       2059 00244$:
                                   2060 ;	../src/pff.c: 1017: cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
      0099A0 7B 18            [ 1] 2061 	ld	a, (0x18, sp)
      0099A2 6B 02            [ 1] 2062 	ld	(0x02, sp), a
      0099A4 1E 19            [ 2] 2063 	ldw	x, (0x19, sp)
      0099A6 0F 01            [ 1] 2064 	clr	(0x01, sp)
      0099A8 04 02            [ 1] 2065 	srl	(0x02, sp)
      0099AA 56               [ 2] 2066 	rrcw	x
      0099AB 16 13            [ 2] 2067 	ldw	y, (0x13, sp)
      0099AD 90 E6 02         [ 1] 2068 	ld	a, (0x2, y)
      0099B0 4A               [ 1] 2069 	dec	a
      0099B1 89               [ 2] 2070 	pushw	x
      0099B2 14 02            [ 1] 2071 	and	a, (2, sp)
      0099B4 85               [ 2] 2072 	popw	x
                                   2073 ;	../src/pff.c: 1018: if (!cs) {								/* On the cluster boundary? */
      0099B5 6B 1C            [ 1] 2074 	ld	(0x1c, sp), a
      0099B7 26 48            [ 1] 2075 	jrne	00121$
                                   2076 ;	../src/pff.c: 1019: if (fs->fptr == 0) {				/* On the top of the file? */
      0099B9 1E 1A            [ 2] 2077 	ldw	x, (0x1a, sp)
      0099BB 26 13            [ 1] 2078 	jrne	00116$
      0099BD 1E 18            [ 2] 2079 	ldw	x, (0x18, sp)
      0099BF 26 0F            [ 1] 2080 	jrne	00116$
                                   2081 ;	../src/pff.c: 1020: clst = fs->org_clust;
      0099C1 1E 11            [ 2] 2082 	ldw	x, (0x11, sp)
      0099C3 90 93            [ 1] 2083 	ldw	y, x
      0099C5 90 EE 20         [ 2] 2084 	ldw	y, (0x20, y)
      0099C8 EE 1E            [ 2] 2085 	ldw	x, (0x1e, x)
      0099CA 17 1A            [ 2] 2086 	ldw	(0x1a, sp), y
      0099CC 1F 18            [ 2] 2087 	ldw	(0x18, sp), x
      0099CE 20 14            [ 2] 2088 	jra	00117$
      0099D0                       2089 00116$:
                                   2090 ;	../src/pff.c: 1022: clst = get_fat(fs->curr_clust);
      0099D0 1E 0F            [ 2] 2091 	ldw	x, (0x0f, sp)
      0099D2 90 93            [ 1] 2092 	ldw	y, x
      0099D4 90 EE 02         [ 2] 2093 	ldw	y, (0x2, y)
      0099D7 FE               [ 2] 2094 	ldw	x, (x)
      0099D8 90 89            [ 2] 2095 	pushw	y
      0099DA 89               [ 2] 2096 	pushw	x
      0099DB CD 8E EF         [ 4] 2097 	call	_get_fat
      0099DE 5B 04            [ 2] 2098 	addw	sp, #4
      0099E0 17 18            [ 2] 2099 	ldw	(0x18, sp), y
      0099E2 1F 1A            [ 2] 2100 	ldw	(0x1a, sp), x
      0099E4                       2101 00117$:
                                   2102 ;	../src/pff.c: 1024: if (clst <= 1) ABORT(FR_DISK_ERR);
      0099E4 5F               [ 1] 2103 	clrw	x
      0099E5 5C               [ 1] 2104 	incw	x
      0099E6 13 1A            [ 2] 2105 	cpw	x, (0x1a, sp)
      0099E8 4F               [ 1] 2106 	clr	a
      0099E9 12 19            [ 1] 2107 	sbc	a, (0x19, sp)
      0099EB 4F               [ 1] 2108 	clr	a
      0099EC 12 18            [ 1] 2109 	sbc	a, (0x18, sp)
      0099EE 25 08            [ 1] 2110 	jrc	00119$
      0099F0 1E 0B            [ 2] 2111 	ldw	x, (0x0b, sp)
      0099F2 7F               [ 1] 2112 	clr	(x)
      0099F3 A6 01            [ 1] 2113 	ld	a, #0x01
      0099F5 CC 9B 17         [ 2] 2114 	jp	00139$
      0099F8                       2115 00119$:
                                   2116 ;	../src/pff.c: 1025: fs->curr_clust = clst;				/* Update current cluster */
      0099F8 1E 0F            [ 2] 2117 	ldw	x, (0x0f, sp)
      0099FA 16 1A            [ 2] 2118 	ldw	y, (0x1a, sp)
      0099FC EF 02            [ 2] 2119 	ldw	(0x2, x), y
      0099FE 16 18            [ 2] 2120 	ldw	y, (0x18, sp)
      009A00 FF               [ 2] 2121 	ldw	(x), y
      009A01                       2122 00121$:
                                   2123 ;	../src/pff.c: 1027: sect = clust2sect(fs->curr_clust);		/* Get current sector */
      009A01 1E 0F            [ 2] 2124 	ldw	x, (0x0f, sp)
      009A03 90 93            [ 1] 2125 	ldw	y, x
      009A05 90 EE 02         [ 2] 2126 	ldw	y, (0x2, y)
      009A08 FE               [ 2] 2127 	ldw	x, (x)
      009A09 90 89            [ 2] 2128 	pushw	y
      009A0B 89               [ 2] 2129 	pushw	x
      009A0C CD 8F 96         [ 4] 2130 	call	_clust2sect
      009A0F 5B 04            [ 2] 2131 	addw	sp, #4
      009A11 1F 03            [ 2] 2132 	ldw	(0x03, sp), x
      009A13 17 01            [ 2] 2133 	ldw	(0x01, sp), y
                                   2134 ;	../src/pff.c: 1028: if (!sect) ABORT(FR_DISK_ERR);
      009A15 5D               [ 2] 2135 	tnzw	x
      009A16 26 0C            [ 1] 2136 	jrne	00123$
      009A18 90 5D            [ 2] 2137 	tnzw	y
      009A1A 26 08            [ 1] 2138 	jrne	00123$
      009A1C 1E 0B            [ 2] 2139 	ldw	x, (0x0b, sp)
      009A1E 7F               [ 1] 2140 	clr	(x)
      009A1F A6 01            [ 1] 2141 	ld	a, #0x01
      009A21 CC 9B 17         [ 2] 2142 	jp	00139$
      009A24                       2143 00123$:
                                   2144 ;	../src/pff.c: 1029: fs->dsect = sect + cs;
      009A24 1E 07            [ 2] 2145 	ldw	x, (0x07, sp)
      009A26 1C 00 26         [ 2] 2146 	addw	x, #0x0026
      009A29 90 5F            [ 1] 2147 	clrw	y
      009A2B 7B 1C            [ 1] 2148 	ld	a, (0x1c, sp)
      009A2D 90 97            [ 1] 2149 	ld	yl, a
      009A2F 4F               [ 1] 2150 	clr	a
      009A30 0F 15            [ 1] 2151 	clr	(0x15, sp)
      009A32 72 F9 03         [ 2] 2152 	addw	y, (0x03, sp)
      009A35 19 02            [ 1] 2153 	adc	a, (0x02, sp)
      009A37 6B 1A            [ 1] 2154 	ld	(0x1a, sp), a
      009A39 7B 15            [ 1] 2155 	ld	a, (0x15, sp)
      009A3B 19 01            [ 1] 2156 	adc	a, (0x01, sp)
      009A3D 6B 19            [ 1] 2157 	ld	(0x19, sp), a
      009A3F EF 02            [ 2] 2158 	ldw	(0x2, x), y
      009A41 7B 1A            [ 1] 2159 	ld	a, (0x1a, sp)
      009A43 E7 01            [ 1] 2160 	ld	(0x1, x), a
      009A45 7B 19            [ 1] 2161 	ld	a, (0x19, sp)
      009A47 F7               [ 1] 2162 	ld	(x), a
                                   2163 ;	../src/pff.c: 1030: if (disk_writep(0, fs->dsect)) ABORT(FR_DISK_ERR);	/* Initiate a sector write operation */
      009A48 90 89            [ 2] 2164 	pushw	y
      009A4A 1E 1B            [ 2] 2165 	ldw	x, (0x1b, sp)
      009A4C 89               [ 2] 2166 	pushw	x
      009A4D 5F               [ 1] 2167 	clrw	x
      009A4E 89               [ 2] 2168 	pushw	x
      009A4F CD 83 59         [ 4] 2169 	call	_disk_writep
      009A52 5B 06            [ 2] 2170 	addw	sp, #6
      009A54 4D               [ 1] 2171 	tnz	a
      009A55 27 08            [ 1] 2172 	jreq	00125$
      009A57 1E 0B            [ 2] 2173 	ldw	x, (0x0b, sp)
      009A59 7F               [ 1] 2174 	clr	(x)
      009A5A A6 01            [ 1] 2175 	ld	a, #0x01
      009A5C CC 9B 17         [ 2] 2176 	jp	00139$
      009A5F                       2177 00125$:
                                   2178 ;	../src/pff.c: 1031: fs->flag |= FA__WIP;
      009A5F 1E 0B            [ 2] 2179 	ldw	x, (0x0b, sp)
      009A61 F6               [ 1] 2180 	ld	a, (x)
      009A62 AA 40            [ 1] 2181 	or	a, #0x40
      009A64 1E 0B            [ 2] 2182 	ldw	x, (0x0b, sp)
      009A66 F7               [ 1] 2183 	ld	(x), a
      009A67                       2184 00127$:
                                   2185 ;	../src/pff.c: 1033: wcnt = 512 - (UINT)fs->fptr % 512;			/* Number of bytes to write to the sector */
      009A67 1E 0D            [ 2] 2186 	ldw	x, (0x0d, sp)
      009A69 EE 02            [ 2] 2187 	ldw	x, (0x2, x)
      009A6B 9E               [ 1] 2188 	ld	a, xh
      009A6C A4 01            [ 1] 2189 	and	a, #0x01
      009A6E 6B 1B            [ 1] 2190 	ld	(0x1b, sp), a
      009A70 9F               [ 1] 2191 	ld	a, xl
      009A71 40               [ 1] 2192 	neg	a
      009A72 97               [ 1] 2193 	ld	xl, a
      009A73 A6 02            [ 1] 2194 	ld	a, #0x02
      009A75 12 1B            [ 1] 2195 	sbc	a, (0x1b, sp)
      009A77 95               [ 1] 2196 	ld	xh, a
                                   2197 ;	../src/pff.c: 1034: if (wcnt > btw) wcnt = btw;
      009A78 1F 15            [ 2] 2198 	ldw	(0x15, sp), x
      009A7A 13 21            [ 2] 2199 	cpw	x, (0x21, sp)
      009A7C 23 04            [ 2] 2200 	jrule	00129$
      009A7E 16 21            [ 2] 2201 	ldw	y, (0x21, sp)
      009A80 17 15            [ 2] 2202 	ldw	(0x15, sp), y
      009A82                       2203 00129$:
                                   2204 ;	../src/pff.c: 1035: if (disk_writep(p, wcnt)) ABORT(FR_DISK_ERR);	/* Send data to the sector */
      009A82 16 15            [ 2] 2205 	ldw	y, (0x15, sp)
      009A84 17 03            [ 2] 2206 	ldw	(0x03, sp), y
      009A86 0F 02            [ 1] 2207 	clr	(0x02, sp)
      009A88 0F 01            [ 1] 2208 	clr	(0x01, sp)
      009A8A 1E 03            [ 2] 2209 	ldw	x, (0x03, sp)
      009A8C 89               [ 2] 2210 	pushw	x
      009A8D 1E 03            [ 2] 2211 	ldw	x, (0x03, sp)
      009A8F 89               [ 2] 2212 	pushw	x
      009A90 1E 09            [ 2] 2213 	ldw	x, (0x09, sp)
      009A92 89               [ 2] 2214 	pushw	x
      009A93 CD 83 59         [ 4] 2215 	call	_disk_writep
      009A96 5B 06            [ 2] 2216 	addw	sp, #6
      009A98 4D               [ 1] 2217 	tnz	a
      009A99 27 07            [ 1] 2218 	jreq	00131$
      009A9B 1E 0B            [ 2] 2219 	ldw	x, (0x0b, sp)
      009A9D 7F               [ 1] 2220 	clr	(x)
      009A9E A6 01            [ 1] 2221 	ld	a, #0x01
      009AA0 20 75            [ 2] 2222 	jra	00139$
      009AA2                       2223 00131$:
                                   2224 ;	../src/pff.c: 1036: fs->fptr += wcnt; p += wcnt;				/* Update pointers and counters */
      009AA2 1E 0D            [ 2] 2225 	ldw	x, (0x0d, sp)
      009AA4 90 93            [ 1] 2226 	ldw	y, x
      009AA6 90 EE 02         [ 2] 2227 	ldw	y, (0x2, y)
      009AA9 E6 01            [ 1] 2228 	ld	a, (0x1, x)
      009AAB 88               [ 1] 2229 	push	a
      009AAC F6               [ 1] 2230 	ld	a, (x)
      009AAD 97               [ 1] 2231 	ld	xl, a
      009AAE 84               [ 1] 2232 	pop	a
      009AAF 72 F9 03         [ 2] 2233 	addw	y, (0x03, sp)
      009AB2 17 19            [ 2] 2234 	ldw	(0x19, sp), y
      009AB4 19 02            [ 1] 2235 	adc	a, (0x02, sp)
      009AB6 6B 18            [ 1] 2236 	ld	(0x18, sp), a
      009AB8 9F               [ 1] 2237 	ld	a, xl
      009AB9 19 01            [ 1] 2238 	adc	a, (0x01, sp)
      009ABB 6B 17            [ 1] 2239 	ld	(0x17, sp), a
      009ABD 1E 0D            [ 2] 2240 	ldw	x, (0x0d, sp)
      009ABF 16 19            [ 2] 2241 	ldw	y, (0x19, sp)
      009AC1 EF 02            [ 2] 2242 	ldw	(0x2, x), y
      009AC3 16 17            [ 2] 2243 	ldw	y, (0x17, sp)
      009AC5 FF               [ 2] 2244 	ldw	(x), y
      009AC6 1E 05            [ 2] 2245 	ldw	x, (0x05, sp)
      009AC8 72 FB 15         [ 2] 2246 	addw	x, (0x15, sp)
      009ACB 1F 05            [ 2] 2247 	ldw	(0x05, sp), x
                                   2248 ;	../src/pff.c: 1037: btw -= wcnt; *bw += wcnt;
      009ACD 1E 21            [ 2] 2249 	ldw	x, (0x21, sp)
      009ACF 72 F0 15         [ 2] 2250 	subw	x, (0x15, sp)
      009AD2 1F 21            [ 2] 2251 	ldw	(0x21, sp), x
      009AD4 1E 09            [ 2] 2252 	ldw	x, (0x09, sp)
      009AD6 FE               [ 2] 2253 	ldw	x, (x)
      009AD7 72 FB 15         [ 2] 2254 	addw	x, (0x15, sp)
      009ADA 1F 1B            [ 2] 2255 	ldw	(0x1b, sp), x
      009ADC 1E 09            [ 2] 2256 	ldw	x, (0x09, sp)
      009ADE 16 1B            [ 2] 2257 	ldw	y, (0x1b, sp)
      009AE0 FF               [ 2] 2258 	ldw	(x), y
                                   2259 ;	../src/pff.c: 1038: if ((UINT)fs->fptr % 512 == 0) {
      009AE1 16 19            [ 2] 2260 	ldw	y, (0x19, sp)
      009AE3 17 1B            [ 2] 2261 	ldw	(0x1b, sp), y
      009AE5 7B 1C            [ 1] 2262 	ld	a, (0x1c, sp)
      009AE7 6B 1A            [ 1] 2263 	ld	(0x1a, sp), a
      009AE9 7B 1B            [ 1] 2264 	ld	a, (0x1b, sp)
      009AEB A4 01            [ 1] 2265 	and	a, #0x01
      009AED 6B 19            [ 1] 2266 	ld	(0x19, sp), a
      009AEF 1E 19            [ 2] 2267 	ldw	x, (0x19, sp)
      009AF1 27 03            [ 1] 2268 	jreq	00254$
      009AF3 CC 99 81         [ 2] 2269 	jp	00136$
      009AF6                       2270 00254$:
                                   2271 ;	../src/pff.c: 1039: if (disk_writep(0, 0)) ABORT(FR_DISK_ERR);	/* Finalize the currtent secter write operation */
      009AF6 5F               [ 1] 2272 	clrw	x
      009AF7 89               [ 2] 2273 	pushw	x
      009AF8 5F               [ 1] 2274 	clrw	x
      009AF9 89               [ 2] 2275 	pushw	x
      009AFA 5F               [ 1] 2276 	clrw	x
      009AFB 89               [ 2] 2277 	pushw	x
      009AFC CD 83 59         [ 4] 2278 	call	_disk_writep
      009AFF 5B 06            [ 2] 2279 	addw	sp, #6
      009B01 4D               [ 1] 2280 	tnz	a
      009B02 27 07            [ 1] 2281 	jreq	00133$
      009B04 1E 0B            [ 2] 2282 	ldw	x, (0x0b, sp)
      009B06 7F               [ 1] 2283 	clr	(x)
      009B07 A6 01            [ 1] 2284 	ld	a, #0x01
      009B09 20 0C            [ 2] 2285 	jra	00139$
      009B0B                       2286 00133$:
                                   2287 ;	../src/pff.c: 1040: fs->flag &= ~FA__WIP;
      009B0B 1E 0B            [ 2] 2288 	ldw	x, (0x0b, sp)
      009B0D F6               [ 1] 2289 	ld	a, (x)
      009B0E A4 BF            [ 1] 2290 	and	a, #0xbf
      009B10 1E 0B            [ 2] 2291 	ldw	x, (0x0b, sp)
      009B12 F7               [ 1] 2292 	ld	(x), a
      009B13 CC 99 81         [ 2] 2293 	jp	00136$
      009B16                       2294 00138$:
                                   2295 ;	../src/pff.c: 1044: return FR_OK;
      009B16 4F               [ 1] 2296 	clr	a
      009B17                       2297 00139$:
                                   2298 ;	../src/pff.c: 1045: }
      009B17 5B 1C            [ 2] 2299 	addw	sp, #28
      009B19 81               [ 4] 2300 	ret
                                   2301 	.area CODE
                                   2302 	.area CONST
                                   2303 	.area INITIALIZER
                                   2304 	.area CABS (ABS)
