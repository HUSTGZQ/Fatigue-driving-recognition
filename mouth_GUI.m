function varargout = mouth_GUI(varargin)
% MOUTH_GUI MATLAB code for mouth_GUI.fig
%      MOUTH_GUI, by itself, creates a new MOUTH_GUI or raises the existing
%      singleton*.
%
%      H = MOUTH_GUI returns the handle to a new MOUTH_GUI or the handle to
%      the existing singleton*.
%
%      MOUTH_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOUTH_GUI.M with the given input arguments.
%
%      MOUTH_GUI('Property','Value',...) creates a new MOUTH_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mouth_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mouth_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mouth_GUI

% Last Modified by GUIDE v2.5 08-Jan-2019 16:37:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mouth_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @mouth_GUI_OutputFcn, ...
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


% --- Executes just before mouth_GUI is made visible.
function mouth_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mouth_GUI (see VARARGIN)

% Choose default command line output for mouth_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mouth_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mouth_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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
blank=find(white_row(1:ceil(M))==0);
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
img_get=img_original(ceil(top_line):ceil(under_line)-30,ceil(left_line)+1:ceil(right_line));
 path1='D:\Documents\MATLAB\临时—嘴\';
 name='face_.jpg';
 imwrite(img_get,[path1 name]);
 str1=[path1 name];  
 im1=imread(str1);  
 axes(handles.axes2);  
 imshow(im1);  

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
smaller=smaller-35;
[vector_mouth,mouth_result]=kmeans(img_get,2);
mouth_result=uint8(mouth_result);
level_mouth=graythresh(mouth_result);
mouth_erzhi=im2bw(mouth_result,level_mouth);
mouth_erzhi=1-mouth_erzhi; 
% figure;
% imshow(mouth_erzhi);
% se_mouth = strel('disk', 2); % 创建一个半径为2的圆形结构元
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
mouth_then = bwareaopen(mouth_then,P*0.2,8) ; %删除二值图像BW中面积小于P的对象，默认情况下conn使用8邻域

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

% figure;
% imshow(img_get);
% hold on;
% stats = regionprops(mouth_then,'basic');
% plot(stats.Centroid(:, 1), stats.Centroid(:, 2), 'r*'); 
 path2='D:\Documents\MATLAB\临时—嘴\';
 name1='nose_.jpg';
 imwrite(img_get,[path2 name1]);
 str2=[path2 name1];  
 im2=imread(str2);  
 axes(handles.axes3);  
 imshow(im2);  
 hold on;
stats = regionprops(mouth_then,'basic');
 plot(stats.Centroid(:, 1), stats.Centroid(:, 2), 'r*'); 
 
[vector_mouth1,mouth_result1]=kmeans(img_get,2);
mouth_result1=uint8(mouth_result1);
level_mouth1=graythresh(mouth_result1);
mouth_erzhi1=im2bw(mouth_result1,level_mouth1);
mouth_erzhi1=1-mouth_erzhi1;
% figure;
% imshow(mouth_erzhi1);
yy=stats.Centroid(:, 1);
xx=stats.Centroid(:, 2);
half_mouth_area=mouth_erzhi1(ceil(xx+30):ceil(xx+70),ceil(yy-10):ceil(yy+15));
% figure;
% imshow(half_mouth_area);
 path4='D:\Documents\MATLAB\临时—嘴\';
 name3='eye_2.jpg';
 imwrite(half_mouth_area,[path4 name3]);
 str4=[path4 name3];  
 im4=imread(str4);  
 axes(handles.axes4);  
 imshow(im4); 
 
 
if yy==15
    set(handles.edit6,'string','闭嘴');
elseif mean(mean(half_mouth_area))>=0.02
  set(handles.edit6,'string','张嘴');
else
   set(handles.edit6,'string','闭嘴');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
