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
figure(1)
plot(t,x)
grid on
legend('x1','x2')

x_bar = x(size(x,1),:)';

% 3)

Ti = t_bar*[0.1 0.25 0.5 0.75 1 1.5 1.75 2]; % Vettore dei tempi da sperimentare
u = {};                                      % inizializzo un vettore che riempirò di handle di funzioni u(t), ingressi per i Ti


for i = 1:size(Ti,2)
   u{i} = conMinEn(A,B,x_bar,Ti(i));
end


% esempio di simulazione per t = Tbar


[y,tOut,x] = lsim(sys,u{5}(t),t);

figure(2)
plot(t,x)
grid on
legend('x2','x1')

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

x_bar = x(size(x,1),:)';

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

x_bar = x(size(x,1),:)';
