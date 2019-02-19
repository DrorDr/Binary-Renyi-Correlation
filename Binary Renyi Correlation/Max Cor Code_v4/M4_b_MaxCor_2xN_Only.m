function [Row_Max] = M4_b_MaxCor_2xN_Only(Pxy)
% Max cor, Simple case
% **Only if at least one of X or Y is Binary valued!**

% Alphabet sizes:
Px_N = size(Pxy,1);
Py_N = size(Pxy,2);
if (min(Px_N,Py_N)>2)
    error('both alphabets > 2, you can''t use this');
end

% Marginals:
Py = sum(Pxy,1);
Px = sum(Pxy,2);

sum_result = 0;
for x = 1:Px_N
    for y = 1:Py_N
        if (Pxy(x,y) > 0)
            sum_result = sum_result + ( (Pxy(x,y)^2) / (Px(x)*Py(y)) );
        end
    end
end
%Pxy
Row_max_Squared = sum_result - 1; % minus largest eigenvalue

Row_Max = sqrt(Row_max_Squared);

end

