Fs = 256; %sample reate
T = 1/Fs; %sample unit
L = 1000; %sample length
t = (0:L-1)*T; %time sequence

x = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
y = x + 2 * randn(size(t));
plot(Fs*t(1:50), y(1:50));
title('Raw signal + zero randon noise');
xlabel('unit:ms');

% 
% 
% N = 256;
% n = 0 : N - 1;
% t = 0: 1 / Fs: 1 - 1/Fs;
% x = square(2*pi*30*t, 50);
% y = fft(x);
% M = abs(y);
% plot(n, M);