function [I_N, Y_N] = Norton(E_g_abc,Z_g)
% Nortonov ekvivalent
% Ulaz: -vektor faznih napona sinhronog generatora
%       -matrica impedansi unutarnje otpornosti sinhronog generatora
% Izlaz: -vektor struje Norton-ovog ekivalenta sinhronog naponskog generatora
%        -matrica admitansi Norton-ovog ekvivalenta od sinhronog naponskog generatora
I_N = Z_g\E_g_abc;
Y_N = inv(Z_g);
end

