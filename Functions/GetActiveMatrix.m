

global ActMat

%% Sender
ActMat.hsmin = str2double(get(handles.hsminedit, 'String'));
ActMat.hsmax = str2double(get(handles.hsmaxedit, 'String'));
ActMat.hsstep = str2double(get(handles.hsstepedit, 'String'));

%% Receiver
ActMat.hrmin = str2double(get(handles.hrminedit, 'String'));
ActMat.hrmax = str2double(get(handles.hrmaxedit, 'String'));
ActMat.hrstep = str2double(get(handles.hrstepedit, 'String'));

%% Distance
ActMat.distmin = str2double(get(handles.distminedit, 'String'));
ActMat.distmax = str2double(get(handles.distmaxedit, 'String'));
ActMat.diststep = str2double(get(handles.diststepedit, 'String'));

%% Setting up loop variables

ActMat.hs = ActMat.hsmin : ActMat.hsstep : ActMat.hsmax;
ActMat.hr = ActMat.hrmin : ActMat.hrstep : ActMat.hrmax;
ActMat.dist = ActMat.distmin : ActMat.diststep : ActMat.distmax;

