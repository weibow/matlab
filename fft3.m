Fs = 256;
N = 256;
n = 0:N-1;
t = 0:1/Fs:1-1/Fs;
f = n*Fs/N;

x = 1.5*sin(2*pi*50*t + pi/3);
y = fft(x, N);
Mag = abs(y);
subplot(2, 1, 1);
plot(f, Mag);
title('��Ƶ��Ӧ');
xlabel('Ƶ��/Hz');
ylabel('����');

subplot(212);
plot(f, angle(y)*180/pi);
title('angle Frequence');
xlabel('Fre/Hz');
ylabel('amp');
