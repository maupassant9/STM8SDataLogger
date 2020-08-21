/**
  ******************************************************************************
  * @file     menu.c
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains all the functions for the menu demo.
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
  * <h2><center>&copy; COPYJOY_RIGHT 2009 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "menu.h"
#include "functions.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/
#define MENU_TOP_TEXT        ("   ** MENU **   ")
#define HELP_TEXT            ("HELP - push JOY_SEL ")
#define ADC2_DEMO_TEXT       ("    ADC DEMO    ")
#define TIMER_DEMO_TEXT      ("   TIMER DEMO   ")
#define PWM_DEMO_TEXT        ("    PWM DEMO    ")
#define BEEPER_DEMO_TEXT     ("  BEEPER DEMO   ")
#define MICROSD_DEMO_TEXT    ("  MICROSD DEMO  ")
#define GAMES_TEXT           ("     GAME       ")
#define ABOUT_TEXT           ("     ABOUT      ")
#define ADC2_DEMO1_TEXT      ("   ADC DEMO 1   ")
#define ADC2_DEMO2_TEXT      ("   ADC DEMO 2   ")
#define ADC2_DEMO3_TEXT      ("   ADC DEMO 3   ")
#define PWM_DEMO1_TEXT       ("   PWM DEMO 1   ")
#define PWM_DEMO2_TEXT       ("   PWM DEMO 2   ")
#define SYSTEM_TEXT          ("     SYSTEM     ")

CONST MENU_NEXTSTATE_T MENU_NEXTSTATE[] =
    {
        /* STATE                     INPUT           NEXT STATE */
        /* MENU Level 1 */         /* Key */
        { HELP,                      JOY_LEFT,           ABOUT },
        { HELP,                      JOY_RIGHT,          ADC2_DEMO },
        { HELP,                      JOY_SEL,            EXE_HELP },
        { ADC2_DEMO,                 JOY_LEFT,           HELP },
        { ADC2_DEMO,                 JOY_RIGHT,          TIMER_DEMO },
        { ADC2_DEMO,                 JOY_SEL,            ADC2_DEMO1 },
        { TIMER_DEMO,                JOY_LEFT,           ADC2_DEMO },
        { TIMER_DEMO,                JOY_RIGHT,          PWM_DEMO },
        { TIMER_DEMO,                JOY_SEL,            EXE_TIMER_DEMO },
        { PWM_DEMO,                  JOY_LEFT,           TIMER_DEMO },
        { PWM_DEMO,                  JOY_RIGHT,          BEEPER_DEMO },
        { PWM_DEMO,                  JOY_SEL,            PWM_DEMO1 },
        { BEEPER_DEMO,               JOY_LEFT,           PWM_DEMO },
        { BEEPER_DEMO,               JOY_RIGHT,          MICROSD_DEMO },
        { BEEPER_DEMO,               JOY_SEL,            EXE_BEEPER_DEMO },
        { MICROSD_DEMO,              JOY_LEFT,           BEEPER_DEMO },
        { MICROSD_DEMO,              JOY_RIGHT,          GAMES_DEMO },
        { MICROSD_DEMO,              JOY_SEL,            EXE_MICROSD_DEMO },
        { GAMES_DEMO,                JOY_LEFT,           MICROSD_DEMO },
        { GAMES_DEMO,                JOY_RIGHT,          SYSTEM_DEMO },
        { GAMES_DEMO,                JOY_SEL,            EXE_GAMES },
        { SYSTEM_DEMO,               JOY_LEFT,           GAMES_DEMO },
        { SYSTEM_DEMO,               JOY_RIGHT,          ABOUT },
        { SYSTEM_DEMO,               JOY_SEL,            EXE_SYSTEM },
        { ABOUT,                     JOY_LEFT,           SYSTEM_DEMO },
        { ABOUT,                     JOY_RIGHT,          HELP },
        { ABOUT,                     JOY_SEL,            EXE_ABOUT },
        /* ADC DEMO menu Level 2 */
        { ADC2_DEMO1,                JOY_UP,             ADC2_DEMO },
        { ADC2_DEMO1,                JOY_LEFT,           ADC2_DEMO3 },
        { ADC2_DEMO1,                JOY_RIGHT,          ADC2_DEMO2 },
        { ADC2_DEMO1,                JOY_SEL,            EXE_ADC2_DEMO1 },
        { ADC2_DEMO2,                JOY_UP,             ADC2_DEMO },
        { ADC2_DEMO2,                JOY_LEFT,           ADC2_DEMO1 },
        { ADC2_DEMO2,                JOY_RIGHT,          ADC2_DEMO3 },
        { ADC2_DEMO2,                JOY_SEL,            EXE_ADC2_DEMO2 },
        { ADC2_DEMO3,                JOY_UP,             ADC2_DEMO },
        { ADC2_DEMO3,                JOY_LEFT,           ADC2_DEMO2 },
        { ADC2_DEMO3,                JOY_RIGHT,          ADC2_DEMO1 },
        { ADC2_DEMO3,                JOY_SEL,            EXE_ADC2_DEMO3 },
        /* PWM DEMO menu Level 2 */
        { PWM_DEMO1,                 JOY_UP,             PWM_DEMO },
        { PWM_DEMO1,                 JOY_LEFT,           PWM_DEMO2 },
        { PWM_DEMO1,                 JOY_RIGHT,          PWM_DEMO2 },
        { PWM_DEMO1,                 JOY_SEL,            EXE_PWM_DEMO1 },
        { PWM_DEMO2,                 JOY_UP,             PWM_DEMO },
        { PWM_DEMO2,                 JOY_LEFT,           PWM_DEMO1 },
        { PWM_DEMO2,                 JOY_RIGHT,          PWM_DEMO1 },
        { PWM_DEMO2,                 JOY_SEL,            EXE_PWM_DEMO2 },
        /* EXE menu */
        { EXE_ABOUT,                 JOY_UP,             ABOUT },
        { EXE_HELP,                  JOY_UP,             HELP },
        { EXE_TIMER_DEMO,            JOY_UP,             TIMER_DEMO },
        { EXE_PWM_DEMO1,             JOY_UP,             PWM_DEMO1 },
        { EXE_PWM_DEMO2,             JOY_UP,             PWM_DEMO2 },
        { EXE_BEEPER_DEMO,           JOY_UP,             BEEPER_DEMO },
        { EXE_MICROSD_DEMO,          JOY_UP,             MICROSD_DEMO },
        { EXE_ADC2_DEMO1,            JOY_UP,             ADC2_DEMO1 },
        { EXE_ADC2_DEMO2,            JOY_UP,             ADC2_DEMO2 },
        { EXE_ADC2_DEMO3,            JOY_UP,             ADC2_DEMO3 },
        { EXE_GAMES,                 JOY_UP,             GAMES_DEMO },
        { EXE_SYSTEM,                JOY_UP,             SYSTEM_DEMO },
        /* End of table */
        { (STATE_ID_T)0, (JOYState_TypeDef)0,              (STATE_ID_T)0, }
    };

