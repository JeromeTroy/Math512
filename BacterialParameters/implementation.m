%% implementation
clear all;
close all;
clc;

tempMin = -1.5+273;
tempMax = 44+273;
tempOpt = 33.5+273;
mu = 0.22;


[b,c] = fitTemperature(tempMin,tempMax,tempOpt,mu,1);

f = @(temp) growthRate(temp,tempMin,tempMax,b,c);

fplot(f,[tempMin,tempMax])

temperature = @(t) 50 - 60 * exp(-t) + 273;

exampleRate = @(t) f(temperature(t));

figure;
fplot(temperature,[0,10])
figure;
fplot(exampleRate,[0,3])

dxdt = @(t,x) 4*exampleRate(t) .* x .* (1-x);

[t,x] = ode15s(dxdt,[0,10],0.01);

figure;
plot(t,x)

%% Full implementation

% file name to be changed
dataframe = bacterialReader('BacterialParameterDataExample.xlsx');

% species names to be changed
species = ['species1','species2','species3'];

for s = 1:length(species)
    name = species(s);                  % name
    infecDose = dataframe(s,2);         % get infectious dose
    saturPop = dataframe(s,3);          % saturation population
    tempOpt = dataframe(s,4);           % optimal temperature
    muOpt = dataframe(s,5);             % mu at optimal temperature
    lambda = dataframe(s,6);            % lag time
    tempMin = dataframe(s,7);           % minimum viable temperature
    tempMax = dataframe(s,8);           % maximum viable temperature
    
    initPop = 1;                        % initial population
    tmax = 100;                         % maximum time
    
    maxRadius = 1;                      % radius of spherical food
    r = maxRadius;                      % placeholder for actual radii locations
    
    % calculate b and c for the growth rate
    [b,c] = fitTemperature(tempMin,tempMax,tempOpt,muOpt,1);
    
    temperatureParameters = [tempMin,tempMax,b,c];
    
    % once temperature and stuff is implemented, change functions
    % in this file to match
    detadt = @(t,eta) bacterialGrowth(t,eta,saturPop,r,maxRadius,temperatureParameters);
    
    [times,etas] = ode15s(detadt,[0,tmax],initPop);
    
    figure;
    plot(times,etas);
    xlabel('t (hr)'); ylabel('\eta, (CFU)');
    title(name + ' population in food');
    
end

