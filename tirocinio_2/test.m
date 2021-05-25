clc
clear
close all

A = [-1 0; 0 1];
B = [0 1]';
C = [0 0];
D = 0;

sys = ss(A,B,C,D);

x_bar = [0 5]';
t_bar = 3;

dt = 0.01;
t = [0:dt:t_bar];

u = conMinEn(A,B,x_bar,t_bar);

[y,tOut,x] = lsim(sys,u(t),t);
plot(t,x)
legend('x1','x2')

% come calcolarsi l'energia:

