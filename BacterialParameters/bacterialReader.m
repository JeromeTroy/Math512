function [dataFrame] = readParameters( fileName )
%READPARAMETERS
% Reads in bacterial parameteres from a file
% Input:
%   file name       string      name of the file
% Output:
%   dataFrame       matrix      all the data


data = xlsread('BacterialParameterDataExample.xlsx');;
dataFrame = data;

infectiousDoses = data(:,1);
saturations = data(:,2);
measuredTemps = data(:,3);
measuredMus = data(:,4);
measuredLambda = data(:,5);
minimumTemps = data(:,6);
maximumTemps = data(:,7);

% these may be useful later
multiplicationTimes = data(:,8);
infectiousTimes = data(:,9);
