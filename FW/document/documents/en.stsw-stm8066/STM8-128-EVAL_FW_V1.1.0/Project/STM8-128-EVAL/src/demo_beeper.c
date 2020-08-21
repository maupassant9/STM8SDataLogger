/**
  ******************************************************************************
  * @file     demo_beeper.c
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains all the functions for the BEEPER demo.
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

/* Includes ------------------------------------------------------------------*/
#include "demo_beeper.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @addtogroup Demo_Functions
  * @{
  */

void BEEPERDEMO_Reset(void)
{
    STM_EVAL_LEDOff(LED1);
    STM_EVAL_LEDOff(LED2);
    STM_EVAL_LEDOff(LED3);
    STM_EVAL_LEDOff(LED4);
    BEEP_Cmd(DISABLE);
}

void BEEPERDEMO_Exec(void)
{
  JOYState_TypeDef Key = JOY_NONE;
  uint8_t KeyB = 0x01;
  uint8_t idx = 0;
  uint8_t idx2 = 0;

  LCD_Clear();

  /* BEEP calibration */
  disableInterrupts(); 
  WaitDelay(50);
  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print("  CALIBRATION   ");
  LCD_SetCursorPos(LCD_LINE2, 0);
  LCD_Print("    on going    ");
  BEEP_AutoLSICalibration();
  enableInterrupts();
  LCD_SetCursorPos(LCD_LINE2, 0);
  LCD_Print("       OK       ");
  WaitDelay(200);

  LCD_Clear();
  WaitDelay(50);

  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print("  BEEPER OFF    ");
  LCD_SetCursorPos(LCD_LINE2, 0);
  LCD_Print("   Press Key    ");  
    
  while (1)
  {
    Key = ReadJoystick();
    if (Key == JOY_UP)
    {
        MenuUpdate(Key);
        return;
    }
 
    KeyB = STM_EVAL_PBGetState(BUTTON_KEY);
    if (KeyB == 0)
    {
       /* Change BEEP frequency */
        switch (idx)
        {
         case 0:
            BEEP_Cmd(DISABLE);
            WaitDelay(80);
            BEEP_Init(BEEP_FREQUENCY_1KHZ);
            BEEP_Cmd(ENABLE);
            STM_EVAL_LEDOn(LED1);
            STM_EVAL_LEDOff(LED2);
            STM_EVAL_LEDOff(LED3);
            STM_EVAL_LEDOff(LED4);
      
            LCD_SetCursorPos(LCD_LINE1, 0);
            LCD_Print("  BEEPER 1kHz   ");
            idx = 1;
            break;
         case 1:
            BEEP_Cmd(DISABLE);
            WaitDelay(80);
            BEEP_Init(BEEP_FREQUENCY_2KHZ);
            BEEP_Cmd(ENABLE); 
            STM_EVAL_LEDOn(LED1);
            STM_EVAL_LEDOn(LED2);
            STM_EVAL_LEDOff(LED3);
            STM_EVAL_LEDOff(LED4);                
            LCD_SetCursorPos(LCD_LINE1, 0);
            LCD_Print("  BEEPER 2kHz   ");
            idx = 2;
            break;
         case 2:
            BEEP_Cmd(DISABLE);
            WaitDelay(80);
            BEEP_Init(BEEP_FREQUENCY_4KHZ);
            BEEP_Cmd(ENABLE);
            STM_EVAL_LEDOn(LED1);
            STM_EVAL_LEDOn(LED2);
            STM_EVAL_LEDOn(LED3);
            STM_EVAL_LEDOff(LED4);                
            LCD_SetCursorPos(LCD_LINE1, 0);
            LCD_Print("  BEEPER 4kHz   ");
            idx = 3;
            break;
          case 3:
            STM_EVAL_LEDOn(LED1);
            STM_EVAL_LEDOn(LED2);
            STM_EVAL_LEDOn(LED3);
            STM_EVAL_LEDOn(LED4);
            LCD_SetCursorPos(LCD_LINE1, 0);
            LCD_Print("BEEPER 1-2-4kHz ");
            idx2 = 1;
            while (idx2 != 0)
            {
                STM_EVAL_LEDToggle(LED1);
                STM_EVAL_LEDToggle(LED2);
                STM_EVAL_LEDToggle(LED3);
                STM_EVAL_LEDToggle(LED4);
                SelectBeep(idx2++);
                if (idx2 > 3)
                {
                  idx2 = 0;
                }
                WaitDelay(100);
            }
            GetTimeOutStartTime();
            idx = 4;
            break;
           default:
           case 4:
            BEEPERDEMO_Reset();
            LCD_SetCursorPos(LCD_LINE1, 0);
            LCD_Print("  BEEPER OFF    ");
            idx = 0;
            break;
        }
    }
  }


}

void SelectBeep(uint8_t nb)
{
    if (nb == 0) BEEP_Cmd(DISABLE);
    if (nb == 1) BEEP_Init(BEEP_FREQUENCY_1KHZ);
    if (nb == 2) BEEP_Init(BEEP_FREQUENCY_2KHZ);
    if (nb == 3) BEEP_Init(BEEP_FREQUENCY_4KHZ);
}

/**
  * @brief  Measure the LSI frequency using timer IC1 and update the calibration registers.
  * @param  None
  * @retval None
  * @note   It is recommended to use a timer clock frequency of at least 10MHz 
  *         in order to obtain a better LSI frequency measurement.
  */
void BEEP_AutoLSICalibration(void)
{

  uint32_t lsi_freq_hz = 0x0;
  uint32_t fmaster = 0x0;
  uint16_t ICValue1 = 0x0;
  uint16_t ICValue2 = 0x0;

  /* Get master frequency */
  fmaster = CLK_GetClockFreq();

  /* Enable the LSI measurement: LSI clock connected to timer Input Capture 1 */
  AWU->CSR |= AWU_CSR_MSR;

  /* Measure the LSI frequency with TIMER Input Capture 1 */
  
/* Capture only every 8 events!!! */
  /* Enable capture of TI1 */
  TIM3_ICInit(TIM3_CHANNEL_1, TIM3_ICPOLARITY_RISING, TIM3_ICSELECTION_DIRECTTI, TIM3_ICPSC_DIV8, 0);

  /* Enable TIM3 */
  TIM3_Cmd(ENABLE);

  /* wait a capture on cc1 */
  while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
  /* Get CCR1 value*/
  ICValue1 = TIM3_GetCapture1();
  TIM3_ClearFlag(TIM3_FLAG_CC1);

  /* wait a capture on cc1 */
  while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
    /* Get CCR1 value*/
  ICValue2 = TIM3_GetCapture1();
  TIM3_ClearFlag(TIM3_FLAG_CC1);

  /* Disable IC1 input capture */
  TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
  /* Disable timer3 */
  TIM3_Cmd(DISABLE);


  /* Compute LSI clock frequency */
  lsi_freq_hz = (8 * fmaster) / (ICValue2 - ICValue1);
  
  /* Disable the LSI measurement: LSI clock disconnected from timer Input Capture 1 */
  AWU->CSR &= (uint8_t)(~AWU_CSR_MSR);

  /* Update the calibration registers */
  BEEP_LSICalibrationConfig(lsi_freq_hz);
}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
