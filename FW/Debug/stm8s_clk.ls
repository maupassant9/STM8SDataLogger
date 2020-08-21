   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  16                     .const:	section	.text
  17  0000               _HSIDivFactor:
  18  0000 01            	dc.b	1
  19  0001 02            	dc.b	2
  20  0002 04            	dc.b	4
  21  0003 08            	dc.b	8
  22  0004               _CLKPrescTable:
  23  0004 01            	dc.b	1
  24  0005 02            	dc.b	2
  25  0006 04            	dc.b	4
  26  0007 08            	dc.b	8
  27  0008 0a            	dc.b	10
  28  0009 10            	dc.b	16
  29  000a 14            	dc.b	20
  30  000b 28            	dc.b	40
  59                     ; 72 void CLK_DeInit(void)
  59                     ; 73 {
  61                     	switch	.text
  62  0000               _CLK_DeInit:
  66                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  68  0000 350150c0      	mov	20672,#1
  69                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  71  0004 725f50c1      	clr	20673
  72                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  74  0008 35e150c4      	mov	20676,#225
  75                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  77  000c 725f50c5      	clr	20677
  78                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  80  0010 351850c6      	mov	20678,#24
  81                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  83  0014 35ff50c7      	mov	20679,#255
  84                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  86  0018 35ff50ca      	mov	20682,#255
  87                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  89  001c 725f50c8      	clr	20680
  90                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  92  0020 725f50c9      	clr	20681
  94  0024               L52:
  95                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  97  0024 720050c9fb    	btjt	20681,#0,L52
  98                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 100  0029 725f50c9      	clr	20681
 101                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 103  002d 725f50cc      	clr	20684
 104                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 106  0031 725f50cd      	clr	20685
 107                     ; 88 }
 110  0035 81            	ret	
 167                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 167                     ; 100 {
 168                     	switch	.text
 169  0036               _CLK_FastHaltWakeUpCmd:
 171  0036 88            	push	a
 172       00000000      OFST:	set	0
 175                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 177  0037 4d            	tnz	a
 178  0038 2711          	jreq	L41
 179  003a 4a            	dec	a
 180  003b 270e          	jreq	L41
 181  003d ae0066        	ldw	x,#102
 182  0040 89            	pushw	x
 183  0041 5f            	clrw	x
 184  0042 89            	pushw	x
 185  0043 ae000c        	ldw	x,#L75
 186  0046 cd0000        	call	_assert_failed
 188  0049 5b04          	addw	sp,#4
 189  004b               L41:
 190                     ; 104   if (NewState != DISABLE)
 192  004b 7b01          	ld	a,(OFST+1,sp)
 193  004d 2706          	jreq	L16
 194                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 196  004f 721450c0      	bset	20672,#2
 198  0053 2004          	jra	L36
 199  0055               L16:
 200                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 202  0055 721550c0      	bres	20672,#2
 203  0059               L36:
 204                     ; 114 }
 207  0059 84            	pop	a
 208  005a 81            	ret	
 244                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 244                     ; 122 {
 245                     	switch	.text
 246  005b               _CLK_HSECmd:
 248  005b 88            	push	a
 249       00000000      OFST:	set	0
 252                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 254  005c 4d            	tnz	a
 255  005d 2711          	jreq	L62
 256  005f 4a            	dec	a
 257  0060 270e          	jreq	L62
 258  0062 ae007c        	ldw	x,#124
 259  0065 89            	pushw	x
 260  0066 5f            	clrw	x
 261  0067 89            	pushw	x
 262  0068 ae000c        	ldw	x,#L75
 263  006b cd0000        	call	_assert_failed
 265  006e 5b04          	addw	sp,#4
 266  0070               L62:
 267                     ; 126   if (NewState != DISABLE)
 269  0070 7b01          	ld	a,(OFST+1,sp)
 270  0072 2706          	jreq	L301
 271                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 273  0074 721050c1      	bset	20673,#0
 275  0078 2004          	jra	L501
 276  007a               L301:
 277                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 279  007a 721150c1      	bres	20673,#0
 280  007e               L501:
 281                     ; 136 }
 284  007e 84            	pop	a
 285  007f 81            	ret	
 321                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 321                     ; 144 {
 322                     	switch	.text
 323  0080               _CLK_HSICmd:
 325  0080 88            	push	a
 326       00000000      OFST:	set	0
 329                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 331  0081 4d            	tnz	a
 332  0082 2711          	jreq	L04
 333  0084 4a            	dec	a
 334  0085 270e          	jreq	L04
 335  0087 ae0092        	ldw	x,#146
 336  008a 89            	pushw	x
 337  008b 5f            	clrw	x
 338  008c 89            	pushw	x
 339  008d ae000c        	ldw	x,#L75
 340  0090 cd0000        	call	_assert_failed
 342  0093 5b04          	addw	sp,#4
 343  0095               L04:
 344                     ; 148   if (NewState != DISABLE)
 346  0095 7b01          	ld	a,(OFST+1,sp)
 347  0097 2706          	jreq	L521
 348                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 350  0099 721050c0      	bset	20672,#0
 352  009d 2004          	jra	L721
 353  009f               L521:
 354                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 356  009f 721150c0      	bres	20672,#0
 357  00a3               L721:
 358                     ; 158 }
 361  00a3 84            	pop	a
 362  00a4 81            	ret	
 398                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 398                     ; 167 {
 399                     	switch	.text
 400  00a5               _CLK_LSICmd:
 402  00a5 88            	push	a
 403       00000000      OFST:	set	0
 406                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 408  00a6 4d            	tnz	a
 409  00a7 2711          	jreq	L25
 410  00a9 4a            	dec	a
 411  00aa 270e          	jreq	L25
 412  00ac ae00a9        	ldw	x,#169
 413  00af 89            	pushw	x
 414  00b0 5f            	clrw	x
 415  00b1 89            	pushw	x
 416  00b2 ae000c        	ldw	x,#L75
 417  00b5 cd0000        	call	_assert_failed
 419  00b8 5b04          	addw	sp,#4
 420  00ba               L25:
 421                     ; 171   if (NewState != DISABLE)
 423  00ba 7b01          	ld	a,(OFST+1,sp)
 424  00bc 2706          	jreq	L741
 425                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 427  00be 721650c0      	bset	20672,#3
 429  00c2 2004          	jra	L151
 430  00c4               L741:
 431                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 433  00c4 721750c0      	bres	20672,#3
 434  00c8               L151:
 435                     ; 181 }
 438  00c8 84            	pop	a
 439  00c9 81            	ret	
 475                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 475                     ; 190 {
 476                     	switch	.text
 477  00ca               _CLK_CCOCmd:
 479  00ca 88            	push	a
 480       00000000      OFST:	set	0
 483                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 485  00cb 4d            	tnz	a
 486  00cc 2711          	jreq	L46
 487  00ce 4a            	dec	a
 488  00cf 270e          	jreq	L46
 489  00d1 ae00c0        	ldw	x,#192
 490  00d4 89            	pushw	x
 491  00d5 5f            	clrw	x
 492  00d6 89            	pushw	x
 493  00d7 ae000c        	ldw	x,#L75
 494  00da cd0000        	call	_assert_failed
 496  00dd 5b04          	addw	sp,#4
 497  00df               L46:
 498                     ; 194   if (NewState != DISABLE)
 500  00df 7b01          	ld	a,(OFST+1,sp)
 501  00e1 2706          	jreq	L171
 502                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 504  00e3 721050c9      	bset	20681,#0
 506  00e7 2004          	jra	L371
 507  00e9               L171:
 508                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 510  00e9 721150c9      	bres	20681,#0
 511  00ed               L371:
 512                     ; 204 }
 515  00ed 84            	pop	a
 516  00ee 81            	ret	
 552                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 552                     ; 214 {
 553                     	switch	.text
 554  00ef               _CLK_ClockSwitchCmd:
 556  00ef 88            	push	a
 557       00000000      OFST:	set	0
 560                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 562  00f0 4d            	tnz	a
 563  00f1 2711          	jreq	L67
 564  00f3 4a            	dec	a
 565  00f4 270e          	jreq	L67
 566  00f6 ae00d8        	ldw	x,#216
 567  00f9 89            	pushw	x
 568  00fa 5f            	clrw	x
 569  00fb 89            	pushw	x
 570  00fc ae000c        	ldw	x,#L75
 571  00ff cd0000        	call	_assert_failed
 573  0102 5b04          	addw	sp,#4
 574  0104               L67:
 575                     ; 218   if (NewState != DISABLE )
 577  0104 7b01          	ld	a,(OFST+1,sp)
 578  0106 2706          	jreq	L312
 579                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 581  0108 721250c5      	bset	20677,#1
 583  010c 2004          	jra	L512
 584  010e               L312:
 585                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 587  010e 721350c5      	bres	20677,#1
 588  0112               L512:
 589                     ; 228 }
 592  0112 84            	pop	a
 593  0113 81            	ret	
 630                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 630                     ; 239 {
 631                     	switch	.text
 632  0114               _CLK_SlowActiveHaltWakeUpCmd:
 634  0114 88            	push	a
 635       00000000      OFST:	set	0
 638                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 640  0115 4d            	tnz	a
 641  0116 2711          	jreq	L011
 642  0118 4a            	dec	a
 643  0119 270e          	jreq	L011
 644  011b ae00f1        	ldw	x,#241
 645  011e 89            	pushw	x
 646  011f 5f            	clrw	x
 647  0120 89            	pushw	x
 648  0121 ae000c        	ldw	x,#L75
 649  0124 cd0000        	call	_assert_failed
 651  0127 5b04          	addw	sp,#4
 652  0129               L011:
 653                     ; 243   if (NewState != DISABLE)
 655  0129 7b01          	ld	a,(OFST+1,sp)
 656  012b 2706          	jreq	L532
 657                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 659  012d 721a50c0      	bset	20672,#5
 661  0131 2004          	jra	L732
 662  0133               L532:
 663                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 665  0133 721b50c0      	bres	20672,#5
 666  0137               L732:
 667                     ; 253 }
 670  0137 84            	pop	a
 671  0138 81            	ret	
 831                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 831                     ; 264 {
 832                     	switch	.text
 833  0139               _CLK_PeripheralClockConfig:
 835  0139 89            	pushw	x
 836       00000000      OFST:	set	0
 839                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 841  013a 9f            	ld	a,xl
 842  013b 4d            	tnz	a
 843  013c 2712          	jreq	L221
 844  013e 9f            	ld	a,xl
 845  013f 4a            	dec	a
 846  0140 270e          	jreq	L221
 847  0142 ae010a        	ldw	x,#266
 848  0145 89            	pushw	x
 849  0146 5f            	clrw	x
 850  0147 89            	pushw	x
 851  0148 ae000c        	ldw	x,#L75
 852  014b cd0000        	call	_assert_failed
 854  014e 5b04          	addw	sp,#4
 855  0150               L221:
 856                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 858  0150 7b01          	ld	a,(OFST+1,sp)
 859  0152 2738          	jreq	L231
 860  0154 a101          	cp	a,#1
 861  0156 2734          	jreq	L231
 862  0158 a103          	cp	a,#3
 863  015a 2730          	jreq	L231
 864  015c a104          	cp	a,#4
 865  015e 272c          	jreq	L231
 866  0160 a105          	cp	a,#5
 867  0162 2728          	jreq	L231
 868  0164 a104          	cp	a,#4
 869  0166 2724          	jreq	L231
 870  0168 a106          	cp	a,#6
 871  016a 2720          	jreq	L231
 872  016c a107          	cp	a,#7
 873  016e 271c          	jreq	L231
 874  0170 a117          	cp	a,#23
 875  0172 2718          	jreq	L231
 876  0174 a113          	cp	a,#19
 877  0176 2714          	jreq	L231
 878  0178 a112          	cp	a,#18
 879  017a 2710          	jreq	L231
 880  017c ae010b        	ldw	x,#267
 881  017f 89            	pushw	x
 882  0180 5f            	clrw	x
 883  0181 89            	pushw	x
 884  0182 ae000c        	ldw	x,#L75
 885  0185 cd0000        	call	_assert_failed
 887  0188 5b04          	addw	sp,#4
 888  018a 7b01          	ld	a,(OFST+1,sp)
 889  018c               L231:
 890                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 892  018c a510          	bcp	a,#16
 893  018e 262c          	jrne	L323
 894                     ; 271     if (NewState != DISABLE)
 896  0190 0d02          	tnz	(OFST+2,sp)
 897  0192 2712          	jreq	L523
 898                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 900  0194 a40f          	and	a,#15
 901  0196 5f            	clrw	x
 902  0197 97            	ld	xl,a
 903  0198 a601          	ld	a,#1
 904  019a 5d            	tnzw	x
 905  019b 2704          	jreq	L631
 906  019d               L041:
 907  019d 48            	sll	a
 908  019e 5a            	decw	x
 909  019f 26fc          	jrne	L041
 910  01a1               L631:
 911  01a1 ca50c7        	or	a,20679
 913  01a4 2011          	jp	LC002
 914  01a6               L523:
 915                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 917  01a6 a40f          	and	a,#15
 918  01a8 5f            	clrw	x
 919  01a9 97            	ld	xl,a
 920  01aa a601          	ld	a,#1
 921  01ac 5d            	tnzw	x
 922  01ad 2704          	jreq	L241
 923  01af               L441:
 924  01af 48            	sll	a
 925  01b0 5a            	decw	x
 926  01b1 26fc          	jrne	L441
 927  01b3               L241:
 928  01b3 43            	cpl	a
 929  01b4 c450c7        	and	a,20679
 930  01b7               LC002:
 931  01b7 c750c7        	ld	20679,a
 932  01ba 202a          	jra	L133
 933  01bc               L323:
 934                     ; 284     if (NewState != DISABLE)
 936  01bc 0d02          	tnz	(OFST+2,sp)
 937  01be 2712          	jreq	L333
 938                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 940  01c0 a40f          	and	a,#15
 941  01c2 5f            	clrw	x
 942  01c3 97            	ld	xl,a
 943  01c4 a601          	ld	a,#1
 944  01c6 5d            	tnzw	x
 945  01c7 2704          	jreq	L641
 946  01c9               L051:
 947  01c9 48            	sll	a
 948  01ca 5a            	decw	x
 949  01cb 26fc          	jrne	L051
 950  01cd               L641:
 951  01cd ca50ca        	or	a,20682
 953  01d0 2011          	jp	LC001
 954  01d2               L333:
 955                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 957  01d2 a40f          	and	a,#15
 958  01d4 5f            	clrw	x
 959  01d5 97            	ld	xl,a
 960  01d6 a601          	ld	a,#1
 961  01d8 5d            	tnzw	x
 962  01d9 2704          	jreq	L251
 963  01db               L451:
 964  01db 48            	sll	a
 965  01dc 5a            	decw	x
 966  01dd 26fc          	jrne	L451
 967  01df               L251:
 968  01df 43            	cpl	a
 969  01e0 c450ca        	and	a,20682
 970  01e3               LC001:
 971  01e3 c750ca        	ld	20682,a
 972  01e6               L133:
 973                     ; 295 }
 976  01e6 85            	popw	x
 977  01e7 81            	ret	
