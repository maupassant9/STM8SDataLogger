/*
* main.c
* Author: Dong Xia
* This is source file of 
*
* Change Records:
*      >> (17/Agu/2020): create new file
*                        Modifies the files and add fsm
*         (18/Agu/2020): resolve a bug, ADC Scan mode PIN_ADCIN2
*                        conflict with SPI_CS
*         (19/Agu/2020): Add cfg read function
*
*/

/********************************************
* Include 
********************************************/
#include "stm8s_conf.h"
#include "Drv/sd/mmcsd.h"
#include "Drv/FAT32/pff.h"
#include "stm8s.h"
#include "Drv/FAT32/diskio.h"
#include "Drv/ADC/adc.h"
#include "dly.h"
#include "led.h"
#include <stdbool.h>
#include "loggerconf.h"

/********************************************
* Internal Types and Variables 
********************************************/
#define CFG_BUF_SZ 13

//blkCnter: cnter for counting
//how many no. of buffers of adc already 
//written to sd card
@tiny static uint8_t blkCnt = 0;

//fileBlkCnt: regressive cnter for counting
//how many no. of block of SD left to be 
//written until reach to file end, at this 
//point, should be move to the next file.
@tiny static uint32_t fileBlkCnt = 0;

//fileNoCnt: regressive cnter for counting
//how many no. of files left unwritten. When
//this cnter reaches to 0, no avaiable file 
//is left.
@tiny static uint16_t fileNoCnt = 0;

//////////////////////////////////////////////////////////////
// configuration in cfg file (Little Endian)
// |BYTE0|BYTE1| -- Sampling freq 
// |BYTE2|BYTE3| -- First file name
// |BYTE4|BYTE5| -- No. of Files
// |BYTE6|BYTE7|BYTE8|BYTE9| -- File size in block (512 bytes)
// |BYTE10| -- Select Channel 
//       XXXX XXXX (1: selected, 0: not selected)
//  CH8->|       |<- CH1
// |BYTE11| -- RESOLUTION SETTING 0x00: 8 bits, 0x01: 10 bits
// |BYTE12| -- CRC value
//////////////////////////////////////////////////////////////
@tiny static uint8_t cfg[CFG_BUF_SZ];



/********************************************
* External Variables 
********************************************/
extern volatile uint8_t buffer_rdy; 

//Configuration variable shared in all project
@tiny cfg_t loggerCfg;
/********************************************
* Internal Function Declaration 
********************************************/
static void Wr2SD( fsm_t * p );

