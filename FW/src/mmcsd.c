/**
  ******************************************************************************
  * @file    mmcsd.c
  * @author  MCD Application Team
  * @version V1.0.0
  * @date    25-February-2011
  * @brief   This file provides a set of functions needed to manage the SPI SD
  *          Card memory mounted on STM8xx-EVAL board (refer to stm8s_eval.h
  *          to know about the boards supporting this memory).
  *          It implements a high level communication layer for read and write
  *          from/to this memory. The needed STM8 hardware resources (SPI and
  *          GPIO) are defined in stm8xx_eval.h file, and the initialization is
  *          performed in SD_LowLevel_Init() function declared in stm8xx_eval.c
  *          file.
  *          You can easily tailor this driver to any other development board,
  *          by just adapting the defines for hardware resources and
  *          SD_LowLevel_Init() function.
  *
  *          +-------------------------------------------------------+
  *          |                     Pin assignment                    |
  *          +-------------------------+---------------+-------------+
  *          |  STM8 SPI Pins         |     SD        |    Pin      |
  *          +-------------------------+---------------+-------------+
  *          | SD_SPI_CS_PIN           |   ChipSelect  |    1        |
  *          | SD_SPI_MOSI_PIN / MOSI  |   DataIn      |    2        |
  *          |                         |   GND         |    3 (0 V)  |
  *          |                         |   VDD         |    4 (3.3 V)|
  *          | SD_SPI_SCK_PIN / SCLK   |   Clock       |    5        |
  *          |                         |   GND         |    6 (0 V)  |
  *          | SD_SPI_MISO_PIN / MISO  |   DataOut     |    7        |
  *          +-------------------------+---------------+-------------+
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

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "mmcsd.h"

/** @addtogroup Utilities
  * @{
  */

/** @addtogroup STM8S_EVAL
  * @{
  */

/** @addtogroup Common
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/

/** @defgroup STM8S_EVAL_SPI_SD_Private_Functions
  * @{
  */

#if (DEINIT_AVAILABLE == 1)
/**
  * @brief  DeInitializes the SD/SD communication.
  * @param  None
  * @retval None
  */
void SD_DeInit(void)
{
  SD_LowLevel_DeInit();
}
#endif

/**
  * @brief  Initializes the SD/SD communication.
  * @param  None
  * @retval The SD Response:
  *         - SD_RESPONSE_FAILURE: Sequence failed
  *         - SD_RESPONSE_NO_ERROR: Sequence succeed
  */
uint8_t SD_Init(void)
{
  uint32_t i = 0;
  uint8_t res;

  /*!< Initialize SD_SPI */
  SD_LowLevel_Init();

  /*!< SD chip select high */
  SD_CS_LOW();

  /*!< Send dummy byte 0xFF, 10 times with CS high */
  /*!< Rise CS and MOSI for 80 clocks cycles */
  for (i = 0; i <= 9; i++)
  {
    /*!< Send dummy byte 0xFF */
    SD_WriteByte(SD_DUMMY_BYTE);
  }
  /*------------Put SD in SPI mode--------------*/
  /*!< SD initialized and set to SPI mode properly */
  res = SD_GoIdleState();
  //if GoIdeal NO ERROR, change spi clk to much higher freq 8MHz
  if(res = SD_RESPONSE_NO_ERROR){
    SPI->CR1 &= 0xc7;
		//SPI->CR1 |= 0x10;
  }
  return (res);
}

/**
 * @brief  Detect if SD card is correctly plugged in the memory slot.
 * @param  None
 * @retval Return if SD is detected or not
 */
uint8_t SD_Detect(void)
{
  __IO uint8_t status = SD_PRESENT;

  #if (CARD_DETECT_AVAILABLE == 1)
  /*!< Check GPIO to detect SD */
  if (GPIO_ReadInputData(SD_DETECT_GPIO_PORT) & SD_DETECT_PIN)
  {
    status = SD_NOT_PRESENT;
  }
  return status;
  #else
    return SD_PRESENT;
  #endif
}


#if (GET_CSD_CID_REG_AVAILABLE==1)
/**
  * @brief  Returns information about specific card.
  * @param  cardinfo: pointer to a SD_CardInfo structure that contains all SD
  *         card information.
  * @retval The SD Response:
  *         - SD_RESPONSE_FAILURE: Sequence failed
  *         - SD_RESPONSE_NO_ERROR: Sequence succeed
  */
uint8_t SD_GetCardInfo(SD_CardInfo *cardinfo)
{
  uint8_t status = SD_RESPONSE_FAILURE;

  status = SD_GetCSDRegister(&(cardinfo->SD_csd));
  status = SD_GetCIDRegister(&(cardinfo->SD_cid));
  cardinfo->CardCapacity = (cardinfo->SD_csd.DeviceSize + 1) ;
  cardinfo->CardCapacity *= (1 << (cardinfo->SD_csd.DeviceSizeMul + 2));
  cardinfo->CardBlockSize = 1 << (cardinfo->SD_csd.RdBlockLen);
  cardinfo->CardCapacity *= cardinfo->CardBlockSize;

  /*!< Returns the response */
  return status;
}
#endif

