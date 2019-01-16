clear;
clc;
img_original=imread('6.jpg');
img=rgb2gray(img_original);
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
% figure,imshow(result1,[]);title('二值');

%%
%框出头部
%计算每行的不间断为1的值构成向量white_row,如有多个，max
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
%确定阈值并找到under线
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
%找到top线
blank=find(white_row(1:ceil(M/2))==0);
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
for i=1:ceil(N_/3)
    if mean(new_b(:,N_-i))<=0.25
        col_zhongjian=N_-i;
    else
        col_zhongjian=col_zhongjian;
    end
end
right_line=col_zhongjian+30;
%%
%提取面部
img_get=img_original(ceil(top_line):ceil(under_line),ceil(left_line)+1:ceil(right_line));
% figure;
% imshow(img_get);
%%
%对面部进行二值处理,经过两次close操作,找出边缘
level=graythresh(img_get);
img_get_2=im2bw(img_get,level);
img_get_2=double(img_get_2);

se=strel('disk',8');%圆盘型结构元素
fc=imclose(img_get_2,se);%直接闭运算
fc_=imclose(fc,se);%直接闭运算
eg = bwperim(fc_);

%利用边缘（脸的最外轮廓寻找eyes）
%[L,num]=bwlabel(eg,8);
img_get_2_=img_get_2;

add=imopen(img_get_2_,se);%直接闭运算
add1=imopen(add,se);%直接闭运算
add2=imopen(add1,se);%直接闭运算
add3=imopen(add2,se);%直接闭运算
add4=imopen(add3,se);%直接闭运算
add5=imopen(add4,se);%直接闭运算

add6=imdilate(add5,se);

add7=imopen(add6,se);
add7=imopen(add7,se);
add7=imopen(add7,se);
add7=imopen(add7,se);
[L,num]=bwlabel(add7,8);%%标注二进制图像中已连接的部分
plot_x=zeros(1,1);         %%用于记录质心位置的坐标
plot_y=zeros(1,1);

%%求质心
sum_x=0;sum_y=0;area=0;

[height,width]=size(add7);
for i=1:height
    for j=1:width
        if L(i,j)==1
            sum_x=sum_x+i;
            sum_y=sum_y+j;
            area=area+1;
        end
    end
end
%%质心坐标
plot_x(1)=fix(sum_x/area);
plot_y(1)=fix(sum_y/area);
 figure(2);imshow(add7);
 
 %%标记质心点
 hold on
 plot(plot_y(1) ,plot_x(1), '*')

  add7(ceil(plot_x(1))-30:height,:)=0;
  
  
 dim=size(add7);
 row=plot_x(1)-50;
 col=find(add7(row,:),1);
% col=round(dim(2)/2)-20;         %计算起始点列坐标
% row=find(add7(:,col),1);  


 rowBegin = floor(height/3);
for colBegin = 1:width
    if (add7(rowBegin,colBegin)>0)
        break;
    end
end
add7 = logical(add7);
pggEdge = bwtraceboundary(add7,[row,col],...
    'W',8,2*(height+width));

pggEdgeX = pggEdge(1:end-1,2);
pggEdgeY = pggEdge(1:end-1,1);
% 绘制边界
hold on;
plot(pggEdgeX,pggEdgeY,'g','linewidth',2);
% 计算距离
distPtEdge = sqrt((pggEdgeX-plot_x).^2+(pggEdgeY-plot_y).^2);
figure;plot(distPtEdge,'x-');grid on;
figure;
imshow(add7);
var_=var(distPtEdge);
B=size(distPtEdge,1);
A=sum(add7(:)==1);
F=B*B/4/pi/A;
if F>=1.5
    zhuangtai='niu';
else
    zhuangtai='zheng';
end

    