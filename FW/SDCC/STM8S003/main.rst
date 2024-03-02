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
                                     15 	.globl _pf_read
                                     16 	.globl _pf_open
                                     17 	.globl _pf_mount
                                     18 	.globl _adcInit
                                     19 	.globl _dly
                                     20 	.globl _sysTickInit
                                     21 	.globl _loggerCfg
                                     22 	.globl _assert_failed
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area DATA
      000245                         27 _cfg:
      000245                         28 	.ds 13
      000252                         29 _loggerCfg::
      000252                         30 	.ds 15
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area INITIALIZED
      000263                         35 _blkCnt:
      000263                         36 	.ds 1
      000264                         37 _fileBlkCnt:
      000264                         38 	.ds 4
      000268                         39 _fileNoCnt:
      000268                         40 	.ds 2
                                     41 ;--------------------------------------------------------
                                     42 ; Stack segment in internal ram 
                                     43 ;--------------------------------------------------------
                                     44 	.area	SSEG
      009D0C                         45 __start__stack:
      009D0C                         46 	.ds	1
                                     47 
                                     48 ;--------------------------------------------------------
                                     49 ; absolute external ram data
                                     50 ;--------------------------------------------------------
                                     51 	.area DABS (ABS)
                                     52 
                                     53 ; default segment ordering for linker
                                     54 	.area HOME
                                     55 	.area GSINIT
                                     56 	.area GSFINAL
                                     57 	.area CONST
                                     58 	.area INITIALIZER
                                     59 	.area CODE
                                     60 
                                     61 ;--------------------------------------------------------
                                     62 ; interrupt vector 
                                     63 ;--------------------------------------------------------
                                     64 	.area HOME
      008000                         65 __interrupt_vect:
      008000 82 00 80 6F             66 	int s_GSINIT ; reset
      008004 82 00 9C 01             67 	int _TRAP_IRQHandler ; trap
      008008 82 00 9C 02             68 	int _TLI_IRQHandler ; int0
      00800C 82 00 9C 03             69 	int _AWU_IRQHandler ; int1
      008010 82 00 9C 04             70 	int _CLK_IRQHandler ; int2
      008014 82 00 9C 05             71 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 9C 06             72 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 9C 07             73 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 9C 08             74 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 9C 09             75 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             76 	int 0x000000 ; int8
      00802C 82 00 00 00             77 	int 0x000000 ; int9
      008030 82 00 9C 0A             78 	int _SPI_IRQHandler ; int10
      008034 82 00 9C 0B             79 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 9C 0C             80 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 9C 0D             81 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 9C 0E             82 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 00 00             83 	int 0x000000 ; int15
      008048 82 00 00 00             84 	int 0x000000 ; int16
      00804C 82 00 9C 0F             85 	int _UART1_TX_IRQHandler ; int17
      008050 82 00 9C 10             86 	int _UART1_RX_IRQHandler ; int18
      008054 82 00 9C 11             87 	int _I2C_IRQHandler ; int19
      008058 82 00 00 00             88 	int 0x000000 ; int20
      00805C 82 00 00 00             89 	int 0x000000 ; int21
      008060 82 00 9C 12             90 	int _ADC1_IRQHandler ; int22
      008064 82 00 9C 17             91 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 9C 1C             92 	int _EEPROM_EEC_IRQHandler ; int24
                                     93 ;--------------------------------------------------------
                                     94 ; global & static initialisations
                                     95 ;--------------------------------------------------------
                                     96 	.area HOME
                                     97 	.area GSINIT
                                     98 	.area GSFINAL
                                     99 	.area GSINIT
      008085                        100 __sdcc_init_data:
                                    101 ; stm8_genXINIT() start
      008085 AE 02 62         [ 2]  102 	ldw x, #l_DATA
      008088 27 07            [ 1]  103 	jreq	00002$
      00808A                        104 00001$:
      00808A 72 4F 00 00      [ 1]  105 	clr (s_DATA - 1, x)
      00808E 5A               [ 2]  106 	decw x
      00808F 26 F9            [ 1]  107 	jrne	00001$
      008091                        108 00002$:
      008091 AE 00 07         [ 2]  109 	ldw	x, #l_INITIALIZER
      008094 27 09            [ 1]  110 	jreq	00004$
      008096                        111 00003$:
      008096 D6 81 05         [ 1]  112 	ld	a, (s_INITIALIZER - 1, x)
      008099 D7 02 62         [ 1]  113 	ld	(s_INITIALIZED - 1, x), a
      00809C 5A               [ 2]  114 	decw	x
      00809D 26 F7            [ 1]  115 	jrne	00003$
      00809F                        116 00004$:
                                    117 ; stm8_genXINIT() end
                                    118 	.area GSFINAL
      00809F CC 80 6C         [ 2]  119 	jp	__sdcc_program_startup
                                    120 ;--------------------------------------------------------
                                    121 ; Home
                                    122 ;--------------------------------------------------------
                                    123 	.area HOME
                                    124 	.area HOME
      00806C                        125 __sdcc_program_startup:
      00806C CC 87 A9         [ 2]  126 	jp	_main
                                    127 ;	return from main will return to caller
                                    128 ;--------------------------------------------------------
                                    129 ; code
                                    130 ;--------------------------------------------------------
                                    131 	.area CODE
                                    132 ;	../src/main.c: 100: void main( void )
                                    133 ;	-----------------------------------------
                                    134 ;	 function main
                                    135 ;	-----------------------------------------
      0087A9                        136 _main:
      0087A9 52 34            [ 2]  137 	sub	sp, #52
                                    138 ;	../src/main.c: 110: clkInit();
      0087AB CD 8B F9         [ 4]  139 	call	_clkInit
                                    140 ;	../src/main.c: 111: LedMatrixInit();
      0087AE CD 84 F2         [ 4]  141 	call	_LedMatrixInit
                                    142 ;	../src/main.c: 112: sysTickInit();
      0087B1 CD 84 9A         [ 4]  143 	call	_sysTickInit
                                    144 ;	../src/main.c: 115: enableInterrupts();
      0087B4 9A               [ 1]  145 	rim
                                    146 ;	../src/main.c: 117: SetLedMode(0, LED_ON);
      0087B5 4B 03            [ 1]  147 	push	#0x03
      0087B7 4B 00            [ 1]  148 	push	#0x00
      0087B9 CD 84 F5         [ 4]  149 	call	_SetLedMode
      0087BC 85               [ 2]  150 	popw	x
                                    151 ;	../src/main.c: 118: dly(100000);
      0087BD 4B A0            [ 1]  152 	push	#0xa0
      0087BF 4B 86            [ 1]  153 	push	#0x86
      0087C1 4B 01            [ 1]  154 	push	#0x01
      0087C3 4B 00            [ 1]  155 	push	#0x00
      0087C5 CD 84 B9         [ 4]  156 	call	_dly
      0087C8 5B 04            [ 2]  157 	addw	sp, #4
                                    158 ;	../src/main.c: 124: res |= pf_mount(&fid);	
      0087CA 96               [ 1]  159 	ldw	x, sp
      0087CB 1C 00 03         [ 2]  160 	addw	x, #3
      0087CE 89               [ 2]  161 	pushw	x
      0087CF CD 94 C5         [ 4]  162 	call	_pf_mount
      0087D2 85               [ 2]  163 	popw	x
      0087D3 6B 34            [ 1]  164 	ld	(0x34, sp), a
                                    165 ;	../src/main.c: 125: res |= pf_open("CFG");
      0087D5 4B 02            [ 1]  166 	push	#<(___str_0+0)
      0087D7 4B 81            [ 1]  167 	push	#((___str_0+0) >> 8)
      0087D9 CD 97 13         [ 4]  168 	call	_pf_open
      0087DC 85               [ 2]  169 	popw	x
      0087DD 1A 34            [ 1]  170 	or	a, (0x34, sp)
      0087DF 6B 34            [ 1]  171 	ld	(0x34, sp), a
                                    172 ;	../src/main.c: 126: res |= pf_read(cfg, 13 , &pbr);
      0087E1 96               [ 1]  173 	ldw	x, sp
      0087E2 5C               [ 1]  174 	incw	x
      0087E3 89               [ 2]  175 	pushw	x
      0087E4 4B 0D            [ 1]  176 	push	#0x0d
      0087E6 4B 00            [ 1]  177 	push	#0x00
      0087E8 4B 45            [ 1]  178 	push	#<(_cfg+0)
      0087EA 4B 02            [ 1]  179 	push	#((_cfg+0) >> 8)
      0087EC CD 97 A4         [ 4]  180 	call	_pf_read
      0087EF 5B 06            [ 2]  181 	addw	sp, #6
      0087F1 1A 34            [ 1]  182 	or	a, (0x34, sp)
      0087F3 6B 34            [ 1]  183 	ld	(0x34, sp), a
                                    184 ;	../src/main.c: 128: res |= GetCfg(cfg, &loggerCfg);
      0087F5 4B 52            [ 1]  185 	push	#<(_loggerCfg+0)
      0087F7 4B 02            [ 1]  186 	push	#((_loggerCfg+0) >> 8)
      0087F9 4B 45            [ 1]  187 	push	#<(_cfg+0)
      0087FB 4B 02            [ 1]  188 	push	#((_cfg+0) >> 8)
      0087FD CD 8A D1         [ 4]  189 	call	_GetCfg
      008800 5B 04            [ 2]  190 	addw	sp, #4
      008802 9F               [ 1]  191 	ld	a, xl
      008803 1A 34            [ 1]  192 	or	a, (0x34, sp)
      008805 6B 30            [ 1]  193 	ld	(0x30, sp), a
                                    194 ;	../src/main.c: 132: fileBlkCnt = loggerCfg.fileSzInBlock;
      008807 AE 02 59         [ 2]  195 	ldw	x, #(_loggerCfg+0)+7
      00880A 1F 31            [ 2]  196 	ldw	(0x31, sp), x
                                    197 ;	../src/main.c: 136: res |= pf_open(loggerCfg.firstFileName);
      00880C AE 02 54         [ 2]  198 	ldw	x, #(_loggerCfg+0)+2
      00880F 1F 33            [ 2]  199 	ldw	(0x33, sp), x
                                    200 ;	../src/main.c: 130: if(FR_OK == res){
      008811 0D 30            [ 1]  201 	tnz	(0x30, sp)
      008813 26 45            [ 1]  202 	jrne	00105$
                                    203 ;	../src/main.c: 132: fileBlkCnt = loggerCfg.fileSzInBlock;
      008815 1E 31            [ 2]  204 	ldw	x, (0x31, sp)
      008817 90 93            [ 1]  205 	ldw	y, x
      008819 90 EE 02         [ 2]  206 	ldw	y, (0x2, y)
      00881C FE               [ 2]  207 	ldw	x, (x)
      00881D 90 CF 02 66      [ 2]  208 	ldw	_fileBlkCnt+2, y
      008821 CF 02 64         [ 2]  209 	ldw	_fileBlkCnt+0, x
                                    210 ;	../src/main.c: 133: fileNoCnt = loggerCfg.fileNo;
      008824 CE 02 5D         [ 2]  211 	ldw	x, _loggerCfg+11
      008827 CF 02 68         [ 2]  212 	ldw	_fileNoCnt+0, x
                                    213 ;	../src/main.c: 134: SetLedMode(1, LED_ON);
      00882A 4B 03            [ 1]  214 	push	#0x03
      00882C 4B 01            [ 1]  215 	push	#0x01
      00882E CD 84 F5         [ 4]  216 	call	_SetLedMode
      008831 85               [ 2]  217 	popw	x
                                    218 ;	../src/main.c: 136: res |= pf_open(loggerCfg.firstFileName);
      008832 1E 33            [ 2]  219 	ldw	x, (0x33, sp)
      008834 89               [ 2]  220 	pushw	x
      008835 CD 97 13         [ 4]  221 	call	_pf_open
      008838 85               [ 2]  222 	popw	x
                                    223 ;	../src/main.c: 138: if(FR_OK == res){
      008839 1A 30            [ 1]  224 	or	a, (0x30, sp)
      00883B 26 06            [ 1]  225 	jrne	00102$
                                    226 ;	../src/main.c: 141: fsm.state = S0_RST;
      00883D 0F 2D            [ 1]  227 	clr	(0x2d, sp)
                                    228 ;	../src/main.c: 142: fsm.error = NO_ERR;
      00883F 0F 2E            [ 1]  229 	clr	(0x2e, sp)
      008841 20 10            [ 2]  230 	jra	00103$
      008843                        231 00102$:
                                    232 ;	../src/main.c: 145: fsm.state = S4_ERR;
      008843 A6 04            [ 1]  233 	ld	a, #0x04
      008845 6B 2D            [ 1]  234 	ld	(0x2d, sp), a
                                    235 ;	../src/main.c: 146: fsm.error = ERR_CARD_INIT;
      008847 A6 01            [ 1]  236 	ld	a, #0x01
      008849 6B 2E            [ 1]  237 	ld	(0x2e, sp), a
                                    238 ;	../src/main.c: 147: SetLedMode(1, LED_TOGGLE_FAST);
      00884B 4B 02            [ 1]  239 	push	#0x02
      00884D 4B 01            [ 1]  240 	push	#0x01
      00884F CD 84 F5         [ 4]  241 	call	_SetLedMode
      008852 85               [ 2]  242 	popw	x
      008853                        243 00103$:
                                    244 ;	../src/main.c: 150: disableInterrupts();
      008853 9B               [ 1]  245 	sim
                                    246 ;	../src/main.c: 151: adcInit();
      008854 CD 81 5C         [ 4]  247 	call	_adcInit
                                    248 ;	../src/main.c: 153: enableInterrupts();
      008857 9A               [ 1]  249 	rim
      008858 20 08            [ 2]  250 	jra	00106$
      00885A                        251 00105$:
                                    252 ;	../src/main.c: 156: fsm.state = S4_ERR;
      00885A A6 04            [ 1]  253 	ld	a, #0x04
      00885C 6B 2D            [ 1]  254 	ld	(0x2d, sp), a
                                    255 ;	../src/main.c: 157: fsm.error = ERR_CARD_INIT;
      00885E A6 01            [ 1]  256 	ld	a, #0x01
      008860 6B 2E            [ 1]  257 	ld	(0x2e, sp), a
      008862                        258 00106$:
                                    259 ;	../src/main.c: 159: SetLedMode(0, LED_TOGGLE_SLOW);
      008862 4B 01            [ 1]  260 	push	#0x01
      008864 4B 00            [ 1]  261 	push	#0x00
      008866 CD 84 F5         [ 4]  262 	call	_SetLedMode
      008869 85               [ 2]  263 	popw	x
                                    264 ;	../src/main.c: 161: while(1){
      00886A 16 31            [ 2]  265 	ldw	y, (0x31, sp)
      00886C 17 2F            [ 2]  266 	ldw	(0x2f, sp), y
      00886E 16 33            [ 2]  267 	ldw	y, (0x33, sp)
      008870 17 31            [ 2]  268 	ldw	(0x31, sp), y
      008872                        269 00137$:
                                    270 ;	../src/main.c: 166: switch (fsm.state){
      008872 7B 2D            [ 1]  271 	ld	a, (0x2d, sp)
      008874 A1 06            [ 1]  272 	cp	a, #0x06
      008876 22 FA            [ 1]  273 	jrugt	00137$
      008878 5F               [ 1]  274 	clrw	x
      008879 97               [ 1]  275 	ld	xl, a
      00887A 58               [ 2]  276 	sllw	x
      00887B DE 88 7F         [ 2]  277 	ldw	x, (#00199$, x)
      00887E FC               [ 2]  278 	jp	(x)
      00887F                        279 00199$:
      00887F 88 8D                  280 	.dw	#00107$
      008881 88 B8                  281 	.dw	#00117$
      008883 88 B8                  282 	.dw	#00117$
      008885 88 C3                  283 	.dw	#00118$
      008887 88 FF                  284 	.dw	#00125$
      008889 89 09                  285 	.dw	#00129$
      00888B 88 72                  286 	.dw	#00137$
                                    287 ;	../src/main.c: 167: case S0_RST:
      00888D                        288 00107$:
                                    289 ;	../src/main.c: 170: if( 0x3 == buffer_rdy ){
      00888D C6 00 01         [ 1]  290 	ld	a, _buffer_rdy+0
      008890 A1 03            [ 1]  291 	cp	a, #0x03
      008892 26 0B            [ 1]  292 	jrne	00114$
                                    293 ;	../src/main.c: 173: fsm.state = S4_ERR;
      008894 A6 04            [ 1]  294 	ld	a, #0x04
      008896 6B 2D            [ 1]  295 	ld	(0x2d, sp), a
                                    296 ;	../src/main.c: 174: fsm.error = ERR_BUFF_OVERLAP;
      008898 96               [ 1]  297 	ldw	x, sp
      008899 A6 05            [ 1]  298 	ld	a, #0x05
      00889B E7 2E            [ 1]  299 	ld	(46, x), a
      00889D 20 D3            [ 2]  300 	jra	00137$
      00889F                        301 00114$:
                                    302 ;	../src/main.c: 175: } else if (0x01 == buffer_rdy) {
      00889F C6 00 01         [ 1]  303 	ld	a, _buffer_rdy+0
      0088A2 4A               [ 1]  304 	dec	a
      0088A3 26 06            [ 1]  305 	jrne	00111$
                                    306 ;	../src/main.c: 177: fsm.state = S1_WR_BUF0;
      0088A5 A6 01            [ 1]  307 	ld	a, #0x01
      0088A7 6B 2D            [ 1]  308 	ld	(0x2d, sp), a
      0088A9 20 C7            [ 2]  309 	jra	00137$
      0088AB                        310 00111$:
                                    311 ;	../src/main.c: 178: } else if ( 0x02 == buffer_rdy) {
      0088AB C6 00 01         [ 1]  312 	ld	a, _buffer_rdy+0
      0088AE A1 02            [ 1]  313 	cp	a, #0x02
      0088B0 26 C0            [ 1]  314 	jrne	00137$
                                    315 ;	../src/main.c: 180: fsm.state = S2_WR_BUF1;
      0088B2 A6 02            [ 1]  316 	ld	a, #0x02
      0088B4 6B 2D            [ 1]  317 	ld	(0x2d, sp), a
                                    318 ;	../src/main.c: 182: break;
      0088B6 20 BA            [ 2]  319 	jra	00137$
                                    320 ;	../src/main.c: 184: case S2_WR_BUF1:
      0088B8                        321 00117$:
                                    322 ;	../src/main.c: 186: Wr2SD(&fsm);
      0088B8 96               [ 1]  323 	ldw	x, sp
      0088B9 1C 00 2D         [ 2]  324 	addw	x, #45
      0088BC 89               [ 2]  325 	pushw	x
      0088BD CD 89 16         [ 4]  326 	call	_Wr2SD
      0088C0 85               [ 2]  327 	popw	x
                                    328 ;	../src/main.c: 187: break;
      0088C1 20 AF            [ 2]  329 	jra	00137$
                                    330 ;	../src/main.c: 188: case S3_NXT_FILE:
      0088C3                        331 00118$:
                                    332 ;	../src/main.c: 189: fileBlkCnt = loggerCfg.fileSzInBlock;
      0088C3 1E 2F            [ 2]  333 	ldw	x, (0x2f, sp)
      0088C5 90 93            [ 1]  334 	ldw	y, x
      0088C7 90 EE 02         [ 2]  335 	ldw	y, (0x2, y)
      0088CA FE               [ 2]  336 	ldw	x, (x)
      0088CB 90 CF 02 66      [ 2]  337 	ldw	_fileBlkCnt+2, y
      0088CF CF 02 64         [ 2]  338 	ldw	_fileBlkCnt+0, x
                                    339 ;	../src/main.c: 191: if(--fileNoCnt != 0){
      0088D2 CE 02 68         [ 2]  340 	ldw	x, _fileNoCnt+0
      0088D5 5A               [ 2]  341 	decw	x
      0088D6 CF 02 68         [ 2]  342 	ldw	_fileNoCnt+0, x
      0088D9 27 1D            [ 1]  343 	jreq	00123$
                                    344 ;	../src/main.c: 193: GetNxtFileName(loggerCfg.firstFileName);
      0088DB 1E 31            [ 2]  345 	ldw	x, (0x31, sp)
      0088DD 89               [ 2]  346 	pushw	x
      0088DE CD 89 BB         [ 4]  347 	call	_GetNxtFileName
      0088E1 85               [ 2]  348 	popw	x
                                    349 ;	../src/main.c: 195: res = pf_open(loggerCfg.firstFileName);
      0088E2 1E 33            [ 2]  350 	ldw	x, (0x33, sp)
      0088E4 89               [ 2]  351 	pushw	x
      0088E5 CD 97 13         [ 4]  352 	call	_pf_open
      0088E8 85               [ 2]  353 	popw	x
                                    354 ;	../src/main.c: 196: if( FR_OK != res ){
      0088E9 4D               [ 1]  355 	tnz	a
      0088EA 27 07            [ 1]  356 	jreq	00120$
                                    357 ;	../src/main.c: 197: fsm.state = S4_ERR;
      0088EC A6 04            [ 1]  358 	ld	a, #0x04
      0088EE 6B 2D            [ 1]  359 	ld	(0x2d, sp), a
      0088F0 CC 88 72         [ 2]  360 	jp	00137$
      0088F3                        361 00120$:
                                    362 ;	../src/main.c: 200: fsm.state = S0_RST;
      0088F3 0F 2D            [ 1]  363 	clr	(0x2d, sp)
      0088F5 CC 88 72         [ 2]  364 	jp	00137$
      0088F8                        365 00123$:
                                    366 ;	../src/main.c: 206: fsm.state = S5_COMPLETE;
      0088F8 A6 05            [ 1]  367 	ld	a, #0x05
      0088FA 6B 2D            [ 1]  368 	ld	(0x2d, sp), a
                                    369 ;	../src/main.c: 209: break;
      0088FC CC 88 72         [ 2]  370 	jp	00137$
                                    371 ;	../src/main.c: 211: case S4_ERR:
      0088FF                        372 00125$:
                                    373 ;	../src/main.c: 212: SetLedMode(1, LED_TOGGLE_FAST);
      0088FF 4B 02            [ 1]  374 	push	#0x02
      008901 4B 01            [ 1]  375 	push	#0x01
      008903 CD 84 F5         [ 4]  376 	call	_SetLedMode
      008906 85               [ 2]  377 	popw	x
                                    378 ;	../src/main.c: 213: while(1); break;
      008907                        379 00127$:
      008907 20 FE            [ 2]  380 	jra	00127$
                                    381 ;	../src/main.c: 214: case S5_COMPLETE:
      008909                        382 00129$:
                                    383 ;	../src/main.c: 215: SetLedMode(0, LED_ON);
      008909 4B 03            [ 1]  384 	push	#0x03
      00890B 4B 00            [ 1]  385 	push	#0x00
      00890D CD 84 F5         [ 4]  386 	call	_SetLedMode
      008910 85               [ 2]  387 	popw	x
                                    388 ;	../src/main.c: 216: while(1);
      008911                        389 00131$:
      008911 20 FE            [ 2]  390 	jra	00131$
                                    391 ;	../src/main.c: 221: }
                                    392 ;	../src/main.c: 223: }
      008913 5B 34            [ 2]  393 	addw	sp, #52
      008915 81               [ 4]  394 	ret
                                    395 ;	../src/main.c: 236: static void Wr2SD( fsm_t * pfsm ){
                                    396 ;	-----------------------------------------
                                    397 ;	 function Wr2SD
                                    398 ;	-----------------------------------------
      008916                        399 _Wr2SD:
      008916 52 06            [ 2]  400 	sub	sp, #6
                                    401 ;	../src/main.c: 243: if( S1_WR_BUF0 == pfsm->state){
      008918 16 09            [ 2]  402 	ldw	y, (0x09, sp)
      00891A 17 03            [ 2]  403 	ldw	(0x03, sp), y
      00891C 93               [ 1]  404 	ldw	x, y
      00891D F6               [ 1]  405 	ld	a, (x)
      00891E 4A               [ 1]  406 	dec	a
      00891F 26 07            [ 1]  407 	jrne	00102$
                                    408 ;	../src/main.c: 244: pBuf = adcBuffer0; bufNo = 0;
      008921 90 AE 00 02      [ 2]  409 	ldw	y, #_adcBuffer0+0
      008925 5F               [ 1]  410 	clrw	x
      008926 20 07            [ 2]  411 	jra	00103$
      008928                        412 00102$:
                                    413 ;	../src/main.c: 246: pBuf = adcBuffer1; bufNo = 1;
      008928 90 AE 01 02      [ 2]  414 	ldw	y, #(_adcBuffer1+0)
      00892C A6 01            [ 1]  415 	ld	a, #0x01
      00892E 97               [ 1]  416 	ld	xl, a
      00892F                        417 00103$:
                                    418 ;	../src/main.c: 248: RELEASE_BUFF_FOR_WR(bufNo); //clear this flag
      00892F A6 01            [ 1]  419 	ld	a, #0x01
      008931 88               [ 1]  420 	push	a
      008932 9F               [ 1]  421 	ld	a, xl
      008933 4D               [ 1]  422 	tnz	a
      008934 27 05            [ 1]  423 	jreq	00143$
      008936                        424 00142$:
      008936 08 01            [ 1]  425 	sll	(1, sp)
      008938 4A               [ 1]  426 	dec	a
      008939 26 FB            [ 1]  427 	jrne	00142$
      00893B                        428 00143$:
      00893B 84               [ 1]  429 	pop	a
      00893C 43               [ 1]  430 	cpl	a
      00893D C4 00 01         [ 1]  431 	and	a, _buffer_rdy+0
      008940 C7 00 01         [ 1]  432 	ld	_buffer_rdy+0, a
                                    433 ;	../src/main.c: 252: res = pf_write((void*)pBuf,BUFFER_SZ_IN_BYTES, &pbr);
      008943 96               [ 1]  434 	ldw	x, sp
      008944 5C               [ 1]  435 	incw	x
      008945 89               [ 2]  436 	pushw	x
      008946 4B 00            [ 1]  437 	push	#0x00
      008948 4B 01            [ 1]  438 	push	#0x01
      00894A 90 89            [ 2]  439 	pushw	y
      00894C CD 99 92         [ 4]  440 	call	_pf_write
      00894F 5B 06            [ 2]  441 	addw	sp, #6
                                    442 ;	../src/main.c: 259: pfsm->error = ERR_WR_DATA;
      008951 1E 03            [ 2]  443 	ldw	x, (0x03, sp)
      008953 5C               [ 1]  444 	incw	x
      008954 1F 05            [ 2]  445 	ldw	(0x05, sp), x
                                    446 ;	../src/main.c: 256: if(FR_OK != res){
      008956 4D               [ 1]  447 	tnz	a
      008957 27 0C            [ 1]  448 	jreq	00105$
                                    449 ;	../src/main.c: 259: pfsm->error = ERR_WR_DATA;
      008959 1E 05            [ 2]  450 	ldw	x, (0x05, sp)
      00895B A6 02            [ 1]  451 	ld	a, #0x02
      00895D F7               [ 1]  452 	ld	(x), a
                                    453 ;	../src/main.c: 260: pfsm->state = S4_ERR;
      00895E 1E 03            [ 2]  454 	ldw	x, (0x03, sp)
      008960 A6 04            [ 1]  455 	ld	a, #0x04
      008962 F7               [ 1]  456 	ld	(x), a
                                    457 ;	../src/main.c: 261: return;
      008963 20 53            [ 2]  458 	jra	00112$
      008965                        459 00105$:
                                    460 ;	../src/main.c: 264: if(NO_BUFF_PER_BLK == ++blkCnt){
      008965 72 5C 02 63      [ 1]  461 	inc	_blkCnt+0
      008969 C6 02 63         [ 1]  462 	ld	a, _blkCnt+0
      00896C A1 02            [ 1]  463 	cp	a, #0x02
      00896E 26 45            [ 1]  464 	jrne	00111$
                                    465 ;	../src/main.c: 266: blkCnt = 0;
      008970 72 5F 02 63      [ 1]  466 	clr	_blkCnt+0
                                    467 ;	../src/main.c: 267: res = pf_write(0,0,&pbr);
      008974 96               [ 1]  468 	ldw	x, sp
      008975 5C               [ 1]  469 	incw	x
      008976 89               [ 2]  470 	pushw	x
      008977 5F               [ 1]  471 	clrw	x
      008978 89               [ 2]  472 	pushw	x
      008979 5F               [ 1]  473 	clrw	x
      00897A 89               [ 2]  474 	pushw	x
      00897B CD 99 92         [ 4]  475 	call	_pf_write
      00897E 5B 06            [ 2]  476 	addw	sp, #6
                                    477 ;	../src/main.c: 270: if(FR_OK != res){
      008980 4D               [ 1]  478 	tnz	a
      008981 27 0C            [ 1]  479 	jreq	00107$
                                    480 ;	../src/main.c: 272: pfsm->error = ERR_WR_NO_RESP;
      008983 1E 05            [ 2]  481 	ldw	x, (0x05, sp)
      008985 A6 03            [ 1]  482 	ld	a, #0x03
      008987 F7               [ 1]  483 	ld	(x), a
                                    484 ;	../src/main.c: 273: pfsm->state = S4_ERR;
      008988 1E 03            [ 2]  485 	ldw	x, (0x03, sp)
      00898A A6 04            [ 1]  486 	ld	a, #0x04
      00898C F7               [ 1]  487 	ld	(x), a
                                    488 ;	../src/main.c: 274: return;
      00898D 20 29            [ 2]  489 	jra	00112$
      00898F                        490 00107$:
                                    491 ;	../src/main.c: 277: if(0 == --fileBlkCnt){
      00898F CE 02 66         [ 2]  492 	ldw	x, _fileBlkCnt+2
      008992 1D 00 01         [ 2]  493 	subw	x, #0x0001
      008995 90 CE 02 64      [ 2]  494 	ldw	y, _fileBlkCnt+0
      008999 24 02            [ 1]  495 	jrnc	00149$
      00899B 90 5A            [ 2]  496 	decw	y
      00899D                        497 00149$:
      00899D CF 02 66         [ 2]  498 	ldw	_fileBlkCnt+2, x
      0089A0 90 CF 02 64      [ 2]  499 	ldw	_fileBlkCnt+0, y
      0089A4 CE 02 66         [ 2]  500 	ldw	x, _fileBlkCnt+2
      0089A7 26 0C            [ 1]  501 	jrne	00111$
      0089A9 CE 02 64         [ 2]  502 	ldw	x, _fileBlkCnt+0
      0089AC 26 07            [ 1]  503 	jrne	00111$
                                    504 ;	../src/main.c: 280: pfsm->state = S3_NXT_FILE;
      0089AE 1E 03            [ 2]  505 	ldw	x, (0x03, sp)
      0089B0 A6 03            [ 1]  506 	ld	a, #0x03
      0089B2 F7               [ 1]  507 	ld	(x), a
                                    508 ;	../src/main.c: 281: return;
      0089B3 20 03            [ 2]  509 	jra	00112$
      0089B5                        510 00111$:
                                    511 ;	../src/main.c: 286: pfsm->state = S0_RST; 
      0089B5 1E 03            [ 2]  512 	ldw	x, (0x03, sp)
      0089B7 7F               [ 1]  513 	clr	(x)
      0089B8                        514 00112$:
                                    515 ;	../src/main.c: 287: }
      0089B8 5B 06            [ 2]  516 	addw	sp, #6
      0089BA 81               [ 4]  517 	ret
                                    518 ;	../src/main.c: 300: static void GetNxtFileName( char * fname){
                                    519 ;	-----------------------------------------
                                    520 ;	 function GetNxtFileName
                                    521 ;	-----------------------------------------
      0089BB                        522 _GetNxtFileName:
      0089BB 52 05            [ 2]  523 	sub	sp, #5
                                    524 ;	../src/main.c: 301: uint8_t val = 0;
      0089BD 0F 01            [ 1]  525 	clr	(0x01, sp)
                                    526 ;	../src/main.c: 303: if(0x39 == fname[3]){
      0089BF 1E 08            [ 2]  527 	ldw	x, (0x08, sp)
      0089C1 E6 03            [ 1]  528 	ld	a, (0x3, x)
                                    529 ;	../src/main.c: 304: val = 0x01;
      0089C3 A0 39            [ 1]  530 	sub	a, #0x39
      0089C5 26 03            [ 1]  531 	jrne	00102$
      0089C7 4C               [ 1]  532 	inc	a
      0089C8 6B 01            [ 1]  533 	ld	(0x01, sp), a
      0089CA                        534 00102$:
                                    535 ;	../src/main.c: 306: if(0x39 == fname[2]) {
      0089CA 1E 08            [ 2]  536 	ldw	x, (0x08, sp)
      0089CC E6 02            [ 1]  537 	ld	a, (0x2, x)
      0089CE A1 39            [ 1]  538 	cp	a, #0x39
      0089D0 26 06            [ 1]  539 	jrne	00104$
                                    540 ;	../src/main.c: 307: val += 0x02;
      0089D2 7B 01            [ 1]  541 	ld	a, (0x01, sp)
      0089D4 AB 02            [ 1]  542 	add	a, #0x02
      0089D6 6B 01            [ 1]  543 	ld	(0x01, sp), a
      0089D8                        544 00104$:
                                    545 ;	../src/main.c: 309: if(0x39 == fname[1]) {
      0089D8 1E 08            [ 2]  546 	ldw	x, (0x08, sp)
      0089DA E6 01            [ 1]  547 	ld	a, (0x1, x)
      0089DC A1 39            [ 1]  548 	cp	a, #0x39
      0089DE 26 06            [ 1]  549 	jrne	00106$
                                    550 ;	../src/main.c: 310: val += 0x04;
      0089E0 7B 01            [ 1]  551 	ld	a, (0x01, sp)
      0089E2 AB 04            [ 1]  552 	add	a, #0x04
      0089E4 6B 01            [ 1]  553 	ld	(0x01, sp), a
      0089E6                        554 00106$:
                                    555 ;	../src/main.c: 312: if(0x39 == fname[0]) {
      0089E6 16 08            [ 2]  556 	ldw	y, (0x08, sp)
      0089E8 17 02            [ 2]  557 	ldw	(0x02, sp), y
      0089EA 93               [ 1]  558 	ldw	x, y
      0089EB F6               [ 1]  559 	ld	a, (x)
      0089EC A1 39            [ 1]  560 	cp	a, #0x39
      0089EE 26 06            [ 1]  561 	jrne	00108$
                                    562 ;	../src/main.c: 313: val += 0x08;
      0089F0 7B 01            [ 1]  563 	ld	a, (0x01, sp)
      0089F2 AB 08            [ 1]  564 	add	a, #0x08
      0089F4 6B 01            [ 1]  565 	ld	(0x01, sp), a
      0089F6                        566 00108$:
                                    567 ;	../src/main.c: 317: case 0x01: fname[3] = 0x30; 
      0089F6 1E 02            [ 2]  568 	ldw	x, (0x02, sp)
      0089F8 1C 00 03         [ 2]  569 	addw	x, #0x0003
                                    570 ;	../src/main.c: 318: fname[2]++;break;
      0089FB 16 02            [ 2]  571 	ldw	y, (0x02, sp)
      0089FD 90 5C            [ 1]  572 	incw	y
      0089FF 90 5C            [ 1]  573 	incw	y
      008A01 17 04            [ 2]  574 	ldw	(0x04, sp), y
                                    575 ;	../src/main.c: 316: switch(val){
      008A03 7B 01            [ 1]  576 	ld	a, (0x01, sp)
      008A05 4A               [ 1]  577 	dec	a
      008A06 27 18            [ 1]  578 	jreq	00109$
                                    579 ;	../src/main.c: 321: fname[1]++; break;
      008A08 16 02            [ 2]  580 	ldw	y, (0x02, sp)
      008A0A 90 5C            [ 1]  581 	incw	y
                                    582 ;	../src/main.c: 316: switch(val){
      008A0C 7B 01            [ 1]  583 	ld	a, (0x01, sp)
      008A0E A1 03            [ 1]  584 	cp	a, #0x03
      008A10 27 16            [ 1]  585 	jreq	00110$
      008A12 7B 01            [ 1]  586 	ld	a, (0x01, sp)
      008A14 A1 07            [ 1]  587 	cp	a, #0x07
      008A16 27 1C            [ 1]  588 	jreq	00111$
      008A18 7B 01            [ 1]  589 	ld	a, (0x01, sp)
      008A1A A1 0F            [ 1]  590 	cp	a, #0x0f
      008A1C 27 25            [ 1]  591 	jreq	00112$
      008A1E 20 34            [ 2]  592 	jra	00113$
                                    593 ;	../src/main.c: 317: case 0x01: fname[3] = 0x30; 
      008A20                        594 00109$:
      008A20 A6 30            [ 1]  595 	ld	a, #0x30
      008A22 F7               [ 1]  596 	ld	(x), a
                                    597 ;	../src/main.c: 318: fname[2]++;break;
      008A23 1E 04            [ 2]  598 	ldw	x, (0x04, sp)
      008A25 7C               [ 1]  599 	inc	(x)
      008A26 20 2D            [ 2]  600 	jra	00115$
                                    601 ;	../src/main.c: 319: case 0x03: fname[3] = 0x30; 
      008A28                        602 00110$:
      008A28 A6 30            [ 1]  603 	ld	a, #0x30
      008A2A F7               [ 1]  604 	ld	(x), a
                                    605 ;	../src/main.c: 320: fname[2] = 0x30; 
      008A2B 1E 04            [ 2]  606 	ldw	x, (0x04, sp)
      008A2D A6 30            [ 1]  607 	ld	a, #0x30
      008A2F F7               [ 1]  608 	ld	(x), a
                                    609 ;	../src/main.c: 321: fname[1]++; break;
      008A30 90 7C            [ 1]  610 	inc	(y)
      008A32 20 21            [ 2]  611 	jra	00115$
                                    612 ;	../src/main.c: 322: case 0x07: fname[3] = 0x30; 
      008A34                        613 00111$:
      008A34 A6 30            [ 1]  614 	ld	a, #0x30
      008A36 F7               [ 1]  615 	ld	(x), a
                                    616 ;	../src/main.c: 323: fname[2] = 0x30; 
      008A37 1E 04            [ 2]  617 	ldw	x, (0x04, sp)
                                    618 ;	../src/main.c: 324: fname[1] = 0x30; 
      008A39 A6 30            [ 1]  619 	ld	a, #0x30
      008A3B F7               [ 1]  620 	ld	(x), a
      008A3C 90 F7            [ 1]  621 	ld	(y), a
                                    622 ;	../src/main.c: 325: fname[0]++; break;
      008A3E 1E 02            [ 2]  623 	ldw	x, (0x02, sp)
      008A40 7C               [ 1]  624 	inc	(x)
      008A41 20 12            [ 2]  625 	jra	00115$
                                    626 ;	../src/main.c: 326: case 0x0f: fname[3] = 0x30; 
      008A43                        627 00112$:
      008A43 A6 30            [ 1]  628 	ld	a, #0x30
      008A45 F7               [ 1]  629 	ld	(x), a
                                    630 ;	../src/main.c: 327: fname[2] = 0x30; 
      008A46 1E 04            [ 2]  631 	ldw	x, (0x04, sp)
                                    632 ;	../src/main.c: 328: fname[1] = 0x30; 
      008A48 A6 30            [ 1]  633 	ld	a, #0x30
      008A4A F7               [ 1]  634 	ld	(x), a
      008A4B 90 F7            [ 1]  635 	ld	(y), a
                                    636 ;	../src/main.c: 329: fname[0] = 0x30; break;
      008A4D 1E 02            [ 2]  637 	ldw	x, (0x02, sp)
      008A4F A6 30            [ 1]  638 	ld	a, #0x30
      008A51 F7               [ 1]  639 	ld	(x), a
      008A52 20 01            [ 2]  640 	jra	00115$
                                    641 ;	../src/main.c: 330: default: fname[3]++; break;
      008A54                        642 00113$:
      008A54 7C               [ 1]  643 	inc	(x)
                                    644 ;	../src/main.c: 331: }
      008A55                        645 00115$:
                                    646 ;	../src/main.c: 332: }
      008A55 5B 05            [ 2]  647 	addw	sp, #5
      008A57 81               [ 4]  648 	ret
                                    649 ;	../src/main.c: 345: static void ConvertFileName(uint16_t firstFileName, char * fname){
                                    650 ;	-----------------------------------------
                                    651 ;	 function ConvertFileName
                                    652 ;	-----------------------------------------
      008A58                        653 _ConvertFileName:
      008A58 52 04            [ 2]  654 	sub	sp, #4
                                    655 ;	../src/main.c: 348: val = firstFileName/1000;
      008A5A 16 07            [ 2]  656 	ldw	y, (0x07, sp)
      008A5C 17 03            [ 2]  657 	ldw	(0x03, sp), y
      008A5E 93               [ 1]  658 	ldw	x, y
      008A5F 90 AE 03 E8      [ 2]  659 	ldw	y, #0x03e8
      008A63 65               [ 2]  660 	divw	x, y
                                    661 ;	../src/main.c: 349: fname[0] = val + 0x30;
      008A64 16 09            [ 2]  662 	ldw	y, (0x09, sp)
      008A66 17 01            [ 2]  663 	ldw	(0x01, sp), y
      008A68 9F               [ 1]  664 	ld	a, xl
      008A69 AB 30            [ 1]  665 	add	a, #0x30
      008A6B 16 01            [ 2]  666 	ldw	y, (0x01, sp)
      008A6D 90 F7            [ 1]  667 	ld	(y), a
                                    668 ;	../src/main.c: 350: firstFileName -=  val*1000;
      008A6F 89               [ 2]  669 	pushw	x
      008A70 4B E8            [ 1]  670 	push	#0xe8
      008A72 4B 03            [ 1]  671 	push	#0x03
      008A74 CD 9C 1D         [ 4]  672 	call	__mulint
      008A77 5B 04            [ 2]  673 	addw	sp, #4
      008A79 50               [ 2]  674 	negw	x
      008A7A 72 FB 03         [ 2]  675 	addw	x, (0x03, sp)
                                    676 ;	../src/main.c: 351: val = firstFileName/100;
      008A7D 1F 07            [ 2]  677 	ldw	(0x07, sp), x
      008A7F 1F 03            [ 2]  678 	ldw	(0x03, sp), x
      008A81 90 AE 00 64      [ 2]  679 	ldw	y, #0x0064
      008A85 65               [ 2]  680 	divw	x, y
                                    681 ;	../src/main.c: 352: fname[1] = val + 0x30;
      008A86 16 01            [ 2]  682 	ldw	y, (0x01, sp)
      008A88 90 5C            [ 1]  683 	incw	y
      008A8A 9F               [ 1]  684 	ld	a, xl
      008A8B AB 30            [ 1]  685 	add	a, #0x30
      008A8D 90 F7            [ 1]  686 	ld	(y), a
                                    687 ;	../src/main.c: 353: firstFileName -=  val*100;
      008A8F 89               [ 2]  688 	pushw	x
      008A90 4B 64            [ 1]  689 	push	#0x64
      008A92 4B 00            [ 1]  690 	push	#0x00
      008A94 CD 9C 1D         [ 4]  691 	call	__mulint
      008A97 5B 04            [ 2]  692 	addw	sp, #4
      008A99 50               [ 2]  693 	negw	x
      008A9A 72 FB 03         [ 2]  694 	addw	x, (0x03, sp)
                                    695 ;	../src/main.c: 354: val = firstFileName/10;
      008A9D 1F 07            [ 2]  696 	ldw	(0x07, sp), x
      008A9F 1F 03            [ 2]  697 	ldw	(0x03, sp), x
      008AA1 90 AE 00 0A      [ 2]  698 	ldw	y, #0x000a
      008AA5 65               [ 2]  699 	divw	x, y
                                    700 ;	../src/main.c: 355: fname[2] = val + 0x30;
      008AA6 16 01            [ 2]  701 	ldw	y, (0x01, sp)
      008AA8 72 A9 00 02      [ 2]  702 	addw	y, #0x0002
      008AAC 9F               [ 1]  703 	ld	a, xl
      008AAD AB 30            [ 1]  704 	add	a, #0x30
      008AAF 90 F7            [ 1]  705 	ld	(y), a
                                    706 ;	../src/main.c: 356: firstFileName -=  val*10;
      008AB1 89               [ 2]  707 	pushw	x
      008AB2 58               [ 2]  708 	sllw	x
      008AB3 58               [ 2]  709 	sllw	x
      008AB4 72 FB 01         [ 2]  710 	addw	x, (1, sp)
      008AB7 58               [ 2]  711 	sllw	x
      008AB8 5B 02            [ 2]  712 	addw	sp, #2
      008ABA 50               [ 2]  713 	negw	x
      008ABB 72 FB 03         [ 2]  714 	addw	x, (0x03, sp)
      008ABE 1F 07            [ 2]  715 	ldw	(0x07, sp), x
                                    716 ;	../src/main.c: 357: fname[3] = firstFileName + 0x30;
      008AC0 1E 01            [ 2]  717 	ldw	x, (0x01, sp)
      008AC2 1C 00 03         [ 2]  718 	addw	x, #0x0003
      008AC5 7B 08            [ 1]  719 	ld	a, (0x08, sp)
      008AC7 AB 30            [ 1]  720 	add	a, #0x30
      008AC9 F7               [ 1]  721 	ld	(x), a
                                    722 ;	../src/main.c: 358: fname[4] = '\0';
      008ACA 1E 01            [ 2]  723 	ldw	x, (0x01, sp)
      008ACC 6F 04            [ 1]  724 	clr	(0x0004, x)
                                    725 ;	../src/main.c: 359: }
      008ACE 5B 04            [ 2]  726 	addw	sp, #4
      008AD0 81               [ 4]  727 	ret
                                    728 ;	../src/main.c: 374: static UINT GetCfg( uint8_t * pCfgBuf,  cfg_t * pcfg){
                                    729 ;	-----------------------------------------
                                    730 ;	 function GetCfg
                                    731 ;	-----------------------------------------
      008AD1                        732 _GetCfg:
      008AD1 52 12            [ 2]  733 	sub	sp, #18
                                    734 ;	../src/main.c: 377: if(!IsValidCfgBuf(pCfgBuf)) return 1; 
      008AD3 1E 15            [ 2]  735 	ldw	x, (0x15, sp)
      008AD5 89               [ 2]  736 	pushw	x
      008AD6 CD 8B D4         [ 4]  737 	call	_IsValidCfgBuf
      008AD9 85               [ 2]  738 	popw	x
      008ADA 6B 12            [ 1]  739 	ld	(0x12, sp), a
      008ADC 26 05            [ 1]  740 	jrne	00102$
      008ADE 5F               [ 1]  741 	clrw	x
      008ADF 5C               [ 1]  742 	incw	x
      008AE0 CC 8B D1         [ 2]  743 	jp	00106$
      008AE3                        744 00102$:
                                    745 ;	../src/main.c: 380: pcfg->sampFreq = pCfgBuf[0]+(((uint16_t)pCfgBuf[1])<<8);
      008AE3 16 17            [ 2]  746 	ldw	y, (0x17, sp)
      008AE5 17 01            [ 2]  747 	ldw	(0x01, sp), y
      008AE7 16 15            [ 2]  748 	ldw	y, (0x15, sp)
      008AE9 17 03            [ 2]  749 	ldw	(0x03, sp), y
      008AEB 93               [ 1]  750 	ldw	x, y
      008AEC F6               [ 1]  751 	ld	a, (x)
      008AED 5F               [ 1]  752 	clrw	x
      008AEE 97               [ 1]  753 	ld	xl, a
      008AEF 16 03            [ 2]  754 	ldw	y, (0x03, sp)
      008AF1 90 E6 01         [ 1]  755 	ld	a, (0x1, y)
      008AF4 90 95            [ 1]  756 	ld	yh, a
      008AF6 4F               [ 1]  757 	clr	a
      008AF7 1F 11            [ 2]  758 	ldw	(0x11, sp), x
      008AF9 90 97            [ 1]  759 	ld	yl, a
      008AFB 72 F9 11         [ 2]  760 	addw	y, (0x11, sp)
      008AFE 1E 01            [ 2]  761 	ldw	x, (0x01, sp)
      008B00 FF               [ 2]  762 	ldw	(x), y
                                    763 ;	../src/main.c: 382: fID = pCfgBuf[2]+(((uint16_t)pCfgBuf[3])<<8);
      008B01 1E 03            [ 2]  764 	ldw	x, (0x03, sp)
      008B03 E6 02            [ 1]  765 	ld	a, (0x2, x)
      008B05 90 5F            [ 1]  766 	clrw	y
      008B07 90 97            [ 1]  767 	ld	yl, a
      008B09 1E 03            [ 2]  768 	ldw	x, (0x03, sp)
      008B0B E6 03            [ 1]  769 	ld	a, (0x3, x)
      008B0D 95               [ 1]  770 	ld	xh, a
      008B0E 4F               [ 1]  771 	clr	a
      008B0F 17 11            [ 2]  772 	ldw	(0x11, sp), y
      008B11 97               [ 1]  773 	ld	xl, a
      008B12 72 FB 11         [ 2]  774 	addw	x, (0x11, sp)
                                    775 ;	../src/main.c: 384: ConvertFileName(fID, pcfg->firstFileName);
      008B15 16 01            [ 2]  776 	ldw	y, (0x01, sp)
      008B17 72 A9 00 02      [ 2]  777 	addw	y, #0x0002
      008B1B 90 89            [ 2]  778 	pushw	y
      008B1D 89               [ 2]  779 	pushw	x
      008B1E CD 8A 58         [ 4]  780 	call	_ConvertFileName
      008B21 5B 04            [ 2]  781 	addw	sp, #4
                                    782 ;	../src/main.c: 385: pcfg->fileNo = pCfgBuf[4]+(((uint16_t)pCfgBuf[5])<<8);
      008B23 16 01            [ 2]  783 	ldw	y, (0x01, sp)
      008B25 72 A9 00 0B      [ 2]  784 	addw	y, #0x000b
      008B29 1E 03            [ 2]  785 	ldw	x, (0x03, sp)
      008B2B E6 04            [ 1]  786 	ld	a, (0x4, x)
      008B2D 6B 10            [ 1]  787 	ld	(0x10, sp), a
      008B2F 0F 0F            [ 1]  788 	clr	(0x0f, sp)
      008B31 1E 03            [ 2]  789 	ldw	x, (0x03, sp)
      008B33 E6 05            [ 1]  790 	ld	a, (0x5, x)
      008B35 6B 11            [ 1]  791 	ld	(0x11, sp), a
      008B37 0F 12            [ 1]  792 	clr	(0x12, sp)
      008B39 1E 0F            [ 2]  793 	ldw	x, (0x0f, sp)
      008B3B 72 FB 11         [ 2]  794 	addw	x, (0x11, sp)
      008B3E 90 FF            [ 2]  795 	ldw	(y), x
                                    796 ;	../src/main.c: 386: pcfg->fileSzInBlock = pCfgBuf[6]+ \
      008B40 1E 01            [ 2]  797 	ldw	x, (0x01, sp)
      008B42 1C 00 07         [ 2]  798 	addw	x, #0x0007
      008B45 1F 05            [ 2]  799 	ldw	(0x05, sp), x
      008B47 1E 03            [ 2]  800 	ldw	x, (0x03, sp)
      008B49 E6 06            [ 1]  801 	ld	a, (0x6, x)
      008B4B 90 97            [ 1]  802 	ld	yl, a
      008B4D 1E 03            [ 2]  803 	ldw	x, (0x03, sp)
      008B4F E6 07            [ 1]  804 	ld	a, (0x7, x)
      008B51 0F 11            [ 1]  805 	clr	(0x11, sp)
      008B53 5F               [ 1]  806 	clrw	x
      008B54 95               [ 1]  807 	ld	xh, a
      008B55 7B 11            [ 1]  808 	ld	a, (0x11, sp)
      008B57 0F 0A            [ 1]  809 	clr	(0x0a, sp)
      008B59 0F 11            [ 1]  810 	clr	(0x11, sp)
      008B5B 0F 10            [ 1]  811 	clr	(0x10, sp)
      008B5D 0F 0F            [ 1]  812 	clr	(0x0f, sp)
      008B5F 88               [ 1]  813 	push	a
      008B60 90 9F            [ 1]  814 	ld	a, yl
      008B62 1B 0B            [ 1]  815 	add	a, (0x0b, sp)
      008B64 90 97            [ 1]  816 	ld	yl, a
      008B66 9E               [ 1]  817 	ld	a, xh
      008B67 19 12            [ 1]  818 	adc	a, (0x12, sp)
      008B69 90 95            [ 1]  819 	ld	yh, a
      008B6B 84               [ 1]  820 	pop	a
      008B6C 19 10            [ 1]  821 	adc	a, (0x10, sp)
      008B6E 6B 0C            [ 1]  822 	ld	(0x0c, sp), a
      008B70 9F               [ 1]  823 	ld	a, xl
      008B71 19 0F            [ 1]  824 	adc	a, (0x0f, sp)
      008B73 6B 0B            [ 1]  825 	ld	(0x0b, sp), a
      008B75 1E 03            [ 2]  826 	ldw	x, (0x03, sp)
      008B77 E6 08            [ 1]  827 	ld	a, (0x8, x)
      008B79 5F               [ 1]  828 	clrw	x
      008B7A 0F 0F            [ 1]  829 	clr	(0x0f, sp)
      008B7C 0F 12            [ 1]  830 	clr	(0x12, sp)
      008B7E 0F 11            [ 1]  831 	clr	(0x11, sp)
      008B80 72 F9 11         [ 2]  832 	addw	y, (0x11, sp)
      008B83 19 0C            [ 1]  833 	adc	a, (0x0c, sp)
      008B85 6B 08            [ 1]  834 	ld	(0x08, sp), a
      008B87 9F               [ 1]  835 	ld	a, xl
      008B88 19 0B            [ 1]  836 	adc	a, (0x0b, sp)
      008B8A 6B 07            [ 1]  837 	ld	(0x07, sp), a
      008B8C 1E 03            [ 2]  838 	ldw	x, (0x03, sp)
      008B8E E6 09            [ 1]  839 	ld	a, (0x9, x)
      008B90 0F 0F            [ 1]  840 	clr	(0x0f, sp)
      008B92 0F 0E            [ 1]  841 	clr	(0x0e, sp)
      008B94 5F               [ 1]  842 	clrw	x
      008B95 88               [ 1]  843 	push	a
      008B96 90 9F            [ 1]  844 	ld	a, yl
      008B98 1B 0F            [ 1]  845 	add	a, (0x0f, sp)
      008B9A 90 02            [ 1]  846 	rlwa	y
      008B9C 89               [ 2]  847 	pushw	x
      008B9D 19 02            [ 1]  848 	adc	a, (2, sp)
      008B9F 85               [ 2]  849 	popw	x
      008BA0 90 95            [ 1]  850 	ld	yh, a
      008BA2 9E               [ 1]  851 	ld	a, xh
      008BA3 19 09            [ 1]  852 	adc	a, (0x09, sp)
      008BA5 6B 11            [ 1]  853 	ld	(0x11, sp), a
      008BA7 84               [ 1]  854 	pop	a
      008BA8 19 07            [ 1]  855 	adc	a, (0x07, sp)
      008BAA 6B 0F            [ 1]  856 	ld	(0x0f, sp), a
      008BAC 1E 05            [ 2]  857 	ldw	x, (0x05, sp)
      008BAE EF 02            [ 2]  858 	ldw	(0x2, x), y
      008BB0 16 0F            [ 2]  859 	ldw	y, (0x0f, sp)
      008BB2 FF               [ 2]  860 	ldw	(x), y
                                    861 ;	../src/main.c: 390: pcfg->channel = pCfgBuf[10];
      008BB3 1E 01            [ 2]  862 	ldw	x, (0x01, sp)
      008BB5 1C 00 0D         [ 2]  863 	addw	x, #0x000d
      008BB8 16 03            [ 2]  864 	ldw	y, (0x03, sp)
      008BBA 90 E6 0A         [ 1]  865 	ld	a, (0xa, y)
      008BBD F7               [ 1]  866 	ld	(x), a
                                    867 ;	../src/main.c: 391: if(pCfgBuf[11] == 0)
      008BBE 1E 03            [ 2]  868 	ldw	x, (0x03, sp)
      008BC0 E6 0B            [ 1]  869 	ld	a, (0xb, x)
                                    870 ;	../src/main.c: 393: pcfg->isFullResultion = false;
      008BC2 1E 01            [ 2]  871 	ldw	x, (0x01, sp)
      008BC4 1C 00 0E         [ 2]  872 	addw	x, #0x000e
                                    873 ;	../src/main.c: 391: if(pCfgBuf[11] == 0)
      008BC7 4D               [ 1]  874 	tnz	a
      008BC8 26 03            [ 1]  875 	jrne	00104$
                                    876 ;	../src/main.c: 393: pcfg->isFullResultion = false;
      008BCA 7F               [ 1]  877 	clr	(x)
      008BCB 20 03            [ 2]  878 	jra	00105$
      008BCD                        879 00104$:
                                    880 ;	../src/main.c: 395: pcfg->isFullResultion = true;
      008BCD A6 01            [ 1]  881 	ld	a, #0x01
      008BCF F7               [ 1]  882 	ld	(x), a
      008BD0                        883 00105$:
                                    884 ;	../src/main.c: 398: return 0x0;
      008BD0 5F               [ 1]  885 	clrw	x
      008BD1                        886 00106$:
                                    887 ;	../src/main.c: 399: }
      008BD1 5B 12            [ 2]  888 	addw	sp, #18
      008BD3 81               [ 4]  889 	ret
                                    890 ;	../src/main.c: 413: static uint8_t IsValidCfgBuf(uint8_t *pCfgBuf){
                                    891 ;	-----------------------------------------
                                    892 ;	 function IsValidCfgBuf
                                    893 ;	-----------------------------------------
      008BD4                        894 _IsValidCfgBuf:
      008BD4 88               [ 1]  895 	push	a
                                    896 ;	../src/main.c: 414: uint8_t crc = 0;
      008BD5 0F 01            [ 1]  897 	clr	(0x01, sp)
                                    898 ;	../src/main.c: 422: return false;	
      008BD7 5F               [ 1]  899 	clrw	x
      008BD8                        900 00105$:
                                    901 ;	../src/main.c: 416: for(; i < CFG_BUF_SZ - 1; i++){
      008BD8 A3 00 0C         [ 2]  902 	cpw	x, #0x000c
      008BDB 2E 0E            [ 1]  903 	jrsge	00101$
                                    904 ;	../src/main.c: 417: crc += pCfgBuf[i];		
      008BDD 90 93            [ 1]  905 	ldw	y, x
      008BDF 72 F9 04         [ 2]  906 	addw	y, (0x04, sp)
      008BE2 90 F6            [ 1]  907 	ld	a, (y)
      008BE4 1B 01            [ 1]  908 	add	a, (0x01, sp)
      008BE6 6B 01            [ 1]  909 	ld	(0x01, sp), a
                                    910 ;	../src/main.c: 416: for(; i < CFG_BUF_SZ - 1; i++){
      008BE8 5C               [ 1]  911 	incw	x
      008BE9 20 ED            [ 2]  912 	jra	00105$
      008BEB                        913 00101$:
                                    914 ;	../src/main.c: 419: if(crc == pCfgBuf[CFG_BUF_SZ-1])
      008BEB 1E 04            [ 2]  915 	ldw	x, (0x04, sp)
      008BED E6 0C            [ 1]  916 	ld	a, (0xc, x)
                                    917 ;	../src/main.c: 420: return true;
      008BEF 10 01            [ 1]  918 	sub	a, (0x01, sp)
      008BF1 26 02            [ 1]  919 	jrne	00103$
      008BF3 4C               [ 1]  920 	inc	a
                                    921 ;	../src/main.c: 422: return false;	
      008BF4 21                     922 	.byte 0x21
      008BF5                        923 00103$:
      008BF5 4F               [ 1]  924 	clr	a
      008BF6                        925 00107$:
                                    926 ;	../src/main.c: 423: }
      008BF6 5B 01            [ 2]  927 	addw	sp, #1
      008BF8 81               [ 4]  928 	ret
                                    929 ;	../src/main.c: 432: static void clkInit( void )
                                    930 ;	-----------------------------------------
                                    931 ;	 function clkInit
                                    932 ;	-----------------------------------------
      008BF9                        933 _clkInit:
                                    934 ;	../src/main.c: 435: CLK->CKDIVR = 0;//(CLK_PRESCALER_HSIDIV1|CLK_PRESCALER_CPUDIV1);
      008BF9 35 00 50 C6      [ 1]  935 	mov	0x50c6+0, #0x00
                                    936 ;	../src/main.c: 443: CLK->PCKENR1 |= (CLK_PCKENR1_TIM4|CLK_PCKENR1_SPI|CLK_PCKENR1_UART1);
      008BFD C6 50 C7         [ 1]  937 	ld	a, 0x50c7
      008C00 AA 16            [ 1]  938 	or	a, #0x16
      008C02 C7 50 C7         [ 1]  939 	ld	0x50c7, a
                                    940 ;	../src/main.c: 444: CLK->PCKENR2 |= (CLK_PCKENR2_ADC);
      008C05 72 16 50 CA      [ 1]  941 	bset	20682, #3
                                    942 ;	../src/main.c: 445: }
      008C09 81               [ 4]  943 	ret
                                    944 ;	../src/main.c: 460: void assert_failed(uint8_t* file, uint32_t line)
                                    945 ;	-----------------------------------------
                                    946 ;	 function assert_failed
                                    947 ;	-----------------------------------------
      008C0A                        948 _assert_failed:
                                    949 ;	../src/main.c: 466: while (1)
      008C0A                        950 00102$:
      008C0A 20 FE            [ 2]  951 	jra	00102$
                                    952 ;	../src/main.c: 469: }
      008C0C 81               [ 4]  953 	ret
                                    954 	.area CODE
                                    955 	.area CONST
                                    956 	.area CONST
      008102                        957 ___str_0:
      008102 43 46 47               958 	.ascii "CFG"
      008105 00                     959 	.db 0x00
                                    960 	.area CODE
                                    961 	.area INITIALIZER
      008106                        962 __xinit__blkCnt:
      008106 00                     963 	.db #0x00	; 0
      008107                        964 __xinit__fileBlkCnt:
      008107 00 00 00 00            965 	.byte #0x00, #0x00, #0x00, #0x00	; 0
      00810B                        966 __xinit__fileNoCnt:
      00810B 00 00                  967 	.dw #0x0000
                                    968 	.area CABS (ABS)
