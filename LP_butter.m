close all;
clear;
fs = 30;
N = 300;
n = 0: N-1;
t = n/fs;
if 1
fl = 0.4;           %��Ƶ  
fh = 5;             %��Ƶ  
s=cos(2*pi*fl*t)+cos(2*pi*fh*t);    %s��0.4Hz��5Hz�źŵ��ӣ���ͨ��ֹƵ����1Hz  
subplot(211);
plot(t,s);  
title('�����ź�');
xlabel('t/s');
ylabel('����');  
sfft=fft(s);  
subplot(212);  
%plot((1:length(sfft)/2)*fs/length(sfft), 2*abs(sfft(1:length(sfft)/2)));  
plot((1:length(sfft)/2)*fs/length(sfft), 2*abs(sfft(1:length(sfft)/2))/length(sfft));  
title('�ź�Ƶ��');
xlabel('Ƶ��/Hz');
ylabel('����');  
%��Ƶ�ͨ�˲�������ֹƵ��Ϊ1  
if 0  
Wp=1/fs;                %��ֹƵ��Ϊ1Hz
Ws=2/fs;                %�����ֹƵ��Ϊ2Hz  
%����õ�Butterworth��ͨ�˲�������С����N��3dB��ֹƵ��Wn  
[n,Wn]=buttord(Wp,Ws,1,50);     %���˥������50db,ͨ���Ʋ�С��1db  
else  
n=4;  
Wn=1/(fs/2);  
end  
%���Butterworth��ͨ�˲���  
[a,b]=butter(n,Wn);  
[h,f]=freqz(a,b,'whole',fs);        %�����ֵ�ͨ�˲�����Ƶ����Ӧ  
f=(0:length(f)-1*fs/length(f));     %���ж�Ӧ��Ƶ��ת��  
figure;  
plot(f(1:length(f)/2),abs(h(1:length(f)/2)));       %���Ʒ�Ƶ��Ӧͼ
grid on;  
title('������˹��ͨ�˲���');
xlabel('Ƶ��/Hz');
ylabel('����');  
sF=filter(a,b,s);                   %���Ӻ���s������ͨ�˲����Ժ���º���  
figure;  
subplot(211);  
plot(t,sF);                         %���Ƶ��Ӻ���s������ͨ��ʱ��ͼ��  
title('����ź�');
xlabel('t/s');
ylabel('����');  
SF=fft(sF);  
subplot(212);  
plot((1:length(SF)/2)*fs/length(SF),2*abs(SF(1:length(SF)/2))/length(SF));  
title('��ͨ�˲���Ƶ��');xlabel('Ƶ��/Hz');ylabel('����');  
end  