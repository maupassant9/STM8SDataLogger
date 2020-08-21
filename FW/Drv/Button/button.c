/*
* button.c 
* Author: Dong Xia
* Abrastraction for buttons, it should be used 
* together with a basic system tick service.
* A button can generate two events:
*   - BUTTON_SHT_PRESSED
*   - BUTTON_LNG_PRESSED
* Button short pressed event happens when a button is
* short pressed, and short pressed is defined by button
* pressed time (<= SHORT_PRESSED_TICKS)
* Button long pressed event happens when a button is
* long pressed, and long pressed is defined by button
* pressed time (>= LONG_PRESSED_TICKS)
*
* Change Records:
*      >> (29/Dec/2017): 
*
*/

/********************************************
* Include 
********************************************/
#include "stm8s.h"


/********************************************
* Internal Function Declaration 
********************************************/


#define BUTTON_VARIABLE_NUM ((BUTTON_NUM-1)/8+1);
/********************************************
* Internal Types and Variables 
********************************************/
static uint8_t buttonLongPressedFlag[BUTTON_VARIABLE_NUM];
static uint8_t buttonShortPressedFlag[BUTTON_VARIABLE_NUM];
#define BUTTON_VAR_LOC(no) (no>>3)
#define BUTTON_BIT_LOC(no) (no - (no>>3)<<3)

static uint32_t prevSysTickVal = 0;
static uint8_t currentButtonPressed;
/********************************************
* External Variables 
********************************************/
volatile uint8_t buttonsState[BUTTON_VARIABLE_NUM];

/********************************************
* Functions 
********************************************/
void ButtonInit( void ){
    //init the gpio
    
}


/*------------------------------------------------ 
* updateButtonIsr
* This function should be called in :
*     - an gpio isr if gpio isr is used
*     - timer isr if timer is used to check button periodically
*     - a while loop
* Paras:
*  >> : 
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (10/Apr/2020): Create the function 
*----------------------------------------------*/
void updateButtonIsr(uint8_t buttonNo, uint32_t sysTick){
    
    //1. the button is not pressed
    if(!isButtonShortPressed(buttonNo))
    {
        //then a new button short pressed is ocurred
        //note down the system tick
        prevSysTickVal = sysTick;
        return;
    }
    
    //3. the button is already long pressed
    if(isButtonLongPressed(buttonNo)){

        return;
    }

    //2. the button is already short pressed
    if(isButtonShortPressed(buttonNo)){


        return;
    }
    

    

    

    //check if the button is pressed
}

void updateButtons(){
    //when the button is clicked
    
}

/*------------------------------------------------ 
* isButtonShortPressed 
* check if the button is in pressed state or not
* Paras:
*  >> buttonNo: which button
*  >> : 
* Return: 
*  >> bool_t
* Change Records: 
*  >> (10/Apr/2020): Create the function 
*----------------------------------------------*/
static bool_t isButtonShortPressed(uint8_t buttonID)
{
    uint8_t buttonState = buttonShortPressedFlag[BUTTON_VAR_LOC(buttonID)];
    uint8_t res = buttonState&(0x01<<BUTTON_BIT_LOC(buttonID));

    return (res>0)?TRUE:FALSE;
}

/*------------------------------------------------ 
* isButtonPressed 
* check if the button is in pressed state or not
* Paras:
*  >> buttonNo: which button
*  >> : 
* Return: 
*  >> bool_t
* Change Records: 
*  >> (10/Apr/2020): Create the function 
*----------------------------------------------*/
static bool_t isButtonLongPressed(uint8_t buttonID)
{
    uint8_t buttonState = buttonShortPressedFlag[BUTTON_VAR_LOC(buttonID)];
    uint8_t res = buttonState&(0x01<<BUTTON_BIT_LOC(buttonID));

    return (res>0)?TRUE:FALSE;
}