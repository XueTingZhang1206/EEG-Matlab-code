clear
close all
data_path='C:\data\cpy\SD-power spectrum\baseline';        %���ݴ��λ�ã����ݷ������ļ�����ʽ��ţ�ÿ���ļ���Ϊһ������ÿ���ļ����е��ĵ�Ϊ�����ĵ����ĵ��м�¼KEGG��ż�ӳ������
filedir=dir(data_path);
for i = 1 : length( filedir )
    if( isequal( filedir( i ).name, '.' )||...%�ļ���Ϊ.(ϵͳ�ģ�
            isequal( filedir( i ).name, '..')||...%�����ļ���Ϊ..
            ~filedir( i ).isdir)%�����ļ�����һ���ļ���
        continue;
    end
    subdirpath = fullfile( data_path, filedir( i ).name);     %�ļ�������
    sub1dir=dir( subdirpath );                                                 %�ļ������ļ�����
    for q=1:length(sub1dir)
        if( isequal( sub1dir(q).name, '.' )||...
                isequal( sub1dir(q).name, '..'))
            continue;
        end
          mark=strfind(sub1dir(q).name,'periods');     %�ļ�������
          if ~isempty(mark) 
           filename=fullfile( subdirpath, sub1dir(q).name);
            [name,txt,raw]= xlsread(filename);%��ʼֵΪ0,1����ӵڶ��п�ʼ��
          
          for j=1:24 
              periodshour=raw((j-1)*720+1:j*720,:);%ÿ720����ȡ����
              
              xwake=find(strcmp(periodshour(:,2),'W'));%��wake�������ҳ���
              xnrem=find(strcmp(periodshour(:,2),'S'));
              xrem=find(strcmp(periodshour(:,2),'P'));
              xmicroarousal=find(strcmp(periodshour(:,2),'M'));
              
              boutwake(j)=length(xwake);
              boutnrem(j)=length(xnrem);
              boutrem(j)=length(xrem);
              boutmicroarousal(j)=length(xmicroarousal);
              
              wake=periodshour(xwake,1:515);%��wake�����������
              y1=find(cell2mat(wake(1:(size(wake,1)),3))<2);%ɾѡwake�׶�delta����ֵС��
              wake1=wake(y1,4:515);
%               [m,n]=find(isnan(wake1)==1);
%               wake1(m,:)=[];
              wake2=cell2mat(wake1);
              pwake(j,1:512)=sum(wake2);

              nrem=periodshour(xnrem,1:515);%��nrem�����������
              y2=find(cell2mat(nrem(1:(size(nrem,1)),3))<5);
              nrem1=nrem(y2,4:515);
%               [m,n]=find(isnan(nrem1)==1);
%               wake1(m,:)=[];
              nrem2=cell2mat(nrem1);%��nrem��Ƶ�������
              pnrem(j,1:512)=sum(nrem2);

              rem=periodshour(xrem,1:515);%��rem�����������
              y3=find(cell2mat(rem(1:(size(rem,1)),3))<1.9);
              rem1=rem(y3,4:515);
%               [m,n]=find(isnan(rem1)==1);
%               rem1(m,:)=[];
              rem2=cell2mat(rem1);%��rem��Ƶ�������
              prem(j,1:1:512)=sum(rem2);

              microarousal=periodshour(xmicroarousal,1:515);%��microarousal�����������
              y4=find(cell2mat(microarousal(1:(size(microarousal,1)),3))<2);
              microarousal1=microarousal(y4,4:515);
%               [m,n]=find(isnan(microarousal1)==1);
%               microarousal1(m,:)=[];
              microarousal2=cell2mat(microarousal1);%��microarousal��Ƶ�������
              pmicroarousal(j,1:1:512)=sum(microarousal2);

              j=j+1;
          end        
        boutwake2=boutwake';
        boutnrem2=boutnrem';
        boutrem2=boutrem';
        boutmicroarousal2=boutmicroarousal';
        
        powerspectrumwake=[boutwake2,pwake];
        powerspectrumnrem=[boutnrem2,pnrem];
        powerspectrumrem=[boutrem2,prem];
        powerspectrummicroarousal=[boutmicroarousal2,pmicroarousal];
        
        cd(subdirpath);
        csvwrite('powerspectrumwake.csv',powerspectrumwake);%excel���256��
        csvwrite('powerspectrumnrem.csv',powerspectrumnrem);
        csvwrite('powerspectrumrem.csv',powerspectrumrem);
        csvwrite('powerspectrummicroarousal.csv',powerspectrummicroarousal); 
     end 
   end
end