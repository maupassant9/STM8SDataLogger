;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Linux)
;--------------------------------------------------------
	.module mmcsd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SD_GetResponseVal
	.globl _dly
	.globl _SD_Init
	.globl _SD_Detect
	.globl _SD_SendCmd
	.globl _SD_GetDataResponse
	.globl _SD_GetResponse
	.globl _SD_GoIdleState
	.globl _SD_WriteByte
	.globl _SD_ReadByte
	.globl _SD_LowLevel_Init
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	../src/mmcsd.c: 90: uint8_t SD_Init(void)
;	-----------------------------------------
;	 function SD_Init
;	-----------------------------------------
_SD_Init:
	sub	sp, #4
;	../src/mmcsd.c: 96: SD_LowLevel_Init();
	call	_SD_LowLevel_Init
;	../src/mmcsd.c: 99: SD_CS_LOW();
	bres	20490, #4
;	../src/mmcsd.c: 103: for (i = 0; i <= 9; i++)
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
00104$:
;	../src/mmcsd.c: 106: SD_WriteByte(SD_DUMMY_BYTE);
	push	#0xff
	call	_SD_WriteByte
	pop	a
;	../src/mmcsd.c: 103: for (i = 0; i <= 9; i++)
	ldw	x, (0x03, sp)
	incw	x
	ldw	(0x03, sp), x
	jrne	00119$
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
00119$:
	ldw	x, #0x0009
	cpw	x, (0x03, sp)
	clr	a
	sbc	a, (0x02, sp)
	clr	a
	sbc	a, (0x01, sp)
	jrnc	00104$
;	../src/mmcsd.c: 110: res = SD_GoIdleState();
	call	_SD_GoIdleState
;	../src/mmcsd.c: 116: return (res);
	clr	a
;	../src/mmcsd.c: 117: }
	addw	sp, #4
	ret
;	../src/mmcsd.c: 124: uint8_t SD_Detect(void)
;	-----------------------------------------
;	 function SD_Detect
;	-----------------------------------------
_SD_Detect:
	push	a
;	../src/mmcsd.c: 126: __IO uint8_t status = SD_PRESENT;
;	../src/mmcsd.c: 136: return SD_PRESENT;
	ld	a, #0x01
	ld	(0x01, sp), a
;	../src/mmcsd.c: 138: }
	addw	sp, #1
	ret
;	../src/mmcsd.c: 663: void SD_SendCmd(uint8_t Cmd, uint32_t Arg, uint8_t Crc)
;	-----------------------------------------
;	 function SD_SendCmd
;	-----------------------------------------
_SD_SendCmd:
	sub	sp, #10
;	../src/mmcsd.c: 669: Frame[0] = (uint8_t)(Cmd | 0x40); /*!< Construct byte 1 */
	ld	a, (0x0d, sp)
	or	a, #0x40
	ld	(0x01, sp), a
;	../src/mmcsd.c: 671: Frame[1] = (uint8_t)(Arg >> 24); /*!< Construct byte 2 */
	ldw	x, sp
	incw	x
	incw	x
	ld	a, (0x0e, sp)
	clr	(0x07, sp)
	ld	(x), a
;	../src/mmcsd.c: 673: Frame[2] = (uint8_t)(Arg >> 16); /*!< Construct byte 3 */
	ldw	x, sp
	addw	x, #3
	ldw	y, (0x0e, sp)
	clr	(0x07, sp)
	ld	a, yl
	ld	(x), a
;	../src/mmcsd.c: 675: Frame[3] = (uint8_t)(Arg >> 8); /*!< Construct byte 4 */
	ldw	x, sp
	addw	x, #4
	ldw	y, (0x10, sp)
	ld	a, yh
	ld	(x), a
;	../src/mmcsd.c: 677: Frame[4] = (uint8_t)(Arg); /*!< Construct byte 5 */
	ldw	x, sp
	ld	a, (0x11, sp)
	ld	(5, x), a
;	../src/mmcsd.c: 679: Frame[5] = (Crc); /*!< Construct CRC: byte 6 */
	ldw	x, sp
	ld	a, (0x12, sp)
	ld	(6, x), a
;	../src/mmcsd.c: 681: for (i = 0; i < 6; i++)
	clrw	x
	ldw	(0x09, sp), x
	ldw	(0x07, sp), x