1164                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1164                     ; 310 {
1165                     	switch	.text
1166  01e8               _CLK_ClockSwitchConfig:
1168  01e8 89            	pushw	x
1169  01e9 5204          	subw	sp,#4
1170       00000004      OFST:	set	4
1173                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1175  01eb aeffff        	ldw	x,#65535
1176  01ee 1f03          	ldw	(OFST-1,sp),x
1178                     ; 313   ErrorStatus Swif = ERROR;
1180                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1182  01f0 7b06          	ld	a,(OFST+2,sp)
1183  01f2 a1e1          	cp	a,#225
1184  01f4 2716          	jreq	L461
1185  01f6 a1d2          	cp	a,#210
1186  01f8 2712          	jreq	L461
1187  01fa a1b4          	cp	a,#180
1188  01fc 270e          	jreq	L461
1189  01fe ae013c        	ldw	x,#316
1190  0201 89            	pushw	x
1191  0202 5f            	clrw	x
1192  0203 89            	pushw	x
1193  0204 ae000c        	ldw	x,#L75
1194  0207 cd0000        	call	_assert_failed
1196  020a 5b04          	addw	sp,#4
1197  020c               L461:
1198                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1200  020c 7b05          	ld	a,(OFST+1,sp)
1201  020e 2711          	jreq	L471
1202  0210 4a            	dec	a
1203  0211 270e          	jreq	L471
1204  0213 ae013d        	ldw	x,#317
1205  0216 89            	pushw	x
1206  0217 5f            	clrw	x
1207  0218 89            	pushw	x
1208  0219 ae000c        	ldw	x,#L75
1209  021c cd0000        	call	_assert_failed
1211  021f 5b04          	addw	sp,#4
1212  0221               L471:
1213                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1215  0221 7b09          	ld	a,(OFST+5,sp)
1216  0223 2711          	jreq	L402
1217  0225 4a            	dec	a
1218  0226 270e          	jreq	L402
1219  0228 ae013e        	ldw	x,#318
1220  022b 89            	pushw	x
1221  022c 5f            	clrw	x
1222  022d 89            	pushw	x
1223  022e ae000c        	ldw	x,#L75
1224  0231 cd0000        	call	_assert_failed
1226  0234 5b04          	addw	sp,#4
1227  0236               L402:
1228                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1230  0236 7b0a          	ld	a,(OFST+6,sp)
1231  0238 2711          	jreq	L412
1232  023a 4a            	dec	a
1233  023b 270e          	jreq	L412
1234  023d ae013f        	ldw	x,#319
1235  0240 89            	pushw	x
1236  0241 5f            	clrw	x
1237  0242 89            	pushw	x
1238  0243 ae000c        	ldw	x,#L75
1239  0246 cd0000        	call	_assert_failed
1241  0249 5b04          	addw	sp,#4
1242  024b               L412:
1243                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1245  024b c650c3        	ld	a,20675
1246  024e 6b01          	ld	(OFST-3,sp),a
1248                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1250  0250 7b05          	ld	a,(OFST+1,sp)
1251  0252 4a            	dec	a
1252  0253 263d          	jrne	L544
1253                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1255  0255 721250c5      	bset	20677,#1
1256                     ; 331     if (ITState != DISABLE)
1258  0259 7b09          	ld	a,(OFST+5,sp)
1259  025b 2706          	jreq	L744
1260                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1262  025d 721450c5      	bset	20677,#2
1264  0261 2004          	jra	L154
1265  0263               L744:
1266                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1268  0263 721550c5      	bres	20677,#2
1269  0267               L154:
1270                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1272  0267 7b06          	ld	a,(OFST+2,sp)
1273  0269 c750c4        	ld	20676,a
1275  026c 2003          	jra	L754
1276  026e               L354:
1277                     ; 346       DownCounter--;
1279  026e 5a            	decw	x
1280  026f 1f03          	ldw	(OFST-1,sp),x
1282  0271               L754:
1283                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1285  0271 720150c504    	btjf	20677,#0,L364
1287  0276 1e03          	ldw	x,(OFST-1,sp)
1288  0278 26f4          	jrne	L354
1289  027a               L364:
1290                     ; 349     if(DownCounter != 0)
1292  027a 1e03          	ldw	x,(OFST-1,sp)
1293                     ; 351       Swif = SUCCESS;
1295  027c 263d          	jrne	LC004
1296  027e               L564:
1297                     ; 355       Swif = ERROR;
1300  027e 0f02          	clr	(OFST-2,sp)
1302  0280               L174:
1303                     ; 390   if(Swif != ERROR)
1305  0280 275d          	jreq	L515
1306                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1308  0282 7b0a          	ld	a,(OFST+6,sp)
1309  0284 263b          	jrne	L715
1311  0286 7b01          	ld	a,(OFST-3,sp)
1312  0288 a1e1          	cp	a,#225
1313  028a 2635          	jrne	L715
1314                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1316  028c 721150c0      	bres	20672,#0
1318  0290 204d          	jra	L515
1319  0292               L544:
1320                     ; 361     if (ITState != DISABLE)
1322  0292 7b09          	ld	a,(OFST+5,sp)
1323  0294 2706          	jreq	L374
1324                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1326  0296 721450c5      	bset	20677,#2
1328  029a 2004          	jra	L574
1329  029c               L374:
1330                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1332  029c 721550c5      	bres	20677,#2
1333  02a0               L574:
1334                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1336  02a0 7b06          	ld	a,(OFST+2,sp)
1337  02a2 c750c4        	ld	20676,a
1339  02a5 2003          	jra	L305
1340  02a7               L774:
1341                     ; 376       DownCounter--;
1343  02a7 5a            	decw	x
1344  02a8 1f03          	ldw	(OFST-1,sp),x
1346  02aa               L305:
1347                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1349  02aa 720750c504    	btjf	20677,#3,L705
1351  02af 1e03          	ldw	x,(OFST-1,sp)
1352  02b1 26f4          	jrne	L774
1353  02b3               L705:
1354                     ; 379     if(DownCounter != 0)
1356  02b3 1e03          	ldw	x,(OFST-1,sp)
1357  02b5 27c7          	jreq	L564
1358                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1360  02b7 721250c5      	bset	20677,#1
1361                     ; 383       Swif = SUCCESS;
1363  02bb               LC004:
1365  02bb a601          	ld	a,#1
1366  02bd 6b02          	ld	(OFST-2,sp),a
1369  02bf 20bf          	jra	L174
1370                     ; 387       Swif = ERROR;
1371  02c1               L715:
1372                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1374  02c1 7b0a          	ld	a,(OFST+6,sp)
1375  02c3 260c          	jrne	L325
1377  02c5 7b01          	ld	a,(OFST-3,sp)
1378  02c7 a1d2          	cp	a,#210
1379  02c9 2606          	jrne	L325
1380                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1382  02cb 721750c0      	bres	20672,#3
1384  02cf 200e          	jra	L515
1385  02d1               L325:
1386                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1388  02d1 7b0a          	ld	a,(OFST+6,sp)
1389  02d3 260a          	jrne	L515
1391  02d5 7b01          	ld	a,(OFST-3,sp)
1392  02d7 a1b4          	cp	a,#180
1393  02d9 2604          	jrne	L515
1394                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1396  02db 721150c1      	bres	20673,#0
1397  02df               L515:
1398                     ; 406   return(Swif);
1400  02df 7b02          	ld	a,(OFST-2,sp)
1403  02e1 5b06          	addw	sp,#6
1404  02e3 81            	ret	
1543                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1543                     ; 416 {
1544                     	switch	.text
1545  02e4               _CLK_HSIPrescalerConfig:
1547  02e4 88            	push	a
1548       00000000      OFST:	set	0
1551                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1553  02e5 4d            	tnz	a
1554  02e6 271a          	jreq	L622
1555  02e8 a108          	cp	a,#8
1556  02ea 2716          	jreq	L622
1557  02ec a110          	cp	a,#16
1558  02ee 2712          	jreq	L622
1559  02f0 a118          	cp	a,#24
1560  02f2 270e          	jreq	L622
1561  02f4 ae01a2        	ldw	x,#418
1562  02f7 89            	pushw	x
1563  02f8 5f            	clrw	x
1564  02f9 89            	pushw	x
1565  02fa ae000c        	ldw	x,#L75
1566  02fd cd0000        	call	_assert_failed
1568  0300 5b04          	addw	sp,#4
1569  0302               L622:
1570                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1572  0302 c650c6        	ld	a,20678
1573  0305 a4e7          	and	a,#231
1574  0307 c750c6        	ld	20678,a
1575                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1577  030a c650c6        	ld	a,20678
1578  030d 1a01          	or	a,(OFST+1,sp)
1579  030f c750c6        	ld	20678,a
1580                     ; 425 }
1583  0312 84            	pop	a
1584  0313 81            	ret	
1720                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1720                     ; 437 {
1721                     	switch	.text
1722  0314               _CLK_CCOConfig:
1724  0314 88            	push	a
1725       00000000      OFST:	set	0
1728                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1730  0315 4d            	tnz	a
1731  0316 273e          	jreq	L042
1732  0318 a104          	cp	a,#4
1733  031a 273a          	jreq	L042
1734  031c a102          	cp	a,#2
1735  031e 2736          	jreq	L042
1736  0320 a108          	cp	a,#8
1737  0322 2732          	jreq	L042
1738  0324 a10a          	cp	a,#10
1739  0326 272e          	jreq	L042
1740  0328 a10c          	cp	a,#12
1741  032a 272a          	jreq	L042
1742  032c a10e          	cp	a,#14
1743  032e 2726          	jreq	L042
1744  0330 a110          	cp	a,#16
1745  0332 2722          	jreq	L042
1746  0334 a112          	cp	a,#18
1747  0336 271e          	jreq	L042
1748  0338 a114          	cp	a,#20
1749  033a 271a          	jreq	L042
1750  033c a116          	cp	a,#22
1751  033e 2716          	jreq	L042
1752  0340 a118          	cp	a,#24
1753  0342 2712          	jreq	L042
1754  0344 a11a          	cp	a,#26
1755  0346 270e          	jreq	L042
1756  0348 ae01b7        	ldw	x,#439
1757  034b 89            	pushw	x
1758  034c 5f            	clrw	x
1759  034d 89            	pushw	x
1760  034e ae000c        	ldw	x,#L75
1761  0351 cd0000        	call	_assert_failed
1763  0354 5b04          	addw	sp,#4
1764  0356               L042:
1765                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1767  0356 c650c9        	ld	a,20681
1768  0359 a4e1          	and	a,#225
1769  035b c750c9        	ld	20681,a
1770                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1772  035e c650c9        	ld	a,20681
1773  0361 1a01          	or	a,(OFST+1,sp)
1774  0363 c750c9        	ld	20681,a
1775                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1777  0366 721050c9      	bset	20681,#0
1778                     ; 449 }
1781  036a 84            	pop	a
1782  036b 81            	ret	
1848                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1848                     ; 460 {
1849                     	switch	.text
1850  036c               _CLK_ITConfig:
1852  036c 89            	pushw	x
1853       00000000      OFST:	set	0
1856                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1858  036d 9f            	ld	a,xl
1859  036e 4d            	tnz	a
1860  036f 2712          	jreq	L252
1861  0371 9f            	ld	a,xl
1862  0372 4a            	dec	a
1863  0373 270e          	jreq	L252
1864  0375 ae01ce        	ldw	x,#462
1865  0378 89            	pushw	x
1866  0379 5f            	clrw	x
1867  037a 89            	pushw	x
1868  037b ae000c        	ldw	x,#L75
1869  037e cd0000        	call	_assert_failed
1871  0381 5b04          	addw	sp,#4
1872  0383               L252:
1873                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1875  0383 7b01          	ld	a,(OFST+1,sp)
1876  0385 a10c          	cp	a,#12
1877  0387 2712          	jreq	L262
1878  0389 a11c          	cp	a,#28
1879  038b 270e          	jreq	L262
1880  038d ae01cf        	ldw	x,#463
1881  0390 89            	pushw	x
1882  0391 5f            	clrw	x
1883  0392 89            	pushw	x
1884  0393 ae000c        	ldw	x,#L75
1885  0396 cd0000        	call	_assert_failed
1887  0399 5b04          	addw	sp,#4
1888  039b               L262:
1889                     ; 465   if (NewState != DISABLE)
1891  039b 7b02          	ld	a,(OFST+2,sp)
1892  039d 2716          	jreq	L527
1893                     ; 467     switch (CLK_IT)
1895  039f 7b01          	ld	a,(OFST+1,sp)
1897                     ; 475     default:
1897                     ; 476       break;
1898  03a1 a00c          	sub	a,#12
1899  03a3 270a          	jreq	L166
1900  03a5 a010          	sub	a,#16
1901  03a7 2620          	jrne	L337
1902                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1902                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1904  03a9 721450c5      	bset	20677,#2
1905                     ; 471       break;
1907  03ad 201a          	jra	L337
1908  03af               L166:
1909                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1909                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1911  03af 721450c8      	bset	20680,#2
1912                     ; 474       break;
1914  03b3 2014          	jra	L337
1915                     ; 475     default:
1915                     ; 476       break;
1918  03b5               L527:
1919                     ; 481     switch (CLK_IT)
1921  03b5 7b01          	ld	a,(OFST+1,sp)
1923                     ; 489     default:
1923                     ; 490       break;
1924  03b7 a00c          	sub	a,#12
1925  03b9 270a          	jreq	L766
1926  03bb a010          	sub	a,#16
1927  03bd 260a          	jrne	L337
1928                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1928                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1930  03bf 721550c5      	bres	20677,#2
1931                     ; 485       break;
1933  03c3 2004          	jra	L337
1934  03c5               L766:
1935                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1935                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1937  03c5 721550c8      	bres	20680,#2
1938                     ; 488       break;
1939  03c9               L337:
1940                     ; 493 }
1943  03c9 85            	popw	x
1944  03ca 81            	ret	
1945                     ; 489     default:
1945                     ; 490       break;
1982                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1982                     ; 501 {
1983                     	switch	.text
1984  03cb               _CLK_SYSCLKConfig:
1986  03cb 88            	push	a
1987       00000000      OFST:	set	0
1990                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1992  03cc 4d            	tnz	a
1993  03cd 273a          	jreq	L472
1994  03cf a108          	cp	a,#8
1995  03d1 2736          	jreq	L472
1996  03d3 a110          	cp	a,#16
1997  03d5 2732          	jreq	L472
1998  03d7 a118          	cp	a,#24
1999  03d9 272e          	jreq	L472
2000  03db a180          	cp	a,#128
2001  03dd 272a          	jreq	L472
2002  03df a181          	cp	a,#129
2003  03e1 2726          	jreq	L472
2004  03e3 a182          	cp	a,#130
2005  03e5 2722          	jreq	L472
2006  03e7 a183          	cp	a,#131
2007  03e9 271e          	jreq	L472
2008  03eb a184          	cp	a,#132
2009  03ed 271a          	jreq	L472
2010  03ef a185          	cp	a,#133
2011  03f1 2716          	jreq	L472
2012  03f3 a186          	cp	a,#134
2013  03f5 2712          	jreq	L472
2014  03f7 a187          	cp	a,#135
2015  03f9 270e          	jreq	L472
2016  03fb ae01f7        	ldw	x,#503
2017  03fe 89            	pushw	x
2018  03ff 5f            	clrw	x
2019  0400 89            	pushw	x
2020  0401 ae000c        	ldw	x,#L75
2021  0404 cd0000        	call	_assert_failed
2023  0407 5b04          	addw	sp,#4
2024  0409               L472:
2025                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
2027  0409 7b01          	ld	a,(OFST+1,sp)
2028  040b 2b0e          	jrmi	L757
2029                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
2031  040d c650c6        	ld	a,20678
2032  0410 a4e7          	and	a,#231
2033  0412 c750c6        	ld	20678,a
2034                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
2036  0415 7b01          	ld	a,(OFST+1,sp)
2037  0417 a418          	and	a,#24
2039  0419 200c          	jra	L167
2040  041b               L757:
2041                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
2043  041b c650c6        	ld	a,20678
2044  041e a4f8          	and	a,#248
2045  0420 c750c6        	ld	20678,a
2046                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
2048  0423 7b01          	ld	a,(OFST+1,sp)
2049  0425 a407          	and	a,#7
2050  0427               L167:
2051  0427 ca50c6        	or	a,20678
2052  042a c750c6        	ld	20678,a
2053                     ; 515 }
2056  042d 84            	pop	a
2057  042e 81            	ret	
2114                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2114                     ; 524 {
2115                     	switch	.text
2116  042f               _CLK_SWIMConfig:
2118  042f 88            	push	a
2119       00000000      OFST:	set	0
2122                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2124  0430 4d            	tnz	a
2125  0431 2711          	jreq	L603
2126  0433 4a            	dec	a
2127  0434 270e          	jreq	L603
2128  0436 ae020e        	ldw	x,#526
2129  0439 89            	pushw	x
2130  043a 5f            	clrw	x
2131  043b 89            	pushw	x
2132  043c ae000c        	ldw	x,#L75
2133  043f cd0000        	call	_assert_failed
2135  0442 5b04          	addw	sp,#4
2136  0444               L603:
2137                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2139  0444 7b01          	ld	a,(OFST+1,sp)
2140  0446 2706          	jreq	L1101
2141                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2143  0448 721050cd      	bset	20685,#0
2145  044c 2004          	jra	L3101
2146  044e               L1101:
2147                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2149  044e 721150cd      	bres	20685,#0
2150  0452               L3101:
2151                     ; 538 }
2154  0452 84            	pop	a
2155  0453 81            	ret	
2179                     ; 547 void CLK_ClockSecuritySystemEnable(void)
2179                     ; 548 {
2180                     	switch	.text
2181  0454               _CLK_ClockSecuritySystemEnable:
2185                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
2187  0454 721050c8      	bset	20680,#0
2188                     ; 551 }
2191  0458 81            	ret	
2216                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2216                     ; 560 {
2217                     	switch	.text
2218  0459               _CLK_GetSYSCLKSource:
2222                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
2224  0459 c650c3        	ld	a,20675
2227  045c 81            	ret	
2284                     ; 569 uint32_t CLK_GetClockFreq(void)
2284                     ; 570 {
2285                     	switch	.text
2286  045d               _CLK_GetClockFreq:
2288  045d 5209          	subw	sp,#9
2289       00000009      OFST:	set	9
2292                     ; 571   uint32_t clockfrequency = 0;
2294                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2296                     ; 573   uint8_t tmp = 0, presc = 0;
2300                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2302  045f c650c3        	ld	a,20675
2303  0462 6b09          	ld	(OFST+0,sp),a
2305                     ; 578   if (clocksource == CLK_SOURCE_HSI)
2307  0464 a1e1          	cp	a,#225
2308  0466 2634          	jrne	L1601
2309                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2311  0468 c650c6        	ld	a,20678
2312  046b a418          	and	a,#24
2313  046d 44            	srl	a
2314  046e 44            	srl	a
2315  046f 44            	srl	a
2317                     ; 581     tmp = (uint8_t)(tmp >> 3);
2320                     ; 582     presc = HSIDivFactor[tmp];
2322  0470 5f            	clrw	x
2323  0471 97            	ld	xl,a
2324  0472 d60000        	ld	a,(_HSIDivFactor,x)
2325  0475 6b09          	ld	(OFST+0,sp),a
2327                     ; 583     clockfrequency = HSI_VALUE / presc;
2329  0477 b703          	ld	c_lreg+3,a
2330  0479 3f02          	clr	c_lreg+2
2331  047b 3f01          	clr	c_lreg+1
2332  047d 3f00          	clr	c_lreg
2333  047f 96            	ldw	x,sp
2334  0480 5c            	incw	x
2335  0481 cd0000        	call	c_rtol
2338  0484 ae2400        	ldw	x,#9216
2339  0487 bf02          	ldw	c_lreg+2,x
2340  0489 ae00f4        	ldw	x,#244
2341  048c bf00          	ldw	c_lreg,x
2342  048e 96            	ldw	x,sp
2343  048f 5c            	incw	x
2344  0490 cd0000        	call	c_ludv
2346  0493 96            	ldw	x,sp
2347  0494 1c0005        	addw	x,#OFST-4
2348  0497 cd0000        	call	c_rtol
2352  049a 2018          	jra	L3601
2353  049c               L1601:
2354                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2356  049c a1d2          	cp	a,#210
2357  049e 260a          	jrne	L5601
2358                     ; 587     clockfrequency = LSI_VALUE;
2360  04a0 aef400        	ldw	x,#62464
2361  04a3 1f07          	ldw	(OFST-2,sp),x
2362  04a5 ae0001        	ldw	x,#1
2364  04a8 2008          	jp	LC005
2365  04aa               L5601:
2366                     ; 591     clockfrequency = HSE_VALUE;
2368  04aa ae2400        	ldw	x,#9216
2369  04ad 1f07          	ldw	(OFST-2,sp),x
2370  04af ae00f4        	ldw	x,#244
2371  04b2               LC005:
2372  04b2 1f05          	ldw	(OFST-4,sp),x
2374  04b4               L3601:
2375                     ; 594   return((uint32_t)clockfrequency);
2377  04b4 96            	ldw	x,sp
2378  04b5 1c0005        	addw	x,#OFST-4
2379  04b8 cd0000        	call	c_ltor
2383  04bb 5b09          	addw	sp,#9
2384  04bd 81            	ret	
2484                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2484                     ; 605 {
2485                     	switch	.text
2486  04be               _CLK_AdjustHSICalibrationValue:
2488  04be 88            	push	a
2489       00000000      OFST:	set	0
2492                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2494  04bf 4d            	tnz	a
2495  04c0 272a          	jreq	L623
2496  04c2 a101          	cp	a,#1
2497  04c4 2726          	jreq	L623
2498  04c6 a102          	cp	a,#2
2499  04c8 2722          	jreq	L623
2500  04ca a103          	cp	a,#3
2501  04cc 271e          	jreq	L623
2502  04ce a104          	cp	a,#4
2503  04d0 271a          	jreq	L623
2504  04d2 a105          	cp	a,#5
2505  04d4 2716          	jreq	L623
2506  04d6 a106          	cp	a,#6
2507  04d8 2712          	jreq	L623
2508  04da a107          	cp	a,#7
2509  04dc 270e          	jreq	L623
2510  04de ae025f        	ldw	x,#607
2511  04e1 89            	pushw	x
2512  04e2 5f            	clrw	x
2513  04e3 89            	pushw	x
2514  04e4 ae000c        	ldw	x,#L75
2515  04e7 cd0000        	call	_assert_failed
2517  04ea 5b04          	addw	sp,#4
2518  04ec               L623:
2519                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2521  04ec c650cc        	ld	a,20684
2522  04ef a4f8          	and	a,#248
2523  04f1 1a01          	or	a,(OFST+1,sp)
2524  04f3 c750cc        	ld	20684,a
2525                     ; 611 }
2528  04f6 84            	pop	a
2529  04f7 81            	ret	
2553                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2553                     ; 623 {
2554                     	switch	.text
2555  04f8               _CLK_SYSCLKEmergencyClear:
2559                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2561  04f8 721150c5      	bres	20677,#0
2562                     ; 625 }
2565  04fc 81            	ret	
2715                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2715                     ; 635 {
2716                     	switch	.text
2717  04fd               _CLK_GetFlagStatus:
2719  04fd 89            	pushw	x
2720  04fe 5203          	subw	sp,#3
2721       00000003      OFST:	set	3
2724                     ; 636   uint16_t statusreg = 0;
2726                     ; 637   uint8_t tmpreg = 0;
2728                     ; 638   FlagStatus bitstatus = RESET;
2730                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2732  0500 a30110        	cpw	x,#272
2733  0503 2736          	jreq	L243
2734  0505 a30102        	cpw	x,#258
2735  0508 2731          	jreq	L243
2736  050a a30202        	cpw	x,#514
2737  050d 272c          	jreq	L243
2738  050f a30308        	cpw	x,#776
2739  0512 2727          	jreq	L243
2740  0514 a30301        	cpw	x,#769
2741  0517 2722          	jreq	L243
2742  0519 a30408        	cpw	x,#1032
2743  051c 271d          	jreq	L243
2744  051e a30402        	cpw	x,#1026
2745  0521 2718          	jreq	L243
2746  0523 a30504        	cpw	x,#1284
2747  0526 2713          	jreq	L243
2748  0528 a30502        	cpw	x,#1282
2749  052b 270e          	jreq	L243
2750  052d ae0281        	ldw	x,#641
2751  0530 89            	pushw	x
2752  0531 5f            	clrw	x
2753  0532 89            	pushw	x
2754  0533 ae000c        	ldw	x,#L75
2755  0536 cd0000        	call	_assert_failed
2757  0539 5b04          	addw	sp,#4
2758  053b               L243:
2759                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2761  053b 7b04          	ld	a,(OFST+1,sp)
2762  053d 97            	ld	xl,a
2763  053e 4f            	clr	a
2764  053f 02            	rlwa	x,a
2765  0540 1f01          	ldw	(OFST-2,sp),x
2767                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2769  0542 a30100        	cpw	x,#256
2770  0545 2605          	jrne	L7221
2771                     ; 649     tmpreg = CLK->ICKR;
2773  0547 c650c0        	ld	a,20672
2775  054a 2021          	jra	L1321
2776  054c               L7221:
2777                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2779  054c a30200        	cpw	x,#512
2780  054f 2605          	jrne	L3321
2781                     ; 653     tmpreg = CLK->ECKR;
2783  0551 c650c1        	ld	a,20673
2785  0554 2017          	jra	L1321
2786  0556               L3321:
2787                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2789  0556 a30300        	cpw	x,#768
2790  0559 2605          	jrne	L7321
2791                     ; 657     tmpreg = CLK->SWCR;
2793  055b c650c5        	ld	a,20677
2795  055e 200d          	jra	L1321
2796  0560               L7321:
2797                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2799  0560 a30400        	cpw	x,#1024
2800  0563 2605          	jrne	L3421
2801                     ; 661     tmpreg = CLK->CSSR;
2803  0565 c650c8        	ld	a,20680
2805  0568 2003          	jra	L1321
2806  056a               L3421:
2807                     ; 665     tmpreg = CLK->CCOR;
2809  056a c650c9        	ld	a,20681
2810  056d               L1321:
2811  056d 6b03          	ld	(OFST+0,sp),a
2813                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2815  056f 7b05          	ld	a,(OFST+2,sp)
2816  0571 1503          	bcp	a,(OFST+0,sp)
2817  0573 2704          	jreq	L7421
2818                     ; 670     bitstatus = SET;
2820  0575 a601          	ld	a,#1
2823  0577 2001          	jra	L1521
2824  0579               L7421:
2825                     ; 674     bitstatus = RESET;
2827  0579 4f            	clr	a
2829  057a               L1521:
2830                     ; 678   return((FlagStatus)bitstatus);
2834  057a 5b05          	addw	sp,#5
2835  057c 81            	ret	
2882                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2882                     ; 688 {
2883                     	switch	.text
2884  057d               _CLK_GetITStatus:
2886  057d 88            	push	a
2887  057e 88            	push	a
2888       00000001      OFST:	set	1
2891                     ; 689   ITStatus bitstatus = RESET;
2893                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2895  057f a10c          	cp	a,#12
2896  0581 2712          	jreq	L453
2897  0583 a11c          	cp	a,#28
2898  0585 270e          	jreq	L453
2899  0587 ae02b4        	ldw	x,#692
2900  058a 89            	pushw	x
2901  058b 5f            	clrw	x
2902  058c 89            	pushw	x
2903  058d ae000c        	ldw	x,#L75
2904  0590 cd0000        	call	_assert_failed
2906  0593 5b04          	addw	sp,#4
2907  0595               L453:
2908                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2910  0595 7b02          	ld	a,(OFST+1,sp)
2911  0597 a11c          	cp	a,#28
2912  0599 260b          	jrne	L5721
2913                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2915  059b c650c5        	ld	a,20677
2916  059e 1402          	and	a,(OFST+1,sp)
2917  05a0 a10c          	cp	a,#12
2918  05a2 260f          	jrne	L5031
2919                     ; 699       bitstatus = SET;
2921  05a4 2009          	jp	LC007
2922                     ; 703       bitstatus = RESET;
2923  05a6               L5721:
2924                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2926  05a6 c650c8        	ld	a,20680
2927  05a9 1402          	and	a,(OFST+1,sp)
2928  05ab a10c          	cp	a,#12
2929  05ad 2604          	jrne	L5031
2930                     ; 711       bitstatus = SET;
2932  05af               LC007:
2934  05af a601          	ld	a,#1
2937  05b1 2001          	jra	L3031
2938  05b3               L5031:
2939                     ; 715       bitstatus = RESET;
2942  05b3 4f            	clr	a
2944  05b4               L3031:
2945                     ; 720   return bitstatus;
2949  05b4 85            	popw	x
2950  05b5 81            	ret	
2987                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2987                     ; 730 {
2988                     	switch	.text
2989  05b6               _CLK_ClearITPendingBit:
2991  05b6 88            	push	a
2992       00000000      OFST:	set	0
2995                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2997  05b7 a10c          	cp	a,#12
2998  05b9 2712          	jreq	L663
2999  05bb a11c          	cp	a,#28
3000  05bd 270e          	jreq	L663
3001  05bf ae02dc        	ldw	x,#732
3002  05c2 89            	pushw	x
3003  05c3 5f            	clrw	x
3004  05c4 89            	pushw	x
3005  05c5 ae000c        	ldw	x,#L75
3006  05c8 cd0000        	call	_assert_failed
3008  05cb 5b04          	addw	sp,#4
3009  05cd               L663:
3010                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
3012  05cd 7b01          	ld	a,(OFST+1,sp)
3013  05cf a10c          	cp	a,#12
3014  05d1 2606          	jrne	L7231
3015                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
3017  05d3 721750c8      	bres	20680,#3
3019  05d7 2004          	jra	L1331
3020  05d9               L7231:
3021                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
3023  05d9 721750c5      	bres	20677,#3
3024  05dd               L1331:
3025                     ; 745 }
3028  05dd 84            	pop	a
3029  05de 81            	ret	
3064                     	xdef	_CLKPrescTable
3065                     	xdef	_HSIDivFactor
3066                     	xdef	_CLK_ClearITPendingBit
3067                     	xdef	_CLK_GetITStatus
3068                     	xdef	_CLK_GetFlagStatus
3069                     	xdef	_CLK_GetSYSCLKSource
3070                     	xdef	_CLK_GetClockFreq
3071                     	xdef	_CLK_AdjustHSICalibrationValue
3072                     	xdef	_CLK_SYSCLKEmergencyClear
3073                     	xdef	_CLK_ClockSecuritySystemEnable
3074                     	xdef	_CLK_SWIMConfig
3075                     	xdef	_CLK_SYSCLKConfig
3076                     	xdef	_CLK_ITConfig
3077                     	xdef	_CLK_CCOConfig
3078                     	xdef	_CLK_HSIPrescalerConfig
3079                     	xdef	_CLK_ClockSwitchConfig
3080                     	xdef	_CLK_PeripheralClockConfig
3081                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3082                     	xdef	_CLK_FastHaltWakeUpCmd
3083                     	xdef	_CLK_ClockSwitchCmd
3084                     	xdef	_CLK_CCOCmd
3085                     	xdef	_CLK_LSICmd
3086                     	xdef	_CLK_HSICmd
3087                     	xdef	_CLK_HSECmd
3088                     	xdef	_CLK_DeInit
3089                     	xref	_assert_failed
3090                     	switch	.const
3091  000c               L75:
3092  000c 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
3093  001e 697665725c73  	dc.b	"iver\src\stm8s_clk"
3094  0030 2e6300        	dc.b	".c",0
3095                     	xref.b	c_lreg
3096                     	xref.b	c_x
3116                     	xref	c_ltor
3117                     	xref	c_ludv
3118                     	xref	c_rtol
3119                     	end
