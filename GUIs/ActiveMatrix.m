function varargout = ActiveMatrix(varargin)
% ACTIVEMATRIX MATLAB code for ActiveMatrix.fig
%      ACTIVEMATRIX, by itself, creates a new ACTIVEMATRIX or raises the existing
%      singleton*.
%
%      H = ACTIVEMATRIX returns the handle to a new ACTIVEMATRIX or the handle to
%      the existing singleton*.
%
%      ACTIVEMATRIX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ACTIVEMATRIX.M with the given input arguments.
%
%      ACTIVEMATRIX('Property','Value',...) creates a new ACTIVEMATRIX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ActiveMatrix_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ActiveMatrix_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ActiveMatrix

% Last Modified by GUIDE v2.5 04-Apr-2011 15:26:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ActiveMatrix_OpeningFcn, ...
                   'gui_OutputFcn',  @ActiveMatrix_OutputFcn, ...
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


% --- Executes just before ActiveMatrix is made visible.
function ActiveMatrix_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ActiveMatrix (see VARARGIN)

% Choose default command line output for ActiveMatrix
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ActiveMatrix wait for user response (see UIRESUME)
% uiwait(handles.ActMatFig);


% --- Outputs from this function are returned to the command line.
function varargout = ActiveMatrix_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function hsstepedit_Callback(hObject, eventdata, handles)
% hObject    handle to hsstepedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hsstepedit as text
%        str2double(get(hObject,'String')) returns contents of hsstepedit as a double


% --- Executes during object creation, after setting all properties.
function hsstepedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hsstepedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hsmaxedit_Callback(hObject, eventdata, handles)
% hObject    handle to hsmaxedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hsmaxedit as text
%        str2double(get(hObject,'String')) returns contents of hsmaxedit as a double


% --- Executes during object creation, after setting all properties.
function hsmaxedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hsmaxedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hsminedit_Callback(hObject, eventdata, handles)
% hObject    handle to hsminedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hsminedit as text
%        str2double(get(hObject,'String')) returns contents of hsminedit as a double


% --- Executes during object creation, after setting all properties.
function hsminedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hsminedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function diststepedit_Callback(hObject, eventdata, handles)
% hObject    handle to diststepedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of diststepedit as text
%        str2double(get(hObject,'String')) returns contents of diststepedit as a double


% --- Executes during object creation, after setting all properties.
function diststepedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to diststepedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function distmaxedit_Callback(hObject, eventdata, handles)
% hObject    handle to distmaxedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of distmaxedit as text
%        str2double(get(hObject,'String')) returns contents of distmaxedit as a double


% --- Executes during object creation, after setting all properties.
function distmaxedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to distmaxedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function distminedit_Callback(hObject, eventdata, handles)
% hObject    handle to distminedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of distminedit as text
%        str2double(get(hObject,'String')) returns contents of distminedit as a double


% --- Executes during object creation, after setting all properties.
function distminedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to distminedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hrminedit_Callback(hObject, eventdata, handles)
% hObject    handle to hrminedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hrminedit as text
%        str2double(get(hObject,'String')) returns contents of hrminedit as a double


% --- Executes during object creation, after setting all properties.
function hrminedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hrminedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hrmaxedit_Callback(hObject, eventdata, handles)
% hObject    handle to hrmaxedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hrmaxedit as text
%        str2double(get(hObject,'String')) returns contents of hrmaxedit as a double


% --- Executes during object creation, after setting all properties.
function hrmaxedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hrmaxedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hrstepedit_Callback(hObject, eventdata, handles)
% hObject    handle to hrstepedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hrstepedit as text
%        str2double(get(hObject,'String')) returns contents of hrstepedit as a double


% --- Executes during object creation, after setting all properties.
function hrstepedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hrstepedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ActMatOKBtn.
function ActMatOKBtn_Callback(hObject, eventdata, handles)
% hObject    handle to ActMatOKBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

GetActiveMatrix;
% set(handles.ActMatFig,'Visible', 'off');
close ActiveMatrix;
