/** @page DemoFW_Update How to use STVP to update the Demonstration FW

  @verbatim
  ******************** (C)COPYRIGHT 2011 STMicroelectronics *******************
  * @file     readme.txt
  * @author   MCD Application Team
  * @version  V1.1.0
  * @date     11-March-2011
  * @brief    How to use STVP to update the Demonstration FW
  ******************************************************************************
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  ******************************************************************************
   @endverbatim
  
  
@par How to use it?

 To upgrade the demonstration firmware running on your board, go through the 
 following steps:

 - Power on the STM8/128-EVAL board and connect it to your hardware programming tool.
 - Open STVP and proceed as follows:
   - Configure the ST Visual Programmer: In the 'Configure' menu, click 
      'Configure ST Visual Programmer'. 
      The Configuration dialog box opens. 
      - From the Hardware list, select the hardware you are using (STICE, RLink or 
      ST_LINK)
      - From the Programming mode list, select SWIM.     
      - From the Device list, select STM8S208xB. 
      - Click OK to save your changes and close the dialog box. 
   - Load the image STM8-128-EVAL_Demo.s19 in the STM8S208 product
      - Select 'Program MEMORY'table
      - Open the STM8-128-EVAL_Demo.s19 image file
      - Program the FLASH Program Memory table: In the Program menu, Click 'Current tab'  
   - Option bytes Programming
      - Select 'Option Byte' table
      - Set The option Byte AFR7 "Port D4 Alternate Function = BEEP"
      - Set The option Byte LSI_EN "LSI Clock available as CPU Clock Source"
      - Set The option Byte WAITESTATE "1 wait state"
      - Program the Option bytes table: In the Program menu, Click 'Current tab' 
 - Disconnect the SWIM cable to run the demonstration. The demonstration firmware is now
   programmed and you can close the STVP.

 * <h3><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h3>
 */