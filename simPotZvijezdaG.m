function [Y_P] = simPotZvijezdaG(z_2,z_g_2)
%ULAZ: -impedansa faza 
%      -impedansa grounda
%IZLAZ: -matrica admitansi simetricnog potrosaca u spoju zvijezda
Z_P = [z_2+z_g_2 z_g_2 z_g_2; z_g_2 z_2+z_g_2 z_g_2; z_g_2 z_g_2 z_2+z_g_2];
Y_P = inv(Z_P);
end