#if (REWRITE_READ_AND_WRITE_BLOCK == 0)
/**
  * @brief  Reads a block of data from the SD.
  * @param  pBuffer: pointer to the buffer that receives the data read from the
  *                  SD.
  * @param  ReadAddr: SD's internal address to read from.
  * @param  BlockSize: the SD card Data block size.
  * @retval The SD Response:
  *         - SD_RESPONSE_FAILURE: Sequence failed
  *         - SD_RESPONSE_NO_ERROR: Sequence succeed
  */
uint8_t SD_ReadBlock(uint8_t* pBuffer, uint32_t ReadAddr, uint16_t BlockSize)
{
  uint32_t i = 0;
  uint8_t rvalue = SD_RESPONSE_FAILURE;

  /*!< SD chip select low */
  SD_CS_LOW();

  /*!< Send CMD17 (SD_CMD_READ_SINGLE_BLOCK) to read one block */
  SD_SendCmd(SD_CMD_READ_SINGLE_BLOCK, ReadAddr, 0xFF);

  /*!< Check if the SD acknowledged the read block command: R1 response (0x00: no errors) */
  if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
  {
    /*!< Now look for the data token to signify the start of the data */
    if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
    {
      /*!< Read the SD block data : read NumByteToRead data */
      for (i = 0; i < BlockSize; i++)
      {
        /*!< Save the received data */
        *pBuffer = SD_ReadByte();

        /*!< Point to the next location where the byte read will be saved */
        pBuffer++;
      }
      /*!< Get CRC bytes (not really needed by us, but required by SD) */
      SD_ReadByte();
      SD_ReadByte();
      /*!< Set response value to success */
      rvalue = SD_RESPONSE_NO_ERROR;
    }
  }
  /*!< SD chip select high */
  SD_CS_HIGH();

  /*!< Send dummy byte: 8 Clock pulses of delay */
  SD_WriteByte(SD_DUMMY_BYTE);

  /*!< Returns the response */
  return rvalue;

}
#endif

#if !(MULTI_BLOCK_RW_AVAILABLE == 0)
/**
  * @brief  Read a buffer (many blocks) from the SD card.
  * @param  pBuffer : pointer to the buffer that receives the data read from the SD.
  * @param  ReadAddr : SD's internal address to read from.
  * @param  NumByteToRead : number of bytes to read from the SD.
  * @retval SD Response:
  *   - SD_RESPONSE_FAILURE: Sequence failed.
  *   - SD_RESPONSE_NO_ERROR: Sequence succeed.
  */
uint8_t SD_ReadBuffer(uint8_t *pBuffer, uint32_t ReadAddr, uint32_t NumByteToRead)
{
  uint32_t i = 0, NbrOfBlock = 0, Offset = 0;
  uint8_t rvalue = SD_RESPONSE_FAILURE;

  /* Calculate number of blocks to read */
  NbrOfBlock = NumByteToRead / SD_BLOCK_SIZE;
  /* SD chip select low */
  SD_CS_LOW();

  /* Data transfer */
  while (NbrOfBlock --)
  {
    /* Send CMD17 (SD_READ_SINGLE_BLOCK) to read one block */
    SD_SendCmd (SD_CMD_READ_SINGLE_BLOCK, ReadAddr + Offset, 0xFF);
    /* Check if the SD acknowledged the read block command: R1 response (0x00: no errors) */
    if (SD_GetResponse(SD_RESPONSE_NO_ERROR))
    {
      return  SD_RESPONSE_FAILURE;
    }
    /* Now look for the data token to signify the start of the data */
    if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
    {
      /* Read the SD block data : read NumByteToRead data */
      for (i = 0; i < SD_BLOCK_SIZE; i++)
      {
        /* Read the pointed data */
        *pBuffer = SD_ReadByte();
        /* Point to the next location where the byte read will be saved */
        pBuffer++;
      }
      /* Set next read address*/
      Offset += 512;
      /* get CRC bytes (not really needed by us, but required by SD) */
      SD_ReadByte();
      SD_ReadByte();
      /* Set response value to success */
      rvalue = SD_RESPONSE_NO_ERROR;
    }
    else
    {
      /* Set response value to failure */
      rvalue = SD_RESPONSE_FAILURE;
    }
  }

  /* SD chip select high */
  SD_CS_HIGH();
  /* Send dummy byte: 8 Clock pulses of delay */
  SD_WriteByte(SD_DUMMY_BYTE);
  /* Returns the response */
  return rvalue;
}
#endif


