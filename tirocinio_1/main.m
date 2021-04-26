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

x_bar = [[1;1],[1;-1],[-1;-1],[sqrt(2)/2; -sqrt(2)/2]]; % su ogni colonna ho una x_bar da testare.

J = [];

ni_max = 5;

% costruisco una matrice in cui su ogni riga ho il costo del controllo in n
% passi (con n = numero di colonna) per i vari x_bar da testare.
for ni = 2:ni_max
    for i = 1:size(x_bar,2)
        J(i,ni-1) = energiaTD(conMinEn(A,B,ni,x_bar(:,i)));
    end
end

figure('Name',' Autovalori reali concordi positivi')

subplot(3,2,[1 3 5])
plot(J') % trasposta perché matlab prende le colonne come input
grid on
title('\textbf{Energia del controllo}','Interpreter','Latex')
legend('$\bar{x}_{1}$','$\bar{x}_{2}$','$\bar{x}_{3}$','$\bar{x}_{4}$','Interpreter','Latex')
xlabel('$\nu$','Interpreter','Latex')

for i = 1:size(x_bar,2)
    u(:,i) = conMinEn(A,B,ni,x_bar(:,i));
end

x_zero = [0;0];

for i = 1:size(u,2)
    stati([2*i-1 2*i],:) = rispostaStato(A,B,u(:,i),x_zero);
end


subplot(3,2,2)
hold on
for i = 1:size(stati,1)/2
   plot(stati(2*i-1,:)) 
end
title('$\textbf{x}_{\textbf{1}}$','Interpreter','Latex')
legend('$\bar{x}_{1}$','$\bar{x}_{2}$','$\bar{x}_{3}$','$\bar{x}_{4}$','Interpreter','Latex','Location','northwest')
grid on


subplot(3,2,4)
hold on
for i = 1:size(stati,1)/2
   plot(stati(2*i,:)) 
end
title('$\textbf{x}_{\textbf{2}}$','Interpreter','Latex')
legend('$\bar{x}_{1}$','$\bar{x}_{2}$','$\bar{x}_{3}$','$\bar{x}_{4}$','Interpreter','Latex','Location','northwest')
grid on

subplot(3,2,6)
plot(cell2mat(u))
title('\textbf{Ingresso: u}','Interpreter','Latex')
legend('$\bar{x}_{1}$','$\bar{x}_{2}$','$\bar{x}_{3}$','$\bar{x}_{4}$','Interpreter','Latex')
grid on

%% 2: studio con autovalori reali concordi negativi 

lmbd1 = -3;
lmbd2 = -7;

A = [lmbd1 0;
    0 lmbd2];

B = [1;
    1];

x_bar = [[1;1],[1;-1],[-1;-1],[sqrt(2)/2; -sqrt(2)/2]]; % su ogni colonna ho una x_bar da testare.

J = [];

ni_max = 5;

% costruisco una matrice in cui su ogni riga ho il costo del controllo in n
% passi (con n = numero di colonna) per i vari x_bar da testare.
for ni = 2:ni_max
    for i = 1:size(x_bar,2)
        J(i,ni-1) = energiaTD(conMinEn(A,B,ni,x_bar(:,i)));
    end
end

figure('Name',' Autovalori reali concordi negativi')

subplot(3,2,[1 3 5])
plot(J') % trasposta perché matlab prende le colonne come input
grid on
title('\textbf{Energia del controllo}','Interpreter','Latex')
legend('$\bar{x}_{1}$','$\bar{x}_{2}$','$\bar{x}_{3}$','$\bar{x}_{4}$','Interpreter','Latex')
xlabel('$\nu$','Interpreter','Latex')

for i = 1:size(x_bar,2)
    u(:,i) = conMinEn(A,B,ni,x_bar(:,i));
end

x_zero = [0;0];

for i = 1:size(u,2)
    stati([2*i-1 2*i],:) = rispostaStato(A,B,u(:,i),x_zero);
end


subplot(3,2,2)
hold on
for i = 1:size(stati,1)/2
   plot(stati(2*i-1,:)) 
end
title('$\textbf{x}_{\textbf{1}}$','Interpreter','Latex')
legend('$\bar{x}_{1}$','$\bar{x}_{2}$','$\bar{x}_{3}$','$\bar{x}_{4}$','Interpreter','Latex','Location','northwest')
grid on


subplot(3,2,4)
hold on
for i = 1:size(stati,1)/2
   plot(stati(2*i,:)) 
end
title('$\textbf{x}_{\textbf{2}}$','Interpreter','Latex')
legend('$\bar{x}_{1}$','$\bar{x}_{2}$','$\bar{x}_{3}$','$\bar{x}_{4}$','Interpreter','Latex','Location','northwest')
grid on

subplot(3,2,6)
plot(cell2mat(u))
title('\textbf{Ingresso: u}','Interpreter','Latex')
legend('$\bar{x}_{1}$','$\bar{x}_{2}$','$\bar{x}_{3}$','$\bar{x}_{4}$','Interpreter','Latex')
grid on


%% 2: studio con autovalori reali discordi 

lmbd1 = 3;
lmbd2 = -7;

A = [lmbd1 0;
    0 lmbd2];

B = [1;
    1];

x_bar = [[1;1],[1;-1],[-1;-1],[sqrt(2)/2; -sqrt(2)/2]]; % su ogni colonna ho una x_bar da testare.

J = [];

ni_max = 5;

% costruisco una matrice in cui su ogni riga ho il costo del controllo in n
% passi (con n = numero di colonna) per i vari x_bar da testare.
for ni = 2:ni_max
    for i = 1:size(x_bar,2)
        J(i,ni-1) = energiaTD(conMinEn(A,B,ni,x_bar(:,i)));
    end
end

figure('Name',' Autovalori reali discordi')

subplot(3,2,[1 3 5])
plot(J') % trasposta perché matlab prende le colonne come input
grid on
title('\textbf{Energia del controllo}','Interpreter','Latex')
legend('$\bar{x}_{1}$','$\bar{x}_{2}$','$\bar{x}_{3}$','$\bar{x}_{4}$','Interpreter','Latex')
xlabel('$\nu$','Interpreter','Latex')

for i = 1:size(x_bar,2)
    u(:,i) = conMinEn(A,B,ni,x_bar(:,i));
end

x_zero = [0;0];

for i = 1:size(u,2)
    stati([2*i-1 2*i],:) = rispostaStato(A,B,u(:,i),x_zero);
end


subplot(3,2,2)
hold on
for i = 1:size(stati,1)/2
   plot(stati(2*i-1,:)) 
end
title('$\textbf{x}_{\textbf{1}}$','Interpreter','Latex')
legend('$\bar{x}_{1}$','$\bar{x}_{2}$','$\bar{x}_{3}$','$\bar{x}_{4}$','Interpreter','Latex','Location','northwest')
grid on


subplot(3,2,4)
hold on
for i = 1:size(stati,1)/2
   plot(stati(2*i,:)) 
end
title('$\textbf{x}_{\textbf{2}}$','Interpreter','Latex')
legend('$\bar{x}_{1}$','$\bar{x}_{2}$','$\bar{x}_{3}$','$\bar{x}_{4}$','Interpreter','Latex','Location','northwest')
grid on

subplot(3,2,6)
plot(cell2mat(u))
title('\textbf{Ingresso: u}','Interpreter','Latex')
legend('$\bar{x}_{1}$','$\bar{x}_{2}$','$\bar{x}_{3}$','$\bar{x}_{4}$','Interpreter','Latex')
grid on