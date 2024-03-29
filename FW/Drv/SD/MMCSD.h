/**
  ******************************************************************************
  * @file    stm8_eval_spi_sd.h
  * @author  MCD Application Team
  * @version V1.0.0
  * @date    25-February-2011
  * @brief   This file contains all the functions prototypes for the stm8s_eval_spi_sd
  *          firmware driver.
  ******************************************************************************
  * @attention
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
  ******************************************************************************
  */ 

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM8S_EVAL_SPI_SD_H
#define __STM8S_EVAL_SPI_SD_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
/** @addtogroup Utilities
  * @{
  */
  
/** @addtogroup STM8S_EVAL
  * @{
  */ 

/** @addtogroup Common
  * @{
  */
#define SPI_FIRSTBIT_MSB	(0x00)
#define SPI_BAUDRATEPRESCALER_64	(0x28)
#define SPI_CLOCKPOLARITY_HIGH	(0x02)
#define SPI_CLOCKPHASE_2EDGE	(0x01)
#define SPI_DATADIRECTION_2LINES_FULLDUPLEX	(0x0)
#define SPI_NSS_SOFT	(0x02)
#define SPI_MODE_MASTER	(0x04)
#define SPI_FLAG_RXNE   (0x01)
#define SPI_FLAG_TXE	(0x02) 

// MULTI_BLOCK_RW_AVIABLE = 0 : not available
// MULTI_BLOCK_RW_AVIABLE = 1 : available
#define MULTI_BLOCK_RW_AVAILABLE 0 
// GET_CSD_CID_REG_AVAILABLE = 0 : not available
// GET_CSD_CID_REG_AVAILABLE = 1 : available
#define GET_CSD_CID_REG_AVAILABLE 0 
// GET_SD_STATUS_AVAILABLE = 0 : not available
// GET_SD_STATUS_AVAILABLE = 1 : available
#define GET_SD_STATUS_AVAILABLE 0 
// CARD DETECT not used
#define CARD_DETECT_AVAILABLE 0

// For Petit FatFS, it is needed to rewrite functions:
// SD_ReadBlock() and SD_WriteBlock();
// if  REWRITE_READ_AND_WRITE_BLOCK = 1, rewrote these
// functions already.
#define REWRITE_READ_AND_WRITE_BLOCK 1
#define DEINIT_AVAILABLE 0
#define SD_VER_1 2

/** @addtogroup STM8_128_EVAL_SD_SPI
  * @{
  */
/**
  * @brief  SD SPI Interface pins
  */
#define SD_SPI_CLK                       CLK_PERIPHERAL_SPI
#define SD_SPI_SCK_PIN                   (1<<5)                  /* PC.05 */
#define SD_SPI_SCK_GPIO_PORT             GPIOC                       /* GPIOC */
#define SD_SPI_MISO_PIN                  (1<<7)                  /* PC.05 */
#define SD_SPI_MISO_GPIO_PORT            GPIOC                       /* GPIOC */
#define SD_SPI_MOSI_PIN                  (1<<6)                  /* PC.06 */
#define SD_SPI_MOSI_GPIO_PORT            GPIOC                       /* GPIOC */
#define SD_CS_PIN                        (1<<4)                  /* PE.05 */
#define SD_CS_GPIO_PORT                  GPIOC                       /* GPIOE */

#if (CARD_DETECT_AVAILABLE == 1)
#define SD_DETECT_PIN                    (1<<4)                  /* PE.04 */
#define SD_DETECT_GPIO_PORT              GPIOE                       /* GPIOE */  
#endif

/** @addtogroup STM8S_EVAL_SPI_SD
  * @{
  */  

/** @defgroup STM8S_EVAL_SPI_SD_Exported_Types
  * @{
  */ 

/** 
  * @brief  Card Specific Data: CSD Register   
  */ 
