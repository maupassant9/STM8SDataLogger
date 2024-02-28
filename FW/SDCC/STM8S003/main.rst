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
      009C25                         41 __start__stack:
      009C25                         42 	.ds	1
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
      008004 82 00 9B 1A             63 	int _TRAP_IRQHandler ; trap
      008008 82 00 9B 1B             64 	int _TLI_IRQHandler ; int0
      00800C 82 00 9B 1C             65 	int _AWU_IRQHandler ; int1
      008010 82 00 9B 1D             66 	int _CLK_IRQHandler ; int2
      008014 82 00 9B 1E             67 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 9B 1F             68 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 9B 20             69 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 9B 21             70 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 9B 22             71 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             72 	int 0x000000 ; int8
      00802C 82 00 00 00             73 	int 0x000000 ; int9
      008030 82 00 9B 23             74 	int _SPI_IRQHandler ; int10
      008034 82 00 9B 24             75 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 9B 25             76 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 9B 26             77 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 9B 27             78 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 00 00             79 	int 0x000000 ; int15
      008048 82 00 00 00             80 	int 0x000000 ; int16
      00804C 82 00 9B 28             81 	int _UART1_TX_IRQHandler ; int17
      008050 82 00 9B 29             82 	int _UART1_RX_IRQHandler ; int18
      008054 82 00 9B 2A             83 	int _I2C_IRQHandler ; int19
      008058 82 00 00 00             84 	int 0x000000 ; int20
      00805C 82 00 00 00             85 	int 0x000000 ; int21
      008060 82 00 9B 2B             86 	int _ADC1_IRQHandler ; int22
      008064 82 00 9B 30             87 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 9B 35             88 	int _EEPROM_EEC_IRQHandler ; int24
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
      00806C CC 87 B6         [ 2]  122 	jp	_main
                                    123 ;	return from main will return to caller
                                    124 ;--------------------------------------------------------
                                    125 ; code
                                    126 ;--------------------------------------------------------
                                    127 	.area CODE
                                    128 ;	../src/main.c: 100: void main( void )
                                    129 ;	-----------------------------------------
                                    130 ;	 function main
                                    131 ;	-----------------------------------------
      0087B6                        132 _main:
      0087B6 52 2F            [ 2]  133 	sub	sp, #47
                                    134 ;	../src/main.c: 110: clkInit();
      0087B8 CD 8B 16         [ 4]  135 	call	_clkInit
                                    136 ;	../src/main.c: 111: LedMatrixInit();
      0087BB CD 84 F2         [ 4]  137 	call	_LedMatrixInit
                                    138 ;	../src/main.c: 112: sysTickInit();
      0087BE CD 84 9A         [ 4]  139 	call	_sysTickInit
                                    140 ;	../src/main.c: 115: enableInterrupts();
      0087C1 9A               [ 1]  141 	rim
                                    142 ;	../src/main.c: 126: for(i = 0; i < NUM_OF_LEDS; i++){
      0087C2 0F 2F            [ 1]  143 	clr	(0x2f, sp)
      0087C4                        144 00141$:
                                    145 ;	../src/main.c: 127: SetLedMode(i, LED_ON);
      0087C4 4B 03            [ 1]  146 	push	#0x03
      0087C6 7B 30            [ 1]  147 	ld	a, (0x30, sp)
      0087C8 88               [ 1]  148 	push	a
      0087C9 CD 84 F5         [ 4]  149 	call	_SetLedMode
      0087CC 85               [ 2]  150 	popw	x
                                    151 ;	../src/main.c: 128: dly(1000);
      0087CD 4B E8            [ 1]  152 	push	#0xe8
      0087CF 4B 03            [ 1]  153 	push	#0x03
      0087D1 5F               [ 1]  154 	clrw	x
      0087D2 89               [ 2]  155 	pushw	x
      0087D3 CD 84 B9         [ 4]  156 	call	_dly
      0087D6 5B 04            [ 2]  157 	addw	sp, #4
                                    158 ;	../src/main.c: 129: SetLedMode(i, LED_OFF);
      0087D8 4B 00            [ 1]  159 	push	#0x00
      0087DA 7B 30            [ 1]  160 	ld	a, (0x30, sp)
      0087DC 88               [ 1]  161 	push	a
      0087DD CD 84 F5         [ 4]  162 	call	_SetLedMode
      0087E0 85               [ 2]  163 	popw	x
                                    164 ;	../src/main.c: 130: SetLedMode(i+1, LED_ON);
      0087E1 7B 2F            [ 1]  165 	ld	a, (0x2f, sp)
      0087E3 4C               [ 1]  166 	inc	a
      0087E4 4B 03            [ 1]  167 	push	#0x03
      0087E6 88               [ 1]  168 	push	a
      0087E7 CD 84 F5         [ 4]  169 	call	_SetLedMode
      0087EA 85               [ 2]  170 	popw	x
                                    171 ;	../src/main.c: 126: for(i = 0; i < NUM_OF_LEDS; i++){
      0087EB 0C 2F            [ 1]  172 	inc	(0x2f, sp)
      0087ED 7B 2F            [ 1]  173 	ld	a, (0x2f, sp)
      0087EF A1 0C            [ 1]  174 	cp	a, #0x0c
      0087F1 25 D1            [ 1]  175 	jrc	00141$
                                    176 ;	../src/main.c: 133: for(i = 0; i < NUM_OF_LEDS; i++){
      0087F3 0F 2F            [ 1]  177 	clr	(0x2f, sp)
      0087F5                        178 00143$:
                                    179 ;	../src/main.c: 134: SetLedMode(i, (i%2)?LED_TOGGLE_FAST:LED_TOGGLE_SLOW);
      0087F5 7B 2F            [ 1]  180 	ld	a, (0x2f, sp)
      0087F7 44               [ 1]  181 	srl	a
      0087F8 24 03            [ 1]  182 	jrnc	00147$
      0087FA A6 02            [ 1]  183 	ld	a, #0x02
      0087FC C5                     184 	.byte 0xc5
      0087FD                        185 00147$:
      0087FD A6 01            [ 1]  186 	ld	a, #0x01
      0087FF                        187 00148$:
      0087FF 88               [ 1]  188 	push	a
      008800 7B 30            [ 1]  189 	ld	a, (0x30, sp)
      008802 88               [ 1]  190 	push	a
      008803 CD 84 F5         [ 4]  191 	call	_SetLedMode
      008806 85               [ 2]  192 	popw	x
                                    193 ;	../src/main.c: 135: dly(10000);
      008807 4B 10            [ 1]  194 	push	#0x10
      008809 4B 27            [ 1]  195 	push	#0x27
      00880B 5F               [ 1]  196 	clrw	x
      00880C 89               [ 2]  197 	pushw	x
      00880D CD 84 B9         [ 4]  198 	call	_dly
      008810 5B 04            [ 2]  199 	addw	sp, #4
                                    200 ;	../src/main.c: 133: for(i = 0; i < NUM_OF_LEDS; i++){
      008812 0C 2F            [ 1]  201 	inc	(0x2f, sp)
      008814 7B 2F            [ 1]  202 	ld	a, (0x2f, sp)
      008816 A1 0C            [ 1]  203 	cp	a, #0x0c
      008818 25 DB            [ 1]  204 	jrc	00143$
                                    205 ;	../src/main.c: 138: while(1);
      00881A                        206 00104$:
      00881A 20 FE            [ 2]  207 	jra	00104$
                                    208 ;	../src/main.c: 239: }
                                    209 ;	../src/main.c: 241: }
      00881C 5B 2F            [ 2]  210 	addw	sp, #47
      00881E 81               [ 4]  211 	ret
                                    212 ;	../src/main.c: 254: static void Wr2SD( fsm_t * pfsm ){
                                    213 ;	-----------------------------------------
                                    214 ;	 function Wr2SD
                                    215 ;	-----------------------------------------
      00881F                        216 _Wr2SD:
      00881F 52 06            [ 2]  217 	sub	sp, #6
                                    218 ;	../src/main.c: 261: if( S1_WR_BUF0 == pfsm->state){
      008821 16 09            [ 2]  219 	ldw	y, (0x09, sp)
      008823 17 03            [ 2]  220 	ldw	(0x03, sp), y
      008825 93               [ 1]  221 	ldw	x, y
      008826 F6               [ 1]  222 	ld	a, (x)
      008827 4A               [ 1]  223 	dec	a
      008828 26 06            [ 1]  224 	jrne	00102$
                                    225 ;	../src/main.c: 262: pBuf = adcBuffer0; bufNo = 0;
      00882A AE 00 02         [ 2]  226 	ldw	x, #_adcBuffer0+0
      00882D 4F               [ 1]  227 	clr	a
      00882E 20 05            [ 2]  228 	jra	00103$
      008830                        229 00102$:
                                    230 ;	../src/main.c: 264: pBuf = adcBuffer1; bufNo = 1;
      008830 AE 01 02         [ 2]  231 	ldw	x, #(_adcBuffer1+0)
      008833 A6 01            [ 1]  232 	ld	a, #0x01
      008835                        233 00103$:
                                    234 ;	../src/main.c: 266: RELEASE_BUFF_FOR_WR(bufNo); //clear this flag
      008835 6B 06            [ 1]  235 	ld	(0x06, sp), a
      008837 A6 01            [ 1]  236 	ld	a, #0x01
      008839 88               [ 1]  237 	push	a
      00883A 7B 07            [ 1]  238 	ld	a, (0x07, sp)
      00883C 27 05            [ 1]  239 	jreq	00143$
      00883E                        240 00142$:
      00883E 08 01            [ 1]  241 	sll	(1, sp)
      008840 4A               [ 1]  242 	dec	a
      008841 26 FB            [ 1]  243 	jrne	00142$
      008843                        244 00143$:
      008843 84               [ 1]  245 	pop	a
      008844 43               [ 1]  246 	cpl	a
      008845 C4 00 01         [ 1]  247 	and	a, _buffer_rdy+0
      008848 C7 00 01         [ 1]  248 	ld	_buffer_rdy+0, a
                                    249 ;	../src/main.c: 269: SetLedMode(0, LED_ON);
      00884B 89               [ 2]  250 	pushw	x
      00884C 4B 03            [ 1]  251 	push	#0x03
      00884E 4B 00            [ 1]  252 	push	#0x00
      008850 CD 84 F5         [ 4]  253 	call	_SetLedMode
      008853 85               [ 2]  254 	popw	x
      008854 85               [ 2]  255 	popw	x
                                    256 ;	../src/main.c: 270: res = pf_write((void*)pBuf,BUFFER_SZ_IN_BYTES, &pbr);
      008855 51               [ 1]  257 	exgw	x, y
      008856 96               [ 1]  258 	ldw	x, sp
      008857 5C               [ 1]  259 	incw	x
      008858 89               [ 2]  260 	pushw	x
      008859 4B 00            [ 1]  261 	push	#0x00
      00885B 4B 01            [ 1]  262 	push	#0x01
      00885D 90 89            [ 2]  263 	pushw	y
      00885F CD 98 AB         [ 4]  264 	call	_pf_write
      008862 5B 06            [ 2]  265 	addw	sp, #6
                                    266 ;	../src/main.c: 272: SetLedMode(0, LED_OFF);
      008864 88               [ 1]  267 	push	a
      008865 4B 00            [ 1]  268 	push	#0x00
      008867 4B 00            [ 1]  269 	push	#0x00
      008869 CD 84 F5         [ 4]  270 	call	_SetLedMode
      00886C 85               [ 2]  271 	popw	x
      00886D 84               [ 1]  272 	pop	a
                                    273 ;	../src/main.c: 277: pfsm->error = ERR_WR_DATA;
      00886E 1E 03            [ 2]  274 	ldw	x, (0x03, sp)
      008870 5C               [ 1]  275 	incw	x
      008871 1F 05            [ 2]  276 	ldw	(0x05, sp), x
                                    277 ;	../src/main.c: 274: if(FR_OK != res){
      008873 4D               [ 1]  278 	tnz	a
      008874 27 0C            [ 1]  279 	jreq	00105$
                                    280 ;	../src/main.c: 277: pfsm->error = ERR_WR_DATA;
      008876 1E 05            [ 2]  281 	ldw	x, (0x05, sp)
      008878 A6 02            [ 1]  282 	ld	a, #0x02
      00887A F7               [ 1]  283 	ld	(x), a
                                    284 ;	../src/main.c: 278: pfsm->state = S4_ERR;
      00887B 1E 03            [ 2]  285 	ldw	x, (0x03, sp)
      00887D A6 04            [ 1]  286 	ld	a, #0x04
      00887F F7               [ 1]  287 	ld	(x), a
                                    288 ;	../src/main.c: 279: return;
      008880 20 53            [ 2]  289 	jra	00112$
      008882                        290 00105$:
                                    291 ;	../src/main.c: 282: if(NO_BUFF_PER_BLK == ++blkCnt){
      008882 72 5C 02 63      [ 1]  292 	inc	_blkCnt+0
      008886 C6 02 63         [ 1]  293 	ld	a, _blkCnt+0
      008889 A1 02            [ 1]  294 	cp	a, #0x02
      00888B 26 45            [ 1]  295 	jrne	00111$
                                    296 ;	../src/main.c: 284: blkCnt = 0;
      00888D 72 5F 02 63      [ 1]  297 	clr	_blkCnt+0
                                    298 ;	../src/main.c: 285: res = pf_write(0,0,&pbr);
      008891 96               [ 1]  299 	ldw	x, sp
      008892 5C               [ 1]  300 	incw	x
      008893 89               [ 2]  301 	pushw	x
      008894 5F               [ 1]  302 	clrw	x
      008895 89               [ 2]  303 	pushw	x
      008896 5F               [ 1]  304 	clrw	x
      008897 89               [ 2]  305 	pushw	x
      008898 CD 98 AB         [ 4]  306 	call	_pf_write
      00889B 5B 06            [ 2]  307 	addw	sp, #6
                                    308 ;	../src/main.c: 288: if(FR_OK != res){
      00889D 4D               [ 1]  309 	tnz	a
      00889E 27 0C            [ 1]  310 	jreq	00107$
                                    311 ;	../src/main.c: 290: pfsm->error = ERR_WR_NO_RESP;
      0088A0 1E 05            [ 2]  312 	ldw	x, (0x05, sp)
      0088A2 A6 03            [ 1]  313 	ld	a, #0x03
      0088A4 F7               [ 1]  314 	ld	(x), a
                                    315 ;	../src/main.c: 291: pfsm->state = S4_ERR;
      0088A5 1E 03            [ 2]  316 	ldw	x, (0x03, sp)
      0088A7 A6 04            [ 1]  317 	ld	a, #0x04
      0088A9 F7               [ 1]  318 	ld	(x), a
                                    319 ;	../src/main.c: 292: return;
      0088AA 20 29            [ 2]  320 	jra	00112$
      0088AC                        321 00107$:
                                    322 ;	../src/main.c: 295: if(0 == --fileBlkCnt){
      0088AC CE 02 66         [ 2]  323 	ldw	x, _fileBlkCnt+2
      0088AF 1D 00 01         [ 2]  324 	subw	x, #0x0001
      0088B2 90 CE 02 64      [ 2]  325 	ldw	y, _fileBlkCnt+0
      0088B6 24 02            [ 1]  326 	jrnc	00149$
      0088B8 90 5A            [ 2]  327 	decw	y
      0088BA                        328 00149$:
      0088BA CF 02 66         [ 2]  329 	ldw	_fileBlkCnt+2, x
      0088BD 90 CF 02 64      [ 2]  330 	ldw	_fileBlkCnt+0, y
      0088C1 CE 02 66         [ 2]  331 	ldw	x, _fileBlkCnt+2
      0088C4 26 0C            [ 1]  332 	jrne	00111$
      0088C6 CE 02 64         [ 2]  333 	ldw	x, _fileBlkCnt+0
      0088C9 26 07            [ 1]  334 	jrne	00111$
                                    335 ;	../src/main.c: 298: pfsm->state = S3_NXT_FILE;
      0088CB 1E 03            [ 2]  336 	ldw	x, (0x03, sp)
      0088CD A6 03            [ 1]  337 	ld	a, #0x03
      0088CF F7               [ 1]  338 	ld	(x), a
                                    339 ;	../src/main.c: 299: return;
      0088D0 20 03            [ 2]  340 	jra	00112$
      0088D2                        341 00111$:
                                    342 ;	../src/main.c: 304: pfsm->state = S0_RST; 
      0088D2 1E 03            [ 2]  343 	ldw	x, (0x03, sp)
      0088D4 7F               [ 1]  344 	clr	(x)
      0088D5                        345 00112$:
                                    346 ;	../src/main.c: 305: }
      0088D5 5B 06            [ 2]  347 	addw	sp, #6
      0088D7 81               [ 4]  348 	ret
                                    349 ;	../src/main.c: 318: static void GetNxtFileName( char * fname){
                                    350 ;	-----------------------------------------
                                    351 ;	 function GetNxtFileName
                                    352 ;	-----------------------------------------
      0088D8                        353 _GetNxtFileName:
      0088D8 52 05            [ 2]  354 	sub	sp, #5
                                    355 ;	../src/main.c: 319: uint8_t val = 0;
      0088DA 0F 01            [ 1]  356 	clr	(0x01, sp)
                                    357 ;	../src/main.c: 321: if(0x39 == fname[3]){
      0088DC 1E 08            [ 2]  358 	ldw	x, (0x08, sp)
      0088DE E6 03            [ 1]  359 	ld	a, (0x3, x)
                                    360 ;	../src/main.c: 322: val = 0x01;
      0088E0 A0 39            [ 1]  361 	sub	a, #0x39
      0088E2 26 03            [ 1]  362 	jrne	00102$
      0088E4 4C               [ 1]  363 	inc	a
      0088E5 6B 01            [ 1]  364 	ld	(0x01, sp), a
      0088E7                        365 00102$:
                                    366 ;	../src/main.c: 324: if(0x39 == fname[2]) {
      0088E7 1E 08            [ 2]  367 	ldw	x, (0x08, sp)
      0088E9 E6 02            [ 1]  368 	ld	a, (0x2, x)
      0088EB A1 39            [ 1]  369 	cp	a, #0x39
      0088ED 26 06            [ 1]  370 	jrne	00104$
                                    371 ;	../src/main.c: 325: val += 0x02;
      0088EF 7B 01            [ 1]  372 	ld	a, (0x01, sp)
      0088F1 AB 02            [ 1]  373 	add	a, #0x02
      0088F3 6B 01            [ 1]  374 	ld	(0x01, sp), a
      0088F5                        375 00104$:
                                    376 ;	../src/main.c: 327: if(0x39 == fname[1]) {
      0088F5 1E 08            [ 2]  377 	ldw	x, (0x08, sp)
      0088F7 E6 01            [ 1]  378 	ld	a, (0x1, x)
      0088F9 A1 39            [ 1]  379 	cp	a, #0x39
      0088FB 26 06            [ 1]  380 	jrne	00106$
                                    381 ;	../src/main.c: 328: val += 0x04;
      0088FD 7B 01            [ 1]  382 	ld	a, (0x01, sp)
      0088FF AB 04            [ 1]  383 	add	a, #0x04
      008901 6B 01            [ 1]  384 	ld	(0x01, sp), a
      008903                        385 00106$:
                                    386 ;	../src/main.c: 330: if(0x39 == fname[0]) {
      008903 16 08            [ 2]  387 	ldw	y, (0x08, sp)
      008905 17 02            [ 2]  388 	ldw	(0x02, sp), y
      008907 93               [ 1]  389 	ldw	x, y
      008908 F6               [ 1]  390 	ld	a, (x)
      008909 A1 39            [ 1]  391 	cp	a, #0x39
      00890B 26 06            [ 1]  392 	jrne	00108$
                                    393 ;	../src/main.c: 331: val += 0x08;
      00890D 7B 01            [ 1]  394 	ld	a, (0x01, sp)
      00890F AB 08            [ 1]  395 	add	a, #0x08
      008911 6B 01            [ 1]  396 	ld	(0x01, sp), a
      008913                        397 00108$:
                                    398 ;	../src/main.c: 335: case 0x01: fname[3] = 0x30; 
      008913 1E 02            [ 2]  399 	ldw	x, (0x02, sp)
      008915 1C 00 03         [ 2]  400 	addw	x, #0x0003
                                    401 ;	../src/main.c: 336: fname[2]++;break;
      008918 16 02            [ 2]  402 	ldw	y, (0x02, sp)
      00891A 90 5C            [ 1]  403 	incw	y
      00891C 90 5C            [ 1]  404 	incw	y
      00891E 17 04            [ 2]  405 	ldw	(0x04, sp), y
                                    406 ;	../src/main.c: 334: switch(val){
      008920 7B 01            [ 1]  407 	ld	a, (0x01, sp)
      008922 4A               [ 1]  408 	dec	a
      008923 27 18            [ 1]  409 	jreq	00109$
                                    410 ;	../src/main.c: 339: fname[1]++; break;
      008925 16 02            [ 2]  411 	ldw	y, (0x02, sp)
      008927 90 5C            [ 1]  412 	incw	y
                                    413 ;	../src/main.c: 334: switch(val){
      008929 7B 01            [ 1]  414 	ld	a, (0x01, sp)
      00892B A1 03            [ 1]  415 	cp	a, #0x03
      00892D 27 16            [ 1]  416 	jreq	00110$
      00892F 7B 01            [ 1]  417 	ld	a, (0x01, sp)
      008931 A1 07            [ 1]  418 	cp	a, #0x07
      008933 27 1C            [ 1]  419 	jreq	00111$
      008935 7B 01            [ 1]  420 	ld	a, (0x01, sp)
      008937 A1 0F            [ 1]  421 	cp	a, #0x0f
      008939 27 25            [ 1]  422 	jreq	00112$
      00893B 20 34            [ 2]  423 	jra	00113$
                                    424 ;	../src/main.c: 335: case 0x01: fname[3] = 0x30; 
      00893D                        425 00109$:
      00893D A6 30            [ 1]  426 	ld	a, #0x30
      00893F F7               [ 1]  427 	ld	(x), a
                                    428 ;	../src/main.c: 336: fname[2]++;break;
      008940 1E 04            [ 2]  429 	ldw	x, (0x04, sp)
      008942 7C               [ 1]  430 	inc	(x)
      008943 20 2D            [ 2]  431 	jra	00115$
                                    432 ;	../src/main.c: 337: case 0x03: fname[3] = 0x30; 
      008945                        433 00110$:
      008945 A6 30            [ 1]  434 	ld	a, #0x30
      008947 F7               [ 1]  435 	ld	(x), a
                                    436 ;	../src/main.c: 338: fname[2] = 0x30; 
      008948 1E 04            [ 2]  437 	ldw	x, (0x04, sp)
      00894A A6 30            [ 1]  438 	ld	a, #0x30
      00894C F7               [ 1]  439 	ld	(x), a
                                    440 ;	../src/main.c: 339: fname[1]++; break;
      00894D 90 7C            [ 1]  441 	inc	(y)
      00894F 20 21            [ 2]  442 	jra	00115$
                                    443 ;	../src/main.c: 340: case 0x07: fname[3] = 0x30; 
      008951                        444 00111$:
      008951 A6 30            [ 1]  445 	ld	a, #0x30
      008953 F7               [ 1]  446 	ld	(x), a
                                    447 ;	../src/main.c: 341: fname[2] = 0x30; 
      008954 1E 04            [ 2]  448 	ldw	x, (0x04, sp)
                                    449 ;	../src/main.c: 342: fname[1] = 0x30; 
      008956 A6 30            [ 1]  450 	ld	a, #0x30
      008958 F7               [ 1]  451 	ld	(x), a
      008959 90 F7            [ 1]  452 	ld	(y), a
                                    453 ;	../src/main.c: 343: fname[0]++; break;
      00895B 1E 02            [ 2]  454 	ldw	x, (0x02, sp)
      00895D 7C               [ 1]  455 	inc	(x)
      00895E 20 12            [ 2]  456 	jra	00115$
                                    457 ;	../src/main.c: 344: case 0x0f: fname[3] = 0x30; 
      008960                        458 00112$:
      008960 A6 30            [ 1]  459 	ld	a, #0x30
      008962 F7               [ 1]  460 	ld	(x), a
                                    461 ;	../src/main.c: 345: fname[2] = 0x30; 
      008963 1E 04            [ 2]  462 	ldw	x, (0x04, sp)
                                    463 ;	../src/main.c: 346: fname[1] = 0x30; 
      008965 A6 30            [ 1]  464 	ld	a, #0x30
      008967 F7               [ 1]  465 	ld	(x), a
      008968 90 F7            [ 1]  466 	ld	(y), a
                                    467 ;	../src/main.c: 347: fname[0] = 0x30; break;
      00896A 1E 02            [ 2]  468 	ldw	x, (0x02, sp)
      00896C A6 30            [ 1]  469 	ld	a, #0x30
      00896E F7               [ 1]  470 	ld	(x), a
      00896F 20 01            [ 2]  471 	jra	00115$
                                    472 ;	../src/main.c: 348: default: fname[3]++; break;
      008971                        473 00113$:
      008971 7C               [ 1]  474 	inc	(x)
                                    475 ;	../src/main.c: 349: }
      008972                        476 00115$:
                                    477 ;	../src/main.c: 350: }
      008972 5B 05            [ 2]  478 	addw	sp, #5
      008974 81               [ 4]  479 	ret
                                    480 ;	../src/main.c: 363: static void ConvertFileName(uint16_t firstFileName, char * fname){
                                    481 ;	-----------------------------------------
                                    482 ;	 function ConvertFileName
                                    483 ;	-----------------------------------------
      008975                        484 _ConvertFileName:
      008975 52 04            [ 2]  485 	sub	sp, #4
                                    486 ;	../src/main.c: 366: val = firstFileName/1000;
      008977 16 07            [ 2]  487 	ldw	y, (0x07, sp)
      008979 17 03            [ 2]  488 	ldw	(0x03, sp), y
      00897B 93               [ 1]  489 	ldw	x, y
      00897C 90 AE 03 E8      [ 2]  490 	ldw	y, #0x03e8
      008980 65               [ 2]  491 	divw	x, y
                                    492 ;	../src/main.c: 367: fname[0] = val + 0x30;
      008981 16 09            [ 2]  493 	ldw	y, (0x09, sp)
      008983 17 01            [ 2]  494 	ldw	(0x01, sp), y
      008985 9F               [ 1]  495 	ld	a, xl
      008986 AB 30            [ 1]  496 	add	a, #0x30
      008988 16 01            [ 2]  497 	ldw	y, (0x01, sp)
      00898A 90 F7            [ 1]  498 	ld	(y), a
                                    499 ;	../src/main.c: 368: firstFileName -=  val*1000;
      00898C 89               [ 2]  500 	pushw	x
      00898D 4B E8            [ 1]  501 	push	#0xe8
      00898F 4B 03            [ 1]  502 	push	#0x03
      008991 CD 9B 36         [ 4]  503 	call	__mulint
      008994 5B 04            [ 2]  504 	addw	sp, #4
      008996 50               [ 2]  505 	negw	x
      008997 72 FB 03         [ 2]  506 	addw	x, (0x03, sp)
                                    507 ;	../src/main.c: 369: val = firstFileName/100;
      00899A 1F 07            [ 2]  508 	ldw	(0x07, sp), x
      00899C 1F 03            [ 2]  509 	ldw	(0x03, sp), x
      00899E 90 AE 00 64      [ 2]  510 	ldw	y, #0x0064
      0089A2 65               [ 2]  511 	divw	x, y
                                    512 ;	../src/main.c: 370: fname[1] = val + 0x30;
      0089A3 16 01            [ 2]  513 	ldw	y, (0x01, sp)
      0089A5 90 5C            [ 1]  514 	incw	y
      0089A7 9F               [ 1]  515 	ld	a, xl
      0089A8 AB 30            [ 1]  516 	add	a, #0x30
      0089AA 90 F7            [ 1]  517 	ld	(y), a
                                    518 ;	../src/main.c: 371: firstFileName -=  val*100;
      0089AC 89               [ 2]  519 	pushw	x
      0089AD 4B 64            [ 1]  520 	push	#0x64
      0089AF 4B 00            [ 1]  521 	push	#0x00
      0089B1 CD 9B 36         [ 4]  522 	call	__mulint
      0089B4 5B 04            [ 2]  523 	addw	sp, #4
      0089B6 50               [ 2]  524 	negw	x
      0089B7 72 FB 03         [ 2]  525 	addw	x, (0x03, sp)
                                    526 ;	../src/main.c: 372: val = firstFileName/10;
      0089BA 1F 07            [ 2]  527 	ldw	(0x07, sp), x
      0089BC 1F 03            [ 2]  528 	ldw	(0x03, sp), x
      0089BE 90 AE 00 0A      [ 2]  529 	ldw	y, #0x000a
      0089C2 65               [ 2]  530 	divw	x, y
                                    531 ;	../src/main.c: 373: fname[2] = val + 0x30;
      0089C3 16 01            [ 2]  532 	ldw	y, (0x01, sp)
      0089C5 72 A9 00 02      [ 2]  533 	addw	y, #0x0002
      0089C9 9F               [ 1]  534 	ld	a, xl
      0089CA AB 30            [ 1]  535 	add	a, #0x30
      0089CC 90 F7            [ 1]  536 	ld	(y), a
                                    537 ;	../src/main.c: 374: firstFileName -=  val*10;
      0089CE 89               [ 2]  538 	pushw	x
      0089CF 58               [ 2]  539 	sllw	x
      0089D0 58               [ 2]  540 	sllw	x
      0089D1 72 FB 01         [ 2]  541 	addw	x, (1, sp)
      0089D4 58               [ 2]  542 	sllw	x
      0089D5 5B 02            [ 2]  543 	addw	sp, #2
      0089D7 50               [ 2]  544 	negw	x
      0089D8 72 FB 03         [ 2]  545 	addw	x, (0x03, sp)
      0089DB 1F 07            [ 2]  546 	ldw	(0x07, sp), x
                                    547 ;	../src/main.c: 375: fname[3] = firstFileName + 0x30;
      0089DD 1E 01            [ 2]  548 	ldw	x, (0x01, sp)
      0089DF 1C 00 03         [ 2]  549 	addw	x, #0x0003
      0089E2 7B 08            [ 1]  550 	ld	a, (0x08, sp)
      0089E4 AB 30            [ 1]  551 	add	a, #0x30
      0089E6 F7               [ 1]  552 	ld	(x), a
                                    553 ;	../src/main.c: 376: fname[4] = '\0';
      0089E7 1E 01            [ 2]  554 	ldw	x, (0x01, sp)
      0089E9 6F 04            [ 1]  555 	clr	(0x0004, x)
                                    556 ;	../src/main.c: 377: }
      0089EB 5B 04            [ 2]  557 	addw	sp, #4
      0089ED 81               [ 4]  558 	ret
                                    559 ;	../src/main.c: 392: static UINT GetCfg( uint8_t * pCfgBuf,  cfg_t * pcfg){
                                    560 ;	-----------------------------------------
                                    561 ;	 function GetCfg
                                    562 ;	-----------------------------------------
      0089EE                        563 _GetCfg:
      0089EE 52 12            [ 2]  564 	sub	sp, #18
                                    565 ;	../src/main.c: 395: if(!IsValidCfgBuf(pCfgBuf)) return 1; 
      0089F0 1E 15            [ 2]  566 	ldw	x, (0x15, sp)
      0089F2 89               [ 2]  567 	pushw	x
      0089F3 CD 8A F1         [ 4]  568 	call	_IsValidCfgBuf
      0089F6 85               [ 2]  569 	popw	x
      0089F7 6B 12            [ 1]  570 	ld	(0x12, sp), a
      0089F9 26 05            [ 1]  571 	jrne	00102$
      0089FB 5F               [ 1]  572 	clrw	x
      0089FC 5C               [ 1]  573 	incw	x
      0089FD CC 8A EE         [ 2]  574 	jp	00106$
      008A00                        575 00102$:
                                    576 ;	../src/main.c: 398: pcfg->sampFreq = pCfgBuf[0]+(((uint16_t)pCfgBuf[1])<<8);
      008A00 16 17            [ 2]  577 	ldw	y, (0x17, sp)
      008A02 17 01            [ 2]  578 	ldw	(0x01, sp), y
      008A04 16 15            [ 2]  579 	ldw	y, (0x15, sp)
      008A06 17 03            [ 2]  580 	ldw	(0x03, sp), y
      008A08 93               [ 1]  581 	ldw	x, y
      008A09 F6               [ 1]  582 	ld	a, (x)
      008A0A 5F               [ 1]  583 	clrw	x
      008A0B 97               [ 1]  584 	ld	xl, a
      008A0C 16 03            [ 2]  585 	ldw	y, (0x03, sp)
      008A0E 90 E6 01         [ 1]  586 	ld	a, (0x1, y)
      008A11 90 95            [ 1]  587 	ld	yh, a
      008A13 4F               [ 1]  588 	clr	a
      008A14 1F 11            [ 2]  589 	ldw	(0x11, sp), x
      008A16 90 97            [ 1]  590 	ld	yl, a
      008A18 72 F9 11         [ 2]  591 	addw	y, (0x11, sp)
      008A1B 1E 01            [ 2]  592 	ldw	x, (0x01, sp)
      008A1D FF               [ 2]  593 	ldw	(x), y
                                    594 ;	../src/main.c: 400: fID = pCfgBuf[2]+(((uint16_t)pCfgBuf[3])<<8);
      008A1E 1E 03            [ 2]  595 	ldw	x, (0x03, sp)
      008A20 E6 02            [ 1]  596 	ld	a, (0x2, x)
      008A22 90 5F            [ 1]  597 	clrw	y
      008A24 90 97            [ 1]  598 	ld	yl, a
      008A26 1E 03            [ 2]  599 	ldw	x, (0x03, sp)
      008A28 E6 03            [ 1]  600 	ld	a, (0x3, x)
      008A2A 95               [ 1]  601 	ld	xh, a
      008A2B 4F               [ 1]  602 	clr	a
      008A2C 17 11            [ 2]  603 	ldw	(0x11, sp), y
      008A2E 97               [ 1]  604 	ld	xl, a
      008A2F 72 FB 11         [ 2]  605 	addw	x, (0x11, sp)
                                    606 ;	../src/main.c: 402: ConvertFileName(fID, pcfg->firstFileName);
      008A32 16 01            [ 2]  607 	ldw	y, (0x01, sp)
      008A34 72 A9 00 02      [ 2]  608 	addw	y, #0x0002
      008A38 90 89            [ 2]  609 	pushw	y
      008A3A 89               [ 2]  610 	pushw	x
      008A3B CD 89 75         [ 4]  611 	call	_ConvertFileName
      008A3E 5B 04            [ 2]  612 	addw	sp, #4
                                    613 ;	../src/main.c: 403: pcfg->fileNo = pCfgBuf[4]+(((uint16_t)pCfgBuf[5])<<8);
      008A40 16 01            [ 2]  614 	ldw	y, (0x01, sp)
      008A42 72 A9 00 0B      [ 2]  615 	addw	y, #0x000b
      008A46 1E 03            [ 2]  616 	ldw	x, (0x03, sp)
      008A48 E6 04            [ 1]  617 	ld	a, (0x4, x)
      008A4A 6B 10            [ 1]  618 	ld	(0x10, sp), a
      008A4C 0F 0F            [ 1]  619 	clr	(0x0f, sp)
      008A4E 1E 03            [ 2]  620 	ldw	x, (0x03, sp)
      008A50 E6 05            [ 1]  621 	ld	a, (0x5, x)
      008A52 6B 11            [ 1]  622 	ld	(0x11, sp), a
      008A54 0F 12            [ 1]  623 	clr	(0x12, sp)
      008A56 1E 0F            [ 2]  624 	ldw	x, (0x0f, sp)
      008A58 72 FB 11         [ 2]  625 	addw	x, (0x11, sp)
      008A5B 90 FF            [ 2]  626 	ldw	(y), x
                                    627 ;	../src/main.c: 404: pcfg->fileSzInBlock = pCfgBuf[6]+ \
      008A5D 1E 01            [ 2]  628 	ldw	x, (0x01, sp)
      008A5F 1C 00 07         [ 2]  629 	addw	x, #0x0007
      008A62 1F 05            [ 2]  630 	ldw	(0x05, sp), x
      008A64 1E 03            [ 2]  631 	ldw	x, (0x03, sp)
      008A66 E6 06            [ 1]  632 	ld	a, (0x6, x)
      008A68 90 97            [ 1]  633 	ld	yl, a
      008A6A 1E 03            [ 2]  634 	ldw	x, (0x03, sp)
      008A6C E6 07            [ 1]  635 	ld	a, (0x7, x)
      008A6E 0F 11            [ 1]  636 	clr	(0x11, sp)
      008A70 5F               [ 1]  637 	clrw	x
      008A71 95               [ 1]  638 	ld	xh, a
      008A72 7B 11            [ 1]  639 	ld	a, (0x11, sp)
      008A74 0F 0A            [ 1]  640 	clr	(0x0a, sp)
      008A76 0F 11            [ 1]  641 	clr	(0x11, sp)
      008A78 0F 10            [ 1]  642 	clr	(0x10, sp)
      008A7A 0F 0F            [ 1]  643 	clr	(0x0f, sp)
      008A7C 88               [ 1]  644 	push	a
      008A7D 90 9F            [ 1]  645 	ld	a, yl
      008A7F 1B 0B            [ 1]  646 	add	a, (0x0b, sp)
      008A81 90 97            [ 1]  647 	ld	yl, a
      008A83 9E               [ 1]  648 	ld	a, xh
      008A84 19 12            [ 1]  649 	adc	a, (0x12, sp)
      008A86 90 95            [ 1]  650 	ld	yh, a
      008A88 84               [ 1]  651 	pop	a
      008A89 19 10            [ 1]  652 	adc	a, (0x10, sp)
      008A8B 6B 0C            [ 1]  653 	ld	(0x0c, sp), a
      008A8D 9F               [ 1]  654 	ld	a, xl
      008A8E 19 0F            [ 1]  655 	adc	a, (0x0f, sp)
      008A90 6B 0B            [ 1]  656 	ld	(0x0b, sp), a
      008A92 1E 03            [ 2]  657 	ldw	x, (0x03, sp)
      008A94 E6 08            [ 1]  658 	ld	a, (0x8, x)
      008A96 5F               [ 1]  659 	clrw	x
      008A97 0F 0F            [ 1]  660 	clr	(0x0f, sp)
      008A99 0F 12            [ 1]  661 	clr	(0x12, sp)
      008A9B 0F 11            [ 1]  662 	clr	(0x11, sp)
      008A9D 72 F9 11         [ 2]  663 	addw	y, (0x11, sp)
      008AA0 19 0C            [ 1]  664 	adc	a, (0x0c, sp)
      008AA2 6B 08            [ 1]  665 	ld	(0x08, sp), a
      008AA4 9F               [ 1]  666 	ld	a, xl
      008AA5 19 0B            [ 1]  667 	adc	a, (0x0b, sp)
      008AA7 6B 07            [ 1]  668 	ld	(0x07, sp), a
      008AA9 1E 03            [ 2]  669 	ldw	x, (0x03, sp)
      008AAB E6 09            [ 1]  670 	ld	a, (0x9, x)
      008AAD 0F 0F            [ 1]  671 	clr	(0x0f, sp)
      008AAF 0F 0E            [ 1]  672 	clr	(0x0e, sp)
      008AB1 5F               [ 1]  673 	clrw	x
      008AB2 88               [ 1]  674 	push	a
      008AB3 90 9F            [ 1]  675 	ld	a, yl
      008AB5 1B 0F            [ 1]  676 	add	a, (0x0f, sp)
      008AB7 90 02            [ 1]  677 	rlwa	y
      008AB9 89               [ 2]  678 	pushw	x
      008ABA 19 02            [ 1]  679 	adc	a, (2, sp)
      008ABC 85               [ 2]  680 	popw	x
      008ABD 90 95            [ 1]  681 	ld	yh, a
      008ABF 9E               [ 1]  682 	ld	a, xh
      008AC0 19 09            [ 1]  683 	adc	a, (0x09, sp)
      008AC2 6B 11            [ 1]  684 	ld	(0x11, sp), a
      008AC4 84               [ 1]  685 	pop	a
      008AC5 19 07            [ 1]  686 	adc	a, (0x07, sp)
      008AC7 6B 0F            [ 1]  687 	ld	(0x0f, sp), a
      008AC9 1E 05            [ 2]  688 	ldw	x, (0x05, sp)
      008ACB EF 02            [ 2]  689 	ldw	(0x2, x), y
      008ACD 16 0F            [ 2]  690 	ldw	y, (0x0f, sp)
      008ACF FF               [ 2]  691 	ldw	(x), y
                                    692 ;	../src/main.c: 408: pcfg->channel = pCfgBuf[10];
      008AD0 1E 01            [ 2]  693 	ldw	x, (0x01, sp)
      008AD2 1C 00 0D         [ 2]  694 	addw	x, #0x000d
      008AD5 16 03            [ 2]  695 	ldw	y, (0x03, sp)
      008AD7 90 E6 0A         [ 1]  696 	ld	a, (0xa, y)
      008ADA F7               [ 1]  697 	ld	(x), a
                                    698 ;	../src/main.c: 409: if(pCfgBuf[11] == 0)
      008ADB 1E 03            [ 2]  699 	ldw	x, (0x03, sp)
      008ADD E6 0B            [ 1]  700 	ld	a, (0xb, x)
                                    701 ;	../src/main.c: 411: pcfg->isFullResultion = false;
      008ADF 1E 01            [ 2]  702 	ldw	x, (0x01, sp)
      008AE1 1C 00 0E         [ 2]  703 	addw	x, #0x000e
                                    704 ;	../src/main.c: 409: if(pCfgBuf[11] == 0)
      008AE4 4D               [ 1]  705 	tnz	a
      008AE5 26 03            [ 1]  706 	jrne	00104$
                                    707 ;	../src/main.c: 411: pcfg->isFullResultion = false;
      008AE7 7F               [ 1]  708 	clr	(x)
      008AE8 20 03            [ 2]  709 	jra	00105$
      008AEA                        710 00104$:
                                    711 ;	../src/main.c: 413: pcfg->isFullResultion = true;
      008AEA A6 01            [ 1]  712 	ld	a, #0x01
      008AEC F7               [ 1]  713 	ld	(x), a
      008AED                        714 00105$:
                                    715 ;	../src/main.c: 416: return 0x0;
      008AED 5F               [ 1]  716 	clrw	x
      008AEE                        717 00106$:
                                    718 ;	../src/main.c: 417: }
      008AEE 5B 12            [ 2]  719 	addw	sp, #18
      008AF0 81               [ 4]  720 	ret
                                    721 ;	../src/main.c: 431: static uint8_t IsValidCfgBuf(uint8_t *pCfgBuf){
                                    722 ;	-----------------------------------------
                                    723 ;	 function IsValidCfgBuf
                                    724 ;	-----------------------------------------
      008AF1                        725 _IsValidCfgBuf:
      008AF1 88               [ 1]  726 	push	a
                                    727 ;	../src/main.c: 432: uint8_t crc = 0;
      008AF2 0F 01            [ 1]  728 	clr	(0x01, sp)
                                    729 ;	../src/main.c: 440: return false;	
      008AF4 5F               [ 1]  730 	clrw	x
      008AF5                        731 00105$:
                                    732 ;	../src/main.c: 434: for(; i < CFG_BUF_SZ - 1; i++){
      008AF5 A3 00 0C         [ 2]  733 	cpw	x, #0x000c
      008AF8 2E 0E            [ 1]  734 	jrsge	00101$
                                    735 ;	../src/main.c: 435: crc += pCfgBuf[i];		
      008AFA 90 93            [ 1]  736 	ldw	y, x
      008AFC 72 F9 04         [ 2]  737 	addw	y, (0x04, sp)
      008AFF 90 F6            [ 1]  738 	ld	a, (y)
      008B01 1B 01            [ 1]  739 	add	a, (0x01, sp)
      008B03 6B 01            [ 1]  740 	ld	(0x01, sp), a
                                    741 ;	../src/main.c: 434: for(; i < CFG_BUF_SZ - 1; i++){
      008B05 5C               [ 1]  742 	incw	x
      008B06 20 ED            [ 2]  743 	jra	00105$
      008B08                        744 00101$:
                                    745 ;	../src/main.c: 437: if(crc == pCfgBuf[CFG_BUF_SZ-1])
      008B08 1E 04            [ 2]  746 	ldw	x, (0x04, sp)
      008B0A E6 0C            [ 1]  747 	ld	a, (0xc, x)
                                    748 ;	../src/main.c: 438: return true;
      008B0C 10 01            [ 1]  749 	sub	a, (0x01, sp)
      008B0E 26 02            [ 1]  750 	jrne	00103$
      008B10 4C               [ 1]  751 	inc	a
                                    752 ;	../src/main.c: 440: return false;	
      008B11 21                     753 	.byte 0x21
      008B12                        754 00103$:
      008B12 4F               [ 1]  755 	clr	a
      008B13                        756 00107$:
                                    757 ;	../src/main.c: 441: }
      008B13 5B 01            [ 2]  758 	addw	sp, #1
      008B15 81               [ 4]  759 	ret
                                    760 ;	../src/main.c: 450: static void clkInit( void )
                                    761 ;	-----------------------------------------
                                    762 ;	 function clkInit
                                    763 ;	-----------------------------------------
      008B16                        764 _clkInit:
                                    765 ;	../src/main.c: 453: CLK->CKDIVR = 0;//(CLK_PRESCALER_HSIDIV1|CLK_PRESCALER_CPUDIV1);
      008B16 35 00 50 C6      [ 1]  766 	mov	0x50c6+0, #0x00
                                    767 ;	../src/main.c: 461: CLK->PCKENR1 |= (CLK_PCKENR1_TIM4|CLK_PCKENR1_SPI|CLK_PCKENR1_UART1);
      008B1A C6 50 C7         [ 1]  768 	ld	a, 0x50c7
      008B1D AA 16            [ 1]  769 	or	a, #0x16
      008B1F C7 50 C7         [ 1]  770 	ld	0x50c7, a
                                    771 ;	../src/main.c: 462: CLK->PCKENR2 |= (CLK_PCKENR2_ADC);
      008B22 72 16 50 CA      [ 1]  772 	bset	20682, #3
                                    773 ;	../src/main.c: 463: }
      008B26 81               [ 4]  774 	ret
                                    775 ;	../src/main.c: 478: void assert_failed(uint8_t* file, uint32_t line)
                                    776 ;	-----------------------------------------
                                    777 ;	 function assert_failed
                                    778 ;	-----------------------------------------
      008B27                        779 _assert_failed:
                                    780 ;	../src/main.c: 484: while (1)
      008B27                        781 00102$:
      008B27 20 FE            [ 2]  782 	jra	00102$
                                    783 ;	../src/main.c: 487: }
      008B29 81               [ 4]  784 	ret
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
