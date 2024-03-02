   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  44                     ; 50 void SPI_DeInit(void)
  44                     ; 51 {
  46                     	switch	.text
  47  0000               _SPI_DeInit:
  51                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  53  0000 725f5200      	clr	20992
  54                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  56  0004 725f5201      	clr	20993
  57                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  59  0008 725f5202      	clr	20994
  60                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  62  000c 35025203      	mov	20995,#2
  63                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  65  0010 35075205      	mov	20997,#7
  66                     ; 57 }
  69  0014 81            	ret	
 384                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 384                     ; 79 {
 385                     	switch	.text
 386  0015               _SPI_Init:
 388  0015 89            	pushw	x
 389  0016 88            	push	a
 390       00000001      OFST:	set	1
 393                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 395  0017 9e            	ld	a,xh
 396  0018 4d            	tnz	a
 397  0019 2713          	jreq	L41
 398  001b 9e            	ld	a,xh
 399  001c a180          	cp	a,#128
 400  001e 270e          	jreq	L41
 401  0020 ae0051        	ldw	x,#81
 402  0023 89            	pushw	x
 403  0024 5f            	clrw	x
 404  0025 89            	pushw	x
 405  0026 ae0000        	ldw	x,#L102
 406  0029 cd0000        	call	_assert_failed
 408  002c 5b04          	addw	sp,#4
 409  002e               L41:
 410                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 412  002e 7b03          	ld	a,(OFST+2,sp)
 413  0030 272a          	jreq	L42
 414  0032 a108          	cp	a,#8
 415  0034 2726          	jreq	L42
 416  0036 a110          	cp	a,#16
 417  0038 2722          	jreq	L42
 418  003a a118          	cp	a,#24
 419  003c 271e          	jreq	L42
 420  003e a120          	cp	a,#32
 421  0040 271a          	jreq	L42
 422  0042 a128          	cp	a,#40
 423  0044 2716          	jreq	L42
 424  0046 a130          	cp	a,#48
 425  0048 2712          	jreq	L42
 426  004a a138          	cp	a,#56
 427  004c 270e          	jreq	L42
 428  004e ae0052        	ldw	x,#82
 429  0051 89            	pushw	x
 430  0052 5f            	clrw	x
 431  0053 89            	pushw	x
 432  0054 ae0000        	ldw	x,#L102
 433  0057 cd0000        	call	_assert_failed
 435  005a 5b04          	addw	sp,#4
 436  005c               L42:
 437                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 439  005c 7b06          	ld	a,(OFST+5,sp)
 440  005e a104          	cp	a,#4
 441  0060 2711          	jreq	L43
 442  0062 4d            	tnz	a
 443  0063 270e          	jreq	L43
 444  0065 ae0053        	ldw	x,#83
 445  0068 89            	pushw	x
 446  0069 5f            	clrw	x
 447  006a 89            	pushw	x
 448  006b ae0000        	ldw	x,#L102
 449  006e cd0000        	call	_assert_failed
 451  0071 5b04          	addw	sp,#4
 452  0073               L43:
 453                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 455  0073 7b07          	ld	a,(OFST+6,sp)
 456  0075 2712          	jreq	L44
 457  0077 a102          	cp	a,#2
 458  0079 270e          	jreq	L44
 459  007b ae0054        	ldw	x,#84
 460  007e 89            	pushw	x
 461  007f 5f            	clrw	x
 462  0080 89            	pushw	x
 463  0081 ae0000        	ldw	x,#L102
 464  0084 cd0000        	call	_assert_failed
 466  0087 5b04          	addw	sp,#4
 467  0089               L44:
 468                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 470  0089 7b08          	ld	a,(OFST+7,sp)
 471  008b 2711          	jreq	L45
 472  008d 4a            	dec	a
 473  008e 270e          	jreq	L45
 474  0090 ae0055        	ldw	x,#85
 475  0093 89            	pushw	x
 476  0094 5f            	clrw	x
 477  0095 89            	pushw	x
 478  0096 ae0000        	ldw	x,#L102
 479  0099 cd0000        	call	_assert_failed
 481  009c 5b04          	addw	sp,#4
 482  009e               L45:
 483                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 485  009e 7b09          	ld	a,(OFST+8,sp)
 486  00a0 271a          	jreq	L46
 487  00a2 a104          	cp	a,#4
 488  00a4 2716          	jreq	L46
 489  00a6 a180          	cp	a,#128
 490  00a8 2712          	jreq	L46
 491  00aa a1c0          	cp	a,#192
 492  00ac 270e          	jreq	L46
 493  00ae ae0056        	ldw	x,#86
 494  00b1 89            	pushw	x
 495  00b2 5f            	clrw	x
 496  00b3 89            	pushw	x
 497  00b4 ae0000        	ldw	x,#L102
 498  00b7 cd0000        	call	_assert_failed
 500  00ba 5b04          	addw	sp,#4
 501  00bc               L46:
 502                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 504  00bc 7b0a          	ld	a,(OFST+9,sp)
 505  00be a102          	cp	a,#2
 506  00c0 2711          	jreq	L47
 507  00c2 4d            	tnz	a
 508  00c3 270e          	jreq	L47
 509  00c5 ae0057        	ldw	x,#87
 510  00c8 89            	pushw	x
 511  00c9 5f            	clrw	x
 512  00ca 89            	pushw	x
 513  00cb ae0000        	ldw	x,#L102
 514  00ce cd0000        	call	_assert_failed
 516  00d1 5b04          	addw	sp,#4
 517  00d3               L47:
 518                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 520  00d3 7b0b          	ld	a,(OFST+10,sp)
 521  00d5 260e          	jrne	L201
 522  00d7 ae0058        	ldw	x,#88
 523  00da 89            	pushw	x
 524  00db 5f            	clrw	x
 525  00dc 89            	pushw	x
 526  00dd ae0000        	ldw	x,#L102
 527  00e0 cd0000        	call	_assert_failed
 529  00e3 5b04          	addw	sp,#4
 530  00e5               L201:
 531                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 531                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 533  00e5 7b07          	ld	a,(OFST+6,sp)
 534  00e7 1a08          	or	a,(OFST+7,sp)
 535  00e9 6b01          	ld	(OFST+0,sp),a
 537  00eb 7b02          	ld	a,(OFST+1,sp)
 538  00ed 1a03          	or	a,(OFST+2,sp)
 539  00ef 1a01          	or	a,(OFST+0,sp)
 540  00f1 c75200        	ld	20992,a
 541                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 543  00f4 7b09          	ld	a,(OFST+8,sp)
 544  00f6 1a0a          	or	a,(OFST+9,sp)
 545  00f8 c75201        	ld	20993,a
 546                     ; 97   if (Mode == SPI_MODE_MASTER)
 548  00fb 7b06          	ld	a,(OFST+5,sp)
 549  00fd a104          	cp	a,#4
 550  00ff 2606          	jrne	L302
 551                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 553  0101 72105201      	bset	20993,#0
 555  0105 2004          	jra	L502
 556  0107               L302:
 557                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 559  0107 72115201      	bres	20993,#0
 560  010b               L502:
 561                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 563  010b c65200        	ld	a,20992
 564  010e 1a06          	or	a,(OFST+5,sp)
 565  0110 c75200        	ld	20992,a
 566                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 568  0113 7b0b          	ld	a,(OFST+10,sp)
 569  0115 c75205        	ld	20997,a
 570                     ; 111 }
 573  0118 5b03          	addw	sp,#3
 574  011a 81            	ret	
 630                     ; 119 void SPI_Cmd(FunctionalState NewState)
 630                     ; 120 {
 631                     	switch	.text
 632  011b               _SPI_Cmd:
 634  011b 88            	push	a
 635       00000000      OFST:	set	0
 638                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 640  011c 4d            	tnz	a
 641  011d 2711          	jreq	L411
 642  011f 4a            	dec	a
 643  0120 270e          	jreq	L411
 644  0122 ae007a        	ldw	x,#122
 645  0125 89            	pushw	x
 646  0126 5f            	clrw	x
 647  0127 89            	pushw	x
 648  0128 ae0000        	ldw	x,#L102
 649  012b cd0000        	call	_assert_failed
 651  012e 5b04          	addw	sp,#4
 652  0130               L411:
 653                     ; 124   if (NewState != DISABLE)
 655  0130 7b01          	ld	a,(OFST+1,sp)
 656  0132 2706          	jreq	L532
 657                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 659  0134 721c5200      	bset	20992,#6
 661  0138 2004          	jra	L732
 662  013a               L532:
 663                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 665  013a 721d5200      	bres	20992,#6
 666  013e               L732:
 667                     ; 132 }
 670  013e 84            	pop	a
 671  013f 81            	ret	
 779                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 779                     ; 142 {
 780                     	switch	.text
 781  0140               _SPI_ITConfig:
 783  0140 89            	pushw	x
 784  0141 88            	push	a
 785       00000001      OFST:	set	1
 788                     ; 143   uint8_t itpos = 0;
 790                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 792  0142 9e            	ld	a,xh
 793  0143 a117          	cp	a,#23
 794  0145 271d          	jreq	L621
 795  0147 9e            	ld	a,xh
 796  0148 a106          	cp	a,#6
 797  014a 2718          	jreq	L621
 798  014c 9e            	ld	a,xh
 799  014d a105          	cp	a,#5
 800  014f 2713          	jreq	L621
 801  0151 9e            	ld	a,xh
 802  0152 a134          	cp	a,#52
 803  0154 270e          	jreq	L621
 804  0156 ae0091        	ldw	x,#145
 805  0159 89            	pushw	x
 806  015a 5f            	clrw	x
 807  015b 89            	pushw	x
 808  015c ae0000        	ldw	x,#L102
 809  015f cd0000        	call	_assert_failed
 811  0162 5b04          	addw	sp,#4
 812  0164               L621:
 813                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 815  0164 7b03          	ld	a,(OFST+2,sp)
 816  0166 2711          	jreq	L631
 817  0168 4a            	dec	a
 818  0169 270e          	jreq	L631
 819  016b ae0092        	ldw	x,#146
 820  016e 89            	pushw	x
 821  016f 5f            	clrw	x
 822  0170 89            	pushw	x
 823  0171 ae0000        	ldw	x,#L102
 824  0174 cd0000        	call	_assert_failed
 826  0177 5b04          	addw	sp,#4
 827  0179               L631:
 828                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 830  0179 7b02          	ld	a,(OFST+1,sp)
 831  017b a40f          	and	a,#15
 832  017d 5f            	clrw	x
 833  017e 97            	ld	xl,a
 834  017f a601          	ld	a,#1
 835  0181 5d            	tnzw	x
 836  0182 2704          	jreq	L241
 837  0184               L441:
 838  0184 48            	sll	a
 839  0185 5a            	decw	x
 840  0186 26fc          	jrne	L441
 841  0188               L241:
 842  0188 6b01          	ld	(OFST+0,sp),a
 844                     ; 151   if (NewState != DISABLE)
 846  018a 0d03          	tnz	(OFST+2,sp)
 847  018c 2707          	jreq	L703
 848                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 850  018e c65202        	ld	a,20994
 851  0191 1a01          	or	a,(OFST+0,sp)
 853  0193 2004          	jra	L113
 854  0195               L703:
 855                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 857  0195 43            	cpl	a
 858  0196 c45202        	and	a,20994
 859  0199               L113:
 860  0199 c75202        	ld	20994,a
 861                     ; 159 }
 864  019c 5b03          	addw	sp,#3
 865  019e 81            	ret	
 897                     ; 166 void SPI_SendData(uint8_t Data)
 897                     ; 167 {
 898                     	switch	.text
 899  019f               _SPI_SendData:
 903                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 905  019f c75204        	ld	20996,a
 906                     ; 169 }
 909  01a2 81            	ret	
 932                     ; 176 uint8_t SPI_ReceiveData(void)
 932                     ; 177 {
 933                     	switch	.text
 934  01a3               _SPI_ReceiveData:
 938                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 940  01a3 c65204        	ld	a,20996
 943  01a6 81            	ret	
 980                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 980                     ; 188 {
 981                     	switch	.text
 982  01a7               _SPI_NSSInternalSoftwareCmd:
 984  01a7 88            	push	a
 985       00000000      OFST:	set	0
 988                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 990  01a8 4d            	tnz	a
 991  01a9 2711          	jreq	L061
 992  01ab 4a            	dec	a
 993  01ac 270e          	jreq	L061
 994  01ae ae00be        	ldw	x,#190
 995  01b1 89            	pushw	x
 996  01b2 5f            	clrw	x
 997  01b3 89            	pushw	x
 998  01b4 ae0000        	ldw	x,#L102
 999  01b7 cd0000        	call	_assert_failed
1001  01ba 5b04          	addw	sp,#4
1002  01bc               L061:
1003                     ; 192   if (NewState != DISABLE)
1005  01bc 7b01          	ld	a,(OFST+1,sp)
1006  01be 2706          	jreq	L553
1007                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
1009  01c0 72105201      	bset	20993,#0
1011  01c4 2004          	jra	L753
1012  01c6               L553:
1013                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
1015  01c6 72115201      	bres	20993,#0
1016  01ca               L753:
1017                     ; 200 }
1020  01ca 84            	pop	a
1021  01cb 81            	ret	
1044                     ; 207 void SPI_TransmitCRC(void)
1044                     ; 208 {
1045                     	switch	.text
1046  01cc               _SPI_TransmitCRC:
1050                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1052  01cc 72185201      	bset	20993,#4
1053                     ; 210 }
1056  01d0 81            	ret	
1093                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
1093                     ; 219 {
1094                     	switch	.text
1095  01d1               _SPI_CalculateCRCCmd:
1097  01d1 88            	push	a
1098       00000000      OFST:	set	0
1101                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1103  01d2 4d            	tnz	a
1104  01d3 2711          	jreq	L471
1105  01d5 4a            	dec	a
1106  01d6 270e          	jreq	L471
1107  01d8 ae00dd        	ldw	x,#221
1108  01db 89            	pushw	x
1109  01dc 5f            	clrw	x
1110  01dd 89            	pushw	x
1111  01de ae0000        	ldw	x,#L102
1112  01e1 cd0000        	call	_assert_failed
1114  01e4 5b04          	addw	sp,#4
1115  01e6               L471:
1116                     ; 223   if (NewState != DISABLE)
1118  01e6 7b01          	ld	a,(OFST+1,sp)
1119  01e8 2706          	jreq	L704
1120                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1122  01ea 721a5201      	bset	20993,#5
1124  01ee 2004          	jra	L114
1125  01f0               L704:
1126                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1128  01f0 721b5201      	bres	20993,#5
1129  01f4               L114:
1130                     ; 231 }
1133  01f4 84            	pop	a
1134  01f5 81            	ret	
1197                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
1197                     ; 239 {
1198                     	switch	.text
1199  01f6               _SPI_GetCRC:
1201  01f6 88            	push	a
1202  01f7 88            	push	a
1203       00000001      OFST:	set	1
1206                     ; 240   uint8_t crcreg = 0;
1208                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1210  01f8 a101          	cp	a,#1
1211  01fa 2711          	jreq	L602
1212  01fc 4d            	tnz	a
1213  01fd 270e          	jreq	L602
1214  01ff ae00f3        	ldw	x,#243
1215  0202 89            	pushw	x
1216  0203 5f            	clrw	x
1217  0204 89            	pushw	x
1218  0205 ae0000        	ldw	x,#L102
1219  0208 cd0000        	call	_assert_failed
1221  020b 5b04          	addw	sp,#4
1222  020d               L602:
1223                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1225  020d 7b02          	ld	a,(OFST+1,sp)
1226  020f 2705          	jreq	L344
1227                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1229  0211 c65207        	ld	a,20999
1232  0214 2003          	jra	L544
1233  0216               L344:
1234                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1236  0216 c65206        	ld	a,20998
1238  0219               L544:
1239                     ; 255   return crcreg;
1243  0219 85            	popw	x
1244  021a 81            	ret	
1269                     ; 263 void SPI_ResetCRC(void)
1269                     ; 264 {
1270                     	switch	.text
1271  021b               _SPI_ResetCRC:
1275                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1277  021b a601          	ld	a,#1
1278  021d adb2          	call	_SPI_CalculateCRCCmd
1280                     ; 270   SPI_Cmd(ENABLE);
1282  021f a601          	ld	a,#1
1284                     ; 271 }
1287  0221 cc011b        	jp	_SPI_Cmd
1311                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1311                     ; 279 {
1312                     	switch	.text
1313  0224               _SPI_GetCRCPolynomial:
1317                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1319  0224 c65205        	ld	a,20997
1322  0227 81            	ret	
1379                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1379                     ; 289 {
1380                     	switch	.text
1381  0228               _SPI_BiDirectionalLineConfig:
1383  0228 88            	push	a
1384       00000000      OFST:	set	0
1387                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1389  0229 4d            	tnz	a
1390  022a 2711          	jreq	L032
1391  022c 4a            	dec	a
1392  022d 270e          	jreq	L032
1393  022f ae0123        	ldw	x,#291
1394  0232 89            	pushw	x
1395  0233 5f            	clrw	x
1396  0234 89            	pushw	x
1397  0235 ae0000        	ldw	x,#L102
1398  0238 cd0000        	call	_assert_failed
1400  023b 5b04          	addw	sp,#4
1401  023d               L032:
1402                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1404  023d 7b01          	ld	a,(OFST+1,sp)
1405  023f 2706          	jreq	L515
1406                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1408  0241 721c5201      	bset	20993,#6
1410  0245 2004          	jra	L715
1411  0247               L515:
1412                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1414  0247 721d5201      	bres	20993,#6
1415  024b               L715:
1416                     ; 301 }
1419  024b 84            	pop	a
1420  024c 81            	ret	
1542                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1542                     ; 312 {
1543                     	switch	.text
1544  024d               _SPI_GetFlagStatus:
1546  024d 88            	push	a
1547  024e 88            	push	a
1548       00000001      OFST:	set	1
1551                     ; 313   FlagStatus status = RESET;
1553                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1555  024f a140          	cp	a,#64
1556  0251 2726          	jreq	L242
1557  0253 a120          	cp	a,#32
1558  0255 2722          	jreq	L242
1559  0257 a110          	cp	a,#16
1560  0259 271e          	jreq	L242
1561  025b a108          	cp	a,#8
1562  025d 271a          	jreq	L242
1563  025f a102          	cp	a,#2
1564  0261 2716          	jreq	L242
1565  0263 a101          	cp	a,#1
1566  0265 2712          	jreq	L242
1567  0267 a180          	cp	a,#128
1568  0269 270e          	jreq	L242
1569  026b ae013b        	ldw	x,#315
1570  026e 89            	pushw	x
1571  026f 5f            	clrw	x
1572  0270 89            	pushw	x
1573  0271 ae0000        	ldw	x,#L102
1574  0274 cd0000        	call	_assert_failed
1576  0277 5b04          	addw	sp,#4
1577  0279               L242:
1578                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1580  0279 c65203        	ld	a,20995
1581  027c 1502          	bcp	a,(OFST+1,sp)
1582  027e 2704          	jreq	L575
1583                     ; 320     status = SET; /* SPI_FLAG is set */
1585  0280 a601          	ld	a,#1
1588  0282 2001          	jra	L775
1589  0284               L575:
1590                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1592  0284 4f            	clr	a
1594  0285               L775:
1595                     ; 328   return status;
1599  0285 85            	popw	x
1600  0286 81            	ret	
1636                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1636                     ; 347 {
1637                     	switch	.text
1638  0287               _SPI_ClearFlag:
1640  0287 88            	push	a
1641       00000000      OFST:	set	0
1644                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1646  0288 a110          	cp	a,#16
1647  028a 2712          	jreq	L452
1648  028c a108          	cp	a,#8
1649  028e 270e          	jreq	L452
1650  0290 ae015c        	ldw	x,#348
1651  0293 89            	pushw	x
1652  0294 5f            	clrw	x
1653  0295 89            	pushw	x
1654  0296 ae0000        	ldw	x,#L102
1655  0299 cd0000        	call	_assert_failed
1657  029c 5b04          	addw	sp,#4
1658  029e               L452:
1659                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1661  029e 7b01          	ld	a,(OFST+1,sp)
1662  02a0 43            	cpl	a
1663  02a1 c75203        	ld	20995,a
1664                     ; 351 }
1667  02a4 84            	pop	a
1668  02a5 81            	ret	
1743                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1743                     ; 367 {
1744                     	switch	.text
1745  02a6               _SPI_GetITStatus:
1747  02a6 88            	push	a
1748  02a7 89            	pushw	x
1749       00000002      OFST:	set	2
1752                     ; 368   ITStatus pendingbitstatus = RESET;
1754                     ; 369   uint8_t itpos = 0;
1756                     ; 370   uint8_t itmask1 = 0;
1758                     ; 371   uint8_t itmask2 = 0;
1760                     ; 372   uint8_t enablestatus = 0;
1762                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1764  02a8 a165          	cp	a,#101
1765  02aa 2722          	jreq	L662
1766  02ac a155          	cp	a,#85
1767  02ae 271e          	jreq	L662
1768  02b0 a145          	cp	a,#69
1769  02b2 271a          	jreq	L662
1770  02b4 a134          	cp	a,#52
1771  02b6 2716          	jreq	L662
1772  02b8 a117          	cp	a,#23
1773  02ba 2712          	jreq	L662
1774  02bc a106          	cp	a,#6
1775  02be 270e          	jreq	L662
1776  02c0 ae0175        	ldw	x,#373
1777  02c3 89            	pushw	x
1778  02c4 5f            	clrw	x
1779  02c5 89            	pushw	x
1780  02c6 ae0000        	ldw	x,#L102
1781  02c9 cd0000        	call	_assert_failed
1783  02cc 5b04          	addw	sp,#4
1784  02ce               L662:
1785                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1787  02ce 7b03          	ld	a,(OFST+1,sp)
1788  02d0 a40f          	and	a,#15
1789  02d2 5f            	clrw	x
1790  02d3 97            	ld	xl,a
1791  02d4 a601          	ld	a,#1
1792  02d6 5d            	tnzw	x
1793  02d7 2704          	jreq	L272
1794  02d9               L472:
1795  02d9 48            	sll	a
1796  02da 5a            	decw	x
1797  02db 26fc          	jrne	L472
1798  02dd               L272:
1799  02dd 6b01          	ld	(OFST-1,sp),a
1801                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1803  02df 7b03          	ld	a,(OFST+1,sp)
1804  02e1 4e            	swap	a
1805  02e2 a40f          	and	a,#15
1806  02e4 6b02          	ld	(OFST+0,sp),a
1808                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1810  02e6 5f            	clrw	x
1811  02e7 97            	ld	xl,a
1812  02e8 a601          	ld	a,#1
1813  02ea 5d            	tnzw	x
1814  02eb 2704          	jreq	L672
1815  02ed               L003:
1816  02ed 48            	sll	a
1817  02ee 5a            	decw	x
1818  02ef 26fc          	jrne	L003
1819  02f1               L672:
1821                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1823  02f1 c45203        	and	a,20995
1824  02f4 6b02          	ld	(OFST+0,sp),a
1826                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1828  02f6 c65202        	ld	a,20994
1829  02f9 1501          	bcp	a,(OFST-1,sp)
1830  02fb 2708          	jreq	L156
1832  02fd 7b02          	ld	a,(OFST+0,sp)
1833  02ff 2704          	jreq	L156
1834                     ; 387     pendingbitstatus = SET;
1836  0301 a601          	ld	a,#1
1839  0303 2001          	jra	L356
1840  0305               L156:
1841                     ; 392     pendingbitstatus = RESET;
1843  0305 4f            	clr	a
1845  0306               L356:
1846                     ; 395   return  pendingbitstatus;
1850  0306 5b03          	addw	sp,#3
1851  0308 81            	ret	
1895                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1895                     ; 413 {
1896                     	switch	.text
1897  0309               _SPI_ClearITPendingBit:
1899  0309 88            	push	a
1900  030a 88            	push	a
1901       00000001      OFST:	set	1
1904                     ; 414   uint8_t itpos = 0;
1906                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1908  030b a145          	cp	a,#69
1909  030d 2712          	jreq	L013
1910  030f a134          	cp	a,#52
1911  0311 270e          	jreq	L013
1912  0313 ae019f        	ldw	x,#415
1913  0316 89            	pushw	x
1914  0317 5f            	clrw	x
1915  0318 89            	pushw	x
1916  0319 ae0000        	ldw	x,#L102
1917  031c cd0000        	call	_assert_failed
1919  031f 5b04          	addw	sp,#4
1920  0321               L013:
1921                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1923  0321 7b02          	ld	a,(OFST+1,sp)
1924  0323 4e            	swap	a
1925  0324 a40f          	and	a,#15
1926  0326 5f            	clrw	x
1927  0327 97            	ld	xl,a
1928  0328 a601          	ld	a,#1
1929  032a 5d            	tnzw	x
1930  032b 2704          	jreq	L413
1931  032d               L613:
1932  032d 48            	sll	a
1933  032e 5a            	decw	x
1934  032f 26fc          	jrne	L613
1935  0331               L413:
1937                     ; 422   SPI->SR = (uint8_t)(~itpos);
1939  0331 43            	cpl	a
1940  0332 c75203        	ld	20995,a
1941                     ; 424 }
1944  0335 85            	popw	x
1945  0336 81            	ret	
1958                     	xdef	_SPI_ClearITPendingBit
1959                     	xdef	_SPI_GetITStatus
1960                     	xdef	_SPI_ClearFlag
1961                     	xdef	_SPI_GetFlagStatus
1962                     	xdef	_SPI_BiDirectionalLineConfig
1963                     	xdef	_SPI_GetCRCPolynomial
1964                     	xdef	_SPI_ResetCRC
1965                     	xdef	_SPI_GetCRC
1966                     	xdef	_SPI_CalculateCRCCmd
1967                     	xdef	_SPI_TransmitCRC
1968                     	xdef	_SPI_NSSInternalSoftwareCmd
1969                     	xdef	_SPI_ReceiveData
1970                     	xdef	_SPI_SendData
1971                     	xdef	_SPI_ITConfig
1972                     	xdef	_SPI_Cmd
1973                     	xdef	_SPI_Init
1974                     	xdef	_SPI_DeInit
1975                     	xref	_assert_failed
1976                     .const:	section	.text
1977  0000               L102:
1978  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
1979  0012 697665725c73  	dc.b	"iver\src\stm8s_spi"
1980  0024 2e6300        	dc.b	".c",0
2000                     	end
