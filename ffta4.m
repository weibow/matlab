Fs = 1000;
N = 1024;
n = 0: 1: N-1;
t = 0:1/Fs:1-1/Fs;
f = n * Fs/N;

x = 1024 + 1024*sin(2*pi*50*t) + 512*sin(2*pi*20*t);
y = fft(x, N);

subplot(2, 1, 1);
Mag ra= abs(y)*2/N;
plot(f, Mag);
title('Matlab result');
xlabel('Fre');
ylabel('Amp');