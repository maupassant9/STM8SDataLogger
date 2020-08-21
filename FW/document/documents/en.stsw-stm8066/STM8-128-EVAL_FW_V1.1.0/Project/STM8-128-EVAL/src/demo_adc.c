/**
  ******************************************************************************
  * @file     demo_adc.c
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains all the functions for the ADC demo.
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
#include "demo_adc.h"
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
extern __IO JOYState_TypeDef Key;
extern uint8_t StrName[16];
/* Private function prototypes -----------------------------------------------*/
static void DisplayCGRAM0(uint8_t address, uint8_t *ptrTable);
static void DisplayCGRAM1(uint8_t address, uint8_t *ptrTable);
/* Private functions ---------------------------------------------------------*/

/* This table contains the dark table  */
CONST uint8_t Bar_1_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0x80, 0x00,
        0x80, 0x00,
        0x80, 0x00,
        0x80, 0x00,
        0x80, 0x00,
        /* 8~15 */
        0x80, 0x00,
        0x80, 0x00,
        0x80, 0x00,
        0x80, 0x00,
        0x80, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

CONST uint8_t Bar_2_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0xC0, 0x00,
        0xC0, 0x00,
        0xC0, 0x00,
        0xC0, 0x00,
        0xC0, 0x00,
        /* 8~15 */
        0xC0, 0x00,
        0xC0, 0x00,
        0xC0, 0x00,
        0xC0, 0x00,
        0xC0, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

CONST uint8_t Bar_3_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0xE0, 0x00,
        0xE0, 0x00,
        0xE0, 0x00,
        0xE0, 0x00,
        0xE0, 0x00,
        /* 8~15 */
        0xE0, 0x00,
        0xE0, 0x00,
        0xE0, 0x00,
        0xE0, 0x00,
        0xE0, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

CONST uint8_t Bar_4_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0xF0, 0x00,
        0xF0, 0x00,
        0xF0, 0x00,
        0xF0, 0x00,
        0xF0, 0x00,
        /* 8~15 */
        0xF0, 0x00,
        0xF0, 0x00,
        0xF0, 0x00,
        0xF0, 0x00,
        0xF0, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

CONST uint8_t Bar_5_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0xF8, 0x00,
        0xF8, 0x00,
        0xF8, 0x00,
        0xF8, 0x00,
        0xF8, 0x00,
        /* 8~15 */
        0xF8, 0x00,
        0xF8, 0x00,
        0xF8, 0x00,
        0xF8, 0x00,
        0xF8, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

CONST uint8_t Bar_6_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0xFC, 0x00,
        0xFC, 0x00,
        0xFC, 0x00,
        0xFC, 0x00,
        0xFC, 0x00,
        /* 8~15 */
        0xFC, 0x00,
        0xFC, 0x00,
        0xFC, 0x00,
        0xFC, 0x00,
        0xFC, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

CONST uint8_t Bar_7_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0xFE, 0x00,
        0xFE, 0x00,
        0xFE, 0x00,
        0xFE, 0x00,
        0xFE, 0x00,
        /* 8~15 */
        0xFE, 0x00,
        0xFE, 0x00,
        0xFE, 0x00,
        0xFE, 0x00,
        0xFE, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

CONST uint8_t Bar_8_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0xFF, 0x00,
        0xFF, 0x00,
        0xFF, 0x00,
        0xFF, 0x00,
        0xFF, 0x00,
        /* 8~15 */
        0xFF, 0x00,
        0xFF, 0x00,
        0xFF, 0x00,
        0xFF, 0x00,
        0xFF, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

CONST uint8_t Bar_9_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0xFF, 0x80,
        0xFF, 0x80,
        0xFF, 0x80,
        0xFF, 0x80,
        0xFF, 0x80,
        /* 8~15 */
        0xFF, 0x80,
        0xFF, 0x80,
        0xFF, 0x80,
        0xFF, 0x80,
        0xFF, 0x80,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

CONST uint8_t Bar_10_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0xFF, 0xC0,
        0xFF, 0xC0,
        0xFF, 0xC0,
        0xFF, 0xC0,
        0xFF, 0xC0,
        /* 8~15 */
        0xFF, 0xC0,
        0xFF, 0xC0,
        0xFF, 0xC0,
        0xFF, 0xC0,
        0xFF, 0xC0,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

CONST uint8_t Bar_11_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0xFF, 0xE0,
        0xFF, 0xE0,
        0xFF, 0xE0,
        0xFF, 0xE0,
        0xFF, 0xE0,
        /* 8~15 */
        0xFF, 0xE0,
        0xFF, 0xE0,
        0xFF, 0xE0,
        0xFF, 0xE0,
        0xFF, 0xE0,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

