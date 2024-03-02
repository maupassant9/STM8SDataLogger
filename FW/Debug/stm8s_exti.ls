   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  44                     ; 53 void EXTI_DeInit(void)
  44                     ; 54 {
  46                     	switch	.text
  47  0000               _EXTI_DeInit:
  51                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  53  0000 725f50a0      	clr	20640
  54                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  56  0004 725f50a1      	clr	20641
  57                     ; 57 }
  60  0008 81            	ret	
 186                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 186                     ; 71 {
 187                     	switch	.text
 188  0009               _EXTI_SetExtIntSensitivity:
 190  0009 89            	pushw	x
 191       00000000      OFST:	set	0
 194                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 196  000a 9e            	ld	a,xh
 197  000b 4d            	tnz	a
 198  000c 2721          	jreq	L41
 199  000e 9e            	ld	a,xh
 200  000f 4a            	dec	a
 201  0010 271d          	jreq	L41
 202  0012 9e            	ld	a,xh
 203  0013 a102          	cp	a,#2
 204  0015 2718          	jreq	L41
 205  0017 9e            	ld	a,xh
 206  0018 a103          	cp	a,#3
 207  001a 2713          	jreq	L41
 208  001c 9e            	ld	a,xh
 209  001d a104          	cp	a,#4
 210  001f 270e          	jreq	L41
 211  0021 ae0049        	ldw	x,#73
 212  0024 89            	pushw	x
 213  0025 5f            	clrw	x
 214  0026 89            	pushw	x
 215  0027 ae0000        	ldw	x,#L111
 216  002a cd0000        	call	_assert_failed
 218  002d 5b04          	addw	sp,#4
 219  002f               L41:
 220                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 222  002f 7b02          	ld	a,(OFST+2,sp)
 223  0031 271a          	jreq	L42
 224  0033 a101          	cp	a,#1
 225  0035 2716          	jreq	L42
 226  0037 a102          	cp	a,#2
 227  0039 2712          	jreq	L42
 228  003b a103          	cp	a,#3
 229  003d 270e          	jreq	L42
 230  003f ae004a        	ldw	x,#74
 231  0042 89            	pushw	x
 232  0043 5f            	clrw	x
 233  0044 89            	pushw	x
 234  0045 ae0000        	ldw	x,#L111
 235  0048 cd0000        	call	_assert_failed
 237  004b 5b04          	addw	sp,#4
 238  004d               L42:
 239                     ; 77   switch (Port)
 241  004d 7b01          	ld	a,(OFST+1,sp)
 243                     ; 99   default:
 243                     ; 100     break;
 244  004f 270e          	jreq	L12
 245  0051 4a            	dec	a
 246  0052 271a          	jreq	L32
 247  0054 4a            	dec	a
 248  0055 2725          	jreq	L52
 249  0057 4a            	dec	a
 250  0058 2731          	jreq	L72
 251  005a 4a            	dec	a
 252  005b 2745          	jreq	L13
 253  005d 2053          	jra	L511
 254  005f               L12:
 255                     ; 79   case EXTI_PORT_GPIOA:
 255                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 257  005f c650a0        	ld	a,20640
 258  0062 a4fc          	and	a,#252
 259  0064 c750a0        	ld	20640,a
 260                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 262  0067 c650a0        	ld	a,20640
 263  006a 1a02          	or	a,(OFST+2,sp)
 264                     ; 82     break;
 266  006c 202f          	jp	LC001
 267  006e               L32:
 268                     ; 83   case EXTI_PORT_GPIOB:
 268                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 270  006e c650a0        	ld	a,20640
 271  0071 a4f3          	and	a,#243
 272  0073 c750a0        	ld	20640,a
 273                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 275  0076 7b02          	ld	a,(OFST+2,sp)
 276  0078 48            	sll	a
 277  0079 48            	sll	a
 278                     ; 86     break;
 280  007a 201e          	jp	LC002
 281  007c               L52:
 282                     ; 87   case EXTI_PORT_GPIOC:
 282                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 284  007c c650a0        	ld	a,20640
 285  007f a4cf          	and	a,#207
 286  0081 c750a0        	ld	20640,a
 287                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 289  0084 7b02          	ld	a,(OFST+2,sp)
 290  0086 97            	ld	xl,a
 291  0087 a610          	ld	a,#16
 292                     ; 90     break;
 294  0089 200d          	jp	LC003
 295  008b               L72:
 296                     ; 91   case EXTI_PORT_GPIOD:
 296                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 298  008b c650a0        	ld	a,20640
 299  008e a43f          	and	a,#63
 300  0090 c750a0        	ld	20640,a
 301                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 303  0093 7b02          	ld	a,(OFST+2,sp)
 304  0095 97            	ld	xl,a
 305  0096 a640          	ld	a,#64
 306  0098               LC003:
 307  0098 42            	mul	x,a
 308  0099 9f            	ld	a,xl
 309  009a               LC002:
 310  009a ca50a0        	or	a,20640
 311  009d               LC001:
 312  009d c750a0        	ld	20640,a
 313                     ; 94     break;
 315  00a0 2010          	jra	L511
 316  00a2               L13:
 317                     ; 95   case EXTI_PORT_GPIOE:
 317                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 319  00a2 c650a1        	ld	a,20641
 320  00a5 a4fc          	and	a,#252
 321  00a7 c750a1        	ld	20641,a
 322                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 324  00aa c650a1        	ld	a,20641
 325  00ad 1a02          	or	a,(OFST+2,sp)
 326  00af c750a1        	ld	20641,a
 327                     ; 98     break;
 329                     ; 99   default:
 329                     ; 100     break;
 331  00b2               L511:
 332                     ; 102 }
 335  00b2 85            	popw	x
 336  00b3 81            	ret	
 395                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 395                     ; 112 {
 396                     	switch	.text
 397  00b4               _EXTI_SetTLISensitivity:
 399  00b4 88            	push	a
 400       00000000      OFST:	set	0
 403                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 405  00b5 4d            	tnz	a
 406  00b6 2712          	jreq	L63
 407  00b8 a104          	cp	a,#4
 408  00ba 270e          	jreq	L63
 409  00bc ae0072        	ldw	x,#114
 410  00bf 89            	pushw	x
 411  00c0 5f            	clrw	x
 412  00c1 89            	pushw	x
 413  00c2 ae0000        	ldw	x,#L111
 414  00c5 cd0000        	call	_assert_failed
 416  00c8 5b04          	addw	sp,#4
 417  00ca               L63:
 418                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 420  00ca 721550a1      	bres	20641,#2
 421                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 423  00ce c650a1        	ld	a,20641
 424  00d1 1a01          	or	a,(OFST+1,sp)
 425  00d3 c750a1        	ld	20641,a
 426                     ; 119 }
 429  00d6 84            	pop	a
 430  00d7 81            	ret	
 475                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 475                     ; 127 {
 476                     	switch	.text
 477  00d8               _EXTI_GetExtIntSensitivity:
 479  00d8 88            	push	a
 480  00d9 88            	push	a
 481       00000001      OFST:	set	1
 484                     ; 128   uint8_t value = 0;
 486  00da 0f01          	clr	(OFST+0,sp)
 488                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 490  00dc 4d            	tnz	a
 491  00dd 271e          	jreq	L05
 492  00df a101          	cp	a,#1
 493  00e1 271a          	jreq	L05
 494  00e3 a102          	cp	a,#2
 495  00e5 2716          	jreq	L05
 496  00e7 a103          	cp	a,#3
 497  00e9 2712          	jreq	L05
 498  00eb a104          	cp	a,#4
 499  00ed 270e          	jreq	L05
 500  00ef ae0083        	ldw	x,#131
 501  00f2 89            	pushw	x
 502  00f3 5f            	clrw	x
 503  00f4 89            	pushw	x
 504  00f5 ae0000        	ldw	x,#L111
 505  00f8 cd0000        	call	_assert_failed
 507  00fb 5b04          	addw	sp,#4
 508  00fd               L05:
 509                     ; 133   switch (Port)
 511  00fd 7b02          	ld	a,(OFST+1,sp)
 513                     ; 150   default:
 513                     ; 151     break;
 514  00ff 2710          	jreq	L541
 515  0101 4a            	dec	a
 516  0102 2712          	jreq	L741
 517  0104 4a            	dec	a
 518  0105 2718          	jreq	L151
 519  0107 4a            	dec	a
 520  0108 271b          	jreq	L351
 521  010a 4a            	dec	a
 522  010b 2722          	jreq	L551
 523  010d 7b01          	ld	a,(OFST+0,sp)
 524  010f 2023          	jra	LC004
 525  0111               L541:
 526                     ; 135   case EXTI_PORT_GPIOA:
 526                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 528  0111 c650a0        	ld	a,20640
 529                     ; 137     break;
 531  0114 201c          	jp	LC005
 532  0116               L741:
 533                     ; 138   case EXTI_PORT_GPIOB:
 533                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 535  0116 c650a0        	ld	a,20640
 536  0119 a40c          	and	a,#12
 537  011b 44            	srl	a
 538  011c 44            	srl	a
 539                     ; 140     break;
 541  011d 2015          	jp	LC004
 542  011f               L151:
 543                     ; 141   case EXTI_PORT_GPIOC:
 543                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 545  011f c650a0        	ld	a,20640
 546  0122 4e            	swap	a
 547                     ; 143     break;
 549  0123 200d          	jp	LC005
 550  0125               L351:
 551                     ; 144   case EXTI_PORT_GPIOD:
 551                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 553  0125 c650a0        	ld	a,20640
 554  0128 4e            	swap	a
 555  0129 a40c          	and	a,#12
 556  012b 44            	srl	a
 557  012c 44            	srl	a
 558                     ; 146     break;
 560  012d 2003          	jp	LC005
 561  012f               L551:
 562                     ; 147   case EXTI_PORT_GPIOE:
 562                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 564  012f c650a1        	ld	a,20641
 565  0132               LC005:
 566  0132 a403          	and	a,#3
 567  0134               LC004:
 569                     ; 149     break;
 571                     ; 150   default:
 571                     ; 151     break;
 573                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 577  0134 85            	popw	x
 578  0135 81            	ret	
 612                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 612                     ; 163 {
 613                     	switch	.text
 614  0136               _EXTI_GetTLISensitivity:
 616       00000001      OFST:	set	1
 619                     ; 164   uint8_t value = 0;
 621                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 623  0136 c650a1        	ld	a,20641
 624  0139 a404          	and	a,#4
 626                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 630  013b 81            	ret	
 643                     	xdef	_EXTI_GetTLISensitivity
 644                     	xdef	_EXTI_GetExtIntSensitivity
 645                     	xdef	_EXTI_SetTLISensitivity
 646                     	xdef	_EXTI_SetExtIntSensitivity
 647                     	xdef	_EXTI_DeInit
 648                     	xref	_assert_failed
 649                     .const:	section	.text
 650  0000               L111:
 651  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
 652  0012 697665725c73  	dc.b	"iver\src\stm8s_ext"
 653  0024 692e6300      	dc.b	"i.c",0
 673                     	end
