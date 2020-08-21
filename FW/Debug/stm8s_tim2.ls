   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  44                     ; 52 void TIM2_DeInit(void)
  44                     ; 53 {
  46                     	switch	.text
  47  0000               _TIM2_DeInit:
  51                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  53  0000 725f5300      	clr	21248
  54                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  56  0004 725f5303      	clr	21251
  57                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  59  0008 725f5305      	clr	21253
  60                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  62  000c 725f530a      	clr	21258
  63                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  65  0010 725f530b      	clr	21259
  66                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  68  0014 725f530a      	clr	21258
  69                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  71  0018 725f530b      	clr	21259
  72                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  74  001c 725f5307      	clr	21255
  75                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  77  0020 725f5308      	clr	21256
  78                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  80  0024 725f5309      	clr	21257
  81                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  83  0028 725f530c      	clr	21260
  84                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  86  002c 725f530d      	clr	21261
  87                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  89  0030 725f530e      	clr	21262
  90                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  92  0034 35ff530f      	mov	21263,#255
  93                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  95  0038 35ff5310      	mov	21264,#255
  96                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  98  003c 725f5311      	clr	21265
  99                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 101  0040 725f5312      	clr	21266
 102                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 104  0044 725f5313      	clr	21267
 105                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 107  0048 725f5314      	clr	21268
 108                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 110  004c 725f5315      	clr	21269
 111                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 113  0050 725f5316      	clr	21270
 114                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 116  0054 725f5304      	clr	21252
 117                     ; 81 }
 120  0058 81            	ret	
 286                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 286                     ; 90                         uint16_t TIM2_Period)
 286                     ; 91 {
 287                     	switch	.text
 288  0059               _TIM2_TimeBaseInit:
 290       ffffffff      OFST: set -1
 293                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 295  0059 c7530e        	ld	21262,a
 296                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 298  005c 7b03          	ld	a,(OFST+4,sp)
 299  005e c7530f        	ld	21263,a
 300                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 302  0061 7b04          	ld	a,(OFST+5,sp)
 303  0063 c75310        	ld	21264,a
 304                     ; 97 }
 307  0066 81            	ret	
 463                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 463                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 463                     ; 110                   uint16_t TIM2_Pulse,
 463                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 463                     ; 112 {
 464                     	switch	.text
 465  0067               _TIM2_OC1Init:
 467  0067 89            	pushw	x
 468  0068 88            	push	a
 469       00000001      OFST:	set	1
 472                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 474  0069 9e            	ld	a,xh
 475  006a 4d            	tnz	a
 476  006b 2727          	jreq	L61
 477  006d 9e            	ld	a,xh
 478  006e a110          	cp	a,#16
 479  0070 2722          	jreq	L61
 480  0072 9e            	ld	a,xh
 481  0073 a120          	cp	a,#32
 482  0075 271d          	jreq	L61
 483  0077 9e            	ld	a,xh
 484  0078 a130          	cp	a,#48
 485  007a 2718          	jreq	L61
 486  007c 9e            	ld	a,xh
 487  007d a160          	cp	a,#96
 488  007f 2713          	jreq	L61
 489  0081 9e            	ld	a,xh
 490  0082 a170          	cp	a,#112
 491  0084 270e          	jreq	L61
 492  0086 ae0072        	ldw	x,#114
 493  0089 89            	pushw	x
 494  008a 5f            	clrw	x
 495  008b 89            	pushw	x
 496  008c ae0000        	ldw	x,#L302
 497  008f cd0000        	call	_assert_failed
 499  0092 5b04          	addw	sp,#4
 500  0094               L61:
 501                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 503  0094 7b03          	ld	a,(OFST+2,sp)
 504  0096 2712          	jreq	L62
 505  0098 a111          	cp	a,#17
 506  009a 270e          	jreq	L62
 507  009c ae0073        	ldw	x,#115
 508  009f 89            	pushw	x
 509  00a0 5f            	clrw	x
 510  00a1 89            	pushw	x
 511  00a2 ae0000        	ldw	x,#L302
 512  00a5 cd0000        	call	_assert_failed
 514  00a8 5b04          	addw	sp,#4
 515  00aa               L62:
 516                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 518  00aa 7b08          	ld	a,(OFST+7,sp)
 519  00ac 2712          	jreq	L63
 520  00ae a122          	cp	a,#34
 521  00b0 270e          	jreq	L63
 522  00b2 ae0074        	ldw	x,#116
 523  00b5 89            	pushw	x
 524  00b6 5f            	clrw	x
 525  00b7 89            	pushw	x
 526  00b8 ae0000        	ldw	x,#L302
 527  00bb cd0000        	call	_assert_failed
 529  00be 5b04          	addw	sp,#4
 530  00c0               L63:
 531                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 533  00c0 c6530a        	ld	a,21258
 534  00c3 a4fc          	and	a,#252
 535  00c5 c7530a        	ld	21258,a
 536                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 536                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 538  00c8 7b08          	ld	a,(OFST+7,sp)
 539  00ca a402          	and	a,#2
 540  00cc 6b01          	ld	(OFST+0,sp),a
 542  00ce 7b03          	ld	a,(OFST+2,sp)
 543  00d0 a401          	and	a,#1
 544  00d2 1a01          	or	a,(OFST+0,sp)
 545  00d4 ca530a        	or	a,21258
 546  00d7 c7530a        	ld	21258,a
 547                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 547                     ; 126                           (uint8_t)TIM2_OCMode);
 549  00da c65307        	ld	a,21255
 550  00dd a48f          	and	a,#143
 551  00df 1a02          	or	a,(OFST+1,sp)
 552  00e1 c75307        	ld	21255,a
 553                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 555  00e4 7b06          	ld	a,(OFST+5,sp)
 556  00e6 c75311        	ld	21265,a
 557                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 559  00e9 7b07          	ld	a,(OFST+6,sp)
 560  00eb c75312        	ld	21266,a
 561                     ; 131 }
 564  00ee 5b03          	addw	sp,#3
 565  00f0 81            	ret	
 628                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 628                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 628                     ; 144                   uint16_t TIM2_Pulse,
 628                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 628                     ; 146 {
 629                     	switch	.text
 630  00f1               _TIM2_OC2Init:
 632  00f1 89            	pushw	x
 633  00f2 88            	push	a
 634       00000001      OFST:	set	1
 637                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 639  00f3 9e            	ld	a,xh
 640  00f4 4d            	tnz	a
 641  00f5 2727          	jreq	L05
 642  00f7 9e            	ld	a,xh
 643  00f8 a110          	cp	a,#16
 644  00fa 2722          	jreq	L05
 645  00fc 9e            	ld	a,xh
 646  00fd a120          	cp	a,#32
 647  00ff 271d          	jreq	L05
 648  0101 9e            	ld	a,xh
 649  0102 a130          	cp	a,#48
 650  0104 2718          	jreq	L05
 651  0106 9e            	ld	a,xh
 652  0107 a160          	cp	a,#96
 653  0109 2713          	jreq	L05
 654  010b 9e            	ld	a,xh
 655  010c a170          	cp	a,#112
 656  010e 270e          	jreq	L05
 657  0110 ae0094        	ldw	x,#148
 658  0113 89            	pushw	x
 659  0114 5f            	clrw	x
 660  0115 89            	pushw	x
 661  0116 ae0000        	ldw	x,#L302
 662  0119 cd0000        	call	_assert_failed
 664  011c 5b04          	addw	sp,#4
 665  011e               L05:
 666                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 668  011e 7b03          	ld	a,(OFST+2,sp)
 669  0120 2712          	jreq	L06
 670  0122 a111          	cp	a,#17
 671  0124 270e          	jreq	L06
 672  0126 ae0095        	ldw	x,#149
 673  0129 89            	pushw	x
 674  012a 5f            	clrw	x
 675  012b 89            	pushw	x
 676  012c ae0000        	ldw	x,#L302
 677  012f cd0000        	call	_assert_failed
 679  0132 5b04          	addw	sp,#4
 680  0134               L06:
 681                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 683  0134 7b08          	ld	a,(OFST+7,sp)
 684  0136 2712          	jreq	L07
 685  0138 a122          	cp	a,#34
 686  013a 270e          	jreq	L07
 687  013c ae0096        	ldw	x,#150
 688  013f 89            	pushw	x
 689  0140 5f            	clrw	x
 690  0141 89            	pushw	x
 691  0142 ae0000        	ldw	x,#L302
 692  0145 cd0000        	call	_assert_failed
 694  0148 5b04          	addw	sp,#4
 695  014a               L07:
 696                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 698  014a c6530a        	ld	a,21258
 699  014d a4cf          	and	a,#207
 700  014f c7530a        	ld	21258,a
 701                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 701                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 703  0152 7b08          	ld	a,(OFST+7,sp)
 704  0154 a420          	and	a,#32
 705  0156 6b01          	ld	(OFST+0,sp),a
 707  0158 7b03          	ld	a,(OFST+2,sp)
 708  015a a410          	and	a,#16
 709  015c 1a01          	or	a,(OFST+0,sp)
 710  015e ca530a        	or	a,21258
 711  0161 c7530a        	ld	21258,a
 712                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 712                     ; 162                           (uint8_t)TIM2_OCMode);
 714  0164 c65308        	ld	a,21256
 715  0167 a48f          	and	a,#143
 716  0169 1a02          	or	a,(OFST+1,sp)
 717  016b c75308        	ld	21256,a
 718                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 720  016e 7b06          	ld	a,(OFST+5,sp)
 721  0170 c75313        	ld	21267,a
 722                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 724  0173 7b07          	ld	a,(OFST+6,sp)
 725  0175 c75314        	ld	21268,a
 726                     ; 168 }
 729  0178 5b03          	addw	sp,#3
 730  017a 81            	ret	
 793                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 793                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 793                     ; 181                   uint16_t TIM2_Pulse,
 793                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 793                     ; 183 {
 794                     	switch	.text
 795  017b               _TIM2_OC3Init:
 797  017b 89            	pushw	x
 798  017c 88            	push	a
 799       00000001      OFST:	set	1
 802                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 804  017d 9e            	ld	a,xh
 805  017e 4d            	tnz	a
 806  017f 2727          	jreq	L201
 807  0181 9e            	ld	a,xh
 808  0182 a110          	cp	a,#16
 809  0184 2722          	jreq	L201
 810  0186 9e            	ld	a,xh
 811  0187 a120          	cp	a,#32
 812  0189 271d          	jreq	L201
 813  018b 9e            	ld	a,xh
 814  018c a130          	cp	a,#48
 815  018e 2718          	jreq	L201
 816  0190 9e            	ld	a,xh
 817  0191 a160          	cp	a,#96
 818  0193 2713          	jreq	L201
 819  0195 9e            	ld	a,xh
 820  0196 a170          	cp	a,#112
 821  0198 270e          	jreq	L201
 822  019a ae00b9        	ldw	x,#185
 823  019d 89            	pushw	x
 824  019e 5f            	clrw	x
 825  019f 89            	pushw	x
 826  01a0 ae0000        	ldw	x,#L302
 827  01a3 cd0000        	call	_assert_failed
 829  01a6 5b04          	addw	sp,#4
 830  01a8               L201:
 831                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 833  01a8 7b03          	ld	a,(OFST+2,sp)
 834  01aa 2712          	jreq	L211
 835  01ac a111          	cp	a,#17
 836  01ae 270e          	jreq	L211
 837  01b0 ae00ba        	ldw	x,#186
 838  01b3 89            	pushw	x
 839  01b4 5f            	clrw	x
 840  01b5 89            	pushw	x
 841  01b6 ae0000        	ldw	x,#L302
 842  01b9 cd0000        	call	_assert_failed
 844  01bc 5b04          	addw	sp,#4
 845  01be               L211:
 846                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 848  01be 7b08          	ld	a,(OFST+7,sp)
 849  01c0 2712          	jreq	L221
 850  01c2 a122          	cp	a,#34
 851  01c4 270e          	jreq	L221
 852  01c6 ae00bb        	ldw	x,#187
 853  01c9 89            	pushw	x
 854  01ca 5f            	clrw	x
 855  01cb 89            	pushw	x
 856  01cc ae0000        	ldw	x,#L302
 857  01cf cd0000        	call	_assert_failed
 859  01d2 5b04          	addw	sp,#4
 860  01d4               L221:
 861                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 863  01d4 c6530b        	ld	a,21259
 864  01d7 a4fc          	and	a,#252
 865  01d9 c7530b        	ld	21259,a
 866                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 866                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 868  01dc 7b08          	ld	a,(OFST+7,sp)
 869  01de a402          	and	a,#2
 870  01e0 6b01          	ld	(OFST+0,sp),a
 872  01e2 7b03          	ld	a,(OFST+2,sp)
 873  01e4 a401          	and	a,#1
 874  01e6 1a01          	or	a,(OFST+0,sp)
 875  01e8 ca530b        	or	a,21259
 876  01eb c7530b        	ld	21259,a
 877                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 877                     ; 196                           (uint8_t)TIM2_OCMode);
 879  01ee c65309        	ld	a,21257
 880  01f1 a48f          	and	a,#143
 881  01f3 1a02          	or	a,(OFST+1,sp)
 882  01f5 c75309        	ld	21257,a
 883                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 885  01f8 7b06          	ld	a,(OFST+5,sp)
 886  01fa c75315        	ld	21269,a
 887                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 889  01fd 7b07          	ld	a,(OFST+6,sp)
 890  01ff c75316        	ld	21270,a
 891                     ; 201 }
 894  0202 5b03          	addw	sp,#3
 895  0204 81            	ret	