CONST uint8_t Bar_12_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0xFF, 0xF0,
        0xFF, 0xF0,
        0xFF, 0xF0,
        0xFF, 0xF0,
        0xFF, 0xF0,
        /* 8~15 */
        0xFF, 0xF0,
        0xFF, 0xF0,
        0xFF, 0xF0,
        0xFF, 0xF0,
        0xFF, 0xF0,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

CONST uint8_t Bar_13_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0xFF, 0xF8,
        0xFF, 0xF8,
        0xFF, 0xF8,
        0xFF, 0xF8,
        0xFF, 0xF8,
        /* 8~15 */
        0xFF, 0xF8,
        0xFF, 0xF8,
        0xFF, 0xF8,
        0xFF, 0xF8,
        0xFF, 0xF8,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

CONST uint8_t Bar_14_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0xFF, 0xFC,
        0xFF, 0xFC,
        0xFF, 0xFC,
        0xFF, 0xFC,
        0xFF, 0xFC,
        /* 8~15 */
        0xFF, 0xFC,
        0xFF, 0xFC,
        0xFF, 0xFC,
        0xFF, 0xFC,
        0xFF, 0xFC,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

CONST uint8_t Bar_15_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0xFF, 0xFE,
        0xFF, 0xFE,
        0xFF, 0xFE,
        0xFF, 0xFE,
        0xFF, 0xFE,
        /* 8~15 */
        0xFF, 0xFE,
        0xFF, 0xFE,
        0xFF, 0xFE,
        0xFF, 0xFE,
        0xFF, 0xFE,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

CONST uint8_t Bar_16_16[] =
    {
        /* 0~7 */
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00,
        0xFF, 0xFF,
        0xFF, 0xFF,
        0xFF, 0xFF,
        0xFF, 0xFF,
        0xFF, 0xFF,
        /* 8~15 */
        0xFF, 0xFF,
        0xFF, 0xFF,
        0xFF, 0xFF,
        0xFF, 0xFF,
        0xFF, 0xFF,
        0x00, 0x00,
        0x00, 0x00,
        0x00, 0x00
    };

__IO uint8_t Nb_full_block_old = 0;
__IO uint16_t Conversion_Value_old = 0;
__IO uint8_t Nb_bar_old = 0;
uint8_t Claps = 0;

/* Used to exit value on PWM, UART1 and UART3
   0 : LCD only
   1 : LCD + buzzer
   2 : LCD + UART1
   3 : LCD + UART3
   4 : LCD + UART1 + UART3
   5 : LCD + UART1 + UART3 + buzzer
 */
uint8_t Extra = 0;

/**
  * @addtogroup Demo_Functions
  * @{
  */

/* Common to the 3 demos */
void ADC2DEMO_Reset(void)
{
    /* All leds are off */
    STM_EVAL_LEDOff(LED1);
    STM_EVAL_LEDOff(LED2);
    STM_EVAL_LEDOff(LED3);
    STM_EVAL_LEDOff(LED4);
    
    /* Reset ADC2 peripheral */
    ADC2_DeInit();
    
    /* Reset UART peripherals */
    UART1_DeInit();
    UART3_DeInit();
}

/* Convert input coming from potentiometer RV1 */
void ADC2DEMO1_Init(void)
{
  /* Display message on LCD */
  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print("   ADC DEMO 1   ");
  LCD_SetCursorPos(LCD_LINE2, 0);
  LCD_Print("   Vin = RV1    ");
  
  /* All leds On*/
  STM_EVAL_LEDOn(LED1);
  STM_EVAL_LEDOn(LED2);
  STM_EVAL_LEDOn(LED3);
  STM_EVAL_LEDOn(LED4);

  ADC2_DeInit();

  ADC2_Init(ADC2_CONVERSIONMODE_CONTINUOUS, ADC2_CHANNEL_9, ADC2_PRESSEL_FCPU_D2,
            ADC2_EXTTRIG_TIM, DISABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_CHANNEL9, DISABLE);

  ADC2_Cmd(ENABLE);

  ADC2_InitUart1();
  ADC2_InitUart3();

  LCD_Clear();
  
  WaitDelay(300);

  
  /* All leds are off */
  STM_EVAL_LEDOff(LED1);
  STM_EVAL_LEDOff(LED2);
  STM_EVAL_LEDOff(LED3);
  STM_EVAL_LEDOff(LED4);

  /* Initialize globals to impossible values */
  Conversion_Value_old = 1999;
  Nb_full_block_old = 99;
  Nb_bar_old = 99;

  ADC2_StartConversion();

  while (1)
  {
    ADC2DEMO_Exec();
    Key = ReadJoystick();
    if (Key == JOY_UP)
    {
      MenuUpdate(Key);
      return;
    }
  }
}

