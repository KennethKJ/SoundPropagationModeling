function varargout = vocalization(varargin)
% VOCALIZATION MATLAB code for vocalization.fig
%      VOCALIZATION, by itself, creates a new VOCALIZATION or raises the existing
%      singleton*.
%
%      H = VOCALIZATION returns the handle to a new VOCALIZATION or the handle to
%      the existing singleton*.
%
%      VOCALIZATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VOCALIZATION.M with the given input arguments.
%
%      VOCALIZATION('Property','Value',...) creates a new VOCALIZATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before vocalization_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to vocalization_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help vocalization

% Last Modified by GUIDE v2.5 05-Jan-2012 14:42:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vocalization_OpeningFcn, ...
                   'gui_OutputFcn',  @vocalization_OutputFcn, ...
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


% --- Executes just before vocalization is made visible.
function vocalization_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to vocalization (see VARARGIN)

% Choose default command line output for vocalization
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes vocalization wait for user response (see UIRESUME)
% uiwait(handles.VocalFig);


% --- Outputs from this function are returned to the command line.
function varargout = vocalization_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val

% [FileName,PathName] = uigetfile('*.wav','Select a wav file');
% file = [PathName FileName];
% file = 'C:\Users\Kenneth\Documents\00 PROJECTS\ELK call propagation\Colorado 2008\playbacks\marc h26-2008\1\TEST RMS.wav';
% [val.vocal, val.Fs] = wavread(file);

% file = 'C:\Users\Kenneth\Documents\LYDFILER\Crow complex';

% [val.vocal, val.Fs] = wavread(file);



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val 

% 
% val.vocal = val.vocal(:,1);
% 
% val.vocal = val.vocal/rms(val.vocal);
% rms(val.vocal)
% max(val.vocal)
% 
% val.FFTSize = 2048;
% calib = 94; % dB SPL of calibration tone 
% calib2 = calib - 10*log10((val.Fs/2)/val.FFTSize)
% 
% reference = 2^0.5/(10^(calib/20));
% 
% [val.spect, val.spect_fr] = spect(val.vocal(10000:10000+4*1024), val.Fs);
% 
% % figure(111)
% plot(val.spect_fr, 20*log10(val.spect./reference));
% ylim([0 110]);


% val.vocal = val.vocal(:,1);
% val.vocal = val.vocal/rms(val.vocal);
% rms(val.vocal);
% max(val.vocal);

% val.vocal2 = val.vocal2/rms(val.vocal2);
% rms(val.vocal2);
% max(val.vocal2);


calib = str2double(get(handles.SourceLevelEdit,'String')) ; % dB SPL of calibration tone 
% calib2 = calib - 10*log10((val.Fs/2)/val.FFTSize)

% reference = 2^0.5/(10^(calib/20));
% reference = 1/(10^(calib/20));

% [val.spect, val.spect_fr] = spect(val.vocal2, val.Fs2);

if get(handles.ApplySmooth, 'Value')
    smoothHz = str2double(get(handles.SmoothEdit,'String'));
else
    smoothHz = 0;
end
[val.spect, val.spect_fr] = SL(val.vocal, val.Fs,calib,smoothHz);
% [val.spect2, val.spect_fr2] = SL(val.vocal2, val.Fs2,calib,100);

% 20*log10(rms(val.vocal)/reference);
% 20*log10(rms(val.vocal2)/reference);
%  figure(111)

% val.VocalSpectrumLevel2 = 20*log10(val.spect2./reference);
% val.VocalSpectrumLevel = 20*log10(val.spect./reference);

% hold on;
% plot(val.spect_fr2./1000, val.VocalSpectrumLevel2);
% val.VocalSpectrumLevel2 = smooth(val.VocalSpectrumLevel2, 250);
% plot(val.spect_fr2./1000, val.VocalSpectrumLevel2, 'r');

set(handles.VocalFig,'CurrentAxes',handles.axes1)

plot(val.spect_fr./1000, val.spect);

% val.spect = trimarray(val.spect,10);
% val.spect_fr = trimarray(val.spect_fr,10);

% ylim([0 110]);
xlim([0 val.Fs/2/1000])
xlabel('Frequency (kHz)');
ylabel('Spectrum level (dB/Hz)');


function SourceLevelEdit_Callback(hObject, eventdata, handles)
% hObject    handle to SourceLevelEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SourceLevelEdit as text
%        str2double(get(hObject,'String')) returns contents of SourceLevelEdit as a double


% --- Executes during object creation, after setting all properties.
function SourceLevelEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SourceLevelEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function ImpSpect_Callback(hObject, eventdata, handles)
% hObject    handle to ImpSpect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


[FileName,PathName] = uigetfile('*.xls','Select a xls file...');
filename = [PathName FileName];
[num,txt,raw] = xlsread(filename,-1);
 

% --------------------------------------------------------------------
function TEST_Callback(hObject, eventdata, handles)
% hObject    handle to TEST (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ApplySmooth.
function ApplySmooth_Callback(hObject, eventdata, handles)
% hObject    handle to ApplySmooth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ApplySmooth



function SmoothEdit_Callback(hObject, eventdata, handles)
% hObject    handle to SmoothEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SmoothEdit as text
%        str2double(get(hObject,'String')) returns contents of SmoothEdit as a double


% --- Executes during object creation, after setting all properties.
function SmoothEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SmoothEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global val

cd('H:\00 Projects\LYDFILER')
[FileName,PathName] = uigetfile('*.wav','Select a wav file');
file = [PathName FileName];
% file = 'C:\Users\Kenneth\Documents\00 PROJECTS\ELK call propagation\Colorado 2008\playbacks\marc h26-2008\1\TEST RMS.wav';
[val.vocal, val.Fs] = wavread(file);

% file = 'C:\Users\Kenneth\Documents\LYDFILER\Crow complex';

% [val.vocal, val.Fs] = wavread(file);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(figure(vocalization),'Visible', 'off');


% --------------------------------------------------------------------
function OpenVocalWav_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to OpenVocalWav (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global val

[FileName,PathName] = uigetfile('*.wav','Select a wav file');
file = [PathName FileName];
% file = 'C:\Users\Kenneth\Documents\00 PROJECTS\ELK call propagation\Colorado 2008\playbacks\marc h26-2008\1\TEST RMS.wav';
[val.vocal, val.Fs] = wavread(file);

% get mono if wav is stereo
if length(val.vocal(:,1)) > 1
    rms1 = rms(val.vocal(:,1));
    rms2 = rms(val.vocal(:,2));
    
    if rms1 > rms2
        val.vocal = val.vocal(:,1);
    elseif rms1 < rms2
        val.vocal = val.vocal(:,2);
    else
        val.vocal = val.vocal(:,1);
    end
end

% [m d] = wavfinfo(file);

t = [0 : length(val.vocal)-1]'.*1/val.Fs;
set(handles.VocalFig,'CurrentAxes',handles.axes2)
plot(t,val.vocal,'k')
xlim([0 max(t)])
xlabel('Time (s)')
ylabel('Amplitude')


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val

val.player = audioplayer(val.vocal,val.Fs);

Xs = get(handles.axes2,'Xlim');
Xs = round(Xs*val.Fs);

play(val.player, Xs)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global val

if val.player.running == 'on'
    stop(val.player)
end


    
    
    
    
