function [ detadt ] = bacterialGrowth( t, eta, maxEta, r, rmax, tempParams )
% BACTERIAGROWTH
% Calculates d eta/dt based on input
% Input:
%   t           time 
%   eta         current population
%   maxEta      maximum population
%   r           radii
%   rmax        maximum radius
%   tempParams  list:   [tempMin, tempMax, b, c]
% Output:
%   detadt      derivative

tempMin = tempParams(1);
tempMax = tempParams(2);
b = tempParams(3); c = tempParams(4);

rate = 4*growthRate(exampleTemperature(t,r,rmax),tempMin,tempMax,b,c);

detadt = rate/maxEta * eta .* (1 - eta/maxEta);

end

