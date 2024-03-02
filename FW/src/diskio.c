/*-----------------------------------------------------------------------*/
/* Low level disk I/O module skeleton for Petit FatFs (C)ChaN, 2014      */
/*-----------------------------------------------------------------------*/

#include "diskio.h"
#include "mmcsd.h"
#include <stdint.h>
#include "dly.h"

/*-----------------------------------------------------------------------*/
/* Inidialize a Drive                                                    */
/*-----------------------------------------------------------------------*/
DSTATUS disk_initialize ()
{
	//check if the disk is present or not
	if(SD_Detect() == SD_NOT_PRESENT)
		return STA_NODISK;
	if(SD_Init() == SD_RESPONSE_FAILURE){
		return STA_NOINIT;
	}else {
		return 0;
	}
}



/*-----------------------------------------------------------------------*/
/* Read Partial Sector                                                   */
/*-----------------------------------------------------------------------*/

DRESULT disk_readp (
	BYTE* buff,		/* Pointer to the destination object */
	DWORD sector,	/* Sector number (LBA) */
	UINT offset,	/* Offset in the sector */
	UINT count		/* Byte count (bit15:destination) */
)
{
	DRESULT res = RES_ERROR;
	uint32_t i = 0;
	/*!< SD chip select low */
	SD_CS_LOW();

	/*!< Send CMD17 (SD_CMD_READ_SINGLE_BLOCK) to read one block */
	SD_SendCmd(SD_CMD_READ_SINGLE_BLOCK, sector, 0xFF);

	/*!< Check if the SD acknowledged the read block command: R1 response (0x00: no errors) */
	if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
	{
		/*!< Now look for the data token to signify the start of the data */
		if (!SD_GetResponse(SD_START_DATA_SINGLE_BLOCK_READ))
		{
			/*!< Read the SD block data : read NumByteToRead data */
			for(i = 0; i < offset; i++){
				SD_ReadByte();
			}
			for (; i < offset+count; i++)
			{
				/*!< Save the received data */
				*buff = SD_ReadByte();

				/*!< Point to the next location where the byte read will be saved */
				buff++;
			}
			for(;i < 512; i++){
				SD_ReadByte();
			}
			/*!< Get CRC bytes (not really needed by us, but required by SD) */
			SD_ReadByte();
			SD_ReadByte();
			/*!< Set response value to success */
			res = RES_OK;
		}
	}
	/*!< SD chip select high */
	SD_CS_HIGH();

	/*!< Send dummy byte: 8 Clock pulses of delay */
	SD_WriteByte(SD_DUMMY_BYTE);

	/*!< Returns the response */
	return res;
}



/*-----------------------------------------------------------------------*/
/* Write Partial Sector                                                  */
/*-----------------------------------------------------------------------*/

DRESULT disk_writep (
	BYTE* buff,		/* Pointer to the data to be written, NULL:Initiate/Finalize write operation */
	DWORD sc		/* Sector number (LBA) or Number of bytes to send */
)
{
	static uint32_t byteLeft = 512;
	
	DRESULT res = RES_ERROR;

	if (!buff) {
		if (sc) {
			// Initiate write process
			SD_CS_LOW();
			/*!< Send CMD24 (SD_CMD_WRITE_SINGLE_BLOCK) to write multiple block */
			SD_SendCmd(SD_CMD_WRITE_SINGLE_BLOCK, sc, 0xFF);

			/*!< Check if the SD acknowledged the write block command: R1 response (0x00: no errors) */
			if (!SD_GetResponse(SD_RESPONSE_NO_ERROR))
			{
				/*!< Send a dummy byte */
				SD_WriteByte(SD_DUMMY_BYTE);
				/*!< Send the data token to signify the start of the data */
				SD_WriteByte(0xFE);
				byteLeft = 512;
				res =  RES_OK;
			} 
		} else {
			// Finalize write process
			while((byteLeft--)) {
				SD_WriteByte(0);
			}
			/*!< Put CRC bytes (not really needed by us, but required by SD) */
			SD_WriteByte(0);
			SD_WriteByte(0);

			/*!< Read data response */
			if (SD_GetDataResponse() == SD_DATA_OK){
				for (byteLeft = 5000;
					 (SD_ReadByte() != 0xFF) && byteLeft;
					  byteLeft--) {	/* Wait for ready */
					dly(10);
				}
				if(byteLeft) res = RES_OK;
			}
				
			/*!< SD chip select high */
			SD_CS_HIGH();
			/*!< Send dummy byte: 8 Clock pulses of delay */
			SD_WriteByte(SD_DUMMY_BYTE);
		}
	} else {
		// Send data to the disk
		/*!< Write the block data to SD : write count data by block */
		while((byteLeft)&&(sc))
		{
			/*!< Send the pointed byte */
			SD_WriteByte(*buff);
			/*!< Point to the next location where the byte read will be saved */
			buff++;byteLeft--;sc--;
		}
		res = RES_OK;
	}

	return res;
}



