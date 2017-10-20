function [ I,x ] = ccquad( f, n, a, b)
%CCQUAD
% Clenshaw - Curtis integration over [-1,1]
% Input:
%   f       integrand       function
%   n       number of nodes     1 x 1
%   a       lower bound         1 x 1
%   b       upper bound         1 x 1
% Output:
%   I       estimate of integral: int(f, -1..1)
%   x       evaluation nodes of f       n x 1

% fix number of nodes
if mod(n,2) == 1        % n odd
    n = n-1;
end

% Chebyshev nodes
theta = pi*(0:n)'/n;
z = -cos(theta);
x = (b-a)/2*z + (a+b)/2;


% compute weights
c = zeros(1,n+1);
c([1,n+1]) = 1/(n^2-1);
theta = theta(2:n);
v = ones(n-1,1);
for k = 1:n/2-1
    v = v - 2*cos(2*k*theta)/(4*k^2-1);
end
v = v - cos(n*theta)/(n^2-1);
c(2:n) = v/n;

% evaluate
I = c*f(x);         % vector inner product


end

