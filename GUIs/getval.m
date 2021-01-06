global val

val.minfreq = str2double(get(handles.MinFreqEdit, 'String'));
val.stepsize = str2double(get(handles.StepSizeEdit, 'String'));
val.maxfreq = str2double(get(handles.MaxFreqEdit, 'String'));
val.fr = val.minfreq:val.stepsize:val.maxfreq;

val.turb1 = str2double(get(handles.Turb1Edit, 'String')); 
val.turb2 = str2double(get(handles.Turb2Edit, 'String')); 



val.hs = str2double(get(handles.HSEdit, 'String')); 
val.hr = str2double(get(handles.HREdit, 'String')); 
val.dist = str2double(get(handles.DistEdit, 'String')); 
val.flow = str2double(get(handles.FlowEdit, 'String'));
val.por = str2double(get(handles.PorEdit, 'String'));
val.layer = str2double(get(handles.LayerEdit, 'String'));
val.temp = str2double(get(handles.TempEdit, 'String'));
    
val.pascal = str2double(get(handles.PaEdit, 'String'));
val.hum = str2double(get(handles.HumEdit, 'String'));

val.turbcheckbox = get(handles.TurbCheckBox, 'Value');
val.atmcheckbox = get(handles.ISOCheckBox, 'Value');
    
