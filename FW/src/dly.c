/*
* clk_tick.c 
* Author: Dong Xia
* clock tick service, support 128 tasks
* Not suitable for time-consuming tasks
* The execution time should not pass more than 1 
* tick. For example, the use want a delay function
* The task should not delay with a loop, because 
* any delay will has to execute more than 1 tick
* The user program can use a flag, add the function
* to mark the flag at the destination time, and in
* user program, check always the flag.
*   delay service
*   execute function at specific time
*
* Change Records:
*      >> (29/Mar/2020): 
*
*/

/********************************************
* Include 
********************************************/
#include <stm8s.h>
#include "dly.h"
#include "led_matrix.h"

/********************************************
* Internal Function Declaration 
********************************************/

/********************************************
* Internal Types and Variables 
********************************************/
volatile uint32_t sysTick;
volatile enum button_state_t buttonState;
/********************************************
* External Variables 
********************************************/
static void tim4Init( void );

/********************************************
* Functions 
********************************************/
void sysTickInit( void )
{
	sysTick = 0;
	ButtonInit();
	tim4Init();
	
}


/** tim4Init
  * @brief  Initialize the tim4.
  * Tim4 is used as a gernal timer, for delay service
  * @param  None
  * @retval None
  * @par Warning: None
  * 
  */
static void tim4Init( void )
{
	TIM4->PSCR = TIM4_PRESCALER_64; //tim_clk = 250K, time_resolution = 4us
	TIM4->CR1 = (TIM4_CR1_ARPE);
	TIM4->IER = TIM4_IER_UIE;
	TIM4->ARR = TIMER_VALUE_FOR_SYSTICK;
	TIM4->CR1 |= TIM4_CR1_CEN;
}


/*------------------------------------------------ 
* FuncName: dly()
* delay time tick  
* Paras:
*  >> uint16_t dt: delay time in unit of systick
* Return: 
*  >> 
* Change Records: 
*  >> (21/Mar/2020): Create the function 
*----------------------------------------------*/
void dly(uint32_t dt)
{
	uint32_t destSysTick = sysTick+dt;
	while(destSysTick!=sysTick);
}


void ButtonStateUpdate(){
	static bool prev_result = FALSE;
	static uint32_t button_sht_ticks = 0;
	bool current_result = (0 == (BUTTON_PIN_PORT->IDR & BUTTON_PIN_NO));
	
	//edge detect: button pressed
	if(current_result && !prev_result){
		prev_result = current_result;
		button_sht_ticks = 0;
		return;
	}
	//edge detect: button released
	if(!current_result && prev_result){
		prev_result = current_result;
		//generate the event here
		if(button_sht_ticks > 2000) buttonState = BUTTON_LNG_PRESSED;
		else if(button_sht_ticks > 500) buttonState = BUTTON_SHT_PRESSED;
		else buttonState = BUTTON_NOT_PRESSED;
		button_sht_ticks = 0;
		return;
	}

	//keep pressed:
	if(current_result){
		button_sht_ticks++;
	} else {
		button_sht_ticks = 0;
	}
}

void ButtonInit(){
	BUTTON_PIN_PORT->CR2 &= (~BUTTON_PIN_NO); //Reset corresponding bit
	BUTTON_PIN_PORT->DDR &= BUTTON_PIN_NO; // Input mode 
	BUTTON_PIN_PORT->CR1 &= ~BUTTON_PIN_NO; //open drain here
}


/*------------------------------------------------ 
* FuncName(); 
* Descriptions here. 
* Paras:
*  >> : 
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (29/Dec/2017): Create the function 
*----------------------------------------------*/
void systemTickIsr (void)
{
	sysTick++;
	TIM4->SR1 = ~TIM4_SR1_UIF;
	UpdateLeds();
	ButtonStateUpdate();
}


enum button_state_t ReadButtonState()
{
	enum button_state_t bs = buttonState;
	buttonState = BUTTON_NOT_PRESSED;
	return bs;
}