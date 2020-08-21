/**
  ******************************************************************************
  * @file     demo_pwm.h
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains functions prototypes for the PWM demo.
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
#ifndef __DEMO_PWM_H
#define __DEMO_PWM_H

/* Includes ------------------------------------------------------------------*/
#include "functions.h"
/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Used to identify the melody store in the external eeprom. The value must be
   different from 0x00 to NB_MELODIES-1 (see buzzer.h) */
#define PWM_DEMO1_MELODY ((uint8_t)'Z')

/* Symbols used for the melody entered in the LCD */
#define MELODY_END_CHAR     ((uint8_t)'*')
#define MELODY_LOOP_CHAR    ((uint8_t)'8')
#define MELODY_NULL_CHAR    ((uint8_t)'\0')
#define MELODY_NOTUSED_CHAR ((uint8_t)'?')

/* Exported macro ------------------------------------------------------------*/
/* Exported variables --------------------------------------------------------*/

/* Exported functions --------------------------------------------------------*/
void PWMDEMO_Reset(void);
void PWMDEMO1_Exec(void);
void PWMDEMO2_Exec(void);
void PwmDisplayNotes(void);
void PwmDisplayNotesPos(uint8_t pos);
uint8_t PwmCalcMaxPos(void);
void PwmResetNotes(void);
void PwmCleanNotes(void);
void PwmPlayMelody(uint8_t *notes, uint8_t dn);

#endif /* __DEMO_PWM_H */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