#if (REWRITE_READ_AND_WRITE_BLOCK == 0)
/**
  * @brief  Writes a block on the SD
  * @param  pBuffer: pointer to the buffer containing the data to be written on
  *                  the SD.
  * @param  WriteAddr: address to write on.
  * @param  BlockSize: the SD card Data block size.
  * @retval The SD Response:
  *         - SD_RESPONSE_FAILURE: Sequence failed
  *         - SD_RESPONSE_NO_ERROR: Sequence succeed
  */
uint8_t SD_WriteBlock(uint8_t* pBuffer, uint32_t WriteAddr, uint16_t BlockSize)
{
  uint32_t i = 0;
  uint8_t rvalue = SD_RESPONSE_FAILURE;

  /*!< SD chip select low */
  SD_CS_LOW();

  /*!< Send CMD24 (SD_CMD_WRITE_SINGLE_BLOCK) to write multiple block */
  SD_SendCmd(SD_CMD_WRITE_SINGLE_BLOCK, WriteAddr, 0xFF);

  /*!< Check if the SD acknowledged the write block command: R1 response (0x00: no errors) */
  if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
  {
    /*!< Send a dummy byte */
    SD_WriteByte(SD_DUMMY_BYTE);

    /*!< Send the data token to signify the start of the data */
    SD_WriteByte(0xFE);

    /*!< Write the block data to SD : write count data by block */
    for (i = 0; i < BlockSize; i++)
    {
      /*!< Send the pointed byte */
      SD_WriteByte(*pBuffer);
      /*!< Point to the next location where the byte read will be saved */
      pBuffer++;
    }

    /* Send DUMMY bytes when the number of data to be written are lower
       than the SD card BLOCK size (512 Byte) */
    for (; i != SD_BLOCK_SIZE; i++)
    {
      /* Send the pointed byte */
      SD_WriteByte(SD_DUMMY_BYTE);
    }

    /*!< Put CRC bytes (not really needed by us, but required by SD) */
    SD_WriteByte(0); //@DONGXIA: was SD_ReadByte(), and changed to write byte function
    SD_WriteByte(0); //@DONGXIA: same above line

    /*!< Read data response */
    if (SD_GetDataResponse() == SD_DATA_OK)
    {
      rvalue = SD_RESPONSE_NO_ERROR;
    }
  }
  /*!< SD chip select high */
  SD_CS_HIGH();
  /*!< Send dummy byte: 8 Clock pulses of delay */
  SD_WriteByte(SD_DUMMY_BYTE);

  /*!< Returns the response */
  return rvalue;

}

#endif


#if !(MULTI_BLOCK_RW_AVAILABLE == 0)
/**
  * @brief  Write a buffer (many blocks) in the SD card.
  * @note   The amount of data to write should be a multiple of SD card BLOCK
  *         size (512 Byte).
  * @param  pBuffer : pointer to the buffer containing the data to be written on the SD.
  * @param  WriteAddr : address to write on.
  * @param  NumByteToWrite : number of data to write.
  * @retval SD Response:
  *   - SD_RESPONSE_FAILURE: Sequence failed.
  *   - SD_RESPONSE_NO_ERROR: Sequence succeed.
  */
uint8_t SD_WriteBuffer(uint8_t *pBuffer, uint32_t WriteAddr, uint32_t NumByteToWrite)
{
  uint32_t i = 0, NbrOfBlock = 0, Offset = 0;
  uint8_t rvalue = SD_RESPONSE_FAILURE;

  /* Calculate number of blocks to write */
  NbrOfBlock = NumByteToWrite / SD_BLOCK_SIZE;
  /* SD chip select low */
  SD_CS_LOW();

  /* Data transfer */
  while (NbrOfBlock--)
  {
    /* Send CMD24 (SD_WRITE_BLOCK) to write blocks */
    SD_SendCmd(SD_CMD_WRITE_SINGLE_BLOCK, WriteAddr + Offset, 0xFF);

    /* Check if the SD acknowledged the write block command: R1 response (0x00: no errors) */
    if (SD_GetResponse(SD_RESPONSE_NO_ERROR))
    {
      return SD_RESPONSE_FAILURE;
    }
    /* Send dummy byte */
    SD_WriteByte(SD_DUMMY_BYTE);
    /* Send the data token to signify the start of the data */
    SD_WriteByte(SD_START_DATA_SINGLE_BLOCK_WRITE);
    /* Write the block data to SD : write count data by block */
    for (i = 0; i < SD_BLOCK_SIZE; i++)
    {
      /* Send the pointed byte */
      SD_WriteByte(*pBuffer);
      /* Point to the next location where the byte read will be saved */
      pBuffer++;
    }
    /* Set next write address */
    Offset += 512;
    /* Put CRC bytes (not really needed by us, but required by SD) */
    SD_ReadByte();
    SD_ReadByte();
    /* Read data response */
    if (SD_GetDataResponse() == SD_DATA_OK)
    {
      /* Set response value to success */
      rvalue = SD_RESPONSE_NO_ERROR;
    }
    else
    {
      /* Set response value to failure */
      rvalue = SD_RESPONSE_FAILURE;
    }
  }

  /* SD chip select high */
  SD_CS_HIGH();
  /* Send dummy byte: 8 Clock pulses of delay */
  SD_WriteByte(SD_DUMMY_BYTE);
  /* Returns the response */
  return rvalue;
}
#endif


