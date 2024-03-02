   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  55                     ; 65 static void tim1Init( void )
  55                     ; 66 {
  57                     	switch	.text
  58  0000               L71_tim1Init:
  60  0000 520c          	subw	sp,#12
  61       0000000c      OFST:	set	12
  64                     ; 69     TIM1->CR1 = (TIM1_CR1_ARPE|TIM1_CR1_URS);
  66  0002 35845250      	mov	21072,#132
  67                     ; 70     TIM1->CR2 = 0x20;
  69  0006 35205251      	mov	21073,#32
  70                     ; 74 		period = ((((uint32_t)INPUT_FREQ_TIM1_FOR_ADC)/loggerCfg.sampFreq)/GetChannelNo());
  72  000a cd00f1        	call	L51_GetChannelNo
  74  000d b703          	ld	c_lreg+3,a
  75  000f 3f02          	clr	c_lreg+2
  76  0011 3f01          	clr	c_lreg+1
  77  0013 3f00          	clr	c_lreg
  78  0015 96            	ldw	x,sp
  79  0016 1c0005        	addw	x,#OFST-7
  80  0019 cd0000        	call	c_rtol
  83  001c ce0000        	ldw	x,_loggerCfg
  84  001f cd0000        	call	c_uitolx
  86  0022 96            	ldw	x,sp
  87  0023 5c            	incw	x
  88  0024 cd0000        	call	c_rtol
  91  0027 ae2400        	ldw	x,#9216
  92  002a bf02          	ldw	c_lreg+2,x
  93  002c ae00f4        	ldw	x,#244
  94  002f bf00          	ldw	c_lreg,x
  95  0031 96            	ldw	x,sp
  96  0032 5c            	incw	x
  97  0033 cd0000        	call	c_ludv
  99  0036 96            	ldw	x,sp
 100  0037 1c0005        	addw	x,#OFST-7
 101  003a cd0000        	call	c_ludv
 103  003d 96            	ldw	x,sp
 104  003e 1c0009        	addw	x,#OFST-3
 105  0041 cd0000        	call	c_rtol
 108                     ; 75     TIM1->ARRH = (uint8_t)((period&0xff00)>>8);
 110  0044 7b0b          	ld	a,(OFST-1,sp)
 111  0046 c75262        	ld	21090,a
 112                     ; 76     TIM1->ARRL = (uint8_t)(period&0xff);
 114  0049 7b0c          	ld	a,(OFST+0,sp)
 115  004b c75263        	ld	21091,a
 116                     ; 77 		TIM1->EGR |= TIM1_EGR_UG;
 118  004e 72105257      	bset	21079,#0
 119                     ; 78     TIM1->CR1 |= TIM1_CR1_CEN;
 121  0052 72105250      	bset	21072,#0
 122                     ; 79 }
 125  0056 5b0c          	addw	sp,#12
 126  0058 81            	ret	
 157                     ; 90 void adcInit( void )
 157                     ; 91 {
 158                     	switch	.text
 159  0059               _adcInit:
 163                     ; 92     cnter = 0x00;
 165  0059 5f            	clrw	x
 166  005a bf00          	ldw	L3_cnter,x
 167                     ; 93     pCurrBuffer = (uint8_t *)adcBuffer0;
 169  005c ae0104        	ldw	x,#_adcBuffer0
 170  005f cf0002        	ldw	L5_pCurrBuffer,x
 171                     ; 94 		pCurrByte = (uint8_t *)adcBuffer0;
 173  0062 cf0000        	ldw	L7_pCurrByte,x
 174                     ; 95     buffer_rdy = 0x00; //nenhum buffers are ready
 176  0065 3f02          	clr	_buffer_rdy
 177                     ; 97     ADC1->CR1 = 0x20;
 179  0067 35205401      	mov	21505,#32
 180                     ; 100     ADC1->CSR = NextChannel()|ADC1_CSR_EOCIE;
 182  006b ad53          	call	L31_NextChannel
 184  006d aa20          	or	a,#32
 185  006f c75400        	ld	21504,a
 186                     ; 102     ADC1->CR2 = (loggerCfg.isFullResultion<<3)|ADC1_CR2_EXTTRIG;//(ADC1_CR2_EXTTRIG | ADC1_CR2_ALIGN);
 188  0072 c6000e        	ld	a,_loggerCfg+14
 189  0075 48            	sll	a
 190  0076 48            	sll	a
 191  0077 48            	sll	a
 192  0078 aa40          	or	a,#64
 193  007a c75402        	ld	21506,a
 194                     ; 104     ADC1->CR3 = ADC1_CR3_DBUF;
 196  007d 35805403      	mov	21507,#128
 197                     ; 106     ADC1->TDRL = 0x1f;
 199  0081 351f5407      	mov	21511,#31
 200                     ; 108     ADC1->CR1 |= ADC1_CR1_ADON;
 202  0085 72105401      	bset	21505,#0
 203                     ; 110     tim1Init();
 206                     ; 111 }
 209  0089 cc0000        	jp	L71_tim1Init
 238                     ; 124 static void NextByte()
 238                     ; 125 {
 239                     	switch	.text
 240  008c               L11_NextByte:
 244                     ; 126     INC(cnter);
 246  008c be00          	ldw	x,L3_cnter
 247  008e a300ff        	cpw	x,#255
 248  0091 2603          	jrne	L02
 249  0093 5f            	clrw	x
 250  0094 2001          	jra	L22
 251  0096               L02:
 252  0096 5c            	incw	x
 253  0097               L22:
 254  0097 bf00          	ldw	L3_cnter,x
 255                     ; 128     if(cnter == 0){ //an overflow occurred
 257  0099 261d          	jrne	L36
 258                     ; 130 			if(pCurrBuffer == (uint8_t *)adcBuffer0) {
 260  009b ce0002        	ldw	x,L5_pCurrBuffer
 261  009e a30104        	cpw	x,#_adcBuffer0
 262  00a1 2609          	jrne	L56
 263                     ; 131         RELEASE_BUFF_FOR_RD(0);
 265  00a3 72100002      	bset	_buffer_rdy,#0
 266                     ; 132 				pCurrBuffer = (uint8_t *)adcBuffer1;
 268  00a7 ae0004        	ldw	x,#_adcBuffer1
 269                     ; 133         pCurrByte = (uint8_t *)adcBuffer1;
 271  00aa 2007          	jp	LC001
 272  00ac               L56:
 273                     ; 135 				RELEASE_BUFF_FOR_RD(1);
 275  00ac 72120002      	bset	_buffer_rdy,#1
 276                     ; 136 				pCurrBuffer = (uint8_t *)adcBuffer0;
 278  00b0 ae0104        	ldw	x,#_adcBuffer0
 279  00b3               LC001:
 280  00b3 cf0002        	ldw	L5_pCurrBuffer,x
 281                     ; 137 				pCurrByte =  (uint8_t *)adcBuffer0;
 282  00b6 2004          	jra	L17
 283  00b8               L36:
 284                     ; 140         pCurrByte = &pCurrBuffer[cnter];
 286  00b8 72bb0002      	addw	x,L5_pCurrBuffer
 287  00bc               L17:
 290  00bc cf0000        	ldw	L7_pCurrByte,x
 291                     ; 142 }
 294  00bf 81            	ret	
 297                     	switch	.data
 298  0000               L37_cntForChannel:
 299  0000 08            	dc.b	8
 330                     ; 156 static uint8_t NextChannel(void){
 331                     	switch	.text
 332  00c0               L31_NextChannel:
 334  00c0 89            	pushw	x
 335       00000002      OFST:	set	2
 338  00c1               L111:
 339                     ; 160 		cntForChannel = ((8==cntForChannel)?0:(cntForChannel+1));
 341  00c1 c60000        	ld	a,L37_cntForChannel
 342  00c4 a108          	cp	a,#8
 343  00c6 2603          	jrne	L62
 344  00c8 4f            	clr	a
 345  00c9 2001          	jra	L03
 346  00cb               L62:
 347  00cb 4c            	inc	a
 348  00cc               L03:
 349  00cc c70000        	ld	L37_cntForChannel,a
 350                     ; 161 		if((0x01 << cntForChannel) & loggerCfg.channel){
 352  00cf 5f            	clrw	x
 353  00d0 c6000d        	ld	a,_loggerCfg+13
 354  00d3 97            	ld	xl,a
 355  00d4 1f01          	ldw	(OFST-1,sp),x
 357  00d6 ae0001        	ldw	x,#1
 358  00d9 c60000        	ld	a,L37_cntForChannel
 359  00dc 2704          	jreq	L23
 360  00de               L43:
 361  00de 58            	sllw	x
 362  00df 4a            	dec	a
 363  00e0 26fc          	jrne	L43
 364  00e2               L23:
 365  00e2 01            	rrwa	x,a
 366  00e3 1402          	and	a,(OFST+0,sp)
 367  00e5 01            	rrwa	x,a
 368  00e6 1401          	and	a,(OFST-1,sp)
 369  00e8 01            	rrwa	x,a
 370  00e9 5d            	tnzw	x
 371  00ea 27d5          	jreq	L111
 372                     ; 163 			return cntForChannel;
 374  00ec c60000        	ld	a,L37_cntForChannel
 377  00ef 85            	popw	x
 378  00f0 81            	ret	
 418                     ; 179 static uint8_t GetChannelNo(void){
 419                     	switch	.text
 420  00f1               L51_GetChannelNo:
 422  00f1 5204          	subw	sp,#4
 423       00000004      OFST:	set	4
 426                     ; 180 	uint8_t cnt, chNo = 0;
 428  00f3 0f03          	clr	(OFST-1,sp)
 430                     ; 182 	for(cnt = 0; cnt < 8; cnt++){
 432  00f5 0f04          	clr	(OFST+0,sp)
 434  00f7               L531:
 435                     ; 183 		if((0x01 << cnt) & loggerCfg.channel){
 437  00f7 c6000d        	ld	a,_loggerCfg+13
 438  00fa 5f            	clrw	x
 439  00fb 97            	ld	xl,a
 440  00fc 1f01          	ldw	(OFST-3,sp),x
 442  00fe ae0001        	ldw	x,#1
 443  0101 7b04          	ld	a,(OFST+0,sp)
 444  0103 2704          	jreq	L04
 445  0105               L24:
 446  0105 58            	sllw	x
 447  0106 4a            	dec	a
 448  0107 26fc          	jrne	L24
 449  0109               L04:
 450  0109 01            	rrwa	x,a
 451  010a 1402          	and	a,(OFST-2,sp)
 452  010c 01            	rrwa	x,a
 453  010d 1401          	and	a,(OFST-3,sp)
 454  010f 01            	rrwa	x,a
 455  0110 5d            	tnzw	x
 456  0111 2702          	jreq	L341
 457                     ; 184 			chNo++;
 459  0113 0c03          	inc	(OFST-1,sp)
 461  0115               L341:
 462                     ; 182 	for(cnt = 0; cnt < 8; cnt++){
 464  0115 0c04          	inc	(OFST+0,sp)
 468  0117 7b04          	ld	a,(OFST+0,sp)
 469  0119 a108          	cp	a,#8
 470  011b 25da          	jrult	L531
 471                     ; 187 	return chNo;
 473  011d 7b03          	ld	a,(OFST-1,sp)
 476  011f 5b04          	addw	sp,#4
 477  0121 81            	ret	
 513                     ; 246 @far @interrupt void adcIsr (void)
 513                     ; 247 {
 515                     	switch	.text
 516  0122               f_adcIsr:
 518  0122 8a            	push	cc
 519  0123 84            	pop	a
 520  0124 a4bf          	and	a,#191
 521  0126 88            	push	a
 522  0127 86            	pop	cc
 523       00000001      OFST:	set	1
 524  0128 3b0002        	push	c_x+2
 525  012b be00          	ldw	x,c_x
 526  012d 89            	pushw	x
 527  012e 3b0002        	push	c_y+2
 528  0131 be00          	ldw	x,c_y
 529  0133 89            	pushw	x
 530  0134 88            	push	a
 533                     ; 251 		currChannel = NextChannel();
 535  0135 ad89          	call	L31_NextChannel
 537  0137 6b01          	ld	(OFST+0,sp),a
 539                     ; 252 		if(loggerCfg.isFullResultion){
 541  0139 c6000e        	ld	a,_loggerCfg+14
 542  013c 270a          	jreq	L161
 543                     ; 253 			*pCurrByte = ADC1->DRL;
 545  013e c65405        	ld	a,21509
 546  0141 72c70000      	ld	[L7_pCurrByte.w],a
 547                     ; 254 			NextByte();
 549  0145 cd008c        	call	L11_NextByte
 551  0148               L161:
 552                     ; 256 		*pCurrByte = ADC1->DRH;
 554  0148 c65404        	ld	a,21508
 555  014b 72c70000      	ld	[L7_pCurrByte.w],a
 556                     ; 257     NextByte();
 558  014f cd008c        	call	L11_NextByte
 560                     ; 261 		ADC1->CSR = (currChannel|ADC1_CSR_EOCIE);
 562  0152 7b01          	ld	a,(OFST+0,sp)
 563  0154 aa20          	or	a,#32
 564  0156 c75400        	ld	21504,a
 565                     ; 263 }
 568  0159 84            	pop	a
 569  015a 85            	popw	x
 570  015b bf00          	ldw	c_y,x
 571  015d 320002        	pop	c_y+2
 572  0160 85            	popw	x
 573  0161 bf00          	ldw	c_x,x
 574  0163 320002        	pop	c_x+2
 575  0166 80            	iret	
 647                     	switch	.bss
 648  0000               L7_pCurrByte:
 649  0000 0000          	ds.b	2
 650  0002               L5_pCurrBuffer:
 651  0002 0000          	ds.b	2
 652                     	switch	.ubsct
 653  0000               L3_cnter:
 654  0000 0000          	ds.b	2
 655                     	xref	_loggerCfg
 656                     	xdef	f_adcIsr
 657                     	xdef	_adcInit
 658  0002               _buffer_rdy:
 659  0002 00            	ds.b	1
 660                     	xdef	_buffer_rdy
 661                     	switch	.bss
 662  0004               _adcBuffer1:
 663  0004 000000000000  	ds.b	256
 664                     	xdef	_adcBuffer1
 665  0104               _adcBuffer0:
 666  0104 000000000000  	ds.b	256
 667                     	xdef	_adcBuffer0
 668                     	xref.b	c_lreg
 669                     	xref.b	c_x
 670                     	xref.b	c_y
 690                     	xref	c_ludv
 691                     	xref	c_rtol
 692                     	xref	c_uitolx
 693                     	end
