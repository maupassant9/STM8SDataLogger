/**
  ******************************************************************************
  * @file     demo_beeper.h
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains functions prototypes for the BEEPER demo.
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
#ifndef __DEMO_BEEPER_H
#define __DEMO_BEEPER_H

/* Includes ------------------------------------------------------------------*/
#include "functions.h"

/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/
/* Exported variables --------------------------------------------------------*/

/* Exported functions --------------------------------------------------------*/
void BEEPERDEMO_Reset(void);
void BEEPERDEMO_Exec(void);
void SelectBeep(uint8_t nb);
void BEEP_AutoLSICalibration(void);

#endif /* __DEMO_BEEPER_H */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