#if (GET_CSD_CID_REG_AVAILABLE == 1)
/**
  * @brief  Read the CSD card register.
  *         Reading the contents of the CSD register in SPI mode is a simple
  *         read-block transaction.
  * @param  SD_csd: pointer on an SCD register structure
  * @retval The SD Response:
  *         - SD_RESPONSE_FAILURE: Sequence failed
  *         - SD_RESPONSE_NO_ERROR: Sequence succeed
  */
uint8_t SD_GetCSDRegister(SD_CSD* SD_csd)
{
  uint32_t i = 0;
  uint8_t rvalue = SD_RESPONSE_FAILURE;
  uint8_t CSD_Tab[16];

  /*!< SD chip select low */
  SD_CS_LOW();
  /*!< Send CMD9 (CSD register) or CMD10(CSD register) */
  SD_SendCmd(SD_CMD_SEND_CSD, 0, 0xFF);
  /*!< Wait for response in the R1 format (0x00 is no errors) */
  if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
  {
    if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
    {
      for (i = 0; i < 16; i++)
      {
        /*!< Store CSD register value on CSD_Tab */
        CSD_Tab[i] = SD_ReadByte();
      }
    }
    /*!< Get CRC bytes (not really needed by us, but required by SD) */
    SD_WriteByte(SD_DUMMY_BYTE);
    SD_WriteByte(SD_DUMMY_BYTE);
    /*!< Set response value to success */
    rvalue = SD_RESPONSE_NO_ERROR;
  }
  /*!< SD chip select high */
  SD_CS_HIGH();
  /*!< Send dummy byte: 8 Clock pulses of delay */
  SD_WriteByte(SD_DUMMY_BYTE);

  /*!< Byte 0 */
  SD_csd->CSDStruct = (uint8_t)((CSD_Tab[0] & 0xC0) >> 6);
  SD_csd->SysSpecVersion = (uint8_t)((CSD_Tab[0] & 0x3C) >> 2);
  SD_csd->Reserved1 = (uint8_t)(CSD_Tab[0] & 0x03);

  /*!< Byte 1 */
  SD_csd->TAAC = CSD_Tab[1];

  /*!< Byte 2 */
  SD_csd->NSAC = CSD_Tab[2];

  /*!< Byte 3 */
  SD_csd->MaxBusClkFrec = CSD_Tab[3];

  /*!< Byte 4 */
  SD_csd->CardComdClasses = CSD_Tab[4] << 4;

  /*!< Byte 5 */
  SD_csd->CardComdClasses |= (CSD_Tab[5] & 0xF0) >> 4;
  SD_csd->RdBlockLen = (uint8_t)(CSD_Tab[5] & 0x0F);

  /*!< Byte 6 */
  SD_csd->PartBlockRead = (uint8_t)((CSD_Tab[6] & 0x80) >> 7);
  SD_csd->WrBlockMisalign = (uint8_t)((CSD_Tab[6] & 0x40) >> 6);
  SD_csd->RdBlockMisalign = (uint8_t)((CSD_Tab[6] & 0x20) >> 5);
  SD_csd->DSRImpl = (uint8_t)((CSD_Tab[6] & 0x10) >> 4);
  SD_csd->Reserved2 = 0; /*!< Reserved */

  SD_csd->DeviceSize = (CSD_Tab[6] & 0x03) << 10;

  /*!< Byte 7 */
  SD_csd->DeviceSize |= (CSD_Tab[7]) << 2;

  /*!< Byte 8 */
  SD_csd->DeviceSize |= (CSD_Tab[8] & 0xC0) >> 6;

  SD_csd->MaxRdCurrentVDDMin = (uint8_t)((CSD_Tab[8] & 0x38) >> 3);
  SD_csd->MaxRdCurrentVDDMax = (uint8_t)((CSD_Tab[8] & 0x07));

  /*!< Byte 9 */
  SD_csd->MaxWrCurrentVDDMin = (uint8_t)((CSD_Tab[9] & 0xE0) >> 5);
  SD_csd->MaxWrCurrentVDDMax = (uint8_t)((CSD_Tab[9] & 0x1C) >> 2);
  SD_csd->DeviceSizeMul = (uint8_t)((CSD_Tab[9] & 0x03) << 1);
  /*!< Byte 10 */
  SD_csd->DeviceSizeMul |= (uint8_t)((CSD_Tab[10] & 0x80) >> 7);

  SD_csd->EraseGrSize = (uint8_t)((CSD_Tab[10] & 0x40) >> 6);
  SD_csd->EraseGrMul = (uint8_t)((CSD_Tab[10] & 0x3F) << 1);

  /*!< Byte 11 */
  SD_csd->EraseGrMul |= (uint8_t)((CSD_Tab[11] & 0x80) >> 7);
  SD_csd->WrProtectGrSize = (uint8_t)((CSD_Tab[11] & 0x7F));

  /*!< Byte 12 */
  SD_csd->WrProtectGrEnable = (uint8_t)((CSD_Tab[12] & 0x80) >> 7);
  SD_csd->ManDeflECC = (uint8_t)((CSD_Tab[12] & 0x60) >> 5);
  SD_csd->WrSpeedFact = (uint8_t)((CSD_Tab[12] & 0x1C) >> 2);
  SD_csd->MaxWrBlockLen = (uint8_t)((CSD_Tab[12] & 0x03) << 2);

  /*!< Byte 13 */
  SD_csd->MaxWrBlockLen |= (uint8_t)((CSD_Tab[13] & 0xC0) >> 6);
  SD_csd->WriteBlockPaPartial = (uint8_t)((CSD_Tab[13] & 0x20) >> 5);
  SD_csd->Reserved3 = 0;
  SD_csd->ContentProtectAppli = (uint8_t)(CSD_Tab[13] & 0x01);

  /*!< Byte 14 */
  SD_csd->FileFormatGrouop = (uint8_t)((CSD_Tab[14] & 0x80) >> 7);
  SD_csd->CopyFlag = (uint8_t)((CSD_Tab[14] & 0x40) >> 6);
  SD_csd->PermWrProtect = (uint8_t)((CSD_Tab[14] & 0x20) >> 5);
  SD_csd->TempWrProtect = (uint8_t)((CSD_Tab[14] & 0x10) >> 4);
  SD_csd->FileFormat = (uint8_t)((CSD_Tab[14] & 0x0C) >> 2);
  SD_csd->ECC = (uint8_t)(CSD_Tab[14] & 0x03);

  /*!< Byte 15 */
  SD_csd->CSD_CRC = (uint8_t)((CSD_Tab[15] & 0xFE) >> 1);
  SD_csd->Reserved4 = 1;

  /*!< Return the response */
  return rvalue;
}



