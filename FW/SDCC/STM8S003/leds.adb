M:leds
F:G$LedsInit$0_0$0({2}DF,SV:S),Z,0,0,0,0,0
F:Fleds$GpioInit$0_0$0({2}DF,SV:S),Z,0,0,0,0,0
S:Lleds.GpioInit$idx$1_0$321({1}SC:U),R,0,0,[]
F:G$UpdateLedState$0_0$0({2}DF,SV:S),Z,0,0,0,0,0
F:G$UpdateLedState$0_0$0({2}DF,SV:S),Z,0,0,0,0,0
F:G$SetLedRaw$0_0$0({2}DF,SV:S),Z,0,-1,0,0,0
S:Lleds.SetLedRaw$ledId$1_0$326({1}SC:U),B,1,2
S:Lleds.SetLedRaw$state$1_0$326({1}SC:U),B,1,3
S:Lleds.SetLedRaw$gpioPortPos$1_1$328({2}DG,STGPIO_struct:S),B,1,-13
S:Lleds.SetLedRaw$gpioPortNeg$1_1$328({2}DG,STGPIO_struct:S),B,1,-11
S:Lleds.SetLedRaw$gpioPinPos$1_1$328({1}SC:U),B,1,-1
S:Lleds.SetLedRaw$gpioPinNeg$1_1$328({1}SC:U),B,1,-14
S:Lleds.SetLedRaw$sloc0$0_1$0({2}DG,STGPIO_struct:S),B,1,-13
S:Lleds.SetLedRaw$sloc1$0_1$0({2}DG,STGPIO_struct:S),B,1,-11
S:Lleds.SetLedRaw$sloc2$0_1$0({1}SC:U),B,1,-1
S:Lleds.SetLedRaw$sloc3$0_1$0({1}SC:U),B,1,-14
S:Lleds.SetLedRaw$sloc4$0_1$0({1}SC:U),B,1,-9
S:Lleds.SetLedRaw$sloc5$0_1$0({1}SC:U),B,1,-8
S:Lleds.SetLedRaw$sloc6$0_1$0({2}DG,SC:U),B,1,-7
S:Lleds.SetLedRaw$sloc7$0_1$0({2}DG,SC:U),B,1,-5
S:Lleds.SetLedRaw$sloc8$0_1$0({2}DG,SC:U),B,1,-3
S:Lleds.SetLedRaw$sloc9$0_1$0({1}SC:U),B,1,-1
F:G$GetLedState$0_0$0({2}DF,SC:U),Z,0,0,0,0,0
S:Lleds.GetLedState$ledID$1_0$331({1}SC:U),B,1,2
S:Lleds.GetLedState$v$1_0$332({2}SI:U),R,0,0,[]
F:G$SetLedState$0_0$0({2}DF,SV:S),Z,0,0,0,0,0
S:Lleds.SetLedState$ledID$1_0$333({1}SC:U),B,1,2
S:Lleds.SetLedState$state$1_0$333({1}SC:U),B,1,3
S:Lleds.SetLedState$v$1_0$334({2}SI:U),R,0,0,[xl,xh]
T:Fleds$TIM1_struct[({0}S:S$CR1$0_0$0({1}SC:U),Z,0,0)({1}S:S$CR2$0_0$0({1}SC:U),Z,0,0)({2}S:S$SMCR$0_0$0({1}SC:U),Z,0,0)({3}S:S$ETR$0_0$0({1}SC:U),Z,0,0)({4}S:S$IER$0_0$0({1}SC:U),Z,0,0)({5}S:S$SR1$0_0$0({1}SC:U),Z,0,0)({6}S:S$SR2$0_0$0({1}SC:U),Z,0,0)({7}S:S$EGR$0_0$0({1}SC:U),Z,0,0)({8}S:S$CCMR1$0_0$0({1}SC:U),Z,0,0)({9}S:S$CCMR2$0_0$0({1}SC:U),Z,0,0)({10}S:S$CCMR3$0_0$0({1}SC:U),Z,0,0)({11}S:S$CCMR4$0_0$0({1}SC:U),Z,0,0)({12}S:S$CCER1$0_0$0({1}SC:U),Z,0,0)({13}S:S$CCER2$0_0$0({1}SC:U),Z,0,0)({14}S:S$CNTRH$0_0$0({1}SC:U),Z,0,0)({15}S:S$CNTRL$0_0$0({1}SC:U),Z,0,0)({16}S:S$PSCRH$0_0$0({1}SC:U),Z,0,0)({17}S:S$PSCRL$0_0$0({1}SC:U),Z,0,0)({18}S:S$ARRH$0_0$0({1}SC:U),Z,0,0)({19}S:S$ARRL$0_0$0({1}SC:U),Z,0,0)({20}S:S$RCR$0_0$0({1}SC:U),Z,0,0)({21}S:S$CCR1H$0_0$0({1}SC:U),Z,0,0)({22}S:S$CCR1L$0_0$0({1}SC:U),Z,0,0)({23}S:S$CCR2H$0_0$0({1}SC:U),Z,0,0)({24}S:S$CCR2L$0_0$0({1}SC:U),Z,0,0)({25}S:S$CCR3H$0_0$0({1}SC:U),Z,0,0)({26}S:S$CCR3L$0_0$0({1}SC:U),Z,0,0)({27}S:S$CCR4H$0_0$0({1}SC:U),Z,0,0)({28}S:S$CCR4L$0_0$0({1}SC:U),Z,0,0)({29}S:S$BKR$0_0$0({1}SC:U),Z,0,0)({30}S:S$DTR$0_0$0({1}SC:U),Z,0,0)({31}S:S$OISR$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$TIM2_struct[({0}S:S$CR1$0_0$0({1}SC:U),Z,0,0)({1}S:S$RESERVED1$0_0$0({1}SC:U),Z,0,0)({2}S:S$RESERVED2$0_0$0({1}SC:U),Z,0,0)({3}S:S$IER$0_0$0({1}SC:U),Z,0,0)({4}S:S$SR1$0_0$0({1}SC:U),Z,0,0)({5}S:S$SR2$0_0$0({1}SC:U),Z,0,0)({6}S:S$EGR$0_0$0({1}SC:U),Z,0,0)({7}S:S$CCMR1$0_0$0({1}SC:U),Z,0,0)({8}S:S$CCMR2$0_0$0({1}SC:U),Z,0,0)({9}S:S$CCMR3$0_0$0({1}SC:U),Z,0,0)({10}S:S$CCER1$0_0$0({1}SC:U),Z,0,0)({11}S:S$CCER2$0_0$0({1}SC:U),Z,0,0)({12}S:S$CNTRH$0_0$0({1}SC:U),Z,0,0)({13}S:S$CNTRL$0_0$0({1}SC:U),Z,0,0)({14}S:S$PSCR$0_0$0({1}SC:U),Z,0,0)({15}S:S$ARRH$0_0$0({1}SC:U),Z,0,0)({16}S:S$ARRL$0_0$0({1}SC:U),Z,0,0)({17}S:S$CCR1H$0_0$0({1}SC:U),Z,0,0)({18}S:S$CCR1L$0_0$0({1}SC:U),Z,0,0)({19}S:S$CCR2H$0_0$0({1}SC:U),Z,0,0)({20}S:S$CCR2L$0_0$0({1}SC:U),Z,0,0)({21}S:S$CCR3H$0_0$0({1}SC:U),Z,0,0)({22}S:S$CCR3L$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$BEEP_struct[({0}S:S$CSR$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$TIM3_struct[({0}S:S$CR1$0_0$0({1}SC:U),Z,0,0)({1}S:S$IER$0_0$0({1}SC:U),Z,0,0)({2}S:S$SR1$0_0$0({1}SC:U),Z,0,0)({3}S:S$SR2$0_0$0({1}SC:U),Z,0,0)({4}S:S$EGR$0_0$0({1}SC:U),Z,0,0)({5}S:S$CCMR1$0_0$0({1}SC:U),Z,0,0)({6}S:S$CCMR2$0_0$0({1}SC:U),Z,0,0)({7}S:S$CCER1$0_0$0({1}SC:U),Z,0,0)({8}S:S$CNTRH$0_0$0({1}SC:U),Z,0,0)({9}S:S$CNTRL$0_0$0({1}SC:U),Z,0,0)({10}S:S$PSCR$0_0$0({1}SC:U),Z,0,0)({11}S:S$ARRH$0_0$0({1}SC:U),Z,0,0)({12}S:S$ARRL$0_0$0({1}SC:U),Z,0,0)({13}S:S$CCR1H$0_0$0({1}SC:U),Z,0,0)({14}S:S$CCR1L$0_0$0({1}SC:U),Z,0,0)({15}S:S$CCR2H$0_0$0({1}SC:U),Z,0,0)({16}S:S$CCR2L$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$TIM4_struct[({0}S:S$CR1$0_0$0({1}SC:U),Z,0,0)({1}S:S$RESERVED1$0_0$0({1}SC:U),Z,0,0)({2}S:S$RESERVED2$0_0$0({1}SC:U),Z,0,0)({3}S:S$IER$0_0$0({1}SC:U),Z,0,0)({4}S:S$SR1$0_0$0({1}SC:U),Z,0,0)({5}S:S$EGR$0_0$0({1}SC:U),Z,0,0)({6}S:S$CNTR$0_0$0({1}SC:U),Z,0,0)({7}S:S$PSCR$0_0$0({1}SC:U),Z,0,0)({8}S:S$ARR$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$TIM5_struct[({0}S:S$CR1$0_0$0({1}SC:U),Z,0,0)({1}S:S$CR2$0_0$0({1}SC:U),Z,0,0)({2}S:S$SMCR$0_0$0({1}SC:U),Z,0,0)({3}S:S$IER$0_0$0({1}SC:U),Z,0,0)({4}S:S$SR1$0_0$0({1}SC:U),Z,0,0)({5}S:S$SR2$0_0$0({1}SC:U),Z,0,0)({6}S:S$EGR$0_0$0({1}SC:U),Z,0,0)({7}S:S$CCMR1$0_0$0({1}SC:U),Z,0,0)({8}S:S$CCMR2$0_0$0({1}SC:U),Z,0,0)({9}S:S$CCMR3$0_0$0({1}SC:U),Z,0,0)({10}S:S$CCER1$0_0$0({1}SC:U),Z,0,0)({11}S:S$CCER2$0_0$0({1}SC:U),Z,0,0)({12}S:S$CNTRH$0_0$0({1}SC:U),Z,0,0)({13}S:S$CNTRL$0_0$0({1}SC:U),Z,0,0)({14}S:S$PSCR$0_0$0({1}SC:U),Z,0,0)({15}S:S$ARRH$0_0$0({1}SC:U),Z,0,0)({16}S:S$ARRL$0_0$0({1}SC:U),Z,0,0)({17}S:S$CCR1H$0_0$0({1}SC:U),Z,0,0)({18}S:S$CCR1L$0_0$0({1}SC:U),Z,0,0)({19}S:S$CCR2H$0_0$0({1}SC:U),Z,0,0)({20}S:S$CCR2L$0_0$0({1}SC:U),Z,0,0)({21}S:S$CCR3H$0_0$0({1}SC:U),Z,0,0)({22}S:S$CCR3L$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$TIM6_struct[({0}S:S$CR1$0_0$0({1}SC:U),Z,0,0)({1}S:S$CR2$0_0$0({1}SC:U),Z,0,0)({2}S:S$SMCR$0_0$0({1}SC:U),Z,0,0)({3}S:S$IER$0_0$0({1}SC:U),Z,0,0)({4}S:S$SR1$0_0$0({1}SC:U),Z,0,0)({5}S:S$EGR$0_0$0({1}SC:U),Z,0,0)({6}S:S$CNTR$0_0$0({1}SC:U),Z,0,0)({7}S:S$PSCR$0_0$0({1}SC:U),Z,0,0)({8}S:S$ARR$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$IWDG_struct[({0}S:S$KR$0_0$0({1}SC:U),Z,0,0)({1}S:S$PR$0_0$0({1}SC:U),Z,0,0)({2}S:S$RLR$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$GPIO_struct[({0}S:S$ODR$0_0$0({1}SC:U),Z,0,0)({1}S:S$IDR$0_0$0({1}SC:U),Z,0,0)({2}S:S$DDR$0_0$0({1}SC:U),Z,0,0)({3}S:S$CR1$0_0$0({1}SC:U),Z,0,0)({4}S:S$CR2$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$WWDG_struct[({0}S:S$CR$0_0$0({1}SC:U),Z,0,0)({1}S:S$WR$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$__00000000[({0}S:S$MCR$0_0$0({1}SC:U),Z,0,0)({1}S:S$MSR$0_0$0({1}SC:U),Z,0,0)({2}S:S$TSR$0_0$0({1}SC:U),Z,0,0)({3}S:S$TPR$0_0$0({1}SC:U),Z,0,0)({4}S:S$RFR$0_0$0({1}SC:U),Z,0,0)({5}S:S$IER$0_0$0({1}SC:U),Z,0,0)({6}S:S$DGR$0_0$0({1}SC:U),Z,0,0)({7}S:S$PSR$0_0$0({1}SC:U),Z,0,0)({8}S:S$Page$0_0$0({16}ST__00000001:S),Z,0,0)]
T:Fleds$EXTI_struct[({0}S:S$CR1$0_0$0({1}SC:U),Z,0,0)({1}S:S$CR2$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$__00000001[({0}S:S$TxMailbox$0_0$0({16}ST__00000002:S),Z,0,0)({0}S:S$Filter$0_0$0({16}ST__00000003:S),Z,0,0)({0}S:S$Filter01$0_0$0({16}ST__00000004:S),Z,0,0)({0}S:S$Filter23$0_0$0({16}ST__00000005:S),Z,0,0)({0}S:S$Filter45$0_0$0({16}ST__00000006:S),Z,0,0)({0}S:S$Config$0_0$0({16}ST__00000007:S),Z,0,0)({0}S:S$RxFIFO$0_0$0({16}ST__00000008:S),Z,0,0)]
T:Fleds$__00000002[({0}S:S$MCSR$0_0$0({1}SC:U),Z,0,0)({1}S:S$MDLCR$0_0$0({1}SC:U),Z,0,0)({2}S:S$MIDR1$0_0$0({1}SC:U),Z,0,0)({3}S:S$MIDR2$0_0$0({1}SC:U),Z,0,0)({4}S:S$MIDR3$0_0$0({1}SC:U),Z,0,0)({5}S:S$MIDR4$0_0$0({1}SC:U),Z,0,0)({6}S:S$MDAR1$0_0$0({1}SC:U),Z,0,0)({7}S:S$MDAR2$0_0$0({1}SC:U),Z,0,0)({8}S:S$MDAR3$0_0$0({1}SC:U),Z,0,0)({9}S:S$MDAR4$0_0$0({1}SC:U),Z,0,0)({10}S:S$MDAR5$0_0$0({1}SC:U),Z,0,0)({11}S:S$MDAR6$0_0$0({1}SC:U),Z,0,0)({12}S:S$MDAR7$0_0$0({1}SC:U),Z,0,0)({13}S:S$MDAR8$0_0$0({1}SC:U),Z,0,0)({14}S:S$MTSRL$0_0$0({1}SC:U),Z,0,0)({15}S:S$MTSRH$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$__00000003[({0}S:S$FR01$0_0$0({1}SC:U),Z,0,0)({1}S:S$FR02$0_0$0({1}SC:U),Z,0,0)({2}S:S$FR03$0_0$0({1}SC:U),Z,0,0)({3}S:S$FR04$0_0$0({1}SC:U),Z,0,0)({4}S:S$FR05$0_0$0({1}SC:U),Z,0,0)({5}S:S$FR06$0_0$0({1}SC:U),Z,0,0)({6}S:S$FR07$0_0$0({1}SC:U),Z,0,0)({7}S:S$FR08$0_0$0({1}SC:U),Z,0,0)({8}S:S$FR09$0_0$0({1}SC:U),Z,0,0)({9}S:S$FR10$0_0$0({1}SC:U),Z,0,0)({10}S:S$FR11$0_0$0({1}SC:U),Z,0,0)({11}S:S$FR12$0_0$0({1}SC:U),Z,0,0)({12}S:S$FR13$0_0$0({1}SC:U),Z,0,0)({13}S:S$FR14$0_0$0({1}SC:U),Z,0,0)({14}S:S$FR15$0_0$0({1}SC:U),Z,0,0)({15}S:S$FR16$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$__00000004[({0}S:S$F0R1$0_0$0({1}SC:U),Z,0,0)({1}S:S$F0R2$0_0$0({1}SC:U),Z,0,0)({2}S:S$F0R3$0_0$0({1}SC:U),Z,0,0)({3}S:S$F0R4$0_0$0({1}SC:U),Z,0,0)({4}S:S$F0R5$0_0$0({1}SC:U),Z,0,0)({5}S:S$F0R6$0_0$0({1}SC:U),Z,0,0)({6}S:S$F0R7$0_0$0({1}SC:U),Z,0,0)({7}S:S$F0R8$0_0$0({1}SC:U),Z,0,0)({8}S:S$F1R1$0_0$0({1}SC:U),Z,0,0)({9}S:S$F1R2$0_0$0({1}SC:U),Z,0,0)({10}S:S$F1R3$0_0$0({1}SC:U),Z,0,0)({11}S:S$F1R4$0_0$0({1}SC:U),Z,0,0)({12}S:S$F1R5$0_0$0({1}SC:U),Z,0,0)({13}S:S$F1R6$0_0$0({1}SC:U),Z,0,0)({14}S:S$F1R7$0_0$0({1}SC:U),Z,0,0)({15}S:S$F1R8$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$__00000005[({0}S:S$F2R1$0_0$0({1}SC:U),Z,0,0)({1}S:S$F2R2$0_0$0({1}SC:U),Z,0,0)({2}S:S$F2R3$0_0$0({1}SC:U),Z,0,0)({3}S:S$F2R4$0_0$0({1}SC:U),Z,0,0)({4}S:S$F2R5$0_0$0({1}SC:U),Z,0,0)({5}S:S$F2R6$0_0$0({1}SC:U),Z,0,0)({6}S:S$F2R7$0_0$0({1}SC:U),Z,0,0)({7}S:S$F2R8$0_0$0({1}SC:U),Z,0,0)({8}S:S$F3R1$0_0$0({1}SC:U),Z,0,0)({9}S:S$F3R2$0_0$0({1}SC:U),Z,0,0)({10}S:S$F3R3$0_0$0({1}SC:U),Z,0,0)({11}S:S$F3R4$0_0$0({1}SC:U),Z,0,0)({12}S:S$F3R5$0_0$0({1}SC:U),Z,0,0)({13}S:S$F3R6$0_0$0({1}SC:U),Z,0,0)({14}S:S$F3R7$0_0$0({1}SC:U),Z,0,0)({15}S:S$F3R8$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$__00000006[({0}S:S$F4R1$0_0$0({1}SC:U),Z,0,0)({1}S:S$F4R2$0_0$0({1}SC:U),Z,0,0)({2}S:S$F4R3$0_0$0({1}SC:U),Z,0,0)({3}S:S$F4R4$0_0$0({1}SC:U),Z,0,0)({4}S:S$F4R5$0_0$0({1}SC:U),Z,0,0)({5}S:S$F4R6$0_0$0({1}SC:U),Z,0,0)({6}S:S$F4R7$0_0$0({1}SC:U),Z,0,0)({7}S:S$F4R8$0_0$0({1}SC:U),Z,0,0)({8}S:S$F5R1$0_0$0({1}SC:U),Z,0,0)({9}S:S$F5R2$0_0$0({1}SC:U),Z,0,0)({10}S:S$F5R3$0_0$0({1}SC:U),Z,0,0)({11}S:S$F5R4$0_0$0({1}SC:U),Z,0,0)({12}S:S$F5R5$0_0$0({1}SC:U),Z,0,0)({13}S:S$F5R6$0_0$0({1}SC:U),Z,0,0)({14}S:S$F5R7$0_0$0({1}SC:U),Z,0,0)({15}S:S$F5R8$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$__00000007[({0}S:S$ESR$0_0$0({1}SC:U),Z,0,0)({1}S:S$EIER$0_0$0({1}SC:U),Z,0,0)({2}S:S$TECR$0_0$0({1}SC:U),Z,0,0)({3}S:S$RECR$0_0$0({1}SC:U),Z,0,0)({4}S:S$BTR1$0_0$0({1}SC:U),Z,0,0)({5}S:S$BTR2$0_0$0({1}SC:U),Z,0,0)({6}S:S$Reserved1$0_0$0({2}DA2d,SC:U),Z,0,0)({8}S:S$FMR1$0_0$0({1}SC:U),Z,0,0)({9}S:S$FMR2$0_0$0({1}SC:U),Z,0,0)({10}S:S$FCR1$0_0$0({1}SC:U),Z,0,0)({11}S:S$FCR2$0_0$0({1}SC:U),Z,0,0)({12}S:S$FCR3$0_0$0({1}SC:U),Z,0,0)({13}S:S$Reserved2$0_0$0({3}DA3d,SC:U),Z,0,0)]
T:Fleds$__00000008[({0}S:S$MFMI$0_0$0({1}SC:U),Z,0,0)({1}S:S$MDLCR$0_0$0({1}SC:U),Z,0,0)({2}S:S$MIDR1$0_0$0({1}SC:U),Z,0,0)({3}S:S$MIDR2$0_0$0({1}SC:U),Z,0,0)({4}S:S$MIDR3$0_0$0({1}SC:U),Z,0,0)({5}S:S$MIDR4$0_0$0({1}SC:U),Z,0,0)({6}S:S$MDAR1$0_0$0({1}SC:U),Z,0,0)({7}S:S$MDAR2$0_0$0({1}SC:U),Z,0,0)({8}S:S$MDAR3$0_0$0({1}SC:U),Z,0,0)({9}S:S$MDAR4$0_0$0({1}SC:U),Z,0,0)({10}S:S$MDAR5$0_0$0({1}SC:U),Z,0,0)({11}S:S$MDAR6$0_0$0({1}SC:U),Z,0,0)({12}S:S$MDAR7$0_0$0({1}SC:U),Z,0,0)({13}S:S$MDAR8$0_0$0({1}SC:U),Z,0,0)({14}S:S$MTSRL$0_0$0({1}SC:U),Z,0,0)({15}S:S$MTSRH$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$UART1_struct[({0}S:S$SR$0_0$0({1}SC:U),Z,0,0)({1}S:S$DR$0_0$0({1}SC:U),Z,0,0)({2}S:S$BRR1$0_0$0({1}SC:U),Z,0,0)({3}S:S$BRR2$0_0$0({1}SC:U),Z,0,0)({4}S:S$CR1$0_0$0({1}SC:U),Z,0,0)({5}S:S$CR2$0_0$0({1}SC:U),Z,0,0)({6}S:S$CR3$0_0$0({1}SC:U),Z,0,0)({7}S:S$CR4$0_0$0({1}SC:U),Z,0,0)({8}S:S$CR5$0_0$0({1}SC:U),Z,0,0)({9}S:S$GTR$0_0$0({1}SC:U),Z,0,0)({10}S:S$PSCR$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$UART2_struct[({0}S:S$SR$0_0$0({1}SC:U),Z,0,0)({1}S:S$DR$0_0$0({1}SC:U),Z,0,0)({2}S:S$BRR1$0_0$0({1}SC:U),Z,0,0)({3}S:S$BRR2$0_0$0({1}SC:U),Z,0,0)({4}S:S$CR1$0_0$0({1}SC:U),Z,0,0)({5}S:S$CR2$0_0$0({1}SC:U),Z,0,0)({6}S:S$CR3$0_0$0({1}SC:U),Z,0,0)({7}S:S$CR4$0_0$0({1}SC:U),Z,0,0)({8}S:S$CR5$0_0$0({1}SC:U),Z,0,0)({9}S:S$CR6$0_0$0({1}SC:U),Z,0,0)({10}S:S$GTR$0_0$0({1}SC:U),Z,0,0)({11}S:S$PSCR$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$FLASH_struct[({0}S:S$CR1$0_0$0({1}SC:U),Z,0,0)({1}S:S$CR2$0_0$0({1}SC:U),Z,0,0)({2}S:S$NCR2$0_0$0({1}SC:U),Z,0,0)({3}S:S$FPR$0_0$0({1}SC:U),Z,0,0)({4}S:S$NFPR$0_0$0({1}SC:U),Z,0,0)({5}S:S$IAPSR$0_0$0({1}SC:U),Z,0,0)({6}S:S$RESERVED1$0_0$0({1}SC:U),Z,0,0)({7}S:S$RESERVED2$0_0$0({1}SC:U),Z,0,0)({8}S:S$PUKR$0_0$0({1}SC:U),Z,0,0)({9}S:S$RESERVED3$0_0$0({1}SC:U),Z,0,0)({10}S:S$DUKR$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$UART3_struct[({0}S:S$SR$0_0$0({1}SC:U),Z,0,0)({1}S:S$DR$0_0$0({1}SC:U),Z,0,0)({2}S:S$BRR1$0_0$0({1}SC:U),Z,0,0)({3}S:S$BRR2$0_0$0({1}SC:U),Z,0,0)({4}S:S$CR1$0_0$0({1}SC:U),Z,0,0)({5}S:S$CR2$0_0$0({1}SC:U),Z,0,0)({6}S:S$CR3$0_0$0({1}SC:U),Z,0,0)({7}S:S$CR4$0_0$0({1}SC:U),Z,0,0)({8}S:S$RESERVED$0_0$0({1}SC:U),Z,0,0)({9}S:S$CR6$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$I2C_struct[({0}S:S$CR1$0_0$0({1}SC:U),Z,0,0)({1}S:S$CR2$0_0$0({1}SC:U),Z,0,0)({2}S:S$FREQR$0_0$0({1}SC:U),Z,0,0)({3}S:S$OARL$0_0$0({1}SC:U),Z,0,0)({4}S:S$OARH$0_0$0({1}SC:U),Z,0,0)({5}S:S$RESERVED1$0_0$0({1}SC:U),Z,0,0)({6}S:S$DR$0_0$0({1}SC:U),Z,0,0)({7}S:S$SR1$0_0$0({1}SC:U),Z,0,0)({8}S:S$SR2$0_0$0({1}SC:U),Z,0,0)({9}S:S$SR3$0_0$0({1}SC:U),Z,0,0)({10}S:S$ITR$0_0$0({1}SC:U),Z,0,0)({11}S:S$CCRL$0_0$0({1}SC:U),Z,0,0)({12}S:S$CCRH$0_0$0({1}SC:U),Z,0,0)({13}S:S$TRISER$0_0$0({1}SC:U),Z,0,0)({14}S:S$RESERVED2$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$CFG_struct[({0}S:S$GCR$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$CLK_struct[({0}S:S$ICKR$0_0$0({1}SC:U),Z,0,0)({1}S:S$ECKR$0_0$0({1}SC:U),Z,0,0)({2}S:S$RESERVED$0_0$0({1}SC:U),Z,0,0)({3}S:S$CMSR$0_0$0({1}SC:U),Z,0,0)({4}S:S$SWR$0_0$0({1}SC:U),Z,0,0)({5}S:S$SWCR$0_0$0({1}SC:U),Z,0,0)({6}S:S$CKDIVR$0_0$0({1}SC:U),Z,0,0)({7}S:S$PCKENR1$0_0$0({1}SC:U),Z,0,0)({8}S:S$CSSR$0_0$0({1}SC:U),Z,0,0)({9}S:S$CCOR$0_0$0({1}SC:U),Z,0,0)({10}S:S$PCKENR2$0_0$0({1}SC:U),Z,0,0)({11}S:S$RESERVED1$0_0$0({1}SC:U),Z,0,0)({12}S:S$HSITRIMR$0_0$0({1}SC:U),Z,0,0)({13}S:S$SWIMCCR$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$ITC_struct[({0}S:S$ISPR1$0_0$0({1}SC:U),Z,0,0)({1}S:S$ISPR2$0_0$0({1}SC:U),Z,0,0)({2}S:S$ISPR3$0_0$0({1}SC:U),Z,0,0)({3}S:S$ISPR4$0_0$0({1}SC:U),Z,0,0)({4}S:S$ISPR5$0_0$0({1}SC:U),Z,0,0)({5}S:S$ISPR6$0_0$0({1}SC:U),Z,0,0)({6}S:S$ISPR7$0_0$0({1}SC:U),Z,0,0)({7}S:S$ISPR8$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$SPI_struct[({0}S:S$CR1$0_0$0({1}SC:U),Z,0,0)({1}S:S$CR2$0_0$0({1}SC:U),Z,0,0)({2}S:S$ICR$0_0$0({1}SC:U),Z,0,0)({3}S:S$SR$0_0$0({1}SC:U),Z,0,0)({4}S:S$DR$0_0$0({1}SC:U),Z,0,0)({5}S:S$CRCPR$0_0$0({1}SC:U),Z,0,0)({6}S:S$RXCRCR$0_0$0({1}SC:U),Z,0,0)({7}S:S$TXCRCR$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$AWU_struct[({0}S:S$CSR$0_0$0({1}SC:U),Z,0,0)({1}S:S$APR$0_0$0({1}SC:U),Z,0,0)({2}S:S$TBR$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$OPT_struct[({0}S:S$OPT0$0_0$0({1}SC:U),Z,0,0)({1}S:S$OPT1$0_0$0({1}SC:U),Z,0,0)({2}S:S$NOPT1$0_0$0({1}SC:U),Z,0,0)({3}S:S$OPT2$0_0$0({1}SC:U),Z,0,0)({4}S:S$NOPT2$0_0$0({1}SC:U),Z,0,0)({5}S:S$OPT3$0_0$0({1}SC:U),Z,0,0)({6}S:S$NOPT3$0_0$0({1}SC:U),Z,0,0)({7}S:S$OPT4$0_0$0({1}SC:U),Z,0,0)({8}S:S$NOPT4$0_0$0({1}SC:U),Z,0,0)({9}S:S$OPT5$0_0$0({1}SC:U),Z,0,0)({10}S:S$NOPT5$0_0$0({1}SC:U),Z,0,0)({11}S:S$RESERVED1$0_0$0({1}SC:U),Z,0,0)({12}S:S$RESERVED2$0_0$0({1}SC:U),Z,0,0)({13}S:S$OPT7$0_0$0({1}SC:U),Z,0,0)({14}S:S$NOPT7$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$RST_struct[({0}S:S$SR$0_0$0({1}SC:U),Z,0,0)]
T:Fleds$ADC1_struct[({0}S:S$DB0RH$0_0$0({1}SC:U),Z,0,0)({1}S:S$DB0RL$0_0$0({1}SC:U),Z,0,0)({2}S:S$DB1RH$0_0$0({1}SC:U),Z,0,0)({3}S:S$DB1RL$0_0$0({1}SC:U),Z,0,0)({4}S:S$DB2RH$0_0$0({1}SC:U),Z,0,0)({5}S:S$DB2RL$0_0$0({1}SC:U),Z,0,0)({6}S:S$DB3RH$0_0$0({1}SC:U),Z,0,0)({7}S:S$DB3RL$0_0$0({1}SC:U),Z,0,0)({8}S:S$DB4RH$0_0$0({1}SC:U),Z,0,0)({9}S:S$DB4RL$0_0$0({1}SC:U),Z,0,0)({10}S:S$DB5RH$0_0$0({1}SC:U),Z,0,0)({11}S:S$DB5RL$0_0$0({1}SC:U),Z,0,0)({12}S:S$DB6RH$0_0$0({1}SC:U),Z,0,0)({13}S:S$DB6RL$0_0$0({1}SC:U),Z,0,0)({14}S:S$DB7RH$0_0$0({1}SC:U),Z,0,0)({15}S:S$DB7RL$0_0$0({1}SC:U),Z,0,0)({16}S:S$DB8RH$0_0$0({1}SC:U),Z,0,0)({17}S:S$DB8RL$0_0$0({1}SC:U),Z,0,0)({18}S:S$DB9RH$0_0$0({1}SC:U),Z,0,0)({19}S:S$DB9RL$0_0$0({1}SC:U),Z,0,0)({20}S:S$RESERVED$0_0$0({12}DA12d,SC:U),Z,0,0)({32}S:S$CSR$0_0$0({1}SC:U),Z,0,0)({33}S:S$CR1$0_0$0({1}SC:U),Z,0,0)({34}S:S$CR2$0_0$0({1}SC:U),Z,0,0)({35}S:S$CR3$0_0$0({1}SC:U),Z,0,0)({36}S:S$DRH$0_0$0({1}SC:U),Z,0,0)({37}S:S$DRL$0_0$0({1}SC:U),Z,0,0)({38}S:S$TDRH$0_0$0({1}SC:U),Z,0,0)({39}S:S$TDRL$0_0$0({1}SC:U),Z,0,0)({40}S:S$HTRH$0_0$0({1}SC:U),Z,0,0)({41}S:S$HTRL$0_0$0({1}SC:U),Z,0,0)({42}S:S$LTRH$0_0$0({1}SC:U),Z,0,0)({43}S:S$LTRL$0_0$0({1}SC:U),Z,0,0)({44}S:S$AWSRH$0_0$0({1}SC:U),Z,0,0)({45}S:S$AWSRL$0_0$0({1}SC:U),Z,0,0)({46}S:S$AWCRH$0_0$0({1}SC:U),Z,0,0)({47}S:S$AWCRL$0_0$0({1}SC:U),Z,0,0)]
S:G$adcBuffer0$0_0$0({0}DA0d,SI:U),E,0,0
S:G$adcBuffer1$0_0$0({0}DA0d,SI:U),E,0,0
S:Fleds$ledsState$0_0$0({2}SI:U),E,0,0
S:Lleds.UpdateLedState$ledId$1_0$325({1}SC:U),E,0,0
S:Lleds.UpdateLedState$ledIdPrev$1_0$325({1}SC:U),E,0,0
S:G$ADC1_DeInit$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_Init$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_Cmd$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_ScanModeCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_DataBufferCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_ITConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_PrescalerConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_SchmittTriggerConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_ConversionConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_ExternalTriggerConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_AWDChannelConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_StartConversion$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_GetConversionValue$0_0$0({2}DF,SI:U),C,0,0
S:G$ADC1_SetHighThreshold$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_SetLowThreshold$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_GetBufferValue$0_0$0({2}DF,SI:U),C,0,0
S:G$ADC1_GetAWDChannelStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$ADC1_GetFlagStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$ADC1_ClearFlag$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_GetITStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$ADC1_ClearITPendingBit$0_0$0({2}DF,SV:S),C,0,0
S:G$AWU_DeInit$0_0$0({2}DF,SV:S),C,0,0
S:G$AWU_Init$0_0$0({2}DF,SV:S),C,0,0
S:G$AWU_Cmd$0_0$0({2}DF,SV:S),C,0,0
S:G$AWU_LSICalibrationConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$AWU_IdleModeEnable$0_0$0({2}DF,SV:S),C,0,0
S:G$AWU_GetFlagStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$BEEP_DeInit$0_0$0({2}DF,SV:S),C,0,0
S:G$BEEP_Init$0_0$0({2}DF,SV:S),C,0,0
S:G$BEEP_Cmd$0_0$0({2}DF,SV:S),C,0,0
S:G$BEEP_LSICalibrationConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_DeInit$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_HSECmd$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_HSICmd$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_LSICmd$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_CCOCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_ClockSwitchCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_FastHaltWakeUpCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_SlowActiveHaltWakeUpCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_PeripheralClockConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_ClockSwitchConfig$0_0$0({2}DF,SC:U),C,0,0
S:G$CLK_HSIPrescalerConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_CCOConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_ITConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_SYSCLKConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_SWIMConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_ClockSecuritySystemEnable$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_SYSCLKEmergencyClear$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_AdjustHSICalibrationValue$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_GetClockFreq$0_0$0({2}DF,SL:U),C,0,0
S:G$CLK_GetSYSCLKSource$0_0$0({2}DF,SC:U),C,0,0
S:G$CLK_GetFlagStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$CLK_GetITStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$CLK_ClearITPendingBit$0_0$0({2}DF,SV:S),C,0,0
S:G$EXTI_DeInit$0_0$0({2}DF,SV:S),C,0,0
S:G$EXTI_SetExtIntSensitivity$0_0$0({2}DF,SV:S),C,0,0
S:G$EXTI_SetTLISensitivity$0_0$0({2}DF,SV:S),C,0,0
S:G$EXTI_GetExtIntSensitivity$0_0$0({2}DF,SC:U),C,0,0
S:G$EXTI_GetTLISensitivity$0_0$0({2}DF,SC:U),C,0,0
S:G$FLASH_Unlock$0_0$0({2}DF,SV:S),C,0,0
S:G$FLASH_Lock$0_0$0({2}DF,SV:S),C,0,0
S:G$FLASH_DeInit$0_0$0({2}DF,SV:S),C,0,0
S:G$FLASH_ITConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$FLASH_EraseByte$0_0$0({2}DF,SV:S),C,0,0
S:G$FLASH_ProgramByte$0_0$0({2}DF,SV:S),C,0,0
S:G$FLASH_ReadByte$0_0$0({2}DF,SC:U),C,0,0
S:G$FLASH_ProgramWord$0_0$0({2}DF,SV:S),C,0,0
S:G$FLASH_ReadOptionByte$0_0$0({2}DF,SI:U),C,0,0
S:G$FLASH_ProgramOptionByte$0_0$0({2}DF,SV:S),C,0,0
S:G$FLASH_EraseOptionByte$0_0$0({2}DF,SV:S),C,0,0
S:G$FLASH_SetLowPowerMode$0_0$0({2}DF,SV:S),C,0,0
S:G$FLASH_SetProgrammingTime$0_0$0({2}DF,SV:S),C,0,0
S:G$FLASH_GetLowPowerMode$0_0$0({2}DF,SC:U),C,0,0
S:G$FLASH_GetProgrammingTime$0_0$0({2}DF,SC:U),C,0,0
S:G$FLASH_GetBootSize$0_0$0({2}DF,SL:U),C,0,0
S:G$FLASH_GetFlagStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$FLASH_EraseBlock$0_0$0({2}DF,SV:S),C,0,0
S:G$FLASH_ProgramBlock$0_0$0({2}DF,SV:S),C,0,0
S:G$FLASH_WaitForLastOperation$0_0$0({2}DF,SC:U),C,0,0
S:G$GPIO_DeInit$0_0$0({2}DF,SV:S),C,0,0
S:G$GPIO_Init$0_0$0({2}DF,SV:S),C,0,0
S:G$GPIO_Write$0_0$0({2}DF,SV:S),C,0,0
S:G$GPIO_WriteHigh$0_0$0({2}DF,SV:S),C,0,0
S:G$GPIO_WriteLow$0_0$0({2}DF,SV:S),C,0,0
S:G$GPIO_WriteReverse$0_0$0({2}DF,SV:S),C,0,0
S:G$GPIO_ReadInputData$0_0$0({2}DF,SC:U),C,0,0
S:G$GPIO_ReadOutputData$0_0$0({2}DF,SC:U),C,0,0
S:G$GPIO_ReadInputPin$0_0$0({2}DF,SC:U),C,0,0
S:G$GPIO_ExternalPullUpConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_DeInit$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_Init$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_Cmd$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_GeneralCallCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_GenerateSTART$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_GenerateSTOP$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_SoftwareResetCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_StretchClockCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_AcknowledgeConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_FastModeDutyCycleConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_ITConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_ReceiveData$0_0$0({2}DF,SC:U),C,0,0
S:G$I2C_Send7bitAddress$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_SendData$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_CheckEvent$0_0$0({2}DF,SC:U),C,0,0
S:G$I2C_GetLastEvent$0_0$0({2}DF,SI:U),C,0,0
S:G$I2C_GetFlagStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$I2C_ClearFlag$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_GetITStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$I2C_ClearITPendingBit$0_0$0({2}DF,SV:S),C,0,0
S:G$ITC_GetCPUCC$0_0$0({2}DF,SC:U),C,0,0
S:G$ITC_DeInit$0_0$0({2}DF,SV:S),C,0,0
S:G$ITC_GetSoftIntStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$ITC_SetSoftwarePriority$0_0$0({2}DF,SV:S),C,0,0
S:G$ITC_GetSoftwarePriority$0_0$0({2}DF,SC:U),C,0,0
S:G$IWDG_WriteAccessCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$IWDG_SetPrescaler$0_0$0({2}DF,SV:S),C,0,0
S:G$IWDG_SetReload$0_0$0({2}DF,SV:S),C,0,0
S:G$IWDG_ReloadCounter$0_0$0({2}DF,SV:S),C,0,0
S:G$IWDG_Enable$0_0$0({2}DF,SV:S),C,0,0
S:G$RST_GetFlagStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$RST_ClearFlag$0_0$0({2}DF,SV:S),C,0,0
S:G$SPI_DeInit$0_0$0({2}DF,SV:S),C,0,0
S:G$SPI_Init$0_0$0({2}DF,SV:S),C,0,0
S:G$SPI_Cmd$0_0$0({2}DF,SV:S),C,0,0
S:G$SPI_ITConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$SPI_SendData$0_0$0({2}DF,SV:S),C,0,0
S:G$SPI_ReceiveData$0_0$0({2}DF,SC:U),C,0,0
S:G$SPI_NSSInternalSoftwareCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$SPI_TransmitCRC$0_0$0({2}DF,SV:S),C,0,0
S:G$SPI_CalculateCRCCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$SPI_GetCRC$0_0$0({2}DF,SC:U),C,0,0
S:G$SPI_ResetCRC$0_0$0({2}DF,SV:S),C,0,0
S:G$SPI_GetCRCPolynomial$0_0$0({2}DF,SC:U),C,0,0
S:G$SPI_BiDirectionalLineConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$SPI_GetFlagStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$SPI_ClearFlag$0_0$0({2}DF,SV:S),C,0,0
S:G$SPI_GetITStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$SPI_ClearITPendingBit$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_DeInit$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_TimeBaseInit$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC1Init$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC2Init$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC3Init$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC4Init$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_BDTRConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_ICInit$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_PWMIConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_Cmd$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_CtrlPWMOutputs$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_ITConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_InternalClockConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_ETRClockMode1Config$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_ETRClockMode2Config$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_ETRConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_TIxExternalClockConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SelectInputTrigger$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_UpdateDisableConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_UpdateRequestConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SelectHallSensor$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SelectOnePulseMode$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SelectOutputTrigger$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SelectSlaveMode$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SelectMasterSlaveMode$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_EncoderInterfaceConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_PrescalerConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_CounterModeConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_ForcedOC1Config$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_ForcedOC2Config$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_ForcedOC3Config$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_ForcedOC4Config$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_ARRPreloadConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SelectCOM$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_CCPreloadControl$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC1PreloadConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC2PreloadConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC3PreloadConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC4PreloadConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC1FastConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC2FastConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC3FastConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC4FastConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_GenerateEvent$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC1PolarityConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC1NPolarityConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC2PolarityConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC2NPolarityConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC3PolarityConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC3NPolarityConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_OC4PolarityConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_CCxCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_CCxNCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SelectOCxM$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SetCounter$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SetAutoreload$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SetCompare1$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SetCompare2$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SetCompare3$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SetCompare4$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SetIC1Prescaler$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SetIC2Prescaler$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SetIC3Prescaler$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_SetIC4Prescaler$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_GetCapture1$0_0$0({2}DF,SI:U),C,0,0
S:G$TIM1_GetCapture2$0_0$0({2}DF,SI:U),C,0,0
S:G$TIM1_GetCapture3$0_0$0({2}DF,SI:U),C,0,0
S:G$TIM1_GetCapture4$0_0$0({2}DF,SI:U),C,0,0
S:G$TIM1_GetCounter$0_0$0({2}DF,SI:U),C,0,0
S:G$TIM1_GetPrescaler$0_0$0({2}DF,SI:U),C,0,0
S:G$TIM1_GetFlagStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$TIM1_ClearFlag$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_GetITStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$TIM1_ClearITPendingBit$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_DeInit$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_TimeBaseInit$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_OC1Init$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_OC2Init$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_OC3Init$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_ICInit$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_PWMIConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_Cmd$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_ITConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_InternalClockConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_UpdateDisableConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_UpdateRequestConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_SelectOnePulseMode$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_PrescalerConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_ForcedOC1Config$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_ForcedOC2Config$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_ForcedOC3Config$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_ARRPreloadConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_CCPreloadControl$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_OC1PreloadConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_OC2PreloadConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_OC3PreloadConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_GenerateEvent$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_OC1PolarityConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_OC2PolarityConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_OC3PolarityConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_CCxCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_SelectOCxM$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_SetCounter$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_SetAutoreload$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_SetCompare1$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_SetCompare2$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_SetCompare3$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_SetIC1Prescaler$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_SetIC2Prescaler$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_SetIC3Prescaler$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_GetCapture1$0_0$0({2}DF,SI:U),C,0,0
S:G$TIM2_GetCapture2$0_0$0({2}DF,SI:U),C,0,0
S:G$TIM2_GetCapture3$0_0$0({2}DF,SI:U),C,0,0
S:G$TIM2_GetCounter$0_0$0({2}DF,SI:U),C,0,0
S:G$TIM2_GetPrescaler$0_0$0({2}DF,SC:U),C,0,0
S:G$TIM2_GetFlagStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$TIM2_ClearFlag$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_GetITStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$TIM2_ClearITPendingBit$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM4_DeInit$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM4_TimeBaseInit$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM4_Cmd$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM4_ITConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM4_UpdateDisableConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM4_UpdateRequestConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM4_SelectOnePulseMode$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM4_PrescalerConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM4_ARRPreloadConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM4_GenerateEvent$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM4_SetCounter$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM4_SetAutoreload$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM4_GetCounter$0_0$0({2}DF,SC:U),C,0,0
S:G$TIM4_GetPrescaler$0_0$0({2}DF,SC:U),C,0,0
S:G$TIM4_GetFlagStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$TIM4_ClearFlag$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM4_GetITStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$TIM4_ClearITPendingBit$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_DeInit$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_Init$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_Cmd$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_ITConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_HalfDuplexCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_IrDAConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_IrDACmd$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_LINBreakDetectionConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_LINCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_SmartCardCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_SmartCardNACKCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_WakeUpConfig$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_ReceiverWakeUpCmd$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_ReceiveData8$0_0$0({2}DF,SC:U),C,0,0
S:G$UART1_ReceiveData9$0_0$0({2}DF,SI:U),C,0,0
S:G$UART1_SendData8$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_SendData9$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_SendBreak$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_SetAddress$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_SetGuardTime$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_SetPrescaler$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_GetFlagStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$UART1_ClearFlag$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_GetITStatus$0_0$0({2}DF,SC:U),C,0,0
S:G$UART1_ClearITPendingBit$0_0$0({2}DF,SV:S),C,0,0
S:G$WWDG_Init$0_0$0({2}DF,SV:S),C,0,0
S:G$WWDG_SetCounter$0_0$0({2}DF,SV:S),C,0,0
S:G$WWDG_GetCounter$0_0$0({2}DF,SC:U),C,0,0
S:G$WWDG_SWReset$0_0$0({2}DF,SV:S),C,0,0
S:G$WWDG_SetWindowValue$0_0$0({2}DF,SV:S),C,0,0
S:G$assert_failed$0_0$0({2}DF,SV:S),C,0,0
S:G$sysTickInit$0_0$0({2}DF,SV:S),C,0,0
S:G$dly$0_0$0({2}DF,SV:S),C,0,0
S:G$systemTickIsr$0_0$0({2}DF,SV:S),C,0,0
S:G$adcInit$0_0$0({2}DF,SV:S),C,0,0
S:G$adcIsr$0_0$0({2}DF,SV:S),C,0,0
S:G$TRAP_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$TLI_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$AWU_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$CLK_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$EXTI_PORTA_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$EXTI_PORTB_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$EXTI_PORTC_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$EXTI_PORTD_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$EXTI_PORTE_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$SPI_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_UPD_OVF_TRG_BRK_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM1_CAP_COM_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_UPD_OVF_BRK_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM2_CAP_COM_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_TX_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$UART1_RX_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$I2C_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$ADC1_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$TIM4_UPD_OVF_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$EEPROM_EEC_IRQHandler$0_0$0({2}DF,SV:S),C,0,0
S:G$leds_anode$0_0$0({48}DA24d,SI:U),D,0,0
S:G$leds_cathode$0_0$0({48}DA24d,SI:U),D,0,0