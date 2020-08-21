   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
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
1863  03fb 7b03          	ld	a,(OFST-6,sp)
1864  03fd 97            	ld	xl,a
1865  03fe 7b04          	ld	a,(OFST-5,sp)
1866  0400 1b02          	add	a,(OFST-7,sp)
1867  0402 2401          	jrnc	L601
1868  0404 5c            	incw	x
1869  0405               L601:
1870  0405 160e          	ldw	y,(OFST+5,sp)
1871  0407 02            	rlwa	x,a
1872  0408 90ff          	ldw	(y),x
1873                     ; 689 	sfn[11] = (c <= ' ') ? 1 : 0;		/* Set last segment flag if end of path */
1875  040a 7b09          	ld	a,(OFST+0,sp)
1876  040c a121          	cp	a,#33
1877  040e 2404          	jruge	L011
1878  0410 a601          	ld	a,#1
1879  0412 2001          	jra	L211
1880  0414               L011:
1881  0414 4f            	clr	a
1882  0415               L211:
1883  0415 1e05          	ldw	x,(OFST-4,sp)
1884  0417 e70b          	ld	(11,x),a
1885                     ; 691 	return FR_OK;
1887  0419 4f            	clr	a
1890  041a 5b0b          	addw	sp,#11
1891  041c 81            	ret	
1963                     ; 742 static FRESULT follow_path (	/* FR_OK(0): successful, !=0: error code */
1963                     ; 743 	DIR *dj,			/* Directory object to return last directory and found object */
1963                     ; 744 	BYTE *dir,			/* 32-byte working buffer */
1963                     ; 745 	const char *path	/* Full-path string to find a file or directory */
1963                     ; 746 )
1963                     ; 747 {
1964                     	switch	.text
1965  041d               L376_follow_path:
1967  041d 89            	pushw	x
1968  041e 88            	push	a
1969       00000001      OFST:	set	1
1972  041f 1e08          	ldw	x,(OFST+7,sp)
1973  0421 2001          	jra	L337
1974  0423               L137:
1975                     ; 751 	while (*path == ' ') path++;		/* Strip leading spaces */
1977  0423 5c            	incw	x
1978  0424               L337:
1981  0424 f6            	ld	a,(x)
1982  0425 a120          	cp	a,#32
1983  0427 27fa          	jreq	L137
1984                     ; 752 	if (*path == '/') path++;			/* Strip heading separator if exist */
1986  0429 a12f          	cp	a,#47
1987  042b 2601          	jrne	L737
1990  042d 5c            	incw	x
1991  042e               L737:
1992  042e 1f08          	ldw	(OFST+7,sp),x
1993                     ; 753 	dj->sclust = 0;						/* Set start directory (always root dir) */
1995  0430 1e02          	ldw	x,(OFST+1,sp)
1996  0432 4f            	clr	a
1997  0433 e707          	ld	(7,x),a
1998  0435 e706          	ld	(6,x),a
1999  0437 e705          	ld	(5,x),a
2000  0439 e704          	ld	(4,x),a
2001                     ; 755 	if ((BYTE)*path < ' ') {			/* Null path means the root directory */
2003  043b 1e08          	ldw	x,(OFST+7,sp)
2004  043d f6            	ld	a,(x)
2005  043e a120          	cp	a,#32
2006  0440 240c          	jruge	L547
2007                     ; 756 		res = dir_rewind(dj);
2009  0442 1e02          	ldw	x,(OFST+1,sp)
2010  0444 cd01f0        	call	L153_dir_rewind
2012  0447 6b01          	ld	(OFST+0,sp),a
2014                     ; 757 		dir[0] = 0;
2016  0449 1e06          	ldw	x,(OFST+5,sp)
2017  044b 7f            	clr	(x)
2019  044c 202e          	jra	L347
2020  044e               L547:
2021                     ; 761 			res = create_name(dj, &path);	/* Get a segment */
2023  044e 96            	ldw	x,sp
2024  044f 1c0008        	addw	x,#OFST+7
2025  0452 89            	pushw	x
2026  0453 1e04          	ldw	x,(OFST+3,sp)
2027  0455 cd0398        	call	L306_create_name
2029  0458 85            	popw	x
2030  0459 6b01          	ld	(OFST+0,sp),a
2032                     ; 762 			if (res != FR_OK) break;
2034  045b 261f          	jrne	L347
2037                     ; 763 			res = dir_find(dj, dir);		/* Find it */
2039  045d 1e06          	ldw	x,(OFST+5,sp)
2040  045f 89            	pushw	x
2041  0460 1e04          	ldw	x,(OFST+3,sp)
2042  0462 cd0331        	call	L135_dir_find
2044  0465 85            	popw	x
2045  0466 6b01          	ld	(OFST+0,sp),a
2047                     ; 764 			if (res != FR_OK) break;		/* Could not find the object */
2049  0468 2612          	jrne	L347
2052                     ; 765 			if (dj->fn[11]) break;			/* Last segment match. Function completed. */
2054  046a 1e02          	ldw	x,(OFST+1,sp)
2055  046c ee02          	ldw	x,(2,x)
2056  046e 6d0b          	tnz	(11,x)
2057  0470 260a          	jrne	L347
2060                     ; 766 			if (!(dir[DIR_Attr] & AM_DIR)) { /* Cannot follow path because it is a file */
2062  0472 1e06          	ldw	x,(OFST+5,sp)
2063  0474 e60b          	ld	a,(11,x)
2064  0476 a510          	bcp	a,#16
2065  0478 2605          	jrne	L757
2066                     ; 767 				res = FR_NO_FILE; break;
2068  047a a603          	ld	a,#3
2071  047c               L347:
2072                     ; 773 	return res;
2076  047c 5b03          	addw	sp,#3
2077  047e 81            	ret	
2078  047f               L757:
2079                     ; 769 			dj->sclust = get_clust(dir);	/* Follow next */
2081  047f cd01b1        	call	L123_get_clust
2083  0482 1e02          	ldw	x,(OFST+1,sp)
2084  0484 1c0004        	addw	x,#4
2085  0487 cd0000        	call	c_rtol
2088  048a 20c2          	jra	L547
2132                     ; 783 static BYTE check_fs (	/* 0:The FAT boot record, 1:Valid boot record but not an FAT, 2:Not a boot record, 3:Error */
2132                     ; 784 	BYTE *buf,	/* Working buffer */
2132                     ; 785 	DWORD sect	/* Sector# (lba) to check if it is an FAT boot record or not */
2132                     ; 786 )
2132                     ; 787 {
2133                     	switch	.text
2134  048c               L167_check_fs:
2136  048c 89            	pushw	x
2137       00000000      OFST:	set	0
2140                     ; 788   if (disk_readp(buf, sect, 510, 2)) {	/* Read the boot record */
2142  048d ae0002        	ldw	x,#2
2143  0490 89            	pushw	x
2144  0491 ae01fe        	ldw	x,#510
2145  0494 89            	pushw	x
2146  0495 1e0b          	ldw	x,(OFST+11,sp)
2147  0497 89            	pushw	x
2148  0498 1e0b          	ldw	x,(OFST+11,sp)
2149  049a 89            	pushw	x
2150  049b 1e09          	ldw	x,(OFST+9,sp)
2151  049d cd0000        	call	_disk_readp
2153  04a0 5b08          	addw	sp,#8
2154  04a2 4d            	tnz	a
2155  04a3 2704          	jreq	L3001
2156                     ; 789 		return 3;
2158  04a5 a603          	ld	a,#3
2160  04a7 200c          	jra	L041
2161  04a9               L3001:
2162                     ; 791 	if (ld_word(buf) != 0xAA55) {			/* Check record signature */
2164  04a9 1e01          	ldw	x,(OFST+1,sp)
2165  04ab cd0000        	call	L5_ld_word
2167  04ae a3aa55        	cpw	x,#43605
2168  04b1 2704          	jreq	L5001
2169                     ; 792 		return 2;
2171  04b3 a602          	ld	a,#2
2173  04b5               L041:
2175  04b5 85            	popw	x
2176  04b6 81            	ret	
2177  04b7               L5001:
2178                     ; 798 	if (PF_FS_FAT32 && !disk_readp(buf, sect, BS_FilSysType32, 2) && ld_word(buf) == 0x4146) {	/* Check FAT32 */
2180  04b7 ae0002        	ldw	x,#2
2181  04ba 89            	pushw	x
2182  04bb ae0052        	ldw	x,#82
2183  04be 89            	pushw	x
2184  04bf 1e0b          	ldw	x,(OFST+11,sp)
2185  04c1 89            	pushw	x
2186  04c2 1e0b          	ldw	x,(OFST+11,sp)
2187  04c4 89            	pushw	x
2188  04c5 1e09          	ldw	x,(OFST+9,sp)
2189  04c7 cd0000        	call	_disk_readp
2191  04ca 5b08          	addw	sp,#8
2192  04cc 4d            	tnz	a
2193  04cd 260d          	jrne	L7001
2195  04cf 1e01          	ldw	x,(OFST+1,sp)
2196  04d1 cd0000        	call	L5_ld_word
2198  04d4 a34146        	cpw	x,#16710
2199  04d7 2603          	jrne	L7001
2200                     ; 799 		return 0;
2202  04d9 4f            	clr	a
2204  04da 20d9          	jra	L041
2205  04dc               L7001:
2206                     ; 801 	return 1;
2208  04dc a601          	ld	a,#1
2210  04de 20d5          	jra	L041
2299                     	switch	.const
2300  0008               L671:
2301  0008 0000fff7      	dc.l	65527
2302                     ; 819 FRESULT pf_mount (
2302                     ; 820 	FATFS *fs		/* Pointer to new file system object */
2302                     ; 821 )
2302                     ; 822 {
2303                     	switch	.text
2304  04e0               _pf_mount:
2306  04e0 89            	pushw	x
2307  04e1 5239          	subw	sp,#57
2308       00000039      OFST:	set	57
2311                     ; 827 	FatFs = 0;
2313  04e3 5f            	clrw	x
2314  04e4 cf0000        	ldw	L3_FatFs,x
2315                     ; 829 	if (disk_initialize() & STA_NOINIT) {	/* Check if the drive is ready or not */
2317  04e7 cd0000        	call	_disk_initialize
2319  04ea a501          	bcp	a,#1
2320  04ec 2704          	jreq	L7401
2321                     ; 830 		return FR_NOT_READY;
2323  04ee a602          	ld	a,#2
2325  04f0 205d          	jra	L202
2326  04f2               L7401:
2327                     ; 834 	bsect = 0;
2329  04f2 5f            	clrw	x
2330  04f3 1f14          	ldw	(OFST-37,sp),x
2331  04f5 1f12          	ldw	(OFST-39,sp),x
2333                     ; 835 	fmt = check_fs(buf, bsect);			/* Check sector 0 as an SFD format */
2335  04f7 89            	pushw	x
2336  04f8 89            	pushw	x
2337  04f9 96            	ldw	x,sp
2338  04fa 1c001a        	addw	x,#OFST-31
2339  04fd ad8d          	call	L167_check_fs
2341  04ff 5b04          	addw	sp,#4
2342  0501 6b11          	ld	(OFST-40,sp),a
2344                     ; 836 	if (fmt == 1) {						/* Not an FAT boot record, it may be FDISK format */
2346  0503 4a            	dec	a
2347  0504 2641          	jrne	L1501
2348                     ; 838 		if (disk_readp(buf, bsect, MBR_Table, 16)) {	/* 1st partition entry */
2350  0506 ae0010        	ldw	x,#16
2351  0509 89            	pushw	x
2352  050a ae01be        	ldw	x,#446
2353  050d 89            	pushw	x
2354  050e 1e18          	ldw	x,(OFST-33,sp)
2355  0510 89            	pushw	x
2356  0511 1e18          	ldw	x,(OFST-33,sp)
2357  0513 89            	pushw	x
2358  0514 96            	ldw	x,sp
2359  0515 1c001e        	addw	x,#OFST-27
2360  0518 cd0000        	call	_disk_readp
2362  051b 5b08          	addw	sp,#8
2363  051d 4d            	tnz	a
2364  051e 2704          	jreq	L3501
2365                     ; 839 			fmt = 3;
2367  0520 a603          	ld	a,#3
2369  0522 2021          	jp	LC003
2370  0524               L3501:
2371                     ; 841 			if (buf[4]) {					/* Is the partition existing? */
2373  0524 7b1a          	ld	a,(OFST-31,sp)
2374  0526 271f          	jreq	L1501
2375                     ; 842 				bsect = ld_dword(&buf[8]);	/* Partition offset in LBA */
2377  0528 96            	ldw	x,sp
2378  0529 1c001e        	addw	x,#OFST-27
2379  052c cd000d        	call	L53_ld_dword
2381  052f 96            	ldw	x,sp
2382  0530 1c0012        	addw	x,#OFST-39
2383  0533 cd0000        	call	c_rtol
2386                     ; 843 				fmt = check_fs(buf, bsect);	/* Check the partition */
2388  0536 1e14          	ldw	x,(OFST-37,sp)
2389  0538 89            	pushw	x
2390  0539 1e14          	ldw	x,(OFST-37,sp)
2391  053b 89            	pushw	x
2392  053c 96            	ldw	x,sp
2393  053d 1c001a        	addw	x,#OFST-31
2394  0540 cd048c        	call	L167_check_fs
2396  0543 5b04          	addw	sp,#4
2397  0545               LC003:
2398  0545 6b11          	ld	(OFST-40,sp),a
2400  0547               L1501:
2401                     ; 847 	if (fmt == 3) return FR_DISK_ERR;
2403  0547 7b11          	ld	a,(OFST-40,sp)
2404  0549 a103          	cp	a,#3
2405  054b 2605          	jrne	L1601
2408  054d               LC004:
2410  054d a601          	ld	a,#1
2412  054f               L202:
2414  054f 5b3b          	addw	sp,#59
2415  0551 81            	ret	
2416  0552               L1601:
2417                     ; 848 	if (fmt) return FR_NO_FILESYSTEM;	/* No valid FAT patition is found */
2419  0552 7b11          	ld	a,(OFST-40,sp)
2422  0554 2703cc068b    	jrne	LC005
2423                     ; 851 	if (disk_readp(buf, bsect, 13, sizeof (buf))) return FR_DISK_ERR;
2425  0559 ae0024        	ldw	x,#36
2426  055c 89            	pushw	x
2427  055d ae000d        	ldw	x,#13
2428  0560 89            	pushw	x
2429  0561 1e18          	ldw	x,(OFST-33,sp)
2430  0563 89            	pushw	x
2431  0564 1e18          	ldw	x,(OFST-33,sp)
2432  0566 89            	pushw	x
2433  0567 96            	ldw	x,sp
2434  0568 1c001e        	addw	x,#OFST-27
2435  056b cd0000        	call	_disk_readp
2437  056e 5b08          	addw	sp,#8
2438  0570 4d            	tnz	a
2441  0571 26da          	jrne	LC004
2442                     ; 853 	fsize = ld_word(buf+BPB_FATSz16-13);				/* Number of sectors per FAT */
2444  0573 96            	ldw	x,sp
2445  0574 1c001f        	addw	x,#OFST-26
2446  0577 cd0000        	call	L5_ld_word
2448  057a cd0000        	call	c_uitolx
2450  057d 96            	ldw	x,sp
2451  057e 1c000d        	addw	x,#OFST-44
2452  0581 cd0000        	call	c_rtol
2455                     ; 854 	if (!fsize) fsize = ld_dword(buf+BPB_FATSz32-13);
2457  0584 96            	ldw	x,sp
2458  0585 1c000d        	addw	x,#OFST-44
2459  0588 cd0000        	call	c_lzmp
2461  058b 260e          	jrne	L7601
2464  058d 96            	ldw	x,sp
2465  058e 1c002d        	addw	x,#OFST-12
2466  0591 cd000d        	call	L53_ld_dword
2468  0594 96            	ldw	x,sp
2469  0595 1c000d        	addw	x,#OFST-44
2470  0598 cd0000        	call	c_rtol
2473  059b               L7601:
2474                     ; 856 	fsize *= buf[BPB_NumFATs-13];						/* Number of sectors in FAT area */
2476  059b 7b19          	ld	a,(OFST-32,sp)
2477  059d b703          	ld	c_lreg+3,a
2478  059f 3f02          	clr	c_lreg+2
2479  05a1 3f01          	clr	c_lreg+1
2480  05a3 3f00          	clr	c_lreg
2481  05a5 96            	ldw	x,sp
2482  05a6 1c000d        	addw	x,#OFST-44
2483  05a9 cd0000        	call	c_lgmul
2486                     ; 857 	fs->fatbase = bsect + ld_word(buf+BPB_RsvdSecCnt-13); /* FAT start sector (lba) */
2488  05ac 96            	ldw	x,sp
2489  05ad 1c0017        	addw	x,#OFST-34
2490  05b0 cd0000        	call	L5_ld_word
2492  05b3 cd0000        	call	c_uitolx
2494  05b6 96            	ldw	x,sp
2495  05b7 1c0012        	addw	x,#OFST-39
2496  05ba cd0000        	call	c_ladd
2498  05bd 1e3a          	ldw	x,(OFST+1,sp)
2499  05bf 1c000a        	addw	x,#10
2500  05c2 cd0000        	call	c_rtol
2502                     ; 858 	fs->csize = buf[BPB_SecPerClus-13];					/* Number of sectors per cluster */
2504  05c5 1e3a          	ldw	x,(OFST+1,sp)
2505  05c7 7b16          	ld	a,(OFST-35,sp)
2506  05c9 e702          	ld	(2,x),a
2507                     ; 859 	fs->n_rootdir = ld_word(buf+BPB_RootEntCnt-13);		/* Nmuber of root directory entries */
2509  05cb 96            	ldw	x,sp
2510  05cc 1c001a        	addw	x,#OFST-31
2511  05cf cd0000        	call	L5_ld_word
2513  05d2 163a          	ldw	y,(OFST+1,sp)
2514  05d4 90ef04        	ldw	(4,y),x
2515                     ; 860 	tsect = ld_word(buf+BPB_TotSec16-13);				/* Number of sectors on the file system */
2517  05d7 96            	ldw	x,sp
2518  05d8 1c001c        	addw	x,#OFST-29
2519  05db cd0000        	call	L5_ld_word
2521  05de cd0000        	call	c_uitolx
2523  05e1 96            	ldw	x,sp
2524  05e2 1c0012        	addw	x,#OFST-39
2525  05e5 cd0000        	call	c_rtol
2528                     ; 861 	if (!tsect) tsect = ld_dword(buf+BPB_TotSec32-13);
2530  05e8 96            	ldw	x,sp
2531  05e9 1c0012        	addw	x,#OFST-39
2532  05ec cd0000        	call	c_lzmp
2534  05ef 260e          	jrne	L1701
2537  05f1 96            	ldw	x,sp
2538  05f2 1c0029        	addw	x,#OFST-16
2539  05f5 cd000d        	call	L53_ld_dword
2541  05f8 96            	ldw	x,sp
2542  05f9 1c0012        	addw	x,#OFST-39
2543  05fc cd0000        	call	c_rtol
2546  05ff               L1701:
2547                     ; 862 	mclst = (tsect						/* Last cluster# + 1 */
2547                     ; 863 		- ld_word(buf+BPB_RsvdSecCnt-13) - fsize - fs->n_rootdir / 16
2547                     ; 864 		) / fs->csize + 2;
2549  05ff 1e3a          	ldw	x,(OFST+1,sp)
2550  0601 e602          	ld	a,(2,x)
2551  0603 b703          	ld	c_lreg+3,a
2552  0605 3f02          	clr	c_lreg+2
2553  0607 3f01          	clr	c_lreg+1
2554  0609 3f00          	clr	c_lreg
2555  060b 96            	ldw	x,sp
2556  060c 1c0009        	addw	x,#OFST-48
2557  060f cd0000        	call	c_rtol
2560  0612 1e3a          	ldw	x,(OFST+1,sp)
2561  0614 ee04          	ldw	x,(4,x)
2562  0616 54            	srlw	x
2563  0617 54            	srlw	x
2564  0618 54            	srlw	x
2565  0619 54            	srlw	x
2566  061a cd0000        	call	c_uitolx
2568  061d 96            	ldw	x,sp
2569  061e 1c0005        	addw	x,#OFST-52
2570  0621 cd0000        	call	c_rtol
2573  0624 96            	ldw	x,sp
2574  0625 1c0017        	addw	x,#OFST-34
2575  0628 cd0000        	call	L5_ld_word
2577  062b cd0000        	call	c_uitolx
2579  062e 96            	ldw	x,sp
2580  062f 5c            	incw	x
2581  0630 cd0000        	call	c_rtol
2584  0633 96            	ldw	x,sp
2585  0634 1c0012        	addw	x,#OFST-39
2586  0637 cd0000        	call	c_ltor
2588  063a 96            	ldw	x,sp
2589  063b 5c            	incw	x
2590  063c cd0000        	call	c_lsub
2592  063f 96            	ldw	x,sp
2593  0640 1c000d        	addw	x,#OFST-44
2594  0643 cd0000        	call	c_lsub
2596  0646 96            	ldw	x,sp
2597  0647 1c0005        	addw	x,#OFST-52
2598  064a cd0000        	call	c_lsub
2600  064d 96            	ldw	x,sp
2601  064e 1c0009        	addw	x,#OFST-48
2602  0651 cd0000        	call	c_ludv
2604  0654 a602          	ld	a,#2
2605  0656 cd0000        	call	c_ladc
2607  0659 96            	ldw	x,sp
2608  065a 1c0012        	addw	x,#OFST-39
2609  065d cd0000        	call	c_rtol
2612                     ; 865 	fs->n_fatent = (CLUST)mclst;
2614  0660 1e3a          	ldw	x,(OFST+1,sp)
2615  0662 7b15          	ld	a,(OFST-36,sp)
2616  0664 e709          	ld	(9,x),a
2617  0666 7b14          	ld	a,(OFST-37,sp)
2618  0668 e708          	ld	(8,x),a
2619  066a 7b13          	ld	a,(OFST-38,sp)
2620  066c e707          	ld	(7,x),a
2621  066e 7b12          	ld	a,(OFST-39,sp)
2622  0670 e706          	ld	(6,x),a
2623                     ; 867 	fmt = 0;							/* Determine the FAT sub type */
2625  0672 0f11          	clr	(OFST-40,sp)
2627                     ; 870 	if (PF_FS_FAT32 && mclst >= 0xFFF7) fmt = FS_FAT32;
2629  0674 96            	ldw	x,sp
2630  0675 1c0012        	addw	x,#OFST-39
2631  0678 cd0000        	call	c_ltor
2633  067b ae0008        	ldw	x,#L671
2634  067e cd0000        	call	c_lcmp
2636  0681 2504          	jrult	L3701
2639  0683 a603          	ld	a,#3
2640  0685 6b11          	ld	(OFST-40,sp),a
2642  0687               L3701:
2643                     ; 871 	if (!fmt) return FR_NO_FILESYSTEM;
2645  0687 7b11          	ld	a,(OFST-40,sp)
2646  0689 2605          	jrne	L5701
2649  068b               LC005:
2651  068b a606          	ld	a,#6
2653  068d cc054f        	jra	L202
2654  0690               L5701:
2655                     ; 872 	fs->fs_type = fmt;
2657  0690 1e3a          	ldw	x,(OFST+1,sp)
2658  0692 f7            	ld	(x),a
2659                     ; 875 		fs->dirbase = ld_dword(buf+(BPB_RootClus-13));	/* Root directory start cluster */
2661  0693 96            	ldw	x,sp
2662  0694 1c0035        	addw	x,#OFST-4
2663  0697 cd000d        	call	L53_ld_dword
2665  069a 1e3a          	ldw	x,(OFST+1,sp)
2666  069c 1c000e        	addw	x,#14
2667  069f cd0000        	call	c_rtol
2669                     ; 879 	fs->database = fs->fatbase + fsize + fs->n_rootdir / 16;	/* Data start sector (lba) */
2671  06a2 1e3a          	ldw	x,(OFST+1,sp)
2672  06a4 ee04          	ldw	x,(4,x)
2673  06a6 54            	srlw	x
2674  06a7 54            	srlw	x
2675  06a8 54            	srlw	x
2676  06a9 54            	srlw	x
2677  06aa cd0000        	call	c_uitolx
2679  06ad 96            	ldw	x,sp
2680  06ae 1c0009        	addw	x,#OFST-48
2681  06b1 cd0000        	call	c_rtol
2684  06b4 1e3a          	ldw	x,(OFST+1,sp)
2685  06b6 1c000a        	addw	x,#10
2686  06b9 cd0000        	call	c_ltor
2688  06bc 96            	ldw	x,sp
2689  06bd 1c000d        	addw	x,#OFST-44
2690  06c0 cd0000        	call	c_ladd
2692  06c3 96            	ldw	x,sp
2693  06c4 1c0009        	addw	x,#OFST-48
2694  06c7 cd0000        	call	c_ladd
2696  06ca 1e3a          	ldw	x,(OFST+1,sp)
2697  06cc 1c0012        	addw	x,#18
2698  06cf cd0000        	call	c_rtol
2700                     ; 881 	fs->flag = 0;
2702  06d2 1e3a          	ldw	x,(OFST+1,sp)
2703                     ; 882 	FatFs = fs;
2705  06d4 cf0000        	ldw	L3_FatFs,x
2706  06d7 6f01          	clr	(1,x)
2707                     ; 884 	return FR_OK;
2709  06d9 4f            	clr	a
2711  06da cc054f        	jra	L202
2803                     ; 894 FRESULT pf_open (
2803                     ; 895 	const char *path	/* Pointer to the file name */
2803                     ; 896 )
2803                     ; 897 {
2804                     	switch	.text
2805  06dd               _pf_open:
2807  06dd 89            	pushw	x
2808  06de 523f          	subw	sp,#63
2809       0000003f      OFST:	set	63
2812                     ; 901 	FATFS *fs = FatFs;
2814  06e0 ce0000        	ldw	x,L3_FatFs
2815  06e3 1f3e          	ldw	(OFST-1,sp),x
2817                     ; 904 	if (!fs) return FR_NOT_ENABLED;		/* Check file system */
2819  06e5 2604          	jrne	L3411
2822  06e7 a605          	ld	a,#5
2824  06e9 201a          	jra	L412
2825  06eb               L3411:
2826                     ; 906 	fs->flag = 0;
2828  06eb 6f01          	clr	(1,x)
2829                     ; 907 	dj.fn = sp;
2831  06ed 96            	ldw	x,sp
2832  06ee 5c            	incw	x
2833  06ef 1f0f          	ldw	(OFST-48,sp),x
2835                     ; 908 	res = follow_path(&dj, dir, path);	/* Follow the file path */
2837  06f1 1e40          	ldw	x,(OFST+1,sp)
2838  06f3 89            	pushw	x
2839  06f4 96            	ldw	x,sp
2840  06f5 1c0020        	addw	x,#OFST-31
2841  06f8 89            	pushw	x
2842  06f9 1d0011        	subw	x,#17
2843  06fc cd041d        	call	L376_follow_path
2845  06ff 5b04          	addw	sp,#4
2846  0701 6b1d          	ld	(OFST-34,sp),a
2848                     ; 909 	if (res != FR_OK) return res;		/* Follow failed */
2850  0703 2703          	jreq	L5411
2854  0705               L412:
2856  0705 5b41          	addw	sp,#65
2857  0707 81            	ret	
2858  0708               L5411:
2859                     ; 910 	if (!dir[0] || (dir[DIR_Attr] & AM_DIR)) return FR_NO_FILE;	/* It is a directory */
2861  0708 7b1e          	ld	a,(OFST-33,sp)
2862  070a 2706          	jreq	L1511
2864  070c 7b29          	ld	a,(OFST-22,sp)
2865  070e a510          	bcp	a,#16
2866  0710 2704          	jreq	L7411
2867  0712               L1511:
2870  0712 a603          	ld	a,#3
2872  0714 20ef          	jra	L412
2873  0716               L7411:
2874                     ; 912 	fs->org_clust = get_clust(dir);		/* File start cluster */
2876  0716 96            	ldw	x,sp
2877  0717 1c001e        	addw	x,#OFST-33
2878  071a cd01b1        	call	L123_get_clust
2880  071d 1e3e          	ldw	x,(OFST-1,sp)
2881  071f 1c001e        	addw	x,#30
2882  0722 cd0000        	call	c_rtol
2884                     ; 913 	fs->fsize = ld_dword(dir+DIR_FileSize);	/* File size */
2886  0725 96            	ldw	x,sp
2887  0726 1c003a        	addw	x,#OFST-5
2888  0729 cd000d        	call	L53_ld_dword
2890  072c 1e3e          	ldw	x,(OFST-1,sp)
2891  072e 1c001a        	addw	x,#26
2892  0731 cd0000        	call	c_rtol
2894                     ; 914 	fs->fptr = 0;						/* File pointer */
2896  0734 1e3e          	ldw	x,(OFST-1,sp)
2897  0736 4f            	clr	a
2898  0737 e719          	ld	(25,x),a
2899  0739 e718          	ld	(24,x),a
2900  073b e717          	ld	(23,x),a
2901  073d e716          	ld	(22,x),a
2902                     ; 915 	fs->flag = FA_OPENED;
2904  073f 4c            	inc	a
2905  0740 e701          	ld	(1,x),a
2906                     ; 917 	return FR_OK;
2908  0742 4f            	clr	a
2910  0743 20c0          	jra	L412
3068                     ; 928 FRESULT pf_read (
3068                     ; 929 	void* buff,		/* Pointer to the read buffer (NULL:Forward data to the stream)*/
3068                     ; 930 	UINT btr,		/* Number of bytes to read */
3068                     ; 931 	UINT* br		/* Pointer to number of bytes read */
3068                     ; 932 )
3068                     ; 933 {
3069                     	switch	.text
3070  0745               _pf_read:
3072  0745 89            	pushw	x
3073  0746 520f          	subw	sp,#15
3074       0000000f      OFST:	set	15
3077                     ; 938 	BYTE cs, *rbuff = buff;
3079  0748 1f05          	ldw	(OFST-10,sp),x
3081                     ; 939 	FATFS *fs = FatFs;
3083  074a ce0000        	ldw	x,L3_FatFs
3084  074d 1f0e          	ldw	(OFST-1,sp),x
3086                     ; 942 	*br = 0;
3088  074f 1e16          	ldw	x,(OFST+7,sp)
3089  0751 905f          	clrw	y
3090  0753 ff            	ldw	(x),y
3091                     ; 943 	if (!fs) return FR_NOT_ENABLED;		/* Check file system */
3093  0754 1e0e          	ldw	x,(OFST-1,sp)
3094  0756 2604          	jrne	L3421
3097  0758 a605          	ld	a,#5
3099  075a 2008          	jra	L622
3100  075c               L3421:
3101                     ; 944 	if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
3103  075c e601          	ld	a,(1,x)
3104  075e a501          	bcp	a,#1
3105  0760 2605          	jrne	L5421
3108  0762 a604          	ld	a,#4
3110  0764               L622:
3112  0764 5b11          	addw	sp,#17
3113  0766 81            	ret	
3114  0767               L5421:
3115                     ; 946 	remain = fs->fsize - fs->fptr;
3117  0767 1c001a        	addw	x,#26
3118  076a cd0000        	call	c_ltor
3120  076d 1e0e          	ldw	x,(OFST-1,sp)
3121  076f 1c0016        	addw	x,#22
3122  0772 cd0000        	call	c_lsub
3124  0775 96            	ldw	x,sp
3125  0776 1c0008        	addw	x,#OFST-7
3126  0779 cd0000        	call	c_rtol
3129                     ; 947 	if (btr > remain) btr = (UINT)remain;			/* Truncate btr by remaining bytes */
3131  077c 1e14          	ldw	x,(OFST+5,sp)
3132  077e cd0000        	call	c_uitolx
3134  0781 96            	ldw	x,sp
3135  0782 1c0008        	addw	x,#OFST-7
3136  0785 cd0000        	call	c_lcmp
3138  0788 2203cc08d5    	jrule	L3521
3141  078d 1e0a          	ldw	x,(OFST-5,sp)
3142  078f 1f14          	ldw	(OFST+5,sp),x
3143  0791 cc08d5        	jra	L3521
3144  0794               L1521:
3145                     ; 950 		if ((fs->fptr % 512) == 0) {				/* On the sector boundary? */
3147  0794 1e0e          	ldw	x,(OFST-1,sp)
3148  0796 1c0016        	addw	x,#22
3149  0799 cd0000        	call	c_ltor
3151  079c b602          	ld	a,c_lreg+2
3152  079e a401          	and	a,#1
3153  07a0 b702          	ld	c_lreg+2,a
3154  07a2 3f01          	clr	c_lreg+1
3155  07a4 3f00          	clr	c_lreg
3156  07a6 cd0000        	call	c_lrzmp
3158  07a9 2703cc086d    	jrne	L7521
3159                     ; 951 			cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
3161  07ae 1e0e          	ldw	x,(OFST-1,sp)
3162  07b0 e602          	ld	a,(2,x)
3163  07b2 4a            	dec	a
3164  07b3 b703          	ld	c_lreg+3,a
3165  07b5 3f02          	clr	c_lreg+2
3166  07b7 3f01          	clr	c_lreg+1
3167  07b9 3f00          	clr	c_lreg
3168  07bb 96            	ldw	x,sp
3169  07bc 5c            	incw	x
3170  07bd cd0000        	call	c_rtol
3173  07c0 1e0e          	ldw	x,(OFST-1,sp)
3174  07c2 1c0016        	addw	x,#22
3175  07c5 cd0000        	call	c_ltor
3177  07c8 a609          	ld	a,#9
3178  07ca cd0000        	call	c_lursh
3180  07cd 96            	ldw	x,sp
3181  07ce 5c            	incw	x
3182  07cf cd0000        	call	c_land
3184  07d2 b603          	ld	a,c_lreg+3
3185  07d4 6b07          	ld	(OFST-8,sp),a
3187                     ; 952 			if (!cs) {								/* On the cluster boundary? */
3189  07d6 2658          	jrne	L1621
3190                     ; 953 				if (fs->fptr == 0) {				/* On the top of the file? */
3192  07d8 1e0e          	ldw	x,(OFST-1,sp)
3193  07da 1c0016        	addw	x,#22
3194  07dd cd0000        	call	c_lzmp
3196  07e0 260f          	jrne	L3621
3197                     ; 954 					clst = fs->org_clust;
3199  07e2 1e0e          	ldw	x,(OFST-1,sp)
3200  07e4 9093          	ldw	y,x
3201  07e6 ee20          	ldw	x,(32,x)
3202  07e8 1f0a          	ldw	(OFST-5,sp),x
3203  07ea 93            	ldw	x,y
3204  07eb ee1e          	ldw	x,(30,x)
3205  07ed 1f08          	ldw	(OFST-7,sp),x
3208  07ef 2017          	jra	L5621
3209  07f1               L3621:
3210                     ; 956 					clst = get_fat(fs->curr_clust);
3212  07f1 1e0e          	ldw	x,(OFST-1,sp)
3213  07f3 9093          	ldw	y,x
3214  07f5 ee24          	ldw	x,(36,x)
3215  07f7 89            	pushw	x
3216  07f8 93            	ldw	x,y
3217  07f9 ee22          	ldw	x,(34,x)
3218  07fb 89            	pushw	x
3219  07fc cd00e3        	call	L761_get_fat
3221  07ff 5b04          	addw	sp,#4
3222  0801 96            	ldw	x,sp
3223  0802 1c0008        	addw	x,#OFST-7
3224  0805 cd0000        	call	c_rtol
3227  0808               L5621:
3228                     ; 958 				if (clst <= 1) ABORT(FR_DISK_ERR);
3230  0808 96            	ldw	x,sp
3231  0809 1c0008        	addw	x,#OFST-7
3232  080c cd0000        	call	c_ltor
3234  080f ae0000        	ldw	x,#L02
3235  0812 cd0000        	call	c_lcmp
3237  0815 1e0e          	ldw	x,(OFST-1,sp)
3238  0817 2407          	jruge	L7621
3241  0819 6f01          	clr	(1,x)
3244  081b a601          	ld	a,#1
3246  081d cc0764        	jra	L622
3247  0820               L7621:
3248                     ; 959 				fs->curr_clust = clst;				/* Update current cluster */
3251  0820 7b0b          	ld	a,(OFST-4,sp)
3252  0822 e725          	ld	(37,x),a
3253  0824 7b0a          	ld	a,(OFST-5,sp)
3254  0826 e724          	ld	(36,x),a
3255  0828 7b09          	ld	a,(OFST-6,sp)
3256  082a e723          	ld	(35,x),a
3257  082c 7b08          	ld	a,(OFST-7,sp)
3258  082e e722          	ld	(34,x),a
3259  0830               L1621:
3260                     ; 961 			sect = clust2sect(fs->curr_clust);		/* Get current sector */
3262  0830 1e0e          	ldw	x,(OFST-1,sp)
3263  0832 9093          	ldw	y,x
3264  0834 ee24          	ldw	x,(36,x)
3265  0836 89            	pushw	x
3266  0837 93            	ldw	x,y
3267  0838 ee22          	ldw	x,(34,x)
3268  083a 89            	pushw	x
3269  083b cd015c        	call	L372_clust2sect
3271  083e 5b04          	addw	sp,#4
3272  0840 96            	ldw	x,sp
3273  0841 1c0008        	addw	x,#OFST-7
3274  0844 cd0000        	call	c_rtol
3277                     ; 962 			if (!sect) ABORT(FR_DISK_ERR);
3279  0847 96            	ldw	x,sp
3280  0848 1c0008        	addw	x,#OFST-7
3281  084b cd0000        	call	c_lzmp
3283  084e 2609          	jrne	L1721
3286  0850 1e0e          	ldw	x,(OFST-1,sp)
3289  0852 a601          	ld	a,#1
3290  0854 6f01          	clr	(1,x)
3292  0856 cc0764        	jra	L622
3293  0859               L1721:
3294                     ; 963 			fs->dsect = sect + cs;
3297  0859 96            	ldw	x,sp
3298  085a 1c0008        	addw	x,#OFST-7
3299  085d cd0000        	call	c_ltor
3301  0860 7b07          	ld	a,(OFST-8,sp)
3302  0862 cd0000        	call	c_ladc
3304  0865 1e0e          	ldw	x,(OFST-1,sp)
3305  0867 1c0026        	addw	x,#38
3306  086a cd0000        	call	c_rtol
3308  086d               L7521:
3309                     ; 965 		rcnt = 512 - (UINT)fs->fptr % 512;			/* Get partial sector data from sector buffer */
3311  086d 1e0e          	ldw	x,(OFST-1,sp)
3312  086f ee18          	ldw	x,(24,x)
3313  0871 02            	rlwa	x,a
3314  0872 a401          	and	a,#1
3315  0874 01            	rrwa	x,a
3316  0875 1f03          	ldw	(OFST-12,sp),x
3318  0877 ae0200        	ldw	x,#512
3319  087a 72f003        	subw	x,(OFST-12,sp)
3321                     ; 966 		if (rcnt > btr) rcnt = btr;
3323  087d 1314          	cpw	x,(OFST+5,sp)
3324  087f 2302          	jrule	L3721
3327  0881 1e14          	ldw	x,(OFST+5,sp)
3329  0883               L3721:
3330  0883 1f0c          	ldw	(OFST-3,sp),x
3331                     ; 967 		dr = disk_readp(rbuff, fs->dsect, (UINT)fs->fptr % 512, rcnt);
3333  0885 89            	pushw	x
3334  0886 1e10          	ldw	x,(OFST+1,sp)
3335  0888 ee18          	ldw	x,(24,x)
3336  088a 02            	rlwa	x,a
3337  088b a401          	and	a,#1
3338  088d 01            	rrwa	x,a
3339  088e 89            	pushw	x
3340  088f 1e12          	ldw	x,(OFST+3,sp)
3341  0891 9093          	ldw	y,x
3342  0893 ee28          	ldw	x,(40,x)
3343  0895 89            	pushw	x
3344  0896 93            	ldw	x,y
3345  0897 ee26          	ldw	x,(38,x)
3346  0899 89            	pushw	x
3347  089a 1e0d          	ldw	x,(OFST-2,sp)
3348  089c cd0000        	call	_disk_readp
3350  089f 5b08          	addw	sp,#8
3351  08a1 6b07          	ld	(OFST-8,sp),a
3353                     ; 968 		if (dr) ABORT(FR_DISK_ERR);
3355  08a3 2709          	jreq	L5721
3358  08a5 1e0e          	ldw	x,(OFST-1,sp)
3361  08a7 a601          	ld	a,#1
3362  08a9 6f01          	clr	(1,x)
3364  08ab cc0764        	jra	L622
3365  08ae               L5721:
3366                     ; 969 		fs->fptr += rcnt;							/* Advances file read pointer */
3369  08ae 1e0e          	ldw	x,(OFST-1,sp)
3370  08b0 160c          	ldw	y,(OFST-3,sp)
3371  08b2 cd0000        	call	c_uitoly
3373  08b5 1c0016        	addw	x,#22
3374  08b8 cd0000        	call	c_lgadd
3376                     ; 970 		btr -= rcnt; *br += rcnt;					/* Update read counter */
3378  08bb 1e14          	ldw	x,(OFST+5,sp)
3379  08bd 72f00c        	subw	x,(OFST-3,sp)
3380  08c0 1f14          	ldw	(OFST+5,sp),x
3383  08c2 1e16          	ldw	x,(OFST+7,sp)
3384  08c4 9093          	ldw	y,x
3385  08c6 fe            	ldw	x,(x)
3386  08c7 72fb0c        	addw	x,(OFST-3,sp)
3387  08ca 90ff          	ldw	(y),x
3388                     ; 971 		if (rbuff) rbuff += rcnt;					/* Advances the data pointer if destination is memory */
3390  08cc 1e05          	ldw	x,(OFST-10,sp)
3391  08ce 2705          	jreq	L3521
3394  08d0 72fb0c        	addw	x,(OFST-3,sp)
3395  08d3 1f05          	ldw	(OFST-10,sp),x
3397  08d5               L3521:
3398                     ; 949 	while (btr)	{									/* Repeat until all data transferred */
3400  08d5 1e14          	ldw	x,(OFST+5,sp)
3401  08d7 2703cc0794    	jrne	L1521
3402                     ; 974 	return FR_OK;
3404  08dc 4f            	clr	a
3406  08dd cc0764        	jra	L622
3520                     ; 985 FRESULT pf_write (
3520                     ; 986 	const void* buff,	/* Pointer to the data to be written */
3520                     ; 987 	UINT btw,			/* Number of bytes to write (0:Finalize the current write operation) */
3520                     ; 988 	UINT* bw			/* Pointer to number of bytes written */
3520                     ; 989 )
3520                     ; 990 {
3521                     	switch	.text
3522  08e0               _pf_write:
3524  08e0 89            	pushw	x
3525  08e1 520f          	subw	sp,#15
3526       0000000f      OFST:	set	15
3529                     ; 993 	const BYTE *p = buff;
3531  08e3 1f05          	ldw	(OFST-10,sp),x
3533                     ; 996 	FATFS *fs = FatFs;
3535  08e5 ce0000        	ldw	x,L3_FatFs
3536  08e8 1f0e          	ldw	(OFST-1,sp),x
3538                     ; 999 	*bw = 0;
3540  08ea 1e16          	ldw	x,(OFST+7,sp)
3541  08ec 905f          	clrw	y
3542  08ee ff            	ldw	(x),y
3543                     ; 1000 	if (!fs) return FR_NOT_ENABLED;		/* Check file system */
3545  08ef 1e0e          	ldw	x,(OFST-1,sp)
3546  08f1 2604          	jrne	L1531
3549  08f3 a605          	ld	a,#5
3551  08f5 2008          	jra	L642
3552  08f7               L1531:
3553                     ; 1001 	if (!(fs->flag & FA_OPENED)) return FR_NOT_OPENED;	/* Check if opened */
3555  08f7 e601          	ld	a,(1,x)
3556  08f9 a501          	bcp	a,#1
3557  08fb 2605          	jrne	L3531
3560  08fd a604          	ld	a,#4
3562  08ff               L642:
3564  08ff 5b11          	addw	sp,#17
3565  0901 81            	ret	
3566  0902               L3531:
3567                     ; 1003 	if (!btw) {		/* Finalize request */
3569  0902 1e14          	ldw	x,(OFST+5,sp)
3570  0904 2621          	jrne	L5531
3571                     ; 1004 		if ((fs->flag & FA__WIP) && disk_writep(0, 0)) ABORT(FR_DISK_ERR);
3573  0906 1e0e          	ldw	x,(OFST-1,sp)
3574  0908 e601          	ld	a,(1,x)
3575  090a a540          	bcp	a,#64
3576  090c 2712          	jreq	L7531
3578  090e 5f            	clrw	x
3579  090f 89            	pushw	x
3580  0910 89            	pushw	x
3581  0911 cd0000        	call	_disk_writep
3583  0914 5b04          	addw	sp,#4
3584  0916 4d            	tnz	a
3588  0917 2703cc0aa9    	jrne	LC008
3589  091c 1e0e          	ldw	x,(OFST-1,sp)
3590  091e e601          	ld	a,(1,x)
3591  0920               L7531:
3592                     ; 1005 		fs->flag &= ~FA__WIP;
3595  0920 a4bf          	and	a,#191
3596  0922 e701          	ld	(1,x),a
3597                     ; 1006 		return FR_OK;
3599  0924 cc0ac1        	jp	LC006
3600  0927               L5531:
3601                     ; 1008 		if (!(fs->flag & FA__WIP)) {	/* Round-down fptr to the sector boundary */
3603  0927 1e0e          	ldw	x,(OFST-1,sp)
3604  0929 e601          	ld	a,(1,x)
3605  092b a540          	bcp	a,#64
3606  092d 2608          	jrne	L1631
3607                     ; 1009 			fs->fptr &= 0xFFFFFE00;
3609  092f 6f19          	clr	(25,x)
3610  0931 e618          	ld	a,(24,x)
3611  0933 a4fe          	and	a,#254
3612  0935 e718          	ld	(24,x),a
3613  0937               L1631:
3614                     ; 1012 	remain = fs->fsize - fs->fptr;
3616  0937 1c001a        	addw	x,#26
3617  093a cd0000        	call	c_ltor
3619  093d 1e0e          	ldw	x,(OFST-1,sp)
3620  093f 1c0016        	addw	x,#22
3621  0942 cd0000        	call	c_lsub
3623  0945 96            	ldw	x,sp
3624  0946 1c0008        	addw	x,#OFST-7
3625  0949 cd0000        	call	c_rtol
3628                     ; 1013 	if (btw > remain) btw = (UINT)remain;			/* Truncate btw by remaining bytes */
3630  094c 1e14          	ldw	x,(OFST+5,sp)
3631  094e cd0000        	call	c_uitolx
3633  0951 96            	ldw	x,sp
3634  0952 1c0008        	addw	x,#OFST-7
3635  0955 cd0000        	call	c_lcmp
3637  0958 2203cc0aba    	jrule	L1731
3640  095d 1e0a          	ldw	x,(OFST-5,sp)
3641  095f 1f14          	ldw	(OFST+5,sp),x
3642  0961 cc0aba        	jra	L1731
3643  0964               L7631:
3644                     ; 1016 		if ((UINT)fs->fptr % 512 == 0) {			/* On the sector boundary? */
3646  0964 1e0e          	ldw	x,(OFST-1,sp)
3647  0966 ee18          	ldw	x,(24,x)
3648  0968 02            	rlwa	x,a
3649  0969 a401          	and	a,#1
3650  096b 01            	rrwa	x,a
3651  096c 5d            	tnzw	x
3652  096d 2703cc0a43    	jrne	L5731
3653                     ; 1017 			cs = (BYTE)(fs->fptr / 512 & (fs->csize - 1));	/* Sector offset in the cluster */
3655  0972 1e0e          	ldw	x,(OFST-1,sp)
3656  0974 e602          	ld	a,(2,x)
3657  0976 4a            	dec	a
3658  0977 b703          	ld	c_lreg+3,a
3659  0979 3f02          	clr	c_lreg+2
3660  097b 3f01          	clr	c_lreg+1
3661  097d 3f00          	clr	c_lreg
3662  097f 96            	ldw	x,sp
3663  0980 5c            	incw	x
3664  0981 cd0000        	call	c_rtol
3667  0984 1e0e          	ldw	x,(OFST-1,sp)
3668  0986 1c0016        	addw	x,#22
3669  0989 cd0000        	call	c_ltor
3671  098c a609          	ld	a,#9
3672  098e cd0000        	call	c_lursh
3674  0991 96            	ldw	x,sp
3675  0992 5c            	incw	x
3676  0993 cd0000        	call	c_land
3678  0996 b603          	ld	a,c_lreg+3
3679  0998 6b07          	ld	(OFST-8,sp),a
3681                     ; 1018 			if (!cs) {								/* On the cluster boundary? */
3683  099a 2654          	jrne	L7731
3684                     ; 1019 				if (fs->fptr == 0) {				/* On the top of the file? */
3686  099c 1e0e          	ldw	x,(OFST-1,sp)
3687  099e 1c0016        	addw	x,#22
3688  09a1 cd0000        	call	c_lzmp
3690  09a4 260f          	jrne	L1041
3691                     ; 1020 					clst = fs->org_clust;
3693  09a6 1e0e          	ldw	x,(OFST-1,sp)
3694  09a8 9093          	ldw	y,x
3695  09aa ee20          	ldw	x,(32,x)
3696  09ac 1f0a          	ldw	(OFST-5,sp),x
3697  09ae 93            	ldw	x,y
3698  09af ee1e          	ldw	x,(30,x)
3699  09b1 1f08          	ldw	(OFST-7,sp),x
3702  09b3 2017          	jra	L3041
3703  09b5               L1041:
3704                     ; 1022 					clst = get_fat(fs->curr_clust);
3706  09b5 1e0e          	ldw	x,(OFST-1,sp)
3707  09b7 9093          	ldw	y,x
3708  09b9 ee24          	ldw	x,(36,x)
3709  09bb 89            	pushw	x
3710  09bc 93            	ldw	x,y
3711  09bd ee22          	ldw	x,(34,x)
3712  09bf 89            	pushw	x
3713  09c0 cd00e3        	call	L761_get_fat
3715  09c3 5b04          	addw	sp,#4
3716  09c5 96            	ldw	x,sp
3717  09c6 1c0008        	addw	x,#OFST-7
3718  09c9 cd0000        	call	c_rtol
3721  09cc               L3041:
3722                     ; 1024 				if (clst <= 1) ABORT(FR_DISK_ERR);
3724  09cc 96            	ldw	x,sp
3725  09cd 1c0008        	addw	x,#OFST-7
3726  09d0 cd0000        	call	c_ltor
3728  09d3 ae0000        	ldw	x,#L02
3729  09d6 cd0000        	call	c_lcmp
3731  09d9 1e0e          	ldw	x,(OFST-1,sp)
3735  09db 2403cc0aab    	jrult	LC007
3736                     ; 1025 				fs->curr_clust = clst;				/* Update current cluster */
3739  09e0 7b0b          	ld	a,(OFST-4,sp)
3740  09e2 e725          	ld	(37,x),a
3741  09e4 7b0a          	ld	a,(OFST-5,sp)
3742  09e6 e724          	ld	(36,x),a
3743  09e8 7b09          	ld	a,(OFST-6,sp)
3744  09ea e723          	ld	(35,x),a
3745  09ec 7b08          	ld	a,(OFST-7,sp)
3746  09ee e722          	ld	(34,x),a
3747  09f0               L7731:
3748                     ; 1027 			sect = clust2sect(fs->curr_clust);		/* Get current sector */
3750  09f0 1e0e          	ldw	x,(OFST-1,sp)
3751  09f2 9093          	ldw	y,x
3752  09f4 ee24          	ldw	x,(36,x)
3753  09f6 89            	pushw	x
3754  09f7 93            	ldw	x,y
3755  09f8 ee22          	ldw	x,(34,x)
3756  09fa 89            	pushw	x
3757  09fb cd015c        	call	L372_clust2sect
3759  09fe 5b04          	addw	sp,#4
3760  0a00 96            	ldw	x,sp
3761  0a01 1c0008        	addw	x,#OFST-7
3762  0a04 cd0000        	call	c_rtol
3765                     ; 1028 			if (!sect) ABORT(FR_DISK_ERR);
3767  0a07 96            	ldw	x,sp
3768  0a08 1c0008        	addw	x,#OFST-7
3769  0a0b cd0000        	call	c_lzmp
3774  0a0e 2603cc0aa9    	jreq	LC008
3775                     ; 1029 			fs->dsect = sect + cs;
3778  0a13 96            	ldw	x,sp
3779  0a14 1c0008        	addw	x,#OFST-7
3780  0a17 cd0000        	call	c_ltor
3782  0a1a 7b07          	ld	a,(OFST-8,sp)
3783  0a1c cd0000        	call	c_ladc
3785  0a1f 1e0e          	ldw	x,(OFST-1,sp)
3786  0a21 1c0026        	addw	x,#38
3787  0a24 cd0000        	call	c_rtol
3789                     ; 1030 			if (disk_writep(0, fs->dsect)) ABORT(FR_DISK_ERR);	/* Initiate a sector write operation */
3791  0a27 1e0e          	ldw	x,(OFST-1,sp)
3792  0a29 9093          	ldw	y,x
3793  0a2b ee28          	ldw	x,(40,x)
3794  0a2d 89            	pushw	x
3795  0a2e 93            	ldw	x,y
3796  0a2f ee26          	ldw	x,(38,x)
3797  0a31 89            	pushw	x
3798  0a32 5f            	clrw	x
3799  0a33 cd0000        	call	_disk_writep
3801  0a36 5b04          	addw	sp,#4
3802  0a38 4d            	tnz	a
3806  0a39 266e          	jrne	LC008
3807                     ; 1031 			fs->flag |= FA__WIP;
3810  0a3b 1e0e          	ldw	x,(OFST-1,sp)
3811  0a3d e601          	ld	a,(1,x)
3812  0a3f aa40          	or	a,#64
3813  0a41 e701          	ld	(1,x),a
3814  0a43               L5731:
3815                     ; 1033 		wcnt = 512 - (UINT)fs->fptr % 512;			/* Number of bytes to write to the sector */
3817  0a43 1e0e          	ldw	x,(OFST-1,sp)
3818  0a45 ee18          	ldw	x,(24,x)
3819  0a47 02            	rlwa	x,a
3820  0a48 a401          	and	a,#1
3821  0a4a 01            	rrwa	x,a
3822  0a4b 1f03          	ldw	(OFST-12,sp),x
3824  0a4d ae0200        	ldw	x,#512
3825  0a50 72f003        	subw	x,(OFST-12,sp)
3827                     ; 1034 		if (wcnt > btw) wcnt = btw;
3829  0a53 1314          	cpw	x,(OFST+5,sp)
3830  0a55 2302          	jrule	L3141
3833  0a57 1e14          	ldw	x,(OFST+5,sp)
3835  0a59               L3141:
3836  0a59 1f0c          	ldw	(OFST-3,sp),x
3837                     ; 1035 		if (disk_writep(p, wcnt)) ABORT(FR_DISK_ERR);	/* Send data to the sector */
3839  0a5b cd0000        	call	c_uitolx
3841  0a5e be02          	ldw	x,c_lreg+2
3842  0a60 89            	pushw	x
3843  0a61 be00          	ldw	x,c_lreg
3844  0a63 89            	pushw	x
3845  0a64 1e09          	ldw	x,(OFST-6,sp)
3846  0a66 cd0000        	call	_disk_writep
3848  0a69 5b04          	addw	sp,#4
3849  0a6b 4d            	tnz	a
3853  0a6c 263b          	jrne	LC008
3854                     ; 1036 		fs->fptr += wcnt; p += wcnt;				/* Update pointers and counters */
3857  0a6e 1e0e          	ldw	x,(OFST-1,sp)
3858  0a70 160c          	ldw	y,(OFST-3,sp)
3859  0a72 cd0000        	call	c_uitoly
3861  0a75 1c0016        	addw	x,#22
3862  0a78 cd0000        	call	c_lgadd
3866  0a7b 1e05          	ldw	x,(OFST-10,sp)
3867  0a7d 72fb0c        	addw	x,(OFST-3,sp)
3868  0a80 1f05          	ldw	(OFST-10,sp),x
3870                     ; 1037 		btw -= wcnt; *bw += wcnt;
3872  0a82 1e14          	ldw	x,(OFST+5,sp)
3873  0a84 72f00c        	subw	x,(OFST-3,sp)
3874  0a87 1f14          	ldw	(OFST+5,sp),x
3877  0a89 1e16          	ldw	x,(OFST+7,sp)
3878  0a8b 9093          	ldw	y,x
3879  0a8d fe            	ldw	x,(x)
3880  0a8e 72fb0c        	addw	x,(OFST-3,sp)
3881  0a91 90ff          	ldw	(y),x
3882                     ; 1038 		if ((UINT)fs->fptr % 512 == 0) {
3884  0a93 1e0e          	ldw	x,(OFST-1,sp)
3885  0a95 ee18          	ldw	x,(24,x)
3886  0a97 02            	rlwa	x,a
3887  0a98 a401          	and	a,#1
3888  0a9a 01            	rrwa	x,a
3889  0a9b 5d            	tnzw	x
3890  0a9c 261c          	jrne	L1731
3891                     ; 1039 			if (disk_writep(0, 0)) ABORT(FR_DISK_ERR);	/* Finalize the currtent secter write operation */
3893  0a9e 5f            	clrw	x
3894  0a9f 89            	pushw	x
3895  0aa0 89            	pushw	x
3896  0aa1 cd0000        	call	_disk_writep
3898  0aa4 5b04          	addw	sp,#4
3899  0aa6 4d            	tnz	a
3900  0aa7 2709          	jreq	L1241
3903  0aa9               LC008:
3908  0aa9 1e0e          	ldw	x,(OFST-1,sp)
3911  0aab               LC007:
3913  0aab 6f01          	clr	(1,x)
3919  0aad a601          	ld	a,#1
3921  0aaf cc08ff        	jra	L642
3922  0ab2               L1241:
3923                     ; 1040 			fs->flag &= ~FA__WIP;
3926  0ab2 1e0e          	ldw	x,(OFST-1,sp)
3927  0ab4 e601          	ld	a,(1,x)
3928  0ab6 a4bf          	and	a,#191
3929  0ab8 e701          	ld	(1,x),a
3930  0aba               L1731:
3931                     ; 1015 	while (btw)	{									/* Repeat until all data transferred */
3933  0aba 1e14          	ldw	x,(OFST+5,sp)
3934  0abc 2703cc0964    	jrne	L7631
3935                     ; 1044 	return FR_OK;
3937  0ac1               LC006:
3939  0ac1 4f            	clr	a
3941  0ac2 cc08ff        	jra	L642
3968                     	switch	.bss
3969  0000               L3_FatFs:
3970  0000 0000          	ds.b	2
3971                     	xref	_disk_writep
3972                     	xref	_disk_readp
3973                     	xref	_disk_initialize
3974                     	xdef	_pf_write
3975                     	xdef	_pf_read
3976                     	xdef	_pf_open
3977                     	xdef	_pf_mount
3978                     	xref.b	c_lreg
3979                     	xref.b	c_x
3999                     	xref	c_lgadd
4000                     	xref	c_uitoly
4001                     	xref	c_land
4002                     	xref	c_lrzmp
4003                     	xref	c_ladc
4004                     	xref	c_ludv
4005                     	xref	c_lsub
4006                     	xref	c_lgmul
4007                     	xref	c_lgadc
4008                     	xref	c_lzmp
4009                     	xref	c_lgor
4010                     	xref	c_lglsh
4011                     	xref	c_uitolx
4012                     	xref	c_lmul
4013                     	xref	c_lsbc
4014                     	xref	c_lgsbc
4015                     	xref	c_ladd
4016                     	xref	c_lursh
4017                     	xref	c_lcmp
4018                     	xref	c_lor
4019                     	xref	c_rtol
4020                     	xref	c_llsh
4021                     	xref	c_ltor
4022                     	end
