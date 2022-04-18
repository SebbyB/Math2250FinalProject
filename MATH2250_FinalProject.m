clc
clear 
format long
x_1850i = [11e2, 2.1e3, 7e2, 3.8e4, 4.8e7];

A = [-210.15/600 ,2/35, 9/70, 0, .15/4.8e7; ...
    1/5, -2/35, 0, 0, 0; ...
    90.5/600, 0, -95.3/700, 5/38000, .15/4.8e7;...
    0, 0, 5.3/700, -5.3/38000, 0;...
    0, 0, 0, .3/38000, -.3/4.8e7];

[V,D] = eig(A);

t = 0;
a = V\x_1850i';
f = @(t) a.*exp(diag(D)*t);
x = @(t) V*f(t);
t = linspace(0,10);

X = x(t);
% plot(t,X(1:3,:))
hold on
plot(2.2222,851.056,'r*')
plot(t,X(1,:),'r')
plot(t,X(2,:),'g')
plot(t,X(3,:),'b')
title('Emissions over Time with immediate drop to zero')
ylabel('Carbon Emissions (GigaTonnes)')
xlabel('Time (Years)')
Labels = ["Atmosphric Halflife" "Atmosphere" "BioSphere" "Surface Ocean"]
legend(Labels);