
/* 
* leds.h 
* Author: Dong Xia 
* leds display unit driver header file.
* User program call always updateLedState every
* 1/refresh rate second(s).
* 
* 
* Change Records: 
*      >> (05/Apr/2020): Creation of file 
* 
*/

#ifndef  __DRV_LEDS__H_
#define  __DRV_LEDS__H_
/********************************************
* Include 
********************************************/
#include "stm8s.h"

/********************************************
* Macro 
********************************************/
////////////////////////////////
//    GPIO Definition         //
////////////////////////////////
// GPIOC3 ----->|----- GPIOA3
#define LED0_ANODE_PIN GPIO_PIN_3
#define LED0_CATHODE_PIN GPIO_PIN_3
#define LED0_ANODE_PIN_PORT GPIOC
#define LED0_CATHODE_PIN_PORT GPIOA

// GPIOA3 ----->|----- GPIOC3
#define LED1_ANODE_PIN GPIO_PIN_3
#define LED1_CATHODE_PIN GPIO_PIN_3
#define LED1_ANODE_PIN_PORT GPIOA
#define LED1_CATHODE_PIN_PORT GPIOC

// GPIOB4 ----->|----- GPIOA3
#define LED2_ANODE_PIN GPIO_PIN_4
#define LED2_CATHODE_PIN GPIO_PIN_3
#define LED2_ANODE_PIN_PORT GPIOB
#define LED2_CATHODE_PIN_PORT GPIOA

// GPIOA3 ----->|----- GPIOB4
#define LED3_ANODE_PIN GPIO_PIN_3
#define LED3_CATHODE_PIN GPIO_PIN_4
#define LED3_ANODE_PIN_PORT GPIOA
#define LED3_CATHODE_PIN_PORT GPIOB



// GPIOC3 ----->|----- GPIOB4
#define LED4_ANODE_PIN GPIO_PIN_3
#define LED4_CATHODE_PIN GPIO_PIN_4
#define LED4_ANODE_PIN_PORT GPIOC
#define LED4_CATHODE_PIN_PORT GPIOB
// GPIOB4 ----->|----- GPIOC3
#define LED5_ANODE_PIN GPIO_PIN_4
#define LED5_CATHODE_PIN GPIO_PIN_3
#define LED5_ANODE_PIN_PORT GPIOB
#define LED5_CATHODE_PIN_PORT GPIOC
// GPIOB5 ----->|----- GPIOA3
#define LED6_ANODE_PIN GPIO_PIN_5
#define LED6_CATHODE_PIN  GPIO_PIN_3
#define LED6_ANODE_PIN_PORT GPIOB
#define LED6_CATHODE_PIN_PORT GPIOA
// GPIOA3 ----->|----- GPIOB5
#define LED7_ANODE_PIN GPIO_PIN_3
#define LED7_CATHODE_PIN GPIO_PIN_5
#define LED7_ANODE_PIN_PORT GPIOA
#define LED7_CATHODE_PIN_PORT GPIOB
// GPIOB5 ----->|----- GPIOC3
#define LED8_ANODE_PIN GPIO_PIN_5
#define LED8_CATHODE_PIN GPIO_PIN_3
#define LED8_ANODE_PIN_PORT GPIOB
#define LED8_CATHODE_PIN_PORT GPIOC
// GPIOC3 ----->|----- GPIOB5
#define LED9_ANODE_PIN GPIO_PIN_3
#define LED9_CATHODE_PIN GPIO_PIN_5
#define LED9_ANODE_PIN_PORT GPIOC
#define LED9_CATHODE_PIN_PORT GPIOB
// GPIOB4 ----->|----- GPIOB5
#define LED10_ANODE_PIN GPIO_PIN_4
#define LED10_CATHODE_PIN GPIO_PIN_5
#define LED10_ANODE_PIN_PORT GPIOB
#define LED10_CATHODE_PIN_PORT GPIOB
// GPIOB5 ----->|----- GPIOB4
#define LED11_ANODE_PIN GPIO_PIN_5
#define LED11_CATHODE_PIN GPIO_PIN_4
#define LED11_ANODE_PIN_PORT GPIOB
#define LED11_CATHODE_PIN_PORT GPIOB

/////////////////////////////////////
//  Platform Specific Value        //
/////////////////////////////////////
 //define the length of Microcontroller address bank
#define ADDR_BANK_LENGTH 16  

//////////////////////////////////////////
//         LED Control Micro            //
//////////////////////////////////////////
//Only less than 32 leds supported here.//
#define NUM_OF_LEDS 12

