   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  44                     ; 67 void I2C_DeInit(void)
  44                     ; 68 {
  46                     	switch	.text
  47  0000               _I2C_DeInit:
  51                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  53  0000 725f5210      	clr	21008
  54                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  56  0004 725f5211      	clr	21009
  57                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  59  0008 725f5212      	clr	21010
  60                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  62  000c 725f5213      	clr	21011
  63                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  65  0010 725f5214      	clr	21012
  66                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  68  0014 725f521a      	clr	21018
  69                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  71  0018 725f521b      	clr	21019
  72                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  74  001c 725f521c      	clr	21020
  75                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  77  0020 3502521d      	mov	21021,#2
  78                     ; 78 }
  81  0024 81            	ret	
 249                     .const:	section	.text
 250  0000               L65:
 251  0000 00061a81      	dc.l	400001
 252  0004               L46:
 253  0004 000186a1      	dc.l	100001
 254  0008               L66:
 255  0008 000f4240      	dc.l	1000000
 256                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 256                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 256                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 256                     ; 99 {
 257                     	switch	.text
 258  0025               _I2C_Init:
 260  0025 5209          	subw	sp,#9
 261       00000009      OFST:	set	9
 264                     ; 100   uint16_t result = 0x0004;
 266                     ; 101   uint16_t tmpval = 0;
 268                     ; 102   uint8_t tmpccrh = 0;
 270  0027 0f07          	clr	(OFST-2,sp)
 272                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 274  0029 7b13          	ld	a,(OFST+10,sp)
 275  002b 2716          	jreq	L41
 276  002d a101          	cp	a,#1
 277  002f 2712          	jreq	L41
 278  0031 a102          	cp	a,#2
 279  0033 270e          	jreq	L41
 280  0035 ae0069        	ldw	x,#105
 281  0038 89            	pushw	x
 282  0039 5f            	clrw	x
 283  003a 89            	pushw	x
 284  003b ae000c        	ldw	x,#L511
 285  003e cd0000        	call	_assert_failed
 287  0041 5b04          	addw	sp,#4
 288  0043               L41:
 289                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 291  0043 7b14          	ld	a,(OFST+11,sp)
 292  0045 2712          	jreq	L42
 293  0047 a180          	cp	a,#128
 294  0049 270e          	jreq	L42
 295  004b ae006a        	ldw	x,#106
 296  004e 89            	pushw	x
 297  004f 5f            	clrw	x
 298  0050 89            	pushw	x
 299  0051 ae000c        	ldw	x,#L511
 300  0054 cd0000        	call	_assert_failed
 302  0057 5b04          	addw	sp,#4
 303  0059               L42:
 304                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 306  0059 1e10          	ldw	x,(OFST+7,sp)
 307  005b a30400        	cpw	x,#1024
 308  005e 250e          	jrult	L23
 309  0060 ae006b        	ldw	x,#107
 310  0063 89            	pushw	x
 311  0064 5f            	clrw	x
 312  0065 89            	pushw	x
 313  0066 ae000c        	ldw	x,#L511
 314  0069 cd0000        	call	_assert_failed
 316  006c 5b04          	addw	sp,#4
 317  006e               L23:
 318                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 320  006e 7b12          	ld	a,(OFST+9,sp)
 321  0070 2712          	jreq	L24
 322  0072 a140          	cp	a,#64
 323  0074 270e          	jreq	L24
 324  0076 ae006c        	ldw	x,#108
 325  0079 89            	pushw	x
 326  007a 5f            	clrw	x
 327  007b 89            	pushw	x
 328  007c ae000c        	ldw	x,#L511
 329  007f cd0000        	call	_assert_failed
 331  0082 5b04          	addw	sp,#4
 332  0084               L24:
 333                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 335  0084 7b15          	ld	a,(OFST+12,sp)
 336  0086 2704          	jreq	L64
 337  0088 a111          	cp	a,#17
 338  008a 250e          	jrult	L05
 339  008c               L64:
 340  008c ae006d        	ldw	x,#109
 341  008f 89            	pushw	x
 342  0090 5f            	clrw	x
 343  0091 89            	pushw	x
 344  0092 ae000c        	ldw	x,#L511
 345  0095 cd0000        	call	_assert_failed
 347  0098 5b04          	addw	sp,#4
 348  009a               L05:
 349                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 351  009a 96            	ldw	x,sp
 352  009b 1c000c        	addw	x,#OFST+3
 353  009e cd0000        	call	c_lzmp
 355  00a1 270f          	jreq	L45
 356  00a3 96            	ldw	x,sp
 357  00a4 1c000c        	addw	x,#OFST+3
 358  00a7 cd0000        	call	c_ltor
 360  00aa ae0000        	ldw	x,#L65
 361  00ad cd0000        	call	c_lcmp
 363  00b0 250e          	jrult	L06
 364  00b2               L45:
 365  00b2 ae006e        	ldw	x,#110
 366  00b5 89            	pushw	x
 367  00b6 5f            	clrw	x
 368  00b7 89            	pushw	x
 369  00b8 ae000c        	ldw	x,#L511
 370  00bb cd0000        	call	_assert_failed
 372  00be 5b04          	addw	sp,#4
 373  00c0               L06:
 374                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 376  00c0 c65212        	ld	a,21010
 377  00c3 a4c0          	and	a,#192
 378  00c5 c75212        	ld	21010,a
 379                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 381  00c8 c65212        	ld	a,21010
 382  00cb 1a15          	or	a,(OFST+12,sp)
 383  00cd c75212        	ld	21010,a
 384                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 386  00d0 72115210      	bres	21008,#0
 387                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 389  00d4 c6521c        	ld	a,21020
 390  00d7 a430          	and	a,#48
 391  00d9 c7521c        	ld	21020,a
 392                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 394  00dc 725f521b      	clr	21019
 395                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 397  00e0 96            	ldw	x,sp
 398  00e1 1c000c        	addw	x,#OFST+3
 399  00e4 cd0000        	call	c_ltor
 401  00e7 ae0004        	ldw	x,#L46
 402  00ea cd0000        	call	c_lcmp
 404  00ed 257c          	jrult	L711
 405                     ; 131     tmpccrh = I2C_CCRH_FS;
 407  00ef a680          	ld	a,#128
 408  00f1 6b07          	ld	(OFST-2,sp),a
 410                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 412  00f3 96            	ldw	x,sp
 413  00f4 0d12          	tnz	(OFST+9,sp)
 414  00f6 262b          	jrne	L121
 415                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 417  00f8 1c000c        	addw	x,#OFST+3
 418  00fb cd0000        	call	c_ltor
 420  00fe a603          	ld	a,#3
 421  0100 cd0000        	call	c_smul
 423  0103 96            	ldw	x,sp
 424  0104 5c            	incw	x
 425  0105 cd0000        	call	c_rtol
 428  0108 7b15          	ld	a,(OFST+12,sp)
 429  010a b703          	ld	c_lreg+3,a
 430  010c 3f02          	clr	c_lreg+2
 431  010e 3f01          	clr	c_lreg+1
 432  0110 3f00          	clr	c_lreg
 433  0112 ae0008        	ldw	x,#L66
 434  0115 cd0000        	call	c_lmul
 436  0118 96            	ldw	x,sp
 437  0119 5c            	incw	x
 438  011a cd0000        	call	c_ludv
 440  011d be02          	ldw	x,c_lreg+2
 441  011f 1f08          	ldw	(OFST-1,sp),x
 444  0121 202f          	jra	L321
 445  0123               L121:
 446                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 448  0123 1c000c        	addw	x,#OFST+3
 449  0126 cd0000        	call	c_ltor
 451  0129 a619          	ld	a,#25
 452  012b cd0000        	call	c_smul
 454  012e 96            	ldw	x,sp
 455  012f 5c            	incw	x
 456  0130 cd0000        	call	c_rtol
 459  0133 7b15          	ld	a,(OFST+12,sp)
 460  0135 b703          	ld	c_lreg+3,a
 461  0137 3f02          	clr	c_lreg+2
 462  0139 3f01          	clr	c_lreg+1
 463  013b 3f00          	clr	c_lreg
 464  013d ae0008        	ldw	x,#L66
 465  0140 cd0000        	call	c_lmul
 467  0143 96            	ldw	x,sp
 468  0144 5c            	incw	x
 469  0145 cd0000        	call	c_ludv
 471  0148 be02          	ldw	x,c_lreg+2
 472  014a 1f08          	ldw	(OFST-1,sp),x
 474                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 476  014c 7b07          	ld	a,(OFST-2,sp)
 477  014e aa40          	or	a,#64
 478  0150 6b07          	ld	(OFST-2,sp),a
 480  0152               L321:
 481                     ; 147     if (result < (uint16_t)0x01)
 483  0152 1e08          	ldw	x,(OFST-1,sp)
 484  0154 2603          	jrne	L521
 485                     ; 150       result = (uint16_t)0x0001;
 487  0156 5c            	incw	x
 488  0157 1f08          	ldw	(OFST-1,sp),x
 490  0159               L521:
 491                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 493  0159 7b15          	ld	a,(OFST+12,sp)
 494  015b 97            	ld	xl,a
 495  015c a603          	ld	a,#3
 496  015e 42            	mul	x,a
 497  015f a60a          	ld	a,#10
 498  0161 cd0000        	call	c_sdivx
 500  0164 5c            	incw	x
 501  0165 1f05          	ldw	(OFST-4,sp),x
 503                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 505  0167 7b06          	ld	a,(OFST-3,sp)
 507  0169 2038          	jra	L721
 508  016b               L711:
 509                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 511  016b 96            	ldw	x,sp
 512  016c 1c000c        	addw	x,#OFST+3
 513  016f cd0000        	call	c_ltor
 515  0172 3803          	sll	c_lreg+3
 516  0174 3902          	rlc	c_lreg+2
 517  0176 3901          	rlc	c_lreg+1
 518  0178 96            	ldw	x,sp
 519  0179 3900          	rlc	c_lreg
 520  017b 5c            	incw	x
 521  017c cd0000        	call	c_rtol
 524  017f 7b15          	ld	a,(OFST+12,sp)
 525  0181 b703          	ld	c_lreg+3,a
 526  0183 3f02          	clr	c_lreg+2
 527  0185 3f01          	clr	c_lreg+1
 528  0187 3f00          	clr	c_lreg
 529  0189 ae0008        	ldw	x,#L66
 530  018c cd0000        	call	c_lmul
 532  018f 96            	ldw	x,sp
 533  0190 5c            	incw	x
 534  0191 cd0000        	call	c_ludv
 536  0194 be02          	ldw	x,c_lreg+2
 538                     ; 167     if (result < (uint16_t)0x0004)
 540  0196 a30004        	cpw	x,#4
 541  0199 2403          	jruge	L131
 542                     ; 170       result = (uint16_t)0x0004;
 544  019b ae0004        	ldw	x,#4
 546  019e               L131:
 547  019e 1f08          	ldw	(OFST-1,sp),x
 548                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 550  01a0 7b15          	ld	a,(OFST+12,sp)
 551  01a2 4c            	inc	a
 552  01a3               L721:
 553  01a3 c7521d        	ld	21021,a
 554                     ; 181   I2C->CCRL = (uint8_t)result;
 556  01a6 7b09          	ld	a,(OFST+0,sp)
 557  01a8 c7521b        	ld	21019,a
 558                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 560  01ab 7b08          	ld	a,(OFST-1,sp)
 561  01ad a40f          	and	a,#15
 562  01af 1a07          	or	a,(OFST-2,sp)
 563  01b1 c7521c        	ld	21020,a
 564                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 566  01b4 72105210      	bset	21008,#0
 567                     ; 188   I2C_AcknowledgeConfig(Ack);
 569  01b8 7b13          	ld	a,(OFST+10,sp)
 570  01ba cd02b7        	call	_I2C_AcknowledgeConfig
 572                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 574  01bd 7b11          	ld	a,(OFST+8,sp)
 575  01bf c75213        	ld	21011,a
 576                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 576                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 578  01c2 1e10          	ldw	x,(OFST+7,sp)
 579  01c4 4f            	clr	a
 580  01c5 01            	rrwa	x,a
 581  01c6 48            	sll	a
 582  01c7 01            	rrwa	x,a
 583  01c8 49            	rlc	a
 584  01c9 a406          	and	a,#6
 585  01cb 6b04          	ld	(OFST-5,sp),a
 587  01cd 7b14          	ld	a,(OFST+11,sp)
 588  01cf aa40          	or	a,#64
 589  01d1 1a04          	or	a,(OFST-5,sp)
 590  01d3 c75214        	ld	21012,a
 591                     ; 194 }
 594  01d6 5b09          	addw	sp,#9
 595  01d8 81            	ret	
 651                     ; 202 void I2C_Cmd(FunctionalState NewState)
 651                     ; 203 {
 652                     	switch	.text
 653  01d9               _I2C_Cmd:
 655  01d9 88            	push	a
 656       00000000      OFST:	set	0
 659                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 661  01da 4d            	tnz	a
 662  01db 2711          	jreq	L001
 663  01dd 4a            	dec	a
 664  01de 270e          	jreq	L001
 665  01e0 ae00cd        	ldw	x,#205
 666  01e3 89            	pushw	x
 667  01e4 5f            	clrw	x
 668  01e5 89            	pushw	x
 669  01e6 ae000c        	ldw	x,#L511
 670  01e9 cd0000        	call	_assert_failed
 672  01ec 5b04          	addw	sp,#4
 673  01ee               L001:
 674                     ; 207   if (NewState != DISABLE)
 676  01ee 7b01          	ld	a,(OFST+1,sp)
 677  01f0 2706          	jreq	L161
 678                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 680  01f2 72105210      	bset	21008,#0
 682  01f6 2004          	jra	L361
 683  01f8               L161:
 684                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 686  01f8 72115210      	bres	21008,#0
 687  01fc               L361:
 688                     ; 217 }
 691  01fc 84            	pop	a
 692  01fd 81            	ret	
 728                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 728                     ; 226 {
 729                     	switch	.text
 730  01fe               _I2C_GeneralCallCmd:
 732  01fe 88            	push	a
 733       00000000      OFST:	set	0
 736                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 738  01ff 4d            	tnz	a
 739  0200 2711          	jreq	L211
 740  0202 4a            	dec	a
 741  0203 270e          	jreq	L211
 742  0205 ae00e4        	ldw	x,#228
 743  0208 89            	pushw	x
 744  0209 5f            	clrw	x
 745  020a 89            	pushw	x
 746  020b ae000c        	ldw	x,#L511
 747  020e cd0000        	call	_assert_failed
 749  0211 5b04          	addw	sp,#4
 750  0213               L211:
 751                     ; 230   if (NewState != DISABLE)
 753  0213 7b01          	ld	a,(OFST+1,sp)
 754  0215 2706          	jreq	L302
 755                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 757  0217 721c5210      	bset	21008,#6
 759  021b 2004          	jra	L502
 760  021d               L302:
 761                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 763  021d 721d5210      	bres	21008,#6
 764  0221               L502:
 765                     ; 240 }
 768  0221 84            	pop	a
 769  0222 81            	ret	
 805                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 805                     ; 251 {
 806                     	switch	.text
 807  0223               _I2C_GenerateSTART:
 809  0223 88            	push	a
 810       00000000      OFST:	set	0
 813                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 815  0224 4d            	tnz	a
 816  0225 2711          	jreq	L421
 817  0227 4a            	dec	a
 818  0228 270e          	jreq	L421
 819  022a ae00fd        	ldw	x,#253
 820  022d 89            	pushw	x
 821  022e 5f            	clrw	x
 822  022f 89            	pushw	x
 823  0230 ae000c        	ldw	x,#L511
 824  0233 cd0000        	call	_assert_failed
 826  0236 5b04          	addw	sp,#4
 827  0238               L421:
 828                     ; 255   if (NewState != DISABLE)
 830  0238 7b01          	ld	a,(OFST+1,sp)
 831  023a 2706          	jreq	L522
 832                     ; 258     I2C->CR2 |= I2C_CR2_START;
 834  023c 72105211      	bset	21009,#0
 836  0240 2004          	jra	L722
 837  0242               L522:
 838                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 840  0242 72115211      	bres	21009,#0
 841  0246               L722:
 842                     ; 265 }
 845  0246 84            	pop	a
 846  0247 81            	ret	
 882                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 882                     ; 274 {
 883                     	switch	.text
 884  0248               _I2C_GenerateSTOP:
 886  0248 88            	push	a
 887       00000000      OFST:	set	0
 890                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 892  0249 4d            	tnz	a
 893  024a 2711          	jreq	L631
 894  024c 4a            	dec	a
 895  024d 270e          	jreq	L631
 896  024f ae0114        	ldw	x,#276
 897  0252 89            	pushw	x
 898  0253 5f            	clrw	x
 899  0254 89            	pushw	x
 900  0255 ae000c        	ldw	x,#L511
 901  0258 cd0000        	call	_assert_failed
 903  025b 5b04          	addw	sp,#4
 904  025d               L631:
 905                     ; 278   if (NewState != DISABLE)
 907  025d 7b01          	ld	a,(OFST+1,sp)
 908  025f 2706          	jreq	L742
 909                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 911  0261 72125211      	bset	21009,#1
 913  0265 2004          	jra	L152
 914  0267               L742:
 915                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 917  0267 72135211      	bres	21009,#1
 918  026b               L152:
 919                     ; 288 }
 922  026b 84            	pop	a
 923  026c 81            	ret	
 960                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 960                     ; 297 {
 961                     	switch	.text
 962  026d               _I2C_SoftwareResetCmd:
 964  026d 88            	push	a
 965       00000000      OFST:	set	0
 968                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 970  026e 4d            	tnz	a
 971  026f 2711          	jreq	L051
 972  0271 4a            	dec	a
 973  0272 270e          	jreq	L051
 974  0274 ae012b        	ldw	x,#299
 975  0277 89            	pushw	x
 976  0278 5f            	clrw	x
 977  0279 89            	pushw	x
 978  027a ae000c        	ldw	x,#L511
 979  027d cd0000        	call	_assert_failed
 981  0280 5b04          	addw	sp,#4
 982  0282               L051:
 983                     ; 301   if (NewState != DISABLE)
 985  0282 7b01          	ld	a,(OFST+1,sp)
 986  0284 2706          	jreq	L172
 987                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 989  0286 721e5211      	bset	21009,#7
 991  028a 2004          	jra	L372
 992  028c               L172:
 993                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 995  028c 721f5211      	bres	21009,#7
 996  0290               L372:
 997                     ; 311 }
