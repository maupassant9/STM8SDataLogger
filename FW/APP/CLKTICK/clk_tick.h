
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
#define TIMER_INPUT_CLK_FREQ 16E6   //16MHz

#define SYS_TICK_VAL_IN_MS 1  //10ms

#define TIMER_VALUE_FOR_SYSTICK TIMER_INPUT_CLK_FREQ/1000
#define EXE_FUNC_LIST_NUMBER 5
/********************************************
* Type definition 
********************************************/
typedef struct {
	uint32_t exeTime; //execution time
	void （*run)(void); //function to execute
	void * args; //arguments
    void * ret; //return value
    //configureation
    //BIT0 (not implemented): 1: execute in isr;
    //      0: execute in start()
    //
    //BIT1: 1: repetitive task 
    //      0: one shot task
    //BIT2: 1: Pause state
    uint8_t cfg; 
}exeFunc_t;
typedef exeFunc_t * exe_t;

/********************************************
* Function prototype 
********************************************/
void dly_100us(uint32_t dt);
void tim4Init( void );


#endif



