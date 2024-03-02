   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  44                     ; 53 void UART1_DeInit(void)
  44                     ; 54 {
  46                     	switch	.text
  47  0000               _UART1_DeInit:
  51                     ; 57   (void)UART1->SR;
  53  0000 c65230        	ld	a,21040
  54                     ; 58   (void)UART1->DR;
  56  0003 c65231        	ld	a,21041
  57                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  59  0006 725f5233      	clr	21043
  60                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  62  000a 725f5232      	clr	21042
  63                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  65  000e 725f5234      	clr	21044
  66                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  68  0012 725f5235      	clr	21045
  69                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  71  0016 725f5236      	clr	21046
  72                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  74  001a 725f5237      	clr	21047
  75                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  77  001e 725f5238      	clr	21048
  78                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  80  0022 725f5239      	clr	21049
  81                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  83  0026 725f523a      	clr	21050
  84                     ; 71 }
  87  002a 81            	ret	
 385                     .const:	section	.text
 386  0000               L21:
 387  0000 00098969      	dc.l	625001
 388  0004               L27:
 389  0004 00000064      	dc.l	100
 390                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 390                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 390                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 390                     ; 93 {
 391                     	switch	.text
 392  002b               _UART1_Init:
 394  002b 520c          	subw	sp,#12
 395       0000000c      OFST:	set	12
 398                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 402                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 404  002d 96            	ldw	x,sp
 405  002e 1c000f        	addw	x,#OFST+3
 406  0031 cd0000        	call	c_ltor
 408  0034 ae0000        	ldw	x,#L21
 409  0037 cd0000        	call	c_lcmp
 411  003a 250e          	jrult	L41
 412  003c ae0061        	ldw	x,#97
 413  003f 89            	pushw	x
 414  0040 5f            	clrw	x
 415  0041 89            	pushw	x
 416  0042 ae0008        	ldw	x,#L561
 417  0045 cd0000        	call	_assert_failed
 419  0048 5b04          	addw	sp,#4
 420  004a               L41:
 421                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 423  004a 7b13          	ld	a,(OFST+7,sp)
 424  004c 2712          	jreq	L42
 425  004e a110          	cp	a,#16
 426  0050 270e          	jreq	L42
 427  0052 ae0062        	ldw	x,#98
 428  0055 89            	pushw	x
 429  0056 5f            	clrw	x
 430  0057 89            	pushw	x
 431  0058 ae0008        	ldw	x,#L561
 432  005b cd0000        	call	_assert_failed
 434  005e 5b04          	addw	sp,#4
 435  0060               L42:
 436                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 438  0060 7b14          	ld	a,(OFST+8,sp)
 439  0062 271a          	jreq	L43
 440  0064 a110          	cp	a,#16
 441  0066 2716          	jreq	L43
 442  0068 a120          	cp	a,#32
 443  006a 2712          	jreq	L43
 444  006c a130          	cp	a,#48
 445  006e 270e          	jreq	L43
 446  0070 ae0063        	ldw	x,#99
 447  0073 89            	pushw	x
 448  0074 5f            	clrw	x
 449  0075 89            	pushw	x
 450  0076 ae0008        	ldw	x,#L561
 451  0079 cd0000        	call	_assert_failed
 453  007c 5b04          	addw	sp,#4
 454  007e               L43:
 455                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 457  007e 7b15          	ld	a,(OFST+9,sp)
 458  0080 2716          	jreq	L44
 459  0082 a104          	cp	a,#4
 460  0084 2712          	jreq	L44
 461  0086 a106          	cp	a,#6
 462  0088 270e          	jreq	L44
 463  008a ae0064        	ldw	x,#100
 464  008d 89            	pushw	x
 465  008e 5f            	clrw	x
 466  008f 89            	pushw	x
 467  0090 ae0008        	ldw	x,#L561
 468  0093 cd0000        	call	_assert_failed
 470  0096 5b04          	addw	sp,#4
 471  0098               L44:
 472                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 474  0098 7b17          	ld	a,(OFST+11,sp)
 475  009a a108          	cp	a,#8
 476  009c 272a          	jreq	L45
 477  009e a140          	cp	a,#64
 478  00a0 2726          	jreq	L45
 479  00a2 a104          	cp	a,#4
 480  00a4 2722          	jreq	L45
 481  00a6 a180          	cp	a,#128
 482  00a8 271e          	jreq	L45
 483  00aa a10c          	cp	a,#12
 484  00ac 271a          	jreq	L45
 485  00ae a144          	cp	a,#68
 486  00b0 2716          	jreq	L45
 487  00b2 a1c0          	cp	a,#192
 488  00b4 2712          	jreq	L45
 489  00b6 a188          	cp	a,#136
 490  00b8 270e          	jreq	L45
 491  00ba ae0065        	ldw	x,#101
 492  00bd 89            	pushw	x
 493  00be 5f            	clrw	x
 494  00bf 89            	pushw	x
 495  00c0 ae0008        	ldw	x,#L561
 496  00c3 cd0000        	call	_assert_failed
 498  00c6 5b04          	addw	sp,#4
 499  00c8               L45:
 500                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 502  00c8 7b16          	ld	a,(OFST+10,sp)
 503  00ca a488          	and	a,#136
 504  00cc a188          	cp	a,#136
 505  00ce 2718          	jreq	L06
 506  00d0 7b16          	ld	a,(OFST+10,sp)
 507  00d2 a444          	and	a,#68
 508  00d4 a144          	cp	a,#68
 509  00d6 2710          	jreq	L06
 510  00d8 7b16          	ld	a,(OFST+10,sp)
 511  00da a422          	and	a,#34
 512  00dc a122          	cp	a,#34
 513  00de 2708          	jreq	L06
 514  00e0 7b16          	ld	a,(OFST+10,sp)
 515  00e2 a411          	and	a,#17
 516  00e4 a111          	cp	a,#17
 517  00e6 260e          	jrne	L26
 518  00e8               L06:
 519  00e8 ae0066        	ldw	x,#102
 520  00eb 89            	pushw	x
 521  00ec 5f            	clrw	x
 522  00ed 89            	pushw	x
 523  00ee ae0008        	ldw	x,#L561
 524  00f1 cd0000        	call	_assert_failed
 526  00f4 5b04          	addw	sp,#4
 527  00f6               L26:
 528                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 530  00f6 72195234      	bres	21044,#4
 531                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 533  00fa c65234        	ld	a,21044
 534  00fd 1a13          	or	a,(OFST+7,sp)
 535  00ff c75234        	ld	21044,a
 536                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 538  0102 c65236        	ld	a,21046
 539  0105 a4cf          	and	a,#207
 540  0107 c75236        	ld	21046,a
 541                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 543  010a c65236        	ld	a,21046
 544  010d 1a14          	or	a,(OFST+8,sp)
 545  010f c75236        	ld	21046,a
 546                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 548  0112 c65234        	ld	a,21044
 549  0115 a4f9          	and	a,#249
 550  0117 c75234        	ld	21044,a
 551                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 553  011a c65234        	ld	a,21044
 554  011d 1a15          	or	a,(OFST+9,sp)
 555  011f c75234        	ld	21044,a
 556                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 558  0122 725f5232      	clr	21042
 559                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 561  0126 c65233        	ld	a,21043
 562  0129 a40f          	and	a,#15
 563  012b c75233        	ld	21043,a
 564                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 566  012e c65233        	ld	a,21043
 567  0131 a4f0          	and	a,#240
 568  0133 c75233        	ld	21043,a
 569                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 571  0136 96            	ldw	x,sp
 572  0137 1c000f        	addw	x,#OFST+3
 573  013a cd0000        	call	c_ltor
 575  013d a604          	ld	a,#4
 576  013f cd0000        	call	c_llsh
 578  0142 96            	ldw	x,sp
 579  0143 5c            	incw	x
 580  0144 cd0000        	call	c_rtol
 583  0147 cd0000        	call	_CLK_GetClockFreq
 585  014a 96            	ldw	x,sp
 586  014b 5c            	incw	x
 587  014c cd0000        	call	c_ludv
 589  014f 96            	ldw	x,sp
 590  0150 1c0009        	addw	x,#OFST-3
 591  0153 cd0000        	call	c_rtol
 594                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 596  0156 96            	ldw	x,sp
 597  0157 1c000f        	addw	x,#OFST+3
 598  015a cd0000        	call	c_ltor
 600  015d a604          	ld	a,#4
 601  015f cd0000        	call	c_llsh
 603  0162 96            	ldw	x,sp
 604  0163 5c            	incw	x
 605  0164 cd0000        	call	c_rtol
 608  0167 cd0000        	call	_CLK_GetClockFreq
 610  016a a664          	ld	a,#100
 611  016c cd0000        	call	c_smul
 613  016f 96            	ldw	x,sp
 614  0170 5c            	incw	x
 615  0171 cd0000        	call	c_ludv
 617  0174 96            	ldw	x,sp
 618  0175 1c0005        	addw	x,#OFST-7
 619  0178 cd0000        	call	c_rtol
 622                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 624  017b 96            	ldw	x,sp
 625  017c 1c0009        	addw	x,#OFST-3
 626  017f cd0000        	call	c_ltor
 628  0182 a664          	ld	a,#100
 629  0184 cd0000        	call	c_smul
 631  0187 96            	ldw	x,sp
 632  0188 5c            	incw	x
 633  0189 cd0000        	call	c_rtol
 636  018c 96            	ldw	x,sp
 637  018d 1c0005        	addw	x,#OFST-7
 638  0190 cd0000        	call	c_ltor
 640  0193 96            	ldw	x,sp
 641  0194 5c            	incw	x
 642  0195 cd0000        	call	c_lsub
 644  0198 a604          	ld	a,#4
 645  019a cd0000        	call	c_llsh
 647  019d ae0004        	ldw	x,#L27
 648  01a0 cd0000        	call	c_ludv
 650  01a3 b603          	ld	a,c_lreg+3
 651  01a5 a40f          	and	a,#15
 652  01a7 ca5233        	or	a,21043
 653  01aa c75233        	ld	21043,a
 654                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 656  01ad 1e0b          	ldw	x,(OFST-1,sp)
 657  01af 54            	srlw	x
 658  01b0 54            	srlw	x
 659  01b1 54            	srlw	x
 660  01b2 54            	srlw	x
 661  01b3 01            	rrwa	x,a
 662  01b4 a4f0          	and	a,#240
 663  01b6 ca5233        	or	a,21043
 664  01b9 c75233        	ld	21043,a
 665                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 667  01bc c65232        	ld	a,21042
 668  01bf 1a0c          	or	a,(OFST+0,sp)
 669  01c1 c75232        	ld	21042,a
 670                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 672  01c4 c65235        	ld	a,21045
 673  01c7 a4f3          	and	a,#243
 674  01c9 c75235        	ld	21045,a
 675                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 677  01cc c65236        	ld	a,21046
 678  01cf a4f8          	and	a,#248
 679  01d1 c75236        	ld	21046,a
 680                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 680                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 682  01d4 7b16          	ld	a,(OFST+10,sp)
 683  01d6 a407          	and	a,#7
 684  01d8 ca5236        	or	a,21046
 685  01db c75236        	ld	21046,a
 686                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 688  01de 7b17          	ld	a,(OFST+11,sp)
 689  01e0 a504          	bcp	a,#4
 690  01e2 2706          	jreq	L761
 691                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 693  01e4 72165235      	bset	21045,#3
 695  01e8 2004          	jra	L171
 696  01ea               L761:
 697                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 699  01ea 72175235      	bres	21045,#3
 700  01ee               L171:
 701                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 703  01ee a508          	bcp	a,#8
 704  01f0 2706          	jreq	L371
 705                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 707  01f2 72145235      	bset	21045,#2
 709  01f6 2004          	jra	L571
 710  01f8               L371:
 711                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 713  01f8 72155235      	bres	21045,#2
 714  01fc               L571:
 715                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 717  01fc 7b16          	ld	a,(OFST+10,sp)
 718  01fe 2a06          	jrpl	L771
 719                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 721  0200 72175236      	bres	21046,#3
 723  0204 2008          	jra	L102
 724  0206               L771:
 725                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 727  0206 a408          	and	a,#8
 728  0208 ca5236        	or	a,21046
 729  020b c75236        	ld	21046,a
 730  020e               L102:
 731                     ; 176 }
 734  020e 5b0c          	addw	sp,#12
 735  0210 81            	ret	
 790                     ; 184 void UART1_Cmd(FunctionalState NewState)
 790                     ; 185 {
 791                     	switch	.text
 792  0211               _UART1_Cmd:
 796                     ; 186   if (NewState != DISABLE)
 798  0211 4d            	tnz	a
 799  0212 2705          	jreq	L132
 800                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 802  0214 721b5234      	bres	21044,#5
 805  0218 81            	ret	
 806  0219               L132:
 807                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 809  0219 721a5234      	bset	21044,#5
 810                     ; 196 }
 813  021d 81            	ret	
 935                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 935                     ; 212 {
 936                     	switch	.text
 937  021e               _UART1_ITConfig:
 939  021e 89            	pushw	x
 940  021f 89            	pushw	x
 941       00000002      OFST:	set	2
 944                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 948                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 950  0220 a30100        	cpw	x,#256
 951  0223 2727          	jreq	L401
 952  0225 a30277        	cpw	x,#631
 953  0228 2722          	jreq	L401
 954  022a a30266        	cpw	x,#614
 955  022d 271d          	jreq	L401
 956  022f a30205        	cpw	x,#517
 957  0232 2718          	jreq	L401
 958  0234 a30244        	cpw	x,#580
 959  0237 2713          	jreq	L401
 960  0239 a30346        	cpw	x,#838
 961  023c 270e          	jreq	L401
 962  023e ae00d8        	ldw	x,#216
 963  0241 89            	pushw	x
 964  0242 5f            	clrw	x
 965  0243 89            	pushw	x
 966  0244 ae0008        	ldw	x,#L561
 967  0247 cd0000        	call	_assert_failed
 969  024a 5b04          	addw	sp,#4
 970  024c               L401:
 971                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 973  024c 7b07          	ld	a,(OFST+5,sp)
 974  024e 2711          	jreq	L411
 975  0250 4a            	dec	a
 976  0251 270e          	jreq	L411
 977  0253 ae00d9        	ldw	x,#217
 978  0256 89            	pushw	x
 979  0257 5f            	clrw	x
 980  0258 89            	pushw	x
 981  0259 ae0008        	ldw	x,#L561
 982  025c cd0000        	call	_assert_failed
 984  025f 5b04          	addw	sp,#4
 985  0261               L411:
 986                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 988  0261 7b03          	ld	a,(OFST+1,sp)
 989  0263 6b01          	ld	(OFST-1,sp),a
 991                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 993  0265 7b04          	ld	a,(OFST+2,sp)
 994  0267 a40f          	and	a,#15
 995  0269 5f            	clrw	x
 996  026a 97            	ld	xl,a
 997  026b a601          	ld	a,#1
 998  026d 5d            	tnzw	x
 999  026e 2704          	jreq	L021
1000  0270               L221:
1001  0270 48            	sll	a
1002  0271 5a            	decw	x
1003  0272 26fc          	jrne	L221
1004  0274               L021:
1005  0274 6b02          	ld	(OFST+0,sp),a
1007                     ; 224   if (NewState != DISABLE)
1009  0276 7b07          	ld	a,(OFST+5,sp)
1010  0278 271f          	jreq	L703
1011                     ; 227     if (uartreg == 0x01)
1013  027a 7b01          	ld	a,(OFST-1,sp)
1014  027c a101          	cp	a,#1
1015  027e 2607          	jrne	L113
1016                     ; 229       UART1->CR1 |= itpos;
1018  0280 c65234        	ld	a,21044
1019  0283 1a02          	or	a,(OFST+0,sp)
1021  0285 201e          	jp	LC002
1022  0287               L113:
1023                     ; 231     else if (uartreg == 0x02)
1025  0287 a102          	cp	a,#2
1026  0289 2607          	jrne	L513
1027                     ; 233       UART1->CR2 |= itpos;
1029  028b c65235        	ld	a,21045
1030  028e 1a02          	or	a,(OFST+0,sp)
1032  0290 2022          	jp	LC003
1033  0292               L513:
1034                     ; 237       UART1->CR4 |= itpos;
1036  0292 c65237        	ld	a,21047
1037  0295 1a02          	or	a,(OFST+0,sp)
1038  0297 2026          	jp	LC001
1039  0299               L703:
1040                     ; 243     if (uartreg == 0x01)
1042  0299 7b01          	ld	a,(OFST-1,sp)
1043  029b a101          	cp	a,#1
1044  029d 260b          	jrne	L323
1045                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
1047  029f 7b02          	ld	a,(OFST+0,sp)
1048  02a1 43            	cpl	a
1049  02a2 c45234        	and	a,21044
1050  02a5               LC002:
1051  02a5 c75234        	ld	21044,a
1053  02a8 2018          	jra	L123
1054  02aa               L323:
1055                     ; 247     else if (uartreg == 0x02)
1057  02aa a102          	cp	a,#2
1058  02ac 260b          	jrne	L723
1059                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
1061  02ae 7b02          	ld	a,(OFST+0,sp)
1062  02b0 43            	cpl	a
1063  02b1 c45235        	and	a,21045
1064  02b4               LC003:
1065  02b4 c75235        	ld	21045,a
1067  02b7 2009          	jra	L123
1068  02b9               L723:
1069                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
1071  02b9 7b02          	ld	a,(OFST+0,sp)
1072  02bb 43            	cpl	a
1073  02bc c45237        	and	a,21047
1074  02bf               LC001:
1075  02bf c75237        	ld	21047,a
1076  02c2               L123:
1077                     ; 257 }
1080  02c2 5b04          	addw	sp,#4
1081  02c4 81            	ret	
1118                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
1118                     ; 266 {
1119                     	switch	.text
1120  02c5               _UART1_HalfDuplexCmd:
1122  02c5 88            	push	a
1123       00000000      OFST:	set	0
1126                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1128  02c6 4d            	tnz	a
1129  02c7 2711          	jreq	L231
1130  02c9 4a            	dec	a
1131  02ca 270e          	jreq	L231
1132  02cc ae010b        	ldw	x,#267
1133  02cf 89            	pushw	x
1134  02d0 5f            	clrw	x
1135  02d1 89            	pushw	x
1136  02d2 ae0008        	ldw	x,#L561
1137  02d5 cd0000        	call	_assert_failed
1139  02d8 5b04          	addw	sp,#4
1140  02da               L231:
1141                     ; 269   if (NewState != DISABLE)
1143  02da 7b01          	ld	a,(OFST+1,sp)
1144  02dc 2706          	jreq	L153
1145                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1147  02de 72165238      	bset	21048,#3
1149  02e2 2004          	jra	L353
1150  02e4               L153:
1151                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1153  02e4 72175238      	bres	21048,#3
1154  02e8               L353:
1155                     ; 277 }
1158  02e8 84            	pop	a
1159  02e9 81            	ret	
1217                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1217                     ; 286 {
1218                     	switch	.text
1219  02ea               _UART1_IrDAConfig:
1221  02ea 88            	push	a
1222       00000000      OFST:	set	0
1225                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1227  02eb a101          	cp	a,#1
1228  02ed 2711          	jreq	L441
1229  02ef 4d            	tnz	a
1230  02f0 270e          	jreq	L441
1231  02f2 ae011f        	ldw	x,#287
1232  02f5 89            	pushw	x
1233  02f6 5f            	clrw	x
1234  02f7 89            	pushw	x
1235  02f8 ae0008        	ldw	x,#L561
1236  02fb cd0000        	call	_assert_failed
1238  02fe 5b04          	addw	sp,#4
1239  0300               L441:
1240                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1242  0300 7b01          	ld	a,(OFST+1,sp)
1243  0302 2706          	jreq	L304
1244                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1246  0304 72145238      	bset	21048,#2
1248  0308 2004          	jra	L504
1249  030a               L304:
1250                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1252  030a 72155238      	bres	21048,#2
1253  030e               L504:
1254                     ; 297 }
1257  030e 84            	pop	a
1258  030f 81            	ret	
1294                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1294                     ; 306 {
1295                     	switch	.text
1296  0310               _UART1_IrDACmd:
1298  0310 88            	push	a
1299       00000000      OFST:	set	0
1302                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1304  0311 4d            	tnz	a
1305  0312 2711          	jreq	L651
1306  0314 4a            	dec	a
1307  0315 270e          	jreq	L651
1308  0317 ae0134        	ldw	x,#308
1309  031a 89            	pushw	x
1310  031b 5f            	clrw	x
1311  031c 89            	pushw	x
1312  031d ae0008        	ldw	x,#L561
1313  0320 cd0000        	call	_assert_failed
1315  0323 5b04          	addw	sp,#4
1316  0325               L651:
1317                     ; 310   if (NewState != DISABLE)
1319  0325 7b01          	ld	a,(OFST+1,sp)
1320  0327 2706          	jreq	L524
1321                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1323  0329 72125238      	bset	21048,#1
1325  032d 2004          	jra	L724
1326  032f               L524:
1327                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1329  032f 72135238      	bres	21048,#1
1330  0333               L724:
1331                     ; 320 }
1334  0333 84            	pop	a
1335  0334 81            	ret	
1395                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1395                     ; 330 {
1396                     	switch	.text
1397  0335               _UART1_LINBreakDetectionConfig:
1399  0335 88            	push	a
1400       00000000      OFST:	set	0
1403                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1405  0336 4d            	tnz	a
1406  0337 2711          	jreq	L071
1407  0339 4a            	dec	a
1408  033a 270e          	jreq	L071
1409  033c ae014b        	ldw	x,#331
1410  033f 89            	pushw	x
1411  0340 5f            	clrw	x
1412  0341 89            	pushw	x
1413  0342 ae0008        	ldw	x,#L561
1414  0345 cd0000        	call	_assert_failed
1416  0348 5b04          	addw	sp,#4
1417  034a               L071:
1418                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1420  034a 7b01          	ld	a,(OFST+1,sp)
1421  034c 2706          	jreq	L754
1422                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1424  034e 721a5237      	bset	21047,#5
1426  0352 2004          	jra	L164
1427  0354               L754:
1428                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1430  0354 721b5237      	bres	21047,#5
1431  0358               L164:
1432                     ; 341 }
1435  0358 84            	pop	a
1436  0359 81            	ret	
1472                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1472                     ; 350 {
1473                     	switch	.text
1474  035a               _UART1_LINCmd:
1476  035a 88            	push	a
1477       00000000      OFST:	set	0
1480                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1482  035b 4d            	tnz	a
1483  035c 2711          	jreq	L202
1484  035e 4a            	dec	a
1485  035f 270e          	jreq	L202
1486  0361 ae015f        	ldw	x,#351
1487  0364 89            	pushw	x
1488  0365 5f            	clrw	x
1489  0366 89            	pushw	x
1490  0367 ae0008        	ldw	x,#L561
1491  036a cd0000        	call	_assert_failed
1493  036d 5b04          	addw	sp,#4
1494  036f               L202:
1495                     ; 353   if (NewState != DISABLE)
1497  036f 7b01          	ld	a,(OFST+1,sp)
1498  0371 2706          	jreq	L105
1499                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1501  0373 721c5236      	bset	21046,#6
1503  0377 2004          	jra	L305
1504  0379               L105:
1505                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1507  0379 721d5236      	bres	21046,#6
1508  037d               L305:
1509                     ; 363 }
1512  037d 84            	pop	a
1513  037e 81            	ret	
1549                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1549                     ; 372 {
1550                     	switch	.text
1551  037f               _UART1_SmartCardCmd:
1553  037f 88            	push	a
1554       00000000      OFST:	set	0
1557                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1559  0380 4d            	tnz	a
1560  0381 2711          	jreq	L412
1561  0383 4a            	dec	a
1562  0384 270e          	jreq	L412
1563  0386 ae0175        	ldw	x,#373
1564  0389 89            	pushw	x
1565  038a 5f            	clrw	x
1566  038b 89            	pushw	x
1567  038c ae0008        	ldw	x,#L561
1568  038f cd0000        	call	_assert_failed
1570  0392 5b04          	addw	sp,#4
1571  0394               L412:
1572                     ; 375   if (NewState != DISABLE)
1574  0394 7b01          	ld	a,(OFST+1,sp)
1575  0396 2706          	jreq	L325
1576                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1578  0398 721a5238      	bset	21048,#5
1580  039c 2004          	jra	L525
1581  039e               L325:
1582                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1584  039e 721b5238      	bres	21048,#5
1585  03a2               L525:
1586                     ; 385 }
1589  03a2 84            	pop	a
1590  03a3 81            	ret	
1627                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1627                     ; 395 {
1628                     	switch	.text
1629  03a4               _UART1_SmartCardNACKCmd:
1631  03a4 88            	push	a
1632       00000000      OFST:	set	0
1635                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1637  03a5 4d            	tnz	a
1638  03a6 2711          	jreq	L622
1639  03a8 4a            	dec	a
1640  03a9 270e          	jreq	L622
1641  03ab ae018c        	ldw	x,#396
1642  03ae 89            	pushw	x
1643  03af 5f            	clrw	x
1644  03b0 89            	pushw	x
1645  03b1 ae0008        	ldw	x,#L561
1646  03b4 cd0000        	call	_assert_failed
1648  03b7 5b04          	addw	sp,#4
1649  03b9               L622:
1650                     ; 398   if (NewState != DISABLE)
1652  03b9 7b01          	ld	a,(OFST+1,sp)
1653  03bb 2706          	jreq	L545
1654                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1656  03bd 72185238      	bset	21048,#4
1658  03c1 2004          	jra	L745
1659  03c3               L545:
1660                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1662  03c3 72195238      	bres	21048,#4
1663  03c7               L745:
1664                     ; 408 }
1667  03c7 84            	pop	a
1668  03c8 81            	ret	
1726                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1726                     ; 417 {
1727                     	switch	.text
1728  03c9               _UART1_WakeUpConfig:
1730  03c9 88            	push	a
1731       00000000      OFST:	set	0
1734                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1736  03ca 4d            	tnz	a
1737  03cb 2712          	jreq	L042
1738  03cd a108          	cp	a,#8
1739  03cf 270e          	jreq	L042
1740  03d1 ae01a2        	ldw	x,#418
1741  03d4 89            	pushw	x
1742  03d5 5f            	clrw	x
1743  03d6 89            	pushw	x
1744  03d7 ae0008        	ldw	x,#L561
1745  03da cd0000        	call	_assert_failed
1747  03dd 5b04          	addw	sp,#4
1748  03df               L042:
1749                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1751  03df 72175234      	bres	21044,#3
1752                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1754  03e3 c65234        	ld	a,21044
1755  03e6 1a01          	or	a,(OFST+1,sp)
1756  03e8 c75234        	ld	21044,a
1757                     ; 422 }
1760  03eb 84            	pop	a
1761  03ec 81            	ret	
1798                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1798                     ; 431 {
1799                     	switch	.text
1800  03ed               _UART1_ReceiverWakeUpCmd:
1802  03ed 88            	push	a
1803       00000000      OFST:	set	0
1806                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1808  03ee 4d            	tnz	a
1809  03ef 2711          	jreq	L252
1810  03f1 4a            	dec	a
1811  03f2 270e          	jreq	L252
1812  03f4 ae01b0        	ldw	x,#432
1813  03f7 89            	pushw	x
1814  03f8 5f            	clrw	x
1815  03f9 89            	pushw	x
1816  03fa ae0008        	ldw	x,#L561
1817  03fd cd0000        	call	_assert_failed
1819  0400 5b04          	addw	sp,#4
1820  0402               L252:
1821                     ; 434   if (NewState != DISABLE)
1823  0402 7b01          	ld	a,(OFST+1,sp)
1824  0404 2706          	jreq	L516
1825                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1827  0406 72125235      	bset	21045,#1
1829  040a 2004          	jra	L716
1830  040c               L516:
1831                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1833  040c 72135235      	bres	21045,#1
1834  0410               L716:
1835                     ; 444 }
1838  0410 84            	pop	a
1839  0411 81            	ret	
1862                     ; 451 uint8_t UART1_ReceiveData8(void)
1862                     ; 452 {
1863                     	switch	.text
1864  0412               _UART1_ReceiveData8:
1868                     ; 453   return ((uint8_t)UART1->DR);
1870  0412 c65231        	ld	a,21041
1873  0415 81            	ret	
1905                     ; 461 uint16_t UART1_ReceiveData9(void)
1905                     ; 462 {
1906                     	switch	.text
1907  0416               _UART1_ReceiveData9:
1909  0416 89            	pushw	x
1910       00000002      OFST:	set	2
1913                     ; 463   uint16_t temp = 0;
1915                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1917  0417 c65234        	ld	a,21044
1918  041a a480          	and	a,#128
1919  041c 5f            	clrw	x
1920  041d 02            	rlwa	x,a
1921  041e 58            	sllw	x
1922  041f 1f01          	ldw	(OFST-1,sp),x
1924                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1926  0421 c65231        	ld	a,21041
1927  0424 5f            	clrw	x
1928  0425 97            	ld	xl,a
1929  0426 01            	rrwa	x,a
1930  0427 1a02          	or	a,(OFST+0,sp)
1931  0429 01            	rrwa	x,a
1932  042a 1a01          	or	a,(OFST-1,sp)
1933  042c a401          	and	a,#1
1934  042e 01            	rrwa	x,a
1937  042f 5b02          	addw	sp,#2
1938  0431 81            	ret	
1970                     ; 474 void UART1_SendData8(uint8_t Data)
1970                     ; 475 {
1971                     	switch	.text
1972  0432               _UART1_SendData8:
1976                     ; 477   UART1->DR = Data;
1978  0432 c75231        	ld	21041,a
1979                     ; 478 }
1982  0435 81            	ret	
2014                     ; 486 void UART1_SendData9(uint16_t Data)
2014                     ; 487 {
2015                     	switch	.text
2016  0436               _UART1_SendData9:
2018  0436 89            	pushw	x
2019       00000000      OFST:	set	0
2022                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
2024  0437 721d5234      	bres	21044,#6
2025                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
2027  043b 54            	srlw	x
2028  043c 54            	srlw	x
2029  043d 9f            	ld	a,xl
2030  043e a440          	and	a,#64
2031  0440 ca5234        	or	a,21044
2032  0443 c75234        	ld	21044,a
2033                     ; 493   UART1->DR   = (uint8_t)(Data);
2035  0446 7b02          	ld	a,(OFST+2,sp)
2036  0448 c75231        	ld	21041,a
2037                     ; 494 }
2040  044b 85            	popw	x
2041  044c 81            	ret	
2064                     ; 501 void UART1_SendBreak(void)
2064                     ; 502 {
2065                     	switch	.text
2066  044d               _UART1_SendBreak:
2070                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
2072  044d 72105235      	bset	21045,#0
2073                     ; 504 }
2076  0451 81            	ret	
2109                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
2109                     ; 512 {
2110                     	switch	.text
2111  0452               _UART1_SetAddress:
2113  0452 88            	push	a
2114       00000000      OFST:	set	0
2117                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
2119  0453 a110          	cp	a,#16
2120  0455 250e          	jrult	L472
2121  0457 ae0202        	ldw	x,#514
2122  045a 89            	pushw	x
2123  045b 5f            	clrw	x
2124  045c 89            	pushw	x
2125  045d ae0008        	ldw	x,#L561
2126  0460 cd0000        	call	_assert_failed
2128  0463 5b04          	addw	sp,#4
2129  0465               L472:
2130                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
2132  0465 c65237        	ld	a,21047
2133  0468 a4f0          	and	a,#240
2134  046a c75237        	ld	21047,a
2135                     ; 519   UART1->CR4 |= UART1_Address;
2137  046d c65237        	ld	a,21047
2138  0470 1a01          	or	a,(OFST+1,sp)
2139  0472 c75237        	ld	21047,a
2140                     ; 520 }
2143  0475 84            	pop	a
2144  0476 81            	ret	
2176                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
2176                     ; 529 {
2177                     	switch	.text
2178  0477               _UART1_SetGuardTime:
2182                     ; 531   UART1->GTR = UART1_GuardTime;
2184  0477 c75239        	ld	21049,a
2185                     ; 532 }
2188  047a 81            	ret	
2220                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
2220                     ; 557 {
2221                     	switch	.text
2222  047b               _UART1_SetPrescaler:
2226                     ; 559   UART1->PSCR = UART1_Prescaler;
2228  047b c7523a        	ld	21050,a
2229                     ; 560 }
2232  047e 81            	ret	
2376                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2376                     ; 569 {
2377                     	switch	.text
2378  047f               _UART1_GetFlagStatus:
2380  047f 89            	pushw	x
2381  0480 88            	push	a
2382       00000001      OFST:	set	1
2385                     ; 570   FlagStatus status = RESET;
2387                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2389  0481 a30080        	cpw	x,#128
2390  0484 273b          	jreq	L213
2391  0486 a30040        	cpw	x,#64
2392  0489 2736          	jreq	L213
2393  048b a30020        	cpw	x,#32
2394  048e 2731          	jreq	L213
2395  0490 a30010        	cpw	x,#16
2396  0493 272c          	jreq	L213
2397  0495 a30008        	cpw	x,#8
2398  0498 2727          	jreq	L213
2399  049a a30004        	cpw	x,#4
2400  049d 2722          	jreq	L213
2401  049f a30002        	cpw	x,#2
2402  04a2 271d          	jreq	L213
2403  04a4 a30001        	cpw	x,#1
2404  04a7 2718          	jreq	L213
2405  04a9 a30101        	cpw	x,#257
2406  04ac 2713          	jreq	L213
2407  04ae a30210        	cpw	x,#528
2408  04b1 270e          	jreq	L213
2409  04b3 ae023d        	ldw	x,#573
2410  04b6 89            	pushw	x
2411  04b7 5f            	clrw	x
2412  04b8 89            	pushw	x
2413  04b9 ae0008        	ldw	x,#L561
2414  04bc cd0000        	call	_assert_failed
2416  04bf 5b04          	addw	sp,#4
2417  04c1               L213:
2418                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2420  04c1 1e02          	ldw	x,(OFST+1,sp)
2421  04c3 a30210        	cpw	x,#528
2422  04c6 2605          	jrne	L3301
2423                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2425  04c8 c65237        	ld	a,21047
2426                     ; 582       status = SET;
2428  04cb 2008          	jp	LC006
2429                     ; 587       status = RESET;
2430  04cd               L3301:
2431                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2433  04cd a30101        	cpw	x,#257
2434  04d0 260b          	jrne	L3401
2435                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2437  04d2 c65235        	ld	a,21045
2438  04d5               LC006:
2439  04d5 1503          	bcp	a,(OFST+2,sp)
2440  04d7 270b          	jreq	L3501
2441                     ; 595       status = SET;
2443  04d9               LC005:
2446  04d9 a601          	ld	a,#1
2449  04db 2008          	jra	L1401
2450                     ; 600       status = RESET;
2451  04dd               L3401:
2452                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2454  04dd c65230        	ld	a,21040
2455  04e0 1503          	bcp	a,(OFST+2,sp)
2456                     ; 608       status = SET;
2458  04e2 26f5          	jrne	LC005
2459  04e4               L3501:
2460                     ; 613       status = RESET;
2464  04e4 4f            	clr	a
2466  04e5               L1401:
2467                     ; 617   return status;
2471  04e5 5b03          	addw	sp,#3
2472  04e7 81            	ret	
2508                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2508                     ; 647 {
2509                     	switch	.text
2510  04e8               _UART1_ClearFlag:
2512  04e8 89            	pushw	x
2513       00000000      OFST:	set	0
2516                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2518  04e9 a30020        	cpw	x,#32
2519  04ec 2713          	jreq	L423
2520  04ee a30210        	cpw	x,#528
2521  04f1 270e          	jreq	L423
2522  04f3 ae0288        	ldw	x,#648
2523  04f6 89            	pushw	x
2524  04f7 5f            	clrw	x
2525  04f8 89            	pushw	x
2526  04f9 ae0008        	ldw	x,#L561
2527  04fc cd0000        	call	_assert_failed
2529  04ff 5b04          	addw	sp,#4
2530  0501               L423:
2531                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2533  0501 1e01          	ldw	x,(OFST+1,sp)
2534  0503 a30020        	cpw	x,#32
2535  0506 2606          	jrne	L5701
2536                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2538  0508 35df5230      	mov	21040,#223
2540  050c 2004          	jra	L7701
2541  050e               L5701:
2542                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2544  050e 72195237      	bres	21047,#4
2545  0512               L7701:
2546                     ; 660 }
2549  0512 85            	popw	x
2550  0513 81            	ret	
2625                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2625                     ; 676 {
2626                     	switch	.text
2627  0514               _UART1_GetITStatus:
2629  0514 89            	pushw	x
2630  0515 89            	pushw	x
2631       00000002      OFST:	set	2
2634                     ; 677   ITStatus pendingbitstatus = RESET;
2636                     ; 678   uint8_t itpos = 0;
2638                     ; 679   uint8_t itmask1 = 0;
2640                     ; 680   uint8_t itmask2 = 0;
2642                     ; 681   uint8_t enablestatus = 0;
2644                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2646  0516 a30277        	cpw	x,#631
2647  0519 272c          	jreq	L633
2648  051b a30266        	cpw	x,#614
2649  051e 2727          	jreq	L633
2650  0520 a30255        	cpw	x,#597
2651  0523 2722          	jreq	L633
2652  0525 a30244        	cpw	x,#580
2653  0528 271d          	jreq	L633
2654  052a a30235        	cpw	x,#565
2655  052d 2718          	jreq	L633
2656  052f a30346        	cpw	x,#838
2657  0532 2713          	jreq	L633
2658  0534 a30100        	cpw	x,#256
2659  0537 270e          	jreq	L633
2660  0539 ae02ac        	ldw	x,#684
2661  053c 89            	pushw	x
2662  053d 5f            	clrw	x
2663  053e 89            	pushw	x
2664  053f ae0008        	ldw	x,#L561
2665  0542 cd0000        	call	_assert_failed
2667  0545 5b04          	addw	sp,#4
2668  0547               L633:
2669                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2671  0547 7b04          	ld	a,(OFST+2,sp)
2672  0549 a40f          	and	a,#15
2673  054b 5f            	clrw	x
2674  054c 97            	ld	xl,a
2675  054d a601          	ld	a,#1
2676  054f 5d            	tnzw	x
2677  0550 2704          	jreq	L243
2678  0552               L443:
2679  0552 48            	sll	a
2680  0553 5a            	decw	x
2681  0554 26fc          	jrne	L443
2682  0556               L243:
2683  0556 6b01          	ld	(OFST-1,sp),a
2685                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2687  0558 7b04          	ld	a,(OFST+2,sp)
2688  055a 4e            	swap	a
2689  055b a40f          	and	a,#15
2690  055d 6b02          	ld	(OFST+0,sp),a
2692                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2694  055f 5f            	clrw	x
2695  0560 97            	ld	xl,a
2696  0561 a601          	ld	a,#1
2697  0563 5d            	tnzw	x
2698  0564 2704          	jreq	L643
2699  0566               L053:
2700  0566 48            	sll	a
2701  0567 5a            	decw	x
2702  0568 26fc          	jrne	L053
2703  056a               L643:
2704  056a 6b02          	ld	(OFST+0,sp),a
2706                     ; 695   if (UART1_IT == UART1_IT_PE)
2708  056c 1e03          	ldw	x,(OFST+1,sp)
2709  056e a30100        	cpw	x,#256
2710  0571 260c          	jrne	L3311
2711                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2713  0573 c65234        	ld	a,21044
2714  0576 1402          	and	a,(OFST+0,sp)
2715  0578 6b02          	ld	(OFST+0,sp),a
2717                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2719  057a c65230        	ld	a,21040
2721                     ; 704       pendingbitstatus = SET;
2723  057d 200f          	jp	LC009
2724                     ; 709       pendingbitstatus = RESET;
2725  057f               L3311:
2726                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2728  057f a30346        	cpw	x,#838
2729  0582 2616          	jrne	L3411
2730                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2732  0584 c65237        	ld	a,21047
2733  0587 1402          	and	a,(OFST+0,sp)
2734  0589 6b02          	ld	(OFST+0,sp),a
2736                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2738  058b c65237        	ld	a,21047
2740  058e               LC009:
2741  058e 1501          	bcp	a,(OFST-1,sp)
2742  0590 271a          	jreq	L3511
2743  0592 7b02          	ld	a,(OFST+0,sp)
2744  0594 2716          	jreq	L3511
2745                     ; 721       pendingbitstatus = SET;
2747  0596               LC008:
2750  0596 a601          	ld	a,#1
2753  0598 2013          	jra	L1411
2754                     ; 726       pendingbitstatus = RESET;
2755  059a               L3411:
2756                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2758  059a c65235        	ld	a,21045
2759  059d 1402          	and	a,(OFST+0,sp)
2760  059f 6b02          	ld	(OFST+0,sp),a
2762                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2764  05a1 c65230        	ld	a,21040
2765  05a4 1501          	bcp	a,(OFST-1,sp)
2766  05a6 2704          	jreq	L3511
2768  05a8 7b02          	ld	a,(OFST+0,sp)
2769                     ; 737       pendingbitstatus = SET;
2771  05aa 26ea          	jrne	LC008
2772  05ac               L3511:
2773                     ; 742       pendingbitstatus = RESET;
2777  05ac 4f            	clr	a
2779  05ad               L1411:
2780                     ; 747   return  pendingbitstatus;
2784  05ad 5b04          	addw	sp,#4
2785  05af 81            	ret	
2822                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2822                     ; 776 {
2823                     	switch	.text
2824  05b0               _UART1_ClearITPendingBit:
2826  05b0 89            	pushw	x
2827       00000000      OFST:	set	0
2830                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2832  05b1 a30255        	cpw	x,#597
2833  05b4 2713          	jreq	L063
2834  05b6 a30346        	cpw	x,#838
2835  05b9 270e          	jreq	L063
2836  05bb ae0309        	ldw	x,#777
2837  05be 89            	pushw	x
2838  05bf 5f            	clrw	x
2839  05c0 89            	pushw	x
2840  05c1 ae0008        	ldw	x,#L561
2841  05c4 cd0000        	call	_assert_failed
2843  05c7 5b04          	addw	sp,#4
2844  05c9               L063:
2845                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2847  05c9 1e01          	ldw	x,(OFST+1,sp)
2848  05cb a30255        	cpw	x,#597
2849  05ce 2606          	jrne	L5711
2850                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2852  05d0 35df5230      	mov	21040,#223
2854  05d4 2004          	jra	L7711
2855  05d6               L5711:
2856                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2858  05d6 72195237      	bres	21047,#4
2859  05da               L7711:
2860                     ; 789 }
2863  05da 85            	popw	x
2864  05db 81            	ret	
2877                     	xdef	_UART1_ClearITPendingBit
2878                     	xdef	_UART1_GetITStatus
2879                     	xdef	_UART1_ClearFlag
2880                     	xdef	_UART1_GetFlagStatus
2881                     	xdef	_UART1_SetPrescaler
2882                     	xdef	_UART1_SetGuardTime
2883                     	xdef	_UART1_SetAddress
2884                     	xdef	_UART1_SendBreak
2885                     	xdef	_UART1_SendData9
2886                     	xdef	_UART1_SendData8
2887                     	xdef	_UART1_ReceiveData9
2888                     	xdef	_UART1_ReceiveData8
2889                     	xdef	_UART1_ReceiverWakeUpCmd
2890                     	xdef	_UART1_WakeUpConfig
2891                     	xdef	_UART1_SmartCardNACKCmd
2892                     	xdef	_UART1_SmartCardCmd
2893                     	xdef	_UART1_LINCmd
2894                     	xdef	_UART1_LINBreakDetectionConfig
2895                     	xdef	_UART1_IrDACmd
2896                     	xdef	_UART1_IrDAConfig
2897                     	xdef	_UART1_HalfDuplexCmd
2898                     	xdef	_UART1_ITConfig
2899                     	xdef	_UART1_Cmd
2900                     	xdef	_UART1_Init
2901                     	xdef	_UART1_DeInit
2902                     	xref	_assert_failed
2903                     	xref	_CLK_GetClockFreq
2904                     	switch	.const
2905  0008               L561:
2906  0008 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
2907  001a 697665725c73  	dc.b	"iver\src\stm8s_uar"
2908  002c 74312e6300    	dc.b	"t1.c",0
2909                     	xref.b	c_lreg
2910                     	xref.b	c_x
2930                     	xref	c_lsub
2931                     	xref	c_smul
2932                     	xref	c_ludv
2933                     	xref	c_rtol
2934                     	xref	c_llsh
2935                     	xref	c_lcmp
2936                     	xref	c_ltor
2937                     	end
