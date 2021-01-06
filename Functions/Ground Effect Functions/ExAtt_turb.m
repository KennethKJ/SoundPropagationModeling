function [tm,alp]=ExAtt_turb(fr,beta,hs,hru,R,c,mu2,L0)
%[tm,alp]=ExAtt_turb(fr,beta,hs,hru,R,c,mu2,L0)
%Calculates the Excess Attenuation (i.e. SPL re free field). It uses a simple
%Gaussian model of turbulence (Clifford & Lataitis JASA, 73(5), p 1545)
%
%fr = frequency array, 
%beta = acoustic admittance array.
%hs = Source height, hru = mic height, 
%R = Distance Source - Receiver, c = Speed of sound
%mu2  variance of index of refraction (1.e-4 for very turbument atm down to
%1.e-8 for calm atm)
% L0 outer scale of turbulence  (order of a meter) 

theta_u = atan(R/(hs+hru));
Rd_u    = sqrt((hs-hru)^2+R^2);  %Direct path, upper mic
Rr_u    = sqrt((hs+hru)^2+R^2);  %Reflected path, upper mic
k = 2*pi*fr/c; 
if (hs+hru)> 1.e-5
    rmax = hs.*hru./(hs+hru)./L0;
    y=erf(rmax);
    rhow = 1.0-0.5.*sqrt(pi).*y./rmax;
else
    rhow = 0.0;
end
[T,dT] = T_estEA_TURB(beta,theta_u,Rd_u,Rr_u,k,mu2,L0,rhow);
tm=10.*log10(abs(T));
alp=angle(T);

return

%----------------------------------------

function [T,dT] = T_estEA_TURB(beta,theta_u,Rd_u,Rr_u,k,mu2,L0,rhow)

%Upper mic
tau = sqrt(0.5i*k*Rr_u);
w = tau.*(cos(theta_u)+beta);
Q = 1+2*tau.*beta.*(1i*sqrt(pi).*cef(w,10));
dQ_u = 2*tau.*(1i*sqrt(pi)*cef(w,10)-2*tau.*beta.*(1+1i*sqrt(pi).*w.*cef(w,10))); 
H_u = 1/Rd_u*exp(1i*k*Rd_u) + Q/Rr_u.*exp(1i*k*Rr_u); 

%free field

H_l = 1./Rd_u.*exp(1i.*k.*Rd_u);


    tee = -0.5.*sqrt(pi).*mu2.*Rd_u.*L0.*k.*k.*rhow;
    turb = exp(tee);
Rat = abs(Q).*Rd_u./Rr_u;
T = H_u./H_l;   %Transfer function
dT = ( (dQ_u.*exp(1i*k*(Rr_u-Rd_u)).*(Rd_u./Rr_u) ));
t1=2.*Rat.*cos(k.*(Rr_u-Rd_u)+angle(Q)).*turb;
T = (1.0+Rat.*Rat+t1);    
return