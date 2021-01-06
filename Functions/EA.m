function out = EA(fr, HS, HR, D, FlowRes, Por, Layer, temp, turb1, turb2) 


c = soundspeed(temp);


sint=(D)./sqrt((HS+HR).^2+D.*D);

a = [FlowRes, Por, Layer, sint];

% k0 = 2.*pi.*fr./c;

%[Z3,kc]=ExtendedLayerSlitPoreModel(fr,a,c); 
[Z3,kc] = LayerSlitPoreModel(fr,a,c); 
beta=1./Z3;

if nargin == 8
  [out,t] = ExAtt(fr, beta, HS,HR,D,c);
elseif nargin == 10
  [out,t]=ExAtt_turb(fr,beta, HS,HR,D,c,turb1,turb2);
else
     error('myApp:argChk', 'Wrong number of input arguments')
end
return
