/**
  ********************************************************************************
  * @file     menu.h
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    TThis file contains functions prototypes for the menu.
  ******************************************************************************
  * @attention
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MENU_H
#define __MENU_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "stm8s_eval.h"
#include "stm8s_eval_lcd.h"
#include "stm8s_eval_spi_sd.h"
#include "joystick_button.h"
#include "demo_help.h"
#include "demo_about.h"
#include "demo_adc.h"
#include "demo_timer.h"
#include "demo_pwm.h"
#include "demo_beeper.h"
#include "demo_microsd.h"
#include "demo_games.h"
#include "demo_system.h"
#include "buzzer.h"
#include <stdio.h>
#include <string.h>
/* Exported types ------------------------------------------------------------*/
/** State ID
  * @note Table element must not be equal to 0 as this element is
  * used to detect the end of table.
 */
typedef enum {
    /* Level 1 */
    HELP = 1,
    ADC2_DEMO,
    TIMER_DEMO,
    PWM_DEMO,
    MICROSD_DEMO,
    BEEPER_DEMO,
    SMARTCARD_DEMO,
    GAMES_DEMO,
    SYSTEM_DEMO,
    ABOUT,
    /* Level 2 */
    ADC2_DEMO1,
    ADC2_DEMO2,
    ADC2_DEMO3,
    PWM_DEMO1,
    PWM_DEMO2,
    /* Execution */
    EXE_HELP,
    EXE_ADC2_DEMO1,
    EXE_ADC2_DEMO2,
    EXE_ADC2_DEMO3,
    EXE_TIMER_DEMO,
    EXE_PWM_DEMO1,
    EXE_PWM_DEMO2,
    EXE_MICROSD_DEMO,
    EXE_BEEPER_DEMO,
    EXE_SMARTCARD_DEMO,
    EXE_GAMES,
    EXE_SYSTEM,
    EXE_ABOUT
} STATE_ID_T;

/** Menu NextState */
typedef struct
{
    STATE_ID_T State;
    JOYState_TypeDef Key;
    STATE_ID_T NextState;
}
MENU_NEXTSTATE_T;

/** Menu state */
typedef struct
{
    STATE_ID_T State;
    char* pText;
    void (*pFunc)(void);
}
MENU_STATE_T;

/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/
/* Exported variables --------------------------------------------------------*/
extern STATE_ID_T State;
/* Exported functions --------------------------------------------------------*/
void MenuInit(void);
void MenuUpdate(JOYState_TypeDef ujoystick);
void MenuDisplay(void);

#endif /* __MENU_H */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
