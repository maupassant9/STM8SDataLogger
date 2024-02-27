                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.1.0 #12072 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _SetLedMode
                                     13 	.globl _LedMatrixInit
                                     14 	.globl _pf_write
                                     15 	.globl _dly
                                     16 	.globl _sysTickInit
                                     17 	.globl _loggerCfg
                                     18 	.globl _assert_failed
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area DATA
      000245                         23 _cfg:
      000245                         24 	.ds 13
      000252                         25 _loggerCfg::
      000252                         26 	.ds 15
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area INITIALIZED
      000263                         31 _blkCnt:
      000263                         32 	.ds 1
      000264                         33 _fileBlkCnt:
      000264                         34 	.ds 4
      000268                         35 _fileNoCnt:
      000268                         36 	.ds 2
                                     37 ;--------------------------------------------------------
                                     38 ; Stack segment in internal ram 
                                     39 ;--------------------------------------------------------
                                     40 	.area	SSEG
      009BE6                         41 __start__stack:
      009BE6                         42 	.ds	1
                                     43 
                                     44 ;--------------------------------------------------------
                                     45 ; absolute external ram data
                                     46 ;--------------------------------------------------------
                                     47 	.area DABS (ABS)
                                     48 
                                     49 ; default segment ordering for linker
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area CONST
                                     54 	.area INITIALIZER
                                     55 	.area CODE
                                     56 
                                     57 ;--------------------------------------------------------
                                     58 ; interrupt vector 
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
      008000                         61 __interrupt_vect:
      008000 82 00 80 6F             62 	int s_GSINIT ; reset
      008004 82 00 9A DB             63 	int _TRAP_IRQHandler ; trap
      008008 82 00 9A DC             64 	int _TLI_IRQHandler ; int0
      00800C 82 00 9A DD             65 	int _AWU_IRQHandler ; int1
      008010 82 00 9A DE             66 	int _CLK_IRQHandler ; int2
      008014 82 00 9A DF             67 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 9A E0             68 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 9A E1             69 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 9A E2             70 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 9A E3             71 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             72 	int 0x000000 ; int8
      00802C 82 00 00 00             73 	int 0x000000 ; int9
      008030 82 00 9A E4             74 	int _SPI_IRQHandler ; int10
      008034 82 00 9A E5             75 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 9A E6             76 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 9A E7             77 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 9A E8             78 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 00 00             79 	int 0x000000 ; int15
      008048 82 00 00 00             80 	int 0x000000 ; int16
      00804C 82 00 9A E9             81 	int _UART1_TX_IRQHandler ; int17
      008050 82 00 9A EA             82 	int _UART1_RX_IRQHandler ; int18
      008054 82 00 9A EB             83 	int _I2C_IRQHandler ; int19
      008058 82 00 00 00             84 	int 0x000000 ; int20
      00805C 82 00 00 00             85 	int 0x000000 ; int21
      008060 82 00 9A EC             86 	int _ADC1_IRQHandler ; int22
      008064 82 00 9A F1             87 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 9A F6             88 	int _EEPROM_EEC_IRQHandler ; int24
                                     89 ;--------------------------------------------------------
                                     90 ; global & static initialisations
                                     91 ;--------------------------------------------------------
                                     92 	.area HOME
                                     93 	.area GSINIT
                                     94 	.area GSFINAL
                                     95 	.area GSINIT
      008085                         96 __sdcc_init_data:
                                     97 ; stm8_genXINIT() start
      008085 AE 02 62         [ 2]   98 	ldw x, #l_DATA
      008088 27 07            [ 1]   99 	jreq	00002$
      00808A                        100 00001$:
      00808A 72 4F 00 00      [ 1]  101 	clr (s_DATA - 1, x)
      00808E 5A               [ 2]  102 	decw x
      00808F 26 F9            [ 1]  103 	jrne	00001$
      008091                        104 00002$:
      008091 AE 00 07         [ 2]  105 	ldw	x, #l_INITIALIZER
      008094 27 09            [ 1]  106 	jreq	00004$
      008096                        107 00003$:
      008096 D6 81 05         [ 1]  108 	ld	a, (s_INITIALIZER - 1, x)
      008099 D7 02 62         [ 1]  109 	ld	(s_INITIALIZED - 1, x), a
      00809C 5A               [ 2]  110 	decw	x
      00809D 26 F7            [ 1]  111 	jrne	00003$
      00809F                        112 00004$:
                                    113 ; stm8_genXINIT() end
                                    114 	.area GSFINAL
      00809F CC 80 6C         [ 2]  115 	jp	__sdcc_program_startup
                                    116 ;--------------------------------------------------------
                                    117 ; Home
                                    118 ;--------------------------------------------------------
                                    119 	.area HOME
                                    120 	.area HOME
      00806C                        121 __sdcc_program_startup:
      00806C CC 87 77         [ 2]  122 	jp	_main
                                    123 ;	return from main will return to caller
                                    124 ;--------------------------------------------------------
                                    125 ; code
                                    126 ;--------------------------------------------------------
                                    127 	.area CODE
                                    128 ;	../src/main.c: 99: void main( void )
                                    129 ;	-----------------------------------------
                                    130 ;	 function main
                                    131 ;	-----------------------------------------
      008777                        132 _main:
      008777 52 2F            [ 2]  133 	sub	sp, #47
                                    134 ;	../src/main.c: 109: clkInit();
      008779 CD 8A D7         [ 4]  135 	call	_clkInit
                                    136 ;	../src/main.c: 110: LedMatrixInit();
      00877C CD 84 F6         [ 4]  137 	call	_LedMatrixInit
                                    138 ;	../src/main.c: 111: sysTickInit();
      00877F CD 84 9A         [ 4]  139 	call	_sysTickInit
                                    140 ;	../src/main.c: 114: enableInterrupts();
      008782 9A               [ 1]  141 	rim
                                    142 ;	../src/main.c: 117: for(i = 0; i < NUM_OF_LEDS; i++){
      008783 0F 2F            [ 1]  143 	clr	(0x2f, sp)
      008785                        144 00141$:
                                    145 ;	../src/main.c: 118: SetLedMode(i, LED_ON);
      008785 4B 03            [ 1]  146 	push	#0x03
      008787 7B 30            [ 1]  147 	ld	a, (0x30, sp)
      008789 88               [ 1]  148 	push	a
      00878A CD 84 F9         [ 4]  149 	call	_SetLedMode
      00878D 85               [ 2]  150 	popw	x
                                    151 ;	../src/main.c: 119: dly(1000);
      00878E 4B E8            [ 1]  152 	push	#0xe8
      008790 4B 03            [ 1]  153 	push	#0x03
      008792 5F               [ 1]  154 	clrw	x
      008793 89               [ 2]  155 	pushw	x
      008794 CD 84 B9         [ 4]  156 	call	_dly
      008797 5B 04            [ 2]  157 	addw	sp, #4
                                    158 ;	../src/main.c: 120: SetLedMode(i, LED_OFF);
      008799 4B 00            [ 1]  159 	push	#0x00
      00879B 7B 30            [ 1]  160 	ld	a, (0x30, sp)
      00879D 88               [ 1]  161 	push	a
      00879E CD 84 F9         [ 4]  162 	call	_SetLedMode
      0087A1 85               [ 2]  163 	popw	x
                                    164 ;	../src/main.c: 121: SetLedMode(i+1, LED_ON);
      0087A2 7B 2F            [ 1]  165 	ld	a, (0x2f, sp)
      0087A4 4C               [ 1]  166 	inc	a
      0087A5 4B 03            [ 1]  167 	push	#0x03
      0087A7 88               [ 1]  168 	push	a
      0087A8 CD 84 F9         [ 4]  169 	call	_SetLedMode
      0087AB 85               [ 2]  170 	popw	x
                                    171 ;	../src/main.c: 117: for(i = 0; i < NUM_OF_LEDS; i++){
      0087AC 0C 2F            [ 1]  172 	inc	(0x2f, sp)
      0087AE 7B 2F            [ 1]  173 	ld	a, (0x2f, sp)
      0087B0 A1 0C            [ 1]  174 	cp	a, #0x0c
      0087B2 25 D1            [ 1]  175 	jrc	00141$
                                    176 ;	../src/main.c: 124: for(i = 0; i < NUM_OF_LEDS; i++){
      0087B4 0F 2F            [ 1]  177 	clr	(0x2f, sp)
      0087B6                        178 00143$:
                                    179 ;	../src/main.c: 125: SetLedMode(i, (i%2)?LED_TOGGLE_FAST:LED_TOGGLE_SLOW);
      0087B6 7B 2F            [ 1]  180 	ld	a, (0x2f, sp)
      0087B8 44               [ 1]  181 	srl	a
      0087B9 24 03            [ 1]  182 	jrnc	00147$
      0087BB A6 02            [ 1]  183 	ld	a, #0x02
      0087BD C5                     184 	.byte 0xc5
      0087BE                        185 00147$:
      0087BE A6 01            [ 1]  186 	ld	a, #0x01
      0087C0                        187 00148$:
      0087C0 88               [ 1]  188 	push	a
      0087C1 7B 30            [ 1]  189 	ld	a, (0x30, sp)
      0087C3 88               [ 1]  190 	push	a
      0087C4 CD 84 F9         [ 4]  191 	call	_SetLedMode
      0087C7 85               [ 2]  192 	popw	x
                                    193 ;	../src/main.c: 126: dly(10000);
      0087C8 4B 10            [ 1]  194 	push	#0x10
      0087CA 4B 27            [ 1]  195 	push	#0x27
      0087CC 5F               [ 1]  196 	clrw	x
      0087CD 89               [ 2]  197 	pushw	x
      0087CE CD 84 B9         [ 4]  198 	call	_dly
      0087D1 5B 04            [ 2]  199 	addw	sp, #4
                                    200 ;	../src/main.c: 124: for(i = 0; i < NUM_OF_LEDS; i++){
      0087D3 0C 2F            [ 1]  201 	inc	(0x2f, sp)
      0087D5 7B 2F            [ 1]  202 	ld	a, (0x2f, sp)
      0087D7 A1 0C            [ 1]  203 	cp	a, #0x0c
      0087D9 25 DB            [ 1]  204 	jrc	00143$
                                    205 ;	../src/main.c: 129: while(1);
      0087DB                        206 00104$:
      0087DB 20 FE            [ 2]  207 	jra	00104$
                                    208 ;	../src/main.c: 230: }
                                    209 ;	../src/main.c: 232: }
      0087DD 5B 2F            [ 2]  210 	addw	sp, #47
      0087DF 81               [ 4]  211 	ret
                                    212 ;	../src/main.c: 245: static void Wr2SD( fsm_t * pfsm ){
                                    213 ;	-----------------------------------------
                                    214 ;	 function Wr2SD
                                    215 ;	-----------------------------------------
      0087E0                        216 _Wr2SD:
      0087E0 52 06            [ 2]  217 	sub	sp, #6
                                    218 ;	../src/main.c: 252: if( S1_WR_BUF0 == pfsm->state){
      0087E2 16 09            [ 2]  219 	ldw	y, (0x09, sp)
      0087E4 17 03            [ 2]  220 	ldw	(0x03, sp), y
      0087E6 93               [ 1]  221 	ldw	x, y
      0087E7 F6               [ 1]  222 	ld	a, (x)
      0087E8 4A               [ 1]  223 	dec	a
      0087E9 26 06            [ 1]  224 	jrne	00102$
                                    225 ;	../src/main.c: 253: pBuf = adcBuffer0; bufNo = 0;
      0087EB AE 00 02         [ 2]  226 	ldw	x, #_adcBuffer0+0
      0087EE 4F               [ 1]  227 	clr	a
      0087EF 20 05            [ 2]  228 	jra	00103$
      0087F1                        229 00102$:
                                    230 ;	../src/main.c: 255: pBuf = adcBuffer1; bufNo = 1;
      0087F1 AE 01 02         [ 2]  231 	ldw	x, #(_adcBuffer1+0)
      0087F4 A6 01            [ 1]  232 	ld	a, #0x01
      0087F6                        233 00103$:
                                    234 ;	../src/main.c: 257: RELEASE_BUFF_FOR_WR(bufNo); //clear this flag
      0087F6 6B 06            [ 1]  235 	ld	(0x06, sp), a
      0087F8 A6 01            [ 1]  236 	ld	a, #0x01
      0087FA 88               [ 1]  237 	push	a
      0087FB 7B 07            [ 1]  238 	ld	a, (0x07, sp)
      0087FD 27 05            [ 1]  239 	jreq	00143$
      0087FF                        240 00142$:
      0087FF 08 01            [ 1]  241 	sll	(1, sp)
      008801 4A               [ 1]  242 	dec	a
      008802 26 FB            [ 1]  243 	jrne	00142$
      008804                        244 00143$:
      008804 84               [ 1]  245 	pop	a
      008805 43               [ 1]  246 	cpl	a
      008806 C4 00 01         [ 1]  247 	and	a, _buffer_rdy+0
      008809 C7 00 01         [ 1]  248 	ld	_buffer_rdy+0, a
                                    249 ;	../src/main.c: 260: SetLedMode(0, LED_ON);
      00880C 89               [ 2]  250 	pushw	x
      00880D 4B 03            [ 1]  251 	push	#0x03
      00880F 4B 00            [ 1]  252 	push	#0x00
      008811 CD 84 F9         [ 4]  253 	call	_SetLedMode
      008814 85               [ 2]  254 	popw	x
      008815 85               [ 2]  255 	popw	x
                                    256 ;	../src/main.c: 261: res = pf_write((void*)pBuf,BUFFER_SZ_IN_BYTES, &pbr);
      008816 51               [ 1]  257 	exgw	x, y
      008817 96               [ 1]  258 	ldw	x, sp
      008818 5C               [ 1]  259 	incw	x
      008819 89               [ 2]  260 	pushw	x
      00881A 4B 00            [ 1]  261 	push	#0x00
      00881C 4B 01            [ 1]  262 	push	#0x01
      00881E 90 89            [ 2]  263 	pushw	y
      008820 CD 98 6C         [ 4]  264 	call	_pf_write
      008823 5B 06            [ 2]  265 	addw	sp, #6
                                    266 ;	../src/main.c: 263: SetLedMode(0, LED_OFF);
      008825 88               [ 1]  267 	push	a
      008826 4B 00            [ 1]  268 	push	#0x00
      008828 4B 00            [ 1]  269 	push	#0x00
      00882A CD 84 F9         [ 4]  270 	call	_SetLedMode
      00882D 85               [ 2]  271 	popw	x
      00882E 84               [ 1]  272 	pop	a
                                    273 ;	../src/main.c: 268: pfsm->error = ERR_WR_DATA;
      00882F 1E 03            [ 2]  274 	ldw	x, (0x03, sp)
      008831 5C               [ 1]  275 	incw	x
      008832 1F 05            [ 2]  276 	ldw	(0x05, sp), x
                                    277 ;	../src/main.c: 265: if(FR_OK != res){
      008834 4D               [ 1]  278 	tnz	a
      008835 27 0C            [ 1]  279 	jreq	00105$
                                    280 ;	../src/main.c: 268: pfsm->error = ERR_WR_DATA;
      008837 1E 05            [ 2]  281 	ldw	x, (0x05, sp)
      008839 A6 02            [ 1]  282 	ld	a, #0x02
      00883B F7               [ 1]  283 	ld	(x), a
                                    284 ;	../src/main.c: 269: pfsm->state = S4_ERR;
      00883C 1E 03            [ 2]  285 	ldw	x, (0x03, sp)
      00883E A6 04            [ 1]  286 	ld	a, #0x04
      008840 F7               [ 1]  287 	ld	(x), a
                                    288 ;	../src/main.c: 270: return;
      008841 20 53            [ 2]  289 	jra	00112$
      008843                        290 00105$:
                                    291 ;	../src/main.c: 273: if(NO_BUFF_PER_BLK == ++blkCnt){
      008843 72 5C 02 63      [ 1]  292 	inc	_blkCnt+0
      008847 C6 02 63         [ 1]  293 	ld	a, _blkCnt+0
      00884A A1 02            [ 1]  294 	cp	a, #0x02
      00884C 26 45            [ 1]  295 	jrne	00111$
                                    296 ;	../src/main.c: 275: blkCnt = 0;
      00884E 72 5F 02 63      [ 1]  297 	clr	_blkCnt+0
                                    298 ;	../src/main.c: 276: res = pf_write(0,0,&pbr);
      008852 96               [ 1]  299 	ldw	x, sp
      008853 5C               [ 1]  300 	incw	x
      008854 89               [ 2]  301 	pushw	x
      008855 5F               [ 1]  302 	clrw	x
      008856 89               [ 2]  303 	pushw	x
      008857 5F               [ 1]  304 	clrw	x
      008858 89               [ 2]  305 	pushw	x
      008859 CD 98 6C         [ 4]  306 	call	_pf_write
      00885C 5B 06            [ 2]  307 	addw	sp, #6
                                    308 ;	../src/main.c: 279: if(FR_OK != res){
      00885E 4D               [ 1]  309 	tnz	a
      00885F 27 0C            [ 1]  310 	jreq	00107$
                                    311 ;	../src/main.c: 281: pfsm->error = ERR_WR_NO_RESP;
      008861 1E 05            [ 2]  312 	ldw	x, (0x05, sp)
      008863 A6 03            [ 1]  313 	ld	a, #0x03
      008865 F7               [ 1]  314 	ld	(x), a
                                    315 ;	../src/main.c: 282: pfsm->state = S4_ERR;
      008866 1E 03            [ 2]  316 	ldw	x, (0x03, sp)
      008868 A6 04            [ 1]  317 	ld	a, #0x04
      00886A F7               [ 1]  318 	ld	(x), a
                                    319 ;	../src/main.c: 283: return;
      00886B 20 29            [ 2]  320 	jra	00112$
      00886D                        321 00107$:
                                    322 ;	../src/main.c: 286: if(0 == --fileBlkCnt){
      00886D CE 02 66         [ 2]  323 	ldw	x, _fileBlkCnt+2
      008870 1D 00 01         [ 2]  324 	subw	x, #0x0001
      008873 90 CE 02 64      [ 2]  325 	ldw	y, _fileBlkCnt+0
      008877 24 02            [ 1]  326 	jrnc	00149$
      008879 90 5A            [ 2]  327 	decw	y
      00887B                        328 00149$:
      00887B CF 02 66         [ 2]  329 	ldw	_fileBlkCnt+2, x
      00887E 90 CF 02 64      [ 2]  330 	ldw	_fileBlkCnt+0, y
      008882 CE 02 66         [ 2]  331 	ldw	x, _fileBlkCnt+2
      008885 26 0C            [ 1]  332 	jrne	00111$
      008887 CE 02 64         [ 2]  333 	ldw	x, _fileBlkCnt+0
      00888A 26 07            [ 1]  334 	jrne	00111$
                                    335 ;	../src/main.c: 289: pfsm->state = S3_NXT_FILE;
      00888C 1E 03            [ 2]  336 	ldw	x, (0x03, sp)
      00888E A6 03            [ 1]  337 	ld	a, #0x03
      008890 F7               [ 1]  338 	ld	(x), a
                                    339 ;	../src/main.c: 290: return;
      008891 20 03            [ 2]  340 	jra	00112$
      008893                        341 00111$:
                                    342 ;	../src/main.c: 295: pfsm->state = S0_RST; 
      008893 1E 03            [ 2]  343 	ldw	x, (0x03, sp)
      008895 7F               [ 1]  344 	clr	(x)
      008896                        345 00112$:
                                    346 ;	../src/main.c: 296: }
      008896 5B 06            [ 2]  347 	addw	sp, #6
      008898 81               [ 4]  348 	ret
                                    349 ;	../src/main.c: 309: static void GetNxtFileName( char * fname){
                                    350 ;	-----------------------------------------
                                    351 ;	 function GetNxtFileName
                                    352 ;	-----------------------------------------
      008899                        353 _GetNxtFileName:
      008899 52 05            [ 2]  354 	sub	sp, #5
                                    355 ;	../src/main.c: 310: uint8_t val = 0;
      00889B 0F 01            [ 1]  356 	clr	(0x01, sp)
                                    357 ;	../src/main.c: 312: if(0x39 == fname[3]){
      00889D 1E 08            [ 2]  358 	ldw	x, (0x08, sp)
      00889F E6 03            [ 1]  359 	ld	a, (0x3, x)
                                    360 ;	../src/main.c: 313: val = 0x01;
      0088A1 A0 39            [ 1]  361 	sub	a, #0x39
      0088A3 26 03            [ 1]  362 	jrne	00102$
      0088A5 4C               [ 1]  363 	inc	a
      0088A6 6B 01            [ 1]  364 	ld	(0x01, sp), a
      0088A8                        365 00102$:
                                    366 ;	../src/main.c: 315: if(0x39 == fname[2]) {
      0088A8 1E 08            [ 2]  367 	ldw	x, (0x08, sp)
      0088AA E6 02            [ 1]  368 	ld	a, (0x2, x)
      0088AC A1 39            [ 1]  369 	cp	a, #0x39
      0088AE 26 06            [ 1]  370 	jrne	00104$
                                    371 ;	../src/main.c: 316: val += 0x02;
      0088B0 7B 01            [ 1]  372 	ld	a, (0x01, sp)
      0088B2 AB 02            [ 1]  373 	add	a, #0x02
      0088B4 6B 01            [ 1]  374 	ld	(0x01, sp), a
      0088B6                        375 00104$:
                                    376 ;	../src/main.c: 318: if(0x39 == fname[1]) {
      0088B6 1E 08            [ 2]  377 	ldw	x, (0x08, sp)
      0088B8 E6 01            [ 1]  378 	ld	a, (0x1, x)
      0088BA A1 39            [ 1]  379 	cp	a, #0x39
      0088BC 26 06            [ 1]  380 	jrne	00106$
                                    381 ;	../src/main.c: 319: val += 0x04;
      0088BE 7B 01            [ 1]  382 	ld	a, (0x01, sp)
      0088C0 AB 04            [ 1]  383 	add	a, #0x04
      0088C2 6B 01            [ 1]  384 	ld	(0x01, sp), a
      0088C4                        385 00106$:
                                    386 ;	../src/main.c: 321: if(0x39 == fname[0]) {
      0088C4 16 08            [ 2]  387 	ldw	y, (0x08, sp)
      0088C6 17 02            [ 2]  388 	ldw	(0x02, sp), y
      0088C8 93               [ 1]  389 	ldw	x, y
      0088C9 F6               [ 1]  390 	ld	a, (x)
      0088CA A1 39            [ 1]  391 	cp	a, #0x39
      0088CC 26 06            [ 1]  392 	jrne	00108$
                                    393 ;	../src/main.c: 322: val += 0x08;
      0088CE 7B 01            [ 1]  394 	ld	a, (0x01, sp)
      0088D0 AB 08            [ 1]  395 	add	a, #0x08
      0088D2 6B 01            [ 1]  396 	ld	(0x01, sp), a
      0088D4                        397 00108$:
                                    398 ;	../src/main.c: 326: case 0x01: fname[3] = 0x30; 
      0088D4 1E 02            [ 2]  399 	ldw	x, (0x02, sp)
      0088D6 1C 00 03         [ 2]  400 	addw	x, #0x0003
                                    401 ;	../src/main.c: 327: fname[2]++;break;
      0088D9 16 02            [ 2]  402 	ldw	y, (0x02, sp)
      0088DB 90 5C            [ 1]  403 	incw	y
      0088DD 90 5C            [ 1]  404 	incw	y
      0088DF 17 04            [ 2]  405 	ldw	(0x04, sp), y
                                    406 ;	../src/main.c: 325: switch(val){
      0088E1 7B 01            [ 1]  407 	ld	a, (0x01, sp)
      0088E3 4A               [ 1]  408 	dec	a
      0088E4 27 18            [ 1]  409 	jreq	00109$
                                    410 ;	../src/main.c: 330: fname[1]++; break;
      0088E6 16 02            [ 2]  411 	ldw	y, (0x02, sp)
      0088E8 90 5C            [ 1]  412 	incw	y
                                    413 ;	../src/main.c: 325: switch(val){
      0088EA 7B 01            [ 1]  414 	ld	a, (0x01, sp)
      0088EC A1 03            [ 1]  415 	cp	a, #0x03
      0088EE 27 16            [ 1]  416 	jreq	00110$
      0088F0 7B 01            [ 1]  417 	ld	a, (0x01, sp)
      0088F2 A1 07            [ 1]  418 	cp	a, #0x07
      0088F4 27 1C            [ 1]  419 	jreq	00111$
      0088F6 7B 01            [ 1]  420 	ld	a, (0x01, sp)
      0088F8 A1 0F            [ 1]  421 	cp	a, #0x0f
      0088FA 27 25            [ 1]  422 	jreq	00112$
      0088FC 20 34            [ 2]  423 	jra	00113$
                                    424 ;	../src/main.c: 326: case 0x01: fname[3] = 0x30; 
      0088FE                        425 00109$:
      0088FE A6 30            [ 1]  426 	ld	a, #0x30
      008900 F7               [ 1]  427 	ld	(x), a
                                    428 ;	../src/main.c: 327: fname[2]++;break;
      008901 1E 04            [ 2]  429 	ldw	x, (0x04, sp)
      008903 7C               [ 1]  430 	inc	(x)
      008904 20 2D            [ 2]  431 	jra	00115$
                                    432 ;	../src/main.c: 328: case 0x03: fname[3] = 0x30; 
      008906                        433 00110$:
      008906 A6 30            [ 1]  434 	ld	a, #0x30
      008908 F7               [ 1]  435 	ld	(x), a
                                    436 ;	../src/main.c: 329: fname[2] = 0x30; 
      008909 1E 04            [ 2]  437 	ldw	x, (0x04, sp)
      00890B A6 30            [ 1]  438 	ld	a, #0x30
      00890D F7               [ 1]  439 	ld	(x), a
                                    440 ;	../src/main.c: 330: fname[1]++; break;
      00890E 90 7C            [ 1]  441 	inc	(y)
      008910 20 21            [ 2]  442 	jra	00115$
                                    443 ;	../src/main.c: 331: case 0x07: fname[3] = 0x30; 
      008912                        444 00111$:
      008912 A6 30            [ 1]  445 	ld	a, #0x30
      008914 F7               [ 1]  446 	ld	(x), a
                                    447 ;	../src/main.c: 332: fname[2] = 0x30; 
      008915 1E 04            [ 2]  448 	ldw	x, (0x04, sp)
                                    449 ;	../src/main.c: 333: fname[1] = 0x30; 
      008917 A6 30            [ 1]  450 	ld	a, #0x30
      008919 F7               [ 1]  451 	ld	(x), a
      00891A 90 F7            [ 1]  452 	ld	(y), a
                                    453 ;	../src/main.c: 334: fname[0]++; break;
      00891C 1E 02            [ 2]  454 	ldw	x, (0x02, sp)
      00891E 7C               [ 1]  455 	inc	(x)
      00891F 20 12            [ 2]  456 	jra	00115$
                                    457 ;	../src/main.c: 335: case 0x0f: fname[3] = 0x30; 
      008921                        458 00112$:
      008921 A6 30            [ 1]  459 	ld	a, #0x30
      008923 F7               [ 1]  460 	ld	(x), a
                                    461 ;	../src/main.c: 336: fname[2] = 0x30; 
      008924 1E 04            [ 2]  462 	ldw	x, (0x04, sp)
                                    463 ;	../src/main.c: 337: fname[1] = 0x30; 
      008926 A6 30            [ 1]  464 	ld	a, #0x30
      008928 F7               [ 1]  465 	ld	(x), a
      008929 90 F7            [ 1]  466 	ld	(y), a
                                    467 ;	../src/main.c: 338: fname[0] = 0x30; break;
      00892B 1E 02            [ 2]  468 	ldw	x, (0x02, sp)
      00892D A6 30            [ 1]  469 	ld	a, #0x30
      00892F F7               [ 1]  470 	ld	(x), a
      008930 20 01            [ 2]  471 	jra	00115$
                                    472 ;	../src/main.c: 339: default: fname[3]++; break;
      008932                        473 00113$:
      008932 7C               [ 1]  474 	inc	(x)
                                    475 ;	../src/main.c: 340: }
      008933                        476 00115$:
                                    477 ;	../src/main.c: 341: }
      008933 5B 05            [ 2]  478 	addw	sp, #5
      008935 81               [ 4]  479 	ret
                                    480 ;	../src/main.c: 354: static void ConvertFileName(uint16_t firstFileName, char * fname){
                                    481 ;	-----------------------------------------
                                    482 ;	 function ConvertFileName
                                    483 ;	-----------------------------------------
      008936                        484 _ConvertFileName:
      008936 52 04            [ 2]  485 	sub	sp, #4
                                    486 ;	../src/main.c: 357: val = firstFileName/1000;
      008938 16 07            [ 2]  487 	ldw	y, (0x07, sp)
      00893A 17 03            [ 2]  488 	ldw	(0x03, sp), y
      00893C 93               [ 1]  489 	ldw	x, y
      00893D 90 AE 03 E8      [ 2]  490 	ldw	y, #0x03e8
      008941 65               [ 2]  491 	divw	x, y
                                    492 ;	../src/main.c: 358: fname[0] = val + 0x30;
      008942 16 09            [ 2]  493 	ldw	y, (0x09, sp)
      008944 17 01            [ 2]  494 	ldw	(0x01, sp), y
      008946 9F               [ 1]  495 	ld	a, xl
      008947 AB 30            [ 1]  496 	add	a, #0x30
      008949 16 01            [ 2]  497 	ldw	y, (0x01, sp)
      00894B 90 F7            [ 1]  498 	ld	(y), a
                                    499 ;	../src/main.c: 359: firstFileName -=  val*1000;
      00894D 89               [ 2]  500 	pushw	x
      00894E 4B E8            [ 1]  501 	push	#0xe8
      008950 4B 03            [ 1]  502 	push	#0x03
      008952 CD 9A F7         [ 4]  503 	call	__mulint
      008955 5B 04            [ 2]  504 	addw	sp, #4
      008957 50               [ 2]  505 	negw	x
      008958 72 FB 03         [ 2]  506 	addw	x, (0x03, sp)
                                    507 ;	../src/main.c: 360: val = firstFileName/100;
      00895B 1F 07            [ 2]  508 	ldw	(0x07, sp), x
      00895D 1F 03            [ 2]  509 	ldw	(0x03, sp), x
      00895F 90 AE 00 64      [ 2]  510 	ldw	y, #0x0064
      008963 65               [ 2]  511 	divw	x, y
                                    512 ;	../src/main.c: 361: fname[1] = val + 0x30;
      008964 16 01            [ 2]  513 	ldw	y, (0x01, sp)
      008966 90 5C            [ 1]  514 	incw	y
      008968 9F               [ 1]  515 	ld	a, xl
      008969 AB 30            [ 1]  516 	add	a, #0x30
      00896B 90 F7            [ 1]  517 	ld	(y), a
                                    518 ;	../src/main.c: 362: firstFileName -=  val*100;
      00896D 89               [ 2]  519 	pushw	x
      00896E 4B 64            [ 1]  520 	push	#0x64
      008970 4B 00            [ 1]  521 	push	#0x00
      008972 CD 9A F7         [ 4]  522 	call	__mulint
      008975 5B 04            [ 2]  523 	addw	sp, #4
      008977 50               [ 2]  524 	negw	x
      008978 72 FB 03         [ 2]  525 	addw	x, (0x03, sp)
                                    526 ;	../src/main.c: 363: val = firstFileName/10;
      00897B 1F 07            [ 2]  527 	ldw	(0x07, sp), x
      00897D 1F 03            [ 2]  528 	ldw	(0x03, sp), x
      00897F 90 AE 00 0A      [ 2]  529 	ldw	y, #0x000a
      008983 65               [ 2]  530 	divw	x, y
                                    531 ;	../src/main.c: 364: fname[2] = val + 0x30;
      008984 16 01            [ 2]  532 	ldw	y, (0x01, sp)
      008986 72 A9 00 02      [ 2]  533 	addw	y, #0x0002
      00898A 9F               [ 1]  534 	ld	a, xl
      00898B AB 30            [ 1]  535 	add	a, #0x30
      00898D 90 F7            [ 1]  536 	ld	(y), a
                                    537 ;	../src/main.c: 365: firstFileName -=  val*10;
      00898F 89               [ 2]  538 	pushw	x
      008990 58               [ 2]  539 	sllw	x
      008991 58               [ 2]  540 	sllw	x
      008992 72 FB 01         [ 2]  541 	addw	x, (1, sp)
      008995 58               [ 2]  542 	sllw	x
      008996 5B 02            [ 2]  543 	addw	sp, #2
      008998 50               [ 2]  544 	negw	x
      008999 72 FB 03         [ 2]  545 	addw	x, (0x03, sp)
      00899C 1F 07            [ 2]  546 	ldw	(0x07, sp), x
                                    547 ;	../src/main.c: 366: fname[3] = firstFileName + 0x30;
      00899E 1E 01            [ 2]  548 	ldw	x, (0x01, sp)
      0089A0 1C 00 03         [ 2]  549 	addw	x, #0x0003
      0089A3 7B 08            [ 1]  550 	ld	a, (0x08, sp)
      0089A5 AB 30            [ 1]  551 	add	a, #0x30
      0089A7 F7               [ 1]  552 	ld	(x), a
                                    553 ;	../src/main.c: 367: fname[4] = '\0';
      0089A8 1E 01            [ 2]  554 	ldw	x, (0x01, sp)
      0089AA 6F 04            [ 1]  555 	clr	(0x0004, x)
                                    556 ;	../src/main.c: 368: }
      0089AC 5B 04            [ 2]  557 	addw	sp, #4
      0089AE 81               [ 4]  558 	ret
                                    559 ;	../src/main.c: 383: static UINT GetCfg( uint8_t * pCfgBuf,  cfg_t * pcfg){
                                    560 ;	-----------------------------------------
                                    561 ;	 function GetCfg
                                    562 ;	-----------------------------------------
      0089AF                        563 _GetCfg:
      0089AF 52 12            [ 2]  564 	sub	sp, #18
                                    565 ;	../src/main.c: 386: if(!IsValidCfgBuf(pCfgBuf)) return 1; 
      0089B1 1E 15            [ 2]  566 	ldw	x, (0x15, sp)
      0089B3 89               [ 2]  567 	pushw	x
      0089B4 CD 8A B2         [ 4]  568 	call	_IsValidCfgBuf
      0089B7 85               [ 2]  569 	popw	x
      0089B8 6B 12            [ 1]  570 	ld	(0x12, sp), a
      0089BA 26 05            [ 1]  571 	jrne	00102$
      0089BC 5F               [ 1]  572 	clrw	x
      0089BD 5C               [ 1]  573 	incw	x
      0089BE CC 8A AF         [ 2]  574 	jp	00106$
      0089C1                        575 00102$:
                                    576 ;	../src/main.c: 389: pcfg->sampFreq = pCfgBuf[0]+(((uint16_t)pCfgBuf[1])<<8);
      0089C1 16 17            [ 2]  577 	ldw	y, (0x17, sp)
      0089C3 17 01            [ 2]  578 	ldw	(0x01, sp), y
      0089C5 16 15            [ 2]  579 	ldw	y, (0x15, sp)
      0089C7 17 03            [ 2]  580 	ldw	(0x03, sp), y
      0089C9 93               [ 1]  581 	ldw	x, y
      0089CA F6               [ 1]  582 	ld	a, (x)
      0089CB 5F               [ 1]  583 	clrw	x
      0089CC 97               [ 1]  584 	ld	xl, a
      0089CD 16 03            [ 2]  585 	ldw	y, (0x03, sp)
      0089CF 90 E6 01         [ 1]  586 	ld	a, (0x1, y)
      0089D2 90 95            [ 1]  587 	ld	yh, a
      0089D4 4F               [ 1]  588 	clr	a
      0089D5 1F 11            [ 2]  589 	ldw	(0x11, sp), x
      0089D7 90 97            [ 1]  590 	ld	yl, a
      0089D9 72 F9 11         [ 2]  591 	addw	y, (0x11, sp)
      0089DC 1E 01            [ 2]  592 	ldw	x, (0x01, sp)
      0089DE FF               [ 2]  593 	ldw	(x), y
                                    594 ;	../src/main.c: 391: fID = pCfgBuf[2]+(((uint16_t)pCfgBuf[3])<<8);
      0089DF 1E 03            [ 2]  595 	ldw	x, (0x03, sp)
      0089E1 E6 02            [ 1]  596 	ld	a, (0x2, x)
      0089E3 90 5F            [ 1]  597 	clrw	y
      0089E5 90 97            [ 1]  598 	ld	yl, a
      0089E7 1E 03            [ 2]  599 	ldw	x, (0x03, sp)
      0089E9 E6 03            [ 1]  600 	ld	a, (0x3, x)
      0089EB 95               [ 1]  601 	ld	xh, a
      0089EC 4F               [ 1]  602 	clr	a
      0089ED 17 11            [ 2]  603 	ldw	(0x11, sp), y
      0089EF 97               [ 1]  604 	ld	xl, a
      0089F0 72 FB 11         [ 2]  605 	addw	x, (0x11, sp)
                                    606 ;	../src/main.c: 393: ConvertFileName(fID, pcfg->firstFileName);
      0089F3 16 01            [ 2]  607 	ldw	y, (0x01, sp)
      0089F5 72 A9 00 02      [ 2]  608 	addw	y, #0x0002
      0089F9 90 89            [ 2]  609 	pushw	y
      0089FB 89               [ 2]  610 	pushw	x
      0089FC CD 89 36         [ 4]  611 	call	_ConvertFileName
      0089FF 5B 04            [ 2]  612 	addw	sp, #4
                                    613 ;	../src/main.c: 394: pcfg->fileNo = pCfgBuf[4]+(((uint16_t)pCfgBuf[5])<<8);
      008A01 16 01            [ 2]  614 	ldw	y, (0x01, sp)
      008A03 72 A9 00 0B      [ 2]  615 	addw	y, #0x000b
      008A07 1E 03            [ 2]  616 	ldw	x, (0x03, sp)
      008A09 E6 04            [ 1]  617 	ld	a, (0x4, x)
      008A0B 6B 10            [ 1]  618 	ld	(0x10, sp), a
      008A0D 0F 0F            [ 1]  619 	clr	(0x0f, sp)
      008A0F 1E 03            [ 2]  620 	ldw	x, (0x03, sp)
      008A11 E6 05            [ 1]  621 	ld	a, (0x5, x)
      008A13 6B 11            [ 1]  622 	ld	(0x11, sp), a
      008A15 0F 12            [ 1]  623 	clr	(0x12, sp)
      008A17 1E 0F            [ 2]  624 	ldw	x, (0x0f, sp)
      008A19 72 FB 11         [ 2]  625 	addw	x, (0x11, sp)
      008A1C 90 FF            [ 2]  626 	ldw	(y), x
                                    627 ;	../src/main.c: 395: pcfg->fileSzInBlock = pCfgBuf[6]+ \
      008A1E 1E 01            [ 2]  628 	ldw	x, (0x01, sp)
      008A20 1C 00 07         [ 2]  629 	addw	x, #0x0007
      008A23 1F 05            [ 2]  630 	ldw	(0x05, sp), x
      008A25 1E 03            [ 2]  631 	ldw	x, (0x03, sp)
      008A27 E6 06            [ 1]  632 	ld	a, (0x6, x)
      008A29 90 97            [ 1]  633 	ld	yl, a
      008A2B 1E 03            [ 2]  634 	ldw	x, (0x03, sp)
      008A2D E6 07            [ 1]  635 	ld	a, (0x7, x)
      008A2F 0F 11            [ 1]  636 	clr	(0x11, sp)
      008A31 5F               [ 1]  637 	clrw	x
      008A32 95               [ 1]  638 	ld	xh, a
      008A33 7B 11            [ 1]  639 	ld	a, (0x11, sp)
      008A35 0F 0A            [ 1]  640 	clr	(0x0a, sp)
      008A37 0F 11            [ 1]  641 	clr	(0x11, sp)
      008A39 0F 10            [ 1]  642 	clr	(0x10, sp)
      008A3B 0F 0F            [ 1]  643 	clr	(0x0f, sp)
      008A3D 88               [ 1]  644 	push	a
      008A3E 90 9F            [ 1]  645 	ld	a, yl
      008A40 1B 0B            [ 1]  646 	add	a, (0x0b, sp)
      008A42 90 97            [ 1]  647 	ld	yl, a
      008A44 9E               [ 1]  648 	ld	a, xh
      008A45 19 12            [ 1]  649 	adc	a, (0x12, sp)
      008A47 90 95            [ 1]  650 	ld	yh, a
      008A49 84               [ 1]  651 	pop	a
      008A4A 19 10            [ 1]  652 	adc	a, (0x10, sp)
      008A4C 6B 0C            [ 1]  653 	ld	(0x0c, sp), a
      008A4E 9F               [ 1]  654 	ld	a, xl
      008A4F 19 0F            [ 1]  655 	adc	a, (0x0f, sp)
      008A51 6B 0B            [ 1]  656 	ld	(0x0b, sp), a
      008A53 1E 03            [ 2]  657 	ldw	x, (0x03, sp)
      008A55 E6 08            [ 1]  658 	ld	a, (0x8, x)
      008A57 5F               [ 1]  659 	clrw	x
      008A58 0F 0F            [ 1]  660 	clr	(0x0f, sp)
      008A5A 0F 12            [ 1]  661 	clr	(0x12, sp)
      008A5C 0F 11            [ 1]  662 	clr	(0x11, sp)
      008A5E 72 F9 11         [ 2]  663 	addw	y, (0x11, sp)
      008A61 19 0C            [ 1]  664 	adc	a, (0x0c, sp)
      008A63 6B 08            [ 1]  665 	ld	(0x08, sp), a
      008A65 9F               [ 1]  666 	ld	a, xl
      008A66 19 0B            [ 1]  667 	adc	a, (0x0b, sp)
      008A68 6B 07            [ 1]  668 	ld	(0x07, sp), a
      008A6A 1E 03            [ 2]  669 	ldw	x, (0x03, sp)
      008A6C E6 09            [ 1]  670 	ld	a, (0x9, x)
      008A6E 0F 0F            [ 1]  671 	clr	(0x0f, sp)
      008A70 0F 0E            [ 1]  672 	clr	(0x0e, sp)
      008A72 5F               [ 1]  673 	clrw	x
      008A73 88               [ 1]  674 	push	a
      008A74 90 9F            [ 1]  675 	ld	a, yl
      008A76 1B 0F            [ 1]  676 	add	a, (0x0f, sp)
      008A78 90 02            [ 1]  677 	rlwa	y
      008A7A 89               [ 2]  678 	pushw	x
      008A7B 19 02            [ 1]  679 	adc	a, (2, sp)
      008A7D 85               [ 2]  680 	popw	x
      008A7E 90 95            [ 1]  681 	ld	yh, a
      008A80 9E               [ 1]  682 	ld	a, xh
      008A81 19 09            [ 1]  683 	adc	a, (0x09, sp)
      008A83 6B 11            [ 1]  684 	ld	(0x11, sp), a
      008A85 84               [ 1]  685 	pop	a
      008A86 19 07            [ 1]  686 	adc	a, (0x07, sp)
      008A88 6B 0F            [ 1]  687 	ld	(0x0f, sp), a
      008A8A 1E 05            [ 2]  688 	ldw	x, (0x05, sp)
      008A8C EF 02            [ 2]  689 	ldw	(0x2, x), y
      008A8E 16 0F            [ 2]  690 	ldw	y, (0x0f, sp)
      008A90 FF               [ 2]  691 	ldw	(x), y
                                    692 ;	../src/main.c: 399: pcfg->channel = pCfgBuf[10];
      008A91 1E 01            [ 2]  693 	ldw	x, (0x01, sp)
      008A93 1C 00 0D         [ 2]  694 	addw	x, #0x000d
      008A96 16 03            [ 2]  695 	ldw	y, (0x03, sp)
      008A98 90 E6 0A         [ 1]  696 	ld	a, (0xa, y)
      008A9B F7               [ 1]  697 	ld	(x), a
                                    698 ;	../src/main.c: 400: if(pCfgBuf[11] == 0)
      008A9C 1E 03            [ 2]  699 	ldw	x, (0x03, sp)
      008A9E E6 0B            [ 1]  700 	ld	a, (0xb, x)
                                    701 ;	../src/main.c: 402: pcfg->isFullResultion = false;
      008AA0 1E 01            [ 2]  702 	ldw	x, (0x01, sp)
      008AA2 1C 00 0E         [ 2]  703 	addw	x, #0x000e
                                    704 ;	../src/main.c: 400: if(pCfgBuf[11] == 0)
      008AA5 4D               [ 1]  705 	tnz	a
      008AA6 26 03            [ 1]  706 	jrne	00104$
                                    707 ;	../src/main.c: 402: pcfg->isFullResultion = false;
      008AA8 7F               [ 1]  708 	clr	(x)
      008AA9 20 03            [ 2]  709 	jra	00105$
      008AAB                        710 00104$:
                                    711 ;	../src/main.c: 404: pcfg->isFullResultion = true;
      008AAB A6 01            [ 1]  712 	ld	a, #0x01
      008AAD F7               [ 1]  713 	ld	(x), a
      008AAE                        714 00105$:
                                    715 ;	../src/main.c: 407: return 0x0;
      008AAE 5F               [ 1]  716 	clrw	x
      008AAF                        717 00106$:
                                    718 ;	../src/main.c: 408: }
      008AAF 5B 12            [ 2]  719 	addw	sp, #18
      008AB1 81               [ 4]  720 	ret
                                    721 ;	../src/main.c: 422: static uint8_t IsValidCfgBuf(uint8_t *pCfgBuf){
                                    722 ;	-----------------------------------------
                                    723 ;	 function IsValidCfgBuf
                                    724 ;	-----------------------------------------
      008AB2                        725 _IsValidCfgBuf:
      008AB2 88               [ 1]  726 	push	a
                                    727 ;	../src/main.c: 423: uint8_t crc = 0;
      008AB3 0F 01            [ 1]  728 	clr	(0x01, sp)
                                    729 ;	../src/main.c: 431: return false;	
      008AB5 5F               [ 1]  730 	clrw	x
      008AB6                        731 00105$:
                                    732 ;	../src/main.c: 425: for(; i < CFG_BUF_SZ - 1; i++){
      008AB6 A3 00 0C         [ 2]  733 	cpw	x, #0x000c
      008AB9 2E 0E            [ 1]  734 	jrsge	00101$
                                    735 ;	../src/main.c: 426: crc += pCfgBuf[i];		
      008ABB 90 93            [ 1]  736 	ldw	y, x
      008ABD 72 F9 04         [ 2]  737 	addw	y, (0x04, sp)
      008AC0 90 F6            [ 1]  738 	ld	a, (y)
      008AC2 1B 01            [ 1]  739 	add	a, (0x01, sp)
      008AC4 6B 01            [ 1]  740 	ld	(0x01, sp), a
                                    741 ;	../src/main.c: 425: for(; i < CFG_BUF_SZ - 1; i++){
      008AC6 5C               [ 1]  742 	incw	x
      008AC7 20 ED            [ 2]  743 	jra	00105$
      008AC9                        744 00101$:
                                    745 ;	../src/main.c: 428: if(crc == pCfgBuf[CFG_BUF_SZ-1])
      008AC9 1E 04            [ 2]  746 	ldw	x, (0x04, sp)
      008ACB E6 0C            [ 1]  747 	ld	a, (0xc, x)
                                    748 ;	../src/main.c: 429: return true;
      008ACD 10 01            [ 1]  749 	sub	a, (0x01, sp)
      008ACF 26 02            [ 1]  750 	jrne	00103$
      008AD1 4C               [ 1]  751 	inc	a
                                    752 ;	../src/main.c: 431: return false;	
      008AD2 21                     753 	.byte 0x21
      008AD3                        754 00103$:
      008AD3 4F               [ 1]  755 	clr	a
      008AD4                        756 00107$:
                                    757 ;	../src/main.c: 432: }
      008AD4 5B 01            [ 2]  758 	addw	sp, #1
      008AD6 81               [ 4]  759 	ret
                                    760 ;	../src/main.c: 441: static void clkInit( void )
                                    761 ;	-----------------------------------------
                                    762 ;	 function clkInit
                                    763 ;	-----------------------------------------
      008AD7                        764 _clkInit:
                                    765 ;	../src/main.c: 444: CLK->CKDIVR = 0;//(CLK_PRESCALER_HSIDIV1|CLK_PRESCALER_CPUDIV1);
      008AD7 35 00 50 C6      [ 1]  766 	mov	0x50c6+0, #0x00
                                    767 ;	../src/main.c: 452: CLK->PCKENR1 |= (CLK_PCKENR1_TIM4|CLK_PCKENR1_SPI|CLK_PCKENR1_UART1);
      008ADB C6 50 C7         [ 1]  768 	ld	a, 0x50c7
      008ADE AA 16            [ 1]  769 	or	a, #0x16
      008AE0 C7 50 C7         [ 1]  770 	ld	0x50c7, a
                                    771 ;	../src/main.c: 453: CLK->PCKENR2 |= (CLK_PCKENR2_ADC);
      008AE3 72 16 50 CA      [ 1]  772 	bset	20682, #3
                                    773 ;	../src/main.c: 454: }
      008AE7 81               [ 4]  774 	ret
                                    775 ;	../src/main.c: 469: void assert_failed(uint8_t* file, uint32_t line)
                                    776 ;	-----------------------------------------
                                    777 ;	 function assert_failed
                                    778 ;	-----------------------------------------
      008AE8                        779 _assert_failed:
                                    780 ;	../src/main.c: 475: while (1)
      008AE8                        781 00102$:
      008AE8 20 FE            [ 2]  782 	jra	00102$
                                    783 ;	../src/main.c: 478: }
      008AEA 81               [ 4]  784 	ret
                                    785 	.area CODE
                                    786 	.area CONST
                                    787 	.area CONST
      008102                        788 ___str_0:
      008102 43 46 47               789 	.ascii "CFG"
      008105 00                     790 	.db 0x00
                                    791 	.area CODE
                                    792 	.area INITIALIZER
      008106                        793 __xinit__blkCnt:
      008106 00                     794 	.db #0x00	; 0
      008107                        795 __xinit__fileBlkCnt:
      008107 00 00 00 00            796 	.byte #0x00, #0x00, #0x00, #0x00	; 0
      00810B                        797 __xinit__fileNoCnt:
      00810B 00 00                  798 	.dw #0x0000
                                    799 	.area CABS (ABS)
