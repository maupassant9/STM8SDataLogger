/**
  ******************************************************************************
  * @file     main.c
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains the main function.
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
#include "main.h"

/**
  * @addtogroup DEMO_Functions
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Evalboard I/Os configuration */
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
__IO JOYState_TypeDef Key = JOY_NONE;
uint8_t StrName[16] = {0};
uint8_t State_MelodyCallBack;
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/* Public functions ----------------------------------------------------------*/

/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{

  Melody_TypeDef *pMelody;
  uint8_t i = 0;
  uint8_t end_found = 0;

  /* Demo Initialization */
  Init_Application();

  /* Display the welcome text on first LCD line */
  LCD_Clear();
  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print(" STM8-128K DEMO ");

  /* Play melody and display "moving" ST logo in callback function */
  EEPBuffer[0] = 0x00;

  /* If KEY button is pressed after Reset, then the external eeprom is not used */
  if (STM_EVAL_PBGetState(BUTTON_KEY) == (uint8_t)0x00)
  {
      GUseEeprom = 0;
  }
  else
  {
      /* Get melody from external eeprom */
      Read_Eeprom();
      GUseEeprom = 1;
  }

  /* Check if the first byte corresponds to the PWM DEMO1 melody stored */
  if (EEPBuffer[0] == PWM_DEMO1_MELODY)
  {
    /* Check if end of melody symbol is present. If not, add it */
     end_found = 0;
     for (i = 1; i < 16; i++)
     {
       if ((EEPBuffer[i] == MELODY_END_CHAR) || (EEPBuffer[i] == MELODY_LOOP_CHAR))
       {
          end_found = 1;
          break;
       }
     }
     if (end_found == 0)
     {
       EEPBuffer[15] = MELODY_END_CHAR;
     }
    /* Play melody */
    State_MelodyCallBack = 0;
    PwmPlayMelody(EEPBuffer, 0);
    State_MelodyCallBack = 1;
  }
  else /* This is a pre-defined melody */
  {
    /* Check if the melody index is correct */
    if (EEPBuffer[0] < NB_MELODIES)
    {
      pMelody = (Melody_TypeDef *)MELODIES + EEPBuffer[0];
    }
    else /* If not play the first melody */
    {
      pMelody = (Melody_TypeDef *)MELODIES;
    }
    State_MelodyCallBack = 0;
    PlayMelody(pMelody->Notes);
    State_MelodyCallBack = 1;
  }


  LCD_SetCursorPos(LCD_LINE2, 0);
  LCD_Print("                ");
   LCD_SetCursorPos(LCD_LINE2, 0);

  LCD_DisplayLogo(0x93);
  WaitDelay(150);

  /* Display the menu */
  MenuDisplay();

  /* Executive loop, runs continually after initialization */
  while (1)
  {
    /* Menu update management */
    Key = ReadJoystick();

    if (Key != JOY_NONE)
    {
      MenuUpdate(Key);
    }
  }

}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

#ifdef ENABLE_MELODY_CALLBACK
void MelodyCallBack(void)
{
  static uint8_t logo_pos = 0x90;
  static int8_t logo_pos_index = 1;

  if (State_MelodyCallBack == 0)
  {
    LCD_SetCursorPos(LCD_LINE2, 0);
    LCD_Print("               ");

    LCD_DisplayLogo(logo_pos);
    logo_pos += logo_pos_index;
    if (logo_pos > 0x95)
    {
      logo_pos -= 2;
      logo_pos_index = -1;
    }
    if (logo_pos < 0x90)
    {
      logo_pos += 2;
      logo_pos_index = 1;
    }
  }
}
#endif

/**
  * @}
  */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
