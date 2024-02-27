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
      000209                         26 _disk_writep_byteLeft_65536_355:
      000209                         27 	.ds 4
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area INITIALIZED
                                     32 ;--------------------------------------------------------
                                     33 ; absolute external ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DABS (ABS)
                                     36 
                                     37 ; default segment ordering for linker
                                     38 	.area HOME
                                     39 	.area GSINIT
                                     40 	.area GSFINAL
                                     41 	.area CONST
                                     42 	.area INITIALIZER
                                     43 	.area CODE
                                     44 
                                     45 ;--------------------------------------------------------
                                     46 ; global & static initialisations
                                     47 ;--------------------------------------------------------
                                     48 	.area HOME
                                     49 	.area GSINIT
                                     50 	.area GSFINAL
                                     51 	.area GSINIT
                                     52 ;	../src/diskio.c: 95: static uint32_t byteLeft = 512;
      008073 AE 02 00         [ 2]   53 	ldw	x, #0x0200
      008076 CF 02 0B         [ 2]   54 	ldw	_disk_writep_byteLeft_65536_355+2, x
      008079 5F               [ 1]   55 	clrw	x
      00807A CF 02 09         [ 2]   56 	ldw	_disk_writep_byteLeft_65536_355+0, x
                                     57 ;--------------------------------------------------------
                                     58 ; Home
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
                                     61 	.area HOME
                                     62 ;--------------------------------------------------------
                                     63 ; code
                                     64 ;--------------------------------------------------------
                                     65 	.area CODE
                                     66 ;	../src/diskio.c: 13: DSTATUS disk_initialize ()
                                     67 ;	-----------------------------------------
                                     68 ;	 function disk_initialize
                                     69 ;	-----------------------------------------
      008270                         70 _disk_initialize:
                                     71 ;	../src/diskio.c: 16: if(SD_Detect() == SD_NOT_PRESENT)
      008270 CD 8B 1F         [ 4]   72 	call	_SD_Detect
      008273 4D               [ 1]   73 	tnz	a
      008274 26 03            [ 1]   74 	jrne	00102$
                                     75 ;	../src/diskio.c: 17: return STA_NODISK;
      008276 A6 02            [ 1]   76 	ld	a, #0x02
      008278 81               [ 4]   77 	ret
      008279                         78 00102$:
                                     79 ;	../src/diskio.c: 18: if(SD_Init() == SD_RESPONSE_FAILURE){
      008279 CD 8A EB         [ 4]   80 	call	_SD_Init
      00827C 4C               [ 1]   81 	inc	a
      00827D 26 03            [ 1]   82 	jrne	00104$
                                     83 ;	../src/diskio.c: 19: return STA_NOINIT;
      00827F A6 01            [ 1]   84 	ld	a, #0x01
      008281 81               [ 4]   85 	ret
      008282                         86 00104$:
                                     87 ;	../src/diskio.c: 21: return 0;
      008282 4F               [ 1]   88 	clr	a
                                     89 ;	../src/diskio.c: 23: }
      008283 81               [ 4]   90 	ret
                                     91 ;	../src/diskio.c: 31: DRESULT disk_readp (
                                     92 ;	-----------------------------------------
                                     93 ;	 function disk_readp
                                     94 ;	-----------------------------------------
      008284                         95 _disk_readp:
      008284 52 0C            [ 2]   96 	sub	sp, #12
                                     97 ;	../src/diskio.c: 38: DRESULT res = RES_ERROR;
      008286 A6 01            [ 1]   98 	ld	a, #0x01
      008288 6B 0B            [ 1]   99 	ld	(0x0b, sp), a
                                    100 ;	../src/diskio.c: 41: SD_CS_LOW();
      00828A C6 50 0A         [ 1]  101 	ld	a, 0x500a
      00828D A4 EF            [ 1]  102 	and	a, #0xef
      00828F C7 50 0A         [ 1]  103 	ld	0x500a, a
                                    104 ;	../src/diskio.c: 44: SD_SendCmd(SD_CMD_READ_SINGLE_BLOCK, sector, 0xFF);
      008292 4B FF            [ 1]  105 	push	#0xff
      008294 1E 14            [ 2]  106 	ldw	x, (0x14, sp)
      008296 89               [ 2]  107 	pushw	x
      008297 1E 14            [ 2]  108 	ldw	x, (0x14, sp)
      008299 89               [ 2]  109 	pushw	x
      00829A 4B 11            [ 1]  110 	push	#0x11
      00829C CD 8B 27         [ 4]  111 	call	_SD_SendCmd
      00829F 5B 06            [ 2]  112 	addw	sp, #6
                                    113 ;	../src/diskio.c: 47: if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
      0082A1 4B 00            [ 1]  114 	push	#0x00
      0082A3 CD 8B DD         [ 4]  115 	call	_SD_GetResponse
      0082A6 5B 01            [ 2]  116 	addw	sp, #1
      0082A8 6B 0C            [ 1]  117 	ld	(0x0c, sp), a
      0082AA 27 03            [ 1]  118 	jreq	00162$
      0082AC CC 83 4A         [ 2]  119 	jp	00107$
      0082AF                        120 00162$:
                                    121 ;	../src/diskio.c: 50: if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
      0082AF 4B FE            [ 1]  122 	push	#0xfe
      0082B1 CD 8B DD         [ 4]  123 	call	_SD_GetResponse
      0082B4 5B 01            [ 2]  124 	addw	sp, #1
      0082B6 4D               [ 1]  125 	tnz	a
      0082B7 27 03            [ 1]  126 	jreq	00163$
      0082B9 CC 83 4A         [ 2]  127 	jp	00107$
      0082BC                        128 00163$:
                                    129 ;	../src/diskio.c: 53: for(i = 0; i < offset; i++){
      0082BC 5F               [ 1]  130 	clrw	x
      0082BD 1F 0B            [ 2]  131 	ldw	(0x0b, sp), x
      0082BF 1F 09            [ 2]  132 	ldw	(0x09, sp), x
      0082C1                        133 00109$:
      0082C1 16 15            [ 2]  134 	ldw	y, (0x15, sp)
      0082C3 17 07            [ 2]  135 	ldw	(0x07, sp), y
      0082C5 0F 06            [ 1]  136 	clr	(0x06, sp)
      0082C7 0F 05            [ 1]  137 	clr	(0x05, sp)
      0082C9 1E 0B            [ 2]  138 	ldw	x, (0x0b, sp)
      0082CB 13 07            [ 2]  139 	cpw	x, (0x07, sp)
      0082CD 7B 0A            [ 1]  140 	ld	a, (0x0a, sp)
      0082CF 12 06            [ 1]  141 	sbc	a, (0x06, sp)
      0082D1 7B 09            [ 1]  142 	ld	a, (0x09, sp)
      0082D3 12 05            [ 1]  143 	sbc	a, (0x05, sp)
      0082D5 24 11            [ 1]  144 	jrnc	00124$
                                    145 ;	../src/diskio.c: 54: SD_ReadByte();
      0082D7 CD 8D 94         [ 4]  146 	call	_SD_ReadByte
                                    147 ;	../src/diskio.c: 53: for(i = 0; i < offset; i++){
      0082DA 1E 0B            [ 2]  148 	ldw	x, (0x0b, sp)
      0082DC 5C               [ 1]  149 	incw	x
      0082DD 1F 0B            [ 2]  150 	ldw	(0x0b, sp), x
      0082DF 26 E0            [ 1]  151 	jrne	00109$
      0082E1 1E 09            [ 2]  152 	ldw	x, (0x09, sp)
      0082E3 5C               [ 1]  153 	incw	x
      0082E4 1F 09            [ 2]  154 	ldw	(0x09, sp), x
      0082E6 20 D9            [ 2]  155 	jra	00109$
      0082E8                        156 00124$:
      0082E8 1E 15            [ 2]  157 	ldw	x, (0x15, sp)
      0082EA 72 FB 17         [ 2]  158 	addw	x, (0x17, sp)
      0082ED 1F 05            [ 2]  159 	ldw	(0x05, sp), x
      0082EF 16 0F            [ 2]  160 	ldw	y, (0x0f, sp)
      0082F1 17 07            [ 2]  161 	ldw	(0x07, sp), y
      0082F3                        162 00112$:
                                    163 ;	../src/diskio.c: 56: for (; i < offset+count; i++)
      0082F3 16 05            [ 2]  164 	ldw	y, (0x05, sp)
      0082F5 17 03            [ 2]  165 	ldw	(0x03, sp), y
      0082F7 0F 02            [ 1]  166 	clr	(0x02, sp)
      0082F9 0F 01            [ 1]  167 	clr	(0x01, sp)
      0082FB 1E 0B            [ 2]  168 	ldw	x, (0x0b, sp)
      0082FD 13 03            [ 2]  169 	cpw	x, (0x03, sp)
      0082FF 7B 0A            [ 1]  170 	ld	a, (0x0a, sp)
      008301 12 02            [ 1]  171 	sbc	a, (0x02, sp)
      008303 7B 09            [ 1]  172 	ld	a, (0x09, sp)
      008305 12 01            [ 1]  173 	sbc	a, (0x01, sp)
      008307 24 19            [ 1]  174 	jrnc	00126$
                                    175 ;	../src/diskio.c: 59: *buff = SD_ReadByte();
      008309 CD 8D 94         [ 4]  176 	call	_SD_ReadByte
      00830C 1E 07            [ 2]  177 	ldw	x, (0x07, sp)
      00830E F7               [ 1]  178 	ld	(x), a
                                    179 ;	../src/diskio.c: 62: buff++;
      00830F 1E 07            [ 2]  180 	ldw	x, (0x07, sp)
      008311 5C               [ 1]  181 	incw	x
      008312 1F 07            [ 2]  182 	ldw	(0x07, sp), x
                                    183 ;	../src/diskio.c: 56: for (; i < offset+count; i++)
      008314 1E 0B            [ 2]  184 	ldw	x, (0x0b, sp)
      008316 5C               [ 1]  185 	incw	x
      008317 1F 0B            [ 2]  186 	ldw	(0x0b, sp), x
      008319 26 D8            [ 1]  187 	jrne	00112$
      00831B 1E 09            [ 2]  188 	ldw	x, (0x09, sp)
      00831D 5C               [ 1]  189 	incw	x
      00831E 1F 09            [ 2]  190 	ldw	(0x09, sp), x
      008320 20 D1            [ 2]  191 	jra	00112$
      008322                        192 00126$:
      008322 16 0B            [ 2]  193 	ldw	y, (0x0b, sp)
      008324 1E 09            [ 2]  194 	ldw	x, (0x09, sp)
      008326                        195 00115$:
                                    196 ;	../src/diskio.c: 64: for(;i < 512; i++){
      008326 90 A3 02 00      [ 2]  197 	cpw	y, #0x0200
      00832A 9F               [ 1]  198 	ld	a, xl
      00832B A2 00            [ 1]  199 	sbc	a, #0x00
      00832D 9E               [ 1]  200 	ld	a, xh
      00832E A2 00            [ 1]  201 	sbc	a, #0x00
      008330 24 10            [ 1]  202 	jrnc	00103$
                                    203 ;	../src/diskio.c: 65: SD_ReadByte();
      008332 89               [ 2]  204 	pushw	x
      008333 90 89            [ 2]  205 	pushw	y
      008335 CD 8D 94         [ 4]  206 	call	_SD_ReadByte
      008338 90 85            [ 2]  207 	popw	y
      00833A 85               [ 2]  208 	popw	x
                                    209 ;	../src/diskio.c: 64: for(;i < 512; i++){
      00833B 90 5C            [ 1]  210 	incw	y
      00833D 26 E7            [ 1]  211 	jrne	00115$
      00833F 5C               [ 1]  212 	incw	x
      008340 20 E4            [ 2]  213 	jra	00115$
      008342                        214 00103$:
                                    215 ;	../src/diskio.c: 68: SD_ReadByte();
      008342 CD 8D 94         [ 4]  216 	call	_SD_ReadByte
                                    217 ;	../src/diskio.c: 69: SD_ReadByte();
      008345 CD 8D 94         [ 4]  218 	call	_SD_ReadByte
                                    219 ;	../src/diskio.c: 71: res = RES_OK;
      008348 0F 0B            [ 1]  220 	clr	(0x0b, sp)
      00834A                        221 00107$:
                                    222 ;	../src/diskio.c: 75: SD_CS_HIGH();
      00834A 72 18 50 0A      [ 1]  223 	bset	20490, #4
                                    224 ;	../src/diskio.c: 78: SD_WriteByte(SD_DUMMY_BYTE);
      00834E 4B FF            [ 1]  225 	push	#0xff
      008350 CD 8D 84         [ 4]  226 	call	_SD_WriteByte
      008353 84               [ 1]  227 	pop	a
                                    228 ;	../src/diskio.c: 81: return res;
      008354 7B 0B            [ 1]  229 	ld	a, (0x0b, sp)
                                    230 ;	../src/diskio.c: 82: }
      008356 5B 0C            [ 2]  231 	addw	sp, #12
      008358 81               [ 4]  232 	ret
                                    233 ;	../src/diskio.c: 90: DRESULT disk_writep (
                                    234 ;	-----------------------------------------
                                    235 ;	 function disk_writep
                                    236 ;	-----------------------------------------
      008359                        237 _disk_writep:
      008359 52 06            [ 2]  238 	sub	sp, #6
                                    239 ;	../src/diskio.c: 97: DRESULT res = RES_ERROR;
      00835B A6 01            [ 1]  240 	ld	a, #0x01
      00835D 6B 02            [ 1]  241 	ld	(0x02, sp), a
                                    242 ;	../src/diskio.c: 99: if (!buff) {
      00835F 1E 09            [ 2]  243 	ldw	x, (0x09, sp)
      008361 27 03            [ 1]  244 	jreq	00193$
      008363 CC 84 43         [ 2]  245 	jp	00139$
      008366                        246 00193$:
                                    247 ;	../src/diskio.c: 100: if (sc) {
      008366 1E 0D            [ 2]  248 	ldw	x, (0x0d, sp)
      008368 26 04            [ 1]  249 	jrne	00194$
      00836A 1E 0B            [ 2]  250 	ldw	x, (0x0b, sp)
      00836C 27 3F            [ 1]  251 	jreq	00103$
      00836E                        252 00194$:
                                    253 ;	../src/diskio.c: 102: SD_CS_LOW();
      00836E C6 50 0A         [ 1]  254 	ld	a, 0x500a
      008371 A4 EF            [ 1]  255 	and	a, #0xef
      008373 C7 50 0A         [ 1]  256 	ld	0x500a, a
                                    257 ;	../src/diskio.c: 104: SD_SendCmd(SD_CMD_WRITE_SINGLE_BLOCK, sc, 0xFF);
      008376 4B FF            [ 1]  258 	push	#0xff
      008378 1E 0E            [ 2]  259 	ldw	x, (0x0e, sp)
      00837A 89               [ 2]  260 	pushw	x
      00837B 1E 0E            [ 2]  261 	ldw	x, (0x0e, sp)
      00837D 89               [ 2]  262 	pushw	x
      00837E 4B 18            [ 1]  263 	push	#0x18
      008380 CD 8B 27         [ 4]  264 	call	_SD_SendCmd
      008383 5B 06            [ 2]  265 	addw	sp, #6
                                    266 ;	../src/diskio.c: 107: if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
      008385 4B 00            [ 1]  267 	push	#0x00
      008387 CD 8B DD         [ 4]  268 	call	_SD_GetResponse
      00838A 5B 01            [ 2]  269 	addw	sp, #1
      00838C 4D               [ 1]  270 	tnz	a
      00838D 27 03            [ 1]  271 	jreq	00195$
      00838F CC 84 95         [ 2]  272 	jp	00120$
      008392                        273 00195$:
                                    274 ;	../src/diskio.c: 110: SD_WriteByte(SD_DUMMY_BYTE);
      008392 4B FF            [ 1]  275 	push	#0xff
      008394 CD 8D 84         [ 4]  276 	call	_SD_WriteByte
      008397 84               [ 1]  277 	pop	a
                                    278 ;	../src/diskio.c: 112: SD_WriteByte(0xFE);
      008398 4B FE            [ 1]  279 	push	#0xfe
      00839A CD 8D 84         [ 4]  280 	call	_SD_WriteByte
      00839D 84               [ 1]  281 	pop	a
                                    282 ;	../src/diskio.c: 113: byteLeft = 512;
      00839E AE 02 00         [ 2]  283 	ldw	x, #0x0200
      0083A1 CF 02 0B         [ 2]  284 	ldw	_disk_writep_byteLeft_65536_355+2, x
      0083A4 5F               [ 1]  285 	clrw	x
      0083A5 CF 02 09         [ 2]  286 	ldw	_disk_writep_byteLeft_65536_355+0, x
                                    287 ;	../src/diskio.c: 114: res =  RES_OK;
      0083A8 0F 02            [ 1]  288 	clr	(0x02, sp)
      0083AA CC 84 95         [ 2]  289 	jp	00120$
                                    290 ;	../src/diskio.c: 118: while((byteLeft--)) {
      0083AD                        291 00103$:
      0083AD CE 02 0B         [ 2]  292 	ldw	x, _disk_writep_byteLeft_65536_355+2
      0083B0 1F 05            [ 2]  293 	ldw	(0x05, sp), x
      0083B2 CE 02 09         [ 2]  294 	ldw	x, _disk_writep_byteLeft_65536_355+0
      0083B5 1F 03            [ 2]  295 	ldw	(0x03, sp), x
      0083B7 CE 02 0B         [ 2]  296 	ldw	x, _disk_writep_byteLeft_65536_355+2
      0083BA 1D 00 01         [ 2]  297 	subw	x, #0x0001
      0083BD 90 CE 02 09      [ 2]  298 	ldw	y, _disk_writep_byteLeft_65536_355+0
      0083C1 24 02            [ 1]  299 	jrnc	00196$
      0083C3 90 5A            [ 2]  300 	decw	y
      0083C5                        301 00196$:
      0083C5 CF 02 0B         [ 2]  302 	ldw	_disk_writep_byteLeft_65536_355+2, x
      0083C8 90 CF 02 09      [ 2]  303 	ldw	_disk_writep_byteLeft_65536_355+0, y
      0083CC 1E 05            [ 2]  304 	ldw	x, (0x05, sp)
      0083CE 26 04            [ 1]  305 	jrne	00197$
      0083D0 1E 03            [ 2]  306 	ldw	x, (0x03, sp)
      0083D2 27 08            [ 1]  307 	jreq	00105$
      0083D4                        308 00197$:
                                    309 ;	../src/diskio.c: 119: SD_WriteByte(0);
      0083D4 4B 00            [ 1]  310 	push	#0x00
      0083D6 CD 8D 84         [ 4]  311 	call	_SD_WriteByte
      0083D9 84               [ 1]  312 	pop	a
      0083DA 20 D1            [ 2]  313 	jra	00103$
      0083DC                        314 00105$:
                                    315 ;	../src/diskio.c: 122: SD_WriteByte(0);
      0083DC 4B 00            [ 1]  316 	push	#0x00
      0083DE CD 8D 84         [ 4]  317 	call	_SD_WriteByte
      0083E1 84               [ 1]  318 	pop	a
                                    319 ;	../src/diskio.c: 123: SD_WriteByte(0);
      0083E2 4B 00            [ 1]  320 	push	#0x00
      0083E4 CD 8D 84         [ 4]  321 	call	_SD_WriteByte
      0083E7 84               [ 1]  322 	pop	a
                                    323 ;	../src/diskio.c: 126: if (SD_GetDataResponse() == SD_DATA_OK){
      0083E8 CD 8B 83         [ 4]  324 	call	_SD_GetDataResponse
      0083EB A1 05            [ 1]  325 	cp	a, #0x05
      0083ED 26 48            [ 1]  326 	jrne	00110$
                                    327 ;	../src/diskio.c: 127: for (byteLeft = 5000;
      0083EF AE 13 88         [ 2]  328 	ldw	x, #0x1388
      0083F2 CF 02 0B         [ 2]  329 	ldw	_disk_writep_byteLeft_65536_355+2, x
      0083F5 5F               [ 1]  330 	clrw	x
      0083F6 CF 02 09         [ 2]  331 	ldw	_disk_writep_byteLeft_65536_355+0, x
      0083F9                        332 00123$:
                                    333 ;	../src/diskio.c: 128: (SD_ReadByte() != 0xFF) && byteLeft;
      0083F9 CD 8D 94         [ 4]  334 	call	_SD_ReadByte
      0083FC 4C               [ 1]  335 	inc	a
      0083FD 27 2C            [ 1]  336 	jreq	00106$
      0083FF CE 02 0B         [ 2]  337 	ldw	x, _disk_writep_byteLeft_65536_355+2
      008402 26 05            [ 1]  338 	jrne	00204$
      008404 CE 02 09         [ 2]  339 	ldw	x, _disk_writep_byteLeft_65536_355+0
      008407 27 22            [ 1]  340 	jreq	00106$
      008409                        341 00204$:
                                    342 ;	../src/diskio.c: 130: dly(10);
      008409 4B 0A            [ 1]  343 	push	#0x0a
      00840B 5F               [ 1]  344 	clrw	x
      00840C 89               [ 2]  345 	pushw	x
      00840D 4B 00            [ 1]  346 	push	#0x00
      00840F CD 84 B9         [ 4]  347 	call	_dly
      008412 5B 04            [ 2]  348 	addw	sp, #4
                                    349 ;	../src/diskio.c: 129: byteLeft--) {	/* Wait for ready */
      008414 CE 02 0B         [ 2]  350 	ldw	x, _disk_writep_byteLeft_65536_355+2
      008417 1D 00 01         [ 2]  351 	subw	x, #0x0001
      00841A 90 CE 02 09      [ 2]  352 	ldw	y, _disk_writep_byteLeft_65536_355+0
      00841E 24 02            [ 1]  353 	jrnc	00205$
      008420 90 5A            [ 2]  354 	decw	y
      008422                        355 00205$:
      008422 CF 02 0B         [ 2]  356 	ldw	_disk_writep_byteLeft_65536_355+2, x
      008425 90 CF 02 09      [ 2]  357 	ldw	_disk_writep_byteLeft_65536_355+0, y
      008429 20 CE            [ 2]  358 	jra	00123$
      00842B                        359 00106$:
                                    360 ;	../src/diskio.c: 132: if(byteLeft) res = RES_OK;
      00842B CE 02 0B         [ 2]  361 	ldw	x, _disk_writep_byteLeft_65536_355+2
      00842E 26 05            [ 1]  362 	jrne	00206$
      008430 CE 02 09         [ 2]  363 	ldw	x, _disk_writep_byteLeft_65536_355+0
      008433 27 02            [ 1]  364 	jreq	00110$
      008435                        365 00206$:
      008435 0F 02            [ 1]  366 	clr	(0x02, sp)
      008437                        367 00110$:
                                    368 ;	../src/diskio.c: 136: SD_CS_HIGH();
      008437 72 18 50 0A      [ 1]  369 	bset	20490, #4
                                    370 ;	../src/diskio.c: 138: SD_WriteByte(SD_DUMMY_BYTE);
      00843B 4B FF            [ 1]  371 	push	#0xff
      00843D CD 8D 84         [ 4]  372 	call	_SD_WriteByte
      008440 84               [ 1]  373 	pop	a
      008441 20 52            [ 2]  374 	jra	00120$
                                    375 ;	../src/diskio.c: 143: while((byteLeft)&&(sc))
      008443                        376 00139$:
      008443 16 09            [ 2]  377 	ldw	y, (0x09, sp)
      008445 17 01            [ 2]  378 	ldw	(0x01, sp), y
      008447 16 0D            [ 2]  379 	ldw	y, (0x0d, sp)
      008449 17 05            [ 2]  380 	ldw	(0x05, sp), y
      00844B 16 0B            [ 2]  381 	ldw	y, (0x0b, sp)
      00844D 17 03            [ 2]  382 	ldw	(0x03, sp), y
      00844F                        383 00115$:
      00844F CE 02 0B         [ 2]  384 	ldw	x, _disk_writep_byteLeft_65536_355+2
      008452 26 05            [ 1]  385 	jrne	00207$
      008454 CE 02 09         [ 2]  386 	ldw	x, _disk_writep_byteLeft_65536_355+0
      008457 27 3A            [ 1]  387 	jreq	00117$
      008459                        388 00207$:
      008459 1E 05            [ 2]  389 	ldw	x, (0x05, sp)
      00845B 26 04            [ 1]  390 	jrne	00208$
      00845D 1E 03            [ 2]  391 	ldw	x, (0x03, sp)
      00845F 27 32            [ 1]  392 	jreq	00117$
      008461                        393 00208$:
                                    394 ;	../src/diskio.c: 146: SD_WriteByte(*buff);
      008461 1E 01            [ 2]  395 	ldw	x, (0x01, sp)
      008463 F6               [ 1]  396 	ld	a, (x)
      008464 88               [ 1]  397 	push	a
      008465 CD 8D 84         [ 4]  398 	call	_SD_WriteByte
      008468 84               [ 1]  399 	pop	a
                                    400 ;	../src/diskio.c: 148: buff++;byteLeft--;sc--;
      008469 1E 01            [ 2]  401 	ldw	x, (0x01, sp)
      00846B 5C               [ 1]  402 	incw	x
      00846C 1F 01            [ 2]  403 	ldw	(0x01, sp), x
      00846E CE 02 0B         [ 2]  404 	ldw	x, _disk_writep_byteLeft_65536_355+2
      008471 1D 00 01         [ 2]  405 	subw	x, #0x0001
      008474 90 CE 02 09      [ 2]  406 	ldw	y, _disk_writep_byteLeft_65536_355+0
      008478 24 02            [ 1]  407 	jrnc	00210$
      00847A 90 5A            [ 2]  408 	decw	y
      00847C                        409 00210$:
      00847C CF 02 0B         [ 2]  410 	ldw	_disk_writep_byteLeft_65536_355+2, x
      00847F 90 CF 02 09      [ 2]  411 	ldw	_disk_writep_byteLeft_65536_355+0, y
      008483 1E 05            [ 2]  412 	ldw	x, (0x05, sp)
      008485 1D 00 01         [ 2]  413 	subw	x, #0x0001
      008488 1F 05            [ 2]  414 	ldw	(0x05, sp), x
      00848A 1E 03            [ 2]  415 	ldw	x, (0x03, sp)
      00848C 24 01            [ 1]  416 	jrnc	00211$
      00848E 5A               [ 2]  417 	decw	x
      00848F                        418 00211$:
      00848F 1F 03            [ 2]  419 	ldw	(0x03, sp), x
      008491 20 BC            [ 2]  420 	jra	00115$
      008493                        421 00117$:
                                    422 ;	../src/diskio.c: 150: res = RES_OK;
      008493 0F 02            [ 1]  423 	clr	(0x02, sp)
      008495                        424 00120$:
                                    425 ;	../src/diskio.c: 153: return res;
      008495 7B 02            [ 1]  426 	ld	a, (0x02, sp)
                                    427 ;	../src/diskio.c: 154: }
      008497 5B 06            [ 2]  428 	addw	sp, #6
      008499 81               [ 4]  429 	ret
                                    430 	.area CODE
                                    431 	.area CONST
                                    432 	.area INITIALIZER
                                    433 	.area CABS (ABS)
