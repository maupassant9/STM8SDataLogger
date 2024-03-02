   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  80                     ; 48 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  80                     ; 49 {
  82                     	switch	.text
  83  0000               _IWDG_WriteAccessCmd:
  85  0000 88            	push	a
  86       00000000      OFST:	set	0
  89                     ; 51   assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  91  0001 a155          	cp	a,#85
  92  0003 2711          	jreq	L21
  93  0005 4d            	tnz	a
  94  0006 270e          	jreq	L21
  95  0008 ae0033        	ldw	x,#51
  96  000b 89            	pushw	x
  97  000c 5f            	clrw	x
  98  000d 89            	pushw	x
  99  000e ae0000        	ldw	x,#L73
 100  0011 cd0000        	call	_assert_failed
 102  0014 5b04          	addw	sp,#4
 103  0016               L21:
 104                     ; 53   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
 106  0016 7b01          	ld	a,(OFST+1,sp)
 107  0018 c750e0        	ld	20704,a
 108                     ; 54 }
 111  001b 84            	pop	a
 112  001c 81            	ret	
 203                     ; 63 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 203                     ; 64 {
 204                     	switch	.text
 205  001d               _IWDG_SetPrescaler:
 207  001d 88            	push	a
 208       00000000      OFST:	set	0
 211                     ; 66   assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 213  001e 4d            	tnz	a
 214  001f 2726          	jreq	L42
 215  0021 a101          	cp	a,#1
 216  0023 2722          	jreq	L42
 217  0025 a102          	cp	a,#2
 218  0027 271e          	jreq	L42
 219  0029 a103          	cp	a,#3
 220  002b 271a          	jreq	L42
 221  002d a104          	cp	a,#4
 222  002f 2716          	jreq	L42
 223  0031 a105          	cp	a,#5
 224  0033 2712          	jreq	L42
 225  0035 a106          	cp	a,#6
 226  0037 270e          	jreq	L42
 227  0039 ae0042        	ldw	x,#66
 228  003c 89            	pushw	x
 229  003d 5f            	clrw	x
 230  003e 89            	pushw	x
 231  003f ae0000        	ldw	x,#L73
 232  0042 cd0000        	call	_assert_failed
 234  0045 5b04          	addw	sp,#4
 235  0047               L42:
 236                     ; 68   IWDG->PR = (uint8_t)IWDG_Prescaler;
 238  0047 7b01          	ld	a,(OFST+1,sp)
 239  0049 c750e1        	ld	20705,a
 240                     ; 69 }
 243  004c 84            	pop	a
 244  004d 81            	ret	
 276                     ; 78 void IWDG_SetReload(uint8_t IWDG_Reload)
 276                     ; 79 {
 277                     	switch	.text
 278  004e               _IWDG_SetReload:
 282                     ; 80   IWDG->RLR = IWDG_Reload;
 284  004e c750e2        	ld	20706,a
 285                     ; 81 }
 288  0051 81            	ret	
 311                     ; 89 void IWDG_ReloadCounter(void)
 311                     ; 90 {
 312                     	switch	.text
 313  0052               _IWDG_ReloadCounter:
 317                     ; 91   IWDG->KR = IWDG_KEY_REFRESH;
 319  0052 35aa50e0      	mov	20704,#170
 320                     ; 92 }
 323  0056 81            	ret	
 346                     ; 99 void IWDG_Enable(void)
 346                     ; 100 {
 347                     	switch	.text
 348  0057               _IWDG_Enable:
 352                     ; 101   IWDG->KR = IWDG_KEY_ENABLE;
 354  0057 35cc50e0      	mov	20704,#204
 355                     ; 102 }
 358  005b 81            	ret	
 371                     	xdef	_IWDG_Enable
 372                     	xdef	_IWDG_ReloadCounter
 373                     	xdef	_IWDG_SetReload
 374                     	xdef	_IWDG_SetPrescaler
 375                     	xdef	_IWDG_WriteAccessCmd
 376                     	xref	_assert_failed
 377                     .const:	section	.text
 378  0000               L73:
 379  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
 380  0012 697665725c73  	dc.b	"iver\src\stm8s_iwd"
 381  0024 672e6300      	dc.b	"g.c",0
 401                     	end
