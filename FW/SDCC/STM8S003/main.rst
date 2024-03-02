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
                                     19 	.globl _ReadButtonState
                                     20 	.globl _dly
                                     21 	.globl _sysTickInit
                                     22 	.globl _loggerCfg
                                     23 	.globl _assert_failed
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DATA
      00024B                         28 _cfg:
      00024B                         29 	.ds 13
      000258                         30 _loggerCfg::
      000258                         31 	.ds 15
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area INITIALIZED
      000269                         36 _blkCnt:
      000269                         37 	.ds 1
      00026A                         38 _fileBlkCnt:
      00026A                         39 	.ds 4
      00026E                         40 _fileNoCnt:
      00026E                         41 	.ds 2
                                     42 ;--------------------------------------------------------
                                     43 ; Stack segment in internal ram 
                                     44 ;--------------------------------------------------------
                                     45 	.area	SSEG
      009E56                         46 __start__stack:
      009E56                         47 	.ds	1
                                     48 
                                     49 ;--------------------------------------------------------
                                     50 ; absolute external ram data
                                     51 ;--------------------------------------------------------
                                     52 	.area DABS (ABS)
                                     53 
                                     54 ; default segment ordering for linker
                                     55 	.area HOME
                                     56 	.area GSINIT
                                     57 	.area GSFINAL
                                     58 	.area CONST
                                     59 	.area INITIALIZER
                                     60 	.area CODE
                                     61 
                                     62 ;--------------------------------------------------------
                                     63 ; interrupt vector 
                                     64 ;--------------------------------------------------------
                                     65 	.area HOME
      008000                         66 __interrupt_vect:
      008000 82 00 80 6F             67 	int s_GSINIT ; reset
      008004 82 00 9D 4B             68 	int _TRAP_IRQHandler ; trap
      008008 82 00 9D 4C             69 	int _TLI_IRQHandler ; int0
      00800C 82 00 9D 4D             70 	int _AWU_IRQHandler ; int1
      008010 82 00 9D 4E             71 	int _CLK_IRQHandler ; int2
      008014 82 00 9D 4F             72 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 9D 50             73 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 9D 51             74 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 9D 52             75 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 9D 53             76 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             77 	int 0x000000 ; int8
      00802C 82 00 00 00             78 	int 0x000000 ; int9
      008030 82 00 9D 54             79 	int _SPI_IRQHandler ; int10
      008034 82 00 9D 55             80 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 9D 56             81 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 9D 57             82 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 9D 58             83 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 00 00             84 	int 0x000000 ; int15
      008048 82 00 00 00             85 	int 0x000000 ; int16
      00804C 82 00 9D 59             86 	int _UART1_TX_IRQHandler ; int17
      008050 82 00 9D 5A             87 	int _UART1_RX_IRQHandler ; int18
      008054 82 00 9D 5B             88 	int _I2C_IRQHandler ; int19
      008058 82 00 00 00             89 	int 0x000000 ; int20
      00805C 82 00 00 00             90 	int 0x000000 ; int21
      008060 82 00 9D 5C             91 	int _ADC1_IRQHandler ; int22
      008064 82 00 9D 61             92 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 9D 66             93 	int _EEPROM_EEC_IRQHandler ; int24
                                     94 ;--------------------------------------------------------
                                     95 ; global & static initialisations
                                     96 ;--------------------------------------------------------
                                     97 	.area HOME
                                     98 	.area GSINIT
                                     99 	.area GSFINAL
                                    100 	.area GSINIT
      008090                        101 __sdcc_init_data:
                                    102 ; stm8_genXINIT() start
      008090 AE 02 68         [ 2]  103 	ldw x, #l_DATA
      008093 27 07            [ 1]  104 	jreq	00002$
      008095                        105 00001$:
      008095 72 4F 00 00      [ 1]  106 	clr (s_DATA - 1, x)
      008099 5A               [ 2]  107 	decw x
      00809A 26 F9            [ 1]  108 	jrne	00001$
      00809C                        109 00002$:
      00809C AE 00 07         [ 2]  110 	ldw	x, #l_INITIALIZER
      00809F 27 09            [ 1]  111 	jreq	00004$
      0080A1                        112 00003$:
      0080A1 D6 81 10         [ 1]  113 	ld	a, (s_INITIALIZER - 1, x)
      0080A4 D7 02 68         [ 1]  114 	ld	(s_INITIALIZED - 1, x), a
      0080A7 5A               [ 2]  115 	decw	x
      0080A8 26 F7            [ 1]  116 	jrne	00003$
      0080AA                        117 00004$:
                                    118 ; stm8_genXINIT() end
                                    119 	.area GSFINAL
      0080AA CC 80 6C         [ 2]  120 	jp	__sdcc_program_startup
                                    121 ;--------------------------------------------------------
                                    122 ; Home
                                    123 ;--------------------------------------------------------
                                    124 	.area HOME
                                    125 	.area HOME
      00806C                        126 __sdcc_program_startup:
      00806C CC 88 B8         [ 2]  127 	jp	_main
                                    128 ;	return from main will return to caller
                                    129 ;--------------------------------------------------------
                                    130 ; code
                                    131 ;--------------------------------------------------------
                                    132 	.area CODE
                                    133 ;	../src/main.c: 100: void main( void )
                                    134 ;	-----------------------------------------
                                    135 ;	 function main
                                    136 ;	-----------------------------------------
      0088B8                        137 _main:
      0088B8 52 34            [ 2]  138 	sub	sp, #52
                                    139 ;	../src/main.c: 111: clkInit();
      0088BA CD 8D 29         [ 4]  140 	call	_clkInit
                                    141 ;	../src/main.c: 112: LedMatrixInit();
      0088BD CD 85 A1         [ 4]  142 	call	_LedMatrixInit
                                    143 ;	../src/main.c: 113: sysTickInit();
      0088C0 CD 84 A5         [ 4]  144 	call	_sysTickInit
                                    145 ;	../src/main.c: 116: enableInterrupts();
      0088C3 9A               [ 1]  146 	rim
                                    147 ;	../src/main.c: 118: SetLedMode(0, LED_ON);
      0088C4 4B 03            [ 1]  148 	push	#0x03
      0088C6 4B 00            [ 1]  149 	push	#0x00
      0088C8 CD 85 A4         [ 4]  150 	call	_SetLedMode
      0088CB 85               [ 2]  151 	popw	x
                                    152 ;	../src/main.c: 119: dly(10000l);
      0088CC 4B 10            [ 1]  153 	push	#0x10
      0088CE 4B 27            [ 1]  154 	push	#0x27
      0088D0 5F               [ 1]  155 	clrw	x
      0088D1 89               [ 2]  156 	pushw	x
      0088D2 CD 84 C7         [ 4]  157 	call	_dly
      0088D5 5B 04            [ 2]  158 	addw	sp, #4
                                    159 ;	../src/main.c: 120: SetLedMode(0, LED_OFF);
      0088D7 4B 00            [ 1]  160 	push	#0x00
      0088D9 4B 00            [ 1]  161 	push	#0x00
      0088DB CD 85 A4         [ 4]  162 	call	_SetLedMode
      0088DE 85               [ 2]  163 	popw	x
                                    164 ;	../src/main.c: 121: dly(2000l);
      0088DF 4B D0            [ 1]  165 	push	#0xd0
      0088E1 4B 07            [ 1]  166 	push	#0x07
      0088E3 5F               [ 1]  167 	clrw	x
      0088E4 89               [ 2]  168 	pushw	x
      0088E5 CD 84 C7         [ 4]  169 	call	_dly
      0088E8 5B 04            [ 2]  170 	addw	sp, #4
                                    171 ;	../src/main.c: 125: while(BUTTON_LNG_PRESSED != ReadButtonState());
      0088EA                        172 00101$:
      0088EA CD 85 99         [ 4]  173 	call	_ReadButtonState
      0088ED A1 02            [ 1]  174 	cp	a, #0x02
      0088EF 26 F9            [ 1]  175 	jrne	00101$
                                    176 ;	../src/main.c: 130: res |= pf_mount(&fid);	
      0088F1 96               [ 1]  177 	ldw	x, sp
      0088F2 1C 00 03         [ 2]  178 	addw	x, #3
      0088F5 89               [ 2]  179 	pushw	x
      0088F6 CD 96 0F         [ 4]  180 	call	_pf_mount
      0088F9 85               [ 2]  181 	popw	x
      0088FA 6B 34            [ 1]  182 	ld	(0x34, sp), a
                                    183 ;	../src/main.c: 131: res |= pf_open("CFG");
      0088FC 4B 0D            [ 1]  184 	push	#<(___str_0+0)
      0088FE 4B 81            [ 1]  185 	push	#((___str_0+0) >> 8)
      008900 CD 98 5D         [ 4]  186 	call	_pf_open
      008903 85               [ 2]  187 	popw	x
      008904 1A 34            [ 1]  188 	or	a, (0x34, sp)
      008906 6B 34            [ 1]  189 	ld	(0x34, sp), a
                                    190 ;	../src/main.c: 132: res |= pf_read(cfg, 13 , &pbr);
      008908 96               [ 1]  191 	ldw	x, sp
      008909 5C               [ 1]  192 	incw	x
      00890A 89               [ 2]  193 	pushw	x
      00890B 4B 0D            [ 1]  194 	push	#0x0d
      00890D 4B 00            [ 1]  195 	push	#0x00
      00890F 4B 4B            [ 1]  196 	push	#<(_cfg+0)
      008911 4B 02            [ 1]  197 	push	#((_cfg+0) >> 8)
      008913 CD 98 EE         [ 4]  198 	call	_pf_read
      008916 5B 06            [ 2]  199 	addw	sp, #6
      008918 1A 34            [ 1]  200 	or	a, (0x34, sp)
      00891A 6B 34            [ 1]  201 	ld	(0x34, sp), a
                                    202 ;	../src/main.c: 134: res |= GetCfg(cfg, &loggerCfg);
      00891C 4B 58            [ 1]  203 	push	#<(_loggerCfg+0)
      00891E 4B 02            [ 1]  204 	push	#((_loggerCfg+0) >> 8)
      008920 4B 4B            [ 1]  205 	push	#<(_cfg+0)
      008922 4B 02            [ 1]  206 	push	#((_cfg+0) >> 8)
      008924 CD 8C 01         [ 4]  207 	call	_GetCfg
      008927 5B 04            [ 2]  208 	addw	sp, #4
      008929 9F               [ 1]  209 	ld	a, xl
      00892A 1A 34            [ 1]  210 	or	a, (0x34, sp)
      00892C 6B 30            [ 1]  211 	ld	(0x30, sp), a
                                    212 ;	../src/main.c: 138: fileBlkCnt = loggerCfg.fileSzInBlock;
      00892E AE 02 5F         [ 2]  213 	ldw	x, #(_loggerCfg+0)+7
      008931 1F 31            [ 2]  214 	ldw	(0x31, sp), x
                                    215 ;	../src/main.c: 141: res |= pf_open(loggerCfg.firstFileName);
      008933 AE 02 5A         [ 2]  216 	ldw	x, #(_loggerCfg+0)+2
      008936 1F 33            [ 2]  217 	ldw	(0x33, sp), x
                                    218 ;	../src/main.c: 136: if(FR_OK == res){
      008938 0D 30            [ 1]  219 	tnz	(0x30, sp)
      00893A 26 35            [ 1]  220 	jrne	00108$
                                    221 ;	../src/main.c: 138: fileBlkCnt = loggerCfg.fileSzInBlock;
      00893C 1E 31            [ 2]  222 	ldw	x, (0x31, sp)
      00893E 90 93            [ 1]  223 	ldw	y, x
      008940 90 EE 02         [ 2]  224 	ldw	y, (0x2, y)
      008943 FE               [ 2]  225 	ldw	x, (x)
      008944 90 CF 02 6C      [ 2]  226 	ldw	_fileBlkCnt+2, y
      008948 CF 02 6A         [ 2]  227 	ldw	_fileBlkCnt+0, x
                                    228 ;	../src/main.c: 139: fileNoCnt = loggerCfg.fileNo;
      00894B CE 02 63         [ 2]  229 	ldw	x, _loggerCfg+11
      00894E CF 02 6E         [ 2]  230 	ldw	_fileNoCnt+0, x
                                    231 ;	../src/main.c: 141: res |= pf_open(loggerCfg.firstFileName);
      008951 1E 33            [ 2]  232 	ldw	x, (0x33, sp)
      008953 89               [ 2]  233 	pushw	x
      008954 CD 98 5D         [ 4]  234 	call	_pf_open
      008957 85               [ 2]  235 	popw	x
                                    236 ;	../src/main.c: 143: if(FR_OK == res){
      008958 1A 30            [ 1]  237 	or	a, (0x30, sp)
      00895A 26 06            [ 1]  238 	jrne	00105$
                                    239 ;	../src/main.c: 146: fsm.state = S0_RST;
      00895C 0F 2D            [ 1]  240 	clr	(0x2d, sp)
                                    241 ;	../src/main.c: 147: fsm.error = NO_ERR;
      00895E 0F 2E            [ 1]  242 	clr	(0x2e, sp)
      008960 20 08            [ 2]  243 	jra	00106$
      008962                        244 00105$:
                                    245 ;	../src/main.c: 150: fsm.state = S4_ERR;
      008962 A6 04            [ 1]  246 	ld	a, #0x04
      008964 6B 2D            [ 1]  247 	ld	(0x2d, sp), a
                                    248 ;	../src/main.c: 151: fsm.error = ERR_CARD_INIT;
      008966 A6 01            [ 1]  249 	ld	a, #0x01
      008968 6B 2E            [ 1]  250 	ld	(0x2e, sp), a
      00896A                        251 00106$:
                                    252 ;	../src/main.c: 154: disableInterrupts();
      00896A 9B               [ 1]  253 	sim
                                    254 ;	../src/main.c: 155: adcInit();
      00896B CD 81 67         [ 4]  255 	call	_adcInit
                                    256 ;	../src/main.c: 157: enableInterrupts();
      00896E 9A               [ 1]  257 	rim
      00896F 20 08            [ 2]  258 	jra	00109$
      008971                        259 00108$:
                                    260 ;	../src/main.c: 160: fsm.state = S4_ERR;
      008971 A6 04            [ 1]  261 	ld	a, #0x04
      008973 6B 2D            [ 1]  262 	ld	(0x2d, sp), a
                                    263 ;	../src/main.c: 161: fsm.error = ERR_CARD_INIT;
      008975 A6 01            [ 1]  264 	ld	a, #0x01
      008977 6B 2E            [ 1]  265 	ld	(0x2e, sp), a
      008979                        266 00109$:
                                    267 ;	../src/main.c: 163: SetLedMode(0, LED_TOGGLE_FAST);
      008979 4B 02            [ 1]  268 	push	#0x02
      00897B 4B 00            [ 1]  269 	push	#0x00
      00897D CD 85 A4         [ 4]  270 	call	_SetLedMode
      008980 85               [ 2]  271 	popw	x
                                    272 ;	../src/main.c: 165: while(1){
      008981 16 31            [ 2]  273 	ldw	y, (0x31, sp)
      008983 17 2F            [ 2]  274 	ldw	(0x2f, sp), y
      008985 16 33            [ 2]  275 	ldw	y, (0x33, sp)
      008987 17 31            [ 2]  276 	ldw	(0x31, sp), y
      008989                        277 00141$:
                                    278 ;	../src/main.c: 166: bs = ReadButtonState();
      008989 CD 85 99         [ 4]  279 	call	_ReadButtonState
                                    280 ;	../src/main.c: 167: if(BUTTON_LNG_PRESSED == bs){
      00898C A1 02            [ 1]  281 	cp	a, #0x02
      00898E 26 04            [ 1]  282 	jrne	00111$
                                    283 ;	../src/main.c: 168: fsm.state = S5_COMPLETE;
      008990 A6 05            [ 1]  284 	ld	a, #0x05
      008992 6B 2D            [ 1]  285 	ld	(0x2d, sp), a
      008994                        286 00111$:
                                    287 ;	../src/main.c: 173: switch (fsm.state){
      008994 7B 2D            [ 1]  288 	ld	a, (0x2d, sp)
      008996 A1 05            [ 1]  289 	cp	a, #0x05
      008998 22 EF            [ 1]  290 	jrugt	00141$
      00899A 5F               [ 1]  291 	clrw	x
      00899B 97               [ 1]  292 	ld	xl, a
      00899C 58               [ 2]  293 	sllw	x
      00899D DE 89 A1         [ 2]  294 	ldw	x, (#00224$, x)
      0089A0 FC               [ 2]  295 	jp	(x)
      0089A1                        296 00224$:
      0089A1 89 AD                  297 	.dw	#00112$
      0089A3 89 D8                  298 	.dw	#00122$
      0089A5 89 D8                  299 	.dw	#00122$
      0089A7 89 E3                  300 	.dw	#00123$
      0089A9 8A 1F                  301 	.dw	#00130$
      0089AB 8A 31                  302 	.dw	#00134$
                                    303 ;	../src/main.c: 174: case S0_RST:
      0089AD                        304 00112$:
                                    305 ;	../src/main.c: 177: if( 0x3 == buffer_rdy ){
      0089AD C6 00 01         [ 1]  306 	ld	a, _buffer_rdy+0
      0089B0 A1 03            [ 1]  307 	cp	a, #0x03
      0089B2 26 0B            [ 1]  308 	jrne	00119$
                                    309 ;	../src/main.c: 180: fsm.state = S4_ERR;
      0089B4 A6 04            [ 1]  310 	ld	a, #0x04
      0089B6 6B 2D            [ 1]  311 	ld	(0x2d, sp), a
                                    312 ;	../src/main.c: 181: fsm.error = ERR_BUFF_OVERLAP;
      0089B8 96               [ 1]  313 	ldw	x, sp
      0089B9 A6 05            [ 1]  314 	ld	a, #0x05
      0089BB E7 2E            [ 1]  315 	ld	(46, x), a
      0089BD 20 CA            [ 2]  316 	jra	00141$
      0089BF                        317 00119$:
                                    318 ;	../src/main.c: 182: } else if (0x01 == buffer_rdy) {
      0089BF C6 00 01         [ 1]  319 	ld	a, _buffer_rdy+0
      0089C2 4A               [ 1]  320 	dec	a
      0089C3 26 06            [ 1]  321 	jrne	00116$
                                    322 ;	../src/main.c: 184: fsm.state = S1_WR_BUF0;
      0089C5 A6 01            [ 1]  323 	ld	a, #0x01
      0089C7 6B 2D            [ 1]  324 	ld	(0x2d, sp), a
      0089C9 20 BE            [ 2]  325 	jra	00141$
      0089CB                        326 00116$:
                                    327 ;	../src/main.c: 185: } else if ( 0x02 == buffer_rdy) {
      0089CB C6 00 01         [ 1]  328 	ld	a, _buffer_rdy+0
      0089CE A1 02            [ 1]  329 	cp	a, #0x02
      0089D0 26 B7            [ 1]  330 	jrne	00141$
                                    331 ;	../src/main.c: 187: fsm.state = S2_WR_BUF1;
      0089D2 A6 02            [ 1]  332 	ld	a, #0x02
      0089D4 6B 2D            [ 1]  333 	ld	(0x2d, sp), a
                                    334 ;	../src/main.c: 189: break;
      0089D6 20 B1            [ 2]  335 	jra	00141$
                                    336 ;	../src/main.c: 191: case S2_WR_BUF1:
      0089D8                        337 00122$:
                                    338 ;	../src/main.c: 193: Wr2SD(&fsm);
      0089D8 96               [ 1]  339 	ldw	x, sp
      0089D9 1C 00 2D         [ 2]  340 	addw	x, #45
      0089DC 89               [ 2]  341 	pushw	x
      0089DD CD 8A 46         [ 4]  342 	call	_Wr2SD
      0089E0 85               [ 2]  343 	popw	x
                                    344 ;	../src/main.c: 194: break;
      0089E1 20 A6            [ 2]  345 	jra	00141$
                                    346 ;	../src/main.c: 195: case S3_NXT_FILE:
      0089E3                        347 00123$:
                                    348 ;	../src/main.c: 196: fileBlkCnt = loggerCfg.fileSzInBlock;
      0089E3 1E 2F            [ 2]  349 	ldw	x, (0x2f, sp)
      0089E5 90 93            [ 1]  350 	ldw	y, x
      0089E7 90 EE 02         [ 2]  351 	ldw	y, (0x2, y)
      0089EA FE               [ 2]  352 	ldw	x, (x)
      0089EB 90 CF 02 6C      [ 2]  353 	ldw	_fileBlkCnt+2, y
      0089EF CF 02 6A         [ 2]  354 	ldw	_fileBlkCnt+0, x
                                    355 ;	../src/main.c: 198: if(--fileNoCnt != 0){
      0089F2 CE 02 6E         [ 2]  356 	ldw	x, _fileNoCnt+0
      0089F5 5A               [ 2]  357 	decw	x
      0089F6 CF 02 6E         [ 2]  358 	ldw	_fileNoCnt+0, x
      0089F9 27 1D            [ 1]  359 	jreq	00128$
                                    360 ;	../src/main.c: 200: GetNxtFileName(loggerCfg.firstFileName);
      0089FB 1E 31            [ 2]  361 	ldw	x, (0x31, sp)
      0089FD 89               [ 2]  362 	pushw	x
      0089FE CD 8A EB         [ 4]  363 	call	_GetNxtFileName
      008A01 85               [ 2]  364 	popw	x
                                    365 ;	../src/main.c: 202: res = pf_open(loggerCfg.firstFileName);
      008A02 1E 33            [ 2]  366 	ldw	x, (0x33, sp)
      008A04 89               [ 2]  367 	pushw	x
      008A05 CD 98 5D         [ 4]  368 	call	_pf_open
      008A08 85               [ 2]  369 	popw	x
                                    370 ;	../src/main.c: 203: if( FR_OK != res ){
      008A09 4D               [ 1]  371 	tnz	a
      008A0A 27 07            [ 1]  372 	jreq	00125$
                                    373 ;	../src/main.c: 204: fsm.state = S4_ERR;
      008A0C A6 04            [ 1]  374 	ld	a, #0x04
      008A0E 6B 2D            [ 1]  375 	ld	(0x2d, sp), a
      008A10 CC 89 89         [ 2]  376 	jp	00141$
      008A13                        377 00125$:
                                    378 ;	../src/main.c: 207: fsm.state = S0_RST;
      008A13 0F 2D            [ 1]  379 	clr	(0x2d, sp)
      008A15 CC 89 89         [ 2]  380 	jp	00141$
      008A18                        381 00128$:
                                    382 ;	../src/main.c: 213: fsm.state = S5_COMPLETE;
      008A18 A6 05            [ 1]  383 	ld	a, #0x05
      008A1A 6B 2D            [ 1]  384 	ld	(0x2d, sp), a
                                    385 ;	../src/main.c: 216: break;
      008A1C CC 89 89         [ 2]  386 	jp	00141$
                                    387 ;	../src/main.c: 218: case S4_ERR:
      008A1F                        388 00130$:
                                    389 ;	../src/main.c: 219: SetLedMode(0, LED_OFF);
      008A1F 4B 00            [ 1]  390 	push	#0x00
      008A21 4B 00            [ 1]  391 	push	#0x00
      008A23 CD 85 A4         [ 4]  392 	call	_SetLedMode
      008A26 85               [ 2]  393 	popw	x
                                    394 ;	../src/main.c: 220: SetLedMode(1, LED_TOGGLE_FAST);
      008A27 4B 02            [ 1]  395 	push	#0x02
      008A29 4B 01            [ 1]  396 	push	#0x01
      008A2B CD 85 A4         [ 4]  397 	call	_SetLedMode
      008A2E 85               [ 2]  398 	popw	x
                                    399 ;	../src/main.c: 221: while(1); break;
      008A2F                        400 00132$:
      008A2F 20 FE            [ 2]  401 	jra	00132$
                                    402 ;	../src/main.c: 222: case S5_COMPLETE:
      008A31                        403 00134$:
                                    404 ;	../src/main.c: 223: SetLedMode(0, LED_OFF);
      008A31 4B 00            [ 1]  405 	push	#0x00
      008A33 4B 00            [ 1]  406 	push	#0x00
      008A35 CD 85 A4         [ 4]  407 	call	_SetLedMode
      008A38 85               [ 2]  408 	popw	x
                                    409 ;	../src/main.c: 224: SetLedMode(1, LED_ON);
      008A39 4B 03            [ 1]  410 	push	#0x03
      008A3B 4B 01            [ 1]  411 	push	#0x01
      008A3D CD 85 A4         [ 4]  412 	call	_SetLedMode
      008A40 85               [ 2]  413 	popw	x
                                    414 ;	../src/main.c: 225: while(1);
      008A41                        415 00136$:
      008A41 20 FE            [ 2]  416 	jra	00136$
                                    417 ;	../src/main.c: 228: }
                                    418 ;	../src/main.c: 230: }
      008A43 5B 34            [ 2]  419 	addw	sp, #52
      008A45 81               [ 4]  420 	ret
                                    421 ;	../src/main.c: 243: static void Wr2SD( fsm_t * pfsm ){
                                    422 ;	-----------------------------------------
                                    423 ;	 function Wr2SD
                                    424 ;	-----------------------------------------
      008A46                        425 _Wr2SD:
      008A46 52 06            [ 2]  426 	sub	sp, #6
                                    427 ;	../src/main.c: 250: if( S1_WR_BUF0 == pfsm->state){
      008A48 16 09            [ 2]  428 	ldw	y, (0x09, sp)
      008A4A 17 03            [ 2]  429 	ldw	(0x03, sp), y
      008A4C 93               [ 1]  430 	ldw	x, y
      008A4D F6               [ 1]  431 	ld	a, (x)
      008A4E 4A               [ 1]  432 	dec	a
      008A4F 26 07            [ 1]  433 	jrne	00102$
                                    434 ;	../src/main.c: 251: pBuf = adcBuffer0; bufNo = 0;
      008A51 90 AE 00 02      [ 2]  435 	ldw	y, #_adcBuffer0+0
      008A55 5F               [ 1]  436 	clrw	x
      008A56 20 07            [ 2]  437 	jra	00103$
      008A58                        438 00102$:
                                    439 ;	../src/main.c: 253: pBuf = adcBuffer1; bufNo = 1;
      008A58 90 AE 01 02      [ 2]  440 	ldw	y, #(_adcBuffer1+0)
      008A5C A6 01            [ 1]  441 	ld	a, #0x01
      008A5E 97               [ 1]  442 	ld	xl, a
      008A5F                        443 00103$:
                                    444 ;	../src/main.c: 255: RELEASE_BUFF_FOR_WR(bufNo); //clear this flag
      008A5F A6 01            [ 1]  445 	ld	a, #0x01
      008A61 88               [ 1]  446 	push	a
      008A62 9F               [ 1]  447 	ld	a, xl
      008A63 4D               [ 1]  448 	tnz	a
      008A64 27 05            [ 1]  449 	jreq	00143$
      008A66                        450 00142$:
      008A66 08 01            [ 1]  451 	sll	(1, sp)
      008A68 4A               [ 1]  452 	dec	a
      008A69 26 FB            [ 1]  453 	jrne	00142$
      008A6B                        454 00143$:
      008A6B 84               [ 1]  455 	pop	a
      008A6C 43               [ 1]  456 	cpl	a
      008A6D C4 00 01         [ 1]  457 	and	a, _buffer_rdy+0
      008A70 C7 00 01         [ 1]  458 	ld	_buffer_rdy+0, a
                                    459 ;	../src/main.c: 259: res = pf_write((void*)pBuf,BUFFER_SZ_IN_BYTES, &pbr);
      008A73 96               [ 1]  460 	ldw	x, sp
      008A74 5C               [ 1]  461 	incw	x
      008A75 89               [ 2]  462 	pushw	x
      008A76 4B 00            [ 1]  463 	push	#0x00
      008A78 4B 01            [ 1]  464 	push	#0x01
      008A7A 90 89            [ 2]  465 	pushw	y
      008A7C CD 9A DC         [ 4]  466 	call	_pf_write
      008A7F 5B 06            [ 2]  467 	addw	sp, #6
                                    468 ;	../src/main.c: 266: pfsm->error = ERR_WR_DATA;
      008A81 1E 03            [ 2]  469 	ldw	x, (0x03, sp)
      008A83 5C               [ 1]  470 	incw	x
      008A84 1F 05            [ 2]  471 	ldw	(0x05, sp), x
                                    472 ;	../src/main.c: 263: if(FR_OK != res){
      008A86 4D               [ 1]  473 	tnz	a
      008A87 27 0C            [ 1]  474 	jreq	00105$
                                    475 ;	../src/main.c: 266: pfsm->error = ERR_WR_DATA;
      008A89 1E 05            [ 2]  476 	ldw	x, (0x05, sp)
      008A8B A6 02            [ 1]  477 	ld	a, #0x02
      008A8D F7               [ 1]  478 	ld	(x), a
                                    479 ;	../src/main.c: 267: pfsm->state = S4_ERR;
      008A8E 1E 03            [ 2]  480 	ldw	x, (0x03, sp)
      008A90 A6 04            [ 1]  481 	ld	a, #0x04
      008A92 F7               [ 1]  482 	ld	(x), a
                                    483 ;	../src/main.c: 268: return;
      008A93 20 53            [ 2]  484 	jra	00112$
      008A95                        485 00105$:
                                    486 ;	../src/main.c: 271: if(NO_BUFF_PER_BLK == ++blkCnt){
      008A95 72 5C 02 69      [ 1]  487 	inc	_blkCnt+0
      008A99 C6 02 69         [ 1]  488 	ld	a, _blkCnt+0
      008A9C A1 02            [ 1]  489 	cp	a, #0x02
      008A9E 26 45            [ 1]  490 	jrne	00111$
                                    491 ;	../src/main.c: 273: blkCnt = 0;
      008AA0 72 5F 02 69      [ 1]  492 	clr	_blkCnt+0
                                    493 ;	../src/main.c: 274: res = pf_write(0,0,&pbr);
      008AA4 96               [ 1]  494 	ldw	x, sp
      008AA5 5C               [ 1]  495 	incw	x
      008AA6 89               [ 2]  496 	pushw	x
      008AA7 5F               [ 1]  497 	clrw	x
      008AA8 89               [ 2]  498 	pushw	x
      008AA9 5F               [ 1]  499 	clrw	x
      008AAA 89               [ 2]  500 	pushw	x
      008AAB CD 9A DC         [ 4]  501 	call	_pf_write
      008AAE 5B 06            [ 2]  502 	addw	sp, #6
                                    503 ;	../src/main.c: 277: if(FR_OK != res){
      008AB0 4D               [ 1]  504 	tnz	a
      008AB1 27 0C            [ 1]  505 	jreq	00107$
                                    506 ;	../src/main.c: 279: pfsm->error = ERR_WR_NO_RESP;
      008AB3 1E 05            [ 2]  507 	ldw	x, (0x05, sp)
      008AB5 A6 03            [ 1]  508 	ld	a, #0x03
      008AB7 F7               [ 1]  509 	ld	(x), a
                                    510 ;	../src/main.c: 280: pfsm->state = S4_ERR;
      008AB8 1E 03            [ 2]  511 	ldw	x, (0x03, sp)
      008ABA A6 04            [ 1]  512 	ld	a, #0x04
      008ABC F7               [ 1]  513 	ld	(x), a
                                    514 ;	../src/main.c: 281: return;
      008ABD 20 29            [ 2]  515 	jra	00112$
      008ABF                        516 00107$:
                                    517 ;	../src/main.c: 284: if(0 == --fileBlkCnt){
      008ABF CE 02 6C         [ 2]  518 	ldw	x, _fileBlkCnt+2
      008AC2 1D 00 01         [ 2]  519 	subw	x, #0x0001
      008AC5 90 CE 02 6A      [ 2]  520 	ldw	y, _fileBlkCnt+0
      008AC9 24 02            [ 1]  521 	jrnc	00149$
      008ACB 90 5A            [ 2]  522 	decw	y
      008ACD                        523 00149$:
      008ACD CF 02 6C         [ 2]  524 	ldw	_fileBlkCnt+2, x
      008AD0 90 CF 02 6A      [ 2]  525 	ldw	_fileBlkCnt+0, y
      008AD4 CE 02 6C         [ 2]  526 	ldw	x, _fileBlkCnt+2
      008AD7 26 0C            [ 1]  527 	jrne	00111$
      008AD9 CE 02 6A         [ 2]  528 	ldw	x, _fileBlkCnt+0
      008ADC 26 07            [ 1]  529 	jrne	00111$
                                    530 ;	../src/main.c: 287: pfsm->state = S3_NXT_FILE;
      008ADE 1E 03            [ 2]  531 	ldw	x, (0x03, sp)
      008AE0 A6 03            [ 1]  532 	ld	a, #0x03
      008AE2 F7               [ 1]  533 	ld	(x), a
                                    534 ;	../src/main.c: 288: return;
      008AE3 20 03            [ 2]  535 	jra	00112$
      008AE5                        536 00111$:
                                    537 ;	../src/main.c: 293: pfsm->state = S0_RST; 
      008AE5 1E 03            [ 2]  538 	ldw	x, (0x03, sp)
      008AE7 7F               [ 1]  539 	clr	(x)
      008AE8                        540 00112$:
                                    541 ;	../src/main.c: 294: }
      008AE8 5B 06            [ 2]  542 	addw	sp, #6
      008AEA 81               [ 4]  543 	ret
                                    544 ;	../src/main.c: 307: static void GetNxtFileName( char * fname){
                                    545 ;	-----------------------------------------
                                    546 ;	 function GetNxtFileName
                                    547 ;	-----------------------------------------
      008AEB                        548 _GetNxtFileName:
      008AEB 52 05            [ 2]  549 	sub	sp, #5
                                    550 ;	../src/main.c: 308: uint8_t val = 0;
      008AED 0F 01            [ 1]  551 	clr	(0x01, sp)
                                    552 ;	../src/main.c: 310: if(0x39 == fname[3]){
      008AEF 1E 08            [ 2]  553 	ldw	x, (0x08, sp)
      008AF1 E6 03            [ 1]  554 	ld	a, (0x3, x)
                                    555 ;	../src/main.c: 311: val = 0x01;
      008AF3 A0 39            [ 1]  556 	sub	a, #0x39
      008AF5 26 03            [ 1]  557 	jrne	00102$
      008AF7 4C               [ 1]  558 	inc	a
      008AF8 6B 01            [ 1]  559 	ld	(0x01, sp), a
      008AFA                        560 00102$:
                                    561 ;	../src/main.c: 313: if(0x39 == fname[2]) {
      008AFA 1E 08            [ 2]  562 	ldw	x, (0x08, sp)
      008AFC E6 02            [ 1]  563 	ld	a, (0x2, x)
      008AFE A1 39            [ 1]  564 	cp	a, #0x39
      008B00 26 06            [ 1]  565 	jrne	00104$
                                    566 ;	../src/main.c: 314: val += 0x02;
      008B02 7B 01            [ 1]  567 	ld	a, (0x01, sp)
      008B04 AB 02            [ 1]  568 	add	a, #0x02
      008B06 6B 01            [ 1]  569 	ld	(0x01, sp), a
      008B08                        570 00104$:
                                    571 ;	../src/main.c: 316: if(0x39 == fname[1]) {
      008B08 1E 08            [ 2]  572 	ldw	x, (0x08, sp)
      008B0A E6 01            [ 1]  573 	ld	a, (0x1, x)
      008B0C A1 39            [ 1]  574 	cp	a, #0x39
      008B0E 26 06            [ 1]  575 	jrne	00106$
                                    576 ;	../src/main.c: 317: val += 0x04;
      008B10 7B 01            [ 1]  577 	ld	a, (0x01, sp)
      008B12 AB 04            [ 1]  578 	add	a, #0x04
      008B14 6B 01            [ 1]  579 	ld	(0x01, sp), a
      008B16                        580 00106$:
                                    581 ;	../src/main.c: 319: if(0x39 == fname[0]) {
      008B16 16 08            [ 2]  582 	ldw	y, (0x08, sp)
      008B18 17 02            [ 2]  583 	ldw	(0x02, sp), y
      008B1A 93               [ 1]  584 	ldw	x, y
      008B1B F6               [ 1]  585 	ld	a, (x)
      008B1C A1 39            [ 1]  586 	cp	a, #0x39
      008B1E 26 06            [ 1]  587 	jrne	00108$
                                    588 ;	../src/main.c: 320: val += 0x08;
      008B20 7B 01            [ 1]  589 	ld	a, (0x01, sp)
      008B22 AB 08            [ 1]  590 	add	a, #0x08
      008B24 6B 01            [ 1]  591 	ld	(0x01, sp), a
      008B26                        592 00108$:
                                    593 ;	../src/main.c: 324: case 0x01: fname[3] = 0x30; 
      008B26 1E 02            [ 2]  594 	ldw	x, (0x02, sp)
      008B28 1C 00 03         [ 2]  595 	addw	x, #0x0003
                                    596 ;	../src/main.c: 325: fname[2]++;break;
      008B2B 16 02            [ 2]  597 	ldw	y, (0x02, sp)
      008B2D 90 5C            [ 1]  598 	incw	y
      008B2F 90 5C            [ 1]  599 	incw	y
      008B31 17 04            [ 2]  600 	ldw	(0x04, sp), y
                                    601 ;	../src/main.c: 323: switch(val){
      008B33 7B 01            [ 1]  602 	ld	a, (0x01, sp)
      008B35 4A               [ 1]  603 	dec	a
      008B36 27 18            [ 1]  604 	jreq	00109$
                                    605 ;	../src/main.c: 328: fname[1]++; break;
      008B38 16 02            [ 2]  606 	ldw	y, (0x02, sp)
      008B3A 90 5C            [ 1]  607 	incw	y
                                    608 ;	../src/main.c: 323: switch(val){
      008B3C 7B 01            [ 1]  609 	ld	a, (0x01, sp)
      008B3E A1 03            [ 1]  610 	cp	a, #0x03
      008B40 27 16            [ 1]  611 	jreq	00110$
      008B42 7B 01            [ 1]  612 	ld	a, (0x01, sp)
      008B44 A1 07            [ 1]  613 	cp	a, #0x07
      008B46 27 1C            [ 1]  614 	jreq	00111$
      008B48 7B 01            [ 1]  615 	ld	a, (0x01, sp)
      008B4A A1 0F            [ 1]  616 	cp	a, #0x0f
      008B4C 27 25            [ 1]  617 	jreq	00112$
      008B4E 20 34            [ 2]  618 	jra	00113$
                                    619 ;	../src/main.c: 324: case 0x01: fname[3] = 0x30; 
      008B50                        620 00109$:
      008B50 A6 30            [ 1]  621 	ld	a, #0x30
      008B52 F7               [ 1]  622 	ld	(x), a
                                    623 ;	../src/main.c: 325: fname[2]++;break;
      008B53 1E 04            [ 2]  624 	ldw	x, (0x04, sp)
      008B55 7C               [ 1]  625 	inc	(x)
      008B56 20 2D            [ 2]  626 	jra	00115$
                                    627 ;	../src/main.c: 326: case 0x03: fname[3] = 0x30; 
      008B58                        628 00110$:
      008B58 A6 30            [ 1]  629 	ld	a, #0x30
      008B5A F7               [ 1]  630 	ld	(x), a
                                    631 ;	../src/main.c: 327: fname[2] = 0x30; 
      008B5B 1E 04            [ 2]  632 	ldw	x, (0x04, sp)
      008B5D A6 30            [ 1]  633 	ld	a, #0x30
      008B5F F7               [ 1]  634 	ld	(x), a
                                    635 ;	../src/main.c: 328: fname[1]++; break;
      008B60 90 7C            [ 1]  636 	inc	(y)
      008B62 20 21            [ 2]  637 	jra	00115$
                                    638 ;	../src/main.c: 329: case 0x07: fname[3] = 0x30; 
      008B64                        639 00111$:
      008B64 A6 30            [ 1]  640 	ld	a, #0x30
      008B66 F7               [ 1]  641 	ld	(x), a
                                    642 ;	../src/main.c: 330: fname[2] = 0x30; 
      008B67 1E 04            [ 2]  643 	ldw	x, (0x04, sp)
                                    644 ;	../src/main.c: 331: fname[1] = 0x30; 
      008B69 A6 30            [ 1]  645 	ld	a, #0x30
      008B6B F7               [ 1]  646 	ld	(x), a
      008B6C 90 F7            [ 1]  647 	ld	(y), a
                                    648 ;	../src/main.c: 332: fname[0]++; break;
      008B6E 1E 02            [ 2]  649 	ldw	x, (0x02, sp)
      008B70 7C               [ 1]  650 	inc	(x)
      008B71 20 12            [ 2]  651 	jra	00115$
                                    652 ;	../src/main.c: 333: case 0x0f: fname[3] = 0x30; 
      008B73                        653 00112$:
      008B73 A6 30            [ 1]  654 	ld	a, #0x30
      008B75 F7               [ 1]  655 	ld	(x), a
                                    656 ;	../src/main.c: 334: fname[2] = 0x30; 
      008B76 1E 04            [ 2]  657 	ldw	x, (0x04, sp)
                                    658 ;	../src/main.c: 335: fname[1] = 0x30; 
      008B78 A6 30            [ 1]  659 	ld	a, #0x30
      008B7A F7               [ 1]  660 	ld	(x), a
      008B7B 90 F7            [ 1]  661 	ld	(y), a
                                    662 ;	../src/main.c: 336: fname[0] = 0x30; break;
      008B7D 1E 02            [ 2]  663 	ldw	x, (0x02, sp)
      008B7F A6 30            [ 1]  664 	ld	a, #0x30
      008B81 F7               [ 1]  665 	ld	(x), a
      008B82 20 01            [ 2]  666 	jra	00115$
                                    667 ;	../src/main.c: 337: default: fname[3]++; break;
      008B84                        668 00113$:
      008B84 7C               [ 1]  669 	inc	(x)
                                    670 ;	../src/main.c: 338: }
      008B85                        671 00115$:
                                    672 ;	../src/main.c: 339: }
      008B85 5B 05            [ 2]  673 	addw	sp, #5
      008B87 81               [ 4]  674 	ret
                                    675 ;	../src/main.c: 352: static void ConvertFileName(uint16_t firstFileName, char * fname){
                                    676 ;	-----------------------------------------
                                    677 ;	 function ConvertFileName
                                    678 ;	-----------------------------------------
      008B88                        679 _ConvertFileName:
      008B88 52 04            [ 2]  680 	sub	sp, #4
                                    681 ;	../src/main.c: 355: val = firstFileName/1000;
      008B8A 16 07            [ 2]  682 	ldw	y, (0x07, sp)
      008B8C 17 03            [ 2]  683 	ldw	(0x03, sp), y
      008B8E 93               [ 1]  684 	ldw	x, y
      008B8F 90 AE 03 E8      [ 2]  685 	ldw	y, #0x03e8
      008B93 65               [ 2]  686 	divw	x, y
                                    687 ;	../src/main.c: 356: fname[0] = val + 0x30;
      008B94 16 09            [ 2]  688 	ldw	y, (0x09, sp)
      008B96 17 01            [ 2]  689 	ldw	(0x01, sp), y
      008B98 9F               [ 1]  690 	ld	a, xl
      008B99 AB 30            [ 1]  691 	add	a, #0x30
      008B9B 16 01            [ 2]  692 	ldw	y, (0x01, sp)
      008B9D 90 F7            [ 1]  693 	ld	(y), a
                                    694 ;	../src/main.c: 357: firstFileName -=  val*1000;
      008B9F 89               [ 2]  695 	pushw	x
      008BA0 4B E8            [ 1]  696 	push	#0xe8
      008BA2 4B 03            [ 1]  697 	push	#0x03
      008BA4 CD 9D 67         [ 4]  698 	call	__mulint
      008BA7 5B 04            [ 2]  699 	addw	sp, #4
      008BA9 50               [ 2]  700 	negw	x
      008BAA 72 FB 03         [ 2]  701 	addw	x, (0x03, sp)
                                    702 ;	../src/main.c: 358: val = firstFileName/100;
      008BAD 1F 07            [ 2]  703 	ldw	(0x07, sp), x
      008BAF 1F 03            [ 2]  704 	ldw	(0x03, sp), x
      008BB1 90 AE 00 64      [ 2]  705 	ldw	y, #0x0064
      008BB5 65               [ 2]  706 	divw	x, y
                                    707 ;	../src/main.c: 359: fname[1] = val + 0x30;
      008BB6 16 01            [ 2]  708 	ldw	y, (0x01, sp)
      008BB8 90 5C            [ 1]  709 	incw	y
      008BBA 9F               [ 1]  710 	ld	a, xl
      008BBB AB 30            [ 1]  711 	add	a, #0x30
      008BBD 90 F7            [ 1]  712 	ld	(y), a
                                    713 ;	../src/main.c: 360: firstFileName -=  val*100;
      008BBF 89               [ 2]  714 	pushw	x
      008BC0 4B 64            [ 1]  715 	push	#0x64
      008BC2 4B 00            [ 1]  716 	push	#0x00
      008BC4 CD 9D 67         [ 4]  717 	call	__mulint
      008BC7 5B 04            [ 2]  718 	addw	sp, #4
      008BC9 50               [ 2]  719 	negw	x
      008BCA 72 FB 03         [ 2]  720 	addw	x, (0x03, sp)
                                    721 ;	../src/main.c: 361: val = firstFileName/10;
      008BCD 1F 07            [ 2]  722 	ldw	(0x07, sp), x
      008BCF 1F 03            [ 2]  723 	ldw	(0x03, sp), x
      008BD1 90 AE 00 0A      [ 2]  724 	ldw	y, #0x000a
      008BD5 65               [ 2]  725 	divw	x, y
                                    726 ;	../src/main.c: 362: fname[2] = val + 0x30;
      008BD6 16 01            [ 2]  727 	ldw	y, (0x01, sp)
      008BD8 72 A9 00 02      [ 2]  728 	addw	y, #0x0002
      008BDC 9F               [ 1]  729 	ld	a, xl
      008BDD AB 30            [ 1]  730 	add	a, #0x30
      008BDF 90 F7            [ 1]  731 	ld	(y), a
                                    732 ;	../src/main.c: 363: firstFileName -=  val*10;
      008BE1 89               [ 2]  733 	pushw	x
      008BE2 58               [ 2]  734 	sllw	x
      008BE3 58               [ 2]  735 	sllw	x
      008BE4 72 FB 01         [ 2]  736 	addw	x, (1, sp)
      008BE7 58               [ 2]  737 	sllw	x
      008BE8 5B 02            [ 2]  738 	addw	sp, #2
      008BEA 50               [ 2]  739 	negw	x
      008BEB 72 FB 03         [ 2]  740 	addw	x, (0x03, sp)
      008BEE 1F 07            [ 2]  741 	ldw	(0x07, sp), x
                                    742 ;	../src/main.c: 364: fname[3] = firstFileName + 0x30;
      008BF0 1E 01            [ 2]  743 	ldw	x, (0x01, sp)
      008BF2 1C 00 03         [ 2]  744 	addw	x, #0x0003
      008BF5 7B 08            [ 1]  745 	ld	a, (0x08, sp)
      008BF7 AB 30            [ 1]  746 	add	a, #0x30
      008BF9 F7               [ 1]  747 	ld	(x), a
                                    748 ;	../src/main.c: 365: fname[4] = '\0';
      008BFA 1E 01            [ 2]  749 	ldw	x, (0x01, sp)
      008BFC 6F 04            [ 1]  750 	clr	(0x0004, x)
                                    751 ;	../src/main.c: 366: }
      008BFE 5B 04            [ 2]  752 	addw	sp, #4
      008C00 81               [ 4]  753 	ret
                                    754 ;	../src/main.c: 381: static UINT GetCfg( uint8_t * pCfgBuf,  cfg_t * pcfg){
                                    755 ;	-----------------------------------------
                                    756 ;	 function GetCfg
                                    757 ;	-----------------------------------------
      008C01                        758 _GetCfg:
      008C01 52 12            [ 2]  759 	sub	sp, #18
                                    760 ;	../src/main.c: 384: if(!IsValidCfgBuf(pCfgBuf)) return 1; 
      008C03 1E 15            [ 2]  761 	ldw	x, (0x15, sp)
      008C05 89               [ 2]  762 	pushw	x
      008C06 CD 8D 04         [ 4]  763 	call	_IsValidCfgBuf
      008C09 85               [ 2]  764 	popw	x
      008C0A 6B 12            [ 1]  765 	ld	(0x12, sp), a
      008C0C 26 05            [ 1]  766 	jrne	00102$
      008C0E 5F               [ 1]  767 	clrw	x
      008C0F 5C               [ 1]  768 	incw	x
      008C10 CC 8D 01         [ 2]  769 	jp	00106$
      008C13                        770 00102$:
                                    771 ;	../src/main.c: 387: pcfg->sampFreq = pCfgBuf[0]+(((uint16_t)pCfgBuf[1])<<8);
      008C13 16 17            [ 2]  772 	ldw	y, (0x17, sp)
      008C15 17 01            [ 2]  773 	ldw	(0x01, sp), y
      008C17 16 15            [ 2]  774 	ldw	y, (0x15, sp)
      008C19 17 03            [ 2]  775 	ldw	(0x03, sp), y
      008C1B 93               [ 1]  776 	ldw	x, y
      008C1C F6               [ 1]  777 	ld	a, (x)
      008C1D 5F               [ 1]  778 	clrw	x
      008C1E 97               [ 1]  779 	ld	xl, a
      008C1F 16 03            [ 2]  780 	ldw	y, (0x03, sp)
      008C21 90 E6 01         [ 1]  781 	ld	a, (0x1, y)
      008C24 90 95            [ 1]  782 	ld	yh, a
      008C26 4F               [ 1]  783 	clr	a
      008C27 1F 11            [ 2]  784 	ldw	(0x11, sp), x
      008C29 90 97            [ 1]  785 	ld	yl, a
      008C2B 72 F9 11         [ 2]  786 	addw	y, (0x11, sp)
      008C2E 1E 01            [ 2]  787 	ldw	x, (0x01, sp)
      008C30 FF               [ 2]  788 	ldw	(x), y
                                    789 ;	../src/main.c: 389: fID = pCfgBuf[2]+(((uint16_t)pCfgBuf[3])<<8);
      008C31 1E 03            [ 2]  790 	ldw	x, (0x03, sp)
      008C33 E6 02            [ 1]  791 	ld	a, (0x2, x)
      008C35 90 5F            [ 1]  792 	clrw	y
      008C37 90 97            [ 1]  793 	ld	yl, a
      008C39 1E 03            [ 2]  794 	ldw	x, (0x03, sp)
      008C3B E6 03            [ 1]  795 	ld	a, (0x3, x)
      008C3D 95               [ 1]  796 	ld	xh, a
      008C3E 4F               [ 1]  797 	clr	a
      008C3F 17 11            [ 2]  798 	ldw	(0x11, sp), y
      008C41 97               [ 1]  799 	ld	xl, a
      008C42 72 FB 11         [ 2]  800 	addw	x, (0x11, sp)
                                    801 ;	../src/main.c: 391: ConvertFileName(fID, pcfg->firstFileName);
      008C45 16 01            [ 2]  802 	ldw	y, (0x01, sp)
      008C47 72 A9 00 02      [ 2]  803 	addw	y, #0x0002
      008C4B 90 89            [ 2]  804 	pushw	y
      008C4D 89               [ 2]  805 	pushw	x
      008C4E CD 8B 88         [ 4]  806 	call	_ConvertFileName
      008C51 5B 04            [ 2]  807 	addw	sp, #4
                                    808 ;	../src/main.c: 392: pcfg->fileNo = pCfgBuf[4]+(((uint16_t)pCfgBuf[5])<<8);
      008C53 16 01            [ 2]  809 	ldw	y, (0x01, sp)
      008C55 72 A9 00 0B      [ 2]  810 	addw	y, #0x000b
      008C59 1E 03            [ 2]  811 	ldw	x, (0x03, sp)
      008C5B E6 04            [ 1]  812 	ld	a, (0x4, x)
      008C5D 6B 10            [ 1]  813 	ld	(0x10, sp), a
      008C5F 0F 0F            [ 1]  814 	clr	(0x0f, sp)
      008C61 1E 03            [ 2]  815 	ldw	x, (0x03, sp)
      008C63 E6 05            [ 1]  816 	ld	a, (0x5, x)
      008C65 6B 11            [ 1]  817 	ld	(0x11, sp), a
      008C67 0F 12            [ 1]  818 	clr	(0x12, sp)
      008C69 1E 0F            [ 2]  819 	ldw	x, (0x0f, sp)
      008C6B 72 FB 11         [ 2]  820 	addw	x, (0x11, sp)
      008C6E 90 FF            [ 2]  821 	ldw	(y), x
                                    822 ;	../src/main.c: 393: pcfg->fileSzInBlock = pCfgBuf[6]+ \
      008C70 1E 01            [ 2]  823 	ldw	x, (0x01, sp)
      008C72 1C 00 07         [ 2]  824 	addw	x, #0x0007
      008C75 1F 05            [ 2]  825 	ldw	(0x05, sp), x
      008C77 1E 03            [ 2]  826 	ldw	x, (0x03, sp)
      008C79 E6 06            [ 1]  827 	ld	a, (0x6, x)
      008C7B 90 97            [ 1]  828 	ld	yl, a
      008C7D 1E 03            [ 2]  829 	ldw	x, (0x03, sp)
      008C7F E6 07            [ 1]  830 	ld	a, (0x7, x)
      008C81 0F 11            [ 1]  831 	clr	(0x11, sp)
      008C83 5F               [ 1]  832 	clrw	x
      008C84 95               [ 1]  833 	ld	xh, a
      008C85 7B 11            [ 1]  834 	ld	a, (0x11, sp)
      008C87 0F 0A            [ 1]  835 	clr	(0x0a, sp)
      008C89 0F 11            [ 1]  836 	clr	(0x11, sp)
      008C8B 0F 10            [ 1]  837 	clr	(0x10, sp)
      008C8D 0F 0F            [ 1]  838 	clr	(0x0f, sp)
      008C8F 88               [ 1]  839 	push	a
      008C90 90 9F            [ 1]  840 	ld	a, yl
      008C92 1B 0B            [ 1]  841 	add	a, (0x0b, sp)
      008C94 90 97            [ 1]  842 	ld	yl, a
      008C96 9E               [ 1]  843 	ld	a, xh
      008C97 19 12            [ 1]  844 	adc	a, (0x12, sp)
      008C99 90 95            [ 1]  845 	ld	yh, a
      008C9B 84               [ 1]  846 	pop	a
      008C9C 19 10            [ 1]  847 	adc	a, (0x10, sp)
      008C9E 6B 0C            [ 1]  848 	ld	(0x0c, sp), a
      008CA0 9F               [ 1]  849 	ld	a, xl
      008CA1 19 0F            [ 1]  850 	adc	a, (0x0f, sp)
      008CA3 6B 0B            [ 1]  851 	ld	(0x0b, sp), a
      008CA5 1E 03            [ 2]  852 	ldw	x, (0x03, sp)
      008CA7 E6 08            [ 1]  853 	ld	a, (0x8, x)
      008CA9 5F               [ 1]  854 	clrw	x
      008CAA 0F 0F            [ 1]  855 	clr	(0x0f, sp)
      008CAC 0F 12            [ 1]  856 	clr	(0x12, sp)
      008CAE 0F 11            [ 1]  857 	clr	(0x11, sp)
      008CB0 72 F9 11         [ 2]  858 	addw	y, (0x11, sp)
      008CB3 19 0C            [ 1]  859 	adc	a, (0x0c, sp)
      008CB5 6B 08            [ 1]  860 	ld	(0x08, sp), a
      008CB7 9F               [ 1]  861 	ld	a, xl
      008CB8 19 0B            [ 1]  862 	adc	a, (0x0b, sp)
      008CBA 6B 07            [ 1]  863 	ld	(0x07, sp), a
      008CBC 1E 03            [ 2]  864 	ldw	x, (0x03, sp)
      008CBE E6 09            [ 1]  865 	ld	a, (0x9, x)
      008CC0 0F 0F            [ 1]  866 	clr	(0x0f, sp)
      008CC2 0F 0E            [ 1]  867 	clr	(0x0e, sp)
      008CC4 5F               [ 1]  868 	clrw	x
      008CC5 88               [ 1]  869 	push	a
      008CC6 90 9F            [ 1]  870 	ld	a, yl
      008CC8 1B 0F            [ 1]  871 	add	a, (0x0f, sp)
      008CCA 90 02            [ 1]  872 	rlwa	y
      008CCC 89               [ 2]  873 	pushw	x
      008CCD 19 02            [ 1]  874 	adc	a, (2, sp)
      008CCF 85               [ 2]  875 	popw	x
      008CD0 90 95            [ 1]  876 	ld	yh, a
      008CD2 9E               [ 1]  877 	ld	a, xh
      008CD3 19 09            [ 1]  878 	adc	a, (0x09, sp)
      008CD5 6B 11            [ 1]  879 	ld	(0x11, sp), a
      008CD7 84               [ 1]  880 	pop	a
      008CD8 19 07            [ 1]  881 	adc	a, (0x07, sp)
      008CDA 6B 0F            [ 1]  882 	ld	(0x0f, sp), a
      008CDC 1E 05            [ 2]  883 	ldw	x, (0x05, sp)
      008CDE EF 02            [ 2]  884 	ldw	(0x2, x), y
      008CE0 16 0F            [ 2]  885 	ldw	y, (0x0f, sp)
      008CE2 FF               [ 2]  886 	ldw	(x), y
                                    887 ;	../src/main.c: 397: pcfg->channel = pCfgBuf[10];
      008CE3 1E 01            [ 2]  888 	ldw	x, (0x01, sp)
      008CE5 1C 00 0D         [ 2]  889 	addw	x, #0x000d
      008CE8 16 03            [ 2]  890 	ldw	y, (0x03, sp)
      008CEA 90 E6 0A         [ 1]  891 	ld	a, (0xa, y)
      008CED F7               [ 1]  892 	ld	(x), a
                                    893 ;	../src/main.c: 398: if(pCfgBuf[11] == 0)
      008CEE 1E 03            [ 2]  894 	ldw	x, (0x03, sp)
      008CF0 E6 0B            [ 1]  895 	ld	a, (0xb, x)
                                    896 ;	../src/main.c: 400: pcfg->isFullResultion = false;
      008CF2 1E 01            [ 2]  897 	ldw	x, (0x01, sp)
      008CF4 1C 00 0E         [ 2]  898 	addw	x, #0x000e
                                    899 ;	../src/main.c: 398: if(pCfgBuf[11] == 0)
      008CF7 4D               [ 1]  900 	tnz	a
      008CF8 26 03            [ 1]  901 	jrne	00104$
                                    902 ;	../src/main.c: 400: pcfg->isFullResultion = false;
      008CFA 7F               [ 1]  903 	clr	(x)
      008CFB 20 03            [ 2]  904 	jra	00105$
      008CFD                        905 00104$:
                                    906 ;	../src/main.c: 402: pcfg->isFullResultion = true;
      008CFD A6 01            [ 1]  907 	ld	a, #0x01
      008CFF F7               [ 1]  908 	ld	(x), a
      008D00                        909 00105$:
                                    910 ;	../src/main.c: 405: return 0x0;
      008D00 5F               [ 1]  911 	clrw	x
      008D01                        912 00106$:
                                    913 ;	../src/main.c: 406: }
      008D01 5B 12            [ 2]  914 	addw	sp, #18
      008D03 81               [ 4]  915 	ret
                                    916 ;	../src/main.c: 420: static uint8_t IsValidCfgBuf(uint8_t *pCfgBuf){
                                    917 ;	-----------------------------------------
                                    918 ;	 function IsValidCfgBuf
                                    919 ;	-----------------------------------------
      008D04                        920 _IsValidCfgBuf:
      008D04 88               [ 1]  921 	push	a
                                    922 ;	../src/main.c: 421: uint8_t crc = 0;
      008D05 0F 01            [ 1]  923 	clr	(0x01, sp)
                                    924 ;	../src/main.c: 429: return false;	
      008D07 5F               [ 1]  925 	clrw	x
      008D08                        926 00105$:
                                    927 ;	../src/main.c: 423: for(; i < CFG_BUF_SZ - 1; i++){
      008D08 A3 00 0C         [ 2]  928 	cpw	x, #0x000c
      008D0B 2E 0E            [ 1]  929 	jrsge	00101$
                                    930 ;	../src/main.c: 424: crc += pCfgBuf[i];		
      008D0D 90 93            [ 1]  931 	ldw	y, x
      008D0F 72 F9 04         [ 2]  932 	addw	y, (0x04, sp)
      008D12 90 F6            [ 1]  933 	ld	a, (y)
      008D14 1B 01            [ 1]  934 	add	a, (0x01, sp)
      008D16 6B 01            [ 1]  935 	ld	(0x01, sp), a
                                    936 ;	../src/main.c: 423: for(; i < CFG_BUF_SZ - 1; i++){
      008D18 5C               [ 1]  937 	incw	x
      008D19 20 ED            [ 2]  938 	jra	00105$
      008D1B                        939 00101$:
                                    940 ;	../src/main.c: 426: if(crc == pCfgBuf[CFG_BUF_SZ-1])
      008D1B 1E 04            [ 2]  941 	ldw	x, (0x04, sp)
      008D1D E6 0C            [ 1]  942 	ld	a, (0xc, x)
                                    943 ;	../src/main.c: 427: return true;
      008D1F 10 01            [ 1]  944 	sub	a, (0x01, sp)
      008D21 26 02            [ 1]  945 	jrne	00103$
      008D23 4C               [ 1]  946 	inc	a
                                    947 ;	../src/main.c: 429: return false;	
      008D24 21                     948 	.byte 0x21
      008D25                        949 00103$:
      008D25 4F               [ 1]  950 	clr	a
      008D26                        951 00107$:
                                    952 ;	../src/main.c: 430: }
      008D26 5B 01            [ 2]  953 	addw	sp, #1
      008D28 81               [ 4]  954 	ret
                                    955 ;	../src/main.c: 439: static void clkInit( void )
                                    956 ;	-----------------------------------------
                                    957 ;	 function clkInit
                                    958 ;	-----------------------------------------
      008D29                        959 _clkInit:
                                    960 ;	../src/main.c: 442: CLK->CKDIVR = 0;//(CLK_PRESCALER_HSIDIV1|CLK_PRESCALER_CPUDIV1);
      008D29 35 00 50 C6      [ 1]  961 	mov	0x50c6+0, #0x00
                                    962 ;	../src/main.c: 450: CLK->PCKENR1 |= (CLK_PCKENR1_TIM4|CLK_PCKENR1_SPI|CLK_PCKENR1_UART1);
      008D2D C6 50 C7         [ 1]  963 	ld	a, 0x50c7
      008D30 AA 16            [ 1]  964 	or	a, #0x16
      008D32 C7 50 C7         [ 1]  965 	ld	0x50c7, a
                                    966 ;	../src/main.c: 451: CLK->PCKENR2 |= (CLK_PCKENR2_ADC);
      008D35 72 16 50 CA      [ 1]  967 	bset	20682, #3
                                    968 ;	../src/main.c: 452: }
      008D39 81               [ 4]  969 	ret
                                    970 ;	../src/main.c: 467: void assert_failed(uint8_t* file, uint32_t line)
                                    971 ;	-----------------------------------------
                                    972 ;	 function assert_failed
                                    973 ;	-----------------------------------------
      008D3A                        974 _assert_failed:
                                    975 ;	../src/main.c: 473: while (1)
      008D3A                        976 00102$:
      008D3A 20 FE            [ 2]  977 	jra	00102$
                                    978 ;	../src/main.c: 476: }
      008D3C 81               [ 4]  979 	ret
                                    980 	.area CODE
                                    981 	.area CONST
                                    982 	.area CONST
      00810D                        983 ___str_0:
      00810D 43 46 47               984 	.ascii "CFG"
      008110 00                     985 	.db 0x00
                                    986 	.area CODE
                                    987 	.area INITIALIZER
      008111                        988 __xinit__blkCnt:
      008111 00                     989 	.db #0x00	; 0
      008112                        990 __xinit__fileBlkCnt:
      008112 00 00 00 00            991 	.byte #0x00, #0x00, #0x00, #0x00	; 0
      008116                        992 __xinit__fileNoCnt:
      008116 00 00                  993 	.dw #0x0000
                                    994 	.area CABS (ABS)
