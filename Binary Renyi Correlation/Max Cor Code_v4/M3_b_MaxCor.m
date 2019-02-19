function [RhoMax,Qxy,s] = M3_b_MaxCor(Pxy)
%UNTITLED4 Summary of this function goes here
% Px_N = 2;
% Py_N = 2;
% Pxy = rand(Px_N,Py_N); Pxy = Pxy./(sum(sum(Pxy)));


% Marginals:
Py = sum(Pxy,1);
Px = sum(Pxy,2);

Qxy_Divisor = (Px*Py).^0.5;

Qxy = Pxy./Qxy_Divisor;
s = svd(Qxy);
RhoMax = s(2);

% Qxy = zeros(Px_N, Py_N);
% for i=1:Px_N
%     for j=1:Py_N
%         Qxy(i,j) = sqrt(Px(i)*Py(j));
%     end
% end




end