/********************************************
* Functions 
********************************************/
/*------------------------------------------------ 
* main
* Main function
* Init the hardware, software 
* Execute the FSM
* Paras:
*  >> : 
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (19/Agu/2020): Create the function 
*----------------------------------------------*/
void main( void )
{
	uint8_t i;
	UINT pbr;	
	FATFS fid;
	FRESULT res = FR_OK;
	fsm_t fsm;
	//////////////////////
	//Init the hardware
	/////////////////////
	clkInit();
	LedInit();
	sysTickInit();
	
	//Enable global Interrupt
	enableInterrupts();
	
	
	///////////////////////////////
	// Mount the file sys       ///
	// And get the configuration///
	///////////////////////////////
	res |= pf_mount(&fid);	
	res |= pf_open("CFG");
	res |= pf_read(cfg, 13 , &pbr);
	
	res |= GetCfg(cfg, &loggerCfg);
	
	if(FR_OK == res){
		//delay for some times
		//show user that the system initialize ok.
		for(i = 0; i < 10; i++) {
			LED_TOGGLE();
			dly(10000);
		}
	
		//init the cnters
		fileBlkCnt = loggerCfg.fileSzInBlock;
		fileNoCnt = loggerCfg.fileNo;
		
		//open the first file to be written	
		res |= pf_open(loggerCfg.firstFileName);
		
		if(FR_OK == res){
			//set state machine into the resset state
			//SetFsm(&fsm,S0_RST,NO_ERR);
			fsm.state = S0_RST;
			fsm.error = NO_ERR;
		} else {
			//SetFsm(&fsm, S4_ERR, ERR_CARD_INIT);
			fsm.state = S4_ERR;
			fsm.error = ERR_CARD_INIT;
		}
			
		disableInterrupts();
		adcInit();
		//Enable global Interrupt
		enableInterrupts();
	} else {
		//SetFsm(&fsm, S4_ERR, ERR_CARD_INIT);
		fsm.state = S4_ERR;
		fsm.error = ERR_CARD_INIT;
	}
	//Disable led auto toggle func
	LED_SET_TOGGLE_FREQ(0);	
	
	while(1){

	////////////////////
	//State machine ////
	////////////////////
		switch (fsm.state){
			case S0_RST:
				//Reset state, do nothing just 
				//wait for event to happen 
				if( 0x3 == buffer_rdy ){
					//when buffer is overlapped
					//SetFsm(&fsm, S4_ERR, ERR_BUFF_OVERLAP);
					fsm.state = S4_ERR;
					fsm.error = ERR_BUFF_OVERLAP;
				} else if (0x01 == buffer_rdy) {
					//SetFsm(&fsm, S1_WR_BUF0, NO_ERR);
					fsm.state = S1_WR_BUF0;
				} else if ( 0x02 == buffer_rdy) {
					//SetFsm(&fsm, S2_WR_BUF1, NO_ERR);
					fsm.state = S2_WR_BUF1;
				}
				break;
			case S1_WR_BUF0:
			case S2_WR_BUF1:
				//Write ADC buffer 1 state
				Wr2SD(&fsm);
				break;
			case S3_NXT_FILE:
				fileBlkCnt = loggerCfg.fileSzInBlock;
				//move to next file
				if(--fileNoCnt != 0){
					//if has files avaliable
					GetNxtFileName(loggerCfg.firstFileName);
					//open the new file
					res = pf_open(loggerCfg.firstFileName);
					if( FR_OK != res ){
						fsm.state = S4_ERR;
						//SetFsm(&fsm, S4_ERR, ERR_CARD_INIT);
					} else {
						fsm.state = S0_RST;
						//SetFsm(&fsm, S0_RST, NO_ERR);
					}
				} else {
					//no file avaiable, 
					//EVT_SD_FULL happens
					fsm.state = S5_COMPLETE;
					//SetFsm(&fsm, S5_COMPLETE, NO_ERR);
				}
				break;
				//error sstate
			case S4_ERR:
				LED_SET_TOGGLE_FREQ(50000);
			case S5_COMPLETE:
				LED_SET();
				while(1);
				break;
			default: break;
		}
	} 
}

/*------------------------------------------------ 
* Wr2SD
* Write a buffer to SD card
* Paras:
*  >> fsm_t *: state machine 
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (15/08/2020): Create the function 
*----------------------------------------------*/
static void Wr2SD( fsm_t * pfsm ){
	FRESULT res;
	UINT pbr;	
	uint16_t * pBuf;
	uint8_t bufNo;
	
	//get the correct buffer
	if( S1_WR_BUF0 == pfsm->state){
		pBuf = adcBuffer0; bufNo = 0;
	} else {
		pBuf = adcBuffer1; bufNo = 1;
	}
	RELEASE_BUFF_FOR_WR(bufNo); //clear this flag
	//when the adc buffer is ready for writing to sd card	
	LED_SET();
	res = pf_write((void*)pBuf,BUFFER_SZ_IN_BYTES, &pbr);
	LED_CLR();
	
	if(FR_OK != res){
		
		//SetFsm(pfsm, S4_ERR, ERR_WR_DATA);
		pfsm->error = ERR_WR_DATA;
		pfsm->state = S4_ERR;
		return;
	}
	
	if(NO_BUFF_PER_BLK == ++blkCnt){
		//the sd data buffer full (512 bytes), write to sd
		blkCnt = 0;
		LED_SET();
		res = pf_write(0,0,&pbr);
		LED_CLR();

		
		if(FR_OK != res){
			//SetFsm(pfsm, S4_ERR, ERR_WR_NO_RESP);
			pfsm->error = ERR_WR_NO_RESP;
			pfsm->state = S4_ERR;
			return;
		}
		//warn user that one block is sent
		if(0 == --fileBlkCnt){
			//if the file is full
			// go to S3 state
			pfsm->state = S3_NXT_FILE;
			//SetFsm(pfsm, S3_NXT_FILE, NO_ERR);
			return;
		}
	}
	
	//write complete with no error
	pfsm->state = S0_RST; 
	//SetFsm(pfsm, S0_RST, NO_ERR);
}

