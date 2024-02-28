/*
* FileName: 
* Author: Dong Xia
* This is source file of 
*
* Change Records:
*      >> (17/08/2020): 
*
*/

/********************************************
* Include 
********************************************/
#include "led_matrix.h"



/********************************************
* Internal Function Declaration 
********************************************/


/********************************************
* Internal Types and Variables 
********************************************/
uint32_t led_ticks[NUM_OF_LEDS];
//to save the memory use, this array used to
//define the mode of the led and the ticks if
//the led is cofigured as toggle mode:
//1. led_ticks == 0: the led is not in toggle mode, so it is not used
//2. led_ticks is even number : the led is in slow toggle mode
//3. led_ticks is odd number: the led is in fast toggle mode
/********************************************
* External Variables 
********************************************/
extern volatile uint32_t sysTick;

/********************************************
* Functions 
********************************************/
/*------------------------------------------------ 
* LedInit 
* Initialize the led  
* Paras:
*  >> : 
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (17/08/2020): Create the function 
*----------------------------------------------*/
void LedMatrixInit( void ){
	
	LedsInit();
}



/*------------------------------------------------ 
* gpioInit 
* Init the gpio used by led 
* Paras:
*  >> : 
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (17/08/2020): Create the function 
*----------------------------------------------*/
// 
void SetLedMode(uint8_t ledID, enum led_mode_t mode)
{
	uint32_t nxtTick;

	if(mode >= LED_MODE_MAX) return;
	if(ledID >= NUM_OF_LEDS) return;

	switch(mode){
	case LED_ON:
	case LED_OFF: led_ticks[ledID] = 0; SetLedState(ledID, mode);break;
	case LED_TOGGLE_SLOW: 
		nxtTick = sysTick + LED_TOGGLE_SLOW_TICK;
		if(nxtTick) nxtTick = 2;
		else nxtTick = (nxtTick%2)?(nxtTick+1):nxtTick;
		led_ticks[ledID] = nxtTick;break;
	case LED_TOGGLE_FAST: 
		nxtTick = sysTick + LED_TOGGLE_FAST_TICK;
		nxtTick = (nxtTick%2)?nxtTick:(nxtTick+1);
		led_ticks[ledID] = nxtTick;break;
	}
}


//this function should be called in system tick
void UpdateLeds()
{
	uint8_t idx;
	uint32_t tick;

	for(idx = 0; idx < NUM_OF_LEDS; idx++){
		tick = led_ticks[idx];
		if((tick != 0) && (sysTick == tick)){
			led_ticks[idx] = ((tick%2)?LED_TOGGLE_FAST_TICK:LED_TOGGLE_SLOW_TICK);
			SetLedState(idx, ~GetLedState(idx));
		}
	}

	UpdateLedState();
}


