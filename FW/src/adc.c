/*
* adc.c 
* Author: Dong Xia
* adc source file, implements a ping-pong buffer
*
* Change Records:
*      >> (29/Mar/2020): created
*
*/

/********************************************
* Include 
********************************************/
#include <stm8s.h>
#include "adc.h"
#include "leds.h"
#include "loggerConf.h"



/********************************************
* External Variables 
********************************************/
//buffer ready for read? 
// bit(n) = 1: buffer n is ready
volatile uint8_t buffer_rdy; 

extern cfg_t loggerCfg;
//==============Round Counter for ADC buffers ============//
//  ----------------------- -----------------------
// |        Buffer0        |         Buffer1       |
//  ----------------------- -----------------------
uint16_t adcBuffer0[BUFFER_SZ_IN_BYTES/2];
uint16_t adcBuffer1[BUFFER_SZ_IN_BYTES/2];
//uint16_t adcBuffer2[BUFFER_SZ_IN_WORD];

/********************************************
* Internal Types and Variables 
********************************************/
 static uint16_t cnter;  //offset for bufferX
//a round cnter for ADC data buffer
#define INC(n) (n = (n == (BUFFER_SZ_IN_BYTES -1))?0:(n+1)) 
//current pointer to the current buffer
static uint8_t * pCurrBuffer;
//current pointer to the current writing byte in buffer
static uint8_t * pCurrByte;

/********************************************
* Internal Function Declaration 
********************************************/
static void NextByte();
static uint8_t NextChannel(void);
static uint8_t GetChannelNo(void);
/********************************************
* Functions 
********************************************/
/** tim1Init 
  * @brief  Initialize the tim1 for adc
  * Tim1 is the trigger source for ADC sampling
  * @param  None
  * @retval None
  * @par Warning: None
  * 
  */
static void tim1Init( void )
{
		uint32_t period;
		
    TIM1->CR1 = (TIM1_CR1_ARPE|TIM1_CR1_URS);
    TIM1->CR2 = 0x20;
    //16MHz / 16000 = 1 KHz
		//calculate the frequency with the 
		//configuration loggerCfg
		period = ((((uint32_t)INPUT_FREQ_TIM1_FOR_ADC)/loggerCfg.sampFreq)/GetChannelNo());
    TIM1->ARRH = (uint8_t)((period&0xff00)>>8);
    TIM1->ARRL = (uint8_t)(period&0xff);
		TIM1->EGR |= TIM1_EGR_UG;
    TIM1->CR1 |= TIM1_CR1_CEN;
}



/** adcInit 
  * @brief  Initialize the adc.
  * Tim1 is the source for ADC sampling
  * @param  None
  * @retval None
  * @par Warning: None
  * 
  */
void adcInit( void )
{
    cnter = 0x00;
    pCurrBuffer = (uint8_t *)adcBuffer0;
		pCurrByte = (uint8_t *)adcBuffer0;
    buffer_rdy = 0x00; //nenhum buffers are ready
    //Power on the ADC1, adc_clk = 4 MHz
    ADC1->CR1 = 0x20;
    //Configure ADC1
    //1. Channel Selection: AIN0 - AIIN6 Scan mode
    ADC1->CSR = NextChannel()|ADC1_CSR_EOCIE;
    //2. External trigger from tim1 (TRGO), right aligned and single mode
    ADC1->CR2 = (loggerCfg.isFullResultion<<3)|ADC1_CR2_EXTTRIG;//(ADC1_CR2_EXTTRIG | ADC1_CR2_ALIGN);
    //3. Enable data buffer
    ADC1->CR3 = ADC1_CR3_DBUF;
    //4. Diable Schmitt trigger disable high
    ADC1->TDRL = 0x1f;
	
    ADC1->CR1 |= ADC1_CR1_ADON;
    
    tim1Init();
}

