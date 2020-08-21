/**
  ******************************************************************************
  * @file     demo_games.c
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains all the functions for the GAMES demo.
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
#include "demo_games.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
extern uint8_t StrName[16];
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @addtogroup Demo_Functions
  * @{
  */


void GAMES_Reset(void)
{
  /* All leds are off */
  STM_EVAL_LEDOff(LED1);
  STM_EVAL_LEDOff(LED2);
  STM_EVAL_LEDOff(LED3);
  STM_EVAL_LEDOff(LED4);
    
  /* Reset ADC2 peripheral */
  ADC2_DeInit();
}



void GAMES_Exec(void)
{
    JOYState_TypeDef KeyJ = JOY_NONE;
    uint8_t Key = 0x01;
    uint8_t index1;
    uint8_t index2;
    uint8_t index3;
    uint8_t index4;
    uint8_t i;
    uint8_t j;
    uint8_t j1;
    uint8_t j2;
    uint8_t j3;
    uint8_t j4;
    uint8_t occur;
    uint8_t occur_old;

    LCD_SetCursorPos(LCD_LINE1, 0);
    LCD_Print("    CASINO !!   ");
    LCD_SetCursorPos(LCD_LINE2, 0);
    LCD_Print("                ");
    
    STM_EVAL_LEDOn(LED1);
    STM_EVAL_LEDOn(LED2);
    STM_EVAL_LEDOn(LED3);
    STM_EVAL_LEDOn(LED4);
    
    WaitDelay(200);
    
    STM_EVAL_LEDOff(LED1);
    STM_EVAL_LEDOff(LED2);
    STM_EVAL_LEDOff(LED3);
    STM_EVAL_LEDOff(LED4);
    
    Draw(0, 0, 0, 0);
    LCD_SetCursorPos(LCD_LINE2, 0);
    LCD_Print("Use KEY to play ");

    while (Key != 0x00)
    {
        if (ReadJoystick() == JOY_UP)
        {
            LCD_Clear();
            MenuUpdate(JOY_UP);
            return;
        }

        Key = STM_EVAL_PBGetState(BUTTON_KEY);
    }

    while (1)
    {

        Draw(0, 0, 0, 0);

        index1 = 99;
        index2 = 99;
        index3 = 99;
        index4 = 99;
        i = 0;
        j = 0;
        j1 = 0;
        j2 = 0;
        j3 = 0;
        j4 = 0;
        occur = 0;
        occur_old = 0;

        GTimeStamp = 0; /* Need to reset this value, else to big and it slow the screen display */
        GetTimeOutStartTime();

        while ((index1 == 99) || (index2 == 99) || (index3 == 99) || (index4 == 99))
        {

            KeyJ = ReadJoystick();
            if (KeyJ == JOY_UP)
            {
                LCD_Clear();
                MenuUpdate(KeyJ);
                return;
            }

            if (TimeOut(30) == FALSE)
            {
                /* do nothing */
            }
            else
            {
                Draw(j1, j2, j3, j4);
                GTimeStamp = 0;
                GetTimeOutStartTime();
            }

            Key = STM_EVAL_PBGetState(BUTTON_KEY);
            if (Key == 0x00)
            {
                if (index1 == 99)
                {
                    PlayNote(NOTE_FA, 4, 15);
                    index1 = i;
                }
                else
                {
                    if (index2 == 99)
                    {
                        PlayNote(NOTE_SOL, 4, 15);
                        index2 = i;
                    }
                    else
                    {
                        if (index3 == 99)
                        {
                            PlayNote(NOTE_LA, 4, 15);
                            index3 = i;
                        }
                        else
                        {
                            if (index4 == 99)
                            {
                                PlayNote(NOTE_SI, 4, 15);
                                index4 = i;
                            }
                        }
                    }
                }
            }

            i++;
            if (i > 9) i = 0;

            if (index1 == 99) j1 = i;
            else j1 = index1;
            if (index2 == 99) j2 = i;
            else j2 = index2;
            if (index3 == 99) j3 = i;
            else j3 = index3;
            if (index4 == 99) j4 = i;
            else j4 = index4;

        }


        Draw(j1, j2, j3, j4);


        /* Detection how many occurence the user got */
        for (j = 0; j < 10; j++)
        {
            occur = 0;
            if (j == j1) occur++;
            if (j == j2) occur++;
            if (j == j3) occur++;
            if (j == j4) occur++;
            if (occur > occur_old)
            {
                occur_old = occur;
            }
        }

        if ((occur_old == 0) | (occur_old == 1))
        {

            LCD_SetCursorPos(LCD_LINE2, 0);
            LCD_Print(" YOU LOOSE :-(  ");
            PlayNote(NOTE_SOL, 3, 20);
            PlayNote(NOTE_FA, 3, 20);
            PlayNote(NOTE_MI, 3, 20);
            PlayNote(NOTE_RE, 3, 45);
        }
        if (occur_old == 2)
        {
            LCD_SetCursorPos(LCD_LINE2, 0);
            LCD_Print(" YOU WIN : 10$  ");
            PlayNote(NOTE_RE, 3, 20);
            PlayNote(NOTE_MI, 3, 20);
            PlayNote(NOTE_FA, 3, 20);
            PlayNote(NOTE_SOL, 3, 45);
        }
        if (occur_old == 3)
        {
            LCD_SetCursorPos(LCD_LINE2, 0);
            LCD_Print(" YOU WIN : 100$ ");
            PlayNote(NOTE_FA, 3, 15);
            PlayNote(NOTE_LA, 3, 15);
            PlayNote(NOTE_FA, 3, 15);
            PlayNote(NOTE_LA, 3, 15);
            PlayNote(NOTE_SOL, 3, 45);
        }
        if (occur_old == 4)
        {
            LCD_SetCursorPos(LCD_LINE2, 0);
            LCD_Print("JACKPOT: 10000$ ");
            for (i = 0; i < 4; i++)
            {
                PlayNote(NOTE_LA, 5, 10);
                PlayNote(NOTE_SI, 5, 10);
            }
        }
        WaitDelay(300);
    }

}

void Draw(uint8_t fig1, uint8_t fig2, uint8_t fig3,  uint8_t fig4)
{

    LCD_Clear();

    LCD_SetCursorPos(LCD_LINE1, 2);
    sprintf((char*)StrName, "%d", (int)fig1);
    LCD_Print(StrName);
    LCD_SetCursorPos(LCD_LINE1, 3);
    sprintf((char*)StrName, "%d", (int)fig2);
    LCD_Print(StrName);
    LCD_SetCursorPos(LCD_LINE1, 4);
    sprintf((char*)StrName, "%d", (int)fig3);
    LCD_Print(StrName);
    LCD_SetCursorPos(LCD_LINE1, 5);
    sprintf((char*)StrName, "%d", (int)fig4);
    LCD_Print(StrName);
    
    //Just to force the LCD to swith to line2
    LCD_SetCursorPos(LCD_LINE2, 2);

}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
