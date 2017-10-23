function [ b,c ] = fitTemperature( tmin, tmax, tmea, mu, c0 )
%FITTEMPERATURE
% Fits the temperature profile: sqrt(mu) = b(T-T_min) (1-exp(c(T - T_max)))
% to the data given
% Input:
%   tmin        1 x 1       minimum temperature
%   tmax        1 x 1       maximum temperature
%   temps       n x 1       temperature measurements
%   mus         n x 1       growth rate measurements
%   x0          2 x 1       initial guess for b and c respectively
% Output:
%   b, c        scalar      fitting parameter


f2 = @(c,t) 1/(t - tmin) - c*exp(c*(t-tmax))/(1 - exp(c*(t-tmax)));
c = fzero(@(c) f2(c,tmea),c0);

b = sqrt(mu)/((tmea - tmin)*(1-exp(c*(tmea-tmax))));

end

