   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  16                     	bsct
  17  0000               L3_blkCnt:
  18  0000 00            	dc.b	0
  19  0001               L5_fileBlkCnt:
  20  0001 00000000      	dc.l	0
  21  0005               L7_fileNoCnt:
  22  0005 0000          	dc.w	0
  23                     	xref	_GetCfg
  24                     	xref	_clkInit
  25                     	xref	_GetNxtFileName
 405                     .const:	section	.text
 406  0000               L24:
 407  0000 0000c350      	dc.l	50000
 408                     ; 94 void main( void )
 408                     ; 95 {
 409                     	scross	off
 410                     	switch	.text
 411  0000               _main:
 413  0000 5232          	subw	sp,#50
 414       00000032      OFST:	set	50
 417                     ; 99 	FRESULT res = FR_OK;
 419  0002 0f30          	clr	(OFST-2,sp)
 421                     ; 104 	clkInit();
 423  0004 cd0419        	call	_clkInit
 425                     ; 105 	LedInit();
 427  0007 cd0000        	call	_LedInit
 429                     ; 106 	sysTickInit();
 431  000a cd0000        	call	_sysTickInit
 433                     ; 109 	enableInterrupts();
 436  000d 9a            	rim	
 438                     ; 111 	dly(50000l);
 441  000e aec350        	ldw	x,#50000
 442  0011 89            	pushw	x
 443  0012 5f            	clrw	x
 444  0013 89            	pushw	x
 445  0014 cd0000        	call	_dly
 447  0017 5b04          	addw	sp,#4
 448                     ; 117 	res |= pf_mount(&fid);	
 450  0019 96            	ldw	x,sp
 451  001a 1c0005        	addw	x,#OFST-45
 452  001d cd0000        	call	_pf_mount
 454  0020 1a30          	or	a,(OFST-2,sp)
 455  0022 6b30          	ld	(OFST-2,sp),a
 457                     ; 118 	res |= pf_open("CFG");
 459  0024 ae0004        	ldw	x,#L722
 460  0027 cd0000        	call	_pf_open
 462  002a 1a30          	or	a,(OFST-2,sp)
 463  002c 6b30          	ld	(OFST-2,sp),a
 465                     ; 119 	res |= pf_read(cfg, 13 , &pbr);
 467  002e 96            	ldw	x,sp
 468  002f 1c0003        	addw	x,#OFST-47
 469  0032 89            	pushw	x
 470  0033 ae000d        	ldw	x,#13
 471  0036 89            	pushw	x
 472  0037 ae000f        	ldw	x,#L11_cfg
 473  003a cd0000        	call	_pf_read
 475  003d 5b04          	addw	sp,#4
 476  003f 1a30          	or	a,(OFST-2,sp)
 477  0041 6b30          	ld	(OFST-2,sp),a
 479                     ; 121 	res |= GetCfg(cfg, &loggerCfg);
 481  0043 a600          	ld	a,#_loggerCfg
 482  0045 97            	ld	xl,a
 483  0046 a60f          	ld	a,#L11_cfg
 484  0048 95            	ld	xh,a
 485  0049 cd02ee        	call	_GetCfg
 487  004c 1f01          	ldw	(OFST-49,sp),x
 489  004e 7b30          	ld	a,(OFST-2,sp)
 490  0050 1a02          	or	a,(OFST-48,sp)
 491  0052 6b30          	ld	(OFST-2,sp),a
 493                     ; 123 	if(FR_OK == res){
 495  0054 2644          	jrne	L132
 496                     ; 126 		for(i = 0; i < 10; i++) {
 498  0056 6b2f          	ld	(OFST-3,sp),a
 500  0058               L332:
 501                     ; 127 			LED_TOGGLE();
 503  0058 9018500f      	bcpl	20495,#4
 504                     ; 128 			dly(10000l);
 506  005c ae2710        	ldw	x,#10000
 507  005f 89            	pushw	x
 508  0060 5f            	clrw	x
 509  0061 89            	pushw	x
 510  0062 cd0000        	call	_dly
 512  0065 5b04          	addw	sp,#4
 513                     ; 126 		for(i = 0; i < 10; i++) {
 515  0067 0c2f          	inc	(OFST-3,sp)
 519  0069 7b2f          	ld	a,(OFST-3,sp)
 520  006b a10a          	cp	a,#10
 521  006d 25e9          	jrult	L332
 522                     ; 132 		fileBlkCnt = loggerCfg.fileSzInBlock;
 524  006f be09          	ldw	x,_loggerCfg+9
 525  0071 bf03          	ldw	L5_fileBlkCnt+2,x
 526  0073 be07          	ldw	x,_loggerCfg+7
 527  0075 bf01          	ldw	L5_fileBlkCnt,x
 528                     ; 133 		fileNoCnt = loggerCfg.fileNo;
 530  0077 be0b          	ldw	x,_loggerCfg+11
 531  0079 bf05          	ldw	L7_fileNoCnt,x
 532                     ; 136 		res |= pf_open(loggerCfg.firstFileName);
 534  007b ae0002        	ldw	x,#_loggerCfg+2
 535  007e cd0000        	call	_pf_open
 537  0081 1a30          	or	a,(OFST-2,sp)
 538  0083 6b30          	ld	(OFST-2,sp),a
 540                     ; 138 		if(FR_OK == res){
 542  0085 2604          	jrne	L142
 543                     ; 141 			fsm.state = S0_RST;
 545  0087 6b31          	ld	(OFST-1,sp),a
 547                     ; 142 			fsm.error = NO_ERR;
 549  0089 2006          	jra	L342
 550  008b               L142:
 551                     ; 145 			fsm.state = S4_ERR;
 553  008b a604          	ld	a,#4
 554  008d 6b31          	ld	(OFST-1,sp),a
 556                     ; 146 			fsm.error = ERR_CARD_INIT;
 558  008f a601          	ld	a,#1
 559  0091               L342:
 561  0091 6b32          	ld	(OFST+0,sp),a
 563                     ; 149 		disableInterrupts();
 566  0093 9b            	sim	
 568                     ; 150 		adcInit();
 571  0094 cd0000        	call	_adcInit
 573                     ; 152 		enableInterrupts();
 576  0097 9a            	rim	
 580  0098 2008          	jra	L542
 581  009a               L132:
 582                     ; 155 		fsm.state = S4_ERR;
 584  009a a604          	ld	a,#4
 585  009c 6b31          	ld	(OFST-1,sp),a
 587                     ; 156 		fsm.error = ERR_CARD_INIT;
 589  009e a601          	ld	a,#1
 590  00a0 6b32          	ld	(OFST+0,sp),a
 592  00a2               L542:
 593                     ; 159 	LED_SET_TOGGLE_FREQ(0);	
 595  00a2 5f            	clrw	x
 596  00a3 cf0002        	ldw	_ledFreqInTick+2,x
 597  00a6 cf0000        	ldw	_ledFreqInTick,x
 598  00a9 ce0002        	ldw	x,_sysTick+2
 599  00ac cf0002        	ldw	_ledNxtToggle+2,x
 600  00af ce0000        	ldw	x,_sysTick
 601  00b2 cf0000        	ldw	_ledNxtToggle,x
 602  00b5               L742:
 603                     ; 166 		switch (fsm.state){
 605  00b5 7b31          	ld	a,(OFST-1,sp)
 607                     ; 217 			default: break;
 608  00b7 2711          	jreq	L51
 609  00b9 4a            	dec	a
 610  00ba 2732          	jreq	L71
 611  00bc 4a            	dec	a
 612  00bd 272f          	jreq	L71
 613  00bf 4a            	dec	a
 614  00c0 2734          	jreq	L12
 615  00c2 4a            	dec	a
 616  00c3 2759          	jreq	L32
 617  00c5 4a            	dec	a
 618  00c6 2772          	jreq	L52
 619  00c8 20eb          	jra	L742
 620  00ca               L51:
 621                     ; 167 			case S0_RST:
 621                     ; 168 				//Reset state, do nothing just 
 621                     ; 169 				//wait for event to happen 
 621                     ; 170 				if( 0x3 == buffer_rdy ){
 623  00ca c60000        	ld	a,_buffer_rdy
 624  00cd a103          	cp	a,#3
 625  00cf 2609          	jrne	L752
 626                     ; 173 					fsm.state = S4_ERR;
 628  00d1 a604          	ld	a,#4
 629  00d3 6b31          	ld	(OFST-1,sp),a
 631                     ; 174 					fsm.error = ERR_BUFF_OVERLAP;
 633  00d5 4c            	inc	a
 634  00d6 6b32          	ld	(OFST+0,sp),a
 637  00d8 20db          	jra	L742
 638  00da               L752:
 639                     ; 175 				} else if (0x01 == buffer_rdy) {
 641  00da c60000        	ld	a,_buffer_rdy
 642  00dd 4a            	dec	a
 643  00de 2603          	jrne	L362
 644                     ; 177 					fsm.state = S1_WR_BUF0;
 646  00e0 4c            	inc	a
 648  00e1 2037          	jp	LC001
 649  00e3               L362:
 650                     ; 178 				} else if ( 0x02 == buffer_rdy) {
 652  00e3 c60000        	ld	a,_buffer_rdy
 653  00e6 a102          	cp	a,#2
 654  00e8 26cb          	jrne	L742
 655                     ; 180 					fsm.state = S2_WR_BUF1;
 657  00ea a602          	ld	a,#2
 658  00ec 202c          	jp	LC001
 659  00ee               L71:
 660                     ; 183 			case S1_WR_BUF0:
 660                     ; 184 			case S2_WR_BUF1:
 660                     ; 185 				//Write ADC buffer 1 state
 660                     ; 186 				Wr2SD(&fsm);
 662  00ee 96            	ldw	x,sp
 663  00ef 1c0031        	addw	x,#OFST-1
 664  00f2 ad4c          	call	L31_Wr2SD
 666                     ; 187 				break;
 668  00f4 20bf          	jra	L742
 669  00f6               L12:
 670                     ; 188 			case S3_NXT_FILE:
 670                     ; 189 				fileBlkCnt = loggerCfg.fileSzInBlock;
 672  00f6 be09          	ldw	x,_loggerCfg+9
 673  00f8 bf03          	ldw	L5_fileBlkCnt+2,x
 674  00fa be07          	ldw	x,_loggerCfg+7
 675  00fc bf01          	ldw	L5_fileBlkCnt,x
 676                     ; 191 				if(--fileNoCnt != 0){
 678  00fe be05          	ldw	x,L7_fileNoCnt
 679  0100 5a            	decw	x
 680  0101 bf05          	ldw	L7_fileNoCnt,x
 681  0103 2713          	jreq	L172
 682                     ; 193 					GetNxtFileName(loggerCfg.firstFileName);
 684  0105 a602          	ld	a,#_loggerCfg+2
 685  0107 cd01cf        	call	_GetNxtFileName
 687                     ; 195 					res = pf_open(loggerCfg.firstFileName);
 689  010a ae0002        	ldw	x,#_loggerCfg+2
 690  010d cd0000        	call	_pf_open
 692  0110 6b30          	ld	(OFST-2,sp),a
 694                     ; 196 					if( FR_OK != res ){
 696  0112 2706          	jreq	LC001
 697                     ; 197 						fsm.state = S4_ERR;
 699  0114 a604          	ld	a,#4
 701  0116 2002          	jp	LC001
 702                     ; 200 						fsm.state = S0_RST;
 703  0118               L172:
 704                     ; 206 					fsm.state = S5_COMPLETE;
 706  0118 a605          	ld	a,#5
 707  011a               LC001:
 709  011a 6b31          	ld	(OFST-1,sp),a
 711  011c 2097          	jra	L742
 712  011e               L32:
 713                     ; 211 			case S4_ERR:
 713                     ; 212 				LED_SET_TOGGLE_FREQ(50000);
 715  011e aec350        	ldw	x,#50000
 716  0121 cf0002        	ldw	_ledFreqInTick+2,x
 717  0124 5f            	clrw	x
 718  0125 cf0000        	ldw	_ledFreqInTick,x
 719  0128 ae0000        	ldw	x,#_sysTick
 720  012b cd0000        	call	c_ltor
 722  012e ae0000        	ldw	x,#L24
 723  0131 cd0000        	call	c_ladd
 725  0134 ae0000        	ldw	x,#_ledNxtToggle
 726  0137 cd0000        	call	c_rtol
 728  013a               L52:
 729                     ; 213 			case S5_COMPLETE:
 729                     ; 214 				LED_SET();
 731  013a 7218500f      	bset	20495,#4
 732  013e               L103:
 733                     ; 215 				while(1);
 735  013e 20fe          	jra	L103
 736                     ; 217 			default: break;
 816                     ; 233 static void Wr2SD( fsm_t * pfsm ){
 817                     	switch	.text
 818  0140               L31_Wr2SD:
 820  0140 89            	pushw	x
 821  0141 5205          	subw	sp,#5
 822       00000005      OFST:	set	5
 825                     ; 240 	if( S1_WR_BUF0 == pfsm->state){
 827  0143 f6            	ld	a,(x)
 828  0144 4a            	dec	a
 829  0145 2607          	jrne	L143
 830                     ; 241 		pBuf = adcBuffer0; bufNo = 0;
 832  0147 ae0000        	ldw	x,#_adcBuffer0
 833  014a 1f03          	ldw	(OFST-2,sp),x
 837  014c 2007          	jra	L343
 838  014e               L143:
 839                     ; 243 		pBuf = adcBuffer1; bufNo = 1;
 841  014e ae0000        	ldw	x,#_adcBuffer1
 842  0151 1f03          	ldw	(OFST-2,sp),x
 846  0153 a601          	ld	a,#1
 847  0155               L343:
 849  0155 6b05          	ld	(OFST+0,sp),a
 851                     ; 245 	RELEASE_BUFF_FOR_WR(bufNo); //clear this flag
 853  0157 5f            	clrw	x
 854  0158 97            	ld	xl,a
 855  0159 a601          	ld	a,#1
 856  015b 5d            	tnzw	x
 857  015c 2704          	jreq	L64
 858  015e               L05:
 859  015e 48            	sll	a
 860  015f 5a            	decw	x
 861  0160 26fc          	jrne	L05
 862  0162               L64:
 863  0162 43            	cpl	a
 864  0163 c40000        	and	a,_buffer_rdy
 865  0166 c70000        	ld	_buffer_rdy,a
 866                     ; 247 	LED_SET();
 868  0169 7218500f      	bset	20495,#4
 869                     ; 248 	res = pf_write((void*)pBuf,BUFFER_SZ_IN_BYTES, &pbr);
 871  016d 96            	ldw	x,sp
 872  016e 5c            	incw	x
 873  016f 89            	pushw	x
 874  0170 ae0100        	ldw	x,#256
 875  0173 89            	pushw	x
 876  0174 1e07          	ldw	x,(OFST+2,sp)
 877  0176 cd0000        	call	_pf_write
 879  0179 5b04          	addw	sp,#4
 880  017b 6b05          	ld	(OFST+0,sp),a
 882                     ; 249 	LED_CLR();
 884  017d 7219500f      	bres	20495,#4
 885                     ; 251 	if(FR_OK != res){
 887  0181 2709          	jreq	L543
 888                     ; 254 		pfsm->error = ERR_WR_DATA;
 890  0183 1e06          	ldw	x,(OFST+1,sp)
 891  0185 a602          	ld	a,#2
 892  0187 e701          	ld	(1,x),a
 893                     ; 255 		pfsm->state = S4_ERR;
 895  0189 48            	sll	a
 896                     ; 256 		return;
 898  018a 2027          	jp	LC002
 899  018c               L543:
 900                     ; 259 	if(NO_BUFF_PER_BLK == ++blkCnt){
 902  018c 3c00          	inc	L3_blkCnt
 903  018e b600          	ld	a,L3_blkCnt
 904  0190 a102          	cp	a,#2
 905  0192 2636          	jrne	L743
 906                     ; 261 		blkCnt = 0;
 908  0194 3f00          	clr	L3_blkCnt
 909                     ; 262 		LED_SET();
 911  0196 7218500f      	bset	20495,#4
 912                     ; 263 		res = pf_write(0,0,&pbr);
 914  019a 96            	ldw	x,sp
 915  019b 5c            	incw	x
 916  019c 89            	pushw	x
 917  019d 5f            	clrw	x
 918  019e 89            	pushw	x
 919  019f cd0000        	call	_pf_write
 921  01a2 5b04          	addw	sp,#4
 922  01a4 6b05          	ld	(OFST+0,sp),a
 924                     ; 264 		LED_CLR();
 926  01a6 7219500f      	bres	20495,#4
 927                     ; 267 		if(FR_OK != res){
 929  01aa 270b          	jreq	L153
 930                     ; 269 			pfsm->error = ERR_WR_NO_RESP;
 932  01ac 1e06          	ldw	x,(OFST+1,sp)
 933  01ae a603          	ld	a,#3
 934  01b0 e701          	ld	(1,x),a
 935                     ; 270 			pfsm->state = S4_ERR;
 937  01b2 4c            	inc	a
 938  01b3               LC002:
 939  01b3 f7            	ld	(x),a
 940                     ; 271 			return;
 941  01b4               L65:
 944  01b4 5b07          	addw	sp,#7
 945  01b6 81            	ret	
 946  01b7               L153:
 947                     ; 274 		if(0 == --fileBlkCnt){
 949  01b7 ae0001        	ldw	x,#L5_fileBlkCnt
 950  01ba a601          	ld	a,#1
 951  01bc cd0000        	call	c_lgsbc
 953  01bf cd0000        	call	c_lzmp
 955  01c2 2606          	jrne	L743
 956                     ; 277 			pfsm->state = S3_NXT_FILE;
 958  01c4 1e06          	ldw	x,(OFST+1,sp)
 959  01c6 a603          	ld	a,#3
 960                     ; 279 			return;
 962  01c8 20e9          	jp	LC002
 963  01ca               L743:
 964                     ; 284 	pfsm->state = S0_RST; 
 966  01ca 1e06          	ldw	x,(OFST+1,sp)
 967  01cc 7f            	clr	(x)
 968                     ; 286 }
 970  01cd 20e5          	jra	L65
1012                     ; 299 void GetNxtFileName(@tiny char * fname){
1013                     	switch	.text
1014  01cf               _GetNxtFileName:
1016  01cf 88            	push	a
1017  01d0 88            	push	a
1018       00000001      OFST:	set	1
1021                     ; 301 	uint8_t val = 0;
1023  01d1 0f01          	clr	(OFST+0,sp)
1025                     ; 303 	if(0x39 == fname[3]){
1027  01d3 5f            	clrw	x
1028  01d4 97            	ld	xl,a
1029  01d5 e603          	ld	a,(3,x)
1030  01d7 a139          	cp	a,#57
1031  01d9 2604          	jrne	L704
1032                     ; 304 		val = 0x01;
1034  01db a601          	ld	a,#1
1035  01dd 6b01          	ld	(OFST+0,sp),a
1037  01df               L704:
1038                     ; 306 	if(0x39 == fname[2]) {
1040  01df 7b02          	ld	a,(OFST+1,sp)
1041  01e1 5f            	clrw	x
1042  01e2 97            	ld	xl,a
1043  01e3 e602          	ld	a,(2,x)
1044  01e5 a139          	cp	a,#57
1045  01e7 2604          	jrne	L114
1046                     ; 307 		val += 0x02;
1048  01e9 0c01          	inc	(OFST+0,sp)
1049  01eb 0c01          	inc	(OFST+0,sp)
1051  01ed               L114:
1052                     ; 309 	if(0x39 == fname[1]) {
1054  01ed 7b02          	ld	a,(OFST+1,sp)
1055  01ef 5f            	clrw	x
1056  01f0 97            	ld	xl,a
1057  01f1 e601          	ld	a,(1,x)
1058  01f3 a139          	cp	a,#57
1059  01f5 2606          	jrne	L314
1060                     ; 310 		val += 0x04;
1062  01f7 7b01          	ld	a,(OFST+0,sp)
1063  01f9 ab04          	add	a,#4
1064  01fb 6b01          	ld	(OFST+0,sp),a
1066  01fd               L314:
1067                     ; 312 	if(0x39 == fname[0]) {
1069  01fd 7b02          	ld	a,(OFST+1,sp)
1070  01ff 5f            	clrw	x
1071  0200 97            	ld	xl,a
1072  0201 f6            	ld	a,(x)
1073  0202 a139          	cp	a,#57
1074  0204 2606          	jrne	L514
1075                     ; 313 		val += 0x08;
1077  0206 7b01          	ld	a,(OFST+0,sp)
1078  0208 ab08          	add	a,#8
1079  020a 6b01          	ld	(OFST+0,sp),a
1081  020c               L514:
1082                     ; 316 	switch(val){
1084  020c 7b01          	ld	a,(OFST+0,sp)
1086                     ; 330 		default: fname[3]++; break;
1087  020e 4a            	dec	a
1088  020f 2714          	jreq	L553
1089  0211 a002          	sub	a,#2
1090  0213 2720          	jreq	L753
1091  0215 a004          	sub	a,#4
1092  0217 2734          	jreq	L163
1093  0219 a008          	sub	a,#8
1094  021b 274f          	jreq	L363
1097  021d 7b02          	ld	a,(OFST+1,sp)
1098  021f 5f            	clrw	x
1099  0220 97            	ld	xl,a
1100  0221 6c03          	inc	(3,x)
1103  0223 2066          	jra	L124
1104  0225               L553:
1105                     ; 317 		case 0x01: fname[3] = 0x30; 
1107  0225 7b02          	ld	a,(OFST+1,sp)
1108  0227 5f            	clrw	x
1109  0228 97            	ld	xl,a
1110  0229 a630          	ld	a,#48
1111  022b e703          	ld	(3,x),a
1112                     ; 318 							 fname[2]++;break;
1114  022d 5f            	clrw	x
1115  022e 7b02          	ld	a,(OFST+1,sp)
1116  0230 97            	ld	xl,a
1117  0231 6c02          	inc	(2,x)
1120  0233 2056          	jra	L124
1121  0235               L753:
1122                     ; 319 		case 0x03: fname[3] = 0x30; 
1124  0235 7b02          	ld	a,(OFST+1,sp)
1125  0237 5f            	clrw	x
1126  0238 97            	ld	xl,a
1127  0239 a630          	ld	a,#48
1128  023b e703          	ld	(3,x),a
1129                     ; 320 							 fname[2] = 0x30; 
1131  023d 5f            	clrw	x
1132  023e 7b02          	ld	a,(OFST+1,sp)
1133  0240 97            	ld	xl,a
1134  0241 a630          	ld	a,#48
1135  0243 e702          	ld	(2,x),a
1136                     ; 321 							 fname[1]++; break;
1138  0245 5f            	clrw	x
1139  0246 7b02          	ld	a,(OFST+1,sp)
1140  0248 97            	ld	xl,a
1141  0249 6c01          	inc	(1,x)
1144  024b 203e          	jra	L124
1145  024d               L163:
1146                     ; 322 		case 0x07: fname[3] = 0x30; 
1148  024d 7b02          	ld	a,(OFST+1,sp)
1149  024f 5f            	clrw	x
1150  0250 97            	ld	xl,a
1151  0251 a630          	ld	a,#48
1152  0253 e703          	ld	(3,x),a
1153                     ; 323 							 fname[2] = 0x30; 
1155  0255 5f            	clrw	x
1156  0256 7b02          	ld	a,(OFST+1,sp)
1157  0258 97            	ld	xl,a
1158  0259 a630          	ld	a,#48
1159  025b e702          	ld	(2,x),a
1160                     ; 324 							 fname[1] = 0x30; 
1162  025d 5f            	clrw	x
1163  025e 7b02          	ld	a,(OFST+1,sp)
1164  0260 97            	ld	xl,a
1165  0261 a630          	ld	a,#48
1166  0263 e701          	ld	(1,x),a
1167                     ; 325 							 fname[0]++; break;
1169  0265 5f            	clrw	x
1170  0266 7b02          	ld	a,(OFST+1,sp)
1171  0268 97            	ld	xl,a
1172  0269 7c            	inc	(x)
1175  026a 201f          	jra	L124
1176  026c               L363:
1177                     ; 326 		case 0x0f: fname[3] = 0x30; 
1179  026c 7b02          	ld	a,(OFST+1,sp)
1180  026e 5f            	clrw	x
1181  026f 97            	ld	xl,a
1182  0270 a630          	ld	a,#48
1183  0272 e703          	ld	(3,x),a
1184                     ; 327 							 fname[2] = 0x30; 
1186  0274 5f            	clrw	x
1187  0275 7b02          	ld	a,(OFST+1,sp)
1188  0277 97            	ld	xl,a
1189  0278 a630          	ld	a,#48
1190  027a e702          	ld	(2,x),a
1191                     ; 328 							 fname[1] = 0x30; 
1193  027c 5f            	clrw	x
1194  027d 7b02          	ld	a,(OFST+1,sp)
1195  027f 97            	ld	xl,a
1196  0280 a630          	ld	a,#48
1197  0282 e701          	ld	(1,x),a
1198                     ; 329 							 fname[0] = 0x30; break;
1200  0284 5f            	clrw	x
1201  0285 7b02          	ld	a,(OFST+1,sp)
1202  0287 97            	ld	xl,a
1203  0288 a630          	ld	a,#48
1204  028a f7            	ld	(x),a
1207  028b               L124:
1208                     ; 332 }
1211  028b 85            	popw	x
1212  028c 81            	ret	
1261                     ; 345 void ConvertFileName(uint16_t firstFileName, char * fname){
1262                     	switch	.text
1263  028d               _ConvertFileName:
1265  028d 89            	pushw	x
1266  028e 89            	pushw	x
1267       00000002      OFST:	set	2
1270                     ; 346 	uint16_t val = 0;
1272                     ; 348 	val = firstFileName/1000;
1274  028f 90ae03e8      	ldw	y,#1000
1275  0293 65            	divw	x,y
1276  0294 1f01          	ldw	(OFST-1,sp),x
1278                     ; 349 	fname[0] = val + 0x30;
1280  0296 7b02          	ld	a,(OFST+0,sp)
1281  0298 1e07          	ldw	x,(OFST+5,sp)
1282  029a ab30          	add	a,#48
1283  029c f7            	ld	(x),a
1284                     ; 350 	firstFileName -=  val*1000;
1286  029d 90ae03e8      	ldw	y,#1000
1287  02a1 1e01          	ldw	x,(OFST-1,sp)
1288  02a3 cd0000        	call	c_imul
1290  02a6 72f003        	subw	x,(OFST+1,sp)
1291  02a9 50            	negw	x
1292  02aa 1f03          	ldw	(OFST+1,sp),x
1293                     ; 351 	val = firstFileName/100;
1295  02ac a664          	ld	a,#100
1296  02ae 62            	div	x,a
1297  02af 1f01          	ldw	(OFST-1,sp),x
1299                     ; 352 	fname[1] = val + 0x30;
1301  02b1 7b02          	ld	a,(OFST+0,sp)
1302  02b3 1e07          	ldw	x,(OFST+5,sp)
1303  02b5 ab30          	add	a,#48
1304  02b7 e701          	ld	(1,x),a
1305                     ; 353 	firstFileName -=  val*100;
1307  02b9 a664          	ld	a,#100
1308  02bb 1e01          	ldw	x,(OFST-1,sp)
1309  02bd cd0000        	call	c_bmulx
1311  02c0 72f003        	subw	x,(OFST+1,sp)
1312  02c3 50            	negw	x
1313  02c4 1f03          	ldw	(OFST+1,sp),x
1314                     ; 354 	val = firstFileName/10;
1316  02c6 a60a          	ld	a,#10
1317  02c8 62            	div	x,a
1318  02c9 1f01          	ldw	(OFST-1,sp),x
1320                     ; 355 	fname[2] = val + 0x30;
1322  02cb 7b02          	ld	a,(OFST+0,sp)
1323  02cd 1e07          	ldw	x,(OFST+5,sp)
1324  02cf ab30          	add	a,#48
1325  02d1 e702          	ld	(2,x),a
1326                     ; 356 	firstFileName -=  val*10;
1328  02d3 1e01          	ldw	x,(OFST-1,sp)
1329  02d5 58            	sllw	x
1330  02d6 58            	sllw	x
1331  02d7 72fb01        	addw	x,(OFST-1,sp)
1332  02da 58            	sllw	x
1334  02db 72f003        	subw	x,(OFST+1,sp)
1335  02de 50            	negw	x
1336  02df 1f03          	ldw	(OFST+1,sp),x
1337                     ; 357 	fname[3] = firstFileName + 0x30;
1339  02e1 7b04          	ld	a,(OFST+2,sp)
1340  02e3 1e07          	ldw	x,(OFST+5,sp)
1341  02e5 ab30          	add	a,#48
1342  02e7 e703          	ld	(3,x),a
1343                     ; 358 	fname[4] = '\0';
1345  02e9 6f04          	clr	(4,x)
1346                     ; 359 }
1349  02eb 5b04          	addw	sp,#4
1350  02ed 81            	ret	
1353                     	xref	_IsValidCfgBuf
1459                     ; 374 UINT GetCfg(@tiny uint8_t * pCfgBuf, @tiny cfg_t * pcfg){
1460                     	switch	.text
1461  02ee               _GetCfg:
1463  02ee 89            	pushw	x
1464  02ef 520a          	subw	sp,#10
1465       0000000a      OFST:	set	10
1468                     ; 377 	if(!IsValidCfgBuf(pCfgBuf)) return 1; 
1470  02f1 9e            	ld	a,xh
1471  02f2 cd03ef        	call	_IsValidCfgBuf
1473  02f5 5d            	tnzw	x
1474  02f6 2604          	jrne	L515
1477  02f8 5c            	incw	x
1479  02f9 cc03ec        	jra	L001
1480  02fc               L515:
1481                     ; 380 	pcfg->sampFreq = pCfgBuf[0]+(((uint16_t)pCfgBuf[1])<<8);
1483  02fc 7b0b          	ld	a,(OFST+1,sp)
1484  02fe 5f            	clrw	x
1485  02ff 97            	ld	xl,a
1486  0300 f6            	ld	a,(x)
1487  0301 6b08          	ld	(OFST-2,sp),a
1489  0303 5f            	clrw	x
1490  0304 7b0b          	ld	a,(OFST+1,sp)
1491  0306 97            	ld	xl,a
1492  0307 e601          	ld	a,(1,x)
1493  0309 5f            	clrw	x
1494  030a 97            	ld	xl,a
1495  030b 4f            	clr	a
1496  030c 1b08          	add	a,(OFST-2,sp)
1497  030e 2401          	jrnc	L07
1498  0310 5c            	incw	x
1499  0311               L07:
1500  0311 02            	rlwa	x,a
1501  0312 1f06          	ldw	(OFST-4,sp),x
1503  0314 5f            	clrw	x
1504  0315 7b0c          	ld	a,(OFST+2,sp)
1505  0317 97            	ld	xl,a
1506  0318 1606          	ldw	y,(OFST-4,sp)
1507  031a ff            	ldw	(x),y
1508                     ; 382 	fID = pCfgBuf[2]+(((uint16_t)pCfgBuf[3])<<8);
1510  031b 5f            	clrw	x
1511  031c 7b0b          	ld	a,(OFST+1,sp)
1512  031e 97            	ld	xl,a
1513  031f e602          	ld	a,(2,x)
1514  0321 6b08          	ld	(OFST-2,sp),a
1516  0323 5f            	clrw	x
1517  0324 7b0b          	ld	a,(OFST+1,sp)
1518  0326 97            	ld	xl,a
1519  0327 e603          	ld	a,(3,x)
1520  0329 5f            	clrw	x
1521  032a 97            	ld	xl,a
1522  032b 4f            	clr	a
1523  032c 1b08          	add	a,(OFST-2,sp)
1524  032e 2401          	jrnc	L27
1525  0330 5c            	incw	x
1526  0331               L27:
1527  0331 02            	rlwa	x,a
1528  0332 1f09          	ldw	(OFST-1,sp),x
1530                     ; 384 	ConvertFileName(fID, pcfg->firstFileName);
1532  0334 7b0c          	ld	a,(OFST+2,sp)
1533  0336 ab02          	add	a,#2
1534  0338 5f            	clrw	x
1535  0339 97            	ld	xl,a
1536  033a 89            	pushw	x
1537  033b 1e0b          	ldw	x,(OFST+1,sp)
1538  033d cd028d        	call	_ConvertFileName
1540  0340 85            	popw	x
1541                     ; 385 	pcfg->fileNo = pCfgBuf[4]+(((uint16_t)pCfgBuf[5])<<8);
1543  0341 7b0b          	ld	a,(OFST+1,sp)
1544  0343 5f            	clrw	x
1545  0344 97            	ld	xl,a
1546  0345 e604          	ld	a,(4,x)
1547  0347 6b08          	ld	(OFST-2,sp),a
1549  0349 5f            	clrw	x
1550  034a 7b0b          	ld	a,(OFST+1,sp)
1551  034c 97            	ld	xl,a
1552  034d e605          	ld	a,(5,x)
1553  034f 5f            	clrw	x
1554  0350 97            	ld	xl,a
1555  0351 4f            	clr	a
1556  0352 1b08          	add	a,(OFST-2,sp)
1557  0354 2401          	jrnc	L67
1558  0356 5c            	incw	x
1559  0357               L67:
1560  0357 02            	rlwa	x,a
1561  0358 1f06          	ldw	(OFST-4,sp),x
1563  035a 5f            	clrw	x
1564  035b 7b0c          	ld	a,(OFST+2,sp)
1565  035d 97            	ld	xl,a
1566  035e 1606          	ldw	y,(OFST-4,sp)
1567  0360 ef0b          	ldw	(11,x),y
1568                     ; 386 	pcfg->fileSzInBlock = pCfgBuf[6]+ \
1568                     ; 387 												(((uint32_t)pCfgBuf[7])<<8) + \
1568                     ; 388 												(((uint32_t)pCfgBuf[8])<<16) + \
1568                     ; 389 												(((uint32_t)pCfgBuf[9])<<24);
1570  0362 5f            	clrw	x
1571  0363 7b0b          	ld	a,(OFST+1,sp)
1572  0365 97            	ld	xl,a
1573  0366 e609          	ld	a,(9,x)
1574  0368 b703          	ld	c_lreg+3,a
1575  036a 3f02          	clr	c_lreg+2
1576  036c 3f01          	clr	c_lreg+1
1577  036e 3f00          	clr	c_lreg
1578  0370 a618          	ld	a,#24
1579  0372 cd0000        	call	c_llsh
1581  0375 96            	ldw	x,sp
1582  0376 1c0005        	addw	x,#OFST-5
1583  0379 cd0000        	call	c_rtol
1586  037c 7b0b          	ld	a,(OFST+1,sp)
1587  037e 5f            	clrw	x
1588  037f 97            	ld	xl,a
1589  0380 e608          	ld	a,(8,x)
1590  0382 b703          	ld	c_lreg+3,a
1591  0384 3f02          	clr	c_lreg+2
1592  0386 3f01          	clr	c_lreg+1
1593  0388 3f00          	clr	c_lreg
1594  038a be02          	ldw	x,c_lreg+2
1595  038c bf00          	ldw	c_lreg,x
1596  038e 5f            	clrw	x
1597  038f bf02          	ldw	c_lreg+2,x
1598  0391 96            	ldw	x,sp
1599  0392 5c            	incw	x
1600  0393 cd0000        	call	c_rtol
1603  0396 7b0b          	ld	a,(OFST+1,sp)
1604  0398 5f            	clrw	x
1605  0399 97            	ld	xl,a
1606  039a e607          	ld	a,(7,x)
1607  039c 5f            	clrw	x
1608  039d 97            	ld	xl,a
1609  039e 90ae0100      	ldw	y,#256
1610  03a2 cd0000        	call	c_umul
1612  03a5 7b0b          	ld	a,(OFST+1,sp)
1613  03a7 5f            	clrw	x
1614  03a8 97            	ld	xl,a
1615  03a9 e606          	ld	a,(6,x)
1616  03ab cd0000        	call	c_ladc
1618  03ae 96            	ldw	x,sp
1619  03af 5c            	incw	x
1620  03b0 cd0000        	call	c_ladd
1622  03b3 96            	ldw	x,sp
1623  03b4 1c0005        	addw	x,#OFST-5
1624  03b7 cd0000        	call	c_ladd
1626  03ba 7b0c          	ld	a,(OFST+2,sp)
1627  03bc 5f            	clrw	x
1628  03bd 97            	ld	xl,a
1629  03be 1c0007        	addw	x,#7
1630  03c1 cd0000        	call	c_rtol
1632                     ; 390 	pcfg->channel = pCfgBuf[10];
1634  03c4 7b0c          	ld	a,(OFST+2,sp)
1635  03c6 5f            	clrw	x
1636  03c7 97            	ld	xl,a
1637  03c8 7b0b          	ld	a,(OFST+1,sp)
1638  03ca 905f          	clrw	y
1639  03cc 9097          	ld	yl,a
1640  03ce 90e60a        	ld	a,(10,y)
1641  03d1 e70d          	ld	(13,x),a
1642                     ; 391 	if(pCfgBuf[11] == 0)
1644  03d3 5f            	clrw	x
1645  03d4 7b0b          	ld	a,(OFST+1,sp)
1646  03d6 97            	ld	xl,a
1647  03d7 e60b          	ld	a,(11,x)
1648  03d9 2608          	jrne	L715
1649                     ; 393 		pcfg->isFullResultion = false;
1651  03db 7b0c          	ld	a,(OFST+2,sp)
1652  03dd 5f            	clrw	x
1653  03de 97            	ld	xl,a
1654  03df 6f0e          	clr	(14,x)
1656  03e1 2008          	jra	L125
1657  03e3               L715:
1658                     ; 395 		pcfg->isFullResultion = true;
1660  03e3 7b0c          	ld	a,(OFST+2,sp)
1661  03e5 5f            	clrw	x
1662  03e6 97            	ld	xl,a
1663  03e7 a601          	ld	a,#1
1664  03e9 e70e          	ld	(14,x),a
1665  03eb               L125:
1666                     ; 398 	return 0x0;
1668  03eb 5f            	clrw	x
1670  03ec               L001:
1672  03ec 5b0c          	addw	sp,#12
1673  03ee 81            	ret	
1722                     ; 413 uint8_t IsValidCfgBuf(uint8_t *pCfgBuf){
1723                     	switch	.text
1724  03ef               _IsValidCfgBuf:
1726  03ef 89            	pushw	x
1727  03f0 5203          	subw	sp,#3
1728       00000003      OFST:	set	3
1731                     ; 414 	uint8_t crc = 0;
1733  03f2 0f01          	clr	(OFST-2,sp)
1735                     ; 415 	int i = 0;
1737  03f4 5f            	clrw	x
1739  03f5 200b          	jra	L155
1740  03f7               L545:
1741                     ; 417 		crc += pCfgBuf[i];		
1743  03f7 72fb04        	addw	x,(OFST+1,sp)
1744  03fa 7b01          	ld	a,(OFST-2,sp)
1745  03fc fb            	add	a,(x)
1746  03fd 6b01          	ld	(OFST-2,sp),a
1748                     ; 416 	for(; i < CFG_BUF_SZ - 1; i++){
1750  03ff 1e02          	ldw	x,(OFST-1,sp)
1751  0401 5c            	incw	x
1752  0402               L155:
1753  0402 1f02          	ldw	(OFST-1,sp),x
1757  0404 a3000c        	cpw	x,#12
1758  0407 2fee          	jrslt	L545
1759                     ; 419 	if(crc == pCfgBuf[CFG_BUF_SZ-1])
1761  0409 1e04          	ldw	x,(OFST+1,sp)
1762  040b e60c          	ld	a,(12,x)
1763  040d 1101          	cp	a,(OFST-2,sp)
1764  040f 2604          	jrne	L555
1765                     ; 420 		return true;
1767  0411 a601          	ld	a,#1
1769  0413 2001          	jra	L401
1770  0415               L555:
1771                     ; 422 	return false;	
1773  0415 4f            	clr	a
1775  0416               L401:
1777  0416 5b05          	addw	sp,#5
1778  0418 81            	ret	
1801                     ; 432 void clkInit( void )
1801                     ; 433 {
1802                     	switch	.text
1803  0419               _clkInit:
1807                     ; 435   CLK->CKDIVR = 0;//(CLK_PRESCALER_HSIDIV1|CLK_PRESCALER_CPUDIV1);
1809  0419 725f50c6      	clr	20678
1810                     ; 443   CLK->PCKENR1 |= (CLK_PCKENR1_TIM4|CLK_PCKENR1_SPI|CLK_PCKENR1_UART1);
1812  041d c650c7        	ld	a,20679
1813  0420 aa16          	or	a,#22
1814  0422 c750c7        	ld	20679,a
1815                     ; 444   CLK->PCKENR2 |= (CLK_PCKENR2_ADC);
1817  0425 721650ca      	bset	20682,#3
1818                     ; 445 }
1821  0429 81            	ret	
1883                     	xdef	_clkInit
1884                     	xdef	_IsValidCfgBuf
1885                     	xdef	_GetCfg
1886                     	xdef	_ConvertFileName
1887                     	xdef	_GetNxtFileName
1888                     	xdef	_main
1889                     	switch	.ubsct
1890  0000               _loggerCfg:
1891  0000 000000000000  	ds.b	15
1892                     	xdef	_loggerCfg
1893  000f               L11_cfg:
1894  000f 000000000000  	ds.b	13
1895                     	xref	_LedInit
1896                     	xref	_sysTick
1897                     	xref	_ledNxtToggle
1898                     	xref	_ledFreqInTick
1899                     	xref	_dly
1900                     	xref	_sysTickInit
1901                     	xref	_adcInit
1902                     	xref	_buffer_rdy
1903                     	xref	_adcBuffer1
1904                     	xref	_adcBuffer0
1905                     	xref	_pf_write
1906                     	xref	_pf_read
1907                     	xref	_pf_open
1908                     	xref	_pf_mount
1909                     	switch	.const
1910  0004               L722:
1911  0004 43464700      	dc.b	"CFG",0
1912                     	xref.b	c_lreg
1913                     	xref.b	c_x
1914                     	xref.b	c_y
1934                     	xref	c_llsh
1935                     	xref	c_ladc
1936                     	xref	c_umul
1937                     	xref	c_bmulx
1938                     	xref	c_imul
1939                     	xref	c_lzmp
1940                     	xref	c_lgsbc
1941                     	xref	c_rtol
1942                     	xref	c_ladd
1943                     	xref	c_ltor
1944                     	end