00102$:
;	../src/mmcsd.c: 683: SD_WriteByte(Frame[i]); /*!< Send the Cmd bytes */
	ldw	x, sp
	incw	x
	addw	x, (0x09, sp)
	ld	a, (x)
	push	a
	call	_SD_WriteByte
	pop	a
;	../src/mmcsd.c: 681: for (i = 0; i < 6; i++)
	ldw	x, (0x09, sp)
	incw	x
	ldw	(0x09, sp), x
	jrne	00112$
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x07, sp), x
00112$:
	ldw	x, (0x09, sp)
	cpw	x, #0x0006
	ld	a, (0x08, sp)
	sbc	a, #0x00
	ld	a, (0x07, sp)
	sbc	a, #0x00
	jrc	00102$
;	../src/mmcsd.c: 685: }
	addw	sp, #10
	ret
;	../src/mmcsd.c: 699: uint8_t SD_GetDataResponse(void)
;	-----------------------------------------
;	 function SD_GetDataResponse
;	-----------------------------------------
_SD_GetDataResponse:
	sub	sp, #5
;	../src/mmcsd.c: 702: uint8_t response = 0, rvalue = 0;
	clr	(0x01, sp)
;	../src/mmcsd.c: 704: while (i <= 64)
	clrw	x
	ldw	(0x04, sp), x
	ldw	(0x02, sp), x
00108$:
	ldw	x, #0x0040
	cpw	x, (0x04, sp)
	clr	a
	sbc	a, (0x03, sp)
	clr	a
	sbc	a, (0x02, sp)
	jrc	00111$
;	../src/mmcsd.c: 707: response = SD_ReadByte();
	call	_SD_ReadByte
;	../src/mmcsd.c: 709: response &= 0x1F;
	and	a, #0x1f
;	../src/mmcsd.c: 710: switch (response)
	ld	(0x01, sp), a
	cp	a, #0x05
	jreq	00101$
	ld	a, (0x01, sp)
	cp	a, #0x0b
	jreq	00102$
	ld	a, (0x01, sp)
	cp	a, #0x0d
	jreq	00103$
	jra	00104$
;	../src/mmcsd.c: 712: case SD_DATA_OK:
00101$:
;	../src/mmcsd.c: 714: rvalue = SD_DATA_OK;
	ld	a, #0x05
;	../src/mmcsd.c: 715: break;
	jra	00105$
;	../src/mmcsd.c: 717: case SD_DATA_CRC_ERROR:
00102$:
;	../src/mmcsd.c: 718: return SD_DATA_CRC_ERROR;
	ld	a, #0x0b
	jra	00114$
;	../src/mmcsd.c: 719: case SD_DATA_WRITE_ERROR:
00103$:
;	../src/mmcsd.c: 720: return SD_DATA_WRITE_ERROR;
	ld	a, #0x0d
	jra	00114$
;	../src/mmcsd.c: 721: default:
00104$:
;	../src/mmcsd.c: 723: rvalue = SD_DATA_OTHER_ERROR;
	ld	a, #0xff
;	../src/mmcsd.c: 726: }
00105$:
;	../src/mmcsd.c: 728: if (rvalue == SD_DATA_OK)
	cp	a, #0x05
	jreq	00111$
;	../src/mmcsd.c: 731: i++;
	ldw	x, (0x04, sp)
	incw	x
	ldw	(0x04, sp), x
	jrne	00108$
	ldw	x, (0x02, sp)
	incw	x
	ldw	(0x02, sp), x
	jra	00108$
;	../src/mmcsd.c: 735: while (SD_ReadByte() == 0);
00111$:
	call	_SD_ReadByte
	tnz	a
	jreq	00111$
;	../src/mmcsd.c: 738: return response;
	ld	a, (0x01, sp)
00114$:
;	../src/mmcsd.c: 739: }
	addw	sp, #5
	ret
;	../src/mmcsd.c: 748: uint8_t SD_GetResponse(uint8_t Response)
;	-----------------------------------------
;	 function SD_GetResponse
;	-----------------------------------------
_SD_GetResponse:
;	../src/mmcsd.c: 753: while ((SD_ReadByte() != Response) && Count) 
	ldw	x, #0x0fff
	clrw	y
00102$:
	pushw	x
	pushw	y
	call	_SD_ReadByte
	popw	y
	popw	x
	cp	a, (0x03, sp)
	jreq	00104$
	tnzw	x
	jrne	00134$
	tnzw	y
	jreq	00104$
