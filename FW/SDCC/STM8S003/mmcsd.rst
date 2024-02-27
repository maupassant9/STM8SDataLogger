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
      008AEB                         63 _SD_Init:
      008AEB 52 04            [ 2]   64 	sub	sp, #4
                                     65 ;	../src/mmcsd.c: 96: SD_LowLevel_Init();
      008AED CD 8D A2         [ 4]   66 	call	_SD_LowLevel_Init
                                     67 ;	../src/mmcsd.c: 99: SD_CS_LOW();
      008AF0 72 19 50 0A      [ 1]   68 	bres	20490, #4
                                     69 ;	../src/mmcsd.c: 103: for (i = 0; i <= 9; i++)
      008AF4 5F               [ 1]   70 	clrw	x
      008AF5 1F 03            [ 2]   71 	ldw	(0x03, sp), x
      008AF7 1F 01            [ 2]   72 	ldw	(0x01, sp), x
      008AF9                         73 00104$:
                                     74 ;	../src/mmcsd.c: 106: SD_WriteByte(SD_DUMMY_BYTE);
      008AF9 4B FF            [ 1]   75 	push	#0xff
      008AFB CD 8D 84         [ 4]   76 	call	_SD_WriteByte
      008AFE 84               [ 1]   77 	pop	a
                                     78 ;	../src/mmcsd.c: 103: for (i = 0; i <= 9; i++)
      008AFF 1E 03            [ 2]   79 	ldw	x, (0x03, sp)
      008B01 5C               [ 1]   80 	incw	x
      008B02 1F 03            [ 2]   81 	ldw	(0x03, sp), x
      008B04 26 05            [ 1]   82 	jrne	00119$
      008B06 1E 01            [ 2]   83 	ldw	x, (0x01, sp)
      008B08 5C               [ 1]   84 	incw	x
      008B09 1F 01            [ 2]   85 	ldw	(0x01, sp), x
      008B0B                         86 00119$:
      008B0B AE 00 09         [ 2]   87 	ldw	x, #0x0009
      008B0E 13 03            [ 2]   88 	cpw	x, (0x03, sp)
      008B10 4F               [ 1]   89 	clr	a
      008B11 12 02            [ 1]   90 	sbc	a, (0x02, sp)
      008B13 4F               [ 1]   91 	clr	a
      008B14 12 01            [ 1]   92 	sbc	a, (0x01, sp)
      008B16 24 E1            [ 1]   93 	jrnc	00104$
                                     94 ;	../src/mmcsd.c: 110: res = SD_GoIdleState();
      008B18 CD 8C 55         [ 4]   95 	call	_SD_GoIdleState
                                     96 ;	../src/mmcsd.c: 116: return (res);
      008B1B 4F               [ 1]   97 	clr	a
                                     98 ;	../src/mmcsd.c: 117: }
      008B1C 5B 04            [ 2]   99 	addw	sp, #4
      008B1E 81               [ 4]  100 	ret
                                    101 ;	../src/mmcsd.c: 124: uint8_t SD_Detect(void)
                                    102 ;	-----------------------------------------
                                    103 ;	 function SD_Detect
                                    104 ;	-----------------------------------------
      008B1F                        105 _SD_Detect:
      008B1F 88               [ 1]  106 	push	a
                                    107 ;	../src/mmcsd.c: 126: __IO uint8_t status = SD_PRESENT;
                                    108 ;	../src/mmcsd.c: 136: return SD_PRESENT;
      008B20 A6 01            [ 1]  109 	ld	a, #0x01
      008B22 6B 01            [ 1]  110 	ld	(0x01, sp), a
                                    111 ;	../src/mmcsd.c: 138: }
      008B24 5B 01            [ 2]  112 	addw	sp, #1
      008B26 81               [ 4]  113 	ret
                                    114 ;	../src/mmcsd.c: 663: void SD_SendCmd(uint8_t Cmd, uint32_t Arg, uint8_t Crc)
                                    115 ;	-----------------------------------------
                                    116 ;	 function SD_SendCmd
                                    117 ;	-----------------------------------------
      008B27                        118 _SD_SendCmd:
      008B27 52 0A            [ 2]  119 	sub	sp, #10
                                    120 ;	../src/mmcsd.c: 669: Frame[0] = (uint8_t)(Cmd | 0x40); /*!< Construct byte 1 */
      008B29 7B 0D            [ 1]  121 	ld	a, (0x0d, sp)
      008B2B AA 40            [ 1]  122 	or	a, #0x40
      008B2D 6B 01            [ 1]  123 	ld	(0x01, sp), a
                                    124 ;	../src/mmcsd.c: 671: Frame[1] = (uint8_t)(Arg >> 24); /*!< Construct byte 2 */
      008B2F 96               [ 1]  125 	ldw	x, sp
      008B30 5C               [ 1]  126 	incw	x
      008B31 5C               [ 1]  127 	incw	x
      008B32 7B 0E            [ 1]  128 	ld	a, (0x0e, sp)
      008B34 0F 07            [ 1]  129 	clr	(0x07, sp)
      008B36 F7               [ 1]  130 	ld	(x), a
                                    131 ;	../src/mmcsd.c: 673: Frame[2] = (uint8_t)(Arg >> 16); /*!< Construct byte 3 */
      008B37 96               [ 1]  132 	ldw	x, sp
      008B38 1C 00 03         [ 2]  133 	addw	x, #3
      008B3B 16 0E            [ 2]  134 	ldw	y, (0x0e, sp)
      008B3D 0F 07            [ 1]  135 	clr	(0x07, sp)
      008B3F 90 9F            [ 1]  136 	ld	a, yl
      008B41 F7               [ 1]  137 	ld	(x), a
                                    138 ;	../src/mmcsd.c: 675: Frame[3] = (uint8_t)(Arg >> 8); /*!< Construct byte 4 */
      008B42 96               [ 1]  139 	ldw	x, sp
      008B43 1C 00 04         [ 2]  140 	addw	x, #4
      008B46 16 10            [ 2]  141 	ldw	y, (0x10, sp)
      008B48 90 9E            [ 1]  142 	ld	a, yh
      008B4A F7               [ 1]  143 	ld	(x), a
                                    144 ;	../src/mmcsd.c: 677: Frame[4] = (uint8_t)(Arg); /*!< Construct byte 5 */
      008B4B 96               [ 1]  145 	ldw	x, sp
      008B4C 7B 11            [ 1]  146 	ld	a, (0x11, sp)
      008B4E E7 05            [ 1]  147 	ld	(5, x), a
                                    148 ;	../src/mmcsd.c: 679: Frame[5] = (Crc); /*!< Construct CRC: byte 6 */
      008B50 96               [ 1]  149 	ldw	x, sp
      008B51 7B 12            [ 1]  150 	ld	a, (0x12, sp)
      008B53 E7 06            [ 1]  151 	ld	(6, x), a
                                    152 ;	../src/mmcsd.c: 681: for (i = 0; i < 6; i++)
      008B55 5F               [ 1]  153 	clrw	x
      008B56 1F 09            [ 2]  154 	ldw	(0x09, sp), x
      008B58 1F 07            [ 2]  155 	ldw	(0x07, sp), x
      008B5A                        156 00102$:
                                    157 ;	../src/mmcsd.c: 683: SD_WriteByte(Frame[i]); /*!< Send the Cmd bytes */
      008B5A 96               [ 1]  158 	ldw	x, sp
      008B5B 5C               [ 1]  159 	incw	x
      008B5C 72 FB 09         [ 2]  160 	addw	x, (0x09, sp)
      008B5F F6               [ 1]  161 	ld	a, (x)
      008B60 88               [ 1]  162 	push	a
      008B61 CD 8D 84         [ 4]  163 	call	_SD_WriteByte
      008B64 84               [ 1]  164 	pop	a
                                    165 ;	../src/mmcsd.c: 681: for (i = 0; i < 6; i++)
      008B65 1E 09            [ 2]  166 	ldw	x, (0x09, sp)
      008B67 5C               [ 1]  167 	incw	x
      008B68 1F 09            [ 2]  168 	ldw	(0x09, sp), x
      008B6A 26 05            [ 1]  169 	jrne	00112$
      008B6C 1E 07            [ 2]  170 	ldw	x, (0x07, sp)
      008B6E 5C               [ 1]  171 	incw	x
      008B6F 1F 07            [ 2]  172 	ldw	(0x07, sp), x
      008B71                        173 00112$:
      008B71 1E 09            [ 2]  174 	ldw	x, (0x09, sp)
      008B73 A3 00 06         [ 2]  175 	cpw	x, #0x0006
      008B76 7B 08            [ 1]  176 	ld	a, (0x08, sp)
      008B78 A2 00            [ 1]  177 	sbc	a, #0x00
      008B7A 7B 07            [ 1]  178 	ld	a, (0x07, sp)
      008B7C A2 00            [ 1]  179 	sbc	a, #0x00
      008B7E 25 DA            [ 1]  180 	jrc	00102$
                                    181 ;	../src/mmcsd.c: 685: }
      008B80 5B 0A            [ 2]  182 	addw	sp, #10
      008B82 81               [ 4]  183 	ret
                                    184 ;	../src/mmcsd.c: 699: uint8_t SD_GetDataResponse(void)
                                    185 ;	-----------------------------------------
                                    186 ;	 function SD_GetDataResponse
                                    187 ;	-----------------------------------------
      008B83                        188 _SD_GetDataResponse:
      008B83 52 05            [ 2]  189 	sub	sp, #5
                                    190 ;	../src/mmcsd.c: 702: uint8_t response = 0, rvalue = 0;
      008B85 0F 01            [ 1]  191 	clr	(0x01, sp)
                                    192 ;	../src/mmcsd.c: 704: while (i <= 64)
      008B87 5F               [ 1]  193 	clrw	x
      008B88 1F 04            [ 2]  194 	ldw	(0x04, sp), x
      008B8A 1F 02            [ 2]  195 	ldw	(0x02, sp), x
      008B8C                        196 00108$:
      008B8C AE 00 40         [ 2]  197 	ldw	x, #0x0040
      008B8F 13 04            [ 2]  198 	cpw	x, (0x04, sp)
      008B91 4F               [ 1]  199 	clr	a
      008B92 12 03            [ 1]  200 	sbc	a, (0x03, sp)
      008B94 4F               [ 1]  201 	clr	a
      008B95 12 02            [ 1]  202 	sbc	a, (0x02, sp)
      008B97 25 39            [ 1]  203 	jrc	00111$
                                    204 ;	../src/mmcsd.c: 707: response = SD_ReadByte();
      008B99 CD 8D 94         [ 4]  205 	call	_SD_ReadByte
                                    206 ;	../src/mmcsd.c: 709: response &= 0x1F;
      008B9C A4 1F            [ 1]  207 	and	a, #0x1f
                                    208 ;	../src/mmcsd.c: 710: switch (response)
      008B9E 6B 01            [ 1]  209 	ld	(0x01, sp), a
      008BA0 A1 05            [ 1]  210 	cp	a, #0x05
      008BA2 27 0E            [ 1]  211 	jreq	00101$
      008BA4 7B 01            [ 1]  212 	ld	a, (0x01, sp)
      008BA6 A1 0B            [ 1]  213 	cp	a, #0x0b
      008BA8 27 0C            [ 1]  214 	jreq	00102$
      008BAA 7B 01            [ 1]  215 	ld	a, (0x01, sp)
      008BAC A1 0D            [ 1]  216 	cp	a, #0x0d
      008BAE 27 0A            [ 1]  217 	jreq	00103$
      008BB0 20 0C            [ 2]  218 	jra	00104$
                                    219 ;	../src/mmcsd.c: 712: case SD_DATA_OK:
      008BB2                        220 00101$:
                                    221 ;	../src/mmcsd.c: 714: rvalue = SD_DATA_OK;
      008BB2 A6 05            [ 1]  222 	ld	a, #0x05
                                    223 ;	../src/mmcsd.c: 715: break;
      008BB4 20 0A            [ 2]  224 	jra	00105$
                                    225 ;	../src/mmcsd.c: 717: case SD_DATA_CRC_ERROR:
      008BB6                        226 00102$:
                                    227 ;	../src/mmcsd.c: 718: return SD_DATA_CRC_ERROR;
      008BB6 A6 0B            [ 1]  228 	ld	a, #0x0b
      008BB8 20 20            [ 2]  229 	jra	00114$
                                    230 ;	../src/mmcsd.c: 719: case SD_DATA_WRITE_ERROR:
      008BBA                        231 00103$:
                                    232 ;	../src/mmcsd.c: 720: return SD_DATA_WRITE_ERROR;
      008BBA A6 0D            [ 1]  233 	ld	a, #0x0d
      008BBC 20 1C            [ 2]  234 	jra	00114$
                                    235 ;	../src/mmcsd.c: 721: default:
      008BBE                        236 00104$:
                                    237 ;	../src/mmcsd.c: 723: rvalue = SD_DATA_OTHER_ERROR;
      008BBE A6 FF            [ 1]  238 	ld	a, #0xff
                                    239 ;	../src/mmcsd.c: 726: }
      008BC0                        240 00105$:
                                    241 ;	../src/mmcsd.c: 728: if (rvalue == SD_DATA_OK)
      008BC0 A1 05            [ 1]  242 	cp	a, #0x05
      008BC2 27 0E            [ 1]  243 	jreq	00111$
                                    244 ;	../src/mmcsd.c: 731: i++;
      008BC4 1E 04            [ 2]  245 	ldw	x, (0x04, sp)
      008BC6 5C               [ 1]  246 	incw	x
      008BC7 1F 04            [ 2]  247 	ldw	(0x04, sp), x
      008BC9 26 C1            [ 1]  248 	jrne	00108$
      008BCB 1E 02            [ 2]  249 	ldw	x, (0x02, sp)
      008BCD 5C               [ 1]  250 	incw	x
      008BCE 1F 02            [ 2]  251 	ldw	(0x02, sp), x
      008BD0 20 BA            [ 2]  252 	jra	00108$
                                    253 ;	../src/mmcsd.c: 735: while (SD_ReadByte() == 0);
      008BD2                        254 00111$:
      008BD2 CD 8D 94         [ 4]  255 	call	_SD_ReadByte
      008BD5 4D               [ 1]  256 	tnz	a
      008BD6 27 FA            [ 1]  257 	jreq	00111$
                                    258 ;	../src/mmcsd.c: 738: return response;
      008BD8 7B 01            [ 1]  259 	ld	a, (0x01, sp)
      008BDA                        260 00114$:
                                    261 ;	../src/mmcsd.c: 739: }
      008BDA 5B 05            [ 2]  262 	addw	sp, #5
      008BDC 81               [ 4]  263 	ret
                                    264 ;	../src/mmcsd.c: 748: uint8_t SD_GetResponse(uint8_t Response)
                                    265 ;	-----------------------------------------
                                    266 ;	 function SD_GetResponse
                                    267 ;	-----------------------------------------
      008BDD                        268 _SD_GetResponse:
                                    269 ;	../src/mmcsd.c: 753: while ((SD_ReadByte() != Response) && Count) 
      008BDD AE 0F FF         [ 2]  270 	ldw	x, #0x0fff
      008BE0 90 5F            [ 1]  271 	clrw	y
      008BE2                        272 00102$:
      008BE2 89               [ 2]  273 	pushw	x
      008BE3 90 89            [ 2]  274 	pushw	y
      008BE5 CD 8D 94         [ 4]  275 	call	_SD_ReadByte
      008BE8 90 85            [ 2]  276 	popw	y
      008BEA 85               [ 2]  277 	popw	x
      008BEB 11 03            [ 1]  278 	cp	a, (0x03, sp)
      008BED 27 10            [ 1]  279 	jreq	00104$
      008BEF 5D               [ 2]  280 	tnzw	x
      008BF0 26 04            [ 1]  281 	jrne	00134$
      008BF2 90 5D            [ 2]  282 	tnzw	y
      008BF4 27 09            [ 1]  283 	jreq	00104$
      008BF6                        284 00134$:
                                    285 ;	../src/mmcsd.c: 755: Count--;
      008BF6 1D 00 01         [ 2]  286 	subw	x, #0x0001
      008BF9 24 E7            [ 1]  287 	jrnc	00102$
      008BFB 90 5A            [ 2]  288 	decw	y
      008BFD 20 E3            [ 2]  289 	jra	00102$
      008BFF                        290 00104$:
                                    291 ;	../src/mmcsd.c: 757: if (Count == 0)
      008BFF 5D               [ 2]  292 	tnzw	x
      008C00 26 07            [ 1]  293 	jrne	00106$
      008C02 90 5D            [ 2]  294 	tnzw	y
      008C04 26 03            [ 1]  295 	jrne	00106$
                                    296 ;	../src/mmcsd.c: 760: return SD_RESPONSE_FAILURE;
      008C06 A6 FF            [ 1]  297 	ld	a, #0xff
      008C08 81               [ 4]  298 	ret
      008C09                        299 00106$:
                                    300 ;	../src/mmcsd.c: 765: return SD_RESPONSE_NO_ERROR;
      008C09 4F               [ 1]  301 	clr	a
                                    302 ;	../src/mmcsd.c: 767: }
      008C0A 81               [ 4]  303 	ret
                                    304 ;	../src/mmcsd.c: 772: void SD_GetResponseVal(uint8_t *pResp, uint8_t response)
                                    305 ;	-----------------------------------------
                                    306 ;	 function SD_GetResponseVal
                                    307 ;	-----------------------------------------
      008C0B                        308 _SD_GetResponseVal:
                                    309 ;	../src/mmcsd.c: 775: if(SD_GetResponse(response) == SD_RESPONSE_FAILURE)
      008C0B 7B 05            [ 1]  310 	ld	a, (0x05, sp)
      008C0D 88               [ 1]  311 	push	a
      008C0E CD 8B DD         [ 4]  312 	call	_SD_GetResponse
      008C11 5B 01            [ 2]  313 	addw	sp, #1
                                    314 ;	../src/mmcsd.c: 777: *pResp++ = 0xff;
      008C13 16 03            [ 2]  315 	ldw	y, (0x03, sp)
      008C15 93               [ 1]  316 	ldw	x, y
      008C16 5C               [ 1]  317 	incw	x
                                    318 ;	../src/mmcsd.c: 775: if(SD_GetResponse(response) == SD_RESPONSE_FAILURE)
      008C17 4C               [ 1]  319 	inc	a
      008C18 26 08            [ 1]  320 	jrne	00102$
                                    321 ;	../src/mmcsd.c: 777: *pResp++ = 0xff;
      008C1A A6 FF            [ 1]  322 	ld	a, #0xff
      008C1C 90 F7            [ 1]  323 	ld	(y), a
      008C1E 1F 03            [ 2]  324 	ldw	(0x03, sp), x
      008C20 20 06            [ 2]  325 	jra	00103$
      008C22                        326 00102$:
                                    327 ;	../src/mmcsd.c: 779: *pResp++ = response;
      008C22 7B 05            [ 1]  328 	ld	a, (0x05, sp)
      008C24 90 F7            [ 1]  329 	ld	(y), a
      008C26 1F 03            [ 2]  330 	ldw	(0x03, sp), x
      008C28                        331 00103$:
                                    332 ;	../src/mmcsd.c: 782: *pResp++ = SD_ReadByte();
      008C28 1E 03            [ 2]  333 	ldw	x, (0x03, sp)
      008C2A 89               [ 2]  334 	pushw	x
      008C2B CD 8D 94         [ 4]  335 	call	_SD_ReadByte
      008C2E 85               [ 2]  336 	popw	x
      008C2F F7               [ 1]  337 	ld	(x), a
      008C30 5C               [ 1]  338 	incw	x
                                    339 ;	../src/mmcsd.c: 783: *pResp++ = SD_ReadByte();
      008C31 1F 03            [ 2]  340 	ldw	(0x03, sp), x
      008C33 89               [ 2]  341 	pushw	x
      008C34 CD 8D 94         [ 4]  342 	call	_SD_ReadByte
      008C37 85               [ 2]  343 	popw	x
      008C38 F7               [ 1]  344 	ld	(x), a
      008C39 5C               [ 1]  345 	incw	x
                                    346 ;	../src/mmcsd.c: 784: *pResp++ = SD_ReadByte();
      008C3A 1F 03            [ 2]  347 	ldw	(0x03, sp), x
      008C3C 89               [ 2]  348 	pushw	x
      008C3D CD 8D 94         [ 4]  349 	call	_SD_ReadByte
      008C40 85               [ 2]  350 	popw	x
      008C41 F7               [ 1]  351 	ld	(x), a
      008C42 5C               [ 1]  352 	incw	x
                                    353 ;	../src/mmcsd.c: 785: *pResp++ = SD_ReadByte();
      008C43 1F 03            [ 2]  354 	ldw	(0x03, sp), x
      008C45 89               [ 2]  355 	pushw	x
      008C46 CD 8D 94         [ 4]  356 	call	_SD_ReadByte
      008C49 85               [ 2]  357 	popw	x
      008C4A F7               [ 1]  358 	ld	(x), a
      008C4B 5C               [ 1]  359 	incw	x
                                    360 ;	../src/mmcsd.c: 786: *pResp = SD_ReadByte();
      008C4C 1F 03            [ 2]  361 	ldw	(0x03, sp), x
      008C4E 89               [ 2]  362 	pushw	x
      008C4F CD 8D 94         [ 4]  363 	call	_SD_ReadByte
      008C52 85               [ 2]  364 	popw	x
      008C53 F7               [ 1]  365 	ld	(x), a
                                    366 ;	../src/mmcsd.c: 787: }
      008C54 81               [ 4]  367 	ret
                                    368 ;	../src/mmcsd.c: 871: uint8_t SD_GoIdleState(void)
                                    369 ;	-----------------------------------------
                                    370 ;	 function SD_GoIdleState
                                    371 ;	-----------------------------------------
      008C55                        372 _SD_GoIdleState:
      008C55 52 0A            [ 2]  373 	sub	sp, #10
                                    374 ;	../src/mmcsd.c: 874: uint8_t resp[6] = {0};
      008C57 0F 01            [ 1]  375 	clr	(0x01, sp)
      008C59 96               [ 1]  376 	ldw	x, sp
      008C5A 5C               [ 1]  377 	incw	x
      008C5B 5C               [ 1]  378 	incw	x
      008C5C 7F               [ 1]  379 	clr	(x)
      008C5D 96               [ 1]  380 	ldw	x, sp
      008C5E 6F 03            [ 1]  381 	clr	(3, x)
      008C60 96               [ 1]  382 	ldw	x, sp
      008C61 1C 00 04         [ 2]  383 	addw	x, #4
      008C64 1F 07            [ 2]  384 	ldw	(0x07, sp), x
      008C66 7F               [ 1]  385 	clr	(x)
      008C67 96               [ 1]  386 	ldw	x, sp
      008C68 1C 00 05         [ 2]  387 	addw	x, #5
      008C6B 1F 09            [ 2]  388 	ldw	(0x09, sp), x
      008C6D 7F               [ 1]  389 	clr	(x)
      008C6E 96               [ 1]  390 	ldw	x, sp
      008C6F 1C 00 06         [ 2]  391 	addw	x, #6
      008C72 7F               [ 1]  392 	clr	(x)
                                    393 ;	../src/mmcsd.c: 876: SD_CS_LOW();
      008C73 C6 50 0A         [ 1]  394 	ld	a, 0x500a
      008C76 A4 EF            [ 1]  395 	and	a, #0xef
      008C78 C7 50 0A         [ 1]  396 	ld	0x500a, a
                                    397 ;	../src/mmcsd.c: 879: SD_SendCmd(SD_CMD_GO_IDLE_STATE, (uint32_t)0, 0x95);
      008C7B 4B 95            [ 1]  398 	push	#0x95
      008C7D 5F               [ 1]  399 	clrw	x
      008C7E 89               [ 2]  400 	pushw	x
      008C7F 5F               [ 1]  401 	clrw	x
      008C80 89               [ 2]  402 	pushw	x
      008C81 4B 00            [ 1]  403 	push	#0x00
      008C83 CD 8B 27         [ 4]  404 	call	_SD_SendCmd
      008C86 5B 06            [ 2]  405 	addw	sp, #6
                                    406 ;	../src/mmcsd.c: 882: if (SD_GetResponse(SD_IN_IDLE_STATE))
      008C88 4B 01            [ 1]  407 	push	#0x01
      008C8A CD 8B DD         [ 4]  408 	call	_SD_GetResponse
      008C8D 5B 01            [ 2]  409 	addw	sp, #1
      008C8F 4D               [ 1]  410 	tnz	a
      008C90 27 05            [ 1]  411 	jreq	00102$
                                    412 ;	../src/mmcsd.c: 885: return SD_RESPONSE_FAILURE;
      008C92 A6 FF            [ 1]  413 	ld	a, #0xff
      008C94 CC 8D 81         [ 2]  414 	jp	00116$
      008C97                        415 00102$:
                                    416 ;	../src/mmcsd.c: 888: SD_SendCmd(SD_CMD_IF_COND, (uint32_t)0x156, 0x43);
      008C97 4B 43            [ 1]  417 	push	#0x43
      008C99 4B 56            [ 1]  418 	push	#0x56
      008C9B 4B 01            [ 1]  419 	push	#0x01
      008C9D 5F               [ 1]  420 	clrw	x
      008C9E 89               [ 2]  421 	pushw	x
      008C9F 4B 08            [ 1]  422 	push	#0x08
      008CA1 CD 8B 27         [ 4]  423 	call	_SD_SendCmd
      008CA4 5B 06            [ 2]  424 	addw	sp, #6
                                    425 ;	../src/mmcsd.c: 889: SD_GetResponseVal(resp,0x01);
      008CA6 4B 01            [ 1]  426 	push	#0x01
      008CA8 96               [ 1]  427 	ldw	x, sp
      008CA9 5C               [ 1]  428 	incw	x
      008CAA 5C               [ 1]  429 	incw	x
      008CAB 89               [ 2]  430 	pushw	x
      008CAC CD 8C 0B         [ 4]  431 	call	_SD_GetResponseVal
      008CAF 5B 03            [ 2]  432 	addw	sp, #3
                                    433 ;	../src/mmcsd.c: 890: if(resp[0]==0x01){
      008CB1 7B 01            [ 1]  434 	ld	a, (0x01, sp)
      008CB3 4A               [ 1]  435 	dec	a
      008CB4 26 77            [ 1]  436 	jrne	00123$
                                    437 ;	../src/mmcsd.c: 892: if ((resp[3] == 0x01)&&(resp[4] == 0x56)){
      008CB6 1E 07            [ 2]  438 	ldw	x, (0x07, sp)
      008CB8 F6               [ 1]  439 	ld	a, (x)
      008CB9 4A               [ 1]  440 	dec	a
      008CBA 26 6D            [ 1]  441 	jrne	00107$
      008CBC 1E 09            [ 2]  442 	ldw	x, (0x09, sp)
      008CBE F6               [ 1]  443 	ld	a, (x)
      008CBF A1 56            [ 1]  444 	cp	a, #0x56
      008CC1 26 66            [ 1]  445 	jrne	00107$
                                    446 ;	../src/mmcsd.c: 895: do{
      008CC3                        447 00103$:
                                    448 ;	../src/mmcsd.c: 896: SD_SendCmd(SD_CMD_55, (uint32_t)0, 0x01);
      008CC3 4B 01            [ 1]  449 	push	#0x01
      008CC5 5F               [ 1]  450 	clrw	x
      008CC6 89               [ 2]  451 	pushw	x
      008CC7 5F               [ 1]  452 	clrw	x
      008CC8 89               [ 2]  453 	pushw	x
      008CC9 4B 37            [ 1]  454 	push	#0x37
      008CCB CD 8B 27         [ 4]  455 	call	_SD_SendCmd
      008CCE 5B 06            [ 2]  456 	addw	sp, #6
                                    457 ;	../src/mmcsd.c: 897: SD_GetResponseVal(resp,0x01);
      008CD0 4B 01            [ 1]  458 	push	#0x01
      008CD2 96               [ 1]  459 	ldw	x, sp
      008CD3 5C               [ 1]  460 	incw	x
      008CD4 5C               [ 1]  461 	incw	x
      008CD5 89               [ 2]  462 	pushw	x
      008CD6 CD 8C 0B         [ 4]  463 	call	_SD_GetResponseVal
      008CD9 5B 03            [ 2]  464 	addw	sp, #3
                                    465 ;	../src/mmcsd.c: 898: dly((uint32_t)100);
      008CDB 4B 64            [ 1]  466 	push	#0x64
      008CDD 5F               [ 1]  467 	clrw	x
      008CDE 89               [ 2]  468 	pushw	x
      008CDF 4B 00            [ 1]  469 	push	#0x00
      008CE1 CD 84 B9         [ 4]  470 	call	_dly
      008CE4 5B 04            [ 2]  471 	addw	sp, #4
                                    472 ;	../src/mmcsd.c: 899: SD_SendCmd(SD_ACMD_41&0x7f, (1UL<<30), 0x1);
      008CE6 4B 01            [ 1]  473 	push	#0x01
      008CE8 5F               [ 1]  474 	clrw	x
      008CE9 89               [ 2]  475 	pushw	x
      008CEA 4B 00            [ 1]  476 	push	#0x00
      008CEC 4B 40            [ 1]  477 	push	#0x40
      008CEE 4B 69            [ 1]  478 	push	#0x69
      008CF0 CD 8B 27         [ 4]  479 	call	_SD_SendCmd
      008CF3 5B 06            [ 2]  480 	addw	sp, #6
                                    481 ;	../src/mmcsd.c: 900: dly((uint32_t)10000);
      008CF5 4B 10            [ 1]  482 	push	#0x10
      008CF7 4B 27            [ 1]  483 	push	#0x27
      008CF9 5F               [ 1]  484 	clrw	x
      008CFA 89               [ 2]  485 	pushw	x
      008CFB CD 84 B9         [ 4]  486 	call	_dly
      008CFE 5B 04            [ 2]  487 	addw	sp, #4
                                    488 ;	../src/mmcsd.c: 901: SD_GetResponseVal(resp,0x00);
      008D00 96               [ 1]  489 	ldw	x, sp
      008D01 5C               [ 1]  490 	incw	x
      008D02 4B 00            [ 1]  491 	push	#0x00
      008D04 89               [ 2]  492 	pushw	x
      008D05 CD 8C 0B         [ 4]  493 	call	_SD_GetResponseVal
      008D08 5B 03            [ 2]  494 	addw	sp, #3
                                    495 ;	../src/mmcsd.c: 902: } while(resp[0]); //until resved 0x0
      008D0A 7B 01            [ 1]  496 	ld	a, (0x01, sp)
      008D0C 26 B5            [ 1]  497 	jrne	00103$
                                    498 ;	../src/mmcsd.c: 904: SD_SendCmd(SD_CMD_58, (uint32_t)0,0x01);
      008D0E 4B 01            [ 1]  499 	push	#0x01
      008D10 5F               [ 1]  500 	clrw	x
      008D11 89               [ 2]  501 	pushw	x
      008D12 5F               [ 1]  502 	clrw	x
      008D13 89               [ 2]  503 	pushw	x
      008D14 4B 3A            [ 1]  504 	push	#0x3a
      008D16 CD 8B 27         [ 4]  505 	call	_SD_SendCmd
      008D19 5B 06            [ 2]  506 	addw	sp, #6
                                    507 ;	../src/mmcsd.c: 905: SD_GetResponseVal(resp,58);
      008D1B 4B 3A            [ 1]  508 	push	#0x3a
      008D1D 96               [ 1]  509 	ldw	x, sp
      008D1E 5C               [ 1]  510 	incw	x
      008D1F 5C               [ 1]  511 	incw	x
      008D20 89               [ 2]  512 	pushw	x
      008D21 CD 8C 0B         [ 4]  513 	call	_SD_GetResponseVal
      008D24 5B 03            [ 2]  514 	addw	sp, #3
                                    515 ;	../src/mmcsd.c: 906: return SD_RESPONSE_NO_ERROR;
      008D26 4F               [ 1]  516 	clr	a
      008D27 20 58            [ 2]  517 	jra	00116$
      008D29                        518 00107$:
                                    519 ;	../src/mmcsd.c: 909: return SD_RESPONSE_FAILURE;
      008D29 A6 FF            [ 1]  520 	ld	a, #0xff
      008D2B 20 54            [ 2]  521 	jra	00116$
                                    522 ;	../src/mmcsd.c: 914: do{
      008D2D                        523 00123$:
      008D2D                        524 00110$:
                                    525 ;	../src/mmcsd.c: 915: SD_SendCmd(SD_CMD_55, 0, 0x01);
      008D2D 4B 01            [ 1]  526 	push	#0x01
      008D2F 5F               [ 1]  527 	clrw	x
      008D30 89               [ 2]  528 	pushw	x
      008D31 5F               [ 1]  529 	clrw	x
      008D32 89               [ 2]  530 	pushw	x
      008D33 4B 37            [ 1]  531 	push	#0x37
      008D35 CD 8B 27         [ 4]  532 	call	_SD_SendCmd
      008D38 5B 06            [ 2]  533 	addw	sp, #6
                                    534 ;	../src/mmcsd.c: 916: SD_GetResponseVal(resp,0x01);
      008D3A 96               [ 1]  535 	ldw	x, sp
      008D3B 5C               [ 1]  536 	incw	x
      008D3C 4B 01            [ 1]  537 	push	#0x01
      008D3E 89               [ 2]  538 	pushw	x
      008D3F CD 8C 0B         [ 4]  539 	call	_SD_GetResponseVal
      008D42 5B 03            [ 2]  540 	addw	sp, #3
                                    541 ;	../src/mmcsd.c: 917: dly((uint32_t)10000);
      008D44 4B 10            [ 1]  542 	push	#0x10
      008D46 4B 27            [ 1]  543 	push	#0x27
      008D48 5F               [ 1]  544 	clrw	x
      008D49 89               [ 2]  545 	pushw	x
      008D4A CD 84 B9         [ 4]  546 	call	_dly
      008D4D 5B 04            [ 2]  547 	addw	sp, #4
                                    548 ;	../src/mmcsd.c: 918: SD_SendCmd(SD_ACMD_41&0x7f, 0UL, 0x1);
      008D4F 4B 01            [ 1]  549 	push	#0x01
      008D51 5F               [ 1]  550 	clrw	x
      008D52 89               [ 2]  551 	pushw	x
      008D53 5F               [ 1]  552 	clrw	x
      008D54 89               [ 2]  553 	pushw	x
      008D55 4B 69            [ 1]  554 	push	#0x69
      008D57 CD 8B 27         [ 4]  555 	call	_SD_SendCmd
      008D5A 5B 06            [ 2]  556 	addw	sp, #6
                                    557 ;	../src/mmcsd.c: 919: SD_GetResponseVal(resp,0x00);
      008D5C 4B 00            [ 1]  558 	push	#0x00
      008D5E 96               [ 1]  559 	ldw	x, sp
      008D5F 5C               [ 1]  560 	incw	x
      008D60 5C               [ 1]  561 	incw	x
      008D61 89               [ 2]  562 	pushw	x
      008D62 CD 8C 0B         [ 4]  563 	call	_SD_GetResponseVal
      008D65 5B 03            [ 2]  564 	addw	sp, #3
                                    565 ;	../src/mmcsd.c: 920: dly((uint32_t)10000);
      008D67 4B 10            [ 1]  566 	push	#0x10
      008D69 4B 27            [ 1]  567 	push	#0x27
      008D6B 5F               [ 1]  568 	clrw	x
      008D6C 89               [ 2]  569 	pushw	x
      008D6D CD 84 B9         [ 4]  570 	call	_dly
      008D70 5B 04            [ 2]  571 	addw	sp, #4
                                    572 ;	../src/mmcsd.c: 921: } while(resp[0]);
      008D72 7B 01            [ 1]  573 	ld	a, (0x01, sp)
      008D74 26 B7            [ 1]  574 	jrne	00110$
                                    575 ;	../src/mmcsd.c: 926: SD_CS_HIGH();
      008D76 72 18 50 0A      [ 1]  576 	bset	20490, #4
                                    577 ;	../src/mmcsd.c: 929: SD_WriteByte(SD_DUMMY_BYTE);
      008D7A 4B FF            [ 1]  578 	push	#0xff
      008D7C CD 8D 84         [ 4]  579 	call	_SD_WriteByte
      008D7F 84               [ 1]  580 	pop	a
                                    581 ;	../src/mmcsd.c: 931: return SD_RESPONSE_NO_ERROR;
      008D80 4F               [ 1]  582 	clr	a
      008D81                        583 00116$:
                                    584 ;	../src/mmcsd.c: 932: }
      008D81 5B 0A            [ 2]  585 	addw	sp, #10
      008D83 81               [ 4]  586 	ret
                                    587 ;	../src/mmcsd.c: 941: uint8_t SD_WriteByte(uint8_t Data)
                                    588 ;	-----------------------------------------
                                    589 ;	 function SD_WriteByte
                                    590 ;	-----------------------------------------
      008D84                        591 _SD_WriteByte:
                                    592 ;	../src/mmcsd.c: 944: while (SPI->SR & (SPI_FLAG_TXE) == 0)
      008D84 C6 52 03         [ 1]  593 	ld	a, 0x5203
                                    594 ;	../src/mmcsd.c: 948: SPI->DR = (Data);
      008D87 AE 52 04         [ 2]  595 	ldw	x, #0x5204
      008D8A 7B 03            [ 1]  596 	ld	a, (0x03, sp)
      008D8C F7               [ 1]  597 	ld	(x), a
                                    598 ;	../src/mmcsd.c: 951: while (SPI->SR & (SPI_FLAG_RXNE) == 0)
      008D8D C6 52 03         [ 1]  599 	ld	a, 0x5203
                                    600 ;	../src/mmcsd.c: 955: return SPI->DR;
      008D90 C6 52 04         [ 1]  601 	ld	a, 0x5204
                                    602 ;	../src/mmcsd.c: 956: }
      008D93 81               [ 4]  603 	ret
                                    604 ;	../src/mmcsd.c: 963: uint8_t SD_ReadByte(void)
                                    605 ;	-----------------------------------------
                                    606 ;	 function SD_ReadByte
                                    607 ;	-----------------------------------------
      008D94                        608 _SD_ReadByte:
                                    609 ;	../src/mmcsd.c: 968: while (SPI->SR&(SPI_FLAG_TXE) == 0)
      008D94 C6 52 03         [ 1]  610 	ld	a, 0x5203
                                    611 ;	../src/mmcsd.c: 971: SPI->DR = SD_DUMMY_BYTE;
      008D97 35 FF 52 04      [ 1]  612 	mov	0x5204+0, #0xff
                                    613 ;	../src/mmcsd.c: 974: while (SPI->SR&(SPI_FLAG_RXNE) == 0)
      008D9B C6 52 03         [ 1]  614 	ld	a, 0x5203
                                    615 ;	../src/mmcsd.c: 977: Data = SPI->DR;
      008D9E C6 52 04         [ 1]  616 	ld	a, 0x5204
                                    617 ;	../src/mmcsd.c: 980: return Data;
                                    618 ;	../src/mmcsd.c: 981: }
      008DA1 81               [ 4]  619 	ret
                                    620 ;	../src/mmcsd.c: 1025: void SD_LowLevel_Init(void)
                                    621 ;	-----------------------------------------
                                    622 ;	 function SD_LowLevel_Init
                                    623 ;	-----------------------------------------
      008DA2                        624 _SD_LowLevel_Init:
                                    625 ;	../src/mmcsd.c: 1035: SPI->CR1 = SPI_FIRSTBIT_MSB | SPI_BAUDRATEPRESCALER_64|SPI_CLOCKPOLARITY_HIGH | SPI_CLOCKPHASE_2EDGE;
      008DA2 35 2B 52 00      [ 1]  626 	mov	0x5200+0, #0x2b
                                    627 ;	../src/mmcsd.c: 1037: SPI->CR2 = SPI_DATADIRECTION_2LINES_FULLDUPLEX|SPI_NSS_SOFT|SPI_CR2_SSI;
      008DA6 35 03 52 01      [ 1]  628 	mov	0x5201+0, #0x03
                                    629 ;	../src/mmcsd.c: 1039: SPI->CR1 |= SPI_MODE_MASTER;
      008DAA 72 14 52 00      [ 1]  630 	bset	20992, #2
                                    631 ;	../src/mmcsd.c: 1041: SPI->CRCPR = 0x07;
      008DAE 35 07 52 05      [ 1]  632 	mov	0x5205+0, #0x07
                                    633 ;	../src/mmcsd.c: 1044: SPI->CR1 |= SPI_CR1_SPE;
      008DB2 72 1C 52 00      [ 1]  634 	bset	20992, #6
                                    635 ;	../src/mmcsd.c: 1048: SD_CS_GPIO_PORT->CR2 &= (~SD_CS_PIN); //Reset corresponding bit
      008DB6 72 19 50 0E      [ 1]  636 	bres	20494, #4
                                    637 ;	../src/mmcsd.c: 1049: SD_CS_GPIO_PORT->ODR |= SD_CS_PIN; // high level
      008DBA 72 18 50 0A      [ 1]  638 	bset	20490, #4
                                    639 ;	../src/mmcsd.c: 1050: SD_CS_GPIO_PORT->DDR |= SD_CS_PIN; // output mode 
      008DBE 72 18 50 0C      [ 1]  640 	bset	20492, #4
                                    641 ;	../src/mmcsd.c: 1051: SD_CS_GPIO_PORT->CR1 &= ~SD_CS_PIN; //open drain here
      008DC2 72 19 50 0D      [ 1]  642 	bres	20493, #4
                                    643 ;	../src/mmcsd.c: 1052: }
      008DC6 81               [ 4]  644 	ret
                                    645 	.area CODE
                                    646 	.area CONST
                                    647 	.area INITIALIZER
                                    648 	.area CABS (ABS)
