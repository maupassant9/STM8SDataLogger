   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
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
 717  016b 2711          	jreq	L67
 718  016d 4d            	tnz	a
 719  016e 270e          	jreq	L67
 720  0170 ae00a9        	ldw	x,#169
 721  0173 89            	pushw	x
 722  0174 5f            	clrw	x
 723  0175 89            	pushw	x
 724  0176 ae0000        	ldw	x,#L37
 725  0179 cd0000        	call	_assert_failed
 727  017c 5b04          	addw	sp,#4
 728  017e               L67:
 729                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 731  017e 7b0e          	ld	a,(OFST+11,sp)
 732  0180 a12a          	cp	a,#42
 733  0182 2711          	jreq	L601
 734  0184 4d            	tnz	a
 735  0185 270e          	jreq	L601
 736  0187 ae00aa        	ldw	x,#170
 737  018a 89            	pushw	x
 738  018b 5f            	clrw	x
 739  018c 89            	pushw	x
 740  018d ae0000        	ldw	x,#L37
 741  0190 cd0000        	call	_assert_failed
 743  0193 5b04          	addw	sp,#4
 744  0195               L601:
 745                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 745                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 747  0195 c6525c        	ld	a,21084
 748  0198 a4f0          	and	a,#240
 749  019a c7525c        	ld	21084,a
 750                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 750                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 750                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 750                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 752  019d 7b0c          	ld	a,(OFST+9,sp)
 753  019f a408          	and	a,#8
 754  01a1 6b03          	ld	(OFST+0,sp),a
 756  01a3 7b0b          	ld	a,(OFST+8,sp)
 757  01a5 a402          	and	a,#2
 758  01a7 1a03          	or	a,(OFST+0,sp)
 759  01a9 6b02          	ld	(OFST-1,sp),a
 761  01ab 7b08          	ld	a,(OFST+5,sp)
 762  01ad a404          	and	a,#4
 763  01af 6b01          	ld	(OFST-2,sp),a
 765  01b1 7b05          	ld	a,(OFST+2,sp)
 766  01b3 a401          	and	a,#1
 767  01b5 1a01          	or	a,(OFST-2,sp)
 768  01b7 1a02          	or	a,(OFST-1,sp)
 769  01b9 ca525c        	or	a,21084
 770  01bc c7525c        	ld	21084,a
 771                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 771                     ; 185                           (uint8_t)TIM1_OCMode);
 773  01bf c65258        	ld	a,21080
 774  01c2 a48f          	and	a,#143
 775  01c4 1a04          	or	a,(OFST+1,sp)
 776  01c6 c75258        	ld	21080,a
 777                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 779  01c9 c6526f        	ld	a,21103
 780  01cc a4fc          	and	a,#252
 781  01ce c7526f        	ld	21103,a
 782                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 782                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 784  01d1 7b0e          	ld	a,(OFST+11,sp)
 785  01d3 a402          	and	a,#2
 786  01d5 6b03          	ld	(OFST+0,sp),a
 788  01d7 7b0d          	ld	a,(OFST+10,sp)
 789  01d9 a401          	and	a,#1
 790  01db 1a03          	or	a,(OFST+0,sp)
 791  01dd ca526f        	or	a,21103
 792  01e0 c7526f        	ld	21103,a
 793                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 795  01e3 7b09          	ld	a,(OFST+6,sp)
 796  01e5 c75265        	ld	21093,a
 797                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 799  01e8 7b0a          	ld	a,(OFST+7,sp)
 800  01ea c75266        	ld	21094,a
 801                     ; 196 }
 804  01ed 5b05          	addw	sp,#5
 805  01ef 81            	ret	
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
 910  01f0               _TIM1_OC2Init:
 912  01f0 89            	pushw	x
 913  01f1 5203          	subw	sp,#3
 914       00000003      OFST:	set	3
 917                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 919  01f3 9e            	ld	a,xh
 920  01f4 4d            	tnz	a
 921  01f5 2727          	jreq	L021
 922  01f7 9e            	ld	a,xh
 923  01f8 a110          	cp	a,#16
 924  01fa 2722          	jreq	L021
 925  01fc 9e            	ld	a,xh
 926  01fd a120          	cp	a,#32
 927  01ff 271d          	jreq	L021
 928  0201 9e            	ld	a,xh
 929  0202 a130          	cp	a,#48
 930  0204 2718          	jreq	L021
 931  0206 9e            	ld	a,xh
 932  0207 a160          	cp	a,#96
 933  0209 2713          	jreq	L021
 934  020b 9e            	ld	a,xh
 935  020c a170          	cp	a,#112
 936  020e 270e          	jreq	L021
 937  0210 ae00e3        	ldw	x,#227
 938  0213 89            	pushw	x
 939  0214 5f            	clrw	x
 940  0215 89            	pushw	x
 941  0216 ae0000        	ldw	x,#L37
 942  0219 cd0000        	call	_assert_failed
 944  021c 5b04          	addw	sp,#4
 945  021e               L021:
 946                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 948  021e 7b05          	ld	a,(OFST+2,sp)
 949  0220 2712          	jreq	L031
 950  0222 a111          	cp	a,#17
 951  0224 270e          	jreq	L031
 952  0226 ae00e4        	ldw	x,#228
 953  0229 89            	pushw	x
 954  022a 5f            	clrw	x
 955  022b 89            	pushw	x
 956  022c ae0000        	ldw	x,#L37
 957  022f cd0000        	call	_assert_failed
 959  0232 5b04          	addw	sp,#4
 960  0234               L031:
 961                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 963  0234 7b08          	ld	a,(OFST+5,sp)
 964  0236 2712          	jreq	L041
 965  0238 a144          	cp	a,#68
 966  023a 270e          	jreq	L041
 967  023c ae00e5        	ldw	x,#229
 968  023f 89            	pushw	x
 969  0240 5f            	clrw	x
 970  0241 89            	pushw	x
 971  0242 ae0000        	ldw	x,#L37
 972  0245 cd0000        	call	_assert_failed
 974  0248 5b04          	addw	sp,#4
 975  024a               L041:
 976                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 978  024a 7b0b          	ld	a,(OFST+8,sp)
 979  024c 2712          	jreq	L051
 980  024e a122          	cp	a,#34
 981  0250 270e          	jreq	L051
 982  0252 ae00e6        	ldw	x,#230
 983  0255 89            	pushw	x
 984  0256 5f            	clrw	x
 985  0257 89            	pushw	x
 986  0258 ae0000        	ldw	x,#L37
 987  025b cd0000        	call	_assert_failed
 989  025e 5b04          	addw	sp,#4
 990  0260               L051:
 991                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 993  0260 7b0c          	ld	a,(OFST+9,sp)
 994  0262 2712          	jreq	L061
 995  0264 a188          	cp	a,#136
 996  0266 270e          	jreq	L061
 997  0268 ae00e7        	ldw	x,#231
 998  026b 89            	pushw	x
 999  026c 5f            	clrw	x