/**
  * @brief  Read the CID card register.
  *         Reading the contents of the CID register in SPI mode is a simple
  *         read-block transaction.
  * @param  SD_cid: pointer on an CID register structure
  * @retval The SD Response:
  *         - SD_RESPONSE_FAILURE: Sequence failed
  *         - SD_RESPONSE_NO_ERROR: Sequence succeed
  */
uint8_t SD_GetCIDRegister(SD_CID* SD_cid)
{
  uint32_t i = 0;
  uint8_t rvalue = SD_RESPONSE_FAILURE;
  uint8_t CID_Tab[16];

  /*!< SD chip select low */
  SD_CS_LOW();

  /*!< Send CMD10 (CID register) */
  SD_SendCmd(SD_CMD_SEND_CID, 0, 0xFF);

  /*!< Wait for response in the R1 format (0x00 is no errors) */
  if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
  {
    if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
    {
      /*!< Store CID register value on CID_Tab */
      for (i = 0; i < 16; i++)
      {
        CID_Tab[i] = SD_ReadByte();
      }
    }
    /*!< Get CRC bytes (not really needed by us, but required by SD) */
    SD_WriteByte(SD_DUMMY_BYTE);
    SD_WriteByte(SD_DUMMY_BYTE);
    /*!< Set response value to success */
    rvalue = SD_RESPONSE_NO_ERROR;
  }
  /*!< SD chip select high */
  SD_CS_HIGH();
  /*!< Send dummy byte: 8 Clock pulses of delay */
  SD_WriteByte(SD_DUMMY_BYTE);

  /*!< Byte 0 */
  SD_cid->ManufacturerID = CID_Tab[0];

  /*!< Byte 1 */
  SD_cid->OEM_AppliID = CID_Tab[1] << 8;

  /*!< Byte 2 */
  SD_cid->OEM_AppliID |= CID_Tab[2];

  /*!< Byte 3 */
  SD_cid->ProdName1 = ((uint32_t)CID_Tab[3] << 24);

  /*!< Byte 4 */
  SD_cid->ProdName1 |= ((uint32_t)CID_Tab[4] << 16);

  /*!< Byte 5 */
  SD_cid->ProdName1 |= CID_Tab[5] << 8;

  /*!< Byte 6 */
  SD_cid->ProdName1 |= CID_Tab[6];

  /*!< Byte 7 */
  SD_cid->ProdName2 = CID_Tab[7];

  /*!< Byte 8 */
  SD_cid->ProdRev = CID_Tab[8];

  /*!< Byte 9 */
  SD_cid->ProdSN = ((uint32_t)CID_Tab[9] << 24);

  /*!< Byte 10 */
  SD_cid->ProdSN |= ((uint32_t)CID_Tab[10] << 16);

  /*!< Byte 11 */
  SD_cid->ProdSN |= CID_Tab[11] << 8;

  /*!< Byte 12 */
  SD_cid->ProdSN |= CID_Tab[12];

  /*!< Byte 13 */
  SD_cid->Reserved1 |= (uint8_t)((CID_Tab[13] & 0xF0) >> 4);
  SD_cid->ManufactDate = (CID_Tab[13] & 0x0F) << 8;

  /*!< Byte 14 */
  SD_cid->ManufactDate |= CID_Tab[14];

  /*!< Byte 15 */
  SD_cid->CID_CRC = (uint8_t)((CID_Tab[15] & 0xFE) >> 1);
  SD_cid->Reserved2 = 1;

  /*!< Return the response */
  return rvalue;
}
#endif


