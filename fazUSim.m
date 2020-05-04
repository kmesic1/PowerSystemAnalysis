function [X_012] = fazUSim(X_abc)
%Konverzija iz faznih koordinata u simetriène sekvence abc - 012
a = toComplex([1 120]);
T = 1/3*[1 1 1; 1 a a*a; 1 a*a a];
X_012 = T*X_abc;
end


