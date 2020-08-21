/**
  ******************************************************************************
  * @file     function.c
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    This file contains some functions that can be used in the demo.
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
#include "functions.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
uint32_t GTimeStamp;
uint16_t TimeOutStartTime;
uint8_t EEPBuffer[16];
uint8_t GUseEeprom;
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/* PWM for buzzer: TIM1_CC4 */
void Init_TIM1(void)
{
  TIM1_PrescalerConfig((uint16_t)3, TIM1_PSCRELOADMODE_IMMEDIATE);
  TIM1_OC4Init( TIM1_OCMODE_PWM1,  TIM1_OUTPUTSTATE_ENABLE, 0xFFFF,  TIM1_OCPOLARITY_LOW,  TIM1_OCIDLESTATE_RESET);

  TIM1_CtrlPWMOutputs(ENABLE);

  TIM1_Cmd(ENABLE);
}

/* General Purpose 5ms Time base */
void Init_TIM2(void)
{
  /* TimerTick = 5 ms
     Warning: fcpu must be equal to 16MHz
     fck_cnt = fck_psc/presc = fcpu/512 = 31.25 kHz --> 1 tick every 32 µs
     ==> 5 ms / 32 µs = 156 ticks
   */
  TIM2_TimeBaseInit( TIM2_PRESCALER_512, 156);
  TIM2_UpdateRequestConfig(TIM2_UPDATESOURCE_GLOBAL);

  TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
  TIM2_Cmd(ENABLE);
}

void Init_GPIO(void)
{

  /* DEBUG pin (5ms timebase) */
  GPIO_Init(GPIOH, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
  
  /* Initialize I/Os in Output Mode for LEDs */
  STM_EVAL_LEDInit(LED1);
  STM_EVAL_LEDInit(LED2);
  STM_EVAL_LEDInit(LED3);
  STM_EVAL_LEDInit(LED4);
  
  /* all LEDs are Off */
  STM_EVAL_LEDOff(LED1);
  STM_EVAL_LEDOff(LED2);
  STM_EVAL_LEDOff(LED3);
  STM_EVAL_LEDOff(LED4);
    
  /* PWM pin (TIM1_CC4) */
  GPIO_Init(GPIOC,GPIO_PIN_4 ,GPIO_MODE_OUT_PP_LOW_FAST);

  /*** Initialize I/Os in Input Mode Float with Interrupt ***/
  /* Configure the SD_Detect pin */
  GPIO_Init(SD_DETECT_GPIO_PORT, SD_DETECT_PIN, GPIO_MODE_IN_PU_NO_IT);

  /* Initialization of the Interrupt sensitivity */
  EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOE, EXTI_SENSITIVITY_RISE_FALL);

}

void Init_Clock(void)
{
  /* Select fCPU = 16MHz */
  CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);

  /* For test purpose output Fcpu on MCO pin */
  CLK_CCOConfig(CLK_OUTPUT_CPU);
}

void Init_I2C(void)
{
   I2C_Init(400000, 0xA0,I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, (uint8_t)16 );
}

void Read_Eeprom(void)
{
  uint8_t i = 0;

  /* Generate start & wait event detection */
  I2C_GenerateSTART(ENABLE);
  while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));

  /* Send slave Address in write direction & wait detection event */
  I2C_Send7bitAddress(0xA0, I2C_DIRECTION_TX);
  while (!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
  I2C_ClearFlag(I2C_FLAG_ADDRESSSENTMATCHED);

  /* Send Address of first byte to be read & wait event detection */
  I2C_SendData(0x00); /* MSB */
  while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
  I2C_SendData(0x00); /* LSB */
  while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));

  /* Re-send start & wait event detection */
  I2C_GenerateSTART(ENABLE);
  while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));

  /* Send slave Address in read direction & wait event */
  I2C_Send7bitAddress(0xA0, I2C_DIRECTION_RX);
  while (!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
  I2C_ClearFlag(I2C_FLAG_ADDRESSSENTMATCHED);

  /* Read 15 first bytes */
  for (i = 0; i < 15; i++ )
  {
     /* waiting for byte from slave */
     while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED));
     EEPBuffer[i] = (uint8_t)(I2C_ReceiveData());
  }

  /* Need to stop ACK for last byte to read */
  I2C_AcknowledgeConfig(I2C_ACK_NONE);

  /* Read last 16th byte */
  while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED));
  EEPBuffer[i] = (uint8_t)(I2C_ReceiveData());

  /* Send STOP Condition to end transmission */
  I2C_GenerateSTOP(ENABLE);
}

