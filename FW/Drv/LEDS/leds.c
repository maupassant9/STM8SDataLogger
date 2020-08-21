/*
* leds.c 
* Author: Dong Xia
* leds display unit driver using Charlieplexing
* All the led are mapped to a virtual led variable
* The user program can only modifies the virtual leds.
* Change Records:
*      >> (05/Abr/2020): created
*
*/

/********************************************
* Include 
********************************************/
#include "leds.h"
#include "stm8s.h"


/********************************************
* Internal Function Declaration 
********************************************/
static void GpioInit( void );
static void TurnLed(uint8_t ledId, uint8_t state);

/********************************************
* Internal Types and Variables 
********************************************/
const ADDR_BANK_T leds_anode[NUM_OF_LEDS*2] = LED_ANODE_TABLE;
const ADDR_BANK_T leds_cathode[NUM_OF_LEDS*2] = LED_CATHODE_TABLE;

/********************************************
* External Variables 
********************************************/
//Interface for any external program to 
//control or read the state of led.
//  BIT0...BIT15...: LED0...LED15...
//  BITX = 1: led on
//  BITX = 0: led off
static volatile LED_STATE_T ledsState;


/********************************************
* Functions 
********************************************/
/*------------------------------------------------ 
* LedsInit 
* Init all the perphierals that used by leds
* Paras:
*  >> : 
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (05/Apr/2020): Create the function 
*----------------------------------------------*/
void LedsInit( void )
{
    leds_state = 0x00;
    GpioInit();
}

/*------------------------------------------------ 
* GpioInit 
* Init all the gpio that used by leds
* Paras:
*  >> : 
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (05/Apr/2020): Create the function 
*----------------------------------------------*/
static void GpioInit( void ){
    uint8_t idx;
    //turn off all the leds
    for(idx = 0; idx < NUM_OF_LED; idx++){
        TurnLed(idx, LED_OFF_STATE);
    }
}



/*------------------------------------------------ 
* updateLedState 
* Map the led state variable to actual 
* physical led state. This should be called
* every N ms, N = 1/refresh rate
* Paras:
*  >> :
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (05/Apr/2020): Create the function 
*----------------------------------------------*/
void UpdateLedState( void )
{
    uint8_t idx = 0; 
    static uint8_t ledId = NUM_OF_LEDS-1;
    LED_STATE_T ledBit = (0x01 << ledId);
    static uint8_t ledIdPrev = 0;
    
    //new ledId = ledId+1 and prev
    ledIdPrev = ledId;
    ledId = (led == NUM_OF_LEDS-1)?0:(led+1);

    TurnLed(ledIdPrev, LED_OFF_STATE);
    if(ledBit&ledsState){
        TurnLed(ledId,LED_ON_STATE);
    }    
}



////////////////////////////////////////////////////////////////
//             Platform specific functions                    //
////////////////////////////////////////////////////////////////
//  User should modifies this function                        //
////////////////////////////////////////////////////////////////
/*------------------------------------------------ 
* turnLed
* Descriptions here. 
* Paras:
*  >> ledId: which led to control
*  >> state: turn on or turn off
* Return: 
*  >> 
* Change Records: 
*  >> (05/Apr/2020): Create the function 
*----------------------------------------------*/
static void TurnLed(uint8_t ledId, uint8_t state){

    ledId = ledId << 2;
    //set led port to output
    GPIO_TypeDef * gpioPortPos = leds_anode[ledId];
    GPIO_TypeDef * gpioPortNeg = leds_cathode[ledId];
    ADDR_BANK_T gpioPinPos = leds_anode[ledId+1];
    ADDR_BANK_T gpioPinNeg = leds_cathode[ledId+1];

    if(state) //turn on
    {
        gpioPortPos->ODR |= (gpioPinPos);
        gpioPortNeg->ODR &= ~(gpioPinNeg);
        //as output
        gpioPortPos->DDR |= gpioPinPos;
        gpioPortNeg->DDR |= gpioPinNeg;

    } else { //turn off
        //as Input
        gpioPortPos->DDR &= ~gpioPinPos;
        gpioPortNeg->DDR &= ~gpioPinNeg;
    }
}