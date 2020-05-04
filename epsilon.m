function [X] = epsilon(X)
%ULAZ: -analizirana vrijednost
%IZLAZ: -nova vrijednost
eps = 1e-10;
if imag(X)< eps
    X = complex(real(X), 0);
end
if real(X)< eps
    X = complex(0, imag(X));;
end
end

