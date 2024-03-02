   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  61                     ; 53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  61                     ; 54 {
  63                     	switch	.text
  64  0000               _WWDG_Init:
  66  0000 89            	pushw	x
  67       00000000      OFST:	set	0
  70                     ; 56   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  72  0001 9f            	ld	a,xl
  73  0002 a180          	cp	a,#128
  74  0004 250e          	jrult	L01
  75  0006 ae0038        	ldw	x,#56
  76  0009 89            	pushw	x
  77  000a 5f            	clrw	x
  78  000b 89            	pushw	x
  79  000c ae0000        	ldw	x,#L72
  80  000f cd0000        	call	_assert_failed
  82  0012 5b04          	addw	sp,#4
  83  0014               L01:
  84                     ; 58   WWDG->WR = WWDG_WR_RESET_VALUE;
  86  0014 357f50d2      	mov	20690,#127
  87                     ; 59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  89  0018 7b01          	ld	a,(OFST+1,sp)
  90  001a aac0          	or	a,#192
  91  001c c750d1        	ld	20689,a
  92                     ; 60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  94  001f 7b02          	ld	a,(OFST+2,sp)
  95  0021 a47f          	and	a,#127
  96  0023 aa40          	or	a,#64
  97  0025 c750d2        	ld	20690,a
  98                     ; 61 }
 101  0028 85            	popw	x
 102  0029 81            	ret	
 135                     ; 69 void WWDG_SetCounter(uint8_t Counter)
 135                     ; 70 {
 136                     	switch	.text
 137  002a               _WWDG_SetCounter:
 139  002a 88            	push	a
 140       00000000      OFST:	set	0
 143                     ; 72   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 145  002b a180          	cp	a,#128
 146  002d 250e          	jrult	L02
 147  002f ae0048        	ldw	x,#72
 148  0032 89            	pushw	x
 149  0033 5f            	clrw	x
 150  0034 89            	pushw	x
 151  0035 ae0000        	ldw	x,#L72
 152  0038 cd0000        	call	_assert_failed
 154  003b 5b04          	addw	sp,#4
 155  003d               L02:
 156                     ; 76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 158  003d 7b01          	ld	a,(OFST+1,sp)
 159  003f a47f          	and	a,#127
 160  0041 c750d1        	ld	20689,a
 161                     ; 77 }
 164  0044 84            	pop	a
 165  0045 81            	ret	
 188                     ; 86 uint8_t WWDG_GetCounter(void)
 188                     ; 87 {
 189                     	switch	.text
 190  0046               _WWDG_GetCounter:
 194                     ; 88   return(WWDG->CR);
 196  0046 c650d1        	ld	a,20689
 199  0049 81            	ret	
 222                     ; 96 void WWDG_SWReset(void)
 222                     ; 97 {
 223                     	switch	.text
 224  004a               _WWDG_SWReset:
 228                     ; 98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 230  004a 358050d1      	mov	20689,#128
 231                     ; 99 }
 234  004e 81            	ret	
 268                     ; 108 void WWDG_SetWindowValue(uint8_t WindowValue)
 268                     ; 109 {
 269                     	switch	.text
 270  004f               _WWDG_SetWindowValue:
 272  004f 88            	push	a
 273       00000000      OFST:	set	0
 276                     ; 111   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 278  0050 a180          	cp	a,#128
 279  0052 250e          	jrult	L43
 280  0054 ae006f        	ldw	x,#111
 281  0057 89            	pushw	x
 282  0058 5f            	clrw	x
 283  0059 89            	pushw	x
 284  005a ae0000        	ldw	x,#L72
 285  005d cd0000        	call	_assert_failed
 287  0060 5b04          	addw	sp,#4
 288  0062               L43:
 289                     ; 113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 291  0062 7b01          	ld	a,(OFST+1,sp)
 292  0064 a47f          	and	a,#127
 293  0066 aa40          	or	a,#64
 294  0068 c750d2        	ld	20690,a
 295                     ; 114 }
 298  006b 84            	pop	a
 299  006c 81            	ret	
 312                     	xdef	_WWDG_SetWindowValue
 313                     	xdef	_WWDG_SWReset
 314                     	xdef	_WWDG_GetCounter
 315                     	xdef	_WWDG_SetCounter
 316                     	xdef	_WWDG_Init
 317                     	xref	_assert_failed
 318                     .const:	section	.text
 319  0000               L72:
 320  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
 321  0012 697665725c73  	dc.b	"iver\src\stm8s_wwd"
 322  0024 672e6300      	dc.b	"g.c",0
 342                     	end
