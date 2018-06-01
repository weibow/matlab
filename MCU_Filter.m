clear;
close all;
load newdata.txt;

[m, k] = size(newdata);

fs = 10;
N = m;
n = 0:1:N-1;
t = n /fs;
f = n * fs / N;

figure;
subplot(511);
x = newdata(:,1);
y = fft(x, N);
plot(f, abs(y));
title('filter1 FFT');
grid on;

subplot(512);
x = newdata(:,5);
y = fft(x, N);
plot(f, abs(y));
title('filter2 FFT');
grid on;

subplot(513);
x = newdata(:,1);
plot(t,x);

subplot(514);
hold on;
x = newdata(:,1);
plot(t,x);
Wc = 2*2/fs;
[b, a] = butter(10, Wc);
y = filtfilt(b, a, x);
plot(t,y,'r-');
Wc = 2*0.5/fs;
[b, a] = butter(3, Wc);
y = filtfilt(b, a, x);
plot(t,y);

subplot(515);
hold on;
plot(t,y);
x = newdata(:,2);
plot(t, x);

% x = newdata(:,3);
% plot(t, x);
% x = newdata(:,4);
% plot(t, x);
% x = newdata(:,5);
% plot(t, x);
% x = newdata(:, 6);
% plot(t, x);

figure;

plot(newdata(:, 1), 'b-');
hold on;
plot(newdata(:, 2),'r-');
plot(newdata(:, 3), 'm-');
% 
% % % 
%   plot(newdata(:, 4), 'r-');
% %  plot(newdata(:, 5), 'y-');

plot(newdata(:, 6), 'k-');
grid on;
hold off;

% fs = m;
% N = 2^nextpow2(fs);
% n = 0:N-1;
% t = 0:1/fs:1-1/fs;
% f = n*fs/N;


% x1 = sin(2*pi*50*t);
% x2 = sin(2*pi*200*t);
% x = x1+x2;




% figure;
% x = newdata(:,1);
% xlabel('Time');
% ylabel('Amp');
% title('Raw Signal');
% grid on;
% 
% subplot(212);
% y = fft(x, N);
% plot(f, abs(y));
% xlabel('Frequency/Hz');
% ylabel('Amplitude');
% title('Raw FFT');
% grid on;

me = max(newdata(:,1));
min_me = min(newdata(:,1));
me2 = max(newdata(:,5));
min_me2 = min(newdata(:,5));

%me = newdata(200, 1);
% min_me = newdata(200, 1);
% for k = 1:m
%     if newdata(k, 1)> me
%         me = newdata(k,1);
%     end
% end

% for k = 1:m
%     if newdata(k, 1) < min_me
%         min_me = newdata(k,1);
%     end
% end


disp(me)
disp(min_me)
disp(me-min_me)
disp(me2)
disp(min_me2)
disp(me2-min_me2)
return;
% fs = 10;
% N = 400;
% n = 0:1:N-1;
% t = n /fs;
% f = n * fs / N;
% x1 = sin(2*pi*50*t);
% x2 = sin(2*pi*200*t);
% x = x1+x2;
% figure;
% 
% subplot(211);
% y = fft(x, N);
% plot(f, abs(y));
% title('filter wave');
% grid on;

e = [5.4051, 64.1490, 80.6676,115.3568,48.4321,-35.8420,-90.2927,-74.3950, -97.3883, -72.8974]



