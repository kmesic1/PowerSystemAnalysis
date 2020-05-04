function [Y_11_abc,Y_12_abc,Y_21_abc,Y_22_abc] = testTransformator(primar,sekundar,U_n_1,U_n_2,c,z_0,z_1,y_0,y_1,z_n_1,z_n_2)
%ULAZ: -formacija primarne strane transformatora
%      -formacija sekundarne strane transformatora
%      -napon primara
%      -napon sekundara
%      -satni broj
%      -impedansa nulte komponente
%      -impedansa pozitivne komponente
%      -admitansa nulte komponente
%      -admitansa pozitivne komponente
%      -impedansa ground na strani primara
%      -impedansa ground na strani sekundara
%IZLAZ: Matrice admitansi pi-ekvivalenta u faznim koordinatama za transformator 
if primar == 'Y' && sekundar == 'Y'
    n = toComplex([U_n_1/U_n_2 c*30]);
    z_s = z_0 + 3 * (z_n_1 + n^2 * z_n_2);
        
    Y_nulta = [y_0/2+1/z_s -1/z_s; -1/z_s y_0/2+1/z_s];
    Y_poz = [y_1/2+1/z_1 -1/z_1; -1/z_1 y_1/2+1/z_1];
        
    Y_nulta_c = Y_nulta .* [1 n; conj(n) n*conj(n)];
    Y_poz_c = Y_poz .* [1 n; conj(n) n*conj(n)];
    Y_neg_c = Y_poz .* [1 conj(n); n n*conj(n)];
        
    Y_11 = [Y_nulta_c(1,1) 0 0; 0 Y_poz_c(1,1) 0; 0 0 Y_neg_c(1,1)];
    Y_12 = [Y_nulta_c(1,2) 0 0; 0 Y_poz_c(1,2) 0; 0 0 Y_neg_c(1,2)];
    Y_21 = [Y_nulta_c(2,1) 0 0; 0 Y_poz_c(2,1) 0; 0 0 Y_neg_c(2,1)];
    Y_22 = [Y_nulta_c(2,2) 0 0; 0 Y_poz_c(2,2) 0; 0 0 Y_neg_c(2,2)];
        
    Y_11_abc = simUFazZ(Y_11);
    Y_12_abc = simUFazZ(Y_12);
    Y_21_abc = simUFazZ(Y_21);
    Y_22_abc = simUFazZ(Y_22);
end
if primar == 'Y' && sekundar == 'D'
    n = toComplex([U_n_1/U_n_2 c*30]);
    y_s = 1/(3 * z_n_1 + z_0);
        
    Y_nulta = [y_s 0; 0 0];
    Y_poz = [y_1/2+1/z_1 -1/z_1; -1/z_1 y_1/2+1/z_1];
        
    Y_nulta_c = Y_nulta .* [1 n; conj(n) n*conj(n)];
    Y_poz_c = Y_poz .* [1 n; conj(n) n*conj(n)];
    Y_neg_c = Y_poz .* [1 conj(n); n n*conj(n)];
        
    Y_11 = [Y_nulta_c(1,1) 0 0; 0 Y_poz_c(1,1) 0; 0 0 Y_neg_c(1,1)];
    Y_12 = [Y_nulta_c(1,2) 0 0; 0 Y_poz_c(1,2) 0; 0 0 Y_neg_c(1,2)];
    Y_21 = [Y_nulta_c(2,1) 0 0; 0 Y_poz_c(2,1) 0; 0 0 Y_neg_c(2,1)];
    Y_22 = [Y_nulta_c(2,2) 0 0; 0 Y_poz_c(2,2) 0; 0 0 Y_neg_c(2,2)];
        
    Y_11_abc = simUFazZ(Y_11);
    Y_12_abc = simUFazZ(Y_12);
    Y_21_abc = simUFazZ(Y_21);
    Y_22_abc = simUFazZ(Y_22);
end
if primar == 'D' && sekundar == 'Y'
    n = toComplex([U_n_2/U_n_1 c*30]);
    y_s = 1/(3 * z_n_2 + z_0);
        
    Y_nulta = [0 0; 0 y_s];
    Y_poz = [y_1/2+1/z_1 -1/z_1; -1/z_1 y_1/2+1/z_1];
        
    Y_nulta_c = Y_nulta .* [n*conj(n) n; conj(n) 1];
    Y_poz_c = Y_poz .* [n*conj(n) n; conj(n) 1];
    Y_neg_c = Y_poz .* [n*conj(n) conj(n); n 1];
        
    Y_11 = [Y_nulta_c(1,1) 0 0; 0 Y_poz_c(1,1) 0; 0 0 Y_neg_c(1,1)];
    Y_12 = [Y_nulta_c(1,2) 0 0; 0 Y_poz_c(1,2) 0; 0 0 Y_neg_c(1,2)];
    Y_21 = [Y_nulta_c(2,1) 0 0; 0 Y_poz_c(2,1) 0; 0 0 Y_neg_c(2,1)];
    Y_22 = [Y_nulta_c(2,2) 0 0; 0 Y_poz_c(2,2) 0; 0 0 Y_neg_c(2,2)];
        
    Y_11_abc = simUFazZ(Y_11);
    Y_12_abc = simUFazZ(Y_12);
    Y_21_abc = simUFazZ(Y_21);
    Y_22_abc = simUFazZ(Y_22);
end
if sekundar ~= 'Y' || primar ~= 'Y' || sekundar ~= 'D' || primar ~= 'D' || c < 0
    Y_11_abc = 0; 
    Y_12_abc = 0;
    Y_21_abc = 0; 
    Y_22_abc = 0;
    disp('Pogrešan unos podataka.');
end
end

