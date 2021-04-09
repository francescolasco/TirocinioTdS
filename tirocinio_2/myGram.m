function G = myGram(A,B)
%MYGRAM Calcola la matrice Gramiana di controllabilità.
    syms tau t; 
    
    G = simplify(int(expm(A*tau)*(B*B')*expm(A'*tau),tau,0,t));
end

