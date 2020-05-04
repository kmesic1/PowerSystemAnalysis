function [Y] = simPotDelta(y)
%ULAZ: -admitansa potrosaca
%IZLAZ: -matrica admitansi simetricnog potrosaca u delta spoju
Y = [2*y -y -y;-y 2*y -y; -y -y 2*y];
end

