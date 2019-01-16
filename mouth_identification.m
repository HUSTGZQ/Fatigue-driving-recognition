clear;
clc;
img_original=imread('34.jpg');
img=rgb2gray(img_original);
kkk1=0.36;
kkk2=0.15;
P=100;
% figure;
% imshow(img);
 k=3;
[vector,result]=kmeans(img,k);
%figure,imshow(result,[]);title('k=3');
%mask1=rgb2gray(mask);
result=uint8(result);
level=graythresh(result);
result1=im2bw(result,level);
result1=double(result1);
figure,imshow(result1,[]);title('��ֵ');

%%
%���ͷ��
%����ÿ�еĲ����Ϊ1��ֵ��������white_row,���ж����max
[M,N]=size(result1);
count=0;
zhongjian=2;
zhongjian1=0;
white_row=zeros(M,1);
for i=1:M
    for j=1:N
        if result1(i,j)==1
            count=count+1;
            zhongjian1=count;
        else
            if zhongjian<count
            zhongjian=count;
            else 
                zhongjian=zhongjian;
            end
            count=0;
        end
    end
    count=0;
    if zhongjian~=2
    white_row(i,1)=zhongjian;
    %zhongjian=2;
    else
         white_row(i,1)=zhongjian1;
    end
    zhongjian=2;
    zhongjian1=0;
end
white_row_max=max(white_row);
%ȷ����ֵ���ҵ�under��
% threshold=200;
% diff=zeros(M,1);
% for i=2:M
%     diff(i,1)=white_row(i,1)-white_row(i-1,1);
% end
% get_index=find(diff>=threshold-140);
% [amount,nan]=size(get_index);
% get_index(find(get_index<=600))=0;
% get_index(find(get_index>=1000))=0;
% get_under=get_index(find(get_index~=0));
% under_line=mean(get_under)+30;   %%%%%%%%%

thres=white_row_max*0.4;
index_under=find(white_row<=thres);
index_under(find(index_under>=M*0.8))=0;
under_line=max(index_under);
%�ҵ�top��
blank=find(white_row==0);
blank_max=max(blank);
top_line=blank_max-30;
new_img=img(top_line:under_line,:);
%imshow(new_img);
level_=graythresh(new_img);
new_b=im2bw(new_img,level_);
%imshow(new_b);
[M_,N_]=size(new_b);
col_zhongjian=0;
for i=1:ceil(N_/3)
    if new_b(:,i)==0
        col_zhongjian=i;
    else
        col_zhongjian=col_zhongjian;
    end
end
left_line=col_zhongjian;
col_zhongjian=0;
for i=1:ceil(N_/2)
    if mean(new_b(:,N_-i))<=0.15
        col_zhongjian=N_-i;
    else
        col_zhongjian=col_zhongjian;
    end
end
right_line=col_zhongjian+30;
%%
%��ȡ�沿
img_get=img_original(ceil(top_line):ceil(under_line)-30,ceil(left_line)+1:ceil(right_line));
figure;
imshow(img_get);
%%
%���沿���ж�ֵ����,��������close����,�ҳ���Ե
level=graythresh(img_get);
img_get_2=im2bw(img_get,level);
img_get_2=double(img_get_2);

