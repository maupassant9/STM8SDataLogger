
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

#define SYS_TICK_VAL_IN_US 100  //0.1ms

#define TIMER_VALUE_FOR_SYSTICK (TIMER_INPUT_CLK_FREQ*SYS_TICK_VAL_IN_US)/1e6

/********************************************
* Type definition 
********************************************/


/********************************************
* Function prototype 
********************************************/
void sysTickInit( void );
void dly(uint32_t dt);
@far @interrupt void systemTickIsr (void);

#endif



