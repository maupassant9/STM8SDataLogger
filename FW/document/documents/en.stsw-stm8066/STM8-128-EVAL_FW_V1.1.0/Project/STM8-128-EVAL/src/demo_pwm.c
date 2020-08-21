/**
  ******************************************************************************
  * @file     demo_pwm.c
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains all the functions for the PWM demo.
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
#include "demo_pwm.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

#define NB_NOTES (15)
#define DUMMY_POS (99)

/* Syntax:
  lower-case letters = quarter note
  upper-case letters = half note (different from buzzer file syntax --> no sharp sound)
  * = end melody, play once
  8 = end melody, play in loop
 */
CONST uint8_t DISP_NOTES[] =
    {'a', 'A', 'b', 'B', 'c', 'C', 'd', 'D',
     'e', 'E', 'f', 'F', 'g', 'G', 's', 'S',
     MELODY_END_CHAR, MELODY_LOOP_CHAR
    };

uint8_t Notes[NB_NOTES];
uint8_t NotesPos[NB_NOTES];
uint8_t NoteIndex = 0;
uint8_t NoteIndex_old = 0;
uint8_t ModifEnabled = 0;
bool ResetNotes = TRUE;
uint8_t CurrPos = 0;
uint8_t MaxPos = 0;

/**
  * @addtogroup Demo_Functions
  * @{
  */

void PWMDEMO_Reset(void)
{
  /* All leds are off */
  STM_EVAL_LEDOff(LED1);
  STM_EVAL_LEDOff(LED2);
  STM_EVAL_LEDOff(LED3);
  STM_EVAL_LEDOff(LED4);
    
  /* Reset ADC2 peripheral */
  ADC2_DeInit();
}

void PWMDEMO1_Exec(void)
{
  JOYState_TypeDef KeyJ = JOY_NONE;
  uint8_t KeyB = 0;
  uint16_t Conversion_Value = 0;
  uint8_t i = 0;

  /* Init ADC to enter melody */
  ADC2_DeInit();

  ADC2_Init(ADC2_CONVERSIONMODE_CONTINUOUS, ADC2_CHANNEL_9, ADC2_PRESSEL_FCPU_D2,
            ADC2_EXTTRIG_TIM, DISABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_CHANNEL9,
            DISABLE);
  
  ADC2_Cmd(ENABLE);
  
  ADC2_StartConversion();

  NoteIndex_old = DUMMY_POS;

  if (ResetNotes == TRUE) /* This is done one time only */
  {
    ModifEnabled = 1;
    if ((GUseEeprom == 1) && (EEPBuffer[0] == PWM_DEMO1_MELODY))
    {
     /* The first byte in EEPBuffer must be removed */
     for (i = 0; i < 15; i++)
     {
       Notes[i] = EEPBuffer[i + 1];
     }
    MaxPos = PwmCalcMaxPos();
    CurrPos = MaxPos;
    }
    else
    {
       PwmResetNotes();
    }
    ResetNotes = FALSE;
  }
  else
  {
    ModifEnabled = 0;
    CurrPos = 0;
    MaxPos = PwmCalcMaxPos();
  }

  LCD_Clear();

  PwmDisplayNotesPos(CurrPos);
  PwmDisplayNotes();

  while (1)
  {
   /* Read ADC */
   if (ADC2_GetFlagStatus() && (ModifEnabled != 0))
   {
     Conversion_Value = ADC2_GetConversionValue();
     NoteIndex = (uint8_t)(Conversion_Value / 57); /* 1024 / 18 = 56.88 */
     if (NoteIndex != NoteIndex_old)
     {
       NoteIndex_old = NoteIndex;
       Notes[CurrPos] = DISP_NOTES[NoteIndex];
       PwmDisplayNotes();
      }
   }

   KeyB = STM_EVAL_PBGetState(BUTTON_KEY);
   if (KeyB == 0)
   {
     ModifEnabled ^= 0x01;
     PwmDisplayNotesPos(CurrPos);
   }

   KeyJ = ReadJoystick();

   if (KeyJ == JOY_UP)
   {
    /* Save last melody selected in external eeprom */
     if (GUseEeprom == 1)
     {
       LCD_Clear();
       LCD_SetCursorPos(LCD_LINE1, 0);
       LCD_Print(" Save melody ?  ");
       LCD_SetCursorPos(LCD_LINE2, 0);
       LCD_Print(" KEY= YES UP= NO");
       KeyB = 0x1;
       KeyJ = JOY_NONE;
       while ((KeyB != 0x00) && (KeyJ != JOY_UP))
       {
         KeyB = STM_EVAL_PBGetState(BUTTON_KEY);
         KeyJ = ReadJoystick();
       }
       if (KeyB == 0x00)
       {
         LCD_Clear();
         LCD_SetCursorPos(LCD_LINE1, 0);
         LCD_Print("  Save melody   ");
         EEPBuffer[0] = PWM_DEMO1_MELODY; /* Use to identify the melody afterwards */
         for (i=0; i<16; i++)
         {
           EEPBuffer[i+1] = Notes[i];
         }
         Write_Eeprom();
         LCD_SetCursorPos(LCD_LINE2, 0);
         LCD_Print("      OK        ");
         WaitDelay(150);
       }
     }
     MenuUpdate(JOY_UP);
     return;
   }

   if (KeyJ == JOY_SEL)
   {
     if ((CurrPos == (NB_NOTES - 1)) || (Notes[CurrPos] == MELODY_END_CHAR) ||
                    (Notes[CurrPos] == MELODY_LOOP_CHAR))
     {
       LCD_Clear();
       LCD_SetCursorPos(LCD_LINE1, 0);
       LCD_Print("     Play...    ");
       WaitDelay(100);

       PwmCleanNotes();
       PwmDisplayNotes();

       PwmPlayMelody(Notes, 1);

       LCD_Clear();
       LCD_SetCursorPos(LCD_LINE1, 0);
       PwmDisplayNotesPos(CurrPos);

     }
     else
     {
       if (ModifEnabled != 0)
        {
          CurrPos++; /* Note is validated, go to next one */
          MaxPos++;
          NoteIndex_old = DUMMY_POS;
          PwmDisplayNotesPos(CurrPos);
        }
     }
   }
   if (KeyJ == JOY_LEFT)
   {
     if (CurrPos > 0)
     {
       CurrPos--;
       PwmDisplayNotesPos(CurrPos);
      }
   }

   if (KeyJ == JOY_RIGHT)
   {
     if ((CurrPos < (NB_NOTES - 1)) && (CurrPos < MaxPos))
     {
       CurrPos++;
       PwmDisplayNotesPos(CurrPos);
      }
   }
 } /* while */
}

