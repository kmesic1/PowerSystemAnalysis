function [s,varargout] = dimMatrice(x)
%ULAZ: -posmatrana matrica
%IZLAZ: -dimenzije matrice
    nout = max(nargout,1) - 1;
    s = size(x);
    for k = 1:nout
        varargout{k} = s(k);
    end
end

