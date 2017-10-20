function [ R, T, u ] = sphereHeat( n, rad, Tinit, Tamb, tmax )
% SPHEREHEAT 
% Solves the heat equation in a sphere under angular symmetry
% solves the PDE 1/r^2 * Dr (r^2 * Dr) u = du/dt
% Input:
%   n       (scalar)        number of radius points
%   rad     (scalar)        radius
%   Tinit   (scalar)        initial temperature (K)
%   Tamb    (scalar)        ambient temperature (K)
% Output:
%   t       (vector)        times
%   u       (matrix)        temperatures at each time

[r, Dr, Drr] = diffmatr(n, [0,rad]);

Rd = diag(r.^-2);     % r^-2
Rd(1,1) = 0;            % fix first element
Ru = diag(r.^2);      % r^2

A = Rd * (Dr*Ru*Dr + Ru*Drr);    % solve Ax = dudt
A(1,:) = 3/(r(2)-r(1))* Dr(1,:);

tmin = 0;

u0 = Tinit*ones(size(r))';   % initial condition
u0(n) = Tamb;               % satisfy b/c
[t,u] = ode15s(@(t,u)deriv(t,u, n, Tamb, A), [tmin,tmax], u0);
u(:,end) = Tamb;


% time increments by rows (m), radius increments by columns (n)
T = zeros(size(u));
for i = 1:n
    T(:,i) = t;
end

R = zeros(size(u));
for i = 1:length(t)
    R(i,:) = r;
end

surf(R,T,u);
xlabel('r'); ylabel('t'); zlabel('temp')

    function [dudt] = deriv(t,u, n, Tamb, A)
        % DERIV
        % subfunction to take derivative of u wrt t
        % Au = dudt
        % input:
        %   t       vector: time
        %   u       vector: temperature (K)
        % output:
        %   dudt    vector: du/dt
        
        ucurr = u(:,end);
        ucurr(n) = Tamb;
        dudt = A*ucurr;
    end

end

