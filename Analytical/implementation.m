%% Implementation no angular dependence
clc
close all;

nList = -100:100;
u0 = 1;
a = 1;

An = calcCoef(u0,nList,a);

[t,r,u] = sphereTemp(u0,0,nList,a,100);

u