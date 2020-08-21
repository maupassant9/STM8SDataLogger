   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  47                     ; 46 void LedInit( void ){
  49                     	switch	.text
  50  0000               _LedInit:
  54                     ; 48 	gpioInit();
  56  0000 ad0e          	call	L3_gpioInit
  58                     ; 51 	ledFreqInTick = 0;
  60  0002 5f            	clrw	x
  61  0003 bf06          	ldw	_ledFreqInTick+2,x
  62  0005 bf04          	ldw	_ledFreqInTick,x
  63                     ; 52 	ledNxtToggle = 0;
  65  0007 bf02          	ldw	_ledNxtToggle+2,x
  66  0009 bf00          	ldw	_ledNxtToggle,x
  67                     ; 54 	LED_CLR();
  69  000b 7219500f      	bres	20495,#4
  70                     ; 55 }
  73  000f 81            	ret	
  96                     ; 70 static void gpioInit( void )
  96                     ; 71 {
  97                     	switch	.text
  98  0010               L3_gpioInit:
 102                     ; 72   LEDPORT->DDR |= LEDPIN; //pin0 output
 104  0010 72185011      	bset	20497,#4
 105                     ; 73   LEDPORT->CR1 |= LEDPIN; //push-pull mode
 107  0014 72185012      	bset	20498,#4
 108                     ; 74   LEDPORT->CR2 &= ~LEDPIN;  // low speed
 110  0018 72195013      	bres	20499,#4
 111                     ; 75 }
 114  001c 81            	ret	
 147                     	xdef	_LedInit
 148                     	switch	.ubsct
 149  0000               _ledNxtToggle:
 150  0000 00000000      	ds.b	4
 151                     	xdef	_ledNxtToggle
 152  0004               _ledFreqInTick:
 153  0004 00000000      	ds.b	4
 154                     	xdef	_ledFreqInTick
 174                     	end
