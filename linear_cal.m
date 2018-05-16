k = 20; k2 = 0.08;
num = [-1.5 0];
den = [ 1 25 10.05 * k k * (250 + 15 * k2)];
sys = tf(num, den);
t = 0 : 0.01 : 3;
step(sys, t); grid
A = [3 1 -1;1 2 4;-1 4 5]; 
b = [3.5;2.1;-1.4];
y = linspace(0, 2, 7);