CONST MENU_STATE_T MENU_STATE[] =
    {
        /* STATE                     STATE TEXT            FUNCTION */
        /* MENU Level 1 */
        { HELP,                      HELP_TEXT,            0 },
        { ADC2_DEMO,                  ADC2_DEMO_TEXT,        0 },
        { TIMER_DEMO,                TIMER_DEMO_TEXT,      TIMERDEMO_Reset },
        { PWM_DEMO,                  PWM_DEMO_TEXT,        0 },
        { BEEPER_DEMO,               BEEPER_DEMO_TEXT,     BEEPERDEMO_Reset },
        { MICROSD_DEMO,              MICROSD_DEMO_TEXT,    MICROSDDEMO_Reset },
        { GAMES_DEMO,                GAMES_TEXT,           GAMES_Reset },
        { SYSTEM_DEMO,               SYSTEM_TEXT,          0 },
        { ABOUT,                     ABOUT_TEXT,           0 },
        /* ADC DEMO menu level 2 */
        { ADC2_DEMO1,                 ADC2_DEMO1_TEXT,       ADC2DEMO_Reset },
        { ADC2_DEMO2,                 ADC2_DEMO2_TEXT,       ADC2DEMO_Reset },
        { ADC2_DEMO3,                 ADC2_DEMO3_TEXT,       ADC2DEMO_Reset },
        /* PWM DEMO level 2 */
        { PWM_DEMO1,                 PWM_DEMO1_TEXT,       PWMDEMO_Reset },
        { PWM_DEMO2,                 PWM_DEMO2_TEXT,       PWMDEMO_Reset },
        /* EXE menu */
        { EXE_HELP,                  0,                    HELP_Exec },
        { EXE_ABOUT,                 0,                    ABOUT_Exec },
        { EXE_TIMER_DEMO,            0,                    TIMERDEMO_Exec },
        { EXE_PWM_DEMO1,             0,                    PWMDEMO1_Exec },
        { EXE_PWM_DEMO2,             0,                    PWMDEMO2_Exec },
        { EXE_BEEPER_DEMO,           0,                    BEEPERDEMO_Exec },
        { EXE_MICROSD_DEMO,          0,                    MICROSDDEMO_Exec },
        { EXE_ADC2_DEMO1,             0,                    ADC2DEMO1_Init },
        { EXE_ADC2_DEMO2,             0,                    ADC2DEMO2_Init },
        { EXE_ADC2_DEMO3,             0,                    ADC2DEMO3_Init },
        { EXE_GAMES,                 0,                    GAMES_Exec },
        { EXE_SYSTEM,                0,                    SYSTEM_Exec },
        /* End of table */
        { (STATE_ID_T)0,                         0,                    0 }
    };

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
STATE_ID_T PreviousTopState, State;
void (*pStateFunc)(void);

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Initializes the navigation menu.
  * @param  None
  * @retval None
  */
