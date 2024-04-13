clear
close all
data_path='C:\data\cpy\SD-power spectrum\baseline';        %���ݴ��λ�ã����ݷ������ļ�����ʽ��ţ�ÿ���ļ���Ϊһ������ÿ���ļ����е��ĵ�Ϊ�����ĵ����ĵ��м�¼KEGG��ż�ӳ������
filedir=dir(data_path);
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
          mark1=strfind(sub1dir(q).name,'powerspectrumwake.');     %�ļ�������
          if ~isempty(mark1) 
           filename1=fullfile( subdirpath, sub1dir(q).name);
           raw1=load(filename1);%��ȡ����
           bout=raw1(1:24,1);%��bout�������
           xa=repmat(bout,[1,513]);
           raw11=raw1./xa;%����ÿСʱ��bout��
           
          
           rawwhole1=raw11(1:24,2:202);
           rawlight1=raw11(1:12,2:202);
           rawdark1=raw11(13:24,2:202);
           
           [m,n]=find(isnan(rawwhole1)==1);
           rawwhole1(m,:)=[];
           [m,n]=find(isnan(rawlight1)==1);
           rawlight1(m,:)=[];
           [m,n]=find(isnan(rawdark1)==1);
           rawdark1(m,:)=[];
           
           [mm11,nn11]=size(rawwhole1);  
           [mm12,nn12]=size(rawlight1); 
           [mm13,nn13]=size(rawdark1);            
           
           pwhole1(cnt,1:201)=sum(rawwhole1)/mm11;%����Сʱ��
           plight1(cnt,1:201)=sum(rawlight1)/mm12;
           pdark1(cnt,1:201)=sum(rawdark1)/mm13;
           
           
%            pnwhole1(cnt,1:201)=sum(rawwhole1)/sum(sum(rawwhole1));
%            pnlight1(cnt,1:201)=sum(rawlight1)/sum(sum(rawlight1));
%            pndark1(cnt,1:201)=sum(rawdark1)/sum(sum(rawdark1));
           cnt=cnt+1;
          end
          
      end
end

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
          mark2=strfind(sub1dir(q).name,'powerspectrumnrem.');     %�ļ�������
          if ~isempty(mark2) 
           filename2=fullfile( subdirpath, sub1dir(q).name);
          raw2=load(filename2);
          
          bout2=raw2(1:24,1);
          xb=repmat(bout2,[1,513]);              
           raw22=raw2./xb;
         
           rawwhole2=raw22(1:24,2:202);
           rawlight2=raw22(1:12,2:202);
           rawdark2=raw22(13:24,2:202);
         
           [m,n]=find(isnan(rawwhole2)==1);
           rawwhole2(m,:)=[];
           [m,n]=find(isnan(rawlight2)==1);
           rawlight2(m,:)=[];
           [m,n]=find(isnan(rawdark2)==1);
           rawdark2(m,:)=[];
           
           [mm21,nn21]=size(rawwhole2);  
           [mm22,nn22]=size(rawlight2); 
           [mm23,nn23]=size(rawdark2); 
           
            pwhole2(cnt,1:201)=sum(rawwhole2)/mm21;
           plight2(cnt,1:201)=sum(rawlight2)/mm22;
           pdark2(cnt,1:201)=sum(rawdark2)/mm23;
           
%             pnwhole2(cnt,1:201)=sum(rawwhole2)/sum(sum(rawwhole2));
%            pnlight2(cnt,1:201)=sum(rawlight2)/sum(sum(rawlight2));
%            pndark2(cnt,1:201)=sum(rawdark2)/sum(sum(rawdark2));
           cnt=cnt+1;
           end
      end
end

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
          mark3=strfind(sub1dir(q).name,'powerspectrumrem.');     %�ļ�������
          if ~isempty(mark3) 
           filename3=fullfile( subdirpath, sub1dir(q).name);
           %��ȡ����
           raw3=load(filename3);
           
           %�õ�ÿ��Сʱ��ƽ��������
           bout3=raw3(1:24,1);
           %ɾ��ֻ��һ��bout��Сʱ
           c=find(bout3==1);
           bout3(c)=0;
           xc=repmat(bout3,[1,513]);
           raw33=raw3./xc;
           
           %�õ�24h��light phase��dark phase��ÿ��Сʱ��ƽ��������
           rawwhole3=raw33(1:24,2:202);
           rawlight3=raw33(1:12,2:202);
           rawdark3=raw33(13:24,2:202);           
          %ɾȥNAֵ��inf
           [m,n]=find(isnan(rawwhole3)==1);
           rawwhole3(m,:)=[];
           [m,n]=find(rawwhole3==inf);
           rawwhole3(m,:)=[];
           
           [m,n]=find(isnan(rawlight3)==1);
           rawlight3(m,:)=[];
           [m,n]=find(rawlight3==inf);
           rawlight3(m,:)=[];
           
           [m,n]=find(isnan(rawdark3)==1);
           rawdark3(m,:)=[];
           [m,n]=find(rawdark3==inf);
           rawdark3(m,:)=[];
           
           
           [mm31,nn31]=size(rawwhole3);  
           [mm32,nn32]=size(rawlight3); 
           [mm33,nn33]=size(rawdark3); 
           
           pwhole3(cnt,1:201)=sum(rawwhole3)/mm31;
           plight3(cnt,1:201)=sum(rawlight3)/mm32;
           pdark3(cnt,1:201)=sum(rawdark3)/mm33;
%            pwhole3(cnt,1:201)=sum(rawwhole3)/sum(sum(rawwhole3));
%            plight3(cnt,1:201)=sum(rawlight3)/sum(sum(rawlight3));
%            pdark3(cnt,1:201)=sum(rawdark3)/sum(sum(rawdark3));
           cnt=cnt+1;
           end
      end
end

cd(data_path);
csvwrite('pwake.csv',pwhole1);%excel���256��
csvwrite('pwakelight.csv',plight1);
csvwrite('pwakedark.csv',pdark1);
csvwrite('pnrem.csv',pwhole2);
csvwrite('pnremlight.csv',plight2);
csvwrite('pnremdark.csv',pdark2);
csvwrite('prem.csv',pwhole3);
csvwrite('premlight.csv',plight3);
csvwrite('premdark.csv',pdark3);