function u = conMinEn(A,B,ni,x_bar)
%conMinEn Funzione svolgimento esercizio 1
%   Restituisce, se esiste, un controllo u che in ni passi porta dallo
%   stato x(0) = 0 allo stato x(ni) = x_bar.

    P = myP(A,B,ni);
    
    % test di raggiungibilità %
    
    if rank(P) == rank([P,x_bar])
        % passo "2bis" dell'algoritmo per la Minima Energia %
        G = P*transpose(P);
            
        %beta = linsolve(G,x_bar);
        beta = pinv(G)*x_bar; 
        
        w = transpose(P)*beta;
            
        % manipolare w in modo da avere il vettore di ingressi %

        u = flip(mat2cell(w,size(B,2)*ones(1,ni)));
        
    else
        disp("x_bar non è raggiungibile (in ni passi)")
        u = 0; 
    end
end

