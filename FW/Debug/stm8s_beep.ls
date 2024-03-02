   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  44                     ; 54 void BEEP_DeInit(void)
  44                     ; 55 {
  46                     	switch	.text
  47  0000               _BEEP_DeInit:
  51                     ; 56   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  53  0000 351f50f3      	mov	20723,#31
  54                     ; 57 }
  57  0004 81            	ret	
 123                     ; 67 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 123                     ; 68 {
 124                     	switch	.text
 125  0005               _BEEP_Init:
 127  0005 88            	push	a
 128       00000000      OFST:	set	0
 131                     ; 70   assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 133  0006 4d            	tnz	a
 134  0007 2716          	jreq	L41
 135  0009 a140          	cp	a,#64
 136  000b 2712          	jreq	L41
 137  000d a180          	cp	a,#128
 138  000f 270e          	jreq	L41
 139  0011 ae0046        	ldw	x,#70
 140  0014 89            	pushw	x
 141  0015 5f            	clrw	x
 142  0016 89            	pushw	x
 143  0017 ae000c        	ldw	x,#L15
 144  001a cd0000        	call	_assert_failed
 146  001d 5b04          	addw	sp,#4
 147  001f               L41:
 148                     ; 73   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 150  001f c650f3        	ld	a,20723
 151  0022 a41f          	and	a,#31
 152  0024 a11f          	cp	a,#31
 153  0026 2610          	jrne	L35
 154                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 156  0028 c650f3        	ld	a,20723
 157  002b a4e0          	and	a,#224
 158  002d c750f3        	ld	20723,a
 159                     ; 76     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 161  0030 c650f3        	ld	a,20723
 162  0033 aa0b          	or	a,#11
 163  0035 c750f3        	ld	20723,a
 164  0038               L35:
 165                     ; 80   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 167  0038 c650f3        	ld	a,20723
 168  003b a43f          	and	a,#63
 169  003d c750f3        	ld	20723,a
 170                     ; 81   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 172  0040 c650f3        	ld	a,20723
 173  0043 1a01          	or	a,(OFST+1,sp)
 174  0045 c750f3        	ld	20723,a
 175                     ; 82 }
 178  0048 84            	pop	a
 179  0049 81            	ret	
 234                     ; 91 void BEEP_Cmd(FunctionalState NewState)
 234                     ; 92 {
 235                     	switch	.text
 236  004a               _BEEP_Cmd:
 240                     ; 93   if (NewState != DISABLE)
 242  004a 4d            	tnz	a
 243  004b 2705          	jreq	L301
 244                     ; 96     BEEP->CSR |= BEEP_CSR_BEEPEN;
 246  004d 721a50f3      	bset	20723,#5
 249  0051 81            	ret	
 250  0052               L301:
 251                     ; 101     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 253  0052 721b50f3      	bres	20723,#5
 254                     ; 103 }
 257  0056 81            	ret	
 305                     .const:	section	.text
 306  0000               L62:
 307  0000 0001adb0      	dc.l	110000
 308  0004               L03:
 309  0004 000249f1      	dc.l	150001
 310  0008               L63:
 311  0008 000003e8      	dc.l	1000
 312                     ; 118 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 312                     ; 119 {
 313                     	switch	.text
 314  0057               _BEEP_LSICalibrationConfig:
 316  0057 5206          	subw	sp,#6
 317       00000006      OFST:	set	6
 320                     ; 124   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 322  0059 96            	ldw	x,sp
 323  005a 1c0009        	addw	x,#OFST+3
 324  005d cd0000        	call	c_ltor
 326  0060 ae0000        	ldw	x,#L62
 327  0063 cd0000        	call	c_lcmp
 329  0066 250f          	jrult	L42
 330  0068 96            	ldw	x,sp
 331  0069 1c0009        	addw	x,#OFST+3
 332  006c cd0000        	call	c_ltor
 334  006f ae0004        	ldw	x,#L03
 335  0072 cd0000        	call	c_lcmp
 337  0075 250e          	jrult	L23
 338  0077               L42:
 339  0077 ae007c        	ldw	x,#124
 340  007a 89            	pushw	x
 341  007b 5f            	clrw	x
 342  007c 89            	pushw	x
 343  007d ae000c        	ldw	x,#L15
 344  0080 cd0000        	call	_assert_failed
 346  0083 5b04          	addw	sp,#4
 347  0085               L23:
 348                     ; 126   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 350  0085 96            	ldw	x,sp
 351  0086 1c0009        	addw	x,#OFST+3
 352  0089 cd0000        	call	c_ltor
 354  008c ae0008        	ldw	x,#L63
 355  008f cd0000        	call	c_ludv
 357  0092 be02          	ldw	x,c_lreg+2
 358  0094 1f03          	ldw	(OFST-3,sp),x
 360                     ; 130   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 362  0096 c650f3        	ld	a,20723
 363  0099 a4e0          	and	a,#224
 364  009b c750f3        	ld	20723,a
 365                     ; 132   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 367  009e 54            	srlw	x
 368  009f 54            	srlw	x
 369  00a0 54            	srlw	x
 370  00a1 1f05          	ldw	(OFST-1,sp),x
 372                     ; 134   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 374  00a3 58            	sllw	x
 375  00a4 58            	sllw	x
 376  00a5 58            	sllw	x
 377  00a6 1f01          	ldw	(OFST-5,sp),x
 379  00a8 1e03          	ldw	x,(OFST-3,sp)
 380  00aa 72f001        	subw	x,(OFST-5,sp)
 381  00ad 1605          	ldw	y,(OFST-1,sp)
 382  00af 9058          	sllw	y
 383  00b1 905c          	incw	y
 384  00b3 cd0000        	call	c_imul
 386  00b6 1605          	ldw	y,(OFST-1,sp)
 387  00b8 9058          	sllw	y
 388  00ba 9058          	sllw	y
 389  00bc bf00          	ldw	c_x,x
 390  00be 9058          	sllw	y
 391  00c0 90b300        	cpw	y,c_x
 392  00c3 7b06          	ld	a,(OFST+0,sp)
 393  00c5 2504          	jrult	L721
 394                     ; 136     BEEP->CSR |= (uint8_t)(A - 2U);
 396  00c7 a002          	sub	a,#2
 398  00c9 2001          	jra	L131
 399  00cb               L721:
 400                     ; 140     BEEP->CSR |= (uint8_t)(A - 1U);
 402  00cb 4a            	dec	a
 403  00cc               L131:
 404  00cc ca50f3        	or	a,20723
 405  00cf c750f3        	ld	20723,a
 406                     ; 142 }
 409  00d2 5b06          	addw	sp,#6
 410  00d4 81            	ret	
 423                     	xdef	_BEEP_LSICalibrationConfig
 424                     	xdef	_BEEP_Cmd
 425                     	xdef	_BEEP_Init
 426                     	xdef	_BEEP_DeInit
 427                     	xref	_assert_failed
 428                     	switch	.const
 429  000c               L15:
 430  000c 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
 431  001e 697665725c73  	dc.b	"iver\src\stm8s_bee"
 432  0030 702e6300      	dc.b	"p.c",0
 433                     	xref.b	c_lreg
 434                     	xref.b	c_x
 454                     	xref	c_imul
 455                     	xref	c_ludv
 456                     	xref	c_lcmp
 457                     	xref	c_ltor
 458                     	end
