function [ rate ] = growthRate( temp, tempMin, tempMax, b, c )
% GROWTHRATE
% Calculates the growth rate based on the temperature
% Input:
%   temp    (matrix)        all temperatures
%   tempMin (scalar)        minimum temperature parameter
%   tempMax (scalar)        maximum temperature parameter
%   b       (scalar)        fitting parameter
%   c       (scalar)        fitting parameter
% Output:
%   rate                    growth rate of bacteria
% TODO: implement deaths of bacteria

    
% rate eq
rateEq = b^2*(temp - tempMin).^2 .* (1- exp(c*(temp - tempMax))).^2; 

% rate only valid for   tempMin < temp < tempMax
rate = rateEq .* (temp > tempMin) .* (temp < tempMax);

end

