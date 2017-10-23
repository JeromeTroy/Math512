%% implementation
clear all;
close all;
clc;

tmin = 5+273;
tmax = 50+273;
tmea = 36+273;
mu = 0.04;


[b,c] = fitTemperature(tmin,tmax,tmea,mu,1)

f = @(t) b^2*(t-tmin).^2 .* (1 - exp(c*(t-tmax))).^2;

fplot(f,[tmin,tmax])
