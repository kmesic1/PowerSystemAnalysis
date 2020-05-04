function [X] = fazorIzSinSig(A, A_0, t_0, T, name)
%ULAZ: -amplituda sinusoidalnog signala
%      -amplituda sinusoidalnog signala u t=0
%      -period od t=0 do taèke gdje je amplituda sinusoidalnog signala 0
%      -period sinusoidalnog signala
%      -naziv posmatranog fazora
w = 2 * pi / T;
phi = w * t_0;
if A_0 > 0
    if phi < 0
        phi = pi + phi;
    end
    X = A * exp(1i * phi);
elseif A_0 <= 0
    if phi > 0
        phi = pi + phi;
    end
    X = A * exp(1i * phi);
end
grafFazora(X, name)
end