void MenuInit(void)
{
  PreviousTopState = (STATE_ID_T)0;
  State = HELP;
  pStateFunc = 0;
}

/**
  * @brief  Updates the menu states and displays the new menu on the LCD.
  * @param  ujoystick: new joystick state
  * @retval None
  */
void MenuUpdate(JOYState_TypeDef ujoystick)
{
  uint8_t i = 0;
  STATE_ID_T NextState = (STATE_ID_T)0;

  /* Search if the next menu state exists */
  for (i = 0; MENU_NEXTSTATE[i].State; i++)
  {
    if (MENU_NEXTSTATE[i].State == State && MENU_NEXTSTATE[i].Key == ujoystick)
    {
      NextState = MENU_NEXTSTATE[i].NextState;
      break;
    }
  }

  /* if next state exists */
  if (NextState)
  {
    /* Update the previous top state */
    switch (ujoystick)
    {
      case JOY_UP:
        PreviousTopState = (STATE_ID_T)0;
        for (i = 0; MENU_NEXTSTATE[i].State; i++)
        {
          if ((MENU_NEXTSTATE[i].State == NextState) && (MENU_NEXTSTATE[i].Key == JOY_UP))
          {
            PreviousTopState = MENU_NEXTSTATE[i].NextState;
            break;
          }
        }
        break;

      case JOY_SEL:
        /* If a sub-menu is entered, the PreviousTopState is the current state */
        PreviousTopState = State;
        break;

      default:
        break;
    }
    State = NextState; /* Update current state */

    MenuDisplay(); /* Display the new menu on LCD */

    /* Execute the function of state if there is one*/
    for (i = 0; MENU_STATE[i].State; i++)
    {
      if (MENU_STATE[i].State == State)
      {
        pStateFunc = MENU_STATE[i].pFunc;
        if (pStateFunc) /* Check if there is a state function to be executed */
        {
          pStateFunc(); /* Execute the state function */
          pStateFunc = 0;
        }
      }
    }
  }
}

/**
  * @brief  Displays the current menu level on the LCD
  * @param  None
  * @retval None
  */
void MenuDisplay(void)
{
  uint8_t i = 0;

  /* Clear LCD */
  LCD_Clear();
  
  WaitDelay(80);
  /* Display menu line 1 */
  if (PreviousTopState)
  {
    for (i = 0; MENU_STATE[i].State; i++)
    {
      if (MENU_STATE[i].State == PreviousTopState)
      {
        if (MENU_STATE[i].pText)
        {

          LCD_SetCursorPos(LCD_LINE1, 0);
          LCD_Print((uint8_t *)MENU_STATE[i].pText);
        }
        break;
      }
    }
  }
  else
  {
    /* Menu top level reached */
    LCD_SetCursorPos(LCD_LINE1, 0);
    LCD_Print(MENU_TOP_TEXT);
  }
  
  /* Display menu line 2 */
  for (i = 0; MENU_STATE[i].State; i++)
  {
    if (MENU_STATE[i].State == State)
    {
      if (MENU_STATE[i].pText)
      {
        LCD_SetCursorPos(LCD_LINE2, 0);
        LCD_Print((uint8_t *)MENU_STATE[i].pText);
      }
      break;
    }
  }
}

/******************* (C) COPYJOY_RIGHT 2009 STMicroelectronics *****END OF FILE****/
