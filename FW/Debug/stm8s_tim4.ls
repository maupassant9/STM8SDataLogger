   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  44                     ; 49 void TIM4_DeInit(void)
  44                     ; 50 {
  46                     	switch	.text
  47  0000               _TIM4_DeInit:
  51                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  53  0000 725f5340      	clr	21312
  54                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  56  0004 725f5343      	clr	21315
  57                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  59  0008 725f5346      	clr	21318
  60                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  62  000c 725f5347      	clr	21319
  63                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  65  0010 35ff5348      	mov	21320,#255
  66                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  68  0014 725f5344      	clr	21316
  69                     ; 57 }
  72  0018 81            	ret	
 177                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 177                     ; 66 {
 178                     	switch	.text
 179  0019               _TIM4_TimeBaseInit:
 181  0019 89            	pushw	x
 182       00000000      OFST:	set	0
 185                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 187  001a 9e            	ld	a,xh
 188  001b 4d            	tnz	a
 189  001c 2730          	jreq	L41
 190  001e 9e            	ld	a,xh
 191  001f 4a            	dec	a
 192  0020 272c          	jreq	L41
 193  0022 9e            	ld	a,xh
 194  0023 a102          	cp	a,#2
 195  0025 2727          	jreq	L41
 196  0027 9e            	ld	a,xh
 197  0028 a103          	cp	a,#3
 198  002a 2722          	jreq	L41
 199  002c 9e            	ld	a,xh
 200  002d a104          	cp	a,#4
 201  002f 271d          	jreq	L41
 202  0031 9e            	ld	a,xh
 203  0032 a105          	cp	a,#5
 204  0034 2718          	jreq	L41
 205  0036 9e            	ld	a,xh
 206  0037 a106          	cp	a,#6
 207  0039 2713          	jreq	L41
 208  003b 9e            	ld	a,xh
 209  003c a107          	cp	a,#7
 210  003e 270e          	jreq	L41
 211  0040 ae0044        	ldw	x,#68
 212  0043 89            	pushw	x
 213  0044 5f            	clrw	x
 214  0045 89            	pushw	x
 215  0046 ae0000        	ldw	x,#L56
 216  0049 cd0000        	call	_assert_failed
 218  004c 5b04          	addw	sp,#4
 219  004e               L41:
 220                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 222  004e 7b01          	ld	a,(OFST+1,sp)
 223  0050 c75347        	ld	21319,a
 224                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 226  0053 7b02          	ld	a,(OFST+2,sp)
 227  0055 c75348        	ld	21320,a
 228                     ; 73 }
 231  0058 85            	popw	x
 232  0059 81            	ret	
 288                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 288                     ; 82 {
 289                     	switch	.text
 290  005a               _TIM4_Cmd:
 292  005a 88            	push	a
 293       00000000      OFST:	set	0
 296                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 298  005b 4d            	tnz	a
 299  005c 2711          	jreq	L62
 300  005e 4a            	dec	a
 301  005f 270e          	jreq	L62
 302  0061 ae0054        	ldw	x,#84
 303  0064 89            	pushw	x
 304  0065 5f            	clrw	x
 305  0066 89            	pushw	x
 306  0067 ae0000        	ldw	x,#L56
 307  006a cd0000        	call	_assert_failed
 309  006d 5b04          	addw	sp,#4
 310  006f               L62:
 311                     ; 87   if (NewState != DISABLE)
 313  006f 7b01          	ld	a,(OFST+1,sp)
 314  0071 2706          	jreq	L511
 315                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 317  0073 72105340      	bset	21312,#0
 319  0077 2004          	jra	L711
 320  0079               L511:
 321                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 323  0079 72115340      	bres	21312,#0
 324  007d               L711:
 325                     ; 95 }
 328  007d 84            	pop	a
 329  007e 81            	ret	
 388                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 388                     ; 108 {
 389                     	switch	.text
 390  007f               _TIM4_ITConfig:
 392  007f 89            	pushw	x
 393       00000000      OFST:	set	0
 396                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 398  0080 9e            	ld	a,xh
 399  0081 4a            	dec	a
 400  0082 270e          	jreq	L63
 401  0084 ae006e        	ldw	x,#110
 402  0087 89            	pushw	x
 403  0088 5f            	clrw	x
 404  0089 89            	pushw	x
 405  008a ae0000        	ldw	x,#L56
 406  008d cd0000        	call	_assert_failed
 408  0090 5b04          	addw	sp,#4
 409  0092               L63:
 410                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 412  0092 7b02          	ld	a,(OFST+2,sp)
 413  0094 2711          	jreq	L64
 414  0096 4a            	dec	a
 415  0097 270e          	jreq	L64
 416  0099 ae006f        	ldw	x,#111
 417  009c 89            	pushw	x
 418  009d 5f            	clrw	x
 419  009e 89            	pushw	x
 420  009f ae0000        	ldw	x,#L56
 421  00a2 cd0000        	call	_assert_failed
 423  00a5 5b04          	addw	sp,#4
 424  00a7               L64:
 425                     ; 113   if (NewState != DISABLE)
 427  00a7 7b02          	ld	a,(OFST+2,sp)
 428  00a9 2707          	jreq	L151
 429                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 431  00ab c65343        	ld	a,21315
 432  00ae 1a01          	or	a,(OFST+1,sp)
 434  00b0 2006          	jra	L351
 435  00b2               L151:
 436                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 438  00b2 7b01          	ld	a,(OFST+1,sp)
 439  00b4 43            	cpl	a
 440  00b5 c45343        	and	a,21315
 441  00b8               L351:
 442  00b8 c75343        	ld	21315,a
 443                     ; 123 }
 446  00bb 85            	popw	x
 447  00bc 81            	ret	
 484                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 484                     ; 132 {
 485                     	switch	.text
 486  00bd               _TIM4_UpdateDisableConfig:
 488  00bd 88            	push	a
 489       00000000      OFST:	set	0
 492                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 494  00be 4d            	tnz	a
 495  00bf 2711          	jreq	L06
 496  00c1 4a            	dec	a
 497  00c2 270e          	jreq	L06
 498  00c4 ae0086        	ldw	x,#134
 499  00c7 89            	pushw	x
 500  00c8 5f            	clrw	x
 501  00c9 89            	pushw	x
 502  00ca ae0000        	ldw	x,#L56
 503  00cd cd0000        	call	_assert_failed
 505  00d0 5b04          	addw	sp,#4
 506  00d2               L06:
 507                     ; 137   if (NewState != DISABLE)
 509  00d2 7b01          	ld	a,(OFST+1,sp)
 510  00d4 2706          	jreq	L371
 511                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 513  00d6 72125340      	bset	21312,#1
 515  00da 2004          	jra	L571
 516  00dc               L371:
 517                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 519  00dc 72135340      	bres	21312,#1
 520  00e0               L571:
 521                     ; 145 }
 524  00e0 84            	pop	a
 525  00e1 81            	ret	
 584                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 584                     ; 156 {
 585                     	switch	.text
 586  00e2               _TIM4_UpdateRequestConfig:
 588  00e2 88            	push	a
 589       00000000      OFST:	set	0
 592                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 594  00e3 4d            	tnz	a
 595  00e4 2711          	jreq	L27
 596  00e6 4a            	dec	a
 597  00e7 270e          	jreq	L27
 598  00e9 ae009e        	ldw	x,#158
 599  00ec 89            	pushw	x
 600  00ed 5f            	clrw	x
 601  00ee 89            	pushw	x
 602  00ef ae0000        	ldw	x,#L56
 603  00f2 cd0000        	call	_assert_failed
 605  00f5 5b04          	addw	sp,#4
 606  00f7               L27:
 607                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 609  00f7 7b01          	ld	a,(OFST+1,sp)
 610  00f9 2706          	jreq	L522
 611                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 613  00fb 72145340      	bset	21312,#2
 615  00ff 2004          	jra	L722
 616  0101               L522:
 617                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 619  0101 72155340      	bres	21312,#2
 620  0105               L722:
 621                     ; 169 }
 624  0105 84            	pop	a
 625  0106 81            	ret	
 683                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 683                     ; 180 {
 684                     	switch	.text
 685  0107               _TIM4_SelectOnePulseMode:
 687  0107 88            	push	a
 688       00000000      OFST:	set	0
 691                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 693  0108 a101          	cp	a,#1
 694  010a 2711          	jreq	L401
 695  010c 4d            	tnz	a
 696  010d 270e          	jreq	L401
 697  010f ae00b6        	ldw	x,#182
 698  0112 89            	pushw	x
 699  0113 5f            	clrw	x
 700  0114 89            	pushw	x
 701  0115 ae0000        	ldw	x,#L56
 702  0118 cd0000        	call	_assert_failed
 704  011b 5b04          	addw	sp,#4
 705  011d               L401:
 706                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 708  011d 7b01          	ld	a,(OFST+1,sp)
 709  011f 2706          	jreq	L752
 710                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 712  0121 72165340      	bset	21312,#3
 714  0125 2004          	jra	L162
 715  0127               L752:
 716                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 718  0127 72175340      	bres	21312,#3
 719  012b               L162:
 720                     ; 193 }
 723  012b 84            	pop	a
 724  012c 81            	ret	
 793                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 793                     ; 216 {
 794                     	switch	.text
 795  012d               _TIM4_PrescalerConfig:
 797  012d 89            	pushw	x
 798       00000000      OFST:	set	0
 801                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 803  012e 9f            	ld	a,xl
 804  012f 4d            	tnz	a
 805  0130 2712          	jreq	L611
 806  0132 9f            	ld	a,xl
 807  0133 4a            	dec	a
 808  0134 270e          	jreq	L611
 809  0136 ae00da        	ldw	x,#218
 810  0139 89            	pushw	x
 811  013a 5f            	clrw	x
 812  013b 89            	pushw	x
 813  013c ae0000        	ldw	x,#L56
 814  013f cd0000        	call	_assert_failed
 816  0142 5b04          	addw	sp,#4
 817  0144               L611:
 818                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 820  0144 7b01          	ld	a,(OFST+1,sp)
 821  0146 272c          	jreq	L621
 822  0148 a101          	cp	a,#1
 823  014a 2728          	jreq	L621
 824  014c a102          	cp	a,#2
 825  014e 2724          	jreq	L621
 826  0150 a103          	cp	a,#3
 827  0152 2720          	jreq	L621
 828  0154 a104          	cp	a,#4
 829  0156 271c          	jreq	L621
 830  0158 a105          	cp	a,#5
 831  015a 2718          	jreq	L621
 832  015c a106          	cp	a,#6
 833  015e 2714          	jreq	L621
 834  0160 a107          	cp	a,#7
 835  0162 2710          	jreq	L621
 836  0164 ae00db        	ldw	x,#219
 837  0167 89            	pushw	x
 838  0168 5f            	clrw	x
 839  0169 89            	pushw	x
 840  016a ae0000        	ldw	x,#L56
 841  016d cd0000        	call	_assert_failed
 843  0170 5b04          	addw	sp,#4
 844  0172 7b01          	ld	a,(OFST+1,sp)
 845  0174               L621:
 846                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 848  0174 c75347        	ld	21319,a
 849                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 851  0177 7b02          	ld	a,(OFST+2,sp)
 852  0179 c75345        	ld	21317,a
 853                     ; 226 }
 856  017c 85            	popw	x
 857  017d 81            	ret	
 894                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 894                     ; 235 {
 895                     	switch	.text
 896  017e               _TIM4_ARRPreloadConfig:
 898  017e 88            	push	a
 899       00000000      OFST:	set	0
 902                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 904  017f 4d            	tnz	a
 905  0180 2711          	jreq	L041
 906  0182 4a            	dec	a
 907  0183 270e          	jreq	L041
 908  0185 ae00ed        	ldw	x,#237
 909  0188 89            	pushw	x
 910  0189 5f            	clrw	x
 911  018a 89            	pushw	x
 912  018b ae0000        	ldw	x,#L56
 913  018e cd0000        	call	_assert_failed
 915  0191 5b04          	addw	sp,#4
 916  0193               L041:
 917                     ; 240   if (NewState != DISABLE)
 919  0193 7b01          	ld	a,(OFST+1,sp)
 920  0195 2706          	jreq	L333
 921                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 923  0197 721e5340      	bset	21312,#7
 925  019b 2004          	jra	L533
 926  019d               L333:
 927                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 929  019d 721f5340      	bres	21312,#7
 930  01a1               L533:
 931                     ; 248 }
 934  01a1 84            	pop	a
 935  01a2 81            	ret	
 985                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 985                     ; 258 {
 986                     	switch	.text
 987  01a3               _TIM4_GenerateEvent:
 989  01a3 88            	push	a
 990       00000000      OFST:	set	0
 993                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 995  01a4 4a            	dec	a
 996  01a5 270e          	jreq	L051
 997  01a7 ae0104        	ldw	x,#260
 998  01aa 89            	pushw	x
 999  01ab 5f            	clrw	x
1000  01ac 89            	pushw	x
1001  01ad ae0000        	ldw	x,#L56
1002  01b0 cd0000        	call	_assert_failed
1004  01b3 5b04          	addw	sp,#4
1005  01b5               L051:
1006                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
1008  01b5 7b01          	ld	a,(OFST+1,sp)
1009  01b7 c75345        	ld	21317,a
1010                     ; 264 }
1013  01ba 84            	pop	a
1014  01bb 81            	ret	
1046                     ; 272 void TIM4_SetCounter(uint8_t Counter)
1046                     ; 273 {
1047                     	switch	.text
1048  01bc               _TIM4_SetCounter:
1052                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
1054  01bc c75346        	ld	21318,a
1055                     ; 276 }
1058  01bf 81            	ret	
1090                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
1090                     ; 285 {
1091                     	switch	.text
1092  01c0               _TIM4_SetAutoreload:
1096                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
1098  01c0 c75348        	ld	21320,a
1099                     ; 288 }
1102  01c3 81            	ret	
1125                     ; 295 uint8_t TIM4_GetCounter(void)
1125                     ; 296 {
1126                     	switch	.text
1127  01c4               _TIM4_GetCounter:
1131                     ; 298   return (uint8_t)(TIM4->CNTR);
1133  01c4 c65346        	ld	a,21318
1136  01c7 81            	ret	
1160                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1160                     ; 307 {
1161                     	switch	.text
1162  01c8               _TIM4_GetPrescaler:
1166                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
1168  01c8 c65347        	ld	a,21319
1171  01cb 81            	ret	
1251                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1251                     ; 320 {
1252                     	switch	.text
1253  01cc               _TIM4_GetFlagStatus:
1255  01cc 88            	push	a
1256  01cd 88            	push	a
1257       00000001      OFST:	set	1
1260                     ; 321   FlagStatus bitstatus = RESET;
1262                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1264  01ce 4a            	dec	a
1265  01cf 270e          	jreq	L071
1266  01d1 ae0144        	ldw	x,#324
1267  01d4 89            	pushw	x
1268  01d5 5f            	clrw	x
1269  01d6 89            	pushw	x
1270  01d7 ae0000        	ldw	x,#L56
1271  01da cd0000        	call	_assert_failed
1273  01dd 5b04          	addw	sp,#4
1274  01df               L071:
1275                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1277  01df c65344        	ld	a,21316
1278  01e2 1502          	bcp	a,(OFST+1,sp)
1279  01e4 2704          	jreq	L374
1280                     ; 328     bitstatus = SET;
1282  01e6 a601          	ld	a,#1
1285  01e8 2001          	jra	L574
1286  01ea               L374:
1287                     ; 332     bitstatus = RESET;
1289  01ea 4f            	clr	a
1291  01eb               L574:
1292                     ; 334   return ((FlagStatus)bitstatus);
1296  01eb 85            	popw	x
1297  01ec 81            	ret	
1333                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1333                     ; 345 {
1334                     	switch	.text
1335  01ed               _TIM4_ClearFlag:
1337  01ed 88            	push	a
1338       00000000      OFST:	set	0
1341                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1343  01ee 4a            	dec	a
1344  01ef 270e          	jreq	L002
1345  01f1 ae015b        	ldw	x,#347
1346  01f4 89            	pushw	x
1347  01f5 5f            	clrw	x
1348  01f6 89            	pushw	x
1349  01f7 ae0000        	ldw	x,#L56
1350  01fa cd0000        	call	_assert_failed
1352  01fd 5b04          	addw	sp,#4
1353  01ff               L002:
1354                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1356  01ff 7b01          	ld	a,(OFST+1,sp)
1357  0201 43            	cpl	a
1358  0202 c75344        	ld	21316,a
1359                     ; 351 }
1362  0205 84            	pop	a
1363  0206 81            	ret	
1424                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1424                     ; 361 {
1425                     	switch	.text
1426  0207               _TIM4_GetITStatus:
1428  0207 88            	push	a
1429  0208 89            	pushw	x
1430       00000002      OFST:	set	2
1433                     ; 362   ITStatus bitstatus = RESET;
1435                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1439                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1441  0209 4a            	dec	a
1442  020a 270e          	jreq	L012
1443  020c ae016f        	ldw	x,#367
1444  020f 89            	pushw	x
1445  0210 5f            	clrw	x
1446  0211 89            	pushw	x
1447  0212 ae0000        	ldw	x,#L56
1448  0215 cd0000        	call	_assert_failed
1450  0218 5b04          	addw	sp,#4
1451  021a               L012:
1452                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1454  021a c65344        	ld	a,21316
1455  021d 1403          	and	a,(OFST+1,sp)
1456  021f 6b01          	ld	(OFST-1,sp),a
1458                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1460  0221 c65343        	ld	a,21315
1461  0224 1403          	and	a,(OFST+1,sp)
1462  0226 6b02          	ld	(OFST+0,sp),a
1464                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1466  0228 7b01          	ld	a,(OFST-1,sp)
1467  022a 2708          	jreq	L345
1469  022c 7b02          	ld	a,(OFST+0,sp)
1470  022e 2704          	jreq	L345
1471                     ; 375     bitstatus = (ITStatus)SET;
1473  0230 a601          	ld	a,#1
1476  0232 2001          	jra	L545
1477  0234               L345:
1478                     ; 379     bitstatus = (ITStatus)RESET;
1480  0234 4f            	clr	a
1482  0235               L545:
1483                     ; 381   return ((ITStatus)bitstatus);
1487  0235 5b03          	addw	sp,#3
1488  0237 81            	ret	
1525                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1525                     ; 392 {
1526                     	switch	.text
1527  0238               _TIM4_ClearITPendingBit:
1529  0238 88            	push	a
1530       00000000      OFST:	set	0
1533                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1535  0239 4a            	dec	a
1536  023a 270e          	jreq	L022
1537  023c ae018a        	ldw	x,#394
1538  023f 89            	pushw	x
1539  0240 5f            	clrw	x
1540  0241 89            	pushw	x
1541  0242 ae0000        	ldw	x,#L56
1542  0245 cd0000        	call	_assert_failed
1544  0248 5b04          	addw	sp,#4
1545  024a               L022:
1546                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1548  024a 7b01          	ld	a,(OFST+1,sp)
1549  024c 43            	cpl	a
1550  024d c75344        	ld	21316,a
1551                     ; 398 }
1554  0250 84            	pop	a
1555  0251 81            	ret	
1568                     	xdef	_TIM4_ClearITPendingBit
1569                     	xdef	_TIM4_GetITStatus
1570                     	xdef	_TIM4_ClearFlag
1571                     	xdef	_TIM4_GetFlagStatus
1572                     	xdef	_TIM4_GetPrescaler
1573                     	xdef	_TIM4_GetCounter
1574                     	xdef	_TIM4_SetAutoreload
1575                     	xdef	_TIM4_SetCounter
1576                     	xdef	_TIM4_GenerateEvent
1577                     	xdef	_TIM4_ARRPreloadConfig
1578                     	xdef	_TIM4_PrescalerConfig
1579                     	xdef	_TIM4_SelectOnePulseMode
1580                     	xdef	_TIM4_UpdateRequestConfig
1581                     	xdef	_TIM4_UpdateDisableConfig
1582                     	xdef	_TIM4_ITConfig
1583                     	xdef	_TIM4_Cmd
1584                     	xdef	_TIM4_TimeBaseInit
1585                     	xdef	_TIM4_DeInit
1586                     	xref	_assert_failed
1587                     .const:	section	.text
1588  0000               L56:
1589  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
1590  0012 697665725c73  	dc.b	"iver\src\stm8s_tim"
1591  0024 342e6300      	dc.b	"4.c",0
1611                     	end
