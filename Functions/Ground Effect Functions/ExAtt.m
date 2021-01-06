function [tm,alp]=ExAtt(fr,beta,hs,hru,R,c)
%[tm,alp]=ExAtt(fr,beta,hs,hru,R,c)
%Calculates the Excess Attenuation (i.e. SPL re free field).
%fr = Tfrequency array, 
%beta = acoustic admittance.
%hs = Source height, hru = mic height, 
%R = Distance Source - Receiver, c = Speed of sound
theta_u = atan(R/(hs+hru));
Rd_u    = sqrt((hs-hru)^2+R^2);  %Direct path, upper mic
Rr_u    = sqrt((hs+hru)^2+R^2);  %Reflected path, upper mic
k = 2*pi*fr/c; 
[T,dT] = T_estEA(beta,theta_u,Rd_u,Rr_u,k);
tm=20.*log10(abs(T));
alp=angle(T);
return

%----------------------------------------

function [T,dT] = T_estEA(beta,theta_u,Rd_u,Rr_u,k)

%Upper mic
tau = sqrt(0.5i*k*Rr_u);
w = tau.*(cos(theta_u)+beta);
Q = 1+2*tau.*beta.*(1i*sqrt(pi).*cef(w,10));
dQ_u = 2*tau.*(1i*sqrt(pi)*cef(w,10)-2*tau.*beta.*(1+1i*sqrt(pi).*w.*cef(w,10))); 
H_u = 1/Rd_u*exp(1i*k*Rd_u) + Q/Rr_u.*exp(1i*k*Rr_u); 

%Lower mic

H_l = 1./Rd_u.*exp(1i.*k.*Rd_u);

T = H_u./H_l;   %Transfer function
dT = ( (dQ_u.*exp(1i*k*(Rr_u-Rd_u)).*(Rd_u./Rr_u) ));
    
return