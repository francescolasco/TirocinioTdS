function u = conMinEn(A,B,x_bar,t_bar)
%   Calcola il controllo a minima energia tempo continuo e restituisce un
%   handle funzione Matlab.

    G = myGram(A,B);

    syms t tau
    beta = pinv(subs(G,t,t_bar))*x_bar;

    u_sym = simplify(B'* exp(A*(t_bar-tau))*beta);
    u = matlabFunction(u_sym);
end

