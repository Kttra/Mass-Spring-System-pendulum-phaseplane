%mass spring system
%my''+cy'+ky = f = 10cos(3t)
clc; close all; clear;
m = 1; c = 4; k = 5;
N=100;
t = linspace(0,5,N);
dt = t(2)-t(1);
y(1) = 1;
y(2) = y(1);
for i = 2:N-1
    f = 0;
    y(i+1) = (f-k*y(i)+c*y(i-1)/(2*dt) ...
                +m*2*y(i)/dt^2-m*y(i-1)/dt^2)/(m/dt^2+c/(2*dt));
end
plot(t,y,'.'),xlabel('t'),ylabel('y')
legend('approx')