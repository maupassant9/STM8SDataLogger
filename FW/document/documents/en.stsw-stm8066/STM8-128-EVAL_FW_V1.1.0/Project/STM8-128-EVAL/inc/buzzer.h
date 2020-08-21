/**
  ******************************************************************************
  * @file     demo_help.h
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains buzzer functions prototypes.
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __BUZZER_H
#define __BUZZER_H

/* Includes ------------------------------------------------------------------*/
#include "functions.h"

/* Exported types ------------------------------------------------------------*/
typedef struct
{
    uint8_t Letter;
    uint16_t Freq;
    uint16_t Duration;
}
Note_TypeDef;

typedef struct
{
    uint8_t *Name;
    uint8_t *Notes;
}
Melody_TypeDef;

/* Exported constants --------------------------------------------------------*/
#define DURATION_1 (15) /* 75ms */
#define DURATION_2 ((DURATION_1) << 1)
#define DURATION_3 ((DURATION_2) << 1)
#define DURATION_4 ((DURATION_3) << 1)

/* Total number of melodies defined */
#define NB_MELODIES ((uint8_t)12)

/* Notes naming:
   - lower-case letter = normal note
   - upper-case letter = sharp note
 */

#define NOTE_DO   ('c')
#define NOTE_C    NOTE_DO

#define NOTE_DOd  ('C')
#define NOTE_Cs   NOTE_Cs

#define NOTE_RE   ('d')
#define NOTE_D    NOTE_RE

#define NOTE_REd  ('D')
#define NOTE_Ds   NOTE_REd

#define NOTE_MI   ('e')
#define NOTE_E    NOTE_MI

#define NOTE_FA   ('f')
#define NOTE_F    NOTE_FA

#define NOTE_FAd  ('F')
#define NOTE_Fs   NOTE_FAd

#define NOTE_SOL  ('g')
#define NOTE_G    NOTE_SOL

#define NOTE_SOLd ('G')
#define NOTE_Gs   NOTE_SOLd

#define NOTE_LA   ('a')
#define NOTE_A    NOTE_LA

#define NOTE_LAd  ('A')
#define NOTE_As   NOTE_LAd

#define NOTE_SI   ('b')
#define NOTE_B    NOTE_SI

#define NOTE_SILENCE ('s')

/* Enable this to get the hand when a melody is played */
#define ENABLE_MELODY_CALLBACK (1)

/* Exported macro ------------------------------------------------------------*/

/* Exported variables --------------------------------------------------------*/
extern CONST Melody_TypeDef MELODIES[];

/* Exported functions --------------------------------------------------------*/
/* void PlayTuneGPIO(uint16_t freq, uint16_t duration); */
void PlayTunePWM(uint16_t freq, uint16_t duration);
void PlayNote(uint8_t note, uint8_t octave, uint16_t duration);
void PlayMelody(uint8_t *notes);
#ifdef ENABLE_MELODY_CALLBACK
void MelodyCallBack(void);
#endif

#endif /* __BUZZER_H */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