1000  026d 89            	pushw	x
1001  026e ae0000        	ldw	x,#L37
1002  0271 cd0000        	call	_assert_failed
1004  0274 5b04          	addw	sp,#4
1005  0276               L061:
1006                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1008  0276 7b0d          	ld	a,(OFST+10,sp)
1009  0278 a155          	cp	a,#85
1010  027a 2711          	jreq	L071
1011  027c 4d            	tnz	a
1012  027d 270e          	jreq	L071
1013  027f ae00e8        	ldw	x,#232
1014  0282 89            	pushw	x
1015  0283 5f            	clrw	x
1016  0284 89            	pushw	x
1017  0285 ae0000        	ldw	x,#L37
1018  0288 cd0000        	call	_assert_failed
1020  028b 5b04          	addw	sp,#4
1021  028d               L071:
1022                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1024  028d 7b0e          	ld	a,(OFST+11,sp)
1025  028f a12a          	cp	a,#42
1026  0291 2711          	jreq	L002
1027  0293 4d            	tnz	a
1028  0294 270e          	jreq	L002
1029  0296 ae00e9        	ldw	x,#233
1030  0299 89            	pushw	x
1031  029a 5f            	clrw	x
1032  029b 89            	pushw	x
1033  029c ae0000        	ldw	x,#L37
1034  029f cd0000        	call	_assert_failed
1036  02a2 5b04          	addw	sp,#4
1037  02a4               L002:
1038                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1038                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1040  02a4 c6525c        	ld	a,21084
1041  02a7 a40f          	and	a,#15
1042  02a9 c7525c        	ld	21084,a
1043                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1043                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1043                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1043                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1045  02ac 7b0c          	ld	a,(OFST+9,sp)
1046  02ae a480          	and	a,#128
1047  02b0 6b03          	ld	(OFST+0,sp),a
1049  02b2 7b0b          	ld	a,(OFST+8,sp)
1050  02b4 a420          	and	a,#32
1051  02b6 1a03          	or	a,(OFST+0,sp)
1052  02b8 6b02          	ld	(OFST-1,sp),a
1054  02ba 7b08          	ld	a,(OFST+5,sp)
1055  02bc a440          	and	a,#64
1056  02be 6b01          	ld	(OFST-2,sp),a
1058  02c0 7b05          	ld	a,(OFST+2,sp)
1059  02c2 a410          	and	a,#16
1060  02c4 1a01          	or	a,(OFST-2,sp)
1061  02c6 1a02          	or	a,(OFST-1,sp)
1062  02c8 ca525c        	or	a,21084
1063  02cb c7525c        	ld	21084,a
1064                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1064                     ; 249                           (uint8_t)TIM1_OCMode);
1066  02ce c65259        	ld	a,21081
1067  02d1 a48f          	and	a,#143
1068  02d3 1a04          	or	a,(OFST+1,sp)
1069  02d5 c75259        	ld	21081,a
1070                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1072  02d8 c6526f        	ld	a,21103
1073  02db a4f3          	and	a,#243
1074  02dd c7526f        	ld	21103,a
1075                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1075                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1077  02e0 7b0e          	ld	a,(OFST+11,sp)
1078  02e2 a408          	and	a,#8
1079  02e4 6b03          	ld	(OFST+0,sp),a
1081  02e6 7b0d          	ld	a,(OFST+10,sp)
1082  02e8 a404          	and	a,#4
1083  02ea 1a03          	or	a,(OFST+0,sp)
1084  02ec ca526f        	or	a,21103
1085  02ef c7526f        	ld	21103,a
1086                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1088  02f2 7b09          	ld	a,(OFST+6,sp)
1089  02f4 c75267        	ld	21095,a
1090                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1092  02f7 7b0a          	ld	a,(OFST+7,sp)
1093  02f9 c75268        	ld	21096,a
1094                     ; 260 }
1097  02fc 5b05          	addw	sp,#5
1098  02fe 81            	ret	
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
1203  02ff               _TIM1_OC3Init:
1205  02ff 89            	pushw	x
1206  0300 5203          	subw	sp,#3
1207       00000003      OFST:	set	3
1210                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1212  0302 9e            	ld	a,xh
1213  0303 4d            	tnz	a
1214  0304 2727          	jreq	L212
1215  0306 9e            	ld	a,xh
1216  0307 a110          	cp	a,#16
1217  0309 2722          	jreq	L212
1218  030b 9e            	ld	a,xh
1219  030c a120          	cp	a,#32
1220  030e 271d          	jreq	L212
1221  0310 9e            	ld	a,xh
1222  0311 a130          	cp	a,#48
1223  0313 2718          	jreq	L212
1224  0315 9e            	ld	a,xh
1225  0316 a160          	cp	a,#96
1226  0318 2713          	jreq	L212
1227  031a 9e            	ld	a,xh
1228  031b a170          	cp	a,#112
1229  031d 270e          	jreq	L212
1230  031f ae0123        	ldw	x,#291
1231  0322 89            	pushw	x
1232  0323 5f            	clrw	x
1233  0324 89            	pushw	x
1234  0325 ae0000        	ldw	x,#L37
1235  0328 cd0000        	call	_assert_failed
1237  032b 5b04          	addw	sp,#4
1238  032d               L212:
1239                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1241  032d 7b05          	ld	a,(OFST+2,sp)
1242  032f 2712          	jreq	L222
1243  0331 a111          	cp	a,#17
1244  0333 270e          	jreq	L222
1245  0335 ae0124        	ldw	x,#292
1246  0338 89            	pushw	x
1247  0339 5f            	clrw	x
1248  033a 89            	pushw	x
1249  033b ae0000        	ldw	x,#L37
1250  033e cd0000        	call	_assert_failed
1252  0341 5b04          	addw	sp,#4
1253  0343               L222:
1254                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1256  0343 7b08          	ld	a,(OFST+5,sp)
1257  0345 2712          	jreq	L232
1258  0347 a144          	cp	a,#68
1259  0349 270e          	jreq	L232
1260  034b ae0125        	ldw	x,#293
1261  034e 89            	pushw	x
1262  034f 5f            	clrw	x
1263  0350 89            	pushw	x
1264  0351 ae0000        	ldw	x,#L37
1265  0354 cd0000        	call	_assert_failed
1267  0357 5b04          	addw	sp,#4
1268  0359               L232:
1269                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1271  0359 7b0b          	ld	a,(OFST+8,sp)
1272  035b 2712          	jreq	L242
1273  035d a122          	cp	a,#34
1274  035f 270e          	jreq	L242
1275  0361 ae0126        	ldw	x,#294
1276  0364 89            	pushw	x
1277  0365 5f            	clrw	x
1278  0366 89            	pushw	x
1279  0367 ae0000        	ldw	x,#L37
1280  036a cd0000        	call	_assert_failed
1282  036d 5b04          	addw	sp,#4
1283  036f               L242:
1284                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1286  036f 7b0c          	ld	a,(OFST+9,sp)
1287  0371 2712          	jreq	L252
1288  0373 a188          	cp	a,#136
1289  0375 270e          	jreq	L252
1290  0377 ae0127        	ldw	x,#295
1291  037a 89            	pushw	x
1292  037b 5f            	clrw	x
1293  037c 89            	pushw	x
1294  037d ae0000        	ldw	x,#L37
1295  0380 cd0000        	call	_assert_failed
1297  0383 5b04          	addw	sp,#4
1298  0385               L252:
1299                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1301  0385 7b0d          	ld	a,(OFST+10,sp)
1302  0387 a155          	cp	a,#85
1303  0389 2711          	jreq	L262
1304  038b 4d            	tnz	a
1305  038c 270e          	jreq	L262
1306  038e ae0128        	ldw	x,#296
1307  0391 89            	pushw	x
1308  0392 5f            	clrw	x
1309  0393 89            	pushw	x
1310  0394 ae0000        	ldw	x,#L37
1311  0397 cd0000        	call	_assert_failed
1313  039a 5b04          	addw	sp,#4
1314  039c               L262:
1315                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1317  039c 7b0e          	ld	a,(OFST+11,sp)
1318  039e a12a          	cp	a,#42
1319  03a0 2711          	jreq	L272
1320  03a2 4d            	tnz	a
1321  03a3 270e          	jreq	L272
1322  03a5 ae0129        	ldw	x,#297
1323  03a8 89            	pushw	x
1324  03a9 5f            	clrw	x
1325  03aa 89            	pushw	x
1326  03ab ae0000        	ldw	x,#L37
1327  03ae cd0000        	call	_assert_failed
1329  03b1 5b04          	addw	sp,#4
1330  03b3               L272:
1331                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1331                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1333  03b3 c6525d        	ld	a,21085
1334  03b6 a4f0          	and	a,#240
1335  03b8 c7525d        	ld	21085,a
1336                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1336                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1336                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1336                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1338  03bb 7b0c          	ld	a,(OFST+9,sp)
1339  03bd a408          	and	a,#8
1340  03bf 6b03          	ld	(OFST+0,sp),a
1342  03c1 7b0b          	ld	a,(OFST+8,sp)
1343  03c3 a402          	and	a,#2
1344  03c5 1a03          	or	a,(OFST+0,sp)
1345  03c7 6b02          	ld	(OFST-1,sp),a
1347  03c9 7b08          	ld	a,(OFST+5,sp)
1348  03cb a404          	and	a,#4
1349  03cd 6b01          	ld	(OFST-2,sp),a
1351  03cf 7b05          	ld	a,(OFST+2,sp)
1352  03d1 a401          	and	a,#1
1353  03d3 1a01          	or	a,(OFST-2,sp)
1354  03d5 1a02          	or	a,(OFST-1,sp)
1355  03d7 ca525d        	or	a,21085
1356  03da c7525d        	ld	21085,a
1357                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1357                     ; 312                           (uint8_t)TIM1_OCMode);
1359  03dd c6525a        	ld	a,21082
1360  03e0 a48f          	and	a,#143
1361  03e2 1a04          	or	a,(OFST+1,sp)
1362  03e4 c7525a        	ld	21082,a
1363                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1365  03e7 c6526f        	ld	a,21103
1366  03ea a4cf          	and	a,#207
1367  03ec c7526f        	ld	21103,a
1368                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1368                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1370  03ef 7b0e          	ld	a,(OFST+11,sp)
1371  03f1 a420          	and	a,#32
1372  03f3 6b03          	ld	(OFST+0,sp),a
1374  03f5 7b0d          	ld	a,(OFST+10,sp)
1375  03f7 a410          	and	a,#16
1376  03f9 1a03          	or	a,(OFST+0,sp)
1377  03fb ca526f        	or	a,21103
1378  03fe c7526f        	ld	21103,a
1379                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1381  0401 7b09          	ld	a,(OFST+6,sp)
1382  0403 c75269        	ld	21097,a
1383                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1385  0406 7b0a          	ld	a,(OFST+7,sp)
1386  0408 c7526a        	ld	21098,a
1387                     ; 323 }
1390  040b 5b05          	addw	sp,#5
1391  040d 81            	ret	
1464                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1464                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1464                     ; 340                   uint16_t TIM1_Pulse,
1464                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1464                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1464                     ; 343 {
1465                     	switch	.text
1466  040e               _TIM1_OC4Init:
1468  040e 89            	pushw	x
1469  040f 88            	push	a
1470       00000001      OFST:	set	1
1473                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1475  0410 9e            	ld	a,xh
1476  0411 4d            	tnz	a
1477  0412 2727          	jreq	L403
1478  0414 9e            	ld	a,xh
1479  0415 a110          	cp	a,#16
1480  0417 2722          	jreq	L403
1481  0419 9e            	ld	a,xh
1482  041a a120          	cp	a,#32
1483  041c 271d          	jreq	L403
1484  041e 9e            	ld	a,xh
1485  041f a130          	cp	a,#48
1486  0421 2718          	jreq	L403
1487  0423 9e            	ld	a,xh
1488  0424 a160          	cp	a,#96
1489  0426 2713          	jreq	L403
1490  0428 9e            	ld	a,xh
1491  0429 a170          	cp	a,#112
1492  042b 270e          	jreq	L403
1493  042d ae0159        	ldw	x,#345
1494  0430 89            	pushw	x
1495  0431 5f            	clrw	x
1496  0432 89            	pushw	x
1497  0433 ae0000        	ldw	x,#L37
1498  0436 cd0000        	call	_assert_failed
1500  0439 5b04          	addw	sp,#4
1501  043b               L403:
1502                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1504  043b 7b03          	ld	a,(OFST+2,sp)
1505  043d 2712          	jreq	L413
1506  043f a111          	cp	a,#17
1507  0441 270e          	jreq	L413
1508  0443 ae015a        	ldw	x,#346
1509  0446 89            	pushw	x
1510  0447 5f            	clrw	x
1511  0448 89            	pushw	x
1512  0449 ae0000        	ldw	x,#L37
1513  044c cd0000        	call	_assert_failed
1515  044f 5b04          	addw	sp,#4
1516  0451               L413:
1517                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1519  0451 7b08          	ld	a,(OFST+7,sp)
1520  0453 2712          	jreq	L423
1521  0455 a122          	cp	a,#34
1522  0457 270e          	jreq	L423
1523  0459 ae015b        	ldw	x,#347
1524  045c 89            	pushw	x
1525  045d 5f            	clrw	x
1526  045e 89            	pushw	x
1527  045f ae0000        	ldw	x,#L37
1528  0462 cd0000        	call	_assert_failed
1530  0465 5b04          	addw	sp,#4
1531  0467               L423:
1532                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1534  0467 7b09          	ld	a,(OFST+8,sp)
1535  0469 a155          	cp	a,#85
1536  046b 2711          	jreq	L433
1537  046d 4d            	tnz	a
1538  046e 270e          	jreq	L433
1539  0470 ae015c        	ldw	x,#348
1540  0473 89            	pushw	x
1541  0474 5f            	clrw	x
1542  0475 89            	pushw	x
1543  0476 ae0000        	ldw	x,#L37
1544  0479 cd0000        	call	_assert_failed
1546  047c 5b04          	addw	sp,#4
1547  047e               L433:
1548                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1550  047e c6525d        	ld	a,21085
1551  0481 a4cf          	and	a,#207
1552  0483 c7525d        	ld	21085,a
1553                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1553                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1555  0486 7b08          	ld	a,(OFST+7,sp)
1556  0488 a420          	and	a,#32
1557  048a 6b01          	ld	(OFST+0,sp),a
1559  048c 7b03          	ld	a,(OFST+2,sp)
1560  048e a410          	and	a,#16
1561  0490 1a01          	or	a,(OFST+0,sp)
1562  0492 ca525d        	or	a,21085
1563  0495 c7525d        	ld	21085,a
1564                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1564                     ; 358                           TIM1_OCMode);
1566  0498 c6525b        	ld	a,21083
1567  049b a48f          	and	a,#143
1568  049d 1a02          	or	a,(OFST+1,sp)
1569  049f c7525b        	ld	21083,a
1570                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1572  04a2 7b09          	ld	a,(OFST+8,sp)
1573  04a4 270a          	jreq	L124
1574                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1576  04a6 c6526f        	ld	a,21103
1577  04a9 aadf          	or	a,#223
1578  04ab c7526f        	ld	21103,a
1580  04ae 2004          	jra	L324
1581  04b0               L124:
1582                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1584  04b0 721d526f      	bres	21103,#6
1585  04b4               L324:
1586                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1588  04b4 7b06          	ld	a,(OFST+5,sp)
1589  04b6 c7526b        	ld	21099,a
1590                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1592  04b9 7b07          	ld	a,(OFST+6,sp)
1593  04bb c7526c        	ld	21100,a
1594                     ; 373 }
1597  04be 5b03          	addw	sp,#3
1598  04c0 81            	ret	
1802                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1802                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1802                     ; 390                      uint8_t TIM1_DeadTime,
1802                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1802                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1802                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1802                     ; 394 {
1803                     	switch	.text
1804  04c1               _TIM1_BDTRConfig:
1806  04c1 89            	pushw	x
1807  04c2 88            	push	a
1808       00000001      OFST:	set	1
1811                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1813  04c3 9e            	ld	a,xh
1814  04c4 a104          	cp	a,#4
1815  04c6 2712          	jreq	L643
1816  04c8 9e            	ld	a,xh
1817  04c9 4d            	tnz	a
1818  04ca 270e          	jreq	L643
1819  04cc ae018c        	ldw	x,#396
1820  04cf 89            	pushw	x
1821  04d0 5f            	clrw	x
1822  04d1 89            	pushw	x
1823  04d2 ae0000        	ldw	x,#L37
1824  04d5 cd0000        	call	_assert_failed
1826  04d8 5b04          	addw	sp,#4
1827  04da               L643:
1828                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1830  04da 7b03          	ld	a,(OFST+2,sp)
1831  04dc 271a          	jreq	L653
1832  04de a101          	cp	a,#1
1833  04e0 2716          	jreq	L653
1834  04e2 a102          	cp	a,#2
1835  04e4 2712          	jreq	L653
1836  04e6 a103          	cp	a,#3
1837  04e8 270e          	jreq	L653
1838  04ea ae018d        	ldw	x,#397
1839  04ed 89            	pushw	x
1840  04ee 5f            	clrw	x
1841  04ef 89            	pushw	x
1842  04f0 ae0000        	ldw	x,#L37
1843  04f3 cd0000        	call	_assert_failed
1845  04f6 5b04          	addw	sp,#4
1846  04f8               L653:
1847                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1849  04f8 7b07          	ld	a,(OFST+6,sp)
1850  04fa a110          	cp	a,#16
1851  04fc 2711          	jreq	L663
1852  04fe 4d            	tnz	a
1853  04ff 270e          	jreq	L663
1854  0501 ae018e        	ldw	x,#398
1855  0504 89            	pushw	x
1856  0505 5f            	clrw	x
1857  0506 89            	pushw	x
1858  0507 ae0000        	ldw	x,#L37
1859  050a cd0000        	call	_assert_failed
1861  050d 5b04          	addw	sp,#4
1862  050f               L663:
1863                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1865  050f 7b08          	ld	a,(OFST+7,sp)
1866  0511 2712          	jreq	L673
1867  0513 a120          	cp	a,#32
1868  0515 270e          	jreq	L673
1869  0517 ae018f        	ldw	x,#399
1870  051a 89            	pushw	x
1871  051b 5f            	clrw	x
1872  051c 89            	pushw	x
1873  051d ae0000        	ldw	x,#L37
1874  0520 cd0000        	call	_assert_failed
1876  0523 5b04          	addw	sp,#4
1877  0525               L673:
1878                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1880  0525 7b09          	ld	a,(OFST+8,sp)
1881  0527 a140          	cp	a,#64
1882  0529 2711          	jreq	L604
1883  052b 4d            	tnz	a
1884  052c 270e          	jreq	L604
1885  052e ae0190        	ldw	x,#400
1886  0531 89            	pushw	x
1887  0532 5f            	clrw	x
1888  0533 89            	pushw	x
1889  0534 ae0000        	ldw	x,#L37
1890  0537 cd0000        	call	_assert_failed
1892  053a 5b04          	addw	sp,#4
1893  053c               L604:
1894                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1896  053c 7b06          	ld	a,(OFST+5,sp)
1897  053e c7526e        	ld	21102,a
1898                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1898                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1898                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1900  0541 7b07          	ld	a,(OFST+6,sp)
1901  0543 1a08          	or	a,(OFST+7,sp)
1902  0545 1a09          	or	a,(OFST+8,sp)
1903  0547 6b01          	ld	(OFST+0,sp),a
1905  0549 7b02          	ld	a,(OFST+1,sp)
1906  054b 1a03          	or	a,(OFST+2,sp)
1907  054d 1a01          	or	a,(OFST+0,sp)
1908  054f c7526d        	ld	21101,a
1909                     ; 409 }
1912  0552 5b03          	addw	sp,#3
1913  0554 81            	ret	
2114                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
2114                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2114                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
2114                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2114                     ; 427                  uint8_t TIM1_ICFilter)
2114                     ; 428 {
2115                     	switch	.text
2116  0555               _TIM1_ICInit:
2118  0555 89            	pushw	x
2119       00000000      OFST:	set	0
2122                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
2124  0556 9e            	ld	a,xh
2125  0557 4d            	tnz	a
2126  0558 271c          	jreq	L024
2127  055a 9e            	ld	a,xh
2128  055b 4a            	dec	a
2129  055c 2718          	jreq	L024
2130  055e 9e            	ld	a,xh
2131  055f a102          	cp	a,#2
2132  0561 2713          	jreq	L024
2133  0563 9e            	ld	a,xh
2134  0564 a103          	cp	a,#3
2135  0566 270e          	jreq	L024
2136  0568 ae01ae        	ldw	x,#430
2137  056b 89            	pushw	x
2138  056c 5f            	clrw	x
2139  056d 89            	pushw	x
2140  056e ae0000        	ldw	x,#L37
2141  0571 cd0000        	call	_assert_failed
2143  0574 5b04          	addw	sp,#4
2144  0576               L024:
2145                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2147  0576 7b02          	ld	a,(OFST+2,sp)
2148  0578 2711          	jreq	L034
2149  057a 4a            	dec	a
2150  057b 270e          	jreq	L034
2151  057d ae01af        	ldw	x,#431
2152  0580 89            	pushw	x
2153  0581 5f            	clrw	x
2154  0582 89            	pushw	x
2155  0583 ae0000        	ldw	x,#L37
2156  0586 cd0000        	call	_assert_failed
2158  0589 5b04          	addw	sp,#4
2159  058b               L034:
2160                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2162  058b 7b05          	ld	a,(OFST+5,sp)
2163  058d a101          	cp	a,#1
2164  058f 2716          	jreq	L044
2165  0591 a102          	cp	a,#2
2166  0593 2712          	jreq	L044
2167  0595 a103          	cp	a,#3
2168  0597 270e          	jreq	L044
2169  0599 ae01b0        	ldw	x,#432
2170  059c 89            	pushw	x
2171  059d 5f            	clrw	x
2172  059e 89            	pushw	x
2173  059f ae0000        	ldw	x,#L37
2174  05a2 cd0000        	call	_assert_failed
2176  05a5 5b04          	addw	sp,#4
2177  05a7               L044:
2178                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2180  05a7 7b06          	ld	a,(OFST+6,sp)
2181  05a9 271a          	jreq	L054
2182  05ab a104          	cp	a,#4
2183  05ad 2716          	jreq	L054
2184  05af a108          	cp	a,#8
2185  05b1 2712          	jreq	L054
2186  05b3 a10c          	cp	a,#12
2187  05b5 270e          	jreq	L054
2188  05b7 ae01b1        	ldw	x,#433
2189  05ba 89            	pushw	x
2190  05bb 5f            	clrw	x
2191  05bc 89            	pushw	x
2192  05bd ae0000        	ldw	x,#L37
2193  05c0 cd0000        	call	_assert_failed
2195  05c3 5b04          	addw	sp,#4
2196  05c5               L054:
2197                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
2199  05c5 7b07          	ld	a,(OFST+7,sp)
2200  05c7 a110          	cp	a,#16
2201  05c9 250e          	jrult	L654
2202  05cb ae01b2        	ldw	x,#434
2203  05ce 89            	pushw	x
2204  05cf 5f            	clrw	x
2205  05d0 89            	pushw	x
2206  05d1 ae0000        	ldw	x,#L37
2207  05d4 cd0000        	call	_assert_failed
2209  05d7 5b04          	addw	sp,#4
2210  05d9               L654:
2211                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
2213  05d9 7b01          	ld	a,(OFST+1,sp)
2214  05db 2614          	jrne	L746
2215                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
2215                     ; 440                (uint8_t)TIM1_ICSelection,
2215                     ; 441                (uint8_t)TIM1_ICFilter);
2217  05dd 7b07          	ld	a,(OFST+7,sp)
2218  05df 88            	push	a
2219  05e0 7b06          	ld	a,(OFST+6,sp)
2220  05e2 97            	ld	xl,a
2221  05e3 7b03          	ld	a,(OFST+3,sp)
2222  05e5 95            	ld	xh,a
2223  05e6 cd1231        	call	L3_TI1_Config
2225  05e9 84            	pop	a
2226                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2228  05ea 7b06          	ld	a,(OFST+6,sp)
2229  05ec cd0fed        	call	_TIM1_SetIC1Prescaler
2232  05ef 2042          	jra	L156
2233  05f1               L746:
2234                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
2236  05f1 a101          	cp	a,#1
2237  05f3 2614          	jrne	L356
2238                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
2238                     ; 449                (uint8_t)TIM1_ICSelection,
2238                     ; 450                (uint8_t)TIM1_ICFilter);
2240  05f5 7b07          	ld	a,(OFST+7,sp)
2241  05f7 88            	push	a
2242  05f8 7b06          	ld	a,(OFST+6,sp)
2243  05fa 97            	ld	xl,a
2244  05fb 7b03          	ld	a,(OFST+3,sp)
2245  05fd 95            	ld	xh,a
2246  05fe cd1261        	call	L5_TI2_Config
2248  0601 84            	pop	a
2249                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2251  0602 7b06          	ld	a,(OFST+6,sp)
2252  0604 cd1017        	call	_TIM1_SetIC2Prescaler
2255  0607 202a          	jra	L156
2256  0609               L356:
2257                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
2259  0609 a102          	cp	a,#2
2260  060b 2614          	jrne	L756
2261                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
2261                     ; 458                (uint8_t)TIM1_ICSelection,
2261                     ; 459                (uint8_t)TIM1_ICFilter);
2263  060d 7b07          	ld	a,(OFST+7,sp)
2264  060f 88            	push	a
2265  0610 7b06          	ld	a,(OFST+6,sp)
2266  0612 97            	ld	xl,a
2267  0613 7b03          	ld	a,(OFST+3,sp)
2268  0615 95            	ld	xh,a
2269  0616 cd1291        	call	L7_TI3_Config
2271  0619 84            	pop	a
2272                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
2274  061a 7b06          	ld	a,(OFST+6,sp)
2275  061c cd1041        	call	_TIM1_SetIC3Prescaler
2278  061f 2012          	jra	L156
2279  0621               L756:
2280                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
2280                     ; 467                (uint8_t)TIM1_ICSelection,
2280                     ; 468                (uint8_t)TIM1_ICFilter);
2282  0621 7b07          	ld	a,(OFST+7,sp)
2283  0623 88            	push	a
2284  0624 7b06          	ld	a,(OFST+6,sp)
2285  0626 97            	ld	xl,a
2286  0627 7b03          	ld	a,(OFST+3,sp)
2287  0629 95            	ld	xh,a
2288  062a cd12c1        	call	L11_TI4_Config
2290  062d 84            	pop	a
2291                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
2293  062e 7b06          	ld	a,(OFST+6,sp)
2294  0630 cd106b        	call	_TIM1_SetIC4Prescaler
2296  0633               L156:
2297                     ; 472 }
2300  0633 85            	popw	x
2301  0634 81            	ret	
2392                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
2392                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2392                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
2392                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2392                     ; 492                      uint8_t TIM1_ICFilter)
2392                     ; 493 {
2393                     	switch	.text
2394  0635               _TIM1_PWMIConfig:
2396  0635 89            	pushw	x
2397  0636 89            	pushw	x
2398       00000002      OFST:	set	2
2401                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
2403                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
2405                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
2407  0637 9e            	ld	a,xh
2408  0638 4d            	tnz	a
2409  0639 2712          	jreq	L015
2410  063b 9e            	ld	a,xh
2411  063c 4a            	dec	a
2412  063d 270e          	jreq	L015
2413  063f ae01f2        	ldw	x,#498
2414  0642 89            	pushw	x
2415  0643 5f            	clrw	x
2416  0644 89            	pushw	x
2417  0645 ae0000        	ldw	x,#L37
2418  0648 cd0000        	call	_assert_failed
2420  064b 5b04          	addw	sp,#4
2421  064d               L015:
2422                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2424  064d 7b04          	ld	a,(OFST+2,sp)
2425  064f 2711          	jreq	L025
2426  0651 4a            	dec	a
2427  0652 270e          	jreq	L025
2428  0654 ae01f3        	ldw	x,#499
2429  0657 89            	pushw	x
2430  0658 5f            	clrw	x
2431  0659 89            	pushw	x
2432  065a ae0000        	ldw	x,#L37
2433  065d cd0000        	call	_assert_failed
2435  0660 5b04          	addw	sp,#4
2436  0662               L025:
2437                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2439  0662 7b07          	ld	a,(OFST+5,sp)
2440  0664 a101          	cp	a,#1
2441  0666 2716          	jreq	L035
2442  0668 a102          	cp	a,#2
2443  066a 2712          	jreq	L035
2444  066c a103          	cp	a,#3
2445  066e 270e          	jreq	L035
2446  0670 ae01f4        	ldw	x,#500
2447  0673 89            	pushw	x
2448  0674 5f            	clrw	x
2449  0675 89            	pushw	x
2450  0676 ae0000        	ldw	x,#L37
2451  0679 cd0000        	call	_assert_failed
2453  067c 5b04          	addw	sp,#4
2454  067e               L035:
2455                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2457  067e 7b08          	ld	a,(OFST+6,sp)
2458  0680 271a          	jreq	L045
2459  0682 a104          	cp	a,#4
2460  0684 2716          	jreq	L045
2461  0686 a108          	cp	a,#8
2462  0688 2712          	jreq	L045
2463  068a a10c          	cp	a,#12
2464  068c 270e          	jreq	L045
2465  068e ae01f5        	ldw	x,#501
2466  0691 89            	pushw	x
2467  0692 5f            	clrw	x
2468  0693 89            	pushw	x
2469  0694 ae0000        	ldw	x,#L37
2470  0697 cd0000        	call	_assert_failed
2472  069a 5b04          	addw	sp,#4
2473  069c               L045:
2474                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
2476  069c 7b04          	ld	a,(OFST+2,sp)
2477  069e 4a            	dec	a
2478  069f 2702          	jreq	L327
2479                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
2481  06a1 a601          	ld	a,#1
2483  06a3               L327:
2484                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
2486  06a3 6b01          	ld	(OFST-1,sp),a
2488                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
2490  06a5 7b07          	ld	a,(OFST+5,sp)
2491  06a7 4a            	dec	a
2492  06a8 2604          	jrne	L727
2493                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
2495  06aa a602          	ld	a,#2
2497  06ac 2002          	jra	L137
2498  06ae               L727:
2499                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
2501  06ae a601          	ld	a,#1
2502  06b0               L137:
2503  06b0 6b02          	ld	(OFST+0,sp),a
2505                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
2507  06b2 7b03          	ld	a,(OFST+1,sp)
2508  06b4 2626          	jrne	L337
2509                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2509                     ; 527                (uint8_t)TIM1_ICFilter);
2511  06b6 7b09          	ld	a,(OFST+7,sp)
2512  06b8 88            	push	a
2513  06b9 7b08          	ld	a,(OFST+6,sp)
2514  06bb 97            	ld	xl,a
2515  06bc 7b05          	ld	a,(OFST+3,sp)
2516  06be 95            	ld	xh,a
2517  06bf cd1231        	call	L3_TI1_Config
2519  06c2 84            	pop	a
2520                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2522  06c3 7b08          	ld	a,(OFST+6,sp)
2523  06c5 cd0fed        	call	_TIM1_SetIC1Prescaler
2525                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
2527  06c8 7b09          	ld	a,(OFST+7,sp)
2528  06ca 88            	push	a
2529  06cb 7b03          	ld	a,(OFST+1,sp)
2530  06cd 97            	ld	xl,a
2531  06ce 7b02          	ld	a,(OFST+0,sp)
2532  06d0 95            	ld	xh,a
2533  06d1 cd1261        	call	L5_TI2_Config
2535  06d4 84            	pop	a
2536                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2538  06d5 7b08          	ld	a,(OFST+6,sp)
2539  06d7 cd1017        	call	_TIM1_SetIC2Prescaler
2542  06da 2024          	jra	L537
2543  06dc               L337:
2544                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2544                     ; 542                (uint8_t)TIM1_ICFilter);
2546  06dc 7b09          	ld	a,(OFST+7,sp)
2547  06de 88            	push	a
2548  06df 7b08          	ld	a,(OFST+6,sp)
2549  06e1 97            	ld	xl,a
2550  06e2 7b05          	ld	a,(OFST+3,sp)
2551  06e4 95            	ld	xh,a
2552  06e5 cd1261        	call	L5_TI2_Config
2554  06e8 84            	pop	a
2555                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2557  06e9 7b08          	ld	a,(OFST+6,sp)
2558  06eb cd1017        	call	_TIM1_SetIC2Prescaler
2560                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
2562  06ee 7b09          	ld	a,(OFST+7,sp)
2563  06f0 88            	push	a
2564  06f1 7b03          	ld	a,(OFST+1,sp)
2565  06f3 97            	ld	xl,a
2566  06f4 7b02          	ld	a,(OFST+0,sp)
2567  06f6 95            	ld	xh,a
2568  06f7 cd1231        	call	L3_TI1_Config
2570  06fa 84            	pop	a
2571                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2573  06fb 7b08          	ld	a,(OFST+6,sp)
2574  06fd cd0fed        	call	_TIM1_SetIC1Prescaler
2576  0700               L537:
2577                     ; 553 }
2580  0700 5b04          	addw	sp,#4
2581  0702 81            	ret	
2637                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2637                     ; 562 {
2638                     	switch	.text
2639  0703               _TIM1_Cmd:
2641  0703 88            	push	a
2642       00000000      OFST:	set	0
2645                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2647  0704 4d            	tnz	a
2648  0705 2711          	jreq	L275
2649  0707 4a            	dec	a
2650  0708 270e          	jreq	L275
2651  070a ae0234        	ldw	x,#564
2652  070d 89            	pushw	x
2653  070e 5f            	clrw	x
2654  070f 89            	pushw	x
2655  0710 ae0000        	ldw	x,#L37
2656  0713 cd0000        	call	_assert_failed
2658  0716 5b04          	addw	sp,#4
2659  0718               L275:
2660                     ; 567   if (NewState != DISABLE)
2662  0718 7b01          	ld	a,(OFST+1,sp)
2663  071a 2706          	jreq	L567
2664                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2666  071c 72105250      	bset	21072,#0
2668  0720 2004          	jra	L767
2669  0722               L567:
2670                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2672  0722 72115250      	bres	21072,#0
2673  0726               L767:
2674                     ; 575 }
2677  0726 84            	pop	a
2678  0727 81            	ret	
2715                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2715                     ; 584 {
2716                     	switch	.text
2717  0728               _TIM1_CtrlPWMOutputs:
2719  0728 88            	push	a
2720       00000000      OFST:	set	0
2723                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2725  0729 4d            	tnz	a
2726  072a 2711          	jreq	L406
2727  072c 4a            	dec	a
2728  072d 270e          	jreq	L406
2729  072f ae024a        	ldw	x,#586
2730  0732 89            	pushw	x
2731  0733 5f            	clrw	x
2732  0734 89            	pushw	x
2733  0735 ae0000        	ldw	x,#L37
2734  0738 cd0000        	call	_assert_failed
2736  073b 5b04          	addw	sp,#4
2737  073d               L406:
2738                     ; 590   if (NewState != DISABLE)
2740  073d 7b01          	ld	a,(OFST+1,sp)
2741  073f 2706          	jreq	L7001
2742                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2744  0741 721e526d      	bset	21101,#7
2746  0745 2004          	jra	L1101
2747  0747               L7001:
2748                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2750  0747 721f526d      	bres	21101,#7
2751  074b               L1101:
2752                     ; 598 }
2755  074b 84            	pop	a
2756  074c 81            	ret	
2864                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2864                     ; 618 {
2865                     	switch	.text
2866  074d               _TIM1_ITConfig:
2868  074d 89            	pushw	x
2869       00000000      OFST:	set	0
2872                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2874  074e 9e            	ld	a,xh
2875  074f 4d            	tnz	a
2876  0750 260e          	jrne	L416
2877  0752 ae026c        	ldw	x,#620
2878  0755 89            	pushw	x
2879  0756 5f            	clrw	x
2880  0757 89            	pushw	x
2881  0758 ae0000        	ldw	x,#L37
2882  075b cd0000        	call	_assert_failed
2884  075e 5b04          	addw	sp,#4
2885  0760               L416:
2886                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2888  0760 7b02          	ld	a,(OFST+2,sp)
2889  0762 2711          	jreq	L426
2890  0764 4a            	dec	a
2891  0765 270e          	jreq	L426
2892  0767 ae026d        	ldw	x,#621
2893  076a 89            	pushw	x
2894  076b 5f            	clrw	x
2895  076c 89            	pushw	x
2896  076d ae0000        	ldw	x,#L37
2897  0770 cd0000        	call	_assert_failed
2899  0773 5b04          	addw	sp,#4
2900  0775               L426:
2901                     ; 623   if (NewState != DISABLE)
2903  0775 7b02          	ld	a,(OFST+2,sp)
2904  0777 2707          	jreq	L1601
2905                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2907  0779 c65254        	ld	a,21076
2908  077c 1a01          	or	a,(OFST+1,sp)
2910  077e 2006          	jra	L3601
2911  0780               L1601:
2912                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2914  0780 7b01          	ld	a,(OFST+1,sp)
2915  0782 43            	cpl	a
2916  0783 c45254        	and	a,21076
2917  0786               L3601:
2918  0786 c75254        	ld	21076,a
2919                     ; 633 }
2922  0789 85            	popw	x
2923  078a 81            	ret	
2947                     ; 640 void TIM1_InternalClockConfig(void)
2947                     ; 641 {
2948                     	switch	.text
2949  078b               _TIM1_InternalClockConfig:
2953                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2955  078b c65252        	ld	a,21074
2956  078e a4f8          	and	a,#248
2957  0790 c75252        	ld	21074,a
2958                     ; 644 }
2961  0793 81            	ret	
3077                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3077                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3077                     ; 664                               uint8_t ExtTRGFilter)
3077                     ; 665 {
3078                     	switch	.text
3079  0794               _TIM1_ETRClockMode1Config:
3081  0794 89            	pushw	x
3082       00000000      OFST:	set	0
3085                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3087  0795 9e            	ld	a,xh
3088  0796 4d            	tnz	a
3089  0797 271d          	jreq	L046
3090  0799 9e            	ld	a,xh
3091  079a a110          	cp	a,#16
3092  079c 2718          	jreq	L046
3093  079e 9e            	ld	a,xh
3094  079f a120          	cp	a,#32
3095  07a1 2713          	jreq	L046
3096  07a3 9e            	ld	a,xh
3097  07a4 a130          	cp	a,#48
3098  07a6 270e          	jreq	L046
3099  07a8 ae029b        	ldw	x,#667
3100  07ab 89            	pushw	x
3101  07ac 5f            	clrw	x
3102  07ad 89            	pushw	x
3103  07ae ae0000        	ldw	x,#L37
3104  07b1 cd0000        	call	_assert_failed
3106  07b4 5b04          	addw	sp,#4
3107  07b6               L046:
3108                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3110  07b6 7b02          	ld	a,(OFST+2,sp)
3111  07b8 a180          	cp	a,#128
3112  07ba 2711          	jreq	L056
3113  07bc 4d            	tnz	a
3114  07bd 270e          	jreq	L056
3115  07bf ae029c        	ldw	x,#668
3116  07c2 89            	pushw	x
3117  07c3 5f            	clrw	x
3118  07c4 89            	pushw	x
3119  07c5 ae0000        	ldw	x,#L37
3120  07c8 cd0000        	call	_assert_failed
3122  07cb 5b04          	addw	sp,#4
3123  07cd               L056:
3124                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3126  07cd 7b05          	ld	a,(OFST+5,sp)
3127  07cf 88            	push	a
3128  07d0 7b03          	ld	a,(OFST+3,sp)
3129  07d2 97            	ld	xl,a
3130  07d3 7b02          	ld	a,(OFST+2,sp)
3131  07d5 95            	ld	xh,a
3132  07d6 ad56          	call	_TIM1_ETRConfig
3134  07d8 84            	pop	a
3135                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
3135                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
3137  07d9 c65252        	ld	a,21074
3138  07dc aa77          	or	a,#119
3139  07de c75252        	ld	21074,a
3140                     ; 676 }
3143  07e1 85            	popw	x
3144  07e2 81            	ret	
3201                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3201                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3201                     ; 696                               uint8_t ExtTRGFilter)
3201                     ; 697 {
3202                     	switch	.text
3203  07e3               _TIM1_ETRClockMode2Config:
3205  07e3 89            	pushw	x
3206       00000000      OFST:	set	0
3209                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3211  07e4 9e            	ld	a,xh
3212  07e5 4d            	tnz	a
3213  07e6 271d          	jreq	L466
3214  07e8 9e            	ld	a,xh
3215  07e9 a110          	cp	a,#16
3216  07eb 2718          	jreq	L466
3217  07ed 9e            	ld	a,xh
3218  07ee a120          	cp	a,#32
3219  07f0 2713          	jreq	L466
3220  07f2 9e            	ld	a,xh
3221  07f3 a130          	cp	a,#48
3222  07f5 270e          	jreq	L466
3223  07f7 ae02bb        	ldw	x,#699
3224  07fa 89            	pushw	x
3225  07fb 5f            	clrw	x
3226  07fc 89            	pushw	x
3227  07fd ae0000        	ldw	x,#L37
3228  0800 cd0000        	call	_assert_failed
3230  0803 5b04          	addw	sp,#4
3231  0805               L466:
3232                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3234  0805 7b02          	ld	a,(OFST+2,sp)
3235  0807 a180          	cp	a,#128
3236  0809 2711          	jreq	L476
3237  080b 4d            	tnz	a
3238  080c 270e          	jreq	L476
3239  080e ae02bc        	ldw	x,#700
3240  0811 89            	pushw	x
3241  0812 5f            	clrw	x
3242  0813 89            	pushw	x
3243  0814 ae0000        	ldw	x,#L37
3244  0817 cd0000        	call	_assert_failed
3246  081a 5b04          	addw	sp,#4
3247  081c               L476:
3248                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3250  081c 7b05          	ld	a,(OFST+5,sp)
3251  081e 88            	push	a
3252  081f 7b03          	ld	a,(OFST+3,sp)
3253  0821 97            	ld	xl,a
3254  0822 7b02          	ld	a,(OFST+2,sp)
3255  0824 95            	ld	xh,a
3256  0825 ad07          	call	_TIM1_ETRConfig
3258  0827 721c5253      	bset	21075,#6
3259                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
3261                     ; 707 }
3264  082b 5b03          	addw	sp,#3
3265  082d 81            	ret	
3320                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3320                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3320                     ; 727                     uint8_t ExtTRGFilter)
3320                     ; 728 {
3321                     	switch	.text
3322  082e               _TIM1_ETRConfig:
3324  082e 89            	pushw	x
3325       00000000      OFST:	set	0
3328                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
3330  082f 7b05          	ld	a,(OFST+5,sp)
3331  0831 a110          	cp	a,#16
3332  0833 250e          	jrult	L607
3333  0835 ae02da        	ldw	x,#730
3334  0838 89            	pushw	x
3335  0839 5f            	clrw	x
3336  083a 89            	pushw	x
3337  083b ae0000        	ldw	x,#L37
3338  083e cd0000        	call	_assert_failed
3340  0841 5b04          	addw	sp,#4
3341  0843               L607:
3342                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
3342                     ; 733                          (uint8_t)ExtTRGFilter );
3344  0843 7b01          	ld	a,(OFST+1,sp)
3345  0845 1a02          	or	a,(OFST+2,sp)
3346  0847 1a05          	or	a,(OFST+5,sp)
3347  0849 ca5253        	or	a,21075
3348  084c c75253        	ld	21075,a
3349                     ; 734 }
3352  084f 85            	popw	x
3353  0850 81            	ret	
3441                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
3441                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
3441                     ; 753                                  uint8_t ICFilter)
3441                     ; 754 {
3442                     	switch	.text
3443  0851               _TIM1_TIxExternalClockConfig:
3445  0851 89            	pushw	x
3446       00000000      OFST:	set	0
3449                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
3451  0852 9e            	ld	a,xh
3452  0853 a140          	cp	a,#64
3453  0855 2718          	jreq	L027
3454  0857 9e            	ld	a,xh
3455  0858 a160          	cp	a,#96
3456  085a 2713          	jreq	L027
3457  085c 9e            	ld	a,xh
3458  085d a150          	cp	a,#80
3459  085f 270e          	jreq	L027
3460  0861 ae02f4        	ldw	x,#756
3461  0864 89            	pushw	x
3462  0865 5f            	clrw	x
3463  0866 89            	pushw	x
3464  0867 ae0000        	ldw	x,#L37
3465  086a cd0000        	call	_assert_failed
3467  086d 5b04          	addw	sp,#4
3468  086f               L027:
3469                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
3471  086f 7b02          	ld	a,(OFST+2,sp)
3472  0871 2711          	jreq	L037
3473  0873 4a            	dec	a
3474  0874 270e          	jreq	L037
3475  0876 ae02f5        	ldw	x,#757
3476  0879 89            	pushw	x
3477  087a 5f            	clrw	x
3478  087b 89            	pushw	x
3479  087c ae0000        	ldw	x,#L37
3480  087f cd0000        	call	_assert_failed
3482  0882 5b04          	addw	sp,#4
3483  0884               L037:
3484                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
3486  0884 7b05          	ld	a,(OFST+5,sp)
3487  0886 a110          	cp	a,#16
3488  0888 250e          	jrult	L637
3489  088a ae02f6        	ldw	x,#758
3490  088d 89            	pushw	x
3491  088e 5f            	clrw	x
3492  088f 89            	pushw	x
3493  0890 ae0000        	ldw	x,#L37
3494  0893 cd0000        	call	_assert_failed
3496  0896 5b04          	addw	sp,#4
3497  0898               L637:
3498                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
3500  0898 7b01          	ld	a,(OFST+1,sp)
3501  089a a160          	cp	a,#96
3502  089c 260e          	jrne	L3521
3503                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3505  089e 7b05          	ld	a,(OFST+5,sp)
3506  08a0 88            	push	a
3507  08a1 7b03          	ld	a,(OFST+3,sp)
3508  08a3 ae0001        	ldw	x,#1
3509  08a6 95            	ld	xh,a
3510  08a7 cd1261        	call	L5_TI2_Config
3513  08aa 200c          	jra	L5521
3514  08ac               L3521:
3515                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3517  08ac 7b05          	ld	a,(OFST+5,sp)
3518  08ae 88            	push	a
3519  08af 7b03          	ld	a,(OFST+3,sp)
3520  08b1 ae0001        	ldw	x,#1
3521  08b4 95            	ld	xh,a
3522  08b5 cd1231        	call	L3_TI1_Config
3524  08b8               L5521:
3525  08b8 84            	pop	a
3526                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
3528  08b9 7b01          	ld	a,(OFST+1,sp)
3529  08bb ad0a          	call	_TIM1_SelectInputTrigger
3531                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
3533  08bd c65252        	ld	a,21074
3534  08c0 aa07          	or	a,#7
3535  08c2 c75252        	ld	21074,a
3536                     ; 775 }
3539  08c5 85            	popw	x
3540  08c6 81            	ret	
3626                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
3626                     ; 788 {
3627                     	switch	.text
3628  08c7               _TIM1_SelectInputTrigger:
3630  08c7 88            	push	a
3631       00000000      OFST:	set	0
3634                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
3636  08c8 a140          	cp	a,#64
3637  08ca 2721          	jreq	L657
3638  08cc a150          	cp	a,#80
3639  08ce 271d          	jreq	L657
3640  08d0 a160          	cp	a,#96
3641  08d2 2719          	jreq	L657
3642  08d4 a170          	cp	a,#112
3643  08d6 2715          	jreq	L657
3644  08d8 a130          	cp	a,#48
3645  08da 2711          	jreq	L657
3646  08dc 4d            	tnz	a
3647  08dd 270e          	jreq	L657
3648  08df ae0316        	ldw	x,#790
3649  08e2 89            	pushw	x
3650  08e3 5f            	clrw	x
3651  08e4 89            	pushw	x
3652  08e5 ae0000        	ldw	x,#L37
3653  08e8 cd0000        	call	_assert_failed
3655  08eb 5b04          	addw	sp,#4
3656  08ed               L657:
3657                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
3659  08ed c65252        	ld	a,21074
3660  08f0 a48f          	and	a,#143
3661  08f2 1a01          	or	a,(OFST+1,sp)
3662  08f4 c75252        	ld	21074,a
3663                     ; 794 }
3666  08f7 84            	pop	a
3667  08f8 81            	ret	
3704                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
3704                     ; 804 {
3705                     	switch	.text
3706  08f9               _TIM1_UpdateDisableConfig:
3708  08f9 88            	push	a
3709       00000000      OFST:	set	0
3712                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3714  08fa 4d            	tnz	a
3715  08fb 2711          	jreq	L077
3716  08fd 4a            	dec	a
3717  08fe 270e          	jreq	L077
3718  0900 ae0326        	ldw	x,#806
3719  0903 89            	pushw	x
3720  0904 5f            	clrw	x
3721  0905 89            	pushw	x
3722  0906 ae0000        	ldw	x,#L37
3723  0909 cd0000        	call	_assert_failed
3725  090c 5b04          	addw	sp,#4
3726  090e               L077:
3727                     ; 809   if (NewState != DISABLE)
3729  090e 7b01          	ld	a,(OFST+1,sp)
3730  0910 2706          	jreq	L3331
3731                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
3733  0912 72125250      	bset	21072,#1
3735  0916 2004          	jra	L5331
3736  0918               L3331:
3737                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
3739  0918 72135250      	bres	21072,#1
3740  091c               L5331:
3741                     ; 817 }
3744  091c 84            	pop	a
3745  091d 81            	ret	
3804                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
3804                     ; 828 {
3805                     	switch	.text
3806  091e               _TIM1_UpdateRequestConfig:
3808  091e 88            	push	a
3809       00000000      OFST:	set	0
3812                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
3814  091f 4d            	tnz	a
3815  0920 2711          	jreq	L2001
3816  0922 4a            	dec	a
3817  0923 270e          	jreq	L2001
3818  0925 ae033e        	ldw	x,#830
3819  0928 89            	pushw	x
3820  0929 5f            	clrw	x
3821  092a 89            	pushw	x
3822  092b ae0000        	ldw	x,#L37
3823  092e cd0000        	call	_assert_failed
3825  0931 5b04          	addw	sp,#4
3826  0933               L2001:
3827                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
3829  0933 7b01          	ld	a,(OFST+1,sp)
3830  0935 2706          	jreq	L5631
3831                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
3833  0937 72145250      	bset	21072,#2
3835  093b 2004          	jra	L7631
3836  093d               L5631:
3837                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3839  093d 72155250      	bres	21072,#2
3840  0941               L7631:
3841                     ; 841 }
3844  0941 84            	pop	a
3845  0942 81            	ret	
3882                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3882                     ; 850 {
3883                     	switch	.text
3884  0943               _TIM1_SelectHallSensor:
3886  0943 88            	push	a
3887       00000000      OFST:	set	0
3890                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3892  0944 4d            	tnz	a
3893  0945 2711          	jreq	L4101
3894  0947 4a            	dec	a
3895  0948 270e          	jreq	L4101
3896  094a ae0354        	ldw	x,#852
3897  094d 89            	pushw	x
3898  094e 5f            	clrw	x
3899  094f 89            	pushw	x
3900  0950 ae0000        	ldw	x,#L37
3901  0953 cd0000        	call	_assert_failed
3903  0956 5b04          	addw	sp,#4
3904  0958               L4101:
3905                     ; 855   if (NewState != DISABLE)
3907  0958 7b01          	ld	a,(OFST+1,sp)
3908  095a 2706          	jreq	L7041
3909                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3911  095c 721e5251      	bset	21073,#7
3913  0960 2004          	jra	L1141
3914  0962               L7041:
3915                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3917  0962 721f5251      	bres	21073,#7
3918  0966               L1141:
3919                     ; 863 }
3922  0966 84            	pop	a
3923  0967 81            	ret	
3981                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3981                     ; 874 {
3982                     	switch	.text
3983  0968               _TIM1_SelectOnePulseMode:
3985  0968 88            	push	a
3986       00000000      OFST:	set	0
3989                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3991  0969 a101          	cp	a,#1
3992  096b 2711          	jreq	L6201
3993  096d 4d            	tnz	a
3994  096e 270e          	jreq	L6201
3995  0970 ae036c        	ldw	x,#876
3996  0973 89            	pushw	x
3997  0974 5f            	clrw	x
3998  0975 89            	pushw	x
3999  0976 ae0000        	ldw	x,#L37
4000  0979 cd0000        	call	_assert_failed
4002  097c 5b04          	addw	sp,#4
4003  097e               L6201:
4004                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
4006  097e 7b01          	ld	a,(OFST+1,sp)
4007  0980 2706          	jreq	L1441
4008                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
4010  0982 72165250      	bset	21072,#3
4012  0986 2004          	jra	L3441
4013  0988               L1441:
4014                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
4016  0988 72175250      	bres	21072,#3
4017  098c               L3441:
4018                     ; 888 }
4021  098c 84            	pop	a
4022  098d 81            	ret	
4121                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
4121                     ; 904 {
4122                     	switch	.text
4123  098e               _TIM1_SelectOutputTrigger:
4125  098e 88            	push	a
4126       00000000      OFST:	set	0
4129                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
4131  098f 4d            	tnz	a
4132  0990 2726          	jreq	L0401
4133  0992 a110          	cp	a,#16
4134  0994 2722          	jreq	L0401
4135  0996 a120          	cp	a,#32
4136  0998 271e          	jreq	L0401
4137  099a a130          	cp	a,#48
4138  099c 271a          	jreq	L0401
4139  099e a140          	cp	a,#64
4140  09a0 2716          	jreq	L0401
4141  09a2 a150          	cp	a,#80
4142  09a4 2712          	jreq	L0401
4143  09a6 a160          	cp	a,#96
4144  09a8 270e          	jreq	L0401
4145  09aa ae038a        	ldw	x,#906
4146  09ad 89            	pushw	x
4147  09ae 5f            	clrw	x
4148  09af 89            	pushw	x
4149  09b0 ae0000        	ldw	x,#L37
4150  09b3 cd0000        	call	_assert_failed
4152  09b6 5b04          	addw	sp,#4
4153  09b8               L0401:
4154                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
4154                     ; 910                         (uint8_t) TIM1_TRGOSource);
4156  09b8 c65251        	ld	a,21073
4157  09bb a48f          	and	a,#143
4158  09bd 1a01          	or	a,(OFST+1,sp)
4159  09bf c75251        	ld	21073,a
4160                     ; 911 }
4163  09c2 84            	pop	a
4164  09c3 81            	ret	
4239                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
4239                     ; 924 {
4240                     	switch	.text
4241  09c4               _TIM1_SelectSlaveMode:
4243  09c4 88            	push	a
4244       00000000      OFST:	set	0
4247                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
4249  09c5 a104          	cp	a,#4
4250  09c7 271a          	jreq	L2501
4251  09c9 a105          	cp	a,#5
4252  09cb 2716          	jreq	L2501
4253  09cd a106          	cp	a,#6
4254  09cf 2712          	jreq	L2501
4255  09d1 a107          	cp	a,#7
4256  09d3 270e          	jreq	L2501
4257  09d5 ae039e        	ldw	x,#926
4258  09d8 89            	pushw	x
4259  09d9 5f            	clrw	x
4260  09da 89            	pushw	x
4261  09db ae0000        	ldw	x,#L37
4262  09de cd0000        	call	_assert_failed
4264  09e1 5b04          	addw	sp,#4
4265  09e3               L2501:
4266                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
4266                     ; 930                          (uint8_t)TIM1_SlaveMode);
4268  09e3 c65252        	ld	a,21074
4269  09e6 a4f8          	and	a,#248
4270  09e8 1a01          	or	a,(OFST+1,sp)
4271  09ea c75252        	ld	21074,a
4272                     ; 931 }
4275  09ed 84            	pop	a
4276  09ee 81            	ret	
4313                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
4313                     ; 940 {
4314                     	switch	.text
4315  09ef               _TIM1_SelectMasterSlaveMode:
4317  09ef 88            	push	a
4318       00000000      OFST:	set	0
4321                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4323  09f0 4d            	tnz	a
4324  09f1 2711          	jreq	L4601
4325  09f3 4a            	dec	a
4326  09f4 270e          	jreq	L4601
4327  09f6 ae03ae        	ldw	x,#942
4328  09f9 89            	pushw	x
4329  09fa 5f            	clrw	x
4330  09fb 89            	pushw	x
4331  09fc ae0000        	ldw	x,#L37
4332  09ff cd0000        	call	_assert_failed
4334  0a02 5b04          	addw	sp,#4
4335  0a04               L4601:
4336                     ; 945   if (NewState != DISABLE)
4338  0a04 7b01          	ld	a,(OFST+1,sp)
4339  0a06 2706          	jreq	L5551
4340                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
4342  0a08 721e5252      	bset	21074,#7
4344  0a0c 2004          	jra	L7551
4345  0a0e               L5551:
4346                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
4348  0a0e 721f5252      	bres	21074,#7
4349  0a12               L7551:
4350                     ; 953 }
4353  0a12 84            	pop	a
4354  0a13 81            	ret	
4441                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
4441                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
4441                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
4441                     ; 978 {
4442                     	switch	.text
4443  0a14               _TIM1_EncoderInterfaceConfig:
4445  0a14 89            	pushw	x
4446       00000000      OFST:	set	0
4449                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
4451  0a15 9e            	ld	a,xh
4452  0a16 4a            	dec	a
4453  0a17 2718          	jreq	L6701
4454  0a19 9e            	ld	a,xh
4455  0a1a a102          	cp	a,#2
4456  0a1c 2713          	jreq	L6701
4457  0a1e 9e            	ld	a,xh
4458  0a1f a103          	cp	a,#3
4459  0a21 270e          	jreq	L6701
4460  0a23 ae03d4        	ldw	x,#980
4461  0a26 89            	pushw	x
4462  0a27 5f            	clrw	x
4463  0a28 89            	pushw	x
4464  0a29 ae0000        	ldw	x,#L37
4465  0a2c cd0000        	call	_assert_failed
4467  0a2f 5b04          	addw	sp,#4
4468  0a31               L6701:
4469                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
4471  0a31 7b02          	ld	a,(OFST+2,sp)
4472  0a33 2711          	jreq	L6011
4473  0a35 4a            	dec	a
4474  0a36 270e          	jreq	L6011
4475  0a38 ae03d5        	ldw	x,#981
4476  0a3b 89            	pushw	x
4477  0a3c 5f            	clrw	x
4478  0a3d 89            	pushw	x
4479  0a3e ae0000        	ldw	x,#L37
4480  0a41 cd0000        	call	_assert_failed
4482  0a44 5b04          	addw	sp,#4
4483  0a46               L6011:
4484                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
4486  0a46 7b05          	ld	a,(OFST+5,sp)
4487  0a48 2711          	jreq	L6111
4488  0a4a 4a            	dec	a
4489  0a4b 270e          	jreq	L6111
4490  0a4d ae03d6        	ldw	x,#982
4491  0a50 89            	pushw	x
4492  0a51 5f            	clrw	x
4493  0a52 89            	pushw	x
4494  0a53 ae0000        	ldw	x,#L37
4495  0a56 cd0000        	call	_assert_failed
4497  0a59 5b04          	addw	sp,#4
4498  0a5b               L6111:
4499                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
4501  0a5b 7b02          	ld	a,(OFST+2,sp)
4502  0a5d 2706          	jreq	L1261
4503                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4505  0a5f 7212525c      	bset	21084,#1
4507  0a63 2004          	jra	L3261
4508  0a65               L1261:
4509                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4511  0a65 7213525c      	bres	21084,#1
4512  0a69               L3261:
4513                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
4515  0a69 7b05          	ld	a,(OFST+5,sp)
4516  0a6b 2706          	jreq	L5261
4517                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4519  0a6d 721a525c      	bset	21084,#5
4521  0a71 2004          	jra	L7261
4522  0a73               L5261:
4523                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4525  0a73 721b525c      	bres	21084,#5
4526  0a77               L7261:
4527                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
4527                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
4529  0a77 c65252        	ld	a,21074
4530  0a7a a4f0          	and	a,#240
4531  0a7c 1a01          	or	a,(OFST+1,sp)
4532  0a7e c75252        	ld	21074,a
4533                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
4533                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
4535  0a81 c65258        	ld	a,21080
4536  0a84 a4fc          	and	a,#252
4537  0a86 aa01          	or	a,#1
4538  0a88 c75258        	ld	21080,a
4539                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
4539                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
4541  0a8b c65259        	ld	a,21081
4542  0a8e a4fc          	and	a,#252
4543  0a90 aa01          	or	a,#1
4544  0a92 c75259        	ld	21081,a
4545                     ; 1011 }
4548  0a95 85            	popw	x
4549  0a96 81            	ret	
4615                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
4615                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
4615                     ; 1025 {
4616                     	switch	.text
4617  0a97               _TIM1_PrescalerConfig:
4619  0a97 89            	pushw	x
4620       00000000      OFST:	set	0
4623                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
4625  0a98 7b05          	ld	a,(OFST+5,sp)
4626  0a9a 2711          	jreq	L0311
4627  0a9c 4a            	dec	a
4628  0a9d 270e          	jreq	L0311
4629  0a9f ae0403        	ldw	x,#1027
4630  0aa2 89            	pushw	x
4631  0aa3 5f            	clrw	x
4632  0aa4 89            	pushw	x
4633  0aa5 ae0000        	ldw	x,#L37
4634  0aa8 cd0000        	call	_assert_failed
4636  0aab 5b04          	addw	sp,#4
4637  0aad               L0311:
4638                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
4640  0aad 7b01          	ld	a,(OFST+1,sp)
4641  0aaf c75260        	ld	21088,a
4642                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
4644  0ab2 7b02          	ld	a,(OFST+2,sp)
4645  0ab4 c75261        	ld	21089,a
4646                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
4648  0ab7 7b05          	ld	a,(OFST+5,sp)
4649  0ab9 c75257        	ld	21079,a
4650                     ; 1035 }
4653  0abc 85            	popw	x
4654  0abd 81            	ret	
4691                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
4691                     ; 1049 {
4692                     	switch	.text
4693  0abe               _TIM1_CounterModeConfig:
4695  0abe 88            	push	a
4696       00000000      OFST:	set	0
4699                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
4701  0abf 4d            	tnz	a
4702  0ac0 271e          	jreq	L2411
4703  0ac2 a110          	cp	a,#16
4704  0ac4 271a          	jreq	L2411
4705  0ac6 a120          	cp	a,#32
4706  0ac8 2716          	jreq	L2411
4707  0aca a140          	cp	a,#64
4708  0acc 2712          	jreq	L2411
4709  0ace a160          	cp	a,#96
4710  0ad0 270e          	jreq	L2411
4711  0ad2 ae041b        	ldw	x,#1051
4712  0ad5 89            	pushw	x
4713  0ad6 5f            	clrw	x
4714  0ad7 89            	pushw	x
4715  0ad8 ae0000        	ldw	x,#L37
4716  0adb cd0000        	call	_assert_failed
4718  0ade 5b04          	addw	sp,#4
4719  0ae0               L2411:
4720                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
4720                     ; 1056                         | (uint8_t)TIM1_CounterMode);
4722  0ae0 c65250        	ld	a,21072
4723  0ae3 a48f          	and	a,#143
4724  0ae5 1a01          	or	a,(OFST+1,sp)
4725  0ae7 c75250        	ld	21072,a
4726                     ; 1057 }
4729  0aea 84            	pop	a
4730  0aeb 81            	ret	
4789                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
4789                     ; 1068 {
4790                     	switch	.text
4791  0aec               _TIM1_ForcedOC1Config:
4793  0aec 88            	push	a
4794       00000000      OFST:	set	0
4797                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
4799  0aed a150          	cp	a,#80
4800  0aef 2712          	jreq	L4511
4801  0af1 a140          	cp	a,#64
4802  0af3 270e          	jreq	L4511
4803  0af5 ae042e        	ldw	x,#1070
4804  0af8 89            	pushw	x
4805  0af9 5f            	clrw	x
4806  0afa 89            	pushw	x
4807  0afb ae0000        	ldw	x,#L37
4808  0afe cd0000        	call	_assert_failed
4810  0b01 5b04          	addw	sp,#4
4811  0b03               L4511:
4812                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
4812                     ; 1074                            (uint8_t)TIM1_ForcedAction);
4814  0b03 c65258        	ld	a,21080
4815  0b06 a48f          	and	a,#143
4816  0b08 1a01          	or	a,(OFST+1,sp)
4817  0b0a c75258        	ld	21080,a
4818                     ; 1075 }
4821  0b0d 84            	pop	a
4822  0b0e 81            	ret	
4859                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
4859                     ; 1086 {
4860                     	switch	.text
4861  0b0f               _TIM1_ForcedOC2Config:
4863  0b0f 88            	push	a
4864       00000000      OFST:	set	0
4867                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
4869  0b10 a150          	cp	a,#80
4870  0b12 2712          	jreq	L6611
4871  0b14 a140          	cp	a,#64
4872  0b16 270e          	jreq	L6611
4873  0b18 ae0440        	ldw	x,#1088
4874  0b1b 89            	pushw	x
4875  0b1c 5f            	clrw	x
4876  0b1d 89            	pushw	x
4877  0b1e ae0000        	ldw	x,#L37
4878  0b21 cd0000        	call	_assert_failed
4880  0b24 5b04          	addw	sp,#4
4881  0b26               L6611:
4882                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
4882                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
4884  0b26 c65259        	ld	a,21081
4885  0b29 a48f          	and	a,#143
4886  0b2b 1a01          	or	a,(OFST+1,sp)
4887  0b2d c75259        	ld	21081,a
4888                     ; 1093 }
4891  0b30 84            	pop	a
4892  0b31 81            	ret	
4929                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
4929                     ; 1105 {
4930                     	switch	.text
4931  0b32               _TIM1_ForcedOC3Config:
4933  0b32 88            	push	a
4934       00000000      OFST:	set	0
4937                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
4939  0b33 a150          	cp	a,#80
4940  0b35 2712          	jreq	L0021
4941  0b37 a140          	cp	a,#64
4942  0b39 270e          	jreq	L0021
4943  0b3b ae0453        	ldw	x,#1107
4944  0b3e 89            	pushw	x
4945  0b3f 5f            	clrw	x
4946  0b40 89            	pushw	x
4947  0b41 ae0000        	ldw	x,#L37
4948  0b44 cd0000        	call	_assert_failed
4950  0b47 5b04          	addw	sp,#4
4951  0b49               L0021:
4952                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
4952                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
4954  0b49 c6525a        	ld	a,21082
4955  0b4c a48f          	and	a,#143
4956  0b4e 1a01          	or	a,(OFST+1,sp)
4957  0b50 c7525a        	ld	21082,a
4958                     ; 1112 }
4961  0b53 84            	pop	a
4962  0b54 81            	ret	
4999                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
4999                     ; 1124 {
5000                     	switch	.text
5001  0b55               _TIM1_ForcedOC4Config:
5003  0b55 88            	push	a
5004       00000000      OFST:	set	0
5007                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5009  0b56 a150          	cp	a,#80
5010  0b58 2712          	jreq	L2121
5011  0b5a a140          	cp	a,#64
5012  0b5c 270e          	jreq	L2121
5013  0b5e ae0466        	ldw	x,#1126
5014  0b61 89            	pushw	x
5015  0b62 5f            	clrw	x
5016  0b63 89            	pushw	x
5017  0b64 ae0000        	ldw	x,#L37
5018  0b67 cd0000        	call	_assert_failed
5020  0b6a 5b04          	addw	sp,#4
5021  0b6c               L2121:
5022                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5022                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
5024  0b6c c6525b        	ld	a,21083
5025  0b6f a48f          	and	a,#143
5026  0b71 1a01          	or	a,(OFST+1,sp)
5027  0b73 c7525b        	ld	21083,a
5028                     ; 1131 }
5031  0b76 84            	pop	a
5032  0b77 81            	ret	
5069                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
5069                     ; 1140 {
5070                     	switch	.text
5071  0b78               _TIM1_ARRPreloadConfig:
5073  0b78 88            	push	a
5074       00000000      OFST:	set	0
5077                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5079  0b79 4d            	tnz	a
5080  0b7a 2711          	jreq	L4221
5081  0b7c 4a            	dec	a
5082  0b7d 270e          	jreq	L4221
5083  0b7f ae0476        	ldw	x,#1142
5084  0b82 89            	pushw	x
5085  0b83 5f            	clrw	x
5086  0b84 89            	pushw	x
5087  0b85 ae0000        	ldw	x,#L37
5088  0b88 cd0000        	call	_assert_failed
5090  0b8b 5b04          	addw	sp,#4
5091  0b8d               L4221:
5092                     ; 1145   if (NewState != DISABLE)
5094  0b8d 7b01          	ld	a,(OFST+1,sp)
5095  0b8f 2706          	jreq	L5102
5096                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
5098  0b91 721e5250      	bset	21072,#7
5100  0b95 2004          	jra	L7102
5101  0b97               L5102:
5102                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
5104  0b97 721f5250      	bres	21072,#7
5105  0b9b               L7102:
5106                     ; 1153 }
5109  0b9b 84            	pop	a
5110  0b9c 81            	ret	
5146                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
5146                     ; 1162 {
5147                     	switch	.text
5148  0b9d               _TIM1_SelectCOM:
5150  0b9d 88            	push	a
5151       00000000      OFST:	set	0
5154                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5156  0b9e 4d            	tnz	a
5157  0b9f 2711          	jreq	L6321
5158  0ba1 4a            	dec	a
5159  0ba2 270e          	jreq	L6321
5160  0ba4 ae048c        	ldw	x,#1164
5161  0ba7 89            	pushw	x
5162  0ba8 5f            	clrw	x
5163  0ba9 89            	pushw	x
5164  0baa ae0000        	ldw	x,#L37
5165  0bad cd0000        	call	_assert_failed
5167  0bb0 5b04          	addw	sp,#4
5168  0bb2               L6321:
5169                     ; 1167   if (NewState != DISABLE)
5171  0bb2 7b01          	ld	a,(OFST+1,sp)
5172  0bb4 2706          	jreq	L7302
5173                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
5175  0bb6 72145251      	bset	21073,#2
5177  0bba 2004          	jra	L1402
5178  0bbc               L7302:
5179                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
5181  0bbc 72155251      	bres	21073,#2
5182  0bc0               L1402:
5183                     ; 1175 }
5186  0bc0 84            	pop	a
5187  0bc1 81            	ret	
5224                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
5224                     ; 1184 {
5225                     	switch	.text
5226  0bc2               _TIM1_CCPreloadControl:
5228  0bc2 88            	push	a
5229       00000000      OFST:	set	0
5232                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5234  0bc3 4d            	tnz	a
5235  0bc4 2711          	jreq	L0521
5236  0bc6 4a            	dec	a
5237  0bc7 270e          	jreq	L0521
5238  0bc9 ae04a2        	ldw	x,#1186
5239  0bcc 89            	pushw	x
5240  0bcd 5f            	clrw	x
5241  0bce 89            	pushw	x
5242  0bcf ae0000        	ldw	x,#L37
5243  0bd2 cd0000        	call	_assert_failed
5245  0bd5 5b04          	addw	sp,#4
5246  0bd7               L0521:
5247                     ; 1189   if (NewState != DISABLE)
5249  0bd7 7b01          	ld	a,(OFST+1,sp)
5250  0bd9 2706          	jreq	L1602
5251                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
5253  0bdb 72105251      	bset	21073,#0
5255  0bdf 2004          	jra	L3602
5256  0be1               L1602:
5257                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
5259  0be1 72115251      	bres	21073,#0
5260  0be5               L3602:
5261                     ; 1197 }
5264  0be5 84            	pop	a
5265  0be6 81            	ret	
5302                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
5302                     ; 1206 {
5303                     	switch	.text
5304  0be7               _TIM1_OC1PreloadConfig:
5306  0be7 88            	push	a
5307       00000000      OFST:	set	0
5310                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5312  0be8 4d            	tnz	a
5313  0be9 2711          	jreq	L2621
5314  0beb 4a            	dec	a
5315  0bec 270e          	jreq	L2621
5316  0bee ae04b8        	ldw	x,#1208
5317  0bf1 89            	pushw	x
5318  0bf2 5f            	clrw	x
5319  0bf3 89            	pushw	x
5320  0bf4 ae0000        	ldw	x,#L37
5321  0bf7 cd0000        	call	_assert_failed
5323  0bfa 5b04          	addw	sp,#4
5324  0bfc               L2621:
5325                     ; 1211   if (NewState != DISABLE)
5327  0bfc 7b01          	ld	a,(OFST+1,sp)
5328  0bfe 2706          	jreq	L3012
5329                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
5331  0c00 72165258      	bset	21080,#3
5333  0c04 2004          	jra	L5012
5334  0c06               L3012:
5335                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5337  0c06 72175258      	bres	21080,#3
5338  0c0a               L5012:
5339                     ; 1219 }
5342  0c0a 84            	pop	a
5343  0c0b 81            	ret	
5380                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
5380                     ; 1228 {
5381                     	switch	.text
5382  0c0c               _TIM1_OC2PreloadConfig:
5384  0c0c 88            	push	a
5385       00000000      OFST:	set	0
5388                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5390  0c0d 4d            	tnz	a
5391  0c0e 2711          	jreq	L4721
5392  0c10 4a            	dec	a
5393  0c11 270e          	jreq	L4721
5394  0c13 ae04ce        	ldw	x,#1230
5395  0c16 89            	pushw	x
5396  0c17 5f            	clrw	x
5397  0c18 89            	pushw	x
5398  0c19 ae0000        	ldw	x,#L37
5399  0c1c cd0000        	call	_assert_failed
5401  0c1f 5b04          	addw	sp,#4
5402  0c21               L4721:
5403                     ; 1233   if (NewState != DISABLE)
5405  0c21 7b01          	ld	a,(OFST+1,sp)
5406  0c23 2706          	jreq	L5212
5407                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
5409  0c25 72165259      	bset	21081,#3
5411  0c29 2004          	jra	L7212
5412  0c2b               L5212:
5413                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5415  0c2b 72175259      	bres	21081,#3
5416  0c2f               L7212:
5417                     ; 1241 }
5420  0c2f 84            	pop	a
5421  0c30 81            	ret	
5458                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
5458                     ; 1250 {
5459                     	switch	.text
5460  0c31               _TIM1_OC3PreloadConfig:
5462  0c31 88            	push	a
5463       00000000      OFST:	set	0
5466                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5468  0c32 4d            	tnz	a
5469  0c33 2711          	jreq	L6031
5470  0c35 4a            	dec	a
5471  0c36 270e          	jreq	L6031
5472  0c38 ae04e4        	ldw	x,#1252
5473  0c3b 89            	pushw	x
5474  0c3c 5f            	clrw	x
5475  0c3d 89            	pushw	x
5476  0c3e ae0000        	ldw	x,#L37
5477  0c41 cd0000        	call	_assert_failed
5479  0c44 5b04          	addw	sp,#4
5480  0c46               L6031:
5481                     ; 1255   if (NewState != DISABLE)
5483  0c46 7b01          	ld	a,(OFST+1,sp)
5484  0c48 2706          	jreq	L7412
5485                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
5487  0c4a 7216525a      	bset	21082,#3
5489  0c4e 2004          	jra	L1512
5490  0c50               L7412:
5491                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5493  0c50 7217525a      	bres	21082,#3
5494  0c54               L1512:
5495                     ; 1263 }
5498  0c54 84            	pop	a
5499  0c55 81            	ret	
5536                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
5536                     ; 1272 {
5537                     	switch	.text
5538  0c56               _TIM1_OC4PreloadConfig:
5540  0c56 88            	push	a
5541       00000000      OFST:	set	0
5544                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5546  0c57 4d            	tnz	a
5547  0c58 2711          	jreq	L0231
5548  0c5a 4a            	dec	a
5549  0c5b 270e          	jreq	L0231
5550  0c5d ae04fa        	ldw	x,#1274
5551  0c60 89            	pushw	x
5552  0c61 5f            	clrw	x
5553  0c62 89            	pushw	x
5554  0c63 ae0000        	ldw	x,#L37
5555  0c66 cd0000        	call	_assert_failed
5557  0c69 5b04          	addw	sp,#4
5558  0c6b               L0231:
5559                     ; 1277   if (NewState != DISABLE)
5561  0c6b 7b01          	ld	a,(OFST+1,sp)
5562  0c6d 2706          	jreq	L1712
5563                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
5565  0c6f 7216525b      	bset	21083,#3
5567  0c73 2004          	jra	L3712
5568  0c75               L1712:
5569                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5571  0c75 7217525b      	bres	21083,#3
5572  0c79               L3712:
5573                     ; 1285 }
5576  0c79 84            	pop	a
5577  0c7a 81            	ret	
5613                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
5613                     ; 1294 {
5614                     	switch	.text
5615  0c7b               _TIM1_OC1FastConfig:
5617  0c7b 88            	push	a
5618       00000000      OFST:	set	0
5621                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5623  0c7c 4d            	tnz	a
5624  0c7d 2711          	jreq	L2331
5625  0c7f 4a            	dec	a
5626  0c80 270e          	jreq	L2331
5627  0c82 ae0510        	ldw	x,#1296
5628  0c85 89            	pushw	x
5629  0c86 5f            	clrw	x
5630  0c87 89            	pushw	x
5631  0c88 ae0000        	ldw	x,#L37
5632  0c8b cd0000        	call	_assert_failed
5634  0c8e 5b04          	addw	sp,#4
5635  0c90               L2331:
5636                     ; 1299   if (NewState != DISABLE)
5638  0c90 7b01          	ld	a,(OFST+1,sp)
5639  0c92 2706          	jreq	L3122
5640                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
5642  0c94 72145258      	bset	21080,#2
5644  0c98 2004          	jra	L5122
5645  0c9a               L3122:
5646                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
5648  0c9a 72155258      	bres	21080,#2
5649  0c9e               L5122:
5650                     ; 1307 }
5653  0c9e 84            	pop	a
5654  0c9f 81            	ret	
5690                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
5690                     ; 1316 {
5691                     	switch	.text
5692  0ca0               _TIM1_OC2FastConfig:
5694  0ca0 88            	push	a
5695       00000000      OFST:	set	0
5698                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5700  0ca1 4d            	tnz	a
5701  0ca2 2711          	jreq	L4431
5702  0ca4 4a            	dec	a
5703  0ca5 270e          	jreq	L4431
5704  0ca7 ae0526        	ldw	x,#1318
5705  0caa 89            	pushw	x
5706  0cab 5f            	clrw	x
5707  0cac 89            	pushw	x
5708  0cad ae0000        	ldw	x,#L37
5709  0cb0 cd0000        	call	_assert_failed
5711  0cb3 5b04          	addw	sp,#4
5712  0cb5               L4431:
5713                     ; 1321   if (NewState != DISABLE)
5715  0cb5 7b01          	ld	a,(OFST+1,sp)
5716  0cb7 2706          	jreq	L5322
5717                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
5719  0cb9 72145259      	bset	21081,#2
5721  0cbd 2004          	jra	L7322
5722  0cbf               L5322:
5723                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
5725  0cbf 72155259      	bres	21081,#2
5726  0cc3               L7322:
5727                     ; 1329 }
5730  0cc3 84            	pop	a
5731  0cc4 81            	ret	
5767                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
5767                     ; 1338 {
5768                     	switch	.text
5769  0cc5               _TIM1_OC3FastConfig:
5771  0cc5 88            	push	a
5772       00000000      OFST:	set	0
5775                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5777  0cc6 4d            	tnz	a
5778  0cc7 2711          	jreq	L6531
5779  0cc9 4a            	dec	a
5780  0cca 270e          	jreq	L6531
5781  0ccc ae053c        	ldw	x,#1340
5782  0ccf 89            	pushw	x
5783  0cd0 5f            	clrw	x
5784  0cd1 89            	pushw	x
5785  0cd2 ae0000        	ldw	x,#L37
5786  0cd5 cd0000        	call	_assert_failed
5788  0cd8 5b04          	addw	sp,#4
5789  0cda               L6531:
5790                     ; 1343   if (NewState != DISABLE)
5792  0cda 7b01          	ld	a,(OFST+1,sp)
5793  0cdc 2706          	jreq	L7522
5794                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
5796  0cde 7214525a      	bset	21082,#2
5798  0ce2 2004          	jra	L1622
5799  0ce4               L7522:
5800                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
5802  0ce4 7215525a      	bres	21082,#2
5803  0ce8               L1622:
5804                     ; 1351 }
5807  0ce8 84            	pop	a
5808  0ce9 81            	ret	
5844                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
5844                     ; 1360 {
5845                     	switch	.text
5846  0cea               _TIM1_OC4FastConfig:
5848  0cea 88            	push	a
5849       00000000      OFST:	set	0
5852                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5854  0ceb 4d            	tnz	a
5855  0cec 2711          	jreq	L0731
5856  0cee 4a            	dec	a
5857  0cef 270e          	jreq	L0731
5858  0cf1 ae0552        	ldw	x,#1362
5859  0cf4 89            	pushw	x
5860  0cf5 5f            	clrw	x
5861  0cf6 89            	pushw	x
5862  0cf7 ae0000        	ldw	x,#L37
5863  0cfa cd0000        	call	_assert_failed
5865  0cfd 5b04          	addw	sp,#4
5866  0cff               L0731:
5867                     ; 1365   if (NewState != DISABLE)
5869  0cff 7b01          	ld	a,(OFST+1,sp)
5870  0d01 2706          	jreq	L1032
5871                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
5873  0d03 7214525b      	bset	21083,#2
5875  0d07 2004          	jra	L3032
5876  0d09               L1032:
5877                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
5879  0d09 7215525b      	bres	21083,#2
5880  0d0d               L3032:
5881                     ; 1373 }
5884  0d0d 84            	pop	a
5885  0d0e 81            	ret	
5991                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5991                     ; 1390 {
5992                     	switch	.text
5993  0d0f               _TIM1_GenerateEvent:
5995  0d0f 88            	push	a
5996       00000000      OFST:	set	0
5999                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
6001  0d10 4d            	tnz	a
6002  0d11 260e          	jrne	L0041
6003  0d13 ae0570        	ldw	x,#1392
6004  0d16 89            	pushw	x
6005  0d17 5f            	clrw	x
6006  0d18 89            	pushw	x
6007  0d19 ae0000        	ldw	x,#L37
6008  0d1c cd0000        	call	_assert_failed
6010  0d1f 5b04          	addw	sp,#4
6011  0d21               L0041:
6012                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
6014  0d21 7b01          	ld	a,(OFST+1,sp)
6015  0d23 c75257        	ld	21079,a
6016                     ; 1396 }
6019  0d26 84            	pop	a
6020  0d27 81            	ret	
6057                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6057                     ; 1407 {
6058                     	switch	.text
6059  0d28               _TIM1_OC1PolarityConfig:
6061  0d28 88            	push	a
6062       00000000      OFST:	set	0
6065                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6067  0d29 4d            	tnz	a
6068  0d2a 2712          	jreq	L2141
6069  0d2c a122          	cp	a,#34
6070  0d2e 270e          	jreq	L2141
6071  0d30 ae0581        	ldw	x,#1409
6072  0d33 89            	pushw	x
6073  0d34 5f            	clrw	x
6074  0d35 89            	pushw	x
6075  0d36 ae0000        	ldw	x,#L37
6076  0d39 cd0000        	call	_assert_failed
6078  0d3c 5b04          	addw	sp,#4
6079  0d3e               L2141:
6080                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6082  0d3e 7b01          	ld	a,(OFST+1,sp)
6083  0d40 2706          	jreq	L5632
6084                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
6086  0d42 7212525c      	bset	21084,#1
6088  0d46 2004          	jra	L7632
6089  0d48               L5632:
6090                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
6092  0d48 7213525c      	bres	21084,#1
6093  0d4c               L7632:
6094                     ; 1420 }
6097  0d4c 84            	pop	a
6098  0d4d 81            	ret	
6135                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6135                     ; 1431 {
6136                     	switch	.text
6137  0d4e               _TIM1_OC1NPolarityConfig:
6139  0d4e 88            	push	a
6140       00000000      OFST:	set	0
6143                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6145  0d4f 4d            	tnz	a
6146  0d50 2712          	jreq	L4241
6147  0d52 a188          	cp	a,#136
6148  0d54 270e          	jreq	L4241
6149  0d56 ae0599        	ldw	x,#1433
6150  0d59 89            	pushw	x
6151  0d5a 5f            	clrw	x
6152  0d5b 89            	pushw	x
6153  0d5c ae0000        	ldw	x,#L37
6154  0d5f cd0000        	call	_assert_failed
6156  0d62 5b04          	addw	sp,#4
6157  0d64               L4241:
6158                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6160  0d64 7b01          	ld	a,(OFST+1,sp)
6161  0d66 2706          	jreq	L7042
6162                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
6164  0d68 7216525c      	bset	21084,#3
6166  0d6c 2004          	jra	L1142
6167  0d6e               L7042:
6168                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
6170  0d6e 7217525c      	bres	21084,#3
6171  0d72               L1142:
6172                     ; 1444 }
6175  0d72 84            	pop	a
6176  0d73 81            	ret	
6213                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6213                     ; 1455 {
6214                     	switch	.text
6215  0d74               _TIM1_OC2PolarityConfig:
6217  0d74 88            	push	a
6218       00000000      OFST:	set	0
6221                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6223  0d75 4d            	tnz	a
6224  0d76 2712          	jreq	L6341
6225  0d78 a122          	cp	a,#34
6226  0d7a 270e          	jreq	L6341
6227  0d7c ae05b1        	ldw	x,#1457
6228  0d7f 89            	pushw	x
6229  0d80 5f            	clrw	x
6230  0d81 89            	pushw	x
6231  0d82 ae0000        	ldw	x,#L37
6232  0d85 cd0000        	call	_assert_failed
6234  0d88 5b04          	addw	sp,#4
6235  0d8a               L6341:
6236                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6238  0d8a 7b01          	ld	a,(OFST+1,sp)
6239  0d8c 2706          	jreq	L1342
6240                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
6242  0d8e 721a525c      	bset	21084,#5
6244  0d92 2004          	jra	L3342
6245  0d94               L1342:
6246                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
6248  0d94 721b525c      	bres	21084,#5
6249  0d98               L3342:
6250                     ; 1468 }
6253  0d98 84            	pop	a
6254  0d99 81            	ret	
6291                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6291                     ; 1479 {
6292                     	switch	.text
6293  0d9a               _TIM1_OC2NPolarityConfig:
6295  0d9a 88            	push	a
6296       00000000      OFST:	set	0
6299                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6301  0d9b 4d            	tnz	a
6302  0d9c 2712          	jreq	L0541
6303  0d9e a188          	cp	a,#136
6304  0da0 270e          	jreq	L0541
6305  0da2 ae05c9        	ldw	x,#1481
6306  0da5 89            	pushw	x
6307  0da6 5f            	clrw	x
6308  0da7 89            	pushw	x
6309  0da8 ae0000        	ldw	x,#L37
6310  0dab cd0000        	call	_assert_failed
6312  0dae 5b04          	addw	sp,#4
6313  0db0               L0541:
6314                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6316  0db0 7b01          	ld	a,(OFST+1,sp)
6317  0db2 2706          	jreq	L3542
6318                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
6320  0db4 721e525c      	bset	21084,#7
6322  0db8 2004          	jra	L5542
6323  0dba               L3542:
6324                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
6326  0dba 721f525c      	bres	21084,#7
6327  0dbe               L5542:
6328                     ; 1492 }
6331  0dbe 84            	pop	a
6332  0dbf 81            	ret	
6369                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6369                     ; 1503 {
6370                     	switch	.text
6371  0dc0               _TIM1_OC3PolarityConfig:
6373  0dc0 88            	push	a
6374       00000000      OFST:	set	0
6377                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6379  0dc1 4d            	tnz	a
6380  0dc2 2712          	jreq	L2641
6381  0dc4 a122          	cp	a,#34
6382  0dc6 270e          	jreq	L2641
6383  0dc8 ae05e1        	ldw	x,#1505
6384  0dcb 89            	pushw	x
6385  0dcc 5f            	clrw	x
6386  0dcd 89            	pushw	x
6387  0dce ae0000        	ldw	x,#L37
6388  0dd1 cd0000        	call	_assert_failed
6390  0dd4 5b04          	addw	sp,#4
6391  0dd6               L2641:
6392                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6394  0dd6 7b01          	ld	a,(OFST+1,sp)
6395  0dd8 2706          	jreq	L5742
6396                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
6398  0dda 7212525d      	bset	21085,#1
6400  0dde 2004          	jra	L7742
6401  0de0               L5742:
6402                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
6404  0de0 7213525d      	bres	21085,#1
6405  0de4               L7742:
6406                     ; 1516 }
6409  0de4 84            	pop	a
6410  0de5 81            	ret	
6447                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6447                     ; 1528 {
6448                     	switch	.text
6449  0de6               _TIM1_OC3NPolarityConfig:
6451  0de6 88            	push	a
6452       00000000      OFST:	set	0
6455                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6457  0de7 4d            	tnz	a
6458  0de8 2712          	jreq	L4741
6459  0dea a188          	cp	a,#136
6460  0dec 270e          	jreq	L4741
6461  0dee ae05fa        	ldw	x,#1530
6462  0df1 89            	pushw	x
6463  0df2 5f            	clrw	x
6464  0df3 89            	pushw	x
6465  0df4 ae0000        	ldw	x,#L37
6466  0df7 cd0000        	call	_assert_failed
6468  0dfa 5b04          	addw	sp,#4
6469  0dfc               L4741:
6470                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6472  0dfc 7b01          	ld	a,(OFST+1,sp)
6473  0dfe 2706          	jreq	L7152
6474                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
6476  0e00 7216525d      	bset	21085,#3
6478  0e04 2004          	jra	L1252
6479  0e06               L7152:
6480                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
6482  0e06 7217525d      	bres	21085,#3
6483  0e0a               L1252:
6484                     ; 1541 }
6487  0e0a 84            	pop	a
6488  0e0b 81            	ret	
6525                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6525                     ; 1552 {
6526                     	switch	.text
6527  0e0c               _TIM1_OC4PolarityConfig:
6529  0e0c 88            	push	a
6530       00000000      OFST:	set	0
6533                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6535  0e0d 4d            	tnz	a
6536  0e0e 2712          	jreq	L6051
6537  0e10 a122          	cp	a,#34
6538  0e12 270e          	jreq	L6051
6539  0e14 ae0612        	ldw	x,#1554
6540  0e17 89            	pushw	x
6541  0e18 5f            	clrw	x
6542  0e19 89            	pushw	x
6543  0e1a ae0000        	ldw	x,#L37
6544  0e1d cd0000        	call	_assert_failed
6546  0e20 5b04          	addw	sp,#4
6547  0e22               L6051:
6548                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6550  0e22 7b01          	ld	a,(OFST+1,sp)
6551  0e24 2706          	jreq	L1452
6552                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
6554  0e26 721a525d      	bset	21085,#5
6556  0e2a 2004          	jra	L3452
6557  0e2c               L1452:
6558                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
6560  0e2c 721b525d      	bres	21085,#5
6561  0e30               L3452:
6562                     ; 1565 }
6565  0e30 84            	pop	a
6566  0e31 81            	ret	
6612                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
6612                     ; 1580 {
6613                     	switch	.text
6614  0e32               _TIM1_CCxCmd:
6616  0e32 89            	pushw	x
6617       00000000      OFST:	set	0
6620                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
6622  0e33 9e            	ld	a,xh
6623  0e34 4d            	tnz	a
6624  0e35 271c          	jreq	L0251
6625  0e37 9e            	ld	a,xh
6626  0e38 4a            	dec	a
6627  0e39 2718          	jreq	L0251
6628  0e3b 9e            	ld	a,xh
6629  0e3c a102          	cp	a,#2
6630  0e3e 2713          	jreq	L0251
6631  0e40 9e            	ld	a,xh
6632  0e41 a103          	cp	a,#3
6633  0e43 270e          	jreq	L0251
6634  0e45 ae062e        	ldw	x,#1582
6635  0e48 89            	pushw	x
6636  0e49 5f            	clrw	x
6637  0e4a 89            	pushw	x
6638  0e4b ae0000        	ldw	x,#L37
6639  0e4e cd0000        	call	_assert_failed
6641  0e51 5b04          	addw	sp,#4
6642  0e53               L0251:
6643                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6645  0e53 7b02          	ld	a,(OFST+2,sp)
6646  0e55 2711          	jreq	L0351
6647  0e57 4a            	dec	a
6648  0e58 270e          	jreq	L0351
6649  0e5a ae062f        	ldw	x,#1583
6650  0e5d 89            	pushw	x
6651  0e5e 5f            	clrw	x
6652  0e5f 89            	pushw	x
6653  0e60 ae0000        	ldw	x,#L37
6654  0e63 cd0000        	call	_assert_failed
6656  0e66 5b04          	addw	sp,#4
6657  0e68               L0351:
6658                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
6660  0e68 7b01          	ld	a,(OFST+1,sp)
6661  0e6a 2610          	jrne	L7652
6662                     ; 1588     if (NewState != DISABLE)
6664  0e6c 7b02          	ld	a,(OFST+2,sp)
6665  0e6e 2706          	jreq	L1752
6666                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
6668  0e70 7210525c      	bset	21084,#0
6670  0e74 203c          	jra	L5752
6671  0e76               L1752:
6672                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
6674  0e76 7211525c      	bres	21084,#0
6675  0e7a 2036          	jra	L5752
6676  0e7c               L7652:
6677                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
6679  0e7c a101          	cp	a,#1
6680  0e7e 2610          	jrne	L7752
6681                     ; 1601     if (NewState != DISABLE)
6683  0e80 7b02          	ld	a,(OFST+2,sp)
6684  0e82 2706          	jreq	L1062
6685                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
6687  0e84 7218525c      	bset	21084,#4
6689  0e88 2028          	jra	L5752
6690  0e8a               L1062:
6691                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
6693  0e8a 7219525c      	bres	21084,#4
6694  0e8e 2022          	jra	L5752
6695  0e90               L7752:
6696                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
6698  0e90 a102          	cp	a,#2
6699  0e92 2610          	jrne	L7062
6700                     ; 1613     if (NewState != DISABLE)
6702  0e94 7b02          	ld	a,(OFST+2,sp)
6703  0e96 2706          	jreq	L1162
6704                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
6706  0e98 7210525d      	bset	21085,#0
6708  0e9c 2014          	jra	L5752
6709  0e9e               L1162:
6710                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
6712  0e9e 7211525d      	bres	21085,#0
6713  0ea2 200e          	jra	L5752
6714  0ea4               L7062:
6715                     ; 1625     if (NewState != DISABLE)
6717  0ea4 7b02          	ld	a,(OFST+2,sp)
6718  0ea6 2706          	jreq	L7162
6719                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
6721  0ea8 7218525d      	bset	21085,#4
6723  0eac 2004          	jra	L5752
6724  0eae               L7162:
6725                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
6727  0eae 7219525d      	bres	21085,#4
6728  0eb2               L5752:
6729                     ; 1634 }
6732  0eb2 85            	popw	x
6733  0eb3 81            	ret	
6779                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
6779                     ; 1648 {
6780                     	switch	.text
6781  0eb4               _TIM1_CCxNCmd:
6783  0eb4 89            	pushw	x
6784       00000000      OFST:	set	0
6787                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
6789  0eb5 9e            	ld	a,xh
6790  0eb6 4d            	tnz	a
6791  0eb7 2717          	jreq	L2451
6792  0eb9 9e            	ld	a,xh
6793  0eba 4a            	dec	a
6794  0ebb 2713          	jreq	L2451
6795  0ebd 9e            	ld	a,xh
6796  0ebe a102          	cp	a,#2
6797  0ec0 270e          	jreq	L2451
6798  0ec2 ae0672        	ldw	x,#1650
6799  0ec5 89            	pushw	x
6800  0ec6 5f            	clrw	x
6801  0ec7 89            	pushw	x
6802  0ec8 ae0000        	ldw	x,#L37
6803  0ecb cd0000        	call	_assert_failed
6805  0ece 5b04          	addw	sp,#4
6806  0ed0               L2451:
6807                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6809  0ed0 7b02          	ld	a,(OFST+2,sp)
6810  0ed2 2711          	jreq	L2551
6811  0ed4 4a            	dec	a
6812  0ed5 270e          	jreq	L2551
6813  0ed7 ae0673        	ldw	x,#1651
6814  0eda 89            	pushw	x
6815  0edb 5f            	clrw	x
6816  0edc 89            	pushw	x
6817  0edd ae0000        	ldw	x,#L37
6818  0ee0 cd0000        	call	_assert_failed
6820  0ee3 5b04          	addw	sp,#4
6821  0ee5               L2551:
6822                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
6824  0ee5 7b01          	ld	a,(OFST+1,sp)
6825  0ee7 2610          	jrne	L5462
6826                     ; 1656     if (NewState != DISABLE)
6828  0ee9 7b02          	ld	a,(OFST+2,sp)
6829  0eeb 2706          	jreq	L7462
6830                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
6832  0eed 7214525c      	bset	21084,#2
6834  0ef1 2027          	jra	L3562
6835  0ef3               L7462:
6836                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
6838  0ef3 7215525c      	bres	21084,#2
6839  0ef7 2021          	jra	L3562
6840  0ef9               L5462:
6841                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
6843  0ef9 4a            	dec	a
6844  0efa 2610          	jrne	L5562
6845                     ; 1668     if (NewState != DISABLE)
6847  0efc 7b02          	ld	a,(OFST+2,sp)
6848  0efe 2706          	jreq	L7562
6849                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
6851  0f00 721c525c      	bset	21084,#6
6853  0f04 2014          	jra	L3562
6854  0f06               L7562:
6855                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
6857  0f06 721d525c      	bres	21084,#6
6858  0f0a 200e          	jra	L3562
6859  0f0c               L5562:
6860                     ; 1680     if (NewState != DISABLE)
6862  0f0c 7b02          	ld	a,(OFST+2,sp)
6863  0f0e 2706          	jreq	L5662
6864                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
6866  0f10 7214525d      	bset	21085,#2
6868  0f14 2004          	jra	L3562
6869  0f16               L5662:
6870                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
6872  0f16 7215525d      	bres	21085,#2
6873  0f1a               L3562:
6874                     ; 1689 }
6877  0f1a 85            	popw	x
6878  0f1b 81            	ret	
6924                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
6924                     ; 1713 {
6925                     	switch	.text
6926  0f1c               _TIM1_SelectOCxM:
6928  0f1c 89            	pushw	x
6929       00000000      OFST:	set	0
6932                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
6934  0f1d 9e            	ld	a,xh
6935  0f1e 4d            	tnz	a
6936  0f1f 271c          	jreq	L4651
6937  0f21 9e            	ld	a,xh
6938  0f22 4a            	dec	a
6939  0f23 2718          	jreq	L4651
6940  0f25 9e            	ld	a,xh
6941  0f26 a102          	cp	a,#2
6942  0f28 2713          	jreq	L4651
6943  0f2a 9e            	ld	a,xh
6944  0f2b a103          	cp	a,#3
6945  0f2d 270e          	jreq	L4651
6946  0f2f ae06b3        	ldw	x,#1715
6947  0f32 89            	pushw	x
6948  0f33 5f            	clrw	x
6949  0f34 89            	pushw	x
6950  0f35 ae0000        	ldw	x,#L37
6951  0f38 cd0000        	call	_assert_failed
6953  0f3b 5b04          	addw	sp,#4
6954  0f3d               L4651:
6955                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
6957  0f3d 7b02          	ld	a,(OFST+2,sp)
6958  0f3f 272a          	jreq	L4751
6959  0f41 a110          	cp	a,#16
6960  0f43 2726          	jreq	L4751
6961  0f45 a120          	cp	a,#32
6962  0f47 2722          	jreq	L4751
6963  0f49 a130          	cp	a,#48
6964  0f4b 271e          	jreq	L4751
6965  0f4d a160          	cp	a,#96
6966  0f4f 271a          	jreq	L4751
6967  0f51 a170          	cp	a,#112
6968  0f53 2716          	jreq	L4751
6969  0f55 a150          	cp	a,#80
6970  0f57 2712          	jreq	L4751
6971  0f59 a140          	cp	a,#64
6972  0f5b 270e          	jreq	L4751
6973  0f5d ae06b4        	ldw	x,#1716
6974  0f60 89            	pushw	x
6975  0f61 5f            	clrw	x
6976  0f62 89            	pushw	x
6977  0f63 ae0000        	ldw	x,#L37
6978  0f66 cd0000        	call	_assert_failed
6980  0f69 5b04          	addw	sp,#4
6981  0f6b               L4751:
6982                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
6984  0f6b 7b01          	ld	a,(OFST+1,sp)
6985  0f6d 2610          	jrne	L3172
6986                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
6988  0f6f 7211525c      	bres	21084,#0
6989                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
6989                     ; 1725                             | (uint8_t)TIM1_OCMode);
6991  0f73 c65258        	ld	a,21080
6992  0f76 a48f          	and	a,#143
6993  0f78 1a02          	or	a,(OFST+2,sp)
6994  0f7a c75258        	ld	21080,a
6996  0f7d 2036          	jra	L5172
6997  0f7f               L3172:
6998                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
7000  0f7f a101          	cp	a,#1
7001  0f81 2610          	jrne	L7172
7002                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7004  0f83 7219525c      	bres	21084,#4
7005                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
7005                     ; 1734                             | (uint8_t)TIM1_OCMode);
7007  0f87 c65259        	ld	a,21081
7008  0f8a a48f          	and	a,#143
7009  0f8c 1a02          	or	a,(OFST+2,sp)
7010  0f8e c75259        	ld	21081,a
7012  0f91 2022          	jra	L5172
7013  0f93               L7172:
7014                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
7016  0f93 a102          	cp	a,#2
7017  0f95 2610          	jrne	L3272
7018                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7020  0f97 7211525d      	bres	21085,#0
7021                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
7021                     ; 1743                             | (uint8_t)TIM1_OCMode);
7023  0f9b c6525a        	ld	a,21082
7024  0f9e a48f          	and	a,#143
7025  0fa0 1a02          	or	a,(OFST+2,sp)
7026  0fa2 c7525a        	ld	21082,a
7028  0fa5 200e          	jra	L5172
7029  0fa7               L3272:
7030                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7032  0fa7 7219525d      	bres	21085,#4
7033                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
7033                     ; 1752                             | (uint8_t)TIM1_OCMode);
7035  0fab c6525b        	ld	a,21083
7036  0fae a48f          	and	a,#143
7037  0fb0 1a02          	or	a,(OFST+2,sp)
7038  0fb2 c7525b        	ld	21083,a
7039  0fb5               L5172:
7040                     ; 1754 }
7043  0fb5 85            	popw	x
7044  0fb6 81            	ret	
7076                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
7076                     ; 1763 {
7077                     	switch	.text
7078  0fb7               _TIM1_SetCounter:
7082                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
7084  0fb7 9e            	ld	a,xh
7085  0fb8 c7525e        	ld	21086,a
7086                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
7088  0fbb 9f            	ld	a,xl
7089  0fbc c7525f        	ld	21087,a
7090                     ; 1767 }
7093  0fbf 81            	ret	
7125                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
7125                     ; 1776 {
7126                     	switch	.text
7127  0fc0               _TIM1_SetAutoreload:
7131                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
7133  0fc0 9e            	ld	a,xh
7134  0fc1 c75262        	ld	21090,a
7135                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
7137  0fc4 9f            	ld	a,xl
7138  0fc5 c75263        	ld	21091,a
7139                     ; 1780  }
7142  0fc8 81            	ret	
7174                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
7174                     ; 1789 {
7175                     	switch	.text
7176  0fc9               _TIM1_SetCompare1:
7180                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
7182  0fc9 9e            	ld	a,xh
7183  0fca c75265        	ld	21093,a
7184                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
7186  0fcd 9f            	ld	a,xl
7187  0fce c75266        	ld	21094,a
7188                     ; 1793 }
7191  0fd1 81            	ret	
7223                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
7223                     ; 1802 {
7224                     	switch	.text
7225  0fd2               _TIM1_SetCompare2:
7229                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
7231  0fd2 9e            	ld	a,xh
7232  0fd3 c75267        	ld	21095,a
7233                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
7235  0fd6 9f            	ld	a,xl
7236  0fd7 c75268        	ld	21096,a
7237                     ; 1806 }
7240  0fda 81            	ret	
7272                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
7272                     ; 1815 {
7273                     	switch	.text
7274  0fdb               _TIM1_SetCompare3:
7278                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
7280  0fdb 9e            	ld	a,xh
7281  0fdc c75269        	ld	21097,a
7282                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
7284  0fdf 9f            	ld	a,xl
7285  0fe0 c7526a        	ld	21098,a
7286                     ; 1819 }
7289  0fe3 81            	ret	
7321                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
7321                     ; 1828 {
7322                     	switch	.text
7323  0fe4               _TIM1_SetCompare4:
7327                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
7329  0fe4 9e            	ld	a,xh
7330  0fe5 c7526b        	ld	21099,a
7331                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
7333  0fe8 9f            	ld	a,xl
7334  0fe9 c7526c        	ld	21100,a
7335                     ; 1832 }
7338  0fec 81            	ret	
7375                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
7375                     ; 1845 {
7376                     	switch	.text
7377  0fed               _TIM1_SetIC1Prescaler:
7379  0fed 88            	push	a
7380       00000000      OFST:	set	0
7383                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
7385  0fee 4d            	tnz	a
7386  0fef 271a          	jreq	L2261
7387  0ff1 a104          	cp	a,#4
7388  0ff3 2716          	jreq	L2261
7389  0ff5 a108          	cp	a,#8
7390  0ff7 2712          	jreq	L2261
7391  0ff9 a10c          	cp	a,#12
7392  0ffb 270e          	jreq	L2261
7393  0ffd ae0737        	ldw	x,#1847
7394  1000 89            	pushw	x
7395  1001 5f            	clrw	x
7396  1002 89            	pushw	x
7397  1003 ae0000        	ldw	x,#L37
7398  1006 cd0000        	call	_assert_failed
7400  1009 5b04          	addw	sp,#4
7401  100b               L2261:
7402                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
7402                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
7404  100b c65258        	ld	a,21080
7405  100e a4f3          	and	a,#243
7406  1010 1a01          	or	a,(OFST+1,sp)
7407  1012 c75258        	ld	21080,a
7408                     ; 1852 }
7411  1015 84            	pop	a
7412  1016 81            	ret	
7449                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
7449                     ; 1865 {
7450                     	switch	.text
7451  1017               _TIM1_SetIC2Prescaler:
7453  1017 88            	push	a
7454       00000000      OFST:	set	0
7457                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
7459  1018 4d            	tnz	a
7460  1019 271a          	jreq	L4361
7461  101b a104          	cp	a,#4
7462  101d 2716          	jreq	L4361
7463  101f a108          	cp	a,#8
7464  1021 2712          	jreq	L4361
7465  1023 a10c          	cp	a,#12
7466  1025 270e          	jreq	L4361
7467  1027 ae074c        	ldw	x,#1868
7468  102a 89            	pushw	x
7469  102b 5f            	clrw	x
7470  102c 89            	pushw	x
7471  102d ae0000        	ldw	x,#L37
7472  1030 cd0000        	call	_assert_failed
7474  1033 5b04          	addw	sp,#4
7475  1035               L4361:
7476                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
7476                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
7478  1035 c65259        	ld	a,21081
7479  1038 a4f3          	and	a,#243
7480  103a 1a01          	or	a,(OFST+1,sp)
7481  103c c75259        	ld	21081,a
7482                     ; 1873 }
7485  103f 84            	pop	a
7486  1040 81            	ret	
7523                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
7523                     ; 1886 {
7524                     	switch	.text
7525  1041               _TIM1_SetIC3Prescaler:
7527  1041 88            	push	a
7528       00000000      OFST:	set	0
7531                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
7533  1042 4d            	tnz	a
7534  1043 271a          	jreq	L6461
7535  1045 a104          	cp	a,#4
7536  1047 2716          	jreq	L6461
7537  1049 a108          	cp	a,#8
7538  104b 2712          	jreq	L6461
7539  104d a10c          	cp	a,#12
7540  104f 270e          	jreq	L6461
7541  1051 ae0761        	ldw	x,#1889
7542  1054 89            	pushw	x
7543  1055 5f            	clrw	x
7544  1056 89            	pushw	x
7545  1057 ae0000        	ldw	x,#L37
7546  105a cd0000        	call	_assert_failed
7548  105d 5b04          	addw	sp,#4
7549  105f               L6461:
7550                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
7550                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
7552  105f c6525a        	ld	a,21082
7553  1062 a4f3          	and	a,#243
7554  1064 1a01          	or	a,(OFST+1,sp)
7555  1066 c7525a        	ld	21082,a
7556                     ; 1894 }
7559  1069 84            	pop	a
7560  106a 81            	ret	
7597                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
7597                     ; 1907 {
7598                     	switch	.text
7599  106b               _TIM1_SetIC4Prescaler:
7601  106b 88            	push	a
7602       00000000      OFST:	set	0
7605                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
7607  106c 4d            	tnz	a
7608  106d 271a          	jreq	L0661
7609  106f a104          	cp	a,#4
7610  1071 2716          	jreq	L0661
7611  1073 a108          	cp	a,#8
7612  1075 2712          	jreq	L0661
7613  1077 a10c          	cp	a,#12
7614  1079 270e          	jreq	L0661
7615  107b ae0776        	ldw	x,#1910
7616  107e 89            	pushw	x
7617  107f 5f            	clrw	x
7618  1080 89            	pushw	x
7619  1081 ae0000        	ldw	x,#L37
7620  1084 cd0000        	call	_assert_failed
7622  1087 5b04          	addw	sp,#4
7623  1089               L0661:
7624                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
7624                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
7626  1089 c6525b        	ld	a,21083
7627  108c a4f3          	and	a,#243
7628  108e 1a01          	or	a,(OFST+1,sp)
7629  1090 c7525b        	ld	21083,a
7630                     ; 1915 }
7633  1093 84            	pop	a
7634  1094 81            	ret	
7680                     ; 1922 uint16_t TIM1_GetCapture1(void)
7680                     ; 1923 {
7681                     	switch	.text
7682  1095               _TIM1_GetCapture1:
7684  1095 5204          	subw	sp,#4
7685       00000004      OFST:	set	4
7688                     ; 1926   uint16_t tmpccr1 = 0;
7690                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
7694                     ; 1929   tmpccr1h = TIM1->CCR1H;
7696  1097 c65265        	ld	a,21093
7697  109a 6b02          	ld	(OFST-2,sp),a
7699                     ; 1930   tmpccr1l = TIM1->CCR1L;
7701  109c c65266        	ld	a,21094
7702  109f 6b01          	ld	(OFST-3,sp),a
7704                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
7706  10a1 5f            	clrw	x
7707  10a2 97            	ld	xl,a
7708  10a3 1f03          	ldw	(OFST-1,sp),x
7710                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
7712  10a5 5f            	clrw	x
7713  10a6 7b02          	ld	a,(OFST-2,sp)
7714  10a8 97            	ld	xl,a
7715  10a9 7b04          	ld	a,(OFST+0,sp)
7716  10ab 01            	rrwa	x,a
7717  10ac 1a03          	or	a,(OFST-1,sp)
7718  10ae 01            	rrwa	x,a
7720                     ; 1935   return (uint16_t)tmpccr1;
7724  10af 5b04          	addw	sp,#4
7725  10b1 81            	ret	
7771                     ; 1943 uint16_t TIM1_GetCapture2(void)
7771                     ; 1944 {
7772                     	switch	.text
7773  10b2               _TIM1_GetCapture2:
7775  10b2 5204          	subw	sp,#4
7776       00000004      OFST:	set	4
7779                     ; 1947   uint16_t tmpccr2 = 0;
7781                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
7785                     ; 1950   tmpccr2h = TIM1->CCR2H;
7787  10b4 c65267        	ld	a,21095
7788  10b7 6b02          	ld	(OFST-2,sp),a
7790                     ; 1951   tmpccr2l = TIM1->CCR2L;
7792  10b9 c65268        	ld	a,21096
7793  10bc 6b01          	ld	(OFST-3,sp),a
7795                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
7797  10be 5f            	clrw	x
7798  10bf 97            	ld	xl,a
7799  10c0 1f03          	ldw	(OFST-1,sp),x
7801                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
7803  10c2 5f            	clrw	x
7804  10c3 7b02          	ld	a,(OFST-2,sp)
7805  10c5 97            	ld	xl,a
7806  10c6 7b04          	ld	a,(OFST+0,sp)
7807  10c8 01            	rrwa	x,a
7808  10c9 1a03          	or	a,(OFST-1,sp)
7809  10cb 01            	rrwa	x,a
7811                     ; 1956   return (uint16_t)tmpccr2;
7815  10cc 5b04          	addw	sp,#4
7816  10ce 81            	ret	
7862                     ; 1964 uint16_t TIM1_GetCapture3(void)
7862                     ; 1965 {
7863                     	switch	.text
7864  10cf               _TIM1_GetCapture3:
7866  10cf 5204          	subw	sp,#4
7867       00000004      OFST:	set	4
7870                     ; 1967   uint16_t tmpccr3 = 0;
7872                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
7876                     ; 1970   tmpccr3h = TIM1->CCR3H;
7878  10d1 c65269        	ld	a,21097
7879  10d4 6b02          	ld	(OFST-2,sp),a
7881                     ; 1971   tmpccr3l = TIM1->CCR3L;
7883  10d6 c6526a        	ld	a,21098
7884  10d9 6b01          	ld	(OFST-3,sp),a
7886                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
7888  10db 5f            	clrw	x
7889  10dc 97            	ld	xl,a
7890  10dd 1f03          	ldw	(OFST-1,sp),x
7892                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
7894  10df 5f            	clrw	x
7895  10e0 7b02          	ld	a,(OFST-2,sp)
7896  10e2 97            	ld	xl,a
7897  10e3 7b04          	ld	a,(OFST+0,sp)
7898  10e5 01            	rrwa	x,a
7899  10e6 1a03          	or	a,(OFST-1,sp)
7900  10e8 01            	rrwa	x,a
7902                     ; 1976   return (uint16_t)tmpccr3;
7906  10e9 5b04          	addw	sp,#4
7907  10eb 81            	ret	
7953                     ; 1984 uint16_t TIM1_GetCapture4(void)
7953                     ; 1985 {
7954                     	switch	.text
7955  10ec               _TIM1_GetCapture4:
7957  10ec 5204          	subw	sp,#4
7958       00000004      OFST:	set	4
7961                     ; 1987   uint16_t tmpccr4 = 0;
7963                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
7967                     ; 1990   tmpccr4h = TIM1->CCR4H;
7969  10ee c6526b        	ld	a,21099
7970  10f1 6b02          	ld	(OFST-2,sp),a
7972                     ; 1991   tmpccr4l = TIM1->CCR4L;
7974  10f3 c6526c        	ld	a,21100
7975  10f6 6b01          	ld	(OFST-3,sp),a
7977                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
7979  10f8 5f            	clrw	x
7980  10f9 97            	ld	xl,a
7981  10fa 1f03          	ldw	(OFST-1,sp),x
7983                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
7985  10fc 5f            	clrw	x
7986  10fd 7b02          	ld	a,(OFST-2,sp)
7987  10ff 97            	ld	xl,a
7988  1100 7b04          	ld	a,(OFST+0,sp)
7989  1102 01            	rrwa	x,a
7990  1103 1a03          	or	a,(OFST-1,sp)
7991  1105 01            	rrwa	x,a
7993                     ; 1996   return (uint16_t)tmpccr4;
7997  1106 5b04          	addw	sp,#4
7998  1108 81            	ret	
8030                     ; 2004 uint16_t TIM1_GetCounter(void)
8030                     ; 2005 {
8031                     	switch	.text
8032  1109               _TIM1_GetCounter:
8034  1109 89            	pushw	x
8035       00000002      OFST:	set	2
8038                     ; 2006   uint16_t tmpcntr = 0;
8040                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
8042  110a c6525e        	ld	a,21086
8043  110d 97            	ld	xl,a
8044  110e 4f            	clr	a
8045  110f 02            	rlwa	x,a
8046  1110 1f01          	ldw	(OFST-1,sp),x
8048                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
8050  1112 c6525f        	ld	a,21087
8051  1115 5f            	clrw	x
8052  1116 97            	ld	xl,a
8053  1117 01            	rrwa	x,a
8054  1118 1a02          	or	a,(OFST+0,sp)
8055  111a 01            	rrwa	x,a
8056  111b 1a01          	or	a,(OFST-1,sp)
8057  111d 01            	rrwa	x,a
8060  111e 5b02          	addw	sp,#2
8061  1120 81            	ret	
8093                     ; 2019 uint16_t TIM1_GetPrescaler(void)
8093                     ; 2020 {
8094                     	switch	.text
8095  1121               _TIM1_GetPrescaler:
8097  1121 89            	pushw	x
8098       00000002      OFST:	set	2
8101                     ; 2021   uint16_t temp = 0;
8103                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
8105  1122 c65260        	ld	a,21088
8106  1125 97            	ld	xl,a
8107  1126 4f            	clr	a
8108  1127 02            	rlwa	x,a
8109  1128 1f01          	ldw	(OFST-1,sp),x
8111                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
8113  112a c65261        	ld	a,21089
8114  112d 5f            	clrw	x
8115  112e 97            	ld	xl,a
8116  112f 01            	rrwa	x,a
8117  1130 1a02          	or	a,(OFST+0,sp)
8118  1132 01            	rrwa	x,a
8119  1133 1a01          	or	a,(OFST-1,sp)
8120  1135 01            	rrwa	x,a
8123  1136 5b02          	addw	sp,#2
8124  1138 81            	ret	
8295                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
8295                     ; 2048 {
8296                     	switch	.text
8297  1139               _TIM1_GetFlagStatus:
8299  1139 89            	pushw	x
8300  113a 89            	pushw	x
8301       00000002      OFST:	set	2
8304                     ; 2049   FlagStatus bitstatus = RESET;
8306                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
8310                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
8312  113b a30001        	cpw	x,#1
8313  113e 2745          	jreq	L6071
8314  1140 a30002        	cpw	x,#2
8315  1143 2740          	jreq	L6071
8316  1145 a30004        	cpw	x,#4
8317  1148 273b          	jreq	L6071
8318  114a a30008        	cpw	x,#8
8319  114d 2736          	jreq	L6071
8320  114f a30010        	cpw	x,#16
8321  1152 2731          	jreq	L6071
8322  1154 a30020        	cpw	x,#32
8323  1157 272c          	jreq	L6071
8324  1159 a30040        	cpw	x,#64
8325  115c 2727          	jreq	L6071
8326  115e a30080        	cpw	x,#128
8327  1161 2722          	jreq	L6071
8328  1163 a30200        	cpw	x,#512
8329  1166 271d          	jreq	L6071
8330  1168 a30400        	cpw	x,#1024
8331  116b 2718          	jreq	L6071
8332  116d a30800        	cpw	x,#2048
8333  1170 2713          	jreq	L6071
8334  1172 a31000        	cpw	x,#4096
8335  1175 270e          	jreq	L6071
8336  1177 ae0805        	ldw	x,#2053
8337  117a 89            	pushw	x
8338  117b 5f            	clrw	x
8339  117c 89            	pushw	x
8340  117d ae0000        	ldw	x,#L37
8341  1180 cd0000        	call	_assert_failed
8343  1183 5b04          	addw	sp,#4
8344  1185               L6071:
8345                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
8347  1185 c65255        	ld	a,21077
8348  1188 1404          	and	a,(OFST+2,sp)
8349  118a 6b01          	ld	(OFST-1,sp),a
8351                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
8353  118c 7b03          	ld	a,(OFST+1,sp)
8354  118e 6b02          	ld	(OFST+0,sp),a
8356                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
8358  1190 c45256        	and	a,21078
8359  1193 1a01          	or	a,(OFST-1,sp)
8360  1195 2702          	jreq	L1533
8361                     ; 2060     bitstatus = SET;
8363  1197 a601          	ld	a,#1
8366  1199               L1533:
8367                     ; 2064     bitstatus = RESET;
8370                     ; 2066   return (FlagStatus)(bitstatus);
8374  1199 5b04          	addw	sp,#4
8375  119b 81            	ret	
8411                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
8411                     ; 2088 {
8412                     	switch	.text
8413  119c               _TIM1_ClearFlag:
8415  119c 89            	pushw	x
8416       00000000      OFST:	set	0
8419                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
8421  119d 01            	rrwa	x,a
8422  119e 9f            	ld	a,xl
8423  119f a4e1          	and	a,#225
8424  11a1 97            	ld	xl,a
8425  11a2 4f            	clr	a
8426  11a3 02            	rlwa	x,a
8427  11a4 5d            	tnzw	x
8428  11a5 2604          	jrne	L4171
8429  11a7 1e01          	ldw	x,(OFST+1,sp)
8430  11a9 260e          	jrne	L6171
8431  11ab               L4171:
8432  11ab ae082a        	ldw	x,#2090
8433  11ae 89            	pushw	x
8434  11af 5f            	clrw	x
8435  11b0 89            	pushw	x
8436  11b1 ae0000        	ldw	x,#L37
8437  11b4 cd0000        	call	_assert_failed
8439  11b7 5b04          	addw	sp,#4
8440  11b9               L6171:
8441                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
8443  11b9 7b02          	ld	a,(OFST+2,sp)
8444  11bb 43            	cpl	a
8445  11bc c75255        	ld	21077,a
8446                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
8446                     ; 2095                         (uint8_t)0x1E);
8448  11bf 7b01          	ld	a,(OFST+1,sp)
8449  11c1 43            	cpl	a
8450  11c2 a41e          	and	a,#30
8451  11c4 c75256        	ld	21078,a
8452                     ; 2096 }
8455  11c7 85            	popw	x
8456  11c8 81            	ret	
8517                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
8517                     ; 2113 {
8518                     	switch	.text
8519  11c9               _TIM1_GetITStatus:
8521  11c9 88            	push	a
8522  11ca 89            	pushw	x
8523       00000002      OFST:	set	2
8526                     ; 2114   ITStatus bitstatus = RESET;
8528                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
8532                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
8534  11cb a101          	cp	a,#1
8535  11cd 272a          	jreq	L0371
8536  11cf a102          	cp	a,#2
8537  11d1 2726          	jreq	L0371
8538  11d3 a104          	cp	a,#4
8539  11d5 2722          	jreq	L0371
8540  11d7 a108          	cp	a,#8
8541  11d9 271e          	jreq	L0371
8542  11db a110          	cp	a,#16
8543  11dd 271a          	jreq	L0371
8544  11df a120          	cp	a,#32
8545  11e1 2716          	jreq	L0371
8546  11e3 a140          	cp	a,#64
8547  11e5 2712          	jreq	L0371
8548  11e7 a180          	cp	a,#128
8549  11e9 270e          	jreq	L0371
8550  11eb ae0846        	ldw	x,#2118
8551  11ee 89            	pushw	x
8552  11ef 5f            	clrw	x
8553  11f0 89            	pushw	x
8554  11f1 ae0000        	ldw	x,#L37
8555  11f4 cd0000        	call	_assert_failed
8557  11f7 5b04          	addw	sp,#4
8558  11f9               L0371:
8559                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
8561  11f9 c65255        	ld	a,21077
8562  11fc 1403          	and	a,(OFST+1,sp)
8563  11fe 6b01          	ld	(OFST-1,sp),a
8565                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
8567  1200 c65254        	ld	a,21076
8568  1203 1403          	and	a,(OFST+1,sp)
8569  1205 6b02          	ld	(OFST+0,sp),a
8571                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
8573  1207 7b01          	ld	a,(OFST-1,sp)
8574  1209 2708          	jreq	L1243
8576  120b 7b02          	ld	a,(OFST+0,sp)
8577  120d 2704          	jreq	L1243
8578                     ; 2126     bitstatus = SET;
8580  120f a601          	ld	a,#1
8583  1211 2001          	jra	L3243
8584  1213               L1243:
8585                     ; 2130     bitstatus = RESET;
8587  1213 4f            	clr	a
8589  1214               L3243:
8590                     ; 2132   return (ITStatus)(bitstatus);
8594  1214 5b03          	addw	sp,#3
8595  1216 81            	ret	
8632                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
8632                     ; 2150 {
8633                     	switch	.text
8634  1217               _TIM1_ClearITPendingBit:
8636  1217 88            	push	a
8637       00000000      OFST:	set	0
8640                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
8642  1218 4d            	tnz	a
8643  1219 260e          	jrne	L0471
8644  121b ae0868        	ldw	x,#2152
8645  121e 89            	pushw	x
8646  121f 5f            	clrw	x
8647  1220 89            	pushw	x
8648  1221 ae0000        	ldw	x,#L37
8649  1224 cd0000        	call	_assert_failed
8651  1227 5b04          	addw	sp,#4
8652  1229               L0471:
8653                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
8655  1229 7b01          	ld	a,(OFST+1,sp)
8656  122b 43            	cpl	a
8657  122c c75255        	ld	21077,a
8658                     ; 2156 }
8661  122f 84            	pop	a
8662  1230 81            	ret	
8708                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
8708                     ; 2175                        uint8_t TIM1_ICSelection,
8708                     ; 2176                        uint8_t TIM1_ICFilter)
8708                     ; 2177 {
8709                     	switch	.text
8710  1231               L3_TI1_Config:
8712  1231 89            	pushw	x
8713  1232 88            	push	a
8714       00000001      OFST:	set	1
8717                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
8719  1233 7211525c      	bres	21084,#0
8720                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
8720                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8722  1237 7b06          	ld	a,(OFST+5,sp)
8723  1239 97            	ld	xl,a
8724  123a a610          	ld	a,#16
8725  123c 42            	mul	x,a
8726  123d 9f            	ld	a,xl
8727  123e 1a03          	or	a,(OFST+2,sp)
8728  1240 6b01          	ld	(OFST+0,sp),a
8730  1242 c65258        	ld	a,21080
8731  1245 a40c          	and	a,#12
8732  1247 1a01          	or	a,(OFST+0,sp)
8733  1249 c75258        	ld	21080,a
8734                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
8736  124c 7b02          	ld	a,(OFST+1,sp)
8737  124e 2706          	jreq	L3643
8738                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
8740  1250 7212525c      	bset	21084,#1
8742  1254 2004          	jra	L5643
8743  1256               L3643:
8744                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
8746  1256 7213525c      	bres	21084,#1
8747  125a               L5643:
8748                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
8750  125a 7210525c      	bset	21084,#0
8751                     ; 2197 }
8754  125e 5b03          	addw	sp,#3
8755  1260 81            	ret	
8801                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
8801                     ; 2216                        uint8_t TIM1_ICSelection,
8801                     ; 2217                        uint8_t TIM1_ICFilter)
8801                     ; 2218 {
8802                     	switch	.text
8803  1261               L5_TI2_Config:
8805  1261 89            	pushw	x
8806  1262 88            	push	a
8807       00000001      OFST:	set	1
8810                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
8812  1263 7219525c      	bres	21084,#4
8813                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
8813                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8815  1267 7b06          	ld	a,(OFST+5,sp)
8816  1269 97            	ld	xl,a
8817  126a a610          	ld	a,#16
8818  126c 42            	mul	x,a
8819  126d 9f            	ld	a,xl
8820  126e 1a03          	or	a,(OFST+2,sp)
8821  1270 6b01          	ld	(OFST+0,sp),a
8823  1272 c65259        	ld	a,21081
8824  1275 a40c          	and	a,#12
8825  1277 1a01          	or	a,(OFST+0,sp)
8826  1279 c75259        	ld	21081,a
8827                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
8829  127c 7b02          	ld	a,(OFST+1,sp)
8830  127e 2706          	jreq	L7053
8831                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
8833  1280 721a525c      	bset	21084,#5
8835  1284 2004          	jra	L1153
8836  1286               L7053:
8837                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
8839  1286 721b525c      	bres	21084,#5
8840  128a               L1153:
8841                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
8843  128a 7218525c      	bset	21084,#4
8844                     ; 2236 }
8847  128e 5b03          	addw	sp,#3
8848  1290 81            	ret	
8894                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
8894                     ; 2255                        uint8_t TIM1_ICSelection,
8894                     ; 2256                        uint8_t TIM1_ICFilter)
8894                     ; 2257 {
8895                     	switch	.text
8896  1291               L7_TI3_Config:
8898  1291 89            	pushw	x
8899  1292 88            	push	a
8900       00000001      OFST:	set	1
8903                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8905  1293 7211525d      	bres	21085,#0
8906                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
8906                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8908  1297 7b06          	ld	a,(OFST+5,sp)
8909  1299 97            	ld	xl,a
8910  129a a610          	ld	a,#16
8911  129c 42            	mul	x,a
8912  129d 9f            	ld	a,xl
8913  129e 1a03          	or	a,(OFST+2,sp)
8914  12a0 6b01          	ld	(OFST+0,sp),a
8916  12a2 c6525a        	ld	a,21082
8917  12a5 a40c          	and	a,#12
8918  12a7 1a01          	or	a,(OFST+0,sp)
8919  12a9 c7525a        	ld	21082,a
8920                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
8922  12ac 7b02          	ld	a,(OFST+1,sp)
8923  12ae 2706          	jreq	L3353
8924                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
8926  12b0 7212525d      	bset	21085,#1
8928  12b4 2004          	jra	L5353
8929  12b6               L3353:
8930                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8932  12b6 7213525d      	bres	21085,#1
8933  12ba               L5353:
8934                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8936  12ba 7210525d      	bset	21085,#0
8937                     ; 2276 }
8940  12be 5b03          	addw	sp,#3
8941  12c0 81            	ret	
8987                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
8987                     ; 2295                        uint8_t TIM1_ICSelection,
8987                     ; 2296                        uint8_t TIM1_ICFilter)
8987                     ; 2297 {
8988                     	switch	.text
8989  12c1               L11_TI4_Config:
8991  12c1 89            	pushw	x
8992  12c2 88            	push	a
8993       00000001      OFST:	set	1
8996                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8998  12c3 7219525d      	bres	21085,#4
8999                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
8999                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9001  12c7 7b06          	ld	a,(OFST+5,sp)
9002  12c9 97            	ld	xl,a
9003  12ca a610          	ld	a,#16
9004  12cc 42            	mul	x,a
9005  12cd 9f            	ld	a,xl
9006  12ce 1a03          	or	a,(OFST+2,sp)
9007  12d0 6b01          	ld	(OFST+0,sp),a
9009  12d2 c6525b        	ld	a,21083
9010  12d5 a40c          	and	a,#12
9011  12d7 1a01          	or	a,(OFST+0,sp)
9012  12d9 c7525b        	ld	21083,a
9013                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9015  12dc 7b02          	ld	a,(OFST+1,sp)
9016  12de 2706          	jreq	L7553
9017                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
9019  12e0 721a525d      	bset	21085,#5
9021  12e4 2004          	jra	L1653
9022  12e6               L7553:
9023                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
9025  12e6 721b525d      	bres	21085,#5
9026  12ea               L1653:
9027                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
9029  12ea 7218525d      	bset	21085,#4
9030                     ; 2317 }
9033  12ee 5b03          	addw	sp,#3
9034  12f0 81            	ret	
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
