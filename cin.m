function varargout = cin(varargin)
% CIN MATLAB code for cin.fig
%      CIN, by itself, creates a new CIN or raises the existing
%      singleton*.
%
%      H = CIN returns the handle to a new CIN or the handle to
%      the existing singleton*.
%
%      CIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CIN.M with the given input arguments.
%
%      CIN('Property','Value',...) creates a new CIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cin_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cin_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cin

% Last Modified by GUIDE v2.5 08-Jan-2019 16:35:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cin_OpeningFcn, ...
                   'gui_OutputFcn',  @cin_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before cin is made visible.
function cin_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cin (see VARARGIN)

% Choose default command line output for cin
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cin wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cin_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axis off  %%关闭坐标轴显示
%%filename存放打开的文件名  pathname存放路径
%%例如打开F:\data\1.jpg
%%filename=1.jpg pathname=F:\data\
[filename pathname] =uigetfile({'*.jpg';'*.bmp';'*.png';'*.*'},'打开图片');
%%字符串拼接 拼装路径 以上面例子说所述 此时 srt=F:\data\1.jpg
str=[pathname filename];
%%打开图像
img_original=imread(str);
%%打开axes1的句柄 进行axes1的操作
axes(handles.axes1);
%%在axes1中显示 图像
imshow(img_original);
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
%figure,imshow(result1,[]);title('二值');

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
for i=1:ceil(N_/2)
    if mean(new_b(:,N_-i))<=0.15
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
img_get_2_=1-img_get_2;
[L,num]=bwlabel(img_get_2_,8);%%标注二进制图像中已连接的部分
plot_x=zeros(1,1);         %%用于记录质心位置的坐标
plot_y=zeros(1,1);

%%求质心
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
%%质心坐标
plot_x(1)=fix(sum_x/area);
plot_y(1)=fix(sum_y/area);
% figure(2);imshow(img_get_2_);
% 
% %%标记质心点
% hold on
% plot(plot_y(1) ,plot_x(1), '*')
% se_=strel('line',10,0);%圆盘型结构元素
% fc_=imclose(img_get_2_,se_);%直接闭运算
% fc__=imclose(fc_,se_);%直接闭运算
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
%方法:根据脸中眼的普遍位置定位眼
%首先图像变的更有效（更小）
%上下
 [mm,nn]=size(img_get_2_);
 kk=0.55;
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
 %左右
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
 path1='D:\Documents\MATLAB\临时\result\';
 name='face_.jpg';
 imwrite(smaller,[path1 name]);
 str1=[path1 name];  
 im1=imread(str1);  
 axes(handles.axes2);  
 imshow(im1);  
%  figure;
%  imshow(smaller);
   
%    left_=max(find(sum_hang(1,1:ceil(nn/2))<=50));
%    right_=min(find(sum_hang(1,ceil(nn/2):nn)<50))+ceil(nn/2);
%    img_get_2_smaller=zeros(mm-top_+1,right_-left_+1);
%    for i=1:mm-top_+1
%        for j=1:right_-left_+1
%            img_get_2_smaller(i,j)=img_get_2_(i+top_-1,j+left_-1);
%        end
%    end
%    img_get_2_smaller=double(img_get_2_smaller);
% figure;
% imshow(img_get_2_smaller);

% y_bili=0.2;
% y_top=plot_y-ceil(y_bili/2*mm);
% y_under=plot_y+ceil(y_bili/2*mm);
% smaller=zeros(y_under-y_top+1,ceil(nn*0.6));
% smaller=img_get(y_top:y_under,ceil(0.2*nn):ceil(0.8*nn));
% figure;
% imshow(smaller);


%%
%找出smallest one
smaller_=smaller;
[mmm,nnn]=size(smaller_);
smallest=smaller(ceil(mmm*0.3):ceil(mmm*0.55),ceil(nnn/8):ceil(3*nnn/5));
% figure;
% imshow(smallest);
 path2='D:\Documents\MATLAB\临时\result\';
 name1='eye_.jpg';
 imwrite(smallest,[path2 name1]);
 str2=[path2 name1];  
 im2=imread(str2);  
 axes(handles.axes3);  
 imshow(im2);  

%%
%判断眼镜睁闭
smallest=smallest-35;
[vector_eye,eye_result]=kmeans(smallest,2);
eye_result=uint8(eye_result);
level_eye=graythresh(eye_result);
eye_erzhi=im2bw(eye_result,level_eye);
% eye_erzhi=uint8(eye_erzhi)*150;
% min_=min(smallest(:));
% smallest(find(smallest<=min_*1.45))=0;
% smallest(find(smallest>min_*1.35))=255;
[ms,ns]=size(eye_erzhi);
if sum(eye_erzhi(:))>=0.99*ms*ns
   smallest=(smallest-40)*1.75;
[vector_eye,eye_result]=kmeans(smallest,2);
eye_result=uint8(eye_result);
level_eye=graythresh(eye_result);
eye_erzhi=im2bw(eye_result,level_eye); 
elseif sum(eye_erzhi(:))<=0.55*ms*ns
smallest=(smallest+35)*1.7;
[vector_eye,eye_result]=kmeans(smallest,4);
eye_result=uint8(eye_result);
level_eye=graythresh(eye_result);
eye_erzhi=im2bw(eye_result,level_eye); 
elseif sum(eye_erzhi(:))<=0.6*ms*ns
smallest=(smallest+40)*1.99;
[vector_eye,eye_result]=kmeans(smallest,4);
eye_result=uint8(eye_result);
level_eye=graythresh(eye_result);
eye_erzhi=im2bw(eye_result,level_eye); 
end
% figure;
% imshow(eye_erzhi);
 path3='D:\Documents\MATLAB\临时\result\';
 name2='eye_2.jpg';
 imwrite(eye_erzhi,[path3 name2]);
 str3=[path3 name2];  
 im3=imread(str3);  
 axes(handles.axes4);  
 imshow(im3);  
%存在眼镜情况：
un_eye_erzhi=1-eye_erzhi;
se_s0=strel('disk',2,0);
un_eye_erzhi_=imclose(un_eye_erzhi,se_s0);
[L,num] = bwlabel(un_eye_erzhi_,8);
for i=1:num
    [m1,n1]=find(L==i);
    max_m=max(m1)-min(m1);
    max_n=max(n1)-min(n1);
    if max(max_m,max_n)>=30
    un_eye_erzhi(find(L==i))=0;    
    end
end
se_s=strel('disk',4,0);%圆盘型结构元素
result_eye=imopen(un_eye_erzhi,se_s);%直接闭运算
result_eye1=imopen(result_eye,se_s);%直接闭运算
result_eye2=imopen(result_eye1,se_s);%直接闭运算
result_eye3=imopen(result_eye2,se_s);%直接闭运算
% result_eye3=uint8(result_eye3);
% figure;
% imshow(result_eye3);


% figure;
% imshow(un_eye_erzhi);

%zhanbi>=0.9是认定没有眼镜
zhanbi=sum(eye_erzhi(:))/ms/ns;
if zhanbi>=0.95
    finalresult=0;%闭眼
elseif zhanbi>=0.9
    finalresult=1;
elseif sum(result_eye3(:))/ms/ns<=0.02
    finalresult=0;
else
    finalresult=1;
end
 path6='D:\Documents\MATLAB\临时\result\';
 if finalresult==0
     set(handles.edit2,'string','闭眼');
 else
     set(handles.edit2,'string','睁眼');
 end
 



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