1000  0290 84            	pop	a
1001  0291 81            	ret	
1038                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
1038                     ; 321 {
1039                     	switch	.text
1040  0292               _I2C_StretchClockCmd:
1042  0292 88            	push	a
1043       00000000      OFST:	set	0
1046                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1048  0293 4d            	tnz	a
1049  0294 2711          	jreq	L261
1050  0296 4a            	dec	a
1051  0297 270e          	jreq	L261
1052  0299 ae0143        	ldw	x,#323
1053  029c 89            	pushw	x
1054  029d 5f            	clrw	x
1055  029e 89            	pushw	x
1056  029f ae000c        	ldw	x,#L511
1057  02a2 cd0000        	call	_assert_failed
1059  02a5 5b04          	addw	sp,#4
1060  02a7               L261:
1061                     ; 325   if (NewState != DISABLE)
1063  02a7 7b01          	ld	a,(OFST+1,sp)
1064  02a9 2706          	jreq	L313
1065                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1067  02ab 721f5210      	bres	21008,#7
1069  02af 2004          	jra	L513
1070  02b1               L313:
1071                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
1073  02b1 721e5210      	bset	21008,#7
1074  02b5               L513:
1075                     ; 336 }
1078  02b5 84            	pop	a
1079  02b6 81            	ret	
1116                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
1116                     ; 346 {
1117                     	switch	.text
1118  02b7               _I2C_AcknowledgeConfig:
1120  02b7 88            	push	a
1121       00000000      OFST:	set	0
1124                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
1126  02b8 4d            	tnz	a
1127  02b9 2716          	jreq	L471
1128  02bb a101          	cp	a,#1
1129  02bd 2712          	jreq	L471
1130  02bf a102          	cp	a,#2
1131  02c1 270e          	jreq	L471
1132  02c3 ae015c        	ldw	x,#348
1133  02c6 89            	pushw	x
1134  02c7 5f            	clrw	x
1135  02c8 89            	pushw	x
1136  02c9 ae000c        	ldw	x,#L511
1137  02cc cd0000        	call	_assert_failed
1139  02cf 5b04          	addw	sp,#4
1140  02d1               L471:
1141                     ; 350   if (Ack == I2C_ACK_NONE)
1143  02d1 7b01          	ld	a,(OFST+1,sp)
1144  02d3 2606          	jrne	L533
1145                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1147  02d5 72155211      	bres	21009,#2
1149  02d9 2011          	jra	L733
1150  02db               L533:
1151                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
1153  02db 72145211      	bset	21009,#2
1154                     ; 360     if (Ack == I2C_ACK_CURR)
1156  02df 4a            	dec	a
1157  02e0 2606          	jrne	L143
1158                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1160  02e2 72175211      	bres	21009,#3
1162  02e6 2004          	jra	L733
1163  02e8               L143:
1164                     ; 368       I2C->CR2 |= I2C_CR2_POS;
1166  02e8 72165211      	bset	21009,#3
1167  02ec               L733:
1168                     ; 371 }
1171  02ec 84            	pop	a
1172  02ed 81            	ret	
1245                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1245                     ; 382 {
1246                     	switch	.text
1247  02ee               _I2C_ITConfig:
1249  02ee 89            	pushw	x
1250       00000000      OFST:	set	0
1253                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1255  02ef 9e            	ld	a,xh
1256  02f0 4a            	dec	a
1257  02f1 272c          	jreq	L602
1258  02f3 9e            	ld	a,xh
1259  02f4 a102          	cp	a,#2
1260  02f6 2727          	jreq	L602
1261  02f8 9e            	ld	a,xh
1262  02f9 a104          	cp	a,#4
1263  02fb 2722          	jreq	L602
1264  02fd 9e            	ld	a,xh
1265  02fe a103          	cp	a,#3
1266  0300 271d          	jreq	L602
1267  0302 9e            	ld	a,xh
1268  0303 a105          	cp	a,#5
1269  0305 2718          	jreq	L602
1270  0307 9e            	ld	a,xh
1271  0308 a106          	cp	a,#6
1272  030a 2713          	jreq	L602
1273  030c 9e            	ld	a,xh
1274  030d a107          	cp	a,#7
1275  030f 270e          	jreq	L602
1276  0311 ae0180        	ldw	x,#384
1277  0314 89            	pushw	x
1278  0315 5f            	clrw	x
1279  0316 89            	pushw	x
1280  0317 ae000c        	ldw	x,#L511
1281  031a cd0000        	call	_assert_failed
1283  031d 5b04          	addw	sp,#4
1284  031f               L602:
1285                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1287  031f 7b02          	ld	a,(OFST+2,sp)
1288  0321 2711          	jreq	L612
1289  0323 4a            	dec	a
1290  0324 270e          	jreq	L612
1291  0326 ae0181        	ldw	x,#385
1292  0329 89            	pushw	x
1293  032a 5f            	clrw	x
1294  032b 89            	pushw	x
1295  032c ae000c        	ldw	x,#L511
1296  032f cd0000        	call	_assert_failed
1298  0332 5b04          	addw	sp,#4
1299  0334               L612:
1300                     ; 387   if (NewState != DISABLE)
1302  0334 7b02          	ld	a,(OFST+2,sp)
1303  0336 2707          	jreq	L104
1304                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1306  0338 c6521a        	ld	a,21018
1307  033b 1a01          	or	a,(OFST+1,sp)
1309  033d 2006          	jra	L304
1310  033f               L104:
1311                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1313  033f 7b01          	ld	a,(OFST+1,sp)
1314  0341 43            	cpl	a
1315  0342 c4521a        	and	a,21018
1316  0345               L304:
1317  0345 c7521a        	ld	21018,a
1318                     ; 397 }
1321  0348 85            	popw	x
1322  0349 81            	ret	
1359                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1359                     ; 406 {
1360                     	switch	.text
1361  034a               _I2C_FastModeDutyCycleConfig:
1363  034a 88            	push	a
1364       00000000      OFST:	set	0
1367                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1369  034b 4d            	tnz	a
1370  034c 2712          	jreq	L032
1371  034e a140          	cp	a,#64
1372  0350 270e          	jreq	L032
1373  0352 ae0198        	ldw	x,#408
1374  0355 89            	pushw	x
1375  0356 5f            	clrw	x
1376  0357 89            	pushw	x
1377  0358 ae000c        	ldw	x,#L511
1378  035b cd0000        	call	_assert_failed
1380  035e 5b04          	addw	sp,#4
1381  0360               L032:
1382                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1384  0360 7b01          	ld	a,(OFST+1,sp)
1385  0362 a140          	cp	a,#64
1386  0364 2606          	jrne	L324
1387                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1389  0366 721c521c      	bset	21020,#6
1391  036a 2004          	jra	L524
1392  036c               L324:
1393                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1395  036c 721d521c      	bres	21020,#6
1396  0370               L524:
1397                     ; 420 }
1400  0370 84            	pop	a
1401  0371 81            	ret	
1424                     ; 427 uint8_t I2C_ReceiveData(void)
1424                     ; 428 {
1425                     	switch	.text
1426  0372               _I2C_ReceiveData:
1430                     ; 430   return ((uint8_t)I2C->DR);
1432  0372 c65216        	ld	a,21014
1435  0375 81            	ret	
1499                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1499                     ; 441 {
1500                     	switch	.text
1501  0376               _I2C_Send7bitAddress:
1503  0376 89            	pushw	x
1504       00000000      OFST:	set	0
1507                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1509  0377 9e            	ld	a,xh
1510  0378 a501          	bcp	a,#1
1511  037a 270e          	jreq	L242
1512  037c ae01bb        	ldw	x,#443
1513  037f 89            	pushw	x
1514  0380 5f            	clrw	x
1515  0381 89            	pushw	x
1516  0382 ae000c        	ldw	x,#L511
1517  0385 cd0000        	call	_assert_failed
1519  0388 5b04          	addw	sp,#4
1520  038a               L242:
1521                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1523  038a 7b02          	ld	a,(OFST+2,sp)
1524  038c 2711          	jreq	L252
1525  038e 4a            	dec	a
1526  038f 270e          	jreq	L252
1527  0391 ae01bc        	ldw	x,#444
1528  0394 89            	pushw	x
1529  0395 5f            	clrw	x
1530  0396 89            	pushw	x
1531  0397 ae000c        	ldw	x,#L511
1532  039a cd0000        	call	_assert_failed
1534  039d 5b04          	addw	sp,#4
1535  039f               L252:
1536                     ; 447   Address &= (uint8_t)0xFE;
1538  039f 7b01          	ld	a,(OFST+1,sp)
1539  03a1 a4fe          	and	a,#254
1540  03a3 6b01          	ld	(OFST+1,sp),a
1541                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1543  03a5 1a02          	or	a,(OFST+2,sp)
1544  03a7 c75216        	ld	21014,a
1545                     ; 451 }
1548  03aa 85            	popw	x
1549  03ab 81            	ret	
1581                     ; 458 void I2C_SendData(uint8_t Data)
1581                     ; 459 {
1582                     	switch	.text
1583  03ac               _I2C_SendData:
1587                     ; 461   I2C->DR = Data;
1589  03ac c75216        	ld	21014,a
1590                     ; 462 }
1593  03af 81            	ret	
1814                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1814                     ; 579 {
1815                     	switch	.text
1816  03b0               _I2C_CheckEvent:
1818  03b0 89            	pushw	x
1819  03b1 5206          	subw	sp,#6
1820       00000006      OFST:	set	6
1823                     ; 580   __IO uint16_t lastevent = 0x00;
1825  03b3 5f            	clrw	x
1826  03b4 1f04          	ldw	(OFST-2,sp),x
1828                     ; 581   uint8_t flag1 = 0x00 ;
1830                     ; 582   uint8_t flag2 = 0x00;
1832                     ; 583   ErrorStatus status = ERROR;
1834                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1836  03b6 1e07          	ldw	x,(OFST+1,sp)
1837  03b8 a30682        	cpw	x,#1666
1838  03bb 275b          	jreq	L662
1839  03bd a30202        	cpw	x,#514
1840  03c0 2756          	jreq	L662
1841  03c2 a31200        	cpw	x,#4608
1842  03c5 2751          	jreq	L662
1843  03c7 a30240        	cpw	x,#576
1844  03ca 274c          	jreq	L662
1845  03cc a30350        	cpw	x,#848
1846  03cf 2747          	jreq	L662
1847  03d1 a30684        	cpw	x,#1668
1848  03d4 2742          	jreq	L662
1849  03d6 a30794        	cpw	x,#1940
1850  03d9 273d          	jreq	L662
1851  03db a30004        	cpw	x,#4
1852  03de 2738          	jreq	L662
1853  03e0 a30010        	cpw	x,#16
1854  03e3 2733          	jreq	L662
1855  03e5 a30301        	cpw	x,#769
1856  03e8 272e          	jreq	L662
1857  03ea a30782        	cpw	x,#1922
1858  03ed 2729          	jreq	L662
1859  03ef a30302        	cpw	x,#770
1860  03f2 2724          	jreq	L662
1861  03f4 a30340        	cpw	x,#832
1862  03f7 271f          	jreq	L662
1863  03f9 a30784        	cpw	x,#1924
1864  03fc 271a          	jreq	L662
1865  03fe a30780        	cpw	x,#1920
1866  0401 2715          	jreq	L662
1867  0403 a30308        	cpw	x,#776
1868  0406 2710          	jreq	L662
1869  0408 ae024a        	ldw	x,#586
1870  040b 89            	pushw	x
1871  040c 5f            	clrw	x
1872  040d 89            	pushw	x
1873  040e ae000c        	ldw	x,#L511
1874  0411 cd0000        	call	_assert_failed
1876  0414 5b04          	addw	sp,#4
1877  0416 1e07          	ldw	x,(OFST+1,sp)
1878  0418               L662:
1879                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1881  0418 a30004        	cpw	x,#4
1882  041b 2609          	jrne	L706
1883                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1885  041d c65218        	ld	a,21016
1886  0420 a404          	and	a,#4
1887  0422 5f            	clrw	x
1888  0423 97            	ld	xl,a
1890  0424 201a          	jra	L116
1891  0426               L706:
1892                     ; 594     flag1 = I2C->SR1;
1894  0426 c65217        	ld	a,21015
1895  0429 6b03          	ld	(OFST-3,sp),a
1897                     ; 595     flag2 = I2C->SR3;
1899  042b c65219        	ld	a,21017
1900  042e 6b06          	ld	(OFST+0,sp),a
1902                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1904  0430 5f            	clrw	x
1905  0431 7b03          	ld	a,(OFST-3,sp)
1906  0433 97            	ld	xl,a
1907  0434 1f01          	ldw	(OFST-5,sp),x
1909  0436 5f            	clrw	x
1910  0437 7b06          	ld	a,(OFST+0,sp)
1911  0439 97            	ld	xl,a
1912  043a 7b02          	ld	a,(OFST-4,sp)
1913  043c 01            	rrwa	x,a
1914  043d 1a01          	or	a,(OFST-5,sp)
1915  043f 01            	rrwa	x,a
1916  0440               L116:
1917  0440 1f04          	ldw	(OFST-2,sp),x
1919                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1921  0442 1e04          	ldw	x,(OFST-2,sp)
1922  0444 01            	rrwa	x,a
1923  0445 1408          	and	a,(OFST+2,sp)
1924  0447 01            	rrwa	x,a
1925  0448 1407          	and	a,(OFST+1,sp)
1926  044a 01            	rrwa	x,a
1927  044b 1307          	cpw	x,(OFST+1,sp)
1928  044d 2604          	jrne	L316
1929                     ; 602     status = SUCCESS;
1931  044f a601          	ld	a,#1
1934  0451 2001          	jra	L516
1935  0453               L316:
1936                     ; 607     status = ERROR;
1938  0453 4f            	clr	a
1940  0454               L516:
1941                     ; 611   return status;
1945  0454 5b08          	addw	sp,#8
1946  0456 81            	ret	
1995                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1995                     ; 629 {
1996                     	switch	.text
1997  0457               _I2C_GetLastEvent:
1999  0457 5206          	subw	sp,#6
2000       00000006      OFST:	set	6
2003                     ; 630   __IO uint16_t lastevent = 0;
2005  0459 5f            	clrw	x
2006  045a 1f05          	ldw	(OFST-1,sp),x
2008                     ; 631   uint16_t flag1 = 0;
2010                     ; 632   uint16_t flag2 = 0;
2012                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
2014  045c 7205521805    	btjf	21016,#2,L146
2015                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
2017  0461 ae0004        	ldw	x,#4
2019  0464 2013          	jra	L346
2020  0466               L146:
2021                     ; 641     flag1 = I2C->SR1;
2023  0466 c65217        	ld	a,21015
2024  0469 97            	ld	xl,a
2025  046a 1f01          	ldw	(OFST-5,sp),x
2027                     ; 642     flag2 = I2C->SR3;
2029  046c c65219        	ld	a,21017
2030  046f 5f            	clrw	x
2031  0470 97            	ld	xl,a
2032  0471 1f03          	ldw	(OFST-3,sp),x
2034                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
2036  0473 7b02          	ld	a,(OFST-4,sp)
2037  0475 01            	rrwa	x,a
2038  0476 1a01          	or	a,(OFST-5,sp)
2039  0478 01            	rrwa	x,a
2040  0479               L346:
2041  0479 1f05          	ldw	(OFST-1,sp),x
2043                     ; 648   return (I2C_Event_TypeDef)lastevent;
2045  047b 1e05          	ldw	x,(OFST-1,sp)
2048  047d 5b06          	addw	sp,#6
2049  047f 81            	ret	
2261                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
2261                     ; 680 {
2262                     	switch	.text
2263  0480               _I2C_GetFlagStatus:
2265  0480 89            	pushw	x
2266  0481 89            	pushw	x
2267       00000002      OFST:	set	2
2270                     ; 681   uint8_t tempreg = 0;
2272  0482 0f02          	clr	(OFST+0,sp)
2274                     ; 682   uint8_t regindex = 0;
2276                     ; 683   FlagStatus bitstatus = RESET;
2278                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
2280  0484 a30180        	cpw	x,#384
2281  0487 2759          	jreq	L203
2282  0489 a30140        	cpw	x,#320
2283  048c 2754          	jreq	L203
2284  048e a30110        	cpw	x,#272
2285  0491 274f          	jreq	L203
2286  0493 a30108        	cpw	x,#264
2287  0496 274a          	jreq	L203
2288  0498 a30104        	cpw	x,#260
2289  049b 2745          	jreq	L203
2290  049d a30102        	cpw	x,#258
2291  04a0 2740          	jreq	L203
2292  04a2 a30101        	cpw	x,#257
2293  04a5 273b          	jreq	L203
2294  04a7 a30220        	cpw	x,#544
2295  04aa 2736          	jreq	L203
2296  04ac a30208        	cpw	x,#520
2297  04af 2731          	jreq	L203
2298  04b1 a30204        	cpw	x,#516
2299  04b4 272c          	jreq	L203
2300  04b6 a30202        	cpw	x,#514
2301  04b9 2727          	jreq	L203
2302  04bb a30201        	cpw	x,#513
2303  04be 2722          	jreq	L203
2304  04c0 a30310        	cpw	x,#784
2305  04c3 271d          	jreq	L203
2306  04c5 a30304        	cpw	x,#772
2307  04c8 2718          	jreq	L203
2308  04ca a30302        	cpw	x,#770
2309  04cd 2713          	jreq	L203
2310  04cf a30301        	cpw	x,#769
2311  04d2 270e          	jreq	L203
2312  04d4 ae02ae        	ldw	x,#686
2313  04d7 89            	pushw	x
2314  04d8 5f            	clrw	x
2315  04d9 89            	pushw	x
2316  04da ae000c        	ldw	x,#L511
2317  04dd cd0000        	call	_assert_failed
2319  04e0 5b04          	addw	sp,#4
2320  04e2               L203:
2321                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
2323  04e2 7b03          	ld	a,(OFST+1,sp)
2324  04e4 6b01          	ld	(OFST-1,sp),a
2326                     ; 691   switch (regindex)
2329                     ; 708     default:
2329                     ; 709       break;
2330  04e6 4a            	dec	a
2331  04e7 2708          	jreq	L546
2332  04e9 4a            	dec	a
2333  04ea 270a          	jreq	L746
2334  04ec 4a            	dec	a
2335  04ed 270c          	jreq	L156
2336  04ef 200f          	jra	L167
2337  04f1               L546:
2338                     ; 694     case 0x01:
2338                     ; 695       tempreg = (uint8_t)I2C->SR1;
2340  04f1 c65217        	ld	a,21015
2341                     ; 696       break;
2343  04f4 2008          	jp	LC001
2344  04f6               L746:
2345                     ; 699     case 0x02:
2345                     ; 700       tempreg = (uint8_t)I2C->SR2;
2347  04f6 c65218        	ld	a,21016
2348                     ; 701       break;
2350  04f9 2003          	jp	LC001
2351  04fb               L156:
2352                     ; 704     case 0x03:
2352                     ; 705       tempreg = (uint8_t)I2C->SR3;
2354  04fb c65219        	ld	a,21017
2355  04fe               LC001:
2356  04fe 6b02          	ld	(OFST+0,sp),a
2358                     ; 706       break;
2360                     ; 708     default:
2360                     ; 709       break;
2362  0500               L167:
2363                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2365  0500 7b04          	ld	a,(OFST+2,sp)
2366  0502 1502          	bcp	a,(OFST+0,sp)
2367  0504 2704          	jreq	L367
2368                     ; 716     bitstatus = SET;
2370  0506 a601          	ld	a,#1
2373  0508 2001          	jra	L567
2374  050a               L367:
2375                     ; 721     bitstatus = RESET;
2377  050a 4f            	clr	a
2379  050b               L567:
2380                     ; 724   return bitstatus;
2384  050b 5b04          	addw	sp,#4
2385  050d 81            	ret	
2428                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2428                     ; 760 {
2429                     	switch	.text
2430  050e               _I2C_ClearFlag:
2432  050e 89            	pushw	x
2433  050f 89            	pushw	x
2434       00000002      OFST:	set	2
2437                     ; 761   uint16_t flagpos = 0;
2439                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2441  0510 01            	rrwa	x,a
2442  0511 9f            	ld	a,xl
2443  0512 a4fd          	and	a,#253
2444  0514 97            	ld	xl,a
2445  0515 4f            	clr	a
2446  0516 02            	rlwa	x,a
2447  0517 5d            	tnzw	x
2448  0518 2604          	jrne	L013
2449  051a 1e03          	ldw	x,(OFST+1,sp)
2450  051c 260e          	jrne	L213
2451  051e               L013:
2452  051e ae02fb        	ldw	x,#763
2453  0521 89            	pushw	x
2454  0522 5f            	clrw	x
2455  0523 89            	pushw	x
2456  0524 ae000c        	ldw	x,#L511
2457  0527 cd0000        	call	_assert_failed
2459  052a 5b04          	addw	sp,#4
2460  052c               L213:
2461                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2463  052c 7b04          	ld	a,(OFST+2,sp)
2464  052e 5f            	clrw	x
2465  052f 02            	rlwa	x,a
2466  0530 1f01          	ldw	(OFST-1,sp),x
2468                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2470  0532 7b02          	ld	a,(OFST+0,sp)
2471  0534 43            	cpl	a
2472  0535 c75218        	ld	21016,a
2473                     ; 769 }
2476  0538 5b04          	addw	sp,#4
2477  053a 81            	ret	
2642                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2642                     ; 792 {
2643                     	switch	.text
2644  053b               _I2C_GetITStatus:
2646  053b 89            	pushw	x
2647  053c 5204          	subw	sp,#4
2648       00000004      OFST:	set	4
2651                     ; 793   ITStatus bitstatus = RESET;
2653                     ; 794   __IO uint8_t enablestatus = 0;
2655  053e 0f03          	clr	(OFST-1,sp)
2657                     ; 795   uint16_t tempregister = 0;
2659                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2661  0540 a31680        	cpw	x,#5760
2662  0543 2745          	jreq	L423
2663  0545 a31640        	cpw	x,#5696
2664  0548 2740          	jreq	L423
2665  054a a31210        	cpw	x,#4624
2666  054d 273b          	jreq	L423
2667  054f a31208        	cpw	x,#4616
2668  0552 2736          	jreq	L423
2669  0554 a31204        	cpw	x,#4612
2670  0557 2731          	jreq	L423
2671  0559 a31202        	cpw	x,#4610
2672  055c 272c          	jreq	L423
2673  055e a31201        	cpw	x,#4609
2674  0561 2727          	jreq	L423
2675  0563 a32220        	cpw	x,#8736
2676  0566 2722          	jreq	L423
2677  0568 a32108        	cpw	x,#8456
2678  056b 271d          	jreq	L423
2679  056d a32104        	cpw	x,#8452
2680  0570 2718          	jreq	L423
2681  0572 a32102        	cpw	x,#8450
2682  0575 2713          	jreq	L423
2683  0577 a32101        	cpw	x,#8449
2684  057a 270e          	jreq	L423
2685  057c ae031e        	ldw	x,#798
2686  057f 89            	pushw	x
2687  0580 5f            	clrw	x
2688  0581 89            	pushw	x
2689  0582 ae000c        	ldw	x,#L511
2690  0585 cd0000        	call	_assert_failed
2692  0588 5b04          	addw	sp,#4
2693  058a               L423:
2694                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2696  058a 7b05          	ld	a,(OFST+1,sp)
2697  058c a407          	and	a,#7
2698  058e 5f            	clrw	x
2699  058f 97            	ld	xl,a
2700  0590 1f01          	ldw	(OFST-3,sp),x
2702                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2704  0592 c6521a        	ld	a,21018
2705  0595 1402          	and	a,(OFST-2,sp)
2706  0597 6b03          	ld	(OFST-1,sp),a
2708                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2710  0599 7b05          	ld	a,(OFST+1,sp)
2711  059b a430          	and	a,#48
2712  059d 97            	ld	xl,a
2713  059e 4f            	clr	a
2714  059f 02            	rlwa	x,a
2715  05a0 a30100        	cpw	x,#256
2716  05a3 260d          	jrne	L3701
2717                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2719  05a5 c65217        	ld	a,21015
2720  05a8 1506          	bcp	a,(OFST+2,sp)
2721  05aa 2715          	jreq	L3011
2723  05ac 0d03          	tnz	(OFST-1,sp)
2724  05ae 2711          	jreq	L3011
2725                     ; 811       bitstatus = SET;
2727  05b0 200b          	jp	LC003
2728                     ; 816       bitstatus = RESET;
2729  05b2               L3701:
2730                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2732  05b2 c65218        	ld	a,21016
2733  05b5 1506          	bcp	a,(OFST+2,sp)
2734  05b7 2708          	jreq	L3011
2736  05b9 0d03          	tnz	(OFST-1,sp)
2737  05bb 2704          	jreq	L3011
2738                     ; 825       bitstatus = SET;
2740  05bd               LC003:
2742  05bd a601          	ld	a,#1
2745  05bf 2001          	jra	L1011
2746  05c1               L3011:
2747                     ; 830       bitstatus = RESET;
2750  05c1 4f            	clr	a
2752  05c2               L1011:
2753                     ; 834   return  bitstatus;
2757  05c2 5b06          	addw	sp,#6
2758  05c4 81            	ret	
2802                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2802                     ; 872 {
2803                     	switch	.text
2804  05c5               _I2C_ClearITPendingBit:
2806  05c5 89            	pushw	x
2807  05c6 89            	pushw	x
2808       00000002      OFST:	set	2
2811                     ; 873   uint16_t flagpos = 0;
2813                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2815  05c7 a32220        	cpw	x,#8736
2816  05ca 2722          	jreq	L633
2817  05cc a32108        	cpw	x,#8456
2818  05cf 271d          	jreq	L633
2819  05d1 a32104        	cpw	x,#8452
2820  05d4 2718          	jreq	L633
2821  05d6 a32102        	cpw	x,#8450
2822  05d9 2713          	jreq	L633
2823  05db a32101        	cpw	x,#8449
2824  05de 270e          	jreq	L633
2825  05e0 ae036c        	ldw	x,#876
2826  05e3 89            	pushw	x
2827  05e4 5f            	clrw	x
2828  05e5 89            	pushw	x
2829  05e6 ae000c        	ldw	x,#L511
2830  05e9 cd0000        	call	_assert_failed
2832  05ec 5b04          	addw	sp,#4
2833  05ee               L633:
2834                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2836  05ee 7b04          	ld	a,(OFST+2,sp)
2837  05f0 5f            	clrw	x
2838  05f1 02            	rlwa	x,a
2839  05f2 1f01          	ldw	(OFST-1,sp),x
2841                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2843  05f4 7b02          	ld	a,(OFST+0,sp)
2844  05f6 43            	cpl	a
2845  05f7 c75218        	ld	21016,a
2846                     ; 883 }
2849  05fa 5b04          	addw	sp,#4
2850  05fc 81            	ret	
2863                     	xdef	_I2C_ClearITPendingBit
2864                     	xdef	_I2C_GetITStatus
2865                     	xdef	_I2C_ClearFlag
2866                     	xdef	_I2C_GetFlagStatus
2867                     	xdef	_I2C_GetLastEvent
2868                     	xdef	_I2C_CheckEvent
2869                     	xdef	_I2C_SendData
2870                     	xdef	_I2C_Send7bitAddress
2871                     	xdef	_I2C_ReceiveData
2872                     	xdef	_I2C_ITConfig
2873                     	xdef	_I2C_FastModeDutyCycleConfig
2874                     	xdef	_I2C_AcknowledgeConfig
2875                     	xdef	_I2C_StretchClockCmd
2876                     	xdef	_I2C_SoftwareResetCmd
2877                     	xdef	_I2C_GenerateSTOP
2878                     	xdef	_I2C_GenerateSTART
2879                     	xdef	_I2C_GeneralCallCmd
2880                     	xdef	_I2C_Cmd
2881                     	xdef	_I2C_Init
2882                     	xdef	_I2C_DeInit
2883                     	xref	_assert_failed
2884                     	switch	.const
2885  000c               L511:
2886  000c 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
2887  001e 697665725c73  	dc.b	"iver\src\stm8s_i2c"
2888  0030 2e6300        	dc.b	".c",0
2889                     	xref.b	c_lreg
2890                     	xref.b	c_x
2910                     	xref	c_sdivx
2911                     	xref	c_ludv
2912                     	xref	c_rtol
2913                     	xref	c_smul
2914                     	xref	c_lmul
2915                     	xref	c_lcmp
2916                     	xref	c_ltor
2917                     	xref	c_lzmp
2918                     	end
