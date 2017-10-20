function [ p ] = polyinterp( t,y )
%POLYINTERP 
% Global polynomial interpolant using barycentric formulas
% Input:
%   t       interpolation nodes     n x 1
%   y       interpolation values    n x 1
% Output:
%   p   function that evaluates the interpolant     function

t = t(:);       % columnate
n = length(t);

% barycentric weights
C = (t(end) - t(1)) / 4;        % scaling factor for stability
tc = t/C;                       % scaled times

% compute the inverse of the weights
w = ones(n,1);
for m = 1:n-1
    d = (tc(1:m) - tc(m+1));        % vector of node differences
    w(1:m) = w(1:m) .* d;           % update previous weights
    w(m+1) = prod(-d);              % compute the new one
end
w = 1./w;                           % inverses to weights

p = @evaluate

    function f = evaluate(x)
        % Compute interpolant, one value of x at at time
        f = zeros(size(x));
        for j = 1:numel(x)
            terms = w ./ (x(j) - t);
            f(j) = sum(y.*terms) / sum(terms);
        end
        
        % apply L'Hopital's Rule exactly
        for j = find(isnan(f(:)))       % divided by zero
            [~,idx] = min(abs(x(j) - t));   % node closest to x(j)
            f(j) = y(idx);                  % value at node
        end
    end
end

