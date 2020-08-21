   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
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
 198                     .const:	section	.text
 199  0000               L23:
 200  0000 00000200      	dc.l	512
 201                     ; 31 DRESULT disk_readp (
 201                     ; 32 	BYTE* buff,		/* Pointer to the destination object */
 201                     ; 33 	DWORD sector,	/* Sector number (LBA) */
 201                     ; 34 	UINT offset,	/* Offset in the sector */
 201                     ; 35 	UINT count		/* Byte count (bit15:destination) */
 201                     ; 36 )
 201                     ; 37 {
 202                     	switch	.text
 203  0013               _disk_readp:
 205  0013 89            	pushw	x
 206  0014 5205          	subw	sp,#5
 207       00000005      OFST:	set	5
 210                     ; 38 	DRESULT res = RES_ERROR;
 212  0016 a601          	ld	a,#1
 213  0018 6b01          	ld	(OFST-4,sp),a
 215                     ; 39 	uint32_t i = 0;
 217                     ; 41 	SD_CS_LOW();
 219  001a 4b10          	push	#16
 220  001c ae500a        	ldw	x,#20490
 221  001f cd0000        	call	_GPIO_WriteLow
 223  0022 84            	pop	a
 224                     ; 44 	SD_SendCmd(SD_CMD_READ_SINGLE_BLOCK, sector, 0xFF);
 226  0023 4bff          	push	#255
 227  0025 1e0d          	ldw	x,(OFST+8,sp)
 228  0027 89            	pushw	x
 229  0028 1e0d          	ldw	x,(OFST+8,sp)
 230  002a 89            	pushw	x
 231  002b a611          	ld	a,#17
 232  002d cd0000        	call	_SD_SendCmd
 234  0030 5b05          	addw	sp,#5
 235                     ; 47 	if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
 237  0032 4f            	clr	a
 238  0033 cd0000        	call	_SD_GetResponse
 240  0036 4d            	tnz	a
 241  0037 2673          	jrne	L57
 242                     ; 50 		if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
 244  0039 a6fe          	ld	a,#254
 245  003b cd0000        	call	_SD_GetResponse
 247  003e 4d            	tnz	a
 248  003f 266b          	jrne	L57
 249                     ; 53 			for(i = 0; i < offset; i++){
 251  0041 5f            	clrw	x
 252  0042 1f04          	ldw	(OFST-1,sp),x
 253  0044 1f02          	ldw	(OFST-3,sp),x
 256  0046 200c          	jra	L501
 257  0048               L101:
 258                     ; 54 				SD_ReadByte();
 260  0048 cd0000        	call	_SD_ReadByte
 262                     ; 53 			for(i = 0; i < offset; i++){
 264  004b 96            	ldw	x,sp
 265  004c 1c0002        	addw	x,#OFST-3
 266  004f a601          	ld	a,#1
 267  0051 cd0000        	call	c_lgadc
 270  0054               L501:
 273  0054 1e0e          	ldw	x,(OFST+9,sp)
 274  0056 cd0000        	call	c_uitolx
 276  0059 96            	ldw	x,sp
 277  005a 1c0002        	addw	x,#OFST-3
 278  005d cd0000        	call	c_lcmp
 280  0060 22e6          	jrugt	L101
 282  0062 2012          	jra	L511
 283  0064               L111:
 284                     ; 59 				*buff = SD_ReadByte();
 286  0064 cd0000        	call	_SD_ReadByte
 288  0067 1e06          	ldw	x,(OFST+1,sp)
 289  0069 f7            	ld	(x),a
 290                     ; 62 				buff++;
 292  006a 5c            	incw	x
 293  006b 1f06          	ldw	(OFST+1,sp),x
 294                     ; 56 			for (; i < offset+count; i++)
 296  006d 96            	ldw	x,sp
 297  006e 1c0002        	addw	x,#OFST-3
 298  0071 a601          	ld	a,#1
 299  0073 cd0000        	call	c_lgadc
 302  0076               L511:
 305  0076 1e0e          	ldw	x,(OFST+9,sp)
 306  0078 72fb10        	addw	x,(OFST+11,sp)
 307  007b cd0000        	call	c_uitolx
 309  007e 96            	ldw	x,sp
 310  007f 1c0002        	addw	x,#OFST-3
 311  0082 cd0000        	call	c_lcmp
 313  0085 22dd          	jrugt	L111
 315  0087 200c          	jra	L521
 316  0089               L121:
 317                     ; 65 				SD_ReadByte();
 319  0089 cd0000        	call	_SD_ReadByte
 321                     ; 64 			for(;i < 512; i++){
 323  008c 96            	ldw	x,sp
 324  008d 1c0002        	addw	x,#OFST-3
 325  0090 a601          	ld	a,#1
 326  0092 cd0000        	call	c_lgadc
 329  0095               L521:
 332  0095 96            	ldw	x,sp
 333  0096 1c0002        	addw	x,#OFST-3
 334  0099 cd0000        	call	c_ltor
 336  009c ae0000        	ldw	x,#L23
 337  009f cd0000        	call	c_lcmp
 339  00a2 25e5          	jrult	L121
 340                     ; 68 			SD_ReadByte();
 342  00a4 cd0000        	call	_SD_ReadByte
 344                     ; 69 			SD_ReadByte();
 346  00a7 cd0000        	call	_SD_ReadByte
 348                     ; 71 			res = RES_OK;
 350  00aa 0f01          	clr	(OFST-4,sp)
 352  00ac               L57:
 353                     ; 75 	SD_CS_HIGH();
 355  00ac 4b10          	push	#16
 356  00ae ae500a        	ldw	x,#20490
 357  00b1 cd0000        	call	_GPIO_WriteHigh
 359  00b4 84            	pop	a
 360                     ; 78 	SD_WriteByte(SD_DUMMY_BYTE);
 362  00b5 a6ff          	ld	a,#255
 363  00b7 cd0000        	call	_SD_WriteByte
 365                     ; 81 	return res;
 367  00ba 7b01          	ld	a,(OFST-4,sp)
 370  00bc 5b07          	addw	sp,#7
 371  00be 81            	ret	
 374                     	switch	.data
 375  0000               L131_byteLeft:
 376  0000 00000200      	dc.l	512
 442                     ; 90 DRESULT disk_writep (
 442                     ; 91 	BYTE* buff,		/* Pointer to the data to be written, NULL:Initiate/Finalize write operation */
 442                     ; 92 	DWORD sc		/* Sector number (LBA) or Number of bytes to send */
 442                     ; 93 )
 442                     ; 94 {
 443                     	switch	.text
 444  00bf               _disk_writep:
 446  00bf 89            	pushw	x
 447  00c0 88            	push	a
 448       00000001      OFST:	set	1
 451                     ; 97 	DRESULT res = RES_ERROR;
 453  00c1 a601          	ld	a,#1
 454  00c3 6b01          	ld	(OFST+0,sp),a
 456                     ; 99 	if (!buff) {
 458  00c5 5d            	tnzw	x
 459  00c6 2703cc0192    	jrne	L122
 460                     ; 100 		if (sc) {
 462  00cb 96            	ldw	x,sp
 463  00cc 1c0006        	addw	x,#OFST+5
 464  00cf cd0000        	call	c_lzmp
 466  00d2 273c          	jreq	L371
 467                     ; 102 			SD_CS_LOW();
 469  00d4 4b10          	push	#16
 470  00d6 ae500a        	ldw	x,#20490
 471  00d9 cd0000        	call	_GPIO_WriteLow
 473  00dc 84            	pop	a
 474                     ; 104 			SD_SendCmd(SD_CMD_WRITE_SINGLE_BLOCK, sc, 0xFF);
 476  00dd 4bff          	push	#255
 477  00df 1e09          	ldw	x,(OFST+8,sp)
 478  00e1 89            	pushw	x
 479  00e2 1e09          	ldw	x,(OFST+8,sp)
 480  00e4 89            	pushw	x
 481  00e5 a618          	ld	a,#24
 482  00e7 cd0000        	call	_SD_SendCmd
 484  00ea 5b05          	addw	sp,#5
 485                     ; 107 			if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
 487  00ec 4f            	clr	a
 488  00ed cd0000        	call	_SD_GetResponse
 490  00f0 4d            	tnz	a
 491  00f1 2703cc01a5    	jrne	L512
 492                     ; 110 				SD_WriteByte(SD_DUMMY_BYTE);
 494  00f6 4a            	dec	a
 495  00f7 cd0000        	call	_SD_WriteByte
 497                     ; 112 				SD_WriteByte(0xFE);
 499  00fa a6fe          	ld	a,#254
 500  00fc cd0000        	call	_SD_WriteByte
 502                     ; 113 				byteLeft = 512;
 504  00ff ae0200        	ldw	x,#512
 505  0102 cf0002        	ldw	L131_byteLeft+2,x
 506  0105 5f            	clrw	x
 507  0106 cf0000        	ldw	L131_byteLeft,x
 508                     ; 114 				res =  RES_OK;
 509  0109 cc01a3        	jp	L522
 510  010c               L171:
 511                     ; 119 				SD_WriteByte(0);
 513  010c 4f            	clr	a
 514  010d cd0000        	call	_SD_WriteByte
 516  0110               L371:
 517                     ; 118 			while((byteLeft--)) {
 519  0110 ae0000        	ldw	x,#L131_byteLeft
 520  0113 cd0000        	call	c_ltor
 522  0116 a601          	ld	a,#1
 523  0118 cd0000        	call	c_lgsbc
 525  011b cd0000        	call	c_lrzmp
 527  011e 26ec          	jrne	L171
 528                     ; 122 			SD_WriteByte(0);
 530  0120 4f            	clr	a
 531  0121 cd0000        	call	_SD_WriteByte
 533                     ; 123 			SD_WriteByte(0);
 535  0124 4f            	clr	a
 536  0125 cd0000        	call	_SD_WriteByte
 538                     ; 126 			if (SD_GetDataResponse() == SD_DATA_OK){
 540  0128 cd0000        	call	_SD_GetDataResponse
 542  012b a105          	cp	a,#5
 543  012d 2637          	jrne	L771
 544                     ; 127 				for (byteLeft = 5000;
 546  012f ae1388        	ldw	x,#5000
 547  0132 cf0002        	ldw	L131_byteLeft+2,x
 548  0135 5f            	clrw	x
 549  0136 cf0000        	ldw	L131_byteLeft,x
 551  0139 2013          	jra	L502
 552  013b               L102:
 553                     ; 130 					dly(10);
 555  013b ae000a        	ldw	x,#10
 556  013e 89            	pushw	x
 557  013f 5f            	clrw	x
 558  0140 89            	pushw	x
 559  0141 cd0000        	call	_dly
 561  0144 5b04          	addw	sp,#4
 562                     ; 128 					 (SD_ReadByte() != 0xFF) && byteLeft;
 562                     ; 129 					  byteLeft--) {	/* Wait for ready */
 564  0146 ae0000        	ldw	x,#L131_byteLeft
 565  0149 a601          	ld	a,#1
 566  014b cd0000        	call	c_lgsbc
 568  014e               L502:
 569                     ; 127 				for (byteLeft = 5000;
 569                     ; 128 					 (SD_ReadByte() != 0xFF) && byteLeft;
 571  014e cd0000        	call	_SD_ReadByte
 573  0151 4c            	inc	a
 574  0152 2708          	jreq	L112
 576  0154 ae0000        	ldw	x,#L131_byteLeft
 577  0157 cd0000        	call	c_lzmp
 579  015a 26df          	jrne	L102
 580  015c               L112:
 581                     ; 132 				if(byteLeft) res = RES_OK;
 583  015c ae0000        	ldw	x,#L131_byteLeft
 584  015f cd0000        	call	c_lzmp
 586  0162 2702          	jreq	L771
 589  0164 0f01          	clr	(OFST+0,sp)
 591  0166               L771:
 592                     ; 136 			SD_CS_HIGH();
 594  0166 4b10          	push	#16
 595  0168 ae500a        	ldw	x,#20490
 596  016b cd0000        	call	_GPIO_WriteHigh
 598  016e 84            	pop	a
 599                     ; 138 			SD_WriteByte(SD_DUMMY_BYTE);
 601  016f a6ff          	ld	a,#255
 602  0171 cd0000        	call	_SD_WriteByte
 604  0174 202f          	jra	L512
 605  0176               L712:
 606                     ; 146 			SD_WriteByte(*buff);
 608  0176 1e02          	ldw	x,(OFST+1,sp)
 609  0178 f6            	ld	a,(x)
 610  0179 cd0000        	call	_SD_WriteByte
 612                     ; 148 			buff++;byteLeft--;sc--;
 614  017c 1e02          	ldw	x,(OFST+1,sp)
 615  017e 5c            	incw	x
 616  017f 1f02          	ldw	(OFST+1,sp),x
 619  0181 ae0000        	ldw	x,#L131_byteLeft
 620  0184 a601          	ld	a,#1
 621  0186 cd0000        	call	c_lgsbc
 625  0189 96            	ldw	x,sp
 626  018a 1c0006        	addw	x,#OFST+5
 627  018d a601          	ld	a,#1
 628  018f cd0000        	call	c_lgsbc
 630  0192               L122:
 631                     ; 143 		while((byteLeft)&&(sc))
 633  0192 ae0000        	ldw	x,#L131_byteLeft
 634  0195 cd0000        	call	c_lzmp
 636  0198 2709          	jreq	L522
 638  019a 96            	ldw	x,sp
 639  019b 1c0006        	addw	x,#OFST+5
 640  019e cd0000        	call	c_lzmp
 642  01a1 26d3          	jrne	L712
 643  01a3               L522:
 644                     ; 150 		res = RES_OK;
 647  01a3 0f01          	clr	(OFST+0,sp)
 649  01a5               L512:
 650                     ; 153 	return res;
 652  01a5 7b01          	ld	a,(OFST+0,sp)
 655  01a7 5b03          	addw	sp,#3
 656  01a9 81            	ret	
 669                     	xref	_dly
 670                     	xref	_SD_ReadByte
 671                     	xref	_SD_WriteByte
 672                     	xref	_SD_GetDataResponse
 673                     	xref	_SD_GetResponse
 674                     	xref	_SD_SendCmd
 675                     	xref	_SD_Detect
 676                     	xref	_SD_Init
 677                     	xdef	_disk_writep
 678                     	xdef	_disk_readp
 679                     	xdef	_disk_initialize
 680                     	xref	_GPIO_WriteLow
 681                     	xref	_GPIO_WriteHigh
 700                     	xref	c_lrzmp
 701                     	xref	c_lgsbc
 702                     	xref	c_lzmp
 703                     	xref	c_ltor
 704                     	xref	c_lcmp
 705                     	xref	c_uitolx
 706                     	xref	c_lgadc
 707                     	end
