fl = 2;             %��Ƶ
fh = 10;             %��Ƶ
s=cos(2*pi*fl*t)+cos(2*pi*fh*t);    %s��2Hz��3Hz�źŵ��ӣ���ͨ��ֹƵ����1Hz~4Hz

s=H;
N=3636;              %N/fs ������
n=0:N-1;            
t=n/fs;             %ʱ��

subplot(121);plot(t,s);
title('�����ź�');xlabel('t/s');ylabel('����');
sfft=fft(s);
subplot(122);
plot((1:length(sfft)/2)*fs/length(sfft),2*abs(sfft(1:length(sfft)/2))/length(sfft));
title('�ź�Ƶ��');xlabel('Ƶ��/Hz');ylabel('����');
%��ƴ�ͨ�˲�������ֹƵ��Ϊ0.4~5
n=4;
Wn=[0.4/(fs/2) 5/(fs/2)]

%���Butterworth��ͨ�˲���
[a,b]=butter(n,Wn);
[h,f]=freqz(a,b,'whole',fs);        %�����ֵ�ͨ�˲�����Ƶ����Ӧ
f=(0:length(f)-1*fs/length(f));     %���ж�Ӧ��Ƶ��ת��
figure;
plot(f(1:length(f)/2),abs(h(1:length(f)/2)));       %���Ʒ�Ƶ��Ӧͼ
title('������˹��ͨ�˲���');xlabel('Ƶ��/Hz');ylabel('����');
grid;
sF=filter(a,b,s);                   %���Ӻ���s������ͨ�˲����Ժ���º���
figure;
subplot(121);
plot(t,sF);                         %���Ƶ��Ӻ���s������ͨ��ʱ��ͼ��
title('����ź�');xlabel('t/s');ylabel('����');
SF=fft(sF);
subplot(122);
plot((1:length(SF)/2)*fs/length(SF),2*abs(SF(1:length(SF)/2))/length(SF));
title('��ͨ�˲���Ƶ��');xlabel('Ƶ��/Hz');ylabel('����');