00134$:
;	../src/mmcsd.c: 755: Count--;
	subw	x, #0x0001
	jrnc	00102$
	decw	y
	jra	00102$
00104$:
;	../src/mmcsd.c: 757: if (Count == 0)
	tnzw	x
	jrne	00106$
	tnzw	y
	jrne	00106$
;	../src/mmcsd.c: 760: return SD_RESPONSE_FAILURE;
	ld	a, #0xff
	ret
00106$:
;	../src/mmcsd.c: 765: return SD_RESPONSE_NO_ERROR;
	clr	a
;	../src/mmcsd.c: 767: }
	ret
;	../src/mmcsd.c: 772: void SD_GetResponseVal(uint8_t *pResp, uint8_t response)
;	-----------------------------------------
;	 function SD_GetResponseVal
;	-----------------------------------------
_SD_GetResponseVal:
;	../src/mmcsd.c: 775: if(SD_GetResponse(response) == SD_RESPONSE_FAILURE)
	ld	a, (0x05, sp)
	push	a
	call	_SD_GetResponse
	addw	sp, #1
;	../src/mmcsd.c: 777: *pResp++ = 0xff;
	ldw	y, (0x03, sp)
	ldw	x, y
	incw	x
;	../src/mmcsd.c: 775: if(SD_GetResponse(response) == SD_RESPONSE_FAILURE)
	inc	a
	jrne	00102$
;	../src/mmcsd.c: 777: *pResp++ = 0xff;
	ld	a, #0xff
	ld	(y), a
	ldw	(0x03, sp), x
	jra	00103$
00102$:
;	../src/mmcsd.c: 779: *pResp++ = response;
	ld	a, (0x05, sp)
	ld	(y), a
	ldw	(0x03, sp), x
00103$:
;	../src/mmcsd.c: 782: *pResp++ = SD_ReadByte();
	ldw	x, (0x03, sp)
	pushw	x
	call	_SD_ReadByte
	popw	x
	ld	(x), a
	incw	x
;	../src/mmcsd.c: 783: *pResp++ = SD_ReadByte();
	ldw	(0x03, sp), x
	pushw	x
	call	_SD_ReadByte
	popw	x
	ld	(x), a
	incw	x
;	../src/mmcsd.c: 784: *pResp++ = SD_ReadByte();
	ldw	(0x03, sp), x
	pushw	x
	call	_SD_ReadByte
	popw	x
	ld	(x), a
	incw	x
;	../src/mmcsd.c: 785: *pResp++ = SD_ReadByte();
	ldw	(0x03, sp), x
	pushw	x
	call	_SD_ReadByte
	popw	x
	ld	(x), a
	incw	x
;	../src/mmcsd.c: 786: *pResp = SD_ReadByte();
	ldw	(0x03, sp), x
	pushw	x
	call	_SD_ReadByte
	popw	x
	ld	(x), a
;	../src/mmcsd.c: 787: }
	ret
;	../src/mmcsd.c: 871: uint8_t SD_GoIdleState(void)
;	-----------------------------------------
;	 function SD_GoIdleState
;	-----------------------------------------
_SD_GoIdleState:
	sub	sp, #10
;	../src/mmcsd.c: 874: uint8_t resp[6] = {0};
	clr	(0x01, sp)
	ldw	x, sp
	incw	x
	incw	x
	clr	(x)
	ldw	x, sp
	clr	(3, x)
	ldw	x, sp
	addw	x, #4
	ldw	(0x07, sp), x
	clr	(x)
	ldw	x, sp
	addw	x, #5
	ldw	(0x09, sp), x
	clr	(x)
	ldw	x, sp
	addw	x, #6
	clr	(x)
;	../src/mmcsd.c: 876: SD_CS_LOW();
	ld	a, 0x500a
	and	a, #0xef
	ld	0x500a, a
;	../src/mmcsd.c: 879: SD_SendCmd(SD_CMD_GO_IDLE_STATE, (uint32_t)0, 0x95);
	push	#0x95
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	push	#0x00
	call	_SD_SendCmd
	addw	sp, #6
;	../src/mmcsd.c: 882: if (SD_GetResponse(SD_IN_IDLE_STATE))
	push	#0x01
	call	_SD_GetResponse
	addw	sp, #1
	tnz	a
	jreq	00102$
;	../src/mmcsd.c: 885: return SD_RESPONSE_FAILURE;
	ld	a, #0xff
	jp	00116$
