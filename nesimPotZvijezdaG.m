function [Y_P] = nesimPotZvijezdaG(z_a,z_b,z_c,z_g_2)
%ULAZ: -impedansa faze a
%      -impedansa faze b
%      -impedansa faze c
%      -impedansa grounda najcesce 0
%IZLAZ: -matrica admitansi nesimetricnog potrosaca u spoju zvijezda
Z_P = [z_a+z_g_2 z_g_2 z_g_2; z_g_2 z_b+z_g_2 z_g_2; z_g_2 z_g_2 z_c+z_g_2];
Y_P = inv(Z_P);
end
