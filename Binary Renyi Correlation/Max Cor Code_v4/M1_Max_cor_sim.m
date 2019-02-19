clear; clc;

%% 0. Setup

% Alphabet Sizes
Px_N = 3;
Py_N = 3;

Acceptable_TH_ratio = 10^-10;

ITERATIONS = 10000;


Best_Delta = Acceptable_TH_ratio/2;

% Pxy = [0.028621791654522   0.080567692224918   0.040678522780889; 0.151498999733760   0.272726413788115   0.058395791486723; 0.123033334944744   0.242538423759999   0.001939029626329];
% Pxy = Pxy./(sum(sum(Pxy)));

for I=1:ITERATIONS

disp(['----------------------' num2str(I) '----------------------']);
Pch = rand(1,3);
Pch = Pch./sum(Pch);
disp(['Pch = ' num2str(Pch)]);


%% (*). Random Pxy:
Pxy = rand(Px_N,Py_N);
Pxy = Pxy./(sum(sum(Pxy)));

%% (*). Dist. Around non-tensorizing reference:
% P_CE = [0.0262 0.0812 0.0403 ; 0.1514 0.2771 0.0550; 0.1225 0.2453 0.0009];
% Pxy = rand(Px_N,Py_N).*0.005 + P_CE.*0.9;
% Pxy = Pxy./(sum(sum(Pxy)));


%% (b) Check for tensorization (1 vs 2 samples):
[RhoMax_1bit,RhoMax_2S_1bit, Tensorizing_1b_corrs_Delta, RhoMax, RhoMax_CLT] = M2_b_Test_1BitCorr_tens(Pxy, Acceptable_TH_ratio);


end %for I=1:ITERATIONS



%% SVD:
% Px1x2y1y2 = kron(Pxy,Pxy); [U,D,V]=svd(Px1x2y1y2)
% [U,D,V]=svd(Pxy)





