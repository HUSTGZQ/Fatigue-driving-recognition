function [vector,result]=kmeans(img,k)
%   ���ܣ�����k-means�㷨��ͼ����зָ�
%   ����: ima-����ĻҶ�ͼ��           k-������
%   ���:  mu-��ֵ������                mask-������ͼ��
img=double(img);
copy=img;         
img=img(:);
mi=min(img);      
img=img-mi+1;     
s=length(img);
% ����ͼ��Ҷ�ֱ��ͼ
m=max(img)+1;
h=zeros(1,m);
hc=zeros(1,m);
for i=1:s
  if(img(i)>0) h(img(i))=h(img(i))+1;end;
end
ind=find(h);
hl=length(ind);
% ��ʼ������
vector=(1:k)*m/(k+1);
% start process
while(true)
  oldmu=vector;
  % ���еķ���  
  for i=1:hl
      c=abs(ind(i)-vector);
      cc=find(c==min(c));
      hc(ind(i))=cc(1);
  end
  %���¼����ֵ  
  for i=1:k, 
      a=find(hc==i);
      vector(i)=sum(a.*h(a))/sum(h(a));
  end
  if(vector==oldmu) break;end;
  end
% calculate mask
s=size(copy);
result=zeros(s);
for i=1:s(1),
for j=1:s(2),
  c=abs(copy(i,j)-vector);
  a=find(c==min(c));  
  result(i,j)=a(1);
end
end
vector=vector+mi-1;   


