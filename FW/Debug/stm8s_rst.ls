   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
 119                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 119                     ; 55 {
 121                     	switch	.text
 122  0000               _RST_GetFlagStatus:
 124  0000 88            	push	a
 125       00000000      OFST:	set	0
 128                     ; 57   assert_param(IS_RST_FLAG_OK(RST_Flag));
 130  0001 a110          	cp	a,#16
 131  0003 271d          	jreq	L21
 132  0005 a108          	cp	a,#8
 133  0007 2719          	jreq	L21
 134  0009 a104          	cp	a,#4
 135  000b 2715          	jreq	L21
 136  000d a102          	cp	a,#2
 137  000f 2711          	jreq	L21
 138  0011 4a            	dec	a
 139  0012 270e          	jreq	L21
 140  0014 ae0039        	ldw	x,#57
 141  0017 89            	pushw	x
 142  0018 5f            	clrw	x
 143  0019 89            	pushw	x
 144  001a ae0000        	ldw	x,#L55
 145  001d cd0000        	call	_assert_failed
 147  0020 5b04          	addw	sp,#4
 148  0022               L21:
 149                     ; 60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 151  0022 c650b3        	ld	a,20659
 152  0025 1501          	bcp	a,(OFST+1,sp)
 153  0027 2603          	jrne	L61
 154  0029 4f            	clr	a
 155  002a 2002          	jra	L02
 156  002c               L61:
 157  002c a601          	ld	a,#1
 158  002e               L02:
 161  002e 5b01          	addw	sp,#1
 162  0030 81            	ret	
 198                     ; 69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 198                     ; 70 {
 199                     	switch	.text
 200  0031               _RST_ClearFlag:
 202  0031 88            	push	a
 203       00000000      OFST:	set	0
 206                     ; 72   assert_param(IS_RST_FLAG_OK(RST_Flag));
 208  0032 a110          	cp	a,#16
 209  0034 271d          	jreq	L03
 210  0036 a108          	cp	a,#8
 211  0038 2719          	jreq	L03
 212  003a a104          	cp	a,#4
 213  003c 2715          	jreq	L03
 214  003e a102          	cp	a,#2
 215  0040 2711          	jreq	L03
 216  0042 4a            	dec	a
 217  0043 270e          	jreq	L03
 218  0045 ae0048        	ldw	x,#72
 219  0048 89            	pushw	x
 220  0049 5f            	clrw	x
 221  004a 89            	pushw	x
 222  004b ae0000        	ldw	x,#L55
 223  004e cd0000        	call	_assert_failed
 225  0051 5b04          	addw	sp,#4
 226  0053               L03:
 227                     ; 74   RST->SR = (uint8_t)RST_Flag;
 229  0053 7b01          	ld	a,(OFST+1,sp)
 230  0055 c750b3        	ld	20659,a
 231                     ; 75 }
 234  0058 84            	pop	a
 235  0059 81            	ret	
 248                     	xdef	_RST_ClearFlag
 249                     	xdef	_RST_GetFlagStatus
 250                     	xref	_assert_failed
 251                     .const:	section	.text
 252  0000               L55:
 253  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
 254  0012 697665725c73  	dc.b	"iver\src\stm8s_rst"
 255  0024 2e6300        	dc.b	".c",0
 275                     	end
