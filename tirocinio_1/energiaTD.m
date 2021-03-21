function J = energiaTD(u)
%ENERGIATD calcola l'energia del segnale di controllo a Tempo Discreto u
    J = 0;
    for i = 1:size(u,1)
        ui = cell2mat(u(i));
        J = J + (transpose(ui)*ui);
    end
  end

