% STM8s DataLogger Data Visualiser
% stm8sDataViewer.m
% Author: Dong Xia
% 20/Agu/2020
%%
% how many channel used.
channelNo = 2;

%% file read
[filename, pathname] = uigetfile();
fid = fopen([pathname, filename],'r','b');
datas = fread(fid, inf, 'uint16');
fclose(fid);

%% seperate channels

for i = 1:channelNo
    plot(datas(i:channelNo:end));hold on;
end