/**
  * @brief  Send 5 bytes command to the SD card.
  * @param  Cmd: The user expected command to send to SD card.
  * @param  Arg: The command argument.
  * @param  Crc: The CRC.
  * @retval None
  */
void SD_SendCmd(uint8_t Cmd, uint32_t Arg, uint8_t Crc)
{
  uint32_t i = 0x00;
  
  uint8_t Frame[6];

  Frame[0] = (uint8_t)(Cmd | 0x40); /*!< Construct byte 1 */

  Frame[1] = (uint8_t)(Arg >> 24); /*!< Construct byte 2 */

  Frame[2] = (uint8_t)(Arg >> 16); /*!< Construct byte 3 */

  Frame[3] = (uint8_t)(Arg >> 8); /*!< Construct byte 4 */

  Frame[4] = (uint8_t)(Arg); /*!< Construct byte 5 */

  Frame[5] = (Crc); /*!< Construct CRC: byte 6 */

  for (i = 0; i < 6; i++)
  {
    SD_WriteByte(Frame[i]); /*!< Send the Cmd bytes */
  }
}




/**
  * @brief  Get SD card data response.
  * @param  None
  * @retval The SD status: Read data response xxx0<status>1
  *         - status 010: Data accepted
  *         - status 101: Data rejected due to a crc error
  *         - status 110: Data rejected due to a Write error.
  *         - status 111: Data rejected due to other error.
  */
uint8_t SD_GetDataResponse(void)
{
  uint32_t i = 0;
  uint8_t response = 0, rvalue = 0;

  while (i <= 64)
  {
    /*!< Read response */
    response = SD_ReadByte();
    /*!< Mask unused bits */
    response &= 0x1F;
    switch (response)
    {
      case SD_DATA_OK:
      {
        rvalue = SD_DATA_OK;
        break;
      }
      case SD_DATA_CRC_ERROR:
        return SD_DATA_CRC_ERROR;
      case SD_DATA_WRITE_ERROR:
        return SD_DATA_WRITE_ERROR;
      default:
      {
        rvalue = SD_DATA_OTHER_ERROR;
        break;
      }
    }
    /*!< Exit loop in case of data ok */
    if (rvalue == SD_DATA_OK)
      break;
    /*!< Increment loop counter */
    i++;
  }

  /*!< Wait null data */
  while (SD_ReadByte() == 0);

  /*!< Return response */
  return response;
}

/**
  * @brief  Returns the SD response.
  * @param  None
  * @retval The SD Response:
  *         - SD_RESPONSE_FAILURE: Sequence failed
  *         - SD_RESPONSE_NO_ERROR: Sequence succeed
  */
uint8_t SD_GetResponse(uint8_t Response)
{
  uint32_t Count = 0xFFF;

  /*!< Check if response is got or a timeout is happen */
  while ((SD_ReadByte() != Response) && Count) 
  {
    Count--;
  }
  if (Count == 0)
  {
    /*!< After time out */
    return SD_RESPONSE_FAILURE;
  }
  else
  {
    /*!< Right response got */
    return SD_RESPONSE_NO_ERROR;
  }
}




void SD_GetResponseVal(uint8_t *pResp, uint8_t response)
{
  /*!< Check if response is got or a timeout is happen */
  if(SD_GetResponse(response) == SD_RESPONSE_FAILURE)
  {
    *pResp++ = 0xff;
  } else {
    *pResp++ = response;
  }
	
  *pResp++ = SD_ReadByte();
  *pResp++ = SD_ReadByte();
  *pResp++ = SD_ReadByte();
  *pResp++ = SD_ReadByte();
  *pResp = SD_ReadByte();
}


#if (GET_SD_STATUS_AVAILABLE == 1)
/**
  * @brief  Returns the SD status.
  * @param  None
  * @retval The SD status.
  */
