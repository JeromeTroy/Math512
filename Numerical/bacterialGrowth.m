function [ time, eta ] = bacterialGrowth( rate, times, radii, x0, tspan )
% BACTERIAGROWTH
% Calculates Bacterial growth
% Input:
%   rate 
%   x0
%   tspan
% Output:
%   eta


eta = zeros(size(times));
eta(1,:) = x0;

for i = 2:length(eta(:,1))
    eta(i,:) = eta(i-1,:) + (times(i,:) - times(i-1,:)) .* rate(i-1,:) .* eta(i-1,:) .* (1-eta(i-1,:));
end

figure;
surf(radii, times, eta);
xlabel('r');ylabel('t');zlabel('eta')
title('Bacterial Population');

end

