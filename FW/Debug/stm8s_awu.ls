   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  16                     .const:	section	.text
  17  0000               _APR_Array:
  18  0000 00            	dc.b	0
  19  0001 1e            	dc.b	30
  20  0002 1e            	dc.b	30
  21  0003 1e            	dc.b	30
  22  0004 1e            	dc.b	30
  23  0005 1e            	dc.b	30
  24  0006 1e            	dc.b	30
  25  0007 1e            	dc.b	30
  26  0008 1e            	dc.b	30
  27  0009 1e            	dc.b	30
  28  000a 1e            	dc.b	30
  29  000b 1e            	dc.b	30
  30  000c 1e            	dc.b	30
  31  000d 3d            	dc.b	61
  32  000e 17            	dc.b	23
  33  000f 17            	dc.b	23
  34  0010 3e            	dc.b	62
  35  0011               _TBR_Array:
  36  0011 00            	dc.b	0
  37  0012 01            	dc.b	1
  38  0013 02            	dc.b	2
  39  0014 03            	dc.b	3
  40  0015 04            	dc.b	4
  41  0016 05            	dc.b	5
  42  0017 06            	dc.b	6
  43  0018 07            	dc.b	7
  44  0019 08            	dc.b	8
  45  001a 09            	dc.b	9
  46  001b 0a            	dc.b	10
  47  001c 0b            	dc.b	11
  48  001d 0c            	dc.b	12
  49  001e 0c            	dc.b	12
  50  001f 0e            	dc.b	14
  51  0020 0f            	dc.b	15
  52  0021 0f            	dc.b	15
  81                     ; 73 void AWU_DeInit(void)
  81                     ; 74 {
  83                     	switch	.text
  84  0000               _AWU_DeInit:
  88                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  90  0000 725f50f0      	clr	20720
  91                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  93  0004 353f50f1      	mov	20721,#63
  94                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
  96  0008 725f50f2      	clr	20722
  97                     ; 78 }
 100  000c 81            	ret	
 263                     ; 88 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 263                     ; 89 {
 264                     	switch	.text
 265  000d               _AWU_Init:
 267  000d 88            	push	a
 268       00000000      OFST:	set	0
 271                     ; 91   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 273  000e 4d            	tnz	a
 274  000f 274e          	jreq	L41
 275  0011 a101          	cp	a,#1
 276  0013 274a          	jreq	L41
 277  0015 a102          	cp	a,#2
 278  0017 2746          	jreq	L41
 279  0019 a103          	cp	a,#3
 280  001b 2742          	jreq	L41
 281  001d a104          	cp	a,#4
 282  001f 273e          	jreq	L41
 283  0021 a105          	cp	a,#5
 284  0023 273a          	jreq	L41
 285  0025 a106          	cp	a,#6
 286  0027 2736          	jreq	L41
 287  0029 a107          	cp	a,#7
 288  002b 2732          	jreq	L41
 289  002d a108          	cp	a,#8
 290  002f 272e          	jreq	L41
 291  0031 a109          	cp	a,#9
 292  0033 272a          	jreq	L41
 293  0035 a10a          	cp	a,#10
 294  0037 2726          	jreq	L41
 295  0039 a10b          	cp	a,#11
 296  003b 2722          	jreq	L41
 297  003d a10c          	cp	a,#12
 298  003f 271e          	jreq	L41
 299  0041 a10d          	cp	a,#13
 300  0043 271a          	jreq	L41
 301  0045 a10e          	cp	a,#14
 302  0047 2716          	jreq	L41
 303  0049 a10f          	cp	a,#15
 304  004b 2712          	jreq	L41
 305  004d a110          	cp	a,#16
 306  004f 270e          	jreq	L41
 307  0051 ae005b        	ldw	x,#91
 308  0054 89            	pushw	x
 309  0055 5f            	clrw	x
 310  0056 89            	pushw	x
 311  0057 ae002e        	ldw	x,#L501
 312  005a cd0000        	call	_assert_failed
 314  005d 5b04          	addw	sp,#4
 315  005f               L41:
 316                     ; 94   AWU->CSR |= AWU_CSR_AWUEN;
 318  005f 721850f0      	bset	20720,#4
 319                     ; 97   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 321  0063 c650f2        	ld	a,20722
 322  0066 a4f0          	and	a,#240
 323  0068 c750f2        	ld	20722,a
 324                     ; 98   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 326  006b 7b01          	ld	a,(OFST+1,sp)
 327  006d 5f            	clrw	x
 328  006e 97            	ld	xl,a
 329  006f c650f2        	ld	a,20722
 330  0072 da0011        	or	a,(_TBR_Array,x)
 331  0075 c750f2        	ld	20722,a
 332                     ; 101   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 334  0078 c650f1        	ld	a,20721
 335  007b a4c0          	and	a,#192
 336  007d c750f1        	ld	20721,a
 337                     ; 102   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 339  0080 7b01          	ld	a,(OFST+1,sp)
 340  0082 5f            	clrw	x
 341  0083 97            	ld	xl,a
 342  0084 c650f1        	ld	a,20721
 343  0087 da0000        	or	a,(_APR_Array,x)
 344  008a c750f1        	ld	20721,a
 345                     ; 103 }
 348  008d 84            	pop	a
 349  008e 81            	ret	
 404                     ; 112 void AWU_Cmd(FunctionalState NewState)
 404                     ; 113 {
 405                     	switch	.text
 406  008f               _AWU_Cmd:
 410                     ; 114   if (NewState != DISABLE)
 412  008f 4d            	tnz	a
 413  0090 2705          	jreq	L531
 414                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 416  0092 721850f0      	bset	20720,#4
 419  0096 81            	ret	
 420  0097               L531:
 421                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 423  0097 721950f0      	bres	20720,#4
 424                     ; 124 }
 427  009b 81            	ret	
 475                     	switch	.const
 476  0022               L62:
 477  0022 0001adb0      	dc.l	110000
 478  0026               L03:
 479  0026 000249f1      	dc.l	150001
 480  002a               L63:
 481  002a 000003e8      	dc.l	1000
 482                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 482                     ; 140 {
 483                     	switch	.text
 484  009c               _AWU_LSICalibrationConfig:
 486  009c 5206          	subw	sp,#6
 487       00000006      OFST:	set	6
 490                     ; 141   uint16_t lsifreqkhz = 0x0;
 492                     ; 142   uint16_t A = 0x0;
 494                     ; 145   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 496  009e 96            	ldw	x,sp
 497  009f 1c0009        	addw	x,#OFST+3
 498  00a2 cd0000        	call	c_ltor
 500  00a5 ae0022        	ldw	x,#L62
 501  00a8 cd0000        	call	c_lcmp
 503  00ab 250f          	jrult	L42
 504  00ad 96            	ldw	x,sp
 505  00ae 1c0009        	addw	x,#OFST+3
 506  00b1 cd0000        	call	c_ltor
 508  00b4 ae0026        	ldw	x,#L03
 509  00b7 cd0000        	call	c_lcmp
 511  00ba 250e          	jrult	L23
 512  00bc               L42:
 513  00bc ae0091        	ldw	x,#145
 514  00bf 89            	pushw	x
 515  00c0 5f            	clrw	x
 516  00c1 89            	pushw	x
 517  00c2 ae002e        	ldw	x,#L501
 518  00c5 cd0000        	call	_assert_failed
 520  00c8 5b04          	addw	sp,#4
 521  00ca               L23:
 522                     ; 147   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 524  00ca 96            	ldw	x,sp
 525  00cb 1c0009        	addw	x,#OFST+3
 526  00ce cd0000        	call	c_ltor
 528  00d1 ae002a        	ldw	x,#L63
 529  00d4 cd0000        	call	c_ludv
 531  00d7 be02          	ldw	x,c_lreg+2
 532  00d9 1f03          	ldw	(OFST-3,sp),x
 534                     ; 151   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 536  00db 54            	srlw	x
 537  00dc 54            	srlw	x
 538  00dd 1f05          	ldw	(OFST-1,sp),x
 540                     ; 153   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 542  00df 58            	sllw	x
 543  00e0 58            	sllw	x
 544  00e1 1f01          	ldw	(OFST-5,sp),x
 546  00e3 1e03          	ldw	x,(OFST-3,sp)
 547  00e5 72f001        	subw	x,(OFST-5,sp)
 548  00e8 1605          	ldw	y,(OFST-1,sp)
 549  00ea 9058          	sllw	y
 550  00ec 905c          	incw	y
 551  00ee cd0000        	call	c_imul
 553  00f1 1605          	ldw	y,(OFST-1,sp)
 554  00f3 9058          	sllw	y
 555  00f5 bf00          	ldw	c_x,x
 556  00f7 9058          	sllw	y
 557  00f9 90b300        	cpw	y,c_x
 558  00fc 7b06          	ld	a,(OFST+0,sp)
 559  00fe 2504          	jrult	L161
 560                     ; 155     AWU->APR = (uint8_t)(A - 2U);
 562  0100 a002          	sub	a,#2
 564  0102 2001          	jra	L361
 565  0104               L161:
 566                     ; 159     AWU->APR = (uint8_t)(A - 1U);
 568  0104 4a            	dec	a
 569  0105               L361:
 570  0105 c750f1        	ld	20721,a
 571                     ; 161 }
 574  0108 5b06          	addw	sp,#6
 575  010a 81            	ret	
 598                     ; 168 void AWU_IdleModeEnable(void)
 598                     ; 169 {
 599                     	switch	.text
 600  010b               _AWU_IdleModeEnable:
 604                     ; 171   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 606  010b 721950f0      	bres	20720,#4
 607                     ; 174   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 609  010f 35f050f2      	mov	20722,#240
 610                     ; 175 }
 613  0113 81            	ret	
 657                     ; 183 FlagStatus AWU_GetFlagStatus(void)
 657                     ; 184 {
 658                     	switch	.text
 659  0114               _AWU_GetFlagStatus:
 663                     ; 185   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 665  0114 720a50f002    	btjt	20720,#5,L44
 666  0119 4f            	clr	a
 668  011a 81            	ret	
 669  011b               L44:
 670  011b a601          	ld	a,#1
 673  011d 81            	ret	
 708                     	xdef	_TBR_Array
 709                     	xdef	_APR_Array
 710                     	xdef	_AWU_GetFlagStatus
 711                     	xdef	_AWU_IdleModeEnable
 712                     	xdef	_AWU_LSICalibrationConfig
 713                     	xdef	_AWU_Cmd
 714                     	xdef	_AWU_Init
 715                     	xdef	_AWU_DeInit
 716                     	xref	_assert_failed
 717                     	switch	.const
 718  002e               L501:
 719  002e 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
 720  0040 697665725c73  	dc.b	"iver\src\stm8s_awu"
 721  0052 2e6300        	dc.b	".c",0
 722                     	xref.b	c_lreg
 723                     	xref.b	c_x
 743                     	xref	c_imul
 744                     	xref	c_ludv
 745                     	xref	c_lcmp
 746                     	xref	c_ltor
 747                     	end
