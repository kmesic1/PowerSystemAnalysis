%Vabc = [4290.738645 3.797460; 2665.577751 122.230388; 3079.652113 -127.236190];
%Iabc = [508.552353 57.656074; 550.620242 -15.752572; 138.146269 -51.316045];
Vabc = [2384.084401 173.783644; 3950.522894 -61.956788; 3702.635606 66.093660];
Iabc = [202.057026 -23.447382; 108.851964 69.554314; 380.850814 18.177282];

V_abc = toComplex(Vabc)
I_abc = toComplex(Iabc)
V_012=fazUSim(V_abc)
I_012=fazUSim(I_abc);
Z_0=V_012(1)/I_012(1);
Y_0=I_012(1)/V_012(1);
Z_1=V_012(2)/I_012(2);
Y_1=I_012(2)/V_012(2);
Z_2=V_012(3)/I_012(3);
Y_2=I_012(3)/V_012(3);
polarPrint(Y_0);
polarPrint(Y_1);
polarPrint(Y_2);
polarPrint(Z_0);
polarPrint(Z_1);
polarPrint(Z_2);

E_g=[10000 0; 10000 -120; 10000 120];
e_1 = [5000 60];
e_2 = [200 18];
n_1 = 1000;
n_2 = 500;
prekidac = [0; 1; 1];
Z = [50 90];
Z = toComplex(Z);
Z = [Z 0 0; 0 Z 0; 0 0 Z];
E_g = toComplex(E_g);
e_1 = toComplex(e_1);
e_2 = toComplex(e_2);
V_1 = E_g-e_1;
V_1 = V_1 .* prekidac;
V_2 = V_1*n_2/n_1;
V_Z = V_2+e_2;
I_Z = inv(Z)*V_Z;

U_l=10000;
n_1 = 500;
n_2 = 250;
a = toComplex([1 120]);
U_f = U_l/sqrt(3);
U_f_abc = [U_f; U_f*a^2; U_f*a];
U_f_012 = U_f_abc;%U_f_012 = fazUSim(U_f_abc);
V_1_012 = U_f_012;
V_2_012 = V_1_012 *n_2/n_1;
U_V = V_2_012(1) + V_2_012(2) - V_2_012(3);
U_V = abs(U_V)