00102$:
;	../src/mmcsd.c: 888: SD_SendCmd(SD_CMD_IF_COND, (uint32_t)0x156, 0x43);
	push	#0x43
	push	#0x56
	push	#0x01
	clrw	x
	pushw	x
	push	#0x08
	call	_SD_SendCmd
	addw	sp, #6
;	../src/mmcsd.c: 889: SD_GetResponseVal(resp,0x01);
	push	#0x01
	ldw	x, sp
	incw	x
	incw	x
	pushw	x
	call	_SD_GetResponseVal
	addw	sp, #3
;	../src/mmcsd.c: 890: if(resp[0]==0x01){
	ld	a, (0x01, sp)
	dec	a
	jrne	00123$
;	../src/mmcsd.c: 892: if ((resp[3] == 0x01)&&(resp[4] == 0x56)){
	ldw	x, (0x07, sp)
	ld	a, (x)
	dec	a
	jrne	00107$
	ldw	x, (0x09, sp)
	ld	a, (x)
	cp	a, #0x56
	jrne	00107$
;	../src/mmcsd.c: 895: do{
00103$:
;	../src/mmcsd.c: 896: SD_SendCmd(SD_CMD_55, (uint32_t)0, 0x01);
	push	#0x01
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	push	#0x37
	call	_SD_SendCmd
	addw	sp, #6
;	../src/mmcsd.c: 897: SD_GetResponseVal(resp,0x01);
	push	#0x01
	ldw	x, sp
	incw	x
	incw	x
	pushw	x
	call	_SD_GetResponseVal
	addw	sp, #3
;	../src/mmcsd.c: 898: dly((uint32_t)100);
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	_dly
	addw	sp, #4
;	../src/mmcsd.c: 899: SD_SendCmd(SD_ACMD_41&0x7f, (1UL<<30), 0x1);
	push	#0x01
	clrw	x
	pushw	x
	push	#0x00
	push	#0x40
	push	#0x69
	call	_SD_SendCmd
	addw	sp, #6
;	../src/mmcsd.c: 900: dly((uint32_t)10000);
	push	#0x10
	push	#0x27
	clrw	x
	pushw	x
	call	_dly
	addw	sp, #4
;	../src/mmcsd.c: 901: SD_GetResponseVal(resp,0x00);
	ldw	x, sp
	incw	x
	push	#0x00
	pushw	x
	call	_SD_GetResponseVal
	addw	sp, #3
;	../src/mmcsd.c: 902: } while(resp[0]); //until resved 0x0
	ld	a, (0x01, sp)
	jrne	00103$
;	../src/mmcsd.c: 904: SD_SendCmd(SD_CMD_58, (uint32_t)0,0x01);
	push	#0x01
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	push	#0x3a
	call	_SD_SendCmd
	addw	sp, #6
;	../src/mmcsd.c: 905: SD_GetResponseVal(resp,58);
	push	#0x3a
	ldw	x, sp
	incw	x
	incw	x
	pushw	x
	call	_SD_GetResponseVal
	addw	sp, #3
;	../src/mmcsd.c: 906: return SD_RESPONSE_NO_ERROR;
	clr	a
	jra	00116$
00107$:
;	../src/mmcsd.c: 909: return SD_RESPONSE_FAILURE;
	ld	a, #0xff
	jra	00116$
;	../src/mmcsd.c: 914: do{
00123$:
00110$:
;	../src/mmcsd.c: 915: SD_SendCmd(SD_CMD_55, 0, 0x01);
	push	#0x01
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	push	#0x37
	call	_SD_SendCmd
	addw	sp, #6
;	../src/mmcsd.c: 916: SD_GetResponseVal(resp,0x01);
	ldw	x, sp
	incw	x
	push	#0x01
	pushw	x
	call	_SD_GetResponseVal
	addw	sp, #3
;	../src/mmcsd.c: 917: dly((uint32_t)10000);
	push	#0x10
	push	#0x27
	clrw	x
	pushw	x
	call	_dly
	addw	sp, #4
;	../src/mmcsd.c: 918: SD_SendCmd(SD_ACMD_41&0x7f, 0UL, 0x1);
	push	#0x01
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	push	#0x69
	call	_SD_SendCmd
	addw	sp, #6
;	../src/mmcsd.c: 919: SD_GetResponseVal(resp,0x00);
	push	#0x00
	ldw	x, sp
	incw	x
	incw	x
	pushw	x
	call	_SD_GetResponseVal
	addw	sp, #3
;	../src/mmcsd.c: 920: dly((uint32_t)10000);
	push	#0x10
	push	#0x27
	clrw	x
	pushw	x
	call	_dly
	addw	sp, #4
;	../src/mmcsd.c: 921: } while(resp[0]);
	ld	a, (0x01, sp)
	jrne	00110$
;	../src/mmcsd.c: 926: SD_CS_HIGH();
	bset	20490, #4
;	../src/mmcsd.c: 929: SD_WriteByte(SD_DUMMY_BYTE);
	push	#0xff
	call	_SD_WriteByte
	pop	a
;	../src/mmcsd.c: 931: return SD_RESPONSE_NO_ERROR;
	clr	a
00116$:
;	../src/mmcsd.c: 932: }
	addw	sp, #10
	ret
;	../src/mmcsd.c: 941: uint8_t SD_WriteByte(uint8_t Data)
;	-----------------------------------------
;	 function SD_WriteByte
;	-----------------------------------------
_SD_WriteByte:
;	../src/mmcsd.c: 944: while (SPI->SR & (SPI_FLAG_TXE) == 0)
	ld	a, 0x5203
;	../src/mmcsd.c: 948: SPI->DR = (Data);
	ldw	x, #0x5204
	ld	a, (0x03, sp)
	ld	(x), a
;	../src/mmcsd.c: 951: while (SPI->SR & (SPI_FLAG_RXNE) == 0)
	ld	a, 0x5203
;	../src/mmcsd.c: 955: return SPI->DR;
	ld	a, 0x5204
;	../src/mmcsd.c: 956: }
	ret
