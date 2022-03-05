%suspension Bridge Golden Gates;
%Boundary value problem solutions to
%
%y'' = 2, y(0) = 0, y(1) = 0
%
clc; clear; close all;

x = linspace(0,1,5);
dx = x(2) - x(1);
y(1) = 0;
y(3) = 0;

%A = [1 0 0; 1/dx^2 -2/dx^2 1/dx^2; 0 0 1]
b = [0 2 0]';
A = [1 0 0 0 0; ...
1/dx^2 -2/dx^2 1/dx^2 0 0; ...
0 1/dx^2 -2/dx^2 1/dx^2 0; ...
0 0 1/dx^2 -2/dx^2 1/dx^2;
0 0 0 0 1]
y = inv(A)*b;
plot(x,y,'.-')