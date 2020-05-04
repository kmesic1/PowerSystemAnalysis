function [E_g_abc,Z_g] = generator(e_g,fi,z_g)
%ULAZ: -Linijski napon sinhromog generatora
%      -ugao faze a napon generatora
%      -impedansa generatora
%IZLAZ: -Vektor faznih napona EMS-a sinhronog generatora
%       -Matrica impedansi unutarnje otpornosti sinhronog generatora
a = toComplex([1 120]);
E_g = toComplex([e_g/sqrt(3) fi]);
E_g_abc = [E_g; E_g*a^2; E_g*a];
Z_g = z_g*eye(3);
end

