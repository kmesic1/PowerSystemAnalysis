function [out] = toComplex(X)
for k=1:1:size(X,1)
    out(k,1)=X(k,1)*complex(cos(deg2rad(X(k,2))),sin(deg2rad(X(k,2))));
end
end

