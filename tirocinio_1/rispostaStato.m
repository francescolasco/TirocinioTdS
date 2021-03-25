function stati = rispostaStato(A,B,u,x_zero)
%RISPOSTASTATO Summary of this function goes here
%   Detailed explanation goes here
    x = x_zero;
    stati = [x];
    
    for i = 1:size(u,1)
        x = A*x+B*cell2mat(u(i));
        stati = [stati, x];
    end
end

