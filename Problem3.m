clc
clear 

TimeN = linspace(1850,2450);
xN = TimeN;
curveN = 25;
center = 2150;
stdN = 98;

GaussNormal = curveN*exp(-(xN - center).^2/(2*stdN.^2));

TimeM = linspace(1850,2250);
xM = TimeM;
curveM = 12;
center = 2050;
stdM = 57;

GaussMitigation = curveM*exp(-(xM - center).^2/(2*stdM.^2));

plot(TimeN, GaussNormal)
hold on
plot(TimeM, GaussMitigation)