void Write_Eeprom(void)
{
  uint8_t i = 0;

  for (i = 0; i < 16; i++)
  {
    /* Generate start & wait event detection */
    I2C_GenerateSTART(ENABLE);
    while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));

    /* Send slave Address in WRITE direction & wait detection event */
    I2C_Send7bitAddress(0xA0, I2C_DIRECTION_TX);
    while (!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
    I2C_ClearFlag(I2C_FLAG_ADDRESSSENTMATCHED);

    /* Send Address (on 2 bytes) of first byte to be written & wait event detection */
    I2C_SendData((uint8_t)0x00); /* MSB */
    while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
    I2C_SendData(i); /* LSB */
    while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));

    /* Send Data to write */
    I2C_SendData(EEPBuffer[i]);
    while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));

    I2C_GenerateSTOP(ENABLE);
    WaitDelay(10); /* To let eeprom the time to finish the write operation */
 }
}

/** Initialize the application.
  * @param[in] None
  * @return None
  **/
void Init_Application(void)
{
  /* Clock initialization */
  Init_Clock();

  /* I/O Port initialization */
  Init_GPIO();
    
  /* SD Card initialization */
  SD_Init();

  /* TIMER2 initialization for generic timebase */
  Init_TIM2();

  /* LCD Initialization */
  STM8S_EVAL_LCD_Init();
    
  LCD_BacklightCmd(DISABLE);

  /* Menu initialization */
  MenuInit();

  /* TIMER1 initialization for buzzer (PWM mode)  */
  Init_TIM1();

  /* Init I2C for communication with external eeprom on evalboard */
  Init_I2C();

  /* Enable interrupts */
  enableInterrupts();

}

/** Get the Timer time stamp.
  * @param[in] None
  * @return the timer time stamp
  **/
uint32_t GetTimeStamp(void)
{
    return GTimeStamp;
}

/** Initialize the start time for generating a time-out.
  * @param[in] Delay before time-out generation
  * @return None
  **/
void GetTimeOutStartTime(void)
{
    sim();
    TimeOutStartTime = (unsigned int)( GetTimeStamp() );
    rim();
}

/** Generate a time out after Delay.
  * @note Before calling this function, the function GetTimeOutStartTime()
 *       must be called.
  * @param[in] Delay before time-out generation based on timer tick
  * @return None
  **/
bool TimeOut(uint16_t Delay)
{
    uint16_t TimeStamp;
    uint16_t PeriodStamp;

    sim();
    TimeStamp = (unsigned int)(GetTimeStamp());
    rim();

    PeriodStamp = TimeStamp - TimeOutStartTime;

    if (PeriodStamp >= Delay)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }

}

/** Wait a delay
  * @param[in] Delay based on timer Tick
  * @return None
  **/
void WaitDelay(uint16_t Delay)
{

    uint16_t DelayPeriodStart;
    __IO uint16_t TimeStamp;
    uint16_t PeriodStamp;

    sim();
    DelayPeriodStart = (uint16_t)(GetTimeStamp());
    rim();

    while (1)
    {
        disableInterrupts();
        TimeStamp = (uint16_t)(GetTimeStamp());
        rim();
        PeriodStamp = TimeStamp - DelayPeriodStart;
        if (PeriodStamp >= Delay)
        {
            return;
        }
    }

}

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
