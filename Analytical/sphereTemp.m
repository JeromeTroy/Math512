function [ t,r,u ] = sphereTemp( u0, uAmb, nList, a, tmax )
%SPHERETEMP
% Calculates the temperature at any point in a sphere
% Input:
%   u0      initial temperature     1 x 1
%   uAmb    ambient temperature     1 x 1
%   nList   list of n's to plug into u      k x 1
%   a       radius of sphere        1 x 1
% Output:
%   u       temperature             function handle

An = calcCoef(u0,nList,a);

r = linspace(0,a,length(nList));

t = linspace(0,tmax,length(nList));

expComp = exp(-pi^2*nList.^2/a^2 .*t);

radialComp = sin(pi*nList.*r/a)./r;

vals = radialComp.*expComp;


plot(vals)
u = An*vals';


end

