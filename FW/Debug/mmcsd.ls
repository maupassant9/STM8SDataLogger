   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  63                     .const:	section	.text
  64  0000               L21:
  65  0000 0000000a      	dc.l	10
  66                     ; 90 uint8_t SD_Init(void)
  66                     ; 91 {
  67                     	scross	off
  68                     	switch	.text
  69  0000               _SD_Init:
  71  0000 5205          	subw	sp,#5
  72       00000005      OFST:	set	5
  75                     ; 92   uint32_t i = 0;
  77                     ; 96   SD_LowLevel_Init();
  79  0002 cd027b        	call	_SD_LowLevel_Init
  81                     ; 99   SD_CS_LOW();
  83  0005 7219500a      	bres	20490,#4
  84                     ; 103   for (i = 0; i <= 9; i++)
  86  0009 5f            	clrw	x
  87  000a 1f04          	ldw	(OFST-1,sp),x
  88  000c 1f02          	ldw	(OFST-3,sp),x
  90  000e               L72:
  91                     ; 106     SD_WriteByte(SD_DUMMY_BYTE);
  93  000e a6ff          	ld	a,#255
  94  0010 cd0258        	call	_SD_WriteByte
  96                     ; 103   for (i = 0; i <= 9; i++)
  98  0013 96            	ldw	x,sp
  99  0014 1c0002        	addw	x,#OFST-3
 100  0017 a601          	ld	a,#1
 101  0019 cd0000        	call	c_lgadc
 106  001c 96            	ldw	x,sp
 107  001d 1c0002        	addw	x,#OFST-3
 108  0020 cd0000        	call	c_ltor
 110  0023 ae0000        	ldw	x,#L21
 111  0026 cd0000        	call	c_lcmp
 113  0029 25e3          	jrult	L72
 114                     ; 110   res = SD_GoIdleState();
 116  002b cd0150        	call	_SD_GoIdleState
 118  002e 6b01          	ld	(OFST-4,sp),a
 120                     ; 112   if(res == SD_RESPONSE_NO_ERROR){
 122  0030 260a          	jrne	L53
 123                     ; 113     SPI->CR1 &= 0xc7;
 125  0032 c65200        	ld	a,20992
 126  0035 a4c7          	and	a,#199
 127  0037 c75200        	ld	20992,a
 128  003a 7b01          	ld	a,(OFST-4,sp)
 129  003c               L53:
 130                     ; 116   return (res);
 134  003c 5b05          	addw	sp,#5
 135  003e 81            	ret	
 169                     ; 124 uint8_t SD_Detect(void)
 169                     ; 125 {
 170                     	switch	.text
 171  003f               _SD_Detect:
 173  003f 88            	push	a
 174       00000001      OFST:	set	1
 177                     ; 126   __IO uint8_t status = SD_PRESENT;
 179  0040 a601          	ld	a,#1
 180  0042 6b01          	ld	(OFST+0,sp),a
 182                     ; 136     return SD_PRESENT;
 186  0044 5b01          	addw	sp,#1
 187  0046 81            	ret	
 251                     	switch	.const
 252  0004               L42:
 253  0004 00000006      	dc.l	6
 254                     ; 663 void SD_SendCmd(uint8_t Cmd, uint32_t Arg, uint8_t Crc)
 254                     ; 664 {
 255                     	switch	.text
 256  0047               _SD_SendCmd:
 258  0047 88            	push	a
 259  0048 520a          	subw	sp,#10
 260       0000000a      OFST:	set	10
 263                     ; 665   uint32_t i = 0x00;
 265                     ; 669   Frame[0] = (uint8_t)(Cmd | 0x40); /*!< Construct byte 1 */
 267  004a aa40          	or	a,#64
 268  004c 6b01          	ld	(OFST-9,sp),a
 270                     ; 671   Frame[1] = (uint8_t)(Arg >> 24); /*!< Construct byte 2 */
 272  004e 7b0e          	ld	a,(OFST+4,sp)
 273  0050 6b02          	ld	(OFST-8,sp),a
 275                     ; 673   Frame[2] = (uint8_t)(Arg >> 16); /*!< Construct byte 3 */
 277  0052 7b0f          	ld	a,(OFST+5,sp)
 278  0054 6b03          	ld	(OFST-7,sp),a
 280                     ; 675   Frame[3] = (uint8_t)(Arg >> 8); /*!< Construct byte 4 */
 282  0056 7b10          	ld	a,(OFST+6,sp)
 283  0058 6b04          	ld	(OFST-6,sp),a
 285                     ; 677   Frame[4] = (uint8_t)(Arg); /*!< Construct byte 5 */
 287  005a 7b11          	ld	a,(OFST+7,sp)
 288  005c 6b05          	ld	(OFST-5,sp),a
 290                     ; 679   Frame[5] = (Crc); /*!< Construct CRC: byte 6 */
 292  005e 7b12          	ld	a,(OFST+8,sp)
 293  0060 6b06          	ld	(OFST-4,sp),a
 295                     ; 681   for (i = 0; i < 6; i++)
 297  0062 5f            	clrw	x
 298  0063 1f09          	ldw	(OFST-1,sp),x
 299  0065 1f07          	ldw	(OFST-3,sp),x
 301  0067               L301:
 302                     ; 683     SD_WriteByte(Frame[i]); /*!< Send the Cmd bytes */
 304  0067 96            	ldw	x,sp
 305  0068 5c            	incw	x
 306  0069 72fb09        	addw	x,(OFST-1,sp)
 307  006c f6            	ld	a,(x)
 308  006d cd0258        	call	_SD_WriteByte
 310                     ; 681   for (i = 0; i < 6; i++)
 312  0070 96            	ldw	x,sp
 313  0071 1c0007        	addw	x,#OFST-3
 314  0074 a601          	ld	a,#1
 315  0076 cd0000        	call	c_lgadc
 320  0079 96            	ldw	x,sp
 321  007a 1c0007        	addw	x,#OFST-3
 322  007d cd0000        	call	c_ltor
 324  0080 ae0004        	ldw	x,#L42
 325  0083 cd0000        	call	c_lcmp
 327  0086 25df          	jrult	L301
 328                     ; 685 }
 331  0088 5b0b          	addw	sp,#11
 332  008a 81            	ret	
 379                     	switch	.const
 380  0008               L23:
 381  0008 00000041      	dc.l	65
 382                     ; 699 uint8_t SD_GetDataResponse(void)
 382                     ; 700 {
 383                     	switch	.text
 384  008b               _SD_GetDataResponse:
 386  008b 5206          	subw	sp,#6
 387       00000006      OFST:	set	6
 390                     ; 701   uint32_t i = 0;
 392  008d 5f            	clrw	x
 393  008e 1f03          	ldw	(OFST-3,sp),x
 394  0090 1f01          	ldw	(OFST-5,sp),x
 396                     ; 702   uint8_t response = 0, rvalue = 0;
 398  0092 0f06          	clr	(OFST+0,sp)
 403  0094 2031          	jra	L341
 404  0096               L141:
 405                     ; 707     response = SD_ReadByte();
 407  0096 cd0269        	call	_SD_ReadByte
 410                     ; 709     response &= 0x1F;
 412  0099 a41f          	and	a,#31
 413  009b 6b06          	ld	(OFST+0,sp),a
 415                     ; 710     switch (response)
 418                     ; 724         break;
 419  009d a005          	sub	a,#5
 420  009f 270c          	jreq	L111
 421  00a1 a006          	sub	a,#6
 422  00a3 270c          	jreq	L311
 423  00a5 a002          	sub	a,#2
 424  00a7 270c          	jreq	L511
 425                     ; 723         rvalue = SD_DATA_OTHER_ERROR;
 427  00a9 a6ff          	ld	a,#255
 428                     ; 724         break;
 430  00ab 200d          	jra	L151
 431  00ad               L111:
 432                     ; 714         rvalue = SD_DATA_OK;
 434  00ad a605          	ld	a,#5
 435                     ; 715         break;
 437  00af 2009          	jra	L151
 438  00b1               L311:
 439                     ; 717       case SD_DATA_CRC_ERROR:
 439                     ; 718         return SD_DATA_CRC_ERROR;
 441  00b1 a60b          	ld	a,#11
 443  00b3 2002          	jra	L63
 444  00b5               L511:
 445                     ; 719       case SD_DATA_WRITE_ERROR:
 445                     ; 720         return SD_DATA_WRITE_ERROR;
 447  00b5 a60d          	ld	a,#13
 449  00b7               L63:
 451  00b7 5b06          	addw	sp,#6
 452  00b9 81            	ret	
 453  00ba               L151:
 454  00ba 6b05          	ld	(OFST-1,sp),a
 456                     ; 728     if (rvalue == SD_DATA_OK)
 458  00bc a105          	cp	a,#5
 459  00be 2714          	jreq	L751
 460                     ; 729       break;
 462                     ; 731     i++;
 464  00c0 96            	ldw	x,sp
 465  00c1 5c            	incw	x
 466  00c2 a601          	ld	a,#1
 467  00c4 cd0000        	call	c_lgadc
 470  00c7               L341:
 471                     ; 704   while (i <= 64)
 473  00c7 96            	ldw	x,sp
 474  00c8 5c            	incw	x
 475  00c9 cd0000        	call	c_ltor
 477  00cc ae0008        	ldw	x,#L23
 478  00cf cd0000        	call	c_lcmp
 480  00d2 25c2          	jrult	L141
 481  00d4               L751:
 482                     ; 735   while (SD_ReadByte() == 0);
 484  00d4 cd0269        	call	_SD_ReadByte
 486  00d7 4d            	tnz	a
 487  00d8 27fa          	jreq	L751
 488                     ; 738   return response;
 490  00da 7b06          	ld	a,(OFST+0,sp)
 492  00dc 20d9          	jra	L63
 532                     ; 748 uint8_t SD_GetResponse(uint8_t Response)
 532                     ; 749 {
 533                     	switch	.text
 534  00de               _SD_GetResponse:
 536  00de 88            	push	a
 537  00df 5204          	subw	sp,#4
 538       00000004      OFST:	set	4
 541                     ; 750   uint32_t Count = 0xFFF;
 543  00e1 ae0fff        	ldw	x,#4095
 544  00e4 1f03          	ldw	(OFST-1,sp),x
 545  00e6 5f            	clrw	x
 546  00e7 1f01          	ldw	(OFST-3,sp),x
 549  00e9 2007          	jra	L502
 550  00eb               L102:
 551                     ; 755     Count--;
 553  00eb 96            	ldw	x,sp
 554  00ec 5c            	incw	x
 555  00ed a601          	ld	a,#1
 556  00ef cd0000        	call	c_lgsbc
 559  00f2               L502:
 560                     ; 753   while ((SD_ReadByte() != Response) && Count) 
 562  00f2 cd0269        	call	_SD_ReadByte
 564  00f5 1105          	cp	a,(OFST+1,sp)
 565  00f7 2707          	jreq	L112
 567  00f9 96            	ldw	x,sp
 568  00fa 5c            	incw	x
 569  00fb cd0000        	call	c_lzmp
 571  00fe 26eb          	jrne	L102
 572  0100               L112:
 573                     ; 757   if (Count == 0)
 575  0100 96            	ldw	x,sp
 576  0101 5c            	incw	x
 577  0102 cd0000        	call	c_lzmp
 579  0105 2604          	jrne	L312
 580                     ; 760     return SD_RESPONSE_FAILURE;
 582  0107 a6ff          	ld	a,#255
 584  0109 2001          	jra	L44
 585  010b               L312:
 586                     ; 765     return SD_RESPONSE_NO_ERROR;
 588  010b 4f            	clr	a
 590  010c               L44:
 592  010c 5b05          	addw	sp,#5
 593  010e 81            	ret	
 637                     ; 772 void SD_GetResponseVal(uint8_t *pResp, uint8_t response)
 637                     ; 773 {
 638                     	switch	.text
 639  010f               _SD_GetResponseVal:
 641  010f 89            	pushw	x
 642       00000000      OFST:	set	0
 645                     ; 775   if(SD_GetResponse(response) == SD_RESPONSE_FAILURE)
 647  0110 7b05          	ld	a,(OFST+5,sp)
 648  0112 adca          	call	_SD_GetResponse
 650  0114 4c            	inc	a
 651  0115 2605          	jrne	L732
 652                     ; 777     *pResp++ = 0xff;
 654  0117 1e01          	ldw	x,(OFST+1,sp)
 655  0119 4a            	dec	a
 657  011a 2004          	jra	L142
 658  011c               L732:
 659                     ; 779     *pResp++ = response;
 661  011c 7b05          	ld	a,(OFST+5,sp)
 662  011e 1e01          	ldw	x,(OFST+1,sp)
 663  0120               L142:
 664  0120 f7            	ld	(x),a
 665  0121 5c            	incw	x
 666  0122 1f01          	ldw	(OFST+1,sp),x
 667                     ; 782   *pResp++ = SD_ReadByte();
 669  0124 cd0269        	call	_SD_ReadByte
 671  0127 1e01          	ldw	x,(OFST+1,sp)
 672  0129 f7            	ld	(x),a
 673  012a 5c            	incw	x
 674  012b 1f01          	ldw	(OFST+1,sp),x
 675                     ; 783   *pResp++ = SD_ReadByte();
 677  012d cd0269        	call	_SD_ReadByte
 679  0130 1e01          	ldw	x,(OFST+1,sp)
 680  0132 f7            	ld	(x),a
 681  0133 5c            	incw	x
 682  0134 1f01          	ldw	(OFST+1,sp),x
 683                     ; 784   *pResp++ = SD_ReadByte();
 685  0136 cd0269        	call	_SD_ReadByte
 687  0139 1e01          	ldw	x,(OFST+1,sp)
 688  013b f7            	ld	(x),a
 689  013c 5c            	incw	x
 690  013d 1f01          	ldw	(OFST+1,sp),x
 691                     ; 785   *pResp++ = SD_ReadByte();
 693  013f cd0269        	call	_SD_ReadByte
 695  0142 1e01          	ldw	x,(OFST+1,sp)
 696  0144 f7            	ld	(x),a
 697  0145 5c            	incw	x
 698  0146 1f01          	ldw	(OFST+1,sp),x
 699                     ; 786   *pResp = SD_ReadByte();
 701  0148 cd0269        	call	_SD_ReadByte
 703  014b 1e01          	ldw	x,(OFST+1,sp)
 704  014d f7            	ld	(x),a
 705                     ; 787 }
 708  014e 85            	popw	x
 709  014f 81            	ret	
 712                     	switch	.const
 713  000c               L342_resp:
 714  000c 00            	dc.b	0
 715  000d 0000000000    	ds.b	5
 716                     	xref	_dly
 717                     	xref	_dly
 761                     ; 871 uint8_t SD_GoIdleState(void)
 761                     ; 872 {
 762                     	switch	.text
 763  0150               _SD_GoIdleState:
 765  0150 5208          	subw	sp,#8
 766       00000008      OFST:	set	8
 769                     ; 873   uint16_t cnt = 0;
 771                     ; 874   uint8_t resp[6] = {0};
 773  0152 96            	ldw	x,sp
 774  0153 1c0003        	addw	x,#OFST-5
 775  0156 90ae000c      	ldw	y,#L342_resp
 776  015a a606          	ld	a,#6
 777  015c cd0000        	call	c_xymov
 779                     ; 876   SD_CS_LOW();
 781  015f 7219500a      	bres	20490,#4
 782                     ; 879   SD_SendCmd(SD_CMD_GO_IDLE_STATE, (uint32_t)0, 0x95);
 784  0163 4b95          	push	#149
 785  0165 5f            	clrw	x
 786  0166 89            	pushw	x
 787  0167 89            	pushw	x
 788  0168 4f            	clr	a
 789  0169 cd0047        	call	_SD_SendCmd
 791  016c 5b05          	addw	sp,#5
 792                     ; 882   if (SD_GetResponse(SD_IN_IDLE_STATE))
 794  016e a601          	ld	a,#1
 795  0170 cd00de        	call	_SD_GetResponse
 797  0173 4d            	tnz	a
 798                     ; 885     return SD_RESPONSE_FAILURE;
 800  0174 2703cc0205    	jrne	L172
 801                     ; 888   SD_SendCmd(SD_CMD_IF_COND, (uint32_t)0x156, 0x43);
 803  0179 4b43          	push	#67
 804  017b ae0156        	ldw	x,#342
 805  017e 89            	pushw	x
 806  017f 5f            	clrw	x
 807  0180 89            	pushw	x
 808  0181 a608          	ld	a,#8
 809  0183 cd0047        	call	_SD_SendCmd
 811  0186 5b05          	addw	sp,#5
 812                     ; 889   SD_GetResponseVal(resp,0x01);
 814  0188 4b01          	push	#1
 815  018a 96            	ldw	x,sp
 816  018b 1c0004        	addw	x,#OFST-4
 817  018e cd010f        	call	_SD_GetResponseVal
 819  0191 84            	pop	a
 820                     ; 890   if(resp[0]==0x01){
 822  0192 7b03          	ld	a,(OFST-5,sp)
 823  0194 4a            	dec	a
 824  0195 2672          	jrne	L503
 825                     ; 892     if ((resp[3] == 0x01)&&(resp[4] == 0x56)){
 827  0197 7b06          	ld	a,(OFST-2,sp)
 828  0199 4a            	dec	a
 829  019a 2669          	jrne	L172
 831  019c 7b07          	ld	a,(OFST-1,sp)
 832  019e a156          	cp	a,#86
 833  01a0 2663          	jrne	L172
 834  01a2               L372:
 835                     ; 896             SD_SendCmd(SD_CMD_55, (uint32_t)0, 0x01);
 837  01a2 4b01          	push	#1
 838  01a4 5f            	clrw	x
 839  01a5 89            	pushw	x
 840  01a6 89            	pushw	x
 841  01a7 a637          	ld	a,#55
 842  01a9 cd0047        	call	_SD_SendCmd
 844  01ac 5b05          	addw	sp,#5
 845                     ; 897             SD_GetResponseVal(resp,0x01);
 847  01ae 4b01          	push	#1
 848  01b0 96            	ldw	x,sp
 849  01b1 1c0004        	addw	x,#OFST-4
 850  01b4 cd010f        	call	_SD_GetResponseVal
 852  01b7 ae0064        	ldw	x,#100
 853  01ba 84            	pop	a
 854                     ; 898 						dly((uint32_t)100);
 856  01bb 89            	pushw	x
 857  01bc 5f            	clrw	x
 858  01bd 89            	pushw	x
 859  01be cd0000        	call	_dly
 861  01c1 5b04          	addw	sp,#4
 862                     ; 899             SD_SendCmd(SD_ACMD_41&0x7f, (1UL<<30), 0x1);
 864  01c3 4b01          	push	#1
 865  01c5 5f            	clrw	x
 866  01c6 89            	pushw	x
 867  01c7 ae4000        	ldw	x,#16384
 868  01ca 89            	pushw	x
 869  01cb a669          	ld	a,#105
 870  01cd cd0047        	call	_SD_SendCmd
 872  01d0 5b05          	addw	sp,#5
 873                     ; 900 						dly((uint32_t)10000);
 875  01d2 ae2710        	ldw	x,#10000
 876  01d5 89            	pushw	x
 877  01d6 5f            	clrw	x
 878  01d7 89            	pushw	x
 879  01d8 cd0000        	call	_dly
 881  01db 5b04          	addw	sp,#4
 882                     ; 901             SD_GetResponseVal(resp,0x00);
 884  01dd 4b00          	push	#0
 885  01df 96            	ldw	x,sp
 886  01e0 1c0004        	addw	x,#OFST-4
 887  01e3 cd010f        	call	_SD_GetResponseVal
 889  01e6 84            	pop	a
 890                     ; 902         } while(resp[0]); //until resved 0x0
 892  01e7 7b03          	ld	a,(OFST-5,sp)
 893  01e9 26b7          	jrne	L372
 894                     ; 904         SD_SendCmd(SD_CMD_58, (uint32_t)0,0x01);
 896  01eb 4b01          	push	#1
 897  01ed 5f            	clrw	x
 898  01ee 89            	pushw	x
 899  01ef 89            	pushw	x
 900  01f0 a63a          	ld	a,#58
 901  01f2 cd0047        	call	_SD_SendCmd
 903  01f5 5b05          	addw	sp,#5
 904                     ; 905         SD_GetResponseVal(resp,58);
 906  01f7 4b3a          	push	#58
 907  01f9 96            	ldw	x,sp
 908  01fa 1c0004        	addw	x,#OFST-4
 909  01fd cd010f        	call	_SD_GetResponseVal
 911  0200 84            	pop	a
 912                     ; 906         return SD_RESPONSE_NO_ERROR;
 914  0201               LC001:
 916  0201 4f            	clr	a
 918  0202               L431:
 920  0202 5b08          	addw	sp,#8
 921  0204 81            	ret	
 922  0205               L172:
 923                     ; 909 				return SD_RESPONSE_FAILURE;
 926  0205 a6ff          	ld	a,#255
 928  0207 20f9          	jra	L431
 929  0209               L503:
 930                     ; 915 				SD_SendCmd(SD_CMD_55, 0, 0x01);
 932  0209 4b01          	push	#1
 933  020b 5f            	clrw	x
 934  020c 89            	pushw	x
 935  020d 89            	pushw	x
 936  020e a637          	ld	a,#55
 937  0210 cd0047        	call	_SD_SendCmd
 939  0213 5b05          	addw	sp,#5
 940                     ; 916 				SD_GetResponseVal(resp,0x01);
 942  0215 4b01          	push	#1
 943  0217 96            	ldw	x,sp
 944  0218 1c0004        	addw	x,#OFST-4
 945  021b cd010f        	call	_SD_GetResponseVal
 947  021e ae2710        	ldw	x,#10000
 948  0221 84            	pop	a
 949                     ; 917 				dly((uint32_t)10000);
 951  0222 89            	pushw	x
 952  0223 5f            	clrw	x
 953  0224 89            	pushw	x
 954  0225 cd0000        	call	_dly
 956  0228 5b04          	addw	sp,#4
 957                     ; 918 				SD_SendCmd(SD_ACMD_41&0x7f, 0UL, 0x1);
 959  022a 4b01          	push	#1
 960  022c 5f            	clrw	x
 961  022d 89            	pushw	x
 962  022e 89            	pushw	x
 963  022f a669          	ld	a,#105
 964  0231 cd0047        	call	_SD_SendCmd
 966  0234 5b05          	addw	sp,#5
 967                     ; 919 				SD_GetResponseVal(resp,0x00);
 969  0236 4b00          	push	#0
 970  0238 96            	ldw	x,sp
 971  0239 1c0004        	addw	x,#OFST-4
 972  023c cd010f        	call	_SD_GetResponseVal
 974  023f ae2710        	ldw	x,#10000
 975  0242 84            	pop	a
 976                     ; 920 				dly((uint32_t)10000);
 978  0243 89            	pushw	x
 979  0244 5f            	clrw	x
 980  0245 89            	pushw	x
 981  0246 cd0000        	call	_dly
 983  0249 5b04          	addw	sp,#4
 984                     ; 921 		} while(resp[0]);
 986  024b 7b03          	ld	a,(OFST-5,sp)
 987  024d 26ba          	jrne	L503
 988                     ; 926   SD_CS_HIGH();
 990  024f 7218500a      	bset	20490,#4
 991                     ; 929   SD_WriteByte(SD_DUMMY_BYTE);
 993  0253 4a            	dec	a
 994  0254 ad02          	call	_SD_WriteByte
 996                     ; 931   return SD_RESPONSE_NO_ERROR;
 998  0256 20a9          	jp	LC001
1030                     ; 941 uint8_t SD_WriteByte(uint8_t Data)
1030                     ; 942 {
1031                     	switch	.text
1032  0258               _SD_WriteByte:
1034       00000000      OFST:	set	0
1037  0258               L133:
1038                     ; 944   while ((SPI->SR & SPI_FLAG_TXE) == 0)
1040  0258 72035203fb    	btjf	20995,#1,L133
1041                     ; 948   SPI->DR = (Data);
1043  025d c75204        	ld	20996,a
1045  0260               L143:
1046                     ; 951   while ((SPI->SR & SPI_FLAG_RXNE) == 0)
1048  0260 72015203fb    	btjf	20995,#0,L143
1049                     ; 955   return SPI->DR;
1051  0265 c65204        	ld	a,20996
1054  0268 81            	ret	
1086                     ; 963 uint8_t SD_ReadByte(void)
1086                     ; 964 {
1087                     	switch	.text
1088  0269               _SD_ReadByte:
1090       00000001      OFST:	set	1
1093                     ; 965   uint8_t Data = 0;
1096  0269               L363:
1097                     ; 968   while ((SPI->SR & SPI_FLAG_TXE) == 0)
1099  0269 72035203fb    	btjf	20995,#1,L363
1100                     ; 971   SPI->DR = SD_DUMMY_BYTE;
1102  026e 35ff5204      	mov	20996,#255
1104  0272               L373:
1105                     ; 974   while ((SPI->SR & SPI_FLAG_RXNE) == 0)
1107  0272 72015203fb    	btjf	20995,#0,L373
1108                     ; 977   Data = (uint8_t)SPI->DR;
1110  0277 c65204        	ld	a,20996
1112                     ; 980   return Data;
1116  027a 81            	ret	
1139                     ; 1024 void SD_LowLevel_Init(void)
1139                     ; 1025 {
1140                     	switch	.text
1141  027b               _SD_LowLevel_Init:
1145                     ; 1034   SPI->CR1 = SPI_FIRSTBIT_MSB | SPI_BAUDRATEPRESCALER_64|SPI_CLOCKPOLARITY_HIGH | SPI_CLOCKPHASE_2EDGE;
1147  027b 352b5200      	mov	20992,#43
1148                     ; 1036   SPI->CR2 = SPI_DATADIRECTION_2LINES_FULLDUPLEX|SPI_NSS_SOFT|SPI_CR2_SSI;
1150  027f 35035201      	mov	20993,#3
1151                     ; 1038   SPI->CR1 |= SPI_MODE_MASTER;
1153  0283 72145200      	bset	20992,#2
1154                     ; 1040   SPI->CRCPR = 0x07;
1156  0287 35075205      	mov	20997,#7
1157                     ; 1042   SPI->CR1 |= SPI_CR1_SPE;
1159  028b 721c5200      	bset	20992,#6
1160                     ; 1045   SD_CS_GPIO_PORT->CR2 &= (~SD_CS_PIN); //Reset corresponding bit
1162  028f 7219500e      	bres	20494,#4
1163                     ; 1046   SD_CS_GPIO_PORT->ODR |= SD_CS_PIN; // high level
1165  0293 7218500a      	bset	20490,#4
1166                     ; 1047   SD_CS_GPIO_PORT->DDR |= SD_CS_PIN; // output mode 
1168  0297 7218500c      	bset	20492,#4
1169                     ; 1048   SD_CS_GPIO_PORT->CR1 &= ~SD_CS_PIN; //open drain here
1171  029b 7219500d      	bres	20493,#4
1172                     ; 1049 }
1175  029f 81            	ret	
1188                     	xdef	_SD_GetResponseVal
1189                     	xdef	_SD_LowLevel_Init
1190                     	xdef	_SD_ReadByte
1191                     	xdef	_SD_WriteByte
1192                     	xdef	_SD_GoIdleState
1193                     	xdef	_SD_GetDataResponse
1194                     	xdef	_SD_GetResponse
1195                     	xdef	_SD_SendCmd
1196                     	xdef	_SD_Detect
1197                     	xdef	_SD_Init
1198                     	xref.b	c_x
1217                     	xref	c_xymov
1218                     	xref	c_lzmp
1219                     	xref	c_lgsbc
1220                     	xref	c_lcmp
1221                     	xref	c_ltor
1222                     	xref	c_lgadc
1223                     	end
