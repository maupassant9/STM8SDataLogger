   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  55                     ; 68 static void tim1Init( void )
  55                     ; 69 {
  57                     	switch	.text
  58  0000               L12_tim1Init:
  60  0000 520c          	subw	sp,#12
  61       0000000c      OFST:	set	12
  64                     ; 72     TIM1->CR1 = (TIM1_CR1_ARPE|TIM1_CR1_URS);
  66  0002 35845250      	mov	21072,#132
  67                     ; 73     TIM1->CR2 = 0x20;
  69  0006 35205251      	mov	21073,#32
  70                     ; 77 		period = ((((uint32_t)INPUT_FREQ_TIM1_FOR_ADC)/loggerCfg.sampFreq)/GetChannelNo());
  72  000a cd00eb        	call	L71_GetChannelNo
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
 108                     ; 78     TIM1->ARRH = (uint8_t)((period&0xff00)>>8);
 110  0044 7b0b          	ld	a,(OFST-1,sp)
 111  0046 c75262        	ld	21090,a
 112                     ; 79     TIM1->ARRL = (uint8_t)(period&0xff);
 114  0049 7b0c          	ld	a,(OFST+0,sp)
 115  004b c75263        	ld	21091,a
 116                     ; 80 		TIM1->EGR |= TIM1_EGR_UG;
 118  004e 72105257      	bset	21079,#0
 119                     ; 81     TIM1->CR1 |= TIM1_CR1_CEN;
 121  0052 72105250      	bset	21072,#0
 122                     ; 82 }
 125  0056 5b0c          	addw	sp,#12
 126  0058 81            	ret	
 156                     ; 93 void adcInit( void )
 156                     ; 94 {
 157                     	switch	.text
 158  0059               _adcInit:
 162                     ; 95     cnter = 0x00;
 164  0059 5f            	clrw	x
 165  005a bf00          	ldw	L3_cnter,x
 166                     ; 96     pCurrBuffer = adcBuffer0;
 168  005c ae0104        	ldw	x,#_adcBuffer0
 169  005f cf0002        	ldw	L5_pCurrBuffer,x
 170                     ; 97 		pCurrWord = adcBuffer0;
 172  0062 cf0000        	ldw	L7_pCurrWord,x
 173                     ; 98     buffer_rdy = 0x00; //nenhum buffers are ready
 175  0065 3f02          	clr	_buffer_rdy
 176                     ; 100     ADC1->CR1 = 0x20;
 178  0067 35205401      	mov	21505,#32
 179                     ; 103     ADC1->CSR = NextChannel()|ADC1_CSR_EOCIE;
 181  006b ad4d          	call	L51_NextChannel
 183  006d aa20          	or	a,#32
 184  006f c75400        	ld	21504,a
 185                     ; 105     ADC1->CR2 = (ADC1_CR2_EXTTRIG | ADC1_CR2_ALIGN);
 187  0072 35485402      	mov	21506,#72
 188                     ; 107     ADC1->CR3 = ADC1_CR3_DBUF;
 190  0076 35805403      	mov	21507,#128
 191                     ; 109     ADC1->TDRL = 0x1f;
 193  007a 351f5407      	mov	21511,#31
 194                     ; 111     ADC1->CR1 |= ADC1_CR1_ADON;
 196  007e 72105401      	bset	21505,#0
 197                     ; 113     tim1Init();
 200                     ; 114 }
 203  0082 cc0000        	jp	L12_tim1Init
 232                     ; 127 static void nextWord()
 232                     ; 128 {
 233                     	switch	.text
 234  0085               L31_nextWord:
 238                     ; 129     INC(cnter);
 240  0085 be00          	ldw	x,L3_cnter
 241  0087 a3007f        	cpw	x,#127
 242  008a 2603          	jrne	L02
 243  008c 5f            	clrw	x
 244  008d 2001          	jra	L22
 245  008f               L02:
 246  008f 5c            	incw	x
 247  0090               L22:
 248  0090 bf00          	ldw	L3_cnter,x
 249                     ; 131     if(cnter == 0){ //an overflow occurred
 251  0092 261d          	jrne	L56
 252                     ; 133 			if(pCurrBuffer == adcBuffer0) {
 254  0094 ce0002        	ldw	x,L5_pCurrBuffer
 255  0097 a30104        	cpw	x,#_adcBuffer0
 256  009a 2609          	jrne	L76
 257                     ; 134         RELEASE_BUFF_FOR_RD(0);
 259  009c 72100002      	bset	_buffer_rdy,#0
 260                     ; 135 				pCurrBuffer = adcBuffer1;
 262  00a0 ae0004        	ldw	x,#_adcBuffer1
 263                     ; 136         pCurrWord = adcBuffer1;
 265  00a3 2007          	jp	LC001
 266  00a5               L76:
 267                     ; 138 				RELEASE_BUFF_FOR_RD(1);
 269  00a5 72120002      	bset	_buffer_rdy,#1
 270                     ; 139 				pCurrBuffer = adcBuffer0;
 272  00a9 ae0104        	ldw	x,#_adcBuffer0
 273  00ac               LC001:
 274  00ac cf0002        	ldw	L5_pCurrBuffer,x
 275                     ; 140 				pCurrWord =  adcBuffer0;
 276  00af 2005          	jra	L37
 277  00b1               L56:
 278                     ; 143         pCurrWord = &pCurrBuffer[cnter];
 280  00b1 58            	sllw	x
 281  00b2 72bb0002      	addw	x,L5_pCurrBuffer
 282  00b6               L37:
 285  00b6 cf0000        	ldw	L7_pCurrWord,x
 286                     ; 145 }
 289  00b9 81            	ret	
 292                     	switch	.data
 293  0000               L57_cntForChannel:
 294  0000 08            	dc.b	8
 325                     ; 159 static uint8_t NextChannel(void){
 326                     	switch	.text
 327  00ba               L51_NextChannel:
 329  00ba 89            	pushw	x
 330       00000002      OFST:	set	2
 333  00bb               L311:
 334                     ; 163 		cntForChannel = ((8==cntForChannel)?0:(cntForChannel+1));
 336  00bb c60000        	ld	a,L57_cntForChannel
 337  00be a108          	cp	a,#8
 338  00c0 2603          	jrne	L62
 339  00c2 4f            	clr	a
 340  00c3 2001          	jra	L03
 341  00c5               L62:
 342  00c5 4c            	inc	a
 343  00c6               L03:
 344  00c6 c70000        	ld	L57_cntForChannel,a
 345                     ; 164 		if((0x01 << cntForChannel) & loggerCfg.channel){
 347  00c9 5f            	clrw	x
 348  00ca c6000d        	ld	a,_loggerCfg+13
 349  00cd 97            	ld	xl,a
 350  00ce 1f01          	ldw	(OFST-1,sp),x
 352  00d0 ae0001        	ldw	x,#1
 353  00d3 c60000        	ld	a,L57_cntForChannel
 354  00d6 2704          	jreq	L23
 355  00d8               L43:
 356  00d8 58            	sllw	x
 357  00d9 4a            	dec	a
 358  00da 26fc          	jrne	L43
 359  00dc               L23:
 360  00dc 01            	rrwa	x,a
 361  00dd 1402          	and	a,(OFST+0,sp)
 362  00df 01            	rrwa	x,a
 363  00e0 1401          	and	a,(OFST-1,sp)
 364  00e2 01            	rrwa	x,a
 365  00e3 5d            	tnzw	x
 366  00e4 27d5          	jreq	L311
 367                     ; 166 			return cntForChannel;
 369  00e6 c60000        	ld	a,L57_cntForChannel
 372  00e9 85            	popw	x
 373  00ea 81            	ret	
 413                     ; 182 static uint8_t GetChannelNo(void){
 414                     	switch	.text
 415  00eb               L71_GetChannelNo:
 417  00eb 5204          	subw	sp,#4
 418       00000004      OFST:	set	4
 421                     ; 183 	uint8_t cnt, chNo = 0;
 423  00ed 0f03          	clr	(OFST-1,sp)
 425                     ; 185 	for(cnt = 0; cnt < 8; cnt++){
 427  00ef 0f04          	clr	(OFST+0,sp)
 429  00f1               L731:
 430                     ; 186 		if((0x01 << cnt) & loggerCfg.channel){
 432  00f1 c6000d        	ld	a,_loggerCfg+13
 433  00f4 5f            	clrw	x
 434  00f5 97            	ld	xl,a
 435  00f6 1f01          	ldw	(OFST-3,sp),x
 437  00f8 ae0001        	ldw	x,#1
 438  00fb 7b04          	ld	a,(OFST+0,sp)
 439  00fd 2704          	jreq	L04
 440  00ff               L24:
 441  00ff 58            	sllw	x
 442  0100 4a            	dec	a
 443  0101 26fc          	jrne	L24
 444  0103               L04:
 445  0103 01            	rrwa	x,a
 446  0104 1402          	and	a,(OFST-2,sp)
 447  0106 01            	rrwa	x,a
 448  0107 1401          	and	a,(OFST-3,sp)
 449  0109 01            	rrwa	x,a
 450  010a 5d            	tnzw	x
 451  010b 2702          	jreq	L541
 452                     ; 187 			chNo++;
 454  010d 0c03          	inc	(OFST-1,sp)
 456  010f               L541:
 457                     ; 185 	for(cnt = 0; cnt < 8; cnt++){
 459  010f 0c04          	inc	(OFST+0,sp)
 463  0111 7b04          	ld	a,(OFST+0,sp)
 464  0113 a108          	cp	a,#8
 465  0115 25da          	jrult	L731
 466                     ; 190 	return chNo;
 468  0117 7b03          	ld	a,(OFST-1,sp)
 471  0119 5b04          	addw	sp,#4
 472  011b 81            	ret	
 514                     ; 249 @far @interrupt void adcIsr (void)
 514                     ; 250 {
 516                     	switch	.text
 517  011c               f_adcIsr:
 519  011c 8a            	push	cc
 520  011d 84            	pop	a
 521  011e a4bf          	and	a,#191
 522  0120 88            	push	a
 523  0121 86            	pop	cc
 524       00000003      OFST:	set	3
 525  0122 3b0002        	push	c_x+2
 526  0125 be00          	ldw	x,c_x
 527  0127 89            	pushw	x
 528  0128 3b0002        	push	c_y+2
 529  012b be00          	ldw	x,c_y
 530  012d 89            	pushw	x
 531  012e 5203          	subw	sp,#3
 534                     ; 254 		currChannel = NextChannel();
 536  0130 ad88          	call	L51_NextChannel
 538  0132 6b03          	ld	(OFST+0,sp),a
 540                     ; 256     tmp = ADC1->DRL;
 542  0134 c65405        	ld	a,21509
 543  0137 5f            	clrw	x
 544  0138 97            	ld	xl,a
 545  0139 1f01          	ldw	(OFST-2,sp),x
 547                     ; 257 		*pCurrWord = ADC1->DRH;
 549  013b c65404        	ld	a,21508
 550  013e 5f            	clrw	x
 551  013f 97            	ld	xl,a
 552  0140 72cf0000      	ldw	[L7_pCurrWord.w],x
 553                     ; 258 		*pCurrWord = tmp + ((*pCurrWord)<<8);
 555  0144 4f            	clr	a
 556  0145 02            	rlwa	x,a
 557  0146 72fb01        	addw	x,(OFST-2,sp)
 558  0149 72cf0000      	ldw	[L7_pCurrWord.w],x
 559                     ; 259     nextWord();
 561  014d cd0085        	call	L31_nextWord
 563                     ; 263 		ADC1->CSR = (currChannel|ADC1_CSR_EOCIE);
 565  0150 7b03          	ld	a,(OFST+0,sp)
 566  0152 aa20          	or	a,#32
 567  0154 c75400        	ld	21504,a
 568                     ; 265 }
 571  0157 5b03          	addw	sp,#3
 572  0159 85            	popw	x
 573  015a bf00          	ldw	c_y,x
 574  015c 320002        	pop	c_y+2
 575  015f 85            	popw	x
 576  0160 bf00          	ldw	c_x,x
 577  0162 320002        	pop	c_x+2
 578  0165 80            	iret	
 650                     	switch	.bss
 651  0000               L7_pCurrWord:
 652  0000 0000          	ds.b	2
 653  0002               L5_pCurrBuffer:
 654  0002 0000          	ds.b	2
 655                     	switch	.ubsct
 656  0000               L3_cnter:
 657  0000 0000          	ds.b	2
 658                     	xref	_loggerCfg
 659                     	xdef	f_adcIsr
 660                     	xdef	_adcInit
 661  0002               _buffer_rdy:
 662  0002 00            	ds.b	1
 663                     	xdef	_buffer_rdy
 664                     	switch	.bss
 665  0004               _adcBuffer1:
 666  0004 000000000000  	ds.b	256
 667                     	xdef	_adcBuffer1
 668  0104               _adcBuffer0:
 669  0104 000000000000  	ds.b	256
 670                     	xdef	_adcBuffer0
 671                     	xref.b	c_lreg
 672                     	xref.b	c_x
 673                     	xref.b	c_y
 693                     	xref	c_ludv
 694                     	xref	c_rtol
 695                     	xref	c_uitolx
 696                     	end
