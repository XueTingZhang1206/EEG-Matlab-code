clear
close all
data_path='C:\data\cpy\202310\20240114 work report\3-PBS-1Mpi'; %���ݴ��λ�ã����ݷ������ļ�����ʽ��ţ�ÿ���ļ���Ϊһ������ÿ���ļ����е��ĵ�Ϊ�����ĵ����ĵ��м�¼KEGG��ż�ӳ������
filedir=dir(data_path);
filenames = {filedir.name};
cnt=1;
for i = 1 : length( filedir )
%     if( isequal( filedir( i ).name, '.' )||...%�ļ���Ϊ.(ϵͳ�ģ�
%             isequal( filedir( i ).name, '..')||...%�����ļ���Ϊ..
%             ~filedir( i ).isdir)%�����ļ�����һ���ļ���
%         continue;
%     end
        mark1=strfind(filedir(i).name,'wake');
        if ~isempty(mark1)
            filename=fullfile( data_path, filedir(i).name);
            [name,txt,raw1]= xlsread(filename);
            a1=cell2mat(raw1((1:2:47),:));
            b1=cell2mat(raw1((2:2:48),:));
            c1=a1+b1;
            d1=c1/60;
        end
        mark2=strfind(filedir(i).name,'aREM');
        if ~isempty(mark2)
            filename=fullfile( data_path, filedir(i).name);
            [name,txt,raw2]= xlsread(filename);
            a2=cell2mat(raw2((1:2:47),:));
            b2=cell2mat(raw2((2:2:48),:));
            c2=a2+b2;
            d2=c2/60;
        end
        mark3=strfind(filedir(i).name,'NREM');
        if ~isempty(mark3)
            filename=fullfile(data_path, filedir(i).name);
            [name,txt,raw3]= xlsread(filename);
            a3=cell2mat(raw3((1:2:47),:));
            b3=cell2mat(raw3((2:2:48),:));
            c3=a3+b3;
            d3=c3/60;
        end
         mark4=strfind(filedir(i).name,'microarousal');
         if ~isempty(mark4)
            filename=fullfile( data_path, filedir(i).name);
            [name,txt,raw4]= xlsread(filename);
            a4=cell2mat(raw4((1:2:47),:));
            b4=cell2mat(raw4((2:2:48),:));
            c4=a4+b4;
            d4=c4/60;
        end
    end

cd(data_path);
 xlswrite('sumwake.xls',d1);
 xlswrite('summicroarousal.xls',d4);
 xlswrite('sumREM.xls',d2);
 xlswrite('sumNREM.xls',d3);
