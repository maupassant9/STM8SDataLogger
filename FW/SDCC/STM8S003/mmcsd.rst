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
      008D48                         63 _SD_Init:
      008D48 52 04            [ 2]   64 	sub	sp, #4
                                     65 ;	../src/mmcsd.c: 96: SD_LowLevel_Init();
      008D4A CD 90 19         [ 4]   66 	call	_SD_LowLevel_Init
                                     67 ;	../src/mmcsd.c: 99: SD_CS_LOW();
      008D4D 72 19 50 0A      [ 1]   68 	bres	20490, #4
                                     69 ;	../src/mmcsd.c: 103: for (i = 0; i <= 9; i++)
      008D51 5F               [ 1]   70 	clrw	x
      008D52 1F 03            [ 2]   71 	ldw	(0x03, sp), x
      008D54 1F 01            [ 2]   72 	ldw	(0x01, sp), x
      008D56                         73 00104$:
                                     74 ;	../src/mmcsd.c: 106: SD_WriteByte(SD_DUMMY_BYTE);
      008D56 4B FF            [ 1]   75 	push	#0xff
      008D58 CD 8F ED         [ 4]   76 	call	_SD_WriteByte
      008D5B 84               [ 1]   77 	pop	a
                                     78 ;	../src/mmcsd.c: 103: for (i = 0; i <= 9; i++)
      008D5C 1E 03            [ 2]   79 	ldw	x, (0x03, sp)
      008D5E 5C               [ 1]   80 	incw	x
      008D5F 1F 03            [ 2]   81 	ldw	(0x03, sp), x
      008D61 26 05            [ 1]   82 	jrne	00124$
      008D63 1E 01            [ 2]   83 	ldw	x, (0x01, sp)
      008D65 5C               [ 1]   84 	incw	x
      008D66 1F 01            [ 2]   85 	ldw	(0x01, sp), x
      008D68                         86 00124$:
      008D68 AE 00 09         [ 2]   87 	ldw	x, #0x0009
      008D6B 13 03            [ 2]   88 	cpw	x, (0x03, sp)
      008D6D 4F               [ 1]   89 	clr	a
      008D6E 12 02            [ 1]   90 	sbc	a, (0x02, sp)
      008D70 4F               [ 1]   91 	clr	a
      008D71 12 01            [ 1]   92 	sbc	a, (0x01, sp)
      008D73 24 E1            [ 1]   93 	jrnc	00104$
                                     94 ;	../src/mmcsd.c: 110: res = SD_GoIdleState();
      008D75 CD 8E BE         [ 4]   95 	call	_SD_GoIdleState
      008D78 97               [ 1]   96 	ld	xl, a
                                     97 ;	../src/mmcsd.c: 112: if(res == SD_RESPONSE_NO_ERROR){
      008D79 4D               [ 1]   98 	tnz	a
      008D7A 26 08            [ 1]   99 	jrne	00103$
                                    100 ;	../src/mmcsd.c: 113: SPI->CR1 &= 0xc7;
      008D7C C6 52 00         [ 1]  101 	ld	a, 0x5200
      008D7F A4 C7            [ 1]  102 	and	a, #0xc7
      008D81 C7 52 00         [ 1]  103 	ld	0x5200, a
      008D84                        104 00103$:
                                    105 ;	../src/mmcsd.c: 116: return (res);
      008D84 9F               [ 1]  106 	ld	a, xl
                                    107 ;	../src/mmcsd.c: 117: }
      008D85 5B 04            [ 2]  108 	addw	sp, #4
      008D87 81               [ 4]  109 	ret
                                    110 ;	../src/mmcsd.c: 124: uint8_t SD_Detect(void)
                                    111 ;	-----------------------------------------
                                    112 ;	 function SD_Detect
                                    113 ;	-----------------------------------------
      008D88                        114 _SD_Detect:
      008D88 88               [ 1]  115 	push	a
                                    116 ;	../src/mmcsd.c: 126: __IO uint8_t status = SD_PRESENT;
                                    117 ;	../src/mmcsd.c: 136: return SD_PRESENT;
      008D89 A6 01            [ 1]  118 	ld	a, #0x01
      008D8B 6B 01            [ 1]  119 	ld	(0x01, sp), a
                                    120 ;	../src/mmcsd.c: 138: }
      008D8D 5B 01            [ 2]  121 	addw	sp, #1
      008D8F 81               [ 4]  122 	ret
                                    123 ;	../src/mmcsd.c: 663: void SD_SendCmd(uint8_t Cmd, uint32_t Arg, uint8_t Crc)
                                    124 ;	-----------------------------------------
                                    125 ;	 function SD_SendCmd
                                    126 ;	-----------------------------------------
      008D90                        127 _SD_SendCmd:
      008D90 52 0A            [ 2]  128 	sub	sp, #10
                                    129 ;	../src/mmcsd.c: 669: Frame[0] = (uint8_t)(Cmd | 0x40); /*!< Construct byte 1 */
      008D92 7B 0D            [ 1]  130 	ld	a, (0x0d, sp)
      008D94 AA 40            [ 1]  131 	or	a, #0x40
      008D96 6B 01            [ 1]  132 	ld	(0x01, sp), a
                                    133 ;	../src/mmcsd.c: 671: Frame[1] = (uint8_t)(Arg >> 24); /*!< Construct byte 2 */
      008D98 96               [ 1]  134 	ldw	x, sp
      008D99 5C               [ 1]  135 	incw	x
      008D9A 5C               [ 1]  136 	incw	x
      008D9B 7B 0E            [ 1]  137 	ld	a, (0x0e, sp)
      008D9D 0F 07            [ 1]  138 	clr	(0x07, sp)
      008D9F F7               [ 1]  139 	ld	(x), a
                                    140 ;	../src/mmcsd.c: 673: Frame[2] = (uint8_t)(Arg >> 16); /*!< Construct byte 3 */
      008DA0 96               [ 1]  141 	ldw	x, sp
      008DA1 1C 00 03         [ 2]  142 	addw	x, #3
      008DA4 16 0E            [ 2]  143 	ldw	y, (0x0e, sp)
      008DA6 0F 07            [ 1]  144 	clr	(0x07, sp)
      008DA8 90 9F            [ 1]  145 	ld	a, yl
      008DAA F7               [ 1]  146 	ld	(x), a
                                    147 ;	../src/mmcsd.c: 675: Frame[3] = (uint8_t)(Arg >> 8); /*!< Construct byte 4 */
      008DAB 96               [ 1]  148 	ldw	x, sp
      008DAC 1C 00 04         [ 2]  149 	addw	x, #4
      008DAF 16 10            [ 2]  150 	ldw	y, (0x10, sp)
      008DB1 90 9E            [ 1]  151 	ld	a, yh
      008DB3 F7               [ 1]  152 	ld	(x), a
                                    153 ;	../src/mmcsd.c: 677: Frame[4] = (uint8_t)(Arg); /*!< Construct byte 5 */
      008DB4 96               [ 1]  154 	ldw	x, sp
      008DB5 7B 11            [ 1]  155 	ld	a, (0x11, sp)
      008DB7 E7 05            [ 1]  156 	ld	(5, x), a
                                    157 ;	../src/mmcsd.c: 679: Frame[5] = (Crc); /*!< Construct CRC: byte 6 */
      008DB9 96               [ 1]  158 	ldw	x, sp
      008DBA 7B 12            [ 1]  159 	ld	a, (0x12, sp)
      008DBC E7 06            [ 1]  160 	ld	(6, x), a
                                    161 ;	../src/mmcsd.c: 681: for (i = 0; i < 6; i++)
      008DBE 5F               [ 1]  162 	clrw	x
      008DBF 1F 09            [ 2]  163 	ldw	(0x09, sp), x
      008DC1 1F 07            [ 2]  164 	ldw	(0x07, sp), x
      008DC3                        165 00102$:
                                    166 ;	../src/mmcsd.c: 683: SD_WriteByte(Frame[i]); /*!< Send the Cmd bytes */
      008DC3 96               [ 1]  167 	ldw	x, sp
      008DC4 5C               [ 1]  168 	incw	x
      008DC5 72 FB 09         [ 2]  169 	addw	x, (0x09, sp)
      008DC8 F6               [ 1]  170 	ld	a, (x)
      008DC9 88               [ 1]  171 	push	a
      008DCA CD 8F ED         [ 4]  172 	call	_SD_WriteByte
      008DCD 84               [ 1]  173 	pop	a
                                    174 ;	../src/mmcsd.c: 681: for (i = 0; i < 6; i++)
      008DCE 1E 09            [ 2]  175 	ldw	x, (0x09, sp)
      008DD0 5C               [ 1]  176 	incw	x
      008DD1 1F 09            [ 2]  177 	ldw	(0x09, sp), x
      008DD3 26 05            [ 1]  178 	jrne	00112$
      008DD5 1E 07            [ 2]  179 	ldw	x, (0x07, sp)
      008DD7 5C               [ 1]  180 	incw	x
      008DD8 1F 07            [ 2]  181 	ldw	(0x07, sp), x
      008DDA                        182 00112$:
      008DDA 1E 09            [ 2]  183 	ldw	x, (0x09, sp)
      008DDC A3 00 06         [ 2]  184 	cpw	x, #0x0006
      008DDF 7B 08            [ 1]  185 	ld	a, (0x08, sp)
      008DE1 A2 00            [ 1]  186 	sbc	a, #0x00
      008DE3 7B 07            [ 1]  187 	ld	a, (0x07, sp)
      008DE5 A2 00            [ 1]  188 	sbc	a, #0x00
      008DE7 25 DA            [ 1]  189 	jrc	00102$
                                    190 ;	../src/mmcsd.c: 685: }
      008DE9 5B 0A            [ 2]  191 	addw	sp, #10
      008DEB 81               [ 4]  192 	ret
                                    193 ;	../src/mmcsd.c: 699: uint8_t SD_GetDataResponse(void)
                                    194 ;	-----------------------------------------
                                    195 ;	 function SD_GetDataResponse
                                    196 ;	-----------------------------------------
      008DEC                        197 _SD_GetDataResponse:
      008DEC 52 05            [ 2]  198 	sub	sp, #5
                                    199 ;	../src/mmcsd.c: 702: uint8_t response = 0, rvalue = 0;
      008DEE 0F 01            [ 1]  200 	clr	(0x01, sp)
                                    201 ;	../src/mmcsd.c: 704: while (i <= 64)
      008DF0 5F               [ 1]  202 	clrw	x
      008DF1 1F 04            [ 2]  203 	ldw	(0x04, sp), x
      008DF3 1F 02            [ 2]  204 	ldw	(0x02, sp), x
      008DF5                        205 00108$:
      008DF5 AE 00 40         [ 2]  206 	ldw	x, #0x0040
      008DF8 13 04            [ 2]  207 	cpw	x, (0x04, sp)
      008DFA 4F               [ 1]  208 	clr	a
      008DFB 12 03            [ 1]  209 	sbc	a, (0x03, sp)
      008DFD 4F               [ 1]  210 	clr	a
      008DFE 12 02            [ 1]  211 	sbc	a, (0x02, sp)
      008E00 25 39            [ 1]  212 	jrc	00111$
                                    213 ;	../src/mmcsd.c: 707: response = SD_ReadByte();
      008E02 CD 90 04         [ 4]  214 	call	_SD_ReadByte
                                    215 ;	../src/mmcsd.c: 709: response &= 0x1F;
      008E05 A4 1F            [ 1]  216 	and	a, #0x1f
                                    217 ;	../src/mmcsd.c: 710: switch (response)
      008E07 6B 01            [ 1]  218 	ld	(0x01, sp), a
      008E09 A1 05            [ 1]  219 	cp	a, #0x05
      008E0B 27 0E            [ 1]  220 	jreq	00101$
      008E0D 7B 01            [ 1]  221 	ld	a, (0x01, sp)
      008E0F A1 0B            [ 1]  222 	cp	a, #0x0b
      008E11 27 0C            [ 1]  223 	jreq	00102$
      008E13 7B 01            [ 1]  224 	ld	a, (0x01, sp)
      008E15 A1 0D            [ 1]  225 	cp	a, #0x0d
      008E17 27 0A            [ 1]  226 	jreq	00103$
      008E19 20 0C            [ 2]  227 	jra	00104$
                                    228 ;	../src/mmcsd.c: 712: case SD_DATA_OK:
      008E1B                        229 00101$:
                                    230 ;	../src/mmcsd.c: 714: rvalue = SD_DATA_OK;
      008E1B A6 05            [ 1]  231 	ld	a, #0x05
                                    232 ;	../src/mmcsd.c: 715: break;
      008E1D 20 0A            [ 2]  233 	jra	00105$
                                    234 ;	../src/mmcsd.c: 717: case SD_DATA_CRC_ERROR:
      008E1F                        235 00102$:
                                    236 ;	../src/mmcsd.c: 718: return SD_DATA_CRC_ERROR;
      008E1F A6 0B            [ 1]  237 	ld	a, #0x0b
      008E21 20 20            [ 2]  238 	jra	00114$
                                    239 ;	../src/mmcsd.c: 719: case SD_DATA_WRITE_ERROR:
      008E23                        240 00103$:
                                    241 ;	../src/mmcsd.c: 720: return SD_DATA_WRITE_ERROR;
      008E23 A6 0D            [ 1]  242 	ld	a, #0x0d
      008E25 20 1C            [ 2]  243 	jra	00114$
                                    244 ;	../src/mmcsd.c: 721: default:
      008E27                        245 00104$:
                                    246 ;	../src/mmcsd.c: 723: rvalue = SD_DATA_OTHER_ERROR;
      008E27 A6 FF            [ 1]  247 	ld	a, #0xff
                                    248 ;	../src/mmcsd.c: 726: }
      008E29                        249 00105$:
                                    250 ;	../src/mmcsd.c: 728: if (rvalue == SD_DATA_OK)
      008E29 A1 05            [ 1]  251 	cp	a, #0x05
      008E2B 27 0E            [ 1]  252 	jreq	00111$
                                    253 ;	../src/mmcsd.c: 731: i++;
      008E2D 1E 04            [ 2]  254 	ldw	x, (0x04, sp)
      008E2F 5C               [ 1]  255 	incw	x
      008E30 1F 04            [ 2]  256 	ldw	(0x04, sp), x
      008E32 26 C1            [ 1]  257 	jrne	00108$
      008E34 1E 02            [ 2]  258 	ldw	x, (0x02, sp)
      008E36 5C               [ 1]  259 	incw	x
      008E37 1F 02            [ 2]  260 	ldw	(0x02, sp), x
      008E39 20 BA            [ 2]  261 	jra	00108$
                                    262 ;	../src/mmcsd.c: 735: while (SD_ReadByte() == 0);
      008E3B                        263 00111$:
      008E3B CD 90 04         [ 4]  264 	call	_SD_ReadByte
      008E3E 4D               [ 1]  265 	tnz	a
      008E3F 27 FA            [ 1]  266 	jreq	00111$
                                    267 ;	../src/mmcsd.c: 738: return response;
      008E41 7B 01            [ 1]  268 	ld	a, (0x01, sp)
      008E43                        269 00114$:
                                    270 ;	../src/mmcsd.c: 739: }
      008E43 5B 05            [ 2]  271 	addw	sp, #5
      008E45 81               [ 4]  272 	ret
                                    273 ;	../src/mmcsd.c: 748: uint8_t SD_GetResponse(uint8_t Response)
                                    274 ;	-----------------------------------------
                                    275 ;	 function SD_GetResponse
                                    276 ;	-----------------------------------------
      008E46                        277 _SD_GetResponse:
                                    278 ;	../src/mmcsd.c: 753: while ((SD_ReadByte() != Response) && Count) 
      008E46 AE 0F FF         [ 2]  279 	ldw	x, #0x0fff
      008E49 90 5F            [ 1]  280 	clrw	y
      008E4B                        281 00102$:
      008E4B 89               [ 2]  282 	pushw	x
      008E4C 90 89            [ 2]  283 	pushw	y
      008E4E CD 90 04         [ 4]  284 	call	_SD_ReadByte
      008E51 90 85            [ 2]  285 	popw	y
      008E53 85               [ 2]  286 	popw	x
      008E54 11 03            [ 1]  287 	cp	a, (0x03, sp)
      008E56 27 10            [ 1]  288 	jreq	00104$
      008E58 5D               [ 2]  289 	tnzw	x
      008E59 26 04            [ 1]  290 	jrne	00134$
      008E5B 90 5D            [ 2]  291 	tnzw	y
      008E5D 27 09            [ 1]  292 	jreq	00104$
      008E5F                        293 00134$:
                                    294 ;	../src/mmcsd.c: 755: Count--;
      008E5F 1D 00 01         [ 2]  295 	subw	x, #0x0001
      008E62 24 E7            [ 1]  296 	jrnc	00102$
      008E64 90 5A            [ 2]  297 	decw	y
      008E66 20 E3            [ 2]  298 	jra	00102$
      008E68                        299 00104$:
                                    300 ;	../src/mmcsd.c: 757: if (Count == 0)
      008E68 5D               [ 2]  301 	tnzw	x
      008E69 26 07            [ 1]  302 	jrne	00106$
      008E6B 90 5D            [ 2]  303 	tnzw	y
      008E6D 26 03            [ 1]  304 	jrne	00106$
                                    305 ;	../src/mmcsd.c: 760: return SD_RESPONSE_FAILURE;
      008E6F A6 FF            [ 1]  306 	ld	a, #0xff
      008E71 81               [ 4]  307 	ret
      008E72                        308 00106$:
                                    309 ;	../src/mmcsd.c: 765: return SD_RESPONSE_NO_ERROR;
      008E72 4F               [ 1]  310 	clr	a
                                    311 ;	../src/mmcsd.c: 767: }
      008E73 81               [ 4]  312 	ret
                                    313 ;	../src/mmcsd.c: 772: void SD_GetResponseVal(uint8_t *pResp, uint8_t response)
                                    314 ;	-----------------------------------------
                                    315 ;	 function SD_GetResponseVal
                                    316 ;	-----------------------------------------
      008E74                        317 _SD_GetResponseVal:
                                    318 ;	../src/mmcsd.c: 775: if(SD_GetResponse(response) == SD_RESPONSE_FAILURE)
      008E74 7B 05            [ 1]  319 	ld	a, (0x05, sp)
      008E76 88               [ 1]  320 	push	a
      008E77 CD 8E 46         [ 4]  321 	call	_SD_GetResponse
      008E7A 5B 01            [ 2]  322 	addw	sp, #1
                                    323 ;	../src/mmcsd.c: 777: *pResp++ = 0xff;
      008E7C 16 03            [ 2]  324 	ldw	y, (0x03, sp)
      008E7E 93               [ 1]  325 	ldw	x, y
      008E7F 5C               [ 1]  326 	incw	x
                                    327 ;	../src/mmcsd.c: 775: if(SD_GetResponse(response) == SD_RESPONSE_FAILURE)
      008E80 4C               [ 1]  328 	inc	a
      008E81 26 08            [ 1]  329 	jrne	00102$
                                    330 ;	../src/mmcsd.c: 777: *pResp++ = 0xff;
      008E83 A6 FF            [ 1]  331 	ld	a, #0xff
      008E85 90 F7            [ 1]  332 	ld	(y), a
      008E87 1F 03            [ 2]  333 	ldw	(0x03, sp), x
      008E89 20 06            [ 2]  334 	jra	00103$
      008E8B                        335 00102$:
                                    336 ;	../src/mmcsd.c: 779: *pResp++ = response;
      008E8B 7B 05            [ 1]  337 	ld	a, (0x05, sp)
      008E8D 90 F7            [ 1]  338 	ld	(y), a
      008E8F 1F 03            [ 2]  339 	ldw	(0x03, sp), x
      008E91                        340 00103$:
                                    341 ;	../src/mmcsd.c: 782: *pResp++ = SD_ReadByte();
      008E91 1E 03            [ 2]  342 	ldw	x, (0x03, sp)
      008E93 89               [ 2]  343 	pushw	x
      008E94 CD 90 04         [ 4]  344 	call	_SD_ReadByte
      008E97 85               [ 2]  345 	popw	x
      008E98 F7               [ 1]  346 	ld	(x), a
      008E99 5C               [ 1]  347 	incw	x
                                    348 ;	../src/mmcsd.c: 783: *pResp++ = SD_ReadByte();
      008E9A 1F 03            [ 2]  349 	ldw	(0x03, sp), x
      008E9C 89               [ 2]  350 	pushw	x
      008E9D CD 90 04         [ 4]  351 	call	_SD_ReadByte
      008EA0 85               [ 2]  352 	popw	x
      008EA1 F7               [ 1]  353 	ld	(x), a
      008EA2 5C               [ 1]  354 	incw	x
                                    355 ;	../src/mmcsd.c: 784: *pResp++ = SD_ReadByte();
      008EA3 1F 03            [ 2]  356 	ldw	(0x03, sp), x
      008EA5 89               [ 2]  357 	pushw	x
      008EA6 CD 90 04         [ 4]  358 	call	_SD_ReadByte
      008EA9 85               [ 2]  359 	popw	x
      008EAA F7               [ 1]  360 	ld	(x), a
      008EAB 5C               [ 1]  361 	incw	x
                                    362 ;	../src/mmcsd.c: 785: *pResp++ = SD_ReadByte();
      008EAC 1F 03            [ 2]  363 	ldw	(0x03, sp), x
      008EAE 89               [ 2]  364 	pushw	x
      008EAF CD 90 04         [ 4]  365 	call	_SD_ReadByte
      008EB2 85               [ 2]  366 	popw	x
      008EB3 F7               [ 1]  367 	ld	(x), a
      008EB4 5C               [ 1]  368 	incw	x
                                    369 ;	../src/mmcsd.c: 786: *pResp = SD_ReadByte();
      008EB5 1F 03            [ 2]  370 	ldw	(0x03, sp), x
      008EB7 89               [ 2]  371 	pushw	x
      008EB8 CD 90 04         [ 4]  372 	call	_SD_ReadByte
      008EBB 85               [ 2]  373 	popw	x
      008EBC F7               [ 1]  374 	ld	(x), a
                                    375 ;	../src/mmcsd.c: 787: }
      008EBD 81               [ 4]  376 	ret
                                    377 ;	../src/mmcsd.c: 871: uint8_t SD_GoIdleState(void)
                                    378 ;	-----------------------------------------
                                    379 ;	 function SD_GoIdleState
                                    380 ;	-----------------------------------------
      008EBE                        381 _SD_GoIdleState:
      008EBE 52 0A            [ 2]  382 	sub	sp, #10
                                    383 ;	../src/mmcsd.c: 874: uint8_t resp[6] = {0};
      008EC0 0F 01            [ 1]  384 	clr	(0x01, sp)
      008EC2 96               [ 1]  385 	ldw	x, sp
      008EC3 5C               [ 1]  386 	incw	x
      008EC4 5C               [ 1]  387 	incw	x
      008EC5 7F               [ 1]  388 	clr	(x)
      008EC6 96               [ 1]  389 	ldw	x, sp
      008EC7 6F 03            [ 1]  390 	clr	(3, x)
      008EC9 96               [ 1]  391 	ldw	x, sp
      008ECA 1C 00 04         [ 2]  392 	addw	x, #4
      008ECD 1F 07            [ 2]  393 	ldw	(0x07, sp), x
      008ECF 7F               [ 1]  394 	clr	(x)
      008ED0 96               [ 1]  395 	ldw	x, sp
      008ED1 1C 00 05         [ 2]  396 	addw	x, #5
      008ED4 1F 09            [ 2]  397 	ldw	(0x09, sp), x
      008ED6 7F               [ 1]  398 	clr	(x)
      008ED7 96               [ 1]  399 	ldw	x, sp
      008ED8 1C 00 06         [ 2]  400 	addw	x, #6
      008EDB 7F               [ 1]  401 	clr	(x)
                                    402 ;	../src/mmcsd.c: 876: SD_CS_LOW();
      008EDC C6 50 0A         [ 1]  403 	ld	a, 0x500a
      008EDF A4 EF            [ 1]  404 	and	a, #0xef
      008EE1 C7 50 0A         [ 1]  405 	ld	0x500a, a
                                    406 ;	../src/mmcsd.c: 879: SD_SendCmd(SD_CMD_GO_IDLE_STATE, (uint32_t)0, 0x95);
      008EE4 4B 95            [ 1]  407 	push	#0x95
      008EE6 5F               [ 1]  408 	clrw	x
      008EE7 89               [ 2]  409 	pushw	x
      008EE8 5F               [ 1]  410 	clrw	x
      008EE9 89               [ 2]  411 	pushw	x
      008EEA 4B 00            [ 1]  412 	push	#0x00
      008EEC CD 8D 90         [ 4]  413 	call	_SD_SendCmd
      008EEF 5B 06            [ 2]  414 	addw	sp, #6
                                    415 ;	../src/mmcsd.c: 882: if (SD_GetResponse(SD_IN_IDLE_STATE))
      008EF1 4B 01            [ 1]  416 	push	#0x01
      008EF3 CD 8E 46         [ 4]  417 	call	_SD_GetResponse
      008EF6 5B 01            [ 2]  418 	addw	sp, #1
      008EF8 4D               [ 1]  419 	tnz	a
      008EF9 27 05            [ 1]  420 	jreq	00102$
                                    421 ;	../src/mmcsd.c: 885: return SD_RESPONSE_FAILURE;
      008EFB A6 FF            [ 1]  422 	ld	a, #0xff
      008EFD CC 8F EA         [ 2]  423 	jp	00116$
      008F00                        424 00102$:
                                    425 ;	../src/mmcsd.c: 888: SD_SendCmd(SD_CMD_IF_COND, (uint32_t)0x156, 0x43);
      008F00 4B 43            [ 1]  426 	push	#0x43
      008F02 4B 56            [ 1]  427 	push	#0x56
      008F04 4B 01            [ 1]  428 	push	#0x01
      008F06 5F               [ 1]  429 	clrw	x
      008F07 89               [ 2]  430 	pushw	x
      008F08 4B 08            [ 1]  431 	push	#0x08
      008F0A CD 8D 90         [ 4]  432 	call	_SD_SendCmd
      008F0D 5B 06            [ 2]  433 	addw	sp, #6
                                    434 ;	../src/mmcsd.c: 889: SD_GetResponseVal(resp,0x01);
      008F0F 4B 01            [ 1]  435 	push	#0x01
      008F11 96               [ 1]  436 	ldw	x, sp
      008F12 5C               [ 1]  437 	incw	x
      008F13 5C               [ 1]  438 	incw	x
      008F14 89               [ 2]  439 	pushw	x
      008F15 CD 8E 74         [ 4]  440 	call	_SD_GetResponseVal
      008F18 5B 03            [ 2]  441 	addw	sp, #3
                                    442 ;	../src/mmcsd.c: 890: if(resp[0]==0x01){
      008F1A 7B 01            [ 1]  443 	ld	a, (0x01, sp)
      008F1C 4A               [ 1]  444 	dec	a
      008F1D 26 77            [ 1]  445 	jrne	00123$
                                    446 ;	../src/mmcsd.c: 892: if ((resp[3] == 0x01)&&(resp[4] == 0x56)){
      008F1F 1E 07            [ 2]  447 	ldw	x, (0x07, sp)
      008F21 F6               [ 1]  448 	ld	a, (x)
      008F22 4A               [ 1]  449 	dec	a
      008F23 26 6D            [ 1]  450 	jrne	00107$
      008F25 1E 09            [ 2]  451 	ldw	x, (0x09, sp)
      008F27 F6               [ 1]  452 	ld	a, (x)
      008F28 A1 56            [ 1]  453 	cp	a, #0x56
      008F2A 26 66            [ 1]  454 	jrne	00107$
                                    455 ;	../src/mmcsd.c: 895: do{
      008F2C                        456 00103$:
                                    457 ;	../src/mmcsd.c: 896: SD_SendCmd(SD_CMD_55, (uint32_t)0, 0x01);
      008F2C 4B 01            [ 1]  458 	push	#0x01
      008F2E 5F               [ 1]  459 	clrw	x
      008F2F 89               [ 2]  460 	pushw	x
      008F30 5F               [ 1]  461 	clrw	x
      008F31 89               [ 2]  462 	pushw	x
      008F32 4B 37            [ 1]  463 	push	#0x37
      008F34 CD 8D 90         [ 4]  464 	call	_SD_SendCmd
      008F37 5B 06            [ 2]  465 	addw	sp, #6
                                    466 ;	../src/mmcsd.c: 897: SD_GetResponseVal(resp,0x01);
      008F39 4B 01            [ 1]  467 	push	#0x01
      008F3B 96               [ 1]  468 	ldw	x, sp
      008F3C 5C               [ 1]  469 	incw	x
      008F3D 5C               [ 1]  470 	incw	x
      008F3E 89               [ 2]  471 	pushw	x
      008F3F CD 8E 74         [ 4]  472 	call	_SD_GetResponseVal
      008F42 5B 03            [ 2]  473 	addw	sp, #3
                                    474 ;	../src/mmcsd.c: 898: dly((uint32_t)10);
      008F44 4B 0A            [ 1]  475 	push	#0x0a
      008F46 5F               [ 1]  476 	clrw	x
      008F47 89               [ 2]  477 	pushw	x
      008F48 4B 00            [ 1]  478 	push	#0x00
      008F4A CD 84 C7         [ 4]  479 	call	_dly
      008F4D 5B 04            [ 2]  480 	addw	sp, #4
                                    481 ;	../src/mmcsd.c: 899: SD_SendCmd(SD_ACMD_41&0x7f, (1UL<<30), 0x1);
      008F4F 4B 01            [ 1]  482 	push	#0x01
      008F51 5F               [ 1]  483 	clrw	x
      008F52 89               [ 2]  484 	pushw	x
      008F53 4B 00            [ 1]  485 	push	#0x00
      008F55 4B 40            [ 1]  486 	push	#0x40
      008F57 4B 69            [ 1]  487 	push	#0x69
      008F59 CD 8D 90         [ 4]  488 	call	_SD_SendCmd
      008F5C 5B 06            [ 2]  489 	addw	sp, #6
                                    490 ;	../src/mmcsd.c: 900: dly((uint32_t)1000);
      008F5E 4B E8            [ 1]  491 	push	#0xe8
      008F60 4B 03            [ 1]  492 	push	#0x03
      008F62 5F               [ 1]  493 	clrw	x
      008F63 89               [ 2]  494 	pushw	x
      008F64 CD 84 C7         [ 4]  495 	call	_dly
      008F67 5B 04            [ 2]  496 	addw	sp, #4
                                    497 ;	../src/mmcsd.c: 901: SD_GetResponseVal(resp,0x00);
      008F69 96               [ 1]  498 	ldw	x, sp
      008F6A 5C               [ 1]  499 	incw	x
      008F6B 4B 00            [ 1]  500 	push	#0x00
      008F6D 89               [ 2]  501 	pushw	x
      008F6E CD 8E 74         [ 4]  502 	call	_SD_GetResponseVal
      008F71 5B 03            [ 2]  503 	addw	sp, #3
                                    504 ;	../src/mmcsd.c: 902: } while(resp[0]); //until resved 0x0
      008F73 7B 01            [ 1]  505 	ld	a, (0x01, sp)
      008F75 26 B5            [ 1]  506 	jrne	00103$
                                    507 ;	../src/mmcsd.c: 904: SD_SendCmd(SD_CMD_58, (uint32_t)0,0x01);
      008F77 4B 01            [ 1]  508 	push	#0x01
      008F79 5F               [ 1]  509 	clrw	x
      008F7A 89               [ 2]  510 	pushw	x
      008F7B 5F               [ 1]  511 	clrw	x
      008F7C 89               [ 2]  512 	pushw	x
      008F7D 4B 3A            [ 1]  513 	push	#0x3a
      008F7F CD 8D 90         [ 4]  514 	call	_SD_SendCmd
      008F82 5B 06            [ 2]  515 	addw	sp, #6
                                    516 ;	../src/mmcsd.c: 905: SD_GetResponseVal(resp,58);
      008F84 4B 3A            [ 1]  517 	push	#0x3a
      008F86 96               [ 1]  518 	ldw	x, sp
      008F87 5C               [ 1]  519 	incw	x
      008F88 5C               [ 1]  520 	incw	x
      008F89 89               [ 2]  521 	pushw	x
      008F8A CD 8E 74         [ 4]  522 	call	_SD_GetResponseVal
      008F8D 5B 03            [ 2]  523 	addw	sp, #3
                                    524 ;	../src/mmcsd.c: 906: return SD_RESPONSE_NO_ERROR;
      008F8F 4F               [ 1]  525 	clr	a
      008F90 20 58            [ 2]  526 	jra	00116$
      008F92                        527 00107$:
                                    528 ;	../src/mmcsd.c: 909: return SD_RESPONSE_FAILURE;
      008F92 A6 FF            [ 1]  529 	ld	a, #0xff
      008F94 20 54            [ 2]  530 	jra	00116$
                                    531 ;	../src/mmcsd.c: 914: do{
      008F96                        532 00123$:
      008F96                        533 00110$:
                                    534 ;	../src/mmcsd.c: 915: SD_SendCmd(SD_CMD_55, 0, 0x01);
      008F96 4B 01            [ 1]  535 	push	#0x01
      008F98 5F               [ 1]  536 	clrw	x
      008F99 89               [ 2]  537 	pushw	x
      008F9A 5F               [ 1]  538 	clrw	x
      008F9B 89               [ 2]  539 	pushw	x
      008F9C 4B 37            [ 1]  540 	push	#0x37
      008F9E CD 8D 90         [ 4]  541 	call	_SD_SendCmd
      008FA1 5B 06            [ 2]  542 	addw	sp, #6
                                    543 ;	../src/mmcsd.c: 916: SD_GetResponseVal(resp,0x01);
      008FA3 96               [ 1]  544 	ldw	x, sp
      008FA4 5C               [ 1]  545 	incw	x
      008FA5 4B 01            [ 1]  546 	push	#0x01
      008FA7 89               [ 2]  547 	pushw	x
      008FA8 CD 8E 74         [ 4]  548 	call	_SD_GetResponseVal
      008FAB 5B 03            [ 2]  549 	addw	sp, #3
                                    550 ;	../src/mmcsd.c: 917: dly((uint32_t)1000);
      008FAD 4B E8            [ 1]  551 	push	#0xe8
      008FAF 4B 03            [ 1]  552 	push	#0x03
      008FB1 5F               [ 1]  553 	clrw	x
      008FB2 89               [ 2]  554 	pushw	x
      008FB3 CD 84 C7         [ 4]  555 	call	_dly
      008FB6 5B 04            [ 2]  556 	addw	sp, #4
                                    557 ;	../src/mmcsd.c: 918: SD_SendCmd(SD_ACMD_41&0x7f, 0UL, 0x1);
      008FB8 4B 01            [ 1]  558 	push	#0x01
      008FBA 5F               [ 1]  559 	clrw	x
      008FBB 89               [ 2]  560 	pushw	x
      008FBC 5F               [ 1]  561 	clrw	x
      008FBD 89               [ 2]  562 	pushw	x
      008FBE 4B 69            [ 1]  563 	push	#0x69
      008FC0 CD 8D 90         [ 4]  564 	call	_SD_SendCmd
      008FC3 5B 06            [ 2]  565 	addw	sp, #6
                                    566 ;	../src/mmcsd.c: 919: SD_GetResponseVal(resp,0x00);
      008FC5 4B 00            [ 1]  567 	push	#0x00
      008FC7 96               [ 1]  568 	ldw	x, sp
      008FC8 5C               [ 1]  569 	incw	x
      008FC9 5C               [ 1]  570 	incw	x
      008FCA 89               [ 2]  571 	pushw	x
      008FCB CD 8E 74         [ 4]  572 	call	_SD_GetResponseVal
      008FCE 5B 03            [ 2]  573 	addw	sp, #3
                                    574 ;	../src/mmcsd.c: 920: dly((uint32_t)1000);
      008FD0 4B E8            [ 1]  575 	push	#0xe8
      008FD2 4B 03            [ 1]  576 	push	#0x03
      008FD4 5F               [ 1]  577 	clrw	x
      008FD5 89               [ 2]  578 	pushw	x
      008FD6 CD 84 C7         [ 4]  579 	call	_dly
      008FD9 5B 04            [ 2]  580 	addw	sp, #4
                                    581 ;	../src/mmcsd.c: 921: } while(resp[0]);
      008FDB 7B 01            [ 1]  582 	ld	a, (0x01, sp)
      008FDD 26 B7            [ 1]  583 	jrne	00110$
                                    584 ;	../src/mmcsd.c: 926: SD_CS_HIGH();
      008FDF 72 18 50 0A      [ 1]  585 	bset	20490, #4
                                    586 ;	../src/mmcsd.c: 929: SD_WriteByte(SD_DUMMY_BYTE);
      008FE3 4B FF            [ 1]  587 	push	#0xff
      008FE5 CD 8F ED         [ 4]  588 	call	_SD_WriteByte
      008FE8 84               [ 1]  589 	pop	a
                                    590 ;	../src/mmcsd.c: 931: return SD_RESPONSE_NO_ERROR;
      008FE9 4F               [ 1]  591 	clr	a
      008FEA                        592 00116$:
                                    593 ;	../src/mmcsd.c: 932: }
      008FEA 5B 0A            [ 2]  594 	addw	sp, #10
      008FEC 81               [ 4]  595 	ret
                                    596 ;	../src/mmcsd.c: 941: uint8_t SD_WriteByte(uint8_t Data)
                                    597 ;	-----------------------------------------
                                    598 ;	 function SD_WriteByte
                                    599 ;	-----------------------------------------
      008FED                        600 _SD_WriteByte:
                                    601 ;	../src/mmcsd.c: 944: while ((SPI->SR & SPI_FLAG_TXE) == 0)
      008FED                        602 00101$:
      008FED C6 52 03         [ 1]  603 	ld	a, 0x5203
      008FF0 A5 02            [ 1]  604 	bcp	a, #0x02
      008FF2 27 F9            [ 1]  605 	jreq	00101$
                                    606 ;	../src/mmcsd.c: 948: SPI->DR = (Data);
      008FF4 AE 52 04         [ 2]  607 	ldw	x, #0x5204
      008FF7 7B 03            [ 1]  608 	ld	a, (0x03, sp)
      008FF9 F7               [ 1]  609 	ld	(x), a
                                    610 ;	../src/mmcsd.c: 951: while ((SPI->SR & SPI_FLAG_RXNE) == 0)
      008FFA                        611 00104$:
      008FFA C6 52 03         [ 1]  612 	ld	a, 0x5203
      008FFD 44               [ 1]  613 	srl	a
      008FFE 24 FA            [ 1]  614 	jrnc	00104$
                                    615 ;	../src/mmcsd.c: 955: return SPI->DR;
      009000 C6 52 04         [ 1]  616 	ld	a, 0x5204
                                    617 ;	../src/mmcsd.c: 956: }
      009003 81               [ 4]  618 	ret
                                    619 ;	../src/mmcsd.c: 963: uint8_t SD_ReadByte(void)
                                    620 ;	-----------------------------------------
                                    621 ;	 function SD_ReadByte
                                    622 ;	-----------------------------------------
      009004                        623 _SD_ReadByte:
                                    624 ;	../src/mmcsd.c: 968: while ((SPI->SR & SPI_FLAG_TXE) == 0)
      009004                        625 00101$:
      009004 C6 52 03         [ 1]  626 	ld	a, 0x5203
      009007 A5 02            [ 1]  627 	bcp	a, #0x02
      009009 27 F9            [ 1]  628 	jreq	00101$
                                    629 ;	../src/mmcsd.c: 971: SPI->DR = SD_DUMMY_BYTE;
      00900B 35 FF 52 04      [ 1]  630 	mov	0x5204+0, #0xff
                                    631 ;	../src/mmcsd.c: 974: while ((SPI->SR & SPI_FLAG_RXNE) == 0)
      00900F                        632 00104$:
      00900F C6 52 03         [ 1]  633 	ld	a, 0x5203
      009012 44               [ 1]  634 	srl	a
      009013 24 FA            [ 1]  635 	jrnc	00104$
                                    636 ;	../src/mmcsd.c: 977: Data = (uint8_t)SPI->DR;
      009015 C6 52 04         [ 1]  637 	ld	a, 0x5204
                                    638 ;	../src/mmcsd.c: 980: return Data;
                                    639 ;	../src/mmcsd.c: 981: }
      009018 81               [ 4]  640 	ret
                                    641 ;	../src/mmcsd.c: 1025: void SD_LowLevel_Init(void)
                                    642 ;	-----------------------------------------
                                    643 ;	 function SD_LowLevel_Init
                                    644 ;	-----------------------------------------
      009019                        645 _SD_LowLevel_Init:
                                    646 ;	../src/mmcsd.c: 1035: SPI->CR1 = SPI_FIRSTBIT_MSB | SPI_BAUDRATEPRESCALER_64|SPI_CLOCKPOLARITY_HIGH | SPI_CLOCKPHASE_2EDGE;
      009019 35 2B 52 00      [ 1]  647 	mov	0x5200+0, #0x2b
                                    648 ;	../src/mmcsd.c: 1037: SPI->CR2 = SPI_DATADIRECTION_2LINES_FULLDUPLEX|SPI_NSS_SOFT;
      00901D 35 02 52 01      [ 1]  649 	mov	0x5201+0, #0x02
                                    650 ;	../src/mmcsd.c: 1038: SPI->CR2 |= SPI_CR2_SSI;
      009021 72 10 52 01      [ 1]  651 	bset	20993, #0
                                    652 ;	../src/mmcsd.c: 1040: SPI->CR1 |= SPI_MODE_MASTER;
      009025 72 14 52 00      [ 1]  653 	bset	20992, #2
                                    654 ;	../src/mmcsd.c: 1042: SPI->CRCPR = 0x07;
      009029 35 07 52 05      [ 1]  655 	mov	0x5205+0, #0x07
                                    656 ;	../src/mmcsd.c: 1045: SPI->CR1 |= SPI_CR1_SPE;
      00902D 72 1C 52 00      [ 1]  657 	bset	20992, #6
                                    658 ;	../src/mmcsd.c: 1049: SD_CS_GPIO_PORT->CR2 &= (~SD_CS_PIN); //Reset corresponding bit
      009031 72 19 50 0E      [ 1]  659 	bres	20494, #4
                                    660 ;	../src/mmcsd.c: 1050: SD_CS_GPIO_PORT->ODR |= SD_CS_PIN; // high level
      009035 72 18 50 0A      [ 1]  661 	bset	20490, #4
                                    662 ;	../src/mmcsd.c: 1051: SD_CS_GPIO_PORT->DDR |= SD_CS_PIN; // output mode 
      009039 72 18 50 0C      [ 1]  663 	bset	20492, #4
                                    664 ;	../src/mmcsd.c: 1052: SD_CS_GPIO_PORT->CR1 &= ~SD_CS_PIN; //open drain here
      00903D 72 19 50 0D      [ 1]  665 	bres	20493, #4
                                    666 ;	../src/mmcsd.c: 1053: }
      009041 81               [ 4]  667 	ret
                                    668 	.area CODE
                                    669 	.area CONST
                                    670 	.area INITIALIZER
                                    671 	.area CABS (ABS)
