function varargout = hearing_data(varargin)
% HEARING_DATA MATLAB code for hearing_data.fig
%      HEARING_DATA, by itself, creates a new HEARING_DATA or raises the existing
%      singleton*.
%
%      H = HEARING_DATA returns the handle to a new HEARING_DATA or the handle to
%      the existing singleton*.
%
%      HEARING_DATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HEARING_DATA.M with the given input arguments.
%
%      HEARING_DATA('Property','Value',...) creates a new HEARING_DATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hearing_data_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hearing_data_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hearing_data

% Last Modified by GUIDE v2.5 10-Jan-2012 15:03:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hearing_data_OpeningFcn, ...
                   'gui_OutputFcn',  @hearing_data_OutputFcn, ...
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


% --- Executes just before hearing_data is made visible.
function hearing_data_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hearing_data (see VARARGIN)

% Choose default command line output for hearing_data
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes hearing_data wait for user response (see UIRESUME)
% uiwait(handles.HearFig);





% --- Outputs from this function are returned to the command line.
function varargout = hearing_data_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes when entered data in editable cell(s) in HearTable.
function HearTable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to HearTable (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global val

% table_h = get(0,'IUtable1');

% A = [100 10; 500 22; 1000 33; 2000 41; 4000 55; 8000 61; 16000 69];
% debugKKJ = num2cell(A);

% B = cell(10,2);

% debugKKJ = cat(1,debugKKJ,B);

% set(handles.HearTable, 'Data', debugKKJ);

data = get(handles.HearTable, 'Data');
val.hearingdata = [0 0]; i = 1;
while ~isempty(data{i,1})

    val.hearingdata(i,1) = data{i,1}(1,1);
    val.hearingdata(i,2) = data{i,2}(1,1);
    i = i + 1;

end

semilogx(handles.axes1,val.hearingdata(:,1),val.hearingdata(:,2), '--bo')


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function HearFig_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HearFig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected cell(s) is changed in HearTable.
function HearTable_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to HearTable (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function HearTable_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to HearTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on HearTable and none of its controls.
function HearTable_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to HearTable (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in OKbtn.
function OKbtn_Callback(hObject, eventdata, handles)
% hObject    handle to OKbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(figure(hearing_data),'Visible','off');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global val
% 
% 
% data = get(handles.HearTable,'Data');
% 
% THRdata = ...
% {250     22.34821;
% 350     13.82158;
% 500     7.91526;
% 700     3.03823;
% 1000	0.55837;
% 1400	1.94;
% 2000	3.27105;
% 2500	3.04415;
% 2800	1.33182;
% 4000	7.20057;
% 5600	12.18772;
% 8000	61.3454;
% [],[]};
% 
% 
% CRdata = ...
% {250	    28.53716;
% 350	    24.20944;
% 500	    25.88503;
% 700	    20.98045;
% 1000	20.82136;
% 1400	22.1286;
% 2000	27.87138;
% 2800	27.16667;
% 4000	26.55266;
% 5600	28.46863;
% [],[];[],[];[],[]};
% 
% data = cat(2,THRdata,CRdata);
% 
% set(handles.HearTable,'Data', data);
% 
% hold on
% val.THR = [0 0]; i = 1;
% while ~isempty(data{i,1})
% 
%     val.THR(i,1) = data{i,1}(1,1);
%     val.THR(i,2) = data{i,2}(1,1);
%     i = i + 1;
% 
% end
% 
% semilogx(val.THR(:,1),val.THR(:,2), '--bo')
% 
% val.CR = [0 0]; i = 1;
% while ~isempty(data{i,3})
% 
%     val.CR(i,1) = data{i,3}(1,1);
%     val.CR(i,2) = data{i,4}(1,1);
%     i = i + 1;
% 
% end
% 
% semilogx(val.CR(:,1),val.CR(:,2), '--ro')


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global val


try
%% Open file    
    [filename path] = uigetfile({'*.xlsx','Excel *.xlsx';...
        '*.xls', 'Excel 2003 *.xls'}, 'Import hearing data');
    cd(path)
    [num,txt,raw] = xlsread(filename);


%%initialization
    val.THR = [];
    val.CR = [];
    val.CB = [];
    
    val.THRBOOL = 0;
    val.CRBOOL = 0;
    val.CBBOOL = 0;
    
%% Threshold
    val.THR(:,1) = num(find(~isnan(num(:,1))),1)*1000;
    val.THR(:,2) = num(find(~isnan(num(:,2))),2);
    set(handles.HearFig,'CurrentAxes',handles.axes1)
    cla

    set(handles.axes1,'xscale','log')
    title(['Threshold and Critical ratios for ' filename])
    xlabel('Frequency (Hz)')
    ylabel('Threshold or CR (dB)')
    hold on
    grid on
    semilogx(val.THR(:,1),val.THR(:,2), ':ko')

    %% CRitical Ratio    

    if length(num(1,:)) > 2;
        val.CR(:,1) = num(find(~isnan(num(:,3))),3)*1000;
        val.CR(:,2) = num(find(~isnan(num(:,4))),4);
        if ~isempty(val.CR)
            semilogx(val.CR(:,1),val.CR(:,2), ':ro')
        end
    end
    legend('THR','CB','location','NorthWest')

%% Critical Bandwidth    
    set(handles.HearFig,'CurrentAxes',handles.axes2)
    cla
    set(handles.axes2,'xscale','log')

    hold on 
    grid on
    title('Critical bandwidth plot')
    xlabel('Frequency (Hz)')
    ylabel('Bandwidth (Hz)')
            
    if length(num(1,:)) > 4;
        val.CB(:,1) = num(find(~isnan(num(:,5))),5)*1000;
        val.CB(:,2) = num(find(~isnan(num(:,6))),6);
        if ~isempty(val.CB)
            semilogx(val.CB(:,1),val.CB(:,2), ':bo');
            legend('CB','location','NorthWest')

        end
    end


    
%% Format and write data in HearingTable    
    num = num2cell(num);

    for i = 1 : length(num(:,1))
        for j = 1 : length(num(1,:))
            value = num{i,j};
            if isnan(value)
                num{i,j} = [];
            end
        end
    end

    data = cell(100,6);
    data(1:length(num(:,1)),1: length(num(1,:))) = num(:,:);

    set(handles.HearTable,'Data',data);
catch ERROR
    ErrorHandlingScript(ERROR, 'opening hearing data xls file')
end



% --- Executes on button press in SetHearDataBtn.
function SetHearDataBtn_Callback(hObject, eventdata, handles)
% hObject    handle to SetHearDataBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global val

val.THRBOOL = 0;
val.CRBOOL = 0;
val.CBBOOL = 0;


%% THR
data = get(handles.HearTable,'Data');
set(handles.HearFig,'CurrentAxes',handles.axes1)
cla

try
    val.THR = []; i = 1;
    while ~isempty(data{i,1})

        val.THR(i,1) = data{i,1}(1,1);
        val.THR(i,2) = data{i,2}(1,1);
        i = i + 1;
        val.THRBOOL = 1;
    end
    if val.THRBOOL
        semilogx(val.THR(:,1),val.THR(:,2), '-ko', 'linewidth',2)
        grid on
        hold on
        legend('THR','location','NorthWest')
    end
catch ERROR
    ErrorHandlingScript(ERROR, 'Threshold entry') 
    val.THRBOOL = 0;
end


%% CR
if length(data(1,:)) > 4
    try
        val.CR = []; i = 1;
        while ~isempty(data{i,3})

            val.CR(i,1) = data{i,3}(1,1);
            val.CR(i,2) = data{i,4}(1,1);
            i = i + 1;
            val.CRBOOL = 1;
        end
        if val.CRBOOL
            semilogx(val.CR(:,1),val.CR(:,2), '-ro', 'linewidth',2)
            grid on
            hold on
        end
    catch ERROR
        ErrorHandlingScript(ERROR, 'Critical ratio entry') 
        val.CRBOOL = 0;
    end
end

legend('THR','CR','location','NorthWest')

%% CB
set(handles.HearFig,'CurrentAxes',handles.axes2)
cla
if length(data(1,:)) > 4
    try
        val.CB = []; i = 1;
        while ~isempty(data{i,5})
            val.CB(i,1) = data{i,5}(1,1)*1000;
            val.CB(i,2) = data{i,6}(1,1);
            i = i + 1;
            val.CBBOOL = 1;
        end
        if val.CBBOOL
            semilogx(val.CB(:,1),val.CB(:,2), '-bo', 'linewidth',2)
            grid on
            hold on
            legend('CR','location','NorthWest')
        end
    catch ERROR
        ErrorHandlingScript(ERROR, 'Critical band entry') 
        val.CBBOOL = 0;
    end
else
    
val.CBBOOL = 0;    
end
