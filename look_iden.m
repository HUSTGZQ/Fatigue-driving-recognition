function varargout = look_iden(varargin)
% LOOK_IDEN MATLAB code for look_iden.fig
%      LOOK_IDEN, by itself, creates a new LOOK_IDEN or raises the existing
%      singleton*.
%
%      H = LOOK_IDEN returns the handle to a new LOOK_IDEN or the handle to
%      the existing singleton*.
%
%      LOOK_IDEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOOK_IDEN.M with the given input arguments.
%
%      LOOK_IDEN('Property','Value',...) creates a new LOOK_IDEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before look_iden_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to look_iden_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help look_iden

% Last Modified by GUIDE v2.5 08-Jan-2019 16:00:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @look_iden_OpeningFcn, ...
                   'gui_OutputFcn',  @look_iden_OutputFcn, ...
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


% --- Executes just before look_iden is made visible.
function look_iden_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to look_iden (see VARARGIN)

% Choose default command line output for look_iden
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes look_iden wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = look_iden_OutputFcn(hObject, eventdata, handles) 
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
 path1='D:\Documents\MATLAB\临时看\';
 name='look_.jpg';
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
%  figure(2);imshow(add7);
 
 %%标记质心点
%  hold on
%  plot(plot_y(1) ,plot_x(1), '*')

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
% hold on;
% plot(pggEdgeX,pggEdgeY,'g','linewidth',2);
% 计算距离
distPtEdge = sqrt((pggEdgeX-plot_x).^2+(pggEdgeY-plot_y).^2);
% figure;plot(distPtEdge,'x-');grid on;
% figure;
% imshow(add7);

path2='D:\Documents\MATLAB\临时看\';
 name1='roi_.jpg';
 imwrite(add7,[path2 name1]);
 str2=[path2 name1];  
 im2=imread(str2);  
 axes(handles.axes3);  
 imshow(im2); 
hold on
 plot(plot_y(1) ,plot_x(1), '*')
 hold on;
 plot(pggEdgeX,pggEdgeY,'g','linewidth',2);

 
 
var_=var(distPtEdge);
B=size(distPtEdge,1);
A=sum(add7(:)==1);
F=B*B/4/pi/A;
if F>=1.5
    zhuangtai='niu';
    set(handles.edit7,'string','扭头');
else
    zhuangtai='zheng';
    set(handles.edit7,'string','正视');
end

set(handles.edit6,'string',F);



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



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
