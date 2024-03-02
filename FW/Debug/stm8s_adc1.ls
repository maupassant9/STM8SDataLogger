   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  44                     ; 52 void ADC1_DeInit(void)
  44                     ; 53 {
  46                     	switch	.text
  47  0000               _ADC1_DeInit:
  51                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  53  0000 725f5400      	clr	21504
  54                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  56  0004 725f5401      	clr	21505
  57                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  59  0008 725f5402      	clr	21506
  60                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  62  000c 725f5403      	clr	21507
  63                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  65  0010 725f5406      	clr	21510
  66                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  68  0014 725f5407      	clr	21511
  69                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  71  0018 35ff5408      	mov	21512,#255
  72                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  74  001c 35035409      	mov	21513,#3
  75                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  77  0020 725f540a      	clr	21514
  78                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  80  0024 725f540b      	clr	21515
  81                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  83  0028 725f540e      	clr	21518
  84                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  86  002c 725f540f      	clr	21519
  87                     ; 66 }
  90  0030 81            	ret	
 542                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 542                     ; 89 {
 543                     	switch	.text
 544  0031               _ADC1_Init:
 546  0031 89            	pushw	x
 547       00000000      OFST:	set	0
 550                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 552  0032 9e            	ld	a,xh
 553  0033 4d            	tnz	a
 554  0034 2712          	jreq	L41
 555  0036 9e            	ld	a,xh
 556  0037 4a            	dec	a
 557  0038 270e          	jreq	L41
 558  003a ae005b        	ldw	x,#91
 559  003d 89            	pushw	x
 560  003e 5f            	clrw	x
 561  003f 89            	pushw	x
 562  0040 ae0000        	ldw	x,#L542
 563  0043 cd0000        	call	_assert_failed
 565  0046 5b04          	addw	sp,#4
 566  0048               L41:
 567                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 569  0048 7b02          	ld	a,(OFST+2,sp)
 570  004a 2736          	jreq	L42
 571  004c a101          	cp	a,#1
 572  004e 2732          	jreq	L42
 573  0050 a102          	cp	a,#2
 574  0052 272e          	jreq	L42
 575  0054 a103          	cp	a,#3
 576  0056 272a          	jreq	L42
 577  0058 a104          	cp	a,#4
 578  005a 2726          	jreq	L42
 579  005c a105          	cp	a,#5
 580  005e 2722          	jreq	L42
 581  0060 a106          	cp	a,#6
 582  0062 271e          	jreq	L42
 583  0064 a107          	cp	a,#7
 584  0066 271a          	jreq	L42
 585  0068 a108          	cp	a,#8
 586  006a 2716          	jreq	L42
 587  006c a10c          	cp	a,#12
 588  006e 2712          	jreq	L42
 589  0070 a109          	cp	a,#9
 590  0072 270e          	jreq	L42
 591  0074 ae005c        	ldw	x,#92
 592  0077 89            	pushw	x
 593  0078 5f            	clrw	x
 594  0079 89            	pushw	x
 595  007a ae0000        	ldw	x,#L542
 596  007d cd0000        	call	_assert_failed
 598  0080 5b04          	addw	sp,#4
 599  0082               L42:
 600                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 602  0082 7b05          	ld	a,(OFST+5,sp)
 603  0084 272a          	jreq	L43
 604  0086 a110          	cp	a,#16
 605  0088 2726          	jreq	L43
 606  008a a120          	cp	a,#32
 607  008c 2722          	jreq	L43
 608  008e a130          	cp	a,#48
 609  0090 271e          	jreq	L43
 610  0092 a140          	cp	a,#64
 611  0094 271a          	jreq	L43
 612  0096 a150          	cp	a,#80
 613  0098 2716          	jreq	L43
 614  009a a160          	cp	a,#96
 615  009c 2712          	jreq	L43
 616  009e a170          	cp	a,#112
 617  00a0 270e          	jreq	L43
 618  00a2 ae005d        	ldw	x,#93
 619  00a5 89            	pushw	x
 620  00a6 5f            	clrw	x
 621  00a7 89            	pushw	x
 622  00a8 ae0000        	ldw	x,#L542
 623  00ab cd0000        	call	_assert_failed
 625  00ae 5b04          	addw	sp,#4
 626  00b0               L43:
 627                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 629  00b0 7b06          	ld	a,(OFST+6,sp)
 630  00b2 2712          	jreq	L44
 631  00b4 a110          	cp	a,#16
 632  00b6 270e          	jreq	L44
 633  00b8 ae005e        	ldw	x,#94
 634  00bb 89            	pushw	x
 635  00bc 5f            	clrw	x
 636  00bd 89            	pushw	x
 637  00be ae0000        	ldw	x,#L542
 638  00c1 cd0000        	call	_assert_failed
 640  00c4 5b04          	addw	sp,#4
 641  00c6               L44:
 642                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 644  00c6 7b07          	ld	a,(OFST+7,sp)
 645  00c8 2711          	jreq	L45
 646  00ca 4a            	dec	a
 647  00cb 270e          	jreq	L45
 648  00cd ae005f        	ldw	x,#95
 649  00d0 89            	pushw	x
 650  00d1 5f            	clrw	x
 651  00d2 89            	pushw	x
 652  00d3 ae0000        	ldw	x,#L542
 653  00d6 cd0000        	call	_assert_failed
 655  00d9 5b04          	addw	sp,#4
 656  00db               L45:
 657                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 659  00db 7b08          	ld	a,(OFST+8,sp)
 660  00dd 2712          	jreq	L46
 661  00df a108          	cp	a,#8
 662  00e1 270e          	jreq	L46
 663  00e3 ae0060        	ldw	x,#96
 664  00e6 89            	pushw	x
 665  00e7 5f            	clrw	x
 666  00e8 89            	pushw	x
 667  00e9 ae0000        	ldw	x,#L542
 668  00ec cd0000        	call	_assert_failed
 670  00ef 5b04          	addw	sp,#4
 671  00f1               L46:
 672                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 674  00f1 7b09          	ld	a,(OFST+9,sp)
 675  00f3 273a          	jreq	L47
 676  00f5 a101          	cp	a,#1
 677  00f7 2736          	jreq	L47
 678  00f9 a102          	cp	a,#2
 679  00fb 2732          	jreq	L47
 680  00fd a103          	cp	a,#3
 681  00ff 272e          	jreq	L47
 682  0101 a104          	cp	a,#4
 683  0103 272a          	jreq	L47
 684  0105 a105          	cp	a,#5
 685  0107 2726          	jreq	L47
 686  0109 a106          	cp	a,#6
 687  010b 2722          	jreq	L47
 688  010d a107          	cp	a,#7
 689  010f 271e          	jreq	L47
 690  0111 a108          	cp	a,#8
 691  0113 271a          	jreq	L47
 692  0115 a10c          	cp	a,#12
 693  0117 2716          	jreq	L47
 694  0119 a1ff          	cp	a,#255
 695  011b 2712          	jreq	L47
 696  011d a109          	cp	a,#9
 697  011f 270e          	jreq	L47
 698  0121 ae0061        	ldw	x,#97
 699  0124 89            	pushw	x
 700  0125 5f            	clrw	x
 701  0126 89            	pushw	x
 702  0127 ae0000        	ldw	x,#L542
 703  012a cd0000        	call	_assert_failed
 705  012d 5b04          	addw	sp,#4
 706  012f               L47:
 707                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 709  012f 7b0a          	ld	a,(OFST+10,sp)
 710  0131 2711          	jreq	L401
 711  0133 4a            	dec	a
 712  0134 270e          	jreq	L401
 713  0136 ae0062        	ldw	x,#98
 714  0139 89            	pushw	x
 715  013a 5f            	clrw	x
 716  013b 89            	pushw	x
 717  013c ae0000        	ldw	x,#L542
 718  013f cd0000        	call	_assert_failed
 720  0142 5b04          	addw	sp,#4
 721  0144               L401:
 722                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 724  0144 7b08          	ld	a,(OFST+8,sp)
 725  0146 88            	push	a
 726  0147 7b03          	ld	a,(OFST+3,sp)
 727  0149 97            	ld	xl,a
 728  014a 7b02          	ld	a,(OFST+2,sp)
 729  014c 95            	ld	xh,a
 730  014d cd0337        	call	_ADC1_ConversionConfig
 732  0150 84            	pop	a
 733                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 735  0151 7b05          	ld	a,(OFST+5,sp)
 736  0153 cd0221        	call	_ADC1_PrescalerConfig
 738                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 740  0156 7b07          	ld	a,(OFST+7,sp)
 741  0158 97            	ld	xl,a
 742  0159 7b06          	ld	a,(OFST+6,sp)
 743  015b 95            	ld	xh,a
 744  015c cd03cb        	call	_ADC1_ExternalTriggerConfig
 746                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 748  015f 7b0a          	ld	a,(OFST+10,sp)
 749  0161 97            	ld	xl,a
 750  0162 7b09          	ld	a,(OFST+9,sp)
 751  0164 95            	ld	xh,a
 752  0165 cd0261        	call	_ADC1_SchmittTriggerConfig
 754                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 756  0168 72105401      	bset	21505,#0
 757                     ; 119 }
 760  016c 85            	popw	x
 761  016d 81            	ret	
 797                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 797                     ; 127 {
 798                     	switch	.text
 799  016e               _ADC1_Cmd:
 801  016e 88            	push	a
 802       00000000      OFST:	set	0
 805                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 807  016f 4d            	tnz	a
 808  0170 2711          	jreq	L621
 809  0172 4a            	dec	a
 810  0173 270e          	jreq	L621
 811  0175 ae0081        	ldw	x,#129
 812  0178 89            	pushw	x
 813  0179 5f            	clrw	x
 814  017a 89            	pushw	x
 815  017b ae0000        	ldw	x,#L542
 816  017e cd0000        	call	_assert_failed
 818  0181 5b04          	addw	sp,#4
 819  0183               L621:
 820                     ; 131   if (NewState != DISABLE)
 822  0183 7b01          	ld	a,(OFST+1,sp)
 823  0185 2706          	jreq	L562
 824                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 826  0187 72105401      	bset	21505,#0
 828  018b 2004          	jra	L762
 829  018d               L562:
 830                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 832  018d 72115401      	bres	21505,#0
 833  0191               L762:
 834                     ; 139 }
 837  0191 84            	pop	a
 838  0192 81            	ret	
 874                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 874                     ; 147 {
 875                     	switch	.text
 876  0193               _ADC1_ScanModeCmd:
 878  0193 88            	push	a
 879       00000000      OFST:	set	0
 882                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 884  0194 4d            	tnz	a
 885  0195 2711          	jreq	L041
 886  0197 4a            	dec	a
 887  0198 270e          	jreq	L041
 888  019a ae0095        	ldw	x,#149
 889  019d 89            	pushw	x
 890  019e 5f            	clrw	x
 891  019f 89            	pushw	x
 892  01a0 ae0000        	ldw	x,#L542
 893  01a3 cd0000        	call	_assert_failed
 895  01a6 5b04          	addw	sp,#4
 896  01a8               L041:
 897                     ; 151   if (NewState != DISABLE)
 899  01a8 7b01          	ld	a,(OFST+1,sp)
 900  01aa 2706          	jreq	L703
 901                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 903  01ac 72125402      	bset	21506,#1
 905  01b0 2004          	jra	L113
 906  01b2               L703:
 907                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 909  01b2 72135402      	bres	21506,#1
 910  01b6               L113:
 911                     ; 159 }
 914  01b6 84            	pop	a
 915  01b7 81            	ret	
 951                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 951                     ; 167 {
 952                     	switch	.text
 953  01b8               _ADC1_DataBufferCmd:
 955  01b8 88            	push	a
 956       00000000      OFST:	set	0
 959                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 961  01b9 4d            	tnz	a
 962  01ba 2711          	jreq	L251
 963  01bc 4a            	dec	a
 964  01bd 270e          	jreq	L251
 965  01bf ae00a9        	ldw	x,#169
 966  01c2 89            	pushw	x
 967  01c3 5f            	clrw	x
 968  01c4 89            	pushw	x
 969  01c5 ae0000        	ldw	x,#L542
 970  01c8 cd0000        	call	_assert_failed
 972  01cb 5b04          	addw	sp,#4
 973  01cd               L251:
 974                     ; 171   if (NewState != DISABLE)
 976  01cd 7b01          	ld	a,(OFST+1,sp)
 977  01cf 2706          	jreq	L133
 978                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 980  01d1 721e5403      	bset	21507,#7
 982  01d5 2004          	jra	L333
 983  01d7               L133:
 984                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 986  01d7 721f5403      	bres	21507,#7
 987  01db               L333:
 988                     ; 179 }
 991  01db 84            	pop	a
 992  01dc 81            	ret	
