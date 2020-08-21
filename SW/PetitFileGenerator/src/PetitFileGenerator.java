import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;


public class PetitFileGenerator {

    private static int fileNum = 0;
    private static int fileName = 0;
    private static int fileSz = 0;
    private static int samplingFreq = 0;
    private static boolean isFullResolution = false;
    private static int channel = 0xff;

    public static void main(String[] args) throws IOException {

        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        for(int idx = 0; idx < 6; idx++){
            while(true){
                printMenu(idx);
                //read from line
                String str = reader.readLine();
                if(isValidData(idx, str)){
                    if(idx == 0x00) fileSz = Integer.parseInt(str);
                    if(idx == 0x01) fileNum = Integer.parseInt(str);
                    if(idx == 0x02) fileName = Integer.parseInt(str);
                    if(idx == 0x03) samplingFreq = Integer.parseInt(str);
                    if(idx == 0x04) {
                        if(str.equalsIgnoreCase("YES")) isFullResolution = true;
                        if(str.equalsIgnoreCase("NO")) isFullResolution = false;
                    }
                    if(idx == 0x05) channel = Integer.parseInt(str);
                    break;
                } else {
                    System.out.println("Input error!!! Check your input value");
                }
            }
        }

        //generate files
        String currDir = System.getProperty("user.dir");
        for(int idx = 0; idx < fileNum; idx++){
            OutputStream out = new BufferedOutputStream(
                Files.newOutputStream(Paths.get(currDir+"/"+getFileName(fileName+idx))));
                byte[] datas = new byte[fileSz*512];
                for(int cnt = 0; cnt < fileSz*512; cnt++)
                    datas[cnt] = 0;
                out.write(datas);
                out.close(); 
        }
        System.out.println("Files Created...");

        //generate cfg file
        OutputStream out = new BufferedOutputStream(Files.newOutputStream(Paths.get(currDir+"/CFG")));
        byte[] cfg = GenerateCfgBuffer();

        out.write(cfg);
        out.close();
        System.out.println("cfg File Created...");
    }




    static void printMenu(int i)
    {
        String str = "";
        switch(i)
        {
            case 0: str = "** Enter File Size(1 Block = 512Bytes)    **";break;
            case 1: str = "** Enter No. of Files to Write to SD      **";break;
            case 2: str = "** Enter First File Name (0000)           **";break;
            case 3: str = "** Enter Sampling Freq (100-10000Hz)      **";break;
            case 4: str = "** Full resolution? (10Bits)YES/(8bits)NO **";break;
            case 5: str = "** Select Channel:                        **\n"+
                          "** XXXX XXXX (1: select) LSB=CH1, MSB=CH8 **";break;   
        }

        System.out.println("********************************************");
        System.out.println("**       File Generator for Petit FS      **");
        System.out.println("********************************************");
        System.out.println(str);
        System.out.println("**----------------------------------------**");
    }

    static boolean isValidData(int i, String str)
    {
        if(i == 0x0)
        {
            try{
                Integer sz = Integer.parseInt(str);
                if(sz == 0) throw new Exception();
                return true;
            }catch (Exception e){
                return false;
            }
        }

        //No of file to write to sd card
        if(i == 0x01)
        {
            try{
                Integer sz = Integer.parseInt(str);
                if((sz < 1) || (sz > 9999)) throw new Exception();
                return true;
            }catch (Exception e){
                return false;
            }
        }

        //the first file name
        if(i == 0x02)
        {
            try{
                Integer sz = Integer.parseInt(str);
                if((sz < 0) || (sz > 9999)) throw new Exception();
                if(sz + fileNum > 10000) throw new Exception();
                return true;
            }catch (Exception e){
                return false;
            }
        }

        //sampling freq
        if(i == 0x03){
            try{
                Integer sz = Integer.parseInt(str);
                if((sz < 100) || (sz > 10000)) throw new Exception();
                return true;
            }catch (Exception e){
                return false;
            }
        }

        //full resolution
        if(i == 0x04){
            try{
                if((str.equalsIgnoreCase("YES")) || (str.equalsIgnoreCase("NO"))){
                    return true;
                } else {
                    return false;
                }
            }catch (Exception e){
                return false;
            }
        }

        //Channel
        if(i == 0x05){
            try{
                Integer.parseInt(str);
                return true;
            }catch (Exception e){
                return false;
            }
        }

        return false;
    }


    static String getFileName(Integer i)
    {
        if(i < 10) return "000"+i.toString();
        if(i < 100) return "00"+i.toString();
        if(i < 1000) return "0"+i.toString();
        if(i < 10000) return i.toString();
        return "";
    }

    static byte[] GenerateCfgBuffer(){
        byte[] cfgBuffer = new byte[13];

        //get sampling freq
        cfgBuffer[0] = (byte)(samplingFreq&0xff);
        cfgBuffer[1] = (byte)((samplingFreq&0xff00)>>8);
        //get first file name
        cfgBuffer[2] = (byte)(fileName&0xff);
        cfgBuffer[3] = (byte)((fileName&0xff00)>>8);
        //get no. of files
        cfgBuffer[4] = (byte)(fileNum&0xff);
        cfgBuffer[5] = (byte)((fileNum&0xff00)>>8);
        //get  files sz in block
        cfgBuffer[6] = (byte)(fileSz&0xff);
        cfgBuffer[7] = (byte)((fileSz&0xff00)>>8);
        cfgBuffer[8] = (byte)((fileSz&0xff0000)>>16);
        cfgBuffer[9] = (byte)((fileSz&0xff000000)>>24);
        //get channel number
        cfgBuffer[10] = (byte)(channel&0xff);
        //resolutiion setting
        if(isFullResolution){
            cfgBuffer[11] = 0x01;
        } else {
            cfgBuffer[11] = 0x00;
        }

        byte crc = 0;
        for(int i = 0; i < 12; i++){
            crc += cfgBuffer[i];
        }
        cfgBuffer[12] = crc;

        return cfgBuffer;
    }

        
}
