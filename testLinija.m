function [Y_11,Y_12,Y_21,Y_22] = testLinija(z_0,z_1,c_0,c_1,l,f_g)
%ULAZ: -impedansa nulte komponente kroz liniju
%      -impedansa pozitivne komponente kroz liniju
%      -kapacitivnost nulte komponente kroz liniju
%      -kapacitivnost pozitivne komponente kroz liniju
%      -dužina linije izražena u [km]
%      -frekvencija
%IZLAZ: matrice admitansi PI-ekvivalenta linije u faznim koordinatama.
z_s_nulta = l*z_0;
z_s_pozitivna = l*z_1;
y_sh_nulta = 2*pi*f_g*c_0*l*i;
y_sh_pozitivna = 2*pi*f_g*c_1*l*i;
Y_eq_dijag = [1/z_s_nulta + y_sh_nulta/2 0 0; 0 1/z_s_pozitivna + y_sh_pozitivna/2 0; 0 0 1/z_s_pozitivna + y_sh_pozitivna/2];
Y_11 = simUFazZ(Y_eq_dijag);
Y_22 = Y_11;
Y_eq_van = [-1/z_s_nulta 0 0; 0 -1/z_s_pozitivna 0; 0 0 -1/z_s_pozitivna];
Y_12 = simUFazZ(Y_eq_van);
Y_21 = Y_12;
end

