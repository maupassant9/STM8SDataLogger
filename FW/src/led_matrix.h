
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

/********************************************
* Function prototype 
********************************************/
void LedMatrixInit( void );
void SetLedMode(uint8_t ledID, enum led_mode_t mode);
void UpdateLeds();
#endif

