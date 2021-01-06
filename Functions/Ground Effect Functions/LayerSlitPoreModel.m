function [Z, kc] = LayerSlitPoreModel(fr, A,co)

sig=A(1,1);% flow resistivity
omega1=A(1,2); %porosity
d=A(1,3); % density??

w=2.*pi.*fr;%angular frequency
%co=340;%speed  sound

% Some constants:
rho=1.21;%density of air
gamma=1.41;%ratio of specific heat   
npr=0.76;%prandtl number
% end of constants

rsn=sig.*(omega1.^1.5);% slit-pore model 
Lambda=sqrt(3.*rho.*w./rsn);%lemda for slit-pore model
LambdaN = Lambda.*sqrt(-1i.*npr);
z1=Lambda.*sqrt(-1i);%slit-pore model
hz2=1-(tanh(LambdaN)./(LambdaN));%slit-pore model
CComp=(gamma-((gamma-1).*hz2))./(rho.*co.*co);%complex compressibility
Cdensity=rho./(1-(tanh(z1)./z1));%complex density
Zc=sqrt((1./omega1.^2.5).*(Cdensity./CComp))./(rho.*co);%impedance calculation
kc=w.*sqrt((1./sqrt(omega1)).*Cdensity.*CComp);%complex propagation constant
Z=Zc./tanh(-1i.*kc.*d);
return