/*------------------------------------------------ 
* nextByte 
* Descriptions here. 
* Paras:
*  >> : 
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (29/Mar/2020): Create the function 
*----------------------------------------------*/
static void NextByte()
{
    INC(cnter);

    if(cnter == 0){ //an overflow occurred
        //pCurrWord = nextBuffer();
			if(pCurrBuffer == (uint8_t *)adcBuffer0) {
        RELEASE_BUFF_FOR_RD(0);
				pCurrBuffer = (uint8_t *)adcBuffer1;
        pCurrByte = (uint8_t *)adcBuffer1;
			} else {
				RELEASE_BUFF_FOR_RD(1);
				pCurrBuffer = (uint8_t *)adcBuffer0;
				pCurrByte =  (uint8_t *)adcBuffer0;
			}
    } else {
        pCurrByte = &pCurrBuffer[cnter];
    }
}


/*------------------------------------------------ 
* NextChannel
* get the next channel no.
* Paras:
*  >> : 
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (19/Aug/2020): Create the function 
*----------------------------------------------*/
static uint8_t NextChannel(void){
	static uint8_t cntForChannel = 8;
	
	for(; ; ){
		cntForChannel = ((8==cntForChannel)?0:(cntForChannel+1));
		if((0x01 << cntForChannel) & loggerCfg.channel){
			// if there is a valid channel
			return cntForChannel;
		} 		
	}
}

/*------------------------------------------------ 
* getChannelNo
* Get no of channel marked
* Paras:
*  >> : 
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (29/Dec/2017): Create the function 
*----------------------------------------------*/
static uint8_t GetChannelNo(void){
	uint8_t cnt, chNo = 0;
	
	for(cnt = 0; cnt < 8; cnt++){
		if((0x01 << cnt) & loggerCfg.channel){
			chNo++;
		}
	}
	return chNo;
}
/*------------------------------------------------ 
* adcIsr 
* ADC ISR function 
* Paras:
*  >> : 
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (29/Mar/2020): Create the function 
*----------------------------------------------*/
/*@far @interrupt void adcIsr (void)
{
		uint16_t tmp;
		uint8_t currChannel;
		//////////////////////////////////////////
		// Two limitations of the ADC in stm8s: //
		// 1. scan mode can only choose from    //
		// AIN0-AINX.                           //
    // 2.	In a single mode conversion, the  //
		// first conversion result of every     //
		// channel change is incorrect.         //
		//                                      //
		// These limitations makes me decide to //
		// use a trade-off method, convert twice//
    // and keep only the second result using//
    // single conversion mode.              //		
		//////////////////////////////////////////
		static int mark = 0;
		

		if(1 == mark){
			mark = 0;
			//get the data from current channel
			currChannel = NextChannel();
			
			tmp = ADC1->DRL;
			*pCurrWord = ADC1->DRH;
			*pCurrWord = tmp + ((*pCurrWord)<<8);
			nextWord();
			
			//ADC1->CR1 |= ADC1_CR1_ADON;
		} else {
			//throw away the data
			mark = 1;
			tmp = ADC1->DRL;
			tmp = ADC1->DRH;
		}

		//clear flag
		//ADC1->CR1 &= ADC1_CR1_ADON;
		ADC1->CSR = (currChannel|ADC1_CSR_EOCIE);
		//ADC1->CSR &= ~ADC1_CSR_EOC;
		//ADC1->CR1 |= ADC1_CR1_ADON;
}*/


void adcIsr (void)
{
	uint8_t currChannel;
	//get the data from current channel
	currChannel = NextChannel();
	if(loggerCfg.isFullResultion){
		*pCurrByte = ADC1->DRL;
		NextByte();
	}
	*pCurrByte = ADC1->DRH;
    NextByte();
	//clear flag
	//ADC1->CR1 &= ADC1_CR1_ADON;
	//ADC1->CSR &= ~ADC1_CSR_EOC;
	ADC1->CSR = (currChannel|ADC1_CSR_EOCIE);
	//ADC1->CR1 |= ADC1_CR1_ADON;
}