void PWMDEMO2_Exec(void)
{

    JOYState_TypeDef KeyJ = JOY_NONE;
    uint8_t KeyB = 0x01;
    Melody_TypeDef *pMelody;
    static Melody_TypeDef *pMelody_old;
    uint8_t max = 0;
    uint8_t melody_index = 0;
    uint8_t i = 0;

    LCD_Clear();
    LCD_SetCursorPos(LCD_LINE1, 0);
    LCD_Print(" Select Melody  ");

    /* Search how many melodies are present */
    pMelody = (Melody_TypeDef *)MELODIES;
    max = 0;
    while (pMelody->Name != 0)
    {
        max++;
        pMelody++;
    }

    pMelody = (Melody_TypeDef *)MELODIES;
    pMelody_old = (Melody_TypeDef *)MELODIES + 1;
    melody_index = 0;

    while (1)
    {

        if (pMelody != pMelody_old)
        {
            LCD_SetCursorPos(LCD_LINE2, 0);
            LCD_Print(pMelody->Name);
            pMelody_old = pMelody;
        }

        KeyJ = ReadJoystick();
        /*******************/

        if (KeyJ == JOY_UP)
        {
            /* Save last melody selected in external eeprom */
            if (GUseEeprom == 1)
            {
                LCD_Clear();
                LCD_SetCursorPos(LCD_LINE1, 0);
                LCD_Print(" Save melody ?  ");
                LCD_SetCursorPos(LCD_LINE2, 0);
                LCD_Print(" KEY= YES UP= NO");
                KeyB = 0x01;
                KeyJ = JOY_NONE;
                while ((KeyB != 0x00) && (KeyJ != JOY_UP))
                {
                    KeyB = STM_EVAL_PBGetState(BUTTON_KEY);
                    KeyJ = ReadJoystick();
                }
                if (KeyB == 0x00)
                {
                    LCD_Clear();
                    LCD_SetCursorPos(LCD_LINE1, 0);
                    LCD_Print("  Save melody   ");
                    EEPBuffer[0] = melody_index; /* Use to identify the melody afterwards */
                    for (i=0; i<16; i++)
                    {
                        EEPBuffer[i+1] = MELODY_NOTUSED_CHAR;
                    }
                    Write_Eeprom();
                    LCD_SetCursorPos(LCD_LINE2, 0);
                    LCD_Print("      OK        ");
                    WaitDelay(150);
                }
            }
            MenuUpdate(JOY_UP);
            return;
        }

        if (KeyJ == JOY_LEFT)
        {
            if (pMelody == MELODIES) /* begin of list */
            {
                pMelody = (Melody_TypeDef *)MELODIES + (max - 1); /* point to last melody */
                melody_index = (uint8_t)(max - 1);
            }
            else
            {
                pMelody--;
                melody_index--;
            }
        }

        if (KeyJ == JOY_RIGHT)
        {
            pMelody++;
            melody_index++;
            if (pMelody->Name == 0) /* end of list */
            {
                pMelody = (Melody_TypeDef *)MELODIES; /* point to the first melody */
                melody_index = 0;
            }
        }

        if (KeyJ == JOY_SEL)
        {

            LCD_SetCursorPos(LCD_LINE1, 0);
            LCD_Print("    Play...     ");

            PlayMelody(pMelody->Notes);

            LCD_SetCursorPos(LCD_LINE1, 0);
            LCD_Print(" Select Melody  ");

        }

    }
}

