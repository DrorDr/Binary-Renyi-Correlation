%clear; clc;

% Alphabet Sizes
Px_N = 5;
Py_N = 5;

IT = 300;

V1_RhoMax = -100*ones(1,IT);
V2_RhoMax_1bit = -100*ones(1,IT);
V3_Rho_BinaryCLT = -100*ones(1,IT);


S_CLT = [1.0000; 0.3201; 0.1850; 0.0363; 0.0018];

V4_S = [];

for i = 1:IT
    disp(['----------' num2str(i) '----------']);
    Pxy = rand(Px_N,Py_N);
    Pxy = Pxy./(sum(sum(Pxy)));
    [RhoMax,Qxy,s] = M3_b_MaxCor(Pxy);
    %[RhoMax] = M3_b_MaxCor(Pxy);
    [RhoMax_1bit,Fx_1bit,Gy_1bit] = M3_a_OneBit_maxCor(Pxy);
    Rho_BinaryCLT = (2/pi)*asin(RhoMax);
    
    
    
     disp(['(i) RhoMax = ' num2str(RhoMax)]);
     disp(['(ii) RhoMax_1bit = ' num2str(RhoMax_1bit)]);
     disp(['(iii) Rho_BinaryCLT = ' num2str(Rho_BinaryCLT)]);
     disp('---------------------------');
    
    V1_RhoMax(i) = RhoMax;
    V2_RhoMax_1bit(i) = RhoMax_1bit;
    V3_Rho_BinaryCLT(i) = Rho_BinaryCLT;
    V4_S = [V4_S s];
    
    if (Rho_BinaryCLT > RhoMax_1bit)
        disp('<<<<<!!');
        keyboard;
    end
end
hold on;
plot(V1_RhoMax,'black')
plot(V2_RhoMax_1bit,'green')
plot(V3_Rho_BinaryCLT,'--')


%stem(V4_S')
%figure; hist(V2_RhoMax_1bit-V3_Rho_BinaryCLT);
