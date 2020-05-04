function [Y_C] = matAdmKondDelta(c,f_g)
%ULAZ: -kapacitivnost kondezatora
%      -frekvencija mre�e
%IZLAZ: -matrica admitansi kondenzatora
y_c = 2*pi*f_g*c*i;
Y_C = [2*y_c -y_c -y_c; -y_c 2*y_c -y_c; -y_c -y_c 2*y_c];
end

