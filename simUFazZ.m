function [X_abc] = simUFazZ(X_012)
%Konverzija iz simetriènih komponenti u fazne kordinate Z  012 - abc
a = toComplex([1 120]);
T = 1/3*[1 1 1; 1 a a*a; 1 a*a a];
X_abc=T\X_012*T;
end


