clear
close all
data_path='C:\data\cpy\202310\20240114 work report\3-PBS-1Mpi'; %���ݴ��λ�ã����ݷ������ļ�����ʽ��ţ�ÿ���ļ���Ϊһ������ÿ���ļ����е��ĵ�Ϊ�����ĵ����ĵ��м�¼KEGG��ż�ӳ������
b=xlsread('\\192.168.221.1\1\Lab stuff\Helab protocols\EEG\3 ��ȡreport�е����� ÿ���Сʱ��ͬ˯�߽׶�ռ��ʱ�� ע���¼��ʼʱ��\sleep.xlsx');
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
        
        mark=strfind(sub1dir(q).name,'Rodent Sleep Statistics Report (whole');     %�ļ�������
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
 xlswrite('C:\data\cpy\202310\20240114 work report\3-PBS-1Mpi\wake.xls',wake);
 xlswrite('C:\data\cpy\202310\20240114 work report\3-PBS-1Mpi\microarousal.xls',microarousal);
 xlswrite('C:\data\cpy\202310\20240114 work report\3-PBS-1Mpi\aREM.xls',REM);
 xlswrite('C:\data\cpy\202310\20240114 work report\3-PBS-1Mpi\NREM.xls',NREM);
  
 