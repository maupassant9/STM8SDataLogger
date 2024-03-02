   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  63                     ; 384 static WORD ld_word (const BYTE* ptr)	/*	 Load a 2-byte little-endian word */
  63                     ; 385 {
  65                     	switch	.text
  66  0000               L5_ld_word:
  68  0000 89            	pushw	x
  69  0001 89            	pushw	x
  70       00000002      OFST:	set	2
  73                     ; 388 	rv = ptr[1];
  75  0002 e601          	ld	a,(1,x)
  77                     ; 389 	rv = rv << 8 | ptr[0];
  79  0004 1603          	ldw	y,(OFST+1,sp)
  80  0006 97            	ld	xl,a
  81  0007 90f6          	ld	a,(y)
  82  0009 02            	rlwa	x,a
  84                     ; 390 	return rv;
  88  000a 5b04          	addw	sp,#4
  89  000c 81            	ret	
 131                     ; 393 static DWORD ld_dword (const BYTE* ptr)	/* Load a 4-byte little-endian word */
 131                     ; 394 {
 132                     	switch	.text
 133  000d               L53_ld_dword:
 135  000d 89            	pushw	x
 136  000e 5208          	subw	sp,#8
 137       00000008      OFST:	set	8
 140                     ; 397 	rv = ptr[3];
 142  0010 e603          	ld	a,(3,x)
 143  0012 6b08          	ld	(OFST+0,sp),a
 144  0014 4f            	clr	a
 145  0015 6b07          	ld	(OFST-1,sp),a
 146  0017 6b06          	ld	(OFST-2,sp),a
 147  0019 6b05          	ld	(OFST-3,sp),a
 149                     ; 398 	rv = rv << 8 | ptr[2];
 151  001b e602          	ld	a,(2,x)
 152  001d b703          	ld	c_lreg+3,a
 153  001f 3f02          	clr	c_lreg+2
 154  0021 3f01          	clr	c_lreg+1
 155  0023 3f00          	clr	c_lreg
 156  0025 96            	ldw	x,sp
 157  0026 5c            	incw	x
 158  0027 cd0000        	call	c_rtol
 161  002a 96            	ldw	x,sp
 162  002b 1c0005        	addw	x,#OFST-3
 163  002e cd0000        	call	c_ltor
 165  0031 a608          	ld	a,#8
 166  0033 cd0000        	call	c_llsh
 168  0036 96            	ldw	x,sp
 169  0037 5c            	incw	x
 170  0038 cd0000        	call	c_lor
 172  003b 96            	ldw	x,sp
 173  003c 1c0005        	addw	x,#OFST-3
 174  003f cd0000        	call	c_rtol
 177                     ; 399 	rv = rv << 8 | ptr[1];
 179  0042 1e09          	ldw	x,(OFST+1,sp)
 180  0044 e601          	ld	a,(1,x)
 181  0046 b703          	ld	c_lreg+3,a
 182  0048 3f02          	clr	c_lreg+2
 183  004a 3f01          	clr	c_lreg+1
 184  004c 3f00          	clr	c_lreg
 185  004e 96            	ldw	x,sp
 186  004f 5c            	incw	x
 187  0050 cd0000        	call	c_rtol
 190  0053 96            	ldw	x,sp
 191  0054 1c0005        	addw	x,#OFST-3
 192  0057 cd0000        	call	c_ltor
 194  005a a608          	ld	a,#8
 195  005c cd0000        	call	c_llsh
 197  005f 96            	ldw	x,sp
 198  0060 5c            	incw	x
 199  0061 cd0000        	call	c_lor
 201  0064 96            	ldw	x,sp
 202  0065 1c0005        	addw	x,#OFST-3
 203  0068 cd0000        	call	c_rtol
 206                     ; 400 	rv = rv << 8 | ptr[0];
 208  006b 1e09          	ldw	x,(OFST+1,sp)
 209  006d f6            	ld	a,(x)
 210  006e b703          	ld	c_lreg+3,a
 211  0070 3f02          	clr	c_lreg+2
 212  0072 3f01          	clr	c_lreg+1
 213  0074 3f00          	clr	c_lreg
 214  0076 96            	ldw	x,sp
 215  0077 5c            	incw	x
 216  0078 cd0000        	call	c_rtol
 219  007b 96            	ldw	x,sp
 220  007c 1c0005        	addw	x,#OFST-3
 221  007f cd0000        	call	c_ltor
 223  0082 a608          	ld	a,#8
 224  0084 cd0000        	call	c_llsh
 226  0087 96            	ldw	x,sp
 227  0088 5c            	incw	x
 228  0089 cd0000        	call	c_lor
 230  008c 96            	ldw	x,sp
 231  008d 1c0005        	addw	x,#OFST-3
 232  0090 cd0000        	call	c_rtol
 235                     ; 401 	return rv;
 237  0093 96            	ldw	x,sp
 238  0094 1c0005        	addw	x,#OFST-3
 239  0097 cd0000        	call	c_ltor
 243  009a 5b0a          	addw	sp,#10
 244  009c 81            	ret	
 303                     ; 411 static void mem_set (void* dst, int val, int cnt) {
 304                     	switch	.text
 305  009d               L75_mem_set:
 307  009d 89            	pushw	x
 308  009e 89            	pushw	x
 309       00000002      OFST:	set	2
 312                     ; 412 	char *d = (char*)dst;
 314  009f 2006          	jra	L311
 315  00a1               L701:
 316                     ; 413 	while (cnt--) *d++ = (char)val;
 318  00a1 1e01          	ldw	x,(OFST-1,sp)
 319  00a3 7b08          	ld	a,(OFST+6,sp)
 321  00a5 f7            	ld	(x),a
 322  00a6 5c            	incw	x
 323  00a7               L311:
 325  00a7 1f01          	ldw	(OFST-1,sp),x
 328  00a9 1e09          	ldw	x,(OFST+7,sp)
 329  00ab 5a            	decw	x
 330  00ac 1f09          	ldw	(OFST+7,sp),x
 331  00ae 5c            	incw	x
 332  00af 26f0          	jrne	L701
 333                     ; 414 }
 336  00b1 5b04          	addw	sp,#4
 337  00b3 81            	ret	
 416                     ; 417 static int mem_cmp (const void* dst, const void* src, int cnt) {
 417                     	switch	.text
 418  00b4               L711_mem_cmp:
 420  00b4 89            	pushw	x
 421  00b5 5206          	subw	sp,#6
 422       00000006      OFST:	set	6
 425                     ; 418 	const char *d = (const char *)dst, *s = (const char *)src;
 427  00b7 1f01          	ldw	(OFST-5,sp),x
 431  00b9 1e0b          	ldw	x,(OFST+5,sp)
 432  00bb 1f03          	ldw	(OFST-3,sp),x
 434                     ; 419 	int r = 0;
 437  00bd               L161:
 438                     ; 420 	while (cnt-- && (r = *d++ - *s++) == 0) ;
 440  00bd 1e0d          	ldw	x,(OFST+7,sp)
 441  00bf 5a            	decw	x
 442  00c0 1f0d          	ldw	(OFST+7,sp),x
 443  00c2 5c            	incw	x
 444  00c3 2719          	jreq	L561
 446  00c5 1e01          	ldw	x,(OFST-5,sp)
 448  00c7 f6            	ld	a,(x)
 449  00c8 5c            	incw	x
 450  00c9 1f01          	ldw	(OFST-5,sp),x
 451  00cb 5f            	clrw	x
 452  00cc 1603          	ldw	y,(OFST-3,sp)
 453  00ce 905c          	incw	y
 454  00d0 1703          	ldw	(OFST-3,sp),y
 455  00d2 905a          	decw	y
 457  00d4 90f0          	sub	a,(y)
 458  00d6 2401          	jrnc	L41
 459  00d8 5a            	decw	x
 460  00d9               L41:
 461  00d9 02            	rlwa	x,a
 462  00da 1f05          	ldw	(OFST-1,sp),x
 464  00dc 27df          	jreq	L161
 465  00de               L561:
 466                     ; 421 	return r;
 468  00de 1e05          	ldw	x,(OFST-1,sp)
 471  00e0 5b08          	addw	sp,#8
 472  00e2 81            	ret	
 634                     .const:	section	.text
 635  0000               L02:
 636  0000 00000002      	dc.l	2
 637                     ; 430 static CLUST get_fat (	/* 1:IO error, Else:Cluster status */
 637                     ; 431 	CLUST clst	/* Cluster# to get the link information */
 637                     ; 432 )
 637                     ; 433 {
 638                     	switch	.text
 639  00e3               L761_get_fat:
 641  00e3 5206          	subw	sp,#6
 642       00000006      OFST:	set	6
 645                     ; 435 	FATFS *fs = FatFs;
 647  00e5 ce0000        	ldw	x,L3_FatFs
 648  00e8 1f05          	ldw	(OFST-1,sp),x
 650                     ; 440 	if (clst < 2 || clst >= fs->n_fatent) return 1;	/* Range check */
 652  00ea 96            	ldw	x,sp
 653  00eb 1c0009        	addw	x,#OFST+3
 654  00ee cd0000        	call	c_ltor
 656  00f1 ae0000        	ldw	x,#L02
 657  00f4 cd0000        	call	c_lcmp
 659  00f7 2559          	jrult	L762
 661  00f9 1e05          	ldw	x,(OFST-1,sp)
 662  00fb 1c0006        	addw	x,#6
 663  00fe cd0000        	call	c_ltor
 665  0101 96            	ldw	x,sp
 666  0102 1c0009        	addw	x,#OFST+3
 667  0105 cd0000        	call	c_lcmp
 671  0108 2348          	jrule	L762
 672                     ; 442 	switch (fs->fs_type) {
 674  010a 1e05          	ldw	x,(OFST-1,sp)
 675  010c f6            	ld	a,(x)
 676  010d a103          	cp	a,#3
 677  010f 2641          	jrne	L762
 680                     ; 463 	case FS_FAT32 :
 680                     ; 464 		if (disk_readp(buf, fs->fatbase + clst / 128, ((UINT)clst % 128) * 4, 4)) break;
 682  0111 ae0004        	ldw	x,#4
 683  0114 89            	pushw	x
 684  0115 7b0e          	ld	a,(OFST+8,sp)
 685  0117 a47f          	and	a,#127
 686  0119 97            	ld	xl,a
 687  011a a604          	ld	a,#4
 688  011c 42            	mul	x,a
 689  011d 89            	pushw	x
 690  011e 96            	ldw	x,sp
 691  011f 1c000d        	addw	x,#OFST+7
 692  0122 cd0000        	call	c_ltor
 694  0125 a607          	ld	a,#7
 695  0127 cd0000        	call	c_lursh
 697  012a 1e09          	ldw	x,(OFST+3,sp)
 698  012c 1c000a        	addw	x,#10
 699  012f cd0000        	call	c_ladd
 701  0132 be02          	ldw	x,c_lreg+2
 702  0134 89            	pushw	x
 703  0135 be00          	ldw	x,c_lreg
 704  0137 89            	pushw	x
 705  0138 96            	ldw	x,sp
 706  0139 1c0009        	addw	x,#OFST+3
 707  013c cd0000        	call	_disk_readp
 709  013f 5b08          	addw	sp,#8
 710  0141 4d            	tnz	a
 711  0142 260e          	jrne	L762
 714                     ; 465 		return ld_dword(buf) & 0x0FFFFFFF;
 716  0144 96            	ldw	x,sp
 717  0145 5c            	incw	x
 718  0146 cd000d        	call	L53_ld_dword
 720  0149 b600          	ld	a,c_lreg
 721  014b a40f          	and	a,#15
 722  014d b700          	ld	c_lreg,a
 724  014f               L62:
 726  014f 5b06          	addw	sp,#6
 727  0151 81            	ret	
 728  0152               L762:
 729                     ; 469 	return 1;	/* An error occured at the disk I/O layer */
 732  0152 ae0001        	ldw	x,#1
 733  0155 bf02          	ldw	c_lreg+2,x
 734  0157 5f            	clrw	x
 735  0158 bf00          	ldw	c_lreg,x
 737  015a 20f3          	jra	L62
 782                     ; 479 static DWORD clust2sect (	/* !=0: Sector number, 0: Failed - invalid cluster# */
 782                     ; 480 	CLUST clst		/* Cluster# to be converted */
 782                     ; 481 )
 782                     ; 482 {
 783                     	switch	.text
 784  015c               L372_clust2sect:
 786  015c 5206          	subw	sp,#6
 787       00000006      OFST:	set	6
 790                     ; 483 	FATFS *fs = FatFs;
 792  015e ce0000        	ldw	x,L3_FatFs
 793  0161 1f05          	ldw	(OFST-1,sp),x
 795                     ; 486 	clst -= 2;
 797  0163 96            	ldw	x,sp
 798  0164 1c0009        	addw	x,#OFST+3
 799  0167 a602          	ld	a,#2
 800  0169 cd0000        	call	c_lgsbc
 802                     ; 487 	if (clst >= (fs->n_fatent - 2)) return 0;		/* Invalid cluster# */
 804  016c 1e05          	ldw	x,(OFST-1,sp)
 805  016e 1c0006        	addw	x,#6
 806  0171 cd0000        	call	c_ltor
 808  0174 a602          	ld	a,#2
 809  0176 cd0000        	call	c_lsbc
 811  0179 96            	ldw	x,sp
 812  017a 1c0009        	addw	x,#OFST+3
 813  017d cd0000        	call	c_lcmp
 815  0180 2207          	jrugt	L713
 818  0182 5f            	clrw	x
 819  0183 bf02          	ldw	c_lreg+2,x
 820  0185 bf00          	ldw	c_lreg,x
 822  0187 2025          	jra	L23
 823  0189               L713:
 824                     ; 488 	return (DWORD)clst * fs->csize + fs->database;
 826  0189 1e05          	ldw	x,(OFST-1,sp)
 827  018b e602          	ld	a,(2,x)
 828  018d b703          	ld	c_lreg+3,a
 829  018f 3f02          	clr	c_lreg+2
 830  0191 3f01          	clr	c_lreg+1
 831  0193 3f00          	clr	c_lreg
 832  0195 96            	ldw	x,sp
 833  0196 5c            	incw	x
 834  0197 cd0000        	call	c_rtol
 837  019a 96            	ldw	x,sp
 838  019b 1c0009        	addw	x,#OFST+3
 839  019e cd0000        	call	c_ltor
 841  01a1 96            	ldw	x,sp
 842  01a2 5c            	incw	x
 843  01a3 cd0000        	call	c_lmul
 845  01a6 1e05          	ldw	x,(OFST-1,sp)
 846  01a8 1c0012        	addw	x,#18
 847  01ab cd0000        	call	c_ladd
 850  01ae               L23:
 852  01ae 5b06          	addw	sp,#6
 853  01b0 81            	ret	
 909                     ; 492 static CLUST get_clust (
 909                     ; 493 	BYTE* dir		/* Pointer to directory entry */
 909                     ; 494 )
 909                     ; 495 {
 910                     	switch	.text
 911  01b1               L123_get_clust:
 913  01b1 89            	pushw	x
 914  01b2 5206          	subw	sp,#6
 915       00000006      OFST:	set	6
 918                     ; 496 	FATFS *fs = FatFs;
 920                     ; 497 	CLUST clst = 0;
 922  01b4 5f            	clrw	x
 923  01b5 1f05          	ldw	(OFST-1,sp),x
 924  01b7 1f03          	ldw	(OFST-3,sp),x
 926                     ; 501 		clst = ld_word(dir+DIR_FstClusHI);
 928  01b9 1e07          	ldw	x,(OFST+1,sp)
 929  01bb 1c0014        	addw	x,#20
 930  01be cd0000        	call	L5_ld_word
 932  01c1 cd0000        	call	c_uitolx
 934  01c4 96            	ldw	x,sp
 935  01c5 1c0003        	addw	x,#OFST-3
 936  01c8 cd0000        	call	c_rtol
 939                     ; 502 		clst <<= 16;
 941  01cb 96            	ldw	x,sp
 942  01cc 1c0003        	addw	x,#OFST-3
 943  01cf a610          	ld	a,#16
 944  01d1 cd0000        	call	c_lglsh
 947                     ; 504 	clst |= ld_word(dir+DIR_FstClusLO);
 949  01d4 1e07          	ldw	x,(OFST+1,sp)
 950  01d6 1c001a        	addw	x,#26
 951  01d9 cd0000        	call	L5_ld_word
 953  01dc cd0000        	call	c_uitolx
 955  01df 96            	ldw	x,sp
 956  01e0 1c0003        	addw	x,#OFST-3
 957  01e3 cd0000        	call	c_lgor
 960                     ; 506 	return clst;
 962  01e6 96            	ldw	x,sp
 963  01e7 1c0003        	addw	x,#OFST-3
 964  01ea cd0000        	call	c_ltor
 968  01ed 5b08          	addw	sp,#8
 969  01ef 81            	ret	
1128                     	switch	.const
1129  0004               L44:
1130  0004 00000001      	dc.l	1
1131                     ; 514 static FRESULT dir_rewind (
1131                     ; 515 	DIR *dj			/* Pointer to directory object */
1131                     ; 516 )
1131                     ; 517 {
1132                     	switch	.text
1133  01f0               L153_dir_rewind:
1135  01f0 89            	pushw	x
1136  01f1 5206          	subw	sp,#6
1137       00000006      OFST:	set	6
1140                     ; 519 	FATFS *fs = FatFs;
1142  01f3 ce0000        	ldw	x,L3_FatFs
1143  01f6 1f01          	ldw	(OFST-5,sp),x
1145                     ; 522 	dj->index = 0;
1147  01f8 1e07          	ldw	x,(OFST+1,sp)
1148  01fa 905f          	clrw	y
1149  01fc ff            	ldw	(x),y
1150                     ; 523 	clst = dj->sclust;
1152  01fd 9093          	ldw	y,x
1153  01ff ee06          	ldw	x,(6,x)
1154  0201 1f05          	ldw	(OFST-1,sp),x
1155  0203 93            	ldw	x,y
1156  0204 ee04          	ldw	x,(4,x)
1157  0206 1f03          	ldw	(OFST-3,sp),x
1159                     ; 524 	if (clst == 1 || clst >= fs->n_fatent) {	/* Check start cluster range */
1161  0208 96            	ldw	x,sp
1162  0209 1c0003        	addw	x,#OFST-3
1163  020c cd0000        	call	c_ltor
1165  020f ae0004        	ldw	x,#L44
1166  0212 cd0000        	call	c_lcmp
1168  0215 2711          	jreq	L744
1170  0217 1e01          	ldw	x,(OFST-5,sp)
1171  0219 1c0006        	addw	x,#6
1172  021c cd0000        	call	c_ltor
1174  021f 96            	ldw	x,sp
1175  0220 1c0003        	addw	x,#OFST-3
1176  0223 cd0000        	call	c_lcmp
1178  0226 2204          	jrugt	L544
1179  0228               L744:
1180                     ; 525 		return FR_DISK_ERR;
1182  0228 a601          	ld	a,#1
1184  022a 203c          	jra	L05
1185  022c               L544:
1186                     ; 527 	if (PF_FS_FAT32 && !clst && (_FS_32ONLY || fs->fs_type == FS_FAT32)) {	/* Replace cluster# 0 with root cluster# if in FAT32 */
1188  022c 96            	ldw	x,sp
1189  022d 1c0003        	addw	x,#OFST-3
1190  0230 cd0000        	call	c_lzmp
1192  0233 260d          	jrne	L154
1193                     ; 528 		clst = (CLUST)fs->dirbase;
1195  0235 1e01          	ldw	x,(OFST-5,sp)
1196  0237 9093          	ldw	y,x
1197  0239 ee10          	ldw	x,(16,x)
1198  023b 1f05          	ldw	(OFST-1,sp),x
1199  023d 93            	ldw	x,y
1200  023e ee0e          	ldw	x,(14,x)
1201  0240 1f03          	ldw	(OFST-3,sp),x
1203  0242               L154:
1204                     ; 530 	dj->clust = clst;						/* Current cluster */
1206  0242 1e07          	ldw	x,(OFST+1,sp)
1207  0244 7b06          	ld	a,(OFST+0,sp)
1208  0246 e70b          	ld	(11,x),a
1209  0248 7b05          	ld	a,(OFST-1,sp)
1210  024a e70a          	ld	(10,x),a
1211  024c 7b04          	ld	a,(OFST-2,sp)
1212  024e e709          	ld	(9,x),a
1213  0250 7b03          	ld	a,(OFST-3,sp)
1214  0252 e708          	ld	(8,x),a
1215                     ; 531 	dj->sect = (_FS_32ONLY || clst) ? clust2sect(clst) : fs->dirbase;	/* Current sector */
1217  0254 1e05          	ldw	x,(OFST-1,sp)
1218  0256 89            	pushw	x
1219  0257 1e05          	ldw	x,(OFST-1,sp)
1220  0259 89            	pushw	x
1221  025a cd015c        	call	L372_clust2sect
1223  025d 5b04          	addw	sp,#4
1224  025f 1e07          	ldw	x,(OFST+1,sp)
1225  0261 1c000c        	addw	x,#12
1226  0264 cd0000        	call	c_rtol
1228                     ; 533 	return FR_OK;	/* Seek succeeded */
1230  0267 4f            	clr	a
1232  0268               L05:
1234  0268 5b08          	addw	sp,#8
1235  026a 81            	ret	
1302                     ; 543 static FRESULT dir_next (	/* FR_OK:Succeeded, FR_NO_FILE:End of table */
1302                     ; 544 	DIR *dj			/* Pointer to directory object */
1302                     ; 545 )
1302                     ; 546 {
1303                     	switch	.text
1304  026b               L354_dir_next:
1306  026b 89            	pushw	x
1307  026c 520a          	subw	sp,#10
1308       0000000a      OFST:	set	10
1311                     ; 549 	FATFS *fs = FatFs;
1313  026e ce0000        	ldw	x,L3_FatFs
1314  0271 1f03          	ldw	(OFST-7,sp),x
1316                     ; 552 	i = dj->index + 1;
1318  0273 1e0b          	ldw	x,(OFST+1,sp)
1319  0275 fe            	ldw	x,(x)
1320  0276 5c            	incw	x
1321  0277 1f09          	ldw	(OFST-1,sp),x
1323                     ; 553 	if (!i || !dj->sect) return FR_NO_FILE;	/* Report EOT when index has reached 65535 */
1325  0279 272f          	jreq	LC002
1327  027b 1e0b          	ldw	x,(OFST+1,sp)
1328  027d 1c000c        	addw	x,#12
1329  0280 cd0000        	call	c_lzmp
1333  0283 2725          	jreq	LC002
1334                     ; 555 	if (!(i % 16)) {		/* Sector changed? */
1336  0285 7b0a          	ld	a,(OFST+0,sp)
1337  0287 a50f          	bcp	a,#15
1338  0289 2703cc0328    	jrne	L315
1339                     ; 556 		dj->sect++;			/* Next sector */
1341  028e 1e0b          	ldw	x,(OFST+1,sp)
1342  0290 1c000c        	addw	x,#12
1343  0293 a601          	ld	a,#1
1344  0295 cd0000        	call	c_lgadc
1346                     ; 558 		if (dj->clust == 0) {	/* Static table */
1348  0298 1e0b          	ldw	x,(OFST+1,sp)
1349  029a 1c0008        	addw	x,#8
1350  029d cd0000        	call	c_lzmp
1352  02a0 260d          	jrne	L515
1353                     ; 559 			if (i >= fs->n_rootdir) return FR_NO_FILE;	/* Report EOT when end of table */
1355  02a2 1e03          	ldw	x,(OFST-7,sp)
1356  02a4 ee04          	ldw	x,(4,x)
1357  02a6 1309          	cpw	x,(OFST-1,sp)
1358  02a8 227e          	jrugt	L315
1361  02aa               LC002:
1364  02aa a603          	ld	a,#3
1366  02ac               L06:
1368  02ac 5b0c          	addw	sp,#12
1369  02ae 81            	ret	
1370  02af               L515:
1371                     ; 562 			if (((i / 16) & (fs->csize - 1)) == 0) {	/* Cluster changed? */
1373  02af 1e03          	ldw	x,(OFST-7,sp)
1374  02b1 e602          	ld	a,(2,x)
1375  02b3 5f            	clrw	x
1376  02b4 97            	ld	xl,a
1377  02b5 5a            	decw	x
1378  02b6 1f01          	ldw	(OFST-9,sp),x
1380  02b8 1e09          	ldw	x,(OFST-1,sp)
1381  02ba 54            	srlw	x
1382  02bb 54            	srlw	x
1383  02bc 54            	srlw	x
1384  02bd 54            	srlw	x
1385  02be 01            	rrwa	x,a
1386  02bf 1402          	and	a,(OFST-8,sp)
1387  02c1 01            	rrwa	x,a
1388  02c2 1401          	and	a,(OFST-9,sp)
1389  02c4 01            	rrwa	x,a
1390  02c5 5d            	tnzw	x
1391  02c6 2660          	jrne	L315
1392                     ; 563 				clst = get_fat(dj->clust);		/* Get next cluster */
1394  02c8 1e0b          	ldw	x,(OFST+1,sp)
1395  02ca 9093          	ldw	y,x
1396  02cc ee0a          	ldw	x,(10,x)
1397  02ce 89            	pushw	x
1398  02cf 93            	ldw	x,y
1399  02d0 ee08          	ldw	x,(8,x)
1400  02d2 89            	pushw	x
1401  02d3 cd00e3        	call	L761_get_fat
1403  02d6 5b04          	addw	sp,#4
1404  02d8 96            	ldw	x,sp
1405  02d9 1c0005        	addw	x,#OFST-5
1406  02dc cd0000        	call	c_rtol
1409                     ; 564 				if (clst <= 1) return FR_DISK_ERR;
1411  02df 96            	ldw	x,sp
1412  02e0 1c0005        	addw	x,#OFST-5
1413  02e3 cd0000        	call	c_ltor
1415  02e6 ae0000        	ldw	x,#L02
1416  02e9 cd0000        	call	c_lcmp
1418  02ec 2404          	jruge	L525
1421  02ee a601          	ld	a,#1
1423  02f0 20ba          	jra	L06
1424  02f2               L525:
1425                     ; 565 				if (clst >= fs->n_fatent) return FR_NO_FILE;	/* Report EOT when it reached end of dynamic table */
1427  02f2 1e03          	ldw	x,(OFST-7,sp)
1428  02f4 1c0006        	addw	x,#6
1429  02f7 cd0000        	call	c_ltor
1431  02fa 96            	ldw	x,sp
1432  02fb 1c0005        	addw	x,#OFST-5
1433  02fe cd0000        	call	c_lcmp
1437  0301 23a7          	jrule	LC002
1438                     ; 566 				dj->clust = clst;				/* Initialize data for new cluster */
1440  0303 1e0b          	ldw	x,(OFST+1,sp)
1441  0305 7b08          	ld	a,(OFST-2,sp)
1442  0307 e70b          	ld	(11,x),a
1443  0309 7b07          	ld	a,(OFST-3,sp)
1444  030b e70a          	ld	(10,x),a
1445  030d 7b06          	ld	a,(OFST-4,sp)
1446  030f e709          	ld	(9,x),a
1447  0311 7b05          	ld	a,(OFST-5,sp)
1448  0313 e708          	ld	(8,x),a
1449                     ; 567 				dj->sect = clust2sect(clst);
1451  0315 1e07          	ldw	x,(OFST-3,sp)
1452  0317 89            	pushw	x
1453  0318 1e07          	ldw	x,(OFST-3,sp)
1454  031a 89            	pushw	x
1455  031b cd015c        	call	L372_clust2sect
1457  031e 5b04          	addw	sp,#4
1458  0320 1e0b          	ldw	x,(OFST+1,sp)
1459  0322 1c000c        	addw	x,#12
1460  0325 cd0000        	call	c_rtol
1462  0328               L315:
1463                     ; 572 	dj->index = i;
1465  0328 1e0b          	ldw	x,(OFST+1,sp)
1466  032a 1609          	ldw	y,(OFST-1,sp)
1467  032c ff            	ldw	(x),y
1468                     ; 574 	return FR_OK;
1470  032d 4f            	clr	a
1472  032e cc02ac        	jra	L06
1541                     ; 584 static FRESULT dir_find (
1541                     ; 585 	DIR *dj,		/* Pointer to the directory object linked to the file name */
1541                     ; 586 	BYTE *dir		/* 32-byte working buffer */
1541                     ; 587 )
1541                     ; 588 {
1542                     	switch	.text
1543  0331               L135_dir_find:
1545  0331 89            	pushw	x
1546  0332 89            	pushw	x
1547       00000002      OFST:	set	2
1550                     ; 593 	res = dir_rewind(dj);			/* Rewind directory object */
1552  0333 cd01f0        	call	L153_dir_rewind
1554  0336 6b02          	ld	(OFST+0,sp),a
1556                     ; 594 	if (res != FR_OK) return res;
1561  0338 265b          	jrne	L001
1562  033a               L765:
1563                     ; 597 		res = disk_readp(dir, dj->sect, (dj->index % 16) * 32, 32)	/* Read an entry */
1563                     ; 598 			? FR_DISK_ERR : FR_OK;
1565  033a ae0020        	ldw	x,#32
1566  033d 89            	pushw	x
1567  033e 1e05          	ldw	x,(OFST+3,sp)
1568  0340 e601          	ld	a,(1,x)
1569  0342 a40f          	and	a,#15
1570  0344 97            	ld	xl,a
1571  0345 a620          	ld	a,#32
1572  0347 42            	mul	x,a
1573  0348 89            	pushw	x
1574  0349 1e07          	ldw	x,(OFST+5,sp)
1575  034b 9093          	ldw	y,x
1576  034d ee0e          	ldw	x,(14,x)
1577  034f 89            	pushw	x
1578  0350 93            	ldw	x,y
1579  0351 ee0c          	ldw	x,(12,x)
1580  0353 89            	pushw	x
1581  0354 1e0f          	ldw	x,(OFST+13,sp)
1582  0356 cd0000        	call	_disk_readp
1584  0359 5b08          	addw	sp,#8
1585  035b 4d            	tnz	a
1586  035c 2702          	jreq	L66
1587  035e a601          	ld	a,#1
1588  0360               L66:
1589  0360 6b02          	ld	(OFST+0,sp),a
1591                     ; 599 		if (res != FR_OK) break;
1593  0362 262f          	jrne	L375
1596                     ; 600 		c = dir[DIR_Name];	/* First character */
1598  0364 1e07          	ldw	x,(OFST+5,sp)
1599  0366 f6            	ld	a,(x)
1600  0367 6b01          	ld	(OFST-1,sp),a
1602                     ; 601 		if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
1604  0369 2606          	jrne	L775
1607  036b a603          	ld	a,#3
1608  036d 6b02          	ld	(OFST+0,sp),a
1612  036f 2022          	jra	L375
1613  0371               L775:
1614                     ; 602 		if (!(dir[DIR_Attr] & AM_VOL) && !mem_cmp(dir, dj->fn, 11)) break;	/* Is it a valid entry? */
1616  0371 e60b          	ld	a,(11,x)
1617  0373 a508          	bcp	a,#8
1618  0375 2613          	jrne	L106
1620  0377 ae000b        	ldw	x,#11
1621  037a 89            	pushw	x
1622  037b 1e05          	ldw	x,(OFST+3,sp)
1623  037d ee02          	ldw	x,(2,x)
1624  037f 89            	pushw	x
1625  0380 1e0b          	ldw	x,(OFST+9,sp)
1626  0382 cd00b4        	call	L711_mem_cmp
1628  0385 5b04          	addw	sp,#4
1629  0387 5d            	tnzw	x
1630  0388 2709          	jreq	L375
1633  038a               L106:
1634                     ; 603 		res = dir_next(dj);					/* Next entry */
1636  038a 1e03          	ldw	x,(OFST+1,sp)
1637  038c cd026b        	call	L354_dir_next
1639  038f 6b02          	ld	(OFST+0,sp),a
1641                     ; 604 	} while (res == FR_OK);
1643  0391 27a7          	jreq	L765
1644  0393               L375:
1645                     ; 606 	return res;
1647  0393 7b02          	ld	a,(OFST+0,sp)
1649  0395               L001:
1651  0395 5b04          	addw	sp,#4
1652  0397 81            	ret	
1757                     ; 651 static FRESULT create_name (
1757                     ; 652 	DIR *dj,			/* Pointer to the directory object */
1757                     ; 653 	const char **path	/* Pointer to pointer to the segment in the path string */
1757                     ; 654 )
1757                     ; 655 {
1758                     	switch	.text
1759  0398               L306_create_name:
1761  0398 89            	pushw	x
1762  0399 5209          	subw	sp,#9
1763       00000009      OFST:	set	9
1766                     ; 663 	sfn = dj->fn;
1768  039b ee02          	ldw	x,(2,x)
1769  039d 1f05          	ldw	(OFST-4,sp),x
1771                     ; 664 	mem_set(sfn, ' ', 11);
1773  039f ae000b        	ldw	x,#11
1774  03a2 89            	pushw	x
1775  03a3 ae0020        	ldw	x,#32
1776  03a6 89            	pushw	x
1777  03a7 1e09          	ldw	x,(OFST+0,sp)
1778  03a9 cd009d        	call	L75_mem_set
1780  03ac 5b04          	addw	sp,#4
1781                     ; 665 	si = i = 0; ni = 8;
1783  03ae 0f08          	clr	(OFST-1,sp)
1785  03b0 0f02          	clr	(OFST-7,sp)
1789  03b2 a608          	ld	a,#8
1790  03b4 6b07          	ld	(OFST-2,sp),a
1792                     ; 666 	p = *path;
1794  03b6 1e0e          	ldw	x,(OFST+5,sp)
1795  03b8 fe            	ldw	x,(x)
1796  03b9 1f03          	ldw	(OFST-6,sp),x
1798  03bb               L356:
1799                     ; 668 		c = p[si++];
1801  03bb 7b02          	ld	a,(OFST-7,sp)
1802  03bd 0c02          	inc	(OFST-7,sp)
1804  03bf 5f            	clrw	x
1805  03c0 97            	ld	xl,a
1806  03c1 72fb03        	addw	x,(OFST-6,sp)
1807  03c4 f6            	ld	a,(x)
1808  03c5 6b09          	ld	(OFST+0,sp),a
1810                     ; 669 		if (c <= ' ' || c == '/') break;	/* Break on end of segment */
1812  03c7 a121          	cp	a,#33
1813  03c9 2530          	jrult	L556
1815  03cb a12f          	cp	a,#47
1816  03cd 272c          	jreq	L556
1817                     ; 670 		if (c == '.' || i >= ni) {
1819  03cf a12e          	cp	a,#46
1820  03d1 2706          	jreq	L566
1822  03d3 7b08          	ld	a,(OFST-1,sp)
1823  03d5 1107          	cp	a,(OFST-2,sp)
1824  03d7 2516          	jrult	L366
1825  03d9               L566:
1826                     ; 671 			if (ni != 8 || c != '.') break;
1828  03d9 7b07          	ld	a,(OFST-2,sp)
1829  03db a108          	cp	a,#8
1830  03dd 261c          	jrne	L556
1832  03df 7b09          	ld	a,(OFST+0,sp)
1833  03e1 a12e          	cp	a,#46
1834  03e3 2616          	jrne	L556
1835                     ; 672 			i = 8; ni = 11;
1837  03e5 a608          	ld	a,#8
1838  03e7 6b08          	ld	(OFST-1,sp),a
1842  03e9 a60b          	ld	a,#11
1843  03eb 6b07          	ld	(OFST-2,sp),a
1845                     ; 673 			continue;
1847  03ed 20cc          	jra	L356
1848  03ef               L366:
1849                     ; 684 			sfn[i++] = c;
1851  03ef 0c08          	inc	(OFST-1,sp)
1853  03f1 5f            	clrw	x
1854  03f2 97            	ld	xl,a
1855  03f3 72fb05        	addw	x,(OFST-4,sp)
1856  03f6 7b09          	ld	a,(OFST+0,sp)
1857  03f8 f7            	ld	(x),a
1859  03f9 20c0          	jra	L356
1860  03fb               L556:
1861                     ; 687 	*path = &p[si];						/* Rerurn pointer to the next segment */
1863  03fb 7b02          	ld	a,(OFST-7,sp)
1864  03fd 5f            	clrw	x
1865  03fe 97            	ld	xl,a
1866  03ff 160e          	ldw	y,(OFST+5,sp)
1867  0401 72fb03        	addw	x,(OFST-6,sp)
1868  0404 90ff          	ldw	(y),x
1869                     ; 689 	sfn[11] = (c <= ' ') ? 1 : 0;		/* Set last segment flag if end of path */
1871  0406 7b09          	ld	a,(OFST+0,sp)
1872  0408 a121          	cp	a,#33
1873  040a 2404          	jruge	L601
1874  040c a601          	ld	a,#1
1875  040e 2001          	jra	L011
1876  0410               L601:
1877  0410 4f            	clr	a
1878  0411               L011:
1879  0411 1e05          	ldw	x,(OFST-4,sp)
1880  0413 e70b          	ld	(11,x),a
1881                     ; 691 	return FR_OK;
1883  0415 4f            	clr	a
1886  0416 5b0b          	addw	sp,#11
1887  0418 81            	ret	
1959                     ; 742 static FRESULT follow_path (	/* FR_OK(0): successful, !=0: error code */
1959                     ; 743 	DIR *dj,			/* Directory object to return last directory and found object */
1959                     ; 744 	BYTE *dir,			/* 32-byte working buffer */
1959                     ; 745 	const char *path	/* Full-path string to find a file or directory */
1959                     ; 746 )
1959                     ; 747 {
1960                     	switch	.text
1961  0419               L376_follow_path:
1963  0419 89            	pushw	x
1964  041a 88            	push	a
1965       00000001      OFST:	set	1
1968  041b 1e08          	ldw	x,(OFST+7,sp)
1969  041d 2001          	jra	L337
1970  041f               L137:
1971                     ; 751 	while (*path == ' ') path++;		/* Strip leading spaces */
1973  041f 5c            	incw	x
1974  0420               L337:
1977  0420 f6            	ld	a,(x)
1978  0421 a120          	cp	a,#32
1979  0423 27fa          	jreq	L137
1980                     ; 752 	if (*path == '/') path++;			/* Strip heading separator if exist */
1982  0425 a12f          	cp	a,#47
1983  0427 2601          	jrne	L737
1986  0429 5c            	incw	x
1987  042a               L737:
1988  042a 1f08          	ldw	(OFST+7,sp),x
1989                     ; 753 	dj->sclust = 0;						/* Set start directory (always root dir) */
1991  042c 1e02          	ldw	x,(OFST+1,sp)
1992  042e 4f            	clr	a
1993  042f e707          	ld	(7,x),a
1994  0431 e706          	ld	(6,x),a
1995  0433 e705          	ld	(5,x),a
1996  0435 e704          	ld	(4,x),a
1997                     ; 755 	if ((BYTE)*path < ' ') {			/* Null path means the root directory */
1999  0437 1e08          	ldw	x,(OFST+7,sp)
2000  0439 f6            	ld	a,(x)
2001  043a a120          	cp	a,#32
2002  043c 240c          	jruge	L547
2003                     ; 756 		res = dir_rewind(dj);
2005  043e 1e02          	ldw	x,(OFST+1,sp)
2006  0440 cd01f0        	call	L153_dir_rewind
2008  0443 6b01          	ld	(OFST+0,sp),a
2010                     ; 757 		dir[0] = 0;
2012  0445 1e06          	ldw	x,(OFST+5,sp)
2013  0447 7f            	clr	(x)
2015  0448 202e          	jra	L347
2016  044a               L547:
2017                     ; 761 			res = create_name(dj, &path);	/* Get a segment */
2019  044a 96            	ldw	x,sp
2020  044b 1c0008        	addw	x,#OFST+7
2021  044e 89            	pushw	x
2022  044f 1e04          	ldw	x,(OFST+3,sp)
2023  0451 cd0398        	call	L306_create_name
2025  0454 85            	popw	x
2026  0455 6b01          	ld	(OFST+0,sp),a
2028                     ; 762 			if (res != FR_OK) break;
2030  0457 261f          	jrne	L347
2033                     ; 763 			res = dir_find(dj, dir);		/* Find it */
2035  0459 1e06          	ldw	x,(OFST+5,sp)
2036  045b 89            	pushw	x
2037  045c 1e04          	ldw	x,(OFST+3,sp)
2038  045e cd0331        	call	L135_dir_find
2040  0461 85            	popw	x
2041  0462 6b01          	ld	(OFST+0,sp),a
2043                     ; 764 			if (res != FR_OK) break;		/* Could not find the object */
2045  0464 2612          	jrne	L347
2048                     ; 765 			if (dj->fn[11]) break;			/* Last segment match. Function completed. */
2050  0466 1e02          	ldw	x,(OFST+1,sp)
2051  0468 ee02          	ldw	x,(2,x)
2052  046a 6d0b          	tnz	(11,x)
2053  046c 260a          	jrne	L347
2056                     ; 766 			if (!(dir[DIR_Attr] & AM_DIR)) { /* Cannot follow path because it is a file */
2058  046e 1e06          	ldw	x,(OFST+5,sp)
2059  0470 e60b          	ld	a,(11,x)
2060  0472 a510          	bcp	a,#16
2061  0474 2605          	jrne	L757
2062                     ; 767 				res = FR_NO_FILE; break;
2064  0476 a603          	ld	a,#3
2067  0478               L347:
2068                     ; 773 	return res;
2072  0478 5b03          	addw	sp,#3
2073  047a 81            	ret	
2074  047b               L757:
2075                     ; 769 			dj->sclust = get_clust(dir);	/* Follow next */
2077  047b cd01b1        	call	L123_get_clust
2079  047e 1e02          	ldw	x,(OFST+1,sp)
2080  0480 1c0004        	addw	x,#4
2081  0483 cd0000        	call	c_rtol
2084  0486 20c2          	jra	L547
2128                     ; 783 static BYTE check_fs (	/* 0:The FAT boot record, 1:Valid boot record but not an FAT, 2:Not a boot record, 3:Error */
2128                     ; 784 	BYTE *buf,	/* Working buffer */
2128                     ; 785 	DWORD sect	/* Sector# (lba) to check if it is an FAT boot record or not */
2128                     ; 786 )
2128                     ; 787 {
2129                     	switch	.text
2130  0488               L167_check_fs:
2132  0488 89            	pushw	x
2133       00000000      OFST:	set	0
2136                     ; 788   if (disk_readp(buf, sect, 510, 2)) {	/* Read the boot record */
2138  0489 ae0002        	ldw	x,#2
2139  048c 89            	pushw	x
2140  048d ae01fe        	ldw	x,#510
2141  0490 89            	pushw	x
2142  0491 1e0b          	ldw	x,(OFST+11,sp)
2143  0493 89            	pushw	x
2144  0494 1e0b          	ldw	x,(OFST+11,sp)
2145  0496 89            	pushw	x
2146  0497 1e09          	ldw	x,(OFST+9,sp)
2147  0499 cd0000        	call	_disk_readp
2149  049c 5b08          	addw	sp,#8
2150  049e 4d            	tnz	a
2151  049f 2704          	jreq	L3001
2152                     ; 789 		return 3;
2154  04a1 a603          	ld	a,#3
2156  04a3 200c          	jra	L631
2157  04a5               L3001:
2158                     ; 791 	if (ld_word(buf) != 0xAA55) {			/* Check record signature */
2160  04a5 1e01          	ldw	x,(OFST+1,sp)
2161  04a7 cd0000        	call	L5_ld_word
2163  04aa a3aa55        	cpw	x,#43605
2164  04ad 2704          	jreq	L5001
2165                     ; 792 		return 2;
2167  04af a602          	ld	a,#2
2169  04b1               L631:
2171  04b1 85            	popw	x
2172  04b2 81            	ret	
2173  04b3               L5001:
2174                     ; 797 	if (PF_FS_FAT32 && !disk_readp(buf, sect, BS_FilSysType32, 2) && ld_word(buf) == 0x4146) {	/* Check FAT32 */
2176  04b3 ae0002        	ldw	x,#2
2177  04b6 89            	pushw	x
2178  04b7 ae0052        	ldw	x,#82
2179  04ba 89            	pushw	x
2180  04bb 1e0b          	ldw	x,(OFST+11,sp)
2181  04bd 89            	pushw	x
2182  04be 1e0b          	ldw	x,(OFST+11,sp)
2183  04c0 89            	pushw	x
2184  04c1 1e09          	ldw	x,(OFST+9,sp)
2185  04c3 cd0000        	call	_disk_readp
2187  04c6 5b08          	addw	sp,#8
2188  04c8 4d            	tnz	a
2189  04c9 260d          	jrne	L7001
2191  04cb 1e01          	ldw	x,(OFST+1,sp)
2192  04cd cd0000        	call	L5_ld_word
2194  04d0 a34146        	cpw	x,#16710
2195  04d3 2603          	jrne	L7001
2196                     ; 798 		return 0;
2198  04d5 4f            	clr	a
2200  04d6 20d9          	jra	L631
2201  04d8               L7001:
2202                     ; 800 	return 1;
2204  04d8 a601          	ld	a,#1
2206  04da 20d5          	jra	L631
2295                     	switch	.const
2296  0008               L471:
2297  0008 0000fff7      	dc.l	65527
2298                     ; 818 FRESULT pf_mount (
2298                     ; 819 	FATFS *fs		/* Pointer to new file system object */
2298                     ; 820 )
2298                     ; 821 {
2299                     	switch	.text
2300  04dc               _pf_mount:
2302  04dc 89            	pushw	x
2303  04dd 5239          	subw	sp,#57
2304       00000039      OFST:	set	57
2307                     ; 826 	FatFs = 0;
2309  04df 5f            	clrw	x
2310  04e0 cf0000        	ldw	L3_FatFs,x
2311                     ; 828 	if (disk_initialize() & STA_NOINIT) {	/* Check if the drive is ready or not */
2313  04e3 cd0000        	call	_disk_initialize
2315  04e6 a501          	bcp	a,#1
2316  04e8 2704          	jreq	L7401
2317                     ; 829 		return FR_NOT_READY;
2319  04ea a602          	ld	a,#2
2321  04ec 205d          	jra	L002
2322  04ee               L7401:
2323                     ; 833 	bsect = 0;
2325  04ee 5f            	clrw	x
2326  04ef 1f14          	ldw	(OFST-37,sp),x
2327  04f1 1f12          	ldw	(OFST-39,sp),x
2329                     ; 834 	fmt = check_fs(buf, bsect);			/* Check sector 0 as an SFD format */
2331  04f3 89            	pushw	x
2332  04f4 89            	pushw	x
2333  04f5 96            	ldw	x,sp
2334  04f6 1c001a        	addw	x,#OFST-31
2335  04f9 ad8d          	call	L167_check_fs
2337  04fb 5b04          	addw	sp,#4
2338  04fd 6b11          	ld	(OFST-40,sp),a
2340                     ; 835 	if (fmt == 1) {						/* Not an FAT boot record, it may be FDISK format */
2342  04ff 4a            	dec	a
2343  0500 2641          	jrne	L1501
2344                     ; 837 		if (disk_readp(buf, bsect, MBR_Table, 16)) {	/* 1st partition entry */
2346  0502 ae0010        	ldw	x,#16
2347  0505 89            	pushw	x
2348  0506 ae01be        	ldw	x,#446
2349  0509 89            	pushw	x
2350  050a 1e18          	ldw	x,(OFST-33,sp)
2351  050c 89            	pushw	x
2352  050d 1e18          	ldw	x,(OFST-33,sp)
2353  050f 89            	pushw	x
2354  0510 96            	ldw	x,sp
2355  0511 1c001e        	addw	x,#OFST-27
2356  0514 cd0000        	call	_disk_readp
2358  0517 5b08          	addw	sp,#8
2359  0519 4d            	tnz	a
2360  051a 2704          	jreq	L3501
2361                     ; 838 			fmt = 3;
2363  051c a603          	ld	a,#3
2365  051e 2021          	jp	LC003
2366  0520               L3501:
2367                     ; 840 			if (buf[4]) {					/* Is the partition existing? */
2369  0520 7b1a          	ld	a,(OFST-31,sp)
2370  0522 271f          	jreq	L1501
2371                     ; 841 				bsect = ld_dword(&buf[8]);	/* Partition offset in LBA */
2373  0524 96            	ldw	x,sp
2374  0525 1c001e        	addw	x,#OFST-27
2375  0528 cd000d        	call	L53_ld_dword
2377  052b 96            	ldw	x,sp
2378  052c 1c0012        	addw	x,#OFST-39
2379  052f cd0000        	call	c_rtol
2382                     ; 842 				fmt = check_fs(buf, bsect);	/* Check the partition */
2384  0532 1e14          	ldw	x,(OFST-37,sp)
2385  0534 89            	pushw	x
2386  0535 1e14          	ldw	x,(OFST-37,sp)
2387  0537 89            	pushw	x
2388  0538 96            	ldw	x,sp
2389  0539 1c001a        	addw	x,#OFST-31
2390  053c cd0488        	call	L167_check_fs
2392  053f 5b04          	addw	sp,#4
2393  0541               LC003:
2394  0541 6b11          	ld	(OFST-40,sp),a
2396  0543               L1501:
2397                     ; 846 	if (fmt == 3) return FR_DISK_ERR;
2399  0543 7b11          	ld	a,(OFST-40,sp)
2400  0545 a103          	cp	a,#3
2401  0547 2605          	jrne	L1601
2404  0549               LC004:
2406  0549 a601          	ld	a,#1
2408  054b               L002:
2410  054b 5b3b          	addw	sp,#59
2411  054d 81            	ret	
2412  054e               L1601:
2413                     ; 847 	if (fmt) return FR_NO_FILESYSTEM;	/* No valid FAT patition is found */
2415  054e 4d            	tnz	a
2418  054f 2703cc0686    	jrne	LC005
2419                     ; 850 	if (disk_readp(buf, bsect, 13, sizeof (buf))) return FR_DISK_ERR;
2421  0554 ae0024        	ldw	x,#36
2422  0557 89            	pushw	x
2423  0558 ae000d        	ldw	x,#13
2424  055b 89            	pushw	x
2425  055c 1e18          	ldw	x,(OFST-33,sp)
2426  055e 89            	pushw	x
2427  055f 1e18          	ldw	x,(OFST-33,sp)
2428  0561 89            	pushw	x
2429  0562 96            	ldw	x,sp
2430  0563 1c001e        	addw	x,#OFST-27
2431  0566 cd0000        	call	_disk_readp
2433  0569 5b08          	addw	sp,#8
2434  056b 4d            	tnz	a
2437  056c 26db          	jrne	LC004
2438                     ; 852 	fsize = ld_word(buf+BPB_FATSz16-13);				/* Number of sectors per FAT */
2440  056e 96            	ldw	x,sp
2441  056f 1c001f        	addw	x,#OFST-26
2442  0572 cd0000        	call	L5_ld_word
2444  0575 cd0000        	call	c_uitolx
2446  0578 96            	ldw	x,sp
2447  0579 1c000d        	addw	x,#OFST-44
2448  057c cd0000        	call	c_rtol
2451                     ; 853 	if (!fsize) fsize = ld_dword(buf+BPB_FATSz32-13);
2453  057f 96            	ldw	x,sp
2454  0580 1c000d        	addw	x,#OFST-44
2455  0583 cd0000        	call	c_lzmp
2457  0586 260e          	jrne	L7601
2460  0588 96            	ldw	x,sp
2461  0589 1c002d        	addw	x,#OFST-12
2462  058c cd000d        	call	L53_ld_dword
2464  058f 96            	ldw	x,sp
2465  0590 1c000d        	addw	x,#OFST-44
2466  0593 cd0000        	call	c_rtol
2469  0596               L7601:
2470                     ; 855 	fsize *= buf[BPB_NumFATs-13];						/* Number of sectors in FAT area */
2472  0596 7b19          	ld	a,(OFST-32,sp)
2473  0598 b703          	ld	c_lreg+3,a
2474  059a 3f02          	clr	c_lreg+2
2475  059c 3f01          	clr	c_lreg+1
2476  059e 3f00          	clr	c_lreg
2477  05a0 96            	ldw	x,sp
2478  05a1 1c000d        	addw	x,#OFST-44
2479  05a4 cd0000        	call	c_lgmul
2482                     ; 856 	fs->fatbase = bsect + ld_word(buf+BPB_RsvdSecCnt-13); /* FAT start sector (lba) */
2484  05a7 96            	ldw	x,sp
2485  05a8 1c0017        	addw	x,#OFST-34
2486  05ab cd0000        	call	L5_ld_word
2488  05ae cd0000        	call	c_uitolx
2490  05b1 96            	ldw	x,sp
2491  05b2 1c0012        	addw	x,#OFST-39
2492  05b5 cd0000        	call	c_ladd
2494  05b8 1e3a          	ldw	x,(OFST+1,sp)
2495  05ba 1c000a        	addw	x,#10
2496  05bd cd0000        	call	c_rtol
2498                     ; 857 	fs->csize = buf[BPB_SecPerClus-13];					/* Number of sectors per cluster */
2500  05c0 1e3a          	ldw	x,(OFST+1,sp)
2501  05c2 7b16          	ld	a,(OFST-35,sp)
2502  05c4 e702          	ld	(2,x),a
2503                     ; 858 	fs->n_rootdir = ld_word(buf+BPB_RootEntCnt-13);		/* Nmuber of root directory entries */
2505  05c6 96            	ldw	x,sp
2506  05c7 1c001a        	addw	x,#OFST-31
2507  05ca cd0000        	call	L5_ld_word
2509  05cd 163a          	ldw	y,(OFST+1,sp)
2510  05cf 90ef04        	ldw	(4,y),x
2511                     ; 859 	tsect = ld_word(buf+BPB_TotSec16-13);				/* Number of sectors on the file system */
2513  05d2 96            	ldw	x,sp
2514  05d3 1c001c        	addw	x,#OFST-29
2515  05d6 cd0000        	call	L5_ld_word
2517  05d9 cd0000        	call	c_uitolx
2519  05dc 96            	ldw	x,sp
2520  05dd 1c0012        	addw	x,#OFST-39
2521  05e0 cd0000        	call	c_rtol
2524                     ; 860 	if (!tsect) tsect = ld_dword(buf+BPB_TotSec32-13);
2526  05e3 96            	ldw	x,sp
2527  05e4 1c0012        	addw	x,#OFST-39
2528  05e7 cd0000        	call	c_lzmp
2530  05ea 260e          	jrne	L1701
2533  05ec 96            	ldw	x,sp
2534  05ed 1c0029        	addw	x,#OFST-16
2535  05f0 cd000d        	call	L53_ld_dword
2537  05f3 96            	ldw	x,sp
2538  05f4 1c0012        	addw	x,#OFST-39
2539  05f7 cd0000        	call	c_rtol
2542  05fa               L1701:
2543                     ; 861 	mclst = (tsect						/* Last cluster# + 1 */
2543                     ; 862 		- ld_word(buf+BPB_RsvdSecCnt-13) - fsize - fs->n_rootdir / 16
2543                     ; 863 		) / fs->csize + 2;
2545  05fa 1e3a          	ldw	x,(OFST+1,sp)
2546  05fc e602          	ld	a,(2,x)
2547  05fe b703          	ld	c_lreg+3,a
2548  0600 3f02          	clr	c_lreg+2
2549  0602 3f01          	clr	c_lreg+1
2550  0604 3f00          	clr	c_lreg
2551  0606 96            	ldw	x,sp
2552  0607 1c0009        	addw	x,#OFST-48
2553  060a cd0000        	call	c_rtol
2556  060d 1e3a          	ldw	x,(OFST+1,sp)
2557  060f ee04          	ldw	x,(4,x)
2558  0611 54            	srlw	x
2559  0612 54            	srlw	x
2560  0613 54            	srlw	x
2561  0614 54            	srlw	x
2562  0615 cd0000        	call	c_uitolx
2564  0618 96            	ldw	x,sp
2565  0619 1c0005        	addw	x,#OFST-52
2566  061c cd0000        	call	c_rtol
2569  061f 96            	ldw	x,sp
2570  0620 1c0017        	addw	x,#OFST-34
2571  0623 cd0000        	call	L5_ld_word
2573  0626 cd0000        	call	c_uitolx
2575  0629 96            	ldw	x,sp
2576  062a 5c            	incw	x
2577  062b cd0000        	call	c_rtol
2580  062e 96            	ldw	x,sp
2581  062f 1c0012        	addw	x,#OFST-39
2582  0632 cd0000        	call	c_ltor
2584  0635 96            	ldw	x,sp
2585  0636 5c            	incw	x
2586  0637 cd0000        	call	c_lsub
2588  063a 96            	ldw	x,sp
2589  063b 1c000d        	addw	x,#OFST-44
2590  063e cd0000        	call	c_lsub
2592  0641 96            	ldw	x,sp
2593  0642 1c0005        	addw	x,#OFST-52
2594  0645 cd0000        	call	c_lsub
2596  0648 96            	ldw	x,sp
2597  0649 1c0009        	addw	x,#OFST-48
2598  064c cd0000        	call	c_ludv
2600  064f a602          	ld	a,#2
2601  0651 cd0000        	call	c_ladc
2603  0654 96            	ldw	x,sp
2604  0655 1c0012        	addw	x,#OFST-39
2605  0658 cd0000        	call	c_rtol
2608                     ; 864 	fs->n_fatent = (CLUST)mclst;
2610  065b 1e3a          	ldw	x,(OFST+1,sp)
2611  065d 7b15          	ld	a,(OFST-36,sp)
2612  065f e709          	ld	(9,x),a
2613  0661 7b14          	ld	a,(OFST-37,sp)
2614  0663 e708          	ld	(8,x),a
2615  0665 7b13          	ld	a,(OFST-38,sp)
2616  0667 e707          	ld	(7,x),a
2617  0669 7b12          	ld	a,(OFST-39,sp)
2618  066b e706          	ld	(6,x),a
2619                     ; 866 	fmt = 0;							/* Determine the FAT sub type */
2621  066d 0f11          	clr	(OFST-40,sp)
2623                     ; 869 	if (PF_FS_FAT32 && mclst >= 0xFFF7) fmt = FS_FAT32;
2625  066f 96            	ldw	x,sp
2626  0670 1c0012        	addw	x,#OFST-39
2627  0673 cd0000        	call	c_ltor
2629  0676 ae0008        	ldw	x,#L471
2630  0679 cd0000        	call	c_lcmp
2632  067c 2504          	jrult	L3701
2635  067e a603          	ld	a,#3
2636  0680 6b11          	ld	(OFST-40,sp),a
2638  0682               L3701:
2639                     ; 870 	if (!fmt) return FR_NO_FILESYSTEM;
2641  0682 7b11          	ld	a,(OFST-40,sp)
2642  0684 2605          	jrne	L5701
2645  0686               LC005:
2647  0686 a606          	ld	a,#6
2649  0688 cc054b        	jra	L002
2650  068b               L5701:
2651                     ; 871 	fs->fs_type = fmt;
2653  068b 1e3a          	ldw	x,(OFST+1,sp)
2654  068d f7            	ld	(x),a
2655                     ; 874 		fs->dirbase = ld_dword(buf+(BPB_RootClus-13));	/* Root directory start cluster */
2657  068e 96            	ldw	x,sp
2658  068f 1c0035        	addw	x,#OFST-4
2659  0692 cd000d        	call	L53_ld_dword
2661  0695 1e3a          	ldw	x,(OFST+1,sp)
2662  0697 1c000e        	addw	x,#14
2663  069a cd0000        	call	c_rtol
2665                     ; 878 	fs->database = fs->fatbase + fsize + fs->n_rootdir / 16;	/* Data start sector (lba) */
2667  069d 1e3a          	ldw	x,(OFST+1,sp)
2668  069f ee04          	ldw	x,(4,x)
2669  06a1 54            	srlw	x
2670  06a2 54            	srlw	x
2671  06a3 54            	srlw	x
2672  06a4 54            	srlw	x
2673  06a5 cd0000        	call	c_uitolx
2675  06a8 96            	ldw	x,sp
2676  06a9 1c0009        	addw	x,#OFST-48
2677  06ac cd0000        	call	c_rtol
2680  06af 1e3a          	ldw	x,(OFST+1,sp)
2681  06b1 1c000a        	addw	x,#10
2682  06b4 cd0000        	call	c_ltor
2684  06b7 96            	ldw	x,sp
2685  06b8 1c000d        	addw	x,#OFST-44
2686  06bb cd0000        	call	c_ladd
2688  06be 96            	ldw	x,sp
2689  06bf 1c0009        	addw	x,#OFST-48
2690  06c2 cd0000        	call	c_ladd
2692  06c5 1e3a          	ldw	x,(OFST+1,sp)
2693  06c7 1c0012        	addw	x,#18
2694  06ca cd0000        	call	c_rtol
2696                     ; 880 	fs->flag = 0;
2698  06cd 1e3a          	ldw	x,(OFST+1,sp)
2699                     ; 881 	FatFs = fs;
2701  06cf cf0000        	ldw	L3_FatFs,x
2702  06d2 6f01          	clr	(1,x)
2703                     ; 883 	return FR_OK;
2705  06d4 4f            	clr	a
2707  06d5 cc054b        	jra	L002
2799                     ; 893 FRESULT pf_open (
2799                     ; 894 	const char *path	/* Pointer to the file name */
2799                     ; 895 )
2799                     ; 896 {
2800                     	switch	.text
2801  06d8               _pf_open:
2803  06d8 89            	pushw	x
2804  06d9 523f          	subw	sp,#63
2805       0000003f      OFST:	set	63
2808                     ; 900 	FATFS *fs = FatFs;
2810  06db ce0000        	ldw	x,L3_FatFs
2811  06de 1f3e          	ldw	(OFST-1,sp),x
2813                     ; 903 	if (!fs) return FR_NOT_ENABLED;		/* Check file system */
2815  06e0 2604          	jrne	L3411
2818  06e2 a605          	ld	a,#5
2820  06e4 201a          	jra	L212
2821  06e6               L3411:
2822                     ; 905 	fs->flag = 0;
2824  06e6 6f01          	clr	(1,x)
2825                     ; 906 	dj.fn = sp;
2827  06e8 96            	ldw	x,sp
2828  06e9 5c            	incw	x
2829  06ea 1f0f          	ldw	(OFST-48,sp),x
2831                     ; 907 	res = follow_path(&dj, dir, path);	/* Follow the file path */
2833  06ec 1e40          	ldw	x,(OFST+1,sp)
2834  06ee 89            	pushw	x
2835  06ef 96            	ldw	x,sp
2836  06f0 1c0020        	addw	x,#OFST-31
2837  06f3 89            	pushw	x
2838  06f4 1d0011        	subw	x,#17
2839  06f7 cd0419        	call	L376_follow_path
2841  06fa 5b04          	addw	sp,#4
2842  06fc 6b1d          	ld	(OFST-34,sp),a
2844                     ; 908 	if (res != FR_OK) return res;		/* Follow failed */
2846  06fe 2703          	jreq	L5411
2850  0700               L212:
2852  0700 5b41          	addw	sp,#65
2853  0702 81            	ret	
2854  0703               L5411:
2855                     ; 909 	if (!dir[0] || (dir[DIR_Attr] & AM_DIR)) return FR_NO_FILE;	/* It is a directory */
2857  0703 7b1e          	ld	a,(OFST-33,sp)
2858  0705 2706          	jreq	L1511
2860  0707 7b29          	ld	a,(OFST-22,sp)
2861  0709 a510          	bcp	a,#16
2862  070b 2704          	jreq	L7411
2863  070d               L1511:
2866  070d a603          	ld	a,#3
2868  070f 20ef          	jra	L212
2869  0711               L7411:
2870                     ; 911 	fs->org_clust = get_clust(dir);		/* File start cluster */
2872  0711 96            	ldw	x,sp
2873  0712 1c001e        	addw	x,#OFST-33
2874  0715 cd01b1        	call	L123_get_clust
2876  0718 1e3e          	ldw	x,(OFST-1,sp)
2877  071a 1c001e        	addw	x,#30
2878  071d cd0000        	call	c_rtol
2880                     ; 912 	fs->fsize = ld_dword(dir+DIR_FileSize);	/* File size */
2882  0720 96            	ldw	x,sp
2883  0721 1c003a        	addw	x,#OFST-5
2884  0724 cd000d        	call	L53_ld_dword
2886  0727 1e3e          	ldw	x,(OFST-1,sp)
2887  0729 1c001a        	addw	x,#26
2888  072c cd0000        	call	c_rtol
2890                     ; 913 	fs->fptr = 0;						/* File pointer */
2892  072f 1e3e          	ldw	x,(OFST-1,sp)
2893  0731 4f            	clr	a
2894  0732 e719          	ld	(25,x),a
2895  0734 e718          	ld	(24,x),a
2896  0736 e717          	ld	(23,x),a
2897  0738 e716          	ld	(22,x),a
2898                     ; 914 	fs->flag = FA_OPENED;
2900  073a 4c            	inc	a
2901  073b e701          	ld	(1,x),a
2902                     ; 916 	return FR_OK;
2904  073d 4f            	clr	a
2906  073e 20c0          	jra	L212
3064                     ; 927 FRESULT pf_read (
3064                     ; 928 	void* buff,		/* Pointer to the read buffer (NULL:Forward data to the stream)*/
3064                     ; 929 	UINT btr,		/* Number of bytes to read */
3064                     ; 930 	UINT* br		/* Pointer to number of bytes read */
3064                     ; 931 )
3064                     ; 932 {
3065                     	switch	.text
3066  0740               _pf_read:
3068  0740 89            	pushw	x
3069  0741 520f          	subw	sp,#15
3070       0000000f      OFST:	set	15
3073                     ; 937 	BYTE cs, *rbuff = buff;
3075  0743 1f05          	ldw	(OFST-10,sp),x
3077                     ; 938 	FATFS *fs = FatFs;
3079  0745 ce0000        	ldw	x,L3_FatFs
3080  0748 1f0e          	ldw	(OFST-1,sp),x
3082                     ; 941 	*br = 0;
3084  074a 1e16          	ldw	x,(OFST+7,sp)
3085  074c 905f          	clrw	y
3086  074e ff            	ldw	(x),y
3087                     ; 942 	if (!fs) return FR_NOT_ENABLED;		/* Check file system */
3089  074f 1e0e          	ldw	x,(OFST-1,sp)
3090  0751 2604          	jrne	L3421
3093  0753 a605          	ld	a,#5
3095  0755 2008          	jra	L422
3096  0757               L3421:
3097                     ; 943 	if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
3099  0757 e601          	ld	a,(1,x)
3100  0759 a501          	bcp	a,#1
3101  075b 2605          	jrne	L5421
3104  075d a604          	ld	a,#4
3106  075f               L422:
3108  075f 5b11          	addw	sp,#17
3109  0761 81            	ret	
3110  0762               L5421:
3111                     ; 945 	remain = fs->fsize - fs->fptr;
3113  0762 1c001a        	addw	x,#26
3114  0765 cd0000        	call	c_ltor
3116  0768 1e0e          	ldw	x,(OFST-1,sp)
3117  076a 1c0016        	addw	x,#22
3118  076d cd0000        	call	c_lsub
3120  0770 96            	ldw	x,sp
3121  0771 1c0008        	addw	x,#OFST-7
3122  0774 cd0000        	call	c_rtol
3125                     ; 946 	if (btr > remain) btr = (UINT)remain;			/* Truncate btr by remaining bytes */
3127  0777 1e14          	ldw	x,(OFST+5,sp)
3128  0779 cd0000        	call	c_uitolx
3130  077c 96            	ldw	x,sp
3131  077d 1c0008        	addw	x,#OFST-7
3132  0780 cd0000        	call	c_lcmp
3134  0783 2203cc08d0    	jrule	L3521
3137  0788 1e0a          	ldw	x,(OFST-5,sp)
3138  078a 1f14          	ldw	(OFST+5,sp),x
3139  078c cc08d0        	jra	L3521
3140  078f               L1521:
3141                     ; 949 		if ((fs->fptr % 512) == 0) {				/* On the sector boundary? */
3143  078f 1e0e          	ldw	x,(OFST-1,sp)
3144  0791 1c0016        	addw	x,#22
3145  0794 cd0000        	call	c_ltor
3147  0797 b602          	ld	a,c_lreg+2
3148  0799 a401          	and	a,#1
3149  079b b702          	ld	c_lreg+2,a
3150  079d 3f01          	clr	c_lreg+1
3151  079f 3f00          	clr	c_lreg
3152  07a1 cd0000        	call	c_lrzmp
3154  07a4 2703cc0868    	jrne	L7521
3155                     ; 950 			cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
3157  07a9 1e0e          	ldw	x,(OFST-1,sp)
3158  07ab e602          	ld	a,(2,x)
3159  07ad 4a            	dec	a
3160  07ae b703          	ld	c_lreg+3,a
3161  07b0 3f02          	clr	c_lreg+2
3162  07b2 3f01          	clr	c_lreg+1
3163  07b4 3f00          	clr	c_lreg
3164  07b6 96            	ldw	x,sp
3165  07b7 5c            	incw	x
3166  07b8 cd0000        	call	c_rtol
3169  07bb 1e0e          	ldw	x,(OFST-1,sp)
3170  07bd 1c0016        	addw	x,#22
3171  07c0 cd0000        	call	c_ltor
3173  07c3 a609          	ld	a,#9
3174  07c5 cd0000        	call	c_lursh
3176  07c8 96            	ldw	x,sp
3177  07c9 5c            	incw	x
3178  07ca cd0000        	call	c_land
3180  07cd b603          	ld	a,c_lreg+3
3181  07cf 6b07          	ld	(OFST-8,sp),a
3183                     ; 951 			if (!cs) {								/* On the cluster boundary? */
3185  07d1 2658          	jrne	L1621
3186                     ; 952 				if (fs->fptr == 0) {				/* On the top of the file? */
3188  07d3 1e0e          	ldw	x,(OFST-1,sp)
3189  07d5 1c0016        	addw	x,#22
3190  07d8 cd0000        	call	c_lzmp
3192  07db 260f          	jrne	L3621
3193                     ; 953 					clst = fs->org_clust;
3195  07dd 1e0e          	ldw	x,(OFST-1,sp)
3196  07df 9093          	ldw	y,x
3197  07e1 ee20          	ldw	x,(32,x)
3198  07e3 1f0a          	ldw	(OFST-5,sp),x
3199  07e5 93            	ldw	x,y
3200  07e6 ee1e          	ldw	x,(30,x)
3201  07e8 1f08          	ldw	(OFST-7,sp),x
3204  07ea 2017          	jra	L5621
3205  07ec               L3621:
3206                     ; 955 					clst = get_fat(fs->curr_clust);
3208  07ec 1e0e          	ldw	x,(OFST-1,sp)
3209  07ee 9093          	ldw	y,x
3210  07f0 ee24          	ldw	x,(36,x)
3211  07f2 89            	pushw	x
3212  07f3 93            	ldw	x,y
3213  07f4 ee22          	ldw	x,(34,x)
3214  07f6 89            	pushw	x
3215  07f7 cd00e3        	call	L761_get_fat
3217  07fa 5b04          	addw	sp,#4
3218  07fc 96            	ldw	x,sp
3219  07fd 1c0008        	addw	x,#OFST-7
3220  0800 cd0000        	call	c_rtol
3223  0803               L5621:
3224                     ; 957 				if (clst <= 1) ABORT(FR_DISK_ERR);
3226  0803 96            	ldw	x,sp
3227  0804 1c0008        	addw	x,#OFST-7
3228  0807 cd0000        	call	c_ltor
3230  080a ae0000        	ldw	x,#L02
3231  080d cd0000        	call	c_lcmp
3233  0810 1e0e          	ldw	x,(OFST-1,sp)
3234  0812 2407          	jruge	L7621
3237  0814 6f01          	clr	(1,x)
3240  0816 a601          	ld	a,#1
3242  0818 cc075f        	jra	L422
3243  081b               L7621:
3244                     ; 958 				fs->curr_clust = clst;				/* Update current cluster */
3247  081b 7b0b          	ld	a,(OFST-4,sp)
3248  081d e725          	ld	(37,x),a
3249  081f 7b0a          	ld	a,(OFST-5,sp)
3250  0821 e724          	ld	(36,x),a
3251  0823 7b09          	ld	a,(OFST-6,sp)
3252  0825 e723          	ld	(35,x),a
3253  0827 7b08          	ld	a,(OFST-7,sp)
3254  0829 e722          	ld	(34,x),a
3255  082b               L1621:
3256                     ; 960 			sect = clust2sect(fs->curr_clust);		/* Get current sector */
3258  082b 1e0e          	ldw	x,(OFST-1,sp)
3259  082d 9093          	ldw	y,x
3260  082f ee24          	ldw	x,(36,x)
3261  0831 89            	pushw	x
3262  0832 93            	ldw	x,y
3263  0833 ee22          	ldw	x,(34,x)
3264  0835 89            	pushw	x
3265  0836 cd015c        	call	L372_clust2sect
3267  0839 5b04          	addw	sp,#4
3268  083b 96            	ldw	x,sp
3269  083c 1c0008        	addw	x,#OFST-7
3270  083f cd0000        	call	c_rtol
3273                     ; 961 			if (!sect) ABORT(FR_DISK_ERR);
3275  0842 96            	ldw	x,sp
3276  0843 1c0008        	addw	x,#OFST-7
3277  0846 cd0000        	call	c_lzmp
3279  0849 2609          	jrne	L1721
3282  084b 1e0e          	ldw	x,(OFST-1,sp)
3285  084d a601          	ld	a,#1
3286  084f 6f01          	clr	(1,x)
3288  0851 cc075f        	jra	L422
3289  0854               L1721:
3290                     ; 962 			fs->dsect = sect + cs;
3293  0854 96            	ldw	x,sp
3294  0855 1c0008        	addw	x,#OFST-7
3295  0858 cd0000        	call	c_ltor
3297  085b 7b07          	ld	a,(OFST-8,sp)
3298  085d cd0000        	call	c_ladc
3300  0860 1e0e          	ldw	x,(OFST-1,sp)
3301  0862 1c0026        	addw	x,#38
3302  0865 cd0000        	call	c_rtol
3304  0868               L7521:
3305                     ; 964 		rcnt = 512 - (UINT)fs->fptr % 512;			/* Get partial sector data from sector buffer */
3307  0868 1e0e          	ldw	x,(OFST-1,sp)
3308  086a ee18          	ldw	x,(24,x)
3309  086c 02            	rlwa	x,a
3310  086d a401          	and	a,#1
3311  086f 01            	rrwa	x,a
3312  0870 1f03          	ldw	(OFST-12,sp),x
3314  0872 ae0200        	ldw	x,#512
3315  0875 72f003        	subw	x,(OFST-12,sp)
3317                     ; 965 		if (rcnt > btr) rcnt = btr;
3319  0878 1314          	cpw	x,(OFST+5,sp)
3320  087a 2302          	jrule	L3721
3323  087c 1e14          	ldw	x,(OFST+5,sp)
3325  087e               L3721:
3326  087e 1f0c          	ldw	(OFST-3,sp),x
3327                     ; 966 		dr = disk_readp(rbuff, fs->dsect, (UINT)fs->fptr % 512, rcnt);
3329  0880 89            	pushw	x
3330  0881 1e10          	ldw	x,(OFST+1,sp)
3331  0883 ee18          	ldw	x,(24,x)
3332  0885 02            	rlwa	x,a
3333  0886 a401          	and	a,#1
3334  0888 01            	rrwa	x,a
3335  0889 89            	pushw	x
3336  088a 1e12          	ldw	x,(OFST+3,sp)
3337  088c 9093          	ldw	y,x
3338  088e ee28          	ldw	x,(40,x)
3339  0890 89            	pushw	x
3340  0891 93            	ldw	x,y
3341  0892 ee26          	ldw	x,(38,x)
3342  0894 89            	pushw	x
3343  0895 1e0d          	ldw	x,(OFST-2,sp)
3344  0897 cd0000        	call	_disk_readp
3346  089a 5b08          	addw	sp,#8
3347  089c 6b07          	ld	(OFST-8,sp),a
3349                     ; 967 		if (dr) ABORT(FR_DISK_ERR);
3351  089e 2709          	jreq	L5721
3354  08a0 1e0e          	ldw	x,(OFST-1,sp)
3357  08a2 a601          	ld	a,#1
3358  08a4 6f01          	clr	(1,x)
3360  08a6 cc075f        	jra	L422
3361  08a9               L5721:
3362                     ; 968 		fs->fptr += rcnt;							/* Advances file read pointer */
3365  08a9 1e0e          	ldw	x,(OFST-1,sp)
3366  08ab 160c          	ldw	y,(OFST-3,sp)
3367  08ad cd0000        	call	c_uitoly
3369  08b0 1c0016        	addw	x,#22
3370  08b3 cd0000        	call	c_lgadd
3372                     ; 969 		btr -= rcnt; *br += rcnt;					/* Update read counter */
3374  08b6 1e14          	ldw	x,(OFST+5,sp)
3375  08b8 72f00c        	subw	x,(OFST-3,sp)
3376  08bb 1f14          	ldw	(OFST+5,sp),x
3379  08bd 1e16          	ldw	x,(OFST+7,sp)
3380  08bf 9093          	ldw	y,x
3381  08c1 fe            	ldw	x,(x)
3382  08c2 72fb0c        	addw	x,(OFST-3,sp)
3383  08c5 90ff          	ldw	(y),x
3384                     ; 970 		if (rbuff) rbuff += rcnt;					/* Advances the data pointer if destination is memory */
3386  08c7 1e05          	ldw	x,(OFST-10,sp)
3387  08c9 2705          	jreq	L3521
3390  08cb 72fb0c        	addw	x,(OFST-3,sp)
3391  08ce 1f05          	ldw	(OFST-10,sp),x
3393  08d0               L3521:
3394                     ; 948 	while (btr)	{									/* Repeat until all data transferred */
3396  08d0 1e14          	ldw	x,(OFST+5,sp)
3397  08d2 2703cc078f    	jrne	L1521
3398                     ; 973 	return FR_OK;
3400  08d7 4f            	clr	a
3402  08d8 cc075f        	jra	L422
3516                     ; 984 FRESULT pf_write (
3516                     ; 985 	const void* buff,	/* Pointer to the data to be written */
3516                     ; 986 	UINT btw,			/* Number of bytes to write (0:Finalize the current write operation) */
3516                     ; 987 	UINT* bw			/* Pointer to number of bytes written */
3516                     ; 988 )
3516                     ; 989 {
3517                     	switch	.text
3518  08db               _pf_write:
3520  08db 89            	pushw	x
3521  08dc 520f          	subw	sp,#15
3522       0000000f      OFST:	set	15
3525                     ; 992 	const BYTE *p = buff;
3527  08de 1f05          	ldw	(OFST-10,sp),x
3529                     ; 995 	FATFS *fs = FatFs;
3531  08e0 ce0000        	ldw	x,L3_FatFs
3532  08e3 1f0e          	ldw	(OFST-1,sp),x
3534                     ; 998 	*bw = 0;
3536  08e5 1e16          	ldw	x,(OFST+7,sp)
3537  08e7 905f          	clrw	y
3538  08e9 ff            	ldw	(x),y
3539                     ; 999 	if (!fs) return FR_NOT_ENABLED;		/* Check file system */
3541  08ea 1e0e          	ldw	x,(OFST-1,sp)
3542  08ec 2604          	jrne	L1531
3545  08ee a605          	ld	a,#5
3547  08f0 2008          	jra	L442
3548  08f2               L1531:
3549                     ; 1000 	if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
3551  08f2 e601          	ld	a,(1,x)
3552  08f4 a501          	bcp	a,#1
3553  08f6 2605          	jrne	L3531
3556  08f8 a604          	ld	a,#4
3558  08fa               L442:
3560  08fa 5b11          	addw	sp,#17
3561  08fc 81            	ret	
3562  08fd               L3531:
3563                     ; 1002 	if (!btw) {		/* Finalize request */
3565  08fd 1e14          	ldw	x,(OFST+5,sp)
3566  08ff 2621          	jrne	L5531
3567                     ; 1003 		if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
3569  0901 1e0e          	ldw	x,(OFST-1,sp)
3570  0903 e601          	ld	a,(1,x)
3571  0905 a540          	bcp	a,#64
3572  0907 2712          	jreq	L7531
3574  0909 5f            	clrw	x
3575  090a 89            	pushw	x
3576  090b 89            	pushw	x
3577  090c cd0000        	call	_disk_writep
3579  090f 5b04          	addw	sp,#4
3580  0911 4d            	tnz	a
3584  0912 2703cc0aa4    	jrne	LC008
3585  0917 1e0e          	ldw	x,(OFST-1,sp)
3586  0919 e601          	ld	a,(1,x)
3587  091b               L7531:
3588                     ; 1004 		fs->flag &= ~FA__WIP;
3591  091b a4bf          	and	a,#191
3592  091d e701          	ld	(1,x),a
3593                     ; 1005 		return FR_OK;
3595  091f cc0abc        	jp	LC006
3596  0922               L5531:
3597                     ; 1007 		if (!(fs->flag & FA__WIP)) {	/* Round-down fptr to the sector boundary */
3599  0922 1e0e          	ldw	x,(OFST-1,sp)
3600  0924 e601          	ld	a,(1,x)
3601  0926 a540          	bcp	a,#64
3602  0928 2608          	jrne	L1631
3603                     ; 1008 			fs->fptr &= 0xFFFFFE00;
3605  092a 6f19          	clr	(25,x)
3606  092c e618          	ld	a,(24,x)
3607  092e a4fe          	and	a,#254
3608  0930 e718          	ld	(24,x),a
3609  0932               L1631:
3610                     ; 1011 	remain = fs->fsize - fs->fptr;
3612  0932 1c001a        	addw	x,#26
3613  0935 cd0000        	call	c_ltor
3615  0938 1e0e          	ldw	x,(OFST-1,sp)
3616  093a 1c0016        	addw	x,#22
3617  093d cd0000        	call	c_lsub
3619  0940 96            	ldw	x,sp
3620  0941 1c0008        	addw	x,#OFST-7
3621  0944 cd0000        	call	c_rtol
3624                     ; 1012 	if (btw > remain) btw = (UINT)remain;			/* Truncate btw by remaining bytes */
3626  0947 1e14          	ldw	x,(OFST+5,sp)
3627  0949 cd0000        	call	c_uitolx
3629  094c 96            	ldw	x,sp
3630  094d 1c0008        	addw	x,#OFST-7
3631  0950 cd0000        	call	c_lcmp
3633  0953 2203cc0ab5    	jrule	L1731
3636  0958 1e0a          	ldw	x,(OFST-5,sp)
3637  095a 1f14          	ldw	(OFST+5,sp),x
3638  095c cc0ab5        	jra	L1731
3639  095f               L7631:
3640                     ; 1015 		if ((UINT)fs->fptr % 512 == 0) {			/* On the sector boundary? */
3642  095f 1e0e          	ldw	x,(OFST-1,sp)
3643  0961 ee18          	ldw	x,(24,x)
3644  0963 02            	rlwa	x,a
3645  0964 a401          	and	a,#1
3646  0966 01            	rrwa	x,a
3647  0967 5d            	tnzw	x
3648  0968 2703cc0a3e    	jrne	L5731
3649                     ; 1016 			cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
3651  096d 1e0e          	ldw	x,(OFST-1,sp)
3652  096f e602          	ld	a,(2,x)
3653  0971 4a            	dec	a
3654  0972 b703          	ld	c_lreg+3,a
3655  0974 3f02          	clr	c_lreg+2
3656  0976 3f01          	clr	c_lreg+1
3657  0978 3f00          	clr	c_lreg
3658  097a 96            	ldw	x,sp
3659  097b 5c            	incw	x
3660  097c cd0000        	call	c_rtol
3663  097f 1e0e          	ldw	x,(OFST-1,sp)
3664  0981 1c0016        	addw	x,#22
3665  0984 cd0000        	call	c_ltor
3667  0987 a609          	ld	a,#9
3668  0989 cd0000        	call	c_lursh
3670  098c 96            	ldw	x,sp
3671  098d 5c            	incw	x
3672  098e cd0000        	call	c_land
3674  0991 b603          	ld	a,c_lreg+3
3675  0993 6b07          	ld	(OFST-8,sp),a
3677                     ; 1017 			if (!cs) {								/* On the cluster boundary? */
3679  0995 2654          	jrne	L7731
3680                     ; 1018 				if (fs->fptr == 0) {				/* On the top of the file? */
3682  0997 1e0e          	ldw	x,(OFST-1,sp)
3683  0999 1c0016        	addw	x,#22
3684  099c cd0000        	call	c_lzmp
3686  099f 260f          	jrne	L1041
3687                     ; 1019 					clst = fs->org_clust;
3689  09a1 1e0e          	ldw	x,(OFST-1,sp)
3690  09a3 9093          	ldw	y,x
3691  09a5 ee20          	ldw	x,(32,x)
3692  09a7 1f0a          	ldw	(OFST-5,sp),x
3693  09a9 93            	ldw	x,y
3694  09aa ee1e          	ldw	x,(30,x)
3695  09ac 1f08          	ldw	(OFST-7,sp),x
3698  09ae 2017          	jra	L3041
3699  09b0               L1041:
3700                     ; 1021 					clst = get_fat(fs->curr_clust);
3702  09b0 1e0e          	ldw	x,(OFST-1,sp)
3703  09b2 9093          	ldw	y,x
3704  09b4 ee24          	ldw	x,(36,x)
3705  09b6 89            	pushw	x
3706  09b7 93            	ldw	x,y
3707  09b8 ee22          	ldw	x,(34,x)
3708  09ba 89            	pushw	x
3709  09bb cd00e3        	call	L761_get_fat
3711  09be 5b04          	addw	sp,#4
3712  09c0 96            	ldw	x,sp
3713  09c1 1c0008        	addw	x,#OFST-7
3714  09c4 cd0000        	call	c_rtol
3717  09c7               L3041:
3718                     ; 1023 				if (clst <= 1) ABORT(FR_DISK_ERR);
3720  09c7 96            	ldw	x,sp
3721  09c8 1c0008        	addw	x,#OFST-7
3722  09cb cd0000        	call	c_ltor
3724  09ce ae0000        	ldw	x,#L02
3725  09d1 cd0000        	call	c_lcmp
3727  09d4 1e0e          	ldw	x,(OFST-1,sp)
3731  09d6 2403cc0aa6    	jrult	LC007
3732                     ; 1024 				fs->curr_clust = clst;				/* Update current cluster */
3735  09db 7b0b          	ld	a,(OFST-4,sp)
3736  09dd e725          	ld	(37,x),a
3737  09df 7b0a          	ld	a,(OFST-5,sp)
3738  09e1 e724          	ld	(36,x),a
3739  09e3 7b09          	ld	a,(OFST-6,sp)
3740  09e5 e723          	ld	(35,x),a
3741  09e7 7b08          	ld	a,(OFST-7,sp)
3742  09e9 e722          	ld	(34,x),a
3743  09eb               L7731:
3744                     ; 1026 			sect = clust2sect(fs->curr_clust);		/* Get current sector */
3746  09eb 1e0e          	ldw	x,(OFST-1,sp)
3747  09ed 9093          	ldw	y,x
3748  09ef ee24          	ldw	x,(36,x)
3749  09f1 89            	pushw	x
3750  09f2 93            	ldw	x,y
3751  09f3 ee22          	ldw	x,(34,x)
3752  09f5 89            	pushw	x
3753  09f6 cd015c        	call	L372_clust2sect
3755  09f9 5b04          	addw	sp,#4
3756  09fb 96            	ldw	x,sp
3757  09fc 1c0008        	addw	x,#OFST-7
3758  09ff cd0000        	call	c_rtol
3761                     ; 1027 			if (!sect) ABORT(FR_DISK_ERR);
3763  0a02 96            	ldw	x,sp
3764  0a03 1c0008        	addw	x,#OFST-7
3765  0a06 cd0000        	call	c_lzmp
3770  0a09 2603cc0aa4    	jreq	LC008
3771                     ; 1028 			fs->dsect = sect + cs;
3774  0a0e 96            	ldw	x,sp
3775  0a0f 1c0008        	addw	x,#OFST-7
3776  0a12 cd0000        	call	c_ltor
3778  0a15 7b07          	ld	a,(OFST-8,sp)
3779  0a17 cd0000        	call	c_ladc
3781  0a1a 1e0e          	ldw	x,(OFST-1,sp)
3782  0a1c 1c0026        	addw	x,#38
3783  0a1f cd0000        	call	c_rtol
3785                     ; 1029 			if (disk_writep(0, fs->dsect)) ABORT(FR_DISK_ERR);	/* Initiate a sector write operation */
3787  0a22 1e0e          	ldw	x,(OFST-1,sp)
3788  0a24 9093          	ldw	y,x
3789  0a26 ee28          	ldw	x,(40,x)
3790  0a28 89            	pushw	x
3791  0a29 93            	ldw	x,y
3792  0a2a ee26          	ldw	x,(38,x)
3793  0a2c 89            	pushw	x
3794  0a2d 5f            	clrw	x
3795  0a2e cd0000        	call	_disk_writep
3797  0a31 5b04          	addw	sp,#4
3798  0a33 4d            	tnz	a
3802  0a34 266e          	jrne	LC008
3803                     ; 1030 			fs->flag |= FA__WIP;
3806  0a36 1e0e          	ldw	x,(OFST-1,sp)
3807  0a38 e601          	ld	a,(1,x)
3808  0a3a aa40          	or	a,#64
3809  0a3c e701          	ld	(1,x),a
3810  0a3e               L5731:
3811                     ; 1032 		wcnt = 512 - (UINT)fs->fptr % 512;			/* Number of bytes to write to the sector */
3813  0a3e 1e0e          	ldw	x,(OFST-1,sp)
3814  0a40 ee18          	ldw	x,(24,x)
3815  0a42 02            	rlwa	x,a
3816  0a43 a401          	and	a,#1
3817  0a45 01            	rrwa	x,a
3818  0a46 1f03          	ldw	(OFST-12,sp),x
3820  0a48 ae0200        	ldw	x,#512
3821  0a4b 72f003        	subw	x,(OFST-12,sp)
3823                     ; 1033 		if (wcnt > btw) wcnt = btw;
3825  0a4e 1314          	cpw	x,(OFST+5,sp)
3826  0a50 2302          	jrule	L3141
3829  0a52 1e14          	ldw	x,(OFST+5,sp)
3831  0a54               L3141:
3832  0a54 1f0c          	ldw	(OFST-3,sp),x
3833                     ; 1034 		if (disk_writep(p, wcnt)) ABORT(FR_DISK_ERR);	/* Send data to the sector */
3835  0a56 cd0000        	call	c_uitolx
3837  0a59 be02          	ldw	x,c_lreg+2
3838  0a5b 89            	pushw	x
3839  0a5c be00          	ldw	x,c_lreg
3840  0a5e 89            	pushw	x
3841  0a5f 1e09          	ldw	x,(OFST-6,sp)
3842  0a61 cd0000        	call	_disk_writep
3844  0a64 5b04          	addw	sp,#4
3845  0a66 4d            	tnz	a
3849  0a67 263b          	jrne	LC008
3850                     ; 1035 		fs->fptr += wcnt; p += wcnt;				/* Update pointers and counters */
3853  0a69 1e0e          	ldw	x,(OFST-1,sp)
3854  0a6b 160c          	ldw	y,(OFST-3,sp)
3855  0a6d cd0000        	call	c_uitoly
3857  0a70 1c0016        	addw	x,#22
3858  0a73 cd0000        	call	c_lgadd
3862  0a76 1e05          	ldw	x,(OFST-10,sp)
3863  0a78 72fb0c        	addw	x,(OFST-3,sp)
3864  0a7b 1f05          	ldw	(OFST-10,sp),x
3866                     ; 1036 		btw -= wcnt; *bw += wcnt;
3868  0a7d 1e14          	ldw	x,(OFST+5,sp)
3869  0a7f 72f00c        	subw	x,(OFST-3,sp)
3870  0a82 1f14          	ldw	(OFST+5,sp),x
3873  0a84 1e16          	ldw	x,(OFST+7,sp)
3874  0a86 9093          	ldw	y,x
3875  0a88 fe            	ldw	x,(x)
3876  0a89 72fb0c        	addw	x,(OFST-3,sp)
3877  0a8c 90ff          	ldw	(y),x
3878                     ; 1037 		if ((UINT)fs->fptr % 512 == 0) {
3880  0a8e 1e0e          	ldw	x,(OFST-1,sp)
3881  0a90 ee18          	ldw	x,(24,x)
3882  0a92 02            	rlwa	x,a
3883  0a93 a401          	and	a,#1
3884  0a95 01            	rrwa	x,a
3885  0a96 5d            	tnzw	x
3886  0a97 261c          	jrne	L1731
3887                     ; 1038 			if (disk_writep(0, 0)) ABORT(FR_DISK_ERR);	/* Finalize the currtent secter write operation */
3889  0a99 5f            	clrw	x
3890  0a9a 89            	pushw	x
3891  0a9b 89            	pushw	x
3892  0a9c cd0000        	call	_disk_writep
3894  0a9f 5b04          	addw	sp,#4
3895  0aa1 4d            	tnz	a
3896  0aa2 2709          	jreq	L1241
3899  0aa4               LC008:
3904  0aa4 1e0e          	ldw	x,(OFST-1,sp)
3907  0aa6               LC007:
3909  0aa6 6f01          	clr	(1,x)
3915  0aa8 a601          	ld	a,#1
3917  0aaa cc08fa        	jra	L442
3918  0aad               L1241:
3919                     ; 1039 			fs->flag &= ~FA__WIP;
3922  0aad 1e0e          	ldw	x,(OFST-1,sp)
3923  0aaf e601          	ld	a,(1,x)
3924  0ab1 a4bf          	and	a,#191
3925  0ab3 e701          	ld	(1,x),a
3926  0ab5               L1731:
3927                     ; 1014 	while (btw)	{									/* Repeat until all data transferred */
3929  0ab5 1e14          	ldw	x,(OFST+5,sp)
3930  0ab7 2703cc095f    	jrne	L7631
3931                     ; 1043 	return FR_OK;
3933  0abc               LC006:
3935  0abc 4f            	clr	a
3937  0abd cc08fa        	jra	L442
3964                     	switch	.bss
3965  0000               L3_FatFs:
3966  0000 0000          	ds.b	2
3967                     	xref	_disk_writep
3968                     	xref	_disk_readp
3969                     	xref	_disk_initialize
3970                     	xdef	_pf_write
3971                     	xdef	_pf_read
3972                     	xdef	_pf_open
3973                     	xdef	_pf_mount
3974                     	xref.b	c_lreg
3975                     	xref.b	c_x
3995                     	xref	c_lgadd
3996                     	xref	c_uitoly
3997                     	xref	c_land
3998                     	xref	c_lrzmp
3999                     	xref	c_ladc
4000                     	xref	c_ludv
4001                     	xref	c_lsub
4002                     	xref	c_lgmul
4003                     	xref	c_lgadc
4004                     	xref	c_lzmp
4005                     	xref	c_lgor
4006                     	xref	c_lglsh
4007                     	xref	c_uitolx
4008                     	xref	c_lmul
4009                     	xref	c_lsbc
4010                     	xref	c_lgsbc
4011                     	xref	c_ladd
4012                     	xref	c_lursh
4013                     	xref	c_lcmp
4014                     	xref	c_lor
4015                     	xref	c_rtol
4016                     	xref	c_llsh
4017                     	xref	c_ltor
4018                     	end
