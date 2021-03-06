clear all
cd '/Volumes/TOSHIBA/Env'

addpath(genpath('./release2.17'))
ntrain = 500;
ntest = 500;
nsim = 100;
model =3; dimx = 4:1:10; dimy = 1:1:5;evals = 10./(1:60).^.5;


[FLR ,ENV, Oracle]=simfun(model,dimx,dimy,evals,ntrain,ntest,nsim);




FLRmean = mean(FLR(2:nsim+1,:), 1);
csvwrite('M3Eig2FLRmean.csv',reshape(FLRmean,[5,7]))
FLRstd = std(FLR(2:nsim+1,:), 1)./sqrt(nsim);
csvwrite('M3Eig2FLRstd.csv',reshape(FLRstd,[5,7]))



ENVmean = mean(ENV(2:nsim+1,:), 1);
csvwrite('M3Eig2ENVmean.csv',reshape(ENVmean,[5,7]))
ENVstd = std(ENV(2:nsim+1,:), 1)./sqrt(nsim);
csvwrite('M3Eig2ENVstd.csv',reshape(ENVstd,[5,7]))


Oracleout= vertcat(mean(Oracle(2:nsim+1)), std(Oracle(2:nsim+1))./sqrt(nsim));
csvwrite('M3Eig2Oracle.csv',Oracleout)