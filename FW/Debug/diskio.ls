   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  46                     ; 13 DSTATUS disk_initialize ()
  46                     ; 14 {
  48                     	switch	.text
  49  0000               _disk_initialize:
  53                     ; 16 	if(SD_Detect() == SD_NOT_PRESENT)
  55  0000 cd0000        	call	_SD_Detect
  57  0003 4d            	tnz	a
  58  0004 2603          	jrne	L12
  59                     ; 17 		return STA_NODISK;
  61  0006 a602          	ld	a,#2
  64  0008 81            	ret	
  65  0009               L12:
  66                     ; 18 	if(SD_Init() == SD_RESPONSE_FAILURE){
  68  0009 cd0000        	call	_SD_Init
  70  000c 4c            	inc	a
  71  000d 2602          	jrne	L32
  72                     ; 19 		return STA_NOINIT;
  74  000f 4c            	inc	a
  77  0010 81            	ret	
  78  0011               L32:
  79                     ; 21 		return 0;
  81  0011 4f            	clr	a
  84  0012 81            	ret	
 196                     .const:	section	.text
 197  0000               L03:
 198  0000 00000200      	dc.l	512
 199                     ; 31 DRESULT disk_readp (
 199                     ; 32 	BYTE* buff,		/* Pointer to the destination object */
 199                     ; 33 	DWORD sector,	/* Sector number (LBA) */
 199                     ; 34 	UINT offset,	/* Offset in the sector */
 199                     ; 35 	UINT count		/* Byte count (bit15:destination) */
 199                     ; 36 )
 199                     ; 37 {
 200                     	switch	.text
 201  0013               _disk_readp:
 203  0013 89            	pushw	x
 204  0014 5205          	subw	sp,#5
 205       00000005      OFST:	set	5
 208                     ; 38 	DRESULT res = RES_ERROR;
 210  0016 a601          	ld	a,#1
 211  0018 6b01          	ld	(OFST-4,sp),a
 213                     ; 39 	uint32_t i = 0;
 215                     ; 41 	SD_CS_LOW();
 217  001a 7219500a      	bres	20490,#4
 218                     ; 44 	SD_SendCmd(SD_CMD_READ_SINGLE_BLOCK, sector, 0xFF);
 220  001e 4bff          	push	#255
 221  0020 1e0d          	ldw	x,(OFST+8,sp)
 222  0022 89            	pushw	x
 223  0023 1e0d          	ldw	x,(OFST+8,sp)
 224  0025 89            	pushw	x
 225  0026 a611          	ld	a,#17
 226  0028 cd0000        	call	_SD_SendCmd
 228  002b 5b05          	addw	sp,#5
 229                     ; 47 	if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
 231  002d 4f            	clr	a
 232  002e cd0000        	call	_SD_GetResponse
 234  0031 4d            	tnz	a
 235  0032 2673          	jrne	L57
 236                     ; 50 		if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
 238  0034 a6fe          	ld	a,#254
 239  0036 cd0000        	call	_SD_GetResponse
 241  0039 4d            	tnz	a
 242  003a 266b          	jrne	L57
 243                     ; 53 			for(i = 0; i < offset; i++){
 245  003c 5f            	clrw	x
 246  003d 1f04          	ldw	(OFST-1,sp),x
 247  003f 1f02          	ldw	(OFST-3,sp),x
 250  0041 200c          	jra	L501
 251  0043               L101:
 252                     ; 54 				SD_ReadByte();
 254  0043 cd0000        	call	_SD_ReadByte
 256                     ; 53 			for(i = 0; i < offset; i++){
 258  0046 96            	ldw	x,sp
 259  0047 1c0002        	addw	x,#OFST-3
 260  004a a601          	ld	a,#1
 261  004c cd0000        	call	c_lgadc
 264  004f               L501:
 267  004f 1e0e          	ldw	x,(OFST+9,sp)
 268  0051 cd0000        	call	c_uitolx
 270  0054 96            	ldw	x,sp
 271  0055 1c0002        	addw	x,#OFST-3
 272  0058 cd0000        	call	c_lcmp
 274  005b 22e6          	jrugt	L101
 276  005d 2012          	jra	L511
 277  005f               L111:
 278                     ; 59 				*buff = SD_ReadByte();
 280  005f cd0000        	call	_SD_ReadByte
 282  0062 1e06          	ldw	x,(OFST+1,sp)
 283  0064 f7            	ld	(x),a
 284                     ; 62 				buff++;
 286  0065 5c            	incw	x
 287  0066 1f06          	ldw	(OFST+1,sp),x
 288                     ; 56 			for (; i < offset+count; i++)
 290  0068 96            	ldw	x,sp
 291  0069 1c0002        	addw	x,#OFST-3
 292  006c a601          	ld	a,#1
 293  006e cd0000        	call	c_lgadc
 296  0071               L511:
 299  0071 1e0e          	ldw	x,(OFST+9,sp)
 300  0073 72fb10        	addw	x,(OFST+11,sp)
 301  0076 cd0000        	call	c_uitolx
 303  0079 96            	ldw	x,sp
 304  007a 1c0002        	addw	x,#OFST-3
 305  007d cd0000        	call	c_lcmp
 307  0080 22dd          	jrugt	L111
 309  0082 200c          	jra	L521
 310  0084               L121:
 311                     ; 65 				SD_ReadByte();
 313  0084 cd0000        	call	_SD_ReadByte
 315                     ; 64 			for(;i < 512; i++){
 317  0087 96            	ldw	x,sp
 318  0088 1c0002        	addw	x,#OFST-3
 319  008b a601          	ld	a,#1
 320  008d cd0000        	call	c_lgadc
 323  0090               L521:
 326  0090 96            	ldw	x,sp
 327  0091 1c0002        	addw	x,#OFST-3
 328  0094 cd0000        	call	c_ltor
 330  0097 ae0000        	ldw	x,#L03
 331  009a cd0000        	call	c_lcmp
 333  009d 25e5          	jrult	L121
 334                     ; 68 			SD_ReadByte();
 336  009f cd0000        	call	_SD_ReadByte
 338                     ; 69 			SD_ReadByte();
 340  00a2 cd0000        	call	_SD_ReadByte
 342                     ; 71 			res = RES_OK;
 344  00a5 0f01          	clr	(OFST-4,sp)
 346  00a7               L57:
 347                     ; 75 	SD_CS_HIGH();
 349  00a7 7218500a      	bset	20490,#4
 350                     ; 78 	SD_WriteByte(SD_DUMMY_BYTE);
 352  00ab a6ff          	ld	a,#255
 353  00ad cd0000        	call	_SD_WriteByte
 355                     ; 81 	return res;
 357  00b0 7b01          	ld	a,(OFST-4,sp)
 360  00b2 5b07          	addw	sp,#7
 361  00b4 81            	ret	
 364                     	switch	.data
 365  0000               L131_byteLeft:
 366  0000 00000200      	dc.l	512
 430                     ; 90 DRESULT disk_writep (
 430                     ; 91 	BYTE* buff,		/* Pointer to the data to be written, NULL:Initiate/Finalize write operation */
 430                     ; 92 	DWORD sc		/* Sector number (LBA) or Number of bytes to send */
 430                     ; 93 )
 430                     ; 94 {
 431                     	switch	.text
 432  00b5               _disk_writep:
 434  00b5 89            	pushw	x
 435  00b6 88            	push	a
 436       00000001      OFST:	set	1
 439                     ; 97 	DRESULT res = RES_ERROR;
 441  00b7 a601          	ld	a,#1
 442  00b9 6b01          	ld	(OFST+0,sp),a
 444                     ; 99 	if (!buff) {
 446  00bb 5d            	tnzw	x
 447  00bc 2703cc017e    	jrne	L122
 448                     ; 100 		if (sc) {
 450  00c1 96            	ldw	x,sp
 451  00c2 1c0006        	addw	x,#OFST+5
 452  00c5 cd0000        	call	c_lzmp
 454  00c8 2737          	jreq	L371
 455                     ; 102 			SD_CS_LOW();
 457  00ca 7219500a      	bres	20490,#4
 458                     ; 104 			SD_SendCmd(SD_CMD_WRITE_SINGLE_BLOCK, sc, 0xFF);
 460  00ce 4bff          	push	#255
 461  00d0 1e09          	ldw	x,(OFST+8,sp)
 462  00d2 89            	pushw	x
 463  00d3 1e09          	ldw	x,(OFST+8,sp)
 464  00d5 89            	pushw	x
 465  00d6 a618          	ld	a,#24
 466  00d8 cd0000        	call	_SD_SendCmd
 468  00db 5b05          	addw	sp,#5
 469                     ; 107 			if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
 471  00dd 4f            	clr	a
 472  00de cd0000        	call	_SD_GetResponse
 474  00e1 4d            	tnz	a
 475  00e2 2703cc0191    	jrne	L512
 476                     ; 110 				SD_WriteByte(SD_DUMMY_BYTE);
 478  00e7 4a            	dec	a
 479  00e8 cd0000        	call	_SD_WriteByte
 481                     ; 112 				SD_WriteByte(0xFE);
 483  00eb a6fe          	ld	a,#254
 484  00ed cd0000        	call	_SD_WriteByte
 486                     ; 113 				byteLeft = 512;
 488  00f0 ae0200        	ldw	x,#512
 489  00f3 cf0002        	ldw	L131_byteLeft+2,x
 490  00f6 5f            	clrw	x
 491  00f7 cf0000        	ldw	L131_byteLeft,x
 492                     ; 114 				res =  RES_OK;
 493  00fa cc018f        	jp	L522
 494  00fd               L171:
 495                     ; 119 				SD_WriteByte(0);
 497  00fd 4f            	clr	a
 498  00fe cd0000        	call	_SD_WriteByte
 500  0101               L371:
 501                     ; 118 			while((byteLeft--)) {
 503  0101 ae0000        	ldw	x,#L131_byteLeft
 504  0104 cd0000        	call	c_ltor
 506  0107 a601          	ld	a,#1
 507  0109 cd0000        	call	c_lgsbc
 509  010c cd0000        	call	c_lrzmp
 511  010f 26ec          	jrne	L171
 512                     ; 122 			SD_WriteByte(0);
 514  0111 4f            	clr	a
 515  0112 cd0000        	call	_SD_WriteByte
 517                     ; 123 			SD_WriteByte(0);
 519  0115 4f            	clr	a
 520  0116 cd0000        	call	_SD_WriteByte
 522                     ; 126 			if (SD_GetDataResponse() == SD_DATA_OK){
 524  0119 cd0000        	call	_SD_GetDataResponse
 526  011c a105          	cp	a,#5
 527  011e 2637          	jrne	L771
 528                     ; 127 				for (byteLeft = 5000;
 530  0120 ae1388        	ldw	x,#5000
 531  0123 cf0002        	ldw	L131_byteLeft+2,x
 532  0126 5f            	clrw	x
 533  0127 cf0000        	ldw	L131_byteLeft,x
 535  012a 2013          	jra	L502
 536  012c               L102:
 537                     ; 130 					dly(10);
 539  012c ae000a        	ldw	x,#10
 540  012f 89            	pushw	x
 541  0130 5f            	clrw	x
 542  0131 89            	pushw	x
 543  0132 cd0000        	call	_dly
 545  0135 5b04          	addw	sp,#4
 546                     ; 128 					 (SD_ReadByte() != 0xFF) && byteLeft;
 546                     ; 129 					  byteLeft--) {	/* Wait for ready */
 548  0137 ae0000        	ldw	x,#L131_byteLeft
 549  013a a601          	ld	a,#1
 550  013c cd0000        	call	c_lgsbc
 552  013f               L502:
 553                     ; 127 				for (byteLeft = 5000;
 553                     ; 128 					 (SD_ReadByte() != 0xFF) && byteLeft;
 555  013f cd0000        	call	_SD_ReadByte
 557  0142 4c            	inc	a
 558  0143 2708          	jreq	L112
 560  0145 ae0000        	ldw	x,#L131_byteLeft
 561  0148 cd0000        	call	c_lzmp
 563  014b 26df          	jrne	L102
 564  014d               L112:
 565                     ; 132 				if(byteLeft) res = RES_OK;
 567  014d ae0000        	ldw	x,#L131_byteLeft
 568  0150 cd0000        	call	c_lzmp
 570  0153 2702          	jreq	L771
 573  0155 0f01          	clr	(OFST+0,sp)
 575  0157               L771:
 576                     ; 136 			SD_CS_HIGH();
 578  0157 7218500a      	bset	20490,#4
 579                     ; 138 			SD_WriteByte(SD_DUMMY_BYTE);
 581  015b a6ff          	ld	a,#255
 582  015d cd0000        	call	_SD_WriteByte
 584  0160 202f          	jra	L512
 585  0162               L712:
 586                     ; 146 			SD_WriteByte(*buff);
 588  0162 1e02          	ldw	x,(OFST+1,sp)
 589  0164 f6            	ld	a,(x)
 590  0165 cd0000        	call	_SD_WriteByte
 592                     ; 148 			buff++;byteLeft--;sc--;
 594  0168 1e02          	ldw	x,(OFST+1,sp)
 595  016a 5c            	incw	x
 596  016b 1f02          	ldw	(OFST+1,sp),x
 599  016d ae0000        	ldw	x,#L131_byteLeft
 600  0170 a601          	ld	a,#1
 601  0172 cd0000        	call	c_lgsbc
 605  0175 96            	ldw	x,sp
 606  0176 1c0006        	addw	x,#OFST+5
 607  0179 a601          	ld	a,#1
 608  017b cd0000        	call	c_lgsbc
 610  017e               L122:
 611                     ; 143 		while((byteLeft)&&(sc))
 613  017e ae0000        	ldw	x,#L131_byteLeft
 614  0181 cd0000        	call	c_lzmp
 616  0184 2709          	jreq	L522
 618  0186 96            	ldw	x,sp
 619  0187 1c0006        	addw	x,#OFST+5
 620  018a cd0000        	call	c_lzmp
 622  018d 26d3          	jrne	L712
 623  018f               L522:
 624                     ; 150 		res = RES_OK;
 627  018f 0f01          	clr	(OFST+0,sp)
 629  0191               L512:
 630                     ; 153 	return res;
 632  0191 7b01          	ld	a,(OFST+0,sp)
 635  0193 5b03          	addw	sp,#3
 636  0195 81            	ret	
 649                     	xref	_dly
 650                     	xref	_SD_ReadByte
 651                     	xref	_SD_WriteByte
 652                     	xref	_SD_GetDataResponse
 653                     	xref	_SD_GetResponse
 654                     	xref	_SD_SendCmd
 655                     	xref	_SD_Detect
 656                     	xref	_SD_Init
 657                     	xdef	_disk_writep
 658                     	xdef	_disk_readp
 659                     	xdef	_disk_initialize
 678                     	xref	c_lrzmp
 679                     	xref	c_lgsbc
 680                     	xref	c_lzmp
 681                     	xref	c_ltor
 682                     	xref	c_lcmp
 683                     	xref	c_uitolx
 684                     	xref	c_lgadc
 685                     	end
