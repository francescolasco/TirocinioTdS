A = 1;
B = 1;
ni = 1;
x_bar = 1;


%% 1:

u = function_1(A,B,ni,x_bar);

% printiamo a schermo il controllo ottenuto
disp(u)

% printiamo l'energia del segnale di controllo
J = energiaTD(u));
disp(J)


%% 2:

lmbd1 = 0;
lmbd2 = 0;

A = [lmbd1 0;
    0 lmbd2];

B = [1;
    1];

