clear
data=daqread('20240123-PFFs-#632-#633-#634-#635.daq');
y1=data(:,[1,2]);
audiowrite('1.wav',y1,512);
% wavwrite(y1,1024,16,'EEG1.wav');
y2=data(:,[3,4]);
audiowrite('2.wav',y2,512);
y3=data(:,[5,6]);
audiowrite('3.wav',y3,512);
y4=data(:,[7,8]);
audiowrite('4.wav',y4,512);
y5=data(:,[9,10]);
audiowrite('5.wav',y5,512);
y6=data(:,[11,12]);
audiowrite('6.wav',y6,512);
y7=data(:,[13,14]);
audiowrite('7.wav',y7,512);
y8=data(:,[15,16]);
audiowrite('8.wav',y8,512);