uint16_t SD_GetStatus(void)
{
  uint16_t Status = 0;

  /*!< SD chip select low */
  SD_CS_LOW();

  /*!< Send CMD13 (SD_SEND_STATUS) to get SD status */
  SD_SendCmd(SD_CMD_SEND_STATUS, 0, 0xFF);

  Status = SD_ReadByte();
  Status |= (uint16_t)(SD_ReadByte() << 8);

  /*!< SD chip select high */
  SD_CS_HIGH();

  /*!< Send dummy byte 0xFF */
  SD_WriteByte(SD_DUMMY_BYTE);

  return Status;
}
#endif


#if (SD_VER_1 == 1)

uint8_t SD_GoIdleState(void)
{
  /*!< SD chip select low */
  SD_CS_LOW();

  /*!< Send CMD0 (SD_CMD_GO_IDLE_STATE) to put SD in SPI mode */
  SD_SendCmd(SD_CMD_GO_IDLE_STATE, 0, 0x95);

  /*!< Wait for In Idle State Response (R1 Format) equal to 0x01 */
  if (SD_GetResponse(SD_IN_IDLE_STATE))
  {
    /*!< No Idle State Response: return response failure */
    return SD_RESPONSE_FAILURE;
  }
  /*----------Activates the card initialization process-----------*/
  do
  {
    /*!< SD chip select high */
    SD_CS_HIGH();

    /*!< Send Dummy byte 0xFF */
    SD_WriteByte(SD_DUMMY_BYTE);

    /*!< SD chip select low */
    SD_CS_LOW();

    /*!< Send CMD1 (Activates the card process) until response equal to 0x0 */
    SD_SendCmd(SD_CMD_SEND_OP_COND, 0, 0xFF);
    /*!< Wait for no error Response (R1 Format) equal to 0x00 */
  }
  while (SD_GetResponse(SD_RESPONSE_NO_ERROR));

  /*!< SD chip select high */
  SD_CS_HIGH();

  /*!< Send dummy byte 0xFF */
  SD_WriteByte(SD_DUMMY_BYTE);

  return SD_RESPONSE_NO_ERROR;
}

#else 
/**
  * @brief  Put SD in Idle state.
  * @param  None
  * @retval The SD Response:
  *         - SD_RESPONSE_FAILURE: Sequence failed
  *         - SD_RESPONSE_NO_ERROR: Sequence succeed
  */
uint8_t SD_GoIdleState(void)
{
  uint16_t cnt = 0;
  uint8_t resp[6] = {0};
  /*!< SD chip select low */
  SD_CS_LOW();

  /*!< Send CMD0 (SD_CMD_GO_IDLE_STATE) to put SD in SPI mode */
  SD_SendCmd(SD_CMD_GO_IDLE_STATE, (uint32_t)0, 0x95);

  /*!< Wait for In Idle State Response (R1 Format) equal to 0x01 */
  if (SD_GetResponse(SD_IN_IDLE_STATE))
  {
    /*!< No Idle State Response: return response failure */
    return SD_RESPONSE_FAILURE;
  }
  /*----------Activates the card initialization process-----------*/
  SD_SendCmd(SD_CMD_IF_COND, (uint32_t)0x156, 0x43);
  SD_GetResponseVal(resp,0x01);
  if(resp[0]==0x01){
    //valid response: ver 2.00 or later card
    if ((resp[3] == 0x01)&&(resp[4] == 0x56)){
      // good voltage
			//send acmd41
        do{
            SD_SendCmd(SD_CMD_55, (uint32_t)0, 0x01);
            SD_GetResponseVal(resp,0x01);
						dly((uint32_t)100);
            SD_SendCmd(SD_ACMD_41&0x7f, (1UL<<30), 0x1);
						dly((uint32_t)10000);
            SD_GetResponseVal(resp,0x00);
        } while(resp[0]); //until resved 0x0

        SD_SendCmd(SD_CMD_58, (uint32_t)0,0x01);
        SD_GetResponseVal(resp,58);
        return SD_RESPONSE_NO_ERROR;
      }else {
				//bad voltage
				return SD_RESPONSE_FAILURE;
			}
		} else {
    //sd Ver 1.x or not sd
        //send acmd41
		do{
				SD_SendCmd(SD_CMD_55, 0, 0x01);
				SD_GetResponseVal(resp,0x01);
				dly((uint32_t)10000);
				SD_SendCmd(SD_ACMD_41&0x7f, 0UL, 0x1);
				SD_GetResponseVal(resp,0x00);
				dly((uint32_t)10000);
		} while(resp[0]);

	}
  
  /*!< SD chip select high */
  SD_CS_HIGH();

  /*!< Send dummy byte 0xFF */
  SD_WriteByte(SD_DUMMY_BYTE);

  return SD_RESPONSE_NO_ERROR;
}

#endif

/**
  * @brief  Write a byte on the SD.
  * @param  Data: byte to send.
  * @retval None
  */
