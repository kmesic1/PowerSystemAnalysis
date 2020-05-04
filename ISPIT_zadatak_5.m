e_g = 22.5e3;
fi = 0;
f_g = 50;
a = toComplex([1 120]);
conn = 7;
S_n = 500e6;, 
U_n_1= 22e3;
U_n_2=220e3;
u_k_0 = 10;
P_cu_0 = 10e3;
i_o_0 = 0.04;
P_fe_0= 5e3; 
u_k_1 = 9;
P_cu_1 = 10e3;
i_o_1 = 0.05;
P_fe_1= 5e3;
z_n_1 = complex(1,0.8);
z_n_2 = 0;
c = 0.01e-6; 
z_2_a = complex(50,10);
z_2_b = complex(20,10);
z_2_c = complex(50,5);
z_2_g = 5;
primar = 'Y';
sekundar = 'D';

%Vrijednosti generatora
E_g = toComplex([e_g/sqrt(3) fi]);
E_g_abc = [E_g; E_g*a^2; E_g*a];
Z_g = z_g*eye(3);
I_N = Z_g\E_g_abc;
Y_N = inv(Z_g);

%PI ekvivalent transformatora
[z_0,y_0] = komponentePI(u_k_0,i_o_0,U_n_1,S_n,P_cu_0,P_fe_0)
[z_1,y_1] = komponentePI(u_k_1,i_o_1,U_n_1,S_n,P_cu_1,P_fe_1)
[Y_11,Y_12,Y_21,Y_22] = testTransformator(primar,sekundar,U_n_1,U_n_2,conn,z_0,z_1,y_0,y_1,z_n_1,z_n_2)

%Matrica admitansi potrosaca
z_2 = complex(200,80);
z_g_2 = 1;
Z_P = [z_2_a+z_g_2 z_g_2 z_g_2; z_g_2 z_2_b+z_g_2 z_g_2; z_g_2 z_g_2 z_2_c+z_g_2];
Y_P = inv(Z_P);

%Matrica admitansi kondezatora
y_c = 2*pi*f_g*c*i;
Y_C = [2*y_c -y_c -y_c; -y_c 2*y_c -y_c; -y_c -y_c 2*y_c];

%KZS jednadžbe
null = zeros(3,1);
b = [null; null; I_N; null; null; null; null];
null3 = zeros(3);
A = [Y_11 Y_12 -eye(3) null3 null3 null3 null3; Y_21 Y_22 null3 -eye(3) null3 null3 null3; null3 null3 eye(3) null3 eye(3) eye(3) null3; null3 null3 null3 eye(3) null3 null3 eye(3); Y_N null3 null3 null3 -eye(3) null3 null3; Y_C null3 null3 null3 null3 -eye(3) null3; null3 Y_P null3 null3 null3 null3 -eye(3)];
sys = inv(A)*b;
polarPrint(sys)

%Vrijednosti napona cvorova
V_1 = [sys(1,1); sys(2,1); sys(3,1)];
V_1_pu = V_1/e_g*sqrt(3);
V_1_l = V_1*toComplex([sqrt(3) fi]);
polarPrint(V_1_pu)

V_2 = [sys(4,1); sys(5,1); sys(6,1)];
V_2_pu = V_2/e_g*sqrt(3);
V_2_l = V_2*toComplex([sqrt(3) fi]);
polarPrint(V_2_pu)

%Vrijednosti struja i snaga kroz prenosne elemente
I_12 = [sys(7,1); sys(8,1); sys(9,1)];
S_12 = V_1.*conj(I_12);

I_21 = [sys(10,1); sys(11,1); sys(12,1)];
S_21 = V_2.*conj(I_21);

S_loss = S_12+S_21;

%Vrijednosti struja i snaga generatora
I_10_N = [sys(13,1); sys(14,1); sys(15,1)];
I_g = I_N - I_10_N;
S_1 = V_1.*conj(I_g);

%Vrijednosti struja i snaga shunt-ova
I_c = [sys(16,1); sys(17,1); sys(18,1)];
S_2 = V_2.*conj(I_c)

I_p = [sys(19,1); sys(20,1); sys(21,1)];
S_2 = V_2.*conj(I_p)

%Napon u zvijezdistu
I_z = I_p(1,1)+I_p(2,1)+I_p(3,1);
V_z = z_g_2*I_z % rez treba da je 0<38