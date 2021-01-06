function [Z, kc] = DelanyBazleyModel(fr, A,co)
% Zwikker and Kosten two parameter impedance model. 
% It is a low freq., high Flow Res. approximation of slit pore model.
% Alternatively called More and Ingard model
% The Structure Factor, K, is assumed to be equal to tortuosity,
% which in turn is approximated by 1./sqrt(porosity).
w=2.*pi.*fr;%angular frequency
%co=340;%speed  sound
% Some constants:
rho=1.21;%density of air
% end of constants
X = a./(rho.*fr);
Z=1.0+0.057.*X.^0.754+1i.*0.087.*X.^0.732;%impedance calculation
kc=(w./co).*(1+0.0978.*X.^0.7+0.189.*1i.*X.^0.595);%complex propagation constant
return