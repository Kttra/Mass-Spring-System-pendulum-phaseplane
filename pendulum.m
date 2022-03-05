%Pendulum (y = theta)
%y''-cy+ksiny=0
clc; clear; close all;
m   = 1;
c   = 1;
k   = 1;
dt  = 0.01;
Tend = 20;
dydt = -4; 
%INITIAL CONDITION
i = 1;
t(i) = 0;
y(i) = 1;
i = 2;
t(i) = dt;
y(2) =  y(1)+dt*dydt;
%y(2) = y(1); %can also try this condition
%SOLUTION IN TIME
while t < Tend 
    t(i+1) = t(i)+dt;
    y(i+1) = (-sin(y(i))+c*y(i-1)/(2*dt) ...
                -m/dt^2*y(i-1)+m*2/dt^2*y(i))/(m/dt^2+c/(2*dt));
    i = i+1; 
end
for j = 2:i
    dydt(j-1) = (y(j)-y(j-1))/dt;
end
subplot(1,3,1),plot(t,y,'r.-'),title('Dampled Pendulum - \theta vs. t'),axis tight
xlabel('time'),ylabel('Angle')
subplot(1,3,2),plot(y(2:end),dydt,'r.-'),title('Phase Space')
xlabel('\theta'),ylabel('d \theta/ dt')
subplot(1,3,3),plot(y(2:end),dydt,'r.-'),title('Phase Space')
xlabel('\theta'),ylabel('d \theta/ dt')

IC = [-6 -4 -2  -1  ...
       6  4  2  1];
DXDT = [ -6 -4  -2 -0.5 0.5 2  4 6];
N = 5000;
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
subplot(1,3,3)
plot(y(1),(y(2)-y(1))/dt,'.'), hold on,
plot(0.5.*(y(2:end)+y(1:end-1)),dydt,'-')

if y(1) == 1 && i2 == 2
    1
    plot(y(1),(y(2)-y(1))/dt,'.'), hold on,
    plot(0.5.*(y(2:end)+y(1:end-1)),dydt,'r.-')
end
end
end

axis([min(IC) max(IC) min(DXDT) max(DXDT)])
 title(['Phase Space for m = 1, c = ',num2str(c),', k = 1 (Many Initial Conditions)'])
 xlabel('\theta')
 ylabel('d \theta/dt')

