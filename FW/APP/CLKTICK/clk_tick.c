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
#include "clk_tick.h"


#define REPETITIVE_BIT 0x02
#define PAUSE_BIT 0x04
/********************************************
* Internal Function Declaration 
********************************************/
static exe_t executionList[EXE_FUNC_LIST_NUMBER];



/********************************************
* Internal Types and Variables 
********************************************/
static volatile uint32_t sysTick;
/********************************************
* External Variables 
********************************************/


/********************************************
* Functions 
********************************************/
void sysTickInit( void )
{
	sysTick = 0;
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
	TIM4->ARR = 256 - TIMER_VALUE_FOR_SYSTICK;
	TIM4->CR1 &= ~TIM4_CR1_CEN;
}


/*------------------------------------------------ 
* FuncName： dly()
* delay 100us 
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
uint32_t getSysTick( void )
{
	return sysTick;
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
	exe_t func;
	int8_t idx;
	sysTick++;
	//check if there is any function to be 
	// executed
	idx = getNewestFunc();
	func = exeutionList[idx];
	if(func->exeTime == sysTick){
		*(func->run)();
		updateList(idx);
	}
}


//not allowed the same function 
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
bool_t addFunc(exe_t func)
{
	if(!isExist(func)){
		for(idx = 0; idx < EXE_FUNC_LIST_NUMBER; idx++)
		{
			if(executionList[idx] == 0) //free space
			{
				executionList[idx] = func;
				return true;
			}
		}
	}
	return false;
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
bool_t isExist(exe_t func)
{
	for(idx = 0; idx < EXE_FUNC_LIST_NUMBER; idx++){
		if(executionList[idx] == func) return true;
	}
	return false;
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
int8_t getNewestFunc()
{
	uint8_t idx; uint8_t minIdx = 0;
	exe_t minFunc = executionList[0];
	for(idx = 1; idx < EXE_FUNC_LIST_NUMBER; idx++)
	{
		if(!compare(minFunc,executionList[idx]))
		{
			minFunc = executionList[idx];
			minIdx = idx;
		}
	}
	return minIdx;
}


int8_t getAndRemoveNewestFunc()
{
	uint8_t idx; uint8_t minIdx = 0;
	exe_t minFunc = executionList[0];
	for(idx = 1; idx < EXE_FUNC_LIST_NUMBER; idx++)
	{
		if(!compare(minFunc,executionList[idx]))
		{
			minFunc = executionList[idx];
			minIdx = idx;
		}
	}
	updateList(minIdx);
	return minIdx;
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
void pause(exe_t func){
	func->cfg |= PAUSE_BIT;
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
static void updateList(uint8_t idx){
	//if it is a repetive task
	if(executionList[idx]->cfg&REPETITIVE_BIT){
		executionList[idx]->executionTime += systick;
	} else { //one shot task
		executionList[idx] = 0;
	}
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
static void remove(int8_t id)
{
	executionList[id] = 0;
	
}


static int8_t getIndex(exe_t func)
{
	for(idx = 0; idx < EXE_FUNC_LIST_NUMBER; idx++)
	{
		if(func == executionList[idx]) {
			return idx;
		}
	}
	return -1;
	
}

//return the earliest func to execute 
//true : systick1 <= systick2
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
bool_t compare(exe_t func1, exe_t func2)
{
	uint32_t currentSystick = sysTick;
	uint32_t systick1 = func1->exeTime;
	uint32_t systick2 = func2->exeTime;
	uint32_t systickTemp; uint8_t exchangeFlag = 0;

	if(systick1 == systick2) return func1;
	if(systick1 > systick2)
	{
		//exchange the func1 and func2
		systickTemp = systick1;
		systick1 = systick2;
		systick2 = systickTemp;
		exchangeFlag = 1;
	}
	//now systick1 < systick2
	if((currentSystick > systick2)||
		(currentSystick < systick1)) return (exchange==0)?true:false;
	return (exchange==0)?false:true;

}