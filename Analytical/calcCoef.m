function [ An ] = calcCoef( u0, n, a )
%CALCCOEF
% Calculates fourier coefficients for the heat equation
% Input:
%   u0      initial condition           function
%   n       list of n's requested       n x 1
%   a       radius of the sphere        1 x 1
% Output:
%   An      coefficients                n x 1

f = @(r,n) u0*r.*sin(pi*n/a*r);

An = zeros(size(n));

for i = 1:length(n)
    An(i) = 2/a*ccquad(@(r)f(r,n(i)),100,0,a);
end


end