se=strel('disk',8');%Բ���ͽṹԪ��
fc=imclose(img_get_2,se);%ֱ�ӱ�����
fc_=imclose(fc,se);%ֱ�ӱ�����
eg = bwperim(fc_);

%���ñ�Ե��������������Ѱ��eyes��
%[L,num]=bwlabel(eg,8);
img_get_2_=1-img_get_2;
[L,num]=bwlabel(img_get_2_,8);%%��ע������ͼ���������ӵĲ���
plot_x=zeros(1,1);         %%���ڼ�¼����λ�õ�����
plot_y=zeros(1,1);

%%������
sum_x=0;sum_y=0;area=0;

[height,width]=size(img_get_2_);
for i=1:height
    for j=1:width
        if L(i,j)==1
            sum_x=sum_x+i;
            sum_y=sum_y+j;
            area=area+1;
        end
    end
end
%%��������
plot_x(1)=fix(sum_x/area);
plot_y(1)=fix(sum_y/area);
% figure(2);imshow(img_get_2_);
% 
% %%������ĵ�
% hold on
% plot(plot_y(1) ,plot_x(1), '*')
% se_=strel('line',10,0);%Բ���ͽṹԪ��
% fc_=imclose(img_get_2_,se_);%ֱ�ӱ�����
% fc__=imclose(fc_,se_);%ֱ�ӱ�����
% fc___=imclose(fc__,se_);
% fc____=imclose(fc___,se_);
% figure;imshow(fc____);
% [vector_,result_]=kmeans(img_get,4);
% result_=uint8(result_);
% level_=graythresh(result_);
% result1_=im2bw(result_,level_);
% result1_=double(result1_);
% imshow(result1_);
%%
%����:���������۵��ձ�λ�ö�λ��
%����ͼ���ĸ���Ч����С��
%����
 [mm,nn]=size(img_get_2_);
 kk=0.45;
for i=1:mm
    sum_lie(i,1)=sum(img_get_2(i,:));
end
for i=1:nn
    sum_hang(1,i)=sum(img_get_2(:,i));
end
   top_=max(find(sum_lie<=5));
   zhongjian=0;
   for i=1:mm-ceil(0.75*mm)+1
      if sum_lie(i+ceil(0.75*mm)-1,1)<=kk*nn
          zhongjian=zhongjian+1;
      else
          zhongjian=zhongjian;
      end
   end
   if zhongjian==0
       under_=mm;
   else
 under_=min(find(sum_lie(ceil(0.7*mm):mm,1)<=kk*nn))+ceil(0.7*mm);
   end
 
 zhongjian_=0; 
 %����
for i=1:ceil(nn/2)
      if sum_hang(1,i)<=10
          zhongjian_=zhongjian_+1;
      else
          zhongjian_=zhongjian_;
      end
   end
   if zhongjian_==0
       left_=0;
   else
 left_=max(find(sum_hang(1,1:ceil(nn/2))<=70));
   end
   
   zhongjian__=0; 
for i=1:ceil(nn/2)
      if sum_hang(1,i+ceil(nn/2)-2)<=20
          zhongjian__=zhongjian__+1;
      else
          zhongjian__=zhongjian__;
      end
   end
   if zhongjian__==0
       right_=nn;
   else
 right_=min(find(sum_hang(1,ceil(nn/2):nn)<=20))+ceil(nn/2);
   end
smaller= img_get(top_:under_,left_:right_);
smaller=smaller-35;
[vector_mouth,mouth_result]=kmeans(img_get,2);
mouth_result=uint8(mouth_result);
level_mouth=graythresh(mouth_result);
mouth_erzhi=im2bw(mouth_result,level_mouth);
mouth_erzhi=1-mouth_erzhi; 
figure;
imshow(mouth_erzhi);
% se_mouth = strel('disk', 2); % ����һ���뾶Ϊ2��Բ�νṹԪ
% mouth_erzhi=imdilate(mouth_erzhi,se_mouth);
% mouth_erzhi=imdilate(mouth_erzhi,se_mouth);



[LTY, num__] = bwlabel(mouth_erzhi,8);


for i=1:num__
    [m1,n1]=find(LTY==i);
    max_m=max(m1)-min(m1);
    max_n=max(n1)-min(n1);
    if max(max_m,max_n)>=15
    LTY(find(LTY==i))=0;    
    end
end
S = regionprops(LTY, 'Area');
mouth_then = ismember(LTY, find([S.Area] <= P));
mouth_then = bwareaopen(mouth_then,P*0.2,8) ; %ɾ����ֵͼ��BW�����С��P�Ķ���Ĭ�������connʹ��8����

[mm1,nn1]=size(mouth_then);
mouth_then(1:ceil(kkk1*mm1),:)=0;
mouth_then(ceil(0.9*mm1):mm1,:)=0;
mouth_then(:,1:ceil(kkk2*nn1))=0;
mouth_then(:,ceil(nn1-kkk2*nn1):nn1)=0;
mouth_then(15,15)=1;
[LTY1, num1] = bwlabel(mouth_then,8);
stats1 = regionprops(mouth_then,'basic');
ar = cat(1, stats1.Area);
ind=find(ar==max(ar));
mouth_then = ismember(LTY1, ind);

figure;
imshow(img_get);
hold on;
stats = regionprops(mouth_then,'basic');
plot(stats.Centroid(:, 1), stats.Centroid(:, 2), 'r*'); 

[vector_mouth1,mouth_result1]=kmeans(img_get,2);
mouth_result1=uint8(mouth_result1);
level_mouth1=graythresh(mouth_result1);
mouth_erzhi1=im2bw(mouth_result1,level_mouth1);
mouth_erzhi1=1-mouth_erzhi1;
figure;
imshow(mouth_erzhi1);
yy=stats.Centroid(:, 1);
xx=stats.Centroid(:, 2);
half_mouth_area=mouth_erzhi1(ceil(xx+30):ceil(xx+70),ceil(yy-10):ceil(yy+15));
figure;
imshow(half_mouth_area);
if yy==15
     zhuangtai='����';
elseif mean(mean(half_mouth_area))>=0.02
    zhuangtai='��';
else
    zhuangtai='����';
end
