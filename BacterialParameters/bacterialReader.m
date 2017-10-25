function [dataFrame] = readParameters( fileName )
%READPARAMETERS
% Reads in bacterial parameteres from a file
% Input:
%   file name       string      name of the file
% Output:
%   dataFrame       matrix      all the data


data = xlsread('BacterialParameterDataExample.xlsx');;
dataFrame = data;


end
