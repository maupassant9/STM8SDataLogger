
/* 
* FileName: 
* Author: Dong Xia 
* This is head file of 
* 
* Change Records: 
*      >> (29/Mar/2020): Creation of file 
* 
*/

#ifndef  __DLY_H__
#define __DLY_H__
/********************************************
* Include 
********************************************/
#include <stm8s.h>

/********************************************
* Macro 
********************************************/
#define TIMER_INPUT_CLK_FREQ 250000   //250KHz

#define SYS_TICK_VAL_IN_US 1000  //0.1ms

#define TIMER_VALUE_FOR_SYSTICK (TIMER_INPUT_CLK_FREQ*SYS_TICK_VAL_IN_US)/1e6

/********************************************
* Type definition 
********************************************/
enum button_state_t{
    BUTTON_NOT_PRESSED = 0,
    BUTTON_SHT_PRESSED,
    BUTTON_LNG_PRESSED
};

#define BUTTON_PIN_PORT GPIOD
#define BUTTON_PIN_NO (1<<4)

/********************************************
* Function prototype 
********************************************/
void sysTickInit( void );
void dly(uint32_t dt);
void systemTickIsr (void);
void ButtonInit();
void ButtonStateUpdate();
enum button_state_t ReadButtonState();


#endif



