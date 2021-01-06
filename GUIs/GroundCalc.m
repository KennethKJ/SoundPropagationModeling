function varargout = GroundCalc(varargin)

global val

% GROUNDCALC MATLAB code for GroundCalc.fig
%      GROUNDCALC, by itself, creates a new GROUNDCALC or raises the existing
%      singleton*.
%
%      H = GROUNDCALC returns the handle to a new GROUNDCALC or the handle to
%      the existing singleton*.
%
%      GROUNDCALC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GROUNDCALC.M with the given input arguments.
%
%      GROUNDCALC('Property','Value',...) creates a new GROUNDCALC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GroundCalc_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GroundCalc_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to about GroundCalc

% Last Modified by GUIDE v2.5 03-Jan-2012 20:55:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GroundCalc_OpeningFcn, ...
                   'gui_OutputFcn',  @GroundCalc_OutputFcn, ...
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


% --- Executes just before GroundCalc is made visible.
function GroundCalc_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)
% varargin   command line arguments to GroundCalc (see VARARGIN)

% Choose default command line output for GroundCalc
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GroundCalc wait for user response (see UIRESUME)
% uiwait(handles.mainfig);


% set(handles.axes1, 'Xlabel', 'רר');
% set(get(gca,'XLabel'),'String','axis label')

xlabel('Frequency (Hz)');
ylabel('Attenuation (dB)');
pushbutton1_Callback(hObject, eventdata, handles)
xlscell = cell(1);


% --- Outputs from this function are returned to the command line.
function varargout = GroundCalc_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)


% --------------------------------------------------------------------
function AnimComm_Callback(hObject, eventdata, handles)
% hObject    handle to AnimComm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)


% --------------------------------------------------------------------
function CR_Callback(hObject, eventdata, handles)
% hObject    handle to CR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)
hearing_data;

% --------------------------------------------------------------------
function Noise_Callback(hObject, eventdata, handles)
% hObject    handle to Noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)


% --------------------------------------------------------------------
function Export_Callback(hObject, eventdata, handles)
% hObject    handle to Export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)
global val

global xlscell

[FileName,PathName,FilterIndex] = uiputfile('*.xls','Save ground effect prediction...') ;
cd(PathName);

if get(handles.HoldPlot,'Value') == 0
xlsin = {...
    'Sender height', val.hs;
    'Reciever height', val.hs;
    'Sender/Reciever distance', val.dist;
    'Flow resistivity', val.flow;
    'Porosity', val.por;
    'Layer thickness', val.layer;
    'Temperature', val.temp;};



    A = {'MSRI',val.turb1;
         'Outer scale', val.turb2;};
    B = {'Humidity', val.hum;
         'Atm pressure', val.pascal};
    C = {'MSRI','NA';
         'Outer scale', 'NA';};
    D = {'Humidity', 'NA';
         'Atm pressure', 'NA'};

if get(handles.TurbCheckBox, 'Value') ~= 0
   xlsin = cat(1,xlsin,A);
else
   xlsin = cat(1,xlsin,C);    
end

if get(handles.ISOCheckBox, 'Value') ~= 0
   xlsin = cat(1,xlsin,B);
else
   xlsin = cat(1,xlsin,D);    
end


label = {[],[];[],[];'Frequency (Hz)', 'Attenuation (dB)'};
xlsin = cat(1,xlsin,label);

xlsdata = [val.fr' val.att'];
xlsdata = num2cell(xlsdata);

xlsin = cat(1,xlsin, xlsdata);
xlswrite(FileName, xlsin,1,'A1')

else
xlswrite(FileName, xlscell,1,'A1')
end


% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)
close;


function HSEdit_Callback(hObject, eventdata, handles)
% hObject    handle to HSEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HSEdit as text
%        str2double(get(hObject,'String')) returns contents of HSEdit as a double


% --- Executes during object creation, after setting all properties.
function HSEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HSEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RHedit_Callback(hObject, eventdata, handles)
% hObject    handle to HumEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HumEdit as text
%        str2double(get(hObject,'String')) returns contents of HumEdit as a double


