                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.1.0 #12072 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module mmcsd
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _SD_GetResponseVal
                                     12 	.globl _dly
                                     13 	.globl _SD_Init
                                     14 	.globl _SD_Detect
                                     15 	.globl _SD_SendCmd
                                     16 	.globl _SD_GetDataResponse
                                     17 	.globl _SD_GetResponse
                                     18 	.globl _SD_GoIdleState
                                     19 	.globl _SD_WriteByte
                                     20 	.globl _SD_ReadByte
                                     21 	.globl _SD_LowLevel_Init
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area INITIALIZED
                                     30 ;--------------------------------------------------------
                                     31 ; absolute external ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area DABS (ABS)
                                     34 
                                     35 ; default segment ordering for linker
                                     36 	.area HOME
                                     37 	.area GSINIT
                                     38 	.area GSFINAL
                                     39 	.area CONST
                                     40 	.area INITIALIZER
                                     41 	.area CODE
                                     42 
                                     43 ;--------------------------------------------------------
                                     44 ; global & static initialisations
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area GSINIT
                                     48 	.area GSFINAL
                                     49 	.area GSINIT
                                     50 ;--------------------------------------------------------
                                     51 ; Home
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
                                     54 	.area HOME
                                     55 ;--------------------------------------------------------
                                     56 ; code
                                     57 ;--------------------------------------------------------
                                     58 	.area CODE
                                     59 ;	../src/mmcsd.c: 90: uint8_t SD_Init(void)
                                     60 ;	-----------------------------------------
                                     61 ;	 function SD_Init
                                     62 ;	-----------------------------------------
      008C0D                         63 _SD_Init:
      008C0D 52 04            [ 2]   64 	sub	sp, #4
                                     65 ;	../src/mmcsd.c: 96: SD_LowLevel_Init();
      008C0F CD 8E C4         [ 4]   66 	call	_SD_LowLevel_Init
                                     67 ;	../src/mmcsd.c: 99: SD_CS_LOW();
      008C12 72 19 50 0A      [ 1]   68 	bres	20490, #4
                                     69 ;	../src/mmcsd.c: 103: for (i = 0; i <= 9; i++)
      008C16 5F               [ 1]   70 	clrw	x
      008C17 1F 03            [ 2]   71 	ldw	(0x03, sp), x
      008C19 1F 01            [ 2]   72 	ldw	(0x01, sp), x
      008C1B                         73 00104$:
                                     74 ;	../src/mmcsd.c: 106: SD_WriteByte(SD_DUMMY_BYTE);
      008C1B 4B FF            [ 1]   75 	push	#0xff
      008C1D CD 8E A6         [ 4]   76 	call	_SD_WriteByte
      008C20 84               [ 1]   77 	pop	a
                                     78 ;	../src/mmcsd.c: 103: for (i = 0; i <= 9; i++)
      008C21 1E 03            [ 2]   79 	ldw	x, (0x03, sp)
      008C23 5C               [ 1]   80 	incw	x
      008C24 1F 03            [ 2]   81 	ldw	(0x03, sp), x
      008C26 26 05            [ 1]   82 	jrne	00119$
      008C28 1E 01            [ 2]   83 	ldw	x, (0x01, sp)
      008C2A 5C               [ 1]   84 	incw	x
      008C2B 1F 01            [ 2]   85 	ldw	(0x01, sp), x
      008C2D                         86 00119$:
      008C2D AE 00 09         [ 2]   87 	ldw	x, #0x0009
      008C30 13 03            [ 2]   88 	cpw	x, (0x03, sp)
      008C32 4F               [ 1]   89 	clr	a
      008C33 12 02            [ 1]   90 	sbc	a, (0x02, sp)
      008C35 4F               [ 1]   91 	clr	a
      008C36 12 01            [ 1]   92 	sbc	a, (0x01, sp)
      008C38 24 E1            [ 1]   93 	jrnc	00104$
                                     94 ;	../src/mmcsd.c: 110: res = SD_GoIdleState();
      008C3A CD 8D 77         [ 4]   95 	call	_SD_GoIdleState
                                     96 ;	../src/mmcsd.c: 116: return (res);
      008C3D 4F               [ 1]   97 	clr	a
                                     98 ;	../src/mmcsd.c: 117: }
      008C3E 5B 04            [ 2]   99 	addw	sp, #4
      008C40 81               [ 4]  100 	ret
                                    101 ;	../src/mmcsd.c: 124: uint8_t SD_Detect(void)
                                    102 ;	-----------------------------------------
                                    103 ;	 function SD_Detect
                                    104 ;	-----------------------------------------
      008C41                        105 _SD_Detect:
      008C41 88               [ 1]  106 	push	a
                                    107 ;	../src/mmcsd.c: 126: __IO uint8_t status = SD_PRESENT;
                                    108 ;	../src/mmcsd.c: 136: return SD_PRESENT;
      008C42 A6 01            [ 1]  109 	ld	a, #0x01
      008C44 6B 01            [ 1]  110 	ld	(0x01, sp), a
                                    111 ;	../src/mmcsd.c: 138: }
      008C46 5B 01            [ 2]  112 	addw	sp, #1
      008C48 81               [ 4]  113 	ret
                                    114 ;	../src/mmcsd.c: 663: void SD_SendCmd(uint8_t Cmd, uint32_t Arg, uint8_t Crc)
                                    115 ;	-----------------------------------------
                                    116 ;	 function SD_SendCmd
                                    117 ;	-----------------------------------------
      008C49                        118 _SD_SendCmd:
      008C49 52 0A            [ 2]  119 	sub	sp, #10
                                    120 ;	../src/mmcsd.c: 669: Frame[0] = (uint8_t)(Cmd | 0x40); /*!< Construct byte 1 */
      008C4B 7B 0D            [ 1]  121 	ld	a, (0x0d, sp)
      008C4D AA 40            [ 1]  122 	or	a, #0x40
      008C4F 6B 01            [ 1]  123 	ld	(0x01, sp), a
                                    124 ;	../src/mmcsd.c: 671: Frame[1] = (uint8_t)(Arg >> 24); /*!< Construct byte 2 */
      008C51 96               [ 1]  125 	ldw	x, sp
      008C52 5C               [ 1]  126 	incw	x
      008C53 5C               [ 1]  127 	incw	x
      008C54 7B 0E            [ 1]  128 	ld	a, (0x0e, sp)
      008C56 0F 07            [ 1]  129 	clr	(0x07, sp)
      008C58 F7               [ 1]  130 	ld	(x), a
                                    131 ;	../src/mmcsd.c: 673: Frame[2] = (uint8_t)(Arg >> 16); /*!< Construct byte 3 */
      008C59 96               [ 1]  132 	ldw	x, sp
      008C5A 1C 00 03         [ 2]  133 	addw	x, #3
      008C5D 16 0E            [ 2]  134 	ldw	y, (0x0e, sp)
      008C5F 0F 07            [ 1]  135 	clr	(0x07, sp)
      008C61 90 9F            [ 1]  136 	ld	a, yl
      008C63 F7               [ 1]  137 	ld	(x), a
                                    138 ;	../src/mmcsd.c: 675: Frame[3] = (uint8_t)(Arg >> 8); /*!< Construct byte 4 */
      008C64 96               [ 1]  139 	ldw	x, sp
      008C65 1C 00 04         [ 2]  140 	addw	x, #4
      008C68 16 10            [ 2]  141 	ldw	y, (0x10, sp)
      008C6A 90 9E            [ 1]  142 	ld	a, yh
      008C6C F7               [ 1]  143 	ld	(x), a
                                    144 ;	../src/mmcsd.c: 677: Frame[4] = (uint8_t)(Arg); /*!< Construct byte 5 */
      008C6D 96               [ 1]  145 	ldw	x, sp
      008C6E 7B 11            [ 1]  146 	ld	a, (0x11, sp)
      008C70 E7 05            [ 1]  147 	ld	(5, x), a
                                    148 ;	../src/mmcsd.c: 679: Frame[5] = (Crc); /*!< Construct CRC: byte 6 */
      008C72 96               [ 1]  149 	ldw	x, sp
      008C73 7B 12            [ 1]  150 	ld	a, (0x12, sp)
      008C75 E7 06            [ 1]  151 	ld	(6, x), a
                                    152 ;	../src/mmcsd.c: 681: for (i = 0; i < 6; i++)
      008C77 5F               [ 1]  153 	clrw	x
      008C78 1F 09            [ 2]  154 	ldw	(0x09, sp), x
      008C7A 1F 07            [ 2]  155 	ldw	(0x07, sp), x
      008C7C                        156 00102$:
                                    157 ;	../src/mmcsd.c: 683: SD_WriteByte(Frame[i]); /*!< Send the Cmd bytes */
      008C7C 96               [ 1]  158 	ldw	x, sp
      008C7D 5C               [ 1]  159 	incw	x
      008C7E 72 FB 09         [ 2]  160 	addw	x, (0x09, sp)
      008C81 F6               [ 1]  161 	ld	a, (x)
      008C82 88               [ 1]  162 	push	a
      008C83 CD 8E A6         [ 4]  163 	call	_SD_WriteByte
      008C86 84               [ 1]  164 	pop	a
                                    165 ;	../src/mmcsd.c: 681: for (i = 0; i < 6; i++)
      008C87 1E 09            [ 2]  166 	ldw	x, (0x09, sp)
      008C89 5C               [ 1]  167 	incw	x
      008C8A 1F 09            [ 2]  168 	ldw	(0x09, sp), x
      008C8C 26 05            [ 1]  169 	jrne	00112$
      008C8E 1E 07            [ 2]  170 	ldw	x, (0x07, sp)
      008C90 5C               [ 1]  171 	incw	x
      008C91 1F 07            [ 2]  172 	ldw	(0x07, sp), x
      008C93                        173 00112$:
      008C93 1E 09            [ 2]  174 	ldw	x, (0x09, sp)
      008C95 A3 00 06         [ 2]  175 	cpw	x, #0x0006
      008C98 7B 08            [ 1]  176 	ld	a, (0x08, sp)
      008C9A A2 00            [ 1]  177 	sbc	a, #0x00
      008C9C 7B 07            [ 1]  178 	ld	a, (0x07, sp)
      008C9E A2 00            [ 1]  179 	sbc	a, #0x00
      008CA0 25 DA            [ 1]  180 	jrc	00102$
                                    181 ;	../src/mmcsd.c: 685: }
      008CA2 5B 0A            [ 2]  182 	addw	sp, #10
      008CA4 81               [ 4]  183 	ret
                                    184 ;	../src/mmcsd.c: 699: uint8_t SD_GetDataResponse(void)
                                    185 ;	-----------------------------------------
                                    186 ;	 function SD_GetDataResponse
                                    187 ;	-----------------------------------------
      008CA5                        188 _SD_GetDataResponse:
      008CA5 52 05            [ 2]  189 	sub	sp, #5
                                    190 ;	../src/mmcsd.c: 702: uint8_t response = 0, rvalue = 0;
      008CA7 0F 01            [ 1]  191 	clr	(0x01, sp)
                                    192 ;	../src/mmcsd.c: 704: while (i <= 64)
      008CA9 5F               [ 1]  193 	clrw	x
      008CAA 1F 04            [ 2]  194 	ldw	(0x04, sp), x
      008CAC 1F 02            [ 2]  195 	ldw	(0x02, sp), x
      008CAE                        196 00108$:
      008CAE AE 00 40         [ 2]  197 	ldw	x, #0x0040
      008CB1 13 04            [ 2]  198 	cpw	x, (0x04, sp)
      008CB3 4F               [ 1]  199 	clr	a
      008CB4 12 03            [ 1]  200 	sbc	a, (0x03, sp)
      008CB6 4F               [ 1]  201 	clr	a
      008CB7 12 02            [ 1]  202 	sbc	a, (0x02, sp)
      008CB9 25 39            [ 1]  203 	jrc	00111$
                                    204 ;	../src/mmcsd.c: 707: response = SD_ReadByte();
      008CBB CD 8E B6         [ 4]  205 	call	_SD_ReadByte
                                    206 ;	../src/mmcsd.c: 709: response &= 0x1F;
      008CBE A4 1F            [ 1]  207 	and	a, #0x1f
                                    208 ;	../src/mmcsd.c: 710: switch (response)
      008CC0 6B 01            [ 1]  209 	ld	(0x01, sp), a
      008CC2 A1 05            [ 1]  210 	cp	a, #0x05
      008CC4 27 0E            [ 1]  211 	jreq	00101$
      008CC6 7B 01            [ 1]  212 	ld	a, (0x01, sp)
      008CC8 A1 0B            [ 1]  213 	cp	a, #0x0b
      008CCA 27 0C            [ 1]  214 	jreq	00102$
      008CCC 7B 01            [ 1]  215 	ld	a, (0x01, sp)
      008CCE A1 0D            [ 1]  216 	cp	a, #0x0d
      008CD0 27 0A            [ 1]  217 	jreq	00103$
      008CD2 20 0C            [ 2]  218 	jra	00104$
                                    219 ;	../src/mmcsd.c: 712: case SD_DATA_OK:
      008CD4                        220 00101$:
                                    221 ;	../src/mmcsd.c: 714: rvalue = SD_DATA_OK;
      008CD4 A6 05            [ 1]  222 	ld	a, #0x05
                                    223 ;	../src/mmcsd.c: 715: break;
      008CD6 20 0A            [ 2]  224 	jra	00105$
                                    225 ;	../src/mmcsd.c: 717: case SD_DATA_CRC_ERROR:
      008CD8                        226 00102$:
                                    227 ;	../src/mmcsd.c: 718: return SD_DATA_CRC_ERROR;
      008CD8 A6 0B            [ 1]  228 	ld	a, #0x0b
      008CDA 20 20            [ 2]  229 	jra	00114$
                                    230 ;	../src/mmcsd.c: 719: case SD_DATA_WRITE_ERROR:
      008CDC                        231 00103$:
                                    232 ;	../src/mmcsd.c: 720: return SD_DATA_WRITE_ERROR;
      008CDC A6 0D            [ 1]  233 	ld	a, #0x0d
      008CDE 20 1C            [ 2]  234 	jra	00114$
                                    235 ;	../src/mmcsd.c: 721: default:
      008CE0                        236 00104$:
                                    237 ;	../src/mmcsd.c: 723: rvalue = SD_DATA_OTHER_ERROR;
      008CE0 A6 FF            [ 1]  238 	ld	a, #0xff
                                    239 ;	../src/mmcsd.c: 726: }
      008CE2                        240 00105$:
                                    241 ;	../src/mmcsd.c: 728: if (rvalue == SD_DATA_OK)
      008CE2 A1 05            [ 1]  242 	cp	a, #0x05
      008CE4 27 0E            [ 1]  243 	jreq	00111$
                                    244 ;	../src/mmcsd.c: 731: i++;
      008CE6 1E 04            [ 2]  245 	ldw	x, (0x04, sp)
      008CE8 5C               [ 1]  246 	incw	x
      008CE9 1F 04            [ 2]  247 	ldw	(0x04, sp), x
      008CEB 26 C1            [ 1]  248 	jrne	00108$
      008CED 1E 02            [ 2]  249 	ldw	x, (0x02, sp)
      008CEF 5C               [ 1]  250 	incw	x
      008CF0 1F 02            [ 2]  251 	ldw	(0x02, sp), x
      008CF2 20 BA            [ 2]  252 	jra	00108$
                                    253 ;	../src/mmcsd.c: 735: while (SD_ReadByte() == 0);
      008CF4                        254 00111$:
      008CF4 CD 8E B6         [ 4]  255 	call	_SD_ReadByte
      008CF7 4D               [ 1]  256 	tnz	a
      008CF8 27 FA            [ 1]  257 	jreq	00111$
                                    258 ;	../src/mmcsd.c: 738: return response;
      008CFA 7B 01            [ 1]  259 	ld	a, (0x01, sp)
      008CFC                        260 00114$:
                                    261 ;	../src/mmcsd.c: 739: }
      008CFC 5B 05            [ 2]  262 	addw	sp, #5
      008CFE 81               [ 4]  263 	ret
                                    264 ;	../src/mmcsd.c: 748: uint8_t SD_GetResponse(uint8_t Response)
                                    265 ;	-----------------------------------------
                                    266 ;	 function SD_GetResponse
                                    267 ;	-----------------------------------------
      008CFF                        268 _SD_GetResponse:
                                    269 ;	../src/mmcsd.c: 753: while ((SD_ReadByte() != Response) && Count) 
      008CFF AE 0F FF         [ 2]  270 	ldw	x, #0x0fff
      008D02 90 5F            [ 1]  271 	clrw	y
      008D04                        272 00102$:
      008D04 89               [ 2]  273 	pushw	x
      008D05 90 89            [ 2]  274 	pushw	y
      008D07 CD 8E B6         [ 4]  275 	call	_SD_ReadByte
      008D0A 90 85            [ 2]  276 	popw	y
      008D0C 85               [ 2]  277 	popw	x
      008D0D 11 03            [ 1]  278 	cp	a, (0x03, sp)
      008D0F 27 10            [ 1]  279 	jreq	00104$
      008D11 5D               [ 2]  280 	tnzw	x
      008D12 26 04            [ 1]  281 	jrne	00134$
      008D14 90 5D            [ 2]  282 	tnzw	y
      008D16 27 09            [ 1]  283 	jreq	00104$
      008D18                        284 00134$:
                                    285 ;	../src/mmcsd.c: 755: Count--;
      008D18 1D 00 01         [ 2]  286 	subw	x, #0x0001
      008D1B 24 E7            [ 1]  287 	jrnc	00102$
      008D1D 90 5A            [ 2]  288 	decw	y
      008D1F 20 E3            [ 2]  289 	jra	00102$
      008D21                        290 00104$:
                                    291 ;	../src/mmcsd.c: 757: if (Count == 0)
      008D21 5D               [ 2]  292 	tnzw	x
      008D22 26 07            [ 1]  293 	jrne	00106$
      008D24 90 5D            [ 2]  294 	tnzw	y
      008D26 26 03            [ 1]  295 	jrne	00106$
                                    296 ;	../src/mmcsd.c: 760: return SD_RESPONSE_FAILURE;
      008D28 A6 FF            [ 1]  297 	ld	a, #0xff
      008D2A 81               [ 4]  298 	ret
      008D2B                        299 00106$:
                                    300 ;	../src/mmcsd.c: 765: return SD_RESPONSE_NO_ERROR;
      008D2B 4F               [ 1]  301 	clr	a
                                    302 ;	../src/mmcsd.c: 767: }
      008D2C 81               [ 4]  303 	ret
                                    304 ;	../src/mmcsd.c: 772: void SD_GetResponseVal(uint8_t *pResp, uint8_t response)
                                    305 ;	-----------------------------------------
                                    306 ;	 function SD_GetResponseVal
                                    307 ;	-----------------------------------------
      008D2D                        308 _SD_GetResponseVal:
                                    309 ;	../src/mmcsd.c: 775: if(SD_GetResponse(response) == SD_RESPONSE_FAILURE)
      008D2D 7B 05            [ 1]  310 	ld	a, (0x05, sp)
      008D2F 88               [ 1]  311 	push	a
      008D30 CD 8C FF         [ 4]  312 	call	_SD_GetResponse
      008D33 5B 01            [ 2]  313 	addw	sp, #1
                                    314 ;	../src/mmcsd.c: 777: *pResp++ = 0xff;
      008D35 16 03            [ 2]  315 	ldw	y, (0x03, sp)
      008D37 93               [ 1]  316 	ldw	x, y
      008D38 5C               [ 1]  317 	incw	x
                                    318 ;	../src/mmcsd.c: 775: if(SD_GetResponse(response) == SD_RESPONSE_FAILURE)
      008D39 4C               [ 1]  319 	inc	a
      008D3A 26 08            [ 1]  320 	jrne	00102$
                                    321 ;	../src/mmcsd.c: 777: *pResp++ = 0xff;
      008D3C A6 FF            [ 1]  322 	ld	a, #0xff
      008D3E 90 F7            [ 1]  323 	ld	(y), a
      008D40 1F 03            [ 2]  324 	ldw	(0x03, sp), x
      008D42 20 06            [ 2]  325 	jra	00103$
      008D44                        326 00102$:
                                    327 ;	../src/mmcsd.c: 779: *pResp++ = response;
      008D44 7B 05            [ 1]  328 	ld	a, (0x05, sp)
      008D46 90 F7            [ 1]  329 	ld	(y), a
      008D48 1F 03            [ 2]  330 	ldw	(0x03, sp), x
      008D4A                        331 00103$:
                                    332 ;	../src/mmcsd.c: 782: *pResp++ = SD_ReadByte();
      008D4A 1E 03            [ 2]  333 	ldw	x, (0x03, sp)
      008D4C 89               [ 2]  334 	pushw	x
      008D4D CD 8E B6         [ 4]  335 	call	_SD_ReadByte
      008D50 85               [ 2]  336 	popw	x
      008D51 F7               [ 1]  337 	ld	(x), a
      008D52 5C               [ 1]  338 	incw	x
                                    339 ;	../src/mmcsd.c: 783: *pResp++ = SD_ReadByte();
      008D53 1F 03            [ 2]  340 	ldw	(0x03, sp), x
      008D55 89               [ 2]  341 	pushw	x
      008D56 CD 8E B6         [ 4]  342 	call	_SD_ReadByte
      008D59 85               [ 2]  343 	popw	x
      008D5A F7               [ 1]  344 	ld	(x), a
      008D5B 5C               [ 1]  345 	incw	x
                                    346 ;	../src/mmcsd.c: 784: *pResp++ = SD_ReadByte();
      008D5C 1F 03            [ 2]  347 	ldw	(0x03, sp), x
      008D5E 89               [ 2]  348 	pushw	x
      008D5F CD 8E B6         [ 4]  349 	call	_SD_ReadByte
      008D62 85               [ 2]  350 	popw	x
      008D63 F7               [ 1]  351 	ld	(x), a
      008D64 5C               [ 1]  352 	incw	x
                                    353 ;	../src/mmcsd.c: 785: *pResp++ = SD_ReadByte();
      008D65 1F 03            [ 2]  354 	ldw	(0x03, sp), x
      008D67 89               [ 2]  355 	pushw	x
      008D68 CD 8E B6         [ 4]  356 	call	_SD_ReadByte
      008D6B 85               [ 2]  357 	popw	x
      008D6C F7               [ 1]  358 	ld	(x), a
      008D6D 5C               [ 1]  359 	incw	x
                                    360 ;	../src/mmcsd.c: 786: *pResp = SD_ReadByte();
      008D6E 1F 03            [ 2]  361 	ldw	(0x03, sp), x
      008D70 89               [ 2]  362 	pushw	x
      008D71 CD 8E B6         [ 4]  363 	call	_SD_ReadByte
      008D74 85               [ 2]  364 	popw	x
      008D75 F7               [ 1]  365 	ld	(x), a
                                    366 ;	../src/mmcsd.c: 787: }
      008D76 81               [ 4]  367 	ret
                                    368 ;	../src/mmcsd.c: 871: uint8_t SD_GoIdleState(void)
                                    369 ;	-----------------------------------------
                                    370 ;	 function SD_GoIdleState
                                    371 ;	-----------------------------------------
      008D77                        372 _SD_GoIdleState:
      008D77 52 0A            [ 2]  373 	sub	sp, #10
                                    374 ;	../src/mmcsd.c: 874: uint8_t resp[6] = {0};
      008D79 0F 01            [ 1]  375 	clr	(0x01, sp)
      008D7B 96               [ 1]  376 	ldw	x, sp
      008D7C 5C               [ 1]  377 	incw	x
      008D7D 5C               [ 1]  378 	incw	x
      008D7E 7F               [ 1]  379 	clr	(x)
      008D7F 96               [ 1]  380 	ldw	x, sp
      008D80 6F 03            [ 1]  381 	clr	(3, x)
      008D82 96               [ 1]  382 	ldw	x, sp
      008D83 1C 00 04         [ 2]  383 	addw	x, #4
      008D86 1F 07            [ 2]  384 	ldw	(0x07, sp), x
      008D88 7F               [ 1]  385 	clr	(x)
      008D89 96               [ 1]  386 	ldw	x, sp
      008D8A 1C 00 05         [ 2]  387 	addw	x, #5
      008D8D 1F 09            [ 2]  388 	ldw	(0x09, sp), x
      008D8F 7F               [ 1]  389 	clr	(x)
      008D90 96               [ 1]  390 	ldw	x, sp
      008D91 1C 00 06         [ 2]  391 	addw	x, #6
      008D94 7F               [ 1]  392 	clr	(x)
                                    393 ;	../src/mmcsd.c: 876: SD_CS_LOW();
      008D95 C6 50 0A         [ 1]  394 	ld	a, 0x500a
      008D98 A4 EF            [ 1]  395 	and	a, #0xef
      008D9A C7 50 0A         [ 1]  396 	ld	0x500a, a
                                    397 ;	../src/mmcsd.c: 879: SD_SendCmd(SD_CMD_GO_IDLE_STATE, (uint32_t)0, 0x95);
      008D9D 4B 95            [ 1]  398 	push	#0x95
      008D9F 5F               [ 1]  399 	clrw	x
      008DA0 89               [ 2]  400 	pushw	x
      008DA1 5F               [ 1]  401 	clrw	x
      008DA2 89               [ 2]  402 	pushw	x
      008DA3 4B 00            [ 1]  403 	push	#0x00
      008DA5 CD 8C 49         [ 4]  404 	call	_SD_SendCmd
      008DA8 5B 06            [ 2]  405 	addw	sp, #6
                                    406 ;	../src/mmcsd.c: 882: if (SD_GetResponse(SD_IN_IDLE_STATE))
      008DAA 4B 01            [ 1]  407 	push	#0x01
      008DAC CD 8C FF         [ 4]  408 	call	_SD_GetResponse
      008DAF 5B 01            [ 2]  409 	addw	sp, #1
      008DB1 4D               [ 1]  410 	tnz	a
      008DB2 27 05            [ 1]  411 	jreq	00102$
                                    412 ;	../src/mmcsd.c: 885: return SD_RESPONSE_FAILURE;
      008DB4 A6 FF            [ 1]  413 	ld	a, #0xff
      008DB6 CC 8E A3         [ 2]  414 	jp	00116$
      008DB9                        415 00102$:
                                    416 ;	../src/mmcsd.c: 888: SD_SendCmd(SD_CMD_IF_COND, (uint32_t)0x156, 0x43);
      008DB9 4B 43            [ 1]  417 	push	#0x43
      008DBB 4B 56            [ 1]  418 	push	#0x56
      008DBD 4B 01            [ 1]  419 	push	#0x01
      008DBF 5F               [ 1]  420 	clrw	x
      008DC0 89               [ 2]  421 	pushw	x
      008DC1 4B 08            [ 1]  422 	push	#0x08
      008DC3 CD 8C 49         [ 4]  423 	call	_SD_SendCmd
      008DC6 5B 06            [ 2]  424 	addw	sp, #6
                                    425 ;	../src/mmcsd.c: 889: SD_GetResponseVal(resp,0x01);
      008DC8 4B 01            [ 1]  426 	push	#0x01
      008DCA 96               [ 1]  427 	ldw	x, sp
      008DCB 5C               [ 1]  428 	incw	x
      008DCC 5C               [ 1]  429 	incw	x
      008DCD 89               [ 2]  430 	pushw	x
      008DCE CD 8D 2D         [ 4]  431 	call	_SD_GetResponseVal
      008DD1 5B 03            [ 2]  432 	addw	sp, #3
                                    433 ;	../src/mmcsd.c: 890: if(resp[0]==0x01){
      008DD3 7B 01            [ 1]  434 	ld	a, (0x01, sp)
      008DD5 4A               [ 1]  435 	dec	a
      008DD6 26 77            [ 1]  436 	jrne	00123$
                                    437 ;	../src/mmcsd.c: 892: if ((resp[3] == 0x01)&&(resp[4] == 0x56)){
      008DD8 1E 07            [ 2]  438 	ldw	x, (0x07, sp)
      008DDA F6               [ 1]  439 	ld	a, (x)
      008DDB 4A               [ 1]  440 	dec	a
      008DDC 26 6D            [ 1]  441 	jrne	00107$
      008DDE 1E 09            [ 2]  442 	ldw	x, (0x09, sp)
      008DE0 F6               [ 1]  443 	ld	a, (x)
      008DE1 A1 56            [ 1]  444 	cp	a, #0x56
      008DE3 26 66            [ 1]  445 	jrne	00107$
                                    446 ;	../src/mmcsd.c: 895: do{
      008DE5                        447 00103$:
                                    448 ;	../src/mmcsd.c: 896: SD_SendCmd(SD_CMD_55, (uint32_t)0, 0x01);
      008DE5 4B 01            [ 1]  449 	push	#0x01
      008DE7 5F               [ 1]  450 	clrw	x
      008DE8 89               [ 2]  451 	pushw	x
      008DE9 5F               [ 1]  452 	clrw	x
      008DEA 89               [ 2]  453 	pushw	x
      008DEB 4B 37            [ 1]  454 	push	#0x37
      008DED CD 8C 49         [ 4]  455 	call	_SD_SendCmd
      008DF0 5B 06            [ 2]  456 	addw	sp, #6
                                    457 ;	../src/mmcsd.c: 897: SD_GetResponseVal(resp,0x01);
      008DF2 4B 01            [ 1]  458 	push	#0x01
      008DF4 96               [ 1]  459 	ldw	x, sp
      008DF5 5C               [ 1]  460 	incw	x
      008DF6 5C               [ 1]  461 	incw	x
      008DF7 89               [ 2]  462 	pushw	x
      008DF8 CD 8D 2D         [ 4]  463 	call	_SD_GetResponseVal
      008DFB 5B 03            [ 2]  464 	addw	sp, #3
                                    465 ;	../src/mmcsd.c: 898: dly((uint32_t)100);
      008DFD 4B 64            [ 1]  466 	push	#0x64
      008DFF 5F               [ 1]  467 	clrw	x
      008E00 89               [ 2]  468 	pushw	x
      008E01 4B 00            [ 1]  469 	push	#0x00
      008E03 CD 84 B9         [ 4]  470 	call	_dly
      008E06 5B 04            [ 2]  471 	addw	sp, #4
                                    472 ;	../src/mmcsd.c: 899: SD_SendCmd(SD_ACMD_41&0x7f, (1UL<<30), 0x1);
      008E08 4B 01            [ 1]  473 	push	#0x01
      008E0A 5F               [ 1]  474 	clrw	x
      008E0B 89               [ 2]  475 	pushw	x
      008E0C 4B 00            [ 1]  476 	push	#0x00
      008E0E 4B 40            [ 1]  477 	push	#0x40
      008E10 4B 69            [ 1]  478 	push	#0x69
      008E12 CD 8C 49         [ 4]  479 	call	_SD_SendCmd
      008E15 5B 06            [ 2]  480 	addw	sp, #6
                                    481 ;	../src/mmcsd.c: 900: dly((uint32_t)10000);
      008E17 4B 10            [ 1]  482 	push	#0x10
      008E19 4B 27            [ 1]  483 	push	#0x27
      008E1B 5F               [ 1]  484 	clrw	x
      008E1C 89               [ 2]  485 	pushw	x
      008E1D CD 84 B9         [ 4]  486 	call	_dly
      008E20 5B 04            [ 2]  487 	addw	sp, #4
                                    488 ;	../src/mmcsd.c: 901: SD_GetResponseVal(resp,0x00);
      008E22 96               [ 1]  489 	ldw	x, sp
      008E23 5C               [ 1]  490 	incw	x
      008E24 4B 00            [ 1]  491 	push	#0x00
      008E26 89               [ 2]  492 	pushw	x
      008E27 CD 8D 2D         [ 4]  493 	call	_SD_GetResponseVal
      008E2A 5B 03            [ 2]  494 	addw	sp, #3
                                    495 ;	../src/mmcsd.c: 902: } while(resp[0]); //until resved 0x0
      008E2C 7B 01            [ 1]  496 	ld	a, (0x01, sp)
      008E2E 26 B5            [ 1]  497 	jrne	00103$
                                    498 ;	../src/mmcsd.c: 904: SD_SendCmd(SD_CMD_58, (uint32_t)0,0x01);
      008E30 4B 01            [ 1]  499 	push	#0x01
      008E32 5F               [ 1]  500 	clrw	x
      008E33 89               [ 2]  501 	pushw	x
      008E34 5F               [ 1]  502 	clrw	x
      008E35 89               [ 2]  503 	pushw	x
      008E36 4B 3A            [ 1]  504 	push	#0x3a
      008E38 CD 8C 49         [ 4]  505 	call	_SD_SendCmd
      008E3B 5B 06            [ 2]  506 	addw	sp, #6
                                    507 ;	../src/mmcsd.c: 905: SD_GetResponseVal(resp,58);
      008E3D 4B 3A            [ 1]  508 	push	#0x3a
      008E3F 96               [ 1]  509 	ldw	x, sp
      008E40 5C               [ 1]  510 	incw	x
      008E41 5C               [ 1]  511 	incw	x
      008E42 89               [ 2]  512 	pushw	x
      008E43 CD 8D 2D         [ 4]  513 	call	_SD_GetResponseVal
      008E46 5B 03            [ 2]  514 	addw	sp, #3
                                    515 ;	../src/mmcsd.c: 906: return SD_RESPONSE_NO_ERROR;
      008E48 4F               [ 1]  516 	clr	a
      008E49 20 58            [ 2]  517 	jra	00116$
      008E4B                        518 00107$:
                                    519 ;	../src/mmcsd.c: 909: return SD_RESPONSE_FAILURE;
      008E4B A6 FF            [ 1]  520 	ld	a, #0xff
      008E4D 20 54            [ 2]  521 	jra	00116$
                                    522 ;	../src/mmcsd.c: 914: do{
      008E4F                        523 00123$:
      008E4F                        524 00110$:
                                    525 ;	../src/mmcsd.c: 915: SD_SendCmd(SD_CMD_55, 0, 0x01);
      008E4F 4B 01            [ 1]  526 	push	#0x01
      008E51 5F               [ 1]  527 	clrw	x
      008E52 89               [ 2]  528 	pushw	x
      008E53 5F               [ 1]  529 	clrw	x
      008E54 89               [ 2]  530 	pushw	x
      008E55 4B 37            [ 1]  531 	push	#0x37
      008E57 CD 8C 49         [ 4]  532 	call	_SD_SendCmd
      008E5A 5B 06            [ 2]  533 	addw	sp, #6
                                    534 ;	../src/mmcsd.c: 916: SD_GetResponseVal(resp,0x01);
      008E5C 96               [ 1]  535 	ldw	x, sp
      008E5D 5C               [ 1]  536 	incw	x
      008E5E 4B 01            [ 1]  537 	push	#0x01
      008E60 89               [ 2]  538 	pushw	x
      008E61 CD 8D 2D         [ 4]  539 	call	_SD_GetResponseVal
      008E64 5B 03            [ 2]  540 	addw	sp, #3
                                    541 ;	../src/mmcsd.c: 917: dly((uint32_t)10000);
      008E66 4B 10            [ 1]  542 	push	#0x10
      008E68 4B 27            [ 1]  543 	push	#0x27
      008E6A 5F               [ 1]  544 	clrw	x
      008E6B 89               [ 2]  545 	pushw	x
      008E6C CD 84 B9         [ 4]  546 	call	_dly
      008E6F 5B 04            [ 2]  547 	addw	sp, #4
                                    548 ;	../src/mmcsd.c: 918: SD_SendCmd(SD_ACMD_41&0x7f, 0UL, 0x1);
      008E71 4B 01            [ 1]  549 	push	#0x01
      008E73 5F               [ 1]  550 	clrw	x
      008E74 89               [ 2]  551 	pushw	x
      008E75 5F               [ 1]  552 	clrw	x
      008E76 89               [ 2]  553 	pushw	x
      008E77 4B 69            [ 1]  554 	push	#0x69
      008E79 CD 8C 49         [ 4]  555 	call	_SD_SendCmd
      008E7C 5B 06            [ 2]  556 	addw	sp, #6
                                    557 ;	../src/mmcsd.c: 919: SD_GetResponseVal(resp,0x00);
      008E7E 4B 00            [ 1]  558 	push	#0x00
      008E80 96               [ 1]  559 	ldw	x, sp
      008E81 5C               [ 1]  560 	incw	x
      008E82 5C               [ 1]  561 	incw	x
      008E83 89               [ 2]  562 	pushw	x
      008E84 CD 8D 2D         [ 4]  563 	call	_SD_GetResponseVal
      008E87 5B 03            [ 2]  564 	addw	sp, #3
                                    565 ;	../src/mmcsd.c: 920: dly((uint32_t)10000);
      008E89 4B 10            [ 1]  566 	push	#0x10
      008E8B 4B 27            [ 1]  567 	push	#0x27
      008E8D 5F               [ 1]  568 	clrw	x
      008E8E 89               [ 2]  569 	pushw	x
      008E8F CD 84 B9         [ 4]  570 	call	_dly
      008E92 5B 04            [ 2]  571 	addw	sp, #4
                                    572 ;	../src/mmcsd.c: 921: } while(resp[0]);
      008E94 7B 01            [ 1]  573 	ld	a, (0x01, sp)
      008E96 26 B7            [ 1]  574 	jrne	00110$
                                    575 ;	../src/mmcsd.c: 926: SD_CS_HIGH();
      008E98 72 18 50 0A      [ 1]  576 	bset	20490, #4
                                    577 ;	../src/mmcsd.c: 929: SD_WriteByte(SD_DUMMY_BYTE);
      008E9C 4B FF            [ 1]  578 	push	#0xff
      008E9E CD 8E A6         [ 4]  579 	call	_SD_WriteByte
      008EA1 84               [ 1]  580 	pop	a
                                    581 ;	../src/mmcsd.c: 931: return SD_RESPONSE_NO_ERROR;
      008EA2 4F               [ 1]  582 	clr	a
      008EA3                        583 00116$:
                                    584 ;	../src/mmcsd.c: 932: }
      008EA3 5B 0A            [ 2]  585 	addw	sp, #10
      008EA5 81               [ 4]  586 	ret
                                    587 ;	../src/mmcsd.c: 941: uint8_t SD_WriteByte(uint8_t Data)
                                    588 ;	-----------------------------------------
                                    589 ;	 function SD_WriteByte
                                    590 ;	-----------------------------------------
      008EA6                        591 _SD_WriteByte:
                                    592 ;	../src/mmcsd.c: 944: while (SPI->SR & (SPI_FLAG_TXE) == 0)
      008EA6 C6 52 03         [ 1]  593 	ld	a, 0x5203
                                    594 ;	../src/mmcsd.c: 948: SPI->DR = (Data);
      008EA9 AE 52 04         [ 2]  595 	ldw	x, #0x5204
      008EAC 7B 03            [ 1]  596 	ld	a, (0x03, sp)
      008EAE F7               [ 1]  597 	ld	(x), a
                                    598 ;	../src/mmcsd.c: 951: while (SPI->SR & (SPI_FLAG_RXNE) == 0)
      008EAF C6 52 03         [ 1]  599 	ld	a, 0x5203
                                    600 ;	../src/mmcsd.c: 955: return SPI->DR;
      008EB2 C6 52 04         [ 1]  601 	ld	a, 0x5204
                                    602 ;	../src/mmcsd.c: 956: }
      008EB5 81               [ 4]  603 	ret
                                    604 ;	../src/mmcsd.c: 963: uint8_t SD_ReadByte(void)
                                    605 ;	-----------------------------------------
                                    606 ;	 function SD_ReadByte
                                    607 ;	-----------------------------------------
      008EB6                        608 _SD_ReadByte:
                                    609 ;	../src/mmcsd.c: 968: while (SPI->SR&(SPI_FLAG_TXE) == 0)
      008EB6 C6 52 03         [ 1]  610 	ld	a, 0x5203
                                    611 ;	../src/mmcsd.c: 971: SPI->DR = SD_DUMMY_BYTE;
      008EB9 35 FF 52 04      [ 1]  612 	mov	0x5204+0, #0xff
                                    613 ;	../src/mmcsd.c: 974: while (SPI->SR&(SPI_FLAG_RXNE) == 0)
      008EBD C6 52 03         [ 1]  614 	ld	a, 0x5203
                                    615 ;	../src/mmcsd.c: 977: Data = (uint8_t)SPI->DR;
      008EC0 C6 52 04         [ 1]  616 	ld	a, 0x5204
                                    617 ;	../src/mmcsd.c: 980: return Data;
                                    618 ;	../src/mmcsd.c: 981: }
      008EC3 81               [ 4]  619 	ret
                                    620 ;	../src/mmcsd.c: 1025: void SD_LowLevel_Init(void)
                                    621 ;	-----------------------------------------
                                    622 ;	 function SD_LowLevel_Init
                                    623 ;	-----------------------------------------
      008EC4                        624 _SD_LowLevel_Init:
                                    625 ;	../src/mmcsd.c: 1035: SPI->CR1 = SPI_FIRSTBIT_MSB | SPI_BAUDRATEPRESCALER_64|SPI_CLOCKPOLARITY_HIGH | SPI_CLOCKPHASE_2EDGE;
      008EC4 35 2B 52 00      [ 1]  626 	mov	0x5200+0, #0x2b
                                    627 ;	../src/mmcsd.c: 1037: SPI->CR2 = SPI_DATADIRECTION_2LINES_FULLDUPLEX|SPI_NSS_SOFT;
      008EC8 35 02 52 01      [ 1]  628 	mov	0x5201+0, #0x02
                                    629 ;	../src/mmcsd.c: 1038: SPI->CR2 |= SPI_CR2_SSI;
      008ECC 72 10 52 01      [ 1]  630 	bset	20993, #0
                                    631 ;	../src/mmcsd.c: 1040: SPI->CR1 |= SPI_MODE_MASTER;
      008ED0 72 14 52 00      [ 1]  632 	bset	20992, #2
                                    633 ;	../src/mmcsd.c: 1042: SPI->CRCPR = 0x07;
      008ED4 35 07 52 05      [ 1]  634 	mov	0x5205+0, #0x07
                                    635 ;	../src/mmcsd.c: 1045: SPI->CR1 |= SPI_CR1_SPE;
      008ED8 72 1C 52 00      [ 1]  636 	bset	20992, #6
                                    637 ;	../src/mmcsd.c: 1049: SD_CS_GPIO_PORT->CR2 &= (~SD_CS_PIN); //Reset corresponding bit
      008EDC 72 19 50 0E      [ 1]  638 	bres	20494, #4
                                    639 ;	../src/mmcsd.c: 1050: SD_CS_GPIO_PORT->ODR |= SD_CS_PIN; // high level
      008EE0 72 18 50 0A      [ 1]  640 	bset	20490, #4
                                    641 ;	../src/mmcsd.c: 1051: SD_CS_GPIO_PORT->DDR |= SD_CS_PIN; // output mode 
      008EE4 72 18 50 0C      [ 1]  642 	bset	20492, #4
                                    643 ;	../src/mmcsd.c: 1052: SD_CS_GPIO_PORT->CR1 &= ~SD_CS_PIN; //open drain here
      008EE8 72 19 50 0D      [ 1]  644 	bres	20493, #4
                                    645 ;	../src/mmcsd.c: 1053: }
      008EEC 81               [ 4]  646 	ret
                                    647 	.area CODE
                                    648 	.area CONST
                                    649 	.area INITIALIZER
                                    650 	.area CABS (ABS)
