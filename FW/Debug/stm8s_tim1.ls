   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  44                     ; 58 void TIM1_DeInit(void)
  44                     ; 59 {
  46                     	switch	.text
  47  0000               _TIM1_DeInit:
  51                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  53  0000 725f5250      	clr	21072
  54                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  56  0004 725f5251      	clr	21073
  57                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  59  0008 725f5252      	clr	21074
  60                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  62  000c 725f5253      	clr	21075
  63                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  65  0010 725f5254      	clr	21076
  66                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  68  0014 725f5256      	clr	21078
  69                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  71  0018 725f525c      	clr	21084
  72                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  74  001c 725f525d      	clr	21085
  75                     ; 70   TIM1->CCMR1 = 0x01;
  77  0020 35015258      	mov	21080,#1
  78                     ; 71   TIM1->CCMR2 = 0x01;
  80  0024 35015259      	mov	21081,#1
  81                     ; 72   TIM1->CCMR3 = 0x01;
  83  0028 3501525a      	mov	21082,#1
  84                     ; 73   TIM1->CCMR4 = 0x01;
  86  002c 3501525b      	mov	21083,#1
  87                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  89  0030 725f525c      	clr	21084
  90                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  92  0034 725f525d      	clr	21085
  93                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  95  0038 725f5258      	clr	21080
  96                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  98  003c 725f5259      	clr	21081
  99                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 101  0040 725f525a      	clr	21082
 102                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 104  0044 725f525b      	clr	21083
 105                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 107  0048 725f525e      	clr	21086
 108                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 110  004c 725f525f      	clr	21087
 111                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 113  0050 725f5260      	clr	21088
 114                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 116  0054 725f5261      	clr	21089
 117                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 119  0058 35ff5262      	mov	21090,#255
 120                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 122  005c 35ff5263      	mov	21091,#255
 123                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 125  0060 725f5265      	clr	21093
 126                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 128  0064 725f5266      	clr	21094
 129                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 131  0068 725f5267      	clr	21095
 132                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 134  006c 725f5268      	clr	21096
 135                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 137  0070 725f5269      	clr	21097
 138                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 140  0074 725f526a      	clr	21098
 141                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 143  0078 725f526b      	clr	21099
 144                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 146  007c 725f526c      	clr	21100
 147                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 149  0080 725f526f      	clr	21103
 150                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 152  0084 35015257      	mov	21079,#1
 153                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 155  0088 725f526e      	clr	21102
 156                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 158  008c 725f526d      	clr	21101
 159                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 161  0090 725f5264      	clr	21092
 162                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 164  0094 725f5255      	clr	21077
 165                     ; 101 }
 168  0098 81            	ret	
 272                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 272                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 272                     ; 113                        uint16_t TIM1_Period,
 272                     ; 114                        uint8_t TIM1_RepetitionCounter)
 272                     ; 115 {
 273                     	switch	.text
 274  0099               _TIM1_TimeBaseInit:
 276  0099 89            	pushw	x
 277       00000000      OFST:	set	0
 280                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 282  009a 7b05          	ld	a,(OFST+5,sp)
 283  009c 271e          	jreq	L41
 284  009e a110          	cp	a,#16
 285  00a0 271a          	jreq	L41
 286  00a2 a120          	cp	a,#32
 287  00a4 2716          	jreq	L41
 288  00a6 a140          	cp	a,#64
 289  00a8 2712          	jreq	L41
 290  00aa a160          	cp	a,#96
 291  00ac 270e          	jreq	L41
 292  00ae ae0075        	ldw	x,#117
 293  00b1 89            	pushw	x
 294  00b2 5f            	clrw	x
 295  00b3 89            	pushw	x
 296  00b4 ae0000        	ldw	x,#L37
 297  00b7 cd0000        	call	_assert_failed
 299  00ba 5b04          	addw	sp,#4
 300  00bc               L41:
 301                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 303  00bc 7b06          	ld	a,(OFST+6,sp)
 304  00be c75262        	ld	21090,a
 305                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 307  00c1 7b07          	ld	a,(OFST+7,sp)
 308  00c3 c75263        	ld	21091,a
 309                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 311  00c6 7b01          	ld	a,(OFST+1,sp)
 312  00c8 c75260        	ld	21088,a
 313                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 315  00cb 7b02          	ld	a,(OFST+2,sp)
 316  00cd c75261        	ld	21089,a
 317                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 317                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 319  00d0 c65250        	ld	a,21072
 320  00d3 a48f          	and	a,#143
 321  00d5 1a05          	or	a,(OFST+5,sp)
 322  00d7 c75250        	ld	21072,a
 323                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 325  00da 7b08          	ld	a,(OFST+8,sp)
 326  00dc c75264        	ld	21092,a
 327                     ; 133 }
 330  00df 85            	popw	x
 331  00e0 81            	ret	
 615                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 615                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 615                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 615                     ; 157                   uint16_t TIM1_Pulse,
 615                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 615                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 615                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 615                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 615                     ; 162 {
 616                     	switch	.text
 617  00e1               _TIM1_OC1Init:
 619  00e1 89            	pushw	x
 620  00e2 5203          	subw	sp,#3
 621       00000003      OFST:	set	3
 624                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 626  00e4 9e            	ld	a,xh
 627  00e5 4d            	tnz	a
 628  00e6 2727          	jreq	L62
 629  00e8 9e            	ld	a,xh
 630  00e9 a110          	cp	a,#16
 631  00eb 2722          	jreq	L62
 632  00ed 9e            	ld	a,xh
 633  00ee a120          	cp	a,#32
 634  00f0 271d          	jreq	L62
 635  00f2 9e            	ld	a,xh
 636  00f3 a130          	cp	a,#48
 637  00f5 2718          	jreq	L62
 638  00f7 9e            	ld	a,xh
 639  00f8 a160          	cp	a,#96
 640  00fa 2713          	jreq	L62
 641  00fc 9e            	ld	a,xh
 642  00fd a170          	cp	a,#112
 643  00ff 270e          	jreq	L62
 644  0101 ae00a4        	ldw	x,#164
 645  0104 89            	pushw	x
 646  0105 5f            	clrw	x
 647  0106 89            	pushw	x
 648  0107 ae0000        	ldw	x,#L37
 649  010a cd0000        	call	_assert_failed
 651  010d 5b04          	addw	sp,#4
 652  010f               L62:
 653                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 655  010f 7b05          	ld	a,(OFST+2,sp)
 656  0111 2712          	jreq	L63
 657  0113 a111          	cp	a,#17
 658  0115 270e          	jreq	L63
 659  0117 ae00a5        	ldw	x,#165
 660  011a 89            	pushw	x
 661  011b 5f            	clrw	x
 662  011c 89            	pushw	x
 663  011d ae0000        	ldw	x,#L37
 664  0120 cd0000        	call	_assert_failed
 666  0123 5b04          	addw	sp,#4
 667  0125               L63:
 668                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 670  0125 7b08          	ld	a,(OFST+5,sp)
 671  0127 2712          	jreq	L64
 672  0129 a144          	cp	a,#68
 673  012b 270e          	jreq	L64
 674  012d ae00a6        	ldw	x,#166
 675  0130 89            	pushw	x
 676  0131 5f            	clrw	x
 677  0132 89            	pushw	x
 678  0133 ae0000        	ldw	x,#L37
 679  0136 cd0000        	call	_assert_failed
 681  0139 5b04          	addw	sp,#4
 682  013b               L64:
 683                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 685  013b 7b0b          	ld	a,(OFST+8,sp)
 686  013d 2712          	jreq	L65
 687  013f a122          	cp	a,#34
 688  0141 270e          	jreq	L65
 689  0143 ae00a7        	ldw	x,#167
 690  0146 89            	pushw	x
 691  0147 5f            	clrw	x
 692  0148 89            	pushw	x
 693  0149 ae0000        	ldw	x,#L37
 694  014c cd0000        	call	_assert_failed
 696  014f 5b04          	addw	sp,#4
 697  0151               L65:
 698                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 700  0151 7b0c          	ld	a,(OFST+9,sp)
 701  0153 2712          	jreq	L66
 702  0155 a188          	cp	a,#136
 703  0157 270e          	jreq	L66
 704  0159 ae00a8        	ldw	x,#168
 705  015c 89            	pushw	x
 706  015d 5f            	clrw	x
 707  015e 89            	pushw	x
 708  015f ae0000        	ldw	x,#L37
 709  0162 cd0000        	call	_assert_failed
 711  0165 5b04          	addw	sp,#4
 712  0167               L66:
 713                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 715  0167 7b0d          	ld	a,(OFST+10,sp)
 716  0169 a155          	cp	a,#85
 717  016b 2712          	jreq	L67
 718  016d 7b0d          	ld	a,(OFST+10,sp)
 719  016f 270e          	jreq	L67
 720  0171 ae00a9        	ldw	x,#169
 721  0174 89            	pushw	x
 722  0175 5f            	clrw	x
 723  0176 89            	pushw	x
 724  0177 ae0000        	ldw	x,#L37
 725  017a cd0000        	call	_assert_failed
 727  017d 5b04          	addw	sp,#4
 728  017f               L67:
 729                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 731  017f 7b0e          	ld	a,(OFST+11,sp)
 732  0181 a12a          	cp	a,#42
 733  0183 2712          	jreq	L601
 734  0185 7b0e          	ld	a,(OFST+11,sp)
 735  0187 270e          	jreq	L601
 736  0189 ae00aa        	ldw	x,#170
 737  018c 89            	pushw	x
 738  018d 5f            	clrw	x
 739  018e 89            	pushw	x
 740  018f ae0000        	ldw	x,#L37
 741  0192 cd0000        	call	_assert_failed
 743  0195 5b04          	addw	sp,#4
 744  0197               L601:
 745                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 745                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 747  0197 c6525c        	ld	a,21084
 748  019a a4f0          	and	a,#240
 749  019c c7525c        	ld	21084,a
 750                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 750                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 750                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 750                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 752  019f 7b0c          	ld	a,(OFST+9,sp)
 753  01a1 a408          	and	a,#8
 754  01a3 6b03          	ld	(OFST+0,sp),a
 756  01a5 7b0b          	ld	a,(OFST+8,sp)
 757  01a7 a402          	and	a,#2
 758  01a9 1a03          	or	a,(OFST+0,sp)
 759  01ab 6b02          	ld	(OFST-1,sp),a
 761  01ad 7b08          	ld	a,(OFST+5,sp)
 762  01af a404          	and	a,#4
 763  01b1 6b01          	ld	(OFST-2,sp),a
 765  01b3 7b05          	ld	a,(OFST+2,sp)
 766  01b5 a401          	and	a,#1
 767  01b7 1a01          	or	a,(OFST-2,sp)
 768  01b9 1a02          	or	a,(OFST-1,sp)
 769  01bb ca525c        	or	a,21084
 770  01be c7525c        	ld	21084,a
 771                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 771                     ; 185                           (uint8_t)TIM1_OCMode);
 773  01c1 c65258        	ld	a,21080
 774  01c4 a48f          	and	a,#143
 775  01c6 1a04          	or	a,(OFST+1,sp)
 776  01c8 c75258        	ld	21080,a
 777                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 779  01cb c6526f        	ld	a,21103
 780  01ce a4fc          	and	a,#252
 781  01d0 c7526f        	ld	21103,a
 782                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 782                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 784  01d3 7b0e          	ld	a,(OFST+11,sp)
 785  01d5 a402          	and	a,#2
 786  01d7 6b03          	ld	(OFST+0,sp),a
 788  01d9 7b0d          	ld	a,(OFST+10,sp)
 789  01db a401          	and	a,#1
 790  01dd 1a03          	or	a,(OFST+0,sp)
 791  01df ca526f        	or	a,21103
 792  01e2 c7526f        	ld	21103,a
 793                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 795  01e5 7b09          	ld	a,(OFST+6,sp)
 796  01e7 c75265        	ld	21093,a
 797                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 799  01ea 7b0a          	ld	a,(OFST+7,sp)
 800  01ec c75266        	ld	21094,a
 801                     ; 196 }
 804  01ef 5b05          	addw	sp,#5
 805  01f1 81            	ret	
 908                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 908                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 908                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 908                     ; 220                   uint16_t TIM1_Pulse,
 908                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 908                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 908                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 908                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 908                     ; 225 {
 909                     	switch	.text
 910  01f2               _TIM1_OC2Init:
 912  01f2 89            	pushw	x
 913  01f3 5203          	subw	sp,#3
 914       00000003      OFST:	set	3
 917                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 919  01f5 9e            	ld	a,xh
 920  01f6 4d            	tnz	a
 921  01f7 2727          	jreq	L021
 922  01f9 9e            	ld	a,xh
 923  01fa a110          	cp	a,#16
 924  01fc 2722          	jreq	L021
 925  01fe 9e            	ld	a,xh
 926  01ff a120          	cp	a,#32
 927  0201 271d          	jreq	L021
 928  0203 9e            	ld	a,xh
 929  0204 a130          	cp	a,#48
 930  0206 2718          	jreq	L021
 931  0208 9e            	ld	a,xh
 932  0209 a160          	cp	a,#96
 933  020b 2713          	jreq	L021
 934  020d 9e            	ld	a,xh
 935  020e a170          	cp	a,#112
 936  0210 270e          	jreq	L021
 937  0212 ae00e3        	ldw	x,#227
 938  0215 89            	pushw	x
 939  0216 5f            	clrw	x
 940  0217 89            	pushw	x
 941  0218 ae0000        	ldw	x,#L37
 942  021b cd0000        	call	_assert_failed
 944  021e 5b04          	addw	sp,#4
 945  0220               L021:
 946                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 948  0220 7b05          	ld	a,(OFST+2,sp)
 949  0222 2712          	jreq	L031
 950  0224 a111          	cp	a,#17
 951  0226 270e          	jreq	L031
 952  0228 ae00e4        	ldw	x,#228
 953  022b 89            	pushw	x
 954  022c 5f            	clrw	x
 955  022d 89            	pushw	x
 956  022e ae0000        	ldw	x,#L37
 957  0231 cd0000        	call	_assert_failed
 959  0234 5b04          	addw	sp,#4
 960  0236               L031:
 961                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 963  0236 7b08          	ld	a,(OFST+5,sp)
 964  0238 2712          	jreq	L041
 965  023a a144          	cp	a,#68
 966  023c 270e          	jreq	L041
 967  023e ae00e5        	ldw	x,#229
 968  0241 89            	pushw	x
 969  0242 5f            	clrw	x
 970  0243 89            	pushw	x
 971  0244 ae0000        	ldw	x,#L37
 972  0247 cd0000        	call	_assert_failed
 974  024a 5b04          	addw	sp,#4
 975  024c               L041:
 976                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 978  024c 7b0b          	ld	a,(OFST+8,sp)
 979  024e 2712          	jreq	L051
 980  0250 a122          	cp	a,#34
 981  0252 270e          	jreq	L051
 982  0254 ae00e6        	ldw	x,#230
 983  0257 89            	pushw	x
 984  0258 5f            	clrw	x
 985  0259 89            	pushw	x
 986  025a ae0000        	ldw	x,#L37
 987  025d cd0000        	call	_assert_failed
 989  0260 5b04          	addw	sp,#4
 990  0262               L051:
 991                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 993  0262 7b0c          	ld	a,(OFST+9,sp)
 994  0264 2712          	jreq	L061
 995  0266 a188          	cp	a,#136
 996  0268 270e          	jreq	L061
 997  026a ae00e7        	ldw	x,#231
 998  026d 89            	pushw	x
 999  026e 5f            	clrw	x
1000  026f 89            	pushw	x
1001  0270 ae0000        	ldw	x,#L37
1002  0273 cd0000        	call	_assert_failed
1004  0276 5b04          	addw	sp,#4
1005  0278               L061:
1006                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1008  0278 7b0d          	ld	a,(OFST+10,sp)
1009  027a a155          	cp	a,#85
1010  027c 2712          	jreq	L071
1011  027e 7b0d          	ld	a,(OFST+10,sp)
1012  0280 270e          	jreq	L071
1013  0282 ae00e8        	ldw	x,#232
1014  0285 89            	pushw	x
1015  0286 5f            	clrw	x
1016  0287 89            	pushw	x
1017  0288 ae0000        	ldw	x,#L37
1018  028b cd0000        	call	_assert_failed
1020  028e 5b04          	addw	sp,#4
1021  0290               L071:
1022                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1024  0290 7b0e          	ld	a,(OFST+11,sp)
1025  0292 a12a          	cp	a,#42
1026  0294 2712          	jreq	L002
1027  0296 7b0e          	ld	a,(OFST+11,sp)
1028  0298 270e          	jreq	L002
1029  029a ae00e9        	ldw	x,#233
1030  029d 89            	pushw	x
1031  029e 5f            	clrw	x
1032  029f 89            	pushw	x
1033  02a0 ae0000        	ldw	x,#L37
1034  02a3 cd0000        	call	_assert_failed
1036  02a6 5b04          	addw	sp,#4
1037  02a8               L002:
1038                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1038                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1040  02a8 c6525c        	ld	a,21084
1041  02ab a40f          	and	a,#15
1042  02ad c7525c        	ld	21084,a
1043                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1043                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1043                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1043                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1045  02b0 7b0c          	ld	a,(OFST+9,sp)
1046  02b2 a480          	and	a,#128
1047  02b4 6b03          	ld	(OFST+0,sp),a
1049  02b6 7b0b          	ld	a,(OFST+8,sp)
1050  02b8 a420          	and	a,#32
1051  02ba 1a03          	or	a,(OFST+0,sp)
1052  02bc 6b02          	ld	(OFST-1,sp),a
1054  02be 7b08          	ld	a,(OFST+5,sp)
1055  02c0 a440          	and	a,#64
1056  02c2 6b01          	ld	(OFST-2,sp),a
1058  02c4 7b05          	ld	a,(OFST+2,sp)
1059  02c6 a410          	and	a,#16
1060  02c8 1a01          	or	a,(OFST-2,sp)
1061  02ca 1a02          	or	a,(OFST-1,sp)
1062  02cc ca525c        	or	a,21084
1063  02cf c7525c        	ld	21084,a
1064                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1064                     ; 249                           (uint8_t)TIM1_OCMode);
1066  02d2 c65259        	ld	a,21081
1067  02d5 a48f          	and	a,#143
1068  02d7 1a04          	or	a,(OFST+1,sp)
1069  02d9 c75259        	ld	21081,a
1070                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1072  02dc c6526f        	ld	a,21103
1073  02df a4f3          	and	a,#243
1074  02e1 c7526f        	ld	21103,a
1075                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1075                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1077  02e4 7b0e          	ld	a,(OFST+11,sp)
1078  02e6 a408          	and	a,#8
1079  02e8 6b03          	ld	(OFST+0,sp),a
1081  02ea 7b0d          	ld	a,(OFST+10,sp)
1082  02ec a404          	and	a,#4
1083  02ee 1a03          	or	a,(OFST+0,sp)
1084  02f0 ca526f        	or	a,21103
1085  02f3 c7526f        	ld	21103,a
1086                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1088  02f6 7b09          	ld	a,(OFST+6,sp)
1089  02f8 c75267        	ld	21095,a
1090                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1092  02fb 7b0a          	ld	a,(OFST+7,sp)
1093  02fd c75268        	ld	21096,a
1094                     ; 260 }
1097  0300 5b05          	addw	sp,#5
1098  0302 81            	ret	
1201                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1201                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
1201                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1201                     ; 284                   uint16_t TIM1_Pulse,
1201                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1201                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1201                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1201                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1201                     ; 289 {
1202                     	switch	.text
1203  0303               _TIM1_OC3Init:
1205  0303 89            	pushw	x
1206  0304 5203          	subw	sp,#3
1207       00000003      OFST:	set	3
1210                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1212  0306 9e            	ld	a,xh
1213  0307 4d            	tnz	a
1214  0308 2727          	jreq	L212
1215  030a 9e            	ld	a,xh
1216  030b a110          	cp	a,#16
1217  030d 2722          	jreq	L212
1218  030f 9e            	ld	a,xh
1219  0310 a120          	cp	a,#32
1220  0312 271d          	jreq	L212
1221  0314 9e            	ld	a,xh
1222  0315 a130          	cp	a,#48
1223  0317 2718          	jreq	L212
1224  0319 9e            	ld	a,xh
1225  031a a160          	cp	a,#96
1226  031c 2713          	jreq	L212
1227  031e 9e            	ld	a,xh
1228  031f a170          	cp	a,#112
1229  0321 270e          	jreq	L212
1230  0323 ae0123        	ldw	x,#291
1231  0326 89            	pushw	x
1232  0327 5f            	clrw	x
1233  0328 89            	pushw	x
1234  0329 ae0000        	ldw	x,#L37
1235  032c cd0000        	call	_assert_failed
1237  032f 5b04          	addw	sp,#4
1238  0331               L212:
1239                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1241  0331 7b05          	ld	a,(OFST+2,sp)
1242  0333 2712          	jreq	L222
1243  0335 a111          	cp	a,#17
1244  0337 270e          	jreq	L222
1245  0339 ae0124        	ldw	x,#292
1246  033c 89            	pushw	x
1247  033d 5f            	clrw	x
1248  033e 89            	pushw	x
1249  033f ae0000        	ldw	x,#L37
1250  0342 cd0000        	call	_assert_failed
1252  0345 5b04          	addw	sp,#4
1253  0347               L222:
1254                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1256  0347 7b08          	ld	a,(OFST+5,sp)
1257  0349 2712          	jreq	L232
1258  034b a144          	cp	a,#68
1259  034d 270e          	jreq	L232
1260  034f ae0125        	ldw	x,#293
1261  0352 89            	pushw	x
1262  0353 5f            	clrw	x
1263  0354 89            	pushw	x
1264  0355 ae0000        	ldw	x,#L37
1265  0358 cd0000        	call	_assert_failed
1267  035b 5b04          	addw	sp,#4
1268  035d               L232:
1269                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1271  035d 7b0b          	ld	a,(OFST+8,sp)
1272  035f 2712          	jreq	L242
1273  0361 a122          	cp	a,#34
1274  0363 270e          	jreq	L242
1275  0365 ae0126        	ldw	x,#294
1276  0368 89            	pushw	x
1277  0369 5f            	clrw	x
1278  036a 89            	pushw	x
1279  036b ae0000        	ldw	x,#L37
1280  036e cd0000        	call	_assert_failed
1282  0371 5b04          	addw	sp,#4
1283  0373               L242:
1284                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1286  0373 7b0c          	ld	a,(OFST+9,sp)
1287  0375 2712          	jreq	L252
1288  0377 a188          	cp	a,#136
1289  0379 270e          	jreq	L252
1290  037b ae0127        	ldw	x,#295
1291  037e 89            	pushw	x
1292  037f 5f            	clrw	x
1293  0380 89            	pushw	x
1294  0381 ae0000        	ldw	x,#L37
1295  0384 cd0000        	call	_assert_failed
1297  0387 5b04          	addw	sp,#4
1298  0389               L252:
1299                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1301  0389 7b0d          	ld	a,(OFST+10,sp)
1302  038b a155          	cp	a,#85
1303  038d 2712          	jreq	L262
1304  038f 7b0d          	ld	a,(OFST+10,sp)
1305  0391 270e          	jreq	L262
1306  0393 ae0128        	ldw	x,#296
1307  0396 89            	pushw	x
1308  0397 5f            	clrw	x
1309  0398 89            	pushw	x
1310  0399 ae0000        	ldw	x,#L37
1311  039c cd0000        	call	_assert_failed
1313  039f 5b04          	addw	sp,#4
1314  03a1               L262:
1315                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1317  03a1 7b0e          	ld	a,(OFST+11,sp)
1318  03a3 a12a          	cp	a,#42
1319  03a5 2712          	jreq	L272
1320  03a7 7b0e          	ld	a,(OFST+11,sp)
1321  03a9 270e          	jreq	L272
1322  03ab ae0129        	ldw	x,#297
1323  03ae 89            	pushw	x
1324  03af 5f            	clrw	x
1325  03b0 89            	pushw	x
1326  03b1 ae0000        	ldw	x,#L37
1327  03b4 cd0000        	call	_assert_failed
1329  03b7 5b04          	addw	sp,#4
1330  03b9               L272:
1331                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1331                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1333  03b9 c6525d        	ld	a,21085
1334  03bc a4f0          	and	a,#240
1335  03be c7525d        	ld	21085,a
1336                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1336                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1336                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1336                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1338  03c1 7b0c          	ld	a,(OFST+9,sp)
1339  03c3 a408          	and	a,#8
1340  03c5 6b03          	ld	(OFST+0,sp),a
1342  03c7 7b0b          	ld	a,(OFST+8,sp)
1343  03c9 a402          	and	a,#2
1344  03cb 1a03          	or	a,(OFST+0,sp)
1345  03cd 6b02          	ld	(OFST-1,sp),a
1347  03cf 7b08          	ld	a,(OFST+5,sp)
1348  03d1 a404          	and	a,#4
1349  03d3 6b01          	ld	(OFST-2,sp),a
1351  03d5 7b05          	ld	a,(OFST+2,sp)
1352  03d7 a401          	and	a,#1
1353  03d9 1a01          	or	a,(OFST-2,sp)
1354  03db 1a02          	or	a,(OFST-1,sp)
1355  03dd ca525d        	or	a,21085
1356  03e0 c7525d        	ld	21085,a
1357                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1357                     ; 312                           (uint8_t)TIM1_OCMode);
1359  03e3 c6525a        	ld	a,21082
1360  03e6 a48f          	and	a,#143
1361  03e8 1a04          	or	a,(OFST+1,sp)
1362  03ea c7525a        	ld	21082,a
1363                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1365  03ed c6526f        	ld	a,21103
1366  03f0 a4cf          	and	a,#207
1367  03f2 c7526f        	ld	21103,a
1368                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1368                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1370  03f5 7b0e          	ld	a,(OFST+11,sp)
1371  03f7 a420          	and	a,#32
1372  03f9 6b03          	ld	(OFST+0,sp),a
1374  03fb 7b0d          	ld	a,(OFST+10,sp)
1375  03fd a410          	and	a,#16
1376  03ff 1a03          	or	a,(OFST+0,sp)
1377  0401 ca526f        	or	a,21103
1378  0404 c7526f        	ld	21103,a
1379                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1381  0407 7b09          	ld	a,(OFST+6,sp)
1382  0409 c75269        	ld	21097,a
1383                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1385  040c 7b0a          	ld	a,(OFST+7,sp)
1386  040e c7526a        	ld	21098,a
1387                     ; 323 }
1390  0411 5b05          	addw	sp,#5
1391  0413 81            	ret	
1464                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1464                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1464                     ; 340                   uint16_t TIM1_Pulse,
1464                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1464                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1464                     ; 343 {
1465                     	switch	.text
1466  0414               _TIM1_OC4Init:
1468  0414 89            	pushw	x
1469  0415 88            	push	a
1470       00000001      OFST:	set	1
1473                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1475  0416 9e            	ld	a,xh
1476  0417 4d            	tnz	a
1477  0418 2727          	jreq	L403
1478  041a 9e            	ld	a,xh
1479  041b a110          	cp	a,#16
1480  041d 2722          	jreq	L403
1481  041f 9e            	ld	a,xh
1482  0420 a120          	cp	a,#32
1483  0422 271d          	jreq	L403
1484  0424 9e            	ld	a,xh
1485  0425 a130          	cp	a,#48
1486  0427 2718          	jreq	L403
1487  0429 9e            	ld	a,xh
1488  042a a160          	cp	a,#96
1489  042c 2713          	jreq	L403
1490  042e 9e            	ld	a,xh
1491  042f a170          	cp	a,#112
1492  0431 270e          	jreq	L403
1493  0433 ae0159        	ldw	x,#345
1494  0436 89            	pushw	x
1495  0437 5f            	clrw	x
1496  0438 89            	pushw	x
1497  0439 ae0000        	ldw	x,#L37
1498  043c cd0000        	call	_assert_failed
1500  043f 5b04          	addw	sp,#4
1501  0441               L403:
1502                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1504  0441 7b03          	ld	a,(OFST+2,sp)
1505  0443 2712          	jreq	L413
1506  0445 a111          	cp	a,#17
1507  0447 270e          	jreq	L413
1508  0449 ae015a        	ldw	x,#346
1509  044c 89            	pushw	x
1510  044d 5f            	clrw	x
1511  044e 89            	pushw	x
1512  044f ae0000        	ldw	x,#L37
1513  0452 cd0000        	call	_assert_failed
1515  0455 5b04          	addw	sp,#4
1516  0457               L413:
1517                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1519  0457 7b08          	ld	a,(OFST+7,sp)
1520  0459 2712          	jreq	L423
1521  045b a122          	cp	a,#34
1522  045d 270e          	jreq	L423
1523  045f ae015b        	ldw	x,#347
1524  0462 89            	pushw	x
1525  0463 5f            	clrw	x
1526  0464 89            	pushw	x
1527  0465 ae0000        	ldw	x,#L37
1528  0468 cd0000        	call	_assert_failed
1530  046b 5b04          	addw	sp,#4
1531  046d               L423:
1532                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1534  046d 7b09          	ld	a,(OFST+8,sp)
1535  046f a155          	cp	a,#85
1536  0471 2712          	jreq	L433
1537  0473 7b09          	ld	a,(OFST+8,sp)
1538  0475 270e          	jreq	L433
1539  0477 ae015c        	ldw	x,#348
1540  047a 89            	pushw	x
1541  047b 5f            	clrw	x
1542  047c 89            	pushw	x
1543  047d ae0000        	ldw	x,#L37
1544  0480 cd0000        	call	_assert_failed
1546  0483 5b04          	addw	sp,#4
1547  0485               L433:
1548                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1550  0485 c6525d        	ld	a,21085
1551  0488 a4cf          	and	a,#207
1552  048a c7525d        	ld	21085,a
1553                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1553                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1555  048d 7b08          	ld	a,(OFST+7,sp)
1556  048f a420          	and	a,#32
1557  0491 6b01          	ld	(OFST+0,sp),a
1559  0493 7b03          	ld	a,(OFST+2,sp)
1560  0495 a410          	and	a,#16
1561  0497 1a01          	or	a,(OFST+0,sp)
1562  0499 ca525d        	or	a,21085
1563  049c c7525d        	ld	21085,a
1564                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1564                     ; 358                           TIM1_OCMode);
1566  049f c6525b        	ld	a,21083
1567  04a2 a48f          	and	a,#143
1568  04a4 1a02          	or	a,(OFST+1,sp)
1569  04a6 c7525b        	ld	21083,a
1570                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1572  04a9 7b09          	ld	a,(OFST+8,sp)
1573  04ab 270a          	jreq	L124
1574                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1576  04ad c6526f        	ld	a,21103
1577  04b0 aadf          	or	a,#223
1578  04b2 c7526f        	ld	21103,a
1580  04b5 2004          	jra	L324
1581  04b7               L124:
1582                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1584  04b7 721d526f      	bres	21103,#6
1585  04bb               L324:
1586                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1588  04bb 7b06          	ld	a,(OFST+5,sp)
1589  04bd c7526b        	ld	21099,a
1590                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1592  04c0 7b07          	ld	a,(OFST+6,sp)
1593  04c2 c7526c        	ld	21100,a
1594                     ; 373 }
1597  04c5 5b03          	addw	sp,#3
1598  04c7 81            	ret	
1802                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1802                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1802                     ; 390                      uint8_t TIM1_DeadTime,
1802                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1802                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1802                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1802                     ; 394 {
1803                     	switch	.text
1804  04c8               _TIM1_BDTRConfig:
1806  04c8 89            	pushw	x
1807  04c9 88            	push	a
1808       00000001      OFST:	set	1
1811                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1813  04ca 9e            	ld	a,xh
1814  04cb a104          	cp	a,#4
1815  04cd 2712          	jreq	L643
1816  04cf 9e            	ld	a,xh
1817  04d0 4d            	tnz	a
1818  04d1 270e          	jreq	L643
1819  04d3 ae018c        	ldw	x,#396
1820  04d6 89            	pushw	x
1821  04d7 5f            	clrw	x
1822  04d8 89            	pushw	x
1823  04d9 ae0000        	ldw	x,#L37
1824  04dc cd0000        	call	_assert_failed
1826  04df 5b04          	addw	sp,#4
1827  04e1               L643:
1828                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1830  04e1 7b03          	ld	a,(OFST+2,sp)
1831  04e3 271a          	jreq	L653
1832  04e5 a101          	cp	a,#1
1833  04e7 2716          	jreq	L653
1834  04e9 a102          	cp	a,#2
1835  04eb 2712          	jreq	L653
1836  04ed a103          	cp	a,#3
1837  04ef 270e          	jreq	L653
1838  04f1 ae018d        	ldw	x,#397
1839  04f4 89            	pushw	x
1840  04f5 5f            	clrw	x
1841  04f6 89            	pushw	x
1842  04f7 ae0000        	ldw	x,#L37
1843  04fa cd0000        	call	_assert_failed
1845  04fd 5b04          	addw	sp,#4
1846  04ff               L653:
1847                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1849  04ff 7b07          	ld	a,(OFST+6,sp)
1850  0501 a110          	cp	a,#16
1851  0503 2712          	jreq	L663
1852  0505 7b07          	ld	a,(OFST+6,sp)
1853  0507 270e          	jreq	L663
1854  0509 ae018e        	ldw	x,#398
1855  050c 89            	pushw	x
1856  050d 5f            	clrw	x
1857  050e 89            	pushw	x
1858  050f ae0000        	ldw	x,#L37
1859  0512 cd0000        	call	_assert_failed
1861  0515 5b04          	addw	sp,#4
1862  0517               L663:
1863                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1865  0517 7b08          	ld	a,(OFST+7,sp)
1866  0519 2712          	jreq	L673
1867  051b a120          	cp	a,#32
1868  051d 270e          	jreq	L673
1869  051f ae018f        	ldw	x,#399
1870  0522 89            	pushw	x
1871  0523 5f            	clrw	x
1872  0524 89            	pushw	x
1873  0525 ae0000        	ldw	x,#L37
1874  0528 cd0000        	call	_assert_failed
1876  052b 5b04          	addw	sp,#4
1877  052d               L673:
1878                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1880  052d 7b09          	ld	a,(OFST+8,sp)
1881  052f a140          	cp	a,#64
1882  0531 2712          	jreq	L604
1883  0533 7b09          	ld	a,(OFST+8,sp)
1884  0535 270e          	jreq	L604
1885  0537 ae0190        	ldw	x,#400
1886  053a 89            	pushw	x
1887  053b 5f            	clrw	x
1888  053c 89            	pushw	x
1889  053d ae0000        	ldw	x,#L37
1890  0540 cd0000        	call	_assert_failed
1892  0543 5b04          	addw	sp,#4
1893  0545               L604:
1894                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1896  0545 7b06          	ld	a,(OFST+5,sp)
1897  0547 c7526e        	ld	21102,a
1898                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1898                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1898                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1900  054a 7b07          	ld	a,(OFST+6,sp)
1901  054c 1a08          	or	a,(OFST+7,sp)
1902  054e 1a09          	or	a,(OFST+8,sp)
1903  0550 6b01          	ld	(OFST+0,sp),a
1905  0552 7b02          	ld	a,(OFST+1,sp)
1906  0554 1a03          	or	a,(OFST+2,sp)
1907  0556 1a01          	or	a,(OFST+0,sp)
1908  0558 c7526d        	ld	21101,a
1909                     ; 409 }
1912  055b 5b03          	addw	sp,#3
1913  055d 81            	ret	
2114                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
2114                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2114                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
2114                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2114                     ; 427                  uint8_t TIM1_ICFilter)
2114                     ; 428 {
2115                     	switch	.text
2116  055e               _TIM1_ICInit:
2118  055e 89            	pushw	x
2119       00000000      OFST:	set	0
2122                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
2124  055f 9e            	ld	a,xh
2125  0560 4d            	tnz	a
2126  0561 271c          	jreq	L024
2127  0563 9e            	ld	a,xh
2128  0564 4a            	dec	a
2129  0565 2718          	jreq	L024
2130  0567 9e            	ld	a,xh
2131  0568 a102          	cp	a,#2
2132  056a 2713          	jreq	L024
2133  056c 9e            	ld	a,xh
2134  056d a103          	cp	a,#3
2135  056f 270e          	jreq	L024
2136  0571 ae01ae        	ldw	x,#430
2137  0574 89            	pushw	x
2138  0575 5f            	clrw	x
2139  0576 89            	pushw	x
2140  0577 ae0000        	ldw	x,#L37
2141  057a cd0000        	call	_assert_failed
2143  057d 5b04          	addw	sp,#4
2144  057f               L024:
2145                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2147  057f 7b02          	ld	a,(OFST+2,sp)
2148  0581 2711          	jreq	L034
2149  0583 4a            	dec	a
2150  0584 270e          	jreq	L034
2151  0586 ae01af        	ldw	x,#431
2152  0589 89            	pushw	x
2153  058a 5f            	clrw	x
2154  058b 89            	pushw	x
2155  058c ae0000        	ldw	x,#L37
2156  058f cd0000        	call	_assert_failed
2158  0592 5b04          	addw	sp,#4
2159  0594               L034:
2160                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2162  0594 7b05          	ld	a,(OFST+5,sp)
2163  0596 a101          	cp	a,#1
2164  0598 2716          	jreq	L044
2165  059a a102          	cp	a,#2
2166  059c 2712          	jreq	L044
2167  059e a103          	cp	a,#3
2168  05a0 270e          	jreq	L044
2169  05a2 ae01b0        	ldw	x,#432
2170  05a5 89            	pushw	x
2171  05a6 5f            	clrw	x
2172  05a7 89            	pushw	x
2173  05a8 ae0000        	ldw	x,#L37
2174  05ab cd0000        	call	_assert_failed
2176  05ae 5b04          	addw	sp,#4
2177  05b0               L044:
2178                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2180  05b0 7b06          	ld	a,(OFST+6,sp)
2181  05b2 271a          	jreq	L054
2182  05b4 a104          	cp	a,#4
2183  05b6 2716          	jreq	L054
2184  05b8 a108          	cp	a,#8
2185  05ba 2712          	jreq	L054
2186  05bc a10c          	cp	a,#12
2187  05be 270e          	jreq	L054
2188  05c0 ae01b1        	ldw	x,#433
2189  05c3 89            	pushw	x
2190  05c4 5f            	clrw	x
2191  05c5 89            	pushw	x
2192  05c6 ae0000        	ldw	x,#L37
2193  05c9 cd0000        	call	_assert_failed
2195  05cc 5b04          	addw	sp,#4
2196  05ce               L054:
2197                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
2199  05ce 7b07          	ld	a,(OFST+7,sp)
2200  05d0 a110          	cp	a,#16
2201  05d2 250e          	jrult	L654
2202  05d4 ae01b2        	ldw	x,#434
2203  05d7 89            	pushw	x
2204  05d8 5f            	clrw	x
2205  05d9 89            	pushw	x
2206  05da ae0000        	ldw	x,#L37
2207  05dd cd0000        	call	_assert_failed
2209  05e0 5b04          	addw	sp,#4
2210  05e2               L654:
2211                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
2213  05e2 7b01          	ld	a,(OFST+1,sp)
2214  05e4 2614          	jrne	L746
2215                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
2215                     ; 440                (uint8_t)TIM1_ICSelection,
2215                     ; 441                (uint8_t)TIM1_ICFilter);
2217  05e6 7b07          	ld	a,(OFST+7,sp)
2218  05e8 88            	push	a
2219  05e9 7b06          	ld	a,(OFST+6,sp)
2220  05eb 97            	ld	xl,a
2221  05ec 7b03          	ld	a,(OFST+3,sp)
2222  05ee 95            	ld	xh,a
2223  05ef cd123c        	call	L3_TI1_Config
2225  05f2 84            	pop	a
2226                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2228  05f3 7b06          	ld	a,(OFST+6,sp)
2229  05f5 cd0ff8        	call	_TIM1_SetIC1Prescaler
2232  05f8 2042          	jra	L156
2233  05fa               L746:
2234                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
2236  05fa a101          	cp	a,#1
2237  05fc 2614          	jrne	L356
2238                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
2238                     ; 449                (uint8_t)TIM1_ICSelection,
2238                     ; 450                (uint8_t)TIM1_ICFilter);
2240  05fe 7b07          	ld	a,(OFST+7,sp)
2241  0600 88            	push	a
2242  0601 7b06          	ld	a,(OFST+6,sp)
2243  0603 97            	ld	xl,a
2244  0604 7b03          	ld	a,(OFST+3,sp)
2245  0606 95            	ld	xh,a
2246  0607 cd126c        	call	L5_TI2_Config
2248  060a 84            	pop	a
2249                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2251  060b 7b06          	ld	a,(OFST+6,sp)
2252  060d cd1022        	call	_TIM1_SetIC2Prescaler
2255  0610 202a          	jra	L156
2256  0612               L356:
2257                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
2259  0612 a102          	cp	a,#2
2260  0614 2614          	jrne	L756
2261                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
2261                     ; 458                (uint8_t)TIM1_ICSelection,
2261                     ; 459                (uint8_t)TIM1_ICFilter);
2263  0616 7b07          	ld	a,(OFST+7,sp)
2264  0618 88            	push	a
2265  0619 7b06          	ld	a,(OFST+6,sp)
2266  061b 97            	ld	xl,a
2267  061c 7b03          	ld	a,(OFST+3,sp)
2268  061e 95            	ld	xh,a
2269  061f cd129c        	call	L7_TI3_Config
2271  0622 84            	pop	a
2272                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
2274  0623 7b06          	ld	a,(OFST+6,sp)
2275  0625 cd104c        	call	_TIM1_SetIC3Prescaler
2278  0628 2012          	jra	L156
2279  062a               L756:
2280                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
2280                     ; 467                (uint8_t)TIM1_ICSelection,
2280                     ; 468                (uint8_t)TIM1_ICFilter);
2282  062a 7b07          	ld	a,(OFST+7,sp)
2283  062c 88            	push	a
2284  062d 7b06          	ld	a,(OFST+6,sp)
2285  062f 97            	ld	xl,a
2286  0630 7b03          	ld	a,(OFST+3,sp)
2287  0632 95            	ld	xh,a
2288  0633 cd12cc        	call	L11_TI4_Config
2290  0636 84            	pop	a
2291                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
2293  0637 7b06          	ld	a,(OFST+6,sp)
2294  0639 cd1076        	call	_TIM1_SetIC4Prescaler
2296  063c               L156:
2297                     ; 472 }
2300  063c 85            	popw	x
2301  063d 81            	ret	
2392                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
2392                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2392                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
2392                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2392                     ; 492                      uint8_t TIM1_ICFilter)
2392                     ; 493 {
2393                     	switch	.text
2394  063e               _TIM1_PWMIConfig:
2396  063e 89            	pushw	x
2397  063f 89            	pushw	x
2398       00000002      OFST:	set	2
2401                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
2403                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
2405                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
2407  0640 9e            	ld	a,xh
2408  0641 4d            	tnz	a
2409  0642 2712          	jreq	L015
2410  0644 9e            	ld	a,xh
2411  0645 4a            	dec	a
2412  0646 270e          	jreq	L015
2413  0648 ae01f2        	ldw	x,#498
2414  064b 89            	pushw	x
2415  064c 5f            	clrw	x
2416  064d 89            	pushw	x
2417  064e ae0000        	ldw	x,#L37
2418  0651 cd0000        	call	_assert_failed
2420  0654 5b04          	addw	sp,#4
2421  0656               L015:
2422                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2424  0656 7b04          	ld	a,(OFST+2,sp)
2425  0658 2711          	jreq	L025
2426  065a 4a            	dec	a
2427  065b 270e          	jreq	L025
2428  065d ae01f3        	ldw	x,#499
2429  0660 89            	pushw	x
2430  0661 5f            	clrw	x
2431  0662 89            	pushw	x
2432  0663 ae0000        	ldw	x,#L37
2433  0666 cd0000        	call	_assert_failed
2435  0669 5b04          	addw	sp,#4
2436  066b               L025:
2437                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2439  066b 7b07          	ld	a,(OFST+5,sp)
2440  066d a101          	cp	a,#1
2441  066f 2716          	jreq	L035
2442  0671 a102          	cp	a,#2
2443  0673 2712          	jreq	L035
2444  0675 a103          	cp	a,#3
2445  0677 270e          	jreq	L035
2446  0679 ae01f4        	ldw	x,#500
2447  067c 89            	pushw	x
2448  067d 5f            	clrw	x
2449  067e 89            	pushw	x
2450  067f ae0000        	ldw	x,#L37
2451  0682 cd0000        	call	_assert_failed
2453  0685 5b04          	addw	sp,#4
2454  0687               L035:
2455                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2457  0687 7b08          	ld	a,(OFST+6,sp)
2458  0689 271a          	jreq	L045
2459  068b a104          	cp	a,#4
2460  068d 2716          	jreq	L045
2461  068f a108          	cp	a,#8
2462  0691 2712          	jreq	L045
2463  0693 a10c          	cp	a,#12
2464  0695 270e          	jreq	L045
2465  0697 ae01f5        	ldw	x,#501
2466  069a 89            	pushw	x
2467  069b 5f            	clrw	x
2468  069c 89            	pushw	x
2469  069d ae0000        	ldw	x,#L37
2470  06a0 cd0000        	call	_assert_failed
2472  06a3 5b04          	addw	sp,#4
2473  06a5               L045:
2474                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
2476  06a5 7b04          	ld	a,(OFST+2,sp)
2477  06a7 4a            	dec	a
2478  06a8 2702          	jreq	L327
2479                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
2481  06aa a601          	ld	a,#1
2483  06ac               L327:
2484                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
2486  06ac 6b01          	ld	(OFST-1,sp),a
2488                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
2490  06ae 7b07          	ld	a,(OFST+5,sp)
2491  06b0 4a            	dec	a
2492  06b1 2604          	jrne	L727
2493                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
2495  06b3 a602          	ld	a,#2
2497  06b5 2002          	jra	L137
2498  06b7               L727:
2499                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
2501  06b7 a601          	ld	a,#1
2502  06b9               L137:
2503  06b9 6b02          	ld	(OFST+0,sp),a
2505                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
2507  06bb 7b03          	ld	a,(OFST+1,sp)
2508  06bd 2626          	jrne	L337
2509                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2509                     ; 527                (uint8_t)TIM1_ICFilter);
2511  06bf 7b09          	ld	a,(OFST+7,sp)
2512  06c1 88            	push	a
2513  06c2 7b08          	ld	a,(OFST+6,sp)
2514  06c4 97            	ld	xl,a
2515  06c5 7b05          	ld	a,(OFST+3,sp)
2516  06c7 95            	ld	xh,a
2517  06c8 cd123c        	call	L3_TI1_Config
2519  06cb 84            	pop	a
2520                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2522  06cc 7b08          	ld	a,(OFST+6,sp)
2523  06ce cd0ff8        	call	_TIM1_SetIC1Prescaler
2525                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
2527  06d1 7b09          	ld	a,(OFST+7,sp)
2528  06d3 88            	push	a
2529  06d4 7b03          	ld	a,(OFST+1,sp)
2530  06d6 97            	ld	xl,a
2531  06d7 7b02          	ld	a,(OFST+0,sp)
2532  06d9 95            	ld	xh,a
2533  06da cd126c        	call	L5_TI2_Config
2535  06dd 84            	pop	a
2536                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2538  06de 7b08          	ld	a,(OFST+6,sp)
2539  06e0 cd1022        	call	_TIM1_SetIC2Prescaler
2542  06e3 2024          	jra	L537
2543  06e5               L337:
2544                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2544                     ; 542                (uint8_t)TIM1_ICFilter);
2546  06e5 7b09          	ld	a,(OFST+7,sp)
2547  06e7 88            	push	a
2548  06e8 7b08          	ld	a,(OFST+6,sp)
2549  06ea 97            	ld	xl,a
2550  06eb 7b05          	ld	a,(OFST+3,sp)
2551  06ed 95            	ld	xh,a
2552  06ee cd126c        	call	L5_TI2_Config
2554  06f1 84            	pop	a
2555                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2557  06f2 7b08          	ld	a,(OFST+6,sp)
2558  06f4 cd1022        	call	_TIM1_SetIC2Prescaler
2560                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
2562  06f7 7b09          	ld	a,(OFST+7,sp)
2563  06f9 88            	push	a
2564  06fa 7b03          	ld	a,(OFST+1,sp)
2565  06fc 97            	ld	xl,a
2566  06fd 7b02          	ld	a,(OFST+0,sp)
2567  06ff 95            	ld	xh,a
2568  0700 cd123c        	call	L3_TI1_Config
2570  0703 84            	pop	a
2571                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2573  0704 7b08          	ld	a,(OFST+6,sp)
2574  0706 cd0ff8        	call	_TIM1_SetIC1Prescaler
2576  0709               L537:
2577                     ; 553 }
2580  0709 5b04          	addw	sp,#4
2581  070b 81            	ret	
2637                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2637                     ; 562 {
2638                     	switch	.text
2639  070c               _TIM1_Cmd:
2641  070c 88            	push	a
2642       00000000      OFST:	set	0
2645                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2647  070d 4d            	tnz	a
2648  070e 2711          	jreq	L275
2649  0710 4a            	dec	a
2650  0711 270e          	jreq	L275
2651  0713 ae0234        	ldw	x,#564
2652  0716 89            	pushw	x
2653  0717 5f            	clrw	x
2654  0718 89            	pushw	x
2655  0719 ae0000        	ldw	x,#L37
2656  071c cd0000        	call	_assert_failed
2658  071f 5b04          	addw	sp,#4
2659  0721               L275:
2660                     ; 567   if (NewState != DISABLE)
2662  0721 7b01          	ld	a,(OFST+1,sp)
2663  0723 2706          	jreq	L567
2664                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2666  0725 72105250      	bset	21072,#0
2668  0729 2004          	jra	L767
2669  072b               L567:
2670                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2672  072b 72115250      	bres	21072,#0
2673  072f               L767:
2674                     ; 575 }
2677  072f 84            	pop	a
2678  0730 81            	ret	
2715                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2715                     ; 584 {
2716                     	switch	.text
2717  0731               _TIM1_CtrlPWMOutputs:
2719  0731 88            	push	a
2720       00000000      OFST:	set	0
2723                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2725  0732 4d            	tnz	a
2726  0733 2711          	jreq	L406
2727  0735 4a            	dec	a
2728  0736 270e          	jreq	L406
2729  0738 ae024a        	ldw	x,#586
2730  073b 89            	pushw	x
2731  073c 5f            	clrw	x
2732  073d 89            	pushw	x
2733  073e ae0000        	ldw	x,#L37
2734  0741 cd0000        	call	_assert_failed
2736  0744 5b04          	addw	sp,#4
2737  0746               L406:
2738                     ; 590   if (NewState != DISABLE)
2740  0746 7b01          	ld	a,(OFST+1,sp)
2741  0748 2706          	jreq	L7001
2742                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2744  074a 721e526d      	bset	21101,#7
2746  074e 2004          	jra	L1101
2747  0750               L7001:
2748                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2750  0750 721f526d      	bres	21101,#7
2751  0754               L1101:
2752                     ; 598 }
2755  0754 84            	pop	a
2756  0755 81            	ret	
2864                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2864                     ; 618 {
2865                     	switch	.text
2866  0756               _TIM1_ITConfig:
2868  0756 89            	pushw	x
2869       00000000      OFST:	set	0
2872                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2874  0757 9e            	ld	a,xh
2875  0758 4d            	tnz	a
2876  0759 260e          	jrne	L416
2877  075b ae026c        	ldw	x,#620
2878  075e 89            	pushw	x
2879  075f 5f            	clrw	x
2880  0760 89            	pushw	x
2881  0761 ae0000        	ldw	x,#L37
2882  0764 cd0000        	call	_assert_failed
2884  0767 5b04          	addw	sp,#4
2885  0769               L416:
2886                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2888  0769 7b02          	ld	a,(OFST+2,sp)
2889  076b 2711          	jreq	L426
2890  076d 4a            	dec	a
2891  076e 270e          	jreq	L426
2892  0770 ae026d        	ldw	x,#621
2893  0773 89            	pushw	x
2894  0774 5f            	clrw	x
2895  0775 89            	pushw	x
2896  0776 ae0000        	ldw	x,#L37
2897  0779 cd0000        	call	_assert_failed
2899  077c 5b04          	addw	sp,#4
2900  077e               L426:
2901                     ; 623   if (NewState != DISABLE)
2903  077e 7b02          	ld	a,(OFST+2,sp)
2904  0780 2707          	jreq	L1601
2905                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2907  0782 c65254        	ld	a,21076
2908  0785 1a01          	or	a,(OFST+1,sp)
2910  0787 2006          	jra	L3601
2911  0789               L1601:
2912                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2914  0789 7b01          	ld	a,(OFST+1,sp)
2915  078b 43            	cpl	a
2916  078c c45254        	and	a,21076
2917  078f               L3601:
2918  078f c75254        	ld	21076,a
2919                     ; 633 }
2922  0792 85            	popw	x
2923  0793 81            	ret	
2947                     ; 640 void TIM1_InternalClockConfig(void)
2947                     ; 641 {
2948                     	switch	.text
2949  0794               _TIM1_InternalClockConfig:
2953                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2955  0794 c65252        	ld	a,21074
2956  0797 a4f8          	and	a,#248
2957  0799 c75252        	ld	21074,a
2958                     ; 644 }
2961  079c 81            	ret	
3077                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3077                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3077                     ; 664                               uint8_t ExtTRGFilter)
3077                     ; 665 {
3078                     	switch	.text
3079  079d               _TIM1_ETRClockMode1Config:
3081  079d 89            	pushw	x
3082       00000000      OFST:	set	0
3085                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3087  079e 9e            	ld	a,xh
3088  079f 4d            	tnz	a
3089  07a0 271d          	jreq	L046
3090  07a2 9e            	ld	a,xh
3091  07a3 a110          	cp	a,#16
3092  07a5 2718          	jreq	L046
3093  07a7 9e            	ld	a,xh
3094  07a8 a120          	cp	a,#32
3095  07aa 2713          	jreq	L046
3096  07ac 9e            	ld	a,xh
3097  07ad a130          	cp	a,#48
3098  07af 270e          	jreq	L046
3099  07b1 ae029b        	ldw	x,#667
3100  07b4 89            	pushw	x
3101  07b5 5f            	clrw	x
3102  07b6 89            	pushw	x
3103  07b7 ae0000        	ldw	x,#L37
3104  07ba cd0000        	call	_assert_failed
3106  07bd 5b04          	addw	sp,#4
3107  07bf               L046:
3108                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3110  07bf 7b02          	ld	a,(OFST+2,sp)
3111  07c1 a180          	cp	a,#128
3112  07c3 2712          	jreq	L056
3113  07c5 7b02          	ld	a,(OFST+2,sp)
3114  07c7 270e          	jreq	L056
3115  07c9 ae029c        	ldw	x,#668
3116  07cc 89            	pushw	x
3117  07cd 5f            	clrw	x
3118  07ce 89            	pushw	x
3119  07cf ae0000        	ldw	x,#L37
3120  07d2 cd0000        	call	_assert_failed
3122  07d5 5b04          	addw	sp,#4
3123  07d7               L056:
3124                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3126  07d7 7b05          	ld	a,(OFST+5,sp)
3127  07d9 88            	push	a
3128  07da 7b03          	ld	a,(OFST+3,sp)
3129  07dc 97            	ld	xl,a
3130  07dd 7b02          	ld	a,(OFST+2,sp)
3131  07df 95            	ld	xh,a
3132  07e0 ad57          	call	_TIM1_ETRConfig
3134  07e2 84            	pop	a
3135                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
3135                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
3137  07e3 c65252        	ld	a,21074
3138  07e6 aa77          	or	a,#119
3139  07e8 c75252        	ld	21074,a
3140                     ; 676 }
3143  07eb 85            	popw	x
3144  07ec 81            	ret	
3201                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3201                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3201                     ; 696                               uint8_t ExtTRGFilter)
3201                     ; 697 {
3202                     	switch	.text
3203  07ed               _TIM1_ETRClockMode2Config:
3205  07ed 89            	pushw	x
3206       00000000      OFST:	set	0
3209                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3211  07ee 9e            	ld	a,xh
3212  07ef 4d            	tnz	a
3213  07f0 271d          	jreq	L466
3214  07f2 9e            	ld	a,xh
3215  07f3 a110          	cp	a,#16
3216  07f5 2718          	jreq	L466
3217  07f7 9e            	ld	a,xh
3218  07f8 a120          	cp	a,#32
3219  07fa 2713          	jreq	L466
3220  07fc 9e            	ld	a,xh
3221  07fd a130          	cp	a,#48
3222  07ff 270e          	jreq	L466
3223  0801 ae02bb        	ldw	x,#699
3224  0804 89            	pushw	x
3225  0805 5f            	clrw	x
3226  0806 89            	pushw	x
3227  0807 ae0000        	ldw	x,#L37
3228  080a cd0000        	call	_assert_failed
3230  080d 5b04          	addw	sp,#4
3231  080f               L466:
3232                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3234  080f 7b02          	ld	a,(OFST+2,sp)
3235  0811 a180          	cp	a,#128
3236  0813 2712          	jreq	L476
3237  0815 7b02          	ld	a,(OFST+2,sp)
3238  0817 270e          	jreq	L476
3239  0819 ae02bc        	ldw	x,#700
3240  081c 89            	pushw	x
3241  081d 5f            	clrw	x
3242  081e 89            	pushw	x
3243  081f ae0000        	ldw	x,#L37
3244  0822 cd0000        	call	_assert_failed
3246  0825 5b04          	addw	sp,#4
3247  0827               L476:
3248                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3250  0827 7b05          	ld	a,(OFST+5,sp)
3251  0829 88            	push	a
3252  082a 7b03          	ld	a,(OFST+3,sp)
3253  082c 97            	ld	xl,a
3254  082d 7b02          	ld	a,(OFST+2,sp)
3255  082f 95            	ld	xh,a
3256  0830 ad07          	call	_TIM1_ETRConfig
3258  0832 721c5253      	bset	21075,#6
3259                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
3261                     ; 707 }
3264  0836 5b03          	addw	sp,#3
3265  0838 81            	ret	
3320                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3320                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3320                     ; 727                     uint8_t ExtTRGFilter)
3320                     ; 728 {
3321                     	switch	.text
3322  0839               _TIM1_ETRConfig:
3324  0839 89            	pushw	x
3325       00000000      OFST:	set	0
3328                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
3330  083a 7b05          	ld	a,(OFST+5,sp)
3331  083c a110          	cp	a,#16
3332  083e 250e          	jrult	L607
3333  0840 ae02da        	ldw	x,#730
3334  0843 89            	pushw	x
3335  0844 5f            	clrw	x
3336  0845 89            	pushw	x
3337  0846 ae0000        	ldw	x,#L37
3338  0849 cd0000        	call	_assert_failed
3340  084c 5b04          	addw	sp,#4
3341  084e               L607:
3342                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
3342                     ; 733                          (uint8_t)ExtTRGFilter );
3344  084e 7b01          	ld	a,(OFST+1,sp)
3345  0850 1a02          	or	a,(OFST+2,sp)
3346  0852 1a05          	or	a,(OFST+5,sp)
3347  0854 ca5253        	or	a,21075
3348  0857 c75253        	ld	21075,a
3349                     ; 734 }
3352  085a 85            	popw	x
3353  085b 81            	ret	
3441                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
3441                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
3441                     ; 753                                  uint8_t ICFilter)
3441                     ; 754 {
3442                     	switch	.text
3443  085c               _TIM1_TIxExternalClockConfig:
3445  085c 89            	pushw	x
3446       00000000      OFST:	set	0
3449                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
3451  085d 9e            	ld	a,xh
3452  085e a140          	cp	a,#64
3453  0860 2718          	jreq	L027
3454  0862 9e            	ld	a,xh
3455  0863 a160          	cp	a,#96
3456  0865 2713          	jreq	L027
3457  0867 9e            	ld	a,xh
3458  0868 a150          	cp	a,#80
3459  086a 270e          	jreq	L027
3460  086c ae02f4        	ldw	x,#756
3461  086f 89            	pushw	x
3462  0870 5f            	clrw	x
3463  0871 89            	pushw	x
3464  0872 ae0000        	ldw	x,#L37
3465  0875 cd0000        	call	_assert_failed
3467  0878 5b04          	addw	sp,#4
3468  087a               L027:
3469                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
3471  087a 7b02          	ld	a,(OFST+2,sp)
3472  087c 2711          	jreq	L037
3473  087e 4a            	dec	a
3474  087f 270e          	jreq	L037
3475  0881 ae02f5        	ldw	x,#757
3476  0884 89            	pushw	x
3477  0885 5f            	clrw	x
3478  0886 89            	pushw	x
3479  0887 ae0000        	ldw	x,#L37
3480  088a cd0000        	call	_assert_failed
3482  088d 5b04          	addw	sp,#4
3483  088f               L037:
3484                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
3486  088f 7b05          	ld	a,(OFST+5,sp)
3487  0891 a110          	cp	a,#16
3488  0893 250e          	jrult	L637
3489  0895 ae02f6        	ldw	x,#758
3490  0898 89            	pushw	x
3491  0899 5f            	clrw	x
3492  089a 89            	pushw	x
3493  089b ae0000        	ldw	x,#L37
3494  089e cd0000        	call	_assert_failed
3496  08a1 5b04          	addw	sp,#4
3497  08a3               L637:
3498                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
3500  08a3 7b01          	ld	a,(OFST+1,sp)
3501  08a5 a160          	cp	a,#96
3502  08a7 260e          	jrne	L3521
3503                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3505  08a9 7b05          	ld	a,(OFST+5,sp)
3506  08ab 88            	push	a
3507  08ac 7b03          	ld	a,(OFST+3,sp)
3508  08ae ae0001        	ldw	x,#1
3509  08b1 95            	ld	xh,a
3510  08b2 cd126c        	call	L5_TI2_Config
3513  08b5 200c          	jra	L5521
3514  08b7               L3521:
3515                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3517  08b7 7b05          	ld	a,(OFST+5,sp)
3518  08b9 88            	push	a
3519  08ba 7b03          	ld	a,(OFST+3,sp)
3520  08bc ae0001        	ldw	x,#1
3521  08bf 95            	ld	xh,a
3522  08c0 cd123c        	call	L3_TI1_Config
3524  08c3               L5521:
3525  08c3 84            	pop	a
3526                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
3528  08c4 7b01          	ld	a,(OFST+1,sp)
3529  08c6 ad0a          	call	_TIM1_SelectInputTrigger
3531                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
3533  08c8 c65252        	ld	a,21074
3534  08cb aa07          	or	a,#7
3535  08cd c75252        	ld	21074,a
3536                     ; 775 }
3539  08d0 85            	popw	x
3540  08d1 81            	ret	
3626                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
3626                     ; 788 {
3627                     	switch	.text
3628  08d2               _TIM1_SelectInputTrigger:
3630  08d2 88            	push	a
3631       00000000      OFST:	set	0
3634                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
3636  08d3 a140          	cp	a,#64
3637  08d5 2721          	jreq	L657
3638  08d7 a150          	cp	a,#80
3639  08d9 271d          	jreq	L657
3640  08db a160          	cp	a,#96
3641  08dd 2719          	jreq	L657
3642  08df a170          	cp	a,#112
3643  08e1 2715          	jreq	L657
3644  08e3 a130          	cp	a,#48
3645  08e5 2711          	jreq	L657
3646  08e7 4d            	tnz	a
3647  08e8 270e          	jreq	L657
3648  08ea ae0316        	ldw	x,#790
3649  08ed 89            	pushw	x
3650  08ee 5f            	clrw	x
3651  08ef 89            	pushw	x
3652  08f0 ae0000        	ldw	x,#L37
3653  08f3 cd0000        	call	_assert_failed
3655  08f6 5b04          	addw	sp,#4
3656  08f8               L657:
3657                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
3659  08f8 c65252        	ld	a,21074
3660  08fb a48f          	and	a,#143
3661  08fd 1a01          	or	a,(OFST+1,sp)
3662  08ff c75252        	ld	21074,a
3663                     ; 794 }
3666  0902 84            	pop	a
3667  0903 81            	ret	
3704                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
3704                     ; 804 {
3705                     	switch	.text
3706  0904               _TIM1_UpdateDisableConfig:
3708  0904 88            	push	a
3709       00000000      OFST:	set	0
3712                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3714  0905 4d            	tnz	a
3715  0906 2711          	jreq	L077
3716  0908 4a            	dec	a
3717  0909 270e          	jreq	L077
3718  090b ae0326        	ldw	x,#806
3719  090e 89            	pushw	x
3720  090f 5f            	clrw	x
3721  0910 89            	pushw	x
3722  0911 ae0000        	ldw	x,#L37
3723  0914 cd0000        	call	_assert_failed
3725  0917 5b04          	addw	sp,#4
3726  0919               L077:
3727                     ; 809   if (NewState != DISABLE)
3729  0919 7b01          	ld	a,(OFST+1,sp)
3730  091b 2706          	jreq	L3331
3731                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
3733  091d 72125250      	bset	21072,#1
3735  0921 2004          	jra	L5331
3736  0923               L3331:
3737                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
3739  0923 72135250      	bres	21072,#1
3740  0927               L5331:
3741                     ; 817 }
3744  0927 84            	pop	a
3745  0928 81            	ret	
3804                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
3804                     ; 828 {
3805                     	switch	.text
3806  0929               _TIM1_UpdateRequestConfig:
3808  0929 88            	push	a
3809       00000000      OFST:	set	0
3812                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
3814  092a 4d            	tnz	a
3815  092b 2711          	jreq	L2001
3816  092d 4a            	dec	a
3817  092e 270e          	jreq	L2001
3818  0930 ae033e        	ldw	x,#830
3819  0933 89            	pushw	x
3820  0934 5f            	clrw	x
3821  0935 89            	pushw	x
3822  0936 ae0000        	ldw	x,#L37
3823  0939 cd0000        	call	_assert_failed
3825  093c 5b04          	addw	sp,#4
3826  093e               L2001:
3827                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
3829  093e 7b01          	ld	a,(OFST+1,sp)
3830  0940 2706          	jreq	L5631
3831                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
3833  0942 72145250      	bset	21072,#2
3835  0946 2004          	jra	L7631
3836  0948               L5631:
3837                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3839  0948 72155250      	bres	21072,#2
3840  094c               L7631:
3841                     ; 841 }
3844  094c 84            	pop	a
3845  094d 81            	ret	
3882                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3882                     ; 850 {
3883                     	switch	.text
3884  094e               _TIM1_SelectHallSensor:
3886  094e 88            	push	a
3887       00000000      OFST:	set	0
3890                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3892  094f 4d            	tnz	a
3893  0950 2711          	jreq	L4101
3894  0952 4a            	dec	a
3895  0953 270e          	jreq	L4101
3896  0955 ae0354        	ldw	x,#852
3897  0958 89            	pushw	x
3898  0959 5f            	clrw	x
3899  095a 89            	pushw	x
3900  095b ae0000        	ldw	x,#L37
3901  095e cd0000        	call	_assert_failed
3903  0961 5b04          	addw	sp,#4
3904  0963               L4101:
3905                     ; 855   if (NewState != DISABLE)
3907  0963 7b01          	ld	a,(OFST+1,sp)
3908  0965 2706          	jreq	L7041
3909                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3911  0967 721e5251      	bset	21073,#7
3913  096b 2004          	jra	L1141
3914  096d               L7041:
3915                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3917  096d 721f5251      	bres	21073,#7
3918  0971               L1141:
3919                     ; 863 }
3922  0971 84            	pop	a
3923  0972 81            	ret	
3981                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3981                     ; 874 {
3982                     	switch	.text
3983  0973               _TIM1_SelectOnePulseMode:
3985  0973 88            	push	a
3986       00000000      OFST:	set	0
3989                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3991  0974 a101          	cp	a,#1
3992  0976 2711          	jreq	L6201
3993  0978 4d            	tnz	a
3994  0979 270e          	jreq	L6201
3995  097b ae036c        	ldw	x,#876
3996  097e 89            	pushw	x
3997  097f 5f            	clrw	x
3998  0980 89            	pushw	x
3999  0981 ae0000        	ldw	x,#L37
4000  0984 cd0000        	call	_assert_failed
4002  0987 5b04          	addw	sp,#4
4003  0989               L6201:
4004                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
4006  0989 7b01          	ld	a,(OFST+1,sp)
4007  098b 2706          	jreq	L1441
4008                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
4010  098d 72165250      	bset	21072,#3
4012  0991 2004          	jra	L3441
4013  0993               L1441:
4014                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
4016  0993 72175250      	bres	21072,#3
4017  0997               L3441:
4018                     ; 888 }
4021  0997 84            	pop	a
4022  0998 81            	ret	
4121                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
4121                     ; 904 {
4122                     	switch	.text
4123  0999               _TIM1_SelectOutputTrigger:
4125  0999 88            	push	a
4126       00000000      OFST:	set	0
4129                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
4131  099a 4d            	tnz	a
4132  099b 2726          	jreq	L0401
4133  099d a110          	cp	a,#16
4134  099f 2722          	jreq	L0401
4135  09a1 a120          	cp	a,#32
4136  09a3 271e          	jreq	L0401
4137  09a5 a130          	cp	a,#48
4138  09a7 271a          	jreq	L0401
4139  09a9 a140          	cp	a,#64
4140  09ab 2716          	jreq	L0401
4141  09ad a150          	cp	a,#80
4142  09af 2712          	jreq	L0401
4143  09b1 a160          	cp	a,#96
4144  09b3 270e          	jreq	L0401
4145  09b5 ae038a        	ldw	x,#906
4146  09b8 89            	pushw	x
4147  09b9 5f            	clrw	x
4148  09ba 89            	pushw	x
4149  09bb ae0000        	ldw	x,#L37
4150  09be cd0000        	call	_assert_failed
4152  09c1 5b04          	addw	sp,#4
4153  09c3               L0401:
4154                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
4154                     ; 910                         (uint8_t) TIM1_TRGOSource);
4156  09c3 c65251        	ld	a,21073
4157  09c6 a48f          	and	a,#143
4158  09c8 1a01          	or	a,(OFST+1,sp)
4159  09ca c75251        	ld	21073,a
4160                     ; 911 }
4163  09cd 84            	pop	a
4164  09ce 81            	ret	
4239                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
4239                     ; 924 {
4240                     	switch	.text
4241  09cf               _TIM1_SelectSlaveMode:
4243  09cf 88            	push	a
4244       00000000      OFST:	set	0
4247                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
4249  09d0 a104          	cp	a,#4
4250  09d2 271a          	jreq	L2501
4251  09d4 a105          	cp	a,#5
4252  09d6 2716          	jreq	L2501
4253  09d8 a106          	cp	a,#6
4254  09da 2712          	jreq	L2501
4255  09dc a107          	cp	a,#7
4256  09de 270e          	jreq	L2501
4257  09e0 ae039e        	ldw	x,#926
4258  09e3 89            	pushw	x
4259  09e4 5f            	clrw	x
4260  09e5 89            	pushw	x
4261  09e6 ae0000        	ldw	x,#L37
4262  09e9 cd0000        	call	_assert_failed
4264  09ec 5b04          	addw	sp,#4
4265  09ee               L2501:
4266                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
4266                     ; 930                          (uint8_t)TIM1_SlaveMode);
4268  09ee c65252        	ld	a,21074
4269  09f1 a4f8          	and	a,#248
4270  09f3 1a01          	or	a,(OFST+1,sp)
4271  09f5 c75252        	ld	21074,a
4272                     ; 931 }
4275  09f8 84            	pop	a
4276  09f9 81            	ret	
4313                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
4313                     ; 940 {
4314                     	switch	.text
4315  09fa               _TIM1_SelectMasterSlaveMode:
4317  09fa 88            	push	a
4318       00000000      OFST:	set	0
4321                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4323  09fb 4d            	tnz	a
4324  09fc 2711          	jreq	L4601
4325  09fe 4a            	dec	a
4326  09ff 270e          	jreq	L4601
4327  0a01 ae03ae        	ldw	x,#942
4328  0a04 89            	pushw	x
4329  0a05 5f            	clrw	x
4330  0a06 89            	pushw	x
4331  0a07 ae0000        	ldw	x,#L37
4332  0a0a cd0000        	call	_assert_failed
4334  0a0d 5b04          	addw	sp,#4
4335  0a0f               L4601:
4336                     ; 945   if (NewState != DISABLE)
4338  0a0f 7b01          	ld	a,(OFST+1,sp)
4339  0a11 2706          	jreq	L5551
4340                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
4342  0a13 721e5252      	bset	21074,#7
4344  0a17 2004          	jra	L7551
4345  0a19               L5551:
4346                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
4348  0a19 721f5252      	bres	21074,#7
4349  0a1d               L7551:
4350                     ; 953 }
4353  0a1d 84            	pop	a
4354  0a1e 81            	ret	
4441                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
4441                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
4441                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
4441                     ; 978 {
4442                     	switch	.text
4443  0a1f               _TIM1_EncoderInterfaceConfig:
4445  0a1f 89            	pushw	x
4446       00000000      OFST:	set	0
4449                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
4451  0a20 9e            	ld	a,xh
4452  0a21 4a            	dec	a
4453  0a22 2718          	jreq	L6701
4454  0a24 9e            	ld	a,xh
4455  0a25 a102          	cp	a,#2
4456  0a27 2713          	jreq	L6701
4457  0a29 9e            	ld	a,xh
4458  0a2a a103          	cp	a,#3
4459  0a2c 270e          	jreq	L6701
4460  0a2e ae03d4        	ldw	x,#980
4461  0a31 89            	pushw	x
4462  0a32 5f            	clrw	x
4463  0a33 89            	pushw	x
4464  0a34 ae0000        	ldw	x,#L37
4465  0a37 cd0000        	call	_assert_failed
4467  0a3a 5b04          	addw	sp,#4
4468  0a3c               L6701:
4469                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
4471  0a3c 7b02          	ld	a,(OFST+2,sp)
4472  0a3e 2711          	jreq	L6011
4473  0a40 4a            	dec	a
4474  0a41 270e          	jreq	L6011
4475  0a43 ae03d5        	ldw	x,#981
4476  0a46 89            	pushw	x
4477  0a47 5f            	clrw	x
4478  0a48 89            	pushw	x
4479  0a49 ae0000        	ldw	x,#L37
4480  0a4c cd0000        	call	_assert_failed
4482  0a4f 5b04          	addw	sp,#4
4483  0a51               L6011:
4484                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
4486  0a51 7b05          	ld	a,(OFST+5,sp)
4487  0a53 2711          	jreq	L6111
4488  0a55 4a            	dec	a
4489  0a56 270e          	jreq	L6111
4490  0a58 ae03d6        	ldw	x,#982
4491  0a5b 89            	pushw	x
4492  0a5c 5f            	clrw	x
4493  0a5d 89            	pushw	x
4494  0a5e ae0000        	ldw	x,#L37
4495  0a61 cd0000        	call	_assert_failed
4497  0a64 5b04          	addw	sp,#4
4498  0a66               L6111:
4499                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
4501  0a66 7b02          	ld	a,(OFST+2,sp)
4502  0a68 2706          	jreq	L1261
4503                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4505  0a6a 7212525c      	bset	21084,#1
4507  0a6e 2004          	jra	L3261
4508  0a70               L1261:
4509                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4511  0a70 7213525c      	bres	21084,#1
4512  0a74               L3261:
4513                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
4515  0a74 7b05          	ld	a,(OFST+5,sp)
4516  0a76 2706          	jreq	L5261
4517                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4519  0a78 721a525c      	bset	21084,#5
4521  0a7c 2004          	jra	L7261
4522  0a7e               L5261:
4523                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4525  0a7e 721b525c      	bres	21084,#5
4526  0a82               L7261:
4527                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
4527                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
4529  0a82 c65252        	ld	a,21074
4530  0a85 a4f0          	and	a,#240
4531  0a87 1a01          	or	a,(OFST+1,sp)
4532  0a89 c75252        	ld	21074,a
4533                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
4533                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
4535  0a8c c65258        	ld	a,21080
4536  0a8f a4fc          	and	a,#252
4537  0a91 aa01          	or	a,#1
4538  0a93 c75258        	ld	21080,a
4539                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
4539                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
4541  0a96 c65259        	ld	a,21081
4542  0a99 a4fc          	and	a,#252
4543  0a9b aa01          	or	a,#1
4544  0a9d c75259        	ld	21081,a
4545                     ; 1011 }
4548  0aa0 85            	popw	x
4549  0aa1 81            	ret	
4615                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
4615                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
4615                     ; 1025 {
4616                     	switch	.text
4617  0aa2               _TIM1_PrescalerConfig:
4619  0aa2 89            	pushw	x
4620       00000000      OFST:	set	0
4623                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
4625  0aa3 7b05          	ld	a,(OFST+5,sp)
4626  0aa5 2711          	jreq	L0311
4627  0aa7 4a            	dec	a
4628  0aa8 270e          	jreq	L0311
4629  0aaa ae0403        	ldw	x,#1027
4630  0aad 89            	pushw	x
4631  0aae 5f            	clrw	x
4632  0aaf 89            	pushw	x
4633  0ab0 ae0000        	ldw	x,#L37
4634  0ab3 cd0000        	call	_assert_failed
4636  0ab6 5b04          	addw	sp,#4
4637  0ab8               L0311:
4638                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
4640  0ab8 7b01          	ld	a,(OFST+1,sp)
4641  0aba c75260        	ld	21088,a
4642                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
4644  0abd 7b02          	ld	a,(OFST+2,sp)
4645  0abf c75261        	ld	21089,a
4646                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
4648  0ac2 7b05          	ld	a,(OFST+5,sp)
4649  0ac4 c75257        	ld	21079,a
4650                     ; 1035 }
4653  0ac7 85            	popw	x
4654  0ac8 81            	ret	
4691                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
4691                     ; 1049 {
4692                     	switch	.text
4693  0ac9               _TIM1_CounterModeConfig:
4695  0ac9 88            	push	a
4696       00000000      OFST:	set	0
4699                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
4701  0aca 4d            	tnz	a
4702  0acb 271e          	jreq	L2411
4703  0acd a110          	cp	a,#16
4704  0acf 271a          	jreq	L2411
4705  0ad1 a120          	cp	a,#32
4706  0ad3 2716          	jreq	L2411
4707  0ad5 a140          	cp	a,#64
4708  0ad7 2712          	jreq	L2411
4709  0ad9 a160          	cp	a,#96
4710  0adb 270e          	jreq	L2411
4711  0add ae041b        	ldw	x,#1051
4712  0ae0 89            	pushw	x
4713  0ae1 5f            	clrw	x
4714  0ae2 89            	pushw	x
4715  0ae3 ae0000        	ldw	x,#L37
4716  0ae6 cd0000        	call	_assert_failed
4718  0ae9 5b04          	addw	sp,#4
4719  0aeb               L2411:
4720                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
4720                     ; 1056                         | (uint8_t)TIM1_CounterMode);
4722  0aeb c65250        	ld	a,21072
4723  0aee a48f          	and	a,#143
4724  0af0 1a01          	or	a,(OFST+1,sp)
4725  0af2 c75250        	ld	21072,a
4726                     ; 1057 }
4729  0af5 84            	pop	a
4730  0af6 81            	ret	
4789                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
4789                     ; 1068 {
4790                     	switch	.text
4791  0af7               _TIM1_ForcedOC1Config:
4793  0af7 88            	push	a
4794       00000000      OFST:	set	0
4797                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
4799  0af8 a150          	cp	a,#80
4800  0afa 2712          	jreq	L4511
4801  0afc a140          	cp	a,#64
4802  0afe 270e          	jreq	L4511
4803  0b00 ae042e        	ldw	x,#1070
4804  0b03 89            	pushw	x
4805  0b04 5f            	clrw	x
4806  0b05 89            	pushw	x
4807  0b06 ae0000        	ldw	x,#L37
4808  0b09 cd0000        	call	_assert_failed
4810  0b0c 5b04          	addw	sp,#4
4811  0b0e               L4511:
4812                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
4812                     ; 1074                            (uint8_t)TIM1_ForcedAction);
4814  0b0e c65258        	ld	a,21080
4815  0b11 a48f          	and	a,#143
4816  0b13 1a01          	or	a,(OFST+1,sp)
4817  0b15 c75258        	ld	21080,a
4818                     ; 1075 }
4821  0b18 84            	pop	a
4822  0b19 81            	ret	
4859                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
4859                     ; 1086 {
4860                     	switch	.text
4861  0b1a               _TIM1_ForcedOC2Config:
4863  0b1a 88            	push	a
4864       00000000      OFST:	set	0
4867                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
4869  0b1b a150          	cp	a,#80
4870  0b1d 2712          	jreq	L6611
4871  0b1f a140          	cp	a,#64
4872  0b21 270e          	jreq	L6611
4873  0b23 ae0440        	ldw	x,#1088
4874  0b26 89            	pushw	x
4875  0b27 5f            	clrw	x
4876  0b28 89            	pushw	x
4877  0b29 ae0000        	ldw	x,#L37
4878  0b2c cd0000        	call	_assert_failed
4880  0b2f 5b04          	addw	sp,#4
4881  0b31               L6611:
4882                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
4882                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
4884  0b31 c65259        	ld	a,21081
4885  0b34 a48f          	and	a,#143
4886  0b36 1a01          	or	a,(OFST+1,sp)
4887  0b38 c75259        	ld	21081,a
4888                     ; 1093 }
4891  0b3b 84            	pop	a
4892  0b3c 81            	ret	
4929                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
4929                     ; 1105 {
4930                     	switch	.text
4931  0b3d               _TIM1_ForcedOC3Config:
4933  0b3d 88            	push	a
4934       00000000      OFST:	set	0
4937                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
4939  0b3e a150          	cp	a,#80
4940  0b40 2712          	jreq	L0021
4941  0b42 a140          	cp	a,#64
4942  0b44 270e          	jreq	L0021
4943  0b46 ae0453        	ldw	x,#1107
4944  0b49 89            	pushw	x
4945  0b4a 5f            	clrw	x
4946  0b4b 89            	pushw	x
4947  0b4c ae0000        	ldw	x,#L37
4948  0b4f cd0000        	call	_assert_failed
4950  0b52 5b04          	addw	sp,#4
4951  0b54               L0021:
4952                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
4952                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
4954  0b54 c6525a        	ld	a,21082
4955  0b57 a48f          	and	a,#143
4956  0b59 1a01          	or	a,(OFST+1,sp)
4957  0b5b c7525a        	ld	21082,a
4958                     ; 1112 }
4961  0b5e 84            	pop	a
4962  0b5f 81            	ret	
4999                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
4999                     ; 1124 {
5000                     	switch	.text
5001  0b60               _TIM1_ForcedOC4Config:
5003  0b60 88            	push	a
5004       00000000      OFST:	set	0
5007                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5009  0b61 a150          	cp	a,#80
5010  0b63 2712          	jreq	L2121
5011  0b65 a140          	cp	a,#64
5012  0b67 270e          	jreq	L2121
5013  0b69 ae0466        	ldw	x,#1126
5014  0b6c 89            	pushw	x
5015  0b6d 5f            	clrw	x
5016  0b6e 89            	pushw	x
5017  0b6f ae0000        	ldw	x,#L37
5018  0b72 cd0000        	call	_assert_failed
5020  0b75 5b04          	addw	sp,#4
5021  0b77               L2121:
5022                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5022                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
5024  0b77 c6525b        	ld	a,21083
5025  0b7a a48f          	and	a,#143
5026  0b7c 1a01          	or	a,(OFST+1,sp)
5027  0b7e c7525b        	ld	21083,a
5028                     ; 1131 }
5031  0b81 84            	pop	a
5032  0b82 81            	ret	
5069                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
5069                     ; 1140 {
5070                     	switch	.text
5071  0b83               _TIM1_ARRPreloadConfig:
5073  0b83 88            	push	a
5074       00000000      OFST:	set	0
5077                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5079  0b84 4d            	tnz	a
5080  0b85 2711          	jreq	L4221
5081  0b87 4a            	dec	a
5082  0b88 270e          	jreq	L4221
5083  0b8a ae0476        	ldw	x,#1142
5084  0b8d 89            	pushw	x
5085  0b8e 5f            	clrw	x
5086  0b8f 89            	pushw	x
5087  0b90 ae0000        	ldw	x,#L37
5088  0b93 cd0000        	call	_assert_failed
5090  0b96 5b04          	addw	sp,#4
5091  0b98               L4221:
5092                     ; 1145   if (NewState != DISABLE)
5094  0b98 7b01          	ld	a,(OFST+1,sp)
5095  0b9a 2706          	jreq	L5102
5096                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
5098  0b9c 721e5250      	bset	21072,#7
5100  0ba0 2004          	jra	L7102
5101  0ba2               L5102:
5102                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
5104  0ba2 721f5250      	bres	21072,#7
5105  0ba6               L7102:
5106                     ; 1153 }
5109  0ba6 84            	pop	a
5110  0ba7 81            	ret	
5146                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
5146                     ; 1162 {
5147                     	switch	.text
5148  0ba8               _TIM1_SelectCOM:
5150  0ba8 88            	push	a
5151       00000000      OFST:	set	0
5154                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5156  0ba9 4d            	tnz	a
5157  0baa 2711          	jreq	L6321
5158  0bac 4a            	dec	a
5159  0bad 270e          	jreq	L6321
5160  0baf ae048c        	ldw	x,#1164
5161  0bb2 89            	pushw	x
5162  0bb3 5f            	clrw	x
5163  0bb4 89            	pushw	x
5164  0bb5 ae0000        	ldw	x,#L37
5165  0bb8 cd0000        	call	_assert_failed
5167  0bbb 5b04          	addw	sp,#4
5168  0bbd               L6321:
5169                     ; 1167   if (NewState != DISABLE)
5171  0bbd 7b01          	ld	a,(OFST+1,sp)
5172  0bbf 2706          	jreq	L7302
5173                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
5175  0bc1 72145251      	bset	21073,#2
5177  0bc5 2004          	jra	L1402
5178  0bc7               L7302:
5179                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
5181  0bc7 72155251      	bres	21073,#2
5182  0bcb               L1402:
5183                     ; 1175 }
5186  0bcb 84            	pop	a
5187  0bcc 81            	ret	
5224                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
5224                     ; 1184 {
5225                     	switch	.text
5226  0bcd               _TIM1_CCPreloadControl:
5228  0bcd 88            	push	a
5229       00000000      OFST:	set	0
5232                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5234  0bce 4d            	tnz	a
5235  0bcf 2711          	jreq	L0521
5236  0bd1 4a            	dec	a
5237  0bd2 270e          	jreq	L0521
5238  0bd4 ae04a2        	ldw	x,#1186
5239  0bd7 89            	pushw	x
5240  0bd8 5f            	clrw	x
5241  0bd9 89            	pushw	x
5242  0bda ae0000        	ldw	x,#L37
5243  0bdd cd0000        	call	_assert_failed
5245  0be0 5b04          	addw	sp,#4
5246  0be2               L0521:
5247                     ; 1189   if (NewState != DISABLE)
5249  0be2 7b01          	ld	a,(OFST+1,sp)
5250  0be4 2706          	jreq	L1602
5251                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
5253  0be6 72105251      	bset	21073,#0
5255  0bea 2004          	jra	L3602
5256  0bec               L1602:
5257                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
5259  0bec 72115251      	bres	21073,#0
5260  0bf0               L3602:
5261                     ; 1197 }
5264  0bf0 84            	pop	a
5265  0bf1 81            	ret	
5302                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
5302                     ; 1206 {
5303                     	switch	.text
5304  0bf2               _TIM1_OC1PreloadConfig:
5306  0bf2 88            	push	a
5307       00000000      OFST:	set	0
5310                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5312  0bf3 4d            	tnz	a
5313  0bf4 2711          	jreq	L2621
5314  0bf6 4a            	dec	a
5315  0bf7 270e          	jreq	L2621
5316  0bf9 ae04b8        	ldw	x,#1208
5317  0bfc 89            	pushw	x
5318  0bfd 5f            	clrw	x
5319  0bfe 89            	pushw	x
5320  0bff ae0000        	ldw	x,#L37
5321  0c02 cd0000        	call	_assert_failed
5323  0c05 5b04          	addw	sp,#4
5324  0c07               L2621:
5325                     ; 1211   if (NewState != DISABLE)
5327  0c07 7b01          	ld	a,(OFST+1,sp)
5328  0c09 2706          	jreq	L3012
5329                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
5331  0c0b 72165258      	bset	21080,#3
5333  0c0f 2004          	jra	L5012
5334  0c11               L3012:
5335                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5337  0c11 72175258      	bres	21080,#3
5338  0c15               L5012:
5339                     ; 1219 }
5342  0c15 84            	pop	a
5343  0c16 81            	ret	
5380                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
5380                     ; 1228 {
5381                     	switch	.text
5382  0c17               _TIM1_OC2PreloadConfig:
5384  0c17 88            	push	a
5385       00000000      OFST:	set	0
5388                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5390  0c18 4d            	tnz	a
5391  0c19 2711          	jreq	L4721
5392  0c1b 4a            	dec	a
5393  0c1c 270e          	jreq	L4721
5394  0c1e ae04ce        	ldw	x,#1230
5395  0c21 89            	pushw	x
5396  0c22 5f            	clrw	x
5397  0c23 89            	pushw	x
5398  0c24 ae0000        	ldw	x,#L37
5399  0c27 cd0000        	call	_assert_failed
5401  0c2a 5b04          	addw	sp,#4
5402  0c2c               L4721:
5403                     ; 1233   if (NewState != DISABLE)
5405  0c2c 7b01          	ld	a,(OFST+1,sp)
5406  0c2e 2706          	jreq	L5212
5407                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
5409  0c30 72165259      	bset	21081,#3
5411  0c34 2004          	jra	L7212
5412  0c36               L5212:
5413                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5415  0c36 72175259      	bres	21081,#3
5416  0c3a               L7212:
5417                     ; 1241 }
5420  0c3a 84            	pop	a
5421  0c3b 81            	ret	
5458                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
5458                     ; 1250 {
5459                     	switch	.text
5460  0c3c               _TIM1_OC3PreloadConfig:
5462  0c3c 88            	push	a
5463       00000000      OFST:	set	0
5466                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5468  0c3d 4d            	tnz	a
5469  0c3e 2711          	jreq	L6031
5470  0c40 4a            	dec	a
5471  0c41 270e          	jreq	L6031
5472  0c43 ae04e4        	ldw	x,#1252
5473  0c46 89            	pushw	x
5474  0c47 5f            	clrw	x
5475  0c48 89            	pushw	x
5476  0c49 ae0000        	ldw	x,#L37
5477  0c4c cd0000        	call	_assert_failed
5479  0c4f 5b04          	addw	sp,#4
5480  0c51               L6031:
5481                     ; 1255   if (NewState != DISABLE)
5483  0c51 7b01          	ld	a,(OFST+1,sp)
5484  0c53 2706          	jreq	L7412
5485                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
5487  0c55 7216525a      	bset	21082,#3
5489  0c59 2004          	jra	L1512
5490  0c5b               L7412:
5491                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5493  0c5b 7217525a      	bres	21082,#3
5494  0c5f               L1512:
5495                     ; 1263 }
5498  0c5f 84            	pop	a
5499  0c60 81            	ret	
5536                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
5536                     ; 1272 {
5537                     	switch	.text
5538  0c61               _TIM1_OC4PreloadConfig:
5540  0c61 88            	push	a
5541       00000000      OFST:	set	0
5544                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5546  0c62 4d            	tnz	a
5547  0c63 2711          	jreq	L0231
5548  0c65 4a            	dec	a
5549  0c66 270e          	jreq	L0231
5550  0c68 ae04fa        	ldw	x,#1274
5551  0c6b 89            	pushw	x
5552  0c6c 5f            	clrw	x
5553  0c6d 89            	pushw	x
5554  0c6e ae0000        	ldw	x,#L37
5555  0c71 cd0000        	call	_assert_failed
5557  0c74 5b04          	addw	sp,#4
5558  0c76               L0231:
5559                     ; 1277   if (NewState != DISABLE)
5561  0c76 7b01          	ld	a,(OFST+1,sp)
5562  0c78 2706          	jreq	L1712
5563                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
5565  0c7a 7216525b      	bset	21083,#3
5567  0c7e 2004          	jra	L3712
5568  0c80               L1712:
5569                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5571  0c80 7217525b      	bres	21083,#3
5572  0c84               L3712:
5573                     ; 1285 }
5576  0c84 84            	pop	a
5577  0c85 81            	ret	
5613                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
5613                     ; 1294 {
5614                     	switch	.text
5615  0c86               _TIM1_OC1FastConfig:
5617  0c86 88            	push	a
5618       00000000      OFST:	set	0
5621                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5623  0c87 4d            	tnz	a
5624  0c88 2711          	jreq	L2331
5625  0c8a 4a            	dec	a
5626  0c8b 270e          	jreq	L2331
5627  0c8d ae0510        	ldw	x,#1296
5628  0c90 89            	pushw	x
5629  0c91 5f            	clrw	x
5630  0c92 89            	pushw	x
5631  0c93 ae0000        	ldw	x,#L37
5632  0c96 cd0000        	call	_assert_failed
5634  0c99 5b04          	addw	sp,#4
5635  0c9b               L2331:
5636                     ; 1299   if (NewState != DISABLE)
5638  0c9b 7b01          	ld	a,(OFST+1,sp)
5639  0c9d 2706          	jreq	L3122
5640                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
5642  0c9f 72145258      	bset	21080,#2
5644  0ca3 2004          	jra	L5122
5645  0ca5               L3122:
5646                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
5648  0ca5 72155258      	bres	21080,#2
5649  0ca9               L5122:
5650                     ; 1307 }
5653  0ca9 84            	pop	a
5654  0caa 81            	ret	
5690                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
5690                     ; 1316 {
5691                     	switch	.text
5692  0cab               _TIM1_OC2FastConfig:
5694  0cab 88            	push	a
5695       00000000      OFST:	set	0
5698                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5700  0cac 4d            	tnz	a
5701  0cad 2711          	jreq	L4431
5702  0caf 4a            	dec	a
5703  0cb0 270e          	jreq	L4431
5704  0cb2 ae0526        	ldw	x,#1318
5705  0cb5 89            	pushw	x
5706  0cb6 5f            	clrw	x
5707  0cb7 89            	pushw	x
5708  0cb8 ae0000        	ldw	x,#L37
5709  0cbb cd0000        	call	_assert_failed
5711  0cbe 5b04          	addw	sp,#4
5712  0cc0               L4431:
5713                     ; 1321   if (NewState != DISABLE)
5715  0cc0 7b01          	ld	a,(OFST+1,sp)
5716  0cc2 2706          	jreq	L5322
5717                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
5719  0cc4 72145259      	bset	21081,#2
5721  0cc8 2004          	jra	L7322
5722  0cca               L5322:
5723                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
5725  0cca 72155259      	bres	21081,#2
5726  0cce               L7322:
5727                     ; 1329 }
5730  0cce 84            	pop	a
5731  0ccf 81            	ret	
5767                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
5767                     ; 1338 {
5768                     	switch	.text
5769  0cd0               _TIM1_OC3FastConfig:
5771  0cd0 88            	push	a
5772       00000000      OFST:	set	0
5775                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5777  0cd1 4d            	tnz	a
5778  0cd2 2711          	jreq	L6531
5779  0cd4 4a            	dec	a
5780  0cd5 270e          	jreq	L6531
5781  0cd7 ae053c        	ldw	x,#1340
5782  0cda 89            	pushw	x
5783  0cdb 5f            	clrw	x
5784  0cdc 89            	pushw	x
5785  0cdd ae0000        	ldw	x,#L37
5786  0ce0 cd0000        	call	_assert_failed
5788  0ce3 5b04          	addw	sp,#4
5789  0ce5               L6531:
5790                     ; 1343   if (NewState != DISABLE)
5792  0ce5 7b01          	ld	a,(OFST+1,sp)
5793  0ce7 2706          	jreq	L7522
5794                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
5796  0ce9 7214525a      	bset	21082,#2
5798  0ced 2004          	jra	L1622
5799  0cef               L7522:
5800                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
5802  0cef 7215525a      	bres	21082,#2
5803  0cf3               L1622:
5804                     ; 1351 }
5807  0cf3 84            	pop	a
5808  0cf4 81            	ret	
5844                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
5844                     ; 1360 {
5845                     	switch	.text
5846  0cf5               _TIM1_OC4FastConfig:
5848  0cf5 88            	push	a
5849       00000000      OFST:	set	0
5852                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5854  0cf6 4d            	tnz	a
5855  0cf7 2711          	jreq	L0731
5856  0cf9 4a            	dec	a
5857  0cfa 270e          	jreq	L0731
5858  0cfc ae0552        	ldw	x,#1362
5859  0cff 89            	pushw	x
5860  0d00 5f            	clrw	x
5861  0d01 89            	pushw	x
5862  0d02 ae0000        	ldw	x,#L37
5863  0d05 cd0000        	call	_assert_failed
5865  0d08 5b04          	addw	sp,#4
5866  0d0a               L0731:
5867                     ; 1365   if (NewState != DISABLE)
5869  0d0a 7b01          	ld	a,(OFST+1,sp)
5870  0d0c 2706          	jreq	L1032
5871                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
5873  0d0e 7214525b      	bset	21083,#2
5875  0d12 2004          	jra	L3032
5876  0d14               L1032:
5877                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
5879  0d14 7215525b      	bres	21083,#2
5880  0d18               L3032:
5881                     ; 1373 }
5884  0d18 84            	pop	a
5885  0d19 81            	ret	
5991                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5991                     ; 1390 {
5992                     	switch	.text
5993  0d1a               _TIM1_GenerateEvent:
5995  0d1a 88            	push	a
5996       00000000      OFST:	set	0
5999                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
6001  0d1b 4d            	tnz	a
6002  0d1c 260e          	jrne	L0041
6003  0d1e ae0570        	ldw	x,#1392
6004  0d21 89            	pushw	x
6005  0d22 5f            	clrw	x
6006  0d23 89            	pushw	x
6007  0d24 ae0000        	ldw	x,#L37
6008  0d27 cd0000        	call	_assert_failed
6010  0d2a 5b04          	addw	sp,#4
6011  0d2c               L0041:
6012                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
6014  0d2c 7b01          	ld	a,(OFST+1,sp)
6015  0d2e c75257        	ld	21079,a
6016                     ; 1396 }
6019  0d31 84            	pop	a
6020  0d32 81            	ret	
6057                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6057                     ; 1407 {
6058                     	switch	.text
6059  0d33               _TIM1_OC1PolarityConfig:
6061  0d33 88            	push	a
6062       00000000      OFST:	set	0
6065                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6067  0d34 4d            	tnz	a
6068  0d35 2712          	jreq	L2141
6069  0d37 a122          	cp	a,#34
6070  0d39 270e          	jreq	L2141
6071  0d3b ae0581        	ldw	x,#1409
6072  0d3e 89            	pushw	x
6073  0d3f 5f            	clrw	x
6074  0d40 89            	pushw	x
6075  0d41 ae0000        	ldw	x,#L37
6076  0d44 cd0000        	call	_assert_failed
6078  0d47 5b04          	addw	sp,#4
6079  0d49               L2141:
6080                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6082  0d49 7b01          	ld	a,(OFST+1,sp)
6083  0d4b 2706          	jreq	L5632
6084                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
6086  0d4d 7212525c      	bset	21084,#1
6088  0d51 2004          	jra	L7632
6089  0d53               L5632:
6090                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
6092  0d53 7213525c      	bres	21084,#1
6093  0d57               L7632:
6094                     ; 1420 }
6097  0d57 84            	pop	a
6098  0d58 81            	ret	
6135                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6135                     ; 1431 {
6136                     	switch	.text
6137  0d59               _TIM1_OC1NPolarityConfig:
6139  0d59 88            	push	a
6140       00000000      OFST:	set	0
6143                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6145  0d5a 4d            	tnz	a
6146  0d5b 2712          	jreq	L4241
6147  0d5d a188          	cp	a,#136
6148  0d5f 270e          	jreq	L4241
6149  0d61 ae0599        	ldw	x,#1433
6150  0d64 89            	pushw	x
6151  0d65 5f            	clrw	x
6152  0d66 89            	pushw	x
6153  0d67 ae0000        	ldw	x,#L37
6154  0d6a cd0000        	call	_assert_failed
6156  0d6d 5b04          	addw	sp,#4
6157  0d6f               L4241:
6158                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6160  0d6f 7b01          	ld	a,(OFST+1,sp)
6161  0d71 2706          	jreq	L7042
6162                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
6164  0d73 7216525c      	bset	21084,#3
6166  0d77 2004          	jra	L1142
6167  0d79               L7042:
6168                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
6170  0d79 7217525c      	bres	21084,#3
6171  0d7d               L1142:
6172                     ; 1444 }
6175  0d7d 84            	pop	a
6176  0d7e 81            	ret	
6213                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6213                     ; 1455 {
6214                     	switch	.text
6215  0d7f               _TIM1_OC2PolarityConfig:
6217  0d7f 88            	push	a
6218       00000000      OFST:	set	0
6221                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6223  0d80 4d            	tnz	a
6224  0d81 2712          	jreq	L6341
6225  0d83 a122          	cp	a,#34
6226  0d85 270e          	jreq	L6341
6227  0d87 ae05b1        	ldw	x,#1457
6228  0d8a 89            	pushw	x
6229  0d8b 5f            	clrw	x
6230  0d8c 89            	pushw	x
6231  0d8d ae0000        	ldw	x,#L37
6232  0d90 cd0000        	call	_assert_failed
6234  0d93 5b04          	addw	sp,#4
6235  0d95               L6341:
6236                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6238  0d95 7b01          	ld	a,(OFST+1,sp)
6239  0d97 2706          	jreq	L1342
6240                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
6242  0d99 721a525c      	bset	21084,#5
6244  0d9d 2004          	jra	L3342
6245  0d9f               L1342:
6246                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
6248  0d9f 721b525c      	bres	21084,#5
6249  0da3               L3342:
6250                     ; 1468 }
6253  0da3 84            	pop	a
6254  0da4 81            	ret	
6291                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6291                     ; 1479 {
6292                     	switch	.text
6293  0da5               _TIM1_OC2NPolarityConfig:
6295  0da5 88            	push	a
6296       00000000      OFST:	set	0
6299                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6301  0da6 4d            	tnz	a
6302  0da7 2712          	jreq	L0541
6303  0da9 a188          	cp	a,#136
6304  0dab 270e          	jreq	L0541
6305  0dad ae05c9        	ldw	x,#1481
6306  0db0 89            	pushw	x
6307  0db1 5f            	clrw	x
6308  0db2 89            	pushw	x
6309  0db3 ae0000        	ldw	x,#L37
6310  0db6 cd0000        	call	_assert_failed
6312  0db9 5b04          	addw	sp,#4
6313  0dbb               L0541:
6314                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6316  0dbb 7b01          	ld	a,(OFST+1,sp)
6317  0dbd 2706          	jreq	L3542
6318                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
6320  0dbf 721e525c      	bset	21084,#7
6322  0dc3 2004          	jra	L5542
6323  0dc5               L3542:
6324                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
6326  0dc5 721f525c      	bres	21084,#7
6327  0dc9               L5542:
6328                     ; 1492 }
6331  0dc9 84            	pop	a
6332  0dca 81            	ret	
6369                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6369                     ; 1503 {
6370                     	switch	.text
6371  0dcb               _TIM1_OC3PolarityConfig:
6373  0dcb 88            	push	a
6374       00000000      OFST:	set	0
6377                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6379  0dcc 4d            	tnz	a
6380  0dcd 2712          	jreq	L2641
6381  0dcf a122          	cp	a,#34
6382  0dd1 270e          	jreq	L2641
6383  0dd3 ae05e1        	ldw	x,#1505
6384  0dd6 89            	pushw	x
6385  0dd7 5f            	clrw	x
6386  0dd8 89            	pushw	x
6387  0dd9 ae0000        	ldw	x,#L37
6388  0ddc cd0000        	call	_assert_failed
6390  0ddf 5b04          	addw	sp,#4
6391  0de1               L2641:
6392                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6394  0de1 7b01          	ld	a,(OFST+1,sp)
6395  0de3 2706          	jreq	L5742
6396                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
6398  0de5 7212525d      	bset	21085,#1
6400  0de9 2004          	jra	L7742
6401  0deb               L5742:
6402                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
6404  0deb 7213525d      	bres	21085,#1
6405  0def               L7742:
6406                     ; 1516 }
6409  0def 84            	pop	a
6410  0df0 81            	ret	
6447                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6447                     ; 1528 {
6448                     	switch	.text
6449  0df1               _TIM1_OC3NPolarityConfig:
6451  0df1 88            	push	a
6452       00000000      OFST:	set	0
6455                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6457  0df2 4d            	tnz	a
6458  0df3 2712          	jreq	L4741
6459  0df5 a188          	cp	a,#136
6460  0df7 270e          	jreq	L4741
6461  0df9 ae05fa        	ldw	x,#1530
6462  0dfc 89            	pushw	x
6463  0dfd 5f            	clrw	x
6464  0dfe 89            	pushw	x
6465  0dff ae0000        	ldw	x,#L37
6466  0e02 cd0000        	call	_assert_failed
6468  0e05 5b04          	addw	sp,#4
6469  0e07               L4741:
6470                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6472  0e07 7b01          	ld	a,(OFST+1,sp)
6473  0e09 2706          	jreq	L7152
6474                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
6476  0e0b 7216525d      	bset	21085,#3
6478  0e0f 2004          	jra	L1252
6479  0e11               L7152:
6480                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
6482  0e11 7217525d      	bres	21085,#3
6483  0e15               L1252:
6484                     ; 1541 }
6487  0e15 84            	pop	a
6488  0e16 81            	ret	
6525                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6525                     ; 1552 {
6526                     	switch	.text
6527  0e17               _TIM1_OC4PolarityConfig:
6529  0e17 88            	push	a
6530       00000000      OFST:	set	0
6533                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6535  0e18 4d            	tnz	a
6536  0e19 2712          	jreq	L6051
6537  0e1b a122          	cp	a,#34
6538  0e1d 270e          	jreq	L6051
6539  0e1f ae0612        	ldw	x,#1554
6540  0e22 89            	pushw	x
6541  0e23 5f            	clrw	x
6542  0e24 89            	pushw	x
6543  0e25 ae0000        	ldw	x,#L37
6544  0e28 cd0000        	call	_assert_failed
6546  0e2b 5b04          	addw	sp,#4
6547  0e2d               L6051:
6548                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6550  0e2d 7b01          	ld	a,(OFST+1,sp)
6551  0e2f 2706          	jreq	L1452
6552                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
6554  0e31 721a525d      	bset	21085,#5
6556  0e35 2004          	jra	L3452
6557  0e37               L1452:
6558                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
6560  0e37 721b525d      	bres	21085,#5
6561  0e3b               L3452:
6562                     ; 1565 }
6565  0e3b 84            	pop	a
6566  0e3c 81            	ret	
6612                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
6612                     ; 1580 {
6613                     	switch	.text
6614  0e3d               _TIM1_CCxCmd:
6616  0e3d 89            	pushw	x
6617       00000000      OFST:	set	0
6620                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
6622  0e3e 9e            	ld	a,xh
6623  0e3f 4d            	tnz	a
6624  0e40 271c          	jreq	L0251
6625  0e42 9e            	ld	a,xh
6626  0e43 4a            	dec	a
6627  0e44 2718          	jreq	L0251
6628  0e46 9e            	ld	a,xh
6629  0e47 a102          	cp	a,#2
6630  0e49 2713          	jreq	L0251
6631  0e4b 9e            	ld	a,xh
6632  0e4c a103          	cp	a,#3
6633  0e4e 270e          	jreq	L0251
6634  0e50 ae062e        	ldw	x,#1582
6635  0e53 89            	pushw	x
6636  0e54 5f            	clrw	x
6637  0e55 89            	pushw	x
6638  0e56 ae0000        	ldw	x,#L37
6639  0e59 cd0000        	call	_assert_failed
6641  0e5c 5b04          	addw	sp,#4
6642  0e5e               L0251:
6643                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6645  0e5e 7b02          	ld	a,(OFST+2,sp)
6646  0e60 2711          	jreq	L0351
6647  0e62 4a            	dec	a
6648  0e63 270e          	jreq	L0351
6649  0e65 ae062f        	ldw	x,#1583
6650  0e68 89            	pushw	x
6651  0e69 5f            	clrw	x
6652  0e6a 89            	pushw	x
6653  0e6b ae0000        	ldw	x,#L37
6654  0e6e cd0000        	call	_assert_failed
6656  0e71 5b04          	addw	sp,#4
6657  0e73               L0351:
6658                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
6660  0e73 7b01          	ld	a,(OFST+1,sp)
6661  0e75 2610          	jrne	L7652
6662                     ; 1588     if (NewState != DISABLE)
6664  0e77 7b02          	ld	a,(OFST+2,sp)
6665  0e79 2706          	jreq	L1752
6666                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
6668  0e7b 7210525c      	bset	21084,#0
6670  0e7f 203c          	jra	L5752
6671  0e81               L1752:
6672                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
6674  0e81 7211525c      	bres	21084,#0
6675  0e85 2036          	jra	L5752
6676  0e87               L7652:
6677                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
6679  0e87 a101          	cp	a,#1
6680  0e89 2610          	jrne	L7752
6681                     ; 1601     if (NewState != DISABLE)
6683  0e8b 7b02          	ld	a,(OFST+2,sp)
6684  0e8d 2706          	jreq	L1062
6685                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
6687  0e8f 7218525c      	bset	21084,#4
6689  0e93 2028          	jra	L5752
6690  0e95               L1062:
6691                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
6693  0e95 7219525c      	bres	21084,#4
6694  0e99 2022          	jra	L5752
6695  0e9b               L7752:
6696                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
6698  0e9b a102          	cp	a,#2
6699  0e9d 2610          	jrne	L7062
6700                     ; 1613     if (NewState != DISABLE)
6702  0e9f 7b02          	ld	a,(OFST+2,sp)
6703  0ea1 2706          	jreq	L1162
6704                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
6706  0ea3 7210525d      	bset	21085,#0
6708  0ea7 2014          	jra	L5752
6709  0ea9               L1162:
6710                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
6712  0ea9 7211525d      	bres	21085,#0
6713  0ead 200e          	jra	L5752
6714  0eaf               L7062:
6715                     ; 1625     if (NewState != DISABLE)
6717  0eaf 7b02          	ld	a,(OFST+2,sp)
6718  0eb1 2706          	jreq	L7162
6719                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
6721  0eb3 7218525d      	bset	21085,#4
6723  0eb7 2004          	jra	L5752
6724  0eb9               L7162:
6725                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
6727  0eb9 7219525d      	bres	21085,#4
6728  0ebd               L5752:
6729                     ; 1634 }
6732  0ebd 85            	popw	x
6733  0ebe 81            	ret	
6779                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
6779                     ; 1648 {
6780                     	switch	.text
6781  0ebf               _TIM1_CCxNCmd:
6783  0ebf 89            	pushw	x
6784       00000000      OFST:	set	0
6787                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
6789  0ec0 9e            	ld	a,xh
6790  0ec1 4d            	tnz	a
6791  0ec2 2717          	jreq	L2451
6792  0ec4 9e            	ld	a,xh
6793  0ec5 4a            	dec	a
6794  0ec6 2713          	jreq	L2451
6795  0ec8 9e            	ld	a,xh
6796  0ec9 a102          	cp	a,#2
6797  0ecb 270e          	jreq	L2451
6798  0ecd ae0672        	ldw	x,#1650
6799  0ed0 89            	pushw	x
6800  0ed1 5f            	clrw	x
6801  0ed2 89            	pushw	x
6802  0ed3 ae0000        	ldw	x,#L37
6803  0ed6 cd0000        	call	_assert_failed
6805  0ed9 5b04          	addw	sp,#4
6806  0edb               L2451:
6807                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6809  0edb 7b02          	ld	a,(OFST+2,sp)
6810  0edd 2711          	jreq	L2551
6811  0edf 4a            	dec	a
6812  0ee0 270e          	jreq	L2551
6813  0ee2 ae0673        	ldw	x,#1651
6814  0ee5 89            	pushw	x
6815  0ee6 5f            	clrw	x
6816  0ee7 89            	pushw	x
6817  0ee8 ae0000        	ldw	x,#L37
6818  0eeb cd0000        	call	_assert_failed
6820  0eee 5b04          	addw	sp,#4
6821  0ef0               L2551:
6822                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
6824  0ef0 7b01          	ld	a,(OFST+1,sp)
6825  0ef2 2610          	jrne	L5462
6826                     ; 1656     if (NewState != DISABLE)
6828  0ef4 7b02          	ld	a,(OFST+2,sp)
6829  0ef6 2706          	jreq	L7462
6830                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
6832  0ef8 7214525c      	bset	21084,#2
6834  0efc 2027          	jra	L3562
6835  0efe               L7462:
6836                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
6838  0efe 7215525c      	bres	21084,#2
6839  0f02 2021          	jra	L3562
6840  0f04               L5462:
6841                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
6843  0f04 4a            	dec	a
6844  0f05 2610          	jrne	L5562
6845                     ; 1668     if (NewState != DISABLE)
6847  0f07 7b02          	ld	a,(OFST+2,sp)
6848  0f09 2706          	jreq	L7562
6849                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
6851  0f0b 721c525c      	bset	21084,#6
6853  0f0f 2014          	jra	L3562
6854  0f11               L7562:
6855                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
6857  0f11 721d525c      	bres	21084,#6
6858  0f15 200e          	jra	L3562
6859  0f17               L5562:
6860                     ; 1680     if (NewState != DISABLE)
6862  0f17 7b02          	ld	a,(OFST+2,sp)
6863  0f19 2706          	jreq	L5662
6864                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
6866  0f1b 7214525d      	bset	21085,#2
6868  0f1f 2004          	jra	L3562
6869  0f21               L5662:
6870                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
6872  0f21 7215525d      	bres	21085,#2
6873  0f25               L3562:
6874                     ; 1689 }
6877  0f25 85            	popw	x
6878  0f26 81            	ret	
6924                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
6924                     ; 1713 {
6925                     	switch	.text
6926  0f27               _TIM1_SelectOCxM:
6928  0f27 89            	pushw	x
6929       00000000      OFST:	set	0
6932                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
6934  0f28 9e            	ld	a,xh
6935  0f29 4d            	tnz	a
6936  0f2a 271c          	jreq	L4651
6937  0f2c 9e            	ld	a,xh
6938  0f2d 4a            	dec	a
6939  0f2e 2718          	jreq	L4651
6940  0f30 9e            	ld	a,xh
6941  0f31 a102          	cp	a,#2
6942  0f33 2713          	jreq	L4651
6943  0f35 9e            	ld	a,xh
6944  0f36 a103          	cp	a,#3
6945  0f38 270e          	jreq	L4651
6946  0f3a ae06b3        	ldw	x,#1715
6947  0f3d 89            	pushw	x
6948  0f3e 5f            	clrw	x
6949  0f3f 89            	pushw	x
6950  0f40 ae0000        	ldw	x,#L37
6951  0f43 cd0000        	call	_assert_failed
6953  0f46 5b04          	addw	sp,#4
6954  0f48               L4651:
6955                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
6957  0f48 7b02          	ld	a,(OFST+2,sp)
6958  0f4a 272a          	jreq	L4751
6959  0f4c a110          	cp	a,#16
6960  0f4e 2726          	jreq	L4751
6961  0f50 a120          	cp	a,#32
6962  0f52 2722          	jreq	L4751
6963  0f54 a130          	cp	a,#48
6964  0f56 271e          	jreq	L4751
6965  0f58 a160          	cp	a,#96
6966  0f5a 271a          	jreq	L4751
6967  0f5c a170          	cp	a,#112
6968  0f5e 2716          	jreq	L4751
6969  0f60 a150          	cp	a,#80
6970  0f62 2712          	jreq	L4751
6971  0f64 a140          	cp	a,#64
6972  0f66 270e          	jreq	L4751
6973  0f68 ae06b4        	ldw	x,#1716
6974  0f6b 89            	pushw	x
6975  0f6c 5f            	clrw	x
6976  0f6d 89            	pushw	x
6977  0f6e ae0000        	ldw	x,#L37
6978  0f71 cd0000        	call	_assert_failed
6980  0f74 5b04          	addw	sp,#4
6981  0f76               L4751:
6982                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
6984  0f76 7b01          	ld	a,(OFST+1,sp)
6985  0f78 2610          	jrne	L3172
6986                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
6988  0f7a 7211525c      	bres	21084,#0
6989                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
6989                     ; 1725                             | (uint8_t)TIM1_OCMode);
6991  0f7e c65258        	ld	a,21080
6992  0f81 a48f          	and	a,#143
6993  0f83 1a02          	or	a,(OFST+2,sp)
6994  0f85 c75258        	ld	21080,a
6996  0f88 2036          	jra	L5172
6997  0f8a               L3172:
6998                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
7000  0f8a a101          	cp	a,#1
7001  0f8c 2610          	jrne	L7172
7002                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7004  0f8e 7219525c      	bres	21084,#4
7005                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
7005                     ; 1734                             | (uint8_t)TIM1_OCMode);
7007  0f92 c65259        	ld	a,21081
7008  0f95 a48f          	and	a,#143
7009  0f97 1a02          	or	a,(OFST+2,sp)
7010  0f99 c75259        	ld	21081,a
7012  0f9c 2022          	jra	L5172
7013  0f9e               L7172:
7014                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
7016  0f9e a102          	cp	a,#2
7017  0fa0 2610          	jrne	L3272
7018                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7020  0fa2 7211525d      	bres	21085,#0
7021                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
7021                     ; 1743                             | (uint8_t)TIM1_OCMode);
7023  0fa6 c6525a        	ld	a,21082
7024  0fa9 a48f          	and	a,#143
7025  0fab 1a02          	or	a,(OFST+2,sp)
7026  0fad c7525a        	ld	21082,a
7028  0fb0 200e          	jra	L5172
7029  0fb2               L3272:
7030                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7032  0fb2 7219525d      	bres	21085,#4
7033                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
7033                     ; 1752                             | (uint8_t)TIM1_OCMode);
7035  0fb6 c6525b        	ld	a,21083
7036  0fb9 a48f          	and	a,#143
7037  0fbb 1a02          	or	a,(OFST+2,sp)
7038  0fbd c7525b        	ld	21083,a
7039  0fc0               L5172:
7040                     ; 1754 }
7043  0fc0 85            	popw	x
7044  0fc1 81            	ret	
7076                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
7076                     ; 1763 {
7077                     	switch	.text
7078  0fc2               _TIM1_SetCounter:
7082                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
7084  0fc2 9e            	ld	a,xh
7085  0fc3 c7525e        	ld	21086,a
7086                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
7088  0fc6 9f            	ld	a,xl
7089  0fc7 c7525f        	ld	21087,a
7090                     ; 1767 }
7093  0fca 81            	ret	
7125                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
7125                     ; 1776 {
7126                     	switch	.text
7127  0fcb               _TIM1_SetAutoreload:
7131                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
7133  0fcb 9e            	ld	a,xh
7134  0fcc c75262        	ld	21090,a
7135                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
7137  0fcf 9f            	ld	a,xl
7138  0fd0 c75263        	ld	21091,a
7139                     ; 1780  }
7142  0fd3 81            	ret	
7174                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
7174                     ; 1789 {
7175                     	switch	.text
7176  0fd4               _TIM1_SetCompare1:
7180                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
7182  0fd4 9e            	ld	a,xh
7183  0fd5 c75265        	ld	21093,a
7184                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
7186  0fd8 9f            	ld	a,xl
7187  0fd9 c75266        	ld	21094,a
7188                     ; 1793 }
7191  0fdc 81            	ret	
7223                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
7223                     ; 1802 {
7224                     	switch	.text
7225  0fdd               _TIM1_SetCompare2:
7229                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
7231  0fdd 9e            	ld	a,xh
7232  0fde c75267        	ld	21095,a
7233                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
7235  0fe1 9f            	ld	a,xl
7236  0fe2 c75268        	ld	21096,a
7237                     ; 1806 }
7240  0fe5 81            	ret	
7272                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
7272                     ; 1815 {
7273                     	switch	.text
7274  0fe6               _TIM1_SetCompare3:
7278                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
7280  0fe6 9e            	ld	a,xh
7281  0fe7 c75269        	ld	21097,a
7282                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
7284  0fea 9f            	ld	a,xl
7285  0feb c7526a        	ld	21098,a
7286                     ; 1819 }
7289  0fee 81            	ret	
7321                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
7321                     ; 1828 {
7322                     	switch	.text
7323  0fef               _TIM1_SetCompare4:
7327                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
7329  0fef 9e            	ld	a,xh
7330  0ff0 c7526b        	ld	21099,a
7331                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
7333  0ff3 9f            	ld	a,xl
7334  0ff4 c7526c        	ld	21100,a
7335                     ; 1832 }
7338  0ff7 81            	ret	
7375                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
7375                     ; 1845 {
7376                     	switch	.text
7377  0ff8               _TIM1_SetIC1Prescaler:
7379  0ff8 88            	push	a
7380       00000000      OFST:	set	0
7383                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
7385  0ff9 4d            	tnz	a
7386  0ffa 271a          	jreq	L2261
7387  0ffc a104          	cp	a,#4
7388  0ffe 2716          	jreq	L2261
7389  1000 a108          	cp	a,#8
7390  1002 2712          	jreq	L2261
7391  1004 a10c          	cp	a,#12
7392  1006 270e          	jreq	L2261
7393  1008 ae0737        	ldw	x,#1847
7394  100b 89            	pushw	x
7395  100c 5f            	clrw	x
7396  100d 89            	pushw	x
7397  100e ae0000        	ldw	x,#L37
7398  1011 cd0000        	call	_assert_failed
7400  1014 5b04          	addw	sp,#4
7401  1016               L2261:
7402                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
7402                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
7404  1016 c65258        	ld	a,21080
7405  1019 a4f3          	and	a,#243
7406  101b 1a01          	or	a,(OFST+1,sp)
7407  101d c75258        	ld	21080,a
7408                     ; 1852 }
7411  1020 84            	pop	a
7412  1021 81            	ret	
7449                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
7449                     ; 1865 {
7450                     	switch	.text
7451  1022               _TIM1_SetIC2Prescaler:
7453  1022 88            	push	a
7454       00000000      OFST:	set	0
7457                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
7459  1023 4d            	tnz	a
7460  1024 271a          	jreq	L4361
7461  1026 a104          	cp	a,#4
7462  1028 2716          	jreq	L4361
7463  102a a108          	cp	a,#8
7464  102c 2712          	jreq	L4361
7465  102e a10c          	cp	a,#12
7466  1030 270e          	jreq	L4361
7467  1032 ae074c        	ldw	x,#1868
7468  1035 89            	pushw	x
7469  1036 5f            	clrw	x
7470  1037 89            	pushw	x
7471  1038 ae0000        	ldw	x,#L37
7472  103b cd0000        	call	_assert_failed
7474  103e 5b04          	addw	sp,#4
7475  1040               L4361:
7476                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
7476                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
7478  1040 c65259        	ld	a,21081
7479  1043 a4f3          	and	a,#243
7480  1045 1a01          	or	a,(OFST+1,sp)
7481  1047 c75259        	ld	21081,a
7482                     ; 1873 }
7485  104a 84            	pop	a
7486  104b 81            	ret	
7523                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
7523                     ; 1886 {
7524                     	switch	.text
7525  104c               _TIM1_SetIC3Prescaler:
7527  104c 88            	push	a
7528       00000000      OFST:	set	0
7531                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
7533  104d 4d            	tnz	a
7534  104e 271a          	jreq	L6461
7535  1050 a104          	cp	a,#4
7536  1052 2716          	jreq	L6461
7537  1054 a108          	cp	a,#8
7538  1056 2712          	jreq	L6461
7539  1058 a10c          	cp	a,#12
7540  105a 270e          	jreq	L6461
7541  105c ae0761        	ldw	x,#1889
7542  105f 89            	pushw	x
7543  1060 5f            	clrw	x
7544  1061 89            	pushw	x
7545  1062 ae0000        	ldw	x,#L37
7546  1065 cd0000        	call	_assert_failed
7548  1068 5b04          	addw	sp,#4
7549  106a               L6461:
7550                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
7550                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
7552  106a c6525a        	ld	a,21082
7553  106d a4f3          	and	a,#243
7554  106f 1a01          	or	a,(OFST+1,sp)
7555  1071 c7525a        	ld	21082,a
7556                     ; 1894 }
7559  1074 84            	pop	a
7560  1075 81            	ret	
7597                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
7597                     ; 1907 {
7598                     	switch	.text
7599  1076               _TIM1_SetIC4Prescaler:
7601  1076 88            	push	a
7602       00000000      OFST:	set	0
7605                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
7607  1077 4d            	tnz	a
7608  1078 271a          	jreq	L0661
7609  107a a104          	cp	a,#4
7610  107c 2716          	jreq	L0661
7611  107e a108          	cp	a,#8
7612  1080 2712          	jreq	L0661
7613  1082 a10c          	cp	a,#12
7614  1084 270e          	jreq	L0661
7615  1086 ae0776        	ldw	x,#1910
7616  1089 89            	pushw	x
7617  108a 5f            	clrw	x
7618  108b 89            	pushw	x
7619  108c ae0000        	ldw	x,#L37
7620  108f cd0000        	call	_assert_failed
7622  1092 5b04          	addw	sp,#4
7623  1094               L0661:
7624                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
7624                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
7626  1094 c6525b        	ld	a,21083
7627  1097 a4f3          	and	a,#243
7628  1099 1a01          	or	a,(OFST+1,sp)
7629  109b c7525b        	ld	21083,a
7630                     ; 1915 }
7633  109e 84            	pop	a
7634  109f 81            	ret	
7680                     ; 1922 uint16_t TIM1_GetCapture1(void)
7680                     ; 1923 {
7681                     	switch	.text
7682  10a0               _TIM1_GetCapture1:
7684  10a0 5204          	subw	sp,#4
7685       00000004      OFST:	set	4
7688                     ; 1926   uint16_t tmpccr1 = 0;
7690                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
7694                     ; 1929   tmpccr1h = TIM1->CCR1H;
7696  10a2 c65265        	ld	a,21093
7697  10a5 6b02          	ld	(OFST-2,sp),a
7699                     ; 1930   tmpccr1l = TIM1->CCR1L;
7701  10a7 c65266        	ld	a,21094
7702  10aa 6b01          	ld	(OFST-3,sp),a
7704                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
7706  10ac 5f            	clrw	x
7707  10ad 97            	ld	xl,a
7708  10ae 1f03          	ldw	(OFST-1,sp),x
7710                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
7712  10b0 5f            	clrw	x
7713  10b1 7b02          	ld	a,(OFST-2,sp)
7714  10b3 97            	ld	xl,a
7715  10b4 7b04          	ld	a,(OFST+0,sp)
7716  10b6 01            	rrwa	x,a
7717  10b7 1a03          	or	a,(OFST-1,sp)
7718  10b9 01            	rrwa	x,a
7720                     ; 1935   return (uint16_t)tmpccr1;
7724  10ba 5b04          	addw	sp,#4
7725  10bc 81            	ret	
7771                     ; 1943 uint16_t TIM1_GetCapture2(void)
7771                     ; 1944 {
7772                     	switch	.text
7773  10bd               _TIM1_GetCapture2:
7775  10bd 5204          	subw	sp,#4
7776       00000004      OFST:	set	4
7779                     ; 1947   uint16_t tmpccr2 = 0;
7781                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
7785                     ; 1950   tmpccr2h = TIM1->CCR2H;
7787  10bf c65267        	ld	a,21095
7788  10c2 6b02          	ld	(OFST-2,sp),a
7790                     ; 1951   tmpccr2l = TIM1->CCR2L;
7792  10c4 c65268        	ld	a,21096
7793  10c7 6b01          	ld	(OFST-3,sp),a
7795                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
7797  10c9 5f            	clrw	x
7798  10ca 97            	ld	xl,a
7799  10cb 1f03          	ldw	(OFST-1,sp),x
7801                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
7803  10cd 5f            	clrw	x
7804  10ce 7b02          	ld	a,(OFST-2,sp)
7805  10d0 97            	ld	xl,a
7806  10d1 7b04          	ld	a,(OFST+0,sp)
7807  10d3 01            	rrwa	x,a
7808  10d4 1a03          	or	a,(OFST-1,sp)
7809  10d6 01            	rrwa	x,a
7811                     ; 1956   return (uint16_t)tmpccr2;
7815  10d7 5b04          	addw	sp,#4
7816  10d9 81            	ret	
7862                     ; 1964 uint16_t TIM1_GetCapture3(void)
7862                     ; 1965 {
7863                     	switch	.text
7864  10da               _TIM1_GetCapture3:
7866  10da 5204          	subw	sp,#4
7867       00000004      OFST:	set	4
7870                     ; 1967   uint16_t tmpccr3 = 0;
7872                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
7876                     ; 1970   tmpccr3h = TIM1->CCR3H;
7878  10dc c65269        	ld	a,21097
7879  10df 6b02          	ld	(OFST-2,sp),a
7881                     ; 1971   tmpccr3l = TIM1->CCR3L;
7883  10e1 c6526a        	ld	a,21098
7884  10e4 6b01          	ld	(OFST-3,sp),a
7886                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
7888  10e6 5f            	clrw	x
7889  10e7 97            	ld	xl,a
7890  10e8 1f03          	ldw	(OFST-1,sp),x
7892                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
7894  10ea 5f            	clrw	x
7895  10eb 7b02          	ld	a,(OFST-2,sp)
7896  10ed 97            	ld	xl,a
7897  10ee 7b04          	ld	a,(OFST+0,sp)
7898  10f0 01            	rrwa	x,a
7899  10f1 1a03          	or	a,(OFST-1,sp)
7900  10f3 01            	rrwa	x,a
7902                     ; 1976   return (uint16_t)tmpccr3;
7906  10f4 5b04          	addw	sp,#4
7907  10f6 81            	ret	
7953                     ; 1984 uint16_t TIM1_GetCapture4(void)
7953                     ; 1985 {
7954                     	switch	.text
7955  10f7               _TIM1_GetCapture4:
7957  10f7 5204          	subw	sp,#4
7958       00000004      OFST:	set	4
7961                     ; 1987   uint16_t tmpccr4 = 0;
7963                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
7967                     ; 1990   tmpccr4h = TIM1->CCR4H;
7969  10f9 c6526b        	ld	a,21099
7970  10fc 6b02          	ld	(OFST-2,sp),a
7972                     ; 1991   tmpccr4l = TIM1->CCR4L;
7974  10fe c6526c        	ld	a,21100
7975  1101 6b01          	ld	(OFST-3,sp),a
7977                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
7979  1103 5f            	clrw	x
7980  1104 97            	ld	xl,a
7981  1105 1f03          	ldw	(OFST-1,sp),x
7983                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
7985  1107 5f            	clrw	x
7986  1108 7b02          	ld	a,(OFST-2,sp)
7987  110a 97            	ld	xl,a
7988  110b 7b04          	ld	a,(OFST+0,sp)
7989  110d 01            	rrwa	x,a
7990  110e 1a03          	or	a,(OFST-1,sp)
7991  1110 01            	rrwa	x,a
7993                     ; 1996   return (uint16_t)tmpccr4;
7997  1111 5b04          	addw	sp,#4
7998  1113 81            	ret	
8030                     ; 2004 uint16_t TIM1_GetCounter(void)
8030                     ; 2005 {
8031                     	switch	.text
8032  1114               _TIM1_GetCounter:
8034  1114 89            	pushw	x
8035       00000002      OFST:	set	2
8038                     ; 2006   uint16_t tmpcntr = 0;
8040                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
8042  1115 c6525e        	ld	a,21086
8043  1118 97            	ld	xl,a
8044  1119 4f            	clr	a
8045  111a 02            	rlwa	x,a
8046  111b 1f01          	ldw	(OFST-1,sp),x
8048                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
8050  111d c6525f        	ld	a,21087
8051  1120 5f            	clrw	x
8052  1121 97            	ld	xl,a
8053  1122 01            	rrwa	x,a
8054  1123 1a02          	or	a,(OFST+0,sp)
8055  1125 01            	rrwa	x,a
8056  1126 1a01          	or	a,(OFST-1,sp)
8057  1128 01            	rrwa	x,a
8060  1129 5b02          	addw	sp,#2
8061  112b 81            	ret	
8093                     ; 2019 uint16_t TIM1_GetPrescaler(void)
8093                     ; 2020 {
8094                     	switch	.text
8095  112c               _TIM1_GetPrescaler:
8097  112c 89            	pushw	x
8098       00000002      OFST:	set	2
8101                     ; 2021   uint16_t temp = 0;
8103                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
8105  112d c65260        	ld	a,21088
8106  1130 97            	ld	xl,a
8107  1131 4f            	clr	a
8108  1132 02            	rlwa	x,a
8109  1133 1f01          	ldw	(OFST-1,sp),x
8111                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
8113  1135 c65261        	ld	a,21089
8114  1138 5f            	clrw	x
8115  1139 97            	ld	xl,a
8116  113a 01            	rrwa	x,a
8117  113b 1a02          	or	a,(OFST+0,sp)
8118  113d 01            	rrwa	x,a
8119  113e 1a01          	or	a,(OFST-1,sp)
8120  1140 01            	rrwa	x,a
8123  1141 5b02          	addw	sp,#2
8124  1143 81            	ret	
8295                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
8295                     ; 2048 {
8296                     	switch	.text
8297  1144               _TIM1_GetFlagStatus:
8299  1144 89            	pushw	x
8300  1145 89            	pushw	x
8301       00000002      OFST:	set	2
8304                     ; 2049   FlagStatus bitstatus = RESET;
8306                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
8310                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
8312  1146 a30001        	cpw	x,#1
8313  1149 2745          	jreq	L6071
8314  114b a30002        	cpw	x,#2
8315  114e 2740          	jreq	L6071
8316  1150 a30004        	cpw	x,#4
8317  1153 273b          	jreq	L6071
8318  1155 a30008        	cpw	x,#8
8319  1158 2736          	jreq	L6071
8320  115a a30010        	cpw	x,#16
8321  115d 2731          	jreq	L6071
8322  115f a30020        	cpw	x,#32
8323  1162 272c          	jreq	L6071
8324  1164 a30040        	cpw	x,#64
8325  1167 2727          	jreq	L6071
8326  1169 a30080        	cpw	x,#128
8327  116c 2722          	jreq	L6071
8328  116e a30200        	cpw	x,#512
8329  1171 271d          	jreq	L6071
8330  1173 a30400        	cpw	x,#1024
8331  1176 2718          	jreq	L6071
8332  1178 a30800        	cpw	x,#2048
8333  117b 2713          	jreq	L6071
8334  117d a31000        	cpw	x,#4096
8335  1180 270e          	jreq	L6071
8336  1182 ae0805        	ldw	x,#2053
8337  1185 89            	pushw	x
8338  1186 5f            	clrw	x
8339  1187 89            	pushw	x
8340  1188 ae0000        	ldw	x,#L37
8341  118b cd0000        	call	_assert_failed
8343  118e 5b04          	addw	sp,#4
8344  1190               L6071:
8345                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
8347  1190 c65255        	ld	a,21077
8348  1193 1404          	and	a,(OFST+2,sp)
8349  1195 6b01          	ld	(OFST-1,sp),a
8351                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
8353  1197 7b03          	ld	a,(OFST+1,sp)
8354  1199 6b02          	ld	(OFST+0,sp),a
8356                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
8358  119b c45256        	and	a,21078
8359  119e 1a01          	or	a,(OFST-1,sp)
8360  11a0 2702          	jreq	L1533
8361                     ; 2060     bitstatus = SET;
8363  11a2 a601          	ld	a,#1
8366  11a4               L1533:
8367                     ; 2064     bitstatus = RESET;
8370                     ; 2066   return (FlagStatus)(bitstatus);
8374  11a4 5b04          	addw	sp,#4
8375  11a6 81            	ret	
8411                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
8411                     ; 2088 {
8412                     	switch	.text
8413  11a7               _TIM1_ClearFlag:
8415  11a7 89            	pushw	x
8416       00000000      OFST:	set	0
8419                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
8421  11a8 01            	rrwa	x,a
8422  11a9 9f            	ld	a,xl
8423  11aa a4e1          	and	a,#225
8424  11ac 97            	ld	xl,a
8425  11ad 4f            	clr	a
8426  11ae 02            	rlwa	x,a
8427  11af 5d            	tnzw	x
8428  11b0 2604          	jrne	L4171
8429  11b2 1e01          	ldw	x,(OFST+1,sp)
8430  11b4 260e          	jrne	L6171
8431  11b6               L4171:
8432  11b6 ae082a        	ldw	x,#2090
8433  11b9 89            	pushw	x
8434  11ba 5f            	clrw	x
8435  11bb 89            	pushw	x
8436  11bc ae0000        	ldw	x,#L37
8437  11bf cd0000        	call	_assert_failed
8439  11c2 5b04          	addw	sp,#4
8440  11c4               L6171:
8441                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
8443  11c4 7b02          	ld	a,(OFST+2,sp)
8444  11c6 43            	cpl	a
8445  11c7 c75255        	ld	21077,a
8446                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
8446                     ; 2095                         (uint8_t)0x1E);
8448  11ca 7b01          	ld	a,(OFST+1,sp)
8449  11cc 43            	cpl	a
8450  11cd a41e          	and	a,#30
8451  11cf c75256        	ld	21078,a
8452                     ; 2096 }
8455  11d2 85            	popw	x
8456  11d3 81            	ret	
8517                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
8517                     ; 2113 {
8518                     	switch	.text
8519  11d4               _TIM1_GetITStatus:
8521  11d4 88            	push	a
8522  11d5 89            	pushw	x
8523       00000002      OFST:	set	2
8526                     ; 2114   ITStatus bitstatus = RESET;
8528                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
8532                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
8534  11d6 a101          	cp	a,#1
8535  11d8 272a          	jreq	L0371
8536  11da a102          	cp	a,#2
8537  11dc 2726          	jreq	L0371
8538  11de a104          	cp	a,#4
8539  11e0 2722          	jreq	L0371
8540  11e2 a108          	cp	a,#8
8541  11e4 271e          	jreq	L0371
8542  11e6 a110          	cp	a,#16
8543  11e8 271a          	jreq	L0371
8544  11ea a120          	cp	a,#32
8545  11ec 2716          	jreq	L0371
8546  11ee a140          	cp	a,#64
8547  11f0 2712          	jreq	L0371
8548  11f2 a180          	cp	a,#128
8549  11f4 270e          	jreq	L0371
8550  11f6 ae0846        	ldw	x,#2118
8551  11f9 89            	pushw	x
8552  11fa 5f            	clrw	x
8553  11fb 89            	pushw	x
8554  11fc ae0000        	ldw	x,#L37
8555  11ff cd0000        	call	_assert_failed
8557  1202 5b04          	addw	sp,#4
8558  1204               L0371:
8559                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
8561  1204 c65255        	ld	a,21077
8562  1207 1403          	and	a,(OFST+1,sp)
8563  1209 6b01          	ld	(OFST-1,sp),a
8565                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
8567  120b c65254        	ld	a,21076
8568  120e 1403          	and	a,(OFST+1,sp)
8569  1210 6b02          	ld	(OFST+0,sp),a
8571                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
8573  1212 7b01          	ld	a,(OFST-1,sp)
8574  1214 2708          	jreq	L1243
8576  1216 7b02          	ld	a,(OFST+0,sp)
8577  1218 2704          	jreq	L1243
8578                     ; 2126     bitstatus = SET;
8580  121a a601          	ld	a,#1
8583  121c 2001          	jra	L3243
8584  121e               L1243:
8585                     ; 2130     bitstatus = RESET;
8587  121e 4f            	clr	a
8589  121f               L3243:
8590                     ; 2132   return (ITStatus)(bitstatus);
8594  121f 5b03          	addw	sp,#3
8595  1221 81            	ret	
8632                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
8632                     ; 2150 {
8633                     	switch	.text
8634  1222               _TIM1_ClearITPendingBit:
8636  1222 88            	push	a
8637       00000000      OFST:	set	0
8640                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
8642  1223 4d            	tnz	a
8643  1224 260e          	jrne	L0471
8644  1226 ae0868        	ldw	x,#2152
8645  1229 89            	pushw	x
8646  122a 5f            	clrw	x
8647  122b 89            	pushw	x
8648  122c ae0000        	ldw	x,#L37
8649  122f cd0000        	call	_assert_failed
8651  1232 5b04          	addw	sp,#4
8652  1234               L0471:
8653                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
8655  1234 7b01          	ld	a,(OFST+1,sp)
8656  1236 43            	cpl	a
8657  1237 c75255        	ld	21077,a
8658                     ; 2156 }
8661  123a 84            	pop	a
8662  123b 81            	ret	
8708                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
8708                     ; 2175                        uint8_t TIM1_ICSelection,
8708                     ; 2176                        uint8_t TIM1_ICFilter)
8708                     ; 2177 {
8709                     	switch	.text
8710  123c               L3_TI1_Config:
8712  123c 89            	pushw	x
8713  123d 88            	push	a
8714       00000001      OFST:	set	1
8717                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
8719  123e 7211525c      	bres	21084,#0
8720                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
8720                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8722  1242 7b06          	ld	a,(OFST+5,sp)
8723  1244 97            	ld	xl,a
8724  1245 a610          	ld	a,#16
8725  1247 42            	mul	x,a
8726  1248 9f            	ld	a,xl
8727  1249 1a03          	or	a,(OFST+2,sp)
8728  124b 6b01          	ld	(OFST+0,sp),a
8730  124d c65258        	ld	a,21080
8731  1250 a40c          	and	a,#12
8732  1252 1a01          	or	a,(OFST+0,sp)
8733  1254 c75258        	ld	21080,a
8734                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
8736  1257 7b02          	ld	a,(OFST+1,sp)
8737  1259 2706          	jreq	L3643
8738                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
8740  125b 7212525c      	bset	21084,#1
8742  125f 2004          	jra	L5643
8743  1261               L3643:
8744                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
8746  1261 7213525c      	bres	21084,#1
8747  1265               L5643:
8748                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
8750  1265 7210525c      	bset	21084,#0
8751                     ; 2197 }
8754  1269 5b03          	addw	sp,#3
8755  126b 81            	ret	
8801                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
8801                     ; 2216                        uint8_t TIM1_ICSelection,
8801                     ; 2217                        uint8_t TIM1_ICFilter)
8801                     ; 2218 {
8802                     	switch	.text
8803  126c               L5_TI2_Config:
8805  126c 89            	pushw	x
8806  126d 88            	push	a
8807       00000001      OFST:	set	1
8810                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
8812  126e 7219525c      	bres	21084,#4
8813                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
8813                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8815  1272 7b06          	ld	a,(OFST+5,sp)
8816  1274 97            	ld	xl,a
8817  1275 a610          	ld	a,#16
8818  1277 42            	mul	x,a
8819  1278 9f            	ld	a,xl
8820  1279 1a03          	or	a,(OFST+2,sp)
8821  127b 6b01          	ld	(OFST+0,sp),a
8823  127d c65259        	ld	a,21081
8824  1280 a40c          	and	a,#12
8825  1282 1a01          	or	a,(OFST+0,sp)
8826  1284 c75259        	ld	21081,a
8827                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
8829  1287 7b02          	ld	a,(OFST+1,sp)
8830  1289 2706          	jreq	L7053
8831                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
8833  128b 721a525c      	bset	21084,#5
8835  128f 2004          	jra	L1153
8836  1291               L7053:
8837                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
8839  1291 721b525c      	bres	21084,#5
8840  1295               L1153:
8841                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
8843  1295 7218525c      	bset	21084,#4
8844                     ; 2236 }
8847  1299 5b03          	addw	sp,#3
8848  129b 81            	ret	
8894                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
8894                     ; 2255                        uint8_t TIM1_ICSelection,
8894                     ; 2256                        uint8_t TIM1_ICFilter)
8894                     ; 2257 {
8895                     	switch	.text
8896  129c               L7_TI3_Config:
8898  129c 89            	pushw	x
8899  129d 88            	push	a
8900       00000001      OFST:	set	1
8903                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8905  129e 7211525d      	bres	21085,#0
8906                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
8906                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8908  12a2 7b06          	ld	a,(OFST+5,sp)
8909  12a4 97            	ld	xl,a
8910  12a5 a610          	ld	a,#16
8911  12a7 42            	mul	x,a
8912  12a8 9f            	ld	a,xl
8913  12a9 1a03          	or	a,(OFST+2,sp)
8914  12ab 6b01          	ld	(OFST+0,sp),a
8916  12ad c6525a        	ld	a,21082
8917  12b0 a40c          	and	a,#12
8918  12b2 1a01          	or	a,(OFST+0,sp)
8919  12b4 c7525a        	ld	21082,a
8920                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
8922  12b7 7b02          	ld	a,(OFST+1,sp)
8923  12b9 2706          	jreq	L3353
8924                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
8926  12bb 7212525d      	bset	21085,#1
8928  12bf 2004          	jra	L5353
8929  12c1               L3353:
8930                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8932  12c1 7213525d      	bres	21085,#1
8933  12c5               L5353:
8934                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8936  12c5 7210525d      	bset	21085,#0
8937                     ; 2276 }
8940  12c9 5b03          	addw	sp,#3
8941  12cb 81            	ret	
8987                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
8987                     ; 2295                        uint8_t TIM1_ICSelection,
8987                     ; 2296                        uint8_t TIM1_ICFilter)
8987                     ; 2297 {
8988                     	switch	.text
8989  12cc               L11_TI4_Config:
8991  12cc 89            	pushw	x
8992  12cd 88            	push	a
8993       00000001      OFST:	set	1
8996                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8998  12ce 7219525d      	bres	21085,#4
8999                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
8999                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9001  12d2 7b06          	ld	a,(OFST+5,sp)
9002  12d4 97            	ld	xl,a
9003  12d5 a610          	ld	a,#16
9004  12d7 42            	mul	x,a
9005  12d8 9f            	ld	a,xl
9006  12d9 1a03          	or	a,(OFST+2,sp)
9007  12db 6b01          	ld	(OFST+0,sp),a
9009  12dd c6525b        	ld	a,21083
9010  12e0 a40c          	and	a,#12
9011  12e2 1a01          	or	a,(OFST+0,sp)
9012  12e4 c7525b        	ld	21083,a
9013                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9015  12e7 7b02          	ld	a,(OFST+1,sp)
9016  12e9 2706          	jreq	L7553
9017                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
9019  12eb 721a525d      	bset	21085,#5
9021  12ef 2004          	jra	L1653
9022  12f1               L7553:
9023                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
9025  12f1 721b525d      	bres	21085,#5
9026  12f5               L1653:
9027                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
9029  12f5 7218525d      	bset	21085,#4
9030                     ; 2317 }
9033  12f9 5b03          	addw	sp,#3
9034  12fb 81            	ret	
9047                     	xdef	_TIM1_ClearITPendingBit
9048                     	xdef	_TIM1_GetITStatus
9049                     	xdef	_TIM1_ClearFlag
9050                     	xdef	_TIM1_GetFlagStatus
9051                     	xdef	_TIM1_GetPrescaler
9052                     	xdef	_TIM1_GetCounter
9053                     	xdef	_TIM1_GetCapture4
9054                     	xdef	_TIM1_GetCapture3
9055                     	xdef	_TIM1_GetCapture2
9056                     	xdef	_TIM1_GetCapture1
9057                     	xdef	_TIM1_SetIC4Prescaler
9058                     	xdef	_TIM1_SetIC3Prescaler
9059                     	xdef	_TIM1_SetIC2Prescaler
9060                     	xdef	_TIM1_SetIC1Prescaler
9061                     	xdef	_TIM1_SetCompare4
9062                     	xdef	_TIM1_SetCompare3
9063                     	xdef	_TIM1_SetCompare2
9064                     	xdef	_TIM1_SetCompare1
9065                     	xdef	_TIM1_SetAutoreload
9066                     	xdef	_TIM1_SetCounter
9067                     	xdef	_TIM1_SelectOCxM
9068                     	xdef	_TIM1_CCxNCmd
9069                     	xdef	_TIM1_CCxCmd
9070                     	xdef	_TIM1_OC4PolarityConfig
9071                     	xdef	_TIM1_OC3NPolarityConfig
9072                     	xdef	_TIM1_OC3PolarityConfig
9073                     	xdef	_TIM1_OC2NPolarityConfig
9074                     	xdef	_TIM1_OC2PolarityConfig
9075                     	xdef	_TIM1_OC1NPolarityConfig
9076                     	xdef	_TIM1_OC1PolarityConfig
9077                     	xdef	_TIM1_GenerateEvent
9078                     	xdef	_TIM1_OC4FastConfig
9079                     	xdef	_TIM1_OC3FastConfig
9080                     	xdef	_TIM1_OC2FastConfig
9081                     	xdef	_TIM1_OC1FastConfig
9082                     	xdef	_TIM1_OC4PreloadConfig
9083                     	xdef	_TIM1_OC3PreloadConfig
9084                     	xdef	_TIM1_OC2PreloadConfig
9085                     	xdef	_TIM1_OC1PreloadConfig
9086                     	xdef	_TIM1_CCPreloadControl
9087                     	xdef	_TIM1_SelectCOM
9088                     	xdef	_TIM1_ARRPreloadConfig
9089                     	xdef	_TIM1_ForcedOC4Config
9090                     	xdef	_TIM1_ForcedOC3Config
9091                     	xdef	_TIM1_ForcedOC2Config
9092                     	xdef	_TIM1_ForcedOC1Config
9093                     	xdef	_TIM1_CounterModeConfig
9094                     	xdef	_TIM1_PrescalerConfig
9095                     	xdef	_TIM1_EncoderInterfaceConfig
9096                     	xdef	_TIM1_SelectMasterSlaveMode
9097                     	xdef	_TIM1_SelectSlaveMode
9098                     	xdef	_TIM1_SelectOutputTrigger
9099                     	xdef	_TIM1_SelectOnePulseMode
9100                     	xdef	_TIM1_SelectHallSensor
9101                     	xdef	_TIM1_UpdateRequestConfig
9102                     	xdef	_TIM1_UpdateDisableConfig
9103                     	xdef	_TIM1_SelectInputTrigger
9104                     	xdef	_TIM1_TIxExternalClockConfig
9105                     	xdef	_TIM1_ETRConfig
9106                     	xdef	_TIM1_ETRClockMode2Config
9107                     	xdef	_TIM1_ETRClockMode1Config
9108                     	xdef	_TIM1_InternalClockConfig
9109                     	xdef	_TIM1_ITConfig
9110                     	xdef	_TIM1_CtrlPWMOutputs
9111                     	xdef	_TIM1_Cmd
9112                     	xdef	_TIM1_PWMIConfig
9113                     	xdef	_TIM1_ICInit
9114                     	xdef	_TIM1_BDTRConfig
9115                     	xdef	_TIM1_OC4Init
9116                     	xdef	_TIM1_OC3Init
9117                     	xdef	_TIM1_OC2Init
9118                     	xdef	_TIM1_OC1Init
9119                     	xdef	_TIM1_TimeBaseInit
9120                     	xdef	_TIM1_DeInit
9121                     	xref	_assert_failed
9122                     .const:	section	.text
9123  0000               L37:
9124  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
9125  0012 697665725c73  	dc.b	"iver\src\stm8s_tim"
9126  0024 312e6300      	dc.b	"1.c",0
9146                     	end
