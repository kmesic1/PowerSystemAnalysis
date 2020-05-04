function [sys] = proracunMreze(Y_11,Y_12,Y_21,Y_22,Y_C,Y_P)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
null = zeros(3,1);
b = [null; null; I_N; null; null; null; null];
null3 = zeros(3);
A = [Y_11 Y_12 -eye(3) null3 null3 null3 null3; Y_21 Y_22 null3 -eye(3) null3 null3 null3; null3 null3 eye(3) null3 eye(3) null3 null3; null3 null3 null3 eye(3) null3 eye(3) eye(3); Y_N null3 null3 null3 -eye(3) null3 null3; null3 Y_C null3 null3 null3 -eye(3) null3; null3 Y_P null3 null3 null3 null3 -eye(3)];
sys = inv(A)*b;
polarPrint(sys)
end