/* Convert input coming from connector CN3 */
void ADC2DEMO2_Init(void)
{
  /* Display message on LCD */
  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print("   ADC DEMO 2   ");
  LCD_SetCursorPos(LCD_LINE2, 0);
  LCD_Print("   Vin = CN3    ");
  
  /* All leds On*/
  STM_EVAL_LEDOn(LED1);
  STM_EVAL_LEDOn(LED2);
  STM_EVAL_LEDOn(LED3);
  STM_EVAL_LEDOn(LED4);
    
  ADC2_DeInit();

  ADC2_Init(ADC2_CONVERSIONMODE_CONTINUOUS, ADC2_CHANNEL_12, ADC2_PRESSEL_FCPU_D2, 
            ADC2_EXTTRIG_TIM, DISABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_CHANNEL12,  DISABLE);

  ADC2_Cmd(ENABLE);

  ADC2_InitUart1();
  ADC2_InitUart3();

  WaitDelay(300);

  LCD_Clear();
  
  /* All leds are off */
  STM_EVAL_LEDOff(LED1);
  STM_EVAL_LEDOff(LED2);
  STM_EVAL_LEDOff(LED3);
  STM_EVAL_LEDOff(LED4);

  /* Initialize globals to impossible values */
  Conversion_Value_old = 1999;
  Nb_full_block_old = 99;
  Nb_bar_old = 99;

  ADC2_StartConversion();

  while (1)
  {
    ADC2DEMO_Exec();
    Key = ReadJoystick();
    if (Key == JOY_UP)
    {
      MenuUpdate(Key);
      return;
    }
  }

}

/* Convert input coming from Microphone */
void ADC2DEMO3_Init(void)
{
  /* Display message on LCD */
  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print("   ADC DEMO 3   ");
  LCD_SetCursorPos(LCD_LINE2, 0);
  LCD_Print("   Vin = Micro  ");

  WaitDelay(500);
  
  /* All leds On*/
  STM_EVAL_LEDOn(LED1);
  STM_EVAL_LEDOn(LED2);
  STM_EVAL_LEDOn(LED3);
  STM_EVAL_LEDOn(LED4);

  ADC2_DeInit();

  ADC2_Init(ADC2_CONVERSIONMODE_CONTINUOUS, ADC2_CHANNEL_11, ADC2_PRESSEL_FCPU_D2,
            ADC2_EXTTRIG_TIM, DISABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_CHANNEL11, DISABLE);

  ADC2_Cmd(ENABLE);

  ADC2_InitUart1();
  ADC2_InitUart3();

  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print(" Clap 3 times   ");
  LCD_SetCursorPos(LCD_LINE2, 0);
  LCD_Print(" to wake me up  "); 
  
  WaitDelay(300);

  LCD_Clear();
  
  /* All leds are off */
  STM_EVAL_LEDOff(LED1);
  STM_EVAL_LEDOff(LED2);
  STM_EVAL_LEDOff(LED3);
  STM_EVAL_LEDOff(LED4);

  /* Init variable used to count how many times user clap his/her hands */
  Claps = 0;

  ADC2_StartConversion();

  while (1)
  {
    ADC2DEMO3_Exec();
    Key = ReadJoystick();
    if (Key == JOY_UP)
    {
       MenuUpdate(Key);
       return;
    }
   }
}

