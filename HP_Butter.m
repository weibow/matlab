fl = 2;             %低频
fh = 10;             %高频
s=cos(2*pi*fl*t)+cos(2*pi*fh*t);    %s是2Hz和3Hz信号叠加，带通截止频率是1Hz~4Hz
%s=H;
N=3636;              %N/fs 秒数据
n=0:N-1;            
t=n/fs;             %时间

subplot(121);
plot(t,s);
title('输入信号');xlabel('t/s');ylabel('幅度');
sfft=fft(s);
subplot(122);
plot((1:length(sfft)/2)*fs/length(sfft),2*abs(sfft(1:length(sfft)/2))/length(sfft));
title('信号频谱');xlabel('频率/Hz');ylabel('幅度');
%设计带通滤波器，截止频率为0.4~5
n=4;
Wn=[0.4/(fs/2) 5/(fs/2)]

%设计Butterworth低通滤波器
[a,b]=butter(n,Wn);
[h,f]=freqz(a,b,'whole',fs);        %求数字低通滤波器的频率响应
f=(0:length(f)-1*fs/length(f));     %进行对应的频率转换
figure;
plot(f(1:length(f)/2),abs(h(1:length(f)/2)));       %绘制幅频响应图
title('巴特沃斯带通滤波器');xlabel('频率/Hz');ylabel('幅度');
grid;
sF=filter(a,b,s);                   %叠加函数s经过低通滤波器以后的新函数
figure;
subplot(121);
plot(t,sF);                         %绘制叠加函数s经过低通后时域图形
title('输出信号');xlabel('t/s');ylabel('幅度');
SF=fft(sF);
subplot(122);
plot((1:length(SF)/2)*fs/length(SF),2*abs(SF(1:length(SF)/2))/length(SF));
title('带通滤波后频谱');xlabel('频率/Hz');ylabel('幅度');