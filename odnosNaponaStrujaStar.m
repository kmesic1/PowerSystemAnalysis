function [C_V C_I] = odnosNaponaStrujaStar(c)
%ULAZ: -konekcija spoja star
%IZLAZ: -matrica odnosa napona na èvoru x i napona namotaja transformatora
if c == 0 
    C_V = eye(3);
    C_I = eye(3);
elseif c == 2
    C_V = (-1) * [0 0 1; 1 0 0; 0 1 0];
    C_I = transpose(C_V) * (-1);
elseif c == 4
    C_I = [0 0 1; 1 0 0; 0 1 0];
    C_V = transpose(C_I);
elseif c == 6
    C_V = -eye(3);
    C_I = eye(3);
elseif c == 8
    C_V = [0 0 1; 1 0 0; 0 1 0];
    C_I = transpose(C_V);
elseif c == 10
    C_I = [0 0 1; 1 0 0; 0 1 0];
    C_V = (-1) * transpose(C_I)
end
end

