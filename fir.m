fs = 1000;
N = 1024;
n = 0 : N-1;
t = 0:1/fs:1-1/fs;
f = n * fs / N;
Signal_Original = sin(2*pi*50*t);
Signal_Noise = sin(2*pi*200*t);
Mix_Signal = Signal_Original + Signal_Noise;
subplot(221);
plot(t, Mix_Signal);
xlabel('time');
ylabel('amplitude');
title('raw signal');
grid on;

subplot(222);
y = fft(Mix_Signal, N);
plot(f, abs(y));
xlabel('fre/Hz');
ylabel('Amplitude');
title('Raw signal FFT');
grid on;

b = fir1(30, 0.25);
y2 = filtfilt(b, 1, Mix_Signal);
Ps = sum(Signal_Original.^2);
Pu = sum(y2 - Signal_Original.^2);
SNR = 10 * log10(Ps/Pu);

y3 = fft(y2, N);
subplot(223);
plot(f, abs(y3));
xlabel('Fre/Hz');
ylabel('AM');
title('Filter FFT ');
grid on;

[H,F] = freqz(b, 1, 512);
subplot(224);
plot(F/pi, abs(H));
xlabel('gui yi fre');
title(['Order=', int2str(30),' SNR =', num2str(SNR)]);
grid on;
