   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  64                     .const:	section	.text
  65  0000               L41:
  66  0000 0000000a      	dc.l	10
  67                     ; 90 uint8_t SD_Init(void)
  67                     ; 91 {
  68                     	scross	off
  69                     	switch	.text
  70  0000               _SD_Init:
  72  0000 5205          	subw	sp,#5
  73       00000005      OFST:	set	5
  76                     ; 92   uint32_t i = 0;
  78                     ; 96   SD_LowLevel_Init();
  80  0002 cd02a0        	call	_SD_LowLevel_Init
  82                     ; 99   SD_CS_LOW();
  84  0005 4b10          	push	#16
  85  0007 ae500a        	ldw	x,#20490
  86  000a cd0000        	call	_GPIO_WriteLow
  88  000d 5f            	clrw	x
  89  000e 84            	pop	a
  90                     ; 103   for (i = 0; i <= 9; i++)
  92  000f 1f04          	ldw	(OFST-1,sp),x
  93  0011 1f02          	ldw	(OFST-3,sp),x
  95  0013               L72:
  96                     ; 106     SD_WriteByte(SD_DUMMY_BYTE);
  98  0013 a6ff          	ld	a,#255
  99  0015 cd0268        	call	_SD_WriteByte
 101                     ; 103   for (i = 0; i <= 9; i++)
 103  0018 96            	ldw	x,sp
 104  0019 1c0002        	addw	x,#OFST-3
 105  001c a601          	ld	a,#1
 106  001e cd0000        	call	c_lgadc
 111  0021 96            	ldw	x,sp
 112  0022 1c0002        	addw	x,#OFST-3
 113  0025 cd0000        	call	c_ltor
 115  0028 ae0000        	ldw	x,#L41
 116  002b cd0000        	call	c_lcmp
 118  002e 25e3          	jrult	L72
 119                     ; 110   res = SD_GoIdleState();
 121  0030 cd0155        	call	_SD_GoIdleState
 123                     ; 112   if(res = SD_RESPONSE_NO_ERROR){
 125  0033 0f01          	clr	(OFST-4,sp)
 127  0035 2708          	jreq	L53
 128                     ; 113     SPI->CR1 &= 0xc7;
 130  0037 c65200        	ld	a,20992
 131  003a a4c7          	and	a,#199
 132  003c c75200        	ld	20992,a
 133  003f               L53:
 134                     ; 116   return (res);
 136  003f 7b01          	ld	a,(OFST-4,sp)
 139  0041 5b05          	addw	sp,#5
 140  0043 81            	ret	
 174                     ; 124 uint8_t SD_Detect(void)
 174                     ; 125 {
 175                     	switch	.text
 176  0044               _SD_Detect:
 178  0044 88            	push	a
 179       00000001      OFST:	set	1
 182                     ; 126   __IO uint8_t status = SD_PRESENT;
 184  0045 a601          	ld	a,#1
 185  0047 6b01          	ld	(OFST+0,sp),a
 187                     ; 136     return SD_PRESENT;
 191  0049 5b01          	addw	sp,#1
 192  004b 81            	ret	
 256                     	switch	.const
 257  0004               L62:
 258  0004 00000006      	dc.l	6
 259                     ; 663 void SD_SendCmd(uint8_t Cmd, uint32_t Arg, uint8_t Crc)
 259                     ; 664 {
 260                     	switch	.text
 261  004c               _SD_SendCmd:
 263  004c 88            	push	a
 264  004d 520a          	subw	sp,#10
 265       0000000a      OFST:	set	10
 268                     ; 665   uint32_t i = 0x00;
 270                     ; 669   Frame[0] = (uint8_t)(Cmd | 0x40); /*!< Construct byte 1 */
 272  004f aa40          	or	a,#64
 273  0051 6b01          	ld	(OFST-9,sp),a
 275                     ; 671   Frame[1] = (uint8_t)(Arg >> 24); /*!< Construct byte 2 */
 277  0053 7b0e          	ld	a,(OFST+4,sp)
 278  0055 6b02          	ld	(OFST-8,sp),a
 280                     ; 673   Frame[2] = (uint8_t)(Arg >> 16); /*!< Construct byte 3 */
 282  0057 7b0f          	ld	a,(OFST+5,sp)
 283  0059 6b03          	ld	(OFST-7,sp),a
 285                     ; 675   Frame[3] = (uint8_t)(Arg >> 8); /*!< Construct byte 4 */
 287  005b 7b10          	ld	a,(OFST+6,sp)
 288  005d 6b04          	ld	(OFST-6,sp),a
 290                     ; 677   Frame[4] = (uint8_t)(Arg); /*!< Construct byte 5 */
 292  005f 7b11          	ld	a,(OFST+7,sp)
 293  0061 6b05          	ld	(OFST-5,sp),a
 295                     ; 679   Frame[5] = (Crc); /*!< Construct CRC: byte 6 */
 297  0063 7b12          	ld	a,(OFST+8,sp)
 298  0065 6b06          	ld	(OFST-4,sp),a
 300                     ; 681   for (i = 0; i < 6; i++)
 302  0067 5f            	clrw	x
 303  0068 1f09          	ldw	(OFST-1,sp),x
 304  006a 1f07          	ldw	(OFST-3,sp),x
 306  006c               L301:
 307                     ; 683     SD_WriteByte(Frame[i]); /*!< Send the Cmd bytes */
 309  006c 96            	ldw	x,sp
 310  006d 5c            	incw	x
 311  006e 72fb09        	addw	x,(OFST-1,sp)
 312  0071 f6            	ld	a,(x)
 313  0072 cd0268        	call	_SD_WriteByte
 315                     ; 681   for (i = 0; i < 6; i++)
 317  0075 96            	ldw	x,sp
 318  0076 1c0007        	addw	x,#OFST-3
 319  0079 a601          	ld	a,#1
 320  007b cd0000        	call	c_lgadc
 325  007e 96            	ldw	x,sp
 326  007f 1c0007        	addw	x,#OFST-3
 327  0082 cd0000        	call	c_ltor
 329  0085 ae0004        	ldw	x,#L62
 330  0088 cd0000        	call	c_lcmp
 332  008b 25df          	jrult	L301
 333                     ; 685 }
 336  008d 5b0b          	addw	sp,#11
 337  008f 81            	ret	
 384                     	switch	.const
 385  0008               L43:
 386  0008 00000041      	dc.l	65
 387                     ; 699 uint8_t SD_GetDataResponse(void)
 387                     ; 700 {
 388                     	switch	.text
 389  0090               _SD_GetDataResponse:
 391  0090 5206          	subw	sp,#6
 392       00000006      OFST:	set	6
 395                     ; 701   uint32_t i = 0;
 397  0092 5f            	clrw	x
 398  0093 1f03          	ldw	(OFST-3,sp),x
 399  0095 1f01          	ldw	(OFST-5,sp),x
 401                     ; 702   uint8_t response = 0, rvalue = 0;
 403  0097 0f06          	clr	(OFST+0,sp)
 408  0099 2031          	jra	L341
 409  009b               L141:
 410                     ; 707     response = SD_ReadByte();
 412  009b cd0284        	call	_SD_ReadByte
 415                     ; 709     response &= 0x1F;
 417  009e a41f          	and	a,#31
 418  00a0 6b06          	ld	(OFST+0,sp),a
 420                     ; 710     switch (response)
 423                     ; 724         break;
 424  00a2 a005          	sub	a,#5
 425  00a4 270c          	jreq	L111
 426  00a6 a006          	sub	a,#6
 427  00a8 270c          	jreq	L311
 428  00aa a002          	sub	a,#2
 429  00ac 270c          	jreq	L511
 430                     ; 723         rvalue = SD_DATA_OTHER_ERROR;
 432  00ae a6ff          	ld	a,#255
 433                     ; 724         break;
 435  00b0 200d          	jra	L151
 436  00b2               L111:
 437                     ; 714         rvalue = SD_DATA_OK;
 439  00b2 a605          	ld	a,#5
 440                     ; 715         break;
 442  00b4 2009          	jra	L151
 443  00b6               L311:
 444                     ; 717       case SD_DATA_CRC_ERROR:
 444                     ; 718         return SD_DATA_CRC_ERROR;
 446  00b6 a60b          	ld	a,#11
 448  00b8 2002          	jra	L04
 449  00ba               L511:
 450                     ; 719       case SD_DATA_WRITE_ERROR:
 450                     ; 720         return SD_DATA_WRITE_ERROR;
 452  00ba a60d          	ld	a,#13
 454  00bc               L04:
 456  00bc 5b06          	addw	sp,#6
 457  00be 81            	ret	
 458  00bf               L151:
 459  00bf 6b05          	ld	(OFST-1,sp),a
 461                     ; 728     if (rvalue == SD_DATA_OK)
 463  00c1 a105          	cp	a,#5
 464  00c3 2714          	jreq	L751
 465                     ; 729       break;
 467                     ; 731     i++;
 469  00c5 96            	ldw	x,sp
 470  00c6 5c            	incw	x
 471  00c7 a601          	ld	a,#1
 472  00c9 cd0000        	call	c_lgadc
 475  00cc               L341:
 476                     ; 704   while (i <= 64)
 478  00cc 96            	ldw	x,sp
 479  00cd 5c            	incw	x
 480  00ce cd0000        	call	c_ltor
 482  00d1 ae0008        	ldw	x,#L43
 483  00d4 cd0000        	call	c_lcmp
 485  00d7 25c2          	jrult	L141
 486  00d9               L751:
 487                     ; 735   while (SD_ReadByte() == 0);
 489  00d9 cd0284        	call	_SD_ReadByte
 491  00dc 4d            	tnz	a
 492  00dd 27fa          	jreq	L751
 493                     ; 738   return response;
 495  00df 7b06          	ld	a,(OFST+0,sp)
 497  00e1 20d9          	jra	L04
 537                     ; 748 uint8_t SD_GetResponse(uint8_t Response)
 537                     ; 749 {
 538                     	switch	.text
 539  00e3               _SD_GetResponse:
 541  00e3 88            	push	a
 542  00e4 5204          	subw	sp,#4
 543       00000004      OFST:	set	4
 546                     ; 750   uint32_t Count = 0xFFF;
 548  00e6 ae0fff        	ldw	x,#4095
 549  00e9 1f03          	ldw	(OFST-1,sp),x
 550  00eb 5f            	clrw	x
 551  00ec 1f01          	ldw	(OFST-3,sp),x
 554  00ee 2007          	jra	L502
 555  00f0               L102:
 556                     ; 755     Count--;
 558  00f0 96            	ldw	x,sp
 559  00f1 5c            	incw	x
 560  00f2 a601          	ld	a,#1
 561  00f4 cd0000        	call	c_lgsbc
 564  00f7               L502:
 565                     ; 753   while ((SD_ReadByte() != Response) && Count) 
 567  00f7 cd0284        	call	_SD_ReadByte
 569  00fa 1105          	cp	a,(OFST+1,sp)
 570  00fc 2707          	jreq	L112
 572  00fe 96            	ldw	x,sp
 573  00ff 5c            	incw	x
 574  0100 cd0000        	call	c_lzmp
 576  0103 26eb          	jrne	L102
 577  0105               L112:
 578                     ; 757   if (Count == 0)
 580  0105 96            	ldw	x,sp
 581  0106 5c            	incw	x
 582  0107 cd0000        	call	c_lzmp
 584  010a 2604          	jrne	L312
 585                     ; 760     return SD_RESPONSE_FAILURE;
 587  010c a6ff          	ld	a,#255
 589  010e 2001          	jra	L64
 590  0110               L312:
 591                     ; 765     return SD_RESPONSE_NO_ERROR;
 593  0110 4f            	clr	a
 595  0111               L64:
 597  0111 5b05          	addw	sp,#5
 598  0113 81            	ret	
 642                     ; 772 void SD_GetResponseVal(uint8_t *pResp, uint8_t response)
 642                     ; 773 {
 643                     	switch	.text
 644  0114               _SD_GetResponseVal:
 646  0114 89            	pushw	x
 647       00000000      OFST:	set	0
 650                     ; 775   if(SD_GetResponse(response) == SD_RESPONSE_FAILURE)
 652  0115 7b05          	ld	a,(OFST+5,sp)
 653  0117 adca          	call	_SD_GetResponse
 655  0119 4c            	inc	a
 656  011a 2605          	jrne	L732
 657                     ; 777     *pResp++ = 0xff;
 659  011c 1e01          	ldw	x,(OFST+1,sp)
 660  011e 4a            	dec	a
 662  011f 2004          	jra	L142
 663  0121               L732:
 664                     ; 779     *pResp++ = response;
 666  0121 7b05          	ld	a,(OFST+5,sp)
 667  0123 1e01          	ldw	x,(OFST+1,sp)
 668  0125               L142:
 669  0125 f7            	ld	(x),a
 670  0126 5c            	incw	x
 671  0127 1f01          	ldw	(OFST+1,sp),x
 672                     ; 782   *pResp++ = SD_ReadByte();
 674  0129 cd0284        	call	_SD_ReadByte
 676  012c 1e01          	ldw	x,(OFST+1,sp)
 677  012e f7            	ld	(x),a
 678  012f 5c            	incw	x
 679  0130 1f01          	ldw	(OFST+1,sp),x
 680                     ; 783   *pResp++ = SD_ReadByte();
 682  0132 cd0284        	call	_SD_ReadByte
 684  0135 1e01          	ldw	x,(OFST+1,sp)
 685  0137 f7            	ld	(x),a
 686  0138 5c            	incw	x
 687  0139 1f01          	ldw	(OFST+1,sp),x
 688                     ; 784   *pResp++ = SD_ReadByte();
 690  013b cd0284        	call	_SD_ReadByte
 692  013e 1e01          	ldw	x,(OFST+1,sp)
 693  0140 f7            	ld	(x),a
 694  0141 5c            	incw	x
 695  0142 1f01          	ldw	(OFST+1,sp),x
 696                     ; 785   *pResp++ = SD_ReadByte();
 698  0144 cd0284        	call	_SD_ReadByte
 700  0147 1e01          	ldw	x,(OFST+1,sp)
 701  0149 f7            	ld	(x),a
 702  014a 5c            	incw	x
 703  014b 1f01          	ldw	(OFST+1,sp),x
 704                     ; 786   *pResp = SD_ReadByte();
 706  014d cd0284        	call	_SD_ReadByte
 708  0150 1e01          	ldw	x,(OFST+1,sp)
 709  0152 f7            	ld	(x),a
 710                     ; 787 }
 713  0153 85            	popw	x
 714  0154 81            	ret	
 717                     	switch	.const
 718  000c               L342_resp:
 719  000c 00            	dc.b	0
 720  000d 0000000000    	ds.b	5
 721                     	xref	_dly
 722                     	xref	_dly
 768                     ; 871 uint8_t SD_GoIdleState(void)
 768                     ; 872 {
 769                     	switch	.text
 770  0155               _SD_GoIdleState:
 772  0155 5208          	subw	sp,#8
 773       00000008      OFST:	set	8
 776                     ; 873   uint16_t cnt = 0;
 778                     ; 874   uint8_t resp[6] = {0};
 780  0157 96            	ldw	x,sp
 781  0158 1c0003        	addw	x,#OFST-5
 782  015b 90ae000c      	ldw	y,#L342_resp
 783  015f a606          	ld	a,#6
 784  0161 cd0000        	call	c_xymvx
 786                     ; 876   SD_CS_LOW();
 788  0164 4b10          	push	#16
 789  0166 ae500a        	ldw	x,#20490
 790  0169 cd0000        	call	_GPIO_WriteLow
 792  016c 84            	pop	a
 793                     ; 879   SD_SendCmd(SD_CMD_GO_IDLE_STATE, (uint32_t)0, 0x95);
 795  016d 4b95          	push	#149
 796  016f 5f            	clrw	x
 797  0170 89            	pushw	x
 798  0171 89            	pushw	x
 799  0172 4f            	clr	a
 800  0173 cd004c        	call	_SD_SendCmd
 802  0176 5b05          	addw	sp,#5
 803                     ; 882   if (SD_GetResponse(SD_IN_IDLE_STATE))
 805  0178 a601          	ld	a,#1
 806  017a cd00e3        	call	_SD_GetResponse
 808  017d 4d            	tnz	a
 809                     ; 885     return SD_RESPONSE_FAILURE;
 811  017e 2703cc020f    	jrne	L172
 812                     ; 888   SD_SendCmd(SD_CMD_IF_COND, (uint32_t)0x156, 0x43);
 814  0183 4b43          	push	#67
 815  0185 ae0156        	ldw	x,#342
 816  0188 89            	pushw	x
 817  0189 5f            	clrw	x
 818  018a 89            	pushw	x
 819  018b a608          	ld	a,#8
 820  018d cd004c        	call	_SD_SendCmd
 822  0190 5b05          	addw	sp,#5
 823                     ; 889   SD_GetResponseVal(resp,0x01);
 825  0192 4b01          	push	#1
 826  0194 96            	ldw	x,sp
 827  0195 1c0004        	addw	x,#OFST-4
 828  0198 cd0114        	call	_SD_GetResponseVal
 830  019b 84            	pop	a
 831                     ; 890   if(resp[0]==0x01){
 833  019c 7b03          	ld	a,(OFST-5,sp)
 834  019e 4a            	dec	a
 835  019f 2672          	jrne	L503
 836                     ; 892     if ((resp[3] == 0x01)&&(resp[4] == 0x56)){
 838  01a1 7b06          	ld	a,(OFST-2,sp)
 839  01a3 4a            	dec	a
 840  01a4 2669          	jrne	L172
 842  01a6 7b07          	ld	a,(OFST-1,sp)
 843  01a8 a156          	cp	a,#86
 844  01aa 2663          	jrne	L172
 845  01ac               L372:
 846                     ; 896             SD_SendCmd(SD_CMD_55, (uint32_t)0, 0x01);
 848  01ac 4b01          	push	#1
 849  01ae 5f            	clrw	x
 850  01af 89            	pushw	x
 851  01b0 89            	pushw	x
 852  01b1 a637          	ld	a,#55
 853  01b3 cd004c        	call	_SD_SendCmd
 855  01b6 5b05          	addw	sp,#5
 856                     ; 897             SD_GetResponseVal(resp,0x01);
 858  01b8 4b01          	push	#1
 859  01ba 96            	ldw	x,sp
 860  01bb 1c0004        	addw	x,#OFST-4
 861  01be cd0114        	call	_SD_GetResponseVal
 863  01c1 ae0064        	ldw	x,#100
 864  01c4 84            	pop	a
 865                     ; 898 						dly((uint32_t)100);
 867  01c5 89            	pushw	x
 868  01c6 5f            	clrw	x
 869  01c7 89            	pushw	x
 870  01c8 cd0000        	call	_dly
 872  01cb 5b04          	addw	sp,#4
 873                     ; 899             SD_SendCmd(SD_ACMD_41&0x7f, (1UL<<30), 0x1);
 875  01cd 4b01          	push	#1
 876  01cf 5f            	clrw	x
 877  01d0 89            	pushw	x
 878  01d1 ae4000        	ldw	x,#16384
 879  01d4 89            	pushw	x
 880  01d5 a669          	ld	a,#105
 881  01d7 cd004c        	call	_SD_SendCmd
 883  01da 5b05          	addw	sp,#5
 884                     ; 900 						dly((uint32_t)10000);
 886  01dc ae2710        	ldw	x,#10000
 887  01df 89            	pushw	x
 888  01e0 5f            	clrw	x
 889  01e1 89            	pushw	x
 890  01e2 cd0000        	call	_dly
 892  01e5 5b04          	addw	sp,#4
 893                     ; 901             SD_GetResponseVal(resp,0x00);
 895  01e7 4b00          	push	#0
 896  01e9 96            	ldw	x,sp
 897  01ea 1c0004        	addw	x,#OFST-4
 898  01ed cd0114        	call	_SD_GetResponseVal
 900  01f0 84            	pop	a
 901                     ; 902         } while(resp[0]); //until resved 0x0
 903  01f1 7b03          	ld	a,(OFST-5,sp)
 904  01f3 26b7          	jrne	L372
 905                     ; 904         SD_SendCmd(SD_CMD_58, (uint32_t)0,0x01);
 907  01f5 4b01          	push	#1
 908  01f7 5f            	clrw	x
 909  01f8 89            	pushw	x
 910  01f9 89            	pushw	x
 911  01fa a63a          	ld	a,#58
 912  01fc cd004c        	call	_SD_SendCmd
 914  01ff 5b05          	addw	sp,#5
 915                     ; 905         SD_GetResponseVal(resp,58);
 917  0201 4b3a          	push	#58
 918  0203 96            	ldw	x,sp
 919  0204 1c0004        	addw	x,#OFST-4
 920  0207 cd0114        	call	_SD_GetResponseVal
 922  020a 84            	pop	a
 923                     ; 906         return SD_RESPONSE_NO_ERROR;
 925  020b               LC001:
 927  020b 4f            	clr	a
 929  020c               L241:
 931  020c 5b08          	addw	sp,#8
 932  020e 81            	ret	
 933  020f               L172:
 934                     ; 909 				return SD_RESPONSE_FAILURE;
 937  020f a6ff          	ld	a,#255
 939  0211 20f9          	jra	L241
 940  0213               L503:
 941                     ; 915 				SD_SendCmd(SD_CMD_55, 0, 0x01);
 943  0213 4b01          	push	#1
 944  0215 5f            	clrw	x
 945  0216 89            	pushw	x
 946  0217 89            	pushw	x
 947  0218 a637          	ld	a,#55
 948  021a cd004c        	call	_SD_SendCmd
 950  021d 5b05          	addw	sp,#5
 951                     ; 916 				SD_GetResponseVal(resp,0x01);
 953  021f 4b01          	push	#1
 954  0221 96            	ldw	x,sp
 955  0222 1c0004        	addw	x,#OFST-4
 956  0225 cd0114        	call	_SD_GetResponseVal
 958  0228 ae2710        	ldw	x,#10000
 959  022b 84            	pop	a
 960                     ; 917 				dly((uint32_t)10000);
 962  022c 89            	pushw	x
 963  022d 5f            	clrw	x
 964  022e 89            	pushw	x
 965  022f cd0000        	call	_dly
 967  0232 5b04          	addw	sp,#4
 968                     ; 918 				SD_SendCmd(SD_ACMD_41&0x7f, 0UL, 0x1);
 970  0234 4b01          	push	#1
 971  0236 5f            	clrw	x
 972  0237 89            	pushw	x
 973  0238 89            	pushw	x
 974  0239 a669          	ld	a,#105
 975  023b cd004c        	call	_SD_SendCmd
 977  023e 5b05          	addw	sp,#5
 978                     ; 919 				SD_GetResponseVal(resp,0x00);
 980  0240 4b00          	push	#0
 981  0242 96            	ldw	x,sp
 982  0243 1c0004        	addw	x,#OFST-4
 983  0246 cd0114        	call	_SD_GetResponseVal
 985  0249 ae2710        	ldw	x,#10000
 986  024c 84            	pop	a
 987                     ; 920 				dly((uint32_t)10000);
 989  024d 89            	pushw	x
 990  024e 5f            	clrw	x
 991  024f 89            	pushw	x
 992  0250 cd0000        	call	_dly
 994  0253 5b04          	addw	sp,#4
 995                     ; 921 		} while(resp[0]);
 997  0255 7b03          	ld	a,(OFST-5,sp)
 998  0257 26ba          	jrne	L503
 999                     ; 926   SD_CS_HIGH();
1001  0259 4b10          	push	#16
1002  025b ae500a        	ldw	x,#20490
1003  025e cd0000        	call	_GPIO_WriteHigh
1005  0261 84            	pop	a
1006                     ; 929   SD_WriteByte(SD_DUMMY_BYTE);
1008  0262 a6ff          	ld	a,#255
1009  0264 ad02          	call	_SD_WriteByte
1011                     ; 931   return SD_RESPONSE_NO_ERROR;
1013  0266 20a3          	jp	LC001
1048                     ; 941 uint8_t SD_WriteByte(uint8_t Data)
1048                     ; 942 {
1049                     	switch	.text
1050  0268               _SD_WriteByte:
1052  0268 88            	push	a
1053       00000000      OFST:	set	0
1056  0269               L133:
1057                     ; 944   while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET)
1059  0269 a602          	ld	a,#2
1060  026b cd0000        	call	_SPI_GetFlagStatus
1062  026e 4d            	tnz	a
1063  026f 27f8          	jreq	L133
1064                     ; 948   SPI_SendData(Data);
1066  0271 7b01          	ld	a,(OFST+1,sp)
1067  0273 cd0000        	call	_SPI_SendData
1070  0276               L733:
1071                     ; 951   while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET)
1073  0276 a601          	ld	a,#1
1074  0278 cd0000        	call	_SPI_GetFlagStatus
1076  027b 4d            	tnz	a
1077  027c 27f8          	jreq	L733
1078                     ; 955   return SPI_ReceiveData();
1080  027e cd0000        	call	_SPI_ReceiveData
1084  0281 5b01          	addw	sp,#1
1085  0283 81            	ret	
1120                     ; 963 uint8_t SD_ReadByte(void)
1120                     ; 964 {
1121                     	switch	.text
1122  0284               _SD_ReadByte:
1124  0284 88            	push	a
1125       00000001      OFST:	set	1
1128                     ; 965   uint8_t Data = 0;
1131  0285               L163:
1132                     ; 968   while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET)
1134  0285 a602          	ld	a,#2
1135  0287 cd0000        	call	_SPI_GetFlagStatus
1137  028a 4d            	tnz	a
1138  028b 27f8          	jreq	L163
1139                     ; 971   SPI_SendData(SD_DUMMY_BYTE);
1141  028d a6ff          	ld	a,#255
1142  028f cd0000        	call	_SPI_SendData
1145  0292               L763:
1146                     ; 974   while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET)
1148  0292 a601          	ld	a,#1
1149  0294 cd0000        	call	_SPI_GetFlagStatus
1151  0297 4d            	tnz	a
1152  0298 27f8          	jreq	L763
1153                     ; 977   Data = SPI_ReceiveData();
1155  029a cd0000        	call	_SPI_ReceiveData
1158                     ; 980   return Data;
1162  029d 5b01          	addw	sp,#1
1163  029f 81            	ret	
1189                     ; 1025 void SD_LowLevel_Init(void)
1189                     ; 1026 {
1190                     	switch	.text
1191  02a0               _SD_LowLevel_Init:
1195                     ; 1035   SPI_Init( SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_64, SPI_MODE_MASTER,
1195                     ; 1036            SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_2EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX,
1195                     ; 1037            SPI_NSS_SOFT, 0x07);
1197  02a0 4b07          	push	#7
1198  02a2 4b02          	push	#2
1199  02a4 4b00          	push	#0
1200  02a6 4b01          	push	#1
1201  02a8 4b02          	push	#2
1202  02aa 4b04          	push	#4
1203  02ac ae0028        	ldw	x,#40
1204  02af cd0000        	call	_SPI_Init
1206  02b2 5b06          	addw	sp,#6
1207                     ; 1041   SPI_Cmd( ENABLE);
1209  02b4 a601          	ld	a,#1
1210  02b6 cd0000        	call	_SPI_Cmd
1212                     ; 1044   GPIO_Init(SD_CS_GPIO_PORT, SD_CS_PIN, GPIO_MODE_OUT_OD_HIZ_SLOW);
1214  02b9 4b90          	push	#144
1215  02bb 4b10          	push	#16
1216  02bd ae500a        	ldw	x,#20490
1217  02c0 cd0000        	call	_GPIO_Init
1219  02c3 85            	popw	x
1220                     ; 1046 }
1223  02c4 81            	ret	
1236                     	xdef	_SD_GetResponseVal
1237                     	xdef	_SD_LowLevel_Init
1238                     	xdef	_SD_ReadByte
1239                     	xdef	_SD_WriteByte
1240                     	xdef	_SD_GoIdleState
1241                     	xdef	_SD_GetDataResponse
1242                     	xdef	_SD_GetResponse
1243                     	xdef	_SD_SendCmd
1244                     	xdef	_SD_Detect
1245                     	xdef	_SD_Init
1246                     	xref	_SPI_GetFlagStatus
1247                     	xref	_SPI_ReceiveData
1248                     	xref	_SPI_SendData
1249                     	xref	_SPI_Cmd
1250                     	xref	_SPI_Init
1251                     	xref	_GPIO_WriteLow
1252                     	xref	_GPIO_WriteHigh
1253                     	xref	_GPIO_Init
1254                     	xref.b	c_x
1273                     	xref	c_xymvx
1274                     	xref	c_lzmp
1275                     	xref	c_lgsbc
1276                     	xref	c_lcmp
1277                     	xref	c_ltor
1278                     	xref	c_lgadc
1279                     	end
