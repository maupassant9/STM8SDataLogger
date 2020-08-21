   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
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
 656  01ad 96            	ldw	x,sp
 657  01ae 1c0009        	addw	x,#OFST-3
 658  01b1 cd0000        	call	c_ltor
 660  01b4 a604          	ld	a,#4
 661  01b6 cd0000        	call	c_lursh
 663  01b9 b603          	ld	a,c_lreg+3
 664  01bb a4f0          	and	a,#240
 665  01bd b703          	ld	c_lreg+3,a
 666  01bf 3f02          	clr	c_lreg+2
 667  01c1 3f01          	clr	c_lreg+1
 668  01c3 3f00          	clr	c_lreg
 669  01c5 ca5233        	or	a,21043
 670  01c8 c75233        	ld	21043,a
 671                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 673  01cb c65232        	ld	a,21042
 674  01ce 1a0c          	or	a,(OFST+0,sp)
 675  01d0 c75232        	ld	21042,a
 676                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 678  01d3 c65235        	ld	a,21045
 679  01d6 a4f3          	and	a,#243
 680  01d8 c75235        	ld	21045,a
 681                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 683  01db c65236        	ld	a,21046
 684  01de a4f8          	and	a,#248
 685  01e0 c75236        	ld	21046,a
 686                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 686                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 688  01e3 7b16          	ld	a,(OFST+10,sp)
 689  01e5 a407          	and	a,#7
 690  01e7 ca5236        	or	a,21046
 691  01ea c75236        	ld	21046,a
 692                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 694  01ed 7b17          	ld	a,(OFST+11,sp)
 695  01ef a504          	bcp	a,#4
 696  01f1 2706          	jreq	L761
 697                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 699  01f3 72165235      	bset	21045,#3
 701  01f7 2004          	jra	L171
 702  01f9               L761:
 703                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 705  01f9 72175235      	bres	21045,#3
 706  01fd               L171:
 707                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 709  01fd a508          	bcp	a,#8
 710  01ff 2706          	jreq	L371
 711                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 713  0201 72145235      	bset	21045,#2
 715  0205 2004          	jra	L571
 716  0207               L371:
 717                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 719  0207 72155235      	bres	21045,#2
 720  020b               L571:
 721                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 723  020b 7b16          	ld	a,(OFST+10,sp)
 724  020d 2a06          	jrpl	L771
 725                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 727  020f 72175236      	bres	21046,#3
 729  0213 2008          	jra	L102
 730  0215               L771:
 731                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 733  0215 a408          	and	a,#8
 734  0217 ca5236        	or	a,21046
 735  021a c75236        	ld	21046,a
 736  021d               L102:
 737                     ; 176 }
 740  021d 5b0c          	addw	sp,#12
 741  021f 81            	ret	
 796                     ; 184 void UART1_Cmd(FunctionalState NewState)
 796                     ; 185 {
 797                     	switch	.text
 798  0220               _UART1_Cmd:
 802                     ; 186   if (NewState != DISABLE)
 804  0220 4d            	tnz	a
 805  0221 2705          	jreq	L132
 806                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 808  0223 721b5234      	bres	21044,#5
 811  0227 81            	ret	
 812  0228               L132:
 813                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 815  0228 721a5234      	bset	21044,#5
 816                     ; 196 }
 819  022c 81            	ret	
 941                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 941                     ; 212 {
 942                     	switch	.text
 943  022d               _UART1_ITConfig:
 945  022d 89            	pushw	x
 946  022e 89            	pushw	x
 947       00000002      OFST:	set	2
 950                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 954                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 956  022f a30100        	cpw	x,#256
 957  0232 2727          	jreq	L401
 958  0234 a30277        	cpw	x,#631
 959  0237 2722          	jreq	L401
 960  0239 a30266        	cpw	x,#614
 961  023c 271d          	jreq	L401
 962  023e a30205        	cpw	x,#517
 963  0241 2718          	jreq	L401
 964  0243 a30244        	cpw	x,#580
 965  0246 2713          	jreq	L401
 966  0248 a30346        	cpw	x,#838
 967  024b 270e          	jreq	L401
 968  024d ae00d8        	ldw	x,#216
 969  0250 89            	pushw	x
 970  0251 5f            	clrw	x
 971  0252 89            	pushw	x
 972  0253 ae0008        	ldw	x,#L561
 973  0256 cd0000        	call	_assert_failed
 975  0259 5b04          	addw	sp,#4
 976  025b               L401:
 977                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 979  025b 7b07          	ld	a,(OFST+5,sp)
 980  025d 2711          	jreq	L411
 981  025f 4a            	dec	a
 982  0260 270e          	jreq	L411
 983  0262 ae00d9        	ldw	x,#217
 984  0265 89            	pushw	x
 985  0266 5f            	clrw	x
 986  0267 89            	pushw	x
 987  0268 ae0008        	ldw	x,#L561
 988  026b cd0000        	call	_assert_failed
 990  026e 5b04          	addw	sp,#4
 991  0270               L411:
 992                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 994  0270 7b03          	ld	a,(OFST+1,sp)
 995  0272 6b01          	ld	(OFST-1,sp),a
 997                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 999  0274 7b04          	ld	a,(OFST+2,sp)
1000  0276 a40f          	and	a,#15
1001  0278 5f            	clrw	x
1002  0279 97            	ld	xl,a
1003  027a a601          	ld	a,#1
1004  027c 5d            	tnzw	x
1005  027d 2704          	jreq	L021
1006  027f               L221:
1007  027f 48            	sll	a
1008  0280 5a            	decw	x
1009  0281 26fc          	jrne	L221
1010  0283               L021:
1011  0283 6b02          	ld	(OFST+0,sp),a
1013                     ; 224   if (NewState != DISABLE)
1015  0285 7b07          	ld	a,(OFST+5,sp)
1016  0287 271f          	jreq	L703
1017                     ; 227     if (uartreg == 0x01)
1019  0289 7b01          	ld	a,(OFST-1,sp)
1020  028b a101          	cp	a,#1
1021  028d 2607          	jrne	L113
1022                     ; 229       UART1->CR1 |= itpos;
1024  028f c65234        	ld	a,21044
1025  0292 1a02          	or	a,(OFST+0,sp)
1027  0294 201e          	jp	LC002
1028  0296               L113:
1029                     ; 231     else if (uartreg == 0x02)
1031  0296 a102          	cp	a,#2
1032  0298 2607          	jrne	L513
1033                     ; 233       UART1->CR2 |= itpos;
1035  029a c65235        	ld	a,21045
1036  029d 1a02          	or	a,(OFST+0,sp)
1038  029f 2022          	jp	LC003
1039  02a1               L513:
1040                     ; 237       UART1->CR4 |= itpos;
1042  02a1 c65237        	ld	a,21047
1043  02a4 1a02          	or	a,(OFST+0,sp)
1044  02a6 2026          	jp	LC001
1045  02a8               L703:
1046                     ; 243     if (uartreg == 0x01)
1048  02a8 7b01          	ld	a,(OFST-1,sp)
1049  02aa a101          	cp	a,#1
1050  02ac 260b          	jrne	L323
1051                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
1053  02ae 7b02          	ld	a,(OFST+0,sp)
1054  02b0 43            	cpl	a
1055  02b1 c45234        	and	a,21044
1056  02b4               LC002:
1057  02b4 c75234        	ld	21044,a
1059  02b7 2018          	jra	L123
1060  02b9               L323:
1061                     ; 247     else if (uartreg == 0x02)
1063  02b9 a102          	cp	a,#2
1064  02bb 260b          	jrne	L723
1065                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
1067  02bd 7b02          	ld	a,(OFST+0,sp)
1068  02bf 43            	cpl	a
1069  02c0 c45235        	and	a,21045
1070  02c3               LC003:
1071  02c3 c75235        	ld	21045,a
1073  02c6 2009          	jra	L123
1074  02c8               L723:
1075                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
1077  02c8 7b02          	ld	a,(OFST+0,sp)
1078  02ca 43            	cpl	a
1079  02cb c45237        	and	a,21047
1080  02ce               LC001:
1081  02ce c75237        	ld	21047,a
1082  02d1               L123:
1083                     ; 257 }
1086  02d1 5b04          	addw	sp,#4
1087  02d3 81            	ret	
1124                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
1124                     ; 266 {
1125                     	switch	.text
1126  02d4               _UART1_HalfDuplexCmd:
1128  02d4 88            	push	a
1129       00000000      OFST:	set	0
1132                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1134  02d5 4d            	tnz	a
1135  02d6 2711          	jreq	L231
1136  02d8 4a            	dec	a
1137  02d9 270e          	jreq	L231
1138  02db ae010b        	ldw	x,#267
1139  02de 89            	pushw	x
1140  02df 5f            	clrw	x
1141  02e0 89            	pushw	x
1142  02e1 ae0008        	ldw	x,#L561
1143  02e4 cd0000        	call	_assert_failed
1145  02e7 5b04          	addw	sp,#4
1146  02e9               L231:
1147                     ; 269   if (NewState != DISABLE)
1149  02e9 7b01          	ld	a,(OFST+1,sp)
1150  02eb 2706          	jreq	L153
1151                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1153  02ed 72165238      	bset	21048,#3
1155  02f1 2004          	jra	L353
1156  02f3               L153:
1157                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1159  02f3 72175238      	bres	21048,#3
1160  02f7               L353:
1161                     ; 277 }
1164  02f7 84            	pop	a
1165  02f8 81            	ret	
1223                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1223                     ; 286 {
1224                     	switch	.text
1225  02f9               _UART1_IrDAConfig:
1227  02f9 88            	push	a
1228       00000000      OFST:	set	0
1231                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1233  02fa a101          	cp	a,#1
1234  02fc 2711          	jreq	L441
1235  02fe 4d            	tnz	a
1236  02ff 270e          	jreq	L441
1237  0301 ae011f        	ldw	x,#287
1238  0304 89            	pushw	x
1239  0305 5f            	clrw	x
1240  0306 89            	pushw	x
1241  0307 ae0008        	ldw	x,#L561
1242  030a cd0000        	call	_assert_failed
1244  030d 5b04          	addw	sp,#4
1245  030f               L441:
1246                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1248  030f 7b01          	ld	a,(OFST+1,sp)
1249  0311 2706          	jreq	L304
1250                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1252  0313 72145238      	bset	21048,#2
1254  0317 2004          	jra	L504
1255  0319               L304:
1256                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1258  0319 72155238      	bres	21048,#2
1259  031d               L504:
1260                     ; 297 }
1263  031d 84            	pop	a
1264  031e 81            	ret	
1300                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1300                     ; 306 {
1301                     	switch	.text
1302  031f               _UART1_IrDACmd:
1304  031f 88            	push	a
1305       00000000      OFST:	set	0
1308                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1310  0320 4d            	tnz	a
1311  0321 2711          	jreq	L651
1312  0323 4a            	dec	a
1313  0324 270e          	jreq	L651
1314  0326 ae0134        	ldw	x,#308
1315  0329 89            	pushw	x
1316  032a 5f            	clrw	x
1317  032b 89            	pushw	x
1318  032c ae0008        	ldw	x,#L561
1319  032f cd0000        	call	_assert_failed
1321  0332 5b04          	addw	sp,#4
1322  0334               L651:
1323                     ; 310   if (NewState != DISABLE)
1325  0334 7b01          	ld	a,(OFST+1,sp)
1326  0336 2706          	jreq	L524
1327                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1329  0338 72125238      	bset	21048,#1
1331  033c 2004          	jra	L724
1332  033e               L524:
1333                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1335  033e 72135238      	bres	21048,#1
1336  0342               L724:
1337                     ; 320 }
1340  0342 84            	pop	a
1341  0343 81            	ret	
1401                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1401                     ; 330 {
1402                     	switch	.text
1403  0344               _UART1_LINBreakDetectionConfig:
1405  0344 88            	push	a
1406       00000000      OFST:	set	0
1409                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1411  0345 4d            	tnz	a
1412  0346 2711          	jreq	L071
1413  0348 4a            	dec	a
1414  0349 270e          	jreq	L071
1415  034b ae014b        	ldw	x,#331
1416  034e 89            	pushw	x
1417  034f 5f            	clrw	x
1418  0350 89            	pushw	x
1419  0351 ae0008        	ldw	x,#L561
1420  0354 cd0000        	call	_assert_failed
1422  0357 5b04          	addw	sp,#4
1423  0359               L071:
1424                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1426  0359 7b01          	ld	a,(OFST+1,sp)
1427  035b 2706          	jreq	L754
1428                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1430  035d 721a5237      	bset	21047,#5
1432  0361 2004          	jra	L164
1433  0363               L754:
1434                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1436  0363 721b5237      	bres	21047,#5
1437  0367               L164:
1438                     ; 341 }
1441  0367 84            	pop	a
1442  0368 81            	ret	
1478                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1478                     ; 350 {
1479                     	switch	.text
1480  0369               _UART1_LINCmd:
1482  0369 88            	push	a
1483       00000000      OFST:	set	0
1486                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1488  036a 4d            	tnz	a
1489  036b 2711          	jreq	L202
1490  036d 4a            	dec	a
1491  036e 270e          	jreq	L202
1492  0370 ae015f        	ldw	x,#351
1493  0373 89            	pushw	x
1494  0374 5f            	clrw	x
1495  0375 89            	pushw	x
1496  0376 ae0008        	ldw	x,#L561
1497  0379 cd0000        	call	_assert_failed
1499  037c 5b04          	addw	sp,#4
1500  037e               L202:
1501                     ; 353   if (NewState != DISABLE)
1503  037e 7b01          	ld	a,(OFST+1,sp)
1504  0380 2706          	jreq	L105
1505                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1507  0382 721c5236      	bset	21046,#6
1509  0386 2004          	jra	L305
1510  0388               L105:
1511                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1513  0388 721d5236      	bres	21046,#6
1514  038c               L305:
1515                     ; 363 }
1518  038c 84            	pop	a
1519  038d 81            	ret	
1555                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1555                     ; 372 {
1556                     	switch	.text
1557  038e               _UART1_SmartCardCmd:
1559  038e 88            	push	a
1560       00000000      OFST:	set	0
1563                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1565  038f 4d            	tnz	a
1566  0390 2711          	jreq	L412
1567  0392 4a            	dec	a
1568  0393 270e          	jreq	L412
1569  0395 ae0175        	ldw	x,#373
1570  0398 89            	pushw	x
1571  0399 5f            	clrw	x
1572  039a 89            	pushw	x
1573  039b ae0008        	ldw	x,#L561
1574  039e cd0000        	call	_assert_failed
1576  03a1 5b04          	addw	sp,#4
1577  03a3               L412:
1578                     ; 375   if (NewState != DISABLE)
1580  03a3 7b01          	ld	a,(OFST+1,sp)
1581  03a5 2706          	jreq	L325
1582                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1584  03a7 721a5238      	bset	21048,#5
1586  03ab 2004          	jra	L525
1587  03ad               L325:
1588                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1590  03ad 721b5238      	bres	21048,#5
1591  03b1               L525:
1592                     ; 385 }
1595  03b1 84            	pop	a
1596  03b2 81            	ret	
1633                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1633                     ; 395 {
1634                     	switch	.text
1635  03b3               _UART1_SmartCardNACKCmd:
1637  03b3 88            	push	a
1638       00000000      OFST:	set	0
1641                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1643  03b4 4d            	tnz	a
1644  03b5 2711          	jreq	L622
1645  03b7 4a            	dec	a
1646  03b8 270e          	jreq	L622
1647  03ba ae018c        	ldw	x,#396
1648  03bd 89            	pushw	x
1649  03be 5f            	clrw	x
1650  03bf 89            	pushw	x
1651  03c0 ae0008        	ldw	x,#L561
1652  03c3 cd0000        	call	_assert_failed
1654  03c6 5b04          	addw	sp,#4
1655  03c8               L622:
1656                     ; 398   if (NewState != DISABLE)
1658  03c8 7b01          	ld	a,(OFST+1,sp)
1659  03ca 2706          	jreq	L545
1660                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1662  03cc 72185238      	bset	21048,#4
1664  03d0 2004          	jra	L745
1665  03d2               L545:
1666                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1668  03d2 72195238      	bres	21048,#4
1669  03d6               L745:
1670                     ; 408 }
1673  03d6 84            	pop	a
1674  03d7 81            	ret	
1732                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1732                     ; 417 {
1733                     	switch	.text
1734  03d8               _UART1_WakeUpConfig:
1736  03d8 88            	push	a
1737       00000000      OFST:	set	0
1740                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1742  03d9 4d            	tnz	a
1743  03da 2712          	jreq	L042
1744  03dc a108          	cp	a,#8
1745  03de 270e          	jreq	L042
1746  03e0 ae01a2        	ldw	x,#418
1747  03e3 89            	pushw	x
1748  03e4 5f            	clrw	x
1749  03e5 89            	pushw	x
1750  03e6 ae0008        	ldw	x,#L561
1751  03e9 cd0000        	call	_assert_failed
1753  03ec 5b04          	addw	sp,#4
1754  03ee               L042:
1755                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1757  03ee 72175234      	bres	21044,#3
1758                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1760  03f2 c65234        	ld	a,21044
1761  03f5 1a01          	or	a,(OFST+1,sp)
1762  03f7 c75234        	ld	21044,a
1763                     ; 422 }
1766  03fa 84            	pop	a
1767  03fb 81            	ret	
1804                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1804                     ; 431 {
1805                     	switch	.text
1806  03fc               _UART1_ReceiverWakeUpCmd:
1808  03fc 88            	push	a
1809       00000000      OFST:	set	0
1812                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1814  03fd 4d            	tnz	a
1815  03fe 2711          	jreq	L252
1816  0400 4a            	dec	a
1817  0401 270e          	jreq	L252
1818  0403 ae01b0        	ldw	x,#432
1819  0406 89            	pushw	x
1820  0407 5f            	clrw	x
1821  0408 89            	pushw	x
1822  0409 ae0008        	ldw	x,#L561
1823  040c cd0000        	call	_assert_failed
1825  040f 5b04          	addw	sp,#4
1826  0411               L252:
1827                     ; 434   if (NewState != DISABLE)
1829  0411 7b01          	ld	a,(OFST+1,sp)
1830  0413 2706          	jreq	L516
1831                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1833  0415 72125235      	bset	21045,#1
1835  0419 2004          	jra	L716
1836  041b               L516:
1837                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1839  041b 72135235      	bres	21045,#1
1840  041f               L716:
1841                     ; 444 }
1844  041f 84            	pop	a
1845  0420 81            	ret	
1868                     ; 451 uint8_t UART1_ReceiveData8(void)
1868                     ; 452 {
1869                     	switch	.text
1870  0421               _UART1_ReceiveData8:
1874                     ; 453   return ((uint8_t)UART1->DR);
1876  0421 c65231        	ld	a,21041
1879  0424 81            	ret	
1911                     ; 461 uint16_t UART1_ReceiveData9(void)
1911                     ; 462 {
1912                     	switch	.text
1913  0425               _UART1_ReceiveData9:
1915  0425 89            	pushw	x
1916       00000002      OFST:	set	2
1919                     ; 463   uint16_t temp = 0;
1921                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1923  0426 c65234        	ld	a,21044
1924  0429 a480          	and	a,#128
1925  042b 5f            	clrw	x
1926  042c 02            	rlwa	x,a
1927  042d 58            	sllw	x
1928  042e 1f01          	ldw	(OFST-1,sp),x
1930                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1932  0430 c65231        	ld	a,21041
1933  0433 5f            	clrw	x
1934  0434 97            	ld	xl,a
1935  0435 01            	rrwa	x,a
1936  0436 1a02          	or	a,(OFST+0,sp)
1937  0438 01            	rrwa	x,a
1938  0439 1a01          	or	a,(OFST-1,sp)
1939  043b a401          	and	a,#1
1940  043d 01            	rrwa	x,a
1943  043e 5b02          	addw	sp,#2
1944  0440 81            	ret	
1976                     ; 474 void UART1_SendData8(uint8_t Data)
1976                     ; 475 {
1977                     	switch	.text
1978  0441               _UART1_SendData8:
1982                     ; 477   UART1->DR = Data;
1984  0441 c75231        	ld	21041,a
1985                     ; 478 }
1988  0444 81            	ret	
2020                     ; 486 void UART1_SendData9(uint16_t Data)
2020                     ; 487 {
2021                     	switch	.text
2022  0445               _UART1_SendData9:
2024  0445 89            	pushw	x
2025       00000000      OFST:	set	0
2028                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
2030  0446 721d5234      	bres	21044,#6
2031                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
2033  044a 54            	srlw	x
2034  044b 54            	srlw	x
2035  044c 9f            	ld	a,xl
2036  044d a440          	and	a,#64
2037  044f ca5234        	or	a,21044
2038  0452 c75234        	ld	21044,a
2039                     ; 493   UART1->DR   = (uint8_t)(Data);
2041  0455 7b02          	ld	a,(OFST+2,sp)
2042  0457 c75231        	ld	21041,a
2043                     ; 494 }
2046  045a 85            	popw	x
2047  045b 81            	ret	
2070                     ; 501 void UART1_SendBreak(void)
2070                     ; 502 {
2071                     	switch	.text
2072  045c               _UART1_SendBreak:
2076                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
2078  045c 72105235      	bset	21045,#0
2079                     ; 504 }
2082  0460 81            	ret	
2115                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
2115                     ; 512 {
2116                     	switch	.text
2117  0461               _UART1_SetAddress:
2119  0461 88            	push	a
2120       00000000      OFST:	set	0
2123                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
2125  0462 a110          	cp	a,#16
2126  0464 250e          	jrult	L472
2127  0466 ae0202        	ldw	x,#514
2128  0469 89            	pushw	x
2129  046a 5f            	clrw	x
2130  046b 89            	pushw	x
2131  046c ae0008        	ldw	x,#L561
2132  046f cd0000        	call	_assert_failed
2134  0472 5b04          	addw	sp,#4
2135  0474               L472:
2136                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
2138  0474 c65237        	ld	a,21047
2139  0477 a4f0          	and	a,#240
2140  0479 c75237        	ld	21047,a
2141                     ; 519   UART1->CR4 |= UART1_Address;
2143  047c c65237        	ld	a,21047
2144  047f 1a01          	or	a,(OFST+1,sp)
2145  0481 c75237        	ld	21047,a
2146                     ; 520 }
2149  0484 84            	pop	a
2150  0485 81            	ret	
2182                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
2182                     ; 529 {
2183                     	switch	.text
2184  0486               _UART1_SetGuardTime:
2188                     ; 531   UART1->GTR = UART1_GuardTime;
2190  0486 c75239        	ld	21049,a
2191                     ; 532 }
2194  0489 81            	ret	
2226                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
2226                     ; 557 {
2227                     	switch	.text
2228  048a               _UART1_SetPrescaler:
2232                     ; 559   UART1->PSCR = UART1_Prescaler;
2234  048a c7523a        	ld	21050,a
2235                     ; 560 }
2238  048d 81            	ret	
2382                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2382                     ; 569 {
2383                     	switch	.text
2384  048e               _UART1_GetFlagStatus:
2386  048e 89            	pushw	x
2387  048f 88            	push	a
2388       00000001      OFST:	set	1
2391                     ; 570   FlagStatus status = RESET;
2393                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2395  0490 a30080        	cpw	x,#128
2396  0493 273b          	jreq	L213
2397  0495 a30040        	cpw	x,#64
2398  0498 2736          	jreq	L213
2399  049a a30020        	cpw	x,#32
2400  049d 2731          	jreq	L213
2401  049f a30010        	cpw	x,#16
2402  04a2 272c          	jreq	L213
2403  04a4 a30008        	cpw	x,#8
2404  04a7 2727          	jreq	L213
2405  04a9 a30004        	cpw	x,#4
2406  04ac 2722          	jreq	L213
2407  04ae a30002        	cpw	x,#2
2408  04b1 271d          	jreq	L213
2409  04b3 a30001        	cpw	x,#1
2410  04b6 2718          	jreq	L213
2411  04b8 a30101        	cpw	x,#257
2412  04bb 2713          	jreq	L213
2413  04bd a30210        	cpw	x,#528
2414  04c0 270e          	jreq	L213
2415  04c2 ae023d        	ldw	x,#573
2416  04c5 89            	pushw	x
2417  04c6 5f            	clrw	x
2418  04c7 89            	pushw	x
2419  04c8 ae0008        	ldw	x,#L561
2420  04cb cd0000        	call	_assert_failed
2422  04ce 5b04          	addw	sp,#4
2423  04d0               L213:
2424                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2426  04d0 1e02          	ldw	x,(OFST+1,sp)
2427  04d2 a30210        	cpw	x,#528
2428  04d5 2605          	jrne	L3301
2429                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2431  04d7 c65237        	ld	a,21047
2432                     ; 582       status = SET;
2434  04da 2008          	jp	LC006
2435                     ; 587       status = RESET;
2436  04dc               L3301:
2437                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2439  04dc a30101        	cpw	x,#257
2440  04df 260b          	jrne	L3401
2441                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2443  04e1 c65235        	ld	a,21045
2444  04e4               LC006:
2445  04e4 1503          	bcp	a,(OFST+2,sp)
2446  04e6 270b          	jreq	L3501
2447                     ; 595       status = SET;
2449  04e8               LC005:
2452  04e8 a601          	ld	a,#1
2455  04ea 2008          	jra	L1401
2456                     ; 600       status = RESET;
2457  04ec               L3401:
2458                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2460  04ec c65230        	ld	a,21040
2461  04ef 1503          	bcp	a,(OFST+2,sp)
2462                     ; 608       status = SET;
2464  04f1 26f5          	jrne	LC005
2465  04f3               L3501:
2466                     ; 613       status = RESET;
2470  04f3 4f            	clr	a
2472  04f4               L1401:
2473                     ; 617   return status;
2477  04f4 5b03          	addw	sp,#3
2478  04f6 81            	ret	
2514                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2514                     ; 647 {
2515                     	switch	.text
2516  04f7               _UART1_ClearFlag:
2518  04f7 89            	pushw	x
2519       00000000      OFST:	set	0
2522                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2524  04f8 a30020        	cpw	x,#32
2525  04fb 2713          	jreq	L423
2526  04fd a30210        	cpw	x,#528
2527  0500 270e          	jreq	L423
2528  0502 ae0288        	ldw	x,#648
2529  0505 89            	pushw	x
2530  0506 5f            	clrw	x
2531  0507 89            	pushw	x
2532  0508 ae0008        	ldw	x,#L561
2533  050b cd0000        	call	_assert_failed
2535  050e 5b04          	addw	sp,#4
2536  0510               L423:
2537                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2539  0510 1e01          	ldw	x,(OFST+1,sp)
2540  0512 a30020        	cpw	x,#32
2541  0515 2606          	jrne	L5701
2542                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2544  0517 35df5230      	mov	21040,#223
2546  051b 2004          	jra	L7701
2547  051d               L5701:
2548                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2550  051d 72195237      	bres	21047,#4
2551  0521               L7701:
2552                     ; 660 }
2555  0521 85            	popw	x
2556  0522 81            	ret	
2631                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2631                     ; 676 {
2632                     	switch	.text
2633  0523               _UART1_GetITStatus:
2635  0523 89            	pushw	x
2636  0524 89            	pushw	x
2637       00000002      OFST:	set	2
2640                     ; 677   ITStatus pendingbitstatus = RESET;
2642                     ; 678   uint8_t itpos = 0;
2644                     ; 679   uint8_t itmask1 = 0;
2646                     ; 680   uint8_t itmask2 = 0;
2648                     ; 681   uint8_t enablestatus = 0;
2650                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2652  0525 a30277        	cpw	x,#631
2653  0528 272c          	jreq	L633
2654  052a a30266        	cpw	x,#614
2655  052d 2727          	jreq	L633
2656  052f a30255        	cpw	x,#597
2657  0532 2722          	jreq	L633
2658  0534 a30244        	cpw	x,#580
2659  0537 271d          	jreq	L633
2660  0539 a30235        	cpw	x,#565
2661  053c 2718          	jreq	L633
2662  053e a30346        	cpw	x,#838
2663  0541 2713          	jreq	L633
2664  0543 a30100        	cpw	x,#256
2665  0546 270e          	jreq	L633
2666  0548 ae02ac        	ldw	x,#684
2667  054b 89            	pushw	x
2668  054c 5f            	clrw	x
2669  054d 89            	pushw	x
2670  054e ae0008        	ldw	x,#L561
2671  0551 cd0000        	call	_assert_failed
2673  0554 5b04          	addw	sp,#4
2674  0556               L633:
2675                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2677  0556 7b04          	ld	a,(OFST+2,sp)
2678  0558 a40f          	and	a,#15
2679  055a 5f            	clrw	x
2680  055b 97            	ld	xl,a
2681  055c a601          	ld	a,#1
2682  055e 5d            	tnzw	x
2683  055f 2704          	jreq	L243
2684  0561               L443:
2685  0561 48            	sll	a
2686  0562 5a            	decw	x
2687  0563 26fc          	jrne	L443
2688  0565               L243:
2689  0565 6b01          	ld	(OFST-1,sp),a
2691                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2693  0567 7b04          	ld	a,(OFST+2,sp)
2694  0569 4e            	swap	a
2695  056a a40f          	and	a,#15
2696  056c 6b02          	ld	(OFST+0,sp),a
2698                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2700  056e 5f            	clrw	x
2701  056f 97            	ld	xl,a
2702  0570 a601          	ld	a,#1
2703  0572 5d            	tnzw	x
2704  0573 2704          	jreq	L643
2705  0575               L053:
2706  0575 48            	sll	a
2707  0576 5a            	decw	x
2708  0577 26fc          	jrne	L053
2709  0579               L643:
2710  0579 6b02          	ld	(OFST+0,sp),a
2712                     ; 695   if (UART1_IT == UART1_IT_PE)
2714  057b 1e03          	ldw	x,(OFST+1,sp)
2715  057d a30100        	cpw	x,#256
2716  0580 260c          	jrne	L3311
2717                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2719  0582 c65234        	ld	a,21044
2720  0585 1402          	and	a,(OFST+0,sp)
2721  0587 6b02          	ld	(OFST+0,sp),a
2723                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2725  0589 c65230        	ld	a,21040
2727                     ; 704       pendingbitstatus = SET;
2729  058c 200f          	jp	LC009
2730                     ; 709       pendingbitstatus = RESET;
2731  058e               L3311:
2732                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2734  058e a30346        	cpw	x,#838
2735  0591 2616          	jrne	L3411
2736                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2738  0593 c65237        	ld	a,21047
2739  0596 1402          	and	a,(OFST+0,sp)
2740  0598 6b02          	ld	(OFST+0,sp),a
2742                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2744  059a c65237        	ld	a,21047
2746  059d               LC009:
2747  059d 1501          	bcp	a,(OFST-1,sp)
2748  059f 271a          	jreq	L3511
2749  05a1 7b02          	ld	a,(OFST+0,sp)
2750  05a3 2716          	jreq	L3511
2751                     ; 721       pendingbitstatus = SET;
2753  05a5               LC008:
2756  05a5 a601          	ld	a,#1
2759  05a7 2013          	jra	L1411
2760                     ; 726       pendingbitstatus = RESET;
2761  05a9               L3411:
2762                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2764  05a9 c65235        	ld	a,21045
2765  05ac 1402          	and	a,(OFST+0,sp)
2766  05ae 6b02          	ld	(OFST+0,sp),a
2768                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2770  05b0 c65230        	ld	a,21040
2771  05b3 1501          	bcp	a,(OFST-1,sp)
2772  05b5 2704          	jreq	L3511
2774  05b7 7b02          	ld	a,(OFST+0,sp)
2775                     ; 737       pendingbitstatus = SET;
2777  05b9 26ea          	jrne	LC008
2778  05bb               L3511:
2779                     ; 742       pendingbitstatus = RESET;
2783  05bb 4f            	clr	a
2785  05bc               L1411:
2786                     ; 747   return  pendingbitstatus;
2790  05bc 5b04          	addw	sp,#4
2791  05be 81            	ret	
2828                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2828                     ; 776 {
2829                     	switch	.text
2830  05bf               _UART1_ClearITPendingBit:
2832  05bf 89            	pushw	x
2833       00000000      OFST:	set	0
2836                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2838  05c0 a30255        	cpw	x,#597
2839  05c3 2713          	jreq	L063
2840  05c5 a30346        	cpw	x,#838
2841  05c8 270e          	jreq	L063
2842  05ca ae0309        	ldw	x,#777
2843  05cd 89            	pushw	x
2844  05ce 5f            	clrw	x
2845  05cf 89            	pushw	x
2846  05d0 ae0008        	ldw	x,#L561
2847  05d3 cd0000        	call	_assert_failed
2849  05d6 5b04          	addw	sp,#4
2850  05d8               L063:
2851                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2853  05d8 1e01          	ldw	x,(OFST+1,sp)
2854  05da a30255        	cpw	x,#597
2855  05dd 2606          	jrne	L5711
2856                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2858  05df 35df5230      	mov	21040,#223
2860  05e3 2004          	jra	L7711
2861  05e5               L5711:
2862                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2864  05e5 72195237      	bres	21047,#4
2865  05e9               L7711:
2866                     ; 789 }
2869  05e9 85            	popw	x
2870  05ea 81            	ret	
2883                     	xdef	_UART1_ClearITPendingBit
2884                     	xdef	_UART1_GetITStatus
2885                     	xdef	_UART1_ClearFlag
2886                     	xdef	_UART1_GetFlagStatus
2887                     	xdef	_UART1_SetPrescaler
2888                     	xdef	_UART1_SetGuardTime
2889                     	xdef	_UART1_SetAddress
2890                     	xdef	_UART1_SendBreak
2891                     	xdef	_UART1_SendData9
2892                     	xdef	_UART1_SendData8
2893                     	xdef	_UART1_ReceiveData9
2894                     	xdef	_UART1_ReceiveData8
2895                     	xdef	_UART1_ReceiverWakeUpCmd
2896                     	xdef	_UART1_WakeUpConfig
2897                     	xdef	_UART1_SmartCardNACKCmd
2898                     	xdef	_UART1_SmartCardCmd
2899                     	xdef	_UART1_LINCmd
2900                     	xdef	_UART1_LINBreakDetectionConfig
2901                     	xdef	_UART1_IrDACmd
2902                     	xdef	_UART1_IrDAConfig
2903                     	xdef	_UART1_HalfDuplexCmd
2904                     	xdef	_UART1_ITConfig
2905                     	xdef	_UART1_Cmd
2906                     	xdef	_UART1_Init
2907                     	xdef	_UART1_DeInit
2908                     	xref	_assert_failed
2909                     	xref	_CLK_GetClockFreq
2910                     	switch	.const
2911  0008               L561:
2912  0008 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
2913  001a 697665725c73  	dc.b	"iver\src\stm8s_uar"
2914  002c 74312e6300    	dc.b	"t1.c",0
2915                     	xref.b	c_lreg
2916                     	xref.b	c_x
2936                     	xref	c_lursh
2937                     	xref	c_lsub
2938                     	xref	c_smul
2939                     	xref	c_ludv
2940                     	xref	c_rtol
2941                     	xref	c_llsh
2942                     	xref	c_lcmp
2943                     	xref	c_ltor
2944                     	end