void PwmDisplayNotes(void)
{
    LCD_SetCursorPos(LCD_LINE2, 0);
    LCD_Print(Notes);
}

void PwmDisplayNotesPos(uint8_t pos)
{
    uint8_t i = 0;
    if (pos > (NB_NOTES - 1))
    {
        pos = (NB_NOTES - 1);
    }
    for (i = 0; i < NB_NOTES; i++)
    {
        NotesPos[i] = ' ';
    }
    if (ModifEnabled == 0)
    {
        NotesPos[pos] = 'x';
    }
    else
    {
        NotesPos[pos] = 'o';
    }
    
    LCD_SetCursorPos(LCD_LINE1, 0);
    LCD_Print(NotesPos);
}

uint8_t PwmCalcMaxPos(void)
{
    uint8_t i;
    uint8_t val = 0;
    for (i = 0; i < NB_NOTES; i++)
    {
        if (Notes[i] != MELODY_NOTUSED_CHAR)
        {
            val++;
        }
    }
    return (uint8_t)(val - 1);
}

void PwmResetNotes(void)
{
    uint8_t i;
    for (i = 0; i < NB_NOTES; i++)
    {
        Notes[i] = MELODY_NOTUSED_CHAR;
    }
    CurrPos = 0;
    MaxPos = 0;
}

void PwmCleanNotes(void)
{

    uint8_t i = 0;
    uint8_t j;

    while ((Notes[i] != MELODY_END_CHAR) && (Notes[i] != MELODY_LOOP_CHAR) && (i < NB_NOTES))
    {
        i++;
    }

    if (i < (NB_NOTES - 1))
    {
        for (j = (uint8_t)(i + 1); j < NB_NOTES; j++)
        {
            Notes[j] = MELODY_NOTUSED_CHAR;
        }
        CurrPos = i;
        MaxPos = i;
    }
    else
    {
        CurrPos = (NB_NOTES - 1);
        MaxPos = (NB_NOTES - 1);
    }

}

void PwmPlayMelody(uint8_t *notes, uint8_t dn)
{

    uint8_t pos = 0;
    uint8_t octave = 4;
    uint16_t duration;
    uint16_t duration_short = DURATION_2;
    uint16_t duration_long = DURATION_3;
    uint8_t *pNote;
    uint8_t note_to_play = 0;
    JOYState_TypeDef KeyJ = JOY_NONE;
    uint8_t Counter = 0;

    pNote = notes;

    while (1)
    {

        if (dn == 1)
        {
            PwmDisplayNotesPos(pos);
        }
#ifdef ENABLE_MELODY_CALLBACK
        else
        {
            MelodyCallBack();
        }
#endif

        if ((pNote[0] == MELODY_END_CHAR) || (pNote[0] == MELODY_LOOP_CHAR))
        {
            return;
        }

        if (*pNote > (uint8_t)0x60) /* lower-case letters */
        {
            duration = duration_short;
            note_to_play = *pNote;
        }
        else /* upper-case letters */
        {
            duration = duration_long;
            note_to_play = (uint8_t)(*pNote + (uint8_t)0x20); /* Change in lower-case */
        }

        /* The note letter is changed in lower-case */
        PlayNote(note_to_play, octave, duration);

        pNote++;
        pos++;

        if (*pNote == MELODY_END_CHAR) /* end melody */
        {
            return;
        }

        if ((*pNote == MELODY_LOOP_CHAR) || (*pNote == MELODY_NULL_CHAR)) /* loop melody */
        {
            pNote = notes;
            pos = 0;
            switch (Counter)
            {
            case 0:
                octave = 3;
                duration_short = DURATION_2;
                duration_long = DURATION_3;
                break;
            case 1:
                octave = 4;
                duration_short = DURATION_3;
                duration_long = DURATION_4;
                break;
            case 2:
                octave = 3;
                duration_short = DURATION_3;
                duration_long = DURATION_4;
                break;
            case 3:
                octave = 4;
                duration_short = DURATION_1;
                duration_long = DURATION_2;
                break;
            case 4:
                octave = 3;
                duration_short = DURATION_1;
                duration_long = DURATION_2;
                break;
            case 5:
                octave = 4;
                duration_short = DURATION_1;
                duration_long = DURATION_1;
                break;
            default:
                Counter = 0;
                octave = 4;
                duration_short = DURATION_2;
                duration_long = DURATION_3;
                break;
            }
            Counter++;
        }

        /* Exit melody */
        KeyJ = ReadJoystick();
        if (KeyJ != JOY_NONE)
        {
            return;
        }

    }

}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
