   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  18                     .const:	section	.text
  19  0000               L7_ExCvt:
  20  0000 80            	dc.b	128
  21  0001 9a            	dc.b	154
  22  0002 45            	dc.b	69
  23  0003 41            	dc.b	65
  24  0004 8e            	dc.b	142
  25  0005 41            	dc.b	65
  26  0006 8f            	dc.b	143
  27  0007 80            	dc.b	128
  28  0008 45            	dc.b	69
  29  0009 45            	dc.b	69
  30  000a 45            	dc.b	69
  31  000b 49            	dc.b	73
  32  000c 49            	dc.b	73
  33  000d 49            	dc.b	73
  34  000e 8e            	dc.b	142
  35  000f 8f            	dc.b	143
  36  0010 90            	dc.b	144
  37  0011 92            	dc.b	146
  38  0012 92            	dc.b	146
  39  0013 4f            	dc.b	79
  40  0014 99            	dc.b	153
  41  0015 4f            	dc.b	79
  42  0016 55            	dc.b	85
  43  0017 55            	dc.b	85
  44  0018 59            	dc.b	89
  45  0019 99            	dc.b	153
  46  001a 9a            	dc.b	154
  47  001b 9b            	dc.b	155
  48  001c 9c            	dc.b	156
  49  001d 9d            	dc.b	157
  50  001e 9e            	dc.b	158
  51  001f 9f            	dc.b	159
  52  0020 41            	dc.b	65
  53  0021 49            	dc.b	73
  54  0022 4f            	dc.b	79
  55  0023 55            	dc.b	85
  56  0024 a5            	dc.b	165
  57  0025 a5            	dc.b	165
  58  0026 a6            	dc.b	166
  59  0027 a7            	dc.b	167
  60  0028 a8            	dc.b	168
  61  0029 a9            	dc.b	169
  62  002a aa            	dc.b	170
  63  002b ab            	dc.b	171
  64  002c ac            	dc.b	172
  65  002d ad            	dc.b	173
  66  002e ae            	dc.b	174
  67  002f af            	dc.b	175
  68  0030 b0            	dc.b	176
  69  0031 b1            	dc.b	177
  70  0032 b2            	dc.b	178
  71  0033 b3            	dc.b	179
  72  0034 b4            	dc.b	180
  73  0035 b5            	dc.b	181
  74  0036 b6            	dc.b	182
  75  0037 b7            	dc.b	183
  76  0038 b8            	dc.b	184
  77  0039 b9            	dc.b	185
  78  003a ba            	dc.b	186
  79  003b bb            	dc.b	187
  80  003c bc            	dc.b	188
  81  003d bd            	dc.b	189
  82  003e be            	dc.b	190
  83  003f bf            	dc.b	191
  84  0040 c0            	dc.b	192
  85  0041 c1            	dc.b	193
  86  0042 c2            	dc.b	194
  87  0043 c3            	dc.b	195
  88  0044 c4            	dc.b	196
  89  0045 c5            	dc.b	197
  90  0046 c6            	dc.b	198
  91  0047 c7            	dc.b	199
  92  0048 c8            	dc.b	200
  93  0049 c9            	dc.b	201
  94  004a ca            	dc.b	202
  95  004b cb            	dc.b	203
  96  004c cc            	dc.b	204
  97  004d cd            	dc.b	205
  98  004e ce            	dc.b	206
  99  004f cf            	dc.b	207
 100  0050 d0            	dc.b	208
 101  0051 d1            	dc.b	209
 102  0052 d2            	dc.b	210
 103  0053 d3            	dc.b	211
 104  0054 d4            	dc.b	212
 105  0055 d5            	dc.b	213
 106  0056 d6            	dc.b	214
 107  0057 d7            	dc.b	215
 108  0058 d8            	dc.b	216
 109  0059 d9            	dc.b	217
 110  005a da            	dc.b	218
 111  005b db            	dc.b	219
 112  005c dc            	dc.b	220
 113  005d dd            	dc.b	221
 114  005e de            	dc.b	222
 115  005f df            	dc.b	223
 116  0060 e0            	dc.b	224
 117  0061 e1            	dc.b	225
 118  0062 e2            	dc.b	226
 119  0063 e3            	dc.b	227
 120  0064 e4            	dc.b	228
 121  0065 e5            	dc.b	229
 122  0066 e6            	dc.b	230
 123  0067 e7            	dc.b	231
 124  0068 e8            	dc.b	232
 125  0069 e9            	dc.b	233
 126  006a ea            	dc.b	234
 127  006b eb            	dc.b	235
 128  006c ec            	dc.b	236
 129  006d ed            	dc.b	237
 130  006e ee            	dc.b	238
 131  006f ef            	dc.b	239
 132  0070 f0            	dc.b	240
 133  0071 f1            	dc.b	241
 134  0072 f2            	dc.b	242
 135  0073 f3            	dc.b	243
 136  0074 f4            	dc.b	244
 137  0075 f5            	dc.b	245
 138  0076 f6            	dc.b	246
 139  0077 f7            	dc.b	247
 140  0078 f8            	dc.b	248
 141  0079 f9            	dc.b	249
 142  007a fa            	dc.b	250
 143  007b fb            	dc.b	251
 144  007c fc            	dc.b	252
 145  007d fd            	dc.b	253
 146  007e fe            	dc.b	254
 147  007f ff            	dc.b	255
 197                     ; 610 static WORD ld_word (const BYTE* ptr)	/*	 Load a 2-byte little-endian word */
 197                     ; 611 {
 199                     	switch	.text
 200  0000               L11_ld_word:
 202  0000 89            	pushw	x
 203  0001 89            	pushw	x
 204       00000002      OFST:	set	2
 207                     ; 614 	rv = ptr[1];
 209  0002 e601          	ld	a,(1,x)
 211                     ; 615 	rv = rv << 8 | ptr[0];
 213  0004 1603          	ldw	y,(OFST+1,sp)
 214  0006 97            	ld	xl,a
 215  0007 90f6          	ld	a,(y)
 216  0009 02            	rlwa	x,a
 218                     ; 616 	return rv;
 222  000a 5b04          	addw	sp,#4
 223  000c 81            	ret	
 267                     ; 619 static DWORD ld_dword (const BYTE* ptr)	/* Load a 4-byte little-endian word */
 267                     ; 620 {
 268                     	switch	.text
 269  000d               L34_ld_dword:
 271  000d 89            	pushw	x
 272  000e 5208          	subw	sp,#8
 273       00000008      OFST:	set	8
 276                     ; 623 	rv = ptr[3];
 278  0010 e603          	ld	a,(3,x)
 279  0012 6b08          	ld	(OFST+0,sp),a
 280  0014 4f            	clr	a
 281  0015 6b07          	ld	(OFST-1,sp),a
 282  0017 6b06          	ld	(OFST-2,sp),a
 283  0019 6b05          	ld	(OFST-3,sp),a
 285                     ; 624 	rv = rv << 8 | ptr[2];
 287  001b e602          	ld	a,(2,x)
 288  001d ad5c          	call	LC002
 289  001f 96            	ldw	x,sp
 290  0020 5c            	incw	x
 291  0021 cd0000        	call	c_rtol
 294  0024 96            	ldw	x,sp
 295  0025 ad49          	call	LC001
 297  0027 96            	ldw	x,sp
 298  0028 5c            	incw	x
 299  0029 cd0000        	call	c_lor
 301  002c 96            	ldw	x,sp
 302  002d 1c0005        	addw	x,#OFST-3
 303  0030 cd0000        	call	c_rtol
 306                     ; 625 	rv = rv << 8 | ptr[1];
 308  0033 1e09          	ldw	x,(OFST+1,sp)
 309  0035 e601          	ld	a,(1,x)
 310  0037 ad42          	call	LC002
 311  0039 96            	ldw	x,sp
 312  003a 5c            	incw	x
 313  003b cd0000        	call	c_rtol
 316  003e 96            	ldw	x,sp
 317  003f ad2f          	call	LC001
 319  0041 96            	ldw	x,sp
 320  0042 5c            	incw	x
 321  0043 cd0000        	call	c_lor
 323  0046 96            	ldw	x,sp
 324  0047 1c0005        	addw	x,#OFST-3
 325  004a cd0000        	call	c_rtol
 328                     ; 626 	rv = rv << 8 | ptr[0];
 330  004d 1e09          	ldw	x,(OFST+1,sp)
 331  004f f6            	ld	a,(x)
 332  0050 ad29          	call	LC002
 333  0052 96            	ldw	x,sp
 334  0053 5c            	incw	x
 335  0054 cd0000        	call	c_rtol
 338  0057 96            	ldw	x,sp
 339  0058 ad16          	call	LC001
 341  005a 96            	ldw	x,sp
 342  005b 5c            	incw	x
 343  005c cd0000        	call	c_lor
 345  005f 96            	ldw	x,sp
 346  0060 1c0005        	addw	x,#OFST-3
 347  0063 cd0000        	call	c_rtol
 350                     ; 627 	return rv;
 352  0066 96            	ldw	x,sp
 353  0067 1c0005        	addw	x,#OFST-3
 354  006a cd0000        	call	c_ltor
 358  006d 5b0a          	addw	sp,#10
 359  006f 81            	ret	
 360  0070               LC001:
 361  0070 1c0005        	addw	x,#OFST-3
 362  0073 cd0000        	call	c_ltor
 364  0076 a608          	ld	a,#8
 365  0078 cc0000        	jp	c_llsh
 366  007b               LC002:
 367  007b b703          	ld	c_lreg+3,a
 368  007d 3f02          	clr	c_lreg+2
 369  007f 3f01          	clr	c_lreg+1
 370  0081 3f00          	clr	c_lreg
 371  0083 81            	ret	
 415                     ; 648 static void st_word (BYTE* ptr, WORD val)	/* Store a 2-byte word in little-endian */
 415                     ; 649 {
 416                     	switch	.text
 417  0084               L76_st_word:
 419       fffffffe      OFST: set -2
 422                     ; 650 	*ptr++ = (BYTE)val; val >>= 8;
 424  0084 7b04          	ld	a,(OFST+6,sp)
 425  0086 f7            	ld	(x),a
 426  0087 5c            	incw	x
 429  0088 7b03          	ld	a,(OFST+5,sp)
 430  008a 6b04          	ld	(OFST+6,sp),a
 431  008c 0f03          	clr	(OFST+5,sp)
 432                     ; 651 	*ptr++ = (BYTE)val;
 434  008e f7            	ld	(x),a
 435                     ; 652 }
 438  008f 81            	ret	
 482                     ; 654 static void st_dword (BYTE* ptr, DWORD val)	/* Store a 4-byte word in little-endian */
 482                     ; 655 {
 483                     	switch	.text
 484  0090               L311_st_dword:
 486  0090 89            	pushw	x
 487       00000000      OFST:	set	0
 490                     ; 656 	*ptr++ = (BYTE)val; val >>= 8;
 492  0091 7b08          	ld	a,(OFST+8,sp)
 493  0093 f7            	ld	(x),a
 494  0094 5c            	incw	x
 495  0095 1f01          	ldw	(OFST+1,sp),x
 498  0097 96            	ldw	x,sp
 499  0098 ad1d          	call	LC003
 501                     ; 657 	*ptr++ = (BYTE)val; val >>= 8;
 503  009a 1e01          	ldw	x,(OFST+1,sp)
 504  009c 7b08          	ld	a,(OFST+8,sp)
 505  009e f7            	ld	(x),a
 506  009f 5c            	incw	x
 507  00a0 1f01          	ldw	(OFST+1,sp),x
 510  00a2 96            	ldw	x,sp
 511  00a3 ad12          	call	LC003
 513                     ; 658 	*ptr++ = (BYTE)val; val >>= 8;
 515  00a5 1e01          	ldw	x,(OFST+1,sp)
 516  00a7 7b08          	ld	a,(OFST+8,sp)
 517  00a9 f7            	ld	(x),a
 518  00aa 5c            	incw	x
 519  00ab 1f01          	ldw	(OFST+1,sp),x
 522  00ad 96            	ldw	x,sp
 523  00ae ad07          	call	LC003
 525                     ; 659 	*ptr++ = (BYTE)val;
 527  00b0 1e01          	ldw	x,(OFST+1,sp)
 528  00b2 7b08          	ld	a,(OFST+8,sp)
 529  00b4 f7            	ld	(x),a
 530                     ; 660 }
 533  00b5 85            	popw	x
 534  00b6 81            	ret	
 535  00b7               LC003:
 536  00b7 1c0005        	addw	x,#OFST+5
 537  00ba a608          	ld	a,#8
 538  00bc cc0000        	jp	c_lgursh
 612                     ; 684 static void mem_cpy (void* dst, const void* src, UINT cnt)
 612                     ; 685 {
 613                     	switch	.text
 614  00bf               L731_mem_cpy:
 616  00bf 89            	pushw	x
 617  00c0 5204          	subw	sp,#4
 618       00000004      OFST:	set	4
 621                     ; 686 	BYTE *d = (BYTE*)dst;
 623  00c2 1f01          	ldw	(OFST-3,sp),x
 625                     ; 687 	const BYTE *s = (const BYTE*)src;
 627  00c4 1e09          	ldw	x,(OFST+5,sp)
 628  00c6 1f03          	ldw	(OFST-1,sp),x
 630                     ; 689 	if (cnt != 0) {
 632  00c8 1e0b          	ldw	x,(OFST+7,sp)
 633  00ca 2713          	jreq	L771
 634  00cc               L102:
 635                     ; 691 			*d++ = *s++;
 637  00cc 1e03          	ldw	x,(OFST-1,sp)
 639  00ce f6            	ld	a,(x)
 640  00cf 5c            	incw	x
 641  00d0 1f03          	ldw	(OFST-1,sp),x
 642  00d2 1e01          	ldw	x,(OFST-3,sp)
 644  00d4 f7            	ld	(x),a
 645  00d5 5c            	incw	x
 646  00d6 1f01          	ldw	(OFST-3,sp),x
 647                     ; 692 		} while (--cnt);
 649  00d8 1e0b          	ldw	x,(OFST+7,sp)
 650  00da 5a            	decw	x
 651  00db 1f0b          	ldw	(OFST+7,sp),x
 652  00dd 26ed          	jrne	L102
 653  00df               L771:
 654                     ; 694 }
 657  00df 5b06          	addw	sp,#6
 658  00e1 81            	ret	
 721                     ; 698 static void mem_set (void* dst, int val, UINT cnt)
 721                     ; 699 {
 722                     	switch	.text
 723  00e2               L702_mem_set:
 725  00e2 89            	pushw	x
 726  00e3 89            	pushw	x
 727       00000002      OFST:	set	2
 730                     ; 700 	BYTE *d = (BYTE*)dst;
 732  00e4 1f01          	ldw	(OFST-1,sp),x
 734  00e6               L342:
 735                     ; 703 		*d++ = (BYTE)val;
 737  00e6 1e01          	ldw	x,(OFST-1,sp)
 738  00e8 7b08          	ld	a,(OFST+6,sp)
 740  00ea f7            	ld	(x),a
 741  00eb 5c            	incw	x
 742  00ec 1f01          	ldw	(OFST-1,sp),x
 743                     ; 704 	} while (--cnt);
 745  00ee 1e09          	ldw	x,(OFST+7,sp)
 746  00f0 5a            	decw	x
 747  00f1 1f09          	ldw	(OFST+7,sp),x
 748  00f3 26f1          	jrne	L342
 749                     ; 705 }
 752  00f5 5b04          	addw	sp,#4
 753  00f7 81            	ret	
 836                     ; 709 static int mem_cmp (const void* dst, const void* src, UINT cnt)	/* ZR:same, NZ:different */
 836                     ; 710 {
 837                     	switch	.text
 838  00f8               L152_mem_cmp:
 840  00f8 89            	pushw	x
 841  00f9 5206          	subw	sp,#6
 842       00000006      OFST:	set	6
 845                     ; 711 	const BYTE *d = (const BYTE *)dst, *s = (const BYTE *)src;
 847  00fb 1f01          	ldw	(OFST-5,sp),x
 851  00fd 1e0b          	ldw	x,(OFST+5,sp)
 852  00ff 1f03          	ldw	(OFST-3,sp),x
 854                     ; 712 	int r = 0;
 856  0101               L513:
 857                     ; 715 		r = *d++ - *s++;
 859  0101 1e01          	ldw	x,(OFST-5,sp)
 861  0103 f6            	ld	a,(x)
 862  0104 5c            	incw	x
 863  0105 1f01          	ldw	(OFST-5,sp),x
 864  0107 5f            	clrw	x
 865  0108 1603          	ldw	y,(OFST-3,sp)
 866  010a 905c          	incw	y
 867  010c 1703          	ldw	(OFST-3,sp),y
 868  010e 905a          	decw	y
 870  0110 90f0          	sub	a,(y)
 871  0112 2401          	jrnc	L22
 872  0114 5a            	decw	x
 873  0115               L22:
 874  0115 02            	rlwa	x,a
 875  0116 1f05          	ldw	(OFST-1,sp),x
 877                     ; 716 	} while (--cnt && r == 0);
 879  0118 1e0d          	ldw	x,(OFST+7,sp)
 880  011a 5a            	decw	x
 881  011b 1f0d          	ldw	(OFST+7,sp),x
 882  011d 2704          	jreq	L323
 884  011f 1e05          	ldw	x,(OFST-1,sp)
 885  0121 27de          	jreq	L513
 886  0123               L323:
 887                     ; 718 	return r;
 889  0123 1e05          	ldw	x,(OFST-1,sp)
 892  0125 5b08          	addw	sp,#8
 893  0127 81            	ret	
 937                     ; 723 static int chk_chr (const char* str, int chr)	/* NZ:contained, ZR:not contained */
 937                     ; 724 {
 938                     	switch	.text
 939  0128               L523_chk_chr:
 941  0128 89            	pushw	x
 942       00000000      OFST:	set	0
 945  0129 2005          	jra	L353
 946  012b               L153:
 947                     ; 725 	while (*str && *str != chr) str++;
 949  012b 1e01          	ldw	x,(OFST+1,sp)
 950  012d 5c            	incw	x
 951  012e 1f01          	ldw	(OFST+1,sp),x
 952  0130               L353:
 955  0130 f6            	ld	a,(x)
 956  0131 2709          	jreq	L753
 958  0133 5f            	clrw	x
 959  0134 97            	ld	xl,a
 960  0135 1305          	cpw	x,(OFST+5,sp)
 961  0137 26f2          	jrne	L153
 962  0139 1e01          	ldw	x,(OFST+1,sp)
 963  013b f6            	ld	a,(x)
 964  013c               L753:
 965                     ; 726 	return *str;
 967  013c 5f            	clrw	x
 968  013d 97            	ld	xl,a
 971  013e 5b02          	addw	sp,#2
 972  0140 81            	ret	
1006                     ; 731 static int dbc_1st (BYTE c)
1006                     ; 732 {
1007                     	switch	.text
1008  0141               L163_dbc_1st:
1012                     ; 744 	if (c != 0) return 0;	/* Always false */
1014  0141 4d            	tnz	a
1015  0142 2702          	jreq	L104
1018  0144 5f            	clrw	x
1021  0145 81            	ret	
1022  0146               L104:
1023                     ; 746 	return 0;
1025  0146 5f            	clrw	x
1028  0147 81            	ret	
1062                     ; 751 static int dbc_2nd (BYTE c)
1062                     ; 752 {
1063                     	switch	.text
1064  0148               L304_dbc_2nd:
1068                     ; 766 	if (c != 0) return 0;	/* Always false */
1070  0148 4d            	tnz	a
1071  0149 2702          	jreq	L324
1074  014b 5f            	clrw	x
1077  014c 81            	ret	
1078  014d               L324:
1079                     ; 768 	return 0;
1081  014d 5f            	clrw	x
1084  014e 81            	ret	
1417                     ; 1072 static FRESULT sync_window (	/* Returns FR_OK or FR_DISK_ERR */
1417                     ; 1073 	FATFS* fs			/* Filesystem object */
1417                     ; 1074 )
1417                     ; 1075 {
1418                     	switch	.text
1419  014f               L524_sync_window:
1421  014f 89            	pushw	x
1422  0150 88            	push	a
1423       00000001      OFST:	set	1
1426                     ; 1076 	FRESULT res = FR_OK;
1428  0151 0f01          	clr	(OFST+0,sp)
1430                     ; 1079 	if (fs->wflag) {	/* Is the disk access window dirty? */
1432  0153 e603          	ld	a,(3,x)
1433  0155 2774          	jreq	L106
1434                     ; 1080 		if (disk_write(fs->pdrv, fs->win, fs->winsect, 1) == RES_OK) {	/* Write it back into the volume */
1436  0157 ae0001        	ldw	x,#1
1437  015a 89            	pushw	x
1438  015b 1e04          	ldw	x,(OFST+3,sp)
1439  015d 9093          	ldw	y,x
1440  015f ee2d          	ldw	x,(45,x)
1441  0161 89            	pushw	x
1442  0162 93            	ldw	x,y
1443  0163 ee2b          	ldw	x,(43,x)
1444  0165 89            	pushw	x
1445  0166 1e08          	ldw	x,(OFST+7,sp)
1446  0168 1c002f        	addw	x,#47
1447  016b 89            	pushw	x
1448  016c 1e0a          	ldw	x,(OFST+9,sp)
1449  016e e601          	ld	a,(1,x)
1450  0170 cd0000        	call	_disk_write
1452  0173 5b08          	addw	sp,#8
1453  0175 4d            	tnz	a
1454  0176 264f          	jrne	L306
1455                     ; 1081 			fs->wflag = 0;	/* Clear window dirty flag */
1457  0178 1e02          	ldw	x,(OFST+1,sp)
1458  017a e703          	ld	(3,x),a
1459                     ; 1082 			if (fs->winsect - fs->fatbase < fs->fsize) {	/* Is it in the 1st FAT? */
1461  017c 1c002b        	addw	x,#43
1462  017f cd0000        	call	c_ltor
1464  0182 1e02          	ldw	x,(OFST+1,sp)
1465  0184 1c001f        	addw	x,#31
1466  0187 cd0000        	call	c_lsub
1468  018a 1e02          	ldw	x,(OFST+1,sp)
1469  018c 1c0017        	addw	x,#23
1470  018f cd0000        	call	c_lcmp
1472  0192 2437          	jruge	L106
1473                     ; 1083 				if (fs->n_fats == 2) disk_write(fs->pdrv, fs->win, fs->winsect + fs->fsize, 1);	/* Reflect it to 2nd FAT if needed */
1475  0194 1e02          	ldw	x,(OFST+1,sp)
1476  0196 e602          	ld	a,(2,x)
1477  0198 a102          	cp	a,#2
1478  019a 262f          	jrne	L106
1481  019c ae0001        	ldw	x,#1
1482  019f 89            	pushw	x
1483  01a0 1e04          	ldw	x,(OFST+3,sp)
1484  01a2 1c0017        	addw	x,#23
1485  01a5 cd0000        	call	c_ltor
1487  01a8 1e04          	ldw	x,(OFST+3,sp)
1488  01aa 1c002b        	addw	x,#43
1489  01ad cd0000        	call	c_ladd
1491  01b0 be02          	ldw	x,c_lreg+2
1492  01b2 89            	pushw	x
1493  01b3 be00          	ldw	x,c_lreg
1494  01b5 89            	pushw	x
1495  01b6 1e08          	ldw	x,(OFST+7,sp)
1496  01b8 1c002f        	addw	x,#47
1497  01bb 89            	pushw	x
1498  01bc 1e0a          	ldw	x,(OFST+9,sp)
1499  01be e601          	ld	a,(1,x)
1500  01c0 cd0000        	call	_disk_write
1502  01c3 5b08          	addw	sp,#8
1503  01c5 2004          	jra	L106
1504  01c7               L306:
1505                     ; 1086 			res = FR_DISK_ERR;
1507  01c7 a601          	ld	a,#1
1508  01c9 6b01          	ld	(OFST+0,sp),a
1510  01cb               L106:
1511                     ; 1089 	return res;
1513  01cb 7b01          	ld	a,(OFST+0,sp)
1516  01cd 5b03          	addw	sp,#3
1517  01cf 81            	ret	
1576                     ; 1094 static FRESULT move_window (	/* Returns FR_OK or FR_DISK_ERR */
1576                     ; 1095 	FATFS* fs,		/* Filesystem object */
1576                     ; 1096 	LBA_t sect		/* Sector LBA to make appearance in the fs->win[] */
1576                     ; 1097 )
1576                     ; 1098 {
1577                     	switch	.text
1578  01d0               L316_move_window:
1580  01d0 89            	pushw	x
1581  01d1 88            	push	a
1582       00000001      OFST:	set	1
1585                     ; 1099 	FRESULT res = FR_OK;
1587  01d2 0f01          	clr	(OFST+0,sp)
1589                     ; 1102 	if (sect != fs->winsect) {	/* Window offset changed? */
1591  01d4 1c002b        	addw	x,#43
1592  01d7 cd0000        	call	c_ltor
1594  01da 96            	ldw	x,sp
1595  01db 1c0006        	addw	x,#OFST+5
1596  01de cd0000        	call	c_lcmp
1598  01e1 2742          	jreq	L546
1599                     ; 1104 		res = sync_window(fs);		/* Flush the window */
1601  01e3 1e02          	ldw	x,(OFST+1,sp)
1602  01e5 cd014f        	call	L524_sync_window
1604  01e8 6b01          	ld	(OFST+0,sp),a
1606                     ; 1106 		if (res == FR_OK) {			/* Fill sector window with new data */
1608  01ea 2639          	jrne	L546
1609                     ; 1107 			if (disk_read(fs->pdrv, fs->win, sect, 1) != RES_OK) {
1611  01ec ae0001        	ldw	x,#1
1612  01ef 89            	pushw	x
1613  01f0 1e0a          	ldw	x,(OFST+9,sp)
1614  01f2 89            	pushw	x
1615  01f3 1e0a          	ldw	x,(OFST+9,sp)
1616  01f5 89            	pushw	x
1617  01f6 1e08          	ldw	x,(OFST+7,sp)
1618  01f8 1c002f        	addw	x,#47
1619  01fb 89            	pushw	x
1620  01fc 1e0a          	ldw	x,(OFST+9,sp)
1621  01fe e601          	ld	a,(1,x)
1622  0200 cd0000        	call	_disk_read
1624  0203 5b08          	addw	sp,#8
1625  0205 4d            	tnz	a
1626  0206 270b          	jreq	L156
1627                     ; 1108 				sect = (LBA_t)0 - 1;	/* Invalidate window if read data is not valid */
1629  0208 aeffff        	ldw	x,#65535
1630  020b 1f08          	ldw	(OFST+7,sp),x
1631  020d 1f06          	ldw	(OFST+5,sp),x
1632                     ; 1109 				res = FR_DISK_ERR;
1634  020f a601          	ld	a,#1
1635  0211 6b01          	ld	(OFST+0,sp),a
1637  0213               L156:
1638                     ; 1111 			fs->winsect = sect;
1640  0213 1e02          	ldw	x,(OFST+1,sp)
1641  0215 7b09          	ld	a,(OFST+8,sp)
1642  0217 e72e          	ld	(46,x),a
1643  0219 7b08          	ld	a,(OFST+7,sp)
1644  021b e72d          	ld	(45,x),a
1645  021d 7b07          	ld	a,(OFST+6,sp)
1646  021f e72c          	ld	(44,x),a
1647  0221 7b06          	ld	a,(OFST+5,sp)
1648  0223 e72b          	ld	(43,x),a
1649  0225               L546:
1650                     ; 1114 	return res;
1652  0225 7b01          	ld	a,(OFST+0,sp)
1655  0227 5b03          	addw	sp,#3
1656  0229 81            	ret	
1710                     ; 1125 static FRESULT sync_fs (	/* Returns FR_OK or FR_DISK_ERR */
1710                     ; 1126 	FATFS* fs		/* Filesystem object */
1710                     ; 1127 )
1710                     ; 1128 {
1711                     	switch	.text
1712  022a               L356_sync_fs:
1714  022a 89            	pushw	x
1715  022b 88            	push	a
1716       00000001      OFST:	set	1
1719                     ; 1132 	res = sync_window(fs);
1721  022c cd014f        	call	L524_sync_window
1723  022f 6b01          	ld	(OFST+0,sp),a
1725                     ; 1133 	if (res == FR_OK) {
1727  0231 2703cc02fa    	jrne	L107
1728                     ; 1134 		if (fs->fs_type == FS_FAT32 && fs->fsi_flag == 1) {	/* FAT32: Update FSInfo sector if needed */
1730  0236 1e02          	ldw	x,(OFST+1,sp)
1731  0238 f6            	ld	a,(x)
1732  0239 a103          	cp	a,#3
1733  023b 2703cc02e7    	jrne	L307
1735  0240 e604          	ld	a,(4,x)
1736  0242 4a            	dec	a
1737  0243 26f8          	jrne	L307
1738                     ; 1136 			mem_set(fs->win, 0, sizeof fs->win);
1740  0245 ae0200        	ldw	x,#512
1741  0248 89            	pushw	x
1742  0249 5f            	clrw	x
1743  024a 89            	pushw	x
1744  024b 1e06          	ldw	x,(OFST+5,sp)
1745  024d 1c002f        	addw	x,#47
1746  0250 cd00e2        	call	L702_mem_set
1748  0253 5b04          	addw	sp,#4
1749                     ; 1137 			st_word(fs->win + BS_55AA, 0xAA55);
1751  0255 aeaa55        	ldw	x,#43605
1752  0258 89            	pushw	x
1753  0259 1e04          	ldw	x,(OFST+3,sp)
1754  025b 1c022d        	addw	x,#557
1755  025e cd0084        	call	L76_st_word
1757  0261 85            	popw	x
1758                     ; 1138 			st_dword(fs->win + FSI_LeadSig, 0x41615252);
1760  0262 ae5252        	ldw	x,#21074
1761  0265 89            	pushw	x
1762  0266 ae4161        	ldw	x,#16737
1763  0269 89            	pushw	x
1764  026a 1e06          	ldw	x,(OFST+5,sp)
1765  026c 1c002f        	addw	x,#47
1766  026f cd0090        	call	L311_st_dword
1768  0272 5b04          	addw	sp,#4
1769                     ; 1139 			st_dword(fs->win + FSI_StrucSig, 0x61417272);
1771  0274 ae7272        	ldw	x,#29298
1772  0277 89            	pushw	x
1773  0278 ae6141        	ldw	x,#24897
1774  027b 89            	pushw	x
1775  027c 1e06          	ldw	x,(OFST+5,sp)
1776  027e 1c0213        	addw	x,#531
1777  0281 cd0090        	call	L311_st_dword
1779  0284 5b04          	addw	sp,#4
1780                     ; 1140 			st_dword(fs->win + FSI_Free_Count, fs->free_clst);
1782  0286 1e02          	ldw	x,(OFST+1,sp)
1783  0288 9093          	ldw	y,x
1784  028a ee11          	ldw	x,(17,x)
1785  028c 89            	pushw	x
1786  028d 93            	ldw	x,y
1787  028e ee0f          	ldw	x,(15,x)
1788  0290 89            	pushw	x
1789  0291 1e06          	ldw	x,(OFST+5,sp)
1790  0293 1c0217        	addw	x,#535
1791  0296 cd0090        	call	L311_st_dword
1793  0299 5b04          	addw	sp,#4
1794                     ; 1141 			st_dword(fs->win + FSI_Nxt_Free, fs->last_clst);
1796  029b 1e02          	ldw	x,(OFST+1,sp)
1797  029d 9093          	ldw	y,x
1798  029f ee0d          	ldw	x,(13,x)
1799  02a1 89            	pushw	x
1800  02a2 93            	ldw	x,y
1801  02a3 ee0b          	ldw	x,(11,x)
1802  02a5 89            	pushw	x
1803  02a6 1e06          	ldw	x,(OFST+5,sp)
1804  02a8 1c021b        	addw	x,#539
1805  02ab cd0090        	call	L311_st_dword
1807  02ae 5b04          	addw	sp,#4
1808                     ; 1143 			fs->winsect = fs->volbase + 1;
1810  02b0 1e02          	ldw	x,(OFST+1,sp)
1811  02b2 1c001b        	addw	x,#27
1812  02b5 cd0000        	call	c_ltor
1814  02b8 a601          	ld	a,#1
1815  02ba cd0000        	call	c_ladc
1817  02bd 1e02          	ldw	x,(OFST+1,sp)
1818  02bf 1c002b        	addw	x,#43
1819  02c2 cd0000        	call	c_rtol
1821                     ; 1144 			disk_write(fs->pdrv, fs->win, fs->winsect, 1);
1823  02c5 ae0001        	ldw	x,#1
1824  02c8 89            	pushw	x
1825  02c9 1e04          	ldw	x,(OFST+3,sp)
1826  02cb 9093          	ldw	y,x
1827  02cd ee2d          	ldw	x,(45,x)
1828  02cf 89            	pushw	x
1829  02d0 93            	ldw	x,y
1830  02d1 ee2b          	ldw	x,(43,x)
1831  02d3 89            	pushw	x
1832  02d4 1e08          	ldw	x,(OFST+7,sp)
1833  02d6 1c002f        	addw	x,#47
1834  02d9 89            	pushw	x
1835  02da 1e0a          	ldw	x,(OFST+9,sp)
1836  02dc e601          	ld	a,(1,x)
1837  02de cd0000        	call	_disk_write
1839  02e1 5b08          	addw	sp,#8
1840                     ; 1145 			fs->fsi_flag = 0;
1842  02e3 1e02          	ldw	x,(OFST+1,sp)
1843  02e5 6f04          	clr	(4,x)
1844  02e7               L307:
1845                     ; 1148 		if (disk_ioctl(fs->pdrv, CTRL_SYNC, 0) != RES_OK) res = FR_DISK_ERR;
1847  02e7 5f            	clrw	x
1848  02e8 89            	pushw	x
1849  02e9 1e04          	ldw	x,(OFST+3,sp)
1850  02eb e601          	ld	a,(1,x)
1851  02ed 5f            	clrw	x
1852  02ee 95            	ld	xh,a
1853  02ef cd0000        	call	_disk_ioctl
1855  02f2 4d            	tnz	a
1856  02f3 85            	popw	x
1857  02f4 2704          	jreq	L107
1860  02f6 a601          	ld	a,#1
1861  02f8 6b01          	ld	(OFST+0,sp),a
1863  02fa               L107:
1864                     ; 1151 	return res;
1866  02fa 7b01          	ld	a,(OFST+0,sp)
1869  02fc 5b03          	addw	sp,#3
1870  02fe 81            	ret	
1916                     ; 1162 static LBA_t clst2sect (	/* !=0:Sector number, 0:Failed (invalid cluster#) */
1916                     ; 1163 	FATFS* fs,		/* Filesystem object */
1916                     ; 1164 	DWORD clst		/* Cluster# to be converted */
1916                     ; 1165 )
1916                     ; 1166 {
1917                     	switch	.text
1918  02ff               L707_clst2sect:
1920  02ff 89            	pushw	x
1921       00000000      OFST:	set	0
1924                     ; 1167 	clst -= 2;		/* Cluster number is origin from 2 */
1926  0300 96            	ldw	x,sp
1927  0301 1c0005        	addw	x,#OFST+5
1928  0304 a602          	ld	a,#2
1929  0306 cd0000        	call	c_lgsbc
1931                     ; 1168 	if (clst >= fs->n_fatent - 2) return 0;		/* Is it invalid cluster number? */
1933  0309 1e01          	ldw	x,(OFST+1,sp)
1934  030b 1c0013        	addw	x,#19
1935  030e cd0000        	call	c_ltor
1937  0311 a602          	ld	a,#2
1938  0313 cd0000        	call	c_lsbc
1940  0316 96            	ldw	x,sp
1941  0317 1c0005        	addw	x,#OFST+5
1942  031a cd0000        	call	c_lcmp
1944  031d 2207          	jrugt	L537
1947  031f 5f            	clrw	x
1948  0320 bf02          	ldw	c_lreg+2,x
1949  0322 bf00          	ldw	c_lreg,x
1951  0324 2016          	jra	L47
1952  0326               L537:
1953                     ; 1169 	return fs->database + (LBA_t)fs->csize * clst;	/* Start sector number of the cluster */
1955  0326 1e01          	ldw	x,(OFST+1,sp)
1956  0328 ee09          	ldw	x,(9,x)
1957  032a cd0000        	call	c_uitolx
1959  032d 96            	ldw	x,sp
1960  032e 1c0005        	addw	x,#OFST+5
1961  0331 cd0000        	call	c_lmul
1963  0334 1e01          	ldw	x,(OFST+1,sp)
1964  0336 1c0027        	addw	x,#39
1965  0339 cd0000        	call	c_ladd
1968  033c               L47:
1970  033c 5b02          	addw	sp,#2
1971  033e 81            	ret	
2094                     	switch	.const
2095  0080               L001:
2096  0080 00000002      	dc.l	2
2097                     ; 1179 static DWORD get_fat (		/* 0xFFFFFFFF:Disk error, 1:Internal error, 2..0x7FFFFFFF:Cluster status */
2097                     ; 1180 	FFOBJID* obj,	/* Corresponding object */
2097                     ; 1181 	DWORD clst		/* Cluster number to get the value */
2097                     ; 1182 )
2097                     ; 1183 {
2098                     	switch	.text
2099  033f               L737_get_fat:
2101  033f 89            	pushw	x
2102  0340 5206          	subw	sp,#6
2103       00000006      OFST:	set	6
2106                     ; 1186 	FATFS *fs = obj->fs;
2108  0342 fe            	ldw	x,(x)
2109  0343 1f05          	ldw	(OFST-1,sp),x
2111                     ; 1189 	if (clst < 2 || clst >= fs->n_fatent) {	/* Check if in valid range */
2113  0345 96            	ldw	x,sp
2114  0346 1c000b        	addw	x,#OFST+5
2115  0349 cd0000        	call	c_ltor
2117  034c ae0080        	ldw	x,#L001
2118  034f cd0000        	call	c_lcmp
2120  0352 2511          	jrult	L1301
2122  0354 1e05          	ldw	x,(OFST-1,sp)
2123  0356 1c0013        	addw	x,#19
2124  0359 cd0000        	call	c_ltor
2126  035c 96            	ldw	x,sp
2127  035d 1c000b        	addw	x,#OFST+5
2128  0360 cd0000        	call	c_lcmp
2130  0363 2210          	jrugt	L7201
2131  0365               L1301:
2132                     ; 1190 		val = 1;	/* Internal error */
2135  0365 ae0001        	ldw	x,#1
2136  0368 1f03          	ldw	(OFST-3,sp),x
2137  036a 5f            	clrw	x
2138  036b 1f01          	ldw	(OFST-5,sp),x
2141  036d               L3301:
2142                     ; 1247 	return val;
2144  036d 96            	ldw	x,sp
2145  036e 5c            	incw	x
2146  036f cd0000        	call	c_ltor
2150  0372 5b08          	addw	sp,#8
2151  0374 81            	ret	
2152  0375               L7201:
2153                     ; 1193 		val = 0xFFFFFFFF;	/* Default value falls on disk error */
2155  0375 aeffff        	ldw	x,#65535
2156  0378 1f03          	ldw	(OFST-3,sp),x
2157  037a 1f01          	ldw	(OFST-5,sp),x
2159                     ; 1195 		switch (fs->fs_type) {
2161  037c 1e05          	ldw	x,(OFST-1,sp)
2162  037e f6            	ld	a,(x)
2163  037f a103          	cp	a,#3
2164  0381 26e2          	jrne	L1301
2167                     ; 1212 		case FS_FAT32 :
2167                     ; 1213 			if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 4))) != FR_OK) break;
2169  0383 96            	ldw	x,sp
2170  0384 1c000b        	addw	x,#OFST+5
2171  0387 cd0000        	call	c_ltor
2173  038a a607          	ld	a,#7
2174  038c cd0000        	call	c_lursh
2176  038f 1e05          	ldw	x,(OFST-1,sp)
2177  0391 1c001f        	addw	x,#31
2178  0394 cd0000        	call	c_ladd
2180  0397 be02          	ldw	x,c_lreg+2
2181  0399 89            	pushw	x
2182  039a be00          	ldw	x,c_lreg
2183  039c 89            	pushw	x
2184  039d 1e09          	ldw	x,(OFST+3,sp)
2185  039f cd01d0        	call	L316_move_window
2187  03a2 5b04          	addw	sp,#4
2188  03a4 4d            	tnz	a
2189  03a5 26c6          	jrne	L3301
2192                     ; 1214 			val = ld_dword(fs->win + clst * 4 % SS(fs)) & 0x0FFFFFFF;	/* Simple DWORD array but mask out upper 4 bits */
2194  03a7 1e0d          	ldw	x,(OFST+7,sp)
2195  03a9 58            	sllw	x
2196  03aa 58            	sllw	x
2197  03ab 02            	rlwa	x,a
2198  03ac a401          	and	a,#1
2199  03ae 01            	rrwa	x,a
2200  03af 72fb05        	addw	x,(OFST-1,sp)
2201  03b2 1c002f        	addw	x,#47
2202  03b5 cd000d        	call	L34_ld_dword
2204  03b8 b600          	ld	a,c_lreg
2205  03ba a40f          	and	a,#15
2206  03bc b700          	ld	c_lreg,a
2207  03be 96            	ldw	x,sp
2208  03bf 5c            	incw	x
2209  03c0 cd0000        	call	c_rtol
2212                     ; 1215 			break;
2214  03c3 20a8          	jra	L3301
2215                     ; 1242 		default:
2215                     ; 1243 			val = 1;	/* Internal error */
2285                     ; 1258 static FRESULT put_fat (	/* FR_OK(0):succeeded, !=0:error */
2285                     ; 1259 	FATFS* fs,		/* Corresponding filesystem object */
2285                     ; 1260 	DWORD clst,		/* FAT index number (cluster number) to be changed */
2285                     ; 1261 	DWORD val		/* New value to be set to the entry */
2285                     ; 1262 )
2285                     ; 1263 {
2286                     	switch	.text
2287  03c5               L5401_put_fat:
2289  03c5 89            	pushw	x
2290  03c6 5205          	subw	sp,#5
2291       00000005      OFST:	set	5
2294                     ; 1266 	FRESULT res = FR_INT_ERR;
2296  03c8 a602          	ld	a,#2
2297  03ca 6b05          	ld	(OFST+0,sp),a
2299                     ; 1269 	if (clst >= 2 && clst < fs->n_fatent) {	/* Check if in valid range */
2301  03cc 96            	ldw	x,sp
2302  03cd 1c000a        	addw	x,#OFST+5
2303  03d0 cd0000        	call	c_ltor
2305  03d3 ae0080        	ldw	x,#L001
2306  03d6 cd0000        	call	c_lcmp
2308  03d9 2403cc0475    	jrult	L5011
2310  03de 1e06          	ldw	x,(OFST+1,sp)
2311  03e0 1c0013        	addw	x,#19
2312  03e3 cd0000        	call	c_ltor
2314  03e6 96            	ldw	x,sp
2315  03e7 1c000a        	addw	x,#OFST+5
2316  03ea cd0000        	call	c_lcmp
2318  03ed 23ec          	jrule	L5011
2319                     ; 1270 		switch (fs->fs_type) {
2321  03ef 1e06          	ldw	x,(OFST+1,sp)
2322  03f1 f6            	ld	a,(x)
2323  03f2 a103          	cp	a,#3
2324  03f4 267f          	jrne	L5011
2327                     ; 1295 		case FS_FAT32 :
2327                     ; 1296 #if FF_FS_EXFAT
2327                     ; 1297 		case FS_EXFAT :
2327                     ; 1298 #endif
2327                     ; 1299 			res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 4)));
2329  03f6 96            	ldw	x,sp
2330  03f7 1c000a        	addw	x,#OFST+5
2331  03fa cd0000        	call	c_ltor
2333  03fd a607          	ld	a,#7
2334  03ff cd0000        	call	c_lursh
2336  0402 1e06          	ldw	x,(OFST+1,sp)
2337  0404 1c001f        	addw	x,#31
2338  0407 cd0000        	call	c_ladd
2340  040a be02          	ldw	x,c_lreg+2
2341  040c 89            	pushw	x
2342  040d be00          	ldw	x,c_lreg
2343  040f 89            	pushw	x
2344  0410 1e0a          	ldw	x,(OFST+5,sp)
2345  0412 cd01d0        	call	L316_move_window
2347  0415 5b04          	addw	sp,#4
2348  0417 6b05          	ld	(OFST+0,sp),a
2350                     ; 1300 			if (res != FR_OK) break;
2352  0419 265a          	jrne	L5011
2355                     ; 1302 				val = (val & 0x0FFFFFFF) | (ld_dword(fs->win + clst * 4 % SS(fs)) & 0xF0000000);
2357  041b 1e0c          	ldw	x,(OFST+7,sp)
2358  041d 58            	sllw	x
2359  041e 58            	sllw	x
2360  041f 02            	rlwa	x,a
2361  0420 a401          	and	a,#1
2362  0422 01            	rrwa	x,a
2363  0423 72fb06        	addw	x,(OFST+1,sp)
2364  0426 1c002f        	addw	x,#47
2365  0429 cd000d        	call	L34_ld_dword
2367  042c 3f03          	clr	c_lreg+3
2368  042e 3f02          	clr	c_lreg+2
2369  0430 3f01          	clr	c_lreg+1
2370  0432 b600          	ld	a,c_lreg
2371  0434 a4f0          	and	a,#240
2372  0436 b700          	ld	c_lreg,a
2373  0438 96            	ldw	x,sp
2374  0439 5c            	incw	x
2375  043a cd0000        	call	c_rtol
2378  043d 96            	ldw	x,sp
2379  043e 1c000e        	addw	x,#OFST+9
2380  0441 cd0000        	call	c_ltor
2382  0444 b600          	ld	a,c_lreg
2383  0446 a40f          	and	a,#15
2384  0448 b700          	ld	c_lreg,a
2385  044a 96            	ldw	x,sp
2386  044b 5c            	incw	x
2387  044c cd0000        	call	c_lor
2389  044f 96            	ldw	x,sp
2390  0450 1c000e        	addw	x,#OFST+9
2391  0453 cd0000        	call	c_rtol
2393                     ; 1304 			st_dword(fs->win + clst * 4 % SS(fs), val);
2395  0456 1e10          	ldw	x,(OFST+11,sp)
2396  0458 89            	pushw	x
2397  0459 1e10          	ldw	x,(OFST+11,sp)
2398  045b 89            	pushw	x
2399  045c 1e10          	ldw	x,(OFST+11,sp)
2400  045e 58            	sllw	x
2401  045f 58            	sllw	x
2402  0460 02            	rlwa	x,a
2403  0461 a401          	and	a,#1
2404  0463 01            	rrwa	x,a
2405  0464 72fb0a        	addw	x,(OFST+5,sp)
2406  0467 1c002f        	addw	x,#47
2407  046a cd0090        	call	L311_st_dword
2409  046d 5b04          	addw	sp,#4
2410                     ; 1305 			fs->wflag = 1;
2412  046f 1e06          	ldw	x,(OFST+1,sp)
2413  0471 a601          	ld	a,#1
2414  0473 e703          	ld	(3,x),a
2415                     ; 1306 			break;
2417  0475               L5011:
2418                     ; 1309 	return res;
2420  0475 7b05          	ld	a,(OFST+0,sp)
2423  0477 5b07          	addw	sp,#7
2424  0479 81            	ret	
2513                     	switch	.const
2514  0084               L421:
2515  0084 00000001      	dc.l	1
2516  0088               L621:
2517  0088 ffffffff      	dc.l	-1
2518                     ; 1451 static FRESULT remove_chain (	/* FR_OK(0):succeeded, !=0:error */
2518                     ; 1452 	FFOBJID* obj,		/* Corresponding object */
2518                     ; 1453 	DWORD clst,			/* Cluster to remove a chain from */
2518                     ; 1454 	DWORD pclst			/* Previous cluster of clst (0 if entire chain) */
2518                     ; 1455 )
2518                     ; 1456 {
2519                     	switch	.text
2520  047a               L5111_remove_chain:
2522  047a 89            	pushw	x
2523  047b 520b          	subw	sp,#11
2524       0000000b      OFST:	set	11
2527                     ; 1457 	FRESULT res = FR_OK;
2529                     ; 1459 	FATFS *fs = obj->fs;
2531  047d fe            	ldw	x,(x)
2532  047e 1f0a          	ldw	(OFST-1,sp),x
2534                     ; 1467 	if (clst < 2 || clst >= fs->n_fatent) return FR_INT_ERR;	/* Check if in valid range */
2536  0480 96            	ldw	x,sp
2537  0481 1c0010        	addw	x,#OFST+5
2538  0484 cd0000        	call	c_ltor
2540  0487 ae0080        	ldw	x,#L001
2541  048a cd0000        	call	c_lcmp
2543  048d 2511          	jrult	L7611
2545  048f 1e0a          	ldw	x,(OFST-1,sp)
2546  0491 1c0013        	addw	x,#19
2547  0494 cd0000        	call	c_ltor
2549  0497 96            	ldw	x,sp
2550  0498 1c0010        	addw	x,#OFST+5
2551  049b cd0000        	call	c_lcmp
2553  049e 2204          	jrugt	L5611
2554  04a0               L7611:
2557  04a0 a602          	ld	a,#2
2559  04a2 201f          	jra	L231
2560  04a4               L5611:
2561                     ; 1470 	if (pclst != 0 && (!FF_FS_EXFAT || fs->fs_type != FS_EXFAT || obj->stat != 2)) {
2563  04a4 96            	ldw	x,sp
2564  04a5 1c0014        	addw	x,#OFST+9
2565  04a8 cd0000        	call	c_lzmp
2567  04ab 2719          	jreq	L5711
2568                     ; 1471 		res = put_fat(fs, pclst, 0xFFFFFFFF);
2570  04ad aeffff        	ldw	x,#65535
2571  04b0 89            	pushw	x
2572  04b1 89            	pushw	x
2573  04b2 1e1a          	ldw	x,(OFST+15,sp)
2574  04b4 89            	pushw	x
2575  04b5 1e1a          	ldw	x,(OFST+15,sp)
2576  04b7 89            	pushw	x
2577  04b8 1e12          	ldw	x,(OFST+7,sp)
2578  04ba cd03c5        	call	L5401_put_fat
2580  04bd 5b08          	addw	sp,#8
2581  04bf 6b05          	ld	(OFST-6,sp),a
2583                     ; 1472 		if (res != FR_OK) return res;
2585  04c1 2703          	jreq	L5711
2589  04c3               L231:
2591  04c3 5b0d          	addw	sp,#13
2592  04c5 81            	ret	
2593  04c6               L5711:
2594                     ; 1477 		nxt = get_fat(obj, clst);			/* Get cluster status */
2596  04c6 1e12          	ldw	x,(OFST+7,sp)
2597  04c8 89            	pushw	x
2598  04c9 1e12          	ldw	x,(OFST+7,sp)
2599  04cb 89            	pushw	x
2600  04cc 1e10          	ldw	x,(OFST+5,sp)
2601  04ce cd033f        	call	L737_get_fat
2603  04d1 5b04          	addw	sp,#4
2604  04d3 96            	ldw	x,sp
2605  04d4 1c0006        	addw	x,#OFST-5
2606  04d7 cd0000        	call	c_rtol
2609                     ; 1478 		if (nxt == 0) break;				/* Empty cluster? */
2611  04da 96            	ldw	x,sp
2612  04db 1c0006        	addw	x,#OFST-5
2613  04de cd0000        	call	c_lzmp
2615  04e1 2603cc056f    	jreq	L1021
2618                     ; 1479 		if (nxt == 1) return FR_INT_ERR;	/* Internal error? */
2620  04e6 96            	ldw	x,sp
2621  04e7 1c0006        	addw	x,#OFST-5
2622  04ea cd0000        	call	c_ltor
2624  04ed ae0084        	ldw	x,#L421
2625  04f0 cd0000        	call	c_lcmp
2627  04f3 2604          	jrne	L5021
2630  04f5 a602          	ld	a,#2
2632  04f7 20ca          	jra	L231
2633  04f9               L5021:
2634                     ; 1480 		if (nxt == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error? */
2636  04f9 96            	ldw	x,sp
2637  04fa 1c0006        	addw	x,#OFST-5
2638  04fd cd0000        	call	c_ltor
2640  0500 ae0088        	ldw	x,#L621
2641  0503 cd0000        	call	c_lcmp
2643  0506 2604          	jrne	L7021
2646  0508 a601          	ld	a,#1
2648  050a 20b7          	jra	L231
2649  050c               L7021:
2650                     ; 1482 			res = put_fat(fs, clst, 0);		/* Mark the cluster 'free' on the FAT */
2652  050c 5f            	clrw	x
2653  050d 89            	pushw	x
2654  050e 89            	pushw	x
2655  050f 1e16          	ldw	x,(OFST+11,sp)
2656  0511 89            	pushw	x
2657  0512 1e16          	ldw	x,(OFST+11,sp)
2658  0514 89            	pushw	x
2659  0515 1e12          	ldw	x,(OFST+7,sp)
2660  0517 cd03c5        	call	L5401_put_fat
2662  051a 5b08          	addw	sp,#8
2663  051c 6b05          	ld	(OFST-6,sp),a
2665                     ; 1483 			if (res != FR_OK) return res;
2670  051e 26a3          	jrne	L231
2671                     ; 1485 		if (fs->free_clst < fs->n_fatent - 2) {	/* Update FSINFO */
2673  0520 1e0a          	ldw	x,(OFST-1,sp)
2674  0522 1c0013        	addw	x,#19
2675  0525 cd0000        	call	c_ltor
2677  0528 a602          	ld	a,#2
2678  052a cd0000        	call	c_lsbc
2680  052d 96            	ldw	x,sp
2681  052e 5c            	incw	x
2682  052f cd0000        	call	c_rtol
2685  0532 1e0a          	ldw	x,(OFST-1,sp)
2686  0534 1c000f        	addw	x,#15
2687  0537 cd0000        	call	c_ltor
2689  053a 96            	ldw	x,sp
2690  053b 5c            	incw	x
2691  053c cd0000        	call	c_lcmp
2693  053f 2412          	jruge	L3121
2694                     ; 1486 			fs->free_clst++;
2696  0541 1e0a          	ldw	x,(OFST-1,sp)
2697  0543 1c000f        	addw	x,#15
2698  0546 a601          	ld	a,#1
2699  0548 cd0000        	call	c_lgadc
2701                     ; 1487 			fs->fsi_flag |= 1;
2703  054b 1e0a          	ldw	x,(OFST-1,sp)
2704  054d e604          	ld	a,(4,x)
2705  054f aa01          	or	a,#1
2706  0551 e704          	ld	(4,x),a
2707  0553               L3121:
2708                     ; 1507 		clst = nxt;					/* Next cluster */
2710  0553 1e08          	ldw	x,(OFST-3,sp)
2711  0555 1f12          	ldw	(OFST+7,sp),x
2712  0557 1e06          	ldw	x,(OFST-5,sp)
2713  0559 1f10          	ldw	(OFST+5,sp),x
2714                     ; 1508 	} while (clst < fs->n_fatent);	/* Repeat while not the last link */
2716  055b 1e0a          	ldw	x,(OFST-1,sp)
2717  055d 1c0013        	addw	x,#19
2718  0560 cd0000        	call	c_ltor
2720  0563 96            	ldw	x,sp
2721  0564 1c0010        	addw	x,#OFST+5
2722  0567 cd0000        	call	c_lcmp
2724  056a 2303cc04c6    	jrugt	L5711
2725  056f               L1021:
2726                     ; 1536 	return FR_OK;
2728  056f 4f            	clr	a
2730  0570 cc04c3        	jra	L231
2827                     ; 1546 static DWORD create_chain (	/* 0:No free cluster, 1:Internal error, 0xFFFFFFFF:Disk error, >=2:New cluster# */
2827                     ; 1547 	FFOBJID* obj,		/* Corresponding object */
2827                     ; 1548 	DWORD clst			/* Cluster# to stretch, 0:Create a new chain */
2827                     ; 1549 )
2827                     ; 1550 {
2828                     	switch	.text
2829  0573               L5121_create_chain:
2831  0573 89            	pushw	x
2832  0574 5213          	subw	sp,#19
2833       00000013      OFST:	set	19
2836                     ; 1553 	FATFS *fs = obj->fs;
2838  0576 fe            	ldw	x,(x)
2839  0577 1f0a          	ldw	(OFST-9,sp),x
2841                     ; 1556 	if (clst == 0) {	/* Create a new chain */
2843  0579 96            	ldw	x,sp
2844  057a 1c0018        	addw	x,#OFST+5
2845  057d cd0000        	call	c_lzmp
2847  0580 262f          	jrne	L1721
2848                     ; 1557 		scl = fs->last_clst;				/* Suggested cluster to start to find */
2850  0582 1e0a          	ldw	x,(OFST-9,sp)
2851  0584 9093          	ldw	y,x
2852  0586 ee0d          	ldw	x,(13,x)
2853  0588 1f08          	ldw	(OFST-11,sp),x
2854  058a 93            	ldw	x,y
2855  058b ee0b          	ldw	x,(11,x)
2856  058d 1f06          	ldw	(OFST-13,sp),x
2858                     ; 1558 		if (scl == 0 || scl >= fs->n_fatent) scl = 1;
2860  058f 96            	ldw	x,sp
2861  0590 1c0006        	addw	x,#OFST-13
2862  0593 cd0000        	call	c_lzmp
2864  0596 2711          	jreq	L5721
2866  0598 1e0a          	ldw	x,(OFST-9,sp)
2867  059a 1c0013        	addw	x,#19
2868  059d cd0000        	call	c_ltor
2870  05a0 96            	ldw	x,sp
2871  05a1 1c0006        	addw	x,#OFST-13
2872  05a4 cd0000        	call	c_lcmp
2874  05a7 2257          	jrugt	L7721
2875  05a9               L5721:
2878  05a9 ae0001        	ldw	x,#1
2879  05ac 1f08          	ldw	(OFST-11,sp),x
2880  05ae 5f            	clrw	x
2881  05af 204d          	jp	LC008
2882  05b1               L1721:
2883                     ; 1561 		cs = get_fat(obj, clst);			/* Check the cluster status */
2885  05b1 1e1a          	ldw	x,(OFST+7,sp)
2886  05b3 89            	pushw	x
2887  05b4 1e1a          	ldw	x,(OFST+7,sp)
2888  05b6 89            	pushw	x
2889  05b7 1e18          	ldw	x,(OFST+5,sp)
2890  05b9 cd033f        	call	L737_get_fat
2892  05bc 5b04          	addw	sp,#4
2893  05be 96            	ldw	x,sp
2894  05bf 1c0010        	addw	x,#OFST-3
2895  05c2 cd0000        	call	c_rtol
2898                     ; 1562 		if (cs < 2) return 1;				/* Test for insanity */
2900  05c5 96            	ldw	x,sp
2901  05c6 1c0010        	addw	x,#OFST-3
2902  05c9 cd07db        	call	LC011
2904  05cc 2409          	jruge	L1031
2907  05ce ae0001        	ldw	x,#1
2908  05d1 bf02          	ldw	c_lreg+2,x
2909  05d3 5f            	clrw	x
2911  05d4 cc06f0        	jp	LC007
2912  05d7               L1031:
2913                     ; 1563 		if (cs == 0xFFFFFFFF) return cs;	/* Test for disk error */
2915  05d7 96            	ldw	x,sp
2916  05d8 cd07cf        	call	LC010
2918  05db 260a          	jrne	L3031
2921  05dd               LC006:
2925  05dd 96            	ldw	x,sp
2926  05de 1c0010        	addw	x,#OFST-3
2927  05e1               LC005:
2928  05e1 cd0000        	call	c_ltor
2931  05e4               L451:
2933  05e4 5b15          	addw	sp,#21
2934  05e6 81            	ret	
2935  05e7               L3031:
2936                     ; 1564 		if (cs < fs->n_fatent) return cs;	/* It is already followed by next cluster */
2938  05e7 1e0a          	ldw	x,(OFST-9,sp)
2939  05e9 1c0013        	addw	x,#19
2940  05ec cd0000        	call	c_ltor
2942  05ef 96            	ldw	x,sp
2943  05f0 1c0010        	addw	x,#OFST-3
2944  05f3 cd0000        	call	c_lcmp
2949  05f6 22e5          	jrugt	LC006
2950                     ; 1565 		scl = clst;							/* Cluster to start to find */
2952  05f8 1e1a          	ldw	x,(OFST+7,sp)
2953  05fa 1f08          	ldw	(OFST-11,sp),x
2954  05fc 1e18          	ldw	x,(OFST+5,sp)
2955  05fe               LC008:
2956  05fe 1f06          	ldw	(OFST-13,sp),x
2958  0600               L7721:
2959                     ; 1567 	if (fs->free_clst == 0) return 0;		/* No free cluster */
2961  0600 1e0a          	ldw	x,(OFST-9,sp)
2962  0602 1c000f        	addw	x,#15
2963  0605 cd0000        	call	c_lzmp
2967  0608 2603cc06ed    	jreq	LC009
2968                     ; 1596 		ncl = 0;
2970  060d 5f            	clrw	x
2971  060e 1f0e          	ldw	(OFST-5,sp),x
2972  0610 1f0c          	ldw	(OFST-7,sp),x
2974                     ; 1597 		if (scl == clst) {						/* Stretching an existing chain? */
2976  0612 96            	ldw	x,sp
2977  0613 1c0006        	addw	x,#OFST-13
2978  0616 cd0000        	call	c_ltor
2980  0619 96            	ldw	x,sp
2981  061a 1c0018        	addw	x,#OFST+5
2982  061d cd0000        	call	c_lcmp
2984  0620 2703cc06b1    	jrne	L1131
2985                     ; 1598 			ncl = scl + 1;						/* Test if next cluster is free */
2987  0625 96            	ldw	x,sp
2988  0626 1c0006        	addw	x,#OFST-13
2989  0629 cd0000        	call	c_ltor
2991  062c a601          	ld	a,#1
2992  062e cd0000        	call	c_ladc
2994  0631 96            	ldw	x,sp
2995  0632 1c000c        	addw	x,#OFST-7
2996  0635 cd0000        	call	c_rtol
2999                     ; 1599 			if (ncl >= fs->n_fatent) ncl = 2;
3001  0638 1e0a          	ldw	x,(OFST-9,sp)
3002  063a 1c0013        	addw	x,#19
3003  063d cd0000        	call	c_ltor
3005  0640 96            	ldw	x,sp
3006  0641 1c000c        	addw	x,#OFST-7
3007  0644 cd0000        	call	c_lcmp
3009  0647 2208          	jrugt	L3131
3012  0649 ae0002        	ldw	x,#2
3013  064c 1f0e          	ldw	(OFST-5,sp),x
3014  064e 5f            	clrw	x
3015  064f 1f0c          	ldw	(OFST-7,sp),x
3017  0651               L3131:
3018                     ; 1600 			cs = get_fat(obj, ncl);				/* Get next cluster status */
3020  0651 1e0e          	ldw	x,(OFST-5,sp)
3021  0653 89            	pushw	x
3022  0654 1e0e          	ldw	x,(OFST-5,sp)
3023  0656 89            	pushw	x
3024  0657 1e18          	ldw	x,(OFST+5,sp)
3025  0659 cd033f        	call	L737_get_fat
3027  065c 5b04          	addw	sp,#4
3028  065e 96            	ldw	x,sp
3029  065f 1c0010        	addw	x,#OFST-3
3030  0662 cd0000        	call	c_rtol
3033                     ; 1601 			if (cs == 1 || cs == 0xFFFFFFFF) return cs;	/* Test for error */
3035  0665 96            	ldw	x,sp
3036  0666 cd07e4        	call	LC012
3038  0669 2603cc05dd    	jreq	LC006
3040  066e 96            	ldw	x,sp
3041  066f cd07cf        	call	LC010
3046  0672 27f7          	jreq	LC006
3047                     ; 1602 			if (cs != 0) {						/* Not free? */
3049  0674 96            	ldw	x,sp
3050  0675 1c0010        	addw	x,#OFST-3
3051  0678 cd0000        	call	c_lzmp
3053  067b 2734          	jreq	L1131
3054                     ; 1603 				cs = fs->last_clst;				/* Start at suggested cluster if it is valid */
3056  067d 1e0a          	ldw	x,(OFST-9,sp)
3057  067f 9093          	ldw	y,x
3058  0681 ee0d          	ldw	x,(13,x)
3059  0683 1f12          	ldw	(OFST-1,sp),x
3060  0685 93            	ldw	x,y
3061  0686 ee0b          	ldw	x,(11,x)
3062  0688 1f10          	ldw	(OFST-3,sp),x
3064                     ; 1604 				if (cs >= 2 && cs < fs->n_fatent) scl = cs;
3066  068a 96            	ldw	x,sp
3067  068b 1c0010        	addw	x,#OFST-3
3068  068e cd07db        	call	LC011
3070  0691 2519          	jrult	L3231
3072  0693 1e0a          	ldw	x,(OFST-9,sp)
3073  0695 1c0013        	addw	x,#19
3074  0698 cd0000        	call	c_ltor
3076  069b 96            	ldw	x,sp
3077  069c 1c0010        	addw	x,#OFST-3
3078  069f cd0000        	call	c_lcmp
3080  06a2 2308          	jrule	L3231
3083  06a4 1e12          	ldw	x,(OFST-1,sp)
3084  06a6 1f08          	ldw	(OFST-11,sp),x
3085  06a8 1e10          	ldw	x,(OFST-3,sp)
3086  06aa 1f06          	ldw	(OFST-13,sp),x
3088  06ac               L3231:
3089                     ; 1605 				ncl = 0;
3091  06ac 5f            	clrw	x
3092  06ad 1f0e          	ldw	(OFST-5,sp),x
3093  06af 1f0c          	ldw	(OFST-7,sp),x
3095  06b1               L1131:
3096                     ; 1608 		if (ncl == 0) {	/* The new cluster cannot be contiguous and find another fragment */
3098  06b1 96            	ldw	x,sp
3099  06b2 1c000c        	addw	x,#OFST-7
3100  06b5 cd0000        	call	c_lzmp
3102  06b8 2679          	jrne	L5231
3103                     ; 1609 			ncl = scl;	/* Start cluster */
3105  06ba 1e08          	ldw	x,(OFST-11,sp)
3106  06bc 1f0e          	ldw	(OFST-5,sp),x
3107  06be 1e06          	ldw	x,(OFST-13,sp)
3108  06c0 1f0c          	ldw	(OFST-7,sp),x
3110  06c2               L7231:
3111                     ; 1611 				ncl++;							/* Next cluster */
3113  06c2 96            	ldw	x,sp
3114  06c3 1c000c        	addw	x,#OFST-7
3115  06c6 a601          	ld	a,#1
3116  06c8 cd0000        	call	c_lgadc
3119                     ; 1612 				if (ncl >= fs->n_fatent) {		/* Check wrap-around */
3121  06cb 1e0a          	ldw	x,(OFST-9,sp)
3122  06cd 1c0013        	addw	x,#19
3123  06d0 cd0000        	call	c_ltor
3125  06d3 96            	ldw	x,sp
3126  06d4 1c000c        	addw	x,#OFST-7
3127  06d7 cd0000        	call	c_lcmp
3129  06da 2219          	jrugt	L3331
3130                     ; 1613 					ncl = 2;
3132  06dc ae0002        	ldw	x,#2
3133  06df 1f0e          	ldw	(OFST-5,sp),x
3134  06e1 5f            	clrw	x
3135  06e2 1f0c          	ldw	(OFST-7,sp),x
3137                     ; 1614 					if (ncl > scl) return 0;	/* No free cluster found? */
3139  06e4 96            	ldw	x,sp
3140  06e5 1c0006        	addw	x,#OFST-13
3141  06e8 cd07db        	call	LC011
3143  06eb 2408          	jruge	L3331
3146  06ed               LC009:
3149  06ed 5f            	clrw	x
3150  06ee bf02          	ldw	c_lreg+2,x
3151  06f0               LC007:
3152  06f0 bf00          	ldw	c_lreg,x
3154  06f2 cc05e4        	jra	L451
3155  06f5               L3331:
3156                     ; 1616 				cs = get_fat(obj, ncl);			/* Get the cluster status */
3158  06f5 1e0e          	ldw	x,(OFST-5,sp)
3159  06f7 89            	pushw	x
3160  06f8 1e0e          	ldw	x,(OFST-5,sp)
3161  06fa 89            	pushw	x
3162  06fb 1e18          	ldw	x,(OFST+5,sp)
3163  06fd cd033f        	call	L737_get_fat
3165  0700 5b04          	addw	sp,#4
3166  0702 96            	ldw	x,sp
3167  0703 1c0010        	addw	x,#OFST-3
3168  0706 cd0000        	call	c_rtol
3171                     ; 1617 				if (cs == 0) break;				/* Found a free cluster? */
3173  0709 96            	ldw	x,sp
3174  070a 1c0010        	addw	x,#OFST-3
3175  070d cd0000        	call	c_lzmp
3177  0710 2721          	jreq	L5231
3180                     ; 1618 				if (cs == 1 || cs == 0xFFFFFFFF) return cs;	/* Test for error */
3182  0712 96            	ldw	x,sp
3183  0713 cd07e4        	call	LC012
3185  0716 2603cc05dd    	jreq	LC006
3187  071b 96            	ldw	x,sp
3188  071c cd07cf        	call	LC010
3193  071f 27f7          	jreq	LC006
3194                     ; 1619 				if (ncl == scl) return 0;		/* No free cluster found? */
3196  0721 96            	ldw	x,sp
3197  0722 1c000c        	addw	x,#OFST-7
3198  0725 cd0000        	call	c_ltor
3200  0728 96            	ldw	x,sp
3201  0729 1c0006        	addw	x,#OFST-13
3202  072c cd0000        	call	c_lcmp
3204  072f 2691          	jrne	L7231
3207  0731 20ba          	jp	LC009
3208  0733               L5231:
3209                     ; 1622 		res = put_fat(fs, ncl, 0xFFFFFFFF);		/* Mark the new cluster 'EOC' */
3211  0733 aeffff        	ldw	x,#65535
3212  0736 89            	pushw	x
3213  0737 89            	pushw	x
3214  0738 1e12          	ldw	x,(OFST-1,sp)
3215  073a 89            	pushw	x
3216  073b 1e12          	ldw	x,(OFST-1,sp)
3217  073d 89            	pushw	x
3218  073e 1e12          	ldw	x,(OFST-1,sp)
3219  0740 cd03c5        	call	L5401_put_fat
3221  0743 5b08          	addw	sp,#8
3222  0745 6b05          	ld	(OFST-14,sp),a
3224                     ; 1623 		if (res == FR_OK && clst != 0) {
3226  0747 261e          	jrne	L7431
3228  0749 96            	ldw	x,sp
3229  074a 1c0018        	addw	x,#OFST+5
3230  074d cd0000        	call	c_lzmp
3232  0750 2715          	jreq	L7431
3233                     ; 1624 			res = put_fat(fs, clst, ncl);		/* Link it from the previous one if needed */
3235  0752 1e0e          	ldw	x,(OFST-5,sp)
3236  0754 89            	pushw	x
3237  0755 1e0e          	ldw	x,(OFST-5,sp)
3238  0757 89            	pushw	x
3239  0758 1e1e          	ldw	x,(OFST+11,sp)
3240  075a 89            	pushw	x
3241  075b 1e1e          	ldw	x,(OFST+11,sp)
3242  075d 89            	pushw	x
3243  075e 1e12          	ldw	x,(OFST-1,sp)
3244  0760 cd03c5        	call	L5401_put_fat
3246  0763 5b08          	addw	sp,#8
3247  0765 6b05          	ld	(OFST-14,sp),a
3249  0767               L7431:
3250                     ; 1628 	if (res == FR_OK) {			/* Update FSINFO if function succeeded. */
3252  0767 7b05          	ld	a,(OFST-14,sp)
3253  0769 2645          	jrne	L1531
3254                     ; 1629 		fs->last_clst = ncl;
3256  076b 1e0a          	ldw	x,(OFST-9,sp)
3257  076d 7b0f          	ld	a,(OFST-4,sp)
3258  076f e70e          	ld	(14,x),a
3259  0771 7b0e          	ld	a,(OFST-5,sp)
3260  0773 e70d          	ld	(13,x),a
3261  0775 7b0d          	ld	a,(OFST-6,sp)
3262  0777 e70c          	ld	(12,x),a
3263  0779 7b0c          	ld	a,(OFST-7,sp)
3264  077b e70b          	ld	(11,x),a
3265                     ; 1630 		if (fs->free_clst <= fs->n_fatent - 2) fs->free_clst--;
3267  077d 1c0013        	addw	x,#19
3268  0780 cd0000        	call	c_ltor
3270  0783 a602          	ld	a,#2
3271  0785 cd0000        	call	c_lsbc
3273  0788 96            	ldw	x,sp
3274  0789 5c            	incw	x
3275  078a cd0000        	call	c_rtol
3278  078d 1e0a          	ldw	x,(OFST-9,sp)
3279  078f 1c000f        	addw	x,#15
3280  0792 cd0000        	call	c_ltor
3282  0795 96            	ldw	x,sp
3283  0796 5c            	incw	x
3284  0797 cd0000        	call	c_lcmp
3286  079a 220a          	jrugt	L3531
3289  079c 1e0a          	ldw	x,(OFST-9,sp)
3290  079e 1c000f        	addw	x,#15
3291  07a1 a601          	ld	a,#1
3292  07a3 cd0000        	call	c_lgsbc
3294  07a6               L3531:
3295                     ; 1631 		fs->fsi_flag |= 1;
3297  07a6 1e0a          	ldw	x,(OFST-9,sp)
3298  07a8 e604          	ld	a,(4,x)
3299  07aa aa01          	or	a,#1
3300  07ac e704          	ld	(4,x),a
3302  07ae 2018          	jra	L5531
3303  07b0               L1531:
3304                     ; 1633 		ncl = (res == FR_DISK_ERR) ? 0xFFFFFFFF : 1;	/* Failed. Generate error status */
3306  07b0 4a            	dec	a
3307  07b1 2608          	jrne	L051
3308  07b3 ae0088        	ldw	x,#L621
3309  07b6 cd0000        	call	c_ltor
3311  07b9 2006          	jra	L251
3312  07bb               L051:
3313  07bb ae0001        	ldw	x,#1
3314  07be cd0000        	call	c_itolx
3316  07c1               L251:
3317  07c1 96            	ldw	x,sp
3318  07c2 1c000c        	addw	x,#OFST-7
3319  07c5 cd0000        	call	c_rtol
3322  07c8               L5531:
3323                     ; 1636 	return ncl;		/* Return new cluster number or error status */
3325  07c8 96            	ldw	x,sp
3326  07c9 1c000c        	addw	x,#OFST-7
3329  07cc cc05e1        	jp	LC005
3330  07cf               LC010:
3331  07cf 1c0010        	addw	x,#OFST-3
3332  07d2 cd0000        	call	c_ltor
3334  07d5 ae0088        	ldw	x,#L621
3335  07d8 cc0000        	jp	c_lcmp
3336  07db               LC011:
3337  07db cd0000        	call	c_ltor
3339  07de ae0080        	ldw	x,#L001
3340  07e1 cc0000        	jp	c_lcmp
3341  07e4               LC012:
3342  07e4 1c0010        	addw	x,#OFST-3
3343  07e7 cd0000        	call	c_ltor
3345  07ea ae0084        	ldw	x,#L421
3346  07ed cc0000        	jp	c_lcmp
3434                     ; 1679 static FRESULT dir_clear (	/* Returns FR_OK or FR_DISK_ERR */
3434                     ; 1680 	FATFS *fs,		/* Filesystem object */
3434                     ; 1681 	DWORD clst		/* Directory table to clear */
3434                     ; 1682 )
3434                     ; 1683 {
3435                     	switch	.text
3436  07f0               L7531_dir_clear:
3438  07f0 89            	pushw	x
3439  07f1 520a          	subw	sp,#10
3440       0000000a      OFST:	set	10
3443                     ; 1689 	if (sync_window(fs) != FR_OK) return FR_DISK_ERR;	/* Flush disk access window */
3445  07f3 cd014f        	call	L524_sync_window
3447  07f6 4d            	tnz	a
3450  07f7 2703cc087f    	jrne	L071
3451                     ; 1690 	sect = clst2sect(fs, clst);		/* Top of the cluster */
3453  07fc 1e11          	ldw	x,(OFST+7,sp)
3454  07fe 89            	pushw	x
3455  07ff 1e11          	ldw	x,(OFST+7,sp)
3456  0801 89            	pushw	x
3457  0802 1e0f          	ldw	x,(OFST+5,sp)
3458  0804 cd02ff        	call	L707_clst2sect
3460  0807 5b04          	addw	sp,#4
3461  0809 96            	ldw	x,sp
3462  080a 1c0003        	addw	x,#OFST-7
3463  080d cd0000        	call	c_rtol
3466                     ; 1691 	fs->winsect = sect;				/* Set window to top of the cluster */
3468  0810 1e0b          	ldw	x,(OFST+1,sp)
3469  0812 7b06          	ld	a,(OFST-4,sp)
3470  0814 e72e          	ld	(46,x),a
3471  0816 7b05          	ld	a,(OFST-5,sp)
3472  0818 e72d          	ld	(45,x),a
3473  081a 7b04          	ld	a,(OFST-6,sp)
3474  081c e72c          	ld	(44,x),a
3475  081e 7b03          	ld	a,(OFST-7,sp)
3476  0820 e72b          	ld	(43,x),a
3477                     ; 1692 	mem_set(fs->win, 0, sizeof fs->win);	/* Clear window buffer */
3479  0822 ae0200        	ldw	x,#512
3480  0825 89            	pushw	x
3481  0826 5f            	clrw	x
3482  0827 89            	pushw	x
3483  0828 1e0f          	ldw	x,(OFST+5,sp)
3484  082a 1c002f        	addw	x,#47
3485  082d cd00e2        	call	L702_mem_set
3487  0830 5b04          	addw	sp,#4
3488                     ; 1704 		ibuf = fs->win; szb = 1;	/* Use window buffer (many single-sector writes may take a time) */
3490  0832 1e0b          	ldw	x,(OFST+1,sp)
3491  0834 1c002f        	addw	x,#47
3492  0837 1f01          	ldw	(OFST-9,sp),x
3496  0839 ae0001        	ldw	x,#1
3497  083c 1f07          	ldw	(OFST-3,sp),x
3499                     ; 1705 		for (n = 0; n < fs->csize && disk_write(fs->pdrv, ibuf, sect + n, szb) == RES_OK; n += szb) ;	/* Fill the cluster with 0 */
3501  083e 5f            	clrw	x
3503  083f 2005          	jra	L3341
3504  0841               L7241:
3508  0841 1e09          	ldw	x,(OFST-1,sp)
3509  0843 72fb07        	addw	x,(OFST-3,sp)
3510  0846               L3341:
3511  0846 1f09          	ldw	(OFST-1,sp),x
3515  0848 1e0b          	ldw	x,(OFST+1,sp)
3516  084a ee09          	ldw	x,(9,x)
3517  084c 1309          	cpw	x,(OFST-1,sp)
3518  084e 2324          	jrule	L7341
3520  0850 1e07          	ldw	x,(OFST-3,sp)
3521  0852 89            	pushw	x
3522  0853 1e0b          	ldw	x,(OFST+1,sp)
3523  0855 cd0000        	call	c_uitolx
3525  0858 96            	ldw	x,sp
3526  0859 1c0005        	addw	x,#OFST-5
3527  085c cd0000        	call	c_ladd
3529  085f be02          	ldw	x,c_lreg+2
3530  0861 89            	pushw	x
3531  0862 be00          	ldw	x,c_lreg
3532  0864 89            	pushw	x
3533  0865 1e07          	ldw	x,(OFST-3,sp)
3534  0867 89            	pushw	x
3535  0868 1e13          	ldw	x,(OFST+9,sp)
3536  086a e601          	ld	a,(1,x)
3537  086c cd0000        	call	_disk_write
3539  086f 5b08          	addw	sp,#8
3540  0871 4d            	tnz	a
3541  0872 27cd          	jreq	L7241
3542  0874               L7341:
3543                     ; 1707 	return (n == fs->csize) ? FR_OK : FR_DISK_ERR;
3545  0874 1e0b          	ldw	x,(OFST+1,sp)
3546  0876 ee09          	ldw	x,(9,x)
3547  0878 1309          	cpw	x,(OFST-1,sp)
3548  087a 2603          	jrne	L071
3549  087c 4f            	clr	a
3550  087d 2002          	jra	L271
3551  087f               L071:
3553  087f a601          	ld	a,#1
3554  0881               L271:
3557  0881 5b0c          	addw	sp,#12
3558  0883 81            	ret	
3695                     	switch	.const
3696  008c               L002:
3697  008c 00200000      	dc.l	2097152
3698                     ; 1718 static FRESULT dir_sdi (	/* FR_OK(0):succeeded, !=0:error */
3698                     ; 1719 	DIR* dp,		/* Pointer to directory object */
3698                     ; 1720 	DWORD ofs		/* Offset of directory table */
3698                     ; 1721 )
3698                     ; 1722 {
3699                     	switch	.text
3700  0884               L1441_dir_sdi:
3702  0884 89            	pushw	x
3703  0885 520e          	subw	sp,#14
3704       0000000e      OFST:	set	14
3707                     ; 1724 	FATFS *fs = dp->obj.fs;
3709  0887 fe            	ldw	x,(x)
3710  0888 1f09          	ldw	(OFST-5,sp),x
3712                     ; 1727 	if (ofs >= (DWORD)((FF_FS_EXFAT && fs->fs_type == FS_EXFAT) ? MAX_DIR_EX : MAX_DIR) || ofs % SZDIRE) {	/* Check range of offset and alignment */
3714  088a 96            	ldw	x,sp
3715  088b 1c0013        	addw	x,#OFST+5
3716  088e cd0000        	call	c_ltor
3718  0891 ae008c        	ldw	x,#L002
3719  0894 cd0000        	call	c_lcmp
3721  0897 2464          	jruge	LC014
3723  0899 7b16          	ld	a,(OFST+8,sp)
3724  089b a51f          	bcp	a,#31
3725                     ; 1728 		return FR_INT_ERR;
3727  089d 265e          	jrne	LC014
3728                     ; 1730 	dp->dptr = ofs;				/* Set current offset */
3730  089f 1e0f          	ldw	x,(OFST+1,sp)
3731  08a1 e711          	ld	(17,x),a
3732  08a3 7b15          	ld	a,(OFST+7,sp)
3733  08a5 e710          	ld	(16,x),a
3734  08a7 7b14          	ld	a,(OFST+6,sp)
3735  08a9 e70f          	ld	(15,x),a
3736  08ab 7b13          	ld	a,(OFST+5,sp)
3737  08ad e70e          	ld	(14,x),a
3738                     ; 1731 	clst = dp->obj.sclust;		/* Table start cluster (0:root) */
3740  08af 9093          	ldw	y,x
3741  08b1 ee08          	ldw	x,(8,x)
3742  08b3 1f0d          	ldw	(OFST-1,sp),x
3743  08b5 93            	ldw	x,y
3744  08b6 ee06          	ldw	x,(6,x)
3745  08b8 1f0b          	ldw	(OFST-3,sp),x
3747                     ; 1732 	if (clst == 0 && fs->fs_type >= FS_FAT32) {	/* Replace cluster# 0 with root cluster# */
3749  08ba 96            	ldw	x,sp
3750  08bb 1c000b        	addw	x,#OFST-3
3751  08be cd0000        	call	c_lzmp
3753  08c1 2612          	jrne	L7351
3755  08c3 1e09          	ldw	x,(OFST-5,sp)
3756  08c5 f6            	ld	a,(x)
3757  08c6 a103          	cp	a,#3
3758  08c8 250b          	jrult	L7351
3759                     ; 1733 		clst = (DWORD)fs->dirbase;
3761  08ca 9093          	ldw	y,x
3762  08cc ee25          	ldw	x,(37,x)
3763  08ce 1f0d          	ldw	(OFST-1,sp),x
3764  08d0 93            	ldw	x,y
3765  08d1 ee23          	ldw	x,(35,x)
3766  08d3 1f0b          	ldw	(OFST-3,sp),x
3768  08d5               L7351:
3769                     ; 1737 	if (clst == 0) {	/* Static table (root-directory on the FAT volume) */
3771  08d5 96            	ldw	x,sp
3772  08d6 1c000b        	addw	x,#OFST-3
3773  08d9 cd0000        	call	c_lzmp
3775  08dc 265b          	jrne	L1451
3776                     ; 1738 		if (ofs / SZDIRE >= fs->n_rootdir) return FR_INT_ERR;	/* Is index out of range? */
3778  08de 96            	ldw	x,sp
3779  08df 1c0013        	addw	x,#OFST+5
3780  08e2 cd0000        	call	c_ltor
3782  08e5 a605          	ld	a,#5
3783  08e7 cd0000        	call	c_lursh
3785  08ea 96            	ldw	x,sp
3786  08eb 5c            	incw	x
3787  08ec cd0000        	call	c_rtol
3790  08ef 1e09          	ldw	x,(OFST-5,sp)
3791  08f1 ee07          	ldw	x,(7,x)
3792  08f3 cd0000        	call	c_uitolx
3794  08f6 96            	ldw	x,sp
3795  08f7 5c            	incw	x
3796  08f8 cd0000        	call	c_lcmp
3798  08fb 2205          	jrugt	L3451
3801  08fd               LC014:
3805  08fd a602          	ld	a,#2
3807  08ff               L602:
3809  08ff 5b10          	addw	sp,#16
3810  0901 81            	ret	
3811  0902               L3451:
3812                     ; 1739 		dp->sect = fs->dirbase;
3814  0902 1e09          	ldw	x,(OFST-5,sp)
3815  0904 160f          	ldw	y,(OFST+1,sp)
3816  0906 e626          	ld	a,(38,x)
3817  0908 90e719        	ld	(25,y),a
3818  090b e625          	ld	a,(37,x)
3819  090d 90e718        	ld	(24,y),a
3820  0910 e624          	ld	a,(36,x)
3821  0912 90e717        	ld	(23,y),a
3822  0915 e623          	ld	a,(35,x)
3823  0917 90e716        	ld	(22,y),a
3825  091a               L5451:
3826                     ; 1751 	dp->clust = clst;					/* Current cluster# */
3828  091a 1e0f          	ldw	x,(OFST+1,sp)
3829  091c 7b0e          	ld	a,(OFST+0,sp)
3830  091e e715          	ld	(21,x),a
3831  0920 7b0d          	ld	a,(OFST-1,sp)
3832  0922 e714          	ld	(20,x),a
3833  0924 7b0c          	ld	a,(OFST-2,sp)
3834  0926 e713          	ld	(19,x),a
3835  0928 7b0b          	ld	a,(OFST-3,sp)
3836  092a e712          	ld	(18,x),a
3837                     ; 1752 	if (dp->sect == 0) return FR_INT_ERR;
3839  092c 1c0016        	addw	x,#22
3840  092f cd0000        	call	c_lzmp
3842  0932 2703cc09cb    	jrne	L5651
3845  0937 20c4          	jp	LC014
3846  0939               L1451:
3847                     ; 1742 		csz = (DWORD)fs->csize * SS(fs);	/* Bytes per cluster */
3849  0939 1e09          	ldw	x,(OFST-5,sp)
3850  093b 90ae0200      	ldw	y,#512
3851  093f ee09          	ldw	x,(9,x)
3852  0941 cd0000        	call	c_umul
3854  0944 96            	ldw	x,sp
3855  0945 1c0005        	addw	x,#OFST-9
3856  0948 cd0000        	call	c_rtol
3860  094b 2056          	jra	L3551
3861  094d               L7451:
3862                     ; 1744 			clst = get_fat(&dp->obj, clst);				/* Get next cluster */
3864  094d 89            	pushw	x
3865  094e 1e0d          	ldw	x,(OFST-1,sp)
3866  0950 89            	pushw	x
3867  0951 1e13          	ldw	x,(OFST+5,sp)
3868  0953 cd033f        	call	L737_get_fat
3870  0956 5b04          	addw	sp,#4
3871  0958 96            	ldw	x,sp
3872  0959 1c000b        	addw	x,#OFST-3
3873  095c cd0000        	call	c_rtol
3876                     ; 1745 			if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
3878  095f 96            	ldw	x,sp
3879  0960 1c000b        	addw	x,#OFST-3
3880  0963 cd0000        	call	c_ltor
3882  0966 ae0088        	ldw	x,#L621
3883  0969 cd0000        	call	c_lcmp
3885  096c 2604          	jrne	L7551
3888  096e a601          	ld	a,#1
3890  0970 208d          	jra	L602
3891  0972               L7551:
3892                     ; 1746 			if (clst < 2 || clst >= fs->n_fatent) return FR_INT_ERR;	/* Reached to end of table or internal error */
3894  0972 96            	ldw	x,sp
3895  0973 1c000b        	addw	x,#OFST-3
3896  0976 cd0000        	call	c_ltor
3898  0979 ae0080        	ldw	x,#L001
3899  097c cd0000        	call	c_lcmp
3901  097f 2403cc08fd    	jrult	LC014
3903  0984 1e09          	ldw	x,(OFST-5,sp)
3904  0986 1c0013        	addw	x,#19
3905  0989 cd0000        	call	c_ltor
3907  098c 96            	ldw	x,sp
3908  098d 1c000b        	addw	x,#OFST-3
3909  0990 cd0000        	call	c_lcmp
3913  0993 23ec          	jrule	LC014
3914                     ; 1747 			ofs -= csz;
3916  0995 96            	ldw	x,sp
3917  0996 1c0005        	addw	x,#OFST-9
3918  0999 cd0000        	call	c_ltor
3920  099c 96            	ldw	x,sp
3921  099d 1c0013        	addw	x,#OFST+5
3922  09a0 cd0000        	call	c_lgsub
3924  09a3               L3551:
3925                     ; 1743 		while (ofs >= csz) {				/* Follow cluster chain */
3927  09a3 96            	ldw	x,sp
3928  09a4 1c0013        	addw	x,#OFST+5
3929  09a7 cd0000        	call	c_ltor
3931  09aa 96            	ldw	x,sp
3932  09ab 1c0005        	addw	x,#OFST-9
3933  09ae cd0000        	call	c_lcmp
3935  09b1 1e0d          	ldw	x,(OFST-1,sp)
3936  09b3 2498          	jruge	L7451
3937                     ; 1749 		dp->sect = clst2sect(fs, clst);
3939  09b5 89            	pushw	x
3940  09b6 1e0d          	ldw	x,(OFST-1,sp)
3941  09b8 89            	pushw	x
3942  09b9 1e0d          	ldw	x,(OFST-1,sp)
3943  09bb cd02ff        	call	L707_clst2sect
3945  09be 5b04          	addw	sp,#4
3946  09c0 1e0f          	ldw	x,(OFST+1,sp)
3947  09c2 1c0016        	addw	x,#22
3948  09c5 cd0000        	call	c_rtol
3950  09c8 cc091a        	jra	L5451
3951  09cb               L5651:
3952                     ; 1753 	dp->sect += ofs / SS(fs);			/* Sector# of the directory entry */
3954  09cb 1e0f          	ldw	x,(OFST+1,sp)
3955  09cd 7b16          	ld	a,(OFST+8,sp)
3956  09cf b703          	ld	c_lreg+3,a
3957  09d1 7b15          	ld	a,(OFST+7,sp)
3958  09d3 b702          	ld	c_lreg+2,a
3959  09d5 7b14          	ld	a,(OFST+6,sp)
3960  09d7 b701          	ld	c_lreg+1,a
3961  09d9 7b13          	ld	a,(OFST+5,sp)
3962  09db b700          	ld	c_lreg,a
3963  09dd a609          	ld	a,#9
3964  09df cd0000        	call	c_lursh
3966  09e2 1c0016        	addw	x,#22
3967  09e5 cd0000        	call	c_lgadd
3969                     ; 1754 	dp->dir = fs->win + (ofs % SS(fs));	/* Pointer to the entry in the win[] */
3971  09e8 1e15          	ldw	x,(OFST+7,sp)
3972  09ea 02            	rlwa	x,a
3973  09eb a401          	and	a,#1
3974  09ed 01            	rrwa	x,a
3975  09ee 72fb09        	addw	x,(OFST-5,sp)
3976  09f1 160f          	ldw	y,(OFST+1,sp)
3977  09f3 1c002f        	addw	x,#47
3978  09f6 90ef1a        	ldw	(26,y),x
3979                     ; 1756 	return FR_OK;
3981  09f9 4f            	clr	a
3983  09fa cc08ff        	jra	L602
4064                     ; 1766 static FRESULT dir_next (	/* FR_OK(0):succeeded, FR_NO_FILE:End of table, FR_DENIED:Could not stretch */
4064                     ; 1767 	DIR* dp,				/* Pointer to the directory object */
4064                     ; 1768 	int stretch				/* 0: Do not stretch table, 1: Stretch table if needed */
4064                     ; 1769 )
4064                     ; 1770 {
4065                     	switch	.text
4066  09fd               L7651_dir_next:
4068  09fd 89            	pushw	x
4069  09fe 520e          	subw	sp,#14
4070       0000000e      OFST:	set	14
4073                     ; 1772 	FATFS *fs = dp->obj.fs;
4075  0a00 fe            	ldw	x,(x)
4076  0a01 1f09          	ldw	(OFST-5,sp),x
4078                     ; 1775 	ofs = dp->dptr + SZDIRE;	/* Next entry */
4080  0a03 1e0f          	ldw	x,(OFST+1,sp)
4081  0a05 1c000e        	addw	x,#14
4082  0a08 cd0000        	call	c_ltor
4084  0a0b a620          	ld	a,#32
4085  0a0d cd0000        	call	c_ladc
4087  0a10 96            	ldw	x,sp
4088  0a11 1c0005        	addw	x,#OFST-9
4089  0a14 cd0000        	call	c_rtol
4092                     ; 1776 	if (ofs >= (DWORD)((FF_FS_EXFAT && fs->fs_type == FS_EXFAT) ? MAX_DIR_EX : MAX_DIR)) dp->sect = 0;	/* Disable it if the offset reached the max value */
4094  0a17 96            	ldw	x,sp
4095  0a18 1c0005        	addw	x,#OFST-9
4096  0a1b cd0000        	call	c_ltor
4098  0a1e ae008c        	ldw	x,#L002
4099  0a21 cd0000        	call	c_lcmp
4101  0a24 2505          	jrult	L3361
4104  0a26 1e0f          	ldw	x,(OFST+1,sp)
4105  0a28 cd0b97        	call	LC019
4106  0a2b               L3361:
4107                     ; 1777 	if (dp->sect == 0) return FR_NO_FILE;	/* Report EOT if it has been disabled */
4109  0a2b 1e0f          	ldw	x,(OFST+1,sp)
4110  0a2d 1c0016        	addw	x,#22
4111  0a30 cd0000        	call	c_lzmp
4115  0a33 2744          	jreq	LC015
4116                     ; 1779 	if (ofs % SS(fs) == 0) {	/* Sector changed? */
4118  0a35 1e07          	ldw	x,(OFST-7,sp)
4119  0a37 02            	rlwa	x,a
4120  0a38 a401          	and	a,#1
4121  0a3a 01            	rrwa	x,a
4122  0a3b 5d            	tnzw	x
4123  0a3c 2703cc0b64    	jrne	L7361
4124                     ; 1780 		dp->sect++;				/* Next sector */
4126  0a41 1e0f          	ldw	x,(OFST+1,sp)
4127  0a43 1c0016        	addw	x,#22
4128  0a46 a601          	ld	a,#1
4129  0a48 cd0000        	call	c_lgadc
4131                     ; 1782 		if (dp->clust == 0) {	/* Static table */
4133  0a4b 1e0f          	ldw	x,(OFST+1,sp)
4134  0a4d 1c0012        	addw	x,#18
4135  0a50 cd0000        	call	c_lzmp
4137  0a53 2629          	jrne	L1461
4138                     ; 1783 			if (ofs / SZDIRE >= fs->n_rootdir) {	/* Report EOT if it reached end of static table */
4140  0a55 96            	ldw	x,sp
4141  0a56 1c0005        	addw	x,#OFST-9
4142  0a59 cd0000        	call	c_ltor
4144  0a5c a605          	ld	a,#5
4145  0a5e cd0000        	call	c_lursh
4147  0a61 96            	ldw	x,sp
4148  0a62 5c            	incw	x
4149  0a63 cd0000        	call	c_rtol
4152  0a66 1e09          	ldw	x,(OFST-5,sp)
4153  0a68 ee07          	ldw	x,(7,x)
4154  0a6a cd0000        	call	c_uitolx
4156  0a6d 96            	ldw	x,sp
4157  0a6e 5c            	incw	x
4158  0a6f cd0000        	call	c_lcmp
4160  0a72 22ca          	jrugt	L7361
4161                     ; 1784 				dp->sect = 0; return FR_NO_FILE;
4163  0a74               LC016:
4165  0a74 1e0f          	ldw	x,(OFST+1,sp)
4166  0a76 cd0b97        	call	LC019
4169  0a79               LC015:
4172  0a79 a604          	ld	a,#4
4174  0a7b               L222:
4176  0a7b 5b10          	addw	sp,#16
4177  0a7d 81            	ret	
4178  0a7e               L1461:
4179                     ; 1788 			if ((ofs / SS(fs) & (fs->csize - 1)) == 0) {	/* Cluster changed? */
4181  0a7e 1e09          	ldw	x,(OFST-5,sp)
4182  0a80 ee09          	ldw	x,(9,x)
4183  0a82 5a            	decw	x
4184  0a83 cd0000        	call	c_uitolx
4186  0a86 96            	ldw	x,sp
4187  0a87 5c            	incw	x
4188  0a88 cd0000        	call	c_rtol
4191  0a8b 96            	ldw	x,sp
4192  0a8c 1c0005        	addw	x,#OFST-9
4193  0a8f cd0000        	call	c_ltor
4195  0a92 a609          	ld	a,#9
4196  0a94 cd0000        	call	c_lursh
4198  0a97 96            	ldw	x,sp
4199  0a98 5c            	incw	x
4200  0a99 cd0000        	call	c_land
4202  0a9c cd0000        	call	c_lrzmp
4204  0a9f 269d          	jrne	L7361
4205                     ; 1789 				clst = get_fat(&dp->obj, dp->clust);		/* Get next cluster */
4207  0aa1 1e0f          	ldw	x,(OFST+1,sp)
4208  0aa3 9093          	ldw	y,x
4209  0aa5 ee14          	ldw	x,(20,x)
4210  0aa7 89            	pushw	x
4211  0aa8 93            	ldw	x,y
4212  0aa9 ee12          	ldw	x,(18,x)
4213  0aab 89            	pushw	x
4214  0aac 1e13          	ldw	x,(OFST+5,sp)
4215  0aae cd033f        	call	L737_get_fat
4217  0ab1 5b04          	addw	sp,#4
4218  0ab3 96            	ldw	x,sp
4219  0ab4 1c000b        	addw	x,#OFST-3
4220  0ab7 cd0000        	call	c_rtol
4223                     ; 1790 				if (clst <= 1) return FR_INT_ERR;			/* Internal error */
4225  0aba 96            	ldw	x,sp
4226  0abb 1c000b        	addw	x,#OFST-3
4227  0abe cd0000        	call	c_ltor
4229  0ac1 ae0080        	ldw	x,#L001
4230  0ac4 cd0000        	call	c_lcmp
4232  0ac7 2404          	jruge	L1561
4235  0ac9 a602          	ld	a,#2
4237  0acb 20ae          	jra	L222
4238  0acd               L1561:
4239                     ; 1791 				if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
4241  0acd 96            	ldw	x,sp
4242  0ace cd0b8b        	call	LC018
4246  0ad1 2755          	jreq	LC017
4247                     ; 1792 				if (clst >= fs->n_fatent) {					/* It reached end of dynamic table */
4249  0ad3 1e09          	ldw	x,(OFST-5,sp)
4250  0ad5 1c0013        	addw	x,#19
4251  0ad8 cd0000        	call	c_ltor
4253  0adb 96            	ldw	x,sp
4254  0adc 1c000b        	addw	x,#OFST-3
4255  0adf cd0000        	call	c_lcmp
4257  0ae2 2259          	jrugt	L5561
4258                     ; 1794 					if (!stretch) {								/* If no stretch, report EOT */
4260  0ae4 1e13          	ldw	x,(OFST+5,sp)
4261                     ; 1795 						dp->sect = 0; return FR_NO_FILE;
4264  0ae6 278c          	jreq	LC016
4265                     ; 1797 					clst = create_chain(&dp->obj, dp->clust);	/* Allocate a cluster */
4267  0ae8 1e0f          	ldw	x,(OFST+1,sp)
4268  0aea 9093          	ldw	y,x
4269  0aec ee14          	ldw	x,(20,x)
4270  0aee 89            	pushw	x
4271  0aef 93            	ldw	x,y
4272  0af0 ee12          	ldw	x,(18,x)
4273  0af2 89            	pushw	x
4274  0af3 1e13          	ldw	x,(OFST+5,sp)
4275  0af5 cd0573        	call	L5121_create_chain
4277  0af8 5b04          	addw	sp,#4
4278  0afa 96            	ldw	x,sp
4279  0afb 1c000b        	addw	x,#OFST-3
4280  0afe cd0000        	call	c_rtol
4283                     ; 1798 					if (clst == 0) return FR_DENIED;			/* No free cluster */
4285  0b01 96            	ldw	x,sp
4286  0b02 1c000b        	addw	x,#OFST-3
4287  0b05 cd0000        	call	c_lzmp
4289  0b08 2605          	jrne	L1661
4292  0b0a a607          	ld	a,#7
4294  0b0c cc0a7b        	jra	L222
4295  0b0f               L1661:
4296                     ; 1799 					if (clst == 1) return FR_INT_ERR;			/* Internal error */
4298  0b0f 96            	ldw	x,sp
4299  0b10 1c000b        	addw	x,#OFST-3
4300  0b13 cd0000        	call	c_ltor
4302  0b16 ae0084        	ldw	x,#L421
4303  0b19 cd0000        	call	c_lcmp
4305  0b1c 2605          	jrne	L3661
4308  0b1e a602          	ld	a,#2
4310  0b20 cc0a7b        	jra	L222
4311  0b23               L3661:
4312                     ; 1800 					if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
4314  0b23 96            	ldw	x,sp
4315  0b24 ad65          	call	LC018
4317  0b26 2605          	jrne	L5661
4320  0b28               LC017:
4323  0b28 a601          	ld	a,#1
4325  0b2a cc0a7b        	jra	L222
4326  0b2d               L5661:
4327                     ; 1801 					if (dir_clear(fs, clst) != FR_OK) return FR_DISK_ERR;	/* Clean up the stretched table */
4329  0b2d 1e0d          	ldw	x,(OFST-1,sp)
4330  0b2f 89            	pushw	x
4331  0b30 1e0d          	ldw	x,(OFST-1,sp)
4332  0b32 89            	pushw	x
4333  0b33 1e0d          	ldw	x,(OFST-1,sp)
4334  0b35 cd07f0        	call	L7531_dir_clear
4336  0b38 5b04          	addw	sp,#4
4337  0b3a 4d            	tnz	a
4340  0b3b 26eb          	jrne	LC017
4341  0b3d               L5561:
4342                     ; 1808 				dp->clust = clst;		/* Initialize data for new cluster */
4344  0b3d 1e0f          	ldw	x,(OFST+1,sp)
4345  0b3f 7b0e          	ld	a,(OFST+0,sp)
4346  0b41 e715          	ld	(21,x),a
4347  0b43 7b0d          	ld	a,(OFST-1,sp)
4348  0b45 e714          	ld	(20,x),a
4349  0b47 7b0c          	ld	a,(OFST-2,sp)
4350  0b49 e713          	ld	(19,x),a
4351  0b4b 7b0b          	ld	a,(OFST-3,sp)
4352  0b4d e712          	ld	(18,x),a
4353                     ; 1809 				dp->sect = clst2sect(fs, clst);
4355  0b4f 1e0d          	ldw	x,(OFST-1,sp)
4356  0b51 89            	pushw	x
4357  0b52 1e0d          	ldw	x,(OFST-1,sp)
4358  0b54 89            	pushw	x
4359  0b55 1e0d          	ldw	x,(OFST-1,sp)
4360  0b57 cd02ff        	call	L707_clst2sect
4362  0b5a 5b04          	addw	sp,#4
4363  0b5c 1e0f          	ldw	x,(OFST+1,sp)
4364  0b5e 1c0016        	addw	x,#22
4365  0b61 cd0000        	call	c_rtol
4367  0b64               L7361:
4368                     ; 1813 	dp->dptr = ofs;						/* Current entry */
4370  0b64 1e0f          	ldw	x,(OFST+1,sp)
4371  0b66 7b08          	ld	a,(OFST-6,sp)
4372  0b68 e711          	ld	(17,x),a
4373  0b6a 7b07          	ld	a,(OFST-7,sp)
4374  0b6c e710          	ld	(16,x),a
4375  0b6e 7b06          	ld	a,(OFST-8,sp)
4376  0b70 e70f          	ld	(15,x),a
4377  0b72 7b05          	ld	a,(OFST-9,sp)
4378  0b74 e70e          	ld	(14,x),a
4379                     ; 1814 	dp->dir = fs->win + ofs % SS(fs);	/* Pointer to the entry in the win[] */
4381  0b76 1e07          	ldw	x,(OFST-7,sp)
4382  0b78 02            	rlwa	x,a
4383  0b79 a401          	and	a,#1
4384  0b7b 01            	rrwa	x,a
4385  0b7c 72fb09        	addw	x,(OFST-5,sp)
4386  0b7f 160f          	ldw	y,(OFST+1,sp)
4387  0b81 1c002f        	addw	x,#47
4388  0b84 90ef1a        	ldw	(26,y),x
4389                     ; 1816 	return FR_OK;
4391  0b87 4f            	clr	a
4393  0b88 cc0a7b        	jra	L222
4394  0b8b               LC018:
4395  0b8b 1c000b        	addw	x,#OFST-3
4396  0b8e cd0000        	call	c_ltor
4398  0b91 ae0088        	ldw	x,#L621
4399  0b94 cc0000        	jp	c_lcmp
4400  0b97               LC019:
4401  0b97 4f            	clr	a
4402  0b98 e719          	ld	(25,x),a
4403  0b9a e718          	ld	(24,x),a
4404  0b9c e717          	ld	(23,x),a
4405  0b9e e716          	ld	(22,x),a
4406  0ba0 81            	ret	
4487                     ; 1827 static FRESULT dir_alloc (	/* FR_OK(0):succeeded, !=0:error */
4487                     ; 1828 	DIR* dp,				/* Pointer to the directory object */
4487                     ; 1829 	UINT nent				/* Number of contiguous entries to allocate */
4487                     ; 1830 )
4487                     ; 1831 {
4488                     	switch	.text
4489  0ba1               L1761_dir_alloc:
4491  0ba1 89            	pushw	x
4492  0ba2 5205          	subw	sp,#5
4493       00000005      OFST:	set	5
4496                     ; 1834 	FATFS *fs = dp->obj.fs;
4498  0ba4 fe            	ldw	x,(x)
4499  0ba5 1f01          	ldw	(OFST-4,sp),x
4501                     ; 1837 	res = dir_sdi(dp, 0);
4503  0ba7 5f            	clrw	x
4504  0ba8 89            	pushw	x
4505  0ba9 89            	pushw	x
4506  0baa 1e0a          	ldw	x,(OFST+5,sp)
4507  0bac cd0884        	call	L1441_dir_sdi
4509  0baf 5b04          	addw	sp,#4
4510  0bb1 6b05          	ld	(OFST+0,sp),a
4512                     ; 1838 	if (res == FR_OK) {
4514  0bb3 2647          	jrne	L5371
4515                     ; 1839 		n = 0;
4517  0bb5 5f            	clrw	x
4518  0bb6 1f03          	ldw	(OFST-2,sp),x
4520  0bb8               L7371:
4521                     ; 1841 			res = move_window(fs, dp->sect);
4523  0bb8 1e06          	ldw	x,(OFST+1,sp)
4524  0bba 9093          	ldw	y,x
4525  0bbc ee18          	ldw	x,(24,x)
4526  0bbe 89            	pushw	x
4527  0bbf 93            	ldw	x,y
4528  0bc0 ee16          	ldw	x,(22,x)
4529  0bc2 89            	pushw	x
4530  0bc3 1e05          	ldw	x,(OFST+0,sp)
4531  0bc5 cd01d0        	call	L316_move_window
4533  0bc8 5b04          	addw	sp,#4
4534  0bca 6b05          	ld	(OFST+0,sp),a
4536                     ; 1842 			if (res != FR_OK) break;
4538  0bcc 262e          	jrne	L5371
4541                     ; 1846 			if (dp->dir[DIR_Name] == DDEM || dp->dir[DIR_Name] == 0) {
4543  0bce 1e06          	ldw	x,(OFST+1,sp)
4544  0bd0 ee1a          	ldw	x,(26,x)
4545  0bd2 f6            	ld	a,(x)
4546  0bd3 a1e5          	cp	a,#229
4547  0bd5 2707          	jreq	L1571
4549  0bd7 1e06          	ldw	x,(OFST+1,sp)
4550  0bd9 ee1a          	ldw	x,(26,x)
4551  0bdb f6            	ld	a,(x)
4552  0bdc 260d          	jrne	L7471
4553  0bde               L1571:
4554                     ; 1848 				if (++n == nent) break;	/* A block of contiguous free entries is found */
4556  0bde 1e03          	ldw	x,(OFST-2,sp)
4557  0be0 5c            	incw	x
4558  0be1 1f03          	ldw	(OFST-2,sp),x
4560  0be3 130a          	cpw	x,(OFST+5,sp)
4561  0be5 2607          	jrne	L5571
4564  0be7 7b05          	ld	a,(OFST+0,sp)
4565  0be9 2011          	jra	L5371
4566  0beb               L7471:
4567                     ; 1850 				n = 0;					/* Not a blank entry. Restart to search */
4569  0beb 5f            	clrw	x
4570  0bec 1f03          	ldw	(OFST-2,sp),x
4572  0bee               L5571:
4573                     ; 1852 			res = dir_next(dp, 1);
4575  0bee ae0001        	ldw	x,#1
4576  0bf1 89            	pushw	x
4577  0bf2 1e08          	ldw	x,(OFST+3,sp)
4578  0bf4 cd09fd        	call	L7651_dir_next
4580  0bf7 85            	popw	x
4581  0bf8 6b05          	ld	(OFST+0,sp),a
4583                     ; 1853 		} while (res == FR_OK);	/* Next entry with table stretch enabled */
4585  0bfa 27bc          	jreq	L7371
4586  0bfc               L5371:
4587                     ; 1856 	if (res == FR_NO_FILE) res = FR_DENIED;	/* No directory entry to allocate */
4589  0bfc a104          	cp	a,#4
4590  0bfe 2602          	jrne	L7571
4593  0c00 a607          	ld	a,#7
4595  0c02               L7571:
4596                     ; 1857 	return res;
4600  0c02 5b07          	addw	sp,#7
4601  0c04 81            	ret	
4658                     ; 1869 static DWORD ld_clust (	/* Returns the top cluster value of the SFN entry */
4658                     ; 1870 	FATFS* fs,			/* Pointer to the fs object */
4658                     ; 1871 	const BYTE* dir		/* Pointer to the key entry */
4658                     ; 1872 )
4658                     ; 1873 {
4659                     	switch	.text
4660  0c05               L1671_ld_clust:
4662  0c05 89            	pushw	x
4663  0c06 5204          	subw	sp,#4
4664       00000004      OFST:	set	4
4667                     ; 1876 	cl = ld_word(dir + DIR_FstClusLO);
4669  0c08 1e09          	ldw	x,(OFST+5,sp)
4670  0c0a 1c001a        	addw	x,#26
4671  0c0d cd0000        	call	L11_ld_word
4673  0c10 cd0000        	call	c_uitolx
4675  0c13 96            	ldw	x,sp
4676  0c14 5c            	incw	x
4677  0c15 cd0000        	call	c_rtol
4680                     ; 1882 	cl |= (DWORD)ld_word(dir + DIR_FstClusHI) << 16;
4682  0c18 1e09          	ldw	x,(OFST+5,sp)
4683  0c1a 1c0014        	addw	x,#20
4684  0c1d cd0000        	call	L11_ld_word
4686  0c20 cd0000        	call	c_uitolx
4688  0c23 a610          	ld	a,#16
4689  0c25 cd0000        	call	c_llsh
4691  0c28 96            	ldw	x,sp
4692  0c29 5c            	incw	x
4693  0c2a cd0000        	call	c_lgor
4696                     ; 1885 	return cl;
4698  0c2d 96            	ldw	x,sp
4699  0c2e 5c            	incw	x
4700  0c2f cd0000        	call	c_ltor
4704  0c32 5b06          	addw	sp,#6
4705  0c34 81            	ret	
4762                     ; 1890 static void st_clust (
4762                     ; 1891 	FATFS* fs,	/* Pointer to the fs object */
4762                     ; 1892 	BYTE* dir,	/* Pointer to the key entry */
4762                     ; 1893 	DWORD cl	/* Value to be set */
4762                     ; 1894 )
4762                     ; 1895 {
4763                     	switch	.text
4764  0c35               L3102_st_clust:
4766  0c35 89            	pushw	x
4767       00000000      OFST:	set	0
4770                     ; 1896 	st_word(dir + DIR_FstClusLO, (WORD)cl);
4772  0c36 1e09          	ldw	x,(OFST+9,sp)
4773  0c38 89            	pushw	x
4774  0c39 1e07          	ldw	x,(OFST+7,sp)
4775  0c3b 1c001a        	addw	x,#26
4776  0c3e cd0084        	call	L76_st_word
4778  0c41 85            	popw	x
4779                     ; 1902 	st_word(dir + DIR_FstClusHI, (WORD)(cl >> 16));
4781  0c42 1e07          	ldw	x,(OFST+7,sp)
4782  0c44 89            	pushw	x
4783  0c45 1e07          	ldw	x,(OFST+7,sp)
4784  0c47 1c0014        	addw	x,#20
4785  0c4a cd0084        	call	L76_st_word
4787                     ; 1905 }
4790  0c4d 5b04          	addw	sp,#4
4791  0c4f 81            	ret	
4864                     ; 2456 static FRESULT dir_find (	/* FR_OK(0):succeeded, !=0:error */
4864                     ; 2457 	DIR* dp					/* Pointer to the directory object with the file name */
4864                     ; 2458 )
4864                     ; 2459 {
4865                     	switch	.text
4866  0c50               L5402_dir_find:
4868  0c50 89            	pushw	x
4869  0c51 5204          	subw	sp,#4
4870       00000004      OFST:	set	4
4873                     ; 2461 	FATFS *fs = dp->obj.fs;
4875  0c53 fe            	ldw	x,(x)
4876  0c54 1f01          	ldw	(OFST-3,sp),x
4878                     ; 2467 	res = dir_sdi(dp, 0);			/* Rewind directory object */
4880  0c56 5f            	clrw	x
4881  0c57 89            	pushw	x
4882  0c58 89            	pushw	x
4883  0c59 1e09          	ldw	x,(OFST+5,sp)
4884  0c5b cd0884        	call	L1441_dir_sdi
4886  0c5e 5b04          	addw	sp,#4
4887  0c60 6b04          	ld	(OFST+0,sp),a
4889                     ; 2468 	if (res != FR_OK) return res;
4894  0c62 265d          	jrne	L262
4895  0c64               L7012:
4896                     ; 2494 		res = move_window(fs, dp->sect);
4898  0c64 1e05          	ldw	x,(OFST+1,sp)
4899  0c66 9093          	ldw	y,x
4900  0c68 ee18          	ldw	x,(24,x)
4901  0c6a 89            	pushw	x
4902  0c6b 93            	ldw	x,y
4903  0c6c ee16          	ldw	x,(22,x)
4904  0c6e 89            	pushw	x
4905  0c6f 1e05          	ldw	x,(OFST+1,sp)
4906  0c71 cd01d0        	call	L316_move_window
4908  0c74 5b04          	addw	sp,#4
4909  0c76 6b04          	ld	(OFST+0,sp),a
4911                     ; 2495 		if (res != FR_OK) break;
4913  0c78 2645          	jrne	L3112
4916                     ; 2496 		c = dp->dir[DIR_Name];
4918  0c7a 1e05          	ldw	x,(OFST+1,sp)
4919  0c7c ee1a          	ldw	x,(26,x)
4920  0c7e f6            	ld	a,(x)
4921  0c7f 6b03          	ld	(OFST-1,sp),a
4923                     ; 2497 		if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
4925  0c81 2606          	jrne	L7112
4928  0c83 a604          	ld	a,#4
4929  0c85 6b04          	ld	(OFST+0,sp),a
4933  0c87 2036          	jra	L3112
4934  0c89               L7112:
4935                     ; 2520 		dp->obj.attr = dp->dir[DIR_Attr] & AM_MASK;
4937  0c89 1e05          	ldw	x,(OFST+1,sp)
4938  0c8b ee1a          	ldw	x,(26,x)
4939  0c8d e60b          	ld	a,(11,x)
4940  0c8f 1e05          	ldw	x,(OFST+1,sp)
4941  0c91 a43f          	and	a,#63
4942  0c93 e704          	ld	(4,x),a
4943                     ; 2521 		if (!(dp->dir[DIR_Attr] & AM_VOL) && !mem_cmp(dp->dir, dp->fn, 11)) break;	/* Is it a valid entry? */
4945  0c95 ee1a          	ldw	x,(26,x)
4946  0c97 e60b          	ld	a,(11,x)
4947  0c99 a508          	bcp	a,#8
4948  0c9b 2616          	jrne	L1212
4950  0c9d ae000b        	ldw	x,#11
4951  0ca0 89            	pushw	x
4952  0ca1 1e07          	ldw	x,(OFST+3,sp)
4953  0ca3 1c001c        	addw	x,#28
4954  0ca6 89            	pushw	x
4955  0ca7 1e09          	ldw	x,(OFST+5,sp)
4956  0ca9 ee1a          	ldw	x,(26,x)
4957  0cab cd00f8        	call	L152_mem_cmp
4959  0cae 5b04          	addw	sp,#4
4960  0cb0 5d            	tnzw	x
4961  0cb1 270c          	jreq	L3112
4964  0cb3               L1212:
4965                     ; 2523 		res = dir_next(dp, 0);	/* Next entry */
4967  0cb3 5f            	clrw	x
4968  0cb4 89            	pushw	x
4969  0cb5 1e07          	ldw	x,(OFST+3,sp)
4970  0cb7 cd09fd        	call	L7651_dir_next
4972  0cba 85            	popw	x
4973  0cbb 6b04          	ld	(OFST+0,sp),a
4975                     ; 2524 	} while (res == FR_OK);
4977  0cbd 27a5          	jreq	L7012
4978  0cbf               L3112:
4979                     ; 2526 	return res;
4981  0cbf 7b04          	ld	a,(OFST+0,sp)
4983  0cc1               L262:
4985  0cc1 5b06          	addw	sp,#6
4986  0cc3 81            	ret	
5050                     ; 2537 static FRESULT dir_register (	/* FR_OK:succeeded, FR_DENIED:no free entry or too many SFN collision, FR_DISK_ERR:disk error */
5050                     ; 2538 	DIR* dp						/* Target directory with object name to be created */
5050                     ; 2539 )
5050                     ; 2540 {
5051                     	switch	.text
5052  0cc4               L3212_dir_register:
5054  0cc4 89            	pushw	x
5055  0cc5 5203          	subw	sp,#3
5056       00000003      OFST:	set	3
5059                     ; 2542 	FATFS *fs = dp->obj.fs;
5061  0cc7 fe            	ldw	x,(x)
5062  0cc8 1f01          	ldw	(OFST-2,sp),x
5064                     ; 2614 	res = dir_alloc(dp, 1);		/* Allocate an entry for SFN */
5066  0cca ae0001        	ldw	x,#1
5067  0ccd 89            	pushw	x
5068  0cce 1e06          	ldw	x,(OFST+3,sp)
5069  0cd0 cd0ba1        	call	L1761_dir_alloc
5071  0cd3 85            	popw	x
5072  0cd4 6b03          	ld	(OFST+0,sp),a
5074                     ; 2619 	if (res == FR_OK) {
5076  0cd6 2640          	jrne	L7512
5077                     ; 2620 		res = move_window(fs, dp->sect);
5079  0cd8 1e04          	ldw	x,(OFST+1,sp)
5080  0cda 9093          	ldw	y,x
5081  0cdc ee18          	ldw	x,(24,x)
5082  0cde 89            	pushw	x
5083  0cdf 93            	ldw	x,y
5084  0ce0 ee16          	ldw	x,(22,x)
5085  0ce2 89            	pushw	x
5086  0ce3 1e05          	ldw	x,(OFST+2,sp)
5087  0ce5 cd01d0        	call	L316_move_window
5089  0ce8 5b04          	addw	sp,#4
5090  0cea 6b03          	ld	(OFST+0,sp),a
5092                     ; 2621 		if (res == FR_OK) {
5094  0cec 262a          	jrne	L7512
5095                     ; 2622 			mem_set(dp->dir, 0, SZDIRE);	/* Clean the entry */
5097  0cee ae0020        	ldw	x,#32
5098  0cf1 89            	pushw	x
5099  0cf2 5f            	clrw	x
5100  0cf3 89            	pushw	x
5101  0cf4 1e08          	ldw	x,(OFST+5,sp)
5102  0cf6 ee1a          	ldw	x,(26,x)
5103  0cf8 cd00e2        	call	L702_mem_set
5105  0cfb 5b04          	addw	sp,#4
5106                     ; 2623 			mem_cpy(dp->dir + DIR_Name, dp->fn, 11);	/* Put SFN */
5108  0cfd ae000b        	ldw	x,#11
5109  0d00 89            	pushw	x
5110  0d01 1e06          	ldw	x,(OFST+3,sp)
5111  0d03 1c001c        	addw	x,#28
5112  0d06 89            	pushw	x
5113  0d07 1e08          	ldw	x,(OFST+5,sp)
5114  0d09 ee1a          	ldw	x,(26,x)
5115  0d0b cd00bf        	call	L731_mem_cpy
5117  0d0e 5b04          	addw	sp,#4
5118                     ; 2627 			fs->wflag = 1;
5120  0d10 1e01          	ldw	x,(OFST-2,sp)
5121  0d12 a601          	ld	a,#1
5122  0d14 e703          	ld	(3,x),a
5123  0d16 7b03          	ld	a,(OFST+0,sp)
5124  0d18               L7512:
5125                     ; 2631 	return res;
5129  0d18 5b05          	addw	sp,#5
5130  0d1a 81            	ret	
5249                     ; 2873 static FRESULT create_name (	/* FR_OK: successful, FR_INVALID_NAME: could not create */
5249                     ; 2874 	DIR* dp,					/* Pointer to the directory object */
5249                     ; 2875 	const TCHAR** path			/* Pointer to pointer to the segment in the path string */
5249                     ; 2876 )
5249                     ; 2877 {
5250                     	switch	.text
5251  0d1b               L3612_create_name:
5253  0d1b 89            	pushw	x
5254  0d1c 520c          	subw	sp,#12
5255       0000000c      OFST:	set	12
5258                     ; 3009 	p = *path; sfn = dp->fn;
5260  0d1e 1e11          	ldw	x,(OFST+5,sp)
5261  0d20 fe            	ldw	x,(x)
5262  0d21 1f06          	ldw	(OFST-6,sp),x
5266  0d23 1e0d          	ldw	x,(OFST+1,sp)
5267  0d25 1c001c        	addw	x,#28
5268  0d28 1f04          	ldw	(OFST-8,sp),x
5270                     ; 3010 	mem_set(sfn, ' ', 11);
5272  0d2a ae000b        	ldw	x,#11
5273  0d2d 89            	pushw	x
5274  0d2e ae0020        	ldw	x,#32
5275  0d31 89            	pushw	x
5276  0d32 1e08          	ldw	x,(OFST-4,sp)
5277  0d34 cd00e2        	call	L702_mem_set
5279  0d37 5b04          	addw	sp,#4
5280                     ; 3011 	si = i = 0; ni = 8;
5282  0d39 5f            	clrw	x
5283  0d3a 1f08          	ldw	(OFST-4,sp),x
5285  0d3c 1f0a          	ldw	(OFST-2,sp),x
5289  0d3e ae0008        	ldw	x,#8
5290  0d41               LC020:
5291  0d41 1f02          	ldw	(OFST-10,sp),x
5293  0d43               L5422:
5294                     ; 3026 		c = (BYTE)p[si++];				/* Get a byte */
5296  0d43 1e0a          	ldw	x,(OFST-2,sp)
5297  0d45 5c            	incw	x
5298  0d46 1f0a          	ldw	(OFST-2,sp),x
5299  0d48 5a            	decw	x
5301  0d49 72fb06        	addw	x,(OFST-6,sp)
5302  0d4c f6            	ld	a,(x)
5303  0d4d 6b0c          	ld	(OFST+0,sp),a
5305                     ; 3027 		if (c <= ' ') break; 			/* Break if end of the path name */
5307  0d4f a121          	cp	a,#33
5308  0d51 251d          	jrult	L7422
5311                     ; 3028 		if (c == '/' || c == '\\') {	/* Break if a separator is found */
5313  0d53 a12f          	cp	a,#47
5314  0d55 270b          	jreq	L1622
5316  0d57 a15c          	cp	a,#92
5317  0d59 2627          	jrne	L3522
5318  0d5b 2005          	jra	L1622
5319  0d5d               L7522:
5320                     ; 3029 			while (p[si] == '/' || p[si] == '\\') si++;	/* Skip duplicated separator if exist */
5322  0d5d 1e0a          	ldw	x,(OFST-2,sp)
5323  0d5f 5c            	incw	x
5324  0d60 1f0a          	ldw	(OFST-2,sp),x
5326  0d62               L1622:
5329  0d62 1e06          	ldw	x,(OFST-6,sp)
5330  0d64 72fb0a        	addw	x,(OFST-2,sp)
5331  0d67 f6            	ld	a,(x)
5332  0d68 a12f          	cp	a,#47
5333  0d6a 27f1          	jreq	L7522
5335  0d6c a15c          	cp	a,#92
5336  0d6e 27ed          	jreq	L7522
5337                     ; 3030 			break;
5338  0d70               L7422:
5339                     ; 3057 	*path = p + si;						/* Return pointer to the next segment */
5341  0d70 1e06          	ldw	x,(OFST-6,sp)
5342  0d72 1611          	ldw	y,(OFST+5,sp)
5343  0d74 72fb0a        	addw	x,(OFST-2,sp)
5344  0d77 90ff          	ldw	(y),x
5345                     ; 3058 	if (i == 0) return FR_INVALID_NAME;	/* Reject nul string */
5347  0d79 1e08          	ldw	x,(OFST-4,sp)
5348  0d7b 2703cc0e0b    	jrne	L5132
5351  0d80 2015          	jp	L3722
5352  0d82               L3522:
5353                     ; 3032 		if (c == '.' || i >= ni) {		/* End of body or field overflow? */
5355  0d82 a12e          	cp	a,#46
5356  0d84 2706          	jreq	L7622
5358  0d86 1e08          	ldw	x,(OFST-4,sp)
5359  0d88 1302          	cpw	x,(OFST-10,sp)
5360  0d8a 251a          	jrult	L5622
5361  0d8c               L7622:
5362                     ; 3033 			if (ni == 11 || c != '.') return FR_INVALID_NAME;	/* Field overflow or invalid dot? */
5364  0d8c 1e02          	ldw	x,(OFST-10,sp)
5365  0d8e a3000b        	cpw	x,#11
5366  0d91 2704          	jreq	L3722
5368  0d93 a12e          	cp	a,#46
5369  0d95 2705          	jreq	L1722
5370  0d97               L3722:
5376  0d97 a606          	ld	a,#6
5378  0d99               L413:
5380  0d99 5b0e          	addw	sp,#14
5381  0d9b 81            	ret	
5382  0d9c               L1722:
5383                     ; 3034 			i = 8; ni = 11;				/* Enter file extension field */
5385  0d9c ae0008        	ldw	x,#8
5386  0d9f 1f08          	ldw	(OFST-4,sp),x
5390  0da1 ae000b        	ldw	x,#11
5391                     ; 3035 			continue;
5393  0da4 209b          	jp	LC020
5394  0da6               L5622:
5395                     ; 3042 		if (c >= 0x80) {				/* Is SBC extended character? */
5397  0da6 a180          	cp	a,#128
5398  0da8 2509          	jrult	L5722
5399                     ; 3043 			c = ExCvt[c & 0x7F];		/* To upper SBC extended character */
5401  0daa a47f          	and	a,#127
5402  0dac 5f            	clrw	x
5403  0dad 97            	ld	xl,a
5404  0dae d60000        	ld	a,(L7_ExCvt,x)
5405  0db1 6b0c          	ld	(OFST+0,sp),a
5407  0db3               L5722:
5408                     ; 3046 		if (dbc_1st(c)) {				/* Check if it is a DBC 1st byte */
5410  0db3 cd0141        	call	L163_dbc_1st
5412  0db6 5d            	tnzw	x
5413  0db7 2734          	jreq	L7722
5414                     ; 3047 			d = (BYTE)p[si++];			/* Get 2nd byte */
5416  0db9 1e0a          	ldw	x,(OFST-2,sp)
5417  0dbb 5c            	incw	x
5418  0dbc 1f0a          	ldw	(OFST-2,sp),x
5419  0dbe 5a            	decw	x
5421  0dbf 72fb06        	addw	x,(OFST-6,sp)
5422  0dc2 f6            	ld	a,(x)
5423  0dc3 6b01          	ld	(OFST-11,sp),a
5425                     ; 3048 			if (!dbc_2nd(d) || i >= ni - 1) return FR_INVALID_NAME;	/* Reject invalid DBC */
5427  0dc5 cd0148        	call	L304_dbc_2nd
5429  0dc8 5d            	tnzw	x
5430  0dc9 27cc          	jreq	L3722
5432  0dcb 1e02          	ldw	x,(OFST-10,sp)
5433  0dcd 5a            	decw	x
5434  0dce 1308          	cpw	x,(OFST-4,sp)
5437  0dd0 23c5          	jrule	L3722
5438                     ; 3049 			sfn[i++] = c;
5440  0dd2 7b0c          	ld	a,(OFST+0,sp)
5441  0dd4 1e08          	ldw	x,(OFST-4,sp)
5442  0dd6 5c            	incw	x
5443  0dd7 1f08          	ldw	(OFST-4,sp),x
5444  0dd9 5a            	decw	x
5446  0dda 72fb04        	addw	x,(OFST-8,sp)
5447  0ddd f7            	ld	(x),a
5448                     ; 3050 			sfn[i++] = d;
5450  0dde 7b01          	ld	a,(OFST-11,sp)
5451  0de0               LC021:
5453  0de0 1e08          	ldw	x,(OFST-4,sp)
5454  0de2 5c            	incw	x
5455  0de3 1f08          	ldw	(OFST-4,sp),x
5456  0de5 5a            	decw	x
5458  0de6 72fb04        	addw	x,(OFST-8,sp)
5459  0de9 f7            	ld	(x),a
5461  0dea cc0d43        	jra	L5422
5462  0ded               L7722:
5463                     ; 3052 			if (chk_chr("\"*+,:;<=>\?[]|\x7F", c)) return FR_INVALID_NAME;	/* Reject illegal chrs for SFN */
5465  0ded 7b0c          	ld	a,(OFST+0,sp)
5466  0def 5f            	clrw	x
5467  0df0 97            	ld	xl,a
5468  0df1 89            	pushw	x
5469  0df2 ae00b2        	ldw	x,#L1132
5470  0df5 cd0128        	call	L523_chk_chr
5472  0df8 5b02          	addw	sp,#2
5473  0dfa 5d            	tnzw	x
5476  0dfb 269a          	jrne	L3722
5477                     ; 3053 			if (IsLower(c)) c -= 0x20;	/* To upper */
5479  0dfd 7b0c          	ld	a,(OFST+0,sp)
5480  0dff a161          	cp	a,#97
5481  0e01 25dd          	jrult	LC021
5483  0e03 a17b          	cp	a,#123
5484  0e05 24d9          	jruge	LC021
5487  0e07 a020          	sub	a,#32
5489                     ; 3054 			sfn[i++] = c;
5490  0e09 20d5          	jp	LC021
5491  0e0b               L5132:
5492                     ; 3060 	if (sfn[0] == DDEM) sfn[0] = RDDEM;	/* If the first character collides with DDEM, replace it with RDDEM */
5494  0e0b 1e04          	ldw	x,(OFST-8,sp)
5495  0e0d f6            	ld	a,(x)
5496  0e0e a1e5          	cp	a,#229
5497  0e10 2603          	jrne	L7132
5500  0e12 a605          	ld	a,#5
5501  0e14 f7            	ld	(x),a
5502  0e15               L7132:
5503                     ; 3061 	sfn[NSFLAG] = (c <= ' ') ? NS_LAST : 0;		/* Set last segment flag if end of the path */
5505  0e15 7b0c          	ld	a,(OFST+0,sp)
5506  0e17 a121          	cp	a,#33
5507  0e19 2404          	jruge	L013
5508  0e1b a604          	ld	a,#4
5509  0e1d 2001          	jra	L213
5510  0e1f               L013:
5511  0e1f 4f            	clr	a
5512  0e20               L213:
5513  0e20 e70b          	ld	(11,x),a
5514                     ; 3063 	return FR_OK;
5516  0e22 4f            	clr	a
5518  0e23 cc0d99        	jra	L413
5601                     ; 3074 static FRESULT follow_path (	/* FR_OK(0): successful, !=0: error code */
5601                     ; 3075 	DIR* dp,					/* Directory object to return last directory and found object */
5601                     ; 3076 	const TCHAR* path			/* Full-path string to find a file or directory */
5601                     ; 3077 )
5601                     ; 3078 {
5602                     	switch	.text
5603  0e26               L1232_follow_path:
5605  0e26 89            	pushw	x
5606  0e27 5204          	subw	sp,#4
5607       00000004      OFST:	set	4
5610                     ; 3081 	FATFS *fs = dp->obj.fs;
5612  0e29 fe            	ldw	x,(x)
5613  0e2a 1f01          	ldw	(OFST-3,sp),x
5616  0e2c 1e09          	ldw	x,(OFST+5,sp)
5617  0e2e 2003          	jra	L7632
5618  0e30               L5632:
5619                     ; 3090 		while (*path == '/' || *path == '\\') path++;	/* Strip heading separator */
5621  0e30 5c            	incw	x
5622  0e31 1f09          	ldw	(OFST+5,sp),x
5623  0e33               L7632:
5626  0e33 f6            	ld	a,(x)
5627  0e34 a12f          	cp	a,#47
5628  0e36 27f8          	jreq	L5632
5630  0e38 a15c          	cp	a,#92
5631  0e3a 27f4          	jreq	L5632
5632                     ; 3091 		dp->obj.sclust = 0;					/* Start from root directory */
5634  0e3c 1e05          	ldw	x,(OFST+1,sp)
5635  0e3e 4f            	clr	a
5636  0e3f e709          	ld	(9,x),a
5637  0e41 e708          	ld	(8,x),a
5638  0e43 e707          	ld	(7,x),a
5639  0e45 e706          	ld	(6,x),a
5640                     ; 3110 	if ((UINT)*path < ' ') {				/* Null path name is the origin directory itself */
5642  0e47 1e09          	ldw	x,(OFST+5,sp)
5643  0e49 f6            	ld	a,(x)
5644  0e4a 5f            	clrw	x
5645  0e4b 97            	ld	xl,a
5646  0e4c a30020        	cpw	x,#32
5647  0e4f 2412          	jruge	L7732
5648                     ; 3111 		dp->fn[NSFLAG] = NS_NONAME;
5650  0e51 1e05          	ldw	x,(OFST+1,sp)
5651  0e53 a680          	ld	a,#128
5652  0e55 e727          	ld	(39,x),a
5653                     ; 3112 		res = dir_sdi(dp, 0);
5655  0e57 5f            	clrw	x
5656  0e58 89            	pushw	x
5657  0e59 89            	pushw	x
5658  0e5a 1e09          	ldw	x,(OFST+5,sp)
5659  0e5c cd0884        	call	L1441_dir_sdi
5661  0e5f 5b04          	addw	sp,#4
5663  0e61 203a          	jp	LC023
5664  0e63               L7732:
5665                     ; 3116 			res = create_name(dp, &path);	/* Get a segment name of the path */
5667  0e63 96            	ldw	x,sp
5668  0e64 1c0009        	addw	x,#OFST+5
5669  0e67 89            	pushw	x
5670  0e68 1e07          	ldw	x,(OFST+3,sp)
5671  0e6a cd0d1b        	call	L3612_create_name
5673  0e6d 85            	popw	x
5674  0e6e 6b04          	ld	(OFST+0,sp),a
5676                     ; 3117 			if (res != FR_OK) break;
5678  0e70 262d          	jrne	L5732
5681                     ; 3118 			res = dir_find(dp);				/* Find an object with the segment name */
5683  0e72 1e05          	ldw	x,(OFST+1,sp)
5684  0e74 cd0c50        	call	L5402_dir_find
5686  0e77 6b04          	ld	(OFST+0,sp),a
5688                     ; 3119 			ns = dp->fn[NSFLAG];
5690  0e79 1e05          	ldw	x,(OFST+1,sp)
5691  0e7b e627          	ld	a,(39,x)
5692  0e7d 6b03          	ld	(OFST-1,sp),a
5694                     ; 3120 			if (res != FR_OK) {				/* Failed to find the object */
5696  0e7f 7b04          	ld	a,(OFST+0,sp)
5697  0e81 270c          	jreq	L5042
5698                     ; 3121 				if (res == FR_NO_FILE) {	/* Object is not found */
5700  0e83 a104          	cp	a,#4
5701  0e85 2618          	jrne	L5732
5702                     ; 3127 						if (!(ns & NS_LAST)) res = FR_NO_PATH;	/* Adjust error code if not last segment */
5704  0e87 7b03          	ld	a,(OFST-1,sp)
5705  0e89 a504          	bcp	a,#4
5706  0e8b 2612          	jrne	L5732
5708  0e8d 200c          	jp	LC024
5709  0e8f               L5042:
5710                     ; 3132 			if (ns & NS_LAST) break;			/* Last segment matched. Function completed. */
5712  0e8f 7b03          	ld	a,(OFST-1,sp)
5713  0e91 a504          	bcp	a,#4
5714  0e93 260a          	jrne	L5732
5717                     ; 3134 			if (!(dp->obj.attr & AM_DIR)) {		/* It is not a sub-directory and cannot follow */
5719  0e95 e604          	ld	a,(4,x)
5720  0e97 a510          	bcp	a,#16
5721  0e99 2609          	jrne	L5142
5722                     ; 3135 				res = FR_NO_PATH; break;
5724  0e9b               LC024:
5726  0e9b a605          	ld	a,#5
5727  0e9d               LC023:
5728  0e9d 6b04          	ld	(OFST+0,sp),a
5731  0e9f               L5732:
5732                     ; 3151 	return res;
5734  0e9f 7b04          	ld	a,(OFST+0,sp)
5737  0ea1 5b06          	addw	sp,#6
5738  0ea3 81            	ret	
5739  0ea4               L5142:
5740                     ; 3146 				dp->obj.sclust = ld_clust(fs, fs->win + dp->dptr % SS(fs));	/* Open next directory */
5742  0ea4 ee10          	ldw	x,(16,x)
5743  0ea6 02            	rlwa	x,a
5744  0ea7 a401          	and	a,#1
5745  0ea9 01            	rrwa	x,a
5746  0eaa 72fb01        	addw	x,(OFST-3,sp)
5747  0ead 1c002f        	addw	x,#47
5748  0eb0 89            	pushw	x
5749  0eb1 1e03          	ldw	x,(OFST-1,sp)
5750  0eb3 cd0c05        	call	L1671_ld_clust
5752  0eb6 85            	popw	x
5753  0eb7 1e05          	ldw	x,(OFST+1,sp)
5754  0eb9 1c0006        	addw	x,#6
5755  0ebc cd0000        	call	c_rtol
5758  0ebf 20a2          	jra	L7732
5841                     ; 3161 static int get_ldnumber (	/* Returns logical drive number (-1:invalid drive number or null pointer) */
5841                     ; 3162 	const TCHAR** path		/* Pointer to pointer to the path name */
5841                     ; 3163 )
5841                     ; 3164 {
5842                     	switch	.text
5843  0ec1               L7142_get_ldnumber:
5845  0ec1 89            	pushw	x
5846  0ec2 5209          	subw	sp,#9
5847       00000009      OFST:	set	9
5850                     ; 3167 	int i, vol = -1;
5852  0ec4 aeffff        	ldw	x,#65535
5853  0ec7 1f03          	ldw	(OFST-6,sp),x
5855                     ; 3173 	tt = tp = *path;
5857  0ec9 1e0a          	ldw	x,(OFST+1,sp)
5858  0ecb fe            	ldw	x,(x)
5859  0ecc 1f05          	ldw	(OFST-4,sp),x
5861  0ece 1f07          	ldw	(OFST-2,sp),x
5863                     ; 3174 	if (!tp) return vol;	/* Invalid path name? */
5865  0ed0 1e05          	ldw	x,(OFST-4,sp)
5866  0ed2 2603          	jrne	L5642
5869  0ed4 5a            	decw	x
5871  0ed5 2048          	jra	L233
5872  0ed7               L5642:
5873                     ; 3175 	do tc = *tt++; while ((UINT)tc >= (FF_USE_LFN ? ' ' : '!') && tc != ':');	/* Find a colon in the path */
5875  0ed7 1e07          	ldw	x,(OFST-2,sp)
5877  0ed9 f6            	ld	a,(x)
5878  0eda 5c            	incw	x
5879  0edb 1f07          	ldw	(OFST-2,sp),x
5880  0edd 6b09          	ld	(OFST+0,sp),a
5884  0edf 5f            	clrw	x
5885  0ee0 97            	ld	xl,a
5886  0ee1 a30021        	cpw	x,#33
5887  0ee4 2504          	jrult	L3742
5889  0ee6 a13a          	cp	a,#58
5890  0ee8 26ed          	jrne	L5642
5891  0eea               L3742:
5892                     ; 3177 	if (tc == ':') {	/* DOS/Windows style volume ID? */
5894  0eea a13a          	cp	a,#58
5895  0eec 2634          	jrne	L5742
5896                     ; 3178 		i = FF_VOLUMES;
5898  0eee ae0001        	ldw	x,#1
5899  0ef1 1f01          	ldw	(OFST-8,sp),x
5901                     ; 3179 		if (IsDigit(*tp) && tp + 2 == tt) {	/* Is there a numeric volume ID + colon? */
5903  0ef3 1e05          	ldw	x,(OFST-4,sp)
5904  0ef5 f6            	ld	a,(x)
5905  0ef6 a130          	cp	a,#48
5906  0ef8 2515          	jrult	L7742
5908  0efa a13a          	cp	a,#58
5909  0efc 2411          	jruge	L7742
5911  0efe 1c0002        	addw	x,#2
5912  0f01 1307          	cpw	x,(OFST-2,sp)
5913  0f03 260a          	jrne	L7742
5914                     ; 3180 			i = (int)*tp - '0';	/* Get the LD number */
5916  0f05 1e05          	ldw	x,(OFST-4,sp)
5917  0f07 f6            	ld	a,(x)
5918  0f08 5f            	clrw	x
5919  0f09 97            	ld	xl,a
5920  0f0a 1d0030        	subw	x,#48
5921  0f0d 1f01          	ldw	(OFST-8,sp),x
5923  0f0f               L7742:
5924                     ; 3195 		if (i < FF_VOLUMES) {	/* If a volume ID is found, get the drive number and strip it */
5926  0f0f 1e01          	ldw	x,(OFST-8,sp)
5927  0f11 a30001        	cpw	x,#1
5928  0f14 2e07          	jrsge	L1052
5929                     ; 3196 			vol = i;		/* Drive number */
5931  0f16 1f03          	ldw	(OFST-6,sp),x
5933                     ; 3197 			*path = tt;		/* Snip the drive prefix off */
5935  0f18 1e0a          	ldw	x,(OFST+1,sp)
5936  0f1a 1607          	ldw	y,(OFST-2,sp)
5937  0f1c ff            	ldw	(x),y
5938  0f1d               L1052:
5939                     ; 3199 		return vol;
5941  0f1d 1e03          	ldw	x,(OFST-6,sp)
5943  0f1f               L233:
5945  0f1f 5b0b          	addw	sp,#11
5946  0f21 81            	ret	
5947  0f22               L5742:
5948                     ; 3223 	vol = 0;		/* Default drive is 0 */
5950                     ; 3225 	return vol;		/* Return the default drive */
5952  0f22 5f            	clrw	x
5954  0f23 20fa          	jra	L233
6003                     ; 3307 static UINT check_fs (	/* 0:FAT VBR, 1:exFAT VBR, 2:Valid BS but not FAT, 3:Invalid BS, 4:Disk error */
6003                     ; 3308 	FATFS* fs,			/* Filesystem object */
6003                     ; 3309 	LBA_t sect			/* Sector to load and check if it is an FAT-VBR or not */
6003                     ; 3310 )
6003                     ; 3311 {
6004                     	switch	.text
6005  0f25               L3052_check_fs:
6007  0f25 89            	pushw	x
6008       00000000      OFST:	set	0
6011                     ; 3312 	fs->wflag = 0; fs->winsect = (LBA_t)0 - 1;		/* Invaidate window */
6013  0f26 6f03          	clr	(3,x)
6016  0f28 a6ff          	ld	a,#255
6017  0f2a e72e          	ld	(46,x),a
6018  0f2c e72d          	ld	(45,x),a
6019  0f2e e72c          	ld	(44,x),a
6020  0f30 e72b          	ld	(43,x),a
6021                     ; 3313 	if (move_window(fs, sect) != FR_OK) return 4;	/* Load the boot sector */
6023  0f32 1e07          	ldw	x,(OFST+7,sp)
6024  0f34 89            	pushw	x
6025  0f35 1e07          	ldw	x,(OFST+7,sp)
6026  0f37 89            	pushw	x
6027  0f38 1e05          	ldw	x,(OFST+5,sp)
6028  0f3a cd01d0        	call	L316_move_window
6030  0f3d 5b04          	addw	sp,#4
6031  0f3f 4d            	tnz	a
6032  0f40 2705          	jreq	L1352
6035  0f42 ae0004        	ldw	x,#4
6037  0f45 2010          	jra	L643
6038  0f47               L1352:
6039                     ; 3315 	if (ld_word(fs->win + BS_55AA) != 0xAA55) return 3;	/* Check boot signature (always here regardless of the sector size) */
6041  0f47 1e01          	ldw	x,(OFST+1,sp)
6042  0f49 1c022d        	addw	x,#557
6043  0f4c cd0000        	call	L11_ld_word
6045  0f4f a3aa55        	cpw	x,#43605
6046  0f52 2706          	jreq	L3352
6049  0f54 ae0003        	ldw	x,#3
6051  0f57               L643:
6053  0f57 5b02          	addw	sp,#2
6054  0f59 81            	ret	
6055  0f5a               L3352:
6056                     ; 3319 	if (fs->win[BS_JmpBoot] == 0xE9 || fs->win[BS_JmpBoot] == 0xEB || fs->win[BS_JmpBoot] == 0xE8) {	/* Valid JumpBoot code? */
6058  0f5a 1e01          	ldw	x,(OFST+1,sp)
6059  0f5c e62f          	ld	a,(47,x)
6060  0f5e a1e9          	cp	a,#233
6061  0f60 2708          	jreq	L7352
6063  0f62 a1eb          	cp	a,#235
6064  0f64 2704          	jreq	L7352
6066  0f66 a1e8          	cp	a,#232
6067  0f68 2630          	jrne	L5352
6068  0f6a               L7352:
6069                     ; 3320 		if (!mem_cmp(fs->win + BS_FilSysType, "FAT", 3)) return 0;		/* Is it an FAT VBR? */
6071  0f6a ae0003        	ldw	x,#3
6072  0f6d 89            	pushw	x
6073  0f6e ae00ae        	ldw	x,#L5452
6074  0f71 89            	pushw	x
6075  0f72 1e05          	ldw	x,(OFST+5,sp)
6076  0f74 1c0065        	addw	x,#101
6077  0f77 cd00f8        	call	L152_mem_cmp
6079  0f7a 5b04          	addw	sp,#4
6080  0f7c 5d            	tnzw	x
6081  0f7d 2603          	jrne	L3452
6084  0f7f 5f            	clrw	x
6086  0f80 20d5          	jra	L643
6087  0f82               L3452:
6088                     ; 3321 		if (!mem_cmp(fs->win + BS_FilSysType32, "FAT32", 5)) return 0;	/* Is it an FAT32 VBR? */
6090  0f82 ae0005        	ldw	x,#5
6091  0f85 89            	pushw	x
6092  0f86 ae00a8        	ldw	x,#L1552
6093  0f89 89            	pushw	x
6094  0f8a 1e05          	ldw	x,(OFST+5,sp)
6095  0f8c 1c0081        	addw	x,#129
6096  0f8f cd00f8        	call	L152_mem_cmp
6098  0f92 5b04          	addw	sp,#4
6099  0f94 5d            	tnzw	x
6100  0f95 2603          	jrne	L5352
6103  0f97 5f            	clrw	x
6105  0f98 20bd          	jra	L643
6106  0f9a               L5352:
6107                     ; 3323 	return 2;	/* Valid BS but not FAT */
6109  0f9a ae0002        	ldw	x,#2
6111  0f9d 20b8          	jra	L643
6187                     ; 3330 static UINT find_volume (	/* Returns BS status found in the hosting drive */
6187                     ; 3331 	FATFS* fs,		/* Filesystem object */
6187                     ; 3332 	UINT part		/* Partition to fined = 0:auto, 1..:forced */
6187                     ; 3333 )
6187                     ; 3334 {
6188                     	switch	.text
6189  0f9f               L3552_find_volume:
6191  0f9f 89            	pushw	x
6192  0fa0 5216          	subw	sp,#22
6193       00000016      OFST:	set	22
6196                     ; 3339 	fmt = check_fs(fs, 0);				/* Load sector 0 and check if it is an FAT VBR as SFD */
6198  0fa2 5f            	clrw	x
6199  0fa3 89            	pushw	x
6200  0fa4 89            	pushw	x
6201  0fa5 1e1b          	ldw	x,(OFST+5,sp)
6202  0fa7 cd0f25        	call	L3052_check_fs
6204  0faa 5b04          	addw	sp,#4
6205  0fac 1f13          	ldw	(OFST-3,sp),x
6207                     ; 3340 	if (fmt != 2 && (fmt >= 3 || part == 0)) return fmt;	/* Returns if it is a FAT VBR as auto scan, not a BS or disk error */
6209  0fae a30002        	cpw	x,#2
6210  0fb1 270f          	jreq	L5162
6212  0fb3 a30003        	cpw	x,#3
6213  0fb6 2503cc1042    	jruge	L073
6215  0fbb 1e1b          	ldw	x,(OFST+5,sp)
6219  0fbd 2603cc1040    	jreq	L5362
6220  0fc2               L5162:
6221                     ; 3367 	for (i = 0; i < 4; i++) {		/* Load partition offset in the MBR */
6223  0fc2 5f            	clrw	x
6224  0fc3 1f15          	ldw	(OFST-1,sp),x
6226  0fc5               L1262:
6227                     ; 3368 		mbr_pt[i] = ld_dword(fs->win + MBR_Table + i * SZ_PTE + PTE_StLba);
6229  0fc5 58            	sllw	x
6230  0fc6 58            	sllw	x
6231  0fc7 58            	sllw	x
6232  0fc8 58            	sllw	x
6233  0fc9 72fb17        	addw	x,(OFST+1,sp)
6234  0fcc 1c01f5        	addw	x,#501
6235  0fcf cd000d        	call	L34_ld_dword
6237  0fd2 96            	ldw	x,sp
6238  0fd3 1c0003        	addw	x,#OFST-19
6239  0fd6 1f01          	ldw	(OFST-21,sp),x
6241  0fd8 1e15          	ldw	x,(OFST-1,sp)
6242  0fda 58            	sllw	x
6243  0fdb 58            	sllw	x
6244  0fdc 72fb01        	addw	x,(OFST-21,sp)
6245  0fdf cd0000        	call	c_rtol
6247                     ; 3367 	for (i = 0; i < 4; i++) {		/* Load partition offset in the MBR */
6249  0fe2 1e15          	ldw	x,(OFST-1,sp)
6250  0fe4 5c            	incw	x
6251  0fe5 1f15          	ldw	(OFST-1,sp),x
6255  0fe7 a30004        	cpw	x,#4
6256  0fea 25d9          	jrult	L1262
6257                     ; 3370 	i = part ? part - 1 : 0;		/* Table index to find first */
6259  0fec 1e1b          	ldw	x,(OFST+5,sp)
6260  0fee 2703          	jreq	L653
6261  0ff0 5a            	decw	x
6262  0ff1 2001          	jra	L063
6263  0ff3               L653:
6264  0ff3 5f            	clrw	x
6265  0ff4               L063:
6266  0ff4 1f15          	ldw	(OFST-1,sp),x
6268  0ff6               L7262:
6269                     ; 3372 		fmt = mbr_pt[i] ? check_fs(fs, mbr_pt[i]) : 3;	/* Check if the partition is FAT */
6271  0ff6 96            	ldw	x,sp
6272  0ff7 1c0003        	addw	x,#OFST-19
6273  0ffa 1f01          	ldw	(OFST-21,sp),x
6275  0ffc 1e15          	ldw	x,(OFST-1,sp)
6276  0ffe 58            	sllw	x
6277  0fff 58            	sllw	x
6278  1000 72fb01        	addw	x,(OFST-21,sp)
6279  1003 cd0000        	call	c_lzmp
6281  1006 271e          	jreq	L263
6282  1008 96            	ldw	x,sp
6283  1009 1c0003        	addw	x,#OFST-19
6284  100c 1f01          	ldw	(OFST-21,sp),x
6286  100e 1e15          	ldw	x,(OFST-1,sp)
6287  1010 58            	sllw	x
6288  1011 58            	sllw	x
6289  1012 72fb01        	addw	x,(OFST-21,sp)
6290  1015 9093          	ldw	y,x
6291  1017 ee02          	ldw	x,(2,x)
6292  1019 89            	pushw	x
6293  101a 93            	ldw	x,y
6294  101b fe            	ldw	x,(x)
6295  101c 89            	pushw	x
6296  101d 1e1b          	ldw	x,(OFST+5,sp)
6297  101f cd0f25        	call	L3052_check_fs
6299  1022 5b04          	addw	sp,#4
6300  1024 2003          	jra	L663
6301  1026               L263:
6302  1026 ae0003        	ldw	x,#3
6303  1029               L663:
6304  1029 1f13          	ldw	(OFST-3,sp),x
6306                     ; 3373 	} while (part == 0 && fmt >= 2 && ++i < 4);
6308  102b 1e1b          	ldw	x,(OFST+5,sp)
6309  102d 2611          	jrne	L5362
6311  102f 1e13          	ldw	x,(OFST-3,sp)
6312  1031 a30002        	cpw	x,#2
6313  1034 250a          	jrult	L5362
6315  1036 1e15          	ldw	x,(OFST-1,sp)
6316  1038 5c            	incw	x
6317  1039 1f15          	ldw	(OFST-1,sp),x
6319  103b a30004        	cpw	x,#4
6320  103e 25b6          	jrult	L7262
6321  1040               L5362:
6322                     ; 3374 	return fmt;
6324  1040 1e13          	ldw	x,(OFST-3,sp)
6326  1042               L073:
6328  1042 5b18          	addw	sp,#24
6329  1044 81            	ret	
6499                     	switch	.const
6500  0090               L224:
6501  0090 0ffffff6      	dc.l	268435446
6502  0094               L424:
6503  0094 0000fff6      	dc.l	65526
6504  0098               L624:
6505  0098 00000ff6      	dc.l	4086
6506  009c               L044:
6507  009c 000001ff      	dc.l	511
6508  00a0               L254:
6509  00a0 41615252      	dc.l	1096897106
6510  00a4               L654:
6511  00a4 61417272      	dc.l	1631679090
6512                     ; 3384 static FRESULT mount_volume (	/* FR_OK(0): successful, !=0: an error occurred */
6512                     ; 3385 	const TCHAR** path,			/* Pointer to pointer to the path name (drive number) */
6512                     ; 3386 	FATFS** rfs,				/* Pointer to pointer to the found filesystem object */
6512                     ; 3387 	BYTE mode					/* !=0: Check write protection for write access */
6512                     ; 3388 )
6512                     ; 3389 {
6513                     	switch	.text
6514  1045               L1462_mount_volume:
6516  1045 89            	pushw	x
6517  1046 521b          	subw	sp,#27
6518       0000001b      OFST:	set	27
6521                     ; 3400 	*rfs = 0;
6523  1048 1e20          	ldw	x,(OFST+5,sp)
6524  104a 905f          	clrw	y
6525  104c ff            	ldw	(x),y
6526                     ; 3401 	vol = get_ldnumber(path);
6528  104d 1e1c          	ldw	x,(OFST+1,sp)
6529  104f cd0ec1        	call	L7142_get_ldnumber
6531  1052 1f12          	ldw	(OFST-9,sp),x
6533                     ; 3402 	if (vol < 0) return FR_INVALID_DRIVE;
6535  1054 2a04          	jrpl	L1572
6538  1056 a60b          	ld	a,#11
6540  1058 2009          	jra	L464
6541  105a               L1572:
6542                     ; 3405 	fs = FatFs[vol];					/* Get pointer to the filesystem object */
6544  105a 58            	sllw	x
6545  105b ee02          	ldw	x,(L3_FatFs,x)
6546  105d 1f1a          	ldw	(OFST-1,sp),x
6548                     ; 3406 	if (!fs) return FR_NOT_ENABLED;		/* Is the filesystem object available? */
6550  105f 2605          	jrne	L3572
6553  1061 a60c          	ld	a,#12
6555  1063               L464:
6557  1063 5b1d          	addw	sp,#29
6558  1065 81            	ret	
6559  1066               L3572:
6560                     ; 3410 	*rfs = fs;							/* Return pointer to the filesystem object */
6562  1066 1e20          	ldw	x,(OFST+5,sp)
6563  1068 161a          	ldw	y,(OFST-1,sp)
6564  106a ff            	ldw	(x),y
6565                     ; 3412 	mode &= (BYTE)~FA_READ;				/* Desired access mode, write access or not */
6567  106b 7b22          	ld	a,(OFST+7,sp)
6568  106d a4fe          	and	a,#254
6569                     ; 3413 	if (fs->fs_type != 0) {				/* If the volume has been mounted */
6571  106f 93            	ldw	x,y
6572  1070 6b22          	ld	(OFST+7,sp),a
6573  1072 f6            	ld	a,(x)
6574  1073 271a          	jreq	L5572
6575                     ; 3414 		stat = disk_status(fs->pdrv);
6577  1075 e601          	ld	a,(1,x)
6578  1077 cd0000        	call	_disk_status
6580  107a 6b09          	ld	(OFST-18,sp),a
6582                     ; 3415 		if (!(stat & STA_NOINIT)) {		/* and the physical drive is kept initialized */
6584  107c a501          	bcp	a,#1
6585  107e 260f          	jrne	L5572
6586                     ; 3416 			if (!FF_FS_READONLY && mode && (stat & STA_PROTECT)) {	/* Check write protection if needed */
6588  1080 0d22          	tnz	(OFST+7,sp)
6589  1082 2603cc140e    	jreq	LC026
6591  1087 a504          	bcp	a,#4
6592  1089 27f9          	jreq	LC026
6593                     ; 3417 				return FR_WRITE_PROTECTED;
6595  108b a60a          	ld	a,#10
6597  108d 20d4          	jra	L464
6598                     ; 3419 			return FR_OK;				/* The filesystem object is already valid */
6600  108f               L5572:
6601                     ; 3426 	fs->fs_type = 0;					/* Clear the filesystem object */
6603  108f 1e1a          	ldw	x,(OFST-1,sp)
6604  1091 7f            	clr	(x)
6605                     ; 3427 	fs->pdrv = LD2PD(vol);				/* Volume hosting physical drive */
6607  1092 7b13          	ld	a,(OFST-8,sp)
6608  1094 e701          	ld	(1,x),a
6609                     ; 3428 	stat = disk_initialize(fs->pdrv);	/* Initialize the physical drive */
6611  1096 cd0000        	call	_disk_initialize
6613  1099 6b09          	ld	(OFST-18,sp),a
6615                     ; 3429 	if (stat & STA_NOINIT) { 			/* Check if the initialization succeeded */
6617  109b a501          	bcp	a,#1
6618  109d 2704          	jreq	L3672
6619                     ; 3430 		return FR_NOT_READY;			/* Failed to initialize due to no medium or hard error */
6621  109f a603          	ld	a,#3
6623  10a1 20c0          	jra	L464
6624  10a3               L3672:
6625                     ; 3432 	if (!FF_FS_READONLY && mode && (stat & STA_PROTECT)) { /* Check disk write protection if needed */
6627  10a3 0d22          	tnz	(OFST+7,sp)
6628  10a5 2708          	jreq	L5672
6630  10a7 a504          	bcp	a,#4
6631  10a9 2704          	jreq	L5672
6632                     ; 3433 		return FR_WRITE_PROTECTED;
6634  10ab a60a          	ld	a,#10
6636  10ad 20b4          	jra	L464
6637  10af               L5672:
6638                     ; 3441 	fmt = find_volume(fs, LD2PT(vol));
6640  10af 5f            	clrw	x
6641  10b0 89            	pushw	x
6642  10b1 1e1c          	ldw	x,(OFST+1,sp)
6643  10b3 cd0f9f        	call	L3552_find_volume
6645  10b6 5b02          	addw	sp,#2
6646  10b8 1f18          	ldw	(OFST-3,sp),x
6648                     ; 3442 	if (fmt == 4) return FR_DISK_ERR;		/* An error occured in the disk I/O layer */
6650  10ba a30004        	cpw	x,#4
6651  10bd 2604          	jrne	L7672
6654  10bf a601          	ld	a,#1
6656  10c1 20a0          	jra	L464
6657  10c3               L7672:
6658                     ; 3443 	if (fmt >= 2) return FR_NO_FILESYSTEM;	/* No FAT volume is found */
6660  10c3 a30002        	cpw	x,#2
6663  10c6 2503cc135f    	jruge	LC027
6664                     ; 3444 	bsect = fs->winsect;					/* Volume location */
6666  10cb 1e1a          	ldw	x,(OFST-1,sp)
6667  10cd 9093          	ldw	y,x
6668  10cf ee2d          	ldw	x,(45,x)
6669  10d1 1f07          	ldw	(OFST-20,sp),x
6670  10d3 93            	ldw	x,y
6671  10d4 ee2b          	ldw	x,(43,x)
6672  10d6 1f05          	ldw	(OFST-22,sp),x
6674                     ; 3512 		if (ld_word(fs->win + BPB_BytsPerSec) != SS(fs)) return FR_NO_FILESYSTEM;	/* (BPB_BytsPerSec must be equal to the physical sector size) */
6676  10d8 1e1a          	ldw	x,(OFST-1,sp)
6677  10da 1c003a        	addw	x,#58
6678  10dd cd0000        	call	L11_ld_word
6680  10e0 a30200        	cpw	x,#512
6683  10e3 26e3          	jrne	LC027
6684                     ; 3514 		fasize = ld_word(fs->win + BPB_FATSz16);		/* Number of sectors per FAT */
6686  10e5 1e1a          	ldw	x,(OFST-1,sp)
6687  10e7 1c0045        	addw	x,#69
6688  10ea cd0000        	call	L11_ld_word
6690  10ed cd0000        	call	c_uitolx
6692  10f0 96            	ldw	x,sp
6693  10f1 1c000e        	addw	x,#OFST-13
6694  10f4 cd0000        	call	c_rtol
6697                     ; 3515 		if (fasize == 0) fasize = ld_dword(fs->win + BPB_FATSz32);
6699  10f7 96            	ldw	x,sp
6700  10f8 1c000e        	addw	x,#OFST-13
6701  10fb cd0000        	call	c_lzmp
6703  10fe 260f          	jrne	L5772
6706  1100 1e1a          	ldw	x,(OFST-1,sp)
6707  1102 1c0053        	addw	x,#83
6708  1105 cd000d        	call	L34_ld_dword
6710  1108 96            	ldw	x,sp
6711  1109 1c000e        	addw	x,#OFST-13
6712  110c cd0000        	call	c_rtol
6715  110f               L5772:
6716                     ; 3516 		fs->fsize = fasize;
6718  110f 1e1a          	ldw	x,(OFST-1,sp)
6719  1111 7b11          	ld	a,(OFST-10,sp)
6720  1113 e71a          	ld	(26,x),a
6721  1115 7b10          	ld	a,(OFST-11,sp)
6722  1117 e719          	ld	(25,x),a
6723  1119 7b0f          	ld	a,(OFST-12,sp)
6724  111b e718          	ld	(24,x),a
6725  111d 7b0e          	ld	a,(OFST-13,sp)
6726  111f e717          	ld	(23,x),a
6727                     ; 3518 		fs->n_fats = fs->win[BPB_NumFATs];				/* Number of FATs */
6729  1121 e63f          	ld	a,(63,x)
6730  1123 e702          	ld	(2,x),a
6731                     ; 3519 		if (fs->n_fats != 1 && fs->n_fats != 2) return FR_NO_FILESYSTEM;	/* (Must be 1 or 2) */
6733  1125 a101          	cp	a,#1
6734  1127 2704          	jreq	L7772
6736  1129 a102          	cp	a,#2
6739  112b 269b          	jrne	LC027
6740  112d               L7772:
6741                     ; 3520 		fasize *= fs->n_fats;							/* Number of sectors for FAT area */
6743  112d b703          	ld	c_lreg+3,a
6744  112f 3f02          	clr	c_lreg+2
6745  1131 3f01          	clr	c_lreg+1
6746  1133 3f00          	clr	c_lreg
6747  1135 96            	ldw	x,sp
6748  1136 1c000e        	addw	x,#OFST-13
6749  1139 cd0000        	call	c_lgmul
6752                     ; 3522 		fs->csize = fs->win[BPB_SecPerClus];			/* Cluster size */
6754  113c 1e1a          	ldw	x,(OFST-1,sp)
6755  113e e63c          	ld	a,(60,x)
6756  1140 5f            	clrw	x
6757  1141 161a          	ldw	y,(OFST-1,sp)
6758  1143 97            	ld	xl,a
6759  1144 90ef09        	ldw	(9,y),x
6760                     ; 3523 		if (fs->csize == 0 || (fs->csize & (fs->csize - 1))) return FR_NO_FILESYSTEM;	/* (Must be power of 2) */
6762  1147 93            	ldw	x,y
6763  1148 e60a          	ld	a,(10,x)
6764  114a ea09          	or	a,(9,x)
6765  114c 2603cc135f    	jreq	LC027
6767  1151 ee09          	ldw	x,(9,x)
6768  1153 5a            	decw	x
6769  1154 01            	rrwa	x,a
6770  1155 90e40a        	and	a,(10,y)
6771  1158 01            	rrwa	x,a
6772  1159 90e409        	and	a,(9,y)
6773  115c 01            	rrwa	x,a
6774  115d 5d            	tnzw	x
6777  115e 26ee          	jrne	LC027
6778                     ; 3525 		fs->n_rootdir = ld_word(fs->win + BPB_RootEntCnt);	/* Number of root directory entries */
6780  1160 93            	ldw	x,y
6781  1161 1c0040        	addw	x,#64
6782  1164 cd0000        	call	L11_ld_word
6784  1167 161a          	ldw	y,(OFST-1,sp)
6785  1169 90ef07        	ldw	(7,y),x
6786                     ; 3526 		if (fs->n_rootdir % (SS(fs) / SZDIRE)) return FR_NO_FILESYSTEM;	/* (Must be sector aligned) */
6788  116c 93            	ldw	x,y
6789  116d e608          	ld	a,(8,x)
6790  116f a50f          	bcp	a,#15
6793  1171 26db          	jrne	LC027
6794                     ; 3528 		tsect = ld_word(fs->win + BPB_TotSec16);		/* Number of sectors on the volume */
6796  1173 1c0042        	addw	x,#66
6797  1176 cd0000        	call	L11_ld_word
6799  1179 cd0000        	call	c_uitolx
6801  117c 96            	ldw	x,sp
6802  117d 1c0014        	addw	x,#OFST-7
6803  1180 cd0000        	call	c_rtol
6806                     ; 3529 		if (tsect == 0) tsect = ld_dword(fs->win + BPB_TotSec32);
6808  1183 96            	ldw	x,sp
6809  1184 1c0014        	addw	x,#OFST-7
6810  1187 cd0000        	call	c_lzmp
6812  118a 260f          	jrne	L7003
6815  118c 1e1a          	ldw	x,(OFST-1,sp)
6816  118e 1c004f        	addw	x,#79
6817  1191 cd000d        	call	L34_ld_dword
6819  1194 96            	ldw	x,sp
6820  1195 1c0014        	addw	x,#OFST-7
6821  1198 cd0000        	call	c_rtol
6824  119b               L7003:
6825                     ; 3531 		nrsv = ld_word(fs->win + BPB_RsvdSecCnt);		/* Number of reserved sectors */
6827  119b 1e1a          	ldw	x,(OFST-1,sp)
6828  119d 1c003d        	addw	x,#61
6829  11a0 cd0000        	call	L11_ld_word
6831  11a3 1f12          	ldw	(OFST-9,sp),x
6833                     ; 3532 		if (nrsv == 0) return FR_NO_FILESYSTEM;			/* (Must not be 0) */
6837  11a5 27a7          	jreq	LC027
6838                     ; 3535 		sysect = nrsv + fasize + fs->n_rootdir / (SS(fs) / SZDIRE);	/* RSV + FAT + DIR */
6840  11a7 1e1a          	ldw	x,(OFST-1,sp)
6841  11a9 ee07          	ldw	x,(7,x)
6842  11ab 54            	srlw	x
6843  11ac 54            	srlw	x
6844  11ad 54            	srlw	x
6845  11ae 54            	srlw	x
6846  11af cd0000        	call	c_uitolx
6848  11b2 96            	ldw	x,sp
6849  11b3 5c            	incw	x
6850  11b4 cd0000        	call	c_rtol
6853  11b7 1e12          	ldw	x,(OFST-9,sp)
6854  11b9 cd0000        	call	c_uitolx
6856  11bc 96            	ldw	x,sp
6857  11bd 1c000e        	addw	x,#OFST-13
6858  11c0 cd0000        	call	c_ladd
6860  11c3 96            	ldw	x,sp
6861  11c4 5c            	incw	x
6862  11c5 cd0000        	call	c_ladd
6864  11c8 96            	ldw	x,sp
6865  11c9 1c000a        	addw	x,#OFST-17
6866  11cc cd0000        	call	c_rtol
6869                     ; 3536 		if (tsect < sysect) return FR_NO_FILESYSTEM;	/* (Invalid volume size) */
6871  11cf 96            	ldw	x,sp
6872  11d0 1c0014        	addw	x,#OFST-7
6873  11d3 cd0000        	call	c_ltor
6875  11d6 96            	ldw	x,sp
6876  11d7 1c000a        	addw	x,#OFST-17
6877  11da cd0000        	call	c_lcmp
6881  11dd 2403cc135f    	jrult	LC027
6882                     ; 3537 		nclst = (tsect - sysect) / fs->csize;			/* Number of clusters */
6884  11e2 1e1a          	ldw	x,(OFST-1,sp)
6885  11e4 ee09          	ldw	x,(9,x)
6886  11e6 cd0000        	call	c_uitolx
6888  11e9 96            	ldw	x,sp
6889  11ea 5c            	incw	x
6890  11eb cd0000        	call	c_rtol
6893  11ee 96            	ldw	x,sp
6894  11ef 1c0014        	addw	x,#OFST-7
6895  11f2 cd0000        	call	c_ltor
6897  11f5 96            	ldw	x,sp
6898  11f6 1c000a        	addw	x,#OFST-17
6899  11f9 cd0000        	call	c_lsub
6901  11fc 96            	ldw	x,sp
6902  11fd 5c            	incw	x
6903  11fe cd0000        	call	c_ludv
6905  1201 96            	ldw	x,sp
6906  1202 1c0014        	addw	x,#OFST-7
6907  1205 cd0000        	call	c_rtol
6910                     ; 3538 		if (nclst == 0) return FR_NO_FILESYSTEM;		/* (Invalid volume size) */
6912  1208 96            	ldw	x,sp
6913  1209 1c0014        	addw	x,#OFST-7
6914  120c cd0000        	call	c_lzmp
6918  120f 27ce          	jreq	LC027
6919                     ; 3539 		fmt = 0;
6921  1211 5f            	clrw	x
6922  1212 1f18          	ldw	(OFST-3,sp),x
6924                     ; 3540 		if (nclst <= MAX_FAT32) fmt = FS_FAT32;
6926  1214 96            	ldw	x,sp
6927  1215 1c0014        	addw	x,#OFST-7
6928  1218 cd0000        	call	c_ltor
6930  121b ae0090        	ldw	x,#L224
6931  121e cd0000        	call	c_lcmp
6933  1221 2405          	jruge	L7103
6936  1223 ae0003        	ldw	x,#3
6937  1226 1f18          	ldw	(OFST-3,sp),x
6939  1228               L7103:
6940                     ; 3541 		if (nclst <= MAX_FAT16) fmt = FS_FAT16;
6942  1228 96            	ldw	x,sp
6943  1229 1c0014        	addw	x,#OFST-7
6944  122c cd0000        	call	c_ltor
6946  122f ae0094        	ldw	x,#L424
6947  1232 cd0000        	call	c_lcmp
6949  1235 2405          	jruge	L1203
6952  1237 ae0002        	ldw	x,#2
6953  123a 1f18          	ldw	(OFST-3,sp),x
6955  123c               L1203:
6956                     ; 3542 		if (nclst <= MAX_FAT12) fmt = FS_FAT12;
6958  123c 96            	ldw	x,sp
6959  123d 1c0014        	addw	x,#OFST-7
6960  1240 cd0000        	call	c_ltor
6962  1243 ae0098        	ldw	x,#L624
6963  1246 cd0000        	call	c_lcmp
6965  1249 2405          	jruge	L3203
6968  124b ae0001        	ldw	x,#1
6969  124e 1f18          	ldw	(OFST-3,sp),x
6971  1250               L3203:
6972                     ; 3543 		if (fmt == 0) return FR_NO_FILESYSTEM;
6974  1250 1e18          	ldw	x,(OFST-3,sp)
6977  1252 278b          	jreq	LC027
6978                     ; 3546 		fs->n_fatent = nclst + 2;						/* Number of FAT entries */
6980  1254 96            	ldw	x,sp
6981  1255 1c0014        	addw	x,#OFST-7
6982  1258 cd0000        	call	c_ltor
6984  125b a602          	ld	a,#2
6985  125d cd0000        	call	c_ladc
6987  1260 1e1a          	ldw	x,(OFST-1,sp)
6988  1262 1c0013        	addw	x,#19
6989  1265 cd0000        	call	c_rtol
6991                     ; 3547 		fs->volbase = bsect;							/* Volume start sector */
6993  1268 1e1a          	ldw	x,(OFST-1,sp)
6994  126a 7b08          	ld	a,(OFST-19,sp)
6995  126c e71e          	ld	(30,x),a
6996  126e 7b07          	ld	a,(OFST-20,sp)
6997  1270 e71d          	ld	(29,x),a
6998  1272 7b06          	ld	a,(OFST-21,sp)
6999  1274 e71c          	ld	(28,x),a
7000  1276 7b05          	ld	a,(OFST-22,sp)
7001  1278 e71b          	ld	(27,x),a
7002                     ; 3548 		fs->fatbase = bsect + nrsv; 					/* FAT start sector */
7004  127a 1e12          	ldw	x,(OFST-9,sp)
7005  127c cd0000        	call	c_uitolx
7007  127f 96            	ldw	x,sp
7008  1280 1c0005        	addw	x,#OFST-22
7009  1283 cd0000        	call	c_ladd
7011  1286 1e1a          	ldw	x,(OFST-1,sp)
7012  1288 1c001f        	addw	x,#31
7013  128b cd0000        	call	c_rtol
7015                     ; 3549 		fs->database = bsect + sysect;					/* Data start sector */
7017  128e 96            	ldw	x,sp
7018  128f 1c0005        	addw	x,#OFST-22
7019  1292 cd0000        	call	c_ltor
7021  1295 96            	ldw	x,sp
7022  1296 1c000a        	addw	x,#OFST-17
7023  1299 cd0000        	call	c_ladd
7025  129c 1e1a          	ldw	x,(OFST-1,sp)
7026  129e 1c0027        	addw	x,#39
7027  12a1 cd0000        	call	c_rtol
7029                     ; 3550 		if (fmt == FS_FAT32) {
7031  12a4 1e18          	ldw	x,(OFST-3,sp)
7032  12a6 a30003        	cpw	x,#3
7033  12a9 2633          	jrne	L7203
7034                     ; 3551 			if (ld_word(fs->win + BPB_FSVer32) != 0) return FR_NO_FILESYSTEM;	/* (Must be FAT32 revision 0.0) */
7036  12ab 1e1a          	ldw	x,(OFST-1,sp)
7037  12ad 1c0059        	addw	x,#89
7038  12b0 cd0000        	call	L11_ld_word
7040  12b3 5d            	tnzw	x
7043  12b4 2703cc135f    	jrne	LC027
7044                     ; 3552 			if (fs->n_rootdir != 0) return FR_NO_FILESYSTEM;	/* (BPB_RootEntCnt must be 0) */
7046  12b9 1e1a          	ldw	x,(OFST-1,sp)
7047  12bb e608          	ld	a,(8,x)
7048  12bd ea07          	or	a,(7,x)
7051  12bf 26f5          	jrne	LC027
7052                     ; 3553 			fs->dirbase = ld_dword(fs->win + BPB_RootClus32);	/* Root directory start cluster */
7054  12c1 1c005b        	addw	x,#91
7055  12c4 cd000d        	call	L34_ld_dword
7057  12c7 1e1a          	ldw	x,(OFST-1,sp)
7058  12c9 1c0023        	addw	x,#35
7059  12cc cd0000        	call	c_rtol
7061                     ; 3554 			szbfat = fs->n_fatent * 4;					/* (Needed FAT size) */
7063  12cf 1e1a          	ldw	x,(OFST-1,sp)
7064  12d1 1c0013        	addw	x,#19
7065  12d4 cd0000        	call	c_ltor
7067  12d7 a602          	ld	a,#2
7068  12d9 cd0000        	call	c_llsh
7073  12dc 2054          	jra	L634
7074  12de               L7203:
7075                     ; 3556 			if (fs->n_rootdir == 0)	return FR_NO_FILESYSTEM;	/* (BPB_RootEntCnt must not be 0) */
7077  12de 1e1a          	ldw	x,(OFST-1,sp)
7078  12e0 e608          	ld	a,(8,x)
7079  12e2 ea07          	or	a,(7,x)
7082  12e4 2779          	jreq	LC027
7083                     ; 3557 			fs->dirbase = fs->fatbase + fasize;			/* Root directory start sector */
7085  12e6 1c001f        	addw	x,#31
7086  12e9 cd0000        	call	c_ltor
7088  12ec 96            	ldw	x,sp
7089  12ed 1c000e        	addw	x,#OFST-13
7090  12f0 cd0000        	call	c_ladd
7092  12f3 1e1a          	ldw	x,(OFST-1,sp)
7093  12f5 1c0023        	addw	x,#35
7094  12f8 cd0000        	call	c_rtol
7096                     ; 3558 			szbfat = (fmt == FS_FAT16) ?				/* (Needed FAT size) */
7096                     ; 3559 				fs->n_fatent * 2 : fs->n_fatent * 3 / 2 + (fs->n_fatent & 1);
7098  12fb 1e18          	ldw	x,(OFST-3,sp)
7099  12fd a30002        	cpw	x,#2
7100  1300 2612          	jrne	L434
7101  1302 1e1a          	ldw	x,(OFST-1,sp)
7102  1304 1c0013        	addw	x,#19
7103  1307 cd0000        	call	c_ltor
7105  130a 3803          	sll	c_lreg+3
7106  130c 3902          	rlc	c_lreg+2
7107  130e 3901          	rlc	c_lreg+1
7108  1310 3900          	rlc	c_lreg
7109  1312 201e          	jra	L634
7110  1314               L434:
7111  1314 1e1a          	ldw	x,(OFST-1,sp)
7112  1316 1c0013        	addw	x,#19
7113  1319 cd0000        	call	c_ltor
7115  131c a603          	ld	a,#3
7116  131e cd0000        	call	c_smul
7118  1321 3400          	srl	c_lreg
7119  1323 3601          	rrc	c_lreg+1
7120  1325 3602          	rrc	c_lreg+2
7121  1327 3603          	rrc	c_lreg+3
7122  1329 1e1a          	ldw	x,(OFST-1,sp)
7123  132b e616          	ld	a,(22,x)
7124  132d a401          	and	a,#1
7125  132f cd0000        	call	c_ladc
7127  1332               L634:
7130  1332 96            	ldw	x,sp
7131  1333 1c000a        	addw	x,#OFST-17
7132  1336 cd0000        	call	c_rtol
7133                     ; 3561 		if (fs->fsize < (szbfat + (SS(fs) - 1)) / SS(fs)) return FR_NO_FILESYSTEM;	/* (BPB_FATSz must not be less than the size needed) */
7135  1339 96            	ldw	x,sp
7136  133a 1c000a        	addw	x,#OFST-17
7137  133d cd0000        	call	c_ltor
7139  1340 ae009c        	ldw	x,#L044
7140  1343 cd0000        	call	c_ladd
7142  1346 a609          	ld	a,#9
7143  1348 cd0000        	call	c_lursh
7145  134b 96            	ldw	x,sp
7146  134c 5c            	incw	x
7147  134d cd0000        	call	c_rtol
7150  1350 1e1a          	ldw	x,(OFST-1,sp)
7151  1352 1c0017        	addw	x,#23
7152  1355 cd0000        	call	c_ltor
7154  1358 96            	ldw	x,sp
7155  1359 5c            	incw	x
7156  135a cd0000        	call	c_lcmp
7158  135d 2405          	jruge	L1403
7161  135f               LC027:
7174  135f a60d          	ld	a,#13
7176  1361 cc1063        	jra	L464
7177  1364               L1403:
7178                     ; 3565 		fs->last_clst = fs->free_clst = 0xFFFFFFFF;		/* Initialize cluster allocation information */
7180  1364 1e1a          	ldw	x,(OFST-1,sp)
7181  1366 a6ff          	ld	a,#255
7182  1368 e712          	ld	(18,x),a
7183  136a e711          	ld	(17,x),a
7184  136c e710          	ld	(16,x),a
7185  136e 9093          	ldw	y,x
7186  1370 e70f          	ld	(15,x),a
7187  1372 90e70e        	ld	(14,y),a
7188  1375 90e70d        	ld	(13,y),a
7189  1378 90e70c        	ld	(12,y),a
7190  137b 90e70b        	ld	(11,y),a
7191                     ; 3566 		fs->fsi_flag = 0x80;
7193  137e a680          	ld	a,#128
7194  1380 e704          	ld	(4,x),a
7195                     ; 3568 		if (fmt == FS_FAT32				/* Allow to update FSInfo only if BPB_FSInfo32 == 1 */
7195                     ; 3569 			&& ld_word(fs->win + BPB_FSInfo32) == 1
7195                     ; 3570 			&& move_window(fs, bsect + 1) == FR_OK)
7197  1382 1e18          	ldw	x,(OFST-3,sp)
7198  1384 a30003        	cpw	x,#3
7199  1387 2676          	jrne	L3403
7201  1389 1e1a          	ldw	x,(OFST-1,sp)
7202  138b 1c005f        	addw	x,#95
7203  138e cd0000        	call	L11_ld_word
7205  1391 5a            	decw	x
7206  1392 266b          	jrne	L3403
7208  1394 96            	ldw	x,sp
7209  1395 1c0005        	addw	x,#OFST-22
7210  1398 cd0000        	call	c_ltor
7212  139b a601          	ld	a,#1
7213  139d cd0000        	call	c_ladc
7215  13a0 be02          	ldw	x,c_lreg+2
7216  13a2 89            	pushw	x
7217  13a3 be00          	ldw	x,c_lreg
7218  13a5 89            	pushw	x
7219  13a6 1e1e          	ldw	x,(OFST+3,sp)
7220  13a8 cd01d0        	call	L316_move_window
7222  13ab 5b04          	addw	sp,#4
7223  13ad 4d            	tnz	a
7224  13ae 264f          	jrne	L3403
7225                     ; 3572 			fs->fsi_flag = 0;
7227  13b0 1e1a          	ldw	x,(OFST-1,sp)
7228  13b2 e704          	ld	(4,x),a
7229                     ; 3573 			if (ld_word(fs->win + BS_55AA) == 0xAA55	/* Load FSInfo data if available */
7229                     ; 3574 				&& ld_dword(fs->win + FSI_LeadSig) == 0x41615252
7229                     ; 3575 				&& ld_dword(fs->win + FSI_StrucSig) == 0x61417272)
7231  13b4 1c022d        	addw	x,#557
7232  13b7 cd0000        	call	L11_ld_word
7234  13ba a3aa55        	cpw	x,#43605
7235  13bd 2640          	jrne	L3403
7237  13bf 1e1a          	ldw	x,(OFST-1,sp)
7238  13c1 1c002f        	addw	x,#47
7239  13c4 cd000d        	call	L34_ld_dword
7241  13c7 ae00a0        	ldw	x,#L254
7242  13ca cd0000        	call	c_lcmp
7244  13cd 2630          	jrne	L3403
7246  13cf 1e1a          	ldw	x,(OFST-1,sp)
7247  13d1 1c0213        	addw	x,#531
7248  13d4 cd000d        	call	L34_ld_dword
7250  13d7 ae00a4        	ldw	x,#L654
7251  13da cd0000        	call	c_lcmp
7253  13dd 2620          	jrne	L3403
7254                     ; 3578 				fs->free_clst = ld_dword(fs->win + FSI_Free_Count);
7256  13df 1e1a          	ldw	x,(OFST-1,sp)
7257  13e1 1c0217        	addw	x,#535
7258  13e4 cd000d        	call	L34_ld_dword
7260  13e7 1e1a          	ldw	x,(OFST-1,sp)
7261  13e9 1c000f        	addw	x,#15
7262  13ec cd0000        	call	c_rtol
7264                     ; 3581 				fs->last_clst = ld_dword(fs->win + FSI_Nxt_Free);
7266  13ef 1e1a          	ldw	x,(OFST-1,sp)
7267  13f1 1c021b        	addw	x,#539
7268  13f4 cd000d        	call	L34_ld_dword
7270  13f7 1e1a          	ldw	x,(OFST-1,sp)
7271  13f9 1c000b        	addw	x,#11
7272  13fc cd0000        	call	c_rtol
7274  13ff               L3403:
7275                     ; 3589 	fs->fs_type = (BYTE)fmt;/* FAT sub-type */
7277  13ff 1e1a          	ldw	x,(OFST-1,sp)
7278  1401 7b19          	ld	a,(OFST-2,sp)
7279  1403 f7            	ld	(x),a
7280                     ; 3590 	fs->id = ++Fsid;		/* Volume mount ID */
7282  1404 be00          	ldw	x,L5_Fsid
7283  1406 5c            	incw	x
7284  1407 bf00          	ldw	L5_Fsid,x
7285  1409 161a          	ldw	y,(OFST-1,sp)
7286  140b 90ef05        	ldw	(5,y),x
7287                     ; 3603 	return FR_OK;
7289  140e               LC026:
7291  140e 4f            	clr	a
7293  140f cc1063        	jra	L464
7355                     ; 3613 static FRESULT validate (	/* Returns FR_OK or FR_INVALID_OBJECT */
7355                     ; 3614 	FFOBJID* obj,			/* Pointer to the FFOBJID, the 1st member in the FIL/DIR object, to check validity */
7355                     ; 3615 	FATFS** rfs				/* Pointer to pointer to the owner filesystem object to return */
7355                     ; 3616 )
7355                     ; 3617 {
7356                     	switch	.text
7357  1412               L7403_validate:
7359  1412 89            	pushw	x
7360  1413 88            	push	a
7361       00000001      OFST:	set	1
7364                     ; 3618 	FRESULT res = FR_INVALID_OBJECT;
7366  1414 a609          	ld	a,#9
7367  1416 6b01          	ld	(OFST+0,sp),a
7369                     ; 3621 	if (obj && obj->fs && obj->fs->fs_type && obj->id == obj->fs->id) {	/* Test if the object is valid */
7371  1418 5d            	tnzw	x
7372  1419 2724          	jreq	L3013
7374  141b e601          	ld	a,(1,x)
7375  141d fa            	or	a,(x)
7376  141e 271f          	jreq	L3013
7378  1420 fe            	ldw	x,(x)
7379  1421 f6            	ld	a,(x)
7380  1422 271b          	jreq	L3013
7382  1424 1e02          	ldw	x,(OFST+1,sp)
7383  1426 9093          	ldw	y,x
7384  1428 90fe          	ldw	y,(y)
7385  142a ee02          	ldw	x,(2,x)
7386  142c 90e305        	cpw	x,(5,y)
7387  142f 260e          	jrne	L3013
7388                     ; 3633 		if (!(disk_status(obj->fs->pdrv) & STA_NOINIT)) { /* Test if the phsical drive is kept initialized */
7390  1431 1e02          	ldw	x,(OFST+1,sp)
7391  1433 fe            	ldw	x,(x)
7392  1434 e601          	ld	a,(1,x)
7393  1436 cd0000        	call	_disk_status
7395  1439 a501          	bcp	a,#1
7396  143b 2602          	jrne	L3013
7397                     ; 3634 			res = FR_OK;
7399  143d 0f01          	clr	(OFST+0,sp)
7401  143f               L3013:
7402                     ; 3638 	*rfs = (res == FR_OK) ? obj->fs : 0;	/* Corresponding filesystem object */
7404  143f 7b01          	ld	a,(OFST+0,sp)
7405  1441 2605          	jrne	L274
7406  1443 1e02          	ldw	x,(OFST+1,sp)
7407  1445 fe            	ldw	x,(x)
7408  1446 2001          	jra	L474
7409  1448               L274:
7410  1448 5f            	clrw	x
7411  1449               L474:
7412  1449 1606          	ldw	y,(OFST+5,sp)
7413  144b 90ff          	ldw	(y),x
7414                     ; 3639 	return res;
7418  144d 5b03          	addw	sp,#3
7419  144f 81            	ret	
7520                     ; 3657 FRESULT f_mount (
7520                     ; 3658 	FATFS* fs,			/* Pointer to the filesystem object (NULL:unmount)*/
7520                     ; 3659 	const TCHAR* path,	/* Logical drive number to be mounted/unmounted */
7520                     ; 3660 	BYTE opt			/* Mode option 0:Do not mount (delayed mount), 1:Mount immediately */
7520                     ; 3661 )
7520                     ; 3662 {
7521                     	switch	.text
7522  1450               _f_mount:
7524  1450 89            	pushw	x
7525  1451 5207          	subw	sp,#7
7526       00000007      OFST:	set	7
7529                     ; 3666 	const TCHAR *rp = path;
7531  1453 1e0c          	ldw	x,(OFST+5,sp)
7532  1455 1f02          	ldw	(OFST-5,sp),x
7534                     ; 3670 	vol = get_ldnumber(&rp);
7536  1457 96            	ldw	x,sp
7537  1458 1c0002        	addw	x,#OFST-5
7538  145b cd0ec1        	call	L7142_get_ldnumber
7540  145e 1f06          	ldw	(OFST-1,sp),x
7542                     ; 3671 	if (vol < 0) return FR_INVALID_DRIVE;
7544  1460 2a04          	jrpl	L1613
7547  1462 a60b          	ld	a,#11
7549  1464 2018          	jra	L405
7550  1466               L1613:
7551                     ; 3672 	cfs = FatFs[vol];					/* Pointer to fs object */
7553  1466 58            	sllw	x
7554  1467 ee02          	ldw	x,(L3_FatFs,x)
7555  1469 1f04          	ldw	(OFST-3,sp),x
7557                     ; 3674 	if (cfs) {
7559  146b 2701          	jreq	L3613
7560                     ; 3681 		cfs->fs_type = 0;				/* Clear old fs object */
7562  146d 7f            	clr	(x)
7563  146e               L3613:
7564                     ; 3684 	if (fs) {
7566  146e 1e08          	ldw	x,(OFST+1,sp)
7567  1470 2701          	jreq	L5613
7568                     ; 3685 		fs->fs_type = 0;				/* Clear new fs object */
7570  1472 7f            	clr	(x)
7571  1473               L5613:
7572                     ; 3690 	FatFs[vol] = fs;					/* Register new fs object */
7574  1473 1e06          	ldw	x,(OFST-1,sp)
7575  1475 58            	sllw	x
7576  1476 1608          	ldw	y,(OFST+1,sp)
7577  1478 ef02          	ldw	(L3_FatFs,x),y
7578                     ; 3692 	if (opt == 0) return FR_OK;			/* Do not mount now, it will be mounted later */
7580  147a 7b0e          	ld	a,(OFST+7,sp)
7581  147c 2603          	jrne	L7613
7585  147e               L405:
7587  147e 5b09          	addw	sp,#9
7588  1480 81            	ret	
7589  1481               L7613:
7590                     ; 3694 	res = mount_volume(&path, &fs, 0);	/* Force mounted the volume */
7592  1481 4b00          	push	#0
7593  1483 96            	ldw	x,sp
7594  1484 1c0009        	addw	x,#OFST+2
7595  1487 89            	pushw	x
7596  1488 1c0004        	addw	x,#4
7597  148b cd1045        	call	L1462_mount_volume
7599  148e 5b03          	addw	sp,#3
7601                     ; 3695 	LEAVE_FF(fs, res);
7604  1490 20ec          	jra	L405
7818                     ; 3705 FRESULT f_open (
7818                     ; 3706 	FIL* fp,			/* Pointer to the blank file object */
7818                     ; 3707 	const TCHAR* path,	/* Pointer to the file name */
7818                     ; 3708 	BYTE mode			/* Access mode and file open mode flags */
7818                     ; 3709 )
7818                     ; 3710 {
7819                     	switch	.text
7820  1492               _f_open:
7822  1492 89            	pushw	x
7823  1493 5237          	subw	sp,#55
7824       00000037      OFST:	set	55
7827                     ; 3722 	if (!fp) return FR_INVALID_OBJECT;
7829  1495 5d            	tnzw	x
7830  1496 2605          	jrne	L3133
7833  1498 a609          	ld	a,#9
7835  149a cc174d        	jra	L5143
7836  149d               L3133:
7837                     ; 3725 	mode &= FF_FS_READONLY ? FA_READ : FA_READ | FA_WRITE | FA_CREATE_ALWAYS | FA_CREATE_NEW | FA_OPEN_ALWAYS | FA_OPEN_APPEND;
7839  149d 7b3e          	ld	a,(OFST+7,sp)
7840  149f a43f          	and	a,#63
7841  14a1 6b3e          	ld	(OFST+7,sp),a
7842                     ; 3726 	res = mount_volume(&path, &fs, mode);
7844  14a3 88            	push	a
7845  14a4 96            	ldw	x,sp
7846  14a5 1c000a        	addw	x,#OFST-45
7847  14a8 89            	pushw	x
7848  14a9 1c0033        	addw	x,#51
7849  14ac cd1045        	call	L1462_mount_volume
7851  14af 5b03          	addw	sp,#3
7852  14b1 6b37          	ld	(OFST+0,sp),a
7854                     ; 3727 	if (res == FR_OK) {
7856  14b3 2703cc1744    	jrne	L5133
7857                     ; 3728 		dj.obj.fs = fs;
7859  14b8 1e09          	ldw	x,(OFST-46,sp)
7860  14ba 1f0f          	ldw	(OFST-40,sp),x
7862                     ; 3730 		res = follow_path(&dj, path);	/* Follow the file path */
7865  14bc 1e3c          	ldw	x,(OFST+5,sp)
7866  14be 89            	pushw	x
7867  14bf 96            	ldw	x,sp
7868  14c0 1c0011        	addw	x,#OFST-38
7869  14c3 cd0e26        	call	L1232_follow_path
7871  14c6 85            	popw	x
7872  14c7 6b37          	ld	(OFST+0,sp),a
7874                     ; 3732 		if (res == FR_OK) {
7876  14c9 2608          	jrne	L7133
7877                     ; 3733 			if (dj.fn[NSFLAG] & NS_NONAME) {	/* Origin directory itself? */
7879  14cb 7b36          	ld	a,(OFST-1,sp)
7880  14cd 2a04          	jrpl	L7133
7881                     ; 3734 				res = FR_INVALID_NAME;
7883  14cf a606          	ld	a,#6
7884  14d1 6b37          	ld	(OFST+0,sp),a
7886  14d3               L7133:
7887                     ; 3743 		if (mode & (FA_CREATE_ALWAYS | FA_OPEN_ALWAYS | FA_CREATE_NEW)) {
7889  14d3 7b3e          	ld	a,(OFST+7,sp)
7890  14d5 a51c          	bcp	a,#28
7891  14d7 2603cc15ad    	jreq	L3233
7892                     ; 3744 			if (res != FR_OK) {					/* No file, create new */
7894  14dc 7b37          	ld	a,(OFST+0,sp)
7895  14de 2715          	jreq	L5233
7896                     ; 3745 				if (res == FR_NO_FILE) {		/* There is no file to open, create a new entry */
7898  14e0 a104          	cp	a,#4
7899  14e2 2609          	jrne	L7233
7900                     ; 3749 					res = dir_register(&dj);
7902  14e4 96            	ldw	x,sp
7903  14e5 1c000f        	addw	x,#OFST-40
7904  14e8 cd0cc4        	call	L3212_dir_register
7906  14eb 6b37          	ld	(OFST+0,sp),a
7908  14ed               L7233:
7909                     ; 3752 				mode |= FA_CREATE_ALWAYS;		/* File is created */
7911  14ed 7b3e          	ld	a,(OFST+7,sp)
7912  14ef aa08          	or	a,#8
7913  14f1 6b3e          	ld	(OFST+7,sp),a
7915  14f3 2014          	jra	L1333
7916  14f5               L5233:
7917                     ; 3755 				if (dj.obj.attr & (AM_RDO | AM_DIR)) {	/* Cannot overwrite it (R/O or DIR) */
7919  14f5 7b13          	ld	a,(OFST-36,sp)
7920  14f7 a511          	bcp	a,#17
7921  14f9 2704          	jreq	L3333
7922                     ; 3756 					res = FR_DENIED;
7924  14fb a607          	ld	a,#7
7926  14fd 2008          	jp	LC028
7927  14ff               L3333:
7928                     ; 3758 					if (mode & FA_CREATE_NEW) res = FR_EXIST;	/* Cannot create as new file */
7930  14ff 7b3e          	ld	a,(OFST+7,sp)
7931  1501 a504          	bcp	a,#4
7932  1503 2704          	jreq	L1333
7935  1505 a608          	ld	a,#8
7936  1507               LC028:
7937  1507 6b37          	ld	(OFST+0,sp),a
7939  1509               L1333:
7940                     ; 3761 			if (res == FR_OK && (mode & FA_CREATE_ALWAYS)) {	/* Truncate the file if overwrite mode */
7942  1509 7b37          	ld	a,(OFST+0,sp)
7943  150b 2703cc15cb    	jrne	L7433
7945  1510 7b3e          	ld	a,(OFST+7,sp)
7946  1512 a508          	bcp	a,#8
7947  1514 27f7          	jreq	L7433
7948                     ; 3782 					cl = ld_clust(fs, dj.dir);			/* Get current cluster chain */
7950  1516 1e29          	ldw	x,(OFST-14,sp)
7951  1518 89            	pushw	x
7952  1519 1e0b          	ldw	x,(OFST-44,sp)
7953  151b cd0c05        	call	L1671_ld_clust
7955  151e 85            	popw	x
7956  151f 96            	ldw	x,sp
7957  1520 1c0005        	addw	x,#OFST-50
7958  1523 cd0000        	call	c_rtol
7961                     ; 3783 					st_dword(dj.dir + DIR_CrtTime, GET_FATTIME());	/* Set created time */
7963  1526 5f            	clrw	x
7964  1527 89            	pushw	x
7965  1528 ae5021        	ldw	x,#20513
7966  152b 89            	pushw	x
7967  152c 1e2d          	ldw	x,(OFST-10,sp)
7968  152e 1c000e        	addw	x,#14
7969  1531 cd0090        	call	L311_st_dword
7971  1534 5b04          	addw	sp,#4
7972                     ; 3784 					dj.dir[DIR_Attr] = AM_ARC;			/* Reset attribute */
7974  1536 1e29          	ldw	x,(OFST-14,sp)
7975  1538 a620          	ld	a,#32
7976  153a e70b          	ld	(11,x),a
7977                     ; 3785 					st_clust(fs, dj.dir, 0);			/* Reset file allocation info */
7979  153c 5f            	clrw	x
7980  153d 89            	pushw	x
7981  153e 89            	pushw	x
7982  153f 1e2d          	ldw	x,(OFST-10,sp)
7983  1541 89            	pushw	x
7984  1542 1e0f          	ldw	x,(OFST-40,sp)
7985  1544 cd0c35        	call	L3102_st_clust
7987  1547 5b06          	addw	sp,#6
7988                     ; 3786 					st_dword(dj.dir + DIR_FileSize, 0);
7990  1549 5f            	clrw	x
7991  154a 89            	pushw	x
7992  154b 89            	pushw	x
7993  154c 1e2d          	ldw	x,(OFST-10,sp)
7994  154e 1c001c        	addw	x,#28
7995  1551 cd0090        	call	L311_st_dword
7997  1554 5b04          	addw	sp,#4
7998                     ; 3787 					fs->wflag = 1;
8000  1556 1e09          	ldw	x,(OFST-46,sp)
8001  1558 a601          	ld	a,#1
8002  155a e703          	ld	(3,x),a
8003                     ; 3788 					if (cl != 0) {						/* Remove the cluster chain if exist */
8005  155c 96            	ldw	x,sp
8006  155d 1c0005        	addw	x,#OFST-50
8007  1560 cd0000        	call	c_lzmp
8009  1563 2766          	jreq	L7433
8010                     ; 3789 						sc = fs->winsect;
8012  1565 1e09          	ldw	x,(OFST-46,sp)
8013  1567 9093          	ldw	y,x
8014  1569 ee2d          	ldw	x,(45,x)
8015  156b 1f03          	ldw	(OFST-52,sp),x
8016  156d 93            	ldw	x,y
8017  156e ee2b          	ldw	x,(43,x)
8018  1570 1f01          	ldw	(OFST-54,sp),x
8020                     ; 3790 						res = remove_chain(&dj.obj, cl, 0);
8022  1572 5f            	clrw	x
8023  1573 89            	pushw	x
8024  1574 89            	pushw	x
8025  1575 1e0b          	ldw	x,(OFST-44,sp)
8026  1577 89            	pushw	x
8027  1578 1e0b          	ldw	x,(OFST-44,sp)
8028  157a 89            	pushw	x
8029  157b 96            	ldw	x,sp
8030  157c 1c0017        	addw	x,#OFST-32
8031  157f cd047a        	call	L5111_remove_chain
8033  1582 5b08          	addw	sp,#8
8034  1584 6b37          	ld	(OFST+0,sp),a
8036                     ; 3791 						if (res == FR_OK) {
8038  1586 2643          	jrne	L7433
8039                     ; 3792 							res = move_window(fs, sc);
8041  1588 1e03          	ldw	x,(OFST-52,sp)
8042  158a 89            	pushw	x
8043  158b 1e03          	ldw	x,(OFST-52,sp)
8044  158d 89            	pushw	x
8045  158e 1e0d          	ldw	x,(OFST-42,sp)
8046  1590 cd01d0        	call	L316_move_window
8048  1593 5b04          	addw	sp,#4
8049  1595 6b37          	ld	(OFST+0,sp),a
8051                     ; 3793 							fs->last_clst = cl - 1;		/* Reuse the cluster hole */
8053  1597 96            	ldw	x,sp
8054  1598 1c0005        	addw	x,#OFST-50
8055  159b cd0000        	call	c_ltor
8057  159e a601          	ld	a,#1
8058  15a0 cd0000        	call	c_lsbc
8060  15a3 1e09          	ldw	x,(OFST-46,sp)
8061  15a5 1c000b        	addw	x,#11
8062  15a8 cd0000        	call	c_rtol
8064  15ab 201e          	jra	L7433
8065  15ad               L3233:
8066                     ; 3800 			if (res == FR_OK) {					/* Is the object exsiting? */
8068  15ad 7b37          	ld	a,(OFST+0,sp)
8069  15af 261a          	jrne	L7433
8070                     ; 3801 				if (dj.obj.attr & AM_DIR) {		/* File open against a directory */
8072  15b1 7b13          	ld	a,(OFST-36,sp)
8073  15b3 a510          	bcp	a,#16
8074  15b5 2704          	jreq	L3533
8075                     ; 3802 					res = FR_NO_FILE;
8077  15b7 a604          	ld	a,#4
8079  15b9 200e          	jp	LC029
8080  15bb               L3533:
8081                     ; 3804 					if ((mode & FA_WRITE) && (dj.obj.attr & AM_RDO)) { /* Write mode open against R/O file */
8083  15bb 7b3e          	ld	a,(OFST+7,sp)
8084  15bd a502          	bcp	a,#2
8085  15bf 270a          	jreq	L7433
8087  15c1 7b13          	ld	a,(OFST-36,sp)
8088  15c3 a501          	bcp	a,#1
8089  15c5 2704          	jreq	L7433
8090                     ; 3805 						res = FR_DENIED;
8092  15c7 a607          	ld	a,#7
8093  15c9               LC029:
8094  15c9 6b37          	ld	(OFST+0,sp),a
8096  15cb               L7433:
8097                     ; 3810 		if (res == FR_OK) {
8099  15cb 7b37          	ld	a,(OFST+0,sp)
8100  15cd 2627          	jrne	L1633
8101                     ; 3811 			if (mode & FA_CREATE_ALWAYS) mode |= FA_MODIFIED;	/* Set file change flag if created or overwritten */
8103  15cf 7b3e          	ld	a,(OFST+7,sp)
8104  15d1 a508          	bcp	a,#8
8105  15d3 2704          	jreq	L3633
8108  15d5 aa40          	or	a,#64
8109  15d7 6b3e          	ld	(OFST+7,sp),a
8110  15d9               L3633:
8111                     ; 3812 			fp->dir_sect = fs->winsect;			/* Pointer to the directory entry */
8113  15d9 1e09          	ldw	x,(OFST-46,sp)
8114  15db 1638          	ldw	y,(OFST+1,sp)
8115  15dd e62e          	ld	a,(46,x)
8116  15df 90e71f        	ld	(31,y),a
8117  15e2 e62d          	ld	a,(45,x)
8118  15e4 90e71e        	ld	(30,y),a
8119  15e7 e62c          	ld	a,(44,x)
8120  15e9 90e71d        	ld	(29,y),a
8121  15ec e62b          	ld	a,(43,x)
8122  15ee 90e71c        	ld	(28,y),a
8123                     ; 3813 			fp->dir_ptr = dj.dir;
8125  15f1 93            	ldw	x,y
8126  15f2 1629          	ldw	y,(OFST-14,sp)
8127  15f4 ef20          	ldw	(32,x),y
8128  15f6               L1633:
8129                     ; 3831 		if (res == FR_OK) {
8131  15f6 7b37          	ld	a,(OFST+0,sp)
8132  15f8 2703cc1744    	jrne	L5133
8133                     ; 3841 				fp->obj.sclust = ld_clust(fs, dj.dir);					/* Get object allocation info */
8135  15fd 1e29          	ldw	x,(OFST-14,sp)
8136  15ff 89            	pushw	x
8137  1600 1e0b          	ldw	x,(OFST-44,sp)
8138  1602 cd0c05        	call	L1671_ld_clust
8140  1605 85            	popw	x
8141  1606 1e38          	ldw	x,(OFST+1,sp)
8142  1608 1c0006        	addw	x,#6
8143  160b cd0000        	call	c_rtol
8145                     ; 3842 				fp->obj.objsize = ld_dword(dj.dir + DIR_FileSize);
8147  160e 1e29          	ldw	x,(OFST-14,sp)
8148  1610 1c001c        	addw	x,#28
8149  1613 cd000d        	call	L34_ld_dword
8151  1616 1e38          	ldw	x,(OFST+1,sp)
8152  1618 1c000a        	addw	x,#10
8153  161b cd0000        	call	c_rtol
8155                     ; 3847 			fp->obj.fs = fs;	 	/* Validate the file object */
8157  161e 1e38          	ldw	x,(OFST+1,sp)
8158  1620 1609          	ldw	y,(OFST-46,sp)
8159  1622 ff            	ldw	(x),y
8160                     ; 3848 			fp->obj.id = fs->id;
8162  1623 93            	ldw	x,y
8163  1624 1638          	ldw	y,(OFST+1,sp)
8164  1626 ee05          	ldw	x,(5,x)
8165  1628 90ef02        	ldw	(2,y),x
8166                     ; 3849 			fp->flag = mode;		/* Set file access mode */
8168  162b 93            	ldw	x,y
8169  162c 7b3e          	ld	a,(OFST+7,sp)
8170  162e e70e          	ld	(14,x),a
8171                     ; 3850 			fp->err = 0;			/* Clear error flag */
8173  1630 6f0f          	clr	(15,x)
8174                     ; 3851 			fp->sect = 0;			/* Invalidate current data sector */
8176  1632 4f            	clr	a
8177  1633 e71b          	ld	(27,x),a
8178  1635 e71a          	ld	(26,x),a
8179  1637 e719          	ld	(25,x),a
8180  1639 e718          	ld	(24,x),a
8181                     ; 3852 			fp->fptr = 0;			/* Set file pointer top of the file */
8183  163b e713          	ld	(19,x),a
8184  163d e712          	ld	(18,x),a
8185  163f e711          	ld	(17,x),a
8186  1641 e710          	ld	(16,x),a
8187                     ; 3857 			if ((mode & FA_SEEKEND) && fp->obj.objsize > 0) {	/* Seek to end of file if FA_OPEN_APPEND is specified */
8189  1643 7b3e          	ld	a,(OFST+7,sp)
8190  1645 a520          	bcp	a,#32
8191  1647 27b1          	jreq	L5133
8193  1649 1c000a        	addw	x,#10
8194  164c cd0000        	call	c_lzmp
8196  164f 27a9          	jreq	L5133
8197                     ; 3858 				fp->fptr = fp->obj.objsize;			/* Offset to seek */
8199  1651 1e38          	ldw	x,(OFST+1,sp)
8200  1653 9093          	ldw	y,x
8201  1655 e60d          	ld	a,(13,x)
8202  1657 90e713        	ld	(19,y),a
8203  165a e60c          	ld	a,(12,x)
8204  165c 90e712        	ld	(18,y),a
8205  165f e60b          	ld	a,(11,x)
8206  1661 90e711        	ld	(17,y),a
8207  1664 e60a          	ld	a,(10,x)
8208  1666 90e710        	ld	(16,y),a
8209                     ; 3859 				bcs = (DWORD)fs->csize * SS(fs);	/* Cluster size in byte */
8211  1669 1e09          	ldw	x,(OFST-46,sp)
8212  166b 90ae0200      	ldw	y,#512
8213  166f ee09          	ldw	x,(9,x)
8214  1671 cd0000        	call	c_umul
8216  1674 96            	ldw	x,sp
8217  1675 5c            	incw	x
8218  1676 cd0000        	call	c_rtol
8221                     ; 3860 				clst = fp->obj.sclust;				/* Follow the cluster chain */
8223  1679 1e38          	ldw	x,(OFST+1,sp)
8224  167b 9093          	ldw	y,x
8225  167d ee08          	ldw	x,(8,x)
8226  167f 1f0d          	ldw	(OFST-42,sp),x
8227  1681 93            	ldw	x,y
8228  1682 ee06          	ldw	x,(6,x)
8229  1684 1f0b          	ldw	(OFST-44,sp),x
8231                     ; 3861 				for (ofs = fp->obj.objsize; res == FR_OK && ofs > bcs; ofs -= bcs) {
8233  1686 1e38          	ldw	x,(OFST+1,sp)
8234  1688 9093          	ldw	y,x
8235  168a ee0c          	ldw	x,(12,x)
8236  168c 1f07          	ldw	(OFST-48,sp),x
8237  168e 93            	ldw	x,y
8238  168f ee0a          	ldw	x,(10,x)
8239  1691 1f05          	ldw	(OFST-50,sp),x
8242  1693 2046          	jra	L5733
8243  1695               L1733:
8244                     ; 3862 					clst = get_fat(&fp->obj, clst);
8246  1695 1e0d          	ldw	x,(OFST-42,sp)
8247  1697 89            	pushw	x
8248  1698 1e0d          	ldw	x,(OFST-42,sp)
8249  169a 89            	pushw	x
8250  169b 1e3c          	ldw	x,(OFST+5,sp)
8251  169d cd033f        	call	L737_get_fat
8253  16a0 5b04          	addw	sp,#4
8254  16a2 96            	ldw	x,sp
8255  16a3 1c000b        	addw	x,#OFST-44
8256  16a6 cd0000        	call	c_rtol
8259                     ; 3863 					if (clst <= 1) res = FR_INT_ERR;
8261  16a9 96            	ldw	x,sp
8262  16aa 1c000b        	addw	x,#OFST-44
8263  16ad cd0000        	call	c_ltor
8265  16b0 ae0080        	ldw	x,#L001
8266  16b3 cd0000        	call	c_lcmp
8268  16b6 2404          	jruge	L1043
8271  16b8 a602          	ld	a,#2
8272  16ba 6b37          	ld	(OFST+0,sp),a
8274  16bc               L1043:
8275                     ; 3864 					if (clst == 0xFFFFFFFF) res = FR_DISK_ERR;
8277  16bc 96            	ldw	x,sp
8278  16bd 1c000b        	addw	x,#OFST-44
8279  16c0 cd0000        	call	c_ltor
8281  16c3 ae0088        	ldw	x,#L621
8282  16c6 cd0000        	call	c_lcmp
8284  16c9 2604          	jrne	L3043
8287  16cb a601          	ld	a,#1
8288  16cd 6b37          	ld	(OFST+0,sp),a
8290  16cf               L3043:
8291                     ; 3861 				for (ofs = fp->obj.objsize; res == FR_OK && ofs > bcs; ofs -= bcs) {
8293  16cf 96            	ldw	x,sp
8294  16d0 5c            	incw	x
8295  16d1 cd0000        	call	c_ltor
8297  16d4 96            	ldw	x,sp
8298  16d5 1c0005        	addw	x,#OFST-50
8299  16d8 cd0000        	call	c_lgsub
8302  16db               L5733:
8305  16db 7b37          	ld	a,(OFST+0,sp)
8306  16dd 260e          	jrne	L5043
8308  16df 96            	ldw	x,sp
8309  16e0 1c0005        	addw	x,#OFST-50
8310  16e3 cd0000        	call	c_ltor
8312  16e6 96            	ldw	x,sp
8313  16e7 5c            	incw	x
8314  16e8 cd0000        	call	c_lcmp
8316  16eb 22a8          	jrugt	L1733
8317  16ed               L5043:
8318                     ; 3866 				fp->clust = clst;
8320  16ed 1e38          	ldw	x,(OFST+1,sp)
8321  16ef 7b0e          	ld	a,(OFST-41,sp)
8322  16f1 e717          	ld	(23,x),a
8323  16f3 7b0d          	ld	a,(OFST-42,sp)
8324  16f5 e716          	ld	(22,x),a
8325  16f7 7b0c          	ld	a,(OFST-43,sp)
8326  16f9 e715          	ld	(21,x),a
8327  16fb 7b0b          	ld	a,(OFST-44,sp)
8328  16fd e714          	ld	(20,x),a
8329                     ; 3867 				if (res == FR_OK && ofs % SS(fs)) {	/* Fill sector buffer if not on the sector boundary */
8331  16ff 0d37          	tnz	(OFST+0,sp)
8332  1701 2641          	jrne	L5133
8334  1703 1e07          	ldw	x,(OFST-48,sp)
8335  1705 02            	rlwa	x,a
8336  1706 a401          	and	a,#1
8337  1708 01            	rrwa	x,a
8338  1709 5d            	tnzw	x
8339  170a 2738          	jreq	L5133
8340                     ; 3868 					sc = clst2sect(fs, clst);
8342  170c 1e0d          	ldw	x,(OFST-42,sp)
8343  170e 89            	pushw	x
8344  170f 1e0d          	ldw	x,(OFST-42,sp)
8345  1711 89            	pushw	x
8346  1712 1e0d          	ldw	x,(OFST-42,sp)
8347  1714 cd02ff        	call	L707_clst2sect
8349  1717 5b04          	addw	sp,#4
8350  1719 96            	ldw	x,sp
8351  171a 5c            	incw	x
8352  171b cd0000        	call	c_rtol
8355                     ; 3869 					if (sc == 0) {
8357  171e 96            	ldw	x,sp
8358  171f 5c            	incw	x
8359  1720 cd0000        	call	c_lzmp
8361  1723 2606          	jrne	L1143
8362                     ; 3870 						res = FR_INT_ERR;
8364  1725 a602          	ld	a,#2
8365  1727 6b37          	ld	(OFST+0,sp),a
8368  1729 2019          	jra	L5133
8369  172b               L1143:
8370                     ; 3872 						fp->sect = sc + (DWORD)(ofs / SS(fs));
8372  172b 96            	ldw	x,sp
8373  172c 1c0005        	addw	x,#OFST-50
8374  172f cd0000        	call	c_ltor
8376  1732 a609          	ld	a,#9
8377  1734 cd0000        	call	c_lursh
8379  1737 96            	ldw	x,sp
8380  1738 5c            	incw	x
8381  1739 cd0000        	call	c_ladd
8383  173c 1e38          	ldw	x,(OFST+1,sp)
8384  173e 1c0018        	addw	x,#24
8385  1741 cd0000        	call	c_rtol
8387  1744               L5133:
8388                     ; 3885 	if (res != FR_OK) fp->obj.fs = 0;	/* Invalidate file object on error */
8390  1744 7b37          	ld	a,(OFST+0,sp)
8391  1746 2705          	jreq	L5143
8394  1748 1e38          	ldw	x,(OFST+1,sp)
8395  174a 905f          	clrw	y
8396  174c ff            	ldw	(x),y
8397  174d               L5143:
8398                     ; 3887 	LEAVE_FF(fs, res);
8402  174d 5b39          	addw	sp,#57
8403  174f 81            	ret	
8554                     ; 3998 FRESULT f_write (
8554                     ; 3999 	FIL* fp,			/* Pointer to the file object */
8554                     ; 4000 	const void* buff,	/* Pointer to the data to be written */
8554                     ; 4001 	UINT btw,			/* Number of bytes to write */
8554                     ; 4002 	UINT* bw			/* Pointer to number of bytes written */
8554                     ; 4003 )
8554                     ; 4004 {
8555                     	switch	.text
8556  1750               _f_write:
8558  1750 89            	pushw	x
8559  1751 5211          	subw	sp,#17
8560       00000011      OFST:	set	17
8563                     ; 4010 	const BYTE *wbuff = (const BYTE*)buff;
8565  1753 1e16          	ldw	x,(OFST+5,sp)
8566  1755 1f06          	ldw	(OFST-11,sp),x
8568                     ; 4013 	*bw = 0;	/* Clear write byte counter */
8570  1757 1e1a          	ldw	x,(OFST+9,sp)
8571  1759 905f          	clrw	y
8572  175b ff            	ldw	(x),y
8573                     ; 4014 	res = validate(&fp->obj, &fs);			/* Check validity of the file object */
8575  175c 96            	ldw	x,sp
8576  175d 1c000a        	addw	x,#OFST-7
8577  1760 89            	pushw	x
8578  1761 1e14          	ldw	x,(OFST+3,sp)
8579  1763 cd1412        	call	L7403_validate
8581  1766 85            	popw	x
8582  1767 6b05          	ld	(OFST-12,sp),a
8584                     ; 4015 	if (res != FR_OK || (res = (FRESULT)fp->err) != FR_OK) LEAVE_FF(fs, res);	/* Check validity */
8586  1769 2610          	jrne	L475
8588  176b 1e12          	ldw	x,(OFST+1,sp)
8589  176d e60f          	ld	a,(15,x)
8590  176f 6b05          	ld	(OFST-12,sp),a
8595  1771 2608          	jrne	L475
8596                     ; 4016 	if (!(fp->flag & FA_WRITE)) LEAVE_FF(fs, FR_DENIED);	/* Check access mode */
8598  1773 e60e          	ld	a,(14,x)
8599  1775 a502          	bcp	a,#2
8600  1777 2605          	jrne	L1253
8603  1779 a607          	ld	a,#7
8605  177b               L475:
8607  177b 5b13          	addw	sp,#19
8608  177d 81            	ret	
8609  177e               L1253:
8610                     ; 4019 	if ((!FF_FS_EXFAT || fs->fs_type != FS_EXFAT) && (DWORD)(fp->fptr + btw) < (DWORD)fp->fptr) {
8612  177e 1e18          	ldw	x,(OFST+7,sp)
8613  1780 cd0000        	call	c_uitolx
8615  1783 96            	ldw	x,sp
8616  1784 5c            	incw	x
8617  1785 cd0000        	call	c_rtol
8620  1788 1e12          	ldw	x,(OFST+1,sp)
8621  178a 1c0010        	addw	x,#16
8622  178d cd0000        	call	c_ltor
8624  1790 96            	ldw	x,sp
8625  1791 5c            	incw	x
8626  1792 cd0000        	call	c_ladd
8628  1795 1e12          	ldw	x,(OFST+1,sp)
8629  1797 1c0010        	addw	x,#16
8630  179a cd0000        	call	c_lcmp
8632  179d 2503cc19fe    	jruge	L1353
8633                     ; 4020 		btw = (UINT)(0xFFFFFFFF - (DWORD)fp->fptr);
8635  17a2 aeffff        	ldw	x,#65535
8636  17a5 1612          	ldw	y,(OFST+1,sp)
8637  17a7 01            	rrwa	x,a
8638  17a8 90e013        	sub	a,(19,y)
8639  17ab 01            	rrwa	x,a
8640  17ac 90e212        	sbc	a,(18,y)
8641  17af 01            	rrwa	x,a
8642  17b0 1f18          	ldw	(OFST+7,sp),x
8643  17b2 cc19fe        	jra	L1353
8644  17b5               L5253:
8645                     ; 4025 		if (fp->fptr % SS(fs) == 0) {		/* On the sector boundary? */
8647  17b5 1e12          	ldw	x,(OFST+1,sp)
8648  17b7 1c0010        	addw	x,#16
8649  17ba cd0000        	call	c_ltor
8651  17bd b602          	ld	a,c_lreg+2
8652  17bf a401          	and	a,#1
8653  17c1 b702          	ld	c_lreg+2,a
8654  17c3 3f01          	clr	c_lreg+1
8655  17c5 3f00          	clr	c_lreg
8656  17c7 cd0000        	call	c_lrzmp
8658  17ca 2703cc195b    	jrne	L5353
8659                     ; 4026 			csect = (UINT)(fp->fptr / SS(fs)) & (fs->csize - 1);	/* Sector offset in the cluster */
8661  17cf 1e0a          	ldw	x,(OFST-7,sp)
8662  17d1 ee09          	ldw	x,(9,x)
8663  17d3 5a            	decw	x
8664  17d4 1f03          	ldw	(OFST-14,sp),x
8666  17d6 1e12          	ldw	x,(OFST+1,sp)
8667  17d8 1c0010        	addw	x,#16
8668  17db cd0000        	call	c_ltor
8670  17de a609          	ld	a,#9
8671  17e0 cd0000        	call	c_lursh
8673  17e3 be02          	ldw	x,c_lreg+2
8674  17e5 01            	rrwa	x,a
8675  17e6 1404          	and	a,(OFST-13,sp)
8676  17e8 01            	rrwa	x,a
8677  17e9 1403          	and	a,(OFST-14,sp)
8678  17eb 01            	rrwa	x,a
8679  17ec 1f08          	ldw	(OFST-9,sp),x
8681                     ; 4027 			if (csect == 0) {				/* On the cluster boundary? */
8683  17ee 2703cc1892    	jrne	L7353
8684                     ; 4028 				if (fp->fptr == 0) {		/* On the top of the file? */
8686  17f3 1e12          	ldw	x,(OFST+1,sp)
8687  17f5 1c0010        	addw	x,#16
8688  17f8 cd0000        	call	c_lzmp
8690  17fb 261a          	jrne	L1453
8691                     ; 4029 					clst = fp->obj.sclust;	/* Follow from the origin */
8693  17fd 1e12          	ldw	x,(OFST+1,sp)
8694  17ff 9093          	ldw	y,x
8695  1801 ee08          	ldw	x,(8,x)
8696  1803 1f0e          	ldw	(OFST-3,sp),x
8697  1805 93            	ldw	x,y
8698  1806 ee06          	ldw	x,(6,x)
8699  1808 1f0c          	ldw	(OFST-5,sp),x
8701                     ; 4030 					if (clst == 0) {		/* If no cluster is allocated, */
8703  180a 96            	ldw	x,sp
8704  180b 1c000c        	addw	x,#OFST-5
8705  180e cd0000        	call	c_lzmp
8707  1811 261d          	jrne	L5453
8708                     ; 4031 						clst = create_chain(&fp->obj, 0);	/* create a new cluster chain */
8710  1813 5f            	clrw	x
8711  1814 89            	pushw	x
8715  1815 200a          	jp	LC031
8716  1817               L1453:
8717                     ; 4040 						clst = create_chain(&fp->obj, fp->clust);	/* Follow or stretch cluster chain on the FAT */
8719  1817 1e12          	ldw	x,(OFST+1,sp)
8720  1819 9093          	ldw	y,x
8721  181b ee16          	ldw	x,(22,x)
8722  181d 89            	pushw	x
8723  181e 93            	ldw	x,y
8724  181f ee14          	ldw	x,(20,x)
8726  1821               LC031:
8727  1821 89            	pushw	x
8728  1822 1e16          	ldw	x,(OFST+5,sp)
8729  1824 cd0573        	call	L5121_create_chain
8730  1827 5b04          	addw	sp,#4
8731  1829 96            	ldw	x,sp
8732  182a 1c000c        	addw	x,#OFST-5
8733  182d cd0000        	call	c_rtol
8736  1830               L5453:
8737                     ; 4043 				if (clst == 0) break;		/* Could not allocate a new cluster (disk full) */
8739  1830 96            	ldw	x,sp
8740  1831 1c000c        	addw	x,#OFST-5
8741  1834 cd0000        	call	c_lzmp
8743  1837 260c          	jrne	L7453
8745  1839               L3353:
8746                     ; 4108 	fp->flag |= FA_MODIFIED;				/* Set file change flag */
8748  1839 1e12          	ldw	x,(OFST+1,sp)
8749  183b e60e          	ld	a,(14,x)
8750  183d aa40          	or	a,#64
8751  183f e70e          	ld	(14,x),a
8752                     ; 4110 	LEAVE_FF(fs, FR_OK);
8754  1841 4f            	clr	a
8756  1842 cc177b        	jra	L475
8757  1845               L7453:
8758                     ; 4044 				if (clst == 1) ABORT(fs, FR_INT_ERR);
8760  1845 96            	ldw	x,sp
8761  1846 1c000c        	addw	x,#OFST-5
8762  1849 cd0000        	call	c_ltor
8764  184c ae0084        	ldw	x,#L421
8765  184f cd0000        	call	c_lcmp
8771  1852 277a          	jreq	LC033
8772                     ; 4045 				if (clst == 0xFFFFFFFF) ABORT(fs, FR_DISK_ERR);
8775  1854 96            	ldw	x,sp
8776  1855 1c000c        	addw	x,#OFST-5
8777  1858 cd0000        	call	c_ltor
8779  185b ae0088        	ldw	x,#L621
8780  185e cd0000        	call	c_lcmp
8786  1861 2603cc1988    	jreq	LC032
8787                     ; 4046 				fp->clust = clst;			/* Update current cluster */
8790  1866 1e12          	ldw	x,(OFST+1,sp)
8791  1868 7b0f          	ld	a,(OFST-2,sp)
8792  186a e717          	ld	(23,x),a
8793  186c 7b0e          	ld	a,(OFST-3,sp)
8794  186e e716          	ld	(22,x),a
8795  1870 7b0d          	ld	a,(OFST-4,sp)
8796  1872 e715          	ld	(21,x),a
8797  1874 7b0c          	ld	a,(OFST-5,sp)
8798  1876 e714          	ld	(20,x),a
8799                     ; 4047 				if (fp->obj.sclust == 0) fp->obj.sclust = clst;	/* Set start cluster if the first write */
8801  1878 1c0006        	addw	x,#6
8802  187b cd0000        	call	c_lzmp
8804  187e 2612          	jrne	L7353
8807  1880 1e12          	ldw	x,(OFST+1,sp)
8808  1882 7b0f          	ld	a,(OFST-2,sp)
8809  1884 e709          	ld	(9,x),a
8810  1886 7b0e          	ld	a,(OFST-3,sp)
8811  1888 e708          	ld	(8,x),a
8812  188a 7b0d          	ld	a,(OFST-4,sp)
8813  188c e707          	ld	(7,x),a
8814  188e 7b0c          	ld	a,(OFST-5,sp)
8815  1890 e706          	ld	(6,x),a
8816  1892               L7353:
8817                     ; 4050 			if (fs->winsect == fp->sect && sync_window(fs) != FR_OK) ABORT(fs, FR_DISK_ERR);	/* Write-back sector cache */
8819  1892 1e0a          	ldw	x,(OFST-7,sp)
8820  1894 1c002b        	addw	x,#43
8821  1897 cd0000        	call	c_ltor
8823  189a 1e12          	ldw	x,(OFST+1,sp)
8824  189c 1c0018        	addw	x,#24
8825  189f cd0000        	call	c_lcmp
8827  18a2 2608          	jrne	L7553
8829  18a4 1e0a          	ldw	x,(OFST-7,sp)
8830  18a6 cd014f        	call	L524_sync_window
8832  18a9 4d            	tnz	a
8837  18aa 26b7          	jrne	LC032
8838  18ac               L7553:
8839                     ; 4057 			sect = clst2sect(fs, fp->clust);	/* Get current sector */
8842  18ac 1e12          	ldw	x,(OFST+1,sp)
8843  18ae 9093          	ldw	y,x
8844  18b0 ee16          	ldw	x,(22,x)
8845  18b2 89            	pushw	x
8846  18b3 93            	ldw	x,y
8847  18b4 ee14          	ldw	x,(20,x)
8848  18b6 89            	pushw	x
8849  18b7 1e0e          	ldw	x,(OFST-3,sp)
8850  18b9 cd02ff        	call	L707_clst2sect
8852  18bc 5b04          	addw	sp,#4
8853  18be 96            	ldw	x,sp
8854  18bf 1c000c        	addw	x,#OFST-5
8855  18c2 cd0000        	call	c_rtol
8858                     ; 4058 			if (sect == 0) ABORT(fs, FR_INT_ERR);
8860  18c5 96            	ldw	x,sp
8861  18c6 1c000c        	addw	x,#OFST-5
8862  18c9 cd0000        	call	c_lzmp
8864  18cc 2607          	jrne	L1653
8867  18ce               LC033:
8869  18ce 1e12          	ldw	x,(OFST+1,sp)
8870  18d0 a602          	ld	a,#2
8874  18d2 cc198c        	jp	LC030
8875  18d5               L1653:
8876                     ; 4059 			sect += csect;
8879  18d5 1e08          	ldw	x,(OFST-9,sp)
8880  18d7 cd0000        	call	c_uitolx
8882  18da 96            	ldw	x,sp
8883  18db 1c000c        	addw	x,#OFST-5
8884  18de cd0000        	call	c_lgadd
8887                     ; 4060 			cc = btw / SS(fs);				/* When remaining bytes >= sector size, */
8889  18e1 1e18          	ldw	x,(OFST+7,sp)
8890  18e3 4f            	clr	a
8891  18e4 01            	rrwa	x,a
8892  18e5 54            	srlw	x
8893  18e6 1f10          	ldw	(OFST-1,sp),x
8895                     ; 4061 			if (cc > 0) {					/* Write maximum contiguous sectors directly */
8897  18e8 2733          	jreq	L3653
8898                     ; 4062 				if (csect + cc > fs->csize) {	/* Clip at cluster boundary */
8900  18ea 160a          	ldw	y,(OFST-7,sp)
8901  18ec 72fb08        	addw	x,(OFST-9,sp)
8902  18ef 90e309        	cpw	x,(9,y)
8903  18f2 2308          	jrule	L5653
8904                     ; 4063 					cc = fs->csize - csect;
8906  18f4 93            	ldw	x,y
8907  18f5 ee09          	ldw	x,(9,x)
8908  18f7 72f008        	subw	x,(OFST-9,sp)
8909  18fa 1f10          	ldw	(OFST-1,sp),x
8911  18fc               L5653:
8912                     ; 4065 				if (disk_write(fs->pdrv, wbuff, sect, cc) != RES_OK) ABORT(fs, FR_DISK_ERR);
8914  18fc 1e10          	ldw	x,(OFST-1,sp)
8915  18fe 89            	pushw	x
8916  18ff 1e10          	ldw	x,(OFST-1,sp)
8917  1901 89            	pushw	x
8918  1902 1e10          	ldw	x,(OFST-1,sp)
8919  1904 89            	pushw	x
8920  1905 1e0c          	ldw	x,(OFST-5,sp)
8921  1907 89            	pushw	x
8922  1908 1e12          	ldw	x,(OFST+1,sp)
8923  190a e601          	ld	a,(1,x)
8924  190c cd0000        	call	_disk_write
8926  190f 5b08          	addw	sp,#8
8927  1911 4d            	tnz	a
8932  1912 2674          	jrne	LC032
8933                     ; 4079 				wcnt = SS(fs) * cc;		/* Number of bytes transferred */
8936  1914 1e10          	ldw	x,(OFST-1,sp)
8937  1916 02            	rlwa	x,a
8938  1917 58            	sllw	x
8939  1918 1f10          	ldw	(OFST-1,sp),x
8941                     ; 4080 				continue;
8943  191a cc19b0        	jra	L7253
8944  191d               L3653:
8945                     ; 4083 			if (fp->fptr >= fp->obj.objsize) {	/* Avoid silly cache filling on the growing edge */
8947  191d 1e12          	ldw	x,(OFST+1,sp)
8948  191f 1c0010        	addw	x,#16
8949  1922 cd0000        	call	c_ltor
8951  1925 1e12          	ldw	x,(OFST+1,sp)
8952  1927 1c000a        	addw	x,#10
8953  192a cd0000        	call	c_lcmp
8955  192d 251a          	jrult	L1753
8956                     ; 4084 				if (sync_window(fs) != FR_OK) ABORT(fs, FR_DISK_ERR);
8958  192f 1e0a          	ldw	x,(OFST-7,sp)
8959  1931 cd014f        	call	L524_sync_window
8961  1934 4d            	tnz	a
8966  1935 2651          	jrne	LC032
8967                     ; 4085 				fs->winsect = sect;
8970  1937 1e0a          	ldw	x,(OFST-7,sp)
8971  1939 7b0f          	ld	a,(OFST-2,sp)
8972  193b e72e          	ld	(46,x),a
8973  193d 7b0e          	ld	a,(OFST-3,sp)
8974  193f e72d          	ld	(45,x),a
8975  1941 7b0d          	ld	a,(OFST-4,sp)
8976  1943 e72c          	ld	(44,x),a
8977  1945 7b0c          	ld	a,(OFST-5,sp)
8978  1947 e72b          	ld	(43,x),a
8979  1949               L1753:
8980                     ; 4094 			fp->sect = sect;
8982  1949 1e12          	ldw	x,(OFST+1,sp)
8983  194b 7b0f          	ld	a,(OFST-2,sp)
8984  194d e71b          	ld	(27,x),a
8985  194f 7b0e          	ld	a,(OFST-3,sp)
8986  1951 e71a          	ld	(26,x),a
8987  1953 7b0d          	ld	a,(OFST-4,sp)
8988  1955 e719          	ld	(25,x),a
8989  1957 7b0c          	ld	a,(OFST-5,sp)
8990  1959 e718          	ld	(24,x),a
8991  195b               L5353:
8992                     ; 4096 		wcnt = SS(fs) - (UINT)fp->fptr % SS(fs);	/* Number of bytes remains in the sector */
8994  195b 1e12          	ldw	x,(OFST+1,sp)
8995  195d ee12          	ldw	x,(18,x)
8996  195f 02            	rlwa	x,a
8997  1960 a401          	and	a,#1
8998  1962 01            	rrwa	x,a
8999  1963 1f03          	ldw	(OFST-14,sp),x
9001  1965 ae0200        	ldw	x,#512
9002  1968 72f003        	subw	x,(OFST-14,sp)
9004                     ; 4097 		if (wcnt > btw) wcnt = btw;					/* Clip it by btw if needed */
9006  196b 1318          	cpw	x,(OFST+7,sp)
9007  196d 2302          	jrule	L5753
9010  196f 1e18          	ldw	x,(OFST+7,sp)
9012  1971               L5753:
9013  1971 1f10          	ldw	(OFST-1,sp),x
9014                     ; 4099 		if (move_window(fs, fp->sect) != FR_OK) ABORT(fs, FR_DISK_ERR);	/* Move sector window */
9016  1973 1e12          	ldw	x,(OFST+1,sp)
9017  1975 9093          	ldw	y,x
9018  1977 ee1a          	ldw	x,(26,x)
9019  1979 89            	pushw	x
9020  197a 93            	ldw	x,y
9021  197b ee18          	ldw	x,(24,x)
9022  197d 89            	pushw	x
9023  197e 1e0e          	ldw	x,(OFST-3,sp)
9024  1980 cd01d0        	call	L316_move_window
9026  1983 5b04          	addw	sp,#4
9027  1985 4d            	tnz	a
9028  1986 2709          	jreq	L7753
9031  1988               LC032:
9036  1988 1e12          	ldw	x,(OFST+1,sp)
9037  198a a601          	ld	a,#1
9038  198c               LC030:
9039  198c e70f          	ld	(15,x),a
9043  198e cc177b        	jra	L475
9044  1991               L7753:
9045                     ; 4100 		mem_cpy(fs->win + fp->fptr % SS(fs), wbuff, wcnt);	/* Fit data to the sector */
9048  1991 1e10          	ldw	x,(OFST-1,sp)
9049  1993 89            	pushw	x
9050  1994 1e08          	ldw	x,(OFST-9,sp)
9051  1996 89            	pushw	x
9052  1997 1e16          	ldw	x,(OFST+5,sp)
9053  1999 ee12          	ldw	x,(18,x)
9054  199b 02            	rlwa	x,a
9055  199c a401          	and	a,#1
9056  199e 01            	rrwa	x,a
9057  199f 72fb0e        	addw	x,(OFST-3,sp)
9058  19a2 1c002f        	addw	x,#47
9059  19a5 cd00bf        	call	L731_mem_cpy
9061  19a8 5b04          	addw	sp,#4
9062                     ; 4101 		fs->wflag = 1;
9064  19aa 1e0a          	ldw	x,(OFST-7,sp)
9065  19ac a601          	ld	a,#1
9066  19ae e703          	ld	(3,x),a
9067  19b0               L7253:
9068                     ; 4023 	for ( ;  btw;							/* Repeat until all data written */
9068                     ; 4024 		btw -= wcnt, *bw += wcnt, wbuff += wcnt, fp->fptr += wcnt, fp->obj.objsize = (fp->fptr > fp->obj.objsize) ? fp->fptr : fp->obj.objsize) {
9070  19b0 1e18          	ldw	x,(OFST+7,sp)
9071  19b2 72f010        	subw	x,(OFST-1,sp)
9072  19b5 1f18          	ldw	(OFST+7,sp),x
9073  19b7 1e1a          	ldw	x,(OFST+9,sp)
9074  19b9 9093          	ldw	y,x
9075  19bb fe            	ldw	x,(x)
9076  19bc 72fb10        	addw	x,(OFST-1,sp)
9077  19bf 90ff          	ldw	(y),x
9078  19c1 1e06          	ldw	x,(OFST-11,sp)
9079  19c3 72fb10        	addw	x,(OFST-1,sp)
9080  19c6 1f06          	ldw	(OFST-11,sp),x
9082  19c8 1610          	ldw	y,(OFST-1,sp)
9083  19ca 1e12          	ldw	x,(OFST+1,sp)
9084  19cc cd0000        	call	c_uitoly
9086  19cf 1c0010        	addw	x,#16
9087  19d2 cd0000        	call	c_lgadd
9089  19d5 1e12          	ldw	x,(OFST+1,sp)
9090  19d7 1c0010        	addw	x,#16
9091  19da cd0000        	call	c_ltor
9093  19dd 1e12          	ldw	x,(OFST+1,sp)
9094  19df 1c000a        	addw	x,#10
9095  19e2 cd0000        	call	c_lcmp
9097  19e5 2307          	jrule	L075
9098  19e7 1e12          	ldw	x,(OFST+1,sp)
9099  19e9 1c0010        	addw	x,#16
9101  19ec 2005          	jra	L275
9102  19ee               L075:
9103  19ee 1e12          	ldw	x,(OFST+1,sp)
9104  19f0 1c000a        	addw	x,#10
9106  19f3               L275:
9107  19f3 cd0000        	call	c_ltor
9108  19f6 1e12          	ldw	x,(OFST+1,sp)
9109  19f8 1c000a        	addw	x,#10
9110  19fb cd0000        	call	c_rtol
9112  19fe               L1353:
9113                     ; 4023 	for ( ;  btw;							/* Repeat until all data written */
9115  19fe 1e18          	ldw	x,(OFST+7,sp)
9116  1a00 2703cc17b5    	jrne	L5253
9117  1a05 cc1839        	jra	L3353
9202                     ; 4120 FRESULT f_sync (
9202                     ; 4121 	FIL* fp		/* Pointer to the file object */
9202                     ; 4122 )
9202                     ; 4123 {
9203                     	switch	.text
9204  1a08               _f_sync:
9206  1a08 89            	pushw	x
9207  1a09 5209          	subw	sp,#9
9208       00000009      OFST:	set	9
9211                     ; 4130 	res = validate(&fp->obj, &fs);	/* Check validity of the file object */
9213  1a0b 96            	ldw	x,sp
9214  1a0c 1c0005        	addw	x,#OFST-4
9215  1a0f 89            	pushw	x
9216  1a10 1e0c          	ldw	x,(OFST+3,sp)
9217  1a12 cd1412        	call	L7403_validate
9219  1a15 85            	popw	x
9220  1a16 6b07          	ld	(OFST-2,sp),a
9222                     ; 4131 	if (res == FR_OK) {
9224  1a18 2703cc1aa8    	jrne	L3463
9225                     ; 4132 		if (fp->flag & FA_MODIFIED) {	/* Is there any change to the file? */
9227  1a1d 1e0a          	ldw	x,(OFST+1,sp)
9228  1a1f e60e          	ld	a,(14,x)
9229  1a21 a540          	bcp	a,#64
9230  1a23 27f5          	jreq	L3463
9231                     ; 4140 			tm = GET_FATTIME();				/* Modified time */
9233  1a25 5f            	clrw	x
9234  1a26 1f03          	ldw	(OFST-6,sp),x
9235  1a28 ae5021        	ldw	x,#20513
9236  1a2b 1f01          	ldw	(OFST-8,sp),x
9238                     ; 4173 				res = move_window(fs, fp->dir_sect);
9240  1a2d 1e0a          	ldw	x,(OFST+1,sp)
9241  1a2f 9093          	ldw	y,x
9242  1a31 ee1e          	ldw	x,(30,x)
9243  1a33 89            	pushw	x
9244  1a34 93            	ldw	x,y
9245  1a35 ee1c          	ldw	x,(28,x)
9246  1a37 89            	pushw	x
9247  1a38 1e09          	ldw	x,(OFST+0,sp)
9248  1a3a cd01d0        	call	L316_move_window
9250  1a3d 5b04          	addw	sp,#4
9251  1a3f 6b07          	ld	(OFST-2,sp),a
9253                     ; 4174 				if (res == FR_OK) {
9255  1a41 2665          	jrne	L3463
9256                     ; 4175 					dir = fp->dir_ptr;
9258  1a43 1e0a          	ldw	x,(OFST+1,sp)
9259  1a45 ee20          	ldw	x,(32,x)
9260  1a47 1f08          	ldw	(OFST-1,sp),x
9262                     ; 4176 					dir[DIR_Attr] |= AM_ARC;						/* Set archive attribute to indicate that the file has been changed */
9264  1a49 e60b          	ld	a,(11,x)
9265  1a4b aa20          	or	a,#32
9266  1a4d e70b          	ld	(11,x),a
9267                     ; 4177 					st_clust(fp->obj.fs, dir, fp->obj.sclust);		/* Update file allocation information  */
9269  1a4f 1e0a          	ldw	x,(OFST+1,sp)
9270  1a51 9093          	ldw	y,x
9271  1a53 ee08          	ldw	x,(8,x)
9272  1a55 89            	pushw	x
9273  1a56 93            	ldw	x,y
9274  1a57 ee06          	ldw	x,(6,x)
9275  1a59 89            	pushw	x
9276  1a5a 1e0c          	ldw	x,(OFST+3,sp)
9277  1a5c 89            	pushw	x
9278  1a5d 1e10          	ldw	x,(OFST+7,sp)
9279  1a5f fe            	ldw	x,(x)
9280  1a60 cd0c35        	call	L3102_st_clust
9282  1a63 5b06          	addw	sp,#6
9283                     ; 4178 					st_dword(dir + DIR_FileSize, (DWORD)fp->obj.objsize);	/* Update file size */
9285  1a65 1e0a          	ldw	x,(OFST+1,sp)
9286  1a67 9093          	ldw	y,x
9287  1a69 ee0c          	ldw	x,(12,x)
9288  1a6b 89            	pushw	x
9289  1a6c 93            	ldw	x,y
9290  1a6d ee0a          	ldw	x,(10,x)
9291  1a6f 89            	pushw	x
9292  1a70 1e0c          	ldw	x,(OFST+3,sp)
9293  1a72 1c001c        	addw	x,#28
9294  1a75 cd0090        	call	L311_st_dword
9296  1a78 5b04          	addw	sp,#4
9297                     ; 4179 					st_dword(dir + DIR_ModTime, tm);				/* Update modified time */
9299  1a7a 1e03          	ldw	x,(OFST-6,sp)
9300  1a7c 89            	pushw	x
9301  1a7d 1e03          	ldw	x,(OFST-6,sp)
9302  1a7f 89            	pushw	x
9303  1a80 1e0c          	ldw	x,(OFST+3,sp)
9304  1a82 1c0016        	addw	x,#22
9305  1a85 cd0090        	call	L311_st_dword
9307  1a88 5b04          	addw	sp,#4
9308                     ; 4180 					st_word(dir + DIR_LstAccDate, 0);
9310  1a8a 5f            	clrw	x
9311  1a8b 89            	pushw	x
9312  1a8c 1e0a          	ldw	x,(OFST+1,sp)
9313  1a8e 1c0012        	addw	x,#18
9314  1a91 cd0084        	call	L76_st_word
9316  1a94 85            	popw	x
9317                     ; 4181 					fs->wflag = 1;
9319  1a95 1e05          	ldw	x,(OFST-4,sp)
9320  1a97 a601          	ld	a,#1
9321  1a99 e703          	ld	(3,x),a
9322                     ; 4182 					res = sync_fs(fs);					/* Restore it to the directory */
9324  1a9b cd022a        	call	L356_sync_fs
9326  1a9e 6b07          	ld	(OFST-2,sp),a
9328                     ; 4183 					fp->flag &= (BYTE)~FA_MODIFIED;
9330  1aa0 1e0a          	ldw	x,(OFST+1,sp)
9331  1aa2 e60e          	ld	a,(14,x)
9332  1aa4 a4bf          	and	a,#191
9333  1aa6 e70e          	ld	(14,x),a
9334  1aa8               L3463:
9335                     ; 4189 	LEAVE_FF(fs, res);
9337  1aa8 7b07          	ld	a,(OFST-2,sp)
9340  1aaa 5b0b          	addw	sp,#11
9341  1aac 81            	ret	
9403                     ; 4201 FRESULT f_close (
9403                     ; 4202 	FIL* fp		/* Pointer to the file object to be closed */
9403                     ; 4203 )
9403                     ; 4204 {
9404                     	switch	.text
9405  1aad               _f_close:
9407  1aad 89            	pushw	x
9408  1aae 5203          	subw	sp,#3
9409       00000003      OFST:	set	3
9412                     ; 4209 	res = f_sync(fp);					/* Flush cached data */
9414  1ab0 cd1a08        	call	_f_sync
9416  1ab3 6b03          	ld	(OFST+0,sp),a
9418                     ; 4210 	if (res == FR_OK)
9420  1ab5 2612          	jrne	L3073
9421                     ; 4213 		res = validate(&fp->obj, &fs);	/* Lock volume */
9423  1ab7 96            	ldw	x,sp
9424  1ab8 5c            	incw	x
9425  1ab9 89            	pushw	x
9426  1aba 1e06          	ldw	x,(OFST+3,sp)
9427  1abc cd1412        	call	L7403_validate
9429  1abf 85            	popw	x
9430  1ac0 6b03          	ld	(OFST+0,sp),a
9432                     ; 4214 		if (res == FR_OK) {
9434  1ac2 2605          	jrne	L3073
9435                     ; 4219 			fp->obj.fs = 0;	/* Invalidate file object */
9437  1ac4 1e04          	ldw	x,(OFST+1,sp)
9438  1ac6 905f          	clrw	y
9439  1ac8 ff            	ldw	(x),y
9440  1ac9               L3073:
9441                     ; 4226 	return res;
9445  1ac9 5b05          	addw	sp,#5
9446  1acb 81            	ret	
9493                     	switch	.ubsct
9494  0000               L5_Fsid:
9495  0000 0000          	ds.b	2
9496  0002               L3_FatFs:
9497  0002 0000          	ds.b	2
9498                     	xref	_disk_ioctl
9499                     	xref	_disk_write
9500                     	xref	_disk_read
9501                     	xref	_disk_status
9502                     	xref	_disk_initialize
9503                     	xdef	_f_mount
9504                     	xdef	_f_sync
9505                     	xdef	_f_write
9506                     	xdef	_f_close
9507                     	xdef	_f_open
9508                     	switch	.const
9509  00a8               L1552:
9510  00a8 464154333200  	dc.b	"FAT32",0
9511  00ae               L5452:
9512  00ae 46415400      	dc.b	"FAT",0
9513  00b2               L1132:
9514  00b2 222a2b2c3a3b  	dc.b	34,42,43,44,58,59
9515  00b8 3c3d3e3f5b5d  	dc.b	"<=>?[]|",127,0
9516                     	xref.b	c_lreg
9517                     	xref.b	c_x
9518                     	xref.b	c_y
9538                     	xref	c_uitoly
9539                     	xref	c_smul
9540                     	xref	c_ludv
9541                     	xref	c_lgmul
9542                     	xref	c_lgor
9543                     	xref	c_lrzmp
9544                     	xref	c_land
9545                     	xref	c_lgadd
9546                     	xref	c_lgsub
9547                     	xref	c_umul
9548                     	xref	c_itolx
9549                     	xref	c_lgadc
9550                     	xref	c_lzmp
9551                     	xref	c_lursh
9552                     	xref	c_lmul
9553                     	xref	c_uitolx
9554                     	xref	c_lsbc
9555                     	xref	c_lgsbc
9556                     	xref	c_ladc
9557                     	xref	c_ladd
9558                     	xref	c_lcmp
9559                     	xref	c_lsub
9560                     	xref	c_lgursh
9561                     	xref	c_lor
9562                     	xref	c_rtol
9563                     	xref	c_llsh
9564                     	xref	c_ltor
9565                     	end
