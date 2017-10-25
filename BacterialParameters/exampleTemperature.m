function [ temp ] = exampleTemperature( t,r,rmax )
%EXAMPLETEMPERATURE
% placeholder function until we get the actual temperature dependence
% Input:
%   t       time
%   r       radius
%   rmax    max radius
% Output:
%   temp    temperature

temp = 50 - 60 * exp(-t) + 273;


end

