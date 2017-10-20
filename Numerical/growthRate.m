function [ rate ] = growthRate( temp, tempMin, tempMax, b, c, radii, times )
% GROWTHRATE
% Calculates the growth rate based on the temperature
% Input:
%   temp    (matrix)        all temperatures
%   tempMin (scalar)        minimum temperature parameter
%   tempMax (scalar)        maximum temperature parameter
%   b       (scalar)        fitting parameter
%   c       (scalar)        fitting parameter
%   radii   (matrix)        radii for plotting
%   times   (matrix         times for plotting

sqrtRate = b*(temp - tempMin) .* (1- exp(c*(temp - tempMax))); % rate eq
rate = sqrtRate.^2;             % square to get rate

% rate only valid for   tempMin < temp < tempMax
rate = rate .* (temp > tempMin) .* (temp < tempMax);   

% plot
figure;
surf(radii,times,rate);
xlabel('r');ylabel('t');zlabel('rate');
title('growth rates')


end

