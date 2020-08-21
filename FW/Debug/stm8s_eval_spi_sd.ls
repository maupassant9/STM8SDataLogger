   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  43                     ; 75 void SD_DeInit(void)
  43                     ; 76 {
  45                     	switch	.text
  46  0000               _SD_DeInit:
  50                     ; 77   SD_LowLevel_DeInit();
  52  0000 cd0000        	call	_SD_LowLevel_DeInit
  54                     ; 78 }
  57  0003 81            	ret
  95                     .const:	section	.text
  96  0000               L01:
  97  0000 0000000a      	dc.l	10
  98                     ; 87 uint8_t SD_Init(void)
  98                     ; 88 {
  99                     	switch	.text
 100  0004               _SD_Init:
 102  0004 5204          	subw	sp,#4
 103       00000004      OFST:	set	4
 106                     ; 89   uint32_t i = 0;
 108                     ; 92   SD_LowLevel_Init();
 110  0006 cd0000        	call	_SD_LowLevel_Init
 112                     ; 95   SD_CS_LOW();
 114  0009 4b20          	push	#32
 115  000b ae5014        	ldw	x,#20500
 116  000e cd0000        	call	_GPIO_WriteLow
 118  0011 84            	pop	a
 119                     ; 99   for (i = 0; i <= 9; i++)
 121  0012 ae0000        	ldw	x,#0
 122  0015 1f03          	ldw	(OFST-1,sp),x
 123  0017 ae0000        	ldw	x,#0
 124  001a 1f01          	ldw	(OFST-3,sp),x
 126  001c               L73:
 127                     ; 102     SD_WriteByte(SD_DUMMY_BYTE);
 129  001c a6ff          	ld	a,#255
 130  001e cd090b        	call	_SD_WriteByte
 132                     ; 99   for (i = 0; i <= 9; i++)
 134  0021 96            	ldw	x,sp
 135  0022 1c0001        	addw	x,#OFST-3
 136  0025 a601          	ld	a,#1
 137  0027 cd0000        	call	c_lgadc
 142  002a 96            	ldw	x,sp
 143  002b 1c0001        	addw	x,#OFST-3
 144  002e cd0000        	call	c_ltor
 146  0031 ae0000        	ldw	x,#L01
 147  0034 cd0000        	call	c_lcmp
 149  0037 25e3          	jrult	L73
 150                     ; 106   return (SD_GoIdleState());
 152  0039 cd08aa        	call	_SD_GoIdleState
 156  003c 5b04          	addw	sp,#4
 157  003e 81            	ret
 192                     ; 114 uint8_t SD_Detect(void)
 192                     ; 115 {
 193                     	switch	.text
 194  003f               _SD_Detect:
 196  003f 88            	push	a
 197       00000001      OFST:	set	1
 200                     ; 116   __IO uint8_t status = SD_PRESENT;
 202  0040 a601          	ld	a,#1
 203  0042 6b01          	ld	(OFST+0,sp),a
 205                     ; 119   if (GPIO_ReadInputData(SD_DETECT_GPIO_PORT) & SD_DETECT_PIN)
 207  0044 ae5014        	ldw	x,#20500
 208  0047 cd0000        	call	_GPIO_ReadInputData
 210  004a a510          	bcp	a,#16
 211  004c 2702          	jreq	L36
 212                     ; 121     status = SD_NOT_PRESENT;
 214  004e 0f01          	clr	(OFST+0,sp)
 216  0050               L36:
 217                     ; 123   return status;
 219  0050 7b01          	ld	a,(OFST+0,sp)
 222  0052 5b01          	addw	sp,#1
 223  0054 81            	ret
 751                     ; 134 uint8_t SD_GetCardInfo(SD_CardInfo *cardinfo)
 751                     ; 135 {
 752                     	switch	.text
 753  0055               _SD_GetCardInfo:
 755  0055 89            	pushw	x
 756  0056 88            	push	a
 757       00000001      OFST:	set	1
 760                     ; 136   uint8_t status = SD_RESPONSE_FAILURE;
 762                     ; 138   status = SD_GetCSDRegister(&(cardinfo->SD_csd));
 764  0057 cd03af        	call	_SD_GetCSDRegister
 766                     ; 139   status = SD_GetCIDRegister(&(cardinfo->SD_cid));
 768  005a 1e02          	ldw	x,(OFST+1,sp)
 769  005c 1c0029        	addw	x,#41
 770  005f cd05ef        	call	_SD_GetCIDRegister
 772  0062 6b01          	ld	(OFST+0,sp),a
 774                     ; 140   cardinfo->CardCapacity = (cardinfo->SD_csd.DeviceSize + 1) ;
 776  0064 1e02          	ldw	x,(OFST+1,sp)
 777  0066 1c000e        	addw	x,#14
 778  0069 cd0000        	call	c_ltor
 780  006c a601          	ld	a,#1
 781  006e cd0000        	call	c_ladc
 783  0071 1e02          	ldw	x,(OFST+1,sp)
 784  0073 1c003b        	addw	x,#59
 785  0076 cd0000        	call	c_rtol
 787                     ; 141   cardinfo->CardCapacity *= (1 << (cardinfo->SD_csd.DeviceSizeMul + 2));
 789  0079 1e02          	ldw	x,(OFST+1,sp)
 790  007b 1602          	ldw	y,(OFST+1,sp)
 791  007d 90e616        	ld	a,(22,y)
 792  0080 ab02          	add	a,#2
 793  0082 90ae0001      	ldw	y,#1
 794  0086 4d            	tnz	a
 795  0087 2705          	jreq	L61
 796  0089               L02:
 797  0089 9058          	sllw	y
 798  008b 4a            	dec	a
 799  008c 26fb          	jrne	L02
 800  008e               L61:
 801  008e cd0000        	call	c_itoly
 803  0091 1c003b        	addw	x,#59
 804  0094 cd0000        	call	c_lgmul
 806                     ; 142   cardinfo->CardBlockSize = 1 << (cardinfo->SD_csd.RdBlockLen);
 808  0097 ae0001        	ldw	x,#1
 809  009a 1602          	ldw	y,(OFST+1,sp)
 810  009c 90e608        	ld	a,(8,y)
 811  009f 4d            	tnz	a
 812  00a0 2704          	jreq	L22
 813  00a2               L42:
 814  00a2 58            	sllw	x
 815  00a3 4a            	dec	a
 816  00a4 26fc          	jrne	L42
 817  00a6               L22:
 818  00a6 cd0000        	call	c_itolx
 820  00a9 1e02          	ldw	x,(OFST+1,sp)
 821  00ab 1c003f        	addw	x,#63
 822  00ae cd0000        	call	c_rtol
 824                     ; 143   cardinfo->CardCapacity *= cardinfo->CardBlockSize;
 826  00b1 1e02          	ldw	x,(OFST+1,sp)
 827  00b3 1602          	ldw	y,(OFST+1,sp)
 828  00b5 90e642        	ld	a,(66,y)
 829  00b8 b703          	ld	c_lreg+3,a
 830  00ba 90e641        	ld	a,(65,y)
 831  00bd b702          	ld	c_lreg+2,a
 832  00bf 90e640        	ld	a,(64,y)
 833  00c2 b701          	ld	c_lreg+1,a
 834  00c4 90e63f        	ld	a,(63,y)
 835  00c7 b700          	ld	c_lreg,a
 836  00c9 1c003b        	addw	x,#59
 837  00cc cd0000        	call	c_lgmul
 839                     ; 146   return status;
 841  00cf 7b01          	ld	a,(OFST+0,sp)
 844  00d1 5b03          	addw	sp,#3
 845  00d3 81            	ret
 922                     ; 159 uint8_t SD_ReadBlock(uint8_t* pBuffer, uint32_t ReadAddr, uint16_t BlockSize)
 922                     ; 160 {
 923                     	switch	.text
 924  00d4               _SD_ReadBlock:
 926  00d4 89            	pushw	x
 927  00d5 5205          	subw	sp,#5
 928       00000005      OFST:	set	5
 931                     ; 161   uint32_t i = 0;
 933                     ; 162   uint8_t rvalue = SD_RESPONSE_FAILURE;
 935  00d7 a6ff          	ld	a,#255
 936  00d9 6b01          	ld	(OFST-4,sp),a
 938                     ; 165   SD_CS_LOW();
 940  00db 4b20          	push	#32
 941  00dd ae5014        	ldw	x,#20500
 942  00e0 cd0000        	call	_GPIO_WriteLow
 944  00e3 84            	pop	a
 945                     ; 168   SD_SendCmd(SD_CMD_READ_SINGLE_BLOCK, ReadAddr, 0xFF);
 947  00e4 4bff          	push	#255
 948  00e6 1e0d          	ldw	x,(OFST+8,sp)
 949  00e8 89            	pushw	x
 950  00e9 1e0d          	ldw	x,(OFST+8,sp)
 951  00eb 89            	pushw	x
 952  00ec a611          	ld	a,#17
 953  00ee cd077c        	call	_SD_SendCmd
 955  00f1 5b05          	addw	sp,#5
 956                     ; 171   if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
 958  00f3 4f            	clr	a
 959  00f4 cd082d        	call	_SD_GetResponse
 961  00f7 4d            	tnz	a
 962  00f8 2640          	jrne	L374
 963                     ; 174     if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
 965  00fa a6fe          	ld	a,#254
 966  00fc cd082d        	call	_SD_GetResponse
 968  00ff 4d            	tnz	a
 969  0100 2638          	jrne	L374
 970                     ; 177       for (i = 0; i < BlockSize; i++)
 972  0102 ae0000        	ldw	x,#0
 973  0105 1f04          	ldw	(OFST-1,sp),x
 974  0107 ae0000        	ldw	x,#0
 975  010a 1f02          	ldw	(OFST-3,sp),x
 978  010c 2016          	jra	L305
 979  010e               L774:
 980                     ; 180         *pBuffer = SD_ReadByte();
 982  010e cd0927        	call	_SD_ReadByte
 984  0111 1e06          	ldw	x,(OFST+1,sp)
 985  0113 f7            	ld	(x),a
 986                     ; 183         pBuffer++;
 988  0114 1e06          	ldw	x,(OFST+1,sp)
 989  0116 1c0001        	addw	x,#1
 990  0119 1f06          	ldw	(OFST+1,sp),x
 991                     ; 177       for (i = 0; i < BlockSize; i++)
 993  011b 96            	ldw	x,sp
 994  011c 1c0002        	addw	x,#OFST-3
 995  011f a601          	ld	a,#1
 996  0121 cd0000        	call	c_lgadc
 999  0124               L305:
1002  0124 1e0e          	ldw	x,(OFST+9,sp)
1003  0126 cd0000        	call	c_uitolx
1005  0129 96            	ldw	x,sp
1006  012a 1c0002        	addw	x,#OFST-3
1007  012d cd0000        	call	c_lcmp
1009  0130 22dc          	jrugt	L774
1010                     ; 186       SD_ReadByte();
1012  0132 cd0927        	call	_SD_ReadByte
1014                     ; 187       SD_ReadByte();
1016  0135 cd0927        	call	_SD_ReadByte
1018                     ; 189       rvalue = SD_RESPONSE_NO_ERROR;
1020  0138 0f01          	clr	(OFST-4,sp)
1022  013a               L374:
1023                     ; 193   SD_CS_HIGH();
1025  013a 4b20          	push	#32
1026  013c ae5014        	ldw	x,#20500
1027  013f cd0000        	call	_GPIO_WriteHigh
1029  0142 84            	pop	a
1030                     ; 196   SD_WriteByte(SD_DUMMY_BYTE);
1032  0143 a6ff          	ld	a,#255
1033  0145 cd090b        	call	_SD_WriteByte
1035                     ; 199   return rvalue;
1037  0148 7b01          	ld	a,(OFST-4,sp)
1040  014a 5b07          	addw	sp,#7
1041  014c 81            	ret
1136                     	switch	.const
1137  0004               L23:
1138  0004 00000200      	dc.l	512
1139                     ; 212 uint8_t SD_ReadBuffer(uint8_t *pBuffer, uint32_t ReadAddr, uint32_t NumByteToRead)
1139                     ; 213 {
1140                     	switch	.text
1141  014d               _SD_ReadBuffer:
1143  014d 89            	pushw	x
1144  014e 520d          	subw	sp,#13
1145       0000000d      OFST:	set	13
1148                     ; 214   uint32_t i = 0, NbrOfBlock = 0, Offset = 0;
1154  0150 ae0000        	ldw	x,#0
1155  0153 1f07          	ldw	(OFST-6,sp),x
1156  0155 ae0000        	ldw	x,#0
1157  0158 1f05          	ldw	(OFST-8,sp),x
1159                     ; 215   uint8_t rvalue = SD_RESPONSE_FAILURE;
1161  015a a6ff          	ld	a,#255
1162  015c 6b09          	ld	(OFST-4,sp),a
1164                     ; 218   NbrOfBlock = NumByteToRead / SD_BLOCK_SIZE;
1166  015e 96            	ldw	x,sp
1167  015f 1c0016        	addw	x,#OFST+9
1168  0162 cd0000        	call	c_ltor
1170  0165 a609          	ld	a,#9
1171  0167 cd0000        	call	c_lursh
1173  016a 96            	ldw	x,sp
1174  016b 1c0001        	addw	x,#OFST-12
1175  016e cd0000        	call	c_rtol
1178                     ; 220   SD_CS_LOW();
1180  0171 4b20          	push	#32
1181  0173 ae5014        	ldw	x,#20500
1182  0176 cd0000        	call	_GPIO_WriteLow
1184  0179 84            	pop	a
1186  017a acfe01fe      	jpf	L755
1187  017e               L555:
1188                     ; 226     SD_SendCmd (SD_CMD_READ_SINGLE_BLOCK, ReadAddr + Offset, 0xFF);
1190  017e 4bff          	push	#255
1191  0180 96            	ldw	x,sp
1192  0181 1c0013        	addw	x,#OFST+6
1193  0184 cd0000        	call	c_ltor
1195  0187 96            	ldw	x,sp
1196  0188 1c0006        	addw	x,#OFST-7
1197  018b cd0000        	call	c_ladd
1199  018e be02          	ldw	x,c_lreg+2
1200  0190 89            	pushw	x
1201  0191 be00          	ldw	x,c_lreg
1202  0193 89            	pushw	x
1203  0194 a611          	ld	a,#17
1204  0196 cd077c        	call	_SD_SendCmd
1206  0199 5b05          	addw	sp,#5
1207                     ; 228     if (SD_GetResponse(SD_RESPONSE_NO_ERROR))
1209  019b 4f            	clr	a
1210  019c cd082d        	call	_SD_GetResponse
1212  019f 4d            	tnz	a
1213  01a0 2706          	jreq	L365
1214                     ; 230       return  SD_RESPONSE_FAILURE;
1216  01a2 a6ff          	ld	a,#255
1218  01a4 ac260226      	jpf	L43
1219  01a8               L365:
1220                     ; 233     if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
1222  01a8 a6fe          	ld	a,#254
1223  01aa cd082d        	call	_SD_GetResponse
1225  01ad 4d            	tnz	a
1226  01ae 264a          	jrne	L565
1227                     ; 236       for (i = 0; i < SD_BLOCK_SIZE; i++)
1229  01b0 ae0000        	ldw	x,#0
1230  01b3 1f0c          	ldw	(OFST-1,sp),x
1231  01b5 ae0000        	ldw	x,#0
1232  01b8 1f0a          	ldw	(OFST-3,sp),x
1234  01ba               L765:
1235                     ; 239         *pBuffer = SD_ReadByte();
1237  01ba cd0927        	call	_SD_ReadByte
1239  01bd 1e0e          	ldw	x,(OFST+1,sp)
1240  01bf f7            	ld	(x),a
1241                     ; 241         pBuffer++;
1243  01c0 1e0e          	ldw	x,(OFST+1,sp)
1244  01c2 1c0001        	addw	x,#1
1245  01c5 1f0e          	ldw	(OFST+1,sp),x
1246                     ; 236       for (i = 0; i < SD_BLOCK_SIZE; i++)
1248  01c7 96            	ldw	x,sp
1249  01c8 1c000a        	addw	x,#OFST-3
1250  01cb a601          	ld	a,#1
1251  01cd cd0000        	call	c_lgadc
1256  01d0 96            	ldw	x,sp
1257  01d1 1c000a        	addw	x,#OFST-3
1258  01d4 cd0000        	call	c_ltor
1260  01d7 ae0004        	ldw	x,#L23
1261  01da cd0000        	call	c_lcmp
1263  01dd 25db          	jrult	L765
1264                     ; 244       Offset += 512;
1266  01df ae0200        	ldw	x,#512
1267  01e2 bf02          	ldw	c_lreg+2,x
1268  01e4 ae0000        	ldw	x,#0
1269  01e7 bf00          	ldw	c_lreg,x
1270  01e9 96            	ldw	x,sp
1271  01ea 1c0005        	addw	x,#OFST-8
1272  01ed cd0000        	call	c_lgadd
1275                     ; 246       SD_ReadByte();
1277  01f0 cd0927        	call	_SD_ReadByte
1279                     ; 247       SD_ReadByte();
1281  01f3 cd0927        	call	_SD_ReadByte
1283                     ; 249       rvalue = SD_RESPONSE_NO_ERROR;
1285  01f6 0f09          	clr	(OFST-4,sp)
1288  01f8 2004          	jra	L755
1289  01fa               L565:
1290                     ; 254       rvalue = SD_RESPONSE_FAILURE;
1292  01fa a6ff          	ld	a,#255
1293  01fc 6b09          	ld	(OFST-4,sp),a
1295  01fe               L755:
1296                     ; 223   while (NbrOfBlock --)
1298  01fe 96            	ldw	x,sp
1299  01ff 1c0001        	addw	x,#OFST-12
1300  0202 cd0000        	call	c_ltor
1302  0205 96            	ldw	x,sp
1303  0206 1c0001        	addw	x,#OFST-12
1304  0209 a601          	ld	a,#1
1305  020b cd0000        	call	c_lgsbc
1308  020e cd0000        	call	c_lrzmp
1310  0211 2703          	jreq	L63
1311  0213 cc017e        	jp	L555
1312  0216               L63:
1313                     ; 259   SD_CS_HIGH();
1315  0216 4b20          	push	#32
1316  0218 ae5014        	ldw	x,#20500
1317  021b cd0000        	call	_GPIO_WriteHigh
1319  021e 84            	pop	a
1320                     ; 261   SD_WriteByte(SD_DUMMY_BYTE);
1322  021f a6ff          	ld	a,#255
1323  0221 cd090b        	call	_SD_WriteByte
1325                     ; 263   return rvalue;
1327  0224 7b09          	ld	a,(OFST-4,sp)
1329  0226               L43:
1331  0226 5b0f          	addw	sp,#15
1332  0228 81            	ret
1410                     ; 276 uint8_t SD_WriteBlock(uint8_t* pBuffer, uint32_t WriteAddr, uint16_t BlockSize)
1410                     ; 277 {
1411                     	switch	.text
1412  0229               _SD_WriteBlock:
1414  0229 89            	pushw	x
1415  022a 5205          	subw	sp,#5
1416       00000005      OFST:	set	5
1419                     ; 278   uint32_t i = 0;
1421                     ; 279   uint8_t rvalue = SD_RESPONSE_FAILURE;
1423  022c a6ff          	ld	a,#255
1424  022e 6b01          	ld	(OFST-4,sp),a
1426                     ; 282   SD_CS_LOW();
1428  0230 4b20          	push	#32
1429  0232 ae5014        	ldw	x,#20500
1430  0235 cd0000        	call	_GPIO_WriteLow
1432  0238 84            	pop	a
1433                     ; 285   SD_SendCmd(SD_CMD_WRITE_SINGLE_BLOCK, WriteAddr, 0xFF);
1435  0239 4bff          	push	#255
1436  023b 1e0d          	ldw	x,(OFST+8,sp)
1437  023d 89            	pushw	x
1438  023e 1e0d          	ldw	x,(OFST+8,sp)
1439  0240 89            	pushw	x
1440  0241 a618          	ld	a,#24
1441  0243 cd077c        	call	_SD_SendCmd
1443  0246 5b05          	addw	sp,#5
1444                     ; 288   if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
1446  0248 4f            	clr	a
1447  0249 cd082d        	call	_SD_GetResponse
1449  024c 4d            	tnz	a
1450  024d 2668          	jrne	L536
1451                     ; 291     SD_WriteByte(SD_DUMMY_BYTE);
1453  024f a6ff          	ld	a,#255
1454  0251 cd090b        	call	_SD_WriteByte
1456                     ; 294     SD_WriteByte(0xFE);
1458  0254 a6fe          	ld	a,#254
1459  0256 cd090b        	call	_SD_WriteByte
1461                     ; 297     for (i = 0; i < BlockSize; i++)
1463  0259 ae0000        	ldw	x,#0
1464  025c 1f04          	ldw	(OFST-1,sp),x
1465  025e ae0000        	ldw	x,#0
1466  0261 1f02          	ldw	(OFST-3,sp),x
1469  0263 2016          	jra	L346
1470  0265               L736:
1471                     ; 300       SD_WriteByte(*pBuffer);
1473  0265 1e06          	ldw	x,(OFST+1,sp)
1474  0267 f6            	ld	a,(x)
1475  0268 cd090b        	call	_SD_WriteByte
1477                     ; 302       pBuffer++;
1479  026b 1e06          	ldw	x,(OFST+1,sp)
1480  026d 1c0001        	addw	x,#1
1481  0270 1f06          	ldw	(OFST+1,sp),x
1482                     ; 297     for (i = 0; i < BlockSize; i++)
1484  0272 96            	ldw	x,sp
1485  0273 1c0002        	addw	x,#OFST-3
1486  0276 a601          	ld	a,#1
1487  0278 cd0000        	call	c_lgadc
1490  027b               L346:
1493  027b 1e0e          	ldw	x,(OFST+9,sp)
1494  027d cd0000        	call	c_uitolx
1496  0280 96            	ldw	x,sp
1497  0281 1c0002        	addw	x,#OFST-3
1498  0284 cd0000        	call	c_lcmp
1500  0287 22dc          	jrugt	L736
1502  0289 200e          	jra	L356
1503  028b               L746:
1504                     ; 310       SD_WriteByte(SD_DUMMY_BYTE);
1506  028b a6ff          	ld	a,#255
1507  028d cd090b        	call	_SD_WriteByte
1509                     ; 307     for (; i != SD_BLOCK_SIZE; i++)
1511  0290 96            	ldw	x,sp
1512  0291 1c0002        	addw	x,#OFST-3
1513  0294 a601          	ld	a,#1
1514  0296 cd0000        	call	c_lgadc
1517  0299               L356:
1520  0299 96            	ldw	x,sp
1521  029a 1c0002        	addw	x,#OFST-3
1522  029d cd0000        	call	c_ltor
1524  02a0 ae0004        	ldw	x,#L23
1525  02a3 cd0000        	call	c_lcmp
1527  02a6 26e3          	jrne	L746
1528                     ; 314     SD_ReadByte();
1530  02a8 cd0927        	call	_SD_ReadByte
1532                     ; 315     SD_ReadByte();
1534  02ab cd0927        	call	_SD_ReadByte
1536                     ; 318     if (SD_GetDataResponse() == SD_DATA_OK)
1538  02ae cd07c7        	call	_SD_GetDataResponse
1540  02b1 a105          	cp	a,#5
1541  02b3 2602          	jrne	L536
1542                     ; 320       rvalue = SD_RESPONSE_NO_ERROR;
1544  02b5 0f01          	clr	(OFST-4,sp)
1546  02b7               L536:
1547                     ; 324   SD_CS_HIGH();
1549  02b7 4b20          	push	#32
1550  02b9 ae5014        	ldw	x,#20500
1551  02bc cd0000        	call	_GPIO_WriteHigh
1553  02bf 84            	pop	a
1554                     ; 326   SD_WriteByte(SD_DUMMY_BYTE);
1556  02c0 a6ff          	ld	a,#255
1557  02c2 cd090b        	call	_SD_WriteByte
1559                     ; 329   return rvalue;
1561  02c5 7b01          	ld	a,(OFST-4,sp)
1564  02c7 5b07          	addw	sp,#7
1565  02c9 81            	ret
1661                     ; 345 uint8_t SD_WriteBuffer(uint8_t *pBuffer, uint32_t WriteAddr, uint32_t NumByteToWrite)
1661                     ; 346 {
1662                     	switch	.text
1663  02ca               _SD_WriteBuffer:
1665  02ca 89            	pushw	x
1666  02cb 520d          	subw	sp,#13
1667       0000000d      OFST:	set	13
1670                     ; 347   uint32_t i = 0, NbrOfBlock = 0, Offset = 0;
1676  02cd ae0000        	ldw	x,#0
1677  02d0 1f07          	ldw	(OFST-6,sp),x
1678  02d2 ae0000        	ldw	x,#0
1679  02d5 1f05          	ldw	(OFST-8,sp),x
1681                     ; 348   uint8_t rvalue = SD_RESPONSE_FAILURE;
1683  02d7 a6ff          	ld	a,#255
1684  02d9 6b09          	ld	(OFST-4,sp),a
1686                     ; 351   NbrOfBlock = NumByteToWrite / SD_BLOCK_SIZE;
1688  02db 96            	ldw	x,sp
1689  02dc 1c0016        	addw	x,#OFST+9
1690  02df cd0000        	call	c_ltor
1692  02e2 a609          	ld	a,#9
1693  02e4 cd0000        	call	c_lursh
1695  02e7 96            	ldw	x,sp
1696  02e8 1c0001        	addw	x,#OFST-12
1697  02eb cd0000        	call	c_rtol
1700                     ; 353   SD_CS_LOW();
1702  02ee 4b20          	push	#32
1703  02f0 ae5014        	ldw	x,#20500
1704  02f3 cd0000        	call	_GPIO_WriteLow
1706  02f6 84            	pop	a
1708  02f7 ac840384      	jpf	L137
1709  02fb               L727:
1710                     ; 359     SD_SendCmd(SD_CMD_WRITE_SINGLE_BLOCK, WriteAddr + Offset, 0xFF);
1712  02fb 4bff          	push	#255
1713  02fd 96            	ldw	x,sp
1714  02fe 1c0013        	addw	x,#OFST+6
1715  0301 cd0000        	call	c_ltor
1717  0304 96            	ldw	x,sp
1718  0305 1c0006        	addw	x,#OFST-7
1719  0308 cd0000        	call	c_ladd
1721  030b be02          	ldw	x,c_lreg+2
1722  030d 89            	pushw	x
1723  030e be00          	ldw	x,c_lreg
1724  0310 89            	pushw	x
1725  0311 a618          	ld	a,#24
1726  0313 cd077c        	call	_SD_SendCmd
1728  0316 5b05          	addw	sp,#5
1729                     ; 362     if (SD_GetResponse(SD_RESPONSE_NO_ERROR))
1731  0318 4f            	clr	a
1732  0319 cd082d        	call	_SD_GetResponse
1734  031c 4d            	tnz	a
1735  031d 2706          	jreq	L537
1736                     ; 364       return SD_RESPONSE_FAILURE;
1738  031f a6ff          	ld	a,#255
1740  0321 acac03ac      	jpf	L44
1741  0325               L537:
1742                     ; 367     SD_WriteByte(SD_DUMMY_BYTE);
1744  0325 a6ff          	ld	a,#255
1745  0327 cd090b        	call	_SD_WriteByte
1747                     ; 369     SD_WriteByte(SD_START_DATA_SINGLE_BLOCK_WRITE);
1749  032a a6fe          	ld	a,#254
1750  032c cd090b        	call	_SD_WriteByte
1752                     ; 371     for (i = 0; i < SD_BLOCK_SIZE; i++)
1754  032f ae0000        	ldw	x,#0
1755  0332 1f0c          	ldw	(OFST-1,sp),x
1756  0334 ae0000        	ldw	x,#0
1757  0337 1f0a          	ldw	(OFST-3,sp),x
1759  0339               L737:
1760                     ; 374       SD_WriteByte(*pBuffer);
1762  0339 1e0e          	ldw	x,(OFST+1,sp)
1763  033b f6            	ld	a,(x)
1764  033c cd090b        	call	_SD_WriteByte
1766                     ; 376       pBuffer++;
1768  033f 1e0e          	ldw	x,(OFST+1,sp)
1769  0341 1c0001        	addw	x,#1
1770  0344 1f0e          	ldw	(OFST+1,sp),x
1771                     ; 371     for (i = 0; i < SD_BLOCK_SIZE; i++)
1773  0346 96            	ldw	x,sp
1774  0347 1c000a        	addw	x,#OFST-3
1775  034a a601          	ld	a,#1
1776  034c cd0000        	call	c_lgadc
1781  034f 96            	ldw	x,sp
1782  0350 1c000a        	addw	x,#OFST-3
1783  0353 cd0000        	call	c_ltor
1785  0356 ae0004        	ldw	x,#L23
1786  0359 cd0000        	call	c_lcmp
1788  035c 25db          	jrult	L737
1789                     ; 379     Offset += 512;
1791  035e ae0200        	ldw	x,#512
1792  0361 bf02          	ldw	c_lreg+2,x
1793  0363 ae0000        	ldw	x,#0
1794  0366 bf00          	ldw	c_lreg,x
1795  0368 96            	ldw	x,sp
1796  0369 1c0005        	addw	x,#OFST-8
1797  036c cd0000        	call	c_lgadd
1800                     ; 381     SD_ReadByte();
1802  036f cd0927        	call	_SD_ReadByte
1804                     ; 382     SD_ReadByte();
1806  0372 cd0927        	call	_SD_ReadByte
1808                     ; 384     if (SD_GetDataResponse() == SD_DATA_OK)
1810  0375 cd07c7        	call	_SD_GetDataResponse
1812  0378 a105          	cp	a,#5
1813  037a 2604          	jrne	L547
1814                     ; 387       rvalue = SD_RESPONSE_NO_ERROR;
1816  037c 0f09          	clr	(OFST-4,sp)
1819  037e 2004          	jra	L137
1820  0380               L547:
1821                     ; 392       rvalue = SD_RESPONSE_FAILURE;
1823  0380 a6ff          	ld	a,#255
1824  0382 6b09          	ld	(OFST-4,sp),a
1826  0384               L137:
1827                     ; 356   while (NbrOfBlock--)
1829  0384 96            	ldw	x,sp
1830  0385 1c0001        	addw	x,#OFST-12
1831  0388 cd0000        	call	c_ltor
1833  038b 96            	ldw	x,sp
1834  038c 1c0001        	addw	x,#OFST-12
1835  038f a601          	ld	a,#1
1836  0391 cd0000        	call	c_lgsbc
1839  0394 cd0000        	call	c_lrzmp
1841  0397 2703          	jreq	L64
1842  0399 cc02fb        	jp	L727
1843  039c               L64:
1844                     ; 397   SD_CS_HIGH();
1846  039c 4b20          	push	#32
1847  039e ae5014        	ldw	x,#20500
1848  03a1 cd0000        	call	_GPIO_WriteHigh
1850  03a4 84            	pop	a
1851                     ; 399   SD_WriteByte(SD_DUMMY_BYTE);
1853  03a5 a6ff          	ld	a,#255
1854  03a7 cd090b        	call	_SD_WriteByte
1856                     ; 401   return rvalue;
1858  03aa 7b09          	ld	a,(OFST-4,sp)
1860  03ac               L44:
1862  03ac 5b0f          	addw	sp,#15
1863  03ae 81            	ret
1934                     	switch	.const
1935  0008               L25:
1936  0008 00000010      	dc.l	16
1937                     ; 413 uint8_t SD_GetCSDRegister(SD_CSD* SD_csd)
1937                     ; 414 {
1938                     	switch	.text
1939  03af               _SD_GetCSDRegister:
1941  03af 89            	pushw	x
1942  03b0 5215          	subw	sp,#21
1943       00000015      OFST:	set	21
1946                     ; 415   uint32_t i = 0;
1948                     ; 416   uint8_t rvalue = SD_RESPONSE_FAILURE;
1950  03b2 a6ff          	ld	a,#255
1951  03b4 6b01          	ld	(OFST-20,sp),a
1953                     ; 420   SD_CS_LOW();
1955  03b6 4b20          	push	#32
1956  03b8 ae5014        	ldw	x,#20500
1957  03bb cd0000        	call	_GPIO_WriteLow
1959  03be 84            	pop	a
1960                     ; 422   SD_SendCmd(SD_CMD_SEND_CSD, 0, 0xFF);
1962  03bf 4bff          	push	#255
1963  03c1 ae0000        	ldw	x,#0
1964  03c4 89            	pushw	x
1965  03c5 ae0000        	ldw	x,#0
1966  03c8 89            	pushw	x
1967  03c9 a609          	ld	a,#9
1968  03cb cd077c        	call	_SD_SendCmd
1970  03ce 5b05          	addw	sp,#5
1971                     ; 424   if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
1973  03d0 4f            	clr	a
1974  03d1 cd082d        	call	_SD_GetResponse
1976  03d4 4d            	tnz	a
1977  03d5 2641          	jrne	L5001
1978                     ; 426     if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
1980  03d7 a6fe          	ld	a,#254
1981  03d9 cd082d        	call	_SD_GetResponse
1983  03dc 4d            	tnz	a
1984  03dd 262d          	jrne	L7001
1985                     ; 428       for (i = 0; i < 16; i++)
1987  03df ae0000        	ldw	x,#0
1988  03e2 1f04          	ldw	(OFST-17,sp),x
1989  03e4 ae0000        	ldw	x,#0
1990  03e7 1f02          	ldw	(OFST-19,sp),x
1992  03e9               L1101:
1993                     ; 431         CSD_Tab[i] = SD_ReadByte();
1995  03e9 cd0927        	call	_SD_ReadByte
1997  03ec 96            	ldw	x,sp
1998  03ed 1c0006        	addw	x,#OFST-15
1999  03f0 72fb04        	addw	x,(OFST-17,sp)
2000  03f3 f7            	ld	(x),a
2001                     ; 428       for (i = 0; i < 16; i++)
2003  03f4 96            	ldw	x,sp
2004  03f5 1c0002        	addw	x,#OFST-19
2005  03f8 a601          	ld	a,#1
2006  03fa cd0000        	call	c_lgadc
2011  03fd 96            	ldw	x,sp
2012  03fe 1c0002        	addw	x,#OFST-19
2013  0401 cd0000        	call	c_ltor
2015  0404 ae0008        	ldw	x,#L25
2016  0407 cd0000        	call	c_lcmp
2018  040a 25dd          	jrult	L1101
2019  040c               L7001:
2020                     ; 435     SD_WriteByte(SD_DUMMY_BYTE);
2022  040c a6ff          	ld	a,#255
2023  040e cd090b        	call	_SD_WriteByte
2025                     ; 436     SD_WriteByte(SD_DUMMY_BYTE);
2027  0411 a6ff          	ld	a,#255
2028  0413 cd090b        	call	_SD_WriteByte
2030                     ; 438     rvalue = SD_RESPONSE_NO_ERROR;
2032  0416 0f01          	clr	(OFST-20,sp)
2034  0418               L5001:
2035                     ; 441   SD_CS_HIGH();
2037  0418 4b20          	push	#32
2038  041a ae5014        	ldw	x,#20500
2039  041d cd0000        	call	_GPIO_WriteHigh
2041  0420 84            	pop	a
2042                     ; 443   SD_WriteByte(SD_DUMMY_BYTE);
2044  0421 a6ff          	ld	a,#255
2045  0423 cd090b        	call	_SD_WriteByte
2047                     ; 446   SD_csd->CSDStruct = (uint8_t)((CSD_Tab[0] & 0xC0) >> 6);
2049  0426 7b06          	ld	a,(OFST-15,sp)
2050  0428 4e            	swap	a
2051  0429 44            	srl	a
2052  042a 44            	srl	a
2053  042b a403          	and	a,#3
2054  042d 1e16          	ldw	x,(OFST+1,sp)
2055  042f f7            	ld	(x),a
2056                     ; 447   SD_csd->SysSpecVersion = (uint8_t)((CSD_Tab[0] & 0x3C) >> 2);
2058  0430 7b06          	ld	a,(OFST-15,sp)
2059  0432 44            	srl	a
2060  0433 44            	srl	a
2061  0434 a40f          	and	a,#15
2062  0436 1e16          	ldw	x,(OFST+1,sp)
2063  0438 e701          	ld	(1,x),a
2064                     ; 448   SD_csd->Reserved1 = (uint8_t)(CSD_Tab[0] & 0x03);
2066  043a 7b06          	ld	a,(OFST-15,sp)
2067  043c a403          	and	a,#3
2068  043e 1e16          	ldw	x,(OFST+1,sp)
2069  0440 e702          	ld	(2,x),a
2070                     ; 451   SD_csd->TAAC = CSD_Tab[1];
2072  0442 7b07          	ld	a,(OFST-14,sp)
2073  0444 1e16          	ldw	x,(OFST+1,sp)
2074  0446 e703          	ld	(3,x),a
2075                     ; 454   SD_csd->NSAC = CSD_Tab[2];
2077  0448 7b08          	ld	a,(OFST-13,sp)
2078  044a 1e16          	ldw	x,(OFST+1,sp)
2079  044c e704          	ld	(4,x),a
2080                     ; 457   SD_csd->MaxBusClkFrec = CSD_Tab[3];
2082  044e 7b09          	ld	a,(OFST-12,sp)
2083  0450 1e16          	ldw	x,(OFST+1,sp)
2084  0452 e705          	ld	(5,x),a
2085                     ; 460   SD_csd->CardComdClasses = CSD_Tab[4] << 4;
2087  0454 7b0a          	ld	a,(OFST-11,sp)
2088  0456 97            	ld	xl,a
2089  0457 a610          	ld	a,#16
2090  0459 42            	mul	x,a
2091  045a 1616          	ldw	y,(OFST+1,sp)
2092  045c 90ef06        	ldw	(6,y),x
2093                     ; 463   SD_csd->CardComdClasses |= (CSD_Tab[5] & 0xF0) >> 4;
2095  045f 1e16          	ldw	x,(OFST+1,sp)
2096  0461 7b0b          	ld	a,(OFST-10,sp)
2097  0463 4e            	swap	a
2098  0464 a40f          	and	a,#15
2099  0466 905f          	clrw	y
2100  0468 9097          	ld	yl,a
2101  046a 9001          	rrwa	y,a
2102  046c ea07          	or	a,(7,x)
2103  046e 9001          	rrwa	y,a
2104  0470 ea06          	or	a,(6,x)
2105  0472 9001          	rrwa	y,a
2106  0474 ef06          	ldw	(6,x),y
2107                     ; 464   SD_csd->RdBlockLen = (uint8_t)(CSD_Tab[5] & 0x0F);
2109  0476 7b0b          	ld	a,(OFST-10,sp)
2110  0478 a40f          	and	a,#15
2111  047a 1e16          	ldw	x,(OFST+1,sp)
2112  047c e708          	ld	(8,x),a
2113                     ; 467   SD_csd->PartBlockRead = (uint8_t)((CSD_Tab[6] & 0x80) >> 7);
2115  047e 7b0c          	ld	a,(OFST-9,sp)
2116  0480 49            	rlc	a
2117  0481 4f            	clr	a
2118  0482 49            	rlc	a
2119  0483 1e16          	ldw	x,(OFST+1,sp)
2120  0485 e709          	ld	(9,x),a
2121                     ; 468   SD_csd->WrBlockMisalign = (uint8_t)((CSD_Tab[6] & 0x40) >> 6);
2123  0487 7b0c          	ld	a,(OFST-9,sp)
2124  0489 4e            	swap	a
2125  048a 44            	srl	a
2126  048b 44            	srl	a
2127  048c a403          	and	a,#3
2128  048e a401          	and	a,#1
2129  0490 1e16          	ldw	x,(OFST+1,sp)
2130  0492 e70a          	ld	(10,x),a
2131                     ; 469   SD_csd->RdBlockMisalign = (uint8_t)((CSD_Tab[6] & 0x20) >> 5);
2133  0494 7b0c          	ld	a,(OFST-9,sp)
2134  0496 4e            	swap	a
2135  0497 44            	srl	a
2136  0498 a407          	and	a,#7
2137  049a a401          	and	a,#1
2138  049c 1e16          	ldw	x,(OFST+1,sp)
2139  049e e70b          	ld	(11,x),a
2140                     ; 470   SD_csd->DSRImpl = (uint8_t)((CSD_Tab[6] & 0x10) >> 4);
2142  04a0 7b0c          	ld	a,(OFST-9,sp)
2143  04a2 4e            	swap	a
2144  04a3 a40f          	and	a,#15
2145  04a5 a401          	and	a,#1
2146  04a7 1e16          	ldw	x,(OFST+1,sp)
2147  04a9 e70c          	ld	(12,x),a
2148                     ; 471   SD_csd->Reserved2 = 0; /*!< Reserved */
2150  04ab 1e16          	ldw	x,(OFST+1,sp)
2151  04ad 6f0d          	clr	(13,x)
2152                     ; 473   SD_csd->DeviceSize = (CSD_Tab[6] & 0x03) << 10;
2154  04af 7b0c          	ld	a,(OFST-9,sp)
2155  04b1 a403          	and	a,#3
2156  04b3 5f            	clrw	x
2157  04b4 97            	ld	xl,a
2158  04b5 4f            	clr	a
2159  04b6 02            	rlwa	x,a
2160  04b7 58            	sllw	x
2161  04b8 58            	sllw	x
2162  04b9 cd0000        	call	c_itolx
2164  04bc 1e16          	ldw	x,(OFST+1,sp)
2165  04be 1c000e        	addw	x,#14
2166  04c1 cd0000        	call	c_rtol
2168                     ; 476   SD_csd->DeviceSize |= (CSD_Tab[7]) << 2;
2170  04c4 1e16          	ldw	x,(OFST+1,sp)
2171  04c6 7b0d          	ld	a,(OFST-8,sp)
2172  04c8 905f          	clrw	y
2173  04ca 9097          	ld	yl,a
2174  04cc 9058          	sllw	y
2175  04ce 9058          	sllw	y
2176  04d0 cd0000        	call	c_itoly
2178  04d3 1c000e        	addw	x,#14
2179  04d6 cd0000        	call	c_lgor
2181                     ; 479   SD_csd->DeviceSize |= (CSD_Tab[8] & 0xC0) >> 6;
2183  04d9 7b0e          	ld	a,(OFST-7,sp)
2184  04db 4e            	swap	a
2185  04dc 44            	srl	a
2186  04dd 44            	srl	a
2187  04de a403          	and	a,#3
2188  04e0 5f            	clrw	x
2189  04e1 cd0000        	call	c_itol
2191  04e4 1e16          	ldw	x,(OFST+1,sp)
2192  04e6 1c000e        	addw	x,#14
2193  04e9 cd0000        	call	c_lgor
2195                     ; 481   SD_csd->MaxRdCurrentVDDMin = (uint8_t)((CSD_Tab[8] & 0x38) >> 3);
2197  04ec 7b0e          	ld	a,(OFST-7,sp)
2198  04ee 44            	srl	a
2199  04ef 44            	srl	a
2200  04f0 44            	srl	a
2201  04f1 a407          	and	a,#7
2202  04f3 1e16          	ldw	x,(OFST+1,sp)
2203  04f5 e712          	ld	(18,x),a
2204                     ; 482   SD_csd->MaxRdCurrentVDDMax = (uint8_t)((CSD_Tab[8] & 0x07));
2206  04f7 7b0e          	ld	a,(OFST-7,sp)
2207  04f9 a407          	and	a,#7
2208  04fb 1e16          	ldw	x,(OFST+1,sp)
2209  04fd e713          	ld	(19,x),a
2210                     ; 485   SD_csd->MaxWrCurrentVDDMin = (uint8_t)((CSD_Tab[9] & 0xE0) >> 5);
2212  04ff 7b0f          	ld	a,(OFST-6,sp)
2213  0501 4e            	swap	a
2214  0502 44            	srl	a
2215  0503 a407          	and	a,#7
2216  0505 1e16          	ldw	x,(OFST+1,sp)
2217  0507 e714          	ld	(20,x),a
2218                     ; 486   SD_csd->MaxWrCurrentVDDMax = (uint8_t)((CSD_Tab[9] & 0x1C) >> 2);
2220  0509 7b0f          	ld	a,(OFST-6,sp)
2221  050b 44            	srl	a
2222  050c 44            	srl	a
2223  050d a407          	and	a,#7
2224  050f 1e16          	ldw	x,(OFST+1,sp)
2225  0511 e715          	ld	(21,x),a
2226                     ; 487   SD_csd->DeviceSizeMul = (uint8_t)((CSD_Tab[9] & 0x03) << 1);
2228  0513 7b0f          	ld	a,(OFST-6,sp)
2229  0515 a403          	and	a,#3
2230  0517 48            	sll	a
2231  0518 1e16          	ldw	x,(OFST+1,sp)
2232  051a e716          	ld	(22,x),a
2233                     ; 489   SD_csd->DeviceSizeMul |= (uint8_t)((CSD_Tab[10] & 0x80) >> 7);
2235  051c 1e16          	ldw	x,(OFST+1,sp)
2236  051e 7b10          	ld	a,(OFST-5,sp)
2237  0520 49            	rlc	a
2238  0521 4f            	clr	a
2239  0522 49            	rlc	a
2240  0523 ea16          	or	a,(22,x)
2241  0525 e716          	ld	(22,x),a
2242                     ; 491   SD_csd->EraseGrSize = (uint8_t)((CSD_Tab[10] & 0x40) >> 6);
2244  0527 7b10          	ld	a,(OFST-5,sp)
2245  0529 4e            	swap	a
2246  052a 44            	srl	a
2247  052b 44            	srl	a
2248  052c a403          	and	a,#3
2249  052e a401          	and	a,#1
2250  0530 1e16          	ldw	x,(OFST+1,sp)
2251  0532 e717          	ld	(23,x),a
2252                     ; 492   SD_csd->EraseGrMul = (uint8_t)((CSD_Tab[10] & 0x3F) << 1);
2254  0534 7b10          	ld	a,(OFST-5,sp)
2255  0536 a43f          	and	a,#63
2256  0538 48            	sll	a
2257  0539 1e16          	ldw	x,(OFST+1,sp)
2258  053b e718          	ld	(24,x),a
2259                     ; 495   SD_csd->EraseGrMul |= (uint8_t)((CSD_Tab[11] & 0x80) >> 7);
2261  053d 1e16          	ldw	x,(OFST+1,sp)
2262  053f 7b11          	ld	a,(OFST-4,sp)
2263  0541 49            	rlc	a
2264  0542 4f            	clr	a
2265  0543 49            	rlc	a
2266  0544 ea18          	or	a,(24,x)
2267  0546 e718          	ld	(24,x),a
2268                     ; 496   SD_csd->WrProtectGrSize = (uint8_t)((CSD_Tab[11] & 0x7F));
2270  0548 7b11          	ld	a,(OFST-4,sp)
2271  054a a47f          	and	a,#127
2272  054c 1e16          	ldw	x,(OFST+1,sp)
2273  054e e719          	ld	(25,x),a
2274                     ; 499   SD_csd->WrProtectGrEnable = (uint8_t)((CSD_Tab[12] & 0x80) >> 7);
2276  0550 7b12          	ld	a,(OFST-3,sp)
2277  0552 49            	rlc	a
2278  0553 4f            	clr	a
2279  0554 49            	rlc	a
2280  0555 1e16          	ldw	x,(OFST+1,sp)
2281  0557 e71a          	ld	(26,x),a
2282                     ; 500   SD_csd->ManDeflECC = (uint8_t)((CSD_Tab[12] & 0x60) >> 5);
2284  0559 7b12          	ld	a,(OFST-3,sp)
2285  055b 4e            	swap	a
2286  055c 44            	srl	a
2287  055d a407          	and	a,#7
2288  055f a403          	and	a,#3
2289  0561 1e16          	ldw	x,(OFST+1,sp)
2290  0563 e71b          	ld	(27,x),a
2291                     ; 501   SD_csd->WrSpeedFact = (uint8_t)((CSD_Tab[12] & 0x1C) >> 2);
2293  0565 7b12          	ld	a,(OFST-3,sp)
2294  0567 44            	srl	a
2295  0568 44            	srl	a
2296  0569 a407          	and	a,#7
2297  056b 1e16          	ldw	x,(OFST+1,sp)
2298  056d e71c          	ld	(28,x),a
2299                     ; 502   SD_csd->MaxWrBlockLen = (uint8_t)((CSD_Tab[12] & 0x03) << 2);
2301  056f 7b12          	ld	a,(OFST-3,sp)
2302  0571 a403          	and	a,#3
2303  0573 48            	sll	a
2304  0574 48            	sll	a
2305  0575 1e16          	ldw	x,(OFST+1,sp)
2306  0577 e71d          	ld	(29,x),a
2307                     ; 505   SD_csd->MaxWrBlockLen |= (uint8_t)((CSD_Tab[13] & 0xC0) >> 6);
2309  0579 1e16          	ldw	x,(OFST+1,sp)
2310  057b 7b13          	ld	a,(OFST-2,sp)
2311  057d 4e            	swap	a
2312  057e 44            	srl	a
2313  057f 44            	srl	a
2314  0580 a403          	and	a,#3
2315  0582 ea1d          	or	a,(29,x)
2316  0584 e71d          	ld	(29,x),a
2317                     ; 506   SD_csd->WriteBlockPaPartial = (uint8_t)((CSD_Tab[13] & 0x20) >> 5);
2319  0586 7b13          	ld	a,(OFST-2,sp)
2320  0588 4e            	swap	a
2321  0589 44            	srl	a
2322  058a a407          	and	a,#7
2323  058c a401          	and	a,#1
2324  058e 1e16          	ldw	x,(OFST+1,sp)
2325  0590 e71e          	ld	(30,x),a
2326                     ; 507   SD_csd->Reserved3 = 0;
2328  0592 1e16          	ldw	x,(OFST+1,sp)
2329  0594 6f1f          	clr	(31,x)
2330                     ; 508   SD_csd->ContentProtectAppli = (uint8_t)(CSD_Tab[13] & 0x01);
2332  0596 7b13          	ld	a,(OFST-2,sp)
2333  0598 a401          	and	a,#1
2334  059a 1e16          	ldw	x,(OFST+1,sp)
2335  059c e720          	ld	(32,x),a
2336                     ; 511   SD_csd->FileFormatGrouop = (uint8_t)((CSD_Tab[14] & 0x80) >> 7);
2338  059e 7b14          	ld	a,(OFST-1,sp)
2339  05a0 49            	rlc	a
2340  05a1 4f            	clr	a
2341  05a2 49            	rlc	a
2342  05a3 1e16          	ldw	x,(OFST+1,sp)
2343  05a5 e721          	ld	(33,x),a
2344                     ; 512   SD_csd->CopyFlag = (uint8_t)((CSD_Tab[14] & 0x40) >> 6);
2346  05a7 7b14          	ld	a,(OFST-1,sp)
2347  05a9 4e            	swap	a
2348  05aa 44            	srl	a
2349  05ab 44            	srl	a
2350  05ac a403          	and	a,#3
2351  05ae a401          	and	a,#1
2352  05b0 1e16          	ldw	x,(OFST+1,sp)
2353  05b2 e722          	ld	(34,x),a
2354                     ; 513   SD_csd->PermWrProtect = (uint8_t)((CSD_Tab[14] & 0x20) >> 5);
2356  05b4 7b14          	ld	a,(OFST-1,sp)
2357  05b6 4e            	swap	a
2358  05b7 44            	srl	a
2359  05b8 a407          	and	a,#7
2360  05ba a401          	and	a,#1
2361  05bc 1e16          	ldw	x,(OFST+1,sp)
2362  05be e723          	ld	(35,x),a
2363                     ; 514   SD_csd->TempWrProtect = (uint8_t)((CSD_Tab[14] & 0x10) >> 4);
2365  05c0 7b14          	ld	a,(OFST-1,sp)
2366  05c2 4e            	swap	a
2367  05c3 a40f          	and	a,#15
2368  05c5 a401          	and	a,#1
2369  05c7 1e16          	ldw	x,(OFST+1,sp)
2370  05c9 e724          	ld	(36,x),a
2371                     ; 515   SD_csd->FileFormat = (uint8_t)((CSD_Tab[14] & 0x0C) >> 2);
2373  05cb 7b14          	ld	a,(OFST-1,sp)
2374  05cd 44            	srl	a
2375  05ce 44            	srl	a
2376  05cf a403          	and	a,#3
2377  05d1 1e16          	ldw	x,(OFST+1,sp)
2378  05d3 e725          	ld	(37,x),a
2379                     ; 516   SD_csd->ECC = (uint8_t)(CSD_Tab[14] & 0x03);
2381  05d5 7b14          	ld	a,(OFST-1,sp)
2382  05d7 a403          	and	a,#3
2383  05d9 1e16          	ldw	x,(OFST+1,sp)
2384  05db e726          	ld	(38,x),a
2385                     ; 519   SD_csd->CSD_CRC = (uint8_t)((CSD_Tab[15] & 0xFE) >> 1);
2387  05dd 7b15          	ld	a,(OFST+0,sp)
2388  05df 44            	srl	a
2389  05e0 1e16          	ldw	x,(OFST+1,sp)
2390  05e2 e727          	ld	(39,x),a
2391                     ; 520   SD_csd->Reserved4 = 1;
2393  05e4 1e16          	ldw	x,(OFST+1,sp)
2394  05e6 a601          	ld	a,#1
2395  05e8 e728          	ld	(40,x),a
2396                     ; 523   return rvalue;
2398  05ea 7b01          	ld	a,(OFST-20,sp)
2401  05ec 5b17          	addw	sp,#23
2402  05ee 81            	ret
2473                     ; 535 uint8_t SD_GetCIDRegister(SD_CID* SD_cid)
2473                     ; 536 {
2474                     	switch	.text
2475  05ef               _SD_GetCIDRegister:
2477  05ef 89            	pushw	x
2478  05f0 5215          	subw	sp,#21
2479       00000015      OFST:	set	21
2482                     ; 537   uint32_t i = 0;
2484                     ; 538   uint8_t rvalue = SD_RESPONSE_FAILURE;
2486  05f2 a6ff          	ld	a,#255
2487  05f4 6b01          	ld	(OFST-20,sp),a
2489                     ; 542   SD_CS_LOW();
2491  05f6 4b20          	push	#32
2492  05f8 ae5014        	ldw	x,#20500
2493  05fb cd0000        	call	_GPIO_WriteLow
2495  05fe 84            	pop	a
2496                     ; 545   SD_SendCmd(SD_CMD_SEND_CID, 0, 0xFF);
2498  05ff 4bff          	push	#255
2499  0601 ae0000        	ldw	x,#0
2500  0604 89            	pushw	x
2501  0605 ae0000        	ldw	x,#0
2502  0608 89            	pushw	x
2503  0609 a60a          	ld	a,#10
2504  060b cd077c        	call	_SD_SendCmd
2506  060e 5b05          	addw	sp,#5
2507                     ; 548   if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
2509  0610 4f            	clr	a
2510  0611 cd082d        	call	_SD_GetResponse
2512  0614 4d            	tnz	a
2513  0615 2641          	jrne	L3501
2514                     ; 550     if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
2516  0617 a6fe          	ld	a,#254
2517  0619 cd082d        	call	_SD_GetResponse
2519  061c 4d            	tnz	a
2520  061d 262d          	jrne	L5501
2521                     ; 553       for (i = 0; i < 16; i++)
2523  061f ae0000        	ldw	x,#0
2524  0622 1f04          	ldw	(OFST-17,sp),x
2525  0624 ae0000        	ldw	x,#0
2526  0627 1f02          	ldw	(OFST-19,sp),x
2528  0629               L7501:
2529                     ; 555         CID_Tab[i] = SD_ReadByte();
2531  0629 cd0927        	call	_SD_ReadByte
2533  062c 96            	ldw	x,sp
2534  062d 1c0006        	addw	x,#OFST-15
2535  0630 72fb04        	addw	x,(OFST-17,sp)
2536  0633 f7            	ld	(x),a
2537                     ; 553       for (i = 0; i < 16; i++)
2539  0634 96            	ldw	x,sp
2540  0635 1c0002        	addw	x,#OFST-19
2541  0638 a601          	ld	a,#1
2542  063a cd0000        	call	c_lgadc
2547  063d 96            	ldw	x,sp
2548  063e 1c0002        	addw	x,#OFST-19
2549  0641 cd0000        	call	c_ltor
2551  0644 ae0008        	ldw	x,#L25
2552  0647 cd0000        	call	c_lcmp
2554  064a 25dd          	jrult	L7501
2555  064c               L5501:
2556                     ; 559     SD_WriteByte(SD_DUMMY_BYTE);
2558  064c a6ff          	ld	a,#255
2559  064e cd090b        	call	_SD_WriteByte
2561                     ; 560     SD_WriteByte(SD_DUMMY_BYTE);
2563  0651 a6ff          	ld	a,#255
2564  0653 cd090b        	call	_SD_WriteByte
2566                     ; 562     rvalue = SD_RESPONSE_NO_ERROR;
2568  0656 0f01          	clr	(OFST-20,sp)
2570  0658               L3501:
2571                     ; 565   SD_CS_HIGH();
2573  0658 4b20          	push	#32
2574  065a ae5014        	ldw	x,#20500
2575  065d cd0000        	call	_GPIO_WriteHigh
2577  0660 84            	pop	a
2578                     ; 567   SD_WriteByte(SD_DUMMY_BYTE);
2580  0661 a6ff          	ld	a,#255
2581  0663 cd090b        	call	_SD_WriteByte
2583                     ; 570   SD_cid->ManufacturerID = CID_Tab[0];
2585  0666 7b06          	ld	a,(OFST-15,sp)
2586  0668 1e16          	ldw	x,(OFST+1,sp)
2587  066a f7            	ld	(x),a
2588                     ; 573   SD_cid->OEM_AppliID = CID_Tab[1] << 8;
2590  066b 7b07          	ld	a,(OFST-14,sp)
2591  066d 5f            	clrw	x
2592  066e 97            	ld	xl,a
2593  066f 4f            	clr	a
2594  0670 02            	rlwa	x,a
2595  0671 1616          	ldw	y,(OFST+1,sp)
2596  0673 90ef01        	ldw	(1,y),x
2597                     ; 576   SD_cid->OEM_AppliID |= CID_Tab[2];
2599  0676 1e16          	ldw	x,(OFST+1,sp)
2600  0678 7b08          	ld	a,(OFST-13,sp)
2601  067a 905f          	clrw	y
2602  067c 9097          	ld	yl,a
2603  067e 9001          	rrwa	y,a
2604  0680 ea02          	or	a,(2,x)
2605  0682 9001          	rrwa	y,a
2606  0684 ea01          	or	a,(1,x)
2607  0686 9001          	rrwa	y,a
2608  0688 ef01          	ldw	(1,x),y
2609                     ; 579   SD_cid->ProdName1 = ((uint32_t)CID_Tab[3] << 24);
2611  068a 7b09          	ld	a,(OFST-12,sp)
2612  068c b703          	ld	c_lreg+3,a
2613  068e 3f02          	clr	c_lreg+2
2614  0690 3f01          	clr	c_lreg+1
2615  0692 3f00          	clr	c_lreg
2616  0694 a618          	ld	a,#24
2617  0696 cd0000        	call	c_llsh
2619  0699 1e16          	ldw	x,(OFST+1,sp)
2620  069b 1c0003        	addw	x,#3
2621  069e cd0000        	call	c_rtol
2623                     ; 582   SD_cid->ProdName1 |= ((uint32_t)CID_Tab[4] << 16);
2625  06a1 1e16          	ldw	x,(OFST+1,sp)
2626  06a3 7b0a          	ld	a,(OFST-11,sp)
2627  06a5 b703          	ld	c_lreg+3,a
2628  06a7 3f02          	clr	c_lreg+2
2629  06a9 3f01          	clr	c_lreg+1
2630  06ab 3f00          	clr	c_lreg
2631  06ad a610          	ld	a,#16
2632  06af cd0000        	call	c_llsh
2634  06b2 1c0003        	addw	x,#3
2635  06b5 cd0000        	call	c_lgor
2637                     ; 585   SD_cid->ProdName1 |= CID_Tab[5] << 8;
2639  06b8 1e16          	ldw	x,(OFST+1,sp)
2640  06ba 7b0b          	ld	a,(OFST-10,sp)
2641  06bc 905f          	clrw	y
2642  06be 9097          	ld	yl,a
2643  06c0 4f            	clr	a
2644  06c1 9002          	rlwa	y,a
2645  06c3 cd0000        	call	c_itoly
2647  06c6 1c0003        	addw	x,#3
2648  06c9 cd0000        	call	c_lgor
2650                     ; 588   SD_cid->ProdName1 |= CID_Tab[6];
2652  06cc 1e16          	ldw	x,(OFST+1,sp)
2653  06ce 7b0c          	ld	a,(OFST-9,sp)
2654  06d0 b703          	ld	c_lreg+3,a
2655  06d2 3f02          	clr	c_lreg+2
2656  06d4 3f01          	clr	c_lreg+1
2657  06d6 3f00          	clr	c_lreg
2658  06d8 1c0003        	addw	x,#3
2659  06db cd0000        	call	c_lgor
2661                     ; 591   SD_cid->ProdName2 = CID_Tab[7];
2663  06de 7b0d          	ld	a,(OFST-8,sp)
2664  06e0 1e16          	ldw	x,(OFST+1,sp)
2665  06e2 e707          	ld	(7,x),a
2666                     ; 594   SD_cid->ProdRev = CID_Tab[8];
2668  06e4 7b0e          	ld	a,(OFST-7,sp)
2669  06e6 1e16          	ldw	x,(OFST+1,sp)
2670  06e8 e708          	ld	(8,x),a
2671                     ; 597   SD_cid->ProdSN = ((uint32_t)CID_Tab[9] << 24);
2673  06ea 7b0f          	ld	a,(OFST-6,sp)
2674  06ec b703          	ld	c_lreg+3,a
2675  06ee 3f02          	clr	c_lreg+2
2676  06f0 3f01          	clr	c_lreg+1
2677  06f2 3f00          	clr	c_lreg
2678  06f4 a618          	ld	a,#24
2679  06f6 cd0000        	call	c_llsh
2681  06f9 1e16          	ldw	x,(OFST+1,sp)
2682  06fb 1c0009        	addw	x,#9
2683  06fe cd0000        	call	c_rtol
2685                     ; 600   SD_cid->ProdSN |= ((uint32_t)CID_Tab[10] << 16);
2687  0701 1e16          	ldw	x,(OFST+1,sp)
2688  0703 7b10          	ld	a,(OFST-5,sp)
2689  0705 b703          	ld	c_lreg+3,a
2690  0707 3f02          	clr	c_lreg+2
2691  0709 3f01          	clr	c_lreg+1
2692  070b 3f00          	clr	c_lreg
2693  070d a610          	ld	a,#16
2694  070f cd0000        	call	c_llsh
2696  0712 1c0009        	addw	x,#9
2697  0715 cd0000        	call	c_lgor
2699                     ; 603   SD_cid->ProdSN |= CID_Tab[11] << 8;
2701  0718 1e16          	ldw	x,(OFST+1,sp)
2702  071a 7b11          	ld	a,(OFST-4,sp)
2703  071c 905f          	clrw	y
2704  071e 9097          	ld	yl,a
2705  0720 4f            	clr	a
2706  0721 9002          	rlwa	y,a
2707  0723 cd0000        	call	c_itoly
2709  0726 1c0009        	addw	x,#9
2710  0729 cd0000        	call	c_lgor
2712                     ; 606   SD_cid->ProdSN |= CID_Tab[12];
2714  072c 1e16          	ldw	x,(OFST+1,sp)
2715  072e 7b12          	ld	a,(OFST-3,sp)
2716  0730 b703          	ld	c_lreg+3,a
2717  0732 3f02          	clr	c_lreg+2
2718  0734 3f01          	clr	c_lreg+1
2719  0736 3f00          	clr	c_lreg
2720  0738 1c0009        	addw	x,#9
2721  073b cd0000        	call	c_lgor
2723                     ; 609   SD_cid->Reserved1 |= (uint8_t)((CID_Tab[13] & 0xF0) >> 4);
2725  073e 1e16          	ldw	x,(OFST+1,sp)
2726  0740 7b13          	ld	a,(OFST-2,sp)
2727  0742 4e            	swap	a
2728  0743 a40f          	and	a,#15
2729  0745 ea0d          	or	a,(13,x)
2730  0747 e70d          	ld	(13,x),a
2731                     ; 610   SD_cid->ManufactDate = (CID_Tab[13] & 0x0F) << 8;
2733  0749 7b13          	ld	a,(OFST-2,sp)
2734  074b a40f          	and	a,#15
2735  074d 5f            	clrw	x
2736  074e 97            	ld	xl,a
2737  074f 4f            	clr	a
2738  0750 02            	rlwa	x,a
2739  0751 1616          	ldw	y,(OFST+1,sp)
2740  0753 90ef0e        	ldw	(14,y),x
2741                     ; 613   SD_cid->ManufactDate |= CID_Tab[14];
2743  0756 1e16          	ldw	x,(OFST+1,sp)
2744  0758 7b14          	ld	a,(OFST-1,sp)
2745  075a 905f          	clrw	y
2746  075c 9097          	ld	yl,a
2747  075e 9001          	rrwa	y,a
2748  0760 ea0f          	or	a,(15,x)
2749  0762 9001          	rrwa	y,a
2750  0764 ea0e          	or	a,(14,x)
2751  0766 9001          	rrwa	y,a
2752  0768 ef0e          	ldw	(14,x),y
2753                     ; 616   SD_cid->CID_CRC = (uint8_t)((CID_Tab[15] & 0xFE) >> 1);
2755  076a 7b15          	ld	a,(OFST+0,sp)
2756  076c 44            	srl	a
2757  076d 1e16          	ldw	x,(OFST+1,sp)
2758  076f e710          	ld	(16,x),a
2759                     ; 617   SD_cid->Reserved2 = 1;
2761  0771 1e16          	ldw	x,(OFST+1,sp)
2762  0773 a601          	ld	a,#1
2763  0775 e711          	ld	(17,x),a
2764                     ; 620   return rvalue;
2766  0777 7b01          	ld	a,(OFST-20,sp)
2769  0779 5b17          	addw	sp,#23
2770  077b 81            	ret
2842                     	switch	.const
2843  000c               L06:
2844  000c 00000006      	dc.l	6
2845                     ; 630 void SD_SendCmd(uint8_t Cmd, uint32_t Arg, uint8_t Crc)
2845                     ; 631 {
2846                     	switch	.text
2847  077c               _SD_SendCmd:
2849  077c 88            	push	a
2850  077d 520a          	subw	sp,#10
2851       0000000a      OFST:	set	10
2854                     ; 632   uint32_t i = 0x00;
2856                     ; 636   Frame[0] = (uint8_t)(Cmd | 0x40); /*!< Construct byte 1 */
2858  077f aa40          	or	a,#64
2859  0781 6b01          	ld	(OFST-9,sp),a
2861                     ; 638   Frame[1] = (uint8_t)(Arg >> 24); /*!< Construct byte 2 */
2863  0783 7b0e          	ld	a,(OFST+4,sp)
2864  0785 6b02          	ld	(OFST-8,sp),a
2866                     ; 640   Frame[2] = (uint8_t)(Arg >> 16); /*!< Construct byte 3 */
2868  0787 7b0f          	ld	a,(OFST+5,sp)
2869  0789 6b03          	ld	(OFST-7,sp),a
2871                     ; 642   Frame[3] = (uint8_t)(Arg >> 8); /*!< Construct byte 4 */
2873  078b 7b10          	ld	a,(OFST+6,sp)
2874  078d 6b04          	ld	(OFST-6,sp),a
2876                     ; 644   Frame[4] = (uint8_t)(Arg); /*!< Construct byte 5 */
2878  078f 7b11          	ld	a,(OFST+7,sp)
2879  0791 6b05          	ld	(OFST-5,sp),a
2881                     ; 646   Frame[5] = (Crc); /*!< Construct CRC: byte 6 */
2883  0793 7b12          	ld	a,(OFST+8,sp)
2884  0795 6b06          	ld	(OFST-4,sp),a
2886                     ; 648   for (i = 0; i < 6; i++)
2888  0797 ae0000        	ldw	x,#0
2889  079a 1f09          	ldw	(OFST-1,sp),x
2890  079c ae0000        	ldw	x,#0
2891  079f 1f07          	ldw	(OFST-3,sp),x
2893  07a1               L3211:
2894                     ; 650     SD_WriteByte(Frame[i]); /*!< Send the Cmd bytes */
2896  07a1 96            	ldw	x,sp
2897  07a2 1c0001        	addw	x,#OFST-9
2898  07a5 72fb09        	addw	x,(OFST-1,sp)
2899  07a8 f6            	ld	a,(x)
2900  07a9 cd090b        	call	_SD_WriteByte
2902                     ; 648   for (i = 0; i < 6; i++)
2904  07ac 96            	ldw	x,sp
2905  07ad 1c0007        	addw	x,#OFST-3
2906  07b0 a601          	ld	a,#1
2907  07b2 cd0000        	call	c_lgadc
2912  07b5 96            	ldw	x,sp
2913  07b6 1c0007        	addw	x,#OFST-3
2914  07b9 cd0000        	call	c_ltor
2916  07bc ae000c        	ldw	x,#L06
2917  07bf cd0000        	call	c_lcmp
2919  07c2 25dd          	jrult	L3211
2920                     ; 652 }
2923  07c4 5b0b          	addw	sp,#11
2924  07c6 81            	ret
2977                     	switch	.const
2978  0010               L46:
2979  0010 00000041      	dc.l	65
2980                     ; 663 uint8_t SD_GetDataResponse(void)
2980                     ; 664 {
2981                     	switch	.text
2982  07c7               _SD_GetDataResponse:
2984  07c7 5206          	subw	sp,#6
2985       00000006      OFST:	set	6
2988                     ; 665   uint32_t i = 0;
2990  07c9 ae0000        	ldw	x,#0
2991  07cc 1f03          	ldw	(OFST-3,sp),x
2992  07ce ae0000        	ldw	x,#0
2993  07d1 1f01          	ldw	(OFST-5,sp),x
2995                     ; 666   uint8_t response = 0, rvalue = 0;
2997  07d3 0f06          	clr	(OFST+0,sp)
3002  07d5 203d          	jra	L1711
3003  07d7               L7611:
3004                     ; 671     response = SD_ReadByte();
3006  07d7 cd0927        	call	_SD_ReadByte
3008  07da 6b06          	ld	(OFST+0,sp),a
3010                     ; 673     response &= 0x1F;
3012  07dc 7b06          	ld	a,(OFST+0,sp)
3013  07de a41f          	and	a,#31
3014  07e0 6b06          	ld	(OFST+0,sp),a
3016                     ; 674     switch (response)
3018  07e2 7b06          	ld	a,(OFST+0,sp)
3020                     ; 688         break;
3021  07e4 a005          	sub	a,#5
3022  07e6 270e          	jreq	L1311
3023  07e8 a006          	sub	a,#6
3024  07ea 2710          	jreq	L3311
3025  07ec a002          	sub	a,#2
3026  07ee 2710          	jreq	L5311
3027  07f0               L7311:
3028                     ; 687         rvalue = SD_DATA_OTHER_ERROR;
3030  07f0 a6ff          	ld	a,#255
3031  07f2 6b05          	ld	(OFST-1,sp),a
3033                     ; 688         break;
3035  07f4 200f          	jra	L7711
3036  07f6               L1311:
3037                     ; 678         rvalue = SD_DATA_OK;
3039  07f6 a605          	ld	a,#5
3040  07f8 6b05          	ld	(OFST-1,sp),a
3042                     ; 679         break;
3044  07fa 2009          	jra	L7711
3045  07fc               L3311:
3046                     ; 681       case SD_DATA_CRC_ERROR:
3046                     ; 682         return SD_DATA_CRC_ERROR;
3048  07fc a60b          	ld	a,#11
3050  07fe 2002          	jra	L66
3051  0800               L5311:
3052                     ; 683       case SD_DATA_WRITE_ERROR:
3052                     ; 684         return SD_DATA_WRITE_ERROR;
3054  0800 a60d          	ld	a,#13
3056  0802               L66:
3058  0802 5b06          	addw	sp,#6
3059  0804 81            	ret
3060  0805               L7711:
3061                     ; 692     if (rvalue == SD_DATA_OK)
3063  0805 7b05          	ld	a,(OFST-1,sp)
3064  0807 a105          	cp	a,#5
3065  0809 2718          	jreq	L5021
3066                     ; 693       break;
3068                     ; 695     i++;
3070  080b 96            	ldw	x,sp
3071  080c 1c0001        	addw	x,#OFST-5
3072  080f a601          	ld	a,#1
3073  0811 cd0000        	call	c_lgadc
3076  0814               L1711:
3077                     ; 668   while (i <= 64)
3079  0814 96            	ldw	x,sp
3080  0815 1c0001        	addw	x,#OFST-5
3081  0818 cd0000        	call	c_ltor
3083  081b ae0010        	ldw	x,#L46
3084  081e cd0000        	call	c_lcmp
3086  0821 25b4          	jrult	L7611
3087  0823               L5021:
3088                     ; 699   while (SD_ReadByte() == 0);
3090  0823 cd0927        	call	_SD_ReadByte
3092  0826 4d            	tnz	a
3093  0827 27fa          	jreq	L5021
3094                     ; 702   return response;
3096  0829 7b06          	ld	a,(OFST+0,sp)
3098  082b 20d5          	jra	L66
3142                     ; 712 uint8_t SD_GetResponse(uint8_t Response)
3142                     ; 713 {
3143                     	switch	.text
3144  082d               _SD_GetResponse:
3146  082d 88            	push	a
3147  082e 5204          	subw	sp,#4
3148       00000004      OFST:	set	4
3151                     ; 714   uint32_t Count = 0xFFF;
3153  0830 ae0fff        	ldw	x,#4095
3154  0833 1f03          	ldw	(OFST-1,sp),x
3155  0835 ae0000        	ldw	x,#0
3156  0838 1f01          	ldw	(OFST-3,sp),x
3159  083a 2009          	jra	L7321
3160  083c               L3321:
3161                     ; 719     Count--;
3163  083c 96            	ldw	x,sp
3164  083d 1c0001        	addw	x,#OFST-3
3165  0840 a601          	ld	a,#1
3166  0842 cd0000        	call	c_lgsbc
3169  0845               L7321:
3170                     ; 717   while ((SD_ReadByte() != Response) && Count)
3172  0845 cd0927        	call	_SD_ReadByte
3174  0848 1105          	cp	a,(OFST+1,sp)
3175  084a 2709          	jreq	L3421
3177  084c 96            	ldw	x,sp
3178  084d 1c0001        	addw	x,#OFST-3
3179  0850 cd0000        	call	c_lzmp
3181  0853 26e7          	jrne	L3321
3182  0855               L3421:
3183                     ; 721   if (Count == 0)
3185  0855 96            	ldw	x,sp
3186  0856 1c0001        	addw	x,#OFST-3
3187  0859 cd0000        	call	c_lzmp
3189  085c 2604          	jrne	L5421
3190                     ; 724     return SD_RESPONSE_FAILURE;
3192  085e a6ff          	ld	a,#255
3194  0860 2001          	jra	L27
3195  0862               L5421:
3196                     ; 729     return SD_RESPONSE_NO_ERROR;
3198  0862 4f            	clr	a
3200  0863               L27:
3202  0863 5b05          	addw	sp,#5
3203  0865 81            	ret
3242                     ; 738 uint16_t SD_GetStatus(void)
3242                     ; 739 {
3243                     	switch	.text
3244  0866               _SD_GetStatus:
3246  0866 89            	pushw	x
3247       00000002      OFST:	set	2
3250                     ; 740   uint16_t Status = 0;
3252                     ; 743   SD_CS_LOW();
3254  0867 4b20          	push	#32
3255  0869 ae5014        	ldw	x,#20500
3256  086c cd0000        	call	_GPIO_WriteLow
3258  086f 84            	pop	a
3259                     ; 746   SD_SendCmd(SD_CMD_SEND_STATUS, 0, 0xFF);
3261  0870 4bff          	push	#255
3262  0872 ae0000        	ldw	x,#0
3263  0875 89            	pushw	x
3264  0876 ae0000        	ldw	x,#0
3265  0879 89            	pushw	x
3266  087a a60d          	ld	a,#13
3267  087c cd077c        	call	_SD_SendCmd
3269  087f 5b05          	addw	sp,#5
3270                     ; 748   Status = SD_ReadByte();
3272  0881 cd0927        	call	_SD_ReadByte
3274  0884 5f            	clrw	x
3275  0885 97            	ld	xl,a
3276  0886 1f01          	ldw	(OFST-1,sp),x
3278                     ; 749   Status |= (uint16_t)(SD_ReadByte() << 8);
3280  0888 cd0927        	call	_SD_ReadByte
3282  088b 5f            	clrw	x
3283  088c 97            	ld	xl,a
3284  088d 4f            	clr	a
3285  088e 02            	rlwa	x,a
3286  088f 01            	rrwa	x,a
3287  0890 1a02          	or	a,(OFST+0,sp)
3288  0892 01            	rrwa	x,a
3289  0893 1a01          	or	a,(OFST-1,sp)
3290  0895 01            	rrwa	x,a
3291  0896 1f01          	ldw	(OFST-1,sp),x
3293                     ; 752   SD_CS_HIGH();
3295  0898 4b20          	push	#32
3296  089a ae5014        	ldw	x,#20500
3297  089d cd0000        	call	_GPIO_WriteHigh
3299  08a0 84            	pop	a
3300                     ; 755   SD_WriteByte(SD_DUMMY_BYTE);
3302  08a1 a6ff          	ld	a,#255
3303  08a3 ad66          	call	_SD_WriteByte
3305                     ; 757   return Status;
3307  08a5 1e01          	ldw	x,(OFST-1,sp)
3310  08a7 5b02          	addw	sp,#2
3311  08a9 81            	ret
3339                     ; 767 uint8_t SD_GoIdleState(void)
3339                     ; 768 {
3340                     	switch	.text
3341  08aa               _SD_GoIdleState:
3345                     ; 770   SD_CS_LOW();
3347  08aa 4b20          	push	#32
3348  08ac ae5014        	ldw	x,#20500
3349  08af cd0000        	call	_GPIO_WriteLow
3351  08b2 84            	pop	a
3352                     ; 773   SD_SendCmd(SD_CMD_GO_IDLE_STATE, 0, 0x95);
3354  08b3 4b95          	push	#149
3355  08b5 ae0000        	ldw	x,#0
3356  08b8 89            	pushw	x
3357  08b9 ae0000        	ldw	x,#0
3358  08bc 89            	pushw	x
3359  08bd 4f            	clr	a
3360  08be cd077c        	call	_SD_SendCmd
3362  08c1 5b05          	addw	sp,#5
3363                     ; 776   if (SD_GetResponse(SD_IN_IDLE_STATE))
3365  08c3 a601          	ld	a,#1
3366  08c5 cd082d        	call	_SD_GetResponse
3368  08c8 4d            	tnz	a
3369  08c9 2703          	jreq	L1031
3370                     ; 779     return SD_RESPONSE_FAILURE;
3372  08cb a6ff          	ld	a,#255
3375  08cd 81            	ret
3376  08ce               L1031:
3377                     ; 785     SD_CS_HIGH();
3379  08ce 4b20          	push	#32
3380  08d0 ae5014        	ldw	x,#20500
3381  08d3 cd0000        	call	_GPIO_WriteHigh
3383  08d6 84            	pop	a
3384                     ; 788     SD_WriteByte(SD_DUMMY_BYTE);
3386  08d7 a6ff          	ld	a,#255
3387  08d9 ad30          	call	_SD_WriteByte
3389                     ; 791     SD_CS_LOW();
3391  08db 4b20          	push	#32
3392  08dd ae5014        	ldw	x,#20500
3393  08e0 cd0000        	call	_GPIO_WriteLow
3395  08e3 84            	pop	a
3396                     ; 794     SD_SendCmd(SD_CMD_SEND_OP_COND, 0, 0xFF);
3398  08e4 4bff          	push	#255
3399  08e6 ae0000        	ldw	x,#0
3400  08e9 89            	pushw	x
3401  08ea ae0000        	ldw	x,#0
3402  08ed 89            	pushw	x
3403  08ee a601          	ld	a,#1
3404  08f0 cd077c        	call	_SD_SendCmd
3406  08f3 5b05          	addw	sp,#5
3407                     ; 797   while (SD_GetResponse(SD_RESPONSE_NO_ERROR));
3409  08f5 4f            	clr	a
3410  08f6 cd082d        	call	_SD_GetResponse
3412  08f9 4d            	tnz	a
3413  08fa 26d2          	jrne	L1031
3414                     ; 800   SD_CS_HIGH();
3416  08fc 4b20          	push	#32
3417  08fe ae5014        	ldw	x,#20500
3418  0901 cd0000        	call	_GPIO_WriteHigh
3420  0904 84            	pop	a
3421                     ; 803   SD_WriteByte(SD_DUMMY_BYTE);
3423  0905 a6ff          	ld	a,#255
3424  0907 ad02          	call	_SD_WriteByte
3426                     ; 805   return SD_RESPONSE_NO_ERROR;
3428  0909 4f            	clr	a
3431  090a 81            	ret
3468                     ; 813 uint8_t SD_WriteByte(uint8_t Data)
3468                     ; 814 {
3469                     	switch	.text
3470  090b               _SD_WriteByte:
3472  090b 88            	push	a
3473       00000000      OFST:	set	0
3476  090c               L7231:
3477                     ; 816   while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET)
3479  090c a602          	ld	a,#2
3480  090e cd0000        	call	_SPI_GetFlagStatus
3482  0911 4d            	tnz	a
3483  0912 27f8          	jreq	L7231
3484                     ; 820   SPI_SendData(Data);
3486  0914 7b01          	ld	a,(OFST+1,sp)
3487  0916 cd0000        	call	_SPI_SendData
3490  0919               L5331:
3491                     ; 823   while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET)
3493  0919 a601          	ld	a,#1
3494  091b cd0000        	call	_SPI_GetFlagStatus
3496  091e 4d            	tnz	a
3497  091f 27f8          	jreq	L5331
3498                     ; 827   return SPI_ReceiveData();
3500  0921 cd0000        	call	_SPI_ReceiveData
3504  0924 5b01          	addw	sp,#1
3505  0926 81            	ret
3542                     ; 835 uint8_t SD_ReadByte(void)
3542                     ; 836 {
3543                     	switch	.text
3544  0927               _SD_ReadByte:
3546  0927 88            	push	a
3547       00000001      OFST:	set	1
3550                     ; 837   uint8_t Data = 0;
3553  0928               L1631:
3554                     ; 840   while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET)
3556  0928 a602          	ld	a,#2
3557  092a cd0000        	call	_SPI_GetFlagStatus
3559  092d 4d            	tnz	a
3560  092e 27f8          	jreq	L1631
3561                     ; 843   SPI_SendData(SD_DUMMY_BYTE);
3563  0930 a6ff          	ld	a,#255
3564  0932 cd0000        	call	_SPI_SendData
3567  0935               L7631:
3568                     ; 846   while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET)
3570  0935 a601          	ld	a,#1
3571  0937 cd0000        	call	_SPI_GetFlagStatus
3573  093a 4d            	tnz	a
3574  093b 27f8          	jreq	L7631
3575                     ; 849   Data = SPI_ReceiveData();
3577  093d cd0000        	call	_SPI_ReceiveData
3579  0940 6b01          	ld	(OFST+0,sp),a
3581                     ; 852   return Data;
3583  0942 7b01          	ld	a,(OFST+0,sp)
3586  0944 5b01          	addw	sp,#1
3587  0946 81            	ret
3600                     	xdef	_SD_ReadByte
3601                     	xdef	_SD_WriteByte
3602                     	xdef	_SD_GetStatus
3603                     	xdef	_SD_GoIdleState
3604                     	xdef	_SD_GetDataResponse
3605                     	xdef	_SD_GetResponse
3606                     	xdef	_SD_SendCmd
3607                     	xdef	_SD_GetCIDRegister
3608                     	xdef	_SD_GetCSDRegister
3609                     	xdef	_SD_WriteBuffer
3610                     	xdef	_SD_WriteBlock
3611                     	xdef	_SD_ReadBuffer
3612                     	xdef	_SD_ReadBlock
3613                     	xdef	_SD_GetCardInfo
3614                     	xdef	_SD_Detect
3615                     	xdef	_SD_Init
3616                     	xdef	_SD_DeInit
3617                     	xref	_SD_LowLevel_Init
3618                     	xref	_SD_LowLevel_DeInit
3619                     	xref	_SPI_GetFlagStatus
3620                     	xref	_SPI_ReceiveData
3621                     	xref	_SPI_SendData
3622                     	xref	_GPIO_ReadInputData
3623                     	xref	_GPIO_WriteLow
3624                     	xref	_GPIO_WriteHigh
3625                     	xref.b	c_lreg
3626                     	xref.b	c_x
3645                     	xref	c_lzmp
3646                     	xref	c_llsh
3647                     	xref	c_itol
3648                     	xref	c_lgor
3649                     	xref	c_lrzmp
3650                     	xref	c_lgsbc
3651                     	xref	c_lgadd
3652                     	xref	c_ladd
3653                     	xref	c_lursh
3654                     	xref	c_uitolx
3655                     	xref	c_itolx
3656                     	xref	c_lgmul
3657                     	xref	c_itoly
3658                     	xref	c_rtol
3659                     	xref	c_ladc
3660                     	xref	c_lcmp
3661                     	xref	c_ltor
3662                     	xref	c_lgadc
3663                     	end
