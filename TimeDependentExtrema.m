clc
clear 

format long

TimeN = linspace(1850,2450);
xN = TimeN;
curveN = 25;
center = 2150;
stdN = 98;

GaussNor = curveN*exp(-(xN - center).^2/(2*stdN.^2));

TimeM = linspace(1850,2250);
xM = TimeM;
curveM = 12;
center = 2050;
stdM = 57;

GaussMit = curveM*exp(-(xM - center).^2/(2*stdM.^2));

figure(1)
plot(TimeN, GaussNor,'b')
hold on
plot(TimeM, GaussMit,'r')
xlabel("Time (years)");
ylabel("Atmosphere Emmission Rate (Gt/year)");
title("Emmision Rates over time")
legend("Bussiness as Usual","Mitigation Plan")
hold off
h = .1;  % step size
x = (1850:h:2250);  % the range of x
y = zeros(size(x));  % allocate the result y
y(1) = 0;  % the initial y value
n = numel(y);  % the number of y values

for i=1:n-1
    xM = x(i);
curveM = 12;
center = 2050;
stdM = 57;

GaussMitigation = curveM*exp(-(xM - center).^2/(2*stdM.^2));

    f = GaussMitigation;
    y(i+1) = y(i) + h * f;
end

figure(2)
plot(x,y,'r')
hold on
xlabel("Time (years)");
ylabel("Carbon in Atmosphere (Gt)");
title("Max Amount of Carbon in atmosphere for No change and Mitigation Plan")
MaxMitigation = max(y);
plot(2250, MaxMitigation,'r*')

h = .1;  % step size
x = (1850:h:2450);  % the range of x
y = zeros(size(x));  % allocate the result y
y(1) = 0;  % the initial y value
n = numel(y);  % the number of y values
% The loop to solve the DE
for i=1:n-1
    xN = x(i);
curveN = 25;
center = 2150;
stdN = 98;

GaussNormal = curveN*exp(-(xN - center).^2/(2*stdN.^2));

    f = GaussNormal;
    y(i+1) = y(i) + h * f;
end

plot(x,y,'b')
MaxNormal = max(y);
plot(2450, MaxNormal,'b*')
legend("Carbon In Atmo For Mitigation Plan","Max carbon For mitigation (1713.76 Gt)","Carbon In Atmo if Nothing is done","Max carbon For Nothing (6127.7 Gt)",'Location','northwest');