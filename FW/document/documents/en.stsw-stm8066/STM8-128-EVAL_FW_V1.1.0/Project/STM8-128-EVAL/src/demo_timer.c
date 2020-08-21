/**
  ******************************************************************************
  * @file     demo_timer.c
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains all the functions for the TIMER demo.
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
#include "demo_timer.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

uint8_t TimerMinute = 0;
uint8_t TimerSecond = 0;
uint8_t TimerMinute_old = 0;
extern uint8_t StrName[16];

/**
  * @addtogroup Demo_Functions
  * @{
  */

void TIMERDEMO_Reset(void)
{
    /* All leds are off */
    STM_EVAL_LEDOff(LED1);
    STM_EVAL_LEDOff(LED2);
    STM_EVAL_LEDOff(LED3);
    STM_EVAL_LEDOff(LED4);
    
    /* Reset ADC2 peripheral */
    ADC2_DeInit();
}

void TIMERDEMO_Exec(void)
{
  JOYState_TypeDef KeyJ = JOY_NONE;
  uint8_t KeyB = 0;
  uint16_t Conversion_Value = 0;
  uint8_t i = 0;
  uint16_t TimerDuration = 0;

  /* Init ADC to adjust minutes */
  ADC2_DeInit();
  ADC2_Init(ADC2_CONVERSIONMODE_CONTINUOUS, ADC2_CHANNEL_9, ADC2_PRESSEL_FCPU_D2,
            ADC2_EXTTRIG_TIM, DISABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_CHANNEL9,
            DISABLE);

  ADC2_Cmd(ENABLE);
  
  /* Start ADC conversion */
  ADC2_StartConversion();

  LCD_Clear();
  
  /* Display message on LCD */
  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print("RV1=select time");
  
  TimerMinute_old = 99;
  TimerSecond = 0;
  TimerDuration = 200; /* 1 second */

  /* Wait user action to start timer count-down or end demo */
  while (1)
  {
   /* Read ADC and set timer minutes duration */
    if (ADC2_GetFlagStatus())
    {
      Conversion_Value = ADC2_GetConversionValue();
      TimerMinute = (uint8_t)((Conversion_Value + 60) / 60);
      if (TimerMinute != TimerMinute_old)
      {
        TimerMinute_old = TimerMinute;
        TimerDisplay();
       }
    }

    KeyJ = ReadJoystick();
    KeyB = STM_EVAL_PBGetState(BUTTON_KEY);

    if ((KeyJ == JOY_SEL) || (KeyB == 0x00))
    {
       break;
    }

    if (KeyJ == JOY_UP)
    {
       MenuUpdate(KeyJ);
       return;
    }
  }

  ADC2_Cmd(DISABLE);

  LCD_Clear();
  
  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print("  Remaining...  ");

  GetTimeOutStartTime();

  /* Wait end of count-down or user action to end demo */
  while (1)
  {
    /* Exit demo */
     KeyJ = ReadJoystick();

     if (KeyJ != JOY_NONE)
     {
        MenuUpdate(JOY_UP);
        return;
     }

     /* Divide value by 2 each time button is pressed */
     KeyB = STM_EVAL_PBGetState(BUTTON_KEY);

     if (KeyB == 0)
     {
       if (TimerDuration > 10)
       {
          TimerDuration = (uint16_t)(TimerDuration >> 1);
       }
       else
       {
          TimerDuration = 200; /* 1 second */
       }
     }

     /* Check if 1 second elapsed */
     if (TimeOut(TimerDuration) == FALSE)
     {
            /* if not, do nothing */
     }
     else
     {
       GetTimeOutStartTime();
       TimerUpdate();
       TimerDisplay();
       if (TimerMinute == 0)
       {
         if (TimerSecond <= 10)
         {
           PlayNote(NOTE_MI, 4, DURATION_1);
         }
         switch (TimerSecond)
         {
          case 3:
            STM_EVAL_LEDOn(LED1);
            break;
          case 2:
            STM_EVAL_LEDOn(LED2);
            break;
          case 1:
             STM_EVAL_LEDOn(LED3);
             break;
          case 0:
             STM_EVAL_LEDOn(LED4);
             LCD_Clear();
             LCD_SetCursorPos(LCD_LINE1, 0);
             LCD_Print("   TERMINATED!  ");
            for (i = 0; i < 5; i++)
            {
              STM_EVAL_LEDOff(LED1);
              STM_EVAL_LEDOff(LED2);
              STM_EVAL_LEDOff(LED3);
              STM_EVAL_LEDOff(LED4);
              PlayNote(NOTE_LA, 4, DURATION_1);
              STM_EVAL_LEDOn(LED1);
              STM_EVAL_LEDOn(LED2);
              STM_EVAL_LEDOn(LED3);
              STM_EVAL_LEDOn(LED4);
              PlayNote(NOTE_SI, 4, DURATION_1);
             }
             MenuUpdate(JOY_UP);
             return;
          default:
             break;
          }
        }
      }
    }
}

void TimerDisplay(void)
{
  LCD_SetCursorPos(LCD_LINE2, 2);
  if (TimerMinute > 9)
  {
    sprintf((char*)StrName, "%d", (int)TimerMinute);
  }
  else
  {
    sprintf((char*)StrName, " %d",(int)TimerMinute);
  }
  LCD_Print(StrName);
  LCD_SetCursorPos(LCD_LINE2, 3);
  LCD_Print("::");
  LCD_SetCursorPos(LCD_LINE2, 4);
  if (TimerSecond > 9)
      {
   sprintf((char*)StrName, "%d", (int)TimerSecond);
      }
  else 
      {
   sprintf((char*)StrName, "0%d ", (int)TimerSecond);   
      }
  LCD_Print(StrName);
}

void TimerUpdate(void)
{
  if (TimerSecond == 0)
  {
    if (TimerMinute == 0)
    {
      return;
    }
    TimerSecond = 59;
    TimerMinute--;
  }
  else
  {
    TimerSecond--;
  }
}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
