function [out,f] = SL(y, Fs, dB, smoothing)


%***
% Outputs the spectrum level (dB/Hz) of a sound. Works only with broadband 
% sounds!
%
% y = sound signal, Fs= sample frequency, dB= the known sound level of the
% sound, smooting= applied smoothing of spectrum in Hz
%
% Kenneth Kragh Jensen
%****

NFFT = length(y); % 2^nextpow2(L); % Next power of 2 from length of y

% apply Hamming window;
y = y.*hamming(NFFT);

% normalize to rms = 1;
%   this is done after the window to ensure rms = 1. Otherwise it would be
%   reduced by the windowing
y = y/rms(y);

% set reference for dB calc below
reference = 1/10^(dB/20);

Y = fft(y,NFFT);
Y = Y/NFFT;

f = Fs/2*linspace(0,1,NFFT/2+1);

out = 2*abs(Y(1:NFFT/2+1));
out = 20*log10(out/reference);

FreqBinSize = Fs/NFFT;
out = out - 10*log10(FreqBinSize);

if smoothing ~= 0
    smoothpoints = smoothing/FreqBinSize;
    out = smooth(out, smoothpoints);
end



out = interp1(f,out, f(1):f(end));
f = f(1):f(end);
