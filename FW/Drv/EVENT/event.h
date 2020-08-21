
/* 
* event.h
* Author: Dong Xia 
* event service, all the event id should be 
* a positive uint8_t value
* 
* Change Records: 
*      >> (29/Dec/2017): Creation of file 
* 
*/

#ifndef  _EVENT_H_
#define _EVENT_H_
/********************************************
* Include 
********************************************/
#include "stm8s.h"

/********************************************
* Macro 
********************************************/
#define QUEUE_LEN 4
#define INC(valor) (((valor+1)==QUEUE_LEN)?0:(valor+1))

/********************************************
* Type definition 
********************************************/
typedef (void *) event_t;

/********************************************
* Function prototype 
********************************************/
/*------------------------------------------------ 
* evt_create
* Usage: create an event handler
* Paras: 
*  >> 
* Return: 
*  >> event_t : event handler 
* Change Records: 
*  >> (30/Dec/2017): Create the function 
*----------------------------------------------*/ 
event_t evt_create();

/*------------------------------------------------
* FuncName: evt_enqueue
* Enqueue an event.
* Paras:
*  >> event: the event structure to be added
*  >> eventId : add an event id
* Return:
*  >>
* Change Records:
*  >> (03/Jul/2019): Function created.
*----------------------------------------------*/
int8_t evt_enqueue(event_t event, uint8_t eventId);

/*------------------------------------------------
* FuncName: evt_dequeue
* Dequeue an event.
* Paras:
*  >>
* Return:
*  >> int8_t : an event number
* Change Records:
*  >> (03/Jul/2019): Function created.
*----------------------------------------------*/
int8_t evt_dequeue(event_t event);


/*------------------------------------------------
* FuncName: evt_peek
* peek an event.
* Paras:
*  >>
* Return:
*  >> int8_t : an event number
* Change Records:
*  >> (03/Jul/2019): Function created.
*----------------------------------------------*/
int8_t evt_peek(event_t event);

/*------------------------------------------------
* FuncName: evt_is_empty
* check if event queue is empty or not
* Paras:
*  >>
* Return:
*  >> bool : true - empty
*            false - not empty
* Change Records:
*  >> (03/Jul/2019): Function created.
*----------------------------------------------*/
bool evt_is_empty(event_t event);

/*------------------------------------------------
* FuncName: evt_clear
* Clear the event queue
* Paras:
*  >>
* Return:
*  >>
* Change Records:
*  >> (03/Jul/2019): Function created.
*----------------------------------------------*/
void evt_clear(even_t event);

#endif

