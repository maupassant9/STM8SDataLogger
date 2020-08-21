
/* 
* button.h 
* Author: Dong Xia 
* Abstraction for buttons, buttons corrected
* directly to gpio, no scan mode supported
* can be used by polling or by interrupt
* only one button press is recognized at each 
* time.
* 
* Change Records: 
*      >> (29/Dec/2017): Creation of file 
* 
*/

#ifndef  __DRV_BUTTONS__H
#define __DRV_BUTTONS__H
/********************************************
* Include 
********************************************/
#include "stm8s.h"

/********************************************
* Macro 
********************************************/
#define BUTTON_NUM 1


//get the button variable index in variable array
#define BUTTON_IDX(no) (no>>3)
#define BUTTON_BIT(no) (no-((no>>3)<<3))

#define BUTTON
/********************************************
* Type definition 
********************************************/




/********************************************
* Function prototype 
********************************************/

#endif

