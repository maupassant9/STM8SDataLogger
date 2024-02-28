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
                           000000    27 Fmain$cfg$0_0$0==.
      000001                         28 _cfg:
      000001                         29 	.ds 13
                           00000D    30 G$loggerCfg$0_0$0==.
      00000E                         31 _loggerCfg::
      00000E                         32 	.ds 15
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area INITIALIZED
                           000000    37 Fmain$blkCnt$0_0$0==.
      000263                         38 _blkCnt:
      000263                         39 	.ds 1
                           000001    40 Fmain$fileBlkCnt$0_0$0==.
      000264                         41 _fileBlkCnt:
      000264                         42 	.ds 4
                           000005    43 Fmain$fileNoCnt$0_0$0==.
      000268                         44 _fileNoCnt:
      000268                         45 	.ds 2
                                     46 ;--------------------------------------------------------
                                     47 ; Stack segment in internal ram 
                                     48 ;--------------------------------------------------------
                                     49 	.area	SSEG
      00026A                         50 __start__stack:
      00026A                         51 	.ds	1
                                     52 
                                     53 ;--------------------------------------------------------
                                     54 ; absolute external ram data
                                     55 ;--------------------------------------------------------
                                     56 	.area DABS (ABS)
                                     57 
                                     58 ; default segment ordering for linker
                                     59 	.area HOME
                                     60 	.area GSINIT
                                     61 	.area GSFINAL
                                     62 	.area CONST
                                     63 	.area INITIALIZER
                                     64 	.area CODE
                                     65 
                                     66 ;--------------------------------------------------------
                                     67 ; interrupt vector 
                                     68 ;--------------------------------------------------------
                                     69 	.area HOME
      008000                         70 __interrupt_vect:
      008000 82 00 80 6F             71 	int s_GSINIT ; reset
      008004 82 00 9F DC             72 	int _TRAP_IRQHandler ; trap
      008008 82 00 9F DD             73 	int _TLI_IRQHandler ; int0
      00800C 82 00 9F DE             74 	int _AWU_IRQHandler ; int1
      008010 82 00 9F DF             75 	int _CLK_IRQHandler ; int2
      008014 82 00 9F E0             76 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 9F E1             77 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 9F E2             78 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 9F E3             79 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 9F E4             80 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             81 	int 0x000000 ; int8
      00802C 82 00 00 00             82 	int 0x000000 ; int9
      008030 82 00 9F E5             83 	int _SPI_IRQHandler ; int10
      008034 82 00 9F E6             84 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 9F E7             85 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 9F E8             86 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 9F E9             87 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 00 00             88 	int 0x000000 ; int15
      008048 82 00 00 00             89 	int 0x000000 ; int16
      00804C 82 00 9F EA             90 	int _UART1_TX_IRQHandler ; int17
      008050 82 00 9F EB             91 	int _UART1_RX_IRQHandler ; int18
      008054 82 00 9F EC             92 	int _I2C_IRQHandler ; int19
      008058 82 00 00 00             93 	int 0x000000 ; int20
      00805C 82 00 00 00             94 	int 0x000000 ; int21
      008060 82 00 9F ED             95 	int _ADC1_IRQHandler ; int22
      008064 82 00 9F F2             96 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 9F F7             97 	int _EEPROM_EEC_IRQHandler ; int24
                                     98 ;--------------------------------------------------------
                                     99 ; global & static initialisations
                                    100 ;--------------------------------------------------------
                                    101 	.area HOME
                                    102 	.area GSINIT
                                    103 	.area GSFINAL
                                    104 	.area GSINIT
      00806F                        105 __sdcc_init_data:
                                    106 ; stm8_genXINIT() start
      00806F AE 02 62         [ 2]  107 	ldw x, #l_DATA
      008072 27 07            [ 1]  108 	jreq	00002$
      008074                        109 00001$:
      008074 72 4F 00 00      [ 1]  110 	clr (s_DATA - 1, x)
      008078 5A               [ 2]  111 	decw x
      008079 26 F9            [ 1]  112 	jrne	00001$
      00807B                        113 00002$:
      00807B AE 00 07         [ 2]  114 	ldw	x, #l_INITIALIZER
      00807E 27 09            [ 1]  115 	jreq	00004$
      008080                        116 00003$:
      008080 D6 81 05         [ 1]  117 	ld	a, (s_INITIALIZER - 1, x)
      008083 D7 02 62         [ 1]  118 	ld	(s_INITIALIZED - 1, x), a
      008086 5A               [ 2]  119 	decw	x
      008087 26 F7            [ 1]  120 	jrne	00003$
      008089                        121 00004$:
                                    122 ; stm8_genXINIT() end
                                    123 	.area GSFINAL
      00809F CC 80 6C         [ 2]  124 	jp	__sdcc_program_startup
                                    125 ;--------------------------------------------------------
                                    126 ; Home
                                    127 ;--------------------------------------------------------
                                    128 	.area HOME
                                    129 	.area HOME
      00806C                        130 __sdcc_program_startup:
      00806C CC 81 0D         [ 2]  131 	jp	_main
                                    132 ;	return from main will return to caller
                                    133 ;--------------------------------------------------------
                                    134 ; code
                                    135 ;--------------------------------------------------------
                                    136 	.area CODE
                           000000   137 	G$main$0$0 ==.
                           000000   138 	C$main.c$100$0_0$355 ==.
                                    139 ;	../src/main.c: 100: void main( void )
                                    140 ; genLabel
                                    141 ;	-----------------------------------------
                                    142 ;	 function main
                                    143 ;	-----------------------------------------
                                    144 ;	Register assignment might be sub-optimal.
                                    145 ;	Stack space usage: 50 bytes.
      00810D                        146 _main:
      00810D 52 32            [ 2]  147 	sub	sp, #50
                           000002   148 	C$main.c$110$1_0$355 ==.
                                    149 ;	../src/main.c: 110: clkInit();
                                    150 ; genCall
      00810F CD 86 0D         [ 4]  151 	call	_clkInit
                           000005   152 	C$main.c$111$1_0$355 ==.
                                    153 ;	../src/main.c: 111: LedMatrixInit();
                                    154 ; genCall
      008112 CD 88 FB         [ 4]  155 	call	_LedMatrixInit
                           000008   156 	C$main.c$112$1_0$355 ==.
                                    157 ;	../src/main.c: 112: sysTickInit();
                                    158 ; genCall
      008115 CD 88 9A         [ 4]  159 	call	_sysTickInit
                           00000B   160 	C$main.c$115$1_0$355 ==.
                                    161 ;	../src/main.c: 115: enableInterrupts();
                                    162 ;	genInline
      008118 9A               [ 1]  163 	rim
                           00000C   164 	C$main.c$117$1_0$355 ==.
                                    165 ;	../src/main.c: 117: SetLedMode(0, LED_ON);
                                    166 ; genIPush
      008119 4B 03            [ 1]  167 	push	#0x03
                                    168 ; genIPush
      00811B 4B 00            [ 1]  169 	push	#0x00
                                    170 ; genCall
      00811D CD 88 FF         [ 4]  171 	call	_SetLedMode
      008120 85               [ 2]  172 	popw	x
                           000014   173 	C$main.c$118$1_0$355 ==.
                                    174 ;	../src/main.c: 118: dly(10000);
                                    175 ; genIPush
      008121 4B 10            [ 1]  176 	push	#0x10
      008123 4B 27            [ 1]  177 	push	#0x27
      008125 5F               [ 1]  178 	clrw	x
      008126 89               [ 2]  179 	pushw	x
                                    180 ; genCall
      008127 CD 88 BE         [ 4]  181 	call	_dly
      00812A 5B 04            [ 2]  182 	addw	sp, #4
                           00001F   183 	C$main.c$124$1_0$355 ==.
                                    184 ;	../src/main.c: 124: res |= pf_mount(&fid);	
                                    185 ; skipping iCode since result will be rematerialized
                                    186 ; skipping iCode since result will be rematerialized
                                    187 ; genIPush
      00812C 96               [ 1]  188 	ldw	x, sp
      00812D 1C 00 03         [ 2]  189 	addw	x, #3
      008130 89               [ 2]  190 	pushw	x
                                    191 ; genCall
      008131 CD 97 E7         [ 4]  192 	call	_pf_mount
      008134 85               [ 2]  193 	popw	x
                                    194 ; genAssign
      008135 6B 32            [ 1]  195 	ld	(0x32, sp), a
                           00002A   196 	C$main.c$125$1_0$355 ==.
                                    197 ;	../src/main.c: 125: res |= pf_open("CFG");
                                    198 ; skipping iCode since result will be rematerialized
                                    199 ; skipping iCode since result will be rematerialized
                                    200 ; genIPush
      008137 4B A2            [ 1]  201 	push	#<(___str_0+0)
      008139 4B 80            [ 1]  202 	push	#((___str_0+0) >> 8)
                                    203 ; genCall
      00813B CD 9A 5D         [ 4]  204 	call	_pf_open
      00813E 85               [ 2]  205 	popw	x
                                    206 ; genOr
      00813F 1A 32            [ 1]  207 	or	a, (0x32, sp)
      008141 6B 32            [ 1]  208 	ld	(0x32, sp), a
                           000036   209 	C$main.c$126$1_0$355 ==.
                                    210 ;	../src/main.c: 126: res |= pf_read(cfg, 13 , &pbr);
                                    211 ; skipping iCode since result will be rematerialized
                                    212 ; skipping iCode since result will be rematerialized
                                    213 ; skipping iCode since result will be rematerialized
                                    214 ; skipping iCode since result will be rematerialized
                                    215 ; genIPush
      008143 96               [ 1]  216 	ldw	x, sp
      008144 5C               [ 1]  217 	incw	x
      008145 89               [ 2]  218 	pushw	x
                                    219 ; genIPush
      008146 4B 0D            [ 1]  220 	push	#0x0d
      008148 4B 00            [ 1]  221 	push	#0x00
                                    222 ; genIPush
      00814A 4B 01            [ 1]  223 	push	#<(_cfg+0)
      00814C 4B 00            [ 1]  224 	push	#((_cfg+0) >> 8)
                                    225 ; genCall
      00814E CD 9B 01         [ 4]  226 	call	_pf_read
      008151 5B 06            [ 2]  227 	addw	sp, #6
                                    228 ; genOr
      008153 1A 32            [ 1]  229 	or	a, (0x32, sp)
      008155 6B 32            [ 1]  230 	ld	(0x32, sp), a
                           00004A   231 	C$main.c$128$1_0$355 ==.
                                    232 ;	../src/main.c: 128: res |= GetCfg(cfg, &loggerCfg);
                                    233 ; skipping iCode since result will be rematerialized
                                    234 ; skipping iCode since result will be rematerialized
                                    235 ; skipping iCode since result will be rematerialized
                                    236 ; skipping iCode since result will be rematerialized
                                    237 ; genIPush
      008157 4B 0E            [ 1]  238 	push	#<(_loggerCfg+0)
      008159 4B 00            [ 1]  239 	push	#((_loggerCfg+0) >> 8)
                                    240 ; genIPush
      00815B 4B 01            [ 1]  241 	push	#<(_cfg+0)
      00815D 4B 00            [ 1]  242 	push	#((_cfg+0) >> 8)
                                    243 ; genCall
      00815F CD 84 C8         [ 4]  244 	call	_GetCfg
      008162 5B 04            [ 2]  245 	addw	sp, #4
      008164 9F               [ 1]  246 	ld	a, xl
                                    247 ; genCast
                                    248 ; genAssign
                                    249 ; genOr
      008165 1A 32            [ 1]  250 	or	a, (0x32, sp)
                                    251 ; genAssign
      008167 6B 32            [ 1]  252 	ld	(0x32, sp), a
                           00005C   253 	C$main.c$130$1_0$355 ==.
                                    254 ;	../src/main.c: 130: if(FR_OK == res){
                                    255 ; genIfx
      008169 0D 32            [ 1]  256 	tnz	(0x32, sp)
      00816B 27 03            [ 1]  257 	jreq	00196$
      00816D CC 81 BE         [ 2]  258 	jp	00105$
      008170                        259 00196$:
                           000063   260 	C$main.c$132$2_0$356 ==.
                                    261 ;	../src/main.c: 132: fileBlkCnt = loggerCfg.fileSzInBlock;
                                    262 ; skipping iCode since result will be rematerialized
                                    263 ; genAssign
      008170 AE 00 0E         [ 2]  264 	ldw	x, #(_loggerCfg+0)
                                    265 ; genPointerGet
      008173 90 93            [ 1]  266 	ldw	y, x
      008175 90 EE 09         [ 2]  267 	ldw	y, (0x9, y)
      008178 EE 07            [ 2]  268 	ldw	x, (0x7, x)
                                    269 ; genAssign
      00817A 90 CF 02 66      [ 2]  270 	ldw	_fileBlkCnt+2, y
      00817E CF 02 64         [ 2]  271 	ldw	_fileBlkCnt+0, x
                           000074   272 	C$main.c$133$2_0$356 ==.
                                    273 ;	../src/main.c: 133: fileNoCnt = loggerCfg.fileNo;
                                    274 ; skipping iCode since result will be rematerialized
                                    275 ; genPointerGet
      008181 CE 00 19         [ 2]  276 	ldw	x, _loggerCfg+11
                                    277 ; genAssign
      008184 CF 02 68         [ 2]  278 	ldw	_fileNoCnt+0, x
                           00007A   279 	C$main.c$134$2_0$356 ==.
                                    280 ;	../src/main.c: 134: SetLedMode(1, LED_ON);
                                    281 ; genIPush
      008187 4B 03            [ 1]  282 	push	#0x03
                                    283 ; genIPush
      008189 4B 01            [ 1]  284 	push	#0x01
                                    285 ; genCall
      00818B CD 88 FF         [ 4]  286 	call	_SetLedMode
      00818E 85               [ 2]  287 	popw	x
                           000082   288 	C$main.c$136$2_0$356 ==.
                                    289 ;	../src/main.c: 136: res |= pf_open(loggerCfg.firstFileName);
                                    290 ; genPlus
      00818F AE 00 10         [ 2]  291 	ldw	x, #(_loggerCfg+0)+2
                                    292 ; genCast
                                    293 ; genAssign
                                    294 ; genIPush
      008192 89               [ 2]  295 	pushw	x
                                    296 ; genCall
      008193 CD 9A 5D         [ 4]  297 	call	_pf_open
      008196 85               [ 2]  298 	popw	x
                                    299 ; genOr
      008197 1A 32            [ 1]  300 	or	a, (0x32, sp)
                           00008C   301 	C$main.c$138$2_0$356 ==.
                                    302 ;	../src/main.c: 138: if(FR_OK == res){
                                    303 ; genIfx
      008199 4D               [ 1]  304 	tnz	a
      00819A 27 03            [ 1]  305 	jreq	00197$
      00819C CC 81 A6         [ 2]  306 	jp	00102$
      00819F                        307 00197$:
                           000092   308 	C$main.c$141$3_0$357 ==.
                                    309 ;	../src/main.c: 141: fsm.state = S0_RST;
                                    310 ; skipping iCode since result will be rematerialized
                                    311 ; genPointerSet
      00819F 0F 2D            [ 1]  312 	clr	(0x2d, sp)
                           000094   313 	C$main.c$142$3_0$357 ==.
                                    314 ;	../src/main.c: 142: fsm.error = NO_ERR;
                                    315 ; skipping iCode since result will be rematerialized
                                    316 ; genPointerSet
      0081A1 0F 2E            [ 1]  317 	clr	(0x2e, sp)
                                    318 ; genGoto
      0081A3 CC 81 B6         [ 2]  319 	jp	00103$
                                    320 ; genLabel
      0081A6                        321 00102$:
                           000099   322 	C$main.c$145$3_0$358 ==.
                                    323 ;	../src/main.c: 145: fsm.state = S4_ERR;
                                    324 ; skipping iCode since result will be rematerialized
                                    325 ; genPointerSet
      0081A6 A6 04            [ 1]  326 	ld	a, #0x04
      0081A8 6B 2D            [ 1]  327 	ld	(0x2d, sp), a
                           00009D   328 	C$main.c$146$3_0$358 ==.
                                    329 ;	../src/main.c: 146: fsm.error = ERR_CARD_INIT;
                                    330 ; skipping iCode since result will be rematerialized
                                    331 ; genPointerSet
      0081AA A6 01            [ 1]  332 	ld	a, #0x01
      0081AC 6B 2E            [ 1]  333 	ld	(0x2e, sp), a
                           0000A1   334 	C$main.c$147$3_0$358 ==.
                                    335 ;	../src/main.c: 147: SetLedMode(1, LED_TOGGLE_FAST);
                                    336 ; genIPush
      0081AE 4B 02            [ 1]  337 	push	#0x02
                                    338 ; genIPush
      0081B0 4B 01            [ 1]  339 	push	#0x01
                                    340 ; genCall
      0081B2 CD 88 FF         [ 4]  341 	call	_SetLedMode
      0081B5 85               [ 2]  342 	popw	x
                                    343 ; genLabel
      0081B6                        344 00103$:
                           0000A9   345 	C$main.c$150$2_0$356 ==.
                                    346 ;	../src/main.c: 150: disableInterrupts();
                                    347 ;	genInline
      0081B6 9B               [ 1]  348 	sim
                           0000AA   349 	C$main.c$151$2_0$356 ==.
                                    350 ;	../src/main.c: 151: adcInit();
                                    351 ; genCall
      0081B7 CD 8C 80         [ 4]  352 	call	_adcInit
                           0000AD   353 	C$main.c$153$2_0$356 ==.
                                    354 ;	../src/main.c: 153: enableInterrupts();
                                    355 ;	genInline
      0081BA 9A               [ 1]  356 	rim
                                    357 ; genGoto
      0081BB CC 81 C6         [ 2]  358 	jp	00106$
                                    359 ; genLabel
      0081BE                        360 00105$:
                           0000B1   361 	C$main.c$156$2_0$359 ==.
                                    362 ;	../src/main.c: 156: fsm.state = S4_ERR;
                                    363 ; skipping iCode since result will be rematerialized
                                    364 ; genPointerSet
      0081BE A6 04            [ 1]  365 	ld	a, #0x04
      0081C0 6B 2D            [ 1]  366 	ld	(0x2d, sp), a
                           0000B5   367 	C$main.c$157$2_0$359 ==.
                                    368 ;	../src/main.c: 157: fsm.error = ERR_CARD_INIT;
                                    369 ; skipping iCode since result will be rematerialized
                                    370 ; genPointerSet
      0081C2 A6 01            [ 1]  371 	ld	a, #0x01
      0081C4 6B 2E            [ 1]  372 	ld	(0x2e, sp), a
                                    373 ; genLabel
      0081C6                        374 00106$:
                           0000B9   375 	C$main.c$159$1_0$355 ==.
                                    376 ;	../src/main.c: 159: SetLedMode(0, LED_TOGGLE_SLOW);
                                    377 ; genIPush
      0081C6 4B 01            [ 1]  378 	push	#0x01
                                    379 ; genIPush
      0081C8 4B 00            [ 1]  380 	push	#0x00
                                    381 ; genCall
      0081CA CD 88 FF         [ 4]  382 	call	_SetLedMode
      0081CD 85               [ 2]  383 	popw	x
                           0000C1   384 	C$main.c$161$2_0$360 ==.
                                    385 ;	../src/main.c: 161: while(1){
                                    386 ; skipping iCode since result will be rematerialized
                                    387 ; skipping iCode since result will be rematerialized
                                    388 ; skipping iCode since result will be rematerialized
                                    389 ; skipping iCode since result will be rematerialized
                                    390 ; skipping iCode since result will be rematerialized
                                    391 ; genPlus
      0081CE AE 00 10         [ 2]  392 	ldw	x, #(_loggerCfg+0)+2
      0081D1 1F 2F            [ 2]  393 	ldw	(0x2f, sp), x
                                    394 ; genAssign
      0081D3 16 2F            [ 2]  395 	ldw	y, (0x2f, sp)
      0081D5 17 31            [ 2]  396 	ldw	(0x31, sp), y
                                    397 ; genLabel
      0081D7                        398 00137$:
                           0000CA   399 	C$main.c$166$2_0$360 ==.
                                    400 ;	../src/main.c: 166: switch (fsm.state){
                                    401 ; genPointerGet
      0081D7 7B 2D            [ 1]  402 	ld	a, (0x2d, sp)
                                    403 ; genCmp
                                    404 ; genCmpTop
      0081D9 A1 06            [ 1]  405 	cp	a, #0x06
      0081DB 23 03            [ 2]  406 	jrule	00198$
      0081DD CC 81 D7         [ 2]  407 	jp	00137$
      0081E0                        408 00198$:
                                    409 ; skipping generated iCode
                                    410 ; genJumpTab
      0081E0 5F               [ 1]  411 	clrw	x
      0081E1 97               [ 1]  412 	ld	xl, a
      0081E2 58               [ 2]  413 	sllw	x
      0081E3 DE 81 E7         [ 2]  414 	ldw	x, (#00199$, x)
      0081E6 FC               [ 2]  415 	jp	(x)
      0081E7                        416 00199$:
      0081E7 81 F5                  417 	.dw	#00107$
      0081E9 82 39                  418 	.dw	#00117$
      0081EB 82 39                  419 	.dw	#00117$
      0081ED 82 45                  420 	.dw	#00118$
      0081EF 82 8C                  421 	.dw	#00125$
      0081F1 82 97                  422 	.dw	#00129$
      0081F3 81 D7                  423 	.dw	#00137$
                           0000E8   424 	C$main.c$167$3_0$361 ==.
                                    425 ;	../src/main.c: 167: case S0_RST:
                                    426 ; genLabel
      0081F5                        427 00107$:
                           0000E8   428 	C$main.c$170$3_0$361 ==.
                                    429 ;	../src/main.c: 170: if( 0x3 == buffer_rdy ){
                                    430 ; genCmpEQorNE
      0081F5 C6 00 59         [ 1]  431 	ld	a, _buffer_rdy+0
      0081F8 A1 03            [ 1]  432 	cp	a, #0x03
      0081FA 26 03            [ 1]  433 	jrne	00201$
      0081FC CC 82 02         [ 2]  434 	jp	00202$
      0081FF                        435 00201$:
      0081FF CC 82 12         [ 2]  436 	jp	00114$
      008202                        437 00202$:
                                    438 ; skipping generated iCode
                           0000F5   439 	C$main.c$173$4_0$362 ==.
                                    440 ;	../src/main.c: 173: fsm.state = S4_ERR;
                                    441 ; genPointerSet
      008202 A6 04            [ 1]  442 	ld	a, #0x04
      008204 6B 2D            [ 1]  443 	ld	(0x2d, sp), a
                           0000F9   444 	C$main.c$174$4_0$362 ==.
                                    445 ;	../src/main.c: 174: fsm.error = ERR_BUFF_OVERLAP;
                                    446 ; genPlus
      008206 96               [ 1]  447 	ldw	x, sp
      008207 1C 00 2E         [ 2]  448 	addw	x, #46
      00820A 9F               [ 1]  449 	ld	a, xl
                                    450 ; genPointerSet
      00820B 97               [ 1]  451 	ld	xl, a
      00820C A6 05            [ 1]  452 	ld	a, #0x05
      00820E F7               [ 1]  453 	ld	(x), a
                                    454 ; genGoto
      00820F CC 81 D7         [ 2]  455 	jp	00137$
                                    456 ; genLabel
      008212                        457 00114$:
                           000105   458 	C$main.c$175$3_0$361 ==.
                                    459 ;	../src/main.c: 175: } else if (0x01 == buffer_rdy) {
                                    460 ; genCmpEQorNE
      008212 C6 00 59         [ 1]  461 	ld	a, _buffer_rdy+0
      008215 4A               [ 1]  462 	dec	a
      008216 26 03            [ 1]  463 	jrne	00204$
      008218 CC 82 1E         [ 2]  464 	jp	00205$
      00821B                        465 00204$:
      00821B CC 82 25         [ 2]  466 	jp	00111$
      00821E                        467 00205$:
                                    468 ; skipping generated iCode
                           000111   469 	C$main.c$177$4_0$363 ==.
                                    470 ;	../src/main.c: 177: fsm.state = S1_WR_BUF0;
                                    471 ; genPointerSet
      00821E A6 01            [ 1]  472 	ld	a, #0x01
      008220 6B 2D            [ 1]  473 	ld	(0x2d, sp), a
                                    474 ; genGoto
      008222 CC 81 D7         [ 2]  475 	jp	00137$
                                    476 ; genLabel
      008225                        477 00111$:
                           000118   478 	C$main.c$178$3_0$361 ==.
                                    479 ;	../src/main.c: 178: } else if ( 0x02 == buffer_rdy) {
                                    480 ; genCmpEQorNE
      008225 C6 00 59         [ 1]  481 	ld	a, _buffer_rdy+0
      008228 A1 02            [ 1]  482 	cp	a, #0x02
      00822A 26 03            [ 1]  483 	jrne	00207$
      00822C CC 82 32         [ 2]  484 	jp	00208$
      00822F                        485 00207$:
      00822F CC 81 D7         [ 2]  486 	jp	00137$
      008232                        487 00208$:
                                    488 ; skipping generated iCode
                           000125   489 	C$main.c$180$4_0$364 ==.
                                    490 ;	../src/main.c: 180: fsm.state = S2_WR_BUF1;
                                    491 ; genPointerSet
      008232 A6 02            [ 1]  492 	ld	a, #0x02
      008234 6B 2D            [ 1]  493 	ld	(0x2d, sp), a
                           000129   494 	C$main.c$182$3_0$361 ==.
                                    495 ;	../src/main.c: 182: break;
                                    496 ; genGoto
      008236 CC 81 D7         [ 2]  497 	jp	00137$
                           00012C   498 	C$main.c$184$3_0$361 ==.
                                    499 ;	../src/main.c: 184: case S2_WR_BUF1:
                                    500 ; genLabel
      008239                        501 00117$:
                           00012C   502 	C$main.c$186$3_0$361 ==.
                                    503 ;	../src/main.c: 186: Wr2SD(&fsm);
                                    504 ; skipping iCode since result will be rematerialized
                                    505 ; genIPush
      008239 96               [ 1]  506 	ldw	x, sp
      00823A 1C 00 2D         [ 2]  507 	addw	x, #45
      00823D 89               [ 2]  508 	pushw	x
                                    509 ; genCall
      00823E CD 82 A5         [ 4]  510 	call	_Wr2SD
      008241 85               [ 2]  511 	popw	x
                           000135   512 	C$main.c$187$3_0$361 ==.
                                    513 ;	../src/main.c: 187: break;
                                    514 ; genGoto
      008242 CC 81 D7         [ 2]  515 	jp	00137$
                           000138   516 	C$main.c$188$3_0$361 ==.
                                    517 ;	../src/main.c: 188: case S3_NXT_FILE:
                                    518 ; genLabel
      008245                        519 00118$:
                           000138   520 	C$main.c$189$3_0$361 ==.
                                    521 ;	../src/main.c: 189: fileBlkCnt = loggerCfg.fileSzInBlock;
                                    522 ; genPointerGet
      008245 AE 00 0E         [ 2]  523 	ldw	x, #(_loggerCfg+0)
      008248 90 93            [ 1]  524 	ldw	y, x
      00824A 90 EE 09         [ 2]  525 	ldw	y, (0x9, y)
      00824D EE 07            [ 2]  526 	ldw	x, (0x7, x)
                                    527 ; genAssign
      00824F 90 CF 02 66      [ 2]  528 	ldw	_fileBlkCnt+2, y
      008253 CF 02 64         [ 2]  529 	ldw	_fileBlkCnt+0, x
                           000149   530 	C$main.c$191$3_0$361 ==.
                                    531 ;	../src/main.c: 191: if(--fileNoCnt != 0){
                                    532 ; genMinus
      008256 CE 02 68         [ 2]  533 	ldw	x, _fileNoCnt+0
      008259 5A               [ 2]  534 	decw	x
                                    535 ; genAssign
      00825A CF 02 68         [ 2]  536 	ldw	_fileNoCnt+0, x
                                    537 ; genIfx
      00825D CE 02 68         [ 2]  538 	ldw	x, _fileNoCnt+0
      008260 26 03            [ 1]  539 	jrne	00209$
      008262 CC 82 85         [ 2]  540 	jp	00123$
      008265                        541 00209$:
                           000158   542 	C$main.c$193$4_0$365 ==.
                                    543 ;	../src/main.c: 193: GetNxtFileName(loggerCfg.firstFileName);
                                    544 ; genCast
                                    545 ; genAssign
      008265 1E 2F            [ 2]  546 	ldw	x, (0x2f, sp)
                                    547 ; genIPush
      008267 89               [ 2]  548 	pushw	x
                                    549 ; genCall
      008268 CD 83 64         [ 4]  550 	call	_GetNxtFileName
      00826B 85               [ 2]  551 	popw	x
                           00015F   552 	C$main.c$195$4_0$365 ==.
                                    553 ;	../src/main.c: 195: res = pf_open(loggerCfg.firstFileName);
                                    554 ; genCast
                                    555 ; genAssign
      00826C 1E 31            [ 2]  556 	ldw	x, (0x31, sp)
                                    557 ; genIPush
      00826E 89               [ 2]  558 	pushw	x
                                    559 ; genCall
      00826F CD 9A 5D         [ 4]  560 	call	_pf_open
      008272 85               [ 2]  561 	popw	x
                                    562 ; genAssign
                           000166   563 	C$main.c$196$4_0$365 ==.
                                    564 ;	../src/main.c: 196: if( FR_OK != res ){
                                    565 ; genIfx
      008273 4D               [ 1]  566 	tnz	a
      008274 26 03            [ 1]  567 	jrne	00210$
      008276 CC 82 80         [ 2]  568 	jp	00120$
      008279                        569 00210$:
                           00016C   570 	C$main.c$197$5_0$366 ==.
                                    571 ;	../src/main.c: 197: fsm.state = S4_ERR;
                                    572 ; genPointerSet
      008279 A6 04            [ 1]  573 	ld	a, #0x04
      00827B 6B 2D            [ 1]  574 	ld	(0x2d, sp), a
                                    575 ; genGoto
      00827D CC 81 D7         [ 2]  576 	jp	00137$
                                    577 ; genLabel
      008280                        578 00120$:
                           000173   579 	C$main.c$200$5_0$367 ==.
                                    580 ;	../src/main.c: 200: fsm.state = S0_RST;
                                    581 ; genPointerSet
      008280 0F 2D            [ 1]  582 	clr	(0x2d, sp)
                                    583 ; genGoto
      008282 CC 81 D7         [ 2]  584 	jp	00137$
                                    585 ; genLabel
      008285                        586 00123$:
                           000178   587 	C$main.c$206$4_0$368 ==.
                                    588 ;	../src/main.c: 206: fsm.state = S5_COMPLETE;
                                    589 ; genPointerSet
      008285 A6 05            [ 1]  590 	ld	a, #0x05
      008287 6B 2D            [ 1]  591 	ld	(0x2d, sp), a
                           00017C   592 	C$main.c$209$3_0$361 ==.
                                    593 ;	../src/main.c: 209: break;
                                    594 ; genGoto
      008289 CC 81 D7         [ 2]  595 	jp	00137$
                           00017F   596 	C$main.c$211$3_0$361 ==.
                                    597 ;	../src/main.c: 211: case S4_ERR:
                                    598 ; genLabel
      00828C                        599 00125$:
                           00017F   600 	C$main.c$212$3_0$361 ==.
                                    601 ;	../src/main.c: 212: SetLedMode(1, LED_TOGGLE_FAST);
                                    602 ; genIPush
      00828C 4B 02            [ 1]  603 	push	#0x02
                                    604 ; genIPush
      00828E 4B 01            [ 1]  605 	push	#0x01
                                    606 ; genCall
      008290 CD 88 FF         [ 4]  607 	call	_SetLedMode
      008293 85               [ 2]  608 	popw	x
                           000187   609 	C$main.c$213$3_0$361 ==.
                                    610 ;	../src/main.c: 213: while(1); break;
                                    611 ; genLabel
      008294                        612 00127$:
                                    613 ; genGoto
      008294 CC 82 94         [ 2]  614 	jp	00127$
                           00018A   615 	C$main.c$214$3_0$361 ==.
                                    616 ;	../src/main.c: 214: case S5_COMPLETE:
                                    617 ; genLabel
      008297                        618 00129$:
                           00018A   619 	C$main.c$215$3_0$361 ==.
                                    620 ;	../src/main.c: 215: SetLedMode(0, LED_ON);
                                    621 ; genIPush
      008297 4B 03            [ 1]  622 	push	#0x03
                                    623 ; genIPush
      008299 4B 00            [ 1]  624 	push	#0x00
                                    625 ; genCall
      00829B CD 88 FF         [ 4]  626 	call	_SetLedMode
      00829E 85               [ 2]  627 	popw	x
                           000192   628 	C$main.c$216$3_0$361 ==.
                                    629 ;	../src/main.c: 216: while(1);
                                    630 ; genLabel
      00829F                        631 00131$:
                                    632 ; genGoto
      00829F CC 82 9F         [ 2]  633 	jp	00131$
                           000195   634 	C$main.c$221$1_0$355 ==.
                                    635 ;	../src/main.c: 221: }
                                    636 ; genLabel
      0082A2                        637 00139$:
                           000195   638 	C$main.c$223$1_0$355 ==.
                                    639 ;	../src/main.c: 223: }
                                    640 ; genEndFunction
      0082A2 5B 32            [ 2]  641 	addw	sp, #50
                           000197   642 	C$main.c$223$1_0$355 ==.
                           000197   643 	XG$main$0$0 ==.
      0082A4 81               [ 4]  644 	ret
                           000198   645 	Fmain$Wr2SD$0$0 ==.
                           000198   646 	C$main.c$236$1_0$370 ==.
                                    647 ;	../src/main.c: 236: static void Wr2SD( fsm_t * pfsm ){
                                    648 ; genLabel
                                    649 ;	-----------------------------------------
                                    650 ;	 function Wr2SD
                                    651 ;	-----------------------------------------
                                    652 ;	Register assignment might be sub-optimal.
                                    653 ;	Stack space usage: 6 bytes.
      0082A5                        654 _Wr2SD:
      0082A5 52 06            [ 2]  655 	sub	sp, #6
                           00019A   656 	C$main.c$243$1_0$370 ==.
                                    657 ;	../src/main.c: 243: if( S1_WR_BUF0 == pfsm->state){
                                    658 ; genAssign
      0082A7 1E 09            [ 2]  659 	ldw	x, (0x09, sp)
                                    660 ; genPointerGet
      0082A9 F6               [ 1]  661 	ld	a, (x)
                                    662 ; genCmpEQorNE
      0082AA 4A               [ 1]  663 	dec	a
      0082AB 26 03            [ 1]  664 	jrne	00140$
      0082AD CC 82 B3         [ 2]  665 	jp	00141$
      0082B0                        666 00140$:
      0082B0 CC 82 BB         [ 2]  667 	jp	00102$
      0082B3                        668 00141$:
                                    669 ; skipping generated iCode
                           0001A6   670 	C$main.c$244$2_0$371 ==.
                                    671 ;	../src/main.c: 244: pBuf = adcBuffer0; bufNo = 0;
                                    672 ; genAddrOf
      0082B3 90 AE 00 5A      [ 2]  673 	ldw	y, #_adcBuffer0+0
                                    674 ; genCast
                                    675 ; genAssign
                                    676 ; genAssign
                                    677 ; genAssign
      0082B7 5F               [ 1]  678 	clrw	x
                                    679 ; genGoto
      0082B8 CC 82 C2         [ 2]  680 	jp	00103$
                                    681 ; genLabel
      0082BB                        682 00102$:
                           0001AE   683 	C$main.c$246$2_0$372 ==.
                                    684 ;	../src/main.c: 246: pBuf = adcBuffer1; bufNo = 1;
                                    685 ; skipping iCode since result will be rematerialized
                                    686 ; skipping iCode since result will be rematerialized
                                    687 ; genAssign
      0082BB 90 AE 01 5A      [ 2]  688 	ldw	y, #(_adcBuffer1+0)
                                    689 ; genAssign
      0082BF A6 01            [ 1]  690 	ld	a, #0x01
      0082C1 97               [ 1]  691 	ld	xl, a
                                    692 ; genLabel
      0082C2                        693 00103$:
                           0001B5   694 	C$main.c$248$1_0$370 ==.
                                    695 ;	../src/main.c: 248: RELEASE_BUFF_FOR_WR(bufNo); //clear this flag
                                    696 ; genCast
                                    697 ; genAssign
                                    698 ; genLeftShift
      0082C2 A6 01            [ 1]  699 	ld	a, #0x01
      0082C4 88               [ 1]  700 	push	a
      0082C5 9F               [ 1]  701 	ld	a, xl
      0082C6 4D               [ 1]  702 	tnz	a
      0082C7 27 05            [ 1]  703 	jreq	00143$
      0082C9                        704 00142$:
      0082C9 08 01            [ 1]  705 	sll	(1, sp)
      0082CB 4A               [ 1]  706 	dec	a
      0082CC 26 FB            [ 1]  707 	jrne	00142$
      0082CE                        708 00143$:
      0082CE 84               [ 1]  709 	pop	a
                                    710 ; genCpl
      0082CF 43               [ 1]  711 	cpl	a
                                    712 ; genAnd
      0082D0 C4 00 59         [ 1]  713 	and	a, _buffer_rdy+0
      0082D3 C7 00 59         [ 1]  714 	ld	_buffer_rdy+0, a
                           0001C9   715 	C$main.c$252$1_0$370 ==.
                                    716 ;	../src/main.c: 252: res = pf_write((void*)pBuf,BUFFER_SZ_IN_BYTES, &pbr);
                                    717 ; genAddrOf
      0082D6 96               [ 1]  718 	ldw	x, sp
      0082D7 5C               [ 1]  719 	incw	x
                                    720 ; genCast
                                    721 ; genAssign
                                    722 ; genCast
                                    723 ; genAssign
                                    724 ; genIPush
      0082D8 89               [ 2]  725 	pushw	x
                                    726 ; genIPush
      0082D9 4B 00            [ 1]  727 	push	#0x00
      0082DB 4B 01            [ 1]  728 	push	#0x01
                                    729 ; genIPush
      0082DD 90 89            [ 2]  730 	pushw	y
                                    731 ; genCall
      0082DF CD 9D 1A         [ 4]  732 	call	_pf_write
      0082E2 5B 06            [ 2]  733 	addw	sp, #6
                           0001D7   734 	C$main.c$243$1_0$370 ==.
                                    735 ;	../src/main.c: 243: if( S1_WR_BUF0 == pfsm->state){
                                    736 ; genAssign
      0082E4 16 09            [ 2]  737 	ldw	y, (0x09, sp)
      0082E6 17 03            [ 2]  738 	ldw	(0x03, sp), y
                           0001DB   739 	C$main.c$259$1_0$370 ==.
                                    740 ;	../src/main.c: 259: pfsm->error = ERR_WR_DATA;
                                    741 ; genPlus
      0082E8 1E 03            [ 2]  742 	ldw	x, (0x03, sp)
      0082EA 5C               [ 1]  743 	incw	x
      0082EB 1F 05            [ 2]  744 	ldw	(0x05, sp), x
                           0001E0   745 	C$main.c$256$1_0$370 ==.
                                    746 ;	../src/main.c: 256: if(FR_OK != res){
                                    747 ; genIfx
      0082ED 4D               [ 1]  748 	tnz	a
      0082EE 26 03            [ 1]  749 	jrne	00144$
      0082F0 CC 83 00         [ 2]  750 	jp	00105$
      0082F3                        751 00144$:
                           0001E6   752 	C$main.c$259$2_0$373 ==.
                                    753 ;	../src/main.c: 259: pfsm->error = ERR_WR_DATA;
                                    754 ; genPointerSet
      0082F3 1E 05            [ 2]  755 	ldw	x, (0x05, sp)
      0082F5 A6 02            [ 1]  756 	ld	a, #0x02
      0082F7 F7               [ 1]  757 	ld	(x), a
                           0001EB   758 	C$main.c$260$2_0$373 ==.
                                    759 ;	../src/main.c: 260: pfsm->state = S4_ERR;
                                    760 ; genPointerSet
      0082F8 1E 03            [ 2]  761 	ldw	x, (0x03, sp)
      0082FA A6 04            [ 1]  762 	ld	a, #0x04
      0082FC F7               [ 1]  763 	ld	(x), a
                           0001F0   764 	C$main.c$261$2_0$373 ==.
                                    765 ;	../src/main.c: 261: return;
                                    766 ; genReturn
      0082FD CC 83 61         [ 2]  767 	jp	00112$
                                    768 ; genLabel
      008300                        769 00105$:
                           0001F3   770 	C$main.c$264$1_0$370 ==.
                                    771 ;	../src/main.c: 264: if(NO_BUFF_PER_BLK == ++blkCnt){
                                    772 ; genPlus
      008300 72 5C 02 63      [ 1]  773 	inc	_blkCnt+0
                                    774 ; genCmpEQorNE
      008304 C6 02 63         [ 1]  775 	ld	a, _blkCnt+0
      008307 A1 02            [ 1]  776 	cp	a, #0x02
      008309 26 03            [ 1]  777 	jrne	00146$
      00830B CC 83 11         [ 2]  778 	jp	00147$
      00830E                        779 00146$:
      00830E CC 83 5E         [ 2]  780 	jp	00111$
      008311                        781 00147$:
                                    782 ; skipping generated iCode
                           000204   783 	C$main.c$266$2_0$374 ==.
                                    784 ;	../src/main.c: 266: blkCnt = 0;
                                    785 ; genAssign
      008311 72 5F 02 63      [ 1]  786 	clr	_blkCnt+0
                           000208   787 	C$main.c$267$2_0$374 ==.
                                    788 ;	../src/main.c: 267: res = pf_write(0,0,&pbr);
                                    789 ; skipping iCode since result will be rematerialized
                                    790 ; skipping iCode since result will be rematerialized
                                    791 ; genIPush
      008315 96               [ 1]  792 	ldw	x, sp
      008316 5C               [ 1]  793 	incw	x
      008317 89               [ 2]  794 	pushw	x
                                    795 ; genIPush
      008318 5F               [ 1]  796 	clrw	x
      008319 89               [ 2]  797 	pushw	x
                                    798 ; genIPush
      00831A 5F               [ 1]  799 	clrw	x
      00831B 89               [ 2]  800 	pushw	x
                                    801 ; genCall
      00831C CD 9D 1A         [ 4]  802 	call	_pf_write
      00831F 5B 06            [ 2]  803 	addw	sp, #6
                           000214   804 	C$main.c$270$2_0$374 ==.
                                    805 ;	../src/main.c: 270: if(FR_OK != res){
                                    806 ; genIfx
      008321 4D               [ 1]  807 	tnz	a
      008322 26 03            [ 1]  808 	jrne	00148$
      008324 CC 83 34         [ 2]  809 	jp	00107$
      008327                        810 00148$:
                           00021A   811 	C$main.c$272$3_0$375 ==.
                                    812 ;	../src/main.c: 272: pfsm->error = ERR_WR_NO_RESP;
                                    813 ; genPointerSet
      008327 1E 05            [ 2]  814 	ldw	x, (0x05, sp)
      008329 A6 03            [ 1]  815 	ld	a, #0x03
      00832B F7               [ 1]  816 	ld	(x), a
                           00021F   817 	C$main.c$273$3_0$375 ==.
                                    818 ;	../src/main.c: 273: pfsm->state = S4_ERR;
                                    819 ; genPointerSet
      00832C 1E 03            [ 2]  820 	ldw	x, (0x03, sp)
      00832E A6 04            [ 1]  821 	ld	a, #0x04
      008330 F7               [ 1]  822 	ld	(x), a
                           000224   823 	C$main.c$274$3_0$375 ==.
                                    824 ;	../src/main.c: 274: return;
                                    825 ; genReturn
      008331 CC 83 61         [ 2]  826 	jp	00112$
                                    827 ; genLabel
      008334                        828 00107$:
                           000227   829 	C$main.c$277$2_0$374 ==.
                                    830 ;	../src/main.c: 277: if(0 == --fileBlkCnt){
                                    831 ; genMinus
      008334 CE 02 66         [ 2]  832 	ldw	x, _fileBlkCnt+2
      008337 1D 00 01         [ 2]  833 	subw	x, #0x0001
      00833A 90 CE 02 64      [ 2]  834 	ldw	y, _fileBlkCnt+0
      00833E 24 02            [ 1]  835 	jrnc	00149$
      008340 90 5A            [ 2]  836 	decw	y
      008342                        837 00149$:
                                    838 ; genAssign
      008342 CF 02 66         [ 2]  839 	ldw	_fileBlkCnt+2, x
      008345 90 CF 02 64      [ 2]  840 	ldw	_fileBlkCnt+0, y
                                    841 ; genIfx
      008349 CE 02 66         [ 2]  842 	ldw	x, _fileBlkCnt+2
      00834C 26 05            [ 1]  843 	jrne	00150$
      00834E CE 02 64         [ 2]  844 	ldw	x, _fileBlkCnt+0
      008351 27 03            [ 1]  845 	jreq	00151$
      008353                        846 00150$:
      008353 CC 83 5E         [ 2]  847 	jp	00111$
      008356                        848 00151$:
                           000249   849 	C$main.c$280$3_0$376 ==.
                                    850 ;	../src/main.c: 280: pfsm->state = S3_NXT_FILE;
                                    851 ; genPointerSet
      008356 1E 03            [ 2]  852 	ldw	x, (0x03, sp)
      008358 A6 03            [ 1]  853 	ld	a, #0x03
      00835A F7               [ 1]  854 	ld	(x), a
                           00024E   855 	C$main.c$281$3_0$376 ==.
                                    856 ;	../src/main.c: 281: return;
                                    857 ; genReturn
      00835B CC 83 61         [ 2]  858 	jp	00112$
                                    859 ; genLabel
      00835E                        860 00111$:
                           000251   861 	C$main.c$286$1_0$370 ==.
                                    862 ;	../src/main.c: 286: pfsm->state = S0_RST; 
                                    863 ; genPointerSet
      00835E 1E 03            [ 2]  864 	ldw	x, (0x03, sp)
      008360 7F               [ 1]  865 	clr	(x)
                                    866 ; genLabel
      008361                        867 00112$:
                           000254   868 	C$main.c$287$1_0$370 ==.
                                    869 ;	../src/main.c: 287: }
                                    870 ; genEndFunction
      008361 5B 06            [ 2]  871 	addw	sp, #6
                           000256   872 	C$main.c$287$1_0$370 ==.
                           000256   873 	XFmain$Wr2SD$0$0 ==.
      008363 81               [ 4]  874 	ret
                           000257   875 	Fmain$GetNxtFileName$0$0 ==.
                           000257   876 	C$main.c$300$1_0$378 ==.
                                    877 ;	../src/main.c: 300: static void GetNxtFileName( char * fname){
                                    878 ; genLabel
                                    879 ;	-----------------------------------------
                                    880 ;	 function GetNxtFileName
                                    881 ;	-----------------------------------------
                                    882 ;	Register assignment might be sub-optimal.
                                    883 ;	Stack space usage: 8 bytes.
      008364                        884 _GetNxtFileName:
      008364 52 08            [ 2]  885 	sub	sp, #8
                           000259   886 	C$main.c$301$2_0$378 ==.
                                    887 ;	../src/main.c: 301: uint8_t val = 0;
                                    888 ; genAssign
      008366 5F               [ 1]  889 	clrw	x
                           00025A   890 	C$main.c$303$1_0$378 ==.
                                    891 ;	../src/main.c: 303: if(0x39 == fname[3]){
                                    892 ; genPlus
      008367 16 0B            [ 2]  893 	ldw	y, (0x0b, sp)
      008369 72 A9 00 03      [ 2]  894 	addw	y, #0x0003
      00836D 17 01            [ 2]  895 	ldw	(0x01, sp), y
                                    896 ; genPointerGet
      00836F 16 01            [ 2]  897 	ldw	y, (0x01, sp)
      008371 90 F6            [ 1]  898 	ld	a, (y)
      008373 97               [ 1]  899 	ld	xl, a
                                    900 ; genCmpEQorNE
      008374 9F               [ 1]  901 	ld	a, xl
      008375 A1 39            [ 1]  902 	cp	a, #0x39
      008377 26 03            [ 1]  903 	jrne	00158$
      008379 CC 83 7F         [ 2]  904 	jp	00159$
      00837C                        905 00158$:
      00837C CC 83 82         [ 2]  906 	jp	00102$
      00837F                        907 00159$:
                                    908 ; skipping generated iCode
                           000272   909 	C$main.c$304$2_0$379 ==.
                                    910 ;	../src/main.c: 304: val = 0x01;
                                    911 ; genAssign
      00837F A6 01            [ 1]  912 	ld	a, #0x01
      008381 95               [ 1]  913 	ld	xh, a
                                    914 ; genLabel
      008382                        915 00102$:
                           000275   916 	C$main.c$306$1_0$378 ==.
                                    917 ;	../src/main.c: 306: if(0x39 == fname[2]) {
                                    918 ; genPlus
      008382 16 0B            [ 2]  919 	ldw	y, (0x0b, sp)
      008384 90 5C            [ 1]  920 	incw	y
      008386 90 5C            [ 1]  921 	incw	y
      008388 17 03            [ 2]  922 	ldw	(0x03, sp), y
                                    923 ; genPointerGet
      00838A 16 03            [ 2]  924 	ldw	y, (0x03, sp)
      00838C 90 F6            [ 1]  925 	ld	a, (y)
                                    926 ; genCmpEQorNE
      00838E A1 39            [ 1]  927 	cp	a, #0x39
      008390 26 03            [ 1]  928 	jrne	00161$
      008392 CC 83 98         [ 2]  929 	jp	00162$
      008395                        930 00161$:
      008395 CC 83 9B         [ 2]  931 	jp	00104$
      008398                        932 00162$:
                                    933 ; skipping generated iCode
                           00028B   934 	C$main.c$307$2_0$380 ==.
                                    935 ;	../src/main.c: 307: val += 0x02;
                                    936 ; genCast
                                    937 ; genAssign
                                    938 ; genPlus
      008398 1C 02 00         [ 2]  939 	addw	x, #512
                                    940 ; genLabel
      00839B                        941 00104$:
                           00028E   942 	C$main.c$309$1_0$378 ==.
                                    943 ;	../src/main.c: 309: if(0x39 == fname[1]) {
                                    944 ; genPlus
      00839B 16 0B            [ 2]  945 	ldw	y, (0x0b, sp)
      00839D 90 5C            [ 1]  946 	incw	y
      00839F 17 05            [ 2]  947 	ldw	(0x05, sp), y
                                    948 ; genPointerGet
      0083A1 16 05            [ 2]  949 	ldw	y, (0x05, sp)
      0083A3 90 F6            [ 1]  950 	ld	a, (y)
                                    951 ; genCmpEQorNE
      0083A5 A1 39            [ 1]  952 	cp	a, #0x39
      0083A7 26 03            [ 1]  953 	jrne	00164$
      0083A9 CC 83 AF         [ 2]  954 	jp	00165$
      0083AC                        955 00164$:
      0083AC CC 83 B2         [ 2]  956 	jp	00106$
      0083AF                        957 00165$:
                                    958 ; skipping generated iCode
                           0002A2   959 	C$main.c$310$2_0$381 ==.
                                    960 ;	../src/main.c: 310: val += 0x04;
                                    961 ; genCast
                                    962 ; genAssign
                                    963 ; genPlus
      0083AF 1C 04 00         [ 2]  964 	addw	x, #1024
                                    965 ; genLabel
      0083B2                        966 00106$:
                           0002A5   967 	C$main.c$312$1_0$378 ==.
                                    968 ;	../src/main.c: 312: if(0x39 == fname[0]) {
                                    969 ; genAssign
      0083B2 16 0B            [ 2]  970 	ldw	y, (0x0b, sp)
      0083B4 17 07            [ 2]  971 	ldw	(0x07, sp), y
                                    972 ; genPointerGet
      0083B6 16 07            [ 2]  973 	ldw	y, (0x07, sp)
      0083B8 90 F6            [ 1]  974 	ld	a, (y)
                                    975 ; genCmpEQorNE
      0083BA A1 39            [ 1]  976 	cp	a, #0x39
      0083BC 26 03            [ 1]  977 	jrne	00167$
      0083BE CC 83 C4         [ 2]  978 	jp	00168$
      0083C1                        979 00167$:
      0083C1 CC 83 C7         [ 2]  980 	jp	00108$
      0083C4                        981 00168$:
                                    982 ; skipping generated iCode
                           0002B7   983 	C$main.c$313$2_0$382 ==.
                                    984 ;	../src/main.c: 313: val += 0x08;
                                    985 ; genCast
                                    986 ; genAssign
                                    987 ; genPlus
      0083C4 1C 08 00         [ 2]  988 	addw	x, #2048
                                    989 ; genLabel
      0083C7                        990 00108$:
                           0002BA   991 	C$main.c$316$1_0$378 ==.
                                    992 ;	../src/main.c: 316: switch(val){
                                    993 ; genCmpEQorNE
      0083C7 9E               [ 1]  994 	ld	a, xh
      0083C8 4A               [ 1]  995 	dec	a
      0083C9 26 03            [ 1]  996 	jrne	00170$
      0083CB CC 83 E9         [ 2]  997 	jp	00109$
      0083CE                        998 00170$:
                                    999 ; skipping generated iCode
                                   1000 ; genCmpEQorNE
      0083CE 9E               [ 1] 1001 	ld	a, xh
      0083CF A1 03            [ 1] 1002 	cp	a, #0x03
      0083D1 26 03            [ 1] 1003 	jrne	00173$
      0083D3 CC 83 F8         [ 2] 1004 	jp	00110$
      0083D6                       1005 00173$:
                                   1006 ; skipping generated iCode
                                   1007 ; genCmpEQorNE
      0083D6 9E               [ 1] 1008 	ld	a, xh
      0083D7 A1 07            [ 1] 1009 	cp	a, #0x07
      0083D9 26 03            [ 1] 1010 	jrne	00176$
      0083DB CC 84 0C         [ 2] 1011 	jp	00111$
      0083DE                       1012 00176$:
                                   1013 ; skipping generated iCode
                                   1014 ; genCmpEQorNE
      0083DE 9E               [ 1] 1015 	ld	a, xh
      0083DF A1 0F            [ 1] 1016 	cp	a, #0x0f
      0083E1 26 03            [ 1] 1017 	jrne	00179$
      0083E3 CC 84 25         [ 2] 1018 	jp	00112$
      0083E6                       1019 00179$:
                                   1020 ; skipping generated iCode
                                   1021 ; genGoto
      0083E6 CC 84 3C         [ 2] 1022 	jp	00113$
                           0002DC  1023 	C$main.c$317$2_0$383 ==.
                                   1024 ;	../src/main.c: 317: case 0x01: fname[3] = 0x30; 
                                   1025 ; genLabel
      0083E9                       1026 00109$:
                                   1027 ; genPointerSet
      0083E9 1E 01            [ 2] 1028 	ldw	x, (0x01, sp)
      0083EB A6 30            [ 1] 1029 	ld	a, #0x30
      0083ED F7               [ 1] 1030 	ld	(x), a
                           0002E1  1031 	C$main.c$318$2_0$383 ==.
                                   1032 ;	../src/main.c: 318: fname[2]++;break;
                                   1033 ; genPointerGet
      0083EE 1E 03            [ 2] 1034 	ldw	x, (0x03, sp)
      0083F0 F6               [ 1] 1035 	ld	a, (x)
                                   1036 ; genPlus
      0083F1 4C               [ 1] 1037 	inc	a
                                   1038 ; genPointerSet
      0083F2 1E 03            [ 2] 1039 	ldw	x, (0x03, sp)
      0083F4 F7               [ 1] 1040 	ld	(x), a
                                   1041 ; genGoto
      0083F5 CC 84 41         [ 2] 1042 	jp	00115$
                           0002EB  1043 	C$main.c$319$2_0$383 ==.
                                   1044 ;	../src/main.c: 319: case 0x03: fname[3] = 0x30; 
                                   1045 ; genLabel
      0083F8                       1046 00110$:
                                   1047 ; genPointerSet
      0083F8 1E 01            [ 2] 1048 	ldw	x, (0x01, sp)
      0083FA A6 30            [ 1] 1049 	ld	a, #0x30
      0083FC F7               [ 1] 1050 	ld	(x), a
                           0002F0  1051 	C$main.c$320$2_0$383 ==.
                                   1052 ;	../src/main.c: 320: fname[2] = 0x30; 
                                   1053 ; genPointerSet
      0083FD 1E 03            [ 2] 1054 	ldw	x, (0x03, sp)
      0083FF A6 30            [ 1] 1055 	ld	a, #0x30
      008401 F7               [ 1] 1056 	ld	(x), a
                           0002F5  1057 	C$main.c$321$2_0$383 ==.
                                   1058 ;	../src/main.c: 321: fname[1]++; break;
                                   1059 ; genPointerGet
      008402 1E 05            [ 2] 1060 	ldw	x, (0x05, sp)
      008404 F6               [ 1] 1061 	ld	a, (x)
                                   1062 ; genPlus
      008405 4C               [ 1] 1063 	inc	a
                                   1064 ; genPointerSet
      008406 1E 05            [ 2] 1065 	ldw	x, (0x05, sp)
      008408 F7               [ 1] 1066 	ld	(x), a
                                   1067 ; genGoto
      008409 CC 84 41         [ 2] 1068 	jp	00115$
                           0002FF  1069 	C$main.c$322$2_0$383 ==.
                                   1070 ;	../src/main.c: 322: case 0x07: fname[3] = 0x30; 
                                   1071 ; genLabel
      00840C                       1072 00111$:
                                   1073 ; genPointerSet
      00840C 1E 01            [ 2] 1074 	ldw	x, (0x01, sp)
      00840E A6 30            [ 1] 1075 	ld	a, #0x30
      008410 F7               [ 1] 1076 	ld	(x), a
                           000304  1077 	C$main.c$323$2_0$383 ==.
                                   1078 ;	../src/main.c: 323: fname[2] = 0x30; 
                                   1079 ; genPointerSet
      008411 1E 03            [ 2] 1080 	ldw	x, (0x03, sp)
      008413 A6 30            [ 1] 1081 	ld	a, #0x30
      008415 F7               [ 1] 1082 	ld	(x), a
                           000309  1083 	C$main.c$324$2_0$383 ==.
                                   1084 ;	../src/main.c: 324: fname[1] = 0x30; 
                                   1085 ; genPointerSet
      008416 1E 05            [ 2] 1086 	ldw	x, (0x05, sp)
      008418 A6 30            [ 1] 1087 	ld	a, #0x30
      00841A F7               [ 1] 1088 	ld	(x), a
                           00030E  1089 	C$main.c$325$2_0$383 ==.
                                   1090 ;	../src/main.c: 325: fname[0]++; break;
                                   1091 ; genPointerGet
      00841B 1E 07            [ 2] 1092 	ldw	x, (0x07, sp)
      00841D F6               [ 1] 1093 	ld	a, (x)
                                   1094 ; genPlus
      00841E 4C               [ 1] 1095 	inc	a
                                   1096 ; genPointerSet
      00841F 1E 07            [ 2] 1097 	ldw	x, (0x07, sp)
      008421 F7               [ 1] 1098 	ld	(x), a
                                   1099 ; genGoto
      008422 CC 84 41         [ 2] 1100 	jp	00115$
                           000318  1101 	C$main.c$326$2_0$383 ==.
                                   1102 ;	../src/main.c: 326: case 0x0f: fname[3] = 0x30; 
                                   1103 ; genLabel
      008425                       1104 00112$:
                                   1105 ; genPointerSet
      008425 1E 01            [ 2] 1106 	ldw	x, (0x01, sp)
      008427 A6 30            [ 1] 1107 	ld	a, #0x30
      008429 F7               [ 1] 1108 	ld	(x), a
                           00031D  1109 	C$main.c$327$2_0$383 ==.
                                   1110 ;	../src/main.c: 327: fname[2] = 0x30; 
                                   1111 ; genPointerSet
      00842A 1E 03            [ 2] 1112 	ldw	x, (0x03, sp)
      00842C A6 30            [ 1] 1113 	ld	a, #0x30
      00842E F7               [ 1] 1114 	ld	(x), a
                           000322  1115 	C$main.c$328$2_0$383 ==.
                                   1116 ;	../src/main.c: 328: fname[1] = 0x30; 
                                   1117 ; genPointerSet
      00842F 1E 05            [ 2] 1118 	ldw	x, (0x05, sp)
      008431 A6 30            [ 1] 1119 	ld	a, #0x30
      008433 F7               [ 1] 1120 	ld	(x), a
                           000327  1121 	C$main.c$329$2_0$383 ==.
                                   1122 ;	../src/main.c: 329: fname[0] = 0x30; break;
                                   1123 ; genPointerSet
      008434 1E 07            [ 2] 1124 	ldw	x, (0x07, sp)
      008436 A6 30            [ 1] 1125 	ld	a, #0x30
      008438 F7               [ 1] 1126 	ld	(x), a
                                   1127 ; genGoto
      008439 CC 84 41         [ 2] 1128 	jp	00115$
                           00032F  1129 	C$main.c$330$2_0$383 ==.
                                   1130 ;	../src/main.c: 330: default: fname[3]++; break;
                                   1131 ; genLabel
      00843C                       1132 00113$:
                                   1133 ; genPlus
      00843C 9F               [ 1] 1134 	ld	a, xl
      00843D 4C               [ 1] 1135 	inc	a
                                   1136 ; genPointerSet
      00843E 1E 01            [ 2] 1137 	ldw	x, (0x01, sp)
      008440 F7               [ 1] 1138 	ld	(x), a
                           000334  1139 	C$main.c$331$1_0$378 ==.
                                   1140 ;	../src/main.c: 331: }
                                   1141 ; genLabel
      008441                       1142 00115$:
                           000334  1143 	C$main.c$332$1_0$378 ==.
                                   1144 ;	../src/main.c: 332: }
                                   1145 ; genEndFunction
      008441 5B 08            [ 2] 1146 	addw	sp, #8
                           000336  1147 	C$main.c$332$1_0$378 ==.
                           000336  1148 	XFmain$GetNxtFileName$0$0 ==.
      008443 81               [ 4] 1149 	ret
                           000337  1150 	Fmain$ConvertFileName$0$0 ==.
                           000337  1151 	C$main.c$345$1_0$385 ==.
                                   1152 ;	../src/main.c: 345: static void ConvertFileName(uint16_t firstFileName, char * fname){
                                   1153 ; genLabel
                                   1154 ;	-----------------------------------------
                                   1155 ;	 function ConvertFileName
                                   1156 ;	-----------------------------------------
                                   1157 ;	Register assignment might be sub-optimal.
                                   1158 ;	Stack space usage: 4 bytes.
      008444                       1159 _ConvertFileName:
      008444 52 04            [ 2] 1160 	sub	sp, #4
                           000339  1161 	C$main.c$348$1_0$385 ==.
                                   1162 ;	../src/main.c: 348: val = firstFileName/1000;
                                   1163 ; genCast
                                   1164 ; genAssign
      008446 16 07            [ 2] 1165 	ldw	y, (0x07, sp)
      008448 17 03            [ 2] 1166 	ldw	(0x03, sp), y
                                   1167 ; genDivMod
      00844A 1E 03            [ 2] 1168 	ldw	x, (0x03, sp)
      00844C 90 AE 03 E8      [ 2] 1169 	ldw	y, #0x03e8
      008450 65               [ 2] 1170 	divw	x, y
                                   1171 ; genCast
                                   1172 ; genAssign
                                   1173 ; genAssign
                           000344  1174 	C$main.c$349$1_0$385 ==.
                                   1175 ;	../src/main.c: 349: fname[0] = val + 0x30;
                                   1176 ; genAssign
      008451 16 09            [ 2] 1177 	ldw	y, (0x09, sp)
      008453 17 01            [ 2] 1178 	ldw	(0x01, sp), y
                                   1179 ; genCast
                                   1180 ; genAssign
      008455 9F               [ 1] 1181 	ld	a, xl
                                   1182 ; genCast
                                   1183 ; genAssign
                                   1184 ; genPlus
      008456 AB 30            [ 1] 1185 	add	a, #0x30
                                   1186 ; genPointerSet
      008458 16 01            [ 2] 1187 	ldw	y, (0x01, sp)
      00845A 90 F7            [ 1] 1188 	ld	(y), a
                           00034F  1189 	C$main.c$350$1_0$385 ==.
                                   1190 ;	../src/main.c: 350: firstFileName -=  val*1000;
                                   1191 ; genCast
                                   1192 ; genAssign
                                   1193 ; genIPush
      00845C 89               [ 2] 1194 	pushw	x
                                   1195 ; genIPush
      00845D 4B E8            [ 1] 1196 	push	#0xe8
      00845F 4B 03            [ 1] 1197 	push	#0x03
                                   1198 ; genCall
      008461 CD 9F F8         [ 4] 1199 	call	__mulint
      008464 5B 04            [ 2] 1200 	addw	sp, #4
                                   1201 ; genMinus
      008466 50               [ 2] 1202 	negw	x
      008467 72 FB 03         [ 2] 1203 	addw	x, (0x03, sp)
                                   1204 ; genCast
                                   1205 ; genAssign
                                   1206 ; genAssign
      00846A 1F 07            [ 2] 1207 	ldw	(0x07, sp), x
                           00035F  1208 	C$main.c$351$1_0$385 ==.
                                   1209 ;	../src/main.c: 351: val = firstFileName/100;
                                   1210 ; genCast
                                   1211 ; genAssign
      00846C 16 07            [ 2] 1212 	ldw	y, (0x07, sp)
      00846E 17 03            [ 2] 1213 	ldw	(0x03, sp), y
                                   1214 ; genDivMod
      008470 1E 03            [ 2] 1215 	ldw	x, (0x03, sp)
      008472 90 AE 00 64      [ 2] 1216 	ldw	y, #0x0064
      008476 65               [ 2] 1217 	divw	x, y
                                   1218 ; genCast
                                   1219 ; genAssign
                                   1220 ; genAssign
                           00036A  1221 	C$main.c$352$1_0$385 ==.
                                   1222 ;	../src/main.c: 352: fname[1] = val + 0x30;
                                   1223 ; genPlus
      008477 16 01            [ 2] 1224 	ldw	y, (0x01, sp)
      008479 90 5C            [ 1] 1225 	incw	y
                                   1226 ; genCast
                                   1227 ; genAssign
      00847B 9F               [ 1] 1228 	ld	a, xl
                                   1229 ; genCast
                                   1230 ; genAssign
                                   1231 ; genPlus
      00847C AB 30            [ 1] 1232 	add	a, #0x30
                                   1233 ; genPointerSet
      00847E 90 F7            [ 1] 1234 	ld	(y), a
                           000373  1235 	C$main.c$353$1_0$385 ==.
                                   1236 ;	../src/main.c: 353: firstFileName -=  val*100;
                                   1237 ; genCast
                                   1238 ; genAssign
                                   1239 ; genIPush
      008480 89               [ 2] 1240 	pushw	x
                                   1241 ; genIPush
      008481 4B 64            [ 1] 1242 	push	#0x64
      008483 4B 00            [ 1] 1243 	push	#0x00
                                   1244 ; genCall
      008485 CD 9F F8         [ 4] 1245 	call	__mulint
      008488 5B 04            [ 2] 1246 	addw	sp, #4
                                   1247 ; genMinus
      00848A 50               [ 2] 1248 	negw	x
      00848B 72 FB 03         [ 2] 1249 	addw	x, (0x03, sp)
                                   1250 ; genCast
                                   1251 ; genAssign
                                   1252 ; genAssign
      00848E 1F 07            [ 2] 1253 	ldw	(0x07, sp), x
                           000383  1254 	C$main.c$354$1_0$385 ==.
                                   1255 ;	../src/main.c: 354: val = firstFileName/10;
                                   1256 ; genCast
                                   1257 ; genAssign
      008490 16 07            [ 2] 1258 	ldw	y, (0x07, sp)
      008492 17 03            [ 2] 1259 	ldw	(0x03, sp), y
                                   1260 ; genDivMod
      008494 1E 03            [ 2] 1261 	ldw	x, (0x03, sp)
      008496 90 AE 00 0A      [ 2] 1262 	ldw	y, #0x000a
      00849A 65               [ 2] 1263 	divw	x, y
                                   1264 ; genCast
                                   1265 ; genAssign
                                   1266 ; genAssign
                           00038E  1267 	C$main.c$355$1_0$385 ==.
                                   1268 ;	../src/main.c: 355: fname[2] = val + 0x30;
                                   1269 ; genPlus
      00849B 16 01            [ 2] 1270 	ldw	y, (0x01, sp)
      00849D 72 A9 00 02      [ 2] 1271 	addw	y, #0x0002
                                   1272 ; genCast
                                   1273 ; genAssign
      0084A1 9F               [ 1] 1274 	ld	a, xl
                                   1275 ; genCast
                                   1276 ; genAssign
                                   1277 ; genPlus
      0084A2 AB 30            [ 1] 1278 	add	a, #0x30
                                   1279 ; genPointerSet
      0084A4 90 F7            [ 1] 1280 	ld	(y), a
                           000399  1281 	C$main.c$356$1_0$385 ==.
                                   1282 ;	../src/main.c: 356: firstFileName -=  val*10;
                                   1283 ; genCast
                                   1284 ; genAssign
                                   1285 ; genMult
                                   1286 ; genMultLit
      0084A6 89               [ 2] 1287 	pushw	x
      0084A7 58               [ 2] 1288 	sllw	x
      0084A8 58               [ 2] 1289 	sllw	x
      0084A9 72 FB 01         [ 2] 1290 	addw	x, (1, sp)
      0084AC 58               [ 2] 1291 	sllw	x
      0084AD 5B 02            [ 2] 1292 	addw	sp, #2
                                   1293 ; genMinus
      0084AF 50               [ 2] 1294 	negw	x
      0084B0 72 FB 03         [ 2] 1295 	addw	x, (0x03, sp)
                                   1296 ; genCast
                                   1297 ; genAssign
                                   1298 ; genAssign
      0084B3 1F 07            [ 2] 1299 	ldw	(0x07, sp), x
                           0003A8  1300 	C$main.c$357$1_0$385 ==.
                                   1301 ;	../src/main.c: 357: fname[3] = firstFileName + 0x30;
                                   1302 ; genPlus
      0084B5 1E 01            [ 2] 1303 	ldw	x, (0x01, sp)
      0084B7 1C 00 03         [ 2] 1304 	addw	x, #0x0003
                                   1305 ; genCast
                                   1306 ; genAssign
      0084BA 7B 08            [ 1] 1307 	ld	a, (0x08, sp)
                                   1308 ; genCast
                                   1309 ; genAssign
                                   1310 ; genPlus
      0084BC AB 30            [ 1] 1311 	add	a, #0x30
                                   1312 ; genPointerSet
      0084BE F7               [ 1] 1313 	ld	(x), a
                           0003B2  1314 	C$main.c$358$1_0$385 ==.
                                   1315 ;	../src/main.c: 358: fname[4] = '\0';
                                   1316 ; genPlus
      0084BF 1E 01            [ 2] 1317 	ldw	x, (0x01, sp)
      0084C1 1C 00 04         [ 2] 1318 	addw	x, #0x0004
                                   1319 ; genPointerSet
      0084C4 7F               [ 1] 1320 	clr	(x)
                                   1321 ; genLabel
      0084C5                       1322 00101$:
                           0003B8  1323 	C$main.c$359$1_0$385 ==.
                                   1324 ;	../src/main.c: 359: }
                                   1325 ; genEndFunction
      0084C5 5B 04            [ 2] 1326 	addw	sp, #4
                           0003BA  1327 	C$main.c$359$1_0$385 ==.
                           0003BA  1328 	XFmain$ConvertFileName$0$0 ==.
      0084C7 81               [ 4] 1329 	ret
                           0003BB  1330 	Fmain$GetCfg$0$0 ==.
                           0003BB  1331 	C$main.c$374$1_0$387 ==.
                                   1332 ;	../src/main.c: 374: static UINT GetCfg( uint8_t * pCfgBuf,  cfg_t * pcfg){
                                   1333 ; genLabel
                                   1334 ;	-----------------------------------------
                                   1335 ;	 function GetCfg
                                   1336 ;	-----------------------------------------
                                   1337 ;	Register assignment might be sub-optimal.
                                   1338 ;	Stack space usage: 18 bytes.
      0084C8                       1339 _GetCfg:
      0084C8 52 12            [ 2] 1340 	sub	sp, #18
                           0003BD  1341 	C$main.c$377$1_0$387 ==.
                                   1342 ;	../src/main.c: 377: if(!IsValidCfgBuf(pCfgBuf)) return 1; 
                                   1343 ; genIPush
      0084CA 1E 15            [ 2] 1344 	ldw	x, (0x15, sp)
      0084CC 89               [ 2] 1345 	pushw	x
                                   1346 ; genCall
      0084CD CD 85 DB         [ 4] 1347 	call	_IsValidCfgBuf
      0084D0 85               [ 2] 1348 	popw	x
      0084D1 6B 12            [ 1] 1349 	ld	(0x12, sp), a
                                   1350 ; genIfx
      0084D3 0D 12            [ 1] 1351 	tnz	(0x12, sp)
      0084D5 27 03            [ 1] 1352 	jreq	00118$
      0084D7 CC 84 DF         [ 2] 1353 	jp	00102$
      0084DA                       1354 00118$:
                                   1355 ; genReturn
      0084DA 5F               [ 1] 1356 	clrw	x
      0084DB 5C               [ 1] 1357 	incw	x
      0084DC CC 85 D8         [ 2] 1358 	jp	00106$
                                   1359 ; genLabel
      0084DF                       1360 00102$:
                           0003D2  1361 	C$main.c$380$1_0$387 ==.
                                   1362 ;	../src/main.c: 380: pcfg->sampFreq = pCfgBuf[0]+(((uint16_t)pCfgBuf[1])<<8);
                                   1363 ; genAssign
      0084DF 16 17            [ 2] 1364 	ldw	y, (0x17, sp)
      0084E1 17 01            [ 2] 1365 	ldw	(0x01, sp), y
                                   1366 ; genAssign
      0084E3 16 15            [ 2] 1367 	ldw	y, (0x15, sp)
      0084E5 17 03            [ 2] 1368 	ldw	(0x03, sp), y
                                   1369 ; genPointerGet
      0084E7 1E 03            [ 2] 1370 	ldw	x, (0x03, sp)
      0084E9 F6               [ 1] 1371 	ld	a, (x)
                                   1372 ; genCast
                                   1373 ; genAssign
      0084EA 5F               [ 1] 1374 	clrw	x
      0084EB 97               [ 1] 1375 	ld	xl, a
                                   1376 ; genAssign
      0084EC 16 03            [ 2] 1377 	ldw	y, (0x03, sp)
                                   1378 ; genPointerGet
      0084EE 90 E6 01         [ 1] 1379 	ld	a, (0x1, y)
                                   1380 ; genCast
                                   1381 ; genAssign
      0084F1 90 95            [ 1] 1382 	ld	yh, a
      0084F3 4F               [ 1] 1383 	clr	a
                                   1384 ; genLeftShiftLiteral
      0084F4 4F               [ 1] 1385 	clr	a
                                   1386 ; genCast
                                   1387 ; genAssign
      0084F5 1F 11            [ 2] 1388 	ldw	(0x11, sp), x
                                   1389 ; genPlus
      0084F7 90 97            [ 1] 1390 	ld	yl, a
      0084F9 72 F9 11         [ 2] 1391 	addw	y, (0x11, sp)
                                   1392 ; genPointerSet
      0084FC 1E 01            [ 2] 1393 	ldw	x, (0x01, sp)
      0084FE FF               [ 2] 1394 	ldw	(x), y
                           0003F2  1395 	C$main.c$382$1_0$387 ==.
                                   1396 ;	../src/main.c: 382: fID = pCfgBuf[2]+(((uint16_t)pCfgBuf[3])<<8);
                                   1397 ; genAssign
      0084FF 1E 03            [ 2] 1398 	ldw	x, (0x03, sp)
                                   1399 ; genPointerGet
      008501 E6 02            [ 1] 1400 	ld	a, (0x2, x)
                                   1401 ; genCast
                                   1402 ; genAssign
      008503 90 5F            [ 1] 1403 	clrw	y
      008505 90 97            [ 1] 1404 	ld	yl, a
                                   1405 ; genAssign
      008507 1E 03            [ 2] 1406 	ldw	x, (0x03, sp)
                                   1407 ; genPointerGet
      008509 E6 03            [ 1] 1408 	ld	a, (0x3, x)
                                   1409 ; genCast
                                   1410 ; genAssign
      00850B 5F               [ 1] 1411 	clrw	x
                                   1412 ; genLeftShiftLiteral
      00850C 95               [ 1] 1413 	ld	xh, a
      00850D 4F               [ 1] 1414 	clr	a
                                   1415 ; genCast
                                   1416 ; genAssign
      00850E 17 11            [ 2] 1417 	ldw	(0x11, sp), y
                                   1418 ; genPlus
      008510 97               [ 1] 1419 	ld	xl, a
      008511 72 FB 11         [ 2] 1420 	addw	x, (0x11, sp)
                                   1421 ; genAssign
                           000407  1422 	C$main.c$384$1_0$387 ==.
                                   1423 ;	../src/main.c: 384: ConvertFileName(fID, pcfg->firstFileName);
                                   1424 ; genPlus
      008514 16 01            [ 2] 1425 	ldw	y, (0x01, sp)
      008516 72 A9 00 02      [ 2] 1426 	addw	y, #0x0002
                                   1427 ; genIPush
      00851A 90 89            [ 2] 1428 	pushw	y
                                   1429 ; genIPush
      00851C 89               [ 2] 1430 	pushw	x
                                   1431 ; genCall
      00851D CD 84 44         [ 4] 1432 	call	_ConvertFileName
      008520 5B 04            [ 2] 1433 	addw	sp, #4
                           000415  1434 	C$main.c$385$1_0$387 ==.
                                   1435 ;	../src/main.c: 385: pcfg->fileNo = pCfgBuf[4]+(((uint16_t)pCfgBuf[5])<<8);
                                   1436 ; genPlus
      008522 16 01            [ 2] 1437 	ldw	y, (0x01, sp)
      008524 72 A9 00 0B      [ 2] 1438 	addw	y, #0x000b
                                   1439 ; genAssign
      008528 1E 03            [ 2] 1440 	ldw	x, (0x03, sp)
                                   1441 ; genPointerGet
      00852A E6 04            [ 1] 1442 	ld	a, (0x4, x)
                                   1443 ; genCast
                                   1444 ; genAssign
      00852C 6B 10            [ 1] 1445 	ld	(0x10, sp), a
      00852E 0F 0F            [ 1] 1446 	clr	(0x0f, sp)
                                   1447 ; genAssign
      008530 1E 03            [ 2] 1448 	ldw	x, (0x03, sp)
                                   1449 ; genPointerGet
      008532 E6 05            [ 1] 1450 	ld	a, (0x5, x)
                                   1451 ; genCast
                                   1452 ; genAssign
      008534 5F               [ 1] 1453 	clrw	x
                                   1454 ; genLeftShiftLiteral
      008535 6B 11            [ 1] 1455 	ld	(0x11, sp), a
      008537 0F 12            [ 1] 1456 	clr	(0x12, sp)
                                   1457 ; genCast
                                   1458 ; genAssign
      008539 1E 0F            [ 2] 1459 	ldw	x, (0x0f, sp)
                                   1460 ; genPlus
      00853B 72 FB 11         [ 2] 1461 	addw	x, (0x11, sp)
                                   1462 ; genPointerSet
      00853E 90 FF            [ 2] 1463 	ldw	(y), x
                           000433  1464 	C$main.c$386$1_0$387 ==.
                                   1465 ;	../src/main.c: 386: pcfg->fileSzInBlock = pCfgBuf[6]+ \
                                   1466 ; genPlus
      008540 1E 01            [ 2] 1467 	ldw	x, (0x01, sp)
      008542 1C 00 07         [ 2] 1468 	addw	x, #0x0007
      008545 1F 05            [ 2] 1469 	ldw	(0x05, sp), x
                                   1470 ; genAssign
      008547 1E 03            [ 2] 1471 	ldw	x, (0x03, sp)
                                   1472 ; genPointerGet
      008549 E6 06            [ 1] 1473 	ld	a, (0x6, x)
      00854B 90 97            [ 1] 1474 	ld	yl, a
                                   1475 ; genAssign
      00854D 1E 03            [ 2] 1476 	ldw	x, (0x03, sp)
                                   1477 ; genPointerGet
      00854F E6 07            [ 1] 1478 	ld	a, (0x7, x)
                                   1479 ; genCast
                                   1480 ; genAssign
      008551 0F 11            [ 1] 1481 	clr	(0x11, sp)
      008553 5F               [ 1] 1482 	clrw	x
                                   1483 ; genLeftShiftLiteral
      008554 95               [ 1] 1484 	ld	xh, a
      008555 7B 11            [ 1] 1485 	ld	a, (0x11, sp)
      008557 0F 0A            [ 1] 1486 	clr	(0x0a, sp)
                                   1487 ; genCast
                                   1488 ; genAssign
      008559 0F 11            [ 1] 1489 	clr	(0x11, sp)
      00855B 0F 10            [ 1] 1490 	clr	(0x10, sp)
      00855D 0F 0F            [ 1] 1491 	clr	(0x0f, sp)
                                   1492 ; genPlus
      00855F 88               [ 1] 1493 	push	a
      008560 90 9F            [ 1] 1494 	ld	a, yl
      008562 1B 0B            [ 1] 1495 	add	a, (0x0b, sp)
      008564 90 97            [ 1] 1496 	ld	yl, a
      008566 9E               [ 1] 1497 	ld	a, xh
      008567 19 12            [ 1] 1498 	adc	a, (0x12, sp)
      008569 90 95            [ 1] 1499 	ld	yh, a
      00856B 84               [ 1] 1500 	pop	a
      00856C 19 10            [ 1] 1501 	adc	a, (0x10, sp)
      00856E 6B 0C            [ 1] 1502 	ld	(0x0c, sp), a
      008570 9F               [ 1] 1503 	ld	a, xl
      008571 19 0F            [ 1] 1504 	adc	a, (0x0f, sp)
      008573 6B 0B            [ 1] 1505 	ld	(0x0b, sp), a
                                   1506 ; genAssign
      008575 1E 03            [ 2] 1507 	ldw	x, (0x03, sp)
                                   1508 ; genPointerGet
      008577 E6 08            [ 1] 1509 	ld	a, (0x8, x)
                                   1510 ; genCast
                                   1511 ; genAssign
      008579 5F               [ 1] 1512 	clrw	x
      00857A 0F 0F            [ 1] 1513 	clr	(0x0f, sp)
                                   1514 ; genLeftShiftLiteral
      00857C 0F 12            [ 1] 1515 	clr	(0x12, sp)
      00857E 0F 11            [ 1] 1516 	clr	(0x11, sp)
                                   1517 ; genPlus
      008580 72 F9 11         [ 2] 1518 	addw	y, (0x11, sp)
      008583 19 0C            [ 1] 1519 	adc	a, (0x0c, sp)
      008585 6B 08            [ 1] 1520 	ld	(0x08, sp), a
      008587 9F               [ 1] 1521 	ld	a, xl
      008588 19 0B            [ 1] 1522 	adc	a, (0x0b, sp)
      00858A 6B 07            [ 1] 1523 	ld	(0x07, sp), a
                                   1524 ; genAssign
      00858C 1E 03            [ 2] 1525 	ldw	x, (0x03, sp)
                                   1526 ; genPointerGet
      00858E E6 09            [ 1] 1527 	ld	a, (0x9, x)
                                   1528 ; genCast
                                   1529 ; genAssign
      008590 5F               [ 1] 1530 	clrw	x
      008591 0F 0F            [ 1] 1531 	clr	(0x0f, sp)
                                   1532 ; genLeftShiftLiteral
      008593 0F 0E            [ 1] 1533 	clr	(0x0e, sp)
      008595 5F               [ 1] 1534 	clrw	x
                                   1535 ; genPlus
      008596 88               [ 1] 1536 	push	a
      008597 90 9F            [ 1] 1537 	ld	a, yl
      008599 1B 0F            [ 1] 1538 	add	a, (0x0f, sp)
      00859B 90 97            [ 1] 1539 	ld	yl, a
      00859D 90 9E            [ 1] 1540 	ld	a, yh
      00859F 89               [ 2] 1541 	pushw	x
      0085A0 19 02            [ 1] 1542 	adc	a, (2, sp)
      0085A2 85               [ 2] 1543 	popw	x
      0085A3 90 95            [ 1] 1544 	ld	yh, a
      0085A5 9E               [ 1] 1545 	ld	a, xh
      0085A6 19 09            [ 1] 1546 	adc	a, (0x09, sp)
      0085A8 6B 11            [ 1] 1547 	ld	(0x11, sp), a
      0085AA 84               [ 1] 1548 	pop	a
      0085AB 19 07            [ 1] 1549 	adc	a, (0x07, sp)
      0085AD 6B 0F            [ 1] 1550 	ld	(0x0f, sp), a
                                   1551 ; genPointerSet
      0085AF 1E 05            [ 2] 1552 	ldw	x, (0x05, sp)
      0085B1 EF 02            [ 2] 1553 	ldw	(0x2, x), y
      0085B3 16 0F            [ 2] 1554 	ldw	y, (0x0f, sp)
      0085B5 FF               [ 2] 1555 	ldw	(x), y
                           0004A9  1556 	C$main.c$390$1_0$387 ==.
                                   1557 ;	../src/main.c: 390: pcfg->channel = pCfgBuf[10];
                                   1558 ; genPlus
      0085B6 1E 01            [ 2] 1559 	ldw	x, (0x01, sp)
      0085B8 1C 00 0D         [ 2] 1560 	addw	x, #0x000d
                                   1561 ; genAssign
      0085BB 16 03            [ 2] 1562 	ldw	y, (0x03, sp)
                                   1563 ; genPointerGet
      0085BD 90 E6 0A         [ 1] 1564 	ld	a, (0xa, y)
                                   1565 ; genPointerSet
      0085C0 F7               [ 1] 1566 	ld	(x), a
                           0004B4  1567 	C$main.c$391$1_0$387 ==.
                                   1568 ;	../src/main.c: 391: if(pCfgBuf[11] == 0)
                                   1569 ; genAssign
      0085C1 1E 03            [ 2] 1570 	ldw	x, (0x03, sp)
                                   1571 ; genPointerGet
      0085C3 E6 0B            [ 1] 1572 	ld	a, (0xb, x)
                           0004B8  1573 	C$main.c$393$1_0$387 ==.
                                   1574 ;	../src/main.c: 393: pcfg->isFullResultion = false;
                                   1575 ; genPlus
      0085C5 1E 01            [ 2] 1576 	ldw	x, (0x01, sp)
      0085C7 1C 00 0E         [ 2] 1577 	addw	x, #0x000e
                           0004BD  1578 	C$main.c$391$1_0$387 ==.
                                   1579 ;	../src/main.c: 391: if(pCfgBuf[11] == 0)
                                   1580 ; genIfx
      0085CA 4D               [ 1] 1581 	tnz	a
      0085CB 27 03            [ 1] 1582 	jreq	00119$
      0085CD CC 85 D4         [ 2] 1583 	jp	00104$
      0085D0                       1584 00119$:
                           0004C3  1585 	C$main.c$393$2_0$388 ==.
                                   1586 ;	../src/main.c: 393: pcfg->isFullResultion = false;
                                   1587 ; genPointerSet
      0085D0 7F               [ 1] 1588 	clr	(x)
                                   1589 ; genGoto
      0085D1 CC 85 D7         [ 2] 1590 	jp	00105$
                                   1591 ; genLabel
      0085D4                       1592 00104$:
                           0004C7  1593 	C$main.c$395$2_0$389 ==.
                                   1594 ;	../src/main.c: 395: pcfg->isFullResultion = true;
                                   1595 ; genPointerSet
      0085D4 A6 01            [ 1] 1596 	ld	a, #0x01
      0085D6 F7               [ 1] 1597 	ld	(x), a
                                   1598 ; genLabel
      0085D7                       1599 00105$:
                           0004CA  1600 	C$main.c$398$1_0$387 ==.
                                   1601 ;	../src/main.c: 398: return 0x0;
                                   1602 ; genReturn
      0085D7 5F               [ 1] 1603 	clrw	x
                                   1604 ; genLabel
      0085D8                       1605 00106$:
                           0004CB  1606 	C$main.c$399$1_0$387 ==.
                                   1607 ;	../src/main.c: 399: }
                                   1608 ; genEndFunction
      0085D8 5B 12            [ 2] 1609 	addw	sp, #18
                           0004CD  1610 	C$main.c$399$1_0$387 ==.
                           0004CD  1611 	XFmain$GetCfg$0$0 ==.
      0085DA 81               [ 4] 1612 	ret
                           0004CE  1613 	Fmain$IsValidCfgBuf$0$0 ==.
                           0004CE  1614 	C$main.c$413$1_0$391 ==.
                                   1615 ;	../src/main.c: 413: static uint8_t IsValidCfgBuf(uint8_t *pCfgBuf){
                                   1616 ; genLabel
                                   1617 ;	-----------------------------------------
                                   1618 ;	 function IsValidCfgBuf
                                   1619 ;	-----------------------------------------
                                   1620 ;	Register assignment might be sub-optimal.
                                   1621 ;	Stack space usage: 1 bytes.
      0085DB                       1622 _IsValidCfgBuf:
      0085DB 88               [ 1] 1623 	push	a
                           0004CF  1624 	C$main.c$414$2_0$391 ==.
                                   1625 ;	../src/main.c: 414: uint8_t crc = 0;
                                   1626 ; genAssign
      0085DC 0F 01            [ 1] 1627 	clr	(0x01, sp)
                           0004D1  1628 	C$main.c$415$2_0$391 ==.
                                   1629 ;	../src/main.c: 415: int i = 0;
                                   1630 ; genAssign
      0085DE 5F               [ 1] 1631 	clrw	x
                           0004D2  1632 	C$main.c$422$1_0$391 ==.
                                   1633 ;	../src/main.c: 422: return false;	
                                   1634 ; genAssign
                                   1635 ; genLabel
      0085DF                       1636 00105$:
                           0004D2  1637 	C$main.c$416$2_0$392 ==.
                                   1638 ;	../src/main.c: 416: for(; i < CFG_BUF_SZ - 1; i++){
                                   1639 ; genCmp
                                   1640 ; genCmpTop
      0085DF A3 00 0C         [ 2] 1641 	cpw	x, #0x000c
      0085E2 2F 03            [ 1] 1642 	jrslt	00125$
      0085E4 CC 85 F6         [ 2] 1643 	jp	00101$
      0085E7                       1644 00125$:
                                   1645 ; skipping generated iCode
                           0004DA  1646 	C$main.c$417$3_0$393 ==.
                                   1647 ;	../src/main.c: 417: crc += pCfgBuf[i];		
                                   1648 ; genPlus
      0085E7 90 93            [ 1] 1649 	ldw	y, x
      0085E9 72 F9 04         [ 2] 1650 	addw	y, (0x04, sp)
                                   1651 ; genPointerGet
      0085EC 90 F6            [ 1] 1652 	ld	a, (y)
                                   1653 ; genPlus
      0085EE 1B 01            [ 1] 1654 	add	a, (0x01, sp)
      0085F0 6B 01            [ 1] 1655 	ld	(0x01, sp), a
                           0004E5  1656 	C$main.c$416$2_0$392 ==.
                                   1657 ;	../src/main.c: 416: for(; i < CFG_BUF_SZ - 1; i++){
                                   1658 ; genPlus
      0085F2 5C               [ 1] 1659 	incw	x
                                   1660 ; genGoto
      0085F3 CC 85 DF         [ 2] 1661 	jp	00105$
                                   1662 ; genLabel
      0085F6                       1663 00101$:
                           0004E9  1664 	C$main.c$419$1_0$391 ==.
                                   1665 ;	../src/main.c: 419: if(crc == pCfgBuf[CFG_BUF_SZ-1])
                                   1666 ; genAssign
      0085F6 1E 04            [ 2] 1667 	ldw	x, (0x04, sp)
                                   1668 ; genPointerGet
      0085F8 E6 0C            [ 1] 1669 	ld	a, (0xc, x)
                                   1670 ; genCmpEQorNE
      0085FA 11 01            [ 1] 1671 	cp	a, (0x01, sp)
      0085FC 26 03            [ 1] 1672 	jrne	00127$
      0085FE CC 86 04         [ 2] 1673 	jp	00128$
      008601                       1674 00127$:
      008601 CC 86 09         [ 2] 1675 	jp	00103$
      008604                       1676 00128$:
                                   1677 ; skipping generated iCode
                           0004F7  1678 	C$main.c$420$1_0$391 ==.
                                   1679 ;	../src/main.c: 420: return true;
                                   1680 ; genReturn
      008604 A6 01            [ 1] 1681 	ld	a, #0x01
      008606 CC 86 0A         [ 2] 1682 	jp	00107$
                                   1683 ; genLabel
      008609                       1684 00103$:
                           0004FC  1685 	C$main.c$422$1_0$391 ==.
                                   1686 ;	../src/main.c: 422: return false;	
                                   1687 ; genReturn
      008609 4F               [ 1] 1688 	clr	a
                                   1689 ; genLabel
      00860A                       1690 00107$:
                           0004FD  1691 	C$main.c$423$1_0$391 ==.
                                   1692 ;	../src/main.c: 423: }
                                   1693 ; genEndFunction
      00860A 5B 01            [ 2] 1694 	addw	sp, #1
                           0004FF  1695 	C$main.c$423$1_0$391 ==.
                           0004FF  1696 	XFmain$IsValidCfgBuf$0$0 ==.
      00860C 81               [ 4] 1697 	ret
                           000500  1698 	Fmain$clkInit$0$0 ==.
                           000500  1699 	C$main.c$432$1_0$395 ==.
                                   1700 ;	../src/main.c: 432: static void clkInit( void )
                                   1701 ; genLabel
                                   1702 ;	-----------------------------------------
                                   1703 ;	 function clkInit
                                   1704 ;	-----------------------------------------
                                   1705 ;	Register assignment is optimal.
                                   1706 ;	Stack space usage: 0 bytes.
      00860D                       1707 _clkInit:
                           000500  1708 	C$main.c$435$1_0$395 ==.
                                   1709 ;	../src/main.c: 435: CLK->CKDIVR = 0;//(CLK_PRESCALER_HSIDIV1|CLK_PRESCALER_CPUDIV1);
                                   1710 ; genPointerSet
      00860D 35 00 50 C6      [ 1] 1711 	mov	0x50c6+0, #0x00
                           000504  1712 	C$main.c$443$1_0$395 ==.
                                   1713 ;	../src/main.c: 443: CLK->PCKENR1 |= (CLK_PCKENR1_TIM4|CLK_PCKENR1_SPI|CLK_PCKENR1_UART1);
                                   1714 ; genPointerGet
      008611 C6 50 C7         [ 1] 1715 	ld	a, 0x50c7
                                   1716 ; genOr
      008614 AA 16            [ 1] 1717 	or	a, #0x16
                                   1718 ; genPointerSet
      008616 C7 50 C7         [ 1] 1719 	ld	0x50c7, a
                           00050C  1720 	C$main.c$444$1_0$395 ==.
                                   1721 ;	../src/main.c: 444: CLK->PCKENR2 |= (CLK_PCKENR2_ADC);
                                   1722 ; genPointerGet
      008619 C6 50 CA         [ 1] 1723 	ld	a, 0x50ca
                                   1724 ; genOr
      00861C AA 08            [ 1] 1725 	or	a, #0x08
                                   1726 ; genPointerSet
      00861E C7 50 CA         [ 1] 1727 	ld	0x50ca, a
                                   1728 ; genLabel
      008621                       1729 00101$:
                           000514  1730 	C$main.c$445$1_0$395 ==.
                                   1731 ;	../src/main.c: 445: }
                                   1732 ; genEndFunction
                           000514  1733 	C$main.c$445$1_0$395 ==.
                           000514  1734 	XFmain$clkInit$0$0 ==.
      008621 81               [ 4] 1735 	ret
                           000515  1736 	G$assert_failed$0$0 ==.
                           000515  1737 	C$main.c$460$1_0$397 ==.
                                   1738 ;	../src/main.c: 460: void assert_failed(uint8_t* file, uint32_t line)
                                   1739 ; genLabel
                                   1740 ;	-----------------------------------------
                                   1741 ;	 function assert_failed
                                   1742 ;	-----------------------------------------
                                   1743 ;	Register assignment is optimal.
                                   1744 ;	Stack space usage: 0 bytes.
      008622                       1745 _assert_failed:
                           000515  1746 	C$main.c$466$1_0$397 ==.
                                   1747 ;	../src/main.c: 466: while (1)
                                   1748 ; genLabel
      008622                       1749 00102$:
                                   1750 ; genGoto
      008622 CC 86 22         [ 2] 1751 	jp	00102$
                                   1752 ; genLabel
      008625                       1753 00104$:
                           000518  1754 	C$main.c$469$1_0$397 ==.
                                   1755 ;	../src/main.c: 469: }
                                   1756 ; genEndFunction
                           000518  1757 	C$main.c$469$1_0$397 ==.
                           000518  1758 	XG$assert_failed$0$0 ==.
      008625 81               [ 4] 1759 	ret
                                   1760 	.area CODE
                                   1761 	.area CONST
                           000000  1762 Fmain$__str_0$0_0$0 == .
                                   1763 	.area CONST
      0080A2                       1764 ___str_0:
      0080A2 43 46 47              1765 	.ascii "CFG"
      0080A5 00                    1766 	.db 0x00
                                   1767 	.area CODE
                                   1768 	.area INITIALIZER
                           000000  1769 Fmain$__xinit_blkCnt$0_0$0 == .
      008106                       1770 __xinit__blkCnt:
      008106 00                    1771 	.db #0x00	; 0
                           000001  1772 Fmain$__xinit_fileBlkCnt$0_0$0 == .
      008107                       1773 __xinit__fileBlkCnt:
      008107 00 00 00 00           1774 	.byte #0x00, #0x00, #0x00, #0x00	; 0
                           000005  1775 Fmain$__xinit_fileNoCnt$0_0$0 == .
      00810B                       1776 __xinit__fileNoCnt:
      00810B 00 00                 1777 	.dw #0x0000
                                   1778 	.area CABS (ABS)