typedef struct
{
  __IO uint8_t  CSDStruct;            /*!< CSD structure */
  __IO uint8_t  SysSpecVersion;       /*!< System specification version */
  __IO uint8_t  Reserved1;            /*!< Reserved */
  __IO uint8_t  TAAC;                 /*!< Data read access-time 1 */
  __IO uint8_t  NSAC;                 /*!< Data read access-time 2 in CLK cycles */
  __IO uint8_t  MaxBusClkFrec;        /*!< Max. bus clock frequency */
  __IO uint16_t CardComdClasses;      /*!< Card command classes */
  __IO uint8_t  RdBlockLen;           /*!< Max. read data block length */
  __IO uint8_t  PartBlockRead;        /*!< Partial blocks for read allowed */
  __IO uint8_t  WrBlockMisalign;      /*!< Write block misalignment */
  __IO uint8_t  RdBlockMisalign;      /*!< Read block misalignment */
  __IO uint8_t  DSRImpl;              /*!< DSR implemented */
  __IO uint8_t  Reserved2;            /*!< Reserved */
  __IO uint32_t DeviceSize;           /*!< Device Size */
  __IO uint8_t  MaxRdCurrentVDDMin;   /*!< Max. read current @ VDD min */
  __IO uint8_t  MaxRdCurrentVDDMax;   /*!< Max. read current @ VDD max */
  __IO uint8_t  MaxWrCurrentVDDMin;   /*!< Max. write current @ VDD min */
  __IO uint8_t  MaxWrCurrentVDDMax;   /*!< Max. write current @ VDD max */
  __IO uint8_t  DeviceSizeMul;        /*!< Device size multiplier */
  __IO uint8_t  EraseGrSize;          /*!< Erase group size */
  __IO uint8_t  EraseGrMul;           /*!< Erase group size multiplier */
  __IO uint8_t  WrProtectGrSize;      /*!< Write protect group size */
  __IO uint8_t  WrProtectGrEnable;    /*!< Write protect group enable */
  __IO uint8_t  ManDeflECC;           /*!< Manufacturer default ECC */
  __IO uint8_t  WrSpeedFact;          /*!< Write speed factor */
  __IO uint8_t  MaxWrBlockLen;        /*!< Max. write data block length */
  __IO uint8_t  WriteBlockPaPartial;  /*!< Partial blocks for write allowed */
  __IO uint8_t  Reserved3;            /*!< Reserved */
  __IO uint8_t  ContentProtectAppli;  /*!< Content protection application */
  __IO uint8_t  FileFormatGrouop;     /*!< File format group */
  __IO uint8_t  CopyFlag;             /*!< Copy flag (OTP) */
  __IO uint8_t  PermWrProtect;        /*!< Permanent write protection */
  __IO uint8_t  TempWrProtect;        /*!< Temporary write protection */
  __IO uint8_t  FileFormat;           /*!< File Format */
  __IO uint8_t  ECC;                  /*!< ECC code */
  __IO uint8_t  CSD_CRC;              /*!< CSD CRC */
  __IO uint8_t  Reserved4;            /*!< always 1*/
} SD_CSD;

/** 
  * @brief  Card Identification Data: CID Register   
  */
typedef struct
{
  __IO uint8_t  ManufacturerID;       /*!< ManufacturerID */
  __IO uint16_t OEM_AppliID;          /*!< OEM/Application ID */
  __IO uint32_t ProdName1;            /*!< Product Name part1 */
  __IO uint8_t  ProdName2;            /*!< Product Name part2*/
  __IO uint8_t  ProdRev;              /*!< Product Revision */
  __IO uint32_t ProdSN;               /*!< Product Serial Number */
  __IO uint8_t  Reserved1;            /*!< Reserved1 */
  __IO uint16_t ManufactDate;         /*!< Manufacturing Date */
  __IO uint8_t  CID_CRC;              /*!< CID CRC */
  __IO uint8_t  Reserved2;            /*!< always 1 */
} SD_CID;