/*------------------------------------------------ 
* GetNxtFileName 
* get the name of the next file
* Paras:
*  >> : 
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (15/08/2020): Create the function 
*----------------------------------------------*/
void GetNxtFileName(@tiny char * fname){
	uint16_t fileId;
	uint8_t val = 0;
	
	if(0x39 == fname[3]){
		val = 0x01;
	}
	if(0x39 == fname[2]) {
		val += 0x02;
	}
	if(0x39 == fname[1]) {
		val += 0x04;
	}
	if(0x39 == fname[0]) {
		val += 0x08;
	}
	
	switch(val){
		case 0x01: fname[3] = 0x30; 
							 fname[2]++;break;
		case 0x03: fname[3] = 0x30; 
							 fname[2] = 0x30; 
							 fname[1]++; break;
		case 0x07: fname[3] = 0x30; 
							 fname[2] = 0x30; 
							 fname[1] = 0x30; 
							 fname[0]++; break;
		case 0x0f: fname[3] = 0x30; 
							 fname[2] = 0x30; 
							 fname[1] = 0x30; 
							 fname[0] = 0x30; break;
		default: fname[3]++; break;
	}
}

/*------------------------------------------------ 
* ConvertFileName
* Convert an int into a file name string 
* Paras:
*  >> : 
*  >> : 
* Return: 
*  >> 
* Change Records: 
*  >> (29/Dec/2017): Create the function 
*----------------------------------------------*/
void ConvertFileName(uint16_t firstFileName, char * fname){
	uint16_t val = 0;
	
	val = firstFileName/1000;
	fname[0] = val + 0x30;
	firstFileName -=  val*1000;
	val = firstFileName/100;
	fname[1] = val + 0x30;
	firstFileName -=  val*100;
	val = firstFileName/10;
	fname[2] = val + 0x30;
	firstFileName -=  val*10;
	fname[3] = firstFileName + 0x30;
	fname[4] = '\0';
}

/*------------------------------------------------ 
* GetCfg 
* Retrieve the configuration here 
* Paras:
*  >> uint8_t *: cfg buffer from sd [in]
*  >> cfg_t *: cfg structure  [out]
* Return: 
*  >> uint32_t: result
*               0x0: get cfg with success
*               !=0: error occurres.
* Change Records: 
*  >> (19/Agu/2020): Create the function 
*----------------------------------------------*/
UINT GetCfg(@tiny uint8_t * pCfgBuf, @tiny cfg_t * pcfg){
	uint16_t fID;
	
	if(!IsValidCfgBuf(pCfgBuf)) return 1; 
	
	//read sampling freq:
	pcfg->sampFreq = pCfgBuf[0]+(((uint16_t)pCfgBuf[1])<<8);
	
	fID = pCfgBuf[2]+(((uint16_t)pCfgBuf[3])<<8);
	
	ConvertFileName(fID, pcfg->firstFileName);
	pcfg->fileNo = pCfgBuf[4]+(((uint16_t)pCfgBuf[5])<<8);
	pcfg->fileSzInBlock = pCfgBuf[6]+ \
												(((uint32_t)pCfgBuf[7])<<8) + \
												(((uint32_t)pCfgBuf[8])<<16) + \
												(((uint32_t)pCfgBuf[9])<<24);
	pcfg->channel = pCfgBuf[10];
	if(pCfgBuf[11] == 0)
	{
		pcfg->isFullResultion = false;
	} else {
		pcfg->isFullResultion = true;
	}
	
	return 0x0;
}


/*------------------------------------------------ 
* IsValidCfgBuf 
* Check if datas in cfg buffer are valid or not 
* Paras:
*  >> uint8_t * : pCfgBuf:
*  >> : 
* Return: 
*  >> bool_t 
* Change Records: 
*  >> (19/Agu/2020): Create the function 
*----------------------------------------------*/
uint8_t IsValidCfgBuf(uint8_t *pCfgBuf){
	uint8_t crc = 0;
	int i = 0;
	for(; i < CFG_BUF_SZ - 1; i++){
		crc += pCfgBuf[i];		
	}
	if(crc == pCfgBuf[CFG_BUF_SZ-1])
		return true;
		
	return false;	
}

/** clkInit
  * @brief  Initialize the clock module
  * @param  None
  * @retval None
  * @par Warning: None
  * 
  */
void clkInit( void )
{
	//initialize cpu clk with HSI @ 16MHz
  CLK->CKDIVR = 0;//(CLK_PRESCALER_HSIDIV1|CLK_PRESCALER_CPUDIV1);

  //enable the peripheral clock input
  //0. Timer 1: 
	//1. Timer 4: used for delay service
  //2. SPI: for sd card service
  //3. Uart1: for dbg and communication to pc
  //4. ADC: for getting datas
  CLK->PCKENR1 |= (CLK_PCKENR1_TIM4|CLK_PCKENR1_SPI|CLK_PCKENR1_UART1);
  CLK->PCKENR2 |= (CLK_PCKENR2_ADC);
}





#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}

#endif