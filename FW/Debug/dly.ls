   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  46                     ; 44 void sysTickInit( void )
  46                     ; 45 {
  48                     	switch	.text
  49  0000               _sysTickInit:
  53                     ; 46 	sysTick = 0;
  55  0000 5f            	clrw	x
  56  0001 bf02          	ldw	_sysTick+2,x
  57  0003 bf00          	ldw	_sysTick,x
  58                     ; 47 	tim4Init();
  61                     ; 48 }
  64  0005 2000          	jp	L3_tim4Init
  87                     ; 59 static void tim4Init( void )
  87                     ; 60 {
  88                     	switch	.text
  89  0007               L3_tim4Init:
  93                     ; 61 	TIM4->PSCR = TIM4_PRESCALER_64; //tim_clk = 250K, time_resolution = 4us
  95  0007 35065347      	mov	21319,#6
  96                     ; 62 	TIM4->CR1 = (TIM4_CR1_ARPE);
  98  000b 35805340      	mov	21312,#128
  99                     ; 63 	TIM4->IER = TIM4_IER_UIE;
 101  000f 35015343      	mov	21315,#1
 102                     ; 64 	TIM4->ARR = TIMER_VALUE_FOR_SYSTICK;
 104  0013 35195348      	mov	21320,#25
 105                     ; 65 	TIM4->CR1 |= TIM4_CR1_CEN;
 107  0017 72105340      	bset	21312,#0
 108                     ; 66 }
 111  001b 81            	ret	
 151                     ; 79 void dly(uint32_t dt)
 151                     ; 80 {
 152                     	switch	.text
 153  001c               _dly:
 155  001c 5204          	subw	sp,#4
 156       00000004      OFST:	set	4
 159                     ; 81 	uint32_t destSysTick = sysTick+dt;
 161  001e ae0000        	ldw	x,#_sysTick
 162  0021 cd0000        	call	c_ltor
 164  0024 96            	ldw	x,sp
 165  0025 1c0007        	addw	x,#OFST+3
 166  0028 cd0000        	call	c_ladd
 168  002b 96            	ldw	x,sp
 169  002c 5c            	incw	x
 170  002d cd0000        	call	c_rtol
 174  0030               L55:
 175                     ; 82 	while(destSysTick!=sysTick);
 177  0030 96            	ldw	x,sp
 178  0031 5c            	incw	x
 179  0032 cd0000        	call	c_ltor
 181  0035 ae0000        	ldw	x,#_sysTick
 182  0038 cd0000        	call	c_lcmp
 184  003b 26f3          	jrne	L55
 185                     ; 83 }
 188  003d 5b04          	addw	sp,#4
 189  003f 81            	ret	
 215                     ; 97 @far @interrupt void systemTickIsr (void)
 215                     ; 98 {
 217                     	switch	.text
 218  0040               f_systemTickIsr:
 220  0040 be02          	ldw	x,c_lreg+2
 221  0042 89            	pushw	x
 222  0043 be00          	ldw	x,c_lreg
 223  0045 89            	pushw	x
 226                     ; 99 	sysTick++;
 228  0046 ae0000        	ldw	x,#_sysTick
 229  0049 a601          	ld	a,#1
 230  004b cd0000        	call	c_lgadc
 232                     ; 100 	TIM4->SR1 = ~TIM4_SR1_UIF;
 234  004e 35fe5344      	mov	21316,#254
 235                     ; 102 	if(ledFreqInTick != 0){
 237  0052 ae0000        	ldw	x,#_ledFreqInTick
 238  0055 cd0000        	call	c_lzmp
 240  0058 2721          	jreq	L17
 241                     ; 104 		if(ledNxtToggle == sysTick){
 243  005a ae0000        	ldw	x,#_ledNxtToggle
 244  005d cd0000        	call	c_ltor
 246  0060 ae0000        	ldw	x,#_sysTick
 247  0063 cd0000        	call	c_lcmp
 249  0066 2613          	jrne	L17
 250                     ; 105 			ledNxtToggle = sysTick + ledFreqInTick;
 252  0068 cd0000        	call	c_ltor
 254  006b ae0000        	ldw	x,#_ledFreqInTick
 255  006e cd0000        	call	c_ladd
 257  0071 ae0000        	ldw	x,#_ledNxtToggle
 258  0074 cd0000        	call	c_rtol
 260                     ; 106 			LED_TOGGLE();
 262  0077 9018500f      	bcpl	20495,#4
 263  007b               L17:
 264                     ; 109 }
 267  007b 85            	popw	x
 268  007c bf00          	ldw	c_lreg,x
 269  007e 85            	popw	x
 270  007f bf02          	ldw	c_lreg+2,x
 271  0081 80            	iret	
 294                     	switch	.ubsct
 295  0000               _sysTick:
 296  0000 00000000      	ds.b	4
 297                     	xdef	_sysTick
 298                     	xref	_ledNxtToggle
 299                     	xref	_ledFreqInTick
 300                     	xdef	f_systemTickIsr
 301                     	xdef	_dly
 302                     	xdef	_sysTickInit
 303                     	xref.b	c_lreg
 323                     	xref	c_lzmp
 324                     	xref	c_lgadc
 325                     	xref	c_lcmp
 326                     	xref	c_rtol
 327                     	xref	c_ladd
 328                     	xref	c_ltor
 329                     	end