% --- Executes during object creation, after setting all properties.
function RHedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HumEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DistEdit_Callback(hObject, eventdata, handles)
% hObject    handle to DistEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DistEdit as text
%        str2double(get(hObject,'String')) returns contents of DistEdit as a double


% --- Executes during object creation, after setting all properties.
function DistEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DistEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PaEdit_Callback(hObject, eventdata, handles)
% hObject    handle to PaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PaEdit as text
%        str2double(get(hObject,'String')) returns contents of PaEdit as a double


% --- Executes during object creation, after setting all properties.
function PaEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HumEdit_Callback(hObject, eventdata, handles)
% hObject    handle to humedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: get(hObject,'String') returns contents of humedit as text
%        str2double(get(hObject,'String')) returns contents of humedit as a double


% --- Executes during object creation, after setting all properties.
function HumEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to humedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TempEdit_Callback(hObject, eventdata, handles)
% hObject    handle to TempEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TempEdit as text
%        str2double(get(hObject,'String')) returns contents of TempEdit as a double


% --- Executes during object creation, after setting all properties.
function TempEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TempEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Turb1Edit_Callback(hObject, eventdata, handles)
% hObject    handle to Turb1Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Turb1Edit as text
%        str2double(get(hObject,'String')) returns contents of Turb1Edit as a double


% --- Executes during object creation, after setting all properties.
function Turb1Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Turb1Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LayerEdit_Callback(hObject, eventdata, handles)
% hObject    handle to LayerEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LayerEdit as text
%        str2double(get(hObject,'String')) returns contents of LayerEdit as a double


% --- Executes during object creation, after setting all properties.
function LayerEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LayerEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PorEdit_Callback(hObject, eventdata, handles)
% hObject    handle to PorEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PorEdit as text
%        str2double(get(hObject,'String')) returns contents of PorEdit as a double


% --- Executes during object creation, after setting all properties.
function PorEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PorEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FlowEdit_Callback(hObject, eventdata, handles)
% hObject    handle to FlowEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FlowEdit as text
%        str2double(get(hObject,'String')) returns contents of FlowEdit as a double


% --- Executes during object creation, after setting all properties.
function FlowEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FlowEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ISOCheckBox.
function ISOCheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to ISOCheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ISOCheckBox
global val

if get(hObject,'Value') == 0
    set(handles.HumEdit, 'Enable', 'off')
    set(handles.PaEdit, 'Enable', 'off')
    val.atmcheckbox = 0;

else
    set(handles.HumEdit, 'Enable', 'on')
    set(handles.PaEdit, 'Enable', 'on')
        val.atmcheckbox = 1;

end
% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)


% --------------------------------------------------------------------
function Phelp_Callback(hObject, eventdata, handles)
% hObject    handle to Phelp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)


% --------------------------------------------------------------------
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)
About

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

global xlscell val

%% Get values and calculate attenuation
getval;

% 
% if get(handles.AnimalCheckBox, 'Value')
%     val.fr = val.spect_fr;
% end
% 
% 

if ~get(handles.ActMatCheckBox, 'Value') %if "calculate as active matrix" is deselected 



    if get(handles.TurbCheckBox, 'Value') == 0%if no turbulence is selected
        val.att = EA(val.fr, val.hs, val.hr, val.dist, val.flow, val.por, val.layer, ...
            val.temp);
    else%if turbulence is selected
        val.att = EA(val.fr, val.hs, val.hr, val.dist, val.flow, val.por, val.layer, ...
            val.temp, val.turb1, val.turb2);
    end

    if get(handles.ISOCheckBox, 'Value') ~= 0 %if ISO atm absorbance is selected
        val.att = val.att - atmAtten(val.temp,val.pascal, val.hum, val.dist, val.fr);
    end


  

