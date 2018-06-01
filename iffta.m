Fs = 1000;
T = 1/Fs;
L = 1024;
t = (0:L-1)*T;

y = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);

subplot(211);
plot(Fs*t(1:50), y(1:50));
title('Raw Signal');

Y = fft(y, L);
Z = ifft(Y);
subplot(2, 1, 2);
plot(Fs*t(1:50), Z(1:50));
title('FFT and IFFT converted');

