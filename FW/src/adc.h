
/* 
* adc.h
* Author: Dong Xia 
* adc header file
* 
* Change Records: 
*      >> (29/Mar/2020): Created
* 
*/

#ifndef  __ADC__H
#define  __ADC__H
/********************************************
* Include 
********************************************/
#include <stm8s.h>

/********************************************
* Macro 
********************************************/
#define BUFFER_SZ_IN_BYTES 256

//read/write lock
#define RELEASE_BUFF_FOR_RD(n) buffer_rdy |= (1<<n)
#define RELEASE_BUFF_FOR_WR(n) buffer_rdy &= ~(1<<n)

extern uint16_t adcBuffer0[];
extern uint16_t adcBuffer1[];
/********************************************
* Type definition 
********************************************/
//buffer ready for read? 
// bit(n) = 1: buffer n is ready
//extern uint8_t buffer_rdy; 


/********************************************
* Function prototype 
********************************************/
void adcInit( void );
void adcIsr (void);

#endif

