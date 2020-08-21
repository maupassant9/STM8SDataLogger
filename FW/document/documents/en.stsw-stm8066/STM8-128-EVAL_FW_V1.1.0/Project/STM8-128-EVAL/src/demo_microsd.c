/**
  ******************************************************************************
  * @file     demo_microsd.c
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains all the functions for the MICROSD demo.
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
#include "demo_microsd.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
extern uint8_t StrName[16];
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

bool MicroSD_Plugged = FALSE;

/**
  * @addtogroup Demo_Functions
  * @{
  */

void MICROSDDEMO_Reset(void)
{
    /* All leds are Off*/
    STM_EVAL_LEDOff(LED1);
    STM_EVAL_LEDOff(LED2);
    STM_EVAL_LEDOff(LED3);
    STM_EVAL_LEDOff(LED4);
}

void MICROSDDEMO_Exec(void)
{
  JOYState_TypeDef Key;
  uint8_t status = 0,SD_ERROR = 0;
  static uint8_t Buffer_Block[SD_BLOCK_SIZE];
  uint16_t address = 0;
  uint8_t address_interval = 0;
  uint16_t i = 0;

  LCD_Clear();

  if (SD_Detect() != SD_PRESENT)
  {
    LCD_SetCursorPos(LCD_LINE1, 0);
    LCD_Print("     Please     ");
    LCD_SetCursorPos(LCD_LINE2, 0);
    LCD_Print(" Insert MicroSD");
    
    PlayTunePWM(16000, 200);
    while (SD_Detect() != SD_PRESENT)
    {
      /* Wait MicroSD card insertion or Joystick action to end */
       Key = ReadJoystick();
       if (Key == JOY_UP)
       {
          MenuUpdate(Key);
          return;
        }
    }
  }

  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print("  MicroSD card  ");
  LCD_SetCursorPos(LCD_LINE2, 0);
  LCD_Print("    detected    ");
   
  STM_EVAL_LEDOn(LED1);
    
  PlayMelody("4.da");
  WaitDelay(100);

  LCD_Clear();
  /* Disable LCD interface*/
  LCD_NCS_LOW();
  
  /* Init MicroSD */
  status = SD_Init();
  
  /* Init SPI for LCD display */
  SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_64, SPI_MODE_MASTER, 
           SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_2EDGE, SPI_DATADIRECTION_1LINE_TX, 
           SPI_NSS_SOFT, 0x07);
  SPI_Cmd(ENABLE);
  
  WaitDelay(100);
  
  /* Enable LCD interface */
  LCD_NCS_LOW();
  LCD_Clear();
  
  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print("      Init      ");
  if (status == SD_RESPONSE_NO_ERROR)
  {
    LCD_SetCursorPos(LCD_LINE2, 0);
    LCD_Print("      PASS      ");
    
    STM_EVAL_LEDOn(LED2);
    PlayNote(NOTE_RE, 4, 100);
  }
  else
  {
    LCD_SetCursorPos(LCD_LINE2, 0);
    LCD_Print("      FAIL      ");
        
    PlayNote(NOTE_DO, 3, 200);
    
    MenuUpdate(JOY_UP);
    return;
  }
  /* Write block into MicroSD */
  LCD_Clear();
  /* Disable LCD interface*/
  LCD_NCS_LOW();
  
  /* SD_SPI Configuration */
  SPI_Init( SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_4, SPI_MODE_MASTER,
           SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_2EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX,
           SPI_NSS_SOFT, 0x07);
  /* SD_SPI enable */
  SPI_Cmd( ENABLE);
    
  for (i = 0; i < SD_BLOCK_SIZE; i++)
  {
     Buffer_Block[i] = (uint8_t)i;
  }
  
  status = SD_WriteBlock(Buffer_Block, (uint32_t)0, SD_BLOCK_SIZE);
    
  /* Init SPI for LCD display */
  SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_64, SPI_MODE_MASTER, 
           SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_2EDGE, SPI_DATADIRECTION_1LINE_TX, 
           SPI_NSS_SOFT, 0x07);
  SPI_Cmd(ENABLE);
  
  WaitDelay(100);
  
  /* Enable LCD interface */
  LCD_NCS_HIGH();
  LCD_Clear();
  
  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print("  Write Block   ");
  if (status == SD_RESPONSE_NO_ERROR)
  {
    LCD_SetCursorPos(LCD_LINE2, 0);
    LCD_Print("      PASS      ");
    
    STM_EVAL_LEDOn(LED3);
      
    PlayNote(NOTE_RE, 4, 100);
  }
  else
  {
    LCD_SetCursorPos(LCD_LINE2, 0);
    LCD_Print("      FAIL      ");
    
    PlayNote(NOTE_DO, 3, 200);
    MenuUpdate(JOY_UP);
    return;
  }
  /* Delay to display */
  WaitDelay(100);

  /* Read block from MicroSD */
  LCD_Clear();
  /* Disable LCD interface*/
  LCD_NCS_LOW();
  
  /* SD_SPI Configuration */
  SPI_Init( SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_4, SPI_MODE_MASTER,
           SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_2EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX,
           SPI_NSS_SOFT, 0x07);
  /* SD_SPI enable */
  SPI_Cmd( ENABLE);
  
  for (i = 0; i < SD_BLOCK_SIZE; i++)
  {
    Buffer_Block[i] = 0;
  }
  status = SD_ReadBlock(Buffer_Block, (uint32_t)0, SD_BLOCK_SIZE);
  
  /* Init SPI for LCD display */
  SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_64, SPI_MODE_MASTER, 
           SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_2EDGE, SPI_DATADIRECTION_1LINE_TX, 
           SPI_NSS_SOFT, 0x07);
  SPI_Cmd(ENABLE);
  
  WaitDelay(100);
  
  /* Enable LCD interface */
  LCD_NCS_HIGH();
  LCD_Clear();
  
  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print("   Read Block   ");
  
  if (status == SD_RESPONSE_NO_ERROR)
  {
    LCD_SetCursorPos(LCD_LINE2, 0);
    LCD_Print("      PASS      ");

    SD_ERROR = 0;
    i=0;
    while ((!SD_ERROR)&& (i < SD_BLOCK_SIZE))
    {
      if (Buffer_Block[i] != (uint8_t)i)
       {
         SD_ERROR = 1;
       }
       else
       {
         i++;
       }
    }
    STM_EVAL_LEDOn(LED4);
    PlayNote(NOTE_RE, 4, 100);
  }
  else
  {
    LCD_SetCursorPos(LCD_LINE2, 0);
    LCD_Print("      FAIL      ");
  
    PlayNote(NOTE_DO, 3, 200);
  
    MenuUpdate(JOY_UP);
    return;
  }
  /* Delay to display */
  WaitDelay(100);

  /* Data verification */
  LCD_Clear();
  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print("  DATA Check   ");

  if (SD_ERROR)
  {
    LCD_SetCursorPos(LCD_LINE2, 0);
    LCD_Print("      FAIL      ");
  }
  else
  {
    LCD_SetCursorPos(LCD_LINE2, 0);
    LCD_Print("      PASS      ");
  }
  
  /* Delay to display */
  WaitDelay(200);

  /* Navigate into read buffer */
  LCD_Clear();
  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print(" LEFT or RIGHT  ");
  LCD_SetCursorPos(LCD_LINE2, 0);
  LCD_Print("  to see data   ");

  WaitDelay(200);

  MicroSD_Plugged = TRUE; /* Set to False in interrupt routine if MicroSD is removed */
  address = 0;
  address_interval = 1;

  while (MicroSD_Plugged == TRUE)
  {
    Key = ReadJoystick();
    if ((Key == JOY_LEFT) || (Key == JOY_RIGHT) || (Key == JOY_DOWN))
    {
      if (Key == JOY_DOWN)
       {
         if (address_interval == 1)
          {
            address_interval = 0x10;
          }
         else
          {
            address_interval = 1;
          }
        }
      if (Key == JOY_LEFT)
      {
         address -= address_interval;
         if (address > 0x01FF)
         {
           address = 0x01FF;
         }
      }
      else
      {
        address += address_interval;
        if (address > 0x01FF)
         {
           address = 0;
         }
      }
      
      LCD_Clear();
      /* Display address on the first LCD line */
      LCD_SetCursorPos(LCD_LINE1, 0);
      LCD_Print("Addr:           ");
      sprintf((char*)StrName, ":0x%x", address);
      LCD_SetCursorPos(LCD_LINE1, 2);
      LCD_Print(StrName);
    
      /* Display buffer content on second LCD line */
      LCD_SetCursorPos(LCD_LINE2, 0);
      LCD_Print("Data:           ");
      sprintf((char*)StrName, ":0x%x", Buffer_Block[address]);
      LCD_SetCursorPos(LCD_LINE2, 2);
      LCD_Print(StrName);
    }
    if (Key == JOY_UP)
    {
      MenuUpdate(Key);
      return;
    }
  }

  LCD_Clear();
  LCD_SetCursorPos(LCD_LINE1, 0);
  LCD_Print("  MicroSD card  ");
  LCD_SetCursorPos(LCD_LINE2, 0);
  LCD_Print("    removed     ");

  PlayMelody("4.ad");
  WaitDelay(100);
  MenuUpdate(JOY_UP);
}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
