%Classical Mass-Spring System 
%
clear; close all; clc
N = 200;
x = linspace(0,20,N);
dx = x(2)-x(1);

m=1;c=3;k=1;D=0;

i = 1; y(i) = 1;
i = 2; y(i) = 0+y(i-1);

for i = 2:N-1
    y(i+1) = (D+m*2*y(i)/dx^2-m*y(i-1)/dx^2 ...
               +c*y(i-1)/(2*dx)-k*y(i))/(m/dx^2+c/(2*dx));
end
plot(x,y,'-'), hold on,

m=1;c=2;k=1;D=0;

i = 1; y(i) = 1;
i = 2; y(i) = 0+y(i-1);

for i = 2:N-1
    y(i+1) = (D+m*2*y(i)/dx^2-m*y(i-1)/dx^2 ...
               +c*y(i-1)/(2*dx)-k*y(i))/(m/dx^2+c/(2*dx));
end
plot(x,y,'.-'), hold on,

m=1;c=1/2;k=1;D=0;

i = 1; y(i) = 1;
i = 2; y(i) = 0+y(i-1);

for i = 2:N-1
    y(i+1) = (D+m*2*y(i)/dx^2-m*y(i-1)/dx^2 ...
               +c*y(i-1)/(2*dx)-k*y(i))/(m/dx^2+c/(2*dx));
end
plot(x,y,'--'), hold on,
legend('Overdamped','Critically Damped','Underdamped')
xlabel('Time'),ylabel('Displacement')
