/*
* event.c
* Author: Dong Xia
* Event service based on queue
*
* Change Records:
*      >> (29/Dec/2017): created
*
*/

/********************************************
* Include 
********************************************/
#include "stm8s.h"
#include "event.h"

/********************************************
* Internal Function Declaration 
********************************************/
static void evt_queue_init(event_t event);


/********************************************
* Internal Types and Variables 
********************************************/
//Event queue structure, save all the information
// of a event queue
typedef struct {
	uint8_t head;
	uint8_t tail;
	uint8_t length;
    int8_t queue[QUEUE_LEN];
} evt_queue_t;

typedef evt_queue_t * evt_t;

// A Event queue: FIFO
/********************************************
* External Variables 
********************************************/


/********************************************
* Functions 
********************************************/
/*------------------------------------------------
* FuncName: evt_queue_init
* Event Queue initializer, generate an event
* structure
* Paras:
*  >>
* Return:
*  >>
* Change Records:
*  >> (03/Jul/2019): Function created.
*----------------------------------------------*/
static void evt_queue_init(event_t event)
{
    evt_t evt = (evt_t)event;
    evt->head = 0;
    evt->tail = 0;
    evt->length = 0;
}

/*------------------------------------------------ 
* evt_create
* Create an event
* Paras:
*  >> : 
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (29/Dec/2017): Create the function 
*----------------------------------------------*/
event_t evt_create()
{
    event_t event = malloc(sizeof(evt_queue_t));
    evt_queue_init((evt_t)event);
    return (event_t)event;
} 

/*------------------------------------------------
* FuncName: evt_enqueue
* Enqueue an event.
* Paras:
*  >>
* Return:
*  >>
* Change Records:
*  >> (03/Jul/2019): Function created.
*----------------------------------------------*/
int8_t evt_enqueue(event_t event, uint8_t eventId){

    evt_t evt = (evt_t)event;
    if(evt->length == QUEUE_LEN) return -1;
    evt->queue[evt->head] = eventId;
    evt->head = INC(evt->head);
    evt->length++;
    return 0;
}

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
int8_t evt_dequeue(event_t event){
	int8_t return_val;
    evt_t evt = (evt_t)event;
	if(evt->length == 0) return -1;
	return_val = evt->queue[evt->tail];
	evt->tail = INC(evt->tail);
	evt->length--;
	return return_val;
}


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
int8_t evt_peek(event_t event){
    evt_t evt = (evt_t)event;
	if(evt->length == 0) return -1;
	return evt->queue[evt->tail];
}

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
bool evt_is_empty(event_t event)
{
    evt_t evt = (evt_t)event;
	return (evt->length == 0);
}

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
void evt_clear(even_t event){
    evt_queue_init(event);
}


