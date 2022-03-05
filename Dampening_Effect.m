%Classical Mass-Spring System 
clear; close all; clc
N = 200;
x = linspace(0,20,N);
dx = x(2)-x(1);
A=1;
B=0;
C=1;
D=0;

i = 1; y(i) = 0;
i = 2; y(i) = dx+y(i-1);

for i = 2:N-1
    y(i+1) = (D+A*2*y(i)/dx^2-A*y(i-1)/dx^2 ...
               +B*y(i-1)/(2*dx)-C*y(i))/(A/dx^2+B/(2*dx));
end
plot(x,y,'.'),title('Mass-Spring System')