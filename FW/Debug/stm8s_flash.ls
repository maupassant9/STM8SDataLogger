   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  77                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  77                     ; 88 {
  79                     	switch	.text
  80  0000               _FLASH_Unlock:
  82  0000 88            	push	a
  83       00000000      OFST:	set	0
  86                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  88  0001 a1fd          	cp	a,#253
  89  0003 2712          	jreq	L21
  90  0005 a1f7          	cp	a,#247
  91  0007 270e          	jreq	L21
  92  0009 ae005a        	ldw	x,#90
  93  000c 89            	pushw	x
  94  000d 5f            	clrw	x
  95  000e 89            	pushw	x
  96  000f ae0010        	ldw	x,#L73
  97  0012 cd0000        	call	_assert_failed
  99  0015 5b04          	addw	sp,#4
 100  0017               L21:
 101                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 103  0017 7b01          	ld	a,(OFST+1,sp)
 104  0019 a1fd          	cp	a,#253
 105  001b 260a          	jrne	L14
 106                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
 108  001d 35565062      	mov	20578,#86
 109                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
 111  0021 35ae5062      	mov	20578,#174
 113  0025 2008          	jra	L34
 114  0027               L14:
 115                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 117  0027 35ae5064      	mov	20580,#174
 118                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 120  002b 35565064      	mov	20580,#86
 121  002f               L34:
 122                     ; 104 }
 125  002f 84            	pop	a
 126  0030 81            	ret	
 162                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 162                     ; 113 {
 163                     	switch	.text
 164  0031               _FLASH_Lock:
 166  0031 88            	push	a
 167       00000000      OFST:	set	0
 170                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 172  0032 a1fd          	cp	a,#253
 173  0034 2712          	jreq	L42
 174  0036 a1f7          	cp	a,#247
 175  0038 270e          	jreq	L42
 176  003a ae0073        	ldw	x,#115
 177  003d 89            	pushw	x
 178  003e 5f            	clrw	x
 179  003f 89            	pushw	x
 180  0040 ae0010        	ldw	x,#L73
 181  0043 cd0000        	call	_assert_failed
 183  0046 5b04          	addw	sp,#4
 184  0048               L42:
 185                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 187  0048 c6505f        	ld	a,20575
 188  004b 1401          	and	a,(OFST+1,sp)
 189  004d c7505f        	ld	20575,a
 190                     ; 119 }
 193  0050 84            	pop	a
 194  0051 81            	ret	
 217                     ; 126 void FLASH_DeInit(void)
 217                     ; 127 {
 218                     	switch	.text
 219  0052               _FLASH_DeInit:
 223                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 225  0052 725f505a      	clr	20570
 226                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 228  0056 725f505b      	clr	20571
 229                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 231  005a 35ff505c      	mov	20572,#255
 232                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 234  005e 7217505f      	bres	20575,#3
 235                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 237  0062 7213505f      	bres	20575,#1
 238                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 240  0066 c6505f        	ld	a,20575
 241                     ; 134 }
 244  0069 81            	ret	
 300                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 300                     ; 143 {
 301                     	switch	.text
 302  006a               _FLASH_ITConfig:
 304  006a 88            	push	a
 305       00000000      OFST:	set	0
 308                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 310  006b 4d            	tnz	a
 311  006c 2711          	jreq	L04
 312  006e 4a            	dec	a
 313  006f 270e          	jreq	L04
 314  0071 ae0091        	ldw	x,#145
 315  0074 89            	pushw	x
 316  0075 5f            	clrw	x
 317  0076 89            	pushw	x
 318  0077 ae0010        	ldw	x,#L73
 319  007a cd0000        	call	_assert_failed
 321  007d 5b04          	addw	sp,#4
 322  007f               L04:
 323                     ; 147   if(NewState != DISABLE)
 325  007f 7b01          	ld	a,(OFST+1,sp)
 326  0081 2706          	jreq	L121
 327                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 329  0083 7212505a      	bset	20570,#1
 331  0087 2004          	jra	L321
 332  0089               L121:
 333                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 335  0089 7213505a      	bres	20570,#1
 336  008d               L321:
 337                     ; 155 }
 340  008d 84            	pop	a
 341  008e 81            	ret	
 374                     .const:	section	.text
 375  0000               L45:
 376  0000 00008000      	dc.l	32768
 377  0004               L65:
 378  0004 0000a000      	dc.l	40960
 379  0008               L06:
 380  0008 00004000      	dc.l	16384
 381  000c               L26:
 382  000c 00004280      	dc.l	17024
 383                     ; 164 void FLASH_EraseByte(uint32_t Address)
 383                     ; 165 {
 384                     	switch	.text
 385  008f               _FLASH_EraseByte:
 387       00000000      OFST:	set	0
 390                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 392  008f 96            	ldw	x,sp
 393  0090 1c0003        	addw	x,#OFST+3
 394  0093 cd0000        	call	c_ltor
 396  0096 ae0000        	ldw	x,#L45
 397  0099 cd0000        	call	c_lcmp
 399  009c 250f          	jrult	L25
 400  009e 96            	ldw	x,sp
 401  009f 1c0003        	addw	x,#OFST+3
 402  00a2 cd0000        	call	c_ltor
 404  00a5 ae0004        	ldw	x,#L65
 405  00a8 cd0000        	call	c_lcmp
 407  00ab 252c          	jrult	L46
 408  00ad               L25:
 409  00ad 96            	ldw	x,sp
 410  00ae 1c0003        	addw	x,#OFST+3
 411  00b1 cd0000        	call	c_ltor
 413  00b4 ae0008        	ldw	x,#L06
 414  00b7 cd0000        	call	c_lcmp
 416  00ba 250f          	jrult	L64
 417  00bc 96            	ldw	x,sp
 418  00bd 1c0003        	addw	x,#OFST+3
 419  00c0 cd0000        	call	c_ltor
 421  00c3 ae000c        	ldw	x,#L26
 422  00c6 cd0000        	call	c_lcmp
 424  00c9 250e          	jrult	L46
 425  00cb               L64:
 426  00cb ae00a7        	ldw	x,#167
 427  00ce 89            	pushw	x
 428  00cf 5f            	clrw	x
 429  00d0 89            	pushw	x
 430  00d1 ae0010        	ldw	x,#L73
 431  00d4 cd0000        	call	_assert_failed
 433  00d7 5b04          	addw	sp,#4
 434  00d9               L46:
 435                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 437  00d9 1e05          	ldw	x,(OFST+5,sp)
 438  00db 7f            	clr	(x)
 439                     ; 171 }
 442  00dc 81            	ret	
 482                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 482                     ; 182 {
 483                     	switch	.text
 484  00dd               _FLASH_ProgramByte:
 486       00000000      OFST:	set	0
 489                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 491  00dd 96            	ldw	x,sp
 492  00de 1c0003        	addw	x,#OFST+3
 493  00e1 cd0000        	call	c_ltor
 495  00e4 ae0000        	ldw	x,#L45
 496  00e7 cd0000        	call	c_lcmp
 498  00ea 250f          	jrult	L67
 499  00ec 96            	ldw	x,sp
 500  00ed 1c0003        	addw	x,#OFST+3
 501  00f0 cd0000        	call	c_ltor
 503  00f3 ae0004        	ldw	x,#L65
 504  00f6 cd0000        	call	c_lcmp
 506  00f9 252c          	jrult	L001
 507  00fb               L67:
 508  00fb 96            	ldw	x,sp
 509  00fc 1c0003        	addw	x,#OFST+3
 510  00ff cd0000        	call	c_ltor
 512  0102 ae0008        	ldw	x,#L06
 513  0105 cd0000        	call	c_lcmp
 515  0108 250f          	jrult	L27
 516  010a 96            	ldw	x,sp
 517  010b 1c0003        	addw	x,#OFST+3
 518  010e cd0000        	call	c_ltor
 520  0111 ae000c        	ldw	x,#L26
 521  0114 cd0000        	call	c_lcmp
 523  0117 250e          	jrult	L001
 524  0119               L27:
 525  0119 ae00b8        	ldw	x,#184
 526  011c 89            	pushw	x
 527  011d 5f            	clrw	x
 528  011e 89            	pushw	x
 529  011f ae0010        	ldw	x,#L73
 530  0122 cd0000        	call	_assert_failed
 532  0125 5b04          	addw	sp,#4
 533  0127               L001:
 534                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 536  0127 1e05          	ldw	x,(OFST+5,sp)
 537  0129 7b07          	ld	a,(OFST+7,sp)
 538  012b f7            	ld	(x),a
 539                     ; 186 }
 542  012c 81            	ret	
 575                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 575                     ; 196 {
 576                     	switch	.text
 577  012d               _FLASH_ReadByte:
 579       00000000      OFST:	set	0
 582                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 584  012d 96            	ldw	x,sp
 585  012e 1c0003        	addw	x,#OFST+3
 586  0131 cd0000        	call	c_ltor
 588  0134 ae0000        	ldw	x,#L45
 589  0137 cd0000        	call	c_lcmp
 591  013a 250f          	jrult	L211
 592  013c 96            	ldw	x,sp
 593  013d 1c0003        	addw	x,#OFST+3
 594  0140 cd0000        	call	c_ltor
 596  0143 ae0004        	ldw	x,#L65
 597  0146 cd0000        	call	c_lcmp
 599  0149 252c          	jrult	L411
 600  014b               L211:
 601  014b 96            	ldw	x,sp
 602  014c 1c0003        	addw	x,#OFST+3
 603  014f cd0000        	call	c_ltor
 605  0152 ae0008        	ldw	x,#L06
 606  0155 cd0000        	call	c_lcmp
 608  0158 250f          	jrult	L601
 609  015a 96            	ldw	x,sp
 610  015b 1c0003        	addw	x,#OFST+3
 611  015e cd0000        	call	c_ltor
 613  0161 ae000c        	ldw	x,#L26
 614  0164 cd0000        	call	c_lcmp
 616  0167 250e          	jrult	L411
 617  0169               L601:
 618  0169 ae00c6        	ldw	x,#198
 619  016c 89            	pushw	x
 620  016d 5f            	clrw	x
 621  016e 89            	pushw	x
 622  016f ae0010        	ldw	x,#L73
 623  0172 cd0000        	call	_assert_failed
 625  0175 5b04          	addw	sp,#4
 626  0177               L411:
 627                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 629  0177 1e05          	ldw	x,(OFST+5,sp)
 630  0179 f6            	ld	a,(x)
 633  017a 81            	ret	
 673                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 673                     ; 213 {
 674                     	switch	.text
 675  017b               _FLASH_ProgramWord:
 677       00000000      OFST:	set	0
 680                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 682  017b 96            	ldw	x,sp
 683  017c 1c0003        	addw	x,#OFST+3
 684  017f cd0000        	call	c_ltor
 686  0182 ae0000        	ldw	x,#L45
 687  0185 cd0000        	call	c_lcmp
 689  0188 250f          	jrult	L621
 690  018a 96            	ldw	x,sp
 691  018b 1c0003        	addw	x,#OFST+3
 692  018e cd0000        	call	c_ltor
 694  0191 ae0004        	ldw	x,#L65
 695  0194 cd0000        	call	c_lcmp
 697  0197 252c          	jrult	L031
 698  0199               L621:
 699  0199 96            	ldw	x,sp
 700  019a 1c0003        	addw	x,#OFST+3
 701  019d cd0000        	call	c_ltor
 703  01a0 ae0008        	ldw	x,#L06
 704  01a3 cd0000        	call	c_lcmp
 706  01a6 250f          	jrult	L221
 707  01a8 96            	ldw	x,sp
 708  01a9 1c0003        	addw	x,#OFST+3
 709  01ac cd0000        	call	c_ltor
 711  01af ae000c        	ldw	x,#L26
 712  01b2 cd0000        	call	c_lcmp
 714  01b5 250e          	jrult	L031
 715  01b7               L221:
 716  01b7 ae00d7        	ldw	x,#215
 717  01ba 89            	pushw	x
 718  01bb 5f            	clrw	x
 719  01bc 89            	pushw	x
 720  01bd ae0010        	ldw	x,#L73
 721  01c0 cd0000        	call	_assert_failed
 723  01c3 5b04          	addw	sp,#4
 724  01c5               L031:
 725                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 727  01c5 721c505b      	bset	20571,#6
 728                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 730  01c9 721d505c      	bres	20572,#6
 731                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 733  01cd 1e05          	ldw	x,(OFST+5,sp)
 734  01cf 7b07          	ld	a,(OFST+7,sp)
 735  01d1 f7            	ld	(x),a
 736                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 738  01d2 7b08          	ld	a,(OFST+8,sp)
 739  01d4 e701          	ld	(1,x),a
 740                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 742  01d6 7b09          	ld	a,(OFST+9,sp)
 743  01d8 e702          	ld	(2,x),a
 744                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 746  01da 7b0a          	ld	a,(OFST+10,sp)
 747  01dc e703          	ld	(3,x),a
 748                     ; 229 }
 751  01de 81            	ret	
 793                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 793                     ; 238 {
 794                     	switch	.text
 795  01df               _FLASH_ProgramOptionByte:
 797  01df 89            	pushw	x
 798       00000000      OFST:	set	0
 801                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 803  01e0 a34800        	cpw	x,#18432
 804  01e3 2505          	jrult	L631
 805  01e5 a34880        	cpw	x,#18560
 806  01e8 250e          	jrult	L041
 807  01ea               L631:
 808  01ea ae00f0        	ldw	x,#240
 809  01ed 89            	pushw	x
 810  01ee 5f            	clrw	x
 811  01ef 89            	pushw	x
 812  01f0 ae0010        	ldw	x,#L73
 813  01f3 cd0000        	call	_assert_failed
 815  01f6 5b04          	addw	sp,#4
 816  01f8               L041:
 817                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 819  01f8 721e505b      	bset	20571,#7
 820                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 822  01fc 721f505c      	bres	20572,#7
 823                     ; 247   if(Address == 0x4800)
 825  0200 1e01          	ldw	x,(OFST+1,sp)
 826  0202 a34800        	cpw	x,#18432
 827  0205 2605          	jrne	L722
 828                     ; 250     *((NEAR uint8_t*)Address) = Data;
 830  0207 7b05          	ld	a,(OFST+5,sp)
 831  0209 f7            	ld	(x),a
 833  020a 2006          	jra	L132
 834  020c               L722:
 835                     ; 255     *((NEAR uint8_t*)Address) = Data;
 837  020c 7b05          	ld	a,(OFST+5,sp)
 838  020e f7            	ld	(x),a
 839                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 841  020f 43            	cpl	a
 842  0210 e701          	ld	(1,x),a
 843  0212               L132:
 844                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 846  0212 a6fd          	ld	a,#253
 847  0214 cd0368        	call	_FLASH_WaitForLastOperation
 849                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 851  0217 721f505b      	bres	20571,#7
 852                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 854  021b 721e505c      	bset	20572,#7
 855                     ; 263 }
 858  021f 85            	popw	x
 859  0220 81            	ret	
 894                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 894                     ; 271 {
 895                     	switch	.text
 896  0221               _FLASH_EraseOptionByte:
 898  0221 89            	pushw	x
 899       00000000      OFST:	set	0
 902                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 904  0222 a34800        	cpw	x,#18432
 905  0225 2505          	jrult	L051
 906  0227 a34880        	cpw	x,#18560
 907  022a 250e          	jrult	L251
 908  022c               L051:
 909  022c ae0111        	ldw	x,#273
 910  022f 89            	pushw	x
 911  0230 5f            	clrw	x
 912  0231 89            	pushw	x
 913  0232 ae0010        	ldw	x,#L73
 914  0235 cd0000        	call	_assert_failed
 916  0238 5b04          	addw	sp,#4
 917  023a               L251:
 918                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 920  023a 721e505b      	bset	20571,#7
 921                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 923  023e 721f505c      	bres	20572,#7
 924                     ; 280   if(Address == 0x4800)
 926  0242 1e01          	ldw	x,(OFST+1,sp)
 927  0244 a34800        	cpw	x,#18432
 928  0247 2603          	jrne	L742
 929                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 931  0249 7f            	clr	(x)
 933  024a 2005          	jra	L152
 934  024c               L742:
 935                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 937  024c 7f            	clr	(x)
 938                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 940  024d a6ff          	ld	a,#255
 941  024f e701          	ld	(1,x),a
 942  0251               L152:
 943                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 945  0251 a6fd          	ld	a,#253
 946  0253 cd0368        	call	_FLASH_WaitForLastOperation
 948                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 950  0256 721f505b      	bres	20571,#7
 951                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 953  025a 721e505c      	bset	20572,#7
 954                     ; 296 }
 957  025e 85            	popw	x
 958  025f 81            	ret	
1014                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1014                     ; 304 {
1015                     	switch	.text
1016  0260               _FLASH_ReadOptionByte:
1018  0260 89            	pushw	x
1019  0261 5204          	subw	sp,#4
1020       00000004      OFST:	set	4
1023                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
1025                     ; 306   uint16_t res_value = 0;
1027                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1029  0263 a34800        	cpw	x,#18432
1030  0266 2505          	jrult	L261
1031  0268 a34880        	cpw	x,#18560
1032  026b 250e          	jrult	L461
1033  026d               L261:
1034  026d ae0135        	ldw	x,#309
1035  0270 89            	pushw	x
1036  0271 5f            	clrw	x
1037  0272 89            	pushw	x
1038  0273 ae0010        	ldw	x,#L73
1039  0276 cd0000        	call	_assert_failed
1041  0279 5b04          	addw	sp,#4
1042  027b               L461:
1043                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1045  027b 1e05          	ldw	x,(OFST+1,sp)
1046  027d f6            	ld	a,(x)
1047  027e 6b01          	ld	(OFST-3,sp),a
1049                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1051  0280 e601          	ld	a,(1,x)
1052  0282 6b02          	ld	(OFST-2,sp),a
1054                     ; 315   if(Address == 0x4800)	 
1056  0284 a34800        	cpw	x,#18432
1057  0287 2606          	jrne	L572
1058                     ; 317     res_value =	 value_optbyte;
1060  0289 7b01          	ld	a,(OFST-3,sp)
1061  028b 5f            	clrw	x
1062  028c 97            	ld	xl,a
1065  028d 201c          	jra	L772
1066  028f               L572:
1067                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
1069  028f 43            	cpl	a
1070  0290 1101          	cp	a,(OFST-3,sp)
1071  0292 2614          	jrne	L103
1072                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1074  0294 7b01          	ld	a,(OFST-3,sp)
1075  0296 97            	ld	xl,a
1076  0297 4f            	clr	a
1077  0298 02            	rlwa	x,a
1078  0299 1f03          	ldw	(OFST-1,sp),x
1080                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
1082  029b 5f            	clrw	x
1083  029c 7b02          	ld	a,(OFST-2,sp)
1084  029e 97            	ld	xl,a
1085  029f 01            	rrwa	x,a
1086  02a0 1a04          	or	a,(OFST+0,sp)
1087  02a2 01            	rrwa	x,a
1088  02a3 1a03          	or	a,(OFST-1,sp)
1089  02a5 01            	rrwa	x,a
1092  02a6 2003          	jra	L772
1093  02a8               L103:
1094                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
1096  02a8 ae5555        	ldw	x,#21845
1098  02ab               L772:
1099                     ; 331   return(res_value);
1103  02ab 5b06          	addw	sp,#6
1104  02ad 81            	ret	
1179                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1179                     ; 341 {
1180                     	switch	.text
1181  02ae               _FLASH_SetLowPowerMode:
1183  02ae 88            	push	a
1184       00000000      OFST:	set	0
1187                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1189  02af a104          	cp	a,#4
1190  02b1 2719          	jreq	L671
1191  02b3 a108          	cp	a,#8
1192  02b5 2715          	jreq	L671
1193  02b7 4d            	tnz	a
1194  02b8 2712          	jreq	L671
1195  02ba a10c          	cp	a,#12
1196  02bc 270e          	jreq	L671
1197  02be ae0157        	ldw	x,#343
1198  02c1 89            	pushw	x
1199  02c2 5f            	clrw	x
1200  02c3 89            	pushw	x
1201  02c4 ae0010        	ldw	x,#L73
1202  02c7 cd0000        	call	_assert_failed
1204  02ca 5b04          	addw	sp,#4
1205  02cc               L671:
1206                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1208  02cc c6505a        	ld	a,20570
1209  02cf a4f3          	and	a,#243
1210  02d1 c7505a        	ld	20570,a
1211                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1213  02d4 c6505a        	ld	a,20570
1214  02d7 1a01          	or	a,(OFST+1,sp)
1215  02d9 c7505a        	ld	20570,a
1216                     ; 350 }
1219  02dc 84            	pop	a
1220  02dd 81            	ret	
1279                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1279                     ; 359 {
1280                     	switch	.text
1281  02de               _FLASH_SetProgrammingTime:
1283  02de 88            	push	a
1284       00000000      OFST:	set	0
1287                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1289  02df 4d            	tnz	a
1290  02e0 2711          	jreq	L012
1291  02e2 4a            	dec	a
1292  02e3 270e          	jreq	L012
1293  02e5 ae0169        	ldw	x,#361
1294  02e8 89            	pushw	x
1295  02e9 5f            	clrw	x
1296  02ea 89            	pushw	x
1297  02eb ae0010        	ldw	x,#L73
1298  02ee cd0000        	call	_assert_failed
1300  02f1 5b04          	addw	sp,#4
1301  02f3               L012:
1302                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1304  02f3 7211505a      	bres	20570,#0
1305                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1307  02f7 c6505a        	ld	a,20570
1308  02fa 1a01          	or	a,(OFST+1,sp)
1309  02fc c7505a        	ld	20570,a
1310                     ; 365 }
1313  02ff 84            	pop	a
1314  0300 81            	ret	
1339                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1339                     ; 373 {
1340                     	switch	.text
1341  0301               _FLASH_GetLowPowerMode:
1345                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1347  0301 c6505a        	ld	a,20570
1348  0304 a40c          	and	a,#12
1351  0306 81            	ret	
1376                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1376                     ; 383 {
1377                     	switch	.text
1378  0307               _FLASH_GetProgrammingTime:
1382                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1384  0307 c6505a        	ld	a,20570
1385  030a a401          	and	a,#1
1388  030c 81            	ret	
1420                     ; 392 uint32_t FLASH_GetBootSize(void)
1420                     ; 393 {
1421                     	switch	.text
1422  030d               _FLASH_GetBootSize:
1424  030d 5204          	subw	sp,#4
1425       00000004      OFST:	set	4
1428                     ; 394   uint32_t temp = 0;
1430                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1432  030f c6505d        	ld	a,20573
1433  0312 5f            	clrw	x
1434  0313 97            	ld	xl,a
1435  0314 90ae0200      	ldw	y,#512
1436  0318 cd0000        	call	c_umul
1438  031b 96            	ldw	x,sp
1439  031c 5c            	incw	x
1440  031d cd0000        	call	c_rtol
1443                     ; 400   if(FLASH->FPR == 0xFF)
1445  0320 c6505d        	ld	a,20573
1446  0323 4c            	inc	a
1447  0324 260d          	jrne	L124
1448                     ; 402     temp += 512;
1450  0326 ae0200        	ldw	x,#512
1451  0329 bf02          	ldw	c_lreg+2,x
1452  032b 5f            	clrw	x
1453  032c bf00          	ldw	c_lreg,x
1454  032e 96            	ldw	x,sp
1455  032f 5c            	incw	x
1456  0330 cd0000        	call	c_lgadd
1459  0333               L124:
1460                     ; 406   return(temp);
1462  0333 96            	ldw	x,sp
1463  0334 5c            	incw	x
1464  0335 cd0000        	call	c_ltor
1468  0338 5b04          	addw	sp,#4
1469  033a 81            	ret	
1572                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1572                     ; 418 {
1573                     	switch	.text
1574  033b               _FLASH_GetFlagStatus:
1576  033b 88            	push	a
1577  033c 88            	push	a
1578       00000001      OFST:	set	1
1581                     ; 419   FlagStatus status = RESET;
1583                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1585  033d a108          	cp	a,#8
1586  033f 2719          	jreq	L032
1587  0341 a104          	cp	a,#4
1588  0343 2715          	jreq	L032
1589  0345 a102          	cp	a,#2
1590  0347 2711          	jreq	L032
1591  0349 4a            	dec	a
1592  034a 270e          	jreq	L032
1593  034c ae01a5        	ldw	x,#421
1594  034f 89            	pushw	x
1595  0350 5f            	clrw	x
1596  0351 89            	pushw	x
1597  0352 ae0010        	ldw	x,#L73
1598  0355 cd0000        	call	_assert_failed
1600  0358 5b04          	addw	sp,#4
1601  035a               L032:
1602                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1604  035a c6505f        	ld	a,20575
1605  035d 1502          	bcp	a,(OFST+1,sp)
1606  035f 2704          	jreq	L174
1607                     ; 426     status = SET; /* FLASH_FLAG is set */
1609  0361 a601          	ld	a,#1
1612  0363 2001          	jra	L374
1613  0365               L174:
1614                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1616  0365 4f            	clr	a
1618  0366               L374:
1619                     ; 434   return status;
1623  0366 85            	popw	x
1624  0367 81            	ret	
1705                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1705                     ; 550 {
1706                     	switch	.text
1707  0368               _FLASH_WaitForLastOperation:
1709  0368 5203          	subw	sp,#3
1710       00000003      OFST:	set	3
1713                     ; 551   uint8_t flagstatus = 0x00;
1715  036a 0f03          	clr	(OFST+0,sp)
1717                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1719  036c aeffff        	ldw	x,#65535
1720                     ; 576   UNUSED(FLASH_MemType);
1723  036f 2008          	jra	L335
1724  0371               L135:
1725                     ; 579     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1727  0371 c6505f        	ld	a,20575
1728  0374 a405          	and	a,#5
1729  0376 6b03          	ld	(OFST+0,sp),a
1731                     ; 580     timeout--;
1733  0378 5a            	decw	x
1734  0379               L335:
1735  0379 1f01          	ldw	(OFST-2,sp),x
1737                     ; 577   while((flagstatus == 0x00) && (timeout != 0x00))
1739  037b 7b03          	ld	a,(OFST+0,sp)
1740  037d 2604          	jrne	L735
1742  037f 1e01          	ldw	x,(OFST-2,sp)
1743  0381 26ee          	jrne	L135
1744  0383               L735:
1745                     ; 584   if(timeout == 0x00 )
1747  0383 1e01          	ldw	x,(OFST-2,sp)
1748  0385 2602          	jrne	L145
1749                     ; 586     flagstatus = FLASH_STATUS_TIMEOUT;
1751  0387 a602          	ld	a,#2
1753  0389               L145:
1754                     ; 589   return((FLASH_Status_TypeDef)flagstatus);
1758  0389 5b03          	addw	sp,#3
1759  038b 81            	ret	
1819                     ; 599 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1819                     ; 600 {
1820                     	switch	.text
1821  038c               _FLASH_EraseBlock:
1823  038c 89            	pushw	x
1824  038d 5206          	subw	sp,#6
1825       00000006      OFST:	set	6
1828                     ; 601   uint32_t startaddress = 0;
1830                     ; 611   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1832  038f 7b0b          	ld	a,(OFST+5,sp)
1833  0391 a1fd          	cp	a,#253
1834  0393 2714          	jreq	L442
1835  0395 a1f7          	cp	a,#247
1836  0397 2710          	jreq	L442
1837  0399 ae0263        	ldw	x,#611
1838  039c 89            	pushw	x
1839  039d 5f            	clrw	x
1840  039e 89            	pushw	x
1841  039f ae0010        	ldw	x,#L73
1842  03a2 cd0000        	call	_assert_failed
1844  03a5 5b04          	addw	sp,#4
1845  03a7 7b0b          	ld	a,(OFST+5,sp)
1846  03a9               L442:
1847                     ; 612   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1849  03a9 a1fd          	cp	a,#253
1850  03ab 261a          	jrne	L175
1851                     ; 614     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1853  03ad 1e07          	ldw	x,(OFST+1,sp)
1854  03af a30080        	cpw	x,#128
1855  03b2 250e          	jrult	L252
1856  03b4 ae0266        	ldw	x,#614
1857  03b7 89            	pushw	x
1858  03b8 5f            	clrw	x
1859  03b9 89            	pushw	x
1860  03ba ae0010        	ldw	x,#L73
1861  03bd cd0000        	call	_assert_failed
1863  03c0 5b04          	addw	sp,#4
1864  03c2               L252:
1865                     ; 615     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1867  03c2 ae8000        	ldw	x,#32768
1869  03c5 2018          	jra	L375
1870  03c7               L175:
1871                     ; 619     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1873  03c7 1e07          	ldw	x,(OFST+1,sp)
1874  03c9 a3000a        	cpw	x,#10
1875  03cc 250e          	jrult	L062
1876  03ce ae026b        	ldw	x,#619
1877  03d1 89            	pushw	x
1878  03d2 5f            	clrw	x
1879  03d3 89            	pushw	x
1880  03d4 ae0010        	ldw	x,#L73
1881  03d7 cd0000        	call	_assert_failed
1883  03da 5b04          	addw	sp,#4
1884  03dc               L062:
1885                     ; 620     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1887  03dc ae4000        	ldw	x,#16384
1888  03df               L375:
1889  03df 1f05          	ldw	(OFST-1,sp),x
1890  03e1 5f            	clrw	x
1891  03e2 1f03          	ldw	(OFST-3,sp),x
1893                     ; 628     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1895  03e4 a640          	ld	a,#64
1896  03e6 1e07          	ldw	x,(OFST+1,sp)
1897  03e8 cd0000        	call	c_cmulx
1899  03eb 96            	ldw	x,sp
1900  03ec 1c0003        	addw	x,#OFST-3
1901  03ef cd0000        	call	c_ladd
1903  03f2 be02          	ldw	x,c_lreg+2
1904  03f4 1f01          	ldw	(OFST-5,sp),x
1906                     ; 632   FLASH->CR2 |= FLASH_CR2_ERASE;
1908  03f6 721a505b      	bset	20571,#5
1909                     ; 633   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1911  03fa 721b505c      	bres	20572,#5
1912                     ; 637     *pwFlash = (uint32_t)0;
1914  03fe 4f            	clr	a
1915  03ff e703          	ld	(3,x),a
1916  0401 e702          	ld	(2,x),a
1917  0403 e701          	ld	(1,x),a
1918  0405 f7            	ld	(x),a
1919                     ; 645 }
1922  0406 5b08          	addw	sp,#8
1923  0408 81            	ret	
2022                     ; 656 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2022                     ; 657                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2022                     ; 658 {
2023                     	switch	.text
2024  0409               _FLASH_ProgramBlock:
2026  0409 89            	pushw	x
2027  040a 5206          	subw	sp,#6
2028       00000006      OFST:	set	6
2031                     ; 659   uint16_t Count = 0;
2033                     ; 660   uint32_t startaddress = 0;
2035                     ; 663   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2037  040c 7b0b          	ld	a,(OFST+5,sp)
2038  040e a1fd          	cp	a,#253
2039  0410 2712          	jreq	L272
2040  0412 a1f7          	cp	a,#247
2041  0414 270e          	jreq	L272
2042  0416 ae0297        	ldw	x,#663
2043  0419 89            	pushw	x
2044  041a 5f            	clrw	x
2045  041b 89            	pushw	x
2046  041c ae0010        	ldw	x,#L73
2047  041f cd0000        	call	_assert_failed
2049  0422 5b04          	addw	sp,#4
2050  0424               L272:
2051                     ; 664   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2053  0424 7b0c          	ld	a,(OFST+6,sp)
2054  0426 2712          	jreq	L203
2055  0428 a110          	cp	a,#16
2056  042a 270e          	jreq	L203
2057  042c ae0298        	ldw	x,#664
2058  042f 89            	pushw	x
2059  0430 5f            	clrw	x
2060  0431 89            	pushw	x
2061  0432 ae0010        	ldw	x,#L73
2062  0435 cd0000        	call	_assert_failed
2064  0438 5b04          	addw	sp,#4
2065  043a               L203:
2066                     ; 665   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
2068  043a 7b0b          	ld	a,(OFST+5,sp)
2069  043c a1fd          	cp	a,#253
2070  043e 261a          	jrne	L146
2071                     ; 667     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2073  0440 1e07          	ldw	x,(OFST+1,sp)
2074  0442 a30080        	cpw	x,#128
2075  0445 250e          	jrult	L013
2076  0447 ae029b        	ldw	x,#667
2077  044a 89            	pushw	x
2078  044b 5f            	clrw	x
2079  044c 89            	pushw	x
2080  044d ae0010        	ldw	x,#L73
2081  0450 cd0000        	call	_assert_failed
2083  0453 5b04          	addw	sp,#4
2084  0455               L013:
2085                     ; 668     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2087  0455 ae8000        	ldw	x,#32768
2089  0458 2018          	jra	L346
2090  045a               L146:
2091                     ; 672     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2093  045a 1e07          	ldw	x,(OFST+1,sp)
2094  045c a3000a        	cpw	x,#10
2095  045f 250e          	jrult	L613
2096  0461 ae02a0        	ldw	x,#672
2097  0464 89            	pushw	x
2098  0465 5f            	clrw	x
2099  0466 89            	pushw	x
2100  0467 ae0010        	ldw	x,#L73
2101  046a cd0000        	call	_assert_failed
2103  046d 5b04          	addw	sp,#4
2104  046f               L613:
2105                     ; 673     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2107  046f ae4000        	ldw	x,#16384
2108  0472               L346:
2109  0472 1f03          	ldw	(OFST-3,sp),x
2110  0474 5f            	clrw	x
2111  0475 1f01          	ldw	(OFST-5,sp),x
2113                     ; 677   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2115  0477 a640          	ld	a,#64
2116  0479 1e07          	ldw	x,(OFST+1,sp)
2117  047b cd0000        	call	c_cmulx
2119  047e 96            	ldw	x,sp
2120  047f 5c            	incw	x
2121  0480 cd0000        	call	c_lgadd
2124                     ; 680   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2126  0483 7b0c          	ld	a,(OFST+6,sp)
2127  0485 260a          	jrne	L546
2128                     ; 683     FLASH->CR2 |= FLASH_CR2_PRG;
2130  0487 7210505b      	bset	20571,#0
2131                     ; 684     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2133  048b 7211505c      	bres	20572,#0
2135  048f 2008          	jra	L746
2136  0491               L546:
2137                     ; 689     FLASH->CR2 |= FLASH_CR2_FPRG;
2139  0491 7218505b      	bset	20571,#4
2140                     ; 690     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2142  0495 7219505c      	bres	20572,#4
2143  0499               L746:
2144                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2146  0499 5f            	clrw	x
2147  049a 1f05          	ldw	(OFST-1,sp),x
2149  049c               L156:
2150                     ; 696     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2152  049c 1e0d          	ldw	x,(OFST+7,sp)
2153  049e 72fb05        	addw	x,(OFST-1,sp)
2154  04a1 f6            	ld	a,(x)
2155  04a2 1e03          	ldw	x,(OFST-3,sp)
2156  04a4 72fb05        	addw	x,(OFST-1,sp)
2157  04a7 f7            	ld	(x),a
2158                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2160  04a8 1e05          	ldw	x,(OFST-1,sp)
2161  04aa 5c            	incw	x
2162  04ab 1f05          	ldw	(OFST-1,sp),x
2166  04ad a30040        	cpw	x,#64
2167  04b0 25ea          	jrult	L156
2168                     ; 698 }
2171  04b2 5b08          	addw	sp,#8
2172  04b4 81            	ret	
2185                     	xdef	_FLASH_WaitForLastOperation
2186                     	xdef	_FLASH_ProgramBlock
2187                     	xdef	_FLASH_EraseBlock
2188                     	xdef	_FLASH_GetFlagStatus
2189                     	xdef	_FLASH_GetBootSize
2190                     	xdef	_FLASH_GetProgrammingTime
2191                     	xdef	_FLASH_GetLowPowerMode
2192                     	xdef	_FLASH_SetProgrammingTime
2193                     	xdef	_FLASH_SetLowPowerMode
2194                     	xdef	_FLASH_EraseOptionByte
2195                     	xdef	_FLASH_ProgramOptionByte
2196                     	xdef	_FLASH_ReadOptionByte
2197                     	xdef	_FLASH_ProgramWord
2198                     	xdef	_FLASH_ReadByte
2199                     	xdef	_FLASH_ProgramByte
2200                     	xdef	_FLASH_EraseByte
2201                     	xdef	_FLASH_ITConfig
2202                     	xdef	_FLASH_DeInit
2203                     	xdef	_FLASH_Lock
2204                     	xdef	_FLASH_Unlock
2205                     	xref	_assert_failed
2206                     	switch	.const
2207  0010               L73:
2208  0010 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
2209  0022 697665725c73  	dc.b	"iver\src\stm8s_fla"
2210  0034 73682e6300    	dc.b	"sh.c",0
2211                     	xref.b	c_lreg
2212                     	xref.b	c_x
2213                     	xref.b	c_y
2233                     	xref	c_ladd
2234                     	xref	c_cmulx
2235                     	xref	c_lgadd
2236                     	xref	c_rtol
2237                     	xref	c_umul
2238                     	xref	c_lcmp
2239                     	xref	c_ltor
2240                     	end
