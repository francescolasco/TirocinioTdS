%% esempio 3
clear
close all

A = [ 1  0  3
      2 -2  1
      0  0 -2 ];

B = [1 0 
     0 0
     0 1];
 
ni = 2;
x_bar = [-1; -1; -1];

u = conMinEn(A,B,ni,x_bar);
x_zero = [0;0;0];
stati = rispostaStato(A,B,u,x_zero);

figure(1)
subplot(2,1,1)
hold on
plot(stati(1,:))
plot(stati(2,:))
plot(stati(3,:))
grid on
title("stati")
legend("x1","x2","x3")
hold off

subplot(2,1,2)
hold on

u = [-0.5217    -0.6087 0;

    0.0435      -0.9130 0];

plot(u(1,:))
plot(u(2,:))

title("ingressi")
legend("u1","u2")
grid on
   