;	../src/mmcsd.c: 963: uint8_t SD_ReadByte(void)
;	-----------------------------------------
;	 function SD_ReadByte
;	-----------------------------------------
_SD_ReadByte:
;	../src/mmcsd.c: 968: while (SPI->SR&(SPI_FLAG_TXE) == 0)
	ld	a, 0x5203
;	../src/mmcsd.c: 971: SPI->DR = SD_DUMMY_BYTE;
	mov	0x5204+0, #0xff
;	../src/mmcsd.c: 974: while (SPI->SR&(SPI_FLAG_RXNE) == 0)
	ld	a, 0x5203
;	../src/mmcsd.c: 977: Data = SPI->DR;
	ld	a, 0x5204
;	../src/mmcsd.c: 980: return Data;
;	../src/mmcsd.c: 981: }
	ret
;	../src/mmcsd.c: 1025: void SD_LowLevel_Init(void)
;	-----------------------------------------
;	 function SD_LowLevel_Init
;	-----------------------------------------
_SD_LowLevel_Init:
;	../src/mmcsd.c: 1035: SPI->CR1 = SPI_FIRSTBIT_MSB | SPI_BAUDRATEPRESCALER_64|SPI_CLOCKPOLARITY_HIGH | SPI_CLOCKPHASE_2EDGE;
	mov	0x5200+0, #0x2b
;	../src/mmcsd.c: 1037: SPI->CR2 = SPI_DATADIRECTION_2LINES_FULLDUPLEX|SPI_NSS_SOFT|SPI_CR2_SSI;
	mov	0x5201+0, #0x03
;	../src/mmcsd.c: 1039: SPI->CR1 |= SPI_MODE_MASTER;
	bset	20992, #2
;	../src/mmcsd.c: 1041: SPI->CRCPR = 0x07;
	mov	0x5205+0, #0x07
;	../src/mmcsd.c: 1044: SPI->CR1 |= SPI_CR1_SPE;
	bset	20992, #6
;	../src/mmcsd.c: 1048: SD_CS_GPIO_PORT->CR2 &= (~SD_CS_PIN); //Reset corresponding bit
	bres	20494, #4
;	../src/mmcsd.c: 1049: SD_CS_GPIO_PORT->ODR |= SD_CS_PIN; // high level
	bset	20490, #4
;	../src/mmcsd.c: 1050: SD_CS_GPIO_PORT->DDR |= SD_CS_PIN; // output mode 
	bset	20492, #4
;	../src/mmcsd.c: 1051: SD_CS_GPIO_PORT->CR1 &= ~SD_CS_PIN; //open drain here
	bres	20493, #4
;	../src/mmcsd.c: 1052: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
