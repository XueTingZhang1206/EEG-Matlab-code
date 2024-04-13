%��ȡreport�е����� ˳�� wake REM NREM microarousal 
%1-4�� sleep percentage
%5-8�� bout count
%9-12�� mean bout duration
%13-19��  transition  ˳��  WAKE-NREM  REM-WAKE  REM-NREM REM-microarousal NREM-microarousal NREM-WAKE NREM-REM

clear
close all
data_path='C:\data\cpy\SD-power spectrum\baseline';        %���ݴ��λ�ã����ݷ������ļ�����ʽ��ţ�ÿ���ļ���Ϊһ������ÿ���ļ����е��ĵ�Ϊ�����ĵ����ĵ��м�¼KEGG��ż�ӳ������
filedir=dir(data_path);
filenames = {filedir.name};
cnt=1;
for i = 1 : length( filedir )
    if( isequal( filedir( i ).name, '.' )||...%�ļ���Ϊ.(ϵͳ�ģ�
            isequal( filedir( i ).name, '..')||...%�����ļ���Ϊ..
            ~filedir( i ).isdir)%�����ļ�����һ���ļ���
        continue;
    end
    subdirpath = fullfile( data_path, filedir( i ).name);     %�ļ�������
    sub1dir= dir( subdirpath );                                                 %�ļ������ļ�����
    for q=1:length(sub1dir)
        if( isequal( sub1dir(q).name, '.' )||...
                isequal( sub1dir(q).name, '..'))
            continue;
        end
        
        mark=strfind(sub1dir(q).name,'Rodent Sleep Report (whole');     %�ļ�������
        if ~isempty(mark)
            filename=fullfile( subdirpath, sub1dir(q).name);
            [name,txt,raw]= xlsread(filename);
             percentagewake(cnt)=raw{63,9};
             percentagerem(cnt)=raw{65,9};
             perpercentagenrem(cnt)=raw{66,9};
             percentagemicroarousal(cnt)=raw{64,9};
                       
            COUNTWAKE(cnt)=raw{87,4};
            COUNTREM(cnt)=raw{88,4};
            COUNTNREM(cnt)=raw{89,4};
            COUNTmicroarousal(cnt)=raw{86,4};
            MEANDURATIONWAKE(cnt)=raw{87,8};
            MEANDURATIONREM(cnt)=raw{88,8};
            MEANDURATIONNREM(cnt)=raw{89,8};
            MEANDURATIOmicroarousal(cnt)=raw{86,8};
             WAKEvNREM(cnt)=raw{75,17};
            REMvWAKE(cnt)=raw{77,5};
            REMvNREM(cnt)=raw{77,17};
            REMvmicroarousal(cnt)=raw{77,9};
            NREMvmicroarousal(cnt)=raw{78,9};
            NREMvWAKE(cnt)=raw{78,5};
            NREMvREM(cnt)=raw{78,13};
            totalscoringtime(cnt)=raw{21,11};
            totalsleeptime(cnt)=raw{23,11};
            waketimeaftersleeponset(cnt)=raw{25,11};
            sleepperiod(cnt)=raw{26,11};
            sleeponset(cnt)=raw{28,11};
            NREMonset(cnt)=raw{30,11};
            REMonset(cnt)=raw{31,11};
            
            cnt=cnt+1;
            
        end
        
    end
end
filenames=filenames(1,3:cnt+1);
A=[percentagewake;percentagerem;perpercentagenrem;percentagemicroarousal;COUNTWAKE;COUNTREM;COUNTNREM; COUNTmicroarousal;MEANDURATIONWAKE;MEANDURATIONREM; MEANDURATIONNREM;MEANDURATIOmicroarousal; WAKEvNREM; REMvWAKE; REMvNREM;NREMvWAKE;NREMvREM;REMvmicroarousal;NREMvmicroarousal; totalscoringtime;totalsleeptime; waketimeaftersleeponset;sleepperiod;sleeponset;NREMonset;REMonset];
xlswrite('C:\data\cpy\SD-power spectrum\baseline\bout.xls',A);


cnt=1;
for i = 1 : length( filedir )
    if( isequal( filedir( i ).name, '.' )||...%�ļ���Ϊ.(ϵͳ�ģ�
            isequal( filedir( i ).name, '..')||...%�����ļ���Ϊ..
            ~filedir( i ).isdir)%�����ļ�����һ���ļ���
        continue;
    end
    subdirpath = fullfile( data_path, filedir( i ).name);     %�ļ�������
    sub1dir= dir( subdirpath );                                                 %�ļ������ļ�����
    for q=1:length(sub1dir)
        if( isequal( sub1dir(q).name, '.' )||...
                isequal( sub1dir(q).name, '..'))
            continue;
        end
        
        mark=strfind(sub1dir(q).name,'Rodent Sleep Report (dark');     %�ļ�������
        if ~isempty(mark)
            filename=fullfile( subdirpath, sub1dir(q).name);
            [name,txt,raw]= xlsread(filename);
            percentagewakedark(cnt)=raw{63,9};
             percentageremdark(cnt)=raw{65,9};
             perpercentagenremdark(cnt)=raw{66,9};
             percentagemicroarousaldark(cnt)=raw{64,9};
                       
            COUNTWAKEdark(cnt)=raw{87,4};
            COUNTREMdark(cnt)=raw{88,4};
            COUNTNREMdark(cnt)=raw{89,4};
            COUNTmicroarousaldark(cnt)=raw{86,4};
            MEANDURATIONWAKEdark(cnt)=raw{87,8};
            MEANDURATIONREMdark(cnt)=raw{88,8};
            MEANDURATIONNREMdark(cnt)=raw{89,8};
            MEANDURATIOmicroarousaldark(cnt)=raw{86,8};
             WAKEvNREMdark(cnt)=raw{75,17};
            REMvWAKEdark(cnt)=raw{77,5};
            REMvNREMdark(cnt)=raw{77,17};
            NREMvWAKEdark(cnt)=raw{78,5};
            NREMvREMdark(cnt)=raw{78,13};
             REMvmicroarousaldark(cnt)=raw{77,9};
            NREMvmicroarousaldark(cnt)=raw{78,9};
            totalscoringtime(cnt)=raw{21,11};
            totalsleeptime(cnt)=raw{23,11};
            waketimeaftersleeponset(cnt)=raw{25,11};
            sleepperiod(cnt)=raw{26,11};
            sleeponset(cnt)=raw{28,11};
            NREMonset(cnt)=raw{30,11};
            REMonset(cnt)=raw{31,11};
            cnt=cnt+1;
            
        end
        
    end
end
B=[percentagewakedark;percentageremdark;perpercentagenremdark;percentagemicroarousaldark;COUNTWAKEdark;COUNTREMdark;COUNTNREMdark; COUNTmicroarousaldark;MEANDURATIONWAKEdark;MEANDURATIONREMdark; MEANDURATIONNREMdark;MEANDURATIOmicroarousaldark;WAKEvNREMdark; REMvWAKEdark; REMvNREMdark;NREMvWAKEdark;NREMvREMdark;REMvmicroarousaldark;NREMvmicroarousaldark; totalscoringtime;totalsleeptime; waketimeaftersleeponset;sleepperiod;sleeponset;NREMonset;REMonset;];
xlswrite('C:\data\cpy\SD-power spectrum\baseline\bout(dark).xls',B);

cnt=1;
for i = 1 : length( filedir )
    if( isequal( filedir( i ).name, '.' )||...%�ļ���Ϊ.(ϵͳ�ģ�
            isequal( filedir( i ).name, '..')||...%�����ļ���Ϊ..
            ~filedir( i ).isdir)%�����ļ�����һ���ļ���
        continue;
    end
    subdirpath = fullfile( data_path, filedir( i ).name);     %�ļ�������
    sub1dir= dir( subdirpath );                                                 %�ļ������ļ�����
    for q=1:length(sub1dir)
        if( isequal( sub1dir(q).name, '.' )||...
                isequal( sub1dir(q).name, '..'))
            continue;
        end
        
        mark=strfind(sub1dir(q).name,'Rodent Sleep Report (light');     %�ļ�������
        if ~isempty(mark)
            filename=fullfile( subdirpath, sub1dir(q).name);
            [name,txt,raw]= xlsread(filename);
            
            percentagewakelight(cnt)=raw{63,9};
             percentageremlight(cnt)=raw{65,9};
             perpercentagenremlight(cnt)=raw{66,9};
             percentagemicroarousallight(cnt)=raw{64,9};
                       
            COUNTWAKElight(cnt)=raw{87,4};
            COUNTREMlight(cnt)=raw{88,4};
            COUNTNREMlight(cnt)=raw{89,4};
            COUNTmicroarousallight(cnt)=raw{86,4};
            MEANDURATIONWAKElight(cnt)=raw{87,8};
            MEANDURATIONREMlight(cnt)=raw{88,8};
            MEANDURATIONNREMlight(cnt)=raw{89,8};
            MEANDURATIOmicroarousallight(cnt)=raw{86,8};
             WAKEvNREMlight(cnt)=raw{75,17};
            REMvWAKElight(cnt)=raw{77,5};
            REMvNREMlight(cnt)=raw{77,17};
            NREMvWAKElight(cnt)=raw{78,5};
            NREMvREMlight(cnt)=raw{78,13};
            REMvmicroarousallight(cnt)=raw{77,9};
            NREMvmicroarousallight(cnt)=raw{78,9};
            totalscoringtime(cnt)=raw{21,11};
            totalsleeptime(cnt)=raw{23,11};
            waketimeaftersleeponset(cnt)=raw{25,11};
            sleepperiod(cnt)=raw{26,11};
            sleeponset(cnt)=raw{28,11};
            NREMonset(cnt)=raw{30,11};
            REMonset(cnt)=raw{31,11};
            cnt=cnt+1;
            
        end
        
    end
end
C=[percentagewakelight;percentageremlight;perpercentagenremlight;percentagemicroarousallight;COUNTWAKElight;COUNTREMlight;COUNTNREMlight; COUNTmicroarousallight;MEANDURATIONWAKElight;MEANDURATIONREMlight; MEANDURATIONNREMlight;MEANDURATIOmicroarousallight;WAKEvNREMlight; REMvWAKElight; REMvNREMlight;NREMvWAKElight;NREMvREMlight;REMvmicroarousallight;NREMvmicroarousallight; totalscoringtime;totalsleeptime; waketimeaftersleeponset;sleepperiod;sleeponset;NREMonset;REMonset;];
xlswrite('C:\data\cpy\SD-power spectrum\baseline\bout(light).xls',C);





