clear; clc;
mu = 0;
sigma = 1;

N = 1000; % numeric length

IT = 1000;
ratios = 1000*ones(1,IT-1);
row = (1:IT-1)/IT;

for i = 1:(IT-1)
    M = mu + sigma*randn(N,2);
    %R = [1 0.75; 0.75 1];
    R = [1 row(i); row(i) 1];
    L = chol(R);
    M = M*L;
    x = M(:,1);
    y = M(:,2);
    %corr(x,y)

    corr_gauss = corr(x,y);
    corr_sign_formu = (2/pi)*asin(corr_gauss);
    
    x1b = sign(x);
    y1b = sign(y);

    corr_sign = corr(x1b,y1b);
    
    ratios(i) = corr_sign_formu/corr_sign;
end

clear; clc;
mu = 0;
sigma = 1;

N = 10000; % numeric length

rho = 0.75;
M = mu + sigma*randn(N,2);
R = [1 rho; rho 1];
L = chol(R);
M = M*L;
x = M(:,1);
y = M(:,2);
%corr(x,y)

corr_gauss = corr(x,y);
corr_sign_formu = (2/pi)*asin(corr_gauss);

x1b = sign(x);
y1b = sign(y);

corr_sign = corr(x1b,y1b);



    
    