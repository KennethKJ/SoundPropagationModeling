function out = xlsadd(dim, cellin)

global val
% getval

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

if val.turbcheckbox ~= 0
   xlsin = cat(1,xlsin,A);
else
   xlsin = cat(1,xlsin,C);    
end

if val.atmcheckbox ~= 0
   xlsin = cat(1,xlsin,B);
else
   xlsin = cat(1,xlsin,D);    
end


label = {[],[];[],[];'Frequency (Hz)', 'Attenuation (dB)'};
xlsin = cat(1,xlsin,label);

xlsdata = [val.fr' val.att'];
xlsdata = num2cell(xlsdata);
xlsin = cat(1,xlsin, xlsdata);

if isempty(cellin{1,1})
    out = xlsin;
else
    out = cat(dim,cellin,xlsin);
end