/** 
  * @brief SD Card information 
  */
typedef struct
{
  SD_CSD SD_csd;
  SD_CID SD_cid;
  uint32_t CardCapacity;  /*!< Card Capacity */
  uint32_t CardBlockSize; /*!< Card Block Size */
} SD_CardInfo;

/**
  * @}
  */
  
/** @defgroup STM8S_EVAL_SPI_SD_Exported_Constants
  * @{
  */ 

/**
  * @brief  SD responses and error flags
  */
#define  SD_RESPONSE_NO_ERROR         0x00
#define  SD_IN_IDLE_STATE             0x01
#define  SD_ERASE_RESET               0x02
#define  SD_ILLEGAL_COMMAND           0x04
#define  SD_COM_CRC_ERROR             0x08
#define  SD_ERASE_SEQUENCE_ERROR      0x10
#define  SD_ADDRESS_ERROR             0x20
#define  SD_PARAMETER_ERROR           0x40
#define  SD_RESPONSE_FAILURE          0xFF

/**
  * @brief  Data response error
  */
#define  SD_DATA_OK                   0x05
#define  SD_DATA_CRC_ERROR            0x0B
#define  SD_DATA_WRITE_ERROR          0x0D
#define  SD_DATA_OTHER_ERROR          0xFF
    
/**
  * @brief  Block Size
  */
#define SD_BLOCK_SIZE    0x200

/**
  * @brief  Dummy byte
  */
#define SD_DUMMY_BYTE   0xFF

/**
  * @brief  Start Data tokens:
  *         Tokens (necessary because at nop/idle (and CS active) only 0xff is 
  *         on the data/command line)  
  */
#define SD_START_DATA_SINGLE_BLOCK_READ    0xFE  /*!< Data token start byte, Start Single Block Read */
#define SD_START_DATA_MULTIPLE_BLOCK_READ  0xFE  /*!< Data token start byte, Start Multiple Block Read */
#define SD_START_DATA_SINGLE_BLOCK_WRITE   0xFE  /*!< Data token start byte, Start Single Block Write */
#define SD_START_DATA_MULTIPLE_BLOCK_WRITE 0xFD  /*!< Data token start byte, Start Multiple Block Write */
#define SD_STOP_DATA_MULTIPLE_BLOCK_WRITE  0xFD  /*!< Data toke stop byte, Stop Multiple Block Write */

/**
  * @brief  SD detection on its memory slot
  */
#define SD_PRESENT        ((uint8_t)0x01)
#define SD_NOT_PRESENT    ((uint8_t)0x00)


/**
  * @brief  Commands: CMDxx = CMD-number | 0x40
  */
#define SD_CMD_GO_IDLE_STATE          0   /*!< CMD0 = 0x40 */
#define SD_CMD_SEND_OP_COND           1   /*!< CMD1 = 0x41 */

