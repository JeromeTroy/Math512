%% Implementation
close all; clear all;
clc;

numNodes = 100;     % number of radius nodes
rmax = 10;          % sphere radius
tempInit = 265;     % initial temperature (K)
tempAmb = 350;      % ambient temperature (K)
timeMax = 15;      % maximum time

[radii, time, temps] = sphereHeat(numNodes, rmax, tempInit, tempAmb, timeMax);


tempMin = 280;      % minimum growth temperature
tempMax = 320;      % maximum growth temperature
b = 4/(295-tempMin)^2;       % b fitting parameter
c = 0.5;              % c fitting parameter

[rates] = growthRate(temps, tempMin, tempMax, b, c, radii, time);




