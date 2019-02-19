function [Pxy_2x2] = M4_a_Quantize_Pxy(Pxy,Fx, Gy)
% Describe...
% usage: A = [1 2 3 ; 4 5 6 ; 7 8 9]; Fx = [0 1 1]; Gy = [0 1 0]; Quantize_Pxy(A,Fx,Gy)

Fx_mat = [Fx ; ~Fx];
Gy_mat = [Gy ; ~Gy];

Pxy_2x2 = Fx_mat*Pxy*Gy_mat';

end



% Bruteish:
% A = Pxy;
% 
% % Quantize x
% A1 = A(Fx==0,:);
% A2 = A(Fx==1,:);
% A = [sum(A1,1); sum(A2,1)];
% 
% % Quantize y (Order doesn't matter)
% A1=A(:,Gy==0);
% A2=A(:,Gy==1);
% A=[sum(A1,2) sum(A2,2)];
% 
% Pxy_2x2 = A;
% 
% end





