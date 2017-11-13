function [b,c] = curveFitTemperature(xdata,ydata,tmin,tmax)
%CURVEFITTEMPERATURE
% Curve fitting the temperature
% Input:
%   xdata       vector (temperature)
%   ydata       vector (growth rates)
% Output:
% b, c          scalars (fitting parameters)
% Fit function:
%   r = b^2 (T - Tmin)^2 * (1-exp(c*(T-Tmax)))^2


% x = [b,c]

func = @(x,xdata) growthRate(xdata,tmin,tmax,x(1),x(2));

x = lsqcurvefit(func,[0,1],xdata,ydata);

b = x(1);
c = x(2);

end

