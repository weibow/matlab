load newdata.txt;

z = newdata(:,5);
A_LOWPASS_NUMERATOR		= 180;			
A_LOWPASS_DENOMINATOR	= 256;

% 初始化参数
%n_iter = 400;       %计算连续n_iter个时刻
n_iter = size(z);
sz = [n_iter, 1]; 
x = 24;             % 温度的真实值
% Q = 4e-4;           % 对温度预测值的方差
Q = 1.2;           % 对温度预测值的方差
R = 8.1;           % 测量方差，反应温度计的测量精度

delta_start = 1;    %温度初始估计方差
%z = x + sqrt(R)*randn(sz); 

raw = zeros(sz);
for k = 1 : n_iter
    raw(k) = z(k);
end

last_sample = 0;
for k = 1 : n_iter 
    z(k) = last_sample + (z(k) - last_sample)* A_LOWPASS_NUMERATOR / A_LOWPASS_DENOMINATOR;
    last_sample = z(k);
end
% z是温度计的测量结果，在真实值的基础上加上了方差为0.25的高斯噪声。
% 初始化数组
state_kalman=zeros(sz); 
% 对温度的估计值。即在k时刻，结合温度计当前测量值与k-1时刻预测值，得到的最终估计值
variance_kalman=zeros(sz);         % 估计值的方差
state_pre=zeros(sz); % 对温度的预测
variance_pre=zeros(sz);    % 预测值的方差9
K=zeros(sz);         % 卡尔曼增益
T_start = z(1);     %温度初始估计值
state_kalman(1) = T_start;   %温度估计值初始化
variance_kalman(1) =delta_start;   %估计值方差初始化

%开始迭代计算
for k = 2:n_iter
state_pre(k) = state_kalman(k-1);
%用上一时刻的最优估计值来作为对当前时刻的温度的预测
variance_pre(k) = variance_kalman(k-1)+Q;
%预测的方差为上一时刻温度最优估计值的方差与高斯噪声方差之和
%
%计算卡尔曼增益
K(k) = variance_pre(k)/( variance_pre(k)+R ); 
%
%结合当前时刻温度计的测量值，对上一时刻的预测进行校正，得到校正后的最优估计。由于是直接测量，故C为1.
state_kalman(k) = state_pre(k)+K(k)*(z(k)-state_pre(k)); 
variance_kalman(k) = (1-K(k))*variance_pre(k); 
%计算最终估计值的方差用于下一次迭代
end
%绘图相关。。。。。
FontSize=14;
LineWidth=3;
figure();
startPoint = 50;
endPoint = size(raw);
sa = newdata(startPoint:endPoint, 2);
plot(sa, 'k-', 'LineWidth', LineWidth);
hold on;
plot(z(startPoint:endPoint),'k+'); %画出温度计的测量值
plot(z(startPoint:endPoint),'k-','LineWidth',LineWidth) %画出最优估计值
hold on;
plot(state_kalman(startPoint:endPoint),'w-','LineWidth',LineWidth) %画出最优估计值
hold on;

plot(raw(startPoint:endPoint), 'g-', 'LineWidth', LineWidth);
%axis([1 500 800000 900000]); 
%plot(x*ones(sz),'g-','LineWidth',LineWidth); %画出真实值
legend('温度测量值', 'Kalman估计值');
xl=xlabel('时间(分钟)');
yl=ylabel('温度');
set(xl,'fontsize',FontSize);
set(yl,'fontsize',FontSize);
hold off;
set(gca,'FontSize',FontSize);
%figure();
%valid_iter = [2:n_iter]; % variance_pre not valid at step 1
% plot(valid_iter,variance_kalman([valid_iter]),'LineWidth',LineWidth); %画出最优估计值的方差
% legend('Kalman估计的误差估计');
xl=xlabel('时间(分钟)');
yl=ylabel('℃^2');
set(xl,'fontsize',FontSize);
set(yl,'fontsize',FontSize);
set(gca,'FontSize',FontSize);