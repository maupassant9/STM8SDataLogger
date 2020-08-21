   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  44                     ; 50 uint8_t ITC_GetCPUCC(void)
  44                     ; 51 {
  46                     	switch	.text
  47  0000               _ITC_GetCPUCC:
  51                     ; 53   _asm("push cc");
  54  0000 8a            	push	cc
  56                     ; 54   _asm("pop a");
  59  0001 84            	pop	a
  61                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  64  0002 81            	ret	
  87                     ; 80 void ITC_DeInit(void)
  87                     ; 81 {
  88                     	switch	.text
  89  0003               _ITC_DeInit:
  93                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  95  0003 35ff7f70      	mov	32624,#255
  96                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  98  0007 35ff7f71      	mov	32625,#255
  99                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 101  000b 35ff7f72      	mov	32626,#255
 102                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 104  000f 35ff7f73      	mov	32627,#255
 105                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 107  0013 35ff7f74      	mov	32628,#255
 108                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 110  0017 35ff7f75      	mov	32629,#255
 111                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 113  001b 35ff7f76      	mov	32630,#255
 114                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 116  001f 35ff7f77      	mov	32631,#255
 117                     ; 90 }
 120  0023 81            	ret	
 145                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 145                     ; 98 {
 146                     	switch	.text
 147  0024               _ITC_GetSoftIntStatus:
 151                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 153  0024 adda          	call	_ITC_GetCPUCC
 155  0026 a428          	and	a,#40
 158  0028 81            	ret	
 404                     .const:	section	.text
 405  0000               L23:
 406  0000 005e          	dc.w	L14
 407  0002 005e          	dc.w	L14
 408  0004 005e          	dc.w	L14
 409  0006 005e          	dc.w	L14
 410  0008 0063          	dc.w	L34
 411  000a 0063          	dc.w	L34
 412  000c 0063          	dc.w	L34
 413  000e 0063          	dc.w	L34
 414  0010 0083          	dc.w	L102
 415  0012 0083          	dc.w	L102
 416  0014 0068          	dc.w	L54
 417  0016 0068          	dc.w	L54
 418  0018 006d          	dc.w	L74
 419  001a 006d          	dc.w	L74
 420  001c 006d          	dc.w	L74
 421  001e 006d          	dc.w	L74
 422  0020 0072          	dc.w	L15
 423  0022 0072          	dc.w	L15
 424  0024 0072          	dc.w	L15
 425  0026 0072          	dc.w	L15
 426  0028 0083          	dc.w	L102
 427  002a 0083          	dc.w	L102
 428  002c 0077          	dc.w	L35
 429  002e 0077          	dc.w	L35
 430  0030 007c          	dc.w	L55
 431                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 431                     ; 108 {
 432                     	switch	.text
 433  0029               _ITC_GetSoftwarePriority:
 435  0029 88            	push	a
 436  002a 89            	pushw	x
 437       00000002      OFST:	set	2
 440                     ; 109   uint8_t Value = 0;
 442  002b 0f02          	clr	(OFST+0,sp)
 444                     ; 110   uint8_t Mask = 0;
 446                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 448  002d a119          	cp	a,#25
 449  002f 250e          	jrult	L02
 450  0031 ae0071        	ldw	x,#113
 451  0034 89            	pushw	x
 452  0035 5f            	clrw	x
 453  0036 89            	pushw	x
 454  0037 ae0064        	ldw	x,#L571
 455  003a cd0000        	call	_assert_failed
 457  003d 5b04          	addw	sp,#4
 458  003f               L02:
 459                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 461  003f 7b03          	ld	a,(OFST+1,sp)
 462  0041 a403          	and	a,#3
 463  0043 48            	sll	a
 464  0044 5f            	clrw	x
 465  0045 97            	ld	xl,a
 466  0046 a603          	ld	a,#3
 467  0048 5d            	tnzw	x
 468  0049 2704          	jreq	L42
 469  004b               L62:
 470  004b 48            	sll	a
 471  004c 5a            	decw	x
 472  004d 26fc          	jrne	L62
 473  004f               L42:
 474  004f 6b01          	ld	(OFST-1,sp),a
 476                     ; 118   switch (IrqNum)
 478  0051 7b03          	ld	a,(OFST+1,sp)
 480                     ; 198   default:
 480                     ; 199     break;
 481  0053 a119          	cp	a,#25
 482  0055 242c          	jruge	L102
 483  0057 5f            	clrw	x
 484  0058 97            	ld	xl,a
 485  0059 58            	sllw	x
 486  005a de0000        	ldw	x,(L23,x)
 487  005d fc            	jp	(x)
 488  005e               L14:
 489                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 489                     ; 121   case ITC_IRQ_AWU:
 489                     ; 122   case ITC_IRQ_CLK:
 489                     ; 123   case ITC_IRQ_PORTA:
 489                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 491  005e c67f70        	ld	a,32624
 492                     ; 125     break;
 494  0061 201c          	jp	LC001
 495  0063               L34:
 496                     ; 127   case ITC_IRQ_PORTB:
 496                     ; 128   case ITC_IRQ_PORTC:
 496                     ; 129   case ITC_IRQ_PORTD:
 496                     ; 130   case ITC_IRQ_PORTE:
 496                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 498  0063 c67f71        	ld	a,32625
 499                     ; 132     break;
 501  0066 2017          	jp	LC001
 502  0068               L54:
 503                     ; 141   case ITC_IRQ_SPI:
 503                     ; 142   case ITC_IRQ_TIM1_OVF:
 503                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 505  0068 c67f72        	ld	a,32626
 506                     ; 144     break;
 508  006b 2012          	jp	LC001
 509  006d               L74:
 510                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 510                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 510                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 510                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 510                     ; 150 #else
 510                     ; 151   case ITC_IRQ_TIM2_OVF:
 510                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 510                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 510                     ; 154   case ITC_IRQ_TIM3_OVF:
 510                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 512  006d c67f73        	ld	a,32627
 513                     ; 156     break;
 515  0070 200d          	jp	LC001
 516  0072               L15:
 517                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 517                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 517                     ; 160     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 517                     ; 161   case ITC_IRQ_UART1_TX:
 517                     ; 162   case ITC_IRQ_UART1_RX:
 517                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 517                     ; 164 #if defined(STM8AF622x)
 517                     ; 165   case ITC_IRQ_UART4_TX:
 517                     ; 166   case ITC_IRQ_UART4_RX:
 517                     ; 167 #endif /*STM8AF622x */
 517                     ; 168   case ITC_IRQ_I2C:
 517                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 519  0072 c67f74        	ld	a,32628
 520                     ; 170     break;
 522  0075 2008          	jp	LC001
 523  0077               L35:
 524                     ; 184   case ITC_IRQ_ADC1:
 524                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 524                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 524                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 524                     ; 188 #else
 524                     ; 189   case ITC_IRQ_TIM4_OVF:
 524                     ; 190 #endif /*STM8S903 or STM8AF622x */
 524                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 526  0077 c67f75        	ld	a,32629
 527                     ; 192     break;
 529  007a 2003          	jp	LC001
 530  007c               L55:
 531                     ; 194   case ITC_IRQ_EEPROM_EEC:
 531                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 533  007c c67f76        	ld	a,32630
 534  007f               LC001:
 535  007f 1401          	and	a,(OFST-1,sp)
 536  0081 6b02          	ld	(OFST+0,sp),a
 538                     ; 196     break;
 540                     ; 198   default:
 540                     ; 199     break;
 542  0083               L102:
 543                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 545  0083 7b03          	ld	a,(OFST+1,sp)
 546  0085 a403          	and	a,#3
 547  0087 48            	sll	a
 548  0088 5f            	clrw	x
 549  0089 97            	ld	xl,a
 550  008a 7b02          	ld	a,(OFST+0,sp)
 551  008c 5d            	tnzw	x
 552  008d 2704          	jreq	L43
 553  008f               L63:
 554  008f 44            	srl	a
 555  0090 5a            	decw	x
 556  0091 26fc          	jrne	L63
 557  0093               L43:
 559                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 563  0093 5b03          	addw	sp,#3
 564  0095 81            	ret	
 626                     	switch	.const
 627  0032               L201:
 628  0032 0114          	dc.w	L302
 629  0034 0114          	dc.w	L302
 630  0036 0114          	dc.w	L302
 631  0038 0114          	dc.w	L302
 632  003a 0126          	dc.w	L502
 633  003c 0126          	dc.w	L502
 634  003e 0126          	dc.w	L502
 635  0040 0126          	dc.w	L502
 636  0042 0190          	dc.w	L352
 637  0044 0190          	dc.w	L352
 638  0046 0138          	dc.w	L702
 639  0048 0138          	dc.w	L702
 640  004a 014a          	dc.w	L112
 641  004c 014a          	dc.w	L112
 642  004e 014a          	dc.w	L112
 643  0050 014a          	dc.w	L112
 644  0052 015c          	dc.w	L312
 645  0054 015c          	dc.w	L312
 646  0056 015c          	dc.w	L312
 647  0058 015c          	dc.w	L312
 648  005a 0190          	dc.w	L352
 649  005c 0190          	dc.w	L352
 650  005e 016e          	dc.w	L512
 651  0060 016e          	dc.w	L512
 652  0062 0180          	dc.w	L712
 653                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 653                     ; 221 {
 654                     	switch	.text
 655  0096               _ITC_SetSoftwarePriority:
 657  0096 89            	pushw	x
 658  0097 89            	pushw	x
 659       00000002      OFST:	set	2
 662                     ; 222   uint8_t Mask = 0;
 664                     ; 223   uint8_t NewPriority = 0;
 666                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 668  0098 9e            	ld	a,xh
 669  0099 a119          	cp	a,#25
 670  009b 250e          	jrult	L44
 671  009d ae00e2        	ldw	x,#226
 672  00a0 89            	pushw	x
 673  00a1 5f            	clrw	x
 674  00a2 89            	pushw	x
 675  00a3 ae0064        	ldw	x,#L571
 676  00a6 cd0000        	call	_assert_failed
 678  00a9 5b04          	addw	sp,#4
 679  00ab               L44:
 680                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 682  00ab 7b04          	ld	a,(OFST+2,sp)
 683  00ad a102          	cp	a,#2
 684  00af 2719          	jreq	L45
 685  00b1 4a            	dec	a
 686  00b2 2716          	jreq	L45
 687  00b4 7b04          	ld	a,(OFST+2,sp)
 688  00b6 2712          	jreq	L45
 689  00b8 a103          	cp	a,#3
 690  00ba 270e          	jreq	L45
 691  00bc ae00e3        	ldw	x,#227
 692  00bf 89            	pushw	x
 693  00c0 5f            	clrw	x
 694  00c1 89            	pushw	x
 695  00c2 ae0064        	ldw	x,#L571
 696  00c5 cd0000        	call	_assert_failed
 698  00c8 5b04          	addw	sp,#4
 699  00ca               L45:
 700                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 702  00ca cd0024        	call	_ITC_GetSoftIntStatus
 704  00cd a128          	cp	a,#40
 705  00cf 270e          	jreq	L46
 706  00d1 ae00e6        	ldw	x,#230
 707  00d4 89            	pushw	x
 708  00d5 5f            	clrw	x
 709  00d6 89            	pushw	x
 710  00d7 ae0064        	ldw	x,#L571
 711  00da cd0000        	call	_assert_failed
 713  00dd 5b04          	addw	sp,#4
 714  00df               L46:
 715                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 717  00df 7b03          	ld	a,(OFST+1,sp)
 718  00e1 a403          	and	a,#3
 719  00e3 48            	sll	a
 720  00e4 5f            	clrw	x
 721  00e5 97            	ld	xl,a
 722  00e6 a603          	ld	a,#3
 723  00e8 5d            	tnzw	x
 724  00e9 2704          	jreq	L07
 725  00eb               L27:
 726  00eb 48            	sll	a
 727  00ec 5a            	decw	x
 728  00ed 26fc          	jrne	L27
 729  00ef               L07:
 730  00ef 43            	cpl	a
 731  00f0 6b01          	ld	(OFST-1,sp),a
 733                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 735  00f2 7b03          	ld	a,(OFST+1,sp)
 736  00f4 a403          	and	a,#3
 737  00f6 48            	sll	a
 738  00f7 5f            	clrw	x
 739  00f8 97            	ld	xl,a
 740  00f9 7b04          	ld	a,(OFST+2,sp)
 741  00fb 5d            	tnzw	x
 742  00fc 2704          	jreq	L47
 743  00fe               L67:
 744  00fe 48            	sll	a
 745  00ff 5a            	decw	x
 746  0100 26fc          	jrne	L67
 747  0102               L47:
 748  0102 6b02          	ld	(OFST+0,sp),a
 750                     ; 239   switch (IrqNum)
 752  0104 7b03          	ld	a,(OFST+1,sp)
 754                     ; 329   default:
 754                     ; 330     break;
 755  0106 a119          	cp	a,#25
 756  0108 2503cc0190    	jruge	L352
 757  010d 5f            	clrw	x
 758  010e 97            	ld	xl,a
 759  010f 58            	sllw	x
 760  0110 de0032        	ldw	x,(L201,x)
 761  0113 fc            	jp	(x)
 762  0114               L302:
 763                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 763                     ; 242   case ITC_IRQ_AWU:
 763                     ; 243   case ITC_IRQ_CLK:
 763                     ; 244   case ITC_IRQ_PORTA:
 763                     ; 245     ITC->ISPR1 &= Mask;
 765  0114 c67f70        	ld	a,32624
 766  0117 1401          	and	a,(OFST-1,sp)
 767  0119 c77f70        	ld	32624,a
 768                     ; 246     ITC->ISPR1 |= NewPriority;
 770  011c c67f70        	ld	a,32624
 771  011f 1a02          	or	a,(OFST+0,sp)
 772  0121 c77f70        	ld	32624,a
 773                     ; 247     break;
 775  0124 206a          	jra	L352
 776  0126               L502:
 777                     ; 249   case ITC_IRQ_PORTB:
 777                     ; 250   case ITC_IRQ_PORTC:
 777                     ; 251   case ITC_IRQ_PORTD:
 777                     ; 252   case ITC_IRQ_PORTE:
 777                     ; 253     ITC->ISPR2 &= Mask;
 779  0126 c67f71        	ld	a,32625
 780  0129 1401          	and	a,(OFST-1,sp)
 781  012b c77f71        	ld	32625,a
 782                     ; 254     ITC->ISPR2 |= NewPriority;
 784  012e c67f71        	ld	a,32625
 785  0131 1a02          	or	a,(OFST+0,sp)
 786  0133 c77f71        	ld	32625,a
 787                     ; 255     break;
 789  0136 2058          	jra	L352
 790  0138               L702:
 791                     ; 264   case ITC_IRQ_SPI:
 791                     ; 265   case ITC_IRQ_TIM1_OVF:
 791                     ; 266     ITC->ISPR3 &= Mask;
 793  0138 c67f72        	ld	a,32626
 794  013b 1401          	and	a,(OFST-1,sp)
 795  013d c77f72        	ld	32626,a
 796                     ; 267     ITC->ISPR3 |= NewPriority;
 798  0140 c67f72        	ld	a,32626
 799  0143 1a02          	or	a,(OFST+0,sp)
 800  0145 c77f72        	ld	32626,a
 801                     ; 268     break;
 803  0148 2046          	jra	L352
 804  014a               L112:
 805                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 805                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 805                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 805                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 805                     ; 274 #else
 805                     ; 275   case ITC_IRQ_TIM2_OVF:
 805                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 805                     ; 277 #endif /*STM8S903 or STM8AF622x */
 805                     ; 278   case ITC_IRQ_TIM3_OVF:
 805                     ; 279     ITC->ISPR4 &= Mask;
 807  014a c67f73        	ld	a,32627
 808  014d 1401          	and	a,(OFST-1,sp)
 809  014f c77f73        	ld	32627,a
 810                     ; 280     ITC->ISPR4 |= NewPriority;
 812  0152 c67f73        	ld	a,32627
 813  0155 1a02          	or	a,(OFST+0,sp)
 814  0157 c77f73        	ld	32627,a
 815                     ; 281     break;
 817  015a 2034          	jra	L352
 818  015c               L312:
 819                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 819                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 819                     ; 285     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 819                     ; 286   case ITC_IRQ_UART1_TX:
 819                     ; 287   case ITC_IRQ_UART1_RX:
 819                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 819                     ; 289 #if defined(STM8AF622x)
 819                     ; 290   case ITC_IRQ_UART4_TX:
 819                     ; 291   case ITC_IRQ_UART4_RX:
 819                     ; 292 #endif /*STM8AF622x */
 819                     ; 293   case ITC_IRQ_I2C:
 819                     ; 294     ITC->ISPR5 &= Mask;
 821  015c c67f74        	ld	a,32628
 822  015f 1401          	and	a,(OFST-1,sp)
 823  0161 c77f74        	ld	32628,a
 824                     ; 295     ITC->ISPR5 |= NewPriority;
 826  0164 c67f74        	ld	a,32628
 827  0167 1a02          	or	a,(OFST+0,sp)
 828  0169 c77f74        	ld	32628,a
 829                     ; 296     break;
 831  016c 2022          	jra	L352
 832  016e               L512:
 833                     ; 312   case ITC_IRQ_ADC1:
 833                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 833                     ; 314     
 833                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 833                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 833                     ; 317 #else
 833                     ; 318   case ITC_IRQ_TIM4_OVF:
 833                     ; 319 #endif /* STM8S903 or STM8AF622x */
 833                     ; 320     ITC->ISPR6 &= Mask;
 835  016e c67f75        	ld	a,32629
 836  0171 1401          	and	a,(OFST-1,sp)
 837  0173 c77f75        	ld	32629,a
 838                     ; 321     ITC->ISPR6 |= NewPriority;
 840  0176 c67f75        	ld	a,32629
 841  0179 1a02          	or	a,(OFST+0,sp)
 842  017b c77f75        	ld	32629,a
 843                     ; 322     break;
 845  017e 2010          	jra	L352
 846  0180               L712:
 847                     ; 324   case ITC_IRQ_EEPROM_EEC:
 847                     ; 325     ITC->ISPR7 &= Mask;
 849  0180 c67f76        	ld	a,32630
 850  0183 1401          	and	a,(OFST-1,sp)
 851  0185 c77f76        	ld	32630,a
 852                     ; 326     ITC->ISPR7 |= NewPriority;
 854  0188 c67f76        	ld	a,32630
 855  018b 1a02          	or	a,(OFST+0,sp)
 856  018d c77f76        	ld	32630,a
 857                     ; 327     break;
 859                     ; 329   default:
 859                     ; 330     break;
 861  0190               L352:
 862                     ; 332 }
 865  0190 5b04          	addw	sp,#4
 866  0192 81            	ret	
 879                     	xdef	_ITC_GetSoftwarePriority
 880                     	xdef	_ITC_SetSoftwarePriority
 881                     	xdef	_ITC_GetSoftIntStatus
 882                     	xdef	_ITC_DeInit
 883                     	xdef	_ITC_GetCPUCC
 884                     	xref	_assert_failed
 885                     	switch	.const
 886  0064               L571:
 887  0064 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
 888  0076 697665725c73  	dc.b	"iver\src\stm8s_itc"
 889  0088 2e6300        	dc.b	".c",0
 909                     	end