else %If "calculate as active matrix" is selected
    GetActiveMatrix;

    % Initialization of ActMat;
    ActMat.Mat = zeros(size(EA(val.fr, 10, 10, 10, val.flow, val.por, val.layer, val.temp)));


    i =0;
    for idist = ActMat.dist
        for ihs = ActMat.hs
            for ihr = ActMat.hr
                if get(handles.TurbCheckBox, 'Value') == 0 %if no turbulence is selected
                   ActMat.Mat = ActMat.Mat + EA(val.fr, ihs, ihr, idist, val.flow, val.por, val.layer, ...
                        val.temp);
                   if get(handles.ISOCheckBox, 'Value') ~= 0 %if ISO atm absorbance is selected
                        ActMat.Mat= ActMat.Mat - atmAtten(val.temp,val.pascal, val.hum, idist, val.fr);
                   end

                else % if turbulence is selected
                   ActMat.Mat = ActMat.Mat+ EA(val.fr, ihs, ihr, idist, val.flow, val.por, val.layer, ...
                        val.temp, val.turb1, val.turb2);
                   if get(handles.ISOCheckBox, 'Value') ~= 0 % IF ISO atm absorbance is selected too
                        ActMat.Mat= ActMat.Mat - atmAtten(val.temp,val.pascal, val.hum, idist, val.fr);
                   end           

                end


               i = i+1;

            end
               set(handles.StatusTxt,'String', ['Calculated: ' int2str(i) ' of '...
           int2str(length(ActMat.hs)*length(ActMat.hr)*length(ActMat.dist)) ' '])

        drawnow  
        end

    end


    ActMat.Mat = ActMat.Mat ./ (length(ActMat.hs)*length(ActMat.hr)*length(ActMat.dist));

    Colors = get(handles.ColorPopUp,'String');
    Col = Colors{get(handles.ColorPopUp,'Value')}(1,:);
    if strcmp(Col,'Black');
        Col = 'k';
    end
 
    %lazy solution:
    val.att = ActMat.Mat;
end



if get(handles.HoldPlot,'Value')
 xlscell = xlsadd(2,xlscell);
else
 xlscell = makexlsin();
end


    
   %% Plot

    if get(handles.HoldPlot, 'Value') == 0
        hold off
    else
        hold on
    end


    Colors = get(handles.ColorPopUp,'String');
    Col = Colors{get(handles.ColorPopUp,'Value')}(1,:);
    if strcmp(Col,'Black')
        Col = 'k';
    end
    
    set(handles.mainfig,'CurrentAxes',handles.axes1)
    semilogx(val.fr,val.att, Col(1,1))
    grid on
    xlabel('Frequency (Hz)')
    ylabel('Attenuation (dB)')
    
%     if get(handles.AlwaysY,'Value')
%         Ymin = str2num(get(handles.Ymin,'String'));
%         Ymax = str2num(get(handles.Ymax,'String'));
%         ylim([Ymin Ymax]);  
%     end



function HREdit_Callback(hObject, eventdata, handles)
% hObject    handle to HREdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HREdit as text
%        str2double(get(hObject,'String')) returns contents of HREdit as a double


% --- Executes during object creation, after setting all properties.
function HREdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HREdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MaxFreqEdit_Callback(hObject, eventdata, handles)
% hObject    handle to MaxFreqEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MaxFreqEdit as text
%        str2double(get(hObject,'String')) returns contents of MaxFreqEdit as a double


% --- Executes during object creation, after setting all properties.
function MaxFreqEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MaxFreqEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function StepSizeEdit_Callback(hObject, eventdata, handles)
% hObject    handle to StepSizeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StepSizeEdit as text
%        str2double(get(hObject,'String')) returns contents of StepSizeEdit as a double


% --- Executes during object creation, after setting all properties.
function StepSizeEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StepSizeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MinFreqEdit_Callback(hObject, eventdata, handles)
% hObject    handle to MinFreqEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MinFreqEdit as text
%        str2double(get(hObject,'String')) returns contents of MinFreqEdit as a double