void ADC2DEMO_Exec(void)
{
  uint16_t Conversion_Value = 0;
  uint8_t  Percent_Value = 0;
  uint32_t Temp32 = 0;
  int16_t Difference = 0;
  uint8_t Margin = 2;
  uint8_t Nb_full_block = 0;
  uint8_t Nb_bar = 0;
  uint8_t pos = 0;
  uint8_t KeyB = 0x01;

  KeyB = STM_EVAL_PBGetState(BUTTON_KEY);

  if (KeyB == 0)
  {
    Extra++;
    
    UART1_Cmd(DISABLE);
    UART3_Cmd(DISABLE);
    
    if ((Extra == 2) || (Extra == 4) || (Extra == 5))
    {
      UART1_Cmd(ENABLE);
    }
    if (Extra > 2)
    { 
      UART3_Cmd(ENABLE);
    }
    if (Extra > 5)
    {
      Extra = 0;
    }
  }

  /* Check if the conversion is finished */
  if (ADC2_GetFlagStatus())
  {
    Conversion_Value = ADC2_GetConversionValue();
    if ((Extra == 1) || (Extra == 5))
    {
     /* Play sound
        freq_sound = freq_timer / ((ADC2_value + 100) * 8)
        ADC2_value = 0    --> freq_sound = 4000000 / 8984 = 445 Hz
        ADC2_value = 1023 --> freq_sound = 4000000 / 800  = 5000 Hz
      */
       PlayTunePWM((((1023 - Conversion_Value) + 100) << 3) , 5);
     }
     else
     {
       WaitDelay(50);
     }

    if (Conversion_Value != Conversion_Value_old)
    {
      Difference = Conversion_Value_old - Conversion_Value;
      if (Difference > Margin || (Difference < (-Margin)))
      {
        Conversion_Value_old = Conversion_Value;

        /* Display value on PC using UART1 and UART3 */
        if (Extra > 1)
        {
          ADC2_DisplayOnPC(Conversion_Value);
        }
        /* Calculate value in percentage */
        Temp32 = (uint32_t)(Conversion_Value + 1);
        Percent_Value = (uint8_t)((Temp32 * 100) >> 10);
       

        /* Display value in percentage, hexa and decimal on LCD first line */
        LCD_SetCursorPos(LCD_LINE1, 0);
        LCD_Print("                ");
        sprintf((char*)StrName, "%d%%", (int)Percent_Value);
        LCD_SetCursorPos(LCD_LINE1, 0);
        LCD_Print(StrName);
        
        sprintf((char*)StrName, "%Xh", Conversion_Value);
        LCD_SetCursorPos(LCD_LINE1, 3);
        LCD_Print(StrName);
        
        sprintf((char*)StrName, " %dd",(int)Conversion_Value);
        LCD_SetCursorPos(LCD_LINE1, 5);
        LCD_Print(StrName);
        
        /* Display value on LEDs */
        ADC2_DisplayOnLeds(Conversion_Value);

        /* Display value in bar graph on LCD line2 */
        Nb_full_block = (uint8_t)(Percent_Value/12);
        Nb_bar = (uint8_t)(Percent_Value - (Nb_full_block *12));

        if ((Nb_bar != Nb_bar_old) || (Nb_full_block != Nb_full_block_old))
        {
          Nb_full_block_old = Nb_full_block;
          Nb_bar_old = Nb_bar;
          LCD_SetCursorPos(LCD_LINE2, 0);
          LCD_Print("                ");
          LCD_SetCursorPos(LCD_LINE2, 0);
          
          pos = 0x90;
          while (Nb_full_block)
          {
            DisplayCGRAM0(pos, (uint8_t *)Bar_16_16);
            pos++;
            if (pos > 0x98)
            {
              pos = 0x98;
            }
            Nb_full_block--;
          }
          pos--; /* Need to go back postion-1 to print the bar */
          switch (Nb_bar)
          {
            case 1:
              DisplayCGRAM1(pos, (uint8_t *)Bar_1_16);
              break;
            case 2:
              DisplayCGRAM1(pos, (uint8_t *)Bar_2_16);
              break;
            case 3:
              DisplayCGRAM1(pos, (uint8_t *)Bar_3_16);
              break;
            case 4:
              DisplayCGRAM1(pos, (uint8_t *)Bar_4_16);
              break;
            case 5:
              DisplayCGRAM1(pos, (uint8_t *)Bar_5_16);
              break;
            case 6:
              DisplayCGRAM1(pos, (uint8_t *)Bar_6_16);
              break;
            case 7:
               DisplayCGRAM1(pos, (uint8_t *)Bar_7_16);
               break;
            case 8:
               DisplayCGRAM1(pos, (uint8_t *)Bar_8_16);
               break;
            case 9:
               DisplayCGRAM1(pos, (uint8_t *)Bar_9_16);
               break;
            case 10:
               DisplayCGRAM1(pos, (uint8_t *)Bar_10_16);
               break;
            case 11:
               DisplayCGRAM1(pos, (uint8_t *)Bar_11_16);
               break;
            case 12:
               DisplayCGRAM1(pos, (uint8_t *)Bar_12_16);
               break;
            case 13:
               DisplayCGRAM1(pos, (uint8_t *)Bar_13_16);
               break;
            case 14:
               DisplayCGRAM1(pos, (uint8_t *)Bar_14_16);
               break;
            case 15:
               DisplayCGRAM1(pos, (uint8_t *)Bar_15_16);
               break;
            default:
               break;
          }
        }
      }
    }
  }
}

