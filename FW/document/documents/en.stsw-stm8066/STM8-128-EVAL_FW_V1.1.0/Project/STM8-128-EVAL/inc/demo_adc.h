/**
  ******************************************************************************
  * @file     demo_adc.h
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains functions prototypes for the ADC demo.
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
#ifndef __DEMO_ADC_H
#define __DEMO_ADC_H

/* Includes ------------------------------------------------------------------*/
#include "functions.h"
/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/
extern CONST uint8_t Bar_1_16[];
extern CONST uint8_t Bar_2_16[];
extern CONST uint8_t Bar_3_16[];
extern CONST uint8_t Bar_4_16[];
extern CONST uint8_t Bar_5_16[];
extern CONST uint8_t Bar_6_16[];
extern CONST uint8_t Bar_7_16[];
extern CONST uint8_t Bar_8_16[];
extern CONST uint8_t Bar_9_16[];
extern CONST uint8_t Bar_10_16[];
extern CONST uint8_t Bar_11_16[];
extern CONST uint8_t Bar_12_16[];
extern CONST uint8_t Bar_13_16[];
extern CONST uint8_t Bar_14_16[];
extern CONST uint8_t Bar_15_16[];
extern CONST uint8_t Bar_16_16[];

/* Exported macro ------------------------------------------------------------*/
/* Exported variables --------------------------------------------------------*/

/* Exported functions --------------------------------------------------------*/
void ADC2DEMO_Reset(void);
void ADC2DEMO1_Init(void);
void ADC2DEMO2_Init(void);
void ADC2DEMO3_Init(void);
void ADC2DEMO_Exec(void);
void ADC2DEMO3_Exec(void);
void ADC2_DisplayOnLeds(uint16_t val);
void ADC2_InitUart1(void);
void ADC2_InitUart3(void);
void ADC2_DisplayOnPC(uint16_t val);

#endif /* __DEMO_ADC_H */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
