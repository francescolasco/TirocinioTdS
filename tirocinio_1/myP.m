function P = myP(A,B,ni)
%MYP Restituisce la matrice di raggiungibilità in ni passi.
P = B;
for i = 1:(ni-1)
    P = [P, A^i*B];
end
end

