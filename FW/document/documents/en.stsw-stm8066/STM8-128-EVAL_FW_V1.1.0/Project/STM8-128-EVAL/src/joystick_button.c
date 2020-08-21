/**
  ******************************************************************************
  * @file     joystick_button.c
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains basic functions to control the joystick button.
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
#include "joystick_button.h"
#include "functions.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define Bit_RESET  0
#define Bit_SET    1
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Reads joystick position from evalboard.
  * @param  None.
  * @retval Joystick position.
  *         This parameter can be a value of @ref JOYState_TypeDef enumeration.
  */
JOYState_TypeDef ReadJoystick(void)
{
  /* "right" key is pressed */
  if (!STM_EVAL_PBGetState(BUTTON_RIGHT))
  {
    while (STM_EVAL_PBGetState(BUTTON_RIGHT) == Bit_RESET);
    return JOY_RIGHT;
  }
  /* "left" key is pressed */
  if (!STM_EVAL_PBGetState(BUTTON_LEFT))
  {
    while (STM_EVAL_PBGetState(BUTTON_LEFT) == Bit_RESET);
    return JOY_LEFT;
  }
  /* "up" key is pressed */
  if (!STM_EVAL_PBGetState(BUTTON_UP))
  {
    while (STM_EVAL_PBGetState(BUTTON_UP) == Bit_RESET);
    return JOY_UP;
  }
  /* "down" key is pressed */
  if (!STM_EVAL_PBGetState(BUTTON_DOWN))
  {
    while (STM_EVAL_PBGetState(BUTTON_DOWN) == Bit_RESET);
    return JOY_DOWN;
  }
  /* "sel" key is pressed */
  if (!STM_EVAL_PBGetState(BUTTON_SEL))
  {
    while (STM_EVAL_PBGetState(BUTTON_SEL) == Bit_RESET);
    return JOY_SEL;
  }
  /* No key is pressed */
  else
  {
    return JOY_NONE;
  }
}

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
