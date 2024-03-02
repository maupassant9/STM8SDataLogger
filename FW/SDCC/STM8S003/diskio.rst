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
      00827B                         70 _disk_initialize:
                                     71 ;	../src/diskio.c: 16: if(SD_Detect() == SD_NOT_PRESENT)
      00827B CD 8D 7D         [ 4]   72 	call	_SD_Detect
      00827E 4D               [ 1]   73 	tnz	a
      00827F 26 03            [ 1]   74 	jrne	00102$
                                     75 ;	../src/diskio.c: 17: return STA_NODISK;
      008281 A6 02            [ 1]   76 	ld	a, #0x02
      008283 81               [ 4]   77 	ret
      008284                         78 00102$:
                                     79 ;	../src/diskio.c: 18: if(SD_Init() == SD_RESPONSE_FAILURE){
      008284 CD 8D 3D         [ 4]   80 	call	_SD_Init
      008287 4C               [ 1]   81 	inc	a
      008288 26 03            [ 1]   82 	jrne	00104$
                                     83 ;	../src/diskio.c: 19: return STA_NOINIT;
      00828A A6 01            [ 1]   84 	ld	a, #0x01
      00828C 81               [ 4]   85 	ret
      00828D                         86 00104$:
                                     87 ;	../src/diskio.c: 21: return 0;
      00828D 4F               [ 1]   88 	clr	a
                                     89 ;	../src/diskio.c: 23: }
      00828E 81               [ 4]   90 	ret
                                     91 ;	../src/diskio.c: 31: DRESULT disk_readp (
                                     92 ;	-----------------------------------------
                                     93 ;	 function disk_readp
                                     94 ;	-----------------------------------------
      00828F                         95 _disk_readp:
      00828F 52 0C            [ 2]   96 	sub	sp, #12
                                     97 ;	../src/diskio.c: 38: DRESULT res = RES_ERROR;
      008291 A6 01            [ 1]   98 	ld	a, #0x01
      008293 6B 0B            [ 1]   99 	ld	(0x0b, sp), a
                                    100 ;	../src/diskio.c: 41: SD_CS_LOW();
      008295 C6 50 0A         [ 1]  101 	ld	a, 0x500a
      008298 A4 EF            [ 1]  102 	and	a, #0xef
      00829A C7 50 0A         [ 1]  103 	ld	0x500a, a
                                    104 ;	../src/diskio.c: 44: SD_SendCmd(SD_CMD_READ_SINGLE_BLOCK, sector, 0xFF);
      00829D 4B FF            [ 1]  105 	push	#0xff
      00829F 1E 14            [ 2]  106 	ldw	x, (0x14, sp)
      0082A1 89               [ 2]  107 	pushw	x
      0082A2 1E 14            [ 2]  108 	ldw	x, (0x14, sp)
      0082A4 89               [ 2]  109 	pushw	x
      0082A5 4B 11            [ 1]  110 	push	#0x11
      0082A7 CD 8D 85         [ 4]  111 	call	_SD_SendCmd
      0082AA 5B 06            [ 2]  112 	addw	sp, #6
                                    113 ;	../src/diskio.c: 47: if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
      0082AC 4B 00            [ 1]  114 	push	#0x00
      0082AE CD 8E 3B         [ 4]  115 	call	_SD_GetResponse
      0082B1 5B 01            [ 2]  116 	addw	sp, #1
      0082B3 6B 0C            [ 1]  117 	ld	(0x0c, sp), a
      0082B5 27 03            [ 1]  118 	jreq	00162$
      0082B7 CC 83 55         [ 2]  119 	jp	00107$
      0082BA                        120 00162$:
                                    121 ;	../src/diskio.c: 50: if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
      0082BA 4B FE            [ 1]  122 	push	#0xfe
      0082BC CD 8E 3B         [ 4]  123 	call	_SD_GetResponse
      0082BF 5B 01            [ 2]  124 	addw	sp, #1
      0082C1 4D               [ 1]  125 	tnz	a
      0082C2 27 03            [ 1]  126 	jreq	00163$
      0082C4 CC 83 55         [ 2]  127 	jp	00107$
      0082C7                        128 00163$:
                                    129 ;	../src/diskio.c: 53: for(i = 0; i < offset; i++){
      0082C7 5F               [ 1]  130 	clrw	x
      0082C8 1F 0B            [ 2]  131 	ldw	(0x0b, sp), x
      0082CA 1F 09            [ 2]  132 	ldw	(0x09, sp), x
      0082CC                        133 00109$:
      0082CC 16 15            [ 2]  134 	ldw	y, (0x15, sp)
      0082CE 17 07            [ 2]  135 	ldw	(0x07, sp), y
      0082D0 0F 06            [ 1]  136 	clr	(0x06, sp)
      0082D2 0F 05            [ 1]  137 	clr	(0x05, sp)
      0082D4 1E 0B            [ 2]  138 	ldw	x, (0x0b, sp)
      0082D6 13 07            [ 2]  139 	cpw	x, (0x07, sp)
      0082D8 7B 0A            [ 1]  140 	ld	a, (0x0a, sp)
      0082DA 12 06            [ 1]  141 	sbc	a, (0x06, sp)
      0082DC 7B 09            [ 1]  142 	ld	a, (0x09, sp)
      0082DE 12 05            [ 1]  143 	sbc	a, (0x05, sp)
      0082E0 24 11            [ 1]  144 	jrnc	00124$
                                    145 ;	../src/diskio.c: 54: SD_ReadByte();
      0082E2 CD 8F F9         [ 4]  146 	call	_SD_ReadByte
                                    147 ;	../src/diskio.c: 53: for(i = 0; i < offset; i++){
      0082E5 1E 0B            [ 2]  148 	ldw	x, (0x0b, sp)
      0082E7 5C               [ 1]  149 	incw	x
      0082E8 1F 0B            [ 2]  150 	ldw	(0x0b, sp), x
      0082EA 26 E0            [ 1]  151 	jrne	00109$
      0082EC 1E 09            [ 2]  152 	ldw	x, (0x09, sp)
      0082EE 5C               [ 1]  153 	incw	x
      0082EF 1F 09            [ 2]  154 	ldw	(0x09, sp), x
      0082F1 20 D9            [ 2]  155 	jra	00109$
      0082F3                        156 00124$:
      0082F3 1E 15            [ 2]  157 	ldw	x, (0x15, sp)
      0082F5 72 FB 17         [ 2]  158 	addw	x, (0x17, sp)
      0082F8 1F 05            [ 2]  159 	ldw	(0x05, sp), x
      0082FA 16 0F            [ 2]  160 	ldw	y, (0x0f, sp)
      0082FC 17 07            [ 2]  161 	ldw	(0x07, sp), y
      0082FE                        162 00112$:
                                    163 ;	../src/diskio.c: 56: for (; i < offset+count; i++)
      0082FE 16 05            [ 2]  164 	ldw	y, (0x05, sp)
      008300 17 03            [ 2]  165 	ldw	(0x03, sp), y
      008302 0F 02            [ 1]  166 	clr	(0x02, sp)
      008304 0F 01            [ 1]  167 	clr	(0x01, sp)
      008306 1E 0B            [ 2]  168 	ldw	x, (0x0b, sp)
      008308 13 03            [ 2]  169 	cpw	x, (0x03, sp)
      00830A 7B 0A            [ 1]  170 	ld	a, (0x0a, sp)
      00830C 12 02            [ 1]  171 	sbc	a, (0x02, sp)
      00830E 7B 09            [ 1]  172 	ld	a, (0x09, sp)
      008310 12 01            [ 1]  173 	sbc	a, (0x01, sp)
      008312 24 19            [ 1]  174 	jrnc	00126$
                                    175 ;	../src/diskio.c: 59: *buff = SD_ReadByte();
      008314 CD 8F F9         [ 4]  176 	call	_SD_ReadByte
      008317 1E 07            [ 2]  177 	ldw	x, (0x07, sp)
      008319 F7               [ 1]  178 	ld	(x), a
                                    179 ;	../src/diskio.c: 62: buff++;
      00831A 1E 07            [ 2]  180 	ldw	x, (0x07, sp)
      00831C 5C               [ 1]  181 	incw	x
      00831D 1F 07            [ 2]  182 	ldw	(0x07, sp), x
                                    183 ;	../src/diskio.c: 56: for (; i < offset+count; i++)
      00831F 1E 0B            [ 2]  184 	ldw	x, (0x0b, sp)
      008321 5C               [ 1]  185 	incw	x
      008322 1F 0B            [ 2]  186 	ldw	(0x0b, sp), x
      008324 26 D8            [ 1]  187 	jrne	00112$
      008326 1E 09            [ 2]  188 	ldw	x, (0x09, sp)
      008328 5C               [ 1]  189 	incw	x
      008329 1F 09            [ 2]  190 	ldw	(0x09, sp), x
      00832B 20 D1            [ 2]  191 	jra	00112$
      00832D                        192 00126$:
      00832D 16 0B            [ 2]  193 	ldw	y, (0x0b, sp)
      00832F 1E 09            [ 2]  194 	ldw	x, (0x09, sp)
      008331                        195 00115$:
                                    196 ;	../src/diskio.c: 64: for(;i < 512; i++){
      008331 90 A3 02 00      [ 2]  197 	cpw	y, #0x0200
      008335 9F               [ 1]  198 	ld	a, xl
      008336 A2 00            [ 1]  199 	sbc	a, #0x00
      008338 9E               [ 1]  200 	ld	a, xh
      008339 A2 00            [ 1]  201 	sbc	a, #0x00
      00833B 24 10            [ 1]  202 	jrnc	00103$
                                    203 ;	../src/diskio.c: 65: SD_ReadByte();
      00833D 89               [ 2]  204 	pushw	x
      00833E 90 89            [ 2]  205 	pushw	y
      008340 CD 8F F9         [ 4]  206 	call	_SD_ReadByte
      008343 90 85            [ 2]  207 	popw	y
      008345 85               [ 2]  208 	popw	x
                                    209 ;	../src/diskio.c: 64: for(;i < 512; i++){
      008346 90 5C            [ 1]  210 	incw	y
      008348 26 E7            [ 1]  211 	jrne	00115$
      00834A 5C               [ 1]  212 	incw	x
      00834B 20 E4            [ 2]  213 	jra	00115$
      00834D                        214 00103$:
                                    215 ;	../src/diskio.c: 68: SD_ReadByte();
      00834D CD 8F F9         [ 4]  216 	call	_SD_ReadByte
                                    217 ;	../src/diskio.c: 69: SD_ReadByte();
      008350 CD 8F F9         [ 4]  218 	call	_SD_ReadByte
                                    219 ;	../src/diskio.c: 71: res = RES_OK;
      008353 0F 0B            [ 1]  220 	clr	(0x0b, sp)
      008355                        221 00107$:
                                    222 ;	../src/diskio.c: 75: SD_CS_HIGH();
      008355 72 18 50 0A      [ 1]  223 	bset	20490, #4
                                    224 ;	../src/diskio.c: 78: SD_WriteByte(SD_DUMMY_BYTE);
      008359 4B FF            [ 1]  225 	push	#0xff
      00835B CD 8F E2         [ 4]  226 	call	_SD_WriteByte
      00835E 84               [ 1]  227 	pop	a
                                    228 ;	../src/diskio.c: 81: return res;
      00835F 7B 0B            [ 1]  229 	ld	a, (0x0b, sp)
                                    230 ;	../src/diskio.c: 82: }
      008361 5B 0C            [ 2]  231 	addw	sp, #12
      008363 81               [ 4]  232 	ret
                                    233 ;	../src/diskio.c: 90: DRESULT disk_writep (
                                    234 ;	-----------------------------------------
                                    235 ;	 function disk_writep
                                    236 ;	-----------------------------------------
      008364                        237 _disk_writep:
      008364 52 06            [ 2]  238 	sub	sp, #6
                                    239 ;	../src/diskio.c: 97: DRESULT res = RES_ERROR;
      008366 A6 01            [ 1]  240 	ld	a, #0x01
      008368 6B 02            [ 1]  241 	ld	(0x02, sp), a
                                    242 ;	../src/diskio.c: 99: if (!buff) {
      00836A 1E 09            [ 2]  243 	ldw	x, (0x09, sp)
      00836C 27 03            [ 1]  244 	jreq	00193$
      00836E CC 84 4E         [ 2]  245 	jp	00139$
      008371                        246 00193$:
                                    247 ;	../src/diskio.c: 100: if (sc) {
      008371 1E 0D            [ 2]  248 	ldw	x, (0x0d, sp)
      008373 26 04            [ 1]  249 	jrne	00194$
      008375 1E 0B            [ 2]  250 	ldw	x, (0x0b, sp)
      008377 27 3F            [ 1]  251 	jreq	00103$
      008379                        252 00194$:
                                    253 ;	../src/diskio.c: 102: SD_CS_LOW();
      008379 C6 50 0A         [ 1]  254 	ld	a, 0x500a
      00837C A4 EF            [ 1]  255 	and	a, #0xef
      00837E C7 50 0A         [ 1]  256 	ld	0x500a, a
                                    257 ;	../src/diskio.c: 104: SD_SendCmd(SD_CMD_WRITE_SINGLE_BLOCK, sc, 0xFF);
      008381 4B FF            [ 1]  258 	push	#0xff
      008383 1E 0E            [ 2]  259 	ldw	x, (0x0e, sp)
      008385 89               [ 2]  260 	pushw	x
      008386 1E 0E            [ 2]  261 	ldw	x, (0x0e, sp)
      008388 89               [ 2]  262 	pushw	x
      008389 4B 18            [ 1]  263 	push	#0x18
      00838B CD 8D 85         [ 4]  264 	call	_SD_SendCmd
      00838E 5B 06            [ 2]  265 	addw	sp, #6
                                    266 ;	../src/diskio.c: 107: if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
      008390 4B 00            [ 1]  267 	push	#0x00
      008392 CD 8E 3B         [ 4]  268 	call	_SD_GetResponse
      008395 5B 01            [ 2]  269 	addw	sp, #1
      008397 4D               [ 1]  270 	tnz	a
      008398 27 03            [ 1]  271 	jreq	00195$
      00839A CC 84 A0         [ 2]  272 	jp	00120$
      00839D                        273 00195$:
                                    274 ;	../src/diskio.c: 110: SD_WriteByte(SD_DUMMY_BYTE);
      00839D 4B FF            [ 1]  275 	push	#0xff
      00839F CD 8F E2         [ 4]  276 	call	_SD_WriteByte
      0083A2 84               [ 1]  277 	pop	a
                                    278 ;	../src/diskio.c: 112: SD_WriteByte(0xFE);
      0083A3 4B FE            [ 1]  279 	push	#0xfe
      0083A5 CD 8F E2         [ 4]  280 	call	_SD_WriteByte
      0083A8 84               [ 1]  281 	pop	a
                                    282 ;	../src/diskio.c: 113: byteLeft = 512;
      0083A9 AE 02 00         [ 2]  283 	ldw	x, #0x0200
      0083AC CF 02 0B         [ 2]  284 	ldw	_disk_writep_byteLeft_65536_355+2, x
      0083AF 5F               [ 1]  285 	clrw	x
      0083B0 CF 02 09         [ 2]  286 	ldw	_disk_writep_byteLeft_65536_355+0, x
                                    287 ;	../src/diskio.c: 114: res =  RES_OK;
      0083B3 0F 02            [ 1]  288 	clr	(0x02, sp)
      0083B5 CC 84 A0         [ 2]  289 	jp	00120$
                                    290 ;	../src/diskio.c: 118: while((byteLeft--)) {
      0083B8                        291 00103$:
      0083B8 CE 02 0B         [ 2]  292 	ldw	x, _disk_writep_byteLeft_65536_355+2
      0083BB 1F 05            [ 2]  293 	ldw	(0x05, sp), x
      0083BD CE 02 09         [ 2]  294 	ldw	x, _disk_writep_byteLeft_65536_355+0
      0083C0 1F 03            [ 2]  295 	ldw	(0x03, sp), x
      0083C2 CE 02 0B         [ 2]  296 	ldw	x, _disk_writep_byteLeft_65536_355+2
      0083C5 1D 00 01         [ 2]  297 	subw	x, #0x0001
      0083C8 90 CE 02 09      [ 2]  298 	ldw	y, _disk_writep_byteLeft_65536_355+0
      0083CC 24 02            [ 1]  299 	jrnc	00196$
      0083CE 90 5A            [ 2]  300 	decw	y
      0083D0                        301 00196$:
      0083D0 CF 02 0B         [ 2]  302 	ldw	_disk_writep_byteLeft_65536_355+2, x
      0083D3 90 CF 02 09      [ 2]  303 	ldw	_disk_writep_byteLeft_65536_355+0, y
      0083D7 1E 05            [ 2]  304 	ldw	x, (0x05, sp)
      0083D9 26 04            [ 1]  305 	jrne	00197$
      0083DB 1E 03            [ 2]  306 	ldw	x, (0x03, sp)
      0083DD 27 08            [ 1]  307 	jreq	00105$
      0083DF                        308 00197$:
                                    309 ;	../src/diskio.c: 119: SD_WriteByte(0);
      0083DF 4B 00            [ 1]  310 	push	#0x00
      0083E1 CD 8F E2         [ 4]  311 	call	_SD_WriteByte
      0083E4 84               [ 1]  312 	pop	a
      0083E5 20 D1            [ 2]  313 	jra	00103$
      0083E7                        314 00105$:
                                    315 ;	../src/diskio.c: 122: SD_WriteByte(0);
      0083E7 4B 00            [ 1]  316 	push	#0x00
      0083E9 CD 8F E2         [ 4]  317 	call	_SD_WriteByte
      0083EC 84               [ 1]  318 	pop	a
                                    319 ;	../src/diskio.c: 123: SD_WriteByte(0);
      0083ED 4B 00            [ 1]  320 	push	#0x00
      0083EF CD 8F E2         [ 4]  321 	call	_SD_WriteByte
      0083F2 84               [ 1]  322 	pop	a
                                    323 ;	../src/diskio.c: 126: if (SD_GetDataResponse() == SD_DATA_OK){
      0083F3 CD 8D E1         [ 4]  324 	call	_SD_GetDataResponse
      0083F6 A1 05            [ 1]  325 	cp	a, #0x05
      0083F8 26 48            [ 1]  326 	jrne	00110$
                                    327 ;	../src/diskio.c: 127: for (byteLeft = 5000;
      0083FA AE 13 88         [ 2]  328 	ldw	x, #0x1388
      0083FD CF 02 0B         [ 2]  329 	ldw	_disk_writep_byteLeft_65536_355+2, x
      008400 5F               [ 1]  330 	clrw	x
      008401 CF 02 09         [ 2]  331 	ldw	_disk_writep_byteLeft_65536_355+0, x
      008404                        332 00123$:
                                    333 ;	../src/diskio.c: 128: (SD_ReadByte() != 0xFF) && byteLeft;
      008404 CD 8F F9         [ 4]  334 	call	_SD_ReadByte
      008407 4C               [ 1]  335 	inc	a
      008408 27 2C            [ 1]  336 	jreq	00106$
      00840A CE 02 0B         [ 2]  337 	ldw	x, _disk_writep_byteLeft_65536_355+2
      00840D 26 05            [ 1]  338 	jrne	00204$
      00840F CE 02 09         [ 2]  339 	ldw	x, _disk_writep_byteLeft_65536_355+0
      008412 27 22            [ 1]  340 	jreq	00106$
      008414                        341 00204$:
                                    342 ;	../src/diskio.c: 130: dly(1);
      008414 4B 01            [ 1]  343 	push	#0x01
      008416 5F               [ 1]  344 	clrw	x
      008417 89               [ 2]  345 	pushw	x
      008418 4B 00            [ 1]  346 	push	#0x00
      00841A CD 84 C7         [ 4]  347 	call	_dly
      00841D 5B 04            [ 2]  348 	addw	sp, #4
                                    349 ;	../src/diskio.c: 129: byteLeft--) {	/* Wait for ready */
      00841F CE 02 0B         [ 2]  350 	ldw	x, _disk_writep_byteLeft_65536_355+2
      008422 1D 00 01         [ 2]  351 	subw	x, #0x0001
      008425 90 CE 02 09      [ 2]  352 	ldw	y, _disk_writep_byteLeft_65536_355+0
      008429 24 02            [ 1]  353 	jrnc	00205$
      00842B 90 5A            [ 2]  354 	decw	y
      00842D                        355 00205$:
      00842D CF 02 0B         [ 2]  356 	ldw	_disk_writep_byteLeft_65536_355+2, x
      008430 90 CF 02 09      [ 2]  357 	ldw	_disk_writep_byteLeft_65536_355+0, y
      008434 20 CE            [ 2]  358 	jra	00123$
      008436                        359 00106$:
                                    360 ;	../src/diskio.c: 132: if(byteLeft) res = RES_OK;
      008436 CE 02 0B         [ 2]  361 	ldw	x, _disk_writep_byteLeft_65536_355+2
      008439 26 05            [ 1]  362 	jrne	00206$
      00843B CE 02 09         [ 2]  363 	ldw	x, _disk_writep_byteLeft_65536_355+0
      00843E 27 02            [ 1]  364 	jreq	00110$
      008440                        365 00206$:
      008440 0F 02            [ 1]  366 	clr	(0x02, sp)
      008442                        367 00110$:
                                    368 ;	../src/diskio.c: 136: SD_CS_HIGH();
      008442 72 18 50 0A      [ 1]  369 	bset	20490, #4
                                    370 ;	../src/diskio.c: 138: SD_WriteByte(SD_DUMMY_BYTE);
      008446 4B FF            [ 1]  371 	push	#0xff
      008448 CD 8F E2         [ 4]  372 	call	_SD_WriteByte
      00844B 84               [ 1]  373 	pop	a
      00844C 20 52            [ 2]  374 	jra	00120$
                                    375 ;	../src/diskio.c: 143: while((byteLeft)&&(sc))
      00844E                        376 00139$:
      00844E 16 09            [ 2]  377 	ldw	y, (0x09, sp)
      008450 17 01            [ 2]  378 	ldw	(0x01, sp), y
      008452 16 0D            [ 2]  379 	ldw	y, (0x0d, sp)
      008454 17 05            [ 2]  380 	ldw	(0x05, sp), y
      008456 16 0B            [ 2]  381 	ldw	y, (0x0b, sp)
      008458 17 03            [ 2]  382 	ldw	(0x03, sp), y
      00845A                        383 00115$:
      00845A CE 02 0B         [ 2]  384 	ldw	x, _disk_writep_byteLeft_65536_355+2
      00845D 26 05            [ 1]  385 	jrne	00207$
      00845F CE 02 09         [ 2]  386 	ldw	x, _disk_writep_byteLeft_65536_355+0
      008462 27 3A            [ 1]  387 	jreq	00117$
      008464                        388 00207$:
      008464 1E 05            [ 2]  389 	ldw	x, (0x05, sp)
      008466 26 04            [ 1]  390 	jrne	00208$
      008468 1E 03            [ 2]  391 	ldw	x, (0x03, sp)
      00846A 27 32            [ 1]  392 	jreq	00117$
      00846C                        393 00208$:
                                    394 ;	../src/diskio.c: 146: SD_WriteByte(*buff);
      00846C 1E 01            [ 2]  395 	ldw	x, (0x01, sp)
      00846E F6               [ 1]  396 	ld	a, (x)
      00846F 88               [ 1]  397 	push	a
      008470 CD 8F E2         [ 4]  398 	call	_SD_WriteByte
      008473 84               [ 1]  399 	pop	a
                                    400 ;	../src/diskio.c: 148: buff++;byteLeft--;sc--;
      008474 1E 01            [ 2]  401 	ldw	x, (0x01, sp)
      008476 5C               [ 1]  402 	incw	x
      008477 1F 01            [ 2]  403 	ldw	(0x01, sp), x
      008479 CE 02 0B         [ 2]  404 	ldw	x, _disk_writep_byteLeft_65536_355+2
      00847C 1D 00 01         [ 2]  405 	subw	x, #0x0001
      00847F 90 CE 02 09      [ 2]  406 	ldw	y, _disk_writep_byteLeft_65536_355+0
      008483 24 02            [ 1]  407 	jrnc	00210$
      008485 90 5A            [ 2]  408 	decw	y
      008487                        409 00210$:
      008487 CF 02 0B         [ 2]  410 	ldw	_disk_writep_byteLeft_65536_355+2, x
      00848A 90 CF 02 09      [ 2]  411 	ldw	_disk_writep_byteLeft_65536_355+0, y
      00848E 1E 05            [ 2]  412 	ldw	x, (0x05, sp)
      008490 1D 00 01         [ 2]  413 	subw	x, #0x0001
      008493 1F 05            [ 2]  414 	ldw	(0x05, sp), x
      008495 1E 03            [ 2]  415 	ldw	x, (0x03, sp)
      008497 24 01            [ 1]  416 	jrnc	00211$
      008499 5A               [ 2]  417 	decw	x
      00849A                        418 00211$:
      00849A 1F 03            [ 2]  419 	ldw	(0x03, sp), x
      00849C 20 BC            [ 2]  420 	jra	00115$
      00849E                        421 00117$:
                                    422 ;	../src/diskio.c: 150: res = RES_OK;
      00849E 0F 02            [ 1]  423 	clr	(0x02, sp)
      0084A0                        424 00120$:
                                    425 ;	../src/diskio.c: 153: return res;
      0084A0 7B 02            [ 1]  426 	ld	a, (0x02, sp)
                                    427 ;	../src/diskio.c: 154: }
      0084A2 5B 06            [ 2]  428 	addw	sp, #6
      0084A4 81               [ 4]  429 	ret
                                    430 	.area CODE
                                    431 	.area CONST
                                    432 	.area INITIALIZER
                                    433 	.area CABS (ABS)
