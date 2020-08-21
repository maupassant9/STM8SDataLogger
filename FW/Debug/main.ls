   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
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
 406  0000               L04:
 407  0000 0000c350      	dc.l	50000
 408                     ; 95 void main( void )
 408                     ; 96 {
 409                     	scross	off
 410                     	switch	.text
 411  0000               _main:
 413  0000 5232          	subw	sp,#50
 414       00000032      OFST:	set	50
 417                     ; 100 	FRESULT res = FR_OK;
 419  0002 0f30          	clr	(OFST-2,sp)
 421                     ; 105 	clkInit();
 423  0004 cd040b        	call	_clkInit
 425                     ; 106 	LedInit();
 427  0007 cd0000        	call	_LedInit
 429                     ; 107 	sysTickInit();
 431  000a cd0000        	call	_sysTickInit
 433                     ; 110 	enableInterrupts();
 436  000d 9a            	rim	
 438                     ; 117 	res |= pf_mount(&fid);	
 441  000e 96            	ldw	x,sp
 442  000f 1c0005        	addw	x,#OFST-45
 443  0012 cd0000        	call	_pf_mount
 445  0015 1a30          	or	a,(OFST-2,sp)
 446  0017 6b30          	ld	(OFST-2,sp),a
 448                     ; 118 	res |= pf_open("CFG");
 450  0019 ae0004        	ldw	x,#L722
 451  001c cd0000        	call	_pf_open
 453  001f 1a30          	or	a,(OFST-2,sp)
 454  0021 6b30          	ld	(OFST-2,sp),a
 456                     ; 119 	res |= pf_read(cfg, 13 , &pbr);
 458  0023 96            	ldw	x,sp
 459  0024 1c0003        	addw	x,#OFST-47
 460  0027 89            	pushw	x
 461  0028 ae000d        	ldw	x,#13
 462  002b 89            	pushw	x
 463  002c ae000f        	ldw	x,#L11_cfg
 464  002f cd0000        	call	_pf_read
 466  0032 5b04          	addw	sp,#4
 467  0034 1a30          	or	a,(OFST-2,sp)
 468  0036 6b30          	ld	(OFST-2,sp),a
 470                     ; 121 	res |= GetCfg(cfg, &loggerCfg);
 472  0038 a600          	ld	a,#_loggerCfg
 473  003a 97            	ld	xl,a
 474  003b a60f          	ld	a,#L11_cfg
 475  003d 95            	ld	xh,a
 476  003e cd02e2        	call	_GetCfg
 478  0041 1f01          	ldw	(OFST-49,sp),x
 480  0043 7b30          	ld	a,(OFST-2,sp)
 481  0045 1a02          	or	a,(OFST-48,sp)
 482  0047 6b30          	ld	(OFST-2,sp),a
 484                     ; 123 	if(FR_OK == res){
 486  0049 2644          	jrne	L132
 487                     ; 126 		for(i = 0; i < 10; i++) {
 489  004b 6b2f          	ld	(OFST-3,sp),a
 491  004d               L332:
 492                     ; 127 			LED_TOGGLE();
 494  004d 9018500f      	bcpl	20495,#4
 495                     ; 128 			dly(10000);
 497  0051 ae2710        	ldw	x,#10000
 498  0054 89            	pushw	x
 499  0055 5f            	clrw	x
 500  0056 89            	pushw	x
 501  0057 cd0000        	call	_dly
 503  005a 5b04          	addw	sp,#4
 504                     ; 126 		for(i = 0; i < 10; i++) {
 506  005c 0c2f          	inc	(OFST-3,sp)
 510  005e 7b2f          	ld	a,(OFST-3,sp)
 511  0060 a10a          	cp	a,#10
 512  0062 25e9          	jrult	L332
 513                     ; 132 		fileBlkCnt = loggerCfg.fileSzInBlock;
 515  0064 be09          	ldw	x,_loggerCfg+9
 516  0066 bf03          	ldw	L5_fileBlkCnt+2,x
 517  0068 be07          	ldw	x,_loggerCfg+7
 518  006a bf01          	ldw	L5_fileBlkCnt,x
 519                     ; 133 		fileNoCnt = loggerCfg.fileNo;
 521  006c be0b          	ldw	x,_loggerCfg+11
 522  006e bf05          	ldw	L7_fileNoCnt,x
 523                     ; 136 		res |= pf_open(loggerCfg.firstFileName);
 525  0070 ae0002        	ldw	x,#_loggerCfg+2
 526  0073 cd0000        	call	_pf_open
 528  0076 1a30          	or	a,(OFST-2,sp)
 529  0078 6b30          	ld	(OFST-2,sp),a
 531                     ; 138 		if(FR_OK == res){
 533  007a 2604          	jrne	L142
 534                     ; 141 			fsm.state = S0_RST;
 536  007c 6b31          	ld	(OFST-1,sp),a
 538                     ; 142 			fsm.error = NO_ERR;
 540  007e 2006          	jra	L342
 541  0080               L142:
 542                     ; 145 			fsm.state = S4_ERR;
 544  0080 a604          	ld	a,#4
 545  0082 6b31          	ld	(OFST-1,sp),a
 547                     ; 146 			fsm.error = ERR_CARD_INIT;
 549  0084 a601          	ld	a,#1
 550  0086               L342:
 552  0086 6b32          	ld	(OFST+0,sp),a
 554                     ; 149 		disableInterrupts();
 557  0088 9b            	sim	
 559                     ; 150 		adcInit();
 562  0089 cd0000        	call	_adcInit
 564                     ; 152 		enableInterrupts();
 567  008c 9a            	rim	
 571  008d 2008          	jra	L542
 572  008f               L132:
 573                     ; 155 		fsm.state = S4_ERR;
 575  008f a604          	ld	a,#4
 576  0091 6b31          	ld	(OFST-1,sp),a
 578                     ; 156 		fsm.error = ERR_CARD_INIT;
 580  0093 a601          	ld	a,#1
 581  0095 6b32          	ld	(OFST+0,sp),a
 583  0097               L542:
 584                     ; 159 	LED_SET_TOGGLE_FREQ(0);	
 586  0097 5f            	clrw	x
 587  0098 cf0002        	ldw	_ledFreqInTick+2,x
 588  009b cf0000        	ldw	_ledFreqInTick,x
 589  009e ce0002        	ldw	x,_sysTick+2
 590  00a1 cf0002        	ldw	_ledNxtToggle+2,x
 591  00a4 ce0000        	ldw	x,_sysTick
 592  00a7 cf0000        	ldw	_ledNxtToggle,x
 593  00aa               L742:
 594                     ; 166 		switch (fsm.state){
 596  00aa 7b31          	ld	a,(OFST-1,sp)
 598                     ; 217 			default: break;
 599  00ac 2711          	jreq	L51
 600  00ae 4a            	dec	a
 601  00af 2732          	jreq	L71
 602  00b1 4a            	dec	a
 603  00b2 272f          	jreq	L71
 604  00b4 4a            	dec	a
 605  00b5 2734          	jreq	L12
 606  00b7 4a            	dec	a
 607  00b8 2759          	jreq	L32
 608  00ba 4a            	dec	a
 609  00bb 2772          	jreq	L52
 610  00bd 20eb          	jra	L742
 611  00bf               L51:
 612                     ; 167 			case S0_RST:
 612                     ; 168 				//Reset state, do nothing just 
 612                     ; 169 				//wait for event to happen 
 612                     ; 170 				if( 0x3 == buffer_rdy ){
 614  00bf c60000        	ld	a,_buffer_rdy
 615  00c2 a103          	cp	a,#3
 616  00c4 2609          	jrne	L752
 617                     ; 173 					fsm.state = S4_ERR;
 619  00c6 a604          	ld	a,#4
 620  00c8 6b31          	ld	(OFST-1,sp),a
 622                     ; 174 					fsm.error = ERR_BUFF_OVERLAP;
 624  00ca 4c            	inc	a
 625  00cb 6b32          	ld	(OFST+0,sp),a
 628  00cd 20db          	jra	L742
 629  00cf               L752:
 630                     ; 175 				} else if (0x01 == buffer_rdy) {
 632  00cf c60000        	ld	a,_buffer_rdy
 633  00d2 4a            	dec	a
 634  00d3 2603          	jrne	L362
 635                     ; 177 					fsm.state = S1_WR_BUF0;
 637  00d5 4c            	inc	a
 639  00d6 2037          	jp	LC001
 640  00d8               L362:
 641                     ; 178 				} else if ( 0x02 == buffer_rdy) {
 643  00d8 c60000        	ld	a,_buffer_rdy
 644  00db a102          	cp	a,#2
 645  00dd 26cb          	jrne	L742
 646                     ; 180 					fsm.state = S2_WR_BUF1;
 648  00df a602          	ld	a,#2
 649  00e1 202c          	jp	LC001
 650  00e3               L71:
 651                     ; 183 			case S1_WR_BUF0:
 651                     ; 184 			case S2_WR_BUF1:
 651                     ; 185 				//Write ADC buffer 1 state
 651                     ; 186 				Wr2SD(&fsm);
 653  00e3 96            	ldw	x,sp
 654  00e4 1c0031        	addw	x,#OFST-1
 655  00e7 ad4c          	call	L31_Wr2SD
 657                     ; 187 				break;
 659  00e9 20bf          	jra	L742
 660  00eb               L12:
 661                     ; 188 			case S3_NXT_FILE:
 661                     ; 189 				fileBlkCnt = loggerCfg.fileSzInBlock;
 663  00eb be09          	ldw	x,_loggerCfg+9
 664  00ed bf03          	ldw	L5_fileBlkCnt+2,x
 665  00ef be07          	ldw	x,_loggerCfg+7
 666  00f1 bf01          	ldw	L5_fileBlkCnt,x
 667                     ; 191 				if(--fileNoCnt != 0){
 669  00f3 be05          	ldw	x,L7_fileNoCnt
 670  00f5 5a            	decw	x
 671  00f6 bf05          	ldw	L7_fileNoCnt,x
 672  00f8 2713          	jreq	L172
 673                     ; 193 					GetNxtFileName(loggerCfg.firstFileName);
 675  00fa a602          	ld	a,#_loggerCfg+2
 676  00fc cd01c4        	call	_GetNxtFileName
 678                     ; 195 					res = pf_open(loggerCfg.firstFileName);
 680  00ff ae0002        	ldw	x,#_loggerCfg+2
 681  0102 cd0000        	call	_pf_open
 683  0105 6b30          	ld	(OFST-2,sp),a
 685                     ; 196 					if( FR_OK != res ){
 687  0107 2706          	jreq	LC001
 688                     ; 197 						fsm.state = S4_ERR;
 690  0109 a604          	ld	a,#4
 692  010b 2002          	jp	LC001
 693                     ; 200 						fsm.state = S0_RST;
 694  010d               L172:
 695                     ; 206 					fsm.state = S5_COMPLETE;
 697  010d a605          	ld	a,#5
 698  010f               LC001:
 700  010f 6b31          	ld	(OFST-1,sp),a
 702  0111 2097          	jra	L742
 703  0113               L32:
 704                     ; 211 			case S4_ERR:
 704                     ; 212 				LED_SET_TOGGLE_FREQ(50000);
 706  0113 aec350        	ldw	x,#50000
 707  0116 cf0002        	ldw	_ledFreqInTick+2,x
 708  0119 5f            	clrw	x
 709  011a cf0000        	ldw	_ledFreqInTick,x
 710  011d ae0000        	ldw	x,#_sysTick
 711  0120 cd0000        	call	c_ltor
 713  0123 ae0000        	ldw	x,#L04
 714  0126 cd0000        	call	c_ladd
 716  0129 ae0000        	ldw	x,#_ledNxtToggle
 717  012c cd0000        	call	c_rtol
 719  012f               L52:
 720                     ; 213 			case S5_COMPLETE:
 720                     ; 214 				LED_SET();
 722  012f 7218500f      	bset	20495,#4
 723  0133               L103:
 724                     ; 215 				while(1);
 726  0133 20fe          	jra	L103
 727                     ; 217 			default: break;
 807                     ; 233 static void Wr2SD( fsm_t * pfsm ){
 808                     	switch	.text
 809  0135               L31_Wr2SD:
 811  0135 89            	pushw	x
 812  0136 5205          	subw	sp,#5
 813       00000005      OFST:	set	5
 816                     ; 240 	if( S1_WR_BUF0 == pfsm->state){
 818  0138 f6            	ld	a,(x)
 819  0139 4a            	dec	a
 820  013a 2607          	jrne	L143
 821                     ; 241 		pBuf = adcBuffer0; bufNo = 0;
 823  013c ae0000        	ldw	x,#_adcBuffer0
 824  013f 1f03          	ldw	(OFST-2,sp),x
 828  0141 2007          	jra	L343
 829  0143               L143:
 830                     ; 243 		pBuf = adcBuffer1; bufNo = 1;
 832  0143 ae0000        	ldw	x,#_adcBuffer1
 833  0146 1f03          	ldw	(OFST-2,sp),x
 837  0148 a601          	ld	a,#1
 838  014a               L343:
 840  014a 6b05          	ld	(OFST+0,sp),a
 842                     ; 245 	RELEASE_BUFF_FOR_WR(bufNo); //clear this flag
 844  014c 5f            	clrw	x
 845  014d 97            	ld	xl,a
 846  014e a601          	ld	a,#1
 847  0150 5d            	tnzw	x
 848  0151 2704          	jreq	L44
 849  0153               L64:
 850  0153 48            	sll	a
 851  0154 5a            	decw	x
 852  0155 26fc          	jrne	L64
 853  0157               L44:
 854  0157 43            	cpl	a
 855  0158 c40000        	and	a,_buffer_rdy
 856  015b c70000        	ld	_buffer_rdy,a
 857                     ; 247 	LED_SET();
 859  015e 7218500f      	bset	20495,#4
 860                     ; 248 	res = pf_write((void*)pBuf,BUFFER_SZ_IN_BYTES, &pbr);
 862  0162 96            	ldw	x,sp
 863  0163 5c            	incw	x
 864  0164 89            	pushw	x
 865  0165 ae0100        	ldw	x,#256
 866  0168 89            	pushw	x
 867  0169 1e07          	ldw	x,(OFST+2,sp)
 868  016b cd0000        	call	_pf_write
 870  016e 5b04          	addw	sp,#4
 871  0170 6b05          	ld	(OFST+0,sp),a
 873                     ; 249 	LED_CLR();
 875  0172 7219500f      	bres	20495,#4
 876                     ; 251 	if(FR_OK != res){
 878  0176 2709          	jreq	L543
 879                     ; 254 		pfsm->error = ERR_WR_DATA;
 881  0178 1e06          	ldw	x,(OFST+1,sp)
 882  017a a602          	ld	a,#2
 883  017c e701          	ld	(1,x),a
 884                     ; 255 		pfsm->state = S4_ERR;
 886  017e 48            	sll	a
 887                     ; 256 		return;
 889  017f 2027          	jp	LC002
 890  0181               L543:
 891                     ; 259 	if(NO_BUFF_PER_BLK == ++blkCnt){
 893  0181 3c00          	inc	L3_blkCnt
 894  0183 b600          	ld	a,L3_blkCnt
 895  0185 a102          	cp	a,#2
 896  0187 2636          	jrne	L743
 897                     ; 261 		blkCnt = 0;
 899  0189 3f00          	clr	L3_blkCnt
 900                     ; 262 		LED_SET();
 902  018b 7218500f      	bset	20495,#4
 903                     ; 263 		res = pf_write(0,0,&pbr);
 905  018f 96            	ldw	x,sp
 906  0190 5c            	incw	x
 907  0191 89            	pushw	x
 908  0192 5f            	clrw	x
 909  0193 89            	pushw	x
 910  0194 cd0000        	call	_pf_write
 912  0197 5b04          	addw	sp,#4
 913  0199 6b05          	ld	(OFST+0,sp),a
 915                     ; 264 		LED_CLR();
 917  019b 7219500f      	bres	20495,#4
 918                     ; 267 		if(FR_OK != res){
 920  019f 270b          	jreq	L153
 921                     ; 269 			pfsm->error = ERR_WR_NO_RESP;
 923  01a1 1e06          	ldw	x,(OFST+1,sp)
 924  01a3 a603          	ld	a,#3
 925  01a5 e701          	ld	(1,x),a
 926                     ; 270 			pfsm->state = S4_ERR;
 928  01a7 4c            	inc	a
 929  01a8               LC002:
 930  01a8 f7            	ld	(x),a
 931                     ; 271 			return;
 932  01a9               L45:
 935  01a9 5b07          	addw	sp,#7
 936  01ab 81            	ret	
 937  01ac               L153:
 938                     ; 274 		if(0 == --fileBlkCnt){
 940  01ac ae0001        	ldw	x,#L5_fileBlkCnt
 941  01af a601          	ld	a,#1
 942  01b1 cd0000        	call	c_lgsbc
 944  01b4 cd0000        	call	c_lzmp
 946  01b7 2606          	jrne	L743
 947                     ; 277 			pfsm->state = S3_NXT_FILE;
 949  01b9 1e06          	ldw	x,(OFST+1,sp)
 950  01bb a603          	ld	a,#3
 951                     ; 279 			return;
 953  01bd 20e9          	jp	LC002
 954  01bf               L743:
 955                     ; 284 	pfsm->state = S0_RST; 
 957  01bf 1e06          	ldw	x,(OFST+1,sp)
 958  01c1 7f            	clr	(x)
 959                     ; 286 }
 961  01c2 20e5          	jra	L45
1003                     ; 299 void GetNxtFileName(@tiny char * fname){
1004                     	switch	.text
1005  01c4               _GetNxtFileName:
1007  01c4 88            	push	a
1008  01c5 88            	push	a
1009       00000001      OFST:	set	1
1012                     ; 301 	uint8_t val = 0;
1014  01c6 0f01          	clr	(OFST+0,sp)
1016                     ; 303 	if(0x39 == fname[3]){
1018  01c8 5f            	clrw	x
1019  01c9 97            	ld	xl,a
1020  01ca e603          	ld	a,(3,x)
1021  01cc a139          	cp	a,#57
1022  01ce 2604          	jrne	L704
1023                     ; 304 		val = 0x01;
1025  01d0 a601          	ld	a,#1
1026  01d2 6b01          	ld	(OFST+0,sp),a
1028  01d4               L704:
1029                     ; 306 	if(0x39 == fname[2]) {
1031  01d4 7b02          	ld	a,(OFST+1,sp)
1032  01d6 5f            	clrw	x
1033  01d7 97            	ld	xl,a
1034  01d8 e602          	ld	a,(2,x)
1035  01da a139          	cp	a,#57
1036  01dc 2604          	jrne	L114
1037                     ; 307 		val += 0x02;
1039  01de 0c01          	inc	(OFST+0,sp)
1040  01e0 0c01          	inc	(OFST+0,sp)
1042  01e2               L114:
1043                     ; 309 	if(0x39 == fname[1]) {
1045  01e2 7b02          	ld	a,(OFST+1,sp)
1046  01e4 5f            	clrw	x
1047  01e5 97            	ld	xl,a
1048  01e6 e601          	ld	a,(1,x)
1049  01e8 a139          	cp	a,#57
1050  01ea 2606          	jrne	L314
1051                     ; 310 		val += 0x04;
1053  01ec 7b01          	ld	a,(OFST+0,sp)
1054  01ee ab04          	add	a,#4
1055  01f0 6b01          	ld	(OFST+0,sp),a
1057  01f2               L314:
1058                     ; 312 	if(0x39 == fname[0]) {
1060  01f2 7b02          	ld	a,(OFST+1,sp)
1061  01f4 5f            	clrw	x
1062  01f5 97            	ld	xl,a
1063  01f6 f6            	ld	a,(x)
1064  01f7 a139          	cp	a,#57
1065  01f9 2606          	jrne	L514
1066                     ; 313 		val += 0x08;
1068  01fb 7b01          	ld	a,(OFST+0,sp)
1069  01fd ab08          	add	a,#8
1070  01ff 6b01          	ld	(OFST+0,sp),a
1072  0201               L514:
1073                     ; 316 	switch(val){
1075  0201 7b01          	ld	a,(OFST+0,sp)
1077                     ; 330 		default: fname[3]++; break;
1078  0203 4a            	dec	a
1079  0204 2714          	jreq	L553
1080  0206 a002          	sub	a,#2
1081  0208 2720          	jreq	L753
1082  020a a004          	sub	a,#4
1083  020c 2734          	jreq	L163
1084  020e a008          	sub	a,#8
1085  0210 274f          	jreq	L363
1088  0212 7b02          	ld	a,(OFST+1,sp)
1089  0214 5f            	clrw	x
1090  0215 97            	ld	xl,a
1091  0216 6c03          	inc	(3,x)
1094  0218 2066          	jra	L124
1095  021a               L553:
1096                     ; 317 		case 0x01: fname[3] = 0x30; 
1098  021a 7b02          	ld	a,(OFST+1,sp)
1099  021c 5f            	clrw	x
1100  021d 97            	ld	xl,a
1101  021e a630          	ld	a,#48
1102  0220 e703          	ld	(3,x),a
1103                     ; 318 							 fname[2]++;break;
1105  0222 5f            	clrw	x
1106  0223 7b02          	ld	a,(OFST+1,sp)
1107  0225 97            	ld	xl,a
1108  0226 6c02          	inc	(2,x)
1111  0228 2056          	jra	L124
1112  022a               L753:
1113                     ; 319 		case 0x03: fname[3] = 0x30; 
1115  022a 7b02          	ld	a,(OFST+1,sp)
1116  022c 5f            	clrw	x
1117  022d 97            	ld	xl,a
1118  022e a630          	ld	a,#48
1119  0230 e703          	ld	(3,x),a
1120                     ; 320 							 fname[2] = 0x30; 
1122  0232 5f            	clrw	x
1123  0233 7b02          	ld	a,(OFST+1,sp)
1124  0235 97            	ld	xl,a
1125  0236 a630          	ld	a,#48
1126  0238 e702          	ld	(2,x),a
1127                     ; 321 							 fname[1]++; break;
1129  023a 5f            	clrw	x
1130  023b 7b02          	ld	a,(OFST+1,sp)
1131  023d 97            	ld	xl,a
1132  023e 6c01          	inc	(1,x)
1135  0240 203e          	jra	L124
1136  0242               L163:
1137                     ; 322 		case 0x07: fname[3] = 0x30; 
1139  0242 7b02          	ld	a,(OFST+1,sp)
1140  0244 5f            	clrw	x
1141  0245 97            	ld	xl,a
1142  0246 a630          	ld	a,#48
1143  0248 e703          	ld	(3,x),a
1144                     ; 323 							 fname[2] = 0x30; 
1146  024a 5f            	clrw	x
1147  024b 7b02          	ld	a,(OFST+1,sp)
1148  024d 97            	ld	xl,a
1149  024e a630          	ld	a,#48
1150  0250 e702          	ld	(2,x),a
1151                     ; 324 							 fname[1] = 0x30; 
1153  0252 5f            	clrw	x
1154  0253 7b02          	ld	a,(OFST+1,sp)
1155  0255 97            	ld	xl,a
1156  0256 a630          	ld	a,#48
1157  0258 e701          	ld	(1,x),a
1158                     ; 325 							 fname[0]++; break;
1160  025a 5f            	clrw	x
1161  025b 7b02          	ld	a,(OFST+1,sp)
1162  025d 97            	ld	xl,a
1163  025e 7c            	inc	(x)
1166  025f 201f          	jra	L124
1167  0261               L363:
1168                     ; 326 		case 0x0f: fname[3] = 0x30; 
1170  0261 7b02          	ld	a,(OFST+1,sp)
1171  0263 5f            	clrw	x
1172  0264 97            	ld	xl,a
1173  0265 a630          	ld	a,#48
1174  0267 e703          	ld	(3,x),a
1175                     ; 327 							 fname[2] = 0x30; 
1177  0269 5f            	clrw	x
1178  026a 7b02          	ld	a,(OFST+1,sp)
1179  026c 97            	ld	xl,a
1180  026d a630          	ld	a,#48
1181  026f e702          	ld	(2,x),a
1182                     ; 328 							 fname[1] = 0x30; 
1184  0271 5f            	clrw	x
1185  0272 7b02          	ld	a,(OFST+1,sp)
1186  0274 97            	ld	xl,a
1187  0275 a630          	ld	a,#48
1188  0277 e701          	ld	(1,x),a
1189                     ; 329 							 fname[0] = 0x30; break;
1191  0279 5f            	clrw	x
1192  027a 7b02          	ld	a,(OFST+1,sp)
1193  027c 97            	ld	xl,a
1194  027d a630          	ld	a,#48
1195  027f f7            	ld	(x),a
1198  0280               L124:
1199                     ; 332 }
1202  0280 85            	popw	x
1203  0281 81            	ret	
1252                     ; 345 void ConvertFileName(uint16_t firstFileName, char * fname){
1253                     	switch	.text
1254  0282               _ConvertFileName:
1256  0282 89            	pushw	x
1257  0283 89            	pushw	x
1258       00000002      OFST:	set	2
1261                     ; 346 	uint16_t val = 0;
1263                     ; 348 	val = firstFileName/1000;
1265  0284 90ae03e8      	ldw	y,#1000
1266  0288 65            	divw	x,y
1267  0289 1f01          	ldw	(OFST-1,sp),x
1269                     ; 349 	fname[0] = val + 0x30;
1271  028b 7b02          	ld	a,(OFST+0,sp)
1272  028d 1e07          	ldw	x,(OFST+5,sp)
1273  028f ab30          	add	a,#48
1274  0291 f7            	ld	(x),a
1275                     ; 350 	firstFileName -=  val*1000;
1277  0292 90ae03e8      	ldw	y,#1000
1278  0296 1e01          	ldw	x,(OFST-1,sp)
1279  0298 cd0000        	call	c_imul
1281  029b 72f003        	subw	x,(OFST+1,sp)
1282  029e 50            	negw	x
1283  029f 1f03          	ldw	(OFST+1,sp),x
1284                     ; 351 	val = firstFileName/100;
1286  02a1 a664          	ld	a,#100
1287  02a3 62            	div	x,a
1288  02a4 1f01          	ldw	(OFST-1,sp),x
1290                     ; 352 	fname[1] = val + 0x30;
1292  02a6 7b02          	ld	a,(OFST+0,sp)
1293  02a8 1e07          	ldw	x,(OFST+5,sp)
1294  02aa ab30          	add	a,#48
1295  02ac e701          	ld	(1,x),a
1296                     ; 353 	firstFileName -=  val*100;
1298  02ae a664          	ld	a,#100
1299  02b0 1e01          	ldw	x,(OFST-1,sp)
1300  02b2 cd0000        	call	c_bmulx
1302  02b5 72f003        	subw	x,(OFST+1,sp)
1303  02b8 50            	negw	x
1304  02b9 1f03          	ldw	(OFST+1,sp),x
1305                     ; 354 	val = firstFileName/10;
1307  02bb a60a          	ld	a,#10
1308  02bd 62            	div	x,a
1309  02be 1f01          	ldw	(OFST-1,sp),x
1311                     ; 355 	fname[2] = val + 0x30;
1313  02c0 7b02          	ld	a,(OFST+0,sp)
1314  02c2 1e07          	ldw	x,(OFST+5,sp)
1315  02c4 ab30          	add	a,#48
1316  02c6 e702          	ld	(2,x),a
1317                     ; 356 	firstFileName -=  val*10;
1319  02c8 a60a          	ld	a,#10
1320  02ca 1e01          	ldw	x,(OFST-1,sp)
1321  02cc cd0000        	call	c_bmulx
1323  02cf 72f003        	subw	x,(OFST+1,sp)
1324  02d2 50            	negw	x
1325  02d3 1f03          	ldw	(OFST+1,sp),x
1326                     ; 357 	fname[3] = firstFileName + 0x30;
1328  02d5 7b04          	ld	a,(OFST+2,sp)
1329  02d7 1e07          	ldw	x,(OFST+5,sp)
1330  02d9 ab30          	add	a,#48
1331  02db e703          	ld	(3,x),a
1332                     ; 358 	fname[4] = '\0';
1334  02dd 6f04          	clr	(4,x)
1335                     ; 359 }
1338  02df 5b04          	addw	sp,#4
1339  02e1 81            	ret	
1342                     	xref	_IsValidCfgBuf
1448                     ; 374 UINT GetCfg(@tiny uint8_t * pCfgBuf, @tiny cfg_t * pcfg){
1449                     	switch	.text
1450  02e2               _GetCfg:
1452  02e2 89            	pushw	x
1453  02e3 520a          	subw	sp,#10
1454       0000000a      OFST:	set	10
1457                     ; 377 	if(!IsValidCfgBuf(pCfgBuf)) return 1; 
1459  02e5 9e            	ld	a,xh
1460  02e6 cd03e1        	call	_IsValidCfgBuf
1462  02e9 5d            	tnzw	x
1463  02ea 2604          	jrne	L515
1466  02ec 5c            	incw	x
1468  02ed cc03de        	jra	L67
1469  02f0               L515:
1470                     ; 380 	pcfg->sampFreq = pCfgBuf[0]+(((uint16_t)pCfgBuf[1])<<8);
1472  02f0 7b0b          	ld	a,(OFST+1,sp)
1473  02f2 5f            	clrw	x
1474  02f3 97            	ld	xl,a
1475  02f4 f6            	ld	a,(x)
1476  02f5 6b08          	ld	(OFST-2,sp),a
1478  02f7 5f            	clrw	x
1479  02f8 7b0b          	ld	a,(OFST+1,sp)
1480  02fa 97            	ld	xl,a
1481  02fb e601          	ld	a,(1,x)
1482  02fd 5f            	clrw	x
1483  02fe 97            	ld	xl,a
1484  02ff 4f            	clr	a
1485  0300 1b08          	add	a,(OFST-2,sp)
1486  0302 2401          	jrnc	L66
1487  0304 5c            	incw	x
1488  0305               L66:
1489  0305 02            	rlwa	x,a
1490  0306 1f06          	ldw	(OFST-4,sp),x
1492  0308 5f            	clrw	x
1493  0309 7b0c          	ld	a,(OFST+2,sp)
1494  030b 97            	ld	xl,a
1495  030c 1606          	ldw	y,(OFST-4,sp)
1496  030e ff            	ldw	(x),y
1497                     ; 382 	fID = pCfgBuf[2]+(((uint16_t)pCfgBuf[3])<<8);
1499  030f 5f            	clrw	x
1500  0310 7b0b          	ld	a,(OFST+1,sp)
1501  0312 97            	ld	xl,a
1502  0313 e602          	ld	a,(2,x)
1503  0315 6b08          	ld	(OFST-2,sp),a
1505  0317 5f            	clrw	x
1506  0318 7b0b          	ld	a,(OFST+1,sp)
1507  031a 97            	ld	xl,a
1508  031b e603          	ld	a,(3,x)
1509  031d 5f            	clrw	x
1510  031e 97            	ld	xl,a
1511  031f 4f            	clr	a
1512  0320 1b08          	add	a,(OFST-2,sp)
1513  0322 2401          	jrnc	L07
1514  0324 5c            	incw	x
1515  0325               L07:
1516  0325 02            	rlwa	x,a
1517  0326 1f09          	ldw	(OFST-1,sp),x
1519                     ; 384 	ConvertFileName(fID, pcfg->firstFileName);
1521  0328 7b0c          	ld	a,(OFST+2,sp)
1522  032a ab02          	add	a,#2
1523  032c 5f            	clrw	x
1524  032d 97            	ld	xl,a
1525  032e 89            	pushw	x
1526  032f 1e0b          	ldw	x,(OFST+1,sp)
1527  0331 cd0282        	call	_ConvertFileName
1529  0334 85            	popw	x
1530                     ; 385 	pcfg->fileNo = pCfgBuf[4]+(((uint16_t)pCfgBuf[5])<<8);
1532  0335 7b0b          	ld	a,(OFST+1,sp)
1533  0337 5f            	clrw	x
1534  0338 97            	ld	xl,a
1535  0339 e604          	ld	a,(4,x)
1536  033b 6b08          	ld	(OFST-2,sp),a
1538  033d 5f            	clrw	x
1539  033e 7b0b          	ld	a,(OFST+1,sp)
1540  0340 97            	ld	xl,a
1541  0341 e605          	ld	a,(5,x)
1542  0343 5f            	clrw	x
1543  0344 97            	ld	xl,a
1544  0345 4f            	clr	a
1545  0346 1b08          	add	a,(OFST-2,sp)
1546  0348 2401          	jrnc	L47
1547  034a 5c            	incw	x
1548  034b               L47:
1549  034b 02            	rlwa	x,a
1550  034c 1f06          	ldw	(OFST-4,sp),x
1552  034e 5f            	clrw	x
1553  034f 7b0c          	ld	a,(OFST+2,sp)
1554  0351 97            	ld	xl,a
1555  0352 1606          	ldw	y,(OFST-4,sp)
1556  0354 ef0b          	ldw	(11,x),y
1557                     ; 386 	pcfg->fileSzInBlock = pCfgBuf[6]+ \
1557                     ; 387 												(((uint32_t)pCfgBuf[7])<<8) + \
1557                     ; 388 												(((uint32_t)pCfgBuf[8])<<16) + \
1557                     ; 389 												(((uint32_t)pCfgBuf[9])<<24);
1559  0356 5f            	clrw	x
1560  0357 7b0b          	ld	a,(OFST+1,sp)
1561  0359 97            	ld	xl,a
1562  035a e609          	ld	a,(9,x)
1563  035c b703          	ld	c_lreg+3,a
1564  035e 3f02          	clr	c_lreg+2
1565  0360 3f01          	clr	c_lreg+1
1566  0362 3f00          	clr	c_lreg
1567  0364 a618          	ld	a,#24
1568  0366 cd0000        	call	c_llsh
1570  0369 96            	ldw	x,sp
1571  036a 1c0005        	addw	x,#OFST-5
1572  036d cd0000        	call	c_rtol
1575  0370 7b0b          	ld	a,(OFST+1,sp)
1576  0372 5f            	clrw	x
1577  0373 97            	ld	xl,a
1578  0374 e608          	ld	a,(8,x)
1579  0376 b703          	ld	c_lreg+3,a
1580  0378 3f02          	clr	c_lreg+2
1581  037a 3f01          	clr	c_lreg+1
1582  037c 3f00          	clr	c_lreg
1583  037e a610          	ld	a,#16
1584  0380 cd0000        	call	c_llsh
1586  0383 96            	ldw	x,sp
1587  0384 5c            	incw	x
1588  0385 cd0000        	call	c_rtol
1591  0388 7b0b          	ld	a,(OFST+1,sp)
1592  038a 5f            	clrw	x
1593  038b 97            	ld	xl,a
1594  038c e607          	ld	a,(7,x)
1595  038e 5f            	clrw	x
1596  038f 97            	ld	xl,a
1597  0390 90ae0100      	ldw	y,#256
1598  0394 cd0000        	call	c_umul
1600  0397 7b0b          	ld	a,(OFST+1,sp)
1601  0399 5f            	clrw	x
1602  039a 97            	ld	xl,a
1603  039b e606          	ld	a,(6,x)
1604  039d cd0000        	call	c_ladc
1606  03a0 96            	ldw	x,sp
1607  03a1 5c            	incw	x
1608  03a2 cd0000        	call	c_ladd
1610  03a5 96            	ldw	x,sp
1611  03a6 1c0005        	addw	x,#OFST-5
1612  03a9 cd0000        	call	c_ladd
1614  03ac 7b0c          	ld	a,(OFST+2,sp)
1615  03ae 5f            	clrw	x
1616  03af 97            	ld	xl,a
1617  03b0 1c0007        	addw	x,#7
1618  03b3 cd0000        	call	c_rtol
1620                     ; 390 	pcfg->channel = pCfgBuf[10];
1622  03b6 7b0c          	ld	a,(OFST+2,sp)
1623  03b8 5f            	clrw	x
1624  03b9 97            	ld	xl,a
1625  03ba 7b0b          	ld	a,(OFST+1,sp)
1626  03bc 905f          	clrw	y
1627  03be 9097          	ld	yl,a
1628  03c0 90e60a        	ld	a,(10,y)
1629  03c3 e70d          	ld	(13,x),a
1630                     ; 391 	if(pCfgBuf[11] == 0)
1632  03c5 5f            	clrw	x
1633  03c6 7b0b          	ld	a,(OFST+1,sp)
1634  03c8 97            	ld	xl,a
1635  03c9 e60b          	ld	a,(11,x)
1636  03cb 2608          	jrne	L715
1637                     ; 393 		pcfg->isFullResultion = false;
1639  03cd 7b0c          	ld	a,(OFST+2,sp)
1640  03cf 5f            	clrw	x
1641  03d0 97            	ld	xl,a
1642  03d1 6f0e          	clr	(14,x)
1644  03d3 2008          	jra	L125
1645  03d5               L715:
1646                     ; 395 		pcfg->isFullResultion = true;
1648  03d5 7b0c          	ld	a,(OFST+2,sp)
1649  03d7 5f            	clrw	x
1650  03d8 97            	ld	xl,a
1651  03d9 a601          	ld	a,#1
1652  03db e70e          	ld	(14,x),a
1653  03dd               L125:
1654                     ; 398 	return 0x0;
1656  03dd 5f            	clrw	x
1658  03de               L67:
1660  03de 5b0c          	addw	sp,#12
1661  03e0 81            	ret	
1710                     ; 413 uint8_t IsValidCfgBuf(uint8_t *pCfgBuf){
1711                     	switch	.text
1712  03e1               _IsValidCfgBuf:
1714  03e1 89            	pushw	x
1715  03e2 5203          	subw	sp,#3
1716       00000003      OFST:	set	3
1719                     ; 414 	uint8_t crc = 0;
1721  03e4 0f01          	clr	(OFST-2,sp)
1723                     ; 415 	int i = 0;
1725  03e6 5f            	clrw	x
1727  03e7 200b          	jra	L155
1728  03e9               L545:
1729                     ; 417 		crc += pCfgBuf[i];		
1731  03e9 72fb04        	addw	x,(OFST+1,sp)
1732  03ec 7b01          	ld	a,(OFST-2,sp)
1733  03ee fb            	add	a,(x)
1734  03ef 6b01          	ld	(OFST-2,sp),a
1736                     ; 416 	for(; i < CFG_BUF_SZ - 1; i++){
1738  03f1 1e02          	ldw	x,(OFST-1,sp)
1739  03f3 5c            	incw	x
1740  03f4               L155:
1741  03f4 1f02          	ldw	(OFST-1,sp),x
1745  03f6 a3000c        	cpw	x,#12
1746  03f9 2fee          	jrslt	L545
1747                     ; 419 	if(crc == pCfgBuf[CFG_BUF_SZ-1])
1749  03fb 1e04          	ldw	x,(OFST+1,sp)
1750  03fd e60c          	ld	a,(12,x)
1751  03ff 1101          	cp	a,(OFST-2,sp)
1752  0401 2604          	jrne	L555
1753                     ; 420 		return true;
1755  0403 a601          	ld	a,#1
1757  0405 2001          	jra	L201
1758  0407               L555:
1759                     ; 422 	return false;	
1761  0407 4f            	clr	a
1763  0408               L201:
1765  0408 5b05          	addw	sp,#5
1766  040a 81            	ret	
1789                     ; 432 void clkInit( void )
1789                     ; 433 {
1790                     	switch	.text
1791  040b               _clkInit:
1795                     ; 435   CLK->CKDIVR = 0;//(CLK_PRESCALER_HSIDIV1|CLK_PRESCALER_CPUDIV1);
1797  040b 725f50c6      	clr	20678
1798                     ; 443   CLK->PCKENR1 |= (CLK_PCKENR1_TIM4|CLK_PCKENR1_SPI|CLK_PCKENR1_UART1);
1800  040f c650c7        	ld	a,20679
1801  0412 aa16          	or	a,#22
1802  0414 c750c7        	ld	20679,a
1803                     ; 444   CLK->PCKENR2 |= (CLK_PCKENR2_ADC);
1805  0417 721650ca      	bset	20682,#3
1806                     ; 445 }
1809  041b 81            	ret	
1844                     ; 460 void assert_failed(uint8_t* file, uint32_t line)
1844                     ; 461 { 
1845                     	switch	.text
1846  041c               _assert_failed:
1850  041c               L506:
1851  041c 20fe          	jra	L506
1913                     	xdef	_clkInit
1914                     	xdef	_IsValidCfgBuf
1915                     	xdef	_GetCfg
1916                     	xdef	_ConvertFileName
1917                     	xdef	_GetNxtFileName
1918                     	xdef	_main
1919                     	switch	.ubsct
1920  0000               _loggerCfg:
1921  0000 000000000000  	ds.b	15
1922                     	xdef	_loggerCfg
1923  000f               L11_cfg:
1924  000f 000000000000  	ds.b	13
1925                     	xref	_LedInit
1926                     	xref	_sysTick
1927                     	xref	_ledNxtToggle
1928                     	xref	_ledFreqInTick
1929                     	xref	_dly
1930                     	xref	_sysTickInit
1931                     	xref	_adcInit
1932                     	xref	_buffer_rdy
1933                     	xref	_adcBuffer1
1934                     	xref	_adcBuffer0
1935                     	xref	_pf_write
1936                     	xref	_pf_read
1937                     	xref	_pf_open
1938                     	xref	_pf_mount
1939                     	xdef	_assert_failed
1940                     	switch	.const
1941  0004               L722:
1942  0004 43464700      	dc.b	"CFG",0
1943                     	xref.b	c_lreg
1944                     	xref.b	c_x
1945                     	xref.b	c_y
1965                     	xref	c_llsh
1966                     	xref	c_ladc
1967                     	xref	c_umul
1968                     	xref	c_bmulx
1969                     	xref	c_imul
1970                     	xref	c_lzmp
1971                     	xref	c_lgsbc
1972                     	xref	c_rtol
1973                     	xref	c_ladd
1974                     	xref	c_ltor
1975                     	end
