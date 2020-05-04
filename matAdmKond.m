function [Y_C] = matAdmKond(c,f_g)
%ULAZ: -kapacitivnost kondezatora
%      -frekvencija mreže
%IZLAZ: -matrica admitansi kondenzatora
y_c = 2*pi*f_g*c*i;
Y_C = [y_c 0 0; 0 y_c 0; 0 0 y_c];
end
