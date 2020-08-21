/**
  ******************************************************************************
  * @file     demo_system.c
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains all the functions for the SYSTEM demo.
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
#include "demo_system.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
extern uint8_t StrName[16];
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @addtogroup Demo_System_Functions
  * @{
  */

void SYSTEM_Exec(void)
{
  CLK_Source_TypeDef clksrc = CLK_SOURCE_HSI;
  JOYState_TypeDef Key = JOY_NONE;
  uint8_t KeyB = 0x01;
  uint32_t clkfreq = 0;
  uint16_t num = 0;
  uint8_t disp_num = 0;
  uint8_t disp_enable = 1;
  static uint8_t clk_source = 1;

  while (1)
  {
    /* Display Clock source */
    if ((disp_num == 0) && (disp_enable == 1))
    {
       clksrc = CLK_GetSYSCLKSource();

       LCD_Clear();
       LCD_SetCursorPos(LCD_LINE1, 0);
       LCD_Print(" CLOCK SOURCE  ");

       switch (clksrc)
       {
        case CLK_SOURCE_HSI:
          LCD_SetCursorPos(LCD_LINE2, 0);
          LCD_Print("      HSI       ");
          break;
        case CLK_SOURCE_LSI:
          LCD_SetCursorPos(LCD_LINE2, 0);
          LCD_Print("      LSI       ");
          break;
        case CLK_SOURCE_HSE:
          LCD_SetCursorPos(LCD_LINE2, 0);
          LCD_Print("      HSE       ");
          break;
        default:
          LCD_SetCursorPos(LCD_LINE2, 0);
          LCD_Print("      ???       ");
          break;
       }
       disp_enable = 0;
     }

    /* Display clock frequency */
    if ((disp_num == 1) && (disp_enable == 1))
    {
       clkfreq = CLK_GetClockFreq();

       LCD_Clear();
       LCD_SetCursorPos(LCD_LINE1, 0);
       LCD_Print("  CLOCK FREQ    ");
       
       num = (uint16_t)(clkfreq / 1000);
       num = (uint16_t)(num / 1000);

       LCD_SetCursorPos(LCD_LINE2, 2);
       sprintf((char*)StrName, "%d", (int)num);
       LCD_Print(StrName);
       LCD_SetCursorPos(LCD_LINE2, 4);
       LCD_Print("MHz");

       disp_enable = 0;
    }

    Key = ReadJoystick();
    if (Key == JOY_UP)
    {
       MenuUpdate(Key);
       return;
    }
    if (Key == JOY_SEL)
    {
       disp_num ^= 0x01;
       disp_enable = 1;
    }

    KeyB = STM_EVAL_PBGetState(BUTTON_KEY);
    if (KeyB == 0)
    {
      switch (clk_source)
       {
        case 0:
          CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
          break;
        case 1:
           CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);
           break;
        case 2:
           CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV4);
           break;
        case 3:
           CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV8);
           break;
        default:
           break;
        }
     clk_source++;
     if (clk_source > 3) 
        clk_source = 0;
      disp_num = 0;
      disp_enable = 1;
    }
  }
}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
