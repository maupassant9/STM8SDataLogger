/**
  ******************************************************************************
  * @file demo_timer.h
  * @brief    This file contains functions prototypes for the TIMER demo.
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
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
#ifndef __DEMO_TIMER_H
#define __DEMO_TIMER_H

/* Includes ------------------------------------------------------------------*/
#include "functions.h"

/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/

/* Exported variables --------------------------------------------------------*/
extern bool TimerStopped;

/* Exported functions --------------------------------------------------------*/
void TIMERDEMO_Reset(void);
void TIMERDEMO_Exec(void);
void TimerDisplay(void);
void TimerUpdate(void);

#endif /* __DEMO_TIMER_H */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
