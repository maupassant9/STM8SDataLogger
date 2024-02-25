
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
#include "leds.h"

/********************************************
* Macro 
********************************************/
enum led_mode_t {
    LED_OFF = 0b00,
    LED_TOGGLE_SLOW,
    LED_TOGGLE_FAST,
    LED_ON,
    LED_MODE_MAX
};

#define LED_TOGGLE_SLOW_TICK (1000)
#define LED_TOGGLE_FAST_TICK (300)

#define LED_MODE_ARRAY_ELE_NO ((NUM_OF_LEDS*2-7)/8)

/********************************************
* Type definition 
********************************************/
uint32_t led_ticks[NUM_OF_LEDS];
//to save the memory use, this array used to
//define the mode of the led and the ticks if
//the led is cofigured as toggle mode:
//1. led_ticks == 0: the led is not in toggle mode, so it is not used
//2. led_ticks is even number : the led is in slow toggle mode
//3. led_ticks is odd number: the led is in fast toggle mode
/********************************************
* Function prototype 
********************************************/
void LedMatrixInit( void );

#endif