uint8_t SD_WriteByte(uint8_t Data)
{
  /*!< Wait until the transmit buffer is empty */
  while (SPI->SR & (SPI_FLAG_TXE) == 0)
  {}

  /*!< Send the byte */
  SPI->DR = (Data);

  /*!< Wait to receive a byte*/
  while (SPI->SR & (SPI_FLAG_RXNE) == 0)
  {}

  /*!< Return the byte read from the SPI bus */
  return SPI->DR;
}

/**
  * @brief  Read a byte from the SD.
  * @param  None
  * @retval The received byte.
  */
uint8_t SD_ReadByte(void)
{
  uint8_t Data = 0;

  /*!< Wait until the transmit buffer is empty */
  while (SPI->SR&(SPI_FLAG_TXE) == 0)
  {}
  /*!< Send the byte */
  SPI->DR = SD_DUMMY_BYTE;

  /*!< Wait until a data is received */
  while (SPI->SR&(SPI_FLAG_RXNE) == 0)
  {}
  /*!< Get the received data */
  Data = SPI->DR;

  /*!< Return the shifted data */
  return Data;
}

/**
  * @}
  */
#if (DEINIT_AVAILABLE == 1)
//Low Level Function ----------------------------------------------
/**
  * @brief  DeInitializes the SD/SD communication.
  * @param  None
  * @retval None
  */
void SD_LowLevel_DeInit(void)
{
  SPI_Cmd(DISABLE); /*!< SD_SPI disable */

  /*!< SD_SPI Peripheral clock disable */
  CLK_PeripheralClockConfig(SD_SPI_CLK, DISABLE);

  /*!< Configure SD_SPI pins: SCK */
  GPIO_Init(SD_SPI_SCK_GPIO_PORT, SD_SPI_SCK_PIN, GPIO_MODE_IN_FL_NO_IT);

  /*!< Configure SD_SPI pins: MISO */
  GPIO_Init(SD_SPI_MISO_GPIO_PORT, SD_SPI_MISO_PIN, GPIO_MODE_IN_FL_NO_IT);

  /*!< Configure SD_SPI pins: MOSI */
  GPIO_Init(SD_SPI_MOSI_GPIO_PORT, SD_SPI_MOSI_PIN, GPIO_MODE_IN_FL_NO_IT);

  /*!< Configure SD_SPI_CS_PIN pin: SD Card CS pin */
  GPIO_Init(SD_CS_GPIO_PORT, SD_CS_PIN, GPIO_MODE_IN_FL_NO_IT);

  #if (CARD_DETECT_AVAILABLE == 1)
  /*!< Configure SD_SPI_DETECT_PIN pin: SD Card detect pin */
  GPIO_Init(SD_DETECT_GPIO_PORT, SD_DETECT_PIN, GPIO_MODE_IN_FL_NO_IT);
  #endif
}

#endif

/**
  * @brief  Initializes the SD_SPI and CS pins.
  * @param  None
  * @retval None
  */
void SD_LowLevel_Init(void)
{
  /* Enable SPI clock */
  //CLK_PeripheralClockConfig(SD_SPI_CLK, ENABLE);

  /* Set the MOSI,MISO and SCK at high level */
  //GPIO_ExternalPullUpConfig(SD_SPI_SCK_GPIO_PORT, (GPIO_Pin_TypeDef)( SD_SPI_MISO_PIN | SD_SPI_MOSI_PIN | \
  //                          SD_SPI_SCK_PIN), ENABLE);

  /* SD_SPI Configuration */
  SPI->CR1 = SPI_FIRSTBIT_MSB | SPI_BAUDRATEPRESCALER_64|SPI_CLOCKPOLARITY_HIGH | SPI_CLOCKPHASE_2EDGE;
  /* Data direction configuration: BDM, BDOE and RXONLY bits */
  SPI->CR2 = SPI_DATADIRECTION_2LINES_FULLDUPLEX|SPI_NSS_SOFT|SPI_CR2_SSI;
  /* Master/Slave mode configuration */
  SPI->CR1 |= SPI_MODE_MASTER;
  /* CRC configuration */
  SPI->CRCPR = 0x07;

  /* SD_SPI enable */
  SPI->CR1 |= SPI_CR1_SPE;

  /* Set MSD ChipSelect pin in Output push-pull high level */
  //GPIO_Init(SD_CS_GPIO_PORT, SD_CS_PIN, GPIO_MODE_OUT_OD_HIZ_SLOW);
  SD_CS_GPIO_PORT->CR2 &= (~SD_CS_PIN); //Reset corresponding bit
  SD_CS_GPIO_PORT->ODR |= SD_CS_PIN; // high level
  SD_CS_GPIO_PORT->DDR |= SD_CS_PIN; // output mode 
  SD_CS_GPIO_PORT->CR1 &= ~SD_CS_PIN; //open drain here
}



/**
  * @}
  */

/**
  * @}
  */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
