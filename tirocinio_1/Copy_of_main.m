A = [ 1  0  3
      2 -2  1
      0  0  2 ];

B = [1 0 
     0 0
     0 1];
 
ni = 5;
x_bar = [5; 10; 0];


%% 1:

u = conMinEn(A,B,ni,x_bar);


% printiamo l'energia del segnale di controllo
J = energiaTD(u);
disp(J)


%% 2: studio con autovalori reali concordi positivi 

lmbd1 = 3;
lmbd2 = 7;

A = [lmbd1 0;
    0 lmbd2];

B = [1;
    1];

x_bar = [1;1];

J = [];

ni_max = 5;

for ni = 2:ni_max
   J(ni-1) = energiaTD(conMinEn(A,B,ni,x_bar));
end

figure(1)
subplot(3,2,[1 3 5])
plot(J)
grid on
title('autovalori reali concordi positivi')

u = conMinEn(A,B,ni,x_bar);
x_zero = [0;0];
stati = rispostaStato(A,B,u,x_zero);

subplot(3,2,2)
plot(stati(1,:))
title('x1')
grid on

subplot(3,2,4)
plot(stati(2,:))
title('x2')
grid on

subplot(3,2,6)
plot(cell2mat(u)')
title('u')
grid on

%% 2: studio con autovalori reali concordi negativi 

lmbd1 = -3;
lmbd2 = -7;

A = [lmbd1 0;
    0 lmbd2];

B = [1;
    1];

x_bar = [1;1];

J = [];

ni_max = 5;

for ni = 2:ni_max
   J = [J,energiaTD(conMinEn(A,B,ni,x_bar))];
end

figure(2)
subplot(3,2,[1 3 5])
plot(J)
grid on
title('autovalori reali concordi negativi')

u = conMinEn(A,B,ni,x_bar);
x_zero = [0;0];
stati = rispostaStato(A,B,u,x_zero);

subplot(3,2,2)
plot(stati(1,:))
title('x1')
grid on

subplot(3,2,4)
plot(stati(2,:))
title('x2')
grid on

subplot(3,2,6)
plot(cell2mat(u)')
title('u')
grid on


%% 2: studio con autovalori reali discordi 

lmbd1 = 3;
lmbd2 = -7;

A = [lmbd1 0;
    0 lmbd2];

B = [1;
    1];

x_bar = [1;1];

J = [];

ni_max = 5;

for ni = 2:ni_max
   J = [J,energiaTD(conMinEn(A,B,ni,x_bar))];
end

figure(3)
subplot(3,2,[1 3 5])
plot(J)
grid on
title('autovalori reali discordi')

u = conMinEn(A,B,ni,x_bar);
x_zero = [0;0];
stati = rispostaStato(A,B,u,x_zero);

subplot(3,2,2)
plot(stati(1,:))
title('x1')
grid on

subplot(3,2,4)
plot(stati(2,:))
title('x2')
grid on

subplot(3,2,6)
plot(cell2mat(u)')
title('u')
grid on

