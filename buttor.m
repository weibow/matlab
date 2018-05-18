fs = 10;
N = 16;
n = 0 : N - 1;
t = 0 : 1/fs: 1/fs*10;
f = n*fs/N;

x1 = sin(2*pi*0.5*t);
x2 = sin(2*pi*200*t);
x = x1 + x2;

subplot(231);
plot(t, x2);
xlabel('time');
ylabel('Amplitude');
title('x2 Raw Signal');
grid on;

subplot(232);
plot(t, x);
xlabel('time');
ylabel('Amplitude');
title('x Raw Signal');
grid on;

subplot(236);
plot(t, x1);
xlabel('time');
ylabel('Amplitude');
title('x1 Raw Signal');
grid on;


subplot(233);
y = fft(x, N);
plot (f, y);
xlabel('Fre/hz');
ylabel('Amplitude');
title('Raw FFT');
grid on;

subplot(234);
Wc = 2*1/fs;
[b, a] = butter(2, Wc);
y2 = filtfilt(b, a, x);
y3 = fft(y2, N);
plot(f, y3);
xlabel('Fre/Hz');
ylabel('Amp');
title('Filter FFT');
grid on;

subplot(235);
plot(t, y2);
xlabel('time');
ylabel('Amplitude');
title('Raw Signal');
grid on;


