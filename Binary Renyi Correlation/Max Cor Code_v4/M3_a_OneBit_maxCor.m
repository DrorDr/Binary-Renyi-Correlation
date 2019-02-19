function [RowMax_1bit,Fx_1bit,Gy_1bit] = M3_a_OneBit_maxCor(Pxy)
% By Bruteforce mapping over F,G books

Px_N = size(Pxy,1);
Py_N = size(Pxy,2);

F_End = (2^Px_N-1) - 1; % (FF..F maps everything to x2)
Fx_Book = de2bi(1:F_End); % Compatible with F,G in matrix form; Starting from 1 as 0 maps everything to x0 (y0)

G_End = (2^Py_N-1) - 1; % (FF..F maps everything to y2)
Gy_Book = de2bi(1:G_End); % Compatible with F,G in matrix form; Starting from 1 as 0 maps everything to x0 (y0)


RowMax_1bit = 0; %init
for i=1:F_End
    Fx_i = Fx_Book(i,:);
    for j=1:G_End
        %disp(num2str(i) + ", " + num2str(j) + ":");
        Gy_j = Gy_Book(j,:);
        Pxy_2x2 = M4_a_Quantize_Pxy(Pxy,Fx_i,Gy_j);
        OneBit_Cor = M4_b_MaxCor_2xN_Only(Pxy_2x2);
        if (OneBit_Cor > RowMax_1bit)
            %disp("**Up**");
            RowMax_1bit = OneBit_Cor;
            Fx_1bit = Fx_i;
            Gy_1bit = Gy_j;
        end
        %pause;
    end

end