1087                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1087                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1087                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1087                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1087                     ; 216                  uint8_t TIM2_ICFilter)
1087                     ; 217 {
1088                     	switch	.text
1089  0205               _TIM2_ICInit:
1091  0205 89            	pushw	x
1092       00000000      OFST:	set	0
1095                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1097  0206 9e            	ld	a,xh
1098  0207 4d            	tnz	a
1099  0208 2717          	jreq	L431
1100  020a 9e            	ld	a,xh
1101  020b 4a            	dec	a
1102  020c 2713          	jreq	L431
1103  020e 9e            	ld	a,xh
1104  020f a102          	cp	a,#2
1105  0211 270e          	jreq	L431
1106  0213 ae00db        	ldw	x,#219
1107  0216 89            	pushw	x
1108  0217 5f            	clrw	x
1109  0218 89            	pushw	x
1110  0219 ae0000        	ldw	x,#L302
1111  021c cd0000        	call	_assert_failed
1113  021f 5b04          	addw	sp,#4
1114  0221               L431:
1115                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1117  0221 7b02          	ld	a,(OFST+2,sp)
1118  0223 2712          	jreq	L441
1119  0225 a144          	cp	a,#68
1120  0227 270e          	jreq	L441
1121  0229 ae00dc        	ldw	x,#220
1122  022c 89            	pushw	x
1123  022d 5f            	clrw	x
1124  022e 89            	pushw	x
1125  022f ae0000        	ldw	x,#L302
1126  0232 cd0000        	call	_assert_failed
1128  0235 5b04          	addw	sp,#4
1129  0237               L441:
1130                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1132  0237 7b05          	ld	a,(OFST+5,sp)
1133  0239 a101          	cp	a,#1
1134  023b 2716          	jreq	L451
1135  023d a102          	cp	a,#2
1136  023f 2712          	jreq	L451
1137  0241 a103          	cp	a,#3
1138  0243 270e          	jreq	L451
1139  0245 ae00dd        	ldw	x,#221
1140  0248 89            	pushw	x
1141  0249 5f            	clrw	x
1142  024a 89            	pushw	x
1143  024b ae0000        	ldw	x,#L302
1144  024e cd0000        	call	_assert_failed
1146  0251 5b04          	addw	sp,#4
1147  0253               L451:
1148                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1150  0253 7b06          	ld	a,(OFST+6,sp)
1151  0255 271a          	jreq	L461
1152  0257 a104          	cp	a,#4
1153  0259 2716          	jreq	L461
1154  025b a108          	cp	a,#8
1155  025d 2712          	jreq	L461
1156  025f a10c          	cp	a,#12
1157  0261 270e          	jreq	L461
1158  0263 ae00de        	ldw	x,#222
1159  0266 89            	pushw	x
1160  0267 5f            	clrw	x
1161  0268 89            	pushw	x
1162  0269 ae0000        	ldw	x,#L302
1163  026c cd0000        	call	_assert_failed
1165  026f 5b04          	addw	sp,#4
1166  0271               L461:
1167                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
1169  0271 7b07          	ld	a,(OFST+7,sp)
1170  0273 a110          	cp	a,#16
1171  0275 250e          	jrult	L271
1172  0277 ae00df        	ldw	x,#223
1173  027a 89            	pushw	x
1174  027b 5f            	clrw	x
1175  027c 89            	pushw	x
1176  027d ae0000        	ldw	x,#L302
1177  0280 cd0000        	call	_assert_failed
1179  0283 5b04          	addw	sp,#4
1180  0285               L271:
1181                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
1183  0285 7b01          	ld	a,(OFST+1,sp)
1184  0287 2614          	jrne	L173
1185                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
1185                     ; 229                (uint8_t)TIM2_ICSelection,
1185                     ; 230                (uint8_t)TIM2_ICFilter);
1187  0289 7b07          	ld	a,(OFST+7,sp)
1188  028b 88            	push	a
1189  028c 7b06          	ld	a,(OFST+6,sp)
1190  028e 97            	ld	xl,a
1191  028f 7b03          	ld	a,(OFST+3,sp)
1192  0291 95            	ld	xh,a
1193  0292 cd0943        	call	L3_TI1_Config
1195  0295 84            	pop	a
1196                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1198  0296 7b06          	ld	a,(OFST+6,sp)
1199  0298 cd0783        	call	_TIM2_SetIC1Prescaler
1202  029b 2029          	jra	L373
1203  029d               L173:
1204                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
1206  029d 4a            	dec	a
1207  029e 2614          	jrne	L573
1208                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
1208                     ; 239                (uint8_t)TIM2_ICSelection,
1208                     ; 240                (uint8_t)TIM2_ICFilter);
1210  02a0 7b07          	ld	a,(OFST+7,sp)
1211  02a2 88            	push	a
1212  02a3 7b06          	ld	a,(OFST+6,sp)
1213  02a5 97            	ld	xl,a
1214  02a6 7b03          	ld	a,(OFST+3,sp)
1215  02a8 95            	ld	xh,a
1216  02a9 cd0973        	call	L5_TI2_Config
1218  02ac 84            	pop	a
1219                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1221  02ad 7b06          	ld	a,(OFST+6,sp)
1222  02af cd07ad        	call	_TIM2_SetIC2Prescaler
1225  02b2 2012          	jra	L373
1226  02b4               L573:
1227                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1227                     ; 249                (uint8_t)TIM2_ICSelection,
1227                     ; 250                (uint8_t)TIM2_ICFilter);
1229  02b4 7b07          	ld	a,(OFST+7,sp)
1230  02b6 88            	push	a
1231  02b7 7b06          	ld	a,(OFST+6,sp)
1232  02b9 97            	ld	xl,a
1233  02ba 7b03          	ld	a,(OFST+3,sp)
1234  02bc 95            	ld	xh,a
1235  02bd cd09a3        	call	L7_TI3_Config
1237  02c0 84            	pop	a
1238                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1240  02c1 7b06          	ld	a,(OFST+6,sp)
1241  02c3 cd07d7        	call	_TIM2_SetIC3Prescaler
1243  02c6               L373:
1244                     ; 255 }
1247  02c6 85            	popw	x
1248  02c7 81            	ret	
1339                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1339                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1339                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1339                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1339                     ; 270                      uint8_t TIM2_ICFilter)
1339                     ; 271 {
1340                     	switch	.text
1341  02c8               _TIM2_PWMIConfig:
1343  02c8 89            	pushw	x
1344  02c9 89            	pushw	x
1345       00000002      OFST:	set	2
1348                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1350                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1352                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1354  02ca 9e            	ld	a,xh
1355  02cb 4d            	tnz	a
1356  02cc 2712          	jreq	L022
1357  02ce 9e            	ld	a,xh
1358  02cf 4a            	dec	a
1359  02d0 270e          	jreq	L022
1360  02d2 ae0114        	ldw	x,#276
1361  02d5 89            	pushw	x
1362  02d6 5f            	clrw	x
1363  02d7 89            	pushw	x
1364  02d8 ae0000        	ldw	x,#L302
1365  02db cd0000        	call	_assert_failed
1367  02de 5b04          	addw	sp,#4
1368  02e0               L022:
1369                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1371  02e0 7b04          	ld	a,(OFST+2,sp)
1372  02e2 2712          	jreq	L032
1373  02e4 a144          	cp	a,#68
1374  02e6 270e          	jreq	L032
1375  02e8 ae0115        	ldw	x,#277
1376  02eb 89            	pushw	x
1377  02ec 5f            	clrw	x
1378  02ed 89            	pushw	x
1379  02ee ae0000        	ldw	x,#L302
1380  02f1 cd0000        	call	_assert_failed
1382  02f4 5b04          	addw	sp,#4
1383  02f6               L032:
1384                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1386  02f6 7b07          	ld	a,(OFST+5,sp)
1387  02f8 a101          	cp	a,#1
1388  02fa 2716          	jreq	L042
1389  02fc a102          	cp	a,#2
1390  02fe 2712          	jreq	L042
1391  0300 a103          	cp	a,#3
1392  0302 270e          	jreq	L042
1393  0304 ae0116        	ldw	x,#278
1394  0307 89            	pushw	x
1395  0308 5f            	clrw	x
1396  0309 89            	pushw	x
1397  030a ae0000        	ldw	x,#L302
1398  030d cd0000        	call	_assert_failed
1400  0310 5b04          	addw	sp,#4
1401  0312               L042:
1402                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1404  0312 7b08          	ld	a,(OFST+6,sp)
1405  0314 271a          	jreq	L052
1406  0316 a104          	cp	a,#4
1407  0318 2716          	jreq	L052
1408  031a a108          	cp	a,#8
1409  031c 2712          	jreq	L052
1410  031e a10c          	cp	a,#12
1411  0320 270e          	jreq	L052
1412  0322 ae0117        	ldw	x,#279
1413  0325 89            	pushw	x
1414  0326 5f            	clrw	x
1415  0327 89            	pushw	x
1416  0328 ae0000        	ldw	x,#L302
1417  032b cd0000        	call	_assert_failed
1419  032e 5b04          	addw	sp,#4
1420  0330               L052:
1421                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1423  0330 7b04          	ld	a,(OFST+2,sp)
1424  0332 a144          	cp	a,#68
1425  0334 2706          	jreq	L144
1426                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1428  0336 a644          	ld	a,#68
1429  0338 6b01          	ld	(OFST-1,sp),a
1432  033a 2002          	jra	L344
1433  033c               L144:
1434                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1436  033c 0f01          	clr	(OFST-1,sp)
1438  033e               L344:
1439                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1441  033e 7b07          	ld	a,(OFST+5,sp)
1442  0340 4a            	dec	a
1443  0341 2604          	jrne	L544
1444                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1446  0343 a602          	ld	a,#2
1448  0345 2002          	jra	L744
1449  0347               L544:
1450                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1452  0347 a601          	ld	a,#1
1453  0349               L744:
1454  0349 6b02          	ld	(OFST+0,sp),a
1456                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1458  034b 7b03          	ld	a,(OFST+1,sp)
1459  034d 2626          	jrne	L154
1460                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1460                     ; 305                (uint8_t)TIM2_ICFilter);
1462  034f 7b09          	ld	a,(OFST+7,sp)
1463  0351 88            	push	a
1464  0352 7b08          	ld	a,(OFST+6,sp)
1465  0354 97            	ld	xl,a
1466  0355 7b05          	ld	a,(OFST+3,sp)
1467  0357 95            	ld	xh,a
1468  0358 cd0943        	call	L3_TI1_Config
1470  035b 84            	pop	a
1471                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1473  035c 7b08          	ld	a,(OFST+6,sp)
1474  035e cd0783        	call	_TIM2_SetIC1Prescaler
1476                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1478  0361 7b09          	ld	a,(OFST+7,sp)
1479  0363 88            	push	a
1480  0364 7b03          	ld	a,(OFST+1,sp)
1481  0366 97            	ld	xl,a
1482  0367 7b02          	ld	a,(OFST+0,sp)
1483  0369 95            	ld	xh,a
1484  036a cd0973        	call	L5_TI2_Config
1486  036d 84            	pop	a
1487                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1489  036e 7b08          	ld	a,(OFST+6,sp)
1490  0370 cd07ad        	call	_TIM2_SetIC2Prescaler
1493  0373 2024          	jra	L354
1494  0375               L154:
1495                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1495                     ; 320                (uint8_t)TIM2_ICFilter);
1497  0375 7b09          	ld	a,(OFST+7,sp)
1498  0377 88            	push	a
1499  0378 7b08          	ld	a,(OFST+6,sp)
1500  037a 97            	ld	xl,a
1501  037b 7b05          	ld	a,(OFST+3,sp)
1502  037d 95            	ld	xh,a
1503  037e cd0973        	call	L5_TI2_Config
1505  0381 84            	pop	a
1506                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1508  0382 7b08          	ld	a,(OFST+6,sp)
1509  0384 cd07ad        	call	_TIM2_SetIC2Prescaler
1511                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1513  0387 7b09          	ld	a,(OFST+7,sp)
1514  0389 88            	push	a
1515  038a 7b03          	ld	a,(OFST+1,sp)
1516  038c 97            	ld	xl,a
1517  038d 7b02          	ld	a,(OFST+0,sp)
1518  038f 95            	ld	xh,a
1519  0390 cd0943        	call	L3_TI1_Config
1521  0393 84            	pop	a
1522                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1524  0394 7b08          	ld	a,(OFST+6,sp)
1525  0396 cd0783        	call	_TIM2_SetIC1Prescaler
1527  0399               L354:
1528                     ; 331 }
1531  0399 5b04          	addw	sp,#4
1532  039b 81            	ret	
1588                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1588                     ; 340 {
1589                     	switch	.text
1590  039c               _TIM2_Cmd:
1592  039c 88            	push	a
1593       00000000      OFST:	set	0
1596                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1598  039d 4d            	tnz	a
1599  039e 2711          	jreq	L203
1600  03a0 4a            	dec	a
1601  03a1 270e          	jreq	L203
1602  03a3 ae0156        	ldw	x,#342
1603  03a6 89            	pushw	x
1604  03a7 5f            	clrw	x
1605  03a8 89            	pushw	x
1606  03a9 ae0000        	ldw	x,#L302
1607  03ac cd0000        	call	_assert_failed
1609  03af 5b04          	addw	sp,#4
1610  03b1               L203:
1611                     ; 345   if (NewState != DISABLE)
1613  03b1 7b01          	ld	a,(OFST+1,sp)
1614  03b3 2706          	jreq	L305
1615                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1617  03b5 72105300      	bset	21248,#0
1619  03b9 2004          	jra	L505
1620  03bb               L305:
1621                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1623  03bb 72115300      	bres	21248,#0
1624  03bf               L505:
1625                     ; 353 }
1628  03bf 84            	pop	a
1629  03c0 81            	ret	
1709                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1709                     ; 369 {
1710                     	switch	.text
1711  03c1               _TIM2_ITConfig:
1713  03c1 89            	pushw	x
1714       00000000      OFST:	set	0
1717                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1719  03c2 9e            	ld	a,xh
1720  03c3 4d            	tnz	a
1721  03c4 2705          	jreq	L013
1722  03c6 9e            	ld	a,xh
1723  03c7 a110          	cp	a,#16
1724  03c9 250e          	jrult	L213
1725  03cb               L013:
1726  03cb ae0173        	ldw	x,#371
1727  03ce 89            	pushw	x
1728  03cf 5f            	clrw	x
1729  03d0 89            	pushw	x
1730  03d1 ae0000        	ldw	x,#L302
1731  03d4 cd0000        	call	_assert_failed
1733  03d7 5b04          	addw	sp,#4
1734  03d9               L213:
1735                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1737  03d9 7b02          	ld	a,(OFST+2,sp)
1738  03db 2711          	jreq	L223
1739  03dd 4a            	dec	a
1740  03de 270e          	jreq	L223
1741  03e0 ae0174        	ldw	x,#372
1742  03e3 89            	pushw	x
1743  03e4 5f            	clrw	x
1744  03e5 89            	pushw	x
1745  03e6 ae0000        	ldw	x,#L302
1746  03e9 cd0000        	call	_assert_failed
1748  03ec 5b04          	addw	sp,#4
1749  03ee               L223:
1750                     ; 374   if (NewState != DISABLE)
1752  03ee 7b02          	ld	a,(OFST+2,sp)
1753  03f0 2707          	jreq	L545
1754                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1756  03f2 c65303        	ld	a,21251
1757  03f5 1a01          	or	a,(OFST+1,sp)
1759  03f7 2006          	jra	L745
1760  03f9               L545:
1761                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1763  03f9 7b01          	ld	a,(OFST+1,sp)
1764  03fb 43            	cpl	a
1765  03fc c45303        	and	a,21251
1766  03ff               L745:
1767  03ff c75303        	ld	21251,a
1768                     ; 384 }
1771  0402 85            	popw	x
1772  0403 81            	ret	
1809                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1809                     ; 393 {
1810                     	switch	.text
1811  0404               _TIM2_UpdateDisableConfig:
1813  0404 88            	push	a
1814       00000000      OFST:	set	0
1817                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1819  0405 4d            	tnz	a
1820  0406 2711          	jreq	L433
1821  0408 4a            	dec	a
1822  0409 270e          	jreq	L433
1823  040b ae018b        	ldw	x,#395
1824  040e 89            	pushw	x
1825  040f 5f            	clrw	x
1826  0410 89            	pushw	x
1827  0411 ae0000        	ldw	x,#L302
1828  0414 cd0000        	call	_assert_failed
1830  0417 5b04          	addw	sp,#4
1831  0419               L433:
1832                     ; 398   if (NewState != DISABLE)
1834  0419 7b01          	ld	a,(OFST+1,sp)
1835  041b 2706          	jreq	L765
1836                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1838  041d 72125300      	bset	21248,#1
1840  0421 2004          	jra	L175
1841  0423               L765:
1842                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1844  0423 72135300      	bres	21248,#1
1845  0427               L175:
1846                     ; 406 }
1849  0427 84            	pop	a
1850  0428 81            	ret	
1909                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1909                     ; 417 {
1910                     	switch	.text
1911  0429               _TIM2_UpdateRequestConfig:
1913  0429 88            	push	a
1914       00000000      OFST:	set	0
1917                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1919  042a 4d            	tnz	a
1920  042b 2711          	jreq	L643
1921  042d 4a            	dec	a
1922  042e 270e          	jreq	L643
1923  0430 ae01a3        	ldw	x,#419
1924  0433 89            	pushw	x
1925  0434 5f            	clrw	x
1926  0435 89            	pushw	x
1927  0436 ae0000        	ldw	x,#L302
1928  0439 cd0000        	call	_assert_failed
1930  043c 5b04          	addw	sp,#4
1931  043e               L643:
1932                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1934  043e 7b01          	ld	a,(OFST+1,sp)
1935  0440 2706          	jreq	L126
1936                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1938  0442 72145300      	bset	21248,#2
1940  0446 2004          	jra	L326
1941  0448               L126:
1942                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1944  0448 72155300      	bres	21248,#2
1945  044c               L326:
1946                     ; 430 }
1949  044c 84            	pop	a
1950  044d 81            	ret	
2008                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2008                     ; 441 {
2009                     	switch	.text
2010  044e               _TIM2_SelectOnePulseMode:
2012  044e 88            	push	a
2013       00000000      OFST:	set	0
2016                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
2018  044f a101          	cp	a,#1
2019  0451 2711          	jreq	L063
2020  0453 4d            	tnz	a
2021  0454 270e          	jreq	L063
2022  0456 ae01bb        	ldw	x,#443
2023  0459 89            	pushw	x
2024  045a 5f            	clrw	x
2025  045b 89            	pushw	x
2026  045c ae0000        	ldw	x,#L302
2027  045f cd0000        	call	_assert_failed
2029  0462 5b04          	addw	sp,#4
2030  0464               L063:
2031                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
2033  0464 7b01          	ld	a,(OFST+1,sp)
2034  0466 2706          	jreq	L356
2035                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
2037  0468 72165300      	bset	21248,#3
2039  046c 2004          	jra	L556
2040  046e               L356:
2041                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
2043  046e 72175300      	bres	21248,#3
2044  0472               L556:
2045                     ; 454 }
2048  0472 84            	pop	a
2049  0473 81            	ret	
2118                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
2118                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
2118                     ; 486 {
2119                     	switch	.text
2120  0474               _TIM2_PrescalerConfig:
2122  0474 89            	pushw	x
2123       00000000      OFST:	set	0
2126                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
2128  0475 9f            	ld	a,xl
2129  0476 4d            	tnz	a
2130  0477 2712          	jreq	L273
2131  0479 9f            	ld	a,xl
2132  047a 4a            	dec	a
2133  047b 270e          	jreq	L273
2134  047d ae01e8        	ldw	x,#488
2135  0480 89            	pushw	x
2136  0481 5f            	clrw	x
2137  0482 89            	pushw	x
2138  0483 ae0000        	ldw	x,#L302
2139  0486 cd0000        	call	_assert_failed
2141  0489 5b04          	addw	sp,#4
2142  048b               L273:
2143                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
2145  048b 7b01          	ld	a,(OFST+1,sp)
2146  048d 274c          	jreq	L204
2147  048f a101          	cp	a,#1
2148  0491 2748          	jreq	L204
2149  0493 a102          	cp	a,#2
2150  0495 2744          	jreq	L204
2151  0497 a103          	cp	a,#3
2152  0499 2740          	jreq	L204
2153  049b a104          	cp	a,#4
2154  049d 273c          	jreq	L204
2155  049f a105          	cp	a,#5
2156  04a1 2738          	jreq	L204
2157  04a3 a106          	cp	a,#6
2158  04a5 2734          	jreq	L204
2159  04a7 a107          	cp	a,#7
2160  04a9 2730          	jreq	L204
2161  04ab a108          	cp	a,#8
2162  04ad 272c          	jreq	L204
2163  04af a109          	cp	a,#9
2164  04b1 2728          	jreq	L204
2165  04b3 a10a          	cp	a,#10
2166  04b5 2724          	jreq	L204
2167  04b7 a10b          	cp	a,#11
2168  04b9 2720          	jreq	L204
2169  04bb a10c          	cp	a,#12
2170  04bd 271c          	jreq	L204
2171  04bf a10d          	cp	a,#13
2172  04c1 2718          	jreq	L204
2173  04c3 a10e          	cp	a,#14
2174  04c5 2714          	jreq	L204
2175  04c7 a10f          	cp	a,#15
2176  04c9 2710          	jreq	L204
2177  04cb ae01e9        	ldw	x,#489
2178  04ce 89            	pushw	x
2179  04cf 5f            	clrw	x
2180  04d0 89            	pushw	x
2181  04d1 ae0000        	ldw	x,#L302
2182  04d4 cd0000        	call	_assert_failed
2184  04d7 5b04          	addw	sp,#4
2185  04d9 7b01          	ld	a,(OFST+1,sp)
2186  04db               L204:
2187                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
2189  04db c7530e        	ld	21262,a
2190                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
2192  04de 7b02          	ld	a,(OFST+2,sp)
2193  04e0 c75306        	ld	21254,a
2194                     ; 496 }
2197  04e3 85            	popw	x
2198  04e4 81            	ret	
2257                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2257                     ; 508 {
2258                     	switch	.text
2259  04e5               _TIM2_ForcedOC1Config:
2261  04e5 88            	push	a
2262       00000000      OFST:	set	0
2265                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2267  04e6 a150          	cp	a,#80
2268  04e8 2712          	jreq	L414
2269  04ea a140          	cp	a,#64
2270  04ec 270e          	jreq	L414
2271  04ee ae01fe        	ldw	x,#510
2272  04f1 89            	pushw	x
2273  04f2 5f            	clrw	x
2274  04f3 89            	pushw	x
2275  04f4 ae0000        	ldw	x,#L302
2276  04f7 cd0000        	call	_assert_failed
2278  04fa 5b04          	addw	sp,#4
2279  04fc               L414:
2280                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
2280                     ; 514                             | (uint8_t)TIM2_ForcedAction);
2282  04fc c65307        	ld	a,21255
2283  04ff a48f          	and	a,#143
2284  0501 1a01          	or	a,(OFST+1,sp)
2285  0503 c75307        	ld	21255,a
2286                     ; 515 }
2289  0506 84            	pop	a
2290  0507 81            	ret	
2327                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2327                     ; 527 {
2328                     	switch	.text
2329  0508               _TIM2_ForcedOC2Config:
2331  0508 88            	push	a
2332       00000000      OFST:	set	0
2335                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2337  0509 a150          	cp	a,#80
2338  050b 2712          	jreq	L624
2339  050d a140          	cp	a,#64
2340  050f 270e          	jreq	L624
2341  0511 ae0211        	ldw	x,#529
2342  0514 89            	pushw	x
2343  0515 5f            	clrw	x
2344  0516 89            	pushw	x
2345  0517 ae0000        	ldw	x,#L302
2346  051a cd0000        	call	_assert_failed
2348  051d 5b04          	addw	sp,#4
2349  051f               L624:
2350                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
2350                     ; 533                           | (uint8_t)TIM2_ForcedAction);
2352  051f c65308        	ld	a,21256
2353  0522 a48f          	and	a,#143
2354  0524 1a01          	or	a,(OFST+1,sp)
2355  0526 c75308        	ld	21256,a
2356                     ; 534 }
2359  0529 84            	pop	a
2360  052a 81            	ret	
2397                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2397                     ; 546 {
2398                     	switch	.text
2399  052b               _TIM2_ForcedOC3Config:
2401  052b 88            	push	a
2402       00000000      OFST:	set	0
2405                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2407  052c a150          	cp	a,#80
2408  052e 2712          	jreq	L044
2409  0530 a140          	cp	a,#64
2410  0532 270e          	jreq	L044
2411  0534 ae0224        	ldw	x,#548
2412  0537 89            	pushw	x
2413  0538 5f            	clrw	x
2414  0539 89            	pushw	x
2415  053a ae0000        	ldw	x,#L302
2416  053d cd0000        	call	_assert_failed
2418  0540 5b04          	addw	sp,#4
2419  0542               L044:
2420                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2420                     ; 552                             | (uint8_t)TIM2_ForcedAction);
2422  0542 c65309        	ld	a,21257
2423  0545 a48f          	and	a,#143
2424  0547 1a01          	or	a,(OFST+1,sp)
2425  0549 c75309        	ld	21257,a
2426                     ; 553 }
2429  054c 84            	pop	a
2430  054d 81            	ret	
2467                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
2467                     ; 562 {
2468                     	switch	.text
2469  054e               _TIM2_ARRPreloadConfig:
2471  054e 88            	push	a
2472       00000000      OFST:	set	0
2475                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2477  054f 4d            	tnz	a
2478  0550 2711          	jreq	L254
2479  0552 4a            	dec	a
2480  0553 270e          	jreq	L254
2481  0555 ae0234        	ldw	x,#564
2482  0558 89            	pushw	x
2483  0559 5f            	clrw	x
2484  055a 89            	pushw	x
2485  055b ae0000        	ldw	x,#L302
2486  055e cd0000        	call	_assert_failed
2488  0561 5b04          	addw	sp,#4
2489  0563               L254:
2490                     ; 567   if (NewState != DISABLE)
2492  0563 7b01          	ld	a,(OFST+1,sp)
2493  0565 2706          	jreq	L1101
2494                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2496  0567 721e5300      	bset	21248,#7
2498  056b 2004          	jra	L3101
2499  056d               L1101:
2500                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2502  056d 721f5300      	bres	21248,#7
2503  0571               L3101:
2504                     ; 575 }
2507  0571 84            	pop	a
2508  0572 81            	ret	
2545                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2545                     ; 584 {
2546                     	switch	.text
2547  0573               _TIM2_OC1PreloadConfig:
2549  0573 88            	push	a
2550       00000000      OFST:	set	0
2553                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2555  0574 4d            	tnz	a
2556  0575 2711          	jreq	L464
2557  0577 4a            	dec	a
2558  0578 270e          	jreq	L464
2559  057a ae024a        	ldw	x,#586
2560  057d 89            	pushw	x
2561  057e 5f            	clrw	x
2562  057f 89            	pushw	x
2563  0580 ae0000        	ldw	x,#L302
2564  0583 cd0000        	call	_assert_failed
2566  0586 5b04          	addw	sp,#4
2567  0588               L464:
2568                     ; 589   if (NewState != DISABLE)
2570  0588 7b01          	ld	a,(OFST+1,sp)
2571  058a 2706          	jreq	L3301
2572                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2574  058c 72165307      	bset	21255,#3
2576  0590 2004          	jra	L5301
2577  0592               L3301:
2578                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2580  0592 72175307      	bres	21255,#3
2581  0596               L5301:
2582                     ; 597 }
2585  0596 84            	pop	a
2586  0597 81            	ret	
2623                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2623                     ; 606 {
2624                     	switch	.text
2625  0598               _TIM2_OC2PreloadConfig:
2627  0598 88            	push	a
2628       00000000      OFST:	set	0
2631                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2633  0599 4d            	tnz	a
2634  059a 2711          	jreq	L674
2635  059c 4a            	dec	a
2636  059d 270e          	jreq	L674
2637  059f ae0260        	ldw	x,#608
2638  05a2 89            	pushw	x
2639  05a3 5f            	clrw	x
2640  05a4 89            	pushw	x
2641  05a5 ae0000        	ldw	x,#L302
2642  05a8 cd0000        	call	_assert_failed
2644  05ab 5b04          	addw	sp,#4
2645  05ad               L674:
2646                     ; 611   if (NewState != DISABLE)
2648  05ad 7b01          	ld	a,(OFST+1,sp)
2649  05af 2706          	jreq	L5501
2650                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2652  05b1 72165308      	bset	21256,#3
2654  05b5 2004          	jra	L7501
2655  05b7               L5501:
2656                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2658  05b7 72175308      	bres	21256,#3
2659  05bb               L7501:
2660                     ; 619 }
2663  05bb 84            	pop	a
2664  05bc 81            	ret	
2701                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2701                     ; 628 {
2702                     	switch	.text
2703  05bd               _TIM2_OC3PreloadConfig:
2705  05bd 88            	push	a
2706       00000000      OFST:	set	0
2709                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2711  05be 4d            	tnz	a
2712  05bf 2711          	jreq	L015
2713  05c1 4a            	dec	a
2714  05c2 270e          	jreq	L015
2715  05c4 ae0276        	ldw	x,#630
2716  05c7 89            	pushw	x
2717  05c8 5f            	clrw	x
2718  05c9 89            	pushw	x
2719  05ca ae0000        	ldw	x,#L302
2720  05cd cd0000        	call	_assert_failed
2722  05d0 5b04          	addw	sp,#4
2723  05d2               L015:
2724                     ; 633   if (NewState != DISABLE)
2726  05d2 7b01          	ld	a,(OFST+1,sp)
2727  05d4 2706          	jreq	L7701
2728                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2730  05d6 72165309      	bset	21257,#3
2732  05da 2004          	jra	L1011
2733  05dc               L7701:
2734                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2736  05dc 72175309      	bres	21257,#3
2737  05e0               L1011:
2738                     ; 641 }
2741  05e0 84            	pop	a
2742  05e1 81            	ret	
2816                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2816                     ; 654 {
2817                     	switch	.text
2818  05e2               _TIM2_GenerateEvent:
2820  05e2 88            	push	a
2821       00000000      OFST:	set	0
2824                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2826  05e3 4d            	tnz	a
2827  05e4 260e          	jrne	L025
2828  05e6 ae0290        	ldw	x,#656
2829  05e9 89            	pushw	x
2830  05ea 5f            	clrw	x
2831  05eb 89            	pushw	x
2832  05ec ae0000        	ldw	x,#L302
2833  05ef cd0000        	call	_assert_failed
2835  05f2 5b04          	addw	sp,#4
2836  05f4               L025:
2837                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2839  05f4 7b01          	ld	a,(OFST+1,sp)
2840  05f6 c75306        	ld	21254,a
2841                     ; 660 }
2844  05f9 84            	pop	a
2845  05fa 81            	ret	
2882                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2882                     ; 671 {
2883                     	switch	.text
2884  05fb               _TIM2_OC1PolarityConfig:
2886  05fb 88            	push	a
2887       00000000      OFST:	set	0
2890                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2892  05fc 4d            	tnz	a
2893  05fd 2712          	jreq	L235
2894  05ff a122          	cp	a,#34
2895  0601 270e          	jreq	L235
2896  0603 ae02a1        	ldw	x,#673
2897  0606 89            	pushw	x
2898  0607 5f            	clrw	x
2899  0608 89            	pushw	x
2900  0609 ae0000        	ldw	x,#L302
2901  060c cd0000        	call	_assert_failed
2903  060f 5b04          	addw	sp,#4
2904  0611               L235:
2905                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2907  0611 7b01          	ld	a,(OFST+1,sp)
2908  0613 2706          	jreq	L3511
2909                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2911  0615 7212530a      	bset	21258,#1
2913  0619 2004          	jra	L5511
2914  061b               L3511:
2915                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2917  061b 7213530a      	bres	21258,#1
2918  061f               L5511:
2919                     ; 684 }
2922  061f 84            	pop	a
2923  0620 81            	ret	
2960                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2960                     ; 695 {
2961                     	switch	.text
2962  0621               _TIM2_OC2PolarityConfig:
2964  0621 88            	push	a
2965       00000000      OFST:	set	0
2968                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2970  0622 4d            	tnz	a
2971  0623 2712          	jreq	L445
2972  0625 a122          	cp	a,#34
2973  0627 270e          	jreq	L445
2974  0629 ae02b9        	ldw	x,#697
2975  062c 89            	pushw	x
2976  062d 5f            	clrw	x
2977  062e 89            	pushw	x
2978  062f ae0000        	ldw	x,#L302
2979  0632 cd0000        	call	_assert_failed
2981  0635 5b04          	addw	sp,#4
2982  0637               L445:
2983                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2985  0637 7b01          	ld	a,(OFST+1,sp)
2986  0639 2706          	jreq	L5711
2987                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2989  063b 721a530a      	bset	21258,#5
2991  063f 2004          	jra	L7711
2992  0641               L5711:
2993                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2995  0641 721b530a      	bres	21258,#5
2996  0645               L7711:
2997                     ; 708 }
3000  0645 84            	pop	a
3001  0646 81            	ret	
3038                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3038                     ; 719 {
3039                     	switch	.text
3040  0647               _TIM2_OC3PolarityConfig:
3042  0647 88            	push	a
3043       00000000      OFST:	set	0
3046                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3048  0648 4d            	tnz	a
3049  0649 2712          	jreq	L655
3050  064b a122          	cp	a,#34
3051  064d 270e          	jreq	L655
3052  064f ae02d1        	ldw	x,#721
3053  0652 89            	pushw	x
3054  0653 5f            	clrw	x
3055  0654 89            	pushw	x
3056  0655 ae0000        	ldw	x,#L302
3057  0658 cd0000        	call	_assert_failed
3059  065b 5b04          	addw	sp,#4
3060  065d               L655:
3061                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3063  065d 7b01          	ld	a,(OFST+1,sp)
3064  065f 2706          	jreq	L7121
3065                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
3067  0661 7212530b      	bset	21259,#1
3069  0665 2004          	jra	L1221
3070  0667               L7121:
3071                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
3073  0667 7213530b      	bres	21259,#1
3074  066b               L1221:
3075                     ; 732 }
3078  066b 84            	pop	a
3079  066c 81            	ret	
3125                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
3125                     ; 746 {
3126                     	switch	.text
3127  066d               _TIM2_CCxCmd:
3129  066d 89            	pushw	x
3130       00000000      OFST:	set	0
3133                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3135  066e 9e            	ld	a,xh
3136  066f 4d            	tnz	a
3137  0670 2717          	jreq	L075
3138  0672 9e            	ld	a,xh
3139  0673 4a            	dec	a
3140  0674 2713          	jreq	L075
3141  0676 9e            	ld	a,xh
3142  0677 a102          	cp	a,#2
3143  0679 270e          	jreq	L075
3144  067b ae02ec        	ldw	x,#748
3145  067e 89            	pushw	x
3146  067f 5f            	clrw	x
3147  0680 89            	pushw	x
3148  0681 ae0000        	ldw	x,#L302
3149  0684 cd0000        	call	_assert_failed
3151  0687 5b04          	addw	sp,#4
3152  0689               L075:
3153                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3155  0689 7b02          	ld	a,(OFST+2,sp)
3156  068b 2711          	jreq	L006
3157  068d 4a            	dec	a
3158  068e 270e          	jreq	L006
3159  0690 ae02ed        	ldw	x,#749
3160  0693 89            	pushw	x
3161  0694 5f            	clrw	x
3162  0695 89            	pushw	x
3163  0696 ae0000        	ldw	x,#L302
3164  0699 cd0000        	call	_assert_failed
3166  069c 5b04          	addw	sp,#4
3167  069e               L006:
3168                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
3170  069e 7b01          	ld	a,(OFST+1,sp)
3171  06a0 2610          	jrne	L5421
3172                     ; 754     if (NewState != DISABLE)
3174  06a2 7b02          	ld	a,(OFST+2,sp)
3175  06a4 2706          	jreq	L7421
3176                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
3178  06a6 7210530a      	bset	21258,#0
3180  06aa 2027          	jra	L3521
3181  06ac               L7421:
3182                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3184  06ac 7211530a      	bres	21258,#0
3185  06b0 2021          	jra	L3521
3186  06b2               L5421:
3187                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
3189  06b2 4a            	dec	a
3190  06b3 2610          	jrne	L5521
3191                     ; 767     if (NewState != DISABLE)
3193  06b5 7b02          	ld	a,(OFST+2,sp)
3194  06b7 2706          	jreq	L7521
3195                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
3197  06b9 7218530a      	bset	21258,#4
3199  06bd 2014          	jra	L3521
3200  06bf               L7521:
3201                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3203  06bf 7219530a      	bres	21258,#4
3204  06c3 200e          	jra	L3521
3205  06c5               L5521:
3206                     ; 779     if (NewState != DISABLE)
3208  06c5 7b02          	ld	a,(OFST+2,sp)
3209  06c7 2706          	jreq	L5621
3210                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
3212  06c9 7210530b      	bset	21259,#0
3214  06cd 2004          	jra	L3521
3215  06cf               L5621:
3216                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3218  06cf 7211530b      	bres	21259,#0
3219  06d3               L3521:
3220                     ; 788 }
3223  06d3 85            	popw	x
3224  06d4 81            	ret	
3270                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
3270                     ; 811 {
3271                     	switch	.text
3272  06d5               _TIM2_SelectOCxM:
3274  06d5 89            	pushw	x
3275       00000000      OFST:	set	0
3278                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3280  06d6 9e            	ld	a,xh
3281  06d7 4d            	tnz	a
3282  06d8 2717          	jreq	L216
3283  06da 9e            	ld	a,xh
3284  06db 4a            	dec	a
3285  06dc 2713          	jreq	L216
3286  06de 9e            	ld	a,xh
3287  06df a102          	cp	a,#2
3288  06e1 270e          	jreq	L216
3289  06e3 ae032d        	ldw	x,#813
3290  06e6 89            	pushw	x
3291  06e7 5f            	clrw	x
3292  06e8 89            	pushw	x
3293  06e9 ae0000        	ldw	x,#L302
3294  06ec cd0000        	call	_assert_failed
3296  06ef 5b04          	addw	sp,#4
3297  06f1               L216:
3298                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
3300  06f1 7b02          	ld	a,(OFST+2,sp)
3301  06f3 272a          	jreq	L226
3302  06f5 a110          	cp	a,#16
3303  06f7 2726          	jreq	L226
3304  06f9 a120          	cp	a,#32
3305  06fb 2722          	jreq	L226
3306  06fd a130          	cp	a,#48
3307  06ff 271e          	jreq	L226
3308  0701 a160          	cp	a,#96
3309  0703 271a          	jreq	L226
3310  0705 a170          	cp	a,#112
3311  0707 2716          	jreq	L226
3312  0709 a150          	cp	a,#80
3313  070b 2712          	jreq	L226
3314  070d a140          	cp	a,#64
3315  070f 270e          	jreq	L226
3316  0711 ae032e        	ldw	x,#814
3317  0714 89            	pushw	x
3318  0715 5f            	clrw	x
3319  0716 89            	pushw	x
3320  0717 ae0000        	ldw	x,#L302
3321  071a cd0000        	call	_assert_failed
3323  071d 5b04          	addw	sp,#4
3324  071f               L226:
3325                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
3327  071f 7b01          	ld	a,(OFST+1,sp)
3328  0721 2610          	jrne	L3131
3329                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3331  0723 7211530a      	bres	21258,#0
3332                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
3332                     ; 823                             | (uint8_t)TIM2_OCMode);
3334  0727 c65307        	ld	a,21255
3335  072a a48f          	and	a,#143
3336  072c 1a02          	or	a,(OFST+2,sp)
3337  072e c75307        	ld	21255,a
3339  0731 2021          	jra	L5131
3340  0733               L3131:
3341                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
3343  0733 4a            	dec	a
3344  0734 2610          	jrne	L7131
3345                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3347  0736 7219530a      	bres	21258,#4
3348                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
3348                     ; 832                             | (uint8_t)TIM2_OCMode);
3350  073a c65308        	ld	a,21256
3351  073d a48f          	and	a,#143
3352  073f 1a02          	or	a,(OFST+2,sp)
3353  0741 c75308        	ld	21256,a
3355  0744 200e          	jra	L5131
3356  0746               L7131:
3357                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3359  0746 7211530b      	bres	21259,#0
3360                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
3360                     ; 841                             | (uint8_t)TIM2_OCMode);
3362  074a c65309        	ld	a,21257
3363  074d a48f          	and	a,#143
3364  074f 1a02          	or	a,(OFST+2,sp)
3365  0751 c75309        	ld	21257,a
3366  0754               L5131:
3367                     ; 843 }
3370  0754 85            	popw	x
3371  0755 81            	ret	
3403                     ; 851 void TIM2_SetCounter(uint16_t Counter)
3403                     ; 852 {
3404                     	switch	.text
3405  0756               _TIM2_SetCounter:
3409                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
3411  0756 9e            	ld	a,xh
3412  0757 c7530c        	ld	21260,a
3413                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
3415  075a 9f            	ld	a,xl
3416  075b c7530d        	ld	21261,a
3417                     ; 856 }
3420  075e 81            	ret	
3452                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
3452                     ; 865 {
3453                     	switch	.text
3454  075f               _TIM2_SetAutoreload:
3458                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
3460  075f 9e            	ld	a,xh
3461  0760 c7530f        	ld	21263,a
3462                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
3464  0763 9f            	ld	a,xl
3465  0764 c75310        	ld	21264,a
3466                     ; 869 }
3469  0767 81            	ret	
3501                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
3501                     ; 878 {
3502                     	switch	.text
3503  0768               _TIM2_SetCompare1:
3507                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
3509  0768 9e            	ld	a,xh
3510  0769 c75311        	ld	21265,a
3511                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
3513  076c 9f            	ld	a,xl
3514  076d c75312        	ld	21266,a
3515                     ; 882 }
3518  0770 81            	ret	
3550                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
3550                     ; 891 {
3551                     	switch	.text
3552  0771               _TIM2_SetCompare2:
3556                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
3558  0771 9e            	ld	a,xh
3559  0772 c75313        	ld	21267,a
3560                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
3562  0775 9f            	ld	a,xl
3563  0776 c75314        	ld	21268,a
3564                     ; 895 }
3567  0779 81            	ret	
3599                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
3599                     ; 904 {
3600                     	switch	.text
3601  077a               _TIM2_SetCompare3:
3605                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
3607  077a 9e            	ld	a,xh
3608  077b c75315        	ld	21269,a
3609                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
3611  077e 9f            	ld	a,xl
3612  077f c75316        	ld	21270,a
3613                     ; 908 }
3616  0782 81            	ret	
3653                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3653                     ; 921 {
3654                     	switch	.text
3655  0783               _TIM2_SetIC1Prescaler:
3657  0783 88            	push	a
3658       00000000      OFST:	set	0
3661                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
3663  0784 4d            	tnz	a
3664  0785 271a          	jreq	L646
3665  0787 a104          	cp	a,#4
3666  0789 2716          	jreq	L646
3667  078b a108          	cp	a,#8
3668  078d 2712          	jreq	L646
3669  078f a10c          	cp	a,#12
3670  0791 270e          	jreq	L646
3671  0793 ae039b        	ldw	x,#923
3672  0796 89            	pushw	x
3673  0797 5f            	clrw	x
3674  0798 89            	pushw	x
3675  0799 ae0000        	ldw	x,#L302
3676  079c cd0000        	call	_assert_failed
3678  079f 5b04          	addw	sp,#4
3679  07a1               L646:
3680                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3680                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
3682  07a1 c65307        	ld	a,21255
3683  07a4 a4f3          	and	a,#243
3684  07a6 1a01          	or	a,(OFST+1,sp)
3685  07a8 c75307        	ld	21255,a
3686                     ; 928 }
3689  07ab 84            	pop	a
3690  07ac 81            	ret	
3727                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3727                     ; 941 {
3728                     	switch	.text
3729  07ad               _TIM2_SetIC2Prescaler:
3731  07ad 88            	push	a
3732       00000000      OFST:	set	0
3735                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3737  07ae 4d            	tnz	a
3738  07af 271a          	jreq	L066
3739  07b1 a104          	cp	a,#4
3740  07b3 2716          	jreq	L066
3741  07b5 a108          	cp	a,#8
3742  07b7 2712          	jreq	L066
3743  07b9 a10c          	cp	a,#12
3744  07bb 270e          	jreq	L066
3745  07bd ae03af        	ldw	x,#943
3746  07c0 89            	pushw	x
3747  07c1 5f            	clrw	x
3748  07c2 89            	pushw	x
3749  07c3 ae0000        	ldw	x,#L302
3750  07c6 cd0000        	call	_assert_failed
3752  07c9 5b04          	addw	sp,#4
3753  07cb               L066:
3754                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3754                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3756  07cb c65308        	ld	a,21256
3757  07ce a4f3          	and	a,#243
3758  07d0 1a01          	or	a,(OFST+1,sp)
3759  07d2 c75308        	ld	21256,a
3760                     ; 948 }
3763  07d5 84            	pop	a
3764  07d6 81            	ret	
3801                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3801                     ; 961 {
3802                     	switch	.text
3803  07d7               _TIM2_SetIC3Prescaler:
3805  07d7 88            	push	a
3806       00000000      OFST:	set	0
3809                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3811  07d8 4d            	tnz	a
3812  07d9 271a          	jreq	L276
3813  07db a104          	cp	a,#4
3814  07dd 2716          	jreq	L276
3815  07df a108          	cp	a,#8
3816  07e1 2712          	jreq	L276
3817  07e3 a10c          	cp	a,#12
3818  07e5 270e          	jreq	L276
3819  07e7 ae03c4        	ldw	x,#964
3820  07ea 89            	pushw	x
3821  07eb 5f            	clrw	x
3822  07ec 89            	pushw	x
3823  07ed ae0000        	ldw	x,#L302
3824  07f0 cd0000        	call	_assert_failed
3826  07f3 5b04          	addw	sp,#4
3827  07f5               L276:
3828                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3828                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3830  07f5 c65309        	ld	a,21257
3831  07f8 a4f3          	and	a,#243
3832  07fa 1a01          	or	a,(OFST+1,sp)
3833  07fc c75309        	ld	21257,a
3834                     ; 968 }
3837  07ff 84            	pop	a
3838  0800 81            	ret	
3884                     ; 975 uint16_t TIM2_GetCapture1(void)
3884                     ; 976 {
3885                     	switch	.text
3886  0801               _TIM2_GetCapture1:
3888  0801 5204          	subw	sp,#4
3889       00000004      OFST:	set	4
3892                     ; 978   uint16_t tmpccr1 = 0;
3894                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3898                     ; 981   tmpccr1h = TIM2->CCR1H;
3900  0803 c65311        	ld	a,21265
3901  0806 6b02          	ld	(OFST-2,sp),a
3903                     ; 982   tmpccr1l = TIM2->CCR1L;
3905  0808 c65312        	ld	a,21266
3906  080b 6b01          	ld	(OFST-3,sp),a
3908                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3910  080d 5f            	clrw	x
3911  080e 97            	ld	xl,a
3912  080f 1f03          	ldw	(OFST-1,sp),x
3914                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3916  0811 5f            	clrw	x
3917  0812 7b02          	ld	a,(OFST-2,sp)
3918  0814 97            	ld	xl,a
3919  0815 7b04          	ld	a,(OFST+0,sp)
3920  0817 01            	rrwa	x,a
3921  0818 1a03          	or	a,(OFST-1,sp)
3922  081a 01            	rrwa	x,a
3924                     ; 987   return (uint16_t)tmpccr1;
3928  081b 5b04          	addw	sp,#4
3929  081d 81            	ret	
3975                     ; 995 uint16_t TIM2_GetCapture2(void)
3975                     ; 996 {
3976                     	switch	.text
3977  081e               _TIM2_GetCapture2:
3979  081e 5204          	subw	sp,#4
3980       00000004      OFST:	set	4
3983                     ; 998   uint16_t tmpccr2 = 0;
3985                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3989                     ; 1001   tmpccr2h = TIM2->CCR2H;
3991  0820 c65313        	ld	a,21267
3992  0823 6b02          	ld	(OFST-2,sp),a
3994                     ; 1002   tmpccr2l = TIM2->CCR2L;
3996  0825 c65314        	ld	a,21268
3997  0828 6b01          	ld	(OFST-3,sp),a
3999                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
4001  082a 5f            	clrw	x
4002  082b 97            	ld	xl,a
4003  082c 1f03          	ldw	(OFST-1,sp),x
4005                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4007  082e 5f            	clrw	x
4008  082f 7b02          	ld	a,(OFST-2,sp)
4009  0831 97            	ld	xl,a
4010  0832 7b04          	ld	a,(OFST+0,sp)
4011  0834 01            	rrwa	x,a
4012  0835 1a03          	or	a,(OFST-1,sp)
4013  0837 01            	rrwa	x,a
4015                     ; 1007   return (uint16_t)tmpccr2;
4019  0838 5b04          	addw	sp,#4
4020  083a 81            	ret	
4066                     ; 1015 uint16_t TIM2_GetCapture3(void)
4066                     ; 1016 {
4067                     	switch	.text
4068  083b               _TIM2_GetCapture3:
4070  083b 5204          	subw	sp,#4
4071       00000004      OFST:	set	4
4074                     ; 1018   uint16_t tmpccr3 = 0;
4076                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
4080                     ; 1021   tmpccr3h = TIM2->CCR3H;
4082  083d c65315        	ld	a,21269
4083  0840 6b02          	ld	(OFST-2,sp),a
4085                     ; 1022   tmpccr3l = TIM2->CCR3L;
4087  0842 c65316        	ld	a,21270
4088  0845 6b01          	ld	(OFST-3,sp),a
4090                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
4092  0847 5f            	clrw	x
4093  0848 97            	ld	xl,a
4094  0849 1f03          	ldw	(OFST-1,sp),x
4096                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4098  084b 5f            	clrw	x
4099  084c 7b02          	ld	a,(OFST-2,sp)
4100  084e 97            	ld	xl,a
4101  084f 7b04          	ld	a,(OFST+0,sp)
4102  0851 01            	rrwa	x,a
4103  0852 1a03          	or	a,(OFST-1,sp)
4104  0854 01            	rrwa	x,a
4106                     ; 1027   return (uint16_t)tmpccr3;
4110  0855 5b04          	addw	sp,#4
4111  0857 81            	ret	
4143                     ; 1035 uint16_t TIM2_GetCounter(void)
4143                     ; 1036 {
4144                     	switch	.text
4145  0858               _TIM2_GetCounter:
4147  0858 89            	pushw	x
4148       00000002      OFST:	set	2
4151                     ; 1037   uint16_t tmpcntr = 0;
4153                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
4155  0859 c6530c        	ld	a,21260
4156  085c 97            	ld	xl,a
4157  085d 4f            	clr	a
4158  085e 02            	rlwa	x,a
4159  085f 1f01          	ldw	(OFST-1,sp),x
4161                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
4163  0861 c6530d        	ld	a,21261
4164  0864 5f            	clrw	x
4165  0865 97            	ld	xl,a
4166  0866 01            	rrwa	x,a
4167  0867 1a02          	or	a,(OFST+0,sp)
4168  0869 01            	rrwa	x,a
4169  086a 1a01          	or	a,(OFST-1,sp)
4170  086c 01            	rrwa	x,a
4173  086d 5b02          	addw	sp,#2
4174  086f 81            	ret	
4198                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4198                     ; 1050 {
4199                     	switch	.text
4200  0870               _TIM2_GetPrescaler:
4204                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
4206  0870 c6530e        	ld	a,21262
4209  0873 81            	ret	
4345                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
4345                     ; 1069 {
4346                     	switch	.text
4347  0874               _TIM2_GetFlagStatus:
4349  0874 89            	pushw	x
4350  0875 89            	pushw	x
4351       00000002      OFST:	set	2
4354                     ; 1070   FlagStatus bitstatus = RESET;
4356                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
4360                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
4362  0876 a30001        	cpw	x,#1
4363  0879 272c          	jreq	L617
4364  087b a30002        	cpw	x,#2
4365  087e 2727          	jreq	L617
4366  0880 a30004        	cpw	x,#4
4367  0883 2722          	jreq	L617
4368  0885 a30008        	cpw	x,#8
4369  0888 271d          	jreq	L617
4370  088a a30200        	cpw	x,#512
4371  088d 2718          	jreq	L617
4372  088f a30400        	cpw	x,#1024
4373  0892 2713          	jreq	L617
4374  0894 a30800        	cpw	x,#2048
4375  0897 270e          	jreq	L617
4376  0899 ae0432        	ldw	x,#1074
4377  089c 89            	pushw	x
4378  089d 5f            	clrw	x
4379  089e 89            	pushw	x
4380  089f ae0000        	ldw	x,#L302
4381  08a2 cd0000        	call	_assert_failed
4383  08a5 5b04          	addw	sp,#4
4384  08a7               L617:
4385                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
4387  08a7 c65304        	ld	a,21252
4388  08aa 1404          	and	a,(OFST+2,sp)
4389  08ac 6b01          	ld	(OFST-1,sp),a
4391                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
4393  08ae 7b03          	ld	a,(OFST+1,sp)
4394  08b0 6b02          	ld	(OFST+0,sp),a
4396                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
4398  08b2 c45305        	and	a,21253
4399  08b5 1a01          	or	a,(OFST-1,sp)
4400  08b7 2702          	jreq	L5561
4401                     ; 1081     bitstatus = SET;
4403  08b9 a601          	ld	a,#1
4406  08bb               L5561:
4407                     ; 1085     bitstatus = RESET;
4410                     ; 1087   return (FlagStatus)bitstatus;
4414  08bb 5b04          	addw	sp,#4
4415  08bd 81            	ret	
4451                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
4451                     ; 1104 {
4452                     	switch	.text
4453  08be               _TIM2_ClearFlag:
4455  08be 89            	pushw	x
4456       00000000      OFST:	set	0
4459                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
4461  08bf 01            	rrwa	x,a
4462  08c0 a4f0          	and	a,#240
4463  08c2 01            	rrwa	x,a
4464  08c3 a4f1          	and	a,#241
4465  08c5 01            	rrwa	x,a
4466  08c6 5d            	tnzw	x
4467  08c7 2604          	jrne	L427
4468  08c9 1e01          	ldw	x,(OFST+1,sp)
4469  08cb 260e          	jrne	L627
4470  08cd               L427:
4471  08cd ae0452        	ldw	x,#1106
4472  08d0 89            	pushw	x
4473  08d1 5f            	clrw	x
4474  08d2 89            	pushw	x
4475  08d3 ae0000        	ldw	x,#L302
4476  08d6 cd0000        	call	_assert_failed
4478  08d9 5b04          	addw	sp,#4
4479  08db               L627:
4480                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
4482  08db 7b02          	ld	a,(OFST+2,sp)
4483  08dd 43            	cpl	a
4484  08de c75304        	ld	21252,a
4485                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
4487  08e1 35ff5305      	mov	21253,#255
4488                     ; 1111 }
4491  08e5 85            	popw	x
4492  08e6 81            	ret	
4553                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4553                     ; 1124 {
4554                     	switch	.text
4555  08e7               _TIM2_GetITStatus:
4557  08e7 88            	push	a
4558  08e8 89            	pushw	x
4559       00000002      OFST:	set	2
4562                     ; 1125   ITStatus bitstatus = RESET;
4564                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
4568                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
4570  08e9 a101          	cp	a,#1
4571  08eb 271a          	jreq	L047
4572  08ed a102          	cp	a,#2
4573  08ef 2716          	jreq	L047
4574  08f1 a104          	cp	a,#4
4575  08f3 2712          	jreq	L047
4576  08f5 a108          	cp	a,#8
4577  08f7 270e          	jreq	L047
4578  08f9 ae0469        	ldw	x,#1129
4579  08fc 89            	pushw	x
4580  08fd 5f            	clrw	x
4581  08fe 89            	pushw	x
4582  08ff ae0000        	ldw	x,#L302
4583  0902 cd0000        	call	_assert_failed
4585  0905 5b04          	addw	sp,#4
4586  0907               L047:
4587                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
4589  0907 c65304        	ld	a,21252
4590  090a 1403          	and	a,(OFST+1,sp)
4591  090c 6b01          	ld	(OFST-1,sp),a
4593                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
4595  090e c65303        	ld	a,21251
4596  0911 1403          	and	a,(OFST+1,sp)
4597  0913 6b02          	ld	(OFST+0,sp),a
4599                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
4601  0915 7b01          	ld	a,(OFST-1,sp)
4602  0917 2708          	jreq	L5271
4604  0919 7b02          	ld	a,(OFST+0,sp)
4605  091b 2704          	jreq	L5271
4606                     ; 1137     bitstatus = SET;
4608  091d a601          	ld	a,#1
4611  091f 2001          	jra	L7271
4612  0921               L5271:
4613                     ; 1141     bitstatus = RESET;
4615  0921 4f            	clr	a
4617  0922               L7271:
4618                     ; 1143   return (ITStatus)(bitstatus);
4622  0922 5b03          	addw	sp,#3
4623  0924 81            	ret	
4660                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4660                     ; 1157 {
4661                     	switch	.text
4662  0925               _TIM2_ClearITPendingBit:
4664  0925 88            	push	a
4665       00000000      OFST:	set	0
4668                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
4670  0926 4d            	tnz	a
4671  0927 2704          	jreq	L647
4672  0929 a110          	cp	a,#16
4673  092b 250e          	jrult	L057
4674  092d               L647:
4675  092d ae0487        	ldw	x,#1159
4676  0930 89            	pushw	x
4677  0931 5f            	clrw	x
4678  0932 89            	pushw	x
4679  0933 ae0000        	ldw	x,#L302
4680  0936 cd0000        	call	_assert_failed
4682  0939 5b04          	addw	sp,#4
4683  093b               L057:
4684                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
4686  093b 7b01          	ld	a,(OFST+1,sp)
4687  093d 43            	cpl	a
4688  093e c75304        	ld	21252,a
4689                     ; 1163 }
4692  0941 84            	pop	a
4693  0942 81            	ret	
4739                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
4739                     ; 1182                        uint8_t TIM2_ICSelection,
4739                     ; 1183                        uint8_t TIM2_ICFilter)
4739                     ; 1184 {
4740                     	switch	.text
4741  0943               L3_TI1_Config:
4743  0943 89            	pushw	x
4744  0944 88            	push	a
4745       00000001      OFST:	set	1
4748                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
4750  0945 7211530a      	bres	21258,#0
4751                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
4751                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4753  0949 7b06          	ld	a,(OFST+5,sp)
4754  094b 97            	ld	xl,a
4755  094c a610          	ld	a,#16
4756  094e 42            	mul	x,a
4757  094f 9f            	ld	a,xl
4758  0950 1a03          	or	a,(OFST+2,sp)
4759  0952 6b01          	ld	(OFST+0,sp),a
4761  0954 c65307        	ld	a,21255
4762  0957 a40c          	and	a,#12
4763  0959 1a01          	or	a,(OFST+0,sp)
4764  095b c75307        	ld	21255,a
4765                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4767  095e 7b02          	ld	a,(OFST+1,sp)
4768  0960 2706          	jreq	L7671
4769                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
4771  0962 7212530a      	bset	21258,#1
4773  0966 2004          	jra	L1771
4774  0968               L7671:
4775                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
4777  0968 7213530a      	bres	21258,#1
4778  096c               L1771:
4779                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4781  096c 7210530a      	bset	21258,#0
4782                     ; 1203 }
4785  0970 5b03          	addw	sp,#3
4786  0972 81            	ret	
4832                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4832                     ; 1222                        uint8_t TIM2_ICSelection,
4832                     ; 1223                        uint8_t TIM2_ICFilter)
4832                     ; 1224 {
4833                     	switch	.text
4834  0973               L5_TI2_Config:
4836  0973 89            	pushw	x
4837  0974 88            	push	a
4838       00000001      OFST:	set	1
4841                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4843  0975 7219530a      	bres	21258,#4
4844                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4844                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4846  0979 7b06          	ld	a,(OFST+5,sp)
4847  097b 97            	ld	xl,a
4848  097c a610          	ld	a,#16
4849  097e 42            	mul	x,a
4850  097f 9f            	ld	a,xl
4851  0980 1a03          	or	a,(OFST+2,sp)
4852  0982 6b01          	ld	(OFST+0,sp),a
4854  0984 c65308        	ld	a,21256
4855  0987 a40c          	and	a,#12
4856  0989 1a01          	or	a,(OFST+0,sp)
4857  098b c75308        	ld	21256,a
4858                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4860  098e 7b02          	ld	a,(OFST+1,sp)
4861  0990 2706          	jreq	L3102
4862                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4864  0992 721a530a      	bset	21258,#5
4866  0996 2004          	jra	L5102
4867  0998               L3102:
4868                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4870  0998 721b530a      	bres	21258,#5
4871  099c               L5102:
4872                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4874  099c 7218530a      	bset	21258,#4
4875                     ; 1245 }
4878  09a0 5b03          	addw	sp,#3
4879  09a2 81            	ret	
4925                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4925                     ; 1262                        uint8_t TIM2_ICFilter)
4925                     ; 1263 {
4926                     	switch	.text
4927  09a3               L7_TI3_Config:
4929  09a3 89            	pushw	x
4930  09a4 88            	push	a
4931       00000001      OFST:	set	1
4934                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4936  09a5 7211530b      	bres	21259,#0
4937                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4937                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4939  09a9 7b06          	ld	a,(OFST+5,sp)
4940  09ab 97            	ld	xl,a
4941  09ac a610          	ld	a,#16
4942  09ae 42            	mul	x,a
4943  09af 9f            	ld	a,xl
4944  09b0 1a03          	or	a,(OFST+2,sp)
4945  09b2 6b01          	ld	(OFST+0,sp),a
4947  09b4 c65309        	ld	a,21257
4948  09b7 a40c          	and	a,#12
4949  09b9 1a01          	or	a,(OFST+0,sp)
4950  09bb c75309        	ld	21257,a
4951                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4953  09be 7b02          	ld	a,(OFST+1,sp)
4954  09c0 2706          	jreq	L7302
4955                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4957  09c2 7212530b      	bset	21259,#1
4959  09c6 2004          	jra	L1402
4960  09c8               L7302:
4961                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4963  09c8 7213530b      	bres	21259,#1
4964  09cc               L1402:
4965                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4967  09cc 7210530b      	bset	21259,#0
4968                     ; 1283 }
4971  09d0 5b03          	addw	sp,#3
4972  09d2 81            	ret	
4985                     	xdef	_TIM2_ClearITPendingBit
4986                     	xdef	_TIM2_GetITStatus
4987                     	xdef	_TIM2_ClearFlag
4988                     	xdef	_TIM2_GetFlagStatus
4989                     	xdef	_TIM2_GetPrescaler
4990                     	xdef	_TIM2_GetCounter
4991                     	xdef	_TIM2_GetCapture3
4992                     	xdef	_TIM2_GetCapture2
4993                     	xdef	_TIM2_GetCapture1
4994                     	xdef	_TIM2_SetIC3Prescaler
4995                     	xdef	_TIM2_SetIC2Prescaler
4996                     	xdef	_TIM2_SetIC1Prescaler
4997                     	xdef	_TIM2_SetCompare3
4998                     	xdef	_TIM2_SetCompare2
4999                     	xdef	_TIM2_SetCompare1
5000                     	xdef	_TIM2_SetAutoreload
5001                     	xdef	_TIM2_SetCounter
5002                     	xdef	_TIM2_SelectOCxM
5003                     	xdef	_TIM2_CCxCmd
5004                     	xdef	_TIM2_OC3PolarityConfig
5005                     	xdef	_TIM2_OC2PolarityConfig
5006                     	xdef	_TIM2_OC1PolarityConfig
5007                     	xdef	_TIM2_GenerateEvent
5008                     	xdef	_TIM2_OC3PreloadConfig
5009                     	xdef	_TIM2_OC2PreloadConfig
5010                     	xdef	_TIM2_OC1PreloadConfig
5011                     	xdef	_TIM2_ARRPreloadConfig
5012                     	xdef	_TIM2_ForcedOC3Config
5013                     	xdef	_TIM2_ForcedOC2Config
5014                     	xdef	_TIM2_ForcedOC1Config
5015                     	xdef	_TIM2_PrescalerConfig
5016                     	xdef	_TIM2_SelectOnePulseMode
5017                     	xdef	_TIM2_UpdateRequestConfig
5018                     	xdef	_TIM2_UpdateDisableConfig
5019                     	xdef	_TIM2_ITConfig
5020                     	xdef	_TIM2_Cmd
5021                     	xdef	_TIM2_PWMIConfig
5022                     	xdef	_TIM2_ICInit
5023                     	xdef	_TIM2_OC3Init
5024                     	xdef	_TIM2_OC2Init
5025                     	xdef	_TIM2_OC1Init
5026                     	xdef	_TIM2_TimeBaseInit
5027                     	xdef	_TIM2_DeInit
5028                     	xref	_assert_failed
5029                     .const:	section	.text
5030  0000               L302:
5031  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
5032  0012 697665725c73  	dc.b	"iver\src\stm8s_tim"
5033  0024 322e6300      	dc.b	"2.c",0
5053                     	end
