function [z_s,y_sh] = komponentePI(u_k,i_o,U_n,S_n,P_cu,P_fe)
z = abs(u_k*U_n^2/(100*S_n));
r_s = U_n^2*P_cu/S_n^2;
x_s = sqrt(z^2-r_s^2);
z_s = complex(r_s,x_s);
y = abs(i_o*S_n/(100*U_n^2));
g_sh = P_fe/U_n^2;
b_sh = sqrt(y^2-g_sh^2);
y_sh = complex(g_sh,-b_sh);
end

