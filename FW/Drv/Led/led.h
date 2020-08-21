
/* 
* FileName: 
* Author: Dong Xia 
* This is head file of 
* 
* Change Records: 
*      >> (17/08/2020): Creation of file 
* 
*/

#ifndef  LED_H_
#define  LED_H_
/********************************************
* Include 
********************************************/
#include <stm8s.h>

/********************************************
* Macro 
********************************************/
#define LEDPIN 0x10
#define LEDPORT GPIOD



#define LED_SET() (LEDPORT->ODR |= LEDPIN)
#define LED_CLR() (LEDPORT->ODR &= ~LEDPIN)
#define LED_TOGGLE() (LEDPORT->ODR ^= LEDPIN)
#define LED_SET_TOGGLE_FREQ(val) (ledFreqInTick = val, ledNxtToggle = sysTick + val)
/********************************************
* Type definition 
********************************************/
extern uint32_t ledFreqInTick;
extern uint32_t ledNxtToggle;
extern volatile uint32_t sysTick;
/********************************************
* Function prototype 
********************************************/
void LedInit( void );

#endif

