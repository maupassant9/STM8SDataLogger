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
#include "led.h"


/********************************************
* Internal Function Declaration 
********************************************/


/********************************************
* Internal Types and Variables 
********************************************/

/********************************************
* External Variables 
********************************************/

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
	case LED_OFF: led_ticks[ledID] = 0; TurnLed(ledID, ledModeVal);break;
	case LED_TOGGLE_SLOW: 
		nxtTick = sysTick + LED_TOGGLE_SLOW_TICK;
		if(nxtTick) nxtTick = 2;
		else nxtTick = (nextTick%2)?(nextTick+1):nextTick;
		led_ticks[ledID] = nxtTick;break;
	case LED_TOGGLE_FAST: 
		nxtTick = sysTick + LED_TOGGLE_FAST_TICK;
		nxtTick = (nextTick%2)?nextTick:(nextTick+1);
		led_ticks[ledID] = nxtTick;break;
	}
	
}


//this function should be called in system tick
void UpdateLeds()
{
	uint8_t idx;

	for(idx = 0; idx < NUM_OF_LEDS; idx++){
		if(led_ticks[idx] != 0 && sysTick == led_ticks[idx]){
			led_ticks[idx] += (led_ticks%2)?(LED_TOGGLE_FAST_TICK:LED_TOGGLE_SLOW_TICK);
			SetLedState(idx, ~GetLedState(ledID));
		}
	}

	updateLedState();
}


