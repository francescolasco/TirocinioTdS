A = [ 1  0  3
      2 -2  1
      0  0  2 ];

B = [1 0 
     0 0
     0 1];
 
ni = 5;
x_bar = transpose([5 10 0]);


%% 1:

u = conMinEn(A,B,ni,x_bar);


% printiamo l'energia del segnale di controllo
J = energiaTD(u);
disp(J)


%% 2:

% studio con autovalori reali concordi positivi%

lmbd1 = 6;
lmbd2 = -5;

A = [lmbd1 0;
    0 lmbd2];

B = [1;
    1];

x_bar = [15;10];

J = [];

ni_max = 10;

for ni = 2:ni_max
   J = [J,energiaTD(conMinEn(A,B,ni,x_bar))];
end

plot(J)



