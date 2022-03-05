%Pendulum
clear; close all; clc
t = 0; dt = 0.01;  N = 400;
 
IC = [-5 -4 -3 -2 -1 -.5  ...
       5  4  3  2 1 .5];
DXDT = [ -5 -4 -3 -2 -1 1 2 3 4 5];
p1 = 1;
for c = [0 1]
m = 1;
k = 1;

for i1 = 1:length(IC)
y(1) = IC(i1);
   t = t+dt;
for i2 = 1:length(DXDT)   
y(2) = y(1)+dt*DXDT(i2);
t(2) = dt;
for i = 2:N
    t(i+1) = t(i)+dt;
    y(i+1) = (-sin(y(i))+c*y(i-1)/(2*dt) ...
                -m/dt^2*y(i-1)+m*2/dt^2*y(i))/(m/dt^2+c/(2*dt));
    i = i+1; 
end
dydt = (y(2:end)-y(1:end-1))./dt;
subplot(1,2,p1)
plot(y(1),(y(2)-y(1))/dt,'.'), hold on,
plot(0.5.*(y(2:end)+y(1:end-1)),dydt,'-')
end
end

axis([min(IC) max(IC) min(DXDT) max(DXDT)])
 title(['Phase Space for m = 1, c = ',num2str(c),', k = 1 (Many Initial Conditions)'])
 xlabel('\theta')
 ylabel('d \theta/dt')
 p1 = p1+1;
end