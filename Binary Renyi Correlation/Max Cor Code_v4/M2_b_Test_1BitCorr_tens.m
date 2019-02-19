function [RhoMax_1bit,RhoMax_2S_1bit, Tensorizing_1b_corrs_Delta, RhoMax, RhoMax_CLT] = M2_b_Test_1BitCorr_tens(Pxy,Acceptable_TH_ratio)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


disp('Pxy:'); disp(Pxy);

%% 2. (ToDo) Sanity: Max cor (calculate for general alphabet on both x,y)

%% 3. 1-Sample, 1-Bit corr:
[RhoMax_1bit,Fx_1bit,Gy_1bit] = M3_a_OneBit_maxCor(Pxy);
%ToDo: check against maxcorr (calculate general)

%% 4. 2-Sample, 1-Bit corr:
Px1x2y1y2 = kron(Pxy,Pxy);
disp('Px1x2y1y2:'); disp(Px1x2y1y2);
[RhoMax_2S_1bit,Fx_2S_1bit,Gy_2S_1bit] = M3_a_OneBit_maxCor(Px1x2y1y2);

%% 5. Row_max (any sample)
RhoMax = M3_b_MaxCor(Pxy);

%% 6. CLT RhoMax(gaussian maxcorr comparison)
RhoMax_CLT = (2/pi)*asin(RhoMax);

%% Summary:
disp(['(i*) RhoMax = ' num2str(RhoMax)]);

disp(['(i) RhoMax-1Sample-1bit = ' num2str(RhoMax_1bit)]);
disp(['          * F(x) = ['  num2str(Fx_1bit)  ']']);
disp(['          * G(y) = ['  num2str(Gy_1bit)  ']']);

disp(['(ii) RhoMax-2Samples-1bit = '  num2str(RhoMax_2S_1bit)]);
disp(['          * F(x1,x2) = ['  num2str(Fx_2S_1bit)  ']']);
disp(['          * G(y1,y2) = ['  num2str(Gy_2S_1bit)  ']']);

Tensorizing_1b_corrs_ratio = abs(RhoMax_2S_1bit/RhoMax_1bit-1);
Tensorizing_1b_corrs_Delta = (RhoMax_2S_1bit - RhoMax_1bit);
if ((Tensorizing_1b_corrs_Delta) > Acceptable_TH_ratio)
    disp('                                          ****************************************************************');
    disp(['                                          NOTE: delta(2s_1b_cor,1s_1b_cor) = '  num2str(Tensorizing_1b_corrs_Delta)]);
    disp(['                                                |2s_1b_cor/1s_1b_cor - 1| = '  num2str(Tensorizing_1b_corrs_ratio)]);
    disp('                                          ****************************************************************');
    keyboard;
end


disp(['(i**) CLT (Gaussian) RhoMax = ' num2str(RhoMax_CLT)]);
disp(['(i***)       /\(RowG-Row1bit = ' num2str(RhoMax_CLT - RhoMax_1bit)]);
if (RhoMax_CLT - RhoMax_1bit > Acceptable_TH_ratio)
    disp('                                          &&& NOTE: CLT improves 1-bit &&&');
    keyboard;
end

%disp(Tensorizing_1b_corrs_Delta);
disp('.');




end