//@DONGXIA ADDED
#define SD_CMD_IF_COND                      8   /*!< CMD8 = 0x48 */
#define SD_ACMD_41                    (0xC0+41) /*!< ACMD41 = 0xc0+41 */
#define SD_CMD_55                     55
#define SD_CMD_SEND_CSD               9   /*!< CMD9 = 0x49 */
#define SD_CMD_SEND_CID               10  /*!< CMD10 = 0x4A */
#define SD_CMD_STOP_TRANSMISSION      12  /*!< CMD12 = 0x4C */
#define SD_CMD_SEND_STATUS            13  /*!< CMD13 = 0x4D */
#define SD_CMD_SET_BLOCKLEN           16  /*!< CMD16 = 0x50 */
#define SD_CMD_READ_SINGLE_BLOCK      17  /*!< CMD17 = 0x51 */
#define SD_CMD_READ_MULT_BLOCK        18  /*!< CMD18 = 0x52 */
#define SD_CMD_SET_BLOCK_COUNT        23  /*!< CMD23 = 0x57 */
#define SD_CMD_WRITE_SINGLE_BLOCK     24  /*!< CMD24 = 0x58 */
#define SD_CMD_WRITE_MULT_BLOCK       25  /*!< CMD25 = 0x59 */
#define SD_CMD_PROG_CSD               27  /*!< CMD27 = 0x5B */
#define SD_CMD_SET_WRITE_PROT         28  /*!< CMD28 = 0x5C */
#define SD_CMD_CLR_WRITE_PROT         29  /*!< CMD29 = 0x5D */
#define SD_CMD_SEND_WRITE_PROT        30  /*!< CMD30 = 0x5E */
#define SD_CMD_SD_ERASE_GRP_START     32  /*!< CMD32 = 0x60 */
#define SD_CMD_SD_ERASE_GRP_END       33  /*!< CMD33 = 0x61 */
#define SD_CMD_UNTAG_SECTOR           34  /*!< CMD34 = 0x62 */
#define SD_CMD_ERASE_GRP_START        35  /*!< CMD35 = 0x63 */
#define SD_CMD_ERASE_GRP_END          36  /*!< CMD36 = 0x64 */
#define SD_CMD_UNTAG_ERASE_GROUP      37  /*!< CMD37 = 0x65 */
#define SD_CMD_ERASE                  38  /*!< CMD38 = 0x66 */
#define SD_CMD_58                     58

/**
  * @}
  */ 
  
/** @defgroup STM8S_EVAL_SPI_SD_Exported_Macros
  * @{
  */
/** 
  * @brief  Select SD Card: ChipSelect pin low   
  */  
#define SD_CS_LOW()     (SD_CS_GPIO_PORT->ODR &= ~SD_CS_PIN)//GPIO_WriteLow(SD_CS_GPIO_PORT, SD_CS_PIN)
/** 
  * @brief  Deselect SD Card: ChipSelect pin high   
  */ 
#define SD_CS_HIGH()     (SD_CS_GPIO_PORT->ODR |= SD_CS_PIN)//GPIO_WriteHigh(SD_CS_GPIO_PORT, SD_CS_PIN)
/**
  * @}
  */ 

/** @defgroup STM8S_EVAL_SPI_SD_Exported_Functions
  * @{
  */ 
/*----- High layer function -----*/
void SD_DeInit(void);  
uint8_t SD_Init(void);
uint8_t SD_Detect(void);
uint8_t SD_GetCardInfo(SD_CardInfo *cardinfo);
uint8_t SD_ReadBlock(uint8_t* pBuffer, uint32_t ReadAddr, uint16_t BlockSize);
uint8_t SD_ReadBuffer(uint8_t *pBuffer, uint32_t ReadAddr, uint32_t NumByteToRead);
uint8_t SD_WriteBlock(uint8_t* pBuffer, uint32_t WriteAddr, uint16_t BlockSize);
uint8_t SD_WriteBuffer(uint8_t *pBuffer, uint32_t WriteAddr, uint32_t NumByteToWrite);
uint8_t SD_GetCSDRegister(SD_CSD* SD_csd);
uint8_t SD_GetCIDRegister(SD_CID* SD_cid);
/*----- Medium layer function -----*/
void SD_SendCmd(uint8_t Cmd, uint32_t Arg, uint8_t Crc);
uint8_t SD_GetResponse(uint8_t Response);
uint8_t SD_GetDataResponse(void);
uint8_t SD_GoIdleState(void);
uint16_t SD_GetStatus(void);
/*----- Low layer function -----*/
uint8_t SD_WriteByte(uint8_t byte);
uint8_t SD_ReadByte(void);

/*------Low level function------*/
void SD_LowLevel_DeInit(void);
void SD_LowLevel_Init(void);





#endif /* __STM8S_EVAL_SPI_SD_H */
/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */ 

/**
  * @}
  */    

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/