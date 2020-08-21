/**
  @page STM8-128_EVAL_Demo UM0501 STM8-128-EVAL demonstration firmware Readme file
  
  @verbatim
  ******************** (C) COPYRIGHT 2011 STMicroelectronics *******************
  * @file    STM8-128-EVAL/readme.txt 
  * @author  MCD Application Team
  * @version V1.1.0
  * @date    11-March-2011
  * @brief   Description of the UM0501 "STM8-128-EVAL demonstration firmware".
  ******************************************************************************
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  ******************************************************************************
   @endverbatim

@par Description

This directory contains a set of sources files and pre-configured projects that
describes the demonstration firmware running on the STM8/128-EVAL evaluation 
board, which can be used to evaluate the capabilities of the STM8S High density
STM8S208MB microcontroller and on-board peripherals.

@par Directory contents 

 - "STM8-128-EVAL\inc": contains the STM8-128-EVAL firmware header files 
    - STM8-128-EVAL/inc/buzzer.h              Header for buzzer.c
    - STM8-128-EVAL/inc/demo_about.h          Header for demo_about.c
    - STM8-128-EVAL/inc/demo_adc.h            Header for demo_adc.c
    - STM8-128-EVAL/inc/demo_beeper.h         Header for demo_beeper.c
    - STM8-128-EVAL/inc/demo_games.h          Header for demo_games.c
    - STM8-128-EVAL/inc/demo_help.h           Header for demo_help
    - STM8-128-EVAL/inc/demo_microsd.h        Header for demo_microsd.c  
    - STM8-128-EVAL/inc/demo_pwm.h            Header for demo_pwm.c
    - STM8-128-EVAL/inc/demo_system.h         Header for demo_system.c 
    - STM8-128-EVAL/inc/demo_timer.h          Header for demo_timer.c
    - STM8-128-EVAL/inc/functions.h           Header for functions.c
    - STM8-128-EVAL/inc/joystick_button.h     Header for joystick_button.c
    - STM8-128-EVAL/inc/main.h                Main header file
    - STM8-128-EVAL/inc/menu.h                Header for menu.c
    - STM8-128-EVAL/inc/stm8s_conf.h          Library Configuration file
    - STM8-128-EVAL/inc/stm8s_it.h            Header for stm8s_it.c      
            
 - "STM8-128-EVAL\EWSTM8": contains pre-configured project for EWSTM8 toolchain

 - "STM8-128-EVAL\STVD\Raisonance": contains pre-configured project for STVD toolchain 
                                    with Raisonance compiler

 - "STM8-128-EVAL\STVD\Cosmic": contains pre-configured project for STVD toolchain 
                                    with Cosmic compiler 
 
 - "STM8-128-EVAL\RIDE": contains pre-configured project for RIDE toolchain
  
 - "STM8-128-EVAL\src": contains the STM8-128-EVAL firmware source files
    - STM8-128-EVAL/src/buzzer.c             This file provides the firmware for the  buzzer demo.
    - STM8-128-EVAL/src/demo_about.c         This file provides the firmware to display the demo version 
    - STM8-128-EVAL/src/demo_adc.c           This file provides the firmware for the ADC demo
    - STM8-128-EVAL/src/demo_beeper.c        This file provides the firmware for the BEEPER 
    - STM8-128-EVAL/src/demo_games.c         This file provides the firmware games demo            
    - STM8-128-EVAL/src/demo_help.c          This file provides the firmware the demo help 
    - STM8-128-EVAL/src/demo_microsd.c       This file provides the firmware which includes Micro SD driver                       
    - STM8-128-EVAL/src/demo_pwm.c           This file provides the firmware for the PWM demo    
    - STM8-128-EVAL/src/demo_system.c        This file provides the firmware for System demo
    - STM8-128-EVAL/src/demo_timer.c         This file provides the firmware for TIMER demo
    - STM8-128-EVAL/src/functions.c          This file provides the firmware main demo configuration
    - STM8-128-EVAL/src/joystick_button.c    This file provides the firmware for Joystick management 
    - STM8-128-EVAL/src/main.c               Main program 
    - STM8-128-EVAL/src/menu.c               This file provides the firmware the demo menu
    - STM8-128-EVAL/src/stm8s_it.c           Interrupts handler      
  
         
@par Hardware and Software environment  

  - This firmware runs on STM8S High-Density Devices.
  
  - This firmware has been tested with STMicroelectronics STM8-128-EVAL 
    evaluation board and can be easily tailored to any other supported device and
    development board.
       
@par How to use it ?       
      
In order to load the demo code, you have do the following:
 - EWSTM8
    - Open the STM8-128-EVAL_Demo.eww workspace
    - Rebuild all files: Project->Rebuild all
    - Load project image: Project->Debug
    - Configure Option bytes: ST-LINK -> Option bytes -> LSI_EN = Enabled
                                                      -> AFR7 = Alternate active
                                                      -> Flash_Wait_States = 1
    - Run program: Debug->Go(F5)
   
 - STVD\\Raisonance 
    - Open the STM8-128-EVAL_Demo.stw project
    - Rebuild all files: Build-> Rebuild all. 
    - Load project image: Debug->Start Debugging
    - Configure Option bytes: Debug Instrument -> MCU configuration -> Options 
                        -> LSI_EN = Enabled
                        -> AFR7 = Alternate active
                        -> Flash_Wait_States = 1
    - Run program: Debug->Run (Ctrl+F5)   

 - STVD\\Cosmic 
    - Open the STM8-128-EVAL_Demo.stw project
    - Rebuild all files: Build-> Rebuild all. 
    - Load project image: Debug->Start Debugging
    - Configure Option bytes: Debug Instrument -> MCU configuration -> Options 
                        -> LSI_EN = Enabled
                        -> AFR7 = Alternate active
                        -> Flash_Wait_States = 1    
    - Run program: Debug->Run (Ctrl+F5)  

 - RIDE
    - Open the STM8-128-EVAL_Demo.rprj project
    - Load project image: Debug->start(ctrl+D)
    - Run program: Debug->Run(ctrl+F9)
    - Option Bytes are already configured within the STM8_OB.asm file 
 
 
@note
 - High-Density STM8S devices are the STM8S207xx and STM8S208xx microcontrollers
    where the Flash memory density ranges between 32 to 128 Kbytes.
 
 * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
 */

