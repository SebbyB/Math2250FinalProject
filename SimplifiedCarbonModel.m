clc
clear
format long
x_1850i = [600 2100 700]
B = [-210.15/600 , 13/70, 0; ...
    1/5, -120/2100, 0; ...
    90/600 , 0, -95.3/700]

[V,D] = eig(B);

t = 0;
a = V\x_1850i';
f = @(t) a.*exp(diag(D)*t);
x = @(t) V*f(t);
t = linspace(0,50);

X = x(t);
% plot(t,X(1:3,:))
hold on
% plot(2.2222,851.056,'r*')
plot(t,X(1,:),'r')
plot(t,X(2,:),'g')
plot(t,X(3,:),'b')
title('Emissions over Time with immediate drop to zero - Simplified')
ylabel('Carbon Emissions (GigaTonnes)')
xlabel('Time (Years)')
Labels = ["Atmosphere" "BioSphere" "Surface Ocean"]
legend(Labels, location = "Northwest" );