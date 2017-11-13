%% Full implementation
close all;
clear all;

names = ["listera","salmonella"];

params = [-1.5 + 273, 44 + 273, 33.5 + 273, 0.22;...
    6 + 273, 46 + 273, 37 + 273, 0.37];

curve = [0.02,0.02,0.06,0.11,0.13,0.22;...
    0.06,0.05,0.12,0.16,0.31,0.37];
temps = [7,10,15,20,25,30] + 273;

c0 = 1;
bcOrig = zeros(2,2);
bcCurv = zeros(2,2);

for i = 1:length(names)
    param = params(i,:);
    [b,c] = fitTemperature(param(1), param(2), param(3), param(4), c0);
    bcOrig(i,:) = [b,c];
    [b,c] = curveFitTemperature(temps,curve(i,:),param(1),param(2));
    bcCurv(i,:) = [b,c];
end

figure;
plot(temps,curve(1,:),'*');

bcOrig
figure;
fplot(@(temp)growthRate(temp,params(1,1),params(1,2),bcOrig(1,1),bcOrig(1,2)),[params(1,1),params(1,2)])
hold on
plot(params(1,3),params(1,4),'*');
hold off

bcCurv
figure;
fplot(@(temp)growthRate(temp,params(1,1),params(1,2),bcCurv(1,1),bcOrig(1,2)),[params(1,1),params(1,2)])
hold on
plot(params(1,3),params(1,4),'*')
hold off

error = norm(growthRate(temps,params(1,1),params(1,2),bcCurv(1,1),bcOrig(1,2)) - growthRate(temps,params(1,1),params(1,2),bcOrig(1,1),bcOrig(1,2)))

figure;
plot(temps,curve(1,:),'r*');
hold on
fplot(@(temp)growthRate(temp,params(1,1),params(1,2),bcOrig(1,1),bcOrig(1,2)),[params(1,1),params(1,2)],'k')
fplot(@(temp)growthRate(temp,params(1,1),params(1,2),bcCurv(1,1),bcOrig(1,2)),[params(1,1),params(1,2)],'g')
plot(params(1,3),params(1,4),'b^');

