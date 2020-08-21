/**
  ******************************************************************************
  * @file     demo_help.c
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains all the functions for the HELP demo.
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
#include "demo_help.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

uint8_t HelpMessageIndex = 0;

/**
  * @addtogroup Demo_Functions
  * @{
  */

/**
  * @brief  Update the help message if EXEHELP state selected
  * @param  None
  * @retval None
  */
void HELP_Exec(void)
{
  JOYState_TypeDef Key = JOY_NONE;
    
  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print(" LEFT or RIGHT ");
  LCD_SetCursorPos(LCD_LINE2, 0);
  LCD_Print("to scroll menu ");

  while (1)
  {

    Key = ReadJoystick();
    if (Key == JOY_UP)
    {
      MenuUpdate(Key);
      return;
    }

    WaitDelay(1000);

    HelpMessageIndex++;

    if (HelpMessageIndex > 2)
    {
      HelpMessageIndex = 0;
    }

    switch (HelpMessageIndex)
    {
      case 0:
        LCD_SetCursorPos(LCD_LINE1, 0);
        LCD_Print(" LEFT or RIGHT ");
        LCD_SetCursorPos(LCD_LINE2, 0);
        LCD_Print("to scroll menu ");
        break;
      case 1:
        LCD_SetCursorPos(LCD_LINE1, 0);
        LCD_Print(" Press SEL to  ");
        LCD_SetCursorPos(LCD_LINE2, 0);
        LCD_Print("enter sub-menu ");
        break;
      case 2:
        LCD_SetCursorPos(LCD_LINE1, 0);
        LCD_Print("   Move UP to  ");
        LCD_SetCursorPos(LCD_LINE2, 0);
        LCD_Print(" exit sub-menu ");
        break;
      default:
        break;
    }
  }
}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
