
/* 
* loggerConf.h
* Author: Dong Xia 
* Configuration file for data logger
* 
* Change Records: 
*      >> (19/Agu/2020): Creation of file 
* 
*/

#ifndef LOGGER_CONF_H_
#define LOGGER_CONF_H_
/********************************************
* Include 
********************************************/


/********************************************
* Macro 
********************************************/
///////////////////////////////////////////
// No of adc buffer for a block of data  //
// in sd card, 1 block = 512 Bytes       //
///////////////////////////////////////////
#define NO_BUFF_PER_BLK 2

///////////////////////////////////////////
// The input frequency of tim1 used for  //
// adc conversion timing                 //
///////////////////////////////////////////
#define INPUT_FREQ_TIM1_FOR_ADC 16000000  //16MHz


/********************************************
* Type definition 
********************************************/
//State Machine States
//FSM diagram in VP file (Stm8sDataLogger.vpp)
enum state_t {
	S0_RST = 0, //State in reset
	S1_WR_BUF0, //state to write buf1 to sd
	S2_WR_BUF1, //state to write buf2 to sd
	S3_NXT_FILE, //state to move to next file
	S4_ERR, // error state
	S5_COMPLETE //task finished state
};

//Error Type for FSM
enum error_t{
	NO_ERR = 0,
	ERR_CARD_INIT = 1,
	ERR_WR_DATA,
	ERR_WR_NO_RESP,
	ERR_OPEN_FILE,
	ERR_BUFF_OVERLAP
};


//State Machine Structure
typedef struct{
	enum state_t state; //current state in fsm
	enum error_t error; //current error in fsm
} fsm_t;

//Configuration for Data Logger//
typedef struct{
	//Sampling Frequency in Hz
	uint16_t sampFreq;
	//Starting File Name (first file to wr)
	char firstFileName[5];
	//Size of a file in Bytes
	uint32_t fileSzInBlock;
	// No of files to be written
	uint16_t fileNo;
	// Mark the channel to be used
	uint8_t channel;
	// resolution of adc
	uint8_t isFullResultion;
}cfg_t;

/********************************************
* Function prototype 
********************************************/

#endif //LOGGER_CONF_H_

