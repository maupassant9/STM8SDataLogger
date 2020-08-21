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
static void gpioInit( void );


/********************************************
* Internal Types and Variables 
********************************************/

/********************************************
* External Variables 
********************************************/
@tiny uint32_t ledFreqInTick;
@tiny uint32_t ledNxtToggle;
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
void LedInit( void ){
	
	gpioInit();
	
	//not toggle mode
	ledFreqInTick = 0;
	ledNxtToggle = 0;
	//clear the led 
	LED_CLR();
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
static void gpioInit( void )
{
  LEDPORT->DDR |= LEDPIN; //pin0 output
  LEDPORT->CR1 |= LEDPIN; //push-pull mode
  LEDPORT->CR2 &= ~LEDPIN;  // low speed
}


