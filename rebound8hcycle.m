clear
close all
data_path='Z:\ZXT\2 ��������\EEG\sleep rebound\FAD\light phase rebound\fad'; %���ݴ��λ�ã����ݷ������ļ�����ʽ��ţ�ÿ���ļ���Ϊһ������ÿ���ļ����е��ĵ�Ϊ�����ĵ����ĵ��м�¼KEGG��ż�ӳ������
b=xlsread('Z:\Lab stuff\Helab protocols\EEG\3 ��ȡreport�е����� ÿ���Сʱ��ͬ˯�߽׶�ռ��ʱ�� ע���¼��ʼʱ��\sleep8h.xlsx');
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
        
        mark=strfind(sub1dir(q).name,'Rodent Sleep Statistics Report (rebound8h');     %�ļ�������
        if ~isempty(mark)
            filename=fullfile( subdirpath, sub1dir(q).name);
            [name,txt,raw]= xlsread(filename);
            wake(:,cnt)=raw(b(:,1),5);
            microarousal(:,cnt)=raw(b(:,1),7);
            REM(:,cnt)=raw(b(:,1),9);
            NREM(:,cnt)=raw(b(:,1),12);%��ȡ����
            cnt=cnt+1;
            
        end
    end
end
 xlswrite('Z:\ZXT\2 ��������\EEG\sleep rebound\FAD\light phase rebound\fad\wake.xls',wake);
 xlswrite('Z:\ZXT\2 ��������\EEG\sleep rebound\FAD\light phase rebound\fad\microarousal.xls',microarousal);
 xlswrite('Z:\ZXT\2 ��������\EEG\sleep rebound\FAD\light phase rebound\fad\aREM.xls',REM);
 xlswrite('Z:\ZXT\2 ��������\EEG\sleep rebound\FAD\light phase rebound\fad\NREM.xls',NREM);
  
 