#define LED_ANODE_TABLE {(ADDR_BANK_T)LED0_ANODE_PIN_PORT,(ADDR_BANK_T)LED0_ANODE_PIN,\
                        (ADDR_BANK_T)LED1_ANODE_PIN_PORT,(ADDR_BANK_T)LED1_ANODE_PIN,\
                        (ADDR_BANK_T)LED2_ANODE_PIN_PORT,(ADDR_BANK_T)LED2_ANODE_PIN,\
                        (ADDR_BANK_T)LED3_ANODE_PIN_PORT,(ADDR_BANK_T)LED3_ANODE_PIN,\
                        (ADDR_BANK_T)LED4_ANODE_PIN_PORT,(ADDR_BANK_T)LED4_ANODE_PIN,\
                        (ADDR_BANK_T)LED5_ANODE_PIN_PORT,(ADDR_BANK_T)LED5_ANODE_PIN,\
                        (ADDR_BANK_T)LED6_ANODE_PIN_PORT,(ADDR_BANK_T)LED6_ANODE_PIN,\
                        (ADDR_BANK_T)LED7_ANODE_PIN_PORT,(ADDR_BANK_T)LED7_ANODE_PIN,\
                        (ADDR_BANK_T)LED8_ANODE_PIN_PORT,(ADDR_BANK_T)LED8_ANODE_PIN,\
                        (ADDR_BANK_T)LED9_ANODE_PIN_PORT,(ADDR_BANK_T)LED9_ANODE_PIN,\
                        (ADDR_BANK_T)LED10_ANODE_PIN_PORT,(ADDR_BANK_T)LED10_ANODE_PIN,\
                        (ADDR_BANK_T)LED11_ANODE_PIN_PORT,(ADDR_BANK_T)LED11_ANODE_PIN}

#define LED_CATHODE_TABLE {(ADDR_BANK_T)LED0_CATHODE_PIN_PORT,(ADDR_BANK_T)LED0_CATHODE_PIN,\
                        (ADDR_BANK_T)LED1_CATHODE_PIN_PORT,(ADDR_BANK_T)LED1_CATHODE_PIN,\
                        (ADDR_BANK_T)LED2_CATHODE_PIN_PORT,(ADDR_BANK_T)LED2_CATHODE_PIN,\
                        (ADDR_BANK_T)LED3_CATHODE_PIN_PORT,(ADDR_BANK_T)LED3_CATHODE_PIN,\
                        (ADDR_BANK_T)LED4_CATHODE_PIN_PORT,(ADDR_BANK_T)LED4_CATHODE_PIN,\
                        (ADDR_BANK_T)LED5_CATHODE_PIN_PORT,(ADDR_BANK_T)LED5_CATHODE_PIN,\
                        (ADDR_BANK_T)LED6_CATHODE_PIN_PORT,(ADDR_BANK_T)LED6_CATHODE_PIN,\
                        (ADDR_BANK_T)LED7_CATHODE_PIN_PORT,(ADDR_BANK_T)LED7_CATHODE_PIN,\
                        (ADDR_BANK_T)LED8_CATHODE_PIN_PORT,(ADDR_BANK_T)LED8_CATHODE_PIN,\
                        (ADDR_BANK_T)LED9_CATHODE_PIN_PORT,(ADDR_BANK_T)LED9_CATHODE_PIN,\
                        (ADDR_BANK_T)LED10_CATHODE_PIN_PORT,(ADDR_BANK_T)LED10_CATHODE_PIN,\
                        (ADDR_BANK_T)LED11_CATHODE_PIN_PORT,(ADDR_BANK_T)LED11_CATHODE_PIN}
///////         DO not Modify below        //////////////////
/////////////////////////////////////////////////////////////
#define LED_ON_STATE 0x01
#define LED_OFF_STATE 0x00

#if (NUM_OF_LEDS <= 8)
#define LED_STATE_T uint8_t
#elif (NUM_OF_LEDS <= 16)
#define LED_STATE_T uint16_t
#elif (NUM_OF_LEDS <= 32)
#define LED_STATE_T uint32_t
#error Number of LEDs more than 32 is not supported by this library
#endif

//access led static way to minimize the 
//ram use in very small microncontroller
#if (ADDR_BANK_LENGTH == 8)
    #define  ADDR_BANK_T uint8_t
#elif (ADDR_BANK_LENGTH == 16)
    #define  ADDR_BANK_T uint16_t
#elif (ADDR_BANK_LENGTH == 32)
    #define  ADDR_BANK_T uint32_t
#else
    #error Address bank size larger than 32 is not supported by this library
#endif
/********************************************
* Type definition 
********************************************/


/********************************************
* Function prototype 
********************************************/
/*------------------------------------------------ 
* LedsInit 
* Usage: Initialize the library
* Paras: 
*  >> : 
* Return: 
*  >> : 
* Change Records: 
*  >> (05/Apr/2020): Create the function 
*----------------------------------------------*/ 
void LedsInit( void );
/*------------------------------------------------ 
* updateLedState 
* Usage: Update(Map) the virtual led variable to
* physical led state.
* Paras: 
*  >> : 
* Return: 
*  >> : 
* Change Records: 
*  >> (05/Apr/2020): Create the function 
*----------------------------------------------*/ 
void UpdateLedState( void );
void SetLedRaw(uint8_t ledId, uint8_t state);
uint8_t GetLedState(uint8_t ledID);
void SetLedState(uint8_t ledID, uint8_t state);

#endif
