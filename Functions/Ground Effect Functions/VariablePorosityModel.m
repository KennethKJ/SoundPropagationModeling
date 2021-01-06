function [Z, kc] = VariablePorosityModel(fr, A,c0)
% Zwikker and Kosten two parameter impedance model. 
% It is a low freq., high Flow Res. approximation of slit pore model.
% Alternatively called More and Ingard model
% The Structure Factor, K, is assumed to be equal to tortuosity,
% which in turn is approximated by 1./sqrt(porosity).
alpha=A(1,2); %rate of change of porosity
sig=A(1,1);% flow resistivity
w=2.*pi.*fr;%angular frequency
% Some constants:
Gamma = 1.4;
rho=1.21;%density of air
% end of constants
tmp1=(1./sqrt(pi.*Gamma.*rho));
tmp2=0.25.*c0./(pi.*Gamma);
Z=tmp1.*sqrt(sig./fr).*(1.+1i)+1i.*tmp2.*(alpha./fr);%impedance calculation
kc=(0.4.*w./c0).*Z;%complex propagation constant
return