void ADC2DEMO3_Exec(void)
{
  uint16_t Conversion_Value = 0;

  if (Claps >= 3)
  {
    ADC2DEMO_Exec();
  }
  else
  {
    /* Check if the conversion is finished */
    if (ADC2_GetFlagStatus())
    {
      Conversion_Value = ADC2_GetConversionValue();
      if (Conversion_Value > 1000)
      {
        Claps++;
        LCD_Clear();
        sprintf((char*)StrName, "%d", (int)Claps);
        LCD_Print(StrName);
        WaitDelay(100);
       }
    }
   }
}

void ADC2_DisplayOnLeds(uint16_t val)
{
  if (val == 0x0)
  {
    /* All leds are off */
    STM_EVAL_LEDOff(LED1);
    STM_EVAL_LEDOff(LED2);
    STM_EVAL_LEDOff(LED3);
    STM_EVAL_LEDOff(LED4);
  }
  if ((val > 0) && (val <= 255))
  {
    
    STM_EVAL_LEDOn(LED1);
    STM_EVAL_LEDOff(LED2);
    STM_EVAL_LEDOff(LED3);
    STM_EVAL_LEDOff(LED4);
  }
  if ((val >= 256) && (val <= 511))
  {
    STM_EVAL_LEDOn(LED1);
    STM_EVAL_LEDOn(LED2);
    STM_EVAL_LEDOff(LED3);
    STM_EVAL_LEDOff(LED4);
  }
  if ((val >= 512) && (val <= 767))
  {
    STM_EVAL_LEDOn(LED1);
    STM_EVAL_LEDOn(LED2);
    STM_EVAL_LEDOn(LED3);
    STM_EVAL_LEDOff(LED4);
  }
  if (val >= 768)
  {
    STM_EVAL_LEDOn(LED1);
    STM_EVAL_LEDOn(LED2);
    STM_EVAL_LEDOn(LED3);
    STM_EVAL_LEDOn(LED4);
  }
}

void ADC2_InitUart1(void)
{
  UART1_Init(9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO, 
             UART1_SYNCMODE_CLOCK_DISABLE, (UART1_Mode_TypeDef)(UART1_MODE_TX_ENABLE | UART1_MODE_RX_DISABLE));
}

void ADC2_InitUart3(void)
{
  UART3_Init(9600, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, UART3_PARITY_NO,  
             (UART3_Mode_TypeDef)((UART3_MODE_TX_ENABLE | UART3_MODE_RX_DISABLE)));
}

void ADC2_DisplayOnPC(uint16_t val)
{
    printf("0x%x - %d\n", val, (int)val);
}

/**
  * @brief  Display CGRAM on even address
  * @param  address : Display address
  * @param  ptrTable : Pointer a the CGRAM table to be displayed
  * @retval None
  */
static void DisplayCGRAM0(uint8_t address, uint8_t *ptrTable)
{

  uint8_t u = 32; /* Nb byte in the table */

  /* Set CGRAM Address */
  LCD_SendByte(COMMAND_TYPE, (uint8_t)0x40);

  while (u)
  {
    LCD_SendByte(DATA_TYPE, ptrTable[32 - u]);
    u--;
  }

  /* Setup Display Address */
  LCD_SendByte(COMMAND_TYPE, address);
  LCD_SendByte(DATA_TYPE, (uint8_t)0x00);
  LCD_SendByte(DATA_TYPE, (uint8_t)0x00);

}

/**
  * @brief  Display CGRAM on odd address
  * @param  address : Display address
  * @param  ptrTable : Pointer a the CGRAM table to be displayed
  * @retval None
  */
static void DisplayCGRAM1(uint8_t address, uint8_t *ptrTable)
{

  uint8_t u = 32; /* Nb byte in the table */

  /* Set CGRAM Address */
  LCD_SendByte(COMMAND_TYPE, (uint8_t)((uint8_t)0x40 | (uint8_t)0x10));

  while (u)
  {
    LCD_SendByte(DATA_TYPE, ptrTable[32 - u]);
    u--;
  }

  /* Setup Display Address */
  LCD_SendByte(COMMAND_TYPE, (uint8_t)(address + 1));
  LCD_SendByte(DATA_TYPE, (uint8_t)0x00);
  LCD_SendByte(DATA_TYPE, (uint8_t)0x02);

}
/**
  * @}
  */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
