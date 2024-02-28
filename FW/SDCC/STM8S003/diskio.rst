                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.1.0 #12072 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module diskio
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _SD_ReadByte
                                     12 	.globl _SD_WriteByte
                                     13 	.globl _SD_GetDataResponse
                                     14 	.globl _SD_GetResponse
                                     15 	.globl _SD_SendCmd
                                     16 	.globl _SD_Detect
                                     17 	.globl _SD_Init
                                     18 	.globl _dly
                                     19 	.globl _disk_initialize
                                     20 	.globl _disk_readp
                                     21 	.globl _disk_writep
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
                           000000    26 Ldiskio.disk_writep$byteLeft$1_0$355==.
      00001D                         27 _disk_writep_byteLeft_65536_355:
      00001D                         28 	.ds 4
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area INITIALIZED
                                     33 ;--------------------------------------------------------
                                     34 ; absolute external ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area DABS (ABS)
                                     37 
                                     38 ; default segment ordering for linker
                                     39 	.area HOME
                                     40 	.area GSINIT
                                     41 	.area GSFINAL
                                     42 	.area CONST
                                     43 	.area INITIALIZER
                                     44 	.area CODE
                                     45 
                                     46 ;--------------------------------------------------------
                                     47 ; global & static initialisations
                                     48 ;--------------------------------------------------------
                                     49 	.area HOME
                                     50 	.area GSINIT
                                     51 	.area GSFINAL
                                     52 	.area GSINIT
                           000000    53 	G$disk_writep$0$0 ==.
                           000000    54 	C$diskio.c$95$1_0$355 ==.
                                     55 ;	../src/diskio.c: 95: static uint32_t byteLeft = 512;
                                     56 ; genAssign
      008089 AE 02 00         [ 2]   57 	ldw	x, #0x0200
      00808C CF 00 1F         [ 2]   58 	ldw	_disk_writep_byteLeft_65536_355+2, x
      00808F 5F               [ 1]   59 	clrw	x
      008090 CF 00 1D         [ 2]   60 	ldw	_disk_writep_byteLeft_65536_355+0, x
                                     61 ;--------------------------------------------------------
                                     62 ; Home
                                     63 ;--------------------------------------------------------
                                     64 	.area HOME
                                     65 	.area HOME
                                     66 ;--------------------------------------------------------
                                     67 ; code
                                     68 ;--------------------------------------------------------
                                     69 	.area CODE
                           000000    70 	G$disk_initialize$0$0 ==.
                           000000    71 	C$diskio.c$13$0_0$341 ==.
                                     72 ;	../src/diskio.c: 13: DSTATUS disk_initialize ()
                                     73 ; genLabel
                                     74 ;	-----------------------------------------
                                     75 ;	 function disk_initialize
                                     76 ;	-----------------------------------------
                                     77 ;	Register assignment is optimal.
                                     78 ;	Stack space usage: 0 bytes.
      008626                         79 _disk_initialize:
                           000000    80 	C$diskio.c$16$1_0$341 ==.
                                     81 ;	../src/diskio.c: 16: if(SD_Detect() == SD_NOT_PRESENT)
                                     82 ; genCall
      008626 CD 8E 04         [ 4]   83 	call	_SD_Detect
                                     84 ; genIfx
      008629 4D               [ 1]   85 	tnz	a
      00862A 27 03            [ 1]   86 	jreq	00118$
      00862C CC 86 34         [ 2]   87 	jp	00102$
      00862F                         88 00118$:
                           000009    89 	C$diskio.c$17$1_0$341 ==.
                                     90 ;	../src/diskio.c: 17: return STA_NODISK;
                                     91 ; genReturn
      00862F A6 02            [ 1]   92 	ld	a, #0x02
      008631 CC 86 46         [ 2]   93 	jp	00106$
                                     94 ; genLabel
      008634                         95 00102$:
                           00000E    96 	C$diskio.c$18$1_0$341 ==.
                                     97 ;	../src/diskio.c: 18: if(SD_Init() == SD_RESPONSE_FAILURE){
                                     98 ; genCall
      008634 CD 8D C7         [ 4]   99 	call	_SD_Init
                                    100 ; genCmpEQorNE
      008637 4C               [ 1]  101 	inc	a
      008638 26 03            [ 1]  102 	jrne	00120$
      00863A CC 86 40         [ 2]  103 	jp	00121$
      00863D                        104 00120$:
      00863D CC 86 45         [ 2]  105 	jp	00104$
      008640                        106 00121$:
                                    107 ; skipping generated iCode
                           00001A   108 	C$diskio.c$19$2_0$342 ==.
                                    109 ;	../src/diskio.c: 19: return STA_NOINIT;
                                    110 ; genReturn
      008640 A6 01            [ 1]  111 	ld	a, #0x01
      008642 CC 86 46         [ 2]  112 	jp	00106$
                                    113 ; genLabel
      008645                        114 00104$:
                           00001F   115 	C$diskio.c$21$2_0$343 ==.
                                    116 ;	../src/diskio.c: 21: return 0;
                                    117 ; genReturn
      008645 4F               [ 1]  118 	clr	a
                                    119 ; genLabel
      008646                        120 00106$:
                           000020   121 	C$diskio.c$23$1_0$341 ==.
                                    122 ;	../src/diskio.c: 23: }
                                    123 ; genEndFunction
                           000020   124 	C$diskio.c$23$1_0$341 ==.
                           000020   125 	XG$disk_initialize$0$0 ==.
      008646 81               [ 4]  126 	ret
                           000021   127 	G$disk_readp$0$0 ==.
                           000021   128 	C$diskio.c$31$1_0$345 ==.
                                    129 ;	../src/diskio.c: 31: DRESULT disk_readp (
                                    130 ; genLabel
                                    131 ;	-----------------------------------------
                                    132 ;	 function disk_readp
                                    133 ;	-----------------------------------------
                                    134 ;	Register assignment might be sub-optimal.
                                    135 ;	Stack space usage: 12 bytes.
      008647                        136 _disk_readp:
      008647 52 0C            [ 2]  137 	sub	sp, #12
                           000023   138 	C$diskio.c$38$2_0$345 ==.
                                    139 ;	../src/diskio.c: 38: DRESULT res = RES_ERROR;
                                    140 ; genAssign
      008649 A6 01            [ 1]  141 	ld	a, #0x01
      00864B 6B 0B            [ 1]  142 	ld	(0x0b, sp), a
                           000027   143 	C$diskio.c$41$1_0$345 ==.
                                    144 ;	../src/diskio.c: 41: SD_CS_LOW();
                                    145 ; genPointerGet
      00864D C6 50 0A         [ 1]  146 	ld	a, 0x500a
                                    147 ; genAnd
      008650 A4 EF            [ 1]  148 	and	a, #0xef
                                    149 ; genPointerSet
      008652 C7 50 0A         [ 1]  150 	ld	0x500a, a
                           00002F   151 	C$diskio.c$44$1_0$345 ==.
                                    152 ;	../src/diskio.c: 44: SD_SendCmd(SD_CMD_READ_SINGLE_BLOCK, sector, 0xFF);
                                    153 ; genIPush
      008655 4B FF            [ 1]  154 	push	#0xff
                                    155 ; genIPush
      008657 1E 14            [ 2]  156 	ldw	x, (0x14, sp)
      008659 89               [ 2]  157 	pushw	x
      00865A 1E 14            [ 2]  158 	ldw	x, (0x14, sp)
      00865C 89               [ 2]  159 	pushw	x
                                    160 ; genIPush
      00865D 4B 11            [ 1]  161 	push	#0x11
                                    162 ; genCall
      00865F CD 8E 0E         [ 4]  163 	call	_SD_SendCmd
      008662 5B 06            [ 2]  164 	addw	sp, #6
                           00003E   165 	C$diskio.c$47$1_0$345 ==.
                                    166 ;	../src/diskio.c: 47: if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
                                    167 ; genIPush
      008664 4B 00            [ 1]  168 	push	#0x00
                                    169 ; genCall
      008666 CD 8E EB         [ 4]  170 	call	_SD_GetResponse
      008669 5B 01            [ 2]  171 	addw	sp, #1
      00866B 6B 0C            [ 1]  172 	ld	(0x0c, sp), a
                                    173 ; genIfx
      00866D 0D 0C            [ 1]  174 	tnz	(0x0c, sp)
      00866F 27 03            [ 1]  175 	jreq	00162$
      008671 CC 87 23         [ 2]  176 	jp	00107$
      008674                        177 00162$:
                           00004E   178 	C$diskio.c$50$2_0$346 ==.
                                    179 ;	../src/diskio.c: 50: if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
                                    180 ; genIPush
      008674 4B FE            [ 1]  181 	push	#0xfe
                                    182 ; genCall
      008676 CD 8E EB         [ 4]  183 	call	_SD_GetResponse
      008679 5B 01            [ 2]  184 	addw	sp, #1
                                    185 ; genIfx
      00867B 4D               [ 1]  186 	tnz	a
      00867C 27 03            [ 1]  187 	jreq	00163$
      00867E CC 87 23         [ 2]  188 	jp	00107$
      008681                        189 00163$:
                           00005B   190 	C$diskio.c$53$4_0$348 ==.
                                    191 ;	../src/diskio.c: 53: for(i = 0; i < offset; i++){
                                    192 ; genAssign
      008681 5F               [ 1]  193 	clrw	x
      008682 90 5F            [ 1]  194 	clrw	y
                                    195 ; genAssign
      008684 1F 0B            [ 2]  196 	ldw	(0x0b, sp), x
      008686 17 09            [ 2]  197 	ldw	(0x09, sp), y
                                    198 ; genLabel
      008688                        199 00109$:
                                    200 ; genCast
                                    201 ; genAssign
      008688 16 15            [ 2]  202 	ldw	y, (0x15, sp)
      00868A 17 07            [ 2]  203 	ldw	(0x07, sp), y
      00868C 0F 06            [ 1]  204 	clr	(0x06, sp)
      00868E 0F 05            [ 1]  205 	clr	(0x05, sp)
                                    206 ; genCmp
                                    207 ; genCmpTop
      008690 1E 0B            [ 2]  208 	ldw	x, (0x0b, sp)
      008692 13 07            [ 2]  209 	cpw	x, (0x07, sp)
      008694 7B 0A            [ 1]  210 	ld	a, (0x0a, sp)
      008696 12 06            [ 1]  211 	sbc	a, (0x06, sp)
      008698 7B 09            [ 1]  212 	ld	a, (0x09, sp)
      00869A 12 05            [ 1]  213 	sbc	a, (0x05, sp)
      00869C 25 03            [ 1]  214 	jrc	00164$
      00869E CC 86 B3         [ 2]  215 	jp	00127$
      0086A1                        216 00164$:
                                    217 ; skipping generated iCode
                           00007B   218 	C$diskio.c$54$5_0$349 ==.
                                    219 ;	../src/diskio.c: 54: SD_ReadByte();
                                    220 ; genCall
      0086A1 CD 90 E5         [ 4]  221 	call	_SD_ReadByte
                           00007E   222 	C$diskio.c$53$4_0$348 ==.
                                    223 ;	../src/diskio.c: 53: for(i = 0; i < offset; i++){
                                    224 ; genPlus
      0086A4 1E 0B            [ 2]  225 	ldw	x, (0x0b, sp)
      0086A6 5C               [ 1]  226 	incw	x
      0086A7 1F 0B            [ 2]  227 	ldw	(0x0b, sp), x
      0086A9 26 05            [ 1]  228 	jrne	00165$
      0086AB 1E 09            [ 2]  229 	ldw	x, (0x09, sp)
      0086AD 5C               [ 1]  230 	incw	x
      0086AE 1F 09            [ 2]  231 	ldw	(0x09, sp), x
      0086B0                        232 00165$:
                                    233 ; genGoto
      0086B0 CC 86 88         [ 2]  234 	jp	00109$
                                    235 ; genLabel
      0086B3                        236 00127$:
                                    237 ; genAssign
      0086B3 1E 0B            [ 2]  238 	ldw	x, (0x0b, sp)
                                    239 ; genPlus
      0086B5 16 15            [ 2]  240 	ldw	y, (0x15, sp)
      0086B7 72 F9 17         [ 2]  241 	addw	y, (0x17, sp)
      0086BA 17 01            [ 2]  242 	ldw	(0x01, sp), y
                                    243 ; genAssign
      0086BC 16 0F            [ 2]  244 	ldw	y, (0x0f, sp)
      0086BE 17 07            [ 2]  245 	ldw	(0x07, sp), y
                                    246 ; genAssign
      0086C0 1F 0B            [ 2]  247 	ldw	(0x0b, sp), x
      0086C2 16 09            [ 2]  248 	ldw	y, (0x09, sp)
                                    249 ; genLabel
      0086C4                        250 00112$:
                           00009E   251 	C$diskio.c$56$4_0$350 ==.
                                    252 ;	../src/diskio.c: 56: for (; i < offset+count; i++)
                                    253 ; genCast
                                    254 ; genAssign
      0086C4 1E 01            [ 2]  255 	ldw	x, (0x01, sp)
      0086C6 1F 05            [ 2]  256 	ldw	(0x05, sp), x
      0086C8 0F 04            [ 1]  257 	clr	(0x04, sp)
      0086CA 0F 03            [ 1]  258 	clr	(0x03, sp)
                                    259 ; genCmp
                                    260 ; genCmpTop
      0086CC 1E 0B            [ 2]  261 	ldw	x, (0x0b, sp)
      0086CE 13 05            [ 2]  262 	cpw	x, (0x05, sp)
      0086D0 90 9F            [ 1]  263 	ld	a, yl
      0086D2 12 04            [ 1]  264 	sbc	a, (0x04, sp)
      0086D4 90 9E            [ 1]  265 	ld	a, yh
      0086D6 12 03            [ 1]  266 	sbc	a, (0x03, sp)
      0086D8 25 03            [ 1]  267 	jrc	00166$
      0086DA CC 86 F8         [ 2]  268 	jp	00128$
      0086DD                        269 00166$:
                                    270 ; skipping generated iCode
                           0000B7   271 	C$diskio.c$59$5_0$351 ==.
                                    272 ;	../src/diskio.c: 59: *buff = SD_ReadByte();
                                    273 ; genCall
      0086DD 90 89            [ 2]  274 	pushw	y
      0086DF CD 90 E5         [ 4]  275 	call	_SD_ReadByte
      0086E2 90 85            [ 2]  276 	popw	y
                                    277 ; genPointerSet
      0086E4 1E 07            [ 2]  278 	ldw	x, (0x07, sp)
      0086E6 F7               [ 1]  279 	ld	(x), a
                           0000C1   280 	C$diskio.c$62$5_0$351 ==.
                                    281 ;	../src/diskio.c: 62: buff++;
                                    282 ; genPlus
      0086E7 1E 07            [ 2]  283 	ldw	x, (0x07, sp)
      0086E9 5C               [ 1]  284 	incw	x
      0086EA 1F 07            [ 2]  285 	ldw	(0x07, sp), x
      0086EC                        286 00167$:
                           0000C6   287 	C$diskio.c$56$4_0$350 ==.
                                    288 ;	../src/diskio.c: 56: for (; i < offset+count; i++)
                                    289 ; genPlus
      0086EC 1E 0B            [ 2]  290 	ldw	x, (0x0b, sp)
      0086EE 5C               [ 1]  291 	incw	x
      0086EF 1F 0B            [ 2]  292 	ldw	(0x0b, sp), x
      0086F1 26 02            [ 1]  293 	jrne	00168$
      0086F3 90 5C            [ 1]  294 	incw	y
      0086F5                        295 00168$:
                                    296 ; genGoto
      0086F5 CC 86 C4         [ 2]  297 	jp	00112$
                                    298 ; genLabel
      0086F8                        299 00128$:
                                    300 ; genAssign
      0086F8 1E 0B            [ 2]  301 	ldw	x, (0x0b, sp)
                                    302 ; genAssign
                                    303 ; genLabel
      0086FA                        304 00115$:
                           0000D4   305 	C$diskio.c$64$4_0$352 ==.
                                    306 ;	../src/diskio.c: 64: for(;i < 512; i++){
                                    307 ; genCmp
                                    308 ; genCmpTop
      0086FA A3 02 00         [ 2]  309 	cpw	x, #0x0200
      0086FD 90 9F            [ 1]  310 	ld	a, yl
      0086FF A2 00            [ 1]  311 	sbc	a, #0x00
      008701 90 9E            [ 1]  312 	ld	a, yh
      008703 A2 00            [ 1]  313 	sbc	a, #0x00
      008705 25 03            [ 1]  314 	jrc	00169$
      008707 CC 87 1B         [ 2]  315 	jp	00103$
      00870A                        316 00169$:
                                    317 ; skipping generated iCode
                           0000E4   318 	C$diskio.c$65$5_0$353 ==.
                                    319 ;	../src/diskio.c: 65: SD_ReadByte();
                                    320 ; genCall
      00870A 89               [ 2]  321 	pushw	x
      00870B 90 89            [ 2]  322 	pushw	y
      00870D CD 90 E5         [ 4]  323 	call	_SD_ReadByte
      008710 90 85            [ 2]  324 	popw	y
      008712 85               [ 2]  325 	popw	x
                           0000ED   326 	C$diskio.c$64$4_0$352 ==.
                                    327 ;	../src/diskio.c: 64: for(;i < 512; i++){
                                    328 ; genPlus
      008713 5C               [ 1]  329 	incw	x
      008714 26 02            [ 1]  330 	jrne	00170$
      008716 90 5C            [ 1]  331 	incw	y
      008718                        332 00170$:
                                    333 ; genGoto
      008718 CC 86 FA         [ 2]  334 	jp	00115$
                                    335 ; genLabel
      00871B                        336 00103$:
                           0000F5   337 	C$diskio.c$68$3_0$347 ==.
                                    338 ;	../src/diskio.c: 68: SD_ReadByte();
                                    339 ; genCall
      00871B CD 90 E5         [ 4]  340 	call	_SD_ReadByte
                           0000F8   341 	C$diskio.c$69$3_0$347 ==.
                                    342 ;	../src/diskio.c: 69: SD_ReadByte();
                                    343 ; genCall
      00871E CD 90 E5         [ 4]  344 	call	_SD_ReadByte
                           0000FB   345 	C$diskio.c$71$3_0$347 ==.
                                    346 ;	../src/diskio.c: 71: res = RES_OK;
                                    347 ; genAssign
      008721 0F 0B            [ 1]  348 	clr	(0x0b, sp)
                                    349 ; genLabel
      008723                        350 00107$:
                           0000FD   351 	C$diskio.c$75$1_0$345 ==.
                                    352 ;	../src/diskio.c: 75: SD_CS_HIGH();
                                    353 ; genPointerGet
      008723 C6 50 0A         [ 1]  354 	ld	a, 0x500a
                                    355 ; genOr
      008726 AA 10            [ 1]  356 	or	a, #0x10
                                    357 ; genPointerSet
      008728 C7 50 0A         [ 1]  358 	ld	0x500a, a
                           000105   359 	C$diskio.c$78$1_0$345 ==.
                                    360 ;	../src/diskio.c: 78: SD_WriteByte(SD_DUMMY_BYTE);
                                    361 ; genIPush
      00872B 4B FF            [ 1]  362 	push	#0xff
                                    363 ; genCall
      00872D CD 90 D5         [ 4]  364 	call	_SD_WriteByte
      008730 84               [ 1]  365 	pop	a
                           00010B   366 	C$diskio.c$81$1_0$345 ==.
                                    367 ;	../src/diskio.c: 81: return res;
                                    368 ; genReturn
      008731 7B 0B            [ 1]  369 	ld	a, (0x0b, sp)
                                    370 ; genLabel
      008733                        371 00117$:
                           00010D   372 	C$diskio.c$82$1_0$345 ==.
                                    373 ;	../src/diskio.c: 82: }
                                    374 ; genEndFunction
      008733 5B 0C            [ 2]  375 	addw	sp, #12
                           00010F   376 	C$diskio.c$82$1_0$345 ==.
                           00010F   377 	XG$disk_readp$0$0 ==.
      008735 81               [ 4]  378 	ret
                           000110   379 	G$disk_writep$0$0 ==.
                           000110   380 	C$diskio.c$90$1_0$355 ==.
                                    381 ;	../src/diskio.c: 90: DRESULT disk_writep (
                                    382 ; genLabel
                                    383 ;	-----------------------------------------
                                    384 ;	 function disk_writep
                                    385 ;	-----------------------------------------
                                    386 ;	Register assignment might be sub-optimal.
                                    387 ;	Stack space usage: 6 bytes.
      008736                        388 _disk_writep:
      008736 52 06            [ 2]  389 	sub	sp, #6
                           000112   390 	C$diskio.c$97$2_0$355 ==.
                                    391 ;	../src/diskio.c: 97: DRESULT res = RES_ERROR;
                                    392 ; genAssign
      008738 A6 01            [ 1]  393 	ld	a, #0x01
      00873A 6B 02            [ 1]  394 	ld	(0x02, sp), a
                           000116   395 	C$diskio.c$99$1_0$355 ==.
                                    396 ;	../src/diskio.c: 99: if (!buff) {
                                    397 ; genIfx
      00873C 1E 09            [ 2]  398 	ldw	x, (0x09, sp)
      00873E 27 03            [ 1]  399 	jreq	00193$
      008740 CC 88 3C         [ 2]  400 	jp	00139$
      008743                        401 00193$:
                           00011D   402 	C$diskio.c$100$2_0$356 ==.
                                    403 ;	../src/diskio.c: 100: if (sc) {
                                    404 ; genIfx
      008743 1E 0D            [ 2]  405 	ldw	x, (0x0d, sp)
      008745 26 07            [ 1]  406 	jrne	00194$
      008747 1E 0B            [ 2]  407 	ldw	x, (0x0b, sp)
      008749 26 03            [ 1]  408 	jrne	00194$
      00874B CC 87 8D         [ 2]  409 	jp	00103$
      00874E                        410 00194$:
                           000128   411 	C$diskio.c$102$3_0$357 ==.
                                    412 ;	../src/diskio.c: 102: SD_CS_LOW();
                                    413 ; genPointerGet
      00874E C6 50 0A         [ 1]  414 	ld	a, 0x500a
                                    415 ; genAnd
      008751 A4 EF            [ 1]  416 	and	a, #0xef
                                    417 ; genPointerSet
      008753 C7 50 0A         [ 1]  418 	ld	0x500a, a
                           000130   419 	C$diskio.c$104$3_0$357 ==.
                                    420 ;	../src/diskio.c: 104: SD_SendCmd(SD_CMD_WRITE_SINGLE_BLOCK, sc, 0xFF);
                                    421 ; genIPush
      008756 4B FF            [ 1]  422 	push	#0xff
                                    423 ; genIPush
      008758 1E 0E            [ 2]  424 	ldw	x, (0x0e, sp)
      00875A 89               [ 2]  425 	pushw	x
      00875B 1E 0E            [ 2]  426 	ldw	x, (0x0e, sp)
      00875D 89               [ 2]  427 	pushw	x
                                    428 ; genIPush
      00875E 4B 18            [ 1]  429 	push	#0x18
                                    430 ; genCall
      008760 CD 8E 0E         [ 4]  431 	call	_SD_SendCmd
      008763 5B 06            [ 2]  432 	addw	sp, #6
                           00013F   433 	C$diskio.c$107$3_0$357 ==.
                                    434 ;	../src/diskio.c: 107: if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
                                    435 ; genIPush
      008765 4B 00            [ 1]  436 	push	#0x00
                                    437 ; genCall
      008767 CD 8E EB         [ 4]  438 	call	_SD_GetResponse
      00876A 5B 01            [ 2]  439 	addw	sp, #1
                                    440 ; genIfx
      00876C 4D               [ 1]  441 	tnz	a
      00876D 27 03            [ 1]  442 	jreq	00195$
      00876F CC 88 95         [ 2]  443 	jp	00120$
      008772                        444 00195$:
                           00014C   445 	C$diskio.c$110$4_0$358 ==.
                                    446 ;	../src/diskio.c: 110: SD_WriteByte(SD_DUMMY_BYTE);
                                    447 ; genIPush
      008772 4B FF            [ 1]  448 	push	#0xff
                                    449 ; genCall
      008774 CD 90 D5         [ 4]  450 	call	_SD_WriteByte
      008777 84               [ 1]  451 	pop	a
                           000152   452 	C$diskio.c$112$4_0$358 ==.
                                    453 ;	../src/diskio.c: 112: SD_WriteByte(0xFE);
                                    454 ; genIPush
      008778 4B FE            [ 1]  455 	push	#0xfe
                                    456 ; genCall
      00877A CD 90 D5         [ 4]  457 	call	_SD_WriteByte
      00877D 84               [ 1]  458 	pop	a
                           000158   459 	C$diskio.c$113$4_0$358 ==.
                                    460 ;	../src/diskio.c: 113: byteLeft = 512;
                                    461 ; genAssign
      00877E AE 02 00         [ 2]  462 	ldw	x, #0x0200
      008781 CF 00 1F         [ 2]  463 	ldw	_disk_writep_byteLeft_65536_355+2, x
      008784 5F               [ 1]  464 	clrw	x
      008785 CF 00 1D         [ 2]  465 	ldw	_disk_writep_byteLeft_65536_355+0, x
                           000162   466 	C$diskio.c$114$4_0$358 ==.
                                    467 ;	../src/diskio.c: 114: res =  RES_OK;
                                    468 ; genAssign
      008788 0F 02            [ 1]  469 	clr	(0x02, sp)
                                    470 ; genGoto
      00878A CC 88 95         [ 2]  471 	jp	00120$
                           000167   472 	C$diskio.c$118$3_0$359 ==.
                                    473 ;	../src/diskio.c: 118: while((byteLeft--)) {
                                    474 ; genLabel
      00878D                        475 00103$:
                                    476 ; genAssign
      00878D CE 00 1F         [ 2]  477 	ldw	x, _disk_writep_byteLeft_65536_355+2
      008790 1F 05            [ 2]  478 	ldw	(0x05, sp), x
      008792 CE 00 1D         [ 2]  479 	ldw	x, _disk_writep_byteLeft_65536_355+0
      008795 1F 03            [ 2]  480 	ldw	(0x03, sp), x
                                    481 ; genMinus
      008797 CE 00 1F         [ 2]  482 	ldw	x, _disk_writep_byteLeft_65536_355+2
      00879A 1D 00 01         [ 2]  483 	subw	x, #0x0001
      00879D 90 CE 00 1D      [ 2]  484 	ldw	y, _disk_writep_byteLeft_65536_355+0
      0087A1 24 02            [ 1]  485 	jrnc	00196$
      0087A3 90 5A            [ 2]  486 	decw	y
      0087A5                        487 00196$:
                                    488 ; genAssign
      0087A5 CF 00 1F         [ 2]  489 	ldw	_disk_writep_byteLeft_65536_355+2, x
      0087A8 90 CF 00 1D      [ 2]  490 	ldw	_disk_writep_byteLeft_65536_355+0, y
                                    491 ; genIfx
      0087AC 1E 05            [ 2]  492 	ldw	x, (0x05, sp)
      0087AE 26 07            [ 1]  493 	jrne	00197$
      0087B0 1E 03            [ 2]  494 	ldw	x, (0x03, sp)
      0087B2 26 03            [ 1]  495 	jrne	00197$
      0087B4 CC 87 C0         [ 2]  496 	jp	00105$
      0087B7                        497 00197$:
                           000191   498 	C$diskio.c$119$4_0$360 ==.
                                    499 ;	../src/diskio.c: 119: SD_WriteByte(0);
                                    500 ; genIPush
      0087B7 4B 00            [ 1]  501 	push	#0x00
                                    502 ; genCall
      0087B9 CD 90 D5         [ 4]  503 	call	_SD_WriteByte
      0087BC 84               [ 1]  504 	pop	a
                                    505 ; genGoto
      0087BD CC 87 8D         [ 2]  506 	jp	00103$
                                    507 ; genLabel
      0087C0                        508 00105$:
                           00019A   509 	C$diskio.c$122$3_0$359 ==.
                                    510 ;	../src/diskio.c: 122: SD_WriteByte(0);
                                    511 ; genIPush
      0087C0 4B 00            [ 1]  512 	push	#0x00
                                    513 ; genCall
      0087C2 CD 90 D5         [ 4]  514 	call	_SD_WriteByte
      0087C5 84               [ 1]  515 	pop	a
                           0001A0   516 	C$diskio.c$123$3_0$359 ==.
                                    517 ;	../src/diskio.c: 123: SD_WriteByte(0);
                                    518 ; genIPush
      0087C6 4B 00            [ 1]  519 	push	#0x00
                                    520 ; genCall
      0087C8 CD 90 D5         [ 4]  521 	call	_SD_WriteByte
      0087CB 84               [ 1]  522 	pop	a
                           0001A6   523 	C$diskio.c$126$3_0$359 ==.
                                    524 ;	../src/diskio.c: 126: if (SD_GetDataResponse() == SD_DATA_OK){
                                    525 ; genCall
      0087CC CD 8E 76         [ 4]  526 	call	_SD_GetDataResponse
                                    527 ; genCmpEQorNE
      0087CF A1 05            [ 1]  528 	cp	a, #0x05
      0087D1 26 03            [ 1]  529 	jrne	00199$
      0087D3 CC 87 D9         [ 2]  530 	jp	00200$
      0087D6                        531 00199$:
      0087D6 CC 88 2B         [ 2]  532 	jp	00110$
      0087D9                        533 00200$:
                                    534 ; skipping generated iCode
                           0001B3   535 	C$diskio.c$127$5_0$362 ==.
                                    536 ;	../src/diskio.c: 127: for (byteLeft = 5000;
                                    537 ; genAssign
      0087D9 AE 13 88         [ 2]  538 	ldw	x, #0x1388
      0087DC CF 00 1F         [ 2]  539 	ldw	_disk_writep_byteLeft_65536_355+2, x
      0087DF 5F               [ 1]  540 	clrw	x
      0087E0 CF 00 1D         [ 2]  541 	ldw	_disk_writep_byteLeft_65536_355+0, x
                                    542 ; genLabel
      0087E3                        543 00123$:
                           0001BD   544 	C$diskio.c$128$5_0$362 ==.
                                    545 ;	../src/diskio.c: 128: (SD_ReadByte() != 0xFF) && byteLeft;
                                    546 ; genCall
      0087E3 CD 90 E5         [ 4]  547 	call	_SD_ReadByte
                                    548 ; genCmpEQorNE
      0087E6 4C               [ 1]  549 	inc	a
      0087E7 26 03            [ 1]  550 	jrne	00202$
      0087E9 CC 88 1C         [ 2]  551 	jp	00106$
      0087EC                        552 00202$:
                                    553 ; skipping generated iCode
                                    554 ; genIfx
      0087EC CE 00 1F         [ 2]  555 	ldw	x, _disk_writep_byteLeft_65536_355+2
      0087EF 26 08            [ 1]  556 	jrne	00204$
      0087F1 CE 00 1D         [ 2]  557 	ldw	x, _disk_writep_byteLeft_65536_355+0
      0087F4 26 03            [ 1]  558 	jrne	00204$
      0087F6 CC 88 1C         [ 2]  559 	jp	00106$
      0087F9                        560 00204$:
                           0001D3   561 	C$diskio.c$130$6_0$363 ==.
                                    562 ;	../src/diskio.c: 130: dly(1);
                                    563 ; genIPush
      0087F9 4B 01            [ 1]  564 	push	#0x01
      0087FB 5F               [ 1]  565 	clrw	x
      0087FC 89               [ 2]  566 	pushw	x
      0087FD 4B 00            [ 1]  567 	push	#0x00
                                    568 ; genCall
      0087FF CD 88 BE         [ 4]  569 	call	_dly
      008802 5B 04            [ 2]  570 	addw	sp, #4
                           0001DE   571 	C$diskio.c$129$5_0$362 ==.
                                    572 ;	../src/diskio.c: 129: byteLeft--) {	/* Wait for ready */
                                    573 ; genMinus
      008804 CE 00 1F         [ 2]  574 	ldw	x, _disk_writep_byteLeft_65536_355+2
      008807 1D 00 01         [ 2]  575 	subw	x, #0x0001
      00880A 90 CE 00 1D      [ 2]  576 	ldw	y, _disk_writep_byteLeft_65536_355+0
      00880E 24 02            [ 1]  577 	jrnc	00205$
      008810 90 5A            [ 2]  578 	decw	y
      008812                        579 00205$:
                                    580 ; genAssign
      008812 CF 00 1F         [ 2]  581 	ldw	_disk_writep_byteLeft_65536_355+2, x
      008815 90 CF 00 1D      [ 2]  582 	ldw	_disk_writep_byteLeft_65536_355+0, y
                                    583 ; genGoto
      008819 CC 87 E3         [ 2]  584 	jp	00123$
                                    585 ; genLabel
      00881C                        586 00106$:
                           0001F6   587 	C$diskio.c$132$4_0$361 ==.
                                    588 ;	../src/diskio.c: 132: if(byteLeft) res = RES_OK;
                                    589 ; genIfx
      00881C CE 00 1F         [ 2]  590 	ldw	x, _disk_writep_byteLeft_65536_355+2
      00881F 26 08            [ 1]  591 	jrne	00206$
      008821 CE 00 1D         [ 2]  592 	ldw	x, _disk_writep_byteLeft_65536_355+0
      008824 26 03            [ 1]  593 	jrne	00206$
      008826 CC 88 2B         [ 2]  594 	jp	00110$
      008829                        595 00206$:
                                    596 ; genAssign
      008829 0F 02            [ 1]  597 	clr	(0x02, sp)
                                    598 ; genLabel
      00882B                        599 00110$:
                           000205   600 	C$diskio.c$136$3_0$359 ==.
                                    601 ;	../src/diskio.c: 136: SD_CS_HIGH();
                                    602 ; genPointerGet
      00882B C6 50 0A         [ 1]  603 	ld	a, 0x500a
                                    604 ; genOr
      00882E AA 10            [ 1]  605 	or	a, #0x10
                                    606 ; genPointerSet
      008830 C7 50 0A         [ 1]  607 	ld	0x500a, a
                           00020D   608 	C$diskio.c$138$3_0$359 ==.
                                    609 ;	../src/diskio.c: 138: SD_WriteByte(SD_DUMMY_BYTE);
                                    610 ; genIPush
      008833 4B FF            [ 1]  611 	push	#0xff
                                    612 ; genCall
      008835 CD 90 D5         [ 4]  613 	call	_SD_WriteByte
      008838 84               [ 1]  614 	pop	a
                                    615 ; genGoto
      008839 CC 88 95         [ 2]  616 	jp	00120$
                           000216   617 	C$diskio.c$143$1_0$355 ==.
                                    618 ;	../src/diskio.c: 143: while((byteLeft)&&(sc))
                                    619 ; genLabel
      00883C                        620 00139$:
                                    621 ; genAssign
      00883C 16 09            [ 2]  622 	ldw	y, (0x09, sp)
      00883E 17 01            [ 2]  623 	ldw	(0x01, sp), y
                                    624 ; genAssign
      008840 16 0D            [ 2]  625 	ldw	y, (0x0d, sp)
      008842 17 05            [ 2]  626 	ldw	(0x05, sp), y
      008844 16 0B            [ 2]  627 	ldw	y, (0x0b, sp)
      008846 17 03            [ 2]  628 	ldw	(0x03, sp), y
                                    629 ; genLabel
      008848                        630 00115$:
                                    631 ; genIfx
      008848 CE 00 1F         [ 2]  632 	ldw	x, _disk_writep_byteLeft_65536_355+2
      00884B 26 08            [ 1]  633 	jrne	00207$
      00884D CE 00 1D         [ 2]  634 	ldw	x, _disk_writep_byteLeft_65536_355+0
      008850 26 03            [ 1]  635 	jrne	00207$
      008852 CC 88 93         [ 2]  636 	jp	00117$
      008855                        637 00207$:
                                    638 ; genIfx
      008855 1E 05            [ 2]  639 	ldw	x, (0x05, sp)
      008857 26 07            [ 1]  640 	jrne	00208$
      008859 1E 03            [ 2]  641 	ldw	x, (0x03, sp)
      00885B 26 03            [ 1]  642 	jrne	00208$
      00885D CC 88 93         [ 2]  643 	jp	00117$
      008860                        644 00208$:
                           00023A   645 	C$diskio.c$146$3_0$365 ==.
                                    646 ;	../src/diskio.c: 146: SD_WriteByte(*buff);
                                    647 ; genPointerGet
      008860 1E 01            [ 2]  648 	ldw	x, (0x01, sp)
      008862 F6               [ 1]  649 	ld	a, (x)
                                    650 ; genIPush
      008863 88               [ 1]  651 	push	a
                                    652 ; genCall
      008864 CD 90 D5         [ 4]  653 	call	_SD_WriteByte
      008867 84               [ 1]  654 	pop	a
                           000242   655 	C$diskio.c$148$3_0$365 ==.
                                    656 ;	../src/diskio.c: 148: buff++;byteLeft--;sc--;
                                    657 ; genPlus
      008868 1E 01            [ 2]  658 	ldw	x, (0x01, sp)
      00886A 5C               [ 1]  659 	incw	x
      00886B 1F 01            [ 2]  660 	ldw	(0x01, sp), x
      00886D                        661 00209$:
                                    662 ; genMinus
      00886D CE 00 1F         [ 2]  663 	ldw	x, _disk_writep_byteLeft_65536_355+2
      008870 1D 00 01         [ 2]  664 	subw	x, #0x0001
      008873 90 CE 00 1D      [ 2]  665 	ldw	y, _disk_writep_byteLeft_65536_355+0
      008877 24 02            [ 1]  666 	jrnc	00210$
      008879 90 5A            [ 2]  667 	decw	y
      00887B                        668 00210$:
                                    669 ; genAssign
      00887B CF 00 1F         [ 2]  670 	ldw	_disk_writep_byteLeft_65536_355+2, x
      00887E 90 CF 00 1D      [ 2]  671 	ldw	_disk_writep_byteLeft_65536_355+0, y
                                    672 ; genMinus
      008882 1E 05            [ 2]  673 	ldw	x, (0x05, sp)
      008884 1D 00 01         [ 2]  674 	subw	x, #0x0001
      008887 1F 05            [ 2]  675 	ldw	(0x05, sp), x
      008889 1E 03            [ 2]  676 	ldw	x, (0x03, sp)
      00888B 24 01            [ 1]  677 	jrnc	00211$
      00888D 5A               [ 2]  678 	decw	x
      00888E                        679 00211$:
      00888E 1F 03            [ 2]  680 	ldw	(0x03, sp), x
                                    681 ; genGoto
      008890 CC 88 48         [ 2]  682 	jp	00115$
                                    683 ; genLabel
      008893                        684 00117$:
                           00026D   685 	C$diskio.c$150$2_0$364 ==.
                                    686 ;	../src/diskio.c: 150: res = RES_OK;
                                    687 ; genAssign
      008893 0F 02            [ 1]  688 	clr	(0x02, sp)
                                    689 ; genLabel
      008895                        690 00120$:
                           00026F   691 	C$diskio.c$153$1_0$355 ==.
                                    692 ;	../src/diskio.c: 153: return res;
                                    693 ; genReturn
      008895 7B 02            [ 1]  694 	ld	a, (0x02, sp)
                                    695 ; genLabel
      008897                        696 00125$:
                           000271   697 	C$diskio.c$154$1_0$355 ==.
                                    698 ;	../src/diskio.c: 154: }
                                    699 ; genEndFunction
      008897 5B 06            [ 2]  700 	addw	sp, #6
                           000273   701 	C$diskio.c$154$1_0$355 ==.
                           000273   702 	XG$disk_writep$0$0 ==.
      008899 81               [ 4]  703 	ret
                                    704 	.area CODE
                                    705 	.area CONST
                                    706 	.area INITIALIZER
                                    707 	.area CABS (ABS)
