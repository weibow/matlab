close all;
clear;
fs = 30;
N = 300;
n = 0: N-1;
t = n/fs;
if 1
fl = 0.4;           %低频  
fh = 5;             %高频  
s=cos(2*pi*fl*t)+cos(2*pi*fh*t);    %s是0.4Hz和5Hz信号叠加，低通截止频率是1Hz  
subplot(211);
plot(t,s);  
title('输入信号');
xlabel('t/s');
ylabel('幅度');  
sfft=fft(s);  
subplot(212);  
%plot((1:length(sfft)/2)*fs/length(sfft), 2*abs(sfft(1:length(sfft)/2)));  
plot((1:length(sfft)/2)*fs/length(sfft), 2*abs(sfft(1:length(sfft)/2))/length(sfft));  
title('信号频谱');
xlabel('频率/Hz');
ylabel('幅度');  
%设计低通滤波器，截止频率为1  
if 0  
Wp=1/fs;                %截止频率为1Hz
Ws=2/fs;                %阻带截止频率为2Hz  
%估算得到Butterworth低通滤波器的最小阶数N和3dB截止频率Wn  
[n,Wn]=buttord(Wp,Ws,1,50);     %阻带衰减大于50db,通带纹波小于1db  
else  
n=4;  
Wn=1/(fs/2);  
end  
%设计Butterworth低通滤波器  
[a,b]=butter(n,Wn);  
[h,f]=freqz(a,b,'whole',fs);        %求数字低通滤波器的频率响应  
f=(0:length(f)-1*fs/length(f));     %进行对应的频率转换  
figure;  
plot(f(1:length(f)/2),abs(h(1:length(f)/2)));       %绘制幅频响应图
grid on;  
title('巴特沃斯低通滤波器');
xlabel('频率/Hz');
ylabel('幅度');  
sF=filter(a,b,s);                   %叠加函数s经过低通滤波器以后的新函数  
figure;  
subplot(211);  
plot(t,sF);                         %绘制叠加函数s经过低通后时域图形  
title('输出信号');
xlabel('t/s');
ylabel('幅度');  
SF=fft(sF);  
subplot(212);  
plot((1:length(SF)/2)*fs/length(SF),2*abs(SF(1:length(SF)/2))/length(SF));  
title('低通滤波后频谱');xlabel('频率/Hz');ylabel('幅度');  
end  