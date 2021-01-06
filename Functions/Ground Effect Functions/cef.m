function w = cef(z,N)
%  Computes the function w(z) = exp(-z^2) erfc(-iz) using a rational 
%  series with N terms.  It is assumed that Im(z) > 0 or Im(z) = 0.
%                             Andre Weideman, 1995
%  Remark: This function is enhanced to be valid for negative Im(z)
%  See Abramowitz/Stegun Eq.7.1.11, p.297
%                             Roland Kruse, 2004

fl =  0;
if imag(z) < 0
    z = -z; fl = 1;
end

M = 2*N;  M2 = 2*M;  k = [-M+1:1:M-1]';    % M2 = no. of sampling points.
L = sqrt(N/sqrt(2));                       % Optimal choice of L.
theta = k*pi/M; t = L*tan(theta/2);        % Define variables theta and t.
f = exp(-t.^2).*(L^2+t.^2); f = [0; f];    % Function to be transformed.
a = real(fft(fftshift(f)))/M2;             % Coefficients of transform.
a = flipud(a(2:N+1));                      % Reorder coefficients.
Z = (L+i*z)./(L-i*z); p = polyval(a,Z);    % Polynomial evaluation.
w = 2*p./(L-i*z).^2+(1/sqrt(pi))./(L-i*z); % Evaluate w(z).

if fl
    w = 2*exp(-z^2) - w;
end