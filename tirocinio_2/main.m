clear
clc
close all

B = [0; 1];
C = [0 0];
D = 0;

t_bar = 10;
[u,t] = gensig("sine",5,t_bar);


%% due autovalori reali e distinti, entrambi negativi.

gamma_1 = -3;
gamma_2 = -1;

A = [0 1; gamma_1 gamma_2];

G = myGram(A,B)

sys = ss(A,B,C,D);

[y,tOut,x] = lsim(sys,u,t);
plot(t,x)
grid on
legend('x1','x2')

x_bar = x(size(x,1),:);

%% due autovalori reali e distinti, uno negativo e uno positivo.

gamma_1 = 3;
gamma_2 = -1;

A = [0 1; gamma_1 gamma_2];

G = myGram(A,B)

sys = ss(A,B,C,D);

[y,tOut,x] = lsim(sys,u,t);
plot(t,x)
grid on
legend('x1','x2')

x_bar = x(size(x,1),:);

%% due autovalori complessi coniugati.

gamma_1 = 3 + 2i;
gamma_2 = 3 - 2i;

A = [0 1; gamma_1 gamma_2];

G = myGram(A,B)

sys = ss(A,B,C,D);

[y,tOut,x] = lsim(sys,u,t);
plot(t,x)
grid on
legend('x1','x2')

x_bar = x(size(x,1),:);