% --- Executes during object creation, after setting all properties.
function MinFreqEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MinFreqEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in TurbCheckBox.
function TurbCheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to TurbCheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TurbCheckBox

global val

if get(hObject,'Value') == 0
    set(handles.Turb1Edit, 'Enable', 'off')
    set(handles.Turb2Edit, 'Enable', 'off')
    val.turbcheckbox = 0;
else
    set(handles.Turb1Edit, 'Enable', 'on')
    set(handles.Turb2Edit, 'Enable', 'on')
    val.turbcheckbox = 1;

end

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)
getval;



function Turb2Edit_Callback(hObject, eventdata, handles)
% hObject    handle to Turb2Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Turb2Edit as text
%        str2double(get(hObject,'String')) returns contents of Turb2Edit as a double


% --- Executes during object creation, after setting all properties.
function Turb2Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Turb2Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in HoldPlot.
function HoldPlot_Callback(hObject, eventdata, handles)
% hObject    handle to HoldPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of HoldPlot


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ColorEdit.
function ColorEdit_Callback(hObject, eventdata, handles)
% hObject    handle to ColorEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ColorEdit contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ColorEdit


% --- Executes during object creation, after setting all properties.
function ColorEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ColorEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ColorPopUp.
function ColorPopUp_Callback(hObject, eventdata, handles)
% hObject    handle to ColorPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user animcomm (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ColorPopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ColorPopUp


% --- Executes during object creation, after setting all properties.
function ColorPopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ColorPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function ActMat_Callback(hObject, eventdata, handles)
% hObject    handle to ActMat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ActiveMatrix;
getval;

% --- Executes on button press in ActMatBtn.
function ActMatBtn_Callback(hObject, eventdata, handles)
% hObject    handle to ActMatBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ActMat

set(handles.ActMatBtn, 'String', 'Calculating...');
set(handles.ActMatBtn, 'Enable', 'off');
drawnow

% Get user values
getval;
GetActiveMatrix;

% Initialization of ActMat;
ActMat.Mat = zeros(size(EA(val.fr, 10, 10, 10, val.flow, val.por, val.layer, val.temp)));


i =0;
for idist = ActMat.dist
    for ihs = ActMat.hs
        for ihr = ActMat.hr
            if get(handles.TurbCheckBox, 'Value') == 0
               ActMat.Mat = ActMat.Mat + EA(val.fr, ihs, ihr, idist, val.flow, val.por, val.layer, ...
                    val.temp);
               if get(handles.ISOCheckBox, 'Value') ~= 0
                    ActMat.Mat= ActMat.Mat - atmAtten(val.temp,val.pascal, val.hum, idist, val.fr);
               end

            else
               ActMat.Mat = ActMat.Mat+ EA(val.fr, ihs, ihr, idist, val.flow, val.por, val.layer, ...
                    val.temp, val.turb1, val.turb2);
               if get(handles.ISOCheckBox, 'Value') ~= 0
                    ActMat.Mat= ActMat.Mat - atmAtten(val.temp,val.pascal, val.hum, idist, val.fr);
               end           
            
            end

   
           i = i+1;
            
        end
           set(handles.StatusTxt,'String', ['Calculated: ' int2str(i) ' of '...
       int2str(length(ActMat.hs)*length(ActMat.hr)*length(ActMat.dist)) ' '])

    drawnow  
    end
   
end


ActMat.Mat = ActMat.Mat ./ (length(ActMat.hs)*length(ActMat.hr)*length(ActMat.dist));

Colors = get(handles.ColorPopUp,'String')
Col = Colors{get(handles.ColorPopUp,'Value')}(1,:)
if strcmp(Col,'Black')
    Col = 'k'
end


%% Plot

if get(handles.HoldPlot, 'Value') == 0
    hold off
else
    hold on
end


Colors = get(handles.ColorPopUp,'String')
Col = Colors{get(handles.ColorPopUp,'Value')}(1,:)
if strcmp(Col,'Black')
    Col = 'k'
end
semilogx(val.fr,ActMat.Mat, Col(1,1))
grid on
xlabel('Frequency (Hz)')
ylabel('Attenuation (dB)')
ylim([-25 10]);

set(handles.ActMatBtn, 'String', 'Calculate active matrix');
set(handles.ActMatBtn, 'Enable', 'on');



function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit27 as text
%        str2double(get(hObject,'String')) returns contents of edit27 as a double


% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
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



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
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


% --- Executes on button press in ActMatCheckBox.
function ActMatCheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to ActMatCheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ActMatCheckBox

if get(hObject,'Value') == 0
    set(handles.hsminedit, 'Enable', 'off')
    set(handles.hsmaxedit, 'Enable', 'off')
    set(handles.hsstepedit, 'Enable', 'off')
    set(handles.hrminedit, 'Enable', 'off')
    set(handles.hrmaxedit, 'Enable', 'off')
    set(handles.hrstepedit, 'Enable', 'off')
    set(handles.distminedit, 'Enable', 'off')
    set(handles.distmaxedit, 'Enable', 'off')
    set(handles.diststepedit, 'Enable', 'off')
    
    set(handles.HSEdit, 'Enable', 'on')
    set(handles.HREdit, 'Enable', 'on')
    set(handles.DistEdit, 'Enable', 'on')
    
    
else
    set(handles.hsminedit, 'Enable', 'on')
    set(handles.hsmaxedit, 'Enable', 'on')
    set(handles.hsstepedit, 'Enable', 'on')
    set(handles.hrminedit, 'Enable', 'on')
    set(handles.hrmaxedit, 'Enable', 'on')
    set(handles.hrstepedit, 'Enable', 'on')
    set(handles.distminedit, 'Enable', 'on')
    set(handles.distmaxedit, 'Enable', 'on')
    set(handles.diststepedit, 'Enable', 'on')
    
    set(handles.HSEdit, 'Enable', 'off')
    set(handles.HREdit, 'Enable', 'off')
    set(handles.DistEdit, 'Enable', 'off')
    
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


% --- Executes during object creation, after setting all properties.
function mainfig_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mainfig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function Ymax_Callback(hObject, eventdata, handles)
% hObject    handle to Ymax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ymax as text
%        str2double(get(hObject,'String')) returns contents of Ymax as a double


% --- Executes during object creation, after setting all properties.
function Ymax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ymax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ymin_Callback(hObject, eventdata, handles)
% hObject    handle to Ymin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ymin as text
%        str2double(get(hObject,'String')) returns contents of Ymin as a double


% --- Executes during object creation, after setting all properties.
function Ymin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ymin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


Ymin = str2num(get(handles.Ymin,'String'));
Ymax = str2num(get(handles.Ymax,'String'));

ylim([Ymin Ymax]);


% --- Executes on button press in AlwaysY.
function AlwaysY_Callback(hObject, eventdata, handles)
% hObject    handle to AlwaysY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of AlwaysY


% --------------------------------------------------------------------
function SetVoc_Callback(hObject, eventdata, handles)
% hObject    handle to SetVoc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

vocalization;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val
hold on
plot(val.spect_fr,val.spect, 'r')

% val.spect_att = EA(val.spect_fr, val.hs, val.hr, val.dist, val.flow, val.por, val.layer, val.temp);
plot(val.spect_fr,val.spect' + val.att, 'b')

plot(val.spect_fr,val.spect'+val.att- 20*log10(val.dist), 'm')

% val.spect_EA = val.spect + val.spect_att';
% 
% plot(val.spect_fr,val.spect_EA, 'm')
plot(val.THR(:,1), val.THR(:,2),'--ro');
plot(val.CR(:,1), val.CR(:,2),'--ko');

% --- Executes on button press in AnimalCheckBox.
function AnimalCheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to AnimalCheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of AnimalCheckBox


% --- Executes on button press in SaveToExcel.
function SaveToExcel_Callback(hObject, eventdata, handles)
% hObject    handle to SaveToExcel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Export_Callback(hObject, eventdata, handles)
