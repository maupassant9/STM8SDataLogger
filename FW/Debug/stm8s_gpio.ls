   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
 110                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 110                     ; 54 {
 112                     	switch	.text
 113  0000               _GPIO_DeInit:
 117                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 119  0000 7f            	clr	(x)
 120                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 122  0001 6f02          	clr	(2,x)
 123                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 125  0003 6f03          	clr	(3,x)
 126                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 128  0005 6f04          	clr	(4,x)
 129                     ; 59 }
 132  0007 81            	ret	
 373                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 373                     ; 72 {
 374                     	switch	.text
 375  0008               _GPIO_Init:
 377  0008 89            	pushw	x
 378       00000000      OFST:	set	0
 381                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 383  0009 7b06          	ld	a,(OFST+6,sp)
 384  000b 273a          	jreq	L41
 385  000d a140          	cp	a,#64
 386  000f 2736          	jreq	L41
 387  0011 a120          	cp	a,#32
 388  0013 2732          	jreq	L41
 389  0015 a160          	cp	a,#96
 390  0017 272e          	jreq	L41
 391  0019 a1a0          	cp	a,#160
 392  001b 272a          	jreq	L41
 393  001d a1e0          	cp	a,#224
 394  001f 2726          	jreq	L41
 395  0021 a180          	cp	a,#128
 396  0023 2722          	jreq	L41
 397  0025 a1c0          	cp	a,#192
 398  0027 271e          	jreq	L41
 399  0029 a1b0          	cp	a,#176
 400  002b 271a          	jreq	L41
 401  002d a1f0          	cp	a,#240
 402  002f 2716          	jreq	L41
 403  0031 a190          	cp	a,#144
 404  0033 2712          	jreq	L41
 405  0035 a1d0          	cp	a,#208
 406  0037 270e          	jreq	L41
 407  0039 ae004d        	ldw	x,#77
 408  003c 89            	pushw	x
 409  003d 5f            	clrw	x
 410  003e 89            	pushw	x
 411  003f ae0000        	ldw	x,#L771
 412  0042 cd0000        	call	_assert_failed
 414  0045 5b04          	addw	sp,#4
 415  0047               L41:
 416                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 418  0047 7b05          	ld	a,(OFST+5,sp)
 419  0049 2610          	jrne	L22
 420  004b ae004e        	ldw	x,#78
 421  004e 89            	pushw	x
 422  004f 5f            	clrw	x
 423  0050 89            	pushw	x
 424  0051 ae0000        	ldw	x,#L771
 425  0054 cd0000        	call	_assert_failed
 427  0057 5b04          	addw	sp,#4
 428  0059 7b05          	ld	a,(OFST+5,sp)
 429  005b               L22:
 430                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 432  005b 1e01          	ldw	x,(OFST+1,sp)
 433  005d 43            	cpl	a
 434  005e e404          	and	a,(4,x)
 435  0060 e704          	ld	(4,x),a
 436                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 438  0062 7b06          	ld	a,(OFST+6,sp)
 439  0064 2a14          	jrpl	L102
 440                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 442  0066 a510          	bcp	a,#16
 443  0068 2705          	jreq	L302
 444                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 446  006a f6            	ld	a,(x)
 447  006b 1a05          	or	a,(OFST+5,sp)
 449  006d 2004          	jra	L502
 450  006f               L302:
 451                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 453  006f 7b05          	ld	a,(OFST+5,sp)
 454  0071 43            	cpl	a
 455  0072 f4            	and	a,(x)
 456  0073               L502:
 457  0073 f7            	ld	(x),a
 458                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 460  0074 e602          	ld	a,(2,x)
 461  0076 1a05          	or	a,(OFST+5,sp)
 463  0078 2005          	jra	L702
 464  007a               L102:
 465                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 467  007a 7b05          	ld	a,(OFST+5,sp)
 468  007c 43            	cpl	a
 469  007d e402          	and	a,(2,x)
 470  007f               L702:
 471  007f e702          	ld	(2,x),a
 472                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 474  0081 7b06          	ld	a,(OFST+6,sp)
 475  0083 a540          	bcp	a,#64
 476  0085 2706          	jreq	L112
 477                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 479  0087 e603          	ld	a,(3,x)
 480  0089 1a05          	or	a,(OFST+5,sp)
 482  008b 2005          	jra	L312
 483  008d               L112:
 484                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 486  008d 7b05          	ld	a,(OFST+5,sp)
 487  008f 43            	cpl	a
 488  0090 e403          	and	a,(3,x)
 489  0092               L312:
 490  0092 e703          	ld	(3,x),a
 491                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 493  0094 7b06          	ld	a,(OFST+6,sp)
 494  0096 a520          	bcp	a,#32
 495  0098 2708          	jreq	L512
 496                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 498  009a 1e01          	ldw	x,(OFST+1,sp)
 499  009c e604          	ld	a,(4,x)
 500  009e 1a05          	or	a,(OFST+5,sp)
 502  00a0 2007          	jra	L712
 503  00a2               L512:
 504                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 506  00a2 1e01          	ldw	x,(OFST+1,sp)
 507  00a4 7b05          	ld	a,(OFST+5,sp)
 508  00a6 43            	cpl	a
 509  00a7 e404          	and	a,(4,x)
 510  00a9               L712:
 511  00a9 e704          	ld	(4,x),a
 512                     ; 131 }
 515  00ab 85            	popw	x
 516  00ac 81            	ret	
 560                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 560                     ; 142 {
 561                     	switch	.text
 562  00ad               _GPIO_Write:
 564       fffffffe      OFST: set -2
 567                     ; 143   GPIOx->ODR = PortVal;
 569  00ad 7b03          	ld	a,(OFST+5,sp)
 570  00af f7            	ld	(x),a
 571                     ; 144 }
 574  00b0 81            	ret	
 621                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 621                     ; 155 {
 622                     	switch	.text
 623  00b1               _GPIO_WriteHigh:
 625       fffffffe      OFST: set -2
 628                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 630  00b1 f6            	ld	a,(x)
 631  00b2 1a03          	or	a,(OFST+5,sp)
 632  00b4 f7            	ld	(x),a
 633                     ; 157 }
 636  00b5 81            	ret	
 683                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 683                     ; 168 {
 684                     	switch	.text
 685  00b6               _GPIO_WriteLow:
 687       fffffffe      OFST: set -2
 690                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 692  00b6 7b03          	ld	a,(OFST+5,sp)
 693  00b8 43            	cpl	a
 694  00b9 f4            	and	a,(x)
 695  00ba f7            	ld	(x),a
 696                     ; 170 }
 699  00bb 81            	ret	
 746                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 746                     ; 181 {
 747                     	switch	.text
 748  00bc               _GPIO_WriteReverse:
 750       fffffffe      OFST: set -2
 753                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 755  00bc f6            	ld	a,(x)
 756  00bd 1803          	xor	a,(OFST+5,sp)
 757  00bf f7            	ld	(x),a
 758                     ; 183 }
 761  00c0 81            	ret	
 799                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 799                     ; 192 {
 800                     	switch	.text
 801  00c1               _GPIO_ReadOutputData:
 805                     ; 193   return ((uint8_t)GPIOx->ODR);
 807  00c1 f6            	ld	a,(x)
 810  00c2 81            	ret	
 847                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 847                     ; 203 {
 848                     	switch	.text
 849  00c3               _GPIO_ReadInputData:
 853                     ; 204   return ((uint8_t)GPIOx->IDR);
 855  00c3 e601          	ld	a,(1,x)
 858  00c5 81            	ret	
 926                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 926                     ; 214 {
 927                     	switch	.text
 928  00c6               _GPIO_ReadInputPin:
 930       fffffffe      OFST: set -2
 933                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 935  00c6 e601          	ld	a,(1,x)
 936  00c8 1403          	and	a,(OFST+5,sp)
 939  00ca 81            	ret	
1018                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1018                     ; 226 {
1019                     	switch	.text
1020  00cb               _GPIO_ExternalPullUpConfig:
1022  00cb 89            	pushw	x
1023       00000000      OFST:	set	0
1026                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1028  00cc 7b05          	ld	a,(OFST+5,sp)
1029  00ce 260e          	jrne	L05
1030  00d0 ae00e4        	ldw	x,#228
1031  00d3 89            	pushw	x
1032  00d4 5f            	clrw	x
1033  00d5 89            	pushw	x
1034  00d6 ae0000        	ldw	x,#L771
1035  00d9 cd0000        	call	_assert_failed
1037  00dc 5b04          	addw	sp,#4
1038  00de               L05:
1039                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1041  00de 7b06          	ld	a,(OFST+6,sp)
1042  00e0 2711          	jreq	L06
1043  00e2 4a            	dec	a
1044  00e3 270e          	jreq	L06
1045  00e5 ae00e5        	ldw	x,#229
1046  00e8 89            	pushw	x
1047  00e9 5f            	clrw	x
1048  00ea 89            	pushw	x
1049  00eb ae0000        	ldw	x,#L771
1050  00ee cd0000        	call	_assert_failed
1052  00f1 5b04          	addw	sp,#4
1053  00f3               L06:
1054                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1056  00f3 7b06          	ld	a,(OFST+6,sp)
1057  00f5 2708          	jreq	L374
1058                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1060  00f7 1e01          	ldw	x,(OFST+1,sp)
1061  00f9 e603          	ld	a,(3,x)
1062  00fb 1a05          	or	a,(OFST+5,sp)
1064  00fd 2007          	jra	L574
1065  00ff               L374:
1066                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1068  00ff 1e01          	ldw	x,(OFST+1,sp)
1069  0101 7b05          	ld	a,(OFST+5,sp)
1070  0103 43            	cpl	a
1071  0104 e403          	and	a,(3,x)
1072  0106               L574:
1073  0106 e703          	ld	(3,x),a
1074                     ; 238 }
1077  0108 85            	popw	x
1078  0109 81            	ret	
1091                     	xdef	_GPIO_ExternalPullUpConfig
1092                     	xdef	_GPIO_ReadInputPin
1093                     	xdef	_GPIO_ReadOutputData
1094                     	xdef	_GPIO_ReadInputData
1095                     	xdef	_GPIO_WriteReverse
1096                     	xdef	_GPIO_WriteLow
1097                     	xdef	_GPIO_WriteHigh
1098                     	xdef	_GPIO_Write
1099                     	xdef	_GPIO_Init
1100                     	xdef	_GPIO_DeInit
1101                     	xref	_assert_failed
1102                     .const:	section	.text
1103  0000               L771:
1104  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
1105  0012 697665725c73  	dc.b	"iver\src\stm8s_gpi"
1106  0024 6f2e6300      	dc.b	"o.c",0
1126                     	end
