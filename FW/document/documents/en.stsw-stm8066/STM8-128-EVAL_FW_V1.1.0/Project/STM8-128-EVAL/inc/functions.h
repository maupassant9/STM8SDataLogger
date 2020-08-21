/**
  ********************************************************************************
  * @file     function.h
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains functions prototypes for the functions.
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
#ifndef __FUNCTIONS_H
#define __FUNCTIONS_H

/* Includes ------------------------------------------------------------------*/
#include "menu.h"

/* Exported types ------------------------------------------------------------*/
/* Exported define -----------------------------------------------------------*/
/* Exported variables --------------------------------------------------------*/
extern uint32_t GTimeStamp;
extern uint16_t TimeOutStartTime;
extern uint8_t EEPBuffer[];
extern uint8_t GUseEeprom;

/* Exported functions --------------------------------------------------------*/
void Init_Application(void);
void Init_TIM1(void);
void Init_TIM2(void);
void Init_GPIO(void);
void Init_Clock(void);
void Init_I2C(void);
void Read_Eeprom(void);
void Write_Eeprom(void);
uint32_t GetTimeStamp(void);
void GetTimeOutStartTime(void);
bool TimeOut(uint16_t Delay);
void WaitDelay(uint16_t Delay);
void Speaker_PWMOUT(uint16_t Freq, uint16_t Duration);

#endif /* __FUNCTIONS_H */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
