fs = 512;
N = 2^nextpow2(fs);
n = 0:N-1;
t = 0:1/fs:1-1/fs;
f = n*fs/N;

x1 = sin(2*pi*50*t);
x2 = sin(2*pi*200*t);
x = x1 + x2;

subplot(221);
plot(t,x);
xlabel('Time');
ylabel('Amp');
title('Raw Signal');
grid on;

subplot(222);
y = fft(x, N);
plot(f, abs(y));
xlabel('Frequency/Hz');
ylabel('Amplitude');
title('Raw FFT');
grid on;

subplot(223);
Wc = 2*125/fs;      %stop frequenc 125 Hz
[b, a] = butter(2,Wc);
y2= filtfilt(b,a, x);
y3 = fft(y2, N);
plot(f, abs(y3));
xlabel('Fre/Hz');
ylabel('Amplitude');
title('Filter FFT');
grid on;


subplot(224);
plot(t,y2);
xlabel('Time');
ylabel('Amp');
title('Filter Signal');
grid on;



