Fs = 1000;
T = 1/Fs;
L = 1000;
t = 0:1/Fs:1-1/Fs;

x = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
y = x+2*randn(size(t));
plot(Fs*t(1:50), y(1:50));

NFFT = 2^nextpow2(L);
Y = fft(y, NFFT)/L;
f = Fs/2*linspace(0, 1, NFFT/2+1);
plot(f, 2*abs(Y(1:NFFT/2+1)));
title('·ùÆµÏìÓ¦');
xlabel('Fre');
ylabel('Amp');



%M = y;
M = abs(y);
plot(n, M);