1149                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
1149                     ; 191 {
1150                     	switch	.text
1151  01dd               _ADC1_ITConfig:
1153  01dd 89            	pushw	x
1154       00000000      OFST:	set	0
1157                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
1159  01de a30020        	cpw	x,#32
1160  01e1 2713          	jreq	L461
1161  01e3 a30010        	cpw	x,#16
1162  01e6 270e          	jreq	L461
1163  01e8 ae00c1        	ldw	x,#193
1164  01eb 89            	pushw	x
1165  01ec 5f            	clrw	x
1166  01ed 89            	pushw	x
1167  01ee ae0000        	ldw	x,#L542
1168  01f1 cd0000        	call	_assert_failed
1170  01f4 5b04          	addw	sp,#4
1171  01f6               L461:
1172                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1174  01f6 7b05          	ld	a,(OFST+5,sp)
1175  01f8 2711          	jreq	L471
1176  01fa 4a            	dec	a
1177  01fb 270e          	jreq	L471
1178  01fd ae00c2        	ldw	x,#194
1179  0200 89            	pushw	x
1180  0201 5f            	clrw	x
1181  0202 89            	pushw	x
1182  0203 ae0000        	ldw	x,#L542
1183  0206 cd0000        	call	_assert_failed
1185  0209 5b04          	addw	sp,#4
1186  020b               L471:
1187                     ; 196   if (NewState != DISABLE)
1189  020b 7b05          	ld	a,(OFST+5,sp)
1190  020d 2707          	jreq	L124
1191                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
1193  020f c65400        	ld	a,21504
1194  0212 1a02          	or	a,(OFST+2,sp)
1196  0214 2006          	jra	L324
1197  0216               L124:
1198                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
1200  0216 7b02          	ld	a,(OFST+2,sp)
1201  0218 43            	cpl	a
1202  0219 c45400        	and	a,21504
1203  021c               L324:
1204  021c c75400        	ld	21504,a
1205                     ; 206 }
1208  021f 85            	popw	x
1209  0220 81            	ret	
1246                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1246                     ; 215 {
1247                     	switch	.text
1248  0221               _ADC1_PrescalerConfig:
1250  0221 88            	push	a
1251       00000000      OFST:	set	0
1254                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1256  0222 4d            	tnz	a
1257  0223 272a          	jreq	L602
1258  0225 a110          	cp	a,#16
1259  0227 2726          	jreq	L602
1260  0229 a120          	cp	a,#32
1261  022b 2722          	jreq	L602
1262  022d a130          	cp	a,#48
1263  022f 271e          	jreq	L602
1264  0231 a140          	cp	a,#64
1265  0233 271a          	jreq	L602
1266  0235 a150          	cp	a,#80
1267  0237 2716          	jreq	L602
1268  0239 a160          	cp	a,#96
1269  023b 2712          	jreq	L602
1270  023d a170          	cp	a,#112
1271  023f 270e          	jreq	L602
1272  0241 ae00d9        	ldw	x,#217
1273  0244 89            	pushw	x
1274  0245 5f            	clrw	x
1275  0246 89            	pushw	x
1276  0247 ae0000        	ldw	x,#L542
1277  024a cd0000        	call	_assert_failed
1279  024d 5b04          	addw	sp,#4
1280  024f               L602:
1281                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1283  024f c65401        	ld	a,21505
1284  0252 a48f          	and	a,#143
1285  0254 c75401        	ld	21505,a
1286                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1288  0257 c65401        	ld	a,21505
1289  025a 1a01          	or	a,(OFST+1,sp)
1290  025c c75401        	ld	21505,a
1291                     ; 223 }
1294  025f 84            	pop	a
1295  0260 81            	ret	
1343                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1343                     ; 234 {
1344                     	switch	.text
1345  0261               _ADC1_SchmittTriggerConfig:
1347  0261 89            	pushw	x
1348       00000000      OFST:	set	0
1351                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1353  0262 9e            	ld	a,xh
1354  0263 4d            	tnz	a
1355  0264 2743          	jreq	L022
1356  0266 9e            	ld	a,xh
1357  0267 4a            	dec	a
1358  0268 273f          	jreq	L022
1359  026a 9e            	ld	a,xh
1360  026b a102          	cp	a,#2
1361  026d 273a          	jreq	L022
1362  026f 9e            	ld	a,xh
1363  0270 a103          	cp	a,#3
1364  0272 2735          	jreq	L022
1365  0274 9e            	ld	a,xh
1366  0275 a104          	cp	a,#4
1367  0277 2730          	jreq	L022
1368  0279 9e            	ld	a,xh
1369  027a a105          	cp	a,#5
1370  027c 272b          	jreq	L022
1371  027e 9e            	ld	a,xh
1372  027f a106          	cp	a,#6
1373  0281 2726          	jreq	L022
1374  0283 9e            	ld	a,xh
1375  0284 a107          	cp	a,#7
1376  0286 2721          	jreq	L022
1377  0288 9e            	ld	a,xh
1378  0289 a108          	cp	a,#8
1379  028b 271c          	jreq	L022
1380  028d 9e            	ld	a,xh
1381  028e a10c          	cp	a,#12
1382  0290 2717          	jreq	L022
1383  0292 9e            	ld	a,xh
1384  0293 4c            	inc	a
1385  0294 2713          	jreq	L022
1386  0296 9e            	ld	a,xh
1387  0297 a109          	cp	a,#9
1388  0299 270e          	jreq	L022
1389  029b ae00ec        	ldw	x,#236
1390  029e 89            	pushw	x
1391  029f 5f            	clrw	x
1392  02a0 89            	pushw	x
1393  02a1 ae0000        	ldw	x,#L542
1394  02a4 cd0000        	call	_assert_failed
1396  02a7 5b04          	addw	sp,#4
1397  02a9               L022:
1398                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1400  02a9 7b02          	ld	a,(OFST+2,sp)
1401  02ab 2711          	jreq	L032
1402  02ad 4a            	dec	a
1403  02ae 270e          	jreq	L032
1404  02b0 ae00ed        	ldw	x,#237
1405  02b3 89            	pushw	x
1406  02b4 5f            	clrw	x
1407  02b5 89            	pushw	x
1408  02b6 ae0000        	ldw	x,#L542
1409  02b9 cd0000        	call	_assert_failed
1411  02bc 5b04          	addw	sp,#4
1412  02be               L032:
1413                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1415  02be 7b01          	ld	a,(OFST+1,sp)
1416  02c0 a1ff          	cp	a,#255
1417  02c2 261d          	jrne	L564
1418                     ; 241     if (NewState != DISABLE)
1420  02c4 7b02          	ld	a,(OFST+2,sp)
1421  02c6 270a          	jreq	L764
1422                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1424  02c8 725f5407      	clr	21511
1425                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1427  02cc 725f5406      	clr	21510
1429  02d0 2063          	jra	L374
1430  02d2               L764:
1431                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1433  02d2 c65407        	ld	a,21511
1434  02d5 aaff          	or	a,#255
1435  02d7 c75407        	ld	21511,a
1436                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1438  02da c65406        	ld	a,21510
1439  02dd aaff          	or	a,#255
1440  02df 2051          	jp	LC001
1441  02e1               L564:
1442                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1444  02e1 a108          	cp	a,#8
1445  02e3 0d02          	tnz	(OFST+2,sp)
1446  02e5 2426          	jruge	L574
1447                     ; 254     if (NewState != DISABLE)
1449  02e7 2714          	jreq	L774
1450                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1452  02e9 5f            	clrw	x
1453  02ea 97            	ld	xl,a
1454  02eb a601          	ld	a,#1
1455  02ed 5d            	tnzw	x
1456  02ee 2704          	jreq	L432
1457  02f0               L632:
1458  02f0 48            	sll	a
1459  02f1 5a            	decw	x
1460  02f2 26fc          	jrne	L632
1461  02f4               L432:
1462  02f4 43            	cpl	a
1463  02f5 c45407        	and	a,21511
1464  02f8               LC002:
1465  02f8 c75407        	ld	21511,a
1467  02fb 2038          	jra	L374
1468  02fd               L774:
1469                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1471  02fd 5f            	clrw	x
1472  02fe 97            	ld	xl,a
1473  02ff a601          	ld	a,#1
1474  0301 5d            	tnzw	x
1475  0302 2704          	jreq	L042
1476  0304               L242:
1477  0304 48            	sll	a
1478  0305 5a            	decw	x
1479  0306 26fc          	jrne	L242
1480  0308               L042:
1481  0308 ca5407        	or	a,21511
1482  030b 20eb          	jp	LC002
1483  030d               L574:
1484                     ; 265     if (NewState != DISABLE)
1486  030d 2713          	jreq	L505
1487                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1489  030f a008          	sub	a,#8
1490  0311 5f            	clrw	x
1491  0312 97            	ld	xl,a
1492  0313 a601          	ld	a,#1
1493  0315 5d            	tnzw	x
1494  0316 2704          	jreq	L442
1495  0318               L642:
1496  0318 48            	sll	a
1497  0319 5a            	decw	x
1498  031a 26fc          	jrne	L642
1499  031c               L442:
1500  031c 43            	cpl	a
1501  031d c45406        	and	a,21510
1503  0320 2010          	jp	LC001
1504  0322               L505:
1505                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1507  0322 a008          	sub	a,#8
1508  0324 5f            	clrw	x
1509  0325 97            	ld	xl,a
1510  0326 a601          	ld	a,#1
1511  0328 5d            	tnzw	x
1512  0329 2704          	jreq	L052
1513  032b               L252:
1514  032b 48            	sll	a
1515  032c 5a            	decw	x
1516  032d 26fc          	jrne	L252
1517  032f               L052:
1518  032f ca5406        	or	a,21510
1519  0332               LC001:
1520  0332 c75406        	ld	21510,a
1521  0335               L374:
1522                     ; 274 }
1525  0335 85            	popw	x
1526  0336 81            	ret	
1584                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1584                     ; 287 {
1585                     	switch	.text
1586  0337               _ADC1_ConversionConfig:
1588  0337 89            	pushw	x
1589       00000000      OFST:	set	0
1592                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1594  0338 9e            	ld	a,xh
1595  0339 4d            	tnz	a
1596  033a 2712          	jreq	L262
1597  033c 9e            	ld	a,xh
1598  033d 4a            	dec	a
1599  033e 270e          	jreq	L262
1600  0340 ae0121        	ldw	x,#289
1601  0343 89            	pushw	x
1602  0344 5f            	clrw	x
1603  0345 89            	pushw	x
1604  0346 ae0000        	ldw	x,#L542
1605  0349 cd0000        	call	_assert_failed
1607  034c 5b04          	addw	sp,#4
1608  034e               L262:
1609                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1611  034e 7b02          	ld	a,(OFST+2,sp)
1612  0350 2736          	jreq	L272
1613  0352 a101          	cp	a,#1
1614  0354 2732          	jreq	L272
1615  0356 a102          	cp	a,#2
1616  0358 272e          	jreq	L272
1617  035a a103          	cp	a,#3
1618  035c 272a          	jreq	L272
1619  035e a104          	cp	a,#4
1620  0360 2726          	jreq	L272
1621  0362 a105          	cp	a,#5
1622  0364 2722          	jreq	L272
1623  0366 a106          	cp	a,#6
1624  0368 271e          	jreq	L272
1625  036a a107          	cp	a,#7
1626  036c 271a          	jreq	L272
1627  036e a108          	cp	a,#8
1628  0370 2716          	jreq	L272
1629  0372 a10c          	cp	a,#12
1630  0374 2712          	jreq	L272
1631  0376 a109          	cp	a,#9
1632  0378 270e          	jreq	L272
1633  037a ae0122        	ldw	x,#290
1634  037d 89            	pushw	x
1635  037e 5f            	clrw	x
1636  037f 89            	pushw	x
1637  0380 ae0000        	ldw	x,#L542
1638  0383 cd0000        	call	_assert_failed
1640  0386 5b04          	addw	sp,#4
1641  0388               L272:
1642                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1644  0388 7b05          	ld	a,(OFST+5,sp)
1645  038a 2712          	jreq	L203
1646  038c a108          	cp	a,#8
1647  038e 270e          	jreq	L203
1648  0390 ae0123        	ldw	x,#291
1649  0393 89            	pushw	x
1650  0394 5f            	clrw	x
1651  0395 89            	pushw	x
1652  0396 ae0000        	ldw	x,#L542
1653  0399 cd0000        	call	_assert_failed
1655  039c 5b04          	addw	sp,#4
1656  039e               L203:
1657                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1659  039e 72175402      	bres	21506,#3
1660                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1662  03a2 c65402        	ld	a,21506
1663  03a5 1a05          	or	a,(OFST+5,sp)
1664  03a7 c75402        	ld	21506,a
1665                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1667  03aa 7b01          	ld	a,(OFST+1,sp)
1668  03ac 4a            	dec	a
1669  03ad 2606          	jrne	L735
1670                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1672  03af 72125401      	bset	21505,#1
1674  03b3 2004          	jra	L145
1675  03b5               L735:
1676                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1678  03b5 72135401      	bres	21505,#1
1679  03b9               L145:
1680                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1682  03b9 c65400        	ld	a,21504
1683  03bc a4f0          	and	a,#240
1684  03be c75400        	ld	21504,a
1685                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1687  03c1 c65400        	ld	a,21504
1688  03c4 1a02          	or	a,(OFST+2,sp)
1689  03c6 c75400        	ld	21504,a
1690                     ; 313 }
1693  03c9 85            	popw	x
1694  03ca 81            	ret	
1741                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1741                     ; 326 {
1742                     	switch	.text
1743  03cb               _ADC1_ExternalTriggerConfig:
1745  03cb 89            	pushw	x
1746       00000000      OFST:	set	0
1749                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1751  03cc 9e            	ld	a,xh
1752  03cd 4d            	tnz	a
1753  03ce 2713          	jreq	L413
1754  03d0 9e            	ld	a,xh
1755  03d1 a110          	cp	a,#16
1756  03d3 270e          	jreq	L413
1757  03d5 ae0148        	ldw	x,#328
1758  03d8 89            	pushw	x
1759  03d9 5f            	clrw	x
1760  03da 89            	pushw	x
1761  03db ae0000        	ldw	x,#L542
1762  03de cd0000        	call	_assert_failed
1764  03e1 5b04          	addw	sp,#4
1765  03e3               L413:
1766                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1768  03e3 7b02          	ld	a,(OFST+2,sp)
1769  03e5 2711          	jreq	L423
1770  03e7 4a            	dec	a
1771  03e8 270e          	jreq	L423
1772  03ea ae0149        	ldw	x,#329
1773  03ed 89            	pushw	x
1774  03ee 5f            	clrw	x
1775  03ef 89            	pushw	x
1776  03f0 ae0000        	ldw	x,#L542
1777  03f3 cd0000        	call	_assert_failed
1779  03f6 5b04          	addw	sp,#4
1780  03f8               L423:
1781                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1783  03f8 c65402        	ld	a,21506
1784  03fb a4cf          	and	a,#207
1785  03fd c75402        	ld	21506,a
1786                     ; 334   if (NewState != DISABLE)
1788  0400 7b02          	ld	a,(OFST+2,sp)
1789  0402 2706          	jreq	L565
1790                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1792  0404 721c5402      	bset	21506,#6
1794  0408 2004          	jra	L765
1795  040a               L565:
1796                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1798  040a 721d5402      	bres	21506,#6
1799  040e               L765:
1800                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1802  040e c65402        	ld	a,21506
1803  0411 1a01          	or	a,(OFST+1,sp)
1804  0413 c75402        	ld	21506,a
1805                     ; 347 }
1808  0416 85            	popw	x
1809  0417 81            	ret	
1833                     ; 358 void ADC1_StartConversion(void)
1833                     ; 359 {
1834                     	switch	.text
1835  0418               _ADC1_StartConversion:
1839                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1841  0418 72105401      	bset	21505,#0
1842                     ; 361 }
1845  041c 81            	ret	
1885                     ; 370 uint16_t ADC1_GetConversionValue(void)
1885                     ; 371 {
1886                     	switch	.text
1887  041d               _ADC1_GetConversionValue:
1889  041d 5205          	subw	sp,#5
1890       00000005      OFST:	set	5
1893                     ; 372   uint16_t temph = 0;
1895                     ; 373   uint8_t templ = 0;
1897                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1899  041f 720754020e    	btjf	21506,#3,L716
1900                     ; 378     templ = ADC1->DRL;
1902  0424 c65405        	ld	a,21509
1903  0427 6b03          	ld	(OFST-2,sp),a
1905                     ; 380     temph = ADC1->DRH;
1907  0429 c65404        	ld	a,21508
1908  042c 97            	ld	xl,a
1910                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1912  042d 7b03          	ld	a,(OFST-2,sp)
1913  042f 02            	rlwa	x,a
1916  0430 201a          	jra	L126
1917  0432               L716:
1918                     ; 387     temph = ADC1->DRH;
1920  0432 c65404        	ld	a,21508
1921  0435 97            	ld	xl,a
1923                     ; 389     templ = ADC1->DRL;
1925  0436 c65405        	ld	a,21509
1926  0439 6b03          	ld	(OFST-2,sp),a
1928                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1930  043b 4f            	clr	a
1931  043c 02            	rlwa	x,a
1932  043d 1f01          	ldw	(OFST-4,sp),x
1934  043f 7b03          	ld	a,(OFST-2,sp)
1935  0441 97            	ld	xl,a
1936  0442 a640          	ld	a,#64
1937  0444 42            	mul	x,a
1938  0445 01            	rrwa	x,a
1939  0446 1a02          	or	a,(OFST-3,sp)
1940  0448 01            	rrwa	x,a
1941  0449 1a01          	or	a,(OFST-4,sp)
1942  044b 01            	rrwa	x,a
1944  044c               L126:
1945                     ; 394   return ((uint16_t)temph);
1949  044c 5b05          	addw	sp,#5
1950  044e 81            	ret	
1997                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1997                     ; 406 {
1998                     	switch	.text
1999  044f               _ADC1_AWDChannelConfig:
2001  044f 89            	pushw	x
2002       00000000      OFST:	set	0
2005                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2007  0450 9f            	ld	a,xl
2008  0451 4d            	tnz	a
2009  0452 2712          	jreq	L243
2010  0454 9f            	ld	a,xl
2011  0455 4a            	dec	a
2012  0456 270e          	jreq	L243
2013  0458 ae0198        	ldw	x,#408
2014  045b 89            	pushw	x
2015  045c 5f            	clrw	x
2016  045d 89            	pushw	x
2017  045e ae0000        	ldw	x,#L542
2018  0461 cd0000        	call	_assert_failed
2020  0464 5b04          	addw	sp,#4
2021  0466               L243:
2022                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2024  0466 7b01          	ld	a,(OFST+1,sp)
2025  0468 2738          	jreq	L253
2026  046a a101          	cp	a,#1
2027  046c 2734          	jreq	L253
2028  046e a102          	cp	a,#2
2029  0470 2730          	jreq	L253
2030  0472 a103          	cp	a,#3
2031  0474 272c          	jreq	L253
2032  0476 a104          	cp	a,#4
2033  0478 2728          	jreq	L253
2034  047a a105          	cp	a,#5
2035  047c 2724          	jreq	L253
2036  047e a106          	cp	a,#6
2037  0480 2720          	jreq	L253
2038  0482 a107          	cp	a,#7
2039  0484 271c          	jreq	L253
2040  0486 a108          	cp	a,#8
2041  0488 2718          	jreq	L253
2042  048a a10c          	cp	a,#12
2043  048c 2714          	jreq	L253
2044  048e a109          	cp	a,#9
2045  0490 2710          	jreq	L253
2046  0492 ae0199        	ldw	x,#409
2047  0495 89            	pushw	x
2048  0496 5f            	clrw	x
2049  0497 89            	pushw	x
2050  0498 ae0000        	ldw	x,#L542
2051  049b cd0000        	call	_assert_failed
2053  049e 5b04          	addw	sp,#4
2054  04a0 7b01          	ld	a,(OFST+1,sp)
2055  04a2               L253:
2056                     ; 411   if (Channel < (uint8_t)8)
2058  04a2 a108          	cp	a,#8
2059  04a4 0d02          	tnz	(OFST+2,sp)
2060  04a6 2426          	jruge	L546
2061                     ; 413     if (NewState != DISABLE)
2063  04a8 2710          	jreq	L746
2064                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
2066  04aa 5f            	clrw	x
2067  04ab 97            	ld	xl,a
2068  04ac a601          	ld	a,#1
2069  04ae 5d            	tnzw	x
2070  04af 2704          	jreq	L653
2071  04b1               L063:
2072  04b1 48            	sll	a
2073  04b2 5a            	decw	x
2074  04b3 26fc          	jrne	L063
2075  04b5               L653:
2076  04b5 ca540f        	or	a,21519
2078  04b8 200f          	jp	LC004
2079  04ba               L746:
2080                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
2082  04ba 5f            	clrw	x
2083  04bb 97            	ld	xl,a
2084  04bc a601          	ld	a,#1
2085  04be 5d            	tnzw	x
2086  04bf 2704          	jreq	L263
2087  04c1               L463:
2088  04c1 48            	sll	a
2089  04c2 5a            	decw	x
2090  04c3 26fc          	jrne	L463
2091  04c5               L263:
2092  04c5 43            	cpl	a
2093  04c6 c4540f        	and	a,21519
2094  04c9               LC004:
2095  04c9 c7540f        	ld	21519,a
2096  04cc 2028          	jra	L356
2097  04ce               L546:
2098                     ; 424     if (NewState != DISABLE)
2100  04ce 2712          	jreq	L556
2101                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
2103  04d0 a008          	sub	a,#8
2104  04d2 5f            	clrw	x
2105  04d3 97            	ld	xl,a
2106  04d4 a601          	ld	a,#1
2107  04d6 5d            	tnzw	x
2108  04d7 2704          	jreq	L663
2109  04d9               L073:
2110  04d9 48            	sll	a
2111  04da 5a            	decw	x
2112  04db 26fc          	jrne	L073
2113  04dd               L663:
2114  04dd ca540e        	or	a,21518
2116  04e0 2011          	jp	LC003
2117  04e2               L556:
2118                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
2120  04e2 a008          	sub	a,#8
2121  04e4 5f            	clrw	x
2122  04e5 97            	ld	xl,a
2123  04e6 a601          	ld	a,#1
2124  04e8 5d            	tnzw	x
2125  04e9 2704          	jreq	L273
2126  04eb               L473:
2127  04eb 48            	sll	a
2128  04ec 5a            	decw	x
2129  04ed 26fc          	jrne	L473
2130  04ef               L273:
2131  04ef 43            	cpl	a
2132  04f0 c4540e        	and	a,21518
2133  04f3               LC003:
2134  04f3 c7540e        	ld	21518,a
2135  04f6               L356:
2136                     ; 433 }
2139  04f6 85            	popw	x
2140  04f7 81            	ret	
2173                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
2173                     ; 442 {
2174                     	switch	.text
2175  04f8               _ADC1_SetHighThreshold:
2177  04f8 89            	pushw	x
2178       00000000      OFST:	set	0
2181                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
2183  04f9 54            	srlw	x
2184  04fa 54            	srlw	x
2185  04fb 9f            	ld	a,xl
2186  04fc c75408        	ld	21512,a
2187                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
2189  04ff 7b02          	ld	a,(OFST+2,sp)
2190  0501 c75409        	ld	21513,a
2191                     ; 445 }
2194  0504 85            	popw	x
2195  0505 81            	ret	
2228                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
2228                     ; 454 {
2229                     	switch	.text
2230  0506               _ADC1_SetLowThreshold:
2234                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
2236  0506 9f            	ld	a,xl
2237  0507 c7540b        	ld	21515,a
2238                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
2240  050a 54            	srlw	x
2241  050b 54            	srlw	x
2242  050c 9f            	ld	a,xl
2243  050d c7540a        	ld	21514,a
2244                     ; 457 }
2247  0510 81            	ret	
2295                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
2295                     ; 467 {
2296                     	switch	.text
2297  0511               _ADC1_GetBufferValue:
2299  0511 88            	push	a
2300  0512 5205          	subw	sp,#5
2301       00000005      OFST:	set	5
2304                     ; 468   uint16_t temph = 0;
2306                     ; 469   uint8_t templ = 0;
2308                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
2310  0514 a10a          	cp	a,#10
2311  0516 250e          	jrult	L604
2312  0518 ae01d8        	ldw	x,#472
2313  051b 89            	pushw	x
2314  051c 5f            	clrw	x
2315  051d 89            	pushw	x
2316  051e ae0000        	ldw	x,#L542
2317  0521 cd0000        	call	_assert_failed
2319  0524 5b04          	addw	sp,#4
2320  0526               L604:
2321                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
2323  0526 7b06          	ld	a,(OFST+1,sp)
2324  0528 48            	sll	a
2325  0529 5f            	clrw	x
2326  052a 97            	ld	xl,a
2327  052b 7207540213    	btjf	21506,#3,L137
2328                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2330  0530 d653e1        	ld	a,(21473,x)
2331  0533 6b03          	ld	(OFST-2,sp),a
2333                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2335  0535 7b06          	ld	a,(OFST+1,sp)
2336  0537 48            	sll	a
2337  0538 5f            	clrw	x
2338  0539 97            	ld	xl,a
2339  053a d653e0        	ld	a,(21472,x)
2340  053d 97            	ld	xl,a
2342                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
2344  053e 7b03          	ld	a,(OFST-2,sp)
2345  0540 02            	rlwa	x,a
2348  0541 2024          	jra	L337
2349  0543               L137:
2350                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2352  0543 d653e0        	ld	a,(21472,x)
2353  0546 5f            	clrw	x
2354  0547 97            	ld	xl,a
2355  0548 1f04          	ldw	(OFST-1,sp),x
2357                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2359  054a 7b06          	ld	a,(OFST+1,sp)
2360  054c 48            	sll	a
2361  054d 5f            	clrw	x
2362  054e 97            	ld	xl,a
2363  054f d653e1        	ld	a,(21473,x)
2364  0552 6b03          	ld	(OFST-2,sp),a
2366                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
2368  0554 4f            	clr	a
2369  0555 1e04          	ldw	x,(OFST-1,sp)
2370  0557 02            	rlwa	x,a
2371  0558 1f01          	ldw	(OFST-4,sp),x
2373  055a 7b03          	ld	a,(OFST-2,sp)
2374  055c 97            	ld	xl,a
2375  055d a640          	ld	a,#64
2376  055f 42            	mul	x,a
2377  0560 01            	rrwa	x,a
2378  0561 1a02          	or	a,(OFST-3,sp)
2379  0563 01            	rrwa	x,a
2380  0564 1a01          	or	a,(OFST-4,sp)
2381  0566 01            	rrwa	x,a
2383  0567               L337:
2384                     ; 493   return ((uint16_t)temph);
2388  0567 5b06          	addw	sp,#6
2389  0569 81            	ret	
2454                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2454                     ; 503 {
2455                     	switch	.text
2456  056a               _ADC1_GetAWDChannelStatus:
2458  056a 88            	push	a
2459  056b 88            	push	a
2460       00000001      OFST:	set	1
2463                     ; 504   uint8_t status = 0;
2465                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2467  056c 4d            	tnz	a
2468  056d 2736          	jreq	L024
2469  056f a101          	cp	a,#1
2470  0571 2732          	jreq	L024
2471  0573 a102          	cp	a,#2
2472  0575 272e          	jreq	L024
2473  0577 a103          	cp	a,#3
2474  0579 272a          	jreq	L024
2475  057b a104          	cp	a,#4
2476  057d 2726          	jreq	L024
2477  057f a105          	cp	a,#5
2478  0581 2722          	jreq	L024
2479  0583 a106          	cp	a,#6
2480  0585 271e          	jreq	L024
2481  0587 a107          	cp	a,#7
2482  0589 271a          	jreq	L024
2483  058b a108          	cp	a,#8
2484  058d 2716          	jreq	L024
2485  058f a10c          	cp	a,#12
2486  0591 2712          	jreq	L024
2487  0593 a109          	cp	a,#9
2488  0595 270e          	jreq	L024
2489  0597 ae01fb        	ldw	x,#507
2490  059a 89            	pushw	x
2491  059b 5f            	clrw	x
2492  059c 89            	pushw	x
2493  059d ae0000        	ldw	x,#L542
2494  05a0 cd0000        	call	_assert_failed
2496  05a3 5b04          	addw	sp,#4
2497  05a5               L024:
2498                     ; 509   if (Channel < (uint8_t)8)
2500  05a5 7b02          	ld	a,(OFST+1,sp)
2501  05a7 a108          	cp	a,#8
2502  05a9 2410          	jruge	L567
2503                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2505  05ab 5f            	clrw	x
2506  05ac 97            	ld	xl,a
2507  05ad a601          	ld	a,#1
2508  05af 5d            	tnzw	x
2509  05b0 2704          	jreq	L424
2510  05b2               L624:
2511  05b2 48            	sll	a
2512  05b3 5a            	decw	x
2513  05b4 26fc          	jrne	L624
2514  05b6               L424:
2515  05b6 c4540d        	and	a,21517
2518  05b9 2010          	jra	L767
2519  05bb               L567:
2520                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2522  05bb a008          	sub	a,#8
2523  05bd 5f            	clrw	x
2524  05be 97            	ld	xl,a
2525  05bf a601          	ld	a,#1
2526  05c1 5d            	tnzw	x
2527  05c2 2704          	jreq	L034
2528  05c4               L234:
2529  05c4 48            	sll	a
2530  05c5 5a            	decw	x
2531  05c6 26fc          	jrne	L234
2532  05c8               L034:
2533  05c8 c4540c        	and	a,21516
2535  05cb               L767:
2536                     ; 518   return ((FlagStatus)status);
2540  05cb 85            	popw	x
2541  05cc 81            	ret	
2696                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2696                     ; 528 {
2697                     	switch	.text
2698  05cd               _ADC1_GetFlagStatus:
2700  05cd 88            	push	a
2701  05ce 88            	push	a
2702       00000001      OFST:	set	1
2705                     ; 529   uint8_t flagstatus = 0;
2707                     ; 530   uint8_t temp = 0;
2709                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2711  05cf a180          	cp	a,#128
2712  05d1 273e          	jreq	L244
2713  05d3 a141          	cp	a,#65
2714  05d5 273a          	jreq	L244
2715  05d7 a140          	cp	a,#64
2716  05d9 2736          	jreq	L244
2717  05db a110          	cp	a,#16
2718  05dd 2732          	jreq	L244
2719  05df a111          	cp	a,#17
2720  05e1 272e          	jreq	L244
2721  05e3 a112          	cp	a,#18
2722  05e5 272a          	jreq	L244
2723  05e7 a113          	cp	a,#19
2724  05e9 2726          	jreq	L244
2725  05eb a114          	cp	a,#20
2726  05ed 2722          	jreq	L244
2727  05ef a115          	cp	a,#21
2728  05f1 271e          	jreq	L244
2729  05f3 a116          	cp	a,#22
2730  05f5 271a          	jreq	L244
2731  05f7 a117          	cp	a,#23
2732  05f9 2716          	jreq	L244
2733  05fb a118          	cp	a,#24
2734  05fd 2712          	jreq	L244
2735  05ff a119          	cp	a,#25
2736  0601 270e          	jreq	L244
2737  0603 ae0215        	ldw	x,#533
2738  0606 89            	pushw	x
2739  0607 5f            	clrw	x
2740  0608 89            	pushw	x
2741  0609 ae0000        	ldw	x,#L542
2742  060c cd0000        	call	_assert_failed
2744  060f 5b04          	addw	sp,#4
2745  0611               L244:
2746                     ; 535   if ((Flag & 0x0F) == 0x01)
2748  0611 7b02          	ld	a,(OFST+1,sp)
2749  0613 a40f          	and	a,#15
2750  0615 4a            	dec	a
2751  0616 2607          	jrne	L3501
2752                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2754  0618 c65403        	ld	a,21507
2755  061b a440          	and	a,#64
2758  061d 2039          	jra	L5501
2759  061f               L3501:
2760                     ; 540   else if ((Flag & 0xF0) == 0x10)
2762  061f 7b02          	ld	a,(OFST+1,sp)
2763  0621 a4f0          	and	a,#240
2764  0623 a110          	cp	a,#16
2765  0625 262c          	jrne	L7501
2766                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2768  0627 7b02          	ld	a,(OFST+1,sp)
2769  0629 a40f          	and	a,#15
2770  062b 6b01          	ld	(OFST+0,sp),a
2772                     ; 544     if (temp < 8)
2774  062d a108          	cp	a,#8
2775  062f 2410          	jruge	L1601
2776                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2778  0631 5f            	clrw	x
2779  0632 97            	ld	xl,a
2780  0633 a601          	ld	a,#1
2781  0635 5d            	tnzw	x
2782  0636 2704          	jreq	L644
2783  0638               L054:
2784  0638 48            	sll	a
2785  0639 5a            	decw	x
2786  063a 26fc          	jrne	L054
2787  063c               L644:
2788  063c c4540d        	and	a,21517
2791  063f 2017          	jra	L5501
2792  0641               L1601:
2793                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2795  0641 a008          	sub	a,#8
2796  0643 5f            	clrw	x
2797  0644 97            	ld	xl,a
2798  0645 a601          	ld	a,#1
2799  0647 5d            	tnzw	x
2800  0648 2704          	jreq	L254
2801  064a               L454:
2802  064a 48            	sll	a
2803  064b 5a            	decw	x
2804  064c 26fc          	jrne	L454
2805  064e               L254:
2806  064e c4540c        	and	a,21516
2808  0651 2005          	jra	L5501
2809  0653               L7501:
2810                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2812  0653 c65400        	ld	a,21504
2813  0656 1402          	and	a,(OFST+1,sp)
2815  0658               L5501:
2816                     ; 557   return ((FlagStatus)flagstatus);
2820  0658 85            	popw	x
2821  0659 81            	ret	
2864                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2864                     ; 568 {
2865                     	switch	.text
2866  065a               _ADC1_ClearFlag:
2868  065a 88            	push	a
2869  065b 88            	push	a
2870       00000001      OFST:	set	1
2873                     ; 569   uint8_t temp = 0;
2875                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2877  065c a180          	cp	a,#128
2878  065e 273e          	jreq	L464
2879  0660 a141          	cp	a,#65
2880  0662 273a          	jreq	L464
2881  0664 a140          	cp	a,#64
2882  0666 2736          	jreq	L464
2883  0668 a110          	cp	a,#16
2884  066a 2732          	jreq	L464
2885  066c a111          	cp	a,#17
2886  066e 272e          	jreq	L464
2887  0670 a112          	cp	a,#18
2888  0672 272a          	jreq	L464
2889  0674 a113          	cp	a,#19
2890  0676 2726          	jreq	L464
2891  0678 a114          	cp	a,#20
2892  067a 2722          	jreq	L464
2893  067c a115          	cp	a,#21
2894  067e 271e          	jreq	L464
2895  0680 a116          	cp	a,#22
2896  0682 271a          	jreq	L464
2897  0684 a117          	cp	a,#23
2898  0686 2716          	jreq	L464
2899  0688 a118          	cp	a,#24
2900  068a 2712          	jreq	L464
2901  068c a119          	cp	a,#25
2902  068e 270e          	jreq	L464
2903  0690 ae023c        	ldw	x,#572
2904  0693 89            	pushw	x
2905  0694 5f            	clrw	x
2906  0695 89            	pushw	x
2907  0696 ae0000        	ldw	x,#L542
2908  0699 cd0000        	call	_assert_failed
2910  069c 5b04          	addw	sp,#4
2911  069e               L464:
2912                     ; 574   if ((Flag & 0x0F) == 0x01)
2914  069e 7b02          	ld	a,(OFST+1,sp)
2915  06a0 a40f          	and	a,#15
2916  06a2 4a            	dec	a
2917  06a3 2606          	jrne	L7011
2918                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2920  06a5 721d5403      	bres	21507,#6
2922  06a9 2045          	jra	L1111
2923  06ab               L7011:
2924                     ; 579   else if ((Flag & 0xF0) == 0x10)
2926  06ab 7b02          	ld	a,(OFST+1,sp)
2927  06ad a4f0          	and	a,#240
2928  06af a110          	cp	a,#16
2929  06b1 2634          	jrne	L3111
2930                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2932  06b3 7b02          	ld	a,(OFST+1,sp)
2933  06b5 a40f          	and	a,#15
2934  06b7 6b01          	ld	(OFST+0,sp),a
2936                     ; 583     if (temp < 8)
2938  06b9 a108          	cp	a,#8
2939  06bb 2414          	jruge	L5111
2940                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2942  06bd 5f            	clrw	x
2943  06be 97            	ld	xl,a
2944  06bf a601          	ld	a,#1
2945  06c1 5d            	tnzw	x
2946  06c2 2704          	jreq	L074
2947  06c4               L274:
2948  06c4 48            	sll	a
2949  06c5 5a            	decw	x
2950  06c6 26fc          	jrne	L274
2951  06c8               L074:
2952  06c8 43            	cpl	a
2953  06c9 c4540d        	and	a,21517
2954  06cc c7540d        	ld	21517,a
2956  06cf 201f          	jra	L1111
2957  06d1               L5111:
2958                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2960  06d1 a008          	sub	a,#8
2961  06d3 5f            	clrw	x
2962  06d4 97            	ld	xl,a
2963  06d5 a601          	ld	a,#1
2964  06d7 5d            	tnzw	x
2965  06d8 2704          	jreq	L474
2966  06da               L674:
2967  06da 48            	sll	a
2968  06db 5a            	decw	x
2969  06dc 26fc          	jrne	L674
2970  06de               L474:
2971  06de 43            	cpl	a
2972  06df c4540c        	and	a,21516
2973  06e2 c7540c        	ld	21516,a
2974  06e5 2009          	jra	L1111
2975  06e7               L3111:
2976                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2978  06e7 7b02          	ld	a,(OFST+1,sp)
2979  06e9 43            	cpl	a
2980  06ea c45400        	and	a,21504
2981  06ed c75400        	ld	21504,a
2982  06f0               L1111:
2983                     ; 596 }
2986  06f0 85            	popw	x
2987  06f1 81            	ret	
3041                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
3041                     ; 617 {
3042                     	switch	.text
3043  06f2               _ADC1_GetITStatus:
3045  06f2 89            	pushw	x
3046  06f3 88            	push	a
3047       00000001      OFST:	set	1
3050                     ; 618   ITStatus itstatus = RESET;
3052                     ; 619   uint8_t temp = 0;
3054                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
3056  06f4 a30080        	cpw	x,#128
3057  06f7 274a          	jreq	L605
3058  06f9 a30140        	cpw	x,#320
3059  06fc 2745          	jreq	L605
3060  06fe a30110        	cpw	x,#272
3061  0701 2740          	jreq	L605
3062  0703 a30111        	cpw	x,#273
3063  0706 273b          	jreq	L605
3064  0708 a30112        	cpw	x,#274
3065  070b 2736          	jreq	L605
3066  070d a30113        	cpw	x,#275
3067  0710 2731          	jreq	L605
3068  0712 a30114        	cpw	x,#276
3069  0715 272c          	jreq	L605
3070  0717 a30115        	cpw	x,#277
3071  071a 2727          	jreq	L605
3072  071c a30116        	cpw	x,#278
3073  071f 2722          	jreq	L605
3074  0721 a30117        	cpw	x,#279
3075  0724 271d          	jreq	L605
3076  0726 a30118        	cpw	x,#280
3077  0729 2718          	jreq	L605
3078  072b a3011c        	cpw	x,#284
3079  072e 2713          	jreq	L605
3080  0730 a30119        	cpw	x,#281
3081  0733 270e          	jreq	L605
3082  0735 ae026e        	ldw	x,#622
3083  0738 89            	pushw	x
3084  0739 5f            	clrw	x
3085  073a 89            	pushw	x
3086  073b ae0000        	ldw	x,#L542
3087  073e cd0000        	call	_assert_failed
3089  0741 5b04          	addw	sp,#4
3090  0743               L605:
3091                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
3093  0743 7b03          	ld	a,(OFST+2,sp)
3094  0745 a4f0          	and	a,#240
3095  0747 5f            	clrw	x
3096  0748 02            	rlwa	x,a
3097  0749 a30010        	cpw	x,#16
3098  074c 262c          	jrne	L7411
3099                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
3101  074e 7b03          	ld	a,(OFST+2,sp)
3102  0750 a40f          	and	a,#15
3103  0752 6b01          	ld	(OFST+0,sp),a
3105                     ; 628     if (temp < 8)
3107  0754 a108          	cp	a,#8
3108  0756 2410          	jruge	L1511
3109                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
3111  0758 5f            	clrw	x
3112  0759 97            	ld	xl,a
3113  075a a601          	ld	a,#1
3114  075c 5d            	tnzw	x
3115  075d 2704          	jreq	L215
3116  075f               L415:
3117  075f 48            	sll	a
3118  0760 5a            	decw	x
3119  0761 26fc          	jrne	L415
3120  0763               L215:
3121  0763 c4540d        	and	a,21517
3124  0766 2017          	jra	L5511
3125  0768               L1511:
3126                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
3128  0768 a008          	sub	a,#8
3129  076a 5f            	clrw	x
3130  076b 97            	ld	xl,a
3131  076c a601          	ld	a,#1
3132  076e 5d            	tnzw	x
3133  076f 2704          	jreq	L615
3134  0771               L025:
3135  0771 48            	sll	a
3136  0772 5a            	decw	x
3137  0773 26fc          	jrne	L025
3138  0775               L615:
3139  0775 c4540c        	and	a,21516
3141  0778 2005          	jra	L5511
3142  077a               L7411:
3143                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
3145  077a c65400        	ld	a,21504
3146  077d 1403          	and	a,(OFST+2,sp)
3148  077f               L5511:
3149                     ; 641   return ((ITStatus)itstatus);
3153  077f 5b03          	addw	sp,#3
3154  0781 81            	ret	
3198                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
3198                     ; 663 {
3199                     	switch	.text
3200  0782               _ADC1_ClearITPendingBit:
3202  0782 89            	pushw	x
3203  0783 88            	push	a
3204       00000001      OFST:	set	1
3207                     ; 664   uint8_t temp = 0;
3209                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
3211  0784 a30080        	cpw	x,#128
3212  0787 274a          	jreq	L035
3213  0789 a30140        	cpw	x,#320
3214  078c 2745          	jreq	L035
3215  078e a30110        	cpw	x,#272
3216  0791 2740          	jreq	L035
3217  0793 a30111        	cpw	x,#273
3218  0796 273b          	jreq	L035
3219  0798 a30112        	cpw	x,#274
3220  079b 2736          	jreq	L035
3221  079d a30113        	cpw	x,#275
3222  07a0 2731          	jreq	L035
3223  07a2 a30114        	cpw	x,#276
3224  07a5 272c          	jreq	L035
3225  07a7 a30115        	cpw	x,#277
3226  07aa 2727          	jreq	L035
3227  07ac a30116        	cpw	x,#278
3228  07af 2722          	jreq	L035
3229  07b1 a30117        	cpw	x,#279
3230  07b4 271d          	jreq	L035
3231  07b6 a30118        	cpw	x,#280
3232  07b9 2718          	jreq	L035
3233  07bb a3011c        	cpw	x,#284
3234  07be 2713          	jreq	L035
3235  07c0 a30119        	cpw	x,#281
3236  07c3 270e          	jreq	L035
3237  07c5 ae029b        	ldw	x,#667
3238  07c8 89            	pushw	x
3239  07c9 5f            	clrw	x
3240  07ca 89            	pushw	x
3241  07cb ae0000        	ldw	x,#L542
3242  07ce cd0000        	call	_assert_failed
3244  07d1 5b04          	addw	sp,#4
3245  07d3               L035:
3246                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
3248  07d3 7b03          	ld	a,(OFST+2,sp)
3249  07d5 a4f0          	and	a,#240
3250  07d7 5f            	clrw	x
3251  07d8 02            	rlwa	x,a
3252  07d9 a30010        	cpw	x,#16
3253  07dc 2634          	jrne	L7711
3254                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
3256  07de 7b03          	ld	a,(OFST+2,sp)
3257  07e0 a40f          	and	a,#15
3258  07e2 6b01          	ld	(OFST+0,sp),a
3260                     ; 673     if (temp < 8)
3262  07e4 a108          	cp	a,#8
3263  07e6 2414          	jruge	L1021
3264                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
3266  07e8 5f            	clrw	x
3267  07e9 97            	ld	xl,a
3268  07ea a601          	ld	a,#1
3269  07ec 5d            	tnzw	x
3270  07ed 2704          	jreq	L435
3271  07ef               L635:
3272  07ef 48            	sll	a
3273  07f0 5a            	decw	x
3274  07f1 26fc          	jrne	L635
3275  07f3               L435:
3276  07f3 43            	cpl	a
3277  07f4 c4540d        	and	a,21517
3278  07f7 c7540d        	ld	21517,a
3280  07fa 201f          	jra	L5021
3281  07fc               L1021:
3282                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
3284  07fc a008          	sub	a,#8
3285  07fe 5f            	clrw	x
3286  07ff 97            	ld	xl,a
3287  0800 a601          	ld	a,#1
3288  0802 5d            	tnzw	x
3289  0803 2704          	jreq	L045
3290  0805               L245:
3291  0805 48            	sll	a
3292  0806 5a            	decw	x
3293  0807 26fc          	jrne	L245
3294  0809               L045:
3295  0809 43            	cpl	a
3296  080a c4540c        	and	a,21516
3297  080d c7540c        	ld	21516,a
3298  0810 2009          	jra	L5021
3299  0812               L7711:
3300                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
3302  0812 7b03          	ld	a,(OFST+2,sp)
3303  0814 43            	cpl	a
3304  0815 c45400        	and	a,21504
3305  0818 c75400        	ld	21504,a
3306  081b               L5021:
3307                     ; 686 }
3310  081b 5b03          	addw	sp,#3
3311  081d 81            	ret	
3324                     	xdef	_ADC1_ClearITPendingBit
3325                     	xdef	_ADC1_GetITStatus
3326                     	xdef	_ADC1_ClearFlag
3327                     	xdef	_ADC1_GetFlagStatus
3328                     	xdef	_ADC1_GetAWDChannelStatus
3329                     	xdef	_ADC1_GetBufferValue
3330                     	xdef	_ADC1_SetLowThreshold
3331                     	xdef	_ADC1_SetHighThreshold
3332                     	xdef	_ADC1_GetConversionValue
3333                     	xdef	_ADC1_StartConversion
3334                     	xdef	_ADC1_AWDChannelConfig
3335                     	xdef	_ADC1_ExternalTriggerConfig
3336                     	xdef	_ADC1_ConversionConfig
3337                     	xdef	_ADC1_SchmittTriggerConfig
3338                     	xdef	_ADC1_PrescalerConfig
3339                     	xdef	_ADC1_ITConfig
3340                     	xdef	_ADC1_DataBufferCmd
3341                     	xdef	_ADC1_ScanModeCmd
3342                     	xdef	_ADC1_Cmd
3343                     	xdef	_ADC1_Init
3344                     	xdef	_ADC1_DeInit
3345                     	xref	_assert_failed
3346                     .const:	section	.text
3347  0000               L542:
3348  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
3349  0012 697665725c73  	dc.b	"iver\src\stm8s_adc"
3350  0024 312e6300      	dc.b	"1.c",0
3370                     	end
