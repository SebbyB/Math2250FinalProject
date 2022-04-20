clc
clear 


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

plot(x,y)
hold on

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

plot(x,y)
