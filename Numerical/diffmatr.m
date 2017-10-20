function [ r Dr Drr ] = diffmatr( n, rspan )
% DIFFMATR
% Differentiation matrix calculator for radial direction, r
% Input:
%   n       (scalar)        number of points
%   rspan   (2 x 1)         span of r - rmin, rmax
% Output:
%   r       (n x 1)         Equally spaced points w/in rspan
%   Dr      (n x n)         Differentiation matrix approximating d/dr
%   Drr     (n x n)         " " approximating d^2/dr^2

rmin = rspan(1);
rmax = rspan(2);

h = (rmax - rmin) / (n-1);      % spacing

r = rmin + (0:n-1)'*h;            % nodes

% Define Dr by its diagonals
dp = 0.5 * ones(n-1, 1) / h;        % superdiagonal
dm = -0.5 * ones(n-1, 1) / h;       % subdiagonal
Dr = diag(dm,-1) + diag(dp,1);      % majority of Dr

% fix first/last rows
Dr(1, 1:3) = [-1.5, 2, -0.5] / h;
Dr(n, n-2:n) = [0.5, -2, 1.5] / h;

% Define Drr by its diagonals
d0 = -2 * ones(n, 1) / h^2;         % main diagonal
dp = ones(n-1, 1) / h^2;            % sub/super diagonals
Drr = diag(dp,-1) + diag(d0) + diag(dp,1);      % majority of Drr

% fix first/last rows
Drr(1, 1:4) = [2, -5, 4, -1] / h^2; 
Drr(n, n-3:n) = [-1, 4, -5, 2] / h^2;



end

