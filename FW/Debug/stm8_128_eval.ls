   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  44                     ; 209 void SD_LowLevel_DeInit(void)
  44                     ; 210 {
  46                     	switch	.text
  47  0000               _SD_LowLevel_DeInit:
  51                     ; 211   SPI_Cmd(DISABLE); /*!< SD_SPI disable */
  53  0000 4f            	clr	a
  54  0001 cd0000        	call	_SPI_Cmd
  56                     ; 214   CLK_PeripheralClockConfig(SD_SPI_CLK, DISABLE);
  58  0004 ae0100        	ldw	x,#256
  59  0007 cd0000        	call	_CLK_PeripheralClockConfig
  61                     ; 217   GPIO_Init(SD_SPI_SCK_GPIO_PORT, SD_SPI_SCK_PIN, GPIO_MODE_IN_FL_NO_IT);
  63  000a 4b00          	push	#0
  64  000c 4b20          	push	#32
  65  000e ae500a        	ldw	x,#20490
  66  0011 cd0000        	call	_GPIO_Init
  68  0014 85            	popw	x
  69                     ; 220   GPIO_Init(SD_SPI_MISO_GPIO_PORT, SD_SPI_MISO_PIN, GPIO_MODE_IN_FL_NO_IT);
  71  0015 4b00          	push	#0
  72  0017 4b80          	push	#128
  73  0019 ae500a        	ldw	x,#20490
  74  001c cd0000        	call	_GPIO_Init
  76  001f 85            	popw	x
  77                     ; 223   GPIO_Init(SD_SPI_MOSI_GPIO_PORT, SD_SPI_MOSI_PIN, GPIO_MODE_IN_FL_NO_IT);
  79  0020 4b00          	push	#0
  80  0022 4b40          	push	#64
  81  0024 ae500a        	ldw	x,#20490
  82  0027 cd0000        	call	_GPIO_Init
  84  002a 85            	popw	x
  85                     ; 226   GPIO_Init(SD_CS_GPIO_PORT, SD_CS_PIN, GPIO_MODE_IN_FL_NO_IT);
  87  002b 4b00          	push	#0
  88  002d 4b20          	push	#32
  89  002f ae5014        	ldw	x,#20500
  90  0032 cd0000        	call	_GPIO_Init
  92  0035 85            	popw	x
  93                     ; 229   GPIO_Init(SD_DETECT_GPIO_PORT, SD_DETECT_PIN, GPIO_MODE_IN_FL_NO_IT);
  95  0036 4b00          	push	#0
  96  0038 4b10          	push	#16
  97  003a ae5014        	ldw	x,#20500
  98  003d cd0000        	call	_GPIO_Init
 100  0040 85            	popw	x
 101                     ; 230 }
 104  0041 81            	ret
 132                     ; 237 void SD_LowLevel_Init(void)
 132                     ; 238 {
 133                     	switch	.text
 134  0042               _SD_LowLevel_Init:
 138                     ; 240   CLK_PeripheralClockConfig(SD_SPI_CLK, ENABLE);
 140  0042 ae0101        	ldw	x,#257
 141  0045 cd0000        	call	_CLK_PeripheralClockConfig
 143                     ; 243   GPIO_ExternalPullUpConfig(SD_SPI_SCK_GPIO_PORT, (GPIO_Pin_TypeDef)(SD_SPI_MISO_PIN | SD_SPI_MOSI_PIN | \
 143                     ; 244                             SD_SPI_SCK_PIN), ENABLE);
 145  0048 4b01          	push	#1
 146  004a 4be0          	push	#224
 147  004c ae500a        	ldw	x,#20490
 148  004f cd0000        	call	_GPIO_ExternalPullUpConfig
 150  0052 85            	popw	x
 151                     ; 247   SPI_Init( SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_4, SPI_MODE_MASTER,
 151                     ; 248            SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_2EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX,
 151                     ; 249            SPI_NSS_SOFT, 0x07);
 153  0053 4b07          	push	#7
 154  0055 4b02          	push	#2
 155  0057 4b00          	push	#0
 156  0059 4b01          	push	#1
 157  005b 4b02          	push	#2
 158  005d 4b04          	push	#4
 159  005f ae0008        	ldw	x,#8
 160  0062 cd0000        	call	_SPI_Init
 162  0065 5b06          	addw	sp,#6
 163                     ; 253   SPI_Cmd( ENABLE);
 165  0067 a601          	ld	a,#1
 166  0069 cd0000        	call	_SPI_Cmd
 168                     ; 256   GPIO_Init(SD_CS_GPIO_PORT, SD_CS_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 170  006c 4bd0          	push	#208
 171  006e 4b20          	push	#32
 172  0070 ae5014        	ldw	x,#20500
 173  0073 cd0000        	call	_GPIO_Init
 175  0076 85            	popw	x
 176                     ; 257 }
 179  0077 81            	ret
 192                     	xdef	_SD_LowLevel_Init
 193                     	xdef	_SD_LowLevel_DeInit
 194                     	xref	_SPI_Cmd
 195                     	xref	_SPI_Init
 196                     	xref	_GPIO_ExternalPullUpConfig
 197                     	xref	_GPIO_Init
 198                     	xref	_CLK_PeripheralClockConfig
 217                     	end
