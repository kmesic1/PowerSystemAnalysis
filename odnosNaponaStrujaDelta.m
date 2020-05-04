function [C_V C_I] = odnosNaponaStrujaDelta(c)
%ULAZ: -konekcija spoja delta
%IZLAZ: -matrica odnosa napona na èvoru x i napona namotaja transformatora
if c == 1
    C_V = [1 0 -1; -1 1 0; 0 -1 1];
    C_I = [1 -1 0; 0 1 -1; -1 0 1];
elseif c == 3
    C_V = [0 1 -1; -1 0 1; 1 -1 0];
    C_I = [0 -1 1; 1 0 -1; -1 1 0];
elseif c == 5
    C_V = [-1 1 0; 0 -1 1; 1 0 -1];
    C_I = [-1 0 1; 1 -1 0; 0 1 -1];
elseif c == 7
    C_I = [-1 1 0; 0 -1 1; 1 0 -1];
    C_V = [-1 0 1; 1 -1 0; 0 1 -1];
elseif c == 9
    C_I = [0 1 -1; -1 0 1; 1 -1 0];
    C_V = [0 -1 1; 1 0 -1; -1 1 0];
elseif c == 11
    C_I = [1 0 -1; -1 1 0; 0 -1 1];
    C_V = [1 -1 0; 0 1 -1; -1 0 1];